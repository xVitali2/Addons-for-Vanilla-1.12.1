----------------------------------
--      Locals                  --
----------------------------------

local name = "Respawn Timers"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..name)

-- packNumber is basically just a counter for the mob types, so that when one
-- mob of a type dies, its counter is increased by 1 so that we have some way of
-- telling mobs apart. It will never reset outside of a reload UI or relog.
local packNumber = nil

-- We throttle the deaths of each mob type by 60 seconds by default, so that if
-- 2 mobs of the same type die within 60 seconds of eachother, you'll only get 1
-- respawn timer for them, that starts at the kill of the first one. This was
-- added mostly for core hound packs in MC.
local deathThrottle = nil

----------------------------------
--      Localization            --
----------------------------------

L:RegisterTranslations("enUS", function() return {
	["respawntimers"] = true,
	["Respawn Timers"] = true,
	["Respawn timer bars and warnings for trash mobs."] = true,
	["bars"] = true,
	["Bars"] = true,
	["Toggles showing bars for respawn times."] = true,
	["messages"] = true,
	["Messages"] = true,
	["Toggles showing messages for respawn times."] = true,

	["%s %d respawns in %d sec"] = true,
	["%s %d respawned!"] = true,
	["Respawn: %s %d"] = true,

	-- Molten Core Triggers
	["Ancient Core Hound"] = true,
	["Lava Annihilator"] = true,
	["Lava Surger"] = true,
	["Firelord"] = true,
	["Firewalker"] = true, -- Lava Pack
	["%s collapses and begins to smolder."] = true, -- Hound Pack, emote.
	-- Molten Core Messages
	["Corehound"] = true,
	["Annihilator"] = true,
	["Surger"] = true,
	-- Firelord == Firelord.
	["Lavapack"] = true,
	["Houndpack"] = true,

	-- AQ Triggers
	["Obsidian Eradicator"] = true,
	["Anubisath Sentinel"] = true,
	-- AQ Messages
	["Eradicator"] = true,
	["Sentinel"] = true,

	-- BWL Triggers
	["Death Talon Hatcher"] = true,
	["Blackwing Taskmaster"] = true,
	-- BWL Messages
	["Death Talon"] = true,
	["Taskmaster"] = true,

} end )

L:RegisterTranslations("ruRU", function() return {
	["respawntimers"] = "respawntimers",
	["Respawn Timers"] = "Таймер появления",
	["Respawn timer bars and warnings for trash mobs."] = "Таймер появления и предупреждения для трэш мобов.",
	["bars"] = "bars",
	["Bars"] = "Полосы",
	["Toggles showing bars for respawn times."] = "Вкл/Выкл отображение полос для таймера появлений.",
	["messages"] = "messages",
	["Messages"] = "Сообщения",
	["Toggles showing messages for respawn times."] = "Вкл/Выкл отображение сообщений для таймера появлений.",

	["%s %d respawns in %d sec"] = "%s %d респавн через %d сек.",
	["%s %d respawned!"] = "%s %d респавнится!",
	["Respawn: %s %d"] = "Респавн: %s %d",

	-- Molten Core Triggers
	["Ancient Core Hound"] = "Древняя гончая Недр",
	["Lava Annihilator"] = "Лавовый уничтожитель",
	["Lava Surger"] = "Лавовый волноплеск",
	["Firelord"] = "Повелитель огня",
	["Firewalker"] = "Огнеход", -- Lava Pack
	["%s collapses and begins to smolder."] = "%s collapses and begins to smolder.", -- Hound Pack, emote.
	-- Molten Core Messages
	["Corehound"] = "ГончаяНедр",
	["Annihilator"] = "Уничтожитель",
	["Surger"] = "Волноплеск",
	-- Firelord == Firelord.
	["Lavapack"] = "ЛавовыйПак",
	["Houndpack"] = "ПакГончей",

	-- AQ Triggers
	["Obsidian Eradicator"] = "Обсидиановый искоренитель",
	["Anubisath Sentinel"] = "Анубисат-часовой",
	-- AQ Messages
	["Eradicator"] = "Искоренитель",
	["Sentinel"] = "Часовой",

	-- BWL Triggers
	["Death Talon Hatcher"] = "Гнездовая Когтя Смерти",
	["Blackwing Taskmaster"] = "Надсмотрщик из логова Крыла Тьмы",
	-- BWL Messages
	["Death Talon"] = "Гнездовая",
	["Taskmaster"] = "Надсмотрщик",

} end )

L:RegisterTranslations("deDE", function() return {
	["respawntimers"] = "respawntimers",
	["Respawn Timers"] = "Respawn Timer",
	["Respawn timer bars and warnings for trash mobs."] = "Respawn Timerbalken und Warnungen f\195\188r Trashmobs",
	["bars"] = "bars",
	["Bars"] = "Balken",
	["Toggles showing bars for respawn times."] = "Zeige Balken",
	["messages"] = "messages",
	["Messages"] = "Warnungen",
	["Toggles showing messages for respawn times."] = "Sende Warnungen",

	["%s %d respawns in %d sec"] = "�%s %d respawnt in %d Sekunden",
	["%s %d respawned!"] = "%s %s respawnt",
	["Respawn: %s %d"] = "Respawn: %s %d",

	-- Molten Core Triggers
	["Ancient Core Hound"] = "Uralter Kernhund",
	["Lava Annihilator"] = "Lavavernichter",
	["Lava Surger"] = "Lavawoger",
	["Firelord"] = "Feuerlord",
	["Firewalker"] = "Feuerg\195\164nger", -- Lava Pack
	["%s collapses and begins to smolder."] = "%s bricht zusammen und beginnt zu glimmen.", -- Hound Pack, emote.
	-- Molten Core Messages
	["Corehound"] =  "Kernhund",
	["Annihilator"] = "Vernichter",
	["Surger"] = "Woger",
	-- Firelord == Firelord.
	["Lavapack"] = "Lavapack",
	["Houndpack"] = "Kernhundpack",

	-- AQ Triggers
	["Obsidian Eradicator"] = "Obsidianzerst\195\182rer",
	["Anubisath Sentinel"] = "W\195\164chter des Anubisath",
	-- AQ Messages
	["Eradicator"] = "Zerst\195\182rer",
	["Sentinel"] = "W\195\164chter",

	-- BWL Triggers
	["Death Talon Hatcher"] = "Brutw\195\164chter der Todeskrallen",
	["Blackwing Taskmaster"] = "Zuchtmeister der Pechschwingen",
	-- BWL Messages
	["Death Talon"] = "Brutw\195\164chter",
	["Taskmaster"] = "Zuchtmeister",
} end )

-- The death table and emote table are basically the meat of this addon. The
-- first string is what we search for in the responding chat event, the table
-- that is attached to it is: 1. respawn time in seconds, 2. the bar text and
-- message text for the respawn timer, 3. optional icon path for this timer.
local deathTable = {
	-- MC
	[L["Ancient Core Hound"]] = {1080, L["Corehound"], nil},
	[L["Lava Annihilator"]]   = {7200, L["Annihilator"], nil},
	[L["Lava Surger"]]        = {1620, L["Surger"], nil},
	[L["Firelord"]]           = {7200, L["Firelord"], nil},
	[L["Firewalker"]]         = {7200, L["Lavapack"], nil},
	-- AQ
	[L["Obsidian Eradicator"]] = {1800, L["Eradicator"], nil},
	[L["Anubisath Sentinel"]]  = {1800, L["Sentinel"], nil},
	-- BWL
	[L["Death Talon Hatcher"]]  = {720, L["Death Talon"], nil},
	[L["Blackwing Taskmaster"]] = {720, L["Taskmaster"], nil},
}
local emoteTable = {
	-- MC
	[L["%s collapses and begins to smolder."]] = {3600, L["Houndpack"], nil},
}

----------------------------------
--  Addon Declaration           --
----------------------------------

BigWigsRespawnTimers = BigWigs:NewModule(name)
BigWigsRespawnTimers.defaultDB = {
	bars = true,
	messages = true,
}

BigWigsRespawnTimers.consoleCmd = L["respawntimers"]
BigWigsRespawnTimers.consoleOptions = {
	type = "group",
	name = L["Respawn Timers"],
	desc = L["Respawn timer bars and warnings for trash mobs."],
	args   = {
		[L["bars"]] = {
			type = "toggle",
			name = L["Bars"],
			desc = L["Toggles showing bars for respawn times."],
			get = function() return BigWigsRespawnTimers.db.profile.bars end,
			set = function(v) BigWigsRespawnTimers.db.profile.bars = v end,
		},
		[L["messages"]] = {
			type = "toggle",
			name = L["Messages"],
			desc = L["Toggles showing messages for respawn times."],
			get = function() return BigWigsRespawnTimers.db.profile.messages end,
			set = function(v) BigWigsRespawnTimers.db.profile.messages = v end,
		},
	}
}
BigWigsRespawnTimers.revision = tonumber(string.sub("$Revision: 17260 $", 12, -3))
BigWigsRespawnTimers.external = true

----------------------------------
--      Initialization          --
----------------------------------

function BigWigsRespawnTimers:OnEnable()
	packNumber = {}
	deathThrottle = {}
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
end

----------------------------------
--      Events                  --
----------------------------------

-- Basically just loop the corresponding mob table and check if the event
-- arguments (death or emote) matches anything we've registered. If so, trigger
-- a respawn timer.

function BigWigsRespawnTimers:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	for key, table in pairs(deathTable) do
		if msg == string.format(UNITDIESOTHER, key) then
			self:StartRespawnTimer(table[2], table[1], table[3])
			break
		end
	end
end

function BigWigsRespawnTimers:CHAT_MSG_MONSTER_EMOTE(msg)
	for key, table in pairs(emoteTable) do
		if msg == key then
			self:StartRespawnTimer(table[2], table[1], table[3])
			break
		end
	end
end

----------------------------------
--    Utility                   --
----------------------------------

function BigWigsRespawnTimers:StartRespawnTimer(message, timer, icon, throttle)
	timer = tonumber(timer)
	if timer == nil then return end

	-- Throttle deaths by 60 seconds.
	if deathThrottle[message] and (deathThrottle[message] + 60) > GetTime() then return end
	deathThrottle[message] = GetTime()

	-- Increment the pack counter after all arguments are checked and we're sure
	-- to start a new respawn timer.
	if not packNumber[message] then packNumber[message] = 0 end
	local nextPack = packNumber[message] + 1
	packNumber[message] = nextPack

	-- Make sure the user wants respawn messages.
	if self.db.profile.messages then
		self:ScheduleEvent("bwrt"..nextPack.."10secwarn", "BigWigs_Message", timer - 10, string.format(L["%s %d respawns in %d sec"], message, nextPack, 10), "Yellow")
		self:ScheduleEvent("bwrt"..nextPack.."respawned", "BigWigs_Message", timer, string.format(L["%s %d respawned!"], message, nextPack), "Orange")
	end

	-- Make sure the user wants respawn timer bars.
	if self.db.profile.bars then
		-- Default icon.
		if not icon then icon = "Interface\\Icons\\INV_Misc_Head_Dragon_01" end
		local text = string.format(L["Respawn: %s %d"], message, nextPack)
		self:TriggerEvent("BigWigs_StartBar", self, text, timer, icon)
		self:SetCandyBarOnClick("BigWigsBar "..text, function()
			if IsControlKeyDown() then
				self:TriggerEvent("BigWigs_StopBar", self, text)
				self:CancelScheduledEvent("bwrt"..nextPack.."10secwarn")
				self:CancelScheduledEvent("bwrt"..nextPack.."respawned")
			end
		end)
	end
end

