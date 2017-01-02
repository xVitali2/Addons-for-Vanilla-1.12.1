------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Lucifron"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	trigger1 = "afflicted by Lucifron",
	trigger2 = "afflicted by Impending Doom",
	trigger3 = "s Shadow Shock hits",
	trigger4 = "s Shadow Shock was resisted",
	trigger5 = " Lucifron(.*) Curse was resisted",
	trigger6 = "s Impending Doom was resisted",
	warn1 = "5 seconds until Lucifron's Curse!",
	warn2 = "Lucifron's Curse - 20 seconds until next!",
	warn3 = "5 seconds until Impending Doom!",
	warn4 = "Impending Doom - 20 seconds until next!",
	mindcontrolyou_trigger = "You are afflicted by Dominate Mind.",
	mindcontrolother_trigger = "(.*) is afflicted by Dominate Mind.",
	mindcontrolyouend_trigger = "Dominate Mind fades from you.",
	mindcontrolotherend_trigger = "Dominate Mind fades from (.*).",
	deathyou_trigger = "You die.",
	deathother_trigger = "(.*) dies.",
	deadaddtrigger = "Flamewaker Protector dies",
	deadbosstrigger = "Lucifron dies",
	add_name = "Flamewaker Protector",
	
	mindcontrol_message = "%s is mindcontrolled!",
	mindcontrol_message_you = "You are mindcontrolled!",
	mindcontrol_bar = "MC: %s",
	addmsg = "%d/2 Flamewaker Protectors dead!",

	bar1text = "Lucifron's Curse",
	bar2text = "Impending Doom",
	bar3text = "Shadow Shock",

	cmd = "Lucifron",
	
	adds_cmd = "adds",
	adds_name = "Dead adds counter",
	adds_desc = "Announces dead Flamewaker Protectors",
	
	mc_cmd = "mc",
	mc_name = "Dominate Mind",
	mc_desc = "Alert when someone is mind controlled.",
	
	curse_cmd = "curse",
	curse_name = "Lucifron's Curse alert",
	curse_desc = "Warn for Lucifron's Curse",
	
	doom_cmd = "doom",
	doom_name = "Impending Doom alert",
	doom_desc = "Warn for Impending Doom",
	
	shock_cmd = "shock",
	shock_name = "Shadow Shock alert",
	shock_desc  = "Warn for Shadow Shock",
} end)

L:RegisterTranslations("deDE", function() return {
	trigger1 = "von Lucifrons Fluch betroffen",
	trigger2 = "von Drohender Verdammnis betroffen",
	trigger3 = "Schattenschock trifft",
	trigger4 = "Schattenschock(.+) widerstanden",
	trigger5 = "Lucifrons Fluch(.+) widerstanden",
	trigger6 = "Drohende Verdammnis(.+) widerstanden",
	
	warn1 = "5 Sekunden bis Lucifrons Fluch!",
	warn2 = "Lucifrons Fluch - 20 Sekunden bis zu n\195\164chsten!",
	warn3 = "5 Sekunden bis Drohende Verdammnis!",
	warn4 = "Drohende Verdammnis - 20 Sekunden bis zu n\195\164chsten!",
	mindcontrolyou_trigger = "Ihr seid von Gedanken beherrschen betroffen.",
	mindcontrolother_trigger = "(.*) ist von Gedanken beherrschen betroffen.",
	mindcontrolyouend_trigger = "Gedanken beherrschen\' schwindet von Euch.",
	mindcontrolotherend_trigger = "Gedanken beherrschen schwindet von (.*).",
	deathyou_trigger = "Du stirbst.",
	deathother_trigger = "(.*) stirbt.",
	deadaddtrigger = "Besch\195\188tzer der Flammensch\195\188rer stirbt.",
	deadbosstrigger = "Lucifron stirbt",
	add_name = "Flamewaker Protector",
	
	mindcontrol_message = "%s ist ferngesteuert!",
	mindcontrol_message_you = "Du bist ferngesteuert!",
	mindcontrol_bar = "GK: %s",
	addmsg = "%d/2 Flamewaker Protector tot!",

	bar1text = "Lucifrons Fluch",
	bar2text = "Drohende Verdammnis",
	bar3text = "Schattenschock",

	cmd = "Lucifron",

	adds_cmd = "adds",
	adds_name = "Z\195\164hler f\195\188r tote Adds",
	adds_desc = "Verk\195\188ndet Flamewaker Protectors Tod",
	
	mc_cmd = "mc",
	mc_name = "Gedankenkontrolle",
	mc_desc = "Warnen, wenn jemand \195\188bernommen ist",
	
	curse_cmd = "curse",
	curse_name = "Alarm f\195\188r Lucifrons Fluch",
	curse_desc = "Warnen vor Lucifrons Fluch",
	
	doom_cmd = "doom",
	doom_name = "Alarm f\195\188r Drohende Verdammnis",
	doom_desc = "Warnen vor Drohender Verdammnis",
	
	shock_cmd = "shock",
	shock_name = "Alarm f\195\188r Schattenschock ",
	shock_desc  = "Warnen vor Schattenschock",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsLucifron = BigWigs:NewModule(boss)
BigWigsLucifron.zonename = AceLibrary("Babble-Zone-2.2")["Molten Core"]
BigWigsLucifron.enabletrigger = boss
BigWigsLucifron.wipemobs = { L["add_name"] }
BigWigsLucifron.toggleoptions = { "adds", "curse", "doom", "shock", "mc", "bosskill"}
BigWigsLucifron.revision = tonumber(string.sub("$Revision: 11204 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsLucifron:OnEnable()
	protector = 0
	lucifrondead = 0
	firstdoom = 0
	firstcurse = 0
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "LucifronMC_(.*)", 0.5)
	self:TriggerEvent("BigWigs_ThrottleSync", "LucifronMCEnd_(.*)", 0.5)
	self:TriggerEvent("BigWigs_ThrottleSync", "LucifronCurseRep", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "LucifronCurseIni", 4)
	self:TriggerEvent("BigWigs_ThrottleSync", "LucifronShock", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "LucifronDoomRep", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "LucifronDoomIni", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "LucifronAddDead", 0.7)
	self:TriggerEvent("BigWigs_ThrottleSync", "LucifronAllDead", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "LucifronLucifronDead", 3)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsLucifron:Event(msg)
	local _,_,mindcontrolother,_ = string.find(msg, L["mindcontrolother_trigger"])
	local _,_,mindcontrolotherend,_ = string.find(msg, L["mindcontrolotherend_trigger"])
	local _,_,mindcontrolotherdeath,_ = string.find(msg, L["deathother_trigger"])
	if ((string.find(msg, L["trigger1"])) or (string.find(msg, L["trigger5"]))) then
		self:TriggerEvent("BigWigs_SendSync", "LucifronCurseRep")
	elseif ((string.find(msg, L["trigger2"])) or (string.find(msg, L["trigger6"]))) then
		self:TriggerEvent("BigWigs_SendSync", "LucifronDoomRep")
	elseif ((string.find(msg, L["trigger3"])) or (string.find(msg, L["trigger4"]))) then
		self:TriggerEvent("BigWigs_SendSync", "LucifronShock")
	elseif string.find(msg, L["mindcontrolyou_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "LucifronMC_"..UnitName("player"))
	elseif string.find(msg, L["mindcontrolyouend_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "LucifronMCEnd_"..UnitName("player"))
	elseif string.find(msg, L["deathyou_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "LucifronMCEnd_"..UnitName("player"))
	elseif mindcontrolother then
		self:TriggerEvent("BigWigs_SendSync", "LucifronMC_"..mindcontrolother)
	elseif mindcontrolotherend then
		self:TriggerEvent("BigWigs_SendSync", "LucifronMCEnd_"..mindcontrolotherend)
	elseif mindcontrolotherdeath then
		self:TriggerEvent("BigWigs_SendSync", "LucifronMCEnd_"..mindcontrolotherdeath)
	end
end

function BigWigsLucifron:BigWigs_RecvSync(sync)
	--DEFAULT_CHAT_FRAME:AddMessage("Received sync: "..sync)
	if sync == self:GetEngageSync("Lucifron") then
		if firstcurse == 0 then
			self:TriggerEvent("BigWigs_SendSync", "LucifronCurseIni")
		end
		if firstdoom == 0 then
			self:TriggerEvent("BigWigs_SendSync", "LucifronDoomIni")
		end
		self:TriggerEvent("BigWigs_SendSync", "LucifronShock")
	elseif sync == "LucifronCurseRep" and self.db.profile.curse then
		self:ScheduleEvent("messagewarn1", "BigWigs_Message", 15, L["warn1"], "Attention")
		self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 20, "Interface\\Icons\\Spell_Shadow_BlackPlague")
	elseif sync == "LucifronCurseIni" then
		firstcurse = 1
		if self.db.profile.curse then
			self:ScheduleEvent("messagewarn4", "BigWigs_Message", 15, L["warn1"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 20, "Interface\\Icons\\Spell_Shadow_BlackPlague")
		end
	elseif sync == "LucifronDoomIni" then
		firstdoom = 1
		if self.db.profile.doom then
			self:ScheduleEvent("messagewarn3", "BigWigs_Message", 5, L["warn3"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["bar2text"], 10, "Interface\\Icons\\Spell_Shadow_NightOfTheDead")
		end
	elseif sync == "LucifronDoomRep" and self.db.profile.doom then
		self:ScheduleEvent("messagewarn2", "BigWigs_Message", 15, L["warn3"], "Attention")
		self:TriggerEvent("BigWigs_StartBar", self, L["bar2text"], 20, "Interface\\Icons\\Spell_Shadow_NightOfTheDead")
	elseif sync == "LucifronShock" and self.db.profile.shock then
		self:TriggerEvent("BigWigs_StartBar", self, L["bar3text"], 6, "Interface\\Icons\\Spell_Shadow_Shadowbolt")
	elseif string.find(sync, "LucifronMC_") then
		if self.db.profile.mc then
			chosenone = string.sub(sync,12)
			if chosenone == UnitName("player") then
				self:TriggerEvent("BigWigs_StartBar", self, string.format(L["mindcontrol_bar"], UnitName("player")), 15, "Interface\\Icons\\Spell_Shadow_ShadowWordDominate")
				self:TriggerEvent("BigWigs_Message", L["mindcontrol_message_you"], "Attention")
			else
				self:TriggerEvent("BigWigs_StartBar", self, string.format(L["mindcontrol_bar"], chosenone), 15, "Interface\\Icons\\Spell_Shadow_ShadowWordDominate")
				self:TriggerEvent("BigWigs_Message", string.format(L["mindcontrol_message"], chosenone), "Urgent")
			end
		end
	elseif string.find(sync, "LucifronMCEnd_") then
		if self.db.profile.mc then
			luckyone = string.sub(sync,15)
			self:TriggerEvent("BigWigs_StopBar", self, string.format(L["mindcontrol_bar"], luckyone))
		end
	elseif sync == "LucifronAddDead" then
		protector = protector + 1
		if self.db.profile.adds then
			self:TriggerEvent("BigWigs_Message", string.format(L["addmsg"], protector), "Positive")
		end
		if ((protector == 2) and (lucifrondead == 1)) then
			self:TriggerEvent("BigWigs_SendSync", "LucifronAllDead")
		end
	elseif sync == "LucifronLucifronDead" then
		self:CancelScheduledEvent("messagewarn1")
		self:CancelScheduledEvent("messagewarn2")
		self:CancelScheduledEvent("messagewarn3")
		self:CancelScheduledEvent("messagewarn4")
		self:TriggerEvent("BigWigs_StopBar", self, L["bar1text"])
		self:TriggerEvent("BigWigs_StopBar", self, L["bar2text"])
		self:TriggerEvent("BigWigs_StopBar", self, L["bar3text"])
		lucifrondead = 1
		if self.db.profile.bosskill then
			self:TriggerEvent("BigWigs_Message", string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], self:ToString()), "Bosskill", nil, "Victory")
		end
		if ((protector == 2) and (lucifrondead == 1)) then
			self:TriggerEvent("BigWigs_SendSync", "LucifronAllDead")
		end
	elseif sync == "LucifronAllDead" then
		self:TriggerEvent("BigWigs_RemoveRaidIcon")
		self.core:ToggleModuleActive(self, false)
	end
end

function BigWigsLucifron:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if string.find(msg, L["deadaddtrigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "LucifronAddDead")
	elseif string.find(msg, L["deadbosstrigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "LucifronLucifronDead")
	end
end
