
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Ragnaros", "Molten Core")

module.revision = 20008 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"start", "aoeknock", "submerge", "emerge", "adds", "bosskill"}

module.defaultDB = {
	adds = false,
}

-- Proximity Plugin
-- module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
-- module.proximitySilent = false

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	emerge_soon1 = 78,
	emerge_soon2 = 47.5,
	emerge_soon3 = 29,
	hammer_of_ragnaros = 11,
	emerge = 90,
	submerge = 180,
	earliestKnockback = 25,
	latestKnockback = 30,
}
local icon = {
	emerge_soon = "Inv_Hammer_Unique_Sulfuras",
	hammer_of_ragnaros = "Spell_Fire_Incinerate",
	emerge = "Spell_Fire_Volcano",
	submerge = "Spell_Fire_SelfDestruct",
	knockback = "Spell_Fire_SoulBurn",
	knockbackWarn = "Ability_Rogue_Sprint",
}
local syncName = {
	knockback = "RagnarosKnockback"..module.revision,
	sons = "RagnarosSonDead"..module.revision,
	submerge = "RagnarosSubmerge"..module.revision,
	emerge = "RagnarosEmerge"..module.revision,
}

local firstKnockback = true
local sonsdead = 0
local phase = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	knockback_trigger = "^TASTE",
	submerge_trigger = "^COME FORTH,",
	submerge_trigger2 = "^YOU CANNOT DEFEAT THE LIVING FLAME,",
	engage_trigger = "^NOW FOR YOU",
	engage_soon_trigger1 = "Imprudent whelps!",
	engage_soon_trigger2 = "TOO SOON! YOU HAVE AWAKENED ME TOO SOON",
	engage_soon_trigger3 = "YOU ALLOWED THESE INSECTS",
	hammer_trigger = "^BY FIRE BE PURGED!",

	knockback_message = "Knockback!",
	knockback_soon_message = "Knockback soon!",
	submerge_message = "Ragnaros submerged. Incoming Sons of Flame!",
	emerge_soon_message = "15 sec until Ragnaros emerges!",
	emerge_message = "Ragnaros emerged, 3 minutes until submerge!",
	submerge_60sec_message = "60 sec to submerge!",
	submerge_30sec_message = "30 sec to submerge!",
	submerge_10sec_message = "10 sec to submerge!",
	submerge_5sec_message = "5 sec to submerge!",

	knockback_bar = "AoE knockback",
	emerge_bar = "Ragnaros emerge",
	submerge_bar = "Ragnaros submerge",

	sonofflame = "Son of Flame",
	sonsdeadwarn = "%d/8 Sons of Flame dead!",

	cmd = "Ragnaros",

	start_cmd = "start",
	start_name = "Start",
	start_desc = "Starts a bar for estimating the beginning of the fight.",

	emerge_cmd = "emerge",
	emerge_name = "Emerge alert",
	emerge_desc = "Warn for Ragnaros Emerge",

	adds_cmd = "adds",
	adds_name = "Son of Flame dies",
	adds_desc = "Warn when a son dies",

	submerge_cmd = "submerge",
	submerge_name = "Submerge alert",
	submerge_desc = "Warn for Ragnaros Submerge",

	aoeknock_cmd = "aoeknock",
	aoeknock_name = "Knockback alert",
	aoeknock_desc = "Warn for Wrath of Ragnaros knockback",

	["Combat"] = true,
} end)

L:RegisterTranslations("esES", function() return {
	knockback_trigger = "^PROBAR LAS LLAMAS DE SULFURON", -- /script PlaySoundFile("Sound\\Creature\\Ragnaros\\RagnarosSpecialAttack02.wav")
	submerge_trigger = "^VENID INSECTOS,", -- /script PlaySoundFile("Sound\\Creature\\Ragnaros\\RagnarosSpecialAttack03.wav")
	submerge_trigger2 = "^YOU CANNOT DEFEAT THE LIVING FLAME,",
	engage_trigger = "^NOW FOR YOU",
	engage_soon_trigger1 = "Imprudent whelps!",
	engage_soon_trigger2 = "TOO SOON! YOU HAVE AWAKENED ME TOO SOON",
	engage_soon_trigger3 = "YOU ALLOWED THESE INSECTS",
	hammer_trigger = "^EL FUEGO TE PURIFIQUE!", -- /script PlaySoundFile("Sound\\Creature\\Ragnaros\\RagnarosSpecialAttack01.wav")

	knockback_message = "¡Rechazar!",
	knockback_soon_message = "¡Rechazar pronto!",
	submerge_message = "¡Ragnaros se sumerge. Hijos de la llama entrantes!",
	emerge_soon_message = "¡15 segundos hasta que se yerga Ragnaros!",
	emerge_message = "¡Ragnaros se yerge, 3 minutos hasta que se sumerja!",
	submerge_60sec_message = "¡60 segundos hasta que se sumerja Ragnaros!",
	submerge_30sec_message = "¡30 segundos hasta que se sumerja Ragnaros!",
	submerge_10sec_message = "¡10 segundos hasta que se sumerja Ragnaros!",
	submerge_5sec_message = "¡5 segundos hasta que se sumerja Ragnaros!",

	knockback_bar = "Cólera de Ragnaros",
	emerge_bar = "Ragnaros se yerge",
	submerge_bar = "Ragnaros se sumerja",

	sonofflame = "Hijos de la llama",
	sonsdeadwarn = "¡%d/8 Hijos de la llama muertos!",

	cmd = "Ragnaros",

	--start_cmd = "start",
	start_name = "Empezar",
	start_desc = "Empieza una barra para estimar el comienzo de la pelea.",

	--emerge_cmd = "emerge",
	emerge_name = "Alerta de Emersión",
	emerge_desc = "Avisa para Emersión de Ragnaros",

	--adds_cmd = "adds",
	adds_name = "Hijo de la llama muerto",
	adds_desc = "Avisa cuando muera un hijo de la llama",

	--submerge_cmd = "submerge",
	submerge_name = "Alerta de Sumersión",
	submerge_desc = "Avisa cuando se sumerja Ragnaros",

	--aoeknock_cmd = "aoeknock",
	aoeknock_name = "Alerta de Cólera de Ragnaros",
	aoeknock_desc = "Avisa para el rechazo de Cólera de Ragnaros",

	["Combat"] = "Combate",
} end)

L:RegisterTranslations("deDE", function() return {
	knockback_trigger = "DIE FLAMMEN VON SULFURON",
	submerge_trigger = "^Kommt herbei, meine Diener!",
	engage_trigger = "^NUN ZU EUCH,",
	engage_soon_trigger = "ZU FRÜH!",
	hammer_trigger = "^DAS FEUER WIRD EUCH!",

	knockback_message = "Rücksto\195\159!",
	knockback_soon_message = "3 Sekunden bis Rücksto\195\159!",
	submerge_message = "Ragnaros ist untergetaucht! Söhne der Flamme kommen!",
	emerge_soon_message = "15 Sekunden bis Ragnaros auftaucht",
	emerge_message = "Ragnaros ist aufgetaucht, Untertauchen in 3 Minuten!",
	submerge_60sec_message = "Auftauchen in 60 Sekunden!",
	submerge_30sec_message = "Auftauchen in 30 Sekunden!",
	submerge_10sec_message = "Auftauchen in 10 Sekunden!",
	submerge_5sec_message = "Auftauchen in 5 Sekunden!",

	knockback_bar = "AoE Rücksto\195\159",
	emerge_bar = "Ragnaros taucht auf",
	submerge_bar = "Ragnaros taucht unter",

	sonofflame = "Sohn der Flamme",
	sonsdeadwarn = "%d/8 Sohn der Flamme tot!",

	--cmd = "Ragnaros",

	start_cmd = "start",
	start_name = "Start",
	start_desc = "Startet eine Balken f\195\188r die Sch\195\164tzung der Beginn des Kampfes.",

	--emerge_cmd = "emerge",
	emerge_name = "Alarm für Abtauchen",
	emerge_desc = "Warnen, wenn Ragnaros auftaucht",

	--adds_cmd = "adds",
	adds_name = "Zähler für tote Adds",
	adds_desc = "Verkündet Sohn der Flamme Tod",

	--submerge_cmd = "submerge",
	submerge_name = "Alarm für Untertauchen",
	submerge_desc = "Warnen, wenn Ragnaros untertaucht",

	--aoeknock_cmd = "aoeknock",
	aoeknock_name = "Alarm für Rücksto\195\159",
	aoeknock_desc = "Warnen, wenn Zorn des Ragnaros zurückstö\195\159t",

	["Combat"] = "Kampf beginnt",
} end)

local lastKnockback = nil

------------------------------
--      Initialization      --
------------------------------

module.wipemobs = { L["sonofflame"] }
--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:ThrottleSync(5, syncName.knockback)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")

	self.started = nil
	lastKnockback = nil
	self.barstarted = false
	firstKnockback = true
	sonsdead = 0
end

-- called after boss is engaged
function module:OnEngage()
	self:ScheduleRepeatingEvent("bwragnarosemergecheck", self.EmergeCheck, 1, self)
	self:EmergeCheck()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if string.find(msg, L["sonofflame"]) then
		self:Sync(syncName.sons .. " " .. tostring(sonsdead + 1))
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["knockback_trigger"]) and self.db.profile.aoeknock then
		self:Sync(syncName.knockback)
	elseif string.find(msg, L["submerge_trigger"]) or string.find(msg, L["submerge_trigger2"]) then
		self:Sync(syncName.submerge)
	elseif string.find(msg, L["engage_trigger"]) then
		self:SendEngageSync()
	elseif string.find(msg, L["engage_soon_trigger1"]) and self.db.profile.start then
		self:Bar(L["Combat"], timer.emerge_soon1, icon.emerge_soon)
		self.barstarted = true
	elseif string.find(msg, L["engage_soon_trigger2"]) and self.db.profile.start and not self.barstarted then
		self:Bar(L["Combat"], timer.emerge_soon2, icon.emerge_soon)
		self.barstarted = true
	elseif string.find(msg, L["engage_soon_trigger3"]) and self.db.profile.start and not self.barstarted then
		self:Bar(L["Combat"], timer.emerge_soon3, icon.emerge_soon)
	elseif string.find(msg ,L["hammer_trigger"]) then
	--self:Bar("Hammer of Ragnaros", timer.hammer_of_ragnaros, icon.hammer_of_ragnaros) -- doesn't do anything on nefarian
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.sons and rest and rest ~= "" then
		rest = tonumber(rest)
		if rest <= 8 and sonsdead < rest then
			sonsdead = rest
			if self.db.profile.adds then
				self:Message(string.format(L["sonsdeadwarn"], sonsdead), "Positive")
			end
			if sonsdead == 8 then
			end
			--self:TriggerEvent("BigWigs_SetCounterBar", self, "Sons dead", (8 - sonsdead))
		end
	elseif sync == syncName.knockback then
		self:Knockback()
	elseif sync == syncName.submerge then
		self:Submerge()
	elseif sync == syncName.emerge then
		self:Emerge()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Submerge()
	phase = "submerged"
	self:CancelScheduledEvent("bwragnarosaekbwarn")
	_, _, lastKnockback = self:BarStatus(L["knockback_bar"])
	self:RemoveBar(L["knockback_bar"])
	self:CancelDelayedMessage(L["knockback_soon_message"])
	self:CancelDelayedWarningSign(icon.knockbackWarn)
	self:RemoveWarningSign(icon.knockbackWarn, true)

	if self.db.profile.submerge then
		self:Message(L["submerge_message"], "Important")
	end
	if self.db.profile.emerge then
		self:Bar(L["emerge_bar"], timer.emerge, icon.emerge)
		self:DelayedMessage(timer.emerge - 15, L["emerge_soon_message"], "Urgent", nil, nil, true)
	end
	self:ScheduleRepeatingEvent("bwragnarosemergecheck", self.EmergeCheck, 1, self)
	self:DelayedSync(timer.emerge, syncName.emerge)
	--self:TriggerEvent("BigWigs_StartCounterBar", self, "Sons dead", 8, "Interface\\Icons\\spell_fire_fire")
	--self:TriggerEvent("BigWigs_SetCounterBar", self, "Sons dead", (8 - 0.1))
end

function module:Emerge()
	phase = "emerged"
	firstKnockback = true
	sonsdead = 0 -- reset counter

	self:CancelDelayedSync(syncName.emerge)
	self:CancelScheduledEvent("bwragnarosemergecheck")
	self:CancelDelayedMessage(L["emerge_soon_message"])
	self:RemoveBar(L["emerge_bar"])

	if self.db.profile.emerge then
		self:Message(L["emerge_message"], "Attention")
	end

	if lastKnockback then
		local knocktimer = timer.earliestKnockback-lastKnockback
		local latestKnocktimer = timer.latestKnockback-lastKnockback
		if knocktimer > 0 then
			self:IntervalBar(L["knockback_bar"], knocktimer, latestKnocktimer, icon.knockback)
		end
		if knocktimer > 3 then
			self:DelayedMessage(knocktimer - 3, L["knockback_soon_message"], "Urgent", true, "Alarm", nil, nil, true)
			self:DelayedWarningSign(knocktimer - 3, icon.knockbackWarn, 8)
		else
			self:Message(L["knockback_soon_message"], "Urgent", true, "Alarm", nil, nil, true)
			self:WarningSign(icon.knockbackWarn, 8)
		end
		firstKnockback = false
	else
		self:Knockback()
	end

	if self.db.profile.submerge then
		self:Bar(L["submerge_bar"], timer.submerge, icon.submerge)

		self:DelayedMessage(timer.submerge - 60, L["submerge_60sec_message"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.submerge - 30, L["submerge_30sec_message"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.submerge - 10, L["submerge_10sec_message"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.submerge - 5, L["submerge_5sec_message"], "Attention", nil, nil, true)

		--self:DelayedSync(timer.submerge, syncName.submerge)
	end
	--self:TriggerEvent("BigWigs_StopCounterBar", self, "Sons dead")
end

function module:Knockback()
	if phase == "submerged" then
		self:Emerge()
	end
	if self.db.profile.aoeknock then
		if not firstKnockback then
			self:Message(L["knockback_message"], "Important")
		end
		firstKnockback = false
		self:RemoveWarningSign(icon.knockbackWarn, true)
		self:IntervalBar(L["knockback_bar"], timer.earliestKnockback, timer.latestKnockback, icon.knockback)
		self:DelayedMessage(timer.earliestKnockback - 3, L["knockback_soon_message"], "Urgent", true, "Alarm", nil, nil, true)
		self:DelayedWarningSign(timer.earliestKnockback - 3, icon.knockbackWarn, 8)
	end
end


------------------------------
--      Utility	Functions   --
------------------------------

function module:EmergeCheck()
	if UnitExists("target") and UnitName("target") == module.translatedName and UnitExists("targettarget") and UnitName("targettarget") ~= "Majordomo Executus" then
		self:Sync(syncName.emerge)
		return
	end

	local num = GetNumRaidMembers()
	for i = 1, num do
		local raidUnit = string.format("raid%starget", i)
		if UnitExists(raidUnit) and UnitName(raidUnit) == module.translatedName and UnitExists(raidUnit .. "target") and UnitName(raidUnit .. "target") ~= "Majordomo Executus" then
			self:Sync(syncName.emerge)
			return
		end
	end
end
