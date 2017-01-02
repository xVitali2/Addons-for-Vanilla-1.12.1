local L = AceLibrary("AceLocale-2.2"):new("Automaton_Rez")
Automaton_Rez = Automaton:NewModule("Rez", "AceEvent-2.0", "AceDebug-2.0")

L:RegisterTranslations("enUS", function() return {
    ["Rez"] = true,
	["Options for accepting resurrection requests."] = true,
    ["Enabled"] = true,
	["Accept resurrection requests. If the persist option is Off, AutoRez will disable itself after the first resurrection."] = true,
    ["Persist"] = true,
	["With this option enabled, AutoRez will persist for every resurrection request."] = true,
} end)
L:RegisterTranslations("ruRU", function() return {
    ["Rez"] = "Воскрешение",
	["Options for accepting resurrection requests."] = "Настройки для подтверждения запросов на воскрешение.",
    ["Enabled"] = "Включено",
	["Accept resurrection requests. If the persist option is Off, AutoRez will disable itself after the first resurrection."] = "Подтвердить запрос на воскрешение. Если настройка 'Постоянно' выключена, функция 'Воскрешение' отключится после первого воскрешения.",
    ["Persist"] = "Постоянно",
	["With this option enabled, AutoRez will persist for every resurrection request."] = "С этой настройкой, будет подтвержден каждый запрос на воскрешение.",
} end)
L:RegisterTranslations("koKR", function() return {
    ["Rez"] = "부활",
	["Options for accepting resurrection requests."] = "부활에 관한 옵션을 설정합니다.",
    ["Enabled"] = "활성화",
	["Accept resurrection requests. If the persist option is Off, AutoRez will disable itself after the first resurrection."] = "부활을 자동 수락합니다. 지속 옵션이 체크 상태가 아닐때 자동부활은 첫째 부활 후에 그 자체를 비활성화합니다.",
    ["Persist"] = "지속",
	["With this option enabled, AutoRez will persist for every resurrection request."] = "이 옵션이 활성화시, 모든 부활 요구가 지속됩니다.",
} end)

Automaton.options.args.rez = {
	type = 'group',
	name = L["Rez"],
	desc = L["Options for accepting resurrection requests."],
	args = {
		toggle = {
			type = 'toggle',
			name = L["Enabled"],
			desc = L["Accept resurrection requests. If the persist option is Off, AutoRez will disable itself after the first resurrection."],
			get = function() return Automaton:IsModuleActive("Rez") end,
			set = function(v) Automaton:ToggleModuleActive("Rez", v) end,
		},
		persist = {
			type = 'toggle',
			name = L["Persist"],
			desc = L["With this option enabled, AutoRez will persist for every resurrection request."],
			get = function() return Automaton.db.profile.autoRezPersist end,
			set = function(v) Automaton.db.profile.autoRezPersist = v end,
		}
	}
}
function Automaton_Rez:OnEnable()
	self:RegisterEvent("RESURRECT_REQUEST")
end

function Automaton_Rez:RESURRECT_REQUEST()
	AcceptResurrect()
	StaticPopup_Hide("RESURRECT_NO_SICKNESS")
	if not Automaton.db.profile.autoRezPersist then
		Automaton:ToggleModuleActive("Rez",false)
	end
end