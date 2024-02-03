
AtlasLoot = AceLibrary("AceAddon-2.0"):new("AceDB-2.0")

local _G = getfenv()

--Instance required libraries
local L = AceLibrary("AceLocale-2.2"):new("AtlasLoot")
local BC = AceLibrary("Babble-Class-2.2")
local BZ = AceLibrary("Babble-Zone-2.2")
local BS = AceLibrary("Babble-Spell-2.2")
local BB = AceLibrary("Babble-Boss-2.2")
local BF = AceLibrary("Babble-Faction-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2")

ATLASLOOT_VERSION = GetAddOnMetadata("Atlas Turtle-WOW", "Version-AtlasLoot")
ATLASLOOT_VERSION_FULL = "|cffFF8400AtlasLoot TW Edition v"..ATLASLOOT_VERSION.."|r"

--Compatibility with old EquipCompare/EQCompare
ATLASLOOT_OPTIONS_EQUIPCOMPARE = L["Use EquipCompare"]
ATLASLOOT_OPTIONS_EQUIPCOMPARE_DISABLED = L["|cff9d9d9dUse EquipCompare|r"]

--Standard indent to line text up with Atlas text
ATLASLOOT_INDENT = "	"

--Make the Dewdrop menu in the standalone loot browser accessible here
AtlasLoot_Dewdrop = AceLibrary("Dewdrop-2.0")
AtlasLoot_DewdropSubMenu = AceLibrary("Dewdrop-2.0")

--Variable to cap debug spam
ATLASLOOT_DEBUGSHOWN = false

-- Colours stored for code readability
local GREY = "|cff999999"
local RED = "|cffff0000"
local WHITE = "|cffFFFFFF"
local GREEN = "|cff1eff00"
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd"
local ORANGE = "|cffFF8400"
local DEFAULT = "|cffFFd200"

--Establish number of boss lines in the Atlas frame for scrolling
local ATLAS_LOOT_BOSS_LINES = 24

--Flag so that error messages do not spam
local ATLASLOOT_POPUPSHOWN = false

--Set the default anchor for the loot frame to the Atlas frame
AtlasLoot_AnchorFrame = AtlasFrame

--Variables to hold hooked Atlas functions
Hooked_Atlas_Refresh = nil
Hooked_Atlas_OnShow = nil
Hooked_AtlasScrollBar_Update = nil

AtlasLootCharDB={}

AtlasLoot:RegisterDB("AtlasLootDB")

--Popup Box for first time users
StaticPopupDialogs["ATLASLOOT_SETUP"] = {
	text = "Welcome to Atlas TW Edition. Please take a moment to set your preferences.",
	button1 = L["Setup"],
	OnAccept = function()
		AtlasLootOptions_Toggle()
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1
}

AtlasLoot_Data["AtlasLootFallback"] = {
	EmptyInstance = {}
}

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
	LastBossText = BB["Taragaman the Hungerer"],
	AtlasLootVersion = ATLASLOOT_VERSION,
	AutoQuery = false,
	PartialMatching = true,
}

AtlasLoot_MenuList = {
	"PVPMENU",
	"ABRepMenu",
	"AVRepMenu",
	"WSGRepMenu",
	"BRRepMenu",
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
	"WORLDBLUES",
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
	"CRAFTSET2",
	"COOKINGMENU",
	"SURVIVALMENU",
}

--entrance maps to instance maps NOT NEEDED FOR ATLAS 1.12
local EntToInstMatches = {
	["BlackfathomDeepsEnt"] =		{"BlackfathomDeeps"},
	["BlackrockMountainEnt"] =		{"BlackrockSpireLower","BlackrockSpireUpper","BlackwingLair","BlackrockDepths","MoltenCore"},
	["GnomereganEnt"] =				{"Gnomeregan"},
	["MaraudonEnt"] =				{"Maraudon"},
	["TheDeadminesEnt"] =			{"TheDeadmines"},
	["TheSunkenTempleEnt"] =		{"TheSunkenTemple"},
	["UldamanEnt"] =				{"Uldaman"},
	["WailingCavernsEnt"] =			{"WailingCaverns"},
	["GilneasCityEnt"] =			{"GilneasCity"},
	["DireMaulEnt"] =				{"DireMaulEast","DireMaulNorth","DireMaulWest"},
	["SMEnt"] =						{"SMArmory","SMLibrary","SMCathedral","SMGraveyard"}
}

--instance maps to entrance maps
local InstToEntMatches = {
	["BlackfathomDeeps"] =			{"BlackfathomDeepsEnt"},
	["BlackrockSpireLower"] =		{"BlackrockMountainEnt"},
	["BlackrockSpireUpper"] =		{"BlackrockMountainEnt"},
	["BlackwingLair"] =				{"BlackrockMountainEnt"},
	["BlackrockDepths"] =			{"BlackrockMountainEnt"},
	["MoltenCore"] =				{"BlackrockMountainEnt"},
	["Gnomeregan"] =				{"GnomereganEnt"},
	["Maraudon"] =					{"MaraudonEnt"},
	["TheDeadmines"] =				{"TheDeadminesEnt"},
	["TheSunkenTemple"] =			{"TheSunkenTempleEnt"},
	["Uldaman"] =					{"UldamanEnt"},
	["WailingCaverns"] =			{"WailingCavernsEnt"},
	["GilneasCity"] =				{"GilneasCityEnt"},
	["DireMaulEast"] =				{"DireMaulEnt"},
	["DireMaulNorth"] =				{"DireMaulEnt"},
	["DireMaulWest"] =				{"DireMaulEnt"},
	["SMArmory"] =					{"SMEnt"},
	["SMLibrary"] =					{"SMEnt"},
	["SMCathedral"] =				{"SMEnt"},
	["SMGraveyard"] =				{"SMEnt"}
}

--[[
	AtlasLootDefaultFrame_OnShow:
	Called whenever the loot browser is shown and sets up buttons and loot tables
]]
function AtlasLootDefaultFrame_OnShow()
	--Definition of where I want the loot table to be shown	
	pFrame = { "TOPLEFT", "AtlasLootDefaultFrame_LootBackground", "TOPLEFT", "2", "-2" }
	--Having the Atlas and loot browser frames shown at the same time would
	--cause conflicts, so I hide the Atlas frame when the loot browser appears
	if AtlasFrame then
		AtlasFrame:Hide()
	end
	--Remove the selection of a loot table in Atlas
	AtlasLootItemsFrame.activeBoss = nil
	--Set the item table to the loot table
	AtlasLoot_SetItemInfoFrame(pFrame)
	--Show the last displayed loot table
	if AtlasLoot_IsLootTableAvailable(AtlasLootCharDB.LastBoss) then
		AtlasLoot_ShowBossLoot(AtlasLootCharDB.LastBoss, AtlasLootCharDB.LastBossText, pFrame)
	else
		AtlasLoot_ShowBossLoot("EmptyInstance", "AtlasLoot", pFrame)
	end
end

--[[
	AtlasLoot_OnEvent(event):
	event - Name of the event, passed from the API
	Invoked whenever a relevant event is detected by the engine. The function then
	decides what action to take depending on the event.
]]
function AtlasLoot_OnEvent(event)
	--Addons all loaded
	if event == "VARIABLES_LOADED" then
		AtlasLoot_OnVariablesLoaded()
		--Taint errors
	elseif arg1 == "AtlasLoot" then
		--Junk command to suppress taint message
		local i=3
	end
end

--[[
	AtlasLoot_OnVariablesLoaded:
	Invoked by the VARIABLES_LOADED event. Now that we are sure all the assets
	the addon needs are in place, we can properly set up the mod
]]
function AtlasLoot_OnVariablesLoaded()
	if not AtlasLootCharDB then AtlasLootCharDB = {} end
	if not AtlasLootCharDB["WishList"] then AtlasLootCharDB["WishList"] = {} end
	if not AtlasLootCharDB["QuickLooks"] then AtlasLootCharDB["QuickLooks"] = {} end
	if not AtlasLootCharDB["SearchResult"] then AtlasLootCharDB["SearchResult"] = {} end
	--Add the loot browser to the special frames tables to enable closing wih the ESC key
	tinsert(UISpecialFrames, "AtlasLootDefaultFrame")
	--Set up options frame
	AtlasLootOptions_OnLoad()
	--Legacy code for those using the ultimately failed attempt at making Atlas load on demand
	if AtlasButton_LoadAtlas then
		AtlasButton_LoadAtlas()
	end
	--Hook the necessary Atlas functions
	Hooked_Atlas_Refresh = Atlas_Refresh
	Atlas_Refresh = AtlasLoot_Refresh
	Hooked_Atlas_OnShow = Atlas_OnShow
	Atlas_OnShow = AtlasLoot_Atlas_OnShow
	--Instead of hooking, replace the scrollbar driver function
	Hooked_AtlasScrollBar_Update = AtlasScrollBar_Update
	AtlasScrollBar_Update = AtlasLoot_AtlasScrollBar_Update
	--Disable options that don't have the supporting mods
	if not LootLink_SetTooltip and AtlasLootCharDB.LootlinkTT == true then
		AtlasLootCharDB.LootlinkTT = false
		AtlasLootCharDB.DefaultTT = true
	end
	if not ItemSync and not ISync and AtlasLootCharDB.ItemSyncTT == true then
		AtlasLootCharDB.ItemSyncTT = false
		AtlasLootCharDB.DefaultTT = true
	end
	if not IsAddOnLoaded("EQCompare") and not IsAddOnLoaded("EquipCompare") and AtlasLootCharDB.EquipCompare == true then
		AtlasLootCharDB.EquipCompare = false
	end
	--If using an opaque items frame, change the alpha value of the backing texture
	if AtlasLootCharDB.Opaque then
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 1)
	else
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65)
	end
	--If Atlas is installed, set up for Atlas
	if Hooked_Atlas_Refresh then
		AtlasLoot_SetupForAtlas()
		--If a first time user, set up options
		if AtlasLootCharDB.FirstTime == nil or AtlasLootCharDB.FirstTime == true then
			StaticPopup_Show ("ATLASLOOT_SETUP")
			AtlasLootCharDB.FirstTime = false
		end
		--If an older version
		if AtlasLootCharDB.FirstTime == nil and tonumber(AtlasLootCharDB.AtlasLootVersion) < 40500 then
			AtlasLootCharDB.SafeLinks = true
			AtlasLootCharDB.AllLinks = false
			AtlasLootCharDB.AtlasLootVersion = ATLASLOOT_VERSION
			StaticPopup_Show ("ATLASLOOT_SETUP")
			AtlasLootCharDB.FirstTime = false
		end
		Hooked_Atlas_Refresh()
	else
		--If we are not using Atlas, keep the items frame out of the way
		AtlasLootItemsFrame:Hide()
	end
	--Set up the menu in the loot browser
	AtlasLoot_DewdropRegister()
	--Enable or disable AtlasLootFu based on seleced options
	--If EquipCompare is available, use it
	if (IsAddOnLoaded("EquipCompare") or IsAddOnLoaded("EQCompare")) and AtlasLootCharDB.EquipCompare == true then
		EquipCompare_RegisterTooltip(AtlasLootTooltip)
		EquipCompare_RegisterTooltip(AtlasLootTooltip2)
	end
	--Position relevant UI objects for loot browser and set up menu
	AtlasLootDefaultFrame_SelectedCategory:SetPoint("TOP", "AtlasLootDefaultFrame_Menu", "BOTTOM", 0, -4)
	AtlasLootDefaultFrame_SelectedTable:SetPoint("TOP", "AtlasLootDefaultFrame_SubMenu", "BOTTOM", 0, -4)
	AtlasLootDefaultFrame_SelectedCategory:SetText(L["Choose Table ..."])
	AtlasLootDefaultFrame_SelectedTable:SetText("")
	AtlasLootDefaultFrame_SelectedCategory:Show()
	AtlasLootDefaultFrame_SelectedTable:Show()
	AtlasLootDefaultFrame_SubMenu:Disable()
end

--[[
	AtlasLootOptions_OnLoad:
	Function is loaded when the addon is loaded
]]
function AtlasLootOptions_OnLoad()
	--Disable checkboxes of missing addons
	if not LootLink_SetTooltip then
		AtlasLootOptionsFrameLootlinkTT:Disable()
		AtlasLootOptionsFrameLootlinkTTText:SetText(L["|cff9d9d9dLootlink Tooltips|r"])
	end
	if not ItemSync and not ISync then
		AtlasLootOptionsFrameItemSyncTT:Disable()
		AtlasLootOptionsFrameItemSyncTTText:SetText(L["|cff9d9d9dItemSync Tooltips|r"])
	end
	if not IsAddOnLoaded("EQCompare") and not IsAddOnLoaded("EquipCompare") then
		AtlasLootOptionsFrameEquipCompare:Disable()
		AtlasLootOptionsFrameEquipCompareText:SetText(L["|cff9d9d9dUse EquipCompare|r"])
	end
	AtlasLootOptions_Init()
	UIPanelWindows['AtlasLootOptionsFrame'] = {area = 'center', pushable = 0}
end

--[[
	AtlasLootOptions_Init:
	Initiates the options.
]]
function AtlasLootOptions_Init()
	--clear saved vars for a new version (or a new install!)
	if AtlasLootCharDB.FirstTime == nil then
		AtlasLootOptions_Fresh()
	end
	--Initialise all the check boxes on the options frame
	AtlasLootOptionsFrameSafeLinks:SetChecked(AtlasLootCharDB.SafeLinks)
	AtlasLootOptionsFrameAllLinks:SetChecked(AtlasLootCharDB.AllLinks)
	AtlasLootOptionsFrameDefaultTT:SetChecked(AtlasLootCharDB.DefaultTT)
	AtlasLootOptionsFrameLootlinkTT:SetChecked(AtlasLootCharDB.LootlinkTT)
	AtlasLootOptionsFrameItemSyncTT:SetChecked(AtlasLootCharDB.ItemSyncTT)
	AtlasLootOptionsFrameEquipCompare:SetChecked(AtlasLootCharDB.EquipCompare)
	AtlasLootOptionsFrameOpaque:SetChecked(AtlasLootCharDB.Opaque)
	AtlasLootOptionsFrameItemID:SetChecked(AtlasLootCharDB.ItemIDs)
	AtlasLootOptionsFrameItemSpam:SetChecked(AtlasLootCharDB.ItemSpam)
	AtlasLootOptionsFrameHidePanel:SetChecked(AtlasLootCharDB.HidePanel)
	AtlasLootOptionsFrameMinimap:SetChecked(AtlasLootCharDB.MinimapButton)
	AtlasLootOptionsFrameSliderButtonPos:SetValue(AtlasLootCharDB.MinimapButtonPosition)
	AtlasLootOptionsFrameSliderButtonRad:SetValue(AtlasLootCharDB.MinimapButtonRadius)
	AtlasLootMinimapButtonFrame:SetPoint(
		"TOPLEFT",
		"Minimap",
		"TOPLEFT",
		54 - (AtlasLootCharDB.MinimapButtonRadius * cos(AtlasLootCharDB.MinimapButtonPosition)),
		(AtlasLootCharDB.MinimapButtonRadius * sin(AtlasLootCharDB.MinimapButtonPosition)) - 55
	)
end

--[[
	Atlas_FreshOptions:
	Sets default options on a fresh start.
]]
function AtlasLootOptions_Fresh()
	AtlasLootCharDB.SafeLinks = false
	AtlasLootCharDB.AllLinks = true
	AtlasLootCharDB.DefaultTT = true
	AtlasLootCharDB.LootlinkTT = false
	AtlasLootCharDB.ItemSyncTT = false
	AtlasLootCharDB.EquipCompare = false
	AtlasLootCharDB.Opaque = false
	AtlasLootCharDB.ItemIDs = false
	AtlasLootCharDB.FirstTime = true
	AtlasLootCharDB.ItemSpam = true
	AtlasLootCharDB.MinimapButton = true
	AtlasLootCharDB.MinimapButtonPosition = 315
	AtlasLootCharDB.MinimapButtonRadius = 78
	AtlasLootCharDB.HidePanel = false
	AtlasLootCharDB.LastBoss = "RFCTaragaman"
	AtlasLootCharDB.LastBossText = BB["Taragaman the Hungerer"]
	AtlasLootCharDB.AtlasLootVersion = ATLASLOOT_VERSION
	AtlasLootCharDB.AutoQuery = false
	AtlasLootCharDB.PartialMatching = true
end

--[[
	AtlasLoot_OnLoad:
	Performs inital setup of the mod and registers it for further setup when
	the required resources are in place
]]
function AtlasLoot_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED")
	this:RegisterEvent("ADDON_ACTION_FORBIDDEN")
	this:RegisterEvent("ADDON_ACTION_BLOCKED")
	--Enable the use of /al or /atlasloot to open the loot browser
	SLASH_ATLASLOOT1 = "/atlasloot"
	SLASH_ATLASLOOT2 = "/al"
	SlashCmdList["ATLASLOOT"] = AtlasLoot_SlashCommand
end

--[[
	AtlasLoot_SlashCommand(msg):
	msg - takes the argument for the /atlasloot command so that the appropriate action can be performed
	If someone types /atlasloot, bring up the options box
]]
function AtlasLoot_SlashCommand(msg)
	if msg == "reset" then
		AtlasLootOptions_ResetPosition()
	elseif msg == "default" then
		AtlasLootOptions_DefaultSettings()
	elseif msg == "options" then
		AtlasLootOptions_Toggle()
	else
		AtlasLootDefaultFrame:Show()
	end
end

--[[
	AtlasLootDefaultFrame_OnHide:
	When we close the loot browser, re-bind the item table to Atlas
	and close all Dewdrop menus
]]
function AtlasLootDefaultFrame_OnHide()
	if AtlasFrame then
		AtlasLoot_SetupForAtlas()
	end
	AtlasLoot_Dewdrop:Close(1)
	AtlasLoot_DewdropSubMenu:Close(1)
end

--[[
	AtlasLoot_SetupForAtlas:
	This function sets up the Atlas specific XML objects
]]
function AtlasLoot_SetupForAtlas()
	--Poisition the frame with the AtlasLoot version details in the Atlas frame
	AtlasLootInfo:ClearAllPoints()
	AtlasLootInfo:SetParent(AtlasFrame)
	AtlasLootInfo:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 546, -3)
	--Anchor the bottom panel to the Atlas frame
	AtlasLootPanel:ClearAllPoints()
	AtlasLootPanel:SetParent(AtlasFrame)
	AtlasLootPanel:SetPoint("TOP", "AtlasFrame", "BOTTOM", 0, 4)
	--Anchor the loot table to the Atlas frame
	AtlasLoot_SetItemInfoFrame()
	AtlasLootItemsFrame:Hide()
	AtlasLoot_AnchorFrame = AtlasFrame
end

--[[
	AtlasLoot_SetItemInfoFrame(pFrame):
	pFrame - Data structure with anchor info. Format: {Anchor Point, Relative Frame, Relative Point, X Offset, Y Offset }
	This function anchors the item frame where appropriate. The main Atlas frame can be passed instead of a custom pFrame.
	If no pFrame is specified, the Atlas Frame is used if Atlas is installed.
]]
function AtlasLoot_SetItemInfoFrame(pFrame)
	if pFrame then
		--If a pFrame is specified, use it
		if pFrame==AtlasFrame and AtlasFrame then
			AtlasLootItemsFrame:ClearAllPoints()
			AtlasLootItemsFrame:SetParent(AtlasFrame)
			AtlasLootItemsFrame:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 18, -84)
		else
			AtlasLootItemsFrame:ClearAllPoints()
			AtlasLootItemsFrame:SetParent(pFrame[2])
			AtlasLootItemsFrame:ClearAllPoints()
			AtlasLootItemsFrame:SetPoint(pFrame[1], pFrame[2], pFrame[3], pFrame[4], pFrame[5])
		end
	elseif AtlasFrame then
		--If no pFrame is specified and Atlas is installed, anchor in Atlas
		AtlasLootItemsFrame:ClearAllPoints()
		AtlasLootItemsFrame:SetParent(AtlasFrame)
		AtlasLootItemsFrame:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 18, -84)
	else
		--Last resort, dump the items frame in the middle of the screen
		AtlasLootItemsFrame:ClearAllPoints()
		AtlasLootItemsFrame:SetParent(UIParent)
		AtlasLootItemsFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
	end
	AtlasLootItemsFrame:Show()
end

--[[
	AtlasLoot_AtlasScrollBar_Update:
	Hooks the Atlas scroll frame. 
	Required as the Atlas function cannot deal with the AtlasLoot button template or the added Atlasloot entries
]]
function AtlasLoot_AtlasScrollBar_Update()
	local line, lineplusoffset
	if _G["AtlasBossLine1_Text"] ~= nil then
		local zoneID = ATLAS_DROPDOWNS[AtlasOptions.AtlasType][AtlasOptions.AtlasZone]
		--Update the contents of the Atlas scroll frame
		FauxScrollFrame_Update(AtlasScrollBar,ATLAS_CUR_LINES,ATLAS_LOOT_BOSS_LINES,15)
		--Make note of how far in the scroll frame we are
		for line=1,ATLAS_NUM_LINES do
			lineplusoffset = line + FauxScrollFrame_GetOffset(AtlasScrollBar)
			if lineplusoffset <= ATLAS_CUR_LINES then
				_G["AtlasBossLine"..line.."_Text"]:SetText(ATLAS_SCROLL_LIST[lineplusoffset])
				if AtlasLootItemsFrame.activeBoss == lineplusoffset then
					_G["AtlasBossLine"..line]:Enable()
					_G["AtlasBossLine"..line.."_Loot"]:Hide()
					_G["AtlasBossLine"..line.."_Selected"]:Show()
				elseif AtlasLootBossButtons[zoneID]~=nil and AtlasLootBossButtons[zoneID][lineplusoffset] ~= nil and AtlasLootBossButtons[zoneID][lineplusoffset] ~= "" then
					_G["AtlasBossLine"..line]:Enable()
					_G["AtlasBossLine"..line.."_Loot"]:Show()
					_G["AtlasBossLine"..line.."_Selected"]:Hide()
				elseif AtlasLootWBBossButtons[zoneID]~=nil and AtlasLootWBBossButtons[zoneID][lineplusoffset] ~= nil and AtlasLootWBBossButtons[zoneID][lineplusoffset] ~= "" then
					_G["AtlasBossLine"..line]:Enable()
					_G["AtlasBossLine"..line.."_Loot"]:Show()
					_G["AtlasBossLine"..line.."_Selected"]:Hide()
				elseif AtlasLootRareMobsButtons[zoneID]~=nil and AtlasLootRareMobsButtons[zoneID][lineplusoffset] ~= nil and AtlasLootRareMobsButtons[zoneID][lineplusoffset] ~= "" then
					_G["AtlasBossLine"..line]:Enable()
					_G["AtlasBossLine"..line.."_Loot"]:Show()
					_G["AtlasBossLine"..line.."_Selected"]:Hide()
				elseif AtlasLootBattlegrounds[zoneID]~=nil and AtlasLootBattlegrounds[zoneID][lineplusoffset] ~= nil and AtlasLootBattlegrounds[zoneID][lineplusoffset] ~= "" then
					_G["AtlasBossLine"..line]:Enable()
					_G["AtlasBossLine"..line.."_Loot"]:Show()
					_G["AtlasBossLine"..line.."_Selected"]:Hide()
				else
					_G["AtlasBossLine"..line]:Disable()
					_G["AtlasBossLine"..line.."_Loot"]:Hide()
					_G["AtlasBossLine"..line.."_Selected"]:Hide()
				end
				_G["AtlasBossLine"..line].idnum = lineplusoffset
				_G["AtlasBossLine"..line]:Show()
			elseif _G["AtlasBossLine"..line] then
				--Hide lines that are not needed
				_G["AtlasBossLine"..line]:Hide()
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
	AtlasLootItemsFrame.activeBoss = nil
	--Get map selection info from Atlas
	local zoneID = ATLAS_DROPDOWNS[AtlasOptions.AtlasType][AtlasOptions.AtlasZone]
	local data = AtlasMaps
	local base = {}
	--Get boss name information
	for k,v in pairs(data[zoneID]) do
		base[k] = v
	end
	--Display the newly selected texture
	AtlasMap:ClearAllPoints()
	AtlasMap:SetWidth(512)
	AtlasMap:SetHeight(512)
	AtlasMap:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 18, -84)
	local builtIn = AtlasMap:SetTexture("Interface\\AddOns\\Atlas Turtle-WOW\\Images\\Maps\\"..zoneID)
	--If texture was not found in the core Atlas mod, check plugins
	if not builtIn then
		for k,v in pairs(ATLAS_PLUGINS) do
			if AtlasMap:SetTexture("Interface\\AddOns\\"..v.."\\Images\\"..zoneID) then
				break
			end
		end
	end
	--Setup info panel above boss listing
	local tName = base.ZoneName[1]
	if AtlasOptions.AtlasAcronyms and base.Acronym ~= nil then
		local _RED = "|cffcc6666"
		tName = tName.._RED.." ["..base.Acronym.."]"
	end
	AtlasText_ZoneName_Text:SetText(tName)
	local tLoc = ""
	local tLR = ""
	local tHP = ""
	local tMP = ""
	local tML = ""
	local tPL = ""
	if base.Location[1] then
		tLoc = ATLAS_STRING_LOCATION..": "..base.Location[1]
	end
	if base.LevelRange then
		tLR = ATLAS_STRING_LEVELRANGE..": "..base.LevelRange
	end
	if base.Health then
		tHP = ATLAS_STRING_HEALTH..": "..base.Health
	end
	if base.Mana then
		tMP = ATLAS_STRING_MANA..": "..base.Mana
	end
	if base.MinLevel then
		tML = ATLAS_STRING_MINLEVEL..": "..base.MinLevel
	end
	if base.PlayerLimit then
		tPL = ATLAS_STRING_PLAYERLIMIT..": "..base.PlayerLimit
	end
	AtlasText_Location_Text:SetText(tLoc)
	AtlasText_LevelRange_Text:SetText(tLR)
	AtlasText_Health_Text:SetText(tHP)
	AtlasText_Mana_Text:SetText(tMP)
	AtlasText_MinLevel_Text:SetText(tML)
	AtlasText_PlayerLimit_Text:SetText(tPL)
	Atlastextbase = base
	--Get the size of the Atlas text to append stuff to the bottom. Looks for empty lines
	local i = 1
	local j = 2
	while (Atlastextbase[i] ~= nil and Atlastextbase[i]~="") or (Atlastextbase[j] ~= nil and Atlastextbase[j]~="") do
		i = i + 1
		j = i + 1
	end
	--Hide any Atlas objects lurking around that have now been replaced
	for i=1,ATLAS_CUR_LINES do
		if _G["AtlasEntry"..i] then
			_G["AtlasEntry"..i]:Hide()
		end
	end
	ATLAS_DATA = Atlastextbase
	ATLAS_SEARCH_METHOD = data.Search
	--Deal with Atlas's search function
	if data.Search == nil then
		ATLAS_SEARCH_METHOD = AtlasSimpleSearch
	end
	if data.Search ~= false then
		AtlasSearchEditBox:Show()
		AtlasNoSearch:Hide()
	else
		AtlasSearchEditBox:Hide()
		AtlasNoSearch:Show()
		ATLAS_SEARCH_METHOD = nil
	end
	--populate the scroll frame entries list, the update func will do the rest
	Atlas_Search("")
	AtlasSearchEditBox:SetText("")
	AtlasSearchEditBox:ClearFocus()
	--create and align any new entry buttons that we need
	for i=1,ATLAS_CUR_LINES do
		local f
		if not _G["AtlasBossLine"..i] then
			f = CreateFrame("Button", "AtlasBossLine"..i, AtlasFrame, "AtlasLootNewBossLineTemplate")
			f:SetFrameStrata("MEDIUM")
			if i==1 then
				f:SetPoint("TOPLEFT", "AtlasScrollBar", "TOPLEFT", 16, -3)
			else
				f:SetPoint("TOPLEFT", "AtlasBossLine"..(i-1), "BOTTOMLEFT")
			end
		else
			_G["AtlasBossLine"..i.."_Loot"]:Hide()
			_G["AtlasBossLine"..i.."_Selected"]:Hide()
		end
	end
	--Hide the loot frame now that a pristine Atlas instance is created
	AtlasLootItemsFrame:Hide()
	Atlas_Search("")
	--Make sure the scroll bar is correctly offset
	AtlasLoot_AtlasScrollBar_Update()
	--see if we should display the entrance/instance button or not, and decide what it should say
	local matchFound = {nil}
	local sayEntrance = nil
	for k,v in pairs(Atlas_EntToInstMatches) do
		if k == zoneID then
			matchFound = v
			sayEntrance = false
		end
	end
	if not matchFound[1] then
		for k,v in pairs(Atlas_InstToEntMatches) do
			if k == zoneID then
				matchFound = v
				sayEntrance = true
			end
		end
	end
	--set the button's text, populate the dropdown menu, and show or hide the button
	if matchFound[1] ~= nil then
		ATLAS_INST_ENT_DROPDOWN = {}
		for k,v in pairs(matchFound) do
			table.insert(ATLAS_INST_ENT_DROPDOWN, v)
		end
		table.sort(ATLAS_INST_ENT_DROPDOWN, AtlasSwitchDD_Sort)
		if sayEntrance then
			AtlasSwitchButton:SetText(ATLAS_ENTRANCE_BUTTON)
		else
			AtlasSwitchButton:SetText(ATLAS_INSTANCE_BUTTON)
		end
		AtlasSwitchButton:Show()
		UIDropDownMenu_Initialize(AtlasSwitchDD, AtlasSwitchDD_OnLoad)
	else
		AtlasSwitchButton:Hide()
	end
	if TitanPanelButton_UpdateButton then
		TitanPanelButton_UpdateButton("Atlas")
	end
end

--[[
	AtlasLoot_Atlas_OnShow:
	Hooks Atlas_OnShow() to add extra setup routines that AtlasLoot needs for
	integration purposes.
]]
function AtlasLoot_Atlas_OnShow()
	Atlas_Refresh()
	--We don't want Atlas and the Loot Browser open at the same time, so the Loot Browser is close
	if AtlasLootDefaultFrame then
		AtlasLootDefaultFrame:Hide()
		AtlasLoot_SetupForAtlas()
	end
	--Call the Atlas function
	Hooked_Atlas_OnShow()
	--If we were looking at a loot table earlier in the session, it is still
	--saved on the item frame, so restore it in Atlas
	if AtlasLootItemsFrame.activeBoss ~= nil then
		AtlasLootItemsFrame:Show()
	else
		--If no loot table is selected, set up icons next to boss names
		for i=1,ATLAS_CUR_LINES do
			if _G["AtlasEntry"..i.."_Selected"] and _G["AtlasEntry"..i.."_Selected"]:IsVisible() then
				_G["AtlasEntry"..i.."_Loot"]:Show()
				_G["AtlasEntry"..i.."_Selected"]:Hide()
			end
		end
	end
	--Consult the saved variable table to see whether to show the bottom panel
	if AtlasLootCharDB.HidePanel == true then
		AtlasLootPanel:Hide()
	else
		AtlasLootPanel:Show()
	end 
	pFrame = AtlasFrame
end

--[[
	AtlasLoot_Toggle:
	Simple function to toggle the visibility of the AtlasLoot frame.
]]
function AtlasLoot_Toggle()
	if AtlasLootDefaultFrame:IsVisible() then
		HideUIPanel(AtlasLootDefaultFrame)
	else
		ShowUIPanel(AtlasLootDefaultFrame)
	end
end

--[[
	AtlasLootBoss_OnClick:
	Invoked whenever a boss line in Atlas is clicked
	Shows a loot page if one is associated with the button
]]
function AtlasLootBoss_OnClick(name)
	local zoneID = ATLAS_DROPDOWNS[AtlasOptions.AtlasType][AtlasOptions.AtlasZone]
	local id = this.idnum
	--If the loot table was already shown and boss clicked again, hide the loot table and fix boss list icons
	if _G[name.."_Selected"]:IsVisible() then
		_G[name.."_Selected"]:Hide()
		_G[name.."_Loot"]:Show()
		AtlasLootItemsFrame:Hide()
		AtlasLootItemsFrame.activeBoss = nil
	else	
		--If an loot table is associated with the button, show it. Note multiple tables need to be checked due to the database structure
		if AtlasLootBossButtons[zoneID] ~= nil and AtlasLootBossButtons[zoneID][id] ~= nil and AtlasLootBossButtons[zoneID][id] ~= "" then
			if AtlasLoot_IsLootTableAvailable(AtlasLootBossButtons[zoneID][id]) then
				_G[name.."_Selected"]:Show()
				_G[name.."_Loot"]:Hide()
				local _,_,boss = string.find(_G[name.."_Text"]:GetText(), "|c%x%x%x%x%x%x%x%x%s*[%dX']*[%) ]*(.*[^%,])[%,]?$")
				AtlasLoot_ShowBossLoot(AtlasLootBossButtons[zoneID][id], boss, AtlasFrame)
				AtlasLootItemsFrame.activeBoss = id
				AtlasLoot_AtlasScrollBar_Update()
			end
		elseif AtlasLootRareMobsButtons[zoneID] ~= nil and AtlasLootRareMobsButtons[zoneID][id] ~= nil and AtlasLootRareMobsButtons[zoneID][id] ~= "" then
			if AtlasLoot_IsLootTableAvailable(AtlasLootRareMobsButtons[zoneID][id]) then
				_G[name.."_Selected"]:Show()
				_G[name.."_Loot"]:Hide()
				local _,_,boss = string.find(_G[name.."_Text"]:GetText(), "|c%x%x%x%x%x%x%x%x%s*[%dX]*[%) ]*(.*[^%,])[%,]?$")
				AtlasLoot_ShowBossLoot(AtlasLootRareMobsButtons[zoneID][id], boss, AtlasFrame)
				AtlasLootItemsFrame.activeBoss = id
				AtlasLoot_AtlasScrollBar_Update()
			end
		elseif AtlasLootWBBossButtons[zoneID] ~= nil and AtlasLootWBBossButtons[zoneID][id] ~= nil and AtlasLootWBBossButtons[zoneID][id] ~= "" then
			if AtlasLoot_IsLootTableAvailable(AtlasLootWBBossButtons[zoneID][id]) then
				_G[name.."_Selected"]:Show()
				_G[name.."_Loot"]:Hide()
				local _,_,boss = string.find(_G[name.."_Text"]:GetText(), "|c%x%x%x%x%x%x%x%x%s*[%dX]*[%) ]*(.*[^%,])[%,]?$")
				AtlasLoot_ShowBossLoot(AtlasLootWBBossButtons[zoneID][id], boss, AtlasFrame)
				AtlasLootItemsFrame.activeBoss = id
				AtlasLoot_AtlasScrollBar_Update()
			end
		elseif AtlasLootBattlegrounds[zoneID] ~= nil and AtlasLootBattlegrounds[zoneID][id] ~= nil and AtlasLootBattlegrounds[zoneID][id] ~= "" then
			if AtlasLoot_IsLootTableAvailable(AtlasLootBattlegrounds[zoneID][id]) then
				_G[name.."_Selected"]:Show()
				_G[name.."_Loot"]:Hide()
				local _,_,boss = string.find(_G[name.."_Text"]:GetText(), "|c%x%x%x%x%x%x%x%x%s*[%wX]*[%) ]*(.*[^%,])[%,]?$")
				AtlasLoot_ShowBossLoot(AtlasLootBattlegrounds[zoneID][id], boss, AtlasFrame)
				AtlasLootItemsFrame.activeBoss = id
				AtlasLoot_AtlasScrollBar_Update()
			end
		end
	end
	--This has been invoked from Atlas, so we remove any claim external mods have on the loot table
	AtlasLootItemsFrame.externalBoss = nil
	--Hide the AtlasQuest frame if present so that the AtlasLoot items frame is not stuck under it
	if AtlasQuestInsideFrame then
		HideUIPanel(AtlasQuestInsideFrame)
	end
end

--[[
	AtlasLoot_ShowMenu:
	Legacy function used in Cosmos integration to open the loot browser
]]
function AtlasLoot_ShowMenu()
	AtlasLootDefaultFrame:Show()
end

--[[
	AtlasLootOptions_SafeLinksToggle:
	Toggles SafeLinks. Items uncached will be linked as their names.
]]
function AtlasLootOptions_SafeLinksToggle()
	if AtlasLootCharDB.SafeLinks then
		AtlasLootCharDB.SafeLinks = false
	else
		AtlasLootCharDB.SafeLinks = true
		AtlasLootCharDB.AllLinks = false
	end
	AtlasLootOptions_Init()
end

--[[
	AtlasLootOptions_AllLinksToggle:
	Toggles AllLinks. All items will be linked.
]]
function AtlasLootOptions_AllLinksToggle()
	if AtlasLootCharDB.AllLinks then
		AtlasLootCharDB.AllLinks = false
	else
		AtlasLootCharDB.AllLinks = true
		AtlasLootCharDB.SafeLinks = false
	end
	AtlasLootOptions_Init()
end

--[[
	AtlasLootOptions_DefaultTTToggle:
	Toggles DefaultTooltips. Uses default tooltips.
]]
function AtlasLootOptions_DefaultTTToggle()
	AtlasLootCharDB.DefaultTT = true
	AtlasLootCharDB.LootlinkTT = false
	AtlasLootCharDB.ItemSyncTT = false
	AtlasLootOptions_Init()
end

--[[
	AtlasLootOptions_LootlinkTTToggle:
	Toggles Lootlink tooltips instead of the default ones.
]]
function AtlasLootOptions_LootlinkTTToggle()
	AtlasLootCharDB.DefaultTT = false
	AtlasLootCharDB.LootlinkTT = true
	AtlasLootCharDB.ItemSyncTT = false
	AtlasLootOptions_Init()
end

--[[
	AtlasLootOptions_ItemSyncTTToggle:
	Toggles ItemSync tooltips instead of the default ones.
]]
function AtlasLootOptions_ItemSyncTTToggle()
	AtlasLootCharDB.DefaultTT = false
	AtlasLootCharDB.LootlinkTT = false
	AtlasLootCharDB.ItemSyncTT = true
	AtlasLootOptions_Init()
end

--[[
	AtlasLootOptions_EquipCompareToggle:
	Toggles EquipCompare. Adds a tooltip with the equipped item (if it's the case) next to the default one.
]]
function AtlasLootOptions_EquipCompareToggle()
	if AtlasLootCharDB.EquipCompare then
		AtlasLootCharDB.EquipCompare = false
		if IsAddOnLoaded("EquipCompare") or IsAddOnLoaded("EQCompare") then
			EquipCompare_UnregisterTooltip(AtlasLootTooltip)
			EquipCompare_UnregisterTooltip(AtlasLootTooltip2)
		end
	else
		AtlasLootCharDB.EquipCompare = true
		if IsAddOnLoaded("EquipCompare") or IsAddOnLoaded("EQCompare") then
			EquipCompare_RegisterTooltip(AtlasLootTooltip)
			EquipCompare_RegisterTooltip(AtlasLootTooltip2)
		end
	end
	AtlasLootOptions_Init()
end

--[[
	AtlasLootOptions_OpaqueToggle:
	Toggles opacity of the items frame.
]]
function AtlasLootOptions_OpaqueToggle()
	AtlasLootCharDB.Opaque=AtlasLootOptionsFrameOpaque:GetChecked()
	if AtlasLootCharDB.Opaque then
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 1)
	else
		AtlasLootItemsFrame_Back:SetTexture(0, 0, 0, 0.65)
	end
	AtlasLootOptions_Init()
end

--[[
	AtlasLootOptions_ItemIDToggle:
	Toggles items ID.
]]
function AtlasLootOptions_ItemIDToggle()
	if AtlasLootCharDB.ItemIDs then
		AtlasLootCharDB.ItemIDs = false
	else
		AtlasLootCharDB.ItemIDs = true
	end
	AtlasLootOptions_Init()
end

--[[
	AtlasLootOptions_ItemSpam:
	Toggles item query spam.
]]
function AtlasLootOptions_ItemSpam()
	if AtlasLootCharDB.ItemSpam then
		AtlasLootCharDB.ItemSpam = false
	else
		AtlasLootCharDB.ItemSpam = true
	end
	AtlasLootOptions_Init()
end

--[[
	AtlasLootOptions_Toggle:
	Toggle on/off the options window
]]
function AtlasLootOptions_Toggle()
	if AtlasLootOptionsFrame:IsVisible() then
		--Hide the options frame if already shown
		AtlasLootOptionsFrame:Hide()
	else
		AtlasLootOptionsFrame:Show()
		--Workaround for a weird quirk where tooltip settings so not immediately take effect
		if AtlasLootCharDB.DefaultTT == true then
			AtlasLootOptions_DefaultTTToggle()
		elseif AtlasLootCharDB.LootlinkTT == true then
			AtlasLootOptions_LootlinkTTToggle()
		elseif AtlasLootCharDB.ItemSyncTT == true then
			AtlasLootOptions_ItemSyncTTToggle()
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
	local itemName, itemLink, itemQuality, itemLevel, itemType, itemSubType, itemCount, itemEquipLoc, itemTexture, itemColor
	local iconFrame, nameFrame, extraFrame, itemButton
	local text, extra
	local wlPage, wlPageMax = 1, 1
	local isItem, isEnchant, isSpell
	local spellName, spellIcon
	if dataID == "SearchResult" and dataID == "WishList" then
		AtlasLoot_IsLootTableAvailable(dataID)
	end
	--If the data source has not been passed, throw up a debugging statement
	if dataSource == nil then
		DEFAULT_CHAT_FRAME:AddMessage("No dataSource!")
	end
	--If the loot table name has not been passed, throw up a debugging statement
	if dataID == nil then
		DEFAULT_CHAT_FRAME:AddMessage("No dataID!")
	end
	dataSource_backup = dataSource
	if dataSource ~= "dummy" then
		if dataID == "SearchResult" or dataID == "WishList" then
			dataSource = {}
			--Match the page number to display
			wlPage = tonumber(string.sub(dataSource_backup, string.find(dataSource_backup, "%d"), string.len(dataSource_backup)))
			--Aquiring items of the page
			if dataID == "SearchResult" then
				dataSource[dataID], wlPageMax = AtlasLoot:GetSearchResultPage(wlPage)
			elseif dataID == "WishList" then
				dataSource[dataID], wlPageMax = AtlasLoot_GetWishListPage(wlPage)
			end
			--Make page number reasonable
			if wlPage < 1 then wlPage = 1 end
			if wlPage > wlPageMax then wlPage = wlPageMax end
		else
			dataSource = AtlasLoot_Data[dataSource_backup]
		end
	end
	--Get AtlasQuest out of the way
	if AtlasQuestInsideFrame then
		HideUIPanel(AtlasQuestInsideFrame)
	end
	--Ditch the Quicklook selector
	AtlasLoot_QuickLooks:Hide()
	AtlasLootQuickLooksButton:Hide()
	AtlasLootServerQueryButton:Hide()
	--Hide the menu objects. These are not required for a loot table
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
	end
	--Escape out of this function if creating a menu, this function only handles loot tables.
	--Inserting escapes in this way allows consistant calling of data whether it is a loot table or a menu.
	if dataID=="PRE60SET" then
		AtlasLootPRE60SetMenu()
	elseif dataID=="ZGSET" then
		AtlasLootZGSetMenu()
	elseif dataID=="AQ40SET" then
		AtlasLootAQ40SetMenu()
	elseif dataID=="AQ20SET" then
		AtlasLootAQ20SetMenu()
	elseif dataID=="T3SET" then
		AtlasLootT3SetMenu()
	elseif dataID=="T2SET" then
		AtlasLootT2SetMenu()
	elseif dataID=="T1SET" then
		AtlasLootT1SetMenu()
	elseif dataID=="T0SET" then
		AtlasLootT0SetMenu()
	elseif dataID=="PVPMENU" then
		AtlasLootPvPMenu()
	elseif(dataID=="BRRepMenu") then
		AtlasLootBRRepMenu()
	elseif dataID=="WSGRepMenu" then
		AtlasLootWSGRepMenu()
	elseif dataID=="ABRepMenu" then
		AtlasLootABRepMenu()
	elseif dataID=="AVRepMenu" then
		AtlasLootAVRepMenu()
	elseif dataID=="PVPSET" then
		AtlasLootPVPSetMenu()
	elseif dataID=="REPMENU" then
		AtlasLootRepMenu()
	elseif dataID=="SETMENU" then
		AtlasLootSetMenu()
	elseif dataID=="WORLDEPICS" then
		AtlasLootWorldEpicsMenu()
	elseif dataID=="WORLDBLUES" then
		AtlasLootWorldBluesMenu()
	elseif dataID=="WORLDEVENTMENU" then
		AtlasLootWorldEventMenu()
	elseif dataID=="AbyssalCouncil" then
		AtlasLootAbyssalCouncilMenu()
	elseif dataID=="CRAFTINGMENU" then
		AtlasLoot_CraftingMenu()
	elseif dataID=="CRAFTSET" then
		AtlasLootCraftedSetMenu()
	elseif dataID=="CRAFTSET2" then
		AtlasLootCraftedSet2Menu()
	elseif dataID=="ALCHEMYMENU" then
		AtlasLoot_AlchemyMenu()
	elseif dataID=="SMITHINGMENU" then
		AtlasLoot_SmithingMenu()
	elseif dataID=="ENCHANTINGMENU" then
		AtlasLoot_EnchantingMenu()
	elseif dataID=="ENGINEERINGMENU" then
		AtlasLoot_EngineeringMenu()
	elseif dataID=="LEATHERWORKINGMENU" then
		AtlasLoot_LeatherworkingMenu()
	elseif dataID=="MININGMENU" then
		AtlasLoot_MiningMenu()
	elseif dataID=="TAILORINGMENU" then
		AtlasLoot_TailoringMenu()
	elseif dataID=="COOKINGMENU" then
		AtlasLoot_CookingMenu()
	elseif(dataID=="SURVIVALMENU") then
		AtlasLoot_SurvivalMenu()
	else
		--Iterate through each item object and set its properties
		for i = 1, 30, 1 do
			--Check for a valid object (that it exists, and that it has a name)
			if dataSource[dataID][i] ~= nil and dataSource[dataID][i][3] ~= "" then
				if string.sub(dataSource[dataID][i][1], 1, 1) == "s" then
					isItem = false
					isEnchant = false
					isSpell = true
				elseif string.sub(dataSource[dataID][i][1], 1, 1) == "e" then
					isItem = false
					isEnchant = true
					isSpell = false
				else
					isItem = true
					isEnchant = false
					isSpell = false
				end
				if isItem then
					itemName, itemLink, itemQuality, itemRequiredLevel, itemType, itemSubType, itemCount, itemEquipLoc, itemTexture = GetItemInfo(dataSource[dataID][i][1])
					--If the client has the name of the item in cache, use that instead.
					--This is poor man's localisation, English is replaced be whatever is needed
					if GetItemInfo(dataSource[dataID][i][1]) then
						_, _, _, itemColor = GetItemQualityColor(itemQuality)
						text = itemColor..itemName
					else
						text = dataSource[dataID][i][3]
						text = AtlasLoot_FixText(text)
					end
					quantityFrame = _G["AtlasLootItem_"..i.."_Quantity"]
					quantityFrame:SetText("")
				elseif isEnchant then
					spellName = GetSpellInfoVanillaDB["enchants"][tonumber(string.sub(dataSource[dataID][i][1], 2))]["name"]
					spellIcon = dataSource[dataID][i][2]
					text = AtlasLoot_FixText(string.sub(dataSource[dataID][i][3], 1, 4)..spellName)
					quantityFrame = _G["AtlasLootItem_"..i.."_Quantity"]
					quantityFrame:SetText("")
				elseif isSpell then
					spellName = dataSource[dataID][i][3]
					spellIcon = dataSource[dataID][i][2]
					text = AtlasLoot_FixText(spellName)
					local qtyMin = GetSpellInfoVanillaDB["craftspells"][tonumber(string.sub(dataSource[dataID][i][1], 2))]["craftQuantityMin"]
					local qtyMax = GetSpellInfoVanillaDB["craftspells"][tonumber(string.sub(dataSource[dataID][i][1], 2))]["craftQuantityMax"]
					if qtyMin and qtyMin ~= "" then
						if qtyMax and qtyMax ~= "" then
							quantityFrame = _G["AtlasLootItem_"..i.."_Quantity"]
							quantityFrame:SetText(qtyMin.. "-"..qtyMax)
						else
							quantityFrame = _G["AtlasLootItem_"..i.."_Quantity"]
							quantityFrame:SetText(qtyMin)
						end
					else
						quantityFrame = _G["AtlasLootItem_"..i.."_Quantity"]
						quantityFrame:SetText("")
					end					
				end
				--Store data about the state of the items frame to allow minor tweaks or a recall of the current loot page
				AtlasLootItemsFrame.refresh = {dataID, dataSource_backup, boss, pFrame}
				--This is a valid QuickLook, so show the UI objects
				AtlasLoot_QuickLooks:Show()
				AtlasLootQuickLooksButton:Show()
				AtlasLootServerQueryButton:Show()
				--Insert the item description
				extra = dataSource[dataID][i][4]
				extra = AtlasLoot_FixText(extra)
				--Use shortcuts for easier reference to parts of the item button
				itemButton = _G["AtlasLootItem_"..i]
				iconFrame = _G["AtlasLootItem_"..i.."_Icon"]
				nameFrame = _G["AtlasLootItem_"..i.."_Name"]
				extraFrame = _G["AtlasLootItem_"..i.."_Extra"]
				pricetext1 = _G["AtlasLootItem_"..i.."_PriceText1"]
				pricetext2 = _G["AtlasLootItem_"..i.."_PriceText2"]
				pricetext3 = _G["AtlasLootItem_"..i.."_PriceText3"]
				pricetext4 = _G["AtlasLootItem_"..i.."_PriceText4"]
				pricetext5 = _G["AtlasLootItem_"..i.."_PriceText5"]
				priceicon1 = _G["AtlasLootItem_"..i.."_PriceIcon1"]
				priceicon2 = _G["AtlasLootItem_"..i.."_PriceIcon2"]
				priceicon3 = _G["AtlasLootItem_"..i.."_PriceIcon3"]
				priceicon4 = _G["AtlasLootItem_"..i.."_PriceIcon4"]
				priceicon5 = _G["AtlasLootItem_"..i.."_PriceIcon5"]
				--If there is no data on the texture an item should have, show a big red question mark
				if dataSource[dataID][i][2] == "?" then
					iconFrame:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
				elseif dataSource[dataID][i][2] == "" then
					local _, _, _, _, _, _, _, _, itemTexture1 = GetItemInfo(dataSource[dataID][i][1])
					iconFrame:SetTexture(itemTexture1)
				elseif not isItem and spellIcon then
					if type(dataSource[dataID][i][2]) == "number" then
						local _, _, _, _, _, _, _, _, itemTexture2 = GetItemInfo(dataSource[dataID][i][2])
						iconFrame:SetTexture(itemTexture2)
					elseif type(dataSource[dataID][i][2]) == "string" then
						iconFrame:SetTexture("Interface\\Icons\\"..dataSource[dataID][i][2])
					else
						iconFrame:SetTexture(spellIcon)
					end
				else
					--else show the texture
					iconFrame:SetTexture("Interface\\Icons\\"..dataSource[dataID][i][2])
				end
				if iconFrame:GetTexture() == nil then
					iconFrame:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
					itemButton.itemTexture = "Interface\\Icons\\INV_Misc_QuestionMark"
				else
					itemButton.itemTexture = iconFrame:GetTexture()
				end
				--Set the name and description of the item
				nameFrame:SetText(text)
				extraFrame:SetText(extra)
				extraFrame:Show()
				pricetext1:Hide()
				pricetext2:Hide()
				pricetext3:Hide()
				pricetext4:Hide()
				pricetext5:Hide()
				priceicon1:Hide()
				priceicon2:Hide()
				priceicon3:Hide()
				priceicon4:Hide()
				priceicon5:Hide()
				if dataSource[dataID][i][6] then
					if dataSource[dataID][i][6]~="" then
						pricetext1:SetText(dataSource[dataID][i][6])
						priceicon1:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][7]))
						extraFrame:Show()
						pricetext1:Show()
						priceicon1:Show()
					end
				end
				if dataSource[dataID][i][8] then
					if dataSource[dataID][i][8]~="" then
						pricetext2:SetText(dataSource[dataID][i][8])
						priceicon2:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][9]))
						extraFrame:Show()
						pricetext2:Show()
						priceicon2:Show()
					end
				end
				if dataSource[dataID][i][10] then
					if dataSource[dataID][i][10]~="" then
						pricetext3:SetText(dataSource[dataID][i][10])
						priceicon3:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][11]))
						extraFrame:Show()
						pricetext3:Show()
						priceicon3:Show()
					end
				end
				if dataSource[dataID][i][12] then
					if dataSource[dataID][i][12]~="" then
						pricetext4:SetText(dataSource[dataID][i][12])
						priceicon4:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][13]))
						extraFrame:Show()
						pricetext4:Show()
						priceicon4:Show()
					end
				end
				if dataSource[dataID][i][14] then
					if dataSource[dataID][i][14]~="" then
						pricetext5:SetText(dataSource[dataID][i][14])
						priceicon5:SetTexture(AtlasLoot_FixText(dataSource[dataID][i][15]))
						extraFrame:Show()
						pricetext5:Show()
						priceicon5:Show()
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
											pricetext1:SetText(v[6])
											priceicon1:SetTexture(AtlasLoot_FixText(v[7]))
											extraFrame:Show()
											pricetext1:Show()
											priceicon1:Show()
										end
									end
									if v[8] then
										if v[8]~="" then
											pricetext2:SetText(v[8])
											priceicon2:SetTexture(AtlasLoot_FixText(v[9]))
											extraFrame:Show()
											pricetext2:Show()
											priceicon2:Show()
										end
									end
									if v[10] then
										if v[10]~="" then
											pricetext3:SetText(v[10])
											priceicon3:SetTexture(AtlasLoot_FixText(v[11]))
											extraFrame:Show()
											pricetext3:Show()
											priceicon3:Show()
										end
									end
									if v[12] then
										if v[12]~="" then
											pricetext4:SetText(v[12])
											priceicon4:SetTexture(AtlasLoot_FixText(v[13]))
											extraFrame:Show()
											pricetext4:Show()
											priceicon4:Show()
										end
									end
									if v[14] then
										if v[14]~="" then
											pricetext5:SetText(v[14])
											priceicon5:SetTexture(AtlasLoot_FixText(v[15]))
											extraFrame:Show()
											pricetext5:Show()
											priceicon5:Show()
										end
									end
									break
								end
							end
						end
					end
				end
				--For convenience, we store information about the objects in the objects so that it can be easily accessed later
				itemButton.itemID = dataSource[dataID][i][1]
				itemButton.itemIDName = dataSource[dataID][i][3]
				itemButton.itemIDExtra = dataSource[dataID][i][4]
				itemButton.iteminfo = {}
				if isItem then
					itemButton.iteminfo.idcore = dataSource[dataID][i][1]
					_, _, _, _, _, _, _, itemButton.iteminfo.icontexture = GetItemInfo(dataSource[dataID][i][1])
					itemButton.storeID = dataSource[dataID][i][1]
					itemButton.dressingroomID = dataSource[dataID][i][1]
					itemButton.extraText = _G["AtlasLootItem_"..i.."_Extra"]:GetText()
				elseif isEnchant then
					spellID = tonumber(string.sub(dataSource[dataID][i][1], 2))
					itemButton.iteminfo.idcore = dataSource[dataID][i][2]
					_, _, _, _, _, _, _, _, itemButton.iteminfo.icontexture = GetItemInfo(dataSource[dataID][i][2])
					itemButton.storeID = dataSource[dataID][i][2]
					if GetSpellInfoVanillaDB["enchants"][spellID]["item"] and GetSpellInfoVanillaDB["enchants"][spellID]["item"] ~= nil and GetSpellInfoVanillaDB["enchants"][spellID]["item"] ~= "" then
						itemButton.dressingroomID = GetSpellInfoVanillaDB["enchants"][spellID]["item"]
					else
						itemButton.dressingroomID = spellID
					end
					itemButton.extraText = _G["AtlasLootItem_"..i.."_Extra"]:GetText()
					if GetSpellInfoVanillaDB["enchants"][spellID]["item"] ~= nil and GetSpellInfoVanillaDB["enchants"][spellID]["item"] ~= "" then
						if not GetItemInfo(GetSpellInfoVanillaDB["enchants"][spellID]["item"]) then
							GameTooltip:SetHyperlink("item:"..GetSpellInfoVanillaDB["enchants"][spellID]["item"]..":0:0:0")
						end
					end
				elseif isSpell then
					spellID = tonumber(string.sub(dataSource[dataID][i][1], 2))
					itemButton.iteminfo.idcore = dataSource[dataID][i][1]
					_, _, _, _, _, _, _, _, itemButton.iteminfo.icontexture = GetItemInfo(dataSource[dataID][i][1])
					itemButton.storeID = dataSource[dataID][i][1]
					itemButton.dressingroomID = GetSpellInfoVanillaDB["craftspells"][spellID]["craftItem"]
					itemButton.extraText = _G["AtlasLootItem_"..i.."_Extra"]:GetText()
					if GetSpellInfoVanillaDB["craftspells"][spellID]["craftItem"] ~= "" then
						if not GetItemInfo(GetSpellInfoVanillaDB["craftspells"][spellID]["craftItem"]) then
							GameTooltip:SetHyperlink("item:"..GetSpellInfoVanillaDB["craftspells"][spellID]["craftItem"]..":0:0:0")
						end
					end
					if GetSpellInfoVanillaDB["craftspells"][spellID]["reagents"] ~= "" then
						for i = 1, table.getn(GetSpellInfoVanillaDB["craftspells"][spellID]["reagents"]) do
							local reagent = GetSpellInfoVanillaDB["craftspells"][spellID]["reagents"][i]
							if not GetItemInfo(reagent[1]) then
								GameTooltip:SetHyperlink("item:"..reagent[1]..":0:0:0")
							end
						end
					end
					if GetSpellInfoVanillaDB["craftspells"][spellID]["tools"] ~= "" then
						for i = 1, table.getn(GetSpellInfoVanillaDB["craftspells"][spellID]["tools"]) do
							if not GetItemInfo(GetSpellInfoVanillaDB["craftspells"][spellID]["tools"][i]) then
								GameTooltip:SetHyperlink("item:"..GetSpellInfoVanillaDB["craftspells"][spellID]["tools"][i]..":0:0:0")
							end
						end
					end
				end
				itemButton.droprate = nil
				if dataID == "SearchResult" or dataID == "WishList" then
					itemButton.sourcePage = dataSource[dataID][i][5]
				else
					local droprate = dataSource[dataID][i][5]
					if droprate and string.find(droprate, "%%") then itemButton.droprate = droprate end
				end
				itemButton.i = 1
				itemButton:Show()
				--If the item is not in cache, querying the server may cause a disconnect
				--Show a red box around the item to indicate this to the user
				if (not GetItemInfo(dataSource[dataID][i][1]) and dataSource[dataID][i][1] ~= 0) and isItem then
					_G["AtlasLootItem_"..i.."_Unsafe"]:Show()
				else
					_G["AtlasLootItem_"..i.."_Unsafe"]:Hide()
				end
			else
				_G["AtlasLootItem_"..i]:Hide()
			end
		end
		--Hide navigation buttons by default, only show what we need
		_G["AtlasLootItemsFrame_BACK"]:Hide()
		_G["AtlasLootItemsFrame_NEXT"]:Hide()
		_G["AtlasLootItemsFrame_PREV"]:Hide()
		AtlasLoot_BossName:SetText(boss)
		--Consult the button registry to determine what nav buttons are required
		if dataID == "SearchResult" or dataID == "WishList" then
			if wlPage < wlPageMax then
				_G["AtlasLootItemsFrame_NEXT"]:Show()
				_G["AtlasLootItemsFrame_NEXT"].lootpage = dataID.."Page"..(wlPage + 1)
			end
			if wlPage > 1 then
				_G["AtlasLootItemsFrame_PREV"]:Show()
				_G["AtlasLootItemsFrame_PREV"].lootpage = dataID.."Page"..(wlPage - 1)
			end
		elseif AtlasLoot_ButtonRegistry[dataID] then
			local tablebase = AtlasLoot_ButtonRegistry[dataID]
			AtlasLoot_BossName:SetText(tablebase.Title)
			if tablebase.Next_Page then
				_G["AtlasLootItemsFrame_NEXT"]:Show()
				_G["AtlasLootItemsFrame_NEXT"].lootpage = tablebase.Next_Page
				_G["AtlasLootItemsFrame_NEXT"].title = tablebase.Next_Title
			end
			if tablebase.Prev_Page then
				_G["AtlasLootItemsFrame_PREV"]:Show()
				_G["AtlasLootItemsFrame_PREV"].lootpage = tablebase.Prev_Page
				_G["AtlasLootItemsFrame_PREV"].title = tablebase.Prev_Title
			end
			if tablebase.Back_Page then
				_G["AtlasLootItemsFrame_BACK"]:Show()
				_G["AtlasLootItemsFrame_BACK"].lootpage = tablebase.Back_Page
				_G["AtlasLootItemsFrame_BACK"].title = tablebase.Back_Title
			end
		end
	end
	--For Alphamap and Atlas integration, show a 'close' button to hide the loot table and restore the map view
	if AtlasLootItemsFrame:GetParent() == AlphaMapAlphaMapFrame or AtlasLootItemsFrame:GetParent() == AtlasFrame then
		AtlasLootItemsFrame_CloseButton:Show()
	else
		AtlasLootItemsFrame_CloseButton:Hide()
	end
	--Anchor the item frame where it is supposed to be
	AtlasLoot_SetItemInfoFrame(pFrame)
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
	pFrame = { "TOPLEFT", "AtlasLootDefaultFrame_LootBackground", "TOPLEFT", "2", "-2" }
	
	--If the button clicked was linked to a loot table
	if tabletype == "Table" then
		--Show the loot table
		AtlasLoot_ShowBossLoot(tablename, text, pFrame)
		--Save needed info for fuure re-display of the table
		AtlasLootCharDB.LastBoss = tablename
		AtlasLootCharDB.LastBossText = text
		--Purge the text label for the submenu and disable the submenu
		AtlasLootDefaultFrame_SubMenu:Disable()
		AtlasLootDefaultFrame_SelectedTable:SetText("")
		AtlasLootDefaultFrame_SelectedTable:Show()
		--If the button links to a sub menu definition
	else
		--Enable the submenu button
		AtlasLootDefaultFrame_SubMenu:Enable()
		--Show the first loot table associated with the submenu
		AtlasLoot_ShowBossLoot(AtlasLoot_DewDropDown_SubTables[tablename][1][2], AtlasLoot_DewDropDown_SubTables[tablename][1][1], pFrame)
		--Save needed info for fuure re-display of the table
		AtlasLootCharDB.LastBoss = AtlasLoot_DewDropDown_SubTables[tablename][1][2]
		AtlasLootCharDB.LastBossText = AtlasLoot_DewDropDown_SubTables[tablename][1][1]
		--Load the correct submenu and associated with the button
		AtlasLoot_DewdropSubMenu:Unregister(AtlasLootDefaultFrame_SubMenu)
		AtlasLoot_DewdropSubMenuRegister(AtlasLoot_DewDropDown_SubTables[tablename])
		--Show a text label of what has been selected
		AtlasLootDefaultFrame_SelectedTable:SetText(AtlasLoot_DewDropDown_SubTables[tablename][1][1])
		AtlasLootDefaultFrame_SelectedTable:Show()
	end
	--Show the category that has been selected
	AtlasLootDefaultFrame_SelectedCategory:SetText(text)
	AtlasLootDefaultFrame_SelectedCategory:Show()
	AtlasLoot_Dewdrop:Close(1)
end

--[[
	AtlasLoot_DewDropSubMenuClick(tablename, text):
	tablename - Name of the loot table in the database
	text - Heading for the loot table
	Called when a button in AtlasLoot_DewdropSubMenu is clicked
]]
function AtlasLoot_DewDropSubMenuClick(tablename, text)
	--Definition of where I want the loot table to be shown
	pFrame = { "TOPLEFT", "AtlasLootDefaultFrame_LootBackground", "TOPLEFT", "2", "-2" }
	--Show the select loot table
	AtlasLoot_ShowBossLoot(tablename, text, pFrame)
	--Save needed info for fuure re-display of the table
	AtlasLootCharDB.LastBoss = tablename
	AtlasLootCharDB.LastBossText = text
	--Show the table that has been selected
	AtlasLootDefaultFrame_SelectedTable:SetText(text)
	AtlasLootDefaultFrame_SelectedTable:Show()
	AtlasLoot_DewdropSubMenu:Close(1)
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
					'text', L["Close Menu"],
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
						if type(v[1]) == "table" and type(v[1][1]) == "string" then
							local checked = false
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
							local lock=0
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
									lock=1
								end
							end
						end
					end
				end
				--Close button
				AtlasLoot_Dewdrop:AddLine(
					'text', L["Close Menu"],
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
							if type(v[1]) == "table" and type(v[1][1]) == "string" then
								local checked = false
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
								local lock=0
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
										lock=1
									end
								end
							end
						end
					end
				end
				AtlasLoot_Dewdrop:AddLine(
					'text', L["Close Menu"],
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
							local checked = false
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
					'text', L["Close Menu"],
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
	AtlasLootItemsFrame.activeBoss = nil
	--Fix the boss buttons so the correct icons are displayed
	if AtlasFrame and AtlasFrame:IsVisible() then
		if ATLAS_CUR_LINES then
			for i=1,ATLAS_CUR_LINES do
				if _G["AtlasBossLine"..i.."_Selected"]:IsVisible() then
					_G["AtlasBossLine"..i.."_Selected"]:Hide()
					_G["AtlasBossLine"..i.."_Loot"]:Show()
				end
			end
		end
	end
	--Hide the item frame
	AtlasLootItemsFrame:Hide()
end

--[[
	AtlasLootMenuItem_OnClick:
	Requests the relevant loot page from a menu screen
]]
function AtlasLootMenuItem_OnClick()
	if this.isheader == nil or this.isheader == false then
		AtlasLoot_ShowBossLoot(this.lootpage, _G[this:GetName().."_Name"]:GetText(), AtlasLoot_AnchorFrame)
	end
end

--[[
	AtlasLoot_NavButton_OnClick:
	Called when <-, -> or 'Back' are pressed and calls up the appropriate loot page
]]
function AtlasLoot_NavButton_OnClick()
	if AtlasLootItemsFrame.refresh and AtlasLootItemsFrame.refresh[2] and AtlasLootItemsFrame.refresh[4] then
		if string.sub(this.lootpage, 1, 16) == "SearchResultPage" then
			AtlasLoot_ShowItemsFrame("SearchResult", this.lootpage, string.format((L["Search Result: %s"]), AtlasLootCharDB.LastSearchedText or ""), AtlasLootItemsFrame.refresh[4])
		elseif string.sub(this.lootpage, 1, 12) == "WishListPage" then
			AtlasLoot_ShowItemsFrame("WishList", this.lootpage, L["WishList"], AtlasLootItemsFrame.refresh[4])
		else
			AtlasLoot_ShowItemsFrame(this.lootpage, AtlasLootItemsFrame.refresh[2], this.title, AtlasLootItemsFrame.refresh[4])
		end
	elseif AtlasLootItemsFrame.refresh and AtlasLootItemsFrame.refresh[2] then
		AtlasLoot_ShowItemsFrame(this.lootpage, AtlasLootItemsFrame.refresh[2], this.title, AtlasFrame)
	else
		--Fallback for if the requested loot page is a menu and does not have a .refresh instance
		AtlasLoot_ShowItemsFrame(this.lootpage, "dummy", this.title, AtlasFrame)
	end
end

--[[
	AtlasLoot_IsLootTableAvailable(dataID):
	Checks if a loot table is in memory and attempts to load the correct LoD module if it isn't
	dataID: Loot table dataID
]]
function AtlasLoot_IsLootTableAvailable(dataID)
	if not dataID then return false end
	
	local menu_check=false
	
	for k,v in pairs(AtlasLoot_MenuList) do
		if v == dataID then
			menu_check=true
		end
	end
	
	if menu_check then
		return true
	else
		if not AtlasLoot_TableNames[dataID] then
			DEFAULT_CHAT_FRAME:AddMessage(RED..L["AtlasLoot Error!"].." "..WHITE..dataID..L[" not listed in loot table registry, please report this message to the AtlasLoot forums at http://www.atlasloot.net"])
			return false
		end
		
		local dataSource = AtlasLoot_TableNames[dataID][2]
		
		if AtlasLoot_Data[dataSource] then
			if AtlasLoot_Data[dataSource][dataID] then
				return true
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
	local dewdrop = AceLibrary("Dewdrop-2.0")
	if dewdrop:IsOpen(button) then
		dewdrop:Close(1)
	else
		local setOptions = function()
			dewdrop:AddLine(
				"text", L["QuickLook"].." 1",
				"tooltipTitle", L["QuickLook"].." 1",
				"tooltipText", L["Assign this loot table to QuickLook"].." 1",
				"func", function()
					AtlasLootCharDB["QuickLooks"][1]={AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4]}
					AtlasLoot_RefreshQuickLookButtons()
					dewdrop:Close(1)
				end
			)
			dewdrop:AddLine(
				"text", L["QuickLook"].." 2",
				"tooltipTitle", L["QuickLook"].." 2",
				"tooltipText", L["Assign this loot table to QuickLook"].." 2",
				"func", function()
					AtlasLootCharDB["QuickLooks"][2]={AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4]}
					AtlasLoot_RefreshQuickLookButtons()
					dewdrop:Close(1)
				end
			)
			dewdrop:AddLine(
				"text", L["QuickLook"].." 3",
				"tooltipTitle", L["QuickLook"].." 3",
				"tooltipText", L["Assign this loot table to QuickLook"].." 3",
				"func", function()
					AtlasLootCharDB["QuickLooks"][3]={AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4]}
					AtlasLoot_RefreshQuickLookButtons()
					dewdrop:Close(1)
				end
			)
			dewdrop:AddLine(
				"text", L["QuickLook"].." 4",
				"tooltipTitle", L["QuickLook"].." 4",
				"tooltipText", L["Assign this loot table to QuickLook"].." 4",
				"func", function()
					AtlasLootCharDB["QuickLooks"][4]={AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4]}
					AtlasLoot_RefreshQuickLookButtons()
					dewdrop:Close(1)
				end
			)
		end
		dewdrop:Open(button,
			'point', function(parent)
				return "BOTTOMLEFT", "BOTTOMRIGHT"
			end,
			"children", setOptions
		)
	end
end

--[[
	AtlasLoot_RefreshQuickLookButtons()
	Enables/disables the quicklook buttons depending on what is assigned
]]
function AtlasLoot_RefreshQuickLookButtons()
	i=1
	while i<5 do
		if not AtlasLootCharDB["QuickLooks"][i] or not AtlasLootCharDB["QuickLooks"][i][1] or AtlasLootCharDB["QuickLooks"][i][1]==nil then
			_G["AtlasLootPanel_Preset"..i]:Disable()
			_G["AtlasLootDefaultFrame_Preset"..i]:Disable()
		else
			_G["AtlasLootPanel_Preset"..i]:Enable()
			_G["AtlasLootDefaultFrame_Preset"..i]:Enable()
		end
		i=i+1
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
	DEFAULT_CHAT_FRAME:AddMessage(BLUE.."AtlasLoot"..": "..WHITE..L["QuickLook"].." "..button.." "..L["has been reset!"])
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
	local tableavailable = AtlasLoot_IsLootTableAvailable(dataID)
	if tableavailable then
		AtlasLootItemsFrame:Hide()
		--If the loot table is already being displayed, it is hidden and the current table selection cancelled
		if dataID == AtlasLootItemsFrame.externalBoss and AtlasLootItemsFrame:GetParent() ~= AtlasFrame and AtlasLootItemsFrame:GetParent() ~= AtlasLootDefaultFrame_LootBackground then
			AtlasLootItemsFrame.externalBoss = nil
		else
			--Use the original WoW instance data by default
			local dataSource = AtlasLoot_TableNames[dataID][2]
			--Set anchor point, set selected table and call AtlasLoot_ShowItemsFrame
			AtlasLoot_AnchorFrame = pFrame
			AtlasLootItemsFrame.externalBoss = dataID
			AtlasLoot_ShowItemsFrame(dataID, dataSource, boss, pFrame)
		end
	end
end

function AtlasLootOptions_SetupSlider(text, mymin, mymax, step)
	_G[this:GetName().."Text"]:SetText(text.." ("..this:GetValue()..")")
	this:SetMinMaxValues(mymin, mymax)
	_G[this:GetName().."Low"]:SetText(mymin)
	_G[this:GetName().."High"]:SetText(mymax)
	this:SetValueStep(step)
end

--[[
	AtlasLootMinimapButton_OnClick:
	Function to show/hide AtlasLoot when click on minimap button.
]]
function AtlasLootMinimapButton_OnClick(arg1)
	if arg1=="LeftButton" then
		AtlasLoot_Toggle()
	end
end

--[[
	AtlasLootMinimapButton_Init:
	Show/hide minimap button.
]]
function AtlasLootMinimapButton_Init()
	if AtlasLootCharDB.MinimapButton == true then
		AtlasLootMinimapButtonFrame:Show()
	else
		AtlasLootMinimapButtonFrame:Hide()
	end
end

--[[
	AtlasLootMinimapButton_OnEnter:
	Show tooltip when mouse is over minimap button.
]]
function AtlasLootMinimapButton_OnEnter()
	GameTooltip:SetOwner(this, "ANCHOR_LEFT")
	GameTooltip:SetText("AtlasLoot Enhanced")
	GameTooltipTextLeft1:SetTextColor(1, 1, 1)
	GameTooltip:AddLine(L["Left-click to open AtlasLoot.\nMiddle-click for AtlasLoot options.\nRight-click and drag to move this button."])
	GameTooltip:Show()
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
	)
	AtlasLootOptions_Init()
end

local function around(num, idp)
	local mult = 10 ^ (idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

function AtlasLootOptions_UpdateSlider(text)
	_G[this:GetName().."Text"]:SetText(text.." ("..around(this:GetValue(),2)..")")
end

function AtlasLootOptions_ResetPosition()
	AtlasLootCharDB.MinimapButtonPosition = 315
	AtlasLootCharDB.MinimapButtonRadius = 78
	AtlasLootMinimapButton_UpdatePosition()
	DEFAULT_CHAT_FRAME:AddMessage(BLUE.."AtlasLoot"..": "..RED..L["Minimap button has been reset!"])
end

function AtlasLootOptions_DefaultSettings()
	AtlasLootCharDB.SafeLinks = true
	AtlasLootCharDB.AllLinks = false
	AtlasLootCharDB.DefaultTT = true
	AtlasLootCharDB.LootlinkTT = false
	AtlasLootCharDB.ItemSyncTT = false
	AtlasLootCharDB.EquipCompare = false
	AtlasLootCharDB.Opaque = false
	AtlasLootCharDB.ItemIDs = false
	AtlasLootCharDB.ItemSpam = true
	AtlasLootCharDB.MinimapButton = true
	AtlasLootCharDB.HidePanel = false
	AtlasLootCharDB.AtlasLootVersion = ATLASLOOT_VERSION
	AtlasLootCharDB.AutoQuery = false
	AtlasLootCharDB.PartialMatching = true
	AtlasLootCharDB.LastBoss = "RFCTaragaman"
	AtlasLootCharDB.LastBossText = BB["Taragaman the Hungerer"]
	AtlasLootDefaultFrame:ClearAllPoints()
	AtlasLootDefaultFrame:SetPoint("TOP", "UIParent", "TOP", 0, -30)
	AtlasLootOptionsFrame:ClearAllPoints()
	AtlasLootOptionsFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 100)
	AtlasLootCharDB["QuickLooks"] = {}
	AtlasLootCharDB["WishList"] = {}
	AtlasLoot_RefreshQuickLookButtons()
	AtlasLootOptions_Init()
	DEFAULT_CHAT_FRAME:AddMessage(BLUE.."AtlasLoot"..": "..RED..L["Default settings applied!"])
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
	AtlasLootMinimapButton_SetPosition(math.deg(math.atan2(ypos,xpos)))
end

--[[
	AtlasLootButton_SetPosition:
	Function to save the position of the minimap button.
]]
function AtlasLootMinimapButton_SetPosition(v)
	if v < 0 then
		v = v + 360
	end
	AtlasLootCharDB.MinimapButtonPosition = v
	AtlasLootMinimapButton_UpdatePosition()
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
		[L["Dungeons & Raids"]] = {
			[1] = { 
				{ BZ["Ragefire Chasm"], "RagefireChasm", "Submenu" },
			},
			[2] = { 
				{ BZ["Wailing Caverns"], "WailingCaverns", "Submenu" },
			},
			[3] = { 
				{ BZ["The Deadmines"], "Deadmines", "Submenu" },
			},
			[4] = { 
				{ BZ["Shadowfang Keep"], "ShadowfangKeep", "Submenu" },
			},
			[5] = { 
				{ BZ["Blackfathom Deeps"], "BlackfathomDeeps", "Submenu" },
			},
			[6] = { 
				{ BZ["The Stockade"], "TheStockade", "Submenu" },
			},
			[7] = { 
				{ BZ["Gnomeregan"], "Gnomeregan", "Submenu" },
			},			
			[8] = { 
				{ BZ["Razorfen Kraul"], "RazorfenKraul", "Submenu" },
			},
			[9] = { 
				{ L["The Crescent Grove"], "TheCrescentGrove", "Submenu" },
			},
			[10] = {
				[BZ["Scarlet Monastery"]] = {
					{ BZ["Scarlet Monastery"].." "..L["Graveyard"], "SMGraveyard", "Submenu" },
					{ BZ["Scarlet Monastery"].." "..L["Library"], "SMLibrary", "Submenu" },
					{ BZ["Scarlet Monastery"].." "..L["Armory"], "SMArmory", "Submenu" },
					{ BZ["Scarlet Monastery"].." "..L["Cathedral"], "SMCathedral", "Submenu" },
				},
			},
			[11] = { 
				{ BZ["Razorfen Downs"], "RazorfenDowns", "Submenu" },
			},
			[12] = { 
				{ BZ["Uldaman"], "Uldaman", "Submenu" },
			},
			[13] = {
				{ L["Gilneas City"], "GilneasCity", "Submenu" },
			},
			[14] = { 
				{ BZ["Maraudon"], "Maraudon", "Submenu" },
			},
			[15] = { 
				{ BZ["Zul'Farrak"], "ZulFarrak", "Submenu" },
			},
			[16] = { 
				{ L["The Sunken Temple"], "SunkenTemple", "Submenu" },
			},
			[17] = { 
				{ "HateforgeQuarry", "HateforgeQuarry", "Submenu" },
			},
			[18] = { 
				{ BZ["Blackrock Depths"], "BlackrockDepths", "Submenu" },
			},
			[19] = { 
				[BZ["Dire Maul"]] = {
					{ BZ["Dire Maul"].." "..L["East"], "DireMaulEast", "Submenu" },
					{ BZ["Dire Maul"].." "..L["West"], "DireMaulWest", "Submenu" },
					{ BZ["Dire Maul"].." "..L["North"], "DireMaulNorth", "Submenu" },
				}, 
			},
			[20] = { 
				{ BZ["Scholomance"], "Scholomance", "Submenu" },
			},
			[21] = { 
				{ BZ["Stratholme"], "Stratholme", "Submenu" },
			},
			[22] = { 
				{ BZ["Lower Blackrock Spire"], "LowerBlackrock", "Submenu" },
			},
			[23] = { 
				{ BZ["Upper Blackrock Spire"], "UpperBlackrock", "Submenu" },
			},
			[24] = { 
				{ L["Karazhan Crypt"], "KarazhanCrypt", "Submenu" },
			},
			[25] = { 
				{ L["Caverns of Time: Black Morass"], "CavernsOfTimeBlackMorass", "Submenu" },
			},
			[26] = { 
				{ L["Stormwind Vault"], "StormwindVault", "Submenu" },
			},
			[27] = { 
				{ BZ["Zul'Gurub"], "ZulGurub", "Submenu" },
			},
			[28] = { 
				{ BZ["Ruins of Ahn'Qiraj"], "RuinsofAQ", "Submenu" },
			},
			[29] = { 
				{ BZ["Molten Core"], "MoltenCore", "Submenu" },
			},
			[30] = { 
				{ BZ["Onyxia's Lair"], "Onyxia", "Submenu" },
			},
			[31] = {
				{ L["Lower Karazhan Halls"], "LowerKara", "Submenu" },
			},
			[32] = { 
				{ BZ["Blackwing Lair"], "BlackwingLair", "Submenu" },
			},
			[33] = {
				{ L["Emerald Sanctum"], "EmeraldSanctum", "Submenu" },
			},
			[34] = { 
				{ BZ["Temple of Ahn'Qiraj"], "TempleofAQ", "Submenu" },
			},
			[35] = { 
				{ BZ["Naxxramas"], "Naxxramas", "Submenu" },
			},
		},
	},
	[2] = {
		{ L["World Bosses"], "WorldBosses", "Submenu" },
	},
	[3] = {
		{ L["Rare Mobs"], "Raremobs", "Submenu" },
	},
	[4] = {
		[L["PvP Rewards"]] = {
			[1] = { 
				{ L["PvP Armor Sets"], "PvPArmorSets", "Submenu" },
			},
			[2] = { 
				{ L["PvP Accessories"], "PvP60Accessories1", "Table" },
			},
			[3] = { 
				{ L["Rank 14 Weapons"], "PVPWeapons1", "Table" },
			},
			[4] = { 
				{ L["PvP Mounts"], "PvPMountsPvP", "Table" },
			},
			[5] = { 
				{ "Blood Ring", "BRRewards", "Submenu" },
			},
			[6] = { 
				{ BZ["Alterac Valley"], "AVRewards", "Submenu" },
			},
			[7] = { 
				{ BZ["Arathi Basin"], "ABRewards", "Submenu" },
			},
			[8] = { 
				{ BZ["Warsong Gulch"], "WSGRewards", "Submenu" },
			},
		},
	},
	[5] = {
		[L["Sets/Collections"]] = {
			[1] = { 
				{ L["Pre 60 Sets"], "Pre60Sets", "Submenu" },
			},
			[2] = { 
				{ L["Tier 0/0.5 Sets"], "DungeonSets12", "Submenu" },
			},
			[3] = { 
				{ L["Ruins of Ahn'Qiraj Sets"], "AQ20Sets", "Submenu" },
			},
			[4] = { 
				{ L["Temple of Ahn'Qiraj Sets"], "AQ40Sets", "Submenu" },
			},
			[5] = { 
				{ L["Zul'Gurub Sets"], "ZGSets", "Submenu" },
			},
			[6] = { 
				{ L["Tier 1 Sets"], "T1Sets", "Submenu" },
			},
			[7] = { 
				{ L["Tier 2 Sets"], "T2Sets", "Submenu" },
			},
			[8] = { 
				{ L["Tier 3 Sets"], "T3Sets", "Submenu" },
			},
			[9] = { 
				{ L["Legendary Items"], "Legendaries", "Table" },
			},
			[10] = {
				{ L["Rare Pets"], "RarePets1", "Table" },
			},
			[11] = { 
				{ L["Rare Mounts"], "RareMounts", "Table" },
			},
			[12] = {
				{ L["Old Mounts"], "OldMounts", "Table" },
			},
			[13] = {
				{ L["Unobtainable Mounts"], "UnobMounts", "Table" },
			},
			[14] = {
				{ L["Tabards"], "Tabards", "Table" },
			},
			[15] = {
				{ L["World Epics"], "BoEWorldEpics", "Submenu" },
			},
			[16] = {
				{ L["World Blues"], "BoEWorldBlues", "Submenu" },
			},
		},
	},
	[6] = {
		{ L["Reputation Factions"], "Factions", "Submenu" },
	},
	[7] = {
		[L["World Events"]] = {
			[1] = { 
				{ L["Abyssal Council"], "AbyssalCouncil1", "Submenu" },
			},
			[2] = { 
				{ L["Children's Week"], "ChildrensWeek", "Table" },
			},
			[3] = { 
				{ L["Elemental Invasion"], "ElementalInvasion", "Table" },
			},
			[4] = { 
				{ L["Feast of Winter Veil"], "Winterviel", "Submenu" },
			},
			[5] = { 
				{ L["Gurubashi Arena Booty Run"], "GurubashiArena", "Table" },
			},
			[6] = { 
				{ L["Hallow's End"], "Halloween1", "Table" },
			},
			[7] = { 
				{ L["Harvest Festival"], "HarvestFestival", "Table" },
			},
			[8] = { 
				{ L["Love is in the Air"], "Valentineday", "Table" },
			},
			[9] = { 
				{ L["Lunar Festival"], "LunarFestival1", "Table" },
			},
			[10] = { 
				{ L["Midsummer Fire Festival"], "MidsummerFestival", "Table" },
			},
			[11] = { 
				{ L["Noblegarden"], "Noblegarden", "Table" },
			},
			[12] = { 
				{ L["Scourge Invasion"], "ScourgeInvasionEvent1", "Table" },
			},
			[13] = { 
				{ L["Stranglethorn Fishing Extravaganza"], "FishingExtravaganza", "Table" },
			},
		},
	},
	[8] = {
		[L["Crafting"]] = {
			[1] = { { BS["Alchemy"], "Alchemy", "Submenu" }, },
			[2] = { { (BS["Blacksmithing"]), "Blacksmithing", "Submenu" }, },
			[3] = { { (BS["Enchanting"]), "Enchanting", "Submenu" }, },
			[4] = { { (BS["Engineering"]), "Engineering", "Submenu" }, },
			[5] = { { (BS["Herbalism"]), "Herbalism1", "Table" }, },
			[6] = { { (BS["Leatherworking"]), "Leatherworking", "Submenu" }, },
			[7] = { { (BS["Mining"]), "Mining", "Submenu" }, },
			[8] = { { (BS["Tailoring"]), "Tailoring", "Submenu" }, },
			[9] = { { (BS["Cooking"]), "Cooking", "Submenu" }, },
			[10] = { { (BS["First Aid"]), "FirstAid1", "Table" }, },
			[11] = { { (L["Survival"]), "SURVIVALMENU", "Table" }, },
			[12] = { { (BS["Poisons"]), "Poisons1", "Table" }, },
			[13] = { 
				[L["Crafted Sets"]] = {
					 { (BS["Tailoring"]), "CraftSetTailoringC", "Submenu" },
					 { (BS["Leatherworking"].." Leather"), "CraftSetLeatherworkL", "Submenu" },
					 { (BS["Leatherworking"].." Mail"), "CraftSetLeatherworkM", "Submenu" },
					 { (BS["Blacksmithing"].." Mail"), "CraftSetBlacksmithM", "Submenu" },
					 { (BS["Blacksmithing"].." Plate"), "CraftSetBlacksmithP", "Submenu" },
				}, 
			},
			[14] = { { L["Crafted Epic Weapons"], "CraftedWeapons1", "Table" }, },
		},
	},
}

--This table defines all the subtables needed for the full menu
--Each sub table entry contains the text entry and the loot table that goes wih it
AtlasLoot_DewDropDown_SubTables = {
	["HateforgeQuarry"] = {
		{ "High Foreman Bargul Blackhammer", "HQHighForemanBargulBlackhammer" },
		{ "Engineer Figgles", "HQEngineerFiggles" },
		{ "Corrosis", "HQCorrosis" },
		{ "Hatereaver Annihilator", "HQHatereaverAnnihilator" },
		{ "Hargesh Doomcaller", "HQHargeshDoomcaller" },
	},
	["BlackrockDepths"] = {
		{ BB["Lord Roccor"], "BRDLordRoccor" },
		{ BB["High Interrogator Gerstahn"], "BRDHighInterrogatorGerstahn" },
		{ BB["Anub'shiah"], "BRDAnubshiah" },
		{ BB["Eviscerator"], "BRDEviscerator" },
		{ BB["Gorosh the Dervish"], "BRDGorosh" },
		{ BB["Grizzle"], "BRDGrizzle" },
		{ BB["Hedrum the Creeper"], "BRDHedrum" },
		{ BB["Ok'thor the Breaker"], "BRDOkthor" },
		{ L["Theldren"], "BRDTheldren" },
		{ BB["Houndmaster Grebmar"], "BRDHoundmaster" },
		{ BB["Pyromancer Loregrain"].." ("..L["Rare"]..")", "BRDPyromancerLoregrain" },
		{ L["The Vault"], "BRDTheVault" },
		{ BB["Warder Stilgiss"].." ("..L["Rare"]..")", "BRDWarderStilgiss" },
		{ BB["Verek"].." ("..L["Rare"]..")", "BRDVerek" },
		{ BB["Fineous Darkvire"], "BRDFineousDarkvire" },
		{ BB["Lord Incendius"], "BRDLordIncendius" },
		{ BB["Bael'Gar"], "BRDBaelGar" },
		{ BB["General Angerforge"], "BRDGeneralAngerforge" },
		{ BB["Golem Lord Argelmach"], "BRDGolemLordArgelmach" },
		{ L["The Grim Guzzler"], "BRDGuzzler" },
		{ BB["Ambassador Flamelash"], "BRDFlamelash" },
		{ BB["Panzor the Invincible"].." ("..L["Rare"]..")", "BRDPanzor" },
		{ L["Summoner's Tomb"], "BRDTomb" },
		{ BB["Magmus"], "BRDMagmus" },
		{ BB["Princess Moira Bronzebeard"], "BRDPrincess" },
		{ BB["Emperor Dagran Thaurissan"], "BRDEmperorDagranThaurissan" },
		{ L["Trash Mobs"], "BRDTrash" },
	},
	["LowerBlackrock"] = {
		{ L["Spirestone Butcher"].." ("..L["Rare"]..")", "LBRSSpirestoneButcher" },
		{ L["Spirestone Battle Lord"].." ("..L["Rare"]..")", "LBRSSpirestoneBattleLord" },
		{ L["Spirestone Lord Magus"].." ("..L["Rare"]..")", "LBRSSpirestoneLordMagus" },
		{ BB["Highlord Omokk"], "LBRSOmokk" },
		{ BB["Shadow Hunter Vosh'gajin"], "LBRSVosh" },
		{ BB["War Master Voone"], "LBRSVoone" },
		{ L["Burning Felguard"].." ("..L["Rare"]..")", "LBRSFelguard" },
		{ BB["Mor Grayhoof"], "LBRSGrayhoof" },
		{ BB["Bannok Grimaxe"].." ("..L["Rare"]..")", "LBRSGrimaxe" },
		{ BB["Mother Smolderweb"], "LBRSSmolderweb" },
		{ BB["Crystal Fang"].." ("..L["Rare"]..")", "LBRSCrystalFang" },
		{ BB["Urok Doomhowl"], "LBRSDoomhowl" },
		{ BB["Quartermaster Zigris"], "LBRSZigris" },
		{ BB["Halycon"], "LBRSHalycon" },
		{ BB["Gizrul the Slavener"], "LBRSSlavener" },
		{ BB["Ghok Bashguud"].." ("..L["Rare"]..")", "LBRSBashguud" },
		{ BB["Overlord Wyrmthalak"], "LBRSWyrmthalak" },
		{ L["Trash Mobs"], "LBRSTrash" },
	},
	["UpperBlackrock"] = {
		{ BB["Pyroguard Emberseer"], "UBRSEmberseer" },
		{ BB["Solakar Flamewreath"], "UBRSSolakar" },
		{ L["Father Flame"], "UBRSFlame" },
		{ BB["Jed Runewatcher"].." ("..L["Rare"]..")", "UBRSRunewatcher" },
		{ BB["Goraluk Anvilcrack"].." ("..L["Rare"]..")", "UBRSAnvilcrack" },
		{ BB["Warchief Rend Blackhand"], "UBRSRend" },
		{ BB["Gyth"], "UBRSGyth" },
		{ BB["The Beast"], "UBRSBeast" },
		{ BB["Lord Valthalak"], "UBRSValthalak" },
		{ BB["General Drakkisath"], "UBRSDrakkisath" },
		{ L["Trash Mobs"], "UBRSTrash" },
	},
	["KarazhanCrypt"] = {
		{ L["Marrowspike"], "KCMarrowspike" },
		{ L["Hivaxxis"], "KCHivaxxis" },
		{ L["Corpsemuncher"], "KCCorpsemuncher" },
		{ "Guard Captain Gort", "KCGuardCaptainGort" },
		{ L["Archlich Enkhraz"], "KCArchlichEnkhraz" },
		{ "Commander Anderson", "KCCommanderAnderson" },
		{ L["Alarus"], "KCAlarus" },
		{ "Half-Buried Treasure Chest", "KCTreasure" },
	},
	["CavernsOfTimeBlackMorass"] = {
		{ L["Chronar"], "COTBMChronar" },
		{ L["Harbinger Aph'ygth"], "COTBMHarbingerAphygth" },
		{ L["Epidamu"], "COTBMEpidamu" },
		{ L["Drifting Avatar of Time"], "COTBMDriftingAvatar" },
		{ L["Time-Lord Epochronos"], "COTBMTimeLordEpochronos" },
		{ L["Mossheart"], "COTBMMossheart" },
		{ L["Rotmaw"], "COTBMRotmaw" },
		{ L["Antnormi"], "COTBMAntnormi" },
		{ L["Trash Mobs"], "COTTrash" },
		--{ L["Infinite Chromie"], "COTBMInfiniteChromie" },
	},
	["StormwindVault"] = {
		{ L["Aszosh Grimflame"], "SWVAszoshGrimflame" },
		{ L["Tham'Grarr"], "SWVThamGrarr" },
		{ L["Black Bride"], "SWVBlackBride" },
		{ L["Damian"], "SWVDamian" },
		{ L["Volkan Cruelblade"], "SWVVolkanCruelblade" },
		{ L["Arc'tiras / Vault Armory Equipment"], "SWVVaultArmoryEquipment" },
		{ L["Trash Mobs"], "SWVTrash" },
	},
	["BlackwingLair"] = {
		{ BB["Razorgore the Untamed"], "BWLRazorgore" },
		{ BB["Vaelastrasz the Corrupt"], "BWLVaelastrasz" },
		{ BB["Broodlord Lashlayer"], "BWLLashlayer" },
		{ BB["Firemaw"], "BWLFiremaw" },
		{ BB["Ebonroc"], "BWLEbonroc" },
		{ BB["Flamegor"], "BWLFlamegor" },
		{ BB["Chromaggus"], "BWLChromaggus" },
		{ BB["Nefarian"], "BWLNefarian" },
		{ L["Trash Mobs"], "BWLTrashMobs" },
	},
	["Deadmines"] = {
		{ BB["Rhahk'Zor"], "DMRhahkZor" },
		{ BB["Miner Johnson"].." ("..L["Rare"]..")", "DMMinerJohnson" },
		{ BB["Sneed"], "DMSneed" },
		{ L["Sneed's Shredder"], "DMSneedsShredder" },
		{ BB["Gilnid"], "DMGilnid" },
		{ BB["Mr. Smite"], "DMMrSmite" },
		{ BB["Cookie"], "DMCookie" },
		{ BB["Captain Greenskin"], "DMCaptainGreenskin" },
		{ BB["Edwin VanCleef"], "DMVanCleef" },
		{ L["Trash Mobs"], "DMTrash" },
	},
	["TheCrescentGrove"] = {
		{ "Grovetender Engryss", "TCGGrovetenderEngryss" },
		{ "Keeper Ranathos", "TCGKeeperRanathos" },
		{ "High Priestess A'lathea", "TCGHighPriestessAlathea" },
		{ "Fenektis the Deceiver", "TCGFenektistheDeceiver" },
		{ "Master Raxxieth", "TCGMasterRaxxieth" },
		{ "Trash Mobs", "TCGTrash" },
	},
	["Gnomeregan"] = {
		{ BB["Grubbis"], "GnGrubbis" },
		{ BB["Viscous Fallout"], "GnViscousFallout" },
		{ BB["Electrocutioner 6000"], "GnElectrocutioner6000" },
		{ BB["Crowd Pummeler 9-60"], "GnCrowdPummeler960" },
		{ BB["Dark Iron Ambassador"], "GnDIAmbassador" },
		{ BB["Mekgineer Thermaplugg"], "GnMekgineerThermaplugg" },
		{ L["Trash Mobs"], "GnTrash" },
	},
	["MoltenCore"] = {
		{ BB["Lucifron"], "MCLucifron" },
		{ BB["Magmadar"], "MCMagmadar" },
		{ BB["Gehennas"], "MCGehennas" },
		{ BB["Garr"], "MCGarr" },
		{ BB["Shazzrah"], "MCShazzrah" },
		{ BB["Baron Geddon"], "MCGeddon" },
		{ BB["Golemagg the Incinerator"], "MCGolemagg" },
		{ BB["Sulfuron Harbinger"], "MCSulfuron" },
		{ BB["Majordomo Executus"], "MCMajordomo" },
		{ BB["Ragnaros"], "MCRagnaros" },
		{ L["Trash Mobs"], "MCTrashMobs" },
		{ L["Random Boss Loot"], "MCRANDOMBOSSDROPS" },
	},
	["Naxxramas"] = {
		{ BB["Patchwerk"], "NAXPatchwerk" },
		{ BB["Grobbulus"], "NAXGrobbulus" },
		{ BB["Gluth"], "NAXGluth" },
		{ BB["Thaddius"], "NAXThaddius" },
		{ BB["Anub'Rekhan"], "NAXAnubRekhan" },
		{ BB["Grand Widow Faerlina"], "NAXGrandWidowFaerlina" },
		{ BB["Maexxna"], "NAXMaexxna" },
		{ BB["Noth the Plaguebringer"], "NAXNoththePlaguebringer" },
		{ BB["Heigan the Unclean"], "NAXHeigantheUnclean" },
		{ BB["Loatheb"], "NAXLoatheb" },
		{ BB["Instructor Razuvious"], "NAXInstructorRazuvious" },
		{ BB["Gothik the Harvester"], "NAXGothiktheHarvester" },
		{ BB["The Four Horsemen"], "NAXTheFourHorsemen" },
		{ BB["Sapphiron"], "NAXSapphiron" },
		{ BB["Kel'Thuzad"], "NAXKelThuzard" },
		{ L["Trash Mobs"], "NAXTrash" },
	},
	["SMGraveyard"] = {
		{ BB["Interrogator Vishas"], "SMVishas" },
		{ BB["Scorn"].." ("..L["Scourge Invasion"]..")", "SMScorn" },
		{ BB["Ironspine"].." ("..L["Rare"]..")", "SMIronspine" },
		{ BB["Azshir the Sleepless"].." ("..L["Rare"]..")", "SMAzshir" },
		{ BB["Fallen Champion"].." ("..L["Rare"]..")", "SMFallenChampion" },
		{ BB["Bloodmage Thalnos"], "SMBloodmageThalnos" },
		{ L["Trash Mobs"], "SMGTrash" },
	},
	["SMLibrary"] = {
		{ BB["Houndmaster Loksey"], "SMHoundmasterLoksey" },
		{ BB["Arcanist Doan"], "SMDoan" },
		{ L["Trash Mobs"], "SMLTrash" },
	},
	["SMArmory"] = {
		{ BB["Herod"], "SMHerod" },
		{ L["Trash Mobs"], "SMATrash" },
	},
	["SMCathedral"] = {
		{ BB["High Inquisitor Fairbanks"], "SMFairbanks" },
		{ BB["Scarlet Commander Mograine"], "SMMograine" },
		{ BB["High Inquisitor Whitemane"], "SMWhitemane" },
		{ L["Trash Mobs"], "SMCTrash" },
	},
	["Scholomance"] = {
		{ L["Blood Steward of Kirtonos"], "SCHOLOBlood" },
		{ BB["Kirtonos the Herald"], "SCHOLOKirtonostheHerald" },
		{ BB["Jandice Barov"], "SCHOLOJandiceBarov" },
		{ BB["Lord Blackwood"].." ("..L["Scourge Invasion"]..")", "SCHOLOLordBlackwood" },
		{ BB["Rattlegore"], "SCHOLORattlegore" },
		{ BB["Death Knight Darkreaver"], "SCHOLODeathKnight" },
		{ BB["Marduk Blackpool"], "SCHOLOMarduk" },
		{ BB["Vectus"], "SCHOLOVectus" },
		{ BB["Ras Frostwhisper"], "SCHOLORasFrostwhisper" },
		{ BB["Kormok"], "SCHOLOKormok" },
		{ BB["Instructor Malicia"], "SCHOLOInstructorMalicia" },
		{ BB["Doctor Theolen Krastinov"], "SCHOLODoctorTheolenKrastinov" },
		{ BB["Lorekeeper Polkelt"], "SCHOLOLorekeeperPolkelt" },
		{ BB["The Ravenian"], "SCHOLOTheRavenian" },
		{ BB["Lord Alexei Barov"], "SCHOLOLordAlexeiBarov" },
		{ BB["Lady Illucia Barov"], "SCHOLOLadyIlluciaBarov" },
		{ BB["Darkmaster Gandling"], "SCHOLODarkmasterGandling" },
		{ L["Trash Mobs"], "SCHOLOTrash" },
	},
	["ShadowfangKeep"] = {
		{ BB["Rethilgore"], "SFKRethilgore" },
		{ L["Fel Steed"], "SFKFelSteed" },
		{ BB["Razorclaw the Butcher"], "SFKRazorclawtheButcher" },
		{ BB["Baron Silverlaine"], "SFKSilverlaine" },
		{ BB["Commander Springvale"], "SFKSpringvale" },
		{ BB["Sever"].." ("..L["Scourge Invasion"]..")", "SFKSever" },
		{ BB["Odo the Blindwatcher"], "SFKOdotheBlindwatcher" },
		{ BB["Deathsworn Captain"].." ("..L["Rare"]..")", "SFKDeathswornCaptain" },
		{ BB["Fenrus the Devourer"], "SFKFenrustheDevourer" },
		{ L["Arugal's Voidwalker"], "SFKArugalsVoidwalker" },
		{ BB["Wolf Master Nandos"], "SFKWolfMasterNandos" },
		{ BB["Archmage Arugal"], "SFKArchmageArugal" },
		{ L["Trash Mobs"], "SFKTrash" },
	},
	["TheStockade"] = {
		{ "Targorr the Dread", "SWStTargorr" },
		{ BB["Kam Deepfury"], "SWStKamDeepfury" },
		{ "Hamhock", "SWStHamhock" },
		{ "Dextren Ward", "SWStDextren" },
		{ "Bazil Thredd", "SWStBazil" },
		{ BB["Bruegal Ironknuckle"].." (".."Rare"..")", "SWStBruegalIronknuckle" },
		{ L["Trash Mobs"], "SWStTrash" },
	},
	["Stratholme"] = {
		{ BB["Skul"].." ("..L["Rare"]..")", "STRATSkull" },
		{ BB["Stratholme Courier"], "STRATStratholmeCourier" },
		{ BB["Postmaster Malown"], "STRATPostmaster" },
		{ L["Fras Siabi"], "STRATFrasSiabi" },
		{ BB["Atiesh"], "STRATAtiesh" },
		{ BB["Balzaphon"].." ("..L["Scourge Invasion"]..")", "STRATBalzaphon" },
		{ BB["Hearthsinger Forresten"].." ("..L["Rare"]..")", "STRATHearthsingerForresten" },
		{ BB["The Unforgiven"], "STRATTheUnforgiven" },
		{ BB["Timmy the Cruel"], "STRATTimmytheCruel" },
		{ BB["Malor the Zealous"], "STRATMalor" },
		{ L["Malor's Strongbox"], "STRATMalorsStrongbox" },
		{ L["Crimson Hammersmith"], "STRATCrimsonHammersmith" },
		{ BB["Cannon Master Willey"], "STRATCannonMasterWilley" },
		{ BB["Archivist Galford"], "STRATArchivistGalford" },
		{ BB["Balnazzar"], "STRATBalnazzar" },
		{ BB["Sothos"].." & "..BB["Jarien"], "STRATSothosJarien" },
		{ BB["Stonespine"].." ("..L["Rare"]..")", "STRATStonespine" },
		{ BB["Baroness Anastari"], "STRATBaronessAnastari" },
		{ L["Black Guard Swordsmith"], "STRATBlackGuardSwordsmith" },
		{ BB["Nerub'enkan"], "STRATNerubenkan" },
		{ BB["Maleki the Pallid"], "STRATMalekithePallid" },
		{ BB["Magistrate Barthilas"], "STRATMagistrateBarthilas" },
		{ BB["Ramstein the Gorger"], "STRATRamsteintheGorger" },
		{ BB["Baron Rivendare"], "STRATBaronRivendare" },
		{ L["Trash Mobs"], "STRATTrash" },
	},
	["SunkenTemple"] = {
		{ L["Balcony Minibosses"], "STBalconyMinibosses" },
		{ BB["Atal'alarion"], "STAtalalarion" },
		{ L["Spawn of Hakkar"], "STSpawnOfHakkar" },
		{ BB["Avatar of Hakkar"], "STAvatarofHakkar" },
		{ BB["Jammal'an the Prophet"], "STJammalan" },
		{ BB["Ogom the Wretched"], "STOgom" },
		{ BB["Dreamscythe"], "STDreamscythe" },
		{ BB["Weaver"], "STWeaver"},
		{ BB["Morphaz"], "STMorphaz" },
		{ BB["Hazzas"], "STHazzas" },
		{ BB["Shade of Eranikus"], "STEranikus" },
		{ L["Trash Mobs"], "STTrash" },
	},
	["Uldaman"] = {
		{ BB["Baelog"], "UldBaelog" },
		{ BB["Olaf"], "UldOlaf" },
		{ BB["Eric \"The Swift\""], "UldEric" },
		{ BB["Revelosh"], "UldRevelosh" },
		{ BB["Ironaya"], "UldIronaya" },
		{ BB["Ancient Stone Keeper"], "UldAncientStoneKeeper" },
		{ BB["Galgann Firehammer"], "UldGalgannFirehammer" },
		{ BB["Grimlok"], "UldGrimlok" },
		{ BB["Archaedas"], "UldArchaedas" },
		{ L["Trash Mobs"], "UldTrash" },
	},
	["GilneasCity"] = {
		{ L["Matthias Holtz"], "GCMatthiasHoltz" },
		{ L["Packmaster Ragetooth"], "GCPackmasterRagetooth" },
		{ L["Judge Sutherland"], "GCJudgeSutherland" },
		{ L["Dustivan Blackcowl"], "GCDustivanBlackcowl" },
		{ L["Marshal Magnus Greystone"], "GCMarshalMagnusGreystone" },
		{ L["Horsemaster Levvin"], "GCHorsemasterLevvin" },
		{ L["Harlow Family Chest"], "GCHarlowFamilyChest" },
		{ L["Genn Greymane"], "GCGennGreymane" },
		{ L["Trash Mobs"], "GCTrash" },
	},
	["ZulGurub"] = {
		{ BB["High Priestess Jeklik"], "ZGJeklik" },
		{ BB["High Priest Venoxis"], "ZGVenoxis" },
		{ BB["High Priestess Mar'li"], "ZGMarli" },
		{ BB["Bloodlord Mandokir"], "ZGMandokir" },
		{ BB["Gri'lek"], "ZGGrilek" },
		{ BB["Hazza'rah"], "ZGHazzarah" },
		{ BB["Renataki"], "ZGRenataki" },
		{ BB["Wushoolay"], "ZGWushoolay" },
		{ BB["Gahz'ranka"], "ZGGahzranka" },
		{ BB["High Priest Thekal"], "ZGThekal" },
		{ BB["High Priestess Arlokk"], "ZGArlokk" },
		{ BB["Jin'do the Hexxer"], "ZGJindo" },
		{ BB["Hakkar"], "ZGHakkar" },
		{ L["Random Boss Loot"], "ZGShared" },
		{ L["Trash Mobs"], "ZGTrash1" },
		{ L["ZG Enchants"], "ZGEnchants" },
	},
	["BlackfathomDeeps"] = {
		{ BB["Ghamoo-ra"], "BFDGhamoora" },
		{ BB["Lady Sarevess"], "BFDLadySarevess" },
		{ BB["Gelihast"], "BFDGelihast" },
		{ BB["Baron Aquanis"], "BFDBaronAquanis" },
		{ BB["Twilight Lord Kelris"], "BFDTwilightLordKelris" },
		{ BB["Old Serra'kis"], "BFDOldSerrakis" },
		{ BB["Aku'mai"], "BFDAkumai" },
		{ L["Trash Mobs"], "BFDTrash" },
	},
	["DireMaulEast"] = {
		{ BB["Pusillin"], "DMEPusillin" },
		{ BB["Zevrim Thornhoof"], "DMEZevrimThornhoof" },
		{ BB["Hydrospawn"], "DMEHydro" },
		{ BB["Lethtendris"], "DMELethtendris" },
		{ BB["Pimgib"], "DMEPimgib" },
		{ BB["Alzzin the Wildshaper"], "DMEAlzzin" },
		{ BB["Isalien"], "DMEIsalien" },
		{ L["Felvine Shard"], "DMEShard" },
		{ L["A Dusty Tome"], "DMTome" },
		{ L["Trash Mobs"], "DMETrash" },
	},
	["DireMaulWest"] = {
		{ BB["Tendris Warpwood"], "DMWTendrisWarpwood" },
		{ BB["Illyanna Ravenoak"], "DMWIllyannaRavenoak" },
		{ BB["Magister Kalendris"], "DMWMagisterKalendris" },
		{ BB["Tsu'zee"].." ("..L["Rare"]..")", "DMWTsuzee" },
		{ BB["Revanchion"].." ("..L["Scourge Invasion"]..")", "DMWRevanchion" },
		{ BB["Immol'thar"], "DMWImmolthar" },
		{ BB["Lord Hel'nurath"].." ("..L["Rare"]..")", "DMWHelnurath" },
		{ BB["Prince Tortheldrin"], "DMWPrinceTortheldrin" },
		{ L["Trash Mobs"], "DMWTrash" },
		{ L["Dire Maul Books"], "DMBooks" }, 
	},
	["DireMaulNorth"] = {
		{ BB["Guard Mol'dar"], "DMNGuardMoldar" },
		{ L["Stomper Kreeg"], "DMNStomperKreeg" },
		{ BB["Guard Fengus"], "DMNGuardFengus" },
		{ L["Knot Thimblejack"], "DMNThimblejack" },
		{ BB["Guard Slip'kik"], "DMNGuardSlipkik" },
		{ BB["Captain Kromcrush"], "DMNCaptainKromcrush" },
		{ BB["Cho'Rush the Observer"], "DMNChoRush" },
		{ BB["King Gordok"], "DMNKingGordok" },
		{ L["Tribute Run"], "DMNTRIBUTERUN" },
		{ L["Trash Mobs"], "DMNTrash" },
		{ L["Dire Maul Books"], "DMBooks" },
	},
	["Maraudon"] = {
		{ BB["Noxxion"], "MaraNoxxion" },
		{ BB["Razorlash"], "MaraRazorlash" },
		{ BB["Lord Vyletongue"], "MaraLordVyletongue" },
		{ BB["Meshlok the Harvester"].." ("..L["Rare"]..")", "MaraMeshlok" },
		{ BB["Celebras the Cursed"], "MaraCelebras" },
		{ BB["Landslide"], "MaraLandslide" },
		{ BB["Tinkerer Gizlock"], "MaraTinkererGizlock" },
		{ BB["Rotgrip"], "MaraRotgrip" },
		{ BB["Princess Theradras"], "MaraPrincessTheradras" },
		{ L["Trash Mobs"], "MaraTrash" },
	},
	["Onyxia"] = {
		{ BB["Onyxia"], "Onyxia" },
	},
	["RagefireChasm"] = {
		{ BB["Taragaman the Hungerer"], "RFCTaragaman" },
		{ BB["Oggleflint"], "RFCOggleflint" },
		{ BB["Jergosh the Invoker"], "RFCJergosh" },
		{ BB["Bazzalan"], "RFCBazzalan" },
	},
	["RazorfenDowns"] = {
		{ BB["Tuten'kash"], "RFDTutenkash" },
		{ BB["Lady Falther'ess"].." ("..L["Scourge Invasion"]..")", "RFDLadyF" },
		{ BB["Plaguemaw the Rotting"], "RFDPlaguemaw" },
		{ BB["Mordresh Fire Eye"], "RFDMordreshFireEye" },
		{ BB["Glutton"], "RFDGlutton" },
		{ BB["Ragglesnout"].." ("..L["Rare"]..")", "RFDRagglesnout" },
		{ BB["Amnennar the Coldbringer"], "RFDAmnennar" },
		{ L["Trash Mobs"], "RFDTrash" },
	},
	["RazorfenKraul"] = {
		{ BB["Aggem Thorncurse"], "RFKAggem" },
		{ BB["Death Speaker Jargba"], "RFKDeathSpeakerJargba" },
		{ BB["Overlord Ramtusk"], "RFKOverlordRamtusk" },
		{ L["Razorfen Spearhide"].." ("..L["Rare"]..")", "RFKRazorfenSpearhide" },
		{ BB["Agathelos the Raging"], "RFKAgathelos" },
		{ BB["Blind Hunter"].." ("..L["Rare"]..")", "RFKBlindHunter" },
		{ BB["Charlga Razorflank"], "RFKCharlgaRazorflank" },
		{ BB["Earthcaller Halmgar"].." ("..L["Rare"]..")", "RFKEarthcallerHalmgar" },
		{ L["Trash Mobs"], "RFKTrash" },
	},
	["RuinsofAQ"] = {
		{ BB["Kurinnaxx"], "AQ20Kurinnaxx" },
		{ BB["Lieutenant General Andorov"], "AQ20Andorov" },
		{ AtlasLoot_TableNames["AQ20CAPTAIN"][1], "AQ20CAPTAIN" },
		{ BB["General Rajaxx"], "AQ20Rajaxx" },
		{ BB["Moam"], "AQ20Moam" },
		{ BB["Buru the Gorger"], "AQ20Buru" },
		{ BB["Ayamiss the Hunter"], "AQ20Ayamiss" },
		{ BB["Ossirian the Unscarred"], "AQ20Ossirian" },
		{ L["Trash Mobs"], "AQ20Trash" },
		{ L["Class Books"], "AQ20ClassBooks" },
		{ L["AQ Enchants"], "AQEnchants" },
	},
	["TempleofAQ"] = {
		{ BB["The Prophet Skeram"], "AQ40Skeram" },
		{ L["The Bug Family"], "AQ40Trio" },
		{ BB["Battleguard Sartura"], "AQ40Sartura" },
		{ BB["Fankriss the Unyielding"], "AQ40Fankriss" },
		{ BB["Viscidus"], "AQ40Viscidus" },
		{ BB["Princess Huhuran"], "AQ40Huhuran" },
		{ BB["The Twin Emperors"], "AQ40Emperors" },
		{ BB["Ouro"], "AQ40Ouro" },
		{ BB["C'Thun"], "AQ40CThun" },
		{ L["Trash Mobs"], "AQ40Trash1" },
		{ L["AQ Enchants"], "AQEnchants" },
		{ L["AQ Opening Quest Chain"], "AQOpening" },
	},
	["WailingCaverns"] = {
		{ BB["Lord Cobrahn"], "WCLordCobrahn" },
		{ BB["Lady Anacondra"], "WCLadyAnacondra" },
		{ BB["Kresh"], "WCKresh" },
		{ BB["Lord Pythas"], "WCLordPythas" },
		{ BB["Skum"], "WCSkum" },
		{ BB["Lord Serpentis"], "WCLordSerpentis" },
		{ BB["Verdan the Everliving"], "WCVerdan" },
		{ BB["Mutanus the Devourer"], "WCMutanus" },
		{ BB["Deviate Faerie Dragon"].." ("..L["Rare"]..")", "WCDeviateFaerieDragon" },
		{ L["Trash Mobs"], "WCTrash" },
	},
	["ZulFarrak"] = {
		{ BB["Antu'sul"], "ZFAntusul" },
		{ BB["Witch Doctor Zum'rah"], "ZFWitchDoctorZumrah" },
		{ BB["Shadowpriest Sezz'ziz"], "ZFSezzziz" },
		{ L["Dustwraith"].." ("..L["Rare"]..")", "ZFDustwraith" },
		{ L["Zerillis"].." ("..L["Rare"]..")", "ZFZerillis" },
		{ BB["Gahz'rilla"], "ZFGahzrilla" },
		{ BB["Chief Ukorz Sandscalp"], "ZFChiefUkorzSandscalp" },
		{ L["Trash Mobs"], "ZFTrash" },
	},
	["EmeraldSanctum"] = {
		{ L["Erennius"], "ESErennius" },
		{ L["Solnius the Awakener"], "ESSolnius1" },
		{ L["Solnius the Awakener (Page 2)"], "ESSolnius2" },
		{ L["Favor of Erennius (ES Hard Mode)"], "ESHardMode" },
		{ L["Trash Mobs"], "ESTrash" },
	},
	["LowerKara"] = {
		{ L["Master Blacksmith Rolfen"], "LKHRolfen" },
		{ L["Brood Queen Araxxna"], "LKHBroodQueenAraxxna" },
		{ L["Lord Blackwald II"], "LKHLordBlackwaldII" },
		{ L["Clawlord Howlfang"], "LKHClawlordHowlfang" },
		{ L["Grizikil"], "LKHGrizikil" },
		{ L["Moroes"], "LKHMoroes" },
		{ L["Trash Mobs"], "LKHTrash" },
		{ L["LKH Enchants"], "LKHEnchants" },
	},
	["WorldBosses"] = {
		{ BB["Azuregos"], "AAzuregos" },
		{ BB["Emeriss"], "DEmeriss" },
		{ BB["Lethon"], "DLethon"},
		{ BB["Taerar"], "DTaerar" },
		{ BB["Ysondre"], "DYsondre" },
		{ BB["Lord Kazzak"], "KKazzak"},
		{ "Turtlhu, the Black Turtle of Doom", "Turtlhu" },
		{ "Nerubian Overseer", "Nerubian" },
		{ "Dark Reaver of Karazhan", "Reaver" },
		{ "Ostarius", "Ostarius" },
		{ "Concavius", "Concavius" },
		{ "There Is No Cow Level", "CowKing" },
	},
	["Raremobs"] = {
		{ "Tarangos <The Dampener>", "Tarangos" },
		{ "Blademaster Kargron", "Kargron" },
		{ "Xalvic Blackclaw", "Xalvic" },
		{ "Mallon The Moontouched", "Mallon" },
		{ "Grug'thok the Seer", "Grugthok" },
		{ "The Wandering Knight", "WanderingKnight" },
		{ "Crusader Larsarius <The Scarlet Crusade>", "CrusaderLarsarius" },
		{ "Zareth Terrorblade <Demon Hunter>", "Zareth" },
		{ "Jal'akar <Dire Troll>", "Jalakar" },
		{ "Explorer Ashbeard", "Ashbeard" },
		{ "Admiral Barean Westwind", "AdmiralBareanWestwind" },
	},
	["AbyssalCouncil1"] = {
		{ L["Abyssal Council"].." - "..L["Templars"], "AbyssalTemplars" },
		{ L["Abyssal Council"].." - "..L["Dukes"], "AbyssalDukes" },
		{ L["Abyssal Council"].." - "..L["High Council"], "AbyssalLords" },
	},
	["Winterviel"] = {
		{ L["Feast of Winter Veil"], "Winterviel1", "Table" },
		{ "Snowball", "WintervielSnowball", "Table" },
	},
	["Factions"] = {
		{ BF["Argent Dawn"], "Argent1" },
		{ BF["Bloodsail Buccaneers"], "Bloodsail1" },
		{ BF["Brood of Nozdormu"], "AQBroodRings" },
		{ BF["Cenarion Circle"], "Cenarion1" },
		{ BF["Frostwolf Clan"], "Frostwolf1" },
		{ BF["Gelkis Clan Centaur"], "GelkisClan1" },
		{ BF["Hydraxian Waterlords"], "WaterLords1" },
		{ BF["Magram Clan Centaur"], "MagramClan1" },
		{ BF["Stormpike Guard"], "Stormpike1" },
		{ BF["Thorium Brotherhood"], "Thorium1" },
		{ BF["Timbermaw Hold"], "Timbermaw" },
		{ BF["Wintersaber Trainers"], "Wintersaber1" },
		{ BF["Zandalar Tribe"], "Zandalar1" },
		{ "Silvermoon Remnant", "Helf" },
		{ L["Wildhammer Clan"], "Wildhammer" },
		{ "Wardens of Time", "Warderns1" },
		{ "Ironforge", "Ironforge" },
		{ "Darnassus", "Darnassus" },
		{ "Stormwind", "Stormwind" },
		{ "Gnomeregan Exiles", "GnomereganExiles" },
		{ "Darkspear Trolls", "DarkspearTrolls" },
		{ "Durotar Labor Union", "DurotarLaborUnion" },
		{ "Undercity", "Undercity" },
		{ "Orgrimmar", "Orgrimmar" },
		{ "Thunder Bluff", "ThunderBluff" },
		{ "Dalaran", "Dalaran" },
		{ L["Darkmoon Faire"], "Darkmoon" },
		{ L["Revantusk Trolls"], "Revantusk" },
	},
	["BoEWorldEpics"] = {
		{ AtlasLoot_TableNames["WorldEpics3"][1], "WorldEpics3" },
		{ AtlasLoot_TableNames["WorldEpics2"][1], "WorldEpics2" },
		{ AtlasLoot_TableNames["WorldEpics1"][1], "WorldEpics1" },
	},
	["BoEWorldBlues"] = {
		{ AtlasLoot_TableNames["WorldBluesHead"][1], "WorldBluesHead" },
		{ AtlasLoot_TableNames["WorldBluesNeck"][1], "WorldBluesNeck" },
		{ AtlasLoot_TableNames["WorldBluesShoulder"][1], "WorldBluesShoulder" },
		{ AtlasLoot_TableNames["WorldBluesBack"][1], "WorldBluesBack" },
		{ AtlasLoot_TableNames["WorldBluesChest"][1], "WorldBluesChest" },
		{ AtlasLoot_TableNames["WorldBluesWrist"][1], "WorldBluesWrist" },
		{ AtlasLoot_TableNames["WorldBluesHands"][1], "WorldBluesHands" },
		{ AtlasLoot_TableNames["WorldBluesWaist"][1], "WorldBluesWaist" },
		{ AtlasLoot_TableNames["WorldBluesLegs"][1], "WorldBluesLegs" },
		{ AtlasLoot_TableNames["WorldBluesFeet"][1], "WorldBluesFeet" },
		{ AtlasLoot_TableNames["WorldBluesRing"][1], "WorldBluesRing" },
		{ AtlasLoot_TableNames["WorldBluesTrinket"][1], "WorldBluesTrinket" },
		{ AtlasLoot_TableNames["WorldBluesWand"][1], "WorldBluesWand" },
		{ AtlasLoot_TableNames["WorldBluesHeldInOffhand"][1], "WorldBluesHeldInOffhand" },
		{ AtlasLoot_TableNames["WorldBlues1HAxes"][1], "WorldBlues1HAxes" },
		{ AtlasLoot_TableNames["WorldBlues1HMaces"][1], "WorldBlues1HMaces" },
		{ AtlasLoot_TableNames["WorldBlues1HSwords"][1], "WorldBlues1HSwords" },
		{ AtlasLoot_TableNames["WorldBlues2HAxes"][1], "WorldBlues2HAxes" },
		{ AtlasLoot_TableNames["WorldBlues2HMaces"][1], "WorldBlues2HMaces" },
		{ AtlasLoot_TableNames["WorldBlues2HSwords"][1], "WorldBlues2HSwords" },
		{ AtlasLoot_TableNames["WorldBluesDaggers"][1], "WorldBluesDaggers" },
		{ AtlasLoot_TableNames["WorldBluesFistWeapons"][1], "WorldBluesFistWeapons" },
		{ AtlasLoot_TableNames["WorldBluesPolearms"][1], "WorldBluesPolearms" },
		{ AtlasLoot_TableNames["WorldBluesStaves"][1], "WorldBluesStaves" },
		{ AtlasLoot_TableNames["WorldBluesBows"][1], "WorldBluesBows" },
		{ AtlasLoot_TableNames["WorldBluesCrossbows"][1], "WorldBluesCrossbows" },
		{ AtlasLoot_TableNames["WorldBluesGuns"][1], "WorldBluesGuns" },
		{ AtlasLoot_TableNames["WorldBluesShields"][1], "WorldBluesShields" },
	},
	["CraftSetBlacksmithM"] = {
		{ BIS["Bloodsoul Embrace"], "BloodsoulEmbrace" },
		{ "Hateforge Armor", "HateforgeArmor" },
		{ "Towerforge Battlegear", "TowerforgeBattlegear" },
	},
	["CraftSetBlacksmithP"] = {
		{ "Steel Plate", "SteelPlate" },
		{ BIS["Imperial Plate"], "ImperialPlate" },
		{ "Rune-Etched Armor", "RuneEtchedArmor" },
		{ BIS["The Darksoul"], "TheDarksoul" },
		{ "Dreamsteel Armor", "DreamsteelArmor" },
	},
	["CraftSetLeatherworkL"] = {
		{ "Grifter's Armor", "GriftersArmor" },
		{ "Primalist's Trappings", "PrimalistsTrappings" },
		{ BIS["Volcanic Armor"], "VolcanicArmor" },
		{ BIS["Ironfeather Armor"], "IronfeatherArmor" },
		{ BIS["Stormshroud Armor"], "StormshroudArmor" },
		{ BIS["Devilsaur Armor"], "DevilsaurArmor" },
		{ BIS["Blood Tiger Harness"], "BloodTigerH" },
		{ BIS["Primal Batskin"], "PrimalBatskin" },
		{ "Convergence of the Elements", "ConvergenceoftheElements" },
		{ "Dreamhide Battlegarb", "DreamhideBattlegarb" },
	},
	["CraftSetLeatherworkM"] = {
		{ "Red Dragon Mail", "RedDragonM" },
		{ BIS["Green Dragon Mail"], "GreenDragonM" },
		{ BIS["Blue Dragon Mail"], "BlueDragonM" },
		{ BIS["Black Dragon Mail"], "BlackDragonM" },
	},
	["CraftSetTailoringC"] = {
		{ "Augerer's Attire", "AugerersAttire" },
		{ "Shadoweave", "ShadoweaveSet" },
		{ "Diviner's Garments", "DivinersGarments" },
		{ "Pillager's Garb", "PillagersGarb" },
		{ "Mooncloth Regalia", "MoonclothRegalia" },
		{ "Bloodvine Garb", "BloodvineG" },
		{ "Flarecore Regalia", "FlarecoreRegalia" },
		{ "Dreamthread Regalia", "DreamthreadRegalia" },
	},
	["DungeonSets12"] = {
		{ "|cffffffff"..BC["Priest"], "T0Priest" },
		{ "|cff68ccef"..BC["Mage"], "T0Mage" },
		{ "|cff9382c9"..BC["Warlock"], "T0Warlock" },
		{ "|cfffff468"..BC["Rogue"], "T0Rogue" },
		{ "|cffff7c0a"..BC["Druid"], "T0Druid" },
		{ "|cffaad372"..BC["Hunter"], "T0Hunter" },
		{ "|cff2773ff"..BC["Shaman"], "T0Shaman" },
		{ "|cfff48cba"..BC["Paladin"], "T0Paladin" },
		{ "|cffc69b6d"..BC["Warrior"], "T0Warrior" },
	},
	["AQ20Sets"] = {
		{ "|cffffffff"..BC["Priest"], "AQ20Priest" },
		{ "|cff68ccef"..BC["Mage"], "AQ20Mage" },
		{ "|cff9382c9"..BC["Warlock"], "AQ20Warlock" },
		{ "|cfffff468"..BC["Rogue"], "AQ20Rogue" },
		{ "|cffff7c0a"..BC["Druid"], "AQ20Druid" },
		{ "|cffaad372"..BC["Hunter"], "AQ20Hunter" },
		{ "|cff2773ff"..BC["Shaman"], "AQ20Shaman" },
		{ "|cfff48cba"..BC["Paladin"], "AQ20Paladin" },
		{ "|cffc69b6d"..BC["Warrior"], "AQ20Warrior" },
	},
	["AQ40Sets"] = {
		{ "|cffffffff"..BC["Priest"], "AQ40Priest" },
		{ "|cff68ccef"..BC["Mage"], "AQ40Mage" },
		{ "|cff9382c9"..BC["Warlock"], "AQ40Warlock" },
		{ "|cfffff468"..BC["Rogue"], "AQ40Rogue" },
		{ "|cffff7c0a"..BC["Druid"], "AQ40Druid" },
		{ "|cffaad372"..BC["Hunter"], "AQ40Hunter" },
		{ "|cff2773ff"..BC["Shaman"], "AQ40Shaman" },
		{ "|cfff48cba"..BC["Paladin"], "AQ40Paladin" },
		{ "|cffc69b6d"..BC["Warrior"], "AQ40Warrior" },
	},
	["T1Sets"] = {
		{ "|cffffffff"..BC["Priest"], "T1Priest" },
		{ "|cff68ccef"..BC["Mage"], "T1Mage" },
		{ "|cff9382c9"..BC["Warlock"], "T1Warlock" },
		{ "|cfffff468"..BC["Rogue"], "T1Rogue" },
		{ "|cffff7c0a"..BC["Druid"], "T1Druid" },
		{ "|cffaad372"..BC["Hunter"], "T1Hunter" },
		{ "|cff2773ff"..BC["Shaman"], "T1Shaman" },
		{ "|cfff48cba"..BC["Paladin"], "T1Paladin" },
		{ "|cffc69b6d"..BC["Warrior"], "T1Warrior" },
	},
	["T2Sets"] = {
		{ "|cffffffff"..BC["Priest"], "T2Priest" },
		{ "|cff68ccef"..BC["Mage"], "T2Mage" },
		{ "|cff9382c9"..BC["Warlock"], "T2Warlock" },
		{ "|cfffff468"..BC["Rogue"], "T2Rogue" },
		{ "|cffff7c0a"..BC["Druid"], "T2Druid" },
		{ "|cffaad372"..BC["Hunter"], "T2Hunter" },
		{ "|cff2773ff"..BC["Shaman"], "T2Shaman" },
		{ "|cfff48cba"..BC["Paladin"], "T2Paladin" },
		{ "|cffc69b6d"..BC["Warrior"], "T2Warrior" },
	},
	["T3Sets"] = {
		{ "|cffffffff"..BC["Priest"], "T3Priest" },
		{ "|cff68ccef"..BC["Mage"], "T3Mage" },
		{ "|cff9382c9"..BC["Warlock"], "T3Warlock" },
		{ "|cfffff468"..BC["Rogue"], "T3Rogue" },
		{ "|cffff7c0a"..BC["Druid"], "T3Druid" },
		{ "|cffaad372"..BC["Hunter"], "T3Hunter" },
		{ "|cff2773ff"..BC["Shaman"], "T3Shaman" },
		{ "|cfff48cba"..BC["Paladin"], "T3Paladin" },
		{ "|cffc69b6d"..BC["Warrior"], "T3Warrior" },
	},
	["ZGSets"] = {
		{ "|cffffffff"..BC["Priest"], "ZGPriest" },
		{ "|cff68ccef"..BC["Mage"], "ZGMage" },
		{ "|cff9382c9"..BC["Warlock"], "ZGWarlock" },
		{ "|cfffff468"..BC["Rogue"], "ZGRogue" },
		{ "|cffff7c0a"..BC["Druid"], "ZGDruid" },
		{ "|cffaad372"..BC["Hunter"], "ZGHunter" },
		{ "|cff2773ff"..BC["Shaman"], "ZGShaman" },
		{ "|cfff48cba"..BC["Paladin"], "ZGPaladin" },
		{ "|cffc69b6d"..BC["Warrior"], "ZGWarrior" },
	},
	["Pre60Sets"] = {
		{ BIS["Bloodmail Regalia"], "ScholoMail" },
		{ BIS["Cadaverous Garb"], "ScholoLeather" },
		{ BIS["Chain of the Scarlet Crusade"], "SCARLET" },
		{ BIS["Dal'Rend's Arms"], "DalRend" },
		{ BIS["Deathbone Guardian"], "ScholoPlate" },
		{ "Greymane Armor", "GreymaneArmor" },
		{ "Incendosaur Skin Armor", "IncendosaurSkinArmor" },
		{ BIS["Defias Leather"], "DEADMINES" },
		{ BIS["Embrace of the Viper"], "WAILING" },
		{ BIS["Ironweave Battlesuit"], "IRONWEAVE" },
		{ BIS["Necropile Raiment"], "ScholoCloth" },
		{ BIS["Primal Blessing"], "PrimalBlessing" },
		{ L["Scourge Invasion"], "ScourgeInvasion" },
		{ BIS["Shard of the Gods"], "ShardOfGods" },
		{ BIS["Spider's Kiss"], "SpiderKiss" },
		{ BIS["Spirit of Eskhandar"], "SpiritofEskhandar" },
		{ BIS["The Gladiator"], "BLACKROCKD" },
		{ BIS["The Postmaster"], "SCARLET" },
		{ BIS["The Twin Blades of Hakkari"], "HakkariBlades" },
		{ L["Zul'Gurub Rings"], "ZGRings" },
	},
	["WSGRewards"] = {
		{ L["Exalted Reputation Rewards"], "WSGRepExalted60" },
		{ L["Revered Reputation Rewards"], "WSGRepRevered5059" },
		{ L["Honored Reputation Rewards"], "WSGRepHonored5059" },
		{ L["Friendly Reputation Rewards"], "WSGRepFriendly4049" },
	},
	["BRRewards"] = {
		{ L["Exalted Reputation Rewards"], "BRRepExalted" },
		{ L["Revered Reputation Rewards"], "BRRepRevered" },
		{ L["Honored Reputation Rewards"], "BRRepHonored" },
		{ L["Friendly Reputation Rewards"], "BRRepFriendly" },
	},
	["ABRewards"] = {
		{ "Arathi Basin Menu", "ABRepMenu" },
		{ L["Exalted Reputation Rewards"], "ABRepExalted" },
		{ L["Revered Reputation Rewards"], "ABRepRevered5059" },
		{ L["Honored Reputation Rewards"], "ABRepHonored5059" },
		{ L["Friendly Reputation Rewards"], "ABRepFriendly5059" },
	},
	["AVRewards"] = {
		{ L["Exalted Reputation Rewards"], "AVRepExalted" },
		{ L["Revered Reputation Rewards"], "AVRepRevered" },
		{ L["Honored Reputation Rewards"], "AVRepHonored" },
		{ L["Friendly Reputation Rewards"], "AVRepFriendly" },
		{ L["Korrak the Bloodrager"], "AVKorrak" },
		{ L["Ivus & Lokholar"], "AVLokholarIvus" },
	},
	["PvPArmorSets"] = {
		{ BC["Priest"], "PVPPriest" },
		{ BC["Mage"], "PVPMage" },
		{ BC["Warlock"], "PVPWarlock" },
		{ BC["Rogue"], "PVPRogue" },
		{ BC["Druid"], "PVPDruid" },
		{ BC["Hunter"], "PVPHunter" },
		{ BC["Shaman"], "PVPShaman" },
		{ BC["Paladin"], "PVPPaladin" },
		{ BC["Warrior"], "PVPWarrior" },
	},
	["WSGRewards"] = {
		{ "Warsong Gulch Menu", "WSGRepMenu" },
		{ L["Exalted Reputation Rewards"], "WSGRepExalted60" },
		{ L["Revered Reputation Rewards"], "WSGRepRevered5059" },
		{ L["Honored Reputation Rewards"], "WSGRepHonored5059" },
		{ L["Friendly Reputation Rewards"], "WSGRepFriendly4049" },
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
		{ BS["Mining"], "Mining1" },
		{ BS["Smelting"], "Smelting1" },
	},
	["Tailoring"] = {
		{ AtlasLoot_TableNames["TailoringApprentice1"][1], "TailoringApprentice1" },
		{ AtlasLoot_TableNames["TailoringJourneyman1"][1], "TailoringJourneyman1" },
		{ AtlasLoot_TableNames["TailoringExpert1"][1], "TailoringExpert1" },
		{ AtlasLoot_TableNames["TailoringArtisan1"][1], "TailoringArtisan1" },
	},
	["Survival"] = {
		{ AtlasLoot_TableNames["Survival1"][1], "Survival1" },
		{ AtlasLoot_TableNames["Survival2"][1], "Survival2" },
	},
}

--------------------------------------------------------------------------------
-- Item OnEnter
-- Called when a loot item is moused over
--------------------------------------------------------------------------------
function AtlasLootItem_OnEnter()
	local isItem, isEnchant, isSpell
	AtlasLootTooltip:ClearLines()
	for i=1, 30, 1 do
		if _G["AtlasLootTooltipTextRight"..i] ~= nil then
			_G["AtlasLootTooltipTextRight"..i]:SetText("")
		end
	end
	if this.itemID ~= 0 then
		if string.sub(this.itemID, 1, 1) == "s" then
			isItem = false
			isEnchant = false
			isSpell = true
		elseif string.sub(this.itemID, 1, 1) == "e" then
			isItem = false
			isEnchant = true
			isSpell = false
		else
			isItem = true
			isEnchant = false
			isSpell = false
		end
		if isItem then
			local color = strsub(_G["AtlasLootItem_"..this:GetID().."_Name"]:GetText(), 3, 10)
			local name = strsub(_G["AtlasLootItem_"..this:GetID().."_Name"]:GetText(), 11)
			--Lootlink tooltips
			if AtlasLootCharDB.LootlinkTT then
				--If we have seen the item, use the game tooltip to minimise same name item problems
				if GetItemInfo(this.itemID) ~= nil then
					_G[this:GetName().."_Unsafe"]:Hide()
					AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 24)
					AtlasLootTooltip:SetHyperlink("item:"..this.itemID..":0:0:0")
					if AtlasLootCharDB.ItemIDs then
						AtlasLootTooltip:AddLine(BLUE..L["ItemID:"].." "..this.itemID, nil, nil, nil, 1)
					end
					if this.droprate ~= nil then
						AtlasLootTooltip:AddLine(L["Drop Rate: "]..this.droprate, 1, 1, 0)
					end
					AtlasLootTooltip:Show()
					if LootLink_AddItem then
						LootLink_AddItem(name, this.itemID..":0:0:0", color)
					end
				else
					AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 24)
					if LootLink_Database and LootLink_Database[this.itemID] then
						LootLink_SetTooltip(AtlasLootTooltip, LootLink_Database[this.itemID][1], 1)
					else
						LootLink_SetTooltip(AtlasLootTooltip,strsub(_G["AtlasLootItem_"..this:GetID().."_Name"]:GetText(), 11), 1)
					end
					if AtlasLootCharDB.ItemIDs then
						AtlasLootTooltip:AddLine(BLUE..L["ItemID:"].." "..this.itemID, nil, nil, nil, 1)
					end
					if this.droprate ~= nil then
						AtlasLootTooltip:AddLine(L["Drop Rate: "]..this.droprate, 1, 1, 0, 1)
					end
					AtlasLootTooltip:AddLine(" ")
					AtlasLootTooltip:AddLine(L["You can right-click to attempt to query the server. You may be disconnected."], nil, nil, nil, 1)
					AtlasLootTooltip:Show()
				end
				--Item Sync tooltips
			elseif AtlasLootCharDB.ItemSyncTT then
				if GetItemInfo(this.itemID) ~= nil then
					_G[this:GetName().."_Unsafe"]:Hide()
				end
				ISync:ButtonEnter()
				if AtlasLootCharDB.ItemIDs then
					GameTooltip:AddLine(BLUE..L["ItemID:"].." "..this.itemID, nil, nil, nil, 1)
				end
				if this.droprate ~= nil then
					GameTooltip:AddLine(L["Drop Rate: "]..this.droprate, 1, 1, 0)
				end
				GameTooltip:Show()
				--Default game tooltips
			else
				if this.itemID ~= nil then
					if GetItemInfo(this.itemID) ~= nil then
						_G[this:GetName().."_Unsafe"]:Hide()
						AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 24)
						AtlasLootTooltip:SetHyperlink("item:"..this.itemID..":0:0:0")
						if AtlasLootCharDB.ItemIDs then
							AtlasLootTooltip:AddLine(BLUE..L["ItemID:"].." "..this.itemID, nil, nil, nil, 1)
						end
						if this.droprate ~= nil then
							AtlasLootTooltip:AddLine(L["Drop Rate: "]..this.droprate, 1, 1, 0)
						end
						AtlasLootTooltip:Show()
					else
						if AtlasLootTooltipDB[this.itemID] then
							AtlasLoot_GenerateTooltip(AtlasLootTooltipDB[this.itemID])
						else
							AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 24)
							AtlasLootTooltip:ClearLines()
							AtlasLootTooltip:AddLine(RED..L["Item Unavailable"], nil, nil, nil, 1)
							AtlasLootTooltip:AddLine(BLUE..L["ItemID:"].." "..this.itemID, nil, nil, nil, 1)
							AtlasLootTooltip:AddLine(L["This item is unsafe. To view this item without the risk of disconnection, you need to have first seen it in the game world. This is a restriction enforced by Blizzard since Patch 1.10."], nil, nil, nil, 1)
							AtlasLootTooltip:AddLine(" ")
							AtlasLootTooltip:AddLine(L["You can right-click to attempt to query the server. You may be disconnected."], nil, nil, nil, 1)
							AtlasLootTooltip:Show()
						end
					end
				end
			end
		elseif isEnchant then
			spellID = tonumber(string.sub(this.itemID, 2))
			AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 24)
			AtlasLootTooltip:ClearLines()
			AtlasLootTooltip:SetHyperlink("enchant:"..spellID)
			if AtlasLootCharDB.ItemIDs then
				AtlasLootTooltip:AddLine(BLUE..L["SpellID:"].." "..spellID, nil, nil, nil, 1)
			end
			AtlasLootTooltip:Show()
			if GetSpellInfoVanillaDB["enchants"][spellID]["item"] and GetSpellInfoVanillaDB["enchants"][spellID]["item"] ~= nil and GetSpellInfoVanillaDB["enchants"][spellID]["item"] ~= "" then
				AtlasLootTooltip2:SetOwner(AtlasLootTooltip, "ANCHOR_BOTTOMRIGHT", -(AtlasLootTooltip:GetWidth()), 0)
				AtlasLootTooltip2:ClearLines()
				AtlasLootTooltip2:SetHyperlink("item:"..GetSpellInfoVanillaDB["enchants"][spellID]["item"]..":0:0:0")
				if GetSpellInfoVanillaDB["enchants"][spellID]["extra"] and GetSpellInfoVanillaDB["enchants"][spellID]["extra"] ~= nil and GetSpellInfoVanillaDB["enchants"][spellID]["extra"] ~= "" then
					AtlasLootTooltip2:AddLine(GetSpellInfoVanillaDB["enchants"][spellID]["extra"], nil, nil, nil, 1)
				end
				if AtlasLootCharDB.ItemIDs then
					AtlasLootTooltip2:AddLine(BLUE..L["ItemID:"].." "..GetSpellInfoVanillaDB["enchants"][spellID]["item"], nil, nil, nil, 1)
				end
				AtlasLootTooltip2:Show()
			end
		elseif isSpell then
			spellID = tonumber(string.sub(this.itemID, 2))
			local TooltipTools, TooltipReagents = "", ""
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
			AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 24)
			AtlasLootTooltip:ClearLines()
			AtlasLootTooltip:AddLine(GetSpellInfoVanillaDB["craftspells"][spellID]["name"])
			AtlasLootTooltip:AddLine(WHITE..GetSpellInfoVanillaDB["craftspells"][spellID]["castTime"].." sec cast")
			if GetSpellInfoVanillaDB["craftspells"][spellID]["requires"] ~= "" then
				AtlasLootTooltip:AddLine(WHITE.."Requires: "..GetSpellInfoVanillaDB["craftspells"][spellID]["requires"])
			end
			if TooltipTools ~= "" then
				AtlasLootTooltip:AddLine(WHITE.."Tools: "..TooltipTools, nil, nil, nil, 1)
			end
			if TooltipReagents ~= "" then
				AtlasLootTooltip:AddLine(WHITE.."Reagents: "..TooltipReagents, nil, nil, nil, 1)
			end
			if GetSpellInfoVanillaDB["craftspells"][spellID]["text"] ~= "" then
				AtlasLootTooltip:AddLine(GetSpellInfoVanillaDB["craftspells"][spellID]["text"], nil, nil, nil, 1)
			end
			if AtlasLootCharDB.ItemIDs then
				if spellID < 100000 then
					AtlasLootTooltip:AddLine(BLUE..L["SpellID:"].." "..spellID, nil, nil, nil, 1)
				elseif spellID >= 100000 and spellID <= 100005 then
					AtlasLootTooltip:AddLine(BLUE..L["SpellID:"].." 2575", nil, nil, nil, 1)
				elseif spellID >= 100006 and spellID <= 100007 then
					AtlasLootTooltip:AddLine(BLUE..L["SpellID:"].." 2576", nil, nil, nil, 1)
				elseif spellID >= 100008 and spellID <= 100011 then
					AtlasLootTooltip:AddLine(BLUE..L["SpellID:"].." 3564", nil, nil, nil, 1)
				elseif spellID >= 100012 and spellID <= 100024 then
					AtlasLootTooltip:AddLine(BLUE..L["SpellID:"].." 10248", nil, nil, nil, 1)
				end
			end
			AtlasLootTooltip:Show()
			local craftitem2 = GetSpellInfoVanillaDB["craftspells"][spellID]["craftItem"]
			if craftitem2 ~= nil and craftitem2 ~= "" then
				AtlasLootTooltip2:SetOwner(AtlasLootTooltip, "ANCHOR_BOTTOMRIGHT", -(AtlasLootTooltip:GetWidth()), 0)
				AtlasLootTooltip2:ClearLines()
				AtlasLootTooltip2:SetHyperlink("item:"..GetSpellInfoVanillaDB["craftspells"][spellID]["craftItem"]..":0:0:0")
				if GetSpellInfoVanillaDB["craftspells"][spellID]["extra"] and GetSpellInfoVanillaDB["craftspells"][spellID]["extra"] ~= nil then
					AtlasLootTooltip2:AddLine(GetSpellInfoVanillaDB["craftspells"][spellID]["extra"], nil, nil, nil, 1)
				end
				if AtlasLootCharDB.ItemIDs then
					AtlasLootTooltip2:AddLine(BLUE..L["ItemID:"].." "..GetSpellInfoVanillaDB["craftspells"][spellID]["craftItem"], nil, nil, nil, 1)
				end
				AtlasLootTooltip2:Show()
			end
		end
	end
end

function AtlasLoot_GenerateTooltip(tooltip)
 AtlasLootTooltip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 24)
	AtlasLootTooltip:ClearLines()
 curline = 1
 increment = false
 local i = 1
 for i,v in ipairs(tooltip) do
 if increment == false then
 AtlasLootTooltip:AddLine(v, nil, nil, nil, 1)
 increment = true
		else
 _G["AtlasLootTooltipTextRight"..curline]:SetText(v)
 _G["AtlasLootTooltipTextRight"..curline]:Show()
 increment = false
 curline = curline + 1
		end
	end
 AtlasLootTooltip:AddLine(" ")
 AtlasLootTooltip:AddLine(RED..L["Item Unavailable"], nil, nil, nil, 1)
	AtlasLootTooltip:AddLine(BLUE..L["ItemID:"].." "..this.itemID, nil, nil, nil, 1)
	AtlasLootTooltip:AddLine(L["This item is unsafe. To view this item without the risk of disconnection, you need to have first seen it in the game world. This is a restriction enforced by Blizzard since Patch 1.10."], nil, nil, nil, 1)
	AtlasLootTooltip:AddLine(" ")
	AtlasLootTooltip:AddLine(L["You can right-click to attempt to query the server. You may be disconnected."], nil, nil, nil, 1)
 AtlasLootTooltip:Show()
end

--------------------------------------------------------------------------------
-- Item OnLeave
-- Called when the mouse cursor leaves a loot item
--------------------------------------------------------------------------------
function AtlasLootItem_OnLeave()
	--Hide the necessary tooltips
	if AtlasLootCharDB.LootlinkTT then
		AtlasLootTooltip:Hide()
		AtlasLootTooltip2:Hide()
	elseif AtlasLootCharDB.ItemSyncTT then
		if GameTooltip:IsVisible() then
			GameTooltip:Hide()
			AtlasLootTooltip2:Hide()
		end
	else
		if this.itemID ~= nil then
			AtlasLootTooltip:Hide()
			GameTooltip:Hide()
			AtlasLootTooltip2:Hide()
		end
	end
	if ShoppingTooltip2:IsVisible() or ShoppingTooltip1.IsVisible then
		ShoppingTooltip2:Hide()
		ShoppingTooltip1:Hide()
	end
end

--------------------------------------------------------------------------------
-- Item OnClick
-- Called when a loot item is clicked on
--------------------------------------------------------------------------------
function AtlasLootItem_OnClick(arg1)
	local isItem, isEnchant, isSpell
	local color = strsub(_G["AtlasLootItem_"..this:GetID().."_Name"]:GetText(), 1, 10)
	local id = this:GetID()
	local name = strsub(_G["AtlasLootItem_"..this:GetID().."_Name"]:GetText(), 11)
	if string.sub(this.itemID, 1, 1) == "s" then
		isItem = false
		isEnchant = false
		isSpell = true
	elseif string.sub(this.itemID, 1, 1) == "e" then
		isItem = false
		isEnchant = true
		isSpell = false
	else
		isItem = true
		isEnchant = false
		isSpell = false
	end
	if isItem then
		local iteminfo = GetItemInfo(this.itemID)
		local itemName, itemLink, itemQuality, itemMinLevel, itemType, itemSubType, itemCount, itemEquipLoc, itemTexture = GetItemInfo(this.itemID)
		--If shift-clicked, link in the chat window
		if arg1=="RightButton" and not iteminfo and this.itemID ~= 0 then
			AtlasLootTooltip:SetHyperlink("item:"..this.itemID..":0:0:0")
			if not AtlasLootCharDB.ItemSpam then
				DEFAULT_CHAT_FRAME:AddMessage(L["Server queried for "]..color.."["..name.."]".."|r"..L[". Right click on any other item to refresh the loot page."])
			end
			AtlasLootItemsFrame:Hide()
			AtlasLoot_ShowItemsFrame(AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4])
		elseif arg1=="RightButton" and iteminfo then
			AtlasLootItemsFrame:Hide()
			AtlasLoot_ShowItemsFrame(AtlasLootItemsFrame.refresh[1], AtlasLootItemsFrame.refresh[2], AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4])
			if not AtlasLootCharDB.ItemSpam then
				DEFAULT_CHAT_FRAME:AddMessage(itemName..L[" is safe."])
			end
		elseif IsShiftKeyDown() and not iteminfo and this.itemID ~= 0 then
			if AtlasLootCharDB.SafeLinks then
				if WIM_EditBoxInFocus then
					WIM_EditBoxInFocus:Insert("["..name.."]");
				elseif ChatFrameEditBox:IsVisible() then
					ChatFrameEditBox:Insert("["..name.."]");
				else
					AtlasLoot_SayItemReagents(this.itemID, nil, name, true)
				end
			elseif AtlasLootCharDB.AllLinks then
				if WIM_EditBoxInFocus then
					WIM_EditBoxInFocus:Insert("\124"..string.sub(color, 2).."|Hitem:"..this.itemID.."\124h["..name.."]|h|r");
				elseif ChatFrameEditBox:IsVisible() then
					ChatFrameEditBox:Insert("\124"..string.sub(color, 2).."|Hitem:"..this.itemID.."\124h["..name.."]|h|r");
				else
					AtlasLoot_SayItemReagents(this.itemID, color, name)
				end
			end
		elseif (ChatFrameEditBox:IsVisible() and iteminfo and IsShiftKeyDown()) and this.itemID ~= 0 then
			if WIM_EditBoxInFocus then
				WIM_EditBoxInFocus:Insert(color.."|Hitem:"..this.itemID..":0:0:0|h["..name.."]|h|r");
			elseif ( ChatFrameEditBox:IsVisible() ) then 
				ChatFrameEditBox:Insert(color.."|Hitem:"..this.itemID..":0:0:0|h["..name.."]|h|r");
			end
		elseif IsShiftKeyDown() and iteminfo and this.itemID ~= 0 then
			AtlasLoot_SayItemReagents(this.itemID, color, name)
			--If control-clicked, use the dressing room
		elseif IsControlKeyDown() and iteminfo then
			DressUpItemLink(itemLink)
		elseif IsAltKeyDown() and this.itemID ~= 0 then
			if AtlasLootItemsFrame.refresh[1] == "WishList" then
				AtlasLoot_DeleteFromWishList(this.itemID)
			elseif AtlasLootItemsFrame.refresh[1] == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.itemID))
			else
				AtlasLoot_AddToWishlist(this.itemID, strsplit("\\", _G["AtlasLootItem_"..this:GetID().."_Icon"]:GetTexture(), 0, true), this.itemIDName, this.itemIDExtra, AtlasLootItemsFrame.refresh[1].."|"..AtlasLootItemsFrame.refresh[2])
			end
		elseif (AtlasLootItemsFrame.refresh[1] == "SearchResult" or AtlasLootItemsFrame.refresh[1] == "WishList") and this.sourcePage then
			local dataID, dataSource = strsplit("|", this.sourcePage)
			if dataID and dataSource and AtlasLoot_IsLootTableAvailable(dataID) then
				AtlasLoot_ShowItemsFrame(dataID, dataSource, AtlasLoot_TableNames[dataID][1], AtlasLootItemsFrame.refresh[4])
			end
		end
	elseif isEnchant then
		if IsShiftKeyDown() then
			--[[if ChatFrameEditBox:IsVisible() then
				ChatFrameEditBox:Insert(color.."|Henchant:"..string.sub(this.itemID, 2)..":0:0:0|h["..name.."]|h|r")
		else]]
			AtlasLoot_SayItemReagents(this.itemID)
			--end
		elseif IsAltKeyDown() and this.itemID ~= 0 then
			if AtlasLootItemsFrame.refresh[1] == "WishList" then
				AtlasLoot_DeleteFromWishList(this.itemID)
			elseif AtlasLootItemsFrame.refresh[1] == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.itemID))
			else
				AtlasLoot_AddToWishlist(this.itemID, strsplit("\\", _G["AtlasLootItem_"..this:GetID().."_Icon"]:GetTexture(), 0, true), this.itemIDName, this.itemIDExtra, AtlasLootItemsFrame.refresh[1].."|"..AtlasLootItemsFrame.refresh[2])
			end
		elseif IsControlKeyDown() then
			DressUpItemLink("item:"..this.dressingroomID..":0:0:0")
		elseif (AtlasLootItemsFrame.refresh[1] == "SearchResult" or AtlasLootItemsFrame.refresh[1] == "WishList") and this.sourcePage then
			local dataID, dataSource = strsplit("|", this.sourcePage)
			if dataID and dataSource and AtlasLoot_IsLootTableAvailable(dataID) then
				AtlasLoot_ShowItemsFrame(dataID, dataSource, AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4])
			end
		end
	elseif isSpell then
		if IsShiftKeyDown() then
			if tonumber(string.sub(this.itemID, 2)) < 100000 then
				if WIM_EditBoxInFocus then
					local craftitem = GetSpellInfoVanillaDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]
					if craftitem ~= nil and craftitem ~= "" then
						local craftname = GetItemInfo(craftitem)
						WIM_EditBoxInFocus:Insert("\124"..string.sub(color, 2).."|Hitem:"..craftitem.."\124h["..craftname.."]|h|r");
					else
						WIM_EditBoxInFocus:Insert(name);
					end
				elseif ChatFrameEditBox:IsVisible() then
					local craftitem = GetSpellInfoVanillaDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]
					if craftitem ~= nil and craftitem ~= "" then
						local craftname = GetItemInfo(craftitem)
						--ChatFrameEditBox:Insert("\124"..string.sub(color, 2).."|Hitem:"..craftitem.."\124h["..craftname.."]|h|r");
						ChatFrameEditBox:Insert("\124"..string.sub(color, 2).."|Hitem:"..craftitem..":0:0:0\124h["..craftname.."]|h|r"); -- Fix for Gurky's discord chat bot
					else
						ChatFrameEditBox:Insert(name);
					end
				else
					AtlasLoot_SayItemReagents(this.itemID)
				end
			else
				if WIM_EditBoxInFocus then
					local craftitem = GetSpellInfoVanillaDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]
					if craftitem ~= nil and craftitem ~= "" then
						local craftname = GetItemInfo(craftitem)
						WIM_EditBoxInFocus:Insert(AtlasLoot_GetChatLink(GetSpellInfoVanillaDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]));
					else
						WIM_EditBoxInFocus:Insert(name);
					end
				elseif ChatFrameEditBox:IsVisible() then
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
					SendChatMessage(AtlasLoot_GetChatLink(GetSpellInfoVanillaDB["craftspells"][tonumber(string.sub(this.itemID, 2))]["craftItem"]),channel,nil,chatnumber)
				end
			end
			elseif IsAltKeyDown() and this.itemID ~= 0 then
			if AtlasLootItemsFrame.refresh[1] == "WishList" then
				AtlasLoot_DeleteFromWishList(this.itemID)
			elseif AtlasLootItemsFrame.refresh[1] == "SearchResult" then
				AtlasLoot_AddToWishlist(AtlasLoot:GetOriginalDataFromSearchResult(this.itemID))
			else
				AtlasLoot_AddToWishlist(this.itemID, strsplit("\\", _G["AtlasLootItem_"..this:GetID().."_Icon"]:GetTexture(), 0, true), this.itemIDName, this.itemIDExtra, AtlasLootItemsFrame.refresh[1].."|"..AtlasLootItemsFrame.refresh[2])
			end
		elseif IsControlKeyDown() then
			DressUpItemLink("item:"..this.dressingroomID..":0:0:0")
		elseif (AtlasLootItemsFrame.refresh[1] == "SearchResult" or AtlasLootItemsFrame.refresh[1] == "WishList") and this.sourcePage then
			local dataID, dataSource = strsplit("|", this.sourcePage)
			if dataID and dataSource and AtlasLoot_IsLootTableAvailable(dataID) then
				AtlasLoot_ShowItemsFrame(dataID, dataSource, AtlasLootItemsFrame.refresh[3], AtlasLootItemsFrame.refresh[4])
			end
		end
	end
end

--[[
	AtlasLoot_QueryLootPage()
	Querys all valid items on the current loot page.
]]
function AtlasLoot_QueryLootPage()
	i=1
	while i<31 do
		button = _G["AtlasLootItem_"..i]
		queryitem = button.itemID
		if queryitem and queryitem ~= nil and queryitem ~= "" and queryitem ~= 0 and string.sub(queryitem, 1, 1) ~= "s" and string.sub(queryitem, 1, 1) ~= "e" then
			GameTooltip:SetHyperlink("item:"..queryitem..":0:0:0")
		end
		i=i+1
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
	local itemsfound = 0
	if not GetItemInfo then return RED..L["Unknown"] end
	local itemName = GetItemInfo(id)
	if not itemName then itemName = "Uncached" end
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
	local chatline = ""
	local itemCount = 0
	
	local tListActivity = {}
	local tCount = 0

    for key in WIM_IconItems do
        table.insert(tListActivity, key)
        tCount = tCount + 1
    end

    table.sort(tListActivity, WIM_Icon_SortByActivity)

	if tListActivity[1] and WIM_Windows[tListActivity[1]].is_visible then
		channel = "WHISPER"
		chatnumber = tListActivity[1]
	else
		channel,chatnumber = ChatFrameEditBox.chatType
	    if channel=="WHISPER" then
			chatnumber = ChatFrameEditBox.tellTarget
		elseif channel == "CHANNEL" then
			chatnumber = ChatFrameEditBox.channelTarget
		end
	end
	if string.sub( id, 1, 1 ) == "s" then
		local spellid = string.sub( id, 2 )
		local craftitem = GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["craftItem"]
		if craftitem ~= nil and craftitem ~= "" then
			local craftnumber = ""
			local qtyMin = GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["craftQuantityMin"]
			local qtyMax = GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["craftQuantityMax"]
			if qtyMin and qtyMin ~= "" then
				if qtyMax and qtyMax ~= "" then
					craftnumber = craftnumber..qtyMin.. "-"..qtyMax.."x"
				else
					craftnumber = craftnumber..qtyMin.."x"
				end
			end
			SendChatMessage(L["To craft "]..craftnumber..AtlasLoot_GetChatLink(craftitem)..L[" the following reagents are needed:"],channel,nil,chatnumber)
			for j = 1, table.getn(GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["reagents"]) do
				local tempnumber = GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["reagents"][j][2]
				if not tempnumber or tempnumber == nil or tempnumber == "" then
					tempnumber = 1
				end
				chatline = chatline..tempnumber.."x"..AtlasLoot_GetChatLink(GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["reagents"][j][1]).." "
				itemCount = itemCount + 1
				if itemCount == 4 then
					SendChatMessage(chatline, channel, nil, chatnumber)
					chatline = ""
					itemCount = 0
				end
			end
			if itemCount > 0 then
				SendChatMessage(chatline, channel, nil, chatnumber)
			end
		else
			SendChatMessage(L["To cast "]..GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["name"]..L[" the following items are needed:"],channel,nil,chatnumber)
			for j = 1, table.getn(GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["reagents"]) do
				local tempnumber = GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["reagents"][j][2]
				if not tempnumber or tempnumber == nil or tempnumber == "" then
					tempnumber = 1
				end
				chatline = chatline..tempnumber.."x"..AtlasLoot_GetChatLink(GetSpellInfoVanillaDB["craftspells"][tonumber(spellid)]["reagents"][j][1]).." "
				itemCount = itemCount + 1
				if itemCount == 4 then
					SendChatMessage(chatline, channel, nil, chatnumber)
					chatline = ""
					itemCount = 0
				end
			end
			if itemCount > 0 then
				SendChatMessage(chatline, channel, nil, chatnumber)
			end
		end
	elseif string.sub( id,1 ,1 ) == "e" then
		local spellid = string.sub( id, 2 )
		local name = GetSpellInfoVanillaDB["enchants"][tonumber(spellid)]["name"]
		if tListActivity[1] and WIM_Windows[tListActivity[1]].is_visible then
			if not GetSpellInfoVanillaDB["enchants"][tonumber(spellid)]["item"] then
				SendChatMessage("|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r", channel, nil, chatnumber);
			else
				SendChatMessage("To craft "..AtlasLoot_GetChatLink(GetSpellInfoVanillaDB["enchants"][tonumber(spellid)]["item"])..L[" you need this: "].."|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r",channel,nil,chatnumber);
			end

		elseif ChatFrameEditBox:IsVisible() then
			if not GetSpellInfoVanillaDB["enchants"][tonumber(spellid)]["item"] then
				ChatFrameEditBox:Insert("|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r", channel, nil, chatnumber);
			else
				ChatFrameEditBox:Insert(L["To craft "]..AtlasLoot_GetChatLink(GetSpellInfoVanillaDB["enchants"][tonumber(spellid)]["item"])..L[" you need this: "].."|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r",channel,nil,chatnumber);
			end
		else
			if not GetSpellInfoVanillaDB["enchants"][tonumber(spellid)]["item"] then
				SendChatMessage("|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r", channel, nil, chatnumber);
			else
				SendChatMessage(L["To craft "]..AtlasLoot_GetChatLink(GetSpellInfoVanillaDB["enchants"][tonumber(spellid)]["item"])..L[" you need this: "].."|cffFFd200|Henchant:"..spellid..":0:0:0|h["..name.."]|h|r",channel,nil,chatnumber);
			end
		end
	else
		if safe then
			SendChatMessage("["..name.."]", channel, nil, chatnumber)
		else
			SendChatMessage("\124"..string.sub(color, 2).."\124Hitem:"..id..":0:0:0\124h["..name.."]\124h\124r", channel, nil, chatnumber)
		end
	end
end

function AtlasLoot_GetChatLink(id)
	local a, b, c = GetItemInfo(tonumber(id))
	local _, _, _, d = GetItemQualityColor(c)
	local e = string.sub(d, 2)
	return "\124"..e.."\124H"..b.."\124h["..a.."]\124h\124r"
end