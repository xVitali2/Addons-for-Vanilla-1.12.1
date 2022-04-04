 
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Jin'do the Hexxer", "Zul'Gurub")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	engage_trigger      = "Welcome to da great show friends",
	triggerbrainwash = "Jin'do the Hexxer casts Summon Brain Wash Totem.",
	triggerhealing = "Jin'do the Hexxer casts Powerful Healing Ward.",
	curseself_trigger = "You are afflicted by Delusions of Jin'do.",
	curseother_trigger = "(.+) is afflicted by Delusions of Jin'do.",
	hexself_trigger = "You are afflicted by Hex.",
	hexother_trigger = "(.+) is afflicted by Hex.",
	hexselfend_trigger = "Hex fades from you.",
	hexotherend_trigger = "Hex fades from (.+).",
	warnbrainwash = "Brain Wash Totem!",
	warnhealing = "Healing Totem!",
	jindo_death = "Jin'do the Hexxer dies.",
	brainwash_death = "Brain Wash Totem dies.",
	healing_death = "Powerful Healing Ward dies.",
	brainwash_bar = "Brain Wash Totem",
	healing_bar = "Powerful Healing Ward",
	brainwash_next_bar = "Next Brain Wash Totem",
	healing_next_bar = "Next Powerful Healing Ward",
	hex_bar = "Hex: %s",
	cursewarn_message = "You are cursed! Kill the Shades!",
	cursewarn_warning = "%s is cursed!",
	hexwarn_warning = "%s has Hex! Dispel it!",

	cmd = "Jindo",

	brainwash_cmd = "brainwash",
	brainwash_name = "Brain Wash Totem Alert",
	brainwash_desc = "Warn when Jin'do summons Brain Wash Totems.",

	healingward_cmd = "healingward",
	healingward_name = "Healing Totem Alert",
	healingward_desc = "Warn when Jin'do summons Powerful Healing Wards.",

	curse_cmd = "curse",
	curse_name = "Curse Alert",
	curse_desc = "Warn when players get Delusions of Jin'do.",

	hex_cmd = "hex",
	hex_name = "Hex Alert",
	hex_desc = "Warn when players get Hex.",

	puticon_cmd = "puticon",
	puticon_name = "Raid icon on cursed players",
	puticon_desc = "Place a raid icon on the player with Delusions of Jin'do.\n\n(Requires assistant or higher)",
} end )

L:RegisterTranslations("ruRU", function() return {--by CFM
	engage_trigger = "Welcome to da great show friends", --Добро пожаловать на наше представление, друзья! --не русифицированы на light's hope
	triggerbrainwash = "Мастер проклятий Джин'до применяет заклинание \"Вызов зомбирующего тотема\".",
	triggerhealing = "Мастер проклятий Джин'до применяет заклинание \"Могущественный исцеляющий идол\".",
	curseself_trigger = "Вы находитесь под воздействием эффекта \"Иллюзии Джин'до\".",
	curseother_trigger = "(.+) находится под воздействием эффекта \"Иллюзии Джин'до\".",
	hexself_trigger = "Вы находитесь под воздействием эффекта \"Сглаз\".",
	hexother_trigger = "(.+) находится под воздействием эффекта \"Сглаз\".",
	hexselfend_trigger = "Действие эффекта \"Сглаз\", наложенного на вас, заканчивается.",
	hexotherend_trigger = "Действие эффекта \"Сглаз\", наложенного на (.+), заканчивается.",
	warnbrainwash = "Зомбирующий тотем!",
	warnhealing = "Могущественный исцеляющий идол!",
	jindo_death = "Мастер проклятий Джин'до погибает.",
	brainwash_death = "Зомбирующий тотем погибает.",
	healing_death = "Могущественный исцеляющий идол погибает.",
	brainwash_bar = "Зомбирующий тотем",
	healing_bar = "Могущественный исцеляющий идол",
	brainwash_next_bar = "Следующий Зомбирующий тотем",
	healing_next_bar = "Следующий Могущественный исцеляющий идол",
	hex_bar = "Сглаз: %s",
	cursewarn_message = "Вы прокляты! Убейте Тени!",
	cursewarn_warning = "%s проклят!",
	hexwarn_warning = "%s в Сглазе! Рассейте его!",

	brainwash_name = "Оповещение о Зомбирующем тотеме",
	brainwash_desc = "Предупреждать когда Джин'до вызывает Зомбирующие тотемы.",

	healingward_name = "Оповещение о Могущественном исцеляющем идоле",
	healingward_desc = "Предупреждать когда Джин'до вызывает Могущественный исцеляющий идол.",

	curse_name = "Оповещение о Проклятии",
	curse_desc = "Предупреждать когда игроки получают Иллюзию Джин'до.",

	hex_name = "Оповещение о Сглазе",
	hex_desc = "Предупреждать когда игроки получают Сглаз.",

	puticon_name = "Значки рейда на проклятых игроках",
	puticon_desc = "Устанавливать значок рейда на игрока с Иллюзией Джин'до.\n\n(Требуется помощник или лидер)",
} end )

L:RegisterTranslations("esES", function() return {
	engage_trigger      = "Welcome to da great show friends",
	triggerbrainwash = "Jin'do el Aojador lanza Invocar Tótem Lavado de cerebro.",
	triggerhealing = "Jin'do el Aojador lanza Guarda de sanación potente.",
	curseself_trigger = "Sufres de Ilusiones de Jin'do.",
	curseother_trigger = "(.+) sufre de Ilusiones de Jin'do.",
	hexself_trigger = "Sufres de Maleficio.",
	hexother_trigger = "(.+) sufre de Maleficio.",
	hexselfend_trigger = "Maleficio acaba de disiparse.",
	hexotherend_trigger = "Maleficio desaparece de (.+).",
	warnbrainwash = "¡Invocar Tótem Lavado de cerebro!",
	warnhealing = "¡Guarda de sanación potente!",
	jindo_death = "Jin'do el Aojador muere.",
	brainwash_death = "Tótem Lavado de cerebro muere.",
	healing_death = "Guarda de sanación potente muere.",
	brainwash_bar = "Tótem Lavado de cerebro",
	healing_bar = "Guarda de sanación potente",
	brainwash_next_bar = "Próximo Tótem Lavado de cerebro",
	healing_next_bar = "Próxima Guarda de sanación potente",
	hex_bar = "Maleficio: %s",
	cursewarn_message = "¡Estás maldito! Mata los Delusiones!",
	cursewarn_warning = "¡%s está maldito!",
	hexwarn_warning = "¡%s está en Maleficio! Disípalo!",

	--cmd = "Jindo",

	--brainwash_cmd = "brainwash",
	brainwash_name = "Alerta de Tótem Lavado de cerebro",
	brainwash_desc = "Avisa cuando Jin'do invoque Tótem Lavado de cerebro.",

	--healingward_cmd = "healingward",
	healingward_name = "Alerta de Guarda de sanación potente",
	healingward_desc = "Avisa cuando Jin'do invoque Guarda de sanación potente.",

	--curse_cmd = "curse",
	curse_name = "Alerta de Ilusiones de Jin'do",
	curse_desc = "Avisa cuando jugadores tengan Ilusiones de Jin'do.",

	--hex_cmd = "hex",
	hex_name = "Alerta de Maleficio",
	hex_desc = "Avisa cuando un jugador tenga Maleficio.",

	--puticon_cmd = "puticon",
	puticon_name = "Marcar a los jugadores con Ilusiones de Jin'do",
	puticon_desc = "Marca con un icono el jugador con Ilusiones de Jin'do.\n\n(Require asistente o líder)",
} end )

L:RegisterTranslations("deDE", function() return {
	engage_trigger      = "Welcome to da great show friends",
	triggerbrainwash = "von Gehirnw\195\164sche betroffen", -- Jin'do the Hexxer casts Summon Brain Wash Totem. stupid workaround
	triggerhealing = "Jin'do the Hexxer wirkt M\195\164chtiger Heilungszauberschutz.", -- NOTHING to detect this totem spawn in combatlog. Not even mana usage from the boss.
	curseself_trigger = "Ihr seid von Irrbilder von Jin'do betroffen.",
	curseother_trigger = "(.+) ist von Irrbilder von Jin'do betroffen.",
	hexself_trigger = "Ihr seid von Verhexung betroffen.",
	hexother_trigger = "(.+) ist von Verhexung betroffen.",
	hexselfend_trigger = "'Verhexung' schwindet von Euch.",
	hexotherend_trigger = "Verhexung schwindet von (.+).",
	warnbrainwash = "Gehirnw\195\164schetotem!",
	warnhealing = "M\195\164chtiger Heilungszauberschutz!",
	jindo_death = "Jin'do the Hexxer stirbt.",
	brainwash_death = "Brain Wash Totem stirbt.",
	healing_death = "Powerful Healing Ward stirbt.",
	brainwash_bar = "Gehirnw\195\164schetotem",
	healing_bar = "M\195\164chtiger Heilungszauberschutz",
	brainwash_next_bar = "Nächstes Gehirnw\195\164schetotem",
	healing_next_bar = "Nächster M\195\164chtiger Heilungszauberschutz",
	hex_bar = "Verhexung: %s",
	cursewarn_message = "Du bist verflucht! T\195\182te die Schemengestalten!",
	cursewarn_warning = "%s ist verflucht!",
	hexwarn_warning = "%s ist verhext! Entfernt es!",

	cmd = "Jindo",

	brainwash_cmd = "brainwash",
	brainwash_name = "Alarm f\195\188r Gehirnw\195\164schetotem",
	brainwash_desc = "Warnung, wenn Jin'do Gehirnw\195\164schetotem beschw\195\182rt.",

	healingward_cmd = "healingward",
	healingward_name = "Alarm f\195\188r Heiltotem",
	healingward_desc = "Warnung, wenn Jin'do Heiltotem beschw\195\182rt.",

	curse_cmd = "curse",
	curse_name = "Alarm f\195\188r Fluch",
	curse_desc = "Warnung, wenn Spieler Irrbilder von Jin'do bekommen.",

	hex_cmd = "hex",
	hex_name = "Alarm f\195\188r Verhexung",
	hex_desc = "Warnung, wenn Spieler Verhexung bekommen.",

	puticon_cmd = "puticon",
	puticon_name = "Schlachtzugsymbol auf die Spieler",
	puticon_desc = "Versetzt eine Schlachtzugsymbol auf der Spieler, der verflucht ist.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20005 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"curse", "hex", "brainwash", "healingward", "puticon", "bosskill"}


-- locals
local timer = {
	firstHex = 8,
	firstHealing = 12,
	firstBrainwash = 22,
	healing = 18, -- varies from 16.9 to 18.6
	brainwash = 18, -- varies from 22.9 to 26.8
	healingUptime = 240,
	brainwashUptime = 240,
	hex = 5,
}
local icon = {
	hex = "Spell_Nature_Polymorph",
	healing = "Spell_Holy_LayOnHands",
	brainwash = "Spell_Totem_WardOfDraining",
}
local syncName = {
	curse = "JindoCurse"..module.revision,
	hex = "JindoHexStart"..module.revision,
	hexOver = "JindoHexStop"..module.revision,
}

local berserkannounced = nil


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["engage_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "FadeFrom")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "FadeFrom")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", "Event")

	self:ThrottleSync(5, syncName.curse)
	self:ThrottleSync(4, syncName.hex)
	self:ThrottleSync(4, syncName.hexOver)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH") -- override
end

-- called after boss is engaged
function module:OnEngage()
	self:Bar("Next Hex", timer.firstHex, icon.hex)
	--self:Bar("Next Healing Ward", timer.firstHealing, icon.healing)
	--self:Bar("Next Brain Wash", timer.firstBrainwash, icon.brainwash)
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Events              --
------------------------------


function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self) -- don't forget this, we are overriding the default functionality

	if msg == L["brainwash_death"] then
		self:RemoveBar(L["brainwash_bar"])
	elseif msg == L["healing_death"] then
		self:RemoveBar(L["healing_bar"])
		--[[elseif msg == L["jindo_death"] then
		if self.db.profile.bosskill then self:Message(string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], self:ToString()), "Bosskill", nil, "Victory") end
		self:TriggerEvent("BigWigs_RemoveRaidIcon")
		self.core:ToggleModuleActive(self, false)]]
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if self.db.profile.brainwash and string.find(msg, L["triggerbrainwash"]) then
		self:Message(L["warnbrainwash"], "Attention", true, "Alarm")
		--self:Bar(L["brainwash_bar"], timer.brainwashUptime, icon.brainwash, true, "Black")
		--self:Bar(L["brainwash_next_bar"], timer.brainwash, icon.brainwash)
	elseif self.db.profile.healingward and msg == L["triggerhealing"] then
		self:Message(L["warnhealing"], "Attention", true, "Alarm")
		--self:Bar(L["healing_bar"], timer.healingUptime, icon.healing, true, "Yellow")
		--self:Bar(L["healing_next_bar"], timer.healing, icon.healing)
	end
end

function module:Event(msg)
	local _, _, curseother_name = string.find(msg, L["curseother_trigger"])
	local _, _, hexother_name= string.find(msg, L["hexother_trigger"])
	if curseother_name then
		self:Sync(syncName.curse .. " "..curseother_name)
	elseif hexother_name then
		self:Sync(syncName.hex .. " "..hexother_name)
	elseif msg == L["curseself_trigger"] then
		self:Sync(syncName.curse .. " "..UnitName("player"))
	elseif msg == L["hexself_trigger"] then
		self:Sync(syncName.hex .. " "..UnitName("player"))
		--[[elseif self.db.profile.brainwash and string.find(msg, L["triggerbrainwash"]) then
		self:Message(L["warnbrainwash"], "Attention", true, "Alarm")
		self:Bar(L["brainwash_bar"], timer.brainwashUptime, icon.brainwash, true, "Black")]]
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if msg == L["hexselfend_trigger"] then
		self:Sync(syncName.hexOver .. " "..UnitName("player"))
	end
end

function module:FadeFrom(msg)
	local _, _, hexotherend_name = string.find(msg, L["hexotherend_trigger"])
	if hexotherend_name then
		self:Sync(syncName.hexOver .. " "..hexotherend_name)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if not self.started and sync == "BossEngaged" and rest == self.bossSync then

	elseif sync == syncName.curse then
		if self.db.profile.curse then
			if rest == UnitName("player") then
				self:Message(L["cursewarn_message"], "Attention")
			else
				self:Message(string.format(L["cursewarn_warning"], rest), "Urgent")
				self:TriggerEvent("BigWigs_SendTell", rest, L["cursewarn_message"])
			end
		end
		if self.db.profile.puticon then
			self:Icon(rest)
		end
	elseif sync == syncName.hex and self.db.profile.hex then
		self:RemoveBar("Next Hex")
		self:Message(string.format(L["hexwarn_warning"], rest), "Important")
		self:Bar(string.format(L["hex_bar"], rest), timer.hex, icon.hex, true, "White")
	elseif sync == syncName.hexOver and self.db.profile.hex then
		self:RemoveBar(string.format(L["hex_bar"], rest))
	end
end
