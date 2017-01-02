------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Renataki"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Renataki",

	enrage_trigger = "Renataki gains Enrage\.",
	enragesoon_message = "Enrage soon! Get ready!",
	enrage_message = "Enraged!",
	vanishsoon_message = "Vanish soon!",
	vanish_message = "Boss has vanished!",
	unvanish_message = "Boss is revealed!",
	vanish_bar = "Vanish",

	vanish_cmd = "vanish",
	vanish_name = "Vanish announce",
	vanish_desc = "Shows warnings for boss' Vanish.",
	
	enraged_cmd = "enraged",
	enraged_name = "Announce boss Enrage",
	enraged_desc = "Lets you know when boss hits harder.",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Renataki",

	enrage_trigger = "Renataki bekommt \'Wutanfall\'\.",
	enragesoon_message = "Raserei bald! Mach dich bereit!",
	enrage_message = "Boss ist in Raserei!",
	vanishsoon_message = "Verschwinden bald!",
	vanish_message = "Boss ist verschwunden!",
	unvanish_message = "Boss wird aufgedeckt!",
	vanish_bar = "Verschwinden",

	vanish_cmd = "vanish",
	vanish_name = "Verschwinden anzeigen",
	vanish_desc = "Verk\195\188ndet Boss' Verschwinden.",
	
	enraged_cmd = "enraged",
	enraged_name = "Verk\195\188ndet Boss' Raserei",
	enraged_desc = "L\195\164sst dich wissen, wenn Boss h\195\164rter zuschl\195\164gt.",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsRenataki = BigWigs:NewModule(boss)
BigWigsRenataki.zonename = AceLibrary("Babble-Zone-2.2")["Zul'Gurub"]
BigWigsRenataki.enabletrigger = boss
BigWigsRenataki.toggleoptions = {"vanish", "enraged", "bosskill"}
BigWigsRenataki.revision = tonumber(string.sub("$Revision: 11203 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsRenataki:OnEnable()
	enrageannounced = nil
	started = nil
	vanished = nil
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("UNIT_HEALTH")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "RenatakiUnvanish", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "RenatakiEnrage", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "RenatakiEnrageSoon", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "RenatakiStarted", 10)
end

------------------------------
--      Events              --
------------------------------

function BigWigsRenataki:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg == L["enrage_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "RenatakiEnrage")
	end
end

function BigWigsRenataki:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BossEngaged" and rest == "Renataki" and not started then
		self:TriggerEvent("BigWigs_SendSync", "RenatakiStarted")
	elseif sync == "RenatakiStarted" then
		started = true
		if self.db.profile.vanish then
			self:ScheduleEvent("BigWigs_Message", 22, L["vanishsoon_message"], "Urgent")
		end
		self:ScheduleRepeatingEvent("renatakivanishcheck", self.VanishCheck, 2, self)
	elseif sync == "RenatakiEnrageSoon" and self.db.profile.enraged then
		self:TriggerEvent("BigWigs_Message", L["enragesoon_message"], "Urgent")
	elseif sync == "RenatakiEnrage" and self.db.profile.enraged then
		self:TriggerEvent("BigWigs_Message", L["enrage_message"], "Attention")
	elseif sync == "RenatakiUnvanish" then
		vanished = nil
		if self.db.profile.vanish then
			self:TriggerEvent("BigWigs_StopBar", self, L["vanish_bar"])
			self:TriggerEvent("BigWigs_Message", L["unvanish_message"], "Attention")
			self:ScheduleEvent("BigWigs_Message", 22, L["vanishsoon_message"], "Urgent")
		end
		self:ScheduleRepeatingEvent("renatakivanishcheck", self.VanishCheck, 2, self)
	end
end

function BigWigsRenataki:UNIT_HEALTH(arg1)
	if UnitName(arg1) == boss then
		local health = UnitHealth(arg1)
		if health > 98072 and health <= 114417 and not enrageannounced then
			self:TriggerEvent("BigWigs_SendSync", "RenatakiEnrageSoon")
			enrageannounced = true
		elseif health > 114417 and enrageannounced then
			enrageannounced = nil
		end
	end
end

function BigWigsRenataki:IsVanished()
	vanished = true
	self:CancelScheduledEvent("renatakivanishcheck")
	if self.db.profile.vanish then
		self:TriggerEvent("BigWigs_Message", L["vanish_message"], "Attention")
		self:TriggerEvent("BigWigs_StartBar", self, L["vanish_bar"], 30, "Interface\\Icons\\Ability_Stealth")
	end
	self:ScheduleRepeatingEvent("renatakiunvanishcheck", self.UnvanishCheck, 2, self)
	self:ScheduleEvent("renatakiunvanish", self.Unvanish, 30, self)
end

function BigWigsRenataki:UnvanishCheck()
	if UnitExists("target") and UnitName("target") == "Renataki" and UnitExists("targettarget") then
		if vanished then
			vanished = nil
			self:Unvanish()
			return
		end
	end
	local num = GetNumRaidMembers()
	for i = 1, num do
		local raidUnit = string.format("raid%starget", i)
		if UnitExists(raidUnit) and UnitName(raidUnit) == "Renataki" and UnitExists(raidUnit.."target") then
			if vanished then
				vanished = nil
				self:Unvanish()
				return
			end
		end
	end
end

function BigWigsRenataki:VanishCheck()
	local num = GetNumRaidMembers()
	for i = 1, num do
		local raidUnit = string.format("raid%starget", i)
		if UnitExists(raidUnit) and UnitClassification(raidUnit) == "worldboss" and UnitName(raidUnit) == "Renataki" and UnitExists(raidUnit.."target") then
			if vanished then
				vanished = nil
			end
			return
		end
	end
	self:IsVanished()
end

function BigWigsRenataki:Unvanish()
	self:CancelScheduledEvent("renatakiunvanishcheck")
	self:CancelScheduledEvent("renatakiunvanish")
	self:TriggerEvent("BigWigs_SendSync", "RenatakiUnvanish")
end
