local L = AceLibrary("AceLocale-2.2"):new("Automaton_AutoFilter")
Automaton_AutoFilter = Automaton:NewModule("AutoFilter", "AceEvent-2.0", "AceConsole-2.0", "AceDebug-2.0")

L:RegisterTranslations("enUS", function() return {
    ["Filter"] = true,
	["Show only available skills at trainers by default."] = true,
} end)
L:RegisterTranslations("ruRU", function() return {
    ["Filter"] = "Фильтр",
	["Show only available skills at trainers by default."] = "Показывать только доступные способности у тренера по умолчанию",
} end)
L:RegisterTranslations("koKR", function() return {
    ["Filter"] = "필터",
	["Show only available skills at trainers by default."] = "상급자에게 스킬을 배울시 사용 가능한 기술만 표시합니다.",
} end)

Automaton.options.args.filter = {
	type = 'toggle',
	name = L["Filter"],
	desc = L["Show only available skills at trainers by default."],
	get = function() return Automaton:IsModuleActive("AutoFilter") end,
	set = function(v) Automaton:ToggleModuleActive("AutoFilter", v) end,
}

function Automaton_AutoFilter:OnInitialize()
end

function Automaton_AutoFilter:OnEnable()
	self:RegisterEvent("TRAINER_SHOW")
end

function Automaton_AutoFilter:TRAINER_SHOW()
	SetTrainerServiceTypeFilter("unavailable",0)
end