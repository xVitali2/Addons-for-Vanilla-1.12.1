local L = AceLibrary("AceLocale-2.2"):new("Automaton_Queue")
Automaton_Queue = Automaton:NewModule("Queue", "AceEvent-2.0", "AceConsole-2.0", "AceDebug-2.0")

L:RegisterTranslations("enUS", function() return {
    ["Queue"] = true,
	["Options for accepting Battleground queues."] = true,
    ["Enabled"] = true,
	["Accepts Battleground queues"] = true,
    ["Delay"] = true,
	["With this option enabled, automatic battleground entry is delayed for 100 seconds."] = true,
    ["Joining "] = true,
    [" in 1:40..."] = true, 
} end)
L:RegisterTranslations("ruRU", function() return {
    ["Queue"] = "Очередь",
	["Options for accepting Battleground queues."] = "Настройки подтверждения очередей Полей боя",
    ["Enabled"] = "Включен",
	["Accepts Battleground queues"] = "Подтверждает запросы на Поле боя.",
    ["Delay"] = "Задержка",
	["With this option enabled, automatic battleground entry is delayed for 100 seconds."] = "С этой настройкой, происходит регистрация на поле боя через 100 сек.",  
    ["Joining "] = "Вступление ",
    [" in 1:40..."] = "через 1:40...",     
} end)
L:RegisterTranslations("koKR", function() return {
    ["Queue"] = "전장 대기",
	["Options for accepting Battleground queues."] = "전장 대기 옵션을 설정합니다.",
    ["Enabled"] = "활성화",
	["Accepts Battleground queues"] = "전장 입장을 지연시킵니다.",
    ["Delay"] = "지연",
	["With this option enabled, automatic battleground entry is delayed for 100 seconds."] = "이 옵션이 활성화시, 전장 입장을 1분 40초동안 지연시킵니다.",  
    ["Joining "] = "입장 ",
    [" in 1:40..."] = "지연 1:40...",     
} end)

Automaton.options.args.queue = {
	type = 'group',
	name = L["Queue"],
	desc = L["Options for accepting Battleground queues."],
	args = {
		toggle = {
			type = 'toggle',
			name = L["Enabled"],
			desc = L["Accepts Battleground queues"],
			get = function() return Automaton:IsModuleActive("Queue") end,
			set = function(v) Automaton:ToggleModuleActive("Queue", v) end,
		},
		delay = {
			type = 'toggle',
			name = L["Delay"],
			desc = L["With this option enabled, automatic battleground entry is delayed for 100 seconds."],
			get = function() return Automaton.db.profile.autoQueueDelay end,
			set = function(v) Automaton.db.profile.autoQueueDelay = v end,
		}
	}
}

function Automaton_Queue:OnEnable()
	self:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
end

function Automaton_Queue:UPDATE_BATTLEFIELD_STATUS()
	for i=1, MAX_BATTLEFIELD_QUEUES do
		local status, mapName, instanceID = GetBattlefieldStatus(i)
		if status == "confirm" then
			if Automaton.db.profile.autoQueueDelay and not self:IsEventScheduled("Automaton_autoQueue" .. i) then
				self:Print(L["Joining "]..mapName..L[" in 1:40..."])
				self:ScheduleEvent("Automaton_autoQueue" .. i, AcceptBattlefieldPort, 100, i, 1)
			elseif not self:IsEventScheduled("Automaton_autoQueue" .. i) then
				self:Print(L["Joining "]..mapName.."...")
				AcceptBattlefieldPort(i,1)
			end
		end
	end
end
