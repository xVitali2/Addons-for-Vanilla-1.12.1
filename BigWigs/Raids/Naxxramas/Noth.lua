
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Noth the Plaguebringer", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Noth",

	blink_cmd = "blink",
	blink_name = "Blink Alert",
	blink_desc = "Warn for blink",

	teleport_cmd = "teleport",
	teleport_name = "Teleport Alert",
	teleport_desc = "Warn for teleport",

	curse_cmd = "curse",
	curse_name = "Curse Alert",
	curse_desc = "Warn for curse",

	wave_cmd = "wave",
	wave_name = "Wave Alert",
	wave_desc = "Warn for waves",

	starttrigger1 = "Die, trespasser!",
	starttrigger2 = "Glory to the master!",
	starttrigger3 = "Your life is forfeit!",
	startwarn = "Noth the Plaguebringer engaged! 90 seconds till teleport",

	addtrigger = "Rise, my soldiers! Rise and fight once more!",

	blinktrigger = "Noth the Plaguebringer gains Blink.",
	blinkwarn = "Blink!",
	blinkwarn5 = "Blink in ~5 seconds!",
	blinkwarn10 = "Blink in ~10 seconds!",
	blinkbar = "Possible Blink",

	teleportToBalconyTrigger = "Noth the Plaguebringer teleports to the balcony above!",
	teleportToRoomTrigger = "Noth the Plaguebringer teleports back into the battle!",
	teleportwarn = "Teleport! He's on the balcony!",
	teleportwarn10 = "Teleport in 10 seconds!",
	teleportwarn30 = "Teleport in 30 seconds!",

	teleportbar = "Teleport!",
	backbar = "Back in room!",

	backwarn = "He's back in the room for %d seconds!",
	backwarn10 = "10 seconds until he's back in the room!",
	backwarn30 = "30 seconds until he's back in the room!",

	cursetrigger = "afflicted by Curse of the Plaguebringer",
	cursewarn = "Curse! next in ~28 seconds",
	curse10secwarn = "Curse in ~10 seconds",

	cursebar = "Next Curse",

	wave1bar = "Wave 1",
	wave2bar = "Wave 2",
	wave2_message = "Wave 2 in 10sec",
	wave2s_message = "Wave 2 Spawning!",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Noth",

	--blink_cmd = "blink",
	blink_name = "Alerta de Traslación",
	blink_desc = "Avisa para Traslación",

	--teleport_cmd = "teleport",
	teleport_name = "Alerta de Teletransporte",
	teleport_desc = "Avisa para teletransporte",

	--curse_cmd = "curse",
	curse_name = "Alerta de Maldición",
	curse_desc = "Avisa para Maldición",

	--wave_cmd = "wave",
	wave_name = "Alerta de Oleadas",
	wave_desc = "Avisa para Oleadas",

	starttrigger1 = "¡Muere, intruso!",
	starttrigger2 = "¡Gloria al maestro!",
	starttrigger3 = "Your life is forfeit!",
	startwarn = "Entrando en combate con Noth el Pesteador! 90 segundos hasta teletransporte",

	addtrigger = "Rise, my soldiers! Rise and fight once more!",

	blinktrigger = "Noth el Pesteador gana Traslación.",
	blinkwarn = "¡Translación!",
	blinkwarn5 = "¡Traslación en ~5 segundos!",
	blinkwarn10 = "¡Traslación en ~10 segundos!",
	blinkbar = "Traslación Posible",

	teleportToBalconyTrigger = "Noth the Plaguebringer teleports to the balcony above!",
	teleportToRoomTrigger = "Noth the Plaguebringer teleports back into the battle!",
	teleportwarn = "¡Teletransporte! Está en el balcón!",
	teleportwarn10 = "¡Teletransporte en 10 segundos!",
	teleportwarn30 = "¡Teletransporte en 30 segundos!",

	teleportbar = "¡Teletransporte!",
	backbar = "¡Trasera del cuarto!",

	backwarn = "¡Está en el cuarto por %d segundos!",
	backwarn10 = "¡10 segundos hasta que regrese al cuarto!",
	backwarn30 = "¡30 segundos hasta que regrese al cuarto!",

	cursetrigger = "sufre de Maldición del Pesteador",
	cursewarn = "¡Maldición! La próxima en ~28 segundos",
	curse10secwarn = "Maldición en ~10 segundos",

	cursebar = "Próxima Maldición",

	wave1bar = "Oleada 1",
	wave2bar = "Oleada 2",
	wave2_message = "Oleada 2 en 10 segundos",
	wave2s_message = "¡Aparece Oleada 2!",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20011 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"blink", "teleport", "curse", "wave", "bosskill"}


-- locals
local timer = {
	firstBlink = {30,40},
	regularBlink = {30,40},

	blinkAfterTeleport = {2,10},

	firstRoom = 90,
	secondRoom = 110,
	thirdRoom = 180,
	room = 0, -- will be changed during the encounter

	firstBalcony = 70,
	secondBalcony = 95,
	thirdBalcony = 120, -- ??
	balcony = 0, -- will be changed during the encounter

	firstCurse = {8,12},
	curseAfterTeleport = {2,10},
	curse = {50,60},

	wave1 = {5,7},
	wave2_1 = {30,37},
	wave2_2 = {49,56},
	wave2_3 = {62,69},
	wave2 = 0,
}
local icon = {
	balcony = "Spell_Magic_LesserInvisibilty",
	blink = "Spell_Arcane_Blink",
	wave = "Spell_ChargePositive",
	curse = "Spell_Shadow_AnimateDead",
}
local syncName = {
	blink = "NothBlink"..module.revision,
	curse = "NothCurse"..module.revision,
	teleportToBalcony = "NothTeleportToBalcony"..module.revision,
	teleportToRoom = "NothTeleportToRoom"..module.revision,
}

local berserkannounced = nil

------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger1"])
module:RegisterYellEngage(L["starttrigger2"])
module:RegisterYellEngage(L["starttrigger3"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "CheckForBlink")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckForCurse")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckForCurse")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckForCurse")

	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "Teleport")

	self:ThrottleSync(5, syncName.blink)
	self:ThrottleSync(5, syncName.curse)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	timer.room = timer.firstRoom
	timer.balcony = timer.firstBalcony
	timer.wave2 = timer.wave2_1
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.teleport then
		self:Message(L["startwarn"], "Important")
		self:Bar(L["teleportbar"], timer.room, icon.balcony)
		--self:DelayedMessage(timer.room - 30, L["teleportwarn30"], "Urgent")
		--self:DelayedMessage(timer.room - 10, L["teleportwarn10"], "Urgent")
	end
	if self.db.profile.blink then
		self:IntervalBar(L["blinkbar"], timer.firstBlink[1], timer.firstBlink[2], icon.blink)
		--self:DelayedMessage(timer.firstBlink[1] - 10, L["blinkwarn10"], "Attention")
		--self:DelayedMessage(timer.firstBlink[1] - 5, L["blinkwarn5"], "Attention")
	end
	if self.db.profile.curse then
		self:IntervalBar(L["cursebar"], timer.firstCurse[1], timer.firstCurse[2], icon.curse)
	end

	self:ScheduleEvent("bwnothtobalcony", self.TeleportToBalcony, timer.room, self)
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end

------------------------------
--      Initialization      --
------------------------------

function module:CheckForCurse(msg)
	if string.find(msg, L["cursetrigger"]) then
		self:Sync(syncName.curse)
	end
end

function module:CheckForBlink(msg)
	if msg == L["blinktrigger"] then
		self:Sync(syncName.blink)
	end
end

function module:Teleport(msg)
	if msg == L["teleportToBalconyTrigger"] then
		self:Sync(syncName.teleportToBalcony)
	elseif msg == L["teleportToRoomTrigger"] then
		self:Sync(syncName.teleportToRoom)
	end
end

function module:TeleportToBalcony()
	self:CancelScheduledEvent("bwnothtobalcony")
	if timer.room == timer.firstRoom then
		timer.room = timer.secondRoom
	elseif timer.room == timer.secondRoom then
		timer.room = timer.thirdRoom
	end

	--self:CancelDelayedMessage(L["teleportwarn10"])
	--self:CancelDelayedMessage(L["teleportwarn30"])
	--self:CancelDelayedMessage(L["curse10secwarn"])

	self:RemoveBar(L["blinkbar"])
	self:RemoveBar(L["cursebar"])

	if self.db.profile.teleport then
		self:Message(L["teleportwarn"], "Important")
		self:Bar(L["backbar"], timer.balcony, icon.balcony)
		--self:DelayedMessage(timer.balcony - 30, L["backwarn30"], "Urgent")
		--self:DelayedMessage(timer.balcony - 10, L["backwarn10"], "Urgent")
	end
	if self.db.profile.wave then
		self:IntervalBar(L["wave1bar"], timer.wave1[1], timer.wave1[2], icon.wave)
		self:IntervalBar(L["wave2bar"], timer.wave2[1], timer.wave2[2], icon.wave)
		--self:DelayedMessage(timer.wave2 - 10, L["wave2_message"], "Urgent")
		--self:DelayedMessage(timer.wave2, L["wave2s_message"], "Urgent")
	end
	self:ScheduleEvent("bwnothtoroom", self.TeleportToRoom, timer.balcony, self)
end

function module:TeleportToRoom()
	self:CancelScheduledEvent("bwnothtoroom")
	if timer.balcony == timer.firstBalcony then
		timer.balcony = timer.secondBalcony
		timer.wave2 = timer.wave2_2
	elseif timer.balcony == timer.secondBalcony then
		timer.balcony = timer.thirdBalcony
		timer.wave2 = timer.wave2_3
	end

	if self.db.profile.teleport then
		self:Message(string.format(L["backwarn"], timer.room), "Important")
		self:IntervalBar(L["blinkbar"], timer.blinkAfterTeleport[1], timer.blinkAfterTeleport[2], icon.blink)
		--self:DelayedMessage(timer.blinkAfterTeleport[1] - 10, L["blinkwarn10"], "Attention") -- praeda
		--self:DelayedMessage(timer.blinkAfterTeleport[1] - 5, L["blinkwarn5"], "Attention") -- praeda

		self:Bar(L["teleportbar"], timer.room, icon.balcony)
		--self:DelayedMessage(timer.room - 30, L["teleportwarn30"], "Urgent")
		--self:DelayedMessage(timer.room - 10, L["teleportwarn10"], "Urgent")
	end
	if self.db.profile.curse then
		self:IntervalBar(L["cursebar"], timer.curseAfterTeleport[1], timer.curseAfterTeleport[2], icon.curse)
	end

	self:ScheduleEvent("bwnothtobalcony", self.TeleportToBalcony, timer.room, self)

	self:KTM_Reset()
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.curse then
		self:Curse()
	elseif sync == syncName.blink then
		self:Blink()
	elseif sync == syncName.teleportToBalcony then
		self:TeleportToBalcony()
	elseif sync == syncName.teleportToRoom then
		self:TeleportToRoom()
	end
end

------------------------------
--      Utility	Functions   --
------------------------------

function module:Curse()
	if self.db.profile.curse then
		self:Message(L["cursewarn"], "Important", nil, "Alarm")
		--self:DelayedMessage(timer.curse - 10, L["curse10secwarn"], "Urgent")
		self:IntervalBar(L["cursebar"], timer.curse[1], timer.curse[2], icon.curse)
	end
end

function module:Blink()
	if self.db.profile.blink then
		self:Message(L["blinkwarn"], "Important")
		--self:DelayedMessage(timer.regularBlink - 10, L["blinkwarn10"], "Attention")
		--self:DelayedMessage(timer.regularBlink - 5, L["blinkwarn5"], "Attention")
		self:IntervalBar(L["blinkbar"], timer.regularBlink[1], timer.regularBlink[2], icon.blink)
	end

	-- aggro reset?
	self:KTM_Reset()
end
