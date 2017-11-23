
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Grand Widow Faerlina", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Faerlina",

	silence_cmd = "silence",
	silence_name = "Silence Alert",
	silence_desc = "Warn for silence",

	enrage_cmd = "enrage",
	enrage_name = "Enrage Alert",
	enrage_desc = "Warn for Enrage",

	starttrigger1 = "Kneel before me, worm!",
	starttrigger2 = "Slay them in the master's name!",
	starttrigger3 = "You cannot hide from me!",
	starttrigger4 = "Run while you still can!",

	silencetrigger = "Grand Widow Faerlina is afflicted by Widow's Embrace.", -- EDITED it affects her too.
	enragetrigger = "Grand Widow Faerlina gains Enrage.",
	enragefade = "Enrage fades from Grand Widow Faerlina.",

	startwarn = "Grand Widow Faerlina engaged, 60 seconds to enrage!",
	enragewarn15sec = "15 seconds until enrage!",
	enragewarn = "Enrage!",
	enrageremovewarn = "Enrage removed! %d seconds until next!", -- added
	silencewarn = "Silence! Delaying Enrage!",
	silencewarnnodelay = "Silence!",
	silencewarn5sec = "Silence ends in 5 sec",

	enragebar = "Enrage",
	silencebar = "Silence",

	rain_cmd = "rain",
	rain_name = "Rain of Fire Alert",
	rain_desc = "Warn when you are standing in Rain of Fire",
	rain_trigger = "You are afflicted by Rain of Fire",
	rain_run_trigger = "You suffer (%d+) (.+) from " .. module.translatedName .. " 's Rain of Fire.",
	rain_warn = "Move from FIRE!",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Faerlina",

	--silence_cmd = "silence",
	silence_name = "Alerta de Silencio",
	silence_desc = "Avisa para silencio",

	--enrage_cmd = "enrage",
	enrage_name = "Alerta de Enfurecer",
	enrage_desc = "Avisa para Enfurecer",

	starttrigger1 = "¡MUERE... o arrodíllate ante mí!",
	starttrigger2 = "¡Matadlos en el nombre del maestro!",
	starttrigger3 = "¡No puedes esconderte de mí!",
	starttrigger4 = "¡Corred mientras podáis!",

	silencetrigger = "Grand Viuda Faerlina sufre de Abrazo de la viuda.", -- EDITED it affects her too.
	enragetrigger = "Grand Viuda Faerlina gana Enfurecer.",
	enragefade = "Enfurecer desaparece de Grand Viuda Faerlina.",

	startwarn = "¡Entrando en combate con Gran Viuda Faerlina, 60 segundos hasta enfurecer!",
	enragewarn15sec = "¡15 segundos hasta enfurecer!",
	enragewarn = "¡Enfurecer!",
	enrageremovewarn = "¡Desaparece Enfurecer! %d segundos hasta el próximo!", -- added
	silencewarn = "¡Silencio! Demora Enfurecer!",
	silencewarnnodelay = "¡Silencio!",
	silencewarn5sec = "Silencio desaparece en 5 secgundos",

	enragebar = "Enfurecer",
	silencebar = "Silencio",

	--rain_cmd = "rain",
	rain_name = "Alerta de Lluvia de Fuego",
	rain_desc = "Avisa si estás en Lluvia de Fuego",
	rain_trigger = "Sufres de Lluvia de Fuego",
	rain_run_trigger = "Sufres (%d+) de daño (.+) de Lluvia de Fuego de " .. module.translatedName .. ".",
	rain_warn = "¡Muévate del FUEGO!",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20011 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"silence", "enrage", "rain", "bosskill"}


-- locals
local timer = {
	firstEnrage = 60,
	enrage = 61,
	silence = 30,
	rainTick = 2,
	rainDuration = 10,
}
local icon = {
	enrage = "Spell_Shadow_UnholyFrenzy",
	silence = "Spell_Holy_Silence",
	rain = "Spell_Shadow_RainOfFire",
}
local syncName = {
	enrage = "FaerlinaEnrage"..module.revision,
	silence = "FaerlinaSilence"..module.revision,
}

local timeEnrageStarted = 0
local isEnraged = false


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger1"])
module:RegisterYellEngage(L["starttrigger2"])
module:RegisterYellEngage(L["starttrigger3"])
module:RegisterYellEngage(L["starttrigger4"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE")

	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE",        "CheckRain")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE",            "CheckRain")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_FRIENDLYPLAYER_DAMAGE",  "CheckRain")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE",              "CheckRain")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE",     "CheckRain")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE",               "CheckRain")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")

	self:ThrottleSync(5, syncName.enrage)
	self:ThrottleSync(5, syncName.silence)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	timeEnrageStarted = 0
	isEnraged = false
end

-- called after boss is engaged
function module:OnEngage()
	self:Message(L["startwarn"], "Orange")
	if self.db.profile.enrage then
		self:DelayedMessage(timer.firstEnrage - 15, L["enragewarn15sec"], "Important")
		self:Bar(L["enragebar"], timer.firstEnrage, icon.enrage)
	end
	timeEnrageStarted = GetTime()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Initialization      --
------------------------------

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS( msg )
	if msg == L["enragetrigger"] then
		self:Sync(syncName.enrage)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE( msg )
	if msg == L["silencetrigger"] then
		self:Sync(syncName.silence)
	end
end

-- untested
function module:CheckRain(msg)
	if string.find(msg, L["rain_run_trigger"]) then
		if self.db.profile.rain then
			-- I found no better way to trigger this, it will autohide after 2s which is the time between Rain of Fire ticks
			self:WarningSign(icon.rain, timer.rainTick)
		end
	elseif (string.find(msg, L["rain_trigger"])) then
		if self.db.profile.rain then
			-- this will not trigger, but I will leave it in case they fix this combatlog event/message
			self:Message(L["rain_warn"], "Attention", true, "Alarm")
			self:WarningSign(icon.rain, timer.rainDuration)
			--self:DelayedBar(timer.rainDuration, L["barNextRain"], timer.nextRain - timer.rainDuration, icon.rain) -- variance too high
		end
	end
end
function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if string.find(msg, "Rain of Fire") then
		-- this will not trigger, but I will leave it in case they fix this combatlog event/message
		self:RemoveWarningSign(icon.rain)
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.enrage then
		self:Enrage()
	elseif sync == syncName.silence then
		self:Silence()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Enrage()
	if self.db.profile.enrage then
		self:Message(L["enragewarn"], "Urgent")
	end
	self:RemoveBar(L["enragebar"])
	self:CancelDelayedMessage(L["enragewarn15sec"])
	if self.db.profile.enrage then
		self:Bar(L["enragebar"], timer.enrage, icon.enrage)
		self:DelayedMessage(timer.enrage - 15, L["enragewarn15sec"], "Important")
	end
	timeEnrageStarted = GetTime()
	isEnraged = true
end

function module:Silence()
	if not isEnraged then -- preemptive, 30s silence
		--[[ The enrage timer should only be reset if it's less than 30sec
		to her next enrage, because if you silence her when there's 30+
		sec to the enrage, it won't actually stop her from enraging. ]]

		local currentTime = GetTime()

		if self.db.profile.silence then
			if (timeEnrageStarted + 30) < currentTime then
				self:Message(L["silencewarnnodelay"], "Urgent")
			else
				self:Message(L["silencewarn"], "Urgent")
			end
			self:Bar(L["silencebar"], timer.silence, icon.silence)
			self:DelayedMessage(timer.silence -5, L["silencewarn5sec"], "Urgent")
		end
		if (timeEnrageStarted + 30) < currentTime then
			if self.db.profile.enrage then
				-- We SHOULD reset the enrage timer, since it's more than 30
				-- sec since enrage started. This is only visuals ofcourse.
				self:RemoveBar(L["enragebar"])
				self:CancelDelayedMessage(L["enragewarn15sec"])
				self:DelayedMessage(timer.silence - 15, L["enragewarn15sec"], "Important")
				self:Bar(L["enragebar"], timer.silence, icon.enrage)
			end
			timeEnrageStarted = currentTime
		end

	else -- Reactive enrage removed
		if self.db.profile.enrage then
			self:Message(string.format(L["enrageremovewarn"], timer.enrage), "Urgent")
	end
	if self.db.profile.silence then
		self:Bar(L["silencebar"], timer.silence, icon.silence)
		self:DelayedMessage(timer.silence -5, L["silencewarn5sec"], "Urgent")
	end
	isEnraged = nil
	end
end
