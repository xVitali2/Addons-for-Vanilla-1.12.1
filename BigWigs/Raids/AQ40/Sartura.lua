
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Battleguard Sartura", "Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Sartura",

	add_name = "Sartura's Royal Guard",
	starttrigger = "defiling these sacred grounds",
	endtrigger = "I serve to the last!",
	startwarn = "Sartura engaged - 10 minutes until Berserk!",
	enragetrigger = "becomes enraged",
	enragetrigger2 = "Battleguard Sartura gains Enrage.",
	berserktrigger = "Battleguard Sartura gains Berserk.",
	enragewarn = "Enrage! Spam heals!",
	berserkwarn = "Berserk!",
	berserktext = "Berserk",
	warn1 = "Berserk in 5 minutes!",
	warn2 = "Berserk in 3 minutes!",
	warn3 = "Berserk in 90 seconds!",
	warn4 = "Berserk in 60 seconds!",
	warn5 = "Berserk in 30 seconds!",
	warn6 = "Berserk in 10 seconds!",
	whirlwindon = "Battleguard Sartura gains Whirlwind.",
	whirlwindoff = "Whirlwind fades from Battleguard Sartura.",
	whirlwindonwarn = "Whirlwind!",
	whirlwindoffwarn = "Whirlwind ended!",
	whirlwindbartext = "Whirlwind",
	whirlwindnextbartext = "Possible Whirlwind",
	whirlwindfirstbartext = "First Whirlwind",
	whirlwindinctext = "Whirlwind incoming!",
	deadaddtrigger = "Sartura's Royal Guard dies.",
	deadbosstrigger = "Battleguard Sartura dies.",
	addmsg = "%d/3 Sartura's Royal Guards dead!",

	adds_cmd = "adds",
	adds_name = "Dead adds counter",
	adds_desc = "Announces dead Sartura's Royal Guards.",

	enrage_cmd = "enrage",
	enrage_name = "Enrage",
	enrage_desc = "Announces the Enrage when the boss is at 20% HP.",

	berserk_cmd = "berserk",
	berserk_name = "Berserk",
	berserk_desc = "Warns for the Berserk that the boss gains after 10 minutes.",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Whirlwind",
	whirlwind_desc = "Timers and bars for Whirlwinds.",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Sartura",

	add_name = "Guardia Real de Sartura",
	starttrigger = "defiling these sacred grounds",
	endtrigger = "I serve to the last!",
	startwarn = "¡Entrando en combate con Sartura - 10 minutos hasta Rabia!",
	enragetrigger = "becomes enraged",
	enragetrigger2 = "Guardia de batalla Sartura gana Enfurecer.",
	berserktrigger = "Guardia de batalla Sartura gana Rabia.",
	enragewarn = "¡Enfurecer! Cúranse!",
	berserkwarn = "¡Rabia!",
	berserktext = "Rabia",
	warn1 = "¡Rabia en 5 minutos!",
	warn2 = "¡Rabia en 3 minutos!",
	warn3 = "¡Rabia en 90 segundos!",
	warn4 = "¡Rabia en 60 segundos!",
	warn5 = "¡Rabia en 30 segundos!",
	warn6 = "¡Rabia en 10 segundos!",
	whirlwindon = "Guardia de batalla Sartura gana Torbellino.",
	whirlwindoff = "Torbellino desaparece de Guardia de batalla Sartura.",
	whirlwindonwarn = "¡Torbellino!",
	whirlwindoffwarn = "¡Torbellino desaparece!",
	whirlwindbartext = "Torbellino",
	whirlwindnextbartext = "Torbellino Posible",
	whirlwindfirstbartext = "Primer Torbellino",
	whirlwindinctext = "¡Torbellino entrante!",
	deadaddtrigger = "Guardia Real de Sartura muere.",
	deadbosstrigger = "Guardia de batalla Sartura muere.",
	addmsg = "¡%d/3 Guardia Real de Sartura muertas!",

	--adds_cmd = "adds",
	adds_name = "Contador de Guardias Reales muertas",
	adds_desc = "Anuncia Guardias Reales de Sartura muertas.",

	--enrage_cmd = "enrage",
	enrage_name = "Enfurecer",
	enrage_desc = "Anuncia Enfurecer cuando el jefe tenga 20% salud.",

	--berserk_cmd = "berserk",
	berserk_name = "Rabia",
	berserk_desc = "Avisa para Rabia después de 10 minutos.",

	--whirlwind_cmd = "whirlwind",
	whirlwind_name = "Torbellino",
	whirlwind_desc = "Temporizador y barras para Torbellino.",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Sartura",

	add_name = "Sarturas Königswache",
	starttrigger = "defiling these sacred grounds", -- translation missing
	endtrigger = "I serve to the last!", -- translation missing
	startwarn = "Sartura angegriffen! Berserker in 10 Minuten!",
	enragetrigger = "becomes enraged", -- translation missing
	enragetrigger2 = "Schlachtwache Sartura bekommt 'Wutanfall'.",
	berserktrigger = "Schlachtwache Sartura bekommt 'Berserker'.",
	enragewarn = "Wutanfall! Spam heilung!",
	berserkwarn = "Berserker!",
	berserktext = "Berserker",
	warn1 = "Berserker in 5 Minuten!",
	warn2 = "Berserker in 3 Minuten!",
	warn3 = "Berserker in 90 Sekunden!",
	warn4 = "Berserker in 60 Sekunden!",
	warn5 = "Berserker in 30 Sekunden!",
	warn6 = "Berserker in 10 Sekunden!",
	whirlwindon = "Schlachtwache Sartura bekommt 'Wirbelwind'.",
	whirlwindoff = "Wirbelwind schwindet von Schlachtwache Sartura.",
	whirlwindonwarn = "Wirbelwind!",
	whirlwindoffwarn = "Wirbelwind ist zu Ende!",
	whirlwindbartext = "Wirbelwind",
	whirlwindnextbartext = "Möglicher Wirbelwind",
	whirlwindfirstbartext = "Erster Wirbelwind",
	whirlwindinctext = "Wirbelwind bald!",
	deadaddtrigger = "Sarturas Königswache stirbt.",
	deadbosstrigger = "Schlachtwache Sartura stirbt.",
	addmsg = "%d/3 Sarturas Königswache tot!",

	adds_cmd = "adds",
	adds_name = "Z\195\164hler f\195\188r tote Adds",
	adds_desc = "Verk\195\188ndet Sarturas Königswache Tod.",

	enrage_cmd = "enrage",
	enrage_name = "Wutanfall",
	enrage_desc = "Meldet den Wutanfall, wenn der Boss bei 20% HP ist.",

	berserk_cmd = "berserk",
	berserk_name = "Berserker",
	berserk_desc = "Warnt vor dem Berserkermodus, in den der Boss nach 10 Minuten geht.",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Wirbelwind",
	whirlwind_desc = "Timer und Balken f\195\188r Wirbelwinde.",
} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20007 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"whirlwind", "adds", "enrage", "berserk", "bosskill"}


-- locals
local timer = {
	berserk = 600,
	earliestFirstWhirlwind = 8,
	latestFirstWhirlwind = 12,
	firstWhirlwind = 8,
	whirlwind = 15,
	earliestNextWhirlwind = 5,
	latestNextWhirlwind = 10,
}
local icon = {
	berserk = "Spell_Shadow_UnholyFrenzy",
	whirlwind = "Ability_Whirlwind",
}
local syncName = {
	whirlwind = "SarturaWhirlwindStart"..module.revision,
	whirlwindOver = "SarturaWhirlwindEnd"..module.revision,
	enrage = "SarturaEnrage"..module.revision,
	berserk = "SarturaBerserk"..module.revision,
	add = "SarturaAddDead"..module.revision,
}

local guard = 0


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")

	self:ThrottleSync(3, syncName.whirlwind)
	self:ThrottleSync(3, syncName.whirlwindOver)
	self:ThrottleSync(5, syncName.enrage)
	self:ThrottleSync(5, syncName.berserk)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	guard = 0

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.berserk then
		self:Message(L["startwarn"], "Important")
		self:Bar(L["berserktext"], timer.berserk, icon.berserk)
		self:DelayedMessage(timer.berserk - 5 * 60, L["warn1"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.berserk - 3 * 60, L["warn2"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.berserk - 90, L["warn3"], "Urgent", nil, nil, true)
		self:DelayedMessage(timer.berserk - 60, L["warn4"], "Urgent", nil, nil, true)
		self:DelayedMessage(timer.berserk - 30, L["warn5"], "Important", nil, nil, true)
		self:DelayedMessage(timer.berserk - 10, L["warn6"], "Important", nil, nil, true)
	end
	if self.db.profile.whirlwind then
		self:IntervalBar(L["whirlwindfirstbartext"], timer.earliestFirstWhirlwind, timer.latestFirstWhirlwind, icon.whirlwind)
		self:DelayedMessage(timer.earliestFirstWhirlwind - 3, L["whirlwindinctext"], "Attention", true, "Alarm")
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg == L["whirlwindon"] then
		self:Sync(syncName.whirlwind)
	elseif msg == L["enragetrigger2"] then
		self:Sync(syncName.enrage)
	elseif msg == L["berserktrigger"] then
		self:Sync(syncName.berserk)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if msg == L["deadaddtrigger"] then
		self:Sync(syncName.add.." "..guard+1)
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L["endtrigger"] then
		self:SendBossDeathSync()
	end
end

function module:CHAT_MSG_MONSTER_EMOTE(msg)
	if string.find(msg, L["enragetrigger"]) then
		self:Sync(syncName.enrage)
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_OTHER(msg)
	if msg == L["whirlwindoff"] then
		self:Sync(syncName.whirlwindOver)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.whirlwind and self.db.profile.whirlwind then
		self:Message(L["whirlwindonwarn"], "Important")
		self:Bar(L["whirlwindbartext"], timer.whirlwind, icon.whirlwind)
		self:RemoveBar(L["whirlwindnextbartext"])
		self:DelayedIntervalBar(timer.whirlwind, L["whirlwindnextbartext"], timer.earliestNextWhirlwind, timer.latestNextWhirlwind, icon.whirlwind)
		self:DelayedMessage(timer.earliestNextWhirlwind+timer.whirlwind - 3, L["whirlwindinctext"], "Attention", true, "Alarm")
	elseif sync == syncName.whirlwindOver and self.db.profile.whirlwind then
		self:RemoveBar(L["whirlwindbartext"])
		self:Message(L["whirlwindoffwarn"], "Attention")
	elseif sync == syncName.enrage and self.db.profile.enrage then
		self:Message(L["enragewarn"], "Attention")
	elseif sync == syncName.berserk and self.db.profile.berserk then
		self:Message(L["berserkwarn"], "Attention")
		self:RemoveBar(L["berserktext"])

		self:CancelDelayedMessage(L["warn1"])
		self:CancelDelayedMessage(L["warn2"])
		self:CancelDelayedMessage(L["warn3"])
		self:CancelDelayedMessage(L["warn4"])
		self:CancelDelayedMessage(L["warn5"])
		self:CancelDelayedMessage(L["warn6"])
	elseif sync == syncName.add then
		rest = tonumber(rest)
		if rest == guard + 1 then
			guard = guard + 1
			if self.db.profile.adds then
				self:Message(string.format(L["addmsg"], guard), "Positive")
			end
		end
	end
end
