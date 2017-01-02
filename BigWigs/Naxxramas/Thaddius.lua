------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Thaddius"]
local feugen = AceLibrary("Babble-Boss-2.2")["Feugen"]
local stalagg = AceLibrary("Babble-Boss-2.2")["Stalagg"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Thaddius",

	enrage_cmd = "enrage",
	enrage_name = "Enrage Alert",
	enrage_desc = "Warn for Enrage",

	phase_cmd = "phase",
	phase_name = "Phase Alerts",
	phase_desc = "Warn for Phase transitions",

	polarity_cmd = "polarity",
	polarity_name = "Polarity Shift Alert",
	polarity_desc = "Warn for polarity shifts",

	power_cmd = "power",
	power_name = "Power Surge Alert",
	power_desc = "Warn for Stalagg's power surge",

	adddeath_cmd = "adddeath",
	adddeath_name = "Add Death Alert",
	adddeath_desc = "Alerts when an add dies.",

	charge_cmd = "charge",
	charge_name = "Charge Alert",
	charge_desc = "Warn about Positive/Negative charge for yourself only.",

	throw_cmd = "throw",
	throw_name = "Throw Alerts",
	throw_desc = "Warn about tank platform swaps.",

	enragetrigger = "%s goes into a berserker rage!",
	starttrigger = "Stalagg crush you!",
	starttrigger1 = "Feed you to master!",
	starttrigger2 = "EAT YOUR BONES",
	starttrigger3 = "BREAK YOU!",
	starttrigger4 = "KILL!",

	adddeath = "No... more... Feugen...",
	adddeath2 = "Master save me...",

	teslaoverload = "%s overloads!",

	pstrigger = "Now YOU feel pain!",
	trigger1 = "Thaddius begins to cast Polarity Shift",
	chargetrigger = "You are afflicted by (%w+) Charge.",
	positivetype = "Interface\\Icons\\Spell_ChargePositive",
	negativetype = "Interface\\Icons\\Spell_ChargeNegative",
	stalaggtrigger = "Stalagg gains Power Surge.",

	you = "You",
	are = "are",

	enragewarn = "Enrage!",
	startwarn = "Thaddius Phase 1",
	startwarn2 = "Thaddius Phase 2, Enrage in 5 minutes!",
	addsdownwarn = "Thaddius incoming in 10-20sec!",
	pswarn1 = "Thaddius begins to cast Polarity Shift! - CHECK DEBUFF!",
	pswarn2 = "30 seconds to Polarity Shift!",
	pswarn3 = "3 seconds to Polarity Shift!",
	poswarn = "You changed to a Positive Charge!",
	negwarn = "You changed to a Negative Charge!",
	nochange = "Your debuff did not change!",
	polaritytickbar = "Polarity tick",
	enragebartext = "Enrage",
	warn1 = "Enrage in 3 minutes",
	warn2 = "Enrage in 90 seconds",
	warn3 = "Enrage in 60 seconds",
	warn4 = "Enrage in 30 seconds",
	warn5 = "Enrage in 10 seconds",
	stalaggwarn = "Power Surge on Stalagg!",
	powersurgebar = "Power Surge",

	bar1text = "Polarity Shift",

	throwbar = "Throw",
	throwwarn = "Throw in ~5 seconds!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsThaddius = BigWigs:NewModule(boss)
BigWigsThaddius.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
BigWigsThaddius.enabletrigger = { boss, feugen, stalagg }
BigWigsThaddius.toggleoptions = {"enrage", "charge", "polarity", -1, "power", "throw", "phase", "bosskill"}
BigWigsThaddius.revision = tonumber(string.sub("$Revision: 17540 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsThaddius:OnEnable()
	self.enrageStarted = nil
	self.addsdead = 0
	self.teslawarn = nil
	self.stage1warn = nil
	self.previousCharge = ""

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "PolarityCast")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "PolarityCast")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "ThaddiusPolarity", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "StalaggPower", 4)
end

function BigWigsThaddius:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS( msg )
	if msg == L["stalaggtrigger"] then
		self:TriggerEvent("BigWigs_SendSync", "StalaggPower")
	end
end

function BigWigsThaddius:CHAT_MSG_MONSTER_YELL( msg )
	if string.find(msg, L["pstrigger"]) then
		self:TriggerEvent("BigWigs_SendSync", "ThaddiusPolarity")
	elseif msg == L["starttrigger"] or msg == L["starttrigger1"] then
		if self.db.profile.phase and not self.stage1warn then
			self:TriggerEvent("BigWigs_Message", L["startwarn"], "Important")
		end
		self.stage1warn = true
		self:Throw()
		self:ScheduleRepeatingEvent( "bwthaddiusthrow", self.Throw, 21, self )
	elseif msg == L["adddeath"] then
		self.addsdead = self.addsdead + 1
	elseif msg == L["adddeath2"] then
		self.addsdead = self.addsdead + 1
	if self.addsdead == 2 then
			if self.db.profile.phase then self:TriggerEvent("BigWigs_Message", L["addsdownwarn"], "Attention") end
			self:CancelScheduledEvent("bwthaddiusthrow")
			self:CancelScheduledEvent("bwthaddiusthrowwarn")
		end
	elseif string.find(msg, L["starttrigger2"]) or string.find(msg, L["starttrigger3"]) or string.find(msg, L["starttrigger4"]) then
		if self.db.profile.phase then self:TriggerEvent("BigWigs_Message", L["startwarn2"], "Important") end
		if self.db.profile.enrage then
			self:TriggerEvent("BigWigs_StartBar", self, L["enragebartext"], 300, "Interface\\Icons\\Spell_Shadow_UnholyFrenzy")
			self:ScheduleEvent("bwthaddiuswarn1", "BigWigs_Message", 120, L["warn1"], "Attention")
			self:ScheduleEvent("bwthaddiuswarn2", "BigWigs_Message", 210, L["warn2"], "Attention")
			self:ScheduleEvent("bwthaddiuswarn3", "BigWigs_Message", 240, L["warn3"], "Urgent")
			self:ScheduleEvent("bwthaddiuswarn4", "BigWigs_Message", 270, L["warn4"], "Important")
			self:ScheduleEvent("bwthaddiuswarn5", "BigWigs_Message", 290, L["warn5"], "Important")
			self:CancelScheduledEvent("bwthaddiusthrow") -- added
			self:CancelScheduledEvent("bwthaddiusthrowwarn")
		end
	end
end

function BigWigsThaddius:CHAT_MSG_MONSTER_EMOTE( msg )
	if msg == L["enragetrigger"] then
		if self.db.profile.enrage then self:TriggerEvent("BigWigs_Message", L["enragewarn"], "Important") end
		self:TriggerEvent("BigWigs_StopBar", self, L["enragebartext"])
		self:CancelScheduledEvent("bwthaddiuswarn1")
		self:CancelScheduledEvent("bwthaddiuswarn2")
		self:CancelScheduledEvent("bwthaddiuswarn3")
		self:CancelScheduledEvent("bwthaddiuswarn4")
		self:CancelScheduledEvent("bwthaddiuswarn5")
	end
end

function BigWigsThaddius:PolarityCast( msg )
	if self.db.profile.polarity and string.find(msg, L["trigger1"]) then
		self:TriggerEvent("BigWigs_Message", L["pswarn1"], "Important")
	end
end

function BigWigsThaddius:PLAYER_AURAS_CHANGED( msg )
	local chargetype = nil
	local iIterator = 1
	while UnitDebuff("player", iIterator) do
		local texture, applications = UnitDebuff("player", iIterator)
		if texture == L["positivetype"] or texture == L["negativetype"] then
			-- If we have a debuff with this texture that has more
			-- than one application, it means we still have the
			-- counter debuff, and thus nothing has changed yet.
			-- (we got a PW:S or Renew or whatever after he casted
			--  PS, but before we got the new debuff)
			if applications > 1 then return end
			chargetype = texture
			-- Note that we do not break out of the while loop when
			-- we found a debuff, since we still have to check for
			-- debuffs with more than 1 application.
		end
		iIterator = iIterator + 1
	end
	if not chargetype then return end

	self:UnregisterEvent("PLAYER_AURAS_CHANGED")

	if self.db.profile.charge then
		if self.previousCharge and self.previousCharge == chargetype then
			self:TriggerEvent("BigWigs_Message", L["nochange"], "Urgent", true, "Alarm")
		elseif chargetype == L["positivetype"] then
			self:TriggerEvent("BigWigs_Message", L["poswarn"], "Positive", true, "Alarm")
		elseif chargetype == L["negativetype"] then
			self:TriggerEvent("BigWigs_Message", L["negwarn"], "Important", true, "Alarm")
		end
		self:TriggerEvent("BigWigs_StartBar", self, L["polaritytickbar"], 6, chargetype, "Important")
	end
	self.previousCharge = chargetype
end

function BigWigsThaddius:BigWigs_RecvSync( sync )
	if sync == "ThaddiusPolarity" and self.db.profile.polarity then
		self:RegisterEvent("PLAYER_AURAS_CHANGED")
		self:ScheduleEvent("BigWigs_Message", 27, L["pswarn3"], "Important")
		self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 30, "Interface\\Icons\\Spell_Nature_Lightning")
	elseif sync == "StalaggPower" and self.db.profile.power then
		self:TriggerEvent("BigWigs_Message", L["stalaggwarn"], "Important")
		self:TriggerEvent("BigWigs_StartBar", self, L["powersurgebar"], 10, "Interface\\Icons\\Spell_Shadow_UnholyFrenzy")
	end
end

function BigWigsThaddius:Throw()
	if self.db.profile.throw then
		self:TriggerEvent("BigWigs_StartBar", self, L["throwbar"], 20, "Interface\\Icons\\Ability_Druid_Maul")
		self:ScheduleEvent("bwthaddiusthrowwarn", "BigWigs_Message", 15, L["throwwarn"], "Urgent")
	end
end
