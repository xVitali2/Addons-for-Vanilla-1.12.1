
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("C'Thun", "Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Cthun",

	startwarn	= "C'Thun engaged! - 45 sec until Dark Layr and Eyes",
	barStartRandomBeams = "Start of Random Beams!",

	eye_beam_trigger = "Giant Eye Tentacle begins to cast Eye Beam.",
	eye_beam_trigger_cthun = "Eye of C'Thun begins to cast Eye Beam.",
	eyebeam		= "Eye Beam on %s",
	Unknown = "Unknown", -- Eye Beam on Unknown

	tentacle_cmd = "tentacle",
	tentacle_name = "Tentacle Alert",
	tentacle_desc = "Warn for Tentacles",
	rape_cmd = "rape",
	rape_name = "Rape jokes are funny",
	rape_desc = "Some people like hentai jokes.",
	tentacle	= "Tentacle Rape Party - 5 sec",
	norape		= "Tentacles in 5sec!",
	barTentacle	= "Tentacle rape party!",
	barNoRape	= "Tentacle party!",

	glare_cmd = "glare",
	glare_name = "Dark Layr Alert",
	glare_desc = "Warn for Dark Layr",
	glare		= "Dark Layr!",
	msgGlareEnds	= "Dark Layr ends in 5 sec",
	barGlare	= "Next Dark Layr!",
	barGlareEnds = "Dark Layr ends",
	barGlareCasting = "Casting Dark Layr",

	group_cmd = "group",
	group_name = "Dark Layr Group Warning",
	group_desc = "Warn for Dark Layr on Group X",

	phase2starting	= "The Eye is dead! Body incoming!",

	playersInStomach = "Players in Stomach",

	giant_cmd = "giant",
	giant_name = "Giant Eye Alert",
	giant_desc = "Warn for Giant Eyes",
	barGiant	= "Giant Eye!",
	barGiantC	= "Giant Claw!",
	GiantEye = "Giant Eye Tentacle in 5 sec!",
	gedownwarn	= "Giant Eye down!",

	weakened_cmd = "weakened",
	weakened_name = "Weakened Alert",
	weakened_desc = "Warn for Weakened State",
	weakenedtrigger = "is weakened!",
	weakened	= "C'Thun is weakened for 45 sec",
	invulnerable2	= "Party ends in 5 seconds",
	invulnerable1	= "Party over - C'Thun invulnerable",
	barWeakened	= "C'Thun is weakened!",

	acid_cmd = "acid",
	acid_name = "Digestive Acid alert",
	acid_desc = "Shows a warning sign when you have 5 stacks of digestive acid",
	digestiveAcidTrigger = "You are afflicted by Digestive Acid [%s%(]*([%d]*).",
	msgDigestiveAcid = "5 Acid Stacks",

	["Second TentacleHP"] = "Second Tentacle %d%%",
	["First Tentacle dead"] = "First Tentacle dead",
	["First Tentacle"] = "First Tentacle",
	["Second Tentacle"] = "Second Tentacle",

	--[[GNPPtrigger	= "Nature Protection",
	GSPPtrigger	= "Shadow Protection",
	Sundertrigger	= "Sunder Armor",
	CoEtrigger	= "Curse of the Elements",
	CoStrigger	= "Curse of Shadow",
	CoRtrigger	= "Curse of Recklessness",]]


	proximity_cmd = "proximity",
	proximity_name = "Proximity Warning",
	proximity_desc = "Show Proximity Warning Frame",

	stomach_cmd = "stomach",
	stomach_name = "Players in Stomach",
	stomach_desc = "Show players in stomach instead of too close players",

} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Cthun",

	startwarn	= "¡C'Thun enfurecido! - 45 segundos hasta Mirada oscura y Ojos",
	barStartRandomBeams = "¡Comienza a lanzar Haz aleatorio!",

	eye_beam_trigger = "Tentáculo ocular gigante comienza a lanzar Haz ocular.",
	eye_beam_trigger_cthun = "Ojo de C'Thun comienza a lanzar Haz ocular.",
	eyebeam		= "Haz ocular a %s",
	Unknown = "Desconocido", -- Eye Beam on Unknown

	--tentacle_cmd = "tentacle",
	tentacle_name = "Alerta de Tentáculo",
	tentacle_desc = "Avisa para Tentáculos",
	--rape_cmd = "rape",
	rape_name = "Broma",
	rape_desc = "Bromas de C'Thun.",
	tentacle	= "Tentáclulos en 5 segundos",
	norape		= "¡Tentáculos en 5 segundos!",
	barTentacle	= "¡Tentáculos!",
	barNoRape	= "¡Montón de Tentáculos!",

	--glare_cmd = "glare",
	glare_name = "Alerta de Mirada oscura",
	glare_desc = "Avisa para Mirada oscura",
	glare		= "¡Mirada oscura!",
	msgGlareEnds	= "Mirada oscura desaparecerá en 5 segundos",
	barGlare	= "¡Próxima Mirada oscura!",
	barGlareEnds = "Mirada oscura desaparece",
	barGlareCasting = "Lanzando Mirada oscura",

	--group_cmd = "group",
	group_name = "Alerta de Mirada oscura al Grupo",
	group_desc = "Avisa para Mirada oscura al Grupo X",

	phase2starting	= "¡El Ojo está muerto! Cuerpo entrante!",

	playersInStomach = "Jugadores en el estómago",

	--giant_cmd = "giant",
	giant_name = "Alerta de Tentáculo ocular gigante",
	giant_desc = "Avisa para Tentáculos oculares gigantes",
	barGiant	= "¡Tentáculo ocular gigante!",
	barGiantC	= "¡Tentáculo garral gigante!",
	GiantEye = "¡Tentáculo ocular gigante in 5 segundos!",
	gedownwarn	= "¡Ha muerto Tentáculo ocular gigante!",

	--weakened_cmd = "weakened",
	weakened_name = "Alerta de Debilitado",
	weakened_desc = "Avisa para Estado Debilitado",
	weakenedtrigger = "está debilitado!",
	weakened	= "C'Thun está debilitado por 45 segundos",
	invulnerable2	= "Fiesta termina en 5 segundos",
	invulnerable1	= "Fiesta termina - C'Thun invulnerable",
	barWeakened	= "¡C'Thun está debilitado!",

	--acid_cmd = "acid",
	acid_name = "Alerta de Ácido digestivo",
	acid_desc = "Avisa cuando tengas 5 montones de Ácido digestivo",
	digestiveAcidTrigger = "sufres de Ácido digestivo [%s%(]*([%d]*).",
	msgDigestiveAcid = "5 Montones de Ácido",

	["Second TentacleHP"] = "Segundo Tentáculo %d%%",
	["First Tentacle dead"] = "Primer Tentáculo ha muerto",
	["First Tentacle"] = "Primer Tentáculo",
	["Second Tentacle"] = "Segundo Tentáculo",

	--[[GNPPtrigger	= "Nature Protection",
	GSPPtrigger	= "Shadow Protection",
	Sundertrigger	= "Sunder Armor",
	CoEtrigger	= "Curse of the Elements",
	CoStrigger	= "Curse of Shadow",
	CoRtrigger	= "Curse of Recklessness",]]


	--proximity_cmd = "proximity",
	proximity_name = "Alerta de Proximidad",
	proximity_desc = "Muestra marco de alerta de Proximidad",

	--stomach_cmd = "stomach",
	stomach_name = "Jugadores en Estómago",
	stomach_desc = "Muestra jugadores en estómago en lugar de jugadores cercanos",

} end )

L:RegisterTranslations("deDE", function() return {
	--cmd = "Cthun",

	startwarn	= "C'Thun angegriffen! - 45 sec bis Dunkles Starren und Augen", --"C'Thun engaged! - 45 sec until Dark Layr and Eyes",
	barStartRandomBeams = "Beginn zufälliger Strahlen!",

	eye_beam_trigger = "Riesiges Augententakel beginnt Augenstrahl zu wirken", --"Giant Eye Tentacle begins to cast Eye Beam.", -- Riesiges Augententakel beginnt Augenstrahl zu wirken
	eye_beam_trigger_cthun = "Auge von C'Thun beginnt Augenstrahl zu wirken", --"Eye of C'Thun begins to cast Eye Beam.", --
	eyebeam		= "Augenstrahl auf %s", --"Eye Beam on %s",
	Unknown = "Unbekannt", -- Eye Beam on Unknown

	--tentacle_cmd = "tentacle",
	tentacle_name = "Tentakel Alarm",
	tentacle_desc = "Warnung vor Tentakeln", --"Warn for Tentacles",
	--rape_cmd = "rape",
	rape_name = "Rape jokes are funny",
	rape_desc = "Some people like hentai jokes.",
	tentacle	= "Tentakel Rape Party - 5 sec", --"Tentacle Rape Party - 5 sec",
	norape		=  "Tentakel in 5sec!", --"Tentacles in 5sec!",
	barTentacle	= "Tentakel Rape Party!", -- "Tentacle rape party!",
	barNoRape	= "Tentakel Party", --"Tentacle party!",

	--glare_cmd = "glare",
	glare_name = "Dunkles Starren Alarm", --"Dark Layr Alert", -- Dunkles Starren
	glare_desc = "Warnung for Dunklem Starren", --"Warn for Dark Layr",
	glare		= "Dunkles Starren!", -- "Dark Layr!",
	msgGlareEnds	= "Dunkles Starren endet in 5 sec", -- "Dark Layr ends in 5 sec",
	barGlare	= "Nächstes Dunkles Starren!", -- "Next Dark Layr!",
	barGlareEnds = "Dunkles Starren endet", -- Dark Layr ends",
	barGlareCasting = "Zaubert Dunkles Starren", -- "Casting Dark Layr",

	--group_cmd = "group",
	group_name = "Dunkles Starren Gruppenwarnung", -- "Dark Layr Group Warning",
	group_desc = "Warnt vor Dunkles Starren auf Gruppe X", -- "Warn for Dark Layr on Group X",

	phase2starting	= "Das Auge ist tot! Phase 2 beginnt.", -- "The Eye is dead! Body incoming!",

	--giant_cmd = "giant",
	giant_name = "Riesiges Augententakel Alarm", --Giant Eye Alert",
	giant_desc = "Warnung vor Riesigem Augententakel", -- "Warn for Giant Eyes",
	barGiant	= "Riesiges Augententakel!",
	barGiantC	= "Riesiges Klauententakel!",
	GiantEye = "Riesiges Augententakel Tentacle in 5 sec!",
	gedownwarn	= "Riesiges Augententakel tot!",

	--weakened_cmd = "weakened",
	weakened_name = "Schwäche Alarm", --"Weakened Alert",
	weakened_desc = "Warnung für Schwäche Phase", -- "Warn for Weakened State",
	weakenedtrigger = "ist geschwächt", -- "is weakened!",
	weakened	= "C'Thun ist für 45 sec geschwächt", --"C'Thun is weakened for 45 sec",
	invulnerable2	= "Party endet in 5 sec", --"Party ends in 5 seconds",
	invulnerable1	= "Party vorbei - C'Thun unverwundbar", -- "Party over - C'Thun invulnerable",
	barWeakened	= "C'Thun ist geschwächt", --"C'Thun is weakened!",

	acid_cmd = "acid",
	acid_name = "Magensäure Alarm",
	acid_desc = "Zeigt ein Warnzeichen wenn du mehr als 5 Stapel der Magensäure hast.",
	digestiveAcidTrigger = "Ihr seid von Magensäure [%s%(]*([%d]*)", -- "You are afflicted by Digestive Acid (5).",
	msgDigestiveAcid = "5 Säure Stacks",

	--[[GNPPtrigger	= "Nature Protection",
	GSPPtrigger	= "Shadow Protection",
	Sundertrigger	= "Sunder Armor",
	CoEtrigger	= "Curse of the Elements",
	CoStrigger	= "Curse of Shadow",
	CoRtrigger	= "Curse of Recklessness",]]

	proximity_cmd = "proximity",
	proximity_name = "Nähe Warnungsfenster",
	proximity_desc = "Zeit das Nähe Warnungsfenster",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20011 -- To be overridden by the module!
local eyeofcthun = AceLibrary("Babble-Boss-2.2")["Eye of C'Thun"]
local cthun = AceLibrary("Babble-Boss-2.2")["C'Thun"]
module.enabletrigger = {eyeofcthun, cthun} -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"rape", -1, "tentacle", "glare", "group", -1, "giant", "acid", "weakened", -1, "proximity", "stomach", "bosskill"}

-- Proximity Plugin
module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
module.proximitySilent = false


-- locals
local timer = {
	p1RandomEyeBeams = 6, -- how long does eye of c'thun target the same player at the beginning
	p1Tentacle = 45,      -- tentacle timers for phase 1
	p1TentacleStart = 45, -- delay for first tentacles from engage onwards
	p1GlareStart = 45,    -- delay for first dark glare from engage onwards
	p1Glare = 87,         -- interval for dark glare
	p1GlareCasting = 3,   -- time it takes from casting dark glare until the spell starts
	p1GlareDuration = 39, -- duration of dark glare

	p2Tentacle = 30,      -- tentacle timers for phase 2
	p2ETentacle = 60,     -- Eye tentacle timers for phase 2
	p2GiantClaw = 60,     -- Giant Claw timer for phase 2
	p2FirstGiantClaw = 12, -- first giant claw after eye of c'thun dies
	p2FirstGiantEye = 42, -- first giant eye after eye of c'thun dies
	p2FirstEyeTentacles = 42, -- first eye tentacles after eye of c'thun dies
	p2FirstGiantClawAfterWeaken = 8,
	p2FirstGiantEyeAfterWeaken = 38,
	p2FirstEyeAfterWeaken = 38,


	reschedule = 50,      -- delay from the moment of weakening for timers to restart
	target = 1,           -- delay for target change checking on Eye of C'Thun and Giant Eye Tentacle
	CheckTentacleHP = 0.5, -- delay for updating flesh tentacle hp
	weakened = 45,        -- duration of a weaken

	eyeBeam = 2,         -- Eye Beam Cast time
}
local icon = {
	giantEye = "inv_misc_eye_01", --"Interface\\Icons\\Ability_EyeOfTheOwl"
	giantClaw = "Spell_Nature_Earthquake",
	eyeTentacles = "spell_shadow_siphonmana", --"Interface\\Icons\\Spell_Nature_CallStorm"
	darkGlare = "Inv_misc_ahnqirajtrinket_04",
	weaken = "INV_ValentinesCandy",
	eyeBeamSelf = "Ability_creature_poison_05",
	digestiveAcid = "ability_creature_disease_02",
}
local syncName = {
	p2Start = "CThunP2Start"..module.revision,
	weaken = "CThunWeakened"..module.revision,
	weakenOver = "CThunWeakenedOver"..module.revision,
	tentacleSpawn = "TentacleSpawn"..module.revision,
	giantEyeDown = "CThunGEdown"..module.revision,
	giantClawSpawn = "GiantClawSpawn"..module.revision,
	giantEyeSpawn = "GiantEyeSpawn"..module.revision,
	eyeBeam = "CThunEyeBeam"..module.revision,
	fleshtentacledead = "CThunFleshTentacleDead"..module.revision,
}

local gianteye = "Giant Eye Tentacle"
local fleshtentacle = "Flesh Tentacle"

local cthunstarted = nil
local phase2started = nil
local fleshtentacledead = false
local firstGlare = nil
local firstWarning = nil
--local target = nil
local tentacletime = timer.p1Tentacle
local isWeakened = nil

local doCheckForWipe = false

local eyeTarget = nil


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "Emote")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "Emote")

	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "CheckEyeBeam")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckDigestiveAcid")

	self:ThrottleSync(20, syncName.p2Start)
	self:ThrottleSync(50, syncName.weaken)
	self:ThrottleSync(3, syncName.giantEyeDown)
	self:ThrottleSync(600, syncName.weakenOver)
	self:ThrottleSync(30, syncName.fleshtentacledead)
	self:ThrottleSync(25, syncName.giantClawSpawn)
	self:ThrottleSync(25, syncName.giantEyeSpawn)
	self:ThrottleSync(25, syncName.tentacleSpawn)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")

	self.started = nil
	self.tentacleHP = 100
	self.warning = 100
	fleshtentacledead = false
	eyeTarget = nil
	cthunstarted = nil
	firstGlare = nil
	firstWarning = nil
	phase2started = nil
	doCheckForWipe = false

	tentacletime = timer.p1Tentacle

	self:RemoveProximity()
	self:TriggerEvent("BigWigs_StopDebuffTrack")
end

-- called after boss is engaged
function module:OnEngage()
	self:CThunStart()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
	self:RemoveProximity()
	self:TriggerEvent("BigWigs_StopDebuffTrack")
end


----------------------
--  Event Handlers  --
----------------------

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if (msg == string.format(UNITDIESOTHER, eyeofcthun)) then
		self:Sync(syncName.p2Start)
	elseif (msg == string.format(UNITDIESOTHER, gianteye)) then
		self:Sync(syncName.giantEyeDown)
	elseif (msg == string.format(UNITDIESOTHER, fleshtentacle)) and not fleshtentacledead then
		self:Sync(syncName.fleshtentacledead)
	end
end

function module:CheckForWipe(event)
	if doCheckForWipe then
		BigWigs:DebugMessage("doCheckForWipe")
		BigWigs:CheckForWipe(self)
	end
end

function module:Emote( msg )
	if string.find(msg, L["weakenedtrigger"]) then
		self:Sync(syncName.weaken)
	end
end

function module:CheckEyeBeam(msg)
	if string.find(msg, L["eye_beam_trigger"]) then
		self:DebugMessage("Eye Beam trigger")
		self:Sync(syncName.eyeBeam)
	elseif string.find(msg, L["eye_beam_trigger_cthun"]) then
		self:DebugMessage("C'Thun Eye Beam trigger")
		self:Sync(syncName.eyeBeam)
		if not cthunstarted then
			self:SendEngageSync()
		end
	end
end

function module:CheckDigestiveAcid(msg)
	local _, _, stacks = string.find(msg, L["digestiveAcidTrigger"])

	if stacks then
		self:DebugMessage("Digestive Acid Stacks: " .. stacks)
		if tonumber(stacks) == 5 then
			self:DigestiveAcid()
		end
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.p2Start then
		self:CThunP2Start()
	elseif sync == syncName.weaken then
		self:CThunWeakened()
	elseif sync == syncName.weakenOver then
		self:CThunWeakenedOver()
	elseif sync == syncName.giantEyeDown then
		self:Message(L["gedownwarn"], "Positive")
	elseif sync == syncName.eyeBeam then
		self:EyeBeam()
	elseif sync == syncName.giantClawSpawn then
		self:GCTentacleRape()
	elseif sync == syncName.giantEyeSpawn then
		self:GTentacleRape()
	elseif sync == syncName.tentacleSpawn then
		self:TentacleRape()
	elseif sync == syncName.fleshtentacledead then
		fleshtentacledead = true
		self.tentacleHP = 100
		self:Message(L["First Tentacle dead"], "Important" )
		self:TriggerEvent("BigWigs_StopHPBar", self, L["First Tentacle"])
		self:TriggerEvent("BigWigs_StartHPBar", self, L["Second Tentacle"], 100)
		self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 0)
	end
end

-----------------------
--   Sync Handlers   --
-----------------------

function module:CThunStart()
	self:DebugMessage("CThunStart: ")
	if not cthunstarted then
		cthunstarted = true
		doCheckForWipe = true

		self:Message(L["startwarn"], "Attention", false, false)
		self:Sound("Shakira")
		self:Bar(L["barStartRandomBeams"], timer.p1RandomEyeBeams, icon.giantEye)

		if self.db.profile.tentacle then
			self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], timer.p1TentacleStart, icon.eyeTentacles)
			self:DelayedMessage(timer.p1TentacleStart - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, "Alert")
		end

		firstGlare = true
		self:DarkGlare()

		firstWarning = true

		self:DelayedSync(timer.p1TentacleStart, syncName.tentacleSpawn)
		self:ScheduleRepeatingEvent("bwcthuntarget", self.CheckTarget, timer.target, self)

		self:Proximity()
	end
end

function module:CThunP2Start()
	if not phase2started then
		phase2started = true
		doCheckForWipe = false -- disable wipe check since we get out of combat, enable it later again
		tentacletime = timer.p2Tentacle

		self:TriggerEvent("BigWigs_StartHPBar", self, L["First Tentacle"], 100)
		self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 0)
		self:ScheduleRepeatingEvent("bwcthunCheckTentacleHP", self.CheckTentacleHP, timer.CheckTentacleHP, self )

		self:Message(L["phase2starting"], "Bosskill")

		-- cancel dark glare
		self:RemoveBar(L["barGlare"] )
		self:RemoveBar(L["barGlareCasting"] )
		self:RemoveBar(L["barGlareEnds"] )
		self:CancelScheduledEvent("bwcthundarkglare") -- ok
		self:CancelDelayedBar(L["barGlareEnds"])
		self:CancelDelayedBar(L["barGlare"])
		self:RemoveWarningSign(icon.darkGlare)

		-- cancel eye tentacles

		self:RemoveBar(L["barTentacle"] )
		self:RemoveBar(L["barNoRape"] )
		self:CancelDelayedMessage(self.db.profile.rape and L["tentacle"] or L["norape"])
		self:CancelDelayedSync(syncName.tentacleSpawn)

		-- cancel dark glare group warning
		self:CancelScheduledEvent("bwcthuntarget") -- ok

		self:RemoveBar(L["barStartRandomBeams"] )

		-- start P2 events
		if self.db.profile.tentacle then
			-- first eye tentacles
			self:DelayedMessage(timer.p2FirstEyeTentacles - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, nil, true)
			self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], timer.p2FirstEyeTentacles, icon.eyeTentacles)
		end

		if self.db.profile.giant then
			self:Bar(L["barGiant"], timer.p2FirstGiantEye, icon.giantEye)
			self:DelayedMessage(timer.p2FirstGiantEye - 5, L["GiantEye"], "Urgent", false, nil, true)

			self:Bar(L["barGiantC"], timer.p2FirstGiantClaw, icon.giantClaw)
		end

		self:DelayedSync(timer.p2FirstEyeTentacles, syncName.tentacleSpawn)
		self:DelayedSync(timer.p2FirstGiantEye, syncName.giantEyeSpawn)
		self:DelayedSync(timer.p2FirstGiantClaw, syncName.giantClawSpawn)
		self:ScheduleRepeatingEvent("bwcthuntargetp2", self.CheckTarget, timer.target, self )

	end
	if self.db.profile.stomach then
		self:TriggerEvent("BigWigs_StartDebuffTrack", self:ToString(), "Interface\\Icons\\Ability_Creature_Disease_02", L["playersInStomach"])
	end
end

function module:CThunWeakened()
	isWeakened = true
	fleshtentacledead = false
	self.tentacleHP = 100
	self.warning = 100
	self:TriggerEvent("BigWigs_StopHPBar", self, L["Second Tentacle"])
	self:ThrottleSync(0.1, syncName.weakenOver)

	if self.db.profile.weakened then
		self:Message(L["weakened"], "Positive" )
		self:Sound("Murloc")
		self:Bar(L["barWeakened"], timer.weakened, icon.weaken)
		self:Message(timer.weakened - 5, L["invulnerable2"], "Urgent")
	end

	-- cancel tentacle timers
	self:CancelDelayedMessage(self.db.profile.rape and L["tentacle"] or L["norape"])
	self:CancelDelayedMessage(L["GiantEye"])
	self:CancelDelayedSync(syncName.giantEyeSpawn)
	self:CancelDelayedSync(syncName.giantClawSpawn)
	self:CancelDelayedSync(syncName.tentacleSpawn)


	self:RemoveBar(L["barTentacle"])
	self:RemoveBar(L["barNoRape"])
	self:RemoveBar(L["barGiant"])
	self:RemoveBar(L["barGiantC"])

	self:DelayedSync(timer.weakened, syncName.weakenOver)
end

function module:CThunWeakenedOver()
	isWeakened = nil
	self:ThrottleSync(600, syncName.weakenOver)
	self.tentacleHP = 100
	self:TriggerEvent("BigWigs_StartHPBar", self, L["First Tentacle"], 100)
	self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 0)
	self:CancelDelayedSync(syncName.weakenOver) -- ok

	if self.db.profile.weakened then
		self:RemoveBar(L["barWeakened"])
		self:CancelDelayedMessage(L["invulnerable2"])

		self:Message(L["invulnerable1"], "Important")
	end

	-- next giant claw 10s after weaken
	self:Bar(L["barGiantC"], timer.p2FirstGiantClawAfterWeaken, icon.giantClaw)
	self:DelayedSync(timer.p2FirstGiantClawAfterWeaken, syncName.giantClawSpawn)

	-- next giant eye 40s after weaken
	self:Bar(L["barGiant"], timer.p2FirstGiantEyeAfterWeaken, icon.giantEye)
	self:DelayedSync(timer.p2FirstGiantEyeAfterWeaken, syncName.giantEyeSpawn)
	self:DelayedMessage(timer.p2FirstGiantEyeAfterWeaken - 5, L["GiantEye"], "Urgent", false, nil, true)

	--next rape party
	self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], timer.p2FirstEyeAfterWeaken, icon.eyeTentacles)
	self:DelayedSync(timer.p2FirstEyeAfterWeaken, syncName.tentacleSpawn)
	self:DelayedMessage(timer.p2FirstEyeAfterWeaken - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, nil, true)
end

function module:DelayedEyeBeamCheck()
	local name = L["Unknown"]
	self:CheckTarget()
	if eyeTarget then
		name = eyeTarget
		self:Icon(name)
		if name == UnitName("player") then
			self:WarningSign(icon.eyeBeamSelf, 2 - 0.1)
		end
	end
	self:Bar(string.format(L["eyebeam"], name), timer.eyeBeam - 0.1, icon.giantEye, true, "green")
end
function module:EyeBeam()
	self:ScheduleEvent("CThunDelayedEyeBeamCheck", self.DelayedEyeBeamCheck, 0.1, self) -- has to be done delayed since the target change is delayed
end

function module:DigestiveAcid()
	if self.db.profile.acid then
		self:Message(L["msgDigestiveAcid"], "Red", true, "RunAway")
		self:WarningSign(icon.digestiveAcid, 5) --ability_creature_disease_02
	end
end

-----------------------
-- Utility Functions --
-----------------------
function module:CheckTentacleHP()
	local health
	if UnitName("playertarget") == fleshtentacle then
		health = UnitHealth("playertarget")
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == fleshtentacle then
				health = UnitHealth("Raid"..i.."target")
				break;
			end
		end
	end

	if health and health ~= self.tentacleHP and health < self.tentacleHP then
		self.tentacleHP = health
		if fleshtentacledead then
			self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 100-self.tentacleHP)
			if self.tentacleHP < 10 and self.warning > 10 then
				self.warning = 10
				self:Message(string.format(L["Second TentacleHP"], self.warning), "Important" )
			elseif self.tentacleHP < 20 and self.warning > 20 then
				self.warning = 20
				self:Message(string.format(L["Second TentacleHP"], self.warning), "Important" )
			elseif self.tentacleHP < 30 and self.warning > 30 then
				self.warning = 30
				self:Message(string.format(L["Second TentacleHP"], self.warning), "Important" )
			elseif self.tentacleHP < 40 and self.warning > 40 then
				self.warning = 40
				self:Message(string.format(L["Second TentacleHP"], self.warning), "Important" )
			end
		else
			self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 100-self.tentacleHP)
		end
	end
end

function module:CheckTarget()
	local i
	local newtarget = nil
	local enemy = eyeofcthun

	if phase2started then
		enemy = gianteye
	end
	if UnitName("playertarget") == enemy then
		newtarget = UnitName("playertargettarget")
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == enemy then
				newtarget = UnitName("Raid"..i.."targettarget")
				break
			end
		end
	end
	if newtarget then
		eyeTarget = newtarget
	end
end

-- P1
function module:DarkGlare()
	if self.db.profile.glare then
		if firstGlare then
			self:ScheduleEvent("bwcthundarkglare", self.DarkGlare, timer.p1GlareStart, self )

			self:Bar(L["barGlare"], timer.p1GlareStart, icon.darkGlare)
			firstGlare = nil
		else
			self:ScheduleEvent("bwcthundarkglare", self.DarkGlare, timer.p1Glare, self )

			self:WarningSign(icon.darkGlare, timer.p1GlareCasting)
			self:Message(L["glare"], "Urgent", true, false)
			self:Bar(L["barGlareCasting"], timer.p1GlareCasting, icon.darkGlare)

			self:DelayedBar(timer.p1GlareCasting, L["barGlareEnds"], timer.p1GlareDuration, icon.darkGlare)
			self:DelayedMessage(timer.p1GlareCasting + timer.p1GlareDuration - 5, L["msgGlareEnds"], "Urgent", false, nil, true)
			self:DelayedBar(timer.p1GlareCasting + timer.p1GlareDuration, L["barGlare"], timer.p1Glare - timer.p1GlareCasting - timer.p1GlareDuration, icon.darkGlare)
		end
	end
end

-- P2
function module:GTentacleRape()
	self:DelayedSync(timer.p2ETentacle, syncName.giantEyeSpawn)
	if self.db.profile.giant then
		self:Bar(L["barGiant"], timer.p2ETentacle, icon.giantEye)
		self:DelayedMessage(timer.p2ETentacle - 5, L["GiantEye"], "Urgent", false, nil, true)
	end
end

function module:GCTentacleRape()
	doCheckForWipe = true
	self:DelayedSync(timer.p2GiantClaw, syncName.giantClawSpawn)
	self:KTM_Reset()
	self:KTM_SetTarget("Giant Claw Tentacle")
	if self.db.profile.giant then
		self:Bar(L["barGiantC"], timer.p2GiantClaw, icon.giantClaw)
	end
end

function module:TentacleRape()
	self:DelayedSync(tentacletime, syncName.tentacleSpawn)
	if self.db.profile.tentacle then
		self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], tentacletime, icon.eyeTentacles)
		self:DelayedMessage(tentacletime - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, nil, true)
	end
end
