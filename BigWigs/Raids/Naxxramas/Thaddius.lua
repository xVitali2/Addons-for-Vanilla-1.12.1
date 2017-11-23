
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Thaddius", "Naxxramas")
local feugen = AceLibrary("Babble-Boss-2.2")["Feugen"]
local stalagg = AceLibrary("Babble-Boss-2.2")["Stalagg"]

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
	trigger_phase2_1 = "EAT YOUR BONES",
	trigger_phase2_2 = "BREAK YOU!",
	trigger_phase2_3 = "KILL!",

	adddeath = "No... more... Feugen...",
	adddeath2 = "Master save me...",

	teslaoverload = "overloads!",

	pstrigger = "Now YOU feel pain!",
	trigger_polarity_cast = "Thaddius begins to cast Polarity Shift",
	chargetrigger = "You are afflicted by (%w+) Charge.",
	positivetype = "Spell_ChargePositive",
	negativetype = "Spell_ChargeNegative",
	stalaggtrigger = "Stalagg gains Power Surge.",

	you = "You",
	are = "are",

	enragewarn = "Enrage!",
	startwarn = "Thaddius Phase 1",
	startwarn2 = "Thaddius Phase 2, Enrage in 5 minutes!",
	addsdownwarn = "Thaddius incoming in 14sec!",
	pswarn1 = "Thaddius begins to cast Polarity Shift! - CHECK DEBUFF!",
	pswarn2 = "30 seconds to Polarity Shift!",
	pswarn3 = "3 seconds to Polarity Shift!",
	poswarn = "You changed to a Positive Charge!",
	negwarn = "You changed to a Negative Charge!",
	nochange = "Your debuff did not change!",
	polaritytickbar = "Polarity tick",
	enragebartext = "Enrage",
	warn_enrage_3m = "Enrage in 3 minutes",
	warn_enrage_90 = "Enrage in 90 seconds",
	warn_enrage_60 = "Enrage in 60 seconds",
	warn_enrage_30 = "Enrage in 30 seconds",
	warn_enrage_10 = "Enrage in 10 seconds",
	stalaggwarn = "Power Surge on Stalagg!",
	powersurgebar = "Power Surge",

	bar1text = "Polarity Shift",

	throwbar = "Throw",
	throwwarn = "Throw in ~5 seconds!",

	phasebar = "Phase 2",

	add1 = "Feugen",
	add2 = "Stalagg",

} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Thaddius",

	--enrage_cmd = "enrage",
	enrage_name = "Alerta de Enfurecer",
	enrage_desc = "Avisa para Enfurecer",

	--phase_cmd = "phase",
	phase_name = "Alerta de Fase",
	phase_desc = "Avisa para cambios de Fase",

	--polarity_cmd = "polarity",
	polarity_name = "Alerta de Cambio de polaridad",
	polarity_desc = "Avisa para Cambio de polaridad",

	--power_cmd = "power",
	power_name = "Alerta de Oleada de poder",
	power_desc = "Avisa para Oleada de poder de Stalagg",

	--adddeath_cmd = "adddeath",
	adddeath_name = "Alerta del Muerte del Add",
	adddeath_desc = "Avisa cuando muera un add.",

	--charge_cmd = "charge",
	charge_name = "Alerta de Carga",
	charge_desc = "Avisa para Carga positiva/negativa por ti mismo.",

	--throw_cmd = "throw",
	throw_name = "Alerta de Lanzar",
	throw_desc = "Avisa para cambios de la tarima de los tanques.",

	enragetrigger = "%s goes into a berserker rage!",
	starttrigger = "Stalagg crush you!",
	starttrigger1 = "Feed you to master!",
	trigger_phase2_1 = "EAT YOUR BONES",
	trigger_phase2_2 = "BREAK YOU!",
	trigger_phase2_3 = "KILL!",

	adddeath = "No... more... Feugen...",
	adddeath2 = "Master save me...",

	teslaoverload = "overloads!",

	pstrigger = "Now YOU feel pain!",
	trigger_polarity_cast = "Thaddius comienza a lanzar Cambio de polaridad",
	chargetrigger = "You are afflicted by (%w+) Charge.",
	positivetype = "Spell_ChargePositive",
	negativetype = "Spell_ChargeNegative",
	stalaggtrigger = "Stalagg gains Power Surge.",

	you = "Tu",
	are = "estás",

	enragewarn = "¡Enfurecer!",
	startwarn = "Thaddius Fase 1",
	startwarn2 = "¡Thaddius Fase 2, Enfurecer en 5 minutos!",
	addsdownwarn = "¡Thaddius entrante en 14 segundos!",
	pswarn1 = "¡Thaddius comienza a lanzar Cambio de polaridad! - COMPRUEBA CARGA!",
	pswarn2 = "¡30 segundos hasta Cambio de polaridad!",
	pswarn3 = "¡3 segundos hasta Cambio de polaridad!",
	poswarn = "¡Cambias a la Carga positiva!",
	negwarn = "¡Cambias a la Carga negativa!",
	nochange = "¡Tu polaridad no cambió!",
	polaritytickbar = "Tic de Polaridad",
	enragebartext = "Enfurecer",
	warn_enrage_3m = "Enfurecer en 3 minutos",
	warn_enrage_90 = "Enfurecer en 90 segundos",
	warn_enrage_60 = "Enfurecer en 60 segundos",
	warn_enrage_30 = "Enfurecer en 30 segundos",
	warn_enrage_10 = "Enfurecer en 10 segundos",
	stalaggwarn = "Oleada de poder en Stalagg!",
	powersurgebar = "Oleada de poder",

	bar1text = "Cambio de polaridad",

	throwbar = "Lanzar",
	throwwarn = "¡Lanzar en ~5 segundos!",

	phasebar = "Fase 2",
} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20003 -- To be overridden by the module!
module.enabletrigger = {module.translatedName, feugen, stalagg} -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"enrage", "charge", "polarity", -1, "power", "throw", "phase", "bosskill"}


-- locals
local timer = {
	throw = 20.5,
	powerSurge = 10,
	enrage = 300,
	polarityTick = 6,
	firstPolarity = 10,
	polarityShift = 30,
	transition = 14,
	transition2 = 4,
}
local icon = {
	throw = "Ability_Druid_Maul",
	powerSurge = "Spell_Shadow_UnholyFrenzy",
	enrage = "Spell_Shadow_UnholyFrenzy",
	polarityShift = "Spell_Nature_Lightning",
}
local syncName = {
	powerSurge = "StalaggPower"..module.revision,
	--phase2 = "ThaddiusPhaseTwo"..module.revision,
	addsdead = "ThaddiusAdsDead"..module.revision,
	polarity = "ThaddiusPolarity"..module.revision,
	enrage = "ThaddiusEnrage"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger"])
module:RegisterYellEngage(L["starttrigger1"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "CheckStalagg")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "PolarityCast")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "PolarityCast")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "CheckForEnrage")

	self:ThrottleSync(10, syncName.polarity)
	self:ThrottleSync(4, syncName.powerSurge)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	self.enrageStarted = nil
	self.addsdead = 0
	self.transition = nil
	self.teslawarn = nil
	self.stage1warn = nil
	self.previousCharge = ""
	self.add1HP = 100
	self.add2HP = 100
end

-- called after boss is engaged
function module:OnEngage()
	self.add1HP = 100
	self.add2HP = 100
	self:TriggerEvent("BigWigs_StartHPBar", self, L["add1"], 100)
	self:TriggerEvent("BigWigs_SetHPBar", self, L["add1"], 0)
	self:TriggerEvent("BigWigs_StartHPBar", self, L["add2"], 100)
	self:TriggerEvent("BigWigs_SetHPBar", self, L["add2"], 0)
	if self.db.profile.phase and not self.stage1warn then
		self:Message(L["startwarn"], "Important")
	end
	self.stage1warn = true
	self:Throw()
	self:ScheduleRepeatingEvent("bwthaddiusthrow", self.Throw, timer.throw, self)
	self:ScheduleRepeatingEvent("bwThaddiusAddCheck", self.CheckAddHP, 0.5, self )
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:CheckStalagg(msg)
	if msg == L["stalaggtrigger"] then
		self:Sync(syncName.powerSurge)
	end
end

function module:CHAT_MSG_MONSTER_YELL( msg )
	if string.find(msg, L["pstrigger"]) then
		self:Sync(syncName.polarity)
	elseif msg == L["adddeath"] or msg == L["adddeath2"] then
		self.addsdead = self.addsdead + 1
		if self.addsdead == 2 then
			self:Sync(syncName.addsdead)
		end
		--elseif string.find(msg, L["trigger_phase2_1"]) or string.find(msg, L["trigger_phase2_2"]) or string.find(msg, L["trigger_phase2_3"]) then
		--	self:Sync(syncName.phase2)
	end
end

function module:CheckForEnrage(msg)
	if msg == L["enragetrigger"] then
		self:Sync(syncName.enrage)
	elseif string.find(msg, L["teslaoverload"]) then
		self:Transition(timer.transition2)
	end
end

function module:PolarityCast(msg)
	if self.db.profile.polarity and string.find(msg, L["trigger_polarity_cast"]) then
		self:Message(L["pswarn1"], "Important")
	end
end

function module:PLAYER_AURAS_CHANGED(msg)
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
			if applications > 1 then
				return
			end
			chargetype = texture
			-- Note that we do not break out of the while loop when
			-- we found a debuff, since we still have to check for
			-- debuffs with more than 1 application.
		end
		iIterator = iIterator + 1
	end
	if not chargetype then return end

	self:UnregisterEvent("PLAYER_AURAS_CHANGED")

	self:NewPolarity(chargetype)
end

function module:NewPolarity(chargetype)
	if self.db.profile.charge then
		if self.previousCharge and self.previousCharge == chargetype then
			self:Message(L["nochange"], "Urgent", true, "Long")
		elseif chargetype == L["positivetype"] then
			self:Message(L["poswarn"], "Positive", true, "RunAway")
			self:WarningSign(chargetype, 5)
		elseif chargetype == L["negativetype"] then
			self:Message(L["negwarn"], "Important", true, "RunAway")
			self:WarningSign(chargetype, 5)
		end
		self:Bar(L["polaritytickbar"], timer.polarityTick, chargetype, "Important")
	end
	self.previousCharge = chargetype
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.powerSurge then
		self:PowerSurge()
	elseif sync == syncName.addsdead then
		self:Transition(timer.transition)
		--elseif sync == syncName.phase2 then
		--	self:Phase2()
	elseif sync == syncName.polarity then
		self:PolarityShift()
	elseif sync == syncName.enrage then
		self:Enrage()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:PowerSurge()
	if self.db.profile.power then
		self:Message(L["stalaggwarn"], "Important")
		self:Bar(L["powersurgebar"], timer.powerSurge, icon.powerSurge)
	end
end

function module:Transition(transitionTime)
	self:RemoveBar(L["throwbar"])
	self:CancelDelayedMessage(L["throwwarn"])
	self:CancelScheduledEvent("bwthaddiusthrow")
	self:TriggerEvent("BigWigs_StopHPBar", self, L["add1"])
	self:TriggerEvent("BigWigs_StopHPBar", self, L["add2"])
	self:CancelScheduledEvent("bwThaddiusAddCheck")
	if not self.transition then
		if self.db.profile.phase then
			self:Message(L["addsdownwarn"], "Attention")
			self:Bar(L["phasebar"], transitionTime, icon.polarityShift)
		end
		self:ScheduleEvent("bwThaddiusP2", self.Phase2, transitionTime, self)
		self.transition = true
	end
end

function module:Phase2()
	self:KTM_Reset()
	if self.db.profile.phase then
		self:Message(L["startwarn2"], "Important")
	end
	if self.db.profile.enrage then
		self:Bar(L["enragebartext"], timer.enrage, icon.enrage)
		self:DelayedMessage(timer.enrage - 3 * 60, L["warn_enrage_3m"], "Attention")
		self:DelayedMessage(timer.enrage - 90, L["warn_enrage_90"], "Attention")
		self:DelayedMessage(timer.enrage - 60, L["warn_enrage_60"], "Urgent")
		self:DelayedMessage(timer.enrage - 30, L["warn_enrage_30"], "Important")
		self:DelayedMessage(timer.enrage - 10, L["warn_enrage_10"], "Important")
	end
	self:Bar(L["bar1text"], timer.firstPolarity, icon.polarityShift)
end

function module:PolarityShift()
	if self.db.profile.polarity then
		self:RegisterEvent("PLAYER_AURAS_CHANGED")
		self:DelayedMessage(timer.polarityShift - 3, L["pswarn3"], "Important", nil, "Beware")
		self:Bar(L["bar1text"], timer.polarityShift, icon.polarityShift)
	end
end

function module:Enrage()
	if self.db.profile.enrage then
		self:Message(L["enragewarn"], "Important")
	end

	self:RemoveBar(L["enragebartext"])

	self:CancelDelayedMessage(L["warn_enrage_3m"])
	self:CancelDelayedMessage(L["warn_enrage_90"])
	self:CancelDelayedMessage(L["warn_enrage_60"])
	self:CancelDelayedMessage(L["warn_enrage_30"])
	self:CancelDelayedMessage(L["warn_enrage_10"])
end

------------------------------
--      Utility	Functions   --
------------------------------

function module:Throw()
	if self.db.profile.throw then
		self:Bar(L["throwbar"], timer.throw, icon.throw)
		self:DelayedMessage(timer.throw - 5, L["throwwarn"], "Urgent")
	end
end

function module:CheckAddHP()
	local health1
	local health2
	if UnitName("playertarget") == L["add1"] then
		health1 = UnitHealth("playertarget")
	elseif UnitName("playertarget") == L["add2"] then
		health2 = UnitHealth("playertarget")
	end

	for i = 1, GetNumRaidMembers(), 1 do
		if UnitName("Raid"..i.."target") == L["add1"] then
			health1 = UnitHealth("Raid"..i.."target")
		elseif UnitName("Raid"..i.."target") == L["add2"] then
			health2 = UnitHealth("Raid"..i.."target")
		end
		if health1 and health2 then break; end
	end

	if health1 then
		self.add1HP = health1
		self:TriggerEvent("BigWigs_SetHPBar", self, L["add1"], 100-self.add1HP)
	end

	if health2 then
		self.add2HP = health2
		self:TriggerEvent("BigWigs_SetHPBar", self, L["add2"], 100-self.add2HP)
	end
end

------------------------------
--      Test                --
------------------------------

function module:Test(long)
	-- /run local m=BigWigs:GetModule("Thaddius");m:Test()

	local function testPhase2()
		module:CHAT_MSG_MONSTER_YELL(L["trigger_phase2_1"])
		BigWigs:Print("  testPhase2")
	end
	local function testPolarityShiftPositive()
		module:NewPolarity(L["positivetype"])
	end
	local function testPolarityShiftNegative()
		module:NewPolarity(L["negativetype"])
	end
	local function testDisable()
		--module:SendWipeSync()
		BigWigs:TriggerEvent("BigWigs_RebootModule", self:ToString())
		BigWigs:DisableModule(module:ToString())
		BigWigs:Print("  testDisable")
	end

	if long then
		local testTimer = 0
		self:SendEngageSync()

		-- phase2
		testTimer = testTimer + 10
		self:ScheduleEvent(self:ToString() .. "testPhase2", testPhase2, testTimer, self)
		BigWigs:Print(" testPhase2 in " .. testTimer)

		-- polarity shift 1
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testPolarityShiftPositive", testPolarityShiftPositive, testTimer, self)
		BigWigs:Print(" testPolarityShiftPositive1 in " .. testTimer)

		-- polarity shift 2
		testTimer = testTimer + 30
		self:ScheduleEvent(self:ToString() .. "testPolarityShiftPositive2", testPolarityShiftPositive, testTimer, self)
		BigWigs:Print(" testPolarityShiftPositive2 in " .. testTimer)

		-- polarity shift 3
		testTimer = testTimer + 30
		self:ScheduleEvent(self:ToString() .. "testPolarityShiftNegative", testPolarityShiftNegative, testTimer, self)
		BigWigs:Print(" testPolarityShiftNegative in " .. testTimer)

		-- disable
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testDisable", testDisable, testTimer, self)
		BigWigs:Print(" testDisable in " .. testTimer)
	else
		local testTimer = 0
		self:SendEngageSync()

		-- phase2
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testPhase2", testPhase2, testTimer, self)
		BigWigs:Print(" testPhase2 in " .. testTimer)

		-- polarity shift 1
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testPolarityShiftPositive", testPolarityShiftPositive, testTimer, self)
		BigWigs:Print(" testPolarityShiftPositive1 in " .. testTimer)

		-- polarity shift 2
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testPolarityShiftPositive2", testPolarityShiftPositive, testTimer, self)
		BigWigs:Print(" testPolarityShiftPositive2 in " .. testTimer)

		-- polarity shift 3
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testPolarityShiftNegative", testPolarityShiftNegative, testTimer, self)
		BigWigs:Print(" testPolarityShiftNegative in " .. testTimer)

		-- disable
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testDisable", testDisable, testTimer, self)
		BigWigs:Print(" testDisable in " .. testTimer)
	end
end
