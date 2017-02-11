if ( GetLocale() == "ruRU" ) then
	--[[
		Russian localization by Lichery

		AtlasQuest, a World of Warcraft addon.
		Email me at mystery8@gmail.com
		
		This file is part of AtlasQuest.
		
		AtlasQuest is free software; you can redistribute it and/or modify
		it under the terms of the GNU General Public License as published by
		the Free Software Foundation; either version 2 of the License, or
		(at your option) any later version.
		
		AtlasQuest is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY; without even the implied warranty of
		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
		GNU General Public License for more details.
		
		You should have received a copy of the GNU General Public License
		along with AtlasQuest; if not, write to the Free Software
		Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
				
		---------------------------
		--- AQ Instance Numbers ---
		---------------------------
		
		-- 1  = Deadmines (DM)
		-- 2  = Wailing Caverns (WC)
		-- 3  = Ragefire Chasm (RFC)
		-- 4  = Uldaman (ULD)
		-- 5  = Blackrock Depths (BRD)
		-- 6  = Blackwing Lair (BWL)
		-- 7  = Blackfathom Deeps (BFD)
		-- 8  = Lower Blackrock Spire (LBRS)
		-- 9  = Вершина Черной горы (UBRS)
		-- 10 = Dire Maul East (DM)
		-- 11 = Dire Maul North (DM)
		-- 12 = Dire Maul West (DM)
		-- 13 = Maraudon (Mara)
		-- 14 = Molten Core (MC)
		-- 15 = Naxxramas (Naxx)
		-- 16 = Onyxia's Lair (Ony)
		-- 17 = Razorfen Downs (RFD)
		-- 18 = Razorfen Kraul (RFK)
		-- 19 = SM: Library (SM Lib)
		-- 20 = Scholomance (Scholo)
		-- 21 = Shadowfang Keep (SFK)
		-- 22 = Stratholme (Strat)
		-- 23 = The Ruins of Ahn'Qiraj (AQ20)
		-- 24 = The Stockade (Stocks)
		-- 25 = Sunken Temple (ST)
		-- 26 = The Temple of Ahn'Qiraj (AQ40)
		-- 27 = Zul'Farrak (ZF)
		-- 28 = Zul'Gurub (ZG)
		-- 29 = Gnomeregan (Gnomer)
		-- 30 = Four Dragons
		-- 31 = Azuregos
		-- 32 = Lord Kazzak
		-- 33 = Alterac Valley (AV)
		-- 34 = Arathi Basin (AB)
		-- 35 = Warsong Gulch (WSG)
		-- 36 =  default "rest"
		-- 57 = SM: Armory (SM Arm)
		-- 58 = SM: Cathedral (SM Cath)
		-- 59 = SM: Graveyard (SM GY)
		
		--Inst6Story = "Логово Крыла Тьмы расположено на самой вершине пика Черной горы. Этот величественный шпиль, высеченный из древнего камня, был выстроен по задумке дракона, и теперь в его темных залах проводит свои кошмарные эксперименты старший сын Смертокрыла – Нефариан. Он управляет могучими существами, словно марионетками, и скрещивает потомство различных драконьих родов. Результаты его трудов ужасают, и если он добьется успеха, он сможет воплотить в жизнь еще более зловещие планы. Но владыка Черной горы – не простой исследователь, а могучий дракон, обосновавшийся в хорошо укрепленном логове. Могут ли смертные бросить ему вызов?"
	
		!!!!ПРОВЕРИТЬ УРОВНИ И ТСЕПОЧКИ КВЕСТОВ ПО БД!!!!!
		Остановился на Inst12Story!!!!
	--]]
	
	---------------
	--- COLOURS ---
	---------------
	
	local GREY = "|cff999999";
	local RED = "|cffff0000";
	local REDA = "|cffcc6666";
	local WHITE = "|cffFFFFFF";
	local GREEN = "|cff1eff00";
	local PURPLE = "|cff9F3FFF";
	local BLUE = "|cff0070dd";
	local ORANGE = "|cffFF8400";
	local YELLOW = "|cffffff00";
	
	
	---------------
	--- OPTIONS ---
	---------------
	
	AQHelpText = "наберите /aq или atlasquest "..YELLOW.."[команда]"..WHITE.."\nкоманды: help; option/config; show/hide; left/right; colour; autoshow"..RED.."(только Атлас)"
	--
	AQOptionsCaptionTEXT = "Настройки AtlasQuest";
	AQ_OK = "Готово"
	
	-- Autoshow
	AQOptionsAutoshowTEXT = "Показывать панель AtlasQuest вместе с Атласом.";
	AQAtlasAutoON = "Панель AtlasQuest будет показана когда вы откроете Атлас."..GREEN.." (по умолчанию)"
	AQAtlasAutoOFF = "Панель AtlasQuest "..RED.."не будет"..WHITE.." показана когда вы откроете Атлас."
	
	-- Right/Left
	AQOptionsLEFTTEXT = "Показать панель AtlasQuest "..RED.."слева.";
	AQOptionsRIGHTTEXT = "Показать панель AtlasQuest "..RED.."справа.";
	AQShowRight = "Теперь панель AtlasQuest "..RED.."справа.";
	AQShowLeft = "Теперь панель AtlasQuest "..RED.."слева."..GREEN.." (по умолчанию)";
	
	-- Colour Check
	AQOptionsCCTEXT = "Подкрасить задания в соответствии с их уровнем."
	AQCCON = "Теперь AtlasQuest будет подкрашивать задания в соответствии с уровнем."
	AQCCOFF = "AtlasQuest не будет подкрашивать задания."
	
	-- QuestLog Colour Check
	AQQLColourChange = "Подкрашивать все задания, имеющиеся в журнале "..BLUE.."синим."
	
	-- AutoQuery Quest Rewards
	AQOptionsAutoQueryTEXT = "Автоматически запрашивать у сервера предметы которые вы не видели."
	
	-- Suppress Server Query text
	AQOptionsNoQuerySpamTEXT = "Подавление спама запросов к серверу."
	
	-- Use Comparison Tooltips
	AQOptionsCompareTooltipTEXT = "Сравнение награды с надетыми вещами."
	
	
	AQAbilities = BLUE .. "Способности:"
	AQSERVERASKInformation = " Пожалуйста нажимайте ПКМ пока не увидите окно предмета."
	AQSERVERASKAuto = " Попробуйте задержать курсор мыши над предметом на секунду."
	AQSERVERASK = "AtlasQuest запрашивает сервер о: "
	AQERRORNOTSHOWN = "Этот предмет небезопасен!"
	AQERRORASKSERVER = "ПКМ чтобы запросить сервер об \nэтом предмете. Вы можете быть отсоединены от сервера."
	AQOptionB = "Настройки"
	AQStoryB = "История"
	AQNoReward = BLUE.." Нет наград"
	AQDiscription_REWARD = BLUE.."Награда: "
	AQDiscription_OR = GREY.." или "
	AQDiscription_AND = GREY.." и "
	AQDiscription_ATTAIN = "Доступно: "
	AQDiscription_LEVEL = "Уровень: "
	AQDiscription_START = "Начинается у: \n"
	AQDiscription_AIM = "Цель: \n"
	AQDiscription_NOTE = "Заметка: \n"
	AQDiscription_PREQUEST= "Предыдущее задание: "
	AQDiscription_FOLGEQUEST = "Следующее задание: "
	AQFinishedTEXT = "Задание сделано ";
	
	
	------------------
	--- ITEM TYPES ---
	------------------
	
	AQITEM_DAGGER = " Кинжал"
	AQITEM_POLEARM = " Древковое"
	AQITEM_SWORD = " Меч"
	AQITEM_AXE = " Топор"
	AQITEM_WAND = "Жезл"
	AQITEM_STAFF = "Посох"
	AQITEM_MACE = " Дробящее"
	AQITEM_SHIELD = "Щит"
	AQITEM_GUN = "Огнестрельное"
	AQITEM_BOW = "Лук"
	AQITEM_CROSSBOW = "Арбалет"
	AQITEM_THROWN = "Метательное"
	
	AQITEM_WAIST = "Пояс,"
	AQITEM_SHOULDER = "Плечо,"
	AQITEM_CHEST = "Грудь,"
	AQITEM_LEGS = "Ноги,"
	AQITEM_HANDS = "Кисти рук,"
	AQITEM_FEET = "Ступни,"
	AQITEM_WRIST = "Запястья,"
	AQITEM_HEAD = "Голова,"
	AQITEM_BACK = "Спина"
	AQITEM_TABARD = "Гербовая накидка"
	
	AQITEM_CLOTH = " Ткань"
	AQITEM_LEATHER = " Кожа"
	AQITEM_MAIL = " Кольчуга"
	AQITEM_PLATE = " Латы"
	
	AQITEM_OFFHAND = "Левая рука"
	AQITEM_MAINHAND = "Правая рука,"
	AQITEM_ONEHAND = "Одноручное,"
	AQITEM_TWOHAND = "Двуручное,"
	
	AQITEM_ITEM = "Предмет" -- Use this for those oddball rewards which aren't really anything else.
	AQITEM_TRINKET = "Аксессуар"
	AQITEM_RELIC = "Реликвия"
	AQITEM_POTION = "Зелье"
	AQITEM_OFFHAND = "Левая рука"
	AQITEM_NECK = "Шея"
	AQITEM_PATTERN = "Выкройка"
	AQITEM_BAG = "Сумка"
	AQITEM_RING = "Палец"
	AQITEM_KEY = "Ключ"
	AQITEM_QUIVER = "Колчан"
	AQITEM_AMMOPOUCH = "Подсумок"
	AQITEM_ENCHANT = "Чары"
	
	
	
	----------------------------------------------
	---------------- DUNGEONS --------------------
	----------------------------------------------
	
	--------------- INST1 - Deadmines (DM) ---------------
	Inst1Story = "Когда-то величайший золотодобывающий центр в землях людей, Мертвые Копи были заброшены когда Орда не оставила камня на камне от Штормграда во время Первой Войны. Сейчас их заняло Братство Справедливости и превратило темные тоннели и в их собственное святилище. Ходят слухи что воры призвали умных гоблинов, чтобы те помогли им построить что-то ужасное в глубине копей - но что это может быть до сих пор не ясно. По слухам путь в Мертвые Копи лежит через тихую, скромную деревушку Луноречье."
	Inst1Caption = "Мертвые копи"
	Inst1QAA = "7 Заданий" -- how many quests for alliance
	Inst1QAH = "Нет заданий" -- for Horde
	
	--Quest 1 Alliance
	Inst1Quest1 = "1. Красные шелковые банданы"
	Inst1Quest1_Level = "17"
	Inst1Quest1_Attain = "15"
	Inst1Quest1_Aim = "Принесите 10 красных шелковых бандан разведчице Риэле к башне на Сторожевом холме."
	Inst1Quest1_Location = "Разведчица Риэла (Западный Край - Сторожевой холм; "..YELLOW.."56, 47"..WHITE..")"
	Inst1Quest1_Note = "Вы можете получить красные шелковые банданы с шахтеров в Мертвых копях или в городе, где находится подземелье. Задание становится доступным после выполнения цепочки заданий Братства Справедливости до стадии когда вам нужно убить Эдвина Ван Клифа."
	Inst1Quest1_Prequest = "Да (смотрите Заметку)"
	Inst1Quest1_Folgequest = "Нет"
	--
	Inst1Quest1name1 = "Solid Shortblade"
	Inst1Quest1name2 = "Scrimshaw Dagger"
	Inst1Quest1name3 = "Piercing Axe"
	
	--Quest 2 Alliance
	Inst1Quest2 = "2. Сбор воспоминаний"
	Inst1Quest2_Level = "18"
	Inst1Quest2_Attain = "14"
	Inst1Quest2_Aim = "Добудьте 4 карточки Союза шахтеров и верните их Вилдеру Крапивцу в Штормград."
	Inst1Quest2_Location = "Чертополох Дикий (Штормград - Квартал дворфов; "..YELLOW.."65, 21"..WHITE.." )"
	Inst1Quest2_Note = "Карточки падают с нежити снаружи подземелья в зоне около "..YELLOW.."[3]"..WHITE.." на карте входа."
	Inst1Quest2_Prequest = "Нет"
	Inst1Quest2_Folgequest = "Нет"
	--
	Inst1Quest2name1 = "Tunneler's Boots"
	Inst1Quest2name2 = "Dusty Mining Gloves"
	
	--Quest 3 Alliance
	Inst1Quest3 = "3. О, брат мой..."
	Inst1Quest3_Level = "20"
	Inst1Quest3_Attain = "15"
	Inst1Quest3_Aim = "Принесите значок Лиги Исследователей, принадлежавший Вилдеру Крапивцу, в Штормград."
	Inst1Quest3_Location = "Вилдер Крапивец (Штормград - Квартал дворфов; "..YELLOW.."65,21"..WHITE.." )"
	Inst1Quest3_Note = "Вилдер Крапивец находится снаружи подземелья"
	Inst1Quest3_Prequest = "Нет"
	Inst1Quest3_Folgequest = "Нет"
	--
	Inst1Quest3name1 = "Miner's Revenge"
	
	--Quest 4 Alliance
	Inst1Quest4 = "4. Битва под землей"
	Inst1Quest4_Level = "20"
	Inst1Quest4_Attain = "15"
	Inst1Quest4_Aim = "Принесите Шони Молшунье в Штормград зубчатый спрек-механизм гномов из Мертвых копей."
	Inst1Quest4_Location = "Шони Молшунья (Штормград - Квартал дворфов; "..YELLOW.."55,12"..WHITE.." )"
	Inst1Quest4_Note = "Предшествующее задание можно взять у Гноарна (Стальгорн - Город механиков; "..YELLOW.."69,50"..WHITE..").\nЗубчатый спрек-механизм гномов падает с Sneed's Shredder "..YELLOW.."[3]"..WHITE.."."
	Inst1Quest4_Prequest = "Разговор с Шони"
	Inst1Quest4_Folgequest = "Нет"
	--
	Inst1Quest4name1 = "Polar Gauntlets"
	Inst1Quest4name2 = "Sable Wand"
	
	--Quest 5 Alliance
	Inst1Quest5 = "5. Братство Справедливости"
	Inst1Quest5_Level = "22"
	Inst1Quest5_Attain = "14"
	Inst1Quest5_Aim = "Убейте Эдвина ван Клифа и принесите его голову Гриану Камнегриву."
	Inst1Quest5_Location = "Гриан Камнегрив (Западный край - Сторожевой холм; "..YELLOW.."56,47"..WHITE..")"
	Inst1Quest5_Note = "Вы начинаете линейку у Гриана Камнегрива (Западный Край - Сторожевой холм; "..YELLOW.."56,47"..WHITE..").\nЭдвин Ван Клиф это последний босс в Мертвых копях. Вы найдете его на верхней палубе корабля "..YELLOW.."[6]"..WHITE.."."
	Inst1Quest5_Prequest = "Братство справедливости"
	Inst1Quest5_Folgequest = "Неотосланное письмо"
	--
	Inst1Quest5name1 = "Chausses of Westfall"
	Inst1Quest5name2 = "Tunic of Westfall"
	Inst1Quest5name3 = "Staff of Westfall"
	
	--Quest 6 Alliance
	Inst1Quest6 = "6. Испытание доблести"
	Inst1Quest6_Level = "22"
	Inst1Quest6_Attain = "20"
	Inst1Quest6_Aim = "Возьмите список Джордана, добудьте немного древесины белокаменного дуба, партию очищенной руды Бэйлора, кузнечный молот Джордана и самоцвет Кора и отдайте их Джордану Стилвеллу в Стальгорне."
	Inst1Quest6_Location = "Джордан Стилвелл (Дун Морог - Вход в Стальгорн; "..YELLOW.."52,36"..WHITE..")"
	Inst1Quest6_Note = "Задание для паладинов: Чтобы увидеть заметки щелкните на "..YELLOW.."[Информация: Испытание доблести]"..WHITE.."."
	Inst1Quest6_Page = {2, "Только паладины могут получить это задание!\n1. Вы получите древесину белокаменного дуба у гоблинов-лесорубов в "..YELLOW.."[Мертвые копи]"..WHITE..".\n2. Для получения партии очищенной руды Бэйлора вы должны поговорить с Бэйлором Каменной Дланью (Озеро Модан - Телсамар; 35,44 ). Он даст вам задание 'Партия руды Бэйлора'. Вы найдете руду Джордана за деревом около 71,21\n3. Вы получите кузнечный молот Джордана в "..YELLOW.."[Крепость Темного Клыка]"..WHITE.." около "..YELLOW.."[3]"..WHITE..".\n4. Для получения самоцвета Кора Вам нужно пойти к Тандрису Ветропряду (Темные берега - Аубердин; 37,40) и выполнить задание 'Поиск самоцвета Кора'. Для этого задания, вам нужно убивать Провидзев и Жриц Непроглядной пучины перед "..YELLOW.."[Непроглядная пучина]"..WHITE..". С них падает Оскверненный самоцвет Кора. Тандрис Ветропряд очистит его для Вас.", };
	Inst1Quest6_Prequest = "Фолиант Отваги -> Испытание доблести"
	Inst1Quest6_Folgequest = "Испытание доблести"
	--
	Inst1Quest6name1 = "Verigan's Fist"
	
	--Quest 7 Alliance
	Inst1Quest7 = "7. Неотправленное письмо"
	Inst1Quest7_Level = "22"
	Inst1Quest7_Attain = "16"
	Inst1Quest7_Aim = "Доставьте письмо городскому архитектору Баросу Алекстону в Штормград."
	Inst1Quest7_Location = "Неотосланное письмо (добывается с Эдвин ван Клиф; "..YELLOW.."[6]"..WHITE..")"
	Inst1Quest7_Note = "Барос Алекстон находится в Штормград, рядом с Соборной площадью около "..YELLOW.."49,30"..WHITE.."."
	Inst1Quest7_Prequest = "Нет"
	Inst1Quest7_Folgequest = "Базиль Тредд"
	-- No Rewards for this quest
	
	
	--------------- INST2 - Wailing Caverns (WC) ---------------
	Inst2Story = "Не так давно друид ночных эльфов по имени Наралекс обнаружил сеть подземных пещер прямо в сердце Степей. Названные 'Пещерами стенаний', эти естественные пещеры были наполнены трещинами, которые производили долгие жалобные стоны когда пар вырывался из них. Наралекс верил, что он сможет использовать подземные источники пещер для восстановления буйства красок и изобилия Степей - но для исполнения этого потребовалоь перекачивание энергий из сказочного Изумрудного Сна. Однако однажды соединившись со Сном, видения друида превратились в кошмар.  Вскоре Пещеры стенаний начали меняться - воды наполнились грязью и некогда послушные существа внутри превратились в порочных, смертоносных хищников. Поговоривают что сам Наралекс все еще находится где-то в сердце лабиринта, попавший в капкан пределов Изумрудного Сна. Даже его бывшие ученики были испорчены ожившим кошмаром учителя - они превратились в злобных Друидов Клыка."
	Inst2Caption = "Пещеры стенаний"
	Inst2QAA = "5 Заданий"
	Inst2QAH = "7 Заданий"
	
	--Quest 1 Alliance
	Inst2Quest1 = "1. Шкуры загадочных существ"
	Inst2Quest1_Level = "17"
	Inst2Quest1_Attain = "13"
	Inst2Quest1_Aim = "Принесите 20 искаженных шкур Налпаку в Пещерах Стенаний."
	Inst2Quest1_Location = "Наплак (Степи - Пещеры стенаний; "..YELLOW.."47,36 "..WHITE..")"
	Inst2Quest1_Note = "Со всех существ внутри и перед подземельем можно подобрать шкуры.\nНаплака можно найти в тайной пещере над входом в Пещеры стенаний. Простейший путь увидеть его - забраться на гору позади входа и спрыгнуть на небольшой выступ слева над входом в пещеру."
	Inst2Quest1_Prequest = "Нет"
	Inst2Quest1_Folgequest = "Нет"
	--
	Inst2Quest1name1 = "Slick Deviate Leggings"
	Inst2Quest1name2 = "Deviate Hide Pack"
	
	--Quest 2 Alliance
	Inst2Quest2 = "2. Неприятности в порту"
	Inst2Quest2_Level = "18"
	Inst2Quest2_Attain = "14"
	Inst2Quest2_Aim = "Оператор крана Биггльфузз из Кабестана попросил Вас отнять бутылку портвейна 99-летней выдержки у Безумного Магглиша, который прячется в Пещерах Стенаний."
	Inst2Quest2_Location = "Оператор крана Биггльфузз (Степи - Кабестан; "..YELLOW.."63,37 "..WHITE..")"
	Inst2Quest2_Note = "Получить бутылку можно прямо перед тем как вы войдете в подземелье, убив Безумного Магглиша. Когда вы только вошли в пещеру идите направо и найдете его в конце прохода. Он скрывается у стены."
	Inst2Quest2_Prequest = "Нет"
	Inst2Quest2_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 3 Alliance
	Inst2Quest3 = "3. Умный напиток"
	Inst2Quest3_Level = "18"
	Inst2Quest3_Attain = "14"
	Inst2Quest3_Aim = "Принесите 6 порций воющей субстанции Мебоку Миззриксу в Кабестан."
	Inst2Quest3_Location = "Мебок Миззрикс (Степи - Кабестан; "..YELLOW.."62,37 "..WHITE..")"
	Inst2Quest3_Note = "Предшествующее задание также можно взять у Мебока Миззрикса.\nИз всех врагов-эктоплазмы внутри и перед подземельем можно достать субстанцию."
	Inst2Quest3_Prequest = "Рога ящеров"
	Inst2Quest3_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 4 Alliance
	Inst2Quest4 = "4. Искоренение Скверны"
	Inst2Quest4_Level = "21"
	Inst2Quest4_Attain = "15"
	Inst2Quest4_Aim = "Убейте для Эбру 7 загадочных опустошителей, 7 загадочных гадюк, 7 загадочных шаркунов и 7 загадочных страхозубов."
	Inst2Quest4_Location = "Эбру (Степи; "..YELLOW.."47,36 "..WHITE..")"
	Inst2Quest4_Note = "Эбру находится в тайной пещере над входом в Пещеры стенаний. Простейший путь увидеть его - забраться на гору позади входа и спрыгнуть на небольшой выступ слева над входом в пещеру."
	Inst2Quest4_Prequest = "Нет"
	Inst2Quest4_Folgequest = "Нет"
	--
	Inst2Quest4name1 = "Pattern: Deviate Scale Belt"
	Inst2Quest4name2 = "Sizzle Stick"
	Inst2Quest4name3 = "Dagmire Gauntlets"
	
	--Quest 5 Alliance
	Inst2Quest5 = "5. Светящийся осколок"
	Inst2Quest5_Level = "25"
	Inst2Quest5_Attain = "21"
	Inst2Quest5_Aim = "Отправляйтесь в Кабестан и найдите там кого-нибудь, кто сможет вам рассказать об этом светящемся осколке. Затем отнесите осколок туда, куда Вас направят."
	Inst2Quest5_Location = "Светящийся осколок (Падает с Мутануса Пожирателя; (Пещеры стенаний)"
	Inst2Quest5_Note = "Мутанус Пожиратель появляется только если вы убили всех 4 повелителей змей и проводили таурена-друда от входа.\nКогда вы возьмете осколок, вам нужно принести его к гоблину-пилоту около банка в Кабестане, а потом на вершину горы над Пещерами стенаний к Фалле Мудрости Ветра."
	Inst2Quest5_Prequest = "Нет"
	Inst2Quest5_Folgequest = "Кошмары"
	--
	Inst2Quest5name1 = "Talbar Mantle"
	Inst2Quest5name2 = "Quagmire Galoshes"
	
	
	--Quest 1 Horde (same as Quest 1 Alliance)
	Inst2Quest1_HORDE = Inst2Quest1
	Inst2Quest1_HORDE_Level = Inst2Quest1_Level
	Inst2Quest1_HORDE_Attain = Inst2Quest1_Attain
	Inst2Quest1_HORDE_Aim = Inst2Quest1_Aim
	Inst2Quest1_HORDE_Location = Inst2Quest1_Location
	Inst2Quest1_HORDE_Note = Inst2Quest1_Note
	Inst2Quest1_HORDE_Prequest = Inst2Quest1_Prequest
	Inst2Quest1_HORDE_Folgequest = Inst2Quest1_Folgequest
	--
	Inst2Quest1name1_HORDE = Inst2Quest1name1
	Inst2Quest1name2_HORDE = Inst2Quest1name2
	
	--Quest 2 Horde (same as Quest 2 Alliance)
	Inst2Quest2_HORDE = Inst2Quest2
	Inst2Quest2_HORDE_Level = Inst2Quest2_Level
	Inst2Quest2_HORDE_Attain = Inst2Quest2_Attain
	Inst2Quest2_HORDE_Aim = Inst2Quest2_Aim
	Inst2Quest2_HORDE_Location = Inst2Quest2_Location
	Inst2Quest2_HORDE_Note = Inst2Quest2_Note
	Inst2Quest2_HORDE_Prequest = Inst2Quest2_Prequest
	Inst2Quest2_HORDE_Folgequest = Inst2Quest2_Folgequest
	-- No Rewards for this quest
	
	--Quest 3 Horde
	Inst2Quest3_HORDE = "3. Змеецвет"
	Inst2Quest3_HORDE_Level = "18"
	Inst2Quest3_HORDE_Attain = "14"
	Inst2Quest3_HORDE_Aim = "Аптекарь Зама из Громового Утеса просит Вас принести ей 10 змеецветов."
	Inst2Quest3_HORDE_Location = "Аптекарь Зама (Громовой Утес - Вершина Духов; "..YELLOW.."22,20 "..WHITE..")"
	Inst2Quest3_HORDE_Note = "Аптекарь Зама находится в пещере под Вершиной Духов.\nСобрать Змеецвет можно внутри пещеры перед подземельем и внутри него. Игроки с навыком травничества могут видеть Змеецвет на миникарте."
	Inst2Quest3_HORDE_Prequest = "Споры грибов -> Аптекарь Зама"
	Inst2Quest3_HORDE_Folgequest = "Нет"
	--
	Inst2Quest3name1_HORDE = "Apothecary Gloves"
	
	--Quest 4 Horde (same as Quest 3 Alliance)
	Inst2Quest4_HORDE = "4. Умный напиток"
	Inst2Quest4_HORDE_Level = Inst2Quest3_Level
	Inst2Quest4_HORDE_Attain = Inst2Quest3_Attain
	Inst2Quest4_HORDE_Aim = Inst2Quest3_Aim
	Inst2Quest4_HORDE_Location = Inst2Quest3_Location
	Inst2Quest4_HORDE_Note = Inst2Quest3_Note
	Inst2Quest4_HORDE_Prequest = Inst2Quest3_Prequest
	Inst2Quest4_HORDE_Folgequest = Inst2Quest3_Folgequest
	-- No Rewards for this quest
	
	--Quest 5 Horde (same as Quest 4 Alliance)
	Inst2Quest5_HORDE = "5. Искоренение Скверны"
	Inst2Quest5_HORDE_Level = Inst2Quest4_Level
	Inst2Quest5_HORDE_Attain = Inst2Quest4_Attain
	Inst2Quest5_HORDE_Aim = Inst2Quest4_Aim
	Inst2Quest5_HORDE_Location = Inst2Quest4_Location
	Inst2Quest5_HORDE_Note = Inst2Quest4_Note
	Inst2Quest5_HORDE_Prequest = Inst2Quest4_Prequest
	Inst2Quest5_HORDE_Folgequest = Inst2Quest4_Folgequest
	--
	Inst2Quest5name1_HORDE = Inst2Quest4name1
	Inst2Quest5name2_HORDE = Inst2Quest4name2
	Inst2Quest5name3_HORDE = Inst2Quest4name3
	
	--Quest 6 Horde
	Inst2Quest6_HORDE = "6. Повелители Змей"
	Inst2Quest6_HORDE_Level = "22"
	Inst2Quest6_HORDE_Attain = "18"
	Inst2Quest6_HORDE_Aim = "Принесите самоцветы Кобрана, Анакондры, Пифаса и Серпентиса Наре Буйногривой в Громовой Утес."
	Inst2Quest6_HORDE_Location = "Нара Буйногривая (Громовой Утес - Вершина старейшин; "..YELLOW.."75,31"..WHITE..")"
	Inst2Quest6_HORDE_Note = "Серия заданий начинается у Хамуула Рунного Тотема. (Громовой Утес - Вершина старейшин; "..YELLOW.."78,28"..WHITE..")\nКамни падают с 4 друидов "..YELLOW.."[2]"..WHITE..", "..YELLOW.."[3]"..WHITE..", "..YELLOW.."[5]"..WHITE..", "..YELLOW.."[7]"..WHITE.."."
	Inst2Quest6_HORDE_Prequest = "Оазисы Степей -> Нара Буйногривая"
	Inst2Quest6_HORDE_Folgequest = "Нет"
	--
	Inst2Quest6name1_HORDE = "Crescent Staff"
	Inst2Quest6name2_HORDE = "Wingblade"
	
	--Quest 7 Horde (same as Quest 5 Alliance)
	Inst2Quest7_HORDE = "7. Светяшийся осколок"
	Inst2Quest7_HORDE_Level = Inst2Quest5_Level
	Inst2Quest7_HORDE_Attain = Inst2Quest5_Attain
	Inst2Quest7_HORDE_Aim = Inst2Quest5_Aim
	Inst2Quest7_HORDE_Location = Inst2Quest5_Location
	Inst2Quest7_HORDE_Note = Inst2Quest5_Note
	Inst2Quest7_HORDE_Prequest = Inst2Quest5_Prequest
	Inst2Quest7_HORDE_Folgequest = Inst2Quest5_Folgequest
	--
	Inst2Quest7name1_HORDE = Inst2Quest5name1
	Inst2Quest7name2_HORDE = Inst2Quest5name2
	
	
	
	--------------- INST3 - Ragefire Chasm (RFC) ---------------
	Inst3Story = "Огненная пропасть представляет из себя сеть вулканических пещер которые пролегают под новой столицей орков - Оргриммаром. Недавно, прошел слух, что приверженцы демонического культа Совета Теней устроили логово в пламенных глубинах Пропасти. Этот культ, именуемый Пылающий Клинок, угрожает самой независимости Дуротара. Многие верят что Военный Вождь орков, Тралл, знает о существовании Клинка и не стал уничтожать его в надежде на то, что его члены приведут его прямо к Совету Теней. Так или иначе, всплески тёмных сил из Огненной пропасти могут унижтожить все, чего орки пытались достичь."
	Inst3Caption = "Огненная пропасть"
	Inst3QAA = "Нет заданий"
	Inst3QAH = "5 Заданий"
	
	--Quest 1 Horde
	Inst3Quest1_HORDE = "1. Испытание силы врага"
	Inst3Quest1_HORDE_Level = "15"
	Inst3Quest1_HORDE_Attain = "9"
	Inst3Quest1_HORDE_Aim = "Найдите в Оргриммаре Огненную пропасть, убейте 8 троггов и 8 шаманов Огненной пропасти и возвращайтесь к Рахауро в Громовой Утес."
	Inst3Quest1_HORDE_Location = "Рахауро (Громовой Утес - Вершина Старейшин; "..YELLOW.."70,29"..WHITE..")"
	Inst3Quest1_HORDE_Note = "Вы найдете троггов в самом начале подземелья."
	Inst3Quest1_HORDE_Prequest = "Нет"
	Inst3Quest1_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 2 Horde
	Inst3Quest2_HORDE = "2. Силы разрушения..."
	Inst3Quest2_HORDE_Level = "16"
	Inst3Quest2_HORDE_Attain = "9"
	Inst3Quest2_HORDE_Aim = "Принесите книги \"Заклинания Тьмы\" и \"Заклятия Пустоты\" Вариматасу в Подгород."
	Inst3Quest2_HORDE_Location = "Вариматас (Подгород - Королевский квартал; "..YELLOW.."56,92"..WHITE..")"
	Inst3Quest2_HORDE_Note = "Книги падают с Сектантов и Чернокнижников из клана Пылающего клинка"
	Inst3Quest2_HORDE_Prequest = "Нет"
	Inst3Quest2_HORDE_Folgequest = "Нет"
	--
	Inst3Quest2name1_HORDE = "Ghastly Trousers"
	Inst3Quest2name2_HORDE = "Dredgemire Leggings"
	Inst3Quest2name3_HORDE = "Gargoyle Leggings"
	
	--Quest 3 Horde
	Inst3Quest3_HORDE = "3. В поисках потерянного ранца"
	Inst3Quest3_HORDE_Level = "16"
	Inst3Quest3_HORDE_Attain = "9"
	Inst3Quest3_HORDE_Aim = "Обыщите Огненную пропасть в поисках тела Маура Зловещего Тотема и найдите все необычные предметы."
	Inst3Quest3_HORDE_Location = "Рахауро (Громовой Утес - Вершина Старейшин; "..YELLOW.."70,29"..WHITE..")"
	Inst3Quest3_HORDE_Note = "Вы найдете Маура Зловещего Тотема около "..YELLOW.."[1]"..WHITE..". После того как найдете рюкзак, вы должны вернуть его Рахауро в Громовой Утес"
	Inst3Quest3_HORDE_Prequest = "Нет"
	Inst3Quest3_HORDE_Folgequest = "Возвращение Потеряного ранца"
	--
	Inst3Quest3name1_HORDE = "Featherbead Bracers"
	Inst3Quest3name2_HORDE = "Savannah Bracers"
	
	--Quest 4 Horde
	Inst3Quest4_HORDE = "4. Тайные враги"
	Inst3Quest4_HORDE_Level = "16"
	Inst3Quest4_HORDE_Attain = "9"
	Inst3Quest4_HORDE_Aim = "Убейте Баззалана и Жергоша Призывателя Духов и вернитесь в Оргриммар к Траллу."
	Inst3Quest4_HORDE_Location = "Тралл (Оргриммар - Аллея Мудрости; "..YELLOW.."31,37"..WHITE..")"
	Inst3Quest4_HORDE_Note = "Вы найдете Баззалана около  "..YELLOW.."[4]"..WHITE.." и Джергоша около "..YELLOW.."[3]"..WHITE..". Линейка заданий начинается у Военного вождя Тралла в Оргриммаре."
	Inst3Quest4_HORDE_Prequest = "Тайные враги"
	Inst3Quest4_HORDE_Folgequest = "Тайные враги"
	--
	Inst3Quest4name1_HORDE = "Kris of Orgrimmar"
	Inst3Quest4name2_HORDE = "Hammer of Orgrimmar"
	Inst3Quest4name3_HORDE = "Axe of Orgrimmar"
	Inst3Quest4name4_HORDE = "Staff of Orgrimmar"
	
	--Quest 5 Horde
	Inst3Quest5_HORDE = "5. Убить тварь"
	Inst3Quest5_HORDE_Level = "16"
	Inst3Quest5_HORDE_Attain = "9"
	Inst3Quest5_HORDE_Aim = "Спуститесь в Огненную пропасть, убейте Тарагамана Ненасытного и принесите его сердце Ниру Огненному Клинку в Оргриммаре."
	Inst3Quest5_HORDE_Location = "Ниру Огненный Клинок (Оргриммар - Расселина Теней; "..YELLOW.."49,50"..WHITE..")"
	Inst3Quest5_HORDE_Note = "Вы найдете Тарагамана около "..YELLOW.."[2]"..WHITE.."."
	Inst3Quest5_HORDE_Prequest = "Нет"
	Inst3Quest5_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	
	
	--------------- INST4 - Uldaman (Ulda) ---------------
	Inst4Story = "Ульдаман - это древний чертог Титанов, построеный глубоко в толще земли с самого сотворения мира. В недалеком прошлом археологи дворфов проникли в этот забытый город, выпустив первых нейдачных творений Титанов: троггов. Легенды гласят, что титаны создали троггов из камня. Когда они посчитали эксперимент провалившимся, Титаны изолировали троггов и попробовали снова - результатом стало создание расы дворфов. Тайны создания дворфов записаны на мифических Дисках Норганнона - массивных артефактах Титанов, находящихся в глубине древнего города. Недавно, дворфы Темного Железа начали серию набегов в Ульдаман, в надежде захватить диски для их несдержанного мастера, Рагнароса. Однако, подземный город защищало несколько стражей - гигантские големы из живого камня, что сокрушат любого несчастливого нарушителя, которого найдут. Сами Диски охраняйтся массивным, разумным Каменным хранителем по имени Архедас. Некоторые слухи даже предполагают, что каменнокожие предки дворфов, Подземники, все еще обитают в глубоко скрытых переходах города."
	Inst4Caption = "Ульдаман"
	Inst4QAA = "16 Заданий"
	Inst4QAH = "10 Заданий"
	
	--Quest 1 Alliance
	Inst4Quest1 = "1. Предвестник надежды"
	Inst4Quest1_Level = "35"
	Inst4Quest1_Attain = "33"
	Inst4Quest1_Aim = "Найдите Греза Тяжелоступа в Ульдамане."
	Inst4Quest1_Location = "Геолог Ржанец (Бесплодные земли; "..YELLOW.."53,43"..WHITE..")"
	Inst4Quest1_Note = "Предшествующее задание начинается с Мятой карты (Бесплодные земли; "..YELLOW.."53,33"..WHITE..").\nВы найдете Тяжелоступа Греза перед тем как вы войдете в подземелье."
	Inst4Quest1_Prequest = "Предвестник надежды"
	Inst4Quest1_Folgequest = "Амулет Тайн"
	-- No Rewards for this quest
	
	--Quest 2 Alliance
	Inst4Quest2 = "2. Амулет Тайн"
	Inst4Quest2_Level = "40"
	Inst4Quest2_Attain = "37"
	Inst4Quest2_Aim = "Найдите амулет Тяжелоступа и верните его ему в Ульдаман."
	Inst4Quest2_Location = "Тяжелоступ Грез (Ульдаман)."
	Inst4Quest2_Note = "Амулет падает из Магрегана Чернотени."
	Inst4Quest2_Prequest = "Предвестник надежды"
	Inst4Quest2_Folgequest = "Клятва верности"
	-- No Rewards for this quest
	
	--Quest 3 Alliance
	Inst4Quest3 = "3. Утерянные таблички Воли"
	Inst4Quest3_Level = "45"
	Inst4Quest3_Attain = "38"
	Inst4Quest3_Aim = "Найдите табличку Воли и принесите ее советнику Белграму в Стальгорн."
	Inst4Quest3_Location = "Советник Белгрум (Стальгорн - Зал исследователей; "..YELLOW.."77,10"..WHITE..")"
	Inst4Quest3_Note = "Табличка находится около "..YELLOW.."[8]"..WHITE.."."
	Inst4Quest3_Prequest = "Амулет Тайн -> Посланник Зла"
	Inst4Quest3_Folgequest = "Нет"
	--
	Inst4Quest3name1 = "Medal of Courage"
	
	--Quest 4 Alliance
	Inst4Quest4 = "4. Силовые камни"
	Inst4Quest4_Level = "36"
	Inst4Quest4_Attain = "33"
	Inst4Quest4_Aim = "Принесите 8 дентриевых силовых камней и 8 энелиевых силовых камней Ригглфаззу в Бесплодные земли."
	Inst4Quest4_Location = "Ригглфазз (Бесплодные земли; "..YELLOW.."42,52"..WHITE..")"
	Inst4Quest4_Note = "Камни можно найти на любом враге из клана Тенегорна перед и внутри подземелья."
	Inst4Quest4_Prequest = "Нет"
	Inst4Quest4_Folgequest = "Нет"
	--
	Inst4Quest4name1 = "Energized Stone Circle"
	Inst4Quest4name2 = "Duracin Bracers"
	Inst4Quest4name3 = "Everlast Boots"
	
	--Quest 5 Alliance
	Inst4Quest5 = "5. Судьба Эгмонда"
	Inst4Quest5_Level = "38"
	Inst4Quest5_Attain = "33"
	Inst4Quest5_Aim = "Принесите 4 резные каменные урны геологу Сталекруту в Лок Модан."
	Inst4Quest5_Location = "Геолог Сталекрут (Лок Модан - Раскопки Сталекрута; "..YELLOW.."65,65"..WHITE..")"
	Inst4Quest5_Note = "Предшествующее задание начинается у геолога Грозовой Вершины (Стальгорн - Зал исследователей; "..YELLOW.."74,12"..WHITE..").\nУрны расбросаны по пещерам перед подземельем."
	Inst4Quest5_Prequest = "Вы нужны Сталекруту! -> Мурдалок"
	Inst4Quest5_Folgequest = "Нет"
	--
	Inst4Quest5name1 = "Prospector Gloves"
	
	--Quest 6 Alliance
	Inst4Quest6 = "6. Лекарство от судьбы"
	Inst4Quest6_Level = "40"
	Inst4Quest6_Attain = "33"
	Inst4Quest6_Aim = "Принесите табличку Рьюн'эха Тельдарину Заблудшему."
	Inst4Quest6_Location = "Тельдарин Заблудший (Бесплодные земли; "..YELLOW.."51,76"..WHITE..")"
	Inst4Quest6_Note = "Табличка находится на севере пещер, в восточном конце туннеля, перед подземельем."
	Inst4Quest6_Prequest = "Нет"
	Inst4Quest6_Folgequest = "В Стальгорн за книгой Йагина"
	--
	Inst4Quest6name1 = "Doomsayer's Robe"
	
	--Quest 7 Alliance
	Inst4Quest7 = "7. Потерянные дворфы"
	Inst4Quest7_Level = "40"
	Inst4Quest7_Attain = "35"
	Inst4Quest7_Aim = "Найдите Бейлога в Ульдамане."
	Inst4Quest7_Location = "Геолог Грозовая Вершина (Стальгорн - Зал исследователей; "..YELLOW.."75,12"..WHITE..")"
	Inst4Quest7_Note = "Бейлог находится около "..YELLOW.."[1]"..WHITE.."."
	Inst4Quest7_Prequest = "Нет"
	Inst4Quest7_Folgequest = "Потайной чертог"
	-- No Rewards for this quest
	
	--Quest 8 Alliance
	Inst4Quest8 = "8. Потайной чертог"
	Inst4Quest8_Level = "40"
	Inst4Quest8_Attain = "37"
	Inst4Quest8_Aim = "Прочитайте журнал Бейлога, исследуйте потайной чертог и потом доложите об увиденном геологу Грозовой Вершине."
	Inst4Quest8_Location = "Бейлог (Ульдаман; "..YELLOW.."[1]"..WHITE..")"
	Inst4Quest8_Note = "Тайная комната находится около "..YELLOW.."[4]"..WHITE..". Чтобы открыть тайную комнату вам понадобится Стержень Тсола с Ревелоша "..YELLOW.."[3]"..WHITE.." и Медальон Гни'кив из сундука Баэлога "..YELLOW.."[1]"..WHITE..". Соберите из этих предметов Доисторический посох. Посох используется в Комнате Карты между "..YELLOW.."[3] и [4]"..WHITE.." для вызова Иронаи. После того как убьете её, забегите в комнату откуда она пришла, чтобы выполнить задание."
	Inst4Quest8_Prequest = "Потерянные дворфы"
	Inst4Quest8_Folgequest = "Нет"
	--
	Inst4Quest8name1 = "Dwarven Charge"
	Inst4Quest8name2 = "Explorer's League Lodestar"
	
	--Quest 9 Alliance
	Inst4Quest9 = "9. Рассыпавшееся ожерелье"
	Inst4Quest9_Level = "41"
	Inst4Quest9_Attain = "37"
	Inst4Quest9_Aim = "Найдите создателя ожерелья, чтобы узнать, чего оно стоит."
	Inst4Quest9_Location = "Рассыпавшееся ожерелье (Падает случайно в Ульдамане)"
	Inst4Quest9_Note = "Принесите ожерелье Талвашу де Кисселю (Стальгорн - Палаты Магии; "..YELLOW.."36,3"..WHITE..")."
	Inst4Quest9_Prequest = "Нет"
	Inst4Quest9_Folgequest = "Мудрость за деньги"
	-- No Rewards for this quest
	
	--Quest 10 Alliance
	Inst4Quest10 = "10. Назад в Ульдаман"
	Inst4Quest10_Level = "42"
	Inst4Quest10_Attain = "37"
	Inst4Quest10_Aim = "Выясните, где именно в Ульдамане находится ожерелье Талваша. Убитый паладин, о котором он упоминал, был последним владельцем этого ожерелья."
	Inst4Quest10_Location = "Талваш дель Киссель (Стальгорн - Палаты магии; "..YELLOW.."36,3"..WHITE..")"
	Inst4Quest10_Note = "Паладин находится около "..YELLOW.."[2]"..WHITE.."."
	Inst4Quest10_Prequest = "Мудрость за деньги"
	Inst4Quest10_Folgequest = "Время собирать камни"
	-- No Rewards for this quest
	
	--Quest 11 Alliance
	Inst4Quest11 = "11. Время собирать камни"
	Inst4Quest11_Level = "43"
	Inst4Quest11_Attain = "40"
	Inst4Quest11_Aim = "Найдите рубин, сапфир, и топаз, которые спрятаны в разных местах Ульдамана. Когда найдете, свяжитесь с Талвашем дель Кисселем, используя фиал Видения, который он предоставил."
	Inst4Quest11_Location = "Останки паладина (Ульдаман; "..YELLOW.."[2]"..WHITE..")"
	Inst4Quest11_Note = "Камни находятся около "..YELLOW.."[1]"..WHITE.." в урне, "..YELLOW.."[8]"..WHITE.." из тайника клана Теневого горна, и "..YELLOW.."[9]"..WHITE.." с Гримлока. Обратите внимание, что когда вы откроете тайник, появятся несколько мобов и атакуют Вас.\nИспользуйте Чашу прорицания Талваша, чтобы сдать задание и продожить дальше."
	Inst4Quest11_Prequest = "Назад в Ульдаман"
	Inst4Quest11_Folgequest = "Восстановление ожерелья"
	-- No Rewards for this quest
	
	--Quest 12 Alliance
	Inst4Quest12 = "12. Восстановить ожерелье"
	Inst4Quest12_Level = "44"
	Inst4Quest12_Attain = "41"
	Inst4Quest12_Aim = "Добудьте источник энергии из самого мощного волшебного создания, которое найдете в Ульдамане и доставьте его Талвашу дель Кисселю в Стальгорн."
	Inst4Quest12_Location = "Гадальная чаша Талваша"
	Inst4Quest12_Note = "Источник силы сломанного ожерелья падает с Архедаса "..YELLOW.."[10]"..WHITE.."."
	Inst4Quest12_Prequest = "Время собирать камни"
	Inst4Quest12_Folgequest = "Нет"
	--
	Inst4Quest12name1 = "Talvash's Enhancing Necklace"
	
	--Quest 13 Alliance
	Inst4Quest13 = "13. В Ульдаман за реактивом"
	Inst4Quest13_Level = "42"
	Inst4Quest13_Attain = "39"
	Inst4Quest13_Aim = "Принесите 12 грибов-малиновиков Гхаку Целителю в Телcамар."
	Inst4Quest13_Location = "Гхак Целитель (Лок Модан - Телсамар; "..YELLOW.."37,49"..WHITE..")"
	Inst4Quest13_Note = "Грибы есть по всему подземелью. Травники могут видеть их на миникарте, если включен Поиск трав и они взяли задание."
	Inst4Quest13_Prequest = "Пробежка по Бесплодным землям"
	Inst4Quest13_Folgequest = "Пробежка по Бесплодным землям-2"
	--
	Inst4Quest13name1 = "Restorative Potion"
	
	--Quest 14 Alliance
	Inst4Quest14 = "14. Возвращенные сокровища"
	Inst4Quest14_Level = "43"
	Inst4Quest14_Attain = "33"
	Inst4Quest14_Aim = "Достаньте сокровище Крома Крепкорука из сундука в северном зале Ульдамана и принесите ему в Стальгорн."
	Inst4Quest14_Location = "Кром Крепкорук (Стальгорн - Зал исследователей; "..YELLOW.."74,9"..WHITE..")"
	Inst4Quest14_Note = "Вы найдете сокровище перед тем как войдете в подземелье. Оно на севере пещер, в юговосточном конце тоннеля."
	Inst4Quest14_Prequest = "Нет"
	Inst4Quest14_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 15 Alliance
	Inst4Quest15 = "15. Платиновые диски"
	Inst4Quest15_Level = "47"
	Inst4Quest15_Attain = "40"
	Inst4Quest15_Aim = "Поговорите с каменным Стражем и запомните все, что он передаст вам. Когда он закончит свой пересказ событий древности, активируйте диски Норганнона. -> Отнесите миниатюрную копию дисков Норганнона в Лигу Исследователей в Стальгорне."
	Inst4Quest15_Location = "Диски Нограннона (Ульдаман; "..YELLOW.."[11]"..WHITE..")"
	Inst4Quest15_Note = "После получения задания, поговорите с каменным стражем слева от дисков.  Потом снова используйте платиновые диски, чтобы получить миниатюрную копию, которую вы должны принести старшему исследователю Магелласу в Стальгорн - Зал исследователей ("..YELLOW.."69,18"..WHITE.."). Здесь есть другая линейка, которая называется Посмотрим что произойдет и начинается у историка Карника Стальгорн - Зал исследователей."
	Inst4Quest15_Prequest = "Нет"
	Inst4Quest15_Folgequest = "Ульдумские чудеса"
	--
	Inst4Quest15name1 = "Taupelzsack"
	Inst4Quest15name2 = "Superior Healing Potion"
	Inst4Quest15name3 = "Greater Mana Potion"
	
	--Quest 16 Alliance
	Inst4Quest16 = "16. Сила Ульдамана"
	Inst4Quest16_Level = "40"
	Inst4Quest16_Attain = "37"
	Inst4Quest16_Aim = "Добудьте обсидиановый источник силы и принесите его Табете в Пылевые топи."
	Inst4Quest16_Location = "Табета (Пылевые топи; "..YELLOW.."46,57"..WHITE..")"
	Inst4Quest16_Note = "Задание для магов: \nОбсидиановый источник силы падает из Обсидианового стража около "..YELLOW.."[5]"..WHITE.."."
	Inst4Quest16_Prequest = "Поединок с демоном"
	Inst4Quest16_Folgequest = "Волнолов маны"
	-- No Rewards for this quest
	
	
	--Quest 1 Horde  (same as Quest 4 Alliance)
	Inst4Quest1_HORDE = "1. Силовые камни"
	Inst4Quest1_HORDE_Level = Inst4Quest4_Level
	Inst4Quest1_HORDE_Attain = Inst4Quest4_Attain
	Inst4Quest1_HORDE_Aim = Inst4Quest4_Aim
	Inst4Quest1_HORDE_Location = Inst4Quest4_Location
	Inst4Quest1_HORDE_Note = Inst4Quest4_Note
	Inst4Quest1_HORDE_Prequest = Inst4Quest4_Prequest
	Inst4Quest1_HORDE_Folgequest = Inst4Quest4_Folgequest
	--
	Inst4Quest1name1_HORDE = Inst4Quest4name1
	Inst4Quest1name2_HORDE = Inst4Quest4name2
	Inst4Quest1name3_HORDE = Inst4Quest4name3
	
	--Quest 2 Horde  (same as Quest 6 Alliance - different followup)
	Inst4Quest2_HORDE = "2. Лекарство от судьбы"
	Inst4Quest2_HORDE_Level = Inst4Quest6_Level
	Inst4Quest2_HORDE_Attain = Inst4Quest6_Attain
	Inst4Quest2_HORDE_Aim = Inst4Quest6_Aim
	Inst4Quest2_HORDE_Location = Inst4Quest6_Location
	Inst4Quest2_HORDE_Note = Inst4Quest6_Note
	Inst4Quest2_HORDE_Prequest = Inst4Quest6_Prequest
	Inst4Quest2_HORDE_Folgequest = "В Подгород за книгой Йагина"
	--
	Inst4Quest2name1_HORDE = Inst4Quest6name1
	
	--Quest 3 Horde
	Inst4Quest3_HORDE = "3. Пропавшее ожерелье"
	Inst4Quest3_HORDE_Level = "41"
	Inst4Quest3_HORDE_Attain = "38"
	Inst4Quest3_HORDE_Aim = "Найдите на раскопках Ульдамана драгоценное ожерелье (возможно, поврежденное) и принесите его в Оргриммар Драну Дрофферсу."
	Inst4Quest3_HORDE_Location = "Дран Дрофферс (Оргриммар - Волок; "..YELLOW.."59,36"..WHITE..")"
	Inst4Quest3_HORDE_Note = "Ожерелье падает в подземелье случайно."
	Inst4Quest3_HORDE_Prequest = "Нет"
	Inst4Quest3_HORDE_Folgequest = "Пропавшее ожерелье, этап 2"
	-- No Rewards for this quest
	
	--Quest 4 Horde
	Inst4Quest4_HORDE = "4. Пропавшее ожерелье, этап 2"
	Inst4Quest4_HORDE_Level = "41"
	Inst4Quest4_HORDE_Attain = "39"
	Inst4Quest4_HORDE_Aim = "Разыщите ключ к местонахождению самоцветов в глубинах Ульдамана."
	Inst4Quest4_HORDE_Location = "Дран Дрофферс (Оргриммар - Волок; "..YELLOW.."59,36"..WHITE..")"
	Inst4Quest4_HORDE_Note = "Паладин находится около "..YELLOW.."[2]"..WHITE.."."
	Inst4Quest4_HORDE_Prequest = "Пропавшее ожерелье"
	Inst4Quest4_HORDE_Folgequest = "Трудности перевода"
	-- No Rewards for this quest
	
	--Quest 5 Horde
	Inst4Quest5_HORDE = "5. Трудности перевода"
	Inst4Quest5_HORDE_Level = "42"
	Inst4Quest5_HORDE_Attain = "41"
	Inst4Quest5_HORDE_Aim = "Найдите кого-нибудь, кто сможет перевести для Вас дневник паладина. Ближайший к вам такой умелец, скорее всего, найдется в Каргате, форпосте в Бесплодных Землях."
	Inst4Quest5_HORDE_Location = "Останки паладина (Ульдаман; "..YELLOW.."[2]"..WHITE..")"
	Inst4Quest5_HORDE_Note = "Переводчик Джаркал Замшелый Клык находится в Каргате (Бесплодные земли; "..YELLOW.."2,46"..WHITE..")."
	Inst4Quest5_HORDE_Prequest = "Пропавшее ожерелье, этап 2"
	Inst4Quest5_HORDE_Folgequest = "Найти самоцветы и источник энергии"
	-- No Rewards for this quest
	
	--Quest 6 Horde
	Inst4Quest6_HORDE = "6. Найти самоцветы и источник энергии"
	Inst4Quest6_HORDE_Level = "44"
	Inst4Quest6_HORDE_Attain = "40"
	Inst4Quest6_HORDE_Aim = "Добудьте все три самоцвета и источник энергии для ожерелья из Ульдамана и принесите их Джаркалу Замшелому Клыку в Каргат. Джаркал считает, что источник энергии можно найти у самой сильной твари в Ульдамане."
	Inst4Quest6_HORDE_Location = "Джаркал Замшелый Клык (Бесплодные земли - Каргат; "..YELLOW.."2,46"..WHITE..")"
	Inst4Quest6_HORDE_Note = "Самоцветы находятся около "..YELLOW.."[1]"..WHITE.." в урне, "..YELLOW.."[8]"..WHITE.." из тайника клана Тенегорна, и "..YELLOW.."[9]"..WHITE.." с Гримлока. Обратите внимание, что когда вы откроете тайник, появятся несколько мобов и атакуют Вас. Источник энергии сломанного ожерелья падает с Архедаса "..YELLOW.."[10]"..WHITE.."."
	Inst4Quest6_HORDE_Prequest = "Трудности перевода"
	Inst4Quest6_HORDE_Folgequest = "Принести самоцветы"
	--
	Inst4Quest6name1_HORDE = "Jarkal's Enhancing Necklace"
	
	--Quest 7 Horde
	Inst4Quest7_HORDE = "7. В Ульдаман за реактивом"
	Inst4Quest7_HORDE_Level = "42"
	Inst4Quest7_HORDE_Attain = "37"
	Inst4Quest7_HORDE_Aim = "Принести 12 грибов-малиновиков Джаркалу Замшелому Клыку в Каргат."
	Inst4Quest7_HORDE_Location = "Джаркал Замшелый Клык (Бесплодные земли - Каргат; "..YELLOW.."2,69"..WHITE..")"
	Inst4Quest7_HORDE_Note = "Предшествующее задание вы также возьмете в Каргате.\nШляпки есть по всему подземелью. Травники могут видеть их на миникарте, если включен Поиск трав и они взяли задание. Предыдущее задание дает этот же NPC."
	Inst4Quest7_HORDE_Prequest = "Пробежка по Бесплодным землям"
	Inst4Quest7_HORDE_Folgequest = "Пробежка по Бесплодным землям-2"
	--
	Inst4Quest7name1_HORDE = "Restorative Potion"
	
	--Quest 8 Horde
	Inst4Quest8_HORDE = "8. Возвращенные сокровища"
	Inst4Quest8_HORDE_Level = "43"
	Inst4Quest8_HORDE_Attain = "33"
	Inst4Quest8_HORDE_Aim = "Принесите Патрику Гарретту в Подгород фамильное сокровище из сундука в Южном зале Ульдамана."
	Inst4Quest8_HORDE_Location = "Патрик Гаррет (Подгород; "..YELLOW.."72,48"..WHITE..")"
	Inst4Quest8_HORDE_Note = "Вы найдете сокровище перед тем как войдете в подземелье. Оно на севере пещер, в юговосточном конце тоннеля."
	Inst4Quest8_HORDE_Prequest = "Нет"
	Inst4Quest8_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 9 Horde
	Inst4Quest9_HORDE = "9. Платиновые диски"
	Inst4Quest9_HORDE_Level = "47"
	Inst4Quest9_HORDE_Attain = "40"
	Inst4Quest9_HORDE_Aim = "Поговорите с каменным Стражем и запомните все, что он передаст вам. Когда он закончит свой пересказ событий древности, активируйте диски Норганнона. -> Отнесите миниатюрную копию дисков Норганнона кому-то из мудрецов с Громового Утеса."
	Inst4Quest9_HORDE_Location = "Диски Нограннона (Ульдаман; "..YELLOW.."[11]"..WHITE..")"
	Inst4Quest9_HORDE_Note = "После получения задания, поговорите с каменным стражем слева от дисков.  Потом снова используйте платиновые диски, чтобы получить миниатюрную копию, которую вы должны принести ведуну Искателю Истины в Громовой Утес ("..YELLOW.."34,46"..WHITE..")"
	Inst4Quest9_HORDE_Prequest = "Нет"
	Inst4Quest9_HORDE_Folgequest = "Ульдумские чудеса"
	--
	Inst4Quest9name1_HORDE = "Taupelzsack"
	Inst4Quest9name2_HORDE = "Superior Healing Potion"
	Inst4Quest9name3_HORDE = "Greater Mana Potion"
	
	--Quest 10 Horde  (same as Quest 4 Alliance)
	Inst4Quest10_HORDE = "10. Сила Ульдамана"
	Inst4Quest10_HORDE_Level = Inst4Quest16_Level
	Inst4Quest10_HORDE_Attain = Inst4Quest16_Attain
	Inst4Quest10_HORDE_Aim = Inst4Quest16_Aim
	Inst4Quest10_HORDE_Location = Inst4Quest16_Location
	Inst4Quest10_HORDE_Note = Inst4Quest16_Note
	Inst4Quest10_HORDE_Prequest = Inst4Quest16_Prequest
	Inst4Quest10_HORDE_Folgequest = Inst4Quest16_Folgequest
	-- No Rewards for this quest
	
	
	
	--------------- INST5 - Blackrock Depths (BRD) ---------------
	Inst5Story = "Когда-то будучи столицей дворфов клана Темного Железа, этот вулканический лабиринт теперь является безраздельными владениями Огненого лорда Рагнароса. Рагнорос открыл секрет создания жизни из камня и собирается построить армию неудержимых големов, чтобы те помогли ему завоевать всю Черную гору целиком. Помешавшись на мысли победить Нефариана и его драконьих прислужников, Рагнарос пойдет на любую крайность чтобы достичь окончательной победы."
	Inst5Caption = "Глубины Черной горы"
	Inst5QAA = "17 Заданий"
	Inst5QAH = "17 Заданий"
	
	--Quest 1 Alliance
	Inst5Quest1 = "1. Наследие Черного Железа"
	Inst5Quest1_Level = "52"
	Inst5Quest1_Attain = "50"
	Inst5Quest1_Aim = "Убейте Финия Темностроя и добудьте великий молот, Железный Друг. Отнесите Железного Друга в святилище Тауриссана и вложите его в руки статуи Франклорна Искусника."
	Inst5Quest1_Location = "Франклорн Искусник (Черная гора)"
	Inst5Quest1_Note = "Франклорн находится в средине горы, над своей могилой, в здании около камня призыва. Вы должны быть мертвы, чтобы увидеть его! Он также дает предыдущее задание в цепочке.\nФиний Темнострой находится около "..YELLOW.."[9]"..WHITE..". Вы найдете Святилище рядом с ареной "..YELLOW.."[7]"..WHITE.."."
	Inst5Quest1_Prequest = "Наследие Черного Железа"
	Inst5Quest1_Folgequest = "Нет"
	--
	Inst5Quest1name1 = "Shadowforge Key"
	
	--Quest 2 Alliance
	Inst5Quest2 = "2. Риббли Крутипроб"
	Inst5Quest2_Level = "53"
	Inst5Quest2_Attain = "48"
	Inst5Quest2_Aim = "Принесите голову Риббли Юке Крутипроб в Пылающие степи."
	Inst5Quest2_Location = "Юка Крутипроб (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,22"..WHITE..")"
	Inst5Quest2_Note = "Вы получите предшествующее задание у Юрбы Крутипроба (Танарис - Порт Картеля; "..YELLOW.."67,23"..WHITE..").\nРиббли находится около "..YELLOW.."[15]"..WHITE.."."
	Inst5Quest2_Prequest = "Юка Крутипроб"
	Inst5Quest2_Folgequest = "Нет"
	--
	Inst5Quest2name1 = "Rancor Boots"
	Inst5Quest2name2 = "Penance Spaulders"
	Inst5Quest2name3 = "Splintsteel Armor"
	
	--Quest 3 Alliance
	Inst5Quest3 = "3. Приворотное зелье"
	Inst5Quest3_Level = "54"
	Inst5Quest3_Attain = "52"
	Inst5Quest3_Aim = "Принесите 4 листа крови Грома, 10 огромных серебряных слитков и наполненный сосуд Нагмары госпоже Нагмаре в Глубины Черной горы."
	Inst5Quest3_Location = "Госпожа Нагмара (Глубины Черной горы, таверна)"
	Inst5Quest3_Note = "Получить огромные серебряные слитки можно с Гигантов в Азшаре. Листки крови Грома легко можно найти у травников или на Аукционе. И последнее, сосуд можно наполнить в кратере Го-Лакка (Кратер Ун'Горо; "..YELLOW.."31,50"..WHITE..").\nПосле выполнения задания, вы можете использоать черный ход вместо сражения с Фалангой."
	Inst5Quest3_Prequest = "Нет"
	Inst5Quest3_Folgequest = "Нет"
	--
	Inst5Quest3name1 = "Manacle Cuffs"
	Inst5Quest3name2 = "Nagmara's Whipping Belt"
	
	--Quest 4 Alliance
	Inst5Quest4 = "4. Харли Чернопых"
	Inst5Quest4_Level = "55"
	Inst5Quest4_Attain = "50"
	Inst5Quest4_Aim = "Найдите украденный рецепт Громоваров и верните его Рагнару Громовару в Каранос."
	Inst5Quest4_Location = "Рагнар Грозовар  (Дун Морог - Каранос; "..YELLOW.."46,52"..WHITE..")"
	Inst5Quest4_Note = "Вы возьмете предшествующее задание у Енохи Грозовара (Выжженные земли - Крепость стражей Пустоты; "..YELLOW.."61,18"..WHITE..").\nВы получите рецепт с охранников, которые появятся, если вы уничтожите эль "..YELLOW.."[15]"..WHITE.."."
	Inst5Quest4_Prequest = "Рагнар Грозовар"
	Inst5Quest4_Folgequest = "Нет"
	--
	Inst5Quest4name1 = "Dark Dwarven Lager"
	Inst5Quest4name2 = "Swiftstrike Cudgel"
	Inst5Quest4name3 = "Limb Cleaver"
	
	--Quest 5 Alliance
	Inst5Quest5 = "5. Опалитель!"
	Inst5Quest5_Level = "56"
	Inst5Quest5_Attain = "49"
	Inst5Quest5_Aim = "Отыщите и уничтожьте лорда Опалителя в глубинах Черной горы!"
	Inst5Quest5_Location = "Джалинда Тирлипунька (Пылающие степи - Дозор Моргана; "..YELLOW.."85,69"..WHITE..")"
	Inst5Quest5_Note = "Вы возьмете предшествующее задание также у Джалинды Тирлипуньки. Вы найдете лорда Опалителя около "..YELLOW.."[10]"..WHITE.."."
	Inst5Quest5_Prequest = "Подчинитель Пирон"
	Inst5Quest5_Folgequest = "Нет"
	--
	Inst5Quest5name1 = "Sunborne Cape"
	Inst5Quest5name2 = "Nightfall Gloves"
	Inst5Quest5name3 = "Crypt Demon Bracers"
	Inst5Quest5name4 = "Stalwart Clutch"
	
	--Quest 6 Alliance
	Inst5Quest6 = "6. Сердце горы"
	Inst5Quest6_Level = "55"
	Inst5Quest6_Attain = "50"
	Inst5Quest6_Aim = "Принесите сердце горы Максворту Суперблеску в Пылающие степи."
	Inst5Quest6_Location = "Максворт Суперблеск (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,23"..WHITE..")"
	Inst5Quest6_Note = "Вы найдете Сердце около "..YELLOW.."[8]"..WHITE.." в сейфе. Вы возьмете ключ от сейфа у сторожа Стиллгисс. Он появляется после открытия всех маленьких сейфов."
	Inst5Quest6_Prequest = "Нет"
	Inst5Quest6_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 7 Alliance
	Inst5Quest7 = "7. Хороший товар"
	Inst5Quest7_Level = "56"
	Inst5Quest7_Attain = "50"
	Inst5Quest7_Aim = "Отправьтесь в глубины Черной горы и принесите 20 поясных сумок дворфов Черного Железа. По выполнении задания вернуться к Орелиусу. Предположительно поясные сумки можно отобрать у дворфов Черного Железа в глубинах Черной горы."
	Inst5Quest7_Location = "Орелиус (Пылающие степи - Дозор Моргана; "..YELLOW.."84,68"..WHITE..")"
	Inst5Quest7_Note = "Сумки падают со всех дворфов."
	Inst5Quest7_Prequest = "Нет"
	Inst5Quest7_Folgequest = "Нет"
	--
	Inst5Quest7name1 = "A Dingy Fanny Pack"
	
	--Quest 8 Alliance
	Inst5Quest8 = "8. Маршал Винздор"
	Inst5Quest8_Level = "54"
	Inst5Quest8_Attain = "48"
	Inst5Quest8_Aim = "Отправляйтесь на Черную гору на северо-западе и войдите в Глубины Черной горы. Узнайте, что сталось с маршалом Виндзором.\nКажется, Джон-Оборванец говорил о том, что Виндзора утащили в темницу."
	Inst5Quest8_Location = "Маршал Максвелл (Пылающие степи "..YELLOW.."84,68"..WHITE..")"
	Inst5Quest8_Note = "Заданиче начинается с Хелендис Речной мыс (Пылающие степи "..YELLOW.."85,68"..WHITE..").\nМаршал Винздор находится около "..YELLOW.."[4]"..WHITE..". После выполнения этого задания, вы должны вернуться к Маршал Максвелл."
	Inst5Quest8_Prequest = "Драконья угроза -> Подлинные хозяева"
	Inst5Quest8_Folgequest = "Утраченная надежда -> Измятая записка"
	--
	Inst5Quest8name1 = "Conservator Helm"
	Inst5Quest8name2 = "Shieldplate Sabatons"
	Inst5Quest8name3 = "Windshear Leggings"
	
	--Quest 9 Alliance
	Inst5Quest9 = "9. Измятая записка"
	Inst5Quest9_Level = "58"
	Inst5Quest9_Attain = "51"
	Inst5Quest9_Aim = "Не исключено, что ваша находка заинтересует маршала Виндзора. Может быть, все не так плохо, и надежда еще жива."
	Inst5Quest9_Location = "Измятая записка (выпадает) (Глубины Черной горы)"
	Inst5Quest9_Note = "Маршал Виндзор около "..YELLOW.."[4]"..WHITE.."."
	Inst5Quest9_Prequest = "Маршал Винздор"
	Inst5Quest9_Folgequest = "Проблеск надежды"
	-- No Rewards for this quest
	
	--Quest 10 Alliance
	Inst5Quest10 = "10. Проблеск надежды"
	Inst5Quest10_Level = "58"
	Inst5Quest10_Attain = "52"
	Inst5Quest10_Aim = "Верните маршалу Виндзору утерянную информацию.\nМаршал уверен, что информацией завладели повелитель големов Аргелмах и генерал Кузня Гнева."
	Inst5Quest10_Location = "Маршал Виндзор (Глубины Черной горы "..YELLOW..""..YELLOW.."[4]"..WHITE..""..WHITE..")"
	Inst5Quest10_Note = "Маршал Виндзор около "..YELLOW.."[4]"..WHITE..".\nПовелитель големов Аргелмах "..YELLOW.."[14]"..WHITE..", Генерал Кузня Гнева "..YELLOW.."[13]"..WHITE.."."
	Inst5Quest10_Prequest = "Измятая записка"
	Inst5Quest10_Folgequest = "Побег!"
	-- No Rewards for this quest
	
	--Quest 11 Alliance
	Inst5Quest11 = "11. Побег!"
	Inst5Quest11_Level = "58"
	Inst5Quest11_Attain = "53"
	Inst5Quest11_Aim = "Помогите маршалу Виндзору забрать вещи и освободить его друзей, после чего вернитесь к маршалу Максвеллу и получите дальнейшие инструкции."
	Inst5Quest11_Location = "Маршал Виндзор (Глубины Черной горы "..YELLOW..""..YELLOW.."[4]"..WHITE..""..WHITE..")"
	Inst5Quest11_Note = "Маршал Виндзор около "..YELLOW.."[4]"..WHITE..".\nВы найдете маршала Максвелла в Пылающих Степях ("..YELLOW.."84,68"..WHITE..")"
	Inst5Quest11_Prequest = "Проблеск надежды"
	Inst5Quest11_Folgequest = "Встреча в Штормграде"
	--
	Inst5Quest11name1 = "Ward of the Elements"
	Inst5Quest11name2 = "Blade of Reckoning"
	Inst5Quest11name3 = "Skilled Fighting Blade"
	
	--Quest 12 Alliance
	Inst5Quest12 = "12. Вкус пламени"
	Inst5Quest12_Level = "58"
	Inst5Quest12_Attain = "52"
	Inst5Quest12_Aim = "Отправьтесь в глубины Черной горы и убейте Бейл'Гора. "..YELLOW.."[11]"..WHITE.." Отнесите пойманную сущность Огня Цирусу Раскаивателю."
	Inst5Quest12_Location = "Цирус Раскаиватель (Пылающие Степи "..YELLOW.."94,31"..WHITE..")"
	Inst5Quest12_Note = "Задание начинает Каларан Ветрорез (Тлеющее ущелье; 39,38).\nБейл'Гор "..YELLOW.."[11]"..WHITE.."."
	Inst5Quest12_Prequest = "Неугасимое пламя -> Вкус пламени"
	Inst5Quest12_Folgequest = "Нет"
	--
	Inst5Quest12name1 = "Shaleskin Cape"
	Inst5Quest12name2 = "Wyrmhide Spaulders"
	Inst5Quest12name3 = "Valconian Sash"
	
	--Quest 13 Alliance
	Inst5Quest13 = "13. Каран Могучий Молот"
	Inst5Quest13_Level = "59"
	Inst5Quest13_Attain = "51"
	Inst5Quest13_Aim = "Пойдите в Глубины Черной горы и найдите Карана Могучего Молота.\nКороль упомянул, что Каран сидит там в плену – может, стоит поискать темницу."
	Inst5Quest13_Location = "Король Магни Бронзобород (Стальгорн; "..YELLOW.."39,55"..WHITE..")"
	Inst5Quest13_Note = "Предшествующее задание начинается у Королевского историка Аркессонуса (Стальгорн; "..YELLOW.."38,55"..WHITE.."). Каран Могучий Молот находится около "..YELLOW.."[2]"..WHITE.."."
	Inst5Quest13_Prequest = "Дымящиеся руины Тауриссана"
	Inst5Quest13_Folgequest = "Недобрые вести"
	-- No Rewards for this quest
	
	--Quest 14 Alliance
	Inst5Quest14 = "14. Судьба королевства"
	Inst5Quest14_Level = "59"
	Inst5Quest14_Attain = "52"
	Inst5Quest14_Aim = "Вернитесь в Глубины Черной горы и освободите принцессу Мойру Бронзобород от злобного императора Даграна Тауриссана."
	Inst5Quest14_Location = "Король Магни Бронзобород (Стальгорн; "..YELLOW.."39,55"..WHITE..")"
	Inst5Quest14_Note = "Принцесса Мойра Бронзобород находится около "..YELLOW.."[21]"..WHITE..". Во время боя она может лечить Даграна. Постарайтесь по возможности сбивать ей заклинание, но торопитесь, так она не должна умереть или вы провалите задание! После того как поговорите с ней, вы должны вернуться к Магни Бронзобороду."
	Inst5Quest14_Prequest = "Недобрые вести"
	Inst5Quest14_Folgequest = "Королевский сюрприз"
	--
	Inst5Quest14name1 = "Magni's Will"
	Inst5Quest14name2 = "Songstone of Ironforge"
	
	--Quest 15 Alliance
	Inst5Quest15 = "15. Сродство с недрами"
	Inst5Quest15_Level = "60"
	Inst5Quest15_Attain = "55"
	Inst5Quest15_Aim = "Отправляйтесь через портал, ведущий к Огненным Недрам в Глубинах Черной горы и добудьте осколок из Огненных Недр. Принесите его Лотосу Хранителю Портала в Черной горе."
	Inst5Quest15_Location = "Лотос Хранитель Портала (Черная гора; "..YELLOW.."[2] на карте Входа"..WHITE..")"
	Inst5Quest15_Note = "После выполнения задания вы сможете использовать камень ряом с Лотосом Хранителем Портала, чтобы войти в Расплавленные недра.\nВы найдете фрагмент ядра около "..YELLOW.."[23]"..WHITE..", сосем близко от портала в Расплавленные недра."
	Inst5Quest15_Prequest = "Нет"
	Inst5Quest15_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 16 Alliance
	Inst5Quest16 = "16. Вызов"
	Inst5Quest16_Level = "60"
	Inst5Quest16_Attain = "58"
	Inst5Quest16_Aim = "Войдите в Зал Правосудия в Глубинах Черной горы, выслушайте приговор верховного судьи Мрачнокамня и вонзите знамя Вызова в центр круга. Убейте Телдрена и его гладиаторов, после чего вернитесь к Антиону Хармону в Восточные Чумные земли с первой частью амулета Лорда Вальтхалака."
	Inst5Quest16_Location = "Фалрин Садовник (Забытый город (Запад); "..YELLOW.."[1] Бибилиотека"..WHITE..")"
	Inst5Quest16_Note = "Предыдущие задания отличаются для каждого класса."
	Inst5Quest16_Prequest = "Нет"
	Inst5Quest16_Folgequest = "(Классовые задания)"
	-- No Rewards for this quest
	
	--Quest 17 Alliance
	Inst5Quest17 = "17. Призрачный кубок"
	Inst5Quest17_Level = "55"
	Inst5Quest17_Attain = "40"
	Inst5Quest17_Aim = "Драгоценные камни не издают ни звука, когда они падают в глубь чаши..."
	Inst5Quest17_Location = "Gloom'rel (Глубины Черной горы; "..YELLOW.."[18]"..WHITE..")"
	Inst5Quest17_Note = "Только шахтеры с навыком 230 или выше могут получить это задание, чтобы научиться выплавлять черное железо. Материалы для чаши: 2 [Звездный Рубин], 20 [Золотой слиток], 10 [Слиток истинного серебра]. После этого, если у Вас есть [Руда черного железа] Вы можете отнести ее к Черной Кузни "..YELLOW.."[22]"..WHITE.." и выплавить ее."
	Inst5Quest17_Prequest = "Нет"
	Inst5Quest17_Folgequest = "Нет"
	-- No Rewards for this quest
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst5Quest1_HORDE = Inst5Quest1
	Inst5Quest1_HORDE_Level = Inst5Quest1_Level
	Inst5Quest1_HORDE_Attain = Inst5Quest1_Attain
	Inst5Quest1_HORDE_Aim = Inst5Quest1_Aim
	Inst5Quest1_HORDE_Location = Inst5Quest1_Location
	Inst5Quest1_HORDE_Note = Inst5Quest1_Note
	Inst5Quest1_HORDE_Prequest = Inst5Quest1_Prequest
	Inst5Quest1_HORDE_Folgequest = Inst5Quest1_Folgequest
	--
	Inst5Quest1name1_HORDE = Inst5Quest1name1
	
	--Quest 2 Horde  (same as Quest 2 Alliance)
	Inst5Quest2_HORDE = Inst5Quest2
	Inst5Quest2_HORDE_Level = Inst5Quest2_Level
	Inst5Quest2_HORDE_Attain = Inst5Quest2_Attain
	Inst5Quest2_HORDE_Aim = Inst5Quest2_Aim
	Inst5Quest2_HORDE_Location = Inst5Quest2_Location
	Inst5Quest2_HORDE_Note = Inst5Quest2_Note
	Inst5Quest2_HORDE_Prequest = Inst5Quest2_Prequest
	Inst5Quest2_HORDE_Folgequest = Inst5Quest2_Folgequest
	--
	Inst5Quest2name1_HORDE = Inst5Quest2name1
	Inst5Quest2name2_HORDE = Inst5Quest2name2
	Inst5Quest2name3_HORDE = Inst5Quest2name3
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst5Quest3_HORDE = Inst5Quest3
	Inst5Quest3_HORDE_Level = Inst5Quest3_Level
	Inst5Quest3_HORDE_Attain = Inst5Quest3_Attain
	Inst5Quest3_HORDE_Aim = Inst5Quest3_Aim
	Inst5Quest3_HORDE_Location = Inst5Quest3_Location
	Inst5Quest3_HORDE_Note = Inst5Quest3_Note
	Inst5Quest3_HORDE_Prequest = Inst5Quest3_Prequest
	Inst5Quest3_HORDE_Folgequest = Inst5Quest3_Folgequest
	--
	Inst5Quest3name1_HORDE = Inst5Quest3name1
	Inst5Quest3name2_HORDE = Inst5Quest3name2
	
	--Quest 4 Horde
	Inst5Quest4_HORDE = "4. Украденный рецепт Громоваров"
	Inst5Quest4_HORDE_Level = "55"
	Inst5Quest4_HORDE_Attain = "50"
	Inst5Quest4_HORDE_Aim = "Принесите рецепт светлого громоварского Вивиан Лягроб в Каргат."
	Inst5Quest4_HORDE_Location = "Темный маг Вивиан Лягроб (Бесплодные земли - Каргат; "..YELLOW.."2,47"..WHITE..")"
	Inst5Quest4_HORDE_Note = "Вы получите предшествующее задание у аптекаря Зинга в Подгороде - Квартал фармацевтов ("..YELLOW.."50,68"..WHITE..").\nВы получите рецепт у одного из охранников, которые появятся, если вы уничтожите эль "..YELLOW.."[15]"..WHITE.."."
	Inst5Quest4_HORDE_Prequest = "Вивиан Лягроб"
	Inst5Quest4_HORDE_Folgequest = "Нет"
	--
	Inst5Quest4name1_HORDE = "Superior Healing Potion"
	Inst5Quest4name2_HORDE = "Greater Mana Potion"
	Inst5Quest4name3_HORDE = "Swiftstrike Cudgel"
	Inst5Quest4name4_HORDE = "Limb Cleaver"
	
	--Quest 5 Horde  (same as Quest 6 Alliance)
	Inst5Quest5_HORDE = "5. Сердце горы"
	Inst5Quest5_HORDE_Level = Inst5Quest6_Level
	Inst5Quest5_HORDE_Attain = Inst5Quest6_Attain
	Inst5Quest5_HORDE_Aim = Inst5Quest6_Aim
	Inst5Quest5_HORDE_Location = Inst5Quest6_Location
	Inst5Quest5_HORDE_Note = Inst5Quest6_Note
	Inst5Quest5_HORDE_Prequest = Inst5Quest6_Prequest
	Inst5Quest5_HORDE_Folgequest = Inst5Quest6_Folgequest
	-- No Rewards for this quest
	
	--Quest 6 Horde
	Inst5Quest6_HORDE = "6. УНИЧТОЖИТЬ НА МЕСТЕ: Дворфы Черного Железа"
	Inst5Quest6_HORDE_Level = "52"
	Inst5Quest6_HORDE_Attain = "49"
	Inst5Quest6_HORDE_Aim = "Отправляйтесь в Глубины Черной горы и уничтожьте подлых агрессоров! По приказу полководца Клинозуба уничтожьте 15 охранников, 10 надсмотрщиков и 5 пехотинцев из клана Ярости Горна. Вернитесь сразу по выполнении задания."
	Inst5Quest6_HORDE_Location = "Доска объявлений (Бесплодные земли - Каргат; "..YELLOW.."3,47"..WHITE..")"
	Inst5Quest6_HORDE_Note = "Вы найдете дворфов в первой части Глубин Черной горы.\nВы найдете полководца Клинозуба в Каргате на вершине башни (Бесплодные земли, "..YELLOW.."5,47"..WHITE..")."
	Inst5Quest6_HORDE_Prequest = "Нет"
	Inst5Quest6_HORDE_Folgequest = "УНИЧТОЖИТЬ НА МЕСТЕ: Высокопоставленные чины Черного Железа"
	-- No Rewards for this quest
	
	--Quest 7 Horde
	Inst5Quest7_HORDE = "7. УНИЧТОЖИТЬ НА МЕСТЕ: Высокопоставленные чины Черного Железа"
	Inst5Quest7_HORDE_Level = "54"
	Inst5Quest7_HORDE_Attain = "52"
	Inst5Quest7_HORDE_Aim = "Отправляйтесь в Глубины Черной горы и уничтожьте подлых агрессоров! По приказу полководца Клинозуба уничтожьте 10 медиков, 10 солдат и 10 офицеров из клана Ярости Горна. Вернитесь сразу по выполнении задания."
	Inst5Quest7_HORDE_Location = "Доска объявлений (Бесплодные земли - Каргат; "..YELLOW.."3,47"..WHITE..")"
	Inst5Quest7_HORDE_Note = "Вы найдете дворфов около Бейл'Гор "..YELLOW.."[11]"..WHITE..". Вы найдете полководца Клинозуба в Каргате на вершине башни (Бесплодные земли, "..YELLOW.."5,47"..WHITE..").\n Последующее задание начинается у Лекслорта (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE.."). Вы найдете Грарка в Пылающих степях ("..YELLOW.."38,35"..WHITE.."). Вы должны опустить его ХП ниже 50%, чтобы начать задание сопровождения."
	Inst5Quest7_HORDE_Prequest = "УНИЧТОЖИТЬ НА МЕСТЕ: Дворфы Черного Железа"
	Inst5Quest7_HORDE_Folgequest = "Грарк Лоркруб -> Опасное положение (Задание сопровождения)"
	-- No Rewards for this quest
	
	--Quest 8 Horde
	Inst5Quest8_HORDE = "8. Операция: Смерть Кузне Гнева"
	Inst5Quest8_HORDE_Level = "58"
	Inst5Quest8_HORDE_Attain = "58"
	Inst5Quest8_HORDE_Aim = "Отправляйтесь в Глубины Черной горы и убейте генерала Кузню Гнева. Вернитесь к полководцу Клинозубу по выполнении задания."
	Inst5Quest8_HORDE_Location = "Полководец Клинозуб (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE..")"
	Inst5Quest8_HORDE_Note = "Вы найдете генерала Кузню Гнева около "..YELLOW.."[13]"..WHITE..". Он зовет подкрепление когда ХП ниже 30%!"
	Inst5Quest8_HORDE_Prequest = "Опасное положение"
	Inst5Quest8_HORDE_Folgequest = "Нет"
	--
	Inst5Quest8name1_HORDE = "Conqueror's Medallion"
	
	--Quest 9 Horde
	Inst5Quest9_HORDE = "9. Восстание машин"
	Inst5Quest9_HORDE_Level = "58"
	Inst5Quest9_HORDE_Attain = "53"
	Inst5Quest9_HORDE_Aim = "Найдите и убейте повелителя големов Аргелмаха. Принесите его голову Лотвилу. Также соберите 10 невредимых ядер стихий с беспощадных големов и созданий-завоевателей, охраняющих Аргелмаха."
	Inst5Quest9_HORDE_Location = "Лотвиль Вериатус (Бесплодные земли; "..YELLOW.."25,44"..WHITE..")"
	Inst5Quest9_HORDE_Note = "Вы возьмете предшествуещее задание у  Верховной Жрицы Теодоры Мальвадании (Бесплодные земли - Каргат; "..YELLOW.."3,47"..WHITE..").\nВы найдете Аргелмаха около "..YELLOW.."[14]"..WHITE.."."
	Inst5Quest9_HORDE_Prequest = "Восстание машин"
	Inst5Quest9_HORDE_Folgequest = "Нет"
	--
	Inst5Quest9name1_HORDE = "Azure Moon Amice"
	Inst5Quest9name2_HORDE = "Raincaster Drape"
	Inst5Quest9name3_HORDE = "Basaltscale Armor"
	Inst5Quest9name4_HORDE = "Lavaplate Gauntlets"
	
	--Quest 10 Horde  (same as Quest 12 Alliance)
	Inst5Quest10_HORDE = "10. Вкус пламени"
	Inst5Quest10_HORDE_Level = Inst5Quest12_Level
	Inst5Quest10_HORDE_Attain = Inst5Quest12_Attain
	Inst5Quest10_HORDE_Aim = Inst5Quest12_Aim
	Inst5Quest10_HORDE_Location = Inst5Quest12_Location
	Inst5Quest10_HORDE_Note = Inst5Quest12_Note
	Inst5Quest10_HORDE_Prequest = Inst5Quest12_Prequest
	Inst5Quest10_HORDE_Folgequest = Inst5Quest12_Folgequest
	--
	Inst5Quest10name1_HORDE = Inst5Quest12name1
	Inst5Quest10name2_HORDE = Inst5Quest12name2
	Inst5Quest10name3_HORDE = Inst5Quest12name3
	
	--Quest 11 Horde
	Inst5Quest11_HORDE = "11. Дисгармония пламени"
	Inst5Quest11_HORDE_Level = "56"
	Inst5Quest11_HORDE_Attain = "50"
	Inst5Quest11_HORDE_Aim = "Ступайте в глубины Черной горы и выследите лорда Опалителя. Убейте его и принесите Громосерду все, что может дать какую-то информацию."
	Inst5Quest11_HORDE_Location = "Громосерд (Бесплодные земли - Каргат; "..YELLOW.."3,48"..WHITE..")"
	Inst5Quest11_HORDE_Note = "Вы получите предыдущее задание у Громосерда тоже.\nВы найдете Лорда Опалителя около "..YELLOW.."[10]"..WHITE.."."
	Inst5Quest11_HORDE_Prequest = "Дисгармония пламени"
	Inst5Quest11_HORDE_Folgequest = "Нет"
	--
	Inst5Quest11name1_HORDE = "Sunborne Cape"
	Inst5Quest11name2_HORDE = "Nightfall Gloves"
	Inst5Quest11name3_HORDE = "Crypt Demon Bracers"
	Inst5Quest11name4_HORDE = "Stalwart Clutch"
	
	--Quest 12 Horde
	Inst5Quest12_HORDE = "12. Последний элемент"
	Inst5Quest12_HORDE_Level = "54"
	Inst5Quest12_HORDE_Attain = "52"
	Inst5Quest12_HORDE_Aim = "Отправляйтесь в Глубины Черной горы и добудьте 10 мер сущности Стихий. Стоит начать поиски с големов и их создателей. Вивиан Лягроб также бормотала что-то про элементалей."
	Inst5Quest12_HORDE_Location = "Темный маг Вивиана Лягроб (Бесплодные земли - Каргат; "..YELLOW.."2,47"..WHITE..")"
	Inst5Quest12_HORDE_Note = "Вы получите предшествующее задание у Громосерда (Бесплодные земли - Каргат; "..YELLOW.."3,48"..WHITE..").\n С каждого элементаля может выпасть сущность стихий"
	Inst5Quest12_HORDE_Prequest = "Нет"
	Inst5Quest12_HORDE_Folgequest = "Нет"
	--
	Inst5Quest12name1_HORDE = "Lagrave's Seal"
	
	--Quest 13 Horde
	Inst5Quest13_HORDE = "13. Командир Гор'шак"
	Inst5Quest13_HORDE_Level = "52"
	Inst5Quest13_HORDE_Attain = "52"
	Inst5Quest13_HORDE_Aim = "Найдите командира Гор'шака в Глубинах Черной горы.\nСудя по рисунку в записке, искать следует в темнице где-то вроде того."
	Inst5Quest13_HORDE_Location = "Гамалав Стрелок (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE..")"
	Inst5Quest13_HORDE_Note = "Вы получите предшествующее задание у Громосерда (Бесплодные земли - Каргат; "..YELLOW.."3,48"..WHITE..").\nВы найдете командира Гор'шака около "..YELLOW.."[3]"..WHITE..". Ключ, чтобы открыть камеру, пдает с Веровного Дознавателя Герштаны "..YELLOW.."[5]"..WHITE..". Если вы поговорите с ним, начнется следующее задание и появятся враги."
	Inst5Quest13_HORDE_Prequest = "Дисгармония пламени"
	Inst5Quest13_HORDE_Folgequest = "Что происходит?"
	-- No Rewards for this quest
	
	--Quest 14 Horde
	Inst5Quest14_HORDE = "14. Спасение принцессы"
	Inst5Quest14_HORDE_Level = "59"
	Inst5Quest14_HORDE_Attain = "56"
	Inst5Quest14_HORDE_Aim = "Убейте императора Даграна Тауриссана и освободите принцессу Мойру Бронзобород от его черного заклятия."
	Inst5Quest14_HORDE_Location = "Тралл (Оргриммар; "..YELLOW.."31,37"..WHITE..")"
	Inst5Quest14_HORDE_Note = "После того, как вы поговорите с Караном Могучим Молотом и Траллом, вы получите это задание.\nВы найдете императора Даграна Тауриссана около "..YELLOW.."[21]"..WHITE..". Во время боя принцесса может лечить Даграна. Постарайтесь по возможности сбивать ей заклинание, но торопитесь, так она не должна умереть или вы провалите задание! (Награда за Спасенная принцесса)"
	Inst5Quest14_HORDE_Prequest = "Командир Гор'шак -> Восточные королевства"
	Inst5Quest14_HORDE_Folgequest = "Спасенная принцесса"
	--
	Inst5Quest14name1_HORDE = "Thrall's Resolve"
	Inst5Quest14name2_HORDE = "Eye of Orgrimmar"
	
	--Quest 15 Horde  (same as Quest 15 Alliance)
	Inst5Quest15_HORDE = Inst5Quest15
	Inst5Quest15_HORDE_Attain = Inst5Quest15_Attain
	Inst5Quest15_HORDE_Level = Inst5Quest15_Level
	Inst5Quest15_HORDE_Aim = Inst5Quest15_Aim
	Inst5Quest15_HORDE_Location = Inst5Quest15_Location
	Inst5Quest15_HORDE_Note = Inst5Quest15_Note
	Inst5Quest15_HORDE_Prequest = Inst5Quest15_Prequest
	Inst5Quest15_HORDE_Folgequest = Inst5Quest15_Folgequest
	-- No Rewards for this quest
	
	--Quest 16 Horde  (same as Quest 16 Alliance)
	Inst5Quest16_HORDE = Inst5Quest16
	Inst5Quest16_HORDE_Level = Inst5Quest16_Level
	Inst5Quest16_HORDE_Attain = Inst5Quest16_Attain
	Inst5Quest16_HORDE_Aim = Inst5Quest16_Aim
	Inst5Quest16_HORDE_Location = Inst5Quest16_Location
	Inst5Quest16_HORDE_Note = Inst5Quest16_Note
	Inst5Quest16_HORDE_Prequest = Inst5Quest16_Prequest
	Inst5Quest16_HORDE_Folgequest = Inst5Quest16_Folgequest
	-- No Rewards for this quest
	
	--Quest 17 Horde  (same as Quest 17 Alliance)
	Inst5Quest17_HORDE = Inst5Quest17
	Inst5Quest17_HORDE_Level = Inst5Quest17_Level
	Inst5Quest17_HORDE_Attain = Inst5Quest17_Attain
	Inst5Quest17_HORDE_Aim = Inst5Quest17_Aim
	Inst5Quest17_HORDE_Location = Inst5Quest17_Location
	Inst5Quest17_HORDE_Note = Inst5Quest17_Note
	Inst5Quest17_HORDE_Prequest = Inst5Quest17_Prequest
	Inst5Quest17_HORDE_Folgequest = Inst5Quest17_Folgequest
	-- No Rewards for this quest
	
	
	
	--------------- INST6 - Blackwing Lair (BWL) ---------------
	Inst6Story = {
		["Page1"] = "Blackwing Lair can be found at the very height of Blackrock Spire. It is there in the dark recesses of the mountain's peak that Nefarian has begun to unfold the final stages of his plan to destroy Ragnaros once and for all and lead his army to undisputed supremacy over all the races of Azeroth.",
		["Page2"] = "The mighty fortress carved within the fiery bowels of Blackrock Mountain was designed by the master dwarf-mason, Franclorn Forgewright. Intended to be the symbol of Dark Iron power, the fortress was held by the sinister dwarves for centuries. However, Nefarian - the cunning son of the dragon, Deathwing - had other plans for the great keep. He and his draconic minions took control of the upper Spire and made war on the dwarves' holdings in the mountain's volcanic depths, which serve as the seat of power for Ragnaros the Firelord. Ragnaros has uncovered the secret to creating life from stone and plans to build an army of unstoppable golems to aid him in conquering the whole of Blackrock Mountain.",
		["Page3"] = "Nefarian has vowed to crush Ragnaros. To this end, he has recently begun efforts to bolster his forces, much as his father Deathwing had attempted to do in ages past. However, where Deathwing failed, it now seems the scheming Nefarian may be succeeding. Nefarian's mad bid for dominance has even attracted the ire of the Red Dragon Flight, which has always been the Black Flight's greatest foe. Though Nefarian's intentions are known, the methods he is using to achieve them remain a mystery. It is believed, however that Nefarian has been experimenting with the blood of all of the various Dragon Flights to produce unstoppable warriors.\n \nNefarian's sanctum, Blackwing Lair, can be found at the very height of Blackrock Spire. It is there in the dark recesses of the mountain's peak that Nefarian has begun to unfold the final stages of his plan to destroy Ragnaros once and for all and lead his army to undisputed supremacy over all the races of Azeroth.";
		["MaxPages"] = "3",
	};
	Inst6Caption = "Логово Крыла Тьмы"
	Inst6Caption2 = "Логово Крыла Тьмы (История Часть 1)"
	Inst6Caption3 = "Логово Крыла Тьмы (История Часть 2)"
	
	Inst6QAA = "4 Задания"
	Inst6QAH = "4 Задания"
	
	--Quest 1 Alliance
	Inst6Quest1 = "1. Нефариус, пораженный порчей"
	Inst6Quest1_Level = "60"
	Inst6Quest1_Attain = "60"
	Inst6Quest1_Aim = "Убейте Нефариана и добудьте осколок красного скипетра. Верните осколок красного скипетра Анахроносу в Пещеры Времени в Танарис. На выполнение задания у Вас есть 5 часов."
	Inst6Quest1_Location = "Валестраз Порочный (Логово Крыла Тьмы; "..YELLOW.."[2]"..WHITE..")"
	Inst6Quest1_Note = "Только один игрок может получить осколок. Анахронос (Танарис - Пещеры Времени; "..YELLOW.."65,49"..WHITE..")"
	Inst6Quest1_Prequest = "Создание драконов"
	Inst6Quest1_Folgequest = "Армия Калимдора (Необходимо выполнить цепочки заданий Зеленого и Голубого скипетра)"
	--
	Inst6Quest1name1 = "Onyx Embedded Leggings"
	Inst6Quest1name2 = "Amulet of Shadow Shielding"
	
	--Quest 2 Alliance
	Inst6Quest2 = "2. Владыка Черной горы"
	Inst6Quest2_Level = "60"
	Inst6Quest2_Attain = "60"
	Inst6Quest2_Aim = "Отнесите голову Нефариана Верховному лорду Болвару Фордрагону в Штормград."
	Inst6Quest2_Location = "Голова Нефариана (падает с Нефариана; "..YELLOW.."[9]"..WHITE..")"
	Inst6Quest2_Note = "Верховный лорд Болвар Фордрагон находится (Штормград - Крепость Штормграда; "..YELLOW.."78,20"..WHITE.."). Далее Вас посылают к Фельдмаршалу Афрасиаби (Штормград - Аллея героев; "..YELLOW.."67,72"..WHITE..") для получения награды."
	Inst6Quest2_Prequest = "Нет"
	Inst6Quest2_Folgequest = "Владыка Черной горы"
	--
	Inst6Quest2name1 = "Master Dragonslayer's Medallion"
	Inst6Quest2name2 = "Master Dragonslayer's Orb"
	Inst6Quest2name3 = "Master Dragonslayer's Ring"
	
	--Quest 3 Alliance
	Inst6Quest3 = "3. Кто будет избран?"
	Inst6Quest3_Level = "60"
	Inst6Quest3_Attain = "60"
	Inst6Quest3_Aim = "Принесите голову предводителя драконов Разящего Бича Баристольфу из Зыбучих Песков в Крепость Кенария в Силитусе."
	Inst6Quest3_Location = "Голова предводителя драконидов Разящего Бича (падает с Предводителя драконов Разящего Бича; "..YELLOW.."[3]"..WHITE..")"
	Inst6Quest3_Note = "Только один игрок может получить голову."
	Inst6Quest3_Prequest = "Что ждет нас завтра"
	Inst6Quest3_Folgequest = "Путь праведника"
	-- No Rewards for this quest
	
	--Quest 4 Alliance
	Inst6Quest4 = "4. Единственный способ"
	Inst6Quest4_Level = "60"
	Inst6Quest4_Attain = "60"
	Inst6Quest4_Aim = "Найдите 8 утраченных глав из книги \"Драконий язык для чайников\" и соберите их при помощи магического книжного переплета. Принесите полную книгу \"Драконий язык для дураков: том II\" Нарайну Причуденю в Танарис."
	Inst6Quest4_Location = "Нарайн Причудень (Танарис; "..YELLOW.."65,18"..WHITE..")"
	Inst6Quest4_Note = "Главы могут быть получены несколькими игроками. \"Драконий язык для чайников\" (лежит на столе; "..GREEN.."[2']"..WHITE..")"
	Inst6Quest4_Prequest = "Утка!"
	Inst6Quest4_Folgequest = "Хорошая новость и плохая новость (Должны быть выполнены цепочки заданий \"Тушеный Лис, БЛД\" и \"Никогда не расспрашивай меня о моем бизнесе!\")"
	--
	Inst6Quest4name1 = "Gnomish Turban of Psychic Might"
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst6Quest1_HORDE = Inst6Quest1
	Inst6Quest1_HORDE_Level = Inst6Quest1_Level
	Inst6Quest1_HORDE_Attain = Inst6Quest1_Attain
	Inst6Quest1_HORDE_Aim = Inst6Quest1_Aim
	Inst6Quest1_HORDE_Location = Inst6Quest1_Location
	Inst6Quest1_HORDE_Note = Inst6Quest1_Note
	Inst6Quest1_HORDE_Prequest = Inst6Quest1_Prequest
	Inst6Quest1_HORDE_Folgequest = Inst6Quest1_Folgequest
	--
	Inst6Quest1name1_HORDE = Inst6Quest1name1
	Inst6Quest1name2_HORDE = Inst6Quest1name2
	
	--Quest 2 Horde
	Inst6Quest2_HORDE = "2. Владыка Черной горы"
	Inst6Quest2_HORDE_Level = "60"
	Inst6Quest2_HORDE_Attain = "60"
	Inst6Quest2_HORDE_Aim = "Отнесите голову Нефариана Траллу в Оргриммар."
	Inst6Quest2_HORDE_Location = "Голова Нефариана (падает с Нефариана; "..YELLOW.."[9]"..WHITE..")"
	Inst6Quest2_HORDE_Note = "Далее Вас посылают к Верховному правителю Саурфангу (Оргриммар - Аллея Силы; "..YELLOW.."51,76"..WHITE..") для получения награды."
	Inst6Quest2_HORDE_Prequest = "Нет"
	Inst6Quest2_HORDE_Folgequest = "Владыка Черной горы"
	--
	Inst6Quest2name1_HORDE = "Master Dragonslayer's Medallion"
	Inst6Quest2name2_HORDE = "Master Dragonslayer's Orb"
	Inst6Quest2name3_HORDE = "Master Dragonslayer's Ring"
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst6Quest3_HORDE = Inst6Quest3
	Inst6Quest3_HORDE_Level = Inst6Quest3_Level
	Inst6Quest3_HORDE_Attain = Inst6Quest3_Attain
	Inst6Quest3_HORDE_Aim = Inst6Quest3_Aim
	Inst6Quest3_HORDE_Location = Inst6Quest3_Location
	Inst6Quest3_HORDE_Note = Inst6Quest3_Note
	Inst6Quest3_HORDE_Prequest = Inst6Quest3_Prequest
	Inst6Quest3_HORDE_Folgequest = Inst6Quest3_Folgequest
	-- No Rewards for this quest
	
	--Quest 4 Horde (same as Quest 4 Alliance)
	Inst6Quest4_HORDE = Inst6Quest4
	Inst6Quest4_HORDE_Level = Inst6Quest4_Level
	Inst6Quest4_HORDE_Attain = Inst6Quest4_Attain
	Inst6Quest4_HORDE_Aim = Inst6Quest4_Aim
	Inst6Quest4_HORDE_Location = Inst6Quest4_Location
	Inst6Quest4_HORDE_Note = Inst6Quest4_Note
	Inst6Quest4_HORDE_Prequest = Inst6Quest4_Prequest
	Inst6Quest4_HORDE_Folgequest = Inst6Quest4_Folgequest
	--
	Inst6Quest4name1_HORDE = Inst6Quest4name1
	
	
	
	--------------- INST7 - Blackfathom Deeps (BFD) ---------------
	Inst7Story = "Расположенная вдоль побережья Зорам Ясеневого леса, Непроглядная пучина когда-то была знаменитым храмом посвященным богине Луны ночных эльфов, Элуне. Однако, великий Разлом разбил храм - опустив под волны Сокрытого моря. Он оставался нетронутым - пока, привлеченные древней силой - наги и сатиры не приплыли, чтобы раскрыт его секреты. Легенды утверждают что древнее чудовище, Аку'маи, поселилось в руинах храма. Аку'маи, любимый питомец изначальных Старых Богов, теперь охотится на его территории. Привлеченный Аку'маи, культ, известный как Молот Сумерек также пришел чтобы поживиться злым присутствием Старых Богов."
	Inst7Caption = "Непроглядная пучина"
	Inst7QAA = "6 Заданий"
	Inst7QAH = "5 Заданий"
	
	--Quest 1 Alliance
	Inst7Quest1 = "1. Знание в пучине"
	Inst7Quest1_Level = "23"
	Inst7Quest1_Attain = "18"
	Inst7Quest1_Aim = "Принесите манускрипт Лоргалиса Геррику Костохвату в Заброшенный грот в Стальгорне."
	Inst7Quest1_Location = "Геррик Костохват (Стальгорн - Заброшеный Грот; "..YELLOW.."50,5"..WHITE..")"
	Inst7Quest1_Note = "Вы найдете манускрипт около "..YELLOW.."[2]"..WHITE.." в воде."
	Inst7Quest1_Prequest = "Нет"
	Inst7Quest1_Folgequest = "Нет"
	--
	Inst7Quest1name1 = "Sustaining Ring"
	
	--Quest 2 Alliance
	Inst7Quest2 = "2. Исследование порчи"
	Inst7Quest2_Level = "24"
	Inst7Quest2_Attain = "19"
	Inst7Quest2_Aim = "Гершал Шепот Ночи в Аубердине хочет, чтобы вы принесли ему 8 оскверненных стволов мозга."
	Inst7Quest2_Location = "Гершал Шепот Ночи (Темные Берега - Аубердин; "..YELLOW.."38,43"..WHITE..")"
	Inst7Quest2_Note = "Предшествующее задание выполняется по желанию. Вы получите его от Аргоса Шепот Ночи (Штормград - Парк; "..YELLOW.."21,55"..WHITE.."). \n\nСо всех наг перед и внутри Непроглядной пучины можно получить сволы мозга."
	Inst7Quest2_Prequest = "Проблема за морем"
	Inst7Quest2_Folgequest = "Нет"
	--
	Inst7Quest2name1 = "Beetle Clasps"
	Inst7Quest2name2 = "Prelacy Cape"
	
	--Quest 3 Alliance
	Inst7Quest3 = "3. В поисках Талрида"
	Inst7Quest3_Level = "24"
	Inst7Quest3_Attain = "18"
	Inst7Quest3_Aim = "Найдите стража Талрида из ордена Серебряного Рассвета в Непроглядной Пучине."
	Inst7Quest3_Location = "Рассветный дозорный Шедласс (Дарнасс - Терраса ремесленников; "..YELLOW.."55,24"..WHITE..")"
	Inst7Quest3_Note = "Вы найдете стража Талрида из ордена Серебряного Рассвета около "..YELLOW.."[4]"..WHITE.."."
	Inst7Quest3_Prequest = "Нет"
	Inst7Quest3_Folgequest = "Злодейство в Непроглядной Пучине"
	-- No Rewards for this quest
	
	--Quest 4 Alliance
	Inst7Quest4 = "4. Злодейство в Непроглядной Пучине"
	Inst7Quest4_Level = "27"
	Inst7Quest4_Attain = "18"
	Inst7Quest4_Aim = "Принесите голову Повелителя сумрака Келриса Рассветному дозорному Селгорму в Дарнас."
	Inst7Quest4_Location = "Страж Талрид из ордена Серебряного Рассвета (Непроглядная пучина; "..YELLOW.."[4]"..WHITE..")"
	Inst7Quest4_Note = "Лорд Сумерек Келрис находится около "..YELLOW.."[8]"..WHITE..". Вы найдете Рассветного дозорного Селгорма в Дарнассе - Терраса Ремесленников ("..YELLOW.."55,24"..WHITE.."). \n\nВНИМАНИЕ! Если вы включите огни позади Лорда Келриса, появятся враги и атакуют Вас."
	Inst7Quest4_Prequest = "В поисках Талрида"
	Inst7Quest4_Folgequest = "Нет"
	--
	Inst7Quest4name1 = "Gravestone Scepter"
	Inst7Quest4name2 = "Arctic Buckler"
	
	--Quest 5 Alliance
	Inst7Quest5 = "5. Наступление сумерек"
	Inst7Quest5_Level = "25"
	Inst7Quest5_Attain = "20"
	Inst7Quest5_Aim = "Принесите 10 подвесок Сумерек стражу Менадосу из ордена Серебряного Рассвета в Дарнас."
	Inst7Quest5_Location = "Страж Менадос из ордена Серебряного рассвета (Дарнасс - Терраса ремесленников; "..YELLOW.."55,23"..WHITE..")"
	Inst7Quest5_Note = "Из любого сумеречного моба падают подвески."
	Inst7Quest5_Prequest = "Нет"
	Inst7Quest5_Folgequest = "Нет"
	--
	Inst7Quest5name1 = "Nimbus Boots"
	Inst7Quest5name2 = "Heartwood Girdle"
	
	--Quest 6 Alliance
	Inst7Quest6 = "6. Шар Соран'рука"
	Inst7Quest6_Level = "25"
	Inst7Quest6_Attain = "20"
	Inst7Quest6_Aim = "Соберите 3 фрагмента Соран'рука и 1 большой фрагмент Соран'рука и принесите их Доану Кархану в Степи."
	Inst7Quest6_Location = "Доан Кархан (Степи; "..YELLOW.."49,57"..WHITE..")"
	Inst7Quest6_Note = "Задание для чернокнижников: Вы возьмете 3 фрагмента Соран'рука с Сумеречных Прислужников в "..YELLOW.."[Непроглядная пучина]"..WHITE..". Вы возьмете большой фрагмент Соран'рука в "..YELLOW.."[Крепость Темного Клыка]"..WHITE.." у Темных Душ Темного Клыка."
	Inst7Quest6_Prequest = "Нет"
	Inst7Quest6_Folgequest = "Нет"
	--
	Inst7Quest6name1 = "Orb of Soran'ruk"
	Inst7Quest6name2 = "Staff of Soran'ruk"
	
	
	--Quest 1 Horde
	Inst7Quest1_HORDE = "1. Сущность Аку'май"
	Inst7Quest1_HORDE_Level = "22"
	Inst7Quest1_HORDE_Attain = "17"
	Inst7Quest1_HORDE_Aim = "Принесите 20 сапфиров Аку'май Дже'неу Санкри в Ясеневый лес."
	Inst7Quest1_HORDE_Location = "Дже'неу Санкри (Ясеневый лес - Застава Зорам'гар; "..YELLOW.."11,33"..WHITE..")"
	Inst7Quest1_HORDE_Note = "Вы получите предшествующее задание 'Угроза из Глубин' у Цунамана (Когтистые горы - Приют у Солнечного камня; "..YELLOW.."47,64"..WHITE.."). Сапфиры можно найти в пещерах перед подземельем."
	Inst7Quest1_HORDE_Prequest = "Угроза из Глубин"
	Inst7Quest1_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 2 Horde
	Inst7Quest2_HORDE = "2. Верность Древним богам"
	Inst7Quest2_HORDE_Level = "26"
	Inst7Quest2_HORDE_Attain = "17"
	Inst7Quest2_HORDE_Aim = "Принесите отсыревшую записку Дже'неу Санкри в Ясеневый лес. -> Убейте Лоргуса Джетта в Непроглядной Пучине и вернитесь к Дже'неу Санкри в Ясеневый лес."
	Inst7Quest2_HORDE_Location = "Отсыревшая записка (падает - см. заметки)"
	Inst7Quest2_HORDE_Note = "Вы получите Отсыревшую записку с Жриц прилива из Непроглядной Пучины (5% шанс выпадения). Потом принесите ее Дже'неу Санкри (Ясеневый лес - Застава Зорам'гар; "..YELLOW.."11,33"..WHITE.."). Лоргус Джетт находится около "..YELLOW.."[6]"..WHITE.."."
	Inst7Quest2_HORDE_Prequest = "Нет"
	Inst7Quest2_HORDE_Folgequest = "Нет"
	--
	Inst7Quest2name1_HORDE = "Band of the Fist"
	Inst7Quest2name2_HORDE = "Chestnut Mantle"
	
	--Quest 3 Horde
	Inst7Quest3_HORDE = "3. Среди руин"
	Inst7Quest3_HORDE_Level = "27"
	Inst7Quest3_HORDE_Attain = "21"
	Inst7Quest3_HORDE_Aim = "Принесите глубинный сердечник Дже'неу Санкри в форт Зорам'гар в Ясеневый лес."
	Inst7Quest3_HORDE_Location = "Дже'неу Санкри (Ясеневый лес - Застава Зорам'гар; "..YELLOW.."11,33"..WHITE..")"
	Inst7Quest3_HORDE_Note = "Вы найдете глубинный сердечник около "..YELLOW.."[7]"..WHITE.." под водой. Когда вы поднимите сердечник появится барон Акванис и атакует Вас. С него падает предмет, который вы должны принести Дже'неу Санкри."
	Inst7Quest3_HORDE_Prequest = "Нет"
	Inst7Quest3_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 4 Horde
	Inst7Quest4_HORDE = "4. Злодейство в Непроглядной Пучине"
	Inst7Quest4_HORDE_Level = "27"
	Inst7Quest4_HORDE_Attain = "18"
	Inst7Quest4_HORDE_Aim = "Принесите голову Повелителя сумрака Келриса Башане Руническому Тотему в Громовой Утес."
	Inst7Quest4_HORDE_Location = "Страж Талрид из ордена Серебряного Рассвета (Непроглядная пучина; "..YELLOW.."[4]"..WHITE..")"
	Inst7Quest4_HORDE_Note = "Лорд Сумерек Келрис находится около "..YELLOW.."[8]"..WHITE..". Вы найдете Башана Рунического Тотема в Громовом Утесе - Вершина Старейшин ("..YELLOW.."55,24"..WHITE.."). \n\nВНИМАНИЕ! Если вы включите огни позади Лорда Келриса, появятся враги и атакуют Вас."
	Inst7Quest4_HORDE_Prequest = "Нет"
	Inst7Quest4_HORDE_Folgequest = "Нет"
	--
	Inst7Quest4name1_HORDE = "Gravestone Scepter"
	Inst7Quest4name2_HORDE = "Arctic Buckler"
	
	--Quest 5 Horde (Warlock)
	Inst7Quest5_HORDE = "5. Шар Соран'рука"
	Inst7Quest5_HORDE_Level = Inst7Quest6_Level
	Inst7Quest5_HORDE_Attain = Inst7Quest6_Attain
	Inst7Quest5_HORDE_Aim = Inst7Quest6_Aim
	Inst7Quest5_HORDE_Location = Inst7Quest6_Location
	Inst7Quest5_HORDE_Note = Inst7Quest6_Note
	Inst7Quest5_HORDE_Prequest = Inst7Quest6_Prequest
	Inst7Quest5_HORDE_Folgequest = Inst7Quest6_Folgequest
	--
	Inst7Quest5name1_HORDE = Inst7Quest6name1
	Inst7Quest5name2_HORDE = Inst7Quest6name2
	
	
	
	--------------- INST8 - Lower Blackrock Spire (LBRS) ---------------
	Inst8Story = "Эта величественная крепость, возведенная в пылающих недрах Черной горы, была спроектирована талантливым дворфом-каменщиком Франклорном Искусником как символ могущества клана Черного Железа. Многие столетия злобные дворфы безраздельно правили в крепости, пока на нее не положил глаз Нефариан – коварный сын дракона-аспекта Смертокрыла. Вместе со своими прислужниками Нефариан захватил шпиль крепости и объявил войну дворфам, скрывающимся в вулканических глубинах. Пока дракон проводит свои зловещие эксперименты в своем логове, генералы его огромной армии, включая вождя черной Орды Ренда Чернорука, охраняют подступы к шпилю. Зловещие порождения Нефариана расползаются повсюду от пика Черной горы, и так будет продолжаться, пока крепость не падет."
	Inst8Caption = "Низина Черной горы"
	Inst8QAA = "14 Заданий"
	Inst8QAH = "14 Заданий"
	
	--Quest1 Alliance
	Inst8Quest1 = "1. Последние таблички"
	Inst8Quest1_Level = "58"
	Inst8Quest1_Attain = "56"
	Inst8Quest1_Aim = "Принесите пятую и шестую таблички Мошару геологу Железному Башмаку в Танарисе."
	Inst8Quest1_Location = "Геолог Железный Башмак (Танарис - Порт Картеля; "..YELLOW.."66,23"..WHITE..")"
	Inst8Quest1_Note = "Вы найдете таблички около "..YELLOW.."[4]"..WHITE.." и "..YELLOW.."[5]"..WHITE..".\nНаграда переводит на 'Сопротивление Йекинье'. вы найдете Йе'кинья около геолога Железного Башмака."
	Inst8Quest1_Prequest = "Утраченные таблички Мошару"
	Inst8Quest1_Folgequest = "Сопротивление Йекинье"
	-- No Rewards for this quest
	
	--Quest2 Alliance
	Inst8Quest2 = "2. Редкие звери Киблера"
	Inst8Quest2_Level = "59"
	Inst8Quest2_Attain = "55"
	Inst8Quest2_Aim = "Отправьтесь на пик Черной горы и отыщите там щенков воргов легиона Кровавого Топора. Посадите маленьких тварей в клетку и отнесите Киблеру."
	Inst8Quest2_Location = "Киблер (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,22"..WHITE..")"
	Inst8Quest2_Note = "Вы найдете щенков ворга около "..YELLOW.."[10]"..WHITE.."."
	Inst8Quest2_Prequest = "Нет"
	Inst8Quest2_Folgequest = "Нет"
	--
	Inst8Quest2name1 = "Worg Carrier"
	
	--Quest3 Alliance
	Inst8Quest3 = "3. Товар на любителя"
	Inst8Quest3_Level = "59"
	Inst8Quest3_Attain = "55"
	Inst8Quest3_Aim = "Отправьтесь на пик Черной горы и принесите Киблеру 15 яиц скального паука.\nСудя по всему, яйца надо искать недалеко от пауков."
	Inst8Quest3_Location = "Киблер (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,22"..WHITE..")"
	Inst8Quest3_Note = "Вы найдете яйца пауков около "..YELLOW.."[6]"..WHITE.."."
	Inst8Quest3_Prequest = "Нет"
	Inst8Quest3_Folgequest = "Нет"
	--
	Inst8Quest3name1 = "Smolderweb Carrier"
	
	--Quest4 Alliance
	Inst8Quest4 = "4. Материнское молоко"
	Inst8Quest4_Level = "60"
	Inst8Quest4_Attain = "?"
	Inst8Quest4_Aim = "Найдите в самом сердце пика Черной горы мать Дымную Паутину. Сражайтесь с ней, пока она не введет вам свой яд. Скорее всего ее также придется убить. Когда яд будет в вас, вернитесь к Джону-Оборванцу, чтобы он смог добыть яд."
	Inst8Quest4_Location = "Джон-Оборванец (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,23"..WHITE..")"
	Inst8Quest4_Note = "Мать Дымная Паутина находится около "..YELLOW.."[6]"..WHITE..". Яд также поражает ближаиших игроков. Если яд вылечить, вы провалите задание."
	Inst8Quest4_Prequest = "Нет"
	Inst8Quest4_Folgequest = "Нет"
	--
	Inst8Quest4name1 = "Ragged John's Neverending Cup"
	
	--Quest5 Alliance
	Inst8Quest5 = "5. Устранение опасности"
	Inst8Quest5_Level = "59"
	Inst8Quest5_Attain = "?"
	Inst8Quest5_Aim = "Отправьтесь на пик Черной горы и уничтожьте источник опасности. Хелендис кричит вам вслед одно имя: Халикон. Именно его упоминали орки в связи с воргами."
	Inst8Quest5_Location = "Хелендис Речной Мыс (Пылающие степи - Дозор Моргана; "..YELLOW.."5,47"..WHITE..")"
	Inst8Quest5_Note = "Вы найдете Халикон около "..YELLOW.."[10]"..WHITE.."."
	Inst8Quest5_Prequest = "Нет"
	Inst8Quest5_Folgequest = "Нет"
	--
	Inst8Quest5name1 = "Astoria Robes"
	Inst8Quest5name2 = "Traphook Jerkin"
	Inst8Quest5name3 = "Jadescale Breastplate"
	
	--Quest6 Alliance
	Inst8Quest6 = "6. Аррок Смертный Вопль"
	Inst8Quest6_Level = "59"
	Inst8Quest6_Attain = "?"
	Inst8Quest6_Aim = "Прочитайте записку Вароша. Принесите Варошу его амулет."
	Inst8Quest6_Location = "Варош (Вершина Черной горы; "..YELLOW.."[2]"..WHITE..")"
	Inst8Quest6_Note = "Чтобы получить амулет Вароша нужно вызвать и убить Аррока Смертного Вопля "..YELLOW.."[8]"..WHITE..". Для Вызова понадобится Копье и голова вождя Омокка "..YELLOW.."[3]"..WHITE..". Копье находится около "..YELLOW.."[2]"..WHITE..". Во время Вызова появляется несколько волн огров, перед тем как Вас атакует Аррок Смертный Вопль. Вы можете использовать Копье в бою, чтобы наносить урон ограм."
	Inst8Quest6_Prequest = "Нет"
	Inst8Quest6_Folgequest = "Нет"
	--
	Inst8Quest6name1 = "Prismcharm"
	
	--Quest7 Alliance
	Inst8Quest7 = "7. Вещи Блестяшки"
	Inst8Quest7_Level = "59"
	Inst8Quest7_Attain = "55"
	Inst8Quest7_Aim = "Найдите вещи Блестяшки и верните их владелице. Удачи!"
	Inst8Quest7_Location = "Блестяшка (Вершина Черной горы; "..YELLOW.."[1] "..WHITE.."и"..YELLOW.." [2]"..WHITE..")"
	Inst8Quest7_Note = "Вы найдете вещи Блестяшки по пути к Матери Дымной Паутине около "..YELLOW.."[10]"..WHITE..".\nМаксвелл находится около (Пылающие степи - Дозор Моргана; "..YELLOW.."84,58"..WHITE..")."
	Inst8Quest7_Prequest = "Нет"
	Inst8Quest7_Folgequest = "Донесение Максвелла"
	-- No Rewards for this quest
	
	--Quest8 Alliance
	Inst8Quest8 = "8. Миссия Максвелла"
	Inst8Quest8_Level = "59"
	Inst8Quest8_Attain = "?"
	Inst8Quest8_Aim = "Отправляйтесь на пик Черной горы и устраните воеводу Вуна, вождя Омокка и повелителя Змейталака. По выполнении задания вернитесь к маршалу Максвеллу."
	Inst8Quest8_Location = "Маршал Максвелл (Пылающие степи - Дозор Моргана; "..YELLOW.."84,58"..WHITE..")"
	Inst8Quest8_Note = "Вы найдете воеводу Вуна около "..YELLOW.."[5]"..WHITE..", вождя Омокка около "..YELLOW.."[3]"..WHITE.." и повелителя Змейталака около "..YELLOW.."[11]"..WHITE.."."
	Inst8Quest8_Prequest = "Донесение Максвелла"
	Inst8Quest8_Folgequest = "Нет"
	--
	Inst8Quest8name1 = "Wyrmthalak's Shackles"
	Inst8Quest8name2 = "Omokk's Girth Restrainer"
	Inst8Quest8name3 = "Halycon's Muzzle"
	Inst8Quest8name4 = "Vosh'gajin's Strand"
	Inst8Quest8name5 = "Voone's Vice Grips"
	
	--Quest9 Alliance
	Inst8Quest9 = "9. Печать Вознесения"
	Inst8Quest9_Level = "60"
	Inst8Quest9_Attain = "57"
	Inst8Quest9_Aim = "Найдите самоцвет Тлеющего Терновника, самоцвет Черной Вершины и самоцвет Кровавого Топора. Верните их Ваелану вместе с простой печатью Вознесения./nКамни могут быть у трех генералов: у воеводы Вуна из клана Тлеющего Терновника, у вождя Омокка из клана Черной Вершины и у повелителя Змейталака из клана Кровавого Топора."
	Inst8Quest9_Location = "Ваелан (Вершина Черной горы; "..YELLOW.."[1]"..WHITE..")"
	Inst8Quest9_Note = "Вы получите самоцвет Черной вершины с вождя Омокка "..YELLOW.."[3]"..WHITE..", самоцвет Тлеющего Терновника с воеводы Вуна около "..YELLOW.."[5]"..WHITE.." самоцвет Кровавого Топора с повелителя Змейталака около "..YELLOW.."[11]"..WHITE..". Простая печать Вознесения может упасть с любого врага в Низине Черной горы. Если вы закончите эту цепочку заданий, то получите ключ к Вершине Черной горы."
	Inst8Quest9_Prequest = "Нет"
	Inst8Quest9_Folgequest = "Печать Вознесения"
	-- No Rewards for this quest
	
	--Quest10 Alliance
	Inst8Quest10 = "10. Приказ генерала Драккисата"
	Inst8Quest10_Level = "60"
	Inst8Quest10_Attain = "55"
	Inst8Quest10_Aim = "Отнесите приказ генерала Драккисата маршалу Максвеллу в Пылающие степи."
	Inst8Quest10_Location = "Приказ генерала Драккисата (падает с повелителя Змейталака; "..YELLOW.."[11]"..WHITE..")"
	Inst8Quest10_Note = "Маршал Максвелл находится в Пылающие степи - Дозор Моргана; ("..YELLOW.."84,58"..WHITE..")."
	Inst8Quest10_Prequest = "Нет"
	Inst8Quest10_Folgequest = "Кончина генерала Драккисата ("..YELLOW.."Вершина Черной горы"..WHITE..")"
	-- No Rewards for this quest
	
	--Quest 11 Alliance
	Inst8Quest11 = "11. Левая часть амулета Лорда Вальтхалака"
	Inst8Quest11_Level = "60"
	Inst8Quest11_Attain = "60"
	Inst8Quest11_Aim = "Вызвать дух Мора Серого Копыта с помощью жаровни Призыва, прикончить его и забрать недостающую часть амулета Лорда Вальтхалака. Вернуться к Бодли в Черную гору, отдать ему левую часть амулета Вальтхалака и жаровню Призыва."
	Inst8Quest11_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
	Inst8Quest11_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его за задание 'В поисках Антиона'.\n\nМор Серое Копыто призывается около "..YELLOW.."[9]"..WHITE.."."
	Inst8Quest11_Prequest = "Важная составляющая заклинания"
	Inst8Quest11_Folgequest = "Я вижу в твоем будущем остров Алькац..."
	-- No Rewards for this quest
	
	--Quest 12 Alliance
	Inst8Quest12 = "12. Правая часть амулета Лорда Вальтхалака"
	Inst8Quest12_Level = "60"
	Inst8Quest12_Attain = "60"
	Inst8Quest12_Aim = "Вызвать дух Мора Серого Копыта с помощью жаровни Призыва, прикончить его и забрать недостающую часть амулета Лорда Вальтхалака. Вернуться к Бодли в Черную гору, отдать ему восстановленный амулет и жаровню Призыва."
	Inst8Quest12_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
	Inst8Quest12_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его за задание 'В поисках Антиона'.\n\nМор Серое Копыто призывается около "..YELLOW.."[9]"..WHITE.."."
	Inst8Quest12_Prequest = "Еще одна важная составляющая заклинания"
	Inst8Quest12_Folgequest = "Последние приготовления ("..YELLOW.."Вершина Черной горы"..WHITE..")"
	-- No Rewards for this quest
	
	--Quest 13 Alliance
	Inst8Quest13 = "13. Змеекамень Пленяющей Духов"
	Inst8Quest13_Level = "60"
	Inst8Quest13_Attain = "51"
	Inst8Quest13_Aim = "Отправляйтесь на Пик Черной горы, убейте Темную охотницу Вос'гаджин. Заберите у нее змеекамень и принесите Килраму."
	Inst8Quest13_Location = "Килрам (Зимние Ключи - Круговзор; "..YELLOW.."61,37"..WHITE..")"
	Inst8Quest13_Note = "Задание для кузнецов. Темная охотница Вос'гаджин около "..YELLOW.."[7]"..WHITE.."."
	Inst8Quest13_Prequest = "Нет"
	Inst8Quest13_Folgequest = "Нет"
	--
	Inst8Quest13name1 = "Plans: Dawn's Edge"
	
	--Quest 14 Alliance
	Inst8Quest14 = "14. Смерть в огне"
	Inst8Quest14_Level = "60"
	Inst8Quest14_Attain = "58"
	Inst8Quest14_Aim = "Наверняка в этом мире есть кто-то, кто знает, что делать с этими рукавицами."
	Inst8Quest14_Location = "Человеческие останки (Низина Черной горы; "..YELLOW.."[9]"..WHITE..")"
	Inst8Quest14_Note = "Задание для кузнецов. Обязательно возьмите Неопалимые латные рукавицы вблизи с Человеческими останками около "..YELLOW.."[11]"..WHITE..". Отнесите их Малифою Черномолоту (Зимние Ключи - Круговзор; "..YELLOW.."61,39"..WHITE.."). Награды перечислены для следующего задания."
	Inst8Quest14_Prequest = "Нет"
	Inst8Quest14_Folgequest = "Огненные латные рукавицы"
	--
	Inst8Quest14name1 = "Plans: Fiery Plate Gauntlets"
	Inst8Quest14name2 = "Fiery Plate Gauntlets"
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst8Quest1_HORDE = Inst8Quest1
	Inst8Quest1_HORDE_Level = Inst8Quest1_Level
	Inst8Quest1_HORDE_Attain = Inst8Quest1_Attain
	Inst8Quest1_HORDE_Aim = Inst8Quest1_Aim
	Inst8Quest1_HORDE_Location = Inst8Quest1_Location
	Inst8Quest1_HORDE_Note = Inst8Quest1_Note
	Inst8Quest1_HORDE_Prequest = Inst8Quest1_Prequest
	Inst8Quest1_HORDE_Folgequest = Inst8Quest1_Folgequest
	--
	Inst8Quest1name1_HORDE = Inst8Quest1name1
	Inst8Quest1name2_HORDE = Inst8Quest1name2
	
	--Quest 2 Horde  (same as Quest 2 Alliance)
	Inst8Quest2_HORDE = Inst8Quest2
	Inst8Quest2_HORDE_Level = Inst8Quest2_Level
	Inst8Quest2_HORDE_Attain = Inst8Quest2_Attain
	Inst8Quest2_HORDE_Aim = Inst8Quest2_Aim
	Inst8Quest2_HORDE_Location = Inst8Quest2_Location
	Inst8Quest2_HORDE_Note = Inst8Quest2_Note
	Inst8Quest2_HORDE_Prequest = Inst8Quest2_Prequest
	Inst8Quest2_HORDE_Folgequest = Inst8Quest2_Folgequest
	--
	Inst8Quest2name1_HORDE = Inst8Quest2name1
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst8Quest3_HORDE = Inst8Quest3
	Inst8Quest3_HORDE_Level = Inst8Quest3_Level
	Inst8Quest3_HORDE_Attain = Inst8Quest3_Attain
	Inst8Quest3_HORDE_Aim = Inst8Quest3_Aim
	Inst8Quest3_HORDE_Location = Inst8Quest3_Location
	Inst8Quest3_HORDE_Note = Inst8Quest3_Note
	Inst8Quest3_HORDE_Prequest = Inst8Quest3_Prequest
	Inst8Quest3_HORDE_Folgequest = Inst8Quest3_Folgequest
	--
	Inst8Quest3name1_HORDE = Inst8Quest3name1
	
	--Quest 4 Horde  (same as Quest 4 Alliance)
	Inst8Quest4_HORDE = Inst8Quest4
	Inst8Quest4_HORDE_Level = Inst8Quest4_Level
	Inst8Quest4_HORDE_Attain = Inst8Quest4_Attain
	Inst8Quest4_HORDE_Aim = Inst8Quest4_Aim
	Inst8Quest4_HORDE_Location = Inst8Quest4_Location
	Inst8Quest4_HORDE_Note = Inst8Quest4_Note
	Inst8Quest4_HORDE_Prequest = Inst8Quest4_Prequest
	Inst8Quest4_HORDE_Folgequest = Inst8Quest4_Folgequest
	--
	Inst8Quest4name1_HORDE = Inst8Quest4name1
	
	--Quest5 Horde
	Inst8Quest5_HORDE = "5. Праматерь стаи"
	Inst8Quest5_HORDE_Level = "59"
	Inst8Quest5_HORDE_Attain = "?"
	Inst8Quest5_HORDE_Aim = "Убейте Халикон, праматерь стаи воргов Кровавого Топора."
	Inst8Quest5_HORDE_Location = "Галамав Стрелок (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE..")"
	Inst8Quest5_HORDE_Note = "Вы найдете Халикон около "..YELLOW.."[10]"..WHITE.."."
	Inst8Quest5_HORDE_Prequest = "Нет"
	Inst8Quest5_HORDE_Folgequest = "Нет"
	--
	Inst8Quest5name1_HORDE = "Astoria Robes"
	Inst8Quest5name2_HORDE = "Traphook Jerkin"
	Inst8Quest5name3_HORDE = "Jadescale Breastplate"
	
	--Quest 6 Horde  (same as Quest 6 Alliance)
	Inst8Quest6_HORDE = Inst8Quest6
	Inst8Quest6_HORDE_Level = Inst8Quest6_Level
	Inst8Quest6_HORDE_Attain = Inst8Quest6_Attain
	Inst8Quest6_HORDE_Aim = Inst8Quest6_Aim
	Inst8Quest6_HORDE_Location = Inst8Quest6_Location
	Inst8Quest6_HORDE_Note = Inst8Quest6_Note
	Inst8Quest6_HORDE_Prequest = Inst8Quest6_Prequest
	Inst8Quest6_HORDE_Folgequest = Inst8Quest6_Folgequest
	--
	Inst8Quest6name1_HORDE = Inst8Quest6name1
	
	--Quest 7 Horde
	Inst8Quest7_HORDE = "7. Агент Блестяшка"
	Inst8Quest7_HORDE_Level = "59"
	Inst8Quest7_HORDE_Attain = "?"
	Inst8Quest7_HORDE_Aim = "Отправьтесь к пику Черной горы и выясните, что сталось с Блестяшкой."
	Inst8Quest7_HORDE_Location = "Лекслорт (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE..")"
	Inst8Quest7_HORDE_Note = "Вы найдете Блестяшку около "..YELLOW.."[1] "..WHITE.."и "..YELLOW.."[2]"..WHITE.."."
	Inst8Quest7_HORDE_Prequest = "Нет"
	Inst8Quest7_HORDE_Folgequest = "Вещи Блестяшки"
	-- No Rewards for this quest
	
	--Quest 8 Horde
	Inst8Quest8_HORDE = "8. Вещи Блестяшки"
	Inst8Quest8_HORDE_Level = "59"
	Inst8Quest8_HORDE_Attain = "?"
	Inst8Quest8_HORDE_Aim = "Найдите вещи Блестяшки и верните их владелице. Блестяшка сказала, что она спрятала свое оборудование где-то на нижнем ярусе подземелья."
	Inst8Quest8_HORDE_Location = "Блестяшка (Вершина Черной горы; "..YELLOW.."[3]"..WHITE..")"
	Inst8Quest8_HORDE_Note = "Вы найдете вещи Блестяшки по пути к Матери Дымной Паутине около "..YELLOW.."[6]"..WHITE..".\nНаграда отправляет к 'По данным разведки'."
	Inst8Quest8_HORDE_Prequest = "Агент Блестяшка"
	Inst8Quest8_HORDE_Folgequest = "По данным разведки"
	--
	Inst8Quest8name1_HORDE = "Freewind Gloves"
	Inst8Quest8name2_HORDE = "Seapost Girdle"
	
	--Quest 9 Horde  (same as Quest 9 Alliance)
	Inst8Quest9_HORDE = Inst8Quest9
	Inst8Quest9_HORDE_Level = Inst8Quest9_Level
	Inst8Quest9_HORDE_Attain = Inst8Quest9_Attain
	Inst8Quest9_HORDE_Aim = Inst8Quest9_Aim
	Inst8Quest9_HORDE_Location = Inst8Quest9_Location
	Inst8Quest9_HORDE_Note = Inst8Quest9_Note
	Inst8Quest9_HORDE_Prequest = Inst8Quest9_Prequest
	Inst8Quest9_HORDE_Folgequest = Inst8Quest9_Folgequest
	-- No Rewards for this quest
	
	--Quest10 Horde
	Inst8Quest10_HORDE = "10. Приказ полководца"
	Inst8Quest10_HORDE_Level = "60"
	Inst8Quest10_HORDE_Attain = "55"
	Inst8Quest10_HORDE_Aim = "Убейте вождя Омокка, воеводу Вуна и повелителя Змейталака. Найденные при них важные бумаги Черной горы доставьте полководцу Клинозубу в Каргат."
	Inst8Quest10_HORDE_Location = "Полководец Клинозуб (Бесплодные земли - Каргат; "..YELLOW.."65,22"..WHITE..")"
	Inst8Quest10_HORDE_Note = "Подготовка к Ониксии.\nВождь Омокк находится около "..YELLOW.."[3]"..WHITE..", воевода Вун находится около "..YELLOW.."[5]"..WHITE.." и повелитель Змейталака "..YELLOW.."[11]"..WHITE..". Важные бумаги Черной горы могут остаться после одного из этих 3 боссов."
	Inst8Quest10_HORDE_Prequest = "Нет"
	Inst8Quest10_HORDE_Folgequest = "Мудрость Эйтригга -> За Орду! ("..YELLOW.."Вершина Черной горы"..WHITE..")"
	--
	Inst8Quest10name1_HORDE = "Wyrmthalak's Shackles"
	Inst8Quest10name2_HORDE = "Omokk's Girth Restrainer"
	Inst8Quest10name3_HORDE = "Halycon's Muzzle"
	Inst8Quest10name4_HORDE = "Vosh'gajin's Strand"
	Inst8Quest10name5_HORDE = "Voone's Vice Grips"
	
	--Quest 11 Horde  (same as Quest 11 Alliance)
	Inst8Quest11_HORDE = Inst8Quest11
	Inst8Quest11_HORDE_Level = Inst8Quest11_Level
	Inst8Quest11_HORDE_Attain = Inst8Quest11_Attain
	Inst8Quest11_HORDE_Aim = Inst8Quest11_Aim
	Inst8Quest11_HORDE_Location = Inst8Quest11_Location
	Inst8Quest11_HORDE_Note = Inst8Quest11_Note
	Inst8Quest11_HORDE_Prequest = Inst8Quest11_Prequest
	Inst8Quest11_HORDE_Folgequest = Inst8Quest11_Folgequest
	-- No Rewards for this quest
	
	--Quest 12 Horde  (same as Quest 12 Alliance)
	Inst8Quest12_HORDE = Inst8Quest12
	Inst8Quest12_HORDE_Level = Inst8Quest12_Level
	Inst8Quest12_HORDE_Attain = Inst8Quest12_Attain
	Inst8Quest12_HORDE_Aim = Inst8Quest12_Aim
	Inst8Quest12_HORDE_Location = Inst8Quest12_Location
	Inst8Quest12_HORDE_Note = Inst8Quest12_Note
	Inst8Quest12_HORDE_Prequest = Inst8Quest12_Prequest
	Inst8Quest12_HORDE_Folgequest = Inst8Quest12_Folgequest
	-- No Rewards for this quest
	
	--Quest 13 Horde  (same as Quest 13 Alliance)
	Inst8Quest13_HORDE = Inst8Quest13
	Inst8Quest13_HORDE_Level = Inst8Quest13_Level
	Inst8Quest13_HORDE_Attain = Inst8Quest13_Attain
	Inst8Quest13_HORDE_Aim = Inst8Quest13_Aim
	Inst8Quest13_HORDE_Location = Inst8Quest13_Location
	Inst8Quest13_HORDE_Note = Inst8Quest13_Note
	Inst8Quest13_HORDE_Prequest = Inst8Quest13_Prequest
	Inst8Quest13_HORDE_Folgequest = Inst8Quest13_Folgequest
	--
	Inst8Quest13name1_HORDE = Inst8Quest13name1
	
	--Quest 14 Horde  (same as Quest 14 Alliance)
	Inst8Quest14_HORDE = Inst8Quest14
	Inst8Quest14_HORDE_Level = Inst8Quest14_Level
	Inst8Quest14_HORDE_Attain = Inst8Quest14_Attain
	Inst8Quest14_HORDE_Aim = Inst8Quest14_Aim
	Inst8Quest14_HORDE_Location = Inst8Quest14_Location
	Inst8Quest14_HORDE_Note = Inst8Quest14_Note
	Inst8Quest14_HORDE_Prequest = Inst8Quest14_Prequest
	Inst8Quest14_HORDE_Folgequest = Inst8Quest14_Folgequest
	--
	Inst8Quest14name1_HORDE = Inst8Quest14name1
	Inst8Quest14name2_HORDE = Inst8Quest14name2
	
	
	
	--------------- INST9 - Вершина Черной горы (UBRS) ---------------
	Inst9Story = "Эта величественная крепость, возведенная в пылающих недрах Черной горы, была спроектирована талантливым дворфом-каменщиком Франклорном Искусником как символ могущества клана Черного Железа. Многие столетия злобные дворфы безраздельно правили в крепости, пока на нее не положил глаз Нефариан – коварный сын дракона-аспекта Смертокрыла. Вместе со своими прислужниками Нефариан захватил шпиль крепости и объявил войну дворфам, скрывающимся в вулканических глубинах. Пока дракон проводит свои зловещие эксперименты в своем логове, генералы его огромной армии, включая вождя черной Орды Ренда Чернорука, охраняют подступы к шпилю. Зловещие порождения Нефариана расползаются повсюду от пика Черной горы, и так будет продолжаться, пока крепость не падет."
	Inst9Caption = "Вершина Черной горы"
	Inst9QAA = "11 Заданий"
	Inst9QAH = "12 Заданий"
	
	--Quest1 Alliance
	Inst9Quest1 = "1. Матрона-защитница"
	Inst9Quest1_Level = "60"
	Inst9Quest1_Attain = "57"
	Inst9Quest1_Aim = "Дойдите до Зимних Ключей и найдите Халех. Отдайте ей пластину чешуи Ауби."
	Inst9Quest1_Location = "Ауби (Вершина Черной горы; "..YELLOW.."[6]"..WHITE..")"
	Inst9Quest1_Note = "Вы найдете Ауби в комнате за Ареной около "..YELLOW.."[6]"..WHITE..".\nХалех находится в Зимних Ключах ("..YELLOW.."54,51"..WHITE.."). Используйте знак-портал в конце пещеры, чтобы добраться до нее."
	Inst9Quest1_Prequest = "Нет"
	Inst9Quest1_Folgequest = "Гнев синих драконов"
	-- No Rewards for this quest
	
	--Quest2 Alliance
	Inst9Quest2 = "2. Айс Вентурон, к вашим услугам!"
	Inst9Quest2_Level = "60"
	Inst9Quest2_Attain = "?"
	Inst9Quest2_Aim = "Переговорите с Малифоем Черномолотом в Круговзоре."
	Inst9Quest2_Location = "Айс Вентурон (Вершина Черной горы; "..YELLOW.."[7]"..WHITE..")"
	Inst9Quest2_Note = "Айс Вентурон появляется после свежевания Зверя. Вы найдете Малифоя в (Зимние Ключи - Круговзор; "..YELLOW.."61,38"..WHITE..")."
	Inst9Quest2_Prequest = "Нет"
	Inst9Quest2_Folgequest = "Поножи Тайны, Шапка Алого Ученого, Кираса кровавой жажды"
	-- No Rewards for this quest
	
	--Quest3 Alliance
	Inst9Quest3 = "3. Заморозка яйца"
	Inst9Quest3_Level = "60"
	Inst9Quest3_Attain = "?"
	Inst9Quest3_Aim = "Испытайте прототип яйцехладоскопа на одном из яиц в Гнездовье."
	Inst9Quest3_Location = "Тинки Кипеллер (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,24"..WHITE..")"
	Inst9Quest3_Note = "Вы найдете яйца в комнате Отца Пламени около "..YELLOW.."[2]"..WHITE.."."
	Inst9Quest3_Prequest = "Сущность детеныша дракона -> Тинки Кипеллер"
	Inst9Quest3_Folgequest = "Леонид Барталомей -> Рассветный гамбит ("..YELLOW.."Некроситет"..WHITE..")"
	-- No Rewards for this quest
	
	--Quest4 Alliance
	Inst9Quest4 = "4. Око Углевзора"
	Inst9Quest4_Level = "60"
	Inst9Quest4_Attain = "60"
	Inst9Quest4_Aim = "Принесите око Углевзора герцогу Гидраксису в Азшару."
	Inst9Quest4_Location = "Герцог Гидраксис (Азшара; "..YELLOW.."79,73"..WHITE..")"
	Inst9Quest4_Note = "Вы найдете Пиростража Углевзора около "..YELLOW.."[1]"..WHITE.."."
	Inst9Quest4_Prequest = "Отравленная вода, Буря в пустыне"
	Inst9Quest4_Folgequest = "Огненные Недра"
	-- No Rewards for this quest
	
	--Quest5 Alliance
	Inst9Quest5 = "5. Кончина генерала Драккисата"
	Inst9Quest5_Level = "60"
	Inst9Quest5_Attain = "55"
	Inst9Quest5_Aim = "Отправьтесь на пик Черной горы и устраните генерала Драккисата. По выполнении задания вернитесь к маршалу Максвеллу."
	Inst9Quest5_Location = "Маршал Максвелл (Пылающие степи - Дозор Моргана; "..YELLOW.."82,68"..WHITE..")"
	Inst9Quest5_Note = "Вы найдете генерала Драккисата около "..YELLOW.."[8]"..WHITE.."."
	Inst9Quest5_Prequest = "Приказ генерала Драккисата ("..YELLOW.."Низина Черной горы"..WHITE..")"
	Inst9Quest5_Folgequest = "Нет"
	--
	Inst9Quest5name1 = "Mark of Tyranny"
	Inst9Quest5name2 = "Eye of the Beast"
	Inst9Quest5name3 = "Blackhand's Breadth"
	
	--Quest6 Alliance
	Inst9Quest6 = "6. Пряжка Роковой оснастки"
	Inst9Quest6_Level = "60"
	Inst9Quest6_Attain = "57"
	Inst9Quest6_Aim = "Принесите пряжку Роковой оснастки Майре Светлое Крыло в Пылающие степи."
	Inst9Quest6_Location = "Майра Светлое Крыло (Пылающие степи - Дозор Моргана; "..YELLOW.."84,69"..WHITE..")"
	Inst9Quest6_Note = "Вы возьмете предшествующее задание у графа Ремингтона Риджвелла (Штормград - Крепость Штормграда; "..YELLOW.."76.9, 47.4"..WHITE..").\n\nПряжка Роковой оснастки находится около "..YELLOW.."[2]"..WHITE.." с сундуке."
	Inst9Quest6_Prequest = "Майра Светлое Крыло"
	Inst9Quest6_Folgequest = "Доставить Риджвеллу"
	--
	Inst9Quest6name1 = "Swiftfoot Treads"
	Inst9Quest6name2 = "Blinkstrike Armguards"
	
	--Quest7 Alliance
	Inst9Quest7 = "7. Амулет Пламени дракона"
	Inst9Quest7_Attain = "53"
	Inst9Quest7_Level = "60"
	Inst9Quest7_Aim = "Добудьте кровь могучего черного дракона генерала Драккисата, которого можно найти сидящим на троне в залах Вознесения в Пике Черной горы."
	Inst9Quest7_Location = "Хале (Зимние Ключи; "..YELLOW.."54,51"..WHITE..")"
	Inst9Quest7_Note = "Последний из цепочки заданий на доступ к Логову Ониксии для Альянса\nГенерал Драккисат "..YELLOW.."[8]"..WHITE.."."
	Inst9Quest7_Prequest = "Око дракона"
	Inst9Quest7_Folgequest = "Нет"
	--
	Inst9Quest7name1 = "Drakefire Amulet"
	
	--Quest8 Alliance
	Inst9Quest8 = "8. Приказ Чернорука"
	Inst9Quest8_Level = "60"
	Inst9Quest8_Attain = "60"
	Inst9Quest8_Aim = "Вот уж действительно идиот... Похоже, вам нужно найти это клеймо и выжечь на руке метку Драккисата, чтобы получить доступ к сфере Приказа. В письме ясно сказано, что генерал Драккисат охраняет клеймо. Наверное, стоит проверить."
	Inst9Quest8_Location = "Приказ Чернорука (падает с Интенданта из легиона Изрубленного Щита)"
	Inst9Quest8_Note = "Задание для подготовки к Логову Крыла Тьмы. Интенданта из легиона Изрубленного Щита можно найти если повернуть направо перед порталом в LBRS/UBRS.\n\nГенерал Драккисат находится около "..YELLOW.."[8]"..WHITE..". Печать за ним."
	Inst9Quest8_Prequest = "Нет"
	Inst9Quest8_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 9 Alliance
	Inst9Quest9 = "9. Последние приготовления"
	Inst9Quest9_Level = "60"
	Inst9Quest9_Attain = "60"
	Inst9Quest9_Aim = "Соберите 40 наручей Черной горы и разыщите склянку великой силы. Отнесите все это Бодли в Черную Скалу."
	Inst9Quest9_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
	Inst9Quest9_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его за задание 'В поисках Антиона'. Боевые наручи Черной горы падает с противников, у которых написано Чернорук в имени. Настой великой силы создается алхимиками."
	Inst9Quest9_Prequest = "Правая часть амулета Лорда Вальтхалака ("..YELLOW.."Вершина Черной горы"..WHITE..")"
	Inst9Quest9_Folgequest = "Mea Culpa, Лорд Вальтхалак"
	-- No Rewards for this quest
	
	--Quest 10 Alliance
	Inst9Quest10 = "10. Mea Culpa, Лорд Вальтхалак"
	Inst9Quest10_Level = "60"
	Inst9Quest10_Attain = "60"
	Inst9Quest10_Aim = "Вызвать Лорда Вальтхалака с помощью жаровни Призыва. Убить его и использовать амулет. Потом вернуть амулет духу Вальтхалака."
	Inst9Quest10_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
	Inst9Quest10_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его за задание 'В поисках Антиона'. Лорд Вальтхалак вызывается в "..YELLOW.."[8]"..WHITE..". Награды перечислены для 'Возвращение к Бодли'."
	Inst9Quest10_Prequest = "Последние приготовления"
	Inst9Quest10_Folgequest = "Возвращение к Бодли"
	--
	Inst9Quest10name1 = "Brazier of Invocation"
	Inst9Quest10name2 = "Brazier of Invocation: User's Manual"
	
	--Quest 11 Alliance
	Inst9Quest11 = "11. Демонова кузня"
	Inst9Quest11_Level = "60"
	Inst9Quest11_Attain = "58"
	Inst9Quest11_Aim = "Отправляйтесь на пик Черной горы и найдите Горалука Треснувшую Наковальню. Убейте его, а потом воткните в труп окровавленную пику. Таким образом пика вытянет его душу и окрасится ей. Кроме того, вам нужно найти заготовку рунической кирасы. Отнесите пику и кирасу Лораксу в Зимних Ключах."
	Inst9Quest11_Location = "Лоракс (Зимние Ключи; "..YELLOW.."64,74"..WHITE..")"
	Inst9Quest11_Note = "Задание для кузнецов. Горалук Треснувшая Наковальня около "..YELLOW.."[5]"..WHITE.."."
	Inst9Quest11_Prequest = "Нет"
	Inst9Quest11_Folgequest = "Нет"
	--
	Inst9Quest11name1 = "Plans: Demon Forged Breastplate"
	Inst9Quest11name2 = "Elixir of Demonslaying"
	Inst9Quest11name3 = "Demon Kissed Sack"
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst9Quest1_HORDE = Inst9Quest1
	Inst9Quest1_HORDE_Level = Inst9Quest1_Level
	Inst9Quest1_HORDE_Attain = Inst9Quest1_Attain
	Inst9Quest1_HORDE_Aim = Inst9Quest1_Aim
	Inst9Quest1_HORDE_Location = Inst9Quest1_Location
	Inst9Quest1_HORDE_Note = Inst9Quest1_Note
	Inst9Quest1_HORDE_Prequest = Inst9Quest1_Prequest
	Inst9Quest1_HORDE_Folgequest = Inst9Quest1_Folgequest
	-- No Rewards for this quest
	
	--Quest 2 Horde  (same as Quest 2 Alliance)
	Inst9Quest2_HORDE = Inst9Quest2
	Inst9Quest2_HORDE_Level = Inst9Quest2_Level
	Inst9Quest2_HORDE_Attain = Inst9Quest2_Attain
	Inst9Quest2_HORDE_Aim = Inst9Quest2_Aim
	Inst9Quest2_HORDE_Location = Inst9Quest2_Location
	Inst9Quest2_HORDE_Note = Inst9Quest2_Note
	Inst9Quest2_HORDE_Prequest = Inst9Quest2_Prequest
	Inst9Quest2_HORDE_Folgequest = Inst9Quest2_Folgequest
	-- No Rewards for this quest
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst9Quest3_HORDE = Inst9Quest3
	Inst9Quest3_HORDE_Level = Inst9Quest3_Level
	Inst9Quest3_HORDE_Attain = Inst9Quest3_Attain
	Inst9Quest3_HORDE_Aim = Inst9Quest3_Aim
	Inst9Quest3_HORDE_Location = Inst9Quest3_Location
	Inst9Quest3_HORDE_Note = Inst9Quest3_Note
	Inst9Quest3_HORDE_Prequest = Inst9Quest3_Prequest
	Inst9Quest3_HORDE_Folgequest = Inst9Quest3_Folgequest
	-- No Rewards for this quest
	
	--Quest 4 Horde  (same as Quest 4 Alliance)
	Inst9Quest4_HORDE = Inst9Quest4
	Inst9Quest4_HORDE_Level = Inst9Quest4_Level
	Inst9Quest4_HORDE_Attain = Inst9Quest4_Attain
	Inst9Quest4_HORDE_Aim = Inst9Quest4_Aim
	Inst9Quest4_HORDE_Location = Inst9Quest4_Location
	Inst9Quest4_HORDE_Note = Inst9Quest4_Note
	Inst9Quest4_HORDE_Prequest = Inst9Quest4_Prequest
	Inst9Quest4_HORDE_Folgequest = Inst9Quest4_Folgequest
	-- No Rewards for this quest
	
	--Quest5 Horde
	Inst9Quest5_HORDE = "5. Табличка Темнокамня"
	Inst9Quest5_HORDE_Level = "60"
	Inst9Quest5_HORDE_Attain = "57"
	Inst9Quest5_HORDE_Aim = "Принесите табличку Темного Камня тенемагу Вивиан Лягроб в Каргат."
	Inst9Quest5_HORDE_Location = "Темный маг Вивиана Лягроб (Бесплодные земли - Каргат; "..YELLOW.."2,47"..WHITE..")"
	Inst9Quest5_HORDE_Note = "Вы получите предшествующее задание у аптекаря Зинга в Подгороде - Квартал фармацевтов ("..YELLOW.."50,68"..WHITE..").\n\nThe Табличка Темнокамня находится около "..YELLOW.."[2]"..WHITE.." в сундуке."
	Inst9Quest5_HORDE_Prequest = "Вивиан Лягроб и табличка Темнокамня"
	Inst9Quest5_HORDE_Folgequest = "Нет"
	--
	Inst9Quest5name1_HORDE = "Swiftfoot Treads"
	Inst9Quest5name2_HORDE = "Blinkstrike Armguards"
	
	--Quest6 Horde
	Inst9Quest6_HORDE = "6. За Орду!"
	Inst9Quest6_HORDE_Level = "60"
	Inst9Quest6_HORDE_Attain = "55"
	Inst9Quest6_HORDE_Aim = "Отправляйтесь в Пик Черной горы и убейте вождя Ренда Чернорука. Принесите его голову в Оргриммар."
	Inst9Quest6_HORDE_Location = "Тралл (Оргриммар; "..YELLOW.."31,38"..WHITE..")"
	Inst9Quest6_HORDE_Note = "Задание для подготовки к Ониксии. Вы найдете вождя Ренда Чернорука около "..YELLOW.."[5]"..WHITE.."."
	Inst9Quest6_HORDE_Prequest = "Приказ полководца -> Мудрость Эйтригга"
	Inst9Quest6_HORDE_Folgequest = "Что принес ветер"
	--
	Inst9Quest6name1_HORDE = "Mark of Tyranny"
	Inst9Quest6name2_HORDE = "Eye of the Beast"
	Inst9Quest6name3_HORDE = "Blackhand's Breadth"
	
	--Quest7 Horde
	Inst9Quest7_HORDE = "7. Иллюзии ока"
	Inst9Quest7_HORDE_Level = "60"
	Inst9Quest7_HORDE_Attain = "57"
	Inst9Quest7_HORDE_Aim = "Отправляйтесь на пик Черной горы и добудьте 20 глаз черных драконидов. По выполнении задания вернитесь к Миранде Колдунье."
	Inst9Quest7_HORDE_Location = "Миранда Колдунья (Западные Чумные земли; "..YELLOW.."50,77"..WHITE..")"
	Inst9Quest7_HORDE_Note = "Глаза падают с драконидов."
	Inst9Quest7_HORDE_Prequest = "Что принес ветер -> Мастерица обмана"
	Inst9Quest7_HORDE_Folgequest = "Огнебор"
	-- No Rewards for this quest
	
	--Quest8 Horde
	Inst9Quest8_HORDE = "8. Кровь могучего черного дракона"
	Inst9Quest8_HORDE_Level = "60"
	Inst9Quest8_HORDE_Attain = "56"
	Inst9Quest8_HORDE_Aim = "Отправляйтесь к пику Черной горы и убейте генерала Драккисата. Соберите его кровь и вернитесь к Рексару."
	Inst9Quest8_HORDE_Location = "Рексар (Пустоши - Деревня Ночных охотников; "..YELLOW.."25,71"..WHITE..")"
	Inst9Quest8_HORDE_Note = "Последняя часть на пути к Ониксии. Вы найдете генерала Драккисата около "..YELLOW.."[8]"..WHITE.."."
	Inst9Quest8_HORDE_Prequest = "Огнебор -> Вознесение"
	Inst9Quest8_HORDE_Folgequest = "Нет"
	--
	Inst9Quest8name1_HORDE = "Drakefire Amulet"
	
	--Quest 9 Horde  (same as Quest 8 Alliance)
	Inst9Quest9_HORDE = "7. Приказ Чернорука"
	Inst9Quest9_HORDE_Level = Inst9Quest8_Level
	Inst9Quest9_HORDE_Attain = Inst9Quest8_Attain
	Inst9Quest9_HORDE_Aim = Inst9Quest8_Aim
	Inst9Quest9_HORDE_Location = Inst9Quest8_Location
	Inst9Quest9_HORDE_Note = Inst9Quest8_Note
	Inst9Quest9_HORDE_Prequest = Inst9Quest8_Prequest
	Inst9Quest9_HORDE_Folgequest = Inst9Quest8_Folgequest
	-- No Rewards for this quest
	
	--Quest 10 Horde  (same as Quest 9 Alliance)
	Inst9Quest10_HORDE = "10. Последние приготовления"
	Inst9Quest10_HORDE_Level = Inst9Quest9_Level
	Inst9Quest10_HORDE_Attain = Inst9Quest9_Attain
	Inst9Quest10_HORDE_Aim = Inst9Quest9_Aim
	Inst9Quest10_HORDE_Location = Inst9Quest9_Location
	Inst9Quest10_HORDE_Note = Inst9Quest9_Note
	Inst9Quest10_HORDE_Prequest = Inst9Quest9_Prequest
	Inst9Quest10_HORDE_Folgequest = Inst9Quest9_Folgequest
	-- No Rewards for this quest
	
	--Quest 11 Horde  (same as Quest 10 Alliance)
	Inst9Quest11_HORDE = "11. Mea Culpa, Лорд Вальтхалак"
	Inst9Quest11_HORDE_Level = Inst9Quest10_Level
	Inst9Quest11_HORDE_Attain = Inst9Quest10_Attain
	Inst9Quest11_HORDE_Aim = Inst9Quest10_Aim
	Inst9Quest11_HORDE_Location = Inst9Quest10_Location
	Inst9Quest11_HORDE_Note = Inst9Quest10_Note
	Inst9Quest11_HORDE_Prequest = Inst9Quest10_Prequest
	Inst9Quest11_HORDE_Folgequest = Inst9Quest10_Folgequest
	--
	Inst9Quest11name1_HORDE = Inst9Quest10name1
	Inst9Quest11name2_HORDE = Inst9Quest10name2
	
	--Quest 12 Horde  (same as Quest 11 Alliance)
	Inst9Quest12_HORDE = "12. Демонова кузня"
	Inst9Quest12_HORDE_Level = Inst9Quest11_Level
	Inst9Quest12_HORDE_Attain = Inst9Quest11_Attain
	Inst9Quest12_HORDE_Aim = Inst9Quest11_Aim
	Inst9Quest12_HORDE_Location = Inst9Quest11_Location
	Inst9Quest12_HORDE_Note = Inst9Quest11_Note
	Inst9Quest12_HORDE_Prequest = Inst9Quest11_Prequest
	Inst9Quest12_HORDE_Folgequest = Inst9Quest11_Folgequest
	--
	Inst9Quest12name1_HORDE = Inst9Quest11name1
	Inst9Quest12name2_HORDE = Inst9Quest11name2
	Inst9Quest12name3_HORDE = Inst9Quest11name3
	
	
	
	--------------- INST10 - Dire Maul East (DM) ---------------
	Inst10Story = "Построенный двенадцать тысяч лет назад тайной сектой волшебников ночных эльфов, древний город Эльдре'Талас использовали, чтобы защитить самые ценные секреты королевы Азшары. Несмотря на то, что он был уничтожен Великим Расколом мира, большая часть изумительного города еще существует как грандиозный Ужасный Кулак. Три самобытных района руин населили всевозможные твари - в основном призрачными высокорожденными, грязными сатирами и безмозглыми ограми. Только группа самых отважных искателей приключений может войти в разрушенный город и встретиться лицом к лицу с древним злом, заключенным в его древних подвалах."
	Inst10Caption = "Забытый город (Восток)"
	Inst10QAA = "6 Заданий"
	Inst10QAH = "6 Заданий"
	
	--Quest 1 Alliance
	Inst10Quest1 = "1. Пузиллин и старейшина Аж'Тордин"
	Inst10Quest1_Level = "58"
	Inst10Quest1_Attain = "?"
	Inst10Quest1_Aim = "Отправляйтесь в Забытый Город и отыщите беса Пузиллина. Любыми доступными средствами убедите Пузиллина отдать вам книгу заклинаний Аж'Тордина. Если добудете книгу, вернитесь к Аж'Тордину в павильон Лорисс в Фераласе."
	Inst10Quest1_Location = "Аж'Тордин (Фералас; "..YELLOW.."76,37"..WHITE..")"
	Inst10Quest1_Note = "Пузиллин находится в Забытом городе "..YELLOW.."Восток"..WHITE.." около "..YELLOW.."[1]"..WHITE..". Он убегает когда вы поговорите с ним, но останавливается и сражается около "..YELLOW.."[2]"..WHITE..". С него падает Ключ Полумесяца, используемый в Забытом городе Север и Запад."
	Inst10Quest1_Prequest = "Нет"
	Inst10Quest1_Folgequest = "Нет"
	--
	Inst10Quest1name1 = "Spry Boots"
	Inst10Quest1name2 = "Sprinter's Sword"
	
	--Quest 2 Alliance
	Inst10Quest2 = "2. Сеть Лефтендрис"
	Inst10Quest2_Level = "57"
	Inst10Quest2_Attain = "?"
	Inst10Quest2_Aim = "Принесите сеть Лефтендрис Латроникусу Лунному Копью в Крепость Оперенной Луны в Фераласе."
	Inst10Quest2_Location = "Латроникус Лунное Копье (Фералас - Крепость Оперенной Луны; "..YELLOW.."30,46"..WHITE..")"
	Inst10Quest2_Note = "Лефтендрис находится в Забытом городе "..YELLOW.."Восток"..WHITE.." около "..YELLOW.."[3]"..WHITE..". Предшествующее задание идет от Курьера Удар Молота в Стальгорне. Он бродит по всему городу."
	Inst10Quest2_Prequest = "Крепость Оперенной Луны"
	Inst10Quest2_Folgequest = "Нет"
	--
	Inst10Quest2name1 = "Lorespinner"
	
	--Quest 3 Alliance
	Inst10Quest3 = "3. Осколки сквернита"
	Inst10Quest3_Level = "60"
	Inst10Quest3_Attain = "?"
	Inst10Quest3_Aim = "Отыщите Сквернит в Забытом Городе и подберите его осколок. Есть шанс, что вам удастся его добыть, только убив Алззина Перевертня. Крепко заприте осколок в реликварии Чистоты, затем верните его Рабину Сатурне в Ночную Гавань в Лунной поляне."
	Inst10Quest3_Location = "Рабин Сатурна (Лунная поляна - Ночная гавань; "..YELLOW.."51,44"..WHITE..")"
	Inst10Quest3_Note = "Вы найдете Алззина Вертоградаря в "..YELLOW.."Восточной"..WHITE.." части Забытого города около "..YELLOW.."[5]"..WHITE..". Реликварий находится в Силитусе около "..YELLOW.."62,54"..WHITE..". Предществующее задание также идет от Рабина Сатурна."
	Inst10Quest3_Prequest = "Реликварий Чистоты"
	Inst10Quest3_Folgequest = "Нет"
	--
	Inst10Quest3name1 = "Milli's Shield"
	Inst10Quest3name2 = "Milli's Lexicon"
	
	--Quest 4 Alliance
	Inst10Quest4 = "4. Левая часть амулета Лорда Вальтхалака"
	Inst10Quest4_Level = "60"
	Inst10Quest4_Attain = "60"
	Inst10Quest4_Aim = "С помощью жаровни Призыва вызвать дух Изалиен и убить ее. Вернуться к Бодли в Черную гору, отдать ему левую часть амулета Лорда Вальтхалака и жаровню Призыва."
	Inst10Quest4_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
	Inst10Quest4_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его за задание 'В поисках Антиона'.\n\nИзалиен вызывается в "..YELLOW.."[5]"..WHITE.."."
	Inst10Quest4_Prequest = "Важная составляющая заклинания"
	Inst10Quest4_Folgequest = "Я вижу в твоем будущем остров Алькац..."
	-- No Rewards for this quest
	
	--Quest 5 Alliance
	Inst10Quest5 = "5. Правая часть амулета Лорда Вальтхалака"
	Inst10Quest5_Level = "60"
	Inst10Quest5_Attain = "60"
	Inst10Quest5_Aim = "С помощью жаровни Призыва вызвать дух Изалиен и убить ее. Вернуться к Бодли в Черную гору, отдать ему восстановленный амулет и жаровню Призыва."
	Inst10Quest5_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
	Inst10Quest5_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его за задание 'В поисках Антиона'.\n\nИзалиен вызывается в "..YELLOW.."[5]"..WHITE.."."
	Inst10Quest5_Prequest = "Еще одна важная составляющая заклинания"
	Inst10Quest5_Folgequest = "Последние приготовления ("..YELLOW.."Вершина Черной горы"..WHITE..")"
	-- No Rewards for this quest
	
	--Quest 6 Alliance
	Inst10Quest6 = "6. Тюремные кандалы"
	Inst10Quest6_Level = "60"
	Inst10Quest6_Attain = "60"
	Inst10Quest6_Aim = "Отправляйтесь в Забытый Город, что в Фераласе и добудьте 15 порций крови сатиров из племени Исчадий Природы, что живут в Квартале Криводревов. Вернитесь к Дайо из Гниющего шрама по выполнении поручения."
	Inst10Quest6_Location = "Дайо Дряхлый (Выжженные земли - Гниющий шрам; "..YELLOW.."34,50"..WHITE..")"
	Inst10Quest6_Note = "Задание для чернокнижников: Это вместе с другими заданиями для чернокнижников начинает Дайо Дряхлый на заклинание Ритуал Рока. Самый простой способ добраться до 'Сатиров из племени Буйного Нрава' это войти в Забытый Город (Восток) через 'заднюю дверь' в Павильон Лорисс (Фералас; "..YELLOW.."77,37"..WHITE.."). Вам понадобится Серповидный ключ."
	Inst10Quest6_Prequest = "Нет"
	Inst10Quest6_Folgequest = "Нет"
	-- No Rewards for this quest
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst10Quest1_HORDE = Inst10Quest1
	Inst10Quest1_HORDE_Level = Inst10Quest1_Level
	Inst10Quest1_HORDE_Attain = Inst10Quest1_Attain
	Inst10Quest1_HORDE_Aim = Inst10Quest1_Aim
	Inst10Quest1_HORDE_Location = Inst10Quest1_Location
	Inst10Quest1_HORDE_Note = Inst10Quest1_Note
	Inst10Quest1_HORDE_Prequest = Inst10Quest1_Prequest
	Inst10Quest1_HORDE_Folgequest = Inst10Quest1_Folgequest
	--
	Inst10Quest1name1_HORDE = Inst10Quest1name1
	Inst10Quest1name2_HORDE = Inst10Quest1name2
	
	--Quest 2 Horde
	Inst10Quest2_HORDE = "2. Сеть Лефтендрис"
	Inst10Quest2_HORDE_Level = "57"
	Inst10Quest2_HORDE_Attain = "?"
	Inst10Quest2_HORDE_Aim = "Принесите сеть Лефтендрис Тало Терновому Копыту в Лагере Мохаче в Фераласе."
	Inst10Quest2_HORDE_Location = "Тало Терновое Копыто (Фералас - Лагерь Мохаче; "..YELLOW.."76,43"..WHITE..")"
	Inst10Quest2_HORDE_Note = "Лефтендрис находится в Забытом городе "..YELLOW.."Восток"..WHITE.." около "..YELLOW.."[3]"..WHITE..". Предшествеющее задание идет от Военного глашатая Горлача в Оргриммаре. Он бродит по всему городу."
	Inst10Quest2_HORDE_Prequest = "Лагерь Мохаче"
	Inst10Quest2_HORDE_Folgequest = "Нет"
	--
	Inst10Quest2name1_HORDE = "Lorespinner"
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst10Quest3_HORDE = Inst10Quest3
	Inst10Quest3_HORDE_Level = Inst10Quest3_Level
	Inst10Quest3_HORDE_Attain = Inst10Quest3_Attain
	Inst10Quest3_HORDE_Aim = Inst10Quest3_Aim
	Inst10Quest3_HORDE_Location = Inst10Quest3_Location
	Inst10Quest3_HORDE_Note = Inst10Quest3_Note
	Inst10Quest3_HORDE_Prequest = Inst10Quest3_Prequest
	Inst10Quest3_HORDE_Folgequest = Inst10Quest3_Folgequest
	--
	Inst10Quest3name1_HORDE = Inst10Quest3name1
	Inst10Quest3name2_HORDE = Inst10Quest3name2
	
	--Quest 4 Horde  (same as Quest 4 Alliance)
	Inst10Quest4_HORDE = Inst10Quest4
	Inst10Quest4_HORDE_Level = Inst10Quest4_Level
	Inst10Quest4_HORDE_Attain = Inst10Quest4_Attain
	Inst10Quest4_HORDE_Aim = Inst10Quest4_Aim
	Inst10Quest4_HORDE_Location = Inst10Quest4_Location
	Inst10Quest4_HORDE_Note = Inst10Quest4_Note
	Inst10Quest4_HORDE_Prequest = Inst10Quest4_Prequest
	Inst10Quest4_HORDE_Folgequest = Inst10Quest4_Folgequest
	-- No Rewards for this quest
	
	--Quest 5 Horde  (same as Quest 5 Alliance)
	Inst10Quest5_HORDE = Inst10Quest5
	Inst10Quest5_HORDE_Level = Inst10Quest5_Level
	Inst10Quest5_HORDE_Attain = Inst10Quest5_Attain
	Inst10Quest5_HORDE_Aim = Inst10Quest5_Aim
	Inst10Quest5_HORDE_Location = Inst10Quest5_Location
	Inst10Quest5_HORDE_Note = Inst10Quest5_Note
	Inst10Quest5_HORDE_Prequest = Inst10Quest5_Prequest
	Inst10Quest5_HORDE_Folgequest = Inst10Quest5_Folgequest
	-- No Rewards for this quest
	
	--Quest 6 Horde  (same as Quest 6 Alliance)
	Inst10Quest6_HORDE = Inst10Quest6
	Inst10Quest6_HORDE_Level = Inst10Quest6_Level
	Inst10Quest6_HORDE_Attain = Inst10Quest6_Attain
	Inst10Quest6_HORDE_Aim = Inst10Quest6_Aim
	Inst10Quest6_HORDE_Location = Inst10Quest6_Location
	Inst10Quest6_HORDE_Note = Inst10Quest6_Note
	Inst10Quest6_HORDE_Prequest = Inst10Quest6_Prequest
	Inst10Quest6_HORDE_Folgequest = Inst10Quest6_Folgequest
	-- No Rewards for this quest
	
	
	
	--------------- INST11 - Dire Maul North (DM) ---------------
	Inst11Story = Inst10Story
	Inst11Caption = "Забытый город (Север)"
	Inst11QAA = "4 Задания"
	Inst11QAH = "4 Задания"
	
	--Quest 1 Alliance
	Inst11Quest1 = "1. Сломанная западня"
	Inst11Quest1_Level = "60"
	Inst11Quest1_Attain = "60"
	Inst11Quest1_Aim = "Отремонтировать западню."
	Inst11Quest1_Location = "Сломанная западня (Забытый город; "..YELLOW.."Север"..WHITE..")"
	Inst11Quest1_Note = "Повторяемое задание. Для ремонта западни нужно использовать [Ториевое устройство] и [Масло льда]."
	Inst11Quest1_Prequest = "Нет"
	Inst11Quest1_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 2 Alliance
	Inst11Quest2 = "2. Броня огров Гордока"
	Inst11Quest2_Attain = "?"
	Inst11Quest2_Level = "60"
	Inst11Quest2_Aim = "Принесите 4 рулона рунической ткани, 8 кусков грубой кожи, 2 мотка рунной нити и огрскую дубильную кислоту Уззлу Наперстяку. Он прикован в секторе Гордока в Забытом Городе."
	Inst11Quest2_Location = "Уззл Наперстяк (Забытый город; "..YELLOW.."Север, [4]"..WHITE..")"
	Inst11Quest2_Note = "Повторяемое задание. Вы найдете огрскую дубильную кислоту около "..YELLOW.."[4] (сверху)"..WHITE.."."
	Inst11Quest2_Prequest = "Нет"
	Inst11Quest2_Folgequest = "Нет"
	--
	Inst11Quest2name1 = "Gordok Ogre Suit"
	
	--Quest 3 Alliance
	Inst11Quest3 = "3. Освободите Нотта!"
	Inst11Quest3_Attain = "?"
	Inst11Quest3_Level = "60"
	Inst11Quest3_Aim = "Найдите Ключ от оков Гордока для Уззла Наперстяка."
	Inst11Quest3_Location = "Уззл Наперстяк (Забытый город; "..YELLOW.."Север, [4]"..WHITE..")"
	Inst11Quest3_Note = "Повторяемое задание. Ключ может выпасть из любого охранника."
	Inst11Quest3_Prequest = "Нет"
	Inst11Quest3_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 4 Alliance
	Inst11Quest4 = "4. Неоконченное дело Гордоков"
	Inst11Quest4_Level = "60"
	Inst11Quest4_Attain = "?"
	Inst11Quest4_Aim = "Добудьте латную рукавицу Мощи Гордока и вернитесь с ней к капитану Давигрому в Забытом Городе. По словам Давигрома, в \"старых байках\" говорится, что Тортелдрин – \"страшный эльф\", называющий себя принцем, – похитил эту рукавицу у одного из королей Гордоков."
	Inst11Quest4_Location = "Капитан Давигром (Забытый город; "..YELLOW.."Север, [5]"..WHITE..")"
	Inst11Quest4_Note = "Принц находится в Забытом городе "..YELLOW.."Запад"..WHITE.." около "..YELLOW.."[7]"..WHITE..". Рукавица в сундуке прямо рядом с ним. Вы можете взять это задание только после Захода почести и с баффом 'Король Гордока'."
	Inst11Quest4_Prequest = "Нет"
	Inst11Quest4_Folgequest = "Нет"
	--
	Inst11Quest4name1 = "Gordok's Handwraps"
	Inst11Quest4name2 = "Gordok's Gloves"
	Inst11Quest4name3 = "Gordok's Gauntlets"
	Inst11Quest4name4 = "Gordok's Handguards"
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst11Quest1_HORDE = Inst11Quest1
	Inst11Quest1_HORDE_Level = Inst11Quest1_Level
	Inst11Quest1_HORDE_Attain = Inst11Quest1_Attain
	Inst11Quest1_HORDE_Aim = Inst11Quest1_Aim
	Inst11Quest1_HORDE_Location = Inst11Quest1_Location
	Inst11Quest1_HORDE_Note = Inst11Quest1_Note
	Inst11Quest1_HORDE_Prequest = Inst11Quest1_Prequest
	Inst11Quest1_HORDE_Folgequest = Inst11Quest1_Folgequest
	-- No Rewards for this quest
	
	--Quest 2 Horde  (same as Quest 2 Alliance)
	Inst11Quest2_HORDE = Inst11Quest2
	Inst11Quest2_HORDE_Level = Inst11Quest2_Level
	Inst11Quest2_HORDE_Attain = Inst11Quest2_Attain
	Inst11Quest2_HORDE_Aim = Inst11Quest2_Aim
	Inst11Quest2_HORDE_Location = Inst11Quest2_Location
	Inst11Quest2_HORDE_Note = Inst11Quest2_Note
	Inst11Quest2_HORDE_Prequest = Inst11Quest2_Prequest
	Inst11Quest2_HORDE_Folgequest = Inst11Quest2_Folgequest
	--
	Inst11Quest2name1_HORDE = Inst11Quest2name1
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst11Quest3_HORDE = Inst11Quest3
	Inst11Quest3_HORDE_Level = Inst11Quest3_Level
	Inst11Quest3_HORDE_Attain = Inst11Quest3_Attain
	Inst11Quest3_HORDE_Aim = Inst11Quest3_Aim
	Inst11Quest3_HORDE_Location = Inst11Quest3_Location
	Inst11Quest3_HORDE_Note = Inst11Quest3_Note
	Inst11Quest3_HORDE_Prequest = Inst11Quest3_Prequest
	Inst11Quest3_HORDE_Folgequest = Inst11Quest3_Folgequest
	-- No Rewards for this quest
	
	--Quest 4 Horde  (same as Quest 4 Alliance)
	Inst11Quest4_HORDE = Inst11Quest4
	Inst11Quest4_HORDE_Level = Inst11Quest4_Level
	Inst11Quest4_HORDE_Attain = Inst11Quest4_Attain
	Inst11Quest4_HORDE_Aim = Inst11Quest4_Aim
	Inst11Quest4_HORDE_Location = Inst11Quest4_Location
	Inst11Quest4_HORDE_Note = Inst11Quest4_Note
	Inst11Quest4_HORDE_Prequest = Inst11Quest4_Prequest
	Inst11Quest4_HORDE_Folgequest = Inst11Quest4_Folgequest
	--
	Inst11Quest4name1_HORDE = Inst11Quest4name1
	Inst11Quest4name2_HORDE = Inst11Quest4name2
	Inst11Quest4name3_HORDE = Inst11Quest4name3
	Inst11Quest4name4_HORDE = Inst11Quest4name4
	
	
	
	--------------- INST12 - Dire Maul West (DM) ---------------
	Inst12Story = Inst10Story
	Inst12Caption = "Забытый город (Запад)"
	Inst12QAA = "17 Заданий"
	Inst12QAH = "17 Заданий"
	
	--Quest 1 Alliance
	Inst12Quest1 = "1. Эльфийские легенды"
	Inst12Quest1_Level = "60"
	Inst12Quest1_Attain = "54"
	Inst12Quest1_Aim = "Попытайтесь найти в Забытом Городе Кариэля Винтхалуса. Вернитесь в Крепость Оперенной Луны к школяру Рунному Шипу и сообщите ему все, что вам удалось узнать."
	Inst12Quest1_Location = "Школяр Рунный Шип (Фералас - Крепость Оперенной Луны; "..YELLOW.."31,43"..WHITE..")"
	Inst12Quest1_Note = "Вы найдете Кариэля Винтхалуса в "..YELLOW.."Библиотека (Запад)"..WHITE.."."
	Inst12Quest1_Prequest = "Нет"
	Inst12Quest1_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 2 Alliance
	Inst12Quest2 = "2. Древнее безумие"
	Inst12Quest2_Level = "60"
	Inst12Quest2_Attain = "?"
	Inst12Quest2_Aim = "Перебейте стражей, которые охраняют 5 столпов, снабжающих энергией Тюрьму Бессмер'тера. После того, как столпы угаснут, силовое поле, удерживающее Бессмер'тера, рассеется.\nВойдите в Тюрьму Бессмер'тера и уничтожьте злого демона, который находится внутри. И, наконец, сразитесь с принцем Тортелдрином в Читальне."
	Inst12Quest2_Location = "Прародительница Шен'дралар (Забытый город; "..YELLOW.."Запад, [1] (сверху)"..WHITE..")"
	Inst12Quest2_Note = "Столпы помечены как "..BLUE.."[B]"..WHITE..". Бессмер'тер находится около "..YELLOW.."[6]"..WHITE..", Принц Тортелдрин находится около "..YELLOW.."[7]"..WHITE.."."
	Inst12Quest2_Prequest = "Нет"
	Inst12Quest2_Folgequest = "Сокровище Шен'дралар"
	-- No Rewards for this quest
	
	--Quest 3 Alliance
	Inst12Quest3 = "3. Сокровище Шен'дралар"
	Inst12Quest3_Level = "60"
	Inst12Quest3_Attain = "?"
	Inst12Quest3_Aim = "Вернитесь в Читальню и найдите сокровище Шен'дралар. Получите свою награду!"
	Inst12Quest3_Location = "Прародительница Шен'дралар (Забытый город; "..YELLOW.."Запад, [1]"..WHITE..")"
	Inst12Quest3_Note = "Вы найдете Сокровище под ступеньками "..YELLOW.."[7]"..WHITE.."."
	Inst12Quest3_Prequest = "Древнее безумие"
	Inst12Quest3_Folgequest = "Нет"
	--
	Inst12Quest3name1 = "Sedge Boots"
	Inst12Quest3name2 = "Backwood Helm"
	Inst12Quest3name3 = "Bonecrusher"
	
	--Quest 4 Alliance
	Inst12Quest4 = "4. Dreadsteed of Xoroth"
	Inst12Quest4_Level = "60"
	Inst12Quest4_Attain = "60"
	Inst12Quest4_Aim = "Read Mor'zul's Instructions. Summon a Xorothian Dreadsteed, defeat it, then bind its spirit to you."
	Inst12Quest4_Location = "Mor'zul Bloodbringer (Burning Steppes; "..YELLOW.."12,31"..WHITE..")"
	Inst12Quest4_Note = "Задание для чернокнижников: Final Quest in the Warlock Epic mount questline. First you must shut down all Pylons marked with "..BLUE.."[B]"..WHITE.." and then kill Immol'thar at "..YELLOW.."[6]"..WHITE..". After that, you can begin the Summoning Ritual. Be sure to have upwards of 20 Soul Shards ready and have one Warlock specifically assigned to keeping the Bell, Candle and Wheel up. The Doomguards that come can be enslaved. After completion, talk to the Dreadsteed ghost to complete the quest."
	Inst12Quest4_Prequest = "Imp Delivery ("..YELLOW.."Scholomance"..WHITE..")"
	Inst12Quest4_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 5 Alliance
	Inst12Quest5 = "5. The Emerald Dream..."
	Inst12Quest5_Level = "60"
	Inst12Quest5_Attain = "59"
	Inst12Quest5_Aim = "Return the book to its rightful owners."
	Inst12Quest5_Location = "The Emerald Dream (randomly drops off bosses in all Dire Maul wings)"
	Inst12Quest5_Note = "Задание для друидов: You turn the book in to Lorekeeper Javon at the "..YELLOW.."1' Library"..WHITE.."."
	Inst12Quest5_Prequest = "Нет"
	Inst12Quest5_Folgequest = "Нет"
	--
	Inst12Quest5name1 = "Royal Seal of Eldre'Thalas"
	
	--Quest 6 Alliance
	Inst12Quest6 = "6. The Greatest Race of Hunters"
	Inst12Quest6_Level = "60"
	Inst12Quest6_Attain = "54"
	Inst12Quest6_Aim = "Return the book to its rightful owners."
	Inst12Quest6_Location = "The Greatest Race of Hunters (randomly drops off bosses in all Dire Maul wings)"
	Inst12Quest6_Note = "Задание для охотников: You turn the book in to Lorekeeper Mykos at the "..YELLOW.."1' Library"..WHITE.."."
	Inst12Quest6_Prequest = "Нет"
	Inst12Quest6_Folgequest = "Нет"
	--
	Inst12Quest6name1 = "Royal Seal of Eldre'Thalas"
	
	--Quest 7 Alliance
	Inst12Quest7 = "7. The Arcanist's Cookbook"
	Inst12Quest7_Level = "60"
	Inst12Quest7_Attain = "54"
	Inst12Quest7_Aim = "Return the book to its rightful owners."
	Inst12Quest7_Location = "The Arcanist's Cookbook (randomly drops off bosses in all Dire Maul wings)"
	Inst12Quest7_Note = "Задание для магов: The reward is for Mages. You turn the book in to Lorekeeper Kildrath at the "..YELLOW.."1' Library"..WHITE.."."
	Inst12Quest7_Prequest = "Нет"
	Inst12Quest7_Folgequest = "Нет"
	--
	Inst12Quest7name1 = "Royal Seal of Eldre'Thalas"
	
	--Quest 8 Alliance
	Inst12Quest8 = "8. The Light and How To Swing It"
	Inst12Quest8_Level = "60"
	Inst12Quest8_Attain = "54"
	Inst12Quest8_Aim = "Return the book to its rightful owners."
	Inst12Quest8_Location = "The Light and How To Swing It (randomly drops off bosses in all Dire Maul wings)"
	Inst12Quest8_Note = "Задание для паладинов: The reward is for Paladins. You turn the book in to Lorekeeper Mykos at the "..YELLOW.."1' Library"..WHITE.."."
	Inst12Quest8_Prequest = "Нет"
	Inst12Quest8_Folgequest = "Нет"
	--
	Inst12Quest8name1 = "Royal Seal of Eldre'Thalas"
	
	--Quest 9 Alliance
	Inst12Quest9 = "9. Holy Bologna: What the Light Won't Tell You"
	Inst12Quest9_Level = "60"
	Inst12Quest9_Attain = "56"
	Inst12Quest9_Aim = "Return the book to its rightful owners."
	Inst12Quest9_Location = "Holy Bologna: What the Light Won't Tell You (randomly drops off bosses in all Dire Maul wings)"
	Inst12Quest9_Note = "Задание для жрецов: You turn the book in to Lorekeeper Javon at the "..YELLOW.."1' Library"..WHITE.."."
	Inst12Quest9_Prequest = "Нет"
	Inst12Quest9_Folgequest = "Нет"
	--
	Inst12Quest9name1 = "Royal Seal of Eldre'Thalas"
	
	--Quest 10 Alliance
	Inst12Quest10 = "10. Garona: A Study on Stealth and Treachery"
	Inst12Quest10_Level = "60"
	Inst12Quest10_Attain = "54"
	Inst12Quest10_Aim = "Return the book to its rightful owners."
	Inst12Quest10_Location = "Garona: A Study on Stealth and Treachery (randomly drops off bosses in all Dire Maul wings)"
	Inst12Quest10_Note = "Задание для разбойников: You turn the book in to Lorekeeper Kildrath at the "..YELLOW.."1' Library"..WHITE.."."
	Inst12Quest10_Prequest = "Нет"
	Inst12Quest10_Folgequest = "Нет"
	--
	Inst12Quest10name1 = "Royal Seal of Eldre'Thalas"
	
	--Quest 11 Alliance
	Inst12Quest11 = "11. Frost Shock and You"
	Inst12Quest11_Level = "60"
	Inst12Quest11_Attain = "59"
	Inst12Quest11_Aim = "Return the book to its rightful owners."
	Inst12Quest11_Location = "Frost Shock and You (randomly drops off bosses in all Dire Maul wings)"
	Inst12Quest11_Note = "Задание для шаманов: You turn the book in to Lorekeeper Javon at the "..YELLOW.."1' Library"..WHITE.."."
	Inst12Quest11_Prequest = "Нет"
	Inst12Quest11_Folgequest = "Нет"
	--
	Inst12Quest11name1 = "Royal Seal of Eldre'Thalas"
	
	--Quest 12 Alliance
	Inst12Quest12 = "12. Harnessing Shadows"
	Inst12Quest12_Level = "60"
	Inst12Quest12_Attain = "54"
	Inst12Quest12_Aim = "Return the book to its rightful owners."
	Inst12Quest12_Location = "Harnessing Shadows (randomly drops off bosses in all Dire Maul wings)"
	Inst12Quest12_Note = "Задание для чернокнижников: You turn the book in to Lorekeeper Mykos at the "..YELLOW.."1' Library"..WHITE.."."
	Inst12Quest12_Prequest = "Нет"
	Inst12Quest12_Folgequest = "Нет"
	--
	Inst12Quest12name1 = "Royal Seal of Eldre'Thalas"
	
	--Quest 13 Alliance
	Inst12Quest13 = "13. Codex of Defense"
	Inst12Quest13_Level = "60"
	Inst12Quest13_Attain = "57"
	Inst12Quest13_Aim = "Return the book to its rightful owners."
	Inst12Quest13_Location = "Codex of Defense (randomly drops off bosses in all Dire Maul wings)"
	Inst12Quest13_Note = "Задание для воинов: You turn the book in to Lorekeeper Kildrath at the "..YELLOW.."1' Library"..WHITE.."."
	Inst12Quest13_Prequest = "Нет"
	Inst12Quest13_Folgequest = "Нет"
	--
	Inst12Quest13name1 = "Royal Seal of Eldre'Thalas"
	
	--Quest 14 Alliance
	Inst12Quest14 = "14. Libram of Focus"
	Inst12Quest14_Level = "60"
	Inst12Quest14_Attain = "60"
	Inst12Quest14_Aim = "Bring a Libram of Focus, 1 Pristine Black Diamond, 4 Large Brilliant Shards, and 2 Skin of Shadow to Lorekeeper Lydros in Dire Maul to receive an Arcanum of Focus."
	Inst12Quest14_Location = "Lorekeeper Lydros (Dire Maul West; "..YELLOW.."[1'] Library"..WHITE..")"
	Inst12Quest14_Note = "It's not a prequest, but Elven Legends must be completed before this quest can be started.\n\nThe Libram is a random drop in Dire Maul and is tradeable, so it may be found on the Auction House. Skin of Shadow is Soulbound and can drop off some bosses, Risen Constructs and Risen Bonewarder in "..YELLOW.."Scholomance"..WHITE.."."
	Inst12Quest14_Prequest = "Нет"
	Inst12Quest14_Folgequest = "Нет"
	--
	Inst12Quest14name1 = "Arcanum of Focus"
	
	--Quest 15 Alliance
	Inst12Quest15 = "15. Libram of Protection"
	Inst12Quest15_Level = "60"
	Inst12Quest15_Attain = "60"
	Inst12Quest15_Aim = "Bring a Libram of Protection, 1 Pristine Black Diamond, 2 Large Brilliant Shards, and 1 Frayed Abomination Stitching to Lorekeeper Lydros in Dire Maul to receive an Arcanum of Protection."
	Inst12Quest15_Location = "Lorekeeper Lydros (Dire Maul West; "..YELLOW.."[1'] Library"..WHITE..")"
	Inst12Quest15_Note = "It's not a prequest, but Elven Legends must be completed before this quest can be started.\n\nThe Libram is a random drop in Dire Maul and is tradeable, so it may be found on the Auction House. Frayed Abomination Stitching is Soulbound and can drop off Ramstein the Gorger, Venom Belchers, Bile Spewer and Patchwork Horror in "..YELLOW.."Stratholme"..WHITE.."."
	Inst12Quest15_Prequest = "Нет"
	Inst12Quest15_Folgequest = "Нет"
	--
	Inst12Quest15name1 = "Arcanum of Protection"
	
	--Quest 16 Alliance
	Inst12Quest16 = "16. Libram of Rapidity"
	Inst12Quest16_Level = "60"
	Inst12Quest16_Attain = "60"
	Inst12Quest16_Aim = "Bring a Libram of Rapidity, 1 Pristine Black Diamond, 2 Large Brilliant Shards, and 2 Blood of Heroes to Lorekeeper Lydros in Dire Maul to receive an Arcanum of Rapidity."
	Inst12Quest16_Location = "Lorekeeper Lydros (Dire Maul West; "..YELLOW.."[1'] Library"..WHITE..")"
	Inst12Quest16_Note = "It's not a prequest, but Elven Legends must be completed before this quest can be started.\n\nThe Libram is a random drop in Dire Maul and is tradeable, so it may be found on the Auction House. Blood of Heroes is Soulbound and can be found on the ground in random places in the Western and Eastern Plaguelands."
	Inst12Quest16_Prequest = "Нет"
	Inst12Quest16_Folgequest = "Нет"
	--
	Inst12Quest16name1 = "Arcanum of Rapidity"
	
	--Quest 17 Alliance
	Inst12Quest17 = "17. Foror's Compendium"
	Inst12Quest17_Level = "60"
	Inst12Quest17_Attain = "60"
	Inst12Quest17_Aim = "Return Foror's Compendium of Dragon Slaying to the Athenaeum."
	Inst12Quest17_Location = "Foror's Compendium of Dragon Slaying (random boss drop in "..YELLOW.."Dire Maul"..WHITE..")"
	Inst12Quest17_Note = "Warrior or Paladin quest. It turns in to Lorekeeper Lydros at (Dire Maul West; "..YELLOW.."[1'] Library"..WHITE.."). Turning this in allows you to start the quest for Quel'Serrar."
	Inst12Quest17_Prequest = "Нет"
	Inst12Quest17_Folgequest = "The Forging of Quel'Serrar"
	-- No Rewards for this quest
	
	
	--Quest 1 Horde
	Inst12Quest1_HORDE = "1. Elven Legends"
	Inst12Quest1_HORDE_Level = "60"
	Inst12Quest1_HORDE_Attain = "54"
	Inst12Quest1_HORDE_Aim = "Search Dire Maul for Kariel Winthalus. Report back to Sage Korolusk at Camp Mojache with whatever information that you may find."
	Inst12Quest1_HORDE_Location = "Sage Korolusk (Фералас - Camp Mojache; "..YELLOW.."74,43"..WHITE..")"
	Inst12Quest1_HORDE_Note = "You find Kariel Winthalus in the "..YELLOW.."Library (West)"..WHITE.."."
	Inst12Quest1_HORDE_Prequest = "Нет"
	Inst12Quest1_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 2 Horde  (same as Quest 2 Alliance)
	Inst12Quest2_HORDE = Inst12Quest2
	Inst12Quest2_HORDE_Level = Inst12Quest2_Level
	Inst12Quest2_HORDE_Attain = Inst12Quest2_Attain
	Inst12Quest2_HORDE_Aim = Inst12Quest2_Aim
	Inst12Quest2_HORDE_Location = Inst12Quest2_Location
	Inst12Quest2_HORDE_Note = Inst12Quest2_Note
	Inst12Quest2_HORDE_Prequest = Inst12Quest2_Prequest
	Inst12Quest2_HORDE_Folgequest = Inst12Quest2_Folgequest
	-- No Rewards for this quest
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst12Quest3_HORDE = Inst12Quest3
	Inst12Quest3_HORDE_Level = Inst12Quest3_Level
	Inst12Quest3_HORDE_Attain = Inst12Quest3_Attain
	Inst12Quest3_HORDE_Aim = Inst12Quest3_Aim
	Inst12Quest3_HORDE_Location = Inst12Quest3_Location
	Inst12Quest3_HORDE_Note = Inst12Quest3_Note
	Inst12Quest3_HORDE_Prequest = Inst12Quest3_Prequest
	Inst12Quest3_HORDE_Folgequest = Inst12Quest3_Folgequest
	--
	Inst12Quest3name1_HORDE = Inst12Quest3name1
	Inst12Quest3name2_HORDE = Inst12Quest3name2
	Inst12Quest3name3_HORDE = Inst12Quest3name3
	
	--Quest 4 Horde  (same as Quest 4 Alliance)
	Inst12Quest4_HORDE = Inst12Quest4
	Inst12Quest4_HORDE_Level = Inst12Quest4_Level
	Inst12Quest4_HORDE_Attain = Inst12Quest4_Attain
	Inst12Quest4_HORDE_Aim = Inst12Quest4_Aim
	Inst12Quest4_HORDE_Location = Inst12Quest4_Location
	Inst12Quest4_HORDE_Note = Inst12Quest4_Note
	Inst12Quest4_HORDE_Prequest = Inst12Quest4_Prequest
	Inst12Quest4_HORDE_Folgequest = Inst12Quest4_Folgequest
	-- No Rewards for this quest
	
	--Quest 5 Horde  (same as Quest 5 Alliance)
	Inst12Quest5_HORDE = Inst12Quest5
	Inst12Quest5_HORDE_Level = Inst12Quest5_Level
	Inst12Quest5_HORDE_Attain = Inst12Quest5_Attain
	Inst12Quest5_HORDE_Aim = Inst12Quest5_Aim
	Inst12Quest5_HORDE_Location = Inst12Quest5_Location
	Inst12Quest5_HORDE_Note = Inst12Quest5_Note
	Inst12Quest5_HORDE_Prequest = Inst12Quest5_Prequest
	Inst12Quest5_HORDE_Folgequest = Inst12Quest5_Folgequest
	--
	Inst12Quest5name1_HORDE = Inst12Quest5name1
	
	--Quest 6 Horde  (same as Quest 6 Alliance)
	Inst12Quest6_HORDE = Inst12Quest6
	Inst12Quest6_HORDE_Level = Inst12Quest6_Level
	Inst12Quest6_HORDE_Attain = Inst12Quest6_Attain
	Inst12Quest6_HORDE_Aim = Inst12Quest6_Aim
	Inst12Quest6_HORDE_Location = Inst12Quest6_Location
	Inst12Quest6_HORDE_Note = Inst12Quest6_Note
	Inst12Quest6_HORDE_Prequest = Inst12Quest6_Prequest
	Inst12Quest6_HORDE_Folgequest = Inst12Quest6_Folgequest
	--
	Inst12Quest6name1_HORDE = Inst12Quest6name1
	
	--Quest 7 Horde  (same as Quest 7 Alliance)
	Inst12Quest7_HORDE = Inst12Quest7
	Inst12Quest7_HORDE_Level = Inst12Quest7_Level
	Inst12Quest7_HORDE_Attain = Inst12Quest7_Attain
	Inst12Quest7_HORDE_Aim = Inst12Quest7_Aim
	Inst12Quest7_HORDE_Location = Inst12Quest7_Location
	Inst12Quest7_HORDE_Note = Inst12Quest7_Note
	Inst12Quest7_HORDE_Prequest = Inst12Quest7_Prequest
	Inst12Quest7_HORDE_Folgequest = Inst12Quest7_Folgequest
	--
	Inst12Quest7name1_HORDE = Inst12Quest7name1
	
	--Quest 8 Horde  (same as Quest 8 Alliance)
	Inst12Quest8_HORDE = Inst12Quest8
	Inst12Quest8_HORDE_Level = Inst12Quest8_Level
	Inst12Quest8_HORDE_Attain = Inst12Quest8_Attain
	Inst12Quest8_HORDE_Aim = Inst12Quest8_Aim
	Inst12Quest8_HORDE_Location = Inst12Quest8_Location
	Inst12Quest8_HORDE_Note = Inst12Quest8_Note
	Inst12Quest8_HORDE_Prequest = Inst12Quest8_Prequest
	Inst12Quest8_HORDE_Folgequest = Inst12Quest8_Folgequest
	--
	Inst12Quest8name1_HORDE = Inst12Quest8name1
	
	--Quest 9 Horde  (same as Quest 9 Alliance)
	Inst12Quest9_HORDE = Inst12Quest9
	Inst12Quest9_HORDE_Level = Inst12Quest9_Level
	Inst12Quest9_HORDE_Attain = Inst12Quest9_Attain
	Inst12Quest9_HORDE_Aim = Inst12Quest9_Aim
	Inst12Quest9_HORDE_Location = Inst12Quest9_Location
	Inst12Quest9_HORDE_Note = Inst12Quest9_Note
	Inst12Quest9_HORDE_Prequest = Inst12Quest9_Prequest
	Inst12Quest9_HORDE_Folgequest = Inst12Quest9_Folgequest
	--
	Inst12Quest9name1_HORDE = Inst12Quest9name1
	
	--Quest 10 Horde  (same as Quest 10 Alliance)
	Inst12Quest10_HORDE = Inst12Quest10
	Inst12Quest10_HORDE_Level = Inst12Quest10_Level
	Inst12Quest10_HORDE_Attain = Inst12Quest10_Attain
	Inst12Quest10_HORDE_Aim = Inst12Quest10_Aim
	Inst12Quest10_HORDE_Location = Inst12Quest10_Location
	Inst12Quest10_HORDE_Note = Inst12Quest10_Note
	Inst12Quest10_HORDE_Prequest = Inst12Quest10_Prequest
	Inst12Quest10_HORDE_Folgequest = Inst12Quest10_Folgequest
	--
	Inst12Quest10name1_HORDE = Inst12Quest10name1
	
	--Quest 11 Horde  (same as Quest 11 Alliance)
	Inst12Quest11_HORDE = Inst12Quest11
	Inst12Quest11_HORDE_Level = Inst12Quest11_Level
	Inst12Quest11_HORDE_Attain = Inst12Quest11_Attain
	Inst12Quest11_HORDE_Aim = Inst12Quest11_Aim
	Inst12Quest11_HORDE_Location = Inst12Quest11_Location
	Inst12Quest11_HORDE_Note = Inst12Quest11_Note
	Inst12Quest11_HORDE_Prequest = Inst12Quest11_Prequest
	Inst12Quest11_HORDE_Folgequest = Inst12Quest11_Folgequest
	--
	Inst12Quest11name1_HORDE = Inst12Quest11name1
	
	--Quest 12 Horde  (same as Quest 12 Alliance)
	Inst12Quest12_HORDE = Inst12Quest12
	Inst12Quest12_HORDE_Level = Inst12Quest12_Level
	Inst12Quest12_HORDE_Attain = Inst12Quest12_Attain
	Inst12Quest12_HORDE_Aim = Inst12Quest12_Aim
	Inst12Quest12_HORDE_Location = Inst12Quest12_Location
	Inst12Quest12_HORDE_Note = Inst12Quest12_Note
	Inst12Quest12_HORDE_Prequest = Inst12Quest12_Prequest
	Inst12Quest12_HORDE_Folgequest = Inst12Quest12_Folgequest
	--
	Inst12Quest12name1_HORDE = Inst12Quest12name1
	
	--Quest 13 Horde  (same as Quest 13 Alliance)
	Inst12Quest13_HORDE = Inst12Quest13
	Inst12Quest13_HORDE_Level = Inst12Quest13_Level
	Inst12Quest13_HORDE_Attain = Inst12Quest13_Attain
	Inst12Quest13_HORDE_Aim = Inst12Quest13_Aim
	Inst12Quest13_HORDE_Location = Inst12Quest13_Location
	Inst12Quest13_HORDE_Note = Inst12Quest13_Note
	Inst12Quest13_HORDE_Prequest = Inst12Quest13_Prequest
	Inst12Quest13_HORDE_Folgequest = Inst12Quest13_Folgequest
	--
	Inst12Quest13name1_HORDE = Inst12Quest13name1
	
	--Quest 14 Horde  (same as Quest 14 Alliance)
	Inst12Quest14_HORDE = Inst12Quest14
	Inst12Quest14_HORDE_Level = Inst12Quest14_Level
	Inst12Quest14_HORDE_Attain = Inst12Quest14_Attain
	Inst12Quest14_HORDE_Aim = Inst12Quest14_Aim
	Inst12Quest14_HORDE_Location = Inst12Quest14_Location
	Inst12Quest14_HORDE_Note = Inst12Quest14_Note
	Inst12Quest14_HORDE_Prequest = Inst12Quest14_Prequest
	Inst12Quest14_HORDE_Folgequest = Inst12Quest14_Folgequest
	--
	Inst12Quest14name1_HORDE = Inst12Quest14name1
	
	--Quest 15 Horde  (same as Quest 15 Alliance)
	Inst12Quest15_HORDE = Inst12Quest15
	Inst12Quest15_HORDE_Level = Inst12Quest15_Level
	Inst12Quest15_HORDE_Attain = Inst12Quest15_Attain
	Inst12Quest15_HORDE_Aim = Inst12Quest15_Aim
	Inst12Quest15_HORDE_Location = Inst12Quest15_Location
	Inst12Quest15_HORDE_Note = Inst12Quest15_Note
	Inst12Quest15_HORDE_Prequest = Inst12Quest15_Prequest
	Inst12Quest15_HORDE_Folgequest = Inst12Quest15_Folgequest
	--
	Inst12Quest15name1_HORDE = Inst12Quest15name1
	
	--Quest 16 Horde  (same as Quest 16 Alliance)
	Inst12Quest16_HORDE = Inst12Quest16
	Inst12Quest16_HORDE_Level = Inst12Quest16_Level
	Inst12Quest16_HORDE_Attain = Inst12Quest16_Attain
	Inst12Quest16_HORDE_Aim = Inst12Quest16_Aim
	Inst12Quest16_HORDE_Location = Inst12Quest16_Location
	Inst12Quest16_HORDE_Note = Inst12Quest16_Note
	Inst12Quest16_HORDE_Prequest = Inst12Quest16_Prequest
	Inst12Quest16_HORDE_Folgequest = Inst12Quest16_Folgequest
	--
	Inst12Quest16name1_HORDE = Inst12Quest16name1
	
	--Quest 17 Horde  (same as Quest 17 Alliance)
	Inst12Quest17_HORDE = Inst12Quest17
	Inst12Quest17_HORDE_Level = Inst12Quest17_Level
	Inst12Quest17_HORDE_Attain = Inst12Quest17_Attain
	Inst12Quest17_HORDE_Aim = Inst12Quest17_Aim
	Inst12Quest17_HORDE_Location = Inst12Quest17_Location
	Inst12Quest17_HORDE_Note = Inst12Quest17_Note
	Inst12Quest17_HORDE_Prequest = Inst12Quest17_Prequest
	Inst12Quest17_HORDE_Folgequest = Inst12Quest17_Folgequest
	-- No Rewards for this quest
	
	
	
	--------------- INST13 - Maraudon (Mara) ---------------
	Inst13Story = "Защищаемый свирепыми мародонскими кентаврами, Мародон является одим из самых священных мест в Пустошах. Великий храм-пещера служит местом последнего упокоения Зейтара, одного из двух бессмертных сыновей полубога Кенариуса. Легенда гласит, что Зейтар и принцесса духов стихии земли, Терадрас,  зачали незаконорожденную расу кентавров. Она также рассказывает о том, что появившись на свет, варвары-кентавры восстали против своего отца и убили его. Кое-кто верит, что Терадрас, полная скорби, заточила дух Зейтара в извилистых пещерах - используя его энергию для злых целей. Подземные тоннели, населенные злобными призраками давно умерших Ханов кентавров, а также яростными духами стихии, слугами Терадрас."
	Inst13Caption = "Мародон"
	Inst13QAA = "8 Заданий"
	Inst13QAH = "8 Заданий"
	
	--Quest 1 Alliance
	Inst13Quest1 = "1. Фрагменты осколка сумрака"
	Inst13Quest1_Level = "42"
	Inst13Quest1_Attain = "?"
	Inst13Quest1_Aim = "Соберите в Мародоне 10 фрагментов осколков сумрака и отнесите их верховному магу Тервошу в Терамор на побережье Пылевых топей."
	Inst13Quest1_Location = "Верховный маг Тервош (Пылевые топи - Остров Терамор; "..YELLOW.."66,49"..WHITE..")"
	Inst13Quest1_Note = "Вы получите фрагменты осколка сумрака с 'Темнокаменных грохотунов' или 'Темнокаменных крушителей' снаружи подземелья на Фиолетовой стороне."
	Inst13Quest1_Prequest = "Нет"
	Inst13Quest1_Folgequest = "Нет"
	--
	Inst13Quest1name1 = "Zealous Shadowshard Pendant"
	Inst13Quest1name2 = "Prodigious Shadowshard Pendant"
	
	--Quest 2 Alliance
	Inst13Quest2 = "2. Скверна Злоязыкого"
	Inst13Quest2_Level = "47"
	Inst13Quest2_Attain = "41"
	Inst13Quest2_Aim = "Наполните церуленовый фиал с покрытием в оранжевом пруду Мародона.\nПолейте гнусь-лозу из полного церуленового фиала, выгнав ядовитую лозу.\nИсцелите 8 растений, убивая ядовитые лозы, и вернитесь к Талендрии из Высоты Найджела."
	Inst13Quest2_Location = "Талендрия (Пустоши - Высота Найджела; "..YELLOW.."68,8"..WHITE..")"
	Inst13Quest2_Note = "Вы можете наполнить фиал в любом бассейне снаружи подземелья на Оранжевой стороне. Растения находятся в фиолетовой и оранжевой зонах внутри подземелья."
	Inst13Quest2_Prequest = "Нет"
	Inst13Quest2_Folgequest = "Нет"
	--
	Inst13Quest2name1 = "Woodseed Hoop"
	Inst13Quest2name2 = "Sagebrush Girdle"
	Inst13Quest2name3 = "Branchclaw Gauntlets"
	
	--Quest 3 Alliance
	Inst13Quest3 = "3. Хрустальные орнаменты"
	Inst13Quest3_Level = "47"
	Inst13Quest3_Attain = "41"
	Inst13Quest3_Aim = "Соберите 25 терадрических хрустальных орнаментов для Ивы из Пустошей."
	Inst13Quest3_Location = "Ива (Пустоши; "..YELLOW.."62,39"..WHITE..")"
	Inst13Quest3_Note = "С большинства существ в Мародоне падают орнаменты."
	Inst13Quest3_Prequest = "Нет"
	Inst13Quest3_Folgequest = "Нет"
	--
	Inst13Quest3name1 = "Acumen Robes"
	Inst13Quest3name2 = "Sprightring Helm"
	Inst13Quest3name3 = "Relentless Chain"
	Inst13Quest3name4 = "Hulkstone Pauldrons"
	
	--Quest 4 Horde
	Inst13Quest4 = "4. Инструкции кентавра-парии"
	Inst13Quest4_Level = "48"
	Inst13Quest4_Attain = "39"
	Inst13Quest4_Aim = "Прочтите инструкции кентавра-парии, добудьте из Мародона амулет Соединения и верните его кентавру-парии из южной части Пустошей."
	Inst13Quest4_Location = "Кентавр-пария (Пустоши; "..YELLOW.."45,86"..WHITE..")"
	Inst13Quest4_Note = "5 Ханов (Описание для инструкций парии)"
	Inst13Quest4_Prequest = "Нет"
	Inst13Quest4_Folgequest = "Нет"
	--
	Inst13Quest4name1 = "Mark of the Chosen"
	Inst13Quest4_Page = {2, "Вы найдете кентавра-парию в южных Пустошах. Он бродит между "..YELLOW.."44,85"..WHITE.." и "..YELLOW.."50,87"..WHITE..".\nСначала, Вам нужно убить Безымянного пророка. Вы найдете его перед тем, как войти в подземелье, перед точкой, где придется выбрать идти к Оранжевому или Фиолетовому входу. После него нужно убить 5 ханов. Второй - в Фиолетовой части Мародона, но перед входом в подземелье. Третий находится на Оранжевой стороне перед подземельем."};
	
	--Quest 5 Alliance
	Inst13Quest5 = "5. Легенды Мародона"
	Inst13Quest5_Level = "48"
	Inst13Quest5_Attain = "?"
	Inst13Quest5_Aim = "Добудьте две части скипетра Келебраса – жезл Келебраса и бриллиант Келебраса.\nНайдите способ поговорить с Келебрасом."
	Inst13Quest5_Location = "Кавиндра (Пустоши - Мародон; "..YELLOW.."[4] на карте входа"..WHITE..")"
	Inst13Quest5_Note = "Вы найдете Кавиндру в начале Оранжевой части перед подземельем.\nВы получите Келебрийский жезл с Ноксиона около "..YELLOW.."[2]"..WHITE..", а Келебрийский бриллиант с Лорда Злоязыкого  "..YELLOW.."[5]"..WHITE..". Келебрас находится около "..YELLOW.."[7]"..WHITE..". Вы должны победить его, чтобы поговорить."
	Inst13Quest5_Prequest = "Нет"
	Inst13Quest5_Folgequest = "Скипетр Келебраса"
	-- No Rewards for this quest
	
	--Quest 6 Alliance
	Inst13Quest6 = "6. Скипетр Келебраса"
	Inst13Quest6_Level = "49"
	Inst13Quest6_Attain = "?"
	Inst13Quest6_Aim = "Помогите Селебрасу Искупленному воссоздать скипетр Селебраса.\nПо завершении ритуала снова обратитесь к нему."
	Inst13Quest6_Location = "Селебрас Искупленный (Мародон; "..YELLOW.."[7]"..WHITE..")"
	Inst13Quest6_Note = "Келебрас создает Скипетр. Поговорите с ним, когда он закончит."
	Inst13Quest6_Prequest = "Легенды Мародона"
	Inst13Quest6_Folgequest = "Нет"
	--
	Inst13Quest6name1 = "Scepter of Celebras"
	
	--Quest 7 Alliance
	Inst13Quest7 = "7. Яблочко от яблоньки..."
	Inst13Quest7_Level = "51"
	Inst13Quest7_Attain = "?"
	Inst13Quest7_Aim = "Убейте принцессу Терадрас и вернитесь к хранителю Марандису на Высоту Найджела в Пустоши."
	Inst13Quest7_Location = "Хранитель Марандис (Пустоши - Высота Найджела; "..YELLOW.."63,10"..WHITE..")"
	Inst13Quest7_Note = "Вы найдете принцессу Терадрас около "..YELLOW.."[11]"..WHITE.."."
	Inst13Quest7_Prequest = "Нет"
	Inst13Quest7_Folgequest = "Семя Жизни"
	--
	Inst13Quest7name1 = "Thrash Blade"
	Inst13Quest7name2 = "Resurgence Rod"
	Inst13Quest7name3 = "Verdant Keeper's Aim"
	
	--Quest 8 Alliance
	Inst13Quest8 = "8. Семя Жизни"
	Inst13Quest8_Level = "51"
	Inst13Quest8_Attain = "?"
	Inst13Quest8_Aim = "Найдите в Лунной поляне Ремулоса и отдайте ему Семя Жизни."
	Inst13Quest8_Location = "Дух Зейтара (Мародон; "..YELLOW.."[11]"..WHITE..")"
	Inst13Quest8_Note = "Дух Зейтара появляется после убийства принцессы Терадрас "..YELLOW.."[11]"..WHITE..". Вы найдете хранителя Ремулоса около (Лунная поляна - Святилище Ремулоса; "..YELLOW.."36,41"..WHITE..")."
	Inst13Quest8_Prequest = "Яблочко от яблоньки..."
	Inst13Quest8_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 1 Horde
	Inst13Quest1_HORDE = "1. Фрагменты осколка сумрака"
	Inst13Quest1_HORDE_Level = "42"
	Inst13Quest1_HORDE_Attain = "?"
	Inst13Quest1_HORDE_Aim = "Соберите в Мародоне 10 фрагментов осколков сумрака и отнесите их Утель'наю в Оргриммар."
	Inst13Quest1_HORDE_Location = "Утель'най (Оргриммар - Аллея духов; "..YELLOW.."38,68"..WHITE..")"
	Inst13Quest1_HORDE_Note = "Вы получите фрагменты осколка сумрака с 'Темнокаменных грохотунов' или 'Темнокаменных крушителей' снаружи подземелья на Фиолетовой стороне."
	Inst13Quest1_HORDE_Prequest = "Нет"
	Inst13Quest1_HORDE_Folgequest = "Нет"
	--
	Inst13Quest1name1_HORDE = "Zealous Shadowshard Pendant"
	Inst13Quest1name2_HORDE = "Prodigious Shadowshard Pendant"
	
	--Quest 2 Horde
	Inst13Quest2_HORDE = "2. Скверна Злоязыкого"
	Inst13Quest2_HORDE_Level = "47"
	Inst13Quest2_HORDE_Attain = "41"
	Inst13Quest2_HORDE_Aim = "Наполните церуленовый фиал с покрытием в оранжевом пруду Мародона.\nПолейте гнусь-лозу из полного церуленового фиала, выгнав ядовитую лозу.\nИсцелите 8 растений, убивая ядовитые лозы, и вернитесь к Варку Боевому Шраму в Деревню Ночных Охотников."
	Inst13Quest2_HORDE_Location = "Варк Боевой Шрам (Пустоши - Деревня Ночных охотников; "..YELLOW.."23,70"..WHITE..")"
	Inst13Quest2_HORDE_Note = "Вы можете наполнить фиал в любом бассейне снаружи подземелья на Оранжевой стороне. Растения находятся в фиолетовой и оранжевой зонах внутри подземелья."
	Inst13Quest2_HORDE_Prequest = "Нет"
	Inst13Quest2_HORDE_Folgequest = "Нет"
	--
	Inst13Quest2name1_HORDE = "Woodseed Hoop"
	Inst13Quest2name2_HORDE = "Sagebrush Girdle"
	Inst13Quest2name3_HORDE = "Branchclaw Gauntlets"
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst13Quest3_HORDE = Inst13Quest3
	Inst13Quest3_HORDE_Level = Inst13Quest3_Level
	Inst13Quest3_HORDE_Attain = Inst13Quest3_Attain
	Inst13Quest3_HORDE_Aim = Inst13Quest3_Aim
	Inst13Quest3_HORDE_Location = Inst13Quest3_Location
	Inst13Quest3_HORDE_Note = Inst13Quest3_Note
	Inst13Quest3_HORDE_Prequest = Inst13Quest3_Prequest
	Inst13Quest3_HORDE_Folgequest = Inst13Quest3_Folgequest
	--
	Inst13Quest3name1_HORDE = Inst13Quest3name1
	Inst13Quest3name2_HORDE = Inst13Quest3name2
	Inst13Quest3name3_HORDE = Inst13Quest3name3
	Inst13Quest3name4_HORDE = Inst13Quest3name4
	
	--Quest 4 Horde  (same as Quest 4 Alliance)
	Inst13Quest4_HORDE = Inst13Quest4
	Inst13Quest4_HORDE_Level = Inst13Quest4_Level
	Inst13Quest4_HORDE_Attain = Inst13Quest4_Attain
	Inst13Quest4_HORDE_Aim = Inst13Quest4_Aim
	Inst13Quest4_HORDE_Location = Inst13Quest4_Location
	Inst13Quest4_HORDE_Note = Inst13Quest4_Note
	Inst13Quest4_HORDE_Prequest = Inst13Quest4_Prequest
	Inst13Quest4_HORDE_Folgequest = Inst13Quest4_Folgequest
	--
	Inst13Quest4name1_HORDE = Inst13Quest4name1
	
	--Quest 5 Horde  (same as Quest 5 Alliance)
	Inst13Quest5_HORDE = Inst13Quest5
	Inst13Quest5_HORDE_Level = Inst13Quest5_Level
	Inst13Quest5_HORDE_Attain = Inst13Quest5_Attain
	Inst13Quest5_HORDE_Aim = Inst13Quest5_Aim
	Inst13Quest5_HORDE_Location = Inst13Quest5_Location
	Inst13Quest5_HORDE_Note = Inst13Quest5_Note
	Inst13Quest5_HORDE_Prequest = Inst13Quest5_Prequest
	Inst13Quest5_HORDE_Folgequest = Inst13Quest5_Folgequest
	-- No Rewards for this quest
	
	--Quest 6 Horde  (same as Quest 6 Alliance)
	Inst13Quest6_HORDE = Inst13Quest6
	Inst13Quest6_HORDE_Level = Inst13Quest6_Level
	Inst13Quest6_HORDE_Attain = Inst13Quest6_Attain
	Inst13Quest6_HORDE_Aim = Inst13Quest6_Aim
	Inst13Quest6_HORDE_Location = Inst13Quest6_Location
	Inst13Quest6_HORDE_Note = Inst13Quest6_Note
	Inst13Quest6_HORDE_Prequest = Inst13Quest6_Prequest
	Inst13Quest6_HORDE_Folgequest = Inst13Quest6_Folgequest
	--
	Inst13Quest6name1_HORDE = Inst13Quest6name1
	
	--Quest 7 Horde
	Inst13Quest7_HORDE = "7. Яблочко от яблоньки..."
	Inst13Quest7_HORDE_Level = "51"
	Inst13Quest7_HORDE_Attain = "?"
	Inst13Quest7_HORDE_Aim = "Убейте принцессу Терадрас и вернитесь к Селендре неподалеку от Деревни Ночных Охотников в Пустошах."
	Inst13Quest7_HORDE_Location = "Селендра (Пустоши; "..YELLOW.."27,77"..WHITE..")"
	Inst13Quest7_HORDE_Note = "Вы найдете принцессу Терадрас около "..YELLOW.."[11]"..WHITE.."."
	Inst13Quest7_HORDE_Prequest = "Нет"
	Inst13Quest7_HORDE_Folgequest = "Семя Жизни"
	--
	Inst13Quest7name1_HORDE = "Thrash Blade"
	Inst13Quest7name2_HORDE = "Resurgence Rod"
	Inst13Quest7name3_HORDE = "Verdant Keeper's Aim"
	
	--Quest 8 Horde  (same as Quest 8 Alliance)
	Inst13Quest8_HORDE = Inst13Quest8
	Inst13Quest8_HORDE_Level = Inst13Quest8_Level
	Inst13Quest8_HORDE_Attain = Inst13Quest8_Attain
	Inst13Quest8_HORDE_Aim = Inst13Quest8_Aim
	Inst13Quest8_HORDE_Location = Inst13Quest8_Location
	Inst13Quest8_HORDE_Note = Inst13Quest8_Note
	Inst13Quest8_HORDE_Prequest = Inst13Quest8_Prequest
	Inst13Quest8_HORDE_Folgequest = Inst13Quest8_Folgequest
	-- No Rewards for this quest
	
	
	
	--------------- INST14 - Molten Core (MC) ---------------
	Inst14Story = "В глубинах Черной горы лежат Огненные Недра. Именно здесь, в сердце Черной горы, не в силах совладать с гражданской войной среди дворфов, император Таурисан привел в наш мир Повелителя Огня, Рагнароса. Хотя Повелитель Огня не может удалиться от пылающих Недр, говорят, что дворфы из клана Темной Стали находятся под властью его духов-приспешников, собирающих армию созданий из ожившего камня. Пылающее озеро, в котором спит Рагнарос, служит вратами в обитель стихий огня, через которые и пробираются в наш мир зловредные духи стихий. Первый среди прислужников Рагнароса — Мажордом Экзекутус. Этот коварный гуманоид — единственный, кто может пробудить Повелителя Огня от сна."
	Inst14Caption = "Огненные Недра"
	Inst14QAA = "7 Заданий"
	Inst14QAH = "7 Заданий"
	
	--Quest 1 Alliance
	Inst14Quest1 = "1. The Molten Core"
	Inst14Quest1_Level = "60"
	Inst14Quest1_Attain = "58"
	Inst14Quest1_Aim = "Kill 1 Fire Lord, 1 Molten Giant, 1 Ancient Core Hound and 1 Lava Surger, then return to Duke Hydraxis in Azshara."
	Inst14Quest1_Location = "Duke Hydraxis (Azshara; "..YELLOW.."79,73"..WHITE..")"
	Inst14Quest1_Note = "These are non-bosses inside Molten Core."
	Inst14Quest1_Prequest = "Eye of the Emberseer ("..YELLOW.."Вершина Черной горы"..WHITE..")"
	Inst14Quest1_Folgequest = "Agent of Hydraxis"
	-- No Rewards for this quest
	
	--Quest 2 Alliance
	Inst14Quest2 = "2. Hands of the Enemy"
	Inst14Quest2_Level = "60"
	Inst14Quest2_Attain = "60"
	Inst14Quest2_Aim = "Bring the Hands of Lucifron, Sulfuron, Gehennas and Shazzrah to Duke Hydraxis in Azshara."
	Inst14Quest2_Location = "Duke Hydraxis (Azshara; "..YELLOW.."79,73"..WHITE..")"
	Inst14Quest2_Note = "Lucifron is at "..YELLOW.."[1]"..WHITE..", Sulfuron is at "..YELLOW.."[8]"..WHITE..", Gehennas is at "..YELLOW.."[3]"..WHITE.." and Shazzrah is at "..YELLOW.."[5]"..WHITE.."."
	Inst14Quest2_Prequest = "Agent of Hydraxis"
	Inst14Quest2_Folgequest = "A Hero's Reward"
	-- No Rewards for this quest
	
	--Quest 3 Alliance
	Inst14Quest3 = "3. Thunderaan the Windseeker"
	Inst14Quest3_Level = "60"
	Inst14Quest3_Attain = "60"
	Inst14Quest3_Aim = "To free Thunderaan the Windseeker from his prison, you must present the right and left halves of the Bindings of the Windseeker, 10 bars of Elementium, and the Essence of the Firelord to Highlord Demitrian in Silithus."
	Inst14Quest3_Location = "Highlord Demitrian (Silithus; "..YELLOW.."22,9"..WHITE..")"
	Inst14Quest3_Note = "Part of the Thunderfury, Blessed Blade of the Windseeker questline. It starts after obtaining either the left or right Bindings of the Windseeker from Garr at "..YELLOW.."[4]"..WHITE.." or Baron Geddon at "..YELLOW.."[6]"..WHITE..". Then talk to Highlord Demitrian to start the questline. Essence of the Firelord drops from Ragnaros at "..YELLOW.."[10]"..WHITE..". After turning this part in, Prince Thunderaan is summoned and you must kill him. He's a 40-man raid boss."
	Inst14Quest3_Prequest = "Examine the Vessel"
	Inst14Quest3_Folgequest = "Rise, Thunderfury!"
	-- No Rewards for this quest
	
	--Quest 4 Alliance
	Inst14Quest4 = "4. A Binding Contract"
	Inst14Quest4_Level = "60"
	Inst14Quest4_Attain = "60"
	Inst14Quest4_Aim = "Turn the Thorium Brotherhood Contract in to Lokhtos Darkbargainer if you would like to receive the plans for Sulfuron."
	Inst14Quest4_Location = "Lokhtos Darkbargainer (Blackrock Depths; "..YELLOW.."[15]"..WHITE..")"
	Inst14Quest4_Note = "You need a Sulfuron Ingot to get the contract from Lokhtos. They drop from Golemagg the Incinerator in Molten Core at "..YELLOW.."[7]"..WHITE.."."
	Inst14Quest4_Prequest = "Нет"
	Inst14Quest4_Folgequest = "Нет"
	--
	Inst14Quest4name1 = "Plans: Sulfuron Hammer"
	
	--Quest 5 Alliance
	Inst14Quest5 = "5. The Ancient Leaf"
	Inst14Quest5_Level = "60"
	Inst14Quest5_Attain = "60"
	Inst14Quest5_Aim = "Find the owner of the Ancient Petrified Leaf."
	Inst14Quest5_Location = "Ancient Petrified Leaf (drops from Cache of the Firelord; "..YELLOW.."[9]"..WHITE..")"
	Inst14Quest5_Note = "Turns in to Vartrus the Ancient at (Felwood - Irontree Woods; "..YELLOW.."49,24"..WHITE..")."
	Inst14Quest5_Prequest = "Нет"
	Inst14Quest5_Folgequest = "Ancient Sinew Wrapped Lamina ("..YELLOW.."Azuregos"..WHITE..")"
	-- No Rewards for this quest
	
	--Quest 6 Alliance
	Inst14Quest6 = "6. The Only Prescription"
	Inst14Quest6_Level = "60"
	Inst14Quest6_Attain = "60"
	Inst14Quest6_Aim = "Recover the 8 lost chapters of Draconic for Dummies and combine them with the Magical Book Binding and return the completed book of Draconic for Dummies: Volume II to Narain Soothfancy in Tanaris. "
	Inst14Quest6_Location = "Narain Soothfancy (Tanaris; "..YELLOW.."65,18"..WHITE..")"
	Inst14Quest6_Note = "Only one person can loot the Chapter. Draconic for Dummies VIII (drops from Ragnaros; "..YELLOW.."[10]"..WHITE..")"
	Inst14Quest6_Prequest = "Decoy!"
	Inst14Quest6_Folgequest = "The Good News and The Bad News (Must complete Stewvul, Ex-B.F.F. and Never Ask Me About My Business quest chains)"
	--
	Inst14Quest6name1 = "Gnomish Turban of Psychic Might"
	
	--Quest 7 Alliance
	Inst14Quest7 = "7. Scrying Goggles? No Problem!"
	Inst14Quest7_Level = "60"
	Inst14Quest7_Attain = "60"
	Inst14Quest7_Aim = "Find Narain's Scrying Goggles and return them to Narain Soothfancy in Tanaris. "
	Inst14Quest7_Location = "Narain Soothfancy (Tanaris; "..YELLOW.."65,18"..WHITE..")"
	Inst14Quest7_Note = "Drops from trash."
	Inst14Quest7_Prequest = "Stewvul, Ex-B.F.F."
	Inst14Quest7_Folgequest = "The Good News and The Bad News (Must complete Draconic for Dummies and Never Ask Me About My Business quest chains)"
	--
	Inst14Quest7name1 = "Major Rejuvenation Potion"
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst14Quest1_HORDE = Inst14Quest1
	Inst14Quest1_HORDE_Level = Inst14Quest1_Level
	Inst14Quest1_HORDE_Attain = Inst14Quest1_Attain
	Inst14Quest1_HORDE_Aim = Inst14Quest1_Aim
	Inst14Quest1_HORDE_Location = Inst14Quest1_Location
	Inst14Quest1_HORDE_Note = Inst14Quest1_Note
	Inst14Quest1_HORDE_Prequest = Inst14Quest1_Prequest
	Inst14Quest1_HORDE_Folgequest = Inst14Quest1_Folgequest
	-- No Rewards for this quest
	
	--Quest 2 Horde  (same as Quest 2 Alliance)
	Inst14Quest2_HORDE = Inst14Quest2
	Inst14Quest2_HORDE_Level = Inst14Quest2_Level
	Inst14Quest2_HORDE_Attain = Inst14Quest2_Attain
	Inst14Quest2_HORDE_Aim = Inst14Quest2_Aim
	Inst14Quest2_HORDE_Location = Inst14Quest2_Location
	Inst14Quest2_HORDE_Note = Inst14Quest2_Note
	Inst14Quest2_HORDE_Prequest = Inst14Quest2_Prequest
	Inst14Quest2_HORDE_Folgequest = Inst14Quest2_Folgequest
	-- No Rewards for this quest
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst14Quest3_HORDE = Inst14Quest3
	Inst14Quest3_HORDE_Level = Inst14Quest3_Level
	Inst14Quest3_HORDE_Attain = Inst14Quest3_Attain
	Inst14Quest3_HORDE_Aim = Inst14Quest3_Aim
	Inst14Quest3_HORDE_Location = Inst14Quest3_Location
	Inst14Quest3_HORDE_Note = Inst14Quest3_Note
	Inst14Quest3_HORDE_Prequest = Inst14Quest3_Prequest
	Inst14Quest3_HORDE_Folgequest = Inst14Quest3_Folgequest
	-- No Rewards for this quest
	
	--Quest 4 Horde  (same as Quest 4 Alliance)
	Inst14Quest4_HORDE = Inst14Quest4
	Inst14Quest4_HORDE_Level = Inst14Quest4_Level
	Inst14Quest4_HORDE_Attain = Inst14Quest4_Attain
	Inst14Quest4_HORDE_Aim = Inst14Quest4_Aim
	Inst14Quest4_HORDE_Location = Inst14Quest4_Location
	Inst14Quest4_HORDE_Note = Inst14Quest4_Note
	Inst14Quest4_HORDE_Prequest = Inst14Quest4_Prequest
	Inst14Quest4_HORDE_Folgequest = Inst14Quest4_Folgequest
	--
	Inst14Quest4name1_HORDE = Inst14Quest4name1
	
	--Quest 5 Horde  (same as Quest 5 Alliance)
	Inst14Quest5_HORDE = Inst14Quest5
	Inst14Quest5_HORDE_Level = Inst14Quest5_Level
	Inst14Quest5_HORDE_Attain = Inst14Quest5_Attain
	Inst14Quest5_HORDE_Aim = Inst14Quest5_Aim
	Inst14Quest5_HORDE_Location = Inst14Quest5_Location
	Inst14Quest5_HORDE_Note = Inst14Quest5_Note
	Inst14Quest5_HORDE_Prequest = Inst14Quest5_Prequest
	Inst14Quest5_HORDE_Folgequest = Inst14Quest5_Folgequest
	-- No Rewards for this quest
	
	--Quest 6 Horde
	Inst14Quest6_HORDE = "6. The Only Prescription"
	Inst14Quest6_HORDE_Level = "60"
	Inst14Quest6_HORDE_Attain = "60"
	Inst14Quest6_HORDE_Aim = "Recover the 8 lost chapters of Draconic for Dummies and combine them with the Magical Book Binding and return the completed book of Draconic for Dummies: Volume II to Narain Soothfancy in Tanaris. "
	Inst14Quest6_HORDE_Location = "Narain Soothfancy (Tanaris; "..YELLOW.."65,18"..WHITE..")"
	Inst14Quest6_HORDE_Note = "Only one person can loot the Chapter. Draconic for Dummies VIII (drops from Ragnaros; "..YELLOW.."[10]"..WHITE..")"
	Inst14Quest6_HORDE_Prequest = "Decoy!"
	Inst14Quest6_HORDE_Folgequest = "The Good News and The Bad News (Must complete Stewvul, Ex-B.F.F. and Never Ask Me About My Business quest chains)"
	--
	Inst14Quest6name1_HORDE = "Gnomish Turban of Psychic Might"
	
	--Quest 7 Horde
	Inst14Quest7_HORDE = "7. Scrying Goggles? No Problem!"
	Inst14Quest7_HORDE_Level = "60"
	Inst14Quest7_HORDE_Attain = "60"
	Inst14Quest7_HORDE_Aim = "Find Narain's Scrying Goggles and return them to Narain Soothfancy in Tanaris. "
	Inst14Quest7_HORDE_Location = "Narain Soothfancy (Tanaris; "..YELLOW.."65,18"..WHITE..")"
	Inst14Quest7_HORDE_Note = "Drops from trash."
	Inst14Quest7_HORDE_Prequest = "Stewvul, Ex-B.F.F."
	Inst14Quest7_HORDE_Folgequest = "The Good News and The Bad News (Must complete Draconic for Dummies and Never Ask Me About My Business quest chains)"
	--
	Inst14Quest7name1_HORDE = "Major Rejuvenation Potion"
	
	
	--------------- INST15 - Naxxramas (Naxx) ---------------
	Inst15Story = "Над Чумными землями парит некрополь Наксрамас — цитадель одного из самых могущественных сподручных Короля-лича, страшного лича Кел'Тузада. Подданные Короля-лича готовят нападение, и в стенах мертвого города собираются страшные призраки прошлого и новые ужасы…"
	Inst15Caption = "Наксрамас"
	Inst15QAA = "5 Заданий"
	Inst15QAH = "5 Заданий"
	
	--Quest 1 Alliance
	Inst15Quest1 = "1. The Fall of Kel'Thuzad"
	Inst15Quest1_Level = "60"
	Inst15Quest1_Attain = "60"
	Inst15Quest1_Aim = "Take the Phylactery of Kel'Thuzad to Light's Hope Chapel in the Eastern Plaguelands."
	Inst15Quest1_Location = "Kel'Thuzad (Naxxramas; "..YELLOW.."Green 2"..WHITE..")"
	Inst15Quest1_Note = "Father Inigo Montoy (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."81,58"..WHITE..")"
	Inst15Quest1_Prequest = "Нет"
	Inst15Quest1_Folgequest = "Нет"
	--
	Inst15Quest1name1 = "Mark of the Champion"
	Inst15Quest1name2 = "Mark of the Champion"
	
	--Quest 2 Alliance
	Inst15Quest2 = "2. The Only Song I Know..."
	Inst15Quest2_Level = "60"
	Inst15Quest2_Attain = "60"
	Inst15Quest2_Aim = "Craftsman Wilhelm at Light's Hope Chapel in the Eastern Plaguelands wants you to bring him 2 Frozen Runes, 2 Essence of Water, 2 Blue Sapphires and 30 gold pieces."
	Inst15Quest2_Location = "Craftsman Wilhelm (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."81,60"..WHITE..")"
	Inst15Quest2_Note = "Frozen Runes come from Unholy Axes in Naxxramas."
	Inst15Quest2_Prequest = "Нет"
	Inst15Quest2_Folgequest = "Нет"
	--
	Inst15Quest2name1 = "Glacial Leggings"
	Inst15Quest2name2 = "Icebane Leggings"
	Inst15Quest2name3 = "Icy Scale Leggings"
	Inst15Quest2name4 = "Polar Leggings"
	
	--Quest 3 Alliance
	Inst15Quest3 = "3. Echoes of War"
	Inst15Quest3_Level = "60"
	Inst15Quest3_Attain = "60"
	Inst15Quest3_Aim = "Commander Eligor Dawnbringer at Light's Hope Chapel in the Eastern Plaguelands wants you to slay 5 Living Monstrosities, 5 Stoneskin Gargoyles, 8 Deathknight Captains and 3 Venom Stalkers."
	Inst15Quest3_Location = "Commander Eligor Dawnbringer (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."82,58"..WHITE..")"
	Inst15Quest3_Note = "The mobs for this quest are trash mobs at the beginning of each wing of Naxxramas. This quest is a pre-requisite for the Tier 3 armor quests."
	Inst15Quest3_Prequest = "Нет"
	Inst15Quest3_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 4 Alliance
	Inst15Quest4 = "4. The Fate of Ramaladni"
	Inst15Quest4_Level = "60"
	Inst15Quest4_Attain = "60"
	Inst15Quest4_Aim = "Enter Naxxramas and uncover the Fate of Ramaladni."
	Inst15Quest4_Location = "Korfax, Champion of the Light (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."82,58"..WHITE..")"
	Inst15Quest4_Note = "A ring for this quest will drop off a random mob in Naxxramas. Everyone who has the quest can pick it up."
	Inst15Quest4_Prequest = "Нет"
	Inst15Quest4_Folgequest = "Ramaladni's Icy Grasp"
	-- No Rewards for this quest
	
	--Quest 5 Alliance
	Inst15Quest5 = "5. Ramaladni's Icy Grasp"
	Inst15Quest5_Level = "60"
	Inst15Quest5_Attain = "60"
	Inst15Quest5_Aim = "Korfax at Light's Hope Chapel in the Eastern Plaguelands wants you to bring him 1 Frozen Rune, 1 Blue Sapphire and 1 Arcanite Bar."
	Inst15Quest5_Location = "Korfax, Champion of the Light (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."82,58"..WHITE..")"
	Inst15Quest5_Note = "Frozen Runes come from Unholy Axes in Naxxramas."
	Inst15Quest5_Prequest = "The Fate of Ramaladni"
	Inst15Quest5_Folgequest = "Нет"
	--
	Inst15Quest5name1 = "Ramaladni's Icy Grasp"
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst15Quest1_HORDE = Inst15Quest1
	Inst15Quest1_HORDE_Level = Inst15Quest1_Level
	Inst15Quest1_HORDE_Attain = Inst15Quest1_Attain
	Inst15Quest1_HORDE_Aim = Inst15Quest1_Aim
	Inst15Quest1_HORDE_Location = Inst15Quest1_Location
	Inst15Quest1_HORDE_Note = Inst15Quest1_Note
	Inst15Quest1_HORDE_Prequest = Inst15Quest1_Prequest
	Inst15Quest1_HORDE_Folgequest = Inst15Quest1_Folgequest
	--
	Inst15Quest1name1_HORDE = Inst15Quest1name1
	Inst15Quest1name2_HORDE = Inst15Quest1name2
	Inst15Quest1name3_HORDE = Inst15Quest1name3
	
	--Quest 2 Horde  (same as Quest 2 Alliance)
	Inst15Quest2_HORDE = Inst15Quest2
	Inst15Quest2_HORDE_Level = Inst15Quest2_Level
	Inst15Quest2_HORDE_Attain = Inst15Quest2_Attain
	Inst15Quest2_HORDE_Aim = Inst15Quest2_Aim
	Inst15Quest2_HORDE_Location = Inst15Quest2_Location
	Inst15Quest2_HORDE_Note = Inst15Quest2_Note
	Inst15Quest2_HORDE_Prequest = Inst15Quest2_Prequest
	Inst15Quest2_HORDE_Folgequest = Inst15Quest2_Folgequest
	--
	Inst15Quest2name1_HORDE = Inst15Quest2name1
	Inst15Quest2name2_HORDE = Inst15Quest2name2
	Inst15Quest2name3_HORDE = Inst15Quest2name3
	Inst15Quest2name4_HORDE = Inst15Quest2name4
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst15Quest3_HORDE = Inst15Quest3
	Inst15Quest3_HORDE_Level = Inst15Quest3_Level
	Inst15Quest3_HORDE_Attain = Inst15Quest3_Attain
	Inst15Quest3_HORDE_Aim = Inst15Quest3_Aim
	Inst15Quest3_HORDE_Location = Inst15Quest3_Location
	Inst15Quest3_HORDE_Note = Inst15Quest3_Note
	Inst15Quest3_HORDE_Prequest = Inst15Quest3_Prequest
	Inst15Quest3_HORDE_Folgequest = Inst15Quest3_Folgequest
	-- No Rewards for this quest
	
	--Quest 4 Horde  (same as Quest 4 Alliance)
	Inst15Quest4_HORDE = Inst15Quest4
	Inst15Quest4_HORDE_Level = Inst15Quest4_Level
	Inst15Quest4_HORDE_Attain = Inst15Quest4_Attain
	Inst15Quest4_HORDE_Aim = Inst15Quest4_Aim
	Inst15Quest4_HORDE_Location = Inst15Quest4_Location
	Inst15Quest4_HORDE_Note = Inst15Quest4_Note
	Inst15Quest4_HORDE_Prequest = Inst15Quest4_Prequest
	Inst15Quest4_HORDE_Folgequest = Inst15Quest4_Folgequest
	-- No Rewards for this quest
	
	--Quest 5 Horde  (same as Quest 5 Alliance)
	Inst15Quest5_HORDE = Inst15Quest5
	Inst15Quest5_HORDE_Level = Inst15Quest5_Level
	Inst15Quest5_HORDE_Attain = Inst15Quest5_Attain
	Inst15Quest5_HORDE_Aim = Inst15Quest5_Aim
	Inst15Quest5_HORDE_Location = Inst15Quest5_Location
	Inst15Quest5_HORDE_Note = Inst15Quest5_Note
	Inst15Quest5_HORDE_Prequest = Inst15Quest5_Prequest
	Inst15Quest5_HORDE_Folgequest = Inst15Quest5_Folgequest
	--
	Inst15Quest5name1_HORDE = Inst15Quest5name1
	
	
	
	--------------- INST16 - Onyxia's Lair (Ony) ---------------
	Inst16Story = "Ониксия — дочь могущественного дракона Смертокрыла и сестра злокозненного Нефариана, который властвует над Пиком Черной горы. Об Ониксии известно, что ничто ей так не мило, как совращать смертных, вмешиваясь в их политические дела. Поэтому существует поверие, что она часто принимает человеческий облик и появляется там, где решается какая-нибудь запутанная ситуация между расами: она туманит собеседникам разум и понуждает их действовать по своей указке. Иногда говорят даже, что Ониксии как-то раз случилось выдавать себя за представительницу рода Престор, — как в свое время и ее отцу. Когда Ониксии не до дел смертных, она укрывается в огненном подземном логове в Земле Драконов, в мертвенного вида болоте в Пылевых топях. Там ее охраняют соплеменники — те, кто уцелел из клана коварных черных драконов."
	Inst16Caption = "Логово Ониксии"
	Inst16QAA = "3 Задания"
	Inst16QAH = "3 Задания"
	
	--Quest 1 Alliance
	Inst16Quest1 = "1. The Forging of Quel'Serrar"
	Inst16Quest1_Level = "60"
	Inst16Quest1_Attain = "60"
	Inst16Quest1_Aim = "You must get Onyxia to breathe fire on the Unfired Ancient Blade. Once this is done, pick up the now Heated Ancient Blade. Be warned, a Heated Ancient Blade will not remain heated forever - time is of the essence."
	Inst16Quest1_Location = "Lorekeeper Lydros (Dire Maul West; "..YELLOW.."[1] Library"..WHITE..")"
	Inst16Quest1_Note = "Drop the Sword in front of Onyxia when she's at 10% to 15% health. She'll have to breathe on and heat it. When Onyxia dies, pick the sword back up, click her corpse and use the sword. Then you're ready to turn in the quest."
	Inst16Quest1_Prequest = "Foror's Compendium ("..YELLOW.."Dire Maul West"..WHITE..") -> The Forging of Quel'Serrar"
	Inst16Quest1_Folgequest = "Нет"
	--
	Inst16Quest1name1 = "Quel'Serrar"
	
	--Quest 2 Alliance
	Inst16Quest2 = "2. Victory for the Alliance"
	Inst16Quest2_Level = "60"
	Inst16Quest2_Attain = "60"
	Inst16Quest2_Aim = "Take the Head of Onyxia to Highlord Bolvar Fordragon in Stormwind."
	Inst16Quest2_Location = "Head of Onyxia (drops from Onyxia; "..YELLOW.."[3]"..WHITE..")"
	Inst16Quest2_Note = "Highlord Bolvar Fordragon is at (Stormwind City - Stormwind Keep; "..YELLOW.."78,20"..WHITE.."). Only one person in the raid can loot this item and the quest can only be done one time.\n\nRewards listed are for the followup."
	Inst16Quest2_Prequest = "Нет"
	Inst16Quest2_Folgequest = "Celebrating Good Times"
	--
	Inst16Quest2name1 = "Onyxia Blood Talisman"
	Inst16Quest2name2 = "Dragonslayer's Signet"
	Inst16Quest2name3 = "Onyxia Tooth Pendant"
	
	--Quest 3 Alliance
	Inst16Quest3 = "3. The Only Prescription"
	Inst16Quest3_Level = "60"
	Inst16Quest3_Attain = "60"
	Inst16Quest3_Aim = "Recover the 8 lost chapters of Draconic for Dummies and combine them with the Magical Book Binding and return the completed book of Draconic for Dummies: Volume II to Narain Soothfancy in Tanaris. "
	Inst16Quest3_Location = "Narain Soothfancy (Tanaris; "..YELLOW.."65,18"..WHITE..")".."Draconic for Dummies (drops from Onyxia; "..YELLOW.."[3]"..WHITE..")"
	Inst16Quest3_Note = "Only one person can loot the Chapter. Draconic for Dummies VI (drops from Onyxia; "..YELLOW.."[3]"..WHITE..")"
	Inst16Quest3_Prequest = "Decoy!"
	Inst16Quest3_Folgequest = "The Good News and The Bad News (Must complete Stewvul, Ex-B.F.F. and Never Ask Me About My Business quest chains)"
	--
	Inst16Quest3name1 = "Gnomish Turban of Psychic Might"
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst16Quest1_HORDE = Inst16Quest1
	Inst16Quest1_HORDE_Attain = Inst16Quest1_Attain
	Inst16Quest1_HORDE_Level = Inst16Quest1_Level
	Inst16Quest1_HORDE_Aim = Inst16Quest1_Aim
	Inst16Quest1_HORDE_Location = Inst16Quest1_Location
	Inst16Quest1_HORDE_Note = Inst16Quest1_Note
	Inst16Quest1_HORDE_Prequest = Inst16Quest1_Prequest
	Inst16Quest1_HORDE_Folgequest = Inst16Quest1_Folgequest
	--
	Inst16Quest1name1_HORDE = Inst16Quest1name1
	
	--Quest 2 Horde
	Inst16Quest2_HORDE = "2. Victory for the Horde"
	Inst16Quest2_HORDE_Level = "60"
	Inst16Quest2_HORDE_Attain = "60"
	Inst16Quest2_HORDE_Aim = "Take the Head of Onyxia to Thrall in Orgrimmar."
	Inst16Quest2_HORDE_Location = "Head of Onyxia (drops from Onyxia; "..YELLOW.."[3]"..WHITE..")"
	Inst16Quest2_HORDE_Note = "Thrall is at (Orgrimmar - Valley of Wisdom; "..YELLOW.."31,37"..WHITE.."). Only one person in the raid can loot this item and the quest can only be done one time.\n\nRewards listed are for the followup."
	Inst16Quest2_HORDE_Prequest = "Нет"
	Inst16Quest2_HORDE_Folgequest = "For All To See"
	--
	Inst16Quest2name1_HORDE = "Onyxia Blood Talisman"
	Inst16Quest2name2_HORDE = "Dragonslayer's Signet"
	Inst16Quest2name3_HORDE = "Onyxia Tooth Pendant"
	
	--Quest 3 Horde (same as Quest 3 Alliance)
	Inst16Quest3_HORDE = Inst16Quest3
	Inst16Quest3_HORDE_Attain = Inst16Quest3_Attain
	Inst16Quest3_HORDE_Level = Inst16Quest3_Level
	Inst16Quest3_HORDE_Aim = Inst16Quest3_Aim
	Inst16Quest3_HORDE_Location = Inst16Quest3_Location
	Inst16Quest3_HORDE_Note = Inst16Quest3_Note
	Inst16Quest3_HORDE_Prequest = Inst16Quest3_Prequest
	Inst16Quest3_HORDE_Folgequest = Inst16Quest3_Folgequest
	--
	Inst16Quest3name1_HORDE = Inst16Quest3name1
	
	
	
	--------------- INST17 - Razorfen Downs (RFD) ---------------
	Inst17Story = "Курганы Иглошкурых – столица расы свинобразов, построенная по образцу лабиринтов. В них живет племя Мертвой Головы – целая армия преданных свинобразов, возглавляемых верховными жрецами. Однако сейчас над их обителью сгустилась тьма. Армия Плети под предводительством лича Амненнара Хладовея подчинила иглогривов своей воле и превратила их город в цитадель нежити. Теперь свинобразы сражаются из последних сил, чтобы отвоевать любимый город, пока Амненнар не покорил все Степи."
	Inst17Caption = "Курганы Иглошкурых"
	Inst17QAA = "3 Задания"
	Inst17QAH = "4 Задания"
	
	--Quest 1 Alliance
	Inst17Quest1 = "1. Воинство зла"
	Inst17Quest1_Level = "35"
	Inst17Quest1_Attain = "30"
	Inst17Quest1_Aim = "Убейте 8 боевых стражей и 8 терноплетов из племени Иглошкурых, а также 8 сектанток из племени Мертвой Головы и возвращайтесь к Мириам Лунной Певице на Курганы Иглошкурых."
	Inst17Quest1_Location = "Мириам Лунная Певица (Степи; "..YELLOW.."49,94"..WHITE..")"
	Inst17Quest1_Note = "Вы сможете найти мобов и дающую задание в зоне перед самым входом в подземелье."
	Inst17Quest1_Prequest = "Нет"
	Inst17Quest1_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 2 Alliance
	Inst17Quest2 = "2. Уничтожить идола"
	Inst17Quest2_Level = "37"
	Inst17Quest2_Attain = "34"
	Inst17Quest2_Aim = "Сопроводите Белнистраза к идолу свинобразов на Курганах Иглошкурых. Защищайте Белнистраза, пока он будет проводить ритуал, чтобы разрушить идола."
	Inst17Quest2_Location = "Белнистраз (Курганы Иглошкурых; "..YELLOW.."[2]"..WHITE..")"
	Inst17Quest2_Note = "Предшествующее задание заключается просто в согласии помочь ему. Несколько мобов появятся и атакуют Белнистраза когда он попытается сломать идол. После выполнения, вы можете сдать задание у жаровни перед идолом."
	Inst17Quest2_Prequest = "Плеть в холмах"
	Inst17Quest2_Folgequest = "Нет"
	--
	Inst17Quest2name1 = "Dragonclaw Ring"
	
	--Quest 3 Alliance
	Inst17Quest3 = "3. Светоприношение"
	Inst17Quest3_Attain = "39"
	Inst17Quest3_Level = "42"
	Inst17Quest3_Aim = "Убейте Амненнара Хладовея на Курганах Иглошкурых."
	Inst17Quest3_Location = "Архиепископ Бенедикт (Штормград - Собор Света; "..YELLOW.."39,27"..WHITE..")"
	Inst17Quest3_Note = "Амненнар Хладовей это последний босс в Курганах Иглошкурых. Вы найдете его около "..YELLOW.."[6]"..WHITE.."."
	Inst17Quest3_Prequest = "Нет"
	Inst17Quest3_Folgequest = "Нет"
	--
	Inst17Quest3name1 = "Vanquisher's Sword"
	Inst17Quest3name2 = "Amberglow Talisman"
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst17Quest1_HORDE = Inst17Quest1
	Inst17Quest1_HORDE_Level = Inst17Quest1_Level
	Inst17Quest1_HORDE_Attain = Inst17Quest1_Attain
	Inst17Quest1_HORDE_Aim = Inst17Quest1_Aim
	Inst17Quest1_HORDE_Location = Inst17Quest1_Location
	Inst17Quest1_HORDE_Note = Inst17Quest1_Note
	Inst17Quest1_HORDE_Prequest = Inst17Quest1_Prequest
	Inst17Quest1_HORDE_Folgequest = Inst17Quest1_Folgequest
	-- No Rewards for this quest
	
	--Quest 2 Horde
	Inst17Quest2_HORDE = "2. Нечестивый союз"
	Inst17Quest2_HORDE_Level = "36"
	Inst17Quest2_HORDE_Attain = "?"
	Inst17Quest2_HORDE_Aim = "Принести голову посла Малкина Вариматасу в Подгород."
	Inst17Quest2_HORDE_Location = "Вариматас (Подгород - Королевский квартал; "..YELLOW.."56,92"..WHITE..")"
	Inst17Quest2_HORDE_Note = "Предшествующее задание можно подобрать с последнего босса в Лабиринтах Иглошкурых. Вы найдете Малкина снаружи (Степи; "..YELLOW.."48,92"..WHITE..")."
	Inst17Quest2_HORDE_Prequest = "Нечестивый союз"
	Inst17Quest2_HORDE_Folgequest = "Нет"
	--
	Inst17Quest2name1_HORDE = "Skullbreaker"
	Inst17Quest2name2_HORDE = "Nail Spitter"
	Inst17Quest2name3_HORDE = "Zealot's Robe"
	
	--Quest 3 Horde  (same as Quest 2 Alliance)
	Inst17Quest3_HORDE = "3. Уничтожить идола"
	Inst17Quest3_HORDE_Level = Inst17Quest2_Level
	Inst17Quest3_HORDE_Attain = Inst17Quest2_Attain
	Inst17Quest3_HORDE_Aim = Inst17Quest2_Aim
	Inst17Quest3_HORDE_Location = Inst17Quest2_Location
	Inst17Quest3_HORDE_Note = Inst17Quest2_Note
	Inst17Quest3_HORDE_Prequest = Inst17Quest2_Prequest
	Inst17Quest3_HORDE_Folgequest = Inst17Quest2_Folgequest
	--
	Inst17Quest3name1_HORDE = Inst17Quest2name1
	
	--Quest 4 Horde
	Inst17Quest4_HORDE = "4. Да сгинет Хладовей"
	Inst17Quest4_HORDE_Attain = "37"
	Inst17Quest4_HORDE_Level = "42"
	Inst17Quest4_HORDE_Aim = "Эндрю Браунелл поручил вам убить Амненнара Хладовея и принести его череп."
	Inst17Quest4_HORDE_Location = "Эндрю Браунелл (Подгород - Квартал магов; "..YELLOW.."72,32"..WHITE..")"
	Inst17Quest4_HORDE_Note = "Амненнар Хладовей это последний босс в Курганах Иглошкурых. Вы найдете его около "..YELLOW.."[6]"..WHITE.."."
	Inst17Quest4_HORDE_Prequest = "Нет"
	Inst17Quest4_HORDE_Folgequest = "Нет"
	--
	Inst17Quest4name1_HORDE = "Vanquisher's Sword"
	Inst17Quest4name2_HORDE = "Amberglow Talisman"
	
	
	
	--------------- INST18 - Razorfen Kraul (RFK) ---------------
	Inst18Story = "Десять тысяч лет назад - во времена Войны Древних, могущественный полубог, Агамагган, вступил в битву против Пылающего Легиона. Огромный крепкий кабан пал в битве, но его действия помогли спасти Азерот от превращения в руины. Спустя некоторое время, в том, месте куда пролилась его кровь, из-под земли выросли толстые, покрытые шипами плети. Иглогривы - верившие, что они являются смертными потомками могучего бога, пришли занять эти места и охранять как святыню. Сердце этих шипастых колоний известно как Иглошкур. Огромные пространства Лабиринтов Иглошкурых были завоеваны старой каргой, Чарлгой Бритый Бок. Под ее рукой, иглогривы-шаманы начали атаковать племена соперников, также как и поселенцев Орды. Некоторые полагают, что Чарлга даже вела переговоры с агентами Плети - приравняв неожиданно ее племя к рангу нежити по каким-то коварным причинам."
	Inst18Caption = "Лабиринты Иглошкурых"
	Inst18QAA = "5 Заданий"
	Inst18QAH = "5 Заданий"
	
	--Quest 1 Alliance
	Inst18Quest1 = "1. Корни Синелиста"
	Inst18Quest1_Level = "26"
	Inst18Quest1_Attain = "20"
	Inst18Quest1_Aim = "В Лабиринтах Иглошкурых выпустите шмыгуноса и воспользуйтесь стеком, чтобы он начал искать корни.\nПринесите 6 корней синелиста, стек и ящик с дырками Мебоку Миззриксу в Кабестан."
	Inst18Quest1_Location = "Мебок Миззрикс (Степи - Кабестан; "..YELLOW.."62,37"..WHITE..")"
	Inst18Quest1_Note = "Ящик, Стек и инструкцию можно найти рядом с Мебоком Миззриксом."
	Inst18Quest1_Prequest = "Нет"
	Inst18Quest1_Folgequest = "Нет"
	--
	Inst18Quest1name1 = "A Small Container of Gems"
	
	--Quest 2 Alliance
	Inst18Quest2 = "2. Последнее желание"
	Inst18Quest2_Level = "30"
	Inst18Quest2_Attain = "?"
	Inst18Quest2_Aim = "Найдите подвеску Трешалы и верните ее Трешале Бурый Ручей в Дарнасс."
	Inst18Quest2_Location = "Гералат Бурый Ручей (Лабиринты Иглошкурых; "..YELLOW.."[8]"..WHITE..")"
	Inst18Quest2_Note = "Подвеска падает случайно. Вы должны вернуть подвеску Трешале Бурый Ручей в Дарнасс - Терраса торговцев ("..YELLOW.."69,67"..WHITE..")."
	Inst18Quest2_Prequest = "Нет"
	Inst18Quest2_Folgequest = "Нет"
	--
	Inst18Quest2name1 = "Mourning Shawl"
	Inst18Quest2name2 = "Lancer Boots"
	
	--Quest 3 Alliance
	Inst18Quest3 = "3. Импортер Вилликс"
	Inst18Quest3_Level = "30"
	Inst18Quest3_Attain = "?"
	Inst18Quest3_Aim = "Сопроводите Вилликса из Лабиринтов Иглошкурых."
	Inst18Quest3_Location = "Импортер Вилликс (Лабиринты Иглошкурых; "..YELLOW.."[8]"..WHITE..")"
	Inst18Quest3_Note = "Импортера Вилликса нужно проводить к выходу из подземелья. Задание можно сдать ему после выполнения."
	Inst18Quest3_Prequest = "Нет"
	Inst18Quest3_Folgequest = "Нет"
	--
	Inst18Quest3name1 = "Monkey Ring"
	Inst18Quest3name2 = "Snake Hoop"
	Inst18Quest3name3 = "Tiger Band"
	
	--Quest 4 Alliance
	Inst18Quest4 = "4. Хозяйка лабиринта"
	Inst18Quest4_Level = "34"
	Inst18Quest4_Attain = "30"
	Inst18Quest4_Aim = "Принесите медальон Чарглы Острый Бок Фалфиндеру Хранителю Путей в Таланааре."
	Inst18Quest4_Location = "Хранитель дорог Фалфиндел (Фералас - Таланаар; "..YELLOW.."89,46"..WHITE..")"
	Inst18Quest4_Note = "Медальон нужный для заадания падает с Чарлги Остробок  "..YELLOW.."[7]"..WHITE.."."
	Inst18Quest4_Prequest = "Дневник Хмурня"
	Inst18Quest4_Folgequest = "Нет"
	--
	Inst18Quest4name1 = "'Mage-Eye' Blunderbuss"
	Inst18Quest4name2 = "Berylline Pads"
	Inst18Quest4name3 = "Stonefist Girdle"
	Inst18Quest4name4 = "Marbled Buckler"
	
	--Quest 5 Alliance KRIEGER
	Inst18Quest5 = "5. Закаленный доспех (Воин)"
	Inst18Quest5_Level = "28"
	Inst18Quest5_Attain = "20"
	Inst18Quest5_Aim = "Соберите все необходимые материалы для Фьюрена Длинноборода и отнесите их в Штормград."
	Inst18Quest5_Location = "Фьюрен Длиннобород (Штормград - Квартал дворфов; "..YELLOW.."57,16"..WHITE..")"
	Inst18Quest5_Note = "Задание для воинов. Вы заберете сосуд флогистона у Ругуга около "..YELLOW.."[1]"..WHITE..".\n\nПоследующее задание отличается для каждой расы. Пылающая кровь для людей, Железный Коралл для дворфов и гномов и Высохшая скорлупа для ночных эльфов."
	Inst18Quest5_Prequest = "Щитник"
	Inst18Quest5_Folgequest = "(См. заметки)"
	-- No Rewards for this quest
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst18Quest1_HORDE = Inst18Quest1
	Inst18Quest1_HORDE_Level = Inst18Quest1_Level
	Inst18Quest1_HORDE_Attain = Inst18Quest1_Attain
	Inst18Quest1_HORDE_Aim = Inst18Quest1_Aim
	Inst18Quest1_HORDE_Location = Inst18Quest1_Location
	Inst18Quest1_HORDE_Note = Inst18Quest1_Note
	Inst18Quest1_HORDE_Prequest = Inst18Quest1_Prequest
	Inst18Quest1_HORDE_Folgequest = Inst18Quest1_Folgequest
	--
	Inst18Quest1name1_HORDE = Inst18Quest1name1
	
	--Quest 2 Horde  (same as Quest 3 Alliance)
	Inst18Quest2_HORDE = "2. Импортер Вилликс"
	Inst18Quest2_HORDE_Level = Inst18Quest3_Level
	Inst18Quest2_HORDE_Attain = Inst18Quest3_Attain
	Inst18Quest2_HORDE_Aim = Inst18Quest3_Aim
	Inst18Quest2_HORDE_Location = Inst18Quest3_Location
	Inst18Quest2_HORDE_Note = Inst18Quest3_Note
	Inst18Quest2_HORDE_Prequest = Inst18Quest3_Prequest
	Inst18Quest2_HORDE_Folgequest = Inst18Quest3_Folgequest
	--
	Inst18Quest2name1_HORDE = Inst18Quest3name1
	Inst18Quest2name2_HORDE = Inst18Quest3name2
	Inst18Quest2name3_HORDE = Inst18Quest3name3
	
	-- Quest 3 Horde
	Inst18Quest3_HORDE = "3. Груды гуано"
	Inst18Quest3_HORDE_Level = "33"
	Inst18Quest3_HORDE_Attain = "?"
	Inst18Quest3_HORDE_Aim = "Принесите 1 кучку гуано летучей мыши Вотчины мастеру аптекарю Фаранеллу в Подгород."
	Inst18Quest3_HORDE_Location = "Мастер аптекарь Фаранелл (Подгород - Квартал фармацевтов; "..YELLOW.."48,69 "..WHITE..")"
	Inst18Quest3_HORDE_Note = "Гуано падает с любой летучей мыши внутри подземелья."
	Inst18Quest3_HORDE_Prequest = "Нет"
	Inst18Quest3_HORDE_Folgequest = "Сердца Доблести ("..YELLOW.."[Монастырь Алого Ордена]"..WHITE..")"
	-- No Rewards for this quest
	
	--Quest 4 Horde
	Inst18Quest4_HORDE = "4. Отмщение грядет!"
	Inst18Quest4_HORDE_Level = "34"
	Inst18Quest4_HORDE_Attain = "29"
	Inst18Quest4_HORDE_Aim = "Принесите сердце Чарлги Остробок Ольду Каменному Копью в Громовой Утес."
	Inst18Quest4_HORDE_Location = "Ольд Каменное Копье (Громовой Утес; "..YELLOW.."36,59"..WHITE..")"
	Inst18Quest4_HORDE_Note = "Вы найдете Чарглу Остробок около "..YELLOW.."[7]"..WHITE.."."
	Inst18Quest4_HORDE_Prequest = "Нет"
	Inst18Quest4_HORDE_Folgequest = "Нет"
	--
	Inst18Quest4name1_HORDE = "Berylline Pads"
	Inst18Quest4name2_HORDE = "Stonefist Girdle"
	Inst18Quest4name3_HORDE = "Marbled Buckler"
	
	--Quest 5 Horde
	Inst18Quest5_HORDE = "5. Доспехи Жестокости (Воин)"
	Inst18Quest5_HORDE_Level = "30"
	Inst18Quest5_HORDE_Attain = "20"
	Inst18Quest5_HORDE_Aim = "Принесите Тун'гриму Огневзору 15 закопченных железных слитков, 10 мер толченого азурита, 10 железных слитков и сосуд флогистона."
	Inst18Quest5_HORDE_Location = "Тун'грим Огневзор (Степи; "..YELLOW.."57,30"..WHITE..")"
	Inst18Quest5_HORDE_Note = "Задание для воинов. Вы заберете сосуд флогистона у Ругуга около "..YELLOW.."[1]"..WHITE..".\n\nВыполнение задания позволит вам начать еще 4 новых задания у того же персонажа."
	Inst18Quest5_HORDE_Prequest = "Поговорить с Тун'гримом"
	Inst18Quest5_HORDE_Folgequest = "(см. заметки)"
	-- No Rewards for this quest
	
	
	
	--------------- INST19 - SM: Library (SM Lib) ---------------
	Inst19Story = "Монастырь когда-то был гордым оплотом жречества Лордерона - центром обучения и просвящения. С появлением нежити Плети во время Третьей войны, мирный монастырь превратился в цитадель фанатичного Алого ордена. Рыцари ордена нетерпимы ко всем нечеловеческим расам, невзирая на союзы и принадлежности. Они верят что любой чужак - потенциальный носитель чумы нежити - и должны быть уничтожены. Судя по донесениям, любителям приключений, которые ходили в монастырь пришлось сражаться с командиром Алого ордена Могрейном, под рукой которого находится большой гарнизон фанатично преданных воинов. Онако настоящая хозяйка монастыря - это Верховный инквизитор Вайтмейн - грозная жрица, обладающая способностью воскрешать павших воинов для сражения во имя нее."
	Inst19Caption = "SM: Библиотека"
	Inst19QAA = "3 Задания"
	Inst19QAH = "5 Заданий"
	
	--Quest 1 Alliance
	Inst19Quest1 = "1. Мифология титанов"
	Inst19Quest1_Level = "38"
	Inst19Quest1_Attain = "?"
	Inst19Quest1_Aim = "Добудьте 'Мифологию Титанов' из монастыря и принесите ее библиотекарю Мае Белокожке в Стальгорн."
	Inst19Quest1_Location = "Библиотекарь Мае Белокожка (Стальгорн - Зал исследователей; "..YELLOW.."74,12"..WHITE..")"
	Inst19Quest1_Note = "Книга лежит на полу на левой стороне коридоров, ведущих к Чародею Доану ("..YELLOW.."[2]"..WHITE..")."
	Inst19Quest1_Prequest = "Нет"
	Inst19Quest1_Folgequest = "Нет"
	--
	Inst19Quest1name1 = "Explorers' League Commendation"
	
	--Quest 2 Alliance
	Inst19Quest2 = "2. Во имя Света!"
	Inst19Quest2_Level = "40"
	Inst19Quest2_Attain = "39"
	Inst19Quest2_Aim = "Убейте Верховного инквизитора Вайтмейн, командира Могрейна из Алого ордена, воителя Герода из Алого ордена и псаря Локси, после этого вернитесь с докладом к Ролею Благочестивому в Южнобережье."
	Inst19Quest2_Location = "Ролей Благочестивый (Предгорья Хилсбрада - Южнобережье; "..YELLOW.."51,58"..WHITE..")"
	Inst19Quest2_Note = "Эта линейка заданий начинается у брата Кроули в Штормграде - Собор Света ("..YELLOW.."46,36"..WHITE..")."
	Inst19Quest2_Prequest = "Брат Антон -> Путями Алого ордена"
	Inst19Quest2_Folgequest = "Нет"
	--
	Inst19Quest2name1 = "Sword of Serenity"
	Inst19Quest2name2 = "Bonebiter"
	Inst19Quest2name3 = "Black Menace"
	Inst19Quest2name4 = "Orb of Lorica"
	
	--Quest 3 Alliance
	Inst19Quest3 = "3. Обряды Силы"
	Inst19Quest3_Level = "40"
	Inst19Quest3_Attain = "31"
	Inst19Quest3_Aim = "Принесите книгу 'Обряды силы' Табете в Пыльную трясину."
	Inst19Quest3_Location = "Табета (Пылевые топи; "..YELLOW.."46,57"..WHITE..")"
	Inst19Quest3_Note = "Задание для магов. Вы найдете книгу в последнем коридоре ведущем к чародею Доану ("..YELLOW.."[2]"..WHITE..")."
	Inst19Quest3_Prequest = "Волшебное слово"
	Inst19Quest3_Folgequest = "Жезл мага"
	-- No Rewards for this quest
	
	
	--Quest 1 Horde
	Inst19Quest1_HORDE = "1. Сердца Доблести"
	Inst19Quest1_HORDE_Level = "33"
	Inst19Quest1_HORDE_Attain = "?"
	Inst19Quest1_HORDE_Aim = "Мастер аптекарь Фаранелл в Подгороде просит принести ему 20 Сердец Доблести."
	Inst19Quest1_HORDE_Location = "Мастер аптекарь Фаранелл (Подгород - Квартал фармацевтов; "..YELLOW.."48,69"..WHITE..")"
	Inst19Quest1_HORDE_Note = "Сердца Доблести можно выбить со всех мобов в Алом Монастыре, включая людей вне подземелья."
	Inst19Quest1_HORDE_Prequest = "Груды гуано ("..YELLOW.."[Лабиринты Иглошкурых]"..WHITE..")"
	Inst19Quest1_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	-- Quest 2 Horde
	Inst19Quest2_HORDE = "2. Испытание знаний"
	Inst19Quest2_HORDE_Level = "36"
	Inst19Quest2_HORDE_Attain = "32"
	Inst19Quest2_HORDE_Aim = "Найдите книгу 'Истоки угрозы нежити' и отнесите ее Парквелу Финталласу в Подгород."
	Inst19Quest2_HORDE_Location = "Парквел Финталлас (Подгород - Квартал фармацевтов; "..YELLOW.."57,65"..WHITE..")"
	Inst19Quest2_HORDE_Note = "Линейка начинается у Дорна Вольного Ловчего (Тысяча Игл; "..YELLOW.."53,41"..WHITE.."). Вы можете найти книгу в Библиотеке Алого Монастыря."
	Inst19Quest2_HORDE_Prequest = "Испытание веры -> Испытание знаний"
	Inst19Quest2_HORDE_Folgequest = "Испытание знаний"
	-- No Rewards for this quest
	
	--Quest 3 Horde
	Inst19Quest3_HORDE = "3. Перечень павших"
	Inst19Quest3_HORDE_Level = "38"
	Inst19Quest3_HORDE_Attain = "?"
	Inst19Quest3_HORDE_Aim = "Добудьте перечень павших из монастыря в Тирисфальских лесах и возвращайтесь к Ведуну Искателю Истины в Громовой Утес."
	Inst19Quest3_HORDE_Location = "Ведун Искатель Истины (Громовой утес; "..YELLOW.."34,47"..WHITE..")"
	Inst19Quest3_HORDE_Note = "Вы найдете книгу в библиотечной секции Алого Монастыря. ВНИМАНИЕ! Нежить не может взять это задание"
	Inst19Quest3_HORDE_Prequest = "Нет"
	Inst19Quest3_HORDE_Folgequest = "Нет"
	--
	Inst19Quest3name1_HORDE = "Vile Protector"
	Inst19Quest3name2_HORDE = "Forcestone Buckler"
	Inst19Quest3name3_HORDE = "Omega Orb"
	
	--Quest 4 Horde
	Inst19Quest4_HORDE = "4. В монастырь Алого ордена"
	Inst19Quest4_HORDE_Level = "42"
	Inst19Quest4_HORDE_Attain = "33"
	Inst19Quest4_HORDE_Aim = "Убейте Верховного инквизитора Вайтмейн, командира Могрейна из Алого ордена, воителя Герода из Алого ордена и псаря Локси. Затем возвращайтесь к Вариматасу в Подгород."
	Inst19Quest4_HORDE_Location = "Вариматас (Подгород - Королевский квартал; "..YELLOW.."56,92"..WHITE..")"
	Inst19Quest4_HORDE_Note = "Вы найдете Верховного инквизитора Вайтмейн и Командира Могрейна из Алого ордена около "..YELLOW.."[5]"..WHITE..", Герода около "..YELLOW.."[3]"..WHITE.." и псаря Локси около "..YELLOW.."[1]"..WHITE.."."
	Inst19Quest4_HORDE_Prequest = "Нет"
	Inst19Quest4_HORDE_Folgequest = "Нет"
	--
	Inst19Quest4name1_HORDE = "Sword of Omen"
	Inst19Quest4name2_HORDE = "Prophetic Cane"
	Inst19Quest4name3_HORDE = "Dragon's Blood Necklace"
	
	--Quest 5 Horde  (same as Quest 3 Alliance)
	Inst19Quest5_HORDE = "5. Обряды силы (Маг)"
	Inst19Quest5_HORDE_Level = Inst19Quest3_Level
	Inst19Quest5_HORDE_Attain = Inst19Quest3_Attain
	Inst19Quest5_HORDE_Aim = Inst19Quest3_Aim
	Inst19Quest5_HORDE_Location = Inst19Quest3_Location
	Inst19Quest5_HORDE_Note = Inst19Quest3_Note
	Inst19Quest5_HORDE_Prequest = Inst19Quest3_Prequest
	Inst19Quest5_HORDE_Folgequest = Inst19Quest3_Folgequest
	-- No Rewards for this quest
	
	
	
	--------------- INST20 - Scholomance (Scholo) ---------------
	Inst20Story = "Некроситет разместился в серии гробниц, лежащих под развалинами крепости Каэр Дарроу. Когда-то принадлежавший знатной семье Баровых, Каэр Дарроу превратился в руины во время Второй войны. Так как колдун Кель'тузед вербовал последователей своего Культа Проклятых, он часто обещал бессмертие в обмен на служение Королю-личу. Семья Баровых поддалась харизматичному влиянию Кель'тузеда и подарила крепость и ее гробницы Плети. После этого культисты убили Баровых и превратили древние гробницы в школу некромантов, известную как Некроситет. Хотя Кель'тузеда больше нет в гробницах, преданные культисты и преподаватели все еще там. Могущественный лич, Рас Снегошепот, руководит охраной и следит за территорией во имя Плети - а смертный некромант, Темный магистр Гандлинг, выступает в роли коварного главы школы."
	Inst20Caption = "Некроситет"
	Inst20QAA = "10 Заданий"
	Inst20QAH = "10 Заданий"
	
	--Quest 1 Alliance
	Inst20Quest1 = "1. Зачумленные детеныши дракона"
	Inst20Quest1_Attain = "55"
	Inst20Quest1_Level = "58"
	Inst20Quest1_Aim = "Убейте 20 зачумленных детенышей дракона, затем возвращайтесь к Бетине Биггльцинк в Часовню Последней Надежды."
	Inst20Quest1_Location = "Бетина Биггльцинк (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
	Inst20Quest1_Note = "Зачумленные детеныши дракона находятся по пути к Громоклину в большой комнате."
	Inst20Quest1_Prequest = "Нет"
	Inst20Quest1_Folgequest = "Здоровая чешуя дракона"
	-- No Rewards for this quest
	
	--Quest 2 Alliance
	Inst20Quest2 = "2. Здоровая чешуя дракона"
	Inst20Quest2_Attain = ""
	Inst20Quest2_Level = "58"
	Inst20Quest2_Aim = "Отнесите здоровую чешую дракона Бетине Биггльцинк в Часовню Последней Надежды в Восточные Чумные земли."
	Inst20Quest2_Location = "Здоровая чешуя дракона (случайно падает в Некроситете)"
	Inst20Quest2_Note = "Здоровая чешуя дракона падает с зачумленных детенышей дракона (8% шанс). Вы найдете Бетину Биггльцинк в Восточные Чумные земли - Часовня Последней Надежды ("..YELLOW.."81,59"..WHITE..")."
	Inst20Quest2_Prequest = "Зачумленные детеныши дракона "
	Inst20Quest2_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 3 Alliance
	Inst20Quest3 = "3. Доктор Теолен Крастинов – Мясник"
	Inst20Quest3_Attain = "55"
	Inst20Quest3_Level = "60"
	Inst20Quest3_Aim = "Найдите в Некроситете доктора Теолена Крастинова. Убейте его, затем сожгите останки Евы и Люсьена Саркофф. Выполнив задание, возвращайтесь к Еве Саркофф."
	Inst20Quest3_Location = "Ева Саркофф (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE..")"
	Inst20Quest3_Note = "Вы найдете доктора Теолена Крастинова, останки Евы и останки Люсьена Саркофф около "..YELLOW.."[9]"..WHITE.."."
	Inst20Quest3_Prequest = "Нет"
	Inst20Quest3_Folgequest = "Мешок ужасов Крастинова"
	-- No Rewards for this quest
	
	--Quest 4 Alliance
	Inst20Quest4 = "4. Мешок ужасов Крастинова"
	Inst20Quest4_Attain = "55"
	Inst20Quest4_Level = "60"
	Inst20Quest4_Aim = "Найдите в Некроситете Джандис Баров и уничтожьте ее. Заберите мешок ужасов Крастинова. Отнесите мешок Еве Саркофф."
	Inst20Quest4_Location = "Ева Саркофф (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE..")"
	Inst20Quest4_Note = "Вы найдете Джастин Баров около "..YELLOW.."[3]"..WHITE.."."
	Inst20Quest4_Prequest = "Доктор Теолен Крастинов – Мясник"
	Inst20Quest4_Folgequest = "Киртонос Глашатай"
	-- No Rewards for this quest
	
	--Quest 5 Alliance
	Inst20Quest5 = "5. Киртонос Глашатай"
	Inst20Quest5_Attain = "56"
	Inst20Quest5_Level = "60"
	Inst20Quest5_Aim = "Вернитесь в Некроситет с кровью невинных. Найдите балкон и вылейте кровь в жаровню. На зов явится Киртонос. Сражайтесь как герой, не сдавайтесь! Уничтожьте Киртоноса и возвращайтесь к Еве Саркофф."
	Inst20Quest5_Location = "Ева Саркофф (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE..")"
	Inst20Quest5_Note = "Жаровня находится около "..YELLOW.."[2]"..WHITE.."."
	Inst20Quest5_Prequest = "Мешок ужасов Крастинова"
	Inst20Quest5_Folgequest = "Рас Ледяной Шепот – человек"
	--
	Inst20Quest5name1 = "Spectral Essence"
	Inst20Quest5name2 = "Penelope's Rose"
	Inst20Quest5name3 = "Mirah's Song"
	
	--Quest 6 Alliance
	Inst20Quest6 = "6. Рас Снегошепот – лич"
	Inst20Quest6_Attain = "60"
	Inst20Quest6_Level = "60"
	Inst20Quest6_Aim = "Отыщите в Некроситете Раса Снегошепота. Найдя его, воспользуйтесь Книгой Души против его посмертного облика. Если удастся превратить Раса в смертного, убейте его и заберите человеческую голову Раса Снегошепота. Отнесите голову мировому судье Мардуку."
	Inst20Quest6_Location = "Мировой судья Мардук (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE..")"
	Inst20Quest6_Note = "Вы сможете найти Раса Леденой Шепот около "..YELLOW.."[7]"..WHITE.."."
	Inst20Quest6_Prequest = "Рас Ледяной Шепот – человек - >  Книга Души"
	Inst20Quest6_Folgequest = "Нет"
	--
	Inst20Quest6name1 = "Darrowshire Strongguard"
	Inst20Quest6name2 = "Warblade of Caer Darrow"
	Inst20Quest6name3 = "Crown of Caer Darrow"
	Inst20Quest6name4 = "Darrowspike"
	
	--Quest 7 Alliance
	Inst20Quest7 = "7. Сокровище Баровых"
	Inst20Quest7_Attain = "60"
	Inst20Quest7_Level = "60"
	Inst20Quest7_Aim = "Отправляйтесь в Некроситет и добудьте сокровище семьи Баровых. Оно состоит из четырех документов: на Каэр Дарроу, на Брилл, на Мельницу Таррен и на Южнобережье. После выполнения задания вернитесь к Велдону Барову."
	Inst20Quest7_Location = "Велдон Баров (Западные Чумные земли - Лагерь Промозглого Ветра; "..YELLOW.."43,83"..WHITE..")"
	Inst20Quest7_Note = "Вы найдете Документы на Каэр Дарроу около "..YELLOW.."[12]"..WHITE..", Документы на Брилл около "..YELLOW.."[7]"..WHITE..", Документы на мельницу Таррен около "..YELLOW.."[4]"..WHITE.." и Документы на Южнобережье около "..YELLOW.."[1]"..WHITE.."."
	Inst20Quest7_Prequest = "Нет"
	Inst20Quest7_Folgequest = "Последний из Баровых"
	-- No Rewards for this quest
	
	--Quest 8 Alliance
	Inst20Quest8 = "8. Рассветный гамбит"
	Inst20Quest8_Attain = "59"
	Inst20Quest8_Level = "60"
	Inst20Quest8_Aim = "Отнесите рассветный гамбит в Демонстрационную комнату в Некроситете. Уничтожьте Вектуса и возвращайтесь к Бетине Биггльцинк."
	Inst20Quest8_Location = "Бетина Биггльцинк (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
	Inst20Quest8_Note = "Сущность детеныша дракона начинается у Тинки Кипеллера (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,23"..WHITE.."). Демонстрационная комната находится около "..YELLOW.."[6]"..WHITE.."."
	Inst20Quest8_Prequest = "Сущность детеныша дракона - > Бетина Биггльцинк"
	Inst20Quest8_Folgequest = "Нет"
	--
	Inst20Quest8name1 = "Windreaper"
	Inst20Quest8name2 = "Dancing Sliver"
	
	--Quest 9 Allaince
	Inst20Quest9 = "9. Доставка беса"
	Inst20Quest9_Attain = "60"
	Inst20Quest9_Level = "60"
	Inst20Quest9_Aim = "Отнесите беса в бутылке в алхимическую лабораторию Некроситета. После создания пергамента верните бутылку Горзиеки Дикоглазу."
	Inst20Quest9_Location = "Горзиеки Дикоглаз (Пылающие степи; "..YELLOW.."12,31"..WHITE..")"
	Inst20Quest9_Note = "Задание для чернокнижников: Вы найдете алхимическую лабораторию около "..YELLOW.."[7]"..WHITE.."."
	Inst20Quest9_Prequest = "Мор'зул Кровопуск - > Зоротианская звездная пыль"
	Inst20Quest9_Folgequest = "Ксоротианский конь погибели ("..YELLOW.."Забытый город (Запад)"..WHITE..")"
	-- No Rewards for this quest
	
	-- НЕТ КВ НА ПРАВУЮ ЧАСТЬ!!!!!!!!!!!!!!! 8992
	
	--Quest 10 Alliance
	Inst20Quest10 = "10. Левая часть амулета Лорда Вальтхалака"
	Inst20Quest10_Level = "60"
	Inst20Quest10_Attain = "60"
	Inst20Quest10_Aim = "Use the Brazier of Beckoning to summon forth the spirit of Kormok and slay him. Return to Bodley inside Blackrock Mountain with the Left Piece of Lord Valthalak's Amulet and the Brazier of Beckoning."
	Inst20Quest10_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
	Inst20Quest10_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его за задание 'В поисках Антиона'.\n\nKormok is summoned at "..YELLOW.."[7]"..WHITE.."."
	Inst20Quest10_Prequest = "Важная составляющая заклинания"
	Inst20Quest10_Folgequest = "Я вижу в твоем будущем остров Алькац..."
	-- No Rewards for this quest
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst20Quest1_HORDE = Inst20Quest1
	Inst20Quest1_HORDE_Level = Inst20Quest1_Level
	Inst20Quest1_HORDE_Attain = Inst20Quest1_Attain
	Inst20Quest1_HORDE_Aim = Inst20Quest1_Aim
	Inst20Quest1_HORDE_Location = Inst20Quest1_Location
	Inst20Quest1_HORDE_Note = Inst20Quest1_Note
	Inst20Quest1_HORDE_Prequest = Inst20Quest1_Prequest
	Inst20Quest1_HORDE_Folgequest = Inst20Quest1_Folgequest
	-- No Rewards for this quest
	
	--Quest 2 Horde  (same as Quest 2 Alliance)
	Inst20Quest2_HORDE = Inst20Quest2
	Inst20Quest2_HORDE_Level = Inst20Quest2_Level
	Inst20Quest2_HORDE_Attain = Inst20Quest2_Attain
	Inst20Quest2_HORDE_Aim = Inst20Quest2_Aim
	Inst20Quest2_HORDE_Location = Inst20Quest2_Location
	Inst20Quest2_HORDE_Note = Inst20Quest2_Note
	Inst20Quest2_HORDE_Prequest = Inst20Quest2_Prequest
	Inst20Quest2_HORDE_Folgequest = Inst20Quest2_Folgequest
	-- No Rewards for this quest
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst20Quest3_HORDE = Inst20Quest3
	Inst20Quest3_HORDE_Level = Inst20Quest3_Level
	Inst20Quest3_HORDE_Attain = Inst20Quest3_Attain
	Inst20Quest3_HORDE_Aim = Inst20Quest3_Aim
	Inst20Quest3_HORDE_Location = Inst20Quest3_Location
	Inst20Quest3_HORDE_Note = Inst20Quest3_Note
	Inst20Quest3_HORDE_Prequest = Inst20Quest3_Prequest
	Inst20Quest3_HORDE_Folgequest = Inst20Quest3_Folgequest
	-- No Rewards for this quest
	
	--Quest 4 Horde  (same as Quest 4 Alliance)
	Inst20Quest4_HORDE = Inst20Quest4
	Inst20Quest4_HORDE_Level = Inst20Quest4_Level
	Inst20Quest4_HORDE_Attain = Inst20Quest4_Attain
	Inst20Quest4_HORDE_Aim = Inst20Quest4_Aim
	Inst20Quest4_HORDE_Location = Inst20Quest4_Location
	Inst20Quest4_HORDE_Note = Inst20Quest4_Note
	Inst20Quest4_HORDE_Prequest = Inst20Quest4_Prequest
	Inst20Quest4_HORDE_Folgequest = Inst20Quest4_Folgequest
	-- No Rewards for this quest
	
	--Quest 5 Horde  (same as Quest 5 Alliance)
	Inst20Quest5_HORDE = Inst20Quest5
	Inst20Quest5_HORDE_Level = Inst20Quest5_Level
	Inst20Quest5_HORDE_Attain = Inst20Quest5_Attain
	Inst20Quest5_HORDE_Aim = Inst20Quest5_Aim
	Inst20Quest5_HORDE_Location = Inst20Quest5_Location
	Inst20Quest5_HORDE_Note = Inst20Quest5_Note
	Inst20Quest5_HORDE_Prequest = Inst20Quest5_Prequest
	Inst20Quest5_HORDE_Folgequest = Inst20Quest5_Folgequest
	--
	Inst20Quest5name1_HORDE = Inst20Quest5name1
	Inst20Quest5name2_HORDE = Inst20Quest5name2
	Inst20Quest5name3_HORDE = Inst20Quest5name3
	
	--Quest 6 Horde  (same as Quest 6 Alliance)
	Inst20Quest6_HORDE = Inst20Quest6
	Inst20Quest6_HORDE_Level = Inst20Quest6_Level
	Inst20Quest6_HORDE_Attain = Inst20Quest6_Attain
	Inst20Quest6_HORDE_Aim = Inst20Quest6_Aim
	Inst20Quest6_HORDE_Location = Inst20Quest6_Location
	Inst20Quest6_HORDE_Note = Inst20Quest6_Note
	Inst20Quest6_HORDE_Prequest = Inst20Quest6_Prequest
	Inst20Quest6_HORDE_Folgequest = Inst20Quest6_Folgequest
	--
	Inst20Quest6name1_HORDE = Inst20Quest6name1
	Inst20Quest6name2_HORDE = Inst20Quest6name2
	Inst20Quest6name3_HORDE = Inst20Quest6name3
	Inst20Quest6name4_HORDE = Inst20Quest6name4
	
	--Quest 7 Horde
	Inst20Quest7_HORDE = "7. Сокровище Баровых"
	Inst20Quest7_HORDE_Attain = "60"
	Inst20Quest7_HORDE_Level = "60"
	Inst20Quest7_HORDE_Aim = "Отправляйтесь в Некроситет и добудьте сокровище семьи Баровых. Оно состоит из четырех документов: на Каэр Дарроу, на Брилл, на Мельницу Таррен и на Южнобережье. После выполнения задания вернитесь к Алексию Барову."
	Inst20Quest7_HORDE_Location = "Алексий Баров (Западные Чумные земли; "..YELLOW.."28,57"..WHITE..")"
	Inst20Quest7_HORDE_Note = "Вы найдете Документы на Каэр Дарроу около "..YELLOW.."[12]"..WHITE..", Документы на Брилл около "..YELLOW.."[7]"..WHITE..", Документы на мельницу Таррен около "..YELLOW.."[4]"..WHITE.." и Документы на Южнобережье около "..YELLOW.."[1]"..WHITE.."."
	Inst20Quest7_HORDE_Prequest = "Нет"
	Inst20Quest7_HORDE_Folgequest = "Последний из Баровых"
	-- No Rewards for this quest
	
	--Quest 8 Horde  (same as Quest 8 Alliance)
	Inst20Quest8_HORDE = Inst20Quest8
	Inst20Quest8_HORDE_Level = Inst20Quest8_Level
	Inst20Quest8_HORDE_Attain = Inst20Quest8_Attain
	Inst20Quest8_HORDE_Aim = Inst20Quest8_Aim
	Inst20Quest8_HORDE_Location = Inst20Quest8_Location
	Inst20Quest8_HORDE_Note = Inst20Quest8_Note
	Inst20Quest8_HORDE_Prequest = Inst20Quest8_Prequest
	Inst20Quest8_HORDE_Folgequest = Inst20Quest8_Folgequest
	--
	Inst20Quest8name1_HORDE = Inst20Quest8name1
	Inst20Quest8name2_HORDE = Inst20Quest8name2
	
	--Quest 9 Horde  (same as Quest 9 Alliance)
	Inst20Quest9_HORDE = Inst20Quest9
	Inst20Quest9_HORDE_Level = Inst20Quest9_Level
	Inst20Quest9_HORDE_Attain = Inst20Quest9_Attain
	Inst20Quest9_HORDE_Aim = Inst20Quest9_Aim
	Inst20Quest9_HORDE_Location = Inst20Quest9_Location
	Inst20Quest9_HORDE_Note = Inst20Quest9_Note
	Inst20Quest9_HORDE_Prequest = Inst20Quest9_Prequest
	Inst20Quest9_HORDE_Folgequest = Inst20Quest9_Folgequest
	-- No Rewards for this quest
	
	--Quest 10 Horde  (same as Quest 10 Alliance)
	Inst20Quest10_HORDE = Inst20Quest10
	Inst20Quest10_HORDE_Level = Inst20Quest10_Level
	Inst20Quest10_HORDE_Attain = Inst20Quest10_Attain
	Inst20Quest10_HORDE_Aim = Inst20Quest10_Aim
	Inst20Quest10_HORDE_Location = Inst20Quest10_Location
	Inst20Quest10_HORDE_Note = Inst20Quest10_Note
	Inst20Quest10_HORDE_Prequest = Inst20Quest10_Prequest
	Inst20Quest10_HORDE_Folgequest = Inst20Quest10_Folgequest
	-- No Rewards for this quest
	
	
	
	--------------- INST21 - Shadowfang Keep (SFK) ---------------
	Inst21Story = "Во время Третьей Войны, волшебники Кирин Тора сражались против армии нежити Плети. Когда волшебники Даларана погибли в бою, они смогли возродиться после - прибавив свою былую мощь к растущей Плети. Недовольный недостатком прогресса (и вопреки советам его соратников) Архимаг выбрал Аругала для призыва внемировых сущностей, чтобы подкрепить уменьшающиеся силы Даларана. Призыв Аругала привел изголодавшихся воргенов в мир Азерота. Дикие зверолюди устроили резню не только Плети, но быстро принялись и за самих волшебников. Воргены осадили крепость дворянина, барона Сребролена. Расположенная на небольшой деревушкой Погребальных костров, крепость быстро была ввергнута во тьму и разруху. Помешавшись из-за чувства вины, Аругал усыновил воргенов как детей и уединился в заново окрещенной 'Крепости Темного Клыка'. Говорят, он все еще живет там, защищаемый своим огромным питомцем, Фенрусом - и преследуемый мстительным духом барона Сребролена."
	Inst21Caption = "Крепость Темного Клыка"
	Inst21QAA = "2 Задания"
	Inst21QAH = "4 Задания"
	
	--Quest 1 Alliance
	Inst21Quest1 = "1. Испытание доблести (Паладин)"
	Inst21Quest1_Level = "22"
	Inst21Quest1_Attain = "20"
	Inst21Quest1_Aim = "Возьмите список Джордана, добудьте немного древесины белокаменного дуба, партию очищенной руды Бэйлора, кузнечный молот Джордана и самоцвет Кора и отдайте их Джордану Стилвеллу в Стальгорне."
	Inst21Quest1_Location = "Джордан Стилвелл (Дун Морог - Вход в Стальгорн; "..YELLOW.."52,36"..WHITE..")"
	Inst21Quest1_Note = "Задание для паладинов: Чтобы увидеть заметки щелкните на "..YELLOW.."[Информация: Испытание доблести]"..WHITE.."."
	Inst21Quest1_Page = {2, "Только паладины могут получить это задание!\n\n1. Вы получите древесину белокаменного дуба у гоблинов-лесорубов в "..YELLOW.."[Мертвые копи]"..WHITE.." около "..YELLOW.."[3]"..WHITE..".\n\n2. Для получения партии очищенной руды Бэйлора вы должны поговорить с Бэйлором Каменной Дланью (Озеро Модан - Телсамар; "..YELLOW.."35,44"..WHITE.."). Он даст вам задание 'Партия руды Бэйлора'. Вы найдете руду Джордана за деревом около "..YELLOW.."71,21"..WHITE.."\n\n3. Вы получите кузнечный молот Джордана в "..YELLOW.."[Крепость Темного Клыка]"..WHITE.." около "..YELLOW.."[3]"..WHITE..".\n\n4. Для получения самоцвета Кора Вам нужно пойти к Тандрису Ветропряду (Темные берега - Аубердин; "..YELLOW.."37,40"..WHITE..") и выполнить задание 'Поиск самоцвета Кора'. Для этого задания, вам нужно убивать Провидзев и Жриц Непроглядной пучины перед "..YELLOW.."[Непроглядная пучина]"..WHITE..". С них падает Оскверненный самоцвет Кора. Тандрис Ветропряд очистит его для Вас.", };
	Inst21Quest1_Prequest = "Фолиант Отваги -> Испытание доблести"
	Inst21Quest1_Folgequest = "Испытание доблести"
	--
	Inst21Quest1name1 = "Verigan's Fist"
	
	--Quest 2 Alliance
	Inst21Quest2 = "2. Шар Соран'рука"
	Inst21Quest2_Level = "26"
	Inst21Quest2_Attain = "21"
	Inst21Quest2_Aim = "Соберите 3 фрагмента Соран'рука и 1 большой фрагмент Соран'рука и принесите их Доану Кархану в Степи."
	Inst21Quest2_Location = "Доан Кархан (Степи; "..YELLOW.."49,57"..WHITE..")"
	Inst21Quest2_Note = "Задание для чернокнижников: Вы возьмете 3 фрагмента Соран'рука с Сумеречных Прислужников в "..YELLOW.."[Непроглядная пучина]"..WHITE..". Вы возьмете большой фрагмент Соран'рука в "..YELLOW.."[Крепость Темного Клыка]"..WHITE.." у Темных Душ Темного Клыка."
	Inst21Quest2_Prequest = "Нет"
	Inst21Quest2_Folgequest = "Нет"
	--
	Inst21Quest2name1 = "Orb of Soran'ruk"
	Inst21Quest2name2 = "Staff of Soran'ruk"
	
	
	--Quest 1 Horde
	Inst21Quest1_HORDE = "1. Пропавшие стражи смерти"
	Inst21Quest1_HORDE_Level = "25"
	Inst21Quest1_HORDE_Attain = "-"
	Inst21Quest1_HORDE_Aim = "Найдите стражей смерти Адаманта и Винсента."
	Inst21Quest1_HORDE_Location = "Верховный палач Хадрек (Серебряный бор - Гробница; "..YELLOW.."43,40"..WHITE..")"
	Inst21Quest1_HORDE_Note = "Вы найдете стража смерти Адаманта около "..YELLOW.."[1]"..WHITE..". Страж смерти Винсент находится справа когда вы войдете во внутренний двор около "..YELLOW.."[3]"..WHITE.."."
	Inst21Quest1_HORDE_Prequest = "Нет"
	Inst21Quest1_HORDE_Folgequest = "Нет"
	--
	Inst21Quest1name1_HORDE = "Ghostly Mantle"
	
	--Quest 2 Horde
	Inst21Quest2_HORDE = "2. Книга Ура"
	Inst21Quest2_HORDE_Level = "26"
	Inst21Quest2_HORDE_Attain = "16"
	Inst21Quest2_HORDE_Aim = "Принесите книгу Ура хранителю Бел'дугуру в Район Фармацевтов в Подгород."
	Inst21Quest2_HORDE_Location = "Хранитель Бел'дугур (Подгород - Квартал фармацевтов; "..YELLOW.."53,54"..WHITE..")"
	Inst21Quest2_HORDE_Note = "Вы найдете книгу около "..YELLOW.."[11]"..WHITE.." слева, когда вы войдете в комнату."
	Inst21Quest2_HORDE_Prequest = "Нет"
	Inst21Quest2_HORDE_Folgequest = "Нет"
	--
	Inst21Quest2name1_HORDE = "Grizzled Boots"
	Inst21Quest2name2_HORDE = "Steel-clasped Bracers"
	
	--Quest 3 Horde
	Inst21Quest3_HORDE = "3. Смерть Аругалу!"
	Inst21Quest3_HORDE_Level = "27"
	Inst21Quest3_HORDE_Attain = "-"
	Inst21Quest3_HORDE_Aim = "Убейте Аругала и принесите его голову Далару Ткачу Рассвета в Гробницу."
	Inst21Quest3_HORDE_Location = "Далар Ткач Рассвета (Серебряный бор - Гробница; "..YELLOW.."44,39"..WHITE..")"
	Inst21Quest3_HORDE_Note = "Вы найдете Архимага Аругала около "..YELLOW.."[13]"..WHITE.."."
	Inst21Quest3_HORDE_Prequest = "Нет"
	Inst21Quest3_HORDE_Folgequest = "Нет"
	--
	Inst21Quest3name1_HORDE = "Seal of Sylvanas"
	
	--Quest 4 Horde (hexenmeister)
	Inst21Quest4_HORDE = "4. Шар Соран'рука"
	Inst21Quest4_HORDE_Level = Inst21Quest2_Level
	Inst21Quest4_HORDE_Attain = Inst21Quest2_Attain
	Inst21Quest4_HORDE_Aim = Inst21Quest2_Aim
	Inst21Quest4_HORDE_Location = Inst21Quest2_Location
	Inst21Quest4_HORDE_Note = Inst21Quest2_Note
	Inst21Quest4_HORDE_Prequest = Inst21Quest2_Prequest
	Inst21Quest4_HORDE_Folgequest = Inst21Quest2_Folgequest
	--
	Inst21Quest4name1_HORDE = "Orb of Soran'ruk"
	Inst21Quest4name2_HORDE = "Staff of Soran'ruk"
	
	
	
	--------------- INST22 - Stratholme (Strat) ---------------
	Inst22Story = "Когда-то он был жемчужиной северного Лордерона, город Стратхольм, именно тут принц Артес пошел против своего наставника, Утера Несущего Свет, и устроил бойню сотен своих собственных подданных, зараженных ,как он верил, ужасносной чумой нежити. Стремительное падение Артеса и окончательный переход на сторону Короля-лича последовали потом. В разрушенном городе теперь обитает нежить Плети - ведомая могущественным личем, Кель'тузедом. Личный состав Алого ордена, под руководством Grand Crusader Dathrohan, также захватил часть уничтоженного города. Две стороны увязли в непрекращающейся, ожесточенной битве. Искатели приключений, достаточно отважные (или безмозглые), чтобы войти в Стратхольм, столкнуться с противодействием и тех, и других. Поговаривают, что город охраняется тремя огромными смотровыми башнями, а также сильными некромантами, баньши и мерзостями. Также есть свидетельства того, что пагубный рыцарь смерти разъезжает по дьявольской конюшне - без разбору обрушивая свой гнев на головы тех, кто вторгся во владения Плети."
	Inst22Caption = "Стратхольм"
	Inst22QAA = "18 Заданий"
	Inst22QAH = "19 Заданий"
	
	--Quest1 Alliance
	Inst22Quest1 = "1. Плоть не лжет"
	Inst22Quest1_Level = "60"
	Inst22Quest1_Attain = "?"
	Inst22Quest1_Aim = "Принесите 20 препаратов чумной плоти из Стратхольма Бетине Биггльцинк. Предположительно, любая тварь из Стратхольма сойдет за препарат."
	Inst22Quest1_Location = "Бетина Биггльцинк (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
	Inst22Quest1_Note = "Сбольшинства существ в Стратхольме падают препараты чумной плоти, но шанс очень мал."
	Inst22Quest1_Prequest = "Нет"
	Inst22Quest1_Folgequest = "Вирус чумы"
	-- No Rewards for this quest
	
	--Quest2 Alliance
	Inst22Quest2 = "2. Вирус чумы"
	Inst22Quest2_Level = "60"
	Inst22Quest2_Attain = "58"
	Inst22Quest2_Aim = "Отправляйтесь в Стратхольм и исследуйте зиккураты. Доставьте сведения о Плети Бетине Биггльцинк."
	Inst22Quest2_Location = "Бетина Биггльцинк (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
	Inst22Quest2_Note = "Сведения о плети находятся в одной из 3 Башен, которые вы найдете около "..YELLOW.."[10]"..WHITE..", "..YELLOW.."[11]"..WHITE.." and "..YELLOW.."[12]"..WHITE.."."
	Inst22Quest2_Prequest = "Плоть не лжет"
	Inst22Quest2_Folgequest = "Нет"
	--
	Inst22Quest2name1 = "Seal of the Dawn"
	Inst22Quest2name2 = "Rune of the Dawn"
	
	--Quest3 Alliance
	Inst22Quest3 = "3. Святая вода"
	Inst22Quest3_Level = "60"
	Inst22Quest3_Attain = "?"
	Inst22Quest3_Aim = "Отправляйтесь на север, в Стратхольм. Обыщите брошенные ящики с припасами и соберите 5 мер святой воды Стратхольма. Возвращайтесь к Леониду Бартоломею Чтимому, как только воды будет достаточно."
	Inst22Quest3_Location = "Леонид Барталомей Чтимый (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."80,58"..WHITE..")"
	Inst22Quest3_Note = "Вы найдете святую воду в ящиках по всему Стратхольму. При открытии некоторых появятся насекомые и атакуют Вас."
	Inst22Quest3_Prequest = "Нет"
	Inst22Quest3_Folgequest = "Нет"
	--
	Inst22Quest3name1 = "Superior Healing Potion"
	Inst22Quest3name2 = "Greater Mana Potion"
	Inst22Quest3name3 = "Crown of the Penitent"
	Inst22Quest3name4 = "Band of the Penitent"
	
	--Quest4 Alliance
	Inst22Quest4 = "4. Великий Фрас Сиаби"
	Inst22Quest4_Level = "60"
	Inst22Quest4_Attain = "?"
	Inst22Quest4_Aim = "Найдите табачную лавку Фраса Сиаби в Стратхольме, отыщите в ней пачку лучшего табака Сиаби и принесите ее Дымку ЛаРу."
	Inst22Quest4_Location = "Дымок ЛаРу (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."80,58"..WHITE..")"
	Inst22Quest4_Note = "Вы найдете табачную лавку около "..YELLOW.."[1]"..WHITE..". Фрас Сиаби появится когда вы откроете коробку."
	Inst22Quest4_Prequest = "Нет"
	Inst22Quest4_Folgequest = "Нет"
	--
	Inst22Quest4name1 = "Smokey's Lighter"
	
	--Quest5 Alliance
	Inst22Quest5 = "5. Мятущиеся души"
	Inst22Quest5_Level = "60"
	Inst22Quest5_Attain = "55"
	Inst22Quest5_Aim = "Стреляйте в призраков и неупокоенных на улицах Стратхольма из излучателя Эгана. Когда душа вырвется из призрачной оболочки, выстрелите в нее еще раз, и она обретет свободу."
	Inst22Quest5_Location = "Эган (Восточные Чумные земли; "..YELLOW.."14,33"..WHITE..")"
	Inst22Quest5_Note = "Вы возьмете предшествующее задание у управляющего Алена (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."79,63"..WHITE.."). Призраки и неупокоенные бродят по улицам Стратхольма."
	Inst22Quest5_Prequest = "Мятущиеся души"
	Inst22Quest5_Folgequest = "Нет"
	--
	Inst22Quest5name1 = "Testament of Hope"
	
	--Quest6 Alliance
	Inst22Quest6 = "6. О любви и семье"
	Inst22Quest6_Level = "60"
	Inst22Quest6_Attain = "53"
	Inst22Quest6_Aim = "Отправляйтесь в Статхольм в северную часть Лихоземья. Найдите в Бастионе Алого ордена картину 'О любви и семье', спрятанную за другой, изображающей две луны нашего мира."
	Inst22Quest6_Location = "Художница Ренфри (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."65,75"..WHITE..")"
	Inst22Quest6_Note = "Вы возьмете предшествующее задание у Тириона Фордринга (Западные Чумные земли; "..YELLOW.."7,43"..WHITE.."). Вы сможете найти картину около "..YELLOW.."[7]"..WHITE.."."
	Inst22Quest6_Prequest = "Искупление - > О любви и семье"
	Inst22Quest6_Folgequest = "Найти Миранду"
	-- No Rewards for this quest
	
	--Quest7 Alliance
	Inst22Quest7 = "7. Дар Менетила"
	Inst22Quest7_Level = "60"
	Inst22Quest7_Attain = "53"
	Inst22Quest7_Aim = "Отправляйтесь в Стратхольм и отыщите Дар Менетила. Положите книгу Воспоминаний на оскверненную землю."
	Inst22Quest7_Location = "Леонид Барталомей Чтимый (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."80,58"..WHITE..")"
	Inst22Quest7_Note = "Вы возьмете предшествующее задание у мирового судьи Мардука (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE.."). Вы найдете знак около "..YELLOW.."[15]"..WHITE..". Смотрите также: "..YELLOW.."[Рас Снегошепот – лич]"..WHITE.." в Некроситете."
	Inst22Quest7_Prequest = "Рас Ледяной Шепот – человек - > Рас Ледяной Шепот – гибель"
	Inst22Quest7_Folgequest = "Дар Менетила"
	-- No Rewards for this quest
	
	--Quest8 Alliance
	Inst22Quest8 = "8. Слова Аурия"
	Inst22Quest8_Level = "60"
	Inst22Quest8_Attain = "?"
	Inst22Quest8_Aim = "Убейте барона."
	Inst22Quest8_Location = "Аурий (Стратхольм; "..YELLOW.."[8]"..WHITE..")"
	Inst22Quest8_Note = "Чтобы начать выполнение задания вы должны отдать Аурию [Медальон Веры]. Вы получите медальон из сундука. В первой комнате крепости (до того как дороги разойдутся). После того, как вы отдадите Аурию медальон, он поможет вашей группе сражаться против Барона "..YELLOW.."[15]"..WHITE..". После убийства Барона в должны снова поговорить с Аурием, чтобы получить награду."
	Inst22Quest8_Prequest = "Нет"
	Inst22Quest8_Folgequest = "Нет"
	--
	Inst22Quest8name1 = "Will of the Martyr"
	Inst22Quest8name2 = "Blood of the Martyr"
	
	--Quest9 Alliance
	Inst22Quest9 = "9. Архивариус"
	Inst22Quest9_Level = "60"
	Inst22Quest9_Attain = "55"
	Inst22Quest9_Aim = "Отправляйтесь в Стратхольм и отыщите архивариуса Галфорда из Алого ордена. Убейте его и сожгите архив Алых."
	Inst22Quest9_Location = "Герцог Николас Зверенхофф (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
	Inst22Quest9_Note = "Вы найдете архив и архивариуса около "..YELLOW.."[6]"..WHITE.."."
	Inst22Quest9_Prequest = "Нет"
	Inst22Quest9_Folgequest = "Ошеломляющая истина"
	-- No Rewards for this quest
	
	--Quest10 Alliance
	Inst22Quest10 = "10. Ошеломляющая истина"
	Inst22Quest10_Level = "60"
	Inst22Quest10_Attain = "58"
	Inst22Quest10_Aim = "Отнесите голову Бальназара герцогу Николасу Зверенхоффу в Восточные Чумные земли."
	Inst22Quest10_Location = "Бальназар (Стратхольм; "..YELLOW.."[7]"..WHITE..")"
	Inst22Quest10_Note = "Вы найдете герцога Николаса Зверенхоффа в Восточные Чумные земли - Часовня Последней Надежды ("..YELLOW.."81,59"..WHITE..")."
	Inst22Quest10_Prequest = "Архивариус"
	Inst22Quest10_Folgequest = "Быстрее, выше, сильнее"
	-- No Rewards for this quest
	
	--Quest11 Alliance
	Inst22Quest11 = "11. Быстрее, выше, сильнее"
	Inst22Quest11_Level = "60"
	Inst22Quest11_Attain = "58"
	Inst22Quest11_Aim = "Отправляйтесь в Стратхольм и убейте барона Ривендера. Принесите его голову герцогу Николасу Зверенхоффу."
	Inst22Quest11_Location = "Герцог Николас Зверенхофф (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
	Inst22Quest11_Note = "Вы можете найти барона около "..YELLOW.."[15]"..WHITE.."."
	Inst22Quest11_Prequest = "Ошеломляющая истина"
	Inst22Quest11_Folgequest = "Нет"
	--
	Inst22Quest11name1 = "Argent Defender"
	Inst22Quest11name2 = "Argent Crusader"
	Inst22Quest11name3 = "Argent Avenger"
	
	--Quest 12 Alliance
	Inst22Quest12 = "12. Dead Man's Plea"
	Inst22Quest12_Level = "60"
	Inst22Quest12_Attain = "58"
	Inst22Quest12_Aim = "Go into Stratholme and rescue Ysida Harmon from Baron Rivendare."
	Inst22Quest12_Location = "Anthion Harmon (Eastern Plaguelands - Stratholme)"
	Inst22Quest12_Note = "Anthion stands just outside the Stratholme portal. You need the Extra-Dimensional Ghost Revealer to see him. It comes from the pre-quest. The questline starts with Just Compensation. Deliana in Ironforge ("..YELLOW.."43,52"..WHITE..") for Alliance, Mokvar in Orgrimmar ("..YELLOW.."38,37"..WHITE..") for Horde.\nThis is the infamous '45 minute' Baron run."
	Inst22Quest12_Prequest = "In Search of Anthion"
	Inst22Quest12_Folgequest = "Proof of Life"
	-- No Rewards for this quest
	
	--Quest 13 Alliance
	Inst22Quest13 = "13. Левая часть амулета Лорда Вальтхалака"
	Inst22Quest13_Level = "60"
	Inst22Quest13_Attain = "60"
	Inst22Quest13_Aim = "Use the Brazier of Beckoning to summon forth Jarien and Sothos and slay them. Return to Bodley inside Blackrock Mountain with the Left Piece of Lord Valthalak's Amulet and the Brazier of Beckoning."
	Inst22Quest13_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
	Inst22Quest13_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его за задание 'В поисках Антиона'.\n\nJarien and Sothos are summoned at "..YELLOW.."[11]"..WHITE.."."
	Inst22Quest13_Prequest = "Важная составляющая заклинания"
	Inst22Quest13_Folgequest = "Я вижу в твоем будущем остров Алькац..."
	-- No Rewards for this quest
	
	--Quest 14 Alliance
	Inst22Quest14 = "14. Правая часть амулета Лорда Вальтхалака"
	Inst22Quest14_Level = "60"
	Inst22Quest14_Attain = "60"
	Inst22Quest14_Aim = "Use the Brazier of Beckoning to summon forth Jarien and Sothos and slay them. Return to Bodley inside Blackrock Mountain with the recombined Lord Valthalak's Amulet and the Brazier of Beckoning."
	Inst22Quest14_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
	Inst22Quest14_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его за задание 'В поисках Антиона'.\n\nJarien and Sothos are summoned at "..YELLOW.."[11]"..WHITE.."."
	Inst22Quest14_Prequest = "Еще одна важная составляющая заклинания"
	Inst22Quest14_Folgequest = "Последние приготовления ("..YELLOW.."Вершина Черной горы"..WHITE..")"
	-- No Rewards for this quest
	
	--Quest 15 Alliance
	Inst22Quest15 = "15. Atiesh, Greatstaff of the Guardian"
	Inst22Quest15_Level = "60"
	Inst22Quest15_Attain = "60"
	Inst22Quest15_Aim = "Anachronos at the Caverns of Time in Tanaris wants you to take Atiesh, Greatstaff of the Guardian to Stratholme and use it on Consecrated Earth. Defeat the entity that is exorcised from the staff and return to him."
	Inst22Quest15_Location = "Anachronos (Tanaris - Caverns of Time; "..YELLOW.."65,49"..WHITE..")"
	Inst22Quest15_Note = "Atiesh is summoned at "..YELLOW.."[2]"..WHITE.."."
	Inst22Quest15_Prequest = "Yes"
	Inst22Quest15_Folgequest = "Нет"
	--
	Inst22Quest15name1 = "Atiesh, Greatstaff of the Guardian"
	Inst22Quest15name2 = "Atiesh, Greatstaff of the Guardian"
	Inst22Quest15name3 = "Atiesh, Greatstaff of the Guardian"
	Inst22Quest15name4 = "Atiesh, Greatstaff of the Guardian"
	
	--Quest 16 Alliance
	Inst22Quest16 = "16. Corruption"
	Inst22Quest16_Level = "60"
	Inst22Quest16_Attain = "50"
	Inst22Quest16_Aim = "Find the Black Guard Swordsmith in Stratholme and destroy him. Recover the Insignia of the Black Guard and return to Seril Scourgebane."
	Inst22Quest16_Location = "Seril Scourgebane (Winterspring - Everlook; "..YELLOW.."61,37"..WHITE..")"
	Inst22Quest16_Note = "Задание для кузнецов: The Black Guard Swordsmith is summoned near "..YELLOW.."[15]"..WHITE.."."
	Inst22Quest16_Prequest = "Нет"
	Inst22Quest16_Folgequest = "Нет"
	--
	Inst22Quest16name1 = "Plans: Blazing Rapier"
	
	--Quest 17 Alliance
	Inst22Quest17 = "17. Sweet Serenity"
	Inst22Quest17_Level = "60"
	Inst22Quest17_Attain = "51"
	Inst22Quest17_Aim = "Travel to Stratholme and kill the Crimson Hammersmith. Recover the Crimson Hammersmith's Apron and return to Lilith."
	Inst22Quest17_Location = "Lilith the Lithe (Winterspring - Everlook; "..YELLOW.."61,37"..WHITE..")"
	Inst22Quest17_Note = "Задание для кузнецов: The Crimson Hammersmith is summoned at "..YELLOW.."[8]"..WHITE.."."
	Inst22Quest17_Prequest = "Нет"
	Inst22Quest17_Folgequest = "Нет"
	--
	Inst22Quest17name1 = "Plans: Enchanted Battlehammer"
	
	--Quest 18 Alliance
	Inst22Quest18 = "18. The Balance of Light and Shadow"
	Inst22Quest18_Level = "60"
	Inst22Quest18_Attain = "60"
	Inst22Quest18_Aim = "Save 50 Peasants before 15 are slain. Speak with Eris Havenfire should you accomplish this task."
	Inst22Quest18_Location = "Eris Havenfire (Eastern Plaguelands; "..YELLOW.."21,18"..WHITE..")"
	Inst22Quest18_Note = "Задание для жрецов: In order to see Eris Havenfire and get this quest, you need either the Eye of Divinity (comes from Cache of the Firelord in "..YELLOW.."[Molten Core]"..WHITE..") or Spectral Essence (reward for "..YELLOW.."[Scholomance]"..WHITE.." quest 'Kirtonos the Herald').\n\nThis quest's reward, when combined with Eye of Divinity and The Eye of Shadow (drops from "..YELLOW.."[Highlord Kruul]"..WHITE..") form Benediction, an epic priest's staff."
	Inst22Quest18_Prequest = "Нет"
	Inst22Quest18_Folgequest = "Нет"
	--
	Inst22Quest18name1 = "Splinter of Nordrassil"
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst22Quest1_HORDE = Inst22Quest1
	Inst22Quest1_HORDE_Level = Inst22Quest1_Level
	Inst22Quest1_HORDE_Attain = Inst22Quest1_Attain
	Inst22Quest1_HORDE_Aim = Inst22Quest1_Aim
	Inst22Quest1_HORDE_Location = Inst22Quest1_Location
	Inst22Quest1_HORDE_Note = Inst22Quest1_Note
	Inst22Quest1_HORDE_Prequest = Inst22Quest1_Prequest
	Inst22Quest1_HORDE_Folgequest = Inst22Quest1_Folgequest
	-- No Rewards for this quest
	
	--Quest 2 Horde  (same as Quest 2 Alliance)
	Inst22Quest2_HORDE = Inst22Quest2
	Inst22Quest2_HORDE_Level = Inst22Quest2_Level
	Inst22Quest2_HORDE_Attain = Inst22Quest2_Attain
	Inst22Quest2_HORDE_Aim = Inst22Quest2_Aim
	Inst22Quest2_HORDE_Location = Inst22Quest2_Location
	Inst22Quest2_HORDE_Note = Inst22Quest2_Note
	Inst22Quest2_HORDE_Prequest = Inst22Quest2_Prequest
	Inst22Quest2_HORDE_Folgequest = Inst22Quest2_Folgequest
	--
	Inst22Quest2name1_HORDE = Inst22Quest2name1
	Inst22Quest2name2_HORDE = Inst22Quest2name2
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst22Quest3_HORDE = Inst22Quest3
	Inst22Quest3_HORDE_Level = Inst22Quest3_Level
	Inst22Quest3_HORDE_Attain = Inst22Quest3_Attain
	Inst22Quest3_HORDE_Aim = Inst22Quest3_Aim
	Inst22Quest3_HORDE_Location = Inst22Quest3_Location
	Inst22Quest3_HORDE_Note = Inst22Quest3_Note
	Inst22Quest3_HORDE_Prequest = Inst22Quest3_Prequest
	Inst22Quest3_HORDE_Folgequest = Inst22Quest3_Folgequest
	--
	Inst22Quest3name1_HORDE = Inst22Quest3name1
	Inst22Quest3name2_HORDE = Inst22Quest3name2
	Inst22Quest3name3_HORDE = Inst22Quest3name3
	Inst22Quest3name4_HORDE = Inst22Quest3name4
	
	--Quest 4 Horde  (same as Quest 4 Alliance)
	Inst22Quest4_HORDE = Inst22Quest4
	Inst22Quest4_HORDE_Level = Inst22Quest4_Level
	Inst22Quest4_HORDE_Attain = Inst22Quest4_Attain
	Inst22Quest4_HORDE_Aim = Inst22Quest4_Aim
	Inst22Quest4_HORDE_Location = Inst22Quest4_Location
	Inst22Quest4_HORDE_Note = Inst22Quest4_Note
	Inst22Quest4_HORDE_Prequest = Inst22Quest4_Prequest
	Inst22Quest4_HORDE_Folgequest = Inst22Quest4_Folgequest
	--
	Inst22Quest4name1_HORDE = Inst22Quest4name1
	
	--Quest 5 Horde  (same as Quest 5 Alliance)
	Inst22Quest5_HORDE = Inst22Quest5
	Inst22Quest5_HORDE_Level = Inst22Quest5_Level
	Inst22Quest5_HORDE_Attain = Inst22Quest5_Attain
	Inst22Quest5_HORDE_Aim = Inst22Quest5_Aim
	Inst22Quest5_HORDE_Location = Inst22Quest5_Location
	Inst22Quest5_HORDE_Note = Inst22Quest5_Note
	Inst22Quest5_HORDE_Prequest = Inst22Quest5_Prequest
	Inst22Quest5_HORDE_Folgequest = Inst22Quest5_Folgequest
	--
	Inst22Quest5name1_HORDE = Inst22Quest5name1
	
	--Quest 6 Horde  (same as Quest 6 Alliance)
	Inst22Quest6_HORDE = Inst22Quest6
	Inst22Quest6_HORDE_Level = Inst22Quest6_Level
	Inst22Quest6_HORDE_Attain = Inst22Quest6_Attain
	Inst22Quest6_HORDE_Aim = Inst22Quest6_Aim
	Inst22Quest6_HORDE_Location = Inst22Quest6_Location
	Inst22Quest6_HORDE_Note = Inst22Quest6_Note
	Inst22Quest6_HORDE_Prequest = Inst22Quest6_Prequest
	Inst22Quest6_HORDE_Folgequest = Inst22Quest6_Folgequest
	-- No Rewards for this quest
	
	--Quest 7 Horde  (same as Quest 7 Alliance)
	Inst22Quest7_HORDE = Inst22Quest7
	Inst22Quest7_HORDE_Level = Inst22Quest7_Level
	Inst22Quest7_HORDE_Attain = Inst22Quest7_Attain
	Inst22Quest7_HORDE_Aim = Inst22Quest7_Aim
	Inst22Quest7_HORDE_Location = Inst22Quest7_Location
	Inst22Quest7_HORDE_Note = Inst22Quest7_Note
	Inst22Quest7_HORDE_Prequest = Inst22Quest7_Prequest
	Inst22Quest7_HORDE_Folgequest = Inst22Quest7_Folgequest
	-- No Rewards for this quest
	
	--Quest 8 Horde  (same as Quest 8 Alliance)
	Inst22Quest8_HORDE = Inst22Quest8
	Inst22Quest8_HORDE_Level = Inst22Quest8_Level
	Inst22Quest8_HORDE_Attain = Inst22Quest8_Attain
	Inst22Quest8_HORDE_Aim = Inst22Quest8_Aim
	Inst22Quest8_HORDE_Location = Inst22Quest8_Location
	Inst22Quest8_HORDE_Note = Inst22Quest8_Note
	Inst22Quest8_HORDE_Prequest = Inst22Quest8_Prequest
	Inst22Quest8_HORDE_Folgequest = Inst22Quest8_Folgequest
	--
	Inst22Quest8name1_HORDE = Inst22Quest8name1
	Inst22Quest8name2_HORDE = Inst22Quest8name2
	
	--Quest 9 Horde  (same as Quest 9 Alliance)
	Inst22Quest9_HORDE = Inst22Quest9
	Inst22Quest9_HORDE_Level = Inst22Quest9_Level
	Inst22Quest9_HORDE_Attain = Inst22Quest9_Attain
	Inst22Quest9_HORDE_Aim = Inst22Quest9_Aim
	Inst22Quest9_HORDE_Location = Inst22Quest9_Location
	Inst22Quest9_HORDE_Note = Inst22Quest9_Note
	Inst22Quest9_HORDE_Prequest = Inst22Quest9_Prequest
	Inst22Quest9_HORDE_Folgequest = Inst22Quest9_Folgequest
	-- No Rewards for this quest
	
	--Quest 10 Horde  (same as Quest 10 Alliance)
	Inst22Quest10_HORDE = Inst22Quest10
	Inst22Quest10_HORDE_Level = Inst22Quest10_Level
	Inst22Quest10_HORDE_Attain = Inst22Quest10_Attain
	Inst22Quest10_HORDE_Aim = Inst22Quest10_Aim
	Inst22Quest10_HORDE_Location = Inst22Quest10_Location
	Inst22Quest10_HORDE_Note = Inst22Quest10_Note
	Inst22Quest10_HORDE_Prequest = Inst22Quest10_Prequest
	Inst22Quest10_HORDE_Folgequest = Inst22Quest10_Folgequest
	-- No Rewards for this quest
	
	--Quest 11 Horde  (same as Quest 11 Alliance)
	Inst22Quest11_HORDE = Inst22Quest11
	Inst22Quest11_HORDE_Level = Inst22Quest11_Level
	Inst22Quest11_HORDE_Attain = Inst22Quest11_Attain
	Inst22Quest11_HORDE_Aim = Inst22Quest11_Aim
	Inst22Quest11_HORDE_Location = Inst22Quest11_Location
	Inst22Quest11_HORDE_Note = Inst22Quest11_Note
	Inst22Quest11_HORDE_Prequest = Inst22Quest11_Prequest
	Inst22Quest11_HORDE_Folgequest = Inst22Quest11_Folgequest
	--
	Inst22Quest11name1_HORDE = Inst22Quest11name1
	Inst22Quest11name2_HORDE = Inst22Quest11name2
	Inst22Quest11name3_HORDE = Inst22Quest11name3
	
	--Quest 12 Horde  (same as Quest 12 Alliance)
	Inst22Quest12_HORDE = Inst22Quest12
	Inst22Quest12_HORDE_Level = Inst22Quest12_Level
	Inst22Quest12_HORDE_Attain = Inst22Quest12_Attain
	Inst22Quest12_HORDE_Aim = Inst22Quest12_Aim
	Inst22Quest12_HORDE_Location = Inst22Quest12_Location
	Inst22Quest12_HORDE_Note = Inst22Quest12_Note
	Inst22Quest12_HORDE_Prequest = Inst22Quest12_Prequest
	Inst22Quest12_HORDE_Folgequest = Inst22Quest12_Folgequest
	-- No Rewards for this quest
	
	--Quest 13 Horde  (same as Quest 13 Alliance)
	Inst22Quest13_HORDE = Inst22Quest13
	Inst22Quest13_HORDE_Level = Inst22Quest13_Level
	Inst22Quest13_HORDE_Attain = Inst22Quest13_Attain
	Inst22Quest13_HORDE_Aim = Inst22Quest13_Aim
	Inst22Quest13_HORDE_Location = Inst22Quest13_Location
	Inst22Quest13_HORDE_Note = Inst22Quest13_Note
	Inst22Quest13_HORDE_Prequest = Inst22Quest13_Prequest
	Inst22Quest13_HORDE_Folgequest = Inst22Quest13_Folgequest
	-- No Rewards for this quest
	
	--Quest 14 Horde  (same as Quest 14 Alliance)
	Inst22Quest14_HORDE = Inst22Quest14
	Inst22Quest14_HORDE_Level = Inst22Quest14_Level
	Inst22Quest14_HORDE_Attain = Inst22Quest14_Attain
	Inst22Quest14_HORDE_Aim = Inst22Quest14_Aim
	Inst22Quest14_HORDE_Location = Inst22Quest14_Location
	Inst22Quest14_HORDE_Note = Inst22Quest14_Note
	Inst22Quest14_HORDE_Prequest = Inst22Quest14_Prequest
	Inst22Quest14_HORDE_Folgequest = Inst22Quest14_Folgequest
	-- No Rewards for this quest
	
	--Quest 15 Horde  (same as Quest 15 Alliance)
	Inst22Quest15_HORDE = Inst22Quest15
	Inst22Quest15_HORDE_Level = Inst22Quest15_Level
	Inst22Quest15_HORDE_Attain = Inst22Quest15_Attain
	Inst22Quest15_HORDE_Aim = Inst22Quest15_Aim
	Inst22Quest15_HORDE_Location = Inst22Quest15_Location
	Inst22Quest15_HORDE_Note = Inst22Quest15_Note
	Inst22Quest15_HORDE_Prequest = Inst22Quest15_Prequest
	Inst22Quest15_HORDE_Folgequest = Inst22Quest15_Folgequest
	--
	Inst22Quest15name1_HORDE = Inst22Quest15name1
	Inst22Quest15name2_HORDE = Inst22Quest15name2
	Inst22Quest15name3_HORDE = Inst22Quest15name3
	Inst22Quest15name4_HORDE = Inst22Quest15name4
	
	--Quest 16 Horde  (same as Quest 16 Alliance)
	Inst22Quest16_HORDE = Inst22Quest16
	Inst22Quest16_HORDE_Level = Inst22Quest16_Level
	Inst22Quest16_HORDE_Attain = Inst22Quest16_Attain
	Inst22Quest16_HORDE_Aim = Inst22Quest16_Aim
	Inst22Quest16_HORDE_Location = Inst22Quest16_Location
	Inst22Quest16_HORDE_Note = Inst22Quest16_Note
	Inst22Quest16_HORDE_Prequest = Inst22Quest16_Prequest
	Inst22Quest16_HORDE_Folgequest = Inst22Quest16_Folgequest
	--
	Inst22Quest16name1_HORDE = Inst22Quest16name1
	
	--Quest 17 Horde  (same as Quest 17 Alliance)
	Inst22Quest17_HORDE = Inst22Quest17
	Inst22Quest17_HORDE_Level = Inst22Quest17_Level
	Inst22Quest17_HORDE_Attain = Inst22Quest17_Attain
	Inst22Quest17_HORDE_Aim = Inst22Quest17_Aim
	Inst22Quest17_HORDE_Location = Inst22Quest17_Location
	Inst22Quest17_HORDE_Note = Inst22Quest17_Note
	Inst22Quest17_HORDE_Prequest = Inst22Quest17_Prequest
	Inst22Quest17_HORDE_Folgequest = Inst22Quest17_Folgequest
	--
	Inst22Quest17name1_HORDE = Inst22Quest17name1
	
	--Quest 18 Horde
	Inst22Quest18_HORDE = "18. Рамштайн"
	Inst22Quest18_HORDE_Level = "60"
	Inst22Quest18_HORDE_Attain = "?"
	Inst22Quest18_HORDE_Aim = "Отправляйтесь в Стратхольм и убейте Рамштайна Ненасытного. Принесите его голову Натаносу в качестве сувенира."
	Inst22Quest18_HORDE_Location = "Натанос Гниль (Восточные Чумные земли; "..YELLOW.."26,74"..WHITE..")"
	Inst22Quest18_HORDE_Note = "Вы возьмете предшествующее задание также у Натаноса Гнили. Вы найдете Рамштайна около "..YELLOW.."[14]"..WHITE.."."
	Inst22Quest18_HORDE_Prequest = "Охота на cледопытов -> Проклятый Тенекрыл"
	Inst22Quest18_HORDE_Folgequest = "Нет"
	--
	Inst22Quest18name1_HORDE = "Royal Seal of Alexis"
	Inst22Quest18name2_HORDE = "Elemental Circle"
	
	--Quest 19 Horde  (same as Quest 18 Alliance)
	Inst22Quest19_HORDE = "19. The Balance of Light and Shadow"
	Inst22Quest19_HORDE_Level = Inst22Quest18_Level
	Inst22Quest19_HORDE_Attain = Inst22Quest18_Attain
	Inst22Quest19_HORDE_Aim = Inst22Quest18_Aim
	Inst22Quest19_HORDE_Location = Inst22Quest18_Location
	Inst22Quest19_HORDE_Note = Inst22Quest18_Note
	Inst22Quest19_HORDE_Prequest = Inst22Quest18_Prequest
	Inst22Quest19_HORDE_Folgequest = Inst22Quest18_Folgequest
	--
	Inst22Quest19name1_HORDE = Inst22Quest18name1
	
	
	
	--------------- INST23 - The Ruins of Ahn'Qiraj (AQ20) ---------------
	Inst23Story = "В последние часы Войны зыбучих песков, объединенные силы ночных эльфов и четырех драконьих стай довели битву до самого сердца империи кираджи, в город-крепость Ан'Кираж. Еще у городских ворот, армии Калимдора встретились с концентрацией боевых трутней силитидов, намного превосходившей виденую когда-либо ранее. В конечном счете силитиды и их хозяева-кираджи так и не были побеждены, а только изолированы внутри магического барьера. Война оставила проклятый город в руинах. Тысяча лет прошла с того дня, но силы кираджи не сидели без дела. Новая ужасная армия родилась в ульях, и руины Ан'Киража снова кишат роями силитидов и кираджи. Эта угроза должна быть уничтожена, иначе весь Азерот может пасть перед ужасающей мощью новой армии кираджи."
	Inst23Caption = "Руины Ан'Киража"
	Inst23QAA = "2 Задания"
	Inst23QAH = "2 Задания"
	
	--Quest 1 Alliance
	Inst23Quest1 = "1. The Fall of Ossirian"
	Inst23Quest1_Level = "60"
	Inst23Quest1_Attain = "60"
	Inst23Quest1_Aim = "Deliver the Head of Ossirian the Unscarred to Commander Mar'alith at Cenarion Hold in Silithus."
	Inst23Quest1_Location = "Head of Ossirian the Unscarred (drops from Ossirian the Unscarred; "..YELLOW.."[6]"..WHITE..")"
	Inst23Quest1_Note = "Commander Mar'alith (Silithus - Cenarion Hold; "..YELLOW.."49,34"..WHITE..")"
	Inst23Quest1_Prequest = "Нет"
	Inst23Quest1_Folgequest = "Нет"
	--
	Inst23Quest1name1 = "Charm of the Shifting Sands"
	Inst23Quest1name2 = "Amulet of the Shifting Sands"
	Inst23Quest1name3 = "Choker of the Shifting Sands"
	Inst23Quest1name4 = "Pendant of the Shifting Sands"
	
	--Quest 2 Alliance
	Inst23Quest2 = "2. The Perfect Poison"
	Inst23Quest2_Level = "60"
	Inst23Quest2_Attain = "60"
	Inst23Quest2_Aim = "Dirk Thunderwood at Cenarion Hold wants you to bring him Venoxis's Venom Sac and Kurinnaxx's Venom Sac."
	Inst23Quest2_Location = "Dirk Thunderwood (Silithus - Cenarion Hold; "..YELLOW.."52,39"..WHITE..")"
	Inst23Quest2_Note = "Venoxis's Venom Sac drops from High priest Venoxis in "..YELLOW.."Zul'Gurub"..WHITE..". Kurinnaxx's Venom Sac drops in the "..YELLOW.."Ruins of Ahn'Qiraj"..WHITE.." at "..YELLOW.."[1]"..WHITE.."."
	Inst23Quest2_Prequest = "Нет"
	Inst23Quest2_Folgequest = "Нет"
	--
	Inst23Quest2name1 = "Ravenholdt Slicer"
	Inst23Quest2name2 = "Shivsprocket's Shiv"
	Inst23Quest2name3 = "The Thunderwood Poker"
	Inst23Quest2name4 = "Doomulus Prime"
	Inst23Quest2name5 = "Fahrad's Reloading Repeater"
	Inst23Quest2name6 = "Simone's Cultivating Hammer"
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst23Quest1_HORDE = Inst23Quest1
	Inst23Quest1_HORDE_Level = Inst23Quest1_Level
	Inst23Quest1_HORDE_Attain = Inst23Quest1_Attain
	Inst23Quest1_HORDE_Aim = Inst23Quest1_Aim
	Inst23Quest1_HORDE_Location = Inst23Quest1_Location
	Inst23Quest1_HORDE_Note = Inst23Quest1_Note
	Inst23Quest1_HORDE_Prequest = Inst23Quest1_Prequest
	Inst23Quest1_HORDE_Folgequest = Inst23Quest1_Folgequest
	--
	Inst23Quest1name1_HORDE = Inst23Quest1name1
	Inst23Quest1name2_HORDE = Inst23Quest1name2
	Inst23Quest1name3_HORDE = Inst23Quest1name3
	Inst23Quest1name4_HORDE = Inst23Quest1name4
	
	--Quest 2 Horde  (same as Quest 2 Alliance)
	Inst23Quest2_HORDE = Inst23Quest2
	Inst23Quest2_HORDE_Level = Inst23Quest2_Level
	Inst23Quest2_HORDE_Attain = Inst23Quest2_Attain
	Inst23Quest2_HORDE_Aim = Inst23Quest2_Aim
	Inst23Quest2_HORDE_Location = Inst23Quest2_Location
	Inst23Quest2_HORDE_Note = Inst23Quest2_Note
	Inst23Quest2_HORDE_Prequest = Inst23Quest2_Prequest
	Inst23Quest2_HORDE_Folgequest = Inst23Quest2_Folgequest
	--
	Inst23Quest2name1_HORDE = Inst23Quest2name1
	Inst23Quest2name2_HORDE = Inst23Quest2name2
	Inst23Quest2name3_HORDE = Inst23Quest2name3
	Inst23Quest2name4_HORDE = Inst23Quest2name4
	Inst23Quest2name5_HORDE = Inst23Quest2name5
	Inst23Quest2name6_HORDE = Inst23Quest2name6
	
	
	
	--------------- INST24 - The Stockade (Stocks) ---------------
	Inst24Story = "Тюрьма - это хорошо защищенный тюремный комплекс, скрытый под районом каналов Штормграда. Под руководством тюремщика Телвотера, Тюрьма стала домом мелких жуликов, мятежников, убийц и пары десятков самых опасных преступников в стране. Недавно, поднятое заключенными восстание превратило Тюрьму бог знает во что - охранников выгнали, а осужденные разгуливают на свободе. Тюремщик Телвотер умудрился выбраться из зоны и теперь вербует отважных экстремалов совершить вылазку в тюрьму и убить вдохновителя восстания - опасного уголовника, Базиля Тредда."
	Inst24Caption = "Тюрьма Штормграда"
	Inst24QAA = "6 Заданий"
	Inst24QAH = "Нет заданий"
	
	--Quest 1 Alliance
	Inst24Quest1 = "1. Что происходит?"
	Inst24Quest1_Level = "25"
	Inst24Quest1_Attain = "22"
	Inst24Quest1_Aim = "Принесите голову Таргорра Ужасного стражнику Бертону в Приозерье."
	Inst24Quest1_Location = "Стражник Бертон (Красногорье - Приозерье; "..YELLOW.."26,46"..WHITE..")"
	Inst24Quest1_Note = "Вы найдете Таргорра около "..YELLOW.."[1]"..WHITE.."."
	Inst24Quest1_Prequest = "Нет"
	Inst24Quest1_Folgequest = "Нет"
	--
	Inst24Quest1name1 = "Lucine Longsword"
	Inst24Quest1name2 = "Hardened Root Staff"
	
	--Quest 2 Alliance
	Inst24Quest2 = "2. Преступление и наказание"
	Inst24Quest2_Level = "26"
	Inst24Quest2_Attain = "22"
	Inst24Quest2_Aim = "Принести советнику Миллстайпу руку Декстрена Варда."
	Inst24Quest2_Location = "Миллстайп (Сумеречный лес - Темнолесье; "..YELLOW.."72,47"..WHITE..")"
	Inst24Quest2_Note = "Вы найдете Декстрена около "..YELLOW.."[5]"..WHITE.."."
	Inst24Quest2_Prequest = "Нет"
	Inst24Quest2_Folgequest = "Нет"
	--
	Inst24Quest2name1 = "Ambassador's Boots"
	Inst24Quest2name2 = "Darkshire Mail Leggings"
	
	--Quest 3 Alliance
	Inst24Quest3 = "3. Подавление восстания"
	Inst24Quest3_Level = "26"
	Inst24Quest3_Attain = "22"
	Inst24Quest3_Aim = "Тюремщик Телвотер просит Вас убить в тюрьме 10 узников из Братства Справедливости, 8 каторжников из Братства Справедливости и 8 мятежников из Братства Справедливости."
	Inst24Quest3_Location = "Тюремщик Телвотер (Штормград - Тюрьма Штормграда; "..YELLOW.."41,58"..WHITE..")"
	Inst24Quest3_Note = ""
	Inst24Quest3_Prequest = "Нет"
	Inst24Quest3_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 4 Alliance
	Inst24Quest4 = "4. Цвет крови"
	Inst24Quest4_Level = "26"
	Inst24Quest4_Attain = "?"
	Inst24Quest4_Aim = "Принесите Никовии Раскол 10 красных шерстяных бандан."
	Inst24Quest4_Location = "Никовия Раскол (Штормград - Старый город; "..YELLOW.."73,46"..WHITE..")"
	Inst24Quest4_Note = "Со всех бандитов внутри Тюрьмы могут упасть красные шерстяные банданы."
	Inst24Quest4_Prequest = "Нет"
	Inst24Quest4_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 5 Alliance
	Inst24Quest5 = "5. Успокоить гневливого"
	Inst24Quest5_Level = "27"
	Inst24Quest5_Attain = "25"
	Inst24Quest5_Aim = "Принесите голову Кама Гневливого Мотли Каменщику в Дун Модр."
	Inst24Quest5_Location = "Мотли Каменщик (Болотина - Дун Модр; "..YELLOW.."49,18"..WHITE..")"
	Inst24Quest5_Note = "Предшествующее задание также можно взять у Мотли. Вы найдете Кама Гневливого около "..YELLOW.."[2]"..WHITE.."."
	Inst24Quest5_Prequest = "Война с Черным Железом"
	Inst24Quest5_Folgequest = "Нет"
	--
	Inst24Quest5name1 = "Belt of Vindication"
	Inst24Quest5name2 = "Headbasher"
	
	--Quest 6 Alliance
	Inst24Quest6 = "6. Бунтовщики в тюрьме"
	Inst24Quest6_Level = "29"
	Inst24Quest6_Attain = "16"
	Inst24Quest6_Aim = "Убейте Базиля Тредда и принесите его голову Телвотеру в тюрьму Штормграда."
	Inst24Quest6_Location = "Тюремщик Телвотер (Штормград - Тюрьма Штормграда; "..YELLOW.."41,58"..WHITE..")"
	Inst24Quest6_Note = "Для более детальной информации о предшествующем задании смотрите "..YELLOW.."[Мертвые копи, Братство справедливости]"..WHITE..".\nВы найдете Базиля Тредда около "..YELLOW.."[4]"..WHITE.."."
	Inst24Quest6_Prequest = "Братство Справедливости -> Базиль Тредд"
	Inst24Quest6_Folgequest = "Таинственный посетитель"
	-- No Rewards for this quest
	
	
	
	--------------- INST25 - Sunken Temple (ST) ---------------
	Inst25Story = "Свыше тысячи лет назад, могущественная империя Гурбаши была разорвана на части всеобщей гражданской войной. Влиятельная группа жрецов троллей, известная как Атал'аи, предприняла попытку призвать древнего кровавого бога по имени Хаккар Свежеватель Душ. Несмотря на то, что жрецы потерпели поражение и были изгнаны навеки, великая империя троллей не смогла сохранить целостность. Изгнанные жрецы бежали далеко на север, в Болота Печали. Там они возвели великий храм в честь Хаккара - где они могли приготовиться к его прибытию в материальный мир. Великий дракон Аспект, Изера, узнала о планах Атал'аи и утопила храм в болотах. На сегодняшний день, затопленные руины храма охраняются зелеными драконами, которые следят за тем, чтобы никто не входил и не выходил оттуда. Однако, есть мнение, что несколько фанатичных Атал'аи могли выжить и сбежать от гнева Изеры - а теперь вновь посвятили себя темному служению Хаккару."
	Inst25Caption = "Затонувший храм"
	Inst25QAA = "18 Заданий"
	Inst25QAH = "18 Заданий"
	
	--Quest 1 Alliance
	Inst25Quest1 = "1. В Храме Атал'Хаккара"
	Inst25Quest1_Level = "50"
	Inst25Quest1_Attain = "46"
	Inst25Quest1_Aim = "Соберите 10 табличек Аталаи для Брохана Бочкопуза из Штормграда."
	Inst25Quest1_Location = "Брохан Бочкопуз (Штормград - Квартал дворфов; "..YELLOW.."64,20"..WHITE..")"
	Inst25Quest1_Note = "Серия предшествующих заданий начинается у того же НИП и имеет несколько этапов.\n\nВы сможете найти таблички по всему Храму, и внутри и снаружи подземелья."
	Inst25Quest1_Prequest = "В поисках Храма -> Рапсодия о болоте"
	Inst25Quest1_Folgequest = "Нет"
	--
	Inst25Quest1name1 = "Guardian Talisman"
	
	--Quest 2 Alliance
	Inst25Quest2 = "2. Затонувший храм"
	Inst25Quest2_Level = "51"
	Inst25Quest2_Attain = "-"
	Inst25Quest2_Aim = "Найдите Марвона Клепальщика в Танарисе."
	Inst25Quest2_Location = "Ангелас Лунный Бриз (Фералас - Крепость Оперенной Луны; "..YELLOW.."31,45"..WHITE..")"
	Inst25Quest2_Note = "Вы найдете Марвона Клепальщика около "..YELLOW.."52,45"..WHITE.."."
	Inst25Quest2_Prequest = "Нет"
	Inst25Quest2_Folgequest = "Круглый камень"
	-- No Rewards for this quest
	
	--Quest 3 Alliance
	Inst25Quest3 = "3. Во глубине болот"
	Inst25Quest3_Level = "51"
	Inst25Quest3_Attain = "-"
	Inst25Quest3_Aim = "Найдите алтарь Хаккара в затонувшем храме на Болоте Печали."
	Inst25Quest3_Location = "Марвон Клепальщик (Танарис; "..YELLOW.."52,45"..WHITE..")"
	Inst25Quest3_Note = "Алтарь находится около "..YELLOW.."[1]"..WHITE.."."
	Inst25Quest3_Prequest = "Круглый камень"
	Inst25Quest3_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 4 Alliance
	Inst25Quest4 = "4. Тайна камня"
	Inst25Quest4_Level = "51"
	Inst25Quest4_Attain = "-"
	Inst25Quest4_Aim = "Отправляйтесь в затонувший храм и узнайте, что скрывается в круге статуй."
	Inst25Quest4_Location = "Марвон Клепальщик (Танарис; "..YELLOW.."52,45"..WHITE..")"
	Inst25Quest4_Note = "Вы найдете статуи около "..YELLOW.."[1]"..WHITE..". Смотрите по карте порядок их активации."
	Inst25Quest4_Prequest = "Круглый камень"
	Inst25Quest4_Folgequest = "Нет"
	--
	Inst25Quest4name1 = "Hakkari Urn"
	
	--Quest 5 Alliance
	Inst25Quest5 = "5. Туман зла"
	Inst25Quest5_Level = "52"
	Inst25Quest5_Attain = "50"
	Inst25Quest5_Aim = "Соберите 5 образцов тумана Аталаи и принесите их Майджину в Кратер Ун'Горо."
	Inst25Quest5_Location = "Греган Пивоплюй (Фералас; "..YELLOW.."45,25"..WHITE..")"
	Inst25Quest5_Note = "Предшествующее задание 'Майджин и Ларион' начинается у Майджина (Кратер Ун'Горо - Укрытие Маршалла; "..YELLOW.."42,9"..WHITE.."). Вы возьмете образцы тумана с Глубинных скрытней, Мракочервей или слизнюков в Храме."
	Inst25Quest5_Prequest = "Майджин и Ларион -> Визит к Грегану "
	Inst25Quest5_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 6 Alliance
	Inst25Quest6 = "6. Бог Хаккар"
	Inst25Quest6_Level = "53"
	Inst25Quest6_Attain = "43"
	Inst25Quest6_Aim = "Отнесите заполненное яйцо Хаккара Йе'кинье в Танарис."
	Inst25Quest6_Location = "Йе'кинья (Танарис - Порт Картеля; "..YELLOW.."66,22"..WHITE..")"
	Inst25Quest6_Note = "Цепочка заданий начинается с 'Духи крикунов' у того же НИП (См. "..YELLOW.."[Зул'Фаррак]"..WHITE..").\nВы должны задействовать Яйцо около "..YELLOW.."[3]"..WHITE.." чтобы начать Событие. Когда оно начнется, появятся враги и атакуют Вас. С некоторых их них падает Кровь Хаккара. С этой кровью вы можете убрать факелы вокруг круга. После этого появится Аватара Хаккара. Вы убьете ее и получите 'Сущность Хаккара' Которую используете, чтобы наполнить яйцо."
	Inst25Quest6_Prequest = "Духи крикунов -> Древнее яйцо"
	Inst25Quest6_Folgequest = "Нет"
	--
	Inst25Quest6name1 = "Avenguard Helm"
	Inst25Quest6name2 = "Lifeforce Dirk"
	Inst25Quest6name3 = "Gemburst Circlet"
	
	--Quest 7 Alliance
	Inst25Quest7 = "7. Джаммал'ан Пророк"
	Inst25Quest7_Level = "53"
	Inst25Quest7_Attain = "43"
	Inst25Quest7_Aim = "Принесите изгнаннику Атал'ай из Внутренних земель голову Джаммал'ана."
	Inst25Quest7_Location = "Изгнанник Атал'ай (Внутренние земли; "..YELLOW.."33,75"..WHITE..")"
	Inst25Quest7_Note = "Вы найдете Джаммал'ана около "..YELLOW.."[4]"..WHITE.."."
	Inst25Quest7_Prequest = "Нет"
	Inst25Quest7_Folgequest = "Нет"
	--
	Inst25Quest7name1 = "Rainstrider Leggings"
	Inst25Quest7name2 = "Helm of Exile"
	
	--Quest 8 Alliance
	Inst25Quest8 = "8. Сущность Эраникуса"
	Inst25Quest8_Level = "55"
	Inst25Quest8_Attain = "-"
	Inst25Quest8_Aim = "Поместите сущность Эраникуса в купель сущности в его логове в затонувшем храме."
	Inst25Quest8_Location = "Сущность Эраникуса (падает с Тени Эраникуса; "..YELLOW.."[6]"..WHITE..")"
	Inst25Quest8_Note = "Вы найдете Купель сущности рядом с местом где находится Тень Эраникуса около "..YELLOW.."[6]"..WHITE.."."
	Inst25Quest8_Prequest = "Нет"
	Inst25Quest8_Folgequest = "Нет"
	--
	Inst25Quest8name1 = "Chained Essence of Eranikus"
	
	--Quest 9 Alliance
	Inst25Quest9 = "9. Trolls of a Feather"
	Inst25Quest9_Level = "52"
	Inst25Quest9_Attain = "50"
	Inst25Quest9_Aim = "Bring a total of 6 Voodoo Feathers from the trolls in sunken temple."
	Inst25Quest9_Location = "Impsy (Felwood; "..YELLOW.."42,45"..WHITE..")"
	Inst25Quest9_Note = "Задание для чернокнижников: 1 Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center."
	Inst25Quest9_Prequest = "An Imp's Request -> The Wrong Stuff"
	Inst25Quest9_Folgequest = "Нет"
	--
	Inst25Quest9name1 = "Soul Harvester"
	Inst25Quest9name2 = "Abyss Shard"
	Inst25Quest9name3 = "Robes of Servitude"
	
	--Quest 10 Alliance
	Inst25Quest10 = "10. Voodoo Feathers"
	Inst25Quest10_Level = "52"
	Inst25Quest10_Attain = "50"
	Inst25Quest10_Aim = "Bring the Voodoo Feathers from the trolls in the Sunken Temple to the Fallen Hero of the Horde."
	Inst25Quest10_Location = "Fallen Hero of the Horde (Swamp of Sorrows; "..YELLOW.."34,66"..WHITE..")"
	Inst25Quest10_Note = "Задание для воинов: 1 Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center."
	Inst25Quest10_Prequest = "A Troubled Spirit -> War on the Shadowsworn"
	Inst25Quest10_Folgequest = "Нет"
	--
	Inst25Quest10name1 = "Fury Visor"
	Inst25Quest10name2 = "Diamond Flask"
	Inst25Quest10name3 = "Razorsteel Shoulders"
	
	--Quest 11 Alliance
	Inst25Quest11 = "11. Da Voodoo"
	Inst25Quest11_Level = "52"
	Inst25Quest11_Attain = "50"
	Inst25Quest11_Aim = "Bring the voodoo feathers to Bath'rah the Windwatcher."
	Inst25Quest11_Location = "Bath'rah the Windwatcher (Alterac Mountains; "..YELLOW.."80,67"..WHITE..")"
	Inst25Quest11_Note = "Задание для шаманов: 1 Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center."
	Inst25Quest11_Prequest = "Spirit Totem"
	Inst25Quest11_Folgequest = "Нет"
	--
	Inst25Quest11name1 = "Azurite Fists"
	Inst25Quest11name2 = "Enamored Water Spirit"
	Inst25Quest11name3 = "Wildstaff"
	
	--Quest 12 Alliance
	Inst25Quest12 = "12. A Better Ingredient"
	Inst25Quest12_Level = "52"
	Inst25Quest12_Attain = "50"
	Inst25Quest12_Aim = "Retrieve a Putrid Vine from the guardian at the bottom of the Sunken Temple and return to Torwa Pathfinder."
	Inst25Quest12_Location = "Torwa Pathfinder (Un'Goro Crater; "..YELLOW.."72,76"..WHITE..")"
	Inst25Quest12_Note = "Задание для друидов: The Putrid Vine drops from Atal'alarion who is summoned at "..YELLOW.."[1]"..WHITE.." by activating the statues in the order listed on the map."
	Inst25Quest12_Prequest = "Torwa Pathfinder -> Toxic Test"
	Inst25Quest12_Folgequest = "Нет"
	--
	Inst25Quest12name1 = "Grizzled Pelt"
	Inst25Quest12name2 = "Forest's Embrace"
	Inst25Quest12name3 = "Moonshadow Stave"
	
	--Quest 13 Alliance
	Inst25Quest13 = "13. The Green Drake"
	Inst25Quest13_Level = "52"
	Inst25Quest13_Attain = "50"
	Inst25Quest13_Aim = "Bring the Tooth of Morphaz to Ogtinc in Azshara. Ogtinc resides atop the cliffs northeast the Ruins of Eldarath."
	Inst25Quest13_Location = "Ogtinc (Azshara; "..YELLOW.."42,43"..WHITE..")"
	Inst25Quest13_Note = "Задание для охотников: Morphaz is at "..YELLOW.."[5]"..WHITE.."."
	Inst25Quest13_Prequest = "The Hunter's Charm -> Wavethrashing"
	Inst25Quest13_Folgequest = "Нет"
	--
	Inst25Quest13name1 = "Hunting Spear"
	Inst25Quest13name2 = "Devilsaur Eye"
	Inst25Quest13name3 = "Devilsaur Tooth"
	
	--Quest 14 Alliance
	Inst25Quest14 = "14. Destroy Morphaz"
	Inst25Quest14_Level = "52"
	Inst25Quest14_Attain = "50"
	Inst25Quest14_Aim = "Retrieve the Arcane Shard from Morphaz and return to Archmage Xylem."
	Inst25Quest14_Location = "Archmage Xylem (Azshara; "..YELLOW.."29,40"..WHITE..")"
	Inst25Quest14_Note = "Задание для магов: Morphaz is at "..YELLOW.."[5]"..WHITE.."."
	Inst25Quest14_Prequest = "Magic Dust -> The Siren's Coral"
	Inst25Quest14_Folgequest = "Нет"
	--
	Inst25Quest14name1 = "Glacial Spike"
	Inst25Quest14name2 = "Arcane Crystal Pendant"
	Inst25Quest14name3 = "Fire Ruby"
	
	--Quest 15 Alliance
	Inst25Quest15 = "15. Blood of Morphaz"
	Inst25Quest15_Level = "52"
	Inst25Quest15_Attain = "50"
	Inst25Quest15_Aim = "Kill Morphaz in the sunken temple of Atal'Hakkar, and return his blood to Greta Mosshoof in Felwood. The entrance to the sunken temple can be found in the Swamp of Sorrows."
	Inst25Quest15_Location = "Ogtinc (Azshara; "..YELLOW.."42,43"..WHITE..")"
	Inst25Quest15_Note = "Задание для жрецов: Morphaz is at "..YELLOW.."[5]"..WHITE..". Greta Mosshoof is at Felwood - Emerald Sanctuary ("..YELLOW.."51,82"..WHITE..")."
	Inst25Quest15_Prequest = "Cenarion Aid -> The Ichor of Undeath"
	Inst25Quest15_Folgequest = "Нет"
	--
	Inst25Quest15name1 = "Blessed Prayer Beads"
	Inst25Quest15name2 = "Woestave"
	Inst25Quest15name3 = "Circle of Hope"
	
	--Quest 16 Alliance
	Inst25Quest16 = "16. The Azure Key"
	Inst25Quest16_Level = "52"
	Inst25Quest16_Attain = "50"
	Inst25Quest16_Aim = "Return the Azure Key to Lord Jorach Ravenholdt."
	Inst25Quest16_Location = "Archmage Xylem (Azshara; "..YELLOW.."29,40"..WHITE..")"
	Inst25Quest16_Note = "Задание для разбойников: The Azure Key drops from Morphaz at "..YELLOW.."[5]"..WHITE..". Lord Jorach Ravenholdt is at Alterac Mountains - Ravenholdt ("..YELLOW.."86,79"..WHITE..")."
	Inst25Quest16_Prequest = "A Simple Request -> Encoded Fragments"
	Inst25Quest16_Folgequest = "Нет"
	--
	Inst25Quest16name1 = "Ebon Mask"
	Inst25Quest16name2 = "Whisperwalk Boots"
	Inst25Quest16name3 = "Duskbat Drape"
	
	--Quest 17 Alliance
	Inst25Quest17 = "17. Forging the Mightstone"
	Inst25Quest17_Level = "52"
	Inst25Quest17_Attain = "50"
	Inst25Quest17_Aim = "Bring the voodoo feathers to Ashlam Valorfist."
	Inst25Quest17_Location = "Commander Ashlam Valorfist (Western Plaguelands - Chillwind Camp; "..YELLOW.."43,85"..WHITE..")"
	Inst25Quest17_Note = "Задание для паладинов: 1 Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center."
	Inst25Quest17_Prequest = "Inert Scourgestones"
	Inst25Quest17_Folgequest = "Нет"
	--
	Inst25Quest17name1 = "Holy Mightstone"
	Inst25Quest17name2 = "Lightforged Blade"
	Inst25Quest17name3 = "Sanctified Orb"
	Inst25Quest17name4 = "Chivalrous Signet"
	
	--Quest 18 Alliance
	Inst25Quest18 = "18. Eranikus, Tyrant of the Dream"
	Inst25Quest18_Level = "60"
	Inst25Quest18_Attain = "60"
	Inst25Quest18_Aim = "Travel to the continent of Teldrassil and find Malfurion's agent somewhere outside the walls of Darnassus."
	Inst25Quest18_Location = "Malfurion Stormrage (Spawns at Shade of Eranikus; "..YELLOW.."[8]"..WHITE..")"
	Inst25Quest18_Note = "Forest Wisp (Teldrassil; "..YELLOW.."37,47"..WHITE..")"
	Inst25Quest18_Prequest = "The Charge of the Dragonflights"
	Inst25Quest18_Folgequest = "Tyrande and Remulos"
	-- No Rewards for this quest
	
	
	--Quest 1 Horde
	Inst25Quest1_HORDE = "1. Храм Атал'Хаккара"
	Inst25Quest1_HORDE_Level = "50"
	Inst25Quest1_HORDE_Attain = "38"
	Inst25Quest1_HORDE_Aim = "Соберите 20 фетишей Хаккара и принесите их Фел'зерулу в Каменор."
	Inst25Quest1_HORDE_Location = "Фел'зерул (Болото Печали - Каменор; "..YELLOW.."47,54"..WHITE..")"
	Inst25Quest1_HORDE_Note = "Фетиши падают со всех врагов."
	Inst25Quest1_HORDE_Prequest = "Озеро Слез -> Возвращение к Фел'зерулу"
	Inst25Quest1_HORDE_Folgequest = "Нет"
	--
	Inst25Quest1name1_HORDE = "Guardian Talisman"
	
	--Quest 2 Horde
	Inst25Quest2_HORDE = "2. Затонувший храм"
	Inst25Quest2_HORDE_Level = "51"
	Inst25Quest2_HORDE_Attain = "-"
	Inst25Quest2_HORDE_Aim = "Найдите Марвона Клепальщика в Танарисе."
	Inst25Quest2_HORDE_Location = "Знахарь Узер'и (Фералас; "..YELLOW.."74,43"..WHITE..")"
	Inst25Quest2_HORDE_Note = "Вы найдете Марвона Клепальщика около "..YELLOW.."52,45"..WHITE.."."
	Inst25Quest2_HORDE_Prequest = "Нет"
	Inst25Quest2_HORDE_Folgequest = "Круглый камень"
	-- No Rewards for this quest
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst25Quest3_HORDE = Inst25Quest3
	Inst25Quest3_HORDE_Level = Inst25Quest3_Level
	Inst25Quest3_HORDE_Attain = Inst25Quest3_Attain
	Inst25Quest3_HORDE_Aim = Inst25Quest3_Aim
	Inst25Quest3_HORDE_Location = Inst25Quest3_Location
	Inst25Quest3_HORDE_Note = Inst25Quest3_Note
	Inst25Quest3_HORDE_Prequest = Inst25Quest3_Prequest
	Inst25Quest3_HORDE_Folgequest = Inst25Quest3_Folgequest
	-- No Rewards for this quest
	
	--Quest 4 Horde  (same as Quest 4 Alliance)
	Inst25Quest4_HORDE = Inst25Quest4
	Inst25Quest4_HORDE_Level = Inst25Quest4_Level
	Inst25Quest4_HORDE_Attain = Inst25Quest4_Attain
	Inst25Quest4_HORDE_Aim = Inst25Quest4_Aim
	Inst25Quest4_HORDE_Location = Inst25Quest4_Location
	Inst25Quest4_HORDE_Note = Inst25Quest4_Note
	Inst25Quest4_HORDE_Prequest = Inst25Quest4_Prequest
	Inst25Quest4_HORDE_Folgequest = Inst25Quest4_Folgequest
	--
	Inst25Quest4name1_HORDE = Inst25Quest4name1
	
	--Quest 5 Horde
	Inst25Quest5_HORDE = "5. Питание для шокера"
	Inst25Quest5_HORDE_Level = "52"
	Inst25Quest5_HORDE_Attain = "50"
	Inst25Quest5_HORDE_Aim = "Доставьте незаряженный шокер и 5 образцов тумана Аталаи Лариону в Укрытие Маршалла."
	Inst25Quest5_HORDE_Location = "Лив Быстрочин (Степи; "..YELLOW.."62,38"..WHITE..")"
	Inst25Quest5_HORDE_Note = "Предшествующее задание 'Ларион и Майджин' начинается у Лариона (Кратер Ун'Горо; "..YELLOW.."45,8"..WHITE.."). Вы возьмете образцы тумана с Глубинных скрытней, Мракочервей или слизнюков в Храме."
	Inst25Quest5_HORDE_Prequest = "Ларион и Майджин -> Мастерская Марвона"
	Inst25Quest5_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 6 Horde  (same as Quest 6 Alliance)
	Inst25Quest6_HORDE = Inst25Quest6
	Inst25Quest6_HORDE_Level = Inst25Quest6_Level
	Inst25Quest6_HORDE_Attain = Inst25Quest6_Attain
	Inst25Quest6_HORDE_Aim = Inst25Quest6_Aim
	Inst25Quest6_HORDE_Location = Inst25Quest6_Location
	Inst25Quest6_HORDE_Note = Inst25Quest6_Note
	Inst25Quest6_HORDE_Prequest = Inst25Quest6_Prequest
	Inst25Quest6_HORDE_Folgequest = Inst25Quest6_Folgequest
	--
	Inst25Quest6name1_HORDE = Inst25Quest6name1
	Inst25Quest6name2_HORDE = Inst25Quest6name2
	Inst25Quest6name3_HORDE = Inst25Quest6name3
	
	--Quest 7 Horde  (same as Quest 7 Alliance)
	Inst25Quest7_HORDE = Inst25Quest7
	Inst25Quest7_HORDE_Level = Inst25Quest7_Level
	Inst25Quest7_HORDE_Attain = Inst25Quest7_Attain
	Inst25Quest7_HORDE_Aim = Inst25Quest7_Aim
	Inst25Quest7_HORDE_Location = Inst25Quest7_Location
	Inst25Quest7_HORDE_Note = Inst25Quest7_Note
	Inst25Quest7_HORDE_Prequest = Inst25Quest7_Prequest
	Inst25Quest7_HORDE_Folgequest = Inst25Quest7_Folgequest
	--
	Inst25Quest7name1_HORDE = Inst25Quest7name1
	Inst25Quest7name2_HORDE = Inst25Quest7name2
	
	--Quest 8 Horde  (same as Quest 8 Alliance)
	Inst25Quest8_HORDE = Inst25Quest8
	Inst25Quest8_HORDE_Level = Inst25Quest8_Level
	Inst25Quest8_HORDE_Attain = Inst25Quest8_Attain
	Inst25Quest8_HORDE_Aim = Inst25Quest8_Aim
	Inst25Quest8_HORDE_Location = Inst25Quest8_Location
	Inst25Quest8_HORDE_Note = Inst25Quest8_Note
	Inst25Quest8_HORDE_Prequest = Inst25Quest8_Prequest
	Inst25Quest8_HORDE_Folgequest = Inst25Quest8_Folgequest
	--
	Inst25Quest8name1_HORDE = Inst25Quest8name1
	
	--Quest 9 Horde  (same as Quest 9 Alliance)
	Inst25Quest9_HORDE = Inst25Quest9
	Inst25Quest9_HORDE_Level = Inst25Quest9_Level
	Inst25Quest9_HORDE_Attain = Inst25Quest9_Attain
	Inst25Quest9_HORDE_Aim = Inst25Quest9_Aim
	Inst25Quest9_HORDE_Location = Inst25Quest9_Location
	Inst25Quest9_HORDE_Note = Inst25Quest9_Note
	Inst25Quest9_HORDE_Prequest = Inst25Quest9_Prequest
	Inst25Quest9_HORDE_Folgequest = Inst25Quest9_Folgequest
	--
	Inst25Quest9name1_HORDE = Inst25Quest9name1
	Inst25Quest9name2_HORDE = Inst25Quest9name2
	Inst25Quest9name3_HORDE = Inst25Quest9name3
	
	--Quest 10 Horde  (same as Quest 10 Alliance)
	Inst25Quest10_HORDE = Inst25Quest10
	Inst25Quest10_HORDE_Level = Inst25Quest10_Level
	Inst25Quest10_HORDE_Attain = Inst25Quest10_Attain
	Inst25Quest10_HORDE_Aim = Inst25Quest10_Aim
	Inst25Quest10_HORDE_Location = Inst25Quest10_Location
	Inst25Quest10_HORDE_Note = Inst25Quest10_Note
	Inst25Quest10_HORDE_Prequest = Inst25Quest10_Prequest
	Inst25Quest10_HORDE_Folgequest = Inst25Quest10_Folgequest
	--
	Inst25Quest10name1_HORDE = Inst25Quest10name1
	Inst25Quest10name2_HORDE = Inst25Quest10name2
	Inst25Quest10name3_HORDE = Inst25Quest10name3
	
	--Quest 11 Horde  (same as Quest 11 Alliance)
	Inst25Quest11_HORDE = Inst25Quest11
	Inst25Quest11_HORDE_Level = Inst25Quest11_Level
	Inst25Quest11_HORDE_Attain = Inst25Quest11_Attain
	Inst25Quest11_HORDE_Aim = Inst25Quest11_Aim
	Inst25Quest11_HORDE_Location = Inst25Quest11_Location
	Inst25Quest11_HORDE_Note = Inst25Quest11_Note
	Inst25Quest11_HORDE_Prequest = Inst25Quest11_Prequest
	Inst25Quest11_HORDE_Folgequest = Inst25Quest11_Folgequest
	--
	Inst25Quest11name1_HORDE = Inst25Quest11name1
	Inst25Quest11name2_HORDE = Inst25Quest11name2
	Inst25Quest11name3_HORDE = Inst25Quest11name3
	
	--Quest 12 Horde  (same as Quest 12 Alliance)
	Inst25Quest12_HORDE = Inst25Quest12
	Inst25Quest12_HORDE_Level = Inst25Quest12_Level
	Inst25Quest12_HORDE_Attain = Inst25Quest12_Attain
	Inst25Quest12_HORDE_Aim = Inst25Quest12_Aim
	Inst25Quest12_HORDE_Location = Inst25Quest12_Location
	Inst25Quest12_HORDE_Note = Inst25Quest12_Note
	Inst25Quest12_HORDE_Prequest = Inst25Quest12_Prequest
	Inst25Quest12_HORDE_Folgequest = Inst25Quest12_Folgequest
	--
	Inst25Quest12name1_HORDE = Inst25Quest12name1
	Inst25Quest12name2_HORDE = Inst25Quest12name2
	Inst25Quest12name3_HORDE = Inst25Quest12name3
	
	--Quest 13 Horde  (same as Quest 13 Alliance)
	Inst25Quest13_HORDE = Inst25Quest13
	Inst25Quest13_HORDE_Level = Inst25Quest13_Level
	Inst25Quest13_HORDE_Attain = Inst25Quest13_Attain
	Inst25Quest13_HORDE_Aim = Inst25Quest13_Aim
	Inst25Quest13_HORDE_Location = Inst25Quest13_Location
	Inst25Quest13_HORDE_Note = Inst25Quest13_Note
	Inst25Quest13_HORDE_Prequest = Inst25Quest13_Prequest
	Inst25Quest13_HORDE_Folgequest = Inst25Quest13_Folgequest
	--
	Inst25Quest13name1_HORDE = Inst25Quest13name1
	Inst25Quest13name2_HORDE = Inst25Quest13name2
	Inst25Quest13name3_HORDE = Inst25Quest13name3
	
	--Quest 14 Horde  (same as Quest 14 Alliance)
	Inst25Quest14_HORDE = Inst25Quest14
	Inst25Quest14_HORDE_Level = Inst25Quest14_Level
	Inst25Quest14_HORDE_Attain = Inst25Quest14_Attain
	Inst25Quest14_HORDE_Aim = Inst25Quest14_Aim
	Inst25Quest14_HORDE_Location = Inst25Quest14_Location
	Inst25Quest14_HORDE_Note = Inst25Quest14_Note
	Inst25Quest14_HORDE_Prequest = Inst25Quest14_Prequest
	Inst25Quest14_HORDE_Folgequest = Inst25Quest14_Folgequest
	--
	Inst25Quest14name1_HORDE = Inst25Quest14name1
	Inst25Quest14name2_HORDE = Inst25Quest14name2
	Inst25Quest14name3_HORDE = Inst25Quest14name3
	
	--Quest 15 Horde  (same as Quest 15 Alliance)
	Inst25Quest15_HORDE = Inst25Quest15
	Inst25Quest15_HORDE_Level = Inst25Quest15_Level
	Inst25Quest15_HORDE_Attain = Inst25Quest15_Attain
	Inst25Quest15_HORDE_Aim = Inst25Quest15_Aim
	Inst25Quest15_HORDE_Location = Inst25Quest15_Location
	Inst25Quest15_HORDE_Note = Inst25Quest15_Note
	Inst25Quest15_HORDE_Prequest = Inst25Quest15_Prequest
	Inst25Quest15_HORDE_Folgequest = Inst25Quest15_Folgequest
	--
	Inst25Quest15name1_HORDE = Inst25Quest15name1
	Inst25Quest15name2_HORDE = Inst25Quest15name2
	Inst25Quest15name3_HORDE = Inst25Quest15name3
	
	--Quest 16 Horde  (same as Quest 16 Alliance)
	Inst25Quest16_HORDE = Inst25Quest16
	Inst25Quest16_HORDE_Level = Inst25Quest16_Level
	Inst25Quest16_HORDE_Attain = Inst25Quest16_Attain
	Inst25Quest16_HORDE_Aim = Inst25Quest16_Aim
	Inst25Quest16_HORDE_Location = Inst25Quest16_Location
	Inst25Quest16_HORDE_Note = Inst25Quest16_Note
	Inst25Quest16_HORDE_Prequest = Inst25Quest16_Prequest
	Inst25Quest16_HORDE_Folgequest = Inst25Quest16_Folgequest
	--
	Inst25Quest16name1_HORDE = Inst25Quest16name1
	Inst25Quest16name2_HORDE = Inst25Quest16name2
	Inst25Quest16name3_HORDE = Inst25Quest16name3
	
	--Quest 17 Horde
	Inst25Quest17_HORDE = "17. Ancient Evil"
	Inst25Quest17_HORDE_Level = "52"
	Inst25Quest17_HORDE_Attain = "50"
	Inst25Quest17_HORDE_Aim = "Unlock the secrets of the Temple of Atal'Hakkar to release Atal'alarion and recover the Putrid Vine from his flesh. Return to Mehlar at the Bulwark when you have done this."
	Inst25Quest17_HORDE_Location = "Lady Sylvanas Windrunner (Undercity - Royal Quarter; "..YELLOW.."59,94"..WHITE..")"
	Inst25Quest17_HORDE_Note = "Задание для паладинов: The Putrid Vine drops from Atal'alarion who is summoned at "..YELLOW.."[1]"..WHITE.." by activating the statues in the order listed on the map. Mehlar is at Tirisfal Glades - The Bulwark ("..YELLOW.."83,71"..WHITE..")."
	Inst25Quest17_HORDE_Prequest = "To The Bulwark -> Wisdom of the Banshee Queen"
	Inst25Quest17_HORDE_Folgequest = "Нет"
	--
	Inst25Quest17name1_HORDE = "Scourgebane"
	
	--Quest 18 Horde (same as Quest 18 Alliance)
	Inst25Quest18_HORDE = "18. Eranikus, Tyrant of the Dream"
	Inst25Quest18_HORDE_Level = "60"
	Inst25Quest18_HORDE_Attain = "60"
	Inst25Quest18_HORDE_Aim = "Travel to the continent of Teldrassil and find Malfurion's agent somewhere outside the walls of Darnassus."
	Inst25Quest18_HORDE_Location = "Malfurion Stormrage (Spawns at Shade of Eranikus; "..YELLOW.."[8]"..WHITE..")"
	Inst25Quest18_HORDE_Note = "Forest Wisp (Teldrassil; "..YELLOW.."37,47"..WHITE..")"
	Inst25Quest18_HORDE_Prequest = "The Charge of the Dragonflights"
	Inst25Quest18_HORDE_Folgequest = "Tyrande and Remulos"
	-- No Rewards for this quest
	
	
	
	--------------- INST26 - The Temple of Ahn'Qiraj (AQ40) ---------------
	Inst26Story = "В сердце Ан'Киража лежит древний храмовый квартал. Построенный в незапамятные времена, он напоминает о неназываемых богах и служит огромным инкубатором для киражской армии. Вот уже тысячу лет, со дня окончания войны Зыбучих Песков, императоры-близнецы заключены в собственном храме. Их едва удерживает магический барьер, воздвигнутый бронзовым драконом Анахроносом и ночными эльфами. Скипетр Зыбучих Песков восстановлен, а печать разбита, и путь во внутреннее святилище Ан'Киража открыт. Среди кишащих силитидов за храмом Ан'Киража, киражские легионы готовятся к вторжению. Их надо остановить любой ценой, прежде чем армии инсектоидов снова обрушатся на Калимдор и начнется вторая война Зыбучих Песков!"
	Inst26Caption = "Храм Ан'Киража"
	Inst26QAA = "3 Задания"
	Inst26QAH = "3 Задания"
	
	--Quest 1 Alliance
	Inst26Quest1 = "1. C'Thun's Legacy"
	Inst26Quest1_Level = "60"
	Inst26Quest1_Attain = "60"
	Inst26Quest1_Aim = "Take the Eye of C'Thun to Caelastrasz in the Temple of Ahn'Qiraj."
	Inst26Quest1_Location = "Eye of C'Thun (drops from C'Thun; "..YELLOW.."[9]"..WHITE..")"
	Inst26Quest1_Note = "Caelestrasz (Temple of Ahn'Qiraj; "..YELLOW.."2'"..WHITE..")"
	Inst26Quest1_Prequest = "Нет"
	Inst26Quest1_Folgequest = "The Savior of Kalimdor"
	-- No Rewards for this quest
	
	--Quest 2 Alliance
	Inst26Quest2 = "2. The Savior of Kalimdor"
	Inst26Quest2_Level = "60"
	Inst26Quest2_Attain = "60"
	Inst26Quest2_Aim = "Take the Eye of C'Thun to Anachronos at the Caverns of Time."
	Inst26Quest2_Location = "Eye of C'Thun (drops from C'Thun; "..YELLOW.."[9]"..WHITE..")"
	Inst26Quest2_Note = "Anachronos (Tanaris - Caverns of Time; "..YELLOW.."65,49"..WHITE..")"
	Inst26Quest2_Prequest = "C'Thun's Legacy"
	Inst26Quest2_Folgequest = "Нет"
	--
	Inst26Quest2name1 = "Amulet of the Fallen God"
	Inst26Quest2name2 = "Cloak of the Fallen God"
	Inst26Quest2name3 = "Ring of the Fallen God"
	
	--Quest 3 Alliance
	Inst26Quest3 = "3. Secrets of the Qiraji"
	Inst26Quest3_Level = "60"
	Inst26Quest3_Attain = "60"
	Inst26Quest3_Aim = "Take the Ancient Qiraji Artifact to the dragons hiding near the entrance of the temple."
	Inst26Quest3_Location = "Ancient Qiraji Artifact (random drop in Temple of Ahn'Qiraj)"
	Inst26Quest3_Note = "Turns in to Andorgos (Temple of Ahn'Qiraj; "..YELLOW.."1'"..WHITE..")."
	Inst26Quest3_Prequest = "Нет"
	Inst26Quest3_Folgequest = "Нет"
	-- No Rewards for this quest
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst26Quest1_HORDE = Inst26Quest1
	Inst26Quest1_HORDE_Level = Inst26Quest1_Level
	Inst26Quest1_HORDE_Attain = Inst26Quest1_Attain
	Inst26Quest1_HORDE_Aim = Inst26Quest1_Aim
	Inst26Quest1_HORDE_Location = Inst26Quest1_Location
	Inst26Quest1_HORDE_Note = Inst26Quest1_Note
	Inst26Quest1_HORDE_Prequest = Inst26Quest1_Prequest
	Inst26Quest1_HORDE_Folgequest = Inst26Quest1_Folgequest
	-- No Rewards for this quest
	
	--Quest 2 Horde  (same as Quest 2 Alliance)
	Inst26Quest2_HORDE = Inst26Quest2
	Inst26Quest2_HORDE_Level = Inst26Quest2_Level
	Inst26Quest2_HORDE_Attain = Inst26Quest2_Attain
	Inst26Quest2_HORDE_Aim = Inst26Quest2_Aim
	Inst26Quest2_HORDE_Location = Inst26Quest2_Location
	Inst26Quest2_HORDE_Note = Inst26Quest2_Note
	Inst26Quest2_HORDE_Prequest = Inst26Quest2_Prequest
	Inst26Quest2_HORDE_Folgequest = Inst26Quest2_Folgequest
	--
	Inst26Quest2name1_HORDE = Inst26Quest2name1
	Inst26Quest2name2_HORDE = Inst26Quest2name2
	Inst26Quest2name3_HORDE = Inst26Quest2name3
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst26Quest3_HORDE = Inst26Quest3
	Inst26Quest3_HORDE_Level = Inst26Quest3_Level
	Inst26Quest3_HORDE_Attain = Inst26Quest3_Attain
	Inst26Quest3_HORDE_Aim = Inst26Quest3_Aim
	Inst26Quest3_HORDE_Location = Inst26Quest3_Location
	Inst26Quest3_HORDE_Note = Inst26Quest3_Note
	Inst26Quest3_HORDE_Prequest = Inst26Quest3_Prequest
	Inst26Quest3_HORDE_Folgequest = Inst26Quest3_Folgequest
	-- No Rewards for this quest
	
	
	
	--------------- INST27 - Zul'Farrak (ZF) ---------------
	Inst27Story = "Этот выжженый солнцем город служит домом троллям из клана Песчаной Ярости, известных своей редкостной безжалостностью и темным мистицизмом. Легенды троллей рассказывают о мощном мече называемом Кара Суль-траза, оружие, способное вселять страх и слабость жаже самым грозным врагам. Давным-давно, оружие было разбито на две части. Однако, ходят слухи, что в где-то стенах Зул'Фаррака можно найти обе половинки. Докладывают также, что банда наемников, бежавших из Прибамбасска забрела в город и попала в ловушку. Их судьба неизвестна. Но возможно самым волнующим из всего - этотихие перешептывания о древнем чудовище, спящим в священном бассейне в самом сердце города. Могучем полубоге, который нанесет неисчислимый ущерб любому авантюристу, имевшему глупость пробудить его."
	Inst27Caption = "Зул'Фаррак"
	Inst27QAA = "7 Заданий"
	Inst27QAH = "7 Заданий"
	
	--Quest 1 Alliance
	Inst27Quest1 = "1. Троллье месиво"
	Inst27Quest1_Level = "45"
	Inst27Quest1_Attain = "?"
	Inst27Quest1_Aim = "Принесите 20 фиалов с Тролльим месивом."
	Inst27Quest1_Location = "Трентон Молот Света (Танарис - Прибамбасск; "..YELLOW.."51,28"..WHITE..")"
	Inst27Quest1_Note = "Месиво падет со всех троллей."
	Inst27Quest1_Prequest = "Нет"
	Inst27Quest1_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 2 Alliance
	Inst27Quest2 = "2. Панцири скарабеев"
	Inst27Quest2_Level = "45"
	Inst27Quest2_Attain = "?"
	Inst27Quest2_Aim = "Принести 5 целых панцирей скарабея Тран'реку в Прибамбасск."
	Inst27Quest2_Location = "Тран'рек (Танарис - Прибамбасск; "..YELLOW.."51,26"..WHITE..")"
	Inst27Quest2_Note = "Предшествующее задание начинается у Кразека (Тернистая долина - Пиратская бухта; "..YELLOW.."25,77"..WHITE..").\nПанцири могут упасть с любого скарабея. Множество скарабеев находится около "..YELLOW.."[2]"..WHITE.."."
	Inst27Quest2_Prequest = "Тран'рек"
	Inst27Quest2_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 3 Alliance
	Inst27Quest3 = "3. Тиара глубин"
	Inst27Quest3_Level = "46"
	Inst27Quest3_Attain = "40"
	Inst27Quest3_Aim = "Принесите Тиару Глубин Табете в Пылевые топи."
	Inst27Quest3_Location = " Табета (Пылевые топи; "..YELLOW.."46,57"..WHITE..")"
	Inst27Quest3_Note = "Возьмите предшествующее задание у Бинк (Стальгорн; "..YELLOW.."25,8"..WHITE..").\nТиара глубин падает с гидроманта Велраты около "..YELLOW.."[6]"..WHITE.."."
	Inst27Quest3_Prequest = "Миссия Табеты"
	Inst27Quest3_Folgequest = "Нет"
	--
	Inst27Quest3name1 = "Spellshifter Rod"
	Inst27Quest3name2 = "Gemshale Pauldrons"
	
	--Quest 4 Alliance
	Inst27Quest4 = "4. Медальон Некрума"
	Inst27Quest4_Level = "47"
	Inst27Quest4_Attain = "40"
	Inst27Quest4_Aim = "Отнесите медальон Некрума Тадиусу Мрачной Тени в Выжженные земли."
	Inst27Quest4_Location = "Тадиус Мрачная Тень (Выжженные земли - Крепость Стражей Пустоты; "..YELLOW.."66,19"..WHITE..")"
	Inst27Quest4_Note = "Линейка заданий начинается у укротителя грифонов Разящего Когтя (Внутренние земли - Цитадель Громового Молота; "..YELLOW.."9,44"..WHITE..").\nНекрум появляется около "..YELLOW.."[4]"..WHITE.." с последней волной боя Храмового события."
	Inst27Quest4_Prequest = "Тролльи клетки -> Тадиус Мрачная Тень"
	Inst27Quest4_Folgequest = "Прорицание"
	-- No Rewards for this quest
	
	--Quest 5 Alliance
	Inst27Quest5 = "5. Пророчество Мошару"
	Inst27Quest5_Level = "47"
	Inst27Quest5_Attain = "40"
	Inst27Quest5_Aim = "Принесите первую и вторую таблички Мошару Йе'кинье в Танарис."
	Inst27Quest5_Location = "Йе'кинья (Танарис - Порт Картеля; "..YELLOW.."66,22"..WHITE..")"
	Inst27Quest5_Note = "Вы возьмете предшествующее задание у того же НИП.\nТаблички падают с Теки Мученика около "..YELLOW.."[2]"..WHITE.." и гидроманта Велраты около "..YELLOW.."[6]"..WHITE.."."
	Inst27Quest5_Prequest = "Духи крикунов"
	Inst27Quest5_Folgequest = "Древнее яйцо"
	-- No Rewards for this quest
	
	--Quest 6 Alliance
	Inst27Quest6 = "6. Изыскательский стержень"
	Inst27Quest6_Level = "46"
	Inst27Quest6_Attain = "?"
	Inst27Quest6_Aim = "Принесите изыскательский cтержень главному инженеру Чепухастеру в Прибамбасск."
	Inst27Quest6_Location = "Главный инженер Чепухастер (Танарис - Прибамбасск; "..YELLOW.."52,28"..WHITE..")"
	Inst27Quest6_Note = "Вы заберете стержень у сержанта Блая. Вы найдете его около "..YELLOW.."[4]"..WHITE.." после Храмового события."
	Inst27Quest6_Prequest = "Нет"
	Inst27Quest6_Folgequest = "Нет"
	--
	Inst27Quest6name1 = "Masons Fraternity Ring"
	Inst27Quest6name2 = "Engineer's Guild Headpiece"
	
	--Quest 7 Alliance
	Inst27Quest7 = "7. Газ'рилла"
	Inst27Quest7_Level = "50"
	Inst27Quest7_Attain = "40"
	Inst27Quest7_Aim = "Принесите искрящую чешую Газ'риллы Виззлу Медноштифу на Мерцающую равнину."
	Inst27Quest7_Location = "Виззл Медноштиф (Тысяча Игл - Миражи на виражах; "..YELLOW.."78,77"..WHITE..")"
	Inst27Quest7_Note = "Вы возьмете предшествующее задание у Клацморта Гайкокрута (Стальгорн - Город механиков; "..YELLOW.."68,46"..WHITE.."). Чтобы получить задание Газ'рилла, предшествующее задание выполнять необязательно.\nВы вызовете Газ'риллу около "..YELLOW.."[6]"..WHITE.." с помощью Молота Зул'Фаррака.\nСвященный молот падает с Квиаги Хранительницы (Внутренние земли - Алтарь Зула; "..YELLOW.."49,70"..WHITE..") и должен быть завершен на алтаре в Джинта'Алоре около "..YELLOW.."59,77"..WHITE.." перед тем как его можно будет использовать в Зул'Фарраке."
	Inst27Quest7_Prequest = "Братья Латунный Болт"
	Inst27Quest7_Folgequest = "Нет"
	--
	Inst27Quest7name1 = "Carrot on a Stick"
	
	
	--Quest 1 Horde
	Inst27Quest1_HORDE = "1. Паучья богиня"
	Inst27Quest1_HORDE_Level = "45"
	Inst27Quest1_HORDE_Attain = "42"
	Inst27Quest1_HORDE_Aim = "Прочитайте надписи на табличке Теки, узнайте имя паучьей богини, которой поклоняются тролли Сухокожих, а потом возвращайтесь к мастеру Гадрину."
	Inst27Quest1_HORDE_Location = "Мастер Гадрин (Дуротар - Деревня Сен'джин; "..YELLOW.."55,74"..WHITE..")"
	Inst27Quest1_HORDE_Note = "Линейка заданий начинается с Бутылки с ядом, которые стоят на столах в деревнях троллей во Внутренних землях.\nВы найдете табличку около "..YELLOW.."[2]"..WHITE.."."
	Inst27Quest1_HORDE_Prequest = "Бутыли с ядом -> Разговор с мастером Гадрином"
	Inst27Quest1_HORDE_Folgequest = "Призыв Шадры"
	-- No Rewards for this quest
	
	--Quest 2 Horde  (same as Quest 1 Alliance)
	Inst27Quest2_HORDE = "2. Троллье месиво"
	Inst27Quest2_HORDE_Level = Inst27Quest1_Level
	Inst27Quest2_HORDE_Attain = Inst27Quest1_Attain
	Inst27Quest2_HORDE_Aim = Inst27Quest1_Aim
	Inst27Quest2_HORDE_Location = Inst27Quest1_Location
	Inst27Quest2_HORDE_Note = Inst27Quest1_Note
	Inst27Quest2_HORDE_Prequest = Inst27Quest1_Prequest
	Inst27Quest2_HORDE_Folgequest = Inst27Quest1_Folgequest
	-- No Rewards for this quest
	
	--Quest 3 Horde  (same as Quest 2 Alliance)
	Inst27Quest3_HORDE = "3. Панцири скарабеев"
	Inst27Quest3_HORDE_Level = Inst27Quest2_Level
	Inst27Quest3_HORDE_Attain = Inst27Quest2_Attain
	Inst27Quest3_HORDE_Aim = Inst27Quest2_Aim
	Inst27Quest3_HORDE_Location = Inst27Quest2_Location
	Inst27Quest3_HORDE_Note = Inst27Quest2_Note
	Inst27Quest3_HORDE_Prequest = Inst27Quest2_Prequest
	Inst27Quest3_HORDE_Folgequest = Inst27Quest2_Folgequest
	-- No Rewards for this quest
	
	--Quest 4 Horde  (same as Quest 3 Alliance - no prequest)
	Inst27Quest4_HORDE = "4. Тиара глубин"
	Inst27Quest4_HORDE_Level = Inst27Quest3_Level
	Inst27Quest4_HORDE_Attain = Inst27Quest3_Attain
	Inst27Quest4_HORDE_Aim = Inst27Quest3_Aim
	Inst27Quest4_HORDE_Location = Inst27Quest3_Location
	Inst27Quest4_HORDE_Note = "Тиара глубин падает с гидроманта Велраты около "..YELLOW.."[6]"..WHITE.."."
	Inst27Quest4_HORDE_Prequest = "Нет"
	Inst27Quest4_HORDE_Folgequest = Inst27Quest3_Folgequest
	--
	Inst27Quest4name1_HORDE = Inst27Quest3name1
	Inst27Quest4name2_HORDE = Inst27Quest3name2
	
	--Quest 5 Horde  (same as Quest 5 Alliance)
	Inst27Quest5_HORDE = Inst27Quest5
	Inst27Quest5_HORDE_Level = Inst27Quest5_Level
	Inst27Quest5_HORDE_Attain = Inst27Quest5_Attain
	Inst27Quest5_HORDE_Aim = Inst27Quest5_Aim
	Inst27Quest5_HORDE_Location = Inst27Quest5_Location
	Inst27Quest5_HORDE_Note = Inst27Quest5_Note
	Inst27Quest5_HORDE_Prequest = Inst27Quest5_Prequest
	Inst27Quest5_HORDE_Folgequest = Inst27Quest5_Folgequest
	-- No Rewards for this quest
	
	--Quest 6 Horde  (same as Quest 6 Alliance)
	Inst27Quest6_HORDE = Inst27Quest6
	Inst27Quest6_HORDE_Level = Inst27Quest6_Level
	Inst27Quest6_HORDE_Attain = Inst27Quest6_Attain
	Inst27Quest6_HORDE_Aim = Inst27Quest6_Aim
	Inst27Quest6_HORDE_Location = Inst27Quest6_Location
	Inst27Quest6_HORDE_Note = Inst27Quest6_Note
	Inst27Quest6_HORDE_Prequest = Inst27Quest6_Prequest
	Inst27Quest6_HORDE_Folgequest = Inst27Quest6_Folgequest
	--
	Inst27Quest6name1_HORDE = Inst27Quest6name1
	Inst27Quest6name2_HORDE = Inst27Quest6name2
	
	--Quest 7 Horde  (same as Quest 7 Alliance - no prequest)
	Inst27Quest7_HORDE = Inst27Quest7
	Inst27Quest7_HORDE_Level = Inst27Quest7_Level
	Inst27Quest7_HORDE_Attain = Inst27Quest7_Attain
	Inst27Quest7_HORDE_Aim = Inst27Quest7_Aim
	Inst27Quest7_HORDE_Location = Inst27Quest7_Location
	Inst27Quest7_HORDE_Note = "Вы вызовете Газ'риллу около "..YELLOW.."[6]"..WHITE.." с помощью Молота Зул'Фаррака.\nСвященный молот падает с Квиаги Хранительницы (Внутренние земли - Алтарь Зула; "..YELLOW.."49,70"..WHITE..") и должен быть завершен на алтаре в Джинта'Алоре около "..YELLOW.."59,77"..WHITE.." перед тем как его можно будет использовать в Зул'Фарраке."
	Inst27Quest7_HORDE_Prequest = "Нет"
	Inst27Quest7_HORDE_Folgequest = Inst27Quest7_Folgequest
	--
	Inst27Quest7name1_HORDE = Inst27Quest7name1
	
	
	
	--------------- INST28 - Zul'Gurub (ZG) ---------------
	Inst28Story = {
		["Page1"] = "Свыше тысячи лет назад, могущественная империя Гурбаши была разорвана на части всеобщей гражданской войной. Влиятельная группа жрецов троллей, известная как Атал'аи, предприняла попытку призвать древнего кровавого бога по имени Хаккар Свежеватель душ. Несмотря на то, что жрецы потерпели поражение и были изгнаны навеки, великая империя троллей не смогла сохранить целостность. Изгнанные жрецы бежали далеко на север, в Болота Печали. Там они возвели великий храм в честь Хаккара - где они могли приготовиться к его прибытию в материальный мир.",
		["Page2"] = "В тоже время, жрецы Атал'аи обнаружили, что материальную форму Хаккара можно вызвать только в пределах древней столицы империи Гурубаши, Зул'Гурубе. К несчастью, жрецы преуспели в своем стремлении призвать Хаккара - донесения подтверждают присутсвие ужасного Свежевателя душ в сердце руин Гурубаши.\n\nДля того, чтобы подавить кровавого бога, тролли страны собрались вместе и послали отряд Высших жрецов в древний город. Каждый жрец был могучим чемпионом Звериных боов - Летучей мыши, Пантеры, Тигра, Паука, и Змеи - но несмотря на все их усилия, они попали под влияние Хаккара. Теперь чемпионы и их воплощения Звериных богов вскормлены ужасающей силой Свежевателя душ. Любой авантюрист, храбрый настолько, чтобы отважиться забраться в проклятые руины, должен победить Высших жрецов, если он надется хотя бы вступить в схватку с могущественным кровавым богом.",
		["MaxPages"] = "2",
	};
	Inst28Caption = "Зул'Гуруб"
	Inst28QAA = "4 Задания"
	Inst28QAH = "4 Задания"
	
	--Quest 1 Alliance
	Inst28Quest1 = "1. A Collection of Heads"
	Inst28Quest1_Level = "60"
	Inst28Quest1_Attain = "58"
	Inst28Quest1_Aim = "String 5 Channeler's Heads, then return the Collection of Troll Heads to Exzhal on Yojamba Isle."
	Inst28Quest1_Location = "Exzhal (Stranglethorn Vale - Yojamba Isle; "..YELLOW.."15,15"..WHITE..")"
	Inst28Quest1_Note = "Make sure you loot all the priests."
	Inst28Quest1_Prequest = "Нет"
	Inst28Quest1_Folgequest = "Нет"
	--
	Inst28Quest1name1 = "Belt of Shrunken Heads"
	Inst28Quest1name2 = "Belt of Shriveled Heads"
	Inst28Quest1name3 = "Belt of Preserved Heads"
	Inst28Quest1name4 = "Belt of Tiny Heads"
	
	--Quest 2 Alliance
	Inst28Quest2 = "2. The Heart of Hakkar"
	Inst28Quest2_Level = "60"
	Inst28Quest2_Attain = "58"
	Inst28Quest2_Aim = "Bring the Heart of Hakkar to Molthor on Yojamba Isle."
	Inst28Quest2_Location = "Heart of Hakkar (drops from Hakkar; "..YELLOW.."[11]"..WHITE..")"
	Inst28Quest2_Note = "Molthor (Stranglethorn Vale - Yojamba Isle; "..YELLOW.."15,15"..WHITE..")"
	Inst28Quest2_Prequest = "Нет"
	Inst28Quest2_Folgequest = "Нет"
	--
	Inst28Quest2name1 = "Zandalarian Hero Badge"
	Inst28Quest2name2 = "Zandalarian Hero Charm"
	Inst28Quest2name3 = "Zandalarian Hero Medallion"
	
	--Quest 3 Alliance
	Inst28Quest3 = "3. Nat's Measuring Tape"
	Inst28Quest3_Level = "60"
	Inst28Quest3_Attain = "59"
	Inst28Quest3_Aim = "Return Nat's Measuring Tape to Nat Pagle in Dustwallow Marsh."
	Inst28Quest3_Location = "Battered Tackle Box (Zul'Gurub - Northeast by water from Hakkar's Island)"
	Inst28Quest3_Note = "Nat Pagle is at Dustwallow Marsh ("..YELLOW.."59,60"..WHITE.."). Turning the quest in allows you to buy Mudskunk Lures from Nat Pagle to summon Gahz'ranka in Zul'Gurub."
	Inst28Quest3_Prequest = "Нет"
	Inst28Quest3_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 4 Alliance
	Inst28Quest4 = "4. The Perfect Poison"
	Inst28Quest4_Level = "60"
	Inst28Quest4_Attain = "60"
	Inst28Quest4_Aim = "Dirk Thunderwood at Cenarion Hold wants you to bring him Venoxis's Venom Sac and Kurinnaxx's Venom Sac."
	Inst28Quest4_Location = "Dirk Thunderwood (Silithus - Cenarion Hold; "..YELLOW.."52,39"..WHITE..")"
	Inst28Quest4_Note = "Venoxis's Venom Sac drops from High priest Venoxis in "..YELLOW.."Zul'Gurub"..WHITE.." at "..YELLOW.."[2]"..WHITE..". Kurinnaxx's Venom Sac drops in the "..YELLOW.."Ruins of Ahn'Qiraj"..WHITE.." at "..YELLOW.."[1]"..WHITE.."."
	Inst28Quest4_Prequest = "Нет"
	Inst28Quest4_Folgequest = "Нет"
	--
	Inst28Quest4name1 = "Ravenholdt Slicer"
	Inst28Quest4name2 = "Shivsprocket's Shiv"
	Inst28Quest4name3 = "The Thunderwood Poker"
	Inst28Quest4name4 = "Doomulus Prime"
	Inst28Quest4name5 = "Fahrad's Reloading Repeater"
	Inst28Quest4name6 = "Simone's Cultivating Hammer"
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst28Quest1_HORDE = Inst28Quest1
	Inst28Quest1_HORDE_Level = Inst28Quest1_Level
	Inst28Quest1_HORDE_Attain = Inst28Quest1_Attain
	Inst28Quest1_HORDE_Aim = Inst28Quest1_Aim
	Inst28Quest1_HORDE_Location = Inst28Quest1_Location
	Inst28Quest1_HORDE_Note = Inst28Quest1_Note
	Inst28Quest1_HORDE_Prequest = Inst28Quest1_Prequest
	Inst28Quest1_HORDE_Folgequest = Inst28Quest1_Folgequest
	--
	Inst28Quest1name1_HORDE = Inst28Quest1name1
	Inst28Quest1name2_HORDE = Inst28Quest1name2
	Inst28Quest1name3_HORDE = Inst28Quest1name3
	Inst28Quest1name4_HORDE = Inst28Quest1name4
	
	--Quest 2 Horde  (same as Quest 2 Alliance)
	Inst28Quest2_HORDE = Inst28Quest2
	Inst28Quest2_HORDE_Level = Inst28Quest2_Level
	Inst28Quest2_HORDE_Attain = Inst28Quest2_Attain
	Inst28Quest2_HORDE_Aim = Inst28Quest2_Aim
	Inst28Quest2_HORDE_Location = Inst28Quest2_Location
	Inst28Quest2_HORDE_Note = Inst28Quest2_Note
	Inst28Quest2_HORDE_Prequest = Inst28Quest2_Prequest
	Inst28Quest2_HORDE_Folgequest = Inst28Quest2_Folgequest
	--
	Inst28Quest2name1_HORDE = Inst28Quest2name1
	Inst28Quest2name2_HORDE = Inst28Quest2name2
	Inst28Quest2name3_HORDE = Inst28Quest2name3
	
	--Quest 3 Horde  (same as Quest 3 Alliance)
	Inst28Quest3_HORDE = Inst28Quest3
	Inst28Quest3_HORDE_Level = Inst28Quest3_Level
	Inst28Quest3_HORDE_Attain = Inst28Quest3_Attain
	Inst28Quest3_HORDE_Aim = Inst28Quest3_Aim
	Inst28Quest3_HORDE_Location = Inst28Quest3_Location
	Inst28Quest3_HORDE_Note = Inst28Quest3_Note
	Inst28Quest3_HORDE_Prequest = Inst28Quest3_Prequest
	Inst28Quest3_HORDE_Folgequest = Inst28Quest3_Folgequest
	-- No Rewards for this quest
	
	--Quest 4 Horde  (same as Quest 4 Alliance)
	Inst28Quest4_HORDE = Inst28Quest4
	Inst28Quest4_HORDE_Level = Inst28Quest4_Level
	Inst28Quest4_HORDE_Attain = Inst28Quest4_Attain
	Inst28Quest4_HORDE_Aim = Inst28Quest4_Aim
	Inst28Quest4_HORDE_Location = Inst28Quest4_Location
	Inst28Quest4_HORDE_Note = Inst28Quest4_Note
	Inst28Quest4_HORDE_Prequest = Inst28Quest4_Prequest
	Inst28Quest4_HORDE_Folgequest = Inst28Quest4_Folgequest
	--
	Inst28Quest4name1_HORDE = Inst28Quest4name1
	Inst28Quest4name2_HORDE = Inst28Quest4name2
	Inst28Quest4name3_HORDE = Inst28Quest4name3
	Inst28Quest4name4_HORDE = Inst28Quest4name4
	Inst28Quest4name5_HORDE = Inst28Quest4name5
	Inst28Quest4name6_HORDE = Inst28Quest4name6
	
	
	
	--------------- INST29 - Gnomeregan (Gnomer) ---------------
	Inst29Story = "Находящееся в Дун Мороге, технологическое чудо, известное как Гномреган было столицей гномов на протяжении поколений. В недавнем прошлом, враждебная раса мутантов-троггов захватила некоторые регионы Дун Морога - включая и великий город гномов. В отчаянных попытках уничтожить вторгшихся троггов, Главный механик Меггакрут запустил экстренный слив городских баков с радиоактивными отходами. Некоторые гномы нашли убежище от загрязняющих воздух веществ, так как они ожидали, что трогги умрут или сбегут. К сожалению, не смотря на точто трогги облучились токсичной атакой - их осада продолжилась, не утихая. Те гномы, которых не убили вредные потоки были вынуждены бежать, ища убежище в близлежащем городе дворфов Стальгорне. Там Главный механик Меггакрут начал вербовать храбрецов, чтобы помочь его народу вернуть обратно их любимую столицу. Ходят слухи что когда-то бывший доверенный советник Меггакрута, Мекжинер Термоштепсель, предал свой народ, позволив вторжению произойти. Теперь, когда его рассудок помутился, Термоштепсель остается в Гномрегане - продвигая свои темные планы и действуя как новый техно-правитель города."
	Inst29Caption = "Гномреган"
	Inst29QAA = "10 Заданий"
	Inst29QAH = "5 Заданий"
	
	--Quest 1 Alliance
	Inst29Quest1 = "1. Промыть мозг Техботу"
	Inst29Quest1_Level = "26"
	Inst29Quest1_Attain = "?"
	Inst29Quest1_Aim = "Принесите ядро памяти Техбота мехмастеру Замыкальцу в Стальгорн."
	Inst29Quest1_Location = "Мехмастер Замыкалец (Стальгорн - Город механиков; "..YELLOW.."69,50"..WHITE..")"
	Inst29Quest1_Note = "Вы возьмете предшествующее задание у брата Сарно (Штормград - Соборная площадь; "..YELLOW.."40, 30"..WHITE..").\nВы найдете Техбота перед входом в подземелье около черного входа."
	Inst29Quest1_Prequest = "Мехмастер Замыкалец"
	Inst29Quest1_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 2 Alliance
	Inst29Quest2 = "2. Новая формула"
	Inst29Quest2_Level = "27"
	Inst29Quest2_Attain = "?"
	Inst29Quest2_Aim = "Соберите радиоактивный осадок, оставляемый облученными захватчиками и облученными погромщиками в пустой свинцовый фиал для образцов. Принесите полный фиал Оззи Триггервольту в Каранос."
	Inst29Quest2_Location = "Оззи Триггервольт (Дун Морог - Каранос; "..YELLOW.."45,49"..WHITE..")"
	Inst29Quest2_Note = "Вы возьмете предшествующее задание у Гноарна (Стальгорн - Город механиков; "..YELLOW.."69,50"..WHITE..").\nЧтобы собрать осадок используйте фиал на "..RED.."живых"..WHITE.." Облученный захватчиках или Облученных погромщиках."
	Inst29Quest2_Prequest = "На другой день"
	Inst29Quest2_Folgequest = "Сильное зеленое свечение"
	-- No Rewards for this quest
	
	--Quest 3 Alliance
	Inst29Quest3 = "3. Сильное зеленое свечение"
	Inst29Quest3_Level = "30"
	Inst29Quest3_Attain = "27"
	Inst29Quest3_Aim = "Отправиться в Гномреган и принести высокорадиоактивные образцы. Внимание: отходы нестабильны и довольно быстро разрушаются.\nВернуть Оззи тяжелую освинцованную склянку для проб, когда задача будет выполнена."
	Inst29Quest3_Location = "Оззи Триггервольт (Дун Морог - Каранос; "..YELLOW.."45,49"..WHITE..")"
	Inst29Quest3_Note = "Чтобы собрать образцы используйте фиал на "..RED.."живых"..WHITE.." Облученных слизях или ужасах."
	Inst29Quest3_Prequest = "Новая формула"
	Inst29Quest3_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 4 Alliance
	Inst29Quest4 = "4. Сооружение автогиробуророек"
	Inst29Quest4_Level = "30"
	Inst29Quest4_Attain = "?"
	Inst29Quest4_Aim = "Принесите Шони в Штормград 24 порции механических внутренностей роботов."
	Inst29Quest4_Location = "Шони Молшунья (Штормград - Квартал дворфов; "..YELLOW.."55, 12"..WHITE..")"
	Inst29Quest4_Note = "Внутренности падают со всех роботов."
	Inst29Quest4_Prequest = "Нет"
	Inst29Quest4_Folgequest = "Нет"
	--
	Inst29Quest4name1 = "Shoni's Disarming Tool"
	Inst29Quest4name2 = "Shilly Mitts"
	
	--Quest 5 Alliance
	Inst29Quest5 = "5. Базовый элемент"
	Inst29Quest5_Level = "30"
	Inst29Quest5_Attain = "?"
	Inst29Quest5_Aim = "Принесите 12 базовых элементов Клацморту Гайкокруту в Стальгорн."
	Inst29Quest5_Location = "Клацморт Гайкокрут (Стальгорн - Город механиков; "..YELLOW.."68,46"..WHITE..")"
	Inst29Quest5_Note = "Вы возьмете предшествующее задание у Матиля (Дарнасс - Терраса Воинов; "..YELLOW.."59,45"..WHITE.."). Предшествующее задание только указывает на задание и необязательно, чтобы взять это.\nБазовые элементы собираются со всех машин, разбросанных по подземелью."
	Inst29Quest5_Prequest = "Базовые элементы Клацморта"
	Inst29Quest5_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 6 Alliance
	Inst29Quest6 = "6. Спасение данных"
	Inst29Quest6_Level = "30"
	Inst29Quest6_Attain = "25"
	Inst29Quest6_Aim = "Принесите призматическую перфокарту главному механику Чугунотрубзу в Стальгорн."
	Inst29Quest6_Location = "Главный механик Чугонотрубз (Стальгорн - Город механиков; "..YELLOW.."69,48"..WHITE..")"
	Inst29Quest6_Note = "Вы получите предшествующее задание у Гаксима Ржавошиппи (Когтистые горы; "..YELLOW.."59,67"..WHITE.."). Предшествующее задание только указывает на задание и необязательно, чтобы взять это.\nПустая карта падает случайно. Вы найдете первый терминал около черного входа, перед входом в подземелье. 3005-B находится около "..YELLOW.."[3]"..WHITE..", 3005-C около "..YELLOW.."[5]"..WHITE.." и 3005-D находится около "..YELLOW.."[8]"..WHITE.."."
	Inst29Quest6_Prequest = "Поручение Чугонотрубза"
	Inst29Quest6_Folgequest = "Нет"
	--
	Inst29Quest6name1 = "Repairman's Cape"
	Inst29Quest6name2 = "Mechanic's Pipehammer"
	
	--Quest 7 Alliance
	Inst29Quest7 = "7. Катавасия"
	Inst29Quest7_Level = "30"
	Inst29Quest7_Attain = "22"
	Inst29Quest7_Aim = "Отведите Керноби к Часовому ходу. Затем отправляйтесь с донесением к Скути в Пиратскую бухту."
	Inst29Quest7_Location = "Керноби (Гномреган; "..YELLOW.."[3]"..WHITE..")"
	Inst29Quest7_Note = "Задание сопровождения! Вы найдете Скути в Тернистая долина - Пиратская бухта ("..YELLOW.."27,77"..WHITE..")."
	Inst29Quest7_Prequest = "Нет"
	Inst29Quest7_Folgequest = "Нет"
	--
	Inst29Quest7name1 = "Fire-welded Bracers"
	Inst29Quest7name2 = "Fairywing Mantle"
	
	--Quest 8 Alliance
	Inst29Quest8 = "8. Великое предательство"
	Inst29Quest8_Level = "35"
	Inst29Quest8_Attain = "?"
	Inst29Quest8_Aim = "Отправляйтесь в Гномреган и убейте Мекжинера Термоштепселя. Вернитесь к Главному Механику Меггакруту."
	Inst29Quest8_Location = "Главный Механик Меггакрут (Стальгорн - Город механиков; "..YELLOW.."68,48"..WHITE..")"
	Inst29Quest8_Note = "Вы найдете Термоштепселя около "..YELLOW.."[6]"..WHITE..". Он - последний босс в Гномрегане.\nВо время боя вы должны обезвредить колонны нажатием кнопок на боковой поверхности."
	Inst29Quest8_Prequest = "Нет"
	Inst29Quest8_Folgequest = "Нет"
	--
	Inst29Quest8name1 = "Civinad Robes"
	Inst29Quest8name2 = "Triprunner Dungarees"
	Inst29Quest8name3 = "Dual Reinforced Leggings"
	
	--Quest 9 Alliance
	Inst29Quest9 = "9. Grime-Encrusted Ring"
	Inst29Quest9_Level = "34"
	Inst29Quest9_Attain = "28"
	Inst29Quest9_Aim = "Figure out a way to remove the grime from the Grime-Encrusted Ring."
	Inst29Quest9_Location = "Grime-Encrusted Ring (random drop from Gnomeregan)"
	Inst29Quest9_Note = "The Ring can be cleaned off at the Sparklematic 5200 in the Clean Room at "..YELLOW.."[2]"..WHITE.."."
	Inst29Quest9_Prequest = "Нет"
	Inst29Quest9_Folgequest = "Return of the Ring"
	-- No Rewards for this quest
	
	--Quest 10 Alliance
	Inst29Quest10 = "10. Return of the Ring"
	Inst29Quest10_Level = "34"
	Inst29Quest10_Attain = "28"
	Inst29Quest10_Aim = "You may either keep the ring, or you may find the person responsible for the imprint and engravings on the inside of the band."
	Inst29Quest10_Location = "Brilliant Gold Ring (obtained from Grime-Encrusted Ring quest)"
	Inst29Quest10_Note = "Turns in to Talvash del Kissel (Ironforge - Mystic Ward; "..YELLOW.."36,3"..WHITE.."). The followup to enhance the ring is optional."
	Inst29Quest10_Prequest = "Grime-Encrusted Ring"
	Inst29Quest10_Folgequest = "Gnome Improvement"
	--
	Inst29Quest10name1 = "Brilliant Gold Ring"
	
	
	--Quest 1 Horde
	Inst29Quest1_HORDE = "1. Поехалиии!"
	Inst29Quest1_HORDE_Level = "35"
	Inst29Quest1_HORDE_Attain = "23"
	Inst29Quest1_HORDE_Aim = "Дождитесь, пока Скути настроит гоблинский импульсный повторитель."
	Inst29Quest1_HORDE_Location = "Скути (Тернистая долина - Пиратская бухта; "..YELLOW.."27,77"..WHITE..")"
	Inst29Quest1_HORDE_Note = "Вы получите предшествующее задание у Совика (Оргриммар - Аллея Чести; "..YELLOW.."75,25"..WHITE..").\nПосле выполнения этого задания вы сможете использовать телепортатор в Пиратской бухте."
	Inst29Quest1_HORDE_Prequest = "Главный инженер Скути"
	Inst29Quest1_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 2 Horde  (same as Quest 7 Alliance)
	Inst29Quest2_HORDE = "2. Катавасия"
	Inst29Quest2_HORDE_Level = Inst29Quest7_Level
	Inst29Quest2_HORDE_Attain = Inst29Quest7_Attain
	Inst29Quest2_HORDE_Aim = Inst29Quest7_Aim
	Inst29Quest2_HORDE_Location = Inst29Quest7_Location
	Inst29Quest2_HORDE_Note = Inst29Quest7_Note
	Inst29Quest2_HORDE_Prequest = Inst29Quest7_Prequest
	Inst29Quest2_HORDE_Folgequest = Inst29Quest7_Folgequest
	--
	Inst29Quest2name1_HORDE = Inst29Quest7name1
	Inst29Quest2name2_HORDE = Inst29Quest7name2
	
	--Quest3 Horde
	Inst29Quest3_HORDE = "3. Техновойны"
	Inst29Quest3_HORDE_Level = "35"
	Inst29Quest3_HORDE_Attain = "?"
	Inst29Quest3_HORDE_Aim = "Добудьте в Гномрегане чертежи боевой машины и код от сейфа Термоштепселя в Гномрегане и принесите их Ноггу в Оргриммар."
	Inst29Quest3_HORDE_Location = "Ногг (Оргриммар - Аллея Чести; "..YELLOW.."75,25"..WHITE..")"
	Inst29Quest3_HORDE_Note = "Вы найдете Термоштепселя около "..YELLOW.."[6]"..WHITE..". Он - последний босс в Гномрегане.\nВо время боя вы должны обезвредить колонны нажатием кнопок на боковой поверхности."
	Inst29Quest3_HORDE_Prequest = "Нет"
	Inst29Quest3_HORDE_Folgequest = "Нет"
	--
	Inst29Quest3name1_HORDE = "Civinad Robes"
	Inst29Quest3name2_HORDE = "Triprunner Dungarees"
	Inst29Quest3name3_HORDE = "Dual Reinforced Leggings"
	
	--Quest 4 Horde  (same as Quest 9 Alliance)
	Inst29Quest4_HORDE = "4. Grime-Encrusted Ring"
	Inst29Quest4_HORDE_Level = Inst29Quest9_Level
	Inst29Quest4_HORDE_Attain = Inst29Quest9_Attain
	Inst29Quest4_HORDE_Aim = Inst29Quest9_Aim
	Inst29Quest4_HORDE_Location = Inst29Quest9_Location
	Inst29Quest4_HORDE_Note = Inst29Quest9_Note
	Inst29Quest4_HORDE_Prequest = Inst29Quest9_Prequest
	Inst29Quest4_HORDE_Folgequest = Inst29Quest9_Folgequest
	-- No Rewards for this quest
	
	--Quest 5 Horde
	Inst29Quest5_HORDE = "5. Return of the Ring"
	Inst29Quest5_HORDE_Level = "34"
	Inst29Quest5_HORDE_Attain = "28"
	Inst29Quest5_HORDE_Aim = "You may either keep the ring, or you may find the person responsible for the imprint and engravings on the inside of the band."
	Inst29Quest5_HORDE_Location = "Brilliant Gold Ring (obtained from Grime-Encrusted Ring quest)"
	Inst29Quest5_HORDE_Note = "Turns in to Nogg (Orgrimmar - The Valley of Honor; "..YELLOW.."75,25"..WHITE.."). The followup to enhance the ring is optional."
	Inst29Quest5_HORDE_Prequest = "Grime-Encrusted Ring"
	Inst29Quest5_HORDE_Folgequest = "Нет"
	--
	Inst29Quest5name1_HORDE = "Brilliant Gold Ring"
	
	
	
	--------------- INST57 - SM: Armory (SM Arm) ---------------
	Inst57Story = Inst19Story
	Inst57Caption = "SM: Оружейная"
	Inst57QAA = "1 Задание"
	Inst57QAH = "2 Задания"
	
	--Quest 1 Alliance
	Inst57Quest1 = "1. In the Name of the Light"
	Inst57Quest1_Level = "40"
	Inst57Quest1_Attain = "34"
	Inst57Quest1_Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Raleigh the Devout in Southshore."
	Inst57Quest1_Location = "Raleigh the Devout (Hillsbrad Foothills - Southshore; "..YELLOW.."51,58"..WHITE..")"
	Inst57Quest1_Note = "This quest line starts at Brother Crowley in Stormwind - Cathedral of Light ("..YELLOW.."42,24"..WHITE..").\nYou can find High Inquisitor Whitemane and Scarlet Commander Mograine at "..YELLOW.."SM: Cathedral [2]"..WHITE..", Herod at "..YELLOW.."SM: Armory [1]"..WHITE.." and Houndmaster Loksey at "..YELLOW.."SM: Library [1]"..WHITE.."."
	Inst57Quest1_Prequest = "Brother Anton -> Down the Scarlet Path"
	Inst57Quest1_Folgequest = "Нет"
	--
	Inst57Quest1name1 = "Sword of Serenity"
	Inst57Quest1name2 = "Bonebiter"
	Inst57Quest1name3 = "Black Menace"
	Inst57Quest1name4 = "Orb of Lorica"
	
	
	--Quest 1 Horde
	Inst57Quest1_HORDE = "1. Hearts of Zeal"
	Inst57Quest1_HORDE_Level = "33"
	Inst57Quest1_HORDE_Attain = "30"
	Inst57Quest1_HORDE_Aim = "Master Apothecary Faranell in the Undercity wants 20 Hearts of Zeal."
	Inst57Quest1_HORDE_Location = "Master Apothecary Faranell (Undercity - The Apothecarium; "..YELLOW.."48,69"..WHITE..")"
	Inst57Quest1_HORDE_Note = "All mobs in the Scarlet Monastery drop Hearts of Zeal."
	Inst57Quest1_HORDE_Prequest = "Going, Going, Guano! ("..YELLOW.."Razorfen Kraul"..WHITE..")"
	Inst57Quest1_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 2 Horde
	Inst57Quest2_HORDE = "2. Into The Scarlet Monastery"
	Inst57Quest2_HORDE_Level = "42"
	Inst57Quest2_HORDE_Attain = "33"
	Inst57Quest2_HORDE_Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Varimathras in the Undercity."
	Inst57Quest2_HORDE_Location = "Varimathras (Undercity - Royal Quarter; "..YELLOW.."56,92"..WHITE..")"
	Inst57Quest2_HORDE_Note = "You can find High Inquisitor Whitemane and Scarlet Commander Mograine at "..YELLOW.."SM: Cathedral [2]"..WHITE..", Herod at "..YELLOW.."SM: Armory [1]"..WHITE.." and Houndmaster Loksey at "..YELLOW.."SM: Library [1]"..WHITE.."."
	Inst57Quest2_HORDE_Prequest = "Нет"
	Inst57Quest2_HORDE_Folgequest = "Нет"
	--
	Inst57Quest2name1_HORDE = "Sword of Omen"
	Inst57Quest2name2_HORDE = "Prophetic Cane"
	Inst57Quest2name3_HORDE = "Dragon's Blood Necklace"
	
	
	
	--------------- INST58 - SM: Cathedral (SM Cath) ---------------
	Inst58Story = Inst19Story
	Inst58Caption = "SM: Собор"
	Inst58QAA = "1 Задание"
	Inst58QAH = "2 Задания"
	
	--Quest 1 Alliance
	Inst58Quest1 = "1. In the Name of the Light"
	Inst58Quest1_Level = "40"
	Inst58Quest1_Attain = "34"
	Inst58Quest1_Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Raleigh the Devout in Southshore."
	Inst58Quest1_Location = "Raleigh the Devout (Hillsbrad Foothills - Southshore; "..YELLOW.."51,58"..WHITE..")"
	Inst58Quest1_Note = "This quest line starts at Brother Crowley in Stormwind - Cathedral of Light ("..YELLOW.."42,24"..WHITE..").\nYou can find High Inquisitor Whitemane and Scarlet Commander Mograine at "..YELLOW.."SM: Cathedral [2]"..WHITE..", Herod at "..YELLOW.."SM: Armory [1]"..WHITE.." and Houndmaster Loksey at "..YELLOW.."SM: Library [1]"..WHITE.."."
	Inst58Quest1_Prequest = "Brother Anton -> Down the Scarlet Path"
	Inst58Quest1_Folgequest = "Нет"
	--
	Inst58Quest1name1 = "Sword of Serenity"
	Inst58Quest1name2 = "Bonebiter"
	Inst58Quest1name3 = "Black Menace"
	Inst58Quest1name4 = "Orb of Lorica"
	
	
	--Quest 1 Horde
	Inst58Quest1_HORDE = "1. Hearts of Zeal"
	Inst58Quest1_HORDE_Level = "33"
	Inst58Quest1_HORDE_Attain = "30"
	Inst58Quest1_HORDE_Aim = "Master Apothecary Faranell in the Undercity wants 20 Hearts of Zeal."
	Inst58Quest1_HORDE_Location = "Master Apothecary Faranell (Undercity - The Apothecarium; "..YELLOW.."48,69"..WHITE..")"
	Inst58Quest1_HORDE_Note = "All mobs in the Scarlet Monastery drop Hearts of Zeal."
	Inst58Quest1_HORDE_Prequest = "Going, Going, Guano! ("..YELLOW.."Razorfen Kraul"..WHITE..")"
	Inst58Quest1_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 2 Horde
	Inst58Quest2_HORDE = "2. Into The Scarlet Monastery"
	Inst58Quest2_HORDE_Level = "42"
	Inst58Quest2_HORDE_Attain = "33"
	Inst58Quest2_HORDE_Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Varimathras in the Undercity."
	Inst58Quest2_HORDE_Location = "Varimathras (Undercity - Royal Quarter; "..YELLOW.."56,92"..WHITE..")"
	Inst58Quest2_HORDE_Note = "You can find High Inquisitor Whitemane and Scarlet Commander Mograine at "..YELLOW.."SM: Cathedral [2]"..WHITE..", Herod at "..YELLOW.."SM: Armory [1]"..WHITE.." and Houndmaster Loksey at "..YELLOW.."SM: Library [1]"..WHITE.."."
	Inst58Quest2_HORDE_Prequest = "Нет"
	Inst58Quest2_HORDE_Folgequest = "Нет"
	--
	Inst58Quest2name1_HORDE = "Sword of Omen"
	Inst58Quest2name2_HORDE = "Prophetic Cane"
	Inst58Quest2name3_HORDE = "Dragon's Blood Necklace"
	
	
	
	--------------- INST59 - SM: Graveyard (SM GY) ---------------
	Inst59Story = Inst19Story
	Inst59Caption = "SM: Кладбище"
	Inst59QAA = "Нет заданий"
	Inst59QAH = "2 Задания"
	
	--Quest 1 Horde
	Inst59Quest1_HORDE = "1. Vorrel's Revenge"
	Inst59Quest1_HORDE_Level = "33"
	Inst59Quest1_HORDE_Attain = "25"
	Inst59Quest1_HORDE_Aim = "Return Vorrel Sengutz's wedding ring to Monika Sengutz in Tarren Mill."
	Inst59Quest1_HORDE_Location = "Vorrel Sengutz (Scarlet Monastery - Graveyard; "..YELLOW.."[1]"..WHITE..")"
	Inst59Quest1_HORDE_Note = "You can find Vorrel Sengutz at the beginning of the Graveyard section of the Scarlet Monastery. Nancy Vishas, who drops the ring needed for this quest, can be found in a house in the Alterac Mountains ("..YELLOW.."31,32"..WHITE..")."
	Inst59Quest1_HORDE_Prequest = "Нет"
	Inst59Quest1_HORDE_Folgequest = "Нет"
	--
	Inst59Quest1name1_HORDE = "Vorrel's Boots"
	Inst59Quest1name2_HORDE = "Mantle of Woe"
	Inst59Quest1name3_HORDE = "Grimsteel Cape"
	
	--Quest 2 Horde
	Inst59Quest2_HORDE = "2. Hearts of Zeal"
	Inst59Quest2_HORDE_Level = "33"
	Inst59Quest2_HORDE_Attain = "30"
	Inst59Quest2_HORDE_Aim = "Master Apothecary Faranell in the Undercity wants 20 Hearts of Zeal."
	Inst59Quest2_HORDE_Location = "Master Apothecary Faranell (Undercity - The Apothecarium; "..YELLOW.."48,69"..WHITE..")"
	Inst59Quest2_HORDE_Note = "All mobs in the Scarlet Monastery drop Hearts of Zeal."
	Inst59Quest2_HORDE_Prequest = "Going, Going, Guano! ("..YELLOW.."Razorfen Kraul"..WHITE..")"
	Inst59Quest2_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	
	
	---------------------------------------------------
	---------------- OUTDOOR RAIDS --------------------
	---------------------------------------------------
	
	--------------- INST30 - Dragons of Nightmare ---------------
	Inst30Story = {
		["Page1"] = "Вновь всколыхнулись Великие Деревья, предчувствуя новую угрозу, грозящую обрушиться на Ясеневый лес, Сумеречный лес, Фералас и Внутренние земли. Четверо могущественных Хранителей из Стаи Зелёных Драконов покинули Сон, но теперь, некогда гордые Хранители несут лишь разрушение и смерть. Приготовьтесь к битве и войдите в скрытые от непосвящённых взглядов рощи, дабы спасти Азерот от скверны, несомой безумными Драконами. ",
		["Page2"] = "Изера - великий Грезящий дракон Аспект испокон веков управляет своей Стаей. Её предназначение, хранить фантастическое, мистическое царство Изумрудного Сна. Хранители природы и грёз, её Стая с древнейших времён защищала Великие Деревья по всему миру, используемые друидами для того, что бы погрузиться в Сон. Но не так давно, пользующиеся наибольшим доверием лейтенанты Изеры были извращены новой тёмной силой, проникнувшей в пределы Изумрудного Сна. Теперь, безумные драконы, пройдя через Великие Деревья в Азерот, несут безумие и ужас всему живому, и даже самые могучие воины трижды подумают, прежде чем дерзнуть испытать на себе их всесокрушающий гнев.",
		["Page3"] = "Извращение Летона в Изумрудном Сне не только свело с ума могущественного дракона, но и наделило его способностью поглощать злобные тени своих врагов. Соединившись со своим господином, эти тени наполняют дракона живительной энергией. Вы должны быть готовы к этому, поскольку Летон всегда был одним из наиболее громадных и своенравных лейтенантов Изеры",
		["Page4"] = "Проникнувшая в пределы Изумрудного Сна тёмная скверна превратила некогда величественную Эмерисс в зловонное, обезображенное чудовище. По рассказам тех, кто сумел пережить встречу с драконом, трупы поверженных ею смертных извергали тошнотворное гниение. Эмерисс является поистине самым кошмарным и ужасным из Зелёных Драконов Изеры.",
		["Page5"] = "Таэрар был одним из наиболее пострадавших от скверны лейтенантов Изеры. Его столкновение с тёмной силой в Изумрудном Сне не только разрушило разум, но и материальную сущность Таэрара. Теперь, дракон способен разделяться на множество частей, каждая из которых обладает сокрушительной магической силой. Таэрар - хитрый и беспощадный противник, являющийся самим воплощением безумия для обитателей Азерота.",
		["Page6"] = "Исондра, некогда пользующаяся особым доверием Изеры, превратилась в убийцу, сея ужас и хаос по всему Азероту. Её прежний дар исцеления уступил место тёмной магии, позволяющей ей поражать врагов испепеляющими молниями и призывать на помощь жестоких друидов. Исондра и её семья также обладают способностью насылать сон, отправляя смертных в царство самых ужасающих кошмаров.",
		["MaxPages"] = "6",
	};
	Inst30Caption = "Драконы Кошмара"
	Inst30Caption2 = "Изера и ее выводок"
	Inst30Caption3 = "Летон"
	Inst30Caption4 = "Эмерисс"
	Inst30Caption5 = "Таэрар"
	Inst30Caption6 = "Исондра"
	Inst30QAA = "1 Задание"
	Inst30QAH = "1 Задание"
	
	--Quest 1 Alliance
	Inst30Quest1 = "1. Shrouded in Nightmare"
	Inst30Quest1_Level = "60"
	Inst30Quest1_Attain = "60"
	Inst30Quest1_Aim = "Find someone capable of deciphering the meaning behind the Nightmare Engulfed Object.\n\nPerhaps a druid of great power could assist you."
	Inst30Quest1_Location = "Nightmare Engulfed Object (drops from Emeriss, Taerar, Lethon or Ysondre)"
	Inst30Quest1_Note = "Quest turns in to Keeper Remulos at (Moonglade - Shrine of Remulos; "..YELLOW.."36,41"..WHITE.."). Reward listed is for the followup."
	Inst30Quest1_Prequest = "Нет"
	Inst30Quest1_Folgequest = "Waking Legends"
	--
	Inst30Quest1name1 = "Malfurion's Signet Ring"
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst30Quest1_HORDE = Inst30Quest1
	Inst30Quest1_HORDE_Level = Inst30Quest1_Level
	Inst30Quest1_HORDE_Attain = Inst30Quest1_Attain
	Inst30Quest1_HORDE_Aim = Inst30Quest1_Aim
	Inst30Quest1_HORDE_Location = Inst30Quest1_Location
	Inst30Quest1_HORDE_Note = Inst30Quest1_Note
	Inst30Quest1_HORDE_Prequest = Inst30Quest1_Prequest
	Inst30Quest1_HORDE_Folgequest = Inst30Quest1_Folgequest
	--
	Inst30Quest1name1_HORDE = Inst30Quest1name1
	
	
	
	--------------- INST31 - Azuregos ---------------
	Inst31Story = "Задолго до Разлома Мира, могущественный город ночных эльфов Элдарат располагался на земле, известной теперь как Азшара. Считается, что среди руин некогда великой цитадели могут быть найдёны множество древних и могучих артефактов Высокорожденных. В течении сотен поколений, Стая Синих Драконов охраняла эти артефакты и волшебные знания, служа гарантией того, что они никогда не попадут в руки смертных. А присутствие самого Азурегоса - синего дракона - явно указывает на то, что где-то здесь в Азшаре сокрыты по настоящему уникальные и могущественнейшие артефакты, и вполне возможно даже виалы с водами Колодца Вечности, которые ему так необходимы. Но не зависимо от того, что именно ищет Азурегос, можно быть твёрдо уверенным в одном - Синий Дракон будет сражаться до смерти, защищая волшебные сокровища Азшары."
	Inst31Caption = "Азурегос"
	Inst31QAA = "2 Задания"
	Inst31QAH = "2 Задания"
	
	--Quest 1 Alliance
	Inst31Quest1 = "1. Ancient Sinew Wrapped Lamina"
	Inst31Quest1_Level = "60"
	Inst31Quest1_Attain = "60"
	Inst31Quest1_Aim = "Hastat the Ancient has asked that you bring him a Mature Blue Dragon Sinew. Should you find this sinew, return it to Hastat in Felwood."
	Inst31Quest1_Location = "Hastat the Ancient (Felwood - Irontree Woods; "..YELLOW.."48,24"..WHITE..")"
	Inst31Quest1_Note = "Задание для охотников: Kill Azuregos to get the Mature Blue Dragon Sinew. He walks around the middle of the southern peninsula in Azshara near "..YELLOW.."[1]"..WHITE.."."
	Inst31Quest1_Prequest = "The Ancient Leaf ("..YELLOW.."Molten Core"..WHITE..")"
	Inst31Quest1_Folgequest = "Нет"
	--
	Inst31Quest1name1 = "Ancient Sinew Wrapped Lamina"
	
	--Quest 2 Alliance
	Inst31Quest2 = "2. Azuregos's Magical Ledger"
	Inst31Quest2_Level = "60"
	Inst31Quest2_Attain = "60"
	Inst31Quest2_Aim = "Deliver Azuregos's Magical Ledger to Narain Soothfancy in Tanaris."
	Inst31Quest2_Location = "Spirit of Azuregos (Azshara; "..YELLOW.."56,83"..WHITE..")"
	Inst31Quest2_Note = "You can find Narain Soothfancy in Tanaris at "..YELLOW.."65.17"..WHITE.."."
	Inst31Quest2_Prequest = "The Charge of the Dragonflights"
	Inst31Quest2_Folgequest = "Translating the Ledger"
	-- No Rewards for this quest
	
	
	--Quest 1 Horde  (same as Quest 1 Alliance)
	Inst31Quest1_HORDE = Inst31Quest1
	Inst31Quest1_HORDE_Level = Inst31Quest1_Level
	Inst31Quest1_HORDE_Attain = Inst31Quest1_Attain
	Inst31Quest1_HORDE_Aim = Inst31Quest1_Aim
	Inst31Quest1_HORDE_Location = Inst31Quest1_Location
	Inst31Quest1_HORDE_Note = Inst31Quest1_Note
	Inst31Quest1_HORDE_Prequest = Inst31Quest1_Prequest
	Inst31Quest1_HORDE_Folgequest = Inst31Quest1_Folgequest
	--
	Inst31Quest1name1_HORDE = Inst31Quest1name1
	
	
	--Quest 2 Horde  (same as Quest 2 Alliance)
	Inst31Quest2_HORDE = Inst31Quest2
	Inst31Quest2_HORDE_Level = Inst31Quest2_Level
	Inst31Quest2_HORDE_Attain = Inst31Quest2_Attain
	Inst31Quest2_HORDE_Aim = Inst31Quest2_Aim
	Inst31Quest2_HORDE_Location = Inst31Quest2_Location
	Inst31Quest2_HORDE_Note = Inst31Quest2_Note
	Inst31Quest2_HORDE_Prequest = Inst31Quest2_Prequest
	Inst31Quest2_HORDE_Folgequest = Inst31Quest2_Folgequest
	-- No Rewards for this quest
	
	
	
	--------------- INST32 - Lord Kazzak ---------------
	Inst32Story = "После поражения Пылающего Легиона в конце Третьей Войны, его оставшиеся силы во главе с гигантским демоном Лордом Каззаком обосновались в Выжженных Землях. И до сих пор они остаются там в области, названной Гниющим Шрамом, в ожидании повторного открытия Темного Портала. По слухам, как только Портал будет вновь открыт, Каззак и его армия отправятся в Запределье - бывшую родину орков мир Дренора, разорванный на части множеством порталов, открытых шаманом Нер`зулом и теперь оккупированный демоническими силами, ведомыми предателей ночным эльфом Иллиданом."
	Inst32Caption = "Владыка Каззак"
	Inst32QAA = "Нет заданий"
	Inst32QAH = "Нет заданий"
	
	
	
	---------------------------------------------------
	---------------- BATTLEGROUNDS --------------------
	---------------------------------------------------
	
	--------------- INST33 - Alterac Valley (AV) ---------------
	Inst33Story = "Давным-давно, еще до начала Первой Войны, злой колдун Гул'дан выслал клан орков, который назывался Северные Волки в неизведанную долину, скрывающуюся глубоко в горах Альтерака. Вот на юге этой долины и жили Северные Волки до появления Тралла.\nПосле триумфального объединения кланов Траллом, клан Северные Волки, возглавляемый орком-шаманом Дрек'Таром, решил остаться в долине, которая так долго была их домом. Но недавно спокойствие Северные Волков было нарушено прибытием Дворфской Экспедицией из Грозовой Вершины.\nЭта экспедиция остановилась в долине, что бы искать полезные ископаемые и древние реликвии. Несмотря на мирные цели экспедиции, само присутсвие дворфов в долине породило жаркий конфликт со Северными Волками, которые поклялись выдворить их за пределы своей земли. "
	Inst33Caption = "Альтеракская долина"
	Inst33QAA = "17 Заданий"
	Inst33QAH = "17 Заданий"
	
	--Quest 1 Alliance
	Inst33Quest1 = "1. The Sovereign Imperative"
	Inst33Quest1_Level = "60"
	Inst33Quest1_Attain = "51"
	Inst33Quest1_Aim = "Travel to Alterac Valley in the Hillsbrad Foothills. Outside of the entrance tunnel, find and speak with Lieutenant Haggerdin."
	Inst33Quest1_Location = "Lieutenant Rotimer (Ironforge - The Commons; "..YELLOW.."30,62"..WHITE..")"
	Inst33Quest1_Note = "Lieutenant Haggerdin is at (Alterac Mountains; "..YELLOW.."39,81"..WHITE..")."
	Inst33Quest1_Prequest = "Нет"
	Inst33Quest1_Folgequest = "Proving Grounds"
	-- No Rewards for this quest
	
	--Quest 2 Alliance
	Inst33Quest2 = "2. Proving Grounds"
	Inst33Quest2_Level = "60"
	Inst33Quest2_Attain = "51"
	Inst33Quest2_Aim = "Travel to the Icewing Caverns located southwest of Dun Baldar in Alterac Valley and recover the Stormpike Banner. Return the Stormpike Banner to Lieutenant Haggerdin in the Alterac Mountains."
	Inst33Quest2_Location = "Lieutenant Haggerdin (Alterac Mountains; "..YELLOW.."39,81"..WHITE..")"
	Inst33Quest2_Note = "The Stormpike Banner is in the Icewing Cavern at "..YELLOW.."[11]"..WHITE.." on the Alterac Valley - North map. Talk to the same NPC each time you gain a new Reputation level for an upgraded Insignia.\n\nThe prequest is not necessary to obtain this quest, but it does yield about 9550 experience."
	Inst33Quest2_Prequest = "The Sovereign Imperative"
	Inst33Quest2_Folgequest = "Нет"
	--
	Inst33Quest2name1 = "Stormpike Insignia Rank 1"
	Inst33Quest2name2 = "The Frostwolf Artichoke"
	
	--Quest 3 Alliance
	Inst33Quest3 = "3. The Battle of Alterac"
	Inst33Quest3_Level = "60"
	Inst33Quest3_Attain = "51"
	Inst33Quest3_Aim = "Enter Alterac Valley, defeat the Horde general Drek'thar, and then return to Prospector Stonehewer in the Alterac Mountains."
	Inst33Quest3_Location = "Prospector Stonehewer (Alterac Mountains; "..YELLOW.."41,80"..WHITE..") and\n(Alterac Valley - North; "..YELLOW.."[B]"..WHITE..")"
	Inst33Quest3_Note = "Drek'thar is at (Alterac Valley - South; "..YELLOW.."[B]"..WHITE.."). He does not actually need to be killed to complete the quest. The battleground just has to be won by your side in any manner.\nAfter turning this quest in, talk to the NPC again for the reward."
	Inst33Quest3_Prequest = "Нет"
	Inst33Quest3_Folgequest = "Hero of the Stormpike"
	--
	Inst33Quest3name1 = "Bloodseeker"
	Inst33Quest3name2 = "Ice Barbed Spear"
	Inst33Quest3name3 = "Wand of Biting Cold"
	Inst33Quest3name4 = "Cold Forged Hammer"
	
	--Quest 4 Alliance
	Inst33Quest4 = "4. The Quartermaster"
	Inst33Quest4_Level = "60"
	Inst33Quest4_Attain = "51"
	Inst33Quest4_Aim = "Speak with the Stormpike Quartermaster."
	Inst33Quest4_Location = "Mountaineer Boombellow (Alterac Valley - North; "..YELLOW.."Near [3] Before Bridge"..WHITE..")"
	Inst33Quest4_Note = "The Stormpike Quartermaster is at (Alterac Valley - North; "..YELLOW.."[7]"..WHITE..") and provides more quests."
	Inst33Quest4_Prequest = "Нет"
	Inst33Quest4_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 5 Alliance
	Inst33Quest5 = "5. Coldtooth Supplies"
	Inst33Quest5_Level = "60"
	Inst33Quest5_Attain = "51"
	Inst33Quest5_Aim = "Bring 10 Coldtooth Supplies to the Alliance Quartermaster in Dun Baldar."
	Inst33Quest5_Location = "Stormpike Quartermaster (Alterac Valley - North; "..YELLOW.."[7]"..WHITE..")"
	Inst33Quest5_Note = "The supplies can be found in the Coldtooth Mine at (Alterac Valley - South; "..YELLOW.."[6]"..WHITE..")."
	Inst33Quest5_Prequest = "Нет"
	Inst33Quest5_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 6 Alliance
	Inst33Quest6 = "6. Irondeep Supplies"
	Inst33Quest6_Level = "60"
	Inst33Quest6_Attain = "51"
	Inst33Quest6_Aim = "Bring 10 Irondeep Supplies to the Alliance Quartermaster in Dun Baldar."
	Inst33Quest6_Location = "Stormpike Quartermaster (Alterac Valley - North; "..YELLOW.."[7]"..WHITE..")"
	Inst33Quest6_Note = "The supplies can be found in the Coldtooth Mine at (Alterac Valley - North; "..YELLOW.."[1]"..WHITE..")."
	Inst33Quest6_Prequest = "Нет"
	Inst33Quest6_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 7 Alliance
	Inst33Quest7 = "7. Armor Scraps"
	Inst33Quest7_Level = "60"
	Inst33Quest7_Attain = "51"
	Inst33Quest7_Aim = "Bring 20 Armor Scraps to Murgot Deepforge in Dun Baldar."
	Inst33Quest7_Location = "Murgot Deepforge (Alterac Valley - North; "..YELLOW.."[4]"..WHITE..")"
	Inst33Quest7_Note = "Loot the corpse of enemy players for scraps. The followup is just the same, quest, but repeatable."
	Inst33Quest7_Prequest = "Нет"
	Inst33Quest7_Folgequest = "More Armor Scraps"
	-- No Rewards for this quest
	
	--Quest 8 Alliance
	Inst33Quest8 = "8. Capture a Mine"
	Inst33Quest8_Level = "60"
	Inst33Quest8_Attain = "51"
	Inst33Quest8_Aim = "Capture a mine that the Stormpike does not control, then return to Sergeant Durgen Stormpike in the Alterac Mountains."
	Inst33Quest8_Location = "Sergeant Durgen Stormpike (Alterac Mountains; "..YELLOW.."37,77"..WHITE..")"
	Inst33Quest8_Note = "To complete the quest, you must kill either Morloch in the Irondeep Mine at (Alterac Valley - North; "..YELLOW.."[1]"..WHITE..") or Taskmaster Snivvle in the Coldtooth Mine at (Alterac Valley - South; "..YELLOW.."[6]"..WHITE..") while the Horde control it."
	Inst33Quest8_Prequest = "Нет"
	Inst33Quest8_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 9 Alliance
	Inst33Quest9 = "9. Towers and Bunkers"
	Inst33Quest9_Level = "60"
	Inst33Quest9_Attain = "51"
	Inst33Quest9_Aim = "Destroy the banner at an enemy tower or bunker, then return to Sergeant Durgen Stormpike in the Alterac Mountains."
	Inst33Quest9_Location = "Sergeant Durgen Stormpike (Alterac Mountains; "..YELLOW.."37,77"..WHITE..")"
	Inst33Quest9_Note = "Reportedly, the Tower or Bunker need not actually be destroyed to complete the quest, just assaulted."
	Inst33Quest9_Prequest = "Нет"
	Inst33Quest9_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 10 Alliance
	Inst33Quest10 = "10. Alterac Valley Graveyards"
	Inst33Quest10_Level = "60"
	Inst33Quest10_Attain = "51"
	Inst33Quest10_Aim = "Assault a graveyard, then return to Sergeant Durgen Stormpike in the Alterac Mountains."
	Inst33Quest10_Location = "Sergeant Durgen Stormpike (Alterac Mountains; "..YELLOW.."37,77"..WHITE..")"
	Inst33Quest10_Note = "Reportedly you do not need to do anything but be near a graveyard when the Alliance assaults it. It does not need to be captured, just assaulted."
	Inst33Quest10_Prequest = "Нет"
	Inst33Quest10_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 11 Alliance
	Inst33Quest11 = "11. Empty Stables"
	Inst33Quest11_Level = "60"
	Inst33Quest11_Attain = "51"
	Inst33Quest11_Aim = "Locate an Alterac Ram in Alterac Valley. Use the Stormpike Training Collar when you are near the Alterac Ram to 'tame' the beast. Once tamed, the Alterac Ram will follow you back to the Stable Master. Speak with the Stable Master to earn credit for the capture."
	Inst33Quest11_Location = "Stormpike Stable Master (Alterac Valley - North; "..YELLOW.."[6]"..WHITE..")"
	Inst33Quest11_Note = "You can find a Ram outside the base. The taming process is just like that of a Hunter taming a pet. The quest is repeatable up to a total of 25 times per battleground by the same player or players. After 25 Rams have been tamed, the Stormpike Cavalry will arrive to assist in the battle."
	Inst33Quest11_Prequest = "Нет"
	Inst33Quest11_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 12 Alliance
	Inst33Quest12 = "12. Ram Riding Harnesses"
	Inst33Quest12_Level = "60"
	Inst33Quest12_Attain = "51"
	Inst33Quest12_Aim = "You must strike at our enemy's base, slaying the frostwolves they use as mounts and taking their hides. Return their hides to me so that harnesses may be made for the cavalry. Go!"
	Inst33Quest12_Location = "Stormpike Ram Rider Commander (Alterac Valley - North; "..YELLOW.."[6]"..WHITE..")"
	Inst33Quest12_Note = "Frostwolves can be found in the southern area of Alterac Valley."
	Inst33Quest12_Prequest = "Нет"
	Inst33Quest12_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 13 Alliance
	Inst33Quest13 = "13. Crystal Cluster"
	Inst33Quest13_Level = "60"
	Inst33Quest13_Attain = "51"
	Inst33Quest13_Aim = "There are times which you may be entrenched in battle for days or weeks on end. During those longer periods of activity you may end up collecting large clusters of the Frostwolf's storm crystals.\n\nThe Circle accepts such offerings."
	Inst33Quest13_Location = "Arch Druid Renferal (Alterac Valley - North; "..YELLOW.."[2]"..WHITE..")"
	Inst33Quest13_Note = "After turning in 200 or so crystals, Arch Druid Renferal will begin walking towards (Alterac Valley - North; "..YELLOW.."[19]"..WHITE.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Ivus the Forest Lord will be summoned to help the battle."
	Inst33Quest13_Prequest = "Нет"
	Inst33Quest13_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 14 Alliance
	Inst33Quest14 = "14. Ivus the Forest Lord"
	Inst33Quest14_Level = "60"
	Inst33Quest14_Attain = "51"
	Inst33Quest14_Aim = "The Frostwolf Clan is protected by a taint of elemental energy. Their shaman meddle in powers that will surely destroy us all if left unchecked.\n\nThe Frostwolf soldiers carry elemental charms called storm crystals. We can use the charms to conjure Ivus. Venture forth and claim the crystals."
	Inst33Quest14_Location = "Arch Druid Renferal (Alterac Valley - North; "..YELLOW.."[2]"..WHITE..")"
	Inst33Quest14_Note = "After turning in 200 or so crystals, Arch Druid Renferal will begin walking towards (Alterac Valley - North; "..YELLOW.."[19]"..WHITE.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Ivus the Forest Lord will be summoned to help the battle."
	Inst33Quest14_Prequest = "Нет"
	Inst33Quest14_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 15 Alliance
	Inst33Quest15 = "15. Call of Air - Slidore's Fleet"
	Inst33Quest15_Level = "60"
	Inst33Quest15_Attain = "51"
	Inst33Quest15_Aim = "My gryphons are poised to strike at the front lines but cannot make the attack until the lines are thinned out.\n\nThe Frostwolf warriors charged with holding the front lines wear medals of service proudly upon their chests. Rip those medals off their rotten corpses and bring them back here.\n\nOnce the front line is sufficiently thinned out, I will make the call to air! Death from above!"
	Inst33Quest15_Location = "Wing Commander Slidore (Alterac Valley - North; "..YELLOW.."[8]"..WHITE..")"
	Inst33Quest15_Note = "Kill Horde NPCs for the Frostwolf Soldier's Medal."
	Inst33Quest15_Prequest = "Нет"
	Inst33Quest15_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 16 Alliance
	Inst33Quest16 = "16. Call of Air - Vipore's Fleet"
	Inst33Quest16_Level = "60"
	Inst33Quest16_Attain = "51"
	Inst33Quest16_Aim = "The elite Frostwolf units that guard the lines must be dealt with, soldier! I'm tasking you with thinning out that herd of savages. Return to me with medals from their lieutenants and legionnaires. When I feel that enough of the riff-raff has been dealt with, I'll deploy the air strike."
	Inst33Quest16_Location = "Wing Commander Vipore (Alterac Valley - North; "..YELLOW.."[8]"..WHITE..")"
	Inst33Quest16_Note = "Kill Horde NPCs for the Frostwolf Lieutenant's Medal."
	Inst33Quest16_Prequest = "Нет"
	Inst33Quest16_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 17 Alliance
	Inst33Quest17 = "17. Call of Air - Ichman's Fleet"
	Inst33Quest17_Level = "60"
	Inst33Quest17_Attain = "51"
	Inst33Quest17_Aim = "Return to the battlefield and strike at the heart of the Frostwolf's command. Take down their commanders and guardians. Return to me with as many of their medals as you can stuff in your pack! I promise you, when my gryphons see the bounty and smell the blood of our enemies, they will fly again! Go now!"
	Inst33Quest17_Location = "Wing Commander Ichman (Alterac Valley - North; "..YELLOW.."[8]"..WHITE..")"
	Inst33Quest17_Note = "Kill Horde NPCs for the Frostwolf Commander's Medals. After turning in 50, Wing Commander Ichman will either send a gryphon to attack the Horde base or give you a beacon to plant in the Snowfall Graveyard. If the beacon is protected long enough a gryphon will come to defend it."
	Inst33Quest17_Prequest = "Нет"
	Inst33Quest17_Folgequest = "Нет"
	-- No Rewards for this quest
	
	
	--Quest 1 Horde
	Inst33Quest1_HORDE = "1. In Defense of Frostwolf"
	Inst33Quest1_HORDE_Level = "60"
	Inst33Quest1_HORDE_Attain = "51"
	Inst33Quest1_HORDE_Aim = "Venture to Alterac Valley, located in the Alterac Mountains. Find and speak with Warmaster Laggrond - who stands outside the tunnel entrance - to begin your career as a soldier of Frostwolf. You will find Alterac Valley north of Tarren Mill at the base of the Alterac Mountains."
	Inst33Quest1_HORDE_Location = "Frostwolf Ambassador Rokhstrom (Orgrimmar - Valley of Strength "..YELLOW.."50,71"..WHITE..")"
	Inst33Quest1_HORDE_Note = "Warmaster Laggrond is at (Alterac Mountains; "..YELLOW.."62,59"..WHITE..")."
	Inst33Quest1_HORDE_Prequest = "Нет"
	Inst33Quest1_HORDE_Folgequest = "Proving Grounds"
	-- No Rewards for this quest
	
	--Quest 2 Horde
	Inst33Quest2_HORDE = "2. Proving Grounds"
	Inst33Quest2_HORDE_Level = "60"
	Inst33Quest2_HORDE_Attain = "51"
	Inst33Quest2_HORDE_Aim = "Travel to the Wildpaw cavern located southeast of the main base in Alterac Valley and find the Frostwolf Banner. Return the Frostwolf Banner to Warmaster Laggrond."
	Inst33Quest2_HORDE_Location = "Warmaster Laggrond (Alterac Mountains; "..YELLOW.."62,59"..WHITE..")"
	Inst33Quest2_HORDE_Note = "The Frostwolf Banner is in the Wildpaw Cavern at (Alterac Valley - South; "..YELLOW.."[9]"..WHITE.."). Talk to the same NPC each time you gain a new Reputation level for an upgraded Insignia.\n\nThe prequest is not necessary to obtain this quest, but it does yield about 9550 experience."
	Inst33Quest2_HORDE_Prequest = "In Defense of Frostwolf"
	Inst33Quest2_HORDE_Folgequest = "Нет"
	
	--
	Inst33Quest2name1_HORDE = "Frostwolf Insignia Rank 1"
	Inst33Quest2name2_HORDE = "Peeling the Onion"
	
	--Quest 3 Horde
	Inst33Quest3_HORDE = "3. The Battle for Alterac"
	Inst33Quest3_HORDE_Level = "60"
	Inst33Quest3_HORDE_Attain = "51"
	Inst33Quest3_HORDE_Aim = "Enter Alterac Valley and defeat the dwarven general, Vanndar Stormpike. Then, return to Voggah Deathgrip in the Alterac Mountains."
	Inst33Quest3_HORDE_Location = "Voggah Deathgrip (Alterac Mountains; "..YELLOW.."64,60"..WHITE..")"
	Inst33Quest3_HORDE_Note = "Vanndar Stormpike is at (Alterac Valley - North; "..YELLOW.."[B]"..WHITE.."). He does not actually need to be killed to complete the quest. The battleground just has to be won by your side in any manner.\nAfter turning this quest in, talk to the NPC again for the reward."
	Inst33Quest3_HORDE_Prequest = "Нет"
	Inst33Quest3_HORDE_Folgequest = "Hero of the Frostwolf"
	--
	Inst33Quest3name1_HORDE = "Bloodseeker"
	Inst33Quest3name2_HORDE = "Ice Barbed Spear"
	Inst33Quest3name3_HORDE = "Wand of Biting Cold"
	Inst33Quest3name4_HORDE = "Cold Forged Hammer"
	
	--Quest 4 Horde
	Inst33Quest4_HORDE = "4. Speak with our Quartermaster"
	Inst33Quest4_HORDE_Level = "60"
	Inst33Quest4_HORDE_Attain = "51"
	Inst33Quest4_HORDE_Aim = "Speak with the Frostwolf Quartermaster."
	Inst33Quest4_HORDE_Location = "Jotek (Alterac Valley - South; "..YELLOW.."[8]"..WHITE..")"
	Inst33Quest4_HORDE_Note = "The Frostwolf Quartermaster is at "..YELLOW.."[10]"..WHITE.." and provides more quests."
	Inst33Quest4_HORDE_Prequest = "Нет"
	Inst33Quest4_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 5 Horde
	Inst33Quest5_HORDE = "5. Coldtooth Supplies"
	Inst33Quest5_HORDE_Level = "60"
	Inst33Quest5_HORDE_Attain = "51"
	Inst33Quest5_HORDE_Aim = "Bring 10 Coldtooth Supplies to the Horde Quatermaster in Frostwolf Keep."
	Inst33Quest5_HORDE_Location = "Frostwolf Quartermaster (Alterac Valley - South; "..YELLOW.."[10]"..WHITE..")"
	Inst33Quest5_HORDE_Note = "The supplies can be found in the Coldtooth Mine at (Alterac Valley - South; "..YELLOW.."[6]"..WHITE..")."
	Inst33Quest5_HORDE_Prequest = "Нет"
	Inst33Quest5_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 6 Horde
	Inst33Quest6_HORDE = "6. Irondeep Supplies"
	Inst33Quest6_HORDE_Level = "60"
	Inst33Quest6_HORDE_Attain = "51"
	Inst33Quest6_HORDE_Aim = "Bring 10 Irondeep Supplies to the Horde Quartermaster in Frostwolf Keep."
	Inst33Quest6_HORDE_Location = "Frostwolf Quartermaster (Alterac Valley - South; "..YELLOW.."[10]"..WHITE..")"
	Inst33Quest6_HORDE_Note = "The supplies can be found in the Coldtooth Mine at (Alterac Valley - North; "..YELLOW.."[1]"..WHITE..")."
	Inst33Quest6_HORDE_Prequest = "Нет"
	Inst33Quest6_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 7 Horde
	Inst33Quest7_HORDE = "7. Enemy Booty"
	Inst33Quest7_HORDE_Level = "60"
	Inst33Quest7_HORDE_Attain = "51"
	Inst33Quest7_HORDE_Aim = "Bring 20 Armor Scraps to Smith Regzar in Frostwolf Village."
	Inst33Quest7_HORDE_Location = "Smith Regzar (Alterac Valley - South; "..YELLOW.."[8]"..WHITE..")"
	Inst33Quest7_HORDE_Note = "Loot the corpse of enemy players for scraps. The followup is just the same, quest, but repeatable."
	Inst33Quest7_HORDE_Prequest = "Нет"
	Inst33Quest7_HORDE_Folgequest = "More Booty!"
	-- No Rewards for this quest
	
	--Quest 8 Horde
	Inst33Quest8_HORDE = "8. Capture a Mine"
	Inst33Quest8_HORDE_Level = "60"
	Inst33Quest8_HORDE_Attain = "51"
	Inst33Quest8_HORDE_Aim = "Capture a mine, then return to Corporal Teeka Bloodsnarl in the Alterac Mountains."
	Inst33Quest8_HORDE_Location = "Corporal Teeka Bloodsnarl (Alterac Mountains; "..YELLOW.."66,55"..WHITE..")"
	Inst33Quest8_HORDE_Note = "To complete the quest, you must kill either Morloch in the Irondeep Mine at (Alterac Valley - North; "..YELLOW.."[1]"..WHITE..") or Taskmaster Snivvle in the Coldtooth Mine at (Alterac Valley - South; "..YELLOW.."[6]"..WHITE..") while the Alliance control it."
	Inst33Quest8_HORDE_Prequest = "Нет"
	Inst33Quest8_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 9 Horde
	Inst33Quest9_HORDE = "9. Towers and Bunkers"
	Inst33Quest9_HORDE_Level = "60"
	Inst33Quest9_HORDE_Attain = "51"
	Inst33Quest9_HORDE_Aim = "Capture an enemy tower, then return to Corporal Teeka Bloodsnarl in the Alterac Mountains."
	Inst33Quest9_HORDE_Location = "Corporal Teeka Bloodsnarl (Alterac Mountains; "..YELLOW.."66,55"..WHITE..")"
	Inst33Quest9_HORDE_Note = "Reportedly, the Tower or Bunker need not actually be destroyed to complete the quest, just assaulted."
	Inst33Quest9_HORDE_Prequest = "Нет"
	Inst33Quest9_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 10 Horde
	Inst33Quest10_HORDE = "10. The Graveyards of Alterac"
	Inst33Quest10_HORDE_Level = "60"
	Inst33Quest10_HORDE_Attain = "51"
	Inst33Quest10_HORDE_Aim = "Assault a graveyard, then return to Corporal Teeka Bloodsnarl in the Alterac Mountains."
	Inst33Quest10_HORDE_Location = "Corporal Teeka Bloodsnarl (Alterac Mountains; "..YELLOW.."66,55"..WHITE..")"
	Inst33Quest10_HORDE_Note = "Reportedly you do not need to do anything but be near a graveyard when the Horde assaults it. It does not need to be captured, just assaulted."
	Inst33Quest10_HORDE_Prequest = "Нет"
	Inst33Quest10_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 11 Horde
	Inst33Quest11_HORDE = "11. Empty Stables"
	Inst33Quest11_HORDE_Level = "60"
	Inst33Quest11_HORDE_Attain = "51"
	Inst33Quest11_HORDE_Aim = "Locate a Frostwolf in Alterac Valley. Use the Frostwolf Muzzle when you are near the Frostwolf to 'tame' the beast. Once tamed, the Frostwolf will follow you back to the Frostwolf Stable Master. Speak with the Frostwolf Stable Master to earn credit for the capture."
	Inst33Quest11_HORDE_Location = "Frostwolf Stable Master (Alterac Valley - South; "..YELLOW.."[9]"..WHITE..")"
	Inst33Quest11_HORDE_Note = "You can find a Frostwolf outside the base. The taming process is just like that of a Hunter taming a pet. The quest is repeatable up to a total of 25 times per battleground by the same player or players. After 25 Rams have been tamed, the Frostwolf Cavalry will arrive to assist in the battle."
	Inst33Quest11_HORDE_Prequest = "Нет"
	Inst33Quest11_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 12 Horde
	Inst33Quest12_HORDE = "12. Ram Hide Harnesses"
	Inst33Quest12_HORDE_Level = "60"
	Inst33Quest12_HORDE_Attain = "51"
	Inst33Quest12_HORDE_Aim = "You must strike at the indigenous rams of the region. The very same rams that the Stormpike cavalry uses as mounts!\n\nSlay them and return to me with their hides. Once we have gathered enough hides, we will fashion harnesses for the riders. The Frostwolf Wolf Riders will ride once more!"
	Inst33Quest12_HORDE_Location = "Frostwolf Wolf Rider Commander (Alterac Valley - South; "..YELLOW.."[9]"..WHITE..")"
	Inst33Quest12_HORDE_Note = "The Rams can be found in the northern area of Alterac Valley."
	Inst33Quest12_HORDE_Prequest = "Нет"
	Inst33Quest12_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 13 Horde
	Inst33Quest13_HORDE = "13. A Gallon of Blood"
	Inst33Quest13_HORDE_Level = "60"
	Inst33Quest13_HORDE_Attain = "51"
	Inst33Quest13_HORDE_Aim = "You have the option of offering larger quantities of the blood taken from our enemies. I will be glad to accept gallon sized offerings."
	Inst33Quest13_HORDE_Location = "Primalist Thurloga (Alterac Valley - South; "..YELLOW.."[8]"..WHITE..")"
	Inst33Quest13_HORDE_Note = "After turning in 150 or so Blood, Primalist Thurloga will begin walking towards (Alterac Valley - South; "..YELLOW.."[14]"..WHITE.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Lokholar the Ice Lord will be summoned to kill Alliance players."
	Inst33Quest13_HORDE_Prequest = "Нет"
	Inst33Quest13_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 14 Horde
	Inst33Quest14_HORDE = "14. Lokholar the Ice Lord"
	Inst33Quest14_HORDE_Level = "60"
	Inst33Quest14_HORDE_Attain = "51"
	Inst33Quest14_HORDE_Aim = "You must strike down our enemies and bring to me their blood. Once enough blood has been gathered, the ritual of summoning may begin.\n\nVictory will be assured when the elemental lord is loosed upon the Stormpike army."
	Inst33Quest14_HORDE_Location = "Primalist Thurloga (Alterac Valley - South; "..YELLOW.."[8]"..WHITE..")"
	Inst33Quest14_HORDE_Note = "After turning in 150 or so Blood, Primalist Thurloga will begin walking towards (Alterac Valley - South; "..YELLOW.."[14]"..WHITE.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Lokholar the Ice Lord will be summoned to kill Alliance players."
	Inst33Quest14_HORDE_Prequest = "Нет"
	Inst33Quest14_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 15 Horde
	Inst33Quest15_HORDE = "15. Call of Air - Guse's Fleet"
	Inst33Quest15_HORDE_Level = "60"
	Inst33Quest15_HORDE_Attain = "51"
	Inst33Quest15_HORDE_Aim = "My riders are set to make a strike on the central battlefield; but first, I must wet their appetites - preparing them for the assault.\n\nI need enough Stormpike Soldier Flesh to feed a fleet! Hundreds of pounds! Surely you can handle that, yes? Get going!"
	Inst33Quest15_HORDE_Location = "Wing Commander Guse (Alterac Valley - South; "..YELLOW.."[13]"..WHITE..")"
	Inst33Quest15_HORDE_Note = "Kill Horde NPCs for the Stormpike Soldier's Flesh. Reportedly 90 flesh are needed to make the Wing Commander do whatever she does."
	Inst33Quest15_HORDE_Prequest = "Нет"
	Inst33Quest15_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 16 Horde
	Inst33Quest16_HORDE = "16. Call of Air - Jeztor's Fleet"
	Inst33Quest16_HORDE_Level = "60"
	Inst33Quest16_HORDE_Attain = "51"
	Inst33Quest16_HORDE_Aim = "My War Riders must taste in the flesh of their targets. This will ensure a surgical strike against our enemies!\n\nMy fleet is the second most powerful in our air command. Thusly, they will strike at the more powerful of our adversaries. For this, then, they need the flesh of the Stormpike Lieutenants."
	Inst33Quest16_HORDE_Location = "Wing Commander Jeztor (Alterac Valley - South; "..YELLOW.."[13]"..WHITE..")"
	Inst33Quest16_HORDE_Note = "Kill Alliance NPCs for the Stormpike Lieutenant's Flesh."
	Inst33Quest16_HORDE_Prequest = "Нет"
	Inst33Quest16_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 17 Horde
	Inst33Quest17_HORDE = "17. Call of Air - Mulverick's Fleet"
	Inst33Quest17_HORDE_Level = "60"
	Inst33Quest17_HORDE_Attain = "51"
	Inst33Quest17_HORDE_Aim = "First, my war riders need targets to gun for - high priority targets. I'm going to need to feed them the flesh of Stormpike Commanders. Unfortunately, those little buggers are entrenched deep behind enemy lines! You've definitely got your work cut out for you."
	Inst33Quest17_HORDE_Location = "Wing Commander Mulverick (Alterac Valley - South; "..YELLOW.."[13]"..WHITE..")"
	Inst33Quest17_HORDE_Note = "Kill Alliance NPCs for the Stormpike Commander's Flesh."
	Inst33Quest17_HORDE_Prequest = "Нет"
	Inst33Quest17_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	
	
	--------------- INST34 - Arathi Basin (AB) ---------------
	Inst34Story = "Низина Арати, расположенная в Нагорье Арати, это быстрое и захватывающее Поле сражений. Низина богата ресурсами и ею жаждут обладать и Орда, и Альянс. Отрекшиеся осквернители и Лига Аратора прибыли в низину Арати, чтобы побороться за природные ресурсы и заявить на них права от лица представляемых ими сторон."
	Inst34Caption = "Низина Арати"
	Inst34QAA = "3 Задания"
	Inst34QAH = "3 Задания"
	
	--Quest 1 Alliance
	Inst34Quest1 = "1. The Battle for Arathi Basin!"
	Inst34Quest1_Level = "25"
	Inst34Quest1_Attain = "25"
	Inst34Quest1_Aim = "Assault the mine, the lumber mill, the blacksmith and the farm, then return to Field Marshal Oslight in Refuge Pointe."
	Inst34Quest1_Location = "Field Marshal Oslight (Arathi Highlands - Refuge Pointe; "..YELLOW.."46,45"..WHITE..")"
	Inst34Quest1_Note = "The locations to be assaulted are marked on the map as 2 through 5."
	Inst34Quest1_Prequest = "Нет"
	Inst34Quest1_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 2 Alliance
	Inst34Quest2 = "2. Control Four Bases"
	Inst34Quest2_Level = "60"
	Inst34Quest2_Attain = "60"
	Inst34Quest2_Aim = "Enter Arathi Basin, capture and control four bases at the same time, and then return to Field Marshal Oslight at Refuge Pointe."
	Inst34Quest2_Location = "Field Marshal Oslight (Arathi Highlands - Refuge Pointe; "..YELLOW.."46,45"..WHITE..")"
	Inst34Quest2_Note = "You need to be Friendly with the League of Arathor to get this quest."
	Inst34Quest2_Prequest = "Нет"
	Inst34Quest2_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 3 Alliance
	Inst34Quest3 = "3. Control Five Bases"
	Inst34Quest3_Level = "60"
	Inst34Quest3_Attain = "60"
	Inst34Quest3_Aim = "Control 5 bases in Arathi Basin at the same time, then return to Field Marshal Oslight at Refuge Pointe."
	Inst34Quest3_Location = "Field Marshal Oslight (Arathi Highlands - Refuge Pointe; "..YELLOW.."46,45"..WHITE..")"
	Inst34Quest3_Note = "You need to be Exalted with the League of Arathor to get this quest."
	Inst34Quest3_Prequest = "Нет"
	Inst34Quest3_Folgequest = "Нет"
	--
	Inst34Quest3name1 = "Arathor Battle Tabard"
	
	
	--Quest 1 Horde
	Inst34Quest1_HORDE = "1. The Battle for Arathi Basin!"
	Inst34Quest1_HORDE_Level = "25"
	Inst34Quest1_HORDE_Attain = "25"
	Inst34Quest1_HORDE_Aim = "Assault the Arathi Basin mine, lumber mill, blacksmith and stable, and then return to Deathmaster Dwire in Hammerfall."
	Inst34Quest1_HORDE_Location = "Deathmaster Dwire (Arathi Highlands - Hammerfall; "..YELLOW.."74,35"..WHITE..")"
	Inst34Quest1_HORDE_Note = "The locations to be assaulted are marked on the map as 1 through 4."
	Inst34Quest1_HORDE_Prequest = "Нет"
	Inst34Quest1_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 2 Horde
	Inst34Quest2_HORDE = "2. Take Four Bases"
	Inst34Quest2_HORDE_Level = "60"
	Inst34Quest2_HORDE_Attain = "60"
	Inst34Quest2_HORDE_Aim = "Hold four bases at the same time in Arathi Basin, and then return to Deathmaster Dwire in Hammerfall."
	Inst34Quest2_HORDE_Location = "Deathmaster Dwire (Arathi Highlands - Hammerfall; "..YELLOW.."74,35"..WHITE..")"
	Inst34Quest2_HORDE_Note = "You need to be Friendly with The Defilers to get this quest."
	Inst34Quest2_HORDE_Prequest = "Нет"
	Inst34Quest2_HORDE_Folgequest = "Нет"
	-- No Rewards for this quest
	
	--Quest 3 Horde
	Inst34Quest3_HORDE = "3. Take Five Bases"
	Inst34Quest3_HORDE_Level = "60"
	Inst34Quest3_HORDE_Attain = "60"
	Inst34Quest3_HORDE_Aim = "Hold five bases in Arathi Basin at the same time, then return to Deathmaster Dwire in Hammerfall."
	Inst34Quest3_HORDE_Location = "Deathmaster Dwire (Arathi Highlands - Hammerfall; "..YELLOW.."74,35"..WHITE..")"
	Inst34Quest3_HORDE_Note = "You need to be Exalted with The Defilers to get this quest."
	Inst34Quest3_HORDE_Prequest = "Нет"
	Inst34Quest3_HORDE_Folgequest = "Нет"
	--
	Inst34Quest3name1_HORDE = "Battle Tabard of the Defilers"
	
	
	
	--------------- INST35 - Warsong Gulch (WSG) ---------------
	Inst35Story = "Ущелье Песни Войны располагается в южной области Ясеневого Леса, на границе со Степями – около местности, где Гром Адский Крик и его Орки вырубали огромные просеки в лесах во время событий Третьей войны. Некоторые Орки так и остались в тех местах, продолжая вырубать леса, чтобы снабжать древесиной растущую Орду.\nНочные эльфы, которые начали массированную военную компанию, чтобы вернуть себе Ясеневый Лес, теперь сосредоточили свое внимание на избавлении своих земель от оставшихся орков раз и навсегда. Серебряные Стражи, откликнулись на зов и поклялись, что они не успокоятся, пока все Орки до единого не будут побеждены и выкинуты из Ущелья Песни Войны."
	Inst35Caption = "Ущелье Песни Войны"
	Inst35QAA = "Нет заданий"
	Inst35QAH = "Нет заданий"
end