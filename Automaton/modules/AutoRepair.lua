local abacus = AceLibrary("Abacus-2.0")
local L = AceLibrary("AceLocale-2.2"):new("Automaton_Repair")
Automaton_Repair = Automaton:NewModule("Repair", "AceEvent-2.0", "AceConsole-2.0", "AceDebug-2.0")

L:RegisterTranslations("enUS", function() return {
    ["Repair"] = true,
	["Automatically repair all inventory items when at merchant"] = true,
    ["Repairing all items for: %s"] = true,
} end)
L:RegisterTranslations("ruRU", function() return {
    ["Repair"] = "Починка",
	["Automatically repair all inventory items when at merchant"] = "Автоматически чинит все предметы в инвентаре.",
    ["Repairing all items for: %s"] = "Починены все предметы на: %s",
} end)
L:RegisterTranslations("koKR", function() return {
    ["Repair"] = "아이템 수리",
	["Automatically repair all inventory items when at merchant"] = "상인에게 모든 아이템을 자동으로 수리합니다.",
    ["Repairing all items for: %s"] = "모든 아이템 수리: %s",
} end)

Automaton.options.args.repair = {
	type = 'toggle',
	name = L["Repair"],
	desc = L["Automatically repair all inventory items when at merchant"],
	get = function() return Automaton:IsModuleActive("Repair") end,
	set = function(v) Automaton:ToggleModuleActive("Repair", v) end,
}

function Automaton_Repair:OnEnable()
	self:RegisterEvent("MERCHANT_SHOW")
end

function Automaton_Repair:MERCHANT_SHOW()
	if not CanMerchantRepair() then return end
	local repairCost = GetRepairAllCost()
	if repairCost > 0 then
		self:Print(L["Repairing all items for: %s"], abacus:FormatMoneyFull(repairCost, true))
		if not self:IsDebugging() then
			RepairAllItems()
		end
	end
end