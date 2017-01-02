function EngBags_Crafts()
		-- load craft info (Enchanting)
		if (GetNumCrafts() > 0) then
			local craftName, craftSubSpellName, craftType, numAvailable, isExpanded;
			local craftItemLink;
			local tradeskillName, currentLevel, maxLevel = GetCraftDisplaySkillLine();
			local a,b,c,d;
			local reagentItemLink;
			local tmpval, tmptooltip, idx, tmptooltip2;

			-- hunter training window shows up as a craft with a nil tradeskillName
			if (tradeskillName ~= nil) then

				if (EngBagsConfig[EngBags_PLAYERID] == nil) then
					EngBagsConfig[EngBags_PLAYERID] = {};
				end
				if (EngBagsConfig[EngBags_PLAYERID]["tradeskills"] == nil) then
					EngBagsConfig[EngBags_PLAYERID]["tradeskills"] = {};
				end
				EngBagsConfig[EngBags_PLAYERID]["tradeskills"][tradeskillName] = date("%y%m%d%H%M%S");
				EngBank_SetTradeSkills();
				if (EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"] == nil) then
					EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"] = {};
				end

				EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName] = {};	-- wipe it out, we're refreshing it now anyway

				if (GetNumCrafts() > 0) then
					for i = 1, GetNumCrafts() do
						craftName, craftSubSpellName, craftType, numAvailable, isExpanded = GetCraftInfo(i);
						craftItemLink = GetCraftItemLink(i);
						-- remember: a craft might just be a skill and not a physical item
						if ( (craftItemLink ~= nil) and (type(craftItemLink) == "string") ) then
							for a,b,c,d in string.gfind(craftItemLink, "(%d+):(%d+):(%d+):(%d+)") do
								craftItemLink = ""..a..":0:"..c..":0";
							end

							if ( EngBagsConfig[EngBags_PLAYERID]["tradeskill_production"][craftItemLink] == nil ) then
								EngBagsConfig[EngBags_PLAYERID]["tradeskill_production"][craftItemLink] = {};
							end
							EngBagsConfig[EngBags_PLAYERID]["tradeskill_production"][craftItemLink][tradeskillName] = 1;
						end

						-- build the complete info about tradeskills, this is for exporting data
						-- so now I store by craftName instead of craftItemLink
						if ( (EngBank_BuildTradeList[tradeskillName] == nil) and (EngBagsConfig["build_trade_list"] == 1) ) then
							EngBank_tt:SetCraftSpell(i);
							if (EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName][craftName] == nil) then
								EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName][craftName] = {};
							end
							EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName][craftName]["item"] = EngBags_ExtractTooltip("EngBank_tt");
						end

						if (GetCraftNumReagents(i) > 0) then
							for i2 = 1, GetCraftNumReagents(i) do
								reagentItemLink = GetCraftReagentItemLink(i,i2);
								if (reagentItemLink ~= nil) then
									for a,b,c,d in string.gfind(reagentItemLink, "(%d+):(%d+):(%d+):(%d+)") do
										reagentItemLink = ""..a..":0:"..c..":0";
									end						
									
									if (EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"][reagentItemLink] == nil) then
										EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"][reagentItemLink] = {};
									end
									EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"][reagentItemLink][tradeskillName] = 1;

									if ( (EngBank_BuildTradeList[tradeskillName] == nil) and (EngBagsConfig["build_trade_list"] == 1) ) then
										EngBank_tt:SetCraftItem(i,i2);
										EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName][craftName][reagentItemLink] = EngBags_ExtractTooltip("EngBank_tt");
										EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName][craftName][reagentItemLink]["n"],
										EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName][craftName][reagentItemLink]["t"],
										EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName][craftName][reagentItemLink]["c"] = GetCraftReagentInfo(i,i2);
									end
								end
							end
						end
					end
				end

				EngBank_BuildTradeList[tradeskillName] = 1;	-- only do the exhaustive load once
			end
		end
end

function EngBags_Trade()
		-- load tradeskill info (every other trade)
		if (GetNumTradeSkills() > 0) then
			local craftName, craftSubSpellName, craftType, numAvailable, isExpanded;
			local craftItemLink;
			local tradeskillName, currentLevel, maxLevel = GetTradeSkillLine();
			local a,b,c,d;
			local reagentItemLink;

			if (EngBagsConfig[EngBags_PLAYERID] == nil) then
				EngBagsConfig[EngBags_PLAYERID] = {};
			end
			if (EngBagsConfig[EngBags_PLAYERID]["tradeskills"] == nil) then
				EngBagsConfig[EngBags_PLAYERID]["tradeskills"] = {};
			end
			EngBagsConfig[EngBags_PLAYERID]["tradeskills"][tradeskillName] = date("%Y%m%d%H%M%S");
			EngBank_SetTradeSkills();
			if (EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"] == nil) then
				EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"] = {};
			end
			if (EngBagsConfig[EngBags_PLAYERID]["tradeskill_production"] == nil) then
				EngBagsConfig[EngBags_PLAYERID]["tradeskill_production"] = {};
			end

			EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName] = {};

			for i = 1, GetNumTradeSkills() do
				craftName, craftType, numAvailable, isExpanded = GetTradeSkillInfo(i);
				craftItemLink = GetTradeSkillItemLink(i);
				if (craftType ~= "header") then
					TradeSkillFrame_SetSelection(i)
					TradeSkillFrame_Update();

					if ( (craftItemLink ~= nil) and (type(craftItemLink) == "string") ) then
						for a,b,c,d in string.gfind(craftItemLink, "(%d+):(%d+):(%d+):(%d+)") do
							craftItemLink = ""..a..":0:"..c..":0";
						end

						if ( EngBagsConfig[EngBags_PLAYERID]["tradeskill_production"][craftItemLink] == nil ) then
							EngBagsConfig[EngBags_PLAYERID]["tradeskill_production"][craftItemLink] = {};
						end
						EngBagsConfig[EngBags_PLAYERID]["tradeskill_production"][craftItemLink][tradeskillName] = 1;

						-- build the complete info about tradeskills, this is for exporting data
						if ( (EngBank_BuildTradeList[tradeskillName] == nil) and (EngBagsConfig["build_trade_list"] == 1) ) then
							if (EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName][craftName] == nil) then
								EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName][craftName] = {};
							end
							EngBank_tt:SetTradeSkillItem(i);
							EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName][craftName]["item"] = EngBags_ExtractTooltip("EngBank_tt");
						end

						if (GetTradeSkillNumReagents(i) > 0) then
							for i2 = 1, GetTradeSkillNumReagents(i) do
								reagentItemLink = GetTradeSkillReagentItemLink(i,i2);
								if (reagentItemLink ~= nil) then
									for a,b,c,d in string.gfind(reagentItemLink, "(%d+):(%d+):(%d+):(%d+)") do
										reagentItemLink = ""..a..":0:"..c..":0";
									end						
									
									if (EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"][reagentItemLink] == nil) then
										EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"][reagentItemLink] = {};
									end
									EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"][reagentItemLink][tradeskillName] = 1;

									if ( (EngBank_BuildTradeList[tradeskillName] == nil) and (EngBagsConfig["build_trade_list"] == 1) ) then
										EngBank_tt:SetTradeSkillItem(i,i2);
										EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName][craftName][reagentItemLink] = EngBags_ExtractTooltip("EngBank_tt");
										EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName][craftName][reagentItemLink]["n"],
										EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName][craftName][reagentItemLink]["t"],
										EngBagsConfig[EngBags_PLAYERID]["trades"][tradeskillName][craftName][reagentItemLink]["c"] = GetTradeSkillReagentInfo(i,i2);
									end
								end
							end
						end
					end
				end
			end

			EngBank_BuildTradeList[tradeskillName] = 1;	-- only do the exhaustive load once
		end
end