------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Loatheb"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local started = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Loatheb",

	doom_cmd = "doom",
	doom_name = "Inevitable Doom Alert",
	doom_desc = "Warn for Inevitable Doom",

	curse_cmd = "curse",
	curse_name = "Remove Curse Alert",
	curse_desc = "Warn when curses are removed from Loatheb",

	doombar = "Inevitable Doom %d",
	doomwarn = "Inevitable Doom %d! %d sec to next!",
	doomwarn5sec = "Inevitable Doom %d in 5 sec!",
	doomtrigger = "afflicted by Inevitable Doom.",

	cursewarn = "Curses removed! RENEW CURSES",
	cursebar = "Remove Curse",
	cursetrigger = "Loatheb's Chains of Ice is removed.",

	doomtimerbar = "Doom every 15sec",
	doomtimerwarn = "Doom timerchange in %s seconds!",
	doomtimerwarnnow = "Inevitable Doom now happens every 15sec!",

	cursetimerbar = "Remove Curse Timer",
	cursetimerwarn = "Curses removed, next in %s seconds!",

	startwarn = "Loatheb engaged, 2 min to Inevitable Doom!",

	you = "You",
	are = "are",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsLoatheb = BigWigs:NewModule(boss)
BigWigsLoatheb.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
BigWigsLoatheb.enabletrigger = boss
BigWigsLoatheb.toggleoptions = {"doom", "curse", "bosskill"}
BigWigsLoatheb.revision = tonumber(string.sub("$Revision: 15709 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsLoatheb:OnEnable()
	self.doomTime = 30
	self.sporeCount = 1
	self.doomCount = 1
	started = nil

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")

	self:RegisterEvent("CHAT_MSG_SPELL_BREAK_AURA", "Curse")

	self:RegisterEvent("BigWigs_RecvSync")

	-- 2: Doom and SporeSpawn versioned up because of the sync including the
	-- doom/spore count now, so we don't hold back the counter.
	self:TriggerEvent("BigWigs_ThrottleSync", "LoathebDoom2", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "LoathebSporeSpawn2", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "LoathebRemoveCurse", 5)
end

function BigWigsLoatheb:BigWigs_RecvSync(sync, rest, nick)
	if sync == self:GetEngageSync() and rest and rest == boss and not started then
		started = true
		if self:IsEventRegistered("PLAYER_REGEN_DISABLED") then
			self:UnregisterEvent("PLAYER_REGEN_DISABLED")
		end
		if self.db.profile.doom then
			self:TriggerEvent("BigWigs_StartBar", self, L["doomtimerbar"], 300, "Interface\\Icons\\Spell_Shadow_UnholyFrenzy")
			self:ScheduleEvent("bwloathebtimerreduce1", "BigWigs_Message", 240, string.format(L["doomtimerwarn"], 60), "Attention")
			self:ScheduleEvent("bwloathebtimerreduce2", "BigWigs_Message", 270, string.format(L["doomtimerwarn"], 30), "Attention")
			self:ScheduleEvent("bwloathebtimerreduce3", "BigWigs_Message", 290, string.format(L["doomtimerwarn"], 10), "Urgent")
			self:ScheduleEvent("bwloathebtimerreduce4", "BigWigs_Message", 295, string.format(L["doomtimerwarn"], 5), "Important")
			self:ScheduleEvent("bwloathebtimerreduce5", "BigWigs_Message", 300, L["doomtimerwarnnow"], "Important")
			self:ScheduleEvent("bwloathebdoomtimerreduce", function () BigWigsLoatheb.doomTime = 15 end, 300)
			self:TriggerEvent("BigWigs_Message", L["startwarn"], "Red")
			self:TriggerEvent("BigWigs_StartBar", self, string.format(L["doombar"], self.doomCount), 120, "Interface\\Icons\\Spell_Shadow_NightOfTheDead")
			self:ScheduleEvent("bwloathebdoom", "BigWigs_Message", 115, string.format(L["doomwarn5sec"], self.doomCount), "Urgent")
		end
	elseif sync == "LoathebDoom2" and rest then
		rest = tonumber(rest)
		if not rest then return end

		if rest == (self.doomCount + 1) then
			if self.db.profile.doom then
				self:TriggerEvent("BigWigs_Message", string.format(L["doomwarn"], self.doomCount, self.doomTime), "Important")
			end
			self.doomCount = self.doomCount + 1
			if self.db.profile.doom then
				self:TriggerEvent("BigWigs_StartBar", self, string.format(L["doombar"], self.doomCount), self.doomTime, "Interface\\Icons\\Spell_Shadow_NightOfTheDead")
				self:ScheduleEvent("bwloathebdoom", "BigWigs_Message", self.doomTime - 5, string.format(L["doomwarn5sec"], self.doomCount), "Urgent")
			end
		end
	
	elseif sync == "LoathebSporeSpawn2" and rest then
		rest = tonumber(rest)
		if not rest then return end

		if rest == (self.sporeCount + 1) then
			if self.db.profile.spore then
				self:TriggerEvent("BigWigs_Message", string.format(L["sporewarn"], self.sporeCount), "Important")
			end
			self.sporeCount = self.sporeCount + 1
			if self.db.profile.spore then
				self:TriggerEvent("BigWigs_StartBar", self, string.format(L["sporebar"], self.sporeCount), 12, "Interface\\Icons\\Ability_TheBlackArrow")
			end
		end

	elseif sync == "LoathebRemoveCurse" then
		if self.db.profile.curse then
			self:TriggerEvent("BigWigs_Message", L["cursewarn"], "Important")
			self:TriggerEvent("BigWigs_StartBar", self, L["cursebar"], 30, "Interface\\Icons\\Spell_Holy_RemoveCurse")
		end
	end
end

function BigWigsLoatheb:Event( msg )
	if string.find(msg, L["doomtrigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "LoathebDoom2 "..tostring(self.doomCount + 1))
	end
end

function BigWigsLoatheb:Curse( msg )
	if string.find(msg, L["cursetrigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "LoathebRemoveCurse")
	end
end


