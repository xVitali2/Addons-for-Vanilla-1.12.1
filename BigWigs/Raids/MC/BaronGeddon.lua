
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Baron Geddon", "Molten Core")

module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.wipemobs = nil
module.toggleoptions = {"inferno", "service", "bomb", "mana", "announce", "icon", "bosskill"}


---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	bomb = 8,
	inferno = 8,
	earliestNextInferno = 18,
	latestNextInferno = 24,
	earliestFirstIgnite = 10,
	latestFirstIgnite = 15,
	earliestIgnite = 20,
	latestIgnite = 30,
	service = 8,
}
local icon = {
	bomb = "Inv_Enchant_EssenceAstralSmall",
	inferno = "Spell_Fire_Incinerate",
	ignite = "Spell_Fire_Incinerate",
	service = "Spell_Fire_SelfDestruct",
}
local syncName = {
	bomb = "GeddonBomb"..module.revision,
	bombStop = "GeddonBombStop"..module.revision,
	inferno = "GeddonInferno"..module.revision,
	ignite = "GeddonManaIgnite"..module.revision,
	service = "GeddonService"..module.revision,
}

local firstinferno = true
local firstignite = true

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	inferno_trigger = "Baron Geddon gains Inferno\.",
	service_trigger = "performs one last service for Ragnaros",
	ignitemana_trigger = "afflicted by Ignite Mana",
	bombyou_trigger = "You are afflicted by Living Bomb.",
	bombother_trigger = "(.*) is afflicted by Living Bomb.",
	bombyouend_trigger = "Living Bomb fades from you.",
	bombotherend_trigger = "Living Bomb fades from (.*).",
	ignitemana_trigger1 = "afflicted by Ignite Mana",
	ignitemana_trigger2 = "Ignite Mana was resisted",
	deathyou_trigger = "You die.",
	deathother_trigger = "(.*) dies",

	bomb_message_you = "You are the bomb!",
	bomb_message_youscreen = "You are the bomb!",
	bomb_message_other = "%s is the bomb!",

	bomb_bar = "Living Bomb: %s",
	bomb_bar1 = "Living Bomb: %s",
	inferno_bar = "Next Inferno",
	inferno_channel = "Inferno",
	nextinferno_message = "3 seconds until Inferno!",
	service_bar = "Last Service",
	nextbomb_bar = "Next Living Bomb",
	ignite_bar = "Possible Ignite Mana",

	service_message = "Last Service! Baron Geddon exploding in 8 seconds!",
	inferno_message = "Inferno for 8 seconds!",
	ignite_message = "Dispel NOW!",

	cmd = "Baron",

	service_cmd = "service",
	service_name = "Last Service warning",
	service_desc = "Timer bar for Geddon's last service.",

	inferno_cmd = "inferno",
	inferno_name = "Inferno alert",
	inferno_desc = "Timer bar for Geddon's Inferno.",

	bombtimer_cmd = "bombtimer",
	bombtimer_name = "Living Bomb timers",
	bombtimer_desc = "Shows a 8 second bar for when the bomb goes off at the target.",

	bomb_cmd = "bomb",
	bomb_name = "Living Bomb alert",
	bomb_desc = "Warn when players are the bomb",

	mana_cmd = "manaignite",
	mana_name = "Ignite Mana alert",
	mana_desc = "Shows timers for Ignite Mana and announce to dispel it",

	icon_cmd = "icon",
	icon_name = "Raid Icon on bomb",
	icon_desc = "Put a Raid Icon on the person who's the bomb. (Requires assistant or higher)",

	announce_cmd = "whispers",
	announce_name = "Whisper to Bomb targets",
	announce_desc = "Sends a whisper to players targetted by Living Bomb. (Requires assistant or higher)",
} end)

L:RegisterTranslations("esES", function() return {
	inferno_trigger = "Barón Geddon gana Inferno\.",
	service_trigger = "lleva a cabo un último servicio para Ragnaros",
	ignitemana_trigger = "sufre de Ignición de maná",
	bombyou_trigger = "Sufres de Bomba viviente.",
	bombother_trigger = "(.*) sufre de Bomba viviente.",
	bombyouend_trigger = "Bomba viviente acaba de disiparse.",
	bombotherend_trigger = "Bomba viviente desaparece de (.*).",
	ignitemana_trigger1 = "sufre de Ignición de maná",
	ignitemana_trigger2 = "Resistido Ignición de maná de Barón Geddon",
	deathyou_trigger = "Has muerto.",
	deathother_trigger = "(.*) ha muerto",

	bomb_message_you = "¡Eres la bomba!",
	bomb_message_youscreen = "¡Eres la bomba!",
	bomb_message_other = "¡%s es la bomba!",

	bomb_bar = "Bomba viviente: %s",
	bomb_bar1 = "Bomba viviente: %s",
	inferno_bar = "Próximo Inferno",
	inferno_channel = "Inferno",
	nextinferno_message = "¡3 segundos hasta Inferno!",
	service_bar = "Último Servicio",
	nextbomb_bar = "Próximo Bomba viviente",
	ignite_bar = "Ignición de maná Posible",

	service_message = "¡Último servicio! Barón Geddon se explota en 8 segundos!",
	inferno_message = "¡Inferno por 8 segundos!",
	ignite_message = "¡Disipa AHORA!",

	--cmd = "Baron",

	--service_cmd = "service",
	service_name = "Alerta de Último servicio",
	service_desc = "Barra temporizadora para el último servicio de Barón Geddon.",

	--inferno_cmd = "inferno",
	inferno_name = "Alerta de Inferno",
	inferno_desc = "Barra temporizadora para el Inferno de Barón Geddon.",

	--bombtimer_cmd = "bombtimer",
	bombtimer_name = "Temporizador de Bomba viviente",
	bombtimer_desc = "Muestra una barra de 8 segundos cuando se explote la bomba.",

	--bomb_cmd = "bomb",
	bomb_name = "Alerta de Bomba viviente",
	bomb_desc = "Avisa cuando jugadores sean la bomba",

	--mana_cmd = "manaignite",
	mana_name = "Alerta de Ignición de maná",
	mana_desc = "Muestra temporizadores para Ignición de maná y anuncia para disiparlo",

	--icon_cmd = "icon",
	icon_name = "Marcar la bomba",
	icon_desc = "Marca con un icono el jugador quien tiene la bomba. (Requiere asistente o líder)",

	--announce_cmd = "whispers",
	announce_name = "Susurrar a los objetivos de la Bomba",
	announce_desc = "Susurra a los jugadores quien tienen la Bomba viviente. (Require asistente o líder)",
} end)

L:RegisterTranslations("deDE", function() return {
	inferno_trigger = "Baron Geddon bekommt \'Inferno",
	service_trigger = "performs one last service for Ragnaros",
	ignitemana_trigger = "von Mana entz\195\188nden betroffen",
	bombyou_trigger = "Ihr seid von Lebende Bombe betroffen.",
	bombother_trigger = "(.*) ist von Lebende Bombe betroffen.",
	bombyouend_trigger = "'Lebende Bombe\' schwindet von Euch.",
	bombotherend_trigger = "Lebende Bombe schwindet von (.*).",
	ignitemana_trigger1 = "von Mana entz\195\188nden betroffen",
	ignitemana_trigger2 = "Mana entz\195\188nden(.+)widerstanden",
	deathyou_trigger = "Ihr sterbt.",
	deathother_trigger = "(.*) stirbt",

	bomb_message_you = "Du bist die Bombe!",
	bomb_message_youscreen = "Du bist die Bombe!",
	bomb_message_other = "%s ist die Bombe!",

	bomb_bar = "Lebende Bombe: %s",
	bomb_bar1 = "Lebende Bombe: %s",
	inferno_bar = "N\195\164chstes Inferno",
	inferno_channel = "Inferno",
	nextinferno_message = "3 Sekunden bis Inferno!",
	service_bar = "Letzter Dienst.",
	nextbomb_bar = "N\195\164chste Lebende Bombe",
	ignite_bar = "Mögliches Mana entz\195\188nden",

	service_message = "Letzter Dienst! Baron Geddon explodiert in 8 Sekunden!",
	inferno_message = "Inferno 8 Sekunden lang!",
	ignite_message = "Entferne Magie JETZT!",

	cmd = "Baron",

	service_cmd = "service",
	service_name = "Alarm f\195\188r Letzten Dienst",
	service_desc = "Timer Balken f\195\188r Baron Geddons Letzten Dienst.",

	inferno_cmd = "inferno",
	inferno_name = "Alarm f\195\188r Inferno",
	inferno_desc = "Timer Balken f\195\188r Baron Geddons Inferno.",

	bombtimer_cmd = "bombtimer",
	bombtimer_name = "Timer f\195\188r Lebende Bombe",
	bombtimer_desc = "Zeigt einen 8 Sekunden Timer f\195\188r die Explosion der Lebenden Bombe an.",

	bomb_cmd = "bomb",
	bomb_name = "Alarm f\195\188r Lebende Bombe",
	bomb_desc = "Warnen, wenn andere Spieler die Bombe sind.",

	mana_cmd = "mana",
	mana_name = "Alarm f\195\188r Mana entz\195\188nden",
	mana_desc = "Zeige Timer f\195\188r Mana entz\195\188nden und verk\195\188nde Magie entfernen",

	icon_cmd = "icon",
	icon_name = "Schlachtzugssymbole auf die Bombe",
	icon_desc = "Markiert den Spieler, der die Bombe ist.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent).",

	announce_cmd = "whispers",
	announce_name = "Der Bombe fl\195\188stern",
	announce_desc = "Dem Spieler fl\195\188stern, wenn er die Bombe ist.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent).",
} end)


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	--self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH", "Event")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")

	self:ThrottleSync(5, syncName.bomb)
	self:ThrottleSync(3, syncName.bombStop)
	self:ThrottleSync(4, syncName.service)
	self:ThrottleSync(4, syncName.ignite)
	self:ThrottleSync(29, syncName.inferno)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	firstinferno = true
	firstignite = true

	bombt = 0
end

-- called after boss is engaged
function module:OnEngage()
	self:Inferno()
	self:ManaIgnite()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end

------------------------------
--      Event Handlers      --
------------------------------

function module:Event(msg)
	local _,_, bombother, mcverb = string.find(msg, L["bombother_trigger"])
	local _,_, bombotherend, mcverb = string.find(msg, L["bombotherend_trigger"])
	--local _,_, bombotherdeath,mctype = string.find(msg, L["deathother_trigger"])
	if string.find(msg, L["bombyou_trigger"]) then
		self:Sync(syncName.bomb)
		if self.db.profile.bomb then
			self:Bar(string.format(L["bomb_bar1"], UnitName("player")), timer.bomb, icon.bomb)
			self:Message(L["bomb_message_youscreen"], "Attention", "RunAway")
			self:WarningSign("Spell_Shadow_MindBomb", timer.bomb)
		end
		if self.db.profile.icon then
			self:Icon(UnitName("player"))
		end
	elseif string.find(msg, L["bombyouend_trigger"]) then
		self:RemoveBar(string.format(L["bomb_bar1"], UnitName("player")))
		self:Sync(syncName.bombStop)
	elseif string.find(msg, L["deathyou_trigger"]) then
		self:RemoveBar(string.format(L["bomb_bar1"], UnitName("player")))
	elseif bombother then
		bombt = bombother
		self:Sync(syncName.bomb)
		if self.db.profile.bomb then
			self:Bar(string.format(L["bomb_bar"], bombother), timer.bomb, icon.bomb)
			self:Message(string.format(L["bomb_message_other"], bombother), "Attention")
		end
		if self.db.profile.icon then
			self:Icon(bombother)
		end
		if self.db.profile.announce then
			self:TriggerEvent("BigWigs_SendTell", bombother, L["bomb_message_you"])
		end
	elseif bombotherend then
		self:RemoveBar(string.format(L["bomb_bar"], bombotherend))
		--elseif string.find(msg, L["deathother_trigger"]) then
		--	self:RemoveBar(string.format(L["bomb_bar"], bombotherdeath))
	elseif (string.find(msg, L["ignitemana_trigger1"]) or string.find(msg, L["ignitemana_trigger2"])) then
		self:Sync(syncName.ignite)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if string.find(msg, L["inferno_trigger"]) then
		BigWigs:DebugMessage("inferno trigger")
		self:Sync(syncName.inferno)
	end
end

function module:CHAT_MSG_MONSTER_EMOTE(msg)
	if string.find(msg, L["service_trigger"]) and self.db.profile.service then
		self:Sync(syncName.service)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.bomb then
	elseif sync == syncName.inferno then
		self:Inferno()
	elseif sync == syncName.ignite then
		self:ManaIgnite()
	elseif sync == syncName.bombStop and self.db.profile.bomb then
		self:RemoveBar(string.format(L["bomb_bar"], bombt))
	elseif sync == syncName.service and self.db.profile.service then
		self:Bar(L["service_bar"], timer.service, icon.service)
		self:Message(L["service_message"], "Important")
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Inferno()
	--self:DelayedSync(timer.nextInferno, syncName.inferno)

	if self.db.profile.inferno then
		self:RemoveBar(L["inferno_bar"])
		if firstinferno then
			self:IntervalBar(L["inferno_bar"], timer.earliestNextInferno, timer.latestNextInferno, icon.inferno)
			firstinferno = false
		else
			self:Message(L["inferno_message"], "Important")
			self:Bar(L["inferno_channel"], timer.inferno, icon.inferno)
			self:DelayedIntervalBar(timer.inferno, L["inferno_bar"], timer.earliestNextInferno - timer.inferno, timer.latestNextInferno - timer.inferno, icon.inferno)
		end

		self:DelayedMessage(timer.earliestNextInferno - 5, L["nextinferno_message"], "Urgent", nil, nil, true)
	end

	firstinferno = false
end

function module:ManaIgnite()
	if self.db.profile.mana then
		if not firstignite then
			self:Message(L["ignite_message"], "Important")
			self:IntervalBar(L["ignite_bar"], timer.earliestIgnite, timer.latestIgnite, icon.ignite)
		else
			self:IntervalBar(L["ignite_bar"], timer.earliestFirstIgnite, timer.latestFirstIgnite, icon.ignite)
		end
		firstignite = false
	end
end
