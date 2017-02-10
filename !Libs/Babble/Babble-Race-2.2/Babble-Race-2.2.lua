--[[
Name: Babble-Race-2.2
Revision: $Rev: 15606 $
Author(s): ckknight (ckknight@gmail.com)
Website: http://ckknight.wowinterface.com/
Documentation: http://wiki.wowace.com/index.php/Babble-Race-2.2
SVN: http://svn.wowace.com/root/trunk/Babble-2.2/Babble-Race-2.2
Description: A library to provide localizations for races.
Dependencies: AceLibrary, AceLocale-2.2
]]

local MAJOR_VERSION = "Babble-Race-2.2"
local MINOR_VERSION = tonumber(string.sub("$Revision: 15606 $", 12, -3))

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary") end
if not AceLibrary:HasInstance("AceLocale-2.2") then error(MAJOR_VERSION .. " requires AceLocale-2.2") end

local _, x = AceLibrary("AceLocale-2.2"):GetLibraryVersion()
MINOR_VERSION = MINOR_VERSION * 100000 + x

if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

local BabbleRace = AceLibrary("AceLocale-2.2"):new(MAJOR_VERSION)

-- uncomment below for debug information
-- BabbleRace:EnableDebugging()

BabbleRace:RegisterTranslations("enUS", function()
	return {
		["Human"] = true,
		["Night elf"] = true,
		["Dwarf"] = true,
		["Gnome"] = true,
		["Draenei"] = true,
		
		["Orc"] = true,
		["Tauren"] = true,
		["Troll"] = true,
		["Undead"] = true,
		["Blood elf"] = true,
		
		["Humans"] = true,
		["Night elves"] = true,
		["Dwarves"] = true,
		["Gnomes"] = true,
		["Draenei_PL"] = "Draenei",
		
		["Orcs"] = true,
		["Tauren_PL"] = "Tauren",
		["Trolls"] = true,
		["Undead_PL"] = "Undead",
		["Blood elves"] = true,
	}
end)

BabbleRace:RegisterTranslations("ruRU", function()
	return {
		["Human"] = "Человек",
		["Night elf"] = "Ночной эльф",
		["Dwarf"] = "Дворф",
		["Gnome"] = "Гном",
		["Draenei"] = "Дреней",
		
		["Orc"] = "Орк",
		["Tauren"] = "Таурен",
		["Troll"] = "Тролль",
		["Undead"] = "Нежить",
		["Blood elf"] = "Эльф крови",
		
		["Humans"] = "Люди",
		["Night elves"] = "Ночные эльфы",
		["Dwarves"] = "Джорфы",
		["Gnomes"] = "Гномы",
		["Draenei_PL"] = "Дренеи",
		
		["Orcs"] = "Орки",
		["Tauren_PL"] = "Таурены",
		["Trolls"] = "Тролли",
		["Undead_PL"] = "Нежить",
		["Blood elves"] = "Эльфы крови",
	}
end)

BabbleRace:RegisterTranslations("deDE", function()
	return {
		["Human"] = "Mensch",
		["Night elf"] = "Nachtelf",
		["Dwarf"] = "Zwerg",
		["Gnome"] = "Gnom",
--		["Draenei"] = true,
		
		["Orc"] = "Orc",
		["Tauren"] = "Tauren",
		["Troll"] = "Troll",
		["Undead"] = "Untoter",
--		["Blood elf"] = true,
		
		["Humans"] = "Menschen",
		["Night elves"] = "Nachtelfen",
		["Dwarves"] = "Zwerge",
		["Gnomes"] = "Gnome",
--		["Draenei_PL"] = true,
		
		["Orcs"] = "Orcs",
		["Tauren_PL"] = "Tauren",
		["Trolls"] = "Trolle",
		["Undead_PL"] = "Untote",
--		["Blood elves"] = true,
	}
end)

BabbleRace:RegisterTranslations("frFR", function()
	return {
		["Human"] = "Humain",
		["Night elf"] = "Elfe de la nuit",
		["Dwarf"] = "Nain",
		["Gnome"] = "Gnome",
		["Draenei"] = "Draene\195\175",
		
		["Orc"] = "Orc",
		["Tauren"] = "Tauren",
		["Troll"] = "Troll",
		["Undead"] = "Mort-vivant",
		["Blood elf"] = "Elfe de sang",
		
		["Humans"] = "Humains",
		["Night elves"] = "Elfes de la nuit",
		["Dwarves"] = "Nains",
		["Gnomes"] = "Gnomes",
		["Draenei_PL"] = "Draene\195\175",
		
		["Orcs"] = "Orcs",
		["Tauren_PL"] = "Taurens",
		["Trolls"] = "Trolls",
		["Undead_PL"] = "Morts-vivants",
		["Blood elves"] = "Elfes de sang",
	}
end)

BabbleRace:RegisterTranslations("koKR", function()
	return {	
		["Human"] = "인간",
		["Night elf"] = "나이트 엘프",
		["Dwarf"] = "드워프",
		["Gnome"] = "노움",
		["Draenei"] = "드레나이",
		
		["Orc"] = "오크",
		["Tauren"] = "타우렌",
		["Troll"] = "트롤",
		["Undead"] = "언데드", 
		["Blood elf"] = "블러드 엘프",
				
		["Humans"] = "인간",
		["Night elves"] = "나이트 엘프",
		["Dwarves"] = "드워프",
		["Gnomes"] = "노움",
		["Draenei_PL"] = "드레나이",
		
		["Orcs"] = "오크",
		["Tauren_PL"] = "타우렌",
		["Trolls"] = "트롤",
		["Undead_PL"] = "언데드",
		["Blood elves"] = "블러드 엘프",
	}
end)

BabbleRace:RegisterTranslations("zhCN", function()
	return {	
		["Human"] = "人类",
		["Night elf"] = "暗夜精灵",
		["Dwarf"] = "矮人",
		["Gnome"] = "侏儒",
		["Draenei"] = "德莱尼人",
		
		["Orc"] = "兽人",
		["Tauren"] = "牛头人",
		["Troll"] = "巨魔",
		["Undead"] = "亡灵", 
		["Blood elf"] = "血精灵",
				
		["Humans"] = "人类",
		["Night elves"] = "暗夜精灵",
		["Dwarves"] = "矮人",
		["Gnomes"] = "侏儒",
		["Draenei_PL"] = "德莱尼人",
		
		["Orcs"] = "兽人",
		["Tauren_PL"] = "牛头人",
		["Trolls"] = "巨魔",
		["Undead_PL"] = "亡灵",
		["Blood elves"] = "血精灵",
	}
end)

BabbleRace:RegisterTranslations("zhTW", function()
	return {	
		["Human"] = "人類",
		["Night elf"] = "夜精靈",
		["Dwarf"] = "矮人",
		["Gnome"] = "地精",
--		["Draenei"] = true,
		
		["Orc"] = "獸人",
		["Tauren"] = "牛頭人",
		["Troll"] = "食人妖",
		["Undead"] = "不死族", 
--		["Blood elf"] = true,
				
		["Humans"] = "人類",
		["Night elves"] = "夜精靈",
		["Dwarves"] = "矮人",
		["Gnomes"] = "地精",
--		["Draenei_PL"] = true,
		
		["Orcs"] = "獸人",
		["Tauren_PL"] = "牛頭人",
		["Trolls"] = "食人夭",
		["Undead_PL"] = "不死族",
--		["Blood elves"] = true,
	}
end)

BabbleRace:Debug()
BabbleRace:SetStrictness(true)

AceLibrary:Register(BabbleRace, MAJOR_VERSION, MINOR_VERSION)
BabbleRace = nil
