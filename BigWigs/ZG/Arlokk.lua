------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["High Priestess Arlokk"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Arlokk",

	mark_trigger = "Feast on (.+), my pretties!",
	mark_warning_self = "You are marked!",
	mark_warning_other = "%s is marked!",
	mark_fade = "Mark of Arlokk fades from (.+)\.",
	ww_trigger = "High Priestess Arlokk gains Whirlwind\.",
	ww_bar = "Whirlwind",
	trollphase_message = "Troll Phase",
	pantherphase_message = "Panther Phase",
	vanishphase_message = "Vanish!",
	vanish_bar = "Vanish",

	vanish_cmd = "vanish",
	vanish_name = "Vanish alert",
	vanish_desc = "Shows a bar for the Vanish duration.",

	mark_cmd = "mark",
	mark_name = "Mark of Arlokk alert",
	mark_desc = "Warns when people are marked.",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Whirldind alert",
	whirlwind_desc = "Shows you when the boss has Whirlwind.",
	
	phase_cmd = "phase",
	phase_name = "Phase notification",
	phase_desc = "Announces the boss' phase transitions.",
	
	puticon_cmd = "puticon",
	puticon_name = "Raid icon on marked players",
	puticon_desc = "Place a raid icon on the player with Mark of Arlokk.\n\n(Requires assistant or higher)",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Arlokk",

	mark_trigger = "Feast on (.+), my pretties!",
	mark_warning_self = "Du bist markiert!",
	mark_warning_other = "%s ist markiert!",
	mark_fade = "Arlokks Mal schwindet von (.+)\.",
	ww_trigger = "High Priestess Arlokk bekommt \'Wirbelwind\'\.",
	ww_bar = "Wirbelwind",
	trollphase_message = "Troll Phase",
	pantherphase_message = "Panther Phase",
	vanishphase_message = "Verschwinden!",
	vanish_bar = "Verschwinden",

	vanish_cmd = "vanish",
	vanish_name = "Verschwinden anzeigen",
	vanish_desc = "Verk\195\188ndet Boss' Verschwinden.",

	mark_cmd = "mark",
	mark_name = "Alarm f\195\188r Arlokks Mal",
	mark_desc = "Warnt wenn Spieler markiert sind.",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Alarm f\195\188r Wirbelwind",
	whirlwind_desc = "Zeigt Balken f\195\188r Wirbelwind.",
	
	phase_cmd = "phase",
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses.",
	
	puticon_cmd = "puticon",
	puticon_name = "Schlachtzugsymbol auf die markiert Spieler",
	puticon_desc = "Versetzt eine Schlachtzugsymbol auf der markiert Spieler.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsArlokk = BigWigs:NewModule(boss)
BigWigsArlokk.zonename = AceLibrary("Babble-Zone-2.2")["Zul'Gurub"]
BigWigsArlokk.enabletrigger = boss
BigWigsArlokk.toggleoptions = {"phase", "whirlwind", "vanish", "mark", "puticon", "bosskill"}
BigWigsArlokk.revision = tonumber(string.sub("$Revision: 11205 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsArlokk:OnEnable()
	started = nil
	vanished = nil
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "ArlokkPhaseTroll", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "ArlokkPhaseVanish", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "ArlokkPhasePanther", 3)
end

------------------------------
--      Events              --
------------------------------

function BigWigsArlokk:CHAT_MSG_MONSTER_YELL(msg)
	local _,_, n = string.find(msg, L["mark_trigger"])
	if n then
		if self.db.profile.mark then
			if n == UnitName("player") then
				self:TriggerEvent("BigWigs_Message", L["mark_warning_self"], "Attention", true, "Alarm")
			else
				self:TriggerEvent("BigWigs_Message", string.format(L["mark_warning_other"], n), "Attention")
			end
		end
		if self.db.profile.puticon then
			self:TriggerEvent("BigWigs_SetRaidIcon", n)
		end
	end
end

function BigWigsArlokk:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg == L["ww_trigger"] and self.db.profile.whirlwind then
		self:TriggerEvent("BigWigs_StartBar", self, L["ww_bar"], 2, "Interface\\Icons\\Ability_Whirlwind")
	end
end

function BigWigsArlokk:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BossEngaged" and rest == "High Priestess Arlokk" and not started then
		self:TriggerEvent("BigWigs_SendSync", "ArlokkPhaseTroll")
	elseif sync == "ArlokkPhaseTroll" then
		vanished = nil
		self:CancelScheduledEvent("checkvanish")
		if started == nil then
			started = true
		end
		if self.db.profile.phase then
			self:TriggerEvent("BigWigs_Message", L["trollphase_message"], "Attention")
		end
		self:ScheduleEvent("BigWigs_SendSync", 24.9, "ArlokkPhasePanther")
	elseif sync == "ArlokkPhasePanther" then
		self:CancelScheduledEvent("checkunvanish")
		if self.db.profile.vanish then
			self:TriggerEvent("BigWigs_StopBar", self, L["vanish_bar"])
		end
		if self.db.profile.phase then
			self:TriggerEvent("BigWigs_Message", L["pantherphase_message"], "Attention")
		end
		if not vanished then
			self:ScheduleRepeatingEvent("checkvanish", self.CheckVanish, 0.5, self)
		end
	elseif sync == "ArlokkPhaseVanish" then
		vanished = true
		self:CancelScheduledEvent("checkvanish")
		self:CancelScheduledEvent("trollphaseinc")
		if self.db.profile.phase then
			self:TriggerEvent("BigWigs_Message", L["vanishphase_message"], "Attention")
		end
		if self.db.profile.vanish then
			self:TriggerEvent("BigWigs_StartBar", self, L["vanish_bar"], 44.7, "Interface\\Icons\\Ability_Vanish", true, "White")
		end
		self:ScheduleRepeatingEvent("checkunvanish", self.CheckUnvanish, 0.5, self)
	end
end

function BigWigsArlokk:CheckUnvanish()
	if UnitExists("target") and UnitName("target") == "High Priestess Arlokk" and UnitExists("targettarget") then
		self:TriggerEvent("BigWigs_SendSync", "ArlokkPhasePanther")
		self:ScheduleEvent("trollphaseinc", "BigWigs_SendSync", 44.8, "ArlokkPhaseTroll")
		return
	end
	local num = GetNumRaidMembers()
	for i = 1, num do
		local raidUnit = string.format("raid%starget", i)
		if UnitExists(raidUnit) and UnitName(raidUnit) == "High Priestess Arlokk" and UnitExists(raidUnit.."target") then
			self:TriggerEvent("BigWigs_SendSync", "ArlokkPhasePanther")
			self:ScheduleEvent("trollphaseinc", "BigWigs_SendSync", 44.8, "ArlokkPhaseTroll")
			return
		end
	end
end

function BigWigsArlokk:CheckVanish()
	if UnitExists("target") and UnitName("target") == "High Priestess Arlokk" and UnitExists("targettarget") then
		return
	end
	local num = GetNumRaidMembers()
	for i = 1, num do
		local raidUnit = string.format("raid%starget", i)
		if UnitExists(raidUnit) and UnitName(raidUnit) == "High Priestess Arlokk" and UnitExists(raidUnit.."target") then
			return
		end
	end
	self:TriggerEvent("BigWigs_SendSync", "ArlokkPhaseVanish")
end
