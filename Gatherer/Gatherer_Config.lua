--[[
	Saved Variables Configuration and management code
]]

Gatherer_Settings = {};

Gatherer_Configuration = {};
_G = getfenv(0);
local metatable = { __index = _G };
Gatherer_Configuration.global = _G;
Gatherer_Configuration._G = _G;
setmetatable( Gatherer_Configuration, metatable );
setfenv(1, Gatherer_Configuration);

Default_Settings = {
	["minderTime"] = 5,
	["maxDist"] = 20,
	["alphaUnderMinIcon"] = 80,
	["number"] = 10,
	["mapMinder"] = false,
	["showWorldMapFilters"] = 0,
	["logInfo"] = "on",
	["iconSet"] = "shaded",
	--["Version"] = "2.2.3.1",
	["ToggleWorldNotes"] = 0,
	["IconSize"] = 12,
	["useMinimapText"] = "on",
	["disableWMFreezeWorkaround"] = 1,
	["filter"] = "all",

	-- Minimap Display Options
	["NoIconOnMinDist"] = 0,
	["HideIcon"] = 0,
	["HideMiniNotes"] = 0,
	["miniIconDist"] = 30, --old default of 40
	["fadeDist"] = 60, --old default of 40
	["fadePerc"] = 80,

	--
	["rareOre"] = 0,

	-- MiniMap Icon Show Menu Options
	["ShowOnMouse"] = 1,
	["ShowOnClick"] = 0,
	["ShowOnButton"] = 0,
	["HideOnMouse"] = 1,
	["HideOnClick"] = 0,
	["HideOnButton"] = 0,

	-- Minimap Icon Position
	["Position"] = 12,
	["Radius"] = 80,

	-- location display
	["useMainmap"] = true,
	["useMinimap"] = true,

	-- per gather type tables
	-- these tables are filled in by the code immediately after this table definition
	["interested"] = {},
	["filterRecording"] = {},
	["filters"] = {},

	-- min skill filters
	["minSetOreSkill"] = nil,
	["minSetHerbSkill"] = nil,

	-- debug
	["debug"] = false,

	['p2p'] = true,
}

--set per gather type defaults
for gatherType, nodeTypes in pairs(Gather_DB_IconIndex) do
	Default_Settings.filterRecording[gatherType] = false;
	Default_Settings.filters[gatherType] = "auto";

	local interestedTypeTable = {};
	for nodeType in pairs(nodeTypes) do
		if ( nodeType ~= "default" ) then
			interestedTypeTable[nodeType] = true;
		end
	end
	Default_Settings.interested[gatherType] = interestedTypeTable;
end

--defines keys which are saved in the PerCharacter settings
PerCharacter = {
	"interested",
	"filterRecording",
	"filters",
	"minSetOreSkill",
	"minSetHerbSkill",
}

--Load settings from the SavedVariables tables
function Load()
	local Gatherer_Settings = Gatherer_Settings;
	for key, value in pairs(Default_Settings) do
		Gatherer_Settings[key] = value;
	end

	if ( Gatherer_SavedSettings_AccountWide ) then
		for key, value in pairs(Gatherer_SavedSettings_AccountWide) do
			Gatherer_Settings[key] = value;
		end
	end

	if ( Gatherer_SavedSettings_PerCharacter ) then
		for key, value in pairs(Gatherer_SavedSettings_PerCharacter) do
			Gatherer_Settings[key] = value;
		end
	end
end

--Save settings to the SavedVariables tables
-- Call this when the PLAYER_LOGOUT event fires or saved settings
-- will not be updated
function Save()
	local Gatherer_Settings = Gatherer_Settings;

	local accountSettings = {};
	for key in pairs(Gatherer_Settings) do
		accountSettings[key] = Gatherer_Settings[key];
	end
	global.Gatherer_SavedSettings_AccountWide = accountSettings

	local characterSettings = {};
	for _, key in pairs(PerCharacter) do
		characterSettings[key] = Gatherer_Settings[key];
	end
	global.Gatherer_SavedSettings_PerCharacter = characterSettings;
end