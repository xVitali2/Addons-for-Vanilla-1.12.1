------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["High Priest Thekal"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Thekal",

	roguename = "Zealot Zath",
	shamanname = "Zealot Lor\'Khan",
	phaseone_message = "Troll Phase",
	phasetwo_message = "Tiger Phase",
	tigers_trigger = "High Priest Thekal performs Summon Zulian Guardians\.",
	forcepunch_trigger = "High Priest Thekal begins to perform Force Punch\.",
	forcepunch_bar = "Force Punch",
	heal_trigger = "Zealot Lor\'Khan begins to cast Great Heal\.",
	enrage_trigger = "High Priest Thekal gains Enrage\.",
	enrage_message = "Boss is enraged! Spam heals!",
	tigers_message = "Incoming Tigers!",
	heal_message = "Zealot Lor'Khan is Healing! Interrupt it!",
	heal_bar = "Great Heal",
	disarmself_trigger = "You are afflicted by Disarm\.",
	disarmother_trigger = "(.+) is afflicted by Disarm\.",
	mortalcleaveself_trigger = "You are afflicted by Mortal Cleave\.",
	mortalcleaveother_trigger = "(.+) is afflicted by Mortal Cleave\.",
	silenceself_trigger = "You are afflicted by Silence\.",
	silenceother_trigger = "(.+) is afflicted by Silence\.",
	silenceselfend_trigger = "Silence fades from you\.",
	silenceotherend_trigger = "Silence fades from (.+)\.",
	silence_announce = "Silence on %s! Dispel it!",
	mortalcleave_bar = "Mortal Cleave: %s",
	silence_bar = "Silence: %s",
	disarm_bar = "Disarm: %s",
	bloodlustgain = "(.+) gains Bloodlust\.",
	bloodlustend = "Bloodlust fades from (.+)\.",
	bloodlust_bar = "Bloodlust: %s",
	bloodlustannounce = "Dispel Bloodlust from %s\!",
	frenzybegin_trigger = "High Priest Thekal gains Frenzy\.",
	frenzyend_trigger = "Frenzy fades from High Priest Thekal\.",
	frenzyann = "Frenzy! Tranq now!",
	frenzy_bar = "Frenzy",
	death_trigger = "dies\.",
	zath_trigger = "Zealot Zath",
	lorkhan_trigger = "Zealot Lor\'Khan",
	thekal_trigger = "High Priest Thekal",
	thekalrescast_trigger = "High Priest Thekal begins to cast Resurrection.",
	zathrescast_trigger = "Zealot Zath begins to cast Resurrection.",
	lorkhanrescast_trigger = "Zealot Lor'Khan begins to cast Resurrection.",
	
	heal_cmd = "heal",
	heal_name = "Heal alert",
	heal_desc = "Warn for Lor'Khan's heals.",

	bloodlust_cmd = "bloodlust",
	bloodlust_name = "Bloodlust alert",
	bloodlust_desc = "Announces which boss gets Bloodlust, for easy dispel announce.",
	
	silence_cmd = "silence",
	silence_name = "Silence",
	silence_desc = "Shows you who gets silenced.",
	
	disarm_cmd = "disarm",
	disarm_name = "Disarm",
	disarm_desc = "Warn for Zealot Lor'Khan's disarm.",
	
	cleave_cmd = "cleave",
	cleave_name = "Mortal Cleave notifications",
	cleave_desc = "Shows who has Mortal Strike-type debuff.",
	
	punch_cmd = "punch",
	punch_name = "Force Punch alert",
	punch_desc = "JUMP!",
	
	tigers_cmd = "tigers",
	tigers_name = "Tiger spawns",
	tigers_desc = "Warn for incoming tigers.",
	
	frenzy_cmd = "frenzy",
	frenzy_name = "Frenzy announce",
	frenzy_desc = "Warn when High Priest Thekal goes into a frenzy.",
	
	enraged_cmd = "enraged",
	enraged_name = "Enrage alert",
	enraged_desc = "Lets you know when the boss is enraged.",
	
	phase_cmd = "phase",
	phase_name = "Phase notification",
	phase_desc = "Announces the boss' phase transitions.",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Thekal",

	roguename = "Zealot Zath",
	shamanname = "Zealot Lor\'Khan",
	phaseone_message = "Troll Phase",
	phasetwo_message = "Tiger Phase",
	tigers_trigger = "High Priest Thekal f\195\188hrt Zulianische W\195\164chter beschw\195\182ren aus\.",
	forcepunch_trigger = "High Priest Thekal beginnt Machthieb auszuf\195\188hren\.",
	forcepunch_bar = "Machthieb",
	heal_trigger = "Zealot Lor\'Khan beginnt Gro\195\159e Heilung\.",
	enrage_trigger = "High Priest Thekal bekommt \'Wutanfall\'\.",
	enrage_message = "Boss ist W\195\188tend! Verwendet gro\195\159e Heilung!",
	tigers_message = "Tiger kommen!",
	heal_message = "Zealot Lor'Khan heilt! Unterbrecht es!",
	heal_bar = "Gro\195\159e Heilung",
	disarmself_trigger = "Ihr seid von Entwaffnen betroffen\.",
	disarmother_trigger = "(.+) ist von Entwaffnen betroffen\.",
	mortalcleaveself_trigger = "Ihr seid von T\195\182dliches Spalten betroffen\.",
	mortalcleaveother_trigger = "(.+) ist von T\195\182dliches Spalten betroffen\.",
	silenceself_trigger = "Ihr seid von Stille betroffen\.",
	silenceother_trigger = "(.+) ist von Stille betroffen\.",
	silenceselfend_trigger = "\'Stille\' schwindet von Euch\.",
	silenceotherend_trigger = "Stille schwindet von (.+)\.",
	silence_announce = "Stille auf %s! Entfernt es!",
	mortalcleave_bar = "T\195\182dliches Spalten: %s",
	silence_bar = "Stille: %s",
	disarm_bar = "Entwaffnen: %s",
	bloodlustgain = "(.+) bekommt \'Kampfrausch\'\.",
	bloodlustend = "Kampfrausch schwindet von (.+)\.",
	bloodlust_bar = "Kampfrausch: %s",
	bloodlustannounce = "Entfernt Kampfrausch von %s\!",
	frenzybegin_trigger = "High Priest Thekal bekommt \'Raserei\'\.",
	frenzyend_trigger = "Raserei schwindet von High Priest Thekal\.",
	frenzyann = "Raserei! Tranq jetzt!",
	frenzy_bar = "Raserei",
	death_trigger = "dies\.",
	zath_trigger = "Zealot Zath",
	lorkhan_trigger = "Zealot Lor\'Khan",
	thekal_trigger = "High Priest Thekal",
	thekalrescast_trigger = "High Priest Thekal beginnt Auferstehung zu wirken\.",
	zathrescast_trigger = "Zealot Zath beginnt Auferstehung zu wirken\.",
	lorkhanrescast_trigger = "Zealot Lor\'Khan beginnt Auferstehung zu wirken\.",
	
	heal_cmd = "heal",
	heal_name = "Heilungs Warnung",
	heal_desc = "Warnt vor Lor'Khan's Gro\195\159e Heilung.",

	bloodlust_cmd = "bloodlust",
	bloodlust_name = "Kampfrausch",
	bloodlust_desc = "K\195\188ndigt an, wenn der Boss Kampfrausch hat, zum einfachen entfernen.",
	
	silence_cmd = "silence",
	silence_name = "Stille",
	silence_desc = "Zeigt an wer Stille hat.",
	
	disarm_cmd = "disarm",
	disarm_name = "Entwaffnen",
	disarm_desc = "Warnt vor Zealot Lor'Khan's entwaffnen.",
	
	cleave_cmd = "cleave",
	cleave_name = "Benachrichtigung f\195\188r T\195\182dliches Spalten",
	cleave_desc = "Zeigt wer den T\195\182dlichen Schlag Effekt auf sich hat.",
	
	punch_cmd = "punch",
	punch_name = "Machthieb Warnung",
	punch_desc = "SPRING!",
	
	tigers_cmd = "tigers",
	tigers_name = "Tiger spawns",
	tigers_desc = "Warnt vor ankommenden Tigern.",
	
	frenzy_cmd = "frenzy",
	frenzy_name = "Alarm f\195\188r Raserei",
	frenzy_desc = "Warnung, wenn High Priest Thekal in Raserei ger\195\164t.",
	
	enraged_cmd = "enraged",
	enraged_name = "Verk\195\188ndet Boss' Raserei",
	enraged_desc = "L\195\164sst dich wissen, wenn Boss h\195\164rter zuschl\195\164gt.",
	
	phase_cmd = "phase",
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses.",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsThekal = BigWigs:NewModule(boss)
BigWigsThekal.zonename = AceLibrary("Babble-Zone-2.2")["Zul'Gurub"]
BigWigsThekal.enabletrigger = boss
BigWigsThekal.wipemobs = { L["roguename"], L["shamanname"] }
BigWigsThekal.toggleoptions = {"bloodlust", "silence", "cleave", "heal", "disarm", -1, "phase", "punch", "tigers", "frenzy", "enraged", "bosskill"}
BigWigsThekal.revision = tonumber(string.sub("$Revision: 11206 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsThekal:OnEnable()
	started = nil
	zathdead = nil
	lorkhandead = nil
	thekaldead = nil
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Fades")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Fades")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Fades")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "ThekalPhaseOne", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "ThekalPhaseTwo", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "ThekalLorkhanHeal", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "ThekalFrenzyStart", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "ThekalFrenzyStop", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "ThekalBloodlustStart", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "ThekalBloodlustStop", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "ThekalSilenceStart", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "ThekalSilenceStop", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "ThekalMortalCleave", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "ThekalDisarm", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "ThekalEnrage", 5)
end

------------------------------
--      Events              --
------------------------------

function BigWigsThekal:Event(msg)
	local _,_,silenceother_triggerword = string.find(msg, L["silenceother_trigger"])
	local _,_,disarmother_triggerword = string.find(msg, L["disarmother_trigger"])
	local _,_,mortalcleaveother_triggerword = string.find(msg, L["mortalcleaveother_trigger"])
	if msg == L["tigers_trigger"] then
		self:TriggerEvent("BigWigs_Message", L["tigers_message"], "Important")
	elseif msg == L["heal_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "ThekalLorkhanHeal")
	elseif msg == L["silenceself_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "ThekalSilenceStart "..UnitName("player"))
	elseif silenceother_triggerword then
		self:TriggerEvent("BigWigs_SendSync", "ThekalSilenceStart "..silenceother_triggerword)
	elseif msg == L["disarmself_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "ThekalDisarm "..UnitName("player"))
	elseif disarmother_triggerword then
		self:TriggerEvent("BigWigs_SendSync", "ThekalDisarm "..disarmother_triggerword)
	elseif msg == L["mortalcleaveself_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "ThekalMortalCleave "..UnitName("player"))
	elseif mortalcleaveother_triggerword then
		self:TriggerEvent("BigWigs_SendSync", "ThekalMortalCleave "..mortalcleaveother_triggerword)
	elseif msg == L["thekalrescast_trigger"] then
		if zathdead and lorkhandead then
			self:ScheduleEvent(self.CheckZealots, 2, self)
		else
			thekaldead = nil
		end
	elseif msg == L["zathrescast_trigger"] then
		zathdead = nil
	elseif msg == L["lorkhanrescast_trigger"] then
		lorkhandead = nil
	end
end

function BigWigsThekal:CheckZealots()
	if zathdead and lorkhandead then
		self:TriggerEvent("BigWigs_SendSync", "ThekalPhaseTwo")
	else
		thekaldead = nil
	end
end

function BigWigsThekal:CHAT_MSG_MONSTER_EMOTE(msg)
	if string.find(msg, L["death_trigger"]) then
		if arg2 == L["zath_trigger"] then
			zathdead = true
			if self.db.profile.bloodlust then
				self:TriggerEvent("BigWigs_StopBar", string.format(L["bloodlust_bar"], L["zath_trigger"]))
			end
		elseif arg2 == L["lorkhan_trigger"] then
			lorkhandead = true
			if self.db.profile.heal then
				self:TriggerEvent("BigWigs_StopBar", L["heal_bar"])
			end
			if self.db.profile.bloodlust then
				self:TriggerEvent("BigWigs_StopBar", string.format(L["bloodlust_bar"], L["lorkhan_trigger"]))
			end
		elseif arg2 == L["thekal_trigger"] then
			thekaldead = true
		end
	end
end

function BigWigsThekal:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["forcepunch_trigger"] then
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["forcepunch_bar"], rest), 1, "Interface\\Icons\\INV_Gauntlets_31")
	end
end

function BigWigsThekal:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	local _,_,bloodlustgainword = string.find(msg, L["bloodlustgain"])
	if msg == L["frenzybegin_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "ThekalFrenzyStart")
	elseif msg == L["enrage_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "ThekalEnrage")
	elseif bloodlustgainword then
		self:TriggerEvent("BigWigs_SendSync", "ThekalBloodlustStart "..bloodlustgainword)
	end
end

function BigWigsThekal:Fades(msg)
	local _,_,silenceotherend_triggerword = string.find(msg, L["silenceotherend_trigger"])
	local _,_,bloodlustendword = string.find(msg, L["bloodlustend"])
	if bloodlustendword then
		self:TriggerEvent("BigWigs_SendSync", "ThekalBloodlustStop "..bloodlustendword)
	elseif msg == L["silenceselfend_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "ThekalSilenceStop "..UnitName("player"))
	elseif silenceotherend_triggerword then
		self:TriggerEvent("BigWigs_SendSync", "ThekalSilenceStop "..silenceotherend_triggerword)
	elseif msg == L["frenzyend_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "ThekalFrenzyStop")
	end
end

function BigWigsThekal:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BossEngaged" and rest == "High Priest Thekal" and not started then
		self:TriggerEvent("BigWigs_SendSync", "ThekalPhaseOne")
	elseif sync == "ThekalPhaseOne" then
		started = true
		if self.db.profile.phase then
			self:TriggerEvent("BigWigs_Message", L["phaseone_message"], "Attention")
		end
	elseif sync == "ThekalPhaseTwo" then
		if self.db.profile.heal then
			self:TriggerEvent("BigWigs_StopBar", L["heal_bar"])
		end
		if self.db.profile.bloodlust then
			self:TriggerEvent("BigWigs_StopBar", string.format(L["bloodlust_bar"], rest))
		end
		if self.db.profile.phase then
			self:TriggerEvent("BigWigs_Message", L["phasetwo_message"], "Attention")
		end
	elseif sync == "ThekalLorkhanHeal" and self.db.profile.heal then
		self:TriggerEvent("BigWigs_Message", L["heal_message"], "Attention", "Alarm")
		self:TriggerEvent("BigWigs_StartBar", self, L["heal_bar"], 4, "Interface\\Icons\\Spell_Holy_Heal", true, "Black")
	elseif sync == "ThekalFrenzyStart" and self.db.profile.frenzy then
		self:TriggerEvent("BigWigs_Message", L["frenzyann"], "Important", true, "Alarm")
		self:TriggerEvent("BigWigs_StartBar", self, L["frenzy_bar"], 8, "Interface\\Icons\\Ability_Druid_ChallangingRoar", true, "Black")
	elseif sync == "ThekalFrenzyStop" and self.db.profile.frenzy then
        self:TriggerEvent("BigWigs_StopBar", self, L["frenzy_bar"])
	elseif sync == "ThekalBloodlustStart" and self.db.profile.bloodlust then
		self:TriggerEvent("BigWigs_Message", string.format(L["bloodlustannounce"], rest), "Important")
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["bloodlust_bar"], rest), 30, "Interface\\Icons\\Spell_Nature_BloodLust")
	elseif sync == "ThekalBloodlustStop" and self.db.profile.bloodlust then
		self:TriggerEvent("BigWigs_StopBar", self, string.format(L["bloodlust_bar"], rest))
	elseif sync == "ThekalSilenceStart" and self.db.profile.silence then
		self:TriggerEvent("BigWigs_Message", string.format(L["silence_announce"], rest), "Attention")
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["silence_bar"], rest), 6, "Interface\\Icons\\Spell_Holy_Silence", true, "White")
	elseif sync == "ThekalSilenceStop" and self.db.profile.silence then
		self:TriggerEvent("BigWigs_StopBar", self, string.format(L["silence_bar"], rest))
	elseif sync == "ThekalMortalCleave" and self.db.profile.cleave then
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["mortalcleave_bar"], rest), 5, "Interface\\Icons\\Ability_Warrior_SavageBlow")
	elseif sync == "ThekalDisarm" and self.db.profile.disarm then
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["disarm_bar"], rest), 5, "Interface\\Icons\\Ability_Warrior_Disarm", true, "Yellow")
	elseif sync == "ThekalEnrage" and self.db.profile.enraged then
		self:TriggerEvent("BigWigs_Message", L["enrage_message"], "Urgent")
	end
end
