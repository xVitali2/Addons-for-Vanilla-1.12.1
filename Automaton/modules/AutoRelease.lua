local L = AceLibrary("AceLocale-2.2"):new("Automaton_Release")
Automaton_Release = Automaton:NewModule("Release", "AceEvent-2.0", "AceDebug-2.0")

L:RegisterTranslations("enUS", function() return {
    ["Release"] = true,
	["Automatically release to ghost after dying in a battleground"] = true,
} end)
L:RegisterTranslations("ruRU", function() return {
    ["Release"] = "Высвобождение",
	["Automatically release to ghost after dying in a battleground"] = "Автоматически высвобождается в духа после смерти на поле боя.",
} end)
L:RegisterTranslations("koKR", function() return {
    ["Release"] = "전장 부활",
	["Automatically release to ghost after dying in a battleground"] = "전장에서 죽은 후에 유령상태시 자동으로 부활합니다.",
} end)

Automaton.options.args.release = {
	type = 'toggle',
	name = L["Release"],
	desc = L["Automatically release to ghost after dying in a battleground"],
	get = function() return Automaton:IsModuleActive("Release") end,
	set = function(v) Automaton:ToggleModuleActive("Release", v) end,
}

function Automaton_Release:OnEnable()
	self:RegisterEvent("PLAYER_DEAD")
end

function Automaton_Release:PLAYER_DEAD()
	if MiniMapBattlefieldFrame.status == "active" then
		self:Debug("AutoReleasing...")
		RepopMe()
	end
end