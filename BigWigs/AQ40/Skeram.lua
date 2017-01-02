------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["The Prophet Skeram"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	mcplayer = "You are afflicted by True Fulfillment.",
	mcplayerother = "(.*) is afflicted by True Fulfillment.",
	mcplayeryouend = "True Fulfillment fades from you.",
	mcplayerotherend = "True Fulfillment fades from (.*).",
	mcplayer_message = "You are mindcontrolled!",
	mcplayerother_message = "%s is mindcontrolled!",
	mindcontrol_bar = "MC: %s",
	deathyou_trigger = "You die.",
	deathother_trigger = "(.*) dies.",
	splitsoon_message = "Split soon! Get ready!",
	split_message = "Split!",
	kill_trigger = "You only delay",

	cmd = "Skeram",
	
	mc_cmd = "mc",
	mc_name = "Mind Control Alert",
	mc_desc = "Warn for Mind Control",
	
	split_cmd = "split",
	split_name = "Split Alert",
	split_desc = "Warn before Splitting",
} end )

L:RegisterTranslations("deDE", function() return {
	mcplayer = "Ihr seid von Wahre Erf\195\188llung betroffen.",
	mcplayerother = "(.*) ist von Wahre Erf\195\188llung betroffen.",
	mcplayeryouend = "Wahre Erf\195\188llung\' schwindet von Euch.",
	mcplayerotherend = "Wahre Erf\195\188llung schwindet von (.*).",
	mcplayer_message = "Ihr seid von Wahre Erf\195\188llung betroffen.",
	mcplayerother_message = "%s steht unter Gedankenkontrolle!",
	mindcontrol_bar = "GK: %s",
	deathyou_trigger = "Du stirbst.",
	deathother_trigger = "(.*) stirbt.",
	splitsoon_message = "Abbilder bald! Sei bereit!",
	split_message = "Abbilder!",
	kill_trigger = "You only delay",
	
	cmd = "Skeram",

	mc_cmd = "mc",
	mc_name = "Gedankenkontrolle",
	mc_desc = "Warnen, wenn jemand \195\188bernommen ist",

	split_cmd = "split",
	split_name = "Abbilder",
	split_desc = "Alarm vor der Aufteilung",
} end )
----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsSkeram = BigWigs:NewModule(boss)
BigWigsSkeram.zonename = AceLibrary("Babble-Zone-2.2")["Ahn'Qiraj"]
BigWigsSkeram.enabletrigger = boss
BigWigsSkeram.toggleoptions = {"mc", "split", "bosskill"}
BigWigsSkeram.revision = tonumber(string.sub("$Revision: 11204 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsSkeram:OnEnable()
	splittime = false
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH", "Event")
	self:RegisterEvent("UNIT_HEALTH")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "SkeramMC", 1)
	self:TriggerEvent("BigWigs_ThrottleSync", "SkeramMCEnd", 1)
	self:TriggerEvent("BigWigs_ThrottleSync", "SkeramSplit80Soon", 100)
	self:TriggerEvent("BigWigs_ThrottleSync", "SkeramSplit75Now", 100)
	self:TriggerEvent("BigWigs_ThrottleSync", "SkeramSplit55Soon", 100)
	self:TriggerEvent("BigWigs_ThrottleSync", "SkeramSplit50Now", 100)
	self:TriggerEvent("BigWigs_ThrottleSync", "SkeramSplit30Soon", 100)
	self:TriggerEvent("BigWigs_ThrottleSync", "SkeramSplit25Now", 100)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsSkeram:Event(msg)
	local _,_, mindcontrolother, mctype = string.find(msg, L["mcplayerother"])
	local _,_, mindcontrolotherend, mctype = string.find(msg, L["mcplayerotherend"])
	local _,_, mindcontrolotherdeath,mctype = string.find(msg, L["deathother_trigger"])
	if string.find(msg, L["mcplayer"]) then
		self:TriggerEvent("BigWigs_SendSync", "SkeramMC "..UnitName("player"))
	elseif string.find(msg, L["mcplayeryouend"]) then
		self:TriggerEvent("BigWigs_SendSync", "SkeramMCEnd "..UnitName("player"))
	elseif string.find(msg, L["deathyou_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "SkeramMCEnd "..UnitName("player"))
	elseif mindcontrolother then
		self:TriggerEvent("BigWigs_SendSync", "SkeramMC "..mindcontrolother)
	elseif mindcontrolotherend then
		self:TriggerEvent("BigWigs_SendSync", "SkeramMCEnd "..mindcontrolotherend)
	elseif mindcontrolotherdeath then
		self:TriggerEvent("BigWigs_SendSync", "SkeramMCEnd "..mindcontrolotherdeath)
	end
end

function BigWigsSkeram:CHAT_MSG_MONSTER_YELL(msg)
    if string.find(msg, L["kill_trigger"]) then
		if self.db.profile.bosskill then
			self:TriggerEvent("BigWigs_Message", string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], self:ToString()), "Bosskill", nil, "Victory")
		end
		self:TriggerEvent("BigWigs_RemoveRaidIcon")
		self.core:ToggleModuleActive(self, false)
	end
end

function BigWigsSkeram:UNIT_HEALTH(arg1)
	if UnitName(arg1) == boss then
		local health = UnitHealth(arg1)
		local maxhealth = UnitHealthMax(arg1)
		if (health > 424782 and health <= 453100) and maxhealth == 566375 and not splittime then
			self:TriggerEvent("BigWigs_SendSync", "SkeramSplit80Soon")
		elseif (health > 283188 and health <= 311507) and maxhealth == 566375 and not splittime then
			self:TriggerEvent("BigWigs_SendSync", "SkeramSplit55Soon")
		elseif (health > 141594 and health <= 169913) and maxhealth == 566375 and not splittime then
			self:TriggerEvent("BigWigs_SendSync", "SkeramSplit30Soon")
		elseif (health > 311508 and health <= 424781) and maxhealth == 566375 and splittime then
			self:TriggerEvent("BigWigs_SendSync", "SkeramSplit75Now")
		elseif (health > 169914 and health <= 283187) and maxhealth == 566375 and splittime then
			self:TriggerEvent("BigWigs_SendSync", "SkeramSplit50Now")
		elseif (health > 1 and health <= 141593) and maxhealth == 566375 and splittime then
			self:TriggerEvent("BigWigs_SendSync", "SkeramSplit25Now")
		end
	end
end

function BigWigsSkeram:BigWigs_RecvSync(sync, rest, nick)
	if sync == "SkeramSplit80Soon" then
		splittime = true
		if self.db.profile.split then
			self:TriggerEvent("BigWigs_Message", L["splitsoon_message"], "Urgent")
		end
	elseif sync == "SkeramSplit55Soon" then
		splittime = true
		if self.db.profile.split then
			self:TriggerEvent("BigWigs_Message", L["splitsoon_message"], "Urgent")
		end
	elseif sync == "SkeramSplit30Soon" then
		splittime = true
		if self.db.profile.split then
			self:TriggerEvent("BigWigs_Message", L["splitsoon_message"], "Urgent")
		end
	elseif sync == "SkeramSplit75Now" then
		splittime = false
		if self.db.profile.split then
			self:TriggerEvent("BigWigs_Message", L["split_message"], "Important", "Alarm")
		end
	elseif sync == "SkeramSplit50Now" then
		splittime = false
		if self.db.profile.split then
			self:TriggerEvent("BigWigs_Message", L["split_message"], "Important", "Alarm")
		end
	elseif sync == "SkeramSplit25Now" then
		splittime = false
		if self.db.profile.split then
			self:TriggerEvent("BigWigs_Message", L["split_message"], "Important", "Alarm")
		end
	elseif sync == "SkeramMC" then
		if self.db.profile.mc then
			if rest == UnitName("player") then
				self:TriggerEvent("BigWigs_StartBar", self, string.format(L["mindcontrol_bar"], UnitName("player")), 20, "Interface\\Icons\\Spell_Shadow_Charm", true, "White")
				self:TriggerEvent("BigWigs_Message", L["mcplayer_message"], "Attention")
			else
				self:TriggerEvent("BigWigs_StartBar", self, string.format(L["mindcontrol_bar"], rest), 20, "Interface\\Icons\\Spell_Shadow_Charm", true, "White")
				self:TriggerEvent("BigWigs_Message", string.format(L["mcplayerother_message"], rest), "Urgent")
			end
		end
	elseif sync == "SkeramMCEnd" then
		if self.db.profile.mc then
			self:TriggerEvent("BigWigs_StopBar", self, string.format(L["mindcontrol_bar"], rest))
		end
	end
end
