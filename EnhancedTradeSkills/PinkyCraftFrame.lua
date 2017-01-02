--
-- Modified CraftFrame that shows information about what is in the bank
--
-- See TradeSkillFrame.toc and PinkyTradeSkillFrame.lua for more information
--

function CraftFrame_Update()

  -- check if the package has loaded
  -- you would think that I could use IsVisible, but it is not working for me :(
  if (not Pinky_LoadedMessageDisplayedP) then return end;

  -- check if this function is being called when the frame is not open
  -- you would think that I could use IsVisible, but it is not working for me :(
  if (not Pinky_Okay_To_Update_Data) then return end;
  if (loadable or IsAddOnLoaded("ChatMats")) then
        chatmats_HookCraftOnClick();
  end;

  Pinky_DebugMessage("Craft_Update called");
  local p_player = Pinky_GetPlayerName();
  Pinky_Update_Inventory_Information(p_player);
  	if ( Pinky_Display[p_player][PINKY_TOGGLE] == 1 ) then 
		ETS_FILTERSONOFF:SetText(TOGGLE_FILTER_ON);
		ETS_CFILTERSONOFF:SetText(TOGGLE_FILTER_ON);
	else
		ETS_FILTERSONOFF:SetText(TOGGLE_FILTER_ON);
		ETS_CFILTERSONOFF:SetText(TOGGLE_FILTER_ON);
	end;

-- lets setup the script for mouse clicks 
--   local ETS_CraftSkillBtn = getglobal(craftBtnName);
--    if(ETS_CraftSkillBtn) then
--    	  Pinky_DebugMessage("scriptsetup");
--        ETS_CraftSkillBtn:SetScript("OnClick", ETS_DoOnClickCraft);
--    end;

	local TS_Title = format(GetCraftName())
	if ( TS_Title == BEAST_TRAIN ) then 
		CraftFrameTitleText:SetText(TS_Title);
		ETS_CFILTERSONOFF:Hide();
	else
		CraftFrameTitleText:SetText(Pinky_TradeSkillTitle(TS_Title, p_player));
		ETS_CFILTERSONOFF:Show();
	end;
	SetPortraitTexture(CraftFramePortrait, "player");
	local numCrafts = GetNumCrafts();
	local craftOffset = FauxScrollFrame_GetOffset(CraftListScrollFrame);
	-- Set the action button text
	CraftCreateButton:SetText(getglobal(GetCraftButtonToken()));
	-- Set the craft skill line status bar info
	local name, rank, maxRank = GetCraftDisplaySkillLine();

	if ( name ) then
		CraftRankFrameSkillName:SetText(name);
		CraftRankFrame:SetStatusBarColor(0.0, 0.0, 1.0, 0.5);
		CraftRankFrameBackground:SetVertexColor(0.0, 0.0, 0.75, 0.5);
		CraftRankFrame:SetMinMaxValues(0, maxRank);
		CraftRankFrame:SetValue(rank);
		CraftRankFrameSkillRank:SetText(rank.."/"..maxRank);
		CraftRankFrame:Show();
		CraftSkillBorderLeft:Show();
		CraftSkillBorderRight:Show();
	else
		CraftRankFrame:Hide();
		CraftSkillBorderLeft:Hide();
		CraftSkillBorderRight:Hide();
	end
	

	-- Hide the expand all button if less than 2 crafts learned	
	if ( numCrafts <=1 ) then
		CraftExpandButtonFrame:Hide();
	else
		CraftExpandButtonFrame:Show();
	end
	-- If no Crafts
	if ( numCrafts == 0 ) then
		CraftName:Hide();
		CraftRequirements:Hide();
		CraftIcon:Hide();
		CraftReagentLabel:Hide();
		CraftDescription:Hide();
		for i=1, MAX_CRAFT_REAGENTS, 1 do
			getglobal("CraftReagent"..i):Hide();
		end
		CraftDetailScrollFrameScrollBar:Hide();
		CraftDetailScrollFrameTop:Hide();
		CraftDetailScrollFrameBottom:Hide();
		CraftListScrollFrame:Hide();
		for i=1, CRAFTS_DISPLAYED, 1 do
			getglobal("Craft"..i):Hide();
		end
		CraftHighlightFrame:Hide();
		CraftRequirements:Hide();
		return;
	end
	-- If has crafts
	CraftName:Show();
	CraftRequirements:Show();
	CraftIcon:Show();
	CraftDescription:Show();
	CraftCollapseAllButton:Enable();
	
	-- ScrollFrame update
	FauxScrollFrame_Update(CraftListScrollFrame, numCrafts, CRAFTS_DISPLAYED, CRAFT_SKILL_HEIGHT, nil, nil, nil, CraftHighlightFrame, 293, 316 );
	
	CraftHighlightFrame:Hide();
	
	local craftIndex, craftName, craftButton, craftButtonSubText, craftButtonCost;
	for i=1, CRAFTS_DISPLAYED, 1 do

      -- loop until you find something that is not filtered out
      repeat
        craftIndex = i + craftOffset;
        craftOffset = craftOffset + 1;
      until ((craftIndex > numCrafts) or not Pinky_FilterP(craftIndex, PINKY_CRAFT, p_player));

      -- correct the offset
      craftOffset = craftOffset - 1;
	
		craftName, craftSubSpellName, craftType, numAvailable, isExpanded, trainingPointCost, requiredLevel = GetCraftInfo(craftIndex);
		craftButton = getglobal("Craft"..i);
		craftButtonSubText = getglobal("Craft"..i.."SubText");
		craftButtonCost = getglobal("Craft"..i.."Cost");
		if ( craftIndex <= numCrafts ) then	
			-- Set button widths if scrollbar is shown or hidden
			if ( CraftListScrollFrame:IsVisible() ) then
				craftButton:SetWidth(293);
			else
				craftButton:SetWidth(323);
			end
			local color = CraftTypeColor[craftType];
			local subColor = CraftSubTypeColor[craftType];
			craftButton:SetTextColor(color.r, color.g, color.b);
			craftButton.r = color.r;
			craftButton.g = color.g;
			craftButton.b = color.b;
			craftButtonCost:SetTextColor(color.r, color.g, color.b);
			craftButtonSubText:SetTextColor(color.r, color.g, color.b);
			craftButton:SetID(craftIndex);
			craftButton:Show();
			-- Handle headers
			if ( craftType == "header" ) then
				craftButton:SetText(craftName);
				craftButtonSubText:SetText("");
				if ( isExpanded ) then
					craftButton:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up");
				else
					craftButton:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up");
				end
				getglobal("Craft"..i.."Highlight"):SetTexture("Interface\\Buttons\\UI-PlusButton-Hilight");
				getglobal("Craft"..i):UnlockHighlight();
			else
				craftButton:SetNormalTexture("");
				getglobal("Craft"..i.."Highlight"):SetTexture("");

            -- Pinky: output more information about what can be crafted
	
             if ( name == nil ) then 
              if ( numAvailable == 0 ) then
				    craftButton:SetText(" "..craftName);
				  else
					 craftButton:SetText(" "..craftName.." ["..numAvailable.."]");
				  end;
            else
              craftButton:SetText(Pinky_TradeSkillText(craftIndex, craftName, PINKY_CRAFT, p_player));
            end;
		
				if ( craftSubSpellName ~= "" ) then
					craftButtonSubText:SetText(format(TEXT(PARENS_TEMPLATE), craftSubSpellName));
				else 
					craftButtonSubText:SetText("");
				end
				if ( trainingPointCost > 0 ) then
					craftButtonCost:SetText(format(TRAINER_LIST_TP, trainingPointCost));
				else
					craftButtonCost:SetText("");
				end
				craftButtonSubText:SetPoint("LEFT", "Craft"..i.."Text", "RIGHT", 10, 0);
				-- Place the highlight and lock the highlight state
				if ( GetCraftSelectionIndex() == craftIndex ) then
					CraftHighlightFrame:SetPoint("TOPLEFT", "Craft"..i, "TOPLEFT", 0, 0);
					CraftHighlightFrame:Show();
					craftButtonSubText:SetTextColor(1.0, 1.0, 1.0);
					craftButtonCost:SetTextColor(1.0, 1.0, 1.0);
					getglobal("Craft"..i):LockHighlight();
				else
					getglobal("Craft"..i):UnlockHighlight();
				end
			end
			
		else
			craftButton:Hide();
		end
	end
	
	-- If player has training points show them here
	Craft_UpdateTrainingPoints();

	-- Set the expand/collapse all button texture
	-- local numHeaders = 0;
	-- local notExpanded = 0;
        local showCollapseButton = true;
        local hasHeaders = false;
        -- PINKY: fixed bug in base Blizzard code, over indexing trade skill index (need to substract craftOffset)
	for i=1, numCrafts-craftOffset, 1 do
		local index = i + craftOffset;
		local craftName, craftSubSpellName, craftType, numAvailable, isExpanded = GetCraftInfo(index);
		if ( craftName and craftType == "header" ) then
			-- numHeaders = numHeaders + 1;
			-- if ( not isExpanded ) then
			--	notExpanded = notExpanded + 1;
			-- end
                        -- PINKY: fixed bug in base Blizzard code, exit out when you know the answer
                        hasHeaders = true;
                        if (isExpanded) then
                          showCollapseButton = false;
                          break;
                        end;
		end
	end
	-- If all headers are not expanded then show collapse button, otherwise show the expand button
	-- if ( notExpanded ~= numHeaders ) then
        if (not showCollapseButton) then
		CraftCollapseAllButton.collapsed = nil;
		CraftCollapseAllButton:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up");
	else
		CraftCollapseAllButton.collapsed = 1;
		CraftCollapseAllButton:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up");
	end


end

function ETS_DoOnClickCraft()
  Pinky_DebugMessage("click noticed");
    if ( IsCtrlKeyDown() and ChatFrameEditBox:IsVisible()) then
        ETS_PrintMats(this:GetName(), GetCraftSelectionIndex());
    elseif ( IsShiftKeyDown() and ChatFrameEditBox:IsVisible() ) then
        local link = GetCraftItemLink(GetCraftSelectionIndex())
        if ( link ) then
            ChatFrameEditBox:Insert(link);
        end
    end
end

function CraftFrame_SetSelection(id)
	if ( not id ) then
		return;
	end
	local craftName, craftSubSpellName, craftType, numAvailable, isExpanded, trainingPointCost, requiredLevel = GetCraftInfo(id);
	CraftHighlightFrame:Show();
	-- If the type of the selection is header, don't process all the craft details
	if ( craftType == "header" ) then
		CraftHighlightFrame:Hide();
		if ( isExpanded ) then
			CollapseCraftSkillLine(id);
		else
			ExpandCraftSkillLine(id);
		end
		return;
	end
	SelectCraft(id);
	if ( GetCraftSelectionIndex() > GetNumCrafts() ) then
		return;
	end
	local color = CraftTypeColor[craftType];
	CraftHighlight:SetVertexColor(color.r, color.g, color.b);

-- lets try patch over the reagents 
  local p_player = Pinky_GetPlayerName();
  local totalCraftItems = Pinky_GetTotalCount(p_player, craftName);

 if (totalCraftItems > 0) then
    local invCraftItems = Pinky_GetInventoryCount(craftName);
Pinky_DebugMessage(invCraftItems.."  -  "..totalCraftItems);
        CraftName:SetText(craftName.." ["..invCraftItems.."/"..totalCraftItems.."]");
  else
	CraftName:SetText(craftName);
  end

	-- General Info
	CraftIcon:SetNormalTexture(GetCraftIcon(id));
	
	if ( GetCraftDescription(id) ) then
		CraftDescription:SetText(GetCraftDescription(id));
		CraftReagentLabel:SetPoint("TOPLEFT", "CraftDescription", "BOTTOMLEFT", 0, -10);
	else
		CraftDescription:SetText(" ");
		CraftReagentLabel:SetPoint("TOPLEFT", "CraftDescription", "TOPLEFT", 0, 0);
	end
	
	
	-- Reagents
	local creatable = 1;
	local numReagents = GetCraftNumReagents(id);
	
	for i=1, numReagents, 1 do
		local reagentName, reagentTexture, reagentCount, playerReagentCount = GetCraftReagentInfo(id, i);
		local reagent = getglobal("CraftReagent"..i)
		local name = getglobal("CraftReagent"..i.."Name");
		local count = getglobal("CraftReagent"..i.."Count");
		if ( not reagentName or not reagentTexture ) then
			reagent:Hide();
		else
			reagent:Show();
			SetItemButtonTexture(reagent, reagentTexture);
-- now for the bank stuff			
            local totalReagents = Pinky_GetTotalCount(p_player, reagentName);
              		name:SetFont(GameFontNormal:GetFont(), 11, "OUTLINE");
			name:SetText(reagentName.." ["..totalReagents.."]");
			name:SetWidth(103);
			-- Grayout items
			if ( playerReagentCount < reagentCount ) then
				SetItemButtonTextureVertexColor(reagent, GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
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
	
	if ( numReagents > 0 ) then
		CraftReagentLabel:Show();
	else
		CraftReagentLabel:Hide();
	end
	for i=numReagents + 1, MAX_CRAFT_REAGENTS, 1 do
		getglobal("CraftReagent"..i):Hide();
	end

	local requiredTotems = BuildColoredListString(GetCraftSpellFocus(id));
	if ( requiredTotems ) then
		CraftRequirements:SetText(REQUIRES_LABEL.." "..requiredTotems);
	elseif ( requiredLevel and requiredLevel > 0 ) then
		if ( UnitLevel("pet") >= requiredLevel ) then
			CraftRequirements:SetText(REQUIRES_LABEL.." "..format(TRAINER_PET_LEVEL, requiredLevel));
		else
			CraftRequirements:SetText(REQUIRES_LABEL.." "..format(TRAINER_PET_LEVEL_RED, requiredLevel));
		end
	else
		CraftRequirements:SetText("");
	end

	if ( trainingPointCost > 0 ) then
		local totalPoints, spent = GetPetTrainingPoints();
		local usablePoints = totalPoints - spent;
		if ( usablePoints >= trainingPointCost ) then
			CraftCost:SetText(COSTS_LABEL.." "..trainingPointCost.." "..TRAINING_POINTS_LABEL);
		else
			CraftCost:SetText(COSTS_LABEL.." "..RED_FONT_COLOR_CODE..trainingPointCost..FONT_COLOR_CODE_CLOSE.." "..TRAINING_POINTS_LABEL);
		end
		
		CraftCost:Show();
	else
		CraftCost:Hide();
	end

	if ( craftType == "used" ) then
		creatable = nil;
	end

	if ( creatable ) then
		CraftCreateButton:Enable();
	else
		CraftCreateButton:Disable();
	end
	CraftDetailScrollFrame:UpdateScrollChildRect();
	-- Show or hide scrollbar
	if ((CraftDetailScrollFrameScrollBarScrollUpButton:IsEnabled() == 0) and (CraftDetailScrollFrameScrollBarScrollDownButton:IsEnabled() == 0) ) then
		CraftDetailScrollFrameScrollBar:Hide();
		CraftDetailScrollFrameTop:Hide();
		CraftDetailScrollFrameBottom:Hide();
	else
		CraftDetailScrollFrameScrollBar:Show();
		CraftDetailScrollFrameTop:Show();
		CraftDetailScrollFrameBottom:Show();
	end
end
