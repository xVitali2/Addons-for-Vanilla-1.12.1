--[[
	Name: Babble-ItemSet-2.2
	Revision: $Rev: 1000 $
	Author(s): Lichery
	Description: A library to provide localizations for factions.
	Dependencies: AceLibrary, AceLocale-2.2
]]
-- Проверить ЗГ, АК20, АК40, Т3, разобраться с сетами AB
local MAJOR_VERSION = "Babble-ItemSet-2.2"
local MINOR_VERSION = tonumber(string.sub("$Revision: 1000 $", 12, -3))

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary") end

if not AceLibrary:HasInstance("AceLocale-2.2") then error(MAJOR_VERSION .. " requires AceLocale-2.2") end

local _, x = AceLibrary("AceLocale-2.2"):GetLibraryVersion()
MINOR_VERSION = MINOR_VERSION * 100000 + x

if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

local BabbleItemSet = AceLibrary("AceLocale-2.2"):new(MAJOR_VERSION)

-- uncomment below for debug information
-- BabbleItemSet:EnableDebugging()

BabbleItemSet:RegisterTranslations("enUS", function()
	return {
	-- Blacksmithing Crafted Sets
		["Bloodsoul Embrace"] = true,
		["Imperial Plate"] = true,
		["The Darksoul"] = true,
    -- Tailoring Crafted Sets
		["Bloodvine Garb"] = true,
    -- Leatherworking Crafted Sets
		["Black Dragon Mail"] = true,
		["Blood Tiger Harness"] = true,
		["Blue Dragon Mail"] = true,
		["Devilsaur Armor"] = true,
		["Green Dragon Mail"] = true,
		["Ironfeather Armor"] = true,
		["Primal Batskin"] = true,
		["Stormshroud Armor"] = true,
		["Volcanic Armor"] = true,
    --Pre60 Sets
		["Battlegear of Undead Slaying"] = true,
		["Bloodmail Regalia"] = true,
		["Cadaverous Garb"] = true,
		["Chain of the Scarlet Crusade"] = true,
		["Dal'Rend's Arms"] = true,
		["Deathbone Guardian"] = true,
		["Defias Leather"] = true,
		["Embrace of the Viper"] = true,
		["Garb of the Undead Slayer"] = true,
		["Ironweave Battlesuit"] = true,
		["Major Mojo Infusion"] = true,
		["Necropile Raiment"] = true,
		["Overlord's Resolution"] = true,
		["Prayer of the Primal"] = true,
		["Primal Blessing"] = true,
		["Regalia of Undead Cleansing"] = true,
		["Shard of the Gods"] = true,
		["Spider's Kiss"] = true,
		["Spirit of Eskhandar"] = true,
		["The Gladiator"] = true,
		["The Postmaster"] = true,
		["The Twin Blades of Hakkari"] = true,
		["Undead Slayer's Armor"] = true,
		["Zanzil's Concentration"] = true,
    --ZG Sets
		["Augur's Regalia"] = true,
		["Confessor's Raiment"] = true,
		["Demoniac's Threads"] = true,
		["Freethinker's Armor"] = true,
		["Haruspex's Garb"] = true,
		["Illusionist's Attire"] = true,
		["Madcap's Outfit"] = true,
		["Predator's Armor"] = true,
		["Vindicator's Battlegear"] = true,
    --AQ20 Sets
		["Battlegear of Eternal Justice"] = true,
		["Battlegear of Unyielding Strength"] = true,
		["Emblems of Veiled Shadows"] = true,
		["Finery of Infinite Wisdom"] = true,
		["Gift of the Gathering Storm"] = true,
		["Implements of Unspoken Names"] = true,
		["Symbols of Unending Life"] = true,
		["Trappings of the Unseen Path"] = true,
		["Trappings of Vaulted Secrets"] = true,
    --AQ40 Sets
		["Avenger's Battlegear"] = true,
		["Conqueror's Battlegear"] = true,
		["Deathdealer's Embrace"] = true,
		["Doomcaller's Attire"] = true,
		["Enigma Vestments"] = true,
		["Garments of the Oracle"] = true,
		["Genesis Raiment"] = true,
		["Stormcaller's Garb"] = true,
		["Striker's Garb"] = true,
    --T0 Sets
		["Battlegear of Valor"] = true,
		["Beaststalker Armor"] = true,
		["Dreadmist Raiment"] = true,
		["Lightforge Armor"] = true,
		["Magister's Regalia"] = true,
		["Shadowcraft Armor"] = true,
		["The Elements"] = true,
		["Vestments of the Devout"] = true,
		["Wildheart Raiment"] = true,
    --T0.5 Sets
		["Battlegear of Heroism"] = true,
		["Beastmaster Armor"] = true,
		["Darkmantle Armor"] = true,
		["Deathmist Raiment"] = true,
		["Feralheart Raiment"] = true,
		["Sorcerer's Regalia"] = true,
		["Soulforge Armor"] = true,
		["The Five Thunders"] = true,
		["Vestments of the Virtuous"] = true,
    --T1 Sets
		["Arcanist Regalia"] = true,
		["Battlegear of Might"] = true,
		["Cenarion Raiment"] = true,
		["Felheart Raiment"] = true,
		["Giantstalker Armor"] = true,
		["Lawbringer Armor"] = true,
		["Nightslayer Armor"] = true,
		["The Earthfury"] = true,
		["Vestments of Prophecy"] = true,
    --T2 Sets
		["Battlegear of Wrath"] = true,
		["Bloodfang Armor"] = true,
		["Dragonstalker Armor"] = true,
		["Judgement Armor"] = true,
		["Nemesis Raiment"] = true,
		["Netherwind Regalia"] = true,
		["Stormrage Raiment"] = true,
		["The Ten Storms"] = true,
		["Vestments of Transcendence"] = true,
    --T3 Sets
		["Bonescythe Armor"] = true,
		["Cryptstalker Armor"] = true,
		["Dreamwalker Raiment"] = true,
		["Frostfire Regalia"] = true,
		["Plagueheart Raiment"] = true,
		["Redemption Armor"] = true,
		["The Earthshatterer"] = true,
		["Vestments of Faith"] = true,
		["Dreadnaught's Battlegear"] = true,
	--PvP Epic Horde Sets
		["Warlord's Battlegear"] = true,
		["Warlord's Earthshaker"] = true,
		["Warlord's Pursuit"] = true,
		["Warlord's Raiment"] = true,
		["Warlord's Regalia"] = true,
		["Warlord's Sanctuary"] = true,
		["Warlord's Threads"] = true,
		["Warlord's Vestments"] = true,
    --PvP Epic Alliance Sets		
		["Field Marshal's Aegis"] = true,
		["Field Marshal's Battlegear"] = true,
		["Field Marshal's Pursuit"] = true,
		["Field Marshal's Raiment"] = true,
		["Field Marshal's Regalia"] = true,
		["Field Marshal's Sanctuary"] = true,
		["Field Marshal's Threads"] = true,
		["Field Marshal's Vestments"] = true,
    --PvP Rare Horde Sets
		["Champion's Refuge"] = true,
		["Champion's Pursuance"] = true,
		["Champion's Arcanum"] = true,
		["Champion's Investiture"] = true,
		["Champion's Guard"] = true,
		["Champion's Stormcaller"] = true,
		["Champion's Dreadgear"] = true,
		["Champion's Battlearmor"] = true,
    --PvP Rare Alliance Sets	
		["Lieutenant Commander's Refuge"] = true,
		["Lieutenant Commander's Pursuance"] = true,
		["Lieutenant Commander's Arcanum"] = true,
		["Lieutenant Commander's Redoubt"] = true,
		["Lieutenant Commander's Investiture"] = true,
		["Lieutenant Commander's Guard"] = true,
		["Lieutenant Commander's Dreadgear"] = true,
		["Lieutenant Commander's Battlearmor"] = true,
	--AB Rare Horde Sets
		["The Defiler's Determination"] = true,
		["The Defiler's Fortitude"] = true,
		["The Defiler's Intent"] = true,
		["The Defiler's Purpose"] = true,
		["The Defiler's Resolution"] = true,
		["The Defiler's Will"] = true,
	--AB Rare Alliance Sets
		["The Highlander's Determination"] = true,
		["The Highlander's Fortitude"] = true,
		["The Highlander's Intent"] = true,
		["The Highlander's Purpose"] = true,
		["The Highlander's Resolution"] = true,
		["The Highlander's Resolve"] = true,
		["The Highlander's Will"] = true,
		
		["Twilight Trappings"] = true,
		
		
		["Lieutenant Commander's Aegis"] = true,
		["Lieutenant Commander's Battlegear"] = true,
		["Lieutenant Commander's Pursuit"] = true,
		["Lieutenant Commander's Raiment"] = true,
		["Lieutenant Commander's Regalia"] = true,
		["Lieutenant Commander's Sanctuary"] = true,
		["Lieutenant Commander's Threads"] = true,
		["Lieutenant Commander's Vestments"] = true,	
		
		["Champion's Battlegear"] = true,
		["Champion's Earthshaker"] = true,
		["Champion's Pursuit"] = true,
		["Champion's Raiment"] = true,
		["Champion's Regalia"] = true,
		["Champion's Sanctuary"] = true,
		["Champion's Threads"] = true,
		["Champion's Vestments"] = true,
	}
end)

BabbleItemSet:RegisterTranslations("ruRU", function()
	return {
	-- Blacksmithing Crafted Sets
		["Bloodsoul Embrace"] = "Объятия Кровавого Духа",
		["Imperial Plate"] = "Исперские латы",
		["The Darksoul"] = "Темная душа",
    -- Tailoring Crafted Sets
		["Bloodvine Garb"] = "Одеяния кровавой лозы",
    -- Leatherworking Crafted Sets
		["Black Dragon Mail"] = "Кольчуга Черного дракона",
		["Blood Tiger Harness"] = "Доспехи кровавого тигра",
		["Blue Dragon Mail"] = "Кольчужный доспех из чешуи синего дракона",
		["Devilsaur Armor"] = "Доспехи из кожи дьявозавра",
		["Green Dragon Mail"] = "Кольчуга Зеленого дракона",
		["Ironfeather Armor"] = "Железноперые доспехи",
		["Primal Batskin"] = "Шкура древней летучей мыши",
		["Stormshroud Armor"] = "Доспехи Грозового покрова",
		["Volcanic Armor"] = "Вулканические доспехи",
    --Pre60 Sets
		["Battlegear of Undead Slaying"] = "Броня истребителя нежити",
		["Bloodmail Regalia"] = "Регалии Кровавой кольчуги",
		["Cadaverous Garb"] = "Трупный наряд",
		["Chain of the Scarlet Crusade"] = "Цепь Алого ордена",
		["Dal'Rend's Arms"] = "Руки Дал'Ренда",
		["Deathbone Guardian"] = "Костяной Страж",
		["Defias Leather"] = "Кожаные доспехи Братства Справедливости",
		["Embrace of the Viper"] = "Объятия гадюки",
		["Garb of the Undead Slayer"] = "Облачение Истребителя нежити",
		["Ironweave Battlesuit"] = "Железотканые доспехи",
		["Major Mojo Infusion"] = "Великое вуду",
		["Necropile Raiment"] = "Одеяния Праха",
		["Overlord's Resolution"] = "Решимость Властителя",
		["Prayer of the Primal"] = "Молитва Изначального",
		["Primal Blessing"] = "Простое Благословение",
		["Regalia of Undead Cleansing"] = "Регалии Зачистки Нежити",
		["Shard of the Gods"] = "Осколок Богов",
		["Spider's Kiss"] = "Поцелуй паука",
		["Spirit of Eskhandar"] = "Дух Эсхандара",
		["The Gladiator"] = "Гладиатор",
		["The Postmaster"] = "Вестник",
		["The Twin Blades of Hakkari"] = "Парные клинки Хаккари",
		["Undead Slayer's Armor"] = "Доспехи истребителя нежити",
		["Zanzil's Concentration"] = "Сосредоточение Занзила",
    --ZG Sets
		["Augur's Regalia"] = "Регалии Авгура",
		["Confessor's Raiment"] = "Облачение Исповедника",
		["Demoniac's Threads"] = "Дьявольские нити",
		["Freethinker's Armor"] = "Доспехи Вольнодумца",
		["Haruspex's Garb"] = "Наряд гаруспика",
		["Illusionist's Attire"] = "Наряд Мастера иллюзий",
		["Madcap's Outfit"] = "Одеяния безумца",
		["Predator's Armor"] = "Доспехи Хищника",
		["Vindicator's Battlegear"] = "Броня воздаятеля",
    --AQ20 Sets
		["Battlegear of Eternal Justice"] = "Броня Вечной Справедливости",
		["Battlegear of Unyielding Strength"] = "Броня неумолимой силы",
		["Emblems of Veiled Shadows"] = "Знаки сокрытых теней",
		["Finery of Infinite Wisdom"] = "Облачение беспредельной мудрости",
		["Gift of the Gathering Storm"] = "Дар Зова Бури",
		["Implements of Unspoken Names"] = "Воплощение Неназванных имен",
		["Symbols of Unending Life"] = "Символы Бесконечной жизни",
		["Trappings of the Unseen Path"] = "Ловушки Незримого Пути",
		["Trappings of Vaulted Secrets"] = "Облачение Погребенных тайн",
    --AQ40 Sets
		["Avenger's Battlegear"] = "Броня Мстителя",
		["Conqueror's Battlegear"] = "Броня Завоевателя",
		["Deathdealer's Embrace"] = "Объятия торговца смертью",
		["Doomcaller's Attire"] = "Наряд Призывателя Рока",
		["Enigma Vestments"] = "Облачение Тайны",
		["Garments of the Oracle"] = "Облачение Оракула",
		["Genesis Raiment"] = "Ризы сотворения",
		["Stormcaller's Garb"] = "Одеяния Зова Бури",
		["Striker's Garb"] = "Одеяния бойца",
    --T0 Sets
		["Battlegear of Valor"] = "Броня Доблести",
		["Beaststalker Armor"] = "Доспехи загонщика",
		["Dreadmist Raiment"] = "Одеяния Багрового Тумана",
		["Lightforge Armor"] = "Доспехи Светлой стали",
		["Magister's Regalia"] = "Регалии Магистра",
		["Shadowcraft Armor"] = "Доспехи незаметности",
		["The Elements"] = "Стихии",
		["Vestments of the Devout"] = "Ризы Благочестия",
		["Wildheart Raiment"] = "Облачение дикого сердца",
    --T0.5 Sets
		["Battlegear of Heroism"] = "Броня Героизма",
		["Beastmaster Armor"] = "Доспехи Повелителя зверей",
		["Darkmantle Armor"] = "Доспехи Покрова тьмы",
		["Deathmist Raiment"] = "Одеяния тумана смерти",
		["Feralheart Raiment"] = "Одеяния буйного сердца",
		["Sorcerer's Regalia"] = "Регалии чародея",
		["Soulforge Armor"] = "Доспехи Закаленного духа",
		["The Five Thunders"] = "Пять Громов",
		["Vestments of the Virtuous"] = "Ризы Добродетели",
    --T1 Sets
		["Arcanist Regalia"] = "Регалии Чародея",
		["Battlegear of Might"] = "Броня Мощи",
		["Cenarion Raiment"] = "Кенарийские одеяния",
		["Felheart Raiment"] = "Одеяния Сердца Скверны",
		["Giantstalker Armor"] = "Доспехи Истребителя великанов",
		["Lawbringer Armor"] = "Доспехи Судии",
		["Nightslayer Armor"] = "Доспехи ночного убийцы",
		["The Earthfury"] = "Гнев Земли",
		["Vestments of Prophecy"] = "Ризы Пророчества",
    --T2 Sets
		["Battlegear of Wrath"] = "Броня Гнева",
		["Bloodfang Armor"] = "Доспехи Кровавых Клыков",
		["Dragonstalker Armor"] = "Доспехи охотника на драконов",
		["Judgement Armor"] = "Доспехи Правосудия",
		["Nemesis Raiment"] = "Одеяния Возмездия",
		["Netherwind Regalia"] = "Регалия ветра Пустоты",
		["Stormrage Raiment"] = "Одеяния Ярости Бури",
		["The Ten Storms"] = "Десять Бурь",
		["Vestments of Transcendence"] = "Ризы Превосходства",
    --T3 Sets
		["Bonescythe Armor"] = "Доспехи костяной косы",
		["Cryptstalker Armor"] = "Доспехи Расхитителя гробниц",
		["Dreamwalker Raiment"] = "Одеяния сновидца",
		["Frostfire Regalia"] = "Регалии ледяного огня",
		["Plagueheart Raiment"] = "Облачение проклятого сердца",
		["Redemption Armor"] = "Доспехи Возмездия",
		["The Earthshatterer"] = "Землекрушитель",
		["Vestments of Faith"] = "Ризы веры",
		["Dreadnaught's Battlegear"] = "Броня неустрашимости",
	--PvP Epic Horde Sets
		["Warlord's Battlegear"] = "Броня вождя",
		["Warlord's Earthshaker"] = "Землекрушитель вождя",
		["Warlord's Pursuit"] = "Облачение вождя",
		["Warlord's Raiment"] = "Облачение вождя",
		["Warlord's Regalia"] = "Регалии Вождя",
		["Warlord's Sanctuary"] = "Снаряжение военачальника",
		["Warlord's Threads"] = "Нити вождя",
		["Warlord's Vestments"] = "Облачение полководца",
    --PvP Epic Alliance Sets		
		["Field Marshal's Aegis"] = "Эгида фельдмаршала",
		["Field Marshal's Battlegear"] = "Броня фельдмаршала",
		["Field Marshal's Pursuit"] = "Облачение фельдмаршала",
		["Field Marshal's Raiment"] = "Одеяния фельдмаршала",
		["Field Marshal's Regalia"] = "Регалии фельдмаршала",
		["Field Marshal's Sanctuary"] = "Снаряжение фельдмаршала",
		["Field Marshal's Threads"] = "Нити фельдмаршала",
		["Field Marshal's Vestments"] = "Одежды фельдмаршала",
    --PvP Rare Horde Sets
		["Champion's Refuge"] = "Спасение Защитника",
		["Champion's Pursuance"] = "Упорство Защитника",
		["Champion's Arcanum"] = "Тайна Защитника",
		["Champion's Investiture"] = "Убор Защитника",
		["Champion's Guard"] = "Стража Защитника",
		["Champion's Stormcaller"] = "Зов Бури Защитника",
		["Champion's Dreadgear"] = "Грозные доспехи Защитника",
		["Champion's Battlearmor"] = "Латы Защитника",
    --PvP Rare Alliance Sets	
		["Lieutenant Commander's Refuge"] = "Защита лейтенанта-командора",
		["Lieutenant Commander's Pursuance"] = "Упорство лейтенанта-командора",
		["Lieutenant Commander's Arcanum"] = "Тайна лейтенанта-командора",
		["Lieutenant Commander's Redoubt"] = "Оплот лейтенанта-командора",
		["Lieutenant Commander's Investiture"] = "Убор лейтенанта-командора",
		["Lieutenant Commander's Guard"] = "Стража лейтенанта-командора",
		["Lieutenant Commander's Dreadgear"] = "Грозные доспехи лейтенанта-командора",
		["Lieutenant Commander's Battlearmor"] = "Боевые доспехи лейтенанта-командора",
	--AB Rare Horde Sets
		["The Defiler's Determination"] = "Решимость Осквернителя",
		["The Defiler's Fortitude"] = "Стойкость Осквернителя",
		["The Defiler's Intent"] = "Цель Осквернителя",
		["The Defiler's Purpose"] = "Решимость Осквернителя",
		["The Defiler's Resolution"] = "Решимость Осквернителя",
		["The Defiler's Will"] = "Воля Осквернителя",
	--AB Rare Alliance Sets
		["The Highlander's Determination"] = "Решимость горца",
		["The Highlander's Fortitude"] = "Стойкость горца",
		["The Highlander's Intent"] = "Упорство горца",
		["The Highlander's Purpose"] = "Цель горца",
		["The Highlander's Resolution"] = "Решимость горца",
		["The Highlander's Resolve"] = "Твердость горца",
		["The Highlander's Will"] = "Воля горца",
		
		["Twilight Trappings"] = "Сумеречное облачение",
		
		
		["Lieutenant Commander's Aegis"] = "Эгида лейтенанта-командора",
		["Lieutenant Commander's Battlegear"] = "Броня лейтенанта-командора",
		["Lieutenant Commander's Pursuit"] = "Облачение лейтенанта-командора",
		["Lieutenant Commander's Raiment"] = "Одеяния лейтенанта-командора",
		["Lieutenant Commander's Regalia"] = "Регалии лейтенанта-командора",
		["Lieutenant Commander's Sanctuary"] = "Снаряжение лейтенанта-командора",
		["Lieutenant Commander's Threads"] = "Нити лейтенанта-командора",
		["Lieutenant Commander's Vestments"] = "Облачение лейтенанта-командора",
		
		["Champion's Battlegear"] = "Броня защитника",
		["Champion's Earthshaker"] = "Землекрушитель Защитника",
		["Champion's Pursuit"] = "Облачение Защитника",
		["Champion's Raiment"] = "Одеяния Защитника",
		["Champion's Regalia"] = "Регалии Защитника",
		["Champion's Sanctuary"] = "Снаряжение Защитника",
		["Champion's Threads"] = "Нити Защитника",
		["Champion's Vestments"] = "Одежды Защитника",
	}
end)


BabbleItemSet:Debug()
BabbleItemSet:SetStrictness(true)

AceLibrary:Register(BabbleItemSet, MAJOR_VERSION, MINOR_VERSION)
BabbleItemSet = nil