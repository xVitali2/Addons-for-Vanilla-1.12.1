local L = AceLibrary("AceLocale-2.2"):new("Automaton_Plates")
Automaton_Plates = Automaton:NewModule("Plates", "AceEvent-2.0", "AceDebug-2.0")

L:RegisterTranslations("enUS", function() return {
	["Plates"] = true,
	["Shows name plates in combat."] = true,
} end)
L:RegisterTranslations("ruRU", function() return {
	["Plates"] = "Таблички",
	["Shows name plates in combat."] = "Показывать таблички с именем в бою.",
} end)
L:RegisterTranslations("koKR", function() return {
	["Plates"] = "이름표 표시",
	["Shows name plates in combat."] = "전투상태시 이름을 표시합니다.",
} end)



Automaton.options.args.plates = {
	type = 'toggle',
	name = L["Plates"],
	desc = L["Shows name plates in combat."],
	get = function() return Automaton:IsModuleActive("Plates") end,
	set = function(v) Automaton:ToggleModuleActive("Plates", v) end,
}

function Automaton_Plates:OnInitialize()
end

function Automaton_Plates:OnEnable()
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
end

function Automaton_Plates:PLAYER_REGEN_ENABLED()
	HideNameplates()
end

function Automaton_Plates:PLAYER_REGEN_DISABLED()
	ShowNameplates()
end