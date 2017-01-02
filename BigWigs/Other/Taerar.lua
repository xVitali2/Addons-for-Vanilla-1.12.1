------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Taerar"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Taerar",

	noxious_cmd = "noxious",
	noxious_name = "Noxious breath alert",
	noxious_desc = "Warn for noxious breath",

	fear_cmd = "fear",
	fear_name = "Fear",
	fear_desc = "Warn for Bellowing Roar",

	trigger1 = "Taerar begins to cast Bellowing Roar.",
	trigger2 = "afflicted by Noxious Breath",
	trigger3 = "Peace is but a fleeting dream! Let the NIGHTMARE reign!",
	trigger4 = "Children of Madness - I release you upon this world!",

	warn1 = "Taerar banished! Kill Shades!",
	warn2 = "Fear in 1.5sec!",
	warn3 = "5 seconds until Noxious Breath!",
	warn4 = "Noxious Breath! 18 seconds till next!",
	warn5 = "Taerar engaged! Noxious Breath in 8 seconds!",
	fearwarn = "AoE Fear soon!",

	bar1text = "Noxious Breath",
	bar2text = "Banish",
	fearbar = "AoE Fear",

} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsTaerar = BigWigs:NewModule(boss)
BigWigsTaerar.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Outdoor Raid Bosses Zone"],
	AceLibrary("Babble-Zone-2.2")["Ashenvale"],
	AceLibrary("Babble-Zone-2.2")["Duskwood"],
	AceLibrary("Babble-Zone-2.2")["The Hinterlands"],
	AceLibrary("Babble-Zone-2.2")["Feralas"]
}
BigWigsTaerar.enabletrigger = boss
BigWigsTaerar.toggleoptions = {"noxious", "fear", "bosskill"}
BigWigsTaerar.revision = tonumber(string.sub("$Revision: 16941 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsTaerar:OnEnable()
	self:RegisterEvent("BigWigs_Message")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
end

function BigWigsTaerar:Event( msg )
	if (not self.prior and string.find(msg, L["trigger2"])) then
		self.prior = true
		if self.db.profile.noxious then 
			self:TriggerEvent("BigWigs_Message", L["warn4"], "Important")
			self:ScheduleEvent("BigWigs_Message", 13, L["warn3"], "Important", true, "Alert")
			self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 18, "Interface\\Icons\\Spell_Shadow_LifeDrain02")
		end
	end
end

function BigWigsTaerar:CHAT_MSG_MONSTER_YELL(msg)
	if (msg == L["trigger3"]) then
		if self.db.profile.noxious then
			self:TriggerEvent("BigWigs_Message", L["warn5"], "Important")
			self:ScheduleEvent("BigWigs_Message", 3, L["warn3"], "Important", true, "Alert")
			self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 8, "Interface\\Icons\\Spell_Shadow_LifeDrain02")
		elseif self.db.profile.fear then
			self:ScheduleEvent("BigWigs_Message", 25, L["fearwarn"], "Important", true, "Alert")
			self:TriggerEvent("BigWigs_StartBar", self, L["fearbar"], 30, "Interface\\Icons\\Spell_Shadow_PsychicScream")
end
	elseif (string.find(msg, L["trigger4"])) then
		 self:TriggerEvent("BigWigs_Message", L["warn1"], "Important")
		 self:TriggerEvent("BigWigs_StartBar", self, L["bar2text"], 60, "Interface\\Icons\\Spell_Nature_Sleep")
	end
end

function BigWigsTaerar:BigWigs_Message(text)
	if text == L["warn3"] then self.prior = nil end
end

function BigWigsTaerar:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["trigger1"] and self.db.profile.fear then
		self:TriggerEvent("BigWigs_Message", L["warn2"], "Important", "Alert")
		 self:ScheduleEvent("BigWigs_Message", 18, L["fearwarn"], "Important", true, "Alert")
		 self:TriggerEvent("BigWigs_StartBar", self, L["fearbar"], 8, "Interface\\Icons\\Spell_Shadow_PsychicScream")
	end
end
