if ( GetLocale() == "ruRU" ) then
---------------------------------------
--- Russian localization by Lichery ---
---------------------------------------

	--[[ TrinketMenuOpt.lua : Options and sort window for TrinketMenu ]]

	TrinketMenu.CheckOptInfo = {
		{"ShowIcon","ON","Кнопка миникарты","Показать или скрыть кнопку."},
		{"SquareMinimap","OFF","Площадь миникарты","Движение кнопки миникарты вокруг площади миникарты.","ShowIcon"},
		{"CooldownCount","OFF","Восстановление числом","Отображает оставшееся время восстановления."},
		{"TooltipFollow","OFF","На мышке","Отображает все всплывающие подсказки около мышки.","ShowTooltips"},
		{"KeepOpen","OFF","Открытое меню","Держит меню открытым все время."},
		{"KeepDocked","ON","Пристыкованное меню","Держит меню пристыкованным все время."},
		{"Notify","OFF","Уведомление о готовности","Отправляет уведомление, когда восстановление аксессуара завершено."},
		{"DisableToggle","OFF","Отключить переключение","Отключает у кнопки миникарты способность переключения окна аксессуаров.","ShowIcon"},
		{"NotifyChatAlso","OFF","Уведомление в чат","Отправка уведомлений в чат."},
		{"Locked","OFF","Блокировка окна","Препятствует перемещению окна, изменению размера или повороту."},
		{"ShowTooltips","ON","Показать подсказки","Показывает всплывающие подсказки."},
		{"NotifyThirty","ON","Уведомление на 30 сек.","Отправляет уведомление, когда до завершения времени восстановления аксессуара остается 30 сек."},
		{"MenuOnShift","OFF","Меню на Shift","Отображение меню выбора аксессуаров после зажатия Shift."},
		{"TinyTooltips","OFF","Компактные подсказки","Отображение только названия, зарядов и времени восстановления.","ShowTooltips"},
		{"SetColumns","OFF","Установить столбцы меню","Определяет сколько столбцов аксессуаров будет в меню.\n\nСнимите галочку, чтобы позволить TrinketMenu автоматически выставлять столбцы."},
		{"LargeCooldown","ON","Большие номера","Показывает время восстановления в большом шрифте.","CooldownCount"},
		{"ShowHotKeys","ON","Показать горячие клавиши","Отображает горячие клавиши над одетыми аксессуарами."},
		{"StopOnSwap","OFF","Остановка очереди на обмене","Обмен пассивных аксессуаров останавливает автоматическую очередь. Также останавливает автоматическую очередь, когда активные аксессуары вручную обменены через TrinketMenu. Это будет иметь максимум пользы для тех, кто часто аксессуарам ставит приоритет."},
		{"HideOnLoad","OFF","Закрыть на загрузке профиля","Закрывает это окно, когда вы загружаете профиль."}
	}

	-- table.insert(TrinketMenu.CheckOptInfo,)

	TrinketMenu.TooltipInfo = {
		{"TrinketMenu_LockButton","Блокировка окна","Препятствует перемещению окна, изменению размера или повороту."},
		{"TrinketMenu_Trinket0Check","Автоматическая очередь верхнего аксессуара","Включает автоматическую очередь для этой ячейки аксессуара. Вы также можете нажать Alt + Click на ячейке аксессуара для переключения автоматической очереди."},
		{"TrinketMenu_Trinket1Check","Автоматическая очередь нижнего аксессуара","Включает автоматическую очередь для этой ячейки аксессуара. Вы также можете нажать Alt + Click на ячейке аксессуара для переключения автоматической очереди."},
		{"TrinketMenu_SortPriority","Высокий приоритет","Когда активно, этот аксессуар будет как можно скорее обменен, независимо от того находится ли экипированный аксессуар на восстановлении.\n\nКогда не активно, этот аксессуар не будет обменен, пока не начнется восстановление экипированного аксессуара."},
		{"TrinketMenu_SortDelay","Задержка обмена","Это время (в секундах) до обмена аксессуаров, т.е. для \"Земного удара\" вам требуется 20 секунд, чтобы получить полный 20-ти секундный эффект от данного аксессуара."},
		{"TrinketMenu_SortKeepEquipped","Пауза очереди","Приостановка автоматической очереди пока аксессуар экипирован, т.е. для \"Морковки на палочке\", если у вас есть режим автоматической экипировки и автоматической очереди."},
		{"TrinketMenu_Profiles","Профили","Здесь вы можете загрузить или сохранить профили автоматической очереди."},
		{"TrinketMenu_Delete","Удалить","Удаляет этот аксессуар из списка. Не влияет на производительность аксессуаров по списку ниже.  Эта опция только сохраняет список управляемым. Примечание: аксессуары в вашей сумке будет возвращены в конец списка."},
		{"TrinketMenu_ProfilesDelete","Удалить профиль","Удаляет этот профиль."},
		{"TrinketMenu_ProfilesLoad","Загрузить профиль","Загружает порядок очереди выбранной ячейки аксессуара.  Вы можете дважды нажать на профиль, чтобы загрузить его."},
		{"TrinketMenu_ProfilesSave","Сохранить профиль","Сохраняет порядок очереди выбранной ячейки аксессуара. Любая ячейка аксессуара может использовать сохраненные профили."},
		{"TrinketMenu_ProfileName","Имя профиля","Введите имя для вызова профиля.  При сохранении, вы можете загрузить этот профиль для каждой ячейки аксессуара."},
	}
	
	TRINKETMENU_TRNKETS = " аксессуаров"
	
	-- TrinketMenuQueue.lua
	TRINKETMENU_PRIORITY = "Приоритет"
	TRINKETMENU_PAUSE_QUEUE = "Пауза очереди"
	TRINKETMENU_STOP_QUEUE = "-- остановка очереди здесь --"
	TRINKETMENU_STOP_QUEUE_TOOLTIP1 = "Остановка очереди здесь"
	TRINKETMENU_STOP_QUEUE_TOOLTIP2 = "Переместите это, чтобы отметить последний аксессуар в автоматической очереди. Иногда вам может понадобиться, чтобы пассивный аксессуар с эффектом нажатия был конце очереди (\"Амулет Озарения\", \"Второе дыхание\", и т.д.)."
	
	TRINKETMENU_ERROR_MSG = "|cFFBBBBBBTrinketMenu:|cFFFFFFFF "
	TRINKETMENU_ERROR_MSG1 = "Первый параметр должен быть 0 для верхнего аксессуара или 1 для нижнего."
	TRINKETMENU_ERROR_MSG2 = "Второй параметр либо ON, OFF, PAUSE, RESUME или начало списка аксессуаров в порядке сортировки."
	TRINKETMENU_ERROR_MSG3 = "Аксессуар или профиль \""
	TRINKETMENU_ERROR_MSG4 = "\" не найден."
	TRINKETMENU_ERROR_MSG5 = " Ожидается ON, OFF, PAUSE, RESUME или SORT+list"
	TRINKETMENU_ERROR_MSG6 = "|cFFBBBBBBTrinketMenu.GetQueue:|cFFFFFFFF Параметр должен быть 0 для верхнего аксессуара или 1 для нижнего."
	TRINKETMENU_ERROR_MSG7 = "Ни один профиль не сохранен."
	
	-- TrinketMenu.lua
	TRINKETMENU_ADDON_LOAD = "|cFFFFFF00TrinketMenu загружен:"
	TRINKETMENU_CMD_LOAD = "/trinket load (top|bottom) profilename\nт.е.: /trinket load bottom PvP"

	TRINKETMENU_CMDS = "|cFFFFFF00TrinketMenu использование:"
	TRINKETMENU_CMD1 = "/trinket or /trinketmenu : переключение окна"
	TRINKETMENU_CMD2 = "/trinket reset : сброс всех настроек"
	TRINKETMENU_CMD3 = "/trinket opt : вызов окна опций"
	TRINKETMENU_CMD4 = "/trinket lock|unlock : переключение блокировки окна"
	TRINKETMENU_CMD5 = "/trinket scale main|menu (number) : установка точного размера"
	TRINKETMENU_CMD6 = "/trinket load top|bottom profilename : загрузка профиля для верхнего и нижнего аксессуара"
	
	TRINKETMENU_CMD_SCALES = "|cFFFFFF00TrinketMenu размер:"
	TRINKETMENU_CMD_SCALE1 = "/trinket scale main (number) : установка точного размера главного окна"
	TRINKETMENU_CMD_SCALE2 = "/trinket scale menu (number) : установка точного размера меню"
	TRINKETMENU_CMD_SCALE3 = "т.е., /trinket scale menu 0.85"
	TRINKETMENU_CMD_SCALE4 = "Примечание: Вы можете перетащить нижний правый угол окна для изменения размера. Эта команда для тех, кто хочет установить точный размер."

	TRINKETMENU_RESET = "Вы уверены, что хотите сбросить TrinketMenu к настройкам по умолчанию и перезагрузить UI?"
	TRINKETMENU_YES = "Да"
	TRINKETMENU_NO = "Нет"

	-- TrinketMenuOpt.xml
	TRINKETMENU_OPTIONS = "Опции"
	TRINKETMENU_MINIMAP_TOOLTIP1 = "Нажатие: переключение опций\nПеремещение: движение значка"
	TRINKETMENU_MINIMAP_TOOLTIP2 = "Левое нажатие: переключение аксессуаров\nПравое нажатие: переключение опций\nПеремещение: движение значка"
	TRINKETMENU_5_TRINKETS = "5 аксессуаров"
	
	-- TrinketMenuQueue.xml
	TRINKETMENU_PROFILENAME = "Имя профиля"
	TRINKETMENU_BUTTOM = "Нижний"
	TRINKETMENU_TOP = "Верхний"
	TRINKETMENU_DELAY = "Задержка"
	TRINKETMENU_SEC = "сек."
	TRINKETMENU_PROFILE = "Профиль"
	TRINKETMENU_DELETE = "Удалить"
	TRINKETMENU_LOAD = "Загрузить"
	TRINKETMENU_SAVE = "Сохранить"
	TRINKETMENU_CANCEL = "Отмена"
	
	-- Bindings.xml
	BINDING_NAME_TRINKETMENU_TOGGLE = "Открыть/Закрыть TrinketMenu"
	BINDING_NAME_TRINKETMENU_TOP = "Использовать верхний аксессуар"
	BINDING_NAME_TRINKETMENU_BOTTOM = "Использовать нижний аксессуар"
end