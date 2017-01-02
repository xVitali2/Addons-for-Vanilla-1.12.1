------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Majordomo Executus"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	disabletrigger = "Impossible",

	trigger1 = "gains Magic Reflection",
	trigger2 = "gains Damage Shield",
	trigger3 = "Magic Reflection fades",
	trigger4 = "Damage Shield fades",
	healdead = "Flamewaker Healer dies",
	elitedead = "Flamewaker Elite dies",
	elitename = "Flamewaker Elite",
	healername = "Flamewaker Healer",

	warn1 = "Magic Reflection for 10 seconds!",
	warn2 = "Damage Shield for 10 seconds!",
	warn3 = "3 seconds until new auras!",
	warn4 = "Magic Reflection down!",
	warn5 = "Damage Shield down!",
	hdeadmsg = "%d/4 Flamewaker Healers dead!",
	edeadmsg = "%d/4 Flamewaker Elites dead!",

	bar1text = "Magic Reflection",
	bar2text = "Damage Shield",
	bar3text = "New shields",

	cmd = "Majordomo",
	
	adds_cmd = "adds",
	adds_name = "Dead adds counter",
	adds_desc = "Announces dead Healers and Elites",
	
	magic_cmd = "magic",
	magic_name = "Magic Reflection",
	magic_desc = "Warn for Magic Reflection",
	
	dmg_cmd = "dmg",
	dmg_name = "Damage Shield",
	dmg_desc = "Warn for Damage Shield",
} end)

L:RegisterTranslations("deDE", function() return {
	disabletrigger = "Impossible",

	trigger1 = "bekommt \'Magiereflexion'",
	trigger2 = "bekommt \'Schadensschild'",
	trigger3 = "Magiereflexion schwindet von",
	trigger4 = "Schadensschild schwindet von",
	healdead = "Flamewaker Healer stirbt",
	elitedead = "Flamewaker Elite stirbt",
	elitename = "Flamewaker Elite",
	healername = "Flamewaker Healer",

	warn1 = "Magiereflexion f\195\188r 10 Sekunden!",
	warn2 = "Schadensschild f\195\188r 10 Sekunden!",
	warn3 = "Neue Schilder in 3 Sekunden!",
	warn4 = "Magiereflexion beendet!",
	warn5 = "Schadensschild beendet!",
	hdeadmsg = "%d/4 Heiler tot!",
	edeadmsg = "%d/4 Elite tot!",

	cmd = "Majordomo",
	
	bar1text = "Magiereflexion",
	bar2text = "Schadensschild",
	bar3text = "N\195\164chstes Schild",

	adds_cmd = "adds",
	adds_name = "Z\195\164hler f\195\188r tote Adds",
	adds_desc = "Verk\195\188ndet Flamewaker Healers und Flamewaker Elites Tod.",
	
	magic_cmd = "magic",
	magic_name = "Magiereflexion",
	magic_desc = "Warnung, wenn Magiereflexion aktiv.",
	
	dmg_cmd = "dmg",
	dmg_name = "Schadensschild",
	dmg_desc = "Warnung, wenn Schadensschild aktiv.",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsMajordomo = BigWigs:NewModule(boss)
BigWigsMajordomo.zonename = AceLibrary("Babble-Zone-2.2")["Molten Core"]
BigWigsMajordomo.enabletrigger = boss
BigWigsMajordomo.wipemobs = { L["elitename"], L["healername"] }
BigWigsMajordomo.toggleoptions = {"magic", "dmg", "adds", "bosskill"}
BigWigsMajordomo.revision = tonumber(string.sub("$Revision: 11205 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsMajordomo:OnEnable()
	hdead = 0
	edead = 0
	firstshield = 0
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "DomoHealerDead", 0.7)
	self:TriggerEvent("BigWigs_ThrottleSync", "DomoEliteDead", 0.7)
	self:TriggerEvent("BigWigs_ThrottleSync", "DomoAuraDamage", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "DomoAuraMagic", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "DomoPull", 20)
end

function BigWigsMajordomo:VerifyEnable(unit)
	if GetSubZoneText() == "Ragnaros\' Lair" and not UnitCanAttack("player", unit) then self:TriggerEvent("BigWigs_TargetSeen", "Ragnaros", unit) end -- peenix y u do dis?
	return UnitCanAttack("player", unit)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsMajordomo:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["disabletrigger"]) then
		if self.db.profile.bosskill then
			self:TriggerEvent("BigWigs_Message", string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], self:ToString()), "Bosskill", nil, "Victory")
		end
		self:TriggerEvent("BigWigs_RemoveRaidIcon")
		self.core:ToggleModuleActive(self, false)
	end
end

function BigWigsMajordomo:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if string.find(msg, L["trigger1"]) then
		self:TriggerEvent("BigWigs_SendSync", "DomoAuraMagic")
	elseif string.find(msg, L["trigger2"]) then
		self:TriggerEvent("BigWigs_SendSync", "DomoAuraDamage")
	end
end

function BigWigsMajordomo:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if string.find(msg, L["healdead"]) then
		self:TriggerEvent("BigWigs_SendSync", "DomoHealerDead")
	elseif string.find(msg, L["elitedead"]) then
		self:TriggerEvent("BigWigs_SendSync", "DomoEliteDead")
	end
end

function BigWigsMajordomo:BigWigs_RecvSync(sync)
	if sync == self:GetEngageSync() and (UnitName("target") == "Majordomo Executus" or UnitName("target") == "Flamewaker Elite" or UnitName("target") == "Flamewaker Healer") then
		if firstshield == 0 then
			self:TriggerEvent("BigWigs_SendSync", "DomoPull")
		end
	elseif sync == "DomoHealerDead" and self.db.profile.adds then
		hdead = hdead + 1
		self:TriggerEvent("BigWigs_Message", string.format(L["hdeadmsg"], hdead), "Positive")
	elseif sync == "DomoEliteDead" and self.db.profile.adds then
		edead = edead + 1
		self:TriggerEvent("BigWigs_Message", string.format(L["edeadmsg"], edead), "Positive")
	elseif sync == "DomoAuraMagic" then
		if self.db.profile.magic then
			self:TriggerEvent("BigWigs_Message", L["warn1"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 10, "Interface\\Icons\\Spell_Frost_FrostShock")
		end
		if (self.db.profile.magic or self.db.profile.dmg) then
			self:TriggerEvent("BigWigs_StartBar", self, L["bar3text"], 15, "Interface\\Icons\\Spell_Frost_Wisp")
			self:ScheduleEvent("BigWigs_Message", 12, L["warn3"], "Urgent")
		end
	elseif sync == "DomoAuraDamage" then
		if self.db.profile.dmg then
			self:TriggerEvent("BigWigs_Message", L["warn2"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["bar2text"], 10, "Interface\\Icons\\Spell_Shadow_AntiShadow")
		end
		if (self.db.profile.magic or self.db.profile.dmg) then
			self:TriggerEvent("BigWigs_StartBar", self, L["bar3text"], 15, "Interface\\Icons\\Spell_Frost_Wisp")
			self:ScheduleEvent("BigWigs_Message", 12, L["warn3"], "Urgent")
		end
	elseif sync == "DomoPull" then
		firstshield = 1
		if self.db.profile.magic or self.db.profile.dmg then
			self:TriggerEvent("BigWigs_StartBar", self, L["bar3text"], 15, "Interface\\Icons\\Spell_Frost_Wisp")
			self:ScheduleEvent("BigWigs_Message", 12, L["warn3"], "Urgent")
		end
	end
end
