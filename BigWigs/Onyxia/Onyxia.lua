------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Onyxia"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Onyxia",

	deepbreath_cmd = "deepbreath",
	deepbreath_name = "Deep Breath",
	deepbreath_desc = "Warn when Onyxia begins to cast Deep Breath.",

	flamebreath_cmd = "flamebreath",
	flamebreath_name = "Flame Breath",
	flamebreath_desc = "Warn when Onyxia begins to cast Flame Breath.",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Wing Buffet",
	wingbuffet_desc = "Warn for Wing Buffet.",

	fireball_cmd = "fireball",
	fireball_name = "Fireball",
	fireball_desc = "Warn for Fireball.",

	phase_cmd = "phase",
	phase_name = "Phase",
	phase_desc = "Warn for Phase Change.",

	onyfear_cmd = "onyfear",
	onyfear_name = "Fear",
	onyfear_desc = "Warn for Bellowing Roar in phase 3.",

	deepbreath_trigger = "Onyxia takes in a deep breath",
	flamebreath_trigger = "Onyxia begins to cast Flame Breath\.",
	wingbuffet_trigger = "Onyxia begins to cast Wing Buffet\.",
	fireball_trigger = "Onyxia begins to cast Fireball\.",
	phase2_trigger = "from above",
	phase3_trigger = "It seems you'll need another lesson",
	fear_trigger = "Onyxia begins to cast Bellowing Roar\.",

	warn1 = "Deep Breath incoming!",
	phase1text = "Phase 1",
	phase2text = "Phase 2",
	phase3text = "Phase 3",
	feartext = "Fear soon!",
	fear_cast = "Fear",
	deepbreath_cast = "Deep Breath",
	flamebreath_cast = "Flame Breath",
	wingbuffet_cast = "Wing Buffet",
	fireball_cast = "Fireball",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Onyxia",

	deepbreath_cmd = "deepbreath",
	deepbreath_name = "Tiefer Atem",
	deepbreath_desc = "Warnen, wenn Onyxia beginnt Tiefer Atem zu casten.",

	flamebreath_cmd = "flamebreath",
	flamebreath_name = "Flammenatem",
	flamebreath_desc = "Warnen, wenn Onyxia beginnt Flammenatem zu casten.",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Fl\195\188gelsto\195\159",
	wingbuffet_desc = "Alarm f\195\188r Fl\195\188gelsto\195\159.",

	fireball_cmd = "fireball",
	fireball_name = "Feuerball",
	fireball_desc = "Alarm f\195\188r Feuerball.",

	phase_cmd = "phase",
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses.",

	onyfear_cmd = "onyfear",
	onyfear_name = "Furcht",
	onyfear_desc = "Warne vor Dr\195\182hnendes Gebr\195\188ll in Phase 3.",

	deepbreath_trigger = "Onyxia takes in a deep breath",
	flamebreath_trigger = "Onyxia beginnt Flammenatem zu wirken\.",
	wingbuffet_trigger = "Onyxia beginnt Fl\195\188gelsto\195\159 zu wirken\.",
	fireball_trigger = "Onyxia beginnt Feuerball zu wirken\.",
	fear_trigger = "Onyxia beginnt Dr\195\182hnendes Gebr\195\188ll zu wirken\.",
	phase2_trigger = "from above",
	phase3_trigger = "It seems you'll need another lesson",

	warn1 = "Tiefer Atem kommen!",
	phase1text = "Phase 1",
	phase2text = "Phase 2",
	phase3text = "Phase 3",
	feartext = "Furcht bald!",
	fear_cast = "Furcht",
	deepbreath_cast = "Tiefer Atem",
	flamebreath_cast = "Flammenatem",
	wingbuffet_cast = "Fl\195\188gelsto\195\159",
	fireball_cast = "Feuerball",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsOnyxia = BigWigs:NewModule(boss)
BigWigsOnyxia.zonename = AceLibrary("Babble-Zone-2.2")["Onyxia's Lair"]
BigWigsOnyxia.enabletrigger = boss
BigWigsOnyxia.toggleoptions = { "flamebreath", "deepbreath", "wingbuffet", "fireball", "phase", "onyfear", "bosskill"}
BigWigsOnyxia.revision = tonumber(string.sub("$Revision: 11204 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsOnyxia:OnEnable()
	transitioned = false
	started = false
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("UNIT_HEALTH")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "OnyDeepBreath", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "OnyPhaseTwo", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "OnyPhaseThree", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "OnyFlameBreath", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "OnyFireball", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "OnyBellowingRoar", 5)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsOnyxia:CHAT_MSG_MONSTER_EMOTE(msg)
	if string.find(msg, L["deepbreath_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "OnyDeepBreath")
	end
end

function BigWigsOnyxia:CHAT_MSG_MONSTER_YELL(msg)
	if (string.find(msg, L["phase2_trigger"])) then
		self:TriggerEvent("BigWigs_SendSync", "OnyPhaseTwo")
	elseif (string.find(msg, L["phase3_trigger"])) then
		self:TriggerEvent("BigWigs_SendSync", "OnyPhaseThree")
	end
end

function BigWigsOnyxia:UNIT_HEALTH(arg1) --temporary workaround until Phase2 yell gets fixed
	if UnitName(arg1) == boss then
		local health = UnitHealth(arg1)
		if health > 650000 and health <= 689635 and not transitioned then
			self:TriggerEvent("BigWigs_SendSync", "OnyPhaseTwo")
		elseif health > 689635 then
			transitioned = false
		end
	end
end

function BigWigsOnyxia:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["fear_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "OnyBellowingRoar")
	elseif msg == L["flamebreath_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "OnyFlameBreath")
	elseif msg == L["wingbuffet_trigger"] and self.db.profile.wingbuffet then -- made local because 1s cast, with sync it would not be very accurate
		self:TriggerEvent("BigWigs_StartBar", self, L["wingbuffet_cast"], 1, "Interface\\Icons\\INV_Misc_MonsterScales_14", true, "yellow")
	elseif msg == L["fireball_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "OnyFireball")
	end
end

function BigWigsOnyxia:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BossEngaged" and rest == "Onyxia" then
		if self.db.profile.phase and not started then
			self:TriggerEvent("BigWigs_Message", L["phase1text"], "Attention")
		end
		started = true
	elseif sync == "OnyPhaseTwo" then
		transitioned = true --to stop sending new syncs
		if self.db.profile.phase then
			self:TriggerEvent("BigWigs_Message", L["phase2text"], "Attention")
		end
	elseif sync == "OnyPhaseThree" and self.db.profile.phase then
		self:TriggerEvent("BigWigs_Message", L["phase3text"], "Attention")
	elseif sync == "OnyDeepBreath" and self.db.profile.deepbreath then
		self:TriggerEvent("BigWigs_Message", L["warn1"], "Important", true, "Alarm")
		self:TriggerEvent("BigWigs_StartBar", self, L["deepbreath_cast"], 5, "Interface\\Icons\\Spell_Fire_SelfDestruct", true, "black")
	elseif sync == "OnyFlameBreath" and self.db.profile.flamebreath then 
		self:TriggerEvent("BigWigs_StartBar", self, L["flamebreath_cast"], 2, "Interface\\Icons\\Spell_Fire_Fire")
	elseif sync == "OnyFireball" and self.db.profile.fireball then 
		self:TriggerEvent("BigWigs_StartBar", self, L["fireball_cast"], 3, "Interface\\Icons\\Spell_Fire_FlameBolt", true, "red")
	elseif sync == "OnyBellowingRoar" and self.db.profile.onyfear then 
		self:TriggerEvent("BigWigs_Message", L["feartext"], "Important", "Alarm")
		self:TriggerEvent("BigWigs_StartBar", self, L["fear_cast"], 1.5, "Interface\\Icons\\Spell_Fire_Fire", true, "white")
	end
end
