--[[
	
	-- Atlas Data Alpha (Russian)
	-- Compiled by Lichery
	-- Last Update: 15.01.2017
	
--]]

local AL = AceLibrary("AceLocale-2.2"):new("Atlas");

if GetLocale() == "ruRU" then
	
	AtlasSortIgnore = {"the (.+)"};
	
	BINDING_HEADER_ATLAS_TITLE = "Atlas"
	BINDING_NAME_ATLAS_TOGGLE  = "Открыть/Закрыть";
	BINDING_NAME_ATLAS_OPTIONS  = "Настройки Atlas";
	BINDING_NAME_ATLAS_AUTOSEL  = "Автоматический выбор поздемелья";
	
	ATLAS_SUBTITLE = "Обозреватель карт подземелий";
	ATLAS_DESC = "Атлас это обозреватель карт подземелий.";
	
	ATLAS_STRING_LOCATION = "Расположение";
	ATLAS_STRING_LEVELRANGE = "Диапазон уровней";
	ATLAS_STRING_PLAYERLIMIT = "Лимит игроков";
	ATLAS_STRING_SELECT_CAT = "Выбор категории";
	ATLAS_STRING_SELECT_MAP = "Выбор карты";
	ATLAS_STRING_SEARCH = "Поиск";
	ATLAS_STRING_CLEAR = "Сбросить";
	ATLAS_STRING_MINLEVEL = "Минимальный уровень";
	
	ATLAS_OPTIONS_BUTTON = "Настройки";
	ATLAS_OPTIONS_SHOWBUT = "Показывать кнопку на мини-карте";
	ATLAS_OPTIONS_AUTOSEL = "Автоматический выбор поздемелья";
	ATLAS_OPTIONS_BUTPOS = "Расположение кнопки";
	ATLAS_OPTIONS_TRANS = "Прозрачность";
	ATLAS_OPTIONS_DONE = "Готово";
	ATLAS_OPTIONS_RCLICK = "Правая кнопка мыши для показа карты мира";
	ATLAS_OPTIONS_SHOWMAPNAME = "Отображать имя карты";
	ATLAS_OPTIONS_RESETPOS = "Сбросить позиции";
	ATLAS_OPTIONS_ACRONYMS = "Отображать короткие названия";
	ATLAS_OPTIONS_SCALE = "Размер";
	ATLAS_OPTIONS_BUTRAD = "Радиус расположения кнопки";
	ATLAS_OPTIONS_CLAMPED = "Не заходить за размеры экрана";
	ATLAS_OPTIONS_HELP = "Перемещение этого окна - левая клавиша мыши";
	
	ATLAS_BUTTON_TOOLTIP_TITLE = "Атлас";
	ATLAS_BUTTON_TOOLTIP_HINT = "Нажмите левую клавишу мыши, чтобы открыть Атлас.\nНажмите среднюю клавишу мыши, чтобы открыть настройки Атласа.\nНажмите правую клавишу мыши для перемещения кнопки Атласа.";
	ATLAS_TITAN_HINT = "Нажмите левую клавишу мыши, чтобы открыть Атлас.\nНажмите среднюю клавишу мыши, чтобы открыть настройки Атласа.\nНажмите правую клавишу мыши для вывода меню.";
	
	ATLAS_OPTIONS_CATDD = "Сортировать подземелья по:";
	ATLAS_DDL_CONTINENT = "Контитенту";
	ATLAS_DDL_CONTINENT_EASTERN = "Подземелья Восточных королевств";
	ATLAS_DDL_CONTINENT_KALIMDOR = "Подземелья Калимдора";
	ATLAS_DDL_LEVEL = "Уровню";
	ATLAS_DDL_PARTYSIZE = "Размеру группы";
	ATLAS_DDL_PARTYSIZE_5 = "Подземелья на 5 игроков";
	ATLAS_DDL_PARTYSIZE_10 = "Подземелья на 10 игроков";
	ATLAS_DDL_PARTYSIZE_20 = "Подземелья на 20 игроков";
	ATLAS_DDL_PARTYSIZE_40 = "Подземелья на 40 игроков";
	ATLAS_DDL_ALL = "Все";
	ATLAS_DDL_ALL_MENU = "Показаны все подземелья";
	ATLAS_DDL_TYPE = "Типу";
	ATLAS_DDL_TYPE_DUNGEONS = "Подземелья";
	ATLAS_DDL_TYPE_RAIDS = "Рейды";
	ATLAS_DDL_WORLDBOSSES = "Места внешних рейдовых схваток";
	ATLAS_DDL_TYPE_ENTRANCE = "Карты входов";
	ATLAS_DDL_BGS = "Поля боя";
	ATLAS_DDL_DUNGEON_LOCATIONS = "Карта подземелий";
	ATLAS_DDL_FLIGHT_PATHS = "Маршруты полётов";
	ATLAS_DDL_LEVELING_GUIDE = "Руководство по разравитию";
	ATLAS_DDL_LEVELING_GUIDE_ALLIANCE1 = "Руководство по разравитию Альянса Часть 1";
	ATLAS_DDL_LEVELING_GUIDE_ALLIANCE2 = "Руководство по разравитию Альянса Часть 2";
	ATLAS_DDL_LEVELING_GUIDE_HORDE1 = "Руководство по разравитию Орды Часть 1";
	ATLAS_DDL_LEVELING_GUIDE_HORDE2 = "Руководство по разравитию Орды Часть 2";
	
	ATLAS_INSTANCE_BUTTON = "Подземелье";
	ATLAS_ENTRANCE_BUTTON = "Вход";
	ATLAS_SEARCH_UNAVAIL = "Поиск недоступен";
	
	AtlasZoneSubstitutions = {
		["The Temple of Atal'Hakkar"]	= "Затонувший храм";
	}; 
end	

AL:RegisterTranslations("ruRU", function() return {
	
	--************************************************
	-- Zone Names, Acronyms, and Common Strings
	--************************************************
	
	--Common strings
	["Atlas Options"] = "Настройки Atlas";
	--Colors
	["Blue"] = "Голубой";
	["Purple"] = "Пурпурный";
	["Red"] = "Красный";
	["Orange"] = "Оранжевый";
	["White"] = "Белый";
	--Mobs types
	["Boss"] = "Босс";
	["Rare"] = "Редкий";
	["Bat"] = "Мышь";
	["Snake"] = "Змея";
	["Raptor"] = "Ящер";
	["Spider"] = "Паук";
	["Tiger"] = "Тигр";
	["Panther"] = "Пантера";
	["Pet"] = "Питомец",
	["Engineer"] = "Инженер",
	--Magic types
	["Fire"] = "Огонь";
	["Nature"] = "Силы природы";
	["Frost"] = "Лёд";
	["Shadow"] = "Тьма";
	["Arcane"] = "Тайная магия";
	--Events
	["Hallow's End"] = "Тыквовин";
	["Scourge Invasion"] = "Вторжение Плети";
	["Lunar Festival"] = "Лунный Фестиваль";
	--Other			
	["East"] = "Восток";
	["North"] = "Север";
	["South"] = "Юг";
	["West"] = "Запад";		
	["Battlegrounds"] = "Поля боя";		
	["Lower"] = "Снизу";	
	["Upper"] = "Сверху";		
	["Entrance"] = "Вход";
	["Exit"] = "Выход";		
	["Chase Begins"] = "Начало";
	["Chase Ends"] = "Конец";		
	["AKA"] = "Другое название";
	["Attunement Required"] = "Требуется Аттунемент";
	["Back"] = "Назад";
	["Back1"] = "Запасной";
	["Blacksmithing Plans"] = "Чертежи кузнечного дела";	
	["Brazier of Invocation"] = "Жаровня Вызова";
	["Connection"] = "Соединение";
	["Connections"] = "Соединения";
	["Damage: "] = "Урон: ";
	["Тier 0.5 Summon"] = "Тир 0.5 призыв";
	["Dungeon Locations"] = "Зоны подземелий";
	["Elevator"] = "Лифт";
	["Front"] = "Главный";
	["Ghost"] = "Призрак";
	["Instances"] = "Подземелья";
	["Key"] = "Ключ";
	["Meeting Stone"] = "Камень встреч";
	["Moonwell"] = "Лунный колодец";
	["Neutral"] = "Нейтральный"; -- NPC reaction!
	["Optional"] = "Необязательный";
	["Outside"] = "Снаружи";
	["Portal"] = "Портал";
	["Random"] = "Случайный";
	["Reputation"] = "Репутация";
	["Rescued"] = "Спасенный";
	["Side"] = "Боковой";
	["Summon"] = "Вызов";
	["Teleport"] = "Телепорт";
	["through "] = "через ";
	["Trash Mobs"] = "Существа";
	["Unknown"] = "Неизвестно";
	["Varies"] = "Меняется";
	["Various"] = "Различное";
	["Wanders"] = "Ходит";
	
	--Instance names and acronyms
	["Armory"] = "Оружейная";
	["Cathedral"] = "Собор";
	["Graveyard"] = "Кладбище";
	["Library"] = "Библиотека";
	["Sunken Temple"] = "Затонувший храм";
	
	--Set names
	["Set: "] = "Комплект: ";
	["Tier 0/0.5 Sets"] = "Комплекты Тир 0/0.5";
	["Zul'Gurub Sets"] = "Комплекты Зул'Гуруба";
	["Zul'Gurub Ring Sets"] = "Комплекты колец Зул'Гуруба";
	["Ruins of Ahn'Qiraj Sets"] = "Комплекты из Руин Ан'Киража";
	["Temple of Ahn'Qiraj Sets"] = "Комплекты из Храма Ан'Киража";
	["Tier 1 Sets"] = "Комплекты Тир 1";
	["Tier 2 Sets"] = "Комплекты Тир 2";
	["Tier 3 Sets"] = "Комплекты Тир 3";
	
	--************************************************
	-- Kalimdor Instance Data
	--************************************************
	
	--Ragefire Chasm
	["Oggleflint"] = "Огглфлинт";
	
	--Wailing Caverns
	["Disciple of Naralex"] = "Послушник Наралекса";
	["Mysterious Wailing Caverns Chest"] = "Таинственный сундук Пещер Стенаний";
	
	--Blackfathom Deeps
	["Lorgalis Manuscript"] = "Манускрипт Лоргалиса";
	["Argent Guard Thaelrid"] = "Страж Талрид из ордена Серебряного Рассвета";
	["Shrine of Gelihast"] = "Святилище Гелихаста";
	["Fathom Stone"] = "Глубинный сердечник";
	["Morridune"] = "Морридан";
	["Altar of the Deeps"] = "Алтарь Глубин";
	
	--Razorfen Kraul
	["Razorfen Spearhide"] = "Копьешкур из племени Иглошкурых";
	["Willix the Importer"] = "Импортер Вилликс";
	["Heralath Fallowbrook"] = "Гералат Бурый Ручей";
	
	--Razorfen Downs
	["Henry Stern"] = "Генри Штерн";
	["Belnistrasz"] = "Белнистраз";
	["Sah'rhee"] = "Сах-ри";
	
	--Zul'Farrak
	["Mallet of Zul'Farrak"] = "Молот Зул'Фаррака";
	["Theka the Martyr"] = "Тека Мученик";
	["Zul'Farrak Dead Hero"] = "Мертвый герой Зул'Фаррака";
	["Nekrum Gutchewer"] = "Некрум Кишкожуй";
	["Dustwraith"] = "Пыльный призрак";
	["Sergeant Bly"] = "Сержант Блай";
	["Weegli Blastfuse"] = "Вигиль Фитиль";
	["Murta Grimgut"] = "Мурта Мрачнобрюх";
	["Raven"] = "Ворона";
	["Oro Eyegouge"] = "Оро Вырвиглаз";
	["Sandfury Executioner"] = "Палач из клана Песчаной Бури";
	["Hydromancer Velratha"] = "Гидромант Велрата";
	["Elder Wildmane"] = "Предок Буйногривая";
	["Zerillis"] = "Зериллис";
	["Sandarr Dunereaver"] = "Сандарр Разоритель Барханов";
	
	--Maraudon	
	["Scepter of Celebras"] = "Скипетр Келебраса";
	["Veng"] = "Венг";
	["Maraudos"] = "Мародос";
	["Elder Splitrock"] = "Предок Камнещеп";
	
	--Dire Maul (East)
	["Old Ironbark"] = "Древень Железная Кора";
	["A Dusty Tome"] = "Пыльный фолиант";
	["Felvine Shard"] = "Осколок сквернита";
	["Dire Maul Books"] = "Книги Забытого Города";
	
	--Dire Maul (North)
	["Crescent Key"] = "Серповидный ключ";--omitted from Dire Maul (West)
	["Gordok Courtyard Key"] = "Ключ от внутреннего двора Гордока";
	["Gordok Inner Door Key"] = "Ключ от внутренней двери Гордока";
	--"Library" omitted from here and DM West because of SM: "Library" duplicate
	["Stomper Kreeg"] = "Топотун Криг";
	["Knot Thimblejack"] = "Уззл Наперстяк";
	["Tribute Run"] = "Заход почести";
	
	--Dire Maul (West)
	["J'eevee's Jar"] = "Флакон Д'жииви";
	["Pylons"] = "Пилоны";
	["Shen'dralar Ancient"] = "Прародительница Шен'дралар";
	["Ancient Equine Spirit"] = "Дух древнего коня";
	["Ferra"] = "Ферра";
	["The Prince's Chest"] = "Сундук принца";
	["Falrin Treeshaper"] = "Фалрин Садовник";
	["Lorekeeper Lydros"] = "Сказитель Лидрос";
	["Lorekeeper Javon"] = "Сказитель Явон";
	["Lorekeeper Kildrath"] = "Сказитель Килдрат";
	["Lorekeeper Mykos"] = "Сказительница Микос";
	["Shen'dralar Provisioner"] = "Шен'драларский поставщик";
	["Skeletal Remains of Kariel Winthalus"] = "Скелет Кариэля Винтхалуса";
	
	--Onyxia's Lair
	["Drakefire Amulet"] = "Амулет Пламени дракона";
	["Onyxian Warders"] = "Хранители Ониксии";
	["Whelp Eggs"] = "Яйца";
	
	--Temple of Ahn'Qiraj
	["Bug Trio"] = "Тройка";
	["Andorgos"] = "Андоргос";
	["Vethsera"] = "Ветсера";
	["Kandrostrasz"] = "Кандострас";
	["Arygos"] = "Аригос";
	["Caelestrasz"] = "Келестраз";
	["Merithra of the Dream"] = "Меритра из Сна";
	["AQ Enchants"] = "Наложения чар из Ан'Киража";
	["AQ Opening Quest Chain"] = "Завершение цепочки заданий АК";
	
	--Ruins of Ahn'Qiraj
	["Four Kaldorei Elites"] = "Четыре кальдорайских гвардейцев";
	["Captain Qeez"] = "Капитан Квиз";
	["Captain Tuubid"] = "Капитан Туубид";
	["Captain Drenn"] = "Капитан Дренн";
	["Captain Xurrem"] = "Капитан Ксуррем";
	["Major Yeggeth"] = "Майор Йеггет";
	["Major Pakkon"] = "Майор Паккон";
	["Colonel Zerran"] = "Полковник Зерран";
	["Safe Room"] = "Безопасная Комната";
	["Class Books"] = "Классовые книги";
	
	--****************************
	-- Eastern Kingdoms Instances
	--****************************
	
	--Blackrock Depths
	["Shadowforge Key"] = "Ключ Тенегорна";
	["Prison Cell Key"] = "Ключ от тюремной камеры";
	["Jail Break!"] = "Побег!";
	["Banner of Provocation"] = "Знамя Вызова";
	["Kharan Mighthammer"] = "Каран Могучий Молот";
	["Commander Gor'shak"] = "Командир Гор'шак";
	["Marshal Windsor"] = "Маршал Винздор";
	["Ring of Law"] = "Круг закона";
	["Theldren"] = "Телдрен";
	["Lefty"] = "Левша";
	["Malgen Longspear"] = "Мальген Длинное Копье";
	["Gnashjaw"] = "Зубощелк";
	["Korv"] = "Корв";
	["Rezznik"] = "Реззник";
	["Rotfang"] = "Гнилоклык";
	["Snokh Blackspine"] = "Снокх Черный Хребет";
	["Va'jashni"] = "Ва'джашни";
	["Volida"] = "Волида";
	["Elder Morndeep"] = "Предок Утренний Туман";
	["High Justice Grimstone"] = "Верховный судья Мрачнокамень";
	["Monument of Franclorn Forgewright"] = "Монумент Франклорну Искуснику";
	["The Vault"] = "Свод";
	["The Black Anvil"] = "Черная наковальня";
	["Shadowforge Lock"] = "Замок Кузни Теней";
	["Field Repair Bot 74A"] = "Полевой ремонтный робот 74A";
	["The Grim Guzzler"] = "Угрюмые обжоры";
	["Lokhtos Darkbargainer"] = "Локтос Зловещий Торговец";
	["Mistress Nagmara"] = "Госпожа Нагмара";
	["Plugger Spazzring"] = "Штоппор Наливалс";
	["Private Rocknot"] = "Рядовой Камнеузл";
	["Summoner's Tomb"] = "Гробница Призывателей";
	["Chest of The Seven"] = "Сундук Семерых";
	["The Lyceum"] = "Лекторий";
	["High Priestess of Thaurissan"] = "Верховная жрица Тауриссана";
	["The Black Forge"] = "Черная Кузня";
	["Core Fragment"] = "Осколок из Огненных Недр";
	
	--Blackrock Spire (Lower)
	["Vaelan"] = "Ваелан";
	["Warosh"] = "Варош";
	["Elder Stonefort"] = "Предок Камнеград";
	["Roughshod Pike"] = "Копье грубой силы";
	["Spirestone Butcher"] = "Мясник из клана Черной Вершины";
	["Spirestone Battle Lord"] = "Полководец из клана Черной Вершины";
	["Spirestone Lord Magus"] = "Лорд-волхв из клана Черной Вершины";
	["Fifth Mosh'aru Tablet"] = "Пятая табличка Мошару";
	["Bijou"] = "Блестяшка";
	["Sixth Mosh'aru Tablet"] = "Шестая табличка Мошару";
	["Bijou's Belongings"] = "Вещи Блестяшки";
	["Human Remains"] = "Человеческие останки";
	["Unfired Plate Gauntlets"] = "Неопалимые латные рукавицы";
	["Urok's Tribute Pile"] = "Груда приношений Арроку";
	["Burning Felguard"] = "Пылающий страж Скверны";
	
	--Blackrock Spire (Upper)
	["Seal of Ascension"] = "Печать вознесения";
	["Father Flame"] = "Огонь отцов";
	["Darkstone Tablet"] = "Табличка Темного Камня";
	["Doomrigger's Coffer"] = "Металлический ящик Рокового Зажима";
	["Awbee"] = "Ауби";
	["Finkle Einhorn"] = "Айс Вентурон";
	["Drakkisath's Brand"] = "Клеймо Драккисата";
	
	--Blackwing Lair
	["Draconic for Dummies"] = "Драконий язык для чайников";
	["Master Elemental Shaper Krixix"] = "Ваятель стихий Криксикс";
	["Alchemy Lab"] = "Алхимическая лаборатория";
	
	--Gnomeregan
	["Workshop Key"] = "Ключ от мастерской";
	["Blastmaster Emi Shortfuse"] = "Взрывник Ими Фитилюшка";
	["Clean Room"] = "Чистая комната";
	["Tink Sprocketwhistle"] = "Звяк Пружиносвист";
	["The Sparklematic 5200"] = "Чистер 5200";
	["Mail Box"] = "Почтовый ящик";
	["Kernobee"] = "Керноби";
	["Alarm-a-bomb 2600"] = "Тревого-бомба 2600";
	["Matrix Punchograph 3005-B"] = "Матричный перфограф 3005-B";
	["Matrix Punchograph 3005-C"] = "Матричный перфограф 3005-C";
	["Matrix Punchograph 3005-D"] = "Матричный перфограф 3005-D";
	
	--Molten Core
	["Aqual Quintessence"] = "Квинтэссенция воды";
	["Eternal Quintessence"] = "Вечная квинтэссенция";
	["Random Boss Loot"] = "Случайная добыча боссов";
	
	--Naxxramas
	["Archmage Tarsis Kir-Moldir"] = "Верховный маг Тарсис Кир-Молдир";
	["Mr. Bigglesworth"] = "Мистер Бигглсуорт";
	["Abomination Wing"] = "Квартал Мерзости";
	["Spider Wing"] = "Паучий квартал";
	["Deathknight Wing"] = "Военный квартал";
	["Four Horsemen Chest"] = "Сундук Четырех Всадников";
	["Plague Wing"] = "Чумной квартал";
	["Frostwyrm Lair"] = "Логово ледяного змея";
	
	--SM: Library
	["Doan's Strongbox"] = "Сейф Доана";
	
	--SM: Armory
	["The Scarlet Key"] = "Алый ключ";--omitted from SM: Cathedral
	
	--SM: Graveyard
	["Vorrel Sengutz"] = "Воррел Сенгутц";
	
	--Scholomance
	["Skeleton Key"] = "Отмычка";
	["Viewing Room Key"] = "Ключ от смотровой";
	["Viewing Room"] = "Смотровая";
	["Blood of Innocents"] = "Кровь невинных";
	["Divination Scryer"] = "Гадальный кристалл";
	["Blood Steward of Kirtonos"] = "Кровавая прислужница Киртоноса";
	["The Deed to Southshore"] = "Документы на Южнобережье";
	["Journal of Jandice Barov"] = "Дневник Джандис Баровой";
	["The Deed to Tarren Mill"] = "Документы на Мельницу Таррен";
	["The Deed to Brill"] = "Документы на Брилл";
	["The Deed to Caer Darrow"] = "Документы на Каэр Дарроу";
	["Torch Lever"] = "Факел-рычаг";
	["Old Treasure Chest"] = "Старый сундук с сокровищами";
	
	--Shadowfang Keep
	["Sorcerer Ashcrombe"] = "Колдун Ашкромб";
	["Deathstalker Adamant"] = "Страж смерти Адамант";
	["Landen Stilwell"] = "Landen Stilwell";
	["Deathstalker Vincent"] = "Страж смерти Эрланд Винсент";
	["Fel Steed"] = "Конь скверны";
	["Jordan's Hammer"] = "Молот Джордана";
	["Crate of Ingots"] = "Ящик со слитками";
	["Arugal's Voidwalker"] = "Демон Бездны Аругала";
	["The Book of Ur"] = "Книга Ура";
	
	--Stratholme
	["Key to the City"] = "Ключ от города";
	["Various Postbox Keys"] = "Различные почтовые ключи";
	["Living Side"] = "Живая сторона";
	["Undead Side"] = "Мертвая сторона";
	["Stratholme Courier"] = "Стратхольмский курьер";
	["Fras Siabi"] = "Фрас Сиаби";
	["Atiesh"] = "Атиеш";
	["Elder Farwhisper"] = "Предок Тихий Шепот";
	["Malor's Strongbox"] = "Сейф Малора";
	["Crimson Hammersmith"] = "Молотобоец из Багрового Легиона";
	["Grand Crusader Dathrohan"] = "Верховный рыцарь Датрохан";
	["Aurius"] = "Аурий";
	["Black Guard Swordsmith"] = "Оружейник Черной Стражи";
	["Ysida Harmon"] = "Исида Хармон";
	["Crusaders' Square Postbox"] = "Ящик для писем на Площади рыцарей";
	["Market Row Postbox"] = "Ящик для писем Торгового ряда";
	["Festival Lane Postbox"] = "Праздничная улица, ящик для писем";
	["Elders' Square Postbox"] = "Ящик для писем площади Старейшин";
	["King's Square Postbox"] = "Ящик для писем Королевской Площади";
	["Fras Siabi's Postbox"] = "Ящик для писем Фраса Сиаби";
	["Third Postbox Opened"] = "Третий открытый почтовый ящик";
	
	--The Deadmines
	["Sneed's Shredder"] = "Крошшер Снида";
	["Defias Gunpowder"] = "Порох Братства Справедливости";
	
	--The Sunken Temple
	["Yeh'kinya's Scroll"] = "Свиток Йе'кинья";
	["Balcony Minibosses"] = "Балконы минибоссов";
	["Altar of Hakkar"] = "Алтарь Хаккара";
	["Essence Font"] = "Купель сущности";
	["Spawn of Hakkar"] = "Порождение Хаккара";
	["Elder Starsong"] = "Предок Песнь Звезд";
	["Statue Activation Order"] = "Статуя активации";
	["Malfurion Stormrage"] = "Малфурион Ярость Бури";
	
	--Uldaman
	["Staff of Prehistoria"] = "Посох древнейшей истории";
	["Baelog's Chest"] = "Сундук Бейлога";
	["Conspicuous Urn"] = "Подозрительная урна";
	["Remains of a Paladin"] = "Останки паладина";
	["Annora"] = "Аннора";
	["Tablet of Will"] = "Табличка воли";
	["Shadowforge Cache"] = "Тайник Тенегорна";
	["The Discs of Norgannon"] = "Диски Норганнона";
	["Ancient Treasure"] = "Древнее сокровище";
	
	--Zul'Gurub
	["Mudskunk Lure"] = "Наживка на грязнотинника";
	["Gurubashi Mojo Madness"] = "Амулет безумия Гурубаши";
	["Zanza the Restless"] = "Занза Неупокоенный";
	["Ohgan"] = "Охган";
	["Edge of Madness"] = "Грань Безумия";
	["Zealot Zath"] = "Ревнитель Зат";
	["Zealot Lor'Khan"] = "Ревнитель Лор'Кхан";
	["Muddy Churning Waters"] = "Грязный водоворот";
	["Jinxed Hoodoo Pile"] = "Груда зачарованных худу";
	["ZG Enchants"] = "Наложения чар из Зул'Гуруба";		
	
	--************************************************
	-- Instance Entrance Maps
	--************************************************
	
	--Blackrock Mountain (Entrance)
	["Bodley"] = "Бодли";
	["Overmaster Pyron"] = "Подчинитель Пирон";
	["Lothos Riftwaker"] = "Лотос Хранитель Портала";
	["Franclorn Forgewright"] = "Франклорн Искусник";
	["Orb of Command"] = "Сфера Приказа";
	["Scarshield Quartermaster"] = "Интендант из легиона Изрубленного Щита";
	
	--Gnomeregan (Entrance)
	["Transpolyporter"] = "Транстелепорт";
	["Sprok"] = "Спок";
	["Matrix Punchograph 3005-A"] = "Матричный перфограф 3005-A";
	["Namdo Bizzfizzle"] = "Намдо Вклвыкл";
	["Techbot"] = "Техбот";
	
	--Maraudon (Entrance)
	["The Nameless Prophet"] = "Безымянный пророк";
	["Kolk"] = "Колк";
	["Gelk"] = "Гелк";
	["Magra"] = "Магра";
	["Cavindra"] = "Кавиндра";
	["Cursed Centaur"] = "Проклятый кентавр";
	
	--The Deadmines (Entrance)
	["Marisa du'Paige"] = "Мариса дю Пэж";
	["Brainwashed Noble"] = "Зомбированный дворянин";
	["Foreman Thistlenettle"] = "Штейгер Крапивец";
	
	--Sunken Temple (Entrance)
	["Jade"] = "Нефрит";
	["Kazkaz the Unholy"] = "Казказ Нечистый";
	["Zekkis"] = "Зеккис";
	["Veyzhak the Cannibal"] = "Вейжак Каннибал";
	
	--Uldaman (Entrance)
	["Hammertoe Grez"] = "Тяжелоступ Грез";
	["Magregan Deepshadow"] = "Магреган Чернотень";
	["Tablet of Ryun'Eh"] = "Табличка Рьюн'эха";
	["Krom Stoutarm's Chest"] = "Сундук Крома Крепкорука";
	["Garrett Family Chest"] = "Сундук семейства Гарретт";
	["Digmaster Shovelphlange"] = "Мастер Лопаторук";
	
	--Wailing Caverns (Entrance)
	["Mad Magglish"] = "Безумный Магглиш";
	["Trigore the Lasher"] = "Тригор Хлестун";
	["Boahn"] = "Боан";
	["Above the Entrance:"] = "Над входом:";
	["Ebru"] = "Эбру";
	["Nalpak"] = "Налпак";
	["Kalldan Felmoon"] = "Калидан Лунный Серп";
	["Waldor"] = "Валдор";
	
	--Dire Maul (Entrance)
	["Dire Pool"] = "Зловещий Пруд";
	["Dire Maul Arena"] = "Арена Забытого города";
	["Mushgog"] = "Мушгог";
	["Skarr the Unbreakable"] = "Скарр Непреклонный";
	["The Razza"] = "Разза";
	["Elder Mistwalker"] = "Предок Странница Туманов";
	["Griniblix the Spectator"] = "Гринибликс Наблюдатель";
	
	--World Bosses
	["Emerald Dragons"] = "Изумрудные драконы";
	["Spirit of Azuregos"] = "Дух Азурегоса";
	["Emerald Dragons Trash"] = "Существа изумрудных драконов";
	["Nethergarde Keep"] = "Крепость Стражей Пустоты";
	
	--Battlegrounds
	
	--Places
	["Friendly Reputation Rewards"] = "Награды за репутацию - Дружелюбие";
	["Honored Reputation Rewards"] = "Награды за репутацию - Уважение";
	["Revered Reputation Rewards"] = "Награды за репутацию - Почтение";
	["Exalted Reputation Rewards"] = "Награды за репутацию - Превознесение";
	
	--Alterac Valley (North)
	["Dun Baldar"] = "Дун Болдар";
	["Vanndar Stormpike"] = "Вандар Грозовая Вершина";
	["Dun Baldar North Marshal"] = "Маршал северного Оплота Дун Болдара";
	["Dun Baldar South Marshal"] = "Маршал южного Оплота Дун Болдара";
	["Icewing Marshal"] = "Маршал Ледяного Крыла";
	["Iceblood Marshal"] = "Маршал Стылой Крови";
	["Stonehearth Marshal"] = "Маршал Каменного Очага";
	["East Frostwolf Marshal"] = "Маршал восточной башни Северного Волка";
	["West Frostwolf Marshal"] = "Маршал западной башни Северного Волка";
	["Tower Point Marshal"] = "Маршал смотровой башни";
	["Prospector Stonehewer"] = "Геолог Камнетерка";
	["Irondeep Mine"] = "Железный рудник";
	["Morloch"] = "Морлох";
	["Umi Thorson"] = "Уми Торсон";
	["Keetar"] = "Китар";
	["Arch Druid Renferal"] = "Верховный друид Дикая Лань";
	["Dun Baldar North Bunker"] = "Северный оплот Дун Болдара";
	["Wing Commander Mulverick"] = "Командир звена Маэстр";--omitted from AVS
	["Murgot Deepforge"] = "Мургот Подземная Кузня";
	["Dirk Swindle"] = "Дирк Надувалло";
	["Athramanis"] = "Атраманис";
	["Lana Thunderbrew"] = "Лана Громовар";
	["Stormpike Aid Station"] = "Лазарет Грозовой Вершины";
	["Stormpike Stable Master"] = "Смотритель стойл из клана Грозовой Вершины";
	["Stormpike Ram Rider Commander"] = "Командир наездников на баранах клана Грозовой Вершины";
	["Svalbrad Farmountain"] = "Свальбрад Дальногор";
	["Kurdrum Barleybeard"] = "Курдрум Ячменобород";
	["Stormpike Quartermaster"] = "Интендант клана Грозовой Вершины";
	["Jonivera Farmountain"] = "Джонивера Дальногор";
	["Brogus Thunderbrew"] = "Брегус Громовар";
	["Wing Commander Ichman"] = "Командир звена Ромеон";--omitted from AVS
	["Wing Commander Slidore"] = "Командир звена Макарч";--omitted from AVS
	["Wing Commander Vipore"] = "Командир звена Сквороц";--omitted from AVS
	["Dun Baldar South Bunker"] = "Южный оплот Дун Болдара";
	["Corporal Noreg Stormpike"] = "Капрал Норг Грозовая Вершина";
	["Gaelden Hammersmith"] = "Гаелден Кузнечный Молот";
	["Stormpike Graveyard"] = "Кладбище Грозовой Вершины";
	["Icewing Cavern"] = "Пещера Ледяного Крыла";
	["Stormpike Banner"] = "Знамя Грозовой Вершины";
	["Stormpike Lumber Yard"] = "Склад древесины Грозовой Вершины";
	["Wing Commander Jeztor"] = "Командир звена Мааша";--omitted from AVS
	["Icewing Bunker"] = "Укрытие Ледяного Крыла";
	["Wing Commander Guse"] = "Командир звена Смуггл";--omitted from AVS
	["Stonehearth Graveyard"] = "Кладбище Каменного Очага";
	["Stonehearth Outpost"] = "Форт Каменного Очага";
	["Captain Balinda Stonehearth"] = "Капитан Балинда Каменный Очаг";
	["Snowfall Graveyard"] = "Кладбище Снегопада";
	["Korrak the Bloodrager"] = "Коррак Кровопуск";
	["Ichman's Beacon"] = "Маяк Ромеона";
	["Mulverick's Beacon"] = "Маяк Малверика";
	["Stonehearth Bunker"] = "Укрытие Каменного Очага";
	["Ivus the Forest Lord"] = "Ивус Лесной Властелин";
	["Western Crater"] = "Западный кратер";
	["Vipore's Beacon"] = "Маяк Змейера";
	["Jeztor's Beacon"] = "Маяк Джезтора";
	["Eastern Crater"] = "Восточный кратер";
	["Slidore's Beacon"] = "Маяк Слидора";
	["Guse's Beacon"] = "Маяк Смуггла";
	["Graveyards, Capturable Areas"] = "Кладбища, Захатываемые участки";--omitted from AVS
	["Bunkers, Towers, Destroyable Areas"] = "Укрытия, Башни, Разрушаемые участки";--omitted from AVS
	["Assault NPCs, Quest Areas"] = "Штурмовые NPC, Участки заданий";--omitted from AVS
	["Steamsaw"] = "Паровая пила";--omitted from AVS
	
	--Alterac Valley (South)
	["Frostwolf Keep"] = "Крепость Северного Волка";
	["Drek'Thar"] = "Дрек'Тар";
	["Duros"] = "Дарос";
	["Drakan"] = "Дракан";
	["West Frostwolf Warmaster"] = "Воевода западной башни Северного Волка";
	["East Frostwolf Warmaster"] = "Воевода восточной башни Северного Волка";
	["Tower Point Warmaster"] = "Воевода Смотровой башни";
	["Iceblood Warmaster"] = "Воевода Стылой Крови";
	["Icewing Warmaster"] = "Воевода Ледяного Крыла";
	["Stonehearth Warmaster"] = "Воевода Каменного Очага";
	["Dun Baldar North Warmaster"] = "Воевода северного оплота Дун Балдара";
	["Dun Baldar South Warmaster"] = "Воевода южного оплота Дун Балдара";
	["Lokholar the Ice Lord"] = "Локолар Владыка Льда";
	["Iceblood Garrison"] = "Гарнизон Стылой Крови";
	["Captain Galvangar"] = "Капитан Гальвангар";
	["Iceblood Tower"] = "Башня Стылой Крови";
	["Iceblood Graveyard"] = "Кладбище Стылой Крови";
	["Tower Point"] = "Смотровая башня";
	["Coldtooth Mine"] = "Рудник Ледяного Зуба";
	["Taskmaster Snivvle"] = "Надсмотрщик Хныкс";
	["Masha Swiftcut"] = "Маша Быстрорезка";
	["Aggi Rumblestomp"] = "Агги Громовой Топот";
	["Frostwolf Graveyard"] = "Кладбище Северного Волка";
	["Jotek"] = "Джотек";
	["Smith Regzar"] = "Кузнец Регзар";
	["Primalist Thurloga"] = "Шаманка стихий Турлога";
	["Sergeant Yazra Bloodsnarl"] = "Сержант Язра Кровавый Рык";
	["Frostwolf Stable Master"] = "Смотритель стойл из клана Северного Волка";
	["Frostwolf Wolf Rider Commander"] = "Командир всадников на волках клана Северного Волка";
	["Frostwolf Quartermaster"] = "Интендант клана Северного Волка";
	["West Frostwolf Tower"] = "Западная башня Северного Волка";
	["East Frostwolf Tower"] = "Восточная башня Северного Волка";
	["Frostwolf Relief Hut"] = "Приют Северного Волка";
	["Wildpaw Cavern"] = "Пещера Дикой Лапы";
	["Frostwolf Banner"] = "Знамя Северного Волка";
	
	--Arathi Basin
	["Trollbane Hall"] = "Зал Троллебоя";
	["Defiler's Den"] = "Логово Осквернителя";
	["Stables"] = "Стойла";
	["Gold Mine"] = "Рудник";
	["Blacksmith"] = "Кузница";
	["Lumber Mill"] = "Лесопилка";
	["Farm"] = "Ферма";
	
	--Warsong Gulch
	["Silverwing Hold"] = "Крепость Среброкрылых";
	["Warsong Lumber Mill"] = "Лесопилка Песни Войны";
	
	--Flight points
	["Flight Path Maps"] = "Маршруты полётов";
	["Druid-only"] = "Только Друид";
	["Aerie Peak"] = "Заоблачный Пик";
	["Astranaar"] = "Астранаар";
	["Auberdine"] = "Аубердин";
	["Bloodvenom Post"] = "Застава Отравленной Крови";
	["Booty Bay"] = "Пиратская бухта";
	["Brackenwall Village"] = "Деревня Гиблотопь";
	["Camp Mojache"] = "Лагерь Мохаче";
	["Camp Taurajo"] = "Лагерь Таурахо";
	["Cenarion Hold"] = "Крепость Кенария";
	["Chillwind Point"] = "Лагерь Промозглого Ветра";
	["Crossroads"] = "Перекресток";
	["Darkshire"] = "Темнолесье";
	["Everlook"] = "Круговзор";
	["Feathermoon Stronghold"] = "Крепость Оперенной Луны";
	["Flame Crest"] = "Пламенеющий Стяг";
	["Freewind Post"] = "Застава Вольного Ветра";
	["Gadgetzan"] = "Прибамбасск";
	["Grom'Gol Base Camp"] = "Лагерь Гром'гол";
	["Hammerfall"] = "Павший Молот";
	["Kargath"] = "Каргат";
	["Lakeshire"] = "Приозерье";
	["Light's Hope Chapel"] = "Часовня Последней Надежды";
	["Marshal's Refuge"] = "Укрытие Маршалла";
	["Menethil Harbor"] = "Гавань Менетил";
	["Morgan's Vigil"] = "Дозор Моргана";
	["Nethergarde Keep"] = "Крепость Стражей Пустоты";
	["Nighthaven"] = "Ночная Гавань";
	["Nijel's Point"] = "Высота Найджела";
	["Ratchet"] = "Кабестан";
	["Refuge Pointe"] = "Опорный пункт";
	["Revantusk Village"] = "Деревня Сломанного Клыка";
	["Rut'Theran Village"] = "Деревня Рут'Теран";
	["Sentinel Hill"] = "Сторожевой холм";
	["Shadowprey Village"] = "Деревня Ночных Охотников";
	["Southshore"] = "Южнобережье";
	["Splintertree Post"] = "Застава Расщепленного Дерева";
	["Stonard"] = "Каменор";
	["Stonetalon Peak"] = "Пик Каменного Когтя";
	["Sun Rock Retreat"] = "Приют у Солнечного Камня";
	["Talonbranch Glade"] = "Поляна Когтистых Ветвей";
	["Talrendis Point"] = "Застава Талрендис";
	["Tarren Mill"] = "Мельница Таррен";
	["Thalanaar"] = "Таланаар";
	["The Sepulcher"] = "Гробница";
	["The Shimmering Flats"] = "Мерцающая равнина";
	["Thelsamar"] = "Телсамар";
	["Theramore Isle"] = "Остров Терамор";
	["Thorium Point"] = "Лагерь Братства Тория";
	["Valormok"] = "Храбростан";
	["Zoram'gar Outpost"] = "Форт Зорам'Гар";
	["South of the path along Lake Elune'ara"] = "К югу от пути вдоль Озера Элуне'ара";
	["West of the path to Timbermaw Hold"] = "К западу от пути к Крепости Древобрюхов";
	["Tauren Leveling Guide"] = "Руководство по разравитию Таурена";
	["Undead Leveling Guide"] = "Руководство по разравитию Нежити";
	["Troll/Orc Leveling Guide"] = "Руководство по разравитию Тролля/Орка"; 
	["Horde Leveling Guide"] = "Руководство по разравитию Орды";
	["Human Leveling Guide"] = "Руководство по разравитию Человека";
	["Night Elf Leveling Guide"] = "Руководство по разравитию Ночного эльфа";
	["Gnome/Dwarf Leveling Guide"] = "Руководство по разравитию Гнома/Дворфа"; 
	["Alliance Leveling Guide"] = "Руководство по разравитию Альянса";
} end)