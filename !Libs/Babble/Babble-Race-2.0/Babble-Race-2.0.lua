--[[
Name: Babble-Race-2.0
Revision: $Rev: 9146 $
Author(s): ckknight (ckknight@gmail.com)
Website: http://ckknight.wowinterface.com/
Documentation: http://wiki.wowace.com/index.php/Babble-Race-2.0
SVN: http://svn.wowace.com/root/trunk/BabbleLib/Babble-Race-2.0
Description: A library to provide localizations for races.
Dependencies: AceLibrary, AceLocale-2.0
]]

local MAJOR_VERSION = "Babble-Race-2.0"
local MINOR_VERSION = tonumber(string.sub("$Revision: 9146 $", 12, -3))

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary") end
if not AceLibrary:HasInstance("AceLocale-2.0") then error(MAJOR_VERSION .. " requires AceLocale-2.0") end

local _, x = AceLibrary("AceLocale-2.0"):GetLibraryVersion()
MINOR_VERSION = MINOR_VERSION * 100000 + x

if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

local BabbleRace = AceLibrary("AceLocale-2.0"):new(MAJOR_VERSION)

-- uncomment below for debug information
-- BabbleRace:EnableDebugging()

BabbleRace:RegisterTranslations("enUS", function()
	return {
		["Human"] = "Human",
		["Night elf"] = "Night elf",
		["Dwarf"] = "Dwarf",
		["Gnome"] = "Gnome",
		
		["Orc"] = "Orc",
		["Tauren"] = "Tauren",
		["Troll"] = "Troll",
		["Undead"] = "Undead",
		
		["Humans"] = "Humans",
		["Night elves"] = "Night elves",
		["Dwarves"] = "Dwarves",
		["Gnomes"] = "Gnomes",
		
		["Orcs"] = "Orcs",
		["Tauren_PL"] = "Tauren",
		["Trolls"] = "Trolls",
		["Undead_PL"] = "Undead",
	}
end)

BabbleRace:RegisterTranslations("ruRU", function()
	return {
		["Human"] = "Человек",
		["Night elf"] = "Ночной эльф",
		["Dwarf"] = "Дворф",
		["Gnome"] = "Гном",
		
		["Orc"] = "Орк",
		["Tauren"] = "Таурен",
		["Troll"] = "Тролль",
		["Undead"] = "Нежить",
		
		["Humans"] = "Люди",
		["Night elves"] = "Ночные эльфы",
		["Dwarves"] = "Джорфы",
		["Gnomes"] = "Гномы",
		
		["Orcs"] = "Орки",
		["Tauren_PL"] = "Таурены",
		["Trolls"] = "Тролли",
		["Undead_PL"] = "Нежить",
	}
end)

BabbleRace:RegisterTranslations("deDE", function()
	return {
		["Human"] = "Mensch",
		["Night elf"] = "Nachtelf",
		["Dwarf"] = "Zwerg",
		["Gnome"] = "Gnom",
		
		["Orc"] = "Orc",
		["Tauren"] = "Tauren",
		["Troll"] = "Troll",
		["Undead"] = "Untoter",
		
		["Humans"] = "Menschen",
		["Night elves"] = "Nachtelfen",
		["Dwarves"] = "Zwerge",
		["Gnomes"] = "Gnome",
		
		["Orcs"] = "Orcs",
		["Tauren_PL"] = "Tauren",
		["Trolls"] = "Trolle",
		["Undead_PL"] = "Untote",
	}
end)

BabbleRace:RegisterTranslations("frFR", function()
	return {
		["Human"] = "Humain",
		["Night elf"] = "Elfe de la nuit",
		["Dwarf"] = "Nain",
		["Gnome"] = "Gnome",
		
		["Orc"] = "Orc",
		["Tauren"] = "Tauren",
		["Troll"] = "Troll",
		["Undead"] = "Mort-vivant",
		
		["Humans"] = "Humains",
		["Night elves"] = "Elfes de la nuit",
		["Dwarves"] = "Nains",
		["Gnomes"] = "Gnomes",
		
		["Orcs"] = "Orcs",
		["Tauren_PL"] = "Taurens",
		["Trolls"] = "Trolls",
		["Undead_PL"] = "Morts-vivants",
	}
end)

BabbleRace:RegisterTranslations("koKR", function()
	return {	
		["Human"] = "인간",
		["Night elf"] = "나이트 엘프",
		["Dwarf"] = "드워프",
		["Gnome"] = "노움",
		
		["Orc"] = "오크",
		["Tauren"] = "타우렌",
		["Troll"] = "트롤",
		["Undead"] = "언데드", 
				
		["Humans"] = "인간",
		["Night elves"] = "나이트 엘프",
		["Dwarves"] = "드워프",
		["Gnomes"] = "노움",
		
		["Orcs"] = "오크",
		["Tauren_PL"] = "타우렌",
		["Trolls"] = "트롤",
		["Undead_PL"] = "언데드",		
	}
end)

BabbleRace:RegisterTranslations("zhCN", function()
	return {	
		["Human"] = "人类",
		["Night elf"] = "暗夜精灵",
		["Dwarf"] = "矮人",
		["Gnome"] = "侏儒",
		
		["Orc"] = "兽人",
		["Tauren"] = "牛头人",
		["Troll"] = "巨魔",
		["Undead"] = "亡灵", 
				
		["Humans"] = "人类",
		["Night elves"] = "暗夜精灵",
		["Dwarves"] = "矮人",
		["Gnomes"] = "侏儒",
		
		["Orcs"] = "兽人",
		["Tauren_PL"] = "牛头人",
		["Trolls"] = "巨魔",
		["Undead_PL"] = "亡灵",		
	}
end)

BabbleRace:Debug()
BabbleRace:SetStrictness(true)

AceLibrary:Register(BabbleRace, MAJOR_VERSION, MINOR_VERSION)
BabbleRace = nil
