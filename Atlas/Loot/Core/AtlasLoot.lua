--[[
Atlasloot Enhanced
Author Daviesh
Loot browser associating loot with instance bosses
Can be integrated with Atlas (http://www.atlasmod.com)

Functions:
AtlasLoot_OnEvent(event)
AtlasLoot_OnVariablesLoaded()
AtlasLoot_OnLoad()
AtlasLoot_SlashCommand(msg)
AtlasLoot_SetupForAtlas()
AtlasLoot_SetItemInfoFrame()
AtlasLoot_ShowMenu()
AtlasLootBoss_OnClick(name)
AtlasLootDefaultFrame_OnShow()
AtlasLootDefaultFrame_OnHide()
AtlasLootOptions_OnLoad()
AtlasLootOptions_Init()
AtlasLootOptions_Fresh()
AtlasLootOptions_Toggle()
AtlasLootOptions_SafeLinksToggle()
AtlasLootOptions_AllLinksToggle()
AtlasLootOptions_DefaultTTToggle()
AtlasLootOptions_LootlinkTTToggle()
AtlasLootOptions_ItemSyncTTToggle()
AtlasLootOptions_EquipCompareToggle()
AtlasLootOptions_OpaqueToggle()
AtlasLootOptions_ItemIDToggle()
AtlasLootOptions_ItemSpam()
AtlasLoot_ShowItemsFrame()
AtlasLoot_DewDropClick(tablename, text, tabletype)
AtlasLoot_DewDropSubMenuClick(tablename, text)
AtlasLoot_DewdropSubMenuRegister(loottable)
AtlasLoot_DewdropRegister()
AtlasLootItemsFrame_OnCloseButton()
AtlasLoot_Toggle()
AtlasLootMenuItem_OnClick()
AtlasLoot_NavButton_OnClick()
AtlasLoot_IsLootTableAvailable(dataID)
AtlasLoot_GetLODModule(dataSource)
AtlasLoot_ShowQuickLooks(button)
AtlasLoot_RefreshQuickLookButtons()
AtlasLoot_Atlas_OnShow()
AtlasLoot_Refresh()
AtlasLoot_AtlasScrollBar_Update()
AtlasLoot_ShowBossLoot()
AtlasLootMinimapButton_OnClick()
AtlasLootMinimapButton_Init()
AtlasLootMinimapButton_OnEnter()
AtlasLootMinimapButton_UpdatePosition()
AtlasLootMinimapButton_BeingDragged()
AtlasLootMinimapButton_SetPosition()
AtlasLootItem_OnEnter()
AtlasLootItem_OnLeave()
AtlasLootItem_OnClick()
AtlasLoot_QueryLootPage()

strsplit
strtrim

]]

AtlasLoot = AceLibrary("AceAddon-2.0"):new("AceDB-2.0")

--Instance required libraries
local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");

--Establish version number and compatible version of Atlas
local VERSION_MAJOR = "4";
local VERSION_MINOR = "06";
local VERSION_BOSSES = "05";
ATLASLOOT_VERSION = "|cffFF8400AtlasLoot Enhanced v"..VERSION_MAJOR.."."..VERSION_MINOR.."."..VERSION_BOSSES.."|r";
ATLASLOOT_CURRENT_ATLAS = "1.12.0.2";
ATLASLOOT_PREVIEW_ATLAS = "1.12.1";

--Compatibility with old EquipCompare/EQCompare
ATLASLOOT_OPTIONS_EQUIPCOMPARE = AL["Use EquipCompare"];
ATLASLOOT_OPTIONS_EQUIPCOMPARE_DISABLED = AL["|cff9d9d9dUse EquipCompare|r"];

--Standard indent to line text up with Atlas text
ATLASLOOT_INDENT = "	";

--Make the Dewdrop menu in the standalone loot browser accessible here
AtlasLoot_Dewdrop = AceLibrary("Dewdrop-2.0");
AtlasLoot_DewdropSubMenu = AceLibrary("Dewdrop-2.0");

--Variable to cap debug spam
ATLASLOOT_DEBUGSHOWN = false;

-- Colours stored for code readability
local GREY = "|cff999999";
local RED = "|cffff0000";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff1eff00";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";
local DEFAULT = "|cffFFd200";

--Establish number of boss lines in the Atlas frame for scrolling
local ATLAS_LOOT_BOSS_LINES	= 24;

--Flag so that error messages do not spam
local ATLASLOOT_POPUPSHOWN = false;

--Set the default anchor for the loot frame to the Atlas frame
AtlasLoot_AnchorFrame = AtlasFrame;

--Variables to hold hooked Atlas functions
Hooked_Atlas_Refresh = nil;
Hooked_Atlas_OnShow = nil;
Hooked_AtlasScrollBar_Update = nil;

AtlasLootCharDB={};

AtlasLoot:RegisterDB("AtlasLootDB");

--Popup Box for first time users
StaticPopupDialogs["ATLASLOOT_SETUP"] = {
	text = AL["Welcome to Atlasloot Enhanced.  Please take a moment to set your preferences."].."\n\n"..AL["New feature in 4.05.00: All professions are now included in the AtlasLoot_Crafting module."].."\n\n"..AL["New feature in 4.05.00: Advanced searching functionality is now available. You can type in a partial item name, for example typing 'elixir' gives all items in the database with 'elixir' in the name.  Big thanks to Kurax for his help."].."\n",
	button1 = AL["Setup"],
	OnAccept = function()
		AtlasLootOptions_Toggle();
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1
};

--Popup Box for an old version of Atlas
StaticPopupDialogs["ATLASLOOT_OLD_ATLAS"] = {
	text = AL["It has been detected that your version of Atlas does not match the version that Atlasloot is tuned for ("]..ATLASLOOT_CURRENT_ATLAS..AL[").  Depending on changes, there may be the occasional error, so please visit http://www.atlasmod.com as soon as possible to update."],
	button1 = AL["OK"],
	OnAccept = function()
		DEFAULT_CHAT_FRAME:AddMessage(BLUE..AL["AtlasLoot"]..": "..RED..AL["Incompatible Atlas Detected"]);
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1
};

AtlasLoot_Data["AtlasLootFallback"] = {
	EmptyInstance = {};
};

local DefaultAtlasLootOptions = {
	SafeLinks = true,
	AllLinks = false,
	DefaultTT = true,
	LootlinkTT = false,
	ItemSyncTT = false,
	EquipCompare = false,
	Opaque = false,
	ItemIDs = false,
	ItemSpam = true,
	MinimapButton = true,
	MinimapButtonPosition = 315,
	MinimapButtonRadius = 78,
	HidePanel = false,
	LastBoss = "RFCTaragaman",
	LastBossText = AL["Taragaman the Hungerer"],
	AtlasLootVersion = VERSION_MAJOR..VERSION_MINOR..VERSION_BOSSES,
	AutoQuery = false,
	PartialMatching = true,
};

AtlasLoot_MenuList = {
	"PVPMENU",
	"ABRepMenu",
	"AVRepMenu",
	"WSGRepMenu",
	"PVPSET",
	"SETMENU",
	"AQ20SET",
	"AQ40SET",
	"PRE60SET",
	"ZGSET",
	"T3SET",
	"T2SET",
	"T1SET",
	"T0SET",
	"WORLDEPICS",
	"REPMENU",
	"WORLDEVENTMENU",
	"AbyssalCouncil",
	"ALCHEMYMENU",
	"CRAFTINGMENU",
	"SMITHINGMENU",
	"ENCHANTINGMENU",
	"ENGINEERINGMENU",
	"LEATHERWORKINGMENU",
	"MININGMENU",
	"TAILORINGMENU",
	"CRAFTSET",
	"COOKINGMENU",
};

--entrance maps to instance maps NOT NEEDED FOR ATLAS 1.12
local EntToInstMatches = {
	["BlackfathomDeepsEnt"] =		{"BlackfathomDeeps"};
	["BlackrockMountainEnt"] =			{"BlackrockSpireLower","BlackrockSpireUpper","BlackwingLair","BlackrockDepths","MoltenCore"};
	["GnomereganEnt"] =				{"Gnomeregan"};
	["MaraudonEnt"] =				{"Maraudon"};
	["TheDeadminesEnt"] =			{"TheDeadmines"};
	["TheSunkenTempleEnt"] =		{"TheSunkenTemple"};
	["UldamanEnt"] =				{"Uldaman"};
	["WailingCavernsEnt"] =			{"WailingCaverns"};
	["DireMaulEnt"] =				{"DireMaulEast","DireMaulNorth","DireMaulWest"};
	["SMEnt"] =						{"SMArmory","SMLibrary","SMCathedral","SMGraveyard"};
};

--instance maps to entrance maps
local InstToEntMatches = {
	["BlackfathomDeeps"] =			{"BlackfathomDeepsEnt"};
	["BlackrockSpireLower"] =		{"BlackrockMountainEnt"};
	["BlackrockSpireUpper"] =		{"BlackrockMountainEnt"};
	["BlackwingLair"] =				{"BlackrockMountainEnt"};
	["BlackrockDepths"] =			{"BlackrockMountainEnt"};
	["MoltenCore"] =				{"BlackrockMountainEnt"};
	["Gnomeregan"] =				{"GnomereganEnt"};
	["Maraudon"] =					{"MaraudonEnt"};
	["TheDeadmines"] =				{"TheDeadminesEnt"};
	["TheSunkenTemple"] =			{"TheSunkenTempleEnt"};
	["Uldaman"] =					{"UldamanEnt"};
	["WailingCaverns"] =			{"WailingCavernsEnt"};
	["DireMaulEast"] =				{"DireMaulEnt"};
	["DireMaulNorth"] =				{"DireMaulEnt"};
	["DireMaulWest"] =				{"DireMaulEnt"};
	["SMArmory"] =					{"SMEnt"};
	["SMLibrary"] =					{"SMEnt"};
	["SMCathedral"] =				{"SMEnt"};
	["SMGraveyard"] =				{"SMEnt"};
};

--[[
AtlasLootDefaultFrame_OnShow:
Called whenever the loot browser is shown and sets up buttons and loot tables
]]
function AtlasLootDefaultFrame_OnShow()
	--Definition of where I want the loot table to be shown	
	pFrame = { "TOPLEFT", "AtlasLootDefaultFrame_LootBackground", "TOPLEFT", "2", "-2" };
	--Having the Atlas and loot browser frames shown at the same time would
	--cause conflicts, so I hide the Atlas frame when the loot browser appears
	if AtlasFrame then
		AtlasFrame:Hide();
	end
	--Remove the selection of a loot table in Atlas
	AtlasLootItemsFrame.activeBoss = nil;
	--Set the item table to the loot table
	AtlasLoot_SetItemInfoFrame(pFrame);
	--Show the last displayed loot table
	if AtlasLoot_IsLootTableAvailable(AtlasLootCharDB.LastBoss) then
		AtlasLoot_ShowBossLoot(AtlasLootCharDB.LastBoss, AtlasLootCharDB.LastBossText, pFrame);
	else
		AtlasLoot_ShowBossLoot("EmptyInstance", AL["AtlasLoot"], pFrame);
	end
end

--[[
AtlasLoot_OnEvent(event):
event - Name of the event, passed from the API
Invoked whenever a relevant event is detected by the engine.  The function then
decides what action to take depending on the event.
]]
function AtlasLoot_OnEvent(event)
	--Addons all loaded
	if(event == "VARIABLES_LOADED") then
		AtlasLoot_OnVariablesLoaded();
	--Taint errors
	elseif(arg1 == "AtlasLoot") then
		--Junk command to suppress taint message
		local i=3;
	end
end

--[[
AtlasLoot_OnVariablesLoaded:
Invoked by the VARIABLES_LOADED event.  Now that we are sure all the assets
the addon needs are in place, we can properly set up the mod
]]
function AtlasLoot_OnVariablesLoaded()
	if not AtlasLootCharDB then AtlasLootCharDB = {} end
	if not AtlasLootCharDB["WishList"] then AtlasLootCharDB["WishList"] = {} end
	if not AtlasLootCharDB["QuickLooks"] then AtlasLootCharDB["QuickLooks"] = {} end
	if not AtlasLootCharDB["SearchResult"] then AtlasLootCharDB["SearchResult"] = {} end
	--Add the loot browser to the special frames tables to enable closing wih the ESC key
	tinsert(UISpecialFrames, "AtlasLootDefaultFrame");
	--Set up options frame
	AtlasLootOptions_OnLoad();
	--Legacy code for those using the ultimately failed attempt at making Atlas load on demand
	if AtlasButton_LoadAtlas then
		AtlasButton_LoadAtlas();
	end
	--Hook the necessary Atlas functions
	Hooked_Atlas_Refresh = Atlas_Refresh;
	Atlas_Refresh = AtlasLoot_Refresh;
	Hooked_Atlas_OnShow = Atlas_OnShow;
	Atlas_OnShow = AtlasLoot_Atlas_OnShow;
	--Instead of hooking, replace the scrollbar driver function
	Hooked_AtlasScrollBar_Update = AtlasScrollBar_Update;
	AtlasScrollBar_Update = AtlasLoot_AtlasScrollBar_Update;
	--Disable options that don't have the supporting mods
	if ( not LootLink_SetTooltip and (AtlasLootCharDB.LootlinkTT == true )) then
		AtlasLootCharDB.LootlinkTT = false;
		AtlasLootCharDB.DefaultTT = true;
	end
	if( not ItemSync and (AtlasLootCharDB.ItemSyncTT == true)) then
		AtlasLootCharDB.ItemSyncTT = false;
		AtlasLootCharDB.DefaultTT = true;
	end
	if( (not IsAddOnLoaded("EQCompare") and not IsAddOnLoaded("EquipCompare")) and (AtlasLootCharDB.EquipCompare == true)) then
		AtlasLootCharDB.EquipCompare = false;
	end
	--If using an opaque items frame, change the alpha value of the backing texture
	if (AtlasLootCharDB.Opaque) then
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 1);
	else
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65);
	end
	--If Atlas is installed, set up for Atlas
	if ( Hooked_Atlas_Refresh ) then
		AtlasLoot_SetupForAtlas();
		--If a first time user, set up options
		if AtlasLootCharDB.FirstTime == nil or AtlasLootCharDB.FirstTime == true then
			StaticPopup_Show ("ATLASLOOT_SETUP");
			AtlasLootCharDB.FirstTime = false;
		end
		--If an older version
		if AtlasLootCharDB.FirstTime == nil and tonumber(AtlasLootCharDB.AtlasLootVersion) < 40500 then
			AtlasLootCharDB.SafeLinks = true;
			AtlasLootCharDB.AllLinks = false;
			AtlasLootCharDB.AtlasLootVersion = VERSION_MAJOR..VERSION_MINOR..VERSION_BOSSES;
			StaticPopup_Show ("ATLASLOOT_SETUP");
			AtlasLootCharDB.FirstTime = false;
		end
		--If not the expected Atlas version
		if( ATLAS_VERSION ~= ATLASLOOT_CURRENT_ATLAS and ATLAS_VERSION ~= ATLASLOOT_PREVIEW_ATLAS ) then
			StaticPopup_Show ("ATLASLOOT_OLD_ATLAS");
		end
		Hooked_Atlas_Refresh();
	else
		--If we are not using Atlas, keep the items frame out of the way
		AtlasLootItemsFrame:Hide();
	end
	--Check and migrate old WishList entry format to the newer one
	if tonumber(AtlasLootCharDB.AtlasLootVersion) < 40301 then
		--Check if we really need to do a migration since it will load all modules
		--We also create a helper table here which store IDs that need to search for
		local idsToSearch = {};
		for i = 1, table.getn(AtlasLootCharDB["WishList"]) do
			if (AtlasLootCharDB["WishList"][i][1] > 0 and not AtlasLootCharDB["WishList"][i][5]) then
				tinsert(idsToSearch, i, AtlasLootCharDB["WishList"][i][1]);
			end
		end
		if table.getn(idsToSearch) > 0 then
			--Let's do this
			for _, dataSource in ipairs(AtlasLoot_SearchTables) do
				if AtlasLoot_Data[dataSource] then
					for dataID, lootTable in pairs(AtlasLoot_Data[dataSource]) do
						for _, entry in ipairs(lootTable) do
							for k, v in pairs(idsToSearch) do
								if(entry[1] == v)then
									AtlasLootCharDB["WishList"][k][5] = dataID.."|"..dataSource;
									break;
								end
							end
						end
					end
				end
			end
		end
		AtlasLootCharDB.AtlasLootVersion = VERSION_MAJOR..VERSION_MINOR..VERSION_BOSSES;
		AtlasLootCharDB.AutoQuery = false;
		AtlasLootOptions_Init();
	end
	--Adds an AtlasLoot button to the Feature Frame in Cosmos
	if(EarthFeature_AddButton) then
		EarthFeature_AddButton(
			{
				id = string.sub(ATLASLOOT_VERSION, 11, 28);
				name = string.sub(ATLASLOOT_VERSION, 11, 28);
				subtext = string.sub(ATLASLOOT_VERSION, 30, 39);
				tooltip = "";
				icon = "Interface\\Icons\\INV_Box_01";
				callback = AtlasLoot_ShowMenu;
				test = nil;
			}
	);
	--Adds AtlasLoot to old style Cosmos installations
	elseif(Cosmos_RegisterButton) then
		Cosmos_RegisterButton(
			string.sub(ATLASLOOT_VERSION, 11, 28),
			string.sub(ATLASLOOT_VERSION, 11, 28),
			"",
			"Interface\\Icons\\INV_Box_01",
			AtlasLoot_ShowMenu
		);
	end
	--Set up the menu in the loot browser
	AtlasLoot_DewdropRegister();
	--Enable or disable AtlasLootFu based on seleced options
	--If EquipCompare is available, use it
	if((IsAddOnLoaded("EquipCompare")) and (AtlasLootCharDB.EquipCompare == true)) then
		EquipCompare_RegisterTooltip(AtlasLootTooltip);
		EquipCompare_RegisterTooltip(AtlasLootTooltip2);
	end
	if(IsAddOnLoaded("EQCompare") and (AtlasLootCharDB.EquipCompare == true)) then
		EQCompare:ShoppingTooltip1(AtlasLootTooltip);
		EQCompare:RegisterTooltip(AtlasLootTooltip2);
	end
	--Position relevant UI objects for loot browser and set up menu
	AtlasLootDefaultFrame_SelectedCategory:SetPoint("TOP", "AtlasLootDefaultFrame_Menu", "BOTTOM", 0, -4);
	AtlasLootDefaultFrame_SelectedTable:SetPoint("TOP", "AtlasLootDefaultFrame_SubMenu", "BOTTOM", 0, -4);
	AtlasLootDefaultFrame_SelectedCategory:SetText(AL["Choose Table ..."]);
	AtlasLootDefaultFrame_SelectedTable:SetText("");
	AtlasLootDefaultFrame_SelectedCategory:Show();
	AtlasLootDefaultFrame_SelectedTable:Show();
	AtlasLootDefaultFrame_SubMenu:Disable();
end

--[[
AtlasLootOptions_OnLoad:
Function is loaded when the addon is loaded
]]
function AtlasLootOptions_OnLoad()
	--Disable checkboxes of missing addons
	if( not LootLink_SetTooltip ) then
		AtlasLootOptionsFrameLootlinkTT:Disable();
		AtlasLootOptionsFrameLootlinkTTText:SetText(AL["|cff9d9d9dLootlink Tooltips|r"]);
	end
	if( not ItemSync ) then
		AtlasLootOptionsFrameItemSyncTT:Disable();
		AtlasLootOptionsFrameItemSyncTTText:SetText(AL["|cff9d9d9dItemSync Tooltips|r"]);
	end
	if( not IsAddOnLoaded("EQCompare") and not IsAddOnLoaded("EquipCompare")) then
		AtlasLootOptionsFrameEquipCompare:Disable();
		AtlasLootOptionsFrameEquipCompareText:SetText(AL["|cff9d9d9dUse EquipCompare|r"]);
	end
	AtlasLootOptions_Init();
	UIPanelWindows['AtlasLootOptionsFrame'] = {area = 'center', pushable = 0};
end

--[[
AtlasLootOptions_Init:
Initiates the options.
]]
function AtlasLootOptions_Init()
	--clear saved vars for a new version (or a new install!)
	if AtlasLootCharDB.FirstTime == nil then
		AtlasLootOptions_Fresh();
	end
	--Initialise all the check boxes on the options frame
	AtlasLootOptionsFrameSafeLinks:SetChecked(AtlasLootCharDB.SafeLinks);
	AtlasLootOptionsFrameAllLinks:SetChecked(AtlasLootCharDB.AllLinks);
	AtlasLootOptionsFrameDefaultTT:SetChecked(AtlasLootCharDB.DefaultTT);
	AtlasLootOptionsFrameLootlinkTT:SetChecked(AtlasLootCharDB.LootlinkTT);
	AtlasLootOptionsFrameItemSyncTT:SetChecked(AtlasLootCharDB.ItemSyncTT);
	AtlasLootOptionsFrameEquipCompare:SetChecked(AtlasLootCharDB.EquipCompare);
	AtlasLootOptionsFrameOpaque:SetChecked(AtlasLootCharDB.Opaque);
	AtlasLootOptionsFrameItemID:SetChecked(AtlasLootCharDB.ItemIDs);
	AtlasLootOptionsFrameItemSpam:SetChecked(AtlasLootCharDB.ItemSpam);
	AtlasLootOptionsFrameHidePanel:SetChecked(AtlasLootCharDB.HidePanel);
	AtlasLootOptionsFrameMinimap:SetChecked(AtlasLootCharDB.MinimapButton);
	AtlasLootOptionsFrameSliderButtonPos:SetValue(AtlasLootCharDB.MinimapButtonPosition);
	AtlasLootOptionsFrameSliderButtonRad:SetValue(AtlasLootCharDB.MinimapButtonRadius);
	AtlasLootMinimapButtonFrame:SetPoint(
		"TOPLEFT",
		"Minimap",
		"TOPLEFT",
		54 - (AtlasLootCharDB.MinimapButtonRadius * cos(AtlasLootCharDB.MinimapButtonPosition)),
		(AtlasLootCharDB.MinimapButtonRadius * sin(AtlasLootCharDB.MinimapButtonPosition)) - 55
	);
end

--[[
Atlas_FreshOptions:
Sets default options on a fresh start.
]]
function AtlasLootOptions_Fresh()
	AtlasLootCharDB.SafeLinks = false;
	AtlasLootCharDB.AllLinks = true;
	AtlasLootCharDB.DefaultTT = true;
	AtlasLootCharDB.LootlinkTT = false;
	AtlasLootCharDB.ItemSyncTT = false;
	AtlasLootCharDB.EquipCompare = false;
	AtlasLootCharDB.Opaque = false;
	AtlasLootCharDB.ItemIDs = false;
	AtlasLootCharDB.FirstTime = true;
	AtlasLootCharDB.ItemSpam = false;
	AtlasLootCharDB.MinimapButton = true;
	AtlasLootCharDB.MinimapButtonPosition = 315;
	AtlasLootCharDB.MinimapButtonRadius = 78;
	AtlasLootCharDB.HidePanel = false;
	AtlasLootCharDB.LastBoss = "RFCTaragaman";
	AtlasLootCharDB.LastBossText = AL["Taragaman the Hungerer"];
	AtlasLootCharDB.AtlasLootVersion = VERSION_MAJOR..VERSION_MINOR..VERSION_BOSSES;
	AtlasLootCharDB.AutoQuery = false;
	AtlasLootCharDB.PartialMatching = true;
end

--[[
AtlasLoot_OnLoad:
Performs inital setup of the mod and registers it for further setup when
the required resources are in place
]]
function AtlasLoot_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("ADDON_ACTION_FORBIDDEN");
	this:RegisterEvent("ADDON_ACTION_BLOCKED");
	--Enable the use of /al or /atlasloot to open the loot browser
	SLASH_ATLASLOOT1 = "/atlasloot";
	SLASH_ATLASLOOT2 = "/al";
	SlashCmdList["ATLASLOOT"] = function(msg)
		AtlasLoot_SlashCommand(msg);
	end
end

--[[
AtlasLoot_SlashCommand(msg):
msg - takes the argument for the /atlasloot command so that the appropriate action can be performed
If someone types /atlasloot, bring up the options box
]]
function AtlasLoot_SlashCommand(msg)
	if msg == AL["reset"] then
		AtlasLootOptions_ResetPosition();
	elseif msg == AL["default"] then
		AtlasLootOptions_DefaultSettings();
	elseif msg == AL["options"] then
		AtlasLootOptions_Toggle();
	else
		AtlasLootDefaultFrame:Show();
	end
end

--[[
AtlasLootDefaultFrame_OnHide:
When we close the loot browser, re-bind the item table to Atlas
and close all Dewdrop menus
]]
function AtlasLootDefaultFrame_OnHide()
	if AtlasFrame then
		AtlasLoot_SetupForAtlas();
	end
	AtlasLoot_Dewdrop:Close(1);
	AtlasLoot_DewdropSubMenu:Close(1);
end

--[[
AtlasLoot_SetupForAtlas:
This function sets up the Atlas specific XML objects
]]
function AtlasLoot_SetupForAtlas()
	--Poisition the frame with the AtlasLoot version details in the Atlas frame
	AtlasLootInfo:ClearAllPoints();
	AtlasLootInfo:SetParent(AtlasFrame);
	AtlasLootInfo:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 546, -3);
	--Anchor the bottom panel to the Atlas frame
	AtlasLootPanel:ClearAllPoints();
	AtlasLootPanel:SetParent(AtlasFrame);
	AtlasLootPanel:SetPoint("TOP", "AtlasFrame", "BOTTOM", 0, 9);
	--Anchor the loot table to the Atlas frame
	AtlasLoot_SetItemInfoFrame();
	AtlasLootItemsFrame:Hide();
	AtlasLoot_AnchorFrame = AtlasFrame;
end

--[[
AtlasLoot_SetItemInfoFrame(pFrame):
pFrame - Data structure with anchor info.  Format: {Anchor Point, Relative Frame, Relative Point, X Offset, Y Offset }
This function anchors the item frame where appropriate.  The main Atlas frame can be passed instead of a custom pFrame.
If no pFrame is specified, the Atlas Frame is used if Atlas is installed.
]]
function AtlasLoot_SetItemInfoFrame(pFrame)
	if ( pFrame ) then
		--If a pFrame is specified, use it
		if(pFrame==AtlasFrame and AtlasFrame) then
			AtlasLootItemsFrame:ClearAllPoints();
			AtlasLootItemsFrame:SetParent(AtlasFrame);
			AtlasLootItemsFrame:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 18, -84);
		else
			AtlasLootItemsFrame:ClearAllPoints();
			AtlasLootItemsFrame:SetParent(pFrame[2]);
			AtlasLootItemsFrame:ClearAllPoints();
			AtlasLootItemsFrame:SetPoint(pFrame[1], pFrame[2], pFrame[3], pFrame[4], pFrame[5]);
		end
	elseif ( AtlasFrame ) then
		--If no pFrame is specified and Atlas is installed, anchor in Atlas
		AtlasLootItemsFrame:ClearAllPoints();
		AtlasLootItemsFrame:SetParent(AtlasFrame);
		AtlasLootItemsFrame:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 18, -84);
	else
		--Last resort, dump the items frame in the middle of the screen
		AtlasLootItemsFrame:ClearAllPoints();
		AtlasLootItemsFrame:SetParent(UIParent);
		AtlasLootItemsFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0);
	end
	AtlasLootItemsFrame:Show();
end

--[[
AtlasLoot_AtlasScrollBar_Update:
Hooks the Atlas scroll frame.  
Required as the Atlas function cannot deal with the AtlasLoot button template or the added Atlasloot entries
]]
function AtlasLoot_AtlasScrollBar_Update()
	local line, lineplusoffset;
	if (getglobal("AtlasBossLine1_Text") ~= nil) then
		local zoneID = ATLAS_DROPDOWNS[AtlasOptions.AtlasType][AtlasOptions.AtlasZone];
		--Update the contents of the Atlas scroll frame
		FauxScrollFrame_Update(AtlasScrollBar,ATLAS_CUR_LINES,ATLAS_LOOT_BOSS_LINES,15);
		--Make note of how far in the scroll frame we are
		for line=1,ATLAS_NUM_LINES do
			lineplusoffset = line + FauxScrollFrame_GetOffset(AtlasScrollBar);
			if ( lineplusoffset <= ATLAS_CUR_LINES ) then
				getglobal("AtlasBossLine"..line.."_Text"):SetText(ATLAS_SCROLL_LIST[lineplusoffset]);
				if AtlasLootItemsFrame.activeBoss == lineplusoffset then
					getglobal("AtlasBossLine"..line):Enable();
					getglobal("AtlasBossLine"..line.."_Loot"):Hide();
					getglobal("AtlasBossLine"..line.."_Selected"):Show();
				elseif (AtlasLootBossButtons[zoneID]~=nil and AtlasLootBossButtons[zoneID][lineplusoffset] ~= nil and AtlasLootBossButtons[zoneID][lineplusoffset] ~= "") then
					getglobal("AtlasBossLine"..line):Enable();
					getglobal("AtlasBossLine"..line.."_Loot"):Show();
					getglobal("AtlasBossLine"..line.."_Selected"):Hide();
				elseif (AtlasLootWBBossButtons[zoneID]~=nil and AtlasLootWBBossButtons[zoneID][lineplusoffset] ~= nil and AtlasLootWBBossButtons[zoneID][lineplusoffset] ~= "") then
					getglobal("AtlasBossLine"..line):Enable();
					getglobal("AtlasBossLine"..line.."_Loot"):Show();
					getglobal("AtlasBossLine"..line.."_Selected"):Hide();
				elseif (AtlasLootBattlegrounds[zoneID]~=nil and AtlasLootBattlegrounds[zoneID][lineplusoffset] ~= nil and AtlasLootBattlegrounds[zoneID][lineplusoffset] ~= "") then
					getglobal("AtlasBossLine"..line):Enable();
					getglobal("AtlasBossLine"..line.."_Loot"):Show();
					getglobal("AtlasBossLine"..line.."_Selected"):Hide();
				else
					getglobal("AtlasBossLine"..line):Disable();
					getglobal("AtlasBossLine"..line.."_Loot"):Hide();
					getglobal("AtlasBossLine"..line.."_Selected"):Hide();
				end
				getglobal("AtlasBossLine"..line).idnum = lineplusoffset;
				getglobal("AtlasBossLine"..line):Show();
			elseif ( getglobal("AtlasBossLine"..line) ) then
				--Hide lines that are not needed
				getglobal("AtlasBossLine"..line):Hide();
			end
		end
	end
end

--[[
AtlasLoot_Refresh:
Replacement for Atlas_Refresh, required as the template for the boss buttons in Atlas is insufficient
Called whenever the state of Atlas changes
]]
function AtlasLoot_Refresh()
	--Reset which loot page is 'current'
	AtlasLootItemsFrame.activeBoss = nil;
	--Get map selection info from Atlas
	local zoneID = ATLAS_DROPDOWNS[AtlasOptions.AtlasType][AtlasOptions.AtlasZone];
	local data = AtlasMaps;
	local base = {};
	--Get boss name information
	for k,v in pairs(data[zoneID]) do
		base[k] = v;
	end
	--Display the newly selected texture
	AtlasMap:ClearAllPoints();
	AtlasMap:SetWidth(512);
	AtlasMap:SetHeight(512);
	AtlasMap:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 18, -84);
	local builtIn = AtlasMap:SetTexture("Interface\\AddOns\\Atlas\\Images\\Maps\\"..zoneID);
	--If texture was not found in the core Atlas mod, check plugins
	if ( not builtIn ) then
		for k,v in pairs(ATLAS_PLUGINS) do
			if ( AtlasMap:SetTexture("Interface\\AddOns\\"..v.."\\Images\\"..zoneID) ) then
				break;
			end
		end
	end
	--Setup info panel above boss listing
	local tName = base.ZoneName[1];
	if ( AtlasOptions.AtlasAcronyms and base.Acronym ~= nil) then
		local _RED = "|cffcc6666";
		tName = tName.._RED.." ["..base.Acronym.."]";
	end
	AtlasText_ZoneName_Text:SetText(tName);
	local tLoc = "";
	local tLR = "";
	local tML = "";
	local tPL = "";
	if ( base.Location[1] ) then
		tLoc = ATLAS_STRING_LOCATION..": "..base.Location[1];
	end
	if ( base.LevelRange ) then
		tLR = ATLAS_STRING_LEVELRANGE..": "..base.LevelRange;
	end
	if ( base.MinLevel ) then
		tML = ATLAS_STRING_MINLEVEL..": "..base.MinLevel;
	end
	if ( base.PlayerLimit ) then
		tPL = ATLAS_STRING_PLAYERLIMIT..": "..base.PlayerLimit;
	end
	AtlasText_Location_Text:SetText(tLoc);
	AtlasText_LevelRange_Text:SetText(tLR);
	AtlasText_MinLevel_Text:SetText(tML);
	AtlasText_PlayerLimit_Text:SetText(tPL);
	Atlastextbase = base;
	--Get the size of the Atlas text to append stuff to the bottom.  Looks for empty lines
	local i = 1;
	local j = 2;
	while ( (Atlastextbase[i] ~= nil and Atlastextbase[i]~="") or (Atlastextbase[j] ~= nil and Atlastextbase[j]~="")) do
		i = i + 1;
		j = i + 1;
	end
	--Hide any Atlas objects lurking around that have now been replaced
	for i=1,ATLAS_CUR_LINES do
		if ( getglobal("AtlasEntry"..i) ) then
			getglobal("AtlasEntry"..i):Hide();
		end
	end
	ATLAS_DATA = Atlastextbase;
	ATLAS_SEARCH_METHOD = data.Search;
	--Deal with Atlas's search function
	if ( data.Search == nil ) then
		ATLAS_SEARCH_METHOD = AtlasSimpleSearch;
	end
	if ( data.Search ~= false ) then
		AtlasSearchEditBox:Show();
		AtlasNoSearch:Hide();
	else
		AtlasSearchEditBox:Hide();
		AtlasNoSearch:Show();
		ATLAS_SEARCH_METHOD = nil;
	end
	--populate the scroll frame entries list, the update func will do the rest
	Atlas_Search("");
	AtlasSearchEditBox:SetText("");
	AtlasSearchEditBox:ClearFocus();
	--create and align any new entry buttons that we need
	for i=1,ATLAS_CUR_LINES do
		local f;
		if (not getglobal("AtlasBossLine"..i)) then
			f = CreateFrame("Button", "AtlasBossLine"..i, AtlasFrame, "AtlasLootNewBossLineTemplate");
			f:SetFrameStrata("MEDIUM");
			if i==1 then
				f:SetPoint("TOPLEFT", "AtlasScrollBar", "TOPLEFT", 16, -3);
			else
				f:SetPoint("TOPLEFT", "AtlasBossLine"..(i-1), "BOTTOMLEFT");
			end
		else
			getglobal("AtlasBossLine"..i.."_Loot"):Hide();
			getglobal("AtlasBossLine"..i.."_Selected"):Hide();
		end
	end
	--Hide the loot frame now that a pristine Atlas instance is created
	AtlasLootItemsFrame:Hide();
	Atlas_Search("");
	--Make sure the scroll bar is correctly offset
	AtlasLoot_AtlasScrollBar_Update();
	--see if we should display the entrance/instance button or not, and decide what it should say
	local matchFound = {nil};
	local sayEntrance = nil;
	for k,v in pairs(Atlas_EntToInstMatches) do
		if ( k == zoneID ) then
			matchFound = v;
			sayEntrance = false;
		end
	end
	if ( not matchFound[1] ) then
		for k,v in pairs(Atlas_InstToEntMatches) do
			if ( k == zoneID ) then
				matchFound = v;
				sayEntrance = true;
			end
		end
	end
	--set the button's text, populate the dropdown menu, and show or hide the button
	if ( matchFound[1] ~= nil ) then
		ATLAS_INST_ENT_DROPDOWN = {};
		for k,v in pairs(matchFound) do
			table.insert(ATLAS_INST_ENT_DROPDOWN, v);
		end
		table.sort(ATLAS_INST_ENT_DROPDOWN, AtlasSwitchDD_Sort);
		if ( sayEntrance ) then
			AtlasSwitchButton:SetText(ATLAS_ENTRANCE_BUTTON);
		else
			AtlasSwitchButton:SetText(ATLAS_INSTANCE_BUTTON);
		end
		AtlasSwitchButton:Show();
		UIDropDownMenu_Initialize(AtlasSwitchDD, AtlasSwitchDD_OnLoad);
	else
		AtlasSwitchButton:Hide();
	end
	if ( TitanPanelButton_UpdateButton ) then
		TitanPanelButton_UpdateButton("Atlas");
	end
end

--[[
AtlasLoot_Atlas_OnShow:
Hooks Atlas_OnShow() to add extra setup routines that AtlasLoot needs for
integration purposes.
]]
function AtlasLoot_Atlas_OnShow()
	Atlas_Refresh();
	--We don't want Atlas and the Loot Browser open at the same time, so the Loot Browser is close
	if AtlasLootDefaultFrame then
		AtlasLootDefaultFrame:Hide();
		AtlasLoot_SetupForAtlas();
	end
	--Call the Atlas function
	Hooked_Atlas_OnShow();
	--If we were looking at a loot table earlier in the session, it is still
	--saved on the item frame, so restore it in Atlas
	if AtlasLootItemsFrame.activeBoss ~= nil then
		AtlasLootItemsFrame:Show();
	else
		--If no loot table is selected, set up icons next to boss names
		for i=1,ATLAS_CUR_LINES do
			if (getglobal("AtlasEntry"..i.."_Selected") and getglobal("AtlasEntry"..i.."_Selected"):IsVisible()) then
				getglobal("AtlasEntry"..i.."_Loot"):Show();
				getglobal("AtlasEntry"..i.."_Selected"):Hide();
			end
		end
	end
	--Consult the saved variable table to see whether to show the bottom panel
	if AtlasLootCharDB.HidePanel == true then
		AtlasLootPanel:Hide();
	else
		AtlasLootPanel:Show();
	end 
	pFrame = AtlasFrame;
end

--[[
AtlasLoot_Toggle:
Simple function to toggle the visibility of the AtlasLoot frame.
]]
function AtlasLoot_Toggle()
	if(AtlasLootDefaultFrame:IsVisible()) then
		HideUIPanel(AtlasLootDefaultFrame);
	else
		ShowUIPanel(AtlasLootDefaultFrame);
	end
end

--[[
AtlasLootBoss_OnClick:
Invoked whenever a boss line in Atlas is clicked
Shows a loot page if one is associated with the button
]]
function AtlasLootBoss_OnClick(name)
	local zoneID = ATLAS_DROPDOWNS[AtlasOptions.AtlasType][AtlasOptions.AtlasZone];
	local id = this.idnum;
	--If the loot table was already shown and boss clicked again, hide the loot table and fix boss list icons
	if getglobal(name.."_Selected"):IsVisible() then
		getglobal(name.."_Selected"):Hide();
		getglobal(name.."_Loot"):Show();
		AtlasLootItemsFrame:Hide();
		AtlasLootItemsFrame.activeBoss = nil;
	else	
		--If an loot table is associated with the button, show it.  Note multiple tables need to be checked due to the database structure
		if (AtlasLootBossButtons[zoneID] ~= nil and AtlasLootBossButtons[zoneID][id] ~= nil and AtlasLootBossButtons[zoneID][id] ~= "") then
			if AtlasLoot_IsLootTableAvailable(AtlasLootBossButtons[zoneID][id]) then
				getglobal(name.."_Selected"):Show();
				getglobal(name.."_Loot"):Hide();
				local _,_,boss = string.find(getglobal(name.."_Text"):GetText(), "|c%x%x%x%x%x%x%x%x%s*[%dX']*[%) ]*(.*[^%,])[%,]?$");
				AtlasLoot_ShowBossLoot(AtlasLootBossButtons[zoneID][id], boss, AtlasFrame);
				AtlasLootItemsFrame.activeBoss = id;
				AtlasLoot_AtlasScrollBar_Update();
			end
		elseif (AtlasLootWBBossButtons[zoneID] ~= nil and AtlasLootWBBossButtons[zoneID][id] ~= nil and AtlasLootWBBossButtons[zoneID][id] ~= "") then
			if AtlasLoot_IsLootTableAvailable(AtlasLootWBBossButtons[zoneID][id]) then
				getglobal(name.."_Selected"):Show();
				getglobal(name.."_Loot"):Hide();
				local _,_,boss = string.find(getglobal(name.."_Text"):GetText(), "|c%x%x%x%x%x%x%x%x%s*[%dX]*[%) ]*(.*[^%,])[%,]?$");
				AtlasLoot_ShowBossLoot(AtlasLootWBBossButtons[zoneID][id], boss, AtlasFrame);
				AtlasLootItemsFrame.activeBoss = id;
				AtlasLoot_AtlasScrollBar_Update();
			end
		elseif (AtlasLootBattlegrounds[zoneID] ~= nil and AtlasLootBattlegrounds[zoneID][id] ~= nil and AtlasLootBattlegrounds[zoneID][id] ~= "") then
			if AtlasLoot_IsLootTableAvailable(AtlasLootBattlegrounds[zoneID][id]) then
				getglobal(name.."_Selected"):Show();
				getglobal(name.."_Loot"):Hide();
				local _,_,boss = string.find(getglobal(name.."_Text"):GetText(), "|c%x%x%x%x%x%x%x%x%s*[%wX]*[%) ]*(.*[^%,])[%,]?$");
				AtlasLoot_ShowBossLoot(AtlasLootBattlegrounds[zoneID][id], boss, AtlasFrame);
				AtlasLootItemsFrame.activeBoss = id;
				AtlasLoot_AtlasScrollBar_Update();
			end
		end
	end
	--This has been invoked from Atlas, so we remove any claim external mods have on the loot table
	AtlasLootItemsFrame.externalBoss = nil;
	--Hide the AtlasQuest frame if present so that the AtlasLoot items frame is not stuck under it
	if (AtlasQuestInsideFrame) then
		HideUIPanel(AtlasQuestInsideFrame);
	end
end

--[[
AtlasLoot_ShowMenu:
Legacy function used in Cosmos integration to open the loot browser
]]
function AtlasLoot_ShowMenu()
	AtlasLootDefaultFrame:Show();
end

--[[
AtlasLootOptions_SafeLinksToggle:
Toggles SafeLinks. Items uncached will be linked as their names.
]]
function AtlasLootOptions_SafeLinksToggle()
	if(AtlasLootCharDB.SafeLinks) then
		AtlasLootCharDB.SafeLinks = false;
	else
		AtlasLootCharDB.SafeLinks = true;
		AtlasLootCharDB.AllLinks = false;
	end
	AtlasLootOptions_Init();
end

--[[
AtlasLootOptions_AllLinksToggle:
Toggles AllLinks. All items will be linked.
]]
function AtlasLootOptions_AllLinksToggle()
	if(AtlasLootCharDB.AllLinks) then
		AtlasLootCharDB.AllLinks = false;
	else
		AtlasLootCharDB.AllLinks = true;
		AtlasLootCharDB.SafeLinks = false;
	end
	AtlasLootOptions_Init();
end

--[[
AtlasLootOptions_DefaultTTToggle:
Toggles DefaultTooltips. Uses default tooltips.
]]
function AtlasLootOptions_DefaultTTToggle()
	AtlasLootCharDB.DefaultTT = true;
	AtlasLootCharDB.LootlinkTT = false;
	AtlasLootCharDB.ItemSyncTT = false;
	AtlasLootOptions_Init();
end

--[[
AtlasLootOptions_LootlinkTTToggle:
Toggles Lootlink tooltips instead of the default ones.
]]
function AtlasLootOptions_LootlinkTTToggle()
	AtlasLootCharDB.DefaultTT = false;
	AtlasLootCharDB.LootlinkTT = true;
	AtlasLootCharDB.ItemSyncTT = false;
	AtlasLootOptions_Init();
end

--[[
AtlasLootOptions_ItemSyncTTToggle:
Toggles ItemSync tooltips instead of the default ones.
]]
function AtlasLootOptions_ItemSyncTTToggle()
	AtlasLootCharDB.DefaultTT = false;
	AtlasLootCharDB.LootlinkTT = false;
	AtlasLootCharDB.ItemSyncTT = true;
	AtlasLootOptions_Init();
end

--[[
AtlasLootOptions_EquipCompareToggle:
Toggles EquipCompare. Adds a tooltip with the equipped item (if it's the case) next to the default one.
]]
function AtlasLootOptions_EquipCompareToggle()
	if(AtlasLootCharDB.EquipCompare) then
		AtlasLootCharDB.EquipCompare = false;
		if IsAddOnLoaded("EquipCompare") then
			EquipCompare_UnregisterTooltip(AtlasLootTooltip);
			EquipCompare_UnregisterTooltip(AtlasLootTooltip2);
		end
		if IsAddOnLoaded("EQCompare") then
			EQCompare:UnRegisterTooltip(AtlasLootTooltip);
			EQCompare:UnRegisterTooltip(AtlasLootTooltip2);
		end
	else
		AtlasLootCharDB.EquipCompare = true;
		if IsAddOnLoaded("EquipCompare") then
			EquipCompare_RegisterTooltip(AtlasLootTooltip);
			EquipCompare_RegisterTooltip(AtlasLootTooltip2);
		end
		if IsAddOnLoaded("EQCompare") then
			EQCompare:RegisterTooltip(AtlasLootTooltip);
			EQCompare:RegisterTooltip(AtlasLootTooltip2);
		end
	end
	AtlasLootOptions_Init();
end

--[[
AtlasLootOptions_OpaqueToggle:
Toggles opacity of the items frame.
]]
function AtlasLootOptions_OpaqueToggle()
	AtlasLootCharDB.Opaque=AtlasLootOptionsFrameOpaque:GetChecked();
	if (AtlasLootCharDB.Opaque) then
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 1);
	else
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65);
	end
	AtlasLootOptions_Init();
end

--[[
AtlasLootOptions_ItemIDToggle:
Toggles items ID.
]]
function AtlasLootOptions_ItemIDToggle()
	if(AtlasLootCharDB.ItemIDs) then
		AtlasLootCharDB.ItemIDs = false;
	else
		AtlasLootCharDB.ItemIDs = true;
	end
	AtlasLootOptions_Init();
end

--[[
AtlasLootOptions_ItemSpam:
Toggles item query spam.
]]
function AtlasLootOptions_ItemSpam()
	if (AtlasLootCharDB.ItemSpam) then
		AtlasLootCharDB.ItemSpam = false;
	else
		AtlasLootCharDB.ItemSpam = true;
	end
	AtlasLootOptions_Init();
end

--[[
AtlasLootOptions_Toggle:
Toggle on/off the options window
]]
function AtlasLootOptions_Toggle()
	if(AtlasLootOptionsFrame:IsVisible()) then
		--Hide the options frame if already shown
		AtlasLootOptionsFrame:Hide();
	else
		AtlasLootOptionsFrame:Show();
		--Workaround for a weird quirk where tooltip settings so not immediately take effect
		if(AtlasLootCharDB.DefaultTT == true) then
			AtlasLootOptions_DefaultTTToggle();
		elseif(AtlasLootCharDB.LootlinkTT == true) then
			AtlasLootOptions_LootlinkTTToggle();
		elseif(AtlasLootCharDB.ItemSyncTT == true) then
			AtlasLootOptions_ItemSyncTTToggle();
		end
	end
end

--[[
AtlasLoot_ShowItemsFrame(dataID, dataSource, boss, pFrame):
dataID - Name of the loot table
dataSource - Table in the database where the loot table is stored
boss - Text string to use as a title for the loot page
pFrame - Data structure describing how and where to anchor the item frame (more details, see the function AtlasLoot_SetItemInfoFrame)
This fuction is not normally called directly, it is usually invoked by AtlasLoot_ShowBossLoot.
It is the workhorse of the mod and allows the loot tables to be displayed any way anywhere in any mod.
]]
function AtlasLoot_ShowItemsFrame(dataID, dataSource, boss, pFrame)
	--Set up local variables needed for GetItemInfo, etc
	local itemName, itemLink, itemQuality, itemLevel, itemType, itemSubType, itemCount, itemEquipLoc, itemTexture, itemColor;
	local iconFrame, nameFrame, extraFrame, itemButton;
	local text, extra;
	local wlPage, wlPageMax = 1, 1;
	local isItem, isEnchant, isSpell;
	local spellName, spellIcon;
	if dataID == "SearchResult" and dataID == "WishList" then
		AtlasLoot_IsLootTableAvailable(dataID);
	end
	--If the data source has not been passed, throw up a debugging statement
	if dataSource == nil then
		DEFAULT_CHAT_FRAME:AddMessage("No dataSource!");
	end
	--If the loot table name has not been passed, throw up a debugging statement
	if dataID == nil then
		DEFAULT_CHAT_FRAME:AddMessage("No dataID!");
	end
	dataSource_backup = dataSource;
	if dataSource ~= "dummy" then
		if dataID == "SearchResult" or dataID == "WishList" then
			dataSource = {};
			--Match the page number to display
			wlPage = tonumber(string.sub(dataSource_backup, string.find(dataSource_backup, "%d"), string.len(dataSource_backup)));
			--Aquiring items of the page
			if dataID == "SearchResult" then
				dataSource[dataID], wlPageMax = AtlasLoot:GetSearchResultPage(wlPage);
			elseif dataID == "WishList" then
				dataSource[dataID], wlPageMax = AtlasLoot_GetWishListPage(wlPage);
			end
			--Make page number reasonable
			if wlPage < 1 then wlPage = 1 end
			if wlPage > wlPageMax then wlPage = wlPageMax end
		else
			dataSource = AtlasLoot_Data[dataSource_backup];
		end
	end
	--Get AtlasQuest out of the way
	if (AtlasQuestInsideFrame) then
		HideUIPanel(AtlasQuestInsideFrame);
	end
	--Ditch the Quicklook selector
	AtlasLoot_QuickLooks:Hide();
	AtlasLootQuickLooksButton:Hide();
	AtlasLootServerQueryButton:Hide();
	--Hide the menu objects.  These are not required for a loot table
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i):Hide();
	end
	--Escape out of this function if creating a menu, this function only handles loot tables.
	--Inserting escapes in this way allows consistant calling of data whether it is a loot table or a menu.
	if(dataID=="PRE60SET") then
		AtlasLootPRE60SetMenu();
	elseif(dataID=="ZGSET") then
		AtlasLootZGSetMenu();
	elseif(dataID=="AQ40SET") then
		AtlasLootAQ40SetMenu();
	elseif(dataID=="AQ20SET") then
		AtlasLootAQ20SetMenu();
	elseif(dataID=="T3SET") then
		AtlasLootT3SetMenu();
	elseif(dataID=="T2SET") then
		AtlasLootT2SetMenu();
	elseif(dataID=="T1SET") then
		AtlasLootT1SetMenu();
	elseif(dataID=="T0SET") then
		AtlasLootT0SetMenu();
	elseif(dataID=="PVPMENU") then
		AtlasLootPvPMenu();
	elseif(dataID=="WSGRepMenu") then
		AtlasLootWSGRepMenu();
	elseif(dataID=="ABRepMenu") then
		AtlasLootABRepMenu();
	elseif(dataID=="AVRepMenu") then
		AtlasLootAVRepMenu();
	elseif(dataID=="PVPSET") then
		AtlasLootPVPSetMenu();
	elseif(dataID=="REPMENU") then
		AtlasLootRepMenu();
	elseif(dataID=="SETMENU") then
		AtlasLootSetMenu();
	elseif(dataID=="WORLDEPICS") then
		AtlasLootWorldEpicsMenu();
	elseif(dataID=="WORLDEVENTMENU") then
		AtlasLootWorldEventMenu();
	elseif(dataID=="AbyssalCouncil") then
		AtlasLootAbyssalCouncilMenu();
	elseif(dataID=="CRAFTINGMENU") then
		AtlasLoot_CraftingMenu();
	elseif(dataID=="CRAFTSET") then
		AtlasLootCraftedSetMenu();
	elseif(dataID=="ALCHEMYMENU") then
		AtlasLoot_AlchemyMenu();
	elseif(dataID=="SMITHINGMENU") then
		AtlasLoot_SmithingMenu();
	elseif(dataID=="ENCHANTINGMENU") then
		AtlasLoot_EnchantingMenu();
	elseif(dataID=="ENGINEERINGMENU") then
		AtlasLoot_EngineeringMenu();
	elseif(dataID=="LEATHERWORKINGMENU") then
		AtlasLoot_LeatherworkingMenu();
	elseif(dataID=="MININGMENU") then
		AtlasLoot_MiningMenu();
	elseif(dataID=="TAILORINGMENU") then
		AtlasLoot_TailoringMenu();
	elseif(dataID=="COOKINGMENU") then
		AtlasLoot_CookingMenu();
	else
		--Iterate through each item object and set its properties
		for i = 1, 30, 1 do
			--Check for a valid object (that it exists, and that it has a name)
			if(dataSource[dataID][i] ~= nil and dataSource[dataID][i][3] ~= "") then
				if string.sub(dataSource[dataID][i][1], 1, 1) == "s" then
					isItem = false;
					isEnchant = false;
					isSpell = true;
				elseif string.sub(dataSource[dataID][i][1], 1, 1) == "e" then
					isItem = false;
					isEnchant = true;
					isSpell = false;
				else
					isItem = true;
					isEnchant = false;
					isSpell = false;
				end
				if isItem then
					itemName, itemLink, itemQuality, itemRequiredLevel, itemType, itemSubType, itemCount, itemEquipLoc, itemTexture = GetItemInfo(dataSource[dataID][i][1]);
					--If the client has the name of the item in cache, use that instead.
					--This is poor man's localisation, English is replaced be whatever is needed
					if(GetItemInfo(dataSource[dataID][i][1])) then
						_, _, _, itemColor = GetItemQualityColor(itemQuality);
						text = itemColor..itemName;
					else
						text = dataSource[dataID][i][3];
						text = AtlasLoot_FixText(text);
					end
					quantityFrame = getglobal("AtlasLootItem_"..i.."_Quantity");
					quantityFrame:SetText("")
				elseif isEnchant then
					spellName = GetSpellInfoVanillaDB["enchants"][tonumber(string.sub(dataSource[dataID][i][1], 2))]["name"]
					spellIcon = dataSource[dataID][i][2]
					text = AtlasLoot_FixText(string.sub(dataSource[dataID][i][3], 1, 4)..spellName)
					quantityFrame = getglobal("AtlasLootItem_"..i.."_Quantity");
					quantityFrame:SetText("")
				elseif isSpell then
					spellName = dataSource[dataID][i][3]
					spellIcon = dataSource[dataID][i][2]
					text = AtlasLoot_FixText(spellName)
					local qtyMin = GetSpellInfoVanillaDB["craftspells"][tonumber(string.sub(dataSource[dataID][i][1], 2))]["craftQuantityMin"];
					local qtyMax = GetSpellInfoVanillaDB["craftspells"][tonumber(string.sub(dataSource[dataID][i][1], 2))]["craftQuantityMax"];
					if qtyMin and qtyMin ~= "" then
						if qtyMax and qtyMax ~= "" then
							quantityFrame = getglobal("AtlasLootItem_"..i.."_Quantity");
							quantityFrame:SetText(qtyMin.. "-"..qtyMax)
						else
							quantityFrame = getglobal("AtlasLootItem_"..i.."_Quantity");
							quantityFrame:SetText(qtyMin)
						end
					else
						quantityFrame = getglobal("AtlasLootItem_"..i.."_Quantity");
						quantityFrame:SetText("")
					end					
				end
				--Store data about the state of the items frame to allow minor tweaks or a recall of the current loot page
				AtlasLootItemsFrame.refresh = {dataID, dataSource_backup, boss, pFrame};
				--This is a valid QuickLook, so show the UI objects
				AtlasLoot_QuickLooks:Show();
				AtlasLootQuickLooksButton:Show();
				AtlasLootServerQueryButton:Show();
				--Insert the item description
				extra = dataSource[dataID][i][4];
				extra = AtlasLoot_FixText(extra);
				--Use shortcuts for easier reference to parts of the item button
				itemButton = getglobal("AtlasLootItem_"..i);
				iconFrame  = getglobal("AtlasLootItem_"..i.."_Icon");
				nameFrame  = getglobal("AtlasLootItem_"..i.."_Name");
				extraFrame = getglobal("AtlasLootItem_"..i.."_Extra");
				pricetext1 = getglobal("AtlasLootItem_"..i.."_PriceText1");
				pricetext2 = getglobal("AtlasLootItem_"..i.."_PriceText2");
				pricetext3 = getglobal("AtlasLootItem_"..i.."_PriceText3");
				pricetext4 = getglobal("AtlasLootItem_"..i.."_PriceText4");
				pricetext5 = getglobal("AtlasLootItem_"..i.."_PriceText5");
				priceicon1 = getglobal("AtlasLootItem_"..i.."_PriceIcon1");
				priceicon2 = getglobal("AtlasLootItem_"..i.."_PriceIcon2");
				priceicon3 = getglobal("AtlasLootItem_"..i.."_PriceIcon3");
				priceicon4 = getglobal("AtlasLootItem_"..i.."_PriceIcon4");
				priceicon5 = getglobal("AtlasLootItem_"..i.."_PriceIcon5");
				--If there is no data on the texture an item should have, show a big red question mark
				if dataSource[dataID][i][2] == "?" then
					iconFrame:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark");
				elseif dataSource[dataID][i][2] == "" then
					local _, _, _, _, _, _, _, _, itemTexture1 = GetItemInfo(dataSource[dataID][i][1])
					iconFrame:SetTexture(itemTexture1);
				elseif (not isItem) and (spellIcon) then
					if type(dataSource[dataID][i][2]) == "number" then
						local _, _, _, _, _, _, _, _, itemTexture2 = GetItemInfo(dataSource[dataID][i][2])
						iconFrame:SetTexture(itemTexture2);
					elseif type(dataSource[dataID][i][2]) == "string" then
						iconFrame:SetTexture("Interface\\Icons\\"..dataSource[dataID][i][2]);
					else
						iconFrame:SetTexture(spellIcon);
					end
				else
					--else show the texture
					iconFrame:SetTexture("Interface\\Icons\\"..dataSource[dataID][i][2]);
				end
				if iconFrame:GetTexture() == nil then
					iconFrame:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark");
					itemButton.itemTexture = "Interface\\Icons\\INV_Misc_QuestionMark";
				else
					itemButton.itemTexture = iconFrame:GetTexture();
				end
				--Set the name and description of the item
				nameFrame:SetText(text);
				extraFrame:SetText(extra);
				extraFrame:Show();
				pricetext1:Hide();
				pricetext2:Hide();
				pricetext3:Hide();
				pricetext4:Hide();
				pricetext5:Hide();
				priceicon1:Hide();
				priceicon2:Hide();
				priceicon3:Hide();
				priceicon4:Hide();
				priceicon5:Hide();
				if dataSource[dataID][i][6] then
					if dataSource[dataID][i][6]~="" then
						pricetext1:SetText(dataSource[dataID][i][6]);
						priceicon1:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][7]));
						extraFrame:Show();
						pricetext1:Show();
						priceicon1:Show();
					end
				end
				if dataSource[dataID][i][8] then
					if dataSource[dataID][i][8]~="" then
						pricetext2:SetText(dataSource[dataID][i][8]);
						priceicon2:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][9]));
						extraFrame:Show();
						pricetext2:Show();
						priceicon2:Show();
					end
				end
				if dataSource[dataID][i][10] then
					if dataSource[dataID][i][10]~="" then
						pricetext3:SetText(dataSource[dataID][i][10]);
						priceicon3:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][11]));
						extraFrame:Show();
						pricetext3:Show();
						priceicon3:Show();
					end
				end
				if dataSource[dataID][i][12] then
					if dataSource[dataID][i][12]~="" then
						pricetext4:SetText(dataSource[dataID][i][12]);
						priceicon4:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][13]));
						extraFrame:Show();
						pricetext4:Show();
						priceicon4:Show();
					end
				end
				if dataSource[dataID][i][14] then
					if dataSource[dataID][i][14]~="" then
						pricetext5:SetText(dataSource[dataID][i][14]);
						priceicon5:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][15]));
						extraFrame:Show();
						pricetext5:Show();
						priceicon5:Show();
					end
				end
				--Set prices for items, up to 5 different currencies can be used in combination
				if (dataID == "SearchResult" or dataID == "WishList") and dataSource[dataID][i][5] then
					local wishDataID, wishDataSource = strsplit("|", dataSource[dataID][i][5])
					if wishDataSource == "AtlasLootRepItems" then
						if wishDataID and AtlasLoot_IsLootTableAvailable(wishDataID) then
							for _, v in ipairs(AtlasLoot_Data[wishDataSource][wishDataID]) do
								if dataSource[dataID][i][1] == v[1] then
									if v[6] then
										if v[6]~="" then
											pricetext1:SetText(v[6]);
											priceicon1:SetTexture(AtlasLoot_FixText(v[7]));
											extraFrame:Show();
											pricetext1:Show();
											priceicon1:Show();
										end
									end
									if v[8] then
										if v[8]~="" then
											pricetext2:SetText(v[8]);
											priceicon2:SetTexture(AtlasLoot_FixText(v[9]));
											extraFrame:Show();
											pricetext2:Show();
											priceicon2:Show();
										end
									end
									if v[10] then
										if v[10]~="" then
											pricetext3:SetText(v[10]);
											priceicon3:SetTexture(AtlasLoot_FixText(v[11]));
											extraFrame:Show();
											pricetext3:Show();
											priceicon3:Show();
										end
									end
									if v[12] then
										if v[12]~="" then
											pricetext4:SetText(v[12]);
											priceicon4:SetTexture(AtlasLoot_FixText(v[13]));
											extraFrame:Show();
											pricetext4:Show();
											priceicon4:Show();
										end
									end
									if v[14] then
										if v[14]~="" then
											pricetext5:SetText(v[14]);
											priceicon5:SetTexture(AtlasLoot_FixText(v[15]));
											extraFrame:Show();
											pricetext5:Show();
											priceicon5:Show();
										end
									end
									break;
								end
							end
						end
					end
				end
				--For convenience, we store information about the objects in the objects so that it can be easily accessed later
				itemButton.itemID = dataSource[dataID][i][1];
				itemButton.itemIDName = dataSource[dataID][i][3];
				itemButton.itemIDExtra = dataSource[dataID][i][4];
				itemButton.iteminfo = {};
				if isItem then
					itemButton.iteminfo.idcore = dataSource[dataID][i][1];
					_, _, _, _, _, _, _, itemButton.iteminfo.icontexture = GetItemInfo(dataSource[dataID][i][1]);
					itemButton.storeID = dataSource[dataID][i][1];
					itemButton.dressingroomID = dataSource[dataID][i][1];
					itemButton.extraText = getglobal("AtlasLootItem_"..i.."_Extra"):GetText()
				elseif isEnchant then
					spellID = tonumber(string.sub(dataSource[dataID][i][1], 2));
					itemButton.iteminfo.idcore = dataSource[dataID][i][2];
					_, _, _, _, _, _, _, _, itemButton.iteminfo.icontexture = GetItemInfo(dataSource[dataID][i][2]);
					itemButton.storeID = dataSource[dataID][i][2];
					if GetSpellInfoVanillaDB["enchants"][spellID]["item"] and GetSpellInfoVanillaDB["enchants"][spellID]["item"] ~= nil and GetSpellInfoVanillaDB["enchants"][spellID]["item"] ~= "" then
						itemButton.dressingroomID = GetSpellInfoVanillaDB["enchants"][spellID]["item"];
					else
						itemButton.dressingroomID = spellID;
					end
					itemButton.extraText = getglobal("AtlasLootItem_"..i.."_Extra"):GetText()
					if GetSpellInfoVanillaDB["enchants"][spellID]["item"] ~= nil and GetSpellInfoVanillaDB["enchants"][spellID]["item"] ~= "" then
						if not GetItemInfo(GetSpellInfoVanillaDB["enchants"][spellID]["item"]) then
							GameTooltip:SetHyperlink("item:"..GetSpellInfoVanillaDB["enchants"][spellID]["item"]..":0:0:0");
						end
					end
				elseif isSpell then
					spellID = tonumber(string.sub(dataSource[dataID][i][1], 2));
					itemButton.iteminfo.idcore = dataSource[dataID][i][1];
					_, _, _, _, _, _, _, _, itemButton.iteminfo.icontexture = GetItemInfo(dataSource[dataID][i][1]);
					itemButton.storeID = dataSource[dataID][i][1];
					itemButton.dressingroomID = GetSpellInfoVanillaDB["craftspells"][spellID]["craftItem"];
					itemButton.extraText = getglobal("AtlasLootItem_"..i.."_Extra"):GetText()
					if GetSpellInfoVanillaDB["craftspells"][spellID]["craftItem"] ~= "" then
						if not GetItemInfo(GetSpellInfoVanillaDB["craftspells"][spellID]["craftItem"]) then
							GameTooltip:SetHyperlink("item:"..GetSpellInfoVanillaDB["craftspells"][spellID]["craftItem"]..":0:0:0");
						end
					end
					if GetSpellInfoVanillaDB["craftspells"][spellID]["reagents"] ~= "" then
						for i = 1, table.getn(GetSpellInfoVanillaDB["craftspells"][spellID]["reagents"]) do
							local reagent = GetSpellInfoVanillaDB["craftspells"][spellID]["reagents"][i]
							if not GetItemInfo(reagent[1]) then
								GameTooltip:SetHyperlink("item:"..reagent[1]..":0:0:0");
							end
						end
					end
					if GetSpellInfoVanillaDB["craftspells"][spellID]["tools"] ~= "" then
						for i = 1, table.getn(GetSpellInfoVanillaDB["craftspells"][spellID]["tools"]) do
							if not GetItemInfo(GetSpellInfoVanillaDB["craftspells"][spellID]["tools"][i]) then
								GameTooltip:SetHyperlink("item:"..GetSpellInfoVanillaDB["craftspells"][spellID]["tools"][i]..":0:0:0");
							end
						end
					end
				end
				itemButton.droprate = nil;
				if dataID == "SearchResult" or dataID == "WishList" then
					itemButton.sourcePage = dataSource[dataID][i][5];
				else
					local droprate = dataSource[dataID][i][5];
					if droprate and string.find(droprate, "%%") then itemButton.droprate = droprate end
				end
				itemButton.i = 1;
				itemButton:Show();
				--If the item is not in cache, querying the server may cause a disconnect
				--Show a red box around the item to indicate this to the user
				if((not GetItemInfo(dataSource[dataID][i][1])) and (dataSource[dataID][i][1] ~= 0) and isItem) then
					getglobal("AtlasLootItem_"..i.."_Unsafe"):Show();
				else
					getglobal("AtlasLootItem_"..i.."_Unsafe"):Hide();
				end
			else
				getglobal("AtlasLootItem_"..i):Hide();
			end
		end
		--Hide navigation buttons by default, only show what we need
		getglobal("AtlasLootItemsFrame_BACK"):Hide();
		getglobal("AtlasLootItemsFrame_NEXT"):Hide();
		getglobal("AtlasLootItemsFrame_PREV"):Hide();
		AtlasLoot_BossName:SetText(boss);
		--Consult the button registry to determine what nav buttons are required
		if dataID == "SearchResult" or dataID == "WishList" then
			if wlPage < wlPageMax then
				getglobal("AtlasLootItemsFrame_NEXT"):Show();
				getglobal("AtlasLootItemsFrame_NEXT").lootpage = dataID.."Page"..(wlPage + 1);
			end
			if wlPage > 1 then
				getglobal("AtlasLootItemsFrame_PREV"):Show();
				getglobal("AtlasLootItemsFrame_PREV").lootpage = dataID.."Page"..(wlPage - 1);
			end
		elseif AtlasLoot_ButtonRegistry[dataID] then
			local tablebase = AtlasLoot_ButtonRegistry[dataID];
			AtlasLoot_BossName:SetText(tablebase.Title);
			if tablebase.Next_Page then
				getglobal("AtlasLootItemsFrame_NEXT"):Show();
				getglobal("AtlasLootItemsFrame_NEXT").lootpage = tablebase.Next_Page;
				getglobal("AtlasLootItemsFrame_NEXT").title = tablebase.Next_Title;
			end
			if tablebase.Prev_Page then
				getglobal("AtlasLootItemsFrame_PREV"):Show();
				getglobal("AtlasLootItemsFrame_PREV").lootpage = tablebase.Prev_Page;
				getglobal("AtlasLootItemsFrame_PREV").title = tablebase.Prev_Title;
			end
			if tablebase.Back_Page then
				getglobal("AtlasLootItemsFrame_BACK"):Show();
				getglobal("AtlasLootItemsFrame_BACK").lootpage = tablebase.Back_Page;
				getglobal("AtlasLootItemsFrame_BACK").title = tablebase.Back_Title;
			end
		end
	end
	--For Alphamap and Atlas integration, show a 'close' button to hide the loot table and restore the map view
	if (AtlasLootItemsFrame:GetParent() == AlphaMapAlphaMapFrame or AtlasLootItemsFrame:GetParent() == AtlasFrame) then
		AtlasLootItemsFrame_CloseButton:Show();
	else
		AtlasLootItemsFrame_CloseButton:Hide();
	end
	--Anchor the item frame where it is supposed to be
	AtlasLoot_SetItemInfoFrame(pFrame);
end

--[[
AtlasLoot_DewDropClick(tablename, text, tabletype):
tablename - Name of the loot table in the database
text - Heading for the loot table
tabletype - Whether the tablename indexes an actual table or needs to generate a submenu
Called when a button in AtlasLoot_Dewdrop is clicked
]]
function AtlasLoot_DewDropClick(tablename, text, tabletype)
	--Definition of where I want the loot table to be shown
	pFrame = { "TOPLEFT", "AtlasLootDefaultFrame_LootBackground", "TOPLEFT", "2", "-2" };
	
	--If the button clicked was linked to a loot table
	if tabletype == "Table" then
		--Show the loot table
		AtlasLoot_ShowBossLoot(tablename, text, pFrame);
		--Save needed info for fuure re-display of the table
		AtlasLootCharDB.LastBoss = tablename;
		AtlasLootCharDB.LastBossText = text;
		--Purge the text label for the submenu and disable the submenu
		AtlasLootDefaultFrame_SubMenu:Disable();
		AtlasLootDefaultFrame_SelectedTable:SetText("");
		AtlasLootDefaultFrame_SelectedTable:Show();
	--If the button links to a sub menu definition
	else
		--Enable the submenu button
		AtlasLootDefaultFrame_SubMenu:Enable();
		--Show the first loot table associated with the submenu
		AtlasLoot_ShowBossLoot(AtlasLoot_DewDropDown_SubTables[tablename][1][2], AtlasLoot_DewDropDown_SubTables[tablename][1][1], pFrame);
		--Save needed info for fuure re-display of the table
		AtlasLootCharDB.LastBoss = AtlasLoot_DewDropDown_SubTables[tablename][1][2];
		AtlasLootCharDB.LastBossText = AtlasLoot_DewDropDown_SubTables[tablename][1][1];
		--Load the correct submenu and associated with the button
		AtlasLoot_DewdropSubMenu:Unregister(AtlasLootDefaultFrame_SubMenu);
		AtlasLoot_DewdropSubMenuRegister(AtlasLoot_DewDropDown_SubTables[tablename]);
		--Show a text label of what has been selected
		AtlasLootDefaultFrame_SelectedTable:SetText(AtlasLoot_DewDropDown_SubTables[tablename][1][1]);
		AtlasLootDefaultFrame_SelectedTable:Show();
	end
	--Show the category that has been selected
	AtlasLootDefaultFrame_SelectedCategory:SetText(text);
	AtlasLootDefaultFrame_SelectedCategory:Show();
	AtlasLoot_Dewdrop:Close(1);
end

--[[
AtlasLoot_DewDropSubMenuClick(tablename, text):
tablename - Name of the loot table in the database
text - Heading for the loot table
Called when a button in AtlasLoot_DewdropSubMenu is clicked
]]
function AtlasLoot_DewDropSubMenuClick(tablename, text)
	--Definition of where I want the loot table to be shown
	pFrame = { "TOPLEFT", "AtlasLootDefaultFrame_LootBackground", "TOPLEFT", "2", "-2" };
	--Show the select loot table
	AtlasLoot_ShowBossLoot(tablename, text, pFrame);
	--Save needed info for fuure re-display of the table
	AtlasLootCharDB.LastBoss = tablename;
	AtlasLootCharDB.LastBossText = text;
	--Show the table that has been selected
	AtlasLootDefaultFrame_SelectedTable:SetText(text);
	AtlasLootDefaultFrame_SelectedTable:Show();
	AtlasLoot_DewdropSubMenu:Close(1);
end

--[[
AtlasLoot_DewdropSubMenuRegister(loottable):
loottable - Table defining the sub menu
Generates the sub menu needed by passing a table of loot tables and titles
]]
function AtlasLoot_DewdropSubMenuRegister(loottable)
	AtlasLoot_DewdropSubMenu:Register(AtlasLootDefaultFrame_SubMenu,
		'point', function(parent)
			return "TOP", "BOTTOM"
		end,
		'children', function(level, value)
			if level == 1 then
				for k,v in pairs(loottable) do
					AtlasLoot_DewdropSubMenu:AddLine(
						'text', v[1],
						'func', AtlasLoot_DewDropSubMenuClick,
						'arg1', v[2],
						'arg2', v[1],
						'notCheckable', true
					)
				end
				AtlasLoot_DewdropSubMenu:AddLine(
					'text', AL["Close Menu"],
					'textR', 0,
					'textG', 1,
					'textB', 1,
					'func', function() AtlasLoot_DewdropSubMenu:Close() end,
					'notCheckable', true
				)
			end
		end,
		'dontHook', true
	)
end

--[[
AtlasLoot_DewdropRegister:
Constructs the main category menu from a tiered table
]]
function AtlasLoot_DewdropRegister()
	AtlasLoot_Dewdrop:Register(AtlasLootDefaultFrame_Menu,
		'point', function(parent)
			return "TOP", "BOTTOM"
		end,
		'children', function(level, value)
			if level == 1 then
				if AtlasLoot_DewDropDown then
					for k,v in ipairs(AtlasLoot_DewDropDown) do
						--If a link to show a submenu
						if (type(v[1]) == "table") and (type(v[1][1]) == "string") then
							local checked = false;
							if v[1][3] == "Submenu" then
								AtlasLoot_Dewdrop:AddLine(
									'text', v[1][1],
									'textR', 1,
									'textG', 0.82,
									'textB', 0,
									'func', AtlasLoot_DewDropClick,
									'arg1', v[1][2],
									'arg2', v[1][1],
									'arg3', v[1][3],
									'notCheckable', true
								)
							end
						else
							local lock=0;
							--If an entry linked to a subtable
							for i,j in pairs(v) do
								if lock==0 then
									AtlasLoot_Dewdrop:AddLine(
										'text', i,
										'textR', 1,
										'textG', 0.82,
										'textB', 0,
										'hasArrow', true,
										'value', j,
										'notCheckable', true
									)
									lock=1;
								end
							end
						end
					end
				end
				--Close button
				AtlasLoot_Dewdrop:AddLine(
					'text', AL["Close Menu"],
					'textR', 0,
					'textG', 1,
					'textB', 1,
					'func', function() AtlasLoot_Dewdrop:Close() end,
					'notCheckable', true
				)
			elseif level == 2 then
				if value then
					for k,v in ipairs(value) do
						if type(v) == "table" then
							if (type(v[1]) == "table") and (type(v[1][1]) == "string") then
								local checked = false;
								--If an entry to show a submenu
								if v[1][3] == "Submenu" then
								AtlasLoot_Dewdrop:AddLine(
									'text', v[1][1],
									'textR', 1,
									'textG', 0.82,
									'textB', 0,
									'func', AtlasLoot_DewDropClick,
									'arg1', v[1][2],
									'arg2', v[1][1],
									'arg3', v[1][3],
									'notCheckable', true
								)
								--An entry to show a specific loot page
								else
									AtlasLoot_Dewdrop:AddLine(
										'text', v[1][1],
										'func', AtlasLoot_DewDropClick,
										'arg1', v[1][2],
										'arg2', v[1][1],
										'arg3', v[1][3],
										'notCheckable', true
									)
								end
							else
								local lock=0;
								--Entry to link to a sub table
								for i,j in pairs(v) do
									if lock==0 then
										AtlasLoot_Dewdrop:AddLine(
											'text', i,
											'textR', 1,
											'textG', 0.82,
											'textB', 0,
											'hasArrow', true,
											'value', j,
											'notCheckable', true
										)
										lock=1;
									end
								end
							end
						end
					end
				end
				AtlasLoot_Dewdrop:AddLine(
					'text', AL["Close Menu"],
					'textR', 0,
					'textG', 1,
					'textB', 1,
					'func', function() AtlasLoot_Dewdrop:Close() end,
					'notCheckable', true
				)
			elseif level == 3 then
				--Essentially the same as level == 2
				if value then
					for k,v in pairs(value) do
						if type(v[1]) == "string" then
							local checked = false;
							if v[3] == "Submenu" then
								AtlasLoot_Dewdrop:AddLine(
									'text', v[1],
									'textR', 1,
									'textG', 0.82,
									'textB', 0,
									'func', AtlasLoot_DewDropClick,
									'arg1', v[2],
									'arg2', v[1],
									'arg3', v[3],
									'notCheckable', true
								)
							else
								AtlasLoot_Dewdrop:AddLine(
									'text', v[1],
									'func', AtlasLoot_DewDropClick,
									'arg1', v[2],
									'arg2', v[1],
									'arg3', v[3],
									'notCheckable', true
								)
							end
						elseif type(v) == "table" then
							AtlasLoot_Dewdrop:AddLine(
								'text', k,
								'textR', 1,
								'textG', 0.82,
								'textB', 0,
								'hasArrow', true,
								'value', v,
								'notCheckable', true
							)
						end
					end
				end
				AtlasLoot_Dewdrop:AddLine(
					'text', AL["Close Menu"],
					'textR', 0,
					'textG', 1,
					'textB', 1,
					'func', function() AtlasLoot_Dewdrop:Close() end,
					'notCheckable', true
				)
			end
		end,
		'dontHook', true
	)
end

--[[
AtlasLootItemsFrame_OnCloseButton:
Called when the close button on the item frame is clicked
]]
function AtlasLootItemsFrame_OnCloseButton()
	--Set no loot table as currently selected
	AtlasLootItemsFrame.activeBoss = nil;
	--Fix the boss buttons so the correct icons are displayed
	if AtlasFrame and AtlasFrame:IsVisible() then
		if ATLAS_CUR_LINES then
			for i=1,ATLAS_CUR_LINES do
				if getglobal("AtlasBossLine"..i.."_Selected"):IsVisible() then
					getglobal("AtlasBossLine"..i.."_Selected"):Hide();
					getglobal("AtlasBossLine"..i.."_Loot"):Show();
				end
			end
		end
	end
	--Hide the item frame
	AtlasLootItemsFrame:Hide();
end

--[[
AtlasLootMenuItem_OnClick:
Requests the relevant loot page from a menu screen
]]
function AtlasLootMenuItem_OnClick()
	if this.isheader == nil or this.isheader == false then
		AtlasLoot_ShowBossLoot(this.lootpage, getglobal(this:GetName().."_Name"):GetText(), AtlasLoot_AnchorFrame);
	end
end

--[[
AtlasLoot_NavButton_OnClick:
Called when <-, -> or 'Back' are pressed and calls up the appropriate loot page
]]
function AtlasLoot_NavButton_OnClick()
	if AtlasLootItemsFrame.refresh and AtlasLootItemsFrame.refresh[2] and AtlasLootItemsFrame.refresh[4] then
		if string.sub(this.lootpage, 1, 16) == "SearchResultPage" then
			AtlasLoot_ShowItemsFrame("SearchResult", this.lootpage, string.format((AL["Search Result: %s"]), AtlasLootCharDB.LastSearchedText or ""), AtlasLootItemsFrame.refresh[4]);
		elseif string.sub(this.lootpage, 1, 12) == "WishListPage" then
			AtlasLoot_ShowItemsFrame("WishList", this.lootpage, AL["WishList"], AtlasLootItemsFrame.refresh[4]);
		else
			AtlasLoot_ShowItemsFrame(this.lootpage, AtlasLootItemsFrame.refresh[2], this.title, AtlasLootItemsFrame.refresh[4]);
		end
	elseif AtlasLootItemsFrame.refresh and AtlasLootItemsFrame.refresh[2] then
		AtlasLoot_ShowItemsFrame(this.lootpage, AtlasLootItemsFrame.refresh[2], this.title, AtlasFrame);
	else
		--Fallback for if the requested loot page is a menu and does not have a .refresh instance
		AtlasLoot_ShowItemsFrame(this.lootpage, "dummy", this.title, AtlasFrame);
	end
end

--[[
AtlasLoot_IsLootTableAvailable(dataID):
Checks if a loot table is in memory and attempts to load the correct LoD module if it isn't
dataID: Loot table dataID
]]
function AtlasLoot_IsLootTableAvailable(dataID)
	if not dataID then return false end

	local menu_check=false;

	for k,v in pairs(AtlasLoot_MenuList) do
		if v == dataID then
			menu_check=true;
		end
	end

	if menu_check then
		return true;
	else
		if not AtlasLoot_TableNames[dataID] then
			DEFAULT_CHAT_FRAME:AddMessage(RED..AL["AtlasLoot Error!"].." "..WHITE..dataID..AL[" not listed in loot table registry, please report this message to the AtlasLoot forums at http://www.atlasloot.net"]);
			return false;
		end

		local dataSource = AtlasLoot_TableNames[dataID][2];

		if AtlasLoot_Data[dataSource] then
			if AtlasLoot_Data[dataSource][dataID] then
				return true;
			end
		end
	end
end

--[[
AtlasLoot_ShowQuickLooks(button)
button: Identity of the button pressed to trigger the function
Shows the GUI for setting Quicklooks
]]
function AtlasLoot_ShowQuickLooks(button)
	local dewdrop = AceLibrary("Dewdrop-2.0");
	if dewdrop:IsOpen(button) then
		dewdrop:Close(1);
	else
		local setOptions = function()
			dewdrop:AddLine(
				"text", AL["QuickLook"].." 1",
				"tooltipTitle", AL["QuickLook"].." 1",
				"tooltipText", AL["Assign this loot table\n to QuickLook"].." 1",
				"func", function()
					AtlasLootCharDB["QuickLooks"][1]={AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4]};
					AtlasLoot_RefreshQuickLookButtons();
					dewdrop:Close(1);
				end
			);
			dewdrop:AddLine(
				"text", AL["QuickLook"].." 2",
				"tooltipTitle", AL["QuickLook"].." 2",
				"tooltipText", AL["Assign this loot table\n to QuickLook"].." 2",
				"func", function()
					AtlasLootCharDB["QuickLooks"][2]={AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4]};
					AtlasLoot_RefreshQuickLookButtons();
					dewdrop:Close(1);
				end
			);
			dewdrop:AddLine(
				"text", AL["QuickLook"].." 3",
				"tooltipTitle", AL["QuickLook"].." 3",
				"tooltipText", AL["Assign this loot table\n to QuickLook"].." 3",
				"func", function()
					AtlasLootCharDB["QuickLooks"][3]={AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4]};
					AtlasLoot_RefreshQuickLookButtons();
					dewdrop:Close(1);
				end
			);
			dewdrop:AddLine(
				"text", AL["QuickLook"].." 4",
				"tooltipTitle", AL["QuickLook"].." 4",
				"tooltipText", AL["Assign this loot table\n to QuickLook"].." 4",
				"func", function()
					AtlasLootCharDB["QuickLooks"][4]={AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4]};
					AtlasLoot_RefreshQuickLookButtons();
					dewdrop:Close(1);
				end
			);
		end;
		dewdrop:Open(button,
			'point', function(parent)
				return "BOTTOMLEFT", "BOTTOMRIGHT";
			end,
			"children", setOptions
		);
	end
end

--[[
AtlasLoot_RefreshQuickLookButtons()
Enables/disables the quicklook buttons depending on what is assigned
]]
function AtlasLoot_RefreshQuickLookButtons()
	i=1;
	while i<5 do
		if ((not AtlasLootCharDB["QuickLooks"][i]) or (not AtlasLootCharDB["QuickLooks"][i][1])) or (AtlasLootCharDB["QuickLooks"][i][1]==nil) then
			getglobal("AtlasLootPanel_Preset"..i):Disable();
			getglobal("AtlasLootDefaultFrame_Preset"..i):Disable();
		else
			getglobal("AtlasLootPanel_Preset"..i):Enable();
			getglobal("AtlasLootDefaultFrame_Preset"..i):Enable();
		end
		i=i+1;
	end
end

--[[
AtlasLoot_ClearQuickLookButton()
Clears a quicklook button.
]]
function AtlasLoot_ClearQuickLookButton(button)
	if not button or button == nil then return end
	AtlasLootCharDB["QuickLooks"][button] = nil
	AtlasLoot_RefreshQuickLookButtons()
	DEFAULT_CHAT_FRAME:AddMessage(BLUE..AL["AtlasLoot"]..": "..WHITE..AL["QuickLook"].." "..button.." "..AL["has been reset!"]);
end

--[[
AtlasLoot_ShowBossLoot(dataID, boss, pFrame):
dataID - Name of the loot table
boss - Text string to be used as the title for the loot page
pFrame - Data structure describing how and where to anchor the item frame (more details, see the function AtlasLoot_SetItemInfoFrame)
This is the intended API for external mods to use for displaying loot pages.
This function figures out where the loot table is stored, then sends the relevant info to AtlasLoot_ShowItemsFrame
]]
function AtlasLoot_ShowBossLoot(dataID, boss, pFrame)
	local tableavailable = AtlasLoot_IsLootTableAvailable(dataID);
	if (tableavailable) then
		AtlasLootItemsFrame:Hide();
		--If the loot table is already being displayed, it is hidden and the current table selection cancelled
		if ( dataID == AtlasLootItemsFrame.externalBoss ) and (AtlasLootItemsFrame:GetParent() ~= AtlasFrame) and (AtlasLootItemsFrame:GetParent() ~= AtlasLootDefaultFrame_LootBackground) then
			AtlasLootItemsFrame.externalBoss = nil;
		else
			--Use the original WoW instance data by default
			local dataSource = AtlasLoot_TableNames[dataID][2];
			--Set anchor point, set selected table and call AtlasLoot_ShowItemsFrame
			AtlasLoot_AnchorFrame = pFrame;
			AtlasLootItemsFrame.externalBoss = dataID;
			AtlasLoot_ShowItemsFrame(dataID, dataSource, boss, pFrame);
		end
	end
end

function AtlasLootOptions_SetupSlider(text, mymin, mymax, step)
	getglobal(this:GetName().."Text"):SetText(text.." ("..this:GetValue()..")");
	this:SetMinMaxValues(mymin, mymax);
	getglobal(this:GetName().."Low"):SetText(mymin);
	getglobal(this:GetName().."High"):SetText(mymax);
	this:SetValueStep(step);
end

--[[
AtlasLootMinimapButton_OnClick:
Function to show/hide AtlasLoot when click on minimap button.
]]
function AtlasLootMinimapButton_OnClick(arg1)
	if arg1=="LeftButton" then
		AtlasLoot_Toggle();
	end
end

--[[
AtlasLootMinimapButton_Init:
Show/hide minimap button.
]]
function AtlasLootMinimapButton_Init()
	if AtlasLootCharDB.MinimapButton == true then
		AtlasLootMinimapButtonFrame:Show();
	else
		AtlasLootMinimapButtonFrame:Hide();
	end
end

--[[
AtlasLootMinimapButton_OnEnter:
Show tooltip when mouse is over minimap button.
]]
function AtlasLootMinimapButton_OnEnter()
	GameTooltip:SetOwner(this, "ANCHOR_LEFT");
	GameTooltip:SetText(AL["AtlasLoot Enhanced"]);
	GameTooltipTextLeft1:SetTextColor(1, 1, 1);
	GameTooltip:AddLine(AL["Left-click to open AtlasLoot.\nMiddle-click for AtlasLoot options.\nRight-click and drag to move this button."]);
	GameTooltip:Show();
end

--[[
AtlasLootButton_UpdatePosition:
Function to move the minimap button around the minimap.
]]
function AtlasLootMinimapButton_UpdatePosition()
	AtlasLootMinimapButtonFrame:SetPoint(	
		"TOPLEFT",
		"Minimap",
		"TOPLEFT",
		54 - (AtlasLootCharDB.MinimapButtonRadius * cos(AtlasLootCharDB.MinimapButtonPosition)),
		(AtlasLootCharDB.MinimapButtonRadius * sin(AtlasLootCharDB.MinimapButtonPosition)) - 55
	);
	AtlasLootOptions_Init()
end

local function around(num, idp)
	local mult = 10 ^ (idp or 0);
	return math.floor(num * mult + 0.5) / mult;
end

function AtlasLootOptions_UpdateSlider(text)
	getglobal(this:GetName().."Text"):SetText(text.." ("..around(this:GetValue(),2)..")");
end

function AtlasLootOptions_ResetPosition()
	AtlasLootCharDB.MinimapButtonPosition = 315;
	AtlasLootCharDB.MinimapButtonRadius = 78;
	AtlasLootMinimapButton_UpdatePosition();
	DEFAULT_CHAT_FRAME:AddMessage(BLUE..AL["AtlasLoot"]..": "..RED..AL["Minimap button has been reset!"]);
end

function AtlasLootOptions_DefaultSettings()
	AtlasLootCharDB.SafeLinks = true;
	AtlasLootCharDB.AllLinks = false;
	AtlasLootCharDB.DefaultTT = true;
	AtlasLootCharDB.LootlinkTT = false;
	AtlasLootCharDB.ItemSyncTT = false;
	AtlasLootCharDB.EquipCompare = false;
	AtlasLootCharDB.Opaque = false;
	AtlasLootCharDB.ItemIDs = false;
	AtlasLootCharDB.ItemSpam = true;
	AtlasLootCharDB.MinimapButton = true;
	AtlasLootCharDB.HidePanel = false;
	AtlasLootCharDB.AtlasLootVersion = VERSION_MAJOR..VERSION_MINOR..VERSION_BOSSES;
	AtlasLootCharDB.AutoQuery = false;
	AtlasLootCharDB.PartialMatching = true;
	AtlasLootCharDB.LastBoss = "RFCTaragaman";
	AtlasLootCharDB.LastBossText = AL["Taragaman the Hungerer"];
	AtlasLootDefaultFrame:ClearAllPoints();
	AtlasLootDefaultFrame:SetPoint("TOP", "UIParent", "TOP", 0, -30);
	AtlasLootOptionsFrame:ClearAllPoints();
	AtlasLootOptionsFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 100);
	AtlasLootCharDB["QuickLooks"] = {};
	AtlasLootCharDB["WishList"] = {};
	AtlasLoot_RefreshQuickLookButtons();
	AtlasLootOptions_Init();
	DEFAULT_CHAT_FRAME:AddMessage(BLUE..AL["AtlasLoot"]..": "..RED..AL["Default settings applied!"]);
end

--[[
AtlasLootButton_BeingDragged:
Function to move the minimap button around the minimap.
]]
function AtlasLootMinimapButton_BeingDragged()
	local xpos,ypos = GetCursorPosition() 
	local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom() 
	xpos = xmin-xpos/UIParent:GetScale()+70 
	ypos = ypos/UIParent:GetScale()-ymin-70 
	AtlasLootMinimapButton_SetPosition(math.deg(math.atan2(ypos,xpos)));
end

--[[
AtlasLootButton_SetPosition:
Function to save the position of the minimap button.
]]
function AtlasLootMinimapButton_SetPosition(v)
	if(v < 0) then
		v = v + 360;
	end
	AtlasLootCharDB.MinimapButtonPosition = v;
	AtlasLootMinimapButton_UpdatePosition();
end

function strsplit(delim, str, maxNb, onlyLast)
	-- Eliminate bad cases...
	if string.find(str, delim) == nil then
		return { str }
	end
	if maxNb == nil or maxNb < 1 then
		maxNb = 0
	end
	local result = {}
	local pat = "(.-)" .. delim .. "()"
	local nb = 0
	local lastPos
	for part, pos in string.gfind(str, pat) do
		nb = nb + 1
		result[nb] = part
		lastPos = pos
		if nb == maxNb then break end
	end
	-- Handle the last field
	if nb ~= maxNb then
		result[nb+1] = string.sub(str, lastPos)
	end
	if onlyLast then
		return result[nb+1]
	else
		return result[1], result[2]
	end
end

function strtrim(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end


--This is a multi-layer table defining the main loot listing.
--Entries have the text to display, loot table or sub table to link to and if the link is to a loot table or sub table
AtlasLoot_DewDropDown = {
	[1] = {
		[AL["Dungeons & Raids"]] = {
			[1] = { 
				{ AL["Ragefire Chasm"], "RagefireChasm", "Submenu" },
			},
			[2] = { 
				{ AL["Wailing Caverns"], "WailingCaverns", "Submenu" },
			},
			[3] = { 
				{ AL["The Deadmines"], "Deadmines", "Submenu" },
			},
			[4] = { 
				{ AL["Shadowfang Keep"], "ShadowfangKeep", "Submenu" },
			},
			[5] = { 
				{ AL["Blackfathom Deeps"], "BlackfathomDeeps", "Submenu" },
			},
			[6] = { 
				{ AL["The Stockade"], "TheStockade", "Submenu" },
			},
			[7] = { 
				{ AL["Gnomeregan"], "Gnomeregan", "Submenu" },
			},
			[8] = { 
				{ AL["Razorfen Kraul"], "RazorfenKraul", "Submenu" },
			},
			[9] = { 
				[AL["Scarlet Monastery"]] = {
					{ AL["Scarlet Monastery"].." "..AL["Graveyard"], "SMGraveyard", "Submenu" },
					{ AL["Scarlet Monastery"].." "..AL["Library"], "SMLibrary", "Submenu" },
					{ AL["Scarlet Monastery"].." "..AL["Armory"], "SMArmory", "Submenu" },
					{ AL["Scarlet Monastery"].." "..AL["Cathedral"], "SMCathedral", "Submenu" },
				},
			},
			[10] = { 
				{ AL["Razorfen Downs"], "RazorfenDowns", "Submenu" },
			},
			[11] = { 
				{ AL["Uldaman"], "Uldaman", "Submenu" },
			},
			[12] = { 
				{ AL["Maraudon"], "Maraudon", "Submenu" },
			},
			[13] = { 
				{ AL["Zul'Farrak"], "ZulFarrak", "Submenu" },
			},
			[14] = { 
				{ AL["The Sunken Temple"], "SunkenTemple", "Submenu" },
			},
			[15] = { 
				{ AL["Blackrock Depths"], "BlackrockDepths", "Submenu" },
			},
			[16] = { 
				[AL["Dire Maul"]] = {
					{ AL["Dire Maul"].." "..AL["East"], "DireMaulEast", "Submenu" },
					{ AL["Dire Maul"].." "..AL["West"], "DireMaulWest", "Submenu" },
					{ AL["Dire Maul"].." "..AL["North"], "DireMaulNorth", "Submenu" },
				}, 
			},
			[17] = { 
				{ AL["Scholomance"], "Scholomance", "Submenu" },
			},
			[18] = { 
				{ AL["Stratholme"], "Stratholme", "Submenu" },
			},
			[19] = { 
				{ AL["Lower Blackrock Spire"], "LowerBlackrock", "Submenu" },
			},
			[20] = { 
				{ AL["Upper Blackrock Spire"], "UpperBlackrock", "Submenu" },
			},
			[21] = { 
				{ AL["Zul'Gurub"], "ZulGurub", "Submenu" },
			},
			[22] = { 
				{ AL["Ruins of Ahn'Qiraj"], "RuinsofAQ", "Submenu" },
			},
			[23] = { 
				{ AL["Molten Core"], "MoltenCore", "Submenu" },
			},
			[24] = { 
				{ AL["Onyxia's Lair"], "Onyxia", "Submenu" },
			},
			[25] = { 
				{ AL["Blackwing Lair"], "BlackwingLair", "Submenu" },
			},
			[26] = { 
				{ AL["Temple of Ahn'Qiraj"], "TempleofAQ", "Submenu" },
			},
			[27] = { 
				{ AL["Naxxramas"], "Naxxramas", "Submenu" },
			},
		},
	},
	[2] = {
		{ AL["World Bosses"], "WorldBosses", "Submenu" },
	},
	[3] = {
		[AL["PvP Rewards"]] = {
			[1] = { 
				{ AL["PvP Armor Sets"], "PvPArmorSets", "Submenu" },
			},
			[2] = { 
				{ AL["PvP Accessories"], "PvP60Accessories1", "Table" },
			},
			[3] = { 
				{ AL["Rank 14 Weapons"], "PVPWeapons1", "Table" },
			},
			[4] = { 
				{ AL["PvP Mounts"], "PvPMountsPvP", "Table" },
			},
			[5] = { 
				{ AL["Alterac Valley"], "AVRewards", "Submenu" },
			},
			[6] = { 
				{ AL["Arathi Basin"], "ABRewards", "Submenu" },
			},
			[7] = { 
				{ AL["Warsong Gulch"], "WSGRewards", "Submenu" },
			},
		},
	},
	[4] = {
		[AL["Sets/Collections"]] = {
			[1] = { 
				{ AL["Pre 60 Sets"], "Pre60Sets", "Submenu" },
			},
			[2] = { 
				{ AL["Dungeon 1/2 Sets"], "DungeonSets12", "Submenu" },
			},
			[3] = { 
				{ AL["Ruins of Ahn'Qiraj Sets"], "AQ20Sets", "Submenu" },
			},
			[4] = { 
				{ AL["Temple of Ahn'Qiraj Sets"], "AQ40Sets", "Submenu" },
			},
			[5] = { 
				{ AL["Zul'Gurub Sets"], "ZGSets", "Submenu" },
			},
			[6] = { 
				{ AL["Tier 1 Sets"], "T1Sets", "Submenu" },
			},
			[7] = { 
				{ AL["Tier 2 Sets"], "T2Sets", "Submenu" },
			},
			[8] = { 
				{ AL["Tier 3 Sets"], "T3Sets", "Submenu" },
			},
			[9] = { 
				{ AL["Legendary Items"], "Legendaries", "Table" },
			},
			[10] = {
				{ AL["Rare Pets"], "RarePets1", "Table" },
			},
			[11] = { 
				{ AL["Rare Mounts"], "RareMounts", "Table" },
			},
			[12] = {
				{ AL["Old Mounts"], "OldMounts", "Table" },
			},
			[13] = {
				{ AL["Unobtainable Mounts"], "UnobMounts", "Table" },
			},
			[14] = {
				{ AL["Tabards"], "Tabards", "Table" },
			},
			[15] = {
				{ AL["World Epics"], "BoEWorldEpics", "Submenu" },
			},
		},
	},
	[5] = {
		{ AL["Reputation Factions"], "Factions", "Submenu" },
	},
	[6] = {
		[AL["World Events"]] = {
			[1] = { 
				{ AL["Abyssal Council"], "AbyssalCouncil1", "Submenu" },
			},
			[2] = { 
				{ AL["Children's Week"], "ChildrensWeek", "Table" },
			},
			[3] = { 
				{ AL["Elemental Invasion"], "ElementalInvasion", "Table" },
			},
			[4] = { 
				{ AL["Feast of Winter Veil"], "Winterviel1", "Table" },
			},
			[5] = { 
				{ AL["Gurubashi Arena Booty Run"], "GurubashiArena", "Table" },
			},
			[6] = { 
				{ AL["Hallow's End"], "Halloween1", "Table" },
			},
			[7] = { 
				{ AL["Harvest Festival"], "HarvestFestival", "Table" },
			},
			[8] = { 
				{ AL["Love is in the Air"], "Valentineday", "Table" },
			},
			[9] = { 
				{ AL["Lunar Festival"], "LunarFestival1", "Table" },
			},
			[10] = { 
				{ AL["Midsummer Fire Festival"], "MidsummerFestival", "Table" },
			},
			[11] = { 
				{ AL["Noblegarden"], "Noblegarden", "Table" },
			},
			[12] = { 
				{ AL["Scourge Invasion"], "ScourgeInvasionEvent1", "Table" },
			},
			[13] = { 
				{ AL["Stranglethorn Fishing Extravaganza"], "FishingExtravaganza", "Table" },
			},
		},
	},
	[7] = {
		[AL["Crafting"]] = {
			[1] = { { AL["Alchemy"], "Alchemy", "Submenu" }, },
			[2] = { { (AL["Blacksmithing"]), "Blacksmithing", "Submenu" }, },
			[3] = { { (AL["Enchanting"]), "Enchanting", "Submenu" }, },
			[4] = { { (AL["Engineering"]), "Engineering", "Submenu" }, },
			[5] = { { (AL["Herbalism"]), "Herbalism1", "Table" }, },
			[6] = { { (AL["Leatherworking"]), "Leatherworking", "Submenu" }, },
			[7] = { { (AL["Mining"]), "Mining", "Submenu" }, },
			[8] = { { (AL["Tailoring"]), "Tailoring", "Submenu" }, },
			[9] = { { (AL["Cooking"]), "Cooking", "Submenu" }, },
			[10] = { { (AL["First Aid"]), "FirstAid1", "Table" }, },
			[11] = { { (AL["Poisons"]), "Poisons1", "Table" }, },
			[12] = { 
				[AL["Crafted Sets"]] = {
					{ (AL["Blacksmithing"]), "CraftSetBlacksmith", "Submenu" },
					{ (AL["Leatherworking"]), "CraftSetLeatherwork", "Submenu" },
					{ (AL["Tailoring"]), "BloodvineG", "Table" },
				}, 
			},
			[13] = { { AL["Crafted Epic Weapons"], "CraftedWeapons1", "Table" }, },
		},
	},
};

--This table defines all the subtables needed for the full menu
--Each sub table entry contains the text entry and the loot table that goes wih it
AtlasLoot_DewDropDown_SubTables = {
	["BlackrockDepths"] = {
		{ AL["Lord Roccor"], "BRDLordRoccor" },
		{ AL["High Interrogator Gerstahn"], "BRDHighInterrogatorGerstahn" },
		{ AL["Anub'shiah"], "BRDAnubshiah" },
		{ AL["Eviscerator"], "BRDEviscerator" },
		{ AL["Gorosh the Dervish"], "BRDGorosh" },
		{ AL["Grizzle"], "BRDGrizzle" },
		{ AL["Hedrum the Creeper"], "BRDHedrum" },
		{ AL["Ok'thor the Breaker"], "BRDOkthor" },
		{ AL["Theldren"], "BRDTheldren" },
		{ AL["Houndmaster Grebmar"], "BRDHoundmaster" },
		{ AL["Pyromancer Loregrain"].." ("..AL["Rare"]..")", "BRDPyromancerLoregrain" },
		{ AL["The Vault"], "BRDTheVault" },
		{ AL["Warder Stilgiss"].." ("..AL["Rare"]..")", "BRDWarderStilgiss" },
		{ AL["Verek"].." ("..AL["Rare"]..")", "BRDVerek" },
		{ AL["Fineous Darkvire"], "BRDFineousDarkvire" },
		{ AL["Lord Incendius"], "BRDLordIncendius" },
		{ AL["Bael'Gar"], "BRDBaelGar" },
		{ AL["General Angerforge"], "BRDGeneralAngerforge" },
		{ AL["Golem Lord Argelmach"], "BRDGolemLordArgelmach" },
		{ AL["The Grim Guzzler"], "BRDGuzzler" },
		{ AL["Ambassador Flamelash"], "BRDFlamelash" },
		{ AL["Panzor the Invincible"].." ("..AL["Rare"]..")", "BRDPanzor" },
		{ AL["Summoner's Tomb"], "BRDTomb" },
		{ AL["Magmus"], "BRDMagmus" },
		{ AL["Princess Moira Bronzebeard"], "BRDPrincess" },
		{ AL["Emperor Dagran Thaurissan"], "BRDEmperorDagranThaurissan" },
		{ AL["Trash Mobs"], "BRDTrash" },
	},
	["LowerBlackrock"] = {
		{ AL["Spirestone Butcher"].." ("..AL["Rare"]..")", "LBRSSpirestoneButcher" },
		{ AL["Spirestone Battle Lord"].." ("..AL["Rare"]..")", "LBRSSpirestoneBattleLord" },
		{ AL["Spirestone Lord Magus"].." ("..AL["Rare"]..")", "LBRSSpirestoneLordMagus" },
		{ AL["Highlord Omokk"], "LBRSOmokk" },
		{ AL["Shadow Hunter Vosh'gajin"], "LBRSVosh" },
		{ AL["War Master Voone"], "LBRSVoone" },
		{ AL["Burning Felguard"].." ("..AL["Rare"]..")", "LBRSFelguard" },
		{ AL["Mor Grayhoof"], "LBRSGrayhoof" },
		{ AL["Bannok Grimaxe"].." ("..AL["Rare"]..")", "LBRSGrimaxe" },
		{ AL["Mother Smolderweb"], "LBRSSmolderweb" },
		{ AL["Crystal Fang"].." ("..AL["Rare"]..")", "LBRSCrystalFang" },
		{ AL["Urok Doomhowl"], "LBRSDoomhowl" },
		{ AL["Quartermaster Zigris"], "LBRSZigris" },
		{ AL["Halycon"], "LBRSHalycon" },
		{ AL["Gizrul the Slavener"], "LBRSSlavener" },
		{ AL["Ghok Bashguud"].." ("..AL["Rare"]..")", "LBRSBashguud" },
		{ AL["Overlord Wyrmthalak"], "LBRSWyrmthalak" },
		{ AL["Trash Mobs"], "LBRSTrash" },
	},
	["UpperBlackrock"] = {
		{ AL["Pyroguard Emberseer"], "UBRSEmberseer" },
		{ AL["Solakar Flamewreath"], "UBRSSolakar" },
		{ AL["Father Flame"], "UBRSFlame" },
		{ AL["Jed Runewatcher"].." ("..AL["Rare"]..")", "UBRSRunewatcher" },
		{ AL["Goraluk Anvilcrack"].." ("..AL["Rare"]..")", "UBRSAnvilcrack" },
		{ AL["Warchief Rend Blackhand"], "UBRSRend" },
		{ AL["Gyth"], "UBRSGyth" },
		{ AL["The Beast"], "UBRSBeast" },
		{ AL["Lord Valthalak"], "UBRSValthalak" },
		{ AL["General Drakkisath"], "UBRSDrakkisath" },
		{ AL["Trash Mobs"], "UBRSTrash" },
	},
	["BlackwingLair"] = {
		{ AL["Razorgore the Untamed"], "BWLRazorgore" },
		{ AL["Vaelastrasz the Corrupt"], "BWLVaelastrasz" },
		{ AL["Broodlord Lashlayer"], "BWLLashlayer" },
		{ AL["Firemaw"], "BWLFiremaw" },
		{ AL["Ebonroc"], "BWLEbonroc" },
		{ AL["Flamegor"], "BWLFlamegor" },
		{ AL["Chromaggus"], "BWLChromaggus" },
		{ AL["Nefarian"], "BWLNefarian" },
		{ AL["Trash Mobs"], "BWLTrashMobs" },
	},
	["Deadmines"] = {
		{ AL["Rhahk'Zor"], "DMRhahkZor" },
		{ AL["Miner Johnson"].." ("..AL["Rare"]..")", "DMMinerJohnson" },
		{ AL["Sneed"], "DMSneed" },
		{ AL["Sneed's Shredder"], "DMSneedsShredder" },
		{ AL["Gilnid"], "DMGilnid" },
		{ AL["Mr. Smite"], "DMMrSmite" },
		{ AL["Cookie"], "DMCookie" },
		{ AL["Captain Greenskin"], "DMCaptainGreenskin" },
		{ AL["Edwin VanCleef"], "DMVanCleef" },
		{ AL["Trash Mobs"], "DMTrash" },
	},
	["Gnomeregan"] = {
		{ AL["Grubbis"], "GnGrubbis" },
		{ AL["Viscous Fallout"], "GnViscousFallout" },
		{ AL["Electrocutioner 6000"], "GnElectrocutioner6000" },
		{ AL["Crowd Pummeler 9-60"], "GnCrowdPummeler960" },
		{ AL["Dark Iron Ambassador"], "GnDIAmbassador" },
		{ AL["Mekgineer Thermaplugg"], "GnMekgineerThermaplugg" },
		{ AL["Trash Mobs"], "GnTrash" },
	},
	["MoltenCore"] = {
		{ AL["Lucifron"], "MCLucifron" },
		{ AL["Magmadar"], "MCMagmadar" },
		{ AL["Gehennas"], "MCGehennas" },
		{ AL["Garr"], "MCGarr" },
		{ AL["Shazzrah"], "MCShazzrah" },
		{ AL["Baron Geddon"], "MCGeddon" },
		{ AL["Golemagg the Incinerator"], "MCGolemagg" },
		{ AL["Sulfuron Harbinger"], "MCSulfuron" },
		{ AL["Majordomo Executus"], "MCMajordomo" },
		{ AL["Ragnaros"], "MCRagnaros" },
		{ AL["Trash Mobs"], "MCTrashMobs" },
		{ AL["Random Boss Loot"], "MCRANDOMBOSSDROPS" },
	},
	["Naxxramas"] = {
		{ AL["Patchwerk"], "NAXPatchwerk" },
		{ AL["Grobbulus"], "NAXGrobbulus" },
		{ AL["Gluth"], "NAXGluth" },
		{ AL["Thaddius"], "NAXThaddius" },
		{ AL["Anub'Rekhan"], "NAXAnubRekhan" },
		{ AL["Grand Widow Faerlina"], "NAXGrandWidowFaerlina" },
		{ AL["Maexxna"], "NAXMaexxna" },
		{ AL["Noth the Plaguebringer"], "NAXNoththePlaguebringer" },
		{ AL["Heigan the Unclean"], "NAXHeigantheUnclean" },
		{ AL["Loatheb"], "NAXLoatheb" },
		{ AL["Instructor Razuvious"], "NAXInstructorRazuvious" },
		{ AL["Gothik the Harvester"], "NAXGothiktheHarvester" },
		{ AL["The Four Horsemen"], "NAXTheFourHorsemen" },
		{ AL["Sapphiron"], "NAXSapphiron" },
		{ AL["Kel'Thuzad"], "NAXKelThuzard" },
		{ AL["Trash Mobs"], "NAXTrash" },
	},
	["SMGraveyard"] = {
		{ AL["Interrogator Vishas"], "SMVishas" },
		{ AL["Scorn"].." ("..AL["Scourge Invasion"]..")", "SMScorn" },
		{ AL["Ironspine"].." ("..AL["Rare"]..")", "SMIronspine" },
		{ AL["Azshir the Sleepless"].." ("..AL["Rare"]..")", "SMAzshir" },
		{ AL["Fallen Champion"].." ("..AL["Rare"]..")", "SMFallenChampion" },
		{ AL["Bloodmage Thalnos"], "SMBloodmageThalnos" },
		{ AL["Trash Mobs"], "SMGTrash" },
	},
	["SMLibrary"] = {
		{ AL["Houndmaster Loksey"], "SMHoundmasterLoksey" },
		{ AL["Arcanist Doan"], "SMDoan" },
		{ AL["Trash Mobs"], "SMLTrash" },
	},
	["SMArmory"] = {
		{ AL["Herod"], "SMHerod" },
		{ AL["Trash Mobs"], "SMATrash" },
	},
	["SMCathedral"] = {
		{ AL["High Inquisitor Fairbanks"], "SMFairbanks" },
		{ AL["Scarlet Commander Mograine"], "SMMograine" },
		{ AL["High Inquisitor Whitemane"], "SMWhitemane" },
		{ AL["Trash Mobs"], "SMCTrash" },
	},
	["Scholomance"] = {
		{ AL["Blood Steward of Kirtonos"], "SCHOLOBlood" },
		{ AL["Kirtonos the Herald"], "SCHOLOKirtonostheHerald" },
		{ AL["Jandice Barov"], "SCHOLOJandiceBarov" },
		{ AL["Lord Blackwood"].." ("..AL["Scourge Invasion"]..")", "SCHOLOLordBlackwood" },
		{ AL["Rattlegore"], "SCHOLORattlegore" },
		{ AL["Death Knight Darkreaver"], "SCHOLODeathKnight" },
		{ AL["Marduk Blackpool"], "SCHOLOMarduk" },
		{ AL["Vectus"], "SCHOLOVectus" },
		{ AL["Ras Frostwhisper"], "SCHOLORasFrostwhisper" },
		{ AL["Kormok"], "SCHOLOKormok" },
		{ AL["Instructor Malicia"], "SCHOLOInstructorMalicia" },
		{ AL["Doctor Theolen Krastinov"], "SCHOLODoctorTheolenKrastinov" },
		{ AL["Lorekeeper Polkelt"], "SCHOLOLorekeeperPolkelt" },
		{ AL["The Ravenian"], "SCHOLOTheRavenian" },
		{ AL["Lord Alexei Barov"], "SCHOLOLordAlexeiBarov" },
		{ AL["Lady Illucia Barov"], "SCHOLOLadyIlluciaBarov" },
		{ AL["Darkmaster Gandling"], "SCHOLODarkmasterGandling" },
		{ AL["Trash Mobs"], "SCHOLOTrash" },
	},
	["ShadowfangKeep"] = {
		{ AL["Rethilgore"], "SFKRethilgore" },
		{ AL["Fel Steed"], "SFKFelSteed" },
		{ AL["Razorclaw the Butcher"], "SFKRazorclawtheButcher" },
		{ AL["Baron Silverlaine"], "SFKSilverlaine" },
		{ AL["Commander Springvale"], "SFKSpringvale" },
		{ AL["Sever"].." ("..AL["Scourge Invasion"]..")", "SFKSever" },
		{ AL["Odo the Blindwatcher"], "SFKOdotheBlindwatcher" },
		{ AL["Deathsworn Captain"].." ("..AL["Rare"]..")", "SFKDeathswornCaptain" },
		{ AL["Fenrus the Devourer"], "SFKFenrustheDevourer" },
		{ AL["Arugal's Voidwalker"], "SFKArugalsVoidwalker" },
		{ AL["Wolf Master Nandos"], "SFKWolfMasterNandos" },
		{ AL["Archmage Arugal"], "SFKArchmageArugal" },
		{ AL["Trash Mobs"], "SFKTrash" },
	},
	["TheStockade"] = {
		{ AL["Kam Deepfury"], "SWStKamDeepfury" },
		{ AL["Bruegal Ironknuckle"].." ("..AL["Rare"]..")", "SWStBruegalIronknuckle" },
		{ AL["Trash Mobs"], "SWStTrash" },
	},
	["Stratholme"] = {
		{ AL["Skul"].." ("..AL["Rare"]..")", "STRATSkull" },
		{ AL["Stratholme Courier"], "STRATStratholmeCourier" },
		{ AL["Postmaster Malown"], "STRATPostmaster" },
		{ AL["Fras Siabi"], "STRATFrasSiabi" },
		{ AL["Atiesh"], "STRATAtiesh" },
		{ AL["Balzaphon"].." ("..AL["Scourge Invasion"]..")", "STRATBalzaphon" },
		{ AL["Hearthsinger Forresten"].." ("..AL["Rare"]..")", "STRATHearthsingerForresten" },
		{ AL["The Unforgiven"], "STRATTheUnforgiven" },
		{ AL["Timmy the Cruel"], "STRATTimmytheCruel" },
		{ AL["Malor's Strongbox"], "STRATMalorsStrongbox" },
		{ AL["Crimson Hammersmith"], "STRATCrimsonHammersmith" },
		{ AL["Cannon Master Willey"], "STRATCannonMasterWilley" },
		{ AL["Archivist Galford"], "STRATArchivistGalford" },
		{ AL["Balnazzar"], "STRATBalnazzar" },
		{ AL["Sothos"].." & "..AL["Jarien"], "STRATSothosJarien" },
		{ AL["Stonespine"].." ("..AL["Rare"]..")", "STRATStonespine" },
		{ AL["Baroness Anastari"], "STRATBaronessAnastari" },
		{ AL["Black Guard Swordsmith"], "STRATBlackGuardSwordsmith" },
		{ AL["Nerub'enkan"], "STRATNerubenkan" },
		{ AL["Maleki the Pallid"], "STRATMalekithePallid" },
		{ AL["Magistrate Barthilas"], "STRATMagistrateBarthilas" },
		{ AL["Ramstein the Gorger"], "STRATRamsteintheGorger" },
		{ AL["Baron Rivendare"], "STRATBaronRivendare" },
		{ AL["Trash Mobs"], "STRATTrash" },
	},
	["SunkenTemple"] = {
		{ AL["Balcony Minibosses"], "STBalconyMinibosses" },
		{ AL["Atal'alarion"], "STAtalalarion" },
		{ AL["Spawn of Hakkar"], "STSpawnOfHakkar" },
		{ AL["Avatar of Hakkar"], "STAvatarofHakkar" },
		{ AL["Jammal'an the Prophet"], "STJammalan" },
		{ AL["Ogom the Wretched"], "STOgom" },
		{ AL["Dreamscythe"], "STDreamscythe" },
		{ AL["Weaver"], "STWeaver"},
		{ AL["Morphaz"], "STMorphaz" },
		{ AL["Hazzas"], "STHazzas" },
		{ AL["Shade of Eranikus"], "STEranikus" },
		{ AL["Trash Mobs"], "STTrash" },
	},
	["Uldaman"] = {
		{ AL["Baelog"], "UldBaelog" },
		{ AL["Olaf"], "UldOlaf" },
		{ AL["Eric 'The Swift'"], "UldEric" },
		{ AL["Revelosh"], "UldRevelosh" },
		{ AL["Ironaya"], "UldIronaya" },
		{ AL["Ancient Stone Keeper"], "UldAncientStoneKeeper" },
		{ AL["Galgann Firehammer"], "UldGalgannFirehammer" },
		{ AL["Grimlok"], "UldGrimlok" },
		{ AL["Archaedas"], "UldArchaedas" },
		{ AL["Trash Mobs"], "UldTrash" },
	},
	["ZulGurub"] = {
		{ AL["High Priestess Jeklik"], "ZGJeklik" },
		{ AL["High Priest Venoxis"], "ZGVenoxis" },
		{ AL["High Priestess Mar'li"], "ZGMarli" },
		{ AL["Bloodlord Mandokir"], "ZGMandokir" },
		{ AL["Gri'lek"], "ZGGrilek" },
		{ AL["Hazza'rah"], "ZGHazzarah" },
		{ AL["Renataki"], "ZGRenataki" },
		{ AL["Wushoolay"], "ZGWushoolay" },
		{ AL["Gahz'ranka"], "ZGGahzranka" },
		{ AL["High Priest Thekal"], "ZGThekal" },
		{ AL["High Priestess Arlokk"], "ZGArlokk" },
		{ AL["Jin'do the Hexxer"], "ZGJindo" },
		{ AL["Hakkar"], "ZGHakkar" },
		{ AL["Random Boss Loot"], "ZGShared" },
		{ AL["Trash Mobs"], "ZGTrash1" },
		{ AL["ZG Enchants"], "ZGEnchants" },
	},
	["BlackfathomDeeps"] = {
		{ AL["Ghamoo-ra"], "BFDGhamoora" },
		{ AL["Lady Sarevess"], "BFDLadySarevess" },
		{ AL["Gelihast"], "BFDGelihast" },
		{ AL["Baron Aquanis"], "BFDBaronAquanis" },
		{ AL["Twilight Lord Kelris"], "BFDTwilightLordKelris" },
		{ AL["Old Serra'kis"], "BFDOldSerrakis" },
		{ AL["Aku'mai"], "BFDAkumai" },
		{ AL["Trash Mobs"], "BFDTrash" },
	},
	["DireMaulEast"] = {
		{ AL["Pusillin"], "DMEPusillin" },
		{ AL["Zevrim Thornhoof"], "DMEZevrimThornhoof" },
		{ AL["Hydrospawn"], "DMEHydro" },
		{ AL["Lethtendris"], "DMELethtendris" },
		{ AL["Pimgib"], "DMEPimgib" },
		{ AL["Isalien"], "DMEIsalien" },
		{ AL["Alzzin the Wildshaper"], "DMEAlzzin" },
		{ AL["Trash Mobs"], "DMETrash" },
		{ AL["Dire Maul Books"], "DMBooks" },
	},
	["DireMaulWest"] = {
		{ AL["Tendris Warpwood"], "DMWTendrisWarpwood" },
		{ AL["Illyanna Ravenoak"], "DMWIllyannaRavenoak" },
		{ AL["Magister Kalendris"], "DMWMagisterKalendris" },
		{ AL["Tsu'zee"].." ("..AL["Rare"]..")", "DMWTsuzee" },
		{ AL["Revanchion"].." ("..AL["Scourge Invasion"]..")", "DMWRevanchion" },
		{ AL["Immol'thar"], "DMWImmolthar" },
		{ AL["Lord Hel'nurath"].." ("..AL["Rare"]..")", "DMWHelnurath" },
		{ AL["Prince Tortheldrin"], "DMWPrinceTortheldrin" },
		{ AL["Trash Mobs"], "DMWTrash" },
		{ AL["Dire Maul Books"], "DMBooks" }, 
	},
	["DireMaulNorth"] = {
		{ AL["Guard Mol'dar"], "DMNGuardMoldar" },
		{ AL["Stomper Kreeg"], "DMNStomperKreeg" },
		{ AL["Guard Fengus"], "DMNGuardFengus" },
		{ AL["Knot Thimblejack"], "DMNThimblejack" },
		{ AL["Guard Slip'kik"], "DMNGuardSlipkik" },
		{ AL["Captain Kromcrush"], "DMNCaptainKromcrush" },
		{ AL["Cho'Rush the Observer"], "DMNChoRush" },
		{ AL["King Gordok"], "DMNKingGordok" },
		{ AL["Tribute Run"], "DMNTRIBUTERUN" },
		{ AL["Trash Mobs"], "DMNTrash" },
		{ AL["Dire Maul Books"], "DMBooks" },
	},
	["Maraudon"] = {
		{ AL["Noxxion"], "MaraNoxxion" },
		{ AL["Razorlash"], "MaraRazorlash" },
		{ AL["Lord Vyletongue"], "MaraLordVyletongue" },
		{ AL["Meshlok the Harvester"].." ("..AL["Rare"]..")", "MaraMeshlok" },
		{ AL["Celebras the Cursed"], "MaraCelebras" },
		{ AL["Landslide"], "MaraLandslide" },
		{ AL["Tinkerer Gizlock"], "MaraTinkererGizlock" },
		{ AL["Rotgrip"], "MaraRotgrip" },
		{ AL["Princess Theradras"], "MaraPrincessTheradras" },
	},
	["Onyxia"] = {
		{ AL["Onyxia"], "Onyxia" },
	},
	["RagefireChasm"] = {
		{ AL["Taragaman the Hungerer"], "RFCTaragaman" },
		{ AL["Jergosh the Invoker"], "RFCJergosh" },
	},
	["RazorfenDowns"] = {
		{ AL["Tuten'kash"], "RFDTutenkash" },
		{ AL["Lady Falther'ess"].." ("..AL["Scourge Invasion"]..")", "RFDLadyF" },
		{ AL["Plaguemaw the Rotting"], "RFDPlaguemaw" },
		{ AL["Mordresh Fire Eye"], "RFDMordreshFireEye" },
		{ AL["Glutton"], "RFDGlutton" },
		{ AL["Ragglesnout"].." ("..AL["Rare"]..")", "RFDRagglesnout" },
		{ AL["Amnennar the Coldbringer"], "RFDAmnennar" },
		{ AL["Trash Mobs"], "RFDTrash" },
	},
	["RazorfenKraul"] = {
		{ AL["Aggem Thorncurse"], "RFKAggem" },
		{ AL["Death Speaker Jargba"], "RFKDeathSpeakerJargba" },
		{ AL["Overlord Ramtusk"], "RFKOverlordRamtusk" },
		{ AL["Razorfen Spearhide"].." ("..AL["Rare"]..")", "RFKRazorfenSpearhide" },
		{ AL["Agathelos the Raging"], "RFKAgathelos" },
		{ AL["Blind Hunter"].." ("..AL["Rare"]..")", "RFKBlindHunter" },
		{ AL["Charlga Razorflank"], "RFKCharlgaRazorflank" },
		{ AL["Earthcaller Halmgar"].." ("..AL["Rare"]..")", "RFKEarthcallerHalmgar" },
		{ AL["Trash Mobs"], "RFKTrash" },
	},
	["RuinsofAQ"] = {
		{ AL["Kurinnaxx"], "AQ20Kurinnaxx" },
		{ AL["Lieutenant General Andorov"], "AQ20Andorov" },
		{ AtlasLoot_TableNames["AQ20CAPTAIN"][1], "AQ20CAPTAIN" },
		{ AL["General Rajaxx"], "AQ20Rajaxx" },
		{ AL["Moam"], "AQ20Moam" },
		{ AL["Buru the Gorger"], "AQ20Buru" },
		{ AL["Ayamiss the Hunter"], "AQ20Ayamiss" },
		{ AL["Ossirian the Unscarred"], "AQ20Ossirian" },
		{ AL["Trash Mobs"], "AQ20Trash" },
		{ AL["Class Books"], "AQ20ClassBooks" },
		{ AL["AQ Enchants"], "AQEnchants" },
	},
	["TempleofAQ"] = {
		{ AL["The Prophet Skeram"], "AQ40Skeram" },
		{ AL["The Bug Family"], "AQ40Trio" },
		{ AL["Battleguard Sartura"], "AQ40Sartura" },
		{ AL["Fankriss the Unyielding"], "AQ40Fankriss" },
		{ AL["Viscidus"], "AQ40Viscidus" },
		{ AL["Princess Huhuran"], "AQ40Huhuran" },
		{ AL["The Twin Emperors"], "AQ40Emperors" },
		{ AL["Ouro"], "AQ40Ouro" },
		{ AL["C'Thun"], "AQ40CThun" },
		{ AL["Trash Mobs"], "AQ40Trash1" },
		{ AL["AQ Enchants"], "AQEnchants" },
		{ AL["AQ Opening Quest Chain"], "AQOpening" },
	},
	["WailingCaverns"] = {
		{ AL["Lord Cobrahn"], "WCLordCobrahn" },
		{ AL["Lady Anacondra"], "WCLadyAnacondra" },
		{ AL["Kresh"], "WCKresh" },
		{ AL["Lord Pythas"], "WCLordPythas" },
		{ AL["Skum"], "WCSkum" },
		{ AL["Lord Serpentis"], "WCLordSerpentis" },
		{ AL["Verdan the Everliving"], "WCVerdan" },
		{ AL["Mutanus the Devourer"], "WCMutanus" },
		{ AL["Deviate Faerie Dragon"].." ("..AL["Rare"]..")", "WCDeviateFaerieDragon" },
		{ AL["Trash Mobs"], "WCTrash" },
	},
	["ZulFarrak"] = {
		{ AL["Antu'sul"], "ZFAntusul" },
		{ AL["Witch Doctor Zum'rah"], "ZFWitchDoctorZumrah" },
		{ AL["Shadowpriest Sezz'ziz"], "ZFSezzziz" },
		{ AL["Dustwraith"].." ("..AL["Rare"]..")", "ZFDustwraith" },
		{ AL["Zerillis"].." ("..AL["Rare"]..")", "ZFZerillis" },
		{ AL["Gahz'rilla"], "ZFGahzrilla" },
		{ AL["Chief Ukorz Sandscalp"], "ZFChiefUkorzSandscalp" },
		{ AL["Trash Mobs"], "ZFTrash" },
	},
	["WorldBosses"] = {
		{ AL["Azuregos"], "AAzuregos" },
		{ AL["Emeriss"], "DEmeriss" },
		{ AL["Lethon"], "DLethon"},
		{ AL["Taerar"], "DTaerar" },
		{ AL["Ysondre"], "DYsondre" },
		{ AL["Lord Kazzak"], "KKazzak"},
	},
	["AbyssalCouncil1"] = {
		{ AL["Abyssal Council"].." - "..AL["Templars"], "AbyssalTemplars" },
		{ AL["Abyssal Council"].." - "..AL["Dukes"], "AbyssalDukes" },
		{ AL["Abyssal Council"].." - "..AL["High Council"], "AbyssalLords" },
	},
	["Factions"] = {
		{ AL["Argent Dawn"], "Argent1" },
		{ AL["Bloodsail Buccaneers"], "Bloodsail1" },
		{ AL["Brood of Nozdormu"], "AQBroodRings" },
		{ AL["Cenarion Circle"], "Cenarion1" },
		{ AL["Darkmoon Faire"], "Darkmoon" },
		{ AL["Frostwolf Clan"], "Frostwolf1" },
		{ AL["Gelkis Clan Centaur"], "GelkisClan1" },
		{ AL["Hydraxian Waterlords"], "WaterLords1" },
		{ AL["Magram Clan Centaur"], "MagramClan1" },
		{ AL["Stormpike Guard"], "Stormpike1" },
		{ AL["Thorium Brotherhood"], "Thorium1" },
		{ AL["Timbermaw Hold"], "Timbermaw" },
		{ AL["Wintersaber Trainers"], "Wintersaber1" },
		{ AL["Zandalar Tribe"], "Zandalar1" },
	},
	["BoEWorldEpics"] = {
		{ AtlasLoot_TableNames["WorldEpics3"][1], "WorldEpics3" },
		{ AtlasLoot_TableNames["WorldEpics2"][1], "WorldEpics2" },
		{ AtlasLoot_TableNames["WorldEpics1"][1], "WorldEpics1" },
	},
	["CraftSetBlacksmith"] = {
		{ AL["Imperial Plate"], "ImperialPlate" },
		{ AL["The Darksoul"], "TheDarksoul" },
		{ AL["Bloodsoul Embrace"], "BloodsoulEmbrace" },
	},
	["CraftSetLeatherwork"] = {
		{ AL["Volcanic Armor"], "VolcanicArmor" },
		{ AL["Ironfeather Armor"], "IronfeatherArmor" },
		{ AL["Stormshroud Armor"], "StormshroudArmor" },
		{ AL["Devilsaur Armor"], "DevilsaurArmor" },
		{ AL["Blood Tiger Harness"], "BloodTigerH" },
		{ AL["Primal Batskin"], "PrimalBatskin" },
		{ AL["Green Dragon Mail"], "GreenDragonM" },
		{ AL["Blue Dragon Mail"], "BlueDragonM" },
		{ AL["Black Dragon Mail"], "BlackDragonM" },
	},
	["DungeonSets12"] = {
		{ "|cffffffff"..AL["Priest"], "T0Priest" },
		{ "|cff68ccef"..AL["Mage"], "T0Mage" },
		{ "|cff9382c9"..AL["Warlock"], "T0Warlock" },
		{ "|cfffff468"..AL["Rogue"], "T0Rogue" },
		{ "|cffff7c0a"..AL["Druid"], "T0Druid" },
		{ "|cffaad372"..AL["Hunter"], "T0Hunter" },
		{ "|cff2773ff"..AL["Shaman"], "T0Shaman" },
		{ "|cfff48cba"..AL["Paladin"], "T0Paladin" },
		{ "|cffc69b6d"..AL["Warrior"], "T0Warrior" },
	},
	["AQ20Sets"] = {
		{ "|cffffffff"..AL["Priest"], "AQ20Priest" },
		{ "|cff68ccef"..AL["Mage"], "AQ20Mage" },
		{ "|cff9382c9"..AL["Warlock"], "AQ20Warlock" },
		{ "|cfffff468"..AL["Rogue"], "AQ20Rogue" },
		{ "|cffff7c0a"..AL["Druid"], "AQ20Druid" },
		{ "|cffaad372"..AL["Hunter"], "AQ20Hunter" },
		{ "|cff2773ff"..AL["Shaman"], "AQ20Shaman" },
		{ "|cfff48cba"..AL["Paladin"], "AQ20Paladin" },
		{ "|cffc69b6d"..AL["Warrior"], "AQ20Warrior" },
	},
	["AQ40Sets"] = {
		{ "|cffffffff"..AL["Priest"], "AQ40Priest" },
		{ "|cff68ccef"..AL["Mage"], "AQ40Mage" },
		{ "|cff9382c9"..AL["Warlock"], "AQ40Warlock" },
		{ "|cfffff468"..AL["Rogue"], "AQ40Rogue" },
		{ "|cffff7c0a"..AL["Druid"], "AQ40Druid" },
		{ "|cffaad372"..AL["Hunter"], "AQ40Hunter" },
		{ "|cff2773ff"..AL["Shaman"], "AQ40Shaman" },
		{ "|cfff48cba"..AL["Paladin"], "AQ40Paladin" },
		{ "|cffc69b6d"..AL["Warrior"], "AQ40Warrior" },
	},
	["T1Sets"] = {
		{ "|cffffffff"..AL["Priest"], "T1Priest" },
		{ "|cff68ccef"..AL["Mage"], "T1Mage" },
		{ "|cff9382c9"..AL["Warlock"], "T1Warlock" },
		{ "|cfffff468"..AL["Rogue"], "T1Rogue" },
		{ "|cffff7c0a"..AL["Druid"], "T1Druid" },
		{ "|cffaad372"..AL["Hunter"], "T1Hunter" },
		{ "|cff2773ff"..AL["Shaman"], "T1Shaman" },
		{ "|cfff48cba"..AL["Paladin"], "T1Paladin" },
		{ "|cffc69b6d"..AL["Warrior"], "T1Warrior" },
	},
	["T2Sets"] = {
		{ "|cffffffff"..AL["Priest"], "T2Priest" },
		{ "|cff68ccef"..AL["Mage"], "T2Mage" },
		{ "|cff9382c9"..AL["Warlock"], "T2Warlock" },
		{ "|cfffff468"..AL["Rogue"], "T2Rogue" },
		{ "|cffff7c0a"..AL["Druid"], "T2Druid" },
		{ "|cffaad372"..AL["Hunter"], "T2Hunter" },
		{ "|cff2773ff"..AL["Shaman"], "T2Shaman" },
		{ "|cfff48cba"..AL["Paladin"], "T2Paladin" },
		{ "|cffc69b6d"..AL["Warrior"], "T2Warrior" },
	},
	["T3Sets"] = {
		{ "|cffffffff"..AL["Priest"], "T3Priest" },
		{ "|cff68ccef"..AL["Mage"], "T3Mage" },
		{ "|cff9382c9"..AL["Warlock"], "T3Warlock" },
		{ "|cfffff468"..AL["Rogue"], "T3Rogue" },
		{ "|cffff7c0a"..AL["Druid"], "T3Druid" },
		{ "|cffaad372"..AL["Hunter"], "T3Hunter" },
		{ "|cff2773ff"..AL["Shaman"], "T3Shaman" },
		{ "|cfff48cba"..AL["Paladin"], "T3Paladin" },
		{ "|cffc69b6d"..AL["Warrior"], "T3Warrior" },
	},
	["ZGSets"] = {
		{ "|cffffffff"..AL["Priest"], "ZGPriest" },
		{ "|cff68ccef"..AL["Mage"], "ZGMage" },
		{ "|cff9382c9"..AL["Warlock"], "ZGWarlock" },
		{ "|cfffff468"..AL["Rogue"], "ZGRogue" },
		{ "|cffff7c0a"..AL["Druid"], "ZGDruid" },
		{ "|cffaad372"..AL["Hunter"], "ZGHunter" },
		{ "|cff2773ff"..AL["Shaman"], "ZGShaman" },
		{ "|cfff48cba"..AL["Paladin"], "ZGPaladin" },
		{ "|cffc69b6d"..AL["Warrior"], "ZGWarrior" },
	},
	["Pre60Sets"] = {
		{ AL["Bloodmail Regalia"], "ScholoMail" },
		{ AL["Cadaverous Garb"], "ScholoLeather" },
		{ AL["Chain of the Scarlet Crusade"], "SCARLET" },
		{ AL["Dal'Rend's Arms"], "DalRend" },
		{ AL["Deathbone Guardian"], "ScholoPlate" },
		{ AL["Defias Leather"], "DEADMINES" },
		{ AL["Embrace of the Viper"], "WAILING" },
		{ AL["Ironweave Battlesuit"], "IRONWEAVE" },
		{ AL["Necropile Raiment"], "ScholoCloth" },
		{ AL["Primal Blessing"], "PrimalBlessing" },
		{ AL["Scourge Invasion"], "ScourgeInvasion" },
		{ AL["Shard of the Gods"], "ShardOfGods" },
		{ AL["Spider's Kiss"], "SpiderKiss" },
		{ AL["Spirit of Eskhandar"], "SpiritofEskhandar" },
		{ AL["The Gladiator"], "BLACKROCKD" },
		{ AL["The Postmaster"], "SCARLET" },
		{ AL["The Twin Blades of Hakkari"], "HakkariBlades" },
		{ AL["Zul'Gurub Rings"], "ZGRings" },
	},
	["AVRewards"] = {
		{ AL["Exalted Reputation Rewards"], "AVRepExalted" },
		{ AL["Revered Reputation Rewards"], "AVRepRevered" },
		{ AL["Honored Reputation Rewards"], "AVRepHonored" },
		{ AL["Friendly Reputation Rewards"], "AVRepFriendly" },
	},
	["ABRewards"] = {
		{ AL["Exalted Reputation Rewards"], "ABRepExalted" },
		{ AL["Revered Reputation Rewards"], "ABRepRevered5059" },
		{ AL["Honored Reputation Rewards"], "ABRepHonored5059" },
		{ AL["Friendly Reputation Rewards"], "ABRepFriendly5059" },
	},
	["PvPArmorSets"] = {
		{ AL["Priest"], "PVPPriest" },
		{ AL["Mage"], "PVPMage" },
		{ AL["Warlock"], "PVPWarlock" },
		{ AL["Rogue"], "PVPRogue" },
		{ AL["Druid"], "PVPDruid" },
		{ AL["Hunter"], "PVPHunter" },
		{ AL["Shaman"], "PVPShaman" },
		{ AL["Paladin"], "PVPPaladin" },
		{ AL["Warrior"], "PVPWarrior" },
	},
	["WSGRewards"] = {
		{ AL["Exalted Reputation Rewards"], "WSGRepExalted60" },
		{ AL["Revered Reputation Rewards"], "WSGRepRevered5059" },
		{ AL["Honored Reputation Rewards"], "WSGRepHonored5059" },
		{ AL["Friendly Reputation Rewards"], "WSGRepFriendly4049" },
	},
	["Alchemy"] = {
		{ AtlasLoot_TableNames["AlchemyApprentice1"][1], "AlchemyApprentice1" },
		{ AtlasLoot_TableNames["AlchemyJourneyman1"][1], "AlchemyJourneyman1" },
		{ AtlasLoot_TableNames["AlchemyExpert1"][1], "AlchemyExpert1" },
		{ AtlasLoot_TableNames["AlchemyArtisan1"][1], "AlchemyArtisan1" },
	},
	["Blacksmithing"] = {
		{ AtlasLoot_TableNames["SmithingApprentice1"][1], "SmithingApprentice1" },
		{ AtlasLoot_TableNames["SmithingJourneyman1"][1], "SmithingJourneyman1" },
		{ AtlasLoot_TableNames["SmithingExpert1"][1], "SmithingExpert1" },
		{ AtlasLoot_TableNames["SmithingArtisan1"][1], "SmithingArtisan1" },
		{ AtlasLoot_TableNames["Armorsmith1"][1], "Armorsmith1" },
		{ AtlasLoot_TableNames["Weaponsmith1"][1], "Weaponsmith1" },
		{ AtlasLoot_TableNames["Axesmith1"][1], "Axesmith1" },
		{ AtlasLoot_TableNames["Hammersmith1"][1], "Hammersmith1" },
		{ AtlasLoot_TableNames["Swordsmith1"][1], "Swordsmith1" },
	},
	["Cooking"] = {
		{ AtlasLoot_TableNames["CookingApprentice1"][1], "CookingApprentice1" },
		{ AtlasLoot_TableNames["CookingJourneyman1"][1], "CookingJourneyman1" },
		{ AtlasLoot_TableNames["CookingExpert1"][1], "CookingExpert1" },
		{ AtlasLoot_TableNames["CookingArtisan1"][1], "CookingArtisan1" },
	},
	["Enchanting"] = {
		{ AtlasLoot_TableNames["EnchantingApprentice1"][1], "EnchantingApprentice1" },
		{ AtlasLoot_TableNames["EnchantingJourneyman1"][1], "EnchantingJourneyman1" },
		{ AtlasLoot_TableNames["EnchantingExpert1"][1], "EnchantingExpert1" },
		{ AtlasLoot_TableNames["EnchantingArtisan1"][1], "EnchantingArtisan1" },
	},
	["Engineering"] = {
		{ AtlasLoot_TableNames["EngineeringApprentice1"][1], "EngineeringApprentice1" },
		{ AtlasLoot_TableNames["EngineeringJourneyman1"][1], "EngineeringJourneyman1" },
		{ AtlasLoot_TableNames["EngineeringExpert1"][1], "EngineeringExpert1" },
		{ AtlasLoot_TableNames["EngineeringArtisan1"][1], "EngineeringArtisan1" },
		{ AtlasLoot_TableNames["Gnomish1"][1], "Gnomish1" },
		{ AtlasLoot_TableNames["Goblin1"][1], "Goblin1" },
	},
	["Leatherworking"] = {
		{ AtlasLoot_TableNames["LeatherApprentice1"][1], "LeatherApprentice1" },
		{ AtlasLoot_TableNames["LeatherJourneyman1"][1], "LeatherJourneyman1" },
		{ AtlasLoot_TableNames["LeatherExpert1"][1], "LeatherExpert1" },
		{ AtlasLoot_TableNames["LeatherArtisan1"][1], "LeatherArtisan1" },
		{ AtlasLoot_TableNames["Dragonscale1"][1], "Dragonscale1" },
		{ AtlasLoot_TableNames["Elemental1"][1], "Elemental1" },
		{ AtlasLoot_TableNames["Tribal1"][1], "Tribal1" },
	},
	["Mining"] = {
		{ AL["Mining"], "Mining1" },
		{ AL["Smelting"], "Smelting1" },
	},
	["Tailoring"] = {
		{ AtlasLoot_TableNames["TailoringApprentice1"][1], "TailoringApprentice1" },
		{ AtlasLoot_TableNames["TailoringJourneyman1"][1], "TailoringJourneyman1" },
		{ AtlasLoot_TableNames["TailoringExpert1"][1], "TailoringExpert1" },
		{ AtlasLoot_TableNames["TailoringArtisan1"][1], "TailoringArtisan1" },
	},
};

--------------------------------------------------------------------------------
-- Item OnEnter
-- Called when a loot item is moused over
--------------------------------------------------------------------------------
function AtlasLootItem_OnEnter()
	local isItem, isEnchant, isSpell;
	AtlasLootTooltip:ClearLines();
	for i=1, 30, 1 do
		if (getglobal("AtlasLootTooltipTextRight"..i) ~= nil) then
			getglobal("AtlasLootTooltipTextRight"..i):SetText("");
		end
	end
	if (this.itemID ~= 0) then
		if string.sub(this.itemID, 1, 1) == "s" then
			isItem = false;
			isEnchant = false;
			isSpell = true;
		elseif string.sub(this.itemID, 1, 1) == "e" then
			isItem = false;
			isEnchant = true;
			isSpell = false;
		else
			isItem = true;
			isEnchant = false;
			isSpell = false;
		end
		if isItem then
			local color = strsub(getglobal("AtlasLootItem_"..this:GetID().."_Name"):GetText(), 3, 10);
			local name = strsub(getglobal("AtlasLootItem_"..this:GetID().."_Name"):GetText(), 11);
			--Lootlink tooltips
			if( AtlasLootCharDB.LootlinkTT ) then
				--If we have seen the item, use the game tooltip to minimise same name item problems
				if(GetItemInfo(this.itemID) ~= nil) then
					getglobal(this:GetName().."_Unsafe"):Hide();
					AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 24);
					AtlasLootTooltip:SetHyperlink("item:"..this.itemID..":0:0:0");
					if ( AtlasLootCharDB.ItemIDs ) then
						AtlasLootTooltip:AddLine(BLUE..AL["ItemID:"].." "..this.itemID, nil, nil, nil, 1);
					end
					if( this.droprate ~= nil) then
						AtlasLootTooltip:AddLine(AL["Drop Rate: "]..this.droprate, 1, 1, 0);
					end
					AtlasLootTooltip:Show();
					if (LootLink_AddItem) then
						LootLink_AddItem(name, this.itemID..":0:0:0", color);
					end
				else
					AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 24);
					if (LootLink_Database and LootLink_Database[this.itemID]) then
						LootLink_SetTooltip(AtlasLootTooltip, LootLink_Database[this.itemID][1], 1);
					else
						LootLink_SetTooltip(AtlasLootTooltip,strsub(getglobal("AtlasLootItem_"..this:GetID().."_Name"):GetText(), 11), 1);
					end
					if ( AtlasLootCharDB.ItemIDs ) then
						AtlasLootTooltip:AddLine(BLUE..AL["ItemID:"].." "..this.itemID, nil, nil, nil, 1);
					end
					if( this.droprate ~= nil) then
						AtlasLootTooltip:AddLine(AL["Drop Rate: "]..this.droprate, 1, 1, 0, 1);
					end
					AtlasLootTooltip:AddLine(" ");
					AtlasLootTooltip:AddLine(AL["You can right-click to attempt to query the server.  You may be disconnected."], nil, nil, nil, 1);
					AtlasLootTooltip:Show();
				end
			--Item Sync tooltips
			elseif( AtlasLootCharDB.ItemSyncTT ) then
				if(GetItemInfo(this.itemID) ~= nil) then
					getglobal(this:GetName().."_Unsafe"):Hide();
				end
				ItemSync:ButtonEnter();
				if ( AtlasLootCharDB.ItemIDs ) then
					GameTooltip:AddLine(BLUE..AL["ItemID:"].." "..this.itemID, nil, nil, nil, 1);
				end
				if( this.droprate ~= nil) then
					GameTooltip:AddLine(AL["Drop Rate: "]..this.droprate, 1, 1, 0);
				end
				GameTooltip:Show();
			--Default game tooltips
			else
				if(this.itemID ~= nil) then
					if(GetItemInfo(this.itemID) ~= nil) then
						getglobal(this:GetName().."_Unsafe"):Hide();
						AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 24);
						AtlasLootTooltip:SetHyperlink("item:"..this.itemID..":0:0:0");
						if ( AtlasLootCharDB.ItemIDs ) then
							AtlasLootTooltip:AddLine(BLUE..AL["ItemID:"].." "..this.itemID, nil, nil, nil, 1);
						end
						if( this.droprate ~= nil) then
							AtlasLootTooltip:AddLine(AL["Drop Rate: "]..this.droprate, 1, 1, 0);
						end
						AtlasLootTooltip:Show();
					else
						AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 24);
						AtlasLootTooltip:ClearLines();
						AtlasLootTooltip:AddLine(RED..AL["Item Unavailable"], nil, nil, nil, 1);
						AtlasLootTooltip:AddLine(BLUE..AL["ItemID:"].." "..this.itemID, nil, nil, nil, 1);
						AtlasLootTooltip:AddLine(AL["This item is unsafe.  To view this item without the risk of disconnection, you need to have first seen it in the game world. This is a restriction enforced by Blizzard since Patch 1.10."], nil, nil, nil, 1);
						AtlasLootTooltip:AddLine(" ");
						AtlasLootTooltip:AddLine(AL["You can right-click to attempt to query the server.  You may be disconnected."], nil, nil, nil, 1);
						AtlasLootTooltip:Show();
					end
				end
			end
		elseif isEnchant then
			spellID = tonumber(string.sub(this.itemID, 2));
			AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 24);
			AtlasLootTooltip:ClearLines();
			AtlasLootTooltip:SetHyperlink("enchant:"..spellID);
			if ( AtlasLootCharDB.ItemIDs ) then
				AtlasLootTooltip:AddLine(BLUE..AL["SpellID:"].." "..spellID, nil, nil, nil, 1);
			end
			AtlasLootTooltip:Show();
			if GetSpellInfoVanillaDB["enchants"][spellID]["item"] and GetSpellInfoVanillaDB["enchants"][spellID]["item"] ~= nil and GetSpellInfoVanillaDB["enchants"][spellID]["item"] ~= "" then
				AtlasLootTooltip2:SetOwner(AtlasLootTooltip, "ANCHOR_BOTTOMRIGHT", -(AtlasLootTooltip:GetWidth()), 0);
				AtlasLootTooltip2:ClearLines();
				AtlasLootTooltip2:SetHyperlink("item:"..GetSpellInfoVanillaDB["enchants"][spellID]["item"]..":0:0:0");
				if GetSpellInfoVanillaDB["enchants"][spellID]["extra"] and GetSpellInfoVanillaDB["enchants"][spellID]["extra"] ~= nil and GetSpellInfoVanillaDB["enchants"][spellID]["extra"] ~= "" then
					AtlasLootTooltip2:AddLine(GetSpellInfoVanillaDB["enchants"][spellID]["extra"], nil, nil, nil, 1);
				end
				if ( AtlasLootCharDB.ItemIDs ) then
					AtlasLootTooltip2:AddLine(BLUE..AL["ItemID:"].." "..GetSpellInfoVanillaDB["enchants"][spellID]["item"], nil, nil, nil, 1);
				end
				AtlasLootTooltip2:Show();
			end
		elseif isSpell then
			spellID = tonumber(string.sub(this.itemID, 2));
			local TooltipTools, TooltipReagents = "", "";
			if GetSpellInfoVanillaDB["craftspells"][spellID]["tools"] ~= "" then
				for i = 1, table.getn(GetSpellInfoVanillaDB["craftspells"][spellID]["tools"]) do
					AtlasLoot_CheckBagsForItems(GetSpellInfoVanillaDB["craftspells"][spellID]["tools"][i])
					TooltipTools = TooltipTools..AtlasLoot_CheckBagsForItems(GetSpellInfoVanillaDB["craftspells"][spellID]["tools"][i])..WHITE..", "
				end
				TooltipTools = string.sub(TooltipTools, 1, -3)
			end
			if GetSpellInfoVanillaDB["craftspells"][spellID]["reagents"] ~= "" then
				for i = 1, table.getn(GetSpellInfoVanillaDB["craftspells"][spellID]["reagents"]) do
					local reagent = GetSpellInfoVanillaDB["craftspells"][spellID]["reagents"][i]
					TooltipReagents = TooltipReagents..AtlasLoot_CheckBagsForItems(reagent[1], reagent[2])..WHITE..", "
				end
				TooltipReagents = string.sub(TooltipReagents, 1, -3)
			end
			AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 24);
			AtlasLootTooltip:ClearLines();
			AtlasLootTooltip:AddLine(GetSpellInfoVanillaDB["craftspells"][spellID]["name"]);
			AtlasLootTooltip:AddLine(WHITE..GetSpellInfoVanillaDB["craftspells"][spellID]["castTime"].." sec cast");
			if GetSpellInfoVanillaDB["craftspells"][spellID]["requires"] ~= "" then
				AtlasLootTooltip:AddLine(WHITE.."Requires: "..GetSpellInfoVanillaDB["craftspells"][spellID]["requires"]);
			end
			if TooltipTools ~= "" then
				AtlasLootTooltip:AddLine(WHITE.."Tools: "..TooltipTools, nil, nil, nil, 1);
			end
			if TooltipReagents ~= "" then
				AtlasLootTooltip:AddLine(WHITE.."Reagents: "..TooltipReagents, nil, nil, nil, 1);
			end
			if GetSpellInfoVanillaDB["craftspells"][spellID]["text"] ~= "" then
				AtlasLootTooltip:AddLine(GetSpellInfoVanillaDB["craftspells"][spellID]["text"], nil, nil, nil, 1);
			end
			if ( AtlasLootCharDB.ItemIDs ) then
				if spellID < 100000 then
					AtlasLootTooltip:AddLine(BLUE..AL["SpellID:"].." "..spellID, nil, nil, nil, 1);
				elseif spellID >= 100000 and spellID <= 100005 then
					AtlasLootTooltip:AddLine(BLUE..AL["SpellID:"].." 2575", nil, nil, nil, 1);
				elseif spellID >= 100006 and spellID <= 100007 then
					AtlasLootTooltip:AddLine(BLUE..AL["SpellID:"].." 2576", nil, nil, nil, 1);
				elseif spellID >= 100008 and spellID <= 100011 then
					AtlasLootTooltip:AddLine(BLUE..AL["SpellID:"].." 3564", nil, nil, nil, 1);
				elseif spellID >= 100012 and spellID <= 100024 then
					AtlasLootTooltip:AddLine(BLUE..AL["SpellID:"].." 10248", nil, nil, nil, 1);
				end
			end
			AtlasLootTooltip:Show();
			local craftitem2 = GetSpellInfoVanillaDB["craftspells"][spellID]["craftItem"]
			if craftitem2 ~= nil and craftitem2 ~= "" then
				AtlasLootTooltip2:SetOwner(AtlasLootTooltip, "ANCHOR_BOTTOMRIGHT", -(AtlasLootTooltip:GetWidth()), 0);
				AtlasLootTooltip2:ClearLines();
				AtlasLootTooltip2:SetHyperlink("item:"..GetSpellInfoVanillaDB["craftspells"][spellID]["craftItem"]..":0:0:0");
				if GetSpellInfoVanillaDB["craftspells"][spellID]["extra"] and GetSpellInfoVanillaDB["craftspells"][spellID]["extra"] ~= nil then
					AtlasLootTooltip2:AddLine(GetSpellInfoVanillaDB["craftspells"][spellID]["extra"], nil, nil, nil, 1);
				end
				if ( AtlasLootCharDB.ItemIDs ) then
					AtlasLootTooltip2:AddLine(BLUE..AL["ItemID:"].." "..GetSpellInfoVanillaDB["craftspells"][spellID]["craftItem"], nil, nil, nil, 1);
				end
				AtlasLootTooltip2:Show();
			end
		end
	end
end

--------------------------------------------------------------------------------
-- Item OnLeave
-- Called when the mouse cursor leaves a loot item
--------------------------------------------------------------------------------
function AtlasLootItem_OnLeave()
	--Hide the necessary tooltips
	if( AtlasLootCharDB.LootlinkTT ) then
		AtlasLootTooltip:Hide();
			AtlasLootTooltip2:Hide();
	elseif( AtlasLootCharDB.ItemSyncTT ) then
		if(GameTooltip:IsVisible()) then
			GameTooltip:Hide();
			AtlasLootTooltip2:Hide();
		end
	else
		if(this.itemID ~= nil) then
			AtlasLootTooltip:Hide();
			GameTooltip:Hide();
			AtlasLootTooltip2:Hide();
		end
	end
	if ( ShoppingTooltip2:IsVisible() or ShoppingTooltip1.IsVisible) then
		ShoppingTooltip2:Hide();
		ShoppingTooltip1:Hide();
	end
end

--------------------------------------------------------------------------------
-- Item OnClick
-- Called when a loot item is clicked on
--------------------------------------------------------------------------------
function AtlasLootItem_OnClick(arg1)
	local isItem, isEnchant, isSpell;
	local color = strsub(getglobal("AtlasLootItem_"..this:GetID().."_Name"):GetText(), 1, 10);
	local id = this:GetID();
	local name = strsub(getglobal("AtlasLootItem_"..this:GetID().."_Name"):GetText(), 11);
	if string.sub(this.itemID, 1, 1) == "s" then
		isItem = false;
		isEnchant = false;
		isSpell = true;
	elseif string.sub(this.itemID, 1, 1) == "e" then
		isItem = false;
		isEnchant = true;
		isSpell = false;
	else
		isItem = true;
		isEnchant = false;
		isSpell = false;
	end
	if isItem then
		local iteminfo = GetItemInfo(this.itemID);
		local itemName, itemLink, itemQuality, itemMinLevel, itemType, itemSubType, itemCount, itemEquipLoc, itemTexture = GetItemInfo(this.itemID);
		--If shift-clicked, link in the chat window
		if(arg1=="RightButton" and not iteminfo and this.itemID ~= 0) then
			AtlasLootTooltip:SetHyperlink("item:"..this.itemID..":0:0:0");
			if not AtlasLootCharDB.ItemSpam then
				DEFAULT_CHAT_FRAME:AddMessage(AL["Server queried for "]..color.."["..name.."]".."|r"..AL[".  Right click on any other item to refresh the loot page."]);
			end
			AtlasLootItemsFrame:Hide();
			AtlasLoot_ShowItemsFrame(AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4]);
		elseif(arg1=="RightButton" and iteminfo) then
			AtlasLootItemsFrame:Hide();
			AtlasLoot_ShowItemsFrame(AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4]);
			if not AtlasLootCharDB.ItemSpam then
				DEFAULT_CHAT_FRAME:AddMessage(itemName..AL[" is safe."]);
			end
		elseif IsShiftKeyDown() and not iteminfo and this.itemID ~= 0 then
			if AtlasLootCharDB.SafeLinks then
				if ChatFrameEditBox:IsVisible() then
					ChatFrameEditBox:Insert("["..name.."]");
				else
					AtlasLoot_SayItemReagents(this.itemID, nil, name, true)
				end
			elseif AtlasLootCharDB.AllLinks then
				if ChatFrameEditBox:IsVisible() then
					ChatFrameEditBox:Insert("\124"..string.sub(color, 2).."|Hitem:"..this.itemID.."\124h["..name.."]|h|r");
				else
					AtlasLoot_SayItemReagents(this.itemID, color, name)
				end
			end
		elseif(ChatFrameEditBox:IsVisible() and iteminfo and IsShiftKeyDown()) and this.itemID ~= 0 then
			ChatFrameEditBox:Insert(color.."|Hitem:"..this.itemID..":0:0:0|h["..name.."]|h|r");
		elseif IsShiftKeyDown() and iteminfo and this.itemID ~= 0 then
			AtlasLoot_SayItemReagents(this.itemID, color, name);
		--If control-clicked, use the dressing room
		elseif(IsControlKeyDown() and iteminfo) then
			DressUpItemLink(itemLink);
		elseif(IsAltKeyDown() and (this.itemID ~= 0)) then
			if AtlasLootItemsFrame.refresh[1] == "WishList" then
				AtlasLoot_DeleteFromWishList(this.itemID);
			elseif AtlasLootItemsFrame.refresh[1] == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.itemID));
			else
				AtlasLoot_AddToWishlist(this.itemID, strsplit("\\", getglobal("AtlasLootItem_"..this:GetID().."_Icon"):GetTexture(), 0, true), this.itemIDName, this.itemIDExtra, AtlasLootItemsFrame.refresh[1].."|"..AtlasLootItemsFrame.refresh[2]);
			end
		elseif((AtlasLootItemsFrame.refresh[1] == "SearchResult" or AtlasLootItemsFrame.refresh[1] == "WishList") and this.sourcePage) then
			local dataID, dataSource = strsplit("|", this.sourcePage);
			if(dataID and dataSource and AtlasLoot_IsLootTableAvailable(dataID)) then
				AtlasLoot_ShowItemsFrame(dataID, dataSource, AtlasLoot_TableNames[dataID][1], AtlasLootItemsFrame.refresh[4]);
			end
		end
	elseif isEnchant then
		if IsShiftKeyDown() then
			--[[if ChatFrameEditBox:IsVisible() then
				ChatFrameEditBox:Insert(color.."|Henchant:"..string.sub(this.itemID, 2)..":0:0:0|h["..name.."]|h|r");
			else]]
				AtlasLoot_SayItemReagents(this.itemID)
			--end
		elseif(IsAltKeyDown() and (this.itemID ~= 0)) then
			if AtlasLootItemsFrame.refresh[1] == "WishList" then
				AtlasLoot_DeleteFromWishList(this.itemID);
			elseif AtlasLootItemsFrame.refresh[1] == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.itemID));
			else
				AtlasLoot_AddToWishlist(this.itemID, strsplit("\\", getglobal("AtlasLootItem_"..this:GetID().."_Icon"):GetTexture(), 0, true), this.itemIDName, this.itemIDExtra, AtlasLootItemsFrame.refresh[1].."|"..AtlasLootItemsFrame.refresh[2]);
			end
		elseif(IsControlKeyDown()) then
			DressUpItemLink("item:"..this.dressingroomID..":0:0:0");
		elseif((AtlasLootItemsFrame.refresh[1] == "SearchResult" or AtlasLootItemsFrame.refresh[1] == "WishList") and this.sourcePage) then
			local dataID, dataSource = strsplit("|", this.sourcePage);
			if(dataID and dataSource and AtlasLoot_IsLootTableAvailable(dataID)) then
				AtlasLoot_ShowItemsFrame(dataID, dataSource, AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4]);
			end
		end
	elseif isSpell then
		if IsShiftKeyDown() then
			if tonumber(string.sub(this.itemID, 2)) < 100000 then
				if ChatFrameEditBox:IsVisible() then
					local craftitem = GetSpellInfoVanillaDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]
					if craftitem ~= nil and craftitem ~= "" then
						local craftname = GetItemInfo(craftitem)
						ChatFrameEditBox:Insert("\124"..string.sub(color, 2).."|Hitem:"..craftitem.."\124h["..craftname.."]|h|r");
					else
						ChatFrameEditBox:Insert(name);
					end
				else
					AtlasLoot_SayItemReagents(this.itemID)
				end
			else
				if ChatFrameEditBox:IsVisible() then
					local craftitem = GetSpellInfoVanillaDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]
					if craftitem ~= nil and craftitem ~= "" then
						local craftname = GetItemInfo(craftitem)
						ChatFrameEditBox:Insert(AtlasLoot_GetChatLink(GetSpellInfoVanillaDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]));
					else
						ChatFrameEditBox:Insert(name);
					end
				else
					if channel == "WHISPER" then
						chatnumber = ChatFrameEditBox.tellTarget
					elseif channel == "CHANNEL" then
						chatnumber = ChatFrameEditBox.channelTarget
					end	
					SendChatMessage(AtlasLoot_GetChatLink(GetSpellInfoVanillaDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]),channel,nil,chatnumber);
				end
			end
		elseif(IsAltKeyDown() and (this.itemID ~= 0)) then
			if AtlasLootItemsFrame.refresh[1] == "WishList" then
				AtlasLoot_DeleteFromWishList(this.itemID);
			elseif AtlasLootItemsFrame.refresh[1] == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.itemID));
			else
				AtlasLoot_AddToWishlist(this.itemID, strsplit("\\", getglobal("AtlasLootItem_"..this:GetID().."_Icon"):GetTexture(), 0, true), this.itemIDName, this.itemIDExtra, AtlasLootItemsFrame.refresh[1].."|"..AtlasLootItemsFrame.refresh[2]);
			end
		elseif(IsControlKeyDown()) then
			DressUpItemLink("item:"..this.dressingroomID..":0:0:0");
		elseif((AtlasLootItemsFrame.refresh[1] == "SearchResult" or AtlasLootItemsFrame.refresh[1] == "WishList") and this.sourcePage) then
			local dataID, dataSource = strsplit("|", this.sourcePage);
			if(dataID and dataSource and AtlasLoot_IsLootTableAvailable(dataID)) then
				AtlasLoot_ShowItemsFrame(dataID, dataSource, AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4]);
			end
		end
	end
end

--[[
AtlasLoot_QueryLootPage()
Querys all valid items on the current loot page.
]]
function AtlasLoot_QueryLootPage()
	i=1;
	while i<31 do
		button = getglobal("AtlasLootItem_"..i);
		queryitem = button.itemID;
		if (queryitem) and (queryitem ~= nil) and (queryitem ~= "") and (queryitem ~= 0) and (string.sub(queryitem, 1, 1) ~= "s") and (string.sub(queryitem, 1, 1) ~= "e") then
			GameTooltip:SetHyperlink("item:"..queryitem..":0:0:0");
		end
		i=i+1;
	end
end

local function idFromLink(itemlink)
	if itemlink then
		local _,_,id = string.find(itemlink, "|Hitem:([^:]+)%:")
		return tonumber(id)
	end
	return nil	
end

function AtlasLoot_CheckBagsForItems(id, qty)
	if not id then DEFAULT_CHAT_FRAME:AddMessage("AtlasLoot_CheckBagsForItems: no ID specified!") return end
	if not qty then qty = 1 end
	local itemsfound = 0;
	if not GetItemInfo then return RED..AL["Unknown"] end
	local itemName = GetItemInfo(id);
	if not itemName then itemName = AL["Uncached"] end
	for i=0,NUM_BAG_FRAMES do
		for j=1,GetContainerNumSlots(i) do
			local itemLink = GetContainerItemLink(i, j)
			if itemLink and idFromLink(itemLink) == tonumber(id) then
				local _, stackCount = GetContainerItemInfo(i, j)
				itemsfound = itemsfound + stackCount
				if itemsfound >= qty then
					if qty == 1 then
						return WHITE..itemName
					else
						return WHITE..itemName.." ("..qty..")"
					end
				end
			end
		end
	end
	if qty == 1 then
		return RED..itemName
	else
		return RED..itemName.." ("..qty..")"
	end
end

function AtlasLoot_SayItemReagents(id, color, name, safe)
	if not id then return end
	local channel, chatnumber = ChatFrameEditBox.chatType;
	local chatline = "";
	local itemCount = 0;
	if channel == "WHISPER" then
		chatnumber = ChatFrameEditBox.tellTarget
	elseif channel == "CHANNEL" then
		chatnumber = ChatFrameEditBox.channelTarget
	end
	if string.sub( id, 1, 1 ) == "s" then
		local spellid = string.sub( id, 2 )
		local craftitem = GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["craftItem"]
		if craftitem ~= nil and craftitem ~= "" then
			local craftnumber = "";
			local qtyMin = GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["craftQuantityMin"];
			local qtyMax = GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["craftQuantityMax"];
			if qtyMin and qtyMin ~= "" then
				if qtyMax and qtyMax ~= "" then
					craftnumber = craftnumber..qtyMin.. "-"..qtyMax.."x"
				else
					craftnumber = craftnumber..qtyMin.."x"
				end
			end
			SendChatMessage(AL["To craft "]..craftnumber..AtlasLoot_GetChatLink(craftitem)..AL[" the following reagents are needed:"],channel,nil,chatnumber);
			for j = 1, table.getn(GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["reagents"]) do
				local tempnumber = GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["reagents"][j][2]
				if not tempnumber or tempnumber == nil or tempnumber == "" then
					tempnumber = 1;
				end
				chatline = chatline..tempnumber.."x"..AtlasLoot_GetChatLink(GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["reagents"][j][1]).." ";
				itemCount = itemCount + 1;
				if itemCount == 4 then
					SendChatMessage(chatline, channel, nil, chatnumber);
					chatline = "";
					itemCount = 0;
				end
			end
			if itemCount > 0 then
				SendChatMessage(chatline, channel, nil, chatnumber);
			end
		else
			SendChatMessage(AL["To cast "]..GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["name"]..AL[" the following items are needed:"],channel,nil,chatnumber);
			for j = 1, table.getn(GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["reagents"]) do
				local tempnumber = GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["reagents"][j][2]
				if not tempnumber or tempnumber == nil or tempnumber == "" then
					tempnumber = 1;
				end
				chatline = chatline..tempnumber.."x"..AtlasLoot_GetChatLink(GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["reagents"][j][1]).." ";
				itemCount = itemCount + 1;
				if itemCount == 4 then
					SendChatMessage(chatline, channel, nil, chatnumber);
					chatline = "";
					itemCount = 0;
				end
			end
			if itemCount > 0 then
				SendChatMessage(chatline, channel, nil, chatnumber);
			end
		end
	elseif string.sub( id,1 ,1 ) == "e" then
		local spellid = string.sub( id, 2 )
		local name = GetSpellInfoVanillaDB["enchants"][tonumber(spellid)]["name"]
		if ChatFrameEditBox:IsVisible() then
			if not GetSpellInfoVanillaDB["enchants"][tonumber(spellid)]["item"] then
				ChatFrameEditBox:Insert("|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r", channel, nil, chatnumber);
			else
				ChatFrameEditBox:Insert(AL["To craft "]..AtlasLoot_GetChatLink(GetSpellInfoVanillaDB["enchants"][tonumber(spellid)]["item"])..AL[" you need this: "].."|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r",channel,nil,chatnumber);
			end
		else
			if not GetSpellInfoVanillaDB["enchants"][tonumber(spellid)]["item"] then
				SendChatMessage("|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r", channel, nil, chatnumber);
			else
				SendChatMessage(AL["To craft "]..AtlasLoot_GetChatLink(GetSpellInfoVanillaDB["enchants"][tonumber(spellid)]["item"])..AL[" you need this: "].."|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r",channel,nil,chatnumber);
			end
		end
	else
		if safe then
			SendChatMessage("["..name.."]", channel, nil, chatnumber);
		else
			SendChatMessage("\124"..string.sub(color, 2).."\124Hitem:"..id..":0:0:0\124h["..name.."]\124h\124r", channel, nil, chatnumber);
		end
	end
end

function AtlasLoot_GetChatLink(id)
	local a, b, c = GetItemInfo(tonumber(id));
	local _, _, _, d = GetItemQualityColor(c);
	local e = string.sub(d, 2)
	return "\124"..e.."\124H"..b.."\124h["..a.."]\124h\124r"
end
