
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Majordomo Executus", "Molten Core")

module.revision = 20007 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"magic", "dmg", "adds", "bosskill"}

module.defaultDB = {
	adds = false,
}

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	shieldDuration = 10,
	shieldInterval = 30,
	firstShield = 30,
}
local icon = {
	shield = "Spell_Shadow_DetectLesserInvisibility",
	magic = "Spell_Frost_FrostShock",
	dmg = "Spell_Shadow_AntiShadow",
}
local syncName = {
	dmg = "DomoAuraDamage"..module.revision,
	magic = "DomoAuraMagic"..module.revision,
	healerDead = "DomoHealerDead",
	eliteDead = "DomoEliteDead",
}



----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	disabletrigger = "My flame! Please don",
	engage_trigger = "Reckless mortals, none may challenge the sons of the living flame!",

	magic_trigger = "gains Magic Reflection",
	dmg_trigger = "gains Damage Shield",
	magic_over_trigger = "Magic Reflection fades",
	damage_over_trigger = "Damage Shield fades",
	healdead = "Flamewaker Healer dies",
	elitedead = "Flamewaker Elite dies",
	elitename = "Flamewaker Elite",
	healername = "Flamewaker Healer",

	magic_warn = "Magic Reflection for 10 seconds!",
	dmg_warn = "Damage Shield for 10 seconds!",
	shield_warn_soon = "3 seconds until new auras!",
	magic_over_warn = "Magic Reflection down!",
	dmg_over_warn = "Damage Shield down!",
	hdeadmsg = "%d/4 Flamewaker Healers dead!",
	edeadmsg = "%d/4 Flamewaker Elites dead!",

	magic_bar = "Magic Reflection",
	dmg_bar = "Damage Shield",
	shield_bar = "New shields",

	cmd = "Majordomo",

	adds_cmd = "adds",
	adds_name = "Dead adds counter",
	adds_desc = "Announces dead Healers and Elites",

	magic_cmd = "magic",
	magic_name = "Magic Reflection",
	magic_desc = "Warn for Magic Reflection",

	dmg_cmd = "dmg",
	dmg_name = "Damage Shield",
	dmg_desc = "Warn for Damage Shield",
} end)

L:RegisterTranslations("esES", function() return {
	disabletrigger = "¡Mis llamas!",
	engage_trigger = "¡Imprudentes mortales! ¡Nadie puede enfrentarse a los Hijos de la Llama viviente!",

	magic_trigger = "gana Refracción mágica",
	dmg_trigger = "gana Escudo de daños",
	magic_over_trigger = "Refracción mágica desaparece",
	damage_over_trigger = "Escudo de daños desaparece",
	healdead = "Sanador despiertallamas muere",
	elitedead = "Élite despiertallamas muere",
	elitename = "Élite despiertallamas",
	healername = "Sanador despiertallamas",

	magic_warn = "¡Refracción mágica por 10 segundos!",
	dmg_warn = "¡Escudo de daños por 10 segundos!",
	shield_warn_soon = "¡3 segundos hasta nuevas auras!",
	magic_over_warn = "¡Refracción mágica no está activo!",
	dmg_over_warn = "¡Escudo de daños no está activo!",
	hdeadmsg = "¡%d/4 Sanador despiertallamas muertos!",
	edeadmsg = "¡%d/4 Élite despiertallamas muertos!",

	magic_bar = "Refracción mágica",
	dmg_bar = "Escudo de daños",
	shield_bar = "Nuevo escudo",

	--cmd = "Majordomo",

	--adds_cmd = "adds",
	adds_name = "Contador de Sanadores y Élites muertos",
	adds_desc = "Anuncia Sanadores y Élites muertos",

	--magic_cmd = "magic",
	magic_name = "Refracción mágica",
	magic_desc = "Avisa para Refracción mágica",

	--dmg_cmd = "dmg",
	dmg_name = "Escudo de daños",
	dmg_desc = "Avisa para Escudo de daños",
} end)

L:RegisterTranslations("deDE", function() return {
	disabletrigger = "Ich werde euch nun verlassen",
	engage_trigger = "Niemand fordert die Söhne der Lebenden Flamme heraus", --"Reckless mortals, none may challenge the sons of the living flame!",

	magic_trigger = "bekommt \'Magiereflexion'",
	dmg_trigger = "bekommt \'Schadensschild'",
	magic_over_trigger = "Magiereflexion schwindet von",
	damage_over_trigger = "Schadensschild schwindet von",
	healdead = "Feuerschuppenheiler stirbt",
	elitedead = "Feuerschuppenelite stirbt",
	elitename = "Feuerschuppenelite",
	healername = "Feuerschuppenheiler",

	magic_warn = "Magiereflexion für 10 Sekunden!",
	dmg_warn = "Schadensschild für 10 Sekunden!",
	shield_warn_soon = "Neue Schilder in 3 Sekunden!",
	magic_over_warn = "Magiereflexion beendet!",
	dmg_over_warn = "Schadensschild beendet!",
	hdeadmsg = "%d/4 Heiler tot!",
	edeadmsg = "%d/4 Elite tot!",

	--cmd = "Majordomo",

	magic_bar = "Magiereflexion",
	dmg_bar = "Schadensschild",
	shield_bar = "Nächstes Schild",

	--adds_cmd = "adds",
	adds_name = "Zähler für tote Adds",
	adds_desc = "Verkündet Feuerschuppenheiler und Feuerschuppenelite Tod.",

	--magic_cmd = "magic",
	magic_name = "Magiereflexion",
	magic_desc = "Warnung, wenn Magiereflexion aktiv.",

	--dmg_cmd = "dmg",
	dmg_name = "Schadensschild",
	dmg_desc = "Warnung, wenn Schadensschild aktiv.",
} end)


------------------------------
--      Initialization      --
------------------------------

module.wipemobs = { L["elitename"], L["healername"] }
module:RegisterYellEngage(L["engage_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:ThrottleSync(2, syncName.dmg)
	self:ThrottleSync(2, syncName.magic)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")

	self.started = nil
	self.hdead = 0
	self.edead = 0
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.magic or self.db.profile.dmg then
		self:Bar(L["shield_bar"], timer.firstShield, icon.shield)
		self:DelayedMessage(timer.firstShield - 5, L["shield_warn_soon"], "Urgent", nil, nil, true)
	end
	--self:TriggerEvent("BigWigs_StartCounterBar", self, "Priests dead", 4, "Interface\\Icons\\Spell_Holy_BlessedRecovery")
	--self:TriggerEvent("BigWigs_SetCounterBar", self, "Priests dead", (4 - 0.1))
	--self:TriggerEvent("BigWigs_StartCounterBar", self, "Elites dead", 4, "Interface\\Icons\\Ability_Hunter_Harass")
	--self:TriggerEvent("BigWigs_SetCounterBar", self, "Elites dead", (4 - 0.1))
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["disabletrigger"]) then
		self:SendBossDeathSync()
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if string.find(msg, L["magic_trigger"]) then
		self:Sync(syncName.magic)
	elseif string.find(msg, L["dmg_trigger"]) then
		self:Sync(syncName.dmg)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if string.find(msg, L["healdead"]) then
		self:Sync(syncName.healerDead .. " " .. tostring(self.hdead + 1))
	elseif string.find(msg, L["elitedead"]) then
		self:Sync(syncName.eliteDead .. " " .. tostring(self.edead + 1))
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == "DomoHealerDead" and rest and rest ~= "" then
		rest = tonumber(rest)
		if rest <= 4 and self.hdead < rest then
			self.hdead = rest
			if self.db.profile.adds then
				self:TriggerEvent("BigWigs_Message", string.format(L["hdeadmsg"], self.hdead), "Positive")
				--self:TriggerEvent("BigWigs_SetCounterBar", self, "Priests dead", (4 - self.hdead))
			end
		end
	elseif sync == "DomoEliteDead" and rest and rest ~= "" then
		rest = tonumber(rest)
		if rest <= 4 and self.edead < rest then
			self.edead = rest
			if self.db.profile.adds then
				self:TriggerEvent("BigWigs_Message", string.format(L["edeadmsg"], self.edead), "Positive")
				--self:TriggerEvent("BigWigs_SetCounterBar", self, "Elites dead", (4 - self.edead))
			end
		end
	elseif sync == syncName.magic then
		self:MagicShield()
	elseif sync == syncName.dmg then
		self:DamageShield()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:MagicShield()
	if self.db.profile.magic then
		self:RemoveBar(L["shield_bar"])
		self:Message(L["magic_warn"], "Attention")
		self:Bar(L["magic_bar"], timer.shieldDuration, icon.magic)
	end
	if self.db.profile.magic or self.db.profile.dmg then
		self:DelayedBar(timer.shieldDuration, L["shield_bar"], timer.shieldInterval - timer.shieldDuration, icon.shield)
		self:DelayedMessage(timer.shieldInterval - 5, L["shield_warn_soon"], "Urgent", nil, nil, true)
	end
end

function module:DamageShield()
	if self.db.profile.dmg then
		self:RemoveBar(L["shield_bar"])
		self:Message(L["dmg_warn"], "Attention")
		self:Bar(L["dmg_bar"], timer.shieldDuration, icon.dmg)
	end
	if self.db.profile.magic or self.db.profile.dmg then
		self:DelayedBar(timer.shieldDuration, L["shield_bar"], timer.shieldInterval - timer.shieldDuration, icon.shield)
		self:DelayedMessage(timer.shieldInterval - 5, L["shield_warn_soon"], "Urgent", nil, nil, true)
	end
end
