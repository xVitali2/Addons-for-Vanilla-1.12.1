-------------------------------------------------------------------------------
-- Version : Russian ( by Maus )
-------------------------------------------------------------------------------
if (GetLocale() == "ruRU") then

SMARTBUFF_TTC_R = 1;
SMARTBUFF_TTC_G = 1;
SMARTBUFF_TTC_B = 1;
SMARTBUFF_TTC_A = 1;

SMARTBUFF_CONST_AUTOSOUND = "Deathbind Sound";
--SMARTBUFF_CONST_AUTOSOUND = "TaxiNodeDiscovered";
--SMARTBUFF_CONST_AUTOSOUND = "GLUECREATECHARACTERBUTTON";

SMARTBUFF_CONST_GROUP = "GROUP";
SMARTBUFF_CONST_SELF  = "SELF";
SMARTBUFF_CONST_FORCESELF = "FORCESELF";
SMARTBUFF_CONST_TRACK = "TRACK";
SMARTBUFF_CONST_WEAPON = "WEAPON";
SMARTBUFF_CONST_INV = "INVENTORY";

SMARTBUFF_BUFFTEXT = " Тест";

--[[
SystemFont 
GameFontNormal 
GameFontNormalSmall 
GameFontNormalLarge 
GameFontHighlight 
GameFontHighlightSmall 
GameFontHighlightSmallOutline 
GameFontHighlightLarge 
GameFontDisable 
GameFontDisableSmall 
GameFontDisableLarge 
GameFontGreen 
GameFontGreenSmall 
GameFontGreenLarge 
GameFontRed 
GameFontRedSmall 
GameFontRedLarge 
GameFontWhite 
GameFontDarkGraySmall 
NumberFontNormalYellow 
NumberFontNormalSmallGray 
QuestFontNormalSmall 
DialogButtonHighlightText
ErrorFont 
TextStatusBarText 
CombatLogFont 
NumberFontNormalLarge
NumberFontNormalHuge
]]--
SMARTBUFF_CONST_SPLASHFONT = "NumberFontNormalHuge";
 
-------------------------------------------------------------------------------
-- Russian localization
-------------------------------------------------------------------------------

-- Bindings
BINDING_NAME_SMARTBUFF_BIND_TRIGGER = "Триггер";
BINDING_NAME_SMARTBUFF_BIND_TARGET  = "Цель";
BINDING_NAME_SMARTBUFF_BIND_OPTIONS = "Меню опций";
BINDING_NAME_SMARTBUFF_BIND_RESETBUFFTIMERS = "Сбросить таймеры баффов";

-- Druid
SMARTBUFF_DRUID_CAT = "Облик кошки";
SMARTBUFF_DRUID_MOONKIN = "Облик лунного совуха";
SMARTBUFF_DRUID_TRACK = "Выслеживание гуманоидов";
SMARTBUFF_DRUID = { };
SMARTBUFF_DRUID[1] = {"Знак дикой природы", 30, SMARTBUFF_CONST_GROUP, {1,10,20,30,40,50,60}, "WPET", "Дар леса", 60, {50,60}, {"Лесные ягоды","Дикий шипокорень"}};
SMARTBUFF_DRUID[2] = {"Шипы", 10, SMARTBUFF_CONST_GROUP, {6,14,24,34,44,54}, "MAGE;PRIEST;WARLOCK;WPET;" .. SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[3] = {"Знамение ясности", 10, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[4] = {"Дубовая кожа", 0.25, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[5] = {"Хватка природы", 0.75, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[6] = {"Тигриное неистовство", 0.1, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_CAT};

-- Mage
SMARTBUFF_MAGE = { };
SMARTBUFF_MAGE[1] = {"Чародейский интеллект", 30, SMARTBUFF_CONST_GROUP, {1,14,28,42,56}, "ROGUE;WARRIOR;HPET;WPET", "Чародейская гениальность", 60, {56}, {"Порошок чар"}};
SMARTBUFF_MAGE[2] = {"Ледяной доспех", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[3] = {"Морозный доспех", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[4] = {"Магический доспех", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[5] = {"Ослабление магии", 10, SMARTBUFF_CONST_GROUP, {12,24,36,48,60}, "HPET;WPET"};
SMARTBUFF_MAGE[6] = {"Усиление магии", 10, SMARTBUFF_CONST_GROUP, {18,30,42,54}, "HPET;WPET"};
SMARTBUFF_MAGE[7] = {"Щит маны", 1, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[8] = {"Защита от огня", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[9] = {"Защита от магии льда", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[10] = {"Ледяная преграда", 1, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE_PATTERN = {"%a+ доспех$"};

-- Priest
SMARTBUFF_PRIEST = { };
SMARTBUFF_PRIEST[1] = {"Слово силы: Стойкость", 30, SMARTBUFF_CONST_GROUP, {1,12,24,36,48,60}, "WPET", "Молитва Стойкости", 60, {48,60}, {"Святая свеча","Священная свеча"}};
SMARTBUFF_PRIEST[2] = {"Защита от темной магии", 10, SMARTBUFF_CONST_GROUP, {30,42,56}, "WPET", "Молитва Защиты от темной магии", 20, {56}, {"Священная свеча"}};
SMARTBUFF_PRIEST[3] = {"Внутренний огонь", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[4] = {"Божественный дух", 30, SMARTBUFF_CONST_GROUP, {40,42,54,60}, "ROGUE;WARRIOR;HPET;WPET", "Молитва духа", 60, {60}, {"Священная свеча"}};
SMARTBUFF_PRIEST[5] = {"Слово силы: Щит", 0.5, SMARTBUFF_CONST_GROUP, {6,12,18,24,30,36,42,48,54,60}, "MAGE;WARLOCK;ROGUE;PALADIN;WARRIOR;DRUID;HUNTER;SHAMAN;HPET;WPET"};
SMARTBUFF_PRIEST[6] = {"Защита от страха", 10, SMARTBUFF_CONST_GROUP, {20}};
SMARTBUFF_PRIEST[7] = {"Благодать Элуны", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[8] = {"Ответная реакция", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[9] = {"Страж Тьмы", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[10] = {"Прикосновение слабости", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[11] = {"Внутреннее сосредоточение", -1, SMARTBUFF_CONST_SELF};

-- Warlock
SMARTBUFF_WARLOCK = { };
SMARTBUFF_WARLOCK[1] = {"Демонический доспех", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[2] = {"Шкура демона", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[3] = {"Бесконечное дыхание", 10, SMARTBUFF_CONST_GROUP, {16}, "HPET;WPET"};
SMARTBUFF_WARLOCK[4] = {"Обнаружение большой невидимости", 10, SMARTBUFF_CONST_GROUP, {50}, "HPET;WPET"};
SMARTBUFF_WARLOCK[5] = {"Обнаружение невидимости", 10, SMARTBUFF_CONST_GROUP, {38}, "HPET;WPET"};
SMARTBUFF_WARLOCK[6] = {"Обнаружения простой невидимости", 10, SMARTBUFF_CONST_GROUP, {26}, "HPET;WPET"};
SMARTBUFF_WARLOCK[7] = {"Связка души", 0, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK_PATTERN = {"%a+емон%a+", "^Обнаружение %a+ невидимости$"};

-- Hunter
SMARTBUFF_HUNTER = { };
SMARTBUFF_HUNTER[1] = {"Аура меткого выстрела", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[2] = {"Быстрая стрельба", 0.2, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[3] = {"Дух ястреба", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[4] = {"Дух обезьяны", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[5] = {"Дух дикой природы", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[6] = {"Дух зверя", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER_PATTERN = {"^Дух"};

-- Shaman
SMARTBUFF_SHAMAN = { };
SMARTBUFF_SHAMAN[1] = {"Щит молний", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[2] = {"Оружие Камнедробителя", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[3] = {"Оружие ледяного клейма", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[4] = {"Оружие языка пламени", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[5] = {"Оружие неистовства ветра", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[6] = {"Подводное дыхание", 10, SMARTBUFF_CONST_GROUP, {22}};

-- Warrior
SMARTBUFF_WARRIOR = { };
SMARTBUFF_WARRIOR[1] = {"Боевой крик", 2, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[2] = {"Ярость берсерка", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[3] = {"Кровавая ярость", 0.165, SMARTBUFF_CONST_SELF};

-- Rogue
SMARTBUFF_ROGUE = { };
SMARTBUFF_ROGUE[1]  = {"Шквал клинков", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[2]  = {"Мясорубка", 0.2, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[3]  = {"Ускользание", 0.2, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[4]  = {"Быстродействующий яд VI", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[5]  = {"Быстродействующий яд V", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[6]  = {"Быстродействующий яд IV", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[7]  = {"Быстродействующий яд III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[8]  = {"Быстродействующий яд II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[9]  = {"Быстродействующий яд", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[10] = {"Нейтрализующий яд IV", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[11] = {"Нейтрализующий яд III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[12] = {"Нейтрализующий яд II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[13] = {"Нейтрализующий яд", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[14] = {"Дурманящий яд III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[15] = {"Дурманящий яд II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[16] = {"Дурманящий яд", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[17] = {"Смертельный яд IV", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[18] = {"Смертельный яд III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[19] = {"Смертельный яд II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[20] = {"Смертельный яд", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[21] = {"Калечащий яд II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[22] = {"Калечащий яд", 30, SMARTBUFF_CONST_INV};

-- Paladin
SMARTBUFF_PALADIN = { };
SMARTBUFF_PALADIN[1] = {"Праведное неистовство", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[2] = {"Щит небес", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[3]  = {"Благословение могущества", 5, SMARTBUFF_CONST_GROUP, {4,12,22,32,42,52,60}, "DRUID;MAGE;PRIEST;SHAMAN;WARLOCK;WPET", "Великое благословение могущества", 15, {52,60}, {"Знак королей","Знак королей"} };
SMARTBUFF_PALADIN[4]  = {"Благословение мудрости", 5, SMARTBUFF_CONST_GROUP, {14,24,34,44,54,60}, "ROGUE;SHAMAN;WARRIOR;HPET;WPET", "Великое благословение мудрости", 15, {54,60}, {"Знак королей","Знак королей"} };
SMARTBUFF_PALADIN[5]  = {"Благословение спасения", 5, SMARTBUFF_CONST_GROUP, {26}, "SHAMAN;WARRIOR;HPET;WPET", "Великое благословение спасения", 15, {60}, {"Знак королей"} };
SMARTBUFF_PALADIN[6]  = {"Благословение королей", 5, SMARTBUFF_CONST_GROUP, {20}, "SHAMAN;WPET", "Великое благословение королей", 15, {60}, {"Знак королей"} };
SMARTBUFF_PALADIN[7]  = {"Благословение неприкосновенности", 5, SMARTBUFF_CONST_GROUP, {30,40,50,60}, "DRUID;HUNTER;MAGE;PRIEST;ROGUE;SHAMAN;WARLOCK;HPET;WPET", "Великое благословение неприкосновенности", 15, {60}, {"Знак королей"} };
SMARTBUFF_PALADIN[8]  = {"Благословение Света", 5, SMARTBUFF_CONST_GROUP, {40,50,60}, "SHAMAN;WPET", "Великое благословение Света", 15, {60}, {"Знак королей"} };
--SMARTBUFF_PALADIN[9]  = {"Blessing of Freedom", 0.165, SMARTBUFF_CONST_GROUP, {18}};
--SMARTBUFF_PALADIN[10] = {"Blessing of Protection", 1, SMARTBUFF_CONST_GROUP, {10,24,38}};
SMARTBUFF_PALADIN[9]  = {"Печать повиновения", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[10] = {"Печать ярости", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[11] = {"Печать справедливости", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[12] = {"Печать Cвета", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[13] = {"Печать праведности", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[14] = {"Печать мудрости", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[15] = {"Печать воина Cвета", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[16] = {"Аура благочестия", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[17] = {"Аура воздаяния", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[18] = {"Аура сосредоточенности", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[19] = {"Аура сопротивления темной магии", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[20] = {"Аура сопротивления магии льда", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[21] = {"Аура сопротивления огню", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[22] = {"Аура святости", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN_PATTERN = {"^Печать %a+"};


-- Stones and oils
SMARTBUFF_WEAPON = { };
SMARTBUFF_WEAPON[1]  = {"Грубое точило", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[2]  = {"Зернистое точило", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[3]  = {"Тяжелое точило", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[4]  = {"Твердое точило", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[5]  = {"Массивное точило", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[6]  = {"Точило стихий", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[7]  = {"Грубое грузило", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[8]  = {"Зернистое грузило", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[9]  = {"Тяжелое грузило", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[10] = {"Твердое грузило", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[11] = {"Массивное грузило", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[12] = {"Масло Тьмы", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[13] = {"Масло льда", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[14] = {"Слабое масло маны", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[15] = {"Простое масло маны", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[16] = {"Сверкающее масло маны", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[17] = {"Слабое волшебное масло", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[18] = {"Простое волшебное масло", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[19] = {"Волшебное масло", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[20] = {"Сверкающее волшебное масло", 30, SMARTBUFF_CONST_INV};

SMARTBUFF_WEAPON_STANDARD = {"Кинжалы", "топоры", "мечи", "дробящее", "Посохи", "Кистевое", "Древковое"};
SMARTBUFF_WEAPON_BLUNT = {"дробящее", "Посохи", "Кистевое"};
SMARTBUFF_WEAPON_BLUNT_PATTERN = "грузик$";
SMARTBUFF_WEAPON_SHARP = {"Кинжалы", "топоры", "мечи", "Древковое"};
SMARTBUFF_WEAPON_SHARP_PATTERN = "точило$";

-- Tracking
SMARTBUFF_TRACKING = { };
SMARTBUFF_TRACKING[1]  = {"Поиск минералов", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[2]  = {"Поиск трав", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[3]  = {"Поиск сокровищ", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[4]  = {"Выслеживание гуманоидов", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[5]  = {"Выслеживание животных", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[6]  = {"Выслеживание нежити", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[7]  = {"Выслеживание скрытого", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[8]  = {"Выслеживание элементалей", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[9]  = {"Выслеживание демонов", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[10] = {"Выслеживание великанов", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[11] = {"Выслеживание драконов", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[12] = {"Чутье на демонов", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[13] = {"Чутье на нежить", -1, SMARTBUFF_CONST_TRACK};

-- Racial
SMARTBUFF_RACIAL = { };
SMARTBUFF_RACIAL[1]  = {"Каменная форма", 0.133, SMARTBUFF_CONST_SELF}; -- Dwarv
SMARTBUFF_RACIAL[2]  = {"Внимательность", 0.333, SMARTBUFF_CONST_SELF}; -- Human
SMARTBUFF_RACIAL[3]  = {"Кровавое неистовство", 0.416, SMARTBUFF_CONST_SELF}; -- Orc
SMARTBUFF_RACIAL[4]  = {"Берсерк", 0.166, SMARTBUFF_CONST_SELF}; -- Troll
SMARTBUFF_RACIAL[5]  = {"Воля Отрекшихся", 0.083, SMARTBUFF_CONST_SELF}; -- Undead


-- Creature type
SMARTBUFF_HUMANOID  = "Гуманоид";
SMARTBUFF_DEMON     = "Демон";
SMARTBUFF_BEAST     = "Животное";
SMARTBUFF_DEMONTYPE = "Бес";

-- Classes
SMARTBUFF_CLASSES = {"Друид", "Охотник", "Маг", "Паладин", "Жрец", "Разбойник", "Шаман", "Чернокнижник", "Воин", "Питомец Охотника", "Прислужник Чернокнижника"};

-- Templates and Instances
SMARTBUFF_TEMPLATES = {"Соло", "Группа", "Рейд", "Поле битвы", "ОН", "Они", "ЛКТ", "АК", "ЗГ", "Своё 1", "Своё 2", "Своё 3", "Своё 4", "Своё 5"};
SMARTBUFF_INSTANCES = {"Огненные Недра", "Логово Ониксии", "Логово Крыла Тьмы", "Ан'Кираж", "Зул'Гуруб", "Альтеракская долина", "Низина Арати", "Ущелье Песни Войны"};

-- Mount
SMARTBUFF_MOUNT = "Скорость увеличена на (%d+)%%.";

-- Options Frame Text
SMARTBUFF_OFT                = "Вкл/Выкл";
SMARTBUFF_OFT_MENU           = "Меню опций";
SMARTBUFF_OFT_AUTO           = "Напоминалка";
SMARTBUFF_OFT_AUTOTIMER      = "Проверка таймера";
SMARTBUFF_OFT_AUTOCOMBAT     = "в бою";
SMARTBUFF_OFT_AUTOCHAT       = "Чат";
SMARTBUFF_OFT_AUTOSPLASH     = "Всплеск";
SMARTBUFF_OFT_AUTOSOUND      = "Звук";
SMARTBUFF_OFT_AUTOREST       = "Запретить в городе";
SMARTBUFF_OFT_HUNTERPETS     = "Баффать питомцев охотника";
SMARTBUFF_OFT_WARLOCKPETS    = "Баффать питомцев чернокнижника";
SMARTBUFF_OFT_ARULES         = "Расширенные правила";
SMARTBUFF_OFT_GRP            = "Баффать подгруппы рейда";
SMARTBUFF_OFT_SUBGRPCHANGED  = "Открыть меню опций";
SMARTBUFF_OFT_BUFFS          = "Баффы/Умения";
SMARTBUFF_OFT_TARGET         = "Баффать выбраную цель";
SMARTBUFF_OFT_DONE           = "Готово";
SMARTBUFF_OFT_APPLY          = "Применить";
SMARTBUFF_OFT_GRPBUFFSIZE    = "Без групбаффа";
SMARTBUFF_OFT_MESSAGES       = "Запретить сообщения";
SMARTBUFF_OFT_MSGNORMAL      = "обычные";
SMARTBUFF_OFT_MSGWARNING     = "предупреждения";
SMARTBUFF_OFT_MSGERROR       = "ошибки";
SMARTBUFF_OFT_HIDEMMBUTTON   = "Спрятать кнопку у карты";
SMARTBUFF_OFT_REBUFFTIMER    = "Таймер ребаффа";
SMARTBUFF_OFT_AUTOSWITCHTMP  = "Менять настройки";
SMARTBUFF_OFT_SELFFIRST      = "Сначала себя";
SMARTBUFF_OFT_SCROLLWHEEL    = "Баффать по колесу";
SMARTBUFF_OFT_TARGETSWITCH   = "смена цели";
SMARTBUFF_OFT_BUFFTARGET     = "Баффать цель";
SMARTBUFF_OFT_BUFFPVP        = "Баффать в PvP";
SMARTBUFF_OFT_AUTOSWITCHTMPINST = "Подземелья";
SMARTBUFF_OFT_CHECKCHARGES   = "Проверять заряды";
SMARTBUFF_OFT_RBT            = "Сброс БТ";
SMARTBUFF_OFT_BUFFINCITIES   = "Баффать в городе";
SMARTBUFF_OFT_CTRASYNC       = "Синхр. CTRA";
SMARTBUFF_OFT_ADVGRPBUFFCHECK = "Проверка группбаффа";
SMARTBUFF_OFT_ADVGRPBUFFRANGE = "Проверка расстояния";
SMARTBUFF_OFT_BLDURATION     = "Ч.список";

-- Options Frame Tooltip Text
SMARTBUFF_OFTT               = "Включает-выключает SmartBuff.";
SMARTBUFF_OFTT_AUTO          = "Включает-выключает напоминалку.";
SMARTBUFF_OFTT_AUTOTIMER     = "Задержка в секундах между двумя проверками.";
SMARTBUFF_OFTT_AUTOCOMBAT    = "Запускать провеку во время боя.";
SMARTBUFF_OFTT_AUTOCHAT      = "Показывать недостающие баффы в чате.";
SMARTBUFF_OFTT_AUTOSPLASH    = "Показывать недостающие баффы всплывающим сообщением в центре экрана.";
SMARTBUFF_OFTT_AUTOSOUND     = "Проигрывать звук при отсутствии нужных баффов.";
SMARTBUFF_OFTT_AUTOREST      = "Запретить напоминалку при нахождении в городе.";
SMARTBUFF_OFTT_HUNTERPETS    = "Баффать питомцев Охотника наравне с прочими.";
SMARTBUFF_OFTT_WARLOCKPETS   = "Баффать питомцев Чернокнижника, за исключением " .. SMARTBUFF_DEMONTYPE .. ".";
SMARTBUFF_OFTT_ARULES        = "Не кастовать:\n- Шипы на Магов, Жрецов и Чернокнижников\n- Чародейский интеллект на тех, у кого нет маны\n- Божественный дух на тех, у кого нет маны";
SMARTBUFF_OFTT_SUBGRPCHANGED = "Автоматически открывать меню опций SmartBuff,\nкогда вы меняете подгруппу.";
SMARTBUFF_OFTT_GRPBUFFSIZE   = "Сколько игроков без группового баффа должно\nбыть в группе, чтобы кастовать групповой бафф.";
SMARTBUFF_OFTT_HIDEMMBUTTON  = "Спрятать кнопку SmartBuff рядом с мини-картой.";
SMARTBUFF_OFTT_REBUFFTIMER   = "За сколько секунд до спадения баффа,\nнапоминака должна предупреждать.\n0 = Отключить";
SMARTBUFF_OFTT_SELFFIRST     = "Баффать сначала себя, потом других.";
SMARTBUFF_OFTT_SCROLLWHEEL   = "Баффать, когда вы прокручиваете колесо мыши вперёд\назад.";
SMARTBUFF_OFTT_TARGETSWITCH  = "Баффать при смене цели.";
SMARTBUFF_OFTT_BUFFTARGET    = "Сначала баффать цель,\nесли она дружественная.";
SMARTBUFF_OFTT_BUFFPVP       = "Баффать игроков с PvP флагом,\nдаже если на вас нет PvP флага.";
SMARTBUFF_OFTT_AUTOSWITCHTMP = "Автоматически менять набор настроек,\nесли меняется тип группы.";
SMARTBUFF_OFTT_AUTOSWITCHTMPINST = "Автоматически менять набор настроек,\nесли меняется подземелье.";
SMARTBUFF_OFTT_CHECKCHARGES  = "Показывать нехватку зарядов баффа\nпри падении ниже этого числа.\n0 = Отключить";
SMARTBUFF_OFTT_BUFFINCITIES  = "Баффать даже при нахождении в городе.\nЕсли на вас PvP флаг, баффает в любом случае.";
SMARTBUFF_OFTT_CTRASYNC      = "Активировать синхр. с CTRA\nРаботает только в рейдах.";
SMARTBUFF_OFTT_ADVGRPBUFFCHECK = "Продвинутая проверка баффов группы также учитывает\nодиночные баффы при проверке групповых.";
SMARTBUFF_OFTT_ADVGRPBUFFRANGE = "Продвинутая проверка расстояния группы проверяет,\n все ли члены группы в пределах досягаемости.";
SMARTBUFF_OFTT_BLDURATION    = "Сколько секунд игрок держится в чёрном списке.\n0 = Отключить";

-- Buffsetup Frame Text
SMARTBUFF_BST_SELFONLY       = "Только себя";
SMARTBUFF_BST_COMBATIN       = "В бою";
SMARTBUFF_BST_COMBATOUT      = "Вне боя";
SMARTBUFF_BST_MAINHAND       = "Правая рука";
SMARTBUFF_BST_OFFHAND        = "Левая рука";
SMARTBUFF_BST_REMINDER       = "Напоминалка";

-- Buffsetup Frame Tooltip Text
SMARTBUFF_BSTT_SELFONLY      = "Баффать только себя."; 
SMARTBUFF_BSTT_COMBATIN      = "Баффать если вы в бою.";
SMARTBUFF_BSTT_COMBATOUT     = "Баффать если вы не в бою.";
SMARTBUFF_BSTT_MAINHAND      = "Бафф на оружие правой руки.";
SMARTBUFF_BSTT_OFFHAND       = "Бафф на оружие левой руки.";
SMARTBUFF_BSTT_REMINDER      = "Показывать окошко напоминалки.";
SMARTBUFF_BSTT_REBUFFTIMER   = "За сколько секунд до спадения баффа,\nнапоминалка должна предупредить.\n0 = общий таймер проверки";

-- Messages
SMARTBUFF_MSG_LOADED         = "загружен";
SMARTBUFF_MSG_DISABLED       = "SmartBuff отключен!";
SMARTBUFF_MSG_SUBGROUP       = "Вы присоединились к новой группе, проверьте опции!";
SMARTBUFF_MSG_NOTHINGTODO    = "Нечего делать";
SMARTBUFF_MSG_BUFFED         = "- бафф наложен";
SMARTBUFF_MSG_OOR            = "вне зоны действия баффа!";
--SMARTBUFF_MSG_CD             = "has cooldown!";
SMARTBUFF_MSG_CD             = "Глобальный кулдаун!";
SMARTBUFF_MSG_CHAT           = "невозможно в режиме чата!";
SMARTBUFF_MSG_SHAPESHIFT     = "Нельзя колдовать в звероформе!";
SMARTBUFF_MSG_NOACTIONSLOT   = "для правильной работы необходим слот на панели действий!";
SMARTBUFF_MSG_GROUP          = "Группа";
SMARTBUFF_MSG_NEEDS          = "нуждается в баффе:";
SMARTBUFF_MSG_OOM            = "Не хватает маны/ярости/энергии!";
SMARTBUFF_MSG_STOCK          = "Имеющийся запас";
SMARTBUFF_MSG_NOREAGENT      = "Нехватка реагента:";
SMARTBUFF_MSG_DEACTIVATED    = "деактивировано!";
SMARTBUFF_MSG_REBUFF         = "Реббафф";
SMARTBUFF_MSG_LEFT           = "осталось";
SMARTBUFF_MSG_CLASS          = "Класс";
SMARTBUFF_MSG_CHARGES        = "зарядов";

end