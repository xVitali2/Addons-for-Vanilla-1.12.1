--
-- Modified TradeSkillFrame that shows information about what is in the bank among other things...
--
-- Description: see the reamde.txt file
--
-- Version History: see the readme.txt file
--

-- global statics
PINKY_TRADESKILL = 1;  -- this addon handles both the TradeSkill and Craft screens
PINKY_CRAFT = 2;

-- global variables
Pinky_LoadedMessageDisplayedP = false; -- same
Pinky_Invalid_Bag_Contents = true; -- used to signal that the inventory data structure needs to be updated
Pinky_Okay_To_Update_Data = false; -- used to signal that the Update method can be called
Pinky_Totals = {}; -- inventory totals
EnhancedTradeSkillsDetails = { 
name = "EnhancedTradeSkills", 
version = PINKY_VERSION, 
releaseDate = PINKY_RELEASE, 
author = "Triadian", 
email = "Triadian@Gmail.com", 
category = MYADDONS_CATEGORY_PROFESSIONS, 
optionsframe = "PinkyConfigFrame" 
}; 

Pinky_Debug = false; -- spams your chat window with debugging information

-- Initialize Events and Slash Commands
function RomuTradeSkillFrame_OnLoad()

     -- register the events for the 'enhancements'
     this:RegisterEvent("PLAYER_ENTERING_WORLD");
     this:RegisterEvent("PLAYER_LEAVING_WORLD");
     this:RegisterEvent("BANKFRAME_OPENED");
     this:RegisterEvent("PLAYERBANKSLOTS_CHANGED");
     this:RegisterEvent("BAG_UPDATE");
     this:RegisterEvent("TRADE_SKILL_SHOW");
     this:RegisterEvent("TRADE_SKILL_CLOSE");
     this:RegisterEvent("CRAFT_SHOW");
     this:RegisterEvent("CRAFT_CLOSE");
     this:RegisterEvent("VARIABLES_LOADED");
     

     -- register the new slash commands
     SlashCmdList["PINKY_TSF_DUMP_COMMAND"] = Pinky_DumpAll;
     SLASH_PINKY_TSF_DUMP_COMMAND1 = "/ets";
     SlashCmdList["PINKY_TSF_FILTER_COMMAND"] = Pinky_SetFilter;
     SLASH_PINKY_TSF_FILTER_COMMAND1 = "/etsfilter";
     SlashCmdList["PINKY_TSF_FORMAT_COMMAND"] = Pinky_SetFormat;
     SLASH_PINKY_TSF_FORMAT_COMMAND1 = "/etsdisplay";
     SlashCmdList["PINKY_TSF_RESET_COMMAND"] = Pinky_Reset;
     SLASH_PINKY_TSF_RESET_COMMAND1 = "/etsreset";
     SlashCmdList["PINKY_TSF_CONFIGURE_COMMAND"] = Pinky_Configure;
     SLASH_PINKY_TSF_CONFIGURE_COMMAND1 = "/etsconfig";
     
     -- added myAddons Support
     if(myAddOnsFrame_Register) then 
	myAddOnsFrame_Register(EnhancedTradeSkillsDetails); 
    end 

end

function RomuTradeSkillFrame_OnEvent()

	if (event == "TRADE_SKILL_SHOW") then
      Pinky_Okay_To_Update_Data = true; -- okay to update information
      TradeSkillFrame_Update();
    elseif (event == "CRAFT_SHOW") then
      Pinky_Okay_To_Update_Data = true; -- okay to update information
      CraftFrame_Update();
	elseif ((event == "TRADE_SKILL_CLOSE") or (event == "CRAFT_CLOSE")) then
      Pinky_Okay_To_Update_Data = false; -- no longer okay to update information
    elseif (event == "VARIABLES_LOADED") then
     -- output loading message
     Pinky_PlayerName = nil;
     local p_player = Pinky_GetPlayerName();
     Pinky_OutputMessage(PINKY_BANNER);
     Pinky_BankStatus(p_player);
     Pinky_LoadedMessageDisplayedP = true;
    elseif (event == "PLAYERBANKSLOTS_CHANGED") then 
      Pinky_UpdateBankContents();
    elseif (event == "BANKFRAME_OPENED") then
      Pinky_UpdateBankContents();
    elseif ((event == "BAG_UPDATE") and (arg1 >= 5) and (arg1 <= 10)) then
      Pinky_UpdateBankContents();
    elseif ((event == "BAG_UPDATE") and (arg1 < 5)) then
      -- signal that when needed the bag contents should be rescanned
      Pinky_Invalid_Bag_Contents = true;
    elseif  (event == "PLAYER_ENTERING_WORLD") then 
     this:RegisterEvent("BANKFRAME_OPENED");
     this:RegisterEvent("PLAYERBANKSLOTS_CHANGED");
     this:RegisterEvent("BAG_UPDATE");
     this:RegisterEvent("TRADE_SKILL_SHOW");
     this:RegisterEvent("TRADE_SKILL_CLOSE");
     this:RegisterEvent("CRAFT_SHOW");
     this:RegisterEvent("CRAFT_CLOSE");
     this:RegisterEvent("VARIABLES_LOADED");
     elseif  (event == "PLAYER_LEAVING_WORLD") then 
     this:UnregisterEvent("BANKFRAME_OPENED");
     this:UnregisterEvent("PLAYERBANKSLOTS_CHANGED");
     this:UnregisterEvent("BAG_UPDATE");
     this:UnregisterEvent("TRADE_SKILL_SHOW");
     this:UnregisterEvent("TRADE_SKILL_CLOSE");
     this:UnregisterEvent("CRAFT_SHOW");
     this:UnregisterEvent("CRAFT_CLOSE");
     this:UnregisterEvent("VARIABLES_LOADED");
    end
end

function TradeSkillFrame_Update()

  -- check if the package has loaded
  -- you would think that I could use IsVisible, but it is not working for me :(
  if (not Pinky_LoadedMessageDisplayedP) then return end;

  -- check if this function is being called when the frame is not open
  -- you would think that I could use IsVisible, but it is not working for me :(
  if (not Pinky_Okay_To_Update_Data) then return end;
  if (loadable or IsAddOnLoaded("ChatMats")) then
  chatmats_HookTradeSkillOnClick();
  end;

  Pinky_DebugMessage("TradeSkillFrame_Update called");
  p_player = Pinky_GetPlayerName();
  Pinky_Update_Inventory_Information(p_player);
	if ( Pinky_Display[p_player][PINKY_TOGGLE] == 1 ) then 
		ETS_FILTERSONOFF:SetText(TOGGLE_FILTER_ON);
		ETS_CFILTERSONOFF:SetText(TOGGLE_FILTER_ON);
	else
		ETS_FILTERSONOFF:SetText(TOGGLE_FILTER_OFF);
		ETS_CFILTERSONOFF:SetText(TOGGLE_FILTER_OFF);
	end;
	local numTradeSkills = GetNumTradeSkills();
	local skillOffset = FauxScrollFrame_GetOffset(TradeSkillListScrollFrame);
	local TS_Title = format(TEXT(TRADE_SKILL_TITLE), GetTradeSkillLine())

	-- If no tradeskills
	if ( numTradeSkills == 0 ) then
		TradeSkillFrameTitleText:SetText(Pinky_TradeSkillTitle(TS_Title, p_player));
		TradeSkillSkillName:Hide();
--		TradeSkillSkillLineName:Hide();
		TradeSkillSkillIcon:Hide();
		TradeSkillRequirementLabel:Hide();
		TradeSkillCollapseAllButton:Disable();
		for i=1, MAX_TRADE_SKILL_REAGENTS, 1 do
			getglobal("TradeSkillReagent"..i):Hide();
		end
	else
		TradeSkillSkillName:Show();
--		TradeSkillSkillLineName:Show();
		TradeSkillSkillIcon:Show();
		TradeSkillCollapseAllButton:Enable();
	end
  if  IsAddOnLoaded("FilterTradeSkill") then FilterTradeSkill:Update(); ETS_FILTERSONOFF:Hide(); return; end;
	-- ScrollFrame update
	FauxScrollFrame_Update(TradeSkillListScrollFrame, numTradeSkills, TRADE_SKILLS_DISPLAYED, TRADE_SKILL_HEIGHT, nil, nil, nil, TradeSkillHighlightFrame, 293, 316 );
	
	TradeSkillHighlightFrame:Hide();
	for i=1, TRADE_SKILLS_DISPLAYED, 1 do
          local skillIndex;

          -- loop until you find something that is not filtered out
          repeat
            skillIndex = i + skillOffset;
            skillOffset = skillOffset + 1;
          until ((skillIndex > numTradeSkills) or (not Pinky_FilterP(skillIndex, PINKY_TRADESKILL, p_player)));
          
          -- correct the offset
          skillOffset = skillOffset - 1;

		local skillButton = getglobal("TradeSkillSkill"..i);

		if ( skillIndex <= numTradeSkills ) then
	      local skillName, skillType, numAvailable, isExpanded = GetTradeSkillInfo(skillIndex);	
  
			-- Set button widths if scrollbar is shown or hidden
			if ( TradeSkillListScrollFrame:IsVisible() ) then
				skillButton:SetWidth(293);
			else
				skillButton:SetWidth(323);
			end
			local color = TradeSkillTypeColor[skillType];
			if ( color ) then
				skillButton:SetTextColor(color.r, color.g, color.b);
			end
			
			skillButton:SetID(skillIndex);
			skillButton:Show();
			-- Handle headers
			if ( skillType == "header" ) then
				skillButton:SetText(skillName);
				if ( isExpanded ) then
					skillButton:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up");
				else
					skillButton:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up");
				end
				getglobal("TradeSkillSkill"..i.."Highlight"):SetTexture("Interface\\Buttons\\UI-PlusButton-Hilight");
				getglobal("TradeSkillSkill"..i):UnlockHighlight();
			else
				if ( not skillName ) then
					return;
				end
				skillButton:SetNormalTexture("");
				getglobal("TradeSkillSkill"..i.."Highlight"):SetTexture("");
--				if ( numAvailable == 0 ) then
--					skillButton:SetText(" "..skillName);
--				else
                    -- Pinky: output more information about what can be crafted
                    skillButton:SetText(Pinky_TradeSkillText(skillIndex, skillName, PINKY_TRADESKILL, p_player));
--				end
				
				-- Place the highlight and lock the highlight state
				if ( GetTradeSkillSelectionIndex() == skillIndex ) then
					TradeSkillHighlightFrame:SetPoint("TOPLEFT", "TradeSkillSkill"..i, "TOPLEFT", 0, 0);
					TradeSkillHighlightFrame:Show();
					-- Set the max makeable items for the create all button
					TradeSkillFrame.numAvailable = numAvailable;
					getglobal("TradeSkillSkill"..i):LockHighlight();
				else
					getglobal("TradeSkillSkill"..i):UnlockHighlight();
				end
			end
			
		else
			skillButton:Hide();
		end
	end
	
	-- Set the expand/collapse all button texture
	-- local numHeaders = 0;
	-- local notExpanded = 0;
        local showCollapseButton = true;
        -- PINKY: fixed bug in base Blizzard code, over indexing trade skill index (need to substract skillOffset)
	for i=1, numTradeSkills-skillOffset, 1 do
		local index = i + skillOffset;
		local skillName, skillType, numAvailable, isExpanded = GetTradeSkillInfo(index);
		if ( skillName and skillType == "header" ) then
			-- numHeaders = numHeaders + 1;
			-- if ( not isExpanded ) then
			--	notExpanded = notExpanded + 1;
			-- end
            -- PINKY: fixed bug in base Blizzard code, exit out when you know the answer
            if (isExpanded) then
              showCollapseButton = false;
              break;
            end
		end
	end
	-- If all headers are not expanded then show collapse button, otherwise show the expand button
	-- if ( notExpanded ~= numHeaders ) then
        if (not showCollapseButton) then
		TradeSkillCollapseAllButton.collapsed = nil;
		TradeSkillCollapseAllButton:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up");
	else
		TradeSkillCollapseAllButton.collapsed = 1;
		TradeSkillCollapseAllButton:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up");
	end
end

function TradeSkillFrame_SetSelection(id)
	local skillName, skillType, numAvailable, isExpanded = GetTradeSkillInfo(id);
	TradeSkillHighlightFrame:Show();
	if ( skillType == "header" ) then
		TradeSkillHighlightFrame:Hide();
		if ( isExpanded ) then
			CollapseTradeSkillSubClass(id);
		else
			ExpandTradeSkillSubClass(id);
		end
		return;
	end
	TradeSkillFrame.selectedSkill = id;
	SelectTradeSkill(id);

	if ( GetTradeSkillSelectionIndex() > GetNumTradeSkills() ) then
		return;
	end
	local color = TradeSkillTypeColor[skillType];
	if ( color ) then
		TradeSkillHighlight:SetVertexColor(color.r, color.g, color.b);
	end

	-- General Info
	local TS_Title = format(TEXT(TRADE_SKILL_TITLE), GetTradeSkillLine())
        local p_player = Pinky_GetPlayerName();

	local skillLineName, skillLineRank, skillLineMaxRank = GetTradeSkillLine();
	TradeSkillFrameTitleText:SetText(Pinky_TradeSkillTitle(TS_Title, p_player));
	-- Set statusbar info
	TradeSkillRankFrameSkillName:SetText(skillLineName);
	TradeSkillRankFrame:SetStatusBarColor(0.0, 0.0, 1.0, 0.5);
	TradeSkillRankFrameBackground:SetVertexColor(0.0, 0.0, 0.75, 0.5);
	TradeSkillRankFrame:SetMinMaxValues(0, skillLineMaxRank);
	TradeSkillRankFrame:SetValue(skillLineRank);
	TradeSkillRankFrameSkillRank:SetText(skillLineRank.."/"..skillLineMaxRank);

  local totalSkillItems = Pinky_GetTotalCount(p_player, skillName);

  if (totalSkillItems > 0) then
    local invSkillItems = Pinky_GetInventoryCount(skillName);
    TradeSkillSkillName:SetText(skillName.."  ["..invSkillItems.."/"..totalSkillItems.."]");
  else
	  TradeSkillSkillName:SetText(skillName);
  end
--	TradeSkillSkillLineName:SetText(GetTradeSkillLine());
	if ( GetTradeSkillCooldown(id) ) then
		TradeSkillSkillCooldown:SetText(COOLDOWN_REMAINING.." "..SecondsToTime(GetTradeSkillCooldown(id)));
	else
		TradeSkillSkillCooldown:SetText("");
	end
	TradeSkillSkillIcon:SetNormalTexture(GetTradeSkillIcon(id));
	local minMade,maxMade = GetTradeSkillNumMade(id);
	if ( maxMade > 1 ) then
		if ( minMade == maxMade ) then
			TradeSkillSkillIconCount:SetText(minMade);
		else
			TradeSkillSkillIconCount:SetText(minMade.."-"..maxMade);
		end
		if ( TradeSkillSkillIconCount:GetWidth() > 39 ) then
			TradeSkillSkillIconCount:SetText("~"..floor((minMade + maxMade)/2));
		end
	else
		TradeSkillSkillIconCount:SetText("");
	end
	
	-- Reagents
	local creatable = 1;
	local numReagents = GetTradeSkillNumReagents(id);
	for i=1, numReagents, 1 do
		local reagentName, reagentTexture, reagentCount, playerReagentCount = GetTradeSkillReagentInfo(id, i);
		local reagent = getglobal("TradeSkillReagent"..i)
		local name = getglobal("TradeSkillReagent"..i.."Name");
		local count = getglobal("TradeSkillReagent"..i.."Count");
		if ( not reagentName or not reagentTexture ) then
			reagent:Hide();
		else
			reagent:Show();
			SetItemButtonTexture(reagent, reagentTexture);
            -- deal with stuff in the bank
            local totalReagents = Pinky_GetTotalCount(p_player, reagentName);
              		name:SetFont(GameFontNormal:GetFont(), 11, "OUTLINE");
			name:SetText(reagentName.." ["..totalReagents.."]");
			
			name:SetWidth(103);
			-- Grayout items
			if ( playerReagentCount < reagentCount ) then
				SetItemButtonTextureVertexColor(reagent, 0.5, 0.5, 0.5);
				name:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
				creatable = nil;
			else
				SetItemButtonTextureVertexColor(reagent, 1.0, 1.0, 1.0);
				name:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
			end
			if ( playerReagentCount >= 100 ) then
				playerReagentCount = "*";
			end
			count:SetText(playerReagentCount.." /"..reagentCount);
		end
	end
	-- Place reagent label
	local reagentToAnchorTo = numReagents;
	if ( (numReagents > 0) and (mod(numReagents, 2) == 0) ) then
		reagentToAnchorTo = reagentToAnchorTo - 1;
	end
--	if ( numReagents > 0 ) then
--		TradeSkillRequirementLabel:SetPoint("TOPLEFT", "TradeSkillReagent"..reagentToAnchorTo, "BOTTOMLEFT", 0, 0);
--	end
	
	for i=numReagents + 1, MAX_TRADE_SKILL_REAGENTS, 1 do
		getglobal("TradeSkillReagent"..i):Hide();
	end

	local spellFocus = BuildColoredListString(GetTradeSkillTools(id));
	if ( spellFocus ) then
		TradeSkillRequirementLabel:Show();
		TradeSkillRequirementText:SetText(spellFocus);
	else
		TradeSkillRequirementLabel:Hide();
		TradeSkillRequirementText:SetText("");
	end

	if ( creatable ) then
		TradeSkillCreateButton:Enable();
		TradeSkillCreateAllButton:Enable();
	else
		TradeSkillCreateButton:Disable();
		TradeSkillCreateAllButton:Disable();
	end
	TradeSkillDetailScrollFrame:UpdateScrollChildRect();

	-- Reset the number of items to be created
	TradeSkillInputBox:SetNumber(GetTradeskillRepeatCount());
end

--
-- return how many trade skill items can be made with the total number
-- of reagents that the player has in their inventory and the bank
--
-- returns four values, count in inventory, count (excluding buyables) inventory, count in bank and inventory
--   and count (excluding buyables) in bank and inventory
--
-- a number bigger than the total number of items
-- inv: 5 bags x 16 slots/bag x 20 items/slot = 1600
-- bank: (24 slots + 6 bags x 16 slots/bag) x 20 items/slot = 2400
-- total is 4000 << 100000
--
PINKY_HIGH_WATER = 100000;

function Pinky_GetTotalTradeSkillItemCount(id, type, p_player)
  local fullinvcount = PINKY_HIGH_WATER;
  local buyinvcount = PINKY_HIGH_WATER;
  local buycount = PINKY_HIGH_WATER;
  local fullcount = PINKY_HIGH_WATER;
  local i;

  -- handle both TRADESKILL and CRAFT screens
  if (type == PINKY_TRADESKILL) then
     numReagents = GetTradeSkillNumReagents(id);
  else
     numReagents = GetCraftNumReagents(id);
  end;

  local once = false;
  local buyable = 0;
  
  for i = 1, numReagents do
    local reagentName, reagentCount, linktext;
    if (type == PINKY_TRADESKILL) then
       reagentName, _, reagentCount, _ = GetTradeSkillReagentInfo(id, i);
       if (reagentName == nil) then return 0, 0, 0, 0; end;
       linktext = GetTradeSkillReagentItemLink(id, i);
    else
       reagentName, _, reagentCount, _ = GetCraftReagentInfo(id, i);
       if (reagentName == nil) then return 0, 0, 0, 0; end;
       linktext = GetCraftReagentItemLink(id, i);
    end;
    local totalReagents = Pinky_GetTotalCount(p_player, reagentName);
    local totalInventoryReagents = Pinky_GetInventoryCount(reagentName);

    local _, reagentItemID = Pinky_GetItemNameAndID(linktext);

    -- number of multiples of the needed reagents that the user has
    local temp = math.floor(totalReagents / reagentCount);
    local temp2 = math.floor(totalInventoryReagents / reagentCount);

    -- number of items the user can make (includes the needed vials)
    fullcount = math.min(temp, fullcount);
    fullinvcount = math.min(temp2, fullinvcount);

    -- skip buyable items (use ItemID so it is indepedent of language)
    if (Pinky_BuyableItems[reagentItemID] == nil) then
        buycount = math.min(temp, buycount);
        buyinvcount = math.min(temp2, buyinvcount);
        once = true;
    else
        buyable = buyable + 1;
    end;
  end;

  -- check for the player not having any of the reagents
  if (buycount == PINKY_HIGH_WATER) then
    buycount = 0;
  end;
  if (fullcount == PINKY_HIGH_WATER) then
    fullcount = 0;
  end;
  if (buyinvcount == PINKY_HIGH_WATER) then
    buyinvcount = 0;
  end;
  if (fullinvcount == PINKY_HIGH_WATER) then
    fullinvcount = 0;
  end;

  -- special case of all reagents buyable (comes up in enchanting and possibly poisons)
  if (not once) then
    buycount = fullcount;
    buyinvcount = fullinvcount;
  end;

  if ((buyable == numReagents) and (buycount == 0)) then
    buycount = PINKY_HIGH_WATER;
  end;
  if ((buyable == numReagents) and (buyinvcount == 0)) then
    buyinvcount = PINKY_HIGH_WATER;
  end;

  return fullinvcount, buyinvcount, fullcount, buycount;
end;


--
-- set the format variables
--

function Pinky_SetFormat(msg)
  local filterstring = string.lower(msg);
  local p_player = Pinky_GetPlayerName();
  Pinky_ValidateDisplay(p_player);

  start, final = string.find(filterstring, " ");
  if (start == nil or final == nil) then
    -- no space
    Pinky_OutputMessage(string.format(PINKY_INVALID_DISPLAY_CMD, filterstring));
    return;
  end;

  local filter = string.sub(filterstring, 1, start - 1);
  local mode = string.sub(filterstring, final + 1);

  if ((mode ~= PINKY_TRUE) and (mode ~= PINKY_FALSE)) then
    Pinky_OutputMessage(string.format(PINKY_INVALID_DISPLAY_SETTING, mode, filter));
    return;
  end;

  if ((filter ~= PINKY_INV) and (filter ~= PINKY_INV_PLUS) and
      (filter ~= PINKY_TOTAL) and (filter ~= PINKY_TOTAL_PLUS)) then
    Pinky_OutputMessage(string.format(PINKY_INVALID_DISPLAY_COLUMN, filter));
    return;
  end;

  local value = true;

  if (mode == PINKY_TRUE) then
    value = 1;
  else
    value = 0;
  end;

  Pinky_Display[p_player][filter] = value; 
  Pinky_OutputMessage(string.format(PINKY_DISPLAY_SETTING, filter, mode));
end;


--
-- set the variable filters
--
-- yes, the filter names aren't the best, but hopefully the text interface will go away soon
--

function Pinky_SetFilter(msg)
  local filterstring = string.lower(msg);
  local p_player = Pinky_GetPlayerName();
  Pinky_ValidateFilters(p_player);

  start, final = string.find(filterstring, " ");
  if (start == nil or final == nil) then
    -- no space
    Pinky_OutputMessage(string.format(PINKY_INVALID_FILTER_CMD, filterstring));
    return;
  end;

  local filter = string.sub(filterstring, 1, start - 1);
  local mode = string.sub(filterstring, final + 1);

  if (mode ~= PINKY_TRUE and mode ~= PINKY_FALSE) then
    Pinky_OutputMessage(string.format(PINKY_INVALID_FILTER_SETTING, mode, filter));
    return;
  end;

  if ((filter ~= PINKY_INV) and (filter ~= PINKY_INV_PLUS) and
      (filter ~= PINKY_TOTAL) and (filter ~= PINKY_TOTAL_PLUS) and
      (filter ~= "optimal") and (filter ~= "medium") and (filter ~= "easy") and (filter ~= "trivial")) then
    Pinky_OutputMessage(string.format(PINKY_INVALID_FILTER_NAME, filter));
    return;
  end;

  local value = true;

  if (mode == PINKY_TRUE) then
    value = 1;
  else
    value = 0;
  end;

  local p_player = Pinky_GetPlayerName();
  Pinky_Filters[p_player][filter] = value; 
  Pinky_OutputMessage(string.format(PINKY_FILTER_SETTING, filter, mode));
end;


--
-- validate that the filters have been initialized, so that they can be persisted
--

function Pinky_ValidateFilters(p_player)
  local filter = false;

  if (not Pinky_Filters) then
    Pinky_Filters = {};
  end;

  if (not Pinky_Filters[p_player]) then
    Pinky_Filters[p_player] = {};
    return filter;
  end;

   -- migration...
   for key, item in Pinky_Filters[p_player] do
     if (item == true) then Pinky_Filters[p_player][key] = 1; end;
     if (item == false) then Pinky_Filters[p_player][key] = 0; end;
     if ((item == true) or (item == 1)) then filter = true; end; -- see if any filters exist
   end;

   return filter;
end;


function Pinky_ValidateDisplay(p_player)
  if (not Pinky_Display) then
    Pinky_Display = {};
  end;
  if (not Pinky_Display[p_player]) then
    Pinky_Display[p_player] = { [PINKY_INV] = 0, [PINKY_INV_PLUS] = 0, [PINKY_TOTAL] = 1, [PINKY_TOTAL_PLUS] = 1, [PINKY_TITLE] = 0, [PINKY_TOGGLE] = 1};
    return;
  end;

   -- migration...
   for key, item in Pinky_Display[p_player] do
     if (item == true) then Pinky_Display[p_player][key] = 1; end;
     if (item == false) then Pinky_Display[p_player][key] = 0; end;
   end;
end

--
-- reset the display filters
--

function Pinky_Reset()
  local p_player = Pinky_GetPlayerName();

  if (not Pinky_Display) then
    Pinky_Display = {};
  end;

  Pinky_Display[p_player] = { [PINKY_INV] = 0, [PINKY_INV_PLUS] = 0, [PINKY_TOTAL] = 1, [PINKY_TOTAL_PLUS] = 1, [PINKY_TITLE] = 0, [PINKY_TOGGLE] = 1 };

if (not Pinky_Filters) then
    Pinky_Filters = {};
  end;
  Pinky_Filters[p_player] = {};
  Pinky_OutputMessage(PINKY_RESET);
end;

--
-- return true if the item should be filtered out
--

function Pinky_FilterP(index, type, p_player)
  -- skip out early if no filters
  if (not Pinky_ValidateFilters(p_player)) then return; end;

   if ( Pinky_Display[p_player][PINKY_TOGGLE] == 1 ) then return; end;
  local skillType = Pinky_GetSkillType(index, type);

  -- display the headers
  if (skillType == "header") then
    return false;
  end;

  -- iterate over the various trade skill type colors (trivial, easy, medium, optimal)
  local key, value;

  for key, value in TradeSkillTypeColor do
    if ((Pinky_Filters[p_player][key] == 1) and (key == skillType)) then
      return true;
    end;
  end;

  -- filter based upon counts in the various columns
  local c1, c2, c3, c4 = Pinky_GetTotalTradeSkillItemCount(index, type, p_player);

  if ((Pinky_Filters[p_player][PINKY_INV] == 1) and (c1 == 0)) then
    return true;
  end;

  if ((Pinky_Filters[p_player][PINKY_INV_PLUS] == 1) and (c2 == 0)) then
    return true;
  end;

  if ((Pinky_Filters[p_player][PINKY_TOTAL] == 1) and (c3 == 0)) then
    return true;
  end;

  if ((Pinky_Filters[p_player][PINKY_TOTAL_PLUS] == 1) and (c4 == 0)) then
    return true;
  end;

  -- no matches, return false (i.e., display it)
  return false;
end;

--
-- get the skill level for the skill (trivial, easy, ...) 
--

function Pinky_GetSkillType(index, type)
  local skillType;

  if (type == PINKY_TRADESKILL) then
    _, skillType, _, _ = GetTradeSkillInfo(index);
  else
    _, _, skillType, _, _, _, _ = GetCraftInfo(index);
  end;
  return skillType;
end;
 

--
-- single place for the output string in the various frames
--

function Pinky_TradeSkillText(index, name, type, p_player)

  local fullinvcount, buyinvcount, fullcount, buycount = Pinky_GetTotalTradeSkillItemCount(index, type, p_player);

  if (buycount == 0) then
    return " "..name;
  else
    Pinky_ValidateDisplay(p_player);

    local msg = " "..name;
    local noopen = true;

    if (Pinky_Display[p_player][PINKY_INV] == 1) then
      if (noopen) then
        msg = msg.."  [";
        noopen = false;
      end;
      msg = msg..fullinvcount;
    end;

    if (Pinky_Display[p_player][PINKY_INV_PLUS] == 1) then
      if (noopen) then
        msg = msg.."  [";
        noopen = false;
      else
        msg = msg.."/";
      end;
      if (buyinvcount ==  PINKY_HIGH_WATER) then
        msg = msg.."-";
      else
        msg = msg..buyinvcount;
      end;
    end;

    if (Pinky_Display[p_player][PINKY_TOTAL] == 1) then
      if (noopen) then
        msg = msg.."  [";
        noopen = false;
      else
        msg = msg.."/";
      end;
      msg = msg..fullcount;
    end;

    if (Pinky_Display[p_player][PINKY_TOTAL_PLUS] == 1) then
      if (noopen) then
        msg = msg.."  [";
        noopen = false;
      else
        msg = msg.."/";
      end;
      if (buycount ==  PINKY_HIGH_WATER) then
        msg = msg.."-";
      else
        msg = msg..buycount;
      end;
    end;

    if (not noopen) then
      msg = msg.."]";
    end;
    
    return  msg;
  end;
end;

--
-- Figure Out The Option Text for the title
--
function Pinky_TradeSkillTitle(name, p_player)

Pinky_ValidateDisplay(p_player);

    local msg = " "..name;
    local noopen = true;

    if (not Pinky_Display[p_player][PINKY_TITLE]) then
      return  msg;
    end;

    if (Pinky_Display[p_player][PINKY_INV] == 1) then
      if (noopen) then
        msg = msg.."  [";
        noopen = false;
      end;
      msg = msg.."I";
    end;

    if (Pinky_Display[p_player][PINKY_INV_PLUS] == 1) then
      if (noopen) then
        msg = msg.."  [";
        noopen = false;
      else
        msg = msg.."/";
      end;
        msg = msg.."I+V";
     end;

    if (Pinky_Display[p_player][PINKY_TOTAL] == 1) then
      if (noopen) then
        msg = msg.."  [";
        noopen = false;
      else
        msg = msg.."/";
      end;
      msg = msg.."I+B";
    end;

    if (Pinky_Display[p_player][PINKY_TOTAL_PLUS] == 1) then
      if (noopen) then
        msg = msg.."  [";
        noopen = false;
      else
        msg = msg.."/";
      end;
        msg = msg.."I+B+V";
    end;

    if (not noopen) then
      msg = msg.."]";
    end;
    
  return  msg;
end;

--
-- determine the total number of items that the player has in their inventory
--

function Pinky_Update_Inventory_Information(p_player)
  -- if the inventory information has not been invalidated, the information is still correct
  if (not Pinky_Invalid_Bag_Contents) then return end;

  Pinky_Totals = {};
  Pinky_DebugMessage("Update Bag Totals called");

  for bag = 0, 4 do
    Pinky_UpdateContainerContents(p_player, bag);
  end;
  Pinky_Invalid_Bag_Contents = false;
  TradeSkillFrame_Update()
  CraftFrame_Update()
end;


--
-- let the user know the bank status
--

function Pinky_GetBankCount(player)
   if ((not Pinky_BankContents) or (not Pinky_BankContents[player])) then
     return 0;
   end;
   local count = 0;
   for _,_ in Pinky_BankContents[player] do
     count = count + 1;
   end;
   return count;
end;


function Pinky_BankStatus(player)
  local cnt = Pinky_GetBankCount(player);
  if (cnt == 0) then
     Pinky_OutputMessage(PINKY_BANK_EMPTY);
  else
     Pinky_OutputMessage(string.format(PINKY_BANK, cnt));
  end;
end;


--
-- return the total number of items, dealing with ones that don't exist
--

function Pinky_GetInventoryCount(itemName)
  -- get the inventory count
  local rcount = Pinky_Totals[itemName];
  if (rcount == nil) then
    -- none in the inventory
    rcount = 0;
  end;
  return rcount;
end;


function Pinky_GetTotalCount(p_player, itemName)
  -- get the inventory count
  local rcount = Pinky_GetInventoryCount(itemName);

  -- check the bank
  if (Pinky_BankContents) then
    if (Pinky_BankContents[p_player]) then
      local bcount = Pinky_BankContents[p_player][itemName];
      if (bcount ~= nil) then
        rcount = rcount + bcount;
      end;
    end;
  end;

  return rcount;
end;

--
-- update the bank contents
--

function Pinky_UpdateBankContents()

  if (not Pinky_LoadedMessageDisplayedP) then return end;
  local checkbanknon = IsAddOnLoaded("Banknon")
    

  -- oldly enough, bank contents change events occur even when the bank is not open!
  --  changing zones, dying, entering/exiting instances, ...
  if (not BankFrame:IsVisible() and not IsAddOnLoaded("OneBank") and not IsAddOnLoaded("Banknon") ) then return end; 
 
Pinky_DebugMessage("bankframe is open and banknon is off");

  if (IsAddOnLoaded("Banknon")) then 
    if (not Banknon:IsVisible()) then return end;
  end;
  if (IsAddOnLoaded("OneBank")) then 
    if (not OneBankFrame:IsVisible()) then return end;
  end;
  if (not Pinky_BankContents) then 
    Pinky_BankContents = {};
    Pinky_DebugMessage("Initializing global bank");
  end;

  local p_player = Pinky_GetPlayerName();
  -- empty the old bank contents before we fetch a new copy
  Pinky_BankContents[p_player] = {};
  Pinky_DebugMessage("bank was cleared");

  -- get the contents of the main bank slots
  Pinky_UpdateContainerContents(p_player, BANK_CONTAINER);
    Pinky_DebugMessage("bank was scanned");

  -- get the contents of the bags in the bank
  local bagNum;
  for bagNum = 5, 10 do
    Pinky_UpdateContainerContents(p_player, bagNum);
  end;
  TradeSkillFrame_Update()
  CraftFrame_Update()

end;


--
-- update the information about the reagents in a container (bank or inventory)
--

function Pinky_UpdateContainerContents(p_player, bag)
  -- how many slots in the container
  local maxContainerItems = GetContainerNumSlots(bag);

  if (maxContainerItems) then
    for containerItemNum = 1, maxContainerItems do
      local _, count = GetContainerItemInfo(bag, containerItemNum);
      if (count) then
        local itemName = Pinky_GetContainerItemName(bag, containerItemNum);
        if (itemName ~= nil) then
          -- see if a bank container or an inventory container
          if ((bag == BANK_CONTAINER) or ((bag >= 5) and (bag <= 10))) then

            -- bank
            if (Pinky_BankContents[p_player][itemName] == nil) then
              Pinky_BankContents[p_player][itemName] = count;
            else
              Pinky_BankContents[p_player][itemName] = Pinky_BankContents[p_player][itemName] + count;
            end;
          else

          -- inventory
            if (Pinky_Totals[itemName] == nil) then
              Pinky_Totals[itemName] = count;
            else
              Pinky_Totals[itemName] = Pinky_Totals[itemName] + count;
            end;
          end;
        end;
      end;
    end;
  end;
end;


--
-- Get the item name for an item in a container
--   encapsulate it in one place, especially since it's not intuitive :)
--

function Pinky_GetContainerItemName(bagNum, containerItemNum)
  local linktext = GetContainerItemLink(bagNum, containerItemNum);
  if (linktext == nil) then
    return nil;
  end;
  local name, _ = Pinky_GetItemNameAndID(linktext);
  return name;
end;


function Pinky_GetItemNameAndID(linktext)
  local id, name;
  for id, name in string.gfind(linktext,"|Hitem:(%d+):%d+:%d+:%d+|h%[([^]]+)%]|h|r$") do 
    if (id and name) then
      return name, id;
    end;
  end;
  return nil, nil;
end;


--
-- get and cache the player name (qualified by the realm)
--
-- e.g., Shattered Hand|Pinky
--

function Pinky_GetPlayerName()
  if (Pinky_PlayerName == nil) then
    local realm = GetCVar("realmName");
    local playername = UnitName("player");
    Pinky_PlayerName = realm.."|"..playername;
  end;
  return Pinky_PlayerName;
end;


--
-- simple routine for outputing to the chat windows
--

function Pinky_OutputMessage(string)
  DEFAULT_CHAT_FRAME:AddMessage(string);
end;

function Pinky_DebugMessage(string)
  if (Pinky_Debug) then
    DEFAULT_CHAT_FRAME:AddMessage("Debug: "..string);
  end;
end;

--
-- simple routine to dump information about your inventory and bank
--

function Pinky_DumpAll(msg)
  local match = nil;

  -- lower case the string to make life easier for the user
  if (msg ~= nil) then
    match = string.lower(msg);
  end;

  local p_player = Pinky_GetPlayerName();
  Pinky_Update_Inventory_Information(p_player);
  local keys = {};

  -- find all the keys across the inventory and bank
  for key, _ in Pinky_Totals do
    if ((match == nil) or Pinky_Match(key, match)) then
      keys[key] = 1;
    end;
  end;

  if ((Pinky_BankContents ~= nil) and (Pinky_BankContents[p_player] ~= nil)) then
    for key, _ in Pinky_BankContents[p_player] do
      if ((match == nil) or Pinky_Match(key, match)) then
        keys[key] = 1;
      end;
    end;
  end;

  -- dump the contents of the inventory and bank
  for key, _ in keys do
    local inv = Pinky_Totals[key];
    if (inv == nil) then
      inv = 0;
    end;

    local total = inv;
    local bnk = 0;

    if ((Pinky_BankContents ~= nil) and (Pinky_BankContents[p_player] ~= nil)) then
      bnk = Pinky_BankContents[p_player][key];
      if (bnk == nil) then
        bnk = 0;
      end;
      total = total + bnk;
      Pinky_OutputMessage(string.format(PINKY_DUMP, key, total, inv, bnk));
    else
      Pinky_OutputMessage(string.format(PINKY_DUMP1, key, inv));
    end;
    
  end;
end;


function Pinky_Match(value, match)
  local lc_val = string.lower(value);
  if (string.find(lc_val, match) ~= nil) then
    return true;
  end;
  return false;
end;

--
-- commands for graphical configuration
-- 

function Pinky_Configure()
 if (PinkyConfigFrame:IsVisible()) then
  PinkyConfigFrame:Hide();  
 else
  Pinky_UpdateConfigurationWindow();
  PinkyConfigFrame:Show();
 end;
end;
 
-- get configuration information from the config dialog
function Pinky_ConfigurationSave()
  local player = Pinky_GetPlayerName();
  Pinky_ValidateFilters(player);
  Pinky_ValidateDisplay(player);
local Toggle = Pinky_Display[player][PINKY_TOGGLE];
  Pinky_Filters[player]["trivial"] = PinkyFilterTrivial:GetChecked();
  Pinky_Filters[player]["easy"] = PinkyFilterEasy:GetChecked();
  Pinky_Filters[player]["medium"] = PinkyFilterMedium:GetChecked();
  Pinky_Filters[player]["optimal"] = PinkyFilterOptimal:GetChecked();
  Pinky_Filters[player][PINKY_INV] = PinkyFilterInv:GetChecked();
  Pinky_Filters[player][PINKY_INV_PLUS] = PinkyFilterInvPlus:GetChecked();
  Pinky_Filters[player][PINKY_TOTAL] = PinkyFilterTotal:GetChecked();
  Pinky_Filters[player][PINKY_TOTAL_PLUS] = PinkyFilterTotalPlus:GetChecked();
  
  Pinky_Display[player][PINKY_INV] = PinkyDisplayInv:GetChecked();
  Pinky_Display[player][PINKY_INV_PLUS] = PinkyDisplayInvPlus:GetChecked();
  Pinky_Display[player][PINKY_TOTAL] = PinkyDisplayTotal:GetChecked();
  Pinky_Display[player][PINKY_TOTAL_PLUS] = PinkyDisplayTotalPlus:GetChecked();
  Pinky_Display[player][PINKY_TITLE] = PinkyDisplayTitle:GetChecked();
  Pinky_Display[player][PINKY_TOGGLE] = Toggle ;

end;
 
-- set configuration information in the config dialog
function Pinky_UpdateConfigurationWindow()
  local player = Pinky_GetPlayerName();
  Pinky_ValidateFilters(player);
  Pinky_ValidateDisplay(player);

  PinkyFilterOptimal:SetText(PINKY_FILTER_OPTIMAL_BUTTON_TEXT);

  PinkyFilterTrivial:SetChecked(Pinky_Filters[player]["trivial"]);
  PinkyFilterEasy:SetChecked(Pinky_Filters[player]["easy"]);
  PinkyFilterMedium:SetChecked(Pinky_Filters[player]["medium"]);
  PinkyFilterOptimal:SetChecked(Pinky_Filters[player]["optimal"]);
  PinkyFilterInv:SetChecked(Pinky_Filters[player][PINKY_INV]);
  PinkyFilterInvPlus:SetChecked(Pinky_Filters[player][PINKY_INV_PLUS]);
  PinkyFilterTotal:SetChecked(Pinky_Filters[player][PINKY_TOTAL]);
  PinkyFilterTotalPlus:SetChecked(Pinky_Filters[player][PINKY_TOTAL_PLUS]);

  PinkyDisplayInv:SetChecked(Pinky_Display[player][PINKY_INV]);
  PinkyDisplayInvPlus:SetChecked(Pinky_Display[player][PINKY_INV_PLUS]);
  PinkyDisplayTotal:SetChecked(Pinky_Display[player][PINKY_TOTAL]);
  PinkyDisplayTotalPlus:SetChecked(Pinky_Display[player][PINKY_TOTAL_PLUS]);
  PinkyDisplayTitle:SetChecked(Pinky_Display[player][PINKY_TITLE]);
end;
 
function Pinky_ToggleFilter()
  local player = Pinky_GetPlayerName();
  Pinky_ValidateDisplay(player);
	if ( Pinky_Display[player][PINKY_TOGGLE] == 1 ) then 
		Pinky_Display[player][PINKY_TOGGLE] = 0;
	else
		Pinky_Display[player][PINKY_TOGGLE] = 1;
	end;
  TradeSkillFrame_Update()
  CraftFrame_Update()
  	
	if ( Pinky_Display[p_player][PINKY_TOGGLE] == 1 ) then 
		ETS_FILTERSONOFF:SetText(TOGGLE_FILTER_ON);
		ETS_CFILTERSONOFF:SetText(TOGGLE_FILTER_ON);
	else
		ETS_FILTERSONOFF:SetText(TOGGLE_FILTER_OFF);
		ETS_CFILTERSONOFF:SetText(TOGGLE_FILTER_OFF);
	end;


end;