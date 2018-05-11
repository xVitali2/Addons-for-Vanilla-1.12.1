local vQueueDB = {}

local chatRate = 2 -- limit to 2 msg/sec
local channelName = "vQueue"

local hostedCategory = ""
local realHostedCategory = ""
local playersQueued = {}
local chatQueue = {}
local groups = {}
local notifyForDungeon = ""
local vQueueFrame = {}
local catListButtons = {}
local selectedQuery = ""
local selectedCat = ""
local categories = {}
local hostListButtons = {}
local hostListFrame
local categoryListFrame
local infoFrame = {}
local catListHidden = {}
local catListHiddenBot = {}
local waitingList = {}
local realScroll = false
local findTimer = 0
local miniDrag = false
local leaderMessages = {}
local playerMessages = {}
local whoRequestList = {}
local newGroups = {}
local fixingChat = false
local lastUpdate = 0
local whoRequestTimer = 0
local idleMessage = 0
local tankSelected = false
local healerSelected = false
local damageSelected = false

do 
	local _, class2 = UnitClass'player'
	vQueueDB.class = string.lower(class2)
	vQueueDB.inCombat = false
	vQueueDB.isHost = false
	vQueueDB.isWaitListShown = false
	vQueueDB.FrameShown = false
	vQueueDB.filterEnabled = true -- chat filter
end



local vQueueColors = {
}
vQueueColors["WHITE"] = {
	247/255, --r
	235/255, --g
	233/255 --b
}
vQueueColors["YELLOW"] = {
	209/255, --r
	164/255, --g
	29/255 --b
}
vQueueColors["GREEN"] = {
	79/255,
	247/255,
	93/255
}

local hostOptions = {}

local L = AceLibrary("AceLocale-2.2"):new("vQueue")
local BZ = AceLibrary("Babble-Zone-2.2")
local BC = AceLibrary("Babble-Class-2.2")
vQueue = AceLibrary("AceAddon-2.0"):new("AceHook-2.1")

function Wholefind(Search_string, Word)
 _, F_result = string.gsub(Search_string, '%f[%a]'..Word..'%f[%A]',"")
 return F_result
end

function addToSet(set, key)
    set[key] = true
end

function removeFromSet(set, key)
	set[key] = nil
end

function setContains(set, key)
    return set[key] ~= nil
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function round(num)
    under = math.floor(num)
    upper = math.floor(num) + 1
    underV = -(under - num)
    upperV = upper - num
    if (upperV > underV) then
        return under
    else
        return upper
    end
end

function trim(str)
	return gsub(str, '^%s*(.-)%s*$', '%1')
end

function split(pString, pPattern)
   local Table = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pPattern
   local last_end = 1
   local s, e, cap = string.find(pString, fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
		table.insert(Table,cap)
      end
      last_end = e+1
      s, e, cap = string.find(pString, fpat, last_end)
   end
   if last_end <= string.len(pString) then
      cap = string.sub(pString, last_end)
      table.insert(Table, cap)
   end
   return Table
end

function vQueue:OnInitialize()
	for i = NUM_CHAT_WINDOWS, 1, -1 do
		self:Hook(getglobal("ChatFrame"..i), "AddMessage")
	end
end

function vQueue:AddMessage(frame, text, r, g, b, id)
	local channelId = GetChannelName(channelName)
	local blockMsg = false
	if event == nil then event = "CHAT_MSG_NONE" end
	if vQueueOptions["filter"] and strfind(event,"CHAT_MSG_CHANNEL") then
		arg9 = string.lower(arg9)
		if not vQueueOptions["onlylfg"] then
			if vQueueOptions["general"] and arg9 == "general - " .. string.lower(GetRealZoneText()) and GetChannelName("General - " .. GetRealZoneText()) ~= 0 then blockMsg = true end
			if vQueueOptions["trade"] and arg9 == "trade - city" and GetChannelName("Trade - City") ~= 0 then blockMsg = true end
			if vQueueOptions["lfg"] and arg9 == "lookingforgroup" and GetChannelName("LookingForGroup") ~= 0 then blockMsg = true end
			if vQueueOptions["world"] and arg9 == "world" and GetChannelName("world") ~= 0 then blockMsg = true end
		elseif vQueueOptions["onlylfg"] then
			local foundArg = false
			local noPunc = filterPunctuation(tostring(text))
			for k, v in pairs(getglobal("LFMARGS")) do
				if Wholefind(noPunc, v) > 0 then foundArg = true end
			end
			for k, v in pairs(getglobal("LFGARGS")) do
				if Wholefind(noPunc, v) > 0 then foundArg = true end
			end
			if foundArg then
				foundArg = false
				for kCat, kVal in pairs(getglobal("CATARGS")) do
					for kkCat, kkVal in pairs(kVal) do
						if Wholefind(noPunc, kkVal) > 0 then foundArg = true end
					end
				end
			end
			if foundArg then
				if vQueueOptions["general"] and arg9 == "general - " .. string.lower(GetRealZoneText()) and GetChannelName("General - " .. GetRealZoneText()) ~= 0 then blockMsg = true end
				if vQueueOptions["trade"] and arg9 == "trade - city" and GetChannelName("Trade - City") ~= 0 then blockMsg = true end
				if vQueueOptions["lfg"] and arg9 == "lookingforgroup" and GetChannelName("LookingForGroup") ~= 0 then blockMsg = true end
				if vQueueOptions["world"] and arg9 == "world" and GetChannelName("world") ~= 0 then blockMsg = true end
			end
		end
	end
	if strfind(event,"CHAT_MSG_CHANNEL") or strfind(event, "CHAT_MSG_CHANNEL_JOIN") or strfind(event, "CHAT_MSG_CHANNEL_LEAVE") or strfind(event, "CHAT_MSG_CHANNEL_NOTICE") then
		arg9 = string.lower(arg9)
		if (strfind(arg9, channelName)) and vQueueDB.filterEnabled then
			blockMsg = true
		end
	end
	if (Wholefind(tostring(text), "vqgroup") > 0 or Wholefind(tostring(text), "vqrequest") > 0 or Wholefind(tostring(text), "vqaccept") > 0 or Wholefind(tostring(text), "vqdecline") > 0 or Wholefind(tostring(text), "vqremove") > 0) and vQueueDB.filterEnabled then
		blockMsg = true
	end
	if not blockMsg then
		 self.hooks[frame].AddMessage(frame, tostring(text), r, g, b, id)
	--self.hooks[frame].AddMessage(frame, string.format("%s", text), r, g, b, id) --update ???

	end
end

function vQueue_OnLoad()
	this:RegisterEvent("ADDON_LOADED");
	this:RegisterEvent("CHAT_MSG_CHANNEL");
	this:RegisterEvent("CHAT_MSG_WHISPER");
	this:RegisterEvent("WHO_LIST_UPDATE");
	this:RegisterEvent("PLAYER_REGEN_ENABLED");
	this:RegisterEvent("PLAYER_REGEN_DISABLED");
end

function filterPunctuation( s )
	s = string.lower(s)
	local newString = ""
	for i = 1, string.len(s) do
		if string.find(string.sub(s, i, i), "%p") ~= nil then
			newString = newString .. " "
		elseif string.find(string.sub(s, i, i), "%d") ~= nil then
			--nothing needed here
		else
			newString = newString .. string.sub(s, i, i)
		end
	end
	return newString
end

local function vQueue_hostlistNameFieldUpdate()
	local minLvl = tonumber(vQueueFrame.hostlistLevelField:GetText()) or 0
	local needMates = (healerSelected and damageSelected and tankSelected) and "need all" or ""
	if needMates == "" then
		needMates =  tankSelected and "tank" or ""
		needMates = (healerSelected and tankSelected and ( needMates .. ", heal")) or (healerSelected and "heal") or needMates
		needMates = (damageSelected and (tankSelected or healerSelected)) and ( needMates .. ", dps") or (damageSelected and "dps") or needMates
		needMates = needMates ~= "" and ("need ".. needMates) or ""
	end
	vQueueFrame.hostlistNameField:SetText("LFM " .. string.upper(titleDung) .. " - " .. minLvl .. "+ "..needMates)
end

function vQueue_OnEvent(event)
	if event == "ADDON_LOADED" and arg1 == "vQueue" then
		findTimer = GetTime() - 10
		if MinimapPos == nil or type(MinimapPos) == "number" then
			MinimapPos = {}
			MinimapPos.x, MinimapPos.y = {-180,-17}
		end
		if vQueueOptions == nil then
			vQueueOptions = {}
		end
		if vQueueOptions["filter"] == nil then
			vQueueOptions["filter"] = false
		end
		if vQueueOptions["general"] == nil then
			vQueueOptions["general"] = true
		end
		if vQueueOptions["trade"] == nil then
			vQueueOptions["trade"] = true
		end
		if vQueueOptions["lfg"] == nil then
			vQueueOptions["lfg"] = true
		end
		if vQueueOptions["world"] == nil then
			vQueueOptions["world"] = true
		end
		if vQueueOptions["onlylfg"] == nil then
			vQueueOptions["onlylfg"] = true
		end
		if selectedRole ==  nil then selectedRole = "" end
		if isFinding == nil then isFinding = true end
		if notCaught == nil then notCaught = {} end
		categories[L["Miscellaneous"]] =
		{
			expanded = false,
			L["Misc"]..":misc"
		}
		categories[L["Raids"]] =
		{
			expanded = false,
			BZ["Upper Blackrock Spire"]..":ubrs",
			BZ["Onyxia's Lair"]..":ony",
			BZ["Zul'Gurub"]..":zg",
			BZ["Molten Core"]..":mc",
			BZ["Ruins of Ahn'Qiraj"]..":ruins",
			BZ["Blackwing Lair"]..":bwl",
			BZ["Temple of Ahn'Qiraj"]..":temple",
			BZ["Naxxramas"]..":naxx"
		}
		categories[L["Battlegrounds"]] =
		{
			expanded = false,
			BZ["Warsong Gulch"]..":wsg",
			BZ["Arathi Basin"]..":ab",
			BZ["Alterac Valley"]..":av"
		
		}
		categories[L["Dungeons"]] = 
		{
			expanded = false,
			BZ["Ragefire Chasm"]..":rfc",
			BZ["The Deadmines"]..":dead",
			BZ["Wailing Caverns"]..":wc",
			BZ["Shadowfang Keep"]..":sfk",
			BZ["The Stockade"]..":stock",
			BZ["Blackfathom Deeps"]..":bfd",
			BZ["Gnomeregan"]..":gnomer",
			BZ["Razorfen Kraul"]..":rfk",
			L["The Graveyard"]..":graveyard",
			L["The Library"]..":library",
			L["The Armory"]..":armory",
			L["The Cathedral"]..":cathedral",
			BZ["Razorfen Downs"]..":rfd",
			BZ["Uldaman"]..":ulda",
			BZ["Zul'Farrak"]..":zf",
			BZ["Maraudon"]..":mara",
			BZ["The Temple of Atal'Hakkar"]..":st",
			BZ["Blackrock Depths"]..":brd",
			BZ["Lower Blackrock Spire"]..":lbrs",
			BZ["Dire Maul"]..":dem",
			BZ["Stratholme"]..":strat",
			BZ["Scholomance"]..":scholo"
		}
		categories[L["Quest Groups"]] =
		{
			expanded = false,
			L["Quests"].." 1-10:quest110",
			L["Quests"].." 10-20:quest1020",
			L["Quests"].." 20-30:quest2030",
			L["Quests"].." 30-40:quest3040",
			L["Quests"].." 40-50:quest4050",
			L["Quests"].." 50-60:quest5060"
		}
		
		for k, v in pairs(categories) do
			for kk, vv in pairs(categories[k]) do
				if type(vv) == "string" then
					args = split(vv, "\:")
					if args[2] ~= nil then
						groups[args[2]] = {}
					end
				end
			end
		end
		groups["waitlist"] = {}
		
		playersQueued = 
		{

		}
		local vQueueFrameBackdrop = {
		  -- path to the background texture
		  bgFile = "Interface\\AddOns\\vQueue\\media\\white",  
		  -- path to the border texture
		  edgeFile = "Interface\\AddOns\\vQueue\\media\\border",
		  -- true to repeat the background texture to fill the frame, false to scale it
		  tile = true,
		  -- size (width or height) of the square repeating background tiles (in pixels)
		  tileSize = 8,
		  -- thickness of edge segments and square size of edge corners (in pixels)
		  edgeSize = 12,
		  -- distance from the edges of the frame to those of the background texture (in pixels)
		  insets = {
			left = 1,
			right = 1,
			top = 1,
			bottom = 1
		  }
		}
		local s = {}
		if GetLocale() == "deDE" then
			s = { w = 644, h = 395,
			      catList 			= { w = 168, h = 355},
 			      optionsFrame 		= { w = 300 , h = 130 },
			      hostlistFindButton 	= { x = -115, y = 20},
			      filterCheckOnlyFilter 	= { fs = 8 },
  			    }
		else
			s = { w = 614, h = 395,
			      catList 			= { w = 138, h = 355},
			      optionsFrame 		= { w = 200 , h = 130 },
			      hostlistFindButton 	= { x = -65, y = 20},
			      filterCheckOnlyFilter 	= { fs = 10 },
  			    }
		end
			
		vQueueFrame = CreateFrame("Frame", UIParent)
		vQueueFrame:SetWidth(s.w)
		vQueueFrame:SetHeight(s.h)
		vQueueFrame:ClearAllPoints()
		vQueueFrame:SetPoint("CENTER", UIParent,"CENTER") 
		vQueueFrame:SetMovable(true)
		vQueueFrame:EnableMouse(true)
		vQueueFrame:SetBackdrop(vQueueFrameBackdrop)
		vQueueFrame:SetBackdropColor(15/255, 15/255, 15/255, 0.7)
		vQueueFrame:SetScript("OnMouseDown", function(self, button)
			vQueueFrame:StartMoving()
			vQueueFrame.hostlistNameField:ClearFocus()
			vQueueFrame.hostlistLevelField:ClearFocus()
			if vQueueDB.isHost or isFinding then
				vQueueFrame.hostlistRoleText:SetText("")
			end
		end)
		vQueueFrame:SetScript("OnMouseUp", function(self, button)
			vQueueFrame:StopMovingOrSizing()
		end)
		vQueueFrame:SetScript("OnHide", function()
			vQueueFrame.catList:Hide()
			vQueueFrame.hostlist:Hide()
		end)
		vQueueFrame:SetScript("OnShow", function()
			vQueue_UpdateHostScroll(scrollbar:GetValue())
			vQueue_updateCatColors()
		end)
		
		vQueueFrame.closeButtonX = CreateFrame("Button", "vQueueButton", vQueueFrame,"UIPanelCloseButton")
		vQueueFrame.closeButtonX:SetPoint("TOPRIGHT", vQueueFrame, "TOPRIGHT", 2, 2)
		vQueueFrame.closeButtonX:SetScript("OnClick", function()
			vQueueFrame:Hide()
			vQueueFrame.catList:Hide()
			vQueueFrame.hostlist:Hide()
			vQueueDB.FrameShown = false
		end)
		
		vQueueFrame.closeButton = vQueue_newButton(vQueueFrame, 10)
		vQueueFrame.closeButton:SetPoint("BOTTOMRIGHT", vQueueFrame, "BOTTOMRIGHT", -6, 3)
		vQueueFrame.closeButton:SetText(CLOSE)
		vQueueFrame.closeButton:SetWidth(vQueueFrame.closeButton:GetTextWidth()+4)
		vQueueFrame.closeButton:SetScript("OnClick", function()
			vQueueFrame:Hide()
			vQueueFrame.catList:Hide()
			vQueueFrame.hostlist:Hide()
			vQueueDB.FrameShown = false
		end)
		
		vQueueFrame.optionsButton = vQueue_newButton(vQueueFrame, 10)
		vQueueFrame.optionsButton:SetPoint("BOTTOMLEFT", vQueueFrame, "BOTTOMLEFT", 6, 3)
		vQueueFrame.optionsButton:SetText(L["Options"])
		vQueueFrame.optionsButton:SetWidth(vQueueFrame.optionsButton:GetTextWidth()+3)
		vQueueFrame.optionsButton:SetScript("OnMouseDown", function()
			if vQueueFrame.optionsFrame:IsShown() then
				vQueueFrame.optionsFrame:Hide()
			else
				vQueueFrame.optionsFrame:Show()
			end
		end)
		
		vQueueFrame.catList = CreateFrame("ScrollFrame", vQueueFrame)
		vQueueFrame.catList:ClearAllPoints()
		vQueueFrame.catList:SetPoint("LEFT", vQueueFrame, "LEFT", 5, -5)
		vQueueFrame.catList:SetWidth(s.catList.w)
		vQueueFrame.catList:SetHeight(s.catList.h)
		vQueueFrame.catList:EnableMouseWheel(true)
		vQueueFrame.catList:SetBackdrop(vQueueFrameBackdrop)
		vQueueFrame.catList:SetBackdropColor(20/255, 20/255, 20/255, 0.9)
		vQueueFrame.catList:SetScript("OnMouseWheel", function()
			if arg1 == 1 then
				scrollbarCat:SetValue(scrollbarCat:GetValue()-1)
			elseif arg1 == -1 then
				scrollbarCat:SetValue(scrollbarCat:GetValue()+1)
			end
			realScroll = true
		end)
		
		vQueueFrame.hostlist = CreateFrame("ScrollFrame", vQueueFrame)
		vQueueFrame.hostlist:ClearAllPoints()
		vQueueFrame.hostlist:SetPoint("RIGHT", vQueueFrame, "RIGHT", -5, -5)
		vQueueFrame.hostlist:SetWidth(465)
		vQueueFrame.hostlist:SetHeight(355)
		vQueueFrame.hostlist:EnableMouseWheel(true)
		vQueueFrame.hostlist:SetBackdrop(vQueueFrameBackdrop)
		vQueueFrame.hostlist:SetBackdropColor(20/255, 20/255, 20/255, 0.9)
		vQueueFrame.hostlist:SetScript("OnMouseWheel", function(self, delta)
			if arg1 == 1 then
				scrollbar:SetValue(scrollbar:GetValue()-1)
			elseif arg1 == -1 then
				scrollbar:SetValue(scrollbar:GetValue()+1)
			end
		end)
		CreateFrame( "GameTooltip", "groupToolTip", nil, "GameTooltipTemplate" ); -- Tooltip name cannot be nil
		CreateFrame( "GameTooltip", "playerQueueToolTip", nil, "GameTooltipTemplate" ); -- Tooltip name cannot be nil
		hostListFrame = vQueueFrame.hostlist
		
		vQueueFrame.hostlistTopSection = CreateFrame("Frame", nil, vQueueFrame.hostlist)
		vQueueFrame.hostlistTopSection:ClearAllPoints()
		vQueueFrame.hostlistTopSection:SetPoint("TOPLEFT", vQueueFrame.hostlist, "TOPLEFT", 0 , 0)
		vQueueFrame.hostlistTopSection:SetWidth(vQueueFrame.hostlist:GetWidth())
		vQueueFrame.hostlistTopSection:SetHeight(vQueueFrame.hostlist:GetHeight() * 1/5)
		vQueueFrame.hostlistTopSection:SetBackdrop(vQueueFrameBackdrop)
		vQueueFrame.hostlistTopSection:SetBackdropColor(10/255, 10/255, 10/255, 0.4)
		vQueueFrame.hostlistTopSection:SetFrameLevel(2)
		
		vQueueFrame.hostlistTopSectionBg = vQueueFrame.hostlistTopSection:CreateTexture(nil, "BACKGROUND")
		vQueueFrame.hostlistTopSectionBg:SetTexture(0, 0, 0, 0)
		vQueueFrame.hostlistTopSectionBg:SetPoint("BOTTOMLEFT", vQueueFrame.hostlistTopSection, "BOTTOMLEFT", 1, 1)
		vQueueFrame.hostlistTopSectionBg:SetWidth(vQueueFrame.hostlistTopSection:GetWidth()-2)
		vQueueFrame.hostlistTopSectionBg:SetHeight(vQueueFrame.hostlistTopSection:GetHeight()-2)
		
		vQueueFrame.hostlistBotShadow = vQueueFrame.hostlistTopSection:CreateTexture(nil, "OVERLAY")
		vQueueFrame.hostlistBotShadow:SetTexture(0, 0, 0, 1)
		vQueueFrame.hostlistBotShadow:SetPoint("BOTTOM", vQueueFrame.hostlist, "BOTTOM", 0, 1)
		vQueueFrame.hostlistBotShadow:SetWidth(vQueueFrame.hostlist:GetWidth())
		vQueueFrame.hostlistBotShadow:SetHeight(40)
		vQueueFrame.hostlistBotShadow:SetGradientAlpha("VERTICAL", 0, 0, 0, 1, 0, 0, 0, 0)
		vQueueFrame.hostlistBotShadow:Hide()
		
		vQueueFrame.catlistBotShadow = CreateFrame("Frame", nil, vQueueFrame.catList)
		vQueueFrame.catlistBotShadow:SetAllPoints()
		vQueueFrame.catlistBotShadow:SetWidth(vQueueFrame.catList:GetWidth())
		vQueueFrame.catlistBotShadow:SetHeight(vQueueFrame.catList:GetHeight())
		vQueueFrame.catlistBotShadow:SetFrameLevel(2)
		
		vQueueFrame.catlistBotShadowbg = vQueueFrame.catlistBotShadow:CreateTexture(nil, "OVERLAY")
		vQueueFrame.catlistBotShadowbg:SetTexture(0, 0, 0, 1)
		vQueueFrame.catlistBotShadowbg:SetPoint("BOTTOM", vQueueFrame.catList, "BOTTOM", 0, 1)
		vQueueFrame.catlistBotShadowbg:SetWidth(vQueueFrame.catList:GetWidth())
		vQueueFrame.catlistBotShadowbg:SetHeight(40)
		vQueueFrame.catlistBotShadowbg:SetGradientAlpha("VERTICAL", 0, 0, 0, 1, 0, 0, 0, 0)
		
		--hostframe waitlist header strings
		vQueueFrame.hostTitle = CreateFrame("Button", "vQueueButton", vQueueFrame.hostlist)
		vQueueFrame.hostTitle:ClearAllPoints()
		vQueueFrame.hostTitle:SetPoint("TOPLEFT", vQueueFrame.hostlist, "TOPLEFT", 0 , -vQueueFrame.hostlistTopSection:GetHeight()-2)
		vQueueFrame.hostTitle:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.hostTitle:SetText(NAME)
		vQueueFrame.hostTitle:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.hostTitle:SetPushedTextOffset(0,0)
		vQueueFrame.hostTitle:SetWidth(vQueueFrame.hostTitle:GetTextWidth())
		vQueueFrame.hostTitle:SetHeight(vQueueFrame.hostTitle:GetTextHeight())
		vQueueFrame.hostTitle:Hide()
		
		vQueueFrame.hostTitleLevel = CreateFrame("Button", "vQueueButton", vQueueFrame.hostlist)
		vQueueFrame.hostTitleLevel:ClearAllPoints()
		vQueueFrame.hostTitleLevel:SetPoint("TOPLEFT", vQueueFrame.hostlist, "TOPLEFT", 149, -vQueueFrame.hostlistTopSection:GetHeight() - 2)
		vQueueFrame.hostTitleLevel:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.hostTitleLevel:SetText(LEVEL)
		vQueueFrame.hostTitleLevel:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.hostTitleLevel:SetPushedTextOffset(0,0)
		vQueueFrame.hostTitleLevel:SetWidth(vQueueFrame.hostTitleLevel:GetTextWidth())
		vQueueFrame.hostTitleLevel:SetHeight(vQueueFrame.hostTitleLevel:GetTextHeight())
		vQueueFrame.hostTitleLevel:Hide()
		
		
		vQueueFrame.hostTitleClass = CreateFrame("Button", "vQueueButton", vQueueFrame.hostlist)
		vQueueFrame.hostTitleClass:ClearAllPoints()
		vQueueFrame.hostTitleClass:SetPoint("TOPLEFT", vQueueFrame.hostlist, "TOPLEFT", 245, -vQueueFrame.hostlistTopSection:GetHeight() - 2)
		vQueueFrame.hostTitleClass:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.hostTitleClass:SetText(CLASS)
		vQueueFrame.hostTitleClass:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.hostTitleClass:SetPushedTextOffset(0,0)
		vQueueFrame.hostTitleClass:SetWidth(vQueueFrame.hostTitleClass:GetTextWidth())
		vQueueFrame.hostTitleClass:SetHeight(vQueueFrame.hostTitleClass:GetTextHeight())
		vQueueFrame.hostTitleClass:Hide()
		
		vQueueFrame.hostTitleRole = CreateFrame("Button", "vQueueButton", vQueueFrame.hostlist)
		vQueueFrame.hostTitleRole:SetPoint("TOPLEFT", vQueueFrame.hostlist, "TOPLEFT", 320, -vQueueFrame.hostlistTopSection:GetHeight() - 2)
		vQueueFrame.hostTitleRole:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.hostTitleRole:SetText(L["Role"])
		vQueueFrame.hostTitleRole:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.hostTitleRole:SetPushedTextOffset(0,0)
		vQueueFrame.hostTitleRole:SetWidth(vQueueFrame.hostTitleRole:GetTextWidth())
		vQueueFrame.hostTitleRole:SetHeight(vQueueFrame.hostTitleRole:GetTextHeight())
		vQueueFrame.hostTitleRole:Hide()	
		-----------------------------------------------------------------
		
		--hostframe find header strings
		vQueueFrame.hostTitleFindName = CreateFrame("Button", "vQueueButton", vQueueFrame.hostlist)
		vQueueFrame.hostTitleFindName:ClearAllPoints()
		vQueueFrame.hostTitleFindName:SetPoint("TOPLEFT", vQueueFrame.hostlist, "TOPLEFT", 0, -vQueueFrame.hostlistTopSection:GetHeight() - 2)
		vQueueFrame.hostTitleFindName:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.hostTitleFindName:SetText(L["Title"])
		vQueueFrame.hostTitleFindName:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.hostTitleFindName:SetPushedTextOffset(0,0)
		vQueueFrame.hostTitleFindName:SetWidth(vQueueFrame.hostTitleFindName:GetTextWidth())
		vQueueFrame.hostTitleFindName:SetHeight(vQueueFrame.hostTitleFindName:GetTextHeight())
		
		vQueueFrame.hostTitleFindLeader = CreateFrame("Button", "vQueueButton", vQueueFrame.hostlist)
		vQueueFrame.hostTitleFindLeader:ClearAllPoints()
		vQueueFrame.hostTitleFindLeader:SetPoint("TOPLEFT", vQueueFrame.hostlist, "TOPLEFT", 209, -vQueueFrame.hostlistTopSection:GetHeight() - 2)
		vQueueFrame.hostTitleFindLeader:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.hostTitleFindLeader:SetText(L["Leader"])
		vQueueFrame.hostTitleFindLeader:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.hostTitleFindLeader:SetPushedTextOffset(0,0)
		vQueueFrame.hostTitleFindLeader:SetWidth(vQueueFrame.hostTitleFindLeader:GetTextWidth())
		vQueueFrame.hostTitleFindLeader:SetHeight(vQueueFrame.hostTitleFindLeader:GetTextHeight())
		
		vQueueFrame.hostTitleFindLevel = CreateFrame("Button", "vQueueButton", vQueueFrame.hostlist)
		vQueueFrame.hostTitleFindLevel:ClearAllPoints()
		vQueueFrame.hostTitleFindLevel:SetPoint("TOPLEFT", vQueueFrame.hostlist, "TOPLEFT", 278, -vQueueFrame.hostlistTopSection:GetHeight() - 2)
		vQueueFrame.hostTitleFindLevel:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.hostTitleFindLevel:SetText(L["Level"])
		vQueueFrame.hostTitleFindLevel:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.hostTitleFindLevel:SetPushedTextOffset(0,0)
		vQueueFrame.hostTitleFindLevel:SetWidth(vQueueFrame.hostTitleFindLevel:GetTextWidth())
		vQueueFrame.hostTitleFindLevel:SetHeight(vQueueFrame.hostTitleFindLevel:GetTextHeight())
		
		vQueueFrame.hostTitleFindSize = CreateFrame("Button", "vQueueButton", vQueueFrame.hostlist)
		vQueueFrame.hostTitleFindSize:ClearAllPoints()
		vQueueFrame.hostTitleFindSize:SetPoint("TOPLEFT", vQueueFrame.hostlist, "TOPLEFT", 312, -vQueueFrame.hostlistTopSection:GetHeight() - 2)
		vQueueFrame.hostTitleFindSize:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.hostTitleFindSize:SetText(L["Size"])
		vQueueFrame.hostTitleFindSize:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.hostTitleFindSize:SetPushedTextOffset(0,0)
		vQueueFrame.hostTitleFindSize:SetWidth(vQueueFrame.hostTitleFindLeader:GetTextWidth())
		vQueueFrame.hostTitleFindSize:SetHeight(vQueueFrame.hostTitleFindLeader:GetTextHeight())
		
		vQueueFrame.hostTitleFindRoles = CreateFrame("Button", "vQueueButton", vQueueFrame.hostlist)
		vQueueFrame.hostTitleFindRoles:ClearAllPoints()
		vQueueFrame.hostTitleFindRoles:SetPoint("TOPLEFT", vQueueFrame.hostlist, "TOPLEFT", 361, -vQueueFrame.hostlistTopSection:GetHeight() - 2)
		vQueueFrame.hostTitleFindRoles:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.hostTitleFindRoles:SetText(L["Role(s)"])
		vQueueFrame.hostTitleFindRoles:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.hostTitleFindRoles:SetPushedTextOffset(0,0)
		vQueueFrame.hostTitleFindRoles:SetWidth(vQueueFrame.hostTitleFindRoles:GetTextWidth())
		vQueueFrame.hostTitleFindRoles:SetHeight(vQueueFrame.hostTitleFindRoles:GetTextHeight())
		vQueueFrame.hostTitleFindName:Hide()
		vQueueFrame.hostTitleFindLeader:Hide()
		vQueueFrame.hostTitleFindLevel:Hide()
		vQueueFrame.hostTitleFindSize:Hide()
		vQueueFrame.hostTitleFindRoles:Hide()
		--------------------------------------------------------------------------------------------------------
		
		vQueueFrame.hostlistHeal = CreateFrame("Button", nil, vQueueFrame.hostlistTopSection)
		vQueueFrame.hostlistHeal:ClearAllPoints()
		vQueueFrame.hostlistHeal:SetPoint("RIGHT", vQueueFrame.hostlistTopSection, "RIGHT", -32, 0)
		vQueueFrame.hostlistHeal:SetWidth(32)
		vQueueFrame.hostlistHeal:SetHeight(32)
		vQueueFrame.hostlistHeal:UnlockHighlight()
		vQueueFrame.hostlistHeal:SetScript("OnMouseDown", function()
			vQueueFrame.hostlistTankCheck:Hide()
			vQueueFrame.hostlistDpsCheck:Hide()
			vQueueFrame.hostlistHealCheck:Show()
			vQueueFrame.hostlistRoleText:SetText("")
		--	vQueueFrame.hostlistHostButton:Show()
			selectedRole = "Healer"
		end)
		vQueueFrame.hostlistHeal:SetScript("OnEnter", function()
			vQueueFrame.hostlistHealTex:SetVertexColor(1, 1, 0)
		end)
		vQueueFrame.hostlistHeal:SetScript("OnLeave", function()
			vQueueFrame.hostlistHealTex:SetVertexColor(1, 1, 1)
		end)
		
		vQueueFrame.hostlistHealTex = vQueueFrame.hostlistHeal:CreateTexture(nil, "ARTWORK")
		vQueueFrame.hostlistHealTex:SetTexture("Interface\\AddOns\\vQueue\\media\\Healer")
		vQueueFrame.hostlistHealTex:SetPoint("TOP", vQueueFrame.hostlistHeal, "TOP", 0, 0)
		vQueueFrame.hostlistHealTex:SetWidth(vQueueFrame.hostlistHeal:GetWidth())
		vQueueFrame.hostlistHealTex:SetHeight(vQueueFrame.hostlistHeal:GetHeight())
		
		vQueueFrame.hostlistHealCheck = vQueueFrame.hostlistHeal:CreateTexture(nil, "OVERLAY")
		vQueueFrame.hostlistHealCheck:SetTexture("Interface\\BUTTONS\\UI-CheckBox-Check")
		vQueueFrame.hostlistHealCheck:SetVertexColor(0.1,0.8,0.1)
		vQueueFrame.hostlistHealCheck:SetAllPoints()
		
		vQueueFrame.hostlistDps = CreateFrame("Button", nil, vQueueFrame.hostlistTopSection)
		vQueueFrame.hostlistDps:SetPoint("RIGHT", vQueueFrame.hostlistTopSection, "RIGHT",  0, 0)
		vQueueFrame.hostlistDps:SetWidth(32)
		vQueueFrame.hostlistDps:SetHeight(32)
		vQueueFrame.hostlistDps:SetScript("OnMouseDown", function()
			vQueueFrame.hostlistTankCheck:Hide()
			vQueueFrame.hostlistDpsCheck:Show()
			vQueueFrame.hostlistHealCheck:Hide()
			vQueueFrame.hostlistRoleText:SetText("")
			selectedRole = "Damage"
		end)
		vQueueFrame.hostlistDps:SetScript("OnEnter", function()
			vQueueFrame.hostlistDpsTex:SetVertexColor(1, 1, 0)
		end)
		vQueueFrame.hostlistDps:SetScript("OnLeave", function()
			vQueueFrame.hostlistDpsTex:SetVertexColor(1, 1, 1)
		end)
		
		vQueueFrame.hostlistDpsTex = vQueueFrame.hostlistDps:CreateTexture(nil, "ARTWORK")
		vQueueFrame.hostlistDpsTex:SetTexture("Interface\\AddOns\\vQueue\\media\\Damage")
		vQueueFrame.hostlistDpsTex:SetPoint("TOP", vQueueFrame.hostlistDps, "TOP", 0, 0)
		vQueueFrame.hostlistDpsTex:SetWidth(vQueueFrame.hostlistDps:GetWidth())
		vQueueFrame.hostlistDpsTex:SetHeight(vQueueFrame.hostlistDps:GetHeight())
		
		vQueueFrame.hostlistDpsCheck = vQueueFrame.hostlistDps:CreateTexture(nil, "OVERLAY")
		vQueueFrame.hostlistDpsCheck:SetTexture("Interface\\BUTTONS\\UI-CheckBox-Check")
		vQueueFrame.hostlistDpsCheck:SetVertexColor(0.1,0.8,0.1)
		vQueueFrame.hostlistDpsCheck:SetAllPoints()
		
		vQueueFrame.hostlistTank = CreateFrame("Button", nil, vQueueFrame.hostlistTopSection)
		vQueueFrame.hostlistTank:SetPoint("RIGHT", vQueueFrame.hostlistTopSection, "RIGHT", -64 , 0)
		vQueueFrame.hostlistTank:SetWidth(32)
		vQueueFrame.hostlistTank:SetHeight(32)
		vQueueFrame.hostlistTank:SetScript("OnMouseDown", function()
			vQueueFrame.hostlistTankCheck:Show()
			vQueueFrame.hostlistDpsCheck:Hide()
			vQueueFrame.hostlistHealCheck:Hide()
			vQueueFrame.hostlistRoleText:SetText("")
			selectedRole = "Tank"
		end)
		vQueueFrame.hostlistTank:SetScript("OnEnter", function()
			vQueueFrame.hostlistTankTex:SetVertexColor(1, 1, 0)
		end)
		vQueueFrame.hostlistTank:SetScript("OnLeave", function()
			vQueueFrame.hostlistTankTex:SetVertexColor(1, 1, 1)
		end)
				
		vQueueFrame.hostlistTankTex = vQueueFrame.hostlistTank:CreateTexture(nil, "ARTWORK")
		vQueueFrame.hostlistTankTex:SetTexture("Interface\\AddOns\\vQueue\\media\\Tank")
		vQueueFrame.hostlistTankTex:SetPoint("TOP", vQueueFrame.hostlistTank, "TOP", 0, 0)
		vQueueFrame.hostlistTankTex:SetWidth(vQueueFrame.hostlistTank:GetWidth())
		vQueueFrame.hostlistTankTex:SetHeight(vQueueFrame.hostlistTank:GetHeight())
		
		vQueueFrame.hostlistTankCheck = vQueueFrame.hostlistTank:CreateTexture(nil, "OVERLAY")
		vQueueFrame.hostlistTankCheck:SetTexture("Interface\\BUTTONS\\UI-CheckBox-Check")
		vQueueFrame.hostlistTankCheck:SetVertexColor(0.1,0.8,0.1)
		vQueueFrame.hostlistTankCheck:SetAllPoints()
		
		vQueueFrame.hostlistRoleText = CreateFrame("Button", nil, vQueueFrame.hostlistTopSection)
		vQueueFrame.hostlistRoleText:ClearAllPoints()
		vQueueFrame.hostlistRoleText:SetPoint("CENTER", vQueueFrame.hostlistTopSection, "CENTER", 0, 54)
		vQueueFrame.hostlistRoleText:EnableMouse(false)
		vQueueFrame.hostlistRoleText:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
		vQueueFrame.hostlistRoleText:SetText(L["(Select a role to start finding)"])
		vQueueFrame.hostlistRoleText:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.hostlistRoleText:SetWidth(vQueueFrame.hostlistRoleText:GetTextWidth())
		vQueueFrame.hostlistRoleText:SetHeight(vQueueFrame.hostlistRoleText:GetTextHeight())
		vQueueFrame.hostlistRoleText:SetScript("OnUpdate", function()
			this:SetWidth(vQueueFrame.hostlistRoleText:GetTextWidth())
			this:SetHeight(vQueueFrame.hostlistRoleText:GetTextHeight())
		end)
		
		if selectedRole == "Healer" then
			vQueueFrame.hostlistTankCheck:Hide()
			vQueueFrame.hostlistDpsCheck:Hide()
			vQueueFrame.hostlistHealCheck:Show()
			vQueueFrame.hostlistRoleText:SetText("")
		elseif selectedRole == "Damage" then
			vQueueFrame.hostlistTankCheck:Hide()
			vQueueFrame.hostlistDpsCheck:Show()
			vQueueFrame.hostlistHealCheck:Hide()
			vQueueFrame.hostlistRoleText:SetText("")
		elseif selectedRole == "Tank" then
			vQueueFrame.hostlistTankCheck:Show()
			vQueueFrame.hostlistDpsCheck:Hide()
			vQueueFrame.hostlistHealCheck:Hide()
			vQueueFrame.hostlistRoleText:SetText("")
		end
		
-- Sven Button

		vQueueFrame.watchListButton = vQueue_newButton(vQueueFrame.hostlistTopSection, 10)
		vQueueFrame.watchListButton:SetPoint("BOTTOMLEFT", vQueueFrame.hostlistTopSection, "BOTTOMLEFT", 3, 5)
		vQueueFrame.watchListButton:SetText(L["Notify about groups"])
		vQueueFrame.watchListButton:SetWidth(vQueueFrame.watchListButton:GetTextWidth()+30)
		vQueueFrame.watchListButton:SetScript("OnClick", function()
			if not string.find(notifyForDungeon,selectedQuery) then
			titleDung = selectedQuery
				notifyForDungeon = notifyForDungeon == "" and titleDung or notifyForDungeon .. "/" .. titleDung
			vQueueFrame.watchListButton:SetText(L["Notified for "] .. notifyForDungeon)
				vQueueFrame.watchListButton:SetWidth(vQueueFrame.watchListButton:GetTextWidth()+30)
			vQueueFrame.clearNotifyButton:Show()
			end
		end)

		vQueueFrame.clearNotifyButton = vQueue_newButton(vQueueFrame.hostlistTopSection, 10)
		vQueueFrame.clearNotifyButton:SetPoint("BOTTOMLEFT", vQueueFrame.watchListButton, "BOTTOMRIGHT", 0, 0)
		vQueueFrame.clearNotifyButton:SetText(L["Clear"])
		vQueueFrame.clearNotifyButton:SetWidth(vQueueFrame.clearNotifyButton:GetTextWidth()+10)
		vQueueFrame.clearNotifyButton:SetScript("OnClick", function()
			notifyForDungeon = ""
			vQueueFrame.watchListButton:SetText(L["Notify about groups"])
			vQueueFrame.watchListButton:SetWidth(vQueueFrame.watchListButton:GetTextWidth()+30)
			vQueueFrame.clearNotifyButton:Hide()
		end)
		vQueueFrame.clearNotifyButton:Hide()

		vQueueFrame.watchListButton:SetScript("OnEnter", function()
			playerQueueToolTip:SetOwner( this, "ANCHOR_CURSOR" );
			playerQueueToolTip:AddLine(L["Don't forget to choose role on the right side"], 1, 1, 1, 1)
			playerQueueToolTip:Show()
		end)

		vQueueFrame.clearNotifyButton:SetScript("OnEnter", function()
			playerQueueToolTip:SetOwner( this, "ANCHOR_CURSOR" );
			playerQueueToolTip:AddLine(L["Clears the search, you will not be notified anymore"], 1, 1, 1, 1)
			playerQueueToolTip:Show()
		end)

		vQueueFrame.watchListButton:SetScript("OnLeave", function()
			playerQueueToolTip:Hide()
		end)

		vQueueFrame.clearNotifyButton:SetScript("OnLeave", function()
			playerQueueToolTip:Hide()
		end)

-- Sven Button Ende
		
		vQueueFrame.hostlistHostButton = vQueue_newButton(vQueueFrame.hostlistTopSection, 10)
		vQueueFrame.hostlistHostButton:SetPoint("BOTTOMRIGHT", vQueueFrame.hostlistTopSection, "BOTTOMRIGHT", -3, 5)
		vQueueFrame.hostlistHostButton:SetText(L["Start new group"])
		vQueueFrame.hostlistHostButton:SetWidth(vQueueFrame.hostlistHostButton:GetTextWidth()+10)
		vQueueFrame.hostlistHostButton:SetScript("OnClick", function()
			if UnitLevel("player") < 5 then 
				vQueueFrame.hostlistRoleText:SetText(L["(You must be at least level 5 to use this)"])
				return
			end
			titleDung = selectedQuery
			titleDung = (selectedQuery == "dead" and "VC") or (selectedQuery == "dem" and "DM") or selectedQuery
			
			vQueueFrame.hostlistHostButton:Hide()
			vQueueDB.isWaitListShown = true
			vQueueFrame.hostTitleFindName:Hide()
			vQueueFrame.hostTitleFindLeader:Hide()
			vQueueFrame.hostTitleFindLevel:Hide()
			vQueueFrame.hostTitleFindSize:Hide()
			vQueueFrame.hostTitleFindRoles:Hide()
			vQueueFrame.hostlistLevelField:SetText(getglobal("MINLVLS")[selectedQuery])
			vQueueFrame.hostlistLevelField:Show()
			vQueueFrame.hostlistNameField:Show()
			vQueueFrame.hostlistCreateButton:Show()
			vQueueFrame.hostlistCancelButton:Show()
			vQueueFrame.hostlistCreateButton:SetText(L["Create group"])
			scrollbar:SetValue(1)
			hostedCategory = selectedQuery
			prevSelected = selectedQuery
			selectedQuery = "waitlist"
			vQueue_hostlistNameFieldUpdate()
			vQueue_ShowGroups(selectedQuery, prevSelected)
		end)
		vQueueFrame.hostlistHostButton:SetScript("OnEnter", function()
			playerQueueToolTip:SetOwner( this, "ANCHOR_CURSOR" );
			playerQueueToolTip:AddLine(L["Find players for"], 1, 1, 1, 1)
			playerQueueToolTip:AddLine(realHostedCategory, vQueueColors["GREEN"][1], vQueueColors["GREEN"][2], vQueueColors["GREEN"][3], 1)
			playerQueueToolTip:Show()
		end)
		vQueueFrame.hostlistHostButton:SetScript("OnLeave", function()
			playerQueueToolTip:Hide()
		end)
		
		vQueueFrame.hostlistEditButton = vQueue_newButton(vQueueFrame.hostlistTopSection, 10)
		vQueueFrame.hostlistEditButton:SetPoint("BOTTOMRIGHT", vQueueFrame.hostlistTopSection, "BOTTOMRIGHT", -3, 5)
		vQueueFrame.hostlistEditButton:SetText(L["Edit group"])
		vQueueFrame.hostlistEditButton:SetWidth(vQueueFrame.hostlistEditButton:GetTextWidth()+5)
		vQueueFrame.hostlistEditButton:SetScript("OnClick", function()
			vQueueFrame.hostlistEditButton:Hide()
			vQueueDB.isWaitListShown = true
			scrollbar:SetValue(1)
			prevSelected = selectedQuery
			selectedQuery = "waitlist"
			vQueue_ShowGroups(selectedQuery, prevSelected)
			vQueueFrame.hostTitleFindName:Hide()
			vQueueFrame.hostTitleFindLeader:Hide()
			vQueueFrame.hostTitleFindLevel:Hide()
			vQueueFrame.hostTitleFindSize:Hide()
			vQueueFrame.hostTitleFindRoles:Hide()
			vQueueFrame.hostlistLevelField:Show()
			vQueueFrame.hostlistNameField:Show()
			vQueueFrame.hostlistCreateButton:Show()
			vQueueFrame.hostlistBotShadow:SetHeight(400)
			vQueueFrame.hostlistBotShadow:Show()
			vQueueFrame.hostlistCreateButton:SetText(SAVE)
		end)
		vQueueFrame.hostlistEditButton:Hide()
		
		vQueueFrame.hostlistUnlistButton = vQueue_newButton(vQueueFrame.hostlistTopSection, 10)
		vQueueFrame.hostlistUnlistButton:SetPoint("TOPRIGHT", vQueueFrame.hostlistTopSection, "TOPRIGHT", -3, -5)
		vQueueFrame.hostlistUnlistButton:SetText(L["Unlist group"])
		vQueueFrame.hostlistUnlistButton:SetWidth(vQueueFrame.hostlistUnlistButton:GetTextWidth()+5)
		vQueueFrame.hostlistUnlistButton:SetScript("OnClick", function()
			vQueueFrame.hostlistEditButton:Hide()
			vQueueFrame.hostlistWaitListButton:Hide()
			this:Hide()
			vQueueFrame.hostlistLevelField:Hide()
			vQueueFrame.hostlistNameField:Hide()
			vQueueFrame.hostlistCreateButton:Hide()
			vQueueDB.isHost = false
			vQueueDB.isWaitListShown = false
			vQueueFrame.hostTitle:Hide()
			vQueueFrame.hostTitleRole:Hide()
			vQueueFrame.hostTitleClass:Hide()
			vQueueFrame.hostTitleLevel:Hide()
			vQueueFrame.topsectionHostName:Hide()
			if selectedQuery == "waitlist" then selectedQuery = hostedCategory end
			scrollbar:SetValue(1)
			vQueue_ShowGroups(selectedQuery, "waitlist")
			groups["waitlist"] = {}
			vQueueFrame.hostlistRoleText:SetText("")
			vQueueFrame.hostlistHostButton:Show()
			vQueueFrame.hostTitleFindName:Show()
			vQueueFrame.hostTitleFindLeader:Show()
			vQueueFrame.hostTitleFindLevel:Show()
			vQueueFrame.hostTitleFindSize:Show()
			vQueueFrame.hostTitleFindRoles:Show()
		end)
		vQueueFrame.hostlistUnlistButton:Hide()
		
		vQueueFrame.hostlistWaitListButton = vQueue_newButton(vQueueFrame.hostlistTopSection, 10)
		vQueueFrame.hostlistWaitListButton:SetPoint("BOTTOMRIGHT", vQueueFrame.hostlistUnlistButton, "BOTTOMLEFT", -10, 0)
		vQueueFrame.hostlistWaitListButton:SetText(L["Wait list"])
		vQueueFrame.hostlistWaitListButton:SetWidth(vQueueFrame.hostlistWaitListButton:GetTextWidth()+10)
		vQueueFrame.hostlistWaitListButton:SetScript("OnClick", function()
			vQueueFrame.topsectiontitle:SetText(realHostedCategory .. "(" .. getglobal("MINLVLS")[hostedCategory] .. ")")
			vQueueFrame.topsectiontitle:SetWidth(vQueueFrame.topsectiontitle:GetTextWidth())
			vQueueFrame.topsectiontitle:SetHeight(vQueueFrame.topsectiontitle:GetTextHeight())
			if not vQueueFrame.hostlistTopSectionBg:SetTexture("Interface\\AddOns\\vQueue\\media\\" .. hostedCategory) then
				vQueueFrame.hostlistTopSectionBg:SetTexture(0, 0, 0, 0)
			end
			for k, v in pairs(catListButtons) do
				if trim(split(v:GetText(), "%[")[1]) == realHostedCategory then
					vQueueFrame.catListHighlight:SetParent(v)
					vQueueFrame.catListHighlight:SetPoint("LEFT", v, "LEFT", -11, 0)
					vQueueFrame.catListHighlight:Show()
				end
			end
			vQueueDB.isWaitListShown = true
			vQueueFrame.hostTitle:Show()
			vQueueFrame.hostTitleRole:Show()
			vQueueFrame.hostTitleClass:Show()
			vQueueFrame.hostTitleLevel:Show()
			vQueueFrame.topsectionHostName:Show()
			scrollbar:SetValue(1)
			prevSelected = selectedQuery
			selectedQuery = "waitlist"
			vQueue_ShowGroups(selectedQuery, prevSelected)
			vQueueFrame.hostTitleFindName:Hide()
			vQueueFrame.hostTitleFindLeader:Hide()
			vQueueFrame.hostTitleFindLevel:Hide()
			vQueueFrame.hostTitleFindSize:Hide()
			vQueueFrame.hostTitleFindRoles:Hide()
		end)
		vQueueFrame.hostlistWaitListButton:SetScript("OnUpdate", function()
			this:SetText(L["Wait list"] .. "(" .. tablelength(groups["waitlist"]) .. ")")
			this:SetWidth(this:GetTextWidth()+10)
		end)
		vQueueFrame.hostlistWaitListButton:Hide()
		
		vQueueFrame.optionsFrame = CreateFrame("Frame", nil, vQueueFrame)
		vQueueFrame.optionsFrame:SetWidth(s.optionsFrame.w)
		vQueueFrame.optionsFrame:SetHeight(s.optionsFrame.h)
		vQueueFrame.optionsFrame:SetPoint("BOTTOM", vQueueFrame, "TOP")
		vQueueFrame.optionsFrame:SetBackdrop(vQueueFrameBackdrop)
		vQueueFrame.optionsFrame:SetBackdropColor(10/255, 10/255, 10/255, 0.8)
		vQueueFrame.optionsFrame:EnableMouse(true)
		vQueueFrame.optionsFrame:SetMovable(true)
		vQueueFrame.optionsFrame:SetFrameLevel(4)
		vQueueFrame.optionsFrame:SetClampedToScreen(true)
		vQueueFrame.optionsFrame:SetScript("OnMouseDown", function()
			this:StartMoving()
		end)
		vQueueFrame.optionsFrame:SetScript("OnMouseUp", function()
			this:StopMovingOrSizing()
		end)
		vQueueFrame.optionsFrame:Hide()
		
		vQueueFrame.hostlistFindButton = CreateFrame("CheckButton", "findButtonCheck", vQueueFrame.optionsFrame, "UICheckButtonTemplate");
		vQueueFrame.hostlistFindButton:SetPoint("BOTTOMRIGHT", vQueueFrame.optionsFrame, "BOTTOMRIGHT", s.hostlistFindButton.x, s.hostlistFindButton.y)
		getglobal(vQueueFrame.hostlistFindButton:GetName() .."Text"):SetText(L["Find groups"])
		vQueueFrame.hostlistFindButton:SetWidth(16)
		vQueueFrame.hostlistFindButton:SetHeight(16)
		vQueueFrame.hostlistFindButton:SetChecked(isFinding)
		
		vQueueFrame.hostlistFindButton:SetScript("OnClick", function()
			if this:GetChecked() then
				vQueueFrame.hostlistHostButton:Show()
				vQueueFrame.hostlistLevelField:Hide()
				vQueueFrame.hostlistNameField:Hide()
				vQueueFrame.hostlistCreateButton:Hide()
				isFinding = true
				vQueue_SlashCommandHandler( "lfg " .. selectedQuery )
			elseif not this:GetChecked() then
				isFinding = false
			end
		end)
		
		vQueueFrame.hostlistNameField = CreateFrame("EditBox", nil, vQueueFrame.hostlist )
		vQueueFrame.hostlistNameField:SetPoint("CENTER", vQueueFrame.hostlist, "CENTER", 0, 20)
		vQueueFrame.hostlistNameField:SetAutoFocus(false)
		vQueueFrame.hostlistNameField:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.hostlistNameField:SetTextColor(vQueueColors["WHITE"][1], vQueueColors["WHITE"][2], vQueueColors["WHITE"][3])
		vQueueFrame.hostlistNameField:SetMaxLetters(36)
		vQueueFrame.hostlistNameField:SetBackdrop(vQueueFrameBackdrop)
		vQueueFrame.hostlistNameField:SetBackdropColor(30/255, 30/255, 30/255, 1.0)
		vQueueFrame.hostlistNameField:SetWidth(vQueueFrame.hostlist:GetWidth() * 4/5)
		vQueueFrame.hostlistNameField:SetTextInsets(4, 0, 0, 0)
		vQueueFrame.hostlistNameField:SetHeight(20)
		vQueueFrame.hostlistNameField:SetFrameLevel(4)
		
		vQueueFrame.hostlistNameFieldText = CreateFrame("Button", nil, vQueueFrame.hostlistNameField)
		vQueueFrame.hostlistNameFieldText:ClearAllPoints()
		vQueueFrame.hostlistNameFieldText:SetPoint("CENTER", vQueueFrame.hostlistNameField, "CENTER", -8, 20)
		vQueueFrame.hostlistNameFieldText:SetFont("Fonts\\FRIZQT__.TTF", 12)
		vQueueFrame.hostlistNameFieldText:SetText(L["Title"])
		vQueueFrame.hostlistNameFieldText:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.hostlistNameFieldText:SetPushedTextOffset(0,0)
		vQueueFrame.hostlistNameFieldText:SetWidth(vQueueFrame.hostlistNameFieldText:GetTextWidth())
		vQueueFrame.hostlistNameFieldText:SetHeight(vQueueFrame.hostlistNameFieldText:GetTextHeight())
		vQueueFrame.hostlistNameFieldText:SetFrameLevel(4)
		
		vQueueFrame.hostlistLevelField = CreateFrame("EditBox", nil, vQueueFrame.hostlistNameField )
		vQueueFrame.hostlistLevelField:SetPoint("TOPLEFT", vQueueFrame.hostlistNameField, "BOTTOMLEFT", 55, -6)
		vQueueFrame.hostlistLevelField:SetAutoFocus(false)
		vQueueFrame.hostlistLevelField:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.hostlistLevelField:SetText(tostring(UnitLevel("player")))
		vQueueFrame.hostlistLevelField:SetTextColor(vQueueColors["WHITE"][1], vQueueColors["WHITE"][2], vQueueColors["WHITE"][3])
		vQueueFrame.hostlistLevelField:SetMaxLetters(2)
		vQueueFrame.hostlistLevelField:SetBackdrop(vQueueFrameBackdrop)
		vQueueFrame.hostlistLevelField:SetBackdropColor(30/255, 30/255, 30/255, 1.0)
		vQueueFrame.hostlistLevelField:SetTextInsets(3, 0, 0, 0)
		vQueueFrame.hostlistLevelField:SetNumeric(true)
		vQueueFrame.hostlistLevelField:SetWidth(20)
		vQueueFrame.hostlistLevelField:SetHeight(18)
		vQueueFrame.hostlistLevelField:SetFrameLevel(4)
		vQueueFrame.hostlistLevelField:SetScript("OnTextChanged", function()
			vQueue_hostlistNameFieldUpdate()
		end)
		
		vQueueFrame.hostlistLevelFieldText = CreateFrame("Button", nil, vQueueFrame.hostlistLevelField)
		vQueueFrame.hostlistLevelFieldText:ClearAllPoints()
		vQueueFrame.hostlistLevelFieldText:SetPoint("RIGHT", vQueueFrame.hostlistLevelField, "LEFT", -3, 0)
		vQueueFrame.hostlistLevelFieldText:SetFont("Fonts\\FRIZQT__.TTF", 8)
		vQueueFrame.hostlistLevelFieldText:SetText(L["Minimum lvl"])
		vQueueFrame.hostlistLevelFieldText:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.hostlistLevelFieldText:SetPushedTextOffset(0,0)
		vQueueFrame.hostlistLevelFieldText:SetWidth(vQueueFrame.hostlistLevelFieldText:GetTextWidth())
		vQueueFrame.hostlistLevelFieldText:SetHeight(vQueueFrame.hostlistLevelFieldText:GetTextHeight())
		vQueueFrame.hostlistLevelFieldText:SetFrameLevel(4)
		
		vQueueFrame.replyFrame = CreateFrame("Frame", nil, vQueueFrame)
		vQueueFrame.replyFrame:SetWidth(300)
		vQueueFrame.replyFrame:SetHeight(150)
		vQueueFrame.replyFrame:SetPoint("CENTER", vQueueFrame)
		vQueueFrame.replyFrame:SetBackdrop(vQueueFrameBackdrop)
		vQueueFrame.replyFrame:SetFrameLevel(4)
		vQueueFrame.replyFrame:SetBackdropColor(15/255, 15/255, 15/255, 0.9)
		
		vQueueFrame.replyFrameToString = vQueueFrame.replyFrame:CreateFontString(nil)
		vQueueFrame.replyFrameToString:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.replyFrameToString:SetText(L["To:"])
		vQueueFrame.replyFrameToString:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.replyFrameToString:SetWidth(vQueueFrame.replyFrameToString:GetStringWidth())
		vQueueFrame.replyFrameToString:SetHeight(8)
		vQueueFrame.replyFrameToString:SetPoint("TOPLEFT", vQueueFrame.replyFrame, "TOPLEFT", 5, -13)
		
		vQueueFrame.replyFrameClose = vQueue_newButton(vQueueFrame.replyFrame, 10)
		vQueueFrame.replyFrameClose:SetPoint("TOPRIGHT", vQueueFrame.replyFrame, "TOPRIGHT", -8, -8)
		vQueueFrame.replyFrameClose:SetText(CLOSE)
		vQueueFrame.replyFrameClose:SetWidth(vQueueFrame.replyFrameClose:GetTextWidth()+5)
		vQueueFrame.replyFrameClose:SetScript("OnClick", function()
			this:GetParent():Hide()
		end)
		vQueueFrame.replyFrame:Hide()

		vQueueFrame.replyFrameSend = vQueue_newButton(vQueueFrame.replyFrame, 10)
		vQueueFrame.replyFrameSend:SetPoint("BOTTOMRIGHT", vQueueFrame.replyFrame, "BOTTOMRIGHT", -8, 8)
		vQueueFrame.replyFrameSend:SetText(SEND_LABEL)
		vQueueFrame.replyFrameSend:SetWidth(vQueueFrame.replyFrameSend:GetTextWidth()+5)
		vQueueFrame.replyFrameSend:SetScript("OnClick", function()
			addToSet(chatQueue, vQueueFrame.replyFrameMsg:GetText() .. "-WHISPER-" .. vQueueFrame.replyFrameTo:GetText())
			this:GetParent():Hide()
		end)
		
		vQueueFrame.replyFrameTo = CreateFrame("EditBox", nil, vQueueFrame.replyFrame )
		vQueueFrame.replyFrameTo:SetPoint("TOPLEFT", vQueueFrame.replyFrame, "TOPLEFT", 25, -8)
		vQueueFrame.replyFrameTo:SetAutoFocus(false)
		vQueueFrame.replyFrameTo:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.replyFrameTo:SetText("LFM")
		vQueueFrame.replyFrameTo:SetTextColor(vQueueColors["WHITE"][1], vQueueColors["WHITE"][2], vQueueColors["WHITE"][3])
		vQueueFrame.replyFrameTo:SetMaxLetters(12)
		vQueueFrame.replyFrameTo:SetWidth(vQueueFrame.replyFrame:GetWidth() - vQueueFrame.replyFrameClose:GetWidth() - 32)
		vQueueFrame.replyFrameTo:SetHeight(20)
		vQueueFrame.replyFrameTo:SetBackdrop(vQueueFrameBackdrop)
		vQueueFrame.replyFrameTo:SetBackdropColor(25/255, 25/255, 25/255, 1.0)
		vQueueFrame.replyFrameTo:SetTextInsets(5, 0, 0, 0)
		
		vQueueFrame.replyFrameMsg = CreateFrame("EditBox", nil, vQueueFrame.replyFrame )
		vQueueFrame.replyFrameMsg:SetPoint("TOPLEFT", vQueueFrame.replyFrame, "TOPLEFT", 5, -30)
		vQueueFrame.replyFrameMsg:SetPoint("BOTTOMRIGHT", vQueueFrame.replyFrame, "BOTTOMRIGHT", -5, 20)
		vQueueFrame.replyFrameMsg:SetAutoFocus(false)
		vQueueFrame.replyFrameMsg:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.replyFrameMsg:SetTextColor(vQueueColors["WHITE"][1], vQueueColors["WHITE"][2], vQueueColors["WHITE"][3])
		vQueueFrame.replyFrameMsg:SetMaxLetters(200)
		vQueueFrame.replyFrameMsg:SetBackdrop(vQueueFrameBackdrop)
		vQueueFrame.replyFrameMsg:SetBackdropColor(25/255, 25/255, 25/255, 1.0)
		vQueueFrame.replyFrameMsg:SetMultiLine(true)
		vQueueFrame.replyFrameMsg:SetTextInsets(5, 5, 5, 0)
		
		vQueueFrame.optionsFrameTopString = vQueueFrame.optionsFrame:CreateFontString(nil)
		vQueueFrame.optionsFrameTopString:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.optionsFrameTopString:SetText("vQueue v" .. GetAddOnMetadata("vQueue", "Version") .." " .. L["Options"])
		vQueueFrame.optionsFrameTopString:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.optionsFrameTopString:SetWidth(vQueueFrame.optionsFrameTopString:GetStringWidth())
		vQueueFrame.optionsFrameTopString:SetHeight(8)
		vQueueFrame.optionsFrameTopString:SetPoint("TOP", vQueueFrame.optionsFrame, "TOP", 0, -7)
		
		vQueueFrame.filterCheck = CreateFrame("CheckButton", "optionsFilterCheck", vQueueFrame.optionsFrame, "UICheckButtonTemplate");
		vQueueFrame.filterCheck:SetWidth(18)
		vQueueFrame.filterCheck:SetHeight(18)
		getglobal(vQueueFrame.filterCheck:GetName() .."Text"):SetText(L["Hide channel messages"])
		vQueueFrame.filterCheck:SetPoint("TOPLEFT", vQueueFrame.optionsFrame, "TOPLEFT", 5, -15)
		vQueueFrame.filterCheck:SetChecked(vQueueOptions["filter"])
		vQueueFrame.filterCheck:SetScript("OnClick", function()
			if this:GetChecked() then
				vQueueFrame.filterCheckGeneral:Enable()
				vQueueFrame.filterCheckTrade:Enable()
				vQueueFrame.filterCheckLFG:Enable()
				vQueueFrame.filterCheckWorld:Enable()
				vQueueFrame.filterCheckOnlyFilter:Enable()
				vQueueOptions["filter"] = true
			elseif not this:GetChecked() then
				vQueueFrame.filterCheckGeneral:Disable()
				vQueueFrame.filterCheckTrade:Disable()
				vQueueFrame.filterCheckLFG:Disable()
				vQueueFrame.filterCheckWorld:Disable()
				vQueueFrame.filterCheckOnlyFilter:Disable()
				vQueueOptions["filter"] = false
			end
		end)
		
		vQueueFrame.filterCheckGeneral = CreateFrame("CheckButton", "optionsFilterCheckGeneral", vQueueFrame.optionsFrame, "UICheckButtonTemplate");
		vQueueFrame.filterCheckGeneral:SetWidth(16)
		vQueueFrame.filterCheckGeneral:SetHeight(16)
		getglobal(vQueueFrame.filterCheckGeneral:GetName() .."Text"):SetText(L["General"])
		getglobal(vQueueFrame.filterCheckGeneral:GetName() .."Text"):SetFont("Fonts\\FRIZQT__.TTF", 8)
		vQueueFrame.filterCheckGeneral:SetPoint("TOPLEFT", vQueueFrame.optionsFrame, "TOPLEFT", 15, -30)
		if not vQueueOptions["filter"] then vQueueFrame.filterCheckGeneral:Disable() end
		vQueueFrame.filterCheckGeneral:SetChecked(vQueueOptions["general"])
		vQueueFrame.filterCheckGeneral:SetScript("OnClick", function()
			if this:GetChecked() then
				vQueueOptions["general"] = true
			elseif not this:GetChecked() then
				vQueueOptions["general"] = false
			end
		end)
		
		vQueueFrame.filterCheckTrade = CreateFrame("CheckButton", "optionsFilterCheckTrade", vQueueFrame.optionsFrame, "UICheckButtonTemplate");
		vQueueFrame.filterCheckTrade:SetWidth(16)
		vQueueFrame.filterCheckTrade:SetHeight(16)
		getglobal(vQueueFrame.filterCheckTrade:GetName() .."Text"):SetText(L["Trade"])
		getglobal(vQueueFrame.filterCheckTrade:GetName() .."Text"):SetFont("Fonts\\FRIZQT__.TTF", 8)
		vQueueFrame.filterCheckTrade:SetPoint("TOPLEFT", vQueueFrame.optionsFrame, "TOPLEFT", 15, -42)
		if not vQueueOptions["filter"] then vQueueFrame.filterCheckTrade:Disable() end
		vQueueFrame.filterCheckTrade:SetChecked(vQueueOptions["trade"])
		vQueueFrame.filterCheckTrade:SetScript("OnClick", function()
			if this:GetChecked() then
				vQueueOptions["trade"] = true
			elseif not this:GetChecked() then
				vQueueOptions["trade"] = false
			end
		end)
		
		vQueueFrame.filterCheckLFG = CreateFrame("CheckButton", "optionsFilterCheckLFG", vQueueFrame.optionsFrame, "UICheckButtonTemplate");
		vQueueFrame.filterCheckLFG:SetWidth(16)
		vQueueFrame.filterCheckLFG:SetHeight(16)
		getglobal(vQueueFrame.filterCheckLFG:GetName() .."Text"):SetText(L["Looking For Group"])
		getglobal(vQueueFrame.filterCheckLFG:GetName() .."Text"):SetFont("Fonts\\FRIZQT__.TTF", 8)
		vQueueFrame.filterCheckLFG:SetPoint("TOPLEFT", vQueueFrame.optionsFrame, "TOPLEFT", 15, -54)
		if not vQueueOptions["filter"] then vQueueFrame.filterCheckLFG:Disable() end
		vQueueFrame.filterCheckLFG:SetChecked(vQueueOptions["lfg"])
		vQueueFrame.filterCheckLFG:SetScript("OnClick", function()
			if this:GetChecked() then
				vQueueOptions["lfg"] = true
			elseif not this:GetChecked() then
				vQueueOptions["lfg"] = false
			end
		end)
		
		vQueueFrame.filterCheckWorld = CreateFrame("CheckButton", "optionsFilterCheckWorld", vQueueFrame.optionsFrame, "UICheckButtonTemplate");
		vQueueFrame.filterCheckWorld:SetWidth(16)
		vQueueFrame.filterCheckWorld:SetHeight(16)
		getglobal(vQueueFrame.filterCheckWorld:GetName() .."Text"):SetText("World")
		getglobal(vQueueFrame.filterCheckWorld:GetName() .."Text"):SetFont("Fonts\\FRIZQT__.TTF", 8)
		vQueueFrame.filterCheckWorld:SetPoint("TOPLEFT", vQueueFrame.optionsFrame, "TOPLEFT", 15, -66)
		if not vQueueOptions["filter"] then vQueueFrame.filterCheckWorld:Disable() end
		vQueueFrame.filterCheckWorld:SetChecked(vQueueOptions["world"])
		vQueueFrame.filterCheckWorld:SetScript("OnClick", function()
			if this:GetChecked() then
				vQueueOptions["world"] = true
			elseif not this:GetChecked() then
				vQueueOptions["world"] = false
			end
		end)
		
		vQueueFrame.filterCheckOnlyFilter = CreateFrame("CheckButton", "optionsFilterCheckOnlyLfg", vQueueFrame.optionsFrame, "UICheckButtonTemplate");
		vQueueFrame.filterCheckOnlyFilter:SetWidth(16)
		vQueueFrame.filterCheckOnlyFilter:SetHeight(16)
		getglobal(vQueueFrame.filterCheckOnlyFilter:GetName() .."Text"):SetText(L["Only hide LFG/LFM messages"])
		getglobal(vQueueFrame.filterCheckOnlyFilter:GetName() .."Text"):SetFont("Fonts\\FRIZQT__.TTF", s.filterCheckOnlyFilter.fs)
		vQueueFrame.filterCheckOnlyFilter:SetPoint("TOPLEFT", vQueueFrame.optionsFrame, "TOPLEFT", 15, -80)
		if not vQueueOptions["filter"] then vQueueFrame.filterCheckOnlyFilter:Disable() end
		vQueueFrame.filterCheckOnlyFilter:SetChecked(vQueueOptions["onlylfg"])
		vQueueFrame.filterCheckOnlyFilter:SetScript("OnClick", function()
			if this:GetChecked() then
				vQueueOptions["onlylfg"] = true
			elseif not this:GetChecked() then
				vQueueOptions["onlylfg"] = false
			end
		end)
		
		vQueueFrame.optionsFrameClose = vQueue_newButton(vQueueFrame.optionsFrame, 10)
		vQueueFrame.optionsFrameClose:SetPoint("BOTTOM", vQueueFrame.optionsFrame, "BOTTOM", 0, 5)
		vQueueFrame.optionsFrameClose:SetText(SAVE)
		vQueueFrame.optionsFrameClose:SetWidth(vQueueFrame.optionsFrameClose:GetTextWidth()+10)
		vQueueFrame.optionsFrameClose:SetScript("OnClick", function()
			this:GetParent():Hide()
		end)
		
		vQueueFrame.optionsFrameFix = vQueue_newButton(vQueueFrame.optionsFrame, 10)
		vQueueFrame.optionsFrameFix:SetPoint("TOPLEFT", vQueueFrame.filterCheckOnlyFilter, "BOTTOMLEFT", 0, 0)
		vQueueFrame.optionsFrameFix:SetText(L["Fix channel order"])
		vQueueFrame.optionsFrameFix:SetWidth(vQueueFrame.optionsFrameFix:GetTextWidth()+15)
		vQueueFrame.optionsFrameFix:SetScript("OnClick", function()
			LeaveChannelByName(channelName)
			fixingChat = true
			whoRequestTimer = 0
			idleMessage = 0
			for i = 1, 10 do
				id, name = GetChannelName(i)
				if (name ~= nil) then
					LeaveChannelByName(name)
				end
			end
		end)
		
		--Role Icons for group creation
		vQueueFrame.hostlistHostHealer = CreateFrame("Button", "vQueueInfoButton", vQueueFrame.hostlistNameField)
		vQueueFrame.hostlistHostHealer:SetWidth(32)
		vQueueFrame.hostlistHostHealer:SetHeight(32)
		vQueueFrame.hostlistHostHealer:SetPoint("TOPRIGHT", vQueueFrame.hostlistNameField, "BOTTOMRIGHT", -32, -5)
		vQueueFrame.hostlistHostHealer:SetFrameLevel(4)
		vQueueFrame.hostlistHostHealerTex = vQueueFrame.hostlistHostHealer:CreateTexture(nil, "ARTWORK")
		vQueueFrame.hostlistHostHealerTex:SetAllPoints()
		vQueueFrame.hostlistHostHealerTex:SetTexture("Interface\\AddOns\\vQueue\\media\\Healer")
		vQueueFrame.hostlistHostHealerTex:SetWidth(vQueueFrame.hostlistHostHealer:GetWidth())
		vQueueFrame.hostlistHostHealerTex:SetHeight(vQueueFrame.hostlistHostHealer:GetHeight())
		vQueueFrame.hostlistHostHealCheck = vQueueFrame.hostlistHostHealer:CreateTexture(nil, "OVERLAY")
		vQueueFrame.hostlistHostHealCheck:SetTexture("Interface\\BUTTONS\\UI-CheckBox-Check")
		vQueueFrame.hostlistHostHealCheck:SetVertexColor(0.1,0.8,0.1)
		vQueueFrame.hostlistHostHealCheck:SetAllPoints()
		healerSelected = true
		vQueueFrame.hostlistHostHealer:SetScript("OnMouseDown", function()
			healerSelected = not healerSelected
			if healerSelected then
				vQueueFrame.hostlistHostHealCheck:Show()
			else
				vQueueFrame.hostlistHostHealCheck:Hide()
			end
			vQueue_hostlistNameFieldUpdate()
		end)
		vQueueFrame.hostlistHostHealer:SetScript("OnEnter", function()
			vQueueFrame.hostlistHostHealerTex:SetVertexColor(1, 1, 0)
		end)
		vQueueFrame.hostlistHostHealer:SetScript("OnLeave", function()
			vQueueFrame.hostlistHostHealerTex:SetVertexColor(1, 1, 1)
		end)
		
		vQueueFrame.hostlistHostDamage = CreateFrame("Button", "vQueueInfoButton", vQueueFrame.hostlistNameField)
		vQueueFrame.hostlistHostDamage:SetWidth(32)
		vQueueFrame.hostlistHostDamage:SetHeight(32)
		vQueueFrame.hostlistHostDamage:SetFrameLevel(4)
		vQueueFrame.hostlistHostDamage:SetPoint("TOPRIGHT", vQueueFrame.hostlistNameField, "BOTTOMRIGHT", 0, -5)
		vQueueFrame.hostlistHostDamageTex = vQueueFrame.hostlistHostDamage:CreateTexture(nil, "ARTWORK")
		vQueueFrame.hostlistHostDamageTex:SetAllPoints()
		vQueueFrame.hostlistHostDamageTex:SetTexture("Interface\\AddOns\\vQueue\\media\\Damage")
		vQueueFrame.hostlistHostDamageTex:SetWidth(vQueueFrame.hostlistHostDamage:GetWidth())
		vQueueFrame.hostlistHostDamageTex:SetHeight(vQueueFrame.hostlistHostDamage:GetHeight())
		vQueueFrame.hostlistHostDamageCheck = vQueueFrame.hostlistHostDamage:CreateTexture(nil, "OVERLAY")
		vQueueFrame.hostlistHostDamageCheck:SetTexture("Interface\\BUTTONS\\UI-CheckBox-Check")
		vQueueFrame.hostlistHostDamageCheck:SetVertexColor(0.1,0.8,0.1)
		vQueueFrame.hostlistHostDamageCheck:SetAllPoints()
		damageSelected = true
		vQueueFrame.hostlistHostDamage:SetScript("OnMouseDown", function()
			damageSelected = not damageSelected
			if damageSelected then
				vQueueFrame.hostlistHostDamageCheck:Show()
			else
				vQueueFrame.hostlistHostDamageCheck:Hide()
			end
			vQueue_hostlistNameFieldUpdate()
		end)
		vQueueFrame.hostlistHostDamage:SetScript("OnEnter", function()
			vQueueFrame.hostlistHostDamageTex:SetVertexColor(1, 1, 0)
		end)
		vQueueFrame.hostlistHostDamage:SetScript("OnLeave", function()
			vQueueFrame.hostlistHostDamageTex:SetVertexColor(1, 1, 1)
		end)
		
		vQueueFrame.hostlistHostTank = CreateFrame("Button", "vQueueInfoButton", vQueueFrame.hostlistNameField)
		vQueueFrame.hostlistHostTank:SetWidth(32)
		vQueueFrame.hostlistHostTank:SetHeight(32)
		vQueueFrame.hostlistHostTank:SetFrameLevel(4)
		vQueueFrame.hostlistHostTank:SetPoint("TOPRIGHT", vQueueFrame.hostlistNameField, "BOTTOMRIGHT", -64, -5)
		vQueueFrame.hostlistHostTankTex = vQueueFrame.hostlistHostTank:CreateTexture(nil, "ARTWORK")
		vQueueFrame.hostlistHostTankTex:SetAllPoints()
		vQueueFrame.hostlistHostTankTex:SetTexture("Interface\\AddOns\\vQueue\\media\\Tank")
		vQueueFrame.hostlistHostTankTex:SetWidth(vQueueFrame.hostlistHostTank:GetWidth())
		vQueueFrame.hostlistHostTankTex:SetHeight(vQueueFrame.hostlistHostTank:GetHeight())
		vQueueFrame.hostlistHostTankCheck = vQueueFrame.hostlistHostTank:CreateTexture(nil, "OVERLAY")
		vQueueFrame.hostlistHostTankCheck:SetTexture("Interface\\BUTTONS\\UI-CheckBox-Check")
		vQueueFrame.hostlistHostTankCheck:SetVertexColor(0.1,0.8,0.1)
		vQueueFrame.hostlistHostTankCheck:SetAllPoints()
		tankSelected = true
		vQueueFrame.hostlistHostTank:SetScript("OnMouseDown", function()
			tankSelected = not tankSelected
			if tankSelected then
				vQueueFrame.hostlistHostTankCheck:Show()
			else
				vQueueFrame.hostlistHostTankCheck:Hide()
			end
			vQueue_hostlistNameFieldUpdate()
		end)
		vQueueFrame.hostlistHostTank:SetScript("OnEnter", function()
			vQueueFrame.hostlistHostTankTex:SetVertexColor(1, 1, 0)
		end)
		vQueueFrame.hostlistHostTank:SetScript("OnLeave", function()
			vQueueFrame.hostlistHostTankTex:SetVertexColor(1, 1, 1)
		end)
		
		vQueueFrame.hostlistNeededRolesText = CreateFrame("Button", nil, vQueueFrame.hostlistHostTank )
		vQueueFrame.hostlistNeededRolesText:SetPoint("RIGHT", vQueueFrame.hostlistHostTank , "LEFT", 0, 2)
		vQueueFrame.hostlistNeededRolesText:SetFont("Fonts\\FRIZQT__.TTF", 8)
		vQueueFrame.hostlistNeededRolesText:SetText(L["Needed roles"])
		vQueueFrame.hostlistNeededRolesText:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.hostlistNeededRolesText:SetPushedTextOffset(0,0)
		vQueueFrame.hostlistNeededRolesText:SetWidth(vQueueFrame.hostlistNeededRolesText:GetTextWidth())
		vQueueFrame.hostlistNeededRolesText:SetHeight(vQueueFrame.hostlistNeededRolesText:GetTextHeight())
		---------------------------------------------------
		
		vQueueFrame.hostlistCancelButton = vQueue_newButton(vQueueFrame.hostlist, 10)
		vQueueFrame.hostlistCancelButton:SetPoint("CENTER", vQueueFrame.hostlist, "CENTER", -8, -130)
		vQueueFrame.hostlistCancelButton:SetText(CANCEL)
		vQueueFrame.hostlistCancelButton:SetWidth(vQueueFrame.hostlistCancelButton:GetTextWidth()+20)
		vQueueFrame.hostlistCancelButton:SetFrameLevel(4)
		vQueueFrame.hostlistCancelButton:SetScript("OnClick", function()
			vQueueDB.isWaitListShown = false
			if selectedQuery == "waitlist" then selectedQuery = hostedCategory end
			vQueue_ShowGroups(selectedQuery, selectedQuery)
			vQueueFrame.hostTitleFindName:Show()
			vQueueFrame.hostTitleFindLeader:Show()
			vQueueFrame.hostTitleFindLevel:Show()
			vQueueFrame.hostTitleFindSize:Show()
			vQueueFrame.hostTitleFindRoles:Show()
			vQueueFrame.hostlistLevelField:Hide()
			vQueueFrame.hostlistNameField:Hide()
			vQueueFrame.hostlistCreateButton:Hide()
			vQueueFrame.hostlistHostButton:Show()
			this:Hide()
		end)
		vQueueFrame.hostlistCancelButton:Hide()
		
		vQueueFrame.hostlistCreateButton = vQueue_newButton(vQueueFrame.hostlist, 14)
		vQueueFrame.hostlistCreateButton:SetPoint("CENTER", vQueueFrame.hostlist, "CENTER", -8, -100)
		vQueueFrame.hostlistCreateButton:SetText(L["Create group"])
		vQueueFrame.hostlistCreateButton:SetWidth(vQueueFrame.hostlistCreateButton:GetTextWidth()+30)
		vQueueFrame.hostlistCreateButton:SetFrameLevel(4)
		vQueueFrame.hostlistCreateButton:SetScript("OnClick", function()
			if vQueueFrame.hostlistNameField:GetText() ~= "" and vQueueFrame.hostlistLevelField:GetText() ~= "" then
				if tonumber(vQueueFrame.hostlistLevelField:GetText()) < 1 then vQueueFrame.hostlistLevelField:SetText("1") end
				if tonumber(vQueueFrame.hostlistLevelField:GetText()) > 60 then vQueueFrame.hostlistLevelField:SetText("60") end
				local name = vQueueFrame.hostlistNameField:GetText()
				local strippedStr = ""
				for i=1, string.len(name) do
					local add = true
					if string.sub(name, i, i) == ":" or string.sub(name, i, i) == "-" then
						add = false
					end
					if add then
						strippedStr = strippedStr .. string.sub(name, i, i)
					end
				end
				hostOptions[0] = strippedStr
				hostOptions[1] = vQueueFrame.hostlistLevelField:GetText()
				hostOptions[2] = healerSelected
				hostOptions[3] = damageSelected
				hostOptions[4] = tankSelected
				vQueueFrame.topsectionHostName:SetWidth(400)
				vQueueFrame.topsectionHostName:SetText(hostOptions[0])
				vQueueFrame.topsectionHostName:SetWidth(vQueueFrame.topsectionHostName:GetTextWidth())
				vQueueFrame.topsectionMinLvl:SetWidth(100)
				vQueueFrame.topsectionMinLvl:SetText(hostOptions[1] .. "+")
				vQueueFrame.topsectionMinLvl:SetWidth(vQueueFrame.topsectionMinLvl:GetStringWidth())
				if healerSelected then vQueueFrame.topsectionHostHeal:Show() else vQueueFrame.topsectionHostHeal:Hide() end
				if damageSelected then vQueueFrame.topsectionHostDamage:Show() else vQueueFrame.topsectionHostDamage:Hide() end
				if tankSelected then vQueueFrame.topsectionHostTank:Show() else vQueueFrame.topsectionHostTank:Hide() end
				vQueueFrame.hostlistLevelField:Hide()
				vQueueFrame.hostlistNameField:Hide()
				vQueueFrame.hostlistCancelButton:Hide()
				this:Hide()
				vQueueFrame.hostlistEditButton:Show()
				vQueueFrame.hostlistUnlistButton:Show()
				vQueueFrame.hostlistWaitListButton:Show()
				vQueueFrame.hostTitle:Show()
				vQueueFrame.hostTitleRole:Show()
				vQueueFrame.hostTitleClass:Show()
				vQueueFrame.hostTitleLevel:Show()
				vQueueFrame.topsectionHostName:Show()
				vQueueFrame.hostlistBotShadow:SetHeight(40)
				if tablelength(groups[selectedQuery]) > 16 then vQueueFrame.hostlistBotShadow:Show() else vQueueFrame.hostlistBotShadow:Hide() end
				if vQueueDB.isHost then return end
				vQueue_SlashCommandHandler( "host " .. selectedQuery )
			end
		end)
		
		--scrollbarhost
		scrollbar = CreateFrame("Slider", nil, vQueueFrame.hostlist, "UIPanelScrollBarTemplate") 
		scrollbar:SetMinMaxValues(1, 1)
		scrollbar:SetValueStep(1)
		scrollbar.scrollStep = 1
		scrollbar:SetValue(0)
		scrollbar:EnableMouse(true)
		scrollbar:EnableMouseWheel(true)
		scrollbar:SetWidth(16)
		scrollbar:SetHeight((vQueueFrame.hostlist:GetHeight()* 4/5) - 35)
		scrollbar:SetPoint("BOTTOMLEFT", vQueueFrame.hostlist, "BOTTOMRIGHT", -16, 16)
		scrollbar:SetScript("OnValueChanged",
		function (self, value)
			vQueue_UpdateHostScroll(arg1)
		end)
		scrollbar:Hide()
		
		--scrollbarcategory
		scrollbarCat = CreateFrame("Slider", nil, vQueueFrame.catList, "UIPanelScrollBarTemplate") 
		scrollbarCat:SetMinMaxValues(1, 10)
		scrollbarCat:SetValueStep(1)
		scrollbarCat.scrollStep = 1
		scrollbarCat:SetValue(0)
		scrollbarCat:EnableMouse(true)
		scrollbarCat:EnableMouseWheel(true)
		scrollbarCat:SetWidth(16)
		scrollbarCat:SetHeight(vQueueFrame.catList:GetHeight()-32)
		scrollbarCat:SetPoint("BOTTOMLEFT", vQueueFrame.catList, "BOTTOMRIGHT", -16, 16)
		scrollbarCat:SetScript("OnValueChanged",
		function (self, value)
			vQueue_UpdateCatScroll(arg1)
		end)
		scrollbarCat:Hide()
		
		
		vQueueFrame.title = CreateFrame("Button", "vQueueButton", vQueueFrame.hostlist)
		vQueueFrame.title:ClearAllPoints()
		vQueueFrame.title:SetPoint("CENTER", vQueueFrame.hostlist, "TOP", 0 , 6)
		vQueueFrame.title:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.title:SetText("vQueue")
		vQueueFrame.title:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.title:SetPushedTextOffset(0,0)
		vQueueFrame.title:SetWidth(vQueueFrame.title:GetTextWidth())
		vQueueFrame.title:SetHeight(20)
		
		vQueueFrame.titleCat = CreateFrame("Button", "vQueueButton", vQueueFrame.catList)
		vQueueFrame.titleCat:ClearAllPoints()
		vQueueFrame.titleCat:SetPoint("CENTER", vQueueFrame.catList, "TOP", 0 , 6)
		vQueueFrame.titleCat:SetFont("Fonts\\FRIZQT__.TTF", 10)
		vQueueFrame.titleCat:SetText(L["Categories"])
		vQueueFrame.titleCat:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.titleCat:SetPushedTextOffset(0,0)
		vQueueFrame.titleCat:SetWidth(20)
		vQueueFrame.titleCat:SetHeight(20)
		
		
		DEFAULT_CHAT_FRAME:AddMessage(L["Loaded "] .. arg1)
		vQueueminimapButton = CreateFrame("Button", "vQueueMap", Minimap)
		vQueueminimapButton:SetFrameStrata('LOW')
		vQueueminimapButton:SetWidth(32)
		vQueueminimapButton:SetHeight(32)
		vQueueminimapButton:ClearAllPoints()
		vQueueminimapButton:SetPoint("TOPLEFT", Minimap,"TOPLEFT",MinimapPos.x,MinimapPos.y) 
		
		vQueueminimapButton:SetHighlightTexture("Interface\\MINIMAP\\UI-Minimap-ZoomButton-Highlight", "ADD")
		vQueueminimapButton:RegisterForDrag("RightButton")
		vQueueminimapButton.texture = vQueueminimapButton:CreateTexture(nil, "BUTTON")
		vQueueminimapButton.texture:SetTexture("Interface\\AddOns\\vQueue\\media\\icon")
		vQueueminimapButton.texture:SetPoint("CENTER", vQueueminimapButton)
		vQueueminimapButton.texture:SetWidth(20)
		vQueueminimapButton.texture:SetHeight(20)
		
		vQueueminimapButton.border = vQueueminimapButton:CreateTexture(nil, "BORDER")
		vQueueminimapButton.border:SetTexture("Interface\\MINIMAP\\MiniMap-TrackingBorder")
		vQueueminimapButton.border:SetPoint("TOPLEFT", vQueueminimapButton.texture, -6, 5)
		vQueueminimapButton.border:SetWidth(52)
		vQueueminimapButton.border:SetHeight(52)
		
		vQueueminimapButton.notifyText = vQueueminimapButton:CreateTexture(nil, "OVERLAY")
		vQueueminimapButton.notifyText:SetTexture("Interface\\MINIMAP\\UI-Minimap-ZoomButton-Highlight")
		vQueueminimapButton.notifyText:SetBlendMode("ADD")
		vQueueminimapButton.notifyText:SetAllPoints()
		vQueueminimapButton.notifyText:Hide()
		vQueueminimapButton:SetScript("OnMouseDown", function()
			point, relativeTo, relativePoint, xOffset, yOffset = this.texture:GetPoint(1)
			this.texture:SetPoint(point, relativeTo, relativePoint, xOffset + 2, yOffset - 2)
		end);
		vQueueminimapButton:SetScript("OnLeave", function(self, button)
			MinimapTool:Hide()
			this.notifyText:Hide()
			this.texture:SetPoint("CENTER", vQueueminimapButton,0,0)
		end);
		vQueueminimapButton:SetScript("OnMouseUp", function()
			if arg1 == "LeftButton" then
				if vQueueDB.FrameShown then 
					vQueueFrame:Hide() 
					vQueueFrame.catList:Hide()
					vQueueFrame.hostlist:Hide()
					vQueueDB.FrameShown = false
				else
					vQueueFrame:Show() 
					vQueueFrame.catList:Show()
					vQueueFrame.hostlist:Show()
					vQueueDB.FrameShown = true
				end
			end
			this.texture:SetPoint("CENTER", vQueueminimapButton)
		end);
		vQueueminimapButton:SetScript("OnDragStart", function()
			miniDrag = true
		end)
		vQueueminimapButton:SetScript("OnDragStop", function()
			miniDrag = false
		end)
		vQueueminimapButton:SetScript("OnUpdate", function()
			if miniDrag then
				local xpos,ypos = GetCursorPosition();
				local xmin,ymin,xm,ym = Minimap:GetLeft(), Minimap:GetBottom(), Minimap:GetRight(), Minimap:GetTop();
				local scale = Minimap:GetEffectiveScale();
				local xdelta, ydelta = (xm - xmin + 5)/2*scale, (ym - ymin + 5) /2 * scale;
				xpos = xmin*scale-xpos+xdelta;
				ypos = ypos-ymin*scale-ydelta;
				local angle = math.deg(math.atan2(ypos,xpos));
				local x,y =0,0;
				if (Squeenix or (simpleMinimap_Skins and simpleMinimap_Skins:GetShape() == "square")
							or (pfUI and pfUI.minimap)) then
					x = math.max(-xdelta-10, math.min((xdelta*1.5) * cos(angle), xdelta+10))
					y = math.max(-ydelta-10, math.min((ydelta*1.5) * sin(angle), ydelta+10))
				else
					x= cos(angle)*xdelta
					y= sin(angle)*ydelta
				end
				local sc= this:GetEffectiveScale()
				MinimapPos.x = (xdelta-x)/sc-17
				MinimapPos.y = (y-ydelta)/sc+17
				this:SetPoint("TOPLEFT", Minimap, "TOPLEFT", MinimapPos.x , MinimapPos.y);
			end
		end)
		CreateFrame( "GameTooltip", "MinimapTool", nil, "GameTooltipTemplate" ); -- Tooltip name cannot be nil
		vQueueminimapButton:SetScript("OnEnter", function()
			if vQueueDB.isHost then -- layt
				MinimapTool:SetOwner( this, "ANCHOR_CURSOR" );
				MinimapTool:AddLine(tablelength(groups["waitlist"]) .. L[" player(s) in your wait list."], 1, 1, 1, 1)
				MinimapTool:Show()
			end
		end)
		MinimapTool:SetScript("OnUpdate", function()
			if this:IsShown() then
				this:Hide()
				MinimapTool:SetOwner( vQueueminimapButton, "ANCHOR_CURSOR" );
				MinimapTool:AddLine(tablelength(groups["waitlist"]) .. L[" player(s) in your wait list."], 1, 1, 1, 1)
				MinimapTool:Show()
			end
		end)
		
		
		vQueueFrame.topsectiontitle = CreateFrame("Button", "vQueueButton", vQueueFrame.hostlistTopSection)
		vQueueFrame.topsectiontitle:ClearAllPoints()
		vQueueFrame.topsectiontitle:SetPoint("LEFT", vQueueFrame.hostlistTopSection, "LEFT", 5, vQueueFrame.hostlistTopSection:GetHeight() * 1/6)
		vQueueFrame.topsectiontitle:SetFont("Fonts\\MORPHEUS.ttf", 24, "OUTLINE")
		vQueueFrame.topsectiontitle:SetText(L["<-- Select a category"])
		vQueueFrame.topsectiontitle:SetTextColor(vQueueColors["WHITE"][1], vQueueColors["WHITE"][2], vQueueColors["WHITE"][3])
		vQueueFrame.topsectiontitle:EnableMouse(false)
		vQueueFrame.topsectiontitle:SetFrameLevel(3)
		vQueueFrame.topsectiontitle:SetWidth(vQueueFrame.topsectiontitle:GetTextWidth())
		vQueueFrame.topsectiontitle:SetHeight(vQueueFrame.topsectiontitle:GetTextHeight())
		
		vQueueFrame.topsectionHostName = CreateFrame("Button", "vQueueButton", vQueueFrame.topsectiontitle)
		vQueueFrame.topsectionHostName:SetPoint("TOPLEFT", vQueueFrame.topsectiontitle, "BOTTOMLEFT", 0, -3)
		vQueueFrame.topsectionHostName:SetFont("Fonts\\FRIZQT__.TTF", 8, "OUTLINE")
		vQueueFrame.topsectionHostName:SetText("")
		vQueueFrame.topsectionHostName:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.topsectionHostName:EnableMouse(false)
		vQueueFrame.topsectionHostName:SetWidth(vQueueFrame.topsectionHostName:GetTextWidth())
		vQueueFrame.topsectionHostName:SetHeight(vQueueFrame.topsectionHostName:GetTextHeight())
		vQueueFrame.topsectionHostName:Hide()
		
		vQueueFrame.topsectionMinLvl = vQueueFrame.topsectionHostName:CreateFontString(nil, "ARTWORK")
		vQueueFrame.topsectionMinLvl:SetPoint("TOPLEFT", vQueueFrame.topsectionHostName, "BOTTOMLEFT", -2, -3)
		vQueueFrame.topsectionMinLvl:SetFont("Fonts\\FRIZQT__.TTF", 8, "OUTLINE")
		vQueueFrame.topsectionMinLvl:SetText("17+")
		vQueueFrame.topsectionMinLvl:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		vQueueFrame.topsectionMinLvl:SetWidth(vQueueFrame.topsectionMinLvl:GetStringWidth())
		vQueueFrame.topsectionMinLvl:SetHeight(10)
		
		vQueueFrame.topsectionHostHeal = vQueueFrame.topsectionHostName:CreateTexture(nil, "ARTWORK")
		vQueueFrame.topsectionHostHeal:SetPoint("LEFT", vQueueFrame.topsectionMinLvl, "RIGHT", 12, 0)
		vQueueFrame.topsectionHostHeal:SetTexture("Interface\\AddOns\\vQueue\\media\\Healer")
		vQueueFrame.topsectionHostHeal:SetWidth(12)
		vQueueFrame.topsectionHostHeal:SetHeight(12)
		vQueueFrame.topsectionHostDamage = vQueueFrame.topsectionHostName:CreateTexture(nil, "ARTWORK")
		vQueueFrame.topsectionHostDamage:SetPoint("LEFT", vQueueFrame.topsectionMinLvl, "RIGHT", 24, 0)
		vQueueFrame.topsectionHostDamage:SetTexture("Interface\\AddOns\\vQueue\\media\\Damage")
		vQueueFrame.topsectionHostDamage:SetWidth(12)
		vQueueFrame.topsectionHostDamage:SetHeight(12)
		vQueueFrame.topsectionHostTank = vQueueFrame.topsectionHostName:CreateTexture(nil, "ARTWORK")
		vQueueFrame.topsectionHostTank:SetPoint("LEFT", vQueueFrame.topsectionMinLvl, "RIGHT", 0, 0)
		vQueueFrame.topsectionHostTank:SetTexture("Interface\\AddOns\\vQueue\\media\\Tank")
		vQueueFrame.topsectionHostTank:SetWidth(12)
		vQueueFrame.topsectionHostTank:SetHeight(12)
		
		vQueueFrame.catListHighlight = CreateFrame("Frame", nil, nil)
		vQueueFrame.catListHighlight:SetPoint("CENTER", vQueueFrame.catList, "CENTER", 0, 2)
		vQueueFrame.catListHighlight:SetWidth(vQueueFrame.catList:GetWidth()-4)
		vQueueFrame.catListHighlight:SetHeight(10)
		vQueueFrame.catListHighlightTex = vQueueFrame.catListHighlight:CreateTexture(nil, "ARTWORK")
		vQueueFrame.catListHighlightTex:SetTexture(1, 1, 0, 0.4)
		vQueueFrame.catListHighlightTex:SetGradientAlpha("HORIZONTAL", 1, 1, 0, 0.5, 1, 1, 0, 0)
		vQueueFrame.catListHighlightTex:SetAllPoints()
		vQueueFrame.catListHighlight:Hide()
		
		vQueue_createCategories(L["Dungeons"])
		vQueue_createCategories(L["Battlegrounds"])
		vQueue_createCategories(L["Raids"])
		vQueue_createCategories(L["Quest Groups"])
		vQueue_createCategories(L["Miscellaneous"])

		vQueueminimapButton:Show()
		vQueueFrame:Hide()
		vQueueFrame.catList:Hide()
		vQueueFrame.hostlist:Hide()
		vQueueFrame.hostlistTank:Hide()
		vQueueFrame.hostlistHeal:Hide()
		vQueueFrame.hostlistDps:Hide()
		vQueueFrame.hostlistRoleText:Hide()
		vQueueFrame.hostlistLevelField:Hide()
		vQueueFrame.hostlistNameField:Hide()
		vQueueFrame.hostlistCreateButton:Hide()
		vQueueFrame.hostlistHostButton:Hide()
	end
	if event == "CHAT_MSG_CHANNEL" then
		if string.lower(arg9) ~= string.lower(channelName) then
			local puncString = filterPunctuation(arg1)
			for kLfm, vLfm in pairs(getglobal("LFMARGS")) do
				if Wholefind(puncString, vLfm) > 0 then
					local usedthis = false
					for kCat, kVal in pairs(getglobal("CATARGS")) do
						for kkCat, kkVal in pairs(kVal) do
							if Wholefind(puncString, kkVal) > 0 then
								usedthis = true
								local healerRole = ""
								local damageRole = ""
								local tankRole = ""
								for kHeal, vHeal in pairs(getglobal("ROLEARGS")["Healer"]) do
									if Wholefind(puncString, vHeal) > 0 then
										healerRole = "Healer"
									end
								end
								for kDps, vDps in pairs(getglobal("ROLEARGS")["Damage"]) do
									if Wholefind(puncString, vDps) > 0 then
										damageRole = "Damage"
									end
								end
								for kTank, vTank in pairs(getglobal("ROLEARGS")["Tank"]) do
									if Wholefind(puncString, vTank) > 0 then
										tankRole = "Tank"
									end
								end
								if healerRole == "" and tankRole == "" and damageRole == "" then
									healerRole = "Healer"
									damageRole = "Damage"
									tankRole = "Tank"
								end
								local strippedStr = ""
								for i=1, string.len(arg1) do
									local add = true
									if string.sub(arg1, i, i) == ":" then
										add = false
									end
									if add then
										strippedStr = strippedStr .. string.sub(arg1, i, i)
									end
								end
								leaderMessages[arg2] = strippedStr .. ":" .. kCat .. ":" .. tostring(GetTime())
								vQueue_addToGroup(kCat, strippedStr.. ":" .. arg2 .. ":" .. getglobal("MINLVLS")[kCat] .. ":" .. "?" .. ":" .. healerRole .. ":" .. damageRole .. ":" .. tankRole)
								
								
								if string.find(notifyForDungeon,kCat) then
									if (selectedRole == damageRole ) or (selectedRole == healerRole) or (selectedRole == tankRole) then
										vQueueFrame.replyFrameTo:SetText(arg2)
										vQueueFrame.replyFrameMsg:SetText("(vQueue) Lvl " .. tostring(UnitLevel("player")) .. " " .. selectedRole .. " " .. vQueueDB.class)
										vQueueFrame.replyFrame:Show()
										if not (vQueueDB.FrameShown or vQueueDB.inCombat) then 
											vQueueFrame:Show() 
											vQueueFrame.catList:Show()
											vQueueFrame.hostlist:Show()
											vQueueDB.FrameShown = true
										end
									end
									DEFAULT_CHAT_FRAME:AddMessage(L["Someone is looking for "] .. kCat)
								end
								refreshCatList(kCat)
								break
							end
						end
					end
				end
			end
			if vQueueDB.isHost then
			for kLfm, vLfm in pairs(getglobal("LFGARGS")) do
				if Wholefind(puncString, vLfm) > 0 then
					for kCat, kVal in pairs(getglobal("CATARGS")) do
						for kkCat, kkVal in pairs(kVal) do
							for groupindex = 1,MAX_PARTY_MEMBERS do
								if UnitName("party" .. tostring(groupindex)) == arg2 then return end
							end
							if Wholefind(puncString, kkVal) > 0 and vQueueDB.isHost and hostedCategory == kCat then
								local exists = false
								local playerRole = ""
								for kHeal, vHeal in pairs(getglobal("ROLEARGS")["Healer"]) do
									if Wholefind(puncString, vHeal) > 0 then
										playerRole = "Healer"
									end
								end
								for kDps, vDps in pairs(getglobal("ROLEARGS")["Damage"]) do
									if Wholefind(puncString, vDps) > 0 then
										playerRole = "Damage"
									end
								end
								for kTank, vTank in pairs(getglobal("ROLEARGS")["Tank"]) do
									if Wholefind(puncString, vTank) > 0 then
										playerRole = "Tank"
									end
								end
								if playerRole == "" then playerRole = "Damage" end
								if not setContains(whoRequestList, arg2) then addToSet(whoRequestList, arg2) end
								local strippedStr = ""
								for i=1, string.len(arg1) do
									local add = true
									if string.sub(arg1, i, i) == ":" then
										add = false
									end
									if add then
										strippedStr = strippedStr .. string.sub(arg1, i, i)
									end
								end
								playerMessages[arg2] = strippedStr .. ":" .. GetTime()
								vQueue_addToWaitList(arg2 .. ":" .. "..." .. ":" .. "..." .. ":" .. playerRole)
								break
							end
						end
					end
				end
			end
			end
		end
		if string.lower(arg9) == string.lower(channelName) then
			local vQueueArgs = {}
			if arg1 ~= nil then
				vQueueArgs = split(arg1, "\%s")
			end
			
			if vQueueArgs[1] == "vqgroup" and vQueueArgs[2] ~= nil then
				local name = split(arg1, "\:")
				local healerRole = ""
				local damageRole = ""
				local tankRole = ""
				if vQueueArgs[5] == "true" then
					healerRole = "Healer"
				end
				if vQueueArgs[6] == "true" then
					damageRole = "Damage"
				end
				if vQueueArgs[7] == "true" then
				 tankRole = "Tank"
				end
				
				if tonumber(vQueueArgs[8]) == 0 and setContains(waitingList, arg2) then removeFromSet(waitingList, arg2)
				elseif tonumber(vQueueArgs[8]) == 1 and not setContains(waitingList, arg2) then addToSet(waitingList, arg2) end
				
				local strippedStr = ""
				for i=1, string.len(name[2]) do
					local add = true
					if string.sub(name[2], i, i) == ":" or string.sub(name[2], i, i) == "-" then
						add = false
					end
					if add then
						strippedStr = strippedStr .. string.sub(name[2], i, i)
					end
				end
				leaderMessages[arg2] = strippedStr .. ":" .. vQueueArgs[2] .. ":" .. GetTime()
				
				if vQueueArgs[2] == "dm" then vQueueArgs[2]="dem" end -- OLD Version
				
				vQueue_addToGroup(vQueueArgs[2], strippedStr .. ":" .. arg2 .. ":" .. vQueueArgs[3] .. ":" .. vQueueArgs[4] .. ":" .. healerRole .. ":" .. damageRole .. ":" .. tankRole)
				refreshCatList(vQueueArgs[2])
			end	
		end
	end
	
	if event == "WHO_LIST_UPDATE" then
		--vQueue_WhoSorting()
		
		if tablelength(whoRequestList) > 0 then
			for i=1, GetNumWhoResults() do
				name, guild, level, race, class, zone, classFileName, sex = GetWhoInfo(i)
				if groups["waitlist"][name] ~= nil then
					local gname, gbg, glevel, gclass, grole = groups["waitlist"][name]:GetRegions()
					glevel:SetWidth(100)
					glevel:SetText(tostring(level))
					glevel:SetWidth(gclass:GetStringWidth())
					local diffColor = getDifficultyColor(tonumber(level), UnitLevel("player"))
					glevel:SetTextColor(diffColor[1], diffColor[2], diffColor[3])
					gclass:SetWidth(100)
					gclass:SetText(class)
					local classColor = getClassColor(class)
					gclass:SetTextColor(classColor[1], classColor[2], classColor[3])
					gclass:SetWidth(gclass:GetStringWidth())
				end
			end
			removeFromSet(whoRequestList, name)
		end
		SetWhoToUI(0)
	end
	
	if event == "CHAT_MSG_WHISPER" then
		local args = {}
		if arg1 ~= nil then
			args = split(arg1, "\%s")
		end
		if next(args) == nil then return end
		-- Group request info from players
		if args[1] == "vqrequest" and vQueueDB.isHost then
			for groupindex = 1,MAX_PARTY_MEMBERS do
				if UnitName("party" .. tostring(groupindex)) == arg2 then return end
			end
			vQueue_addToWaitList(arg2 .. ":" .. args[2] .. ":" .. args[3] .. ":" .. args[4])
			playerMessages[arg2] = "vqrequest" .. ":" .. GetTime()
		end
		if (args[1] == "vqaccept" or args[1] == "vqdecline") and isFinding then
			for key, value in pairs(groups) do
				if groups[key][arg2] ~= nil then
					if args[1] == "vqaccept" then
						DEFAULT_CHAT_FRAME:AddMessage(L["Your application to "] .. arg2 .. L["'s group("] .. key .. L[") has been accepted."], 0.2, 1.0, 0.2)
					elseif args[1] == "vqdecline" then
						DEFAULT_CHAT_FRAME:AddMessage(L["Your application to "] .. arg2 .. L["'s group("] .. key .. L[") has been declined."], 1.0, 0.2, 0.2)
					end
					removeFromSet(waitingList, arg2)
					groups[key][arg2]:Hide()
					groups[key][arg2] = nil
					refreshCatList(key)
				end
			end
		end	
	end
	if event == "PLAYER_REGEN_ENABLED" or event == "PLAYER_REGEN_DISABLED" then
		vQueueDB.inCombat = event == "PLAYER_REGEN_DISABLED"
	end
end

function vQueue_updateCatColors()
	local curCat = ""
	for kk, vv in pairs(catListButtons) do
		if categories[vv:GetText()] ~= nil then curCat = vv:GetText() end
		if categories[vv:GetText()] == nil and curCat ~= L["Battlegrounds"] and curCat ~= L["Miscellaneous"] then
			local args = {}
			for k, v in pairs(categories) do
				for i, item in v do
					if type(item) == "string" then
						local tArgs = split(item, "\:")
						if tArgs[1] == trim(split(vv:GetText(), "%[")[1]) then 
							args = tArgs
							break
						end
					end
				end
			end
			local diffColor = getDifficultyColor(getglobal("MINLVLS")[args[2]], UnitLevel("Player"))		
			vv:SetTextColor(diffColor[1], diffColor[2], diffColor[3])
		end
	end
end

function vQueue_createCategories(textKey)
	newCatButton = CreateFrame("Button", "vQueueButton", vQueueFrame.catList)
	newCatButton:SetFont("Fonts\\FRIZQT__.TTF", 10)
	newCatButton:SetText(textKey)
	newCatButton:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
	newCatButton:SetWidth(newCatButton:GetTextWidth())
	newCatButton:SetHeight(10)
	newCatButton:SetFrameLevel(1)
	newCatButton:EnableMouse(false)
	newCatButton:SetPoint("TOPLEFT", vQueueFrame.catList, "TOPLEFT",  2, tablelength(catListButtons)*-10)
	table.insert(catListButtons, tablelength(catListButtons), newCatButton)
	for k, v in pairs(categories[textKey]) do
		local args = {}
		if type(v) == "string" then
			args = split(v, "\:")	
		end
		if type(args[1]) == "string" then
			local dropedItemFrame = CreateFrame("Button", "vQueueButton", vQueueFrame.catList)
			dropedItemFrame:SetFont("Fonts\\FRIZQT__.TTF", 8)
			dropedItemFrame:SetText(args[1] .. ( tablelength(groups[args[2]]) > 0 and " [" ..  tostring(tablelength(groups[args[2]])) .. "]" or ""))
			dropedItemFrame:SetHighlightTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
			dropedItemFrame:SetWidth(dropedItemFrame:GetTextWidth())
			dropedItemFrame:SetHeight(8)
			dropedItemFrame:SetFrameLevel(1)
			dropedItemFrame:SetTextColor(vQueueColors["WHITE"][1], vQueueColors["WHITE"][2], vQueueColors["WHITE"][3])
			dropedItemFrame:SetPoint("TOPLEFT", vQueueFrame.catList, "TOPLEFT",  12, tablelength(catListButtons)*-10)
			dropedItemFrame:SetScript("OnMouseDown", function()
				vQueueFrame.catListHighlight:SetParent(this)
				vQueueFrame.catListHighlight:SetPoint("LEFT", this, "LEFT", -11, 0)
				vQueueFrame.catListHighlight:Show()
				vQueueDB.isWaitListShown = false
				vQueueFrame.hostTitle:Hide()
				vQueueFrame.hostTitleRole:Hide()
				vQueueFrame.hostTitleClass:Hide()
				vQueueFrame.hostTitleLevel:Hide()
				vQueueFrame.topsectionHostName:Hide()
				vQueueFrame.hostlistLevelField:Hide()
				vQueueFrame.hostlistNameField:Hide()
				vQueueFrame.hostlistCreateButton:Hide()
				vQueueFrame.hostlistCancelButton:Hide()
				vQueueFrame.hostTitleFindName:Show()
				vQueueFrame.hostTitleFindLeader:Show()
				vQueueFrame.hostTitleFindLevel:Show()
				vQueueFrame.hostTitleFindSize:Show()
				vQueueFrame.hostTitleFindRoles:Show()
				if not vQueueDB.isHost then realHostedCategory = args[1] end
				local args = {}
				for k, v in pairs(categories) do
					for i, item in v do
						if type(item) == "string" then
							local tArgs = split(item, "\:")
							if tArgs[1] == trim(split(this:GetText(), "%[")[1]) then 
								args = tArgs
								break
							end
						end
					end
				end
				if args[2] ~= nil and type(args[2]) == "string" then
					local prevCat = selectedQuery
					selectedQuery = args[2]
					vQueue_ShowGroups(selectedQuery, prevCat)
					vQueueFrame.topsectiontitle:SetText(args[1] .. "(" .. getglobal("MINLVLS")[args[2]] .. ")")
					vQueueFrame.topsectiontitle:SetWidth(vQueueFrame.topsectiontitle:GetTextWidth())
					vQueueFrame.topsectiontitle:SetHeight(vQueueFrame.topsectiontitle:GetTextHeight())
				end
				if not vQueueFrame.hostlistTopSectionBg:SetTexture("Interface\\AddOns\\vQueue\\media\\" .. args[2]) then
					vQueueFrame.hostlistTopSectionBg:SetTexture(0, 0, 0, 0)
				end
				vQueueFrame.hostlistHeal:Show()
				vQueueFrame.hostlistDps:Show()
				vQueueFrame.hostlistTank:Show()
				vQueueFrame.hostlistRoleText:Show()
				if not vQueueDB.isHost and not vQueueFrame.hostlistCreateButton:IsShown() then
					vQueueFrame.hostlistHostButton:Show()
				else
					vQueueFrame.hostlistHostButton:Hide()
				end
				scrollbar:SetValue(1)
				scrollbar:SetMinMaxValues(1, tablelength(groups[selectedQuery])-10)
			end)
			dropedItemFrame:SetScript("OnShow", function()
				if vQueueFrame.catListHighlight:GetParent() and trim(split(vQueueFrame.catListHighlight:GetParent():GetText(), "%[")[1]) == trim(split(this:GetText(), "%[")[1]) then
					vQueueFrame.catListHighlight:SetParent(this)
					vQueueFrame.catListHighlight:SetPoint("LEFT", this, "LEFT", -11, 0)
					vQueueFrame.catListHighlight:Show()
				end
			end)
			table.insert(catListButtons, tablelength(catListButtons), dropedItemFrame)
		end
	end
	scrollbarCat:SetMinMaxValues(1, tablelength(catListButtons)-10)
	vQueue_UpdateCatScroll(scrollbarCat:GetValue())
end

function vQueue_addToWaitList(playerinfo)
	local args = split(playerinfo, "\:")
	if groups["waitlist"][args[1]] == nil then
		newWaitEntry = CreateFrame("Button", "vQueueButton", vQueueFrame.hostlist)
		newWaitEntry:SetFont("Interface\\AddOns\\vQueue\\media\\anonpro.TTF", 10)
		newWaitEntry:SetText(args[1])
		newWaitEntry:SetTextColor(vQueueColors["WHITE"][1], vQueueColors["WHITE"][2], vQueueColors["WHITE"][3])
		newWaitEntry:SetHighlightTextColor(1, 1, 0)
		newWaitEntry:SetPushedTextOffset(0,0)
		newWaitEntry:SetWidth(newWaitEntry:GetTextWidth())
		newWaitEntry:SetHeight(10)
		newWaitEntry:EnableMouse(true)
		newWaitEntry:SetFrameLevel(1)
		newWaitEntry:SetScript("OnEnter", function()
			if playerMessages[this:GetText()] ~= nil then
				local playerargs = split(playerMessages[this:GetText()], "\:")
				if Wholefind(playerargs[1], "vqrequest") > 0 then return end
				playerQueueToolTip:SetOwner( this, "ANCHOR_CURSOR" );
				playerQueueToolTip:AddLine(playerargs[1], 1, 1, 1, 1)
				playerQueueToolTip:Show()
			end
		end)
		newWaitEntry:SetScript("OnLeave", function()
			playerQueueToolTip:Hide()
		end)
		newWaitEntryBg = newWaitEntry:CreateTexture(nil, "BACKGROUND")
		newWaitEntryBg:SetPoint("LEFT", newWaitEntry, "LEFT", 1, 0)
		newWaitEntryBg:SetWidth(vQueueFrame.hostlist:GetWidth()-3)
		newWaitEntryBg:SetHeight(15)
		
		local diffColor
		if args[2] ~= "..." then
			diffColor = getDifficultyColor(tonumber(args[2]), UnitLevel("player"))
		else
			diffColor = {vQueueColors["WHITE"][1], vQueueColors["WHITE"][2], vQueueColors["WHITE"][3]}
		end
		newWaitEntryLvl = newWaitEntry:CreateFontString(nil, "ARTWORK")
		newWaitEntryLvl:SetFont("Interface\\AddOns\\vQueue\\media\\anonpro.TTF", 10)
		newWaitEntryLvl:SetText(args[2])
		newWaitEntryLvl:SetPoint("LEFT", newWaitEntry, "LEFT", 155, 0)
		newWaitEntryLvl:SetWidth(newWaitEntryLvl:GetStringWidth())
		newWaitEntryLvl:SetTextColor(diffColor[1], diffColor[2], diffColor[3])
		newWaitEntryLvl:SetHeight(10)
		
		local classColor
		if args[3] ~= "..." then
			classColor = getClassColor(args[3])
		else
			classColor = {vQueueColors["WHITE"][1], vQueueColors["WHITE"][2], vQueueColors["WHITE"][3]}
		end
		newWaitEntryClass = newWaitEntry:CreateFontString(nil, "ARTWORK")
		newWaitEntryClass:SetFont("Interface\\AddOns\\vQueue\\media\\anonpro.TTF", 10)
		newWaitEntryClass:SetText(args[3])
		newWaitEntryClass:SetPoint("LEFT", newWaitEntry, "LEFT", 245, 0)
		newWaitEntryClass:SetWidth(newWaitEntryClass:GetStringWidth())
		newWaitEntryClass:SetTextColor(classColor[1], classColor[2], classColor[3])
		newWaitEntryClass:SetHeight(10)
		
		newWaitEntryRole = newWaitEntry:CreateTexture(nil, "ARTWORK")
		newWaitEntryRole:SetPoint("LEFT", newWaitEntry, "LEFT", 325, 0)
		newWaitEntryRole:SetTexture("Interface\\AddOns\\vQueue\\media\\" .. args[4])
		newWaitEntryRole:SetWidth(16)
		newWaitEntryRole:SetHeight(16)
		
		newWaitEntryInvite = vQueue_newButton(newWaitEntry, 10)
		newWaitEntryInvite:SetPoint("RIGHT", newWaitEntryBg, "RIGHT", -20, 0)
		newWaitEntryInvite:SetFont("Interface\\AddOns\\vQueue\\media\\anonpro.TTF", 10)
		newWaitEntryInvite:SetText(L["invite"])
		newWaitEntryInvite:SetWidth(newWaitEntryInvite:GetTextWidth()+5)
		newWaitEntryInvite:SetScript("OnClick", function()
			InviteByName(this:GetParent():GetText())
			groups["waitlist"][this:GetParent():GetText()]:Hide()
			groups["waitlist"][this:GetParent():GetText()] = nil
			vQueue_UpdateHostScroll(scrollbar:GetValue())
			scrollbar:SetMinMaxValues(1, tablelength(groups[selectedQuery])-10)
			if playerMessages[this:GetParent():GetText()] == nil then return end
			local invargs = split(playerMessages[this:GetParent():GetText()], "\:")
			if Wholefind(invargs[1], "vqrequest") > 0 then
				if not setContains(chatQueue, "vqaccept" .. "-WHISPER-" .. this:GetParent():GetText()) then
					addToSet(chatQueue, "vqaccept" .. "-WHISPER-" .. this:GetParent():GetText())
				end
			end
		end)
		newWaitEntryInvite:SetScript("OnUpdate", function()
			if playerMessages[this:GetParent():GetText()] ~= nil then
				local timeSplit = split(playerMessages[this:GetParent():GetText()], "\:")
				if type(tonumber(timeSplit[2])) == "number" then
					local minute = 0
					local seconds = math.floor(GetTime() - tonumber(timeSplit[2]))
					if seconds >= 60 then
						minute = math.floor(seconds/60)
						seconds = seconds - (minute*60)
					end
					if seconds < 10 then
						seconds = "0" .. tostring(seconds)
					end
					this:SetText(L["invite"] .. "(" .. tostring(minute) .. ":" .. tostring(seconds)..")" )
					this:SetWidth(this:GetTextWidth()+5)
				end
			end
		end)

		newWaitEntryDecline = vQueue_newButton(newWaitEntry, 10)
		newWaitEntryDecline:SetPoint("RIGHT", newWaitEntryBg, "RIGHT", -3, 0)
		newWaitEntryDecline:SetText("X")
		newWaitEntryDecline:SetWidth(newWaitEntryDecline:GetTextWidth()+5)
		newWaitEntryDecline:SetScript("OnClick", function()
			groups["waitlist"][this:GetParent():GetText()]:Hide()
			groups["waitlist"][this:GetParent():GetText()] = nil
			vQueue_UpdateHostScroll(scrollbar:GetValue())
			scrollbar:SetMinMaxValues(1, tablelength(groups[selectedQuery])-10)
			if playerMessages[this:GetParent():GetText()] == nil then return end
			local invargs = split(playerMessages[this:GetParent():GetText()], "\:")
			if Wholefind(invargs[1], "vqrequest") > 0 then
				if not setContains(chatQueue, "vqdecline" .. "-WHISPER-" .. this:GetParent():GetText()) then
					addToSet(chatQueue, "vqdecline" .. "-WHISPER-" .. this:GetParent():GetText())
				end
			end
		end)
		if not vQueueFrame:IsShown() then vQueueminimapButton.notifyText:Show() end
		groups["waitlist"][args[1]] = newWaitEntry
	end
	if selectedQuery == "waitlist" and vQueueDB.isWaitListShown then 
		groups["waitlist"][args[1]]:Show()
		vQueue_UpdateHostScroll(scrollbar:GetValue())
		scrollbar:SetMinMaxValues(1, tablelength(groups[selectedQuery])-10)
	else groups["waitlist"][args[1]]:Hide() end
end

function vQueue_WhoSorting()
--[[	for i=1, GetNumWhoResults() do
		name, guild, level, race, class, zone, classFileName, sex = GetWhoInfo(i)
		if leaderMessages[name] ~= nil and level > 40 and groups["dead"][name] ~= nil then
			groups["dem"][name] = groups["dead"][name]
			if selectedQuery == "dead" then groups["dead"][name]:Hide() end
			groups["dead"][name] = nil	
			local thisframe, bg, name, level = groups["dm"][name]:GetRegions()
			level:SetText(getglobal("MINLVLS")["dm"])
			local diffColor = getDifficultyColor(tonumber(getglobal("MINLVLS")["dm"]), UnitLevel("player"))
			level:SetTextColor(diffColor[1], diffColor[2], diffColor[3])
		elseif leaderMessages[name] ~= nil and groups["dead"][name] ~= nil then
			local leaderArgs = split(leaderMessages[name], "\:")
			leaderMessages[name] = leaderArgs[1] .. ":" .. "dead" .. ":" .. leaderArgs[3]
			if "dead" == selectedQuery then groups["dead"][name]:Show() end
		end
		if leaderMessages[name] ~= nil then 
			refreshCatList("dm")
			refreshCatList("dead")
			vQueue_ShowGroups(selectedCat, selectedCat)
		end
	end
]]
end

-- return the first integer index holding the value
function AnIndexOf(t,val)
	local i = 0
    for k,v in pairs(t) do 
        if k == val then return i end
		if v ~= nil then i = i+1 end
    end
end

function VisibleIndex(t,val)
	local i = 0
    for k,v in pairs(t) do
        if k == val then return i end
		if v ~= nil and v:IsShown() then i = i+1 end
    end
end

function vQueue_UpdateCatScroll(value)
	for k, v in pairs(catListButtons) do
		local index = k
		if (index+1) < value or index-value > 33 then v:Hide() else v:Show() end
	end
	for k, v in pairs(catListButtons) do
		if v ~= nil then
			if v:IsShown() then
				local vindex = VisibleIndex(catListButtons, k)
				if catListButtons[0]:IsShown() then vindex = vindex + 1 end
				if v:GetText() == catListButtons[0]:GetText() and v:IsShown() then vindex = 0 end
				local point, relativeTo, relativePoint, xOffset, yOffset = v:GetPoint()
				v:SetPoint("TOPLEFT", vQueueFrame.catList, "TOPLEFT",  xOffset, vindex*-10)
			end
		end
	end
end

function vQueue_UpdateHostScroll(value)
	if selectedQuery ~= "" then
		for k, v in pairs(groups[selectedQuery]) do
			local index = AnIndexOf(groups[selectedQuery], k)
			if (index+1) < value or index-value > 16 then v:Hide() else v:Show() end
		end
		if tablelength(groups[selectedQuery]) > 16 then vQueueFrame.hostlistBotShadow:Show() else vQueueFrame.hostlistBotShadow:Hide() end
	end
	if selectedQuery ~= "" then
		for k, v in pairs(groups[selectedQuery]) do
			if v ~= nil then
				if v:IsShown() then
					local thisframe, bg, name, level, size, tank, healer, damage = v:GetRegions()
					local vindex = VisibleIndex(groups[selectedQuery], k)
					v:SetPoint("TOPLEFT", vQueueFrame.hostlist, "TOPLEFT",  0, -(vindex*15)-15 - vQueueFrame.hostlistTopSection:GetHeight())
					if (math.mod(vindex, 2) == 0) then
						bg:SetTexture(0.5, 0.5, 0.5, 0.1)
					else
						bg:SetTexture(0.2, 0.2, 0.2, 0.1)
					end
				end
			end
		end
	end
end

function getDifficultyColor(levelKey, playerLevel)
	if not levelKey then return {1,1,0}; end
	local color = {}
	if (levelKey - playerLevel) >= 5 then
		color[1] = 1
		color[2] = 0
		color[3] = 0
	elseif  (levelKey - playerLevel) <= 4  and (levelKey - playerLevel) >= 3 then
		color[1] = 1
		color[2] = 0.5
		color[3] = 0
	elseif  (playerLevel - levelKey) <= 4  and (playerLevel - levelKey) >= 3 then
		color[1] = 0
		color[2] = 1
		color[3] = 0
	elseif  (playerLevel - levelKey) > 4 then
		color[1] = 0.5
		color[2] = 0.5
		color[3] = 0.5
	else
		color[1] = 1
		color[2] = 1
		color[3] = 0
	end
	return color
end

function getClassColor(class)
	local classColor = {}
	classColor[BC["Druid"]] = {1, 0.49, 0.04}
	classColor[BC["Hunter"]] = {0.67, 0.83, 0.45}
	classColor[BC["Mage"]] = {0.41, 0.80, 0.94}
	classColor[BC["Paladin"]] = {0.96, 0.55, 0.73}
	classColor[BC["Priest"]] = {1, 1, 1}
	classColor[BC["Rogue"]] = {1, 0.96, 0.41}
	classColor[BC["Shaman"]] = {0, 0.44, 0.87}
	classColor[BC["Warlock"]] = {0.58, 0.51, 0.79}
	classColor[BC["Warrior"]] = {0.78, 0.61, 0.43}
	for k, v in pairs(classColor) do
		if k == class then return v end
	end
end

function vQueue_addToGroup(category, groupinfo)
	if category == "waitlist" then return end
	local args = split(groupinfo, "\:")
	for k, v in pairs(groups) do
		for kk, vv in pairs(groups[k]) do
			if args[2] and category and kk == args[2] and vv ~= nil and k ~= category and k ~= "waitlist" then
				groups[category][args[2]] = groups[k][kk]
				groups[k][kk]:Hide()
				groups[k][kk] = nil
				refreshCatList(k)
			end
		end
	end
	if groups[category][args[2]] == nil then
		newHostEntry = CreateFrame("Button", "vQueueButton", vQueueFrame.hostlist)
		newHostEntry:SetFont("Interface\\AddOns\\vQueue\\media\\anonpro.TTF", 10)
		newHostEntry:SetText(args[1])
		newHostEntry:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
		newHostEntry:SetHighlightTextColor(1, 1, 0)
		newHostEntry:SetPushedTextOffset(0,0)
		newHostEntry:SetWidth(newHostEntry:GetTextWidth())
		newHostEntry:SetHeight(10)
		newHostEntry:EnableMouse(true)
		newHostEntry:SetFrameLevel(1)
		newHostEntry:SetScript("OnEnter", function()
			local thisframe, bg, name, level, size, tank, healer, damage = this:GetRegions()
			if leaderMessages[name:GetText()] ~= nil then
				local leaderargs = split(leaderMessages[name:GetText()], "\:")
				groupToolTip:SetOwner( this, "ANCHOR_CURSOR" );
				groupToolTip:AddLine(leaderargs[1], 1, 1, 1, 1)
				groupToolTip:Show()
			end
		end)
		newHostEntry:SetScript("OnUpdate", function()
			if vQueueFrame:IsShown() and this:IsShown() then
				local thisframe, bg, name, level, size, tank, healer, damage = this:GetRegions()
				if leaderMessages[name:GetText()] ~= nil and size:GetText() == "?" then
					local timeSplit = split(leaderMessages[name:GetText()], "\:")
					if type(tonumber(timeSplit[3])) == "number" then
						local minute = 0
						local seconds = math.floor(GetTime() - tonumber(timeSplit[3]))
						if seconds >= 60 then
							minute = math.floor(seconds/60)
							seconds = seconds - (minute*60)
						end
						if seconds < 10 then
							seconds = "0" .. tostring(seconds)
						end
						local msg = string.len(timeSplit[1])>29 and (string.sub(timeSplit[1],1,27).."...") or timeSplit[1]
						this:SetText(msg.." " .. tostring(minute) .. ":" .. tostring(seconds) )
						this:SetWidth(this:GetTextWidth())
					end
				end
			end
		end)
		newHostEntry:SetScript("OnLeave", function()
			groupToolTip:Hide()
		end)
		newHostEntryBg = newHostEntry:CreateTexture(nil, "BACKGROUND")
		newHostEntryBg:SetPoint("LEFT", newHostEntry, "LEFT", 1, 0)
		newHostEntryBg:SetWidth(vQueueFrame.hostlist:GetWidth()-3)
		newHostEntryBg:SetHeight(15)
		if (math.mod(tablelength(groups[category])-1, 2) == 0) then
			newHostEntryBg:SetTexture(0.5, 0.5, 0.5, 0.1)
		else
			newHostEntryBg:SetTexture(0.2, 0.2, 0.2, 0.1)
		end
		
		newHostEntryName = newHostEntry:CreateFontString(nil, "ARTWORK")
		newHostEntryName:SetFont("Interface\\AddOns\\vQueue\\media\\anonpro.TTF", 10)
		newHostEntryName:SetText(args[2])
		newHostEntryName:SetPoint("LEFT", newHostEntry, "LEFT", 211, 0)
		newHostEntryName:SetWidth(newHostEntryName:GetStringWidth())
		newHostEntryName:SetTextColor(vQueueColors["WHITE"][1], vQueueColors["WHITE"][2], vQueueColors["WHITE"][3])
		newHostEntryName:SetHeight(10)
		
		local diffColor = getDifficultyColor(tonumber(args[3]), UnitLevel("player"))
		newHostEntryLevel = newHostEntry:CreateFontString(nil, "ARTWORK")
		newHostEntryLevel:SetFont("Interface\\AddOns\\vQueue\\media\\anonpro.TTF", 10)
		newHostEntryLevel:SetText(args[3])
		newHostEntryLevel:SetPoint("LEFT", newHostEntry, "LEFT", 287, 0)
		newHostEntryLevel:SetWidth(newHostEntryLevel:GetStringWidth())
		newHostEntryLevel:SetTextColor(diffColor[1], diffColor[2], diffColor[3])
		newHostEntryLevel:SetHeight(10)
		
		newHostEntrySize = newHostEntry:CreateFontString(nil, "ARTWORK")
		newHostEntrySize:SetFont("Interface\\AddOns\\vQueue\\media\\anonpro.TTF", 10)
		newHostEntrySize:SetText(args[4])
		newHostEntrySize:SetPoint("LEFT", newHostEntry, "LEFT", 325, 0)
		newHostEntrySize:SetWidth(newHostEntrySize:GetStringWidth())
		newHostEntrySize:SetTextColor(vQueueColors["WHITE"][1], vQueueColors["WHITE"][2], vQueueColors["WHITE"][3])
		newHostEntrySize:SetHeight(10)
		
		newHostEntryTank = newHostEntry:CreateTexture(nil, "ARTWORK")
		newHostEntryTank:SetPoint("LEFT", newHostEntry, "LEFT", 360, 0)
		newHostEntryTank:SetTexture("Interface\\AddOns\\vQueue\\media\\Tank")
		newHostEntryTank:SetWidth(16)
		newHostEntryTank:SetHeight(16)
		if args[7] == "Tank" then newHostEntryTank:Show() else newHostEntryTank:Hide() end
		
		newHostEntryHealer = newHostEntry:CreateTexture(nil, "ARTWORK")
		newHostEntryHealer:SetPoint("LEFT", newHostEntry, "LEFT", 376, 0)
		newHostEntryHealer:SetTexture("Interface\\AddOns\\vQueue\\media\\Healer")
		newHostEntryHealer:SetWidth(16)
		newHostEntryHealer:SetHeight(16)
		if args[5] == "Healer" then newHostEntryHealer:Show() else newHostEntryHealer:Hide() end
		
		newHostEntryDamage = newHostEntry:CreateTexture(nil, "ARTWORK")
		newHostEntryDamage:SetPoint("LEFT", newHostEntry, "LEFT", 392, 0)
		newHostEntryDamage:SetTexture("Interface\\AddOns\\vQueue\\media\\Damage")
		newHostEntryDamage:SetWidth(16)
		newHostEntryDamage:SetHeight(16)
		if args[6] == "Damage" then newHostEntryDamage:Show() else newHostEntryDamage:Hide() end
		
		waitListButton = vQueue_newButton(newHostEntry, 9)
		waitListButton:SetPoint("RIGHT", newHostEntryBg, "RIGHT", -3, 0)
		if setContains(waitingList, args[2]) then
			waitListButton:SetText(L["waiting"])
		else
			waitListButton:SetText(L["wait list"])
		end
		if leaderMessages[args[2]] ~= nil and newHostEntrySize:GetText() == "?" then
			waitListButton:SetText(L["reply"])
		end
		waitListButton:SetWidth(waitListButton:GetTextWidth()+5)
		waitListButton:SetScript("OnClick", function()
			if GetNumPartyMembers() > 0 and this:GetText() ~= L["reply"] then 
				vQueueFrame.hostlistRoleText:SetText(L["(Leave group before queueing for other groups)"])
				return 
			end
			local thisframe, bg, name, level, size, tank, healer, damage = this:GetParent():GetRegions()
			if this:GetText() == L["wait list"] then
				if tonumber(level:GetText()) > UnitLevel("player") then
					vQueueFrame.hostlistRoleText:SetText(L["(You do not meet the level requirements for this group)"])
					return
				end
				this:SetText(L["waiting"])
				vQueue_SlashCommandHandler(L["request "] .. name:GetText())
				if not setContains(waitingList, name:GetText()) then
					addToSet(waitingList, name:GetText())
				end
			end
			if this:GetText() == L["reply"] then
				vQueueFrame.replyFrameTo:SetText(name:GetText())
				vQueueFrame.replyFrameMsg:SetText("(vQueue) Lvl " .. tostring(UnitLevel("player")) .. " " .. selectedRole .. " " .. vQueueDB.class)
				vQueueFrame.replyFrame:Show()
			end
		end)
		
		groups[category][args[2]] = newHostEntry
	else
		local thisframe, bg, name, level, size, tank, healer, damage = groups[category][args[2]]:GetRegions()
		groups[category][args[2]]:SetText(args[1])
		groups[category][args[2]]:SetWidth(groups[category][args[2]]:GetTextWidth())
		local diffColor = getDifficultyColor(tonumber(args[3]), UnitLevel("player"))
		level:SetText(args[3])
		level:SetWidth(level:GetStringWidth())
		level:SetTextColor(diffColor[1], diffColor[2], diffColor[3])
		size:SetText(args[4])
		size:SetWidth(size:GetStringWidth())
		if args[7] == "Tank" then tank:Show() else tank:Hide() end
		if args[5] == "Healer" then healer:Show() else healer:Hide() end
		if args[6] == "Damage" then damage:Show() else damage:Hide() end
	end
	if category == selectedQuery and not vQueueDB.isWaitListShown then 
		groups[category][args[2]]:Show()
		vQueue_UpdateHostScroll(scrollbar:GetValue())
		scrollbar:SetMinMaxValues(1, tablelength(groups[selectedQuery])-10)
	else groups[category][args[2]]:Hide() end
end

function vQueue_ShowGroups(category, prevCategory)
	if prevCategory ~= "" then
		for k, v in pairs(groups[prevCategory]) do v:Hide() end
	end
	if category ~= "" then
		for k, v in pairs(groups[category]) do v:Hide() end
		for k, v in pairs(groups[category]) do
			v:Show() 
		end
		scrollbar:SetMinMaxValues(1, tablelength(groups[category])-10)
	end
	vQueue_UpdateHostScroll(scrollbar:GetValue())
end

function refreshCatList(cat)
	for kChild, child in ipairs(catListButtons) do
		local args = {}
		local realText = split(child:GetText(), "%[")
		realText = trim (realText[1])
		for k, v in pairs(categories) do
			for i, item in v do
				if type(item) == "string" then
					local tArgs = split(item, "\:")
					if tArgs[1] == realText and tArgs[2] == cat then 
						args = tArgs
						break
					end
				end
			end
		end
		if args[2] ~= nil and type(args[2]) == "string" then
			child:SetText(realText .. ( tablelength(groups[args[2]]) > 0 and " [" ..  tostring(tablelength(groups[args[2]])) .. "]" or ""))
			child:SetWidth(child:GetTextWidth())
			break
		end
	end
end

function vQueue_newButton(parentFrame, FontSize)
	newButton = CreateFrame("Button", "vQueueButton", parentFrame)
	newButton:SetFont("Fonts\\FRIZQT__.TTF", FontSize)
	newButton:SetTextColor(vQueueColors["YELLOW"][1], vQueueColors["YELLOW"][2], vQueueColors["YELLOW"][3])
	newButton:SetNormalTexture("Interface\\AddOns\\vQueue\\media\\button")
	newButton:SetHighlightTexture("Interface\\BUTTONS\\CheckButtonHilight")
	newButton:GetHighlightTexture():SetVertexColor(1, 1, 1, 0.2)
	newButton:GetNormalTexture():SetVertexColor(0.25, 0.25, 0.25, 1.0)
	newButton:SetHeight(FontSize+2)
	
	local borderColor = {0.05, 0.05, 0.05, 1}
	
	leftBorder = newButton:CreateTexture(nil, "OVERLAY")
	leftBorder:SetPoint("TOPLEFT", newButton, "TOPLEFT")
	leftBorder:SetPoint("BOTTOMLEFT", newButton, "BOTTOMLEFT")
	leftBorder:SetTexture(borderColor[1], borderColor[2], borderColor[3], borderColor[4])
	leftBorder:SetWidth(1)
	
	rightBorder = newButton:CreateTexture(nil, "OVERLAY")
	rightBorder:SetPoint("TOPRIGHT", newButton, "TOPRIGHT")
	rightBorder:SetPoint("BOTTOMRIGHT", newButton, "BOTTOMRIGHT")
	rightBorder:SetTexture(borderColor[1], borderColor[2], borderColor[3], borderColor[4])
	rightBorder:SetWidth(1)
	return newButton
end

function vQueue_SlashCommandHandler( msg )
	local args = {}
	if msg ~= nil then
		args = split(msg, "\%s")
	end
	if args[1] == "host" and args[2] ~= nil then
		vQueueDB.isHost = true
		DEFAULT_CHAT_FRAME:AddMessage(L["Now hosting for "] .. hostedCategory)
		idleMessage = 25
	elseif args[1] == "lfg" and args[2] ~= nil then
		if not setContains(chatQueue, args[2]) then
			addToSet(chatQueue, "lfg " .. args[2] .. "-CHANNEL-" .. tostring(GetChannelName(channelName)))
		end
	elseif args[1] == "request" and args[2] ~= nil then
		if not setContains(chatQueue, "vqrequest " .. UnitLevel("player") .. " " .. vQueueDB.class .. " " .. selectedRole .. "-WHISPER-" .. args[2]) then
			addToSet(chatQueue, "vqrequest " .. UnitLevel("player") .. " " .. vQueueDB.class .. " " .. selectedRole .. "-WHISPER-" .. args[2])
		end
	elseif args[1] == "testgroups" then
		for i=1, 100 do
			vQueue_addToGroup("misc", "title" .. i .. ":" .. "lmaoiwaslike" .. i .. ":" .. i .. ":" .. "?" .. ":" .. "Healer" .. ":" .. "Damage" .. ":" .. "Tank")
		end
		refreshCatList("misc")
	elseif args[1] == "testplayers" then
		local classes = {}
		classes[1] = BC["Druid"]
		classes[2] = BC["Hunter"]
		classes[3] = BC["Mage"]
		classes[4] = BC["Paladin"]
		classes[5] = BC["Priest"]
		classes[6] = BC["Rogue"]
		classes[7] = BC["Shaman"]
		classes[8] = BC["Warlock"]
		classes[9] = BC["Warrior"]
		local roles = {}
		roles[1] = "Healer"
		roles[2] = "Damage"
		roles[3] = "Tank"
		for i=1, 100 do
			vQueue_addToWaitList("lmaoiwaslike" .. i .. ":" .. math.random(1, 60) .. ":" .. classes[math.random(1, 9)] .. ":" .. roles[math.random(1,3)])
		end
	end
end

function vQueue_OnUpdate()
	whoRequestTimer = whoRequestTimer + arg1
	if whoRequestTimer > 2 then
		whoRequestTimer = 0
		if fixingChat then
			DEFAULT_CHAT_FRAME:AddMessage(L["vQueue: JoinChannelByName not working properly."])
			DEFAULT_CHAT_FRAME:AddMessage(L["vQueue: So you need join channels manually or in macro: 1 channel per macro"])
			DEFAULT_CHAT_FRAME:AddMessage(L["vQueue: (/join lookingforgroup) (/join world) - PS: dont use caps"])
			DEFAULT_CHAT_FRAME:AddMessage(L["vQueue: after it reopen vQueue"])
			JoinChannelByName(L["General"])
			JoinChannelByName(L["Trade"])
			JoinChannelByName(L["LocalDefense"])
--			JoinChannelByName("LookingForGroup")
--			JoinChannelByName("world")
--			JoinChannelByName(channelName)
			fixingChat = false
		end
		if tablelength(whoRequestList) > 0 and not FriendsFrame:IsShown() then
			local whoString = ""
			for k, v in pairs(whoRequestList) do
				whoString = whoString .. k .. " "
			end
			SetWhoToUI(1)
			FriendsFrame:UnregisterEvent("WHO_LIST_UPDATE")
			SendWho(whoString)
		elseif FriendsFrame:IsShown() then
			FriendsFrame:RegisterEvent("WHO_LIST_UPDATE")
		end
	end
	
	idleMessage = idleMessage + arg1
	if idleMessage > 30 and tablelength(chatQueue) == 0 then
		idleMessage = 0
		if (isFinding or vQueueDB.isHost) and GetChannelName(channelName) < 1 then
			JoinChannelByName(channelName)
		elseif GetChannelName(channelName) > 0 and (vQueueDB.isHost == false and isFinding == false) then
			LeaveChannelByName(channelName)
		end
		if vQueueDB.isHost then
			local groupSize = GetNumRaidMembers()
			if groupSize == 0 then groupSize = GetNumPartyMembers() end
			groupSize = groupSize + 1
			addToSet(chatQueue, "vqgroup " .. hostedCategory .. " " .. tostring(hostOptions[1]) .. " " .. groupSize .. " " .. tostring(hostOptions[2]) .. " " .. tostring(hostOptions[3]) .. " " .. tostring(hostOptions[4]) .. " " .. tostring(2) .. " :" .. tostring(hostOptions[0]) .. "-CHANNEL-" .. tostring(GetChannelName(channelName)))
		end
		
		-- Removes entries after 5 minutes of no updates
		for k, v in pairs(leaderMessages) do
			if v ~= nil then
				local leaderArgs = split(v, "\:")
				local timeDiff
				if leaderArgs[3] ~= nil and type(tonumber(leaderArgs[3])) == "number" then
					timeDiff = GetTime() - tonumber(leaderArgs[3])
					if timeDiff > (300) then -- delete chat entries after 5 minutes of no updates					
						if groups[leaderArgs[2]] and groups[leaderArgs[2]][k] ~= nil then
							groups[leaderArgs[2]][k]:Hide()
							groups[leaderArgs[2]][k] = nil
							leaderMessages[k] = nil
							refreshCatList(leaderArgs[2])
							if vQueueFrame:IsShown() and selectedQuery == leaderArgs[2] then vQueue_UpdateHostScroll(scrollbar:GetValue()) end
						end
					end
					if timeDiff > (40) then -- remove vQueue groups after 40 seconds
						if groups[leaderArgs[2]] and groups[leaderArgs[2]][k] ~= nil then
							local thisframe, bg, name, level, size, tank, healer, damage = groups[leaderArgs[2]][k]:GetRegions()
							if size:GetText() ~= "?" then
								groups[leaderArgs[2]][k]:Hide()
								groups[leaderArgs[2]][k] = nil
								leaderMessages[k] = nil
								refreshCatList(leaderArgs[2])
								if vQueueFrame:IsShown() and selectedQuery == leaderArgs[2] then vQueue_UpdateHostScroll(scrollbar:GetValue()) end
							end
						end
					end
				end
			end
		end
	end
	
	-- CHAT LIMITER
	if(chatRate > 0) then
		lastUpdate = lastUpdate + arg1
		-- MESSAGES TO SEND GO HERE
		if (lastUpdate > (1/chatRate)) then
			lastUpdate = 0
			--queue of chat messages limited to 3 per second
			if next(chatQueue) ~= nil then
				for key,value in pairs(chatQueue) do 
					local args = split(key, "\-")
					SendChatMessage(args[1] , args[2], nil , args[3]);
					removeFromSet(chatQueue, key)
					break
				end
			end
		end
	end
end

SlashCmdList["vQueue"] = vQueue_SlashCommandHandler
SLASH_vQueue1 = "/vQueue"