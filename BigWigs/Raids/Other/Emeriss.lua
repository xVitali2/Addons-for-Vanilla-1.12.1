----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Emeriss", "Ashenvale")

module.revision = 20008 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"noxious", "volatileyou", "volatileother", "bosskill"}
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Outdoor Raid Bosses Zone"],
	AceLibrary("Babble-Zone-2.2")["Ashenvale"],
	AceLibrary("Babble-Zone-2.2")["Duskwood"],
	AceLibrary("Babble-Zone-2.2")["The Hinterlands"],
	AceLibrary("Babble-Zone-2.2")["Feralas"]
}

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	firstBreath = 7,
	breath = 9,
	corruption = 10,
}
local icon = {
	breath = "Interface\\Icons\\Spell_Shadow_LifeDrain02",
	corruption = "Interface\\Icons\\Ability_Creature_Cursed_03",
}
local syncName = {
	}

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Emeriss",

	noxious_cmd = "noxious",
	noxious_name = "Noxious breath alert",
	noxious_desc = "Warn for noxious breath",

	volatileyou_cmd = "volatileyou",
	volatileyou_name = "Voltile infection on you alert",
	volatileyou_desc = "Warn for volatile infection on you",

	volatileother_cmd = "volatileother",
	volatileother_name = "Volatile infection on others alert",
	volatileother_desc = "Warn for volatile infection on others",

	volatile_trigger = "^([^%s]+) ([^%s]+) afflicted by Volatile Infection",
	breath_trigger = "afflicted by Noxious Breath",
	engage_trigger = "Hope is a DISEASE of the soul! This land shall wither and die!",
	corruption_trigger = "Taste your world's corruption!",

	volatileYou_warn = "You are afflicted by Volatile Infection!",
	volatileOther_warn = " is afflicted by Volatile Infection!",
	breathSoon_warn = "Noxious Breath soon!",
	breath_warn = "Noxious Breath!",
	corruption_warn = "Corruption of the Earth! Heal NoW!",

	isyou = "You",
	isare = "are",

	breath_bar = "Noxious Breath",
	corruption_bar = "Corruption of the Earth",

} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Emeriss",

	--noxious_cmd = "noxious",
	noxious_name = "Alerta de Aliento nocivo",
	noxious_desc = "Avisa para Aliento nocivo",

	--volatileyou_cmd = "volatileyou",
	volatileyou_name = "Alerta personal de Infección volátil",
	volatileyou_desc = "Avisa si tienes Infección volátil",

	--volatileother_cmd = "volatileother",
	volatileother_name = "Alerta de Infección volátil",
	volatileother_desc = "Avisa si otros jugadores tienen Infección volátil",

	volatile_trigger = "^([^%s]+) ([^%s]+) sufre de Infección volátil",
	breath_trigger = "sufre de Aliento nocivo",
	engage_trigger = "Hope is a DISEASE of the soul! This land shall wither and die!",
	corruption_trigger = "Taste your world's corruption!",

	volatileYou_warn = "¡Sufres de Infección volátil!",
	volatileOther_warn = " sufre de Infección volátil!",
	breathSoon_warn = "¡Aliento nocivo pronto!",
	breath_warn = "¡Aliento nocivo!",
	corruption_warn = "¡Corrupción de la Tierra! Cura AHORA!",

	isyou = "Tu",
	isare = "eres",

	breath_bar = "Aliento nocivo",
	corruption_bar = "Corrupción de la Tierra",

} end )
------------------------------
--      Initialization      --
------------------------------

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
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

function module:Event( msg )
	if string.find(msg, L["breath_trigger"]) then
		if self.db.profile.noxious then
			self:CancelDelayedMessage(L["breathSoon_warn"])
			self:DelayedMessage(timer.breath-3, L["breathSoon_warn"], "Important", true, "Alert")
			self:RemoveBar(L["breath_bar"])
			self:Bar(L["breath_bar"], timer.breath, icon.breath)
		end
	else
		local _,_, EPlayer, EType = string.find(msg, L["volatile_trigger"])
		if (EPlayer and EType) then
			if (EPlayer == L["isyou"] and EType == L["isare"]) then
				if self.db.profile.volatileyou then
					self:Message(L["volatileYou_warn"], "Important", true)
				end
			else
				if self.db.profile.volatileother then
					self:Message(EPlayer .. L["volatileOther_warn"], "Attention")
					self:TriggerEvent("BigWigs_SendTell", EPlayer, L["volatileYou_warn"])
				end
			end
		end
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if (msg == L["engage_trigger"]) then
		if self.db.profile.noxious then
			self:CancelDelayedMessage(L["breathSoon_warn"])
			self:DelayedMessage(timer.firstBreath-3, L["breathSoon_warn"], "Important", true, "Alert")
			self:RemoveBar(L["breath_bar"])
			self:Bar(L["breath_bar"], timer.firstBreath, icon.breath)
		end
	elseif (string.find(msg, L["corruption_trigger"])) then
		self:Message(L["corruption_warn"], "Important")
		self:RemoveBar(L["corruption_bar"])
		self:Bar(L["corruption_bar"], timer.corruption, icon.corruption)
	end
end
