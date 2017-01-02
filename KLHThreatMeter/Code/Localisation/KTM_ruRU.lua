-- Version : Russian ( by Maus )

klhtm.string.data["ruRU"] = 
{
	["binding"] = 
	{
		hideshow = "Скрыть / Показать окно",
		stop = "Аварийная остановка",
		mastertarget = "Установка / Очистка мастера цели",
		resetraid = "Сброс рейд. угрозы",
	},
	["spell"] = 
	{
		-- 17.20
		["execute"] = "Казнь",
		
		["heroicstrike"] = "Удар героя",
		["maul"] = "Трепка",
		["swipe"] = "Размах",
		["shieldslam"] = "Мощный удар щитом",
		["revenge"] = "Реванш",
		["shieldbash"] = "Удар щитом",
		["sunder"] = "Раскол брони",
		["feint"] = "Ложный выпад",
		["cower"] = "Попятиться",
		["taunt"] = "Провокация",
		["growl"] = "Рык",
		["vanish"] = "Исчезновение",
		["frostbolt"] = "Ледяная стрела",
		["fireball"] = "Огненный шар",
		["arcanemissiles"] = "Чародейские стрелы",
		["scorch"] = "Ожог",
		["cleave"] = "Рассекающий удар",
		
		hemorrhage = "Кровоизлияние",
		backstab = "Удар в спину",
		sinisterstrike = "Коварный удар",
		eviscerate = "Потрошение",
		corruption = "Corruption",
		curseofagony = "Curse of Agony",
		siphonlife = "Siphon Life",
		immolate = "Immolate",
		
		-- Items / Buffs:
		["arcaneshroud"] = "Чародейский покров",
		["reducethreat"] = "Снижение угрозы",
		["theeyeofdiminution"] = "The Eye of Diminution",
		["notthere"] = "Not There",

		-- Leeches: no threat from heal
		["holynova"] = "Кольцо света", -- no heal or damage threat
		["siphonlife"] = "Вытягивание жизни", -- no heal threat
		["drainlife"] = "Похищение жизни", -- no heal threat
		["deathcoil"] = "Лик смерти",	
		
		-- Fel Stamina and Fel Energy DO cause threat! GRRRRRRR!!!
		--["felstamina"] = "Fel Stamina",
		--["felenergy"] = "Fel Energy",
		
		["bloodsiphon"] = "Кровавый насос", -- poisoned blood vs Hakkar
		
		["lifetap"] = "Жизнеотвод", -- no mana gain threat
		["holyshield"] = "Щит нечестивости", -- multiplier
		["tranquility"] = "Спокойствие",
		["distractingshot"] = "Отвлекающий выстрел",
		["earthshock"] = "Земной шок",
		["rockbiter"] = "Оружие Камнедробителя",
		["fade"] = "Слиться с тенью",
		["thunderfury"] = "Неистовство бури",
		
		-- Spell Sets
		-- warlock descruction
		["shadowbolt"] = "Стрела Тьмы",
		["immolate"] = "Жертвенный огонь",
		["conflagrate"] = "Поджигание",
		["searingpain"] = "Жгучая боль", -- 2 threat per damage
		["rainoffire"] = "Огненный ливень",
		["soulfire"] = "Ожог души",
		["shadowburn"] = "Ожог Тьмы",
		["hellfire"] = "Адское пламя",
		
		-- mage offensive arcane
		["arcaneexplosion"] = "Чародейский взрыв",
		["counterspell"] = "Антимагия",
		
		-- priest shadow. No longer used (R17).
		["mindblast"] = "Взрыв разума",	-- 2 threat per damage
		--[[
		["mindflay"] = "Mind Flay",
		["devouringplague"] = "Devouring Plague",
		["shadowwordpain"] = "Shadow Word: Pain",
		,
		["manaburn"] = "Mana Burn",
		]]
	},
	["power"] = 
	{
		["mana"] = "Мана",
		["rage"] = "Ярость",
		["energy"] = "Энергия",
	},
	["threatsource"] = -- these values are for user printout only
	{
		["powergain"] = "Power Gain",
		["total"] = "Всего",
		["special"] = "Особые",
		["healing"] = "Исцеление",
		["dot"] = "Период. урон",
		["threatwipe"] = "Закл. НПС",
		["damageshield"] = "Урон щитом",
		["whitedamage"] = "Белый урон",
	},
	["talent"] = -- these values are for user printout only
	{
		["defiance"] = "Неукротимость",
		["impale"] = "Прокалывание",
		["silentresolve"] = "Молчаливая решимость",
		["frostchanneling"] = "Направленная сила льда",
		["burningsoul"] = "Пылающая душа",
		["healinggrace"] = "Исцеляющая благодать",
		["shadowaffinity"] = "Единение с Тьмой",
		["druidsubtlety"] = "Druid Subtlety",
		["feralinstinct"] = "Feral Instinct",
		["ferocity"] = "Свирепость",
		["savagefury"] = "Бешеное неистовство",
		["tranquility"] = "Улучшенное спокойствие",
		["masterdemonologist"] = "Мастер-демонолог",
		["arcanesubtlety"] = "Искусные чары",
		["righteousfury"] = "Праведное неистовство",
		["sleightofhand"] = "Ловкость рук",
	},
	["threatmod"] = -- these values are for user printout only
	{
		["tranquilair"] = "Тотем безветрия",
		["salvation"] = "Благословение спасения",
		["battlestance"] = "Боевая стойка",
		["defensivestance"] = "Оборонительная стойка",
		["berserkerstance"] = "Стойка берсерка",
		["defiance"] = "Неукротимость",
		["basevalue"] = "Base Value",
		["bearform"] = "Облик медведя",
		["catform"] = "Облик кошки",
		["glovethreatenchant"] = "+Threat Enchant to Gloves",
		["backthreatenchant"] = "-Threat Enchant to Back",
	},
	
	["sets"] = 
	{
		["bloodfang"] = "Кровавых Клыков",
		["nemesis"] = "Возмездия",
		["plagueheart"] = "Plagueheart",
		["bonescythe"] = "Bonescythe",
		["netherwind"] = "ветра Пустоты",
		["might"] = "Мощи",
		["arcanist"] = "Чародея",
	},
	["boss"] = 
	{
		["speech"] = 
		{
			["razorphase2"] = "убегает, как только сила сферы пошла на спад.",
			["onyxiaphase3"] = "Похоже, вам требуется преподать еще один урок",
			["thekalphase2"] = "наполни меня своим ГНЕВОМ",
			["rajaxxfinal"] = "Настырная тварь! Я сам тебя убью!",
			["azuregosport"] = "Сюда, малыши",
			["nefphase2"] = "Горите, мерзавцы, ГОРИТЕ!",
			["thad1"] = "EAT YOUR BONES",
			["thad2"] = "BREAK YOU!",
			["thad3"] = "KILL!",
			["noth1"] = "Die, trespasser!",
			["noth2"] = "Glory to the master!",
			["noth3"] = "Your life is forfeit!",
			["ktphase2"] = "Pray for mercy!",
		},
		-- Some of these are unused. Also, if none is defined in your localisation, they won't be used,
		-- so don't worry if you don't implement it.
		["name"] = 
		{
			["rajaxx"] = "Генерал Раджакс",
			["onyxia"] = "Ониксия",
			["ebonroc"] = "Черноскал",
			["razorgore"] = "Бритвосмерт Неукротимый",
			["thekal"] = "Верховный жрец Текал",
			["shazzrah"] = "Шаззрах",
			["twinempcaster"] = "Император Век'лор",
			["twinempmelee"] = "Император Век'нилаш",
			["noth"] = "Нот Чумной",
		},
		["spell"] = 
		{
			["shazzrahgate"] = "Врата Шаззраха", -- "Shazzrah casts Gate of Shazzrah."
			["wrathofragnaros"] = "Гнев Рагнароса", -- "Ragnaros's Wrath of Ragnaros hits you for 100 Fire damage."
			["timelapse"] = "Искажение времени", -- "You are afflicted by Time Lapse."
			["knockaway"] = "Отталкивание",
			["wingbuffet"] = "Рассечение крылом",
			["burningadrenaline"] = "Горящий адреналин",
			["twinteleport"] = "Двойной телепорт",
			["nothblink"] = "Скачок",
			["sandblast"] = "Песчаный вихрь",
			["fungalbloom"] = "Поганочный цвет",
			["hatefulstrike"] = "Удар ненависти",
			
			-- 4 horsemen marks
			mark1 = "Знак Бломе",
			mark2 = "Знак Кортазза",
			mark3 = "Знак Могрейна",
			mark4 = "Знак Зелиека",
		}
	},
	["misc"] = 
	{
		["imp"] = "Imp", -- UnitCreatureFamily("pet")
		["spellrank"] = "Уровень (%d+)", -- second value of GetSpellName(x, "spell")
		["aggrogain"] = "Срыв Аггро",
	},

	-- labels and tooltips for the main window
	["gui"] = { 
		["raid"] = {
			["head"] = {
				-- column headers for the raid view
				["name"] = "Имя",
				["threat"] = "Угроза",
				["pc"] = "%Макс",			-- your threat as a percentage of the #1 player's threat
			},
			["stringshort"] = {
				-- tooltip titles for the bottom bar strings
				["tdef"] = "Срыв Аггро", -- the difference in threat between you and the MT / #1 in the list.
				["targ"] = "Мастер цели",
			},
			["stringlong"] = {
				-- tooltip descriptions for the bottom bar strings
				["tdef"] = "",
				["targ"] = "В настоящий момент в таблицу рейда записывается показатель угрозы только по отношению к (%s)"
			},
		},
		["self"] = {
			["head"] = {
				-- column headers for the self view
				["name"] = "Имя",
				["hits"] = "Попаданий",
				["rage"] = "Ярость",
				["dam"] = "Урон",
				["threat"] = "Угроза",
				["pc"] = "%У",			-- Abbreviation of %Threat
			},
			-- text on the self threat reset button
			["reset"] = "Сброс",
		},
		["title"] = {
			["text"] = {
				-- the window titles
				["long"] = "KTM %d.%d",	-- don't need to localise these
				["short"] = "KTM",
				
			},
			["buttonshort"] = {
				-- the tooltip titles for command buttons
				["close"] = "Закрыть",
				["min"] = "Свернуть",
				["max"] = "Развернуть",
				["self"] = "Персональные данные",
				["raid"] = "Данные рейда",
				["pin"] = "Закрепить",
				["unpin"] = "Открепить",
				["opt"] = "Настройки",
				["targ"] = "Мастер Цели",
				["clear"] = "Сброс",
			},
			["buttonlong"] = {
				-- the tooltip descriptions for command buttons
				["close"] = "Если вы находитесь в группе или рейде, данные по прежнему буду передаваться.",
				["min"] = "",
				["max"] = "",
				["self"] = "Показ персональных данных угрозы",
				["raid"] = "Показ данных угрозы рейда",
				["pin"] = "Предотвращает перемещение окна",
				["unpin"] = "Позволяет перемещать окно",
				["opt"] = "",
				["targ"] = "Установка Мастера Цели на вашу текущую цель. Если у вас нет цели, Мастер Цели очищается. Вы должны быть помощником или лидером рейда",
				["clear"] = "Обнуление угрозы всем игрокам. Вы должны быть помощником или лидером рейда.",
			},
			["stringshort"] = {
				-- the tooltip titles for titlebar strings
				["threat"] = "Угроза",
				["tdef"] = "Разница угрозы",
				["rank"] = "Уровень угрозы",
				["pc"] = "% Угрозы",
			},
			["stringlong"] = {
				-- the tooltip descriptions for titlebar strings
				["threat"] = "Значение уровня угрозы в ваших личных записях был сброшен",
				["tdef"] = "Разница между угрозой и целями",
				["rank"] = "Ваша позиция в списке угрозы",
				["pc"] = "Ваша угроза в виде процента в отношении к цели ",
			},
		},
	},
	-- labels and tooltips for the options gui
	["optionsgui"] = {
		["buttons"] = {
			-- the options gui command button labels
			["gen"] = "Общее",
			["raid"] = "Рейд",
			["self"] = "Свой",
			["close"] = "Закрыть",	
		},
		-- the labels for option checkboxes and headers
		["labels"] = {
			-- the title description for each option page
			["titlebar"] = {
				["gen"] = "Общие настройки",
				["raid"] = "Рейдовые настройки",
				["self"] = "Персональные настройки",
			},
			["buttons"] = {
				-- the names of title bar command buttons
				["pin"] = "Закрепить",
				["opt"] = "Настройки",
				["view"] = "Данные",
				["targ"] = "Мастер Цели",
				["clear"] = "Сброс рейд. угрозы",
			},
			["columns"] = {
				-- names of columns on the self and raid views
				["hits"] = "Попаданий",
				["rage"] = "Ярость",
				["dam"] = "Урон",
				["threat"] = "Угроза",
				["pc"] = "% угрозы",
			},
			["options"] = {
				-- miscelaneous option names
				["hide"] = "Скрыть строки с 0 угр.",
				["abbreviate"] = "Сокр. большие значения",
				["resize"] = "Изм. размера рамки",
				["aggro"] = "Показ. срыв аггро",
				["rows"] = "Макс. число вид. строк",
				["scale"] = "Масштаб. окна",
				["bottom"] = "Скрыть нижнюю панель",
			},
			["minvis"] = {
				-- the names of minimised strings
				["threat"] = "Мин. угрозы", -- dodge...
				["rank"] = "Ранг угрозы",
				["pc"] = "% угрозы",
				["tdef"] = "Разница угрозы",
			},
			["headers"] = {
				-- headers in the options gui
				["columns"] = "Видимые столбцы",
				["strings"] = "Мин. строки",
				["other"] = "Другие настройки",
				["minvis"] = "Мин. кнопки",
				["maxvis"] = "Макс. кнопки",
			},
		},
		-- the tooltips for some of the options
		["tooltips"] = {
			-- miscelaneous option descriptions
			["raidhide"] = "Если установлен флажок , игроки с нулевым показателем угрозы не будут видны в списке.",
			["selfhide"] = "Снимите флажок, чтобы увидеть все категории угрозы.",
			["abbreviate"] = "Если установлен флажок, значения, превышающие десять тысяч будут сокращены префиксом \"К\". Например \"15400\" станет \"15.4К\".",
			["resize"] = "Если установлен флажек, количество строк будет снижено, чтобы соответствовать количеству игроков в листе угрозы.",
			["aggro"] = "Если установлен фладок, игрок добавляется в дисплей рейда, на котором отображается срыв аггро. Для более точного значения рекомендуется поставить на цель Мастера Цели.",
			["rows"] = "Максимальное количество игроков в листе угрозы.",
			["bottom"] = "Если установлен флажок, будет скрыта нижняя строка.",
		},
	},
	["print"] = 
	{
		["main"] = 
		{
			["startupmessage"] = "KLHThreatMeter Версия |cff33ff33%s|r Ревизия |cff33ff33%s|r загружена. Введите |cffffff00/ktm|r для вызова справки.",
		},
		["data"] = 
		{
			["abilityrank"] = "Ваша %s способность %s ранга.",
			["globalthreat"] = "Ваш глобальный множитель угрозы %s.",
			["globalthreatmod"] = "%s предоставляет вам %s.",
			["multiplier"] = "%s, ваша угроза к %s умножается на %s.",
			["damage"] = "урон",
			["shadowspell"] = "заклинания темной магии",
			["arcanespell"] = "заклинания тайной магии",
			["holyspell"] = "заклинания светлой магии",
			["setactive"] = "%s %d активный? ... %s.",
			["true"] = "верно",
			["false"] = "ложно",
			["healing"] = "Ваше исцеление создают %s  угрозы (до глобального множителя угрозы)",
			["talentpoint"] = "У вас есть %d очков талантов %s.",
			["talent"] = "Обнаружены %d %s таланты.",
			["rockbiter"] = "Ваш уровень %d камнедробителя добавляет %d угрозы после успешных атак ближнего боя.",
		},
		
		-- new in R17.7
		["boss"] = 
		{
			["automt"] = "Мастер Цели автоматически установлен на %s.",
			["spellsetmob"] = "%s задает %s параметр %s %s способности %s с %s.", -- "Kenco sets the multiplier parameter of Onyxia's Knock Away ability to 0.7"
			["spellsetall"] = "%s устанавливает the %s параметр со %s способности в %s с %s.",
			["reportmiss"] = "%s сообщает что %s's %s промахнулся.",
			["reporttick"] = "%s сообщает что %s's %s попал. Он пострадал от %s тиков, и находится еще под %s тиками.",
			["reportproc"] = "%s сообщает что %s's %s изменил свою угрозу с %s на %s.",
			["bosstargetchange"] = "%s изменил свою цель с %s (на %s угрозы) на %s (на %s угрозы).",
			["autotargetstart"] = "Автоматически обнулится счетски угрозы и установтся Матсер Метски, когда вы атакуюете следующего мирового босса.",
			["autotargetabort"] = "Мастер Цели уже установлен на мирового босса %s.",
		},
		
		["network"] = 
		{
			["newmttargetnil"] = "Мастер Цели не может подтвердить |cffffff00%s|r, потому что |cffffff00%s|r не имеет цели.",
			["newmttargetmismatch"] = "|cffffff00%s|r устанавливает Мастер Цели на |cffffff00%s|r, но его собственная цель |cffffff00%s|r.",
			["mtpollwarning"] = "Обновлен ваш Мастер Цели на |cffffff00%s|r, но не подтвердили. Запросите |cffffff00%s|r на повторный Мастер Цели, если текущий кажется некоректным",
			["threatreset"] = "Рейдовый измеритель угрозы был очищен |cffffff00%s|r.",
			["newmt"] = "Мастер Цели был установлен на |cffffff00%s|r персонажем |cffffff00%s|r.",
			["mtclear"] = "Мастер Цели был очищен |cffffff00%s|r.",
			["knockbackstart"] = "Отчет заклинаний НПС был активирован |cffffff00%s|r.",
			["knockbackstop"] = "Отчет заклинаний НПС был остановлен |cffffff00%s|r.",
			["aggrogain"] = "|cffffff00%s|r получен отчет угрозы с %d угрозой.",
			["aggroloss"] = "|cffffff00%s|r потерян отчет угрозы с %d угрозой.",
			["knockback"] = "|cffffff00%s|r Спадает до %d угрозы.",
			["knockbackstring"] = "%s отчет этого отбрасывания в тексте: '%s'.",
			["upgraderequest"] = "%s настоятельно рекомендуем вам перейти на версию %s KLHThreatMeter. В данный момет вы используете %s.",
			["remoteoldversion"] = "%s использует устаревшую версию %s KLHThreatMeter. Пожалуйста, попросите его перейти на версию %s.",
			["knockbackvaluechange"] = "|cffffff00%s|r установил сокращение угрозы на %s |cffffff00%s|r атаки |cffffff00%d%%|r.",
			["raidpermission"] = "Вы должны быть рейд лидером или помощником что бы сделать это!",
			["needmastertarget"] = "В начале вы должны установить Мастер Цели.",
			["knockbackinactive"] = "Открытое сбрасывание не активно в рейде.",
			["versionrequest"] = "Запрос о информации аддона от рейда. Ответ через 3 секунды",
			["versionrecent"] = "Эти игроки имеют версию %s: { ",
			["versionold"] = "Эти игроки имеют старую версию: { ",
			["versionnone"] = "Это игроки не имеют KLHThreatMeter или не в CTRA  канале: { ",
			["channel"] = 
			{
				ctra = "CTRA канал",
				ora = "oRA канал",
				manual = "Ручное управление",
			},
			needtarget = "Для установки Мастера Цели нужна цель",
			upgradenote = "Старая версия аддона. Уведомление для обновления.",
			advertisestart = "Теперь вы можете посоветовать игрокам, которые срывают с вас угрозу, установить KLHThreatMeter.",
			advertisestop = "Вы остановили объявления KLHThreatMeter.",
			advertisemessage = "Если вы имеете KLHThreatMeter, вы моежете увидеть количество угрозы %s.",
		},
		
		-- ok, so autohide isn't really a word, but just improvise
		table = 
		{
			autohideon = "Окно будет автоматически скрыто и показывать персональное окно.",
			autohideoff = "Окно автоматически больше не скрывается.",
		}
	}
}
