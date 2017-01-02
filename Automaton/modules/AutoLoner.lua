local L = AceLibrary("AceLocale-2.2"):new("Automaton_Loner")
Automaton_Loner = Automaton:NewModule("Loner", "AceEvent-2.0", "AceConsole-2.0", "AceDebug-2.0")

L:RegisterTranslations("enUS", function() return {
    ["Loner"] = true,
	["Decline all incoming guild requests."] = true,
	["Canceling guild invite..."] = true,
} end)

L:RegisterTranslations("koKR", function() return {
    ["Loner"] = "길드 초대",
	["Decline all incoming guild requests."] = "모든 길드 초대 요구를 거절합니다.",
	["Canceling guild invite..."] = "길드 초대 거절...",
} end)
L:RegisterTranslations("ruRU", function() return {
    ["Loner"] = "Одиночка",
	["Decline all incoming guild requests."] = "Отклоняет все приглашения в гильдию.",
	["Canceling guild invite..."] = "Приглашение в гильдию отклонено...",
} end)

Automaton.options.args.loner = {
	type = 'toggle',
	name = L["Loner"],
	desc = L["Decline all incoming guild requests."],
	get = function() return Automaton:IsModuleActive("Loner") end,
	set = function(v) Automaton:ToggleModuleActive("Loner", v) end,
}

function Automaton_Loner:OnInitialize()
end

function Automaton_Loner:OnEnable()
	self:RegisterEvent("GUILD_INVITE_REQUEST")
end

function Automaton_Loner:GUILD_INVITE_REQUEST()
	self:Print(L["Canceling guild invite..."])
	DeclineGuild()
	StaticPopup_Hide("GUILD_INVITE")
end