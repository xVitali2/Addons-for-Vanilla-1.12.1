
--[[ TrinketMenu 3.42 ]]--
TrinketMenu = {}

function TrinketMenu.LoadDefaults()

	TrinketMenuOptions = TrinketMenuOptions or {
		IconPos = -100,				-- angle of initial minimap icon position
		ShowIcon = "ON",			-- whether to show the minimap button
		SquareMinimap = "OFF",		-- whether the minimap is square instead of circular
		CooldownCount = "OFF",		-- whether to display numerical cooldown counters
		LargeCooldown = "ON",		-- whether cooldown numbers are large or small
		TooltipFollow = "OFF",		-- whether tooltips follow the mouse
		KeepOpen = "OFF",			-- whether menu hides after use
		KeepDocked = "ON",			-- whether to keep menu docked at all times
		Notify = "OFF",				-- whether a message appears when a trinket is ready
		DisableToggle="OFF",		-- whether minimap button toggles trinkets
		NotifyUsedOnly="OFF",		-- whether notify happens only on trinkets used
		NotifyChatAlso="OFF",		-- whether to send notify to chat also
		Locked = "OFF",				-- whether windows can be moved/scaled/rotated
		ShowTooltips = "ON",		-- whether to display tooltips at all
		NotifyThirty = "OFF",		-- whether to notify cooldowns at 30 seconds instead of 0
		MenuOnShift = "OFF",		-- whether menu requires Shift to display
		TinyTooltips = "OFF",		-- whether tooltips display only name and cooldown
		SetColumns = "OFF",			-- whether number of columns in menu is chosen automatically
		Columns = 4,				-- if SetColumns "ON", number of columns before menu wraps
		ShowHotKeys = "OFF",		-- whether hotkeys show on trinkets
		StopOnSwap = "OFF"			-- whether to stop auto queue on all manual swaps
	}

	TrinketMenuPerOptions = TrinketMenuPerOptions or {
		MainDock = "BOTTOMRIGHT",	-- corner of main window docked to
		MenuDock = "BOTTOMLEFT",	-- corner menu window is docked from
		MainOrient = "HORIZONTAL",	-- direction of main window
		MenuOrient = "VERTICAL",	-- direction of menu window
		XPos = 400,					-- left edge of main window
		YPos = 400,					-- top edge of main window
		MainScale = 1,				-- scaling of main window
		MenuScale = 1,				-- scaling of menu window
		Visible="ON",				-- whether to display the trinkets
		FirstUse = true,			-- whether this is the first time this user has used the mod
		ItemsUsed = {},				-- table of trinkets used and their cooldown status
	}
end

--[[ Misc Variables ]]--

TrinketMenu_Version = 3.42
BINDING_HEADER_TRINKETMENU = "TrinketMenu"

TrinketMenu.MaxTrinkets = 30 -- add more to TrinketMenu_MenuFrame if this changes
TrinketMenu.BaggedTrinkets = {} -- indexed by number, 1-30 of trinkets in the menu
TrinketMenu.NumberOfTrinkets = 0 -- number of trinkets in the menu
TrinketMenu.CombatQueue = {} -- [0] or [1] = name of trinket queued for slot 0 or 1
TrinketMenu.Corners = { "TOPLEFT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT" }
TrinketMenu.WatchItem = {} -- table of items being watched for cooldowns

--[[ Local functions ]]--

-- dock-dependant offset and directions: MainDock..MenuDock
-- x/yoff   = offset MenuFrame is positioned to MainFrame
-- x/ydir   = direction trinkets are added to menu
-- x/ystart = starting offset when building a menu, relativePoint MenuDock
TrinketMenu.DockStats = { ["TOPRIGHTTOPLEFT"] =		 { xoff=-4, yoff=0,  xdir=1,  ydir=-1, xstart=8,   ystart=-8 },
					 ["BOTTOMRIGHTBOTTOMLEFT"] = { xoff=-4, yoff=0,  xdir=1,  ydir=1,  xstart=8,   ystart=44 },
					 ["TOPLEFTTOPRIGHT"] =		 { xoff=4,  yoff=0,  xdir=-1, ydir=-1, xstart=-44, ystart=-8 },
					 ["BOTTOMLEFTBOTTOMRIGHT"] = { xoff=4,  yoff=0,  xdir=-1, ydir=1,  xstart=-44, ystart=44 },
					 ["TOPRIGHTBOTTOMRIGHT"] =   { xoff=0,  yoff=-4, xdir=-1, ydir=1,  xstart=-44,  ystart=44 },
					 ["BOTTOMRIGHTTOPRIGHT"] =   { xoff=0,  yoff=4,	 xdir=-1, ydir=-1, xstart=-44,  ystart=-8 },
					 ["TOPLEFTBOTTOMLEFT"] =	 { xoff=0,  yoff=-4, xdir=1,  ydir=1,  xstart=8,   ystart=44 },
					 ["BOTTOMLEFTTOPLEFT"] =	 { xoff=0,  yoff=4,  xdir=1,  ydir=-1, xstart=8,   ystart=-8 } }

-- returns offset and direction depending on current docking. ie: TrinketMenu.DockInfo("xoff")
function TrinketMenu.DockInfo(arg1)
	local anchor = TrinketMenuPerOptions.MainDock..TrinketMenuPerOptions.MenuDock
	if TrinketMenu.DockStats[anchor] and arg1 and TrinketMenu.DockStats[anchor][arg1] then
		return TrinketMenu.DockStats[anchor][arg1]
	else
		return 0
	end
end

-- hide the docking markers
function TrinketMenu.ClearDocking()
	for i=1,4 do
		getglobal("TrinketMenu_MainDock_"..TrinketMenu.Corners[i]):Hide()
		getglobal("TrinketMenu_MenuDock_"..TrinketMenu.Corners[i]):Hide()
	end
end

-- returns true if the two values are close to each other
function TrinketMenu.Near(arg1,arg2)
	return (math.max(arg1,arg2)-math.min(arg1,arg2))<15
end

-- moves the MenuFrame to the dock position against MainFrame
function TrinketMenu.DockWindows()
	TrinketMenu.ClearDocking()
	if TrinketMenuOptions.KeepDocked=="ON" then
		TrinketMenu_MenuFrame:ClearAllPoints()
		if TrinketMenuOptions.Locked=="OFF" then
			TrinketMenu_MenuFrame:SetPoint(TrinketMenuPerOptions.MenuDock,"TrinketMenu_MainFrame",TrinketMenuPerOptions.MainDock,TrinketMenu.DockInfo("xoff"),TrinketMenu.DockInfo("yoff"))
		else
			TrinketMenu_MenuFrame:SetPoint(TrinketMenuPerOptions.MenuDock,"TrinketMenu_MainFrame",TrinketMenuPerOptions.MainDock,TrinketMenu.DockInfo("xoff")*3,TrinketMenu.DockInfo("yoff")*3)
		end
	end
	if TrinketMenu_MenuFrame:IsVisible() then
		TrinketMenu.BuildMenu()
	end
end

-- displays windows vertically or horizontally
function TrinketMenu.OrientWindows()
	if TrinketMenuPerOptions.MainOrient=="HORIZONTAL" then
		TrinketMenu_MainFrame:SetWidth(92)
		TrinketMenu_MainFrame:SetHeight(52)
	else
		TrinketMenu_MainFrame:SetWidth(52)
		TrinketMenu_MainFrame:SetHeight(92)
	end
end

-- scan inventory and build MenuFrame
function TrinketMenu.BuildMenu()

	if not IsShiftKeyDown() and TrinketMenuOptions.MenuOnShift=="ON" then
		return
	end

	local idx,i,j,k,texture = 1
	local itemLink,itemID,itemName,equipSlot,itemTexture

	-- go through bags and gather trinkets into .BaggedTrinkets
	for i=0,4 do
		for j=1,GetContainerNumSlots(i) do
			itemLink = GetContainerItemLink(i,j)
			
			if itemLink then
				_,_,itemID,itemName = string.find(GetContainerItemLink(i,j) or "","item:(%d+).+%[(.+)%]")
				_,_,_,_,_,_,_,equipSlot,itemTexture = GetItemInfo(itemID or "")
				if equipSlot=="INVTYPE_TRINKET" then
					if not TrinketMenu.BaggedTrinkets[idx] then
						TrinketMenu.BaggedTrinkets[idx] = {}
					end
					TrinketMenu.BaggedTrinkets[idx].bag = i
					TrinketMenu.BaggedTrinkets[idx].slot = j
					TrinketMenu.BaggedTrinkets[idx].name = itemName
					TrinketMenu.BaggedTrinkets[idx].texture = itemTexture
					idx = idx + 1
				end
			end
		end
	end
	TrinketMenu.NumberOfTrinkets = math.min(idx-1,TrinketMenu.MaxTrinkets)

	if TrinketMenu.NumberOfTrinkets<1 then
		-- user has no bagged trinkets :(
		TrinketMenu_MenuFrame:Hide()
	else
		-- display trinkets outward from docking point
		local col,row,xpos,ypos = 0,0,TrinketMenu.DockInfo("xstart"),TrinketMenu.DockInfo("ystart")
		local max_cols = 1

		if TrinketMenu.NumberOfTrinkets>24 then
			max_cols = 5
		elseif TrinketMenu.NumberOfTrinkets>18 then
			max_cols = 4
		elseif TrinketMenu.NumberOfTrinkets>12 then
			max_cols = 3
		elseif TrinketMenu.NumberOfTrinkets>4 then
			max_cols = 2
		end
		if TrinketMenuOptions.SetColumns=="ON" and TrinketMenuOptions.Columns then
			max_cols = TrinketMenuOptions.Columns
		end

		for i=1,TrinketMenu.NumberOfTrinkets do
			local item = getglobal("TrinketMenu_Menu"..i)
			getglobal("TrinketMenu_Menu"..i.."Icon"):SetTexture(TrinketMenu.BaggedTrinkets[i].texture)
			item:SetPoint("TOPLEFT","TrinketMenu_MenuFrame",TrinketMenuPerOptions.MenuDock,xpos,ypos)

			if TrinketMenuPerOptions.MenuOrient=="VERTICAL" then
				xpos = xpos + TrinketMenu.DockInfo("xdir")*40
				col = col + 1
				if col==max_cols then
					xpos = TrinketMenu.DockInfo("xstart")
					col = 0
					ypos = ypos + TrinketMenu.DockInfo("ydir")*40
					row = row + 1
				end
				item:Show()
			else
				ypos = ypos + TrinketMenu.DockInfo("ydir")*40
				col = col + 1
				if col==max_cols then
					ypos = TrinketMenu.DockInfo("ystart")
					col = 0
					xpos = xpos + TrinketMenu.DockInfo("xdir")*40
					row = row + 1
				end
				item:Show()
			end
		end
		for i=(TrinketMenu.NumberOfTrinkets+1),TrinketMenu.MaxTrinkets do
			getglobal("TrinketMenu_Menu"..i):Hide()
		end
		if col==0 then
			row = row-1
		end

		if TrinketMenuPerOptions.MenuOrient=="VERTICAL" then
			TrinketMenu_MenuFrame:SetWidth(12+(max_cols*40))
			TrinketMenu_MenuFrame:SetHeight(12+((row+1)*40))
		else
			TrinketMenu_MenuFrame:SetWidth(12+((row+1)*40))
			TrinketMenu_MenuFrame:SetHeight(12+(max_cols*40))
		end
		TrinketMenu.UpdateMenuCooldowns()
		TrinketMenu_MenuFrame:Show()
		TrinketMenu.StartTimer("MenuMouseover")
	end

end

function TrinketMenu.Initialize()

	local options = TrinketMenuOptions
	options.KeepDocked = options.KeepDocked or "ON" -- new option for 2.1
	options.Notify = options.Notify or "OFF" -- 2.1
	options.DisableToggle = options.DisableToggle or "OFF" -- new option for 2.2
	options.NotifyUsedOnly = options.NotifyUsedOnly or "OFF" -- 2.2
	options.NotifyChatAlso = options.NotifyChatAlso or "OFF" -- 2.2
	options.ShowTooltips = options.ShowTooltips or "ON" -- 2.3
	options.NotifyThirty = options.NotifyThirty or "OFF" -- 2.5
	options.SquareMinimap = options.SquareMinimap or "OFF" -- 2.6
	options.MenuOnShift = options.MenuOnShift or "OFF" -- 2.6
	options.TinyTooltips = options.TinyTooltips or "OFF" -- 3.0
	options.SetColumns = options.SetColumns or "OFF" -- 3.0
	options.Columns = options.Columns or 4 -- 3.0
	options.LargeCooldown = options.LargeCooldown or "OFF" -- 3.0
	options.ShowHotKeys = options.ShowHotKeys or "OFF" -- 3.0
	TrinketMenuPerOptions.ItemsUsed = TrinketMenuPerOptions.ItemsUsed or {} -- 3.0
	options.StopOnSwap = options.StopOnSwap or "OFF" -- 3.2
	options.HideOnLoad = options.HideOnLoad or "OFF" -- 3.4

	if TrinketMenuPerOptions.XPos and TrinketMenuPerOptions.YPos then
		TrinketMenu_MainFrame:SetPoint("TOPLEFT","UIParent","BOTTOMLEFT",TrinketMenuPerOptions.XPos,TrinketMenuPerOptions.YPos)
	end
	if TrinketMenuPerOptions.MainScale then
		TrinketMenu_MainFrame:SetScale(TrinketMenuPerOptions.MainScale)
	end
	if TrinketMenuPerOptions.MenuScale then
		TrinketMenu_MenuFrame:SetScale(TrinketMenuPerOptions.MenuScale)
	end

	TrinketMenu.InitTimers()
	TrinketMenu.CreateTimer("UpdateWornTrinkets",TrinketMenu.UpdateWornTrinkets,.75)
	TrinketMenu.CreateTimer("DockingMenu",TrinketMenu.DockingMenu,.2,1)
	TrinketMenu.CreateTimer("MenuMouseover",TrinketMenu.MenuMouseover,.25,1)
	TrinketMenu.CreateTimer("Scaling",TrinketMenu.Scaling,.1,1)
	TrinketMenu.CreateTimer("TooltipUpdate",TrinketMenu.TooltipUpdate,1,1)
	TrinketMenu.CreateTimer("CooldownUpdate",TrinketMenu.CooldownUpdate,1,1)

	--TrinketMenu.oldUseInventoryItem = UseInventoryItem
	--UseInventoryItem = TrinketMenu.newUseInventoryItem
	--TrinketMenu.oldUseAction = UseAction
	--UseAction = TrinketMenu.newUseAction

	TrinketMenu.InitOptions()

	TrinketMenu.UpdateWornTrinkets()
	TrinketMenu.DockWindows()
	TrinketMenu.OrientWindows()
	TrinketMenu.StartTimer("CooldownUpdate")

	if TrinketMenuPerOptions.Visible=="ON" and (GetInventoryItemLink("player",13) or GetInventoryItemLink("player",14)) then
		TrinketMenu_MainFrame:Show()
	end
end

-- returns true if the player is really dead or ghost, not merely FD
function TrinketMenu.IsPlayerReallyDead()
	local dead = UnitIsDeadOrGhost("player")
	for i=1,24 do
		if UnitBuff("player",i)=="Interface\\Icons\\Ability_Rogue_FeignDeath" then
			dead = nil
		end
	end
	return dead
end

function TrinketMenu.ItemInfo(slot)
	local link,id,name,equipLoc,texture = GetInventoryItemLink("player",slot)
	if link then
		local _,_,id = string.find(link,"item:(%d+)")
		name,_,_,_,_,_,_,equipLoc,texture = GetItemInfo(id)
	else
		_,texture = GetInventorySlotInfo("Trinket"..(slot-13).."Slot")
	end
	return texture,name,equipLoc
end

function TrinketMenu.FindItem(name,includeInventory)
	if includeInventory then
		for i=13,14 do
			if string.find(GetInventoryItemLink("player",i) or "",name,1,1) then
				return i
			end
		end
	end
	for i=0,4 do
		for j=1,GetContainerNumSlots(i) do
			if string.find(GetContainerItemLink(i,j) or "",name,1,1) then
				return nil,i,j
			end
		end
	end
end

--[[ Frame Scripts ]]--

function TrinketMenu.OnLoad()

	SlashCmdList["TrinketMenuCOMMAND"] = TrinketMenu.SlashHandler
	SLASH_TrinketMenuCOMMAND1 = "/trinketmenu";
	SLASH_TrinketMenuCOMMAND2 = "/trinket";
	
	this:RegisterEvent("PLAYER_LOGIN")
end

function TrinketMenu.OnEvent()

	if event=="BAG_UPDATE" then
		if arg1>=0 and arg1<=4 then
			TrinketMenu.BagsNeedUpdating[arg1] = 1
		end
		TrinketMenu.StartTimer("UpdateBaggedTrinkets")
	elseif event=="UNIT_INVENTORY_CHANGED" and arg1=="player" then
		TrinketMenu.UpdateWornTrinkets()
	elseif event=="ACTIONBAR_UPDATE_COOLDOWN" then
		TrinketMenu.UpdateWornCooldowns(1)
	elseif (event=="PLAYER_REGEN_ENABLED" or event=="PLAYER_UNGHOST" or event=="PLAYER_ALIVE") and not TrinketMenu.IsPlayerReallyDead() then
		-- trinkets can now be swapped after combat/death
		if TrinketMenu.CombatQueue[0] or TrinketMenu.CombatQueue[1] then
			TrinketMenu.EquipTrinketByName(TrinketMenu.CombatQueue[0],13)
			TrinketMenu.EquipTrinketByName(TrinketMenu.CombatQueue[1],14)
			TrinketMenu.CombatQueue[0] = nil
			TrinketMenu.CombatQueue[1] = nil
			TrinketMenu.UpdateCombatQueue()
		end
	elseif event=="UPDATE_BINDINGS" then
		TrinketMenu.ReflectKeyBindings()
	elseif event=="PLAYER_LOGIN" then
		TrinketMenu.LoadDefaults()
		TrinketMenu.Initialize()
	this:RegisterEvent("PLAYER_REGEN_ENABLED")
	this:RegisterEvent("PLAYER_UNGHOST")
	this:RegisterEvent("PLAYER_ALIVE")
	this:RegisterEvent("UNIT_INVENTORY_CHANGED")
	this:RegisterEvent("UPDATE_BINDINGS")
	this:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")
	end
end

function TrinketMenu.UpdateWornTrinkets()
	TrinketMenu_Trinket0Icon:SetTexture(TrinketMenu.ItemInfo(13))
	TrinketMenu_Trinket1Icon:SetTexture(TrinketMenu.ItemInfo(14))
	TrinketMenu_Trinket0Icon:SetDesaturated(0)
	TrinketMenu_Trinket0:SetChecked(0)
	TrinketMenu_Trinket1Icon:SetDesaturated(0)
	TrinketMenu_Trinket1:SetChecked(0)
	TrinketMenu.UpdateWornCooldowns()
	local name
	for i=13,14 do
		_,_,name = string.find(GetInventoryItemLink("player",i) or "","%[(.+)%]")
		if name then
			TrinketMenu.AddWatchItem(name,i)
		end
	end
	if TrinketMenu_MenuFrame:IsVisible() then
		TrinketMenu.BuildMenu()
	end
end

function TrinketMenu.SlashHandler(msg)

	local _,_,which,profile = string.find(msg,"load (.+) (.+)")

	if profile and TrinketMenu.SetQueue then
		which = string.lower(which)
		if which=="top" or which=="0" then
			which = 0
		elseif which=="bottom" or which=="1" then
			which = 1
		end
		if type(which)=="number" then
			TrinketMenu.SetQueue(which,"SORT",profile)
			return
		end
	end

	msg = string.lower(msg)

	if not msg or msg=="" then
		TrinketMenu.ToggleFrame(TrinketMenu_MainFrame)
	elseif string.find(msg,"^opt") or string.find(msg,"^config") then
		TrinketMenu.ToggleFrame(TrinketMenu_OptFrame)
	elseif msg=="lock" then
		TrinketMenuOptions.Locked="ON"
		TrinketMenu.DockWindows()
		TrinketMenu.ReflectLock()
	elseif msg=="unlock" then
		TrinketMenuOptions.Locked="OFF"
		TrinketMenu.DockWindows()
		TrinketMenu.ReflectLock()
	elseif msg=="reset" then
		TrinketMenu.ResetSettings()
	elseif string.find(msg,"scale") then
		local _,_,menuscale = string.find(msg,"scale menu (.+)")
		if tonumber(menuscale) then
			TrinketMenu.FrameToScale = TrinketMenu_MenuFrame
			TrinketMenu.ScaleFrame(menuscale)
		end
		local _,_,mainscale = string.find(msg,"scale main (.+)")
		if tonumber(mainscale) then
			TrinketMenu.FrameToScale = TrinketMenu_MainFrame
			TrinketMenu.ScaleFrame(mainscale)
		end
		if not tonumber(menuscale) and not tonumber(mainscale) then
			DEFAULT_CHAT_FRAME:AddMessage(TRINKETMENU_CMD_SCALES)
			DEFAULT_CHAT_FRAME:AddMessage(TRINKETMENU_CMD_SCALE1)
			DEFAULT_CHAT_FRAME:AddMessage(TRINKETMENU_CMD_SCALE2)
			DEFAULT_CHAT_FRAME:AddMessage(TRINKETMENU_CMD_SCALE3)
			DEFAULT_CHAT_FRAME:AddMessage(TRINKETMENU_CMD_SCALE4)
		end
		TrinketMenu.FrameToScale = nil
		TrinketMenuPerOptions.MainScale = TrinketMenu_MainFrame:GetScale()
		TrinketMenuPerOptions.MenuScale = TrinketMenu_MenuFrame:GetScale()
	elseif string.find(msg,"load") then
		DEFAULT_CHAT_FRAME:AddMessage(TRINKETMENU_ADDON_LOAD)
		DEFAULT_CHAT_FRAME:AddMessage(TRINKETMENU_CMD_LOAD)
	else
		DEFAULT_CHAT_FRAME:AddMessage(TRINKETMENU_CMDS)
		DEFAULT_CHAT_FRAME:AddMessage(TRINKETMENU_CMD1)
		DEFAULT_CHAT_FRAME:AddMessage(TRINKETMENU_CMD2)
		DEFAULT_CHAT_FRAME:AddMessage(TRINKETMENU_CMD3)
		DEFAULT_CHAT_FRAME:AddMessage(TRINKETMENU_CMD4)
		DEFAULT_CHAT_FRAME:AddMessage(TRINKETMENU_CMD5)
		DEFAULT_CHAT_FRAME:AddMessage(TRINKETMENU_CMD6)
	end
end

function TrinketMenu.ResetSettings()
	StaticPopupDialogs["TRINKETMENURESET"] = {
		text = TRINKETMENU_RESET,
		button1 = TRINKETMENU_YES, button2 = TRINKETMENU_NO, showAlert=1, timeout = 0, whileDead = 1,
		OnAccept = function() TrinketMenuOptions=nil TrinketMenuPerOptions=nil TrinketMenuQueue=nil ReloadUI() end,
	}
	StaticPopup_Show("TRINKETMENURESET")
end

--[[ Window Movement ]]--

function TrinketMenu.MainFrame_OnMouseUp()
	if arg1=="LeftButton" then
		this:StopMovingOrSizing()
		TrinketMenuPerOptions.XPos = TrinketMenu_MainFrame:GetLeft()
		TrinketMenuPerOptions.YPos = TrinketMenu_MainFrame:GetTop()
	elseif TrinketMenuOptions.Locked=="OFF" then
		if TrinketMenuPerOptions.MainOrient=="VERTICAL" then
			TrinketMenuPerOptions.MainOrient = "HORIZONTAL"
		else
			TrinketMenuPerOptions.MainOrient = "VERTICAL"
		end
		TrinketMenu.OrientWindows()
	end

end

function TrinketMenu.MainFrame_OnMouseDown(arg1)
	if arg1=="LeftButton" and TrinketMenuOptions.Locked=="OFF" then
		this:StartMoving()
	end
end

--[[ Timers ]]

function TrinketMenu.InitTimers()
	TrinketMenu.TimerPool = {}
	TrinketMenu.Timers = {}
end

function TrinketMenu.CreateTimer(name,func,delay,rep)
	TrinketMenu.TimerPool[name] = { func=func,delay=delay,rep=rep,elapsed=delay }
end

function TrinketMenu.IsTimerActive(name)
	for i,j in ipairs(TrinketMenu.Timers) do
		if j==name then
			return i
		end
	end
	return nil
end

function TrinketMenu.StartTimer(name,delay)
	TrinketMenu.TimerPool[name].elapsed = delay or TrinketMenu.TimerPool[name].delay
	if not TrinketMenu.IsTimerActive(name) then
		table.insert(TrinketMenu.Timers,name)
		TrinketMenu_TimersFrame:Show()
	end
end

function TrinketMenu.StopTimer(name)
	local idx = TrinketMenu.IsTimerActive(name)
	if idx then
		table.remove(TrinketMenu.Timers,idx)
		if table.getn(TrinketMenu.Timers)<1 then
			TrinketMenu_TimersFrame:Hide()
		end
	end
end

function TrinketMenu.TimersFrame_OnUpdate()
	local timerPool
	for _,name in ipairs(TrinketMenu.Timers) do
		timerPool = TrinketMenu.TimerPool[name]
		timerPool.elapsed = timerPool.elapsed - arg1
		if timerPool.elapsed < 0 then
			timerPool.func()
			if timerPool.rep then
				timerPool.elapsed = timerPool.delay
			else
				TrinketMenu.StopTimer(name)
			end
		end
	end
end

function TrinketMenu.TimerDebug()
	local on = "|cFF00FF00On"
	local off = "|cFFFF0000Off"
	DEFAULT_CHAT_FRAME:AddMessage("|cFF44AAFFTrinketMenu_TimersFrame is "..(TrinketMenu_TimersFrame:IsVisible() and on or off))
	for i in TrinketMenu.TimerPool do
		DEFAULT_CHAT_FRAME:AddMessage(i.." is "..(TrinketMenu.IsTimerActive(i) and on or off))
	end
end

--[[ OnClicks ]]

function TrinketMenu.MainTrinket_OnClick()
	if IsShiftKeyDown() and ChatFrameEditBox:IsVisible() then
		this:SetChecked(0)
		ChatFrameEditBox:Insert(GetInventoryItemLink("player",this:GetID()))
	elseif IsAltKeyDown() and TrinketMenu.QueueInit then
		this:SetChecked(0)
		local which = this:GetID()-13
		if TrinketMenuQueue.Enabled[which] then
			TrinketMenu.CombatQueue[this:GetID()-13]=nil
			TrinketMenuQueue.Enabled[which] = nil
		else
			TrinketMenuQueue.Enabled[which] = 1
		end
--		TrinketMenuQueue.Enabled[which] = not TrinketMenuQueue.Enabled[which]
		TrinketMenu.ReflectQueueEnabled()
		TrinketMenu.UpdateCombatQueue()
		-- toggle queue
	else
		UseInventoryItem(this:GetID())
	end
end

function TrinketMenu.MenuTrinket_OnClick()
	this:SetChecked(0)
	if IsShiftKeyDown() and ChatFrameEditBox:IsVisible() then
		ChatFrameEditBox:Insert(GetContainerItemLink(TrinketMenu.BaggedTrinkets[this:GetID()].bag,TrinketMenu.BaggedTrinkets[this:GetID()].slot))
	else
		local slot = (arg1=="LeftButton") and 13 or 14
		if TrinketMenu.QueueInit then
			local _,_,canCooldown = GetContainerItemCooldown(TrinketMenu.BaggedTrinkets[this:GetID()].bag,TrinketMenu.BaggedTrinkets[this:GetID()].slot)
			if canCooldown==0 or TrinketMenuOptions.StopOnSwap=="ON" then -- if incoming trinket can't go on cooldown
				TrinketMenuQueue.Enabled[slot-13]=nil -- turn off autoqueue
				TrinketMenu.ReflectQueueEnabled()
			end
		end
		TrinketMenu.EquipTrinketByName(TrinketMenu.BaggedTrinkets[this:GetID()].name,slot)
		if not IsShiftKeyDown() and TrinketMenuOptions.KeepOpen=="OFF" then
			TrinketMenu_MenuFrame:Hide()
		end
	end
end

--[[ Docking ]]

function TrinketMenu.MenuFrame_OnMouseDown()
	if arg1=="LeftButton" and TrinketMenuOptions.Locked=="OFF" then
		TrinketMenu_MenuFrame:StartMoving()

		if TrinketMenuOptions.KeepDocked=="ON" then
			TrinketMenu.StartTimer("DockingMenu")
		end
	end
end

function TrinketMenu.MenuFrame_OnMouseUp()
	if arg1=="LeftButton" then
		TrinketMenu.StopTimer("DockingMenu")
		TrinketMenu_MenuFrame:StopMovingOrSizing()
		if TrinketMenuOptions.KeepDocked=="ON" then
			TrinketMenu.DockWindows()
		end
	elseif TrinketMenuOptions.Locked=="OFF" then
		if TrinketMenuPerOptions.MenuOrient=="VERTICAL" then
			TrinketMenuPerOptions.MenuOrient="HORIZONTAL"
		else
			TrinketMenuPerOptions.MenuOrient="VERTICAL"
		end
		TrinketMenu.BuildMenu()
	end
end

function TrinketMenu.DockingMenu()

	local main = TrinketMenu_MainFrame
	local menu = TrinketMenu_MenuFrame
	local mainscale = TrinketMenu_MainFrame:GetScale()
	local menuscale = TrinketMenu_MenuFrame:GetScale()
	local near = TrinketMenu.Near

	if near(main:GetRight()*mainscale,menu:GetLeft()*menuscale) then
		if near(main:GetTop()*mainscale,menu:GetTop()*menuscale) then
			TrinketMenuPerOptions.MainDock = "TOPRIGHT"
			TrinketMenuPerOptions.MenuDock = "TOPLEFT"
		elseif near(main:GetBottom()*mainscale,menu:GetBottom()*menuscale) then
			TrinketMenuPerOptions.MainDock = "BOTTOMRIGHT"
			TrinketMenuPerOptions.MenuDock = "BOTTOMLEFT"
		end
	elseif near(main:GetLeft()*mainscale,menu:GetRight()*menuscale) then
		if near(main:GetTop()*mainscale,menu:GetTop()*menuscale) then
			TrinketMenuPerOptions.MainDock = "TOPLEFT"
			TrinketMenuPerOptions.MenuDock = "TOPRIGHT"
		elseif near(main:GetBottom()*mainscale,menu:GetBottom()*menuscale) then
			TrinketMenuPerOptions.MainDock = "BOTTOMLEFT"
			TrinketMenuPerOptions.MenuDock = "BOTTOMRIGHT"
		end
	elseif near(main:GetRight()*mainscale,menu:GetRight()*menuscale) then
		if near(main:GetTop()*mainscale,menu:GetBottom()*menuscale) then
			TrinketMenuPerOptions.MainDock = "TOPRIGHT"
			TrinketMenuPerOptions.MenuDock = "BOTTOMRIGHT"
		elseif near(main:GetBottom()*mainscale,menu:GetTop()*menuscale) then
			TrinketMenuPerOptions.MainDock = "BOTTOMRIGHT"
			TrinketMenuPerOptions.MenuDock = "TOPRIGHT"
		end
	elseif near(main:GetLeft()*mainscale,menu:GetLeft()*menuscale) then
		if near(main:GetTop()*mainscale,menu:GetBottom()*menuscale) then
			TrinketMenuPerOptions.MainDock = "TOPLEFT"
			TrinketMenuPerOptions.MenuDock = "BOTTOMLEFT"
		elseif near(main:GetBottom()*mainscale,menu:GetTop()*menuscale) then
			TrinketMenuPerOptions.MainDock = "BOTTOMLEFT"
			TrinketMenuPerOptions.MenuDock = "TOPLEFT"
		end
	end
	TrinketMenu.ClearDocking()
	getglobal("TrinketMenu_MainDock_"..TrinketMenuPerOptions.MainDock):Show()
	getglobal("TrinketMenu_MenuDock_"..TrinketMenuPerOptions.MenuDock):Show()
end

function TrinketMenu.MenuMouseover()
	if (not MouseIsOver(TrinketMenu_MainFrame)) and (not MouseIsOver(TrinketMenu_MenuFrame)) and not IsShiftKeyDown() and (TrinketMenuOptions.KeepOpen=="OFF") and not TrinketMenu.IsTimerActive("Scaling") then
		TrinketMenu.StopTimer("MenuMouseover")
		TrinketMenu_MenuFrame:Hide()
	end
end

--[[ Scaling ]]

function TrinketMenu.StartScaling()
	if arg1=="LeftButton" and TrinketMenuOptions.Locked=="OFF" then
		this:LockHighlight()
		TrinketMenu.FrameToScale = this:GetParent()
		TrinketMenu.ScalingWidth = this:GetParent():GetWidth()
		TrinketMenu.StartTimer("Scaling")
	end
end

function TrinketMenu.StopScaling()
	if arg1=="LeftButton" then
		TrinketMenu.StopTimer("Scaling")
		TrinketMenu.FrameToScale = nil
		this:UnlockHighlight()
		if this:GetParent():GetName() == "TrinketMenu_MainFrame" then
			TrinketMenuPerOptions.MainScale = TrinketMenu_MainFrame:GetScale()
		else
			TrinketMenuPerOptions.MenuScale = TrinketMenu_MenuFrame:GetScale()
		end
	end
end

function TrinketMenu.ScaleFrame(scale)
	local frame = TrinketMenu.FrameToScale
	local oldscale = frame:GetScale() or 1
	local framex = (frame:GetLeft() or TrinketMenuPerOptions.XPos)* oldscale
	local framey = (frame:GetTop() or TrinketMenuPerOptions.YPos)* oldscale

	frame:SetScale(scale)
	if frame:GetName() == "TrinketMenu_MainFrame" then
		TrinketMenu_MainFrame:SetPoint("TOPLEFT","UIParent","BOTTOMLEFT",framex/scale,framey/scale)
		TrinketMenuPerOptions.XPos = TrinketMenu_MainFrame:GetLeft()
		TrinketMenuPerOptions.YPos = TrinketMenu_MainFrame:GetTop()
	elseif TrinketMenuOptions.KeepDocked=="OFF" then
		TrinketMenu_MenuFrame:ClearAllPoints()
		TrinketMenu_MenuFrame:SetPoint("TOPLEFT","UIParent","BOTTOMLEFT",framex/scale,framey/scale)
	end
end

function TrinketMenu.Scaling()
	local frame = TrinketMenu.FrameToScale
	local oldscale = frame:GetEffectiveScale()
	local framex, framey, cursorx, cursory = frame:GetLeft()*oldscale, frame:GetTop()*oldscale, GetCursorPosition()
	if (cursorx-framex)>32 then
		local newscale = (cursorx-framex)/TrinketMenu.ScalingWidth
		TrinketMenu.ScaleFrame(newscale)
	end
end

--[[ Cooldowns ]]

function TrinketMenu.UpdateWornCooldowns(maybeGlobal)
	local start,duration,enable = GetInventoryItemCooldown("player",13)
	CooldownFrame_SetTimer(TrinketMenu_Trinket0Cooldown,start,duration,enable)
	start,duration,enable = GetInventoryItemCooldown("player",14)
	CooldownFrame_SetTimer(TrinketMenu_Trinket1Cooldown,start,duration,enable)
	if not maybeGlobal then
		TrinketMenu.WriteWornCooldowns()
	end
end

function TrinketMenu.UpdateMenuCooldowns()
	local start,duration,enable
	for i=1,TrinketMenu.NumberOfTrinkets do
		start,duration,enable = GetContainerItemCooldown(TrinketMenu.BaggedTrinkets[i].bag,TrinketMenu.BaggedTrinkets[i].slot)
		CooldownFrame_SetTimer(getglobal("TrinketMenu_Menu"..i.."Cooldown"),start,duration,enable)
	end
	TrinketMenu.WriteMenuCooldowns()
end

--[[ Item use ]]

function TrinketMenu.ReflectTrinketUse(slot)
	getglobal("TrinketMenu_Trinket"..(slot-13)):SetChecked(1)
	TrinketMenu.StartTimer("UpdateWornTrinkets")
	local _,_,id,trinket = string.find(GetInventoryItemLink("player",slot) or "","item:(%d+).+%[(.+)%]")
	if trinket then
		TrinketMenuPerOptions.ItemsUsed[trinket] = 0 -- 0 is an indeterminate state, cooldown will figure if it's worth watching
		TrinketMenu.AddWatchItem(trinket)
	end
end

function TrinketMenu.newUseInventoryItem(slot)
	if slot==13 or slot==14 and not MerchantFrame:IsVisible() then
		TrinketMenu.ReflectTrinketUse(slot)
	end
	TrinketMenu.oldUseInventoryItem(slot)
end

function TrinketMenu.newUseAction(slot,cursor,self)
	if IsEquippedAction(slot) then
		TrinketMenu_TooltipScan:SetAction(slot)
		local _,trinket0 = TrinketMenu.ItemInfo(13)
		local _,trinket1 = TrinketMenu.ItemInfo(14)
		if GameTooltipTextLeft1:GetText()==trinket0 then
			TrinketMenu.ReflectTrinketUse(13)
		elseif GameTooltipTextLeft1:GetText()==trinket1 then
			TrinketMenu.ReflectTrinketUse(14)
		end
	end
	TrinketMenu.oldUseAction(slot,cursor,self)
end

--[[ Tooltips ]]

function TrinketMenu.WornTrinketTooltip()
	local id = this:GetID()
	if TrinketMenu.IsTimerActive("Scaling") or TrinketMenuOptions.ShowTooltips=="OFF" then
		return
	end
	TrinketMenu.TooltipOwner = this
	TrinketMenu.TooltipType = "INVENTORY"
	TrinketMenu.TooltipSlot = id
	TrinketMenu.TooltipBag = TrinketMenu.CombatQueue[id-13]
	TrinketMenu.StartTimer("TooltipUpdate",0)
end

function TrinketMenu.MenuTrinketTooltip()
	local id = this:GetID()
	if TrinketMenu.IsTimerActive("Scaling") or TrinketMenuOptions.ShowTooltips=="OFF" then
		return
	end
	TrinketMenu.TooltipOwner = this
	TrinketMenu.TooltipType = "BAG"
	TrinketMenu.TooltipBag = TrinketMenu.BaggedTrinkets[id].bag
	TrinketMenu.TooltipSlot = TrinketMenu.BaggedTrinkets[id].slot
	TrinketMenu.StartTimer("TooltipUpdate",0)
end

function TrinketMenu.ClearTooltip()
	GameTooltip:Hide()
	TrinketMenu.StopTimer("TooltipUpdate")
	TrinketMenu.TooltipType = nil
end

function TrinketMenu.AnchorTooltip(owner)
	owner = owner or this
	if TrinketMenuOptions.TooltipFollow=="ON" then
		if owner.GetLeft and owner:GetLeft() and owner:GetLeft()<400 then
			GameTooltip:SetOwner(owner,"ANCHOR_RIGHT")
		else
			GameTooltip:SetOwner(owner,"ANCHOR_LEFT")
		end
	else
		GameTooltip_SetDefaultAnchor(GameTooltip,owner)
	end
end

-- updates the tooltip created in the functions above
function TrinketMenu.TooltipUpdate()
	if TrinketMenu.TooltipType then
		local cooldown
		TrinketMenu.AnchorTooltip(TrinketMenu.TooltipOwner)
		if TrinketMenu.TooltipType=="BAG" then
			GameTooltip:SetBagItem(TrinketMenu.TooltipBag,TrinketMenu.TooltipSlot)
			cooldown = GetContainerItemCooldown(TrinketMenu.TooltipBag,TrinketMenu.TooltipSlot)
		else
			GameTooltip:SetInventoryItem("player",TrinketMenu.TooltipSlot)
			cooldown = GetInventoryItemCooldown("player",TrinketMenu.TooltipSlot)
		end
		TrinketMenu.ShrinkTooltip(TrinketMenu.TooltipOwner) -- if TinyTooltips on, shrink it
		if TrinketMenu.TooltipType=="INVENTORY" and TrinketMenu.TooltipBag then
			GameTooltip:AddLine("Queued: "..TrinketMenu.TooltipBag)
		end
		GameTooltip:Show()
		if cooldown==0 then
			-- stop updates if this trinket has no cooldown
			TrinketMenu.TooltipType = nil
			TrinketMenu.StopTimer("TooltipUpdate")
		end
	end

end

-- normal tooltip for options
function TrinketMenu.OnTooltip(line1,line2)
	if TrinketMenuOptions.ShowTooltips=="ON" then
		TrinketMenu.AnchorTooltip()
		if line1 then
			GameTooltip:AddLine(line1)
			GameTooltip:AddLine(line2,.8,.8,.8,1)
			GameTooltip:Show()
		else
			local name = this:GetName() or ""
			for i=1,table.getn(TrinketMenu.CheckOptInfo) do
				if name=="TrinketMenu_Opt"..TrinketMenu.CheckOptInfo[i][1] and TrinketMenu.CheckOptInfo[i][3] then
					TrinketMenu.OnTooltip(TrinketMenu.CheckOptInfo[i][3],TrinketMenu.CheckOptInfo[i][4])
				end
			end
			for i=1,table.getn(TrinketMenu.TooltipInfo) do
				if TrinketMenu.TooltipInfo[i][1]==name and TrinketMenu.TooltipInfo[i][2] then
					TrinketMenu.OnTooltip(TrinketMenu.TooltipInfo[i][2],TrinketMenu.TooltipInfo[i][3])
				end
			end
		end
	end
end

-- strip format reordering in global strings
TrinketMenu.ITEM_SPELL_CHARGES = string.gsub(ITEM_SPELL_CHARGES,"%%%d%$d","%%d")
TrinketMenu.ITEM_SPELL_CHARGES_P1 = string.gsub(ITEM_SPELL_CHARGES_P1,"%%%d%$d","%%d")

function TrinketMenu.ShrinkTooltip(owner)
	if TrinketMenuOptions.TinyTooltips=="ON" then
		local r,g,b = GameTooltipTextLeft1:GetTextColor()
		local name = GameTooltipTextLeft1:GetText()
		local line,cooldown,charge
		for i=2,12 do
			line = getglobal("GameTooltipTextLeft"..i)
			if line:IsVisible() then
				line = line:GetText() or ""
				if string.find(line,COOLDOWN_REMAINING) then
					cooldown = line
				end
				if string.find(line,TrinketMenu.ITEM_SPELL_CHARGES_P1) or string.find(line,TrinketMenu.ITEM_SPELL_CHARGES) then
					charge = line
				end
			end
		end
		TrinketMenu.AnchorTooltip(owner or this)
		GameTooltip:AddLine(name,r,g,b)
		GameTooltip:AddLine(charge,1,1,1)
		GameTooltip:AddLine(cooldown,1,1,1)
	end
end

--[[ Combat Queue ]]

function TrinketMenu.EquipTrinketByName(name,slot)
	if not name then return end
	if UnitAffectingCombat("player") or TrinketMenu.IsPlayerReallyDead() then
		-- queue trinket
		local queue = TrinketMenu.CombatQueue
		local which = slot-13 -- 0 or 1
		if queue[which]==name and not imperative then
			queue[which] = nil
		elseif queue[1-which]==name then
			queue[1-which] = nil
			queue[which] = name
		else
			queue[which] = name
		end
	elseif not CursorHasItem() and not SpellIsTargeting() then
		local _,b,s = TrinketMenu.FindItem(name)
		if b then
			local _,_,isLocked = GetContainerItemInfo(b,s)
			if not isLocked and not IsInventoryItemLocked(slot) then
				-- neither container item nor inventory item locked, perform swap
				PickupContainerItem(b,s)
				PickupInventoryItem(slot)
				getglobal("TrinketMenu_Trinket"..(slot-13).."Icon"):SetDesaturated(1)
				TrinketMenu.StartTimer("UpdateWornTrinkets") -- in case it's not equipped (stunned, etc)
			end
		end
	end
	TrinketMenu.UpdateCombatQueue()
end	

function TrinketMenu.UpdateCombatQueue()
	local bag,slot
	for which=0,1 do
		local trinket = TrinketMenu.CombatQueue[which]
		local icon = getglobal("TrinketMenu_Trinket"..which.."Queue")
		icon:Hide()
		if trinket then
			_,bag,slot = TrinketMenu.FindItem(trinket)
			if bag then
				icon:SetTexture(GetContainerItemInfo(bag,slot))
				icon:Show()
			end
		elseif TrinketMenu.QueueInit and TrinketMenuQueue and TrinketMenuQueue.Enabled[which] then
			icon:SetTexture("Interface\\AddOns\\TrinketMenu\\TrinketMenu-Gear")
			icon:Show()
		end
	end
end

--[[ Notify ]]

function TrinketMenu.Notify(msg)
	PlaySound("GnomeExploration")
	if SCT_Display then -- send via SCT if it exists
		SCT_Display(msg,{r=.2,g=.7,b=.9})
	elseif SHOW_COMBAT_TEXT=="1" then
		CombatText_AddMessage(msg, CombatText_StandardScroll, .2, .7, .9) -- or default UI's SCT
	else
		-- send vis UIErrorsFrame if neither SCT exists
		UIErrorsFrame:AddMessage(msg,.2,.7,.9,1,UIERRORS_HOLD_TIME)
	end
	if TrinketMenuOptions.NotifyChatAlso=="ON" then
		DEFAULT_CHAT_FRAME:AddMessage("|cff33b2e5"..msg)
	end
end

-- adds location of the name to a watch table for fast lookups
-- pass inv bag slot to override the search
function TrinketMenu.AddWatchItem(name,inv,bag,slot)
	TrinketMenu.WatchItem[name] = TrinketMenu.WatchItem[name] or {}
	if not inv and not bag then
		inv = TrinketMenu.WatchItem[name].inv
		bag = TrinketMenu.WatchItem[name].bag
		slot = TrinketMenu.WatchItem[name].slot
		if not string.find((inv and (GetInventoryItemLink("player",inv) or "")) or (bag and (GetContainerItemLink(bag,slot) or "")) or "",name) then
			inv,bag,slot = TrinketMenu.FindItem(name,1)
		end
	end
	TrinketMenu.WatchItem[name].inv = inv
	TrinketMenu.WatchItem[name].bag = bag
	TrinketMenu.WatchItem[name].slot = slot
end

function TrinketMenu.CooldownUpdate()
	local inv,bag,slot,start,duration,name,remain
	local watch = TrinketMenu.WatchItem
	for i in TrinketMenuPerOptions.ItemsUsed do
		start,name = nil
		if not watch[i] then TrinketMenu.AddWatchItem(i) end -- if not on watch table, add it
		inv,bag,slot = watch[i].inv,watch[i].bag,watch[i].slot
		if inv then -- if it was last seen in an inv slot, get name in that slot
			_,_,name = string.find(GetInventoryItemLink("player",inv) or "","%[(.+)%]")
		end
		if bag then -- if it was last seen in a container slot, get name in that slot
			_,_,name = string.find(GetContainerItemLink(bag,slot) or "","%[(.+)%]")
		end
		if name~=i then -- item has moved
			inv,bag,slot = TrinketMenu.FindItem(i,1)
			watch[i].inv,watch[i].bag,watch[i].slot = inv,bag,slot
		end
		if inv then
			start,duration = GetInventoryItemCooldown("player",inv)
		elseif bag then
			start,duration = GetContainerItemCooldown(bag,slot)
		else
			TrinketMenuPerOptions.ItemsUsed[i] = nil
		end
		if start and TrinketMenuPerOptions.ItemsUsed[i]<3 then
			TrinketMenuPerOptions.ItemsUsed[i] = TrinketMenuPerOptions.ItemsUsed[i] + 1 -- count for 3 seconds before seeing if this is a real cooldown
		elseif start then
			if start>0 then
				remain = duration - (GetTime()-start)
				if TrinketMenuPerOptions.ItemsUsed[i]<5 then
					if remain>29 then
						TrinketMenuPerOptions.ItemsUsed[i] = 30 -- first actual cooldown greater than 30 seconds, tag it for 30+0 notify
					elseif remain>5 then
						TrinketMenuPerOptions.ItemsUsed[i] = 5 -- first actual cooldown less than 30 but greater than 5, tag for 0 notify
					end
				end
			end
			if TrinketMenuPerOptions.ItemsUsed[i]==30 and start>0 and remain<30 then
				if TrinketMenuOptions.NotifyThirty=="ON" then
					TrinketMenu.Notify(i.." ready soon!")
				end
				TrinketMenuPerOptions.ItemsUsed[i]=5 -- tag for just 0 notify now
			elseif TrinketMenuPerOptions.ItemsUsed[i]==5 and start==0 then
				if TrinketMenuOptions.Notify=="ON" then
					TrinketMenu.Notify(i.." ready!")
				end
			end
			if start==0 then
				TrinketMenuPerOptions.ItemsUsed[i] = nil
			end
		end
	end

	-- update cooldown numbers
	if TrinketMenuOptions.CooldownCount=="ON" then
		if TrinketMenu_MainFrame:IsVisible() then
			TrinketMenu.WriteWornCooldowns()
		end
		if TrinketMenu_MenuFrame:IsVisible() then
			TrinketMenu.WriteMenuCooldowns()
		end
	end

	if TrinketMenu.PeriodicQueueCheck then
		TrinketMenu.PeriodicQueueCheck()
	end
end

function TrinketMenu.WriteWornCooldowns()
	local start, duration
	start, duration = GetInventoryItemCooldown("player",13)
	TrinketMenu.WriteCooldown(TrinketMenu_Trinket0Time,start,duration)
	start, duration = GetInventoryItemCooldown("player",14)
	TrinketMenu.WriteCooldown(TrinketMenu_Trinket1Time,start,duration)
end

function TrinketMenu.WriteMenuCooldowns()
	local start, duration
	for i=1,TrinketMenu.NumberOfTrinkets do
		start, duration = GetContainerItemCooldown(TrinketMenu.BaggedTrinkets[i].bag,TrinketMenu.BaggedTrinkets[i].slot)
		TrinketMenu.WriteCooldown(getglobal("TrinketMenu_Menu"..i.."Time"),start,duration)
	end
end

function TrinketMenu.WriteCooldown(where,start,duration)
	local cooldown = duration - (GetTime()-start)
	if start==0 or TrinketMenuOptions.CooldownCount=="OFF" then
		where:SetText("")
	elseif cooldown<3 and not where:GetText() then
		-- this is a global cooldown. don't display it. not accurate but at least not annoying
	else
		where:SetText((cooldown<60 and math.floor(cooldown+.5).." s") or (cooldown<3600 and math.ceil(cooldown/60).." m") or math.ceil(cooldown/3600).." h")
	end
end

function TrinketMenu.OnShow()
	TrinketMenuPerOptions.Visible = "ON"
	if TrinketMenuOptions.KeepOpen=="ON" then
		TrinketMenu.BuildMenu()
	end
end

function TrinketMenu.OnHide()
	TrinketMenuPerOptions.Visible = "OFF"
	TrinketMenu_MenuFrame:Hide()
end

--[[ Key bindings ]]

function TrinketMenu.ReflectKeyBindings()
	if TrinketMenuOptions.ShowHotKeys=="ON" then
		TrinketMenu_Trinket0HotKey:SetText(GetBindingText(GetBindingKey("Use Top Trinket"),"KEY_",1))
		TrinketMenu_Trinket1HotKey:SetText(GetBindingText(GetBindingKey("Use Bottom Trinket"),"KEY_",1))
	else
		TrinketMenu_Trinket0HotKey:SetText("")
		TrinketMenu_Trinket1HotKey:SetText("")
	end
end
