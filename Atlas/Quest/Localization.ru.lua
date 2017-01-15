if ( GetLocale() == "ruRU" ) then
--[[

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

	-- Version : Russian ( by Maus ) and updated Lichery
	
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

AQHelpText = "наберите /aq или atlasquest "..WHITE.."[команда]"..YELLOW.."\nкоманды: help; option/config; show/hide; left/right; colour; autoshow"..RED.."(только Атлас)"
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
AQOptionsAutoQueryTEXT = "Automatically query the server for items you haven't seen."

-- Suppress Server Query text
AQOptionsNoQuerySpamTEXT = "Suppress Server Query spam."

-- Use Comparison Tooltips
AQOptionsCompareTooltipTEXT = "Compare rewards to currently equipped items."


AQAbilities = BLUE .. "Способности:" .. WHITE;
AQSERVERASKInformation = " Пожалуйста нажимайте ПКМ пока не увидите окно предмета."
AQSERVERASKAuto = " Try moving the cursor over the item in a second." --!!!!!!!
AQSERVERASK = "AtlasQuest запрашивает сервер о: "
AQERRORNOTSHOWN = "Этот предмет небезопасен!"
AQERRORASKSERVER = "ПКМ чтобы запросить сервер об \nэтом предмете. Вы можете быть отсоединены от сервера."
AQOptionB = "Настройки"
AQStoryB = "История"
AQNoReward = ""..BLUE.." Нет наград"
AQDiscription_OR = ""..GREY.." или "..WHITE..""
AQDiscription_AND = ""..GREY.." и "..WHITE..""
AQDiscription_REWARD = ""..BLUE.."Награда: "
AQDiscription_ATTAIN = "Доступно: "
AQDiscription_LEVEL = "Уровень: "
AQDiscription_START = "Начинается у: \n"
AQDiscription_AIM = "Цель: \n"
AQDiscription_NOTE = "Заметка: \n"
AQDiscription_PREQUEST= "Предыдущее задание: "
AQDiscription_FOLGEQUEST = "Следующее задание: "
AQFinishedTEXT = "Задание сделано: ";

--ATLAS_VERSIONWARNINGTEXT = "Вы используете стратую версию Atlas. Пожалуйста, обновите его до версии: 1.8.3."


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
AQITEM_GEM = "Gem" --!!!
AQITEM_QUIVER = "Колчан"
AQITEM_AMMOPOUCH = "Подсумок"
AQITEM_ENCHANT = "Enchant" --!!!



----------------------------------------------
---------------- DUNGEONS --------------------
----------------------------------------------



--------------- INST1 - Deadmines (VC) ---------------

Inst1Story = "Когда-то величайший золотодобывающий центр в землях людей, Мертвые Копи были заброшены когда Орда не оставила камня на камне от Штормграда во время Первой Войны. Сейчас их заняло Братство Справедливости и превратило темные тоннели и в их собственное святилище. Ходят слухи что воры призвали умных гоблинов, чтобы те помогли им построить что-то ужасное в глубине копей - но что это может быть до сих пор не ясно. По слухам путь в Мертвые Копи лежит через тихую, скромную деревушку Луноречье."
Inst1Caption = "Мертвые копи"
Inst1QAA = "5 Заданий" -- how many quests for alliance
Inst1QAH = "Нет заданий" -- for horde

--Quest 1 Alliance
Inst1Quest1 = "1. Красные шелковые банданы"
Inst1Quest1_Level = "17"
Inst1Quest1_Attain = "15"
Inst1Quest1_Aim = "Принесите 10 красных шелковых бандан разведчице Риэле к башне на Сторожевом холме."
Inst1Quest1_Location = "Разведчица Риэла (Западный Край - Сторожевой холм; "..YELLOW.."56, 47"..WHITE..")"
Inst1Quest1_Note = "Вы можете получить красные шелковые банданы с шахтеров в Мертвых копях или в городе где находится подземелье. Задание становится доступным после выполнения цепочки заданий Братства Справедливости до стадии когда вам нужно убить Эдвина Ван Клифа."
Inst1Quest1_Prequest = "Да (смотрите Заметку)"
Inst1Quest1_Folgequest = "Нет"
Inst1Quest1PreQuest = "true"
--
Inst1Quest1name1 = "Solid Shortblade"
Inst1Quest1name2 = "Scrimshaw Dagger"
Inst1Quest1name3 = "Piercing Axe"

--Quest 2 allianz

Inst1Quest2 = "2. Сбор воспоминаний"
Inst1Quest2_Level = "18"
Inst1Quest2_Attain = "14"
Inst1Quest2_Aim = "Добудьте 4 карточки Союза шахтеров и верните их Дикому Чертополоху в Штормград."
Inst1Quest2_Location = "Чертополох Дикий (Штормград - Квартал дворфов; "..YELLOW.."65, 21"..WHITE.." )"
Inst1Quest2_Note = "Карточки падают с нежити снаружи подземелья в зоне около "..YELLOW.."[3]"..WHITE.." на карте входа."
Inst1Quest2_Prequest = "Нет"
Inst1Quest2_Folgequest = "Нет"
--
Inst1Quest2name1 = "Tunneler's Boots"
Inst1Quest2name2 = "Dusty Mining Gloves"
--Quest 3 allianz

Inst1Quest3 = "3. О, брат мой..."
Inst1Quest3_Level = "20"
Inst1Quest3_Attain = "?"
Inst1Quest3_Aim = "Принесите значок Лиги Исследователей, принадлежавший штейгеру Чертополоху в Штормград."
Inst1Quest3_Location = "Чертополох Дикий (Штормград - Квартал дворфов; "..YELLOW.."65,21"..WHITE.." )"
Inst1Quest3_Note = "Штейгер Чертополох находится снаружи подземелья"
Inst1Quest3_Prequest = "Нет"
Inst1Quest3_Folgequest = "Нет"
--
Inst1Quest3name1 = "Miner's Revenge"

--Quest 4 allianz

Inst1Quest4 = "4. Битва под землей"
Inst1Quest4_Level = "20"
Inst1Quest4_Attain = "15"
Inst1Quest4_Aim = "Принесите Шони Молшунье в Штормград зубчатый спрек-механизм гномов из Мертвых копей."
Inst1Quest4_Location = "Шони Молшунье (Штормград - Квартал дворфов; "..YELLOW.."55,12"..WHITE.." )"
Inst1Quest4_Note = "Предшествующее задание можно взять у Гноарна (Стальгорн - Город механиков; "..YELLOW.."69,50"..WHITE..").\nЗубчатый спрек-механизм гномов падает с Sneed's Shredder "..YELLOW.."[3]"..WHITE.."."
Inst1Quest4_Prequest = "Разговор с Шони"
Inst1Quest4_Folgequest = "Нет"
--
Inst1Quest4name1 = "Polar Gauntlets"
Inst1Quest4name2 = "Sable Wand"

--Quest 5 allianz

Inst1Quest5 = "5. Братство Справедливости"
Inst1Quest5_Level = "22"
Inst1Quest5_Attain = "14"
Inst1Quest5_Aim = "Убейте Эдвина Ван Клифа и принесите его голову Гриану Камнегриву."
Inst1Quest5_Location = "Гриан Камнегрив (Западный край - Сторожевой холм; "..YELLOW.."56,47"..WHITE..")"
Inst1Quest5_Note = "Вы начинаете линейку у Гриана Камнегрива (Западный Край - Сторожевой холм; "..YELLOW.."56,47"..WHITE..").\nЭдвин Ван Клиф это последний босс в Мертвых копях. Вы найдете его на верхней палубе корабля "..YELLOW.."[6]"..WHITE.."."
Inst1Quest5_Prequest = "Братство справедливости."
Inst1Quest5_Folgequest = "Неотосланное письмо"
--
Inst1Quest5name1 = "Chausses of Westfall"
Inst1Quest5name2 = "Tunic of Westfall"
Inst1Quest5name3 = "Staff of Westfall"

--Quest 6 allianz

Inst1Quest6 = "6. Испытание доблести (Паладин)"
Inst1Quest6_Level = "22"
Inst1Quest6_Attain = "20"
Inst1Quest6_Aim = "Возьмите список Джордана, добудьте немного древесины белокаменного дуба, партию очищенной руды Бэйлора, кузнечный молот Джордана и самоцвет Кора и отдайте их Джордану Стилвеллу в Стальгорне."
Inst1Quest6_Location = "Джордан Стилвелл (Дун Морог - Вход в Стальгорн; "..YELLOW.."52,36"..WHITE..")"
Inst1Quest6_Note = "Чтобы увидеть заметки щелкните на "..YELLOW.."[Информация: Испытание доблести]"..WHITE.."."
Inst1Quest6_Prequest = "Фолиант Отваги -> Испытание доблести"
Inst1Quest6_Folgequest = "Испытание доблести"
--
Inst1Quest6name1 = "Verigan's Fist"
Inst1Quest6_Page = {2, "Только паладины могут получить это задание!\n1. Вы получите древесину белокаменного дуба у гоблинов-лесорубов в "..YELLOW.."[Мертвые копи]"..WHITE..".\n2. Для получения партии очищенной руды Бэйлора вы должны поговорить с Бэйлором Каменной Дланью (Озеро Модан - Телсамар; 35,44 ). Он даст вам задание 'Партия руды Бэйлора'. Вы найдете руду Джордана за деревом около 71,21\n3. Вы получите кузнечный молот Джордана в "..YELLOW.."[Крепость Темного Клыка]"..WHITE.." около "..YELLOW.."[3]"..WHITE..".\n4. Для получения самоцвета Кора Вам нужно пойти к Тандрису Ветропряду (Темные берега - Аубердин; 37,40) и выполнить задание 'Поиск самоцвета Кора'. Для этого задания, вам нужно убивать Провидзев и Жриц Непроглядной пучины перед "..YELLOW.."[Непроглядная пучина]"..WHITE..". С них падает Оскверненный самоцвет Кора. Тандрис Ветропряд очистит его для вас.", };

--------------WaillingCaverns/HDW ( 7 quests)------------
Inst2Story = "Не так давно друид ночных эльфов по имени Наралекс обнаружил сеть подземных пещер прямо в сердце Степей. Названные 'Пещерами стенаний', эти естественные пещеры были наполнены трещинами, которые производили долгие жалобные стоны когда пар вырывался из них. Наралекс верил, что он сможет использовать подземные источники пещер для восстановления буйства красок и изобилия Степей - но для исполнения этого потребовалоь перекачивание энергий из сказочного Изумрудного Сна. Однако однажды соединившись со Сном, видения друида превратились в кошмар.  Вскоре Пещеры стенаний начали меняться - воды наполнились грязью и некогда послушные существа внутри превратились в порочных, смертоносных хищников. Поговоривают что сам Наралекс все еще находится где-то в сердце лабиринта, попавший в капкан пределов Изумрудного Сна. Даже его бывшие ученики были испорчены ожившим кошмаром учителя - они превратились в злобных Друидов Клыка."
Inst2Caption = "Пещеры стенаний"
Inst2QAA = "5 Заданий"
Inst2QAH = "7 Заданий"

--QUEST 1 Alliance

Inst2Quest1 = "1. Шкуры загадочных существ"
Inst2Quest1_Level = "17"
Inst2Quest1_Attain = "?"
Inst2Quest1_Aim = "Наплак в Пещерах стенаний хочет чтобы вы принесли ему 20 оскверненных шкур."
Inst2Quest1_Location = "Наплак (Степи - Пещеры стенаний; "..YELLOW.."47,36 "..WHITE..")"
Inst2Quest1_Note = "Со всех существ внутри и перед подземельем можно подобрать шкуры.\nНаплака можно найти в тайной пещере над входом в Пещеры стенаний. Простейший путь увидеть его - забраться на гору позади входа и спрыгнуть на небольшой выступ слева над входом в пещеру."
Inst2Quest1_Prequest = "Нет"
Inst2Quest1_Folgequest = "Нет"
--
Inst2Quest1name1 = "Slick Deviate Leggings"
Inst2Quest1name2 = "Deviate Hide Pack"


--QUEST 2 Allianz

Inst2Quest2 = "2. Неприятности в порту"
Inst2Quest2_Level = "18"
Inst2Quest2_Attain = "14"
Inst2Quest2_Aim = "Оператор крана Биггльфузз из Кабестана хочет чтобы вы забрали бутылку портвейна 99-леней выдержки у Безумного Магглиша, который прячется в Пещерах стенаний"
Inst2Quest2_Location = "Оператор крана Биггльфузз (Степи - Кабестан; "..YELLOW.."63,37 "..WHITE..")"
Inst2Quest2_Note = "Получить бутылку можно прямо перед тем как вы войдете в подземелье, убив Безумного Магглиша. Когда вы только вошли в пещеру идите направо и найдете его в конце прохода. Он скрывается у стены."
Inst2Quest2_Prequest = "Нет"
Inst2Quest2_Folgequest = "Нет"

--QUEST 3 Allianz

Inst2Quest3 = "3. Умный напиток"
Inst2Quest3_Level = "18"
Inst2Quest3_Attain = "?"
Inst2Quest3_Aim = "Принеси 6 порций Воющей субстанции Мебоку Миззриксу в Кабестан."
Inst2Quest3_Location = "Мебок Миззрикс (Степи - Кабестан; "..YELLOW.."62,37 "..WHITE..")"
Inst2Quest3_Note = "Предшествующее задание также можно взять у Мебока Миззрикса.\nИз всех врагов-эктоплазмы внутри и перед подземельем можно достать субстанцию."
Inst2Quest3_Prequest = "Рога ящеров"
Inst2Quest3_Folgequest = "Нет"
Inst2Quest3PreQuest = "true"

--QUEST 4 horde

Inst2Quest4 = "4. Искоренение Скверны"
Inst2Quest4_Level = "21"
Inst2Quest4_Attain = "?"
Inst2Quest4_Aim = "Эбру в Пещерах стенаний хочет чтобы вы убили 7 Загадочных опустошителей, 7 Загадочных гадюк, 7 Загадочных шаркунов и 7 Загадочных страхозубов."
Inst2Quest4_Location = "Эбру (Степи; "..YELLOW.."47,36 "..WHITE..")"
Inst2Quest4_Note = "Эбру находится в тайной пещере над входом в Пещеры стенаний. Простейший путь увидеть его - забраться на гору позади входа и спрыгнуть на небольшой выступ слева над входом в пещеру."
Inst2Quest4_Prequest = "Нет"
Inst2Quest4_Folgequest = "Нет"
--
Inst2Quest4name1 = "Pattern: Deviate Scale Belt"
Inst2Quest4name2 = "Sizzle Stick"
Inst2Quest4name3 = "Dagmire Gauntlets"

--QUEST 5 Allianz

Inst2Quest5 = "5. Светящийся осколок"
Inst2Quest5_Level = "25"
Inst2Quest5_Attain = "21"
Inst2Quest5_Aim = "Посетите Кабестан и поспрашивайте о светящемся осколке."
Inst2Quest5_Location = "Светящийся осколок (Падает с Мутануса Пожирателя; (Пещеры стенаний)"
Inst2Quest5_Note = "Мутанус Пожиратель появляется только если вы убили всех 4 повелителей змей и проводили таурена-друда от входа.\nКогда вы возьмете осколок, вам нужно принести его к гоблину-пилоту около банка в Кабестане, а потом на вершину горы над Пещерами стенаний к Фалле Мудрости Ветра."
Inst2Quest5_Prequest = "Нет"
Inst2Quest5_Folgequest = "Кошмары"
--
Inst2Quest5name1 = "Talbar Mantle"
Inst2Quest5name2 = "Quagmire Galoshes"


--QUEST 1 horde

Inst2Quest1_HORDE = Inst2Quest1
Inst2Quest1_HORDE_Level = Inst2Quest1_Level
Inst2Quest1_HORDE_Attain = Inst2Quest1_Attain
Inst2Quest1_HORDE_Aim = Inst2Quest1_Aim
Inst2Quest1_HORDE_Location = Inst2Quest1_Location
Inst2Quest1_HORDE_Note = Inst2Quest1_Note
Inst2Quest1_HORDE_Prequest = Inst2Quest1_Prequest
Inst2Quest1_HORDE_Folgequest = Inst2Quest1_Folgequest
--
Inst2Quest1name1_HORDE = "Slick Deviate Leggings"
Inst2Quest1name2_HORDE = "Deviate Hide Pack"

--QUEST 2 horde

Inst2Quest2_HORDE = Inst2Quest2
Inst2Quest2_HORDE_Level = Inst2Quest2_Level
Inst2Quest2_HORDE_Attain = Inst2Quest2_Attain
Inst2Quest2_HORDE_Aim = Inst2Quest2_Aim
Inst2Quest2_HORDE_Location = Inst2Quest2_Location
Inst2Quest2_HORDE_Note = Inst2Quest2_Note
Inst2Quest2_HORDE_Prequest = Inst2Quest2_Prequest
Inst2Quest2_HORDE_Folgequest = Inst2Quest2_Folgequest

--QUEST 3 horde

Inst2Quest3_HORDE = "3. Змеецвет"
Inst2Quest3_HORDE_Level = "18"
Inst2Quest3_HORDE_Attain = "14"
Inst2Quest3_HORDE_Aim = "Аптекарша Зама в Громовом Утесе хочет чтобы вы собрали 10 Змеецветов."
Inst2Quest3_HORDE_Location = "Аптекарша Зама (Громовой Утес - Вершина Духов; "..YELLOW.."22,20 "..WHITE..")"
Inst2Quest3_HORDE_Note = "Аптекарша Зама находится в пещере под Вершиной Духов.\nСобрать Змеецвет можно внутри пещеры перед подземельем и внутри него. Игроки с навыком травничества могут видеть Змеецвет на миникарте."
Inst2Quest3_HORDE_Prequest = "Нет"
Inst2Quest3_HORDE_Folgequest = "Нет"
Inst2Quest3PreQuest_HORDE = "true"
--
Inst2Quest3name1_HORDE = "Apothecary Gloves"

--QUEST 4 horde

Inst2Quest4_HORDE = "4. Умный напиток"
Inst2Quest4_HORDE_Level = Inst2Quest3_Level
Inst2Quest4_HORDE_Attain = Inst2Quest3_Attain
Inst2Quest4_HORDE_Aim = Inst2Quest3_Aim
Inst2Quest4_HORDE_Location = Inst2Quest3_Location
Inst2Quest4_HORDE_Note = Inst2Quest3_Note
Inst2Quest4_HORDE_Prequest = Inst2Quest3_Prequest
Inst2Quest4_HORDE_Folgequest = Inst2Quest3_Folgequest
Inst2Quest4PreQuest_HORDE = Inst2Quest3PreQuest

--QUEST 5 horde

Inst2Quest5_HORDE = "5. Искоренение Скверны"
Inst2Quest5_HORDE_Level = Inst2Quest4_Level
Inst2Quest5_HORDE_Attain = Inst2Quest4_Attain
Inst2Quest5_HORDE_Aim = Inst2Quest4_Aim
Inst2Quest5_HORDE_Location = Inst2Quest4_Location
Inst2Quest5_HORDE_Note = Inst2Quest4_Note
Inst2Quest5_HORDE_Prequest = Inst2Quest4_Prequest
Inst2Quest5_HORDE_Folgequest = Inst2Quest4_Folgequest
--
Inst2Quest5name1_HORDE = "Pattern: Deviate Scale Belt"
Inst2Quest5name2_HORDE = "Sizzle Stick"
Inst2Quest5name3_HORDE = "Dagmire Gauntlets"

--QUEST 6 horde

Inst2Quest6_HORDE = "6. Повелители змей"
Inst2Quest6_HORDE_Level = "22"
Inst2Quest6_HORDE_Attain = "18"
Inst2Quest6_HORDE_Aim = "Принеси Камни Кобрана, Анакондры, Питонаса и Серпентиса Наре Вилдмэйн в Громовой Утес."
Inst2Quest6_HORDE_Location = "Нара Буйногривая (Громовой Утес - Вершина старейшин; "..YELLOW.."75,31"..WHITE..")"
Inst2Quest6_HORDE_Note = "Серия заданий начинается у Хамуула Рунного Тотема. (Громовой Утес - Вершина старейшин; "..YELLOW.."78,28"..WHITE..")\nКамни падают с 4 друидов "..YELLOW.."[2]"..WHITE..", "..YELLOW.."[3]"..WHITE..", "..YELLOW.."[5]"..WHITE..", "..YELLOW.."[7]"..WHITE.."."
Inst2Quest6_HORDE_Prequest = "Оазисы Степей -> Нара Буйногривая"
Inst2Quest6_HORDE_Folgequest = "Нет"
Inst2Quest6PreQuest_HORDE = "true"
--
Inst2Quest6name1_HORDE = "Crescent Staff"
Inst2Quest6name2_HORDE = "Wingblade"

--QUEST 7 horde

Inst2Quest7_HORDE = "7. Светяшийся осколок"
Inst2Quest7_HORDE_Level = Inst2Quest5_Level
Inst2Quest7_HORDE_Attain = Inst2Quest5_Attain
Inst2Quest7_HORDE_Aim = Inst2Quest5_Aim
Inst2Quest7_HORDE_Location = Inst2Quest5_Location
Inst2Quest7_HORDE_Note = Inst2Quest5_Note
Inst2Quest7_HORDE_Prequest = Inst2Quest5_Prequest
Inst2Quest7_HORDE_Folgequest = Inst2Quest5_Folgequest
--
Inst2Quest7name1_HORDE = "Talbar Mantle"
Inst2Quest7name2_HORDE = "Quagmire Galoshes"


--------------Uldaman/Inst4 ( 16 quests)------------
Inst4Story = "Ульдаман - это древний чертог Титанов, построеный глубоко в толще земли с самого сотворения мира. В недалеком прошлом археологи дворфов проникли в этот забытый город, выпустив первых нейдачных творений Титанов: троггов. Легенды гласят, что титаны создали троггов из камня. Когда они посчитали эксперимент провалившимся, Титаны изолировали троггов и попробовали снова - результатом стало создание расы дворфов. Тайны создания дворфов записаны на мифических Дисках Норганнона - массивных артефактах Титанов, находящихся в глубине древнего города. Недавно, дворфы Темного Железа начали серию набегов в Ульдаман, в надежде захватить диски для их несдержанного мастера, Рагнароса. Однако, подземный город защищало несколько стражей - гигантские големы из живого камня, что сокрушат любого несчастливого нарушителя, которого найдут. Сами Диски охраняйтся массивным, разумным Каменным хранителем по имени Архедас. Некоторые слухи даже предполагают, что каменнокожие предки дворфов, Подземники, все еще обитают в глубоко скрытых переходах города."
Inst4Caption = "Ульдаман"
Inst4QAA = "16 Заданий"
Inst4QAH = "10 Заданий"

--QUEST 1 Allianz

Inst4Quest1 = "1. Предвестник надежды"
Inst4Quest1_Level = "35"
Inst4Quest1_Attain = "35"
Inst4Quest1_Aim = "Найдите Греза Тяжелоступа в Ульдамане."
Inst4Quest1_Location = "Геолог Ржанец (Бесплодные земли; "..YELLOW.."53,43"..WHITE..")"
Inst4Quest1_Note = "Предшествующее задание начинается с Мятой карты (Бесплодные земли; "..YELLOW.."53,33"..WHITE..").\nВы найдете Тяжелоступа Греза перед тем как вы войдете в подземелье."
Inst4Quest1_Prequest = "Предвестник надежды"
Inst4Quest1_Folgequest = "Амулет Тайн"
Inst4Quest1PreQuest = "true"

--QUEST 2 Allianz

Inst4Quest2 = "2. Амулет Тайн"
Inst4Quest2_Level = "40"
Inst4Quest2_Attain = "?"
Inst4Quest2_Aim = "Найдите амулет Тяжелоступа и верните его ему в Ульдаман."
Inst4Quest2_Location = "Тяжелоступ Грез (Ульдаман)."
Inst4Quest2_Note = "Амулет падает из Магрегана Чернотени."
Inst4Quest2_Prequest = "Предвестник надежды"
Inst4Quest2_Folgequest = "Клятва верности"
Inst4Quest2FQuest = "true"


--QUEST 3 Allianz

Inst4Quest3 = "3. Утерянные таблички Воли"
Inst4Quest3_Level = "45"
Inst4Quest3_Attain = "38"
Inst4Quest3_Aim = "Найдите табличку Воли и принесите ее советнику Белграму в Стальгорн."
Inst4Quest3_Location = "Советник Белгрум (Стальгорн - Зал исследователей; "..YELLOW.."77,10"..WHITE..")"
Inst4Quest3_Note = "Табличка находится около "..YELLOW.."[8]"..WHITE.."."
Inst4Quest3_Prequest = "Амулет Тайн -> Посланник Зла"
Inst4Quest3_Folgequest = "Нет"
Inst4Quest3FQuest = "true"
--
Inst4Quest3name1 = "Medal of Courage"

--QUEST 4 Allianz

Inst4Quest4 = "4. Камни Силы"
Inst4Quest4_Level = "36"
Inst4Quest4_Attain = "?"
Inst4Quest4_Aim = "Принесите 8 дентриевых камней Силы и 8 энелиевых камней Силы Ригглфаззу в Бесплодные земли."
Inst4Quest4_Location = "Ригглфазз (Бесплодные земли; "..YELLOW.."42,52"..WHITE..")"
Inst4Quest4_Note = "Камни можно найти на любом враге из клана Тенегорна перед и внутри подземелья."
Inst4Quest4_Prequest = "Нет"
Inst4Quest4_Folgequest = "Нет"
--
Inst4Quest4name1 = "Energized Stone Circle"
Inst4Quest4name2 = "Duracin Bracers"
Inst4Quest4name3 = "Everlast Boots"

--QUEST 5 Allianz

Inst4Quest5 = "5. Судьба Эгмонда"
Inst4Quest5_Level = "38"
Inst4Quest5_Attain = "38"
Inst4Quest5_Aim = "Принесите 4 резные каменные урны геологу Сталекруту в Лок Модан."
Inst4Quest5_Location = "Геолог Сталекрут (Лок Модан - Раскопки Сталекрута; "..YELLOW.."65,65"..WHITE..")"
Inst4Quest5_Note = "Предшествующее задание начинается у геолога Грозовой Вершины (Стальгорн - Зал исследователей; "..YELLOW.."74,12"..WHITE..").\nУрны расбросаны по пещерам перед подземельем."
Inst4Quest5_Prequest = "Вы нужны Сталекруту! -> Мурдалок"
Inst4Quest5_Folgequest = "Нет"
Inst4Quest5PreQuest = "true"
--
Inst4Quest5name1 = "Prospector Gloves"

--QUEST 6 Allianz

Inst4Quest6 = "6. Лекарство от судьбы"
Inst4Quest6_Level = "40"
Inst4Quest6_Attain = "31"
Inst4Quest6_Aim = "Принесите табличку Рьюн'эха Тельдарину Заблудшему."
Inst4Quest6_Location = "Тельдарин Заблудший (Бесплодные земли; "..YELLOW.."51,76"..WHITE..")"
Inst4Quest6_Note = "Табличка находится на севере пещер, в восточном конце туннеля, перед подземельем."
Inst4Quest6_Prequest = "Нет"
Inst4Quest6_Folgequest = "В Стальгорн за книгой Йагина"
--
Inst4Quest6name1 = "Doomsayer's Robe"

--QUEST 7 Allianz

Inst4Quest7 = "7. Потерянные дворфы"
Inst4Quest7_Level = "40"
Inst4Quest7_Attain = "?"
Inst4Quest7_Aim = "Найдите Бейлога в Ульдамане."
Inst4Quest7_Location = "Геолог Грозовая Вершина (Стальгорн - Зал исследователей; "..YELLOW.."75,12"..WHITE..")"
Inst4Quest7_Note = "Бейлог находится около "..YELLOW.."[1]"..WHITE.."."
Inst4Quest7_Prequest = "Нет"
Inst4Quest7_Folgequest = "Секретная комната"

--QUEST 8 Allianz

Inst4Quest8 = "8. Тайная Комната"
Inst4Quest8_Level = "40"
Inst4Quest8_Attain = "?"
Inst4Quest8_Aim = "Прочитайте журнал Бейлога, исследуйте, потайной чертог и потом доложите об увиденном геологу Грозовой Вершине."
Inst4Quest8_Location = "Бейлог (Ульдаман; "..YELLOW.."[1]"..WHITE..")"
Inst4Quest8_Note = "Тайная комната находится около "..YELLOW.."[4]"..WHITE..". Чтобы открыть тайную комнату вам понадобится Стержень Тсола с Ревелоша "..YELLOW.."[3]"..WHITE.." и Медальон Гни'кив из сундука Баэлога "..YELLOW.."[1]"..WHITE..". Соберите из этих предметов Доисторический посох. Посох используется в Комнате Карты между "..YELLOW.."[3] и [4]"..WHITE.." для вызова Иронаи. После того как убьете её, забегите в комнату откуда она пришла, чтобы выполнить задание."
Inst4Quest8_Prequest = "Потерянные дворфы"
Inst4Quest8_Folgequest = "Нет"
Inst4Quest8FQuest = "true"
--
Inst4Quest8name1 = "Dwarven Charge"
Inst4Quest8name2 = "Explorer's League Lodestar"

--QUEST 9 Allianz

Inst4Quest9 = "9. Порванное ожерелье"
Inst4Quest9_Level = "41"
Inst4Quest9_Attain = "37"
Inst4Quest9_Aim = "Найдите создателя ожерелья, чтобы узнать, чего оно стоит."
Inst4Quest9_Location = "Сломанное ожерелье (Падает случайно в Ульдамане)"
Inst4Quest9_Note = "Принесите ожерелье Талвашу де Кисселю (Стальгорн - The Палаты Магии; "..YELLOW.."36,3"..WHITE..")."
Inst4Quest9_Prequest = "Нет"
Inst4Quest9_Folgequest = "Мудрость за деньги"

--QUEST 10 Allianz

Inst4Quest10 = "10. Назад в Ульдаман"
Inst4Quest10_Level = "41"
Inst4Quest10_Attain = "37"
Inst4Quest10_Aim = "Выясните, где именно в Ульдамане находится ожерелье Талваша. Убитый паладин, о котором он упоминал, был последним владельцем этого ожерелья."
Inst4Quest10_Location = "Талваш де Киссель (Стальгорн - Палаты магии; "..YELLOW.."36,3"..WHITE..")"
Inst4Quest10_Note = "Паладин находится около "..YELLOW.."[2]"..WHITE.."."
Inst4Quest10_Prequest = "Мудрость за деньги"
Inst4Quest10_Folgequest = "Время собирать камни"

--QUEST 11 Allianz

Inst4Quest11 = "11. Время собирать камни"
Inst4Quest11_Level = "43"
Inst4Quest11_Attain = "37"
Inst4Quest11_Aim = "Найдите рубин, сапфир, и топаз, которые спрятаны в разных местах Ульдамана. Когда найдете, свяжитесь с Талвашем де Кисселем, используя фиал Видения, который он предварительно дал тебе."
Inst4Quest11_Location = "Останки паладина (Ульдаман; "..YELLOW.."[2]"..WHITE..")"
Inst4Quest11_Note = "Камни находятся около "..YELLOW.."[1]"..WHITE.." в урне, "..YELLOW.."[8]"..WHITE.." из тайника клана Теневого горна, и "..YELLOW.."[9]"..WHITE.." с Гримлока. Обратите внимание, что когда вы откроете тайник, появятся несколько мобов и атакуют вас.\nИспользуйте Чашу прорицания Талваша, чтобы сдать задание и продожить дальше."
Inst4Quest11_Prequest = "Назад в Ульдаман"
Inst4Quest11_Folgequest = "Восстановление ожерелья"
Inst4Quest11FQuest = "true"

--QUEST 12 Allianz

Inst4Quest12 = "12. Восстановить ожерелье"
Inst4Quest12_Level = "44"
Inst4Quest12_Attain = "38"
Inst4Quest12_Aim = "Добудьте источник энергии из самого мощного волшебного создания, которое найдете в Ульдамане и доставьте его Талвашу де Кисселю в Стальгорн."
Inst4Quest12_Location = "Гадальная чаша Талваша"
Inst4Quest12_Note = "Источник силы сломанного ожерелья падает с Архедаса "..YELLOW.."[10]"..WHITE.."."
Inst4Quest12_Prequest = "Найти камни."
Inst4Quest12_Folgequest = "Нет"-- AUFPASSEN HIER IS EIN FOLGEQUEST ABER ES GIBT NUR BELOHNUNG!
--
Inst4Quest12name1 = "Talvash's Enhancing Necklace"
Inst4Quest12FQuest = "true"

--QUEST 13 Allianz

Inst4Quest13 = "13. В Ульдаман за реагентами"
Inst4Quest13_Level = "42"
Inst4Quest13_Attain = "38"
Inst4Quest13_Aim = "Принесите 12 грибов-малиновиков Гхаку Целителю в Телcамар."
Inst4Quest13_Location = "Гхак Целитель (Лок Модан - Телсамар; "..YELLOW.."37,49"..WHITE..")"
Inst4Quest13_Note = "Грибы есть по всему подземелью. Травники могут видеть их на миникарте, если включен Поиск трав и они взяли задание."
Inst4Quest13_Prequest = "За реактивами в Бесплодные земли"
Inst4Quest13_Folgequest = "За реактивами в Бесплодные земли II"
--
Inst4Quest13name1 = "Restorative Potion"

--QUEST 14 Allianz

Inst4Quest14 = "14. Возвращенное сокровище"
Inst4Quest14_Level = "43"
Inst4Quest14_Attain = "?"
Inst4Quest14_Aim = "Достаньте сокровище Крома Крепкорука из сундука в северном зале Ульдамана и принесите ему в Стальгорн"
Inst4Quest14_Location = "Кром Крепкорук (Стальгорн - Зал исследователей; "..YELLOW.."74,9"..WHITE..")"
Inst4Quest14_Note = "Вы найдете сокровище перед тем как войдете в подземелье. Оно на севере пещер, в юговосточном конце тоннеля."
Inst4Quest14_Prequest = "Нет"
Inst4Quest14_Folgequest = "Нет"

--QUEST 15 Allianz

Inst4Quest15 = "15. Платиновые Диски"
Inst4Quest15_Level = "45"
Inst4Quest15_Attain = "40"
Inst4Quest15_Aim = "Поговорите с каменным стражем и узнайте в чем заключается древнее знание. Как только вы узнаете все, что нужно, активируйте Диски Нограннона. -> Отнесите миниатюрную копию дисков Норганнона в Лигу Исследователей в Стальгорне."
Inst4Quest15_Location = "Диски Нограннона (Ульдаман; "..YELLOW.."[11]"..WHITE..")"
Inst4Quest15_Note = "После получения задания, поговорите с каменным стражем слева от дисков.  Потом снова используйте платиновые диски, чтобы получить миниатюрную копию, которую вы должны принести старшему исследователю Магелласу в Стальгорн - Зал исследователей ("..YELLOW.."69,18"..WHITE.."). Здесь есть другая линейка, которая называется Посмотрим что произойдет и начинается у историка Карника Стальгорн - Зал исследователей."
Inst4Quest15_Prequest = "Нет"
Inst4Quest15_Folgequest = "Нет"
--
Inst4Quest15name1 = "Taupelzsack"
Inst4Quest15name2 = "Superior Healing Potion"
Inst4Quest15name3 = "Greater Mana Potion"

--QUEST 16 Allianz

Inst4Quest16 = "16. Сила Ульдамана (Маг)"
Inst4Quest16_Level = "40"
Inst4Quest16_Attain = "35"
Inst4Quest16_Aim = "Заберите Обсидиановый источник силы и принесите его Табете в Пылевые топи."
Inst4Quest16_Location = "Табета (Пылевые топи; "..YELLOW.."46,57"..WHITE..")"
Inst4Quest16_Note = "Это задание доступно только для магов!\nОбсидиановый источник силы падает из Обсидианового стража около "..YELLOW.."[5]"..WHITE.."."
Inst4Quest16_Prequest = "Поединок с демоном"
Inst4Quest16_Folgequest = "Волнолов маны"
Inst4Quest16PreQuest = "true"

--QUEST 1 Horde

Inst4Quest1_HORDE = "1. Камни Силы"
Inst4Quest1_HORDE_Level = Inst4Quest4_Level
Inst4Quest1_HORDE_Attain = Inst4Quest4_Attain
Inst4Quest1_HORDE_Aim = Inst4Quest4_Aim
Inst4Quest1_HORDE_Location = Inst4Quest4_Location
Inst4Quest1_HORDE_Note = Inst4Quest4_Note
Inst4Quest1_HORDE_Prequest = Inst4Quest4_Prequest
Inst4Quest1_HORDE_Folgequest = Inst4Quest4_Folgequest
--
Inst4Quest1name1_HORDE = "Energized Stone Circle"
Inst4Quest1name2_HORDE = "Duracin Bracers"
Inst4Quest1name3_HORDE = "Everlast Boots"

--QUEST 2 Horde

Inst4Quest2_HORDE = "2. Лекарство от судьбы"
Inst4Quest2_HORDE_Level = Inst4Quest6_Level
Inst4Quest2_HORDE_Attain = Inst4Quest6_Attain
Inst4Quest2_HORDE_Aim = Inst4Quest6_Aim
Inst4Quest2_HORDE_Location = Inst4Quest6_Location
Inst4Quest2_HORDE_Note = Inst4Quest6_Note
Inst4Quest2_HORDE_Prequest = Inst4Quest6_Prequest
Inst4Quest2_HORDE_Folgequest = "В Подгород за книгой Йагина"
--
Inst4Quest2name1_HORDE = "Doomsayer's Robe"

--QUEST 3 Horde

Inst4Quest3_HORDE = "3. Пропавшее ожерелье"
Inst4Quest3_HORDE_Level = "41"
Inst4Quest3_HORDE_Attain = "37"
Inst4Quest3_HORDE_Aim = "Найдите на раскопках Ульдамана драгоценное ожерелье(возможно поврежденное) и принесите его Драну Дрофферсу в Оргриммар."
Inst4Quest3_HORDE_Location = "Дран Дрофферс (Оргриммар - Волок; "..YELLOW.."59,36"..WHITE..")"
Inst4Quest3_HORDE_Note = "Ожерелье падает в подземелье случайно."
Inst4Quest3_HORDE_Prequest = "Нет"
Inst4Quest3_HORDE_Folgequest = "Пропавшее ожерелье, этап 2"

--QUEST 4 Horde

Inst4Quest4_HORDE = "4. Пропавшее ожерелье, этап 2"
Inst4Quest4_HORDE_Level = "41"
Inst4Quest4_HORDE_Attain = "37"
Inst4Quest4_HORDE_Aim = "Разыщите ключ к местонахождению самоцветов в глубинах Ульдамана."
Inst4Quest4_HORDE_Location = "Дран Дрофферс (Оргриммар - Волок; "..YELLOW.."59,36"..WHITE..")"
Inst4Quest4_HORDE_Note = "Паладин находится около "..YELLOW.."[2]"..WHITE.."."
Inst4Quest4_HORDE_Prequest = "Пропавшее ожерелье"
Inst4Quest4_HORDE_Folgequest = "Трудности перевода"
Inst4Quest4FQuest_HORDE = "true"

--QUEST 5 Horde

Inst4Quest5_HORDE = "5. Трудности перевода"
Inst4Quest5_HORDE_Level = "42"
Inst4Quest5_HORDE_Attain = "40"
Inst4Quest5_HORDE_Aim = "Найди кого-нибудь кто сможет перевести журнал паладина. Ближайшее место это Каргат, в Бесплодных землях."
Inst4Quest5_HORDE_Location = "Останки паладина (Ульдаман; "..YELLOW.."[2]"..WHITE..")"
Inst4Quest5_HORDE_Note = "Переводчик Джаркал Замшелый Клык находится в Каргате (Бесплодные земли; "..YELLOW.."2,46"..WHITE..")."
Inst4Quest5_HORDE_Prequest = "Восстановление ожерелья, этап 2"
Inst4Quest5_HORDE_Folgequest = "Найти самоцветы и источник энергии"
Inst4Quest5FQuest_HORDE = "true"

--QUEST 6 Horde

Inst4Quest6_HORDE = "6. Найти самоцветы и источник энергии"
Inst4Quest6_HORDE_Level = "44"
Inst4Quest6_HORDE_Attain = "37"
Inst4Quest6_HORDE_Aim = "Добудьте все 3 самоцвета и источник энергии для ожерелья из Ульдамана и принесите Джаркалу Замшелому Клыку в Каргат. Джаркал считеает, что источник энергии можно найти у самой сильной твари в Ульдамане."
Inst4Quest6_HORDE_Location = "Джаркал Замшелый Клык (Бесплодные земли - Каргат; "..YELLOW.."2,46"..WHITE..")"
Inst4Quest6_HORDE_Note = "Самоцветы находятся около "..YELLOW.."[1]"..WHITE.." в урне, "..YELLOW.."[8]"..WHITE.." из тайника клана Тенегорна, и "..YELLOW.."[9]"..WHITE.." с Гримлока. Обратите внимание, что когда вы откроете тайник, появятся несколько мобов и атакуют вас. Источник энергии сломанного ожерелья падает с Архедаса "..YELLOW.."[10]"..WHITE.."."
Inst4Quest6_HORDE_Prequest = "Трудности перевода"
Inst4Quest6_HORDE_Folgequest = "Доставка камней"
Inst4Quest6FQuest_HORDE = "true"
--
Inst4Quest6name1_HORDE = "Jarkal's Enhancing Necklace"

--QUEST 7 Horde

Inst4Quest7_HORDE = "7. В Ульдаман за реактивом"
Inst4Quest7_HORDE_Level = "42"
Inst4Quest7_HORDE_Attain = "38"
Inst4Quest7_HORDE_Aim = "Принесите 12 грибов-малиновиков Джаркалу Замшелому Клыку в Каргат."
Inst4Quest7_HORDE_Location = "Джаркал Замшелый Клык (Бесплодные земли - Каргат; "..YELLOW.."2,69"..WHITE..")"
Inst4Quest7_HORDE_Note = "Предшествующее задание вы также возьмете в Каргате.\nШляпки есть по всему подземелью. Травники могут видеть их на миникарте, если включен Поиск трав и они взяли задание. Предыдущее задание дает этот же NPC."
Inst4Quest7_HORDE_Prequest = "В Бесплодные земли за реактивом"
Inst4Quest7_HORDE_Folgequest = "В Бесплодные земли за реактивом 2"
Inst4Quest7PreQuest_HORDE = "true"
--
Inst4Quest7name1_HORDE = "Restorative Potion"

--QUEST 8 Horde

Inst4Quest8_HORDE = "8. Возвращенные сокровища"
Inst4Quest8_HORDE_Level = "43"
Inst4Quest8_HORDE_Attain = "?"
Inst4Quest8_HORDE_Aim = "Принесите Патрику Гаррету в Подгород фамильное сокровище из сундука в Южном зале Ульдамана."
Inst4Quest8_HORDE_Location = "Патрик Гаррет (Подгород; "..YELLOW.."72,48"..WHITE..")"
Inst4Quest8_HORDE_Note = "Вы найдете сокровище перед тем как войдете в подземелье. Оно на севере пещер, в юговосточном конце тоннеля."
Inst4Quest8_HORDE_Prequest = "Нет"
Inst4Quest8_HORDE_Folgequest = "Нет"


--QUEST 9 Horde

Inst4Quest9_HORDE = "9. Платиновые диски"
Inst4Quest9_HORDE_Level = "45"
Inst4Quest9_HORDE_Attain = "40"
Inst4Quest9_HORDE_Aim = "Поговорите с каменным стражем и узнайте в чем заключается древнее знание. Как только вы узнаете все, что нужно, активируйте Диски Нограннона. -> Отнесите миниатюрную копию дисков Норганнона кому-то из мудрецов с Громового Утеса."
Inst4Quest9_HORDE_Location = "Диски Нограннона (Ульдаман; "..YELLOW.."[11]"..WHITE..")"
Inst4Quest9_HORDE_Note = "После получения задания, поговорите с каменным стражем слева от дисков.  Потом снова используйте платиновые диски, чтобы получить миниатюрную копию, которую вы должны принести ведуну Искателю Истины в Громовой Утес ("..YELLOW.."34,46"..WHITE..")"
Inst4Quest9_HORDE_Prequest = "Нет"
Inst4Quest9_HORDE_Folgequest = "Платиновые диски"
--
Inst4Quest9name1_HORDE = "Taupelzsack"
Inst4Quest9name2_HORDE = "Superior Healing Potion"
Inst4Quest9name3_HORDE = "Greater Mana Potion"

--QUEST 10 Horde

Inst4Quest10_HORDE = "10. Сила Ульдамана (Маг)"
Inst4Quest10_HORDE_Level = Inst4Quest16_Level
Inst4Quest10_HORDE_Attain = Inst4Quest16_Attain
Inst4Quest10_HORDE_Aim = Inst4Quest16_Aim
Inst4Quest10_HORDE_Location = Inst4Quest16_Location
Inst4Quest10_HORDE_Note = Inst4Quest16_Note
Inst4Quest10_HORDE_Prequest = Inst4Quest16_Prequest
Inst4Quest10_HORDE_Folgequest = Inst4Quest16_Folgequest
Inst4Quest10PreQuest_HORDE = Inst4Quest16PreQuest


--------------------------Ragfire ( 5 Quests)
Inst3Story = "Огненная пропасть представляет из себя сеть вулканических пещер которые пролегают под новой столицей орков - Оргриммаром. Недавно, прошел слух, что приверженцы демонического культа Совета Теней устроили логово в пламенных глубинах Пропасти. Этот культ, именуемый Пылающий Клинок, угрожает самой независимости Дуротара. Многие верят что Военный Вождь орков, Тралл, знает о существовании Клинка и не стал уничтожать его в надежде на то, что его члены приведут его прямо к Совету Теней. Так или иначе, всплески тёмных сил из Огненной пропасти могут унижтожить все, чего орки пытались достичь."
Inst3Caption = "Огненная пропасть"
Inst3QAA = "Нет заданий"
Inst3QAH = "5 Заданий"

--QUEST 1 Horde

Inst3Quest1_HORDE = "1. Испытание силы врага"
Inst3Quest1_HORDE_Level = "15"
Inst3Quest1_HORDE_Attain = "?"
Inst3Quest1_HORDE_Aim = "Найдите в Оргриммаре Огненную пропасть, затем убейте 8 Троггов Огненной пропасти и 8 Шаманов Огненной пропасти перед тем как вернуться к Рахауро в Громовой Утес."
Inst3Quest1_HORDE_Location = "Рахауро (Громовой Утес - Вершина Старейшин; "..YELLOW.."70,29"..WHITE..")"
Inst3Quest1_HORDE_Note = "Вы найдете троггов в самом начале подземелья."
Inst3Quest1_HORDE_Prequest = "Нет"
Inst3Quest1_HORDE_Folgequest = "Нет"

--QUEST 2 Horde

Inst3Quest2_HORDE = "2. Силы разрушения..."
Inst3Quest2_HORDE_Level = "16"
Inst3Quest2_HORDE_Attain = "?"
Inst3Quest2_HORDE_Aim = "Принесите книги Заклинания Тени и Заклятия Пустоты к Вариматрасу в Подгород."
Inst3Quest2_HORDE_Location = "Вариматас (Подгород - Королевский квартал; "..YELLOW.."56,92"..WHITE..")"
Inst3Quest2_HORDE_Note = "Книги падают с Сектантов и Чернокнижников из клана Пылающего клинка"
Inst3Quest2_HORDE_Prequest = "Нет"
Inst3Quest2_HORDE_Folgequest = "Нет"
--
Inst3Quest2name1_HORDE = "Ghastly Trousers"
Inst3Quest2name2_HORDE = "Dredgemire Leggings"
Inst3Quest2name3_HORDE = "Gargoyle Leggings"

--QUEST 3 Horde

Inst3Quest3_HORDE = "3. В поисках потерянного ранца"
Inst3Quest3_HORDE_Level = "16"
Inst3Quest3_HORDE_Attain = "?"
Inst3Quest3_HORDE_Aim = "Обыщите Огненную пропасть в поисках тела Маура Зловещего Тотема и интересных вещей."
Inst3Quest3_HORDE_Location = "Рахауро (Громовой Утес - Вершина Старейшин; "..YELLOW.."70,29"..WHITE..")"
Inst3Quest3_HORDE_Note = "Вы найдете Маура Зловещего Тотема около "..YELLOW.."[1]"..WHITE..". После того как найдете рюкзак, вы должны вернуть его Рахауро в Громовой Утес"
Inst3Quest3_HORDE_Prequest = "Нет"
Inst3Quest3_HORDE_Folgequest = "Возвращение Потеряного ранца"
--
Inst3Quest3name1_HORDE = "Featherbead Bracers"
Inst3Quest3name2_HORDE = "Savannah Bracers"

--QUEST 4 Horde

Inst3Quest4_HORDE = "4. Тайные враги"
Inst3Quest4_HORDE_Level = "16"
Inst3Quest4_HORDE_Attain = "?"
Inst3Quest4_HORDE_Aim = "Убейте Баззалана и Джергоша Извергателя перед тем как вернуться к Траллу в Оргриммар."
Inst3Quest4_HORDE_Location = "Тралл (Оргриммар - Аллея Мудрости; "..YELLOW.."31,37"..WHITE..")"
Inst3Quest4_HORDE_Note = "Вы найдете Баззалана около  "..YELLOW.."[4]"..WHITE.." и Джергоша около "..YELLOW.."[3]"..WHITE..". Линейка заданий начинается у Военного вождя Тралла в Оргриммаре."
Inst3Quest4_HORDE_Prequest = "Тайные враги"
Inst3Quest4_HORDE_Folgequest = "Тайные враги"
Inst3Quest4PreQuest_HORDE = "true"
--
Inst3Quest4name1_HORDE = "Kris of Orgrimmar"
Inst3Quest4name2_HORDE = "Hammer of Orgrimmar"
Inst3Quest4name3_HORDE = "Axe of Orgrimmar"
Inst3Quest4name4_HORDE = "Staff of Orgrimmar"

--QUEST 5 Horde

Inst3Quest5_HORDE = "5. Убить тварь"
Inst3Quest5_HORDE_Level = "16"
Inst3Quest5_HORDE_Attain = "?"
Inst3Quest5_HORDE_Aim = "Войдите в Огненную пропасть и убейте Тарагамана Ненасытного, а потом принесите его сердце Ниру Огненному Клинку в Оргриммар."
Inst3Quest5_HORDE_Location = "Ниру Огненный Клинок (Оргриммар - Расселина Теней; "..YELLOW.."49,50"..WHITE..")"
Inst3Quest5_HORDE_Note = "Вы найдете Тарагамана около "..YELLOW.."[2]"..WHITE.."."
Inst3Quest5_HORDE_Prequest = "Нет"
Inst3Quest5_HORDE_Folgequest = "Нет"

--------------------------Inst27 Zul'Farrak / ZUL
Inst27Story = "Этот выжженый солнцем город служит домом троллям из клана Песчаной Ярости, известных своей редкостной безжалостностью и темным мистицизмом. Легенды троллей рассказывают о мощном мече называемом Кара Суль-траза, оружие, способное вселять страх и слабость жаже самым грозным врагам. Давным-давно, оружие было разбито на две части. Однако, ходят слухи, что в где-то стенах Зул'Фаррака можно найти обе половинки. Докладывают также, что банда наемников, бежавших из Прибамбасска забрела в город и попала в ловушку. Их судьба неизвестна. Но возможно самым волнующим из всего - этотихие перешептывания о древнем чудовище, спящим в священном бассейне в самом сердце города. Могучем полубоге, который нанесет неисчислимый ущерб любому авантюристу, имевшему глупость пробудить его."
Inst27Caption = "Зул'Фаррак"
Inst27QAA = "7 Заданий"
Inst27QAH = "7 Заданий"



--QUEST 1 Allianz

Inst27Quest1 = "1. Троллье месиво"
Inst27Quest1_Level = "45"
Inst27Quest1_Attain = "?"
Inst27Quest1_Aim = "Принесите 20 фиалов с Тролльим месивом."
Inst27Quest1_Location = "Трентон Молот Света (Танарис - Прибамбасск; "..YELLOW.."51,28"..WHITE..")"
Inst27Quest1_Note = "Месиво падет со всех троллей."
Inst27Quest1_Prequest = "Нет"
Inst27Quest1_Folgequest = "Нет"

--QUEST 2 Allianz

Inst27Quest2 = "2. Панцири скарабеев"
Inst27Quest2_Level = "45"
Inst27Quest2_Attain = "?"
Inst27Quest2_Aim = "Принести 5 целых панцирей скарабея Тран'реку в Прибамбасск."
Inst27Quest2_Location = "Тран'рек (Танарис - Прибамбасск; "..YELLOW.."51,26"..WHITE..")"
Inst27Quest2_Note = "Предшествующее задание начинается у Кразека (Тернистая долина - Пиратская бухта; "..YELLOW.."25,77"..WHITE..").\nПанцири могут упасть с любого скарабея. Множество скарабеев находится около "..YELLOW.."[2]"..WHITE.."."
Inst27Quest2_Prequest = "Тран'рек"
Inst27Quest2_Folgequest = "Нет"
Inst27Quest2PreQuest = "true"

--QUEST 3 Allianz

Inst27Quest3 = "3. Тиара глубин"
Inst27Quest3_Level = "46"
Inst27Quest3_Attain = "40"
Inst27Quest3_Aim = "Принесите Тиару Глубин Табете в Пылевые топи."
Inst27Quest3_Location = " Табета (Пылевые топи; "..YELLOW.."46,57"..WHITE..")"
Inst27Quest3_Note = "Возьмите предшествующее задание у Бинк (Стальгорн; "..YELLOW.."25,8"..WHITE..").\nТиара глубин падает с гидроманта Велраты около "..YELLOW.."[6]"..WHITE.."."
Inst27Quest3_Prequest = "Миссия Табеты"
Inst27Quest3_Folgequest = "Нет"
Inst27Quest3PreQuest = "true"
--
Inst27Quest3name1 = "Spellshifter Rod"
Inst27Quest3name2 = "Gemshale Pauldrons"

--QUEST 4 Allianz

Inst27Quest4 = "4. Медальон Некрума"
Inst27Quest4_Level = "47"
Inst27Quest4_Attain = "40"
Inst27Quest4_Aim = "Отнесите медальон Некрума Тадиусу Мрачной Тени в Выжженные земли."
Inst27Quest4_Location = "Тадиус Мрачная Тень (Выжженные земли - Крепость Стражей Пустоты; "..YELLOW.."66,19"..WHITE..")"
Inst27Quest4_Note = "Линейка заданий начинается у укротителя грифонов Разящего Когтя (Внутренние земли - Цитадель Громового Молота; "..YELLOW.."9,44"..WHITE..").\nНекрум появляется около "..YELLOW.."[4]"..WHITE.." с последней волной боя Храмового события."
Inst27Quest4_Prequest = "Тролльи клетки -> Тадиус Мрачная Тень"
Inst27Quest4_Folgequest = "Прорицание"
Inst27Quest4PreQuest = "true"

--QUEST 5 Allianz

Inst27Quest5 = "5. Пророчество Мошару"
Inst27Quest5_Level = "47"
Inst27Quest5_Attain = "40"
Inst27Quest5_Aim = "Принесите первую и вторую таблички Мошару Йе'кинье в Танарис."
Inst27Quest5_Location = "Йе'кинья (Танарис - Порт Картеля; "..YELLOW.."66,22"..WHITE..")"
Inst27Quest5_Note = "Вы возьмете предшествующее задание у того же НИП.\nТаблички падают с Теки Мученика около "..YELLOW.."[2]"..WHITE.." и гидроманта Велраты около "..YELLOW.."[6]"..WHITE.."."
Inst27Quest5_Prequest = "Духи крикунов"
Inst27Quest5_Folgequest = "Древнее яйцо"
Inst27Quest5PreQuest = "true"

--QUEST 6 Allianz

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


--QUEST 7 Allianz

Inst27Quest7 = "7. Газ'рилла"
Inst27Quest7_Level = "50"
Inst27Quest7_Attain = "40"
Inst27Quest7_Aim = "Принесите искрящую чешую Газ'риллы Виззлу Медноштифу на Мерцающую равнину."
Inst27Quest7_Location = "Виззл Медноштиф (Тысяча Игл - Миражи на виражах; "..YELLOW.."78,77"..WHITE..")"
Inst27Quest7_Note = "Вы возьмете предшествующее задание у Клацморта Гайкокрута (Стальгорн - Город механиков; "..YELLOW.."68,46"..WHITE.."). Чтобы получить задание Газ'рилла, предшествующее задание выполнять необязательно.\nВы вызовете Газ'риллу около "..YELLOW.."[6]"..WHITE.." с помощью Молота Зул'Фаррака.\nСвященный молот падает с Квиаги Хранительницы (Внутренние земли - Алтарь Зула; "..YELLOW.."49,70"..WHITE..") и должен быть завершен на алтаре в Джинта'Алоре около "..YELLOW.."59,77"..WHITE.." перед тем как его можно будет использовать в Зул'Фарраке."
Inst27Quest7_Prequest = "Братья Латунный Болт"
Inst27Quest7_Folgequest = "Нет"
Inst27Quest7PreQuest = "true"
--
Inst27Quest7name1 = "Carrot on a Stick"

--QUEST 1 Horde

Inst27Quest1_HORDE = "1. Паучья богиня"
Inst27Quest1_HORDE_Level = "45"
Inst27Quest1_HORDE_Attain = "42"
Inst27Quest1_HORDE_Aim = "Прочитайте надписи на табличке Теки, узнайте имя паучьей богини, которой поклоняются тролли Сухокожих, а потом возвращайтесь к мастеру Гадрину."
Inst27Quest1_HORDE_Location = "Мастер Гадрин (Дуротар - Деревня Сен'джин; "..YELLOW.."55,74"..WHITE..")"
Inst27Quest1_HORDE_Note = "Линейка заданий начинается с Бутылки с ядом, которые стоят на столах в деревнях троллей во Внутренних землях.\nВы найдете табличку около "..YELLOW.."[2]"..WHITE.."."
Inst27Quest1_HORDE_Prequest = "Бутыли с ядом -> Разговор с мастером Гадрином"
Inst27Quest1_HORDE_Folgequest = "Призыв Шадры"
Inst27Quest1PreQuest_HORDE = "true"

--QUEST 2 Horde

Inst27Quest2_HORDE = "2. Троллье месиво"
Inst27Quest2_HORDE_Level = Inst27Quest1_Level
Inst27Quest2_HORDE_Attain = Inst27Quest1_Attain
Inst27Quest2_HORDE_Aim = Inst27Quest1_Aim
Inst27Quest2_HORDE_Location = Inst27Quest1_Location
Inst27Quest2_HORDE_Note = Inst27Quest1_Note
Inst27Quest2_HORDE_Prequest = Inst27Quest1_Prequest
Inst27Quest2_HORDE_Folgequest = Inst27Quest1_Folgequest

--QUEST 3 Horde

Inst27Quest3_HORDE = "3. Панцири скарабеев"
Inst27Quest3_HORDE_Level = Inst27Quest2_Level
Inst27Quest3_HORDE_Attain = Inst27Quest2_Attain
Inst27Quest3_HORDE_Aim = Inst27Quest2_Aim
Inst27Quest3_HORDE_Location = Inst27Quest2_Location
Inst27Quest3_HORDE_Note = Inst27Quest2_Note
Inst27Quest3_HORDE_Prequest = Inst27Quest2_Prequest
Inst27Quest3_HORDE_Folgequest = Inst27Quest2_Folgequest
Inst27Quest3PreQuest_HORDE = Inst27Quest2PreQuest

--QUEST 4 Horde

Inst27Quest4_HORDE = "4. Тиара глубин"
Inst27Quest4_HORDE_Level = Inst27Quest3_Level
Inst27Quest4_HORDE_Attain = Inst27Quest3_Attain
Inst27Quest4_HORDE_Aim = Inst27Quest3_Aim
Inst27Quest4_HORDE_Location = Inst27Quest3_Location
Inst27Quest4_HORDE_Note = "Тиара глубин падает с гидроманта Велраты около "..YELLOW.."[6]"..WHITE.."."
Inst27Quest4_HORDE_Prequest = "Нет"
Inst27Quest4_HORDE_Folgequest = Inst27Quest3_Folgequest
Inst27Quest4PreQuest_HORDE = "true"
--
Inst27Quest4name1_HORDE = "Spellshifter Rod"
Inst27Quest4name2_HORDE = "Gemshale Pauldrons"

--QUEST 5 Horde

Inst27Quest5_HORDE = Inst27Quest5
Inst27Quest5_HORDE_Level = Inst27Quest5_Level
Inst27Quest5_HORDE_Attain = Inst27Quest5_Attain
Inst27Quest5_HORDE_Aim = Inst27Quest5_Aim
Inst27Quest5_HORDE_Location = Inst27Quest5_Location
Inst27Quest5_HORDE_Note = Inst27Quest5_Note
Inst27Quest5_HORDE_Prequest = Inst27Quest5_Prequest
Inst27Quest5_HORDE_Folgequest = Inst27Quest5_Folgequest
Inst27Quest5PreQuest_HORDE = Inst27Quest5Prequest

--QUEST 6 Horde

Inst27Quest6_HORDE = Inst27Quest6
Inst27Quest6_HORDE_Level = Inst27Quest6_Level
Inst27Quest6_HORDE_Attain = Inst27Quest6_Attain
Inst27Quest6_HORDE_Aim = Inst27Quest6_Aim
Inst27Quest6_HORDE_Location = Inst27Quest6_Location
Inst27Quest6_HORDE_Note = Inst27Quest6_Note
Inst27Quest6_HORDE_Prequest = Inst27Quest6_Prequest
Inst27Quest6_HORDE_Folgequest = Inst27Quest6_Folgequest
--
Inst27Quest6name1_HORDE = "Masons Fraternity Ring"
Inst27Quest6name2_HORDE = "Engineer's Guild Headpiece"

--QUEST 7 Horde

Inst27Quest7_HORDE = Inst27Quest7
Inst27Quest7_HORDE_Level = Inst27Quest7_Level
Inst27Quest7_HORDE_Attain = Inst27Quest7_Attain
Inst27Quest7_HORDE_Aim = Inst27Quest7_Aim
Inst27Quest7_HORDE_Location = Inst27Quest7_Location
Inst27Quest7_HORDE_Note = "Вы вызовете Газ'риллу около "..YELLOW.."[6]"..WHITE.." с помощью Молота Зул'Фаррака.\nСвященный молот падает с Квиаги Хранительницы (Внутренние земли - Алтарь Зула; "..YELLOW.."49,70"..WHITE..") и должен быть завершен на алтаре в Джинта'Алоре около "..YELLOW.."59,77"..WHITE.." перед тем как его можно будет использовать в Зул'Фарраке."
Inst27Quest7_HORDE_Prequest = "Нет"
Inst27Quest7_HORDE_Folgequest = Inst27Quest7_Folgequest
--
Inst27Quest7name1_HORDE = "Carrot on a Stick"

--------------------------Stockade/verlies (6 quests)
Inst24Story = "Тюрьма - это хорошо защищенный тюремный комплекс, скрытый под районом каналов Штормграда. Под руководством тюремщика Телвотера, Тюрьма стала домом мелких жуликов, мятежников, убийц и пары десятков самых опасных преступников в стране. Недавно, поднятое заключенными восстание превратило Тюрьму бог знает во что - охранников выгнали, а осужденные разгуливают на свободе. Тюремщик Телвотер умудрился выбраться из зоны и теперь вербует отважных экстремалов совершить вылазку в тюрьму и убить вдохновителя восстания - опасного уголовника, Базиля Тредда."
Inst24Caption = "Тюрьма Штормграда"
Inst24QAA = "6 Заданий"
Inst24QAH = "Нет заданий"



--QUEST 1 Allianz

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

--QUEST 2 Allianz

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


--QUEST 3 Allianz

Inst24Quest3 = "3. Подавление восстания"
Inst24Quest3_Level = "26"
Inst24Quest3_Attain = "22"
Inst24Quest3_Aim = "Тюремщик Телвотер просит вас убить в тюрьме 10 узников из Братства Справедливости, 8 каторжников из Братства Справедливости и 8 мятежников из Братства Справедливости."
Inst24Quest3_Location = "Тюремщик Телвотер (Штормград - Тюрьма Штормграда; "..YELLOW.."41,58"..WHITE..")"
Inst24Quest3_Note = ""
Inst24Quest3_Prequest = "Нет"
Inst24Quest3_Folgequest = "Нет"

--QUEST 4 Allianz

Inst24Quest4 = "4. Цвет крови"
Inst24Quest4_Level = "26"
Inst24Quest4_Attain = "?"
Inst24Quest4_Aim = "Принесите Никовии Раскол 10 красных шерстяных бандан."
Inst24Quest4_Location = "Никовия Раскол (Штормград - Старый город; "..YELLOW.."73,46"..WHITE..")"
Inst24Quest4_Note = "Со всех бандитов внутри Тюрьмы могут упасть красные шерстяные банданы."
Inst24Quest4_Prequest = "Нет"
Inst24Quest4_Folgequest = "Нет"

--QUEST 5 Allianz

Inst24Quest5 = "5. Успокоить гневливого"
Inst24Quest5_Level = "27"
Inst24Quest5_Attain = "25"
Inst24Quest5_Aim = "Принесите голову Кама Гневливого Мотли Каменщику в Дун Модр."
Inst24Quest5_Location = "Мотли Каменщик (Болотина - Дун Модр; "..YELLOW.."49,18"..WHITE..")"
Inst24Quest5_Note = "Предшествующее задание также можно взять у Мотли. Вы найдете Кама Гневливого около "..YELLOW.."[2]"..WHITE.."."
Inst24Quest5_Prequest = "Война с Черным Железом"
Inst24Quest5_Folgequest = "Нет"
Inst24Quest5PreQuest = "true"
--
Inst24Quest5name1 = "Belt of Vindication"
Inst24Quest5name2 = "Headbasher"


--QUEST 6 Allianz

Inst24Quest6 = "6. Бунтовщики в тюрьме"
Inst24Quest6_Level = "29"
Inst24Quest6_Attain = "16"
Inst24Quest6_Aim = "Убейте Базиля Тредда и принесите его голову Телвотеру в тюрьму Штормграда."
Inst24Quest6_Location = "Тюремщик Телвотер (Штормград - Тюрьма Штормграда; "..YELLOW.."41,58"..WHITE..")"
Inst24Quest6_Note = "Для более детальной информации о предшествующем задании смотрите "..YELLOW.."[Мертвые копи, Братство справедливости]"..WHITE..".\nВы найдете Базиля Тредда около "..YELLOW.."[4]"..WHITE.."."
Inst24Quest6_Prequest = "Братство Справедливости -> Базиль Тредд"
Inst24Quest6_Folgequest = "Таинственный посетитель"
Inst24Quest6PreQuest = "true"


--------------Razorfen Downs/Inst17 ( 4 quests)------------
Inst17Story = "Курганы Иглошкурых – столица расы свинобразов, построенная по образцу лабиринтов. В них живет племя Мертвой Головы – целая армия преданных свинобразов, возглавляемых верховными жрецами. Однако сейчас над их обителью сгустилась тьма. Армия Плети под предводительством лича Амненнара Хладовея подчинила иглогривов своей воле и превратила их город в цитадель нежити. Теперь свинобразы сражаются из последних сил, чтобы отвоевать любимый город, пока Амненнар не покорил все Степи."
Inst17Caption = "Курганы Иглошкурых"
Inst17QAA = "3 Задания"
Inst17QAH = "4 Задания"

--QUEST 1 Allianz

Inst17Quest1 = "1. Воинство зла"
Inst17Quest1_Level = "35"
Inst17Quest1_Attain = "30"
Inst17Quest1_Aim = "Убейте 8 боевых стражей и 8 терноплетов из племени Иглошкурых, а также 8 сектанток из племени Мертвой Головы и возвращайтесь к Мириам Лунной Певице на Курганы Иглошкурых."
Inst17Quest1_Location = "Мириам Лунная Певица (Степи; "..YELLOW.."49,94"..WHITE..")"
Inst17Quest1_Note = "Вы сможете найти мобов и дающую задание в зоне перед самым входом в подземелье."
Inst17Quest1_Prequest = "Нет"
Inst17Quest1_Folgequest = "Нет"

--QUEST 2 Allianz

Inst17Quest2 = "2. Уничтожить идола"
Inst17Quest2_Level = "37"
Inst17Quest2_Attain = "34"
Inst17Quest2_Aim = "Сопроводите Белнистраза к идолу свинобразов на Курганах Иглошкурых. Защищайте Белнистраза, пока он будет проводить ритуал, чтобы разрушить идола."
Inst17Quest2_Location = "Белнистраз (Курганы Иглошкурых; "..YELLOW.."[2]"..WHITE..")"
Inst17Quest2_Note = "Предшествующее задание заключается просто в согласии помочь ему. Несколько мобов появятся и атакуют Белнистраза когда он попытается сломать идол. После выполнения, вы можете сдать задание у жаровни перед идолом."
Inst17Quest2_Prequest = "Плеть в холмах"
Inst17Quest2_Folgequest = "Нет"
Inst17Quest2PreQuest = "true"
--
Inst17Quest2name1 = "Dragonclaw Ring"

--QUEST 3 Allianz

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

--QUEST 1 Horde

Inst17Quest1_HORDE = Inst17Quest1
Inst17Quest1_HORDE_Level = Inst17Quest1_Level
Inst17Quest1_HORDE_Attain = Inst17Quest1_Attain
Inst17Quest1_HORDE_Aim = Inst17Quest1_Aim
Inst17Quest1_HORDE_Location = Inst17Quest1_Location
Inst17Quest1_HORDE_Note = Inst17Quest1_Note
Inst17Quest1_HORDE_Prequest = Inst17Quest1_Prequest
Inst17Quest1_HORDE_Folgequest = Inst17Quest1_Folgequest

--Quest 2 Horde

Inst17Quest2_HORDE = "2. Нечестивый союз"
Inst17Quest2_HORDE_Level = "36"
Inst17Quest2_HORDE_Attain = "?"
Inst17Quest2_HORDE_Aim = "Принести голову посла Малкина Вариматасу в Подгород."
Inst17Quest2_HORDE_Location = "Вариматас (Подгород - Королевский квартал; "..YELLOW.."56,92"..WHITE..")"
Inst17Quest2_HORDE_Note = "Предшествующее задание можно подобрать с последнего босса в Лабиринтах Иглошкурых. Вы найдете Малкина снаружи (Степи; "..YELLOW.."48,92"..WHITE..")."
Inst17Quest2_HORDE_Prequest = "Нечестивый союз"
Inst17Quest2_HORDE_Folgequest = "Нет"
Inst17Quest2PreQuest_HORDE = "true"
--
Inst17Quest2name1_HORDE = "Skullbreaker"
Inst17Quest2name2_HORDE = "Nail Spitter"
Inst17Quest2name3_HORDE = "Zealot's Robe"

-- Quest 3 Horde

Inst17Quest3_HORDE = "3. Уничтожить идола"
Inst17Quest3_HORDE_Level = Inst17Quest2_Level
Inst17Quest3_HORDE_Attain = Inst17Quest2_Attain
Inst17Quest3_HORDE_Aim = Inst17Quest2_Aim
Inst17Quest3_HORDE_Location = Inst17Quest2_Location
Inst17Quest3_HORDE_Note = Inst17Quest2_Note
Inst17Quest3_HORDE_Prequest = Inst17Quest2_Prequest
Inst17Quest3_HORDE_Folgequest = Inst17Quest2_Folgequest
Inst17Quest3PreQuest_HORDE = Inst17Quest2PreQuest
--
Inst17Quest3name1_HORDE = "Dragonclaw Ring"

--QUEST 4 Horde

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

--------------Kloster/SM ( 6 quests)------------
Inst19Story = "Монастырь когда-то был гордым оплотом жречества Лордерона - центром обучения и просвящения. С появлением нежити Плети во время Третьей войны, мирный монастырь превратился в цитадель фанатичного Алого ордена. Рыцари ордена нетерпимы ко всем нечеловеческим расам, невзирая на союзы и принадлежности. Они верят что любой чужак - потенциальный носитель чумы нежити - и должны быть уничтожены. Судя по донесениям, любителям приключений, которые ходили в монастырь пришлось сражаться с командиром Алого ордена Могрейном, под рукой которого находится большой гарнизон фанатично преданных воинов. Онако настоящая хозяйка монастыря - это Верховный инквизитор Вайтмейн - грозная жрица, обладающая способностью воскрешать павших воинов для сражения во имя нее."
Inst19Caption = "Монастырь Алого ордена"
Inst19QAA = "3 Задания"
Inst19QAH = "5 Заданий"

--QUEST 1 Allianz

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

--QUEST 2 Allianz

Inst19Quest2 = "2. Во имя Света!"
Inst19Quest2_Level = "40"
Inst19Quest2_Attain = "39"
Inst19Quest2_Aim = "Убейте Верховного инквизитора Вайтмейн, командира Могрейна из Алого ордена, воителя Герода из Алого ордена и псаря Локси, после этого вернитесь с докладом к Ролею Благочестивому в Южнобережье."
Inst19Quest2_Location = "Ролей Благочестивый (Предгорья Хилсбрада - Южнобережье; "..YELLOW.."51,58"..WHITE..")"
Inst19Quest2_Note = "Эта линейка заданий начинается у брата Кроули в Штормграде - Собор Света ("..YELLOW.."46,36"..WHITE..")."
Inst19Quest2_Prequest = "Брат Антон -> Путями Алого ордена"
Inst19Quest2_Folgequest = "Нет"
Inst19Quest2PreQuest = "true"
--
Inst19Quest2name1 = "Sword of Serenity"
Inst19Quest2name2 = "Bonebiter"
Inst19Quest2name3 = "Black Menace"
Inst19Quest2name4 = "Orb of Lorica"


--QUEST 3 Allianz MAGIER

Inst19Quest3 = "3. Обряды силы (Маг)"
Inst19Quest3_Level = "40"
Inst19Quest3_Attain = "31"
Inst19Quest3_Aim = "Принесите книгу 'Обряды силы' Табете в Пыльную трясину."
Inst19Quest3_Location = "Табета (Пылевые топи; "..YELLOW.."46,57"..WHITE..")"
Inst19Quest3_Note = "Это задание могут взять только маги. Вы найдете книгу в последнем коридоре ведущем к чародею Доану ("..YELLOW.."[2]"..WHITE..")."
Inst19Quest3_Prequest = "Волшебное слово"
Inst19Quest3_Folgequest = "Жезл мага"
Inst19Quest3PreQuest = "true"

--QUEST 1 Horde

Inst19Quest1_HORDE = "1. Месть Воррела"
Inst19Quest1_HORDE_Level = "33"
Inst19Quest1_HORDE_Attain = "?"
Inst19Quest1_HORDE_Aim = "Верните обручальное кольцо Воррела Сенгутца Монике Сенгутц в Мельнице Таррен."
Inst19Quest1_HORDE_Location = "Воррел Сенгутц (МАО - Кладбище)"
Inst19Quest1_HORDE_Note = "Вы найдете Воррела Сенгутца в начале Кладбищенского крыла Монастыря Алого ордена. Нэнси Вишас, с которой падает кольцо нужное для задания, можно найти в доме в Альтеракских горах ("..YELLOW.."31,32"..WHITE..")."
Inst19Quest1_HORDE_Prequest = "Нет"
Inst19Quest1_HORDE_Folgequest = "Нет"
--
Inst19Quest1name1_HORDE = "Vorrel's Boots"
Inst19Quest1name2_HORDE = "Mantle of Woe"
Inst19Quest1name3_HORDE = "Grimsteel Cape"

--Quest 2 Horde

Inst19Quest2_HORDE = "2. Сердца Доблести"
Inst19Quest2_HORDE_Level = "33"
Inst19Quest2_HORDE_Attain = "?"
Inst19Quest2_HORDE_Aim = "Мастер аптекарь Фаранелл в Подгороде просит принести ему 20 Сердец Доблести."
Inst19Quest2_HORDE_Location = "Мастер аптекарь Фаранелл (Подгород - Квартал фармацевтов; "..YELLOW.."48,69"..WHITE..")"
Inst19Quest2_HORDE_Note = "Сердца Доблести можно выбить со всех мобов в Алом Монастыре, включая людей вне подземелья."
Inst19Quest2_HORDE_Prequest = "Груды гуано ("..YELLOW.."[Лабиринты Иглошкурых]"..WHITE..")"
Inst19Quest2_HORDE_Folgequest = "Нет"
Inst19Quest2PreQuest_HORDE = "true"


-- Quest 3 Horde

Inst19Quest3_HORDE = "3. Испытание знаний"
Inst19Quest3_HORDE_Level = "36"
Inst19Quest3_HORDE_Attain = "32"
Inst19Quest3_HORDE_Aim = "Найдите книгу 'Истоки угрозы нежити' и отнесите ее Парквелу Финталласу в Подгород."
Inst19Quest3_HORDE_Location = "Парквел Финталлас (Подгород - Квартал фармацевтов; "..YELLOW.."57,65"..WHITE..")"
Inst19Quest3_HORDE_Note = "Линейка начинается у Дорна Вольного Ловчего (Тысяча Игл; "..YELLOW.."53,41"..WHITE.."). Вы можете найти книгу в Библиотеке Алого Монастыря."
Inst19Quest3_HORDE_Prequest = "Испытание веры -> Испытание знаний"
Inst19Quest3_HORDE_Folgequest = "Испытание знаний"
Inst19Quest3PreQuest_HORDE = "true"

--QUEST 4 Horde

Inst19Quest4_HORDE = "4. Перечень павших"
Inst19Quest4_HORDE_Level = "38"
Inst19Quest4_HORDE_Attain = "?"
Inst19Quest4_HORDE_Aim = "Добудьте перечень павших из монастыря в Тирисфальских лесах и возвращайтесь к Ведуну Искателю Истины в Громовой Утес."
Inst19Quest4_HORDE_Location = "Ведун Искатель Истины (Громовой утес; "..YELLOW.."34,47"..WHITE..")"
Inst19Quest4_HORDE_Note = "Вы найдете книгу в библиотечной секции Алого Монастыря. ВНИМАНИЕ! Нежить не может взять это задание"
Inst19Quest4_HORDE_Prequest = "Нет"
Inst19Quest4_HORDE_Folgequest = "Нет"
--
Inst19Quest4name1_HORDE = "Vile Protector"
Inst19Quest4name2_HORDE = "Forcestone Buckler"
Inst19Quest4name3_HORDE = "Omega Orb"

--QUEST 5 Horde

Inst19Quest5_HORDE = "5. В монастырь Алого ордена"
Inst19Quest5_HORDE_Level = "42"
Inst19Quest5_HORDE_Attain = "33"
Inst19Quest5_HORDE_Aim = "Убейте Верховного инквизитора Вайтмейн, командира Могрейна из Алого ордена, воителя Герода из Алого ордена и псаря Локси. Затем возвращайтесь к Вариматасу в Подгород."
Inst19Quest5_HORDE_Location = "Вариматас (Подгород - Королевский квартал; "..YELLOW.."56,92"..WHITE..")"
Inst19Quest5_HORDE_Note = "Вы найдете Верховного инквизитора Вайтмейн и Командира Могрейна из Алого ордена около "..YELLOW.."[5]"..WHITE..", Герода около "..YELLOW.."[3]"..WHITE.." и псаря Локси около "..YELLOW.."[1]"..WHITE.."."
Inst19Quest5_HORDE_Prequest = "Нет"
Inst19Quest5_HORDE_Folgequest = "Нет"
--
Inst19Quest5name1_HORDE = "Sword of Omen"
Inst19Quest5name2_HORDE = "Prophetic Cane"
Inst19Quest5name3_HORDE = "Dragon's Blood Necklace"

--QUEST 6 Horde

Inst19Quest6_HORDE = "4. Обряды силы (Маг)"
Inst19Quest6_HORDE_Level = Inst19Quest3_Level
Inst19Quest6_HORDE_Attain = Inst19Quest3_Attain
Inst19Quest6_HORDE_Aim = Inst19Quest3_Aim
Inst19Quest6_HORDE_Location = Inst19Quest3_Location
Inst19Quest6_HORDE_Note = Inst19Quest3_Note
Inst19Quest6_HORDE_Prequest = Inst19Quest3_Prequest
Inst19Quest6_HORDE_Folgequest = Inst19Quest3_Folgequest
Inst19Quest6PreQuest_HORDE = Inst19Quest3_PreQuest

--------------Kral ( 5 quests)------------
Inst18Story = "Десять тысяч лет назад - во времена Войны Древних, могущественный полубог, Агамагган, вступил в битву против Пылающего Легиона. Огромный крепкий кабан пал в битве, но его действия помогли спасти Азерот от превращения в руины. Спустя некоторое время, в том, месте куда пролилась его кровь, из-под земли выросли толстые, покрытые шипами плети. Иглогривы - верившие, что они являются смертными потомками могучего бога, пришли занять эти места и охранять как святыню. Сердце этих шипастых колоний известно как Иглошкур. Огромные пространства Лабиринтов Иглошкурых были завоеваны старой каргой, Чарлгой Бритый Бок. Под ее рукой, иглогривы-шаманы начали атаковать племена соперников, также как и поселенцев Орды. Некоторые полагают, что Чарлга даже вела переговоры с агентами Плети - приравняв неожиданно ее племя к рангу нежити по каким-то коварным причинам."
Inst18Caption = "Лабиринты Иглошкурых"
Inst18QAA = "5 Заданий"
Inst18QAH = "5 Заданий"

--QUEST 1 Allianz

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

--QUEST 2 Allianz

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

--QUEST 3 Allianz

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

--QUEST 4 Allianz

Inst18Quest4 = "4. Хозяйка лабиринта"
Inst18Quest4_Level = "34"
Inst18Quest4_Attain = "30"
Inst18Quest4_Aim = "Принесите медальон Чарглы Острый Бок Фалфиндеру Хранителю Путей в Таланааре."
Inst18Quest4_Location = "Хранитель дорог Фалфиндел (Фералас - Таланаар; "..YELLOW.."89,46"..WHITE..")"
Inst18Quest4_Note = "Медальон нужный для заадания падает с Чарлги Остробок  "..YELLOW.."[7]"..WHITE.."."
Inst18Quest4_Prequest = "Дневник Хмурня"
Inst18Quest4_Folgequest = "Нет"
Inst18Quest4PreQuest = "true"
--
Inst18Quest4name1 = "'Mage-Eye' Blunderbuss"
Inst18Quest4name2 = "Berylline Pads"
Inst18Quest4name3 = "Stonefist Girdle"
Inst18Quest4name4 = "Marbled Buckler"

--QUEST 5 Allianz KRIEGER

Inst18Quest5 = "5. Закаленный доспех (Воин)"
Inst18Quest5_Level = "28"
Inst18Quest5_Attain = "20"
Inst18Quest5_Aim = "Соберите все необходимые материалы для Фьюрена Длинноборода и отнесите их в Штормград."
Inst18Quest5_Location = "Фьюрен Длиннобород (Штормград - Квартал дворфов; "..YELLOW.."57,16"..WHITE..")"
Inst18Quest5_Note = "Это задание могут взять только воители. Вы заберете сосуд флогистона у Ругуга около "..YELLOW.."[1]"..WHITE..".\n\nПоследующее задание отличается для каждой расы. Пылающая кровь для людей, Железный Коралл для дворфов и гномов и Высохшая скорлупа для ночных эльфов."
Inst18Quest5_Prequest = "Щитник"
Inst18Quest5_Folgequest = "(См. заметки)"
Inst18Quest5PreQuest = "true"


--QUEST 1 Horde

Inst18Quest1_HORDE = Inst18Quest1
Inst18Quest1_HORDE_Level = Inst18Quest1_Level
Inst18Quest1_HORDE_Attain = Inst18Quest1_Attain
Inst18Quest1_HORDE_Aim = Inst18Quest1_Aim
Inst18Quest1_HORDE_Location = Inst18Quest1_Location
Inst18Quest1_HORDE_Note = Inst18Quest1_Note
Inst18Quest1_HORDE_Prequest = Inst18Quest1_Prequest
Inst18Quest1_HORDE_Folgequest = Inst18Quest1_Folgequest
--
Inst18Quest1name1_HORDE = "A Small Container of Gems"

--Quest 2 Horde

Inst18Quest2_HORDE = "2. Импортер Вилликс"
Inst18Quest2_HORDE_Level = Inst18Quest3_Level
Inst18Quest2_HORDE_Attain = Inst18Quest3_Attain
Inst18Quest2_HORDE_Aim = Inst18Quest3_Aim
Inst18Quest2_HORDE_Location = Inst18Quest3_Location
Inst18Quest2_HORDE_Note = Inst18Quest3_Note
Inst18Quest2_HORDE_Prequest = Inst18Quest3_Prequest
Inst18Quest2_HORDE_Folgequest = Inst18Quest3_Folgequest
--
Inst18Quest2name1_HORDE = "Monkey Ring"
Inst18Quest2name2_HORDE = "Snake Hoop"
Inst18Quest2name3_HORDE = "Tiger Band"

-- Quest 3 Horde

Inst18Quest3_HORDE = "3. Груды гуано"
Inst18Quest3_HORDE_Level = "33"
Inst18Quest3_HORDE_Attain = "?"
Inst18Quest3_HORDE_Aim = "Принесите 1 кучку гуано летучей мыши Вотчины мастеру аптекарю Фаранеллу в Подгород."
Inst18Quest3_HORDE_Location = "Мастер аптекарь Фаранелл (Подгород - Квартал фармацевтов; "..YELLOW.."48,69 "..WHITE..")"
Inst18Quest3_HORDE_Note = "Гуано падает с любой летучей мыши внутри подземелья."
Inst18Quest3_HORDE_Prequest = "Нет"
Inst18Quest3_HORDE_Folgequest = "Сердца Доблести ("..YELLOW.."[Монастырь Алого Ордена]"..WHITE..")"

--QUEST 4 Horde

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

--QUEST 5 Horde

Inst18Quest5_HORDE = "5. Доспехи Жестокости (Воин)"
Inst18Quest5_HORDE_Level = "30"
Inst18Quest5_HORDE_Attain = "20"
Inst18Quest5_HORDE_Aim = "Принесите Тун'гриму Огневзору 15 закопченных железных слитков, 10 мер толченого азурита, 10 железных слитков и сосуд флогистона."
Inst18Quest5_HORDE_Location = "Тун'грим Огневзор (Степи; "..YELLOW.."57,30"..WHITE..")"
Inst18Quest5_HORDE_Note = "Это задание могут взять только войны. Вы заберете сосуд флогистона у Ругуга около "..YELLOW.."[1]"..WHITE..".\n\nВыполнение задания позволит вам начать еще 4 новых задания у того же персонажа."
Inst18Quest5_HORDE_Prequest = "Поговорить с Тун'гримом"
Inst18Quest5_HORDE_Folgequest = "(см. заметки)"
Inst18Quest5PreQuest_HORDE = "true"

--------------Scholo ( 9 quests)------------
Inst20Story = "Некроситет разместился в серии гробниц, лежащих под развалинами крепости Каэр Дарроу. Когда-то принадлежавший знатной семье Баровых, Каэр Дарроу превратился в руины во время Второй войны. Так как колдун Кель'тузед вербовал последователей своего Культа Проклятых, он часто обещал бессмертие в обмен на служение Королю-личу. Семья Баровых поддалась харизматичному влиянию Кель'тузеда и подарила крепость и ее гробницы Плети. После этого культисты убили Баровых и превратили древние гробницы в школу некромантов, известную как Некроситет. Хотя Кель'тузеда больше нет в гробницах, преданные культисты и преподаватели все еще там. Могущественный лич, Рас Снегошепот, руководит охраной и следит за территорией во имя Плети - а смертный некромант, Темный магистр Гандлинг, выступает в роли коварного главы школы."
Inst20Caption = "Некроситет"
Inst20QAA = "9 Заданий"
Inst20QAH = "9 Заданий"

--QUEST 1 Allianz

Inst20Quest1 = "1. Зачумленные детеныши дракона"
Inst20Quest1_Attain = "55"
Inst20Quest1_Level = "58"
Inst20Quest1_Aim = "Убейте 20 зачумленных детенышей дракона, затем возвращайтесь к Бетине Биггльцинк в Часовню Последней Надежды."
Inst20Quest1_Location = "Бетина Биггльцинк (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
Inst20Quest1_Note = "Зачумленные детеныши дракона находятся по пути к Громоклину в большой комнате."
Inst20Quest1_Prequest = "Нет"
Inst20Quest1_Folgequest = "Здоровая чешуя дракона"

--QUEST 2 Allianz

Inst20Quest2 = "2. Здоровая чешуя дракона"
Inst20Quest2_Attain = ""
Inst20Quest2_Level = "58"
Inst20Quest2_Aim = "Отнесите здоровую чешую дракона Бетине Биггльцинк в Часовню Последней Надежды в Восточные Чумные земли."
Inst20Quest2_Location = "Здоровая чешуя дракона (случайно падает в Некроситете)"
Inst20Quest2_Note = "Здоровая чешуя дракона падает с зачумленных детенышей дракона (8% шанс). Вы найдете Бетину Биггльцинк в Восточные Чумные земли - Часовня Последней Надежды ("..YELLOW.."81,59"..WHITE..")."
Inst20Quest2_Prequest = "Зачумленные детеныши дракона "
Inst20Quest2_Folgequest = "Нет"
Inst20Quest2FQuest = "true"

--QUEST 3 Allianz

Inst20Quest3 = "3. Доктор Теолен Крастинов – Мясник"
Inst20Quest3_Attain = "55"
Inst20Quest3_Level = "60"
Inst20Quest3_Aim = "Найдите в Некроситете доктора Теолена Крастинова. Убейте его, затем сожгите останки Евы и Люсьена Саркофф. Выполнив задание, возвращайтесь к Еве Саркофф."
Inst20Quest3_Location = "Ева Саркофф (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest3_Note = "Вы найдете доктора Теолена Крастинова, останки Евы и останки Люсьена Саркофф около "..YELLOW.."[9]"..WHITE.."."
Inst20Quest3_Prequest = "Нет"
Inst20Quest3_Folgequest = "Мешок ужасов Крастинова"

--QUEST 4 Allianz

Inst20Quest4 = "4. Мешок ужасов Крастинова"
Inst20Quest4_Attain = "55"
Inst20Quest4_Level = "60"
Inst20Quest4_Aim = "Найдите в Некроситете Джандис Баров и уничтожьте ее. Заберите мешок ужасов Крастинова. Отнесите мешок Еве Саркофф."
Inst20Quest4_Location = "Ева Саркофф (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest4_Note = "Вы найдете Джастин Баров около "..YELLOW.."[3]"..WHITE.."."
Inst20Quest4_Prequest = "Доктор Теолен Крастинов – Мясник"
Inst20Quest4_Folgequest = "Киртонос Глашатай"
Inst20Quest4FQuest = "true"

--QUEST 5 Allianz

Inst20Quest5 = "5. Киртонос Глашатай"
Inst20Quest5_Attain = "56"
Inst20Quest5_Level = "60"
Inst20Quest5_Aim = "Вернитесь в Некроситет с кровью невинных. Найдите балкон и вылейте кровь в жаровню. На зов явится Киртонос. Сражайтесь как герой, не сдавайтесь! Уничтожьте Киртоноса и возвращайтесь к Еве Саркофф."
Inst20Quest5_Location = "Ева Саркофф (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest5_Note = "Жаровня находится около "..YELLOW.."[2]"..WHITE.."."
Inst20Quest5_Prequest = "Мешок ужасов Крастинова"
Inst20Quest5_Folgequest = "Рас Ледяной Шепот – человек"
Inst20Quest5FQuest = "true"
--
Inst20Quest5name1 = "Spectral Essence"
Inst20Quest5name2 = "Penelope's Rose"
Inst20Quest5name3 = "Mirah's Song"

--QUEST 6 Allianz

Inst20Quest6 = "6. Рас Снегошепот – лич"
Inst20Quest6_Attain = "60"
Inst20Quest6_Level = "60"
Inst20Quest6_Aim = "Отыщите в Некроситете Раса Снегошепота. Найдя его, воспользуйтесь Книгой Души против его посмертного облика. Если удастся превратить Раса в смертного, убейте его и заберите человеческую голову Раса Снегошепота. Отнесите голову мировому судье Мардуку."
Inst20Quest6_Location = "Мировой судья Мардук (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest6_Note = "Вы сможете найти Раса Леденой Шепот около "..YELLOW.."[7]"..WHITE.."."
Inst20Quest6_Prequest = "Рас Ледяной Шепот – человек - >  Книга Души"
Inst20Quest6_Folgequest = "Нет"
Inst20Quest6PreQuest = "true"
--
Inst20Quest6name1 = "Darrowshire Strongguard"
Inst20Quest6name2 = "Warblade of Caer Darrow"
Inst20Quest6name3 = "Crown of Caer Darrow"
Inst20Quest6name4 = "Darrowspike"

--QUEST 7 Allianz

Inst20Quest7 = "7. Сокровище Баровых"
Inst20Quest7_Attain = "60"
Inst20Quest7_Level = "60"
Inst20Quest7_Aim = "Отправляйтесь в Некроситет и добудьте сокровище семьи Баровых. Оно состоит из четырех документов: на Каэр Дарроу, на Брилл, на Мельницу Таррен и на Южнобережье. После выполнения задания вернитесь к Велдону Барову."
Inst20Quest7_Location = "Велдон Баров (Западные Чумные земли - Лагерь Промозглого Ветра; "..YELLOW.."43,83"..WHITE..")"
Inst20Quest7_Note = "Вы найдете Документы на Каэр Дарроу около "..YELLOW.."[12]"..WHITE..", Документы на Брилл около "..YELLOW.."[7]"..WHITE..", Документы на мельницу Таррен около "..YELLOW.."[4]"..WHITE.." и Документы на Южнобережье около "..YELLOW.."[1]"..WHITE.."."
Inst20Quest7_Prequest = "Нет"
Inst20Quest7_Folgequest = "Последний из Баровых"

--QUEST 8 Allianz

Inst20Quest8 = "8. Рассветный гамбит"
Inst20Quest8_Attain = "59"
Inst20Quest8_Level = "60"
Inst20Quest8_Aim = "Отнесите рассветный гамбит в Демонстрационную комнату в Некроситете. Уничтожьте Вектуса и возвращайтесь к Бетине Биггльцинк."
Inst20Quest8_Location = "Бетина Биггльцинк (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
Inst20Quest8_Note = "Сущность детеныша дракона начинается у Тинки Кипеллера (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,23"..WHITE.."). Демонстрационная комната находится около "..YELLOW.."[6]"..WHITE.."."
Inst20Quest8_Prequest = "Сущность детеныша дракона - > Бетина Биггльцинк"
Inst20Quest8_Folgequest = "Нет"
Inst20Quest8PreQuest = "true"
--
Inst20Quest8name1 = "Windreaper"
Inst20Quest8name2 = "Dancing Sliver"

--QUEST 9 Allaince

Inst20Quest9 = "9. Доставка беса (Чернокнижник)"
Inst20Quest9_Attain = "60"
Inst20Quest9_Level = "60"
Inst20Quest9_Aim = "Отнесите беса в бутылке в алхимическую лабораторию Некроситета. После создания пергамента верните бутылку Горзиеки Дикоглазу."
Inst20Quest9_Location = "Горзиеки Дикоглаз (Пылающие степи; "..YELLOW.."12,31"..WHITE..")"
Inst20Quest9_Note = "Только Чернокнижники могут взять это задание! Вы найдете алхимическую лабораторию около "..YELLOW.."[7]"..WHITE.."."
Inst20Quest9_Prequest = "Мор'зул Кровопуск - > Зоротианская звездная пыль"
Inst20Quest9_Folgequest = "Ксоротианский конь погибели ("..YELLOW.."Забытый город Запад"..WHITE..")"
Inst20Quest9PreQuest = "true"



--QUEST 1 Horde

Inst20Quest1_HORDE = Inst20Quest1
Inst20Quest1_HORDE_Level = Inst20Quest1_Level
Inst20Quest1_HORDE_Attain = Inst20Quest1_Attain
Inst20Quest1_HORDE_Aim = Inst20Quest1_Aim
Inst20Quest1_HORDE_Location = Inst20Quest1_Location
Inst20Quest1_HORDE_Note = Inst20Quest1_Note
Inst20Quest1_HORDE_Prequest = Inst20Quest1_Prequest
Inst20Quest1_HORDE_Folgequest = Inst20Quest1_Folgequest


--QUEST 2 Horde

Inst20Quest2_HORDE = Inst20Quest2
Inst20Quest2_HORDE_Level = Inst20Quest2_Level
Inst20Quest2_HORDE_Attain = Inst20Quest2_Attain
Inst20Quest2_HORDE_Aim = Inst20Quest2_Aim
Inst20Quest2_HORDE_Location = Inst20Quest2_Location
Inst20Quest2_HORDE_Note = Inst20Quest2_Note
Inst20Quest2_HORDE_Prequest = Inst20Quest2_Prequest
Inst20Quest2_HORDE_Folgequest = Inst20Quest2_Folgequest
Inst20Quest2FQuest_HORDE = Inst20Quest2FQuest


--QUEST 3 Horde

Inst20Quest3_HORDE = Inst20Quest3
Inst20Quest3_HORDE_Level = Inst20Quest3_Level
Inst20Quest3_HORDE_Attain = Inst20Quest3_Attain
Inst20Quest3_HORDE_Aim = Inst20Quest3_Aim
Inst20Quest3_HORDE_Location = Inst20Quest3_Location
Inst20Quest3_HORDE_Note = Inst20Quest3_Note
Inst20Quest3_HORDE_Prequest = Inst20Quest3_Prequest
Inst20Quest3_HORDE_Folgequest = Inst20Quest3_Folgequest

--QUEST 4 Horde

Inst20Quest4_HORDE = Inst20Quest4
Inst20Quest4_HORDE_Level = Inst20Quest4_Level
Inst20Quest4_HORDE_Attain = Inst20Quest4_Attain
Inst20Quest4_HORDE_Aim = Inst20Quest4_Aim
Inst20Quest4_HORDE_Location = Inst20Quest4_Location
Inst20Quest4_HORDE_Note = Inst20Quest4_Note
Inst20Quest4_HORDE_Prequest = Inst20Quest4_Prequest
Inst20Quest4_HORDE_Folgequest = Inst20Quest4_Folgequest
Inst20Quest4FQuest_HORDE = Inst20Quest4FQuest


--QUEST 5 Horde

Inst20Quest5_HORDE = Inst20Quest5
Inst20Quest5_HORDE_Level = Inst20Quest5_Level
Inst20Quest5_HORDE_Attain = Inst20Quest5_Attain
Inst20Quest5_HORDE_Aim = Inst20Quest5_Aim
Inst20Quest5_HORDE_Location = Inst20Quest5_Location
Inst20Quest5_HORDE_Note = Inst20Quest5_Note
Inst20Quest5_HORDE_Prequest = Inst20Quest5_Prequest
Inst20Quest5_HORDE_Folgequest = Inst20Quest5_Folgequest
Inst20Quest5FQuest_HORDE = Inst20Quest5FQuest
--
Inst20Quest5name1_HORDE = "Spectral Essence"
Inst20Quest5name2_HORDE = "Penelope's Rose"
Inst20Quest5name3_HORDE = "Mirah's Song"

--QUEST 6 Horde

Inst20Quest6_HORDE = Inst20Quest6
Inst20Quest6_HORDE_Level = Inst20Quest6_Level
Inst20Quest6_HORDE_Attain = Inst20Quest6_Attain
Inst20Quest6_HORDE_Aim = Inst20Quest6_Aim
Inst20Quest6_HORDE_Location = Inst20Quest6_Location
Inst20Quest6_HORDE_Note = Inst20Quest6_Note
Inst20Quest6_HORDE_Prequest = Inst20Quest6_Prequest
Inst20Quest6_HORDE_Folgequest = Inst20Quest6_Folgequest
Inst20Quest6PreQuest_HORDE = Inst20Quest6PreQuest
--
Inst20Quest6name1_HORDE = "Darrowshire Strongguard"
Inst20Quest6name2_HORDE = "Warblade of Caer Darrow"
Inst20Quest6name3_HORDE = "Crown of Caer Darrow"
Inst20Quest6name4_HORDE = "Darrowspike"

--QUEST 7 Horde

Inst20Quest7_HORDE = "7. Сокровище Баровых"
Inst20Quest7_HORDE_Attain = "60"
Inst20Quest7_HORDE_Level = "60"
Inst20Quest7_HORDE_Aim = "Отправляйтесь в Некроситет и добудьте сокровище семьи Баровых. Оно состоит из четырех документов: на Каэр Дарроу, на Брилл, на Мельницу Таррен и на Южнобережье. После выполнения задания вернитесь к Алексию Барову."
Inst20Quest7_HORDE_Location = "Алексий Баров (Западные Чумные земли; "..YELLOW.."28,57"..WHITE..")"
Inst20Quest7_HORDE_Note = "Вы найдете Документы на Каэр Дарроу около "..YELLOW.."[12]"..WHITE..", Документы на Брилл около "..YELLOW.."[7]"..WHITE..", Документы на мельницу Таррен около "..YELLOW.."[4]"..WHITE.." и Документы на Южнобережье около "..YELLOW.."[1]"..WHITE.."."
Inst20Quest7_HORDE_Prequest = "Нет"
Inst20Quest7_HORDE_Folgequest = "Последний из Баровых"


--QUEST 8 Horde

Inst20Quest8_HORDE = Inst20Quest8
Inst20Quest8_HORDE_Level = Inst20Quest8_Level
Inst20Quest8_HORDE_Attain = Inst20Quest8_Attain
Inst20Quest8_HORDE_Aim = Inst20Quest8_Aim
Inst20Quest8_HORDE_Location = Inst20Quest8_Location
Inst20Quest8_HORDE_Note = Inst20Quest8_Note
Inst20Quest8_HORDE_Prequest = Inst20Quest8_Prequest
Inst20Quest8_HORDE_Folgequest = Inst20Quest8_Folgequest
Inst20Quest8PreQuest_HORDE = Inst20Quest8PreQuest
--
Inst20Quest8name1_HORDE = "Windreaper"
Inst20Quest8name2_HORDE = "Dancing Sliver"

--QUEST 9 Horde

Inst20Quest9_HORDE = Inst20Quest9
Inst20Quest9_HORDE_Level = Inst20Quest9_Level
Inst20Quest9_HORDE_Attain = Inst20Quest9_Attain
Inst20Quest9_HORDE_Aim = Inst20Quest9_Aim
Inst20Quest9_HORDE_Location = Inst20Quest9_Location
Inst20Quest9_HORDE_Note = Inst20Quest9_Note
Inst20Quest9_HORDE_Prequest = Inst20Quest9_Prequest
Inst20Quest9_HORDE_Folgequest = Inst20Quest9_Folgequest
Inst20Quest9PreQuest_HORDE = Inst20Quest9PreQuest

--------------Inst7/BFD(6  quests)------------
Inst7Story = "Расположенная вдоль побережья Зорам Ясеневого леса, Непроглядная пучина когда-то была знаменитым храмом посвященным богине Луны ночных эльфов, Элуне. Однако, великий Разлом разбил храм - опустив под волны Сокрытого моря. Он оставался нетронутым - пока, привлеченные древней силой - наги и сатиры не приплыли, чтобы раскрыт его секреты. Легенды утверждают что древнее чудовище, Аку'маи, поселилось в руинах храма. Аку'маи, любимый питомец изначальных Старых Богов, теперь охотится на его территории. Привлеченный Аку'маи, культ, известный как Молот Сумерек также пришел чтобы поживиться злым присутствием Старых Богов."
Inst7Caption = "Непроглядная пучина"
Inst7QAA = "6 Заданий"
Inst7QAH = "5 Заданий"

--QUEST 1 Allianz

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

--QUEST 2 Allianz

Inst7Quest2 = "2. Исследование порчи"
Inst7Quest2_Level = "24"
Inst7Quest2_Attain = "19"
Inst7Quest2_Aim = "Гершал Шепот Ночи в Аубердине хочет, чтобы вы принесли ему 8 оскверненных стволов мозга."
Inst7Quest2_Location = "Гершал Шепот Ночи (Темные Берега - Аубердин; "..YELLOW.."38,43"..WHITE..")"
Inst7Quest2_Note = "Предшествующее задание выполняется по желанию. Вы получите его от Аргоса Шепот Ночи (Штормград - Парк; "..YELLOW.."21,55"..WHITE.."). \n\nСо всех наг перед и внутри Непроглядной пучины можно получить сволы мозга."
Inst7Quest2_Prequest = "Проблема за морем"
Inst7Quest2_Folgequest = "Нет"
Inst7Quest2PreQuest = "true"
--
Inst7Quest2name1 = "Beetle Clasps"
Inst7Quest2name2 = "Prelacy Cape"

--QUEST 3 Allianz

Inst7Quest3 = "3. В поисках Талрида"
Inst7Quest3_Level = "24"
Inst7Quest3_Attain = "19"
Inst7Quest3_Aim = "Найдите стража Талрида из ордена Серебряного Рассвета в Непроглядной пучине."
Inst7Quest3_Location = "Рассветный дозорный Шедласс (Дарнасс - Терраса ремесленников; "..YELLOW.."55,24"..WHITE..")"
Inst7Quest3_Note = "Вы найдете стража Талрида из ордена Серебряного Рассвета около "..YELLOW.."[4]"..WHITE.."."
Inst7Quest3_Prequest = "Нет"
Inst7Quest3_Folgequest = "Непроглядная мерзость"

--QUEST 4 Alliance

Inst7Quest4 = "4. Злодейство в Непроглядной Пучине"
Inst7Quest4_Level = "27"
Inst7Quest4_Attain = "?"
Inst7Quest4_Aim = "Принесите голову Повелителя сумрака Келриса Рассветному дозорному Селгорму в Дарнасс."
Inst7Quest4_Location = "Страж Талрид из ордена Серебряного Рассвета (Непроглядная пучина; "..YELLOW.."[4]"..WHITE..")"
Inst7Quest4_Note = "Лорд Сумерек Келрис находится около "..YELLOW.."[8]"..WHITE..". Вы найдете Рассветного дозорного Селгорма в Дарнассе - Терраса Ремесленников ("..YELLOW.."55,24"..WHITE.."). \n\nВНИМАНИЕ! Если вы включите огни позади Лорда Келриса, появятся враги и атакуют вас."
Inst7Quest4_Prequest = "В поисках Талрида"
Inst7Quest4_Folgequest = "Нет"
Inst7Quest4FQuest = "true"
--
Inst7Quest4name1 = "Gravestone Scepter"
Inst7Quest4name2 = "Arctic Buckler"

--QUEST 5 Alliance

Inst7Quest5 = "5. Наступление сумерек"
Inst7Quest5_Level = "25"
Inst7Quest5_Attain = "20"
Inst7Quest5_Aim = "Принесите 10 подвесок Сумерек стражу Менадосу из ордена Серебряного рассвета в Дарнасс."
Inst7Quest5_Location = "Страж Менадос из ордена Серебряного рассвета (Дарнасс - Терраса ремесленников; "..YELLOW.."55,23"..WHITE..")"
Inst7Quest5_Note = "Из любого сумеречного моба падают подвески."
Inst7Quest5_Prequest = "Нет"
Inst7Quest5_Folgequest = "Нет"
--
Inst7Quest5name1 = "Nimbus Boots"
Inst7Quest5name2 = "Heartwood Girdle"

--QUEST 6 Alliance (hexenmeister)

Inst7Quest6 = "6. Шар Соран'рука (Чернокнижник)"
Inst7Quest6_Level = "26"
Inst7Quest6_Attain = "21"
Inst7Quest6_Aim = "Соберите 3 фрагмента Соран'рука и 1 большой фрагмент Соран'рука и принесите их Доану Кархану в Степи."
Inst7Quest6_Location = "Доан Кархан (Степи; "..YELLOW.."49,57"..WHITE..")"
Inst7Quest6_Note = "Только чернокнижники могут взять это задание! Вы возьмете 3 фрагмента Соран'рука с Сумеречных Прислужников в "..YELLOW.."[Непроглядная пучина]"..WHITE..". Вы возьмете большой фрагмент Соран'рука в "..YELLOW.."[Крепость Темного Клыка]"..WHITE.." у Темных Душ Темного Клыка."
Inst7Quest6_Prequest = "Нет"
Inst7Quest6_Folgequest = "Нет"
--
Inst7Quest6name1 = "Orb of Soran'ruk"
Inst7Quest6name2 = "Staff of Soran'ruk"


--QUEST 1 Horde

Inst7Quest1_HORDE = "1. Сущность Аку'май"
Inst7Quest1_HORDE_Level = "22"
Inst7Quest1_HORDE_Attain = "17"
Inst7Quest1_HORDE_Aim = "Принесите 20 сапфиров Аку'май Дже'неу Санкри в Ясеневый лес."
Inst7Quest1_HORDE_Location = "Дже'неу Санкри (Ясеневый лес - Застава Зорам'гар; "..YELLOW.."11,33"..WHITE..")"
Inst7Quest1_HORDE_Note = "Вы получите предшествующее задание 'Угроза из Глубин' у Цунамана (Когтистые горы - Приют у Солнечного камня; "..YELLOW.."47,64"..WHITE.."). Сапфиры можно найти в пещерах перед подземельем."
Inst7Quest1_HORDE_Prequest = "Угроза из Глубин"
Inst7Quest1_HORDE_Folgequest = "Нет"
Inst7Quest1PreQuest_HORDE = "true"

--QUEST 2 Horde

Inst7Quest2_HORDE = "2. Верность Древним богам"
Inst7Quest2_HORDE_Level = "26"
Inst7Quest2_HORDE_Attain = "-"
Inst7Quest2_HORDE_Aim = "Принесите отсыревшую записку Дже'неу Санкри в Ясеневый лес. -> Убейте Лоргуса Джетта в Непроглядной пучине и вернитесь к Дже'неу Санкри в Ясеневый лес."
Inst7Quest2_HORDE_Location = "Отсыревшая записка (падает - см. заметки)"
Inst7Quest2_HORDE_Note = "Вы получите Отсыревшую записку с Жриц прилива из Непроглядной Пучины (5% шанс выпадения). Потом принесите ее Дже'неу Санкри (Ясеневый лес - Застава Зорам'гар; "..YELLOW.."11,33"..WHITE.."). Лоргус Джетт находится около "..YELLOW.."[6]"..WHITE.."."
Inst7Quest2_HORDE_Prequest = "Нет"
Inst7Quest2_HORDE_Folgequest = "Нет"
--
Inst7Quest2name1_HORDE = "Band of the Fist"
Inst7Quest2name2_HORDE = "Chestnut Mantle"

--QUEST 3 Horde

Inst7Quest3_HORDE = "3. Среди руин"
Inst7Quest3_HORDE_Level = "27"
Inst7Quest3_HORDE_Attain = "-"
Inst7Quest3_HORDE_Aim = "Принесите глубинный сердечник Дже'неу Санкри в форт Зорам'гар в Ясеневый лес."
Inst7Quest3_HORDE_Location = "Дже'неу Санкри (Ясеневый лес - Застава Зорам'гар; "..YELLOW.."11,33"..WHITE..")"
Inst7Quest3_HORDE_Note = "Вы найдете глубинный сердечник около "..YELLOW.."[7]"..WHITE.." под водой. Когда вы поднимите сердечник появится барон Акванис и атакует вас. С него падает предмет, который вы должны принести Дже'неу Санкри."
Inst7Quest3_HORDE_Prequest = "Нет"
Inst7Quest3_HORDE_Folgequest = "Нет"

--QUEST 4 Horde

Inst7Quest4_HORDE = "4. Жестокость Черных Глубин"
Inst7Quest4_HORDE_Level = "27"
Inst7Quest4_HORDE_Attain = "-"
Inst7Quest4_HORDE_Aim = "Принесите голову Повелителя сумрака Келриса Башане Руническому Тотему в Громовой Утес."
Inst7Quest4_HORDE_Location = "Страж Талрид из ордена Серебряного Рассвета (Непроглядная пучина; "..YELLOW.."[4]"..WHITE..")"
Inst7Quest4_HORDE_Note = "Лорд Сумерек Келрис находится около "..YELLOW.."[8]"..WHITE..". Вы найдете Башана Рунического Тотема в Громовом Утесе - Вершина Старейшин ("..YELLOW.."55,24"..WHITE.."). \n\nВНИМАНИЕ! Если вы включите огни позади Лорда Келриса, появятся враги и атакуют вас."
Inst7Quest4_HORDE_Prequest = "Нет"
Inst7Quest4_HORDE_Folgequest = "Нет"
--
Inst7Quest4name1_HORDE = "Gravestone Scepter"
Inst7Quest4name2_HORDE = "Arctic Buckler"

--QUEST 5 Horde (Warlock)

Inst7Quest5_HORDE = "5. Шар Соран'рука (Чернокнижник)"
Inst7Quest5_HORDE_Level = Inst7Quest6_Level
Inst7Quest5_HORDE_Attain = Inst7Quest6_Attain
Inst7Quest5_HORDE_Aim = Inst7Quest6_Aim
Inst7Quest5_HORDE_Location = Inst7Quest6_Location
Inst7Quest5_HORDE_Note = Inst7Quest6_Note
Inst7Quest5_HORDE_Prequest = Inst7Quest6_Prequest
Inst7Quest5_HORDE_Folgequest = Inst7Quest6_Folgequest
--
Inst7Quest5name1_HORDE = "Orb of Soran'ruk"
Inst7Quest5name2_HORDE = "Staff of Soran'ruk"

--------------Inst25 ( 8 quests)------------
Inst25Story = "Свыше тысячи лет назад, могущественная империя Гурбаши была разорвана на части всеобщей гражданской войной. Влиятельная группа жрецов троллей, известная как Атал'аи, предприняла попытку призвать древнего кровавого бога по имени Хаккар Свежеватель Душ. Несмотря на то, что жрецы потерпели поражение и были изгнаны навеки, великая империя троллей не смогла сохранить целостность. Изгнанные жрецы бежали далеко на север, в Болота Печали. Там они возвели великий храм в честь Хаккара - где они могли приготовиться к его прибытию в материальный мир. Великий дракон Аспект, Изера, узнала о планах Атал'аи и утопила храм в болотах. На сегодняшний день, затопленные руины храма охраняются зелеными драконами, которые следят за тем, чтобы никто не входил и не выходил оттуда. Однако, есть мнение, что несколько фанатичных Атал'аи могли выжить и сбежать от гнева Изеры - а теперь вновь посвятили себя темному служению Хаккару."
Inst25Caption = "Затонувший храм"
--classq
Inst25QAA = "8 Заданий"
Inst25QAH = "8 Заданий"

--QUEST 1 Allianz

Inst25Quest1 = "1. В Храме Атал'Хаккара"
Inst25Quest1_Level = "50"
Inst25Quest1_Attain = "46"
Inst25Quest1_Aim = "Соберите 10 табличек Аталаи для Брохана Бочкопуза из Штормграда."
Inst25Quest1_Location = "Брохан Бочкопуз (Штормград - Квартал дворфов; "..YELLOW.."64,20"..WHITE..")"
Inst25Quest1_Note = "Серия предшествующих заданий начинается у того же НИП и имеет несколько этапов.\n\nВы сможете найти таблички по всему Храму, и внутри и снаружи подземелья."
Inst25Quest1_Prequest = "В поисках Храма -> Рапсодия о болоте"
Inst25Quest1_Folgequest = "Нет"
Inst25Quest1PreQuest = "true"
--
Inst25Quest1name1 = "Guardian Talisman"

--QUEST 2 Allianz

Inst25Quest2 = "2. Затонувший храм"
Inst25Quest2_Level = "51"
Inst25Quest2_Attain = "-"
Inst25Quest2_Aim = "Найдите Марвона Клепальщика в Танарисе."
Inst25Quest2_Location = "Ангелас Лунный Бриз (Фералас - Крепость Оперенной Луны; "..YELLOW.."31,45"..WHITE..")"
Inst25Quest2_Note = "Вы найдете Марвона Клепальщика около "..YELLOW.."52,45"..WHITE.."."
Inst25Quest2_Prequest = "Нет"
Inst25Quest2_Folgequest = "Круглый камень"

--QUEST 3 Allianz

Inst25Quest3 = "3. Во глубине болот"
Inst25Quest3_Level = "51"
Inst25Quest3_Attain = "-"
Inst25Quest3_Aim = "Найдите алтарь Хаккара в затонувшем храме на Болоте Печали."
Inst25Quest3_Location = "Марвон Клепальщик (Танарис; "..YELLOW.."52,45"..WHITE..")"
Inst25Quest3_Note = "Алтарь находится около "..YELLOW.."[1]"..WHITE.."."
Inst25Quest3_Prequest = "Круглый камень"
Inst25Quest3_Folgequest = "Нет"
Inst25Quest3FQuest = "true"


--QUEST 4 Alliance

Inst25Quest4 = "4. Тайна камня"
Inst25Quest4_Level = "51"
Inst25Quest4_Attain = "-"
Inst25Quest4_Aim = "Отправляйтесь в затонувший храм и узнайте, что скрывается в круге статуй."
Inst25Quest4_Location = "Марвон Клепальщик (Танарис; "..YELLOW.."52,45"..WHITE..")"
Inst25Quest4_Note = "Вы найдете статуи около "..YELLOW.."[1]"..WHITE..". Смотрите по карте порядок их активации."
Inst25Quest4_Prequest = "Круглый камень"
Inst25Quest4_Folgequest = "Нет"
Inst25Quest4FQuest = "true"
--
Inst25Quest4name1 = "Hakkari Urn"

--QUEST 5 Alliance

Inst25Quest5 = "5. Туман зла"
Inst25Quest5_Level = "52"
Inst25Quest5_Attain = "50"
Inst25Quest5_Aim = "Соберите 5 образцов тумана Аталаи и принесите их Майджину в Кратер Ун'Горо."
Inst25Quest5_Location = "Греган Пивоплюй (Фералас; "..YELLOW.."45,25"..WHITE..")"
Inst25Quest5_Note = "Предшествующее задание 'Майджин и Ларион' начинается у Майджина (Кратер Ун'Горо - Укрытие Маршалла; "..YELLOW.."42,9"..WHITE.."). Вы возьмете образцы тумана с Глубинных скрытней, Мракочервей или слизнюков в Храме."
Inst25Quest5_Prequest = "Майджин и Ларион -> Визит к Грегану "
Inst25Quest5_Folgequest = "Нет"
Inst25Quest5PreQuest = "true"



--QUEST 6 Alliance

Inst25Quest6 = "6. Бог Хаккар"
Inst25Quest6_Level = "53"
Inst25Quest6_Attain = "43"
Inst25Quest6_Aim = "Отнесите заполненное яйцо Хаккара Йе'кинье в Танарис."
Inst25Quest6_Location = "Йе'кинья (Танарис - Порт Картеля; "..YELLOW.."66,22"..WHITE..")"
Inst25Quest6_Note = "Цепочка заданий начинается с 'Духи крикунов' у того же НИП (См. "..YELLOW.."[Зул'Фаррак]"..WHITE..").\nВы должны задействовать Яйцо около "..YELLOW.."[3]"..WHITE.." чтобы начать Событие. Когда оно начнется, появятся враги и атакуют вас. С некоторых их них падает Кровь Хаккара. С этой кровью вы можете убрать факелы вокруг круга. После этого появится Аватара Хаккара. Вы убьете ее и получите 'Сущность Хаккара' Которую используете, чтобы наполнить яйцо."
Inst25Quest6_Prequest = "Духи крикунов -> Древнее яйцо"
Inst25Quest6_Folgequest = "Нет"
Inst25Quest6PreQuest = "true"
--
Inst25Quest6name1 = "Avenguard Helm"
Inst25Quest6name2 = "Lifeforce Dirk"
Inst25Quest6name3 = "Gemburst Circlet"

--QUEST 7 Alliance

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

--QUEST 8 Alliance
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


--QUEST 1 Horde

Inst25Quest1_HORDE = "1. Храм Атал'Хаккара"
Inst25Quest1_HORDE_Level = "50"
Inst25Quest1_HORDE_Attain = "38"
Inst25Quest1_HORDE_Aim = "Соберите 20 фетишей Хаккара и принесите их Фел'зерулу в Каменор."
Inst25Quest1_HORDE_Location = "Фел'зерул (Болото Печали - Каменор; "..YELLOW.."47,54"..WHITE..")"
Inst25Quest1_HORDE_Note = "Фетиши падают со всех врагов."
Inst25Quest1_HORDE_Prequest = "Озеро Слез -> Возвращение к Фел'зерулу"
Inst25Quest1_HORDE_Folgequest = "Нет"
Inst25Quest1PreQuest_HORDE = "true"
--
Inst25Quest1name1_HORDE = "Guardian Talisman"

--QUEST 2 Horde

Inst25Quest2_HORDE = "2. Затонувший храм"
Inst25Quest2_HORDE_Level = "51"
Inst25Quest2_HORDE_Attain = "-"
Inst25Quest2_HORDE_Aim = "Найдите Марвона Клепальщика в Танарисе."
Inst25Quest2_HORDE_Location = "Знахарь Узер'и (Фералас; "..YELLOW.."74,43"..WHITE..")"
Inst25Quest2_HORDE_Note = "Вы найдете Марвона Клепальщика около "..YELLOW.."52,45"..WHITE.."."
Inst25Quest2_HORDE_Prequest = "Нет"
Inst25Quest2_HORDE_Folgequest = "Круглый камень"

--QUEST 3 Horde

Inst25Quest3_HORDE = Inst25Quest3
Inst25Quest3_HORDE_Level = Inst25Quest3_Level
Inst25Quest3_HORDE_Attain = Inst25Quest3_Attain
Inst25Quest3_HORDE_Aim = Inst25Quest3_Aim
Inst25Quest3_HORDE_Location = Inst25Quest3_Location
Inst25Quest3_HORDE_Note = Inst25Quest3_Note
Inst25Quest3_HORDE_Prequest = Inst25Quest3_Prequest
Inst25Quest3_HORDE_Folgequest = Inst25Quest3_Folgequest
Inst25Quest3FQuest_HORDE = Inst25Quest3FQuest

--QUEST 4 Horde

Inst25Quest4_HORDE = Inst25Quest4
Inst25Quest4_HORDE_Level = Inst25Quest4_Level
Inst25Quest4_HORDE_Attain = Inst25Quest4_Attain
Inst25Quest4_HORDE_Aim = Inst25Quest4_Aim
Inst25Quest4_HORDE_Location = Inst25Quest4_Location
Inst25Quest4_HORDE_Note = Inst25Quest4_Note
Inst25Quest4_HORDE_Prequest = Inst25Quest4_Prequest
Inst25Quest4_HORDE_Folgequest = Inst25Quest4_Folgequest
Inst25Quest4FQuest_HORDE = Inst25Quest4FQuest
--
Inst25Quest4name1_HORDE = "Hakkari Urn"

--QUEST 5 Horde

Inst25Quest5_HORDE = "5. Питание для шокера"
Inst25Quest5_HORDE_Level = "52"
Inst25Quest5_HORDE_Attain = "50"
Inst25Quest5_HORDE_Aim = "Доставьте незаряженный шокер и 5 образцов тумана Аталаи Лариону в Укрытие Маршалла."
Inst25Quest5_HORDE_Location = "Лив Быстрочин (Степи; "..YELLOW.."62,38"..WHITE..")"
Inst25Quest5_HORDE_Note = "Предшествующее задание 'Ларион и Майджин' начинается у Лариона (Кратер Ун'Горо; "..YELLOW.."45,8"..WHITE.."). Вы возьмете образцы тумана с Глубинных скрытней, Мракочервей или слизнюков в Храме."
Inst25Quest5_HORDE_Prequest = "Ларион и Майджин -> Мастерская Марвона"
Inst25Quest5_HORDE_Folgequest = "Нет"
Inst25Quest5PreQuest_HORDE = "true"

--QUEST 6 Horde

Inst25Quest6_HORDE = Inst25Quest6
Inst25Quest6_HORDE_Level = Inst25Quest6_Level
Inst25Quest6_HORDE_Attain = Inst25Quest6_Attain
Inst25Quest6_HORDE_Aim = Inst25Quest6_Aim
Inst25Quest6_HORDE_Location = Inst25Quest6_Location
Inst25Quest6_HORDE_Note = Inst25Quest6_Note
Inst25Quest6_HORDE_Prequest = Inst25Quest6_Prequest
Inst25Quest6_HORDE_Folgequest = Inst25Quest6_Folgequest
Inst25Quest6PreQuest_HORDE = Inst25Quest6PreQuest
--
Inst25Quest6name1_HORDE = "Avenguard Helm"
Inst25Quest6name2_HORDE = "Lifeforce Dirk"
Inst25Quest6name3_HORDE = "Gemburst Circlet"

--QUEST 7 Horde

Inst25Quest7_HORDE = Inst25Quest7
Inst25Quest7_HORDE_Level = Inst25Quest7_Level
Inst25Quest7_HORDE_Attain = Inst25Quest7_Attain
Inst25Quest7_HORDE_Aim = Inst25Quest7_Aim
Inst25Quest7_HORDE_Location = Inst25Quest7_Location
Inst25Quest7_HORDE_Note = Inst25Quest7_Note
Inst25Quest7_HORDE_Prequest = Inst25Quest7_Prequest
Inst25Quest7_HORDE_Folgequest = Inst25Quest7_Folgequest
--
Inst25Quest7name1_HORDE = "Rainstrider Leggings"
Inst25Quest7name2_HORDE = "Helm of Exile"

--QUEST 8 Horde

Inst25Quest8_HORDE = Inst25Quest8
Inst25Quest8_HORDE_Level = Inst25Quest8_Level
Inst25Quest8_HORDE_Attain = Inst25Quest8_Attain
Inst25Quest8_HORDE_Aim = Inst25Quest8_Aim
Inst25Quest8_HORDE_Location = Inst25Quest8_Location
Inst25Quest8_HORDE_Note = Inst25Quest8_Note
Inst25Quest8_HORDE_Prequest = Inst25Quest8_Prequest
Inst25Quest8_HORDE_Folgequest = Inst25Quest8_Folgequest
--
Inst25Quest8name1_HORDE = "Chained Essence of Eranikus"

--------------Burg Shadowfang/Inst21/BSF ------------
Inst21Story = "Во время Третьей Войны, волшебники Кирин Тора сражались против армии нежити Плети. Когда волшебники Даларана погибли в бою, они смогли возродиться после - прибавив свою былую мощь к растущей Плети. Недовольный недостатком прогресса (и вопреки советам его соратников) Архимаг выбрал Аругала для призыва внемировых сущностей, чтобы подкрепить уменьшающиеся силы Даларана. Призыв Аругала привел изголодавшихся воргенов в мир Азерота. Дикие зверолюди устроили резню не только Плети, но быстро принялись и за самих волшебников. Воргены осадили крепость дворянина, барона Сребролена. Расположенная на небольшой деревушкой Погребальных костров, крепость быстро была ввергнута во тьму и разруху. Помешавшись из-за чувства вины, Аругал усыновил воргенов как детей и уединился в заново окрещенной 'Крепости Темного Клыка'. Говорят, он все еще живет там, защищаемый своим огромным питомцем, Фенрусом - и преследуемый мстительным духом барона Сребролена."
Inst21Caption = "Крепость Темного Клыка"
Inst21QAA = "2 Задания"
Inst21QAH = "4 Задания"

--Quest 1 allianz

Inst21Quest1 = "1. Испытание доблести (Паладин)"
Inst21Quest1_Level = "22"
Inst21Quest1_Attain = "20"
Inst21Quest1_Aim = "Возьмите список Джордана, добудьте немного древесины белокаменного дуба, партию очищенной руды Бэйлора, кузнечный молот Джордана и самоцвет Кора и отдайте их Джордану Стилвеллу в Стальгорне."
Inst21Quest1_Location = "Джордан Стилвелл (Дун Морог - Вход в Стальгорн; "..YELLOW.."52,36"..WHITE..")"
Inst21Quest1_Note = "Чтобы увидеть заметки щелкните на "..YELLOW.."[Информация: Испытание доблести]"..WHITE.."."
Inst21Quest1_Prequest = "Фолиант Отваги -> Испытание доблести"
Inst21Quest1_Folgequest = "Испытание доблести"
Inst21Quest1PreQuest = "true"
--
Inst21Quest1name1 = "Verigan's Fist"
Inst21Quest1_Page = {2, "Только паладины могут получить это задание!\n\n1. Вы получите древесину белокаменного дуба у гоблинов-лесорубов в "..YELLOW.."[Мертвые копи]"..WHITE.." около "..YELLOW.."[3]"..WHITE..".\n\n2. Для получения партии очищенной руды Бэйлора вы должны поговорить с Бэйлором Каменной Дланью (Озеро Модан - Телсамар; "..YELLOW.."35,44"..WHITE.."). Он даст вам задание 'Партия руды Бэйлора'. Вы найдете руду Джордана за деревом около "..YELLOW.."71,21"..WHITE.."\n\n3. Вы получите кузнечный молот Джордана в "..YELLOW.."[Крепость Темного Клыка]"..WHITE.." около "..YELLOW.."[3]"..WHITE..".\n\n4. Для получения самоцвета Кора Вам нужно пойти к Тандрису Ветропряду (Темные берега - Аубердин; "..YELLOW.."37,40"..WHITE..") и выполнить задание 'Поиск самоцвета Кора'. Для этого задания, вам нужно убивать Провидзев и Жриц Непроглядной пучины перед "..YELLOW.."[Непроглядная пучина]"..WHITE..". С них падает Оскверненный самоцвет Кора. Тандрис Ветропряд очистит его для вас.", };

--QUEST 2 Alliance (hexenmeister)

Inst21Quest2 = "2. Шар Соран'рука (Чернокнижник)"
Inst21Quest2_Level = "26"
Inst21Quest2_Attain = "21"
Inst21Quest2_Aim = "Соберите 3 фрагмента Соран'рука и 1 большой фрагмент Соран'рука и принесите их Доану Кархану в Степи."
Inst21Quest2_Location = "Доан Кархан (Степи; "..YELLOW.."49,57"..WHITE..")"
Inst21Quest2_Note = "Только чернокнижники могут взять это задание! Вы возьмете 3 фрагмента Соран'рука с Сумеречных Прислужников в "..YELLOW.."[Непроглядная пучина]"..WHITE..". Вы возьмете большой фрагмент Соран'рука в "..YELLOW.."[Крепость Темного Клыка]"..WHITE.." у Темных Душ Темного Клыка."
Inst21Quest2_Prequest = "Нет"
Inst21Quest2_Folgequest = "Нет"
--
Inst21Quest2name1 = "Orb of Soran'ruk"
Inst21Quest2name2 = "Staff of Soran'ruk"

--QUEST 1 Horde

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

--QUEST 2 Horde

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

--QUEST 3 Horde

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

--QUEST 4 Horde (hexenmeister)

Inst21Quest4_HORDE = "4. Шар Соран'рука (Чернокнижник)"
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

--------------Inst5/Blackrocktiefen/BRD ------------
Inst5Story = "Когда-то будучи столицей дворфов клана Темного Железа, этот вулканический лабиринт теперь является безраздельными владениями Огненого лорда Рагнароса. Рагнорос открыл секрет создания жизни из камня и собирается построить армию неудержимых големов, чтобы те помогли ему завоевать всю Черную гору целиком. Помешавшись на мысли победить Нефариана и его драконьих прислужников, Рагнарос пойдет на любую крайность чтобы достичь окончательной победы."
Inst5Caption = "Глубины Черной Горы"
Inst5QAA = "15 Заданий"
Inst5QAH = "15 Заданий"

--QUEST1 Allianz

Inst5Quest1 = "1. Наследие Черного Железа"
Inst5Quest1_Level = "52"
Inst5Quest1_Attain = "48"
Inst5Quest1_Aim = "Убейте Точеня Темностроя и добудьте великий молот, Железный Друг. Отнесите Железного Друга в святилище Тауриссана и вложите его в руки статуи Франклорна Искусника."
Inst5Quest1_Location = "Франклорн Искусник (Черная гора)"
Inst5Quest1_Note = "Франклорн находится в средине горы, над своей могилой, в здании около камня призыва. Вы должны быть мертвы, чтобы увидеть его! Он также дает предыдущее задание в цепочке.\nФиний Темнострой находится около "..YELLOW.."[9]"..WHITE..". Вы найдете Святилище рядом с ареной "..YELLOW.."[7]"..WHITE.."."
Inst5Quest1_Prequest = "Наследие Черного Железа"
Inst5Quest1_Folgequest = "Нет"
--
Inst5Quest1name1 = "Shadowforge Key"

--QUEST2 Allianz

Inst5Quest2 = "2. Риббли Крутипроб"
Inst5Quest2_Level = "53"
Inst5Quest2_Attain = "50"
Inst5Quest2_Aim = "Принесите голову Риббли Юке Крутипроб в Пылающие степи."
Inst5Quest2_Location = "Юка Крутипроб (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,22"..WHITE..")"
Inst5Quest2_Note = "Вы получите предшествующее задание у Юрбы Крутипроба (Танарис - Порт Картеля; "..YELLOW.."67,23"..WHITE..").\nРиббли находится около "..YELLOW.."[15]"..WHITE.."."
Inst5Quest2_Prequest = "Юка Крутипроб"
Inst5Quest2_Folgequest = "Нет"
Inst5Quest2PreQuest = "true"
--
Inst5Quest2name1 = "Rancor Boots"
Inst5Quest2name2 = "Penance Spaulders"
Inst5Quest2name3 = "Splintsteel Armor"

--QUEST3 Allianz

Inst5Quest3 = "3. Приворотное зелье"
Inst5Quest3_Level = "54"
Inst5Quest3_Attain = "50"
Inst5Quest3_Aim = "Принести 4 листа крови Грома, 10 огромных серебряных слитков и наполненный сосуд Нагмары госпоже Нагмаре в Глубины Черной горы."
Inst5Quest3_Location = "Госпожа Нагмара (Глубины Черной Горы, таверна)"
Inst5Quest3_Note = "Получить огромные серебряные слитки можно с Гигантов в Азшаре. Листки крови Грома легко можно найти у травников или на Аукционе. И последнее, сосуд можно наполнить в кратере Го-Лакка (Кратер Ун'Горо; "..YELLOW.."31,50"..WHITE..").\nПосле выполнения задания, вы можете использоать черный ход вместо сражения с Фалангой."
Inst5Quest3_Prequest = "Нет"
Inst5Quest3_Folgequest = "Нет"
--
Inst5Quest3name1 = "Manacle Cuffs"
Inst5Quest3name2 = "Nagmara's Whipping Belt"

--QUEST4 Allianz

Inst5Quest4 = "4. Харли Пьянодых"
Inst5Quest4_Level = "55"
Inst5Quest4_Attain = "?"
Inst5Quest4_Aim = "Найдите украденный рецепт Громопойла и верните его Рагнару Грозовару в Каранос."
Inst5Quest4_Location = "Рагнар Грозовар  (Дун Морог - Каранос; "..YELLOW.."46,52"..WHITE..")"
Inst5Quest4_Note = "Вы возьмете предшествующее задание у Енохи Грозовара (Выжженные земли - Крепость стражей Пустоты; "..YELLOW.."61,18"..WHITE..").\nВы получите рецепт с охранников, которые появятся, если вы уничтожите эль "..YELLOW.."[15]"..WHITE.."."
Inst5Quest4_Prequest = "Рагнар Грозовар"
Inst5Quest4_Folgequest = "Нет"
Inst5Quest4PreQuest = "true"
--
Inst5Quest4name1 = "Dark Dwarven Lager"
Inst5Quest4name2 = "Swiftstrike Cudgel"
Inst5Quest4name3 = "Limb Cleaver"


--QUEST5 Allianz

Inst5Quest5 = "5. Опалитель!"
Inst5Quest5_Attain = "?"
Inst5Quest5_Level = "56"
Inst5Quest5_Aim = "Отыщите и уничтожьте лорда Опалителя в глубинах Черной горы!"
Inst5Quest5_Location = "Джалинда Тирлипунька (Пылающие степи - Дозор Моргана; "..YELLOW.."85,69"..WHITE..")"
Inst5Quest5_Note = "Вы возьмете предшествующее задание также у Джалинды Тирлипуньки. Вы найдете лорда Опалителя около "..YELLOW.."[10]"..WHITE.."."
Inst5Quest5_Prequest = "Подчинитель Пирон"
Inst5Quest5_Folgequest = "Нет"
Inst5Quest5PreQuest = "true"
--
Inst5Quest5name1 = "Sunborne Cape"
Inst5Quest5name2 = "Nightfall Gloves"
Inst5Quest5name3 = "Crypt Demon Bracers"
Inst5Quest5name4 = "Stalwart Clutch"

--QUEST6 Horde

Inst5Quest6 = "6. Сердце горы"
Inst5Quest6_Attain = "50"
Inst5Quest6_Level = "55"
Inst5Quest6_Aim = "Принесите сердце горы Максворту Суперблеску в Пылающие степи."
Inst5Quest6_Location = "Максворт Суперблеск (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,23"..WHITE..")"
Inst5Quest6_Note = "Вы найдете Сердце около "..YELLOW.."[8]"..WHITE.." в сейфе. Вы возьмете ключ от сейфа у сторожа Стиллгисс. Он появляется после открытия всех маленьких сейфов."
Inst5Quest6_Prequest = "Нет"
Inst5Quest6_Folgequest = "Нет"

--QUEST6 Allianz

Inst5Quest7 = "7. Хороший товар"
Inst5Quest7_Attain = "?"
Inst5Quest7_Level = "56"
Inst5Quest7_Aim = "Отправьтесь в глубины Черной горы и принесите 20 поясных сумок дворфов Черного Железа. По выполнению задания вернуться к Орелиусу. Предположительно поясные сумки можно отобрать у дворфов Черного Железа в глубинах Черной горы."
Inst5Quest7_Location = "Орелиус (Пылающие степи - Дозор Моргана; "..YELLOW.."84,68"..WHITE..")"
Inst5Quest7_Note = "Сумки падают со всех дворфов."
Inst5Quest7_Prequest = "Нет"
Inst5Quest7_Folgequest = "Нет"
--
Inst5Quest7name1 = "A Dingy Fanny Pack"

--QUEST7 Allianz

Inst5Quest8 = "8. Маршал Винздор"
Inst5Quest8_Attain = "48"
Inst5Quest8_Level = "54"
Inst5Quest8_Aim = "Отправляйтесь на Черную гору на северо-западе и войдите в Глубины Черной горы. Узнайте, что сталось с маршалом Виндзором.\nКажется, Джон-Оборванец говорил о том, что Виндзора утащили в темницу."
Inst5Quest8_Location = "Маршал Максвелл (Пылающие степи "..YELLOW.."84,68"..WHITE..")"
Inst5Quest8_Note = "Заданиче начинается с Хелендис Речной мыс (Пылающие степи "..YELLOW.."85,68"..WHITE..").\nМаршал Винздор находится около "..YELLOW.."[4]"..WHITE..". После выполнения этого задания, вы должны вернуться к Маршал Максвелл."
Inst5Quest8_Prequest = "Драконья угроза -> Подлинные хозяева"
Inst5Quest8_Folgequest = "Утраченная надежда -> Измятая записка"
Inst5Quest8PreQuest = "true"
--
Inst5Quest8name1 = "Conservator Helm"
Inst5Quest8name2 = "Shieldplate Sabatons"
Inst5Quest8name3 = "Windshear Leggings"

--QUEST8 Allianz

Inst5Quest9 = "9. Измятая записка"
Inst5Quest9_Attain = "51"
Inst5Quest9_Level = "54"
Inst5Quest9_Aim = "Не исключено, что ваша находка заинтересует маршала Виндзора. Может быть, все не так плохо, и надежда еще жива."
Inst5Quest9_Location = "Измятая записка (выпадает) (Глубины Черной горы)"
Inst5Quest9_Note = "Маршал Виндзор около "..YELLOW.."[4]"..WHITE.."."
Inst5Quest9_Prequest = "Маршал Винздор"
Inst5Quest9_Folgequest = "Проблеск надежды"
Inst5Quest9FQuest = "true"

--QUEST9 Allianz

Inst5Quest10 = "10. Проблеск надежды"
Inst5Quest10_Attain = "51"
Inst5Quest10_Level = "58"
Inst5Quest10_Aim = "Верните маршалу Виндзору утерянную информацию.\nМаршал уверен, что информацией завладели повелитель големов Аргелмах и генерал Кузня Гнева."
Inst5Quest10_Location = "Маршал Виндзор (Глубины Черной горы "..YELLOW..""..YELLOW.."[4]"..WHITE..""..WHITE..")"
Inst5Quest10_Note = "Маршал Виндзор около "..YELLOW.."[4]"..WHITE..".\nПовелитель големов Аргелмах "..YELLOW.."[14]"..WHITE..", Генерал Кузня Гнева "..YELLOW.."[13]"..WHITE.."."
Inst5Quest10_Prequest = "Измятая записка"
Inst5Quest10_Folgequest = "Побег!"
Inst5Quest10FQuest = "true"

--QUEST10 Allianz

Inst5Quest11 = "11. Побег!"
Inst5Quest11_Attain = "54"
Inst5Quest11_Level = "58"
Inst5Quest11_Aim = "Помогите маршалу Виндзору забрать вещи и освободить его друзей, после чего вернитесь к маршалу Максвеллу и получите дальнейшие инструкции."
Inst5Quest11_Location = "Маршал Виндзор (Глубины Черной горы "..YELLOW..""..YELLOW.."[4]"..WHITE..""..WHITE..")"
Inst5Quest11_Note = "Маршал Виндзор около "..YELLOW.."[4]"..WHITE..".\nВы найдете маршала Максвелла в Пылающих Степях ("..YELLOW.."84,68"..WHITE..")"
Inst5Quest11_Prequest = "Проблеск надежды"
Inst5Quest11_Folgequest = "Встреча в Штормграде"
Inst5Quest11FQuest = "true"
--
Inst5Quest11name1 = "Ward of the Elements"
Inst5Quest11name2 = "Blade of Reckoning"
Inst5Quest11name3 = "Skilled Fighting Blade"

--QUEST12 Allianz

Inst5Quest12 = "12. Вкус пламени"
Inst5Quest12_Attain = "52"
Inst5Quest12_Level = "58"
Inst5Quest12_Aim = "TОтправьтесь в глубины Черной горы и убейте Бейл'Гора. "..YELLOW.."[11]"..WHITE.." Отнесите пойманную сущность Огня Цирусу Раскаивателю."
Inst5Quest12_Location = "Цирус Раскаиватель (Пылающие Степи "..YELLOW.."94,31"..WHITE..")"
Inst5Quest12_Note = "Задание начинает Каларан Ветрорез (Тлеющее ущелье; 39,38).\nБейл'Гор "..YELLOW.."[11]"..WHITE.."."
Inst5Quest12_Prequest = "Неугасимое пламя -> Вкус пламени"
Inst5Quest12_Folgequest = "Нет"
Inst5Quest12PreQuest = "true"
--
Inst5Quest12name1 = "Shaleskin Cape"
Inst5Quest12name2 = "Wyrmhide Spaulders"
Inst5Quest12name3 = "Valconian Sash"

--QUEST13 Allianz

Inst5Quest13 = "13. 10. Каран Могучий Молот"
Inst5Quest13_Attain = "?"
Inst5Quest13_Level = "59"
Inst5Quest13_Aim = "Пойдите в Глубины Черной горы и найдите Карана Могучего Молота.\nКороль упомянул, что Каран сидит там в плену – может, стоит поискать темницу."
Inst5Quest13_Location = "Король Магни Бронзобород (Стальгорн; "..YELLOW.."39,55"..WHITE..")"
Inst5Quest13_Note = "Предшествующее задание начинается у Королевского историка Аркессонуса (Стальгорн; "..YELLOW.."38,55"..WHITE.."). Каран Могучий Молот находится около "..YELLOW.."[2]"..WHITE.."."
Inst5Quest13_Prequest = "Дымящиеся руины Тауриссана"
Inst5Quest13_Folgequest = "Недобрые вести"
Inst5Quest13PreQuest = "true"

--QUEST14 Allianz

Inst5Quest14 = "14. Судьба королевства"
Inst5Quest14_Attain = "?"
Inst5Quest14_Level = "59"
Inst5Quest14_Aim = "Вернитесь в Глубины Черной горы и освободите принцессу Мойру Бронзобород от злобного императора Даграна Тауриссана."
Inst5Quest14_Location = "Король Магни Бронзобород (Стальгорн; "..YELLOW.."39,55"..WHITE..")"
Inst5Quest14_Note = "Принцесса Мойра Бронзобород находится около "..YELLOW.."[21]"..WHITE..". Во время боя она может лечить Даграна. Постарайтесь по возможности сбивать ей заклинание, но торопитесь, так она не должна умереть или вы провалите задание! После того как поговорите с ней, вы должны вернуться к Магни Бронзобороду."
Inst5Quest14_Prequest = "Недобрые вести"
Inst5Quest14_Folgequest = "Королевский сюрприз"
Inst5Quest14FQuest = "true"
--
Inst5Quest14name1 = "Magni's Will"
Inst5Quest14name2 = "Songstone of Ironforge"

--QUEST15 Allianz

Inst5Quest15 = "15. Сродство с недрами"
Inst5Quest15_Attain = "55"
Inst5Quest15_Level = "60"
Inst5Quest15_Aim = "Отправляйтесь через портал, ведущий к Огненным Недрам в Глубинах Черной горы и добудьте фрагмент ядра. Принесите его Лотосу Хранителю Портала к Черной горе."
Inst5Quest15_Location = "Лотос Хранитель Портала (Черная гора; "..YELLOW.."[2] на карте Входа"..WHITE..")"
Inst5Quest15_Note = "После выполнения задания вы сможете использовать камень ряом с Лотосом Хранителем Портала, чтобы войти в Расплавленные недра.\nВы найдете фрагмент ядра около "..YELLOW.."[23]"..WHITE..", сосем близко от портала в Расплавленные недра."
Inst5Quest15_Prequest = "Нет"
Inst5Quest15_Folgequest = "Нет"

--QUEST1 Horde

Inst5Quest1_HORDE = Inst5Quest1
Inst5Quest1_HORDE_Level = Inst5Quest1_Level
Inst5Quest1_HORDE_Attain = Inst5Quest1_Attain
Inst5Quest1_HORDE_Aim = Inst5Quest1_Aim
Inst5Quest1_HORDE_Location = Inst5Quest1_Location
Inst5Quest1_HORDE_Note = Inst5Quest1_Note
Inst5Quest1_HORDE_Prequest = Inst5Quest1_Prequest
Inst5Quest1_HORDE_Folgequest = Inst5Quest1_Folgequest
--
Inst5Quest1name1_HORDE = "Shadowforge Key"

--QUEST2 Horde

Inst5Quest2_HORDE = Inst5Quest2
Inst5Quest2_HORDE_Level = Inst5Quest2_Level
Inst5Quest2_HORDE_Attain = Inst5Quest2_Attain
Inst5Quest2_HORDE_Aim = Inst5Quest2_Aim
Inst5Quest2_HORDE_Location = Inst5Quest2_Location
Inst5Quest2_HORDE_Note = Inst5Quest2_Note
Inst5Quest2_HORDE_Prequest = Inst5Quest2_Prequest
Inst5Quest2_HORDE_Folgequest = Inst5Quest2_Folgequest
Inst5Quest2PreQuest_HORDE = Inst5Quest2PreQuest
--
Inst5Quest2name1_HORDE = "Rancor Boots"
Inst5Quest2name2_HORDE = "Penance Spaulders"
Inst5Quest2name3_HORDE = "Splintsteel Armor"

--QUEST3 Horde

Inst5Quest3_HORDE = Inst5Quest3
Inst5Quest3_HORDE_Level = Inst5Quest3_Level
Inst5Quest3_HORDE_Attain = Inst5Quest3_Attain
Inst5Quest3_HORDE_Aim = Inst5Quest3_Aim
Inst5Quest3_HORDE_Location = Inst5Quest3_Location
Inst5Quest3_HORDE_Note = Inst5Quest3_Note
Inst5Quest3_HORDE_Prequest = Inst5Quest3_Prequest
Inst5Quest3_HORDE_Folgequest = Inst5Quest3_Folgequest
--
Inst5Quest3name1_HORDE = "Manacle Cuffs"
Inst5Quest3name2_HORDE = "Nagmara's Whipping Belt"

--QUEST 4 Horde

Inst5Quest4_HORDE = "4. Украденный рецепт громопойла"
Inst5Quest4_HORDE_Level = "55"
Inst5Quest4_HORDE_Attain = "50"
Inst5Quest4_HORDE_Aim = "Принести  рецепт светлого громопойла Вивиан Лягроб в Каргат."
Inst5Quest4_HORDE_Location = "Темный маг Вивиан Лягроб (Бесплодные земли - Каргат; "..YELLOW.."2,47"..WHITE..")"
Inst5Quest4_HORDE_Note = "Вы получите предшествующее задание у аптекаря Зинга в Подгороде - Квартал фармацевтов ("..YELLOW.."50,68"..WHITE..").\nВы получите рецепт у одного из охранников, которые появятся, если вы уничтожите эль "..YELLOW.."[15]"..WHITE.."."
Inst5Quest4_HORDE_Prequest = "Вивиан Лягроб"
Inst5Quest4_HORDE_Folgequest = "Нет"
Inst5Quest4PreQuest_HORDE = "true"
--
Inst5Quest4name1_HORDE = "Superior Healing Potion"
Inst5Quest4name2_HORDE = "Greater Mana Potion"
Inst5Quest4name3_HORDE = "Swiftstrike Cudgel"
Inst5Quest4name4_HORDE = "Limb Cleaver"

--QUEST5 Horde

Inst5Quest5_HORDE = "5. Сердце горы"
Inst5Quest5_HORDE_Level = Inst5Quest7_Level
Inst5Quest5_HORDE_Attain = Inst5Quest7_Attain
Inst5Quest5_HORDE_Aim = Inst5Quest7_Aim
Inst5Quest5_HORDE_Location = Inst5Quest7_Location
Inst5Quest5_HORDE_Note = Inst5Quest7_Note
Inst5Quest5_HORDE_Prequest = Inst5Quest7_Prequest
Inst5Quest5_HORDE_Folgequest = Inst5Quest7_Folgequest

--QUEST 6 Horde

Inst5Quest6_HORDE = "6. УНИЧТОЖИТЬ НА МЕСТЕ: Дворфы Черного Железа"
Inst5Quest6_HORDE_Level = "52"
Inst5Quest6_HORDE_Attain = "48"
Inst5Quest6_HORDE_Aim = "Отправляйтесь в Глубины Черной горы и уничтожьте подлых агрессоров! По приказу полководца Клинозуба уничтожьте 15 охранников, 10 надсмотрщиков и 5 пехотинцев из клана Ярости Горна. Вернитесь сразу по выполнении задания."
Inst5Quest6_HORDE_Location = "Доска объявлений (Бесплодные земли - Каргат; "..YELLOW.."3,47"..WHITE..")"
Inst5Quest6_HORDE_Note = "Вы найдете дворфов в первой части Глубин Черной горы.\nВы найдете полководца Клинозуба в Каргате на вершине башни (Бесплодные земли, "..YELLOW.."5,47"..WHITE..")."
Inst5Quest6_HORDE_Prequest = "Нет"
Inst5Quest6_HORDE_Folgequest = "УНИЧТОЖИТЬ НА МЕСТЕ: Высокопоставленные чины Черного Железа"

--QUEST 7 Horde

Inst5Quest7_HORDE = "7. УНИЧТОЖИТЬ НА МЕСТЕ: Высокопоставленные чины Черного Железа"
Inst5Quest7_HORDE_Level = "54"
Inst5Quest7_HORDE_Attain = "50"
Inst5Quest7_HORDE_Aim = "Отправляйтесь в Глубины Черной горы и уничтожьте подлых агрессоров! По приказу полководца Клинозуба уничтожьте 10 медиков, 10 солдат и 10 офицеров из клана Ярости Горна. Вернитесь сразу по выполнении задания."
Inst5Quest7_HORDE_Location = "Доска объявлений (Бесплодные земли - Каргат; "..YELLOW.."3,47"..WHITE..")"
Inst5Quest7_HORDE_Note = "Вы найдете дворфов около Бейл'Гор "..YELLOW.."[11]"..WHITE..". Вы найдете полководца Клинозуба в Каргате на вершине башни (Бесплодные земли, "..YELLOW.."5,47"..WHITE..").\n Последующее задание начинается у Лекслорта (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE.."). Вы найдете Грарка в Пылающих степях ("..YELLOW.."38,35"..WHITE.."). Вы должны опустить его ХП ниже 50%, чтобы начать задание сопровождения."
Inst5Quest7_HORDE_Prequest = "УНИЧТОЖИТЬ НА МЕСТЕ: Дворфы Черного Железа"
Inst5Quest7_HORDE_Folgequest = "Грарк Лоркруб -> Опасное положение (Задание сопровождения)"
Inst5Quest7FQuest_HORDE = "true"

--QUEST 8 Horde

Inst5Quest8_HORDE = "8. Операция: Смерть Кузне Гнева"
Inst5Quest8_HORDE_Level = "58"
Inst5Quest8_HORDE_Attain = "55"
Inst5Quest8_HORDE_Aim = "Отправляйтесь в Глубины Черной горы и убейте генерала Кузню Гнева. Вернитесь к полководцу Клинозубу по выполнении задания."
Inst5Quest8_HORDE_Location = "Полководец Клинозуб (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE..")"
Inst5Quest8_HORDE_Note = "Вы найдете генерала Кузню Гнева около "..YELLOW.."[13]"..WHITE..". Он зовет подкрепление когда ХП ниже 30%!"
Inst5Quest8_HORDE_Prequest = "Опасное положение"
Inst5Quest8_HORDE_Folgequest = "Нет"
Inst5Quest8FQuest_HORDE = "true"
--
Inst5Quest8name1_HORDE = "Conqueror's Medallion"

--QUEST 5 Horde

Inst5Quest9_HORDE = "9. Восстание машин"
Inst5Quest9_HORDE_Level = "58"
Inst5Quest9_HORDE_Attain = "?"
Inst5Quest9_HORDE_Aim = "Найдите и убейте повелителя големов Аргелмаха. Принесите его голову Лотвилу. Также соберите 10 невредимых ядер стихий с беспощадных големов и созданий-завоевателей, охраняющих Аргелмаха. Информация передана посредством телепатии."
Inst5Quest9_HORDE_Location = "Лотвиль Вериатус (Бесплодные земли; "..YELLOW.."25,44"..WHITE..")"
Inst5Quest9_HORDE_Note = "Вы возьмете предшествуещее задание у  Верховной Жрицы Теодоры Мальвадании (Бесплодные земли - Каргат; "..YELLOW.."3,47"..WHITE..").\nВы найдете Аргелмаха около "..YELLOW.."[14]"..WHITE.."."
Inst5Quest9_HORDE_Prequest = "Восстание машин"
Inst5Quest9_HORDE_Folgequest = "Нет"
Inst5Quest9PreQuest_HORDE = "true"
--
Inst5Quest9name1_HORDE = "Azure Moon Amice"
Inst5Quest9name2_HORDE = "Raincaster Drape"
Inst5Quest9name3_HORDE = "Basaltscale Armor"
Inst5Quest9name4_HORDE = "Lavaplate Gauntlets"


--QUEST13 Horde

Inst5Quest10_HORDE = "10. Вкус Пламени"
Inst5Quest10_HORDE_Level = Inst5Quest9_Level
Inst5Quest10_HORDE_Attain = Inst5Quest9_Attain
Inst5Quest10_HORDE_Aim = Inst5Quest9_Aim
Inst5Quest10_HORDE_Location = Inst5Quest9_Location
Inst5Quest10_HORDE_Note = Inst5Quest9_Note
Inst5Quest10_HORDE_Prequest = Inst5Quest9_Prequest
Inst5Quest10_HORDE_Folgequest = Inst5Quest9_Folgequest
Inst5Quest10PreQuest_HORDE = Inst5Quest9PreQuest
--
Inst5Quest10name1_HORDE = "Shaleskin Cape"
Inst5Quest10name2_HORDE = "Wyrmhide Spaulders"
Inst5Quest10name3_HORDE = "Valconian Sash"

--QUEST 11 Horde

Inst5Quest11_HORDE = "11. Дисгармония пламени"
Inst5Quest11_HORDE_Level = "56"
Inst5Quest11_HORDE_Attain = "?"
Inst5Quest11_HORDE_Aim = "Отправляйтесь в карьер у Черной горы и уничтожьте Подчинителя Пирона. По выполнению вернитесь к Громосерду."
Inst5Quest11_HORDE_Location = "Громосерд (Бесплодные земли - Каргат; "..YELLOW.."3,48"..WHITE..")"
Inst5Quest11_HORDE_Note = "Подчинитель Пирон - это огненный элементаль снаружи подземелья. Он находится около "..YELLOW.."[24]"..WHITE.." на карте Глубин Черной горы и около "..YELLOW.."[1]"..WHITE.." на карте входа Черной горы."
Inst5Quest11_HORDE_Prequest = "Нет"
Inst5Quest11_HORDE_Folgequest = "Дисгармония пламени"
Inst5Quest11PreQuest_HORDE = "true"
--
Inst5Quest11name1_HORDE = "Sunborne Cape"
Inst5Quest11name2_HORDE = "Nightfall Gloves"
Inst5Quest11name3_HORDE = "Crypt Demon Bracers"
Inst5Quest11name4_HORDE = "Stalwart Clutch"

--QUEST 12 Horde

Inst5Quest12_HORDE = "12. Последняя стихия"
Inst5Quest12_HORDE_Level = "54"
Inst5Quest12_HORDE_Attain = "?"
Inst5Quest12_HORDE_Aim = "Отправляйтесь в Глубины Черной горы и добудьте 10 мер сущности стихий. Стоит начать поиски с големов и их создателей. Вивиан Лаграв также бормотала что-то про элементалей."
Inst5Quest12_HORDE_Location = "Темный маг Вивиана Лягроб (Бесплодные земли - Каргат; "..YELLOW.."2,47"..WHITE..")"
Inst5Quest12_HORDE_Note = "Вы получите предшествующее задание у Громосерда (Бесплодные земли - Каргат; "..YELLOW.."3,48"..WHITE..").\n С каждого элементаля может выпасть сущность стихий"
Inst5Quest12_HORDE_Prequest = "Дисгармония пламени"
Inst5Quest12_HORDE_Folgequest = "Нет"
Inst5Quest12PreQuest_HORDE = "true"
--
Inst5Quest12name1_HORDE = "Lagrave's Seal"

--QUEST 8 Horde

Inst5Quest13_HORDE = "13.Командир Гор'шак"
Inst5Quest13_HORDE_Attain = "?"
Inst5Quest13_HORDE_Level = "52"
Inst5Quest13_HORDE_Aim = "Найдите командира Гор'шака в Глубинах Черной горы.\nСудя по рисунку в записке, искать следует в темнице где-то вроде того."
Inst5Quest13_HORDE_Location = "Гамалав Стрелок (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE..")"
Inst5Quest13_HORDE_Note = "Вы получите предшествующее задание у Громосерда (Бесплодные земли - Каргат; "..YELLOW.."3,48"..WHITE..").\nВы найдете командира Гор'шака около "..YELLOW.."[3]"..WHITE..". Ключ, чтобы открыть камеру, пдает с Веровного Дознавателя Герштаны "..YELLOW.."[5]"..WHITE..". Если вы поговорите с ним, начнется следующее задание и появятся враги."
Inst5Quest13_HORDE_Prequest = "Дисгармония пламени"
Inst5Quest13_HORDE_Folgequest = "Что происходит?"
Inst5Quest13PreQuest_HORDE = "true"


--QUEST14 Horde

Inst5Quest14_HORDE = "14. Спасение принцессы"
Inst5Quest14_HORDE_Attain = "51"
Inst5Quest14_HORDE_Level = "59"
Inst5Quest14_HORDE_Aim = "Убейте императора Даграна Тауриссана и освободите принцессу Мойру Бронзобород от его черного заклятия."
Inst5Quest14_HORDE_Location = "Тралл (Оргриммар; "..YELLOW.."31,37"..WHITE..")"
Inst5Quest14_HORDE_Note = "После того, как вы поговорите с Караном Могучим Молотом и Траллом, вы получите это задание.\nВы найдете императора Даграна Тауриссана около "..YELLOW.."[21]"..WHITE..". Во время боя принцесса может лечить Даграна. Постарайтесь по возможности сбивать ей заклинание, но торопитесь, так она не должна умереть или вы провалите задание! (Награда за Спасенная принцесса)"
Inst5Quest14_HORDE_Prequest = "Командир Гор'шак"
Inst5Quest14_HORDE_Folgequest = "Спасенная принцесса"
Inst5Quest14FQuest_HORDE = "true"
--
Inst5Quest14name1_HORDE = "Thrall's Resolve"
Inst5Quest14name2_HORDE = "Eye of Orgrimmar"

--QUEST15 Horde

Inst5Quest15_HORDE = "15. Сродство с недрами"
Inst5Quest15_HORDE_Attain = Inst5Quest15_Attain
Inst5Quest15_HORDE_Level = Inst5Quest15_Level
Inst5Quest15_HORDE_Aim = Inst5Quest15_Aim
Inst5Quest15_HORDE_Location = Inst5Quest15_Location
Inst5Quest15_HORDE_Note = Inst5Quest15_Note
Inst5Quest15_HORDE_Prequest = Inst5Quest15_Prequest
Inst5Quest15_HORDE_Folgequest = Inst5Quest15_Folgequest

--------------Inst8 / lower blackrock spier ------------

Inst8Story = "Эта величественная крепость, возведенная в пылающих недрах Черной горы, была спроектирована талантливым дворфом-каменщиком Франклорном Искусником как символ могущества клана Черного Железа. Многие столетия злобные дворфы безраздельно правили в крепости, пока на нее не положил глаз Нефариан – коварный сын дракона-аспекта Смертокрыла. Вместе со своими прислужниками Нефариан захватил шпиль крепости и объявил войну дворфам, скрывающимся в вулканических глубинах. Пока дракон проводит свои зловещие эксперименты в своем логове, генералы его огромной армии, включая вождя черной Орды Ренда Чернорука, охраняют подступы к шпилю. Зловещие порождения Нефариана расползаются повсюду от пика Черной горы, и так будет продолжаться, пока крепость не падет."
Inst8Caption = "Вершины Черной горы (Нижний)"
Inst8QAA = "10 Заданий"
Inst8QAH = "10 Заданий"

--Quest1 Allianz

Inst8Quest1 = "1. Последние таблички"
Inst8Quest1_Level = "58"
Inst8Quest1_Attain = "56"
Inst8Quest1_Aim = "Принесите пятую и шестую таблички Мошару геологу Железному Башмаку в Танарисе."
Inst8Quest1_Location = "Геолог Железный Башмак (Танарис - Порт Картеля; "..YELLOW.."66,23"..WHITE..")"
Inst8Quest1_Note = "Вы найдете таблички около "..YELLOW.."[4]"..WHITE.." и "..YELLOW.."[5]"..WHITE..".\nНаграда переводит на 'Сопротивление Йекинье'. вы найдете Йе'кинья около геолога Железного Башмака."
Inst8Quest1_Prequest = "Утраченные таблички Мошару"
Inst8Quest1_Folgequest = "Сопротивление Йекинье"

--Quest2 Allianz

Inst8Quest2 = "2. Редкие звери Киблера"
Inst8Quest2_Level = "59"
Inst8Quest2_Attain = "55"
Inst8Quest2_Aim = "Отправьтесь на пик Черной горы и отыщите там щенков воргов легиона Кровавого Топора. Посадите маленьких тварей в клетку и отнесите Киблеру."
Inst8Quest2_Location = "Киблер (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,22"..WHITE..")"
Inst8Quest2_Note = "Вы найдете щенков ворга около "..YELLOW.."[10]"..WHITE.."."
Inst8Quest2_Prequest = "Нет"
Inst8Quest2_Folgequest = "Нет"

--Quest3 Allianz

Inst8Quest3 = "3. Товар на любителя"
Inst8Quest3_Level = "59"
Inst8Quest3_Attain = "55"
Inst8Quest3_Aim = "Отправьтесь на пик Черной горы и принесите Киблеру 15 яиц скального паука."
Inst8Quest3_Location = "Киблер (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,22"..WHITE..")"
Inst8Quest3_Note = "Вы найдете яйца пауков около "..YELLOW.."[6]"..WHITE.."."
Inst8Quest3_Prequest = "Нет"
Inst8Quest3_Folgequest = "Нет"

--Quest4 Allianz

Inst8Quest4 = "4. Материнское молоко"
Inst8Quest4_Level = "60"
Inst8Quest4_Attain = "?"
Inst8Quest4_Aim = "Найдите в самом сердце пика Черной горы мать Дымную Паутину. Сражайтесь с ней, пока она не введет вам свой яд. Скорее всего ее также придется убить. Когда яд будет в вас, вернитесь к Джону-Оборванцу, чтобы он смог добыть яд."
Inst8Quest4_Location = "Джон-Оборванец (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,23"..WHITE..")"
Inst8Quest4_Note = "Мать Дымная Паутина находится около "..YELLOW.."[6]"..WHITE..". Яд также поражает ближаиших игроков. Если яд вылечить, вы провалите задание."
Inst8Quest4_Prequest = "Нет"
Inst8Quest4_Folgequest = "Нет"

--Quest5 Allianz

Inst8Quest5 = "5. Устранение опасности"
Inst8Quest5_Level = "59"
Inst8Quest5_Attain = "?"
Inst8Quest5_Aim = "Отправьтесь на пик Черной горы и уничтожьте источник опасности. Хелендис кричит вам вслед одно имя: Халикон. Именно его упоминали орки в связи с воргами."
Inst8Quest5_Location = "Хелендис Речной Мыс (Пылающие степи - Дозор Моргана; "..YELLOW.."5,47"..WHITE..")"
Inst8Quest5_Note = "Вы найдете Халикон около "..YELLOW.."[10]"..WHITE.."."
Inst8Quest5_Prequest = "Нет"
Inst8Quest5_Folgequest = "Нет"

--Quest6 Allianz

Inst8Quest6 = "6. Аррок Смертный Вопль"
Inst8Quest6_Level = "59"
Inst8Quest6_Attain = "?"
Inst8Quest6_Aim = "Прочитать записку Вароша. Принести Варошу его амулет."
Inst8Quest6_Location = "Варош (Вершина Черной горы; "..YELLOW.."[2]"..WHITE..")"
Inst8Quest6_Note = "Чтобы получить амулет Вароша нужно вызвать и убить Аррока Смертного Вопля "..YELLOW.."[8]"..WHITE..". Для Вызова понадобится Копье и голова вождя Омокка "..YELLOW.."[3]"..WHITE..". Копье находится около "..YELLOW.."[2]"..WHITE..". Во время Вызова появляется несколько волн огров, перед тем как вас атакует Аррок Смертный Вопль. Вы можете использовать Копье в бою, чтобы наносить урон ограм."
Inst8Quest6_Prequest = "Нет"
Inst8Quest6_Folgequest = "Нет"

--Quest7 Allianz

Inst8Quest7 = "7. Вещи Блестяшки"
Inst8Quest7_Level = "59"
Inst8Quest7_Attain = "55"
Inst8Quest7_Aim = "Найдите вещи Блестяшки и верните их владелице. Блестяшка сказала, что она спрятала свое оборудование где-то на нижнем ярусе подземелья."
Inst8Quest7_Location = "Блестяшка (Вершина Черной горы; "..YELLOW.."[1] "..WHITE.."и"..YELLOW.." [2]"..WHITE..")"
Inst8Quest7_Note = "Вы найдете вещи Блестяшки по пути к Матери Дымной Паутине около "..YELLOW.."[10]"..WHITE..".\nМаксвелл находится около (Пылающие степи - Дозор Моргана; "..YELLOW.."84,58"..WHITE..")."
Inst8Quest7_Prequest = "Нет"
Inst8Quest7_Folgequest = "Донесение Максвелла"

--Quest8 Allianz

Inst8Quest8 = "8. Миссия Максвелла"
Inst8Quest8_Level = "59"
Inst8Quest8_Attain = "?"
Inst8Quest8_Aim = "Отправляйтесь на пик Черной горы и устраните воеводу Вуна, вождя Омокка и повелителя Змейталака. По выполнении задания вернитесь к маршалу Максвеллу."
Inst8Quest8_Location = "Маршал Максвелл (Пылающие степи - Дозор Моргана; "..YELLOW.."84,58"..WHITE..")"
Inst8Quest8_Note = "Вы найдете воеводу Вуна около "..YELLOW.."[5]"..WHITE..", вождя Омокка около "..YELLOW.."[3]"..WHITE.." и повелителя Змейталака около "..YELLOW.."[11]"..WHITE.."."
Inst8Quest8_Prequest = "Донесение Максвелла"
Inst8Quest8_Folgequest = "Нет"

--Quest9 Allianz

Inst8Quest9 = "9. Печать Вознесения"
Inst8Quest9_Level = "60"
Inst8Quest9_Attain = "57"
Inst8Quest9_Aim = "Найдите самоцвет Тлеющего Терновника, самоцвет Черной Вершины и самоцвет Кровавого Топора. Верните их Ваелану вместе с заготовкой для печати Вознесения."
Inst8Quest9_Location = "Ваелан (Вершина Черной горы; "..YELLOW.."[1]"..WHITE..")"
Inst8Quest9_Note = "Вы получите самоцвет Черной вершины с вождя Омокка "..YELLOW.."[3]"..WHITE..", самоцвет Тлеющего Терновника с воеводы Вуна около "..YELLOW.."[5]"..WHITE.." самоцвет Кровавого Топора с повелителя Змейталака около "..YELLOW.."[11]"..WHITE..". Простая печать Вознесения может упасть с любого врага в Нижнем ярусе Вершины Черной горы. Если вы закончите эту цепочку заданий, то получите ключ к Верхнему ярусу Вершины Черной горы."
Inst8Quest9_Prequest = "Нет"
Inst8Quest9_Folgequest = "Печать Вознесения"

--Quest10 Allianz

Inst8Quest10 = "10. Приказ генерала Драккисата"
Inst8Quest10_Level = "60"
Inst8Quest10_Attain = "55"
Inst8Quest10_Aim = "Отнести приказ генерала Драккисата маршалу Максвеллу в Пылающие степи."
Inst8Quest10_Location = "Приказ генерала Драккисата (падает с повелителя Змейталака; "..YELLOW.."[11]"..WHITE..")"
Inst8Quest10_Note = "Маршал Максвелл находится в Пылающие степи - Дозор Моргана; ("..YELLOW.."84,58"..WHITE..")."
Inst8Quest10_Prequest = "Нет"
Inst8Quest10_Folgequest = "Кончина генерала Драккисата ("..YELLOW.."Верхний ярус Вершины Черной горы"..WHITE..")"


--Quest1 Horde

Inst8Quest1_HORDE = Inst8Quest1
Inst8Quest1_HORDE_Level = Inst8Quest1_Level
Inst8Quest1_HORDE_Attain = Inst8Quest1_Attain
Inst8Quest1_HORDE_Aim = Inst8Quest1_Aim
Inst8Quest1_HORDE_Location = Inst8Quest1_Location
Inst8Quest1_HORDE_Note = Inst8Quest1_Note
Inst8Quest1_HORDE_Prequest = Inst8Quest1_Prequest
Inst8Quest1_HORDE_Folgequest = Inst8Quest1_Folgequest
Inst8Quest1PreQuest_HORDE = Inst8Quest1PreQuest

--Quest2 Horde

Inst8Quest2_HORDE = Inst8Quest2
Inst8Quest2_HORDE_Level = Inst8Quest2_Level
Inst8Quest2_HORDE_Attain = Inst8Quest2_Attain
Inst8Quest2_HORDE_Aim = Inst8Quest2_Aim
Inst8Quest2_HORDE_Location = Inst8Quest2_Location
Inst8Quest2_HORDE_Note = Inst8Quest2_Note
Inst8Quest2_HORDE_Prequest = Inst8Quest2_Prequest
Inst8Quest2_HORDE_Folgequest = Inst8Quest2_Folgequest

--Quest3 Horde

Inst8Quest3_HORDE = Inst8Quest3
Inst8Quest3_HORDE_Level = Inst8Quest3_Level
Inst8Quest3_HORDE_Attain = Inst8Quest3_Attain
Inst8Quest3_HORDE_Aim = Inst8Quest3_Aim
Inst8Quest3_HORDE_Location = Inst8Quest3_Location
Inst8Quest3_HORDE_Note = Inst8Quest3_Note
Inst8Quest3_HORDE_Prequest = Inst8Quest3_Prequest
Inst8Quest3_HORDE_Folgequest = Inst8Quest3_Folgequest

--Quest4 Horde

Inst8Quest4_HORDE = Inst8Quest4
Inst8Quest4_HORDE_Level = Inst8Quest4_Level
Inst8Quest4_HORDE_Attain = Inst8Quest4_Attain
Inst8Quest4_HORDE_Aim = Inst8Quest4_Aim
Inst8Quest4_HORDE_Location = Inst8Quest4_Location
Inst8Quest4_HORDE_Note = Inst8Quest4_Note
Inst8Quest4_HORDE_Prequest = Inst8Quest4_Prequest
Inst8Quest4_HORDE_Folgequest = Inst8Quest4_Folgequest

--Quest5 Horde

Inst8Quest5_HORDE = "5. Праматерь стаи"
Inst8Quest5_HORDE_Level = "59"
Inst8Quest5_HORDE_Attain = "?"
Inst8Quest5_HORDE_Aim = "Убейте Халикон, праматерь стаи воргов Кровавого Топора."
Inst8Quest5_HORDE_Location = "Галамав Стрелок (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE..")"
Inst8Quest5_HORDE_Note = "Вы найдете Халикон около "..YELLOW.."[10]"..WHITE.."."
Inst8Quest5_HORDE_Prequest = "Нет"
Inst8Quest5_HORDE_Folgequest = "Нет"

--Quest6 Horde

Inst8Quest6_HORDE = Inst8Quest6
Inst8Quest6_HORDE_Level = Inst8Quest6_Level
Inst8Quest6_HORDE_Attain = Inst8Quest6_Attain
Inst8Quest6_HORDE_Aim = Inst8Quest6_Aim
Inst8Quest6_HORDE_Location = Inst8Quest6_Location
Inst8Quest6_HORDE_Note = Inst8Quest6_Note
Inst8Quest6_HORDE_Prequest = Inst8Quest6_Prequest
Inst8Quest6_HORDE_Folgequest = Inst8Quest6_Folgequest

--Quest7 Horde

Inst8Quest7_HORDE = "7. Агент Блестяшка"
Inst8Quest7_HORDE_Level = "59"
Inst8Quest7_HORDE_Attain = "?"
Inst8Quest7_HORDE_Aim = "Отправьтесь к пику Черной горы и выясните, что сталось с Блестяшкой."
Inst8Quest7_HORDE_Location = "Лекслорт (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE..")"
Inst8Quest7_HORDE_Note = "Вы найдете Блестяшку около "..YELLOW.."[1] "..WHITE.."и "..YELLOW.."[2]"..WHITE.."."
Inst8Quest7_HORDE_Prequest = "Нет"
Inst8Quest7_HORDE_Folgequest = "Вещи Блестяшки"

--Quest8 Horde

Inst8Quest8_HORDE = "8. Вещи Блестяшки"
Inst8Quest8_HORDE_Level = "59"
Inst8Quest8_HORDE_Attain = "?"
Inst8Quest8_HORDE_Aim = "Найдите вещи Блестяшки и верните их владелице. Блестяшка сказала, что она спрятала свое оборудование где-то на нижнем ярусе подземелья."
Inst8Quest8_HORDE_Location = "Блестяшка (Вершина Черной горы; "..YELLOW.."[3]"..WHITE..")"
Inst8Quest8_HORDE_Note = "Вы найдете вещи Блестяшки по пути к Матери Дымной Паутине около "..YELLOW.."[6]"..WHITE..".\nНаграда отправляет к 'По данным разведки'."
Inst8Quest8_HORDE_Prequest = "Агент Блестяшка"
Inst8Quest8_HORDE_Folgequest = "По данным разведки"

--Quest9 Horde

Inst8Quest9_HORDE = Inst8Quest9
Inst8Quest9_HORDE_Level = Inst8Quest9_Level
Inst8Quest9_HORDE_Attain = Inst8Quest9_Attain
Inst8Quest9_HORDE_Aim = Inst8Quest9_Aim
Inst8Quest9_HORDE_Location = Inst8Quest9_Location
Inst8Quest9_HORDE_Note = Inst8Quest9_Note
Inst8Quest9_HORDE_Prequest = Inst8Quest9_Prequest
Inst8Quest9_HORDE_Folgequest = Inst8Quest9_Folgequest

--Quest10 Horde

Inst8Quest10_HORDE = "10. Приказ полководца"
Inst8Quest10_HORDE_Level = "60"
Inst8Quest10_HORDE_Attain = "55"
Inst8Quest10_HORDE_Aim = "Убейте вождя Омокка, воеводу Вуна и повелителя Змейталака. Найденные при них важные бумаги Черной горы доставьте полководцу Клинозубу в Каргат."
Inst8Quest10_HORDE_Location = "Полководец Клинозуб (Бесплодные земли - Каргат; "..YELLOW.."65,22"..WHITE..")"
Inst8Quest10_HORDE_Note = "Подготовка к Ониксии.\nВождь Омокк находится около "..YELLOW.."[3]"..WHITE..", воевода Вун находится около "..YELLOW.."[5]"..WHITE.." и повелитель Змейталака "..YELLOW.."[11]"..WHITE..". Важные бумаги Черной горы могут остаться после одного из этих 3 боссов."
Inst8Quest10_HORDE_Prequest = "Нет"
Inst8Quest10_HORDE_Folgequest = "Мудрость Эйтригга -> За Орду! ("..YELLOW.."Верхний ярус Глубин Черной горы"..WHITE..")"


--------------Inst9 / UBRS/upper blackrock spier ------------

Inst9Story = "Эта величественная крепость, возведенная в пылающих недрах Черной горы, была спроектирована талантливым дворфом-каменщиком Франклорном Искусником как символ могущества клана Черного Железа. Многие столетия злобные дворфы безраздельно правили в крепости, пока на нее не положил глаз Нефариан – коварный сын дракона-аспекта Смертокрыла. Вместе со своими прислужниками Нефариан захватил шпиль крепости и объявил войну дворфам, скрывающимся в вулканических глубинах. Пока дракон проводит свои зловещие эксперименты в своем логове, генералы его огромной армии, включая вождя черной Орды Ренда Чернорука, охраняют подступы к шпилю. Зловещие порождения Нефариана расползаются повсюду от пика Черной горы, и так будет продолжаться, пока крепость не падет."
Inst9Caption = "Вершины Черной горы (Верхний)"
Inst9QAA = "8 Заданий"
Inst9QAH = "9 Заданий"

--Quest1 Allianz

Inst9Quest1 = "1. Матрона-защитница"
Inst9Quest1_Level = "60"
Inst9Quest1_Attain = "57"
Inst9Quest1_Aim = "Добраться до Зимних Ключей и найти Халех. Отдать ей пластину чешуи Ауби."
Inst9Quest1_Location = "Ауби (Вершина Черной горы; "..YELLOW.."[6]"..WHITE..")"
Inst9Quest1_Note = "Вы найдете Ауби в комнате за Ареной около "..YELLOW.."[6]"..WHITE..".\nХалех находится в Зимних Ключах ("..YELLOW.."54,51"..WHITE.."). Используйте знак-портал в конце пещеры, чтобы добраться до нее."
Inst9Quest1_Prequest = "Нет"
Inst9Quest1_Folgequest = "Ярость Синих драконов"

--Quest2 Allianz

Inst9Quest2 = "2. Айс Вентурон, к вашим услугам!"
Inst9Quest2_Level = "60"
Inst9Quest2_Attain = "?"
Inst9Quest2_Aim = "Переговорить с Малифоем Черномолотом в Круговзоре."
Inst9Quest2_Location = "Айс Вентурон (Вершина Черной горы; "..YELLOW.."[7]"..WHITE..")"
Inst9Quest2_Note = "Айс Вентурон появляется после свежевания Зверя. Вы найдете Малифоя в (Зимние Ключи - Круговзор; "..YELLOW.."61,38"..WHITE..")."
Inst9Quest2_Prequest = "Нет"
Inst9Quest2_Folgequest = "Поножи Аркана, Шапка Алого Ученого, Кираса кровавой жажды"

--Quest3 Allianz

Inst9Quest3 = "3. Заморозка яйца"
Inst9Quest3_Level = "60"
Inst9Quest3_Attain = "?"
Inst9Quest3_Aim = "Испытайте прототип яйцехладоскопа на одном из яиц в Гнездовье."
Inst9Quest3_Location = "Тинки Кипеллер (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,24"..WHITE..")"
Inst9Quest3_Note = "Вы найдете яйца в комнате Отца Пламени около "..YELLOW.."[2]"..WHITE.."."
Inst9Quest3_Prequest = "Сущность детеныша дракона -> Тинки Кипеллер"
Inst9Quest3_Folgequest = "Леонид Барталомей -> Рассветный гамбит ("..YELLOW.."Некроситет"..WHITE..")"

--Quest4 Allianz

Inst9Quest4 = "4. Око Углеглаза"
Inst9Quest4_Level = "60"
Inst9Quest4_Attain = "60"
Inst9Quest4_Aim = "Принесите глаз Созерцателя Углей герцогу Гидраксису в Азшару."
Inst9Quest4_Location = "Герцог Гидраксис (Азшара; "..YELLOW.."79,73"..WHITE..")"
Inst9Quest4_Note = "Вы найдете Пиростраж Созерцатель Углей около "..YELLOW.."[1]"..WHITE.."."
Inst9Quest4_Prequest = "Отравленная вода"
Inst9Quest4_Folgequest = "Огненные Недра"

--Quest5 Allianz

Inst9Quest5 = "5. Кончина генерала Драккисата"
Inst9Quest5_Level = "60"
Inst9Quest5_Attain = "55"
Inst9Quest5_Aim = "Отправьтесь на пик Черной Скалы и устраните генерала Драккисата. По выполнении задания вернитесь к маршалу Максвеллу."
Inst9Quest5_Location = "Маршал Максвелл (Пылающие степи - Дозор Моргана; "..YELLOW.."82,68"..WHITE..")"
Inst9Quest5_Note = "Вы найдете генерала Драккисата около "..YELLOW.."[8]"..WHITE.."."
Inst9Quest5_Prequest = "Приказ генерала Драккисата ("..YELLOW.."Нижний ярус Вершины Черной горы"..WHITE..")"
Inst9Quest5_Folgequest = "Нет"

--Quest6 Allianz

Inst9Quest6 = "6. Пряжка Роковой оснастки"
Inst9Quest6_Level = "60"
Inst9Quest6_Attain = "57"
Inst9Quest6_Aim = "Принесите пряжку Роковой оснастки Майре Светлое Крыло в Пылающие степи."
Inst9Quest6_Location = "Майра Светлое Крыло (Пылающие степи - Дозор Моргана; "..YELLOW.."84,69"..WHITE..")"
Inst9Quest6_Note = "Вы возьмете предшествующее задание у графа Ремингтона Риджвелла (Штормград - Крепость Штормграда; "..YELLOW.."76.9, 47.4"..WHITE..").\n\nПряжка Роковой оснастки находится около "..YELLOW.."[2]"..WHITE.." с сундуке."
Inst9Quest6_Prequest = "Майра Светлое Крыло"
Inst9Quest6_Folgequest = "Доставить Риджвеллу"

--Quest7 Allianz

Inst9Quest7 = "7. Амулет Пламени дракона"
Inst9Quest7_Attain = "53"
Inst9Quest7_Level = "60"
Inst9Quest7_Aim = "Добудьте кровь могучего черного дракона генерала Драккисата, которого можно найти сидящим на троне в залах Вознесения на Вершине Черной горы."
Inst9Quest7_Location = "Хале (Зимние Ключи; "..YELLOW.."54,51"..WHITE..")"
Inst9Quest7_Note = "Последний из цепочки заданий на доступ к Логову Ониксии для Альянса\nГенерал Драккисат "..YELLOW.."[8]"..WHITE.."."
Inst9Quest7_Prequest = "Око дракона"
Inst9Quest7_Folgequest = "Нет"

--Quest8 Alliance

Inst9Quest8 = "8. Приказ Чернорука"
Inst9Quest8_Level = "60"
Inst9Quest8_Attain = "60"
Inst9Quest8_Aim = "В письме ясно сказано, что генерал Драккисат охраняет клеймо. Наверное, стоит проверить."
Inst9Quest8_Location = "Приказ Чернорука (падает с Интенданта из легиона Изрубленного Щита)"
Inst9Quest8_Note = "Задание для подготовки к Логову Крыла Тьмы. Интенданта из легиона Изрубленного Щита можно найти если повернуть направо перед порталом в LBRS/UBRS.\n\nГенерал Драккисат находится около "..YELLOW.."[8]"..WHITE..". Печать за ним."
Inst9Quest8_Prequest = "Нет"
Inst9Quest8_Folgequest = "Нет"

--Quest1 Horde

Inst9Quest1_HORDE = Inst9Quest1
Inst9Quest1_HORDE_Level = Inst9Quest1_Level
Inst9Quest1_HORDE_Attain = Inst9Quest1_Attain
Inst9Quest1_HORDE_Aim = Inst9Quest1_Aim
Inst9Quest1_HORDE_Location = Inst9Quest1_Location
Inst9Quest1_HORDE_Note = Inst9Quest1_Note
Inst9Quest1_HORDE_Prequest = Inst9Quest1_Prequest
Inst9Quest1_HORDE_Folgequest = Inst9Quest1_Folgequest

--Quest2 Horde

Inst9Quest2_HORDE = Inst9Quest2
Inst9Quest2_HORDE_Level = Inst9Quest2_Level
Inst9Quest2_HORDE_Attain = Inst9Quest2_Attain
Inst9Quest2_HORDE_Aim = Inst9Quest2_Aim
Inst9Quest2_HORDE_Location = Inst9Quest2_Location
Inst9Quest2_HORDE_Note = Inst9Quest2_Note
Inst9Quest2_HORDE_Prequest = Inst9Quest2_Prequest
Inst9Quest2_HORDE_Folgequest = Inst9Quest2_Folgequest

--Quest3 Horde

Inst9Quest3_HORDE = Inst9Quest3
Inst9Quest3_HORDE_Level = Inst9Quest3_Level
Inst9Quest3_HORDE_Attain = Inst9Quest3_Attain
Inst9Quest3_HORDE_Aim = Inst9Quest3_Aim
Inst9Quest3_HORDE_Location = Inst9Quest3_Location
Inst9Quest3_HORDE_Note = Inst9Quest3_Note
Inst9Quest3_HORDE_Prequest = Inst9Quest3_Prequest
Inst9Quest3_HORDE_Folgequest = Inst9Quest3_Folgequest
Inst9Quest3PreQuest_HORDE = Inst9Quest3PreQuest

--Quest4 Horde

Inst9Quest4_HORDE = Inst9Quest4
Inst9Quest4_HORDE_Level = Inst9Quest4_Level
Inst9Quest4_HORDE_Attain = Inst9Quest4_Attain
Inst9Quest4_HORDE_Aim = Inst9Quest4_Aim
Inst9Quest4_HORDE_Location = Inst9Quest4_Location
Inst9Quest4_HORDE_Note = Inst9Quest4_Note
Inst9Quest4_HORDE_Prequest = Inst9Quest4_Prequest
Inst9Quest4_HORDE_Folgequest = Inst9Quest4_Folgequest
Inst9Quest4PreQuest_HORDE = Inst9Quest4PreQuest

--Quest5 Horde

Inst9Quest5_HORDE = "5. Табличка Темнокамня"
Inst9Quest5_HORDE_Level = "60"
Inst9Quest5_HORDE_Attain = "57"
Inst9Quest5_HORDE_Aim = "Принести табличку Темного Камня тенемагу Вивиан Лаграв в Каргат."
Inst9Quest5_HORDE_Location = "Вивиан ЛяГроб (Бесплодные земли - Каргат; "..YELLOW.."2,47"..WHITE..")"
Inst9Quest5_HORDE_Note = "Вы получите предшествующее задание у аптекаря Зинга в Подгороде - Квартал фармацевтов ("..YELLOW.."50,68"..WHITE..").\n\nThe Табличка Темнокамня находится около "..YELLOW.."[2]"..WHITE.." в сундуке."
Inst9Quest5_HORDE_Prequest = "Вивиан Лягроб и табличка Темнокамня"
Inst9Quest5_HORDE_Folgequest = "Нет"

--Quest6 Horde

Inst9Quest6_HORDE = "6. За Орду!"
Inst9Quest6_HORDE_Level = "60"
Inst9Quest6_HORDE_Attain = "55"
Inst9Quest6_HORDE_Aim = "Пойдите в Пик Черной горы и убейте вождя Ренда Чернорука. Принесите его голову в Оргриммар."
Inst9Quest6_HORDE_Location = "Тралл (Оргриммар; "..YELLOW.."31,38"..WHITE..")"
Inst9Quest6_HORDE_Note = "Задание для подготовки к Ониксии. Вы найдете вождя Ренда Черную руку около "..YELLOW.."[5]"..WHITE.."."
Inst9Quest6_HORDE_Prequest = "Приказ полководца -> Мудрость Эйтригга"
Inst9Quest6_HORDE_Folgequest = "Что принес ветер"

--Quest7 Horde

Inst9Quest7_HORDE = "7. Иллюзиии Ока"
Inst9Quest7_HORDE_Level = "60"
Inst9Quest7_HORDE_Attain = "57"
Inst9Quest7_HORDE_Aim = "Отправляйтесь на пик Черной горы и добудьте 20 глаз черных драконидов. По выполнении задания вернитесь к Миранде Колдунье."
Inst9Quest7_HORDE_Location = "Миранда Колдунья (Западные Чумные земли; "..YELLOW.."50,77"..WHITE..")"
Inst9Quest7_HORDE_Note = "Глаза падают с драконидов."
Inst9Quest7_HORDE_Prequest = "Что принес ветер -> Госпожа обмана"
Inst9Quest7_HORDE_Folgequest = "Огнебор"

--Quest8 Horde

Inst9Quest8_HORDE = "8. Кровь могучего черного дракона"
Inst9Quest8_HORDE_Level = "60"
Inst9Quest8_HORDE_Attain = "56"
Inst9Quest8_HORDE_Aim = "Отправляйтесь к пику Черной горы и убейте генерала Драккисата. Соберите его кровь и вернитесь к Рокаро."
Inst9Quest8_HORDE_Location = "Рокаро (Пустоши - Деревня Ночных охотников; "..YELLOW.."25,71"..WHITE..")"
Inst9Quest8_HORDE_Note = "Последняя часть на пути к Ониксии. Вы найдете генерала Драккисата около "..YELLOW.."[8]"..WHITE.."."
Inst9Quest8_HORDE_Prequest = "Огнебор -> Вознесение"
Inst9Quest8_HORDE_Folgequest = "Нет"

--Quest9 Horde

Inst9Quest9_HORDE = "7. Приказ Чернорука"
Inst9Quest9_HORDE_Level = Inst9Quest7_Level
Inst9Quest9_HORDE_Attain = Inst9Quest7_Attain
Inst9Quest9_HORDE_Aim = Inst9Quest7_Aim
Inst9Quest9_HORDE_Location = Inst9Quest7_Location
Inst9Quest9_HORDE_Note = Inst9Quest7_Note
Inst9Quest9_HORDE_Prequest = Inst9Quest7_Prequest
Inst9Quest9_HORDE_Folgequest = Inst9Quest7_Folgequest


--------------Dire Maul East/ Inst10------------
Inst10Story = "Построенный двенадцать тысяч лет назад тайной сектой волшебников ночных эльфов, древний город Эльдре'Талас использовали, чтобы защитить самые ценные секреты королевы Азшары. Несмотря на то, что он был уничтожен Великим Расколом мира, большая часть изумительного города еще существует как грандиозный Ужасный Кулак. Три самобытных района руин населили всевозможные твари - в основном призрачными высокорожденными, грязными сатирами и безмозглыми ограми. Только группа самых отважных искателей приключений может войти в разрушенный город и встретиться лицом к лицу с древним злом, заключенным в его древних подвалах."
Inst10Caption = "Забытый город"
Inst10QAA = "10 Заданий"
Inst10QAH = "10 Заданий"

--Quest1 Allianz

Inst10Quest1 = "1. Пузиллин и старейший Аж'Тордин"
Inst10Quest1_Level = "58"
Inst10Quest1_Attain = "?"
Inst10Quest1_Aim = "Отправляйтесь в Забытый Город и отыщите беса Пузиллина. Любыми доступными средствами убедите Пузиллина отдать вам книгу заклинаний Аж'Тордина.\nВозвращение к Аж'Тордину в Фераласе позволит вам восстановить книгу заклинаний."
Inst10Quest1_Location = "Аж'Тордин (Фералас; "..YELLOW.."76,37"..WHITE..")"
Inst10Quest1_Note = "Пузиллин находится в Забытом городе "..YELLOW.."Восток"..WHITE.." около "..YELLOW.."[1]"..WHITE..". Он убегает когда вы поговорите с ним, но останавливается и сражается около "..YELLOW.."[2]"..WHITE..". С него падает Ключ Полумесяца, используемый в Забытом городе Север и Запад."
Inst10Quest1_Prequest = "Нет"
Inst10Quest1_Folgequest = "Нет"

--Quest2 Allianz

Inst10Quest2 = "2. Сеть Лефтендрис"
Inst10Quest2_Level = "57"
Inst10Quest2_Attain = "?"
Inst10Quest2_Aim = "Принесите сеть Лефтендрис Латроникусу Лунному Копью в Крепость Оперенной Луны в Фераласе."
Inst10Quest2_Location = "Латроникус Лунное Копье (Фералас - Крепость Оперенной Луны; "..YELLOW.."30,46"..WHITE..")"
Inst10Quest2_Note = "Лефтендрис находится в Забытом городе "..YELLOW.."Восток"..WHITE.." около "..YELLOW.."[3]"..WHITE..". Предшествующее задание идет от Курьера Удар Молота в Стальгорне. Он бродит по всему городу."
Inst10Quest2_Prequest = "Крепость Оперенной Луны"
Inst10Quest2_Folgequest = "Нет"

--Quest3 Horde

Inst10Quest3 = "3. Сломанная западня"
Inst10Quest3_Attain = "?"
Inst10Quest3_Level = "60"
Inst10Quest3_Aim = "Отремонтировать западню."
Inst10Quest3_Location = "Сломанная западня (Забытый город; "..YELLOW.."Север"..WHITE..")"
Inst10Quest3_Note = "Повторяемое задание. Для ремонта западни нужно использовать [Ториевое устройство] и [Масло льда]."
Inst10Quest3_Prequest = "Нет"
Inst10Quest3_Folgequest = "Нет"

--Quest4 Horde

Inst10Quest4 = "4. Броня огров Гордока"
Inst10Quest4_Attain = "?"
Inst10Quest4_Level = "60"
Inst10Quest4_Aim = "Принесите 4 рулона рунной ткани, 8 кусков прочной кожи, 2 мотка рунной нити и огрскую дубильную кислоту Уззлу Наперстяку. Он прикован в секторе Гордока в Забытом Городе."
Inst10Quest4_Location = "Уззл Наперстяк (Забытый город; "..YELLOW.."Север, [4]"..WHITE..")"
Inst10Quest4_Note = "Повторяемое задание. Вы найдете огрскую дубильную кислоту около "..YELLOW.."[4] (сверху)"..WHITE.."."
Inst10Quest4_Prequest = "Нет"
Inst10Quest4_Folgequest = "Нет"

--Quest5 Horde

Inst10Quest5 = "5. Освободите Нотта!"
Inst10Quest5_Attain = "?"
Inst10Quest5_Level = "60"
Inst10Quest5_Aim = "Найдите Ключ от оков Гордока для Уззла Наперстяка."
Inst10Quest5_Location = "Уззл Наперстяк (Забытый город; "..YELLOW.."Север, [4]"..WHITE..")"
Inst10Quest5_Note = "Повторяемое задание. Ключ может выпасть из любого охранника."
Inst10Quest5_Prequest = "Нет"
Inst10Quest5_Folgequest = "Нет"

--Quest6 Horde

Inst10Quest6 = "6. Осколки сквернита"
Inst10Quest6_Attain = "?"
Inst10Quest6_Level = "60"
Inst10Quest6_Aim = "Отыщите Сквернит в Забытом Городе и подберите его осколок. Есть шанс, что вам удастся его добыть, только убив Алззина Вертоградаря. Крепко заприте осколок в реликварии Чистоты, затем верните его Рабину Сатурне в Ночную Гавань в Лунной поляне."
Inst10Quest6_Location = "Рабин Сатурна (Лунная поляна - Ночная гавань; "..YELLOW.."51,44"..WHITE..")"
Inst10Quest6_Note = "Вы найдете Алззина Вертоградаря в "..YELLOW.."Восточной"..WHITE.." части Забытого города около "..YELLOW.."[5]"..WHITE..". Реликварий находится в Силитусе около "..YELLOW.."62,54"..WHITE..". Предществующее задание также идет от Рабина Сатурна."
Inst10Quest6_Prequest = "Реликварий Чистоты"
Inst10Quest6_Folgequest = "Нет"

--Quest7 Horde

Inst10Quest7 = "7. Эльфийские легенды"
Inst10Quest7_Attain = "54"
Inst10Quest7_Level = "60"
Inst10Quest7_Aim = "Попытайтесь найти в Забытом Городе Кариэля Винтхалуса. Вернитесь в Крепость Оперенной Луны к школяру Рунному Шипу и сообщите ему все, что вам удалось узнать."
Inst10Quest7_Location = "Школяр Рунный Шип (Фералас - Крепость Оперенной Луны; "..YELLOW.."31,43"..WHITE..")"
Inst10Quest7_Note = "Вы найдете Кариэля Винтхалуса в "..YELLOW.."Библиотека (Запад)"..WHITE.."."
Inst10Quest7_Prequest = "Нет"
Inst10Quest7_Folgequest = "Нет"

--Quest8 Horde

Inst10Quest8 = "8. Древнее безумие"
Inst10Quest8_Attain = "?"
Inst10Quest8_Level = "60"
Inst10Quest8_Aim = "Перебейте стражей, которые охраняют 5 столпов, снабжающих энергией Тюрьму Бессмер'тера. После того, как столпы угаснут, силовое поле, удерживающее Бессмер'тера, рассеется.\nВойдите в Тюрьму Бессмер'тера и уничтожьте злого демона, который находится внутри. И, наконец, сразитесь с принцем Тортелдрином в Читальне."
Inst10Quest8_Location = "Прародительница Шен'дралар (Забытый город; "..YELLOW.."Запад, [1] (сверху)"..WHITE..")"
Inst10Quest8_Note = "Столпы помечены как "..BLUE.."[B]"..WHITE..". Бессмер'тер находится около "..YELLOW.."[6]"..WHITE..", Принц Тортелдрин находится около "..YELLOW.."[7]"..WHITE.."."
Inst10Quest8_Prequest = "Нет"
Inst10Quest8_Folgequest = "Сокровище Шен'дралар"

--Quest9 Horde

Inst10Quest9 = "9. Сокровище Шен'дралар"
Inst10Quest9_Attain = "?"
Inst10Quest9_Level = "60"
Inst10Quest9_Aim = "Вернитесь в Читальню и найдите сокровище Шен'дралар. Получите свою награду!"
Inst10Quest9_Location = "Прародительница Шен'дралар (Забытый город; "..YELLOW.."Запад, [1]"..WHITE..")"
Inst10Quest9_Note = "Вы найдете Сокровище под ступеньками "..YELLOW.."[7]"..WHITE.."."
Inst10Quest9_Prequest = "Древнее безумие"
Inst10Quest9_Folgequest = "Нет"

--Quest10 Horde

Inst10Quest10 = "10. Неоконченное дело Гордоков"
Inst10Quest10_Attain = "?"
Inst10Quest10_Level = "60"
Inst10Quest10_Aim = "Добудьте латную рукавицу Мощи Гордока и вернитесь с ней к капитану Кром-Крушителю в Грозном Молоте.\nПо словам Кром-Крушителя, в 'старых байках' говорится, что Тортелдрин - 'паскудный эльф', называющий себя принцем, - похитил эту рукавицу у одного из королей Гордоков."
Inst10Quest10_Location = "Кром-Крушитель (Забытый город; "..YELLOW.."Север, [5]"..WHITE..")"
Inst10Quest10_Note = "Принц находится в Забытом городе "..YELLOW.."Запад"..WHITE.." около "..YELLOW.."[7]"..WHITE..". Рукавица в сундуке прямо рядом с ним. Вы можете взять это задание только после Tribute run и с баффом It's Good to be King!."
Inst10Quest10_Prequest = "Нет"
Inst10Quest10_Folgequest = "Нет"



--Quest1 Horde

Inst10Quest1_HORDE = Inst10Quest1
Inst10Quest1_HORDE_Level = Inst10Quest1_Level
Inst10Quest1_HORDE_Attain = Inst10Quest1_Attain
Inst10Quest1_HORDE_Aim = Inst10Quest1_Aim
Inst10Quest1_HORDE_Location = Inst10Quest1_Location
Inst10Quest1_HORDE_Note = Inst10Quest1_Note
Inst10Quest1_HORDE_Prequest = Inst10Quest1_Prequest
Inst10Quest1_HORDE_Folgequest = Inst10Quest1_Folgequest

--Quest2 Horde

Inst10Quest2_HORDE = "2. Сеть Лефтендрис"
Inst10Quest2_HORDE_Level = "57"
Inst10Quest2_HORDE_Attain = "?"
Inst10Quest2_HORDE_Aim = "Принесите сеть Лефтендрис Тало Терновому Копыту в Лагере Мохаче в Фераласе."
Inst10Quest2_HORDE_Location = "Тало Терновое Копыто (Фералас - Лагерь Мохаче; "..YELLOW.."76,43"..WHITE..")"
Inst10Quest2_HORDE_Note = "Лефтендрис находится в Забытом городе "..YELLOW.."Восток"..WHITE.." около "..YELLOW.."[3]"..WHITE..". Предшествеющее задание идет от Военного глашатая Горлача в Оргриммаре. Он бродит по всему городу."
Inst10Quest2_HORDE_Prequest = "Лагерь Мохаче"
Inst10Quest2_HORDE_Folgequest = "Нет"

--Quest3 Horde

Inst10Quest3_HORDE = Inst10Quest3
Inst10Quest3_HORDE_Level = Inst10Quest3_Level
Inst10Quest3_HORDE_Attain = Inst10Quest3_Attain
Inst10Quest3_HORDE_Aim = Inst10Quest3_Aim
Inst10Quest3_HORDE_Location = Inst10Quest3_Location
Inst10Quest3_HORDE_Note = Inst10Quest3_Note
Inst10Quest3_HORDE_Prequest = Inst10Quest3_Prequest
Inst10Quest3_HORDE_Folgequest = Inst10Quest3_Folgequest

--Quest4 Horde

Inst10Quest4_HORDE = Inst10Quest4
Inst10Quest4_HORDE_Level = Inst10Quest4_Level
Inst10Quest4_HORDE_Attain = Inst10Quest4_Attain
Inst10Quest4_HORDE_Aim = Inst10Quest4_Aim
Inst10Quest4_HORDE_Location = Inst10Quest4_Location
Inst10Quest4_HORDE_Note = Inst10Quest4_Note
Inst10Quest4_HORDE_Prequest = Inst10Quest4_Prequest
Inst10Quest4_HORDE_Folgequest = Inst10Quest4_Folgequest
Inst10Quest4PreQuest_HORDE = Inst10Quest4PreQuest

--Quest5 Horde

Inst10Quest5_HORDE = Inst10Quest5
Inst10Quest5_HORDE_Level = Inst10Quest5_Level
Inst10Quest5_HORDE_Attain = Inst10Quest5_Attain
Inst10Quest5_HORDE_Aim = Inst10Quest5_Aim
Inst10Quest5_HORDE_Location = Inst10Quest5_Location
Inst10Quest5_HORDE_Note = Inst10Quest5_Note
Inst10Quest5_HORDE_Prequest = Inst10Quest5_Prequest
Inst10Quest5_HORDE_Folgequest = Inst10Quest5_Folgequest
Inst10Quest5PreQuest_HORDE = Inst10Quest5PreQuest

--Quest6 Horde

Inst10Quest6_HORDE = Inst10Quest6
Inst10Quest6_HORDE_Level = Inst10Quest6_Level
Inst10Quest6_HORDE_Attain = Inst10Quest6_Attain
Inst10Quest6_HORDE_Aim = Inst10Quest6_Aim
Inst10Quest6_HORDE_Location = Inst10Quest6_Location
Inst10Quest6_HORDE_Note = Inst10Quest6_Note
Inst10Quest6_HORDE_Prequest = Inst10Quest6_Prequest
Inst10Quest6_HORDE_Folgequest = Inst10Quest6_Folgequest

--Quest7 Horde

Inst10Quest7_HORDE = "7. Эльфийские легенды"
Inst10Quest7_HORDE_Attain = "54"
Inst10Quest7_HORDE_Level = "60"
Inst10Quest7_HORDE_Aim = "Попытайтесь найти в Забытом Городе Кариэля Винтхалуса. Вернитесь в Лагерь Мохаче к ведуну Королуску и сообщите ему все, что вам удалось узнать."
Inst10Quest7_HORDE_Location = "Ведун Королуск (Фералас - Лагерь Мохаче; "..YELLOW.."74,43"..WHITE..")"
Inst10Quest7_HORDE_Note = "Вы найдете Кариэля Винтхалуса в "..YELLOW.."Библиотека (Запад)"..WHITE.."."
Inst10Quest7_HORDE_Prequest = "Нет"
Inst10Quest7_HORDE_Folgequest = "Нет"

--Quest8 Horde

Inst10Quest8_HORDE = Inst10Quest8
Inst10Quest8_HORDE_Level = Inst10Quest8_Level
Inst10Quest8_HORDE_Attain = Inst10Quest8_Attain
Inst10Quest8_HORDE_Aim = Inst10Quest8_Aim
Inst10Quest8_HORDE_Location = Inst10Quest8_Location
Inst10Quest8_HORDE_Note = Inst10Quest8_Note
Inst10Quest8_HORDE_Prequest = Inst10Quest8_Prequest
Inst10Quest8_HORDE_Folgequest = Inst10Quest8_Folgequest

--Quest9 Horde

Inst10Quest9_HORDE = Inst10Quest9
Inst10Quest9_HORDE_Level = Inst10Quest9_Level
Inst10Quest9_HORDE_Attain = Inst10Quest9_Attain
Inst10Quest9_HORDE_Aim = Inst10Quest9_Aim
Inst10Quest9_HORDE_Location = Inst10Quest9_Location
Inst10Quest9_HORDE_Note = Inst10Quest9_Note
Inst10Quest9_HORDE_Prequest = Inst10Quest9_Prequest
Inst10Quest9_HORDE_Folgequest = Inst10Quest9_Folgequest

--Quest10 Horde

Inst10Quest10_HORDE = Inst10Quest10
Inst10Quest10_HORDE_Level = Inst10Quest10_Level
Inst10Quest10_HORDE_Attain = Inst10Quest10_Attain
Inst10Quest10_HORDE_Aim = Inst10Quest10_Aim
Inst10Quest10_HORDE_Location = Inst10Quest10_Location
Inst10Quest10_HORDE_Note = Inst10Quest10_Note
Inst10Quest10_HORDE_Prequest = Inst10Quest10_Prequest
Inst10Quest10_HORDE_Folgequest = Inst10Quest10_Folgequest



--------------Inst13/Maraudon------------
Inst13Story = "Защищаемый свирепыми мародонскими кентаврами, Мародон является одим из самых священных мест в Пустошах. Великий храм-пещера служит местом последнего упокоения Зейтара, одного из двух бессмертных сыновей полубога Кенариуса. Легенда гласит, что Зейтар и принцесса духов стихии земли, Терадрас,  зачали незаконорожденную расу кентавров. Она также рассказывает о том, что появившись на свет, варвары-кентавры восстали против своего отца и убили его. Кое-кто верит, что Терадрас, полная скорби, заточила дух Зейтара в извилистых пещерах - используя его энергию для злых целей. Подземные тоннели, населенные злобными призраками давно умерших Ханов кентавров, а также яростными духами стихии, слугами Терадрас."
Inst13Caption = "Мародон"
Inst13QAA = "8 Заданий"
Inst13QAH = "8 Заданий"

--Quest1 Allianz
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

--Quest2 Allianz

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

--Quest3 Allianz

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

--Quest4 Horde

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


--Quest5 Allianz

Inst13Quest5 = "5. Легенды Мародона"
Inst13Quest5_Level = "48"
Inst13Quest5_Attain = "?"
Inst13Quest5_Aim = "Добудьте две части скипетра Келебраса – жезл Келебраса и бриллиант Келебраса.\nНайдите способ поговорить с Келебрасом."
Inst13Quest5_Location = "Кавиндра (Пустоши - Мародон; "..YELLOW.."[4] на карте входа"..WHITE..")"
Inst13Quest5_Note = "Вы найдете Кавиндру в начале Оранжевой части перед подземельем.\nВы получите Келебрийский жезл с Ноксиона около "..YELLOW.."[2]"..WHITE..", а Келебрийский бриллиант с Лорда Злоязыкого  "..YELLOW.."[5]"..WHITE..". Келебрас находится около "..YELLOW.."[7]"..WHITE..". Вы должны победить его, чтобы поговорить."
Inst13Quest5_Prequest = "Нет"
Inst13Quest5_Folgequest = "Скипетр Келебраса"

--Quest6 Allianz

Inst13Quest6 = "6. Скипетр Келебраса"
Inst13Quest6_Level = "49"
Inst13Quest6_Attain = "?"
Inst13Quest6_Aim = "Помогите Селебрасу Искупленному воссоздать скипетр Селебраса.\nПо завершении ритуала снова обратитесь к нему."
Inst13Quest6_Location = "Селебрас Искупленный (Мародон; "..YELLOW.."[7]"..WHITE..")"
Inst13Quest6_Note = "Келебрас создает Скипетр. Поговорите с ним, когда он закончит."
Inst13Quest6_Prequest = "Легенды Мародона"
Inst13Quest6_Folgequest = "Нет"
Inst13Quest6FQuest = "true"
--
Inst13Quest6name1 = "Scepter of Celebras"

--Quest7 Allianz

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

--Quest8 Allianz

Inst13Quest8 = "8. Семя Жизни"
Inst13Quest8_Level = "51"
Inst13Quest8_Attain = "?"
Inst13Quest8_Aim = "Найдите в Лунной поляне Ремулоса и отдайте ему Семя Жизни."
Inst13Quest8_Location = "Дух Зейтара (Мародон; "..YELLOW.."[11]"..WHITE..")"
Inst13Quest8_Note = "Дух Зейтара появляется после убийства принцессы Терадрас "..YELLOW.."[11]"..WHITE..". Вы найдете хранителя Ремулоса около (Лунная поляна - Святилище Ремулоса; "..YELLOW.."36,41"..WHITE..")."
Inst13Quest8_Prequest = "Яблочко от яблоньки..."
Inst13Quest8_Folgequest = "Нет"
Inst13Quest8FQuest = "true"


--Quest1 Horde

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

--Quest2 Horde

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

--Quest3 Horde

Inst13Quest3_HORDE = Inst13Quest3
Inst13Quest3_HORDE_Level = Inst13Quest3_Level
Inst13Quest3_HORDE_Attain = Inst13Quest3_Attain
Inst13Quest3_HORDE_Aim = Inst13Quest3_Aim
Inst13Quest3_HORDE_Location = Inst13Quest3_Location
Inst13Quest3_HORDE_Note = Inst13Quest3_Note
Inst13Quest3_HORDE_Prequest = Inst13Quest3_Prequest
Inst13Quest3_HORDE_Folgequest = Inst13Quest3_Folgequest
--
Inst13Quest3name1_HORDE = "Acumen Robes"
Inst13Quest3name2_HORDE = "Sprightring Helm"
Inst13Quest3name3_HORDE = "Relentless Chain"
Inst13Quest3name4_HORDE = "Hulkstone Pauldrons"

--Quest4 Horde

Inst13Quest4_HORDE = Inst13Quest4
Inst13Quest4_HORDE_Level = Inst13Quest4_Level
Inst13Quest4_HORDE_Attain = Inst13Quest4_Attain
Inst13Quest4_HORDE_Aim = Inst13Quest4_Aim
Inst13Quest4_HORDE_Location = Inst13Quest4_Location
Inst13Quest4_HORDE_Note = Inst13Quest4_Note
Inst13Quest4_HORDE_Prequest = Inst13Quest4_Prequest
Inst13Quest4_HORDE_Folgequest = Inst13Quest4_Folgequest
--
Inst13Quest4name1_HORDE = "Mark of the Chosen"
Inst13Quest4_HORDE_Page = Inst13Quest4_Page

--Quest5 Horde

Inst13Quest5_HORDE = Inst13Quest5
Inst13Quest5_HORDE_Level = Inst13Quest5_Level
Inst13Quest5_HORDE_Attain = Inst13Quest5_Attain
Inst13Quest5_HORDE_Aim = Inst13Quest5_Aim
Inst13Quest5_HORDE_Location = Inst13Quest5_Location
Inst13Quest5_HORDE_Note = Inst13Quest5_Note
Inst13Quest5_HORDE_Prequest = Inst13Quest5_Prequest
Inst13Quest5_HORDE_Folgequest = Inst13Quest5_Folgequest

--Quest6 Horde

Inst13Quest6_HORDE = Inst13Quest6
Inst13Quest6_HORDE_Level = Inst13Quest6_Level
Inst13Quest6_HORDE_Attain = Inst13Quest6_Attain
Inst13Quest6_HORDE_Aim = Inst13Quest6_Aim
Inst13Quest6_HORDE_Location = Inst13Quest6_Location
Inst13Quest6_HORDE_Note = Inst13Quest6_Note
Inst13Quest6_HORDE_Prequest = Inst13Quest6_Prequest
Inst13Quest6_HORDE_Folgequest = Inst13Quest6_Folgequest
Inst13Quest6FQuest_HORDE = Inst13Quest6FQuest
--
Inst13Quest6name1_HORDE = "Scepter of Celebras"

--Quest7 Horde

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

--Quest8 Horde

Inst13Quest8_HORDE = Inst13Quest8
Inst13Quest8_HORDE_Level = Inst13Quest8_Level
Inst13Quest8_HORDE_Attain = Inst13Quest8_Attain
Inst13Quest8_HORDE_Aim = Inst13Quest8_Aim
Inst13Quest8_HORDE_Location = Inst13Quest8_Location
Inst13Quest8_HORDE_Note = Inst13Quest8_Note
Inst13Quest8_HORDE_Prequest = Inst13Quest8_Prequest
Inst13Quest8_HORDE_Folgequest = Inst13Quest8_Folgequest
Inst13Quest8FQuest_HORDE = Inst13Quest8FQuest


--------------Inst22/Stratholme------------
Inst22Story = "Когда-то он был жемчужиной северного Лордерона, город Стратхольм, именно тут принц Артес пошел против своего наставника, Утера Несущего Свет, и устроил бойню сотен своих собственных подданных, зараженных ,как он верил, ужасносной чумой нежити. Стремительное падение Артеса и окончательный переход на сторону Короля-лича последовали потом. В разрушенном городе теперь обитает нежить Плети - ведомая могущественным личем, Кель'тузедом. Личный состав Алого ордена, под руководством Grand Crusader Dathrohan, также захватил часть уничтоженного города. Две стороны увязли в непрекращающейся, ожесточенной битве. Искатели приключений, достаточно отважные (или безмозглые), чтобы войти в Стратхольм, столкнуться с противодействием и тех, и других. Поговаривают, что город охраняется тремя огромными смотровыми башнями, а также сильными некромантами, баньши и мерзостями. Также есть свидетельства того, что пагубный рыцарь смерти разъезжает по дьявольской конюшне - без разбору обрушивая свой гнев на головы тех, кто вторгся во владения Плети."
Inst22Caption = "Стратхольм"
Inst22QAA = "11 Заданий"
Inst22QAH = "12 Заданий"

--Quest1 Alliance

Inst22Quest1 = "1. Плоть не лжет"
Inst22Quest1_Level = "60"
Inst22Quest1_Attain = "?"
Inst22Quest1_Aim = "Принесите 20 препаратов чумной плоти из Стратхольма Бетине Биггльцинк. Предположительно, любая тварь из Стратхольма сойдет за препарат."
Inst22Quest1_Location = "Бетина Биггльцинк (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
Inst22Quest1_Note = "Сбольшинства существ в Стратхольме падают препараты чумной плоти, но шанс очень мал."
Inst22Quest1_Prequest = "Нет"
Inst22Quest1_Folgequest = "Вирус чумы"

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
Inst22Quest2FQuest = "true"

--Quest3 Alliance

Inst22Quest3 = "3. Святая вода"
Inst22Quest3_Level = "60"
Inst22Quest3_Attain = "?"
Inst22Quest3_Aim = "Отправляйтесь на север, в Стратхольм. Обыщите брошенные ящики с припасами и соберите 5 мер святой воды Стратхольма. Возвращайтесь к Леониду Бартоломею Чтимому, как только воды будет достаточно."
Inst22Quest3_Location = "Леонид Барталомей Чтимый (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."80,58"..WHITE..")"
Inst22Quest3_Note = "Вы найдете святую воду в ящиках по всему Стратхольму. При открытии некоторых появятся насекомые и атакуют вас."
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
Inst22Quest5PreQuest = "true"

--Quest6 Alliance

Inst22Quest6 = "6. О любви и семье"
Inst22Quest6_Level = "60"
Inst22Quest6_Attain = "53"
Inst22Quest6_Aim = "Отправляйтесь в Статхольм в северную часть Лихоземья. Найдите в Бастионе Алого ордена картину 'О любви и семье', спрятанную за другой, изображающей две луны нашего мира."
Inst22Quest6_Location = "Художница Ренфри (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."65,75"..WHITE..")"
Inst22Quest6_Note = "Вы возьмете предшествующее задание у Тириона Фордринга (Западные Чумные земли; "..YELLOW.."7,43"..WHITE.."). Вы сможете найти картину около "..YELLOW.."[7]"..WHITE.."."
Inst22Quest6_Prequest = "Искупление - > О любви и семье"
Inst22Quest6_Folgequest = "Найти Миранду"
Inst22Quest6PreQuest = "true"

--Quest7 Alliance

Inst22Quest7 = "7. Дар Менетила"
Inst22Quest7_Level = "60"
Inst22Quest7_Attain = "53"
Inst22Quest7_Aim = "Отправляйтесь в Стратхольм и отыщите Дар Менетила. Положите книгу Воспоминаний на оскверненную землю."
Inst22Quest7_Location = "Леонид Барталомей Чтимый (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."80,58"..WHITE..")"
Inst22Quest7_Note = "Вы возьмете предшествующее задание у мирового судьи Мардука (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE.."). Вы найдете знак около "..YELLOW.."[15]"..WHITE..". Смотрите также: "..YELLOW.."[Рас Снегошепот – лич]"..WHITE.." в Некроситете."
Inst22Quest7_Prequest = "Рас Ледяной Шепот – человек - > Рас Ледяной Шепот – гибель"
Inst22Quest7_Folgequest = "Дар Менетила"
Inst22Quest7PreQuest = "true"

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

--Quest10 Alliance

Inst22Quest10 = "10. Ошеломляющая истина"
Inst22Quest10_Level = "60"
Inst22Quest10_Attain = "58"
Inst22Quest10_Aim = "Отнесите голову Бальназара герцогу Николасу Зверенхоффу в Восточные Чумные земли."
Inst22Quest10_Location = "Бальназар (Стратхольм; "..YELLOW.."[7]"..WHITE..")"
Inst22Quest10_Note = "Вы найдете герцога Николаса Зверенхоффа в Восточные Чумные земли - Часовня Последней Надежды ("..YELLOW.."81,59"..WHITE..")."
Inst22Quest10_Prequest = "Архивариус"
Inst22Quest10_Folgequest = "Быстрее, выше, сильнее"
Inst22Quest10FQuest = "true"

--Quest11 Alliance

Inst22Quest11 = "11. Быстрее, выше, сильнее"
Inst22Quest11_Level = "60"
Inst22Quest11_Attain = "58"
Inst22Quest11_Aim = "Отправляйтесь в Стратхольм и убейте барона Ривендера. Принесите его голову герцогу Николасу Зверенхоффу."
Inst22Quest11_Location = "Герцог Николас Зверенхофф (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
Inst22Quest11_Note = "Вы можете найти барона около "..YELLOW.."[15]"..WHITE.."."
Inst22Quest11_Prequest = "Ошеломляющая истина"
Inst22Quest11_Folgequest = "Лорд Максвелл Тиросс -> Серебряный Оплот"
Inst22Quest11_Folgequest = "No"
--
Inst22Quest11name1 = "Argent Defender"
Inst22Quest11name2 = "Argent Crusader"
Inst22Quest11name3 = "Argent Avenger"
Inst22Quest11FQuest = "true"

--Quest1 Horde

Inst22Quest1_HORDE = Inst22Quest1
Inst22Quest1_HORDE_Level = Inst22Quest1_Level
Inst22Quest1_HORDE_Attain = Inst22Quest1_Attain
Inst22Quest1_HORDE_Aim = Inst22Quest1_Aim
Inst22Quest1_HORDE_Location = Inst22Quest1_Location
Inst22Quest1_HORDE_Note = Inst22Quest1_Note
Inst22Quest1_HORDE_Prequest = Inst22Quest1_Prequest
Inst22Quest1_HORDE_Folgequest = Inst22Quest1_Folgequest

--Quest2 Horde

Inst22Quest2_HORDE = Inst22Quest2
Inst22Quest2_HORDE_Level = Inst22Quest2_Level
Inst22Quest2_HORDE_Attain = Inst22Quest2_Attain
Inst22Quest2_HORDE_Aim = Inst22Quest2_Aim
Inst22Quest2_HORDE_Location = Inst22Quest2_Location
Inst22Quest2_HORDE_Note = Inst22Quest2_Note
Inst22Quest2_HORDE_Prequest = Inst22Quest2_Prequest
Inst22Quest2_HORDE_Folgequest = Inst22Quest2_Folgequest
--
Inst22Quest2name1_HORDE = "Seal of the Dawn"
Inst22Quest2name2_HORDE = "Rune of the Dawn"
Inst22Quest2FQuest_HORDE = "true"

--Quest3 Horde

Inst22Quest3_HORDE = Inst22Quest3
Inst22Quest3_HORDE_Level = Inst22Quest3_Level
Inst22Quest3_HORDE_Attain = Inst22Quest3_Attain
Inst22Quest3_HORDE_Aim = Inst22Quest3_Aim
Inst22Quest3_HORDE_Location = Inst22Quest3_Location
Inst22Quest3_HORDE_Note = Inst22Quest3_Note
Inst22Quest3_HORDE_Prequest = Inst22Quest3_Prequest
Inst22Quest3_HORDE_Folgequest = Inst22Quest3_Folgequest
--
Inst22Quest3name1_HORDE = "Superior Healing Potion"
Inst22Quest3name2_HORDE = "Greater Mana Potion"
Inst22Quest3name3_HORDE = "Crown of the Penitent"
Inst22Quest3name4_HORDE = "Band of the Penitent"

--Quest4 Horde

Inst22Quest4_HORDE = Inst22Quest4
Inst22Quest4_HORDE_Level = Inst22Quest4_Level
Inst22Quest4_HORDE_Attain = Inst22Quest4_Attain
Inst22Quest4_HORDE_Aim = Inst22Quest4_Aim
Inst22Quest4_HORDE_Location = Inst22Quest4_Location
Inst22Quest4_HORDE_Note = Inst22Quest4_Note
Inst22Quest4_HORDE_Prequest = Inst22Quest4_Prequest
Inst22Quest4_HORDE_Folgequest = Inst22Quest4_Folgequest
--
Inst22Quest4name1_HORDE = "Smokey's Lighter"

--Quest5 Horde

Inst22Quest5_HORDE = Inst22Quest5
Inst22Quest5_HORDE_Level = Inst22Quest5_Level
Inst22Quest5_HORDE_Attain = Inst22Quest5_Attain
Inst22Quest5_HORDE_Aim = Inst22Quest5_Aim
Inst22Quest5_HORDE_Location = Inst22Quest5_Location
Inst22Quest5_HORDE_Note = Inst22Quest5_Note
Inst22Quest5_HORDE_Prequest = Inst22Quest5_Prequest
Inst22Quest5_HORDE_Folgequest = Inst22Quest5_Folgequest
--
Inst22Quest5name1_HORDE = "Testament of Hope"
Inst22Quest5PreQuest_HORDE = "true"

--Quest6 Horde

Inst22Quest6_HORDE = Inst22Quest6
Inst22Quest6_HORDE_Level = Inst22Quest6_Level
Inst22Quest6_HORDE_Attain = Inst22Quest6_Attain
Inst22Quest6_HORDE_Aim = Inst22Quest6_Aim
Inst22Quest6_HORDE_Location = Inst22Quest6_Location
Inst22Quest6_HORDE_Note = Inst22Quest6_Note
Inst22Quest6_HORDE_Prequest = Inst22Quest6_Prequest
Inst22Quest6_HORDE_Folgequest = Inst22Quest6_Folgequest
Inst22Quest6PreQuest_HORDE = Inst22Quest6PreQuest

--Quest7 Horde

Inst22Quest7_HORDE = Inst22Quest7
Inst22Quest7_HORDE_Level = Inst22Quest7_Level
Inst22Quest7_HORDE_Attain = Inst22Quest7_Attain
Inst22Quest7_HORDE_Aim = Inst22Quest7_Aim
Inst22Quest7_HORDE_Location = Inst22Quest7_Location
Inst22Quest7_HORDE_Note = Inst22Quest7_Note
Inst22Quest7_HORDE_Prequest = Inst22Quest7_Prequest
Inst22Quest7_HORDE_Folgequest = Inst22Quest7_Folgequest
Inst22Quest7PreQuest_HORDE = Inst22Quest7PreQuest

--Quest8 Horde

Inst22Quest8_HORDE = Inst22Quest8
Inst22Quest8_HORDE_Level = Inst22Quest8_Level
Inst22Quest8_HORDE_Attain = Inst22Quest8_Attain
Inst22Quest8_HORDE_Aim = Inst22Quest8_Aim
Inst22Quest8_HORDE_Location = Inst22Quest8_Location
Inst22Quest8_HORDE_Note = Inst22Quest8_Note
Inst22Quest8_HORDE_Prequest = Inst22Quest8_Prequest
Inst22Quest8_HORDE_Folgequest = Inst22Quest8_Folgequest
--
Inst22Quest8name1_HORDE = "Will of the Martyr"
Inst22Quest8name2_HORDE = "Blood of the Martyr"

--Quest9 Horde

Inst22Quest9_HORDE = Inst22Quest9
Inst22Quest9_HORDE_Level = Inst22Quest9_Level
Inst22Quest9_HORDE_Attain = Inst22Quest9_Attain
Inst22Quest9_HORDE_Aim = Inst22Quest9_Aim
Inst22Quest9_HORDE_Location = Inst22Quest9_Location
Inst22Quest9_HORDE_Note = Inst22Quest9_Note
Inst22Quest9_HORDE_Prequest = Inst22Quest9_Prequest
Inst22Quest9_HORDE_Folgequest = Inst22Quest9_Folgequest

--Quest10 Horde

Inst22Quest10_HORDE = Inst22Quest10
Inst22Quest10_HORDE_Level = Inst22Quest10_Level
Inst22Quest10_HORDE_Attain = Inst22Quest10_Attain
Inst22Quest10_HORDE_Aim = Inst22Quest10_Aim
Inst22Quest10_HORDE_Location = Inst22Quest10_Location
Inst22Quest10_HORDE_Note = Inst22Quest10_Note
Inst22Quest10_HORDE_Prequest = Inst22Quest10_Prequest
Inst22Quest10_HORDE_Folgequest = Inst22Quest10_Folgequest
Inst22Quest10FQuest_HORDE = Inst22Quest10FQuest

--Quest11 Horde

Inst22Quest11_HORDE = Inst22Quest11
Inst22Quest11_HORDE_Level = Inst22Quest11_Level
Inst22Quest11_HORDE_Attain = Inst22Quest11_Attain
Inst22Quest11_HORDE_Aim = Inst22Quest11_Aim
Inst22Quest11_HORDE_Location = Inst22Quest11_Location
Inst22Quest11_HORDE_Note = Inst22Quest11_Note
Inst22Quest11_HORDE_Prequest = Inst22Quest11_Prequest
Inst22Quest11_HORDE_Folgequest = Inst22Quest11_Folgequest
--
Inst22Quest11name1_HORDE = "Argent Defender"
Inst22Quest11name2_HORDE = "Argent Crusader"
Inst22Quest11name3_HORDE = "Argent Avenger"
Inst22Quest11FQuest_HORDE = "true"

--Quest12 Horde

Inst22Quest12_HORDE = "12. Рамштайн"
Inst22Quest12_HORDE_Attain = "?"
Inst22Quest12_HORDE_Level = "60"
Inst22Quest12_HORDE_Aim = "Отправляйтесь в Стратхольм и убейте Рамштайна Ненасытного. Принесите его голову Натаносу в качестве сувенира."
Inst22Quest12_HORDE_Location = "Натанос Гниль (Восточные Чумные земли; "..YELLOW.."26,74"..WHITE..")"
Inst22Quest12_HORDE_Note = "Вы возьмете предшествующее задание также у Натаноса Гнили. Вы найдете Рамштайна около "..YELLOW.."[14]"..WHITE.."."
Inst22Quest12_HORDE_Prequest = "Охота на cледопытов -> Проклятый Тенекрыл"
Inst22Quest12_HORDE_Folgequest = "Нет"
--
Inst22Quest12name1_HORDE = "Royal Seal of Alexis"
Inst22Quest12name2_HORDE = "Elemental Circle"
Inst22Quest12PreQuest_HORDE = "true"

--------------Inst29/Gnomeregan------------
Inst29Story = "Находящееся в Дун Мороге, технологическое чудо, известное как Гномреган было столицей гномов на протяжении поколений. В недавнем прошлом, враждебная раса мутантов-троггов захватила некоторые регионы Дун Морога - включая и великий город гномов. В отчаянных попытках уничтожить вторгшихся троггов, Главный механик Меггакрут запустил экстренный слив городских баков с радиоактивными отходами. Некоторые гномы нашли убежище от загрязняющих воздух веществ, так как они ожидали, что трогги умрут или сбегут. К сожалению, не смотря на точто трогги облучились токсичной атакой - их осада продолжилась, не утихая. Те гномы, которых не убили вредные потоки были вынуждены бежать, ища убежище в близлежащем городе дворфов Стальгорне. Там Главный механик Меггакрут начал вербовать храбрецов, чтобы помочь его народу вернуть обратно их любимую столицу. Ходят слухи что когда-то бывший доверенный советник Меггакрута, Мекжинер Термоштепсель, предал свой народ, позволив вторжению произойти. Теперь, когда его рассудок помутился, Термоштепсель остается в Гномрегане - продвигая свои темные планы и действуя как новый техно-правитель города."
Inst29Caption = "Гномреган"
Inst29QAA = "8 Заданий"
Inst29QAH = "3 Задания"

--QUEST1 Allianz

Inst29Quest1 = "1. Промыть мозг Техботу"
Inst29Quest1_Level = "26"
Inst29Quest1_Attain = "?"
Inst29Quest1_Aim = "Принесите ядро памяти Техбота мехмастеру Замыкальцу в Стальгорн."
Inst29Quest1_Location = "Мехмастер Замыкалец (Стальгорн - Город механиков; "..YELLOW.."69,50"..WHITE..")"
Inst29Quest1_Note = "Вы возьмете предшествующее задание у брата Сарно (Штормград - Соборная площадь; "..YELLOW.."40, 30"..WHITE..").\nВы найдете Техбота перед входом в подземелье около черного входа."
Inst29Quest1_Prequest = "Мехмастер Замыкалец"
Inst29Quest1_Folgequest = "Нет"
Inst29Quest1PreQuest = "true"

--Quest2 Allianz

Inst29Quest2 = "2. Новая формула"
Inst29Quest2_Level = "27"
Inst29Quest2_Attain = "?"
Inst29Quest2_Aim = "Соберите радиоактивный осадок, оставляемый облученными захватчиками и облученными погромщиками в пустой свинцовый фиал для образцов. Принесите полный фиал Оззи Триггервольту в Каранос."
Inst29Quest2_Location = "Оззи Триггервольт (Дун Морог - Каранос; "..YELLOW.."45,49"..WHITE..")"
Inst29Quest2_Note = "Вы возьмете предшествующее задание у Гноарна (Стальгорн - Город механиков; "..YELLOW.."69,50"..WHITE..").\nЧтобы собрать осадок используйте фиал на "..RED.."живых"..WHITE.." Облученный захватчиках или Облученных погромщиках."
Inst29Quest2_Prequest = "На другой день"
Inst29Quest2_Folgequest = "Сильное зеленое свечение"
Inst29Quest2PreQuest = "true"

--Quest3 Allianz

Inst29Quest3 = "3. Сильное зеленое свечение"
Inst29Quest3_Level = "30"
Inst29Quest3_Attain = "27"
Inst29Quest3_Aim = "Отправиться в Гномреган и принести высокорадиоактивные образцы. Внимание: отходы нестабильны и довольно быстро разрушаются.\nВернуть Оззи тяжелую освинцованную склянку для проб, когда задача будет выполнена."
Inst29Quest3_Location = "Оззи Триггервольт (Дун Морог - Каранос; "..YELLOW.."45,49"..WHITE..")"
Inst29Quest3_Note = "Чтобы собрать образцы используйте фиал на "..RED.."живых"..WHITE.." Облученных слизях или ужасах."
Inst29Quest3_Prequest = "Новая формула"
Inst29Quest3_Folgequest = "Нет"
Inst29Quest3FQuest = "true"

--Quest4 Allianz

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

--Quest5 Allianz

Inst29Quest5 = "5. Базовый элемент"
Inst29Quest5_Level = "30"
Inst29Quest5_Attain = "?"
Inst29Quest5_Aim = "Принесите 12 базовых элементов Клацморту Гайкокруту в Стальгорн."
Inst29Quest5_Location = "Клацморт Гайкокрут (Стальгорн - Город механиков; "..YELLOW.."68,46"..WHITE..")"
Inst29Quest5_Note = "Вы возьмете предшествующее задание у Матиля (Дарнасс - Терраса Воинов; "..YELLOW.."59,45"..WHITE.."). Предшествующее задание только указывает на задание и необязательно, чтобы взять это.\nБазовые элементы собираются со всех машин, разбросанных по подземелью."
Inst29Quest5_Prequest = "Базовые элементы Клацморта"
Inst29Quest5_Folgequest = "Нет"
Inst29Quest5PreQuest = "true"

--Quest6 Allianz

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
Inst29Quest6PreQuest = "true"

--Quest7 Allianz

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

--Quest8 Allianz

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

--QUEST1 Horde

Inst29Quest1_HORDE = "1. Поехалиии!"
Inst29Quest1_HORDE_Level = "35"
Inst29Quest1_HORDE_Attain = "23"
Inst29Quest1_HORDE_Aim = "Дождитесь, пока Скути настроит гоблинский импульсный повторитель."
Inst29Quest1_HORDE_Location = "Скути (Тернистая долина - Пиратская бухта; "..YELLOW.."27,77"..WHITE..")"
Inst29Quest1_HORDE_Note = "Вы получите предшествующее задание у Совика (Оргриммар - Аллея Чести; "..YELLOW.."75,25"..WHITE..").\nПосле выполнения этого задания вы сможете использовать телепортатор в Пиратской бухте."
Inst29Quest1_HORDE_Prequest = "Главный инженер Скути"
Inst29Quest1_HORDE_Folgequest = "Нет"
Inst29Quest1PreQuest_HORDE = "true"

--Quest2 Horde

Inst29Quest2_HORDE = "2. Катавасия"
Inst29Quest2_HORDE_Attain = "22"
Inst29Quest2_HORDE_Level = "30"
Inst29Quest2_HORDE_Aim = "Отведите Керноби к Часовому ходу. Затем отправляйтесь с донесением к Скути в Пиратскую Бухту."
Inst29Quest2_HORDE_Location = "Керноби (Гномреган "..YELLOW.."около чистой зоны"..WHITE..")"
Inst29Quest2_HORDE_Note = "Задание по сопровождению! Вы найдете Скути в "..YELLOW.."Тернистой долине (Пиратская Бухта; 27,77)."..WHITE..""
Inst29Quest2_HORDE_Prequest = "Нет"
Inst29Quest2_HORDE_Folgequest = "Нет"
--
Inst29Quest2name1_HORDE = "Fire-welded Bracers"
Inst29Quest2name2_HORDE = "Fairywing Mantle"

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

------------------------------------------------------------------------------------------------------
------------------------------------------------- RAID -----------------------------------------------
------------------------------------------------------------------------------------------------------

--------------Inst30/Alptraumdrachen------------

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

--------------Azuregos------------
Inst31Story = "Задолго до Разлома Мира, могущественный город ночных эльфов Элдарат располагался на земле, известной теперь как Азшара. Считается, что среди руин некогда великой цитадели могут быть найдёны множество древних и могучих артефактов Высокорожденных. В течении сотен поколений, Стая Синих Драконов охраняла эти артефакты и волшебные знания, служа гарантией того, что они никогда не попадут в руки смертных. А присутствие самого Азурегоса - синего дракона - явно указывает на то, что где-то здесь в Азшаре сокрыты по настоящему уникальные и могущественнейшие артефакты, и вполне возможно даже виалы с водами Колодца Вечности, которые ему так необходимы. Но не зависимо от того, что именно ищет Азурегос, можно быть твёрдо уверенным в одном - Синий Дракон будет сражаться до смерти, защищая волшебные сокровища Азшары."
Inst31Caption = "Азурегос"

--------------Kazzak------------
Inst32Story = "После поражения Пылающего Легиона в конце Третьей Войны, его оставшиеся силы во главе с гигантским демоном Лордом Каззаком обосновались в Выжженных Землях. И до сих пор они остаются там в области, названной Гниющим Шрамом, в ожидании повторного открытия Темного Портала. По слухам, как только Портал будет вновь открыт, Каззак и его армия отправятся в Запределье - бывшую родину орков мир Дренора, разорванный на части множеством порталов, открытых шаманом Нер`зулом и теперь оккупированный демоническими силами, ведомыми предателей ночным эльфом Иллиданом."
Inst32Caption = "Владыка Каззак"

--------------Inst14/geschmolzener Kern------------
Inst14Story = "В глубинах Черной Горы лежат Огненные Недра. Именно здесь, в сердце Черной Горы, не в силах совладать с гражданской войной среди дворфов, император Таурисан привел в наш мир Повелителя Огня, Рагнароса. Хотя Повелитель Огня не может удалиться от пылающих Недр, говорят, что дворфы из клана Темной Стали находятся под властью его духов-приспешников, собирающих армию созданий из ожившего камня. Пылающее озеро, в котором спит Рагнарос, служит вратами в обитель стихий огня, через которые и пробираются в наш мир зловредные духи стихий. Первый среди прислужников Рагнароса — Мажордом Экзекутус. Этот коварный гуманоид — единственный, кто может пробудить Повелителя Огня от сна."
Inst14Caption = "Огненные Недра"

--------------Inst16/Onyxia------------
Inst16Story = "Ониксия — дочь могущественного дракона Смертокрыла и сестра злокозненного Нефариана, который властвует над Пиком Черной Горы. Об Ониксии известно, что ничто ей так не мило, как совращать смертных, вмешиваясь в их политические дела. Поэтому существует поверие, что она часто принимает человеческий облик и появляется там, где решается какая-нибудь запутанная ситуация между расами: она туманит собеседникам разум и понуждает их действовать по своей указке. Иногда говорят даже, что Ониксии как-то раз случилось выдавать себя за представительницу рода Престор, — как в свое время и ее отцу. Когда Ониксии не до дел смертных, она укрывается в огненном подземном логове в Земле Драконов, в мертвенного вида болоте в Пылевых топях. Там ее охраняют соплеменники — те, кто уцелел из клана коварных черных драконов."
Inst16Caption = "Логово Ониксии"

--------------Inst6------------
Inst6Story = "Логово Крыла Тьмы расположено на самой вершине пика Черной горы. Этот величественный шпиль, высеченный из древнего камня, был выстроен по задумке дракона, и теперь в его темных залах проводит свои кошмарные эксперименты старший сын Смертокрыла – Нефариан. Он управляет могучими существами, словно марионетками, и скрещивает потомство различных драконьих родов. Результаты его трудов ужасают, и если он добьется успеха, он сможет воплотить в жизнь еще более зловещие планы. Но владыка Черной горы – не простой исследователь, а могучий дракон, обосновавшийся в хорошо укрепленном логове. Могут ли смертные бросить ему вызов?"
Inst6Caption = "Логово Крыла Тьмы"

--------------Inst23------------
Inst23Story = "В последние часы Войны зыбучих песков, объединенные силы ночных эльфов и четырех драконьих стай довели битву до самого сердца империи кираджи, в город-крепость Ан'Кираж. Еще у городских ворот, армии Калимдора встретились с концентрацией боевых трутней силитидов, намного превосходившей виденую когда-либо ранее. В конечном счете силитиды и их хозяева-кираджи так и не были побеждены, а только изолированы внутри магического барьера. Война оставила проклятый город в руинах. Тысяча лет прошла с того дня, но силы кираджи не сидели без дела. Новая ужасная армия родилась в ульях, и руины Ан'Киража снова кишат роями силитидов и кираджи. Эта угроза должна быть уничтожена, иначе весь Азерот может пасть перед ужасающей мощью новой армии кираджи."
Inst23Caption = "Руины Ан'Киража"

--------------Inst26------------
Inst26Story = "В сердце Ан'Киража лежит древний храмовый квартал. Построенный в незапамятные времена, он напоминает о неназываемых богах и служит огромным инкубатором для киражской армии. Вот уже тысячу лет, со дня окончания войны Зыбучих Песков, императоры-близнецы заключены в собственном храме. Их едва удерживает магический барьер, воздвигнутый бронзовым драконом Анахроносом и ночными эльфами. Скипетр Зыбучих Песков восстановлен, а печать разбита, и путь во внутреннее святилище Ан'Киража открыт. Среди кишащих силитидов за храмом Ан'Киража, киражские легионы готовятся к вторжению. Их надо остановить любой ценой, прежде чем армии инсектоидов снова обрушатся на Калимдор и начнется вторая война Зыбучих Песков!"
Inst26Caption = "Храм Ан'Киража"

--------------Inst28------------
Inst28Story = {
  ["Page1"] = "Свыше тысячи лет назад, могущественная империя Гурбаши была разорвана на части всеобщей гражданской войной. Влиятельная группа жрецов троллей, известная как Атал'аи, предприняла попытку призвать древнего кровавого бога по имени Хаккар Свежеватель душ. Несмотря на то, что жрецы потерпели поражение и были изгнаны навеки, великая империя троллей не смогла сохранить целостность. Изгнанные жрецы бежали далеко на север, в Болота Печали. Там они возвели великий храм в честь Хаккара - где они могли приготовиться к его прибытию в материальный мир.",
  ["Page2"] = "В тоже время, жрецы Атал'аи обнаружили, что материальную форму Хаккара можно вызвать только в пределах древней столицы империи Гурубаши, Зул'Гурубе. К несчастью, жрецы преуспели в своем стремлении призвать Хаккара - донесения подтверждают присутсвие ужасного Свежевателя душ в сердце руин Гурубаши.\n\nДля того, чтобы подавить кровавого бога, тролли страны собрались вместе и послали отряд Высших жрецов в древний город. Каждый жрец был могучим чемпионом Звериных боов - Летучей мыши, Пантеры, Тигра, Паука, и Змеи - но несмотря на все их усилия, они попали под влияние Хаккара. Теперь чемпионы и их воплощения Звериных богов вскормлены ужасающей силой Свежевателя душ. Любой авантюрист, храбрый настолько, чтобы отважиться забраться в проклятые руины, должен победить Высших жрецов, если он надется хотя бы вступить в схватку с могущественным кровавым богом.",
  ["MaxPages"] = "2",
};

Inst28Caption = "Зул'Гуруб"

--------------Inst15 /Naxxramas------------
Inst15Story = "Над Чумными землями парит некрополь Наксрамас — цитадель одного из самых могущественных сподручных Короля-лича, страшного лича Кел'Тузада. Подданные Короля-лича готовят нападение, и в стенах мертвого города собираются страшные призраки прошлого и новые ужасы…"
Inst15Caption = "Наксрамас"

--------------Inst33 / Alterac Vally------------
Inst33Story = "Давным-давно, еще до начала Первой Войны, злой колдун Гул'дан выслал клан орков, который назывался Северные Волки в неизведанную долину, скрывающуюся глубоко в горах Альтерака. Вот на юге этой долины и жили Северные Волки до появления Тралла.\nПосле триумфального объединения кланов Траллом, клан Северные Волки, возглавляемый орком-шаманом Дрек'Таром, решил остаться в долине, которая так долго была их домом. Но недавно спокойствие Северные Волков было нарушено прибытием Дворфской Экспедицией из Грозовой Вершины.\nЭта экспедиция остановилась в долине, что бы искать полезные ископаемые и древние реликвии. Несмотря на мирные цели экспедиции, само присутсвие дворфов в долине породило жаркий конфликт со Северными Волками, которые поклялись выдворить их за пределы своей земли. "
Inst33Caption = "Альтеракская долина"

--------------Inst34 / Arathi Basin------------
Inst34Story = "Низина Арати, расположенная в Нагорье Арати, это быстрое и захватывающее Поле сражений. Низина богата ресурсами и ею жаждут обладать и Орда, и Альянс. Отрекшиеся осквернители и Лига Аратора прибыли в низину Арати, чтобы побороться за природные ресурсы и заявить на них права от лица представляемых ими сторон."
Inst34Caption = "Низина Арати"

--------------Inst35 / Warsong Gulch------------
Inst35Story = "Ущелье Песни Войны располагается в южной области Ясеневого Леса, на границе со Степями – около местности, где Гром Адский Крик и его Орки вырубали огромные просеки в лесах во время событий Третьей войны. Некоторые Орки так и остались в тех местах, продолжая вырубать леса, чтобы снабжать древесиной растущую Орду.\nНочные эльфы, которые начали массированную военную компанию, чтобы вернуть себе Ясеневый Лес, теперь сосредоточили свое внимание на избавлении своих земель от оставшихся орков раз и навсегда. Серебряные Стражи, откликнулись на зов и поклялись, что они не успокоятся, пока все Орки до единого не будут побеждены и выкинуты из Ущелья Песни Войны."
Inst35Caption = "Ущелье Песни Войны"

--    AQINSTANZ :
-- 1  = VC     21 = BSF
-- 2  = WC     22 = STRAT
-- 3  = RFA    23 = AQ20
-- 4  = ULD    24 = STOCKADE
-- 5  = BRD    25 = TEMPLE
-- 6  = BWl    26 = AQ40
-- 7  = BFD    27 = ZUL
-- 8  = LBRS   28 = ZG
-- 9  = UBRS   29 = GNOMERE
-- 10 = DM     30 = DRAGONS
-- 11 =        31 = AZUREGOS
-- 12 =        32 = KAZZAK
-- 13 = MARA   33 = AV
-- 14 = MC     34 = AB
-- 15 = NAXX   35 = WS
-- 16 = ONY    36 = REST
-- 17 = HUEGEL 37 = HCBollwerk/ramparts
-- 18 = KRAL   38 = HCBlutkessel/blood furnace
-- 19 = KLOSTER 39 = HCShatteredHalls
-- 20 = SCHOLO 40 = HCMagtheridons Lair

-- 41 = CFR: The Slave Pens
-- 42 = CFR: The Steamvault
-- 43 = CFR: The Underbog
end