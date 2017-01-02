------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Patchwerk"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Patchwerk",

	enrage_cmd = "enrage",
	enrage_name = "Enrage Alert",
	enrage_desc = "Warn for Enrage",

	enragetrigger = "%s goes into a berserker rage!",

	enragewarn = "Enrage!",
	starttrigger1 = "Patchwerk want to play!",
	starttrigger2 = "Kel'Thuzad make Patchwerk his Avatar of War!",
	startwarn = "Patchwerk Engaged! Enrage in 7 minutes!",
	enragebartext = "Enrage",
	warn1 = "Enrage in 5 minutes",
	warn2 = "Enrage in 3 minutes",
	warn3 = "Enrage in 90 seconds",
	warn4 = "Enrage in 60 seconds",
	warn5 = "Enrage in 30 seconds",
	warn6 = "Enrage in 10 seconds",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsPatchwerk = BigWigs:NewModule(boss)
BigWigsPatchwerk.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
BigWigsPatchwerk.enabletrigger = boss
BigWigsPatchwerk.toggleoptions = {"enrage", "bosskill"}
BigWigsPatchwerk.revision = tonumber(string.sub("$Revision: 15709 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsPatchwerk:OnEnable()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

function BigWigsPatchwerk:CHAT_MSG_MONSTER_YELL( msg )
	if self.db.profile.enrage and ( msg == L["starttrigger1"] or msg == L["starttrigger2"] ) then
		self:TriggerEvent("BigWigs_Message", L["startwarn"], "Important")
		self:TriggerEvent("BigWigs_StartBar", self, L["enragebartext"], 420, "Interface\\Icons\\Spell_Shadow_UnholyFrenzy")
		self:ScheduleEvent("bwpatchwarn1", "BigWigs_Message", 120, L["warn1"], "Attention")
		self:ScheduleEvent("bwpatchwarn2", "BigWigs_Message", 240, L["warn2"], "Attention")
		self:ScheduleEvent("bwpatchwarn3", "BigWigs_Message", 330, L["warn3"], "Urgent")
		self:ScheduleEvent("bwpatchwarn4", "BigWigs_Message", 360, L["warn4"], "Urgent")
		self:ScheduleEvent("bwpatchwarn5", "BigWigs_Message", 390, L["warn5"], "Important")
		self:ScheduleEvent("bwpatchwarn6", "BigWigs_Message", 410, L["warn6"], "Important")
	end
end

function BigWigsPatchwerk:CHAT_MSG_MONSTER_EMOTE( msg )
	if msg == L["enragetrigger"] then
		if self.db.profile.enrage then
			self:TriggerEvent("BigWigs_Message", L["enragewarn"], "Important")
		end
		self:TriggerEvent("BigWigs_StopBar", self, L["enragebartext"])
		self:CancelScheduledEvent("bwpatchwarn1")
		self:CancelScheduledEvent("bwpatchwarn2")
		self:CancelScheduledEvent("bwpatchwarn3")
		self:CancelScheduledEvent("bwpatchwarn4")
		self:CancelScheduledEvent("bwpatchwarn5")
		self:CancelScheduledEvent("bwpatchwarn6")
	end
end

