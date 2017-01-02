------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Shazzrah"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	trigger1 = "casts Gate of Shazzrah",
	trigger2 = "Shazzrah gains Deaden Magic",
	trigger3 = "afflicted by Shazzrah",
	trigger4 = "Shazzrah casts Counterspell",
	trigger5 = "Shazzrah(.+) Curse was resisted",
	trigger6 = "Deaden Magic fades from Shazzrah",

	warn1 = "Blink - 45 seconds until next one!",
	warn2 = "3 seconds to Blink!",
	warn3 = "Deaden Magic is up! Dispel it!",
	warn4 = "Shazzrah's Curse! Decurse NOW!",
	warn5 = "Counterspell! ~18 seconds until next one!",
	warn6 = "3 seconds until Counterspell!",

	bar1text = "Blink",
	bar2text = "Deaden Magic",
	bar3text = "Shazzrah's Curse",
	bar4text = "Counterspell",

	cmd = "Shazzrah",
	
	counterspell_cmd = "counterspell",
	counterspell_name = "Counterspell alert",
	counterspell_desc = "Warn for Shazzrah's Counterspell",
	
	curse_cmd = "curse",
	curse_name = "Shazzrah's Curse alert",
	curse_desc = "Warn for Shazzrah's Curse",
	
	deaden_cmd = "deaden",
	deaden_name = "Deaden Magic alert",
	deaden_desc = "Warn when Shazzrah has Deaden Magic",
	
	blink_cmd = "blink",
	blink_name = "Blink alert",
	blink_desc = "Warn when Shazzrah Blinks",
} end)

L:RegisterTranslations("deDE", function() return {
	trigger1 = "Shazzrah wirkt Portal von Shazzrah",
	trigger2 = "Shazzrah bekommt \'Magie d\195\164mpfen",
	trigger3 = "von Shazzrahs Fluch betroffen",
	trigger4 = "Shazzrah wirkt Gegenzauber",
	trigger5 = "Shazzrahs Fluch(.)widerstanden",
	trigger6 = "Magie d\195\164mpfen schwindet von Shazzrah",

	warn1 = "Blinzeln! N\195\164chstes in ~45 Sekunden!",
	warn2 = "Blinzeln in ~5 Sekunden!",
	warn3 = "Magie d\195\164mpfen auf Shazzrah! Entferne magie!",
	warn4 = "Shazzrahs Fluch! Entfluche JETZT!",
	warn5 = "Gegenzauber - 40 Sekunden bis zum n\195\164chsten!",
	warn6 = "3 Sekunden bis Gegenzauber!",

	bar1text = "Blinzeln",
	bar2text = "Magie d\195\164mpfen",
	bar3text = "N\195\164chster Fluch",
	bar4text = "N\195\164chster Gegenzauber",
	
	cmd = "Shazzrah",
	
	counterspell_cmd = "Gegenzauber",
	counterspell_name = "Alarm f\195\188r Gegenzauber",
	counterspell_desc = "Warnen vor Shazzrahs Gegenzauber",
	
	curse_cmd = "curse",
	curse_name = "Alarm f\195\188r Shazzrahs Fluch",
	curse_desc = "Warnen vor Shazzrahs Fluch",
	
	deaden_cmd = "deaden",
	deaden_name = "Alarm f\195\188r Magie d\195\164mpfen",
	deaden_desc = "Warnen wenn Shazzrah Magie d\195\164mpfen hat",
	
	blink_cmd = "blink",
	blink_name = "Alarm f\195\188r Blinzeln",
	blink_desc = "Warnen wenn Shazzrah blinzelt",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsShazzrah = BigWigs:NewModule(boss)
BigWigsShazzrah.zonename = AceLibrary("Babble-Zone-2.2")["Molten Core"]
BigWigsShazzrah.enabletrigger = boss
BigWigsShazzrah.toggleoptions = {"curse", "deaden", "blink", "counterspell", "bosskill"}
BigWigsShazzrah.revision = tonumber(string.sub("$Revision: 11203 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsShazzrah:OnEnable()
	firstcounterspell = 0
	firstblink = 0
	firstcurse = 0
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_BUFF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_BUFF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "ShazzrahBlinkX", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "ShazzrahBlinkFirst", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "ShazzrahCurseX", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "ShazzrahCurseFirst", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "ShazzrahDeadenMagicOn", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "ShazzrahDeadenMagicOff", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "ShazzrahCounterspellX", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "ShazzrahCounterspellFirst", 5)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsShazzrah:Event(msg)
	if (string.find(msg, L["trigger2"])) then
		self:TriggerEvent("BigWigs_SendSync", "ShazzrahDeadenMagicOn")
	elseif (string.find(msg, L["trigger6"])) then
		self:TriggerEvent("BigWigs_SendSync", "ShazzrahDeadenMagicOff")
	elseif (string.find(msg, L["trigger1"])) then
		self:TriggerEvent("BigWigs_SendSync", "ShazzrahBlinkX")
	elseif (string.find(msg, L["trigger4"])) then
		self:TriggerEvent("BigWigs_SendSync", "ShazzrahCounterspellX")
	elseif (string.find(msg, L["trigger3"]) or string.find(msg, L["trigger5"])) then
		self:TriggerEvent("BigWigs_SendSync", "ShazzrahCurseX")
	end
end

function BigWigsShazzrah:BigWigs_RecvSync(sync)
	if sync == self:GetEngageSync() and UnitName("target") == "Shazzrah" then
		if firstcounterspell == 0 then
			self:TriggerEvent("BigWigs_SendSync", "ShazzrahCounterspellFirst")
		end
		if firstblink == 0 then
			self:TriggerEvent("BigWigs_SendSync", "ShazzrahBlinkFirst")
		end
		if firstcurse == 0 then
			self:TriggerEvent("BigWigs_SendSync", "ShazzrahCurseFirst")
		end
	elseif sync == "ShazzrahBlinkX" then
		firstblink = 1
		--klhtm:ResetRaidThreat()
		if self.db.profile.blink then
			self:TriggerEvent("BigWigs_Message", L["warn1"], "Important")
			self:ScheduleEvent("BigWigs_Message", 22.6, L["warn2"], "Attention", "Alarm")
			self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 25.6, "Interface\\Icons\\Spell_Arcane_Blink")
			self:ScheduleRepeatingEvent("blinkrepeatable", self.Blink, 25.6, self)
		end
	elseif sync == "ShazzrahDeadenMagicOn" and self.db.profile.deaden then
		self:TriggerEvent("BigWigs_Message", L["warn3"], "Important")
		self:TriggerEvent("BigWigs_StartBar", self, L["bar2text"], 30, "Interface\\Icons\\Spell_Holy_SealOfSalvation")
	elseif sync == "ShazzrahDeadenMagicOff" and self.db.profile.deaden then
		self:TriggerEvent("BigWigs_StopBar", self, L["bar2text"])
	elseif sync == "ShazzrahCurseX" and self.db.profile.curse then
		self:TriggerEvent("BigWigs_Message", L["warn4"], "Attention", "Alarm")
		self:TriggerEvent("BigWigs_StartBar", self, L["bar3text"], 20, "Interface\\Icons\\Spell_Shadow_AntiShadow")
	elseif sync == "ShazzrahCurseFirst" then
		firstcurse = 1
		if self.db.profile.curse then
			self:TriggerEvent("BigWigs_StartBar", self, L["bar3text"], 10, "Interface\\Icons\\Spell_Shadow_AntiShadow")
		end
	elseif sync == "ShazzrahCounterspellX" and self.db.profile.counterspell then
		self:TriggerEvent("BigWigs_StartBar", self, L["bar4text"], 18.5, "Interface\\Icons\\Spell_Frost_IceShock")
	    self:ScheduleRepeatingEvent("csrepeatable", self.Counterspell, 18.5, self)
	elseif sync == "ShazzrahCounterspellFirst" then
		firstcounterspell = 1
		if self.db.profile.counterspell then
			self:TriggerEvent("BigWigs_StartBar", self, L["bar4text"], 15, "Interface\\Icons\\Spell_Frost_IceShock")
			self:ScheduleEvent("csfirsttoX", self.Counterspell, 15, self)
		end
	elseif sync == "ShazzrahBlinkFirst" then
		firstblink = 1
		if self.db.profile.blink then
			self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 30.3, "Interface\\Icons\\Spell_Arcane_Blink")
			self:ScheduleEvent("blinkfirsttoX", self.Blink, 30.3, self)
		end
	end
end

function BigWigsShazzrah:Counterspell()	
	self:TriggerEvent("BigWigs_SendSync", "ShazzrahCounterspellX");
end

function BigWigsShazzrah:Blink()
	self:TriggerEvent("BigWigs_SendSync", "ShazzrahBlinkX");
end
