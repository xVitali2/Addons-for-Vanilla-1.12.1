------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["High Priestess Mar'li"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	spawn_name = "Spawn of Mar'li",
	
	cmd = "Marli",

	spiders_trigger = "Aid me my brood!",
	drainlifeyoustart_trigger = "You are afflicted by Drain Life\.",
	drainlifeotherstart_trigger = "(.+) is afflicted by Drain Life\.",
	drainlifeyouend_trigger = "Drain Life fades from you\.",
	drainlifeotherend_trigger = "Drain Life fades from (.+)\.",
	pbv = "Poison Bolt Volley",
	pbvafflicts_trigger = "afflicted by Poison Bolt Volley",
	pbvhits_trigger = "High Priestess Mar'li 's Poison Bolt Volley hits",
	pbvresist_trigger = "High Priestess Mar'li 's Poison Bolt Volley was resisted(.+)",
	pbvimmune_trigger = "High Priestess Mar'li 's Poison Bolt Volley fail(.+) immune",
	you = "you",
	drainlife = "Drain Life",
	spiders_message = "Spiders spawned!",
	drainlife_message = "Drain Life! Interrupt/dispel it!",
	trollphase = "Troll phase",
	trollphase_trigger = "The brood shall not fall",
	spiderphase = "Spider phase",
	spiderphase_trigger1 = "Draw me to your web mistress Shadra",
	spiderphase_trigger2 = "Shadra, make of me your avatar",

	spider_cmd = "spider",
	spider_name = "Spider Alert",
	spider_desc = "Warn when spiders spawn",

	volley_cmd = "volley",
	volley_name = "Poison Bolt Volley Alert",
	volley_desc = "Warn for Poison Bolt Volleys\n\n(Disclaimer: this bar has a \194\1772 seconds error)",

	drain_cmd = "drain",
	drain_name = "Drain Life Alert",
	drain_desc = "Warn for life drain",
	
	phase_cmd = "phase",
	phase_name = "Phase Notification",
	phase_desc = "Announces the boss' phase transition",
} end )

L:RegisterTranslations("deDE", function() return {
	spawn_name = "Spawn of Mar'li",
	
	cmd = "Marli",

	spiders_trigger = "Aid me my brood!",
	drainlifeyoustart_trigger = "Ihr seid von Blutsauger betroffen\.",
	drainlifeotherstart_trigger = "(.+) ist von Blutsauger betroffen\.",
	drainlifeyouend_trigger = "\'Blutsauger\' schwindet von Euch\.",
	drainlifeotherend_trigger = "Blutsauger schwindet von (.+)\.",
	pbv = "Giftblitzsalve",
	pbvafflicts_trigger = "von Giftblitzsalve betroffen",
	pbvhits_trigger = "Giftblitzsalve(.+) Naturschaden\.",
	pbvresist_trigger = "Giftblitzsalve(.+) widerstanden",
	pbvimmune_trigger = "Giftblitzsalve(.+) immun",
	you = "Euch",
	drainlife = "Blutsauger",
	spiders_message = "Spinnen erscheinen!",
	drainlife_message = "Blutsauger! Unterbreche sie/entferne magie!",
	trollphase = "Troll-Phase",
	trollphase_trigger = "The brood shall not fall",
	spiderphase = "Spinnen-Phase",
	spiderphase_trigger1 = "Draw me to your web mistress Shadra",
	spiderphase_trigger2 = "Shadra, make of me your avatar",

	spider_cmd = "spider",
	spider_name = "Alarm f\195\188r Spinnen",
	spider_desc = "Warnung wenn Spinnen erscheinen",

	volley_cmd = "volley",
	volley_name = "Alarm f\195\188r Giftblitzsalve",
	volley_desc = "Warnen vor Giftblitzsalve\n\n(Dementi: Dieser Balken hat eine \194\1772 Sekunden Fehler)",

	drain_cmd = "drain",
	drain_name = "Alarm f\195\188r Blutsauger",
	drain_desc = "Warnen vor Blutsauger",
	
	phase_cmd = "phase",
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsMarli = BigWigs:NewModule(boss)
BigWigsMarli.zonename = AceLibrary("Babble-Zone-2.2")["Zul'Gurub"]
BigWigsMarli.enabletrigger = boss
BigWigsMarli.wipemobs = { L["spawn_name"] }
BigWigsMarli.toggleoptions = {"phase", "spider", "drain", "volley", "bosskill"}
BigWigsMarli.revision = tonumber(string.sub("$Revision: 11203 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsMarli:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "MarliDrainStart", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "MarliDrainEnd", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "MarliTrollPhase", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "MarliSpiderPhase", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "MarliSpiders", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "MarliVolley", 11)
end

------------------------------
--      Events          --
------------------------------

function BigWigsMarli:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["spiders_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "MarliSpiders")
	elseif string.find(msg, L["trollphase_trigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "MarliTrollPhase")
	elseif string.find(msg, L["spiderphase_trigger1"]) or string.find(msg, L["spiderphase_trigger2"]) then
		self:TriggerEvent("BigWigs_SendSync", "MarliSpiderPhase")
	end
end

function BigWigsMarli:Event(msg)
	local _,_,drainlifeotherstart,_ = string.find(msg, L["drainlifeotherstart_trigger"])
	local _,_,drainlifeotherend,_ = string.find(msg, L["drainlifeotherend_trigger"])
	if string.find(msg, L["pbvafflicts_trigger"]) or string.find(msg, L["pbvhits_trigger"]) or msg == L["pbvresist_trigger"] or msg == L["pbvimmune_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "MarliVolley")
	elseif string.find(msg, L["drainlife"]) then
		if msg == L["drainlifeyoustart_trigger"] then
			self:TriggerEvent("BigWigs_SendSync", "MarliDrainStart")
		elseif msg == L["drainlifeyouend_trigger"] then
			self:TriggerEvent("BigWigs_SendSync", "MarliDrainEnd")
		elseif drainlifeotherstart and (UnitIsInRaidByName(drainlifeotherstart) or UnitIsPetByName(drainlifeotherstart)) then
			self:TriggerEvent("BigWigs_SendSync", "MarliDrainStart")
		elseif drainlifeotherend and drainlifeotherend ~= L["you"] and (UnitIsInRaidByName(drainlifeotherstart) or UnitIsPetByName(drainlifeotherstart)) then
			self:TriggerEvent("BigWigs_SendSync", "MarliDrainEnd")
		end
	end
end

function BigWigsMarli:BigWigs_RecvSync(sync)
	if sync == "MarliSpiders" and self.db.profile.spider then
		self:TriggerEvent("BigWigs_Message", L["spiders_message"], "Attention")
	elseif sync == "MarliTrollPhase" and self.db.profile.phase then
		self:TriggerEvent("BigWigs_Message", L["trollphase"], "Attention")
	elseif sync == "MarliSpiderPhase" then
		if self.db.profile.phase then
			self:TriggerEvent("BigWigs_Message", L["spiderphase"], "Attention")
		end
		if self.db.profile.drain then
			self:TriggerEvent("BigWigs_StopBar", self, L["drainlife"])
		end
		if self.db.profile.volley then
			self:TriggerEvent("BigWigs_StopBar", self, L["pbv"])
		end
	elseif sync == "MarliVolley" and self.db.profile.volley then
		self:TriggerEvent("BigWigs_StartBar", self, L["pbv"], 13, "Interface\\Icons\\Spell_Nature_CorrosiveBreath")
	elseif sync == "MarliDrainStart" and self.db.profile.drain then
		self:TriggerEvent("BigWigs_StartBar", self, L["drainlife"], 7, "Interface\\Icons\\Spell_Shadow_LifeDrain02")
		self:TriggerEvent("BigWigs_Message", L["drainlife_message"], "Attention")
	elseif sync == "MarliDrainEnd" and self.db.profile.drain then
		self:TriggerEvent("BigWigs_StopBar", self, L["drainlife"])
	end
end
