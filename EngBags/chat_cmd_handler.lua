
function EngBank_cmd(msg)

	local cmd, params = EngBags_SplitSpace(msg);
	local param2;
	
	cmd = string.lower(cmd);

	if (cmd == "hide") then
		EngBank_frame:Hide();
	elseif (cmd == "show") then
		EngBank_frame:Show();
	elseif (cmd == "update") then
		-- force window update
		EngBank_window_update_required = EngBank_MANDATORY;
		EngBank_UpdateWindow();
	elseif (cmd == "display") then
		-- Debugging - display item cache
		EngBank_UpdateInventoryCache();
		EngBank_DisplayItemCache();
	elseif (cmd == "checkhooks") then
		EngBank_RegisterHooks(EngBank_HOOKS_CHECK);
	elseif (cmd == "debug") then
		if (EngBank_DEBUGMESSAGES == 0) then
			EngBank_DEBUGMESSAGES = 1;
			EngBags_Print("EngBank: Debugging messages on.");
		else
			EngBank_DEBUGMESSAGES = 0;
			EngBags_Print("EngBank: Debugging messages off.");
		end
	elseif (cmd == "lock") then
		EngBankConfig["moveLock"] = 0;
		EngBank_Button_MoveLockToggle:SetText(EBLocal["EngBank_Button_MoveLock_locked"]);
	elseif (cmd == "unlock") then
		EngBankConfig["moveLock"] = 1;
		EngBank_Button_MoveLockToggle:SetText(EBLocal["EngBank_Button_MoveLock_unlocked"]);
	elseif (cmd == "scale") then
		EngBagsConfig["frameWindowScale"] = tonumber(params);
		EngBank_SetDefaultValues(0);
		EngBank_window_update_required = EngBank_MANDATORY;
		EngBank_UpdateWindow();
		EngBags_Print("Window scale set to: "..EngBagsConfig["frameWindowScale"]);
	elseif (cmd == "set") then
		if (params == "") then
			EngBags_Print("Current settings:", 1.0,0.5,0.5);
			for key,value in EngBankConfig do
				if (not string.find(key, "__version")) then
					EngBags_Print(" "..key.." = "..value);
				end
			end
		else
			params, param2 = EngBank_SplitSpace(params);

			if ( (EngBankConfig[params] ~= nil) and (param2 ~= nil) ) then
				EngBankConfig[params] = param2;
				EngBags_Print(params.." set to '"..param2.."'", 0,1,0.5);
				EngBank_window_update_required = EngBank_MANDATORY;
				EngBank_UpdateWindow();
			else
				EngBags_Print("Invalid variable or value.  (Variables are case sensitive)", 1,0.2,0.2);
			end
		end
	elseif (cmd == "resetdefaults") then
		EngBankConfig = {};
		EngBank_SetDefaultValues(1);
		EngBags_Print("Default values loaded..");
		EngBags_Print("If you are resetting defaults because the mod wasn't running, you might have to reload your UI to make it work again.  Try /console reloadui", 1,0.2,0.2);
	elseif (cmd == "config") then
		EngBank_OptsFrame:Show();
	elseif (cmd == "test") then
		-- development test stuff
		local skillName, isHeader, isExpanded, skillRank, numTempPoints, skillModifier, skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType;
		local i, i2;
		local skillType, numAvailable, isExpanded, tmp, tmp2;
		local reagentName, reagentTexture, reagentCount, playerReagentCount;
		local craftName, craftSubSpellName, craftType;
		--[[
		for i = 1, GetNumSkillLines() do
			skillName, isHeader, isExpanded, skillRank, numTempPoints, skillModifier, skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType = GetSkillLineInfo(i);
			if (isHeader) then
				EngBags_Print(skillName, 1,0,0);
			else
				EngBags_Print(skillName, 0,1,1);
			end
		end
		--]]

		--[[
		if (GetNumTradeSkills() > 0) then
			for i = 1, GetNumTradeSkills() do
				skillName, skillType, numAvailable, isExpanded = GetTradeSkillInfo(i);

				--Print("|cFFFF007F"..skillType.."|r = "..skillName..", |cFF007FFF"..numAvailable.."|r");

				if (skillType ~= "header") then
					--tmp = GetTradeSkillTools(i);
					Print( GetTradeSkillItemLink(i) );

					if (GetTradeSkillNumReagents(i) > 0) then
						for i2 = 1, GetTradeSkillNumReagents(i) do
							reagentName, reagentTexture, reagentCount, playerReagentCount = GetTradeSkillReagentInfo(i, i2);
							Print( "--> "..GetTradeSkillReagentItemLink(i,i2)..", "..reagentCount );
						end
					end
				end
			end

			local tradeskillName, currentLevel, maxLevel = GetTradeSkillLine();
			
			Print( tradeskillName..", "..currentLevel..", "..maxLevel );
		end --]]

		if (GetNumCrafts() > 0) then
			for i = 1, GetNumCrafts() do
				craftName, craftSubSpellName, craftType, numAvailable, isExpanded = GetCraftInfo(i);

				Print("|cFFFF007F"..craftType.."|r = "..craftName..", |cFF007FFF"..craftSubSpellName..", "..numAvailable.."|r");
				if (GetCraftNumReagents(i) > 0) then
					for i2 = 1, GetCraftNumReagents(i) do
						reagentName, reagentTexture, reagentCount, playerReagentCount = GetCraftReagentInfo(i, i2);
						Print( "--> "..GetCraftReagentItemLink(i,i2)..", "..reagentCount );
					end
				end
			end

			local tradeskillName, currentLevel, maxLevel = GetCraftDisplaySkillLine();
			Print( tradeskillName..", "..currentLevel..", "..maxLevel );
		end
	else
		for key,value in EngBank_HELP[ EILocal["help_text"] ] do
			EngBags_Print(string.gsub(value, "\r", ""));
		end
	end

end



function EngInventory_cmd(msg)

	local cmd, params = EngBags_SplitSpace(msg);
	local param2;
	
	cmd = string.lower(cmd);

	if (cmd == "hide") then
		EngInventory_frame:Hide();
	elseif (cmd == "show") then
		EngInventory_frame:Show();
	elseif (cmd == "update") then
		-- force window update
		EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
		EngInventory_UpdateWindow();
	elseif (cmd == "display") then
		-- Debugging - display item cache
		EngInventory_UpdateInventoryCache();
		EngInventory_DisplayItemCache();
	elseif (cmd == "checkhooks") then
		EngInventory_RegisterHooks(ENGINVENTORY_HOOKS_CHECK);
	elseif (cmd == "debug") then
		if (ENGINVENTORY_DEBUGMESSAGES == 0) then
			ENGINVENTORY_DEBUGMESSAGES = 1;
			EngBags_Print("EngInventory: Debugging messages on.");
		else
			ENGINVENTORY_DEBUGMESSAGES = 0;
			EngBags_Print("EngInventory: Debugging messages off.");
		end
	elseif (cmd == "lock") then
		EngInventoryConfig["moveLock"] = 0;
		EngInventory_Button_MoveLockToggle:SetText(EILocal["EngInventory_Button_MoveLock_locked"]);
	elseif (cmd == "unlock") then
		EngInventoryConfig["moveLock"] = 1;
		EngInventory_Button_MoveLockToggle:SetText(EILocal["EngInventory_Button_MoveLock_unlocked"]);
	elseif (cmd == "scale") then
		EngBagsConfig["frameWindowScale"] = tonumber(params);
		EngInventory_SetDefaultValues(0);
		EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
		EngInventory_UpdateWindow();
		EngBags_Print("Window scale set to: "..EngBagsConfig["frameWindowScale"]);
	elseif (cmd == "set") then
		if (params == "") then
			EngBags_Print("Current settings:", 1.0,0.5,0.5);
			for key,value in EngInventoryConfig do
				if (not string.find(key, "__version")) then
					EngBags_Print(" "..key.." = "..value);
				end
			end
		else
			params, param2 = EngInventory_SplitSpace(params);

			if ( (EngInventoryConfig[params] ~= nil) and (param2 ~= nil) ) then
				EngInventoryConfig[params] = param2;
				EngBags_Print(params.." set to '"..param2.."'", 0,1,0.5);
				EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
				EngInventory_UpdateWindow();
			else
				EngBags_Print("Invalid variable or value.  (Variables are case sensitive)", 1,0.2,0.2);
			end
		end
	elseif (cmd == "resetdefaults") then
		EngInventoryConfig = {};
		EngInventory_SetDefaultValues(1);
		EngBags_Print("Default values loaded..");
		EngBags_Print("If you are resetting defaults because the mod wasn't running, you might have to reload your UI to make it work again.  Try /console reloadui", 1,0.2,0.2);
	elseif (cmd == "config") then
		EngInventory_OptsFrame:Show();
	elseif (cmd == "test") then
		-- development test stuff
		local skillName, isHeader, isExpanded, skillRank, numTempPoints, skillModifier, skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType;
		local i, i2;
		local skillType, numAvailable, isExpanded, tmp, tmp2;
		local reagentName, reagentTexture, reagentCount, playerReagentCount;
		local craftName, craftSubSpellName, craftType;
		--[[
		for i = 1, GetNumSkillLines() do
			skillName, isHeader, isExpanded, skillRank, numTempPoints, skillModifier, skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType = GetSkillLineInfo(i);
			if (isHeader) then
				EngBags_Print(skillName, 1,0,0);
			else
				EngBags_Print(skillName, 0,1,1);
			end
		end
		--]]

		--[[
		if (GetNumTradeSkills() > 0) then
			for i = 1, GetNumTradeSkills() do
				skillName, skillType, numAvailable, isExpanded = GetTradeSkillInfo(i);

				--Print("|cFFFF007F"..skillType.."|r = "..skillName..", |cFF007FFF"..numAvailable.."|r");

				if (skillType ~= "header") then
					--tmp = GetTradeSkillTools(i);
					Print( GetTradeSkillItemLink(i) );

					if (GetTradeSkillNumReagents(i) > 0) then
						for i2 = 1, GetTradeSkillNumReagents(i) do
							reagentName, reagentTexture, reagentCount, playerReagentCount = GetTradeSkillReagentInfo(i, i2);
							Print( "--> "..GetTradeSkillReagentItemLink(i,i2)..", "..reagentCount );
						end
					end
				end
			end

			local tradeskillName, currentLevel, maxLevel = GetTradeSkillLine();
			
			Print( tradeskillName..", "..currentLevel..", "..maxLevel );
		end --]]

		if (GetNumCrafts() > 0) then
			for i = 1, GetNumCrafts() do
				craftName, craftSubSpellName, craftType, numAvailable, isExpanded = GetCraftInfo(i);

				Print("|cFFFF007F"..craftType.."|r = "..craftName..", |cFF007FFF"..craftSubSpellName..", "..numAvailable.."|r");
				if (GetCraftNumReagents(i) > 0) then
					for i2 = 1, GetCraftNumReagents(i) do
						reagentName, reagentTexture, reagentCount, playerReagentCount = GetCraftReagentInfo(i, i2);
						Print( "--> "..GetCraftReagentItemLink(i,i2)..", "..reagentCount );
					end
				end
			end

			local tradeskillName, currentLevel, maxLevel = GetCraftDisplaySkillLine();
			Print( tradeskillName..", "..currentLevel..", "..maxLevel );
		end
	else
		for key,value in ENGINVENTORY_HELP[ EILocal["help_text"] ] do
			EngBags_Print(string.gsub(value, "\r", ""));
		end
	end

end
