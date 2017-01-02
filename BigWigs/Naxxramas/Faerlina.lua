------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Grand Widow Faerlina"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local started = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Faerlina",

	silence_cmd = "silence",
	silence_name = "Silence Alert",
	silence_desc = "Warn for silence",

	enrage_cmd = "enrage",
	enrage_name = "Enrage Alert",
	enrage_desc = "Warn for Enrage",

	starttrigger1 = "Kneel before me, worm!",
	starttrigger2 = "Slay them in the master's name!",
	starttrigger3 = "You cannot hide from me!",
	starttrigger4 = "Run while you still can!",

	silencetrigger = "Grand Widow Faerlina is afflicted by Widow's Embrace.", -- EDITED it affects her too.
	enragetrigger = "Grand Widow Faerlina gains Enrage.",
	enragefade = "Enrage fades from Grand Widow Faerlina.",

	startwarn = "Grand Widow Faerlina engaged, 60 seconds to enrage!",
	enragewarn15sec = "15 seconds until enrage!",
	enragewarn = "Enrage!",
	enrageremovewarn = "Enrage removed! %d seconds until next!", -- added
	silencewarn = "Silence! Delaying Enrage!",
	silencewarnnodelay = "Silence!",
	silencewarn5sec = "Silence ends in 5 sec",

	enragebar = "Enrage",
	silencebar = "Silence",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsFaerlina = BigWigs:NewModule(boss)
BigWigsFaerlina.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
BigWigsFaerlina.enabletrigger = boss
BigWigsFaerlina.toggleoptions = {"silence", "enrage", "bosskill"}
BigWigsFaerlina.revision = tonumber(string.sub("$Revision: 15233 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsFaerlina:OnEnable()
	self.enragetime = 60
	self.enrageTimerStarted = 0
	self.silencetime = 20
	self.enraged = nil

	started = nil

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "FaerlinaEnrage", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "FaerlinaSilence", 5)
end

function BigWigsFaerlina:CHAT_MSG_MONSTER_YELL( msg )
	if not started and msg == L["starttrigger1"] or msg == L["starttrigger2"] or msg == L["starttrigger3"] or msg == L["starttrigger4"] then
		self:TriggerEvent("BigWigs_Message", L["startwarn"], "Orange")
		if self.db.profile.enrage then
			self:ScheduleEvent("bwfaerlinaenrage15", "BigWigs_Message", self.enragetime - 15, L["enragewarn15sec"], "Important")
			self:TriggerEvent("BigWigs_StartBar", self, L["enragebar"], self.enragetime, "Interface\\Icons\\Spell_Shadow_UnholyFrenzy")
		end
		self.enrageTimerStarted = GetTime()
		started = true
	end
end

function BigWigsFaerlina:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS( msg )
	if msg == L["enragetrigger"] then
		self:TriggerEvent("BigWigs_SendSync", "FaerlinaEnrage")
	end
end

function BigWigsFaerlina:CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE( msg )
	if msg == L["silencetrigger"] then
		self:TriggerEvent("BigWigs_SendSync", "FaerlinaSilence")
	end
end

function BigWigsFaerlina:BigWigs_RecvSync( sync )
	if sync == "FaerlinaEnrage" then
		if self.db.profile.enrage then
			self:TriggerEvent("BigWigs_Message", L["enragewarn"], "Urgent")
		end
		self:TriggerEvent("BigWigs_StopBar", self, L["enragebar"])
		self:CancelScheduledEvent("bwfaerlinaenrage15") 
		if self.db.profile.enrage then
			self:TriggerEvent("BigWigs_StartBar", self, L["enragebar"], self.enragetime, "Interface\\Icons\\Spell_Shadow_UnholyFrenzy")
			self:ScheduleEvent("bwfaerlinaenrage15", "BigWigs_Message", self.enragetime - 15, L["enragewarn15sec"], "Important")
		end
		self.enrageTimerStarted = GetTime()
		self.enraged = true
	elseif sync == "FaerlinaSilence" then
		if not self.enraged then -- preemptive, 30s silence
		
			--[[ The enrage timer should only be reset if it's less than 30sec
			to her next enrage, because if you silence her when there's 30+
			sec to the enrage, it won't actually stop her from enraging. ]]

			local currentTime = GetTime()

			if self.db.profile.silence then
				if (self.enrageTimerStarted + 30) < currentTime then
					self:TriggerEvent("BigWigs_Message", L["silencewarnnodelay"], "Urgent")
				else
					self:TriggerEvent("BigWigs_Message", L["silencewarn"], "Urgent")
				end
				self:TriggerEvent("BigWigs_StartBar", self, L["silencebar"], self.silencetime, "Interface\\Icons\\Spell_Holy_Silence")
				self:ScheduleEvent("bwfaerlinasilence5", "BigWigs_Message", self.silencetime -5, L["silencewarn5sec"], "Urgent")
			end
			if (self.enrageTimerStarted + 30) < currentTime then
				if self.db.profile.enrage then
					-- We SHOULD reset the enrage timer, since it's more than 30
					-- sec since enrage started. This is only visuals ofcourse.
					self:TriggerEvent("BigWigs_StopBar", self, L["enragebar"])
					self:CancelScheduledEvent("bwfaerlinaenrage15")
					self:ScheduleEvent( "bwfaerlinaenrage15", "BigWigs_Message", self.silencetime - 15, L["enragewarn15sec"], "Important")
					self:TriggerEvent("BigWigs_StartBar", self, L["enragebar"], self.silencetime, "Interface\\Icons\\Spell_Shadow_UnholyFrenzy")
				end
				self.enrageTimerStarted = currentTime
			end

		else -- Reactive enrage removed
			if self.db.profile.enrage then
				self:TriggerEvent("BigWigs_Message", string.format(L["enrageremovewarn"], self.enragetime), "Urgent")
			end
			if self.db.profile.silence then
				self:TriggerEvent("BigWigs_StartBar", self, L["silencebar"], self.silencetime, "Interface\\Icons\\Spell_Holy_Silence")
				self:ScheduleEvent("bwfaerlinasilence5", "BigWigs_Message", self.silencetime -5, L["silencewarn5sec"], "Urgent")
 			end
			self.enraged = nil
		end
	end
end


