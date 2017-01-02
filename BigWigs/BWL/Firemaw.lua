------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Firemaw"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	wingbuffet_trigger = "Firemaw begins to cast Wing Buffet.",
	shadowflame_trigger = "Firemaw begins to cast Shadow Flame.",
	flamebuffetafflicted_trigger = "afflicted by Flame Buffet",
	flamebuffetresisted_trigger = "Firemaw 's Flame Buffet was resisted",
	flamebuffetimmune_trigger = "Firemaw 's Flame Buffet fail(.+) immune\.",
	flamebuffetabsorb1_trigger = "You absorb Firemaw 's Flame Buffet",
	flamebuffetabsorb2_trigger = "Firemaw 's Flame Buffet is absorbed",

	wingbuffet_message = "Wing Buffet! Next one in 30 seconds!",
	wingbuffet_warning = "TAUNT now! Wing Buffet soon!",
	shadowflame_warning = "Shadow Flame incoming!",

	wingbuffetcast_bar = "Wing Buffet",
	wingbuffet_bar = "Next Wing Buffet",
	wingbuffet1_bar = "Initial Wing Buffet",
	shadowflame_bar = "Shadow Flame",
	flamebuffet_bar = "Flame Buffet",

	cmd = "Firemaw",

	flamebuffet_cmd = "flamebuffet",
	flamebuffet_name = "Flame Buffet alert",
	flamebuffet_desc = "Warn when Flamegor casts Flame Buffet.",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Wing Buffet alert",
	wingbuffet_desc = "Warn when Flamegor casts Wing Buffet.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "Shadow Flame alert",
	shadowflame_desc = "Warn when Flamegor casts Shadow Flame.",
} end)

L:RegisterTranslations("deDE", function() return {
	wingbuffet_trigger = "Ebonroc beginnt Fl\195\188gelsto\195\159 zu wirken.",
	shadowflame_trigger = "Ebonroc beginnt Schattenflamme zu wirken.",
	flamebuffetafflicted_trigger = "von Flammenpuffer betroffen",
	flamebuffetresisted_trigger = "Flammenpuffer(.+) widerstanden",
	flamebuffetimmune_trigger = "Flammenpuffer(.+) immun",
	flamebuffetabsorb1_trigger = "Ihr absorbiert Firemaws Flammenpuffer",
	flamebuffetabsorb2_trigger = "Flammenpuffer von Firemaw wird absorbiert von",

	wingbuffet_message = "Fl\195\188gelsto\195\159! N\195\164chster in 30 Sekunden!",
	wingbuffet_warning = "Jetzt TAUNT! Fl\195\188gelsto\195\159 bald!",
	shadowflame_warning = "Schattenflamme bald!",

	wingbuffetcast_bar = "Fl\195\188gelsto\195\159",
	wingbuffet_bar = "N\195\164chster Fl\195\188gelsto\195\159",
	wingbuffet1_bar = "Erster Fl\195\188gelsto\195\159",
	shadowflame_bar = "Schattenflamme",
	flamebuffet_bar = "Flammenpuffer",

	cmd = "Firemaw",

	flamebuffet_cmd = "flamebuffet",
	flamebuffet_name = "Alarm f\195\188r Flammenpuffer",
	flamebuffet_desc = "Warnung f\195\188r Flammenpuffer.",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Alarm f\195\188r Fl\195\188gelsto\195\159",
	wingbuffet_desc = "Warnung, wenn Ebonroc Fl\195\188gelsto\195\159 wirkt.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "Alarm f\195\188r Schattenflamme",
	shadowflame_desc = "Warnung, wenn Ebonroc Schattenflamme wirkt.",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsFiremaw = BigWigs:NewModule(boss)
BigWigsFiremaw.zonename = AceLibrary("Babble-Zone-2.2")["Blackwing Lair"]
BigWigsFiremaw.enabletrigger = boss
BigWigsFiremaw.toggleoptions = {"wingbuffet", "shadowflame", "flamebuffet", "bosskill"}
BigWigsFiremaw.revision = tonumber(string.sub("$Revision: 11202 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsFiremaw:OnEnable()
	started = nil
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "FiremawWingBuffetX", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "FiremawShadowflameX", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "FiremawStart", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "FiremawFirstBuffet", 20)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsFiremaw:Event(msg)
	if msg == L["wingbuffet_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "FiremawWingBuffetX")
	elseif msg == L["shadowflame_trigger"] then 
		self:TriggerEvent("BigWigs_SendSync", "FiremawShadowflameX")
	elseif (string.find(msg, L["flamebuffetafflicted_trigger"]) or string.find(msg, L["flamebuffetresisted_trigger"]) or string.find(msg, L["flamebuffetimmune_trigger"]) or string.find(msg, L["flamebuffetabsorb1_trigger"]) or string.find(msg, L["flamebuffetabsorb2_trigger"])) and self.db.profile.flamebuffet and started then
		self:TriggerEvent("BigWigs_StartBar", self, L["flamebuffet_bar"], 5, "Interface\\Icons\\Spell_Fire_Fireball", true, "White")
	end
end

function BigWigsFiremaw:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BossEngaged" and rest == "Firemaw" and not started then
		self:TriggerEvent("BigWigs_SendSync", "FiremawStart")
		self:TriggerEvent("BigWigs_SendSync", "FiremawFirstBuffet")
	elseif sync == "FiremawStart" then
		started = true
		if self.db.profile.wingbuffet then
			self:ScheduleEvent("BigWigs_Message", 26, L["wingbuffet_warning"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["wingbuffet1_bar"], 30, "Interface\\Icons\\INV_Misc_MonsterScales_14")
		end
	elseif sync == "FiremawWingBuffetX" and self.db.profile.wingbuffet then
		self:TriggerEvent("BigWigs_Message", L["wingbuffet_message"], "Important")
		self:ScheduleEvent("BigWigs_Message", 25, L["wingbuffet_warning"], "Attention")
		self:TriggerEvent("BigWigs_StartBar", self, L["wingbuffetcast_bar"], 1, "Interface\\Icons\\INV_Misc_MonsterScales_14", true, "Black")
		self:ScheduleEvent("BigWigs_StartBar", 1, self, L["wingbuffet_bar"], 29, "Interface\\Icons\\INV_Misc_MonsterScales_14")
	elseif sync == "FiremawShadowflameX" and self.db.profile.shadowflame then
		self:TriggerEvent("BigWigs_Message", L["shadowflame_warning"], "Important")
		self:TriggerEvent("BigWigs_StartBar", self, L["shadowflame_bar"], 2, "Interface\\Icons\\Spell_Fire_Incinerate")
	elseif sync == "FiremawFirstBuffet" and self.db.profile.flamebuffet then
		self:TriggerEvent("BigWigs_StartBar", self, L["flamebuffet_bar"], 4.8, "Interface\\Icons\\Spell_Fire_Fireball", true, "White")
	end
end
