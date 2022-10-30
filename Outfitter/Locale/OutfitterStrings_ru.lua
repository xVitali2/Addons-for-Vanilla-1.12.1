if GetLocale() == "ruRU" then
-- Russian localization by Lichery
	Outfitter_cNameLabel = "Имя:";
	Outfitter_cCreateUsingTitle = "Свойства:";
	Outfitter_cUseCurrentOutfit = "Использовать текущие предметы";
	Outfitter_cUseEmptyOutfit = "Создать пустой комплект";

	Outfitter_cOutfitterTabTitle = "Комплекты";
	Outfitter_cOptionsTabTitle = "Опции";
	Outfitter_cAboutTabTitle = "Об аддоне";

	Outfitter_cNewOutfit = "Навый комплект";
	Outfitter_cRenameOutfit = "Переименовать";

	Outfitter_cCompleteOutfits = "Готовые комплекты";
	Outfitter_cPartialOutfits = "Комбинируемые";
	Outfitter_cAccessoryOutfits = "Аксессуары";
	Outfitter_cSpecialOutfits = "Специальные комплекты";
	Outfitter_cOddsNEndsOutfits = "Неиспользованные";

	Outfitter_cNormalOutfit = "Обычный";
	Outfitter_cNakedOutfit = "Костюм Дня Рождения";

	Outfitter_cFishingOutfit = "Рыбная ловля";
	Outfitter_cHerbalismOutfit = "Травничество";
	Outfitter_cMiningOutfit = "Горное дело";
	Outfitter_cSkinningOutfit = "Снятие шкур";
	Outfitter_cFireResistOutfit = "Сопротивление огню";
	Outfitter_cNatureResistOutfit = "Сопротивление силам природы";
	Outfitter_cShadowResistOutfit = "Сопротивление темной магии";
	Outfitter_cArcaneResistOutfit = "Сопротивление тайной магии";
	Outfitter_cFrostResistOutfit = "Сопротивление магии льда";

	Outfitter_cArgentDawnOutfit = "Серебряный Рассвет";
	Outfitter_cRidingOutfit = "Верховая езда";
	Outfitter_cDiningOutfit = "Прием пищи";
	Outfitter_cBattlegroundOutfit = "Поле боя";
	Outfitter_cABOutfit = "Поле боя: Низина Арати";
	Outfitter_cAVOutfit = "Поле боя: Альтеракская долина";
	Outfitter_cWSGOutfit = "Поле боя: Ущелье Песни Войны";
	Outfitter_cCityOutfit = "Около города";

	Outfitter_cMountSpeedFormat = "Скорость повышена на (%d+)%%."; -- For detecting when mounted

	Outfitter_cBagsFullError = "Outfitter: Не могу снять '%s' потому что все сумки заняты";
	Outfitter_cDepositBagsFullError = "Outfitter: Не могу вложить '%s' потому что все сумки в банке заняты";
	Outfitter_cWithdrawBagsFullError = "Outfitter: Не могу снять '%s' потому что все сумки заняты";
	Outfitter_cItemNotFoundError = "Outfitter: Не могу найти предмет '%s'";
	Outfitter_cItemAlreadyUsedError = "Outfitter: Не удается поместить '%s' в ячейку '%s', потому что предмет уже используется в другой ячейке";
	Outfitter_cAddingItem = "Outfitter: Добавлено '%s' в комплект '%s' ";
	Outfitter_cNameAlreadyUsedError = "Ошибка: Это имя уже используется!";
	Outfitter_cNoItemsWithStatError = "Предупреждение: Ни один из ваших предметов не имеют этот атрибут";

	Outfitter_cEnableAll = "Включить все";
	Outfitter_cEnableNone = "Выключить все";

	Outfitter_cConfirmDeleteMsg = "Вы уверены, что хотите удалить комплект %s?";
	Outfitter_cConfirmRebuildMsg = "Вы уверены, что хотите изменить комплект %s?";
	Outfitter_cRebuild = "Изменение";

	Outfitter_cWesternPlaguelands = "Западные Чумные земли";
	Outfitter_cEasternPlaguelands = "Восточные Чумные земли";
	Outfitter_cStratholme = "Стратхольм";
	Outfitter_cScholomance = "Некроситет";
	Outfitter_cNaxxramas = "Наксрамас";
	Outfitter_cAlteracValley = "Альтеракская долина";
	Outfitter_cArathiBasin = "Низина Арати";
	Outfitter_cWarsongGulch = "Ущелье Песни Войны";
	Outfitter_cIronforge = "Стальгорн";
	Outfitter_cCityOfIronforge = "Стальгорн";
	Outfitter_cDarnassus = "Дарнасс";
	Outfitter_cStormwind = "Штормград";
	Outfitter_cOrgrimmar = "Огриммар";
	Outfitter_cThunderBluff = "Громовой Утес";
	Outfitter_cUndercity = "Подгород";

	Outfitter_cFishingPole = "Удочка";
	Outfitter_cStrongFishingPole = "Крепкая удочка";
	Outfitter_cBigIronFishingPole = "Большая железная удочка";
	Outfitter_cBlumpFishingPole = "Удочка семейства Блумп";
	Outfitter_cNatPaglesFishingPole = "Экстремальная рыбалка FC-5000 Ната Пэгла";
	Outfitter_cArcaniteFishingPole = "Арканитовая удочка";

	Outfitter_cArgentDawnCommission = "Жетон Серебряного Рассвета";
	Outfitter_cSealOfTheDawn = "Печать Рассвета";
	Outfitter_cRuneOfTheDawn = "Руна Рассвета";

	Outfitter_cCarrotOnAStick = "Морковка на палочке";

	Outfitter_cItemStatFormats = {
		{Format = "Выносливость %+(%d+)", Types = {"Stamina"}},
		{Format = "Интеллект %+(%d+)", Types = {"Intellect"}},
		{Format = "Ловкость %+(%d+)", Types = {"Agility"}},
		{Format = "Сила %+(%d+)", Types = {"Strength"}},
		{Format = "Дух %+(%d+)", Types = {"Spirit"}},
		{Format = "Броня %+(%d+)", Types = {"Armor"}},
		{Format = "Защита %+(%d+)", Types = {"Defense"}},
		{Format = "Рейтинг защиты %+(%d+)", Types = {"Defense"}},
	
		{Format = "%+(%d+) Выносливость", Types = {"Stamina"}},
		{Format = "%+(%d+) Интеллект", Types = {"Intellect"}},
		{Format = "%+(%d+) Ловкость", Types = {"Agility"}},
		{Format = "%+(%d+) Сила", Types = {"Strength"}},
		{Format = "%+(%d+) Дух", Types = {"Spirit"}},
		{Format = "(%d+) Броня", Types = {"Armor"}},
		{Format = "%+(%d+) Сила атаки", Types = {"Attack"}},
	
		{Format = "Все характеристики %+(%d+)", Types = {"Stamina", "Intellect", "Agility", "Strength", "Spirit"}},
	
		{Format = "Мана %+(%d+)", Types = {"Mana"}},
		{Format = "Здоровье %+(%d+)", Types = {"Health"}},
	
		{Format = "%+(%d+) ед. маны раз в 5 сек.", Types = {"ManaRegen"}},
		{Format = "Восполнение (%d+) ед. маны раз в 5 сек.", Types = {"ManaRegen"}},
	
		{Format = "%+(%d+) ед. здоровья раз в 5 сек.", Types = {"HealthRegen"}},
		{Format = "Восполняет (%d+) ед. здоровья раз в 5 сек.", Types = {"HealthRegen"}},
		{Format = "Восполняет (%d+) ед. здоровья раз в 5 сек.", Types = {"HealthRegen"}},
	
		{Format = "Небольшое повышение скорости верхового животного", Value = 3, Types = {"Riding"}},
		{Format = "Мифриловые шпоры", Value = 3, Types = {"Riding"}},
	
		{Format = "%+(%d+) Сопротивление огню", Types = {"FireResist"}},
		{Format = "%+(%d+) Сопротивление силам природы", Types = {"NatureResist"}},
		{Format = "%+(%d+) Сопротивление магии льда", Types = {"FrostResist"}},
		{Format = "%+(%d+) Сопротивление темной магии", Types = {"ShadowResist"}},
		{Format = "%+(%d+) Сопротивление тайной магии", Types = {"ArcaneResist"}},
		{Format = "%+(%d+) Все сопротивления", Types = {"FireResist", "NatureResist", "FrostResist", "ShadowResist", "ArcaneResist"}},
	
		{Format = "Урон от оружия %+(%d+)", Types = {"MeleeDmg"}},
		{Format = "Повышает меткость на (%d+)%%", Types = {"MeleeHit"}},
		{Format = "Увеличивает вероятность нанести критический удар на (%d+)%%", Types = {"MeleeCrit"}},
		{Format = "Повышает вероятность уклонения от атак на (%d+)%%", Types = {"Dodge"}},
		{Format = "Урон %+(%d+)", Types = {"MeleeDmg"}},
		{Format = "(%d+) Блок", Types = {"Block"}},
		{Format = "Показатель блока %+(%d+)", Types = {"Block"}},
		{Format = "Увеличивает показатель блокирования вашего щита на (%d+)", Types = {"Block"}},
	
		{Format = "Навык рыбной ловли увеличивается на %+(%d+)%.", Types = {"Fishing"}},
		{Format = "Рыбная ловля %+(%d+)", Types = {"Fishing"}},
		{Format = "Травничество %+(%d+)", Types = {"Herbalism"}},
		{Format = "Горное дело %+(%d+)", Types = {"Mining"}},
		{Format = "Снятие шкур %+(%d+)", Types = {"Skinning"}},
	
		{Format = "Повышает вероятность нанести критеческий удар заклинаниями на (%d+)%%", Types = {"SpellCrit"}},
		{Format = "Повышает меткость заклинаний (%d+)%%", Types = {"SpellHit"}},
		{Format = "Увеличивает урон и исцеляющие действия магических эффектов и заклинаний не более чем на (%d+)", Types = {"SpellDmg", "ShadowDmg", "FireDmg", "FrostDmg", "ArcaneDmg", "NatureDmg", "Healing"}},
		{Format = "Увеличивает исцеляющие действия эффектов и заклинаний не более чем на (%d+)", Types = {"Healing"}},
		{Format = "Healing Spells %+(%d+)", Types = {"Healing"}}, -- ???
		{Format = "%+(%d+) Healing Spells", Types = {"Healing"}}, -- ???
	
		{Format = "%+(%d+) ед. урона от магии огня", Types = {"FireDmg"}},
		{Format = "%+(%d+) ед. урона от темной магии", Types = {"ShadowDmg"}},
		{Format = "%+(%d+) ед. урона от магии льда", Types = {"FrostDmg"}},
		{Format = "%+(%d+) ед. урона от тайной магии", Types = {"ArcaneDmg"}},
		{Format = "%+(%d+) ед. урона от сил природы", Types = {"NatureDmg"}},

		{Format = "Увеличивает урон, наносимый заклинаниями и эффектами магии огня не более чем на (%d+)", Types = {"FireDmg"}},
		{Format = "Увеличивает урон, наносимый заклинаниями и эффектами темной магии не более чем на (%d+)", Types = {"ShadowDmg"}},
		{Format = "Увеличивает урон, наносимый заклинаниями и эффектами магии льда не более чем на (%d+)", Types = {"FrostDmg"}},
		{Format = "Увеличивает урон, наносимый заклинаниями и эффектами тайной магии не более чем на (%d+)", Types = {"ArcaneDmg"}},
		{Format = "Увеличивает урон, наносимый заклинаниями и эффектами сил природы не более чем на (%d+)", Types = {"NatureDmg"}},
	};

	Outfitter_cAgilityStatName = "Ловкость";
	Outfitter_cArmorStatName = "Броня";
	Outfitter_cDefenseStatName = "Защита";
	Outfitter_cIntellectStatName = "Интеллект";
	Outfitter_cSpiritStatName = "Дух";
	Outfitter_cStaminaStatName = "Выносливость";
	Outfitter_cStrengthStatName = "Сила";

	Outfitter_cManaRegenStatName = "Восстановление маны";
	Outfitter_cHealthRegenStatName = "Восстановление здоровья";

	Outfitter_cSpellCritStatName = "Критический удар заклинанием";
	Outfitter_cSpellHitStatName = "Шанс попадания заклинаниями";
	Outfitter_cSpellDmgStatName = "Урон от заклинания";
	Outfitter_cFrostDmgStatName = "Урон от магии льда";
	Outfitter_cFireDmgStatName = "Урон от магии огня";
	Outfitter_cArcaneDmgStatName = "Урон от тайной магии";
	Outfitter_cShadowDmgStatName = "Урон от темной магии";
	Outfitter_cNatureDmgStatName = "Урон от природы";
	Outfitter_cHealingStatName = "Исцеление";

	Outfitter_cMeleeCritStatName = "Крит. попадания";
	Outfitter_cMeleeHitStatName = "Шанс попадания";
	Outfitter_cMeleeDmgStatName = "Урон";
	Outfitter_cAttackStatName = "Сила атаки";
	Outfitter_cDodgeStatName = "Уклонение";

	Outfitter_cArcaneResistStatName = "Сопротивление тайной магии";
	Outfitter_cFireResistStatName = "Сопротивление огню";
	Outfitter_cFrostResistStatName = "Сопротивление магии льда";
	Outfitter_cNatureResistStatName = "Сопротивление силам природы";
	Outfitter_cShadowResistStatName = "Сопротивление темной магии";

	Outfitter_cFishingStatName = "Рыбная ловля";
	Outfitter_cHerbalismStatName = "Травничество";
	Outfitter_cMiningStatName = "Горное дело";
	Outfitter_cSkinningStatName = "Снятие шкур";

	Outfitter_cOptionsTitle = "Опции Outfitter";
	Outfitter_cShowMinimapButton = "Показать кнопку на миникарте";
	Outfitter_cShowMinimapButtonOnDescription = "Выключите эту опцию, если вы хотите убрать кнопку Outfitter с вашей миникарты";
	Outfitter_cShowMinimapButtonOffDescription = "Включите эту опцию, если вы хотите использовать кнопку Outfitter на вашей миникарте";
	Outfitter_cRememberVisibility = "Запомнить настройки для плаща/шлема";
	Outfitter_cRememberVisibilityOnDescription = "Выключите эту опцию, если вы хотите использовать одну настройку показать/скрыть для всех плащей и шлемов";
	Outfitter_cRememberVisibilityOffDescription = "Включите эту опцию, если вы хотите, чтобы Outfitter запоминал ваше предпочтение показывать/скрывать для каждого плаща и шлема";
	Outfitter_cShowHotkeyMessages = "Показать назначенные клавиши";
	Outfitter_cShowHotkeyMessagesOnDescription = "Выключите эту опцию, если вы не хотите видеть сообщение при смене комплектов с использованием назначенных клавиш";
	Outfitter_cShowHotkeyMessagesOffDescription = "Включите эту опцию, если вы хотите видеть сообщение при смене комплектов с использованием назначенных клавиш";

	Outfitter_cEquipOutfitMessageFormat = "Outfitter: %s одето";
	Outfitter_cUnequipOutfitMessageFormat = "Outfitter: %s снять";

	Outfitter_cAboutTitle = "Об Outfitter";
	Outfitter_cAuthor = "Разработано и написано John Stephen";
	Outfitter_cTestersTitle = "Бета-тестеры";
	Outfitter_cSpecialThanksTitle = "Особая благодарность за поддержку";

	Outfitter_cOpenOutfitter = "Открыть Outfitter";

	Outfitter_cArgentDawnOutfitDescription = "Этот комплект будет автоматически одет всякий раз, когда вы находитесь в зоне '... Чумные земли'";
	Outfitter_cRidingOutfitDescription = "Этот комплект будет автоматически одет всякий раз, когда вы находитесь на средстве передвижения";
	Outfitter_cDiningOutfitDescription = "Этот комплект будет автоматически одет всякий раз, когда вы ешьте или пьете";
	Outfitter_cBattlegroundOutfitDescription = "Этот комплект будет автоматически одет всякий раз, когда вы находитесь на поле боя";
	Outfitter_cArathiBasinOutfitDescription = "Этот комплект будет автоматически одет всякий раз, когда вы находитесь на поле боя 'Низина Арати'";
	Outfitter_cAlteracValleyOutfitDescription = "Этот комплект будет автоматически одет всякий раз, когда вы находитесь на поле боя 'Альтеракская долина'";
	Outfitter_cWarsongGulchOutfitDescription = "Этот комплект будет автоматически одет всякий раз, когда вы находитесь на поле боя 'Ущелье Песни Войны'";
	Outfitter_cCityOutfitDescription = "Этот комплект будет автоматически одет всякий раз, когда вы находитесь в дружественной крупном городе";

	Outfitter_cKeyBinding = "Назначение клавиш";

	BINDING_NAME_OUTFITTER_OUTFIT1  = "Комплект 1";
	BINDING_NAME_OUTFITTER_OUTFIT2  = "Комплект 2";
	BINDING_NAME_OUTFITTER_OUTFIT3  = "Комплект 3";
	BINDING_NAME_OUTFITTER_OUTFIT4  = "Комплект 4";
	BINDING_NAME_OUTFITTER_OUTFIT5  = "Комплект 5";
	BINDING_NAME_OUTFITTER_OUTFIT6  = "Комплект 6";
	BINDING_NAME_OUTFITTER_OUTFIT7  = "Комплект 7";
	BINDING_NAME_OUTFITTER_OUTFIT8  = "Комплект 8";
	BINDING_NAME_OUTFITTER_OUTFIT9  = "Комплект 9";
	BINDING_NAME_OUTFITTER_OUTFIT10 = "Комплект 10";

	Outfitter_cDisableOutfit = "Отключить комплект";
	Outfitter_cDisableOutfitInBG = "Отключить комплект на полях боя";
	Outfitter_cDisabledOutfitName = "%s (Отключено)";

	Outfitter_cMinimapButtonDescription = "Нажмите, чтобы выбрать другой комплект или перетащите эту кнопку.";

	Outfitter_cDruidClassName = "Друид";
	Outfitter_cHunterClassName = "Охотник";
	Outfitter_cMageClassName = "Маг";
	Outfitter_cPaladinClassName = "Паладин";
	Outfitter_cPriestClassName = "Жрец";
	Outfitter_cRogueClassName = "Разбойник";
	Outfitter_cShamanClassName = "Шаман";
	Outfitter_cWarlockClassName = "Чернокнижник";
	Outfitter_cWarriorClassName = "Воин";

	Outfitter_cBattleStance = "Боевая стойка";
	Outfitter_cDefensiveStance = "Оборонительная стойка";
	Outfitter_cBerserkerStance = "Стойка берсерка";

	Outfitter_cWarriorBattleStance = "Воин: Боевая стойка";
	Outfitter_cWarriorDefensiveStance = "Воин: Оборонительная стойка";
	Outfitter_cWarriorBerserkerStance = "Воин: Стойка берсерка";

	Outfitter_cBearForm = "Облик медведя";
	Outfitter_cCatForm = "Облик кошки";
	Outfitter_cAquaticForm = "Водный облик";
	Outfitter_cTravelForm = "Походный облик	";
	Outfitter_cDireBearForm = "Облик лютого медведя";
	Outfitter_cMoonkinForm = "Облик лунного совуха";

	Outfitter_cGhostWolfForm = "Призрачный волк";

	Outfitter_cStealth = "Незаметность";

	Outfitter_cDruidBearForm = "Друид: Облик медведя";
	Outfitter_cDruidCatForm = "Друид: Облик кошки";
	Outfitter_cDruidAquaticForm = "Друид: Водный облик";
	Outfitter_cDruidTravelForm = "Друид: Походный облик	";
	Outfitter_cDruidMoonkinForm = "Друид: Облик лунного совуха";

	Outfitter_cPriestShadowform = "Жрец: Облик Тьмы";

	Outfitter_cRogueStealth = "Разбойник: Незаметность";

	Outfitter_cShamanGhostWolf = "Шаман: Призрачный волк";

	Outfitter_cHunterMonkey = "Охотник: Обезьяна";
	Outfitter_cHunterHawk =  "Охотник: Ястреб";
	Outfitter_cHunterCheetah =  "Охотник: Гепард";
	Outfitter_cHunterPack =  "Охотник: Стая";
	Outfitter_cHunterBeast =  "Охотник: Зверь";
	Outfitter_cHunterWild =  "Охотник: Дикая природа";

	Outfitter_cMageEvocate = "Маг: Прилив сил";

	Outfitter_cAspectOfTheCheetah = "Дух гепарда";
	Outfitter_cAspectOfThePack = "Дух стаи";
	Outfitter_cAspectOfTheBeast = "Дух зверя";
	Outfitter_cAspectOfTheWild = "Дух дикой природы";
	Outfitter_cEvocate = "Прилив сил";

	Outfitter_cCompleteCategoryDescripton = "Полные комплекты имеют определенные предметы, указанные для каждой ячейки и заменят все остальные комплекты при экипировки.";
	Outfitter_cPartialCategoryDescription = "Комбинируемые комплекты имеют предметы, указанные в некоторых ячейках, но не во всех. При экипировании они одеваются поверх вашего выбранного полного комплекта, заменяя любой другой выбранный комбинируемый комплект или комплект аксессуаров.";
	Outfitter_cAccessoryCategoryDescription = "Комплекты аксессуаров имеют предметы, указанные в некоторых ячейках, но не во всех. В отличии от комбинируемых, вы можете выбрать множество комплектов аксессуаров, какие вам нравятся и они все будут объединены вместе, и одеваются поверх вашего выбранного полного и комбинируемого комплекта.";
	Outfitter_cSpecialCategoryDescription = "Комплекты для особых случаев.";
	Outfitter_cOddsNEndsCategoryDescription = "Список неиспользованных предметов.";

	Outfitter_cRebuildOutfitFormat = "Изменение для %s";

	Outfitter_cTranslationCredit = "Русская локализация: Lichery";

	Outfitter_cSlotEnableTitle = "Включить/выключить ячейку";
	Outfitter_cSlotEnableDescription = "Поставьте галочку, если вы хотите использовать эту ячейку в выбранном комплекте. Если галочка не стоит, данная ячейка не будет учавствовать в смене предметов для данного комплекта.";

	Outfitter_cFinger0SlotName = "Первое кольцо";
	Outfitter_cFinger1SlotName = "Второе кольцо";

	Outfitter_cTrinket0SlotName = "Первый аксессуар";
	Outfitter_cTrinket1SlotName = "Второй аксессуар";

	Outfitter_cOutfitCategoryTitle = "Категории";
	Outfitter_cBankCategoryTitle = "Банк";
	Outfitter_cDepositToBank = "Вложить все предметы в банк";
	Outfitter_cDepositUniqueToBank = "Вложить уникальные предметы в банк";
	Outfitter_cWithdrawFromBank = "Вывод элементов из банка";

	Outfitter_cMissingItemsLabel = "Недостающие предметы: ";
	Outfitter_cBankedItemsLabel = "Предметы в банке: ";

	Outfitter_cRepairAllBags = "Outfitter: Починить все сломанные предметы";

	Outfitter_cStatsCategory = "Характеристики";
	Outfitter_cMeleeCategory = "Ближний бой";
	Outfitter_cSpellsCategory = "Исцеление и заклинания";
	Outfitter_cRegenCategory = "Восстановление";
	Outfitter_cResistCategory = "Сопротивление";
	Outfitter_cTradeCategory = "Профессиональные навыки";

	Outfitter_cCustom = "Пользовательские";
end