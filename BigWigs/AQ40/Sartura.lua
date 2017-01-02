------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Battleguard Sartura"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Sartura",
	
	add_name = "Sartura's Royal Guard",
	starttrigger = "defiling these sacred grounds",
	endtrigger = "I serve to the last!",
	startwarn = "Sartura engaged - 10 minutes until Berserk!",
	enragetrigger = "becomes enraged",
	enragetrigger2 = "Battleguard Sartura gains Enrage\.",
	berserktrigger = "Battleguard Sartura gains Berserk\.",
	enragewarn = "Enrage! Spam heals!",
	berserkwarn = "Berserk!",
	berserktext = "Berserk",
	warn1 = "Berserk in 5 minutes!",
	warn2 = "Berserk in 3 minutes!",
	warn3 = "Berserk in 90 seconds!",
	warn4 = "Berserk in 60 seconds!",
	warn5 = "Berserk in 30 seconds!",
	warn6 = "Berserk in 10 seconds!",
	whirlwindon = "Battleguard Sartura gains Whirlwind\.",
	whirlwindoff = "Whirlwind fades from Battleguard Sartura\.",
	whirlwindonwarn = "Whirlwind!",
	whirlwindoffwarn = "Whirlwind ended!",
	whirlwindbartext = "Whirlwind",
	whirlwindnextbartext = "Next Whirlwind",
	whirlwindfirstbartext = "First Whirlwind",
	whirlwindinctext = "Whirlwind incoming!",
	deadaddtrigger = "Sartura's Royal Guard dies\.",
	deadbosstrigger = "Battleguard Sartura dies\.",
	addmsg = "%d/3 Sartura's Royal Guards dead!",
	
	adds_cmd = "adds",
	adds_name = "Dead adds counter",
	adds_desc = "Announces dead Sartura's Royal Guards.",
	
	enrage_cmd = "enrage",
	enrage_name = "Enrage",
	enrage_desc = "Announces the Enrage when the boss is at 20% HP.",
	
	berserk_cmd = "berserk",
	berserk_name = "Berserk",
	berserk_desc = "Warns for the Berserk that the boss gains after 10 minutes.",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Whirlwind",
	whirlwind_desc = "Timers and bars for Whirlwinds.",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Sartura",
	
	add_name = "Sartura's Royal Guard",
	starttrigger = "defiling these sacred grounds",
	endtrigger = "I serve to the last!",
	startwarn = "Sartura angegriffen! Berserker in 10 Minuten!",
	enragetrigger = "becomes enraged",
	enragetrigger2 = "Battleguard Sartura bekommt \'Wutanfall\'\.",
	berserktrigger = "Battleguard Sartura bekommt \'Berserker\'\.",
	enragewarn = "Wutanfall! Spam heilung!",
	berserkwarn = "Berserker!",
	berserktext = "Berserker",
	warn1 = "Berserker in 5 Minuten!",
	warn2 = "Berserker in 3 Minuten!",
	warn3 = "Berserker in 90 Sekunden!",
	warn4 = "Berserker in 60 Sekunden!",
	warn5 = "Berserker in 30 Sekunden!",
	warn6 = "Berserker in 10 Sekunden!",
	whirlwindon = "Battleguard Sartura bekommt 'Wirbelwind'\.",
	whirlwindoff = "Wirbelwind schwindet von Battleguard Sartura\.",
	whirlwindonwarn = "Wirbelwind!",
	whirlwindoffwarn = "Wirbelwind ist zu Ende!",
	whirlwindbartext = "Wirbelwind",
	whirlwindnextbartext = "N\195\164chster Wirbelwind",
	whirlwindfirstbartext = "Erster Wirbelwind",
	whirlwindinctext = "Wirbelwind bald!",
	deadaddtrigger = "Sartura's Royal Guard stirbt\.",
	deadbosstrigger = "Battleguard Sartura stirbt\.",
	addmsg = "%d/3 Sartura's Royal Guards tot!",
	
	adds_cmd = "adds",
	adds_name = "Z\195\164hler f\195\188r tote Adds",
	adds_desc = "Verk\195\188ndet Sartura's Royal Guards Tod.",
	
	enrage_cmd = "enrage",
	enrage_name = "Wutanfall",
	enrage_desc = "Meldet den Wutanfall, wenn der Boss bei 20% HP ist.",
	
	berserk_cmd = "berserk",
	berserk_name = "Berserker",
	berserk_desc = "Warnt vor dem Berserkermodus, in den der Boss nach 10 Minuten geht.",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Wirbelwind",
	whirlwind_desc = "Timer und Balken f\195\188r Wirbelwinde.",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsSartura = BigWigs:NewModule(boss)
BigWigsSartura.zonename = AceLibrary("Babble-Zone-2.2")["Ahn'Qiraj"]
BigWigsSartura.enabletrigger = boss
BigWigsSartura.wipemobs = { L["add_name"] }
BigWigsSartura.toggleoptions = {"whirlwind", "adds", "enrage", "berserk", "bosskill"}
BigWigsSartura.revision = tonumber(string.sub("$Revision: 11206 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsSartura:OnEnable()
	guard = 0
	sarturadead = false
	started = false
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "SarturaWhirlwindStart", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "SarturaWhirlwindEnd", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "SarturaEnrage", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "SarturaBerserk", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "SarturaAddDead", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "SarturaSarturaDead", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "SarturaAllDead", 5)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsSartura:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BossEngaged" and rest == "Battleguard Sartura" then
		if self.db.profile.berserk and not started then
			self:TriggerEvent("BigWigs_Message", L["startwarn"], "Important")
			self:TriggerEvent("BigWigs_StartBar", self, L["berserktext"], 600, "Interface\\Icons\\Spell_Shadow_UnholyFrenzy")
			self:ScheduleEvent("300into", "BigWigs_Message", 300, L["warn1"], "Attention")
			self:ScheduleEvent("420into", "BigWigs_Message", 420, L["warn2"], "Attention")
			self:ScheduleEvent("510into", "BigWigs_Message", 510, L["warn3"], "Urgent")
			self:ScheduleEvent("540into", "BigWigs_Message", 540, L["warn4"], "Urgent")
			self:ScheduleEvent("570into", "BigWigs_Message", 570, L["warn5"], "Important")
			self:ScheduleEvent("590into", "BigWigs_Message", 590, L["warn6"], "Important")
		end
		if self.db.profile.whirlwind and not started then
			self:TriggerEvent("BigWigs_StartBar", self, L["whirlwindfirstbartext"], 20.3, "Interface\\Icons\\Ability_Whirlwind")
			self:ScheduleEvent("BigWigs_Message", 17.3, L["whirlwindinctext"], "Attention", true, "Alarm")
		end
		started = true
	elseif sync == "SarturaWhirlwindStart" and self.db.profile.whirlwind then
		self:TriggerEvent("BigWigs_Message", L["whirlwindonwarn"], "Important")
		self:TriggerEvent("BigWigs_StartBar", self, L["whirlwindbartext"], 15, "Interface\\Icons\\Ability_Whirlwind")
		self:ScheduleEvent("BigWigs_Message", 25, L["whirlwindinctext"], "Attention", true, "Alarm")
		self:TriggerEvent("BigWigs_StartBar", self, L["whirlwindnextbartext"], 28, "Interface\\Icons\\Ability_Whirlwind")
	elseif sync == "SarturaWhirlwindEnd" and self.db.profile.whirlwind then
		self:TriggerEvent("BigWigs_StopBar", self, L["whirlwindbartext"])
		self:TriggerEvent("BigWigs_Message", L["whirlwindoffwarn"], "Attention")
	elseif sync == "SarturaEnrage" and self.db.profile.enrage then
		self:TriggerEvent("BigWigs_Message", L["enragewarn"], "Attention")
	elseif sync == "SarturaBerserk" and self.db.profile.berserk then
		self:TriggerEvent("BigWigs_Message", L["berserkwarn"], "Attention")
		self:TriggerEvent("BigWigs_StopBar", self, L["berserktext"])
		self:CancelScheduledEvent("300into")
		self:CancelScheduledEvent("420into")
		self:CancelScheduledEvent("510into")
		self:CancelScheduledEvent("540into")
		self:CancelScheduledEvent("570into")
		self:CancelScheduledEvent("590into")
	elseif sync == "SarturaAddDead" then
		guard = guard + 1
		if self.db.profile.adds then
			self:TriggerEvent("BigWigs_Message", string.format(L["addmsg"], guard), "Positive")
		end
		if (guard == 3) and sarturadead then
			self:TriggerEvent("BigWigs_SendSync", "SarturaAllDead")
		end
	elseif sync == "SarturaSarturaDead" then
		sarturadead = true
		if self.db.profile.bosskill then
			self:TriggerEvent("BigWigs_Message", string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], self:ToString()), "Bosskill", nil, "Victory")
		end
		if (guard == 3) and sarturadead then
			self:TriggerEvent("BigWigs_SendSync", "SarturaAllDead")
		end
	elseif sync == "SarturaAllDead" and self.db.profile.bosskill then
		self:TriggerEvent("BigWigs_RemoveRaidIcon")
		self.core:ToggleModuleActive(self, false)
	end
end

function BigWigsSartura:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg == L["whirlwindon"] then
		self:TriggerEvent("BigWigs_SendSync", "SarturaWhirlwindStart")
	elseif msg == L["enragetrigger2"] then
		self:TriggerEvent("BigWigs_SendSync", "SarturaEnrage")
	elseif msg == L["berserktrigger"] then
		self:TriggerEvent("BigWigs_SendSync", "SarturaBerserk")
	end
end

function BigWigsSartura:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == L["deadaddtrigger"] then
		self:TriggerEvent("BigWigs_SendSync", "SarturaAddDead")
	elseif msg == L["deadbosstrigger"] then
		self:TriggerEvent("BigWigs_SendSync", "SarturaSarturaDead")
	end
end

function BigWigsSartura:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["starttrigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "BossEngaged "..self:ToString())
	elseif msg == L["endtrigger"] then
		self:TriggerEvent("BigWigs_SendSync", "SarturaSarturaDead")
	end
end

function BigWigsSartura:CHAT_MSG_MONSTER_EMOTE(msg)
	if string.find(msg, L["enragetrigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "SarturaEnrage")
	end
end

function BigWigsSartura:CHAT_MSG_SPELL_AURA_GONE_OTHER(msg)
	if msg == L["whirlwindoff"] then
		self:TriggerEvent("BigWigs_SendSync", "SarturaWhirlwindEnd")
	end
end
