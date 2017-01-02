------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Flamegor"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	wingbuffet_trigger = "Flamegor begins to cast Wing Buffet.",
	shadowflame_trigger = "Flamegor begins to cast Shadow Flame.",
	frenzygain_trigger = "Flamegor gains Frenzy.",
	frenzyend_trigger = "Frenzy fades from Flamegor.",

	wingbuffet_message = "Wing Buffet! Next one in 30 seconds!",
	wingbuffet_warning = "TAUNT now! Wing Buffet soon!",
	shadowflame_warning = "Shadow Flame incoming!",
	frenzy_message = "Frenzy! Tranq now!",
	frenzy_bar = "Frenzy",

	wingbuffetcast_bar = "Wing Buffet",
	wingbuffet_bar = "Next Wing Buffet",
	wingbuffet1_bar = "Initial Wing Buffet",
	shadowflame_bar = "Shadow Flame",

	cmd = "Flamegor",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Wing Buffet alert",
	wingbuffet_desc = "Warn when Flamegor casts Wing Buffet.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "Shadow Flame alert",
	shadowflame_desc = "Warn when Flamegor casts Shadow Flame.",

	frenzy_cmd = "frenzy",
	frenzy_name = "Frenzy alert",
	frenzy_desc = "Warn when Flamegor is frenzied.",
} end)

L:RegisterTranslations("deDE", function() return {
	wingbuffet_trigger = "Flamegor beginnt Fl\195\188gelsto\195\159 zu wirken.",
	shadowflame_trigger = "Flamegor beginnt Schattenflamme zu wirken.",
	frenzygain_trigger = "Flamegor bekommt \'Wutanfall\'.",
	frenzyend_trigger = "Wutanfall schwindet von Flamegor.",

	wingbuffet_message = "Fl\195\188gelsto\195\159! N\195\164chster in 30 Sekunden!",
	wingbuffet_warning = "Jetzt TAUNT! Fl\195\188gelsto\195\159 bald!",
	shadowflame_warning = "Schattenflamme bald!",
	frenzy_message = "Wutanfall! Tranq jetzt!",
	frenzy_bar = "Wutanfall",

	wingbuffetcast_bar = "Fl\195\188gelsto\195\159",
	wingbuffet_bar = "N\195\164chster Fl\195\188gelsto\195\159",
	wingbuffet1_bar = "Erster Fl\195\188gelsto\195\159",
	shadowflame_bar = "Schattenflamme",

	cmd = "Flamegor",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Alarm f\195\188r Fl\195\188gelsto\195\159",
	wingbuffet_desc = "Warnung, wenn Flamegor Fl\195\188gelsto\195\159 wirkt.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "Alarm f\195\188r Schattenflamme",
	shadowflame_desc = "Warnung, wenn Flamegor Schattenflamme wirkt.",

	frenzy_cmd = "frenzy",
	frenzy_name = "Alarm f\195\188r Wutanfall",
	frenzy_desc = "Warnung, wenn Flamegor in Wutanfall ger\195\164t.",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsFlamegor = BigWigs:NewModule(boss)
BigWigsFlamegor.zonename = AceLibrary("Babble-Zone-2.2")["Blackwing Lair"]
BigWigsFlamegor.enabletrigger = boss
BigWigsFlamegor.toggleoptions = {"wingbuffet", "shadowflame", "frenzy", "bosskill"}
BigWigsFlamegor.revision = tonumber(string.sub("$Revision: 11203 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsFlamegor:OnEnable()
	started = nil
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "FlamegorWingBuffetX", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "FlamegorShadowflameX", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "FlamegorFrenzyStart", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "FlamegorStart", 10)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsFlamegor:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["wingbuffet_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "FlamegorWingBuffetX")
	elseif msg == L["shadowflame_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "FlamegorShadowflameX")
	end
end

function BigWigsFlamegor:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BossEngaged" and rest == "Flamegor" and not started then
		self:TriggerEvent("BigWigs_SendSync", "FlamegorStart")
	elseif sync == "FlamegorStart" then
		started = true
		if self.db.profile.wingbuffet then
			self:ScheduleEvent("BigWigs_Message", 26, L["wingbuffet_warning"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["wingbuffet1_bar"], 30, "Interface\\Icons\\INV_Misc_MonsterScales_14")
		end
	elseif sync == "FlamegorWingBuffetX" and self.db.profile.wingbuffet then
		self:TriggerEvent("BigWigs_Message", L["wingbuffet_message"], "Important")
		self:ScheduleEvent("BigWigs_Message", 25, L["wingbuffet_warning"], "Attention")
		self:TriggerEvent("BigWigs_StartBar", self, L["wingbuffetcast_bar"], 1, "Interface\\Icons\\INV_Misc_MonsterScales_14", true, "black")
		self:ScheduleEvent("BigWigs_StartBar", 1, self, L["wingbuffet_bar"], 29, "Interface\\Icons\\INV_Misc_MonsterScales_14")
	elseif sync == "FlamegorShadowflameX" and self.db.profile.shadowflame then
		self:TriggerEvent("BigWigs_Message", L["shadowflame_warning"], "Important")
		self:TriggerEvent("BigWigs_StartBar", self, L["shadowflame_bar"], 2, "Interface\\Icons\\Spell_Fire_Incinerate", true, "red")
	elseif sync == "FlamegorFrenzyStart" and self.db.profile.frenzy then
		self:TriggerEvent("BigWigs_Message", L["frenzy_message"], "Important", nil, true, "Alert")
		self:TriggerEvent("BigWigs_StartBar", self, L["frenzy_bar"], 10, "Interface\\Icons\\Ability_Druid_ChallangingRoar", true, "white")
	elseif sync == "FlamegorFrenzyEnd" and self.db.profile.frenzy then
        self:TriggerEvent("BigWigs_StopBar", self, L["frenzy_bar"])
	end
end

function BigWigsFlamegor:Event(msg)
	if msg == L["frenzygain_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "FlamegorFrenzyStart")
	elseif msg == L["frenzyend_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "FlamegorFrenzyEnd")
	end
end
