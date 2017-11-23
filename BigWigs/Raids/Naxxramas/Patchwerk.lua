
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Patchwerk", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Patchwerk",

	enrage_cmd = "enrage",
	enrage_name = "Enrage Alert",
	enrage_desc = "Warn for Enrage",

	enragetrigger = "%s goes into a berserker rage!",

	enragewarn = "Enrage!",
	starttrigger1 = "Patchwerk want to play!",
	starttrigger2 = "Kel'Thuzad make Patchwerk his Avatar of War!",
	startwarn = "Patchwerk Engaged! Enrage in 7 minutes!",
	enragebartext = "Enrage",
	warn5m = "Enrage in 5 minutes",
	warn3m = "Enrage in 3 minutes",
	warn90 = "Enrage in 90 seconds",
	warn60 = "Enrage in 60 seconds",
	warn30 = "Enrage in 30 seconds",
	warn10 = "Enrage in 10 seconds",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Patchwerk",

	--enrage_cmd = "enrage",
	enrage_name = "Alerta de Enfurecer",
	enrage_desc = "Avisa para Enfurecer",

	enragetrigger = "%s goes into a berserker rage!",

	enragewarn = "¡Enfurecer!",
	starttrigger1 = "Patchwerk want to play!",
	starttrigger2 = "Kel'Thuzad make Patchwerk his Avatar of War!",
	startwarn = "¡Entrando en combate con Remendejo! Enfurecer en 7 minutos!",
	enragebartext = "Enfurecer",
	warn5m = "Enfurecer en 5 minutos",
	warn3m = "Enfurecer en 3 minutos",
	warn90 = "Enfurecer en 90 segundos",
	warn60 = "Enfurecer en 60 segundos",
	warn30 = "Enfurecer en 30 segundos",
	warn10 = "Enfurecer en 10 segundos",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20003 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"enrage", "bosskill"}

-- locals
local timer = {
	enrage = 420,
}
local icon = {
	enrage = "Spell_Shadow_UnholyFrenzy",
}
local syncName = {
	enrage = "PatchwerkEnrage"..module.revision,
}

local berserkannounced = nil


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger1"])
module:RegisterYellEngage(L["starttrigger2"])

-- called after module is enabled
function module:OnEnable()
	self:ThrottleSync(10, syncName.enrage)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = false
	berserkannounced = false
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.enrage then
		self:Message(L["startwarn"], "Important")
		self:Bar(L["enragebartext"], timer.enrage, icon.enrage)
		self:DelayedMessage(timer.enrage - 5 * 60, L["warn5m"], "Attention")
		self:DelayedMessage(timer.enrage - 3 * 60, L["warn3m"], "Attention")
		self:DelayedMessage(timer.enrage - 90, L["warn90"], "Urgent")
		self:DelayedMessage(timer.enrage - 60, L["warn60"], "Urgent")
		self:DelayedMessage(timer.enrage - 30, L["warn30"], "Important")
		self:DelayedMessage(timer.enrage - 10, L["warn10"], "Important")
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:CHAT_MSG_MONSTER_EMOTE( msg )
	if msg == L["enragetrigger"] then
		self:Sync(syncName.enrage)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.enrage then
		self:Enrage()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Enrage()
	if self.db.profile.enrage then
		self:Message(L["enragewarn"], "Important", nil, "Beware")

		self:RemoveBar(L["enragebartext"])

		self:CancelDelayedMessage(L["warn5m"])
		self:CancelDelayedMessage(L["warn3m"])
		self:CancelDelayedMessage(L["warn90"])
		self:CancelDelayedMessage(L["warn60"])
		self:CancelDelayedMessage(L["warn30"])
		self:CancelDelayedMessage(L["warn10"])
	end
end
