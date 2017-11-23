
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Kel'Thuzad", "Naxxramas")


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
	phase3_trigger = "Master! I require aid!",
	phase3_warning = "Phase 3, Guardians incoming!",

	guardians_bar = "Guardian %d",

	fissure_trigger = "cast Shadow Fissure.",
	fissure_warning = "Shadow Fissure!",

	frostbolt_trigger = "Kel'Thuzad begins to cast Frostbolt.",
	frostbolt_warning = "Frostbolt! Interrupt!",
	frostbolt_bar = "Frostbolt",


	frostbolt_volley = "Possible volley",
	frostbolt_volley_trigger = "afflicted by Frostbolt",

	add_dead_trigger = "(.*) dies",
	add_bar = "%d/14 %s",

	frostblast_bar = "Possible Frost Blast",
	frostblast_trigger1 = "I will freeze the blood in your veins!",
	frostblast_trigger2 = "^([^%s]+) ([^%s]+) afflicted by Frost Blast.",
	frostblast_warning = "Frost Blast!",
	frostblast_soon_message = "Possible Frost Blast in ~5sec!",

	phase2_frostblast_warning = "Possible Frost Blast in ~5sec!",
	phase2_mc_warning = "Possible Mind Control in ~5sec!",
	phase2_detonate_warning = "Detonate Mana in ~5sec!",

	detonate_trigger = "^([^%s]+) ([^%s]+) afflicted by Detonate Mana",
	detonate_bar = "Detonate Mana - %s",
	detonate_possible_bar = "Detonate Mana",
	detonate_warning = "%s has Detonate Mana!",

	you = "You",
	are = "are",

	proximity_cmd = "proximity",
	proximity_name = "Proximity Warning",
	proximity_desc = "Show Proximity Warning Frame",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Kelthuzad",

	KELTHUZADCHAMBERLOCALIZEDLOLHAX = "Cámara de Kel'Thuzad",

	--phase_cmd = "phase",
	phase_name = "Alerta de Fase",
	phase_desc = "Avisa para cambios de Fase.",

	--mc_cmd = "mindcontrol",
	mc_name = "Alerta de Control Mental",
	mc_desc = "Avisa cuando haya jugadores que están controlados por mente.",

	--fissure_cmd = "fissure",
	fissure_name = "Alerta de Fisura de las Sombras",
	fissure_desc = "Avisa para Fisura de las Sombras.",

	--frostblast_cmd = "frostblast",
	frostblast_name = "Alerta de Explosión de Escarcha",
	frostblast_desc = "Avisa para Explosión de Escarcha.",

	--frostbolt_cmd = "frostbolt",
	frostbolt_name = "Alerta de Descarga de Escarcha",
	frostbolt_desc = "Avisa para Descarga de Escarcha",

	frostboltbar_cmd = "frostboltbar",
	frostboltbar_name = "Barra de Descarga de Escarcha",
	frostboltbar_desc = "Muestra una barra para lanzamiento de Descarga de Escharcha",

	--detonate_cmd = "detonate",
	detonate_name = "Alerta de Detonar maná",
	detonate_desc = "Avisa para Detonar maná.",

	--detonateicon_cmd = "detonateicon",
	detonateicon_name = "Marcar para Detonar maná",
	detonateicon_desc = "Marca con un icono jugadores con Detonar maná.",

	--guardians_cmd = "guardians",
	guardians_name = "Alerta de Guardianes",
	guardians_desc = "Avisa para Guardianes de Corona de Hielo en fase 3.",

	--fbvolley_cmd = "fbvolley",
	fbvolley_name = "Lluvia de descarga de Escarcha Posible",
	fbvolley_desc = "Temporizador para Lluvia de descarga de Escarcha posible.",

	--addcount_cmd = "addcount",
	addcount_name = "Fase 1 Contador de Adds",
	addcount_desc = "Cuenta los adds matados en Fase 1",

	mc_trigger1 = "Your soul, is bound to me now!",
	mc_trigger2 = "There will be no escape!",
	mc_warning = "Mind Control!",
	mc_bar = "Possible Mind Control!",

	start_trigger = "Minions, servants, soldiers of the cold dark, obey the call of Kel'Thuzad!",
	start_trigger1 = "Minions, servants, soldiers of the cold dark! Obey the call of Kel'Thuzad!",
	start_warning = "Kel'Thuzad encounter started! ~5min till he is active!",
	start_bar = "Phase 1 Timer",
	attack_trigger1 = "Kel'Thuzad ataca",
	attack_trigger2 = "Kel'Thuzad falla",
	attack_trigger3 = "Kel'Thuzad golpea",
	attack_trigger4 = "Kel'Thuzad golpe críticio",
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

	phase1_warn = "Fase 1 termina en 20 segunfos!",

	phase2_trigger1 = "Pray for mercy!",
	phase2_trigger2 = "Scream your dying breath!",
	phase2_trigger3 = "The end is upon you!",
	phase2_warning = "¡Fase 2, Kel'Thuzad entrante!",
	phase2_bar = "¡Kel'Thuzad Activo!",

	phase3_soon_warning = "¡Fase 3 pronto!",
	phase3_trigger = "Master, I require aid!",
	phase3_warning = "¡Fase 3, Guardianes en ~15 segundos!",


	guardians_bar = "¡Guardianes entrantes!",

	fissure_trigger = "lanza Fisura de las Sombras.",
	fissure_warning = "¡Fisura de las Sombras!",

	frostbolt_trigger = "Kel'Thuzad comienza a lanzar Descarga de Escarcha.",
	frostbolt_warning = "¡Descarga de Escarcha! Interrúmpela!",
	frostbolt_bar = "Descarga de Escarcha",


	frostbolt_volley = "Lluvia Posible",
	frostbolt_volley_trigger = "sufre de Descarga de Escarcha",

	add_dead_trigger = "(.*) muere",
	add_bar = "%d/14 %s",

	frostblast_bar = "Explosión de Escarcha Posible",
	frostblast_trigger1 = "I will freeze the blood in your veins!",
	frostblast_warning = "¡Explosión de Escarcha!",
	frostblast_soon_message = "¡Explosión de Escarcha Posible en ~5 segundos!",

	phase2_frostblast_warning = "¡Explosión de Escarcha Posible en ~5 segundos!",
	phase2_mc_warning = "¡Control Mental Posible en ~5 segundos!",
	phase2_detonate_warning = "¡Detonar maná en ~5 segundos!",

	detonate_trigger = "^([^%s]+) ([^%s]+) sufre de Detonar maná",
	detonate_bar = "Detonar maná - %s",
	detonate_possible_bar = "Detonar maná",
	detonate_warning = "¡%s tiene Detonar maná!",

	you = "Tu",
	are = "estás",

	--proximity_cmd = "proximity",
	proximity_name = "Alerta de Proximidad",
	proximity_desc = "Muestra marco de alerta de proximidad",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"frostbolt", "frostboltbar", -1, "frostblast", "proximity", "fissure", "mc", -1, "fbvolley", -1, "detonate", "detonateicon", -1 ,"guardians", -1, "addcount", "phase", "bosskill"}

-- Proximity Plugin
module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
module.proximitySilent = true


-- locals
local timer = {
	phase1 = 320,
	firstFrostboltVolley = 30,
	frostboltVolley = {15,30},
	frostbolt = 2,
	phase2 = 15,
	firstDetonate = 20,
	detonate = 5,
	nextDetonate = {20,25},
	firstFrostblast = 50,
	frostblast = {30,60},
	firstMindcontrol = 60,
	mindcontrol = {60,90},
	firstGuardians = 5,
	guardians = 7,
}
local icon = {
	abomination = "",
	soulWeaver = "",
	frostboltVolley = "Spell_Frost_FrostWard",
	mindcontrol = "Inv_Belt_18",
	phase1 = "",
	phase2 = "",
	guardians = "",
	frostblast = "Spell_Frost_FreezingBreath",
	detonate = "Spell_Nature_WispSplode",
	frostbolt = "Spell_Frost_FrostBolt02",
}
local syncName = {
	detonate = "KelDetonate"..module.revision,
	frostblast = "KelFrostBlast"..module.revision,
	frostbolt = "KelFrostbolt"..module.revision,
	frostboltOver = "KelFrostboltStop"..module.revision,
	fissure = "KelFissure"..module.revision,
	mindcontrol = "KelMindControl"..module.revision,
	abomination = "KelAddDiesAbom"..module.revision,
	soulWeaver = "KelAddDiesSoul"..module.revision,
	phase2 = "KelPhase2"..module.revision,
	phase3 = "KelPhase3"..module.revision,
}

local timeLastFrostboltVolley = 0    -- saves time of first frostbolt
local numFrostboltVolleyHits = 0	-- counts the number of people hit by frostbolt
local numAbominations = 0	-- counter for Unstoppable Abomination's
local numWeavers = 0 	-- counter for Soul Weaver's
local timePhase1Start = 0    -- time of p1 start, used for tracking add count


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["start_trigger"])
module:RegisterYellEngage(L["start_trigger1"])

-- Big evul hack to enable the module when entering Kel'Thuzads chamber.
function module:OnRegister()
	self:RegisterEvent("MINIMAP_ZONE_CHANGED")
end

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")

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

	self:ThrottleSync(5, syncName.detonate)
	self:ThrottleSync(0, syncName.frostblast)
	self:ThrottleSync(2, syncName.frostbolt)
	self:ThrottleSync(2, syncName.frostboltOver)
	self:ThrottleSync(2, syncName.fissure)
	self:ThrottleSync(2, syncName.abomination)
	self:ThrottleSync(2, syncName.soulWeaver)
	self:ThrottleSync(5, syncName.phase2)
	self:ThrottleSync(5, syncName.phase3)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")

	self.warnedAboutPhase3Soon = nil
	frostbolttime = 0
	self.lastFrostBlast=0
end

-- called after boss is engaged
function module:OnEngage()
	self.lastFrostBlast=0
	self:Message(L["start_warning"], "Attention")
	self:Bar(L["start_bar"], timer.phase1, icon.phase1)
	self:DelayedMessage(timer.phase1 - 20, L["phase1_warn"], "Important")

	if self.db.profile.addcount then
		timePhase1Start = GetTime() 	-- start of p1, used for tracking add counts
		numAbominations = 0
		numWeavers = 0
		self:Bar(string.format(L["add_bar"], numAbominations, "Unstoppable Abomination"), timer.phase1, icon.abomination)
		self:Bar(string.format(L["add_bar"], numWeavers, "Soul Weaver"), timer.phase1, icon.soulWeaver)
	end
	self:KTM_SetTarget("Unstoppable Abomination")
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
	self:RemoveProximity()
	BigWigsFrostBlast:FBClose()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:MINIMAP_ZONE_CHANGED(msg)
	if GetMinimapZoneText() ~= L["KELTHUZADCHAMBERLOCALIZEDLOLHAX"] or self.core:IsModuleActive(module.translatedName) then
		return
	end

	-- Activate the Kel'Thuzad mod!
	self.core:EnableModule(module.translatedName)
end

-- check for phase 3
function module:UNIT_HEALTH(msg)
	if self.db.profile.phase then
		if UnitName(msg) == self.translatedName then
			local health = UnitHealth(msg)
			if health > 35 and health <= 40 and not self.warnedAboutPhase3Soon then
				self:Message(L["phase3_soon_warning"], "Attention")
				self.warnedAboutPhase3Soon = true
			elseif health > 40 and self.warnedAboutPhase3Soon then
				self.warnedAboutPhase3Soon = nil
			end
		end
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if ((msg == L["phase2_trigger1"]) or (msg == L["phase2_trigger2"]) or (msg == L["phase2_trigger3"])) then
		self:Sync(syncName.phase2)
	elseif string.find(msg, L["phase3_trigger"]) then
		self:Sync(syncName.phase3)
	elseif msg == L["mc_trigger1"] or msg == L["mc_trigger2"] then
		self:Sync(syncName.mindcontrol)
		--elseif msg == L["frostblast_trigger1"] then
		--	self:Sync(syncName.frostblast)
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE( msg )
	if string.find(msg, L["frostbolt_trigger"]) then
		self:Sync(syncName.frostbolt)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	local _,_, mob = string.find(msg, L["add_dead_trigger"])
	if self.db.profile.addcount and (mob == "Unstoppable Abomination") then
		self:Sync(syncName.abomination .. " " .. mob)
	elseif self.db.profile.addcount and (mob == "Soul Weaver") then
		self:Sync(syncName.soulWeaver .. " " .. mob)
	elseif self.db.profile.bosskill and (mob == "Kel'Thuzad") then
		self:SendBossDeathSync()
	end
end

--[[function module:Volley()
self:Bar(L["frostbolt_volley"], 15, icon.frostboltVolley)
end]]
function module:Affliction(msg)
	local _, _, sPlayer, sType = string.find(msg, L["frostblast_trigger2"])
	if ( sPlayer and sType ) then
		if ( sPlayer == "You" and sType == "are" ) then
			self:Sync(syncName.frostblast.." "..UnitName("player"))
		else
			self:Sync(syncName.frostblast.." "..sPlayer)
		end
	end

	if string.find(msg, L["detonate_trigger"]) then
		local _,_, dplayer, dtype = string.find( msg, L["detonate_trigger"])
		if dplayer and dtype then
			if dplayer == L["you"] and dtype == L["are"] then
				dplayer = UnitName("player")
			end
			self:Sync(syncName.detonate .. " ".. dplayer)
		end
	end

	if self.db.profile.fbvolley and string.find(msg, L["frostbolt_volley_trigger"]) then
		local now = GetTime()

		-- only warn if there are more than 4 players hit by frostbolt volley within 4s
		if now - timeLastFrostboltVolley > 4 then
			timeLastFrostboltVolley = now
			numFrostboltVolleyHits = 1
		else
			numFrostboltVolleyHits = numFrostboltVolleyHits + 1
		end

		if numFrostboltVolleyHits == 4 then

			self:IntervalBar(L["frostbolt_volley"], timer.frostboltVolley[1], timer.frostboltVolley[2], icon.frostboltVolley)

			--[[self:CancelScheduledEvent("bwfbvolley30")
			self:CancelScheduledEvent("bwfbvolley45")
			self:CancelScheduledEvent("bwfbvolley60")
			self:ScheduleEvent("bwfbvolley30", self.Volley, 15, self)
			self:ScheduleEvent("bwfbvolley45", self.Volley, 30, self)
			self:ScheduleEvent("bwfbvolley60", self.Volley, 45, self) ]] -- why 3 times?

			self:CancelDelayedBar(L["frostbolt_volley"])
			self:DelayedIntervalBar(timer.frostboltVolley[2], L["frostbolt_volley"], timer.frostboltVolley[1], timer.frostboltVolley[2], icon.frostboltVolley)
		end
	end
end

function module:Event(msg)
	-- shadow fissure
	if string.find(msg, L["fissure_trigger"]) then
		self:Sync(syncName.fissure)
	end

	-- frost bolt
	if GetTime() < frostbolttime + timer.frostbolt then
		if string.find(msg, L["attack_trigger1"]) or string.find(msg, L["attack_trigger2"]) or string.find(msg, L["attack_trigger3"]) or string.find(msg, L["attack_trigger4"]) then
			self:RemoveBar(L["frostbolt_bar"])
			frostbolttime = 0
			self:Sync(syncName.frostboltOver)
		elseif string.find(msg, L["kick_trigger1"]) or string.find(msg, L["kick_trigger2"]) or string.find(msg, L["kick_trigger3"]) -- kicked
			or string.find(msg, L["pummel_trigger1"]) or string.find(msg, L["pummel_trigger2"]) or string.find(msg, L["pummel_trigger3"]) -- pummeled
			or string.find(msg, L["shieldbash_trigger1"]) or string.find(msg, L["shieldbash_trigger2"]) or string.find(msg, L["shieldbash_trigger3"]) -- shield bashed
			or string.find(msg, L["earthshock_trigger1"]) or string.find(msg, L["earthshock_trigger2"]) then -- earth shocked

			self:RemoveBar(L["frostbolt_bar"])
			frostbolttime = 0
			self:Sync(syncName.frostboltOver)
		end
	else
		frostbolttime = 0
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.phase2 then
		self:Phase2()
	elseif sync == syncName.phase3 then
		self:Phase3()
	elseif sync == syncName.mindcontrol then
		self:MindControl()
	elseif sync == syncName.frostblast then
		self:FrostBlast(rest)
	elseif sync == syncName.detonate and rest then
		self:Detonate()
	elseif sync == syncName.frostbolt then       -- changed from only frostbolt (thats only alert, if someone still wants to see the bar, it wouldnt work then)
		self:Frostbolt()
	elseif sync == syncName.frostboltOver then
		self:FrostboltOver()
	elseif sync == syncName.fissure then
		self:Fissure()
	elseif sync == syncName.abomination and rest then
		self:AbominationDies(rest)
	elseif sync == syncName.soulWeaver and rest then
		self:WeaverDies(rest)
	end
end


------------------------------
--      Sync Handlers	    --
------------------------------

function module:Phase2()
	self:Bar(L["phase2_bar"], timer.phase2, icon.phase2)
	self:DelayedMessage(timer.phase2, L["phase2_warning"], "Important")
	if self.db.profile.mc then
		self:DelayedBar(timer.phase2, L["mc_bar"], timer.firstMindcontrol, icon.mindcontrol)
		self:DelayedMessage(timer.firstMindcontrol  + timer.phase2 - 5, L["phase2_mc_warning"], "Important")
	end
	if self.db.profile.detonate then
		self:DelayedBar(timer.phase2, L["detonate_possible_bar"], timer.firstDetonate, icon.detonate)
		self:DelayedMessage(timer.firstDetonate + timer.phase2 - 5, L["phase2_detonate_warning"], "Important")
	end
	if self.db.profile.frostblast then
		self:DelayedBar(timer.phase2, L["frostblast_bar"], timer.firstFrostblast, icon.frostblast)
		self:DelayedMessage(timer.firstFrostblast  + timer.phase2 - 5, L["phase2_frostblast_warning"], "Important")
	end

	if self.db.profile.fbvolley then
		self:DelayedBar(timer.phase2, L["frostbolt_volley"], timer.firstFrostboltVolley, icon.frostboltVolley)
	end

	-- master target should be automatically set, as soon as a raid assistant targets kel'thuzad
	self:KTM_SetTarget(self:ToString())
	self:KTM_Reset()

	-- proximity silent
	if self.db.profile.proximity then
		self:ScheduleEvent("bwShowProximity", self.Proximity, timer.phase2, self)
	end
	self:ScheduleEvent("bwShowFBFrame", function() BigWigsFrostBlast:FBShow() end, timer.phase2, self)

	local function removeP1Bars()
		self:RemoveBar(L["start_bar"])
		self:RemoveBar(string.format(L["add_bar"], numWeavers, "Soul Weaver"))
		self:RemoveBar(string.format(L["add_bar"], numAbominations, "Unstoppable Abomination"))
	end
	self:ScheduleEvent("bwKTremoveP1Bars", removeP1Bars, 1, self)

end

function module:Phase3()
	if self.db.profile.phase then
		self:Message(L["phase3_warning"], "Attention", nil, "Beware")
	end
	if self.db.profile.guardians then
		self:Bar(string.format(L["guardians_bar"],1), timer.firstGuardians, icon.guardians)
		for i = 0,3 do
			self:DelayedBar(timer.firstGuardians+timer.guardians*i, string.format(L["guardians_bar"],i+2), timer.guardians, icon.guardians)
		end
	end
end

function module:MindControl()
	if self.db.profile.mc then
		self:Message(L["mc_warning"], "Urgent")
		self:IntervalBar(L["mc_bar"], timer.mindcontrol[1], timer.mindcontrol[2], icon.mindcontrol)
	end
	self:KTM_Reset()
end

function module:FrostBlast(name)
	if self.db.profile.frostblast then
		if GetTime()-self.lastFrostBlast>5 then
			self.lastFrostBlast=GetTime()
			self:Message(L["frostblast_warning"], "Attention")
			self:DelayedMessage(timer.frostblast[1] - 5, L["frostblast_soon_message"])
			self:IntervalBar(L["frostblast_bar"], timer.frostblast[1], timer.frostblast[2], icon.frostblast)
		end
	end
	if name and name ~= "" then
		BigWigsFrostBlast:AddFrostBlastTarget(name)
	end
end

function module:Detonate(name)
	if name and self.db.profile.detonate then
		self:Message(string.format(L["detonate_warning"], name), "Attention")
		if self.db.profile.detonateicon then
			self:Icon(name)
		end
		self:Bar(string.format(L["detonate_bar"], name), timer.detonate, icon.detonate)
		self:IntervalBar(L["detonate_possible_bar"], timer.nextDetonate[1], timer.nextDetonate[2], icon.detonate)
	end
end

function module:Frostbolt()
	if self.db.profile.frostbolt or self.db.profile.frostboltbar then
		frostbolttime = GetTime()
		if self.db.profile.frostbolt then
			self:Message(L["frostbolt_warning"], "Personal")
		end
		if self.db.profile.frostboltbar then
			self:Bar(L["frostbolt_bar"], timer.frostbolt, icon.frostbolt, true, "blue")
		end
	end
end

function module:FrostboltOver()
	if self.db.profile.frostbolt then
		self:RemoveBar(L["frostbolt_bar"])
		frostbolttime = 0
	end
end

function module:Fissure()
	if self.db.profile.fissure then
		self:Message(L["fissure_warning"], "Urgent", true, "Alarm")
		-- add bar?
	end
end

function module:AbominationDies(name)
	if name and self.db.profile.addcount then
		self:RemoveBar(string.format(L["add_bar"], numAbominations, name))
		numAbominations = numAbominations + 1
		if numAbominations < 14 then
			self:Bar(string.format(L["add_bar"], numAbominations, name), (timePhase1Start + timer.phase1 - GetTime()), icon.abomination)
		end
	end
	self:KTM_Reset()
end

function module:WeaverDies(name)
	if name and self.db.profile.addcount then
		self:RemoveBar(string.format(L["add_bar"], numWeavers, name))
		numWeavers = numWeavers + 1
		if numWeavers < 14 then
			self:Bar(string.format(L["add_bar"], numWeavers, name), (timePhase1Start + timer.phase1 - GetTime()), icon.soulWeaver)
		end
	end
end
