------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Ebonroc"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	wingbuffet_trigger = "Ebonroc begins to cast Wing Buffet.",
	shadowflame_trigger = "Ebonroc begins to cast Shadow Flame.",
	shadowcurseyou_trigger = "You are afflicted by Shadow of Ebonroc\.",
	shadowcurseother_trigger = "(.+) is afflicted by Shadow of Ebonroc\.",
	wingbuffet_message = "Wing Buffet! Next one in 30 seconds!",
	wingbuffet_warning = "TAUNT now! Wing Buffet soon!",
	shadowflame_warning = "Shadow Flame incoming!",
	shadowfcurse_message_you = "You have Shadow of Ebonroc!",
	shadowfcurse_message_taunt = "%s has Shadow of Ebonroc! TAUNT!",

	wingbuffetcast_bar = "Wing Buffet",
	wingbuffet_bar = "Next Wing Buffet",
	wingbuffet1_bar = "Initial Wing Buffet",
	shadowflame_bar = "Shadow Flame",
	shadowcurse_bar = "%s - Shadow of Ebonroc",

	cmd = "Ebonroc",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Wing Buffet alert",
	wingbuffet_desc = "Warn when Ebonroc casts Wing Buffet.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "Shadow Flame alert",
	shadowflame_desc = "Warn when Ebonroc casts Shadow Flame.",

	curse_cmd = "curse",
	curse_name = "Shadow of Ebonroc warnings",
	curse_desc = "Shows a timer bar and announces who gets Shadow of Ebonroc.",
} end)

L:RegisterTranslations("deDE", function() return {
	wingbuffet_trigger = "Ebonroc beginnt Fl\195\188gelsto\195\159 zu wirken.",
	shadowflame_trigger = "Ebonroc beginnt Schattenflamme zu wirken.",
	shadowcurseyou_trigger = "Ihr seid von Schattenschwinges Schatten betroffen.",
	shadowcurseother_trigger = "(.+) ist von Schattenschwinges Schatten betroffen.",
	wingbuffet_message = "Fl\195\188gelsto\195\159! N\195\164chster in 30 Sekunden!",
	wingbuffet_warning = "Jetzt TAUNT! Fl\195\188gelsto\195\159 bald!",
	shadowflame_warning = "Schattenflamme bald!",
	shadowfcurse_message_you = "Du hast Schattenschwinges Schatten!",
	shadowfcurse_message_taunt = "%s hat Schattenschwinges Schatten! TAUNT!",

	wingbuffetcast_bar = "Fl\195\188gelsto\195\159",
	wingbuffet_bar = "N\195\164chster Fl\195\188gelsto\195\159",
	wingbuffet1_bar = "Erster Fl\195\188gelsto\195\159",
	shadowflame_bar = "Schattenflamme",
	shadowcurse_bar = "%s - Schattenschwinges Schatten",

	cmd = "Ebonroc",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Alarm f\195\188r Fl\195\188gelsto\195\159",
	wingbuffet_desc = "Warnung, wenn Ebonroc Fl\195\188gelsto\195\159 wirkt.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "Alarm f\195\188r Schattenflamme",
	shadowflame_desc = "Warnung, wenn Ebonroc Schattenflamme wirkt.",

	curse_cmd = "curse",
	curse_name = "Schattenschwinges Schatten Warnungen",
	curse_desc = "Zeigt eine Zeitleiste und k\195\188ndigt an wer Schattenschwinges Schatten bekommt.",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsEbonroc = BigWigs:NewModule(boss)
BigWigsEbonroc.zonename = AceLibrary("Babble-Zone-2.2")["Blackwing Lair"]
BigWigsEbonroc.enabletrigger = boss
BigWigsEbonroc.toggleoptions = { "curse", "wingbuffet", "shadowflame", "bosskill" }
BigWigsEbonroc.revision = tonumber(string.sub("$Revision: 11205 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsEbonroc:OnEnable()
	started = nil
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "EbonrocWingBuffetX", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "EbonrocShadowflameX", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "EbonrocShadowX", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "EbonrocStart", 10)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsEbonroc:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["shadowflame_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "EbonrocShadowflameX")
	elseif msg == L["wingbuffet_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "EbonrocWingBuffetX")
	end
end

function BigWigsEbonroc:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BossEngaged" and rest == "Ebonroc" and not started then
		self:TriggerEvent("BigWigs_SendSync", "EbonrocStart")
	elseif sync == "EbonrocStart" then
		started = true
		if self.db.profile.wingbuffet then
			self:ScheduleEvent("BigWigs_Message", 26, L["wingbuffet_warning"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["wingbuffet1_bar"], 30, "Interface\\Icons\\INV_Misc_MonsterScales_14")
		end
	elseif sync == "EbonrocWingBuffetX" and self.db.profile.wingbuffet then
		self:TriggerEvent("BigWigs_Message", L["wingbuffet_message"], "Important")
		self:ScheduleEvent("BigWigs_Message", 25, L["wingbuffet_warning"], "Attention")
		self:TriggerEvent("BigWigs_StartBar", self, L["wingbuffetcast_bar"], 1, "Interface\\Icons\\INV_Misc_MonsterScales_14", true, "black")
		self:ScheduleEvent("BigWigs_StartBar", 1, self, L["wingbuffet_bar"], 29, "Interface\\Icons\\INV_Misc_MonsterScales_14")
	elseif sync == "EbonrocShadowflameX" and self.db.profile.shadowflame then
		self:TriggerEvent("BigWigs_Message", L["shadowflame_warning"], "Important")
		self:TriggerEvent("BigWigs_StartBar", self, L["shadowflame_bar"], 2, "Interface\\Icons\\Spell_Fire_Incinerate", true, "red")
	elseif sync == "EbonrocShadowX" and self.db.profile.curse then
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["shadowcurse_bar"], rest), 8, "Interface\\Icons\\Spell_Shadow_GatherShadows", true, "white")
	end
end

function BigWigsEbonroc:Event(msg)
	local _,_,shadowcurseother,_ = string.find(msg, L["shadowcurseother_trigger"])
	if string.find(msg, L["shadowcurseyou_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "EbonrocShadowX "..UnitName("player"))
		if self.db.profile.curse then
			self:TriggerEvent("BigWigs_Message", L["shadowfcurse_message_you"], "Attention")
		end
	elseif shadowcurseother then
		self:TriggerEvent("BigWigs_SendSync", "EbonrocShadowX "..shadowcurseother)
		if self.db.profile.curse then
			self:TriggerEvent("BigWigs_Message", string.format(L["shadowfcurse_message_taunt"], shadowcurseother), "Attention")
		end
	end
end
