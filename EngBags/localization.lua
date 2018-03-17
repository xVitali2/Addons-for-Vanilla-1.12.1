local function print(text)
	DEFAULT_CHAT_FRAME:AddMessage(text)
end

EBLocal = {
	["_loaded"] = 0
};
EngBank_HELP = {
	["EN"] = {
		"EngBank Commands:",
		" /eb show  -- open window",
		" /eb hide  -- hide window",
		" /eb scale #.##  -- set the window scale.  use a number between 0.64 and 1.00",
		" /eb update",
		" /eb debug  -- turn debug info on/off",
		" /eb display  -- display item cache",
		" /eb checkhooks  -- see if everything is registered properly",
		" /eb resetdefaults  -- sets everything back to default values"
		},
	["DE"] = {                                             -- for the slash commands i've seen no use in translating it. Just translated the comments for better understanding
		"EngBank Commands:",
		" /eb show",
		" /eb hide  -- hide window",
		" /eb scale #.##  -- set the window scale.  use a number between 0.64 and 1.00",
		" /eb update",
		" /eb debug  -- Debug Info an/aus",
		" /eb display  -- Item Cache anzeigen",
		" /eb checkhooks  -- Sehen, ob alles korrekt registriert wurde",
		" /eb resetdefaults  -- Auf Defaultwerte zurücksetzen"
		},
	["FR"] = {
		"EngBank Commands:",
		" /eb show",
		" /eb hide  -- hide window",
		" /eb scale #.##  -- set the window scale.  use a number between 0.64 and 1.00",
		" /eb update",
		" /eb debug  -- turn debug info on/off",
		" /eb display  -- display item cache",
		" /eb checkhooks  -- see if everything is registered properly",
		" /eb resetdefaults  -- sets everything back to default values"
		},
	["RU"] = {
		"EngBank Комманды:",
		" /eb show",
		" /eb hide  -- скрыть окно",
		" /eb scale #.##  -- установить масштаб окна.  используй числа в диапазоне 0.64 и 1.00",
		" /eb update",
		" /eb debug  -- переключить отладку on/off",
		" /eb display  -- показывать сохраненные предметы",
		" /eb checkhooks  -- проверить всё ли зарегистрировано правильно",
		" /eb resetdefaults  -- сбросить настройки"
		}
	};

-- 1st element is EN, 2nd DE, 3rd FR 4 - RU
EngBank_LOCALIZATION = {
	-- some default items to place in slots manually
	["Container"] = {
		"Container",
		"Container",
		"Container",
		"Контейнер"
		},
	["RightClick_MenuTitle"] = {
		"EngBank @ EngBags",
		"EngBank @ EngBags",
		"EngBank @ EngBags",
		"EngBank @ EngBags"
		},
	["RightClick_ShowNewItems"] = {
		"New Items",
		"New Items",
		"New Items",
		"Новые предметы"
		},

	["soulbound_search"] = {	-- looking for soulbound keyword is special
		"Soulbound",
		"Seelengebunden",
		"Soulbound",
		"Персональный предмет"
		},

	["Warlock"] = {
		"Warlock",
		"Warlock",
		"Warlock",
		"Чернокнижник"
		},
	["Priest"] = {
		"Priest",
		"Priest",
		"Priest",
		"Жрец"
		},
	["Mage"] = {
		"Mage",
		"Mage",
		"Mage",
		"Маг"
		},
	["Rogue"] = {
		"Rogue",
		"Rogue",
		"Rogue",
		"Разбойник"
		},
	["Warrior"] = {
		"Warrior",
		"Warrior",		
		"Warrior",
		"Воин"
		},
	["Hunter"] = {
		"Hunter",
		"Hunter",
		"Hunter",
		"Охотник"
		},
	["Shaman"] = {
		"Shaman",
		"Shaman",
		"Shaman",
		"Шаман"
		},
	["Druid"] = {
		"Druid",
		"Druid",
		"Druid",
		"Друид"
		},
	["Paladin"] = {
		"Paladin",
		"Paladin",
		"Paladin",
		"Паладин"
		},

	["Cooking"] = {
		"Cooking",
		"Cooking",
		"Cooking",
		"Кулинария"
		},
	["First Aid"] = {
		"First Aid",
		"First Aid",
		"First Aid",
		"Первая помощь"
		},

	["string_searches"] = {
		{ -- english
			{ "FOOD", "Restores ([0-9.]+) health over ([0-9.]+) sec" },
			{ "DRINK", "Restores ([0-9.]+) mana over ([0-9.]+) sec" },
			{ "HEALINGPOTION", "Restores ([0-9.]+) to ([0-9.]+) health." },
			{ "MANAPOTION", "Restores ([0-9.]+) to ([0-9.]+) mana." },
			{ "PROJECTILE", "Projectile" },
			{ "JUJU", "Juju" },
			{ "BANDAGE", " Bandage" },
			{ "HEALTHSTONE", " Healthstone" },
			{ "RECIPE", "Recipe:" },
			{ "PATTERN", "Pattern:" },
			{ "SCHEMATIC", "Schematic:" },
			{ "FORMULA", "Formula:" },
			{ "MINIPET", "Right Click to summon and dismiss your" },
			{ "ROGUE_POISON", "Crippling Poison [IV]*" },
			{ "ROGUE_POISON", "Deadly Poison [IV]*" },
			{ "ROGUE_POISON", "Instant Poison [IV]*" },
			{ "ROGUE_POISON", "Mind-numbing Poison [IV]*" },
			{ "ROGUE_POISON", "Wound Poison [IV]*" },
			{ "ROGUE_POWDER", "Blinding Powder" },
			{ "ROGUE_POWDER", "Flash Powder" },
			{ "QUESTITEMS", "Use: Bind pages [0-9]" },	-- shredder operating manual & green hills of stranglethorn
			{ "KEYS", " Key" },
			{ "KEYS", "Key" }
		},
		{ -- german
			{ "FOOD", "Stellt im Verlauf von ([0-9.]+) Sek. ([0-9.]+) Punkt(e) Gesundheit wieder her." },
			{ "DRINK", "Stellt im Verlauf von ([0-9.]+) Sek. ([0-9.]+) Punkt(e) Mana wieder her." },
			{ "INSTANT_HP", "Stellt ([0-9.]+) bis ([0-9.]+) Punkt(e) Gesundheit wieder her." },
			{ "INSTANT_MANA", "Stellt ([0-9.]+) bis ([0-9.]+) Punkt(e) Mana wieder her." },
			{ "PROJECTILE", "Projektil" },
			{ "JUJU", "Juju" },
			{ "BANDAGE", "Verband" },
			{ "HEALTHSTONE", "Gesundheitsstein" },
		},
		{ -- french
		},
		{ -- russian
			{ "FOOD", "Восстанавливает ([0-9.]+) ед. здоровья за ([0-9.]+) сек." },
			{ "DRINK", "Восполнение ([0-9.]+) ед. маны за ([0-9.]+) сек." },
			{ "HEALINGPOTION", "- ([0-9.]+) ед. здоровья." },
			{ "MANAPOTION", "- ([0-9.]+) ед. маны." },
			{ "PROJECTILE", "Боеприпасы" },
			{ "JUJU", "джуджу" },
			{ "BANDAGE", " бинты" },
			{ "HEALTHSTONE", " камень здоровья" },
			{ "RECIPE", "Рецепт:" },
			{ "PATTERN", "Выкройка:" },
			{ "SCHEMATIC", "Схема:" },
			{ "FORMULA", "Формула:" },
			{ "MINIPET", "Щелкните правой кнопкой мыши, чтобы призвать или отпустить" },
			{ "ROGUE_POISON", "Калечащий яд [IV]*" },
			{ "ROGUE_POISON", "Смертельный яд [IV]*" },
			{ "ROGUE_POISON", "Быстродействующий яд [IV]*" },
			{ "ROGUE_POISON", "Дурманящий яд [IV]*" },
			{ "ROGUE_POISON", "Нейтрализующий яд [IV]*" },
			{ "ROGUE_POWDER", "Ослепляющий порошок" },
			{ "ROGUE_POWDER", "Воспламеняющийся порошок" },
			{ "QUESTITEMS", "Использование: Переплести страницы [0-9]" },	-- Руководства пользователя крошера & green hills of stranglethorn
			{ "KEYS", "Ключ" },
			{ "KEYS", "Отмычка" },
			{ "KEYS", "отмычка" },
			{ "KEYS", "ключ" }
		}
		},	-- end of string searches


	-- values from GetItemInfo()  (itemType)
	["tradegoods"] = {
		"Trade Goods",
		"Handwerkswaren",
		"Trade Goods",
		"Хозяйственные товары"
		},
	["miscellaneous"] = {
		"Miscellaneous",
		"Verschiedenes",
		"Misellaneous",
		"Разное"
		},
	["reagent"] = {
		"Reagent",
		"Reagenz",
		"Reagent",
		"Реагент"
		},
	["quest"] = {
		"Quest",
		"Quest",
		"Quest",
		"Задания"
		},
	["consumable"] = {
		"Consumable",
		"Verbrauchbar",
		"consumable",
		"Расходуемые"
		},

	-- window elements
	["EngBank_Button_HighlightToggle_on"] = {
		"Hilight New: ON",
		"Hilight New: ON",
		"Hilight New: ON",
		"Подсветка новых: вкл"
		},
	["EngBank_Button_HighlightToggle_on_tooltip"] = {
		"Highlight of new items is on.",
		"Highlight of new items is on.",
		"Highlight of new items is on.",
		"Подсветка новых предметов включена."
		},
	["EngBank_Button_HighlightToggle_off"] = {
		"Hilight New: OFF",
		"Hilight New: OFF",
		"Hilight New: OFF",
		"Подсветка новых: выкл"
		},
	["EngBank_Button_HighlightToggle_off_tooltip"] = {
		"Highlight of new items is off.",
		"Highlight of new items is off.",
		"Highlight of new items is off.",
		"Подсветка новых предметов выключена."
		},
	["EngBank_Button_MoveLock_locked"] = {
		"L",
		"L",
		"L",
		"Р"
		},
	["EngBank_Button_MoveLock_unlocked"] = {
		"U",
		"U",
		"U",
		"З"
		},
	["EngBank_Button_ChangeEditMode_MoveClass"] = {
		"Edit Mode",
		"Edit Mode",
		"Edit Mode",
		"Режим редактирования"
		},
	["EngBank_Button_ChangeEditMode_MoveItem"] = {
		"Move Items",
		"Move Items",
		"Move Items",
		"Двигать предметы"
		},
	["EngBank_Button_ChangeEditMode_off"] = {
		"Bank Edit",
		"Bank Edit",
		"Bank Edit",
		"Редактировать Банк"
		},
	["EngBank_Button_ChangeEditMode_tooltip_title"] = {
		"Modify Sort Locations",
		"Modify Sort Locations",
		"Modify Sort Locations",
		"Изменить сортировку местоположений"
		},
	["EngBank_Button_ChangeEditMode_tooltip"] = {
		"Edit Mode:\n  Select this option to move classes of items into different 'bars' (the red numbers).\n\n",
		"Edit Mode:\n  Select this option to move classes of items into different 'bars' (the red numbers).\n\n",
		"Edit Mode:\n  Select this option to move classes of items into different 'bars' (the red numbers).\n\n",
		"Режим редактирования:\n  Выбрать эту опцию для перемещения классов предметов в разные бары (красные цифры).\n\n"
		},
	["EngBank_Button_ColumnsAdd_buttontitle"] = {
		"<<-- -->>",
		"<<-- -->>",
		"<<-- -->>",
		"<<-- -->>"
		},
	["EngBank_Button_ColumnsAdd_tooltip_title"] = {
		"Window Size",
		"Window Size",
		"Window Size",
		"Размер окна"
		},
	["EngBank_Button_ColumnsAdd_tooltip"] = {
		"Increase the number of columns displayed",
		"Increase the number of columns displayed",
		"Increase the number of columns displayed",
		"Увеличить число отображаемых столбцов"
		},

	["EngBank_Button_ColumnsDel_buttontitle"] = {
		"-->> <<--",
		"-->> <<--",
		"-->> <<--",
		"-->> <<--"
		},
	["EngBank_Button_ColumnsDel_tooltip_title"] = {
		"Window Size",
		"Window Size",
		"Window Size",
		"Размер окна"
		},
	["EngBank_Button_ColumnsDel_tooltip"] = {
		"Decrease the number of columns displayed",
		"Decrease the number of columns displayed",
		"Decrease the number of columns displayed",
		"Уменьшить число отображаемых столбцов"
		},
	["help_text"] = {
		"EN",
		"DE",
		"FR",
		"RU"
		}
}


function EngBank_load_Localization(loadlang)
	local loadlang_num = 1;

	EngBags_PrintDEBUG("Loading localization: '"..loadlang.."'");

	if ( loadlang == "EN" ) then
		loadlang_num = 1;
	elseif ( loadlang == "DE" ) then
		loadlang_num = 2;
	elseif ( loadlang == "FR" ) then
		loadlang_num = 3;
	elseif ( loadlang == "RU" ) then
		loadlang_num = 4;	
	end

	-- the string.gsub is there because the editor I'm using is being stupid and is randomly replaceing spaces with tabs.
	for key,value in EngBank_LOCALIZATION do
		if (type(value[loadlang_num]) == "string") then
			EngBags_PrintDEBUG("localization: "..key.." set to '"..value[loadlang_num].."'");
			EBLocal[key] = string.gsub(value[loadlang_num], "\t", " ");
		else
			EBLocal[key] = value[loadlang_num];
		end
	end

	EBLocal["_loaded"] = 1;
end
EILocal = {
	["_loaded"] = 0
};

ENGINVENTORY_HELP = {
	["EN"] = {
		"EngInventory Commands:",
		" /ei show  -- open window",
		" /ei hide  -- hide window",
		" /ei scale #.##  -- set the window scale.  use a number between 0.64 and 1.00",
		" /ei update",
		" /ei debug  -- turn debug info on/off",
		" /ei display  -- display item cache",
		" /ei checkhooks  -- see if everything is registered properly",
		" /ei resetdefaults  -- sets everything back to default values"
		},
	["DE"] = {                                             -- for the slash commands i've seen no use in translating it. Just translated the comments for better understanding
		"EngInventory Commands:",
		" /ei show",
		" /ei hide  -- hide window",
		" /ei scale #.##  -- set the window scale.  use a number between 0.64 and 1.00",
		" /ei update",
		" /ei debug  -- Debug Info an/aus",
		" /ei display  -- Item Cache anzeigen",
		" /ei checkhooks  -- Sehen, ob alles korrekt registriert wurde",
		" /ei resetdefaults  -- Auf Defaultwerte zurücksetzen"
		},
	["FR"] = {
		"EngInventory Commands:",
		" /ei show",
		" /ei hide  -- hide window",
		" /ei scale #.##  -- set the window scale.  use a number between 0.64 and 1.00",
		" /ei update",
		" /ei debug  -- turn debug info on/off",
		" /ei display  -- display item cache",
		" /ei checkhooks  -- see if everything is registered properly",
		" /ei resetdefaults  -- sets everything back to default values"
		},
	["RU"] = {
		"EngBank Комманды:",
		" /eb show",
		" /eb hide  -- hide window",
		" /eb scale #.##  -- set the window scale.  use a number between 0.64 and 1.00",
		" /eb update",
		" /eb debug  -- turn debug info on/off",
		" /eb display  -- display item cache",
		" /eb checkhooks  -- see if everything is registered properly",
		" /eb resetdefaults  -- sets everything back to default values"
		}
	};

-- 1st element is EN, 2nd DE, 3rd FR 4 - RU
ENGINVENTORY_LOCALIZATION = {
	-- some default items to place in slots manually
	["KeyRing"] = {
		"KeyRing",
		"KeyRing",
		"KeyRing",
		"Связка ключей"
		},
	["Container"] = {
		"Container",
		"Container",
		"Container",
		"Контейнер"
		},
	["RightClick_MenuTitle"] = {
		"EngInventory @ EngBags",
		"EngInventory @ EngBags",
		"EngInventory @ EngBags",
		"EngInventory @ EngBags"
		},
	["RightClick_ShowNewItems"] = {
		"New Items",
		"New Items",
		"New Items",
		"Новые предметы"
		},
	["soulbound_search"] = {	-- looking for soulbound keyword is special
		"Soulbound",
		"Seelengebunden",
		"Soulbound",
		"Персональный предмет"
		},

	["Warlock"] = {
		"Warlock",
		"Warlock",
		"Warlock",
		"Чернокнижник"
		},
	["Priest"] = {
		"Priest",
		"Priest",
		"Priest",
		"Жрец"
		},
	["Mage"] = {
		"Mage",
		"Mage",
		"Mage",
		"Маг"
		},
	["Rogue"] = {
		"Rogue",
		"Rogue",
		"Rogue",
		"Разбойник"
		},
	["Warrior"] = {
		"Warrior",
		"Warrior",		
		"Warrior",
		"Воин"
		},
	["Hunter"] = {
		"Hunter",
		"Hunter",
		"Hunter",
		"Охотник"
		},
	["Shaman"] = {
		"Shaman",
		"Shaman",
		"Shaman",
		"Шаман"
		},
	["Druid"] = {
		"Druid",
		"Druid",
		"Druid",
		"Друид"
		},
	["Paladin"] = {
		"Paladin",
		"Paladin",
		"Paladin",
		"Паладин"
		},
	["Cooking"] = {
		"Cooking",
		"Cooking",
		"Cooking",
		"Кулинария"
		},
	["First Aid"] = {
		"First Aid",
		"First Aid",
		"First Aid",
		"Первая помощь"
		},

	["string_searches"] = {
		{ -- english
			{ "FOOD", "Restores ([0-9.]+) health over ([0-9.]+) sec" },
			{ "DRINK", "Restores ([0-9.]+) mana over ([0-9.]+) sec" },
			{ "HEALINGPOTION", "Restores ([0-9.]+) to ([0-9.]+) health." },
			{ "MANAPOTION", "Restores ([0-9.]+) to ([0-9.]+) mana." },
			{ "PROJECTILE", "Projectile" },
			{ "JUJU", "Juju" },
			{ "BANDAGE", " Bandage" },
			{ "HEALTHSTONE", " Healthstone" },
			{ "RECIPE", "Recipe:" },
			{ "PATTERN", "Pattern:" },
			{ "SCHEMATIC", "Schematic:" },
			{ "FORMULA", "Formula:" },
			{ "MINIPET", "Right Click to summon and dismiss your" },
			{ "ROGUE_POISON", "Crippling Poison [IV]*" },
			{ "ROGUE_POISON", "Deadly Poison [IV]*" },
			{ "ROGUE_POISON", "Instant Poison [IV]*" },
			{ "ROGUE_POISON", "Mind-numbing Poison [IV]*" },
			{ "ROGUE_POISON", "Wound Poison [IV]*" },
			{ "ROGUE_POWDER", "Blinding Powder" },
			{ "ROGUE_POWDER", "Flash Powder" },
			{ "QUESTITEMS", "Use: Bind pages [0-9]" },	-- shredder operating manual & green hills of stranglethorn
			{ "KEYS", " Key" },
			{ "KEYS", "Key" }
		},
		{ -- german
			{ "FOOD", "Stellt im Verlauf von ([0-9.]+) Sek. ([0-9.]+) Punkt(e) Gesundheit wieder her." },
			{ "DRINK", "Stellt im Verlauf von ([0-9.]+) Sek. ([0-9.]+) Punkt(e) Mana wieder her." },
			{ "INSTANT_HP", "Stellt ([0-9.]+) bis ([0-9.]+) Punkt(e) Gesundheit wieder her." },
			{ "INSTANT_MANA", "Stellt ([0-9.]+) bis ([0-9.]+) Punkt(e) Mana wieder her." },
			{ "PROJECTILE", "Projektil" },
			{ "JUJU", "Juju" },
			{ "BANDAGE", "Verband" },
			{ "HEALTHSTONE", "Gesundheitsstein" },
		},
		{ -- french
		},
		{ -- russian
			{ "FOOD", "Восстанавливает ([0-9.]+) ед. здоровья за ([0-9.]+) сек." },
			{ "DRINK", "Восполнение ([0-9.]+) ед. маны за ([0-9.]+) сек." },
			{ "HEALINGPOTION", "- ([0-9.]+) ед. здоровья." },
			{ "MANAPOTION", "- ([0-9.]+) ед. маны." },
			{ "PROJECTILE", "Боеприпасы" },
			{ "JUJU", "джуджу" },
			{ "BANDAGE", " бинты" },
			{ "HEALTHSTONE", " камень здоровья" },
			{ "RECIPE", "Рецепт:" },
			{ "PATTERN", "Выкройка:" },
			{ "SCHEMATIC", "Схема:" },
			{ "FORMULA", "Формула:" },
			{ "MINIPET", "Щелкните правой кнопкой мыши, чтобы призвать или отпустить" },
			{ "ROGUE_POISON", "Калечащий яд [IV]*" },
			{ "ROGUE_POISON", "Смертельный яд [IV]*" },
			{ "ROGUE_POISON", "Быстродействующий яд [IV]*" },
			{ "ROGUE_POISON", "Дурманящий яд [IV]*" },
			{ "ROGUE_POISON", "Нейтрализующий яд [IV]*" },
			{ "ROGUE_POWDER", "Ослепляющий порошок" },
			{ "ROGUE_POWDER", "Воспламеняющийся порошок" },
			{ "QUESTITEMS", "Использование: Переплести страницы [0-9]" },	-- shredder operating manual & green hills of stranglethorn
			{ "KEYS", "Ключ" },
			{ "KEYS", "Отмычка" },
			{ "KEYS", "отмычка" },
			{ "KEYS", "ключ" }
		},
		},	-- end of string searches
	-- values from GetItemInfo()  (itemType)
	["tradegoods"] = {
		"Trade Goods",
		"Handwerkswaren",
		"Trade Goods",
		"Хозяйственные товары"
		},
	["miscellaneous"] = {
		"Miscellaneous",
		"Verschiedenes",
		"Misellaneous",
		"Разное"
		},
	["reagent"] = {
		"Reagent",
		"Reagenz",
		"Reagent",
		"Реагент"
		},
	["quest"] = {
		"Quest",
		"Quest",
		"Quest",
		"Задания"
		},
	["consumable"] = {
		"Consumable",
		"Verbrauchbar",
		"consumable",
		"Расходуемые"
		},

	-- window elements
	["EngInventory_Button_HighlightToggle_on"] = {
		"Hilight New: ON",
		"Hilight New: ON",
		"Hilight New: ON",
		"Подсветка новых: вкл"
		},
	["EngInventory_Button_HighlightToggle_on_tooltip"] = {
		"Highlight of new items is on.",
		"Highlight of new items is on.",
		"Highlight of new items is on.",
		"Подсветка новых предметов включена."
		},
	["EngInventory_Button_HighlightToggle_off"] = {
		"Hilight New: OFF",
		"Hilight New: OFF",
		"Hilight New: OFF",
		"Подсветка новых: выкл"
		},
	["EngInventory_Button_BankToggle"] = {
		"Bank",
		"Bank",
		"Bank",
		"Банк"
		},
	["EngInventory_Button_HighlightToggle_off_tooltip"] = {
		"Highlight of new items is off.",
		"Highlight of new items is off.",
		"Highlight of new items is off.",
		"Подсветка новых предметов выключена."
		},
	["EngInventory_Button_MoveLock_locked"] = {
		"L",
		"L",
		"L",
		"З"
		},
	["EngInventory_Button_MoveLock_unlocked"] = {
		"U",
		"U",
		"U",
		"Р"
		},
	["EngInventory_Button_ChangeEditMode_MoveClass"] = {
		"Edit Mode",
		"Edit Mode",
		"Edit Mode",
		"Режим редактирования"
		},
	["EngInventory_Button_ChangeEditMode_MoveItem"] = {
		"Move Items",
		"Move Items",
		"Move Items",
		"Двигать предметы"
		},
	["EngInventory_Button_ChangeEditMode_off"] = {
		"Edit",
		"Edit",
		"Edit",
		"Редактировать"
		},
	["EngInventory_Button_ChangeEditMode_tooltip_title"] = {
		"Modify Sort Locations",
		"Modify Sort Locations",
		"Modify Sort Locations",
		"Изменить сортировку местоположений"
		},
	["EngInventory_Button_ChangeEditMode_tooltip"] = {
		"Edit Mode:\n  Select this option to move classes of items into different 'bars' (the red numbers).\n\n",
		"Edit Mode:\n  Select this option to move classes of items into different 'bars' (the red numbers).\n\n",
		"Edit Mode:\n  Select this option to move classes of items into different 'bars' (the red numbers).\n\n",
		"Режим редактирования:\n  Выбрать эту опцию для перемещения классов предметов в разные бары (красные цифры).\n\n"
		},

	["EngInventory_Button_ColumnsAdd_buttontitle"] = {
		"<<-- -->>",
		"<<-- -->>",
		"<<-- -->>",
		"<<-- -->>"
		},
	["EngInventory_Button_ColumnsAdd_tooltip_title"] = {
		"Window Size",
		"Window Size",
		"Window Size",
		"Размер окна"
		},
	["EngInventory_Button_ColumnsAdd_tooltip"] = {
		"Increase the number of columns displayed",
		"Increase the number of columns displayed",
		"Increase the number of columns displayed",
		"Увеличить число отображаемых столбцов"
		},

	["EngInventory_Button_ColumnsDel_buttontitle"] = {
		"-->> <<--",
		"-->> <<--",
		"-->> <<--",
		"-->> <<--"
		},
	["EngInventory_Button_ColumnsDel_tooltip_title"] = {
		"Window Size",
		"Window Size",
		"Window Size",
		"Размер окна"
		},
	["EngInventory_Button_ColumnsDel_tooltip"] = {
		"Decrease the number of columns displayed",
		"Decrease the number of columns displayed",
		"Decrease the number of columns displayed",
		"Уменьшить число отображаемых столбцов"
		},

	["help_text"] = {
		"EN",
		"DE",
		"FR",
		"RU"
		}
}

function EngInventory_load_Localization(loadlang)
	local loadlang_num = 1;

	EngBags_PrintDEBUG("Loading localization: '"..loadlang.."'");

	if ( loadlang == "EN" ) then
		loadlang_num = 1;
	elseif ( loadlang == "DE" ) then
		loadlang_num = 2;
	elseif ( loadlang == "FR" ) then
		loadlang_num = 3;
	elseif ( loadlang == "RU" ) then
		loadlang_num = 4;
	end

	-- the string.gsub is there because the editor I'm using is being stupid and is randomly replaceing spaces with tabs.
	for key,value in ENGINVENTORY_LOCALIZATION do
		if (type(value[loadlang_num]) == "string") then
			EngBags_PrintDEBUG("localization: "..key.." set to '"..value[loadlang_num].."'");
			EILocal[key] = string.gsub(value[loadlang_num], "\t", " ");
		else
			EILocal[key] = value[loadlang_num];
		end
	end

	EILocal["_loaded"] = 1;
end