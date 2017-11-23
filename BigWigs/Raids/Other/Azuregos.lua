----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Azuregos", "Azshara")

module.revision = 20008 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"teleport", "shield", "bosskill"}

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	--firstTeleport = 20,
	teleport = 30,
	shield = 10,
}
local icon = {
	teleport = "Interface\\Icons\\Spell_Arcane_Blink",
	shield = "Interface\\Icons\\Spell_Frost_FrostShock",
}
local syncName = {
	}

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Azuregos",

	teleport_cmd = "teleport",
	teleport_name = "Teleport Alert",
	teleport_desc = "Warn for teleport",

	shield_cmd = "shield",
	shield_name = "Shield Alert",
	shield_desc = "Warn for shield",

	teleport_trigger = "Come, little ones",
	shieldDown_trigger = "^Reflection fades from Azuregos",
	shieldUp_trigger = "^Azuregos gains Reflection",

	teleport_warn = "Teleport!",
	shieldDown_warn = "Magic Shield down!",
	shieldUp_warn = "Magic Shield UP!",
	teleport_bar = "Teleport",
	teleportSoon_warn = "Teleport soon",

	shield_bar = "Magic Shield",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Azuregos",

	--teleport_cmd = "teleport",
	teleport_name = "Alerta de Portal",
	teleport_desc = "Avisa para portal",

	--shield_cmd = "shield",
	shield_name = "Alerta de Escudo",
	shield_desc = "Avisa para escudo",

	teleport_trigger = "Come, little ones",
	shieldDown_trigger = "^Reflección desaparece de Azuregos",
	shieldUp_trigger = "^Azuregos gana Reflección",

	teleport_warn = "¡Portal!",
	shieldDown_warn = "¡Escudo magia no está activo!",
	shieldUp_warn = "¡Escudo magia está activo!",
	teleport_bar = "Portal",
	teleportSoon_warn = "Portal pronto",

	shield_bar = "Escudo magia",
} end )
------------------------------
--      Initialization      --
------------------------------

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
end

-- called after module is enabled and after each wipe
function module:OnSetup()
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

function module:CHAT_MSG_MONSTER_YELL( msg )
	if self.db.profile.teleport and string.find(msg, L["teleport_trigger"]) then
		self:Message(L["teleport_warn"], "Important")
		self:Bar(L["teleport_bar"], timer.teleport, icon.teleport)
		self:DelayedMessage(timer.teleport-5, L["teleportSoon_warn"], "Important", true, "Alert")
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_OTHER( msg )
	if self.db.profile.shield and string.find(msg, L["shieldDown_trigger"]) then
		self:Message(L["shieldDown_warn"], "Attention")
		self:RemoveBar(L["shield_bar"])
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS( msg )
	if self.db.profile.shield and string.find(msg, L["shieldUp_trigger"]) then
		self:Message(L["shieldUp_warn"], "Important", true, "Alert")
		self:Bar(L["shield_bar"], timer.shield, icon.shield)
	end
end
