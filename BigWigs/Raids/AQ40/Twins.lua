
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("The Twin Emperors", "Ahn'Qiraj")

------------------------------
--      Are you local?      --
------------------------------

local veklor = AceLibrary("Babble-Boss-2.2")["Emperor Vek'lor"]
local veknilash = AceLibrary("Babble-Boss-2.2")["Emperor Vek'nilash"]
local boss = AceLibrary("Babble-Boss-2.2")["The Twin Emperors"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs" .. boss)
local twinstarted = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Twins",

	bug_cmd = "bug",
	bug_name = "Exploding Bug Alert",
	bug_desc = "Warn for exploding bugs",

	teleport_cmd = "teleport",
	teleport_name = "Teleport Alert",
	teleport_desc = "Warn for Teleport",

	enrage_cmd = "enrage",
	enrage_name = "Enrage Alert",
	enrage_desc = "Warn for Enrage",

	heal_cmd = "heal",
	heal_name = "Heal Alert",
	heal_desc = "Warn for Twins Healing",

	blizzard_cmd = "blizzard",
	blizzard_name = "Blizzard Warning",
	blizzard_desc = "Shows an Icon if you are standing in a Blizzard",

	porttrigger = "gains Twin Teleport.",
	portwarn = "Teleport!",
	portdelaywarn = "Teleport in 5 seconds!",
	portdelaywarn10 = "Teleport in 10 seconds!",
	bartext = "Teleport",
	explodebugtrigger = "gains Explode Bug",
	explodebugwarn = "Bug exploding nearby!",
	enragetrigger = "becomes enraged.",
	--trigger = "Blizzard",
	enragewarn = "Twins are enraged",
	healtrigger1 = "'s Heal Brother heals",
	healtrigger2 = " Heal Brother heals",
	healwarn = "Casting Heal!",
	startwarn = "Twin Emperors engaged! Enrage in 15 minutes!",
	enragebartext = "Enrage",
	warn1 = "Enrage in 10 minutes",
	warn2 = "Enrage in 5 minutes",
	warn3 = "Enrage in 3 minutes",
	warn4 = "Enrage in 90 seconds",
	warn5 = "Enrage in 60 seconds",
	warn6 = "Enrage in 30 seconds",
	warn7 = "Enrage in 10 seconds",

	blizzard_trigger = "You are afflicted by Blizzard.",
	blizzard_gone_trigger = "Blizzard fades from you",
	blizzard_warn = "Run from Blizzard!",


	pull_trigger1 = "Ah, lambs to the slaughter.",
	pull_trigger2 = "Prepare to embrace oblivion!",
	pull_trigger3 = "Join me brother, there is blood to be shed.",
	pull_trigger4 = "To decorate our halls.",
	pull_trigger5 = "Let none survive!",
	pull_trigger6 = "It's too late to turn away.",
	pull_trigger7 = "Look brother, fresh blood.",
	pull_trigger8 = "Like a fly in a web.",
	pull_trigger9 = "Shall be your undoing!",
	pull_trigger10 = "Your brash arrogance",

	kill_trigger = "My brother...NO!",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Twins",

	--bug_cmd = "bug",
	bug_name = "Alerta de Explotar insecto",
	bug_desc = "Avisa para Explotar insecto",

	--teleport_cmd = "teleport",
	teleport_name = "Alerta de Teletransporte",
	teleport_desc = "Avisa para Teletransporte",

	--enrage_cmd = "enrage",
	enrage_name = "Alerta de Enfurecer",
	enrage_desc = "Avisa para Enfurecer",

	--heal_cmd = "heal",
	heal_name = "Alerta de Curación",
	heal_desc = "Avisa para Curación de los Gemelos",

	--blizzard_cmd = "blizzard",
	blizzard_name = "Alerta de Gélido",
	blizzard_desc = "Muestra un icono si estás en Gélido",

	porttrigger = "gana Teletransporte gemelo.",
	portwarn = "¡Teletransporte!",
	portdelaywarn = "¡Teletransporte en 5 segundos!",
	portdelaywarn10 = "¡Teletransporte en 10 segundos!",
	bartext = "Teletransporte",
	explodebugtrigger = "gana Explotar insecto",
	explodebugwarn = "¡Insecto explotando cercano!",
	enragetrigger = "enfurecido.",
	--trigger = "Blizzard",
	enragewarn = "Gemelos están enfurecidos",
	healtrigger1 = "Curar a hermano cura",
	healtrigger2 = " Curar a hermano cura",
	healwarn = "¡Curando",
	startwarn = "¡Entrando en combate con Los Emperadores Gemelos! Enfurecer en 15 minutos!",
	enragebartext = "Enrage",
	warn1 = "Enfurecer en 10 minutos",
	warn2 = "Enfurecer en 5 minutos",
	warn3 = "Enfurecer en 3 minutos",
	warn4 = "Enfurecer en 90 segundos",
	warn5 = "Enfurecer en 60 segundos",
	warn6 = "Enfurecer en 30 segundos",
	warn7 = "Enfurecer en 10 segundos",

	blizzard_trigger = "Sufres de Gélido.",
	blizzard_gone_trigger = "Gélido acaba de disiparse",
	blizzard_warn = "¡Váyate del Gélido!",


	pull_trigger1 = "Ah, lambs to the slaughter.",
	pull_trigger2 = "Prepare to embrace oblivion!",
	pull_trigger3 = "Join me brother, there is blood to be shed.",
	pull_trigger4 = "To decorate our halls.",
	pull_trigger5 = "Let none survive!",
	pull_trigger6 = "It's too late to turn away.",
	pull_trigger7 = "Look brother, fresh blood.",
	pull_trigger8 = "Like a fly in a web.",
	pull_trigger9 = "Shall be your undoing!",
	pull_trigger10 = "Your brash arrogance",

	kill_trigger = "My brother...NO!",
} end )

L:RegisterTranslations("deDE", function() return {

		bug_name = "Explodierende K\195\164fer",
		bug_desc = "Warnung vor explodierenden K\195\164fern.",

		teleport_name = "Teleport",
		teleport_desc = "Warnung, wenn die Zwillings Imperatoren sich teleportieren.",

		enrage_name = "Wutanfall",
		enrage_desc = "Warnung, wenn die Zwillings Imperatoren w\195\188tend werden.",

		heal_name = "Heilung",
		heal_desc = "Warnung, wenn die Zwillings Imperatoren sich heilen.",

		blizzard_name = "Blizzard Warnung",
		blizzard_desc = "Zeigt ein Icon wenn du im Blizzard stehst",

		porttrigger = "wirkt Zwillingsteleport.",
		portwarn = "Teleport!",
		portdelaywarn = "Teleport in ~5 Sekunden!",
		portdelaywarn10 = "Teleport in ~10 Sekunden!",
		bartext = "Teleport",
		explodebugtrigger = "bekommt 'Käfer explodieren lassen'",
		explodebugwarn = "K\195\164fer explodiert!",
		enragetrigger = "wird w\195\188tend.", -- ? "bekommt 'Wutanfall'"
		enragewarn = "Zwillings Imperatoren sind w\195\188tend!",
		healtrigger1 = "'s Bruder heilen heilt",
		healtrigger2 = " Bruder heilen heilt",
		healwarn = "Heilung gewirkt!",
		startwarn = "Zwillings Imperatoren angegriffen! Wutanfall in 15 Minuten!",
		enragebartext = "Wutanfall",
		warn1 = "Wutanfall in 10 Minuten",
		warn2 = "Wutanfall in 5 Minuten",
		warn3 = "Wutanfall in 3 Minuten",
		warn4 = "Wutanfall in 90 Sekunden",
		warn5 = "Wutanfall in 60 Sekunden",
		warn6 = "Wutanfall in 30 Sekunden",
		warn7 = "Wutanfall in 10 Sekunden",

		blizzard_trigger = "Ihr seid von Blizzard betroffen.",
		blizzard_gone_trigger = "'Blizzard' schwindet von Euch.",
		blizzard_warn = "Lauf aus Blizzard!",

		pull_trigger1 = "Ihr seid nichts weiter als",
		pull_trigger2 = "Seid bereit in die",
		pull_trigger3 = "Komm Bruder",
		pull_trigger4 = "Um unsere Hallen",
		pull_trigger5 = "Niemand wird",
		pull_trigger6 = "Nun gibt es kein",
		pull_trigger7 = "Sieh Bruder",
		pull_trigger8 = "Wie eine Fliege",
		pull_trigger9 = "Wird euer Untergang",
		pull_trigger10 = "Eure unversch",

		kill_trigger = "Mein Bruder...",
} end )


-- module variables
module.revision = 20008 -- To be overridden by the module!
local veklor = AceLibrary("Babble-Boss-2.2")["Emperor Vek'lor"]
local veknilash = AceLibrary("Babble-Boss-2.2")["Emperor Vek'nilash"]
module.enabletrigger = {veklor, veknilash} -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"bug", "teleport", "enrage", "heal", "blizzard", "bosskill"}

-- locals
local timer = {
	earliestTeleport = 30,
	latestTeleport = 40,
	enrage = 900,
	blizzard = 10,
}
local icon = {
	teleport = "Spell_Arcane_Blink",
	enrage = "Spell_Shadow_UnholyFrenzy",
	blizzard = "Spell_Frost_IceStorm",
}
local syncName = {
	teleport = "TwinsTeleport"..module.revision,
	teleport_old = "TwinsTeleport"..module.revision,
}

local berserkannounced = nil


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["pull_trigger1"])
module:RegisterYellEngage(L["pull_trigger2"])
module:RegisterYellEngage(L["pull_trigger3"])
module:RegisterYellEngage(L["pull_trigger4"])
module:RegisterYellEngage(L["pull_trigger5"])
module:RegisterYellEngage(L["pull_trigger6"])
module:RegisterYellEngage(L["pull_trigger7"])
module:RegisterYellEngage(L["pull_trigger8"])
module:RegisterYellEngage(L["pull_trigger9"])
module:RegisterYellEngage(L["pull_trigger10"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")

	self:ThrottleSync(28, syncName.teleport)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
end

-- called after boss is engaged
function module:OnEngage()
	self:Sync(syncName.teleport)

	if self.db.profile.enrage then
		self:Message(L["startwarn"], "Important")
		self:Bar(L["enragebartext"], timer.enrage, icon.enrage)

		self:DelayedMessage(timer.enrage - 10 * 60, L["warn1"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 5 * 60, L["warn2"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 3 * 60, L["warn3"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 90, L["warn4"], "Urgent", nil, nil, true)
		self:DelayedMessage(timer.enrage - 60, L["warn5"], "Urgent", nil, nil, true)
		self:DelayedMessage(timer.enrage - 30, L["warn6"], "Important", nil, nil, true)
		self:DelayedMessage(timer.enrage - 10, L["warn7"], "Important", nil, nil, true)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CheckForBossDeath(msg)
	if msg == string.format(UNITDIESOTHER, veklor) or msg == string.format(UNITDIESOTHER, veknilash) then
		self:SendBossDeathSync()
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["kill_trigger"]) then
		self:SendBossDeathSync()
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE(msg)
	if string.find(msg, L["blizzard_trigger"]) then
		if self.db.profile.blizzard then
			self:Message(L["blizzard_warn"], "Personal", true, "Alarm")
			self:WarningSign(icon.blizzard, timer.blizzard)
		end
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if string.find(msg, L["blizzard_gone_trigger"]) then
		self:RemoveWarningSign(icon.blizzard)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if (string.find(msg, L["porttrigger"])) then
		self:Sync(syncName.teleport_old)
		self:Sync(syncName.teleport)
		self:DebugMessage("real port trigger")
	end
	if (string.find(msg, L["explodebugtrigger"]) and self.db.profile.bug) then
		self:Message(L["explodebugwarn"], "Personal", true)
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if (not self.prior and (string.find(msg, L["healtrigger1"]) or string.find(msg, L["healtrigger2"])) and self.db.profile.heal) then
		self:Message(L["healwarn"], "Important")
		self.prior = true
		self:ScheduleEvent(function() module.prior = nil end, 10)
	end
end

function module:CHAT_MSG_MONSTER_EMOTE(msg)
	if (string.find(msg, L["enragetrigger"]) and self.db.profile.enrage) then
		self:Message(L["enragewarn"], "Important")
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.teleport then
		self:Teleport()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Teleport()
	if self.db.profile.teleport then
		self:IntervalBar(L["bartext"], timer.earliestTeleport, timer.latestTeleport, icon.teleport)

		--self:DelayedSync(timer.teleport, syncName.teleport_old)
		--self:DelayedSync(timer.teleport, syncName.teleport)
		self:KTM_Reset()

		self:DelayedSound(timer.earliestTeleport - 10, "Ten")
		self:DelayedSound(timer.earliestTeleport - 3, "Three")
		self:DelayedSound(timer.earliestTeleport - 2, "Two")
		self:DelayedSound(timer.earliestTeleport - 1, "One")
		self:DelayedMessage(timer.earliestTeleport - 0.1, L["portwarn"], "Attention", false, "Alarm")
	end
end
