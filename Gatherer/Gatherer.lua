-- Gatherer
-- Written by Chandora

GATHERER_VERSION="1.0.0";

--
-- Look, seriously a full half of this code is from MapNotes.
-- The only reason I pinched it and put it in here is I couldn't
-- work out how to extend MapNotes to do what I wanted it to do
-- without actually editing the MapNotes files.
--
-- Full credit to the MapNotes guys
--

-- Global variables
GATHERNOTE_UPDATE_INTERVAL = 0.25;
GATHERNOTE_CHECK_INTERVAL = 5.0;
GATHERER_MAXNUMNOTES = 25;
GATHERER_LOADED = false;
GATHERER_CLOSESTCHECK=0.4;
Gatherer_RecordFlag=0;
Gatherer_currentNode="";
Gatherer_currentAction="";

GatherMap_InCity = false;
Gatherer_LoadCount = 0;
Gatherer_MapOpen = false;
Gatherer_UpdateWorldMap = -1;

Gatherer_InWorld = false;
GatherItems = { };
GatherSkills = { };
GatherZoneData = { }; -- Dict[ZoneName, Tuple[Continent, Zone]]
GatherMainMapItem = { };
-- UI variables
Gatherer_WorldMapDetailFrameWidth = 0;
Gatherer_WorldMapDetailFrameHeight = 0;
Gatherer_WorldMapPlayerFrameLevel = 0;

Gather_Player = UnitName("player");

StaticPopupDialogs["GATHERER_VERSION_DIALOG"] = {
	text = TEXT(GATHERER_VERSION_WARNING),
	button1 = TEXT(OKAY),
	showAlert = 1,
	timeout = 0,
};

--- ************************************************************************
-- Utilities

function Gatherer_Round(x)
	if( x - math.floor(x) > 0.5) then
		x = x + 0.5;
	end
	return math.floor(x);
end

function Gatherer_GetMenuName(inputName)
	local name, info;
	if (inputName) then
		local firstLetter = string.sub(inputName, 1, 2);
		local carReplace = {["\195\160"] = "a", ["\195\161"] = "a", ["\195\162"] = "a", ["\195\163"] = "a", ["\195\164"] = "a",
						["\195\168"] = "e", ["\195\169"] = "e", ["\195\170"] = "e", ["\195\171"] = "e",
						["\195\180"] = "i", ["\195\173"] = "i", ["\195\174"] = "i", ["\195\175"] = "i",
						["\195\179"] = "o", ["\195\180"] = "o", ["\195\181"] = "o", ["\195\182"] = "o",
						["\195\185"] = "u", ["\195\186"] = "u", ["\195\187"] = "u", ["\195\188"] = "u"}
		local found;
		for code, repl in carReplace do
			firstLetter, found = string.gsub(firstLetter, code, repl);
			if (found > 0) then
				break;
			end
		end
		if (found > 0) then
			name = string.upper(firstLetter)..(string.sub(inputName, 3) or "");
		else
			if (GetLocale()=="ruRU") then
				name = inputName;
			else
				name = string.upper(string.sub(inputName, 1, 1))..(string.sub(inputName, 2) or "");
			end
		end

		local iconName, _ = Gatherer_GetDB_IconByGatherName(inputName);
		iconName = iconName or inputName;
		for _, rareMatch in Gather_RareMatch do
			if (iconName == rareMatch) then
				name = name.." ["..TYPE_RARE.."]";
				break;
			end
		end
		if (Gather_SkillLevel[iconName]) then
			name = name.." ["..Gather_SkillLevel[iconName].."]";
		end
	end
	return name, info;
end

-- *************************************************************************
-- Init and command line handler

function Gatherer_OnLoad()
	this:RegisterEvent("WORLD_MAP_UPDATE");
	this:RegisterEvent("CLOSE_WORLD_MAP"); -- never triggered apparently
	this:RegisterEvent("LEARNED_SPELL_IN_TAB"); -- follow current skills
	this:RegisterEvent("SPELLS_CHANGED"); -- follow current skills
	this:RegisterEvent("SKILL_LINES_CHANGED"); -- follow current skills
	this:RegisterEvent("SPELLCAST_START");
	this:RegisterEvent("SPELLCAST_STOP");
	this:RegisterEvent("SPELLCAST_FAILED");
	this:RegisterEvent("CHAT_MSG_ADDON");

	-- Events for off world non processing
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("PLAYER_LEAVING_WORLD");

	-- Addon Loaded and player login/logout events
	this:RegisterEvent("ADDON_LOADED");
	this:RegisterEvent("PLAYER_LOGIN");
	this:RegisterEvent("PLAYER_LOGOUT");

	Gatherer_LoadZoneData();

	SLASH_GATHER1 = "/gather";
	SLASH_GATHER2 = "/gatherer";
	SlashCmdList["GATHER"] = function(msg)
		Gatherer_Command(msg);
	end
end

function Gatherer_Command(command)
	local SETTINGS = Gatherer_Settings;
	local i,j, cmd, param = string.find(command, "^([^ ]+) (.+)$");
	if (not cmd) then cmd = command; end
	if (not cmd) then cmd = ""; end
	if (not param) then param = ""; end

	if ((cmd == "") or (cmd == "help")) then
		local useMinimap = "Off";
		if (SETTINGS.useMinimap) then useMinimap = "On"; end
		local useMainmap = "Off";
		if (SETTINGS.useMainmap) then useMainmap = "On"; end
		local mapMinder = "Off";
		if (SETTINGS.mapMinder) then mapMinder = "On"; end
		local minderTime = "5s";
		if (SETTINGS.minderTime) then minderTime = SETTINGS.minderTime.."s"; end

		Gatherer_ChatPrint("Usage:");
		Gatherer_ChatPrint("  |cffffffff/gather (on|off|toggle)|r |cff2040ff["..useMinimap.."]|r - turns the gather minimap display on and off");
		Gatherer_ChatPrint("  |cffffffff/gather mainmap (on|off|toggle)|r |cff2040ff["..useMainmap.."]|r - turns the gather mainmap display on and off");
		Gatherer_ChatPrint("  |cffffffff/gather minder (on|off|toggle|<n>)|r |cff2040ff["..mapMinder.."]|r - turns the gather map minder on and off (remembers and reopens your last open main map; within "..minderTime..")");
		Gatherer_ChatPrint("  |cffffffff/gather dist <n>|r |cff2040ff["..SETTINGS.maxDist.."]|r - sets the maximum search distance for display (0=infinite(default), typical=10)");
		Gatherer_ChatPrint("  |cffffffff/gather num <n>|r |cff2040ff["..SETTINGS.number.."]|r - sets the maximum number of items to display (default=10, up to 25)");
		Gatherer_ChatPrint("  |cffffffff/gather fdist <n>|r |cff2040ff["..SETTINGS.fadeDist.."]|r - sets a fade distance (in units) for the icons to fade out by (default = 20)");
		Gatherer_ChatPrint("  |cffffffff/gather fperc <n>|r |cff2040ff["..SETTINGS.fadePerc.."]|r - sets the percentage for fade at max fade distance (default = 80 [=80% faded])");
		Gatherer_ChatPrint("  |cffffffff/gather theme <name>|r |cff2040ff["..SETTINGS.iconSet.."]|r - sets the icon theme: original, shaded (default), iconic or iconshade");
		Gatherer_ChatPrint("  |cffffffff/gather idist <n>|r |cff2040ff["..SETTINGS.miniIconDist.."]|r - sets the minimap distance at which the gather icon will become iconic (0 = off, 1-60 = pixel radius on minimap, default = 40)");
		Gatherer_ChatPrint("  |cffffffff/gather herbs (on|off|toggle|auto)|r |cff2040ff["..Gatherer_GetFilterVal("herbs").."]|r - select whether to show herb data on the minimap");
		Gatherer_ChatPrint("  |cffffffff/gather mining (on|off|toggle|auto)|r |cff2040ff["..Gatherer_GetFilterVal("mining").."]|r - select whether to show mining data on the minimap");
		Gatherer_ChatPrint("  |cffffffff/gather treasure (on|off|toggle|auto)|r |cff2040ff["..Gatherer_GetFilterVal("treasure").."]|r - select whether to show treasure data on the minimap");
		Gatherer_ChatPrint("  |cffffffff/gather options|r - show/hide UI Options dialog.");
		Gatherer_ChatPrint("  |cffffffff/gather report|r - show/hide report dialog.");
		Gatherer_ChatPrint("  |cffffffff/gather search|r - show/hide search dialog.");
		Gatherer_ChatPrint("  |cffffffff/gather loginfo (on|off)|r - show/hide logon information.");
		Gatherer_ChatPrint("  |cffffffff/gather filterrec (herbs|mining|treasure)|r - link display filter to recording for selected gathering type");
		Gatherer_ChatPrint("  |cffffffff/gather debug ([on]|off)|r |cff2040ff["..Gatherer_EBoolean[SETTINGS.debug].."]|r - show/hide debug messages");
		Gatherer_ChatPrint("  |cffffffff/gather p2p ([on]|off)|r |cff2040ff["..Gatherer_EBoolean[SETTINGS.p2p].."]|r - enable/disable peer-to-peer functions");
	elseif (cmd == "options" ) then
		if ( GathererUI_DialogFrame:IsVisible() ) then
			GathererUI_HideOptions();
		else
			GathererUI_ShowOptions();
		end
	elseif (cmd == "debug") then
		if (not param or param == "" or param == "on") then
			SETTINGS.debug = true;
			Gatherer_ChatPrint("Debug messages enabled");
		elseif (param == "off") then
			SETTINGS.debug = false;
			Gatherer_ChatPrint("Debug messages disabled");
		end
	elseif (cmd == "p2p") then
		if (not param or param == "" or param == "on") then
			SETTINGS.p2p = true;
			Gatherer_ChatPrint("Peer-to-peer functions enabled");
		elseif (param == "off") then
			SETTINGS.p2p = false;
			Gatherer_ChatPrint("Peer-to-peer functions disabled");
		end
	elseif (cmd == "report" ) then
		showGathererInfo(1);
	elseif (cmd == "search" ) then
		showGathererInfo(2);
	elseif (cmd == "loginfo" ) then
		local value;
		if (not param or param == "") then value = "on"; else value = param; end
		Gatherer_ChatPrint("Setting log information display to "..value);
		SETTINGS.logInfo = value;
	elseif ( cmd == "filterrec" ) then
		local value=-1;
		if (not param) then
			return;
		end;
		if ( param == "treasure" ) then
			value = 0;
		elseif ( param == "herbs" ) then
			value = 1;
		elseif ( param == "mining" ) then
			value = 2;
		end

		if ( value > -1 ) then
			if ( SETTINGS.filterRecording[value] ) then
				SETTINGS.filterRecording[value] = nil;
				Gatherer_ChatPrint("Turned filter/recording link for "..param.." off.");
			else
				SETTINGS.filterRecording[value] = 1;
				Gatherer_ChatPrint("Turned filter/recording link for "..param.." on.");
			end
		end
	elseif (cmd == "on") then
		SETTINGS.useMinimap = true;
		Gatherer_OnUpdate(0, true);
		SETTINGS.useMinimapText = "on";
		Gatherer_ChatPrint("Turned gather minimap display on");
	elseif (cmd == "off") then
		SETTINGS.useMinimap = false;
		SETTINGS.useMinimapText = "off";
		Gatherer_OnUpdate(0, true);
		Gatherer_ChatPrint("Turned gather minimap display off (still collecting)");
	elseif (cmd == "toggle") then
		SETTINGS.useMinimap = not SETTINGS.useMinimap;
		Gatherer_OnUpdate(0, true);
		if (SETTINGS.useMinimap) then
			Gatherer_ChatPrint("Turned gather minimap display on");
			SETTINGS.useMinimapText = "on";
		else
			Gatherer_ChatPrint("Turned gather minimap display off (still collecting)");
			SETTINGS.useMinimapText = "off";
		end
	elseif (cmd == "dist") then
		local i,j, value = string.find(param, "(%d+)");
		if (not value) then value = 0; else value = value + 0.0; end
		if (value <= 0) then
			SETTINGS.maxDist = 0;
		else
			SETTINGS.maxDist = value + 0.0;
		end
		Gatherer_ChatPrint("Setting maximum note distance to "..SETTINGS.maxDist);
		Gatherer_OnUpdate(0, true);
	elseif (cmd == "fdist") then
		local i,j, value = string.find(param, "(%d+)");
		if (not value) then value = 0; else value = value + 0.0; end
		if (value <= 0) then
			SETTINGS.fadeDist = 0;
		else
			SETTINGS.fadeDist = value + 0.0;
		end
		Gatherer_ChatPrint("Setting fade distance to "..SETTINGS.fadeDist);
		Gatherer_OnUpdate(0, true);
	elseif (cmd == "fperc") then
		local i,j, value = string.find(param, "(%d+)");
		if (not value) then value = 0; else value = value + 0.0; end
		if (value <= 0) then
			SETTINGS.fadePerc = 0;
		else
			SETTINGS.fadePerc = value + 0.0;
		end
		Gatherer_ChatPrint("Setting fade percent at fade distance to "..SETTINGS.fadePerc);
		Gatherer_OnUpdate(0, true);
	elseif ((cmd == "idist") or (cmd == "icondist")) then
		local i,j, value = string.find(param, "(%d+)");
		if (not value) then value = 0; else value = value + 0; end
		if (value <= 0) then
			SETTINGS.miniIconDist = 0;
		else
			SETTINGS.miniIconDist = value + 0;
		end
		Gatherer_ChatPrint("Setting iconic distance to "..SETTINGS.miniIconDist);
		Gatherer_OnUpdate(0, true);
	elseif (cmd == "theme") then
		if (Gather_IconSet[param]) then
			SETTINGS.iconSet = param;
			Gatherer_ChatPrint("Gatherer theme set to "..SETTINGS.iconSet);
		else
			Gatherer_ChatPrint("Unknown theme: "..param);
		end
		Gatherer_OnUpdate(0, true);
	elseif ((cmd == "num") or (cmd == "number")) then
		local i,j, value = string.find(param, "(%d+)");
		if (not value) then value = 0; else value = value + 0; end
		if (value < 0) then
			SETTINGS.number = 10;
		elseif (value <= GATHERER_MAXNUMNOTES) then
			SETTINGS.number = math.floor(value + 0);
		else
			SETTINGS.number = GATHERER_MAXNUMNOTES;
		end
		if (SETTINGS.number == 0) then
			SETTINGS.useMinimap = false;
			SETTINGS.useMinimapText = "off";
			Gatherer_OnUpdate(0, true);
			Gatherer_ChatPrint("Turned gather minimap display off (still collecting)");
		else
			if ((SETTINGS.number > 0) and (SETTINGS.useMinimap == false)) then
				SETTINGS.useMinimap = true;
		        	SETTINGS.useMinimapText = "on";
				Gatherer_ChatPrint("Turned gather minimap display on");
			end
			Gatherer_ChatPrint("Displaying "..SETTINGS.number.." notes at once");
			Gatherer_OnUpdate(0, true);
		end
	elseif (cmd == "mainmap") then
		if ((param == "false") or (param == "off") or (param == "no") or (param == "0")) then
			SETTINGS.useMainmap = false;
		elseif (param == "toggle") then
			SETTINGS.useMainmap = not SETTINGS.useMainmap;
		else
			SETTINGS.useMainmap = true;
		end
		if (SETTINGS.useMainmap) then
			Gatherer_ChatPrint("Displaying notes in main map");
			Gatherer_WorldMapDisplay:SetText("Hide Items");
		else
			Gatherer_ChatPrint("Not displaying notes in main map");
			Gatherer_WorldMapDisplay:SetText("Show Items");
		end

		if (SETTINGS.useMainmap and SETTINGS.showWorldMapFilters and SETTINGS.showWorldMapFilters == 1) then
			GathererWD_DropDownFilters:Show();
		end

	elseif (cmd == "minder") then
		if ((param == "false") or (param == "off") or (param == "no") or (param == "0")) then
			SETTINGS.mapMinder = false;
		elseif (param == "toggle") then
			SETTINGS.mapMinder = not SETTINGS.mapMinder;
		elseif (param == "on") then
			SETTINGS.mapMinder = true;
		else
			local i,j, value = string.find(param, "(%d+)");
			if (not value) then value = 0; else value = value + 0; end
			if (value <= 0) then
				SETTINGS.mapMinder = false;
				SETTINGS.minderTime = 0;
			else
				SETTINGS.mapMinder = true;
				SETTINGS.minderTime = value + 0;
			end
			Gatherer_ChatPrint("Setting map minder timeout to "..SETTINGS.minderTime);
		end
		if (SETTINGS.mapMinder) then
			Gatherer_ChatPrint("Map minder activated at "..SETTINGS.minderTime);
		else
			Gatherer_ChatPrint("Not minding your map");
		end
	elseif ((cmd == "herbs") or (cmd == "mining") or (cmd == "treasure")) then
		if ((param == "false") or (param == "off") or (param == "no") or (param == "0")) then
			Gatherer_SetFilter(cmd, "off");
			Gatherer_ChatPrint("Not displaying "..cmd.." notes in minimap");
		elseif (param == "on" or param == "On" ) then
				Gatherer_SetFilter(cmd, "on");
				Gatherer_ChatPrint("Displaying "..cmd.." notes in minimap");
		elseif (param == "toggle" or param == "") then
			local cur = Gatherer_GetFilterVal(cmd);
			if ((cur == "on") or (cur == "auto")) then
				cur = "off";
				Gatherer_SetFilter(cmd, "off");
				Gatherer_ChatPrint("Not displaying "..cmd.." notes in minimap");
			else
				cur = "on";
				Gatherer_SetFilter(cmd, "on");
				Gatherer_ChatPrint("Displaying "..cmd.." notes in minimap");
			end
		else
			Gatherer_SetFilter(cmd, "auto");
			Gatherer_ChatPrint("Displaying "..cmd.." notes in minimap based on ability");
		end
		Gatherer_OnUpdate(0, true);
		GatherMain_Draw();
	end
end

-- *************************************************************************
-- Events Handler

function Gatherer_OnEvent(event)
	if (not event) then return; end;

	-- Enable/Disable event processing for zoning
	if (event == "PLAYER_ENTERING_WORLD" ) then
		this:RegisterEvent("CHAT_MSG_SPELL_SELF_BUFF"); -- standard gathering event
		this:RegisterEvent("UI_ERROR_MESSAGE"); -- event added for impossible to gather item
		this:RegisterEvent("CHAT_MSG_LOOT"); -- event added for fishing node
		Gatherer_InWorld = true;

	elseif (event == "PLAYER_LEAVING_WORLD" ) then
		this:UnregisterEvent("CHAT_MSG_SPELL_SELF_BUFF"); -- standard gathering event
		this:UnregisterEvent("UI_ERROR_MESSAGE"); -- event added for impossible to gather item
		this:UnregisterEvent("CHAT_MSG_LOOT"); -- event added for fishing node
		Gatherer_InWorld = false;

	-- process loot received message for fishing node trigger
	elseif ( event == "CHAT_MSG_LOOT" ) then
		local _, _, fishItem = string.find(arg1, GATHERER_ReceivesLoot );
		local gfishTooltip = Gatherer_ExtractItemFromTooltip()

		if ( fishItem and not UnitExists("mouseover") ) then
			Gatherer_ReadBuff(event, fishItem, gfishTooltip);
		end
	-- process event to record, normally not possible gather (low/inexistant skill)
	elseif ( event == "UI_ERROR_MESSAGE" ) then
		-- process gather error message
		-- need to be in standard gather range to get the correct message to process.
		if (arg1 and
		    (strfind(arg1, GATHERER_REQUIRE.." "..OLD_TRADE_HERBALISM) or strfind(arg1, GATHERER_NOSKILL.." "..OLD_TRADE_HERBALISM) or 
			strfind(arg1, OLD_TRADE_HERBALISM.." "..GATHERER_NOSKILL) or strfind(arg1, GATHERER_REQUIRE.." "..TRADE_MINING) or
			strfind(arg1, GATHERER_NOSKILL.." "..TRADE_MINING) or strfind(arg1, TRADE_MINING.." "..GATHERER_NOSKILL))) then
			Gatherer_ReadBuff(event);
		end
	-- process chatmessages
	elseif ( event == "CHAT_MSG_SPELL_SELF_BUFF" ) then
		Gatherer_ReadBuff(event);

	-- process AddOn communication
	elseif strfind(event, "CHAT_MSG_ADDON") then
		Gatherer_AddonMessageEvent(arg1, arg2, arg3);

	-- process tooltips text for 1.12
	elseif ( event == "SPELLCAST_START" ) then
		if ( arg1 and (arg1 == GATHER_HERBALISM or arg1 == TRADE_MINING or arg1 == TRADE_OPENING or arg1 =="") ) then
			Gatherer_Debug("|cffffffffEvent :|r "..event.." => "..arg1);
			Gatherer_currentNode = GameTooltipTextLeft1:GetText();
			Gatherer_currentAction = arg1;

			Gatherer_Debug("Current node: "..(Gatherer_currentNode or "nil"));
			Gatherer_RecordFlag=1;
		end
	elseif ( event == "SPELLCAST_STOP" and Gatherer_RecordFlag == 1 ) then
		Gatherer_ReadBuff(event);
		Gatherer_currentNode=nil;
	elseif ( event == "SPELLCAST_STOP" and Gatherer_RecordFlag == 0 ) then
		Gatherer_currentNode=nil;
		Gatherer_RecordFlag = 0;

	elseif ( event == "SPELLCAST_FAILED" ) then
		Gatherer_RecordFlag = 0;

	elseif (event == "WORLD_MAP_UPDATE") then
		if (WorldMapFrame:IsVisible()) then
			local serverTime = GetTime();
			if (Gatherer_Settings.mapMinder == true and Gatherer_MapOpen == false) then
				-- Enhancement to open to last opened map if we were there less than a minute ago
				-- Otherwise, go to the player's current position
				local startContinent, startZone;
				if (Gatherer_CloseMap and (serverTime - Gatherer_CloseMap.time < Gatherer_Settings.minderTime)) then
					startContinent = Gatherer_CloseMap.continent;
					startZone = Gatherer_CloseMap.zone;
				else
					startContinent, startZone = Gatherer_GetCurrentZone();
				end

				Gatherer_MapOpen = true;
				if ( GetCurrentMapContinent()>0 and startZone and startZone > 0 ) then
					SetMapZoom(startContinent, startZone);
				end
			end
			Gatherer_MapOpen = true;
			local mapContinent = GetCurrentMapContinent();
			local mapZone = GetCurrentMapZone();
			Gatherer_CloseMap = { continent = mapContinent, zone = mapZone, time = GetTime() };
			GatherMain_Draw();
		elseif (Gatherer_MapOpen) then
			Gatherer_MapOpen = false;
			Gatherer_ChangeMap();
			GatherMain_Draw();
		end
	elseif ( event == "CLOSE_WORLD_MAP") then
		-- never called apparently
		Gatherer_MapOpen = false;

		Gatherer_ChangeMap()
		GatherMain_Draw();
	elseif( event == "ADDON_LOADED") then
		if ( myAddOnsFrame_Register ) then
			-- myAddons Support
			GathererDetails["name"] = "Gatherer";
			GathererDetails["version"] = GATHERER_VERSION;
			GathererDetails["author"] = "Norganna";
			GathererDetails["website"] = "http://gathereraddon.com";
			GathererDetails["category"] = MYADDONS_CATEGORY_PROFESSIONS;
			GathererDetails["frame"] = "Gatherer";
			GathererDetails["optionsframe"] = "GathererUI_DialogFrame";

			-- Register the addon in myAddOns
			if(myAddOnsFrame_Register) then
				myAddOnsFrame_Register(GathererDetails, GathererHelp);
			end
		end

		if (arg1 and string.lower(arg1) == "gatherer") then
			Gatherer_Configuration.Load();
			GATHERER_LOADED = true;
			Gatherer_sanitizeDatabase(GatherItems)
			Gatherer_OnUpdate(0, true);

			Gatherer_Print("Gatherer p2p v"..GATHERER_VERSION.." -- Loaded!");

			if (Gatherer_Settings.useMainmap == true) then
				Gatherer_WorldMapDisplay:SetText("Hide Items");
			else
				Gatherer_WorldMapDisplay:SetText("Show Items");
			end

			-- Warning at logon on Gatherer Version number change to check for localization zone change (commented, not needed in 1.12)
			--if ( GetLocale() == "deDE" and (not Gatherer_Settings.Version or (Gatherer_Settings.Version and Gatherer_Settings.Version ~= GATHERER_VERSION ))) then
			--	StaticPopup_Show("GATHERER_VERSION_DIALOG");
			--end

			-- record current version number in order to identify the data for backup utilities
			Gatherer_Settings.Version = GATHERER_VERSION;

			-- Get values for World Map once for all
			Gatherer_WorldMapDetailFrameWidth = WorldMapDetailFrame:GetWidth();
			Gatherer_WorldMapDetailFrameHeight = WorldMapDetailFrame:GetHeight();
			Gatherer_WorldMapPlayerFrameLevel = WorldMapPlayer:GetFrameLevel();

			-- New backup format allows the user to permenantly save their data
			-- in an automatically restoring file "GatherBase.lua"
			-- All data in this file will be loaded "under" the saved data every
			-- time the addon loads so that in the event of a savedVariables wipe
			-- the next time they run WoW, their data will be back to the last
			-- backed up point. (This utility will appear in a later version of
			-- Gatherer as a Java applet)
			if (GatherItemBase ~= nil) then
				for c, cd in GatherItems do
					for z, zd in cd do
						for n,nd in zd do
							for i,id in nd do
								local matched = 0;
								local max = 0;
								for j,jd in GatherItemBase[c][z][n] do
									if (math.abs(id.x- jd.y) < 0.05) then
										matched = j;
									end
									max = j;
								end
								if (matched > 0) then
									GatherItemBase[c][z][n][matched] = id;
								else
									GatherItemBase[c][z][n][max+1] = id;
								end
							end
						end
					end
				end
				GatherItems = GatherItemBase;
			end
		end
	elseif ( event == "PLAYER_LOGIN" ) then
		local SETTINGS = Gatherer_Settings;
		local useMinimap = (SETTINGS.useMinimap) and "On" or "Off";
		local useMainmap = (SETTINGS.useMainmap) and "On" or "Off";
		local mapMinder = (SETTINGS.mapMinder) and "On" or "Off";
		local minderTime = SETTINGS.minderTime.."s";

		if ( SETTINGS.logInfo and SETTINGS.logInfo == "on" ) then
			Gatherer_Print("[Player: "..Gather_Player..", Theme: "..SETTINGS.iconSet..", Mainmap: "..useMainmap..", Minimap: "..useMinimap..", MaxDist: "..SETTINGS.maxDist.." units, NoteCount: "..SETTINGS.number..", Fade: "..SETTINGS.fadePerc.."% at "..SETTINGS.fadeDist.." units, IconDist: "..SETTINGS.miniIconDist.."px on minimap, MapMinder: "..mapMinder.." ("..minderTime.."), Filters: herbs="..Gatherer_GetFilterVal("herbs")..", mining="..Gatherer_GetFilterVal("mining")..", treasure="..Gatherer_GetFilterVal("treasure").."]");
		end

	elseif ( event == "PLAYER_LOGOUT" ) then
		Gatherer_Configuration.Save();

	elseif ( event == "LEARNED_SPELL_IN_TAB" or event == "SPELLS_CHANGED" ) then
		local numSkills = tonumber(GetNumSkillLines());
		if ( GetNumSkillLines() > 0 ) then
			Gatherer_GetSkills();
		end
	elseif ( event == "SKILL_LINES_CHANGED" ) then
		local numSkills = tonumber(GetNumSkillLines());
		if ( GetNumSkillLines() > 0 ) then
			Gatherer_GetSkills();
		end
	else
		Gatherer_ChatPrint("Gatherer Unknown event: "..event);
	end
end

-- *************************************************************************
-- Filter related functions

local filterConversion = {
	["herbs"] = 1,
	["mining"] = 2,
	["treasure"] = 0,
	[0] = 0,
	[1] = 1,
	[2] = 2,
}

function Gatherer_SetFilter(type, value)
	local type = filterConversion[type];
	if ( type ) then
		Gatherer_Settings.filters[type] = value;
	end
end

function Gatherer_GetFilterVal(type)
	local type = filterConversion[type];
	value = Gatherer_Settings.filters[type];
	if (not value) then return "auto"; end
	return value;
end

function Gatherer_GetFilter(filter)
	local value = Gatherer_GetFilterVal(filter);
	local filterVal = false;

	if (value == "on") then
		filterVal = true;
	elseif (value == "off") then
		filterVal = false;
	elseif (value == "auto") then
		if (filter == "treasure") then
			filterVal = true;
		end
		if (not GatherSkills) then
			filterVal = true;
		end
		if ((GatherSkills[filter]) and (GatherSkills[filter] > 0)) then
			filterVal = true;
		end
	end

	return filterVal;
end

function Gatherer_GetSkills()
	local GatherExpandedHeaders = {};
	local i, j;

	if ( not GatherSkills ) then GatherSkills = {}; end;
	Gatherer:UnregisterEvent("SKILL_LINES_CHANGED");

	-- search the skill tree for gathering skills
	for i=0, GetNumSkillLines(), 1 do
		local skillName, header, isExpanded, skillRank, _, _, _, _, _, _, _, _ = GetSkillLineInfo(i);

		-- expand the header if necessary
		if ( header and not isExpanded ) then
			GatherExpandedHeaders[i] = skillName;
		end
	end

	ExpandSkillHeader(0);
	for i=1, GetNumSkillLines(), 1 do
		local skillName, header, _, skillRank, _, _, _, _, _, _, _, _ = GetSkillLineInfo(i);
		-- check for the skill name
		if (skillName and not header) then
			if (skillName == TRADE_HERBALISM) then
				GatherSkills.herbs = skillRank;
			elseif (skillName == TRADE_MINING) then
				GatherSkills.mining = skillRank;
			end
		end

		-- once we got both, no need to look the rest
		if ( GatherSkills.herbs and GatherSkills.mining ) then
			break;
		end
	end

	-- close headers expanded during search process
	for i=0, GetNumSkillLines() do
		local skillName, header, isExpanded, _, _, _, _, _, _, _, _, _ = GetSkillLineInfo(i);
		for j in  GatherExpandedHeaders do
			if ( header and skillName == GatherExpandedHeaders[j] ) then
				CollapseSkillHeader(i);
				GatherExpandedHeaders[j] = nil;
			end
		end
	end
end


local function random_choice(t)
    if not t then return end
    local choiceI = nil;
	local choiceO = nil;
    local n = 0;
    for i, o in pairs(t) do
        n = n + 1
        if math.random() < (1/n) then
            choiceI, choiceO = i, o
        end
    end
    return choiceI, choiceO
end


local function selectRandomGather()
	-- type: () -> Tuple[GatherName, Gatherer_EGatherType, Continent, Zone, float, float, IconName, EGatherEventType]
	-- returns the arguments set for the Gatherer_BroadcastGather function
	local randomContinent, continentData = random_choice(GatherItems);
	local randomZone, zoneData = random_choice(continentData);
	local randomGather, gatherNodes = random_choice(zoneData);
	local nodeIndex, randomNode = random_choice(gatherNodes);
	Gatherer_ChatNotify('randomly selected: '..table.concat(
		{randomContinent, randomZone, randomGather, nodeIndex}, ', '
	), Gatherer_ENotificationType.debug);
	if not nodeIndex then
		return nil
	end

	local eventType = 1; -- EGatherEventType.no_skill
	-- values don't matter, I just hate lua
	local FISHING_GATHERS = {['floating wreckage']=0, ['school']=''};
	if FISHING_GATHERS[randomGather] then
		eventType = 2; -- EGatherEventType.fishing
	end

	return
		randomGather, randomNode.gtype, randomContinent, randomZone, randomNode.x, randomNode.y,
		randomNode.icon, eventType
end


-- *************************************************************************
-- Update related functions

local Gatherer_UpdateTicker = 0.0;
local Gatherer_AnnouncePeriod = 10;
local Gatherer_CycleCount = 0;
local Gatherer_SecondsToAnnounce = Gatherer_AnnouncePeriod;
function Gatherer_TimeCheck(timeDelta)
	if (not GatherNotes) then
		GatherNotes = { timeDiff=0, checkDiff=0 };
	else
		GatherNotes.checkDiff = GatherNotes.checkDiff + timeDelta;
		if (GatherNotes.checkDiff > GATHERNOTE_CHECK_INTERVAL) then
			GatherNotes.checkDiff = 0;
			Gatherer_OnUpdate(0,true);
		end
	end
	Gatherer_UpdateTicker = Gatherer_UpdateTicker + arg1;
	if( Gatherer_UpdateTicker < 1 ) then
		return
	end
	-- reset seconds counter
	Gatherer_UpdateTicker = 0.0;
	-- the code below will run not more frequently
	-- than once a second
	Gatherer_SecondsToAnnounce = Gatherer_SecondsToAnnounce - 1
--	Gatherer_Print('Every second '..Gatherer_SecondsToAnnounce..' seconds.')
	if Gatherer_SecondsToAnnounce > 0 then
		return
	end
	-- the code below will run not more frequently
	-- than once Gatherer_AnnouncePeriod seconds
	if Gatherer_Settings.p2p then
		local args = {selectRandomGather()};
		-- if failed to get a random node skip cycle
		if not args[1] then
			return
		end
		Gatherer_CycleCount = Gatherer_CycleCount + 1
		if Gatherer_Settings.debug then
			Gatherer_ChatPrint('Gatherer: Cycle #'..Gatherer_CycleCount);
			Gatherer_ChatNotify(
				'Sending random node once in '..Gatherer_AnnouncePeriod..' seconds.',
				Gatherer_ENotificationType.sending
			);
			Gatherer_ChatNotify(
				'args to send: '..table.concat(args, ', '), Gatherer_ENotificationType.sending
			);
		end
		Gatherer_BroadcastGather(unpack(args))
	end
	Gatherer_SecondsToAnnounce = Gatherer_AnnouncePeriod
end

function Gatherer_OnUpdate(timeDelta, force)
	if (not GATHERER_LOADED) then
		Gatherer_Print("Gatherer not loaded");
		return;
	end

	local SETTINGS = Gatherer_Settings;

	if (Gatherer_InWorld == false ) then
		return;
	end

	if (not SETTINGS.useMinimap) then
		Gatherer_HideAll();
		return;
	end

	local recalculate = false;
	local needsUpdate = false;
	if (not GatherNotes) then
		GatherNotes = { timeDiff=0, checkDiff=0 };
		needsUpdate = true;
	else
		GatherNotes.timeDiff = GatherNotes.timeDiff + timeDelta;
		if (GatherNotes.timeDiff > GATHERNOTE_UPDATE_INTERVAL) then
			needsUpdate = true;
		end
	end
	if (force) then
		needsUpdate = true;
		recalculate = true;
	end

	if (needsUpdate) then
		GatherNotes.timeDiff = 0;
		-- Find the closest gathers
		local continent, zone = Gatherer_GetCurrentZone();
		if ((continent == 0) or (zone == 0)) then
			Gatherer_HideAll();
			return;
		end

		local inCity = GatherMap_InCity;
		local zoomLevel = Minimap:GetZoom();
		local px, py = Gatherer_PlayerPos();
		if ((px == 0) and (py == 0)) then
			return;
		end
		local xMovement = 0; if (ClosestGathers and ClosestGathers.px) then xMovement = math.abs(ClosestGathers.px - px); end
		local yMovement = 0; if (ClosestGathers and ClosestGathers.py) then yMovement = math.abs(ClosestGathers.py - py); end
		if (not ClosestGathers
			or ClosestGathers.playerC ~= continent
			or ClosestGathers.playerZ ~= zone
			or xMovement + yMovement > 0.01) then
			recalculate = true;
		end

		local displayNumber = 10;
		if (SETTINGS.number and SETTINGS.number > 0) then
			displayNumber = SETTINGS.number;
		end

		local playerDeltaX = 0;
		local playerDeltaY = 0;
		if (recalculate == true) then
			ClosestGathers = {};
			ClosestGathers = Gatherer_FindClosest(displayNumber);
			if (ClosestGathers.count > 0) then
				ClosestGathers.inCity = inCity;
				ClosestGathers.zoomLevel = zoomLevel;
				ClosestGathers.scaleX, ClosestGathers.scaleY = Gatherer_GetMapScale(continent, zone, inCity, zoomLevel);
			end
		else
			if ((inCity ~= ClosestGathers.inCity) or (zoomLevel ~= ClosestGathers.zoomLevel)) then
				ClosestGathers.inCity = inCity;
				ClosestGathers.zoomLevel = zoomLevel;
				ClosestGathers.scaleX, ClosestGathers.scaleY = Gatherer_GetMapScale(continent, zone, inCity, zoomLevel);
			end
			local absX, absY = Gatherer_AbsCoord(continent, zone, px, py);
			playerDeltaX = ClosestGathers.playerX - absX;
			playerDeltaY = ClosestGathers.playerY - absY;
		end

		local maxPos = 0;
		if (ClosestGathers and ClosestGathers.count > 0) then
			local closestPos, closestGather, closestID;
			local currentPos = 1;
			for closestPos, closestGather in ClosestGathers.items do
				local skip_node = 0;

				if ( currentPos > SETTINGS.number ) then skip_node =1; end

				if ( skip_node == 0 ) then
					-- need to position and label the corresponding button
					local gatherNote = getglobal("GatherNote"..currentPos);
					local gatherNoteTexture = getglobal("GatherNote"..currentPos.."Texture");

					local itemDeltaX = closestGather.deltax+playerDeltaX;
					local itemDeltaY = closestGather.deltay+playerDeltaY;
					local offsX, offsY, gDist = Gatherer_MiniMapPos(itemDeltaX, itemDeltaY, ClosestGathers.scaleX, ClosestGathers.scaleY);
					gatherNote:SetPoint("CENTER", Minimap, "CENTER", offsX, -offsY);

					local iconSet = SETTINGS.iconSet;
					local iDist = SETTINGS.miniIconDist;
					if (not iconSet) then iconSet = "shaded"; end
					if (not iDist) then iDist = 38; end

					local _, _, sDist = Gatherer_MiniMapPos(iDist/10000, 0, ClosestGathers.scaleX, ClosestGathers.scaleY);

					if ((iDist > 0) and (gDist > (math.floor(sDist)-1))) then
						iconSet = "iconic";
					end

					local fadeDist = SETTINGS.fadeDist / 1000;
					local fadePerc = SETTINGS.fadePerc / 100;
					local alpha = 1.0;
					local objDist = Gatherer_Pythag(itemDeltaX, itemDeltaY);
					if ((fadeDist > 0) and (fadePerc > 0)) then
						local distRatio = objDist / fadeDist ;
						alpha = 1.0 - (math.min(1.0, math.max(0.0, distRatio)) * fadePerc);
					end

					local textureType = closestGather.item.gtype;
					local textureIcon = closestGather.item.icon;

					if ( type(textureType) == "number" ) then
						textureType = Gatherer_EGatherType[textureType];
					end

					if ( type(textureIcon) == "number" ) then
						textureIcon = Gatherer_GetDB_IconIndex(textureIcon, textureType);
					end

					if (not textureIcon) then textureIcon = "default"; end;
					if (SETTINGS.iconSet == "iconshade" )
					then
						iconSet="iconic";
						if ( gDist < (math.floor(sDist)-1) )
						then
							alpha=0.4;
						end
					end
					if (not Gather_IconSet[iconSet]) then iconSet = "shaded"; end
					if (not Gather_IconSet[iconSet][textureType]) then textureType = "Default"; end
					local selectedTexture = Gather_IconSet[iconSet][textureType][textureIcon];
					if (not selectedTexture) then
						selectedTexture = Gather_IconSet[iconSet][textureType]["default"];
					end

					gatherNoteTexture:SetTexture(selectedTexture);
					gatherNote:SetFrameLevel(MiniMapTrackingFrame:GetFrameLevel());
					gatherNote:SetAlpha(alpha);

					-- Added to allow hiding if under min distance
					if ( SETTINGS.NoIconOnMinDist ~= nil and SETTINGS.NoIconOnMinDist == 1 ) then
						if ( gDist < (math.floor(sDist)-1) ) then
							gatherNote:Hide();
						else
							gatherNote:Show();
						end
					elseif ( (not SETTINGS.NoIconOnMinDist or SETTINGS.NoIconOnMinDist == 0) and SETTINGS.alphaUnderMinIcon and gDist < (math.floor(sDist)-1) ) then
						if ( SETTINGS.iconSet and SETTINGS.iconSet ~= "iconshade" ) then
							gatherNote:SetAlpha(SETTINGS.alphaUnderMinIcon / 100);
						end
						gatherNote:Show();
					else
						gatherNote:Show();
					end

					if (currentPos > maxPos) then maxPos = currentPos; end

					currentPos = currentPos + 1;
				end
				skip_node = 0;
			end
		end

		while (maxPos < GATHERER_MAXNUMNOTES) do
			maxPos = maxPos+1;
			local gatherNote = getglobal("GatherNote"..maxPos);
			if ( gatherNote:IsShown() ) then
				gatherNote:Hide();
			end
		end
	end
end

-- *************************************************************************
-- UI related functions

function Gatherer_OnClick() -- function changed to be able to ping through the MiniNote (mostly direct copy) (only change: this -> Minimap)
	local x, y = GetCursorPosition();
	if ( Minimap.GetEffectiveScale ~= nil ) then
		x = x / Minimap:GetEffectiveScale();
		y = y / Minimap:GetEffectiveScale();
	else
		x = x / Minimap:GetScale();
		y = y / Minimap:GetScale();
	end

	local cx, cy = Minimap:GetCenter();
	x = x + CURSOR_OFFSET_X - cx;
	y = y + CURSOR_OFFSET_Y - cy;
	if ( sqrt(x * x + y * y) < (Minimap:GetWidth() / 2) ) then
		Minimap:PingLocation(x, y);
	end
end

-- *************************************************************************
-- Display functions

function Gatherer_HideAll()
	local mmPos = 0;
	while (mmPos < GATHERER_MAXNUMNOTES) do
		mmPos = mmPos+1;
		local gatherNote = getglobal("GatherNote"..mmPos);
		gatherNote:Hide();
	end
end

function Gatherer_CreateNoteObject(noteNumber)
	local button;
	local overlayFrameNumber = math.floor((noteNumber - 1000) / 100 + 1);
	if(getglobal("GatherMain"..noteNumber)) then
		button = getglobal("GatherMain"..noteNumber);
	else
		Gatherer_Debug("create id "..noteNumber.." frame ".. overlayFrameNumber);
		button = CreateFrame("Button" ,"GatherMain"..noteNumber, getglobal("GathererMapOverlayFrame"..overlayFrameNumber), "GatherMainTemplate");
		button:SetID(noteNumber);
	end

	return button;
end

function GatherMain_Draw()
	local lastUnused = 1000;
	local maxNotes = 1600;
	local gatherName, gatherData;
	local SETTINGS = Gatherer_Settings;

	-- prevent the function from running twice at the same time.
	if (Gatherer_UpdateWorldMap == 0 ) then return; end;
	Gatherer_UpdateWorldMap = 0;

	if ((Gatherer_MapOpen) and (SETTINGS.useMainmap)) then
		local mapContinent = GetCurrentMapContinent();
		local mapZone = GetCurrentMapZone();
		if ((mapContinent > 0) and (mapZone > 0) and (GatherItems[mapContinent]) and (GatherItems[mapContinent][mapZone])) then
			for gatherName, gatherData in GatherItems[mapContinent][mapZone] do
				local gatherType = "Default";
				local specificType = "";
				local allowed = true;
				local minSetSkillLevel = 0;
				local idx_count=0;

				specificType = Gatherer_FindOreType(gatherName);
				if (specificType) then -- Ore
					gatherType = 2;
					allowed = Gatherer_GetFilter("mining");
				else
					specificType = Gatherer_FindTreasureType(gatherName);
					if (specificType ) then -- Treasure
						gatherType = 0;
						allowed = Gatherer_GetFilter("treasure");
					else
						specificType = Gatherer_FindFishType(gatherName);
						if ( specificType ) then -- Treasure Fish
							gatherType = 0;
							allowed = Gatherer_GetFilter("treasure");
						else
							-- Herb
							specificType = gatherName;
							gatherType = 1;
							allowed = Gatherer_GetFilter("herbs");
						end
					end
				end
				if (not specificType) then
					specificType = "default";
				end

				-- extra filtering options
				if (SETTINGS) then
					if ( SETTINGS.interested and SETTINGS.interested[gatherType] ) then
						for interest_index in SETTINGS.interested[gatherType] do
							idx_count= idx_count +1;
						end
					end

					if( gatherType == 2 ) then -- Ore
						minSetSkillLevel = SETTINGS.minSetOreSkill;
						if ( not minSetSkillLevel ) then minSetSkillLevel = -1; end
					elseif ( gatherType == 1 ) then -- Herb
						minSetSkillLevel = SETTINGS.minSetHerbSkill;
						if ( not minSetSkillLevel ) then minSetSkillLevel = -1; end
					end

					if ( allowed == true and Gather_SkillLevel[specificType] and
						minSetSkillLevel > 0 and
						(minSetSkillLevel > Gather_SkillLevel[specificType] or
						 (SETTINGS.rareOre == 1 and Gather_SkillLevel[Gather_RareMatch[specificType]] and
						  Gather_SkillLevel[specificType] < Gather_SkillLevel[Gather_RareMatch[specificType]] and
						  minSetSkillLevel > Gather_SkillLevel[Gather_RareMatch[specificType]] ))
					) then
						allowed = false;
					end
				end

				if ((allowed == true) and
					((SETTINGS == nil) or
					 (SETTINGS.interested == nil) or (idx_count == 0) or SETTINGS.interested[gatherType] == nil or
					 (SETTINGS.interested[gatherType][specificType] == true or
					  (SETTINGS.rareOre == 1 and SETTINGS.interested[gatherType][Gather_RareMatch[specificType]])
					 )
					)
				) then
					for hPos, gatherInfo in gatherData do
						local convertedGatherType="";
						local numGatherType, numGatherIcon;

						if ( lastUnused > 1000 and lastUnused < maxNotes and mod(lastUnused, 100) == 0 ) then
							local overlayFrameNumber = math.floor((lastUnused - 1000 )/100 + 1);

							getglobal("GathererMapOverlayFrame"..overlayFrameNumber):Show();
						elseif (lastUnused < 1100 and not GathererMapOverlayFrame1:IsShown() ) then
							GathererMapOverlayFrame1:Show();
						end

						if ((gatherInfo.x) and (gatherInfo.y) and (gatherInfo.x>0) and (gatherInfo.y>0) and (lastUnused <= maxNotes)) then
							local mainNote = Gatherer_CreateNoteObject(lastUnused);

							local mnX,mnY;
							mnX = gatherInfo.x / 100 * Gatherer_WorldMapDetailFrameWidth;
							mnY = -gatherInfo.y / 100 * Gatherer_WorldMapDetailFrameHeight;

							if ( SETTINGS and SETTINGS.IconAlpha ~= nil ) then
								mainNote:SetAlpha(SETTINGS.IconAlpha / 100);
							else
								mainNote:SetAlpha(0.8);
							end

							mainNote:SetPoint("CENTER", "GathererMapOverlayFrame", "TOPLEFT", mnX, mnY);

							if ( SETTINGS and SETTINGS.ToggleWorldNotes and SETTINGS.ToggleWorldNotes == 1)
							then
								mainNote.toolTip = Gatherer_GetMenuName(gatherName);
							else
								mainNote.toolTip = Gatherer_GetMenuName(specificType);
							end

							if ( type(gatherType) == "number" ) then
								convertedGatherType = Gatherer_EGatherType[gatherType];
								numGatherType = gatherType
							else
								convertedGatherType = gatherType;
								numGatherType = Gatherer_EGatherType[gatherType];
							end

							if (not Gather_IconSet["iconic"][convertedGatherType]) then
								gatherType = "Default";
							else
								gatherType = convertedGatherType;
							end
							if ( type(specificType) == "number" ) then
								specificType = Gatherer_GetDB_IconIndex(specificType, convertedGatherType);
							end
							local texture = Gather_IconSet["iconic"][convertedGatherType][specificType];
							if (not texture) then
								texture = Gather_IconSet["iconic"][gatherType]["default"];
							end

							if ( gatherInfo.gtype == "Default" or gatherInfo.gtype == 3 ) then
								texture = Gather_IconSet["iconic"]["Default"]["default"];
							end

							local mainNoteTexture = getglobal("GatherMain"..lastUnused.."Texture");
							mainNoteTexture:SetTexture(texture);
							if ( SETTINGS and SETTINGS.IconSize ~= nil ) then
								mainNote:SetWidth(SETTINGS.IconSize);
								mainNote:SetHeight(SETTINGS.IconSize);
							end

							-- setting value for editing
							if (type(gatherInfo.icon) == "string" ) then
								numGatherIcon = Gather_DB_IconIndex[numGatherType];
							else
								numGatherIcon = gatherInfo.icon;
							end

							mainNote.continent = mapContinent;
							mainNote.zoneIndex = mapZone;
							mainNote.gatherName = gatherName;
							mainNote.localIndex = hPos;
							mainNote.gatherType = numGatherType;
							mainNote.gatherIcon = numGatherIcon;

							if ( not mainNote:IsShown() ) then
								mainNote:Show();
							end
							lastUnused = lastUnused + 1;
						end
					end
				end
			end
		end
	end

	local i=1000;
	for i=lastUnused, maxNotes, 1 do
		-- Delay code to try to work around the delay display problem, pause for 50 ms each 100 items
		local overlayFrameNumber = math.floor((i - 1000) / 100 +1);

		if ( i < maxNotes and mod(i, 100) == 0 )
		then
			getglobal("GathererMapOverlayFrame"..overlayFrameNumber):Hide();
		end

		local mainNote = getglobal("GatherMain"..i);
		if ( mainNote and mainNote:IsShown() ) then
			mainNote:SetPoint("CENTER", "GathererMapOverlayFrame", "TOPLEFT", Gatherer_WorldMapDetailFrameWidth+16, Gatherer_WorldMapDetailFrameHeight+16);
		end
	end

	Gatherer_UpdateWorldMap = -1;
end

function Gatherer_FindClosest(num, interested)
	local SETTINGS = Gatherer_Settings;
	local gatherLocal = {playerC=0,playerZ=0,playerX=0,playerY=0,px=0,py=0,items={},count=0};

	if (not GATHERER_LOADED) then return gatherLocal; end
	if (Gatherer_InWorld == false ) then return gatherLocal; end


	local continent, zone = Gatherer_GetCurrentZone();

	if ((continent == 0) or (zone == 0)) then return gatherLocal; end

	local px,py = Gatherer_PlayerPos();
	if ((px == 0) and (py == 0)) then return gatherLocal; end

	local absPx, absPy = Gatherer_AbsCoord(continent, zone, px, py);
	gatherLocal = { playerC=continent, playerZ=zone, playerX=absPx, playerY=absPy, px=px, py=py, items={}, count=0 };

	local gatherCount = 0;
	local maxAllowable = 0;
	if ((SETTINGS.maxDist) and (SETTINGS.maxDist > 0)) then
		maxAllowable = SETTINGS.maxDist / 1000;
	end

	if (not GatherItems[continent] or (GatherItems[continent] and not GatherItems[continent][zone])) then return gatherLocal; end

--	local gatherZone, gathersInZone;
--	for gatherZone, gathersInZone in GatherItems[continent] do
		local gatherName, gatherData;
		for gatherName, gatherData in GatherItems[continent][zone] do
--		for gatherName, gatherData in gathersInZone do
			local gatherType = "Default";
			local specificType = "";
			local allowed = true;

			specificType = Gatherer_FindOreType(gatherName);
			if (specificType) then -- Ore
				gatherType = 2;
				allowed = Gatherer_GetFilter("mining");
			else
				specificType = Gatherer_FindTreasureType(gatherName);
				if (specificType) then -- Treasure
					gatherType = 0;
					allowed = Gatherer_GetFilter("treasure");
				else -- Herb
					specificType = gatherName;
					gatherType = 1;
					allowed = Gatherer_GetFilter("herbs");
				end
			end

			if (not specificType) then
				specificType = "default";
			end

			local idx_count=0;

			if (SETTINGS) then
				if ( SETTINGS.interested and SETTINGS.interested[gatherType] ) then
					for interest_index in SETTINGS.interested[gatherType] do
						idx_count= idx_count +1;
					end
				end

				if( gatherType == 2 ) then -- Ore
					minSetSkillLevel = SETTINGS.minSetOreSkill;
					if ( not minSetSkillLevel ) then minSetSkillLevel = -1; end
				elseif ( gatherType == 1 ) then -- Herb
					minSetSkillLevel = SETTINGS.minSetHerbSkill;
					if ( not minSetSkillLevel ) then minSetSkillLevel = -1; end
				end

				if ( allowed == true and Gather_SkillLevel[specificType] and
					minSetSkillLevel > 0 and
					(minSetSkillLevel > Gather_SkillLevel[specificType] or
					 (SETTINGS.rareOre == 1 and Gather_SkillLevel[Gather_RareMatch[specificType]] and
					  minSetSkillLevel > Gather_SkillLevel[Gather_RareMatch[specificType]] ))
				) then
					allowed = false;
				end
			end

			if ((allowed == true) and
				((SETTINGS == nil) or
				 (SETTINGS.interested == nil) or (idx_count == 0) or SETTINGS.interested[gatherType] == nil or
				 (SETTINGS.interested[gatherType][specificType] == true or
				  (SETTINGS.rareOre == 1 and SETTINGS.interested[gatherType][Gather_RareMatch[specificType]])
				 )
				)
			) then
				local maxNum=100;
				local gatherInfo;

				for _, gatherInfo in gatherData do
					local absHx;
					local absHy;

					if ((not gatherInfo.gtype) or (gatherInfo.gtype == "")) then
						gatherInfo.gtype = gatherType;
					end

					if ((not gatherInfo.icon) or (gatherInfo.icon == "")) then
						gatherInfo.icon = Gatherer_GetDB_IconIndex(specificType, gatherType);
					end

					absHx, absHy = Gatherer_AbsCoord(continent, zone, gatherInfo.x/100, gatherInfo.y/100);
--					absHx, absHy = Gatherer_AbsCoord(continent, gatherZone, gatherInfo.x/100, gatherInfo.y/100);					absHx = math.floor(absHx * 100000)/100000;
					absHy = math.floor(absHy * 100000)/100000;

					if ((absHx ~= 0) and (absHy ~= 0)) then
						local maxLocalPos = 0;
						local replCandidate = 0;
						local dist, deltaX, deltaY = Gatherer_Distance(absPx, absPy, absHx, absHy);

						if ((maxAllowable == 0) or (dist < maxAllowable)) then
							local localPos, localInfo;

							for localPos, localInfo in gatherLocal.items do

								if ( localPos <= num ) then
									if (localPos > maxLocalPos) then maxLocalPos = localPos; end

									-- take node at the same approximate spot into consideration
									if ( (abs(gatherInfo.x - localInfo.item.x) <= GATHERER_CLOSESTCHECK or
										 Gatherer_Round(gatherInfo.x * 10) == Gatherer_Round(localInfo.item.x * 10)) and
										(abs(gatherInfo.y - localInfo.item.y) <= GATHERER_CLOSESTCHECK or
										 Gatherer_Round(gatherInfo.y * 10) == Gatherer_Round(localInfo.item.y * 10)) )
									then
										replCandidate = maxNum;
										maxNum = maxNum + 1;
									-- shorter distance
									elseif (localInfo.dist > dist) then
										if ((replCandidate == 0) or (gatherLocal.items[replCandidate] and (localInfo.dist > gatherLocal.items[replCandidate].dist)))
										then
											replCandidate = localPos;
										end
									end
								end
							end

							-- select candidate
							if ( maxLocalPos < num ) then
								replCandidate = maxLocalPos+1;
							elseif ( maxLocalPos == num and gatherLocal.items[replCandidate] and dist > gatherLocal.items[replCandidate].dist ) then
								replCandidate = 0;
							end

							if (replCandidate > 0) then
								local setItem = {};
								setItem.name = gatherName;
								setItem.item = gatherInfo;
								setItem.dist = dist;
								setItem.deltax = deltaX;
								setItem.deltay = deltaY;

								gatherLocal["items"][replCandidate] = setItem;
								gatherCount = gatherCount+1;
							end
						end
					end
				end
			end
--		end
	end

	gatherLocal.count = gatherCount;
	return gatherLocal;
end

-- *************************************************************************
-- Coordinates computing related functions

function isMinimapInCity()
	local tempzoom = 0;
	local inCity = false;
	if (GetCVar("minimapZoom") == GetCVar("minimapInsideZoom")) then
		if (GetCVar("minimapInsideZoom")+0 >= 3) then
			Minimap:SetZoom(Minimap:GetZoom() - 1);
			tempzoom = 1;
		else
			Minimap:SetZoom(Minimap:GetZoom() + 1);
			tempzoom = -1;
		end
	end
	if (GetCVar("minimapInsideZoom")+0 == Minimap:GetZoom()) then inCity = true; end
	Minimap:SetZoom(Minimap:GetZoom() + tempzoom);
	return inCity;
end

function Gatherer_AbsCoord(continent, zone, x, y)
	if ((continent == 0) or (zone == 0)) then return x, y; end
	local r = GatherRegionData[continent][zone];
	local absX = x * r.scale + r.xoffset;
	local absY = y * r.scale + r.yoffset;
	return absX, absY;
end

function Gatherer_Distance(originX, originY, targetX, targetY)
	local dx = (targetX - originX);
	local dy = (targetY - originY);
	local d = Gatherer_Pythag(dx, dy);
	return d, dx, dy;
end

function Gatherer_Pythag(dx, dy)
	local d = math.sqrt(dx*dx + dy*dy); -- (a*a) is usually computationally faster than math.pow(a,2)
	if (d == 0) then d = 0.0000000001; end -- to avoid divide by zero errors.
	return d;
end

function Gatherer_GetMapScale(continent, zone, inCity, zoomLevel)
	if ((continent == nil) or (zoomLevel == nil)) then return 0,0; end
	if ((not GatherRegionData) or
	(not GatherRegionData[continent]) or
	(not GatherRegionData[continent].scales) or
	(not GatherRegionData[continent].scales[zoomLevel]) or
	(not GatherRegionData[continent].scales[zoomLevel].xscale) or
	(not GatherRegionData[continent].scales[zoomLevel].yscale)) then
		return 0,0;
	end

	local scaleX = GatherRegionData[continent].scales[zoomLevel].xscale;
	local scaleY = GatherRegionData[continent].scales[zoomLevel].yscale;
	if (inCity == true) then
		local cityScale = GatherRegionData.cityZoom[zoomLevel];
		scaleX = scaleX * cityScale;
		scaleY = scaleY * cityScale;
	end

	return scaleX, scaleY;
end

function Gatherer_MiniMapPos(deltaX, deltaY, scaleX, scaleY) -- works out the distance on the minimap
	local mapX = deltaX * scaleX;
	local mapY = deltaY * scaleY;
	local mapDist = 0;

	mapDist = Gatherer_Pythag(mapX, mapY);
	local mapWidth = Minimap:GetWidth()/2;
	local mapHeight = Minimap:GetHeight()/2;
	if (Squeenix or (pfUI and pfUI_config["disabled"]["minimap"] ~= "1") or 
		(simpleMinimap_Skins and simpleMinimap_Skins:GetShape() == "square")) then
		if (math.abs(mapX) > mapWidth) then
			mapX = (mapWidth)*((mapX<0 and -1) or 1);
		end
		if (math.abs(mapY) > mapHeight) then
			mapY = (mapHeight)*((mapY<0 and -1) or 1);
		end
	elseif (mapDist >= mapWidth) then
		-- Remap it to just inside the minimap, by:converting dx,dy to angle,distance
		-- then truncate distance to 58 and convert angle,58 to dx,dy
		local flipAxis = 1;
		if (mapX == 0) then mapX = 0.0000000001;
		elseif (mapX < 0) then flipAxis = -1;
		end
		local angle = math.atan(mapY / mapX);
		mapX = math.cos(angle) * mapWidth * flipAxis;
		mapY = math.sin(angle) * mapHeight * flipAxis;
	end
	return mapX, mapY, mapDist;
end

-- *************************************************************************
-- Recording related functions

-- Test: /script arg1="You perform Herb Gathering on Mageroyal."; Gatherer_ReadBuff("event");
function Gatherer_ReadBuff(event, fishItem, fishTooltip)
	local record = false;
	local gather, chatline;
	local gatherType, gatherIcon, gatherCanonicalName;
	local gatherEventType = 0;
	if (not arg1 and not event == "SPELLCAST_STOP") then
		Gatherer_Print("Gatherer: error, no arg recording aborted.");
		Gatherer_RecordFlag = 0;
		return;
	elseif (arg1) then
		chatline = string.gsub(arg1, GATHERER_NOTEXT, "");
	end

	if ( strfind(event, "CHAT_MSG_LOOT") ) then
	-- process loot received message for fishing node recording
		gather = Gatherer_FindFishType(fishItem, fishTooltip);
		if ( gather ) then
			gatherIcon = gather;
			gatherType = 0; -- considered as treasure
			gatherEventType = 2;
			record = true;
		end
	elseif( strfind(event, "CHAT_MSG") or strfind(event, "CHAT_MSG_SPELL_SELF_BUFF")) then
		if (string.find(chatline, HERB_GATHER_STRING)) then
			record = true;
			gather = string.lower(strsub(chatline, HERB_GATHER_LENGTH, HERB_GATHER_END))
			gatherType = 1;
			gatherIcon = gather;
		elseif (string.find(chatline, ORE_GATHER_STRING)) then
			record = true;
			gather = string.lower(strsub(chatline, ORE_GATHER_LENGTH, ORE_GATHER_END))
			gatherType = 2;
			gatherIcon = Gatherer_FindOreType(gather);
			if (not gatherIcon) then return; end;
		elseif (string.find(chatline, TREASURE_GATHER_STRING)) then
			record = true;
			gather = string.lower(strsub(chatline, TREASURE_GATHER_LENGTH, TREASURE_GATHER_END));

			gatherType = 0;
			gatherIcon, gatherCanonicalName = Gatherer_FindTreasureType(gather);
			if (not gatherIcon) then return; end;
			if ( gatherCanonicalName ) then gather = gatherCanonicalName; end;
		end

	elseif (strfind(event, "UI_ERROR_MESSAGE") or (strfind(event, "SPELLCAST_STOP") and Gatherer_RecordFlag == 1)) then
	-- process event to record, normally not possible gather (low/inexistant skill)
		gather = string.lower(Gatherer_ExtractItemFromTooltip());
		if ( Gatherer_currentNode and Gatherer_currentNode ~= gather and event == "SPELLCAST_STOP" and Gatherer_RecordFlag == 1) then
			gather = string.lower(Gatherer_currentNode);
		end;
		if (not arg1 and Gatherer_currentAction==nil and event == "SPELLCAST_STOP" and Gatherer_RecordFlag == 1) then
			chatline="";
		elseif (event ~= "UI_ERROR_MESSAGE" ) then
			chatline = Gatherer_currentAction;
		end
		-- process non gatherable item because of low/lack of skill
		if( gather and not gather ~= "" and (strfind(chatline, TRADE_HERBALISM) or strfind(chatline, OLD_TRADE_HERBALISM) or strfind(chatline, GATHER_HERBALISM)) ) then -- Herb
			Gatherer_Debug("record Herb");
			record = true;
			gatherType = 1;
			gatherIcon = Gatherer_FindHerbType(gather);
			gatherEventType = 1;
		elseif (gather and not gather ~= "" and strfind(chatline, TRADE_MINING)) then -- Ore
			Gatherer_Debug("record Ore");
			record = true;
			gatherType = 2;
			gatherIcon = Gatherer_FindOreType(gather);
			gatherEventType = 1;
		elseif(gather and not gather ~= "" and (strfind(chatline, TRADE_OPENING) or chatline=="")) then -- Treasure
			Gatherer_Debug("record Treasure");
			record = true
			gatherType = 0;
			gatherIcon, gatherCanonicalName = Gatherer_FindTreasureType(gather);
			if ( gatherCanonicalName ) then gather = gatherCanonicalName; end;
			gatherEventType = 1;
		end
		if (not gatherIcon) then
			Gatherer_Print("Gatherer: no icon identified, aborting record.");
			Gatherer_RecordFlag = 0;
			return;
		end
		if (event == "SPELLCAST_STOP" and Gatherer_RecordFlag == 1) then
			 gatherEventType = 0;
		end
		Gatherer_RecordFlag = 0;
	else
		Gatherer_RecordFlag = 0;
		return;
	end

	if (record == true) then
		Gatherer_Debug("record type: "..gatherEventType);
		Gatherer_AddGatherHere(gather, gatherType, gatherIcon, gatherEventType);
	end
end


local function insertionGatherIndex(gatherList, maxCheckDist, gatherX, gatherY)
	-- type: (GatherList, float, float, float) -> Tuple(int, bool, float, float)
	-- gatherList - list of the same gather
	-- maxCheckDist - two nodes closer than this distance are considered the same node
	-- returns: index to insert new gather, whether new node was found, corrected gathering coordinates
	local resultIndex = 0;
	local lastGather = 0;
	local firstNumerationGap = 0;
	local count = 0;
	local closest = 0;
	local newNodeFound = true;

	for gatherIndex, gatherData in gatherList do
		count = count + 1;
		if ( firstNumerationGap == 0 and gatherIndex ~= count ) then
			firstNumerationGap = count;
		end
		local dist, deltaX, deltaY = Gatherer_Distance(gatherX,gatherY, gatherData.x,gatherData.y);
		if ((dist < maxCheckDist) and ((closest == 0) or (closest > dist))) then -- same gather
			gatherX = (gatherX + gatherData.x) / 2;
			gatherY = (gatherY + gatherData.y) / 2;
			closest = dist;
			resultIndex = gatherIndex;
			newNodeFound = false;
		end
		if (gatherIndex > lastGather) then
			lastGather = gatherIndex;
		end
	end

	local thereIsNumerationGap = firstNumerationGap ~= 0;
	if (newNodeFound) then
		-- need to create a new one (at gatherIndex+1)
		resultIndex = lastGather+1;
		-- no duplicate but there's a hole, let's fill it
		if thereIsNumerationGap then
			resultIndex = firstNumerationGap;
		end
	end
	return resultIndex, newNodeFound, gatherX, gatherY
end


function Gatherer_AddGatherToBase(gather, gatherType, gatherC, gatherZ, gatherX, gatherY, iconIndex, gatherEventType, updateCount)
	-- type: (GatherName, Gatherer_EGatherType, Continent, Zone, float, float, IconIndex, EGatherEventType, bool) -> bool
	-- comparing to the latest official version (2.99.0.0284)
	-- this function was brought out into the global space and extended with the updateCount argument.
	-- The latter denotes whether the gather count should be incremented.
	-- Also it has started to return whether new node was found.
	if (not GatherItems[gatherC]) then GatherItems[gatherC] = { }; end
	if (not GatherItems[gatherC][gatherZ]) then GatherItems[gatherC][gatherZ] = { }; end
	if (not GatherItems[gatherC][gatherZ][gather]) then GatherItems[gatherC][gatherZ][gather] = { }; end

	local maxCheckDist = 0.5;
	if ( gatherEventType and gatherEventType == 2 ) then maxCheckDist = 1; end

	local insertionIndex, newNodeFound;
	insertionIndex, newNodeFound, gatherX, gatherY = insertionGatherIndex(
		GatherItems[gatherC][gatherZ][gather], maxCheckDist, gatherX, gatherY
	);

	local countIncrement = 1;
	-- when gathered without required skill or received via broacast
	if (not updateCount) or (gatherEventType and gatherEventType == 1) then
		countIncrement = 0
	end

	local newCount;
	if (GatherItems[gatherC][gatherZ][gather][insertionIndex] == nil) then
		GatherItems[gatherC][gatherZ][gather][insertionIndex] = { };
		newCount = countIncrement;
	else
		newCount = GatherItems[gatherC][gatherZ][gather][insertionIndex].count + countIncrement;
	end

	-- Round off those coordinates
	gatherX = math.floor(gatherX * 100)/100;
	gatherY = math.floor(gatherY * 100)/100;

	assert(type(iconIndex) == 'number')
	GatherItems[gatherC][gatherZ][gather][insertionIndex].x = gatherX;
	GatherItems[gatherC][gatherZ][gather][insertionIndex].y = gatherY;
	GatherItems[gatherC][gatherZ][gather][insertionIndex].gtype = gatherType;
	GatherItems[gatherC][gatherZ][gather][insertionIndex].count = newCount;
	GatherItems[gatherC][gatherZ][gather][insertionIndex].icon = iconIndex

	return newNodeFound;
end

-- this function can be used as an interface by other addons to record things
-- in Gatherer's database, though display is still based only on what is defined
-- in Gatherer items and icons tables.
-- Parameters:
--   gather (string): gather name (string printed in chat)
--   gatherType (number): gather type (0 treasure, 1 herbs, 2 ore)
--   gatherIcon (string): matching icon from Gatherer icon table (match gather name)
--   gatherEventType (number): 0 normal gather, 1 gather without required skill, 2 fishing node
function Gatherer_AddGatherHere(gather, gatherType, gatherIcon, gatherEventType)
	-- type: (GatherName, EGatherType, IconName, EGatherEventType) -> nil
	assert(type(gatherIcon) == 'string')
	if ( Gatherer_Settings.filterRecording[gatherType] and not Gatherer_Settings.interested[gatherType][gatherIcon] ) then
		return;
	end
	local px, py = Gatherer_PlayerPos(1);
	if (px == 0 and py == 0) then
		--Gatherer_Print("Gatherer: Cannot record item position as client is reporting position 0,0");
		return;
	end
	local gatherContinent, gatherZone = Gatherer_GetCurrentZone();
	if (gatherContinent == 0 or gatherZone == 0) then
		--Gatherer_Print("Gatherer: Cannot record item, invalid continent/zone.");
		return;
	end
	local gatherX = px * 100;
	local gatherY = py * 100;

	if (not GatherItems) then
		Gatherer_Print("Initializing empty gatherable database");
		GatherItems = { };
	end

	local iconIndex = Gatherer_GetDB_IconIndex(gatherIcon, gatherType);
	if Gatherer_Settings.p2p then
		-- Broadcast to guild
		Gatherer_BroadcastGather(gather, gatherType, gatherContinent, gatherZone, gatherX, gatherY, iconIndex, gatherEventType)
	end

	Gatherer_AddGatherToBase(gather, gatherType, gatherContinent, gatherZone, gatherX, gatherY, iconIndex, gatherEventType, true);
	Gatherer_OnUpdate(0,true);
	GatherMain_Draw();
end


-- *************************************************************************
-- Miscellaneous functions (clearing DB, dumping DB content)
function Gatherer_Clear()
	Gatherer_Print("Clearing your gather data");
	GatherItems = { };
	ClosestList = { };
	ClosestSearchGather = "";
	Gatherer_OnUpdate(0,true);
	GatherMain_Draw();
end

function Gatherer_Show()
	local gatherCont, gatherZone, gatherName, contData, zoneData, nameData, gatherPos, gatherItem;

	for gatherCont, contData in GatherItems do
		for gatherZone, zoneData in contData do
			for gatherName, nameData in zoneData do
				for gatherPos, gatherItem in nameData do
					Gatherer_Print(Gatherer_EGatherType[gatherItem.gtype].." "..gatherName.." was found in zone "..gatherCont..":"..gatherZone.." at "..gatherItem.x..","..gatherItem.y.."  ("..gatherItem.count.." times)");
				end
			end
		end
	end
end

-- *************************************************************************
-- String display related functions

function Gatherer_ChatPrint(str)
	-- usually DEFAULT_CHAT_FRAME is the default "General" chat window
	if ( DEFAULT_CHAT_FRAME ) then
		DEFAULT_CHAT_FRAME:AddMessage(str, 1.0, 0.5, 0.25);
	end
end

function Gatherer_Print(str, add)
	if ((Gather_LastPrinted) and (str == Gather_LastPrinted)) then
		return;
	end
	Gather_LastPrinted = str;
	if (add) then
		str = str..": "..add;
	end
	-- adds a message into the combat log
	if(ChatFrame2) then
		ChatFrame2:AddMessage(str, 1.0, 1.0, 0.0);
	end
end

function Gatherer_Debug(str, add)
	if not ( type(Gatherer_DebugFrame) == "table" and Gatherer_DebugFrame.AddMessage ) then
		return;
	end
	if (add) then
		str = str..": "..add;
	end
	Gatherer_DebugFrame:AddMessage("DEBUG: "..str, 1.0, 1.0, 0.0);
end

function Gatherer_TitleCase(str)
	if (GetLocale() == "frFR") then return str; end
	local function ucaseWord(first, rest)
		return string.upper(first)..string.lower(rest)
	end
	return string.gsub(str, "([a-zA-Z])([a-zA-Z']*)", ucaseWord);
end

function Gatherer_MakeName(frameID)
	local tmpClosest = ClosestGathers;
	local tmpItemIDtable = { }
	local tmpCount = 1;
	if ( GATHERER_LOADED ) then
		local gatherInfo = tmpClosest.items[frameID];

		tmpItemIDtable[tmpCount] = {};
		tmpItemIDtable[tmpCount].name  = Gatherer_GetMenuName(gatherInfo.name);
		tmpItemIDtable[tmpCount].count = gatherInfo.item.count;
		tmpItemIDtable[tmpCount].dist  = math.floor(gatherInfo.dist*10000)/10;

		tmpCount = tmpCount + 1;

		for id in tmpClosest.items do
			if (id ~= frameID and
					(abs(gatherInfo.item.x - tmpClosest.items[id].item.x) <= GATHERER_CLOSESTCHECK or
				 Gatherer_Round(gatherInfo.item.x * 10) == Gatherer_Round(tmpClosest.items[id].item.x * 10)) and
				(abs(gatherInfo.item.y - tmpClosest.items[id].item.y) <= GATHERER_CLOSESTCHECK or
				 Gatherer_Round(gatherInfo.item.y * 10) == Gatherer_Round(tmpClosest.items[id].item.y * 10))) then
				tmpItemIDtable[tmpCount] = {};
				tmpItemIDtable[tmpCount].name  = Gatherer_GetMenuName(tmpClosest.items[id].name);
				tmpItemIDtable[tmpCount].count = tmpClosest.items[id].item.count;
				tmpItemIDtable[tmpCount].dist  = math.floor(tmpClosest.items[id].dist*10000)/10;

				tmpCount = tmpCount + 1;
			end
		end
	else
		tmpItemIDtable[1].name = "Unknown";
		tmpItemIDtable[1].count = 0;
		tmpItemIDtable[1].dist = 0;
	end

	return tmpItemIDtable;
end

-- *************************************************************************
-- Position/Map related functions

function Gatherer_LoadZoneData()
	local continentData = {GetMapContinents()};
	for continentIndex, _ in continentData do
		local zoneData = {GetMapZones(continentIndex)};
		for zoneIndex, zoneName in zoneData do
			GatherZoneData[zoneName] = { [1] = continentIndex, [2] = zoneIndex };
		end
	end
end

function Gatherer_GetCurrentZone()
	-- type: () -> Tuple[Continent, Zone]
	local zoneData = GatherZoneData[GetRealZoneText()];
	if ( zoneData ) then
		return zoneData[1], zoneData[2];
	else
		return 0,0;
	end
end

Gatherer_LastZone = {};
function Gatherer_ChangeMap()
	local mapContinent = GetCurrentMapContinent();
	local mapZone = GetCurrentMapZone();
	local minderCurZone = false;

	if ((Gatherer_CloseMap ~= nil) and (Gatherer_CloseMap.continent == Gatherer_LastZone.continent) and (Gatherer_CloseMap.zone == Gatherer_LastZone.zone)) then
		minderCurZone = true;
	end

	local playerContinent, playerZone = Gatherer_GetCurrentZone();
	Gatherer_LastZone = { continent = playerContinent, zone = playerZone };
	if ((playerContinent == 0) or (playerZone == 0)) then return false; end
	if ((playerContinent == mapContinent) and (playerZone == mapZone)) then return true; end

	if ( GetCurrentMapContinent()>0 and playerZone and playerZone > 0 ) then
		if (not WorldMapFrame:IsVisible()) then
			SetMapZoom(playerContinent, playerZone);
		end
	end
	local lastTime = 0;
	if ((Gatherer_CloseMap ~= nil) and (Gatherer_CloseMap.time ~= nil)) then
		lastTime = Gatherer_CloseMap.time;
	end

	if (minderCurZone) then
		Gatherer_MapOpen = false;
		Gatherer_CloseMap = { continent = playerContinent, zone = playerZone, time = lastTime };
	end

	return true;
end

function Gatherer_PlayerPos(forced)
	local currentZoneName = GetRealZoneText();
	if (currentZoneName ~= Gather_LastZone) then
		forced = true;
	end
	Gather_LastZone = currentZoneName;
	if (forced) then Gatherer_ChangeMap(); end

	local px, py = GetPlayerMapPosition("player");
	if ((px == 0) and (py == 0)) then
		if (not forced) then
			if (Gatherer_ChangeMap()) then
				px, py = GetPlayerMapPosition("player");
			else
				return 0,0;
			end
		end
	end
	return px, py;
end

-- *************************************************************************
-- Special Item handling functions: Database manipulation from world map.
-- following 2 functions have to take scope into account.
function Gatherer_DeleteItem()
	local gathIdx = 0;
	local zoneIdx = 0;
	local cntIdx = 0;

	if ( GatherMainMapItem.scope == "Node" ) then
		GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName][GatherMainMapItem.localIndex] = nil;
	elseif ( GatherMainMapItem.scope == "Zone" ) then
		GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName] = nil;
	elseif ( GatherMainMapItem.scope == "Continent" ) then
		local search_index;
		for search_index in GatherItems[GatherMainMapItem.continent] do
			if ( GatherItems[GatherMainMapItem.continent][search_index][GatherMainMapItem.gatherName] ) then
				GatherItems[GatherMainMapItem.continent][search_index][GatherMainMapItem.gatherName] = nil;
			end
		end
	elseif ( GatherMainMapItem.scope == "World" ) then
		local search_index;
		-- continent 1
		if ( GatherItems[1] ) then
			for search_index in GatherItems[1] do
				if ( GatherItems[1][search_index][GatherMainMapItem.gatherName] ) then
					GatherItems[1][search_index][GatherMainMapItem.gatherName] = nil;
				end
			end
		end
		-- continent 2
		if ( GatherItems[2] ) then
			for search_index in GatherItems[2] do
				if ( GatherItems[2][search_index][GatherMainMapItem.gatherName] ) then
					GatherItems[2][search_index][GatherMainMapItem.gatherName] = nil;
				end
			end
		end
	end
	GatherMain_Draw();

	-- clean up for empty zones/continent
	for locIdx in GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName] do
		gathIdx = gathIdx + 1;
	end

	if ( gathIdx == 0 ) then
		GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName] = nil;
		for locIdx in GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex] do
			zoneIdx = zoneIdx + 1;
		end

		if ( zoneIdx == 0 ) then
			GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex] = nil;

			--DEFAULT_CHAT_FRAME:AddMessage("Removed zone no data left")
			for locIdx in GatherItems[GatherMainMapItem.continent] do
				cntIdx = cntIdx + 1;
			end

			if ( cntIdx == 0 ) then
				--DEFAULT_CHAT_FRAME:AddMessage("Removed continents no data left")
				GatherItems[GatherMainMapItem.continent] = nil;
			end
		end
	end
	GatherMain_Draw();
end

-- Modify Gather Name and/or icon
function Gatherer_ModifyItem()
	local newIcon, newGatherName, newType;
	local mod_continent = GatherMainMapItem.continent;
	local mod_zone = GatherMainMapItem.zoneIndex;
	local mod_name = GatherMainMapItem.gatherName;

	-- setting new names (NB: icons on world map are deduced from gather name)
	if ( GatherMainMapItem.newIcon and GatherMainMapItem.newIcon ~= GatherMainMapItem.gatherIcon ) then
		newIcon = GatherMainMapItem.newIcon;
	else
		newIcon = GatherMainMapItem.gatherIcon;
	end

	if ( GatherMainMapItem.newType and GatherMainMapItem.newType ~= GatherMainMapItem.gatherType ) then
		newType = GatherMainMapItem.newType;
	else
		newType = GatherMainMapItem.gatherType;
	end

	if ( GatherMainMapItem.newGatherName ) then
		newGatherName = GatherMainMapItem.newGatherName;
	else
		newGatherName = mod_name;
	end
	if ( GatherMainMapItem.scope == "Node" ) then
		-- remove old entries if gather name different
		if ( GatherMainMapItem.newGatherName and mod_name ~= GatherMainMapItem.newGatherName ) then
			if ( not GatherItems[mod_continent][mod_zone][newGatherName] ) then
				GatherItems[mod_continent][mod_zone][newGatherName] = {};
				GatherItems[mod_continent][mod_zone][newGatherName][GatherMainMapItem.localIndex] = GatherItems[mod_continent][mod_zone][mod_name][GatherMainMapItem.localIndex];
				GatherItems[mod_continent][mod_zone][mod_name][GatherMainMapItem.localIndex] = nil;
			end
		end

		-- replace icons if different
		GatherItems[mod_continent][mod_zone][newGatherName][GatherMainMapItem.localIndex].icon = newIcon;
		GatherItems[mod_continent][mod_zone][newGatherName][GatherMainMapItem.localIndex].gtype = newType;

	elseif ( GatherMainMapItem.scope == "Zone" ) then
		-- remove old entries if gather name different
		if ( GatherMainMapItem.newGatherName and mod_name ~= GatherMainMapItem.newGatherName ) then
			GatherItems[mod_continent][mod_zone][newGatherName] = {};
			GatherItems[mod_continent][mod_zone][newGatherName] = GatherItems[mod_continent][mod_zone][mod_name];
			GatherItems[mod_continent][mod_zone][mod_name] = nil;
		end

		-- replace icons if different
		if ( newIcon ~= GatherMainMapItem.gatherIcon ) then
			local index;
			for index in GatherItems[mod_continent][mod_zone][newGatherName] do
				GatherItems[mod_continent][mod_zone][newGatherName][index].icon = newIcon;
			end
		end

		-- replace type if different
		if ( newType ~= GatherMainMapItem.gatherType ) then
			local index;
			for index in GatherItems[mod_continent][mod_zone][newGatherName] do
				GatherItems[mod_continent][mod_zone][newGatherName][index].gtype = newType;
			end
		end

	elseif ( GatherMainMapItem.scope == "Continent" ) then
		local search_index;
		for search_index in GatherItems[mod_continent] do
			if ( GatherItems[mod_continent][search_index][mod_name] ) then
				-- remove old entries if gather name different
				if ( GatherMainMapItem.newGatherName and mod_name ~= GatherMainMapItem.newGatherName ) then
					GatherItems[mod_continent][search_index][newGatherName] = {};
					GatherItems[mod_continent][search_index][newGatherName] = GatherItems[mod_continent][search_index][mod_name];
					GatherItems[mod_continent][search_index][mod_name] = nil;
				end

				-- replace icons if different
				if ( newIcon ~= GatherMainMapItem.gatherIcon ) then
					local index;
					for index in GatherItems[mod_continent][search_index][newGatherName] do
						GatherItems[mod_continent][search_index][newGatherName][index].icon = newIcon;
					end
				end

				-- replace type if different
				if ( newType ~= GatherMainMapItem.gatherType ) then
					local index;
					for index in GatherItems[mod_continent][search_index][newGatherName] do
						GatherItems[mod_continent][search_index][newGatherName][index].gtype = newType;
					end
				end
			end
		end

	elseif ( GatherMainMapItem.scope == "World" ) then
		local search_index;
		-- continent 1
		if ( GatherItems[1] ) then
			for search_index in GatherItems[1] do
				if ( GatherItems[1][search_index][mod_name] ) then
					-- remove old entries if gather name different
					if ( GatherMainMapItem.newGatherName and mod_name ~= GatherMainMapItem.newGatherName ) then
						GatherItems[1][search_index][newGatherName] = {};
						GatherItems[1][search_index][newGatherName] = GatherItems[1][search_index][mod_name];
						GatherItems[1][search_index][mod_name] = nil;
					end

					-- replace icons if different
					if ( newIcon ~= GatherMainMapItem.gatherIcon ) then
						local index;
						for index in GatherItems[1][search_index][newGatherName] do
							GatherItems[1][search_index][newGatherName][index].icon = newIcon;
						end
					end

					-- replace type if different
					if ( newType ~= GatherMainMapItem.gatherType ) then
						local index;
						for index in GatherItems[1][search_index][newGatherName] do
							GatherItems[1][search_index][newGatherName][index].gtype = newType;
						end
					end
				end
			end
		end
		-- continent 2
		if ( GatherItems[2] ) then
			for search_index in GatherItems[2] do
				if ( GatherItems[2][search_index][mod_name] ) then
					-- remove old entries if gather name different
					if ( GatherMainMapItem.newGatherName and mod_name ~= GatherMainMapItem.newGatherName ) then
						GatherItems[2][search_index][newGatherName] = {};
						GatherItems[2][search_index][newGatherName] = GatherItems[2][search_index][mod_name];
						GatherItems[2][search_index][mod_name] = nil;
					end

					-- replace icons if different
					if ( newIcon ~= GatherMainMapItem.gatherIcon ) then
						local index;
						for index in GatherItems[2][search_index][newGatherName] do
							GatherItems[2][search_index][newGatherName][index].icon = newIcon;
						end
					end

					-- replace type if different
					if ( newType ~= GatherMainMapItem.gatherType ) then
						local index;
						for index in GatherItems[2][search_index][newGatherName] do
							GatherItems[2][search_index][newGatherName][index].gtype = newType;
						end
					end
				end
			end
		end
	end

	GatherMain_Draw();
	GatherMainMapItem.newIcon = nil;
	GatherMainMapItem.newGatherName = nil;
end

-- dropdown menus
function Gatherer_WMDropDownGType_Initialize()
	local index;
	local info = {};
	local iconGtype = GatherMainMapItem.gatherType;

	if ( GatherMainMapItem.newType ) then
		iconGtype = GatherMainMapItem.newType;
	end

	for index, value in Gatherer_EGatherType do
		if ( type(value) == "number" and value ~= 3 )
		then
			info.text = index;
			info.value = value;
			if ( value == iconGtype ) then
				info.checked = 1;
			else
				info.checked = nil;
			end
			info.func = Gatherer_WMDropDownGType_OnClick;
			UIDropDownMenu_AddButton(info);
		end
	end

	if ( type(GatherMainMapItem.gatherType) == "number" )
	then
		UIDropDownMenu_SetText(Gatherer_EGatherType[GatherMainMapItem.gatherType], Gatherer_WMDropDownGType);
	else
		UIDropDownMenu_SetText(GatherMainMapItem.gatherType, Gatherer_WMDropDownGType);
	end
end

function Gatherer_WMDropDownGType_OnClick()
	UIDropDownMenu_SetSelectedID(Gatherer_WMDropDownGType, this:GetID());
	GatherMainMapItem.newType = Gatherer_EGatherType[UIDropDownMenu_GetText(Gatherer_WMDropDownGType)];

	UIDropDownMenu_ClearAll(Gatherer_WMDropDownIcons);
	UIDropDownMenu_Initialize(Gatherer_WMDropDownIcons, Gatherer_WMDropDownIcons_Initialize);
end

function Gatherer_WMDropDownIcons_Initialize()
	local index;
	local info = {};
	local iconGtype = "Default";

	if ( GatherMainMapItem.newType ) then
		iconGtype = GatherMainMapItem.newType;
	else
		iconGtype = GatherMainMapItem.gatherType;
	end

	for index, value in Gather_DB_IconIndex[iconGtype] do
		info.text = index;
		info.value = value;
		if ( value == GatherMainMapItem.gatherIcon and not GatherMainMapItem.newType) then
			info.checked = 1;
		else
			info.checked = nil;
		end
		info.func = Gatherer_WMDropDownIcons_OnClick;
		UIDropDownMenu_AddButton(info);
	end

	UIDropDownMenu_SetText(Gatherer_GetDB_IconIndex(GatherMainMapItem.gatherIcon, iconGtype), Gatherer_WMDropDownIcons);
end

function Gatherer_WMDropDownIcons_OnClick()
	UIDropDownMenu_SetSelectedID(Gatherer_WMDropDownIcons, this:GetID());
	GatherMainMapItem.newIcon = Gatherer_GetDB_IconIndex(UIDropDownMenu_GetText(Gatherer_WMDropDownIcons), GatherMainMapItem.gatherType);
end

function Gatherer_WMDropDownScope_Initialize()
	local index;
	local scope_list = { "Node", "Zone", "Continent", "World" };
	local info = {};

	GatherMainMapItem.scope = "Node";
	for index in scope_list do
		info.text = scope_list[index];
		info.value = index;
		if ( scope_list[index] == "Node" ) then
			info.checked = 1;
		else
			info.checked = nil;
		end
		info.func = Gatherer_WMDropDownScope_OnClick;
		UIDropDownMenu_AddButton(info);
	end
	UIDropDownMenu_SetSelectedID(Gatherer_WMDropDownScope, 1);
end

function Gatherer_WMDropDownScope_OnClick()
	UIDropDownMenu_SetSelectedID(Gatherer_WMDropDownScope, this:GetID());
	GatherMainMapItem.scope = UIDropDownMenu_GetText(Gatherer_WMDropDownScope);
end

-- Toggle item to bugged state
-- this one always ignore scope, only done on origin item.
function Gatherer_ToggleBuggedItem()
Gatherer_ChatPrint("Toggling node to bugged state");
	local gtype = GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName][GatherMainMapItem.localIndex].gtype;
	local icon = GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName][GatherMainMapItem.localIndex].icon;

	if ( GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName][GatherMainMapItem.localIndex].icon ~= "default" ) then
		GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName][GatherMainMapItem.localIndex].oldicon = icon;
		GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName][GatherMainMapItem.localIndex].oldgtype = gtype;

		GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName][GatherMainMapItem.localIndex].icon = "default";
		GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName][GatherMainMapItem.localIndex].gtype = "Default";
	else
		GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName][GatherMainMapItem.localIndex].icon = GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName][GatherMainMapItem.localIndex].oldicon;
		GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName][GatherMainMapItem.localIndex].gtype = GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName][GatherMainMapItem.localIndex].oldgtype;

		GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName][GatherMainMapItem.localIndex].oldicon = nil;
		GatherItems[GatherMainMapItem.continent][GatherMainMapItem.zoneIndex][GatherMainMapItem.gatherName][GatherMainMapItem.localIndex].oldgtype = nil;
	end

	GatherMain_Draw();
end

