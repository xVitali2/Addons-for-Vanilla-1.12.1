local L = AceLibrary("AceLocale-2.2"):new("Automaton_Wuss")
Automaton_Wuss = Automaton:NewModule("Wuss", "AceEvent-2.0", "AceConsole-2.0", "AceDebug-2.0")

L:RegisterTranslations("enUS", function() return {
    ["Wuss"] = true,
	["Decline all incoming duels. Like the wuss you are."] = true,
    ["Canceling duel..."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["Wuss"] = "Слабак",
	["Decline all incoming duels. Like the wuss you are."] = "Отменяет все вызовы на дуэль.",
    ["Canceling duel..."] = "Дуэль отменена...",
} end)

L:RegisterTranslations("koKR", function() return {
    ["Wuss"] = "결투 거절",
	["Decline all incoming duels. Like the wuss you are."] = "모든 결투 신청을 거절합니다.",
    ["Canceling duel..."] = "결투 취소...",
} end)

Automaton.options.args.wuss = {
	type = 'toggle',
	name = L["Wuss"],
	desc = L["Decline all incoming duels. Like the wuss you are."],
	get = function() return Automaton:IsModuleActive("Wuss") end,
	set = function(v) Automaton:ToggleModuleActive("Wuss", v) end,
}

function Automaton_Wuss:OnInitialize()
end

function Automaton_Wuss:OnEnable()
	self:RegisterEvent("DUEL_REQUESTED")
end

function Automaton_Wuss:DUEL_REQUESTED()
	self:Print(L["Canceling duel..."])
	CancelDuel()
	StaticPopup_Hide("DUEL_REQUESTED")
end