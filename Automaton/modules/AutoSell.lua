--[[
  if there are any grey items you wish autosell to ignore, add them to the following table
  crochet hat and large slimy bones are examples, be sure not to include comment mark "--"
  in items which should actually be ignored.
--]]

local autosellIgnore = {
--		"Crochet Hat",
--		"Large Slimy Bone",
}

local gfind = string.gmatch or string.gfind
local L = AceLibrary("AceLocale-2.2"):new("Automaton_Sell")
Automaton_Sell = Automaton:NewModule("Sell", "AceEvent-2.0", "AceDebug-2.0")

L:RegisterTranslations("enUS", function() return {
    ["Sell"] = true,
	["Automatically sell all grey inventory items when at merchant"] = true,
} end)
L:RegisterTranslations("ruRU", function() return {
    ["Sell"] = "Продать",
	["Automatically sell all grey inventory items when at merchant"] = "Автоматически продает весь хлам в инвентаре.",
} end)
L:RegisterTranslations("koKR", function() return {
    ["Sell"] = "아이템 판매",
	["Automatically sell all grey inventory items when at merchant"] = "상인에게 자동으로 모든 회색 품목의 아이템을 판매합니다.",
} end)

Automaton.options.args.sell = {
	type = 'toggle',
	name = L["Sell"],
	desc = L["Automatically sell all grey inventory items when at merchant"],
	get = function() return Automaton:IsModuleActive("Sell") end,
	set = function(v) Automaton:ToggleModuleActive("Sell", v) end,
}

function Automaton_Sell:OnEnable()
	self:RegisterEvent("MERCHANT_SHOW")
end

function Automaton_Sell:MERCHANT_SHOW()
	for bag = 0, 4 do
		if GetContainerNumSlots(bag) > 0 then
			for slot = 0, GetContainerNumSlots(bag) do
				local texture, itemCount, locked, quality = GetContainerItemInfo(bag, slot)

				if quality == 0 or quality == -1 then
					local linkcolor = self:AutoSellProcessLink(GetContainerItemLink(bag, slot))
					if not self:IsDebugging() and linkcolor == 1 then
						PickupContainerItem(bag, slot)
						MerchantItemButton_OnClick("LeftButton")
					end
				end
			end
		end
	end
end

function Automaton_Sell:AutoSellProcessLink(link)
	local color, item, name
	--[[
	for color, item, name in gfind(link, "(|c%x+)|Hitem:(%d+:%d+:%d+:%d+:%d+:%d+:%d+:%d+)|h%[(.-)%]|h|r") do
		for k,v in pairs(autosellIgnore) do
			if name == v then
				return 0
			end
		end
	--]]
	for color, item, name in string.gfind(link, "(|c%x+)|Hitem:(%d+:%d+:%d+:%d+)|h%[(.-)%]|h|r") do
		for k,v in autosellIgnore do
			if name == v then
				return 0
			end
		end

		if color == ITEM_QUALITY_COLORS[0].hex then
			self:Debug(name)
			return 1
		end

		return 0
	end
end
