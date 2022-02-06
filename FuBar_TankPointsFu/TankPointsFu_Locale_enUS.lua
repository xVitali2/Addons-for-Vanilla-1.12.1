local L = AceLibrary("AceLocale-2.2"):new("TankPointsFu")

L:RegisterTranslations("enUS", function() return {
	["Tank Points"] = true, -- Desc
	["BonusScanner N/A"] = true, -- BONUSSCANNER_MISSING
	["Display none"] = true, -- DISPLAY_NONE
	["Primary Tank Stats"] = true, -- Header line
	["Melee Damage Stats"] = true, -- Header line
	["Melee Avoidance Stats"] = true, -- Header line
	["Calculated Tank Stats"] = true, -- Header line
	["Resistances"] = true, -- Header line

	["Last Stand"] = true,
	["Shield Wall"] = true,
	["Challenging Shout"] = true,
	["Equip: Improves your chance to hit by %d%."] = true,
	["Equip: Increases the block value of your shield by %d."] = true,
	["Defense +%d/Stamina +%d/Block Value +%d"] = true,
	["%d Block"] = true,

	["Defensive Stance"] = true, -- Header line
	["Berserker Stance"] = true, -- Header line
	["Battle Stance"] = true, -- Header line

	["Display"] = true, -- menu option
	
	["Attack"] =true,
	
	["AceConsole-Commands"] = {"/tpfu", "/tankpointsfu"}
} end)
