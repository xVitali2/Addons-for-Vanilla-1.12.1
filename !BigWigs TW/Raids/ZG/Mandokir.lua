
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Bloodlord Mandokir", "Zul'Gurub")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	ohgan = "Ohgan",
	cmd = "Mandokir",

	engage_trigger = "feed your souls to Hakkar himself",
	watch_trigger = "(.+)! I'm watching you!",
	gaze_trigger = "Bloodlord Mandokir begins to cast Threatening Gaze.",
	gazeafflictyou = "You are afflicted by Threatening Gaze.",
	gazeafflictother = "(.+) is afflicted by Threatening Gaze.",
	gazeendyou = "Threatening Gaze fades from you.",
	gazeendother = "Threatening Gaze fades from (.+).",
	gazecast = "Incoming Threatening Gaze!",
	gazewatchedbar = "Threatening Gaze: %s",
	enragegain = "Bloodlord Mandokir gains Enrage.",
	enragefade = "Enrage fades from Bloodlord Mandokir.",
	enragebar = "Enrage",
	wwgain = "Bloodlord Mandokir gains Whirlwind.",
	wwloss = "Whirlwind fades from Bloodlord Mandokir.",
	ww = "Whirlwind",
	deathyou = "You die.",
	deathother = "(.+) dies.",
	you = "you",
	
	watched_warning = "You are being watched! Stop everything!",
	watched_warning_tell = "You are being watched! Stop everything!",
	watched_warning_other = "%s is being watched!",
	enraged_message = "Ohgan down! Mandokir enraged!",

	announce_cmd = "whispers",
	announce_name = "Whisper watched players",
	announce_desc = "Warn when boss uses Threatening Gaze.\n\n(Requires assistant or higher)",

	puticon_cmd = "puticon",
	puticon_name = "Raid icon on watched players",
	puticon_desc = "Place a raid icon on the watched person.\n\n(Requires assistant or higher)",

	gaze_cmd = "gaze",
	gaze_name = "Threatening Gaze alert",
	gaze_desc = "Shows bars for Threatening Gaze",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Whirlwind Alert",
	whirlwind_desc = "Shows Whirlwind bars",

	enraged_cmd = "enraged",
	enraged_name = "Enrage alert",
	enraged_desc = "Announces the boss' Enrage",

	["Possible Gaze"] = true,
	["Charge"] = true,
	["Next Whirlwind"] = true,
} end )

L:RegisterTranslations("ruRU", function() return {--by CFM
	ohgan = "Охган",

	engage_trigger = "feed your souls to Hakkar himself", --не русифицированы на light's hope
	watch_trigger = "(.+)! I'm watching you!", --(.+)! Я за тобой слежу! --не русифицированы на light's hope
	gaze_trigger = "Мандокир Повелитель Крови начинает использовать \"Угрожающий взгляд\".",
	gazeafflictyou = "Вы находитесь под воздействием эффекта \"Угрожающий взгляд\".",
	gazeafflictother = "(.+) находится под воздействием эффекта \"Угрожающий взгляд\".",
	gazeendyou = "Действие эффекта \"Угрожающий взгляд\", наложенного на вас, заканчивается.",
	gazeendother = "Действие эффекта \"Угрожающий взгляд\", наложенного на (.+), заканчивается.",
	gazecast = "Скоро Угрожающий взгляд!",
	gazewatchedbar = "Угрожающий взгляд: %s",
	enragegain = "Мандокир Повелитель Крови получает эффект \"Бешенство\".",
	enragefade = "Действие эффекта \"Бешенство\", наложенного на Мандокир Повелитель Крови, заканчивается.",
	enragebar = "Бешенство",
	wwgain = "Мандокир Повелитель Крови получает эффект \"Вихрь\".",
	wwloss = "Действие эффекта \"Вихрь\", наложенного на Мандокир Повелитель Крови, заканчивается.",
	ww = "Вихрь",
	deathyou = "Вы умерли.",
	deathother = "(.+) погибает.",
	you = "вы",
	
	watched_warning = "За тобой будут следить! Прекрати всё!",
	watched_warning_tell = "За тобой следят! Прекрати всё!",
	watched_warning_other = "За %s следят!",
	enraged_message = "Охган погиб! Мандокир разъяренный!",

	announce_name = "Шёпот игрокам под взглядом",
	announce_desc = "Предупреждает когда босс использует Угрожающий взгляд.\n\n(Требуется помощник или лидер)",

	puticon_name = "Значок рейда на игрока под взглядом",
	puticon_desc = "Устанавливать значок рейда на персонажа под взглядом.\n\n(Требуется помощник или лидер)",

	gaze_name = "Оповещение об Угрожающим взгляде",
	gaze_desc = "Отображает полосу Угрожающего взгляда",

	whirlwind_name = "Оповещение о Вихре",
	whirlwind_desc = "Отображает полосу Вихря",

	enraged_name = "Оповещение о Бешенстве",
	enraged_desc = "Сообщает когда босс в Бешенстве",

	["Possible Gaze"] = "Возможный взгляд",
	["Charge"] = "Рывок",
	["Next Whirlwind"] = "Следующий Вихрь",
} end )

L:RegisterTranslations("deDE", function() return {
	ohgan = "Ohgan",
	cmd = "Mandokir",

	engage_trigger = "feed your souls to Hakkar himself",
	watch_trigger = "(.+)! I'm watching you!",
	gaze_trigger = "Bloodlord Mandokir beginnt Bedrohlicher Blick zu wirken.",
	gazeafflictyou = "Ihr seid von Bedrohlicher Blick betroffen.",
	gazeafflictother = "(.+) ist von Bedrohlicher Blick betroffen.",
	gazeendyou = "'Bedrohlicher Blick' schwindet von Euch.",
	gazeendother = "Bedrohlicher Blick schwindet von (.+).",
	gazecast = "Bedrohlicher Blick kommt!",
	gazewatchedbar = "Bedrohlicher Blick: %s",
	enragegain = "Bloodlord Mandokir bekommt 'Wutanfall'.",
	enragefade = "Wutanfall schwindet von Bloodlord Mandokir.",
	enragebar = "Wutanfall",
	wwgain = "Bloodlord Mandokir bekommt 'Wirbelwind'.",
	wwloss = "Wirbelwind schwindet von Bloodlord Mandokir\.",
	ww = "Wirbelwind",
	deathyou = "Du stirbst.",
	deathother = "(.+) stirbt.",
	you = "Euch",

	watched_warning = "Du wirst beobachtet! Stoppen Sie alles!",
	watched_warning_tell = "You are being watched! Stop everything!",
	watched_warning_other = "%s wird beobachtet!",
	enraged_message = "Ohgan ist tot! Mandokir wütend!",

	announce_cmd = "whispers",
	announce_name = "Warnung, wenn Spieler beobachtet werden",
	announce_desc = "Warnen, wenn Bloodlord Mandokir wirft Bedrohlicher Blick\n\n(Benötigt Schlachtzugleiter oder Assistent)",

	puticon_cmd = "puticon",
	puticon_name = "Schlachtzugsymbol auf die beobachtet Spieler",
	puticon_desc = "Versetzt eine Schlachtzugsymbol auf der beobachteten Spieler.\n\n(Benötigt Schlachtzugleiter oder Assistent)",

	gaze_cmd = "gaze",
	gaze_name = "Alarm für Bedrohlicher Blick",
	gaze_desc = "Zeigt Balken für Bedrohlicher Blick",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Alarm für Wirbelwind",
	whirlwind_desc = "Zeigt Balken für Wirbelwind",

	enraged_cmd = "enraged",
	enraged_name = "Verkündet Boss' Raserei",
	enraged_desc = "Lässt dich wissen, wenn Boss härter zuschlägt",

	["Possible Gaze"] = "Mögliches Starren",
	["Charge"] = "Sturmangriff",
	["Next Whirlwind"] = "Wirbelwind",
} end )

L:RegisterTranslations("esES", function() return {
	ohgan = "Ohgan",
--	cmd = "Mandokir",

	engage_trigger = "feed your souls to Hakkar himself",
	watch_trigger = "(.+)! I'm watching you!",
	gaze_trigger = "Señor sangriento Mandokir comienza a lanzar Mirada amenazante.",
	gazeafflictyou = "Sufres de Mirada amenazante.",
	gazeafflictother = "(.+) sufre de Mirada amenazante.",
	gazeendyou = "Mirada amenazante desaparece de ti.",
	gazeendother = "Mirada amenazante desaparece de (.+).",
	gazecast = "¡Mirada amenazante entrante!",
	gazewatchedbar = "Mirada amenazante: %s",
	enragegain = "Señor sangriento Mandokir gana Enfurecer.",
	enragefade = "Enfurecer desaparece de Señor sangriento Mandokir.",
	enragebar = "Enfurecer",
	wwgain = "Señor sangriento Mandokir gana Torbellino.",
	wwloss = "Torbellino desaparece de Señor sangriento Mandokir.",
	ww = "Torbellino",
	deathyou = "Has muerto.",
	deathother = "(.+) ha muerto.",
	you = "tu",
	
	watched_warning = "¡Estás siendo mirado! Detén todos!",
	watched_warning_tell = "¡Estás siendo mirado! Detén todos!",
	watched_warning_other = "¡%s está siendo mirado!",
	enraged_message = "¡Acabado con Ohgan! Mandokir enfurecido!",

	--announce_cmd = "whispers",
	announce_name = "Susurrar a los jugadores mirados",
	announce_desc = "Avisa cuando el jefe use Mirada amenazante.\n\n(Require asistente o líder)",

	--puticon_cmd = "puticon",
	puticon_name = "Marcar a los jugadores con Mirada amenazante",
	puticon_desc = "Marca con un icono el jugador con Mirada amenazante.\n\n(Require asistente o líder)",

	--gaze_cmd = "gaze",
	gaze_name = "Alerta de Mirada amenazante",
	gaze_desc = "Muestra una barra para Mirada amenazante",

	--whirlwind_cmd = "whirlwind",
	whirlwind_name = "Alerta de Torbellino",
	whirlwind_desc = "Muestra barras para Torbellino",

	--enraged_cmd = "enraged",
	enraged_name = "Alerta de Enfurecer",
	enraged_desc = "Anuncia cuando tenga Enfurecer el jefe",

	["Possible Gaze"] = "Mirada amenazante Posible",
	["Charge"] = "Embestir",
	["Next Whirlwind"] = "Próximo Torbellino",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20005 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.wipemobs = { L["ohgan"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"gaze", "announce", "puticon", "whirlwind", "enraged", "bosskill"}


-- locals
local timer = {
	firstCharge = 15,
	firstWhirlwind = 20,
	firstGaze = 33,

	gaze = 20,
}
local icon = {
	charge = "Ability_Warrior_Charge",
	whirlwind = "Ability_Whirlwind",
	gaze = "Spell_Shadow_Charm",
}
local syncName = {
	whirlwind = "MandokirWWStart"..module.revision,
	whirlwindOver = "MandokirWWStop"..module.revision,
	enrage = "MandokirEnrageStart"..module.revision,
	enrageOver = "MandokirEnrageEnd"..module.revision,
	gazeCast = "MandokirGazeCast"..module.revision,
	gazeAfflicted = "MandokirGazeAfflict"..module.revision,
	gazeOver = "MandokirGazeEnd"..module.revision,
}

--[[
9/16 22:28:16.440  Dorg's Shield Slam hits Bloodlord Mandokir for 264. -- engage

Line 19212: 9/16 22:28:32.884  Bloodlord Mandokir gains Whirlwind.	16.4
Line 20100: 9/16 22:28:56.912  Bloodlord Mandokir gains Whirlwind.	24.1
Line 21416: 9/16 22:29:38.798  Bloodlord Mandokir gains Whirlwind.	41.9
Line 22221: 9/16 22:30:02.966  Bloodlord Mandokir gains Whirlwind.	24.1

Line 19709: 9/16 22:28:45.869  Bloodlord Mandokir begins to cast Threatening Gaze. 	29.5
Line 20694: 9/16 22:29:13.993  Bloodlord Mandokir begins to cast Threatening Gaze.	28.1
Line 21512: 9/16 22:29:42.084  Bloodlord Mandokir begins to cast Threatening Gaze.	28.1
Line 22455: 9/16 22:30:10.189  Bloodlord Mandokir begins to cast Threatening Gaze.	28.1
]]


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["engage_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")

	self:ThrottleSync(5, syncName.whirlwind)
	self:ThrottleSync(5, syncName.whirlwindOver)
	self:ThrottleSync(5, syncName.enrage)
	self:ThrottleSync(5, syncName.enrageOver)
	self:ThrottleSync(5, syncName.gazeCast)
	self:ThrottleSync(5, syncName.gazeAfflicted)
	self:ThrottleSync(5, syncName.gazeOver)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
end

-- called after boss is engaged
function module:OnEngage()
	self:Bar(L["Charge"], timer.firstCharge, icon.charge)
	-- todo check combat log regarding CHARGE to trigger the ones following the first
	self:Bar(L["Next Whirlwind"], timer.firstWhirlwind, icon.whirlwind)
	self:Bar(L["Possible Gaze"], timer.firstGaze, icon.gaze)
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:CHAT_MSG_MONSTER_YELL(msg)
	local gazetime
	local _,_,watchedplayer,_ = string.find(msg, L["watch_trigger"])
	if watchedplayer then
		if self.db.profile.announce then
			if watchedplayer == UnitName("player") then
				self:Message(L["watched_warning"], "Personal", true, "Alarm")
			else
				self:Message(string.format(L["watched_warning_other"], watchedplayer), "Attention")
				self:TriggerEvent("BigWigs_SendTell", watchedplayer, L["watched_warning_tell"])
			end
		end
		if self.db.profile.puticon then
			self:Icon(watchedplayer)
		end
		if watchedplayer == UnitName("player") and self.db.profile.gaze then
			self:WarningSign(icon.gaze, 7)
		end
	end
end

function module:Event(msg)
	local _,_,gazedplayer,_ = string.find(msg, L["gazeafflictother"])
	local _,_,gazedplayerend,_ = string.find(msg, L["gazeendother"])
	--local _,_,gazeddeathend,_ = string.find(msg, L["deathother"])
	if msg == L["wwgain"] then
		self:Sync(syncName.whirlwind)
	elseif msg == L["wwloss"] then
		self:Sync(syncName.whirlwindOver)
	elseif msg == L["enragegain"] then
		self:Sync(syncName.enrage)
	elseif msg == L["enragefade"] then
		self:Sync(syncName.enrageOver)
	elseif msg == L["gaze_trigger"] then
		self:Sync(syncName.gazeCast)
	elseif msg == L["gazeafflictyou"] then
		gazetime = GetTime()
		self:Sync(syncName.gazeAfflicted .. " " .. UnitName("player"))
	elseif gazedplayer then
		gazetime = GetTime()
		self:Sync(syncName.gazeAfflicted .. " " .. gazedplayer)
	elseif msg == L["gazeendyou"] then
		self:Sync(syncName.gazeOver .. " " .. UnitName("player"))
	elseif gazedplayerend and gazedplayerend ~= L["you"] then
		self:Sync(syncName.gazeOver .. " " .. gazedplayerend)
		--elseif msg == L["deathyou"] then
		--	self:Sync("MandokirGazeEnd "..UnitName("player"))
		--elseif gazeddeathend then
		--	self:Sync("MandokirGazeEnd "..gazeddeathend)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.whirlwind and self.db.profile.whirlwind then
		self:Bar(L["ww"], 2, icon.whirlwind)
		--self:ScheduleEvent("BigWigs_StartBar", 2, self, "Next Whirlwind", 18, icon.whirlwind)
	elseif sync == syncName.whirlwindOver and self.db.profile.whirlwind then
		self:RemoveBar(L["ww"])
		self:Bar(L["Next Whirlwind"], 18, icon.whirlwind)
	elseif sync == syncName.enrage and self.db.profile.enraged then
		self:Message(L["enraged_message"], "Urgent")
		self:Bar(L["enragebar"], 90, "Spell_Shadow_UnholyFrenzy")
	elseif sync == syncName.enrageOver and self.db.profile.enraged then
		self:RemoveBar(L["enragebar"])
	elseif sync == syncName.gazeCast and self.db.profile.gaze then
		self:Bar(L["gazecast"], 2, icon.gaze)
		self:RemoveBar(L["Possible Gaze"])
	elseif sync == syncName.gazeAfflicted and self.db.profile.gaze then
		self:Bar(string.format(L["gazewatchedbar"], rest), 6, icon.gaze, true, "Black")
	elseif sync == syncName.gazeOver then
		if self.db.profile.gaze then
			self:RemoveBar(string.format(L["gazewatchedbar"], rest))
		end
		if self.db.profile.puticon then
			self:RemoveIcon(rest)
		end
		self:Bar(L["Possible Gaze"], timer.gaze-8, icon.gaze)
	end
end
