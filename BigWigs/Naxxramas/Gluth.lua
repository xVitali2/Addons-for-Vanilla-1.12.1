------------------------------
--      Are you local?      --
------------------------------
local boss = AceLibrary("Babble-Boss-2.2")["Gluth"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local started = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Gluth",

	fear_cmd = "fear",
	fear_name = "Fear Alert",
	fear_desc = "Warn for fear",

	frenzy_cmd = "frenzy",
	frenzy_name = "Frenzy Alert",
	frenzy_desc = "Warn for frenzy",

	enrage_cmd = "enrage",
	enrage_name = "Enrage Timer",
	enrage_desc = "Warn for Enrage",

	decimate_cmd = "decimate",
	decimate_name = "Decimate Alert",
	decimate_desc = "Warn for Decimate",

	trigger1 = "%s goes into a frenzy!",
	ftrigger1 = "gains Frenzy",
	etrigger1 = "gains Berserk",
	trigger2 = "by Terrifying Roar.",
	starttrigger = "devours all nearby zombies!",

	warn1 = "Frenzy Alert!",
	warn2 = "5 second until AoE Fear!",
	warn3 = "AoE Fear alert - 20 seconds till next!",

	enragewarn = "ENRAGE!",
	enragebartext = "Enrage",
	ewarn1 = "Enrage in 90 seconds",
	ewarn2 = "Enrage in 30 seconds",
	ewarn3 = "Enrage in 10 seconds",

	startwarn = "Gluth Engaged! ~1:45 till Decimate!",
	decimatesoonwarn = "Decimate Soon!",
	decimatebar = "Decimate Zombies",
	
	zombies_cmd = "zombies",
	zombies_name = "Zombie Spawn",
	zombies_desc = "Shows timer for zombies",
	zombiebar = "Next Zombie - %d",

	bar1text = "AoE Fear",

	testtrigger = "testtrigger";
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsGluth = BigWigs:NewModule(boss)
BigWigsGluth.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
BigWigsGluth.enabletrigger = boss
BigWigsGluth.toggleoptions = {"frenzy", "fear", "decimate", "enrage", "bosskill", "zombies"}
BigWigsGluth.revision = tonumber(string.sub("$Revision: 15380 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsGluth:OnEnable()
	self.prior = nil
	self.zomnum = 1
	started = nil

	
	self:RegisterEvent("BigWigs_Message")

	
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Frenzy")

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "Frenzy")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Enrage")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Fear")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Fear")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Fear")

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")

	self:RegisterEvent("BigWigs_RecvSync")
end


function BigWigsGluth:Zombies()	
	self:TriggerEvent("BigWigs_StartBar", self, string.format(L["zombiebar"],self.zomnum), 10, "Interface\\Icons\\Ability_Seal")	

	if self.zomnum <= 10
	then
	self.zomnum = self.zomnum + 1
	elseif self.zomnum > 10
	then		
	self:CancelScheduledEvent("bwgluthzbrepop")	self:TriggerEvent("BigWigs_StopBar", self, string.format(L["zombiebar"], self.zomnum ))
	self.zomnum = 1
	
	end
	
end
function BigWigsGluth:Zombie()
	self:ScheduleRepeatingEvent("bwgluthzbrepop", self.Zombies, 10, self)
end




function BigWigsGluth:Frenzy( msg )
	if self.db.profile.zombies and msg == L["trigger1"] then
		self:TriggerEvent("BigWigs_Message", L["warn1"], "Important")
	end
end


function BigWigsGluth:Fear( msg )
	if self.db.profile.fear and not self.prior and string.find(msg, L["trigger2"]) then
		self:TriggerEvent("BigWigs_Message", L["warn3"], "Important")
		self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 20, "Interface\\Icons\\Spell_Shadow_PsychicScream")
		self:ScheduleEvent("BigWigs_Message", 15, L["warn2"], "Urgent")
		self.prior = true
	end
end

function BigWigsGluth:Decimate()
	if self.db.profile.decimate then
		self:TriggerEvent("BigWigs_StartBar", self, L["decimatebar"], 104, "Interface\\Icons\\INV_Shield_01")
		self:ScheduleEvent("bwgluthdecimatewarn", "BigWigs_Message", 97, L["decimatesoonwarn"], "Urgent")
	end
	if self.db.profile.zombies then
	self.zomnum = 1
	self:TriggerEvent("BigWigs_StartBar", self, string.format(L["zombiebar"],self.zomnum), 10, "Interface\\Icons\\Ability_Seal")
	self.zomnum = self.zomnum + 1
	self:Zombie()
	end
end



function BigWigsGluth:BigWigs_RecvSync( sync, rest, nick )
	if sync == self:GetEngageSync() and rest and rest == boss and not started then
		started = true
		if self:IsEventRegistered("PLAYER_REGEN_DISABLED") then	self:UnregisterEvent("PLAYER_REGEN_DISABLED") end
		if self.db.profile.decimate then
			self:TriggerEvent("BigWigs_Message", L["startwarn"], "Attention")
			self:Decimate()
			self:ScheduleRepeatingEvent( "bwgluthdecimate", self.Decimate, 104, self )
		end
	if self.db.profile.zombies then
	self.zomnum = 1
	self:TriggerEvent("BigWigs_StartBar", self, string.format(L["zombiebar"],self.zomnum), 10, "Interface\\Icons\\Ability_Seal")
	self.zomnum = self.zomnum + 1
	self:Zombie()
	end
	if self.db.profile.enrage then
		self:TriggerEvent("BigWigs_StartBar", self, L["enragebartext"], 324, "Interface\\Icons\\Spell_Shadow_UnholyFrenzy")
		self:ScheduleEvent("bwgluthwarn1", "BigWigs_Message", 254, L["ewarn1"], "Attention")
		self:ScheduleEvent("bwgluthwarn2", "BigWigs_Message", 294, L["ewarn2"], "Attention")
		self:ScheduleEvent("bwgluthwarn3", "BigWigs_Message", 314, L["ewarn3"], "Urgent")
		end
	end
end

function BigWigsGluth:Enrage( msg )
	if string.find(msg, L["etrigger1"]) then
		if self.db.profile.enrage then self:TriggerEvent("BigWigs_Message", L["enragewarn"], "Important") end
		self:CancelScheduledEvent("bwgluthdecimate")
		self:CancelScheduledEvent("bwgluthdecimatewarn")
		self:CancelScheduledEvent("bwgluthwarn1")
		self:CancelScheduledEvent("bwgluthwarn2")
		self:CancelScheduledEvent("bwgluthwarn3")
	end
end

function BigWigsGluth:BigWigs_Message(text)
	if text == L["warn2"] then self.prior = nil end
end


