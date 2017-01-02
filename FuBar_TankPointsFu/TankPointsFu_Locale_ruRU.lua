local L = AceLibrary("AceLocale-2.2"):new("TankPointsFu")

L:RegisterTranslations("ruRU", function() return {
	["Tank Points"] = "Tank Points", -- Desc
	["BonusScanner N/A"] = "BonusScanner не найден", -- BONUSSCANNER_MISSING
	["Display none"] = "Не показывать", -- DISPLAY_NONE
	["Primary Tank Stats"] = "Основные характеристики Танка", -- Header line
	["Melee Damage Stats"] = "Характеристики урона ближнего боя", -- Header line
	["Melee Avoidance Stats"] = "Характеристики уклонения ближнего боя", -- Header line
	["Calculated Tank Stats"] = "Расчитанные характеристики Танка", -- Header line
	["Resistances"] = "Сопротивления", -- Header line

	["Last Stand"] = "Ни шагу назад",
	["Shield Wall"] = "Глухая оборона",
	["Challenging Shout"] = "Вызывающий крик",

	["Defensive Stance"] = "Оборонительная стойка", -- Header line
	["Berserker Stance"] = "Стойка берсерка", -- Header line
	["Battle Stance"] = "Боевая стойка", -- Header line

	["Display"] = "Показывать", -- menu option
	
	["Attack"] ="Атака",
	
	["AceConsole-Commands"] = {"/tpfu", "/tankpointsfu"}
} end)
