------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Kel'Thuzad"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local t
local t1 = 0    -- saves time of first frostbolt 
local co = 0	-- counts the number of people hit by frostbolt
local ua = 0	-- counter for Unstoppable Abomination's
local sw = 0 	-- counter for Soul Weaver's
local pstart = 0    -- time of p1 start, used for tracking add count

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Kelthuzad",

	KELTHUZADCHAMBERLOCALIZEDLOLHAX = "Kel'Thuzad Chamber",

	phase_cmd = "phase",
	phase_name = "Phase Warnings",
	phase_desc = "Warn for phases.",

	mc_cmd = "mindcontrol",
	mc_name = "Mind Control",
	mc_desc = "Alerts when people are mind controlled.",

	fissure_cmd = "fissure",
	fissure_name = "Shadow Fissure",
	fissure_desc = "Alerts about incoming Shadow Fissures.",

	frostblast_cmd = "frostblast",
	frostblast_name = "Frost Blast",
	frostblast_desc = "Alerts when people get Frost Blasted.",

	frostbolt_cmd = "frostbolt",
	frostbolt_name = "Frostbolt Alert",
	frostbolt_desc = "Alerts about incoming Frostbolts",

	frostboltbar_cmd = "frostboltbar",
	frostboltbar_name = "Frostbolt Bar",
	frostboltbar_desc = "Displays a bar for Frostbolt casts",

	detonate_cmd = "detonate",
	detonate_name = "Detonate Mana Warning",
	detonate_desc = "Warns about Detonate Mana soon.",

	detonateicon_cmd = "detonateicon",
	detonateicon_name = "Raid Icon on Detonate",
	detonateicon_desc = "Place a raid icon on people with Detonate Mana.",

	guardians_cmd = "guardians",
	guardians_name = "Guardian Spawns",
	guardians_desc = "Warn for incoming Icecrown Guardians in phase 3.",
	
	fbvolley_cmd = "fbvolley",
	fbvolley_name = "Possible volley",
	fbvolley_desc = "Timer for possible Frostbolt volley/multiple",
	
	addcount_cmd = "addcount",
	addcount_name = "P1 Add counter",
	addcount_desc = "Counts number of killed adds in P1",
	
	ktmreset_cmd = "ktmreset",
	ktmreset_name = "Do not reset KTM on MC",
	ktmreset_desc = "Resets KTM on MC when disabled, does nothing when enabled.",
	
	mc_trigger1 = "Your soul, is bound to me now!",
	mc_trigger2 = "There will be no escape!",
	mc_warning = "Mind Control!",
	mc_bar = "Possible Mind Control!",

	start_trigger = "Minions, servants, soldiers of the cold dark, obey the call of Kel'Thuzad!",   
	start_trigger1 = "Minions, servants, soldiers of the cold dark! Obey the call of Kel'Thuzad!",
	start_warning = "Kel'Thuzad encounter started! ~5min till he is active!",
	start_bar = "Phase 1 Timer",
	attack_trigger1 = "Kel'Thuzad attacks",
	attack_trigger2 = "Kel'Thuzad misses",
	attack_trigger3 = "Kel'Thuzad hits",
	attack_trigger4 = "Kel'Thuzad crits",
	kick_trigger1 = "Kick hits Kel'Thuzad",
	kick_trigger2 = "Kick crits Kel'Thuzad",
	kick_trigger3 = "Kick was blocked by Kel'Thuzad",
	pummel_trigger1 = "Pummel hits Kel'Thuzad",
	pummel_trigger2 = "Pummel crits Kel'Thuzad",
	pummel_trigger3 = "Pummel was blocked by Kel'Thuzad",
	shieldbash_trigger1 = "Shield Bash hits Kel'Thuzad",
	shieldbash_trigger2 = "Shield Bash crits Kel'Thuzad",
	shieldbash_trigger3 = "Shield Bash was blocked by Kel'Thuzad",
	earthshock_trigger1 = "Earth Shock hits Kel'Thuzad",
	earthshock_trigger2 = "Earth Shock crits Kel'Thuzad",

	phase1_warn = "Phase 1 ends in 20 seconds!",

	phase2_trigger1 = "Pray for mercy!",
	phase2_trigger2 = "Scream your dying breath!",
	phase2_trigger3 = "The end is upon you!",
	phase2_warning = "Phase 2, Kel'Thuzad incoming!",
	phase2_bar = "Kel'Thuzad Active!",

	phase3_soon_warning = "Phase 3 soon!",
	phase3_trigger = "Master, I require aid!",
	phase3_warning = "Phase 3, Guardians in ~15sec!",

	guardians_trigger = "Very well. Warriors of the frozen wastes, rise up! I command you to fight, kill and die for your master! Let none survive!",
	guardians_warning = "Guardians incoming in ~10sec!",
	guardians_bar = "Guardians incoming!",

--	fissure_trigger = "cast Shadow Fissure.",
--	fissure_warning = "Shadow Fissure!",

	frostbolt_trigger = "Kel'Thuzad begins to cast Frostbolt.",
	frostbolt_warning = "Frostbolt! Interrupt!",
	frostbolt_bar = "Frostbolt",

	
	frostbolt_volley = "Possible volley",
	frostbolt_volley_trigger = "afflicted by Frostbolt",
	
	add_dead_trigger = "(.*) dies",
	add_bar = "%d/14 %s",
	
	frostblast_bar = "Possible Frost Blast",
	frostblast_trigger1 = "I will freeze the blood in your veins!",  
	frostblast_warning = "Frost Blast!",
	frostblast_soon_message = "Possible Frost Blast in ~5sec!",

	phase2_mcfrostblast_warning = "Possible Frost Blast and Mind Control in ~5sec!",
	phase2_detonate_warning = "Detonate Mana in ~5sec!",
	mcfrostblast_bar = "First Frost Blast and MC",

	detonate_trigger = "^([^%s]+) ([^%s]+) afflicted by Detonate Mana",
	detonate_bar = "Detonate Mana - %s",
	detonate_possible_bar = "Detonate Mana",
	detonate_warning = "%s has Detonate Mana!",
	
	you = "You",
	are = "are",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsKelThuzad = BigWigs:NewModule(boss)
BigWigsKelThuzad.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
BigWigsKelThuzad.enabletrigger = boss
BigWigsKelThuzad.toggleoptions = { "frostbolt", "frostboltbar", -1, "frostblast", "fissure", "mc", "ktmreset", -1, "fbvolley", -1, "detonate", "detonateicon", -1 ,"guardians", -1, "addcount", "phase", "bosskill" }
BigWigsKelThuzad.revision = tonumber(string.sub("$Revision: 11212 $", 12, -3)) 

------------------------------
--      Initialization      --
------------------------------

function BigWigsKelThuzad:OnRegister()
	-- Big evul hack to enable the module when entering Kel'Thuzads chamber.
	self:RegisterEvent("MINIMAP_ZONE_CHANGED")
end

function BigWigsKelThuzad:OnEnable()
	self.warnedAboutPhase3Soon = nil
	frostbolttime = 0

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	
	self:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("UNIT_HEALTH")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES", "Event")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Affliction")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Affliction")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Affliction")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "KelDetonate", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "KelFrostBlast", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "KelFrostbolt", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "KelFrostboltStop", 2)
--	self:TriggerEvent("BigWigs_ThrottleSync", "KelFizzure", 2)					-- this isnt used anyway?
	self:TriggerEvent("BigWigs_ThrottleSync", "KelAddDiesAbom", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "KelAddDiesSoul", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "KelDead", 5)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsKelThuzad:MINIMAP_ZONE_CHANGED(msg)
	if GetMinimapZoneText() ~= L["KELTHUZADCHAMBERLOCALIZEDLOLHAX"] or self.core:IsModuleActive(boss) then return end
	-- Activate the Kel'Thuzad mod!
	self.core:EnableModule(boss)
end

function BigWigsKelThuzad:UNIT_HEALTH(msg)
	if not self.db.profile.phase then return end

	if UnitName(msg) == boss then
		local health = UnitHealth(msg)
		if health > 3590300 and health <= 3859573 and not self.warnedAboutPhase3Soon then
			self:TriggerEvent("BigWigs_Message", L["phase3_soon_warning"], "Attention")
			self.warnedAboutPhase3Soon = true
		elseif health > 3859573 and self.warnedAboutPhase3Soon then
			self.warnedAboutPhase3Soon = nil
		end
	end
end

function BigWigsKelThuzad:CHAT_MSG_MONSTER_YELL(msg)
	if self.db.profile.phase and ( msg == L["start_trigger"] or msg == L["start_trigger1"] ) then 
		self:TriggerEvent("BigWigs_Message", L["start_warning"], "Attention")
		self:TriggerEvent("BigWigs_StartBar", self, L["start_bar"], 320 ) 					-- 
		self:ScheduleEvent("phase1_warn", "BigWigs_Message", 300, L["phase1_warn"], "Important")
		
		if self.db.profile.addcount then
		pstart=GetTime() 	-- start of p1, used for tracking add counts
		ua=0
		sw=0
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["add_bar"], ua, "Unstoppable Abomination"),320)
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["add_bar"], sw, "Soul Weaver"),320)
		end
		
	elseif ((msg == L["phase2_trigger1"]) or (msg == L["phase2_trigger2"]) or (msg == L["phase2_trigger3"])) then
		self:TriggerEvent("BigWigs_StartBar", self, L["phase2_bar"], 15)
		self:TriggerEvent("BigWigs_StartBar", self, L["detonate_possible_bar"], 35)
		self:TriggerEvent("BigWigs_StartBar", self, L["mcfrostblast_bar"], 45)
		self:ScheduleEvent("P2warn", "BigWigs_Message", 15, L["phase2_warning"], "Important")
		self:ScheduleEvent("P2Warn1", "BigWigs_Message", 30, L["phase2_detonate_warning"], "Important")
		self:ScheduleEvent("P2Warn2", "BigWigs_Message", 40, L["phase2_mcfrostblast_warning"], "Important")
		
		if self.db.profile.fbvolley then
			self:TriggerEvent("BigWigs_StartBar", self, L["frostbolt_volley"], 30, "Interface\\Icons\\Spell_Frost_FrostWard")
			self:ScheduleEvent("bwfbvolley30", self.Volley, 45, self)
			self:ScheduleEvent("bwfbvolley45", self.Volley, 60, self)
			self:ScheduleEvent("bwfbvolley60", self.Volley, 75, self)
		end
		
	elseif self.db.profile.phase and msg == L["phase3_trigger"] then
		self:TriggerEvent("BigWigs_Message", L["phase3_warning"], "Attention")
	elseif msg == L["mc_trigger1"] or msg == L["mc_trigger2"] then
			self:TriggerEvent("BigWigs_Message", L["mc_warning"], "Urgent")
			self:TriggerEvent("BigWigs_StartBar", self, L["mc_bar"], 60, "Interface\\Icons\\Inv_Belt_18")
	-- would cause too much spam, negating ktmreset wont work for some reason
	
	if not self.db.profile.ktmreset and IsAddOnLoaded("KLHThreatMeter") and (IsRaidLeader() or IsRaidOfficer()) then --reminder to fix KTM after this. Threat addons with threat addons, boss mod addons with boss mod addons.
		klhtm.net.clearraidthreat()
	end
		
		
	elseif self.db.profile.guardians and msg == L["guardians_trigger"] then
		self:TriggerEvent("BigWigs_Message", L["guardians_warning"], "Important")
		self:TriggerEvent("BigWigs_StartBar", self, L["guardians_bar"], 16)
	elseif msg == L["frostblast_trigger1"] then
		self:TriggerEvent("BigWigs_Message", L["frostblast_warning"], "Attention")
		self:ScheduleEvent("bwktfbwarn", "BigWigs_Message", 25, L["frostblast_soon_message"])
		self:TriggerEvent("BigWigs_StartBar", self, L["frostblast_bar"], 30, "Interface\\Icons\\Spell_Frost_FreezingBreath")
	end
end

function BigWigsKelThuzad:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE( msg )
	if string.find(msg, L["frostbolt_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "KelFrostbolt")
	end
end

--[[ function BigWigsKelThuzad:CHAT_MSG_SPELL_SELF_DAMAGE( msg )
	if string.find(msg, L["fissure_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "KelFizzure")
	end
end ]]-- who needs this

function BigWigsKelThuzad:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	local _,_, mob = string.find(msg, L["add_dead_trigger"])
	if self.db.profile.addcount and (mob == "Unstoppable Abomination") then
		self:TriggerEvent("BigWigs_SendSync", "KelAddDiesAbom "..mob)
	elseif self.db.profile.addcount and (mob == "Soul Weaver") then
		self:TriggerEvent("BigWigs_SendSync", "KelAddDiesSoul "..mob)
	elseif self.db.profile.bosskill and (mob == "Kel'Thuzad") then 
		self:TriggerEvent("BigWigs_SendSync", "KelDead")
	end
end

--[[function BigWigsKelThuzad:CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE(msg)
	if --[[self.db.profile.fbvolley and]] string.find(msg, L["frostbolt_volley_trigger"]) then
		t=GetTime()
		if (t-t1)>4 then
			t1=t
			co=0
		else 
			co=co+1
		end
		if (co==4) then 
		self:CancelScheduledEvent("bwfbvolley30")
		self:CancelScheduledEvent("bwfbvolley45")
		self:CancelScheduledEvent("bwfbvolley60") 
		self:TriggerEvent("BigWigs_StartBar", self, L["frostbolt_volley"], 15, "Interface\\Icons\\Spell_Frost_FrostWard")
		self:ScheduleEvent("bwfbvolley30", self.Volley, 15, self)
		self:ScheduleEvent("bwfbvolley45", self.Volley, 30, self)
		self:ScheduleEvent("bwfbvolley60", self.Volley, 45, self)
		end
	end
end ]]

function BigWigsKelThuzad:Volley()
	self:TriggerEvent("BigWigs_StartBar", self, L["frostbolt_volley"], 15, "Interface\\Icons\\Spell_Frost_FrostWard")
end

function BigWigsKelThuzad:BigWigs_RecvSync(sync, rest, nick)
	if sync == "KelDetonate" and rest and self.db.profile.detonate then
		self:TriggerEvent("BigWigs_Message", string.format(L["detonate_warning"], rest), "Attention")
		if self.db.profile.detonateicon then self:TriggerEvent("BigWigs_SetRaidIcon", rest ) end
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["detonate_bar"], rest), 5, "Interface\\Icons\\Spell_Nature_WispSplode")
		self:TriggerEvent("BigWigs_StartBar", self, L["detonate_possible_bar"], 20, "Interface\\Icons\\Spell_Nature_WispSplode")
	elseif sync == "KelFrostboltStop" and self.db.profile.frostbolt then
		self:TriggerEvent("BigWigs_StopBar", self, L["frostbolt_bar"])
		frostbolttime = 0
	elseif sync == "KelFrostbolt" and (self.db.profile.frostbolt or self.db.profile.frostboltbar) then       -- changed from only frostbolt (thats only alert, if someone still wants to see the bar, it wouldnt work then)
		frostbolttime = GetTime()
		if self.db.profile.frostbolt then
			self:TriggerEvent("BigWigs_Message", L["frostbolt_warning"], "Personal")
		end
		if self.db.profile.frostboltbar then
			self:TriggerEvent("BigWigs_StartBar", self, L["frostbolt_bar"], 2, "Interface\\Icons\\Spell_Frost_FrostBolt02", true, "blue")
		end
	elseif sync == "KelAddDiesAbom" and self.db.profile.addcount then
		self:TriggerEvent("BigWigs_StopBar", self, string.format(L["add_bar"], ua, rest))
		ua=ua+1
		if (ua<14) then self:TriggerEvent("BigWigs_StartBar", self, string.format(L["add_bar"], ua, rest),(pstart+320-GetTime())) end
	elseif sync == "KelAddDiesSoul" and self.db.profile.addcount then
		self:TriggerEvent("BigWigs_StopBar", self, string.format(L["add_bar"], sw, rest))
		sw=sw+1
		if (sw<14) then self:TriggerEvent("BigWigs_StartBar", self, string.format(L["add_bar"], sw, rest),(pstart+320-GetTime())) end
	elseif sync == "KelDead" then
		if self.db.profile.bosskill then self:TriggerEvent("BigWigs_Message", string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], boss), "Bosskill", nil, "Victory") end
		self:TriggerEvent("BigWigs_RemoveRaidIcon")
		self.core:ToggleModuleActive(self, false)
	end
end
function BigWigsKelThuzad:Affliction(msg)
	if string.find(msg, L["detonate_trigger"]) then
		local _,_, dplayer, dtype = string.find( msg, L["detonate_trigger"])
		if dplayer and dtype then
			if dplayer == L["you"] and dtype == L["are"] then
				dplayer = UnitName("player")
			end
			self:TriggerEvent("BigWigs_SendSync", "KelDetonate "..dplayer)
		end
	end
	if self.db.profile.fbvolley and string.find(msg, L["frostbolt_volley_trigger"]) then
		t=GetTime()
		if (t-t1)>4 then
			t1=t
			co=0
		else 
			co=co+1
		end
		if (co==3) then 
		self:CancelScheduledEvent("bwfbvolley30")
		self:CancelScheduledEvent("bwfbvolley45")
		self:CancelScheduledEvent("bwfbvolley60") 
		self:TriggerEvent("BigWigs_StartBar", self, L["frostbolt_volley"], 15, "Interface\\Icons\\Spell_Frost_FrostWard")
		self:ScheduleEvent("bwfbvolley30", self.Volley, 15, self)
		self:ScheduleEvent("bwfbvolley45", self.Volley, 30, self)
		self:ScheduleEvent("bwfbvolley60", self.Volley, 45, self)
		end
	end
end

function BigWigsKelThuzad:Event(msg)
	if GetTime() < frostbolttime + 2 then
		if string.find(msg, L["attack_trigger1"]) or string.find(msg, L["attack_trigger2"]) or string.find(msg, L["attack_trigger3"]) or string.find(msg, L["attack_trigger4"]) then
			self:TriggerEvent("BigWigs_StopBar", self, L["frostbolt_bar"])
			frostbolttime = 0
			self:TriggerEvent("BigWigs_SendSync", "KelFrostboltStop")
		elseif string.find(msg, L["kick_trigger1"]) or string.find(msg, L["kick_trigger2"]) or string.find(msg, L["kick_trigger3"]) or string.find(msg, L["pummel_trigger1"]) or string.find(msg, L["pummel_trigger2"]) or string.find(msg, L["pummel_trigger3"]) or string.find(msg, L["shieldbash_trigger1"]) or string.find(msg, L["shieldbash_trigger2"]) or string.find(msg, L["shieldbash_trigger3"]) or string.find(msg, L["earthshock_trigger1"]) or string.find(msg, L["earthshock_trigger2"]) then
			self:TriggerEvent("BigWigs_StopBar", self, L["frostbolt_bar"])
			frostbolttime = 0
			self:TriggerEvent("BigWigs_SendSync", "KelFrostboltStop")
		end
	else
		frostbolttime = 0
	end
end
