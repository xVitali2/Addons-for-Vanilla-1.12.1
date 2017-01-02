------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["High Priestess Jeklik"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	swarmbat_name = "Bloodseeker Bat",
	bombbat_name = "Frenzied Bloodseeker Bat",
	swarm_trigger = "Bloodseeker Bat gains Hover\.",
	bomb_trigger = "Frenzied Bloodseeker Bat gains Hover\.",
	fearrep_trigger1 = "afflicted by Terrifying Screech",
	fearrep_trigger2 = "s Terrifying Screech was resisted",
	fearrep_trigger3 = "Terrifying Screech fail(.+) immune",
	fearrep_trigger4 = "afflicted by Psychic Scream",
	fearrep_trigger5 = "s Psychic Scream was resisted",
	fearrep_trigger6 = "Psychic Scream fail(.+) immune",
	attack_trigger1 = "High Priestess Jeklik attacks",
	attack_trigger2 = "High Priestess Jeklik misses",
	attack_trigger3 = "High Priestess Jeklik hits",
	attack_trigger4 = "High Priestess Jeklik crits",
	liquidfire_trigger = "Liquid Fire",
	liquidfirehitsyou_trigger = "Liquid Fire 's Blaze hits you for",
	liquidfirehitsother_trigger = "Liquid Fire 's Blaze hits (.+) for",
	liquidfireabsorbyou_trigger = "You absorb Liquid Fire 's Blaze\.",
	liquidfireabsorb_trigger = "Liquid Fire 's Blaze is absorbed by (.+)\.",
	liquidfireresistyou_trigger = "Liquid Fire 's Blaze was resisted\.",
	liquidfireresist_trigger = "Liquid Fire 's Blaze was resisted by (.+)\.",
	liquidfireimmuneyou_trigger = "Liquid Fire 's Blaze failed. You are immune\.",
	liquidfireimmune_trigger = "Liquid Fire 's Blaze fails. (.+) is immune\.",
	mindflayyou_trigger = "You are afflicted by Mind Flay\.",
	mindflayother_trigger = "(.+) is afflicted by Mind Flay\.",
	mindflayendyou_trigger = "Mind Flay fades from you\.",
	mindflayend_trigger = "Mind Flay fades from (.+)\.",
	phasetwo_trigger = "Hover fades from High Priestess Jeklik\.",
	heal_trigger = "High Priestess Jeklik begins to cast Great Heal\.",
	swarm_message = "Incoming bat swarm! Kill them!",
	bomb_message = "A bomb bat joins the fight! Watch where you stand!",
	fearinitext = "Fear",
	fearreptext = "Possible Fear",
	mindflaybar = "Mind Flay",
	greathealbar = "Heal",
	greathealtext = "Heal! Interrupt it!",
	phaseone_message = "Bat Phase",
	phasetwo_message = "Troll Phase",
	firewarn = "Move away from fire!",
	firewarnyou = "Move away from fire!",
	you = "you",
	HighPriestessJeklik = "High Priestess Jeklik",

	cmd = "Jeklik",

	phase_cmd = "phase",
	phase_name = "Phase Notification",
	phase_desc = "Announces the boss' phase transition",

	heal_cmd = "heal",
	heal_name = "Heal Alert",
	heal_desc = "Warn for healing",

	flay_cmd = "flay",
	flay_name = "Mind Flay Alert",
	flay_desc = "Warn for casting Mind Flay",

	fear_cmd = "fear",
	fear_name = "Fear Alert",
	fear_desc = "Warn for boss' fear\n\n(Disclaimer: timers vary a lot, usually fear will happen within 10s after the fear bar ends)",

	bomb_cmd = "bomb",
	bomb_name = "Bomb Bat Alert",
	bomb_desc = "Warn for Bomb Bats",

	swarm_cmd = "swarm",
	swarm_name = "Bat Swarm Alert",
	swarm_desc = "Warn for Bat swarms",

	announce_cmd = "whispers",
	announce_name = "Whisper to burning people",
	announce_desc = "Sends a whisper to players that stand in fire\n\n(Requires assistant or higher)\n\n(Disclaimer: to avoid spamming whispers, it will only whisper people that take damage from fire that is on the ground - aka not the Bat's throw itself)",
} end )

L:RegisterTranslations("deDE", function() return {
	swarmbat_name = "Bloodseeker Bat",
	bombbat_name = "Frenzied Bloodseeker Bat",
	swarm_trigger = "Bloodseeker Bat bekommt \'Schweben\'\.",
	bomb_trigger = "Frenzied Bloodseeker Bat bekommt \'Schweben\'\.",
	fearrep_trigger1 = "von Schreckliches Kreischen betroffen",
	fearrep_trigger2 = "Schreckliches Kreischen(.+) widerstanden",
	fearrep_trigger3 = "Schreckliches Kreischen(.+) immun",
	fearrep_trigger4 = "von Psychischer Schrei betroffen",
	fearrep_trigger5 = "Psychischer Schrei(.+) widerstanden",
	fearrep_trigger6 = "Psychischer Schrei(.+) immun",
	attack_trigger1 = "High Priestess Jeklik greift an",
	attack_trigger2 = "High Priestess Jeklik verfehlt",
	attack_trigger3 = "High Priestess Jeklik trifft",
	attack_trigger4 = "High Priestess Jeklik trifft (.+) kritisch",
	liquidfire_trigger = "Liquid Fire",
	liquidfirehitsyou_trigger = "Liquid Fire trifft Euch mit \'Feuermeer'",
	liquidfirehitsother_trigger = "Liquid Fires Feuermeer trifft (.+) f",
	liquidfireabsorbyou_trigger = "Ihr absorbiert Liquid Fires Feuermeer",
	liquidfireabsorb_trigger = "Feuermeer von Liquid Fire wird absorbiert von\: (.+)\.",
	liquidfireresistyou_trigger = "Liquid Fire versucht es mit Feuermeer\.\.\. widerstanden\.",
	liquidfireresist_trigger = "Liquid Fires Feuermeer wurde von (.+) widerstanden\.",
	liquidfireimmuneyou_trigger = "Liquid Fire versucht es mit Feuermeer\.\.\. ein Fehlschlag. Ihr seid immun\.",
	liquidfireimmune_trigger = "Liquid Fire versucht es mit Feuermeer. Ein Fehlschlag, denn (.+) ist immun\.",
	mindflayyou_trigger = "Ihr seid von Gedankenschinden betroffen.",
	mindflayother_trigger = "(.+) ist von Gedankenschinden betroffen.",
	mindflayendyou_trigger = "\'Gedankenschinden\' schwindet von Euch\.",
	mindflayend_trigger = "Gedankenschinden schwindet von (.+)\.",
	phasetwo_trigger = "Schweben schwindet von High Priestess Jeklik\.",
	heal_trigger = "High Priestess Jeklik beginnt Gro\195\159e Heilung zu wirken\.",
	swarm_message = "Fledermausschwarm jetzt! T\195\182te sie!",
	bomb_message = "Eine Bomber-Fledermaus erscheint zum Kampf! Pass auf, wo du stehst!",
	fearinitext = "Furcht",
	fearreptext = "M\195\182gliche Furcht",
	mindflaybar = "Gedankenschinden",
	greathealbar = "Heilung",
	greathealtext = "Heilung! Unterbreche sie!",
	phaseone_message = "Fledermaus-Phase",
	phasetwo_message = "Troll-Phase",
	firewarn = "Move from fire!",
	firewarnyou = "Beweg\' dich aus dem Feuer!",
	you = "Euch",
	HighPriestessJeklik = "High Priestess Jeklik",

	cmd = "Jeklik",

	phase_cmd = "phase",
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses",

	heal_cmd = "heal",
	heal_name = "Alarm f\195\188r Heilung",
	heal_desc = "Warnen, wenn Jeklik versucht sich zu heilen",

	flay_cmd = "flay",
	flay_name = "Alarm f\195\188r Gedankenschindent",
	flay_desc = "Warnen, wenn Gedankenschinden gewirkt wird",

	fear_cmd = "fear",
	fear_name = "Alarm f\195\188r Furcht",
	fear_desc = "Warnen, wenn Boss Furcht wirkt.\n\n(Dementi: Timers variieren sehr, normalerweise wird Furcht innerhalb 10 Sekunden passieren, nachdem der Furcht-Balken endet)",

	bomb_cmd = "bomb",
	bomb_name = "Alarm f\195\188r Bomber-Flederm\195\164use",
	bomb_desc = "Warnen vor Bomber-Flederm\195\164use.",

	swarm_cmd = "swarm",
	swarm_name = "Alarm f\195\188r Fledermausschw\195\164rme",
	swarm_desc = "Warnen vor Fledermausschw\195\164rme.",

	announce_cmd = "whispers",
	announce_name = "Brennenden Personen fl\195\188stern",
	announce_desc = "Fl\195\188ster der Person, die im Feuer steht\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)\n\n(Dementi: to avoid spamming whispers, it will only whisper people that take damage from fire that is on the ground - aka not the Bat's throw itself)",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsJeklik = BigWigs:NewModule(boss)
BigWigsJeklik.zonename = AceLibrary("Babble-Zone-2.2")["Zul'Gurub"]
BigWigsJeklik.enabletrigger = boss
BigWigsJeklik.toggleoptions = {"phase", "heal", "flay", "fear", "swarm", "bomb", "announce", "bosskill"}
BigWigsJeklik.revision = tonumber(string.sub("$Revision: 11212 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsJeklik:OnEnable()
	firstfear = 0
	phase = 0
	healtimer = 0
	castingheal = 0
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "JeklikFearIni", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "JeklikFearRep", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "JeklikFearTwoRep", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "JeklikPhaseOne", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "JeklikPhaseTwo", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "JeklikMindFlay", 1.5)
	self:TriggerEvent("BigWigs_ThrottleSync", "JeklikMindFlayEnd", 1.5)
	self:TriggerEvent("BigWigs_ThrottleSync", "JeklikHeal", 4)
	self:TriggerEvent("BigWigs_ThrottleSync", "JeklikHealStop", 4)
	self:TriggerEvent("BigWigs_ThrottleSync", "JeklikBombBats", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "JeklikSwarmBats", 5)
end

------------------------------
--      Events              -- 
------------------------------

function BigWigsJeklik:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BossEngaged" and rest == "High Priestess Jeklik" then
		if firstfear == 0 then
			self:TriggerEvent("BigWigs_SendSync", "JeklikFearIni")
		end
		if phase == 0 then
			self:TriggerEvent("BigWigs_SendSync", "JeklikPhaseOne")
		end
	elseif sync == "JeklikFearIni" then
		firstfear = 1
		if self.db.profile.fear then
			self:TriggerEvent("BigWigs_StartBar", self, L["fearinitext"], 13, "Interface\\Icons\\Spell_Shadow_SummonImp")
		end
	elseif sync == "JeklikPhaseOne" then 
		phase = 1
		if self.db.profile.phase then
			self:TriggerEvent("BigWigs_Message", L["phaseone_message"], "Attention")
		end
	elseif sync == "JeklikPhaseTwo" then
		--[[if IsAddOnLoaded("KLHThreatMeter") and (IsRaidLeader() or IsRaidOfficer()) then --reminder to fix KTM after this. Threat addons with threat addons, boss mod addons with boss mod addons.
			klhtm.net.clearraidthreat()
		end]]
		if self.db.profile.phase then
			self:TriggerEvent("BigWigs_Message", L["phasetwo_message"], "Attention")
		end
		if self.db.profile.fear then
			self:TriggerEvent("BigWigs_StopBar", self, L["fearreptext"])
			self:TriggerEvent("BigWigs_StartBar", self, L["fearreptext"], 39.5, "Interface\\Icons\\Spell_Shadow_PsychicScream")
		end
	elseif sync == "JeklikFearRep" and self.db.profile.fear then
		self:TriggerEvent("BigWigs_StartBar", self, L["fearreptext"], 18, "Interface\\Icons\\Spell_Shadow_SummonImp")
	elseif sync == "JeklikFearTwoRep" then
		if self.db.profile.fear then
			self:TriggerEvent("BigWigs_StartBar", self, L["fearreptext"], 39.5, "Interface\\Icons\\Spell_Shadow_PsychicScream")
		end
		if self.db.profile.heal then
			self:TriggerEvent("BigWigs_StopBar", self, L["greathealbar"])			
		end
	elseif sync == "JeklikSwarmBats" and self.db.profile.swarm then
		self:TriggerEvent("BigWigs_Message", L["swarm_message"], "Urgent")
	elseif sync == "JeklikBombBats" and self.db.profile.bomb then
		self:TriggerEvent("BigWigs_Message", L["bomb_message"], "Urgent")
	elseif sync == "JeklikMindFlay" then
		if self.db.profile.flay then
			self:TriggerEvent("BigWigs_StopBar", self, L["mindflaybar"])
			self:TriggerEvent("BigWigs_StartBar", self, L["mindflaybar"], 10, "Interface\\Icons\\Spell_Shadow_SiphonMana")
		end
		if self.db.profile.heal then
			self:TriggerEvent("BigWigs_StopBar", self, L["greathealbar"])			
		end
	elseif sync == "JeklikMindFlayEnd" and self.db.profile.flay then
		self:TriggerEvent("BigWigs_StopBar", self, L["mindflaybar"])
	elseif sync == "JeklikHeal" then
		healtimer = GetTime()
		castingheal = 1
		if self.db.profile.heal then
			self:TriggerEvent("BigWigs_Message", L["greathealtext"], "Important", "Alarm")
			self:TriggerEvent("BigWigs_StartBar", self, L["greathealbar"], 4, "Interface\\Icons\\Spell_Holy_Heal")
		end
	elseif sync == "JeklikHealStop" then
		castingheal = 0
		if self.db.profile.heal then
			self:TriggerEvent("BigWigs_StopBar", self, L["greathealbar"])		
		end
	end
end

function BigWigsJeklik:Event(msg)
	local _,_,mindflayother,_ = string.find(msg, L["mindflayother_trigger"])
	local _,_,mindflayend,_ = string.find(msg, L["mindflayend_trigger"])
	local _,_,liquidfirehitsother,_ = string.find(msg, L["liquidfirehitsother_trigger"])
	local _,_,liquidfireresist,_ = string.find(msg, L["liquidfireresist_trigger"])
	local _,_,liquidfireabsorb,_ = string.find(msg, L["liquidfireabsorb_trigger"])
	local _,_,liquidfireimmune,_ = string.find(msg, L["liquidfireimmune_trigger"])
	if string.find(msg, L["heal_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "JeklikHeal")
	elseif string.find(msg, L["phasetwo_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "JeklikPhaseTwo")
	elseif string.find(msg, L["mindflayyou_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "JeklikMindFlay")
	elseif mindflayother and (UnitIsInRaidByName(mindflayother) or UnitIsPetByName(mindflayother)) then
		self:TriggerEvent("BigWigs_SendSync", "JeklikMindFlay")
	elseif string.find(msg, L["mindflayendyou_trigger"]) then 
		self:TriggerEvent("BigWigs_SendSync", "JeklikMindFlayEnd")
	elseif mindflayend and (UnitIsInRaidByName(mindflayend) or UnitIsPetByName(mindflayend)) then 
		self:TriggerEvent("BigWigs_SendSync", "JeklikMindFlayEnd")
	elseif string.find(msg, L["fearrep_trigger1"]) or string.find(msg, L["fearrep_trigger2"]) or string.find(msg, L["fearrep_trigger3"]) then
		self:TriggerEvent("BigWigs_SendSync", "JeklikFearRep")
	elseif string.find(msg, L["fearrep_trigger4"]) or string.find(msg, L["fearrep_trigger5"]) or string.find(msg, L["fearrep_trigger6"]) then
		self:TriggerEvent("BigWigs_SendSync", "JeklikFearTwoRep")
	elseif string.find(msg, L["attack_trigger1"]) or string.find(msg, L["attack_trigger2"]) or string.find(msg, L["attack_trigger3"]) or string.find(msg, L["attack_trigger4"]) then
		if castingheal == 1 then 
			if (GetTime()-healtimer)<4 then
				self:TriggerEvent("BigWigs_SendSync", "JeklikHealStop")
			elseif (GetTime()-healtimer)>=4 then
				castingheal = 0
			end
		end
	elseif msg == L["bomb_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "JeklikBombBats")
	elseif msg == L["swarm_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "JeklikSwarmBats")
	elseif string.find(msg, L["liquidfire_trigger"]) then
		if self.db.profile.announce then
			if string.find(msg, L["liquidfirehitsyou_trigger"]) then
				self:TriggerEvent("BigWigs_Message", L["firewarnyou"], "Attention", "Alarm")
			elseif msg == L["liquidfireresistyou_trigger"] then
				self:TriggerEvent("BigWigs_Message", L["firewarn"], "Attention", "Alarm")
			elseif msg == L["liquidfireabsorbyou_trigger"] then
				self:TriggerEvent("BigWigs_Message", L["firewarn"], "Attention", "Alarm")
			elseif msg == L["liquidfireimmuneyou_trigger"] then
				self:TriggerEvent("BigWigs_Message", L["firewarn"], "Attention", "Alarm")
			elseif liquidfirehitsother and liquidfirehitsother~=L["you"] then
				self:TriggerEvent("BigWigs_SendTell", liquidfirehitsother, L["firewarn"])
			elseif liquidfireresist then
				self:TriggerEvent("BigWigs_SendTell", liquidfireresist, L["firewarn"])
			elseif liquidfireabsorb then
				self:TriggerEvent("BigWigs_SendTell", liquidfireabsorb, L["firewarn"])
			elseif liquidfireimmune then
				self:TriggerEvent("BigWigs_SendTell", liquidfireimmune, L["firewarn"])
			end
		end
	end
end
