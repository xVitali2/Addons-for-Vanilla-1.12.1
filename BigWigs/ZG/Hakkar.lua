------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Hakkar"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	engage_trigger = "FACE THE WRATH OF THE SOULFLAYER!",
	siphon_trigger = "Hakkar gains Blood Siphon.",
	mindcontrolyou_trigger = "You are afflicted by Cause Insanity.",
	mindcontrolother_trigger = "(.+) is afflicted by Cause Insanity.",
	flee_trigger = "Fleeing will do you no good, mortals!",
	aspectofthekal_trigger = "Hakkar gains Aspect of Thekal.",
	aspectofthekalend_trigger = "Aspect of Thekal fades from Hakkar.",
	aspectofmarliyou_trigger = "You are afflicted by Aspect of Mar'li.",
	aspectofmarliyouimmune_trigger = "Hakkar 's Aspect of Mar'li failed. You are immune.",
	aspectofmarliother_trigger = "(.+) is afflicted by Aspect of Mar'li.",
	aspectofmarliotherimmune_trigger = "Hakkar 's Aspect of Mar'li fails. (.+) is immune.",
	aspectofmarligeneralavoid_trigger = "Hakkar 's Aspect of Mar'li",
	aspectofjeklikyou_trigger = "You are afflicted by Aspect of Jeklik.",
	aspectofjeklikyouimmune_trigger = "Hakkar 's Aspect of Jeklik failed. You are immune.",
	aspectofjeklikother_trigger = "(.+) is afflicted by Aspect of Jeklik.",
	aspectofjeklikotherimmune_trigger = "Hakkar 's Aspect of Jeklik fails. (.+) is immune.",
	aspectofjeklikgeneralavoid_trigger = "Hakkar 's Aspect of Jeklik",
	aspectofarlokkyou_trigger = "You are afflicted by Aspect of Arlokk.",
	aspectofarlokkyouimmune_trigger = "Hakkar 's Aspect of Arlokk failed. You are immune.",
	aspectofarlokkother_trigger = "(.+) is afflicted by Aspect of Arlokk.",
	aspectofarlokkotherimmune_trigger = "Hakkar 's Aspect of Arlokk fails. (.+) is immune.",
	aspectofarlokkgeneralavoid_trigger = "Hakkar 's Aspect of Arlokk",
	aspectofvenoxisyou_trigger = "Hakkar 's Aspect of Venoxis hits you for",
	aspectofvenoxisyouresist_trigger = "Hakkar 's Aspect of Venoxis was resisted.",
	aspectofvenoxisother_trigger = "Hakkar 's Aspect of Venoxis hits",
	aspectofvenoxisotherresist_trigger = "Hakkar 's Aspect of Venoxis was resisted by",

	siphon_warning = "Blood Siphon in %d seconds!",
	siphon_message = "Blood Siphon - next one in 90 seconds!",
	enrage5minutes_message = "Enrage in 5 minutes!",
	enrage1minute_message = "Enrage in 1 minute!",
	enrageseconds_message = "Enrage in %d seconds!",

	mindcontrol_message = "%s is mindcontrolled!",
	mindcontrol_message_you = "You are mindcontrolled!",
	mindcontrol_bar = "MC: %s",
	firstmc_bar = "First MC",
	nextmc_bar = "Next MC",
	enrage_bar = "Enrage",
	siphon_bar = "Blood Siphon",
	aspectthekalnext_bar = "Next Frenzy",
	aspectthekal_bar = "Frenzy - Aspect of Thekal",
	aspectthekal_ann = "Frenzy! Tranq now!",
	aspectmarli_bar = "Next Stun",
	aspectmarlidebuff_bar = "Stun: %s - Aspect of Mar'li",
	aspectjeklik_bar = "Next Silence",
	aspectjeklikdebuff_bar = "Silence - Aspect of Jeklik",
	aspectarlokk_bar = "Next Vanish",
	aspectarlokkdebuff_bar = "Vanish: %s - Aspect of Arlokk",
	aspectvenoxis_bar = "Next Poison",
	aspectvenoxisdebuff_bar = "Poison - Aspect of Venoxis",

	cmd = "Hakkar",

	siphon_cmd = "siphon",
	siphon_name = "Blood Siphon",
	siphon_desc = "Shows bars, warnings and timers for Hakkar's Blood Siphon.",

	enrage_cmd = "enrage",
	enrage_name = "Enrage",
	enrage_desc = "Lets you know when the 10 minutes are up!",

	mc_cmd = "mc",
	mc_name = "Mind Control",
	mc_desc = "Alert when players have Cause Insanity.",
	
	aspectjeklik_cmd = "aspectjeklik",
	aspectjeklik_name = "Aspect of Jeklik",
	aspectjeklik_desc = "Warnings for the extra ability Hakkar gains when High Priestess Jeklik is still alive.",
	
	aspectvenoxis_cmd = "aspectvenoxis",
	aspectvenoxis_name = "Aspect of Venoxis",
	aspectvenoxis_desc = "Warnings for the extra ability Hakkar gains when High Priest Venoxis is still alive.",
	
	aspectmarli_cmd = "aspectmarli",
	aspectmarli_name = "Aspect of Mar'li",
	aspectmarli_desc = "Warnings for the extra ability Hakkar gains when High Priestess Mar'li is still alive.",
	
	aspectthekal_cmd = "aspectthekal",
	aspectthekal_name = "Aspect of Thekal",
	aspectthekal_desc = "Warnings for the extra ability Hakkar gains when High Priest Thekal is still alive.",

	aspectarlokk_cmd = "aspectarlokk",
	aspectarlokk_name = "Aspect of Arlokk",
	aspectarlokk_desc = "Warnings for the extra ability Hakkar gains when High Priestess Arlokk is still alive.",
	
	puticon_cmd = "puticon",
	puticon_name = "Raid icon on MCed players",
	puticon_desc = "Place a raid icon on the player with Cause Insanity.\n\n(Requires assistant or higher)",
} end)

L:RegisterTranslations("deDE", function() return {
	engage_trigger = "FACE THE WRATH OF THE SOULFLAYER!",
	siphon_trigger = "Hakkar gains Blood Siphon.",
	mindcontrolyou_trigger = "You are afflicted by Cause Insanity.",
	mindcontrolother_trigger = "(.+) is afflicted by Cause Insanity.",
	flee_trigger = "Fleeing will do you no good, mortals!",
	aspectofthekal_trigger = "Hakkar gains Aspect of Thekal.",
	aspectofthekalend_trigger = "Aspect of Thekal fades from Hakkar.",
	aspectofmarliyou_trigger = "You are afflicted by Aspect of Mar'li.",
	aspectofmarliyouimmune_trigger = "Hakkar 's Aspect of Mar'li failed. You are immune.",
	aspectofmarliother_trigger = "(.+) is afflicted by Aspect of Mar'li.",
	aspectofmarliotherimmune_trigger = "Hakkar 's Aspect of Mar'li fails. (.+) is immune.",
	aspectofmarligeneralavoid_trigger = "Hakkar 's Aspect of Mar'li",
	aspectofjeklikyou_trigger = "You are afflicted by Aspect of Jeklik.",
	aspectofjeklikyouimmune_trigger = "Hakkar 's Aspect of Jeklik failed. You are immune.",
	aspectofjeklikother_trigger = "(.+) is afflicted by Aspect of Jeklik.",
	aspectofjeklikotherimmune_trigger = "Hakkar 's Aspect of Jeklik fails. (.+) is immune.",
	aspectofjeklikgeneralavoid_trigger = "Hakkar 's Aspect of Jeklik",
	aspectofarlokkyou_trigger = "You are afflicted by Aspect of Arlokk.",
	aspectofarlokkyouimmune_trigger = "Hakkar 's Aspect of Arlokk failed. You are immune.",
	aspectofarlokkother_trigger = "(.+) is afflicted by Aspect of Arlokk.",
	aspectofarlokkotherimmune_trigger = "Hakkar 's Aspect of Arlokk fails. (.+) is immune.",
	aspectofarlokkgeneralavoid_trigger = "Hakkar 's Aspect of Arlokk",
	aspectofvenoxisyou_trigger = "Hakkar 's Aspect of Venoxis hits you for",
	aspectofvenoxisyouresist_trigger = "Hakkar 's Aspect of Venoxis was resisted.",
	aspectofvenoxisother_trigger = "Hakkar 's Aspect of Venoxis hits",
	aspectofvenoxisotherresist_trigger = "Hakkar 's Aspect of Venoxis was resisted by",

	siphon_warning = "Blood Siphon in %d seconds!",
	siphon_message = "Blood Siphon - next one in 90 seconds!",
	enrage5minutes_message = "Enrage in 5 minutes!",
	enrage1minute_message = "Enrage in 1 minute!",
	enrageseconds_message = "Enrage in %d seconds!",

	mindcontrol_message = "%s is mindcontrolled!",
	mindcontrol_message_you = "You are mindcontrolled!",
	mindcontrol_bar = "MC: %s",
	firstmc_bar = "First MC",
	nextmc_bar = "Next MC",
	enrage_bar = "Enrage",
	siphon_bar = "Blood Siphon",
	aspectthekalnext_bar = "Next Frenzy",
	aspectthekal_bar = "Frenzy - Aspect of Thekal",
	aspectthekal_ann = "Frenzy! Tranq now!",
	aspectmarli_bar = "Next Stun",
	aspectmarlidebuff_bar = "Stun: %s - Aspect of Mar'li",
	aspectjeklik_bar = "Next Silence",
	aspectjeklikdebuff_bar = "Silence - Aspect of Jeklik",
	aspectarlokk_bar = "Next Vanish",
	aspectarlokkdebuff_bar = "Vanish: %s - Aspect of Arlokk",
	aspectvenoxis_bar = "Next Poison",
	aspectvenoxisdebuff_bar = "Poison - Aspect of Venoxis",

	cmd = "Hakkar",

	siphon_cmd = "siphon",
	siphon_name = "Blood Siphon",
	siphon_desc = "Shows bars, warnings and timers for Hakkar's Blood Siphon.",

	enrage_cmd = "enrage",
	enrage_name = "Enrage",
	enrage_desc = "Lets you know when the 10 minutes are up!",

	mc_cmd = "mc",
	mc_name = "Mind Control",
	mc_desc = "Alert when players have Cause Insanity.",
	
	aspectjeklik_cmd = "aspectjeklik",
	aspectjeklik_name = "Aspect of Jeklik",
	aspectjeklik_desc = "Warnings for the extra ability Hakkar gains when High Priestess Jeklik is still alive.",
	
	aspectvenoxis_cmd = "aspectvenoxis",
	aspectvenoxis_name = "Aspect of Venoxis",
	aspectvenoxis_desc = "Warnings for the extra ability Hakkar gains when High Priest Venoxis is still alive.",
	
	aspectmarli_cmd = "aspectmarli",
	aspectmarli_name = "Aspect of Mar'li",
	aspectmarli_desc = "Warnings for the extra ability Hakkar gains when High Priestess Mar'li is still alive.",
	
	aspectthekal_cmd = "aspectthekal",
	aspectthekal_name = "Aspect of Thekal",
	aspectthekal_desc = "Warnings for the extra ability Hakkar gains when High Priest Thekal is still alive.",

	aspectarlokk_cmd = "aspectarlokk",
	aspectarlokk_name = "Aspect of Arlokk",
	aspectarlokk_desc = "Warnings for the extra ability Hakkar gains when High Priestess Arlokk is still alive.",
	
	puticon_cmd = "puticon",
	puticon_name = "Raid icon on MCed players",
	puticon_desc = "Place a raid icon on the player with Cause Insanity.\n\n(Requires assistant or higher)",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsHakkar = BigWigs:NewModule(boss)
BigWigsHakkar.zonename = AceLibrary("Babble-Zone-2.2")["Zul'Gurub"]
BigWigsHakkar.enabletrigger = boss
BigWigsHakkar.toggleoptions = { "mc", "puticon", "siphon", "enrage", -1, "aspectjeklik", "aspectvenoxis", "aspectmarli", "aspectthekal", "aspectarlokk", "bosskill" }
BigWigsHakkar.revision = tonumber(string.sub("$Revision: 11201 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsHakkar:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Self")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Self")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Others")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Others")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("BigWigs_RecvSync");
	self:TriggerEvent("BigWigs_ThrottleSync", "HakkarBloodSiphon", 5);
	self:TriggerEvent("BigWigs_ThrottleSync", "HakkarAspectJeklik", 5);
	self:TriggerEvent("BigWigs_ThrottleSync", "HakkarAspectArlokk", 5);
	self:TriggerEvent("BigWigs_ThrottleSync", "HakkarAspectArlokkAvoid", 5);
	self:TriggerEvent("BigWigs_ThrottleSync", "HakkarAspectVenoxis", 5);
	self:TriggerEvent("BigWigs_ThrottleSync", "HakkarAspectMarli", 5);
	self:TriggerEvent("BigWigs_ThrottleSync", "HakkarAspectMarliAvoid", 5);
	self:TriggerEvent("BigWigs_ThrottleSync", "HakkarAspectThekalStart", 5);
	self:TriggerEvent("BigWigs_ThrottleSync", "HakkarAspectThekalStop", 5);
	self:TriggerEvent("BigWigs_ThrottleSync", "HakkarMC", 5);
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsHakkar:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["engage_trigger"]) then
		if self.db.profile.enrage then
			self:TriggerEvent("BigWigs_StartBar", self, L["enrage_bar"], 600, "Interface\\Icons\\Spell_Shadow_UnholyFrenzy")
			self:ScheduleEvent("BigWigs_Message", 300, L["enrage5minutes_message"], "Urgent")
			self:ScheduleEvent("BigWigs_Message", 540, L["enrage1minute_message"], "Urgent")
			self:ScheduleEvent("BigWigs_Message", 570, string.format(L["enrageseconds_message"], 30), "Urgent")
			self:ScheduleEvent("BigWigs_Message", 590, string.format(L["enrageseconds_message"], 10), "Attention")
		end
		if self.db.profile.siphon then
			self:TriggerEvent("BigWigs_StartBar", self, L["siphon_bar"], 90, "Interface\\Icons\\Spell_Shadow_LifeDrain")
			self:ScheduleEvent("BigWigs_Message", 60, string.format(L["siphon_warning"], 30), "Urgent")
			self:ScheduleEvent("BigWigs_Message", 80, string.format(L["siphon_warning"], 10), "Attention")
		end
		if self.db.profile.mc then
			self:TriggerEvent("BigWigs_StartBar", self, L["firstmc_bar"], 17, "Interface\\Icons\\Spell_Shadow_ShadowWordDominate")
		end
	elseif msg == L["flee_trigger"] then
		self:TriggerEvent("BigWigs_RemoveRaidIcon")
		self:TriggerEvent("BigWigs_RebootModule", self)
	end
end

function BigWigsHakkar:CHAT_MSG_SPELL_AURA_GONE_OTHER(msg)
	if msg == L["aspectofthekalend_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectThekalStop")
	end
end

function BigWigsHakkar:Self(msg)
	if msg == L["mindcontrolyou_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "HakkarMC "..UnitName("player"))
	elseif msg == L["aspectofjeklikyou_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectJeklik")
	elseif msg == L["aspectofmarliyou_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectMarli "..UnitName("player"))
	elseif msg == L["aspectofarlokkyou_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectArlokk "..UnitName("player"))
	elseif string.find(msg, L["aspectofvenoxisyou_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectVenoxis")
	elseif msg == L["aspectofjeklikyouimmune_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectJeklik")
	elseif msg == L["aspectofmarliyouimmune_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectMarliAvoid")
	elseif msg == L["aspectofarlokkyouimmune_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectArlokkAvoid")
	elseif msg == L["aspectofvenoxisyouresist_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectVenoxis")
	elseif string.find(msg, L["aspectofjeklikgeneralavoid_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectJeklik")
	elseif string.find(msg, L["aspectofmarligeneralavoid_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectMarliAvoid")
	elseif string.find(msg, L["aspectofarlokkgeneralavoid_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectArlokkAvoid")
	end
end

function BigWigsHakkar:Others(msg)
	local _, _, aspectofmarliother, _ = string.find(msg, L["aspectofmarliother_trigger"])
	local _, _, aspectofmarliotherimmune, _ = string.find(msg, L["aspectofmarliotherimmune_trigger"])
	local _, _, aspectofjeklikother, _ = string.find(msg, L["aspectofjeklikother_trigger"])
	local _, _, aspectofjeklikotherimmune, _ = string.find(msg, L["aspectofjeklikotherimmune_trigger"])
	local _, _, aspectofarlokkother, _ = string.find(msg, L["aspectofarlokkother_trigger"])
	local _, _, aspectofarlokkotherimmune, _ = string.find(msg, L["aspectofarlokkotherimmune_trigger"])
	if aspectofmarliother then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectMarli "..aspectofmarliother)
	elseif aspectofmarliotherimmune then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectMarliAvoid")
	elseif string.find(msg, L["aspectofmarligeneralavoid_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectMarliAvoid")
	elseif aspectofjeklikother then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectJeklik")
	elseif aspectofjeklikotherimmune then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectJeklik")
	elseif string.find(msg, L["aspectofjeklikgeneralavoid_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectJeklik")
	elseif aspectofarlokkother then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectArlokk "..aspectofarlokkother)
	elseif aspectofarlokkotherimmune then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectArlokkAvoid")
	elseif string.find(msg, L["aspectofarlokkgeneralavoid_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectArlokkAvoid")
	elseif string.find(msg, L["aspectofvenoxisother_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectVenoxis")
	elseif string.find(msg, L["aspectofvenoxisotherresist_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectVenoxis")
	end
end

function BigWigsHakkar:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg == L["siphon_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "HakkarBloodSiphon")
	elseif string.find(msg, L["aspectofthekal_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "HakkarAspectThekalStart")
	end
end

function BigWigsHakkar:CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE(msg)
	local _, _, mindcontrolother, _ = string.find(msg, L["mindcontrolother_trigger"])
	if mindcontrolother then
		self:TriggerEvent("BigWigs_SendSync", "HakkarMC "..mindcontrolother)
	end
end

function BigWigsHakkar:BigWigs_RecvSync(sync, rest, nick)
	if sync == "HakkarBloodSiphon" then
		if self.db.profile.siphon then
			self:TriggerEvent("BigWigs_StartBar", self, L["siphon_bar"], 90, "Interface\\Icons\\Spell_Shadow_LifeDrain")
			self:ScheduleEvent("BigWigs_Message", 60, string.format(L["siphon_warning"], 30), "Urgent")
			self:ScheduleEvent("BigWigs_Message", 80, string.format(L["siphon_warning"], 10), "Attention")
		end
		if self.db.profile.aspectjeklik then
			self:TriggerEvent("BigWigs_StopBar", self, L["aspectjeklik_bar"])
		end
		if self.db.profile.aspectvenoxis then
			self:TriggerEvent("BigWigs_StopBar", self, L["aspectvenoxis_bar"])
		end
		if self.db.profile.aspectmarli then
			self:TriggerEvent("BigWigs_StopBar", self, L["aspectmarli_bar"])
		end
		if self.db.profile.aspectarlokk then
			self:TriggerEvent("BigWigs_StopBar", self, L["aspectarlokk_bar"])
		end
		if self.db.profile.aspectthekal then
			self:TriggerEvent("BigWigs_StopBar", self, L["aspectthekalnext_bar"])
		end
	elseif sync == "HakkarAspectJeklik" and self.db.profile.aspectjeklik then
		self:TriggerEvent("BigWigs_StartBar", self, L["aspectjeklik_bar"], 10, "Interface\\Icons\\Spell_Shadow_Teleport", true, "Orange")
		self:TriggerEvent("BigWigs_StartBar", self, L["aspectjeklikdebuff_bar"], 5, "Interface\\Icons\\Spell_Shadow_Teleport", true, "Orange")
	elseif sync == "HakkarAspectArlokk" and self.db.profile.aspectarlokk then
		self:TriggerEvent("BigWigs_StartBar", self, L["aspectarlokk_bar"], 10, "Interface\\Icons\\Ability_Vanish", true, "Blue")
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["aspectarlokkdebuff_bar"], rest), 2, "Interface\\Icons\\Ability_Vanish", true, "Blue")	
	elseif sync == "HakkarAspectArlokkAvoid" and self.db.profile.aspectarlokk then
		self:TriggerEvent("BigWigs_StartBar", self, L["aspectarlokk_bar"], 10, "Interface\\Icons\\Ability_Vanish", true, "Blue")
	elseif sync == "HakkarAspectVenoxis" and self.db.profile.aspectvenoxis then
		self:TriggerEvent("BigWigs_StartBar", self, L["aspectvenoxis_bar"], 8, "Interface\\Icons\\Spell_Nature_CorrosiveBreath", true, "Green")
		self:TriggerEvent("BigWigs_StartBar", self, L["aspectvenoxisdebuff_bar"], 10, "Interface\\Icons\\Spell_Nature_CorrosiveBreath", true, "Green")
	elseif sync == "HakkarAspectMarli" and self.db.profile.aspectmarli then
		self:TriggerEvent("BigWigs_StartBar", self, L["aspectmarli_bar"], 10, "Interface\\Icons\\Ability_Smash", true, "Yellow")
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["aspectmarlidebuff_bar"], rest), 6, "Interface\\Icons\\Ability_Smash", true, "Yellow")
	elseif sync == "HakkarAspectMarliAvoid" and self.db.profile.aspectmarli then
		self:TriggerEvent("BigWigs_StartBar", self, L["aspectmarli_bar"], 10, "Interface\\Icons\\Ability_Smash", true, "Yellow")
	elseif sync == "HakkarAspectThekalStart" and self.db.profile.aspectthekal then
		self:TriggerEvent("BigWigs_StartBar", self, L["aspectthekalnext_bar"], 15, "Interface\\Icons\\Ability_Druid_ChallangingRoar", true, "Black")
		self:TriggerEvent("BigWigs_StartBar", self, L["aspectthekal_bar"], 8, "Interface\\Icons\\Ability_Druid_ChallangingRoar", true, "Black")
		self:TriggerEvent("BigWigs_Message", L["aspectthekal_ann"], "Important", true, "Alarm")
	elseif sync == "HakkarAspectThekalStop" and self.db.profile.aspectthekal then
        self:TriggerEvent("BigWigs_StopBar", self, L["aspectthekal_bar"])
	elseif sync == "HakkarMC" then
		if self.db.profile.mc then
			self:TriggerEvent("BigWigs_StartBar", self, L["nextmc_bar"], 15, "Interface\\Icons\\Spell_Shadow_ShadowWordDominate")
			self:TriggerEvent("BigWigs_StartBar", self, string.format(L["mindcontrol_bar"], rest), 10, "Interface\\Icons\\Spell_Shadow_ShadowWordDominate", true, "White")
			if rest == UnitName("player") then
				self:TriggerEvent("BigWigs_Message", L["mindcontrol_message_you"], "Attention", true, "Alarm")
			else
				self:TriggerEvent("BigWigs_Message", string.format(L["mindcontrol_message"], rest), "Attention")
			end
		end
		if self.db.profile.puticon then
			self:TriggerEvent("BigWigs_SetRaidIcon", rest)
		end
	end
end
