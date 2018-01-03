--[[
	Version : Russian ( by Maus )

--]]

if ( GetLocale() == "ruRU" ) then

-- CombatMessageAmbigousfix by No-Nonsense, improved by Sentinel
local COMBAT_MESSAGES = {
	-- Combat Messages.
	"SPELLLOGCRITOTHEROTHER",
	"SPELLLOGOTHEROTHER",
	"SPELLLOGCRITSCHOOLOTHERSELF",
	"SPELLLOGCRITSCHOOLOTHEROTHER",
	"SPELLLOGSCHOOLOTHERSELF",
	"SPELLLOGSCHOOLOTHEROTHER",
	"SPELLSPLITDAMAGEOTHEROTHER",
	"SPELLSPLITDAMAGEOTHERSELF",
	"SPELLRESISTOTHEROTHER",

	-- Heal Messages.
	"PERIODICAURAHEALOTHEROTHER",
	"HEALEDCRITOTHEROTHER",
	"HEALEDCRITOTHERSELF",
	"HEALEDOTHEROTHER"
};

-- Apply modifications.
for _, cmsg in COMBAT_MESSAGES do
	local fixcode = cmsg .. '= string.gsub(string.gsub(' .. cmsg .. ', "(%%%d%$s)s ", "%1\'s "), "%%ss ", "%%s\'s ")';
	RunScript(fixcode);
end

-- Free Memory.
local COMBAT_MESSAGES = nil;

-- General --
DamageMeters_PRINTCOLOR = "|cFF8F8FFF"

-- Bindings --
BINDING_HEADER_DAMAGEMETERSHEADER 		= "DamageMeters";
BINDING_NAME_DAMAGEMETERS_TOGGLESHOW	= "Показать / скрыть окно";
BINDING_NAME_DAMAGEMETERS_CYCLEQUANT	= "Изменить окно отчета";
BINDING_NAME_DAMAGEMETERS_CYCLEQUANTBACK= "Обратное изменение окна отчета";
BINDING_NAME_DAMAGEMETERS_CLEAR			= "Очистка данных";
BINDING_NAME_DAMAGEMETERS_TOGGLEPAUSED	= "Вкл/Выкл паузу";
BINDING_NAME_DAMAGEMETERS_SHOWREPORTFRAME = "Отображать окно отчета";
BINDING_NAME_DAMAGEMETERS_SWAPMEMORY	= "Замена памяти";
BINDING_NAME_DAMAGEMETERS_TOGGLESHOWMAX	= "Вкл/Выкл отображение макс. кол.во строк";
BINDING_NAME_DAMAGEMETERS_SYNCREADY		= "Отправка готовой синхр.";
BINDING_NAME_DAMAGEMETERS_TOGGLESHOWFIGHTASPS = "Вкл/Выкл отображение данных боя \"в сек.\"";
BINDING_NAME_DAMAGEMETERS_TOGGLENORMALANDFIGHT = "Вкл/Выкл данных \"боя\"";
BINDING_NAME_DAMAGEMETERS_TOGGLEMINIMODE = "Вкл/Выкл мини-режима";
BINDING_NAME_DAMAGEMETERS_SYNCPAUSE = "Пауза синхр.";
BINDING_NAME_DAMAGEMETERS_SYNCUNPAUSE = "Возобновление синхр.";
BINDING_NAME_DAMAGEMETERS_SYNCCLEAR = "Очистка синхр.";

--[[ work in progress
-- command, function, help string
DM_HELPDEF = {
	-- Main commands.
	{ "help", DamageMeters_Help, DM_CMD_HELP },
	{ "cmd", DamageMeters_ListCommands, DM_CMD_CMD },
	{ "version", DamageMeters_ShowVersion, DM_CMD_VERSION },
	{ "show", DamageMeters_ToggleShow, DM_CMD_SHOW },
	{ "hide", DamageMeters_Hide, DM_CMD_HIDE },
	{ "clear", DamageMeters_Clear, DM_CMD_CLEAR },
	{ "report", DamageMeters_Report, DM_CMD_REPORT },
	{ "sort", DamageMeters_SetSort, DM_CMD_SORT },
	{ "count", DamageMeters_SetCount, DM_CMD_SETCOUNT },
	{ "autocount", DamageMeters_SetAutoCount, DM_CMD_AUTOCOUNT },
	{ "lock", DamageMeters_ToggleLock, DM_CMD_LOCK },
	{ "pause", DamageMeters_TogglePause, DM_CMD_PAUSE },
	{ "ready", DamageMeters_SetReady, DM_CMD_READY },
	{ "resetpos", DamageMeters_ResetPos, DM_CMD_RESETPOS },
	{ "pop", DamageMeters_Populate, DM_CMD_POP },
	{ "listbanned", DamageMeters_ListBanned, DM_CMD_LISTBANNED },
	{ "clearbanned", DamageMeters_ClearBanned, DM_CMD_CLEARBANNED },

	-- Memory
	{ "save", DamageMeters_Save, DM_CMD_SAVE },
	{ "restore", DamageMeters_Restore, DM_CMD_RESTORE },
	{ "swap", DamageMeters_Swap, DM_CMD_SWAP },
	{ "memclear", DamageMeters_MemClear, DM_CMD_MEMCLEAR },

	-- These all have menu options.
	{ "color", DamageMeters_SetColorScheme, DM_CMD_COLOR },
	{ "quant", DamageMeters_SetQuantity, DM_CMD_QUANT },
	{ "text", DamageMeters_SetTextOptions, DM_CMD_TEXT },
	{ "visinparty", DamageMeters_SetVisibleInParty, DM_CMD_VISINPARTY },
	{ "lockpos", DamageMeters_ToggleLockPos, DM_CMD_LOCKPAUSE },
	{ "grouponly", DamageMeters_ToggleGroupMembersOnly, DM_CMD_GROUPONLY },
	{ "addpettoplayer", DamageMeters_ToggleAddPetToPlayer, DM_CMD_ADDPETTOPLAYER },
	{ "resetoncombat", DamageMeters_ToggleResetWhenCombatStarts, DM_CMD_RESETONCOMBAT },
	{ "total", DamageMeters_ToggleTotal, DM_CMD_TOTAL },
	{ "showmax", DamageMeters_ToggleMaxBars, DM_CMD_SHOWMAX },

	-- Sync commands.
	{ "sync", DamageMeters_Sync, DM_CMD_SYNC },
	{ "syncchan", DamageMeters_SyncChan, DM_CMD_SYNCCHAN },
	{ "syncleave", DamageMeters_SyncLeaveChanCmd, DM_CMD_SYNCLEAVE },
	{ "syncsend", DamageMeters_SyncReport, DM_CMD_SYNCSEND },
	{ "syncrequest", DamageMeters_SyncRequest, DM_CMD_SYNCREQUEST },
	{ "syncclear", DamageMeters_SyncClear, DM_CMD_SYNCCLEAR },
	{ "syncmsg", DamageMeters_SendSyncMsg, DM_CMD_SYNCMSG },
	{ "syncbroadcastchan", DamageMeters_SyncBroadcastChan, DM_CMD_SYNCBROADCASTCHAN },
	{ "syncping", DamageMeters_SyncPingRequest, DM_CMD_SYNCPING },
	{ "syncpause", DamageMeters_SyncPause, DM_CMD_SYNCPAUSE },
	{ "syncunpause", DamageMeters_SyncUnpause, DM_CMD_SYNCUNPAUSE },
	{ "syncready", DamageMeters_SyncReady, DM_CMD_SYNCREADY },
	{ "synckick", DamageMeters_SyncKick, DM_CMD_SYNCKICK },
	{ "synclabel", DamageMeters_SyncLabel, DM_CMD_SYNCLABEL },
	{ "syncstart", DamageMeters_SyncStart, DM_CMD_SYNCSTART },
	{ "synchalt", DamageMeters_SyncHalt, DM_CMD_SYNCHALT },
	{ "synce", DamageMeters_SyncEmote, DM_CMD_SYNCEMOTE },

	-- Debug commands.
	{ "reset", DamageMeters_Reset, DM_CMD_RESET },
	{ "test", DamageMeters_Test, DM_CMD_TEST },
	{ "add", DamageMeters_Add, DM_CMD_ADD },
	{ "dumptable", DamageMeters_DumpTable, DM_CMD_DUMPTABLE },
	{ "debug", DM_ToggleDMPrintD, DM_CMD_DEBUG },
	{ "dumpmsg", DM_DumpMsg, DM_CMD_DUMPMSG },
	{ "print", DM_ConsolePrint, DM_CMD_PRINT },
};
]]--

-- Help --
DamageMeters_helpTable = {
		"Следующие команды могут быть введены в консоли:",
		"/dm help : Помощь по использованию DamageMeters.",
		"/dm cmd : Список достпных команд /dm (DamageMeters).",
		"/dm show : Отображать DamageMeters. Обратите внимание, что сбор данных продолжается и в скрытом режиме.",
		"/dm hide : Скрыть DamageMeters.",
		"/dm clear [#] : Удалить запись по списку, начиная снизу. Если не указан # (номер), то очищается весь список.",
		"/dm report [help] [total] [c/s/p/r/w/h/g/f[#]] [whispertarget/channelNAME] - отправить отчет о текущих данных, используйте '/dm report help' для справки.",
		"/dm sort [#] - Установить стиль сортировки. Укажите номер, чтобы получить список доступных стилей.",
		"/dm count [#] - Установка количества отображаемых баров. Если не указан #, то отображаться максимально возможное количество.",
		"/dm save - Сохранение текущей таблицы.",
		"/dm restore - Восстанавливает ранее сохраненную таблицу, перезаписав текущие данные.",
		--"/dm merge - Объединяет ранее сохраненную таблицу с любыми существующими данными.",
		"/dm swap - Заменяет местами ранее сохраненную таблицу с текущей.",
		"/dm memclear - Очищает сохраненную таблицу.",
		"/dm resetpos - Сброс положения окна.",
		"/dm text 0/<[r][n][p][l][v]> - установить отображаемый текст, который должен отображаться на барах. r - ранг, n - имя игрока, p - процент от общего числа. l - процент лидера. v - значение.",
		"/dm color # - Установить цветовую схему для баров. Укажите # для получения списка опций.",
		"/dm quant # - Устанавливает количество используемых баров. Укажите # для получения списка опций.",
		"/dm visinparty [y/n] - Установить отображение окна когда вы находитесь в группе/рейде.",
		"/dm autocount # - Если # больше нуля, отобразит список таблиц с информацией до #. Если # равно нулю, включается функция автоматического подсчета.",
		"/dm listbanned - Список всех запретов",
		"/dm clearbanned - Очистить список запретов.",

		"/dm sync [d#] [e] - Синхронизировать ваши данные, с данными других пользователей, используй тот же канал синхр.",
		--"/dm syncchan - Установка названия канала, чтобы использовать синхронизацию.",
		--"/dm syncleave - Покинуть текущий канал синхронизации.",
		"/dm syncsend - Отправляет информацию по каналу синхронизации.",
		"/dm syncrequest - Отправляет запрос для автоматизации dmсинхр. другим игрокам, используя свой канал синхр.",
		"/dm syncclear - Отправить запрос другим игрокам, чтобы очистить их данные.",
		"/dm syncmsg msg - Отправить сообщение другим игрокам по тому же каналу синхр. Можно так же использовать /dm m.",
		--"/dm syncbroadcastchan - Передать текущий канал синхр. для вашей группы или рейда. Можно так же использовать /dm syncb.",
		"/dm syncping - 'Пинг' проверка связи с игроками, которые используют другую версию DM.",
		"/dm syncpause - Пауза в синхр. другого DM.",
		"/dm syncunpause - Восстановление синхр. другого DM.",
		"/dm syncready - Отправить команду синхр., для проверки готовности.",
		--"/dm synckick player - Исключить игрока с канала синхронизации.",
		"/dm synclabel label - Получение текущего сеанса (индекс по умолчанию 1).",
		"/dm syncstart label - Функция которая делает dmsynclabel, dmsyncpause и dmsyncclear автоматическими.",
		"/dm synchalt - Прерывает любую синхр.",

		"/dm pop - Заполнение всех текущих членов группы/рейда.",
		"/dm lock - Включить или заблокировать список. Новые игроки не могут быть добавлены к заблокированному списку, но ранее добавленные, будут обновляться.",
		"/dm pause - Включает или приостанавливает сбор информации.",
		"/dm lockpos - Включает или блокирует положение окна.",
		"/dm grouponly - Включает или отключает блокировку сбора информации от людей, которые не находятся в вашей группе/рейде.",
		"/dm addpettoplayer - Включает или отключает сбор информации с питомца игрока.",
		"/dm resetoncombat = Включает или отключает сброс информации перед началом боя.",
		"/dm version - Отображает информации о текущей версии.",
		"/dm total - Включает или отключает отображение общего дисплея.",
		"/dm showmax - Включает или отключает показ максимального количества баров.",
};

-- Filters --
DamageMeters_Filter_STRING1 = "участники группы";
DamageMeters_Filter_STRING2 = "все дружественные персонажи";

-- Despelling --
DM_YOU_LOCALIZED = "Ihr";

-- Relationships --
DamageMeters_Relation_STRING = {
		"Вы",
		"Ваш питомец",
		"Группа",
		"Дружественный"};

-- Color Schemes --
DamageMeters_colorScheme_STRING = {
		"Отношение",
		"Окраска классов"};

-- Quantities --
DM_QUANTSTRING_DAMAGEDONE = "Нанесено урона";
DM_QUANTSTRING_HEALINGDONE = "Эффектив. исцеление";
DM_QUANTSTRING_DAMAGETAKEN = "Полученный урон";
DM_QUANTSTRING_HEALINGTAKEN = "Полученное исцеление";
DM_QUANTSTRING_DAMAGEDONE_FIGHT = "Нанесено урона за бой";
DM_QUANTSTRING_HEALINGDONE_FIGHT = "Эффектив. исцеление за бой";
DM_QUANTSTRING_DAMAGETAKEN_FIGHT = "Получено урона за бой";
DM_QUANTSTRING_HEALINGTAKEN_FIGHT = "Получено исцеления за бой";
DM_QUANTSTRING_DAMAGEDONE_PS = "УВС";
DM_QUANTSTRING_HEALINGDONE_PS = "ИВС";
DM_QUANTSTRING_DAMAGETAKEN_PS = "ПУВС";
DM_QUANTSTRING_HEALINGTAKEN_PS = "ПИВС";
DM_QUANTSTRING_IDLETIME = "Время бездействия";
DM_QUANTSTRING_NETDAMAGE = "Чистый урон";
DM_QUANTSTRING_NETHEALING = "Чистое исцеление";
DM_QUANTSTRING_DAMAGEPLUSHEALING = "Урон+Исцеление";
DM_QUANTSTRING_CURING = "Излечено";
DM_QUANTSTRING_CURING_FIGHT = "Исцеления за бой";
DM_QUANTSTRING_CURING_PS = "Исцеление ВС";
DM_QUANTSTRING_OVERHEAL = "Избыточное лечение";
DM_QUANTSTRING_OVERHEAL_FIGHT = "Избыточное лечение за бой";
DM_QUANTSTRING_OVERHEAL_PS = "ПРИВС";
DM_QUANTSTRING_HEALTH = "Здоровье";
DM_QUANTSTRING_OVERHEAL_PERCENTAGE = "Избыточное лечение %";
DM_QUANTSTRING_ABSHEAL = "Чистое исцеление";
DM_QUANTSTRING_ABSHEAL_FIGHT = "Чистое исцеление за бой";
DM_QUANTSTRING_ABSHEAL_PS = "Чистое. ИВС";

DMI_NAMES = {
	DM_QUANTSTRING_DAMAGEDONE,
	DM_QUANTSTRING_HEALINGDONE,
	DM_QUANTSTRING_DAMAGETAKEN,
	DM_QUANTSTRING_HEALINGTAKEN,
	DM_QUANTSTRING_CURING,
	DM_QUANTSTRING_OVERHEAL,
	DM_QUANTSTRING_ABSHEAL,
};

DM_QUANTABBREV_DAMAGEDONE = "У";
DM_QUANTABBREV_HEALINGDONE = "И";
DM_QUANTABBREV_DAMAGETAKEN = "ПУ";
DM_QUANTABBREV_HEALINGTAKEN = "ПИ";
DM_QUANTABBREV_CURING = "Исцел";
DM_QUANTABBREV_OVERHEAL = "ИЛ";
DM_QUANTABBREV_ABSHEAL = "ЧистоеЭИ";

DM_QUANTABBREV_DAMAGEDONE_PS = "УВС";
DM_QUANTABBREV_HEALINGDONE_PS = "ИВС";
DM_QUANTABBREV_DAMAGETAKEN_PS = "ПУВС";
DM_QUANTABBREV_HEALINGTAKEN_PS = "ПИВС";
DM_QUANTABBREV_CURING_PS = "ИзлечВС";
DM_QUANTABBREV_OVERHEAL_PS = "ЭИВС";
DM_QUANTABBREV_ABSHEAL_PS = "ЧистоеЭИВС";

DM_QUANTABBREV_IDLETIME = "ВП";
DM_QUANTABBREV_NETDAMAGE = "ЧистыйУ";
DM_QUANTABBREV_NETHEALING = "ЧистоеИ";
DM_QUANTABBREV_DAMAGEPLUSHEALING = "У+И";
DM_QUANTABBREV_HEALTH = "Здор";
DM_QUANTABBREV_OVERHEAL_PERCENTAGE = "ЭИ%";


-- Sort --
DamageMeters_Sort_STRING = {
    "По убыванию",
    "По возрастанию",
    "По алфовиту"};

DamageMeters_ClassConversion = {
			["Охотник"] = "HUNTER",
			["Чернокнижник"] = "WARLOCK",
			["Жрец"] = "PRIEST",
			["Паладин"] = "PALADIN",
			["Маг"] = "MAGE",
			["Разбойник"] = "ROGUE",
			["Друид"] = "DRUID",
			["Шаман"] = "SHAMAN",
			["Воин"] = "WARRIOR"
		};

function DamageMeters_GetClassColor(className)
  return RAID_CLASS_COLORS[DamageMeters_ClassConversion[string.upper(className)]];
end


-- This associates the string names of damage types (schools) with the DM_DMGTYPE constants.
DM_DMGNAMETOID = {
    ["тайная магия"]              = DM_DMGTYPE_ARCANE,
    ["магия огоня"]              = DM_DMGTYPE_FIRE,
    ["магия природы"]              = DM_DMGTYPE_NATURE,
    ["магия льда"]              = DM_DMGTYPE_FROST,
    ["магия тьмы"]           = DM_DMGTYPE_SHADOW,
    ["магия света"]             = DM_DMGTYPE_HOLY,
    ["физический"]  = DM_DMGTYPE_PHYSICAL,
};

DM_DMGTYPENAMES = {
    "Темной магии",
    "Магии огня",
    "Магии природы",
    "Магии льда",
    "Магии тьмы",
    "Магии света",
    "Физический",
    "По умолчанию",
};

-- Errors --
DM_ERROR_INVALIDARG = "DamageMeters: Неверный аргумент.";
DM_ERROR_MISSINGARG = "DamageMeters: Отсутствует аргумент.";
DM_ERROR_NOSAVEDTABLE = "DamageMeters: Нет сохранённой таблицы.";
DM_ERROR_BADREPORTTARGET = "DamageMeters: Неверная цель для отчёта = ";
DM_ERROR_MISSINGWHISPERTARGET = "DamageMeters: Игрок для ему сообщения по шепоту не найден.";
DM_ERROR_MISSINGCHANNEL = "DamageMeters: Не дан номер указанного канала.";
DM_ERROR_NOSYNCCHANNEL = "DamageMeters: Канал синхронизации должен быть указан с dmsyncchan, перед вызовом функции синхронизации.";
DM_ERROR_JOINSYNCCHANNEL = "DamageMeters: Вы должно присоединиться к каналу ('%s'), после чего вы сможете вызвать функцию синхронизации.";
DM_ERROR_SYNCTOOSOON = "DamageMeters: Слишком мало времени прошло после последней синхронизацией. Игнор.";
DM_ERROR_POPNOPARTY = "DamageMeters: Не возможно заполнить таблицу, вы не состоите в группе или рейде.";
DM_ERROR_NOROOMFORPLAYER = "DamageMeters: Не возможно объединить питомцев с данными игрока, потому что не возможно добавить игрока (список заполнен?).";
DM_ERROR_BROADCASTNOGROUP = "DamageMeters: Вы должны быть находиться в группе или рейде для передачи канала синхронизации.";
DM_ERROR_NOPARTY = "DamageMeters: Вы не состоите в группе.";
DM_ERROR_NORAID = "DamageMeters: Вы не состоите в рейде.";

-- Messages --
DM_MSG_SETQUANT = "DamageMeters: Установка кол. во видимости для ";
DM_MSG_CURRENTQUANT = "DamageMeters: Текущее кол.во. = ";
DM_MSG_CURRENTSORT = "DamageMeters: Текущая сортировка = ";
DM_MSG_SORT = "DamageMeters: Настройки сортировки ";
DM_MSG_CLEAR = "DamageMeters: Удаление записей %d до %d.";
--DM_MSG_REMAINING = "DamageMeters: %d остальные предметы.";
DM_MSG_REPORTHEADER = "DamageMeters: Отчёт <%s> - %d/%d источников:";
DM_MSG_PLAYERREPORTHEADER = "DamageMeters: Отчёт игрока %s:";
DM_MSG_SETCOUNTTOMAX = "DamageMeters: Не указанно кол.во аргументов, установленно максимальное значение.";
DM_MSG_SETCOUNT = "DamageMeters: Новое число полос = ";
DM_MSG_RESETFRAMEPOS = "DamageMeters: Сброс местоположения фрейма.";
DM_MSG_SAVE = "DamageMeters: Сохранение таблиц.";
DM_MSG_RESTORE = "DamageMeters: восстановление сохранённых таблиц.";
DM_MSG_MERGE = "DamageMeters: Объединение сохраненной таблицы с текущей.";
DM_MSG_SWAP = "DamageMeters: Замена нормальной (%d) и сохр. (%d) табл.";
DM_MSG_SETCOLORSCHEME = "DamageMeters: настройки схемы окраски установленны на ";
DM_MSG_TRUE = "Да";
DM_MSG_FALSE = "Нет";
DM_MSG_SETVISINPARTY = "DamageMeters: Отображение только в группе установлено на: ";
DM_MSG_SETAUTOCOUNT = "DamageMeters: Установка нового авто. подсчетного лимита ";
DM_MSG_LISTBANNED = "DamageMeters: Список запрещенных объектов:";
DM_MSG_CLEARBANNED = "DamageMeters: Очистка всех запрещенных объектов.";
DM_MSG_HOWTOSHOW = "DamageMeters: Окно скрыто.  Используйте /dm show чтобы сделать его видимым.";
DM_MSG_SYNCCHAN = "DamageMeters: Название канала синхронизации: ";
DM_MSG_SYNCREQUESTACK = "DamageMeters: Синх запрошена у игрока ";
DM_MSG_SYNCREQUESTACKEVENTS = "DamageMeters: Синх (с событиями) запрошена у игрока ";
DM_MSG_SYNC = "DamageMeters: Отсылка данных синх.";
DM_MSG_SYNCEVENTS = "DamageMeters: Отсылка данных синх (с событиями).";
DM_MSG_LOCKED = "DamageMeters: Список заблокирован.";
DM_MSG_NOTLOCKED = "DamageMeters: Список разблокирован.";
DM_MSG_PAUSED = "DamageMeters: разбор приостановлен.";
DM_MSG_UNPAUSED = "DamageMeters: разбор возобновлен.";
DM_MSG_POSLOCKED = "DamageMeters: местоположение заблокированно.";
DM_MSG_POSNOTLOCKED = "DamageMeters: местоположение разблокированно.";
DM_MSG_CLEARRECEIVED = "DamageMeters: Очистка получение запросов от игрока ";
DM_MSG_ADDINGPETTOPLAYER = "DamageMeters: Теперь данные питомца будут обрабатываться так как бутто это ваши.";
DM_MSG_NOTADDINGPETTOPLAYER = "DamageMeters: данные питомца будет обрабатываться отдельно от ваших.";
DM_MSG_PETMERGE = "DamageMeters: Объединение информации питомцев (%s) с вашими.";
DM_MSG_RESETWHENCOMBATSTARTSCHANGE = "DamageMeters: Сброс при начале боя = ";
DM_MSG_SHOWFIGHTASPS = "DamageMeters: Отображение данных боя в \"в/секунду\" = ";
DM_MSG_COMBATDURATION = "Длительность боя = %.2f секунд.";
DM_MSG_RECEIVEDSYNCDATA = "DamageMeters: Получение данных синх от (%s).";
DM_MSG_TOTAL = "ВСЕГО";
DM_MSG_VERSION = "Версия DamageMeters %s активна.";
DM_MSG_REPORTHELP = "Команда отчета /dm состоит из трех частей:\n\n1) Указанный персонаж. Может быть указанно одним из след. символов:\n  c - Консоль (только вы можете видеть это)%.\n  s - сказать\n  p - чат группы\n  r - рейд чат\n  g - чат гильдии\n  o - чат офицеров гильдии\n  h - канал чата. /dm report h mychannel\n  w - шепот игроку.  /dm report w dandelion\n  f - Фрейм: Отображает отчет в этом окне.\n\nЕсли текст в нижней ячейке, отчет будет в обратном порядке (снизу вверх)%.\n\n2) По желанию, число людей может быть ограничено.";
DM_MSG_COLLECTORS = "Сборщик данных: (%s)";
DM_MSG_ACCUMULATING = "DamageMeters: Накопление данных в регистре памяти.";
DM_MSG_REPORTTOTALDPS = "Всего = %.1f (%.1f видимых)";
DM_MSG_REPORTTOTAL = "Всего = %d (%d видимых)";
DM_MSG_SYNCMSG = "[DMM] |Hplayer:%s|h[%s]|h: %s";
DM_MSG_MEMCLEAR = "DamageMeters: Сохраненные таблициочищены.";
DM_MSG_MAXBARS = "DamageMeters: Настройки показ-макс-полос установлены на %s.";
DM_MSG_MINBARS = "DamageMeters: Настройки сворачивания установлены на %s.";
DM_MSG_LEADERREPORTHEADER = "DamageMeters: Отчёт лидеров - %d/%d источников:\n #";
-- This causes disconnects.. maybe its too long?  ..maybe WoW doesn't like the \n character?
--DM_MSG_FULLREPORTHEADER = "DamageMeters: Full Report on %d/%d Sources:\nPlayer        Damage     Healing     Damaged      Healed        Hits   Crits\n_______________________________________________________________________________";
DM_MSG_FULLREPORTHEADER1 = "DamageMeters: Полный отчёт - %d/%d источников:";
DM_MSG_FULLREPORTHEADER2 = "Игрок      Урон     Исцеление    Получ.Урона    Получ.Исцеления     Поподаний   Критов";
DM_MSG_FULLREPORTHEADER3 = "_____________________________________________________________________________________";
DM_MSG_CLEARACKNOWLEDGED = "DamageMeters: Очистка подтверждений от (%s).";
DM_MSG_EVENTREPORTHEADER = "DamageMeters: Отчёт события - %d/%d источников:\n";
DM_MSG_PLAYERONLYEVENTDATAOFF = "DamageMeters: Запись данный события всех играков.";
DM_MSG_PLAYERONLYEVENTDATAON = "DamageMeters: Теперь записываються только ваши события.";
--DM_MSG_SYNCCHANBROADCAST = "<DamageMeters>: Setting this group's sync channel to: ";
DM_MSG_INCLOGRANGEON = "DamageMeters: Диапазон журнала боя увеличен до: 200 метров.";
DM_MSG_INCLOGRANGEOFF = "DamageMeters: Диапазон журнала боя сброшен на значение по умолчанию: 50 метров.";
--DM_MSG_AUTOSYNCJOINON = "DamageMeters: You will automatically join broadcasted sync channels.";
--DM_MSG_AUTOSYNCJOINOFF = "DamageMeters: You will no longer automatically join broadcasted sync channels.";
DM_MSG_SYNCHELP = "DamageMeters Синхр. (сокращение для синхронизации) процесс, при котором игроки могут обмениваться своими данными.";
DM_MSG_PINGING = "DamageMeters: тестовый опрос всех играков..";
DM_MSG_SYNCONLYPLAYEREVENTSON = "DamageMeters: Будет передаваться информация только вашего события.";
DM_MSG_SYNCONLYPLAYEREVENTSOFF = "DamageMeters: Будет передаваться информация всех участников события.";
DM_MSG_SYNCPAUSE = "DamageMeters: Команда приостоновки получена от (%s).";
DM_MSG_SYNCUNPAUSE = "DamageMeters: Команда возобновления получена от (%s).";
DM_MSG_SYNCREADY = "DamageMeters: Команда готовности получена от (%s).";
DM_MSG_SYNCPAUSEREQ = "DamageMeters: Команда приостоновки передачи..";
DM_MSG_SYNCUNPAUSEREQ = "DamageMeters: Команда возобновления передачи..";
DM_MSG_SYNCREADYREQ = "DamageMeters: Команда готовности передачи..";
--DM_MSG_PRESSCONTROLEVENT = "Press Control To See Event Data";
--DM_MSG_PRESSCONTROLQUANTITY = "Press Control To See Quantity Data";
--DM_MSG_PRESSALTSINGLEQUANTITY = "Press Alt To See Only Current Quantity";
DM_MSG_PRESS_FOR_SUMMARY = "Нажмите %s для просмотра сводки данных события";
DM_MSG_PRESS_FOR_CURRENT = "Нажмите %s для просмотра данных текущего события";
DM_MSG_PRESS_FOR_ALL = "Нажмите %s для просмотра всех данных события";
DM_MSG_ALT = "<Alt>";
DM_MSG_CTRL = "<Control>";
DM_MSG_PAUSEDTITLE = "Пауза";
DM_MSG_READYTITLE = "Готов";
DM_MSG_EVENTDATALEVEL = {
    "DamageMeters: Не разберать данные события.",
    "DamageMeters: Разбор только данных события игроков.",
    "DamageMeters: Разбор данных события всех игроков."
};
DM_MSG_SYNCEVENTDATALEVEL = {
    "DamageMeters: Не передавать данные события.",
    "DamageMeters: Передавать только данные события игроков.",
    "DamageMeters: Передавать данные события всех игроков."
};
DM_MSG_HELP = "- Введите /dm cmd для выводасписка команд.\n- Если вы не видете окно DM, попробуйте /dm resetpos.";
DM_MSG_LEAVECHAN = "DamageMeters: Покинуть канал синхронизации '%s'.";
DM_MSG_READYUNPAUSING = "DamageMeters: Получено событие о повреждении, команда передачи синхронизации восстано...";
DM_MSG_KICKED = "DamageMeters: %s удалил вас из канала синхронизации.";
DM_MSG_SETLABEL = "DamageMeters: Метка сессии установлена в <%s>. (Указатель = %d)";
DM_MSG_SESSIONMISMATCH = "DamageMeters: Синхронизация получила различные данные за сеанс. Авто-очистка.";
DM_MSG_SHOWINGFIGHTEVENTSONLY = "Отображать события только для текущего боя.";
DM_MSG_SYNCCLEARREQ = "DamageMeters: Передача чистого запроса...";
DM_MSG_CURRENTBARWIDTH = "DamageMeters: текущая ширина полосы = %d.\nCall (/dm setbarwidth default) для сброса.";
DM_MSG_NEWBARWIDTH = "DamageMeters: Новая ширина полосы = %d.";
DM_MSG_PLAYERJOINEDSYNCCHAN = "DamageMeters: Игрок %s присоединился к каналу синхр. [Версия %s]";
DM_MSG_SYNCSESSIONMISMATCH = "Игрок %s не соответствует сессии (%s:%d): Данные игрока будут очищены.";
DM_MSG_SYNCHALTRECEIVED = "DamageMeters: Получена команда остановки синхронизации от %s.";
DM_MSG_SYNCHALTSENT = "DamageMeters: Передача команды остановки...";
DM_MSG_SYNCSESSIONCURRENT = "DamageMeters: У вас уже есть текущий сеанс.";
DM_MSG_SYNCNOSESSIONS = "DamageMeters: не найдено текущей сессии.";
-- RPS
DM_MSG_RPS_CHALLENGE = "Вы запрашиваете %s на игру камень, ножницы, бумага! Вы играете с %s.";
DM_MSG_RPS_CHALLENGED = "%s бросил вам вызов на игру камень, ножницы, бумага! Используйте /dm rpsr [имя] [r/p/s] (r = Камень / p = Бумага / s = Ножницы) для ответа";
DM_MSG_RPS_MISSING_PLAYER = "ОШИБКА!!!";
DM_MSG_RPS_NOTCHALLENGED = "ОШИБКА: %s не принял соглашения.";
DM_MSG_RPS_YOUPLAY = "Вы играете %s.";
DM_MSG_RPS_PLAYS = "%s играет %s.";
DM_MSG_RPS_DEFEATED = "%s побеждает вас.";
DM_MSG_RPS_VICTORIOUS = "Вы побеждаете %s!"
DM_MSG_RPS_TIE = "Игра с %s зашла в тупик.";

--[[ Note: This is only to help construct the DM_MSG_REPORTHELP string.
The /dm report command consists of three parts:

1) The destination character.  This can be one of the following letters:
  c - Console (only you can see it)%.
  s - Say
  p - Party chat
  r - Raid chat
  g - Guild chat
  h - Chat cHannel. /dm report h mychannel
  w - Whisper to player.  /dm report w dandelion
  f - Frame: Shows the report in this window.

If the letter is lower case the report will be in reverse order (lowest to highest)%.

2) Optionally, the number of people to limit it to.  This number goes right after the destination character.
Example: /dm report p5

3) By default, reports are on the currently visible quantity only.  If the word 'total' is specified before the destination character, though, the report will be on the totals for every quantity. 'Total' reports are formatted so that they look good when cut-and-paste into a text file, and so work best with the Frame destination.
Example: /dm report total f

Example: Whisper to player "dandelion" the top three people in the list:
/dm report w3 dandelion
]]--

--[[ Note: This is only to help construct the DM_MSG_SYNCHELP string.
DamageMeters Sync'ing (short for synchronization) is a process whereby multiple DM users can transmit their data to each other.  Its primary use is for instances where the players are often far from each other and thus miss some of each other's combat messages.\n\nSync Quick-Start Guide:\n\n1) Someone (I'll call her the Sync Leader) chooses a channel name and joins it, ie. /dm syncchan ourchannel.\n2) The Sync Leader then calls /dm syncbroadcastchan (or just /dm syncb).  Anyone who is running a sufficiently recent version of DM will automatically be joined into that channel.\n3) The Sync Leader choses a name for the session--for example, Onyxia-- then calls /dm syncstart with that name. (/dm syncstart Onyxia_.  This will clear everyone's data and pause them, as well as mark them with this label.\n3) Once everyone is in the channel, but before the activity begins, the Sync  Leader should call /dm syncready or /dm syncunpause so that data collection can happen.\n4) Play!  Collect data!\n5) Finally, the Sync Leader calls /dm sync whenever she wants the raid to share data.  Since it can cause a little slowdown it is best to do this between fights (though not necessarily between every fight).  If event data is desired, call (/dm sync e), though it takes a lot longer to sync.\n\nNote: There is nothing special about the Sync Leader: any player can perform any of these commands.  It just seems simpler to have one person in charge of it.
]]--

-- Menu Options --
DM_MENU_CLEAR = "Очистить";
DM_MENU_RESETPOS = "Сброс местоположение";
DM_MENU_HIDE = "Скрыть окно";
DM_MENU_SHOW = "Показать окно";
DM_MENU_VISINPARTY = "Видим только когда в группе";
DM_MENU_REPORT = "Отчёт";
DM_MENU_BARCOUNT = "Число полос";
DM_MENU_AUTOCOUNTLIMIT = "Авто предел числа полос";
DM_MENU_SORT = "Тип сортировки";
DM_MENU_VISIBLEQUANTITY = "Отображение";
--DM_MENU_COLORSCHEME = "Color Scheme";
DM_MENU_MEMORY = "Регистр Памяти";
DM_MENU_SAVE = "Сохранить";
DM_MENU_RESTORE = "Востоновить";
DM_MENU_MERGE = "Слить";
DM_MENU_SWAP = "Заменить";
DM_MENU_DELETE = "Удалить";
DM_MENU_BAN = "Бан";
DM_MENU_CLEARABOVE = "Очистка верхнего";
DM_MENU_CLEARBELOW = "Очистка нижнего";
--DM_MENU_LOCK = "Lock List";
--DM_MENU_UNLOCK = "Unlock List";
DM_MENU_PAUSE = "Приостановка разбора";
--DM_MENU_UNPAUSE = "Resume Parsing";
DM_MENU_LOCKPOS = "Блокировать местоположение";
DM_MENU_UNLOCKPOS = "Разблокировать местоположение";
DM_MENU_GROUPMEMBERSONLY = "Следить только за участниками группы";
DM_MENU_ADDPETTOPLAYER = "Обрабатывать данных питомца как ваши данные";
DM_MENU_TEXT = "Настройки текста";
DM_MENU_TEXT_RANK = "Уровень";
DM_MENU_TEXT_NAME = "Название";
DM_MENU_TEXT_TOTALPERCENTAGE = "% всего";
DM_MENU_TEXT_LEADERPERCENTAGE = "% лидеров";
DM_MENU_TEXT_VALUE = "Значение";
DM_MENU_TEXT_DELTA = "Разница";
DM_MENU_SETCOLORFORALL = "Установка цвета для всех";
DM_MENU_DEFAULTCOLORS = "Востоновить цвета по умолчанию";
DM_MENU_RESETONCOMBATSTARTS = "Сброс данных при начале боя";
DM_MENU_SHOWFIGHTASPS = "Показывать данные боя ка в/секунду";
DM_MENU_REFRESHBUTTON = "Обновить";
DM_MENU_TOTAL = "Всего";
DM_MENU_CHOOSEREPORT = "Выберите отчёт";
-- Note reordered this list in version 2.2.0
DM_MENU_REPORTNAMES = {"Фрейм", "Консоль", "Сказать", "Группа", "Рейд", "Гильдия", "Оффицеры"};
DM_MENU_TEXTCYCLE = "Цикл";
DM_MENU_QUANTCYCLE = "Авто-цикл";
DM_MENU_HELP = "Справка";
DM_MENU_ACCUMULATEINMEMORY = "Накапливать данные";
DM_MENU_POSITION = "Пизиция";
DM_MENU_RESIZELEFT = "Изменить размер влево";
DM_MENU_RESIZEUP = "Изменить размер вверх";
DM_MENU_SHOWMAX = "Показать макс";
DM_MENU_SHOWTOTAL = "Показать общее";
DM_MENU_LEADERS = "Лидеры";
DM_MENU_PLAYERREPORT = "Отчёт по игрокам";
DM_MENU_EVENTREPORT = "Отчёт по событию";
DM_MENU_EVENTDATA = "Данные события";
DM_MENU_EVENTDATA_NONE = "Не разберать события";
DM_MENU_EVENTDATA_PLAYER = "Разбор своих событий";
DM_MENU_EVENTDATA_ALL = "Разбор всех событий";
--DM_MENU_SYNCEVENTDATA_NONE = "Transmit No Events";
--DM_MENU_SYNCEVENTDATA_PLAYER = "Transmit Own Events";
--DM_MENU_SYNCEVENTDATA_ALL = "Transmit All Events";
DM_MENU_TOOLTIPDATA = "Инфо подсказок по умолчанию";
DM_MENU_TOOLTIPDATA_SUMMARY = "Показывать сводку событий";
DM_MENU_TOOLTIPDATA_CURRENT = "Показывать текущее событие";
DM_MENU_TOOLTIPDATA_ALL = "Показ все события";
DM_MENU_SHOWEVENTDATATOOLTIP = "Подсказка по умолчанию";
DM_MENU_EVENTS1 = "События 1-20";
DM_MENU_EVENTS2 = "События 21-40";
DM_MENU_EVENTS3 = "События 41-50";
DM_MENU_SYNC = "Синхронизация";
DM_MENU_INCLOGRANGE = "Увеличить радиус журнала боя";
DM_MENU_PERMITSYNCAUTOJOIN = "Присоединиться к каналу передачи";
DM_MENU_CLEARONAUTOJOIN = "Очистить при присоединении";
DM_MENU_SYNCBROADCASTCHAN = "Канал передачи";
DM_MENU_SYNCLEAVECHAN = "Покинуть канал";
DM_MENU_SYNCONLYPLAYEREVENTS = "Синх только свои события";
DM_MENU_ENABLEDMM = "Показывать сообщения DMM";
DM_MENU_NOSYNCCHAN = "КАНАЛ СИНХ НЕ УСТАНОВЛЕН";
DM_MENU_SYNCCHAN = "Текущий канал синх = ";
DM_MENU_SESSION = "Текущая сессия = ";
DM_MENU_SAVEDSESSION = "Сессия = ";
DM_MENU_JOINSYNCCHAN = "Присоединиться к каналу: Используйте /dm syncchan";
DM_MENU_PARSEEVENTMESSAGES = "Разбор входящих событий";
DM_MENU_SENDINGBAR = "Отсылка..";
DM_MENU_PROCESSINGBAR = "Обработка..";
DM_MENU_QUANTITYFILTER = "Величина циклировани"; -- ??
DM_MENU_MINIMIZE = "Свернуть";
DM_MENU_LEFTJUSTIFYTEXT = "Выравнивание влева";
DM_MENU_RIGHTJUSTIFYTEXT = "Выравнивание вправа";
DM_MENU_RESTOREDEFAULTOPTIONS = "Востоновить настройки по умолчанию";
DM_MENU_PLAYERALWAYSVISIBLE = "Всегда видимый для себя";
DM_MENU_APPLYFILTERTOMANUALCYCLING = "Применить к ручному циклированию";
DM_MENU_APPLYFILTERTOAUTOCYCLING = "Применить к Авто-Циклу";
DM_MENU_GENERAL = "Общие настройки";
DM_MENU_GROUPDPSMODE = "Режим урона в секунду группы";
DM_MENU_CLEARBANNED = "Отмена бана на всё";
DM_MENU_CONSTANTVISUALUPDATE = "Постоянное визуальное обновление";
DM_MENU_CLEARWHENJOINPARTY = "Очищать при вступлении в группу";
DM_MENU_AUTOSYNC = "Авто синхронизация";
DM_MENU_STARTNEWSESSION = "Начать новый сеанс";
DM_MENU_SYNCGROUPDATA = "Синхронизировать данные группы";
DM_MENU_SYNCREADY = "Запрос готовности";
DM_MENU_SYNCPAUSE = "Запрос паузы";
DM_MENU_SYNCCLEAR = "Запрос очистки";
DM_MENU_REPORTCHANNEL = "Канал";
DM_MENU_REPORTWHISPER = "Шепот";
DM_MENU_ENABLESYNC = "Включить синх данных";
DM_MENU_NOCOMBATSYNC = "Выключить синх данных в бою";
DM_MENU_SYNCREQSESSION = "Запрос ID сессии";
DM_MENU_HIDESCROLLBAR = "Скрыть полосу прокрутки";


-- Misc
DM_CLASS = "Класс"; -- The word for player class, like Druid or Warrior.
DM_TOOLTIP = "\nВремя с момента последнего действия = %.1fs\nОтношение = %s";
DM_YOU = "вы"
DM_CRITSTR = "Крит";
DM_UNKNOWNENTITY = "Неизвестный объект";
DM_SYNCSPELLNAME = "[Синх]";
DM_NEWSESSIONID = "Введите ID новой сессии: "
DM_REPORTCHANNEL = "Введите название или номер канала куда будет выводиться отчёт: "
DM_REPORTWHISPER = "Введите имя игрока которому будет высылаться отчёт: "

DM_DMG_MELEE = "[Ближний]";
DM_DMG_FALLING = "[Падение]";
DM_DMG_LAVA = "[Лава]";
DM_DMG_DAMAGESHIELD = "[Раняющий щит]";
DM_DMG_DEATH = "[Смерть]";
DM_DMG_COMBAT = "[Выход из боя]";

DamageMeters_RPSmoveStrings = 
{ 
    r = "Камень",
    p = "Бумага",
    s = "Ножницы"
};

-------------------------------------------------------------------------------

--[[ This system based on the one in Gello's Recap, which itself was based on the one in Telo's MobHealth.
- source and dest = 0 means the player

TODO: These are all special cases in English because they contain apostrophes.
Julie's Dagger
Rammstein's Lightning Bolts
Night Dragon's Breath

]]--

--[[
This table defines types of messages that DM parses and how to parse them.

The index of the table is a human-readable name, which by convention is
normally the name of the string variable (as defined in GlobalStrings.lua) that
is being parsed.  Every type of message that is parsed for the "Damage Done",
"Healing Done", "Damage Taken", and "Healing Taken" quantities must be defined in this
table.

The key to the system is the "pattern" member.  This is usually (there are some
special cases) a string defined in GlobalStrings.lua.  An example is COMBATHITSELFOTHER =
"You hit %s for %d.".  When DM loads up it goes through this list and converts all the
patterns into "regular expression" search strings.  So, for example, the above becomes
"You hit (.+) for (%d+)%."

When a match is found there will be an array of "elements" for
each unknown in the pattern.  In the above pattern, elements[1] will be the string name
of who was hit, and elements[2] will be how much damage was done.  Each msgInfo has fields
in which you specify which elements mean what.  So, in the msgInfo for this example we set
"dest=1" and "amount=2".

The fields of each entry are defined as follows:
- source: The index of the element that specifies the source of the amount.  The source is the
person doing damage or doing the healing in the case of "Damage done" and "healing done" messages,
but it is the the person being hit in the case of "damage received" messages.  When source=0, it
means the player (us) is the source.
- dest: The name of the entity being effected.  Again, dest=0 means the player.
- amount: The index of the element that contains the quantity of damage/healing done.
- spell: This is the index of the element which references the spell that is doing the damage/healing.
Alternately, if it is a string that spell will be used explicitly.  Spell=0 or nil defaults to regular
melee damage.
- damageType: Also known as "school", this is the index of the element which specifies the type of
damage done, ie. "physical", "fire", "frost", etc.
- crit: This is one of three defined values: DM_HIT, DM_CRT, DM_DOT.  Set this to specify whether
the message represents a spell that hit normally, critically hit, or was a non-crittable spell.
(Damage Over Time spells, DOTs, cannot crit, hence the name.)
- pattern: This is the pattern, usually a string from GlobalStrings.lua.
- custom: If this is set to true, the pattern will not be transformed when DM is loaded.  Use
this for custom patterns.
]]--

DamageMeters_msgInfo = {
	-- CHAT_MSG_COMBAT_SELF_HITS
		_COMBATHITSELFOTHER =
			{ source=0, dest=1, amount=2, spell=0, damageType=0, crit=DM_HIT, pattern=COMBATHITSELFOTHER }, -- You hit (.+) for (%d+)
		_COMBATHITCRITSELFOTHER =
			{ source=0, dest=1, amount=2, spell=0, damageType=0, crit=DM_CRT, pattern=COMBATHITCRITSELFOTHER }, -- You crit (.+) for (%d+)
		_VSENVIRONMENTALDAMAGE_FALLING_SELF =
			{ source=0, dest=0, amount=1, spell=DM_DMG_FALLING, damageType=0, crit=DM_DOT, pattern=VSENVIRONMENTALDAMAGE_FALLING_SELF }, -- You fall and lose (%d+) health
		_VSENVIRONMENTALDAMAGE_LAVA_SELF =
			{ source=0, dest=0, amount=1, spell=DM_DMG_LAVA, damageType=0, crit=DM_DOT, pattern=VSENVIRONMENTALDAMAGE_LAVA_SELF }, -- You lose %d health for swimming in lava.


	-- CHAT_MSG_SPELL_SELF_DAMAGE
		_SPELLLOGSCHOOLSELFOTHER =
			{ source=0, dest=2, amount=3, spell=1, damageType=4, crit=DM_HIT, pattern=SPELLLOGSCHOOLSELFOTHER }, -- Your (.+) hits (.+) for (%d+) (.+)%.
		_SPELLLOGCRITSCHOOLSELFOTHER =
			{ source=0, dest=2, amount=3, spell=1, damageType=4, crit=DM_CRT, pattern=SPELLLOGCRITSCHOOLSELFOTHER }, -- "Your %s crits %s for %d %s damage.";
		_SPELLLOGSELFOTHER =
			{ source=0, dest=2, amount=3, spell=1, damageType=0, crit=DM_HIT, pattern=SPELLLOGSELFOTHER }, -- Your (.+) hits (.+) for (%d+)
		_SPELLLOGCRITSELFOTHER =
			{ source=0, dest=2, amount=3, spell=1, damageType=0, crit=DM_CRT, pattern=SPELLLOGCRITSELFOTHER }, -- Your (.+) crits (.+) for (%d+)

	-- "CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE" or event == "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
		-- No such message.
		--_PERIODICAURADAMAGEABSORBEDSELFOTHER =
		--	{ source=0, dest=1, amount=2, spell=4, damageType=3, crit=DM_DOT, pattern=PERIODICAURADAMAGEABSORBEDSELFOTHER }, -- = "%s suffers %d %s damage from your %s (%d absorbed)."
		_PERIODICAURADAMAGESELFOTHER =
			{ source=0, dest=1, amount=2, spell=4, damageType=3, crit=DM_DOT, pattern=PERIODICAURADAMAGESELFOTHER }, -- (.+) suffers (%d+) (.+) damage from your (.+).
		-- No such message.
		--_PERIODICAURADAMAGEABSORBEDOTHEROTHER =
		--	{ source=4, dest=1, amount=2, spell=5, damageType=3, crit=DM_DOT, pattern=PERIODICAURADAMAGEABSORBEDOTHEROTHER }, -- %s suffers %d %s damage from %s's %s (%d absorbed).
		_PERIODICAURADAMAGEOTHEROTHER =
			{ source=4, dest=1, amount=2, spell=5, damageType=0, crit=DM_DOT, pattern=PERIODICAURADAMAGEOTHEROTHER }, -- (.+) suffers (%d+) (.+) damage from (.+)'s (.+)

	-- "CHAT_MSG_COMBAT_PARTY_HITS" or "CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS" or	"CHAT_MSG_COMBAT_PET_HITS")
		_COMBATHITOTHEROTHER =
			{ source=1, dest=2, amount=3, spell=7, damageType=0, crit=DM_HIT, pattern=COMBATHITOTHEROTHER }, -- (.+) hits (.+) for (%d+)
		_COMBATHITCRITOTHEROTHER =
			{ source=1, dest=2, amount=3, spell=7, damageType=0, crit=DM_CRT, pattern=COMBATHITCRITOTHEROTHER }, -- (.+) crits (.+) for (%d+)
		_VSENVIRONMENTALDAMAGE_FALLING_OTHER =
			{ source=1, dest=1, amount=2, spell=DM_DMG_FALLING, damageType=0, crit=DM_DOT, pattern=VSENVIRONMENTALDAMAGE_FALLING_OTHER }, -- %s falls and loses %d health.
		_VSENVIRONMENTALDAMAGE_LAVA_OTHER =
			{ source=1, dest=1, amount=2, spell=DM_DMG_LAVA, damageType=0, crit=DM_DOT, pattern=VSENVIRONMENTALDAMAGE_LAVA_OTHER }, -- %s loses %d health for swimming in lava.

	-- "CHAT_MSG_SPELL_PARTY_DAMAGE"  "CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE" "CHAT_MSG_SPELL_PET_DAMAGE"
		_SPELLLOGOTHEROTHER =
			{ source=1, dest=3, amount=4, spell=2, damageType=0, crit=DM_HIT, pattern=SPELLLOGOTHEROTHER }, -- (.+)'s (.+) hits (.+) for (%d+) -- 
		_SPELLLOGCRITOTHEROTHER =
			{ source=1, dest=3, amount=4, spell=2, damageType=0, crit=DM_CRT, pattern=SPELLLOGCRITOTHEROTHER }, -- (.+)'s (.+) crits (.+) for (%d+)
		_SPELLSPLITDAMAGEOTHEROTHER =
			{ source=1, dest=3, amount=4, spell=2, damageType=0, crit=DM_DOT, pattern=SPELLSPLITDAMAGEOTHEROTHER }, -- (.+)'s (.+) causes (.+) (%d+) damage

	-- CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF
		_DAMAGESHIELDSELFOTHER =
			{ source=0, dest=3, amount=1, spell=DM_DMG_DAMAGESHIELD, damageType=0, crit=DM_DOT, pattern=DAMAGESHIELDSELFOTHER }, -- You reflect (%d+) (.+) damage to (.+)

	-- CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS
		_DAMAGESHIELDOTHEROTHER =
			{ source=1, dest=4, amount=2, spell=DM_DMG_DAMAGESHIELD, damageType=0, crit=DM_DOT, pattern=DAMAGESHIELDOTHEROTHER }, -- (.+) reflects (%d+) (.+) damage to (.+)
		-- ? soul link or something?
		_SPELLSPLITDAMAGESELFOTHER =
			{ source=0, dest=2, amount=3, spell=1, damageType=0, crit=DM_DOT, pattern=SPELLSPLITDAMAGESELFOTHER }, -- Your (.+) causes (.+) (%d+) damage

-- DAMAGE TAKEN
	--"CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS" -- this gets complicated with pets.
	--"CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS"
	--"CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS"
		_COMBATHITOTHERSELF =
			{ source=1, dest=0, amount=2, crit=DM_HIT, pattern=COMBATHITOTHERSELF }, -- "%s hits you for %d.";
		_COMBATHITCRITOTHERSELF =
			{ source=1, dest=0, amount=2, crit=DM_CRT, pattern=COMBATHITCRITOTHERSELF }, -- "%s crits you for %d.";
		_COMBATHITOTHEROTHER =
			{ source=1, dest=2, amount=3, crit=DM_HIT, pattern=COMBATHITOTHEROTHER }, -- "%s hits %s for %d.";
		_COMBATHITCRITOTHEROTHER =
			{ source=1, dest=2, amount=3, crit=DM_CRT, pattern=COMBATHITCRITOTHEROTHER }, -- "%s crits %s for %d.";
		_COMBATHITCRITSCHOOLOTHEROTHER =
			{ source=1, dest=2, amount=3, damageType=4, crit=DM_CRT, pattern=COMBATHITCRITSCHOOLOTHEROTHER }, -- "%s crits %s for %d %s damage.";
		_COMBATHITSCHOOLOTHEROTHER =
			{ source=1, dest=2, amount=3, damageType=4, crit=DM_HIT, pattern=COMBATHITSCHOOLOTHEROTHER }, -- "%s hits %s for %d %s damage.";
		_COMBATHITCRITSCHOOLOTHERSELF =
			{ source=1, dest=0, amount=2, damageType=3, crit=DM_CRT, pattern=COMBATHITCRITSCHOOLOTHERSELF }, -- "%s crits you for %d %s damage.";
		_COMBATHITSCHOOLOTHERSELF =
			{ source=1, dest=0, amount=2, damageType=3, crit=DM_HIT, pattern=COMBATHITSCHOOLOTHERSELF }, -- "%s hits you for %d %s damage.";


	--"CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE" or
	--"CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE" or
	--"CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE") then
		_SPELLLOGOTHERSELF =
			{ source=1, dest=0, amount=3, spell=2, damageType=0, crit=DM_HIT, pattern=SPELLLOGOTHERSELF }, -- "%s's %s hits you for %d.";
		_SPELLLOGSCHOOLOTHERSELF =
			{ source=1, dest=0, amount=3, spell=2, damageType=4, crit=DM_HIT, pattern=SPELLLOGSCHOOLOTHERSELF }, --  "%s's %s hits you for %d %s damage.";
		_SPELLLOGCRITSCHOOLOTHERSELF =
			{ source=1, dest=0, amount=3, spell=2, damageType=4, crit=DM_CRT, pattern=SPELLLOGCRITSCHOOLOTHERSELF }, --  "%s's %s crits you for %d %s damage.";
		_SPELLLOGCRITOTHERSELF =
			{ source=1, dest=0, amount=3, spell=2, crit=DM_CRT, pattern=SPELLLOGCRITOTHERSELF }, -- "%s's %s crits you for %d.";
		-- bunch of junk in here in the old code
		_SPELLRESISTOTHERSELF =
			{ source=1, dest=0, amount=0, spell=2, crit=DM_HIT, pattern=SPELLRESISTOTHERSELF }, -- "%s's %s was resisted.";

		_SPELLLOGSCHOOLOTHEROTHER =
			{ source=1, dest=3, amount=4, spell=2, damageType=5, crit=DM_HIT, pattern=SPELLLOGSCHOOLOTHEROTHER }, --  "%s's %s hits %s for %d %s damage.";
		_SPELLLOGCRITSCHOOLOTHEROTHER =
			{ source=1, dest=3, amount=4, spell=2, damageType=5, crit=DM_CRT, pattern=SPELLLOGCRITSCHOOLOTHEROTHER }, --  "%s's %s crits %s for %d %s damage.";
		_SPELLRESISTOTHEROTHER =
			{ source=1, dest=3, amount=0, spell=2, crit=DM_HIT, pattern=SPELLRESISTOTHEROTHER }, -- "%s's %s was resisted by %s.";

	--"CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE"
		_PERIODICAURADAMAGEOTHERSELF =
			{ source=3, dest=0, amount=1, spell=4, damageType=2, crit=DM_DOT, pattern=PERIODICAURADAMAGEOTHERSELF }, -- "You suffer %d %s damage from %s's %s."
		_PERIODICAURADAMAGESELFSELF =
			{ source=0, dest=0, amount=1, spell=3, damageType=2, crit=DM_DOT, pattern=PERIODICAURADAMAGESELFSELF }, -- "You suffer %d %s damage from your %s."
		-- pet
		_PERIODICAURADAMAGEOTHEROTHER =
			{ source=4, dest=1, amount=2, spell=5, damageType=3, crit=DM_DOT, pattern=PERIODICAURADAMAGEOTHEROTHER }, -- "%s suffers %d %s damage from %s's %s."

--HEALING
	-- "CHAT_MSG_SPELL_SELF_BUFF" "CHAT_MSG_SPELL_PARTY_BUFF" "CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF" "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF"
		_HEALEDSELFSELF =
			{ source=0, dest=0, amount=2, spell=1, crit=DM_HIT, pattern=HEALEDSELFSELF }, -- "Your %s heals you for %d.";
		_HEALEDCRITSELFSELF =
			{ source=0, dest=0, amount=2, spell=1, crit=DM_CRT, pattern=HEALEDCRITSELFSELF }, -- "Your %s critically heals you for %d.";
		_HEALEDSELFOTHER =
			{ source=0, dest=2, amount=3, spell=1, crit=DM_HIT, pattern=HEALEDSELFOTHER }, -- "Your %s heals %s for %d."
		-- missing some here, ie. HEALEDSELFSELF "Your %s heals you for %d."
		_HEALEDCRITSELFOTHER =
			{ source=0, dest=2, amount=3, spell=1, crit=DM_CRT, pattern=HEALEDCRITSELFOTHER }, -- "Your %s critically heals %s for %d.";
		__NIGHTDRAGONSBREATHOTHER =
			{ source=1, dest=2, amount=3, spell="Nachtdrachenodem", crit=DM_HIT, pattern="(.+)'s Nachtdrachenodem heilt (.+) um (%d+) Punkte.", custom=true }, -- "%s's Night Dragon's Breath heals %s for %d.";
		__NIGHTDRAGONSBREATHOTHERCRIT =
			{ source=1, dest=2, amount=3, spell="Nachtdrachenodem", crit=DM_CRT, pattern="(.+)'s Nachtdrachenodem heilt (.+) kritisch um (%d+) Punkte.", custom=true }, -- "%s's Night Dragon's Breath heals %s for %d.";
		_HEALEDOTHERSELF =
			{ source=1, dest=0, amount=3, spell=2, crit=DM_HIT, pattern=HEALEDOTHERSELF }, -- "%s's %s heals %s you %d.";
		_HEALEDCRITOTHERSELF =
			{ source=1, dest=0, amount=3, spell=2, crit=DM_CRT, pattern=HEALEDCRITOTHERSELF }, -- "%s's %s critically heals %s you %d.";
		_HEALEDOTHEROTHER =
			{ source=1, dest=3, amount=4, spell=2, crit=DM_HIT, pattern=HEALEDOTHEROTHER }, -- "%s's %s heals %s for %d.";
		_HEALEDCRITOTHEROTHER =
			{ source=1, dest=3, amount=4, spell=2, crit=DM_CRT, pattern=HEALEDCRITOTHEROTHER }, -- "%s's %s critically heals %s for %d.";

	--"CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS" "CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS" "CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS" "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS" -- why?
		__JULIESBLESSINGOTHER =
			{ source=3, dest=1, amount=2, spell="Julies Segen", crit=DM_HIT, pattern="(.+) bekommt (%d+) Punkte durch (.+)'s Julies Segen%.", custom=true },

		_PERIODICAURAHEALOTHERSELF =
			{ source=2, dest=0, amount=1, spell=3, crit=DM_DOT, pattern=PERIODICAURAHEALOTHERSELF }, -- "You gain %d health from %s's %s."
		_PERIODICAURAHEALSELFSELF =
			{ source=0, dest=0, amount=1, spell=2, crit=DM_DOT, pattern=PERIODICAURAHEALSELFSELF }, -- "You gain %d health from %s."
		_PERIODICAURAHEALSELFOTHER =
			{ source=0, dest=1, amount=2, spell=3, crit=DM_DOT, pattern=PERIODICAURAHEALSELFOTHER }, -- "%s gains %d health from your %s."
		_PERIODICAURAHEALOTHEROTHER =
			{ source=3, dest=1, amount=2, spell=4, crit=DM_DOT, pattern=PERIODICAURAHEALOTHEROTHER }, -- "%s gains %d health from %s's %s."

--CURING
};

-------------------------------------------------------------------------------

--[[
I lifted this system from some other mod (can't remember which, maybe DPSPlus).
Basically, the DM_Spellometer_Patterns works a lot like my own system, but
the patterns are quite a bit more complicated in this case.  In English, the two
patterns represent all 4 of the following:

DISPELLEDOTHEROTHER = "%s wirkt %s auf %s.";
DISPELLEDOTHERSELF = "%s wirkt %s auf Euch.";
DISPELLEDSELFOTHER = "Ihr wirkt %s auf %s.";
DISPELLEDSELFSELF = "Ihr wirkt %s.";

]]--
DM_Spellometer_Patterns = {
   { pattern="^([^ ]+) cast[s]? (.*) on (.*)%.$", caster=1, spell=2, target=3 },
   { pattern="^([^ ]+) cast[s]? (.*)%.$", caster = 1, spell=2, target=nil }
};

-- This list contains all of the "cure" spells we want to track.
DM_CURESPELLS = {
    "Массовое рассеивание",
    "Рассеивание заклинаний",
    "Снятие проклятия",
    "Снятие малого проклятия",
    "Выведение яда",
    "Устранение яда",
    "Излечение болезни",
    "Устранение болезни",
    "Очищение",
    "Чистота",
    "Тотем противоядия",
    "Тотем очищения от болезней",
    "Дух предков",
    "Возрождение",
    "Искупление",
    "Воскрешение",
    "Дефибриллировать",
};

end