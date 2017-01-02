assert(oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRAPLatency")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Participant/Latency"] = true,
	["Options for latency checks."] = true,
} end )

L:RegisterTranslations("ruRU", function() return {
	["Participant/Latency"] = "Участник/Задержка",
	["Options for latency checks."] = "Опции для проверки задержки.",
} end )

L:RegisterTranslations("koKR", function() return {
	["Participant/Latency"] = "공격대장/지연 시간",
	["Options for latency checks."] = "지연 시간 확인에 대한 설정입니다.",
} end )

L:RegisterTranslations("zhCN", function() return {
	["Participant/Latency"] = "领袖/延迟",
	["Options for latency checks."] = "延迟检查选项。",
} end )

L:RegisterTranslations("zhTW", function() return {
	["Participant/Latency"] = "領隊/延遲",
	["Options for latency checks."] = "延遲檢查選項",
} end )

L:RegisterTranslations("frFR", function() return {
	["Participant/Latency"] = "Chef/Latence",
	["Options for latency checks."] = "Options concernant les vérifications des latences.",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

oRAPLatency = oRA:NewModule("latencyparticipant")
oRAPLatency.defaults = {
}
oRAPLatency.participant = true
oRAPLatency.name = L["Participant/Latency"]
-- oRAPLatency.consoleCmd = "latency"
-- oRAPLatency.consoleOptions = {
--	type = "group", desc = L["Options for latency checks."],
--  args = {
--  }
-- }

------------------------------
--      Initialization      --
------------------------------

function oRAPLatency:OnEnable()
	self:RegisterCheck("LATC", "oRA_LatencyCheck")
end

function oRAPLatency:OnDisable()
	self:UnregisterAllEvents()
	self:UnregisterCheck("LATC")
end

------------------------------
--      Event Handlers      --
------------------------------

function oRAPLatency:oRA_LatencyCheck(msg, author)
	if not self:IsValidRequest(author) then return end
	local _, _, latency = GetNetStats("player")
	self:SendMessage(string.format("LAT %s %s", latency, author))
end