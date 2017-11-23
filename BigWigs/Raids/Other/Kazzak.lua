----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Lord Kazzak", "Blasted Lands")

module.revision = 20008 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"markofkazzak", "puticon", "twistedreflection", "voidbolt", "corruptsoul", "supreme", "bosskill"}

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	supreme = 180,
	mark = 10,
	twisted = 45,
	voidbolt = 1.5,
}
local icon = {
	mark = "Interface\\Icons\\Spell_Shadow_Antishadow",
	twisted = "Interface\\Icons\\Spell_Arcane_PortalDarnassus",
	voidbolt = "Interface\\Icons\\Spell_Shadow_Haunting",
}
local syncName = {
	markStart = "LordKazzakMarkStart"..module.revision,
	markStop = "LordKazzakMarkStop"..module.revision,
	reflectionStart = "LordKazzakReflectionStart"..module.revision,
	reflectionStop = "LordKazzakReflectionStop"..module.revision,
	voidboltStart = "LordKazzakVoidBoltStart"..module.revision,
	voidboltStop = "LordKazzakVoidBoltStop"..module.revision,
	supreme = "LordKazzakSupreme"..module.revision,
	dead = "LordKazzakDead"..module.revision,
	randomDeath = "LordKazzakRandomDeath"..module.revision,

}

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Kazzak",

	starttrigger1 = "All mortals will perish!",
	starttrigger2 = "The Legion will conquer all!",
	markofkazzakyou_trigger = "You are afflicted by Mark of Kazzak.",
	markofkazzakother_trigger = "(.*) is afflicted by Mark of Kazzak.",
	markofkazzakyouend_trigger = "Mark of Kazzak fades from you.",
	markofkazzakotherend_trigger = "Mark of Kazzak fades from (.*).",
	twistedreflectionyou_trigger = "You are afflicted by Twisted Reflection.",
	twistedreflectionother_trigger = "(.*) is afflicted by Twisted Reflection.",
	twistedreflectionyouend_trigger = "Twisted Reflection fades from you.",
	twistedreflectionotherend_trigger = "Twisted Reflection fades from (.*).",
	deathyou_trigger = "You die\.",
	deathother_trigger = "(.*) dies.",
	voidbolt_trigger = "Lord Kazzak begins to cast Void Bolt.",
	attack_trigger1 = "Lord Kazzak attacks",
	attack_trigger2 = "Lord Kazzak misses",
	attack_trigger3 = "Lord Kazzak hits",
	attack_trigger4 = "Lord Kazzak crits",
	enrage_trigger = "Lord Kazzak gains Berserk.",
	enrageyell_trigger = "Kazzak is supreme!",
	bosskill_trigger = "The Legion... will never... fall.",

	engagewarn = "Lord Kazzak engaged! 3mins until Supreme!",
	enrage_warm = "Lord Kazzak is supreme!",
	makrofkazzak_warn = "%s has Mark of Kazzak! Decurse!",
	twistedreflection_warn = "%s has Twisted Reflection! Dispel!",
	mark_message_you = "You have Mark of Kazzak! Don't go out of mana!",
	reflection_message_you = "You have Twisted Reflection!",
	corruptsoul_warn = "%s has healed Lord Kazzak by dying!",
	corruptsoul_warn_you = "You have healed Lord Kazzak by dying!",

	supreme1min = "Supreme mode in 1 minute!",
	supreme30sec = "Supreme mode in 30 seconds!",
	supreme10sec = "Supreme mode in 10 seconds!",

	enrage_bar = "Supreme mode",
	voidbolt_bar = "Void Bolt",
	mark_bar = "%s: Mark of Kazzak",
	twisted_bar = "%s: Twisted Reflection",

	supreme_cmd = "supreme",
	supreme_name = "Supreme Alert",
	supreme_desc = "Warn for Supreme Mode.",

	voidbolt_cmd = "voidbolt",
	voidbolt_name = "Void Bolt",
	voidbolt_desc = "Show notifications for Void Bolt.",

	corruptsoul_cmd = "corruptsoul",
	corruptsoul_name = "Corrupt Soul",
	corruptsoul_desc = "Warn when boss gets healed from random deaths.",

	markofkazzak_cmd = "markofkazzak",
	markofkazzak_name = "Mark of Kazzak",
	markofkazzak_desc = "Warn when people get the mana drain debuff from the boss.",

	twistedreflection_cmd = "twistedreflection",
	twistedreflection_name = "Twisted Reflection",
	twistedreflection_desc = "Warn when people get the debuff that heals the boss for 25000 HP each time it hits them.",

	puticon_cmd = "puticon",
	puticon_name = "Raid Icon on Mark target",
	puticon_desc = "Put a Raid Icon on the person who got Mark of Kazzak.\n\n(Requires assistant or higher)",
} end )

L:RegisterTranslations("esES", function() return {
	cmd = "Kazzak",

	starttrigger1 = "All mortals will perish!",
	starttrigger2 = "The Legion will conquer all!",
	markofkazzakyou_trigger = "Sufres de Marca de Kazzak.",
	markofkazzakother_trigger = "(.*) sufre de Marca de Kazzak.",
	markofkazzakyouend_trigger = "Marca de Kazzak acaba de disiparse.",
	markofkazzakotherend_trigger = "Marca de Kazzak desaparece de (.*).",
	twistedreflectionyou_trigger = "Sufres de Reflejo retorcido.",
	twistedreflectionother_trigger = "(.*) sufre fde Reflejo retorcido.",
	twistedreflectionyouend_trigger = "Reflejo retorcido acaba de disiparse.",
	twistedreflectionotherend_trigger = "Reflejo retorcido desaparece de (.*).",
	deathyou_trigger = "Mueres\.",
	deathother_trigger = "(.*) muere.",
	voidbolt_trigger = "Lord Kazzak comienza a lanzar Descarga del Vacío.",
	attack_trigger1 = "Lord Kazzak ataca",
	attack_trigger2 = "Lord Kazzak falla",
	attack_trigger3 = "Lord Kazzak golpe",
	attack_trigger4 = "Lord Kazzak golpe crítico",
	enrage_trigger = "Lord Kazzak gana Berserk.",
	enrageyell_trigger = "Kazzak está supremo!",
	bosskill_trigger = "The Legion... will never... fall.",

	engagewarn = "¡Entablado combate con Lord Kazzak! 3 minutos hasta Supremo!",
	enrage_warm = "¡Lord Kazzak está supremo!",
	makrofkazzak_warn = "¡%s tiene Marca de Kazzak! Déshazla!",
	twistedreflection_warn = "¡%s tiene Reflejo retorcido! Disípalo!",
	mark_message_you = "¡Tienes Marca de Kazzak! No pierdas maná!",
	reflection_message_you = "Tiene Reflejo retorcido!",
	corruptsoul_warn = "¡%s ha curado a Lord Kazzak por morirse!",
	corruptsoul_warn_you = "¡Has curado a Lord Kazzak por morirse!",

	supreme1min = "¡Modo supremo en 1 minuto!",
	supreme30sec = "¡Modo supremo en 30 segundos!",
	supreme10sec = "¡Modo supremo en 10 segundos!",

	enrage_bar = "Modo supremo",
	voidbolt_bar = "Descarga del Vacío",
	mark_bar = "%s: Marca de Kazzak",
	twisted_bar = "%s: Reflejo retorcido",

	--supreme_cmd = "supreme",
	supreme_name = "Alerta de Supremo",
	supreme_desc = "Avisa para Modo supremo.",

	--voidbolt_cmd = "voidbolt",
	voidbolt_name = "Descarga del Vacío",
	voidbolt_desc = "Avisa para Descarga del Vacío.",

	--corruptsoul_cmd = "corruptsoul",
	corruptsoul_name = "Alma Corrupto",
	corruptsoul_desc = "Avisa cuando se cura el jefe porque se muere un jugador.",

	--markofkazzak_cmd = "markofkazzak",
	markofkazzak_name = "Marca de Kazzak",
	markofkazzak_desc = "Avisa para Marca de Kazzak.",

	--twistedreflection_cmd = "twistedreflection",
	twistedreflection_name = "Reflejo retorcido",
	twistedreflection_desc = "Avisa para Reflejo retorcido.",

	--puticon_cmd = "puticon",
	puticon_name = "Marcar para Marca de Kazzak",
	puticon_desc = "Marca con un icono el jugador quien tiene Marca de Kazzak.\n\n(Require asistente o líder)",
} end )
------------------------------
--      Initialization      --
------------------------------

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "EventSelf")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "EventSelf")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")

	self:ThrottleSync(2, syncName.markStart)
	self:ThrottleSync(2, syncName.markStop)
	self:ThrottleSync(2, syncName.reflectionStart)
	self:ThrottleSync(2, syncName.reflectionStop)
	self:ThrottleSync(5, syncName.voidboltStart)
	self:ThrottleSync(5, syncName.voidboltStop)
	self:ThrottleSync(5, syncName.supreme)
	self:ThrottleSync(5, syncName.dead)

end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH")
	voidbolttime = 0
	castingvoidbolt = false
end

-- called after boss is engaged
function module:OnEngage()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end

------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_COMBAT_FRIENDLY_DEATH(msg)
	BigWigs:CheckForWipe(self)
	local _,_,otherdeath,_ = string.find(msg, L["deathother_trigger"])
	if string.find(msg, L["deathyou_trigger"]) then
		if self.db.profile.markofkazzak then
			self:RemoveBar(string.format(L["mark_bar"], UnitName("player")))
		end
		if self.db.profile.puticon then
			self:RemoveIcon()
		end
		if self.db.profile.twistedreflection then
			self:RemoveBar(string.format(L["twisted_bar"], UnitName("player")))
		end
		if self.db.profile.corruptsoul then
			self:Message(L["corruptsoul_warn_you"], "Attention")
		end
		self:Sync(syncName.randomDeath.." "..UnitName("player"))
	elseif otherdeath then
		self:Sync(syncName.randomDeath.." "..otherdeath)
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if self.db.profile.supreme and string.find(msg, L["starttrigger1"]) or  string.find(msg, L["starttrigger2"]) then
		self:Message(L["engagewarn"], "Important")
		self:DelayedMessage(timer.supreme - 60, L["supreme1min"], "Attention")
		self:DelayedMessage(timer.supreme - 30, L["supreme30sec"], "Urgent")
		self:DelayedMessage(timer.supreme - 10, L["supreme10sec"], "Important")
		self:Bar(L["enrage_bar"], timer.supreme, "Interface\\Icons\\Spell_Shadow_ShadowWordPain", "Green", "Yellow", "Orange", "Red")
	elseif self.db.profile.supreme and string.find(msg, L["enrageyell_trigger"]) then
		self:Message(L["enrage_warm"], "Important")
	elseif string.find(msg, L["bosskill_trigger"]) then
		self:Sync(syncName.dead)
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if string.find(msg, L["voidbolt_trigger"]) then
		self:Sync(syncName.voidboltStart)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if string.find(msg, L["enrage_trigger"]) then
		self:Sync(syncName.supreme)
	end
end

function module:EventSelf(msg)
	if string.find(msg, L["markofkazzakyou_trigger"]) then
		if self.db.profile.markofkazzak then
			self:Message(L["mark_message_you"], "Attention", true, "Alert")
			self:Bar(string.format(L["mark_bar"], UnitName("player")), timer.mark, icon.mark, true, "white")
		end
		if self.db.profile.puticon then
			self:Icon(UnitName("player"))
		end
		self:Sync(syncName.markStart.." "..UnitName("player"))
	elseif string.find(msg, L["markofkazzakyouend_trigger"]) then
		if self.db.profile.markofkazzak then
			self:RemoveBar(string.format(L["mark_bar"], UnitName("player")))
		end
		if self.db.profile.puticon then
			self:RemoveIcon()
		end
		self:Sync(syncName.markStop.." "..UnitName("player"))
	elseif string.find(msg, L["twistedreflectionyou_trigger"]) then
		if self.db.profile.twistedreflection then
			self:Message(L["reflection_message_you"], "Attention")
			self:Bar(string.format(L["twisted_bar"], UnitName("player")), timer.twisted, icon.twisted, true, "magenta")
		end
		self:Sync(syncName.reflectionStart.." "..UnitName("player"))
	elseif string.find(msg, L["twistedreflectionyouend_trigger"]) then
		if self.db.profile.twistedreflection then
			self:RemoveBar(string.format(L["twisted_bar"], UnitName("player")))
		end
		self:Sync(syncName.reflectionStop.." "..UnitName("player"))
	end
end

function module:Event(msg)
	local _,_,markofkazzakother,_ = string.find(msg, L["markofkazzakother_trigger"])
	local _,_,markofkazzakotherend,_ = string.find(msg, L["markofkazzakotherend_trigger"])
	local _,_,twistedreflectionother,_ = string.find(msg, L["twistedreflectionother_trigger"])
	local _,_,twistedreflectionotherend,_ = string.find(msg, L["twistedreflectionotherend_trigger"])
	if markofkazzakother then
		self:Sync(syncName.markStart.." "..markofkazzakother)
	elseif markofkazzakotherend then
		self:Sync(syncName.markStop.." "..markofkazzakotherend)
	elseif twistedreflectionother then
		self:Sync(syncName.reflectionStart.." "..twistedreflectionother)
	elseif twistedreflectionotherend then
		self:Sync(syncName.reflectionStop.." "..twistedreflectionotherend)
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.markStart and rest ~= UnitName("player") then
		if self.db.profile.markofkazzak then
			self:Message(string.format(L["makrofkazzak_warn"], rest), "Important")
			self:TriggerEvent("BigWigs_SendTell", rest, L["mark_message_you"])
			self:Bar(string.format(L["mark_bar"], rest), timer.mark, icon.mark, true, "white")
		end
		if self.db.profile.puticon then
			self:Icon(rest)
		end
	elseif sync == syncName.markStop and rest ~= UnitName("player") then
		if self.db.profile.markofkazzak then
			self:RemoveBar(string.format(L["mark_bar"], rest))
		end
		if self.db.profile.puticon then
			self:RemoveIcon()
		end
	elseif sync == syncName.reflectionStart and rest ~= UnitName("player") then
		if self.db.profile.twistedreflection then
			self:Message(string.format(L["twistedreflection_warn"], rest), "Important")
			self:Bar(string.format(L["twisted_bar"], rest), timer.twisted, icon.twisted, true, "magenta")
		end
	elseif sync == syncName.reflectionStop and rest ~= UnitName("player") then
		if self.db.profile.twistedreflection then
			self:RemoveBar(string.format(L["twisted_bar"], rest))
		end
	elseif sync == syncName.randomDeath and rest ~= UnitName("player") then
		if self.db.profile.markofkazzak then
			self:RemoveBar(string.format(L["mark_bar"], rest))
		end
		if self.db.profile.puticon then
			self:RemoveIcon()
		end
		if self.db.profile.twistedreflection then
			self:RemoveBar(string.format(L["twisted_bar"], rest))
		end
		if self.db.profile.corruptsoul then
			self:Message(string.format(L["corruptsoul_warn"], rest), "Important")
		end
	elseif sync == syncName.voidboltStart then
		voidbolttime = GetTime()
		castingvoidbolt = true
		if self.db.profile.voidbolt then
			self:Bar(L["voidbolt_bar"], timer.voidbolt, icon.voidbolt, true, "purple")
		end
	elseif sync == syncName.voidboltStop then
		castingvoidbolt = false
		if self.db.profile.voidbolt then
			self:RemoveBar(L["voidbolt_bar"])
		end
	elseif sync == syncName.supreme and self.db.profile.supreme then
		self:Message(L["voidbolt_bar"], "Important")
	elseif sync == syncName.dead then
		if self.db.profile.bosskill then
			self:Message(string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], self.translatedName), "Bosskill", nil, "Victory")
		end
		self:RemoveIcon()
		self.core:ToggleModuleActive(self, false)
	end
end

function module:Melee(msg)
	if string.find(msg, L["attack_trigger1"]) or string.find(msg, L["attack_trigger2"]) or string.find(msg, L["attack_trigger3"]) or string.find(msg, L["attack_trigger4"]) then
		if castingvoidbolt then
			if (GetTime() - voidbolttime) < 1.5 then
				self:Sync(syncName.voidboltStop)
			elseif (GetTime() - voidbolttime) >= 1.5 then
				castingvoidbolt = false
			end
		end
	end
end
