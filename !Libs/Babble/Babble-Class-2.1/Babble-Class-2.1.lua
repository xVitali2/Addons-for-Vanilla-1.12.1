--[[
Name: Babble-Class-2.1
Revision: $Rev: 10836 $
Author(s): eternally777 (eternally777@gmail.com)
Based On: BabbleLib-2.0 by ckknight
Website: http://www.wowace.com/index.php/Babble-Class-2.1
Documentation: http://www.wowace.com/index.php/Babble-Class-2.1
SVN: http://svn.wowace.com/root/trunk/BabbleLib/BabbleLib-2.1/Babble-Class-2.1
Description: A library to provide localizations for classes.
Dependencies: AceLibrary, AceLocale-2.1
]]

local MAJOR_VERSION = "Babble-Class-2.1"
local MINOR_VERSION = tonumber(string.sub("$Revision: 10836 $", 12, -3))

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary") end
if not AceLibrary:HasInstance("AceLocale-2.1") then error(MAJOR_VERSION .. " requires AceLocale-2.1") end

local AceLocale = AceLibrary("AceLocale-2.1")

if AceLocale:HasInstance(MAJOR_VERSION) then
    BabbleClass = AceLocale:GetInstance(MAJOR_VERSION)
    if not BabbleClass:NeedsUpgrade(MINOR_VERSION) then return end
    BabbleClass:ClearLocales()
end

AceLocale:RegisterTranslation(MAJOR_VERSION, "enUS", function()
	return {
		["Warlock"] = "Warlock",
		["Warrior"] = "Warrior",
		["Hunter"] = "Hunter",
		["Mage"] = "Mage",
		["Priest"] = "Priest",
		["Druid"] = "Druid",
		["Paladin"] = "Paladin",
		["Shaman"] = "Shaman",
		["Rogue"] = "Rogue",
	}
end)

AceLocale:RegisterTranslation(MAJOR_VERSION, "ruRU", function()
	return {
		["Warlock"] = "Чернокнижник",
		["Warrior"] = "Воин",
		["Hunter"] = "Охотник",
		["Mage"] = "Маг",
		["Priest"] = "Жрец",
		["Druid"] = "Друид",
		["Paladin"] = "Паладин",
		["Shaman"] = "Шаман",
		["Rogue"] = "Разбойник",
	}
end)

AceLocale:RegisterTranslation(MAJOR_VERSION, "deDE", function()
	return {
		["Warlock"] = "Hexenmeister",
		["Warrior"] = "Krieger",
		["Hunter"] = "Jäger",
		["Mage"] = "Magier",
		["Priest"] = "Priester",
		["Druid"] = "Druide",
		["Paladin"] = "Paladin",
		["Shaman"] = "Schamane",
		["Rogue"] = "Schurke",
	}
end)

AceLocale:RegisterTranslation(MAJOR_VERSION, "frFR", function()
	return {
		["Warlock"] = "Démoniste",
		["Warrior"] = "Guerrier",
		["Hunter"] = "Chasseur",
		["Mage"] = "Mage",
		["Priest"] = "Prêtre",
		["Druid"] = "Druide",
		["Paladin"] = "Paladin",
		["Shaman"] = "Chaman",
		["Rogue"] = "Voleur",
	}
end)

AceLocale:RegisterTranslation(MAJOR_VERSION, "zhCN", function()
	return {
		["Warlock"] = "术士",
		["Warrior"] = "战士",
		["Hunter"] = "猎人",
		["Mage"] = "法师",
		["Priest"] = "牧师",
		["Druid"] = "德鲁伊",
		["Paladin"] = "圣骑士",
		["Shaman"] = "萨满祭祀",
		["Rogue"] = "盗贼",
	}
end)

AceLocale:RegisterTranslation(MAJOR_VERSION, "koKR", function()
	return {
		["Warlock"] = "흑마법사",
		["Warrior"] = "전사",
		["Hunter"] = "사냥꾼",
		["Mage"] = "마법사",
		["Priest"] = "사제",
		["Druid"] = "드루이드",
		["Paladin"] = "성기사",
		["Shaman"] = "주술사",
		["Rogue"] = "도적",
	}
end)

BabbleClass = AceLocale:GetInstance(MAJOR_VERSION, true)
BabbleClass:SetStrictness(true)

function BabbleClass:NeedsUpgrade(revision)
    if tonumber(revision) > tonumber(MINOR_VERSION) then return true else return false end
end

function BabbleClass:GetColor(class)
    if ( type(class) ~= "string" ) then error("Class must be a string value.") return end
	if string.find(class, "^[A-Z]*$") then
		class = string.upper(strsub(class, 1, 1)) .. string.lower(strsub(class, 2))
	elseif self:HasReverseTranslation(class) then
		class = self(class, "reverse")
	end
	if class == "Warlock" then
		return RAID_CLASS_COLORS["WARLOCK"].r, RAID_CLASS_COLORS["WARLOCK"].g, RAID_CLASS_COLORS["WARLOCK"].b
	elseif class == "Warrior" then
		return RAID_CLASS_COLORS["WARRIOR"].r, RAID_CLASS_COLORS["WARRIOR"].g, RAID_CLASS_COLORS["WARRIOR"].b
	elseif class == "Hunter" then
		return RAID_CLASS_COLORS["HUNTER"].r, RAID_CLASS_COLORS["HUNTER"].g, RAID_CLASS_COLORS["HUNTER"].b
	elseif class == "Mage" then
		return RAID_CLASS_COLORS["MAGE"].r, RAID_CLASS_COLORS["MAGE"].g, RAID_CLASS_COLORS["MAGE"].b
	elseif class == "Priest" then
		return RAID_CLASS_COLORS["PRIEST"].r, RAID_CLASS_COLORS["PRIEST"].g, RAID_CLASS_COLORS["PRIEST"].b
	elseif class == "Druid" then
		return RAID_CLASS_COLORS["DRUID"].r, RAID_CLASS_COLORS["DRUID"].g, RAID_CLASS_COLORS["DRUID"].b
	elseif class == "Paladin" then
		return RAID_CLASS_COLORS["PALADIN"].r, RAID_CLASS_COLORS["PALADIN"].g, RAID_CLASS_COLORS["PALADIN"].b
	elseif class == "Shaman" then
		return RAID_CLASS_COLORS["SHAMAN"].r, RAID_CLASS_COLORS["SHAMAN"].g, RAID_CLASS_COLORS["SHAMAN"].b
	elseif class == "Rogue" then
		return RAID_CLASS_COLORS["ROGUE"].r, RAID_CLASS_COLORS["ROGUE"].g, RAID_CLASS_COLORS["ROGUE"].b
	end
		return 0.63, 0.63, 0.63
end

function BabbleClass:GetHexColor(class)
    if ( type(class) ~= "string" ) then error("Class must be a string value.") return end
	local r, g, b = self:GetColor(class)
	return string.format("%02x%02x%02x", r * 255, g * 255, b * 255)
end
