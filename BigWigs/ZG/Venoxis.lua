------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["High Priest Venoxis"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	add_name = "Razzashi Cobra",
	renew_trigger = "High Priest Venoxis gains Renew\.",
	renewend_trigger = "Renew fades from High Priest Venoxis\.",
	enrage_trigger = "High Priest Venoxis gains Enrage\.",
	holyfire_trigger = "High Priest Venoxis begins to cast Holy Fire\.",
	phase2_trigger = "Let the coils of hate unfurl!",
	attack_trigger1 = "High Priest Venoxis attacks",
	attack_trigger2 = "High Priest Venoxis misses",
	attack_trigger3 = "High Priest Venoxis hits",
	attack_trigger4 = "High Priest Venoxis crits",
	poisoncloud_trigger = "Poison Cloud",
	poisoncloudhitsyou_trigger = "You suffer (.+) Nature damage from High Priest Venoxis 's Poison Cloud.",
	poisoncloudhitsother_trigger = "(.+) suffers (.+) Nature damage from High Priest Venoxis 's Poison Cloud.",
	poisoncloudabsorbyou_trigger = "You absorb High Priest Venoxis 's Poison Cloud\.",
	poisoncloudabsorb_trigger = "High Priest Venoxis 's Poison Cloud is absorbed by (.+)\.",
	poisoncloudresistyou_trigger = "High Priest Venoxis 's Poison Cloud was resisted\.",
	poisoncloudresist_trigger = "High Priest Venoxis 's Poison Cloud was resisted by (.+)\.",
	poisoncloudimmuneyou_trigger = "High Priest Venoxis 's Poison Cloud failed. You are immune\.",
	poisoncloudimmune_trigger = "High Priest Venoxis 's Poison Cloud fails. (.+) is immune\.",
	deadaddtrigger = "Razzashi Cobra dies",
	deadbosstrigger = "High Priest Venoxis dies",

	holyfirebar = "Holy Fire",
	renewbar = "Renew",
	renew_message = "Renew! Dispel it!",
	phase1_message = "Troll Phase",
	phase2_message = "Snake Phase",
	enrage_message = "Boss is enraged! Spam heals!",
	poisonyou_message = "Move away from poison cloud!",
	poison_message = "Move away from poison cloud!",
	addmsg = "%d/4 Razzashi Cobras dead!",
	you = "you",
	
	cmd = "Venoxis",

	adds_cmd = "adds",
	adds_name = "Dead adds counter",
	adds_desc = "Announces dead Razzashi Cobras",
	
	renew_cmd = "renew",
	renew_name = "Renew Alert",
	renew_desc = "Warn for Renew",

	holyfire_cmd = "holyfire",
	holyfire_name = "Holy Fire Alert",
	holyfire_desc = "Warn for Holy Fire",

	phase_cmd = "phase",
	phase_name = "Phase Notification",
	phase_desc = "Announces the boss' phase transition",

	announce_cmd = "whispers",
	announce_name = "Whisper to people in Poison Clouds",
	announce_desc = "Sends a whisper to players that stand in poison\n\n(Requires assistant or higher)\n\n(Disclaimer: to avoid spamming whispers, it will only whisper people that actually take damage from the Poison Clouds)",

	enrage_cmd = "enrage",
	enrage_name = "Enrage Alert",
	enrage_desc = "Warn for Enrage",
} end )

L:RegisterTranslations("deDE", function() return {
	add_name = "Razzashi Cobra",
	renew_trigger = "High Priest Venoxis bekommt 'Erneuerung",
	renewend_trigger = "Erneuerung schwindet von High Priest Venoxis\.",
	enrage_trigger = "High Priest Venoxis bekommt \'Wutanfall",
	holyfire_trigger = "High Priest Venoxis beginnt Heiliges Feuer zu wirken\.",
	phase2_trigger = "Let the coils of hate unfurl!",
	attack_trigger1 = "High Priest Venoxis greift an",
	attack_trigger2 = "High Priest Venoxis verfehlt",
	attack_trigger3 = "High Priest Venoxis trifft",
	attack_trigger4 = "High Priest Venoxis trifft (.+) kritisch",
	poisoncloud_trigger = "Giftwolke",
	poisoncloudhitsyou_trigger = "Ihr erleidet (.+) Naturschaden von High Priest Venoxis (durch Giftwolke)\.",
	poisoncloudhitsother_trigger = "(.+) erleidet (.+) Naturschaden von High Priest Venoxis (durch Giftwolke)\.",
	poisoncloudabsorbyou_trigger = "Ihr absorbiert High Priest Venoxiss Giftwolke\.",
	poisoncloudabsorb_trigger = "Giftwolke von High Priest Venoxis wird absorbiert von\: (.+)\.",
	poisoncloudresistyou_trigger = "High Priest Venoxis versucht es mit Giftwolke\.\.\. widerstanden\.",
	poisoncloudresist_trigger = "High Priest Venoxiss Giftwolke wurde von (.+) widerstanden\.",
	poisoncloudimmuneyou_trigger = "High Priest Venoxis versucht es mit Giftwolke\.\.\. ein Fehlschlag. Ihr seid immun\.",
	poisoncloudimmune_trigger = "High Priest Venoxis versucht es mit Giftwolke. Ein Fehlschlag, denn (.+) ist immun\.",
	deadaddtrigger = "Razzashi Cobra stirbt",
	deadbosstrigger = "High Priest Venoxis stirbt",

	holyfirebar = "Heiliges Feuer",
	renewbar = "Erneuerung",
	renew_message = "Erneuerung! Entferne magie!",
	phase1_message = "Troll-Phase",
	phase2_message = "Schlange-Phase",
	enrage_message = "Boss ist in Raserei! Spam Heilung!",
	poisonyou_message = "Beweg\' dich aus dem Giftwolke!",
	poison_message = "Move away from poison cloud!",
	addmsg = "%d/4 Razzashi Cobra tot!",
	you = "Ihr",
	
	cmd = "Venoxis",

	adds_cmd = "adds",
	adds_name = "Z\195\164hler f\195\188r tote Adds",
	adds_desc = "Verk\195\188ndet Razzashi Cobras Tod",
	
	renew_cmd = "renew",
	renew_name = "Alarm f\195\188r Erneuerung",
	renew_desc = "Warnung, wenn Venoxis Erneuerung auf sich wirkt",

	holyfire_cmd = "holyfire",
	holyfire_name = "Alarm f\195\188r Heiliges Feuer",
	holyfire_desc = "Warnen, wenn Heiliges Feuer gewirkt wird",

	phase_cmd = "phase",
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses",

	announce_cmd = "whispers",
	announce_name = "Brennenden Personen fl\195\188stern",
	announce_desc = "Fl\195\188ster der Person, die im Giftwolken steht\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)\n\n(Dementi: um \195\188berfl\195\188ssiges Fl\195\188stern zu vermeiden, wird es nur den Personen fl\195\188stern, die tats\195\164chlichen Schaden von den Giftwolken bekommen.)",

	enrage_cmd = "enrage",
	enrage_name = "Verk\195\188ndet Boss' Raserei",
	enrage_desc = "L\195\164sst dich wissen, wenn Boss h\195\164rter zuschl\195\164gt",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsVenoxis = BigWigs:NewModule(boss)
BigWigsVenoxis.zonename = AceLibrary("Babble-Zone-2.2")["Zul'Gurub"]
BigWigsVenoxis.enabletrigger = boss
BigWigsVenoxis.wipemobs = { L["add_name"] }
BigWigsVenoxis.toggleoptions = {"phase", "adds", "renew", "holyfire", "enrage", "announce", "bosskill"}
BigWigsVenoxis.revision = tonumber(string.sub("$Revision: 11205 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsVenoxis:OnEnable()
	cobra = 0
	venoxisdead = 0
	castingholyfire = 0
	holyfiretime = 0
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "VenoxisPhaseOne", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "VenoxisPhaseTwo", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "VenoxisRenewStart", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "VenoxisRenewStop", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "VenoxisHolyFireStart", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "VenoxisHolyFireStop", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "VenoxisEnrage", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "VenoxisAddDead", 0.7)
	self:TriggerEvent("BigWigs_ThrottleSync", "VenoxisVenoxisDead", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "VenoxisAllDead", 3)
end

------------------------------
--      Events              --
------------------------------

function BigWigsVenoxis:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if string.find(msg, L["renew_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "VenoxisRenewStart")
	elseif string.find(msg, L["enrage_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "VenoxisEnrage")
	end
end

function BigWigsVenoxis:Event(msg)
	local _,_,poisoncloudhitsother,_ = string.find(msg, L["poisoncloudhitsother_trigger"])
	local _,_,poisoncloudabsorb,_ = string.find(msg, L["poisoncloudabsorb_trigger"])
	local _,_,poisoncloudresist,_ = string.find(msg, L["poisoncloudresist_trigger"])
	local _,_,poisoncloudimmune,_ = string.find(msg, L["poisoncloudimmune_trigger"])
	if string.find(msg, L["holyfire_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "VenoxisHolyFireStart")
	elseif string.find(msg, L["attack_trigger1"]) or string.find(msg, L["attack_trigger2"]) or string.find(msg, L["attack_trigger3"]) or string.find(msg, L["attack_trigger4"]) then
		if castingholyfire == 1 then 
			if (GetTime()-holyfiretime)<3.5 then
				self:TriggerEvent("BigWigs_SendSync", "VenoxisHolyFireStop")
			elseif (GetTime()-holyfiretime)>=3.5 then
				castingholyfire = 0
			end
		end
	elseif string.find(msg, L["poisoncloud_trigger"]) then
		if self.db.profile.announce then
			if string.find(msg, L["poisoncloudhitsyou_trigger"]) then
				self:TriggerEvent("BigWigs_Message", L["poisonyou_message"], "Attention", "Alarm")
			elseif msg == L["poisoncloudresistyou_trigger"] then
				self:TriggerEvent("BigWigs_Message", L["poisonyou_message"], "Attention", "Alarm")
			elseif msg == L["poisoncloudabsorbyou_trigger"] then
				self:TriggerEvent("BigWigs_Message", L["poisonyou_message"], "Attention", "Alarm")
			elseif msg == L["poisoncloudimmuneyou_trigger"] then
				self:TriggerEvent("BigWigs_Message", L["poisonyou_message"], "Attention", "Alarm")
			elseif poisoncloudhitsother and poisoncloudhitsother~=L["you"] then
				self:TriggerEvent("BigWigs_SendTell", poisoncloudhitsother, L["poison_message"])
			elseif poisoncloudresist then
				self:TriggerEvent("BigWigs_SendTell", poisoncloudresist, L["poison_message"])
			elseif poisoncloudabsorb then
				self:TriggerEvent("BigWigs_SendTell", poisoncloudabsorb, L["poison_message"])
			elseif poisoncloudimmune then
				self:TriggerEvent("BigWigs_SendTell", poisoncloudimmune, L["poison_message"])
			end
		end
	end
end

function BigWigsVenoxis:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["phase2_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "VenoxisPhaseTwo")
	end
end

function BigWigsVenoxis:CHAT_MSG_SPELL_AURA_GONE_OTHER(msg)
	if string.find(msg, L["renewend_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "VenoxisRenewStop")
	end
end

function BigWigsVenoxis:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if string.find(msg, L["deadaddtrigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "VenoxisAddDead")
	elseif string.find(msg, L["deadbosstrigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "VenoxisVenoxisDead")
	end
end

function BigWigsVenoxis:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BossEngaged" and rest == "High Priest Venoxis" then
		self:TriggerEvent("BigWigs_SendSync", "VenoxisPhaseOne")
	elseif sync == "VenoxisPhaseOne" then
		if self.db.profile.phase then
			self:TriggerEvent("BigWigs_Message", L["phase1_message"], "Attention")
		end
	elseif sync == "VenoxisPhaseTwo" then
		if IsAddOnLoaded("KLHThreatMeter") and IsRaidLeader() then --reminder to fix KTM after this. Threat addons with threat addons, boss mod addons with boss mod addons.
			klhtm.net.clearraidthreat()
		end
		if self.db.profile.phase then
			self:TriggerEvent("BigWigs_Message", L["phase2_message"], "Attention")
		end
		if self.db.profile.holyfire then
			self:TriggerEvent("BigWigs_StopBar", self, L["holyfirebar"])
		end
	elseif sync == "VenoxisRenewStart" then
		if self.db.profile.renew then
			self:TriggerEvent("BigWigs_Message", L["renew_message"], "Urgent")
			self:TriggerEvent("BigWigs_StartBar", self, L["renewbar"], 15, "Interface\\Icons\\Spell_Holy_Renew")
		end
	elseif sync == "VenoxisRenewStop" then
		if self.db.profile.renew then
			self:TriggerEvent("BigWigs_StopBar", self, L["renewbar"])
		end
	elseif sync == "VenoxisHolyFireStart" then
		holyfiretime = GetTime()
		castingholyfire = 1
		if self.db.profile.holyfire then
			self:TriggerEvent("BigWigs_StartBar", self, L["holyfirebar"], 3.5, "Interface\\Icons\\Spell_Holy_SearingLight")
		end
	elseif sync == "VenoxisHolyFireStop" then
		castingholyfire = 0
		if self.db.profile.holyfire then
			self:TriggerEvent("BigWigs_StopBar", self, L["holyfirebar"])
		end
	elseif sync == "VenoxisEnrage" then
		if self.db.profile.enrage then
			self:TriggerEvent("BigWigs_Message", L["enrage_message"], "Attention")
		end
	elseif sync == "VenoxisAddDead" then
		cobra = cobra + 1
		if self.db.profile.adds then
			self:TriggerEvent("BigWigs_Message", string.format(L["addmsg"], cobra), "Positive")
		end
		if ((cobra == 4) and (venoxisdead == 1)) then
			self:TriggerEvent("BigWigs_SendSync", "VenoxisAllDead")
		end
	elseif sync == "VenoxisVenoxisDead" then
		venoxisdead = 1
		if self.db.profile.bosskill then
			self:TriggerEvent("BigWigs_Message", string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], self:ToString()), "Bosskill", nil, "Victory")
		end
		if ((cobra == 4) and (venoxisdead == 1)) then
			self:TriggerEvent("BigWigs_SendSync", "VenoxisAllDead")
		end
	elseif sync == "VenoxisAllDead" then
		self:TriggerEvent("BigWigs_RemoveRaidIcon")
		self.core:ToggleModuleActive(self, false)
	end
end
