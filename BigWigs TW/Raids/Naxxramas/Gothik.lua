
local __find = string.find
local __substr = string.sub
local __tinsert = table.insert
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

	inroomtrigger = "I have waited long enough",
	inroomwarn = "He's in the room!",

	inroombartext = "In Room",
	teleporttext = "Teleport",
} end )

L:RegisterTranslations("ruRU", function() return { -- by CFM=KasVital --Готик Жнец
	room_name = "Прибытие в комнату",
	room_desc = "Предупреждает когда Готик прибывает в комнату.",

	add_name = "Оповещение о существах",
	add_desc = "Предупреждает о существах.",

	adddeath_name = "Оповещение о смертях существ",
	adddeath_desc = "Предупреждает когда существо погибает.",

	disabletrigger = "I... am... undone!", --fix by CFM Меня... больше... нет! -- не переведено на Light's hope

	starttrigger1 = "Brazenly you have disregarded powers beyond your understanding.", --Вам никогда не понять, сколь велика сила, потревоженная вами.
	starttrigger2 = "Teamanare shi rikk mannor rikk lok karkun", --WTF???
	startwarn = "Готик Жнец в бою! 4:35 до прибытия в комнату.",

	rider_name = "Неодолимый всадник",
	spectral_rider_name = "Призрачный всадник",
	deathknight_name = "Безжалостный рыцарь смерти",
	spectral_deathknight_name = "Призрачный рыцарь смерти",
	trainee_name = "Жестокий новобранец",
	spectral_trainee_name = "Призрачный ученик",

	riderdiewarn = "Всадник погибает!",
	dkdiewarn = "Рыцарь смерти погибает!",

	warn_inroom_3m = "В комнате через 3 минут",
	warn_inroom_90 = "В комнате через 90 секунд",
	warn_inroom_60 = "В комнате через 60 секунд",
	warn_inroom_30 = "В комнате через 30 секунд",
	warn_inroom_10 = "Скоро Готик, осталось 10 секунд",

	wave = "%d/22: ", -- its only 22 waves not 24

	trawarn = "Новобранец через 3 секунды",
	dkwarn = "Рыцарь смерти через 3 секунды",
	riderwarn = "Всадник через 3 секунды",

	trabar = "Новобранец - %d",
	dkbar = "Рыцарь смерти - %d",
	riderbar = "Всадник - %d",

	inroomtrigger = "I have waited long enough! Now, you face the harvester of souls!", --Я ждал слишком долго. Сейчас вы предстанете пред ликом Жнеца душ! -- не переведено на Light's hope
	inroomwarn = "Босс в комнате!",

	inroombartext = "В комнате",
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
	sideteleport = 15,
}
local icon = {
	inroom = "Spell_Magic_LesserInvisibilty",
	trainee = "Ability_Seal",
	deathknight = "INV_Boots_Plate_08",
	rider = "Spell_Shadow_DeathPact",
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
	if string.find(msg, L["inroomtrigger"]) then
		if self.db.profile.room then
			self:Message(L["inroomwarn"], "Important")
		end
		self:StopRoom()
		self:Bar(L["teleporttext"], timer.sideteleport, icon.inroom)
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

	if self.db.profile.add and numTrainees < 12 then
		self:Bar(string.format(L["trabar"], numTrainees), traineeTime, icon.trainee)
	self:ScheduleEvent("bwgothiktrawarn", self.WaveWarn, traineeTime - 3, self, L["trawarn"], L, "Attention")
	self:ScheduleRepeatingEvent("bwgothiktrarepop", self.Trainee, traineeTime, self)
	else
		self:CancelScheduledEvent("bwgothiktrawarn")
		self:CancelScheduledEvent("bwgothiktrarepop")
		numTrainees = 0
	end

end

local shackles = {}
for i = 1, 8 do
	shackles[i] = ''
end
SLASH_GOT1 = "/got"
SlashCmdList["GOT"] = function(cmd)
	if cmd then
		if string.sub(cmd, 1, 3) == 'set' then
			local ex = __explode(cmd, ' ')

			if ex[1] and ex[2] and ex[3] then
				if tonumber(ex[2]) then
					shackles[tonumber(ex[2])] = ex[3]
					DEFAULT_CHAT_FRAME:AddMessage('Gothik set shackle ' .. ex[2] .. ' to ' .. ex[3])
				else
					DEFAULT_CHAT_FRAME:AddMessage('Syntax: /got set # Name')
				end
			else
				DEFAULT_CHAT_FRAME:AddMessage('Syntax: /got set # Name')
			end
		end
		if string.sub(cmd, 1, 4) == 'list' then
			for i = 1, 8 do
				DEFAULT_CHAT_FRAME:AddMessage('Shackle ' .. i .. ' = ' .. shackles[i])
			end
		end
	end
end
function module:DeathKnight()
	numDeathknights = numDeathknights + 1
	local deathknightTime = timer.deathknight
	if numDeathknights == 1 then
		deathknightTime = timer.firstDeathknight
	end

	if self.db.profile.add and numDeathknights < 8 then
		self:Bar(string.format(L["dkbar"], numDeathknights) .. " " .. shackles[numDeathknights], deathknightTime, icon.deathknight)
	self:ScheduleEvent("bwgothikdkwarn", self.WaveWarn, deathknightTime - 3, self, L["dkwarn"], L, "Urgent")
	self:ScheduleRepeatingEvent("bwgothikdkrepop", self.DeathKnight, deathknightTime, self)
	else
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

	if self.db.profile.add and numRiders < 5 then
		self:Bar(string.format(L["riderbar"], numRiders), riderTime, icon.rider)
	self:ScheduleEvent("bwgothikriderwarn", self.WaveWarn, riderTime - 3, self, L["riderwarn"], L, "Important")
	self:ScheduleRepeatingEvent("bwgothikriderrepop", self.Rider, riderTime, self)
	else
		self:CancelScheduledEvent("bwgothikriderwarn")
		self:CancelScheduledEvent("bwgothikriderrepop")
		numRiders = 0
	end
end


function __explode(str, delimiter)
	local result = {}
	local from = 1
	local delim_from, delim_to = __find(str, delimiter, from, 1, true)
	while delim_from do
		__tinsert(result, __substr(str, from, delim_from - 1))
		from = delim_to + 1
		delim_from, delim_to = __find(str, delimiter, from, true)
	end
	__tinsert(result, __substr(str, from))
	return result
end