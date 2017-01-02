------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Lethon"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Lethon",

	noxious_cmd = "noxious",
	noxious_name = "Noxious breath alert",
	noxious_desc = "Warn for noxious breath",

	trigger1 = "I can sense the SHADOW on your hearts. There can be no rest for the wicked!",
	trigger2 = "afflicted by Noxious Breath",
	trigger3 = "Your wicked souls shall feed my power!",
	
	warn1 = "Shadows spawned!",
	warn2 = "Lethon egaged! 8 seconds till Noxious Breath!",
	warn3 = "5 seconds until Noxious Breath!",
	warn4 = "Noxious Breath! 18 seconds till next!",

	
	bar1text = "Noxious Breath",
	
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsLethon = BigWigs:NewModule(boss)
BigWigsLethon.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Outdoor Raid Bosses Zone"],
	AceLibrary("Babble-Zone-2.2")["Ashenvale"],
	AceLibrary("Babble-Zone-2.2")["Duskwood"],
	AceLibrary("Babble-Zone-2.2")["The Hinterlands"],
	AceLibrary("Babble-Zone-2.2")["Feralas"]
}
BigWigsLethon.enabletrigger = boss
BigWigsLethon.toggleoptions = {"noxious", "bosskill"}
BigWigsLethon.revision = tonumber(string.sub("$Revision: 16941 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsLethon:OnEnable()
	self:RegisterEvent("BigWigs_Message")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
end

	function BigWigsLethon:Event( msg )
		if (not self.prior and string.find(msg, L["trigger2"])) then
			self.prior = true
			if self.db.profile.noxious then 
				self:TriggerEvent("BigWigs_Message", L["warn4"], "Important")
				self:ScheduleEvent("BigWigs_Message", 13, L["warn3"], "Important", true, "Alert")
				self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 18, "Interface\\Icons\\Spell_Shadow_LifeDrain02")	
			end
		end
	end

function BigWigsLethon:BigWigs_Message(text)
	if text == L["warn3"] then self.prior = nil end
end

function BigWigsLethon:CHAT_MSG_MONSTER_YELL(msg)
	if (msg == L["trigger1"]) then
		if self.db.profile.noxious then
		 self:TriggerEvent("BigWigs_Message", L["warn2"], "Important")
		 self:ScheduleEvent("BigWigs_Message", 5, L["warn3"], "Important", true, "Alert")
		 self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 10, "Interface\\Icons\\Spell_Shadow_LifeDrain02")
end
	elseif (string.find(msg, L["trigger3"])) then
		 self:TriggerEvent("BigWigs_Message", L["warn1"], "Important")
	end
end
