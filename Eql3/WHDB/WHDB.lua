-----------------------------------------------------------
-- Wowhead DB By: UniRing
-----------------------------------------------------------

local L = AceLibrary("AceLocale-2.2"):new("WHDBTextLocal")

WHDB_MAP_NOTES = {};
WHDB_QuestZoneInfo = {};
WHDB_Player = "";

function WHDB_Init()
	this:RegisterEvent("VARIABLES_LOADED");
	SlashCmdList["WHDB"] = WHDB_Slash;
	SLASH_WHDB1 = "/whdb";
end

function WHDB_Event(event)
	if (event == "VARIABLES_LOADED") then
		if (Cartographer_Notes ~= nil) then
			WHDBDB = {}; WHDBDBH = {};
			Cartographer_Notes:RegisterNotesDatabase("WHDB",WHDBDB,WHDBDBH);
			--WHDB_Print(L["Cartographer Database Registered."]);
		end
		--Free the oposite faction database. -- not working in 1.12.1 UnitFactionGroup not init yet
		---WHDB_Print(UnitFactionGroup("player"));
		--if (UnitFactionGroup("player") == "Alliance") then
		--	qData["Horde"] = nil;
		--	WHDB_Print("Horde data cleared");
		--else
		--	qData["Alliance"] = nil;
		--	WHDB_Print("Alliance data cleared");
		--end
		--And clean it.
		WHDB_Player = UnitName("player");
		if (WHDB_Settings == nil) then
			WHDB_Settings = {};
			WHDB_Settings[WHDB_Player] = {};
			WHDB_Settings[WHDB_Player]["UseColors"] = 1;
		else
			if (WHDB_Settings[WHDB_Player] == nil) then
				WHDB_Settings[WHDB_Player] = {};
				WHDB_Settings[WHDB_Player]["UseColors"] = 1;
			end
		end
		WHDB_ShowUsingInfo();
		WHDB_Print(L["WHDB Loaded."]);
	end
end

function WHDB_ShowUsingInfo()
	if (EQL3_QuestLogFrame ~= nil) then
	--	WHDB_Print(L["Using EQL3."]);
	elseif (QuestGuru_QuestLogFrame ~= nil) then
	--	WHDB_Print(L["Using QuestGuru."]);
	else
	--	WHDB_Print(L["Using default quest log."]);
	end
	if (MetaMap_DeleteNotes ~= nil) then
		--WHDB_Print(L["MetaMap plotter enabled."]);
	end
	if (Cartographer_Notes ~= nil) then
	--	WHDB_Print(L["Cartographer plotter enabled."]);
	end
	if (MapNotes_Data_Notes ~= nil) then
	--	WHDB_Print(L["MapNotes plotter enabled."]);
	end
end

function WHDB_Slash(input)
	local params = {};
	--for v in string.gmatch(input, "[^ ]+") do
	for v in string.gmatch(input, "%a+") do
		tinsert(params, v);
	end
	if (params[1] == "help" or params[1] == "") then
		WHDB_Print(L["Commands available:"]);
		WHDB_Print("-------------------------------------------------------");
		WHDB_Print(L["/whdb help | This help."]);
		WHDB_Print(L["/whdb com <quest name> | Get quest comments by quest name."]);
		WHDB_Print(L["/whdb item <item name> | Get item drop info and show map if possible."]);
		WHDB_Print(L["/whdb mob <monster name> | Get monser location and show map if possible."]);
		WHDB_Print(L["/whdb clean | Clean map notes."]);
		WHDB_Print(L["/whdb colors <0 or 1>| Enable/Disable coloring of text in the quest log."]);
		WHDB_Print(L["/whdb copy <character>| Copy characters config to current one."]);
		WHDB_Print("");
		WHDB_Print(L["Note: All parameters are case sensitive!"]);
	end
	if (params[1] == "com") then
		local questName = strtrim(string.sub(input, 5));
		if (string.sub(questName,1,1) == "[") then
			if (string.sub(questName,3,3) == "]") then
				questName = strtrim(string.sub(questName,4));
			else
				questName = strtrim(string.sub(questName,5));
			end
		end
		if (questName ~= "") then
			WHDB_Print(L["Quest Comments"]);
			WHDB_Print("---------------------------------------------------");
			local QuestComments = WHDB_GetComments(questName);
			for v in string.gmatch(QuestComments, "[^\n]+") do
				WHDB_Print(v);
			end
		end
	end
	if (params[1] == "item") then
		local itemName = strtrim(string.sub(input, 6));
		if (string.sub(itemName,1,1) == "|") then
			_, _, _, itemName = string.find(itemName, "^|c%x+|H(.+)|h%[(.+)%]")
		end
		WHDB_Print(L["Drops for: "]..itemName);
		WHDB_Print("---------------------------------------------------");
		if (itemName ~= "") then
			if (itemData[itemName] ~= nil) then
				local showmax = 5;
				for monsterName, monsterDrop in pairs(itemData[itemName]) do
					zoneName = zoneData[npcData[monsterName]["zone"]];
					if (zoneName == nil) then zoneName = npcData[monsterName]["zone"]; end
					local dropRate = monsterDrop;
					if (dropRate == nil) then dropRate = ""; else dropRate = dropRate .. "%"; end
					WHDB_Print(L["Dropped by: "] .. monsterName);
					WHDB_Print_Indent(L["Drop Rate: "] .. dropRate);
					WHDB_Print_Indent(L["Zone: "] .. zoneName);
					WHDB_Print_Indent(L["Coords: "] .. npcData[monsterName]["coords"][1]);
					-- Map plotting
					if (MetaMapNotes_AddNewNote ~= nil or MapNotes_Data_Notes ~= nil or Cartographer_Notes ~= nil) then
						local showMap = false;
						WHDB_MAP_NOTES = {};
						for cid, cdata in pairs(npcData[monsterName]["coords"]) do
							local f, t, coordx, coordy = strfind(npcData[monsterName]["coords"][cid], "(.*),(.*)");
							table.insert(WHDB_MAP_NOTES,{zoneName, coordx, coordy, itemName, monsterName .. L["\nDrop: "] .. dropRate, 0});
							if (MetaMapNotes_AddNewNote ~= nil or MapNotes_Data_Notes ~= nil or Cartographer_Notes ~= nil) then 
								showMap = true;
							end
						end
						if (showMap) then
							WHDB_ShowMap();
						end
					end					
					showmax = showmax - 1;
					if (showmax == 0) then
						WHDB_Print(L["Showing only the 5 first results."]);
						break;
					end
				end
			end
		end
	end
	if (params[1] == "mob") then
		local monsterName = strtrim(string.sub(input, 5));
		if (monsterName ~= "") then
			WHDB_Print(L["Location for: "]..monsterName);
			if (monsterName ~= nil) then
				if (npcData[monsterName] ~= nil) then
					zoneName = zoneData[npcData[monsterName]["zone"]];
					if (zoneName == nil) then zoneName = npcData[monsterName]["zone"]; end
					WHDB_Print_Indent(L["Zone: "] .. zoneName);
					WHDB_Print_Indent(L["Coords: "] .. npcData[monsterName]["coords"][1]);
					-- Map plotting
					if (MetaMapNotes_AddNewNote ~= nil or MapNotes_Data_Notes ~= nil or Cartographer_Notes ~= nil) then
						local showMap = false;
						WHDB_MAP_NOTES = {};
						for cid, cdata in pairs(npcData[monsterName]["coords"]) do
							local f, t, coordx, coordy = strfind(npcData[monsterName]["coords"][cid], "(.*),(.*)");
							table.insert(WHDB_MAP_NOTES,{zoneName, coordx, coordy, monsterName, coordx..","..coordy, 0});
							if (MetaMapNotes_AddNewNote ~= nil or MapNotes_Data_Notes ~= nil or Cartographer_Notes ~= nil) then							
								showMap = true;
							end
						end
						if (showMap) then
							WHDB_ShowMap();
						end
					end
				end
			end			
		end
	end
	if (params[1] == "clean") then
		WHDB_CleanMap();
	end
	if (params[1] == "colors") then
		if (params[2] == "1") then
			WHDB_Settings[WHDB_Player]["UseColors"] = 1;
			WHDB_Print(L["Text colors enabled."]);
		end
		if (params[2] == "0") then
			WHDB_Settings[WHDB_Player]["UseColors"] = 0;
			WHDB_Print(L["Text colors disabled."]);
		end
	end
	if (params[1] == "copy") then
		if (WHDB_Settings[params[2]] ~= nil) then
			for k,v in pairs(WHDB_Settings[params[2]]) do
				WHDB_Settings[WHDB_Player][k] = v;
			end
			WHDB_Print(L["Settings loaded."]);
		else
			WHDB_Print(L["There are no settings for this character."]);
		end
	end
end

function WHDB_Print( string )
	DEFAULT_CHAT_FRAME:AddMessage("|cFF006699[BSK]|cFF990099 WHDB:|r " .. string, 0.95, 0.95, 0.5);
end

function WHDB_Print_Indent( string )
	DEFAULT_CHAT_FRAME:AddMessage("                       " .. string, 0.95, 0.95, 0.5);
end

function QuestLog_UpdateQuestDetails(doNotScroll)
	if (EQL3_QuestLogFrame ~= nil) then
		WHDB_QuestLog_UpdateQuestDetails("EQL3_", doNotScroll);
	elseif (QuestGuru_QuestLogFrame ~= nil) then
		WHDB_QuestLog_UpdateQuestDetails("QuestGuru_", doNotScroll);
	else
		WHDB_QuestLog_UpdateQuestDetails("", doNotScroll);
	end
end

function WHDB_QuestLog_UpdateQuestDetails(prefix, doNotScroll)
	if (getglobal(prefix.."QuestLogFrame"):IsVisible()) then
	WHDB_MAP_NOTES = {};
	local questID = GetQuestLogSelection();
	local questTitle = GetQuestLogTitle(questID);
	if ( not questTitle ) then
		questTitle = "";
	end
	if ( IsCurrentQuestFailed() ) then
		questTitle = questTitle.." - ("..TEXT(FAILED)..")";
	end
	getglobal(prefix.."QuestLogQuestTitle"):SetText(questTitle);

	local questDescription;
	local questObjectives;
	questDescription, questObjectives = GetQuestLogQuestText();
	getglobal(prefix.."QuestLogObjectivesText"):SetText(questObjectives);
	
	local questTimer = GetQuestLogTimeLeft();
	if ( questTimer ) then
		getglobal(prefix.."QuestLogFrame").hasTimer = 1;
		getglobal(prefix.."QuestLogFrame").timePassed = 0;
		getglobal(prefix.."QuestLogTimerText"):Show();
		getglobal(prefix.."QuestLogTimerText"):SetText(TEXT(TIME_REMAINING).." "..SecondsToTime(questTimer));
		getglobal(prefix.."QuestLogObjective1"):SetPoint("TOPLEFT", prefix.."QuestLogTimerText", "BOTTOMLEFT", 0, -10);
	else
		getglobal(prefix.."QuestLogFrame").hasTimer = nil;
		getglobal(prefix.."QuestLogTimerText"):Hide();
		getglobal(prefix.."QuestLogObjective1"):SetPoint("TOPLEFT", prefix.."QuestLogObjectivesText", "BOTTOMLEFT", 0, -10);
	end
	
	-- Show Quest Watch if track quest is checked
	local numObjectives = GetNumQuestLeaderBoards();
	
	local monsterName, zoneName, noteAdded, showMap, noteID;
	for i=1, numObjectives, 1 do
		local string = getglobal(prefix.."QuestLogObjective"..i);
		local text;
		local type;
		local finished;
		text, type, finished = GetQuestLogLeaderBoard(i);
		if ( not text or strlen(text) == 0 ) then
			text = type;
		end
		local i, j, itemName, numItems, numNeeded = strfind(text, "(.*):%s*([%d]+)%s*/%s*([%d]+)");
		
		if ( finished ) then
			string:SetTextColor(0.2, 0.2, 0.2);
			text = text.." ("..TEXT(COMPLETE)..")";
		else
			string:SetTextColor(0, 0, 0);
		end

		if (type == "monster") then
			local i, j, monsterName = strfind(itemName, L["(.*) slain"]);
			if (monsterName ~= nil) then
				if (npcData[monsterName] ~= nil) then
					if (npcData[monsterName]["zone"] ~= nil) then
						zoneName = zoneData[npcData[monsterName]["zone"]];
					else
						zoneName = WHDB_QuestZoneInfo[questTitle];
					end
					Level = npcData[monsterName]["level"];
					HP = npcData[monsterName]["hp"];
					if (Level == nil) then Level = L["Unknown"]; end
					if (HP == nil) then HP = L["Unknown"]; end
					if (zoneName == nil) then zoneName = npcData[monsterName]["zone"]; end
					text = text.."\n";
					if (WHDB_Settings[WHDB_Player]["UseColors"] == 1) then
--						text = text.."|cFF442200    " .. L["Zone: "] .. zoneName .. "\n|r";
--						text = text.."|cFF002244    " .. L["Level: "] .. Level .. "\n|r";
--						text = text.."|cFF002244    " .. L["Health: "] .. HP .. "\n|r";
--						text = text.."|cFF224400    " .. L["Coords: "] .. npcData[monsterName]["coords"][1] .. "\n|r";
					else
--						text = text.."    " .. L["Zone: "] .. zoneName .. "\n";
--						text = text.."    " .. L["Level: "] .. Level .. "\n";
--						text = text.."    " .. L["Health: "] .. HP .. "\n";
--						text = text.."    " .. L["Coords: "] .. npcData[monsterName]["coords"][1] .. "\n";
					end
					if (MetaMapNotes_AddNewNote ~= nil or MapNotes_Data_Notes ~= nil or Cartographer_Notes ~= nil) then
						for cid, cdata in pairs(npcData[monsterName]["coords"]) do
							local f, t, coordx, coordy = strfind(npcData[monsterName]["coords"][cid], "(.*),(.*)");
							table.insert(WHDB_MAP_NOTES,{zoneName, coordx, coordy, questTitle, monsterName, 0});
							if (MetaMapNotes_AddNewNote ~= nil or MapNotes_Data_Notes ~= nil or Cartographer_Notes ~= nil) then							
								showMap = true;
							end
						end
					end
				end
			end
		end
		if (type == "item") then
			if (itemData[itemName] ~= nil) then
				for monsterName, monsterDrop in pairs(itemData[itemName]) do
					if (npcData[monsterName] ~= nil) then
						if (npcData[monsterName]["zone"] ~= nil) then
							zoneName = zoneData[npcData[monsterName]["zone"]];
						else
							zoneName = WHDB_QuestZoneInfo[questTitle];
						end
						Level = npcData[monsterName]["level"];
						HP = npcData[monsterName]["hp"];
						if (Level == nil) then Level = L["Unknown"]; end
						if (HP == nil) then HP = L["Unknown"]; end
						if (zoneName == nil) then zoneName = npcData[monsterName]["zone"]; end
						local dropRate = monsterDrop;
						if (dropRate == nil) then dropRate = ""; else dropRate = dropRate .. "%"; end
--						text = text.."\n";

--							text = text.."    " .. L["Dropped by: "] .. monsterName .. "\n";
--							text = text.."        " .. L["Drop Rate: "] .. dropRate .. "\n";
--							text = text.."        " .. L["Zone: "] .. zoneName .. "\n";
--							text = text.."        " .. L["Level: "] .. Level .. "\n";
--							text = text.."        " .. L["Health: "] .. HP .. "\n";
--							text = text.."        " .. L["Coords: "] .. npcData[monsterName]["coords"][1] .. "\n";
						
						if (MetaMapNotes_AddNewNote ~= nil or MapNotes_Data_Notes ~= nil or Cartographer_Notes ~= nil) then
							for cid, cdata in pairs(npcData[monsterName]["coords"]) do
								local f, t, coordx, coordy = strfind(npcData[monsterName]["coords"][cid], "(.*),(.*)");
								table.insert(WHDB_MAP_NOTES,{zoneName, coordx, coordy, questTitle, monsterName .. L["\nDrop: "] .. dropRate, 0});
								if (MetaMapNotes_AddNewNote ~= nil or MapNotes_Data_Notes ~= nil or Cartographer_Notes ~= nil) then 
									showMap = true;
								end
							end
						end
					end
				end
			end
		end
		string:SetText(text);
		string:Show();
		QuestFrame_SetAsLastShown(string);
	end

	for i=numObjectives + 1, MAX_OBJECTIVES, 1 do
		getglobal(prefix.."QuestLogObjective"..i):Hide();
	end

	-- If there's money required then anchor and display it
	if ( GetQuestLogRequiredMoney() > 0 ) then
		if ( numObjectives > 0 ) then
			getglobal(prefix.."QuestLogRequiredMoneyText"):SetPoint("TOPLEFT", "QuestLogObjective"..numObjectives, "BOTTOMLEFT", 0, -4);
		else
			getglobal(prefix.."QuestLogRequiredMoneyText"):SetPoint("TOPLEFT", "QuestLogObjectivesText", "BOTTOMLEFT", 0, -10);
		end
		
		MoneyFrame_Update(prefix.."QuestLogRequiredMoneyFrame", GetQuestLogRequiredMoney());
		
		if ( GetQuestLogRequiredMoney() > GetMoney() ) then
			-- Not enough money
			getglobal(prefix.."QuestLogRequiredMoneyText"):SetTextColor(0, 0, 0);
			SetMoneyFrameColor(prefix.."QuestLogRequiredMoneyFrame", 1.0, 0.1, 0.1);
		else
			getglobal(prefix.."QuestLogRequiredMoneyText"):SetTextColor(0.2, 0.2, 0.2);
			SetMoneyFrameColor(prefix.."QuestLogRequiredMoneyFrame", 1.0, 1.0, 1.0);
		end
		getglobal(prefix.."QuestLogRequiredMoneyText"):Show();
		getglobal(prefix.."QuestLogRequiredMoneyFrame"):Show();
	else
		getglobal(prefix.."QuestLogRequiredMoneyText"):Hide();
		getglobal(prefix.."QuestLogRequiredMoneyFrame"):Hide();
	end

	if ( GetQuestLogRequiredMoney() > 0 ) then
		getglobal(prefix.."QuestLogDescriptionTitle"):SetPoint("TOPLEFT", prefix.."QuestLogRequiredMoneyText", "BOTTOMLEFT", 0, -10);
	elseif ( numObjectives > 0 ) then
		getglobal(prefix.."QuestLogDescriptionTitle"):SetPoint("TOPLEFT", prefix.."QuestLogObjective"..numObjectives, "BOTTOMLEFT", 0, -10);
	else
		if ( questTimer ) then
			getglobal(prefix.."QuestLogDescriptionTitle"):SetPoint("TOPLEFT", prefix.."QuestLogTimerText", "BOTTOMLEFT", 0, -10);
		else
			getglobal(prefix.."QuestLogDescriptionTitle"):SetPoint("TOPLEFT", prefix.."QuestLogObjectivesText", "BOTTOMLEFT", 0, -10);
		end
	end
	if ( questDescription ) then
		getglobal(prefix.."QuestLogQuestDescription"):SetText(questDescription);
		QuestFrame_SetAsLastShown(getglobal(prefix.."QuestLogQuestDescription"));
	end	
	
	local questComments = WHDB_GetComments(questTitle);

	if (getglobal(prefix.."QuestLogMapButtonsTitle") == nil) then
		getglobal(prefix.."QuestLogDetailScrollChildFrame"):CreateFontString(prefix.."QuestLogMapButtonsTitle","","QuestTitleFont");
		getglobal(prefix.."QuestLogDetailScrollChildFrame"):CreateFontString(prefix.."QuestLogCommentsTitle","","QuestTitleFont");
		getglobal(prefix.."QuestLogDetailScrollChildFrame"):CreateFontString(prefix.."QuestLogCommentsDescription","","QuestFont");
	end

	-- Copy description font color. (for skinner like addons)
	local r, g, b, a = getglobal(prefix.."QuestLogQuestDescription"):GetTextColor();
	
	getglobal(prefix.."QuestLogMapButtonsTitle"):SetHeight(0);
	getglobal(prefix.."QuestLogMapButtonsTitle"):SetWidth(285);
	getglobal(prefix.."QuestLogMapButtonsTitle"):SetPoint("TOPLEFT", prefix.."QuestLogQuestDescription", "BOTTOMLEFT", 0, -15);
	getglobal(prefix.."QuestLogMapButtonsTitle"):SetJustifyH("LEFT");
	getglobal(prefix.."QuestLogMapButtonsTitle"):SetText(L["Map Plots"]);
	getglobal(prefix.."QuestLogMapButtonsTitle"):SetTextColor(r, g, b, a);
	
	getglobal(prefix.."QuestLogCommentsTitle"):SetHeight(0);
	getglobal(prefix.."QuestLogCommentsTitle"):SetWidth(285);
	getglobal(prefix.."QuestLogCommentsTitle"):SetPoint("TOPLEFT", prefix.."QuestLogMapButtonsTitle", "BOTTOMLEFT", 0, -50);
	getglobal(prefix.."QuestLogCommentsTitle"):SetJustifyH("LEFT");
	getglobal(prefix.."QuestLogCommentsTitle"):SetText(L["Comments"]);
	getglobal(prefix.."QuestLogCommentsTitle"):SetTextColor(r, g, b, a);

	getglobal(prefix.."QuestLogCommentsDescription"):SetHeight(0);
	getglobal(prefix.."QuestLogCommentsDescription"):SetWidth(270);
	getglobal(prefix.."QuestLogCommentsDescription"):SetPoint("TOPLEFT", prefix.."QuestLogCommentsTitle", "BOTTOMLEFT", 0, -5);
	getglobal(prefix.."QuestLogCommentsDescription"):SetJustifyH("LEFT");
	getglobal(prefix.."QuestLogCommentsDescription"):SetText(questComments);
	getglobal(prefix.."QuestLogCommentsDescription"):SetTextColor(r, g, b, a);
	
	getglobal(prefix.."QuestLogRewardTitleText"):SetPoint("TOPLEFT", prefix.."QuestLogCommentsDescription", "BOTTOMLEFT", 0, -15);

	QuestFrame_SetAsLastShown(getglobal(prefix.."QuestLogCommentsDescription"));
	if (MetaMapNotes_AddNewNote ~= nil or MapNotes_Data_Notes ~= nil or Cartographer_Notes ~= nil) then
		if (qData[UnitFactionGroup("player")][questTitle] ~= nil) then
			for id, comment in ipairs(qData[UnitFactionGroup("player")][questTitle]['comments']) do
				local f = 0;
				while f ~= nil do
					f, t, coordx, coordy = strfind(comment, "%[([0-9]*) ([0-9]*)%]", f+1);
					if (coordx ~= nil and coordy ~= nil) then
						WHDB_PopulateZones();
						if (WHDB_QuestZoneInfo[questTitle] ~= nil) then
							if (WHDB_GetMapIDFromZome(WHDB_QuestZoneInfo[questTitle]) ~= -1) then
								if (string.len(comment) > 150) then
									comment = string.sub(comment,1,150) .. "...";
								end
								table.insert(WHDB_MAP_NOTES,{WHDB_QuestZoneInfo[questTitle], coordx, coordy, questTitle, comment, 1});
								if (MetaMapNotes_AddNewNote ~= nil or MapNotes_Data_Notes ~= nil or Cartographer_Notes ~= nil) then
									showMap = true;
								end
							end
						end
					end
				end
			end
		end
		endq = SearchEndNPC(questTitle);
		if (endq ~= nil) then
			monsterName = endq;
			if (npcData[monsterName] ~= nil) then
				zoneName = zoneData[npcData[monsterName]["zone"]];
				if (zoneName == nil) then zoneName = npcData[monsterName]["zone"]; end
				if (MetaMapNotes_AddNewNote ~= nil or MapNotes_Data_Notes ~= nil or Cartographer_Notes ~= nil) then
					for cid, cdata in pairs(npcData[monsterName]["coords"]) do
						local f, t, coordx, coordy = strfind(npcData[monsterName]["coords"][cid], "(.*),(.*)");
						table.insert(WHDB_MAP_NOTES,{zoneName, coordx, coordy, L["END: "]..questTitle, monsterName, 2});
						if (MetaMapNotes_AddNewNote ~= nil or MapNotes_Data_Notes ~= nil or Cartographer_Notes ~= nil) then							
							showMap = true;
						end
					end
				end
			end
		end
	end

	if (getglobal(prefix.."QuestLogShowMap") == nil) then
		CreateFrame("Button", prefix.."QuestLogShowMap", getglobal(prefix.."QuestLogDetailScrollChildFrame"), "UIPanelButtonTemplate");
		CreateFrame("Button", prefix.."QuestLogCleanMap", getglobal(prefix.."QuestLogDetailScrollChildFrame"), "UIPanelButtonTemplate");
	end
	
	getglobal(prefix.."QuestLogShowMap"):SetText(L["Show Map"]);
	getglobal(prefix.."QuestLogShowMap"):SetPoint("TOPLEFT", prefix.."QuestLogMapButtonsTitle", "BOTTOMLEFT", 0, -10);
	getglobal(prefix.."QuestLogShowMap"):SetHeight(25);
	getglobal(prefix.."QuestLogShowMap"):SetWidth(105);
	getglobal(prefix.."QuestLogShowMap"):RegisterForClicks("LeftButtonUp");
	getglobal(prefix.."QuestLogShowMap"):SetScript("OnClick", WHDB_ShowMap);
	
	getglobal(prefix.."QuestLogCleanMap"):SetText(L["Clean Map"]);
	getglobal(prefix.."QuestLogCleanMap"):SetPoint("TOPLEFT", prefix.."QuestLogMapButtonsTitle", "BOTTOMLEFT", 110, -10);
	getglobal(prefix.."QuestLogCleanMap"):SetHeight(25);
	getglobal(prefix.."QuestLogCleanMap"):SetWidth(105);
	getglobal(prefix.."QuestLogCleanMap"):RegisterForClicks("LeftButtonUp");
	getglobal(prefix.."QuestLogCleanMap"):SetScript("OnClick", WHDB_CleanMap);

	local numRewards = GetNumQuestLogRewards();
	local numChoices = GetNumQuestLogChoices();
	local money = GetQuestLogRewardMoney();

	if ( (numRewards + numChoices + money) > 0 ) then
		getglobal(prefix.."QuestLogRewardTitleText"):Show();
		QuestFrame_SetAsLastShown(getglobal(prefix.."QuestLogRewardTitleText"));
	else
		getglobal(prefix.."QuestLogRewardTitleText"):Hide();
	end

	--if (not showMap) then
	--	getglobal(prefix.."QuestLogShowMap"):Disable();
	--	getglobal(prefix.."QuestLogCleanMap"):Disable();
	--else
		getglobal(prefix.."QuestLogShowMap"):Enable();
		getglobal(prefix.."QuestLogCleanMap"):Enable();
	--end
	
	QuestFrameItems_Update("QuestLog");
	if ( not doNotScroll ) then
		getglobal(prefix.."QuestLogDetailScrollFrameScrollBar"):SetValue(0);
	end
	getglobal(prefix.."QuestLogDetailScrollFrame"):UpdateScrollChildRect();	
	end
end

function WHDB_PlotNotesOnMap()
	local zone = nil;
	local title = nil;
	local noteID = nil;
	
	local firstNote = 1;
	
	for nKey, nData in ipairs(WHDB_MAP_NOTES) do
		if (MetaMapNotes_AddNewNote ~= nil) then
			if (nData[6] == 0) then
				local continent, zone = MetaMap_NameToZoneID(nData[1]);
				noteAdded, noteID = MetaMapNotes_AddNewNote(continent,zone, nData[2]/100, nData[3]/100, nData[4], nData[5], "", "WHDB", 2, 7, 0, 0, 1);
			elseif (nData[6] == 1) then
				local continent, zone = MetaMap_NameToZoneID(nData[1]);
				noteAdded, noteID = MetaMapNotes_AddNewNote(continent,zone, nData[2]/100, nData[3]/100, nData[4], nData[5], "", "WHDB", 1, 2, 0, 0, 1);
			elseif (nData[6] == 2) then
				local continent, zone = MetaMap_NameToZoneID(nData[1]);
				noteAdded, noteID = MetaMapNotes_AddNewNote(continent,zone, nData[2]/100, nData[3]/100, nData[4], nData[5], "", "WHDB", 3, 8, 0, 0, 1);
			end
			
			local continent, zone = MetaMap_NameToZoneID(nData[1]);
			
			if (BWP_Destination ~= nil) then
				if (firstNote == 1) then 
				BWP_Destination = {};
				BWP_Destination.name = nData[4];
				BWP_Destination.x = nData[2]/100;
				BWP_Destination.y = nData[3]/100;
				BWP_Destination.zone = MetaMap_ZoneNames[continent][zone];
				BWPDestText:SetText("("..BWP_Destination.name..")");
				BWPDistanceText:SetText(BWP_GetDistText())
				BWP_DisplayFrame:Show();
				firstNote = 0;
				end
			end	
		end
		if (Cartographer_Notes ~= nil) then
			if (nData[6] == 0) then
				Cartographer_Notes:SetNote(nData[1], nData[2]/100, nData[3]/100, "Star", "WHDB", 'title', nData[4], 'info', nData[5]);			
			elseif (nData[6] == 1) then
				Cartographer_Notes:SetNote(nData[1], nData[2]/100, nData[3]/100, "Diamond", "WHDB", 'title', nData[4], 'info', nData[5]);			
			elseif (nData[6] == 2) then
				Cartographer_Notes:SetNote(nData[1], nData[2]/100, nData[3]/100, "Circle", "WHDB", 'title', nData[4], 'info', nData[5]);			
			end
		end
		if (MapNotes_Data_Notes ~= nil) then
			local c, z = WHDB_GetMapIDFromZome(nData[1]);
			if (key ~= -1) then
				SetMapZoom(c, z);
				key = MapNotes_GetMapKey();
				if (MapNotes_Data_Notes[key] ~= nil) then
					local Id = MapNotes_GetZoneTableSize(MapNotes_Data_Notes[key]) + 1;
					MapNotes_Data_Notes[key][Id] = {};
					MapNotes_Data_Notes[key][Id].name = nData[4];
					MapNotes_Data_Notes[key][Id].ncol = 7;
					MapNotes_Data_Notes[key][Id].inf1 = nData[5];
					MapNotes_Data_Notes[key][Id].in1c = 8;
					MapNotes_Data_Notes[key][Id].inf2 = "";
					MapNotes_Data_Notes[key][Id].in2c = 8;
					MapNotes_Data_Notes[key][Id].creator = "WHDB";
					if (nData[6] == 0) then
						MapNotes_Data_Notes[key][Id].icon = 7;
					else
						MapNotes_Data_Notes[key][Id].icon = 0;
					end
					MapNotes_Data_Notes[key][Id].xPos = nData[2]/100;
					MapNotes_Data_Notes[key][Id].yPos = nData[3]/100;
				else
					WHDB_Print(L["Error: MapNotes can't find the map."]);
				end
			else
				WHDB_Print(L["Error: Map doesn't exist!"]);
			end
		end
		if (nData[1] ~= nil) then
			zone = nData[1];
			title = nData[4];
		end
	end
	return zone, title, noteID;
end

function WHDB_GetMapIDFromZome(zoneText)
	for cKey, cName in ipairs{GetMapContinents()} do
		for zKey,zName in ipairs{GetMapZones(cKey)} do
			if(zoneText == zName) then
				return cKey, zKey;
			end
		end
	end
	return -1, zoneText;
end

function WHDB_GetComments(questTitle)
	local questComments = "";
	
	if (qData[UnitFactionGroup("player")][questTitle] ~= nil) then
		for id, comment in ipairs(qData[UnitFactionGroup("player")][questTitle]['comments']) do
			questComments = questComments .. comment .."\n\n";
		end
	else
		if questRu[questTitle] ~= nil then
			if questEng[questRu[questTitle]["id"]] ~= nil then
				questTitle = questEng[questRu[questTitle]["id"]]
			end
		end

	if (qData[UnitFactionGroup("player")][questTitle] ~= nil) then
		for id, comment in ipairs(qData[UnitFactionGroup("player")][questTitle]['comments']) do
			questComments = questComments .. comment .."\n\n";
		end
	else
		questComments = questComments  .. L["No comments for this quest.\n\n"];
		end
	end
	
	questComments = questComments .. "";
	return questComments;
end

function WHDB_ShowMap()
	local ShowMapZone, ShowMapTitle, ShowMapID = WHDB_PlotNotesOnMap();
	if (MetaMap_ShowLocation ~= nil) then
		if (ShowMapZone ~= nil and ShowMapID ~= nil) then
			MetaMap_ShowLocation(ShowMapZone, ShowMapTitle, ShowMapID);
		end
	end
	if (Cartographer) then
		if (ShowMapZone ~= nil) then
			WorldMapFrame:Show();								
			SetMapZoom(WHDB_GetMapIDFromZome(ShowMapZone));
		end
	end
	if (MapNotes_Data_Notes ~= nil) then
		WorldMapFrame:Show();
		SetMapZoom(WHDB_GetMapIDFromZome(ShowMapZone));
	end
end

function WHDB_CleanMap()
	if (MetaMap_DeleteNotes ~= nil) then
		MetaMap_DeleteNotes("WHDB");
	end
	if (Cartographer_Notes ~= nil) then
		Cartographer_Notes:UnregisterNotesDatabase("WHDB");
		WHDBDB = {}; WHDBDBH = {};
		Cartographer_Notes:RegisterNotesDatabase("WHDB",WHDBDB,WHDBDBH);
	end
	if (MapNotes_Data_Notes ~= nil) then
		MapNotes_DeleteNotesByCreatorAndName("WHDB");
	end
end

function WHDB_PopulateZones()
	local numEntries, numQuests = GetNumQuestLogEntries();
	local lastZone, questLogTitleText, suggestedGroup, level, questTag, isHeader, isCollapsed, isComplete;
	for i=1, numEntries, 1 do
		questLogTitleText, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete = GetQuestLogTitle(i);
		if (isHeader) then
			lastZone = questLogTitleText;
		else
			WHDB_QuestZoneInfo[questLogTitleText] = lastZone;
		end
	end
end

function SearchEndNPC(quest)
	for npc, data in pairs(npcData) do
		if (data["ends"] ~= nil) then
			if (data["ends"][1] == quest or data["ends"][2] == quest or data["ends"][3] == quest or data["ends"][4] == quest or data["ends"]
			[5] == quest or data["ends"][6] == quest or data["ends"][7] == quest or data["ends"][8] == quest or data["ends"]
			[9] == quest or data["ends"][10] == quest or data["ends"][11] == quest or data["ends"][12] == quest or data["ends"]
			[13] == quest or data["ends"][14] == quest or data["ends"][15] == quest or data["ends"][16] == quest or data["ends"]
			[17] == quest or data["ends"][18] == quest or data["ends"][19] == quest or data["ends"][20] == quest or data["ends"]
			[21] == quest) then
				return npc;
			end
		end
	end
	return nil;
end
