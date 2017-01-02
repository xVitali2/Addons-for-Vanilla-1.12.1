------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Gehennas"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	trigger1 = "afflicted by Gehennas",
	trigger2 = "Gehennas begins to cast Shadow Bolt",
	trigger3 = "You are afflicted by Rain of Fire",
	trigger4 = "Gehennas' Curse was resisted",
	dead1 = "Flamewaker dies",
	dead2 = "Gehennas dies",
	addmsg = "%d/2 Flamewakers dead!",
	flamewaker_name = "Flamewaker",

	warn1 = "5 seconds until Gehennas' Curse!",
	warn2 = "Gehennas' Curse - Decurse NOW!",

	bar1text = "Gehennas' Curse",
	bar2text = "Shadow Bolt cast",
	bar3text = "Shadow Bolt",
	firewarn = "Move from FIRE!",

	cmd = "Gehennas",
	
	adds_cmd = "adds",
	adds_name = "Dead adds counter",
	adds_desc = "Announces dead Flamewakers",

	shadowbolt_cmd = "shadowbolt",
	shadowbolt_name = "Gehennas' Shadow Bolt alert",
	shadowbolt_desc = "Warn when Gehennas start casting Shadow Bolt",
	
	curse_cmd = "curse",
	curse_name = "Gehennas' Curse alert",
	curse_desc = "Warn for Gehennas' Curse",
} end)

L:RegisterTranslations("deDE", function() return {
	trigger1 = "von Gehennas(.+)Fluch betroffen",
	trigger2 = "Gehennas beginnt Schattenblitz",
	trigger3 = "Ihr seid von Feuerregen betroffen",
	trigger4 = "Gehennas\' Fluch(.+) widerstanden",
	dead1 = "Flammensch\195\188rer stirbt",
	dead2 = "Gehennas stirbt",
	addmsg = "%d/2 Flammensch\195\188rer tot!",
	flamewaker_name = "Flammensch\195\188rer",

	warn1 = "5 Sekunden bis Gehennas' Fluch!",
	warn2 = "Gehennas' Fluch - JETZT Entfluchen!",

	bar1text = "Gehennas' Fluch",
	bar2text = "wirkt Schattenblitz",
	bar3text = "Schattenblitz",
	firewarn = "Raus aus dem Feuer!",

	cmd = "Gehennas",
	
	adds_cmd = "adds",
	adds_name = "Z\195\164hler f\195\188r tote Adds",
	adds_desc = "Verk\195\188ndet Flammensch\195\188rer Tod",

	shadowbolt_cmd = "shadowbolt",
	shadowbolt_name = "Alarm f\195\188r Gehennas' Schattenblitz",
	shadowbolt_desc = "Warnen wenn Gehennas beginnt Schattenblitz zu wirken",
	
	curse_cmd = "curse",
	curse_name = "Alarm f\195\188r Gehennas' Fluch",
	curse_desc = "Warnen vor Gehennas' Fluch",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsGehennas = BigWigs:NewModule(boss)
BigWigsGehennas.zonename = AceLibrary("Babble-Zone-2.2")["Molten Core"]
BigWigsGehennas.enabletrigger = boss
BigWigsGehennas.wipemobs = { L["flamewaker_name"] }
BigWigsGehennas.toggleoptions = {"adds", "shadowbolt", "curse", "bosskill"}
BigWigsGehennas.revision = tonumber(string.sub("$Revision: 11204 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsGehennas:OnEnable()
	flamewaker = 0
	gehennasdead = 0
	firstcurse = 0
	firstshadowbolt = 0
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "GehennasCurse", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "GehennasCurseIni", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "GehennasShadowbolt", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "GehennasShadowboltIni", 4)
	self:TriggerEvent("BigWigs_ThrottleSync", "GehennasShadowboltCast", 1)
	self:TriggerEvent("BigWigs_ThrottleSync", "GehennasAddDead", 0.7)
	self:TriggerEvent("BigWigs_ThrottleSync", "GehennasAllDead", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "GehennasGehennasDead", 3)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsGehennas:BigWigs_RecvSync(sync)
	if sync == self:GetEngageSync() and (UnitName("target") == "Gehennas" or UnitName("target") == "Flamewaker")  then
		if firstcurse == 0 then
			self:TriggerEvent("BigWigs_SendSync", "GehennasCurseIni")
		end
		if firstshadowbolt == 0 then
			self:TriggerEvent("BigWigs_SendSync", "GehennasShadowboltIni")
		end
	elseif sync == "GehennasCurse" and self.db.profile.curse then
		self:ScheduleEvent("messagewarn1", "BigWigs_Message", 26, L["warn1"], "Urgent")
		self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 31, "Interface\\Icons\\Spell_Shadow_BlackPlague")
	elseif sync == "GehennasCurseIni" then
		firstcurse = 1
		if self.db.profile.curse then
			self:ScheduleEvent("messagewarn2", "BigWigs_Message", 7, L["warn1"], "Urgent")
			self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 12, "Interface\\Icons\\Spell_Shadow_BlackPlague")
		end
	elseif sync == "GehennasShadowbolt" and self.db.profile.shadowbolt then
		self:TriggerEvent("BigWigs_StartBar", self, L["bar3text"], 4, "Interface\\Icons\\Spell_Shadow_Shadowbolt")
	elseif sync == "GehennasShadowboltIni" then
		firstshadowbolt = 1
		if self.db.profile.shadowbolt then
			self:TriggerEvent("BigWigs_StartBar", self, L["bar3text"], 4, "Interface\\Icons\\Spell_Shadow_Shadowbolt")
		end
	elseif sync == "GehennasShadowboltCast" and self.db.profile.shadowbolt then
		self:TriggerEvent("BigWigs_StartBar", self, L["bar2text"], 0.5, "Interface\\Icons\\Spell_Shadow_Shadowbolt")
	elseif sync == "GehennasAddDead" then
		flamewaker = flamewaker + 1
		if self.db.profile.adds then
			self:TriggerEvent("BigWigs_Message", string.format(L["addmsg"], flamewaker), "Positive")
		end
		if ((flamewaker == 2) and (gehennasdead == 1)) then
			self:TriggerEvent("BigWigs_SendSync", "GehennasAllDead")
		end
	elseif sync == "GehennasGehennasDead" then
		self:CancelScheduledEvent("messagewarn1")
		self:CancelScheduledEvent("messagewarn2")
		self:TriggerEvent("BigWigs_StopBar", self, L["bar1text"])
		self:TriggerEvent("BigWigs_StopBar", self, L["bar2text"])
		self:TriggerEvent("BigWigs_StopBar", self, L["bar3text"])
		gehennasdead = 1
		if self.db.profile.bosskill then
			self:TriggerEvent("BigWigs_Message", string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], self:ToString()), "Bosskill", nil, "Victory")
		end
		if ((flamewaker == 2) and (gehennasdead == 1)) then
			self:TriggerEvent("BigWigs_SendSync", "GehennasAllDead")
		end
	elseif sync == "GehennasAllDead" then
		self:TriggerEvent("BigWigs_RemoveRaidIcon")
		self.core:ToggleModuleActive(self, false)
	end
end


function BigWigsGehennas:Event(msg)
	if ((string.find(msg, L["trigger1"])) or (string.find(msg, L["trigger4"]))) then
		self:TriggerEvent("BigWigs_SendSync", "GehennasCurse")
	elseif (string.find(msg, L["trigger2"])) then
		self:TriggerEvent("BigWigs_SendSync", "GehennasShadowboltCast")
		self:TriggerEvent("BigWigs_SendSync", "GehennasShadowbolt")
	elseif (string.find(msg, L["trigger3"])) then
		self:TriggerEvent("BigWigs_Message", L["firewarn"], "Attention", "Alarm")
	end
end

function BigWigsGehennas:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if string.find(msg, L["dead1"]) then
		self:TriggerEvent("BigWigs_SendSync", "GehennasAddDead")
	elseif string.find(msg, L["dead2"]) then
		self:TriggerEvent("BigWigs_SendSync", "GehennasGehennasDead")
	end
end
