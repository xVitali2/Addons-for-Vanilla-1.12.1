
--[[ ----------------------------------------------------------------

		       Version : Russian ( by Maus ) CFM fix

-------------------------------------------------------------------]]

if( GetLocale() == "ruRU" ) then

-- Errors
-- -------
COESTR_NOTASHAMAN = "Вы не шаман. Выгружаю Зов Элементов";
COESTR_NOTOTEM = "Тотемы пока недоступны";
COESTR_UI_NOTASSIGNED = "<Текст не задан>";
COESTR_INVALIDELEMENT = "Неверный элемент задан в тотеме: ";


-- Notifications
-- --------------
COESTR_TOTEMWARNING = "%s истекает через %d секунд";
COESTR_TOTEMEXPIRED = "%s истек";
COESTR_TOTEMDESTROYED = "%s УНИЧТОЖЕН";
COESTR_SWITCHTOSET = "%s тотемсет активирован";
COESTR_FIXEDSETS = "Порядок установки тотемсетов фиксирован.";
COESTR_UDATEDSAVED = "Сохраненные данные обновлены ";
COESTR_FIXEDDISPLAY = "Ошибки в сохраненных данных исправлены.";
COESTR_TOTEMSRELOADED = "Тотемы перезагружены";
COESTR_RESTARTINGSET = "Активные сеты перезапущены";
COESTR_RESET = "Таймеры обнулены";
COESTR_HEALCOOLDOWN = " пока не готов!";
COESTR_NOHEALING = "Не нуждается в лечении";
COESTR_HEALING = "Лечение %s с %s (Уровень %d)";
COESTR_HEALLOWERRANK = "Недостаточно маны. Использую уровень %d";
COESTR_HEALOOM = "Недостаточно маны!";


-- String patterns
-- ----------------
COESTR_SCANTOTEMS = "отем";
COESTR_TOTEMTOOLS = "Инструменты: Тотем (.*)";
COESTR_TOTEMMANA = "Мана: (%d*)";
COESTR_TOTEMRANK = "Уровень (%d+)";
COESTR_MINUTEDURATION = "(%d%[%.,]%d%d) мин";
COESTR_MINUTEDURATION_INT = "(%d) мин";
COESTR_SECDURATION = "(%d%d?) сек";
COESTR_CASTBYNAME = "%(Уровень (%d)%)";
--COESTR_TOTEMDAMAGE = { ".+ [crh]+its (.+ Totem) ?%u* for (%d+).*" };
COESTR_TOTEMDAMAGE = { ".+ [crн]+аносит (Тотем .+) ?%u* (%d+) ед. урона" };
COESTR_TOTEMHEALTH = { "(%d*) здоровья" };
COESTR_SHOCKSPELL = "(%a* шок)";
COESTR_HEALINGWAVE = "Волна исцеления";
COESTR_LESSERWAVE = "Малая волна исцеления";
COESTR_MINAMOUNT = "(%d*) к";
COESTR_MAXAMOUNT = "к (%d*)";
COESTR_TRINKET = "^.*%[Влюбленный водный дух%].*$"; 
COESTR_TOTEMICRECALL = "Зов тотема" -- Need translation

-- Totem Advisor
-- --------------
COESTR_POISON = "Выведение яда";
COESTR_DISEASE = "Излечение болезни";
COESTR_TOTEMPOISON = "Тотем противоядия";
COESTR_TOTEMDISEASE = "Тотем очищения от болезней";
COESTR_TOTEMTREMOR = "Тотем трепета";
COESTR_CLEANSINGTOTEM = "Ставь %s !";

COESTR_TREMOR = {
	"Сон", "Запугивание", "Ментальный крик", "Контроль над разумом", "Раскатистый рев", "Страх",
	"Устрашающий крик", "Паника", "Ужасающий визг", "Соблазн",
	"Вой ужаса", "Устрашающий рык", "Хрустальный сон", "Друидская дремота"
}

-- Totems
-- -------------
COESTR_TOTEMEARTHBIND = "Тотем оков земли";
COESTR_TOTEMFLAMETONGUE = "Тотем языка пламени"; 
COESTR_TOTEMMAGMA = "Тотем магмы";
COESTR_TOTEMMANA_TIDE = "Тотем прилива маны";
COESTR_TOTEMSTONECLAW = "Тотем каменного когтя"; 
COESTR_TOTEMWINDFURY = "Тотем неистовства ветра";

-- Tools
-- ---------
COESTR_TOTEMTOOLS_EARTH = "земли";
COESTR_TOTEMTOOLS_FIRE = "огня";
COESTR_TOTEMTOOLS_WATER = "воды";
COESTR_TOTEMTOOLS_AIR = "воздуха";


-- Elements
-- ---------
COESTR_ELEMENT_EARTH = "Земля";
COESTR_ELEMENT_FIRE = "Огонь";
COESTR_ELEMENT_WATER = "Вода";
COESTR_ELEMENT_AIR = "Воздух";


-- UI elements
-- ------------
COEUI_STRINGS = {
COE_ConfigClose = "Закрыть";
COE_ConfigTotemTabPanel = "Опции тотемов";
COE_ConfigHealingTabPanel = "Опции лечения";
COE_ConfigDebuffTabPanel = "Опции дебафов";
COE_ConfigTotemTotemBar = "Тотембары";
COE_ConfigTotemTotemOptions = "Опции";
COE_ConfigTotemTotemSets = "Тотем сеты";
COE_OptionEnableTotemBar = "Включить тотембары";
COE_OptionHideBackdrop = "Спрятать фон при неактивном";
COE_OptionEnableTimers = "Включить тотем таймер";
COE_OptionEnableTimerNotifications = "Включить предупреждения";
COE_OptionTTAlignment = "Подсказка выравнивания";
COE_OptionDisplayMode = "Закрепить кнопки";
COE_OptionDisplayAlignment = "Выравнивание кнопок";
COE_OptionAdvisor = "Включить тотем помощь";
COE_OptionEnableSets = "Включить тотем сеты";
COE_OptionEnableAutoSwitch = "Автопереключение сетов в ПВП";
COE_OptionActiveSet = "Активный тотемсет";
COE_OptionNewSet = "Новый сет";
COE_OptionDeleteSet = "Удалить сет";
COE_OptionConfigureSet = "Настроить сет";
COE_OptionStopConfigureSet = "Ок";
COE_OptionCastOrderString = "Порядок заклинаний";
COE_OptionConfigureBar = "Ностройка тотемов";
COE_OptionFixBar = "Закрепить положение тотембаров";
COE_OptionConfigureOrder = "Настройка порядка";
COE_OptionScanTotems = "Перезагрузить тотемы";
COE_OptionCurrentFrame = "Настройка баров";
COE_OptionDirection = "Направление";
COE_OptionFrameMode = "Вид баров";
COE_OptionFlexCount = "неподвижные кнопки";
COE_OptionScaling = "Масштаб";
COE_OptionEnableTimerFrame = "Показать таймер в окне";
COE_OptionGroupBars = "Передвигать бары группой";
COE_OptionOverrideRank = "Ранк 1 модификатор";
COE_OptionFrameTimersOnly = "Показать таймер в том же окне";
}


-- Tooltips
-- ---------
COEUI_TOOLTIPS = {
COE_ConfigTotemTab = "Показывает опции тотемов";
COE_ConfigHealingTab = "Показывает опции лечения";
COE_ConfigDebuffTab = "Показывает опции дебаффов";
COE_OptionEnableTotemBar = "Позволяет и показывает,\n что тотем бар держит все ваши доступные\n тотемы для быстрого использования";
COE_OptionHideBackdrop = "Скрывает фон когда мышка\n выше бара тотема";
COE_OptionEnableTimers = "Позволяет показ остающегося \nвремени тотема, показанного \nв кнопке тотема";
COE_OptionEnableTimerNotifications = "Предупреждает, когда тотем\n истекает или разрушен";
COE_OptionAdvisor = "Уведомления показов, когда Вы или \nчлен вашей группы/рейда имеете дебафф,\n который может быть вылечен одним из \nваших тотемов ";
COE_OptionEnableAutoSwitch = "Автоматически переключается к набору тотема\n класса, когда выбран вражеский игрок";
COE_OptionFixBar = "Устанавливает положение бара тотема, \nчтобы предотвратить его перемещение ";
COE_OptionGroupBars = "Совместное перемещение баров";
}

COESTR_TRINKET_TOOLTIP = "Влюбленный водный дух";
COESTR_TRINKET_TOTEM = "Тотем древнего источника маны";

-- Combo boxes
-- ------------
COEUI_TTALIGN = {
{ "ANCHOR_TOPLEFT"; "Вверх влево" };
{ "ANCHOR_LEFT"; "Влево" };
{ "ANCHOR_BOTTOMLEFT"; "Вниз влево" };
{ "ANCHOR_TOPRIGHT"; "Вверх вправо" };
{ "ANCHOR_RIGHT"; "Вправо" };
{ "ANCHOR_BOTTOMRIGHT"; "Вниз вправо" };
{ "DISABLED"; "Отключено" };
}

COEUI_DISPLAYMODE = { "Настроить", "Только таймер", "Активные сеты" }
 
COEUI_DISPLAYALIGN = { "Бокс", "Вертикально", "Горизонтально" }

COEUI_PVPSETS = { "[PVP] Друид", "[PVP] Охотник", "[PVP] Маг", "[PVP] Паладин", "[PVP] Прист",
	"[PVP] Разбойник", "[PVP] Шаман", "[PVP] Чернокнижник", "[PVP] Воин" }
COEUI_DEFAULTSET = "Стандарт";

COEUI_OVERRIDERANK = { "Без кнопки", "С SHIFTом", "С ALTом", "С CTRLом" };

COEUI_CURRENTFRAME = { "Земля", "Огонь", "Вода", "Воздух" };

COEUI_DIRECTION = { "Вверх", "Вниз", "Влево", "Вправо" };

COEUI_FRAMEMODE = { "Закрытый", "Открытый", "Всплывающий", "Спрятаный" };


-- Key bindings
-- -------------
BINDING_HEADER_CALLOFELEMENTS = "Call Of Elements";
BINDING_NAME_COESHOWCONFIG = "Показать диалог настройки";
BINDING_NAME_COEBESTHEAL = "Лучшее лечение";
BINDING_NAME_COEBATTLEHEAL = "Боевое лечение";
BINDING_NAME_COETHROWADVISED = "Поставить следующий тотем";
BINDING_NAME_COENEXTSET = "Поставить следующий тотем сет ";
BINDING_NAME_COETHROWSET = "Поставить активный тотем сет";
BINDING_NAME_COERESTARTSET = "Перезапустить активный тотем сет";
BINDING_NAME_TOTEMEARTH1 = "Тотем земли #1";
BINDING_NAME_TOTEMEARTH2 = "Тотем земли #2";
BINDING_NAME_TOTEMEARTH3 = "Тотем земли #3";
BINDING_NAME_TOTEMEARTH4 = "Тотем земли #4";
BINDING_NAME_TOTEMEARTH5 = "Тотем земли #5";
BINDING_NAME_TOTEMFIRE1 = "Тотем огня #1";
BINDING_NAME_TOTEMFIRE2 = "Тотем огня #2";
BINDING_NAME_TOTEMFIRE3 = "Тотем огня #3";
BINDING_NAME_TOTEMFIRE4 = "Тотем огня #4";
BINDING_NAME_TOTEMFIRE5 = "Тотем огня #5";
BINDING_NAME_TOTEMWATER1 = "Тотем воды #1";
BINDING_NAME_TOTEMWATER2 = "Тотем воды #2";
BINDING_NAME_TOTEMWATER3 = "Тотем воды #3";
BINDING_NAME_TOTEMWATER4 = "Тотем воды #4";
BINDING_NAME_TOTEMWATER5 = "Тотем воды #5";
BINDING_NAME_TOTEMWATER6 = "Тотем воды #6";
BINDING_NAME_TOTEMAIR1 = "Тотем воздуха #1";
BINDING_NAME_TOTEMAIR2 = "Тотем воздуха #2";
BINDING_NAME_TOTEMAIR3 = "Тотем воздуха #3";
BINDING_NAME_TOTEMAIR4 = "Тотем воздуха #4";
BINDING_NAME_TOTEMAIR5 = "Тотем воздуха #5";
BINDING_NAME_TOTEMAIR6 = "Тотем воздуха #6";
BINDING_NAME_TOTEMAIR7 = "Тотем воздуха #7";


-- Key modifiers
-- --------------
COEMODIFIER_ALT = "ALT";
COEMODIFIER_ALT_SHORT = "A";
COEMODIFIER_CTRL = "CTRL";
COEMODIFIER_CTRL_SHORT = "C";
COEMODIFIER_SHIFT = "SHIFT";
COEMODIFIER_SHIFT_SHORT = "S";
COEMODIFIER_NUMPAD = "Num Pad";
COEMODIFIER_NUMPAD_SHORT = "NP";


-- Shell commands
-- ---------------
COESHELL_INTRO = "Доступные команды для Call of Elements:";
COESHELL_CONFIG = "'/coe' или'/coe config' - Показывает диалог настройки";
COESHELL_LIST = "'/coe list' - Показывает этот список";
COESHELL_NEXTSET = "'/coe nexset' - Переключает к следующему  сету тотемов или сету по умолчанию ";
COESHELL_PRIORSET = "'/coe priorset' - Переключает к предыдущему  сету тотемов или сету по умолчанию";
COESHELL_SET = "'/coe set <name>' - Переключает к сету с указанным названием <имя>";
COESHELL_RESTARTSET = "'/coe restartset' - В следующий раз, когда Вы бросаете активный сет, это переделывает все тотемы";
COESHELL_RESET = "'/coe reset' - Сброс всех таймеров и активных сетов";
COESHELL_RESETFRAMES = "'/coe resetframes' - Возвращает все бары к центру экрана";
COESHELL_RESETORDERING = "'/coe resetordering' - Сброс порядка в ваших тотем барах";
COESHELL_RELOAD = "'/coe reload' - Перезагружает все тотемы и сеты";
COESHELL_MACRONOTE = "Следующие команды только работают как макросы:";
COESHELL_THROWSET = "'/coe throwset' - Поставить активный тотем сет";
COESHELL_ADVISED = "'/coe advised' - Ставит следующий тотем";

end