
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("High Priestess Mar'li", "Zul'Gurub")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	spawn_name = "Spawn of Mar'li",

	cmd = "Marli",

	spiders_trigger = "Aid me my brood!",
	drainlifeyoustart_trigger = "You are afflicted by Drain Life\.",
	drainlifeotherstart_trigger = "(.+) is afflicted by Drain Life\.",
	drainlifeyouend_trigger = "Drain Life fades from you\.",
	drainlifeotherend_trigger = "Drain Life fades from (.+)\.",
	pbv = "Poison Bolt Volley",
	pbvafflicts_trigger = "afflicted by Poison Bolt Volley",
	pbvhits_trigger = "High Priestess Mar'li 's Poison Bolt Volley hits",
	pbvresist_trigger = "High Priestess Mar'li 's Poison Bolt Volley was resisted(.+)",
	pbvimmune_trigger = "High Priestess Mar'li 's Poison Bolt Volley fail(.+) immune",
	you = "you",
	drainlife = "Drain Life",
	spiders_message = "Spiders spawned!",
	drainlife_message = "Drain Life! Interrupt/dispel it!",
	trollphase = "Troll phase",
	trollphase_trigger = "The brood shall not fall",
	spiderphase = "Spider phase",
	spiderphase_trigger1 = "Draw me to your web mistress Shadra",
	spiderphase_trigger2 = "Shadra, make of me your avatar",

	spider_cmd = "spider",
	spider_name = "Spider Alert",
	spider_desc = "Warn when spiders spawn",

	volley_cmd = "volley",
	volley_name = "Poison Bolt Volley Alert",
	volley_desc = "Warn for Poison Bolt Volleys\n\n(Disclaimer: this bar has a \194\1772 seconds error)",

	drain_cmd = "drain",
	drain_name = "Drain Life Alert",
	drain_desc = "Warn for life drain",

	phase_cmd = "phase",
	phase_name = "Phase Notification",
	phase_desc = "Announces the boss' phase transition",
} end )

L:RegisterTranslations("ruRU", function() return { --by CFM
	spawn_name = "Порождение Мар'ли",

	spiders_trigger = "Aid me my brood!", --На помощь, родичи! --не русифицированы на light's hope
	drainlifeyoustart_trigger = "Вы находитесь под воздействием эффекта \"Похищение жизни\"\.",
	drainlifeotherstart_trigger = "(.+) находится под воздействием эффекта \"Похищение жизни\"\.",
	drainlifeyouend_trigger = "Действие эффекта \"Похищение жизни\", наложенного на вас, заканчивается.\.",
	drainlifeotherend_trigger = "Действие эффекта \"Похищение жизни\", наложенного на (.+), заканчивается\.",
	pbv = "Ядовитый град",
	pbvafflicts_trigger = "находит(.+) под воздействием эффекта \"Ядовитый град\"",
	pbvhits_trigger = "\"Ядовитый град\" Верховная жрица Мар'ли наносит ",
	pbvresist_trigger = "сопротивляет(.+) заклинанию \"Ядовитый град\" Верховная жрица Мар'ли.",
	pbvimmune_trigger = "обладает(.+) невосприимчивостью к заклинанию \"Ядовитый град\" Верховная жрица Мар'ли.",
	you = "вы",
	drainlife = "Похищение жизни",
	spiders_message = "Вызваны пауки!",
	drainlife_message = "Похищение жизни! Прерви/рассей его!",
	trollphase = "Тролль фаза",
	trollphase_trigger = "Верховная жрица Мар'ли применяет заклинание \"Визуальный эффект превращения\"", --Мое племя победит! --на light's hope она не кричит ничего при превращении обратно...
	--//или получает эффект
	spiderphase = "Фаза паука",
	spiderphase_trigger1 = "Draw me to your web mistress Shadra", --не используется на light's hope
	spiderphase_trigger2 = "Shadra, make of me your avatar", --Шадра, сделай меня своей аватарой! --не русифицированы на light's hope

	spider_name = "Оповещение о пауках",
	spider_desc = "Предупреждает когда пауки вызваны",

	volley_name = "Оповещение об Ядовитом граде",
	volley_desc = "Предупреждает о Ядовитом граде\n\n(есть ошибка в таймере)",

	drain_name = "Оповещение о Похищение жизни",
	drain_desc = "Предупреждает о Похищении жизни",

	phase_name = "Сообщение о фазах",
	phase_desc = "Объявляет о смене фазы босса",
} end )

L:RegisterTranslations("esES", function() return {
	spawn_name = "Engendro de Mar'li",

	--cmd = "Marli",

	spiders_trigger = "Aid me my brood!",
	drainlifeyoustart_trigger = "Sufres de Drenar vida\.",
	drainlifeotherstart_trigger = "(.+) sufre de Drenar vida\.",
	drainlifeyouend_trigger = "Drenar vida acaba de disiparse\.",
	drainlifeotherend_trigger = "Drenar vida desaparece de (.+)\.",
	pbv = "Lluvia de descarga de veneno",
	pbvafflicts_trigger = "afligido por Lluvia de descarga de veneno",
	pbvhits_trigger = "Lluvia de descarga de veneno de Suma sacerdotisa Mar'li golpea",
	pbvresist_trigger = "Resistido (.+) Lluvia de descarga de veneno de Suma sacerdotisa Mar'li",
	pbvimmune_trigger = "Lluvia de descarga de veneno de Suma sacerdotisa Mar'li falla(.+) inmune",
	you = "tu",
	drainlife = "Drenar vida",
	spiders_message = "¡Aparecen las arañas!",
	drainlife_message = "¡Drenar vida! Interrúmpelo/disípalo!",
	trollphase = "Fase de Trol",
	trollphase_trigger = "The brood shall not fall",
	spiderphase = "Fase de Araña",
	spiderphase_trigger1 = "Draw me to your web mistress Shadra",
	spiderphase_trigger2 = "Shadra, make of me your avatar",

	--spider_cmd = "spider",
	spider_name = "Alerta de Araña",
	spider_desc = "Avisa cuando aparenzcan las arañas",

	--volley_cmd = "volley",
	volley_name = "Alerta de Lluvia de descarga de veneno",
	volley_desc = "Avisa para Lluvia de descarga de veneno\n\n(Descargo de responsabilidad: la barra tiene un error de \194\1772 segundos)",

	--drain_cmd = "drain",
	drain_name = "Alerta de Drenar vida",
	drain_desc = "Avisa para Drenar vida",

	--phase_cmd = "phase",
	phase_name = "Alerta de Fase",
	phase_desc = "Anuncia los cambios de fase del jefe",
} end )

L:RegisterTranslations("deDE", function() return {
	spawn_name = "Spawn of Mar'li",

	--cmd = "Marli",

	spiders_trigger = "Aid me my brood!",
	drainlifeyoustart_trigger = "Ihr seid von Blutsauger betroffen\.",
	drainlifeotherstart_trigger = "(.+) ist von Blutsauger betroffen\.",
	drainlifeyouend_trigger = "\'Blutsauger\' schwindet von Euch\.",
	drainlifeotherend_trigger = "Blutsauger schwindet von (.+)\.",
	pbv = "Giftblitzsalve",
	pbvafflicts_trigger = "von Giftblitzsalve betroffen",
	pbvhits_trigger = "Giftblitzsalve(.+) Naturschaden\.",
	pbvresist_trigger = "Giftblitzsalve(.+) widerstanden",
	pbvimmune_trigger = "Giftblitzsalve(.+) immun",
	you = "Euch",
	drainlife = "Blutsauger",
	spiders_message = "Spinnen erscheinen!",
	drainlife_message = "Blutsauger! Unterbreche sie/entferne magie!",
	trollphase = "Troll-Phase",
	trollphase_trigger = "The brood shall not fall",
	spiderphase = "Spinnen-Phase",
	spiderphase_trigger1 = "Draw me to your web mistress Shadra",
	spiderphase_trigger2 = "Shadra, make of me your avatar",

	--spider_cmd = "spider",
	spider_name = "Alarm f\195\188r Spinnen",
	spider_desc = "Warnung wenn Spinnen erscheinen",

	--volley_cmd = "volley",
	volley_name = "Alarm f\195\188r Giftblitzsalve",
	volley_desc = "Warnen vor Giftblitzsalve\n\n(Dementi: Dieser Balken hat eine \194\1772 Sekunden Fehler)",

	--drain_cmd = "drain",
	drain_name = "Alarm f\195\188r Blutsauger",
	drain_desc = "Warnen vor Blutsauger",

	--phase_cmd = "phase",
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.wipemobs = { L["spawn_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"phase", "spider", "drain", "volley", "bosskill"}


-- locals
local timer = {
	charge = 10,
	teleport = 30,
}
local icon = {
	charge = "Spell_Frost_FrostShock",
	teleport = "Spell_Arcane_Blink",
}
local syncName = {
	drain = "MarliDrainStart"..module.revision,
	drainOver = "MarliDrainEnd"..module.revision,
	trollPhase = "MarliTrollPhase"..module.revision,
	spiderPhase = "MarliSpiderPhase"..module.revision,
	spiders = "MarliSpiders"..module.revision,
	volley = "MarliVolley"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")

	self:ThrottleSync(5, syncName.drain)
	self:ThrottleSync(5, syncName.drainOver)
	self:ThrottleSync(5, syncName.trollPhase)
	self:ThrottleSync(5, syncName.spiderPhase)
	self:ThrottleSync(5, syncName.spiders)
	self:ThrottleSync(11, syncName.volley)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
end

-- called after boss is engaged
function module:OnEngage()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["spiders_trigger"]) then
		self:Sync(syncName.spiders)
	elseif string.find(msg, L["trollphase_trigger"]) then
		self:Sync(syncName.trollPhase)
	elseif string.find(msg, L["spiderphase_trigger1"]) or string.find(msg, L["spiderphase_trigger2"]) then
		self:Sync(syncName.spiderPhase)
	end
end

function module:Event(msg)
	local _,_,drainlifeotherstart,_ = string.find(msg, L["drainlifeotherstart_trigger"])
	local _,_,drainlifeotherend,_ = string.find(msg, L["drainlifeotherend_trigger"])
	if string.find(msg, L["pbvafflicts_trigger"]) or string.find(msg, L["pbvhits_trigger"]) or msg == L["pbvresist_trigger"] or msg == L["pbvimmune_trigger"] then
		self:Sync(syncName.volley)
	elseif string.find(msg, L["drainlife"]) then
		if msg == L["drainlifeyoustart_trigger"] then
			self:Sync(syncName.drain)
		elseif msg == L["drainlifeyouend_trigger"] then
			self:Sync(syncName.drainOver)
		elseif drainlifeotherstart and (UnitIsInRaidByName(drainlifeotherstart) or UnitIsPetByName(drainlifeotherstart)) then
			self:Sync(syncName.drain)
		elseif drainlifeotherend and drainlifeotherend ~= L["you"] and (UnitIsInRaidByName(drainlifeotherstart) or UnitIsPetByName(drainlifeotherstart)) then
			self:Sync(syncName.drainOver)
		end
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.spiders and self.db.profile.spider then
		self:Message(L["spiders_message"], "Attention")
	elseif sync == syncName.trollPhase and self.db.profile.phase then
		self:Message(L["trollphase"], "Attention")
	elseif sync == syncName.spiderPhase then
		if self.db.profile.phase then
			self:Message(L["spiderphase"], "Attention")
		end
		if self.db.profile.drain then
			self:RemoveBar(L["drainlife"])
		end
		if self.db.profile.volley then
			self:RemoveBar(L["pbv"])
		end
	elseif sync == syncName.volley and self.db.profile.volley then
		self:Bar(L["pbv"], 13, "Spell_Nature_CorrosiveBreath")
	elseif sync == syncName.drain and self.db.profile.drain then
		self:Bar(L["drainlife"], 7, "Spell_Shadow_LifeDrain02")
		self:Message(L["drainlife_message"], "Attention")
	elseif sync == syncName.drainOver and self.db.profile.drain then
		self:RemoveBar(L["drainlife"])
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

