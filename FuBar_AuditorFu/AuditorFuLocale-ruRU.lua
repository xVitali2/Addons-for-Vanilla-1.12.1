local L = AceLibrary("AceLocale-2.2"):new("AuditorFu")

L:RegisterTranslations("ruRU", function() return {

	-- Plugin Locals

	["NAME"] = "FuBar - AuditorFu",
	["DESCRIPTION"] = "Отслеживает входящие и исходящие наличные по категориям. Работает с FuBar или без.",
	
	-- Options Table Locals
	
	["TEXT_CASHFLOW"] = "Поток наличных",
	["TEXT_TIMEFRAME"] = "Временные рамки",
	["DESC_TIMEFRAME"] = "Устанавливает временные рамки для данных, которые будут отображаться в подсказке.",
	["TEXT_CASHFORMAT"] = "Формат денег",
	["DESC_CASHFORMAT"] = "Устанавливает формат, в котором будут отображаться деньги.",
	["TEXT_FUDISPLAY"] = "Отображение FuBar",
	["DESC_FUDISPLAY"] = "Устанавливает формат, в котором будут отображаться деньги в FuBar.",
	["TEXT_TIPDISPLAY"] = "Отображение подсказок",
	["DESC_TIPDISPLAY"] = "Устанавливает формат, в котором будет отображаться деньги в подсказке.",
	["TEXT_HIDETOTALS"] = "Скрыть Итоговые",
	["DESC_HIDETOTALS"] = "Скрывает итоговые суммы персонажа из подсказки.", 
	["TEXT_HIDEDETAILS"] = "Скрыть поток наличных",
	["DESC_HIDEDETAILS"] = "Скрывает доходы и расходы по категории из подсказки.",
	["TEXT_HIDESUMMARY"] = "Скрыть суммарно",
	["DESC_HIDESUMMARY"] = "Скрывает суммарные доходы и расходы из подсказки.",
	["TEXT_CHARSHOW"] = "Показать персонажа",
	["DESC_CHARSHOW"] = "Показать детали Auditor для другого вашего персонажа.",
	["TEXT_IMPORT"] = "Импортировать данные",
	["DESC_IMPORT"] = "Импорт данных из Accountant. Accountant должен быть загружен для этой работы, и вы должны сделать это только один раз для каждого персонажа.", 
	["TEXT_PURGE"] = "Очистить данные",
	["DESC_PURGE"] = "Очистка данных выбранного персонажа. Это УНИЧТОЖИТ все данные для выбранного персонажа.",
	["TEXT_FILTER"] = "Фильтровать данные",
	["DESC_FILTER"] = "Фильтры данных для выбранного персонажа из отображения в подсказке.",
	["TEXT_FULLSTYLE"] = "Полный стиль",
	["TEXT_SHORTSTYLE"] = "Короткий стиль",
	["TEXT_CONDSTYLE"] = "Сжатый стиль",
	["TEXT_GRAPHICAL"] = "Графический стиль",
	["TEXT_SESSION"] = "Аудит сеанса",
	["TEXT_DAY"] = "Аудит сегодня",
	["TEXT_WEEK"] = "Семидневный аудит",
	["TEXT_TOTAL"] = "Общий аудит",
	["TEXT_RSESSION"] = "Сброс сеанса",
	["DESC_RSESSION"] = "Сбрасывает данные для этого сеанса. Не влияет на день, последние 7 дней, или общие данные.",
	["TEXT_FOR"] = " для ",
	["TEXT_ON"] = " на ",
	["TEXT_FROMTOTALS"] = " из подсказки всех данных.",
	["TEXT_ABSURD"] = "Абсурдная детализация",
	["DESC_ABSURD"] = "Изменение стиля всплывающей подсказки, чтобы показать абсурдные уровни детализации.",
	
	-- Tooltip Locals
	
	["TEXT_LOOT"] = "Добыча",
	["TEXT_VENDORS"] = "Торговцы",
	["TEXT_QUEST"] = "Задание",
	["TEXT_TRADE"] = "Обмен",
	["TEXT_MAIL"] = "Почта",
	["TEXT_AH"] = "Аукцион",
	["TEXT_TRAIN"] = "Обучение",
	["TEXT_TAXI"] = "Полеты",
	["TEXT_REPAIRS"] = "Ремонты",
	["TEXT_OTHER"] = "Неизвестно",
	["TEXT_SOURCE"] = "Источник",
	["TEXT_INCOMINGS"] = "Доходы",
	["TEXT_OUTGOINGS"] = "Расходы",
	["TEXT_SUMMARY"] = "Суммарно",
	["TEXT_CHARACTERS"] = "Персонажи",
	["TEXT_NETPROFIT"] = "Чистая прибыль",
	["TEXT_NETLOSS"] = "Чистая потеря",
	["TEXT_NETTOTAL"] = "Всего",
	
	-- Absurdly Detailed Locals
	
	["ABSD_SESSION"] = "Сеанс",
	["ABSD_WEEK"] = "Неделя",
	["ABSD_1"] = "Сегодня",
	["ABSD_2"] = "Вчера",
	["ABSD_3"] = "2 дня назад",
	["ABSD_4"] = "3 дня назад",
	["ABSD_5"] = "4 дня назад",
	["ABSD_6"] = "5 дней назад",
	["ABSD_7"] = "6 дней назад",
	["ABSD_TOTAL"] = "Все время",
	
	-- Date Locals
	["DATE_01"] = "Янв",
	["DATE_02"] = "Фев",
	["DATE_03"] = "Мар",
	["DATE_04"] = "Апр",
	["DATE_05"] = "Мая",
	["DATE_06"] = "Июня",
	["DATE_07"] = "Июля",
	["DATE_08"] = "Авг",
	["DATE_09"] = "Сен",
	["DATE_10"] = "Окт",
	["DATE_11"] = "Ноя",
	["DATE_12"] = "Дек",
	
	
	-- Popup Locals
	
	["POPUP_IMPORT"] = "Вы уверены, что хотите импортировать данные из Accountant для этого персонажа? Это ЗАМЕНИТ текущие данные Auditor, если он существует. Вы должны импортировать только при первом запуске Auditor для каждого персонажа. После того, как вы сделали это для каждого персонажа, вы должны отключить Accountant, и AccountantFu, если вы запустите его.",
	["POPUP_PURGE"] = "Вы уверены, что хотите очистить ",
	["POPUP_PURGE2"] = "данные? Это УНИЧТОЖИТ все данные для ",
	["POPUP_YES"] = "Да",
	["POPUP_NO"] = "Нет",
	
	-- Import Locals
	
	["IMPORT_SERVER"] = "Server separated",
	["IMPORT_NOSERVER"] = "Non-server separated",
	["IMPORT_DATAIMPORT"] = " данные импортируются для ",
	["IMPORT_ERROR"] = "Ничего импортировать! Либо Accountant не загружен, или у вас есть версия, которую я никогда раньше не видел. Извините!", 
	
	-- Data reconciliation
	
	["DATA_RECONCILIATION"] = "Сверка данных выполняется для ",
} end)