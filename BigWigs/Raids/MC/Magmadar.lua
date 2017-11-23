
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Magmadar", "Molten Core")

module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"panic", "frenzy", "bosskill"}


---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	earliestPanic = 30,
	latestPanic = 35,
	firstPanicDelay = 10 - 30,
	frenzy = 8,
	firstFrenzy = 15
}
local icon = {
	panic = "Spell_Shadow_DeathScream",
	frenzy = "Ability_Druid_ChallangingRoar",
	tranquil = "Spell_Nature_Drowsy",
}
local syncName = {
	panic = "MagmadarPanic"..module.revision,
	frenzy = "MagmadarFrenzyStart"..module.revision,
	frenzyOver = "MagmadarFrenzyStop"..module.revision,
}


local _, playerClass = UnitClass("player")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	-- Chat message triggers
	frenzy_trigger = "goes into a killing frenzy!",
	panic_trigger = "afflicted by Panic.",
	panic_trigger2 = "Panic fail(.+) immune.",
	panic_trigger3 = "Magmadar's Panic was resisted",
	frenzy_bar = "Frenzy",
	frenzyfade_trigger = "Frenzy fades from Magmadar",

	-- Warnings and bar texts
	frenzyann = "Frenzy! Tranq now!",
	fearsoon = "Panic incoming soon!",
	feartime = "Fear! 30 seconds until next!",
	fearbar = "Panic",

	-- AceConsole strings
	cmd = "Magmadar",

	panic_cmd = "panic",
	panic_name = "Warn for Panic",
	panic_desc = "Warn when Magmadar casts Panic",

	frenzy_cmd = "frenzy",
	frenzy_name = "Frenzy alert",
	frenzy_desc = "Warn when Magmadar goes into a frenzy",
} end)

L:RegisterTranslations("esES", function() return {
	-- Chat message triggers
	frenzy_trigger = "Gana Frenesí",
	panic_trigger = "sufre de Pánico.",
	panic_trigger2 = "falla(.+) Pánico inmune.",
	panic_trigger3 = "Resistido Pánico de Magmadar",
	frenzy_bar = "Frenesí",
	frenzyfade_trigger = "Frenesí desaparece de Magmadar",

	-- Warnings and bar texts
	frenzyann = "¡Frenesí! Disparo tranquilizante ahora!",
	fearsoon = "¡Pánico entrante pronto!",
	feartime = "¡Miedo! 30 segundos hasta el próximo!",
	fearbar = "Pánico",

	-- AceConsole strings
	--cmd = "Magmadar",

	--panic_cmd = "panic",
	panic_name = "Avisar para Pánico",
	panic_desc = "Avisa cuando Magmadar lance Pánico",

	--frenzy_cmd = "frenzy",
	frenzy_name = "Alerta de Frenesí",
	frenzy_desc = "Avisa cuando gane Frenesí Magmadar",
} end)

L:RegisterTranslations("deDE", function() return {
	frenzy_trigger = "wird mörderisch wahnsinnig!",
	panic_trigger = "von Panik betroffen",
	panic_trigger2 = "Panik(.+)immun",
	panic_trigger3 = "Panik(.+)widerstanden",
	frenzy_bar = "Wutanfall",
	frenzyfade_trigger = "Wutanfall schwindet von Magmadar.",

	frenzyann = "Raserei! Tranq jetzt!",
	fearsoon = "Panik in 5 Sekunden!",
	feartime = "AoE Furcht! Nächste in 30 Sekunden!",
	fearbar = "Panik",

	--panic_cmd = "panic",
	panic_name = "Alarm für Panik",
	panic_desc = "Warnung, wenn Magmadar AoE Furcht wirkt.",

	--frenzy_cmd = "frenzy",
	frenzy_name = "Alarm für Raserei",
	frenzy_desc = "Warnung, wenn Magmadar in Raserei gerät.",
} end)

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckPanic")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckPanic")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckPanic")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "CheckPanic")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "CheckPanic")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "CheckPanic")

	self:ThrottleSync(15, syncName.panic)
	self:ThrottleSync(5, syncName.frenzy)
	self:ThrottleSync(5, syncName.frenzyOver)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
end

-- called after boss is engaged
function module:OnEngage()
	self:Panic(timer.firstPanicDelay) -- 20s earlier than normal
	self:Bar(L["frenzy_bar"], timer.firstFrenzy, icon.frenzy, true, "red")
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CheckPanic(msg)
	if ((string.find(msg, L["panic_trigger"])) or (string.find(msg, L["panic_trigger2"])) or (string.find(msg, L["panic_trigger3"]))) then
		self:Sync(syncName.panic)
	end
end

function module:CHAT_MSG_MONSTER_EMOTE(msg)
	if string.find(arg1, L["frenzy_trigger"]) and self.db.profile.frenzy then
		self:Sync(syncName.frenzy)
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_OTHER(msg)
	if string.find(msg, L["frenzyfade_trigger"]) then
		self:Sync(syncName.frenzyOver)
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.panic then
		self:Panic()
	elseif sync == syncName.frenzy then
		self:Frenzy()
	elseif sync == syncName.frenzyOver then
		self:FrenzyOver()
	elseif sync == "MagmadarLavaBomb" then
	--self:Bar("Lava Bomb", 11, "Spell_Fire_SelfDestruct")
	--self:Sync(11, "MagmadarLavaBomb")
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Panic(delay)
	if self.db.profile.panic then
		if not delay then
			delay = 0
			self:Message(L["feartime"], "Important")
		end

		self:DelayedMessage(timer.earliestPanic - 5 + delay, L["fearsoon"], "Urgent", nil, nil, true)
		self:IntervalBar(L["fearbar"], timer.earliestPanic + delay, timer.latestPanic + delay, icon.panic)

		if playerClass == "WARRIOR" then
			self:DelayedSound(timer.earliestPanic - 10 + delay, "Ten")
			self:DelayedSound(timer.earliestPanic - 3 + delay, "Three")
			self:DelayedSound(timer.earliestPanic - 2 + delay, "Two")
			self:DelayedSound(timer.earliestPanic - 1 + delay, "One")
		end
	end
end

function module:Frenzy()
	if self.db.profile.frenzy then
		self:Message(L["frenzyann"], "Important", true, "Alert")
		self:Bar(L["frenzy_bar"], timer.frenzy, icon.frenzy, true, "red")
		if playerClass == "HUNTER" then
			self:WarningSign(icon.tranquil, timer.frenzy, true)
		end
	end
end
function module:FrenzyOver()
	self:RemoveBar(L["frenzy_bar"])
	self:RemoveWarningSign(icon.tranquil, true)
end
