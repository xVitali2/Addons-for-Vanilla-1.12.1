
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Sapphiron", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Sapphiron",

	deepbreath_cmd = "deepbreath",
	deepbreath_name = "Deep Breath alert",
	deepbreath_desc = "Warn when Sapphiron begins to cast Deep Breath.",

	lifedrain_cmd = "lifedrain",
	lifedrain_name = "Life Drain",
	lifedrain_desc = "Warns about the Life Drain curse.",

	berserk_cmd = "berserk",
	berserk_name = "Berserk",
	berserk_desc = "Warn for berserk.",

	icebolt_cmd = "icebolt",
	icebolt_name = "Announce Ice Block",
	icebolt_desc = "Yell when you become an Ice Block.",

	berserk_bar = "Berserk",
	berserk_warn_10min = "10min to berserk!",
	berserk_warn_5min = "5min to berserk!",
	berserk_warn_rest = "%s sec to berserk!",

	engage_message = "Sapphiron engaged! Berserk in 15min!",

	lifedrain_message = "Life Drain! Possibly new one ~24sec!",
	lifedrain_warn1 = "Life Drain in 5sec!",
	lifedrain_bar = "Life Drain",

	lifedrain_trigger = "afflicted by Life Drain",
	lifedrain_trigger2 = "Life Drain was resisted by",
	icebolt_trigger = "You are afflicted by Icebolt",
	icebolt_trigger2 = "Icebolt",

	deepbreath_incoming_message = "Ice Bomb casting in ~23sec!",
	deepbreath_incoming_soon_message = "Ice Bomb casting in ~5sec!",
	deepbreath_incoming_bar = "Ice Bomb Cast",
	deepbreath_trigger = "begins to cast Frost Breath",
	deepbreath_warning = "Ice Bomb Incoming!",
	deepbreath_bar = "Ice Bomb Lands!",
	icebolt_yell = "I'm an Ice Block!",

	proximity_cmd = "proximity",
	proximity_name = "Proximity Warning",
	proximity_desc = "Show Proximity Warning Frame",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Sapphiron",

	--deepbreath_cmd = "deepbreath",
	deepbreath_name = "Alerta de Aliento de Escarcha",
	deepbreath_desc = "Avisa para Aliento de Escarcha.",

	--lifedrain_cmd = "lifedrain",
	lifedrain_name = "Drenaje de vida",
	lifedrain_desc = "Avisa para Drenaje de vida.",

	--berserk_cmd = "berserk",
	berserk_name = "Rabia",
	berserk_desc = "Avisa para Rabia.",

	--icebolt_cmd = "icebolt",
	icebolt_name = "Anunciar Bloqueo de hielo",
	icebolt_desc = "Grita cuando tengas Bloqueo de hielo.",

	berserk_bar = "Rabia",
	berserk_warn_10min = "¡10 minutos hasta Rabia!",
	berserk_warn_5min = "¡5 minutos hasta Rabia!",
	berserk_warn_rest = "¡%s segundos hasta Rabia!",

	engage_message = "¡Entrando en combate con Sapphiron! Rabia en 15 minutos!",

	lifedrain_message = "¡Drenaje de vida! El próximo posiblemente en ~24 segundos!",
	lifedrain_warn1 = "¡Drenaje de vida en 5 segundos!",
	lifedrain_bar = "Drenaje de vida",

	lifedrain_trigger = "sufre de Drenaje de vida",
	lifedrain_trigger2 = "Ha Resistido Drenaje de vida",
	icebolt_trigger = "Sufres de Descarga de hielo",

	deepbreath_incoming_message = "¡Lanza Aliento de Escarcha en ~23 segundos!",
	deepbreath_incoming_soon_message = "¡Lanza Aliento de Escarcha en ~5 segundos!",
	deepbreath_incoming_bar = "Lanza Aliento de Escarcha",
	deepbreath_trigger = "%s takes in a deep breath...",
	deepbreath_warning = "¡Aliento de Escarcha entrante!",
	deepbreath_bar = "¡Lanza Aliento de Escarcha!",
	icebolt_yell = "¡Estoy en Bloqueo de hielo!",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20003 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"berserk", "lifedrain", "deepbreath", "icebolt", -1, "proximity", "bosskill"}

-- Proximity Plugin
module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
module.proximitySilent = false


-- locals
local timer = {
	berserk = 900,
	deepbreathInc = 23,
	deepbreath = 6,
	lifedrainAfterFlight = 24,
	lifedrain = 24,
	groundPhase = 50,
}
local icon = {
	deepbreath = "Spell_Frost_FrostShock",
	deepbreathInc = "Spell_Arcane_PortalIronForge",
	lifedrain = "Spell_Shadow_LifeDrain02",
	berserk = "INV_Shield_01",
}
local syncName = {
	lifedrain = "SapphironLifeDrain"..module.revision,
	flight = "SapphironFlight"..module.revision,
	icebolt = "SapphironIcebolt"..module.revision,
	breath = "SapphironBreath"..module.revision,
}

local timeLifeDrain = nil
local cachedUnitId = nil
local lastTarget = nil


------------------------------
--      Initialization      --
------------------------------

--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	if self:IsEventScheduled("bwsapphtargetscanner") then
		self:CancelScheduledEvent("bwsapphtargetscanner")
	end
	if self:IsEventScheduled("bwsapphdelayed") then
		self:CancelScheduledEvent("bwsapphdelayed")
	end

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckForLifeDrain")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckForLifeDrain")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckForLifeDrain")

	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "CheckForIcebolt")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "CheckForIcebolt")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "CheckForIcebolt")

	self:ThrottleSync(4, syncName.lifedrain)
	self:ThrottleSync(5, syncName.flight)
	self:ThrottleSync(30, syncName.icebolt)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	timeLifeDrain = nil
	cachedUnitId = nil
	lastTarget = nil
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.berserk then
		self:Message(L["engage_message"], "Attention")
		self:Bar(L["berserk_bar"], timer.berserk, icon.berserk)
		self:DelayedMessage(timer.berserk - 10 * 60, L["berserk_warn_10min"], "Attention")
		self:DelayedMessage(timer.berserk - 5 * 60, L["berserk_warn_5min"], "Attention")
		self:DelayedMessage(timer.berserk - 60, string.format(L["berserk_warn_rest"], 60), "Urgent")
		self:DelayedMessage(timer.berserk - 30, string.format(L["berserk_warn_rest"], 30), "Important")
		self:DelayedMessage(timer.berserk - 10, string.format(L["berserk_warn_rest"], 10), "Important")
		self:DelayedMessage(timer.berserk - 5, string.format(L["berserk_warn_rest"], 5), "Important")
	end
	if self.db.profile.deepbreath then
		-- Lets start a repeated event after 5 seconds of combat so that
		-- we're sure that the entire raid is in fact in combat when we
		-- start it.
		self:ScheduleEvent("besapphdelayed", self.StartTargetScanner, 5, self)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
	if self:IsEventScheduled("bwsapphtargetscanner") then
		self:CancelScheduledEvent("bwsapphtargetscanner")
	end
	if self:IsEventScheduled("bwsapphdelayed") then
		self:CancelScheduledEvent("bwsapphdelayed")
	end
	self:RemoveProximity()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CheckForLifeDrain(msg)
	if string.find(msg, L["lifedrain_trigger"]) or string.find(msg, L["lifedrain_trigger2"]) then
		if not timeLifeDrain or (timeLifeDrain + 2) < GetTime() then
			self:Sync(syncName.lifedrain)
			timeLifeDrain = GetTime()
		end
	elseif string.find(msg, L["icebolt_trigger"]) and self.db.profile.icebolt then
		SendChatMessage(L["icebolt_yell"], "YELL")
	end
	if string.find(msg, L["icebolt_trigger2"]) then
		self:Sync(syncName.icebolt)
	end
end

function module:CheckForIcebolt(msg)
	if string.find(msg, L["icebolt_trigger2"]) then
		self:Sync(syncName.icebolt)
	elseif string.find(msg, L["deepbreath_trigger"]) then
		self:Sync(syncName.breath)
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.lifedrain then
		self:LifeDrain()
	elseif sync == syncName.flight then
		self:Flight()
	elseif sync == syncName.icebolt then
		self:Icebolt()
	elseif sync == syncName.breath then
		self:Breath()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:LifeDrain()
	if self.db.profile.lifedrain then
		self:Message(L["lifedrain_message"], "Urgent")
		self:Bar(L["lifedrain_bar"], timer.lifedrain, icon.lifedrain)
	end
end

function module:Flight()
	if  self.db.profile.deepbreath and self.engaged then
		if self:IsEventScheduled("bwsapphtargetscanner") then
			self:CancelScheduledEvent("bwsapphtargetscanner")
		end
		if self:IsEventScheduled("bwsapphdelayed") then
			self:CancelScheduledEvent("bwsapphdelayed")
		end
		self:Message(L["deepbreath_incoming_message"], "Urgent")
		self:Bar(L["deepbreath_incoming_bar"], timer.deepbreathInc, icon.deepbreathInc)
		lastTarget = nil
		cachedUnitId = nil
		self:ScheduleEvent("besapphdelayed", self.StartTargetScanner, timer.groundPhase, self)
	end
	if  self.db.profile.proximity then
		self:Proximity()
	end
end

function module:Icebolt()
	if self.db.profile.deepbreath then
		self:Bar(L["deepbreath_incoming_bar"], timer.deepbreathInc-6, icon.deepbreathInc)
	end
end

function module:Breath()
	if self.db.profile.deepbreath then
		self:RemoveBar(L["deepbreath_incoming_bar"])
		self:Message(L["deepbreath_warning"], "Important")
		self:Bar(L["deepbreath_bar"], timer.deepbreath, icon.deepbreath)
		self:RemoveProximity()
	end
end

------------------------------
--      Target Scanning     --
------------------------------

function module:StartTargetScanner()
	if not self:IsEventScheduled("bwsapphtargetscanner") and self.engaged then
		-- Start a repeating event that scans the raid for targets every 1 second.
		self:ScheduleRepeatingEvent("bwsapphtargetscanner", self.RepeatedTargetScanner, 1, self)
	end
end

function module:RepeatedTargetScanner()
	if not UnitAffectingCombat("player") then
		self:CancelScheduledEvent("bwsapphtargetscanner")
		return
	end

	if not self.engaged then
		return
	end
	local found = nil

	-- If we have a cached unit (which we will if we found someone with the boss
	-- as target), then check if he still has the same target
	if cachedUnitId and UnitExists(cachedUnitId) and UnitName(cachedUnitId) == self.translatedName then
		found = true
	end

	-- Check the players target
	if not found and UnitExists("target") and UnitName("target") == self.translatedName then
		cachedUnitId = "target"
		found = true
	end

	-- Loop the raid roster
	if not found then
		for i = 1, GetNumRaidMembers() do
			local unit = string.format("raid%dtarget", i)
			if UnitExists(unit) and UnitName(unit) == self.translatedName then
				cachedUnitId = unit
				found = true
				break
			end
		end
	end

	-- We've checked everything. If nothing was found, just return home.
	-- We basically shouldn't return here, because someone should always have
	-- him targetted.
	if not found then
		return
	end

	local inFlight = nil

	-- Alright, we've got a valid unitId with the boss as target, now check if
	-- the boss had a target on the last iteration or not - if he didn't, and
	-- still doesn't, then we fire the "in air" warning.
	if not UnitExists(cachedUnitId.."target") then
		-- Okay, the boss doesn't have a target.
		if not lastTarget then
			-- He didn't have a target last time either
			inFlight = true
		end
		lastTarget = nil
	else
		-- This should always be set before we hit the time when he actually
		-- loses his target, hence we can check |if not lastTarget| above.
		lastTarget = true
	end

	-- He's not flying, so we're just going to continue scanning.
	if not inFlight then
		return
	end

	-- He's in flight! (I hope)
	if self:IsEventScheduled("bwsapphtargetscanner") then
		self:CancelScheduledEvent("bwsapphtargetscanner")
	end
	self:Sync(syncName.flight)
end
