
function SP_ST_Split(s,t)
	local l = {n=0}
	local f = function (s)
		l.n = l.n + 1
		l[l.n] = s
	end
	local p = "%s*(.-)%s*"..t.."%s*"
	s = string.gsub(s,"^%s+","")
	s = string.gsub(s,"%s+$","")
	s = string.gsub(s,p,f)
	l.n = l.n + 1
	l[l.n] = string.gsub(s,"(%s%s*)$","")
	return l
end

SP_ST_Weapon = nil

SP_ST_InCombat = false
SP_ST_TimeLeft = 0.0

SP_ST_Casting_HS = false
SP_ST_Casting_Cleave = false


function SP_ST_Print(msg)
	DEFAULT_CHAT_FRAME:AddMessage("[ST] "..msg, 0.9, 0.3, 1)
end

function SP_ST_Handler(msg)
	
	local vars = SP_ST_Split(msg, " ")
	local cmd, arg = vars[1], vars[2]
	
	if (cmd == "") then
		cmd = nil
	end
	if (arg == "") then
		arg = nil
	end
	
	if (cmd == nil and arg == nil) then
		SP_ST_Print(SWINGT_L_CHATCOMMANDS)
		SP_ST_Print(SWINGT_L_EXAMPLESTSHOW)
		SP_ST_Print(SWINGT_L_EXAMPLESTY150)
	elseif (cmd == "x") then
		if (arg ~= nil) then
			SP_ST_GS["x"] = arg
			SP_ST_SetPosition()
			SP_ST_Print(SWINGT_L_XSET..arg)
		else
			SP_ST_Print(SWINGT_L_CURRENTX..SP_ST_GS["x"]..SWINGT_L_TOCHANGEXSAY)
		end
	elseif (cmd == "y") then
		if (arg ~= nil) then
			SP_ST_GS["y"] = arg
			SP_ST_SetPosition()
			SP_ST_Print(SWINGT_L_YSET..arg)
		else
			SP_ST_Print(SWINGT_L_CURRENTY..SP_ST_GS["y"]..SWINGT_L_TOCHANGEYSAY)
		end
	elseif (cmd == "reset") then
		SP_ST_ResetPosition()
	elseif (cmd == "show") then
		SP_ST_Reset()
	end
end

function SP_ST_ResetPosition()
	SP_ST_GS["x"] = 0
	SP_ST_GS["y"] = -100
	SP_ST_SetPosition()
end
function SP_ST_SetPosition()
	SP_ST_Frame:SetPoint("CENTER", "UIParent", "CENTER", SP_ST_GS["x"], SP_ST_GS["y"])
end

function SP_ST_OnLoad()
	this:RegisterEvent("ADDON_LOADED")
	this:RegisterEvent("PLAYER_REGEN_ENABLED")
	this:RegisterEvent("PLAYER_REGEN_DISABLED")
	this:RegisterEvent("UNIT_INVENTORY_CHANGED")
	this:RegisterEvent("CHAT_MSG_COMBAT_SELF_MISSES");
	this:RegisterEvent("CHAT_MSG_COMBAT_SELF_HITS");
	this:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE")
	this:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES")
	
	SLASH_SPSWINGTIMER1 = "/st"
	SLASH_SPSWINGTIMER2 = "/swingtimer"
	SLASH_SPSWINGTIMER3 = "/spst"
	SLASH_SPSWINGTIMER4 = "/spswingtimer"
	SlashCmdList["SPSWINGTIMER"] = SP_ST_Handler
end

StaticPopupDialogs["SP_ST_Install"] = {
	text = TEXT(SWINGT_L_THANKSFORINSTALLINGSPSWT),
	button1 = TEXT(YES),
	timeout = 0,
	hideOnEscape = 1,
};

function SP_ST_OnEvent()
	if (event == "ADDON_LOADED") then
		if (string.lower(arg1) == "sp_swingtimer") then

			if (SP_ST_GS == nil) then
				StaticPopup_Show("SP_ST_Install")
				SP_ST_GS = {
					["x"] = 0,
					["y"] = -100,
				}
			end
			
			SP_ST_SetWeapon()
			
			SP_ST_SetPosition()
			SP_ST_UpdateDisplay()
			SP_ST_Frame:SetAlpha(0)
			SP_ST_Frame:Show()
			
			SP_ST_Print(SWINGT_L_SPSWTLOADED)
		end
		
	elseif (event == "PLAYER_REGEN_ENABLED") then
		SP_ST_InCombat = false
		SP_ST_UpdateDisplay()
		
	elseif (event == "PLAYER_REGEN_DISABLED") then
		SP_ST_InCombat = true
		
	elseif (event == "UNIT_INVENTORY_CHANGED") then
		if (arg1 == "player") then
			local oldWep = SP_ST_Weapon
			SP_ST_SetWeapon()
			if (SP_ST_InCombat and oldWep ~= SP_ST_Weapon) then
				SP_ST_Reset()
			end
		end
		
	elseif (event == "CHAT_MSG_COMBAT_SELF_MISSES") then
		if (SP_ST_ShouldReset()) then
			SP_ST_Reset()
		end
		
	elseif (event == "CHAT_MSG_COMBAT_SELF_HITS") then
		if (string.find(arg1, SWINGT_L_YOUHIT) or string.find(arg1, SWINGT_L_YOUCRIT)) then
			if (SP_ST_ShouldReset()) then
				SP_ST_Reset()
			end
		end
		
	elseif (event == "CHAT_MSG_SPELL_SELF_DAMAGE") then
		local a = nil
		local b = nil
		local spell = nil
		
		local a,b,spell = string.find (arg1, SWINGT_L_YOURHITS)
		if not spell then a,b,spell = string.find(arg1, SWINGT_L_YOURCRITS) end
		if not spell then a,b,spell = string.find(arg1, SWINGT_L_YOURIS) end
		if not spell then a,b,spell = string.find(arg1, SWINGT_L_YOURMISSES) end
		
		if spell == SWINGT_L_HEROICSTRIKE or spell == SWINGT_L_CLEAVE or spell == SWINGT_L_SLAM then
			SP_ST_Reset()
		end
		
	elseif (event == "CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES") then
		if (string.find(arg1, SWINGT_L_ATTACKSYOUPARRY)) then
			local percentTime = SP_ST_TimeLeft / SP_ST_GetWeaponSpeed()
			if (percentTime > 0.2) then
				local hypTimeLeft = SP_ST_TimeLeft - SP_ST_GetWeaponSpeed() * 0.4
				if (hypTimeLeft <= 0.0) then
					SP_ST_TimeLeft = 0.0
					SP_ST_UpdateDisplay()
				else
					local hypPercentTime = hypTimeLeft / SP_ST_GetWeaponSpeed()
					if (hypPercentTime > 0.2) then
						SP_ST_TimeLeft = hypTimeLeft
					end
				end
			end
		end
	end
end

function SP_ST_OnUpdate(delta)
	if (SP_ST_TimeLeft > 0) then
		
		SP_ST_TimeLeft = SP_ST_TimeLeft - delta
		if (SP_ST_TimeLeft < 0) then
			SP_ST_TimeLeft = 0
		end
		
		SP_ST_UpdateDisplay()
	end
end


function SP_ST_GetWeaponSpeed()
	local speedMH,speedOH = UnitAttackSpeed("player")
	return speedMH
end
function SP_ST_ShouldReset()
	local percentTime = SP_ST_TimeLeft / SP_ST_GetWeaponSpeed()
	return (percentTime < 0.05)
end
function SP_ST_SetWeapon()
	SP_ST_Weapon = GetInventoryItemLink("player",GetInventorySlotInfo("MainHandSlot"))
end
function SP_ST_Reset()
	SP_ST_TimeLeft = SP_ST_GetWeaponSpeed()
end
function SP_ST_Display(msg)
	SP_ST_FrameText:SetText(msg)
end
function SP_ST_UpdateDisplay()
	if (SP_ST_TimeLeft == 0) then
		SP_ST_FrameTime:Hide()
		SP_ST_Display("0.0")
		
		if (not SP_ST_InCombat) then
			SP_ST_Frame:SetAlpha(0)
		end
	else
		if (SP_ST_TimeLeft <= 1.5) then
			SP_ST_FrameTime:SetTexture(0,1,0,1)
		else
			SP_ST_FrameTime:SetTexture(1,0.6,0,1)
		end
		local size = (SP_ST_TimeLeft/SP_ST_GetWeaponSpeed())*251
		SP_ST_FrameTime:SetWidth(size)
		SP_ST_FrameTime:Show()
		
		SP_ST_Display(string.sub(SP_ST_TimeLeft, 1, 3))
		
		SP_ST_Frame:SetAlpha(1)
	end
end




