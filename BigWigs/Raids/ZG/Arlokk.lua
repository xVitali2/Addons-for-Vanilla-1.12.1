
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("High Priestess Arlokk", "Zul'Gurub")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Arlokk",

	engage_trigger = "your priestess calls upon your might",
	mark_trigger = "Feast on (.+), my pretties!",
	mark_warning_self = "You are marked!",
	mark_warning_other = "%s is marked!",
	mark_fade = "Mark of Arlokk fades from (.+)\.",
	ww_trigger = "High Priestess Arlokk gains Whirlwind\.",
	ww_bar = "Whirlwind",
	trollphase_message = "Troll Phase",
	pantherphase_message = "Panther Phase",
	vanishphase_message = "Vanish!",
	vanish_bar = "Estimated Return",
	vanish_Nextbar = "Next Vanish",

	vanish_cmd = "vanish",
	vanish_name = "Vanish alert",
	vanish_desc = "Shows a bar for the Vanish duration.",

	mark_cmd = "mark",
	mark_name = "Mark of Arlokk alert",
	mark_desc = "Warns when people are marked.",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Whirldind alert",
	whirlwind_desc = "Shows you when the boss has Whirlwind.",

	phase_cmd = "phase",
	phase_name = "Phase notification",
	phase_desc = "Announces the boss' phase transitions.",

	puticon_cmd = "puticon",
	puticon_name = "Raid icon on marked players",
	puticon_desc = "Place a raid icon on the player with Mark of Arlokk.\n\n(Requires assistant or higher)",
} end )

L:RegisterTranslations("ruRU", function() return { --BY CFM
	engage_trigger = "your priestess calls upon your might!", --Бетекк, твоя жрица просит твоей силы! --не русифицированы на light's hope
	mark_trigger = "Feast on (.+), my pretties!", --(.+) вам понравится, красавчики мои! --не русифицированы на light's hope
	mark_warning_self = "Вы отмечены!",
	mark_warning_other = "%s отмечен!",
	mark_fade = "Действие эффекта \"Метка Арлокк\", наложенного на (.+), заканчивается\.",
	ww_trigger = "Верховная жрица Арлокк получает эффект \"Вихрь\"\.",
	ww_bar = "Вихрь",
	trollphase_message = "Тролль фаза",
	pantherphase_message = "Фаза пантеры",
	vanishphase_message = "Исчезновение!",
	vanish_bar = "Предпологаемое возвращение",
	vanish_Nextbar = "Следующие Исчезновение",

	vanish_name = "Оповещение об Исчезновении",
	vanish_desc = "Информировать о длительности Исчезновения.",

	mark_name = "Оповещение о Метки Арлокк",
	mark_desc = "Предупреждает когда игрок помечем.",

	whirlwind_name = "Оповещение о Вихре",
	whirlwind_desc = "Отображать вам когда босс в Вихре.",

	phase_name = "Уведомление о фазах",
	phase_desc = "Объявляет когда босс переходит в другую фазу.",

	puticon_name = "Значок рейда на помеченных игроках.",
	puticon_desc = "Устанавливать значок рейда на игрока с Меткой Арлокк.\n\n(Требуется помощник или выше)",
} end )

L:RegisterTranslations("esES", function() return {
	cmd = "Arlokk",

	--engage_trigger = "your priestess calls upon your might",
	--mark_trigger = "Feast on (.+), my pretties!",
	mark_warning_self = "¡Estás marcado!",
	mark_warning_other = "¡%s está marcado!",
	mark_fade = "Marca de Arlokk desaparece de (.+)\.",
	ww_trigger = "Suma sacerdotisa Arlokk gana Torbellino\.",
	ww_bar = "Torbellino",
	trollphase_message = "Fase de Trol",
	pantherphase_message = "Fase de Pantera",
	vanishphase_message = "¡Se Esfuma!",
	vanish_bar = "Estimación de Regreso",
	vanish_Nextbar = "Próximo Esfumar",

	--vanish_cmd = "vanish",
	vanish_name = "Alerta de Esfumar",
	vanish_desc = "Muestra una barra para la duración de Esfumar.",

	--mark_cmd = "mark",
	mark_name = "Alerta de Marca de Arlokk",
	mark_desc = "Avisa cuando un jugador tenga Marca de Arlokk.",

	--whirlwind_cmd = "whirlwind",
	whirlwind_name = "Alerta de Torbellino",
	whirlwind_desc = "Muestra cuando tenga Torbellino la jefa.",

	--phase_cmd = "phase",
	phase_name = "Alerta de Fase",
	phase_desc = "Anuncia cuando cambie la fase de la jefa.",

	--puticon_cmd = "puticon",
	puticon_name = "Marcar para Marca de Arlokk",
	puticon_desc = "Marca los jugadores quien tienen Marca de Arlokk con un icono de la banda.\n\n(Require asistente o líder)",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Arlokk",

	engage_trigger = "your priestess calls upon your might",
	mark_trigger = "Feast on (.+), my pretties!",
	mark_warning_self = "Du bist markiert!",
	mark_warning_other = "%s ist markiert!",
	mark_fade = "Arlokks Mal schwindet von (.+)\.",
	ww_trigger = "High Priestess Arlokk bekommt \'Wirbelwind\'\.",
	ww_bar = "Wirbelwind",
	trollphase_message = "Troll Phase",
	pantherphase_message = "Panther Phase",
	vanishphase_message = "Verschwinden!",
	vanish_bar = "Ungefähre Rückkehr",
	vanish_Nextbar = "Nächstes Verschwinden",

	vanish_cmd = "vanish",
	vanish_name = "Verschwinden anzeigen",
	vanish_desc = "Verk\195\188ndet Boss' Verschwinden.",

	mark_cmd = "mark",
	mark_name = "Alarm f\195\188r Arlokks Mal",
	mark_desc = "Warnt wenn Spieler markiert sind.",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Alarm f\195\188r Wirbelwind",
	whirlwind_desc = "Zeigt Balken f\195\188r Wirbelwind.",

	phase_cmd = "phase",
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses.",

	puticon_cmd = "puticon",
	puticon_name = "Schlachtzugsymbol auf die markiert Spieler",
	puticon_desc = "Versetzt eine Schlachtzugsymbol auf der markiert Spieler.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20006 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"phase", "whirlwind", "vanish", "mark", "puticon", "bosskill"}

-- Proximity Plugin
-- module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
-- module.proximitySilent = false


-- locals
local timer = {
	firstVanish = 35,
	vanish = 75,
	unvanish = 35,
	whirlwind = 2,
}
local icon = {
	vanish = "Ability_Vanish",
	whirlwind = "Ability_Whirlwind",
}
local syncName = {
	trollPhase = "ArlokkPhaseTroll"..module.revision,
	vanishPhase = "ArlokkPhaseVanish"..module.revision,
	pantherPhase = "ArlokkPhasePanther"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["engage_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")

	self:ThrottleSync(3, syncName.trollPhase)
	self:ThrottleSync(3, syncName.vanishPhase)
	self:ThrottleSync(3, syncName.pantherPhase)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	vanished = nil
end

-- called after boss is engaged
function module:OnEngage()
	self:CancelScheduledEvent("checkvanish")
	self:ScheduleRepeatingEvent("checkvanish", self.CheckVanish, 1, self)
	if self.db.profile.phase then
		self:Message(L["trollphase_message"], "Attention")
	end
	self:Bar(L["vanish_Nextbar"], timer.firstVanish, icon.vanish)
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:CHAT_MSG_MONSTER_YELL(msg)
	local _,_, n = string.find(msg, L["mark_trigger"])
	if n then
		if self.db.profile.mark then
			if n == UnitName("player") then
				self:Message(L["mark_warning_self"], "Attention", true, "Alarm")
			else
				self:Message(string.format(L["mark_warning_other"], n), "Attention")
			end
		end
		if self.db.profile.puticon then
			self:Icon(n)
		end
		--self:Sync(syncName.vanishPhase)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg == L["ww_trigger"] and self.db.profile.whirlwind then
		self:Bar(L["ww_bar"], timer.whirlwind, icon.whirlwind)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.pantherPhase then
		self:PantherPhase()
	elseif sync == syncName.vanishPhase then
		self:VanishPhase()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:PantherPhase()
	vanished = false
	self:CancelScheduledEvent("checkunvanish")
	if self.db.profile.vanish then
		self:RemoveBar(L["vanish_bar"])
		self:Bar(L["vanish_Nextbar"], timer.vanish, icon.vanish)
	end
	if self.db.profile.phase then
		self:Message(L["pantherphase_message"], "Attention")
	end

	if not vanished then
		self:ScheduleRepeatingEvent("checkvanish", self.CheckVanish, 0.5, self)
	end
end

function module:VanishPhase()
	vanished = true
	self:CancelScheduledEvent("checkvanish")
	self:CancelScheduledEvent("trollphaseinc")
	if self.db.profile.phase then
		self:Message(L["vanishphase_message"], "Attention")
	end
	if self.db.profile.vanish then
		self:RemoveBar(L["vanish_Nextbar"])
		self:Bar(L["vanish_bar"], timer.unvanish, icon.vanish, true, "White")
	end
	self:ScheduleRepeatingEvent("checkunvanish", self.CheckUnvanish, 0.5, self)
end


------------------------------
--      Utility	Functions   --
------------------------------


function module:CheckUnvanish()
	self:DebugMessage("CheckUnvanish")
	if module:IsArlokkVisible() then
		self:Sync(syncName.pantherPhase)
	end
end
function module:CheckVanish()
	self:DebugMessage("CheckVanish")
	if not module:IsArlokkVisible() then
		self:Sync(syncName.vanishPhase)
	end
end
function module:IsArlokkVisible()
	if UnitName("playertarget") == self.translatedName then
		return true
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == self.translatedName then
				return true
			end
		end
	end

	return false
end

function module:Test()
	-- /run local m=BigWigs:GetModule("High Priestess Arlokk");m:Test()
	local translatedName = self.translatedName

	local function testCheckVanish()
		ClearTarget()
		BigWigs:Print("testCheckVanish")
	end
	local function testCheckUnvanish()
		TargetUnit("player")
		BigWigs:Print("testCheckUnvanish")
	end
	local function testDisable()
		--module:SendWipeSync()
		BigWigs:TriggerEvent("BigWigs_RebootModule", self:ToString())
		BigWigs:DisableModule(module:ToString())
		BigWigs:Print("Test finished")
		self.translatedName = translatedName
	end

	-- short test
	local testTimer = 0
	self:SendEngageSync()

	BigWigs:Print("Target/Untarget yourself to test CheckVanish/CheckUnvanish")
	testCheckUnvanish()
	self.translatedName = UnitName("player") -- override name to test CheckVanish/CheckUnvanish

	-- vanish
	testTimer = testTimer + 5
	self:ScheduleEvent(self:ToString() .. "testCheckVanish", testCheckVanish, testTimer, self)
	BigWigs:Print("testCheckVanish in " .. testTimer)

	-- unvanish
	testTimer = testTimer + 5
	self:ScheduleEvent(self:ToString() .. "testCheckUnvanish", testCheckUnvanish, testTimer, self)
	BigWigs:Print("testCheckUnvanish in " .. testTimer)

	-- disable
	testTimer = testTimer + 10
	self:ScheduleEvent(self:ToString() .. "testDisable", testDisable, testTimer, self)
	BigWigs:Print("testDisable in " .. testTimer)
end
