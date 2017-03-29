-- Version : Russian ( by Maus )

function Ace_Locals_ruRU()
	-- All text inside quotes is translatable, except for 'method' lines.	
	ACE_DESCRIPTION				= "Аддон раcширения и управления инструментарием."
	ACE_VERSION_MISMATCH		= "|cffff6060[Несовпадение Ace]|r"
	
	-- Various text strings
	ACE_TEXT_COMMANDS			= "Команды"
	ACE_TEXT_ALL				= "все"
	ACE_TEXT_OF					= "с"
	ACE_TEXT_AUTHOR				= "Автор"
	ACE_TEXT_EMAIL				= "E-mail"
	ACE_TEXT_RELEASED			= "Релиз"
	ACE_TEXT_WEBSITE			= "Сайт"
	ACE_TEXT_MEM_USAGE			= "Используемая память аддонами (Мб)"
	ACE_TEXT_TOTAL_ADDONS		= "Всего аддонов"
	ACE_TEXT_TOTAL_LOADED		= "Загружено аддонов"
	ACE_TEXT_ACE_ADDONS_LOADED	= "Ace аддоны загружены"
	ACE_TEXT_ACE_REGISTERED		= "Зарегистрированные Асе приложения"
	ACE_TEXT_OTHERS_LOADED		= "Другие аддоны загружены"
	ACE_TEXT_NOT_LOADED			= "Не загруженные аддоны"
	ACE_TEXT_LOADMSG			= "Запуск загрузки типа сообщений"
	ACE_TEXT_NOW_SET_TO 		= "теперь установлено в"
	ACE_TEXT_DEFAULT	 		= "стандартно"
	
	ACE_MAP_STANDBY				= {[0]="Теперь активный.", [1]="В ожидании."}
	ACE_MAP_LOADMSG				= {[0]="Суммарно", addon="Аддоны", none="Ничего"}
	
	-- Load message locals
	ACE_LOAD_MSG_SUMMARY		= "|cffffff78Ace Инициализация завершена|r\n"..
								  "|cffffff78"..ACE_TEXT_ACE_REGISTERED..":|r %s\n"..
								  "|cffffff78Загружен профиль:|r %s\n"..
								  "|cffffff78Ведите|r |cffd8c7ff/ace|r |cffffff78для получения дополнительной информации|r"
	
	-- Addon locals
	ACE_ADDON_LOADED			= "|cffffff78%s v%s|r |cffd8c7ff%s|r |cffffffff теперь загружен.|r"
	ACE_ADDON_STANDBY			= "|cffff5050(ожидание)|r"
	
	-- Addon Categories
	ACE_CATEGORY_AUDIO			= "Аудио"
	ACE_CATEGORY_BARS			= "Панели интерфейса"
	ACE_CATEGORY_BATTLEGROUNDS	= "Поля боя"
	ACE_CATEGORY_CHAT			= "Чат/Коммуникация"
	ACE_CATEGORY_CLASS			= "Классовые улучшения"
	ACE_CATEGORY_COMBAT			= "Сражения/Кастинг"
	ACE_CATEGORY_COMPILATIONS	= "Компиляция"
	ACE_CATEGORY_DEVELOPMENT	= "Инструменты разработчика"
	ACE_CATEGORY_GUILD			= "Гильдия"
	ACE_CATEGORY_INTERFACE		= "Улучшение интерфейса"
	ACE_CATEGORY_INVENTORY		= "Улучшение инвентаря/предметов"
	ACE_CATEGORY_MAP			= "Улучшение карты"
	ACE_CATEGORY_OTHERS			= "Другие"
	ACE_CATEGORY_PROFESSIONS	= "Профессии"
	ACE_CATEGORY_QUESTS			= "Улучшение заданий"
	ACE_CATEGORY_RAID			= "Рейд помощник"
	
	-- Profile locals
	ACE_PROFILE_DEFAULT			= "по умолчанию"
	ACE_PROFILE_LOADED_CHAR		= "Индивидуальный профиль был загружен для %s."
	ACE_PROFILE_LOADED_CLASS	= "%s класс профиля был загружен для %s."
	ACE_PROFILE_LOADED_DEFAULT	= "Профиль по умолчанию был загружен для %s."
	
	-- Information locals
	ACE_INFO_HEADER				= "|cffffff78Ace информация|r"
	ACE_INFO_NUM_ADDONS			= "Загруженны аддоны"
	ACE_INFO_PROFILE_LOADED		= "Загружен профиль"
	
	-- Chat handler locals
	ACE_CMD_OPT_HELP_DESC		= "Отобразить дополнительную информацию об этом аддоне."
	ACE_CMD_OPT_STANDBY_DESC	= "Переключение аддона в режим ожидания."
	ACE_CMD_OPT_REPORT_DESC		= "Отображение состояния все настроек."
	ACE_CMD_OPT_INVALID			= "Недопустимая опция '%s'."
	ACE_CMD_OPT_LIST_ADDONS		= "Список аддонов"
	ACE_CMD_OPT_LOAD_IS_LOADED	= "%s уже загружен."
	ACE_CMD_OPT_LOAD_ERROR		= "%s не может быть загружен, потому что это %s."
	ACE_CMD_OPT_LOAD_LOADED		= "%s теперь загружен."
	ACE_CMD_OPT_AUTO_OFF_MSG	= "%s больше не будет загружаться"
	ACE_CMD_ERROR 				= "|cffff6060[ошибка]|r"
	
	ACE_CMD_ADDON_NOTFOUND		= "Аддон '%s' не найден."
	ACE_CMD_ADDON_ENABLED		= "%s был включен. Вы должны перезапустить игру, что бы он вступил в силу."
	ACE_CMD_ADDON_ENABLED_ALL	= "Все аддоны были включены. Вы должны перезапустить игру для загрузки "..
								  "ранее отключеных аддонов."
	ACE_CMD_ADDON_DISABLED		= "%s был отключен, но будет работать пока вы не перезапустите игру."
	ACE_CMD_ADDON_DISABLED_ALL	= "Все аддоны кроме Ace были отключены, но будут работать "..
								  "пока вы не перезапустите игру."
	
	ACE_CMD_PROFILE_ADDON_ADDED = "%s был добавлен. Активный профиль: %s."
	ACE_CMD_PROFILE_ALL_ADDED	= "Все аддоны были добавленны. Активный профиль: %s."
	ACE_CMD_PROFILE_NO_PROFILE	= "%s не имеет доступа в опции профиля."
	
	ACE_CMD_USAGE_HEADER		= "|cffffff78Используйте:|r |cffd8c7ff%s|r %s"
	ACE_CMD_USAGE_NOINFO		= "Нет дополнительной информации"
	
	ACE_CMD_REPORT_STATUS		= "Статус"
	
	ACE_CMD_REPORT_NO_VAL		= "|cffc7c7c7нет значения|r"
	
	ACE_CMD_OPTIONS				= {
		{
			option	= "enable",
			desc	= "Включить все аддоны.",
			method	= "EnableAddon"
		},
		{
			option	= "disable",
			desc	= "Отключить все аддоны.",
			method	= "DisableAddon"
		},
		{
			option	= "info",
			desc	= "Показать информацию о текущем аддоне и профиле.",
			method	= "DisplayInfo"
		},
		{
			option	= "list",
			desc	= "Отображает список загруженных аддонов.",
			method	= "ListAddons",
			args	= {
				{
					option	= "ace",
					desc	= "Список загруженных Ace аддонов.",
					method	= "ListAddonsAce"
				},
				{
					option	= "other",
					desc	= "Список других загруженных аддонов.",
					method	= "ListAddonsOther"
				},
				{
					option	= "loadable",
					desc	= "Список всех аддонов, которые доступны для загрузки.",
					method	= "ListAddonsLoadable"
				}
			}
		},
		{
			option	= "load",
			desc	= "Загрузить аддон, если в данный момент он отключен и если он установлен для загрузки по требованию.",
			input	= 1,
			method	= "LoadAddon",
			args	= {
				{
					option	= "auto",
					desc	= "Загрузить и установить аддон, чтобы он автоматически загружался при старте игры.",
					method	= "LoadAddonAuto"
				},
				{
					option	= "off",
					desc	= "Отключить автоматическую загрузку аддона.",
					method	= "LoadAddonOff"
				}
			}
		},
		{
			option	= "loadmsg",
			desc	= "Изменить отображение сообщения о загрузке аддона.",
			args	= {
				{
					option	= "addon",
					desc	= "Показывать сообщение загрузки каждого аддона.",
					method	= "ChangeLoadMsgAddon"
				},
				{
					option	= "none",
					desc	= "Не показывать сообщения о загрузке аддонов.",
					method	= "ChangeLoadMsgNone"
				},
				{
					option	= "sum",
					desc	= "Показ кратких сообщений.",
					method	= "ChangeLoadMsgSum"
				}
			},
		},
		{
			option	= "profile",
			desc	= "Загрузите один из трех профилей: char, class, или default. Если профиль не "..
					  "существует, то будет создан пустой профиль. Ваши character или class профили будут "..
					  "использоват настройки с профиля default, пока вы не заполните их. Как только вы "..
					  "сохраните любые настройки в один из профилей, все внесенные изменения "..
					  "будут характерны только для этого профиля.",
			args	= {
				{
					option	= "char",
					desc	= "Загрузка настроек с этого профиля. Введите 'all' или конкретное "..
							  "название аддона для их загрузки.",
					method	= "UseProfileChar",
				},
				{
					option	= "class",
					desc	= "Загрузка настроек с этого профиля. Введите 'all' или конкретное "..
							  "название аддона для их загрузки.",
					method	= "UseProfileClass"
				},
				{
					option	= ACE_PROFILE_DEFAULT,
					desc	= "Загрузить профиль по умолчанию для этого персонажа. Этот профиль "..
							  "автоматически заполняется для каждого аддона.",
					method	= "UseProfileDefault"
				},
			},
		}
	}
end