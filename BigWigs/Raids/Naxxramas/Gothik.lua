
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Gothik the Harvester", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Gothik",

	room_cmd = "room",
	room_name = "Room Arrival Warnings",
	room_desc = "Warn for Gothik's arrival",

	add_cmd = "add",
	add_name = "Add Warnings",
	add_desc = "Warn for adds",

	adddeath_cmd = "adddeath",
	adddeath_name = "Add Death Alert",
	adddeath_desc = "Alerts when an add dies.",

	disabletrigger = "I... am... undone.",

	starttrigger1 = "Brazenly you have disregarded powers beyond your understanding.",
	starttrigger2 = "Teamanare shi rikk mannor rikk lok karkun",
	startwarn = "Gothik the Harvester engaged! 4:35 till he's in the room.",

	rider_name = "Unrelenting Rider",
	spectral_rider_name = "Spectral Rider",
	deathknight_name = "Unrelenting Deathknight",
	spectral_deathknight_name = "Spectral Deathknight",
	trainee_name = "Unrelenting Trainee",
	spectral_trainee_name = "Spectral Trainee",

	riderdiewarn = "Rider dead!",
	dkdiewarn = "Death Knight dead!",

	warn_inroom_3m = "In room in 3 minutes",
	warn_inroom_90 = "In room in 90 seconds",
	warn_inroom_60 = "In room in 60 seconds",
	warn_inroom_30 = "In room in 30 seconds",
	warn_inroom_10 = "Gothik Incoming in 10 seconds",

	wave = "%d/22: ", -- its only 22 waves not 26

	trawarn = "Trainees in 3 seconds",
	dkwarn = "Deathknight in 3 seconds",
	riderwarn = "Rider in 3 seconds",

	trabar = "Trainee - %d",
	dkbar = "Deathknight - %d",
	riderbar = "Rider - %d",

	inroomtrigger = "I have waited long enough! Now, you face the harvester of souls.",
	inroomwarn = "He's in the room!",

	inroombartext = "In Room",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Gothik",

	--room_cmd = "room",
	room_name = "Alerta de Arribo",
	room_desc = "Avisa para el arribo de Gothik",

	--add_cmd = "add",
	add_name = "Alerta de Adds",
	add_desc = "Avisa para Adds",

	--adddeath_cmd = "adddeath",
	adddeath_name = "Alerta del Muerte de los Adds",
	adddeath_desc = "Avisa cuando un add muera.",

	disabletrigger = "Es... mi... fin.",

	starttrigger1 = "Habéis hecho caso omiso de poderes más allá de vuestro entendimiento descaradamente.",
	starttrigger2 = "Teamanare shi rikk mannor rikk lok karkun",
	startwarn = "¡Entrando en combate con Gothik el Cosechador! 4:35 hasta que arribe al cuarto.",

	rider_name = "Jinete inflexible",
	spectral_rider_name = "Jinete espectral",
	deathknight_name = "Caballero de la Muerte inflexible",
	spectral_deathknight_name = "Caballero de la Muerte espectral",
	trainee_name = "Practicante inflexible",
	spectral_trainee_name = "Practicante espectral",

	riderdiewarn = "¡Jinete muerto!",
	dkdiewarn = "¡Caballero de la Muerte muerto!",

	warn_inroom_3m = "Entra en 3 minutos",
	warn_inroom_90 = "Entra en 90 segundos",
	warn_inroom_60 = "Entra en 60 segundos",
	warn_inroom_30 = "Entra en 30 segundos",
	warn_inroom_10 = "Gothik entra en 10 segundos",

	wave = "%d/22: ", -- its only 22 waves not 26

	trawarn = "Practicantes en 3 segundos",
	dkwarn = "Caballero de la Muerte en 3 segundos",
	riderwarn = "Jinete en 3 segundos",

	trabar = "Practicante - %d",
	dkbar = "Caballero de la Muerte - %d",
	riderbar = "Jinete - %d",

	inroomtrigger = "Ya he esperado suficiente. Ahora os enfrentaréis al Recolector de almas.",
	inroomwarn = "¡Está en la habitación!",

	inroombartext = "En Habitación",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20003 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.wipemobs = { L["rider_name"], L["deathknight_name"], L["trainee_name"],
	L["spectral_rider_name"], L["spectral_deathknight_name"], L["spectral_trainee_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"room", -1, "add", "adddeath", "bosskill"}


-- locals
local timer = {
	inroom = 274,
	firstTrainee = 24,
	trainee = 20,
	firstDeathknight = 74,
	deathknight = 25,
	firstRider = 134,
	rider = 30,
}
local icon = {
	inroom = "Spell_Magic_LesserInvisibilty",
	trainee = "Ability_Seal",
	deathknight = "INV_Boots_Plate_08",
	rider = "Spell_Shadow_DeathPact",
}
local syncName = {
	--teleport = "TwinsTeleport"..module.revision,
	--berserk = "TestbossBerserk"..module.revision
	}

local wave = 0
local numTrainees = 0
local numDeathknights = 0
local numRiders = 0

------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger1"])
module:RegisterYellEngage(L["starttrigger2"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")

	self.started = nil
	wave = 0
	numTrainees = 0
	numDeathknights = 0
	numRiders = 0
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.room then
		self:Message(L["startwarn"], "Important")
		self:Bar(L["inroombartext"], timer.inroom, icon.inroom)
		self:DelayedMessage(timer.inroom - 3 * 60, L["warn_inroom_3m"], "Attention")
		self:DelayedMessage(timer.inroom - 90, L["warn_inroom_90"], "Attention")
		self:DelayedMessage(timer.inroom - 60, L["warn_inroom_60"], "Urgent")
		self:DelayedMessage(timer.inroom - 30, L["warn_inroom_30"], "Important")
		self:DelayedMessage(timer.inroom - 10, L["warn_inroom_10"], "Important")
	end

	if self.db.profile.add then
		self:Trainee()
		self:DeathKnight()
		self:Rider()
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:CHAT_MSG_MONSTER_YELL( msg )
	if msg == L["inroomtrigger"] then
		if self.db.profile.room then
			self:Message(L["inroomwarn"], "Important")
		end
		self:StopRoom()
	elseif string.find(msg, L["disabletrigger"]) then
		self:SendBossDeathSync()
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH( msg )
	BigWigs:CheckForBossDeath(msg, self)

	if self.db.profile.adddeath and msg == string.format(UNITDIESOTHER, L["rider_name"]) then
		self:Message(L["riderdiewarn"], "Important")
	elseif self.db.profile.adddeath and msg == string.format(UNITDIESOTHER, L["deathknight_name"]) then
		self:Message(L["dkdiewarn"], "Important")
	end
end

function module:StopRoom()
	self:RemoveBar(L["inroombartext"])
	self:CancelDelayedMessage(L["warn_inroom_3m"])
	self:CancelDelayedMessage(L["warn_inroom_90"])
	self:CancelDelayedMessage(L["warn_inroom_60"])
	self:CancelDelayedMessage(L["warn_inroom_30"])
	self:CancelDelayedMessage(L["warn_inroom_10"])

	--if numTrainees and numDeathknights and numRiders then
	--	self:RemoveBar(string.format(L["trabar"], numTrainees - 1)) -- disabled for custom cancel
	--	self:RemoveBar(string.format(L["dkbar"], numDeathknights - 1)) -- too
	--	self:RemoveBar(string.format(L["riderbar"], numRiders - 1)) -- too
	--end
	--self:CancelScheduledEvent("bwgothiktrawarn")
	--self:CancelScheduledEvent("bwgothikdkwarn")
	--self:CancelScheduledEvent("bwgothikriderwarn")
	--self:CancelScheduledEvent("bwgothiktrarepop")
	--self:CancelScheduledEvent("bwgothikdkrepop")
	--self:CancelScheduledEvent("bwgothikriderrepop")

	wave = 0
	numTrainees = 0
	numDeathknights = 0
	numRiders = 0
end


------------------------------
--      Utility	Functions   --
------------------------------

function module:WaveWarn(message, L, color)
	wave = wave + 1
	if self.db.profile.add then
		self:Message(string.format(L["wave"], wave) .. message, color)
	end
end

function module:Trainee()
	numTrainees = numTrainees + 1
	local traineeTime = timer.trainee
	if numTrainees == 1 then
		traineeTime = timer.firstTrainee
	end

	if self.db.profile.add then
		self:Bar(string.format(L["trabar"], numTrainees), traineeTime, icon.trainee)
	end
	self:ScheduleEvent("bwgothiktrawarn", self.WaveWarn, traineeTime - 3, self, L["trawarn"], L, "Attention")
	self:ScheduleRepeatingEvent("bwgothiktrarepop", self.Trainee, traineeTime, self)


	if numTrainees >= 12 then  -- cancels bar after wave 11
		self:RemoveBar(string.format(L["trabar"], numTrainees - 1))
		self:CancelScheduledEvent("bwgothiktrawarn")
		self:CancelScheduledEvent("bwgothiktrarepop")
		numTrainees = 0
	end

end

function module:DeathKnight()
	numDeathknights = numDeathknights + 1
	local deathknightTime = timer.deathknight
	if numDeathknights == 1 then
		deathknightTime = timer.firstDeathknight
	end

	if self.db.profile.add then
		self:Bar(string.format(L["dkbar"], numDeathknights), deathknightTime, icon.deathknight)
	end
	self:ScheduleEvent("bwgothikdkwarn", self.WaveWarn, deathknightTime - 3, self, L["dkwarn"], L, "Urgent")
	self:ScheduleRepeatingEvent("bwgothikdkrepop", self.DeathKnight, deathknightTime, self)


	if numDeathknights >= 8 then  -- cancels bar after wave 7
		self:RemoveBar(string.format(L["dkbar"], numDeathknights - 1))
		self:CancelScheduledEvent("bwgothikdkwarn")
		self:CancelScheduledEvent("bwgothikdkrepop")
		numDeathknights = 0
	end
end

function module:Rider()
	numRiders = numRiders + 1
	local riderTime = timer.rider
	if numRiders == 1 then
		riderTime = timer.firstRider
	end

	if self.db.profile.add then
		self:Bar(string.format(L["riderbar"], numRiders), riderTime, icon.rider)
	end
	self:ScheduleEvent("bwgothikriderwarn", self.WaveWarn, riderTime - 3, self, L["riderwarn"], L, "Important")
	self:ScheduleRepeatingEvent("bwgothikriderrepop", self.Rider, riderTime, self)

	if numRiders >= 5 then  -- cancels bar after wave 4
		self:RemoveBar(string.format(L["riderbar"], numRiders - 1))
		self:CancelScheduledEvent("bwgothikriderwarn")
		self:CancelScheduledEvent("bwgothikriderrepop")
		numRiders = 0
	end
end
