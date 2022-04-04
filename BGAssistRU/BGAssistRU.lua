-- BGAssist 
-- Copyright 2005 original author. Copyright is expressly not transferred to Blizzard.
-- 
-- Battleground helper functionality
BGASSIST_VERSION = "2018.04.25";

BINDING_HEADER_BGASSIST_SEP = "BGAssistRU";
GET_RANK_ICON = function(value)
	local dir = [[Interface\PvPRankBadges\PvPRank]]
	local a = 'rank' and value < 10 and '0' or ''
	return dir .. a .. value
end
-- Is stolen from Interface/GlueXML/CharacterCreate.lua
local CLASS_ICON_TCOORDS = {
	[string.upper(CLASS_WARRIOR)]	= {0, 0.25, 0, 0.25},
	[string.upper(CLASS_MAGE)]		= {0.25, 0.49609375, 0, 0.25},
	[string.upper(CLASS_ROGUE)]		= {0.49609375, 0.7421875, 0, 0.25},
	[string.upper(CLASS_DRUID)]		= {0.7421875, 0.98828125, 0, 0.25},
	[string.upper(CLASS_HUNTER)]	= {0, 0.25, 0.25, 0.5},
	[string.upper(CLASS_PRIEST)]	= {0.49609375, 0.7421875, 0.25, 0.5},
	[string.upper(CLASS_WARLOCK)]	= {0.7421875, 0.98828125, 0.25, 0.5},
	[string.upper(CLASS_SHAMAN)]	= {0.25, 0.49609375, 0.25, 0.5},
	[string.upper(CLASS_PALADIN)]	= {0, 0.25, 0.5, 0.75}
}

local BATTLEFIELD_INDEXES = {
	[1] = ALTERACVALLEY;
	[2] = WARSONGGULCH;
	[3] = ARATHIBASIN;
}

local BGAssistCFM ={}
local MAXTIMERS = 6;
local MAXICONS = 10;
local EVENTSINBATTLEGROUND = {
	-- Bag item tracking
	"BAG_UPDATE",
	-- Track into quest windows for autocomplete
	"QUEST_PROGRESS",
	"QUEST_COMPLETE",
	"QUEST_GREETING",
	"QUEST_DETAIL",
	--"GOSSIP_SHOW",
	-- Autorez
	"AREA_SPIRIT_HEALER_IN_RANGE",
	-- People counting
	"UPDATE_BATTLEFIELD_SCORE",
	-- Chat messages
	"CHAT_MSG_MONSTER_YELL",
	"CHAT_MSG_BG_SYSTEM_NEUTRAL",
	"CHAT_MSG_BG_SYSTEM_ALLIANCE",
	"CHAT_MSG_BG_SYSTEM_HORDE",
	-- Warsaw flag tracking
	"UPDATE_WORLD_STATES",
	-- PARTAHHHH
	"PARTY_INVITE_REQUEST",
	"PARTY_MEMBERS_CHANGED",
	"PARTY_LEADER_CHANGED",
	-- Well duh
	"PLAYER_DEAD",
	"RAID_ROSTER_UPDATE",
	"RAID_TARGET_UPDATE",
}

BGAssist_Player = nil; -- global;
local BGAssistRU_Config_Loaded = nil;
local BGAssist_CountedPlayers = nil;
local BGAssist_Scheduled_MapCheck = nil;
local BGAssist_InBattleGround = nil;
local BGAssist_TimersActive = nil;
local BGAssist_LastTimersProc = 0;
local BGAssist_MapItems = {};
local BGAssist_TrackedItems = {};
local BGAssist_ItemInfo = {};
local BGAssist_RezSyncTime = nil;
local BGAssist_FlagLocs = { };
local BGAssist_LastUpdate = 0;
local BGAssist_PreExistingInstances = nil;
local BGAssist_InAFK = nil;

local function BGAssist_LinkDecode(link)
	local id, name;
	_, _, id, name = string.find(link,"|Hitem:(%d+):%d+:%d+:%d+|h%[([^]]+)%]|h|r$");
	-- Only first number of itemid is significant in this.
	if (id and name) then
		id = id * 1;
		return name, id;
	end
end

local function BGAssist_BagCheck()
	local bag, slot, size;
	BGAssist_TrackedItems = {};
	for bag = 0, 4, 1 do
		if (bag == 0) then
			size = 16;
		else
			size = GetContainerNumSlots(bag);
		end
		if (size and size > 0) then
			for slot = 1, size, 1 do
				local itemLink = GetContainerItemLink(bag,slot);
				if (itemLink) then
					local itemName, itemID = BGAssist_LinkDecode(itemLink);
					local texture, itemCount = GetContainerItemInfo(bag,slot);
					if (itemID and BGAssist_ItemTrack[itemID]) then
						if (not BGAssist_TrackedItems[itemID]) then
							BGAssist_TrackedItems[itemID] = 0;
						end
						BGAssist_ItemInfo[itemID] = {
							["name"] = itemName, 
							["texture"] = texture;
						};
						BGAssist_TrackedItems[itemID] = BGAssist_TrackedItems[itemID] + itemCount;
					end
				end
			end
		end
	end
	if (BGAssist_Timers:IsVisible()) then
		BGAssist_Timers_OnShow();
	end
end

local function BGAssist_CheckMap()
	local OUTOFZONEDATA = {
		[1] = { "Dead Guys", "", 3 };
		[2] = { "Bar", "Drink Here", 8};
		[3] = { "Elves Head Point", "ELVES DIE", 11 };
		[4] = { "Monkey", "Monkey", 13 };
	};
	local totallandmarks = GetNumMapLandmarks()
	local name, description, typ, x, y;
	local i;
	for i = 1, totallandmarks, 1 do
		name, description, typ, x, y = GetMapLandmarkInfo(i);
		-- typ:
		-- Alterac Valley
		--  0 = Mines, no icon
		--  1 = Horde controlled mine
		--  2 = Alliance controlled mine
		--  3 = Horde graveyard attacked by Alliance
		--  4 = Towns (Booty Bay, Stonard, etc)
		--  5 = Destroyed tower
		--  6 = 
		--  7 = Uncontrolled Graveyard (Snowfall at start)
		--  8 = Horde tower attacked by Alliance
		--  9 = Horde controlled tower
		-- 10 = Alliance controlled tower
		-- 11 = Alliance tower attacked by Horde
		-- 12 = Horde controlled graveyard
		-- 13 = Alliance graveyard attacked by Horde
		-- 14 = Alliance controlled graveyard
		-- 15 = Garrisons/Caverns, no icon
		-- Arathi Basin
		-- 16 - Gold Mine - Uncontrolled
		-- 17 - Gold Mine .. in conflict (Alliance capturing)
		-- 18 - Gold Mine - Alliance controlled
		-- 19 = Gold Mine .. in conflict (Horde capturing)
		-- 20 = Gold Mine - Horde Controlled
		-- 21 = Lumber Mill - Uncontrolled
		-- 22 = Lumber Mill .. in conflict (Alliance capturing)
		-- 23 = Lumber Mill - Alliance controlled
		-- 24 = Lumber Mill .. in conflict (Horde capturing)
		-- 25 = Lumber Mill - Horde Controlled
		-- 26 = Blacksmith - Uncontrolled
		-- 27 = Blacksmith .. in conflict (Alliance capturing)
		-- 28 = Blacksmith - Alliance controlled
		-- 29 = Blacksmith .. in conflict (Horde capturing)
		-- 30 = Blacksmith - Horde controlled
		-- 31 = Farm - Uncontrolled
		-- 32 = Farm .. in conflict (Alliance capturing)
		-- 33 = Farm - Alliance controlled
		-- 34 = Farm .. in conflict (Horde capturing)
		-- 35 = Farm - Horde controlled
		-- 36 = Stables - Uncontrolled
		-- 37 = Stables .. in conflict (Alliance capturing)
		-- 38 = Stables - Alliance controlled
		-- 39 = Stables .. in conflict (Horde capturing)
		-- 40 = Stables - Horde controlled
		if (not BGAssist_MapItems[name]) then BGAssist_MapItems[name] = {} end
		if (typ == 11 or typ == 13 or typ == 9 or typ == 12 -- AV
		or typ == 20 or typ == 25 or typ == 30 or typ == 35 or typ == 40 -- AB
		or typ == 19 or typ == 24 or typ == 29 or typ == 34 or typ == 39 -- AB captures
		) then
			if (BGAssist_MapItems[name].owner ~= "HORDE") then
				BGAssist_MapItems[name].owner = "HORDE";
				BGAssist_MapItems[name].conflictstart = nil;
			end
		elseif (typ == 10 or typ == 3 or typ == 8 or typ == 14 -- AV
		or typ == 18 or typ == 23 or typ == 28 or typ == 33 or typ == 38 -- AB
		or typ == 17 or typ == 22 or typ == 27 or typ == 32 or typ == 37 -- AB captures
		) then
			if (BGAssist_MapItems[name].owner ~= "ALLIANCE") then
				BGAssist_MapItems[name].owner = "ALLIANCE";
				BGAssist_MapItems[name].conflictstart = nil;
			end
		elseif (typ == 0 or typ == 5 or typ == 15 -- AV
			) then
			BGAssist_MapItems[name].owner = nil;
		end
		if (typ == 3 or typ == 13 or typ == 8 or typ == 11) then -- AV
			if (not BGAssist_MapItems[name].conflictstart) then
				BGAssist_MapItems[name].conflictstart = GetTime();
				BGAssist_MapItems[name].conflictduration = 300;
			end
		elseif (typ == 17 or typ == 22 or typ == 27 or typ == 32 or typ == 37 or
			typ == 19 or typ == 24 or typ == 29 or typ == 34 or typ == 39) then
			if (not BGAssist_MapItems[name].conflictstart) then
				BGAssist_MapItems[name].conflictstart = GetTime();
				BGAssist_MapItems[name].conflictduration = 60;
			end
		else
			BGAssist_MapItems[name].conflictstart = nil
		end
		if (typ ==  6 or typ > 40) then
			if (Debug) then Debug ("UNKNOWN: "..name.." = "..description.." = "..typ); end
		end
	end
	if (not BGAssistRU_Config.timerhide) then
		BGAssist_Timers_OnShow();
	end
end

function BGAssist_Counts(fr)
	local con=0
	for i=0,14,1 do
		if i~=0 and BGAssist_CountedPlayers[fr]["Rank"][i] then
			con=con+BGAssist_CountedPlayers[fr]["Rank"][i]*i
		elseif BGAssist_CountedPlayers[fr]["Rank"][i] then
			con=con+BGAssist_CountedPlayers[fr]["Rank"][i]*.5
		end
	end
	local text=BINDING_HEADER_BGASSIST_SEP..' '..fr..': '..con..' '
	for i=14,0,-1 do
		if BGAssist_CountedPlayers[fr]["Rank"][i] and BGAssist_CountedPlayers[fr]["Rank"][i]>0 then
			text=text..' Rank'..i..' - x'..BGAssist_CountedPlayers[fr]['Rank'][i]..';'
		end
	end
return text
end

function BGAssist_Count(fr,raank)
	local text=BINDING_HEADER_BGASSIST_SEP..' '..fr..': Rank'..raank..': '
	if fr=='Horde' then fr='H' else fr='A' end
	if _G['BGAssistCfmF'..fr..raank].names then
		text=text.._G['BGAssistCfmF'..fr..raank].names
	end
return text
end
function BGAssist_CountPlayers()
	local players = GetNumBattlefieldScores();
	for i=0,14,1 do
		if BGAssistRU_Config.rankwindow then
			_G['BGAssistCfmFH'..i].names=nil
			_G['BGAssistCfmFA'..i].names=nil
			_G['BGACFHorde'..i].text:SetText('0')
			_G['BGACFAlliance'..i].text:SetText('0')
		end
	end
	if (players > 0) then
		local i,s;
		BGAssist_CountedPlayers = {
			["Horde"] = {
				["count"] = 0,
				["Rank"] = {
					['0'] = 0, ['1'] = 0, ['2'] = 0,
					['3'] = 0, ['4'] = 0, ['5'] = 0,
					['6'] = 0, ['7'] = 0, ['8'] = 0,
					['9'] = 0, ['10'] = 0, ['11'] = 0,
					['12'] = 0, ['13'] = 0, ['14'] = 0
				},
				[CLASS_DRUID] = 0, [CLASS_HUNTER] = 0, [CLASS_MAGE] = 0,
				[CLASS_PRIEST] = 0, [CLASS_ROGUE] = 0, [CLASS_SHAMAN] = 0,
				[CLASS_WARRIOR] = 0, [CLASS_WARLOCK] = 0
			},
			["Alliance"] = {
				["count"] = 0,
				["Rank"] = {
					['0'] = 0, ['1'] = 0, ['2'] = 0,
					['3'] = 0, ['4'] = 0, ['5'] = 0,
					['6'] = 0, ['7'] = 0, ['8'] = 0,
					['9'] = 0, ['10'] = 0, ['11'] = 0,
					['12'] = 0, ['13'] = 0, ['14'] = 0
				},
				[CLASS_DRUID] = 0, [CLASS_HUNTER] = 0, [CLASS_MAGE] = 0,
				[CLASS_PALADIN] = 0, [CLASS_PRIEST] = 0, [CLASS_ROGUE] = 0,
				[CLASS_WARRIOR] = 0, [CLASS_WARLOCK] = 0
			} 
		}
		for i = 1, players, 1 do
			local name, _, _, _, _, faction, rank, _, class = GetBattlefieldScore(i);
			if rank and rank~=0 then rank=rank-4 end
			if (faction == 0) then
				faction = "Horde"
					if BGAssistRU_Config.rankwindow then
						s=_G['BGAssistCfmFH'..rank].names
						if name and rank and not s then
							_G['BGAssistCfmFH'..rank].names = name
						elseif name and rank then
							if not string.find(s,name) then
								_G['BGAssistCfmFH'..rank].names=s..", "..name
							end
						end
					end
			else
				faction = "Alliance"
					if BGAssistRU_Config.rankwindow then
						s=_G['BGAssistCfmFA'..rank].names
						if name and rank and not s then
							_G['BGAssistCfmFA'..rank].names=name
						elseif name and rank then
							if not string.find(s,name) then
								_G['BGAssistCfmFA'..rank].names=s..", "..name
							end
						end
					end
			end
			BGAssist_CountedPlayers[faction].count = BGAssist_CountedPlayers[faction].count + 1;
			if class and not BGAssist_CountedPlayers[faction][class] then BGAssist_CountedPlayers[faction][class]=0 end
			if rank and not BGAssist_CountedPlayers[faction]["Rank"][rank] then BGAssist_CountedPlayers[faction]["Rank"][rank]=0 end
			if class then BGAssist_CountedPlayers[faction][class] = BGAssist_CountedPlayers[faction][class] + 1 end
			if rank and BGAssistRU_Config.rankwindow then BGAssist_CountedPlayers[faction]["Rank"][rank] = BGAssist_CountedPlayers[faction]["Rank"][rank] + 1
			_G['BGACF'..faction..rank].text:SetText(BGAssist_CountedPlayers[faction]["Rank"][rank]) end
		end

		local faction = { "Alliance", "Horde" };
		local classes = { CLASS_WARRIOR, CLASS_MAGE, CLASS_ROGUE, CLASS_DRUID, CLASS_HUNTER,
			CLASS_PRIEST, CLASS_WARLOCK, CLASS_SHAMAN };
		local i, j
		for i = 1, 2, 1 do
			for j = 1, 8, 1 do
				if (i == 1 and j == 8) then
					_G['WorldStateScoreFrame_'..faction[i]..j..'Text']:SetText(CLASS_PALADIN..": "..BGAssist_CountedPlayers[faction[i]][CLASS_PALADIN]);
				else
					_G['WorldStateScoreFrame_'..faction[i]..j..'Text']:SetText(classes[j]..": "..BGAssist_CountedPlayers[faction[i]][classes[j]]);
				end
			end
		end
	end
end

local function BGAssist_Alterac_SelectQuest(...) 
	local i;
	local idx = 0;
	for i = 1, arg.n, 2 do
		idx = idx + 1;
		if (BGAssist_Alterac_Quests[arg[i]]) then
			local item, min, max
			if (type(BGAssist_Alterac_Quests[arg[i]]) == "table") then
				item = BGAssist_Alterac_Quests[arg[i]].item;
				min = BGAssist_Alterac_Quests[arg[i]].min;
				max = BGAssist_Alterac_Quests[arg[i]].max;
			else
				item = true;
			end
			if (not min or min < 1) then min = 1; end
			if (not max) then max = 1000; end
			local count = BGAssist_TrackedItems[item];
			if (not count) then count = 0; end
			if (item == true or (count >= min and count <= max)) then
				if (not BGAssistRU_Config[BGAssist_Player].turnins[arg[i]]) then
					BGAssistRU_Config[BGAssist_Player].turnins[arg[i]] = 0;
				end
				BGAssistRU_Config[BGAssist_Player].turnins[arg[i]] = BGAssistRU_Config[BGAssist_Player].turnins[arg[i]] + min;
				SelectGossipAvailableQuest(idx);
			end
		end
	end
end

local function BGAssist_SignUpForBG(...) 
	local i;
	local idx = 0;
	for i = 1, arg.n, 2 do
		idx = idx + 1;
		if (arg[i] == BATTLEGROUND_GOSSIP_TEXT) then
			SelectGossipOption(idx);
		end
	end
end

local function BGAssist_Alterac_AutoProcess(method)
	local qtitle = GetTitleText()
	if string.find(qtitle,"]") then
		qtitle=string.sub(qtitle,string.find(qtitle,"]")+2)
	end
	if BGAssist_Alterac_Quests[qtitle] then
		if (method == "QUEST_COMPLETE") then
			QuestRewardCompleteButton_OnClick();
		elseif (method == "QUEST_PROGRESS") then
			QuestProgressCompleteButton_OnClick();
		elseif (method == "QUEST_DETAIL") then
			QuestDetailAcceptButton_OnClick();
		elseif (Debug) then
			Debug ("Unknown METHOD: "..method.." for "..qtitle);
		end
	end
end

local function BGAssistRU_ConfigInit()
	if (not BGAssistRU_Config) then
		BGAssistRU_Config = {};
	end
	if (not BGAssistRU_Config[BGAssist_Player]) then
		BGAssistRU_Config[BGAssist_Player] = {};
	end
	if (not BGAssistRU_Config[BGAssist_Player].turnins) then
		BGAssistRU_Config[BGAssist_Player].turnins = {};
	end
	if not BGAssistRU_Config[BGAssist_Player].MinimapPos or type(BGAssistRU_Config[BGAssist_Player].MinimapPos) == "number" then
		BGAssistRU_Config[BGAssist_Player].MinimapPos = {}
		BGAssistRU_Config[BGAssist_Player].MinimapPos.x, BGAssistRU_Config[BGAssist_Player].MinimapPos.y = {-180,0}
	end
	if (BGAssist_InBattleGround == ALTERACVALLEY or BGAssist_InBattleGround == ARATHIBASIN) then
		BGAssist_CheckMap();
	end
	BGAssist_ToggleAutoEntry("ON")
end

function BGAssist_OnLoad()
	_G = getfenv(0)
	this:RegisterEvent("ADDON_LOADED")
	this:RegisterEvent("PLAYER_ENTERING_WORLD")
	-- Autoenter
	this:RegisterEvent("BATTLEFIELDS_SHOW")
	this:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
	this:RegisterEvent("CHAT_MSG_SYSTEM")
	this:RegisterEvent("GOSSIP_SHOW")
	local miniDrag = false
	local playerName = UnitName("player")
	if (playerName ~= UKNOWNBEING and playerName ~= UNKNOWNOBJECT) then
		BGAssist_Player = playerName;
	end
end

function BGAssist_ButtonAutomates(rank,ahorde)
	BGAssistCFMTool:ClearLines()
	BGAssistCFMTool:SetText("BGAssistRU: Rank "..rank)
	BGAssistCFMToolTextLeft1:SetTextColor(1, 1, 1)
	BGAssistCFMTool:AddLine(_G['BGAssistCfmF'..ahorde..rank].names)
	BGAssistCFMTool:Show()
end

function BGAssist_OnEvent(event)
	--if (event == "VARIABLES_LOADED") then
		-- BGAssistRU_Config_Loaded = 1;
		-- if (BGAssist_Player) then
			-- BGAssistRU_ConfigInit();
		-- end
	if event == "ADDON_LOADED" and arg1 == BINDING_HEADER_BGASSIST_SEP then
		BGAssistRU_Config_Loaded = 1;
		if (BGAssist_Player) then
			BGAssistRU_ConfigInit();
		end
--BY CFM//
		BGAssistCFM.backdrop = {
			bgFile = "Interface/Tooltips/UI-Tooltip-Background", tile = true, tileSize = 8,
			edgeFile = "Interface/Tooltips/UI-Tooltip-Border", edgeSize = 8,
			insets = {left = 1, right = 1, top = 1, bottom = 1},
		}
		BGAssistCfmFrame = CreateFrame("Frame","", WorldStateScoreFrame)
		BGAssistCfmFrame:SetWidth(560)
		BGAssistCfmFrame:SetHeight(45)
		BGAssistCfmFrame:ClearAllPoints()
		BGAssistCfmFrame:SetPoint("LEFT", WorldStateScoreFrame,"LEFT",10,265)
		BGAssistCfmFrame:SetFrameStrata("MEDIUM")
		BGAssistCfmFrame:SetMovable(true)
		BGAssistCfmFrame:EnableMouse(true)
		BGAssistCfmFrame:SetBackdrop(BGAssistCFM.backdrop)
		BGAssistCfmFrame:SetBackdropColor(0, 0, 0, 1)
		BGAssistCfmFrame:SetScript("OnMouseDown", function(self, button)
			if (not BGAssistRU_Config.windowlocked) then BGAssistCfmFrame:StartMoving() end
		end)
		BGAssistCfmFrame:SetScript("OnMouseUp", function(self, button)
			if (not BGAssistRU_Config.windowlocked) then BGAssistCfmFrame:StopMovingOrSizing() end
		end)

		CreateFrame( "GameTooltip", "BGAssistCFMTool", nil, "GameTooltipTemplate" )
		--First icon for the HORDE players
		BGAssistCfmFH = CreateFrame("Button","BGACFHorde", BGAssistCfmFrame)
		BGAssistCfmFH:SetWidth(18)
		BGAssistCfmFH:SetHeight(18)
		BGAssistCfmFH:ClearAllPoints()
		BGAssistCfmFH:SetPoint("RIGHT", BGAssistCfmFrame,"LEFT",25,9) 
		BGAssistCfmFH.rankIcon=BGAssistCfmFH:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH.rankIcon:SetAllPoints()
		BGAssistCfmFH.rankIcon:SetTexture("Interface\\PvPRankBadges\\PvPRankHorde")
		BGAssistCfmFH:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner( this, "ANCHOR_CURSOR" )
			BGAssistCFMTool:ClearLines()
			BGAssistCFMTool:SetText(BINDING_HEADER_BGASSIST_SEP..' '..FACTION_HORDE)
			BGAssistCFMToolTextLeft1:SetTextColor(1, 1, 1)
			BGAssistCFMTool:AddLine(DISPLAY_RANKSCOUNT)
			BGAssistCFMTool:Show()
		 end)
		BGAssistCfmFH:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Counts('Horde'), 'battleground')
		 end)
		--H14
		BGAssistCfmFH14 = CreateFrame("Button","BGACFHorde14", BGAssistCfmFrame)
		BGAssistCfmFH14:SetWidth(18)
		BGAssistCfmFH14:SetHeight(18)
		BGAssistCfmFH14:ClearAllPoints()
		BGAssistCfmFH14:SetPoint("LEFT", BGAssistCfmFH,"RIGHT",24,0) 
		BGAssistCfmFH14.rankIcon=BGAssistCfmFH14:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH14.rankIcon:SetAllPoints()
		BGAssistCfmFH14.rankIcon:SetTexture(GET_RANK_ICON(14))
		BGAssistCfmFH14.text = BGAssistCfmFH14:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH14.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH14.text:SetTextColor(1, .2, .2)
		BGAssistCfmFH14.text:SetPoint('RIGHT', BGAssistCfmFH14,-16,0)
		BGAssistCfmFH14.text:SetText("0")
		BGAssistCfmFH14:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner( this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("14","H")
		 end)
		BGAssistCfmFH14:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH14:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','14'), 'battleground')
		 end)
		--H13
		BGAssistCfmFH13 = CreateFrame("Button","BGACFHorde13", BGAssistCfmFrame)
		BGAssistCfmFH13:SetWidth(18)
		BGAssistCfmFH13:SetHeight(18)
		BGAssistCfmFH13:ClearAllPoints()
		BGAssistCfmFH13:SetPoint("LEFT", BGAssistCfmFH14,"RIGHT",16,0) 
		BGAssistCfmFH13.rankIcon=BGAssistCfmFH13:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH13.rankIcon:SetAllPoints()
		BGAssistCfmFH13.rankIcon:SetTexture(GET_RANK_ICON(13))
		BGAssistCfmFH13.text = BGAssistCfmFH13:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH13.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH13.text:SetTextColor(1, .3, .2)
		BGAssistCfmFH13.text:SetPoint('RIGHT', BGAssistCfmFH13,-16,0)
		BGAssistCfmFH13.text:SetText("0")
		BGAssistCfmFH13:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("13","H")
		 end)
		BGAssistCfmFH13:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH13:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','13'), 'battleground')
		 end)
		--H12
		BGAssistCfmFH12 = CreateFrame("Button","BGACFHorde12", BGAssistCfmFrame)
		BGAssistCfmFH12:SetWidth(18)
		BGAssistCfmFH12:SetHeight(18)
		BGAssistCfmFH12:ClearAllPoints()
		BGAssistCfmFH12:SetPoint("LEFT", BGAssistCfmFH13,"RIGHT",16,0) 
		BGAssistCfmFH12.rankIcon=BGAssistCfmFH12:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH12.rankIcon:SetAllPoints()
		BGAssistCfmFH12.rankIcon:SetTexture(GET_RANK_ICON(12))
		BGAssistCfmFH12.text = BGAssistCfmFH12:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH12.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH12.text:SetTextColor(1, .4, .2)
		BGAssistCfmFH12.text:SetPoint('RIGHT', BGAssistCfmFH12,-16,0)
		BGAssistCfmFH12.text:SetText("0")
		BGAssistCfmFH12:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("12","H")
		 end)
		BGAssistCfmFH12:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH12:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','12'), 'battleground')
		 end)
		--H11
		BGAssistCfmFH11 = CreateFrame("Button","BGACFHorde11", BGAssistCfmFrame)
		BGAssistCfmFH11:SetWidth(18)
		BGAssistCfmFH11:SetHeight(18)
		BGAssistCfmFH11:ClearAllPoints()
		BGAssistCfmFH11:SetPoint("LEFT", BGAssistCfmFH12,"RIGHT",16,0) 
		BGAssistCfmFH11.rankIcon=BGAssistCfmFH11:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH11.rankIcon:SetAllPoints()
		BGAssistCfmFH11.rankIcon:SetTexture(GET_RANK_ICON(11))
		BGAssistCfmFH11.text = BGAssistCfmFH11:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH11.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH11.text:SetTextColor(1, .45, .2)
		BGAssistCfmFH11.text:SetPoint('RIGHT', BGAssistCfmFH11,-16,0)
		BGAssistCfmFH11.text:SetText("0")
		BGAssistCfmFH11:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner( this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("11","H")
		 end)
		BGAssistCfmFH11:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH11:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','11'), 'battleground')
		 end)
		--H10
		BGAssistCfmFH10 = CreateFrame("Button","BGACFHorde10", BGAssistCfmFrame)
		BGAssistCfmFH10:SetWidth(18)
		BGAssistCfmFH10:SetHeight(18)
		BGAssistCfmFH10:ClearAllPoints()
		BGAssistCfmFH10:SetPoint("LEFT", BGAssistCfmFH11,"RIGHT",16,0) 
		BGAssistCfmFH10.rankIcon=BGAssistCfmFH10:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH10.rankIcon:SetAllPoints()
		BGAssistCfmFH10.rankIcon:SetTexture(GET_RANK_ICON(10))
		BGAssistCfmFH10.text = BGAssistCfmFH10:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH10.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH10.text:SetTextColor(1, .45, .3)
		BGAssistCfmFH10.text:SetPoint('RIGHT', BGAssistCfmFH10,-16,0)
		BGAssistCfmFH10.text:SetText("0")
		BGAssistCfmFH10:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("10","H")
		 end)
		BGAssistCfmFH10:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH10:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','10'), 'battleground')
		 end)
		--H9
		BGAssistCfmFH9 = CreateFrame("Button","BGACFHorde9", BGAssistCfmFrame)
		BGAssistCfmFH9:SetWidth(18)
		BGAssistCfmFH9:SetHeight(18)
		BGAssistCfmFH9:ClearAllPoints()
		BGAssistCfmFH9:SetPoint("LEFT", BGAssistCfmFH10,"RIGHT",16,0) 
		BGAssistCfmFH9.rankIcon=BGAssistCfmFH9:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH9.rankIcon:SetAllPoints()
		BGAssistCfmFH9.rankIcon:SetTexture(GET_RANK_ICON(9))
		BGAssistCfmFH9.text = BGAssistCfmFH9:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH9.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH9.text:SetTextColor(1, .5, .3)
		BGAssistCfmFH9.text:SetPoint('RIGHT', BGAssistCfmFH9,-16,0)
		BGAssistCfmFH9.text:SetText("0")
		BGAssistCfmFH9:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("9","H")
		 end)
		BGAssistCfmFH9:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH9:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','9'), 'battleground')
		 end)
		--H8
		BGAssistCfmFH8 = CreateFrame("Button","BGACFHorde8", BGAssistCfmFrame)
		BGAssistCfmFH8:SetWidth(18)
		BGAssistCfmFH8:SetHeight(18)
		BGAssistCfmFH8:ClearAllPoints()
		BGAssistCfmFH8:SetPoint("LEFT", BGAssistCfmFH9,"RIGHT",16,0) 
		BGAssistCfmFH8.rankIcon=BGAssistCfmFH8:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH8.rankIcon:SetAllPoints()
		BGAssistCfmFH8.rankIcon:SetTexture(GET_RANK_ICON(8))
		BGAssistCfmFH8.text = BGAssistCfmFH8:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH8.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH8.text:SetTextColor(1, .5, .35)
		BGAssistCfmFH8.text:SetPoint('RIGHT', BGAssistCfmFH8,-16,0)
		BGAssistCfmFH8.text:SetText("0")
		BGAssistCfmFH8:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("8","H")
		 end)
		BGAssistCfmFH8:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH8:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','8'), 'battleground')
		 end)
		--H7
		BGAssistCfmFH7 = CreateFrame("Button","BGACFHorde7", BGAssistCfmFrame)
		BGAssistCfmFH7:SetWidth(18)
		BGAssistCfmFH7:SetHeight(18)
		BGAssistCfmFH7:ClearAllPoints()
		BGAssistCfmFH7:SetPoint("LEFT", BGAssistCfmFH8,"RIGHT",16,0) 
		BGAssistCfmFH7.rankIcon=BGAssistCfmFH7:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH7.rankIcon:SetAllPoints()
		BGAssistCfmFH7.rankIcon:SetTexture(GET_RANK_ICON(7))
		BGAssistCfmFH7.text = BGAssistCfmFH7:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH7.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH7.text:SetTextColor(1, .5, .4)
		BGAssistCfmFH7.text:SetPoint('RIGHT', BGAssistCfmFH7,-16,0)
		BGAssistCfmFH7.text:SetText("0")
		BGAssistCfmFH7:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("7","H")
		 end)
		BGAssistCfmFH7:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH7:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','7'), 'battleground')
		 end)
		--H6
		BGAssistCfmFH6 = CreateFrame("Button","BGACFHorde6", BGAssistCfmFrame)
		BGAssistCfmFH6:SetWidth(18)
		BGAssistCfmFH6:SetHeight(18)
		BGAssistCfmFH6:ClearAllPoints()
		BGAssistCfmFH6:SetPoint("LEFT", BGAssistCfmFH7,"RIGHT",16,0) 
		BGAssistCfmFH6.rankIcon=BGAssistCfmFH6:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH6.rankIcon:SetAllPoints()
		BGAssistCfmFH6.rankIcon:SetTexture(GET_RANK_ICON(6))
		BGAssistCfmFH6.text = BGAssistCfmFH6:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH6.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH6.text:SetTextColor(1, .55, .4)
		BGAssistCfmFH6.text:SetPoint('RIGHT', BGAssistCfmFH6,-16,0)
		BGAssistCfmFH6.text:SetText("0")
		BGAssistCfmFH6:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("6","H")
		 end)
		BGAssistCfmFH6:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH6:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','6'), 'battleground')
		 end)
		--H5
		BGAssistCfmFH5 = CreateFrame("Button","BGACFHorde5", BGAssistCfmFrame)
		BGAssistCfmFH5:SetWidth(18)
		BGAssistCfmFH5:SetHeight(18)
		BGAssistCfmFH5:ClearAllPoints()
		BGAssistCfmFH5:SetPoint("LEFT", BGAssistCfmFH6,"RIGHT",16,0) 
		BGAssistCfmFH5.rankIcon=BGAssistCfmFH5:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH5.rankIcon:SetAllPoints()
		BGAssistCfmFH5.rankIcon:SetTexture(GET_RANK_ICON(5))
		BGAssistCfmFH5.text = BGAssistCfmFH5:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH5.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH5.text:SetTextColor(1, .55, .5)
		BGAssistCfmFH5.text:SetPoint('RIGHT', BGAssistCfmFH5,-16,0)
		BGAssistCfmFH5.text:SetText("0")
		BGAssistCfmFH5:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("5","H")
		 end)
		BGAssistCfmFH5:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH5:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','5'), 'battleground')
		 end)
		--H4
		BGAssistCfmFH4 = CreateFrame("Button","BGACFHorde4", BGAssistCfmFrame)
		BGAssistCfmFH4:SetWidth(18)
		BGAssistCfmFH4:SetHeight(18)
		BGAssistCfmFH4:ClearAllPoints()
		BGAssistCfmFH4:SetPoint("LEFT", BGAssistCfmFH5,"RIGHT",16,0) 
		BGAssistCfmFH4.rankIcon=BGAssistCfmFH4:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH4.rankIcon:SetAllPoints()
		BGAssistCfmFH4.rankIcon:SetTexture(GET_RANK_ICON(4))
		BGAssistCfmFH4.text = BGAssistCfmFH4:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH4.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH4.text:SetTextColor(1, .6, .5)
		BGAssistCfmFH4.text:SetPoint('RIGHT', BGAssistCfmFH4,-16,0)
		BGAssistCfmFH4.text:SetText("0")
		BGAssistCfmFH4:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("4","H")
		 end)
		BGAssistCfmFH4:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH4:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','4'), 'battleground')
		 end)
		--H3
		BGAssistCfmFH3 = CreateFrame("Button","BGACFHorde3", BGAssistCfmFrame)
		BGAssistCfmFH3:SetWidth(18)
		BGAssistCfmFH3:SetHeight(18)
		BGAssistCfmFH3:ClearAllPoints()
		BGAssistCfmFH3:SetPoint("LEFT", BGAssistCfmFH4,"RIGHT",16,0) 
		BGAssistCfmFH3.rankIcon=BGAssistCfmFH3:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH3.rankIcon:SetAllPoints()
		BGAssistCfmFH3.rankIcon:SetTexture(GET_RANK_ICON(3))
		BGAssistCfmFH3.text = BGAssistCfmFH3:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH3.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH3.text:SetTextColor(1, 7, .6)
		BGAssistCfmFH3.text:SetPoint('RIGHT', BGAssistCfmFH3,-16,0)
		BGAssistCfmFH3.text:SetText("0")
		BGAssistCfmFH3:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("3","H")
		 end)
		BGAssistCfmFH3:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH3:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','3'), 'battleground')
		 end)
		--H2
		BGAssistCfmFH2 = CreateFrame("Button","BGACFHorde2", BGAssistCfmFrame)
		BGAssistCfmFH2:SetWidth(18)
		BGAssistCfmFH2:SetHeight(18)
		BGAssistCfmFH2:ClearAllPoints()
		BGAssistCfmFH2:SetPoint("LEFT", BGAssistCfmFH3,"RIGHT",16,0) 
		BGAssistCfmFH2.rankIcon=BGAssistCfmFH2:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH2.rankIcon:SetAllPoints()
		BGAssistCfmFH2.rankIcon:SetTexture(GET_RANK_ICON(2))
		BGAssistCfmFH2.text = BGAssistCfmFH2:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH2.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH2.text:SetTextColor(1, 8, .7)
		BGAssistCfmFH2.text:SetPoint('RIGHT', BGAssistCfmFH2,-16,0)
		BGAssistCfmFH2.text:SetText("0")
		BGAssistCfmFH2:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("2","H")
		 end)
		BGAssistCfmFH2:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH2:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','2'), 'battleground')
		 end)
		--H1
		BGAssistCfmFH1 = CreateFrame("Button","BGACFHorde1", BGAssistCfmFrame)
		BGAssistCfmFH1:SetWidth(18)
		BGAssistCfmFH1:SetHeight(18)
		BGAssistCfmFH1:ClearAllPoints()
		BGAssistCfmFH1:SetPoint("LEFT", BGAssistCfmFH2,"RIGHT",16,0) 
		BGAssistCfmFH1.rankIcon=BGAssistCfmFH1:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH1.rankIcon:SetAllPoints()
		BGAssistCfmFH1.rankIcon:SetTexture(GET_RANK_ICON(1))
		BGAssistCfmFH1.text = BGAssistCfmFH1:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH1.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH1.text:SetTextColor(1, 1, .8)
		BGAssistCfmFH1.text:SetPoint('RIGHT', BGAssistCfmFH1,-16,0)
		BGAssistCfmFH1.text:SetText("0")
		BGAssistCfmFH1:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("1","H")
		 end)
		BGAssistCfmFH1:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH1:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','1'), 'battleground')
		 end)
		--H0
		BGAssistCfmFH0 = CreateFrame("Button","BGACFHorde0", BGAssistCfmFrame)
		BGAssistCfmFH0:SetWidth(18)
		BGAssistCfmFH0:SetHeight(18)
		BGAssistCfmFH0:ClearAllPoints()
		BGAssistCfmFH0:SetPoint("LEFT", BGAssistCfmFH1,"RIGHT",16,0) 
		BGAssistCfmFH0.rankIcon=BGAssistCfmFH0:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFH0.rankIcon:SetAllPoints()
		BGAssistCfmFH0.rankIcon:SetTexture("Interface\\Icons\\Ability_Hunter_SniperShot")
		BGAssistCfmFH0.text = BGAssistCfmFH0:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFH0.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFH0.text:SetTextColor(1, 1, 1)
		BGAssistCfmFH0.text:SetPoint('RIGHT', BGAssistCfmFH0,-16,0)
		BGAssistCfmFH0.text:SetText("0")
		BGAssistCfmFH0:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("0","H")
		 end)
		BGAssistCfmFH0:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFH0:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Horde','0'), 'battleground')
		 end)
		--First icon for the ALLIANCE players
		BGAssistCfmFA = CreateFrame("Button","BGACFAlliance", BGAssistCfmFrame)
		BGAssistCfmFA:SetWidth(18)
		BGAssistCfmFA:SetHeight(18)
		BGAssistCfmFA:ClearAllPoints()
		BGAssistCfmFA:SetPoint("TOP", BGAssistCfmFH,"BOTTOM",0,0) 
		BGAssistCfmFA.rankIcon=BGAssistCfmFA:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA.rankIcon:SetAllPoints()
		BGAssistCfmFA.rankIcon:SetTexture("Interface\\PvPRankBadges\\PvPRankAlliance")
		BGAssistCfmFA:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner( this, "ANCHOR_CURSOR" )
			BGAssistCFMTool:ClearLines()
			BGAssistCFMTool:SetText(BINDING_HEADER_BGASSIST_SEP..' '..FACTION_ALLIANCE)
			BGAssistCFMToolTextLeft1:SetTextColor(1, 1, 1)
			BGAssistCFMTool:AddLine(DISPLAY_RANKSCOUNT)
			BGAssistCFMTool:Show()
		 end)
		BGAssistCfmFA:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Counts('Alliance'), 'battleground')
		 end)
		--A14
		BGAssistCfmFA14 = CreateFrame("Button","BGACFAlliance14", BGAssistCfmFrame)
		BGAssistCfmFA14:SetWidth(18)
		BGAssistCfmFA14:SetHeight(18)
		BGAssistCfmFA14:ClearAllPoints()
		BGAssistCfmFA14:SetPoint("LEFT", BGAssistCfmFA,"RIGHT",24,0) 
		BGAssistCfmFA14.rankIcon=BGAssistCfmFA14:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA14.rankIcon:SetAllPoints()
		BGAssistCfmFA14.rankIcon:SetTexture(GET_RANK_ICON(14))
		BGAssistCfmFA14.text = BGAssistCfmFA14:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA14.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA14.text:SetTextColor(1, .2, .2)
		BGAssistCfmFA14.text:SetPoint('RIGHT', BGAssistCfmFA14,-16,0)
		BGAssistCfmFA14.text:SetText("0")
		BGAssistCfmFA14:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("14","A")
		 end)
		BGAssistCfmFA14:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA14:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','14'), 'battleground')
		 end)
		--A13
		BGAssistCfmFA13 = CreateFrame("Button","BGACFAlliance13", BGAssistCfmFrame)
		BGAssistCfmFA13:SetWidth(18)
		BGAssistCfmFA13:SetHeight(18)
		BGAssistCfmFA13:ClearAllPoints()
		BGAssistCfmFA13:SetPoint("LEFT", BGAssistCfmFA14,"RIGHT",16,0) 
		BGAssistCfmFA13.rankIcon=BGAssistCfmFA13:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA13.rankIcon:SetAllPoints()
		BGAssistCfmFA13.rankIcon:SetTexture(GET_RANK_ICON(13))
		BGAssistCfmFA13.text = BGAssistCfmFA13:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA13.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA13.text:SetTextColor(1, .3, .2)
		BGAssistCfmFA13.text:SetPoint('RIGHT', BGAssistCfmFA13,-16,0)
		BGAssistCfmFA13.text:SetText("0")
		BGAssistCfmFA13:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("13","A")
		 end)
		BGAssistCfmFA13:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA13:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','13'), 'battleground')
		 end)
		--A12
		BGAssistCfmFA12 = CreateFrame("Button","BGACFAlliance12", BGAssistCfmFrame)
		BGAssistCfmFA12:SetWidth(18)
		BGAssistCfmFA12:SetHeight(18)
		BGAssistCfmFA12:ClearAllPoints()
		BGAssistCfmFA12:SetPoint("LEFT", BGAssistCfmFA13,"RIGHT",16,0) 
		BGAssistCfmFA12.rankIcon=BGAssistCfmFA12:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA12.rankIcon:SetAllPoints()
		BGAssistCfmFA12.rankIcon:SetTexture(GET_RANK_ICON(12))
		BGAssistCfmFA12.text = BGAssistCfmFA12:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA12.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA12.text:SetTextColor(1, .4, .2)
		BGAssistCfmFA12.text:SetPoint('RIGHT', BGAssistCfmFA12,-16,0)
		BGAssistCfmFA12.text:SetText("0")
		BGAssistCfmFA12:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("12","A")
		 end)
		BGAssistCfmFA12:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA12:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','12'), 'battleground')
		 end)
		--A11
		BGAssistCfmFA11 = CreateFrame("Button","BGACFAlliance11", BGAssistCfmFrame)
		BGAssistCfmFA11:SetWidth(18)
		BGAssistCfmFA11:SetHeight(18)
		BGAssistCfmFA11:ClearAllPoints()
		BGAssistCfmFA11:SetPoint("LEFT", BGAssistCfmFA12,"RIGHT",16,0) 
		BGAssistCfmFA11.rankIcon=BGAssistCfmFA11:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA11.rankIcon:SetAllPoints()
		BGAssistCfmFA11.rankIcon:SetTexture(GET_RANK_ICON(11))
		BGAssistCfmFA11.text = BGAssistCfmFA11:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA11.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA11.text:SetTextColor(1, .45, .2)
		BGAssistCfmFA11.text:SetPoint('RIGHT', BGAssistCfmFA11,-16,0)
		BGAssistCfmFA11.text:SetText("0")
		BGAssistCfmFA11:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("11","A")
		 end)
		BGAssistCfmFA11:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA11:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','11'), 'battleground')
		 end)
		--A10
		BGAssistCfmFA10 = CreateFrame("Button","BGACFAlliance10", BGAssistCfmFrame)
		BGAssistCfmFA10:SetWidth(18)
		BGAssistCfmFA10:SetHeight(18)
		BGAssistCfmFA10:ClearAllPoints()
		BGAssistCfmFA10:SetPoint("LEFT", BGAssistCfmFA11,"RIGHT",16,0) 
		BGAssistCfmFA10.rankIcon=BGAssistCfmFA10:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA10.rankIcon:SetAllPoints()
		BGAssistCfmFA10.rankIcon:SetTexture(GET_RANK_ICON(10))
		BGAssistCfmFA10.text = BGAssistCfmFA10:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA10.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA10.text:SetTextColor(1, .45, .3)
		BGAssistCfmFA10.text:SetPoint('RIGHT', BGAssistCfmFA10,-16,0)
		BGAssistCfmFA10.text:SetText("0")
		BGAssistCfmFA10:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("10","A")
		 end)
		BGAssistCfmFA10:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA10:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','10'), 'battleground')
		 end)
		--A9
		BGAssistCfmFA9 = CreateFrame("Button","BGACFAlliance9", BGAssistCfmFrame)
		BGAssistCfmFA9:SetWidth(18)
		BGAssistCfmFA9:SetHeight(18)
		BGAssistCfmFA9:ClearAllPoints()
		BGAssistCfmFA9:SetPoint("LEFT", BGAssistCfmFA10,"RIGHT",16,0) 
		BGAssistCfmFA9.rankIcon=BGAssistCfmFA9:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA9.rankIcon:SetAllPoints()
		BGAssistCfmFA9.rankIcon:SetTexture(GET_RANK_ICON(9))
		BGAssistCfmFA9.text = BGAssistCfmFA9:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA9.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA9.text:SetTextColor(1, .5, .3)
		BGAssistCfmFA9.text:SetPoint('RIGHT', BGAssistCfmFA9,-16,0)
		BGAssistCfmFA9.text:SetText("0")
		BGAssistCfmFA9:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("9","A")
		 end)
		BGAssistCfmFA9:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA9:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','9'), 'battleground')
		 end)
		--A8
		BGAssistCfmFA8 = CreateFrame("Button","BGACFAlliance8", BGAssistCfmFrame)
		BGAssistCfmFA8:SetWidth(18)
		BGAssistCfmFA8:SetHeight(18)
		BGAssistCfmFA8:ClearAllPoints()
		BGAssistCfmFA8:SetPoint("LEFT", BGAssistCfmFA9,"RIGHT",16,0) 
		BGAssistCfmFA8.rankIcon=BGAssistCfmFA8:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA8.rankIcon:SetAllPoints()
		BGAssistCfmFA8.rankIcon:SetTexture(GET_RANK_ICON(8))
		BGAssistCfmFA8.text = BGAssistCfmFA8:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA8.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA8.text:SetTextColor(1, .5, .35)
		BGAssistCfmFA8.text:SetPoint('RIGHT', BGAssistCfmFA8,-16,0)
		BGAssistCfmFA8.text:SetText("0")
		BGAssistCfmFA8:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("8","A")
		 end)
		BGAssistCfmFA8:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA8:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','8'), 'battleground')
		 end)
		--A7
		BGAssistCfmFA7 = CreateFrame("Button","BGACFAlliance7", BGAssistCfmFrame)
		BGAssistCfmFA7:SetWidth(18)
		BGAssistCfmFA7:SetHeight(18)
		BGAssistCfmFA7:ClearAllPoints()
		BGAssistCfmFA7:SetPoint("LEFT", BGAssistCfmFA8,"RIGHT",16,0) 
		BGAssistCfmFA7.rankIcon=BGAssistCfmFA7:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA7.rankIcon:SetAllPoints()
		BGAssistCfmFA7.rankIcon:SetTexture(GET_RANK_ICON(7))
		BGAssistCfmFA7.text = BGAssistCfmFA7:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA7.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA7.text:SetTextColor(1, .5, .4)
		BGAssistCfmFA7.text:SetPoint('RIGHT', BGAssistCfmFA7,-16,0)
		BGAssistCfmFA7.text:SetText("0")
		BGAssistCfmFA7:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("7","A")
		 end)
		BGAssistCfmFA7:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA7:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','7'), 'battleground')
		 end)
		--A6
		BGAssistCfmFA6 = CreateFrame("Button","BGACFAlliance6", BGAssistCfmFrame)
		BGAssistCfmFA6:SetWidth(18)
		BGAssistCfmFA6:SetHeight(18)
		BGAssistCfmFA6:ClearAllPoints()
		BGAssistCfmFA6:SetPoint("LEFT", BGAssistCfmFA7,"RIGHT",16,0) 
		BGAssistCfmFA6.rankIcon=BGAssistCfmFA6:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA6.rankIcon:SetAllPoints()
		BGAssistCfmFA6.rankIcon:SetTexture(GET_RANK_ICON(6))
		BGAssistCfmFA6.text = BGAssistCfmFA6:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA6.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA6.text:SetTextColor(1, .55, .4)
		BGAssistCfmFA6.text:SetPoint('RIGHT', BGAssistCfmFA6,-16,0)
		BGAssistCfmFA6.text:SetText("0")
		BGAssistCfmFA6:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("6","A")
		 end)
		BGAssistCfmFA6:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA6:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','6'), 'battleground')
		 end)
		--A5
		BGAssistCfmFA5 = CreateFrame("Button","BGACFAlliance5", BGAssistCfmFrame)
		BGAssistCfmFA5:SetWidth(18)
		BGAssistCfmFA5:SetHeight(18)
		BGAssistCfmFA5:ClearAllPoints()
		BGAssistCfmFA5:SetPoint("LEFT", BGAssistCfmFA6,"RIGHT",16,0) 
		BGAssistCfmFA5.rankIcon=BGAssistCfmFA5:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA5.rankIcon:SetAllPoints()
		BGAssistCfmFA5.rankIcon:SetTexture(GET_RANK_ICON(5))
		BGAssistCfmFA5.text = BGAssistCfmFA5:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA5.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA5.text:SetTextColor(1, .55, .5)
		BGAssistCfmFA5.text:SetPoint('RIGHT', BGAssistCfmFA5,-16,0)
		BGAssistCfmFA5.text:SetText("0")
		BGAssistCfmFA5:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("5","A")
		 end)
		BGAssistCfmFA5:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA5:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','5'), 'battleground')
		 end)
		--A4
		BGAssistCfmFA4 = CreateFrame("Button","BGACFAlliance4", BGAssistCfmFrame)
		BGAssistCfmFA4:SetWidth(18)
		BGAssistCfmFA4:SetHeight(18)
		BGAssistCfmFA4:ClearAllPoints()
		BGAssistCfmFA4:SetPoint("LEFT", BGAssistCfmFA5,"RIGHT",16,0) 
		BGAssistCfmFA4.rankIcon=BGAssistCfmFA4:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA4.rankIcon:SetAllPoints()
		BGAssistCfmFA4.rankIcon:SetTexture(GET_RANK_ICON(4))
		BGAssistCfmFA4.text = BGAssistCfmFA4:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA4.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA4.text:SetTextColor(1, .6, .5)
		BGAssistCfmFA4.text:SetPoint('RIGHT', BGAssistCfmFA4,-16,0)
		BGAssistCfmFA4.text:SetText("0")
		BGAssistCfmFA4:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("4","A")
		 end)
		BGAssistCfmFA4:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA4:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','4'), 'battleground')
		 end)
		--A3
		BGAssistCfmFA3 = CreateFrame("Button","BGACFAlliance3", BGAssistCfmFrame)
		BGAssistCfmFA3:SetWidth(18)
		BGAssistCfmFA3:SetHeight(18)
		BGAssistCfmFA3:ClearAllPoints()
		BGAssistCfmFA3:SetPoint("LEFT", BGAssistCfmFA4,"RIGHT",16,0) 
		BGAssistCfmFA3.rankIcon=BGAssistCfmFA3:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA3.rankIcon:SetAllPoints()
		BGAssistCfmFA3.rankIcon:SetTexture(GET_RANK_ICON(3))
		BGAssistCfmFA3.text = BGAssistCfmFA3:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA3.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA3.text:SetTextColor(1, 7, .6)
		BGAssistCfmFA3.text:SetPoint('RIGHT', BGAssistCfmFA3,-16,0)
		BGAssistCfmFA3.text:SetText("0")
		BGAssistCfmFA3:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("3","A")
		 end)
		BGAssistCfmFA3:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA3:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','3'), 'battleground')
		 end)
		--A2
		BGAssistCfmFA2 = CreateFrame("Button","BGACFAlliance2", BGAssistCfmFrame)
		BGAssistCfmFA2:SetWidth(18)
		BGAssistCfmFA2:SetHeight(18)
		BGAssistCfmFA2:ClearAllPoints()
		BGAssistCfmFA2:SetPoint("LEFT", BGAssistCfmFA3,"RIGHT",16,0) 
		BGAssistCfmFA2.rankIcon=BGAssistCfmFA2:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA2.rankIcon:SetAllPoints()
		BGAssistCfmFA2.rankIcon:SetTexture(GET_RANK_ICON(2))
		BGAssistCfmFA2.text = BGAssistCfmFA2:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA2.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA2.text:SetTextColor(1, 8, .7)
		BGAssistCfmFA2.text:SetPoint('RIGHT', BGAssistCfmFA2,-16,0)
		BGAssistCfmFA2.text:SetText("0")
		BGAssistCfmFA2:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("2","A")
		 end)
		BGAssistCfmFA2:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA2:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','2'), 'battleground')
		 end)
		--A1
		BGAssistCfmFA1 = CreateFrame("Button","BGACFAlliance1", BGAssistCfmFrame)
		BGAssistCfmFA1:SetWidth(18)
		BGAssistCfmFA1:SetHeight(18)
		BGAssistCfmFA1:ClearAllPoints()
		BGAssistCfmFA1:SetPoint("LEFT", BGAssistCfmFA2,"RIGHT",16,0) 
		BGAssistCfmFA1.rankIcon=BGAssistCfmFA1:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA1.rankIcon:SetAllPoints()
		BGAssistCfmFA1.rankIcon:SetTexture(GET_RANK_ICON(1))
		BGAssistCfmFA1.text = BGAssistCfmFA1:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA1.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA1.text:SetTextColor(1, 1, .8)
		BGAssistCfmFA1.text:SetPoint('RIGHT', BGAssistCfmFA1,-16,0)
		BGAssistCfmFA1.text:SetText("0")
		BGAssistCfmFA1:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("1","A")
		 end)
		BGAssistCfmFA1:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA1:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','1'), 'battleground')
		 end)
	--A0
		BGAssistCfmFA0 = CreateFrame("Button","BGACFAlliance0", BGAssistCfmFrame)
		BGAssistCfmFA0:SetWidth(18)
		BGAssistCfmFA0:SetHeight(18)
		BGAssistCfmFA0:ClearAllPoints()
		BGAssistCfmFA0:SetPoint("LEFT", BGAssistCfmFA1,"RIGHT",16,0) 
		BGAssistCfmFA0.rankIcon=BGAssistCfmFA0:CreateTexture(nil,"OVERLAY")
		BGAssistCfmFA0.rankIcon:SetAllPoints()
		BGAssistCfmFA0.rankIcon:SetTexture("Interface\\Icons\\Ability_Hunter_SniperShot")
		BGAssistCfmFA0.text = BGAssistCfmFA0:CreateFontString(nil, 'OVERLAY')
		BGAssistCfmFA0.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		BGAssistCfmFA0.text:SetTextColor(1, 1, 1)
		BGAssistCfmFA0.text:SetPoint('RIGHT', BGAssistCfmFA0,-16,0)
		BGAssistCfmFA0.text:SetText("0")
		BGAssistCfmFA0:SetScript("OnEnter", function()
			BGAssistCFMTool:SetOwner(this, "ANCHOR_CURSOR" )
			BGAssist_ButtonAutomates("0","A")
		 end)
		BGAssistCfmFA0:SetScript("OnLeave", function(self, button)
			BGAssistCFMTool:Hide()
		end)
		BGAssistCfmFA0:SetScript("OnClick", function()
			SendChatMessage(BGAssist_Count('Alliance','0'), 'battleground')
		 end)
	-- MINIMAP ICON
		BGAminimapButton = CreateFrame("Button", "BGminiMap", Minimap)
		BGAminimapButton:SetFrameStrata('LOW')
		BGAminimapButton:SetWidth(31)
		BGAminimapButton:SetHeight(31)
		BGAminimapButton:ClearAllPoints()
		BGAminimapButton:SetPoint("TOPLEFT", Minimap,"TOPLEFT",BGAssistRU_Config[BGAssist_Player].MinimapPos.x,BGAssistRU_Config[BGAssist_Player].MinimapPos.y) 
		BGAminimapButton:SetHighlightTexture("Interface\\MINIMAP\\UI-Minimap-ZoomButton-Highlight", "ADD")
		BGAminimapButton:RegisterForDrag("RightButton")
		BGAminimapButton.texture = BGAminimapButton:CreateTexture(nil, "BUTTON")
		BGAminimapButton.texture:SetTexture("Interface\\ICONS\\INV_Weapon_ShortBlade_15")
		BGAminimapButton.texture:SetTexCoord(.05, .95, .05, .95)
		BGAminimapButton.texture:SetPoint("CENTER", BGAminimapButton)
		BGAminimapButton.texture:SetWidth(20)
		BGAminimapButton.texture:SetHeight(20)
		
		BGAminimapButton.border = BGAminimapButton:CreateTexture(nil, "OVERLAY")
		BGAminimapButton.border:SetTexture("Interface\\MINIMAP\\MiniMap-TrackingBorder")
		BGAminimapButton.border:SetPoint("TOPLEFT", BGAminimapButton.texture, -6, 5)
		BGAminimapButton.border:SetWidth(53)
		BGAminimapButton.border:SetHeight(53)
		
		BGAminimapButton.notifyText = BGAminimapButton:CreateTexture(nil, "OVERLAY")
		BGAminimapButton.notifyText:SetTexture("Interface\\MINIMAP\\UI-Minimap-ZoomButton-Highlight")
		BGAminimapButton.notifyText:SetBlendMode("ADD")
		BGAminimapButton.notifyText:SetAllPoints()
		BGAminimapButton.notifyText:Hide()
		BGAminimapButton:SetScript("OnMouseDown", function()
			point, relativeTo, relativePoint, xOffset, yOffset = this.texture:GetPoint(1)
			this.texture:SetPoint(point, relativeTo, relativePoint, xOffset + 2, yOffset - 2)
		end);
		BGAminimapButton:SetScript("OnLeave", function(self, button)
			BGMinimapTool:Hide()
			this.notifyText:Hide()
			this.texture:SetPoint("CENTER", BGAminimapButton,0,0)
		end);
		BGAminimapButton:SetScript("OnMouseUp", function()
			if arg1 == "LeftButton"  then
				UIDropDownMenu_Initialize(BGAssist_Timers_Menu, BGAssist_MenuDropDown_Initialize, "MENU")
				ToggleDropDownMenu(1, nil, BGAssist_Timers_Menu, "BGAssist_Timers_Menu", 0, 50)
			end
			this.texture:SetPoint("CENTER", BGAminimapButton)
		end);
		BGAminimapButton:SetScript("OnDragStart", function()
			miniDrag = true
		end)
		BGAminimapButton:SetScript("OnDragStop", function()
			miniDrag = false
		end)
		BGAminimapButton:SetScript("OnUpdate", function()
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
				BGAssistRU_Config[BGAssist_Player].MinimapPos.x = (xdelta-x)/sc-17
				BGAssistRU_Config[BGAssist_Player].MinimapPos.y = (y-ydelta)/sc+17
				this:SetPoint("TOPLEFT", Minimap, "TOPLEFT", BGAssistRU_Config[BGAssist_Player].MinimapPos.x , BGAssistRU_Config[BGAssist_Player].MinimapPos.y);
			end
		end)
		CreateFrame( "GameTooltip", "BGMinimapTool", nil, "GameTooltipTemplate" )
		BGAminimapButton:SetScript("OnEnter", function()
			BGMinimapTool:SetOwner( this, "ANCHOR_CURSOR" );
			BGMinimapTool:SetText("BGAssistRU")
			BGMinimapToolTextLeft1:SetTextColor(1, 1, 1)
			BGMinimapTool:AddLine(DISPLAY_MINIMAPTOOLTIP)
			BGMinimapTool:AddLine(DISPLAY_MINIMAPTOOLTIP2)
			BGMinimapTool:Show()
		 end)
		if BGAssistRU_Config.minimapbutton then
			BGAminimapButton:Show()
		end
		--//BY CFM
	elseif (event == "PLAYER_ENTERING_WORLD") then
		BGAssist_InAFK = nil;
	elseif (event == "CHAT_MSG_SYSTEM") then
		if (string.find(arg1,MATCHING_MARKED_AFK)) then
			BGAssist_InAFK = true;
		elseif (string.find(arg1,MATCHING_CLEARED_AFK)) then
			BGAssist_InAFK = nil;
		end
	elseif (event == "BATTLEFIELDS_SHOW") then
		local mapName = GetBattlefieldInfo();
		if (mapName == WARSONGGULCH or mapName == ARATHIBASIN) then
			BGAssist_PreExistingInstances = {};
			local numBattlefields = GetNumBattlefields();
			local i;
			for i = 1, numBattlefields, 1 do
				BGAssist_PreExistingInstances[GetBattlefieldInstanceInfo(i)] = GetTime();
			end
		end
		if (BGAssistRU_Config.autosignup) then
			if (((GetNumPartyMembers() > 0) or (GetNumRaidMembers() > 0)) and IsPartyLeader()) then
				JoinBattlefield(0,1);
			else
				JoinBattlefield(0);
			end
			HideUIPanel(BattlefieldFrame);
		end
	elseif (event == "UPDATE_BATTLEFIELD_STATUS") then
		local i, status, mapName, instanceID;
		for i = 1, MAX_BATTLEFIELD_QUEUES, 1 do
			local tmpstatus, tmpmapName, tmpinstanceID = GetBattlefieldStatus(i)
			if (tmpstatus == "active" or (tmpstatus == "confirm" and not status)) then
				status = tmpstatus;
				mapName = tmpmapName;
				instanceID = tmpinstanceID;
			end
		end
		if (status=="active") then
			BGAssist_PreExistingInstances = nil;
			if (not BGAssist_InBattleGround) then
				DEFAULT_CHAT_FRAME:AddMessage("BGAssistRU: "..DISPLAY_TEXT_ENTERINGBATTLEGROUNDS..": "..mapName);
				BGAssist_RezSyncTime = nil;
				BGAssist_InBattleGround = mapName;
				BGAssist_BagCheck();
				local idx,event;
				for idx,event in EVENTSINBATTLEGROUND do
					BGAssist:RegisterEvent(event);
				end
				BGAssist_MaintainingGroup = nil;
				if (not BGAssistRU_Config.noautoshow) then
					BGAssist_Timers:Show();
				end
				if (not BGAssistRU_Config.notargetwindow) then
					BGAssist_Targets:Show();
				end
			end
			if (BGAssist_InBattleGround == WARSONGGULCH) then
				BGAssist_FlagLocs = { };
				BGAssist_Flags:Show();
			end
			if (BGAssist_InBattleGround == ALTERACVALLEY or BGAssist_InBattleGround == ARATHIBASIN) then
				BGAssist_CheckMap();
			end
		elseif (BGAssist_InBattleGround) then
			BGAssist_Timers:Hide();
			BGAssist_Flags:Hide();
			BGAssist_Targets:Hide();
			DEFAULT_CHAT_FRAME:AddMessage("BGAssistRU: "..DISPLAY_TEXT_LEFTBATTLEGROUNDS..": "..BGAssist_InBattleGround);
			BGAssist_InBattleGround = nil;
			BGAssist_RezSyncTime = nil;
			if (not BGAssistRU_Config.noautoleavegroup) then 
				LeaveParty();
			end
			local idx, event;
			for idx, event in EVENTSINBATTLEGROUND do
				BGAssist:UnregisterEvent(event);
			end
		end
	elseif event == "RAID_ROSTER_UPDATE" then
		if BGAssist_InBattleGround == ALTERACVALLEY or BGAssist_InBattleGround == ARATHIBASIN or BGAssist_InBattleGround == WARSONGGULCH then
			BGAssist_CountPlayers()
		end
	elseif (event == "CHAT_MSG_MONSTER_YELL" or event == "CHAT_MSG_BG_SYSTEM_NEUTRAL" or event == "CHAT_MSG_BG_SYSTEM_ALLIANCE" or event == "CHAT_MSG_BG_SYSTEM_HORDE") then
		if (BGAssist_InBattleGround == ALTERACVALLEY or BGAssist_InBattleGround == ARATHIBASIN) then
			BGAssist_Scheduled_MapCheck = GetTime()+0.1;
		elseif (BGAssist_InBattleGround == WARSONGGULCH) then
			BGAssist_LocateFlags(arg1);
		end
	elseif (event == "BAG_UPDATE") then
		if (BGAssist_InBattleGround == ALTERACVALLEY) then
			BGAssist_BagCheck();
		end
	elseif (event == "AREA_SPIRIT_HEALER_IN_RANGE") then
			BGAssist_RezSyncTime = GetTime() + GetAreaSpiritHealerTime();
	elseif (event == "QUEST_PROGRESS" or event == "QUEST_COMPLETE" or event == "QUEST_DETAIL") then
		if (not BGAssistRU_Config.noautoquest and BGAssist_InBattleGround == ALTERACVALLEY) then
			BGAssist_Alterac_AutoProcess(event);
		end
	elseif (event == "GOSSIP_SHOW") then
		if (not BGAssist_InBattleGround and BGAssistRU_Config.autosignup) then
			BGAssist_SignUpForBG(GetGossipOptions());
		elseif (not BGAssistRU_Config.noautoquest and BGAssist_InBattleGround == ALTERACVALLEY) then
			BGAssist_Alterac_SelectQuest(GetGossipAvailableQuests());
		end
	elseif (event == "PLAYER_DEAD") then
		if (BGAssistRU_Config.autorelease) then
			StaticPopup_Hide("DEATH");
			RepopMe();
		end
	elseif (event == "UPDATE_BATTLEFIELD_SCORE") then
		if (GetBattlefieldWinner() and not BGAssistRU_Config.noautoleavegroup) then 
			LeaveParty();
		end
		BGAssist_CountPlayers();
	elseif (event == "UPDATE_WORLD_STATES") then
		if (BGAssist_InBattleGround == WARSONGGULCH) then
			BGAssist_WSGFlags_OnShow();
		end
	end
end

function BGAssist_OnUpdate()
	local time = GetTime();
	if (BGAssist_Scheduled_MapCheck and BGAssist_Scheduled_MapCheck <= time) then
		BGAssist_Scheduled_MapCheck = nil;
		BGAssist_CheckMap();
	end
end

function BGAssist_Timers_OnUpdate(elapsed)
	local time = GetTime();
	local starttimer = 1;
	if (BGAssistRU_Config.showgycountdown) then
		local timerobj = _G['BGAssist_Timers1'];
		if (timerobj.name == "Graveyard") then
			if (BGAssist_RezSyncTime) then
				local timeleft = BGAssist_RezSyncTime-GetTime();
				while (timeleft < 0) do
					BGAssist_RezSyncTime = BGAssist_RezSyncTime + 30;
					timeleft = math.floor(BGAssist_RezSyncTime-GetTime());
				end
				timerobj:SetValue(timeleft);
			else
				timerobj:SetValue(30);
			end
			starttimer = 2;
		end
	end

	if (BGAssist_TimersActive) then
		if (BGAssist_TimersActive <= time) then
			BGAssist_UpdateTimers();
		else
			if (BGAssist_LastTimersProc+1 < time) then
				local i;
				for i = starttimer, MAXTIMERS, 1 do
					local timer = _G['BGAssist_Timers'..i];
					if (timer.endtime) then
						local timeleft = timer.endtime - time;
						timer:SetValue(timeleft);
					end
				end
				BGAssist_LastTimersProc = time;
			end
		end
		if (this.updateTooltip) then
			this.updateTooltip = this.updateTooltip - elapsed;
			if (this.updateTooltip < 0) then
				BGAssist_Timer_SetTooltip(this.tooltipUpdate);
			end
		end
	end
end

function BGAssist_DynamicResize()
	local i;
	local maxtimer = 0;
	local maxicon = 0;
	for i = 1, MAXICONS, 1 do
		local icon = getglobal("BGAssist_Timers_Icon"..i);
		if (icon:IsVisible()) then maxicon = i; end
	end
	for i = 1, MAXTIMERS, 1 do
		local timerobj = getglobal("BGAssist_Timers"..i);
		if (timerobj:IsVisible()) then maxtimer = i; end;
	end

	if (BGAssistRU_Config.timerhide) then maxtimer = 0; end
	if (BGAssistRU_Config.itemhide or BGAssist_InBattleGround ~= ALTERACVALLEY) then maxicon = 0; end

	-- Move Icons to under last timer
	if (maxicon and maxicon > 0) then
		BGAssist_Timers_Icon1:ClearAllPoints();
		if (maxtimer == 0) then
			BGAssist_Timers_Icon1:SetPoint("TOPLEFT","BGAssist_Timers","TOPLEFT",6,-8);
		else
			BGAssist_Timers_Icon1:SetPoint("TOPLEFT","BGAssist_Timers"..maxtimer,"BOTTOMLEFT",0,-6);
		end
	end
	local iconwidth = 36;
	local iconheight = 36;
	if (maxicon and maxicon > 3) then
		if (maxicon > 4) then
			iconwidth = 24;
		else
			iconwidth = 30;
		end
		if (maxicon > 5) then
			iconheight = 18;
		end
	end
	for i = 1, MAXICONS, 1 do
		local icon = getglobal("BGAssist_Timers_Icon"..i);
		local texture = getglobal("BGAssist_Timers_Icon"..i.."NormalTexture");
		icon:SetWidth(iconwidth);
		icon:SetHeight(iconheight);
		texture:SetWidth(iconwidth*2);
		texture:SetHeight(iconheight*2);
	end
	local backdropheight = 16; -- Buffer at top and bottom and room for border
	backdropheight = backdropheight + (maxtimer*12);
	if (maxicon > 0 and maxtimer > 0) then backdropheight = backdropheight + 3; end
	if (maxicon > 5) then 
		backdropheight = backdropheight + (iconheight*2) + 3;
	elseif (maxicon > 0) then
		backdropheight = backdropheight + iconheight;
	end
	BGAssist_Timers:SetHeight(backdropheight);
end

function BGAssist_Timers_OnShow()
	UIDropDownMenu_Initialize(BGAssist_Timers_Menu, BGAssist_MenuDropDown_Initialize, "MENU");
	BGAssist_UpdateTimers();
	BGAssist_UpdateItems();
	if (BGAssist_Timers2:IsVisible() or (BGAssist_Timers1:IsVisible() and BGAssistRU_Config.showgycountdown)) then
		BGAssist_Timers_TitleText:SetText(DISPLAY_TITLEDISPLAY_CAPTURE);
	else
		if (BGAssist_Timers_Icon1:IsVisible()) then
			BGAssist_Timers_TitleText:SetText(DISPLAY_TITLEDISPLAY_ITEMS);
		else
			BGAssist_Timers_TitleText:SetText("BGAssist");
		end
	end
	BGAssist_DynamicResize();
end

function BGAssist_UpdateItems()
	local function findicon (item)
		local idx = 1;
		local found = 0;
		while (found == 0 and idx <= MAXICONS) do
			local icon = getglobal("BGAssist_Timers_Icon"..idx);
			if (icon and icon.item and icon.item == item) then
				found = idx;
			end
			idx = idx + 1;
		end
		return found;
	end
	local function fillicon (item, num)
		local icon = getglobal("BGAssist_Timers_Icon"..num);
		if (icon) then
			icon.item = item;
			icon:Show();
			getglobal("BGAssist_Timers_Icon"..num.."Icon"):SetTexture(BGAssist_ItemInfo[item].texture);
		end
	end

	local showitems = {};
	local maxicon = 0;
	if (not BGAssistRU_Config.itemhide and BGAssist_InBattleGround == ALTERACVALLEY and BGAssist_TrackedItems and BGAssist_TrackedItems ~= {}) then
		local item;
		for item in BGAssist_TrackedItems do
			if (BGAssist_TrackedItems[item] > 0) then
				showitems[item] = findicon(item);
			end
		end
		for item in showitems do
			local idx = 1;
			if (showitems[item] == 0) then
				while (showitems[item] == 0 and idx <= MAXICONS) do
					local icon = getglobal("BGAssist_Timers_Icon"..idx);
					if (icon and not icon.item) then
						showitems[item] = idx;
					end
					idx = idx + 1;
				end
			end
			if (showitems[item] > maxicon) then maxicon = showitems[item]; end
			fillicon (item, showitems[item])
		end
		local i;
		for i = 1, MAXICONS, 1 do
			local icon = getglobal("BGAssist_Timers_Icon"..i);
			if (not icon.item or not BGAssist_TrackedItems[icon.item] or BGAssist_TrackedItems[icon.item] < 1) then
				if (i < maxicon) then
					local j = i+1;
					local jicon = getglobal("BGAssist_Timers_Icon"..j);
					while (j <= MAXICONS and not jicon.item) do
						jicon = getglobal("BGAssist_Timers_Icon"..j);
						j = j + 1;
					end
					if (jicon.item) then
						fillicon (jicon.item, j-1);
						jicon.item = nil;
					end
				else
					icon.item = nil;
					icon:Hide();
				end
			end
		end
	else
		local i;
		for i = 1, MAXICONS, 1 do
			local icon = getglobal("BGAssist_Timers_Icon"..i);
			icon:Hide();
			icon.item = nil;
		end
	end
end

function BGAssist_UpdateTimers()

	local function sort_function (a, b) 
		local endtime= BGAssist_MapItems[a].conflictstart + BGAssist_MapItems[a].conflictduration;
		local atime = endtime - GetTime();
		endtime= BGAssist_MapItems[b].conflictstart + BGAssist_MapItems[b].conflictduration;
		local btime = endtime - GetTime();
		if (atime < btime) then return true; else return false; end
	end

	local starttimer = 1;
	local i, status, mapName, instanceID;
	for i = 1, MAX_BATTLEFIELD_QUEUES, 1 do
		local tmpstatus, tmpmapName, tmpinstanceID = GetBattlefieldStatus(i);
		if (tmpstatus == "active") then
			status = tmpstatus;
			mapName = tmpmapName;
			instanceID = tmpinstanceID;
		end
	end
	if (BGAssistRU_Config.showgycountdown) then
		local timerobj = getglobal("BGAssist_Timers1");
		local text = getglobal("BGAssist_Timers1Text");
		timerobj.name = "Graveyard";
		timerobj:Show();
		timerobj:SetStatusBarColor (0, 1, 0);
		timerobj:SetMinMaxValues(0,30);
		if (BGAssist_RezSyncTime) then
			local timeleft = math.floor(BGAssist_RezSyncTime-GetTime());
			while (timeleft < 0) do
				BGAssist_RezSyncTime = BGAssist_RezSyncTime + 30;
				timeleft = math.floor(BGAssist_RezSyncTime-GetTime());
			end
			timerobj:SetValue(timeleft);
		else
			timerobj:SetValue(30);
		end
		text:Show();
		text:SetText(DISPLAY_TEXT_GRAVEYARD);
		starttimer = 2;
	end
	if (not BGAssistRU_Config.timerhide and status == "active") then
		if (BGAssist_MapItems == nil or BGAssist_MapItems == {}) then
			BGAssist_CheckMap();
			if (BGAssist_MapItems == nil or BGAssist_MapItems == {}) then
				return;
			end
		end
		local conflicts = {};
		local conflictcount = 0;
		local red, green, blue;
		local name;
		for name in BGAssist_MapItems do
			if (BGAssist_MapItems[name].conflictstart and (BGAssistRU_Config.showcapturedflags and BGAssist_InBattleGround == ARATHIBASIN)) then
				local endtime = BGAssist_MapItems[name].conflictstart + BGAssist_MapItems[name].conflictduration;
				local timeleft = endtime - GetTime();
				if (timeleft > 0 and (BGAssistRU_Config.showcapturedflags and BGAssist_InBattleGround == ARATHIBASIN)) then
					conflictcount = conflictcount + 1;
					conflicts[conflictcount] = name;
				end
			end
		end
		table.sort(conflicts, sort_function);
		local timer = starttimer;
		local idx = 1;
		while (timer <= MAXTIMERS and conflicts[idx]) do
			local timerobj = getglobal("BGAssist_Timers"..timer);
			local text = getglobal("BGAssist_Timers"..timer.."Text");
			red = 0; green = 0; blue = 0;
			if (BGAssist_MapItems[conflicts[idx]].owner == "HORDE") then
				red = 1;
			elseif (BGAssist_MapItems[conflicts[idx]].owner == "ALLIANCE") then
				green = 1; blue = 1;
			elseif (not BGAssist_MapItems[conflicts[idx]].owner) then
				-- Should only be when capturing neutral in AB at start
				red = 0.862; green = 0.862; blue = 0.862;
			end
			local endtime= BGAssist_MapItems[conflicts[idx]].conflictstart + 
				BGAssist_MapItems[conflicts[idx]].conflictduration;
			local timeleft = endtime - GetTime();
			if (timeleft < 1) then
				BGAssist_Scheduled_MapCheck = GetTime()+1; 
				BGAssist_MapItems[conflicts[idx]].conflictstart = nil;
			end
			if (not BGAssist_TimersActive or endtime < BGAssist_TimersActive) then
				BGAssist_TimersActive = endtime;
			end
			timerobj.name = conflicts[idx];
			timerobj.endtime = endtime;
			timerobj:Show();
			timerobj:SetStatusBarColor (red, green, blue);
			if (BGAssist_InBattleGround == ALTERACVALLEY) then
				timerobj:SetMinMaxValues(0,300);
			elseif (BGAssist_InBattleGround == ARATHIBASIN) then
				timerobj:SetMinMaxValues(0,60);
			elseif (Debug) then
				Debug ("INVALID ZONE: ",BGAssist_InBattleGround);
			end
			timerobj:SetValue(timeleft);
			text:Show();
			text:SetText(conflicts[idx]);
			idx = idx + 1;
			timer = timer + 1;
		end
		while (timer <= MAXTIMERS) do
			local timerobj = getglobal("BGAssist_Timers"..timer);
			local text = getglobal("BGAssist_Timers"..timer.."Text");
			timerobj.name = nil;
			timerobj.endtime = nil;
			timerobj:Hide();
			text:SetText("");
			text:Hide();
			timer = timer + 1;
		end
	else
		for timer = starttimer, MAXTIMERS, 1 do
			local timerobj = getglobal("BGAssist_Timers"..timer);
			local text = getglobal("BGAssist_Timers"..timer.."Text");
			timerobj:Hide();
			text:Hide();
		end
	end
end

function BGAssist_TimersTitle_OnClick(button)
	if (arg1 == "RightButton") then
		ToggleDropDownMenu(1, nil, BGAssist_Timers_Menu, "BGAssist_Timers_Menu", 0, 50);
	else
		if (this:GetButtonState() == "PUSHED") then
			this:GetParent():StopMovingOrSizing();
		elseif (not BGAssistRU_Config.windowlocked) then
			this:GetParent():StartMoving();
		end
	end
end

function BGAssist_Timer_SetTooltip(override)
	if (not override) then
		override = this;
	end
	local txt;
	local timeleft;
	if (override.name == "Graveyard") then
		txt = DISPLAY_TEXT_TIMEUNTILREZ;
		if (BGAssist_RezSyncTime) then
			timeleft = math.floor(BGAssist_RezSyncTime-GetTime());
		else
			timeleft = 30;
		end
	elseif (override.name and override.endtime) then
		
		txt = override.name;
		timeleft = math.floor(override.endtime - GetTime());
	end
	if (txt and timeleft) then
		txt = txt.."\n"..DISPLAY_TEXT_TIMELEFT..": "..timeleft.." "..DISPLAY_TEXT_SECONDS..".";
		if (timeleft > 60) then
			txt = txt.."\n("..(math.floor(timeleft/6)/10).." "..DISPLAY_TEXT_MINUTES..")";
		end
		BGAssist_Timers.updateTooltip = TOOLTIP_UPDATE_TIME;
		BGAssist_Timers.tooltipUpdate = override;
		local left = override:GetLeft();
		if (left > 800) then
			GameTooltip:SetOwner(override, "ANCHOR_LEFT");
		else
			GameTooltip:SetOwner(override, "ANCHOR_RIGHT");
		end
		GameTooltip:SetText(txt);
	end
end

function BGAssist_Timer_Click()
	--ace:print('1')
	-- local txt,timeleft
	-- if (this.name == "Graveyard") then
		-- ace:print('1')
		-- txt = DISPLAY_TEXT_TIMEUNTILREZ;
		-- if (BGAssist_RezSyncTime) then
			-- timeleft = math.floor(BGAssist_RezSyncTime-time);
		-- else
			-- timeleft = 30;
		-- end
		-- ace:print(txt)
		-- ace:print(timeleft)
	-- elseif (this.name and this.endtime) then
		-- ace:print('2')
		-- txt = this.name;
		-- timeleft = math.floor(this.endtime - time)
		-- ace:print(txt)
		-- ace:print(timeleft)
	-- end
end

function BGAssist_Item_SetTooltip()
	if (this.item and BGAssist_ItemInfo[this.item] and BGAssist_ItemInfo[this.item].name) then
		local txt = BGAssist_ItemInfo[this.item].name..DISPLAY_CURRENTCOUNT..BGAssist_TrackedItems[this.item];
		local left = this:GetLeft();
		if (left > 800) then
			GameTooltip:SetOwner(this, "ANCHOR_LEFT");
		else
			GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
		end
		GameTooltip:SetText(txt);
	end
end

function BGAssist_MenuDropDown_CheckedToggle()
	local mapping = {
		[DISPLAY_MENU_LOCKWINDOW] = "windowlocked",
		[DISPLAY_MENU_MINIMAPBUTTON] = "minimapbutton",
		[DISPLAY_MENU_RANKWINDOW] = "rankwindow",
		[DISPLAY_MENU_CLASSWINDOWS] = "classwindows",
		[DISPLAY_MENU_AUTOSHOW] = "noautoshow",
		[DISPLAY_MENU_AUTORELEASE] = "autorelease",
		[DISPLAY_MENU_AUTOQUEST] = "noautoquest",
		[DISPLAY_MENU_AUTOENTER] = "noautoenter",
		[DISPLAY_MENU_TIMERSHOW] = "timerhide",
		[DISPLAY_MENU_ITEMSHOW] = "itemhide",
		[DISPLAY_MENU_GYCOUNTDOWN] = "showgycountdown",
		[DISPLAY_MENU_FLAGTRACKING] = "noflags",
		[DISPLAY_MENU_TARGETTINGASSISTANCE] = "notargetwindow",
		[DISPLAY_MENU_AUTOACCEPTGROUP] = "noacceptgroups",
		[DISPLAY_MENU_AUTOLEAVEGROUP] = "noautoleavegroup",
		[DISPLAY_MENU_NOPREEXISTING] = "avoidpreexistingwarsong";
		[DISPLAY_MENU_SHOWCAPTUREDFLAGS] = "showcapturedflags";
		[DISPLAY_MENU_AUTOSIGNUP] = "autosignup";
	}
	if (UIDROPDOWNMENU_MENU_VALUE == ALTERACVALLEY) then
	elseif (UIDROPDOWNMENU_MENU_VALUE == ARATHIBASIN) then
		mapping[DISPLAY_MENU_NOPREEXISTING] = "avoidpreexistingarathi";
	end
	local confoption = mapping[this.value];
	if (confoption) then
		if (BGAssistRU_Config[confoption]) then
			BGAssistRU_Config[confoption] = nil;
		else
			BGAssistRU_Config[confoption] = true;
		end
		if (BGAssistRU_Config.notargetwindow) then
			BGAssist_Targets:Hide();
		elseif (BGAssist_InBattleGround) then
			BGAssist_Targets:Show();
		end
		if not BGAssistRU_Config.rankwindow then
			BGAssistCfmFrame:Hide()
			BGAssistCfmFrame:SetParent(nil)
		else
			BGAssistCfmFrame:Show()
			BGAssistCfmFrame:SetFrameStrata("LOW")
			BGAssistCfmFrame:SetParent(WorldStateScoreFrame)
		end
		if not BGAssistRU_Config.classwindows then
			WorldStateScoreFrame_Horde:Hide()
			WorldStateScoreFrame_Alliance:Hide()
			WorldStateScoreFrame_Horde:SetParent(nil)
			WorldStateScoreFrame_Alliance:SetParent(nil)
		else
			WorldStateScoreFrame_Horde:Show()
			WorldStateScoreFrame_Alliance:Show()
			WorldStateScoreFrame_Horde:SetFrameStrata("LOW")
			WorldStateScoreFrame_Alliance:SetFrameStrata("LOW")
			WorldStateScoreFrame_Horde:SetParent(WorldStateScoreFrame)
			WorldStateScoreFrame_Alliance:SetParent(WorldStateScoreFrame)
		end
		if BGAssistRU_Config.minimapbutton then
			BGAminimapButton:Show()
		else
			BGAminimapButton:Hide()
		end
		BGAssist_Timers_OnShow();
	end
end

function BGAssist_MenuDropDown_Initialize()
	local info = {};

	if (UIDROPDOWNMENU_MENU_LEVEL == 2) then
		info.func = BGAssist_MenuDropDown_CheckedToggle;

		if (UIDROPDOWNMENU_MENU_VALUE == ALTERACVALLEY) then
			info.text = DISPLAY_MENU_TIMERSHOW;
			info.checked = nil;
			if (not BGAssistRU_Config.timerhide) then info.checked = 1; end
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL);

			info.text = DISPLAY_MENU_AUTOQUEST;
			info.checked = nil;
			if (not BGAssistRU_Config.noautoquest) then info.checked = 1; end
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL);

			info.text = DISPLAY_MENU_ITEMSHOW;
			info.checked = nil;
			if (not BGAssistRU_Config.itemhide) then info.checked = 1; end
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL);
		elseif (UIDROPDOWNMENU_MENU_VALUE == WARSONGGULCH) then
			info.text = DISPLAY_MENU_FLAGTRACKING;
			info.checked = nil;
			if (not BGAssistRU_Config.noflags) then info.checked = 1; end
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL);

			info.text = DISPLAY_MENU_NOPREEXISTING;
			info.checked = nil;
			if (BGAssistRU_Config.avoidpreexistingwarsong) then info.checked = 1; end
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL);
		elseif (UIDROPDOWNMENU_MENU_VALUE == ARATHIBASIN) then
			info.text = DISPLAY_MENU_NOPREEXISTING;
			info.checked = nil;
			if (BGAssistRU_Config.avoidpreexistingarathi) then info.checked = 1; end
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL);

			info.text = DISPLAY_MENU_SHOWCAPTUREDFLAGS;
			info.checked = nil;
			if (BGAssistRU_Config.showcapturedflags) then info.checked = 1; end
			UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL);
		end
	else
		info.isTitle = true;
		info.text = "BGAssistRU "..BGASSIST_VERSION;
		UIDropDownMenu_AddButton(info);

		info = {};
		info.hasArrow = 1;
		info.notCheckable = 1;

		info.text = ALTERACVALLEY;
		UIDropDownMenu_AddButton(info);

		info.text = WARSONGGULCH;
		UIDropDownMenu_AddButton(info);

		info.text = ARATHIBASIN;
		UIDropDownMenu_AddButton(info);

		info = {};
		info.func = BGAssist_MenuDropDown_CheckedToggle;

		info.text = DISPLAY_MENU_LOCKWINDOW;
		info.checked = nil;
		if (BGAssistRU_Config.windowlocked) then info.checked = 1; end
		UIDropDownMenu_AddButton(info);

		info.text = DISPLAY_MENU_MINIMAPBUTTON
		info.checked = nil
		if (BGAssistRU_Config.minimapbutton) then info.checked = 1 end
		UIDropDownMenu_AddButton(info)
		
		info.text = DISPLAY_MENU_RANKWINDOW
		info.checked = nil
		if (BGAssistRU_Config.rankwindow) then info.checked = 1 end
		UIDropDownMenu_AddButton(info)
		
		info.text = DISPLAY_MENU_CLASSWINDOWS
		info.checked = nil
		if (BGAssistRU_Config.classwindows) then info.checked = 1 end
		UIDropDownMenu_AddButton(info)
		
		info.text = DISPLAY_MENU_AUTOSHOW;
		info.checked = nil;
		if (not BGAssistRU_Config.noautoshow) then info.checked = 1; end
		UIDropDownMenu_AddButton(info);

		info.text = DISPLAY_MENU_AUTORELEASE;
		info.checked = nil;
		if (BGAssistRU_Config.autorelease) then info.checked = 1; end
		UIDropDownMenu_AddButton(info);

		info.text = DISPLAY_MENU_AUTOENTER;
		info.checked = nil;
		if (not BGAssistRU_Config.noautoenter) then info.checked = 1; end
		UIDropDownMenu_AddButton(info);
		
		info.text = DISPLAY_MENU_AUTOSIGNUP;
		info.checked = nil;
		if (BGAssistRU_Config.autosignup) then info.checked = 1; end
		UIDropDownMenu_AddButton(info);
		
		info.text = DISPLAY_MENU_GYCOUNTDOWN;
		info.checked = nil;
		if (BGAssistRU_Config.showgycountdown) then info.checked = 1; end
		UIDropDownMenu_AddButton(info);

		info.text = DISPLAY_MENU_TARGETTINGASSISTANCE;
		info.checked = nil;
		if (not BGAssistRU_Config.notargetwindow) then info.checked = 1; end
		UIDropDownMenu_AddButton(info);

		info.text = DISPLAY_MENU_AUTOACCEPTGROUP;
		info.checked = nil;
		if (not BGAssistRU_Config.noacceptgroups) then info.checked = 1; end
		UIDropDownMenu_AddButton(info);

		info.text = DISPLAY_MENU_AUTOLEAVEGROUP;
		info.checked = nil;
		if (not BGAssistRU_Config.noautoleavegroup) then info.checked = 1; end
		UIDropDownMenu_AddButton(info);
	end
end

function BGAssist_LocateFlags(chatmsg)
	local idx, event, faction, player;
	for idx in BGAssist_FlagRegexp do
		local start, _, one, two = string.find (chatmsg,BGAssist_FlagRegexp[idx].regexp);
		if (start) then
			event = idx;
			player = nil;
			faction = nil;
			if (BGAssist_FlagRegexp[event].one == "PLAYER") then player = one; end
			if (BGAssist_FlagRegexp[event].one == "FACTION") then faction = one; end
			if (BGAssist_FlagRegexp[event].two == "PLAYER") then player = two; end
			if (BGAssist_FlagRegexp[event].two == "FACTION") then faction = two; end
		end
	end
	-- The text is reversed
	if (faction == FACTION_HORDE) then 
		faction = "Alliance"; 
	elseif (faction == FACTION_ALLIANCE) then 
		faction = "Horde"; 
	end
	if (event == "RESET") then 
		BGAssist_FlagLocs = { }; 
	elseif (event == "PICKED") then 
		BGAssist_FlagLocs[faction] = player;
	elseif (event == "DROPPED" or event == "RETURNED" or event == "CAPTURED") then 
		BGAssist_FlagLocs[faction] = nil;
	end

	BGAssist_WSGFlags_OnShow();
end

function BGAssist_ToggleWindow()
	if (BGAssist_Timers:IsVisible()) then
		BGAssist_Timers:Hide();
	else
		BGAssist_Timers:Show();
	end
end

function BGAssist_WSGFlags_OnShow()
	local stateidx = { "Alliance", "Horde" };
	local i;
	if (not BGAssistRU_Config.noflags) then
		for i = 1, 2, 1 do
			local text, icon, isFlashing = GetWorldStateUIInfo(i);
			local displayobj = getglobal ("BGAssist_Flags_"..stateidx[i].."_Text");
			if (not isFlashing) then 
				displayobj:SetText("");
			elseif (BGAssist_FlagLocs[stateidx[i]]) then
				displayobj:SetText(BGAssist_FlagLocs[stateidx[i]]);
			else
				displayobj:SetText(DISPLAY_UNKNOWN)
			end
		end
	else
		for i = 1, 2, 1 do
			local displayobj = getglobal ("BGAssist_Flags_"..stateidx[i].."_Text");
			displayobj:SetText("");
		end
	end
end

function BGAssist_Flags_OnClick(override)
	if (not override) then override = this; end
	local stateidx = { ["Alliance"] = 1, ["Horde"] = 2 };
	local _, _, isFlashing = GetWorldStateUIInfo(stateidx[override.faction]);
	if (isFlashing and BGAssist_FlagLocs[override.faction]) then
		TargetByName(BGAssist_FlagLocs[override.faction]);
		if (UnitName("target") ~= BGAssist_FlagLocs[override.faction]) then
			ClearTarget();
			DEFAULT_CHAT_FRAME:AddMessage("BGAssistRU: "..DISPLAY_TEXT_FLAGHOLDERNOTCLOSEENOUGH);
		end
	end
end

local function BGAssist_UpdateTargets()
	local idx;
	local unit;
	local targets = {};
	local targetcounts = {};
	local targetidx = 0;

	local function sort_function (a,b)
		if (targetcounts[a.name] > targetcounts[b.name]) then 
			return true;
		elseif (targetcounts[a.name] < targetcounts[b.name]) then 
			return false;
		elseif (a.name < b.name) then 
			return true; 
		else 
			return false; 
		end
	end

	local max = 40;
	if (BGAssist_InBattleGround == WARSONGGULCH) then max = 10; end

	for idx = 1, max, 1 do
		unit = "raid"..idx.."target";
		if (UnitName(unit) and UnitCanAttack("player",unit)) then
			targetidx = targetidx + 1;
			local px,py = GetPlayerMapPosition("player");
			local tx,ty = GetPlayerMapPosition("raid"..idx);
			local xdist = tx-px;
			local ydist = ty-py;
			local dist = sqrt(math.pow(xdist,2)+math.pow(ydist,2));
			targets[targetidx] = { 
				["name"] = UnitName(unit);
				["class"] = UnitClass(unit);
				["unit"] = unit;
				["distance"] = dist;
			};
			if (not targetcounts[UnitName(unit)]) then
				targetcounts[UnitName(unit)] = 0;
			end
			targetcounts[UnitName(unit)] = targetcounts[UnitName(unit)] + 1;
		end
	end
	if (UnitName("target") and UnitCanAttack("player","target")) then
		targetidx = targetidx + 1;
		targets[targetidx] = { 
			["name"] = UnitName("target");
			["class"] = UnitClass(unit);
			["unit"] = "target";
			["distance"] = 0;
		};
		if (not targetcounts[UnitName("target")]) then
			targetcounts[UnitName("target")] = 0;
		end
		targetcounts[UnitName("target")] = targetcounts[UnitName("target")] + 1;
	end
	table.sort (targets, sort_function);

	local lasttarget = nil;
	local targetidx = 1;
	for idx = 1, table.getn(targets), 1 do
		if (targetidx < 10 and not UnitIsDead(targets[idx].unit) and targets[idx].name ~= lasttarget) then
			local targetobj = getglobal("BGAssist_Targets"..targetidx);
			local targettxt = getglobal("BGAssist_Targets"..targetidx.."_Text");
			local targethealth = getglobal("BGAssist_Targets"..targetidx.."_Bar_Health");
			local iconobj = getglobal("BGAssist_Targets"..targetidx.."_Class");

			lasttarget = targets[idx].name;
			targetobj.name = targets[idx].name;
			targetobj.unit = targets[idx].unit;
			if (targets[idx].class) then
				targetobj.class = string.upper(targets[idx].class);
				local coords = CLASS_ICON_TCOORDS[targetobj.class];
				iconobj:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
				iconobj:Show();
			else
				targetobj.class = nil;
				iconobj:Hide();
			end
			-- targettxt:SetText(targetcounts[targets[idx].name].." ("..targets[idx].distance..") = "..targets[idx].name);
			targettxt:SetText(targets[idx].name);
			local health = UnitHealth(targets[idx].unit);
			local maxhealth = UnitHealthMax(targets[idx].unit);
			if (maxhealth ~= 100) then
				health = math.floor(health/maxhealth*100);
			end
			targethealth:SetValue(health);
			targetobj:Show();
			targetidx = targetidx + 1;
		end
	end
	for idx = targetidx, 10, 1 do
		local targetobj = getglobal("BGAssist_Targets"..idx);
		targetobj:Hide();
		targetobj.name = nil;
		targetobj.unit = nil;
		targetobj.class = nil;
	end
end

function BGAssist_Targets_OnUpdate(elapsed)
	BGAssist_LastUpdate = BGAssist_LastUpdate+elapsed;
	if (BGAssist_LastUpdate > 0.1) then
		BGAssist_LastUpdate = 0;
		BGAssist_UpdateTargets();
	end
end

function BGAssist_TargetMenuDropDown_Initialize()
	local info = {};

	if (UIDROPDOWNMENU_MENU_LEVEL == 2) then
	else
		info.isTitle = true;
		info.text = "BGAssistRU "..BGASSIST_VERSION;
		UIDropDownMenu_AddButton(info);

		info = {};
		info.func = BGAssist_MenuDropDown_CheckedToggle;

		info.text = DISPLAY_MENU_LOCKWINDOW;
		info.checked = nil;
		if (BGAssistRU_Config.windowlocked) then info.checked = 1; end
		UIDropDownMenu_AddButton(info);
	end
end

function BGAssist_Targets_OnShow()
	UIDropDownMenu_Initialize(BGAssist_Targets_Menu, BGAssist_TargetMenuDropDown_Initialize, "MENU");
	getglobal(this:GetName().."_TitleText"):SetText(DISPLAY_TITLEDISPLAY_TARGETS);
	BGAssist_UpdateTargets();
end

function BGAssist_TargetsTitle_OnClick()
	if (arg1 == "RightButton") then
		ToggleDropDownMenu(1, nil, BGAssist_Targets_Menu, "BGAssist_Targets_Menu", 0, 50);
	else
		if (this:GetButtonState() == "PUSHED") then
			this:GetParent():StopMovingOrSizing();
		elseif (not BGAssistRU_Config.windowlocked) then
			this:GetParent():StartMoving();
		end
	end
end

function BGAssist_Target_OnClick()
	local unit = this:GetParent().unit;
	local name = this:GetParent().name;
	if (unit and name and UnitName(unit) == name) then
		if (SpellIsTargeting()) then
			SpellTargetUnit(unit);
		else
			TargetUnit(unit);
		end
	elseif (name) then
		TargetByName(name)
	end
end

function BGAssist_ClassBreakdown_OnLoad()
	WorldStateScoreFrame_Alliance1:ClearAllPoints();
	WorldStateScoreFrame_Alliance1:SetPoint("TOPRIGHT","WorldStateScoreFrame_Alliance","TOPRIGHT",-4,-4);
	WorldStateScoreFrame_Alliance8:SetTexCoord(0,0.25,0.5,0.75);

	local i;
	for i = 1, 8, 1 do
		getglobal("WorldStateScoreFrame_Alliance"..i.."Text"):ClearAllPoints();
		getglobal("WorldStateScoreFrame_Alliance"..i.."Text"):SetPoint("RIGHT","WorldStateScoreFrame_Alliance"..i,"LEFT",0,0);
	end
end

function BGAssist_AutomaticBGEntry(data)
	local i;
	local inbg = nil;
	for i = 1, MAX_BATTLEFIELD_QUEUES, 1 do
		local tmpstatus, tmpmapName, tmpinstanceID = GetBattlefieldStatus(i)
		if (tmpstatus == "active") then
			data = nil;
			inbg = true;
		elseif (not inbg and tmpstatus == "confirm") then
			data = i;
		end
	end
	if (not inbg and data) then
		local status, mapName, instanceID = GetBattlefieldStatus(data)
		local goodtoenter = data;
		if (((BGAssistRU_Config.avoidpreexistingwarsong and 
			mapName == WARSONGGULCH) or
			(BGAssistRU_Config.avoidpreexistingarathi and 
			mapName == ARATHIBASIN )) and
			BGAssist_PreExistingInstances and 
			BGAssist_PreExistingInstances[instanceID]) then
			local timediff = GetTime() - BGAssist_PreExistingInstances[instanceID];
			if (timediff < 300) then 
				goodtoenter = false;
				DEFAULT_CHAT_FRAME:AddMessage("BGAssistRU: "..DISPLAY_TEXT_PREEXISTING);
			end
		end
		if (data and goodtoenter and not BGAssistRU_Config.noautoenter) then
			if (BGAssist_InAFK) then
				DEFAULT_CHAT_FRAME:AddMessage("BGAssistRU: "..DISPLAY_TEXT_NOTENTERINGAFK);
			elseif (not (UnitIsDead("player") or UnitIsGhost("player"))) then
				StaticPopup_Hide("CONFIRM_BATTLEFIELD_ENTRY");
				AcceptBattlefieldPort(data, 1);
			end
		end
	end
end

function BGAssist_ToggleAutoEntry(force)
	local current;
	if (StaticPopupDialogs["CONFIRM_BATTLEFIELD_ENTRY"].OnShow) then
		current = true;
	end
	if (force == "ON" or (not current and force ~= "OFF")) then
		StaticPopupDialogs["CONFIRM_BATTLEFIELD_ENTRY"].OnShow = function(data)
			BGAssist_AutomaticBGEntry(data);
		end
	elseif (force == "OFF" or (current and force ~= "ON")) then
		StaticPopupDialogs["CONFIRM_BATTLEFIELD_ENTRY"].OnShow = nil;
	end
end

SLASH_BGASSISTRU1 = '/BGA'
SLASH_BGASSISTRU2 = '/BGAssist'
SlashCmdList["BGASSISTRU"] = function(msg)
	if BGAminimapButton:IsShown() then
		BGAminimapButton:Hide()
		BGAssistRU_Config.minimapbutton=nil
	else
		BGAminimapButton:Show()
		BGAssistRU_Config.minimapbutton=1
	end
end
DEFAULT_CHAT_FRAME:AddMessage("BGAssistRU - /bga, /bgassist")