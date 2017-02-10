--[[
Name: Babble-Faction-2.2
Revision: $Rev: 1000 $
Author(s): Lichery
Description: A library to provide localizations for factions.
Dependencies: AceLibrary, AceLocale-2.2
]]

local MAJOR_VERSION = "Babble-Faction-2.2"
local MINOR_VERSION = tonumber(string.sub("$Revision: 1000 $", 12, -3))

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary") end

if not AceLibrary:HasInstance("AceLocale-2.2") then error(MAJOR_VERSION .. " requires AceLocale-2.2") end

local _, x = AceLibrary("AceLocale-2.2"):GetLibraryVersion()
MINOR_VERSION = MINOR_VERSION * 100000 + x

if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

local BabbleFaction = AceLibrary("AceLocale-2.2"):new(MAJOR_VERSION)

-- uncomment below for debug information
-- BabbleFaction:EnableDebugging()

BabbleFaction:RegisterTranslations("enUS", function()
	return {
	--Player Factions
	["Alliance"] = true,
	["Horde"] = true,

	-- Classic Factions
	["Argent Dawn"] = true,
	["Bloodsail Buccaneers"] = true,
	["Booty Bay"] = true,
	["Brood of Nozdormu"] = true,
	["Cenarion Circle"] = true,
	["Darkmoon Faire"] = true,
	["Darkspear Trolls"] = true,
	["Darnassus"] = true,
	["The Defilers"] = true,
	["Everlook"] = true,
	["Frostwolf Clan"] = true,
	["Gadgetzan"] = true,
	["Gelkis Clan Centaur"] = true,
	["Gnomeregan Exiles"] = true,
	["Hydraxian Waterlords"] = true,
	["Ironforge"] = true,
	["The League of Arathor"] = true,
	["Magram Clan Centaur"] = true,
	["Orgrimmar"] = true,
	["Ratchet"] = true,
	["Ravenholdt"] = true,
	["Silverwing Sentinels"] = true,
	["Shen'dralar"] = true,
	["Stormpike Guard"] = true,
	["Stormwind"] = true,
	["Syndicate"] = true,
	["Thorium Brotherhood"] = true,
	["Thunder Bluff"] = true,
	["Timbermaw Hold"] = true,
	["Undercity"] = true,
	["Warsong Outriders"] = true,
	["Wildhammer Clan"] = true,
	["Wintersaber Trainers"] = true,
	["Zandalar Tribe"] = true,

	--Rep Levels
	["Neutral"] = true,
	["Friendly"] = true,
	["Honored"] = true,
	["Revered"] = true,
	["Exalted"] = true,
	}
end)

BabbleFaction:RegisterTranslations("ruRU", function()
	return {
	--Player Factions
	["Alliance"] = "Альянс",
	["Horde"] = "Орда",

	-- Classic Factions
	["Argent Dawn"] = "Серебряный Рассвет",
	["Bloodsail Buccaneers"] = "Пираты Кровавого Паруса",
	["Booty Bay"] = "Пиратская бухта",
	["Brood of Nozdormu"] = "Род Ноздорму",
	["Cenarion Circle"] = "Круг Кенария",
	["Darkmoon Faire"] = "Ярмарка Новолуния",
	["Darkspear Trolls"] = "Тролли Черного Копья",
	["Darnassus"] = "Дарнасс",
	["The Defilers"] = "Осквернители",
	["Everlook"] = "Круговзор",
	["Frostwolf Clan"] = "Клан Северного Волка",
	["Gadgetzan"] = "Прибамбасск",
	["Gelkis Clan Centaur"] = "Кентавры из племени Гелкис",
	["Gnomeregan Exiles"] = "Изгнанники Гномрегана",
	["Hydraxian Waterlords"] = "Гидраксианские Повелители Вод",
	["Ironforge"] = "Стальгорн",
	["The League of Arathor"] = "Лига Аратора",
	["Magram Clan Centaur"] = "Кентавры племени Маграм",
	["Orgrimmar"] = "Оргриммар",
	["Ratchet"] = "Кабестан",
	["Ravenholdt"] = "Черный Ворон",
	["Silverwing Sentinels"] = "Среброкрылые Часовые",
	["Shen'dralar"] = "Шен'дралар",
	["Stormpike Guard"] = "Стража Грозовой Вершины",
	["Stormwind"] = "Штормград",
	["Syndicate"] = "Синдикат",
	["Thorium Brotherhood"] = "Братство Тория",
	["Thunder Bluff"] = "Громовой Утес",
	["Timbermaw Hold"] = "Древобрюхи",
	["Undercity"] = "Подгород",
	["Warsong Outriders"] = "Всадники Песни Войны",
	["Wildhammer Clan"] = "Неистовый Молот",
	["Wintersaber Trainers"] = "Укротители ледопардов",
	["Zandalar Tribe"] = "Племя Зандалар",

	--Rep Levels
	["Neutral"] = "Равнодушие",
	["Friendly"] = "Дружелюбие",
	["Honored"] = "Уважение",
	["Revered"] = "Почтение",
	["Exalted"] = "Превознесение",
	}
end)


BabbleFaction:Debug()
BabbleFaction:SetStrictness(true)

AceLibrary:Register(BabbleFaction, MAJOR_VERSION, MINOR_VERSION)
BabbleFaction = nil