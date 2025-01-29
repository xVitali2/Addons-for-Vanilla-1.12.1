-- extra info on GameTooltip and ItemRefTooltip
local AtlasLootTip = CreateFrame("Frame", "AtlasLootTip", GameTooltip)

local GREY = "|cff999999"

local lastSearchName = nil
local lastSearchID = nil
local function GetItemIDByName(name)
	if name ~= lastSearchName then
    	for itemID = 1, 99999 do
      		local itemName = GetItemInfo(itemID)
      		if (itemName and itemName == name) then
        		lastSearchID = itemID
				break
     		end
    	end
		lastSearchName = name
  	end
	return lastSearchID
end

local HookSetItemRef = SetItemRef
SetItemRef = function(link, text, button)
    local item, _, id = string.find(link, "item:(%d+)")
	ItemRefTooltip.itemID = id
    HookSetItemRef(link, text, button)
    if not IsShiftKeyDown() and not IsControlKeyDown() and item then
        AtlasLootTip.extendTooltip(ItemRefTooltip)
    end
end

local HookSetHyperlink = GameTooltip.SetHyperlink
function GameTooltip.SetHyperlink(self, arg1)
  if arg1 then
    local _, _, linktype = string.find(arg1, "^(.-):(.+)$")
    if linktype == "item" then
        local _, _, id = string.find(arg1,"item:(%d+)")
  		GameTooltip.itemID = id
    end
  end
  return HookSetHyperlink(self, arg1)
end

local HookSetBagItem = GameTooltip.SetBagItem
function GameTooltip.SetBagItem(self, container, slot)
	if GetContainerItemLink(container, slot) then
		local _, _, id = string.find(GetContainerItemLink(container, slot),"item:(%d+)")
		GameTooltip.itemID = id
	end
  return HookSetBagItem(self, container, slot)
end

local HookSetInboxItem = GameTooltip.SetInboxItem
function GameTooltip.SetInboxItem(self, mailID, attachmentIndex)
	local itemName = GetInboxItem(mailID)
	if itemName then
		GameTooltip.itemID = GetItemIDByName(itemName)
	end
	return HookSetInboxItem(self, mailID, attachmentIndex)
end

local HookSetInventoryItem = GameTooltip.SetInventoryItem
function GameTooltip.SetInventoryItem(self, unit, slot)
	if GetInventoryItemLink(unit, slot) then
		local _, _, id = string.find(GetInventoryItemLink(unit, slot),"item:(%d+)")
		GameTooltip.itemID = id
	end
	return HookSetInventoryItem(self, unit, slot)
end

local HookSetCraftItem = GameTooltip.SetCraftItem
function GameTooltip.SetCraftItem(self, skill, slot)
	if GetCraftReagentItemLink(skill, slot) then
		local _, _, id = string.find(GetCraftReagentItemLink(skill, slot),"item:(%d+)")
		GameTooltip.itemID = id
	end
	return HookSetCraftItem(self, skill, slot)
end

local HookSetTradeSkillItem = GameTooltip.SetTradeSkillItem
function GameTooltip.SetTradeSkillItem(self, skillIndex, reagentIndex)
	if reagentIndex then
		if GetTradeSkillReagentItemLink(skillIndex, reagentIndex) then
			local _, _, id = string.find(GetTradeSkillReagentItemLink(skillIndex, reagentIndex),"item:(%d+)")
			GameTooltip.itemID = id
		end
	else
		if GetTradeSkillItemLink(skillIndex) then
			local _, _, id = string.find(GetTradeSkillItemLink(skillIndex),"item:(%d+)")
			GameTooltip.itemID = id
		end
	end
	return HookSetTradeSkillItem(self, skillIndex, reagentIndex)
end

local HookSetAuctionItem = GameTooltip.SetAuctionItem
function GameTooltip.SetAuctionItem(self, atype, index)
	local itemName = GetAuctionItemInfo(atype, index)
	if itemName then
		GameTooltip.itemID = GetItemIDByName(itemName)
	end
	return HookSetAuctionItem(self, atype, index)
end

local HookSetAuctionSellItem = GameTooltip.SetAuctionSellItem
function GameTooltip.SetAuctionSellItem(self)
	local itemName = GetAuctionSellItemInfo()
	if itemName then
		GameTooltip.itemID = GetItemIDByName(itemName)
	end
	return HookSetAuctionSellItem(self)
end

local HookSetTradePlayerItem = GameTooltip.SetTradePlayerItem
function GameTooltip.SetTradePlayerItem(self, index)
	if GetTradePlayerItemLink(index) then
		local _, _, id = string.find(GetTradePlayerItemLink(index),"item:(%d+)")
		GameTooltip.itemID = id
	end
	return HookSetTradePlayerItem(self, index)
end

local HookSetTradeTargetItem = GameTooltip.SetTradeTargetItem
function GameTooltip.SetTradeTargetItem(self, index)
	if GetTradeTargetItemLink(index) then
		local _, _, id = string.find(GetTradeTargetItemLink(index),"item:(%d+)")
		GameTooltip.itemID = id
	end
	return HookSetTradeTargetItem(self, index)
end

local sets = {
	["SpiritofEskhandar"]=true,
	["HakkariBlades"]=true,
	["PrimalBlessing"]=true,
	["ShardOfGods"]=true,
	["DalRend"]=true,
	["SpiderKiss"]=true,
	["UnobMounts"]=true,
	["Legendaries"]=true,
	["Artifacts"]=true,
	["ZGRings"]=true,
	["Tabards"]=true,
}

local function SetContains(set, key)
	if not set or not key then
		return false
	end
	return set[key] ~= nil
end

local lastItemID, lastSourceStr, lastDropRate
function AtlasLootTip.extendTooltip(tooltip)
	if AtlasLootCharDB.ShowSource ~= true or IsShiftKeyDown() then
		return
	end
	local strfind = string.find
	local pairs = pairs
	local tooltipName = tooltip:GetName()
	local originalTooltip = {}
    local itemName = getglobal(tooltipName .. "TextLeft1"):GetText()
	local line2 = getglobal(tooltipName .. "TextLeft2")
	local craftSpell, source, sourceStr, dropRate
	local isCraft, isWBLoot, isPvP, isRepReward, isSetPiece, isWorldEvent = false, false, false, false, false, false
	local itemID = tonumber(tooltip.itemID)
	if itemName and itemName ~= "Fashion Coin" and itemID then
		if itemID ~= lastItemID then
			for row = 1, 30 do
				local tooltipRowLeft = getglobal(tooltipName .. 'TextLeft' .. row)
				if tooltipRowLeft then
					local rowtext = tooltipRowLeft:GetText()
					if rowtext then
						originalTooltip[row] = {}
						originalTooltip[row].text = rowtext
					end
				end
			end
			for row=1, table.getn(originalTooltip) do
				if strfind(originalTooltip[row].text, "—",1,true) then -- skip items that state which rep they require
					return
				end
			end
			-- first check if its craftable item
			for k,v in pairs(GetSpellInfoAtlasLootDB["craftspells"]) do
				if v["craftItem"] == itemID then
					craftSpell = "s"..tostring(k)
					break
				end
			end
			for k, v in pairs(GetSpellInfoAtlasLootDB["enchants"]) do
				if v["item"] and v["item"] == itemID then
					craftSpell = "e"..tostring(k)
					break
				end
			end
			for k1, v1 in pairs(AtlasLoot_Data["AtlasLootCrafting"]) do
				if source then
					break
				end
				for k2, v2 in pairs(AtlasLoot_Data["AtlasLootCrafting"][k1]) do
					if v2[1] ~= 0 and v2[1] ~= "" --[[and string.sub(v2[1], 1, 1) ~= "e"]] then
						if (v2[1] == craftSpell or v2[1] == itemID) and
							(strfind(k1, "Apprentice", 1, true) or
								strfind(k1, "Journeyman", 1, true) or
								strfind(k1, "Expert", 1, true) or
								strfind(k1, "Artisan", 1, true) or
								strfind(k1, "Goblin", 1, true) or
								strfind(k1, "Gnomish", 1, true) or
								strfind(k1, "Survival", 1, true) or
								strfind(k1, "Herbalism", 1, true) or
								strfind(k1, "FirstAid", 1, true) or
								strfind(k1, "Poisons", 1, true) or
								strfind(k1, "Mining", 1, true) or
								strfind(k1, "Smelting", 1, true) or
								strfind(k1, "Elemental", 1, true) or
								strfind(k1, "Tribal", 1, true) or
								strfind(k1, "Dragonscale", 1, true) or
								strfind(k1, "Weaponsmith", 1, true) or
								strfind(k1, "Axesmith", 1, true) or
								strfind(k1, "Hammersmith", 1, true) or
								strfind(k1, "Swordsmith", 1, true) or
								strfind(k1, "Armorsmith", 1, true) or
								strfind(k1, "Gemology", 1, true) or
								strfind(k1, "Goldsmithing", 1, true))
						then
							source = k1
							isCraft = true
							lastDropRate = nil
							-- if strfind(k1, "Apprentice", 1, true) then
							-- 	dropRate = "1-75"
							-- 	lastDropRate = dropRate
							-- elseif strfind(k1, "Journeyman", 1, true) then
							-- 	dropRate = "75-150"
							-- 	lastDropRate = dropRate
							-- elseif strfind(k1, "Expert", 1, true) then
							-- 	dropRate = "150-225"
							-- 	lastDropRate = dropRate
							-- elseif strfind(k1, "Artisan", 1, true) then
							-- 	dropRate = "225-300"
							-- 	lastDropRate = dropRate
							-- end
							break
						end
					end
				end
			end
			-- check if its world boss loot
			if not isCraft then
                for k1,v1 in pairs(AtlasLoot_Data["AtlasLootWBItems"]) do
					if source then
						break
					end
					for k2,v2 in pairs(AtlasLoot_Data["AtlasLootWBItems"][k1]) do
						if v2[1] == itemID then
							source = k1
							isWBLoot = true
                            if v2[5] and v2[5] ~= "" then
                                dropRate = v2[5]
                                lastDropRate = dropRate
                            else
                                lastDropRate = nil
                            end
							break
						end
					end
				end
			end
            -- check if its a pvp reward
            if not isCraft and not isWBLoot then
                for k1,v1 in pairs(AtlasLoot_Data["AtlasLootGeneralPvPItems"]) do
					if source then
						break
					end
					for k2,v2 in pairs(AtlasLoot_Data["AtlasLootGeneralPvPItems"][k1]) do
						if v2[1] == itemID then
							source = k1
							isPvP = true
                            lastDropRate = nil
							break
						end
					end
				end
            end
            -- check if its a rep reward
			-- bgs
            if not isCraft and not isWBLoot and not isPvP then
                for k1,v1 in pairs(AtlasLoot_Data["AtlasLootBGItems"]) do
					if source then
						break
					end
					for k2,v2 in pairs(AtlasLoot_Data["AtlasLootBGItems"][k1]) do
						if v2[1] == itemID then
							source = k1
							isRepReward = true
							if v2[5] and v2[5] ~= "" then
								dropRate = v2[5]
								lastDropRate = dropRate
							else
								lastDropRate = nil
							end
							break
						end
					end
				end
				-- factions
                for k1,v1 in pairs(AtlasLoot_Data["AtlasLootRepItems"]) do
					if source then
						break
					end
					for k2,v2 in pairs(AtlasLoot_Data["AtlasLootRepItems"][k1]) do
						if v2[1] == itemID then
							source = k1
							isRepReward = true
							if v2[5] and v2[5] ~= "" --[[and source ~= "Darkmoon" and not strfind(source, "Cenarion",1,true)]] then
								dropRate = v2[5]
								lastDropRate = dropRate
							else
								lastDropRate = nil
							end
							break
						end
					end
				end
            end
            -- check if its a set piece
			if not isCraft and not isWBLoot and not isPvP and not isRepReward then
				for k1,v1 in pairs(AtlasLoot_Data["AtlasLootSetItems"]) do
					if source then
						break
					end
					for k2,v2 in pairs(AtlasLoot_Data["AtlasLootSetItems"][k1]) do
						if v2[1] == itemID then
							source = k1
							isSetPiece = true
							if (SetContains(sets, source) or strfind(source, "WorldEpics",1,true)) then
								source = nil
								isSetPiece = false
							end
							lastDropRate = nil
							break
						end
					end
				end
			end
			-- check world events
			if not isCraft and not isWBLoot and not isPvP and not isRepReward and not isSetPiece then
				for k1,v1 in pairs(AtlasLoot_Data["AtlasLootWorldEvents"]) do
					if source then
						break
					end
					for k2,v2 in pairs(AtlasLoot_Data["AtlasLootWorldEvents"][k1]) do
						if v2[1] == itemID then
							source = k1
							isWorldEvent = true
							if v2[5] and v2[5] ~= "" then
								dropRate = v2[5]
								lastDropRate = dropRate
							else
								lastDropRate = nil
							end
							break
						end
					end
				end
			end
            -- check if its a dungeon/raid loot
			if not isCraft and not isWBLoot and not isPvP and not isRepReward and not isWorldEvent and not isSetPiece then
				for k1,v1 in pairs(AtlasLoot_Data["AtlasLootItems"]) do
					if source then
						break
					end
					for k2,v2 in pairs(AtlasLoot_Data["AtlasLootItems"][k1]) do
						if v2[1] == itemID then
							if k1 ~= "VanillaKeys" then
								source = k1
							end
							if v2[5] and v2[5] ~= "" then
								dropRate = v2[5]
								lastDropRate = dropRate
							else
								lastDropRate = nil
							end
							break
						end
					end
				end
				-- check containers
				for k1,v1 in pairs(AtlasLoot_Data["AtlasLootItems"]) do
					if source then
						break
					end
					for k2,v2 in pairs(AtlasLoot_Data["AtlasLootItems"][k1]) do
						if source then
							break
						end
						if v2[16] then
							for i, n in pairs(v2[16]) do
								if source then
									break
								end
								for i2, n2 in pairs(v2[16][i]) do
									if v2[16][i][i2][1] == itemID then
										source = k1
										break
									end
								end
							end
						end
					end
				end
			end
			lastItemID = itemID
			if not source then
				lastSourceStr = nil
                return
			end
			for k,v in pairs(AtlasLoot_TableNames) do
				if k == source then
					sourceStr = AtlasLoot_TableNames[k][1]
					lastSourceStr = sourceStr
					break
				end
			end
			
			if not sourceStr then
				return
			end

			if line2 and line2:GetText() then
				if dropRate then
					line2:SetText(GREY..sourceStr.." ("..dropRate..")|r\n"..line2:GetText())
				else
					line2:SetText(GREY..sourceStr.."|r\n"..line2:GetText())
				end
			else
				if dropRate then
					tooltip:AddLine(GREY..sourceStr.." ("..dropRate..")|r")
				else
					tooltip:AddLine(GREY..sourceStr.."|r")
				end
			end
		elseif itemID == lastItemID then
			if lastSourceStr then
				if line2:GetText() then
					if lastDropRate then
						line2:SetText(GREY..lastSourceStr.." ("..lastDropRate..")|r\n"..line2:GetText())
					else
						line2:SetText(GREY..lastSourceStr.."|r\n"..line2:GetText())
					end
				else
					if lastDropRate then
						tooltip:AddLine(GREY..lastSourceStr.." ("..lastDropRate..")|r")
					else
						tooltip:AddLine(GREY..lastSourceStr.."|r")
					end
				end
			end
		end
	end
	tooltip:Show()
end

AtlasLootTip:SetScript("OnHide", function()
	GameTooltip.itemID = nil
	ItemRefTooltip.itemID = nil
end)

AtlasLootTip:SetScript("OnShow", function()
	if aux_frame and aux_frame:IsVisible() then
        if GetMouseFocus():GetParent() then
            if GetMouseFocus():GetParent().row then
                if GetMouseFocus():GetParent().row.record.item_id then
                    GameTooltip.itemID = GetMouseFocus():GetParent().row.record.item_id
                end
            end
        end
    end
	AtlasLootTip.extendTooltip(GameTooltip)
end)

-- adapted from http://shagu.org/ShaguTweaks/
AtlasLootTip.HookAddonOrVariable = function(addon, func)
    local lurker = CreateFrame("Frame", nil)
    lurker.func = func
    lurker:RegisterEvent("ADDON_LOADED")
    lurker:RegisterEvent("VARIABLES_LOADED")
    lurker:RegisterEvent("PLAYER_ENTERING_WORLD")
    lurker:SetScript("OnEvent",function()
		if IsAddOnLoaded(addon) or getglobal(addon) then
			this:func()
			this:UnregisterAllEvents()
		end
    end)
end

AtlasLootTip.HookAddonOrVariable("Tmog", function()
    local tmog = CreateFrame("Frame", nil, TmogTooltip)
    tmog:SetScript("OnShow", function()
        AtlasLootTip.extendTooltip(TmogTooltip)
    end)
end)
