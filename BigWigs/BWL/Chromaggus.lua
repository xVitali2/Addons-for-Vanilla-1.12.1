------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Chromaggus"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Chromaggus",

	enrage_cmd = "enrage",
	enrage_name = "Enrage",
	enrage_desc = "Warn before the Enrage phase at 20%.",

	frenzy_cmd = "frenzy",
	frenzy_name = "Frenzy",
	frenzy_desc = "Warn for Frenzy.",

	breath_cmd = "breath",
	breath_name = "Breaths",
	breath_desc = "Warn for Breaths.",

	vulnerability_cmd = "vulnerability",
	vulnerability_name = "Vulnerability",
	vulnerability_desc = "Warn for Vulnerability changes.",

	breath_trigger = "Chromaggus begins to cast (.+)\.",
	vulnerability_direct_test = "^[%w]+[%s's]* ([%w%s:]+) ([%w]+) Chromaggus for ([%d]+) ([%w]+) damage%.[%s%(]*([%d]*)",
	vulnerability_dots_test = "^Chromaggus suffers ([%d]+) ([%w]+) damage from [%w]+[%s's]* ([%w%s:]+)%.[%s%(]*([%d]*)",
	frenzy_trigger = "goes into a killing frenzy",
	frenzyfade_trigger = "Frenzy fades from Chromaggus\.",
	vulnerability_trigger = "flinches as its skin shimmers.",

	hit = "hits",
	crit = "crits",

	firstbreaths_warning = "Breath in 5 seconds!",
	breath_warning = "%s in 5 seconds!",
	breath_message = "%s is casting!",
	vulnerability_message = "Vulnerability: %s!",
	vulnerability_warning = "Spell vulnerability changed!",
	frenzy_message = "Frenzy! TRANQ NOW!",
	enrage_warning = "Enrage soon!",

	breath1 = "Time Lapse",
	breath2 = "Corrosive Acid",
	breath3 = "Ignite Flesh",
	breath4 = "Incinerate",
	breath5 = "Frost Burn",
	
	breathcolor1 = "black",
	breathcolor2 = "green",
	breathcolor3 = "orange",
	breathcolor4 = "red",
	breathcolor5 = "blue",

	icon1 = "Interface\\Icons\\Spell_Arcane_PortalOrgrimmar",
	icon2 = "Interface\\Icons\\Spell_Nature_Acid_01",
	icon3 = "Interface\\Icons\\Spell_Fire_Fire",
	icon4 = "Interface\\Icons\\Spell_Shadow_ChillTouch",
	icon5 = "Interface\\Icons\\Spell_Frost_ChillingBlast",

	castingbar = "Cast %s",
	frenzy_bar = "Frenzy",
	first_bar = "First Breath",
	second_bar = "Second Breath",
	
	fire = "Fire",
	frost = "Frost",
	shadow = "Shadow",
	nature = "Nature",
	arcane = "Arcane",
	
	curseofdoom = "Curse of Doom",
	ignite = "Ignite",
	starfire = "Starfire",
	thunderfury = "Thunderfury",
} end )

L:RegisterTranslations("deDE", function() return {
	enrage_name = "Wutanfall",
	enrage_desc = "Warnung, wenn Chromaggus w\195\188tend wird (ab 20%).",

	frenzy_name = "Raserei",
	frenzy_desc = "Warnung, wenn Chromaggus in Raserei ger\195\164t.",

	breath_name = "Atem",
	breath_desc = "Warnung, wenn Chromaggus seinen Atem wirkt.",

	vulnerability_name = "Zauber-Verwundbarkeiten",
	vulnerability_desc = "Warnung, wenn Chromagguss Zauber-Verwundbarkeit sich \195\164ndert.",

	breath_trigger = "^Chromaggus beginnt (.+) zu wirken\.",
	vulnerability_direct_test = "^(.+) trifft Chromaggus(.+) ([%d]+) ([%w]+)%.[%s%(]*([%d]*)",
	vulnerability_dots_test = "^Chromaggus erleidet ([%d]+) ([%w]+)schaden[%svon]*[%s%w]* %(durch ([%w%s:]+)%)%.[%s%(]*([%d]*)",
	frenzy_trigger = "goes into a killing frenzy",
	frenzyfade_trigger = "Raserei schwindet von Chromaggus\.",
	vulnerability_trigger = "flinches as its skin shimmers.",

	hit = "trifft",
	crit = "kritisch",

	firstbreaths_warning = "Atem in 5 Sekunden!",
	breath_warning = "%s in 5 Sekunden!",
	breath_message = "Chromaggus wirkt: %s Atem!",
	vulnerability_message = "Zauber-Verwundbarkeit: %s",
	vulnerability_warning = "Zauber-Verwundbarkeit ge\195\164ndert!",
	frenzy_message = "Raserei - Einlullender Schuss!",
	enrage_warning = "Wutanfall steht kurz bevor!",

	breath1 = "Zeitraffer",
	breath2 = "\195\132tzende S\195\164ure",
	breath3 = "Fleisch entz\195\188nden",
	breath4 = "Verbrennen",
	breath5 = "Frostbeulen",

	breathcolor1 = "black",
	breathcolor2 = "green",
	breathcolor3 = "orange",
	breathcolor4 = "red",
	breathcolor5 = "blue",

	icon1 = "Interface\\Icons\\Spell_Arcane_PortalOrgrimmar",
	icon2 = "Interface\\Icons\\Spell_Nature_Acid_01",
	icon3 = "Interface\\Icons\\Spell_Fire_Fire",
	icon4 = "Interface\\Icons\\Spell_Shadow_ChillTouch",
	icon5 = "Interface\\Icons\\Spell_Frost_ChillingBlast",

	castingbar = "Wirkt %s",
	frenzy_bar = "Raserei",
	first_bar = "Erster Atem",
	second_bar = "Zweite Atem",
	
	fire = "Feuer",
	frost = "Frost",
	shadow = "Schatten",
	nature = "Natur",
	arcane = "Arkan",
	
	curseofdoom = "Fluch der Verdammnis",
	ignite = "Entz\195\188nden",
	starfire = "Sternenfeuer",
	thunderfury = "Zorn der Winde",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsChromaggus = BigWigs:NewModule(boss)
BigWigsChromaggus.zonename = AceLibrary("Babble-Zone-2.2")["Blackwing Lair"]
BigWigsChromaggus.enabletrigger = boss
BigWigsChromaggus.toggleoptions = { "enrage", "frenzy", "breath", "vulnerability", "bosskill"}
BigWigsChromaggus.revision = tonumber(string.sub("$Revision: 11211 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsChromaggus:OnEnable()
	self.vulnerability = nil
	twenty = nil
	started = nil
	frenzied = nil

	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "PlayerDamageEvents")
	self:RegisterEvent("CHAT_MSG_SPELL_PET_DAMAGE", "PlayerDamageEvents")
	self:RegisterEvent("CHAT_MSG_SPELL_PARTY_DAMAGE", "PlayerDamageEvents")
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE", "PlayerDamageEvents")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("UNIT_HEALTH")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "ChromaggusEngage", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "ChromaggusBreath", 20)
	self:TriggerEvent("BigWigs_ThrottleSync", "ChromaggusFrenzyStart", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "ChromaggusFrenzyStop", 5)
end

function BigWigsChromaggus:UNIT_HEALTH( msg )
	if self.db.profile.enrage and UnitName(msg) == boss then
		local health = UnitHealth(msg)
		if health > 431240 and health <= 495926 and not twenty then
			self:TriggerEvent("BigWigs_Message", L["enrage_warning"], "Important")
			twenty = true
		elseif health > 862480 and twenty then
			twenty = nil
		end
	end
end

function BigWigsChromaggus:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE( msg )
	local _,_, spellName = string.find(msg, L["breath_trigger"])
	if spellName then
		local breath = L:HasReverseTranslation(spellName) and L:GetReverseTranslation(spellName) or nil
		if not breath then return end
		breath = string.sub(breath, -1)
		self:TriggerEvent("BigWigs_SendSync", "ChromaggusBreath "..breath)
	end
end

function BigWigsChromaggus:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BossEngaged" and rest == "Chromaggus" and not started then
		started = true
		if self.db.profile.breath then
			self:ScheduleEvent("BigWigs_Message", 25, L["firstbreaths_warning"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["first_bar"], 30, "Interface\\Icons\\INV_Misc_QuestionMark", true, "cyan")
			self:ScheduleEvent("BigWigs_Message", 55, L["firstbreaths_warning"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["second_bar"], 60, "Interface\\Icons\\INV_Misc_QuestionMark", true, "cyan")
		end
		self:TriggerEvent("BigWigs_SendSync", "ChromaggusEngage")
	elseif sync == "ChromaggusEngage" and not started then
		started = true
		if self.db.profile.breath then
			self:ScheduleEvent("BigWigs_Message", 24.9, L["firstbreaths_warning"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["first_bar"], 29.9, "Interface\\Icons\\INV_Misc_QuestionMark", true, "cyan")
			self:ScheduleEvent("BigWigs_Message", 54.9, L["firstbreaths_warning"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["second_bar"], 59.9, "Interface\\Icons\\INV_Misc_QuestionMark", true, "cyan")
		end
	elseif sync == "ChromaggusBreath" and self.db.profile.breath then
		local spellName = L:HasTranslation("breath"..rest) and L["breath"..rest] or nil
		if not spellName then return end
		self:TriggerEvent("BigWigs_StartBar", self, string.format( L["castingbar"], spellName), 2, L["icon"..rest])
		self:TriggerEvent("BigWigs_Message", string.format(L["breath_message"], spellName), "Important")
		self:ScheduleEvent("bwchromaggusbreath"..spellName, "BigWigs_Message", 55, string.format(L["breath_warning"], spellName), "Important")
		self:TriggerEvent("BigWigs_StartBar", self, spellName, 60, L["icon"..rest], true, L["breathcolor"..rest])
	elseif sync == "ChromaggusFrenzyStart" then
		if self.db.profile.frenzy and not frenzied then
			self:TriggerEvent("BigWigs_Message", L["frenzy_message"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["frenzy_bar"], 8, "Interface\\Icons\\Ability_Druid_ChallangingRoar", true, "white")
		end
		frenzied = true
	elseif sync == "ChromaggusFrenzyStop" then
		if self.db.profile.frenzy and frenzied then
			self:TriggerEvent("BigWigs_StopBar", self, L["frenzy_bar"])
		end
		frenzied = nil
	end
end

function BigWigsChromaggus:CHAT_MSG_MONSTER_EMOTE(msg)
	if string.find(msg, L["frenzy_trigger"]) and arg2 == boss then
		if self.db.profile.frenzy and not frenzied then
			self:TriggerEvent("BigWigs_Message", L["frenzy_message"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["frenzy_bar"], 8, "Interface\\Icons\\Ability_Druid_ChallangingRoar", true, "white")
		end
		frenzied = true
		self:TriggerEvent("BigWigs_SendSync", "ChromaggusFrenzyStart")
	elseif string.find(msg, L["vulnerability_trigger"]) then
		if self.db.profile.vulnerability then
			self:TriggerEvent("BigWigs_Message", L["vulnerability_warning"], "Positive")
		end
		self.vulnerability = nil
	end
end

function BigWigsChromaggus:CHAT_MSG_SPELL_AURA_GONE_OTHER(msg)
	if msg == L["frenzyfade_trigger"] then
		if self.db.profile.frenzy and frenzied then
			self:TriggerEvent("BigWigs_StopBar", self, L["frenzy_bar"])
		end
		frenzied = nil
		self:TriggerEvent("BigWigs_SendSync", "ChromaggusFrenzyStop")
	end
end

function BigWigsChromaggus:CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE(msg)
	if not self.db.profile.vulnerability then return end
	if not self.vulnerability then
		local _, _, dmg, school, userspell, partial = string.find(msg, L["vulnerability_dots_test"])
		if dmg and school and userspell then
			if school == L["arcane"] then
				if partial and partial ~= "" then
					if tonumber(dmg)+tonumber(partial) >= 250 then
						self.vulnerability = school
						self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
					end
				else
					if tonumber(dmg) >= 250 then
						self.vulnerability = school
						self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
					end
				end
			elseif school == L["fire"] and not string.find(userspell, L["ignite"]) then
				if partial and partial ~= "" then
					if tonumber(dmg)+tonumber(partial) >= 400 then
						self.vulnerability = school
						self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
					end
				else
					if tonumber(dmg) >= 400 then
						self.vulnerability = school
						self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
					end
				end
			elseif school == L["nature"] then
				if partial and partial ~= "" then
					if tonumber(dmg)+tonumber(partial) >= 300 then
						self.vulnerability = school
						self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
					end
				else
					if tonumber(dmg) >= 300 then
						self.vulnerability = school
						self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
					end
				end
			elseif school == L["shadow"] then
				if string.find(userspell, L["curseofdoom"]) then
					if partial and partial ~= "" then
						if tonumber(dmg)+tonumber(partial) >= 3000 then
							self.vulnerability = school
							self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
						end
					else
						if tonumber(dmg) >= 3000 then
							self.vulnerability = school
							self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
						end
					end
				else
					if partial and partial ~= "" then
						if tonumber(dmg)+tonumber(partial) >= 500 then
							self.vulnerability = school
							self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
						end
					else
						if tonumber(dmg) >= 500 then
							self.vulnerability = school
							self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
						end
					end
				end
			end
		end
	end
end

function BigWigsChromaggus:PlayerDamageEvents(msg)
	if not self.db.profile.vulnerability then return end
	if not self.vulnerability then
		local _, _, userspell, stype, dmg, school, partial = string.find(msg, L["vulnerability_direct_test"])
		if GetLocale() == "deDE" then
			if string.find(stype, L["crit"]) then stype = L["crit"] else stype = L["hit"] end
			school = string.gsub(school, "schaden", "")
		end
		if stype and dmg and school then
			if school == L["arcane"] then
				if string.find(userspell, L["starfire"]) then
					if partial and partial ~= "" then
						if (tonumber(dmg)+tonumber(partial) >= 800 and stype == L["hit"]) or (tonumber(dmg)+tonumber(partial) >= 1200 and stype == L["crit"]) then
							self.vulnerability = school
							self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
						end
					else
						if (tonumber(dmg) >= 800 and stype == L["hit"]) or (tonumber(dmg) >= 1200 and stype == L["crit"]) then
							self.vulnerability = school
							self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
						end
					end
				else
					if partial and partial ~= "" then
						if (tonumber(dmg)+tonumber(partial) >= 600 and stype == L["hit"]) or (tonumber(dmg)+tonumber(partial) >= 1200 and stype == L["crit"]) then
							self.vulnerability = school
							self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
						end
					else
						if (tonumber(dmg) >= 600 and stype == L["hit"]) or (tonumber(dmg) >= 1200 and stype == L["crit"]) then
							self.vulnerability = school
							self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
						end
					end
				end
			elseif school == L["fire"] then
				if partial and partial ~= "" then
					if (tonumber(dmg)+tonumber(partial) >= 1300 and stype == L["hit"]) or (tonumber(dmg)+tonumber(partial) >= 2600 and stype == L["crit"]) then
						self.vulnerability = school
						self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
					end
				else
					if (tonumber(dmg) >= 1300 and stype == L["hit"]) or (tonumber(dmg) >= 2600 and stype == L["crit"]) then
						self.vulnerability = school
						self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
					end
				end
			elseif school == L["frost"] then
				if partial and partial ~= "" then
					if (tonumber(dmg)+tonumber(partial) >= 800 and stype == L["hit"])	or (tonumber(dmg)+tonumber(partial) >= 1600 and stype == L["crit"]) then
						self.vulnerability = school
						self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
					end
				else
					if (tonumber(dmg) >= 800 and stype == L["hit"]) or (tonumber(dmg) >= 1600 and stype == L["crit"]) then
						self.vulnerability = school
						self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
					end
				end
			elseif school == L["nature"] then
				if string.find(userspell, L["thunderfury"]) then
					if partial and partial ~= "" then
						if (tonumber(dmg)+tonumber(partial) >= 800 and stype == L["hit"]) or (tonumber(dmg)+tonumber(partial) >= 1200 and stype == L["crit"]) then
							self.vulnerability = school
							self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
						end
					else
						if (tonumber(dmg) >= 800 and stype == L["hit"]) or (tonumber(dmg) >= 1200 and stype == L["crit"]) then
							self.vulnerability = school
							self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
						end
					end
				else
					if partial and partial ~= "" then
						if (tonumber(dmg)+tonumber(partial) >= 900 and stype == L["hit"]) or (tonumber(dmg)+tonumber(partial) >= 1800 and stype == L["crit"]) then
							self.vulnerability = school
							self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
						end
					else
						if (tonumber(dmg) >= 900 and stype == L["hit"]) or (tonumber(dmg)>= 1800 and stype == L["crit"]) then
							self.vulnerability = school
							self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
						end
					end
				end
			elseif school == L["shadow"] then
				if partial and partial ~= "" then
					if (tonumber(dmg)+tonumber(partial) >= 1700 and stype == L["hit"]) or (tonumber(dmg)+tonumber(partial) >= 3400 and stype == L["crit"]) then
						self.vulnerability = school
						self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
					end
				else
					if (tonumber(dmg) >= 1700 and stype == L["hit"]) or (tonumber(dmg) >= 3400 and stype == L["crit"]) then
						self.vulnerability = school
						self:TriggerEvent("BigWigs_Message", format(L["vulnerability_message"], school), "Positive")
					end
				end
			end
		end
	end
 end
