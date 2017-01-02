------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Noth the Plaguebringer"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Noth",

	blink_cmd = "blink",
	blink_name = "Blink Alert",
	blink_desc = "Warn for blink",

	teleport_cmd = "teleport",
	teleport_name = "Teleport Alert",
	teleport_desc = "Warn for teleport",

	curse_cmd = "curse",
	curse_name = "Curse Alert",
	curse_desc = "Warn for curse",

	wave_cmd = "wave",
	wave_name = "Wave Alert",
	wave_desc = "Warn for waves",

	starttrigger1 = "Die, trespasser!",
	starttrigger2 = "Glory to the master!",
	starttrigger3 = "Your life is forfeit!",
	startwarn = "Noth the Plaguebringer engaged! 90 seconds till teleport",

	addtrigger = "Rise, my soldiers! Rise and fight once more!",

	blinktrigger = "Noth the Plaguebringer gains Blink.",
	blinkwarn = "Blink!",
	blinkwarn2 = "Blink in ~5 seconds!",
	blinkwarn3 = "Blink in ~10 seconds!",
	blinkbar = "Blink",

	teleportwarn = "Teleport! He's on the balcony!",
	teleportwarn2 = "Teleport in 10 seconds!",
	teleportwarn3 = "Teleport in 30 seconds!",

	teleportbar = "Teleport!",
	backbar = "Back in room!",

	backwarn = "He's back in the room for %d seconds!",
	backwarn2 = "10 seconds until he's back in the room!",
	backwarn3 = "30 seconds until he's back in the room!",

	cursetrigger = "afflicted by Curse of the Plaguebringer",
	cursewarn = "Curse! next in ~28 seconds",
	curse10secwarn = "Curse in ~10 seconds",

	cursebar = "Next Curse",

	wave1bar = "Wave 1",
	wave2bar = "Wave 2",
	wave3bar = "Wave 3",
	wave2_message = "Wave 2 in 10sec",
	wave2s_message = "Wave 2 Spawning!",
} end )
----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsNoth = BigWigs:NewModule(boss)
BigWigsNoth.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
BigWigsNoth.enabletrigger = boss
BigWigsNoth.toggleoptions = {"blink", "teleport", "curse", "wave", "bosskill"}
BigWigsNoth.revision = tonumber(string.sub("$Revision: 15520 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsNoth:OnEnable()
	self.timeblink = 25
	self.timeroom = 90
	self.timebalcony = 70
	self.cursetime = 28
	self.wave1time = 5
	self.wave2time = 41
	self.wave3time = 70	
	self.prior = nil

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "NothBlink", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "NothCurse", 5)

	self:RegisterEvent("BigWigs_Message")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Curse")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Curse")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Curse")
end


function BigWigsNoth:Curse( msg )
	if string.find(msg, L["cursetrigger"]) and not self.prior then
		self:TriggerEvent("BigWigs_SendSync", "NothCurse")
	end
end

function BigWigsNoth:CHAT_MSG_MONSTER_YELL( msg )
	if msg == L["starttrigger1"] or msg == L["starttrigger2"] or msg == L["starttrigger3"] then
		self.timeroom = 90
		self.timebalcony = 70
		self.timeblink = 11 -- sets timer for first blink after first balcony

		if self.db.profile.teleport then
			self:TriggerEvent("BigWigs_Message", L["startwarn"], "Important")
			self:ScheduleEvent("BigWigs_Message", self.timeroom-10, L["teleportwarn2"], "Urgent")
			self:ScheduleEvent("BigWigs_Message", self.timeroom-30, L["teleportwarn3"], "Urgent")
			self:TriggerEvent("BigWigs_StartBar", self, L["teleportbar"], self.timeroom, "Interface\\Icons\\Spell_Magic_LesserInvisibilty")
		end
		if self.db.profile.blink then
			self:TriggerEvent("BigWigs_StartBar", self, L["blinkbar"], 25, "Interface\\Icons\\Spell_Arcane_Blink")
			self:ScheduleEvent("bwnothblink", "BigWigs_Message", 15, L["blinkwarn3"], "Attention")
			self:ScheduleEvent("bwnothblink2", "BigWigs_Message", 20, L["blinkwarn2"], "Attention")
		end

		self:ScheduleEvent("bwnothtobalcony", self.teleportToBalcony, self.timeroom, self)
	end
end

function BigWigsNoth:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS( msg )
	if msg == L["blinktrigger"] then
		self:TriggerEvent("BigWigs_SendSync", "NothBlink")
	end
end

function BigWigsNoth:BigWigs_RecvSync( sync )
	if sync == "NothCurse" then
		if self.db.profile.curse then
			self:TriggerEvent("BigWigs_Message", L["cursewarn"], "Important", nil, "Alarm")
			self:ScheduleEvent("bwnothcurse", "BigWigs_Message", self.cursetime-10, L["curse10secwarn"], "Urgent")
			self:TriggerEvent("BigWigs_StartBar", self, L["cursebar"], self.cursetime, "Interface\\Icons\\Spell_Shadow_AnimateDead")
		end
		self.prior = true
	elseif sync == "NothBlink" then
		if self.db.profile.blink then
			self:TriggerEvent("BigWigs_Message", L["blinkwarn"], "Important")
			self:ScheduleEvent("bwnothblink", "BigWigs_Message", 15, L["blinkwarn3"], "Attention")
			self:ScheduleEvent("bwnothblink2", "BigWigs_Message", 20, L["blinkwarn2"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["blinkbar"], 25, "Interface\\Icons\\Spell_Arcane_Blink")
		end
	end
end

function BigWigsNoth:BigWigs_Message(text)
	if text == L["curse10secwarn"] then self.prior = nil end
end

function BigWigsNoth:teleportToBalcony()
	if self.timeroom == 90 then
		self.timeroom = 110	
	elseif self.timeroom == 110 then
		self.timeroom = 180
		self.timeblink = 22 -- 2nd teleport to balcony
		
		
	end

	self:CancelScheduledEvent("bwnothblink")
	self:CancelScheduledEvent("bwnothcurse")
	self:TriggerEvent("BigWigs_StopBar", self, L["blinkbar"])
	self:TriggerEvent("BigWigs_StopBar", self, L["cursebar"])

	if self.db.profile.teleport then 
		self:TriggerEvent("BigWigs_Message", L["teleportwarn"], "Important")
		self:TriggerEvent("BigWigs_StartBar", self, L["backbar"], self.timebalcony, "Interface\\Icons\\Spell_Magic_LesserInvisibilty")
		self:ScheduleEvent("bwnothback", "BigWigs_Message", self.timebalcony - 30, L["backwarn3"], "Urgent")
		self:ScheduleEvent("bwnothback2", "BigWigs_Message", self.timebalcony - 10, L["backwarn2"], "Urgent")
			end
	if self.db.profile.wave then
		self:TriggerEvent("BigWigs_StartBar", self, L["wave1bar"], self.wave1time, "Interface\\Icons\\Spell_ChargePositive" )
		self:TriggerEvent("BigWigs_StartBar", self, L["wave2bar"], self.wave2time, "Interface\\Icons\\Spell_ChargePositive" )
		self:TriggerEvent("BigWigs_StartBar", self, L["wave3bar"], self.wave3time, "Interface\\Icons\\Spell_ChargePositive" )
		self:ScheduleEvent("bwnothwave2inc", "BigWigs_Message", self.wave2time - 10, L["wave2_message"], "Urgent")
		self:ScheduleEvent("bwnothwave2spawn", "BigWigs_Message", self.wave2time, L["wave2s_message"], "Urgent")
	end
	self:ScheduleEvent("bwnothtoroom", self.teleportToRoom, self.timebalcony, self)
end

function BigWigsNoth:teleportToRoom()
	if self.timebalcony == 70 then
		self.timebalcony = 95
	elseif self.timebalcony == 95 then
		self.timebalcony = 120
		
	end

	if self.db.profile.teleport then
		self:TriggerEvent("BigWigs_Message", string.format(L["backwarn"], self.timeroom), "Important")
			self:TriggerEvent("BigWigs_StartBar", self, L["blinkbar"], self.timeblink, "Interface\\Icons\\Spell_Arcane_Blink")
			self:ScheduleEvent("bwnothblink2", "BigWigs_Message", self.timeblink - 10, L["blinkwarn3"], "Attention") -- praeda
			self:ScheduleEvent("bwnothblink2", "BigWigs_Message", self.timeblink - 5, L["blinkwarn2"], "Attention") -- praeda
		
		self:TriggerEvent("BigWigs_StartBar", self, L["teleportbar"], self.timeroom, "Interface\\Icons\\Spell_Magic_LesserInvisibilty")
		self:ScheduleEvent("bwnothteleport", "BigWigs_Message", self.timeroom - 10, L["teleportwarn2"], "Urgent")
		self:ScheduleEvent("bwnothteleport2", "BigWigs_Message", self.timeroom - 10, L["teleportwarn3"], "Urgent")
	end
	self.prior = nil
	self:ScheduleEvent("bwnothtobalcony", self.teleportToBalcony, self.timeroom, self)
end

