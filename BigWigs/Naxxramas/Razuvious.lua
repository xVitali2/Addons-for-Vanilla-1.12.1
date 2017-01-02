------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Instructor Razuvious"]
local understudy = AceLibrary("Babble-Boss-2.2")["Deathknight Understudy"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Razuvious",

	shout_cmd = "shout",
	shout_name = "Shout Alert",
	shout_desc = "Warn for disrupting shout",

	unbalance_cmd = "unbalancing",
	unbalance_name = "Unbalancing Strike Alert",
	unbalance_desc = "Warn for Unbalancing Strike",

	shieldwall_cmd = "shieldwall",
	shieldwall_name = "Shield Wall Timer",
	shieldwall_desc = "Show timer for Shield Wall",

	startwarn = "Instructor Razuvious engaged! 20sec to Shout, 30sec to Unbalancing Strike!",

	starttrigger1 = "Stand and fight!",
	starttrigger2 = "Show me what you've got!",
	starttrigger3 = "Hah hah, I'm just getting warmed up!",
	--starttrigger4 = "Stand and fight!",

	shouttrigger = "Disrupting Shout",
	shout7secwarn = "7 sec to Disrupting Shout",
	shout3secwarn = "3 sec to Disrupting Shout!",
	shoutwarn = "Disrupting Shout! Next in 25secs",
	noshoutwarn = "No shout! Next in 20secs",
	shoutbar = "Disrupting Shout",


        unbalance_trigger = "afflicted by Unbalancing Strike",
	unbalancesoonwarn = "Unbalancing Strike coming soon!",
	unbalancewarn = "Unbalancing Strike! Next in ~30sec",
	unbalancebar = "Unbalancing Strike",

	shieldwalltrigger   = "Death Knight Understudy gains Shield Wall.",
	shieldwallbar       = "Shield Wall",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsRazuvious = BigWigs:NewModule(boss)
BigWigsRazuvious.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
BigWigsRazuvious.enabletrigger = { boss }
BigWigsRazuvious.wipemobs = { understudy }
BigWigsRazuvious.toggleoptions = {"shout", "unbalance", "shieldwall", "bosskill"}
BigWigsRazuvious.revision = tonumber(string.sub("$Revision: 15233 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsRazuvious:OnEnable()
	self.timeShout = 30
	self.prior = nil

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Shout")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Shout")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Shout")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Unbalance")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Unbalance")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Unbalance")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE", "Unbalance")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS", "Shieldwall")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS", "Shieldwall")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS", "Shieldwall")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Shieldwall")

	self:RegisterEvent("BigWigs_Message")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "RazuviousShout", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "RazuviousShieldwall", 5)
end

function BigWigsRazuvious:CHAT_MSG_MONSTER_YELL( msg )
	if msg == L["starttrigger1"] or msg == L["starttrigger2"] or msg == L["starttrigger3"] then
		if self.db.profile.shout then
			self:TriggerEvent("BigWigs_Message", L["startwarn"], "Attention", nil, "Urgent")
			self:ScheduleEvent("bwrazuviousshout7sec", "BigWigs_Message", 13, L["shout7secwarn"], "Urgent")
			self:ScheduleEvent("bwrazuviousshout3sec", "BigWigs_Message", 17, L["shout3secwarn"], "Urgent")
			self:TriggerEvent("BigWigs_StartBar", self, L["shoutbar"], 20, "Interface\\Icons\\Ability_Warrior_WarCry")
		end
		self:ScheduleEvent("bwrazuviousnoshout", self.noShout, self.timeShout - 5, self ) -- praeda first no shout fix
	end
end

function BigWigsRazuvious:BigWigs_Message(text)
	if text == L["shout7secwarn"] then self.prior = nil end
end

function BigWigsRazuvious:Shieldwall( msg ) 
	if string.find(msg, L["shieldwalltrigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "RazuviousShieldwall")
	end
end

function BigWigsRazuvious:Shout( msg )
	if string.find(msg, L["shouttrigger"]) and not self.prior then
		self:TriggerEvent("BigWigs_SendSync", "RazuviousShout")
	end
end

function BigWigsRazuvious:noShout()	
	self:CancelScheduledEvent("bwrazuviousnoshout")
	self:ScheduleEvent("bwrazuviousnoshout", self.noShout, self.timeShout - 5, self )
	if self.db.profile.shout then
		self:TriggerEvent("BigWigs_Message", L["noshoutwarn"], "Attention")
		self:ScheduleEvent("bwrazuviousshout7sec", "BigWigs_Message", 13, L["shout7secwarn"], "Urgent")
		self:ScheduleEvent("bwrazuviousshout3sec", "BigWigs_Message", 17, L["shout3secwarn"], "Urgent")
		self:TriggerEvent("BigWigs_StartBar", self, L["shoutbar"], 20, "Interface\\Icons\\Ability_Warrior_WarCry")
	end
end

function BigWigsRazuvious:Unbalance(msg)	
	if string.find(msg, L["unbalance_trigger"]) then
		self:TriggerEvent("BigWigs_Message", L["unbalancewarn"], "Urgent")
		self:ScheduleEvent("bwrazuviousunbalance5sec", "BigWigs_Message", 25, L["unbalancesoonwarn"], "Urgent")
		self:TriggerEvent("BigWigs_StartBar", self, L["unbalancebar"], 30, "Interface\\Icons\\Ability_Warrior_DecisiveStrike")
	end
end


function BigWigsRazuvious:BigWigs_RecvSync( sync )
	if sync == "RazuviousShout" then
		self:CancelScheduledEvent("bwrazuviousnoshout")
		self:ScheduleEvent("bwrazuviousnoshout", self.noShout, self.timeShout, self )		
		if self.db.profile.shout then
			self:TriggerEvent("BigWigs_Message", L["shoutwarn"], "Attention", nil, "Alarm")
			self:ScheduleEvent("bwrazuviousshout7sec", "BigWigs_Message", 18, L["shout7secwarn"], "Urgent")
			self:ScheduleEvent("bwrazuviousshout3sec", "BigWigs_Message", 22, L["shout3secwarn"], "Urgent")
			self:TriggerEvent("BigWigs_StartBar", self, L["shoutbar"], 25, "Interface\\Icons\\Ability_Warrior_WarCry")
		end
		self.prior = true
	elseif sync == "RazuviousShieldwall" then
		if self.db.profile.shieldwall then
			self:TriggerEvent("BigWigs_StartBar", self, L["shieldwallbar"], 20, "Interface\\Icons\\Ability_Warrior_ShieldWall")
		end
	end
end


