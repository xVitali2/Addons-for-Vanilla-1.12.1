------------------------------
--      Are you local?      --
------------------------------

local kri = AceLibrary("Babble-Boss-2.2")["Lord Kri"]
local yauj = AceLibrary("Babble-Boss-2.2")["Princess Yauj"]
local vem = AceLibrary("Babble-Boss-2.2")["Vem"]
local boss = AceLibrary("Babble-Boss-2.2")["The Bug Family"]

local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "BugFamily",
	
	healtrigger = "Princess Yauj begins to cast Great Heal\.",
	healbar = "Great Heal",
	healwarn = "Casting heal!",
	attack_trigger1 = "Princess Yauj attacks",
	attack_trigger2 = "Princess Yauj misses",
	attack_trigger3 = "Princess Yauj hits",
	attack_trigger4 = "Princess Yauj crits",
	panic_bar = "Panic",
	panic_message = "Fear in 3 Seconds!",
	toxicvolleyhit_trigger = "Toxic Volley hits",
	toxicvolleyafflicted_trigger = "afflicted by Toxic Volley\.",
	toxicvolleyresist_trigger = "Toxic Volley was resisted",
	toxicvolleyimmune_trigger = "Toxic Volley fail(.+) immune",
	toxicvolley_bar = "Toxic Volley",
	toxicvolley_message = "Toxic Volley in 3 Seconds!",
	panic_trigger = "afflicted by Panic\.",
	panicresist_trigger = "Princess Yauj 's Panic was resisted",
	panicimmune_trigger = "Princess Yauj 's Panic fail(.+) immune",
	toxicvaporsyou_trigger = "You are afflicted by Toxic Vapors\.",
	toxicvaporsother_trigger = "(.+) is afflicted by Toxic Vapors\.",
	toxicvapors_message = "Move away from the Poison Cloud!",
	enrage_bar = "Enrage",
	warn5minutes = "Enrage in 5 minutes!",
	warn3minutes = "Enrage in 3 minutes!",
	warn90seconds = "Enrage in 90 seconds!",
	warn60seconds = "Enrage in 60 seconds!",
	warn30seconds = "Enrage in 30 seconds!",
	warn10seconds = "Enrage in 10 seconds!",
	kridead_message = "Lord Kri is dead! Poison Cloud spawned!",
	yaujdead_message = "Princess Yauj is dead! Kill the spawns!",
	vemdead_message = "Vem is dead!",
	vemdeadcontkri_message = "Vem is dead! Lord Kri is enraged!",
	vemdeadcontyauj_message = "Vem is dead! Princess Yauj is enraged!",
	vemdeadcontboth_message = "Vem is dead! Lord Kri & Princess Yauj are enraged!",
	enrage_trigger = "%s goes into a berserker rage!",
	enrage_warning = "Enraged!",
	
	panic_cmd = "panic",
	panic_name = "Fear",
	panic_desc = "Warn for Princess Yauj's Panic.",

	toxicvolley_cmd = "toxicvolley",
	toxicvolley_name = "Toxic Volley",
	toxicvolley_desc = "Warn for Lord Kri's Toxic Volley.",

	heal_cmd = "heal",
	heal_name = "Great Heal",
	heal_desc = "Announce Princess Yauj's heals.",

	announce_cmd = "announce",
	announce_name = "Poison Cloud",
	announce_desc = "Whispers players that stand in the Poison Cloud.\n\n(Requires assistant or higher)",
	
	deathspecials_cmd = "deathspecials",
	deathspecials_name = "Death Specials",
	deathspecials_desc = "Lets people know which boss has been killed and what special abilities they do.",
	
	enrage_cmd = "enrage",
	enrage_name = "Enrage",
	enrage_desc = "Enrage timers.",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "BugFamily",
	
	healtrigger = "Princess Yauj beginnt Gro\195\159e Heilung zu wirken\.",
	healbar = "Gro\195\159e Heilung",
	healwarn = "Wirkt Heilung!",
	attack_trigger1 = "Princess Yauj greift an",
	attack_trigger2 = "Princess Yauj verfehlt",
	attack_trigger3 = "Princess Yauj trifft",
	attack_trigger4 = "Princess Yauj trifft (.+) kritisch",
	panic_bar = "Panik",
	panic_message = "Furcht in 3 Sekunden!",
	toxicvolleyhit_trigger = "Toxische Salve trifft",
	toxicvolleyafflicted_trigger = "von Toxische Salve betroffen",
	toxicvolleyresist_trigger = "Toxische Salve(.+) widerstanden",
	toxicvolleyimmune_trigger = "Toxische Salve fail(.+) immun",
	toxicvolley_bar = "Toxische Salve",
	toxicvolley_message = "Toxische Salve in 3 Sekunden!",
	panic_trigger = "von Panik betroffen",
	panicresist_trigger = "Panik(.+) widerstanden",
	panicimmune_trigger = "Panik(.+) immun",
	toxicvaporsyou_trigger = "Ihr seid von Toxische D\195\164mpfe betroffen\.",
	toxicvaporsother_trigger = "(.+) ist von Toxische D\195\164mpfe betroffen\.",
	toxicvapors_message = "Beweg dich aus der Giftwolke raus!",
	enrage_bar = "Raserei",
	warn5minutes = "Raserei in 5 Minuten!",
	warn3minutes = "Raserei in 3 Minuten!",
	warn90seconds = "Raserei in 90 Sekunden!",
	warn60seconds = "Raserei in 60 Sekunden!",
	warn30seconds = "Raserei in 30 Sekunden!",
	warn10seconds = "Raserei in 10 Sekunden!",
	kridead_message = "Lord Kri ist tot! Giftwolke hat sich gebildet!",
	yaujdead_message = "Princess Yauj ist tot! T\195\182te die kleinen K\195\164fer!",
	vemdead_message = "Vem ist tot!",
	vemdeadcontkri_message = "Vem ist tot! Lord Kri verf\195\164llt in Raserei!",
	vemdeadcontyauj_message = "Vem ist tot! Princess Yauj verf\195\164llt in Raserei!",
	vemdeadcontboth_message = "Vem ist tot! Lord Kri & Princess Yauj verfallen in Raserei!",
	enrage_trigger = "%s goes into a berserker rage!",
	enrage_warning = "Raserei!",
	
	panic_cmd = "panic",
	panic_name = "Furcht",
	panic_desc = "Warnung f\195\188r Princess Yaujs Panik.",

	toxicvolley_cmd = "toxicvolley",
	toxicvolley_name = "Toxische Salve",
	toxicvolley_desc = "Warnung f\195\188r Lord Kris Toxische Salve.",

	heal_cmd = "heal",
	heal_name = "Gro\195\159e Heilung",
	heal_desc = "Verk\195\188ndet Princess Yaujs Heilungen.",

	announce_cmd = "announce",
	announce_name = "Giftwolke",
	announce_desc = "Fl\195\188stert Spielern, dass sie in der Giftwolke stehen.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
	
	deathspecials_cmd = "deathspecials",
	deathspecials_name = "Spezielle Todeseffekte",
	deathspecials_desc = "Informiert Spieler, welcher Boss bereits get\195\182tet wurde und welche Spezialf\195\164higkeiten sie haben.",
	
	enrage_cmd = "enrage",
	enrage_name = "Raserei",
	enrage_desc = "Zeit, bis der Boss in Raserei verf\195\164llt.",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsBugFamily = BigWigs:NewModule(boss)
BigWigsBugFamily.zonename = AceLibrary("Babble-Zone-2.2")["Ahn'Qiraj"]
BigWigsBugFamily.enabletrigger = {kri, yauj, vem}
BigWigsBugFamily.toggleoptions = {"panic", "toxicvolley", "heal", "announce", "deathspecials", "enrage", "bosskill"}
BigWigsBugFamily.revision = tonumber(string.sub("$Revision: 11208 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsBugFamily:OnEnable()
	kridead = nil
	vemdead = nil
	yaujdead = nil
	healtime = 0
	castingheal = false
	started = false
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Spells")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "BugTrioKriVolley", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "BugTrioYaujHealStart", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "BugTrioYaujHealStop", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "BugTrioYaujPanic", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "BugTrioEnraged", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "BugTrioKriDead", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "BugTrioYaujDead", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "BugTrioVemDead", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "BugTrioAllDead", 5)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsBugFamily:Spells(msg)
	local _,_,toxicvaporsother,_ = string.find(msg, L["toxicvaporsother_trigger"])
	if string.find(msg, L["panic_trigger"]) or string.find(msg, L["panicresist_trigger"]) or string.find(msg, L["panicimmune_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "BugTrioYaujPanic")
	elseif string.find(msg, L["toxicvolleyhit_trigger"]) or string.find(msg, L["toxicvolleyafflicted_trigger"]) or string.find(msg, L["toxicvolleyresist_trigger"]) or string.find(msg, L["toxicvolleyimmune_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "BugTrioKriVolley")
	elseif msg == L["toxicvaporsyou_trigger"] and self.db.profile.announce then		
		self:TriggerEvent("BigWigs_Message", L["toxicvapors_message"], "Attention", "Alarm")
	elseif toxicvaporsother and self.db.profile.announce then		
		self:TriggerEvent("BigWigs_SendTell", toxicvaporsother, L["toxicvapors_message"])
	end
end

function BigWigsBugFamily:Melee(msg)
	if string.find(msg, L["attack_trigger1"]) or string.find(msg, L["attack_trigger2"]) or string.find(msg, L["attack_trigger3"]) or string.find(msg, L["attack_trigger4"]) then
		if castingheal then 
			if (GetTime() - healtime) < 2 then
				self:TriggerEvent("BigWigs_SendSync", "BugTrioYaujHealStop")
			elseif (GetTime() - healtime) >= 2 then
				castingheal = false
			end
		end
	end
end

function BigWigsBugFamily:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, kri) then
		self:TriggerEvent("BigWigs_SendSync", "BugTrioKriDead")
	elseif msg == string.format(UNITDIESOTHER, yauj) then
		self:TriggerEvent("BigWigs_SendSync", "BugTrioYaujDead")
	elseif msg == string.format(UNITDIESOTHER, vem) then
		self:TriggerEvent("BigWigs_SendSync", "BugTrioVemDead")
	end
end

function BigWigsBugFamily:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if msg == L["healtrigger"] then
		self:TriggerEvent("BigWigs_SendSync", "BugTrioYaujHealStart")
	end
end

function BigWigsBugFamily:CHAT_MSG_MONSTER_EMOTE(msg)
	if msg == L["enrage_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "BugTrioEnraged")
	end
end

function BigWigsBugFamily:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BossEngaged" and rest == "The Bug Family" then
		if not started then
			if self.db.profile.panic then
				self:TriggerEvent("BigWigs_StartBar", self, L["panic_bar"], 18.4, "Interface\\Icons\\Spell_Shadow_DeathScream", true, "white")
				self:ScheduleEvent("PanicAnnounce", "BigWigs_Message", 15.4, L["panic_message"], "Urgent", true, "Alarm")
			end
			if self.db.profile.toxicvolley then
				self:TriggerEvent("BigWigs_StartBar", self, L["toxicvolley_bar"], 11.4, "Interface\\Icons\\Spell_Nature_Corrosivebreath", true, "green")
				self:ScheduleEvent("ToxicVolleyAnnounce", "BigWigs_Message", 8.4, L["toxicvolley_message"], "Urgent")
			end
			if self.db.profile.enrage then
				self:TriggerEvent("BigWigs_StartBar", self, L["enrage_bar"], 900, "Interface\\Icons\\Spell_Shadow_UnholyFrenzy", true, "red")
				self:ScheduleEvent("BigWigs_Message", 600, L["warn5minutes"], "Attention")
				self:ScheduleEvent("BigWigs_Message", 720, L["warn3minutes"], "Attention")
				self:ScheduleEvent("BigWigs_Message", 810, L["warn90seconds"], "Attention")
				self:ScheduleEvent("BigWigs_Message", 840, L["warn60seconds"], "Attention")
				self:ScheduleEvent("BigWigs_Message", 870, L["warn30seconds"], "Attention")
				self:ScheduleEvent("BigWigs_Message", 890, L["warn10seconds"], "Attention")
			end
		end
		started = true
	elseif sync == "BugTrioKriVolley" and self.db.profile.toxicvolley then
		self:TriggerEvent("BigWigs_StartBar", self, L["toxicvolley_bar"], 10, "Interface\\Icons\\Spell_Nature_Corrosivebreath", true, "green")
		self:ScheduleEvent("ToxicVolleyAnnounce", "BigWigs_Message", 7, L["toxicvolley_message"], "Urgent")
	elseif sync == "BugTrioYaujHealStart" then
		healtime = GetTime()
		castingheal = true
		if self.db.profile.heal then
			self:TriggerEvent("BigWigs_StartBar", self, L["healbar"], 2, "Interface\\Icons\\Spell_Holy_Heal", true, "yellow")
			self:TriggerEvent("BigWigs_Message", L["healwarn"], "Attention", true, "Alert")
		end
	elseif sync == "BugTrioYaujHealStop" then
		castingheal = false
		if self.db.profile.heal then
			self:TriggerEvent("BigWigs_StopBar", self, L["healbar"])
		end
	elseif sync == "BugTrioYaujPanic" and self.db.profile.panic then
		self:TriggerEvent("BigWigs_StartBar", self, L["panic_bar"], 20, "Interface\\Icons\\Spell_Shadow_DeathScream", true, "white")
		self:ScheduleEvent("BigWigs_Message", 17, L["panic_message"], "Urgent", true, "Alarm")
	elseif sync == "BugTrioEnraged" then
		if self.db.profile.enrage then
			self:TriggerEvent("BigWigs_Message", L["enrage_warning"], "Important")
		end
	elseif sync == "BugTrioKriDead" then
		kridead = true
		if self.db.profile.toxicvolley then
			self:TriggerEvent("BigWigs_StopBar", self, L["toxicvolley_bar"])
			self:CancelScheduledEvent("ToxicVolleyAnnounce")
		end
		if self.db.profile.deathspecials then
			self:TriggerEvent("BigWigs_Message", L["kridead_message"], "Positive")
		end
		if vemdead and yaujdead then
			self:TriggerEvent("BigWigs_SendSync", "BugTrioAllDead")
		end
	elseif sync == "BugTrioYaujDead" then
		yaujdead = true
		if self.db.profile.heal then
			self:TriggerEvent("BigWigs_StopBar", self, L["healbar"])
		end
		if self.db.profile.panic then
			self:TriggerEvent("BigWigs_StopBar", self, L["panic_bar"])
			self:CancelScheduledEvent("PanicAnnounce")
		end
		if self.db.profile.deathspecials then
			self:TriggerEvent("BigWigs_Message", L["yaujdead_message"], "Positive")
		end
		if vemdead and kridead then
			self:TriggerEvent("BigWigs_SendSync", "BugTrioAllDead")
		end
	elseif sync == "BugTrioVemDead" then
		vemdead = true
		if yaujdead and kridead then
			if self.db.profile.deathspecials then
				self:TriggerEvent("BigWigs_Message", L["vemdead_message"], "Positive")
			end
			self:TriggerEvent("BigWigs_SendSync", "BugTrioAllDead")
		elseif yaujdead then
			if self.db.profile.deathspecials then
				self:TriggerEvent("BigWigs_Message", L["vemdeadcontkri_message"], "Positive")
			end
		elseif kridead then
			if self.db.profile.deathspecials then
				self:TriggerEvent("BigWigs_Message", L["vemdeadcontyauj_message"], "Positive")
			end
		elseif not kridead and not yaujdead then
			if self.db.profile.deathspecials then
				self:TriggerEvent("BigWigs_Message", L["vemdeadcontboth_message"], "Positive")
			end
		end
	elseif sync == "BugTrioAllDead" then
		if self.db.profile.bosskill then
			self:TriggerEvent("BigWigs_Message", string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], boss), "Bosskill", nil, "Victory")
		end
		self:TriggerEvent("BigWigs_RemoveRaidIcon")
		self.core:ToggleModuleActive(self, false)
	end
end
