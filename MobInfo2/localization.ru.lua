-- 
-- Russian Localisation for MobInfo
--
-- created by Maus
--

if ( GetLocale() == "ruRU" ) then

MI_DESCRIPTION = "выводит дополнительную информацию о существе на экран подсказки и отображает здоровье/ману в рамке цели"

MI2_SpellSchools = { ["Тайная магия"]="ar", ["Огонь"]="fi", ["Лед"]="fr", ["Тьма"]="sh", ["Свет"]="ho", ["Природа"]="na", ["тайная магия"]="ar", ["огонь"]="fi", ["лед"]="fr", ["тьма"]="sh", ["свет"]="ho", ["природа"]="na." }


MI_TXT_GOLD   = " Золото"
MI_TXT_SILVER = " Серебро"
MI_TXT_COPPER = " Медь"

MI_TXT_CONFIG_TITLE		= "Настройки MobInfo 2"
MI_TXT_WELCOME          = "Добро пожаловать в MobInfo 2"
MI_TXT_OPEN				= "Открыть"
MI_TXT_CLASS			= "Класс "
MI_TXT_HEALTH			= "Здоровье "
MI_TXT_MANA				= "Мана "
MI_TXT_XP				= "Опыт "
MI_TXT_KILLS			= "Убитых "
MI_TXT_DAMAGE			= "Урон + [УВС] "
MI_TXT_TIMES_LOOTED		= "Кол-во раз осмотрено "
MI_TXT_EMPTY_LOOTS		= "Пустые осмотры "
MI_TXT_TO_LEVEL			= "# до уровня"
MI_TXT_QUALITY			= "Качество "
MI_TXT_CLOTH_DROP		= "Ткани выпало "
MI_TXT_COIN_DROP		= "Среднее выпадение монет "
MI_TEXT_ITEM_VALUE		= "Среднее значение предмета "
MI_TXT_MOB_VALUE		= "Общее значение существ "
MI_TXT_COMBINED			= "Объединенный: "
MI_TXT_MOB_DB_SIZE		= "Размер БД MobInfo:  "
MI_TXT_HEALTH_DB_SIZE	= "Размер БД здоровья:  "
MI_TXT_PLAYER_DB_SIZE	= "Размер БД здоровья игроков:  "
MI_TXT_ITEM_DB_SIZE		= "Размер БД предметов:  "
MI_TXT_CUR_TARGET		= "Текущая цель:  "
MI_TXT_MH_DISABLED		= "Внимание: найден отдельный мод MobHealth. Внутренние функции отключены, пока другой мод типа MobHealth не будет удален."
MI_TXT_MH_DISABLED2		= (MI_TXT_MH_DISABLED.."\n\nВы не потеряете свои данные отключив отдельный MobHealth.\n\nВыгоды: подвижные health/mana показатели с поддержкой процента и регулируемым размером и шрифтом")
MI_TXT_CLR_ALL_CONFIRM	= "Вы действительно хотите удалит: "
MI_TXT_SEARCH_LEVEL		= "Уровень:"
MI_TXT_SEARCH_MOBTYPE	= "Тип:"
MI_TXT_SEARCH_LOOTS		= "Добыча:"
MI_TXT_TRIM_DOWN_CONFIRM = "ВНИМАНИЕ: это - непосредственное удаление. Вы действительно хотите удалить все данные существ."
MI_TXT_CLAM_MEAT		= "Мясо моллюска"
MI_TXT_SHOWING			= "Список показов: "
MI_TXT_DROPPED_BY		= "Добыто - "
MI_TXT_LOCATION			= "Местность: "
MI_TXT_DEL_SEARCH_CONFIRM = "Вы действительно хотите УДАЛИТЬ %d существ в списке результатов поиска из MobInfo БД?"
MI_TXT_WRONG_LOC		= "ОШИБКА : БД не совместима с вашим клиентом ВоВ. MobInfo БД непригодна."
MI_TXT_STATUS = "Статус: "
MI_TXT_STATUS_ALREADY = "Статус: <данные уже импортированы>"
MI_TXT_STATUS_OLD = "Статус: <импортируемая база данных слишком старая для импорта>"
MI_TXT_STATUS_WRONG = "Статус: <импортируемая база данных имеет неверный язык (локализацию)>"
MI_TXT_STATUS_AVAILABLE = " доступна для импорта"
MI_TXT_STATUS_NOIMPORT = "Статус: <нет данных для импорта>"
MI_TXT_MOBS = " Сущ."
MI_TXT_MOBS_1 = " Сущ.:"
MI_TXT_HP_VALUES = " значения ЗД"
MI_TXT_MANA = " Мана"
MI_TXT_HP = "Здоровье    "
MI_TXT_LEVEL = " УР"
MI_TXT_XP = "Опыт    "
MI_TXT_KTL = " до ур.    "
MI_TXT_DMG = "Урн "
MI_TXT_DPS = " УВС   "
MI_TXT_KILLS = "Убито  "
MI_TXT_LOOTS = " Добыча"
MI_TXT_VAL = "Знач    "
MI_TXT_COINS = " Монет"
MI_TXT_Q = "Кач      "
MI_TXT_DEBUG_INFO = "--------------  И н ф о   О т л а д к и --------------"
MI_TXT_DEBUG_DBG = "[ОТЛАДЧИК] "
MI_TXT_DEBUG_BI = "bi(основная информация)"
MI_TXT_DEBUG_QI = "qi(информация о качестве)"
MI_TXT_DEBUG_ML = "ml(расположение существа)"
MI_TXT_DEBUG_IL = "il(список предметов)"
MI_TXT_DEBUG_RE = "re(сопротивления)"
MI_TXT_DEBUG_CHAR_DATA = "(данные персонажа)"
MI_TXT_DEBUG_HP = "hp(данные здоровья)"
MI_TXT_IMMUN = "Имун:"
MI_TXT_RESIST = "Сопрот:"
MI_TXT_NEW_CORPSE = "хранение ИД новых убийств"
MI_TXT_LOOT_SLOT = "Добыча: слот"
MI_TXT_Q_NAME = "имя"
MI_TXT_Q_ID = "ид"
MI_TXT_REC_NEW_DPS = "запись нового УВС: idx"
MI_TXT_NEW_DPS = "новый урн"
MI_TXT_REC_NEW_MIN_DMG = "запись нового МИН урн "
MI_TXT_REC_NEW_DMG_FOR = " с "
MI_TXT_REC_NEW_DMG_OLD = "стар."
MI_TXT_REC_NEW_MAX_DMG = "запись нового МАКС урн "
MI_TXT_REC_KILL_MOB = "запись убийств: существо"
MI_TXT_REC_KILL_MOB_KILLS = "убито"
MI_TXT_REC_KILL_MOB_XP = "ЗД"
MI_TXT_REC_LOC = "запись местности"
MI_TXT_SLASH_VER = "вер."
MI_TXT_SLASH_DAT_TARGET = "данные цели "
MI_TXT_SLASH_DAT_DEL = " были удалены"
MI_TXT_SLASH_DAT_DB_DEL = "база данных удалена: "
MI_TXT_SLASH_DB_IMPORT = " запуск внешнего импорта базы данных ...."
MI_TXT_SLASH_IMPORTED = " импортирован "
MI_TXT_SLASH_NEW_MOBS = " новые существа"
MI_TXT_SLASH_NEW_HP_VAL = " новое значение здоровья"
MI_TXT_SLASH_NEW_ITEMS = " новая добыча предметов"
MI_TXT_SLASH_UPD_DATA = " обновление данных для "
MI_TXT_SLASH_EXS_MOBS = " существующие существа"
MI_TXT_SLASH_NOT_UPD = " не обновились данные для "
MI_TXT_SLASH_VERSION = " MobInfo-2 версия "
MI_TXT_SLASH_USAGE = " Используйте: введите /mobinfo2 или /mi2 для входа в настройки"
MI_TXT_SLASH_HELP = " для помощи с аддоном, перейдите по ссылке "
MI_TXT_SLASH_OFF = "-ВЫКЛ-"
MI_TXT_SLASH_ON = "-ВКЛ-"
MI_TXT_SEARCH_DEL = "результат поиска удален : "
MI_TXT_SEARCH_MOBS = " Сушества"
MI_TXT_SEARCH_LVL = "  УР"
MI_TXT_EVENTS_NEW_TARGET = "новая цель: id"
MI_TXT_EVENTS_LAST = "последний"
MI_TXT_EVENTS_NON_MOB = "событие без добычи с существа: действие"
MI_TXT_EVENTS_TYPE = "тип"
MI_TXT_EVENTS_NO_XP = "событие без опыта за убийство: существо"
MI_TXT_EVENTS_KILL_XP = "событие с опытом за убийство: существо"
MI_TXT_EVENTS_XP = "зд"
MI_TXT_EVENTS_MI_VER = "MobInfo-2  вер."
MI_TXT_EVENTS_MI_LOADED = "  загружен, введите /mi2 или /mobinfo2 для входа в настройки"
MI_TXT_CONVDROPRATE_CONVERTER = "ЧВ конвертация: "
MI_TXT_CONVDROPRATE_MOBSFOUND = " Существа найдены в данных частоты выпадения,"
MI_TXT_CONVDROPRATE_NEWMOBSFOUND = " новые существа добавлены в базу данных,"
MI_TXT_CONVDROPRATE_EXISTINGMOBS = " текущие существа расширены,"
MI_TXT_CONVDROPRATE_PARTIALMOBS = " частичная конвертация существ,"
MI_TXT_CONVDROPRATE_SKIPPEDITEMS = " пропуск неизвестных предметов,"
MI_TXT_CONVDROPRATE_ADDEDITEMS = " предметы добавленные в базу,"
MI_TXT_CONVDROPRATE_CONVERSTART = "преобразование ЧастотыВыпадения начато ..."
MI_TXT_CONVDROPRATE_NOTFOUND = "база данных ЧастотыВыпадения не найдена"
MI_TXT_CL = "CL     "
MI_TXT_EL = " EL      "
MI_TXT_Q_q = "q"

MI2_CHATMSG_MONSTEREMOTE = "пытается бежать"

BINDING_HEADER_MI2HEADER	= "MobInfo 2"
BINDING_NAME_MI2CONFIG	= "Открыть настройки MobInfo2"

MI2_FRAME_TEXTS = {}
MI2_FRAME_TEXTS["MI2_FrmTooltipOptions"]	= "Содержимое подсказки"
MI2_FRAME_TEXTS["MI2_FrmHealthOptions"]		= "Настройки здоровья"
MI2_FRAME_TEXTS["MI2_FrmDatabaseOptions"]	= "Настройки БД"
MI2_FRAME_TEXTS["MI2_FrmHealthValueOptions"]= "Значение здоровья"
MI2_FRAME_TEXTS["MI2_FrmManaValueOptions"]	= "Значение маны"
MI2_FRAME_TEXTS["MI2_FrmSearchOptions"]		= "Настройки поиска"
MI2_FRAME_TEXTS["MI2_FrmSearchLevel"]		= "Уровень существа"
MI2_FRAME_TEXTS["MI2_FrmItemTooltip"]		= "Настройки подсказок предмета"
MI2_FRAME_TEXTS["MI2_FrmImportDatabase"]	= "Импорт внешней MobInfo БД"

--
-- This section defines all buttons in the options dialog
--   text : the text displayed on the button
--  help : the (short) one line help text for the button
--   info : additional multi line info text for button
--      info is displayed in the help tooltip below the "help" line
--      info is optional and can be omitted if not required
--

MI2_OPTIONS = {};

MI2_OPTIONS["MI2_OptSearchMinLevel"] = 
{ text = "Мин"; help = "Минимальный уровень существа для поиска."; }

MI2_OPTIONS["MI2_OptSearchMaxLevel"] = 
{ text = "Макс"; help = "Максимальный уровень существа для поиска (должен быть < 66)"; }

MI2_OPTIONS["MI2_OptSearchNormal"] = 
{ text = "Обычный"; help = "Включает обычных существ в результаты поиска."; }

MI2_OPTIONS["MI2_OptSearchElite"] = 
{ text = "Элита"; help = "Включает элитных существ в результаты поиска."; }

MI2_OPTIONS["MI2_OptSearchBoss"] = 
{ text = "Босс"; help = "Включает боссов в результаты поиска."; }

MI2_OPTIONS["MI2_OptSearchMinLoots"] = 
{ text = "Мин"; help = "Минимальное количество раз было осмотренно существо."; }

MI2_OPTIONS["MI2_OptSearchMobName"] = 
{ text = "Существо"; help = "Сокращенное или полное название существа";
info = 'Оставьте пустым чтобы не ограничивать поиск определенных предметов\nВписание "*" выберет все предметы.'; }

MI2_OPTIONS["MI2_OptSearchItemName"] = 
{ text = "Предмет"; help = "Сокращенное или полное название предмета";
info = 'Оставьте пустым для поиска всех предметов'; }

MI2_OPTIONS["MI2_OptSortByValue"] = 
{ text = "Сорт. по добыче"; help = "Сортировать результат поиска по добыче с существ";
info = 'Сортирует существ по добыче, который вы получаете убивая их.'; }

MI2_OPTIONS["MI2_OptSortByItem"] = 
{ text = "Сорт. по числу предметов"; help = "Упорядочить результат поиска по числу предметов";
info = 'Сортирует существ по числу определенных предметов выпавших с него.'; }

MI2_OPTIONS["MI2_OptItemTooltip"] = 
{ text = "Список существ в подсказке предметов"; help = "Отображает названия существ в подсказке предметов, с которых падал предмет";
info = "Значение выпавших предметов отображается в штуках и процентах." }

MI2_OPTIONS["MI2_OptCompactMode"] = 
{ text = "Компактная подсказка существ"; help = "Включает компактную подсказку о существе в двух более компактных столбцах";
info = "Компактная подсказка использующая сокращения текстов во всплывающем окне.\nЧтобы отключить этот экран подсказок, обе линии должны быть отключены." }

MI2_OPTIONS["MI2_OptDisableMobInfo"] = 
{ text = "Отключение инфо. подсказок"; help = "Отключает информацию на экране подсказок";
info = "Полное отключение информации о существе и предмете." }

MI2_OPTIONS["MI2_OptShowClass"] = 
{ text = "Класс существа"; help = "Отобразить информацию о классе существа."; }

MI2_OPTIONS["MI2_OptShowHealth"] = 
{ text = "Здоровье"; help = "Отобразить информацию о здоровье существа (текущее/макс)"; }

MI2_OPTIONS["MI2_OptShowMana"] = 
{ text = "Мана"; help = "Отобразить информацию о мане/ярости/энергии существа (текущее/макс)"; }

MI2_OPTIONS["MI2_OptShowXp"] = 
{ text = "Опыт"; help = "Отображает кол-во очков опыта получаемое за убийство существа";
info = "Отображается последнее значение опыта что дали вам за существо.\n(не показывается если существо для вас серое)" }

MI2_OPTIONS["MI2_OptShowNo2lev"] = 
{ text = "До уровня"; help = "Отображает сколко надо убить существ до уровня";
info = "Показывает сколько таких существ вам\nнадо убить чтобы поднять уровень\n(не показывается если существо для вас серое)" }

MI2_OPTIONS["MI2_OptShowDamage"] = 
{ text = "Урон / УВС"; help = "Отображает наносимый существом урон (Мин/Макс) и УВС (урон в секунду)"; 
info = "Урон и УВС считается каждому персонажу отдельно.\nУВС обновляется постепенно с каждой схваткой." }

MI2_OPTIONS["MI2_OptShowCombined"] = 
{ text = "Объединенное Инфо"; help = "Отображает объединенную информацию в подсказке";
info = "Отображает информацию в подсказке что активен объединенный режим\nи перечисляет все уровни существа которые были объединены в подсказке." }

MI2_OPTIONS["MI2_OptShowKills"] = 
{ text = "Убито"; help = "Отображает сколько раз вы убили это существо";
info = "Каждому персонажу считается отдельно." }

MI2_OPTIONS["MI2_OptShowLoots"] = 
{ text = "Осмотрено"; help = "Отображает сколько раз существо было осмотренно."; }

MI2_OPTIONS["MI2_OptShowCloth"] = 
{ text = "Ткань"; help = "Отображает сколка было найдено ткани у существа."; }

MI2_OPTIONS["MI2_OptShowEmpty"] = 
{ text = "Без добычи"; help = "Отображает сколко пустых тел было осмотрено (число/проценты)";
info = "Показатель изменяется если вы осмотрели тело и оно\nбыло пустое, т.е. не было никакой добычи с существа." }

MI2_OPTIONS["MI2_OptShowTotal"] = 
{ text = "Стоимость"; help = "Отображает себестоимость существа";
info = "Берется средней цена предметов и среднее значение монет\nвыпавших с существа, плюсуются и делятся." }

MI2_OPTIONS["MI2_OptShowCoin"] = 
{ text = "Добыча монет"; help = "Отображает среднее выпадение монет с существа";
info = "Считаются все монеты с существа, плюсуются и делятся.\n(не показывается если значение монет 0)" }

MI2_OPTIONS["MI2_OptShowIV"] = 
{ text = "Цена предмета"; help = "Отображает среднюю цену предмета";
info = "Считаются все цены предметов с существа, плюсуются и делятся.\n(не показывается если значение 0)" }

MI2_OPTIONS["MI2_OptShowQuality"] = 
{ text = "Сведения о качестве добычи"; help = "Отображает счетчик качества добычи в процентах";
info = "Подсчитывается сколько предметов из 5 категорий выпало.\nКатегории с значением 0 не отображаются.\nПроцент - шанс получить предмет с той или иной категории при осмотре существа." }

MI2_OPTIONS["MI2_OptShowLocation"] = 
{ text = "Расположение существа"; help = "Отображает в какой местности вы можете найти существо";
info = "Необходимо чтобы была ВКЛЮЧЕНА запись местности."; }

MI2_OPTIONS["MI2_OptShowItems"] = 
{ text = "Список добычи предметов"; help = "Отображает названия и количество всех основных выпавших предметов";
info = "Основные предметы это все предметы за исключение ткани и кожи.\nНеобходимо чтобы была ВКЛЮЧЕНА запись выпадания предметов."; }

MI2_OPTIONS["MI2_OptShowClothSkin"] = 
{ text = "Добыча ткани и кожи"; help = "Отображает названия и количество всей ткани и кожи";
info = "Необходимо чтобы была ВКЛЮЧЕНА запись выпадания предметов."; }

MI2_OPTIONS["MI2_OptShowBlankLines"] = 
{ text = "Отображение пустых строк"; help = "Отображает пустые строки на экране подсказки";
info = "Пустые строки предназначены для лучшей чиемости." }

MI2_OPTIONS["MI2_OptShowResists"] = 
{ text = "Сопротивления и иммунитеты"; help = "Отображает иммунитет и сопротивления в подсказке";
info = "Записанные данные о сопротивлении и иммунитете\nдобавляются в подсказку." }

MI2_OPTIONS["MI2_OptCombinedMode"] = 
{ text = "Объединять одинаковых существ"; help = "Объединяет данные существ с одинаковыми именами";
info = "Режим объединения актуален для всех существ с одинаковыми именами но с разными уровнями.\nКогда включено, отображается индикатор в подсказке." }

MI2_OPTIONS["MI2_OptKeypressMode"] = 
{ text = "ALT клавиша для инфо о существе"; help = "Отображает подсказку, только после нажатия клавиши ALT."; }

MI2_OPTIONS["MI2_OptItemFilter"] = 
{ text = "Фильтр добываемых предметов"; help = "Установите фильтр для отображения добываемых предметов в подсказке";
info = "Показать только те предметы которые входят в текст фильтра.\nТ.е. впишите 'cloth', будут отображаться все предметы со значением\n'cloth' в имени предмета.\nДля просмотра всего, оставьте пустым." }

MI2_OPTIONS["MI2_OptSavePlayerHp"] = 
{ text = "Сохранить данные здоровья игроков"; help = "Хранение данных о здоровье игрока с PvP сражений.";
info = "Нормальные данные здоровье игрока с PvP боев сбрасывается после\nсеанса(т.е. после пере-захода в игру).\nУстановка этой опции позволяет вам сохранять эти данные.\n(но знайте, значение здоровья может меняться в зависимости\nот сметы уровня, одежды, навыков игроков)" }

MI2_OPTIONS["MI2_OptAllOn"] = 
{ text = "Все ВКЛ"; help = "Переключить все настройки в режим ВКЛЮЧЕНЫ."; }

MI2_OPTIONS["MI2_OptAllOff"] = 
{ text = "Все ВЫКЛ"; help = "Переключить все настройки в режим ВЫКЛЮЧЕНЫ."; }

MI2_OPTIONS["MI2_OptMinimal"] = 
{ text = "Минимум"; help = "Отобразить минимум информации о существе."; }

MI2_OPTIONS["MI2_OptDefault"] = 
{ text = "Стандартно"; help = "Выставить набор настроек MobInfo по умолчанию."; }

MI2_OPTIONS["MI2_OptBtnDone"] = 
{ text = "Закрыть"; help = "Закрыть диалог настроек MobInfo."; }

MI2_OPTIONS["MI2_OptStableMax"] = 
{ text = "Отображать максимальный запас здоровья"; help = "Отобразить максимум здоровья в окне цели";
info = "При использовании данной функции, максимальный запас здоровья существа\nникогда не будет изменяться во время боя."; }

MI2_OPTIONS["MI2_OptTargetHealth"] = 
{ text = "Отображать здоровье"; help = "Отображает значение здоровья в окне цели."; }

MI2_OPTIONS["MI2_OptTargetMana"] = 
{ text = "Отображать ману"; help = "Отображает значение маны в рамке цели."; }

MI2_OPTIONS["MI2_OptHealthPercent"] = 
{ text = "В процентах"; help = "Добавляет отображение процентов к здоровью в рамке цели."; }

MI2_OPTIONS["MI2_OptManaPercent"] = 
{ text = "В процентах"; help = "Добавляет отображение процентов к мане в рамке цели."; }

MI2_OPTIONS["MI2_OptHealthPosX"] = 
{ text = "По горизонтали"; help = "Регулировка позиции по горизонтали здоровья в рамке цели."; }

MI2_OPTIONS["MI2_OptHealthPosY"] = 
{ text = "По вертикали"; help = "Регулировка позиции по вертикали здоровья в рамке цели."; }

MI2_OPTIONS["MI2_OptManaPosX"] = 
{ text = "По горизонтали"; help = "Регулировка позиции по горизонтали маны в рамке цели."; }

MI2_OPTIONS["MI2_OptManaPosY"] = 
{ text = "По вертикали"; help = "Регулировка позиции по вертикали маны в рамке цели."; }

MI2_OPTIONS["MI2_OptTargetFont"] = 
{ text = "Шрифт"; help = "Устанавливает шрифт значения маны и здоровья в рамке цели";
choice1= "NumberFont"; choice2="GameFont"; choice3="ItemTextFont." }

MI2_OPTIONS["MI2_OptTargetFontSize"] = 
{ text = "Размер шрифта"; help = "Устанавливает размер шрифта маны и здоровья в рамке цели."; }

MI2_OPTIONS["MI2_OptClearTarget"] = 
{ text = "Удалить данные цели"; help = "Удалить данные текущей цели из БД."; }

MI2_OPTIONS["MI2_OptClearMobDb"] = 
{ text = "Удалить БД"; help = "Удалить содержимую информацию существ из БД."; }

MI2_OPTIONS["MI2_OptClearHealthDb"] = 
{ text = "Удалить БД"; help = "Удалить содержимую информацию о здоровье существ из БД."; }

MI2_OPTIONS["MI2_OptClearPlayerDb"] = 
{ text = "Удалить БД"; help = "Удалить содержимую информацию о здоровье игроков из БД."; }

MI2_OPTIONS["MI2_OptSaveItems"] = 
{ text = "Запись качества выпавших предметов:"; help = "Включает детальную запись выпавших предметов для всех существ.";
info = "Вы можете выбрать уровень качества предметов для записи."; }

MI2_OPTIONS["MI2_OptSaveBasicInfo"] = 
{ text = "Запись базовой информации"; help = "Запись набора базовой информации о существе.";
info = "Базовая информация включает в себя: тип существа, подсчет: добыча, пустая добыча, ткань, деньги, цена предметов и их качество."; }

MI2_OPTIONS["MI2_OptSaveCharData"] = 
{ text = "Запись данных существ для каждого персонажа"; help = "Запись всех данных о существах, производится для каждого персонажа отдельно.";
info = "Включает или выключает запись следующего:\nчисло убийств, мин/макс урон, УВС (урон в сек), Опыт\n\nЭти данные сохраняются каждому персонажу отдельно. Сохранение может\nбыть включено/выключено только для этих 4 значений."; }

MI2_OPTIONS["MI2_OptSaveLocation"] = 
{ text = "Запись данных с расположением существа"; help = "Запись местности и координат расположения, где можно найти существо." }

MI2_OPTIONS["MI2_OptSaveResist"] = 
{ text = "Запись данных об иммунитетах и сопротивлениях"; help = "Запись данных о сопротивлениях и иммунитетах школ заклинаний существа.";
info = "В школу заклинаний MobInfo записывает сколько заклинаний из школы\nбыли успешны в сравнении с числом сопротивления."; }

MI2_OPTIONS["MI2_OptItemsQuality"] = 
{ text = ""; help = "Запись данных выпавших предметов для выбранного качества.";
choice1 = "Серый и Лучше"; choice2="Белый и Лучше"; choice3="Зеленый & Лучше." }

MI2_OPTIONS["MI2_OptTrimDownMobData"] = 
{ text = "Минимизировать размер БД"; help = "Минимизировать размер БД за счет удаления избыточных данных.";
info = "Избыточные данные - все данные в пределах базы данных которые не отмечены для записи."; }

MI2_OPTIONS["MI2_OptImportMobData"] = 
{ text = "Начать импорт"; help = "Импорт внешней БД существ в вашу БД";
info = "ВАЖНО: пожалуйста прочтите инструкции импорта !\nВСЕГДА делайте резервную копию вашей БД ПЕРЕД импортом !."; }

MI2_OPTIONS["MI2_OptDeleteSearch"] = 
{ text = "УДАЛИТЬ"; help = "Удалить всех существ в результате поиска из Базы Данных MobInfo.";
info = "ПРЕДУПРЕЖДЕНИЕ: эта операция не может быть отменена.\nПожалуйста будьте осторожны в использовании!\nВы можете создать резервную копию БД перед удалением существ."; }

MI2_OPTIONS["MI2_OptImportOnlyNew"] = 
{ text = "Импорт только неизвестных существ"; help = "Импортирует только тех существ, которых нет в вашей БД";
info = "Активность этой опции оберегает от того что данные существующих записей существ\nне будут удалены или перезаписаны.\nТолько неизвестные (т.е. новые) существа будут импортированы.\nЭто позволяет от части наложить базу данных без всяких проблем."; }

MI2_OPTIONS["MI2_MainOptionsFrameTab1"] = 
{ text = "Подсказка"; help = "Установка настроек отображения информации о существах в подсказке."; }

MI2_OPTIONS["MI2_MainOptionsFrameTab2"] = 
{ text = "Здоровье/Мана"; help = "Установка настроек отображения здоровья/маны в рамке цели."; }

MI2_OPTIONS["MI2_MainOptionsFrameTab3"] = 
{ text = "База Данных"; help = "Настройки управления Базой Данных."; }

MI2_OPTIONS["MI2_MainOptionsFrameTab4"] = 
{ text = "Поиск"; help = "Поиск в Базе Данных."; }

MI2_OPTIONS["MI2_SearchResultFrameTab1"] = 
{ text = "Список существ"; help = ""; }

MI2_OPTIONS["MI2_SearchResultFrameTab2"] = 
{ text = "Список предметов"; help = ""; }

end