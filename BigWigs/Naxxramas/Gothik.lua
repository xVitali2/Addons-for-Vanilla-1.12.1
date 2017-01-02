------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Gothik the Harvester"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Gothik",

	room_cmd = "room",
	room_name = "Room Arrival Warnings",
	room_desc = "Warn for Gothik's arrival",

	add_cmd = "add",
	add_name = "Add Warnings",
	add_desc = "Warn for adds",

	adddeath_cmd = "adddeath",
	adddeath_name = "Add Death Alert",
	adddeath_desc = "Alerts when an add dies.",

	disabletrigger = "I... am... undone.",

	starttrigger1 = "Brazenly you have disregarded powers beyond your understanding.",
	starttrigger2 = "Teamanare shi rikk mannor rikk lok karkun",
	startwarn = "Gothik the Harvester engaged! 4:35 till he's in the room.",

	rider_name = "Unrelenting Rider",
	spectral_rider_name = "Spectral Rider",
	deathknight_name = "Unrelenting Deathknight",
	spectral_deathknight_name = "Spectral Deathknight",
	trainee_name = "Unrelenting Trainee",
	spectral_trainee_name = "Spectral Trainee",

	riderdiewarn = "Rider dead!",
	dkdiewarn = "Death Knight dead!",

	warn1 = "In room in ~3 minutes",
	warn2 = "In room in ~90 seconds",
	warn3 = "In room in ~60 seconds",
	warn4 = "In room in ~30 seconds",
	warn5 = "Gothik Incoming in 10 seconds",

	wave = "%d/22: ", -- its only 22 waves not 26

	trawarn = "Trainees in 3 seconds",
	dkwarn = "Deathknight in 3 seconds",
	riderwarn = "Rider in 3 seconds",

	trabar = "Trainee - %d",
	dkbar = "Deathknight - %d",
	riderbar = "Rider - %d",

	inroomtrigger = "I have waited long enough! Now, you face the harvester of souls.",
	inroomwarn = "He's in the room!",

	inroombartext = "In Room",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsGothik = BigWigs:NewModule(boss)
BigWigsGothik.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
BigWigsGothik.enabletrigger = { boss }
BigWigsGothik.wipemobs = {
	L["rider_name"], L["deathknight_name"], L["trainee_name"],
	L["spectral_rider_name"], L["spectral_deathknight_name"], L["spectral_trainee_name"]
}
BigWigsGothik.toggleoptions = { "room", -1, "add", "adddeath", "bosskill" }
BigWigsGothik.revision = tonumber(string.sub("$Revision: 15773 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsGothik:OnEnable()
	self.wave = 0
	self.tratime = 20 -- testing from 21
	self.dktime = 72
	self.ridertime = 132
	self.tranum = 1
	self.dknum = 1
	self.ridernum = 1

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL") 	
	--self:RegisterEvent("CHAT_MSG_SAY") -- test trigger
end

function BigWigsGothik:CHAT_MSG_COMBAT_HOSTILE_DEATH( msg )
	if self.db.profile.adddeath and msg == string.format(UNITDIESOTHER, L["rider_name"]) then
		self:TriggerEvent("BigWigs_Message", L["riderdiewarn"], "Important")
	elseif self.db.profile.adddeath and msg == string.format(UNITDIESOTHER, L["deathknight_name"]) then
		self:TriggerEvent("BigWigs_Message", L["dkdiewarn"], "Important")
	end
end

function BigWigsGothik:StopRoom()
	self:TriggerEvent("BigWigs_StopBar", self, L["inroombartext"])
	self:CancelScheduledEvent("bwgothikwarn1")
	self:CancelScheduledEvent("bwgothikwarn2")
	self:CancelScheduledEvent("bwgothikwarn3")
	self:CancelScheduledEvent("bwgothikwarn4")
	self:CancelScheduledEvent("bwgothikwarn5")
	--if self.tranum and self.dknum and self.ridernum then
	--	self:TriggerEvent("BigWigs_StopBar", self, string.format(L["trabar"], self.tranum - 1)) -- disabled for custom cancel
	--	self:TriggerEvent("BigWigs_StopBar", self, string.format(L["dkbar"], self.dknum - 1)) -- too
	--	self:TriggerEvent("BigWigs_StopBar", self, string.format(L["riderbar"], self.ridernum - 1)) -- too
	--end
	--self:CancelScheduledEvent("bwgothiktrawarn")
	--self:CancelScheduledEvent("bwgothikdkwarn")
	--self:CancelScheduledEvent("bwgothikriderwarn")
	--self:CancelScheduledEvent("bwgothiktrarepop")
	--self:CancelScheduledEvent("bwgothikdkrepop")
	--self:CancelScheduledEvent("bwgothikriderrepop")
	self.wave = 0
	self.tranum = 1
	self.dknum = 1
	self.ridernum = 1
end

function BigWigsGothik:WaveWarn(message, L, color)
	self.wave = self.wave + 1
	if self.db.profile.add then self:TriggerEvent("BigWigs_Message", string.format(L["wave"], self.wave) .. message, color) end
end

function BigWigsGothik:Trainee()
	if self.db.profile.add then
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["trabar"], self.tranum), self.tratime, "Interface\\Icons\\Ability_Seal")
	end
	self:ScheduleEvent("bwgothiktrawarn", self.WaveWarn, self.tratime - 3, self, L["trawarn"], L, "Attention")
	self:ScheduleRepeatingEvent("bwgothiktrarepop", self.Trainee, self.tratime, self)
	self.tranum = self.tranum + 1

	if self.tranum >= 13 then  -- cancels bar after wave 11
		self:TriggerEvent("BigWigs_StopBar", self, string.format(L["trabar"], self.tranum - 1))
		self:CancelScheduledEvent("bwgothiktrawarn")
		self:CancelScheduledEvent("bwgothiktrarepop")
		self.tranum = 1
	end
	
end

function BigWigsGothik:DeathKnight()
	if self.db.profile.add then
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["dkbar"], self.dknum), self.dktime, "Interface\\Icons\\INV_Boots_Plate_08")
	end
	self:ScheduleEvent("bwgothikdkwarn", self.WaveWarn, self.dktime - 3, self, L["dkwarn"], L, "Urgent")
	self:ScheduleRepeatingEvent("bwgothikdkrepop", self.DeathKnight, self.dktime, self)
	self.dknum = self.dknum + 1

	if self.dknum >= 9 then  -- cancels bar after wave 7
		self:TriggerEvent("BigWigs_StopBar", self, string.format(L["dkbar"], self.dknum - 1))
		self:CancelScheduledEvent("bwgothikdkwarn")
		self:CancelScheduledEvent("bwgothikdkrepop")
		self.dknum = 1
	end
end

function BigWigsGothik:Rider()
	if self.db.profile.add then
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["riderbar"], self.ridernum), self.ridertime, "Interface\\Icons\\Spell_Shadow_DeathPact")
	end
	self:ScheduleEvent("bwgothikriderwarn", self.WaveWarn, self.ridertime - 3, self, L["riderwarn"], L, "Important")
	self:ScheduleRepeatingEvent("bwgothikriderrepop", self.Rider, self.ridertime, self)
	self.ridernum = self.ridernum + 1
		
	if self.ridernum >= 6 then  -- cancels bar after wave 4
		self:TriggerEvent("BigWigs_StopBar", self, string.format(L["riderbar"], self.ridernum - 1)) 
		self:CancelScheduledEvent("bwgothikriderwarn")
		self:CancelScheduledEvent("bwgothikriderrepop")
		self.ridernum = 1
		
	end
end

function BigWigsGothik:CHAT_MSG_MONSTER_YELL( msg )
	if msg == L["starttrigger1"] or msg == L["starttrigger2"] then
		if self.db.profile.room then
			self:TriggerEvent("BigWigs_Message", L["startwarn"], "Important")
			self:TriggerEvent("BigWigs_StartBar", self, L["inroombartext"], 273, "Interface\\Icons\\Spell_Magic_LesserInvisibilty")
			self:ScheduleEvent("bwgothikwarn1", "BigWigs_Message", 93, L["warn1"], "Attention")
			self:ScheduleEvent("bwgothikwarn2", "BigWigs_Message", 183, L["warn2"], "Attention")
			self:ScheduleEvent("bwgothikwarn3", "BigWigs_Message", 213, L["warn3"], "Urgent")
			self:ScheduleEvent("bwgothikwarn4", "BigWigs_Message", 243, L["warn4"], "Important")
			self:ScheduleEvent("bwgothikwarn5", "BigWigs_Message", 263, L["warn5"], "Important")
		end
		self.wave = 0
		self.tranum = 1
		self.dknum = 1
		self.ridernum = 1
		if self.db.profile.add then
			self:Trainee()
			self:DeathKnight()
			self:Rider()
		end
		-- set the new times
		self.tratime = 20.3 -- its 20.5 seconds not 21
		self.dktime = 25
		self.ridertime = 30
	elseif msg == L["inroomtrigger"] then
		if self.db.profile.room then self:TriggerEvent("BigWigs_Message", L["inroomwarn"], "Important") end
		self:StopRoom()
	elseif string.find(msg, L["disabletrigger"]) then
		if self.db.profile.bosskill then self:TriggerEvent("BigWigs_Message", string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], boss), "Bosskill", nil, "Victory") end
		self.core:ToggleModuleActive(self, false)
	end
end


