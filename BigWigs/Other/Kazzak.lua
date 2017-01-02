------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Lord Kazzak"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local supremetime = 180

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Kazzak",

	starttrigger1 = "All mortals will perish!",
	starttrigger2 = "The Legion will conquer all!",
	markofkazzakyou_trigger = "You are afflicted by Mark of Kazzak.",
	markofkazzakother_trigger = "(.*) is afflicted by Mark of Kazzak.",
	markofkazzakyouend_trigger = "Mark of Kazzak fades from you.",
	markofkazzakotherend_trigger = "Mark of Kazzak fades from (.*).",
	twistedreflectionyou_trigger = "You are afflicted by Twisted Reflection.",
	twistedreflectionother_trigger = "(.*) is afflicted by Twisted Reflection.",
	twistedreflectionyouend_trigger = "Twisted Reflection fades from you.",
	twistedreflectionotherend_trigger = "Twisted Reflection fades from (.*).",
	deathyou_trigger = "You die\.",
	deathother_trigger = "(.*) dies.",
	voidbolt_trigger = "Lord Kazzak begins to cast Void Bolt.",
	attack_trigger1 = "Lord Kazzak attacks",
	attack_trigger2 = "Lord Kazzak misses",
	attack_trigger3 = "Lord Kazzak hits",
	attack_trigger4 = "Lord Kazzak crits",
	enrage_trigger = "Lord Kazzak gains Berserk.",
	enrageyell_trigger = "Kazzak is supreme!",
	bosskill_trigger = "The Legion... will never... fall.",

	engagewarn = "Lord Kazzak engaged! 3mins until Supreme!",
	enrage_warm = "Lord Kazzak is supreme!",
	makrofkazzak_warn = "%s has Mark of Kazzak! Decurse!",
	twistedreflection_warn = "%s has Twisted Reflection! Dispel!",
	mark_message_you = "You have Mark of Kazzak! Don't go out of mana!",
	reflection_message_you = "You have Twisted Reflection!",
	corruptsoul_warn = "%s has healed Lord Kazzak by dying!",
	corruptsoul_warn_you = "You have healed Lord Kazzak by dying!",

	supreme1min = "Supreme mode in 1 minute!",
	supreme30sec = "Supreme mode in 30 seconds!",
	supreme10sec = "Supreme mode in 10 seconds!",

	enrage_bar = "Supreme mode",
	voidbolt_bar = "Void Bolt",
	mark_bar = "%s: Mark of Kazzak",
	twisted_bar = "%s: Twisted Reflection",

	supreme_cmd = "supreme",
	supreme_name = "Supreme Alert",
	supreme_desc = "Warn for Supreme Mode.",

	voidbolt_cmd = "voidbolt",
	voidbolt_name = "Void Bolt",
	voidbolt_desc = "Show notifications for Void Bolt.",

	corruptsoul_cmd = "corruptsoul",
	corruptsoul_name = "Corrupt Soul",
	corruptsoul_desc = "Warn when boss gets healed from random deaths.",

	markofkazzak_cmd = "markofkazzak",
	markofkazzak_name = "Mark of Kazzak",
	markofkazzak_desc = "Warn when people get the mana drain debuff from the boss.",
	
	twistedreflection_cmd = "twistedreflection",
	twistedreflection_name = "Twisted Reflection",
	twistedreflection_desc = "Warn when people get the debuff that heals the boss for 25000 HP each time it hits them.",

	puticon_cmd = "puticon",
	puticon_name = "Raid Icon on Mark target",
	puticon_desc = "Put a Raid Icon on the person who got Mark of Kazzak.\n\n(Requires assistant or higher)",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsKazzak = BigWigs:NewModule(boss)
BigWigsKazzak.zonename = { AceLibrary("AceLocale-2.2"):new("BigWigs")["Outdoor Raid Bosses Zone"], AceLibrary("Babble-Zone-2.2")["Blasted Lands"] }
BigWigsKazzak.enabletrigger = boss
BigWigsKazzak.toggleoptions = {"markofkazzak", "puticon", "twistedreflection", "voidbolt", "corruptsoul", "supreme", "bosskill"}
BigWigsKazzak.revision = tonumber(string.sub("$Revision: 11202 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsKazzak:OnEnable()
	voidbolttime = 0
	castingvoidbolt = false
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "EventSelf")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "EventSelf")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "LordKazzakMarkStart", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "LordKazzakMarkStop", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "LordKazzakReflectionStart", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "LordKazzakReflectionStop", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "LordKazzakVoidBoltStart", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "LordKazzakVoidBoltStop", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "LordKazzakSupreme", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "LordKazzakDead", 5)
end

function BigWigsKazzak:CHAT_MSG_COMBAT_FRIENDLY_DEATH(msg)
	local _,_,otherdeath,_ = string.find(msg, L["deathother_trigger"])
	if msg == L["deathyou_trigger"] then
		if self.db.profile.markofkazzak then
			self:TriggerEvent("BigWigs_StopBar", self, string.format(L["mark_bar"], UnitName("player")))
		end
		if self.db.profile.puticon then
			self:TriggerEvent("BigWigs_RemoveRaidIcon")
		end
		if self.db.profile.twistedreflection then
			self:TriggerEvent("BigWigs_StopBar", self, string.format(L["twisted_bar"], UnitName("player")))
		end
		if self.db.profile.corruptsoul then
			self:TriggerEvent("BigWigs_Message", L["corruptsoul_warn_you"], "Attention")
		end
		self:TriggerEvent("BigWigs_SendSync", "LordKazzakRandomDeath "..UnitName("player"))
	elseif otherdeath then
		self:TriggerEvent("BigWigs_SendSync", "LordKazzakRandomDeath "..otherdeath)
	end
end

function BigWigsKazzak:CHAT_MSG_MONSTER_YELL(msg)
	if self.db.profile.supreme and msg == L["starttrigger1"] or msg == L["starttrigger2"] then 
		self:TriggerEvent("BigWigs_Message", L["engagewarn"], "Important")
		self:ScheduleEvent("BigWigs_Message", supremetime - 60, L["supreme1min"], "Attention")
		self:ScheduleEvent("BigWigs_Message", supremetime - 30, L["supreme30sec"], "Urgent")
		self:ScheduleEvent("BigWigs_Message", supremetime - 10, L["supreme10sec"], "Important")
		self:TriggerEvent("BigWigs_StartBar", self, L["enrage_bar"], supremetime, "Interface\\Icons\\Spell_Shadow_ShadowWordPain", "Green", "Yellow", "Orange", "Red")
	elseif self.db.profile.supreme and msg == L["enrageyell_trigger"] then
		self:TriggerEvent("BigWigs_Message", L["enrage_warm"], "Important")
	elseif msg == L["bosskill_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "LordKazzakDead")
	end
end

function BigWigsKazzak:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["voidbolt_trigger"] then 
		self:TriggerEvent("BigWigs_SendSync", "LordKazzakVoidBoltStart")
	end
end

function BigWigsKazzak:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg == L["enrage_trigger"] then 
		self:TriggerEvent("BigWigs_SendSync", "LordKazzakSupreme")
	end
end

function BigWigsKazzak:EventSelf(msg)
	if string.find(msg, L["markofkazzakyou_trigger"]) then
		if self.db.profile.markofkazzak then
			self:TriggerEvent("BigWigs_Message", L["mark_message_you"], "Attention", true, "Alert")
			self:TriggerEvent("BigWigs_StartBar", self, string.format(L["mark_bar"], UnitName("player")), 10, "Interface\\Icons\\Spell_Shadow_Antishadow", true, "white")
		end
		if self.db.profile.puticon then
			self:TriggerEvent("BigWigs_SetRaidIcon", UnitName("player"))
		end
		self:TriggerEvent("BigWigs_SendSync", "LordKazzakMarkStart "..UnitName("player"))
	elseif string.find(msg, L["markofkazzakyouend_trigger"]) then
		if self.db.profile.markofkazzak then
			self:TriggerEvent("BigWigs_StopBar", self, string.format(L["mark_bar"], UnitName("player")))
		end
		if self.db.profile.puticon then
			self:TriggerEvent("BigWigs_RemoveRaidIcon")
		end
		self:TriggerEvent("BigWigs_SendSync", "LordKazzakMarkStop "..UnitName("player"))
	elseif string.find(msg, L["twistedreflectionyou_trigger"]) then
		if self.db.profile.twistedreflection then
			self:TriggerEvent("BigWigs_Message", L["reflection_message_you"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, string.format(L["twisted_bar"], UnitName("player")), 45, "Interface\\Icons\\Spell_Arcane_PortalDarnassus", true, "magenta")
		end
		self:TriggerEvent("BigWigs_SendSync", "LordKazzakReflectionStart "..UnitName("player"))
	elseif string.find(msg, L["twistedreflectionyouend_trigger"]) then
		if self.db.profile.twistedreflection then
			self:TriggerEvent("BigWigs_StopBar", self, string.format(L["twisted_bar"], UnitName("player")))
		end
		self:TriggerEvent("BigWigs_SendSync", "LordKazzakReflectionStop "..UnitName("player"))
	end
end

function BigWigsKazzak:Event(msg)
	local _,_,markofkazzakother,_ = string.find(msg, L["markofkazzakother_trigger"])
	local _,_,markofkazzakotherend,_ = string.find(msg, L["markofkazzakotherend_trigger"])
	local _,_,twistedreflectionother,_ = string.find(msg, L["twistedreflectionother_trigger"])
	local _,_,twistedreflectionotherend,_ = string.find(msg, L["twistedreflectionotherend_trigger"])
	if markofkazzakother then
		self:TriggerEvent("BigWigs_SendSync", "LordKazzakMarkStart "..markofkazzakother)
	elseif markofkazzakotherend then
		self:TriggerEvent("BigWigs_SendSync", "LordKazzakMarkStop "..markofkazzakotherend)
	elseif twistedreflectionother then
		self:TriggerEvent("BigWigs_SendSync", "LordKazzakReflectionStart "..twistedreflectionother)
	elseif twistedreflectionotherend then
		self:TriggerEvent("BigWigs_SendSync", "LordKazzakReflectionStop "..twistedreflectionotherend)
	end
end

function BigWigsKazzak:BigWigs_RecvSync(sync, rest, nick)
	if sync == "LordKazzakMarkStart" and rest ~= UnitName("player") then
		if self.db.profile.markofkazzak then
		    self:TriggerEvent("BigWigs_Message", string.format(L["makrofkazzak_warn"], rest), "Important")
			self:TriggerEvent("BigWigs_SendTell", rest, L["mark_message_you"])
			self:TriggerEvent("BigWigs_StartBar", self, string.format(L["mark_bar"], rest), 10, "Interface\\Icons\\Spell_Shadow_Antishadow", true, "white")
		end
		if self.db.profile.puticon then
			self:TriggerEvent("BigWigs_SetRaidIcon", rest)
		end
	elseif sync == "LordKazzakMarkStop" and rest ~= UnitName("player") then
		if self.db.profile.markofkazzak then
			self:TriggerEvent("BigWigs_StopBar", self, string.format(L["mark_bar"], rest))
		end
		if self.db.profile.puticon then
			self:TriggerEvent("BigWigs_RemoveRaidIcon")
		end
	elseif sync == "LordKazzakReflectionStart" and rest ~= UnitName("player") then
		if self.db.profile.twistedreflection then
			self:TriggerEvent("BigWigs_Message", string.format(L["twistedreflection_warn"], rest), "Important")
			self:TriggerEvent("BigWigs_StartBar", self, string.format(L["twisted_bar"], rest), 45, "Interface\\Icons\\Spell_Arcane_PortalDarnassus", true, "magenta")
		end
	elseif sync == "LordKazzakReflectionStop" and rest ~= UnitName("player") then
		if self.db.profile.twistedreflection then
			self:TriggerEvent("BigWigs_StopBar", self, string.format(L["twisted_bar"], rest))
		end
	elseif sync == "LordKazzakRandomDeath" and rest ~= UnitName("player") then
		if self.db.profile.markofkazzak then
			self:TriggerEvent("BigWigs_StopBar", self, string.format(L["mark_bar"], rest))
		end
		if self.db.profile.puticon then
			self:TriggerEvent("BigWigs_RemoveRaidIcon")
		end
		if self.db.profile.twistedreflection then
			self:TriggerEvent("BigWigs_StopBar", self, string.format(L["twisted_bar"], rest))
		end
		if self.db.profile.corruptsoul then
			self:TriggerEvent("BigWigs_Message", string.format(L["corruptsoul_warn"], rest), "Important")
		end
	elseif sync == "LordKazzakVoidBoltStart" then
		voidbolttime = GetTime()
		castingvoidbolt = true
		if self.db.profile.voidbolt then
			self:TriggerEvent("BigWigs_StartBar", self, L["voidbolt_bar"], 1.5, "Interface\\Icons\\Spell_Shadow_Haunting", true, "purple")
		end
	elseif sync == "LordKazzakVoidBoltStop" then
		castingvoidbolt = false
		if self.db.profile.voidbolt then
			self:TriggerEvent("BigWigs_StopBar", self, L["voidbolt_bar"])
		end
	elseif sync == "LordKazzakSupreme" and self.db.profile.supreme then
		self:TriggerEvent("BigWigs_Message", L["voidbolt_bar"], "Important")
	elseif sync == "LordKazzakDead" then
		if self.db.profile.bosskill then
			self:TriggerEvent("BigWigs_Message", string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], boss), "Bosskill", nil, "Victory")
		end
		self:TriggerEvent("BigWigs_RemoveRaidIcon")
		self.core:ToggleModuleActive(self, false)
	end
end

function BigWigsKazzak:Melee(msg)
	if string.find(msg, L["attack_trigger1"]) or string.find(msg, L["attack_trigger2"]) or string.find(msg, L["attack_trigger3"]) or string.find(msg, L["attack_trigger4"]) then
		if castingvoidbolt then 
			if (GetTime() - voidbolttime) < 1.5 then
				self:TriggerEvent("BigWigs_SendSync", "LordKazzakVoidBoltStop")
			elseif (GetTime() - voidbolttime) >= 1.5 then
				castingvoidbolt = false
			end
		end
	end
end
