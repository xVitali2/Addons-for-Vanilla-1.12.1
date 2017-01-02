local L = AceLibrary("AceLocale-2.2"):new("WHDBTextLocal")
-- Version : Russian ( by Maus )
L:RegisterTranslations("ruRU", function() return {

	["Cartographer Database Registered."] = "База Данных Cartographer - зарегистрирована.",
	["WHDB Loaded."] = "WHDB - загружен.",
	["Using EQL3."] = "Использование EQL3.",
	["Using QuestGuru."] = "Использование QuestGuru.",
	["Using default quest log."] = "Использование журнала заданий по умолчанию.",
	["MetaMap plotter enabled."] = "MetaMap плоттер - включен.",
	["Cartographer plotter enabled."] = "Cartographer плоттер - включен.",
	["MapNotes plotter enabled."] = "MapNotes плоттер - включен.",
	
	["Commands available:"] = "Доступные команды:",
	["/whdb help | This help."] = "/whdb help | Помощь.",
	["/whdb com <quest name> | Get quest comments by quest name."] = "/whdb com <quest name> | Получить комментарии к заданию по названию задания.",
	["/whdb item <item name> | Get item drop info and show map if possible."] = "/whdb item <item name> | Получить информацию о выпадении предмета и показать на карте, если это возможно.",
	["/whdb mob <monster name> | Get monser location and show map if possible."] = "/whdb mob <monster name> | Получить информацию о расположении монстра и показать на карте, если это возможно.",
	["/whdb clean | Clean map notes."] = "/whdb clean | Очистить заметки на карте.",
	["/whdb colors <0 or 1>| Enable/Disable coloring of text in the quest log."] = "/whdb colors <0 or 1>| Вкл/Выкл окраску текстов в журнале заданий.",
	["/whdb copy <character>| Copy characters config to current one."] = "/whdb copy <character>| Скопировать настройки другого персонажа для текущего.",
	["Note: All parameters are case sensitive!"] = "Примечание: Все параметры вводятся с учетом регистра!",
	["Quest Comments"] = "Комментарии к заданию",
	["Drops for: "] = "Добыча для: ",
	["Showing only the 5 first results."] = "Показывать только первых 5 результатов.",
	["Location for: "] = "Расположение:",
	["Text colors enabled."] = "Цветной текст - включен.",
	["Text colors disabled."] = "Цветной текст - отключен.",
	["Settings loaded."] = "Настройки загружены.",
	["There are no settings for this character."] = "Нет настроек для этого персонажа.",
	
	["(.*) slain"] = "(.*) %- убито", -- (mob name) slain
	["Unknown"] = "Неизвестно",
	["Zone: "] = "Зона: ",
	["Level: "] = "Уровень: ",
	["Health: "] = "Здоровье: ",
	["Coords: "] = "Координаты: ",
	["Dropped by: "] = "Добыча с: ",
	["Drop Rate: "] = "Шанс выпадения: ",
	["\nDrop: "] = "\nВыпадение: ",
	["Map Plots"] = "Метки на карте",
	["Comments"] = "Комментарии",
	["END: "] = "Завершение: ",
	["Show Map"] = "Показать",
	["Clean Map"] = "Очистить",
	
	["Error: MapNotes can't find the map."] = "Ошибка: MapNotes не может найти карту.",
	["Error: Map doesn't exist!"] = "Ошибка: Карта не существует!",
	["No comments for this quest.\n\n"] = "Нет комментариев для этого задания.\n\n",

} end)