--
-- MI2_Slash.lua
--
-- Handle all slash commands and the actions performed by slash commands.
-- All option dialog settings use slash commands for performing their
-- actions.
--
-- Note: version history now located in ReadMe.txt
--

local MI2_DeleteMode = ""

-- Configs
function MI2_SlashAction_Default()

MI2_ScanSpellbook()

	MobInfoConfig.ShowClass = 1
	MobInfoConfig.ShowHealth = 1
    MobInfoConfig.ShowMana = 0
	MobInfoConfig.ShowDamage = 1
	MobInfoConfig.ShowKills = 0
	MobInfoConfig.ShowLoots = 1
	MobInfoConfig.ShowEmpty = 0
	MobInfoConfig.ShowXp = 1
	MobInfoConfig.ShowNo2lev = 1
	MobInfoConfig.ShowQuality = 1
	MobInfoConfig.ShowCloth = 1
	MobInfoConfig.ShowCoin = 0
	MobInfoConfig.ShowIV = 0
	MobInfoConfig.ShowTotal = 1
	MobInfoConfig.ShowCombined = 0
	MobInfoConfig.ShowItems = 1
	MobInfoConfig.ShowLocation = 1
	MobInfoConfig.ShowClothSkin = 1
	MobInfoConfig.ShowResists = 1
end

function MI2_SlashAction_AllOn()
    MobInfoConfig.ShowClass = 1
    MobInfoConfig.ShowHealth = 1
    MobInfoConfig.ShowMana = 1
    MobInfoConfig.ShowKills = 1
    MobInfoConfig.ShowDamage = 1
    MobInfoConfig.ShowXp = 1
    MobInfoConfig.ShowNo2lev = 1
    MobInfoConfig.ShowLoots = 1
    MobInfoConfig.ShowEmpty = 1
    MobInfoConfig.ShowCoin = 1
    MobInfoConfig.ShowIV = 1
    MobInfoConfig.ShowTotal = 1
    MobInfoConfig.ShowQuality = 1
    MobInfoConfig.ShowCloth = 1
    MobInfoConfig.ShowCombined = 1
    MobInfoConfig.ShowItems = 1
	MobInfoConfig.ShowLocation = 1
	MobInfoConfig.ShowClothSkin = 1
	MobInfoConfig.ShowResists = 1
end

function MI2_SlashAction_AllOff()
    MobInfoConfig.ShowClass = 0
    MobInfoConfig.ShowHealth = 0
    MobInfoConfig.ShowMana = 0
    MobInfoConfig.ShowKills = 0
    MobInfoConfig.ShowDamage = 0
    MobInfoConfig.ShowXp = 0
    MobInfoConfig.ShowNo2lev = 0
    MobInfoConfig.ShowLoots = 0
    MobInfoConfig.ShowEmpty = 0
    MobInfoConfig.ShowCoin = 0
    MobInfoConfig.ShowIV = 0
    MobInfoConfig.ShowTotal = 0
    MobInfoConfig.ShowQuality = 0
    MobInfoConfig.ShowCloth = 0
    MobInfoConfig.ShowCombined = 0
    MobInfoConfig.ShowItems = 0
	MobInfoConfig.ShowLocation = 0
	MobInfoConfig.ShowClothSkin = 0
	MobInfoConfig.ShowResists = 0
end

function MI2_SlashAction_Minimal()
    MobInfoConfig.ShowClass = 1
    MobInfoConfig.ShowHealth = 1
    MobInfoConfig.ShowMana = 0
    MobInfoConfig.ShowKills = 0
    MobInfoConfig.ShowDamage = 0
    MobInfoConfig.ShowXp = 0
    MobInfoConfig.ShowNo2lev = 1
    MobInfoConfig.ShowLoots = 0
    MobInfoConfig.ShowEmpty = 0
    MobInfoConfig.ShowCoin = 0
    MobInfoConfig.ShowIV = 0
    MobInfoConfig.ShowTotal = 1
    MobInfoConfig.ShowQuality = 0
    MobInfoConfig.ShowCloth = 0
    MobInfoConfig.ShowCombined = 0
    MobInfoConfig.ShowItems = 0
	MobInfoConfig.ShowLocation = 0
	MobInfoConfig.ShowClothSkin = 0
	MobInfoConfig.ShowResists = 0
end


-----------------------------------------------------------------------------
-- MI2_RegisterWithAddonManagers()
--
-- Register MobInfo with the KHAOS AddOn manager. This is a very simple
-- registration that merely creates a button to open the MobInfo options
-- dialog.
--
-- Register MobInfo with the myAddons manager.
--
-- Register with the EARTH AddOn manager.
-----------------------------------------------------------------------------
function MI2_RegisterWithAddonManagers()

	-- register with myAddons manager
	if ( myAddOnsFrame_Register ) then
		local mobInfo2Details = {
		name = "MobInfo2",
		version = miVersionNo,
		author = "Skeeve & Dizzarian",
		website = "http://www.dizzarian.com/forums/viewforum.php?f=16",
		category = MYADDONS_CATEGORY_OTHERS,
		optionsframe = "frmMIConfig"
		}
		myAddOnsFrame_Register( mobInfo2Details )
	end

	-- register with EARTH manager (mainly for Cosmos support)
	if EarthFeature_AddButton then
		EarthFeature_AddButton(
			{
				id = "MobInfo2",
				name = "MobInfo2",
				subtext = MI_TXT_SLASH_VER..miVersionNo,
				tooltip = MI_DESCRIPTION,
				icon = "Interface\\AddOns\\MobInfo2\\MobInfoIcon",
				callback = function(state) MI2_SlashParse( "", false ) end,
				test = nil
			}
		)
	
	-- register with KHAOS (only if EARTH not found)
	elseif Khaos then
		Khaos.registerOptionSet(
			"tooltip",
			{
				id = "MobInfo2OptionSet",
				text = "MobInfo 2",
				helptext = MI_DESCRIPTION,
				difficulty = 1,
				callback = function(state) end,
				default = true,
				options = {
					{
						id = "MobInfo2OptionsHeader",
						type = K_HEADER,
						difficulty = 1,
						text = MI_TXT_WELCOME,
						helptext = MI_DESCRIPTION
					},
					{
						id = "MobInfo2OptionsButton",
						type = K_BUTTON,
						difficulty = 1,
						text = MI_TXT_CONFIG_TITLE,
						helptext = "",
						callback = function(state) MI2_SlashParse( "", false ) end,
						feedback = function(state) end,
						setup = { buttonText = MI_TXT_OPEN }
					}
				}
			}
		)
	end
end  -- MI2_RegisterWithAddonManagers()


-----------------------------------------------------------------------------
-- MI2_SlashAction_ClearTarget()
--
-- Clear MobInfo and MobHealth data for current target.
-----------------------------------------------------------------------------
function MI2_SlashAction_ClearTarget()
	local index = MI2_Target.mobIndex
	if index then
		MI2_MobHealth_ClearTargetData()
		MI2_DeleteMobData( index )
		MI2_DbOptionsFrameOnShow()
		ClearTarget()
		chattext( MI_TXT_SLASH_DAT_TARGET..mifontGreen..index..mifontWhite..MI_TXT_SLASH_DAT_DEL )
	end
end  -- MI2_SlashAction_ClearTarget()


-----------------------------------------------------------------------------
-- MI2_Slash_ClearAllConfirmed()
--
-- Clear-All-Confirmation-Handler : Clear entire contents of MobInfo and
-- MobHealth databases.
-----------------------------------------------------------------------------
function MI2_Slash_ClearAllConfirmed()
	if MI2_DeleteMode == "MobDb" then
		local curZoneName = MI2_ZoneTable[MI2_CurZone]
		MI2_DeleteAllMobData()
		MI2_ZoneTable[MI2_CurZone] = curZoneName
		MobInfoConfig.ImportSignature = ""
	elseif MI2_DeleteMode == "HealthDb" then
		MI2_MobHealth_ClearTargetData()
		MI2_MobHealth_Reset()
	elseif MI2_DeleteMode == "PlayerDb" then
		MobHealthPlayerDB = {}
	end
	chattext( MI_TXT_SLASH_DAT_DB_DEL..MI2_DeleteMode )
	MI2_DbOptionsFrameOnShow()
	ClearTarget()
end  -- MI2_Slash_ClearAllConfirmed()


-----------------------------------------------------------------------------
-- MI2_SlashAction_ClearHealthDb()
--
-- Clear entire contents of MobInfo and MobHealth databases.
-- Ask for confirmation before performing the clear operation.
-----------------------------------------------------------------------------
function MI2_SlashAction_ClearHealthDb()
	StaticPopupDialogs["MOBINFO_CONFIRMATION"].text = MI_TXT_CLR_ALL_CONFIRM.."'"..MI2_OPTIONS[this:GetName()].help.."' ?"
	StaticPopupDialogs["MOBINFO_CONFIRMATION"].OnAccept = MI2_Slash_ClearAllConfirmed
	MI2_DeleteMode = "HealthDb"
	local dialog = StaticPopup_Show( "MOBINFO_CONFIRMATION", "")
end  -- MI2_SlashAction_ClearHealthDb()


-----------------------------------------------------------------------------
-- MI2_SlashAction_ClearPlayerDb()
--
-- Clear entire contents of MobInfo and MobHealth databases.
-- Ask for confirmation before performing the clear operation.
-----------------------------------------------------------------------------
function MI2_SlashAction_ClearPlayerDb()
	StaticPopupDialogs["MOBINFO_CONFIRMATION"].text = MI_TXT_CLR_ALL_CONFIRM.."'"..MI2_OPTIONS[this:GetName()].help.."' ?"
	StaticPopupDialogs["MOBINFO_CONFIRMATION"].OnAccept = MI2_Slash_ClearAllConfirmed
	MI2_DeleteMode = "PlayerDb"
	local dialog = StaticPopup_Show( "MOBINFO_CONFIRMATION", "")
end  -- MI2_SlashAction_ClearPlayerDb()


-----------------------------------------------------------------------------
-- MI2_SlashAction_ClearMobDb()
--
-- Clear entire contents of MobInfo and MobHealth databases.
-- Ask for confirmation before performing the clear operation.
-----------------------------------------------------------------------------
function MI2_SlashAction_ClearMobDb()
	StaticPopupDialogs["MOBINFO_CONFIRMATION"].text = MI_TXT_CLR_ALL_CONFIRM.."'"..MI2_OPTIONS[this:GetName()].help.."' ?"
	StaticPopupDialogs["MOBINFO_CONFIRMATION"].OnAccept = MI2_Slash_ClearAllConfirmed
	MI2_DeleteMode = "MobDb"
	local dialog = StaticPopup_Show( "MOBINFO_CONFIRMATION", "")
end  -- MI2_SlashAction_ClearMobDb()


-----------------------------------------------------------------------------
-- MI2_Slash_TrimDownConfirmed()
--
-- Trim down the contents of the mob info database by removing all data
-- that is not set as being recorded. This function is called when the
-- user confirms the delete confirmation.
-----------------------------------------------------------------------------
function MI2_Slash_TrimDownConfirmed()
	MobInfoDB["DatabaseVersion:0"] = nil

	-- loop through database and check each record
	-- remove all fields within the record where recording of the field is disabled
	for idx, mobInfo in MobInfoDB do
		if  MobInfoConfig.SaveBasicInfo == 0 then
			mobInfo.bi = nil
		end
		if  MobInfoConfig.SaveQualityData == 0 then
			mobInfo.qi = nil
		end
		if  MobInfoConfig.SaveLocation == 0 then
			mobInfo.ml = nil
		end
		if  MobInfoConfig.SaveItems == 0 then
			mobInfo.il = nil
		end
		if  MobInfoConfig.SaveResist == 0 then
			mobInfo.re = nil
		end
		if  MobInfoConfig.SaveCharData == 0 then
			MI2_RemoveCharData( mobInfo )
		end
	end

	if  MobInfoConfig.SaveItems == 0 then
		MI2_ItemNameTable = {}
	end

	-- char table can be deleted when not saving char specific data
	if  MobInfoConfig.SaveCharData == 0 then
		MI2_CharTable = { charCount = 0 }
	end

	-- force a cleanup after trimming down
	MI2_ClearMobCache()
	MI2_CleanupDatabases()

	MI2_DbOptionsFrameOnShow()
end -- MI2_Slash_TrimDownConfirmed()


-----------------------------------------------------------------------------
-- MI2_SlashAction_TrimDownMobData()
--
-- Trim down the contents of the mob info database by removing all data
-- that is not set as being recorded. Ask for a confirmation before
-- actually deleting anything.
-----------------------------------------------------------------------------
function MI2_SlashAction_TrimDownMobData()
	StaticPopupDialogs["MOBINFO_CONFIRMATION"].text = MI_TXT_TRIM_DOWN_CONFIRM
	StaticPopupDialogs["MOBINFO_CONFIRMATION"].OnAccept = MI2_Slash_TrimDownConfirmed
	local dialog = StaticPopup_Show( "MOBINFO_CONFIRMATION", "")
end  -- MI2_SlashAction_TrimDownMobData()


-----------------------------------------------------------------------------
-- MI2_UpdateMob()
--
-- Update a specific existing mob by adding to it the given new Mob data.
-----------------------------------------------------------------------------
local function MI2_UpdateMob( mobIndex, newMobInfo )
	local existingMobInfo = MobInfoDB[mobIndex]
	local existingMobData, newMobData = {}, {}
	MI2_GetMobDataFromMobInfo( existingMobInfo, existingMobData )
	MI2_GetMobDataFromMobInfo( newMobInfo, newMobData )
	MI2_AddTwoMobs( existingMobData, newMobData )
	MI2_StoreAllMobData( existingMobData, nil, nil, MI2_PlayerName, mobIndex )
end -- MI2_UpdateMob()

-----------------------------------------------------------------------------
-- MI2_AdaptImportLocation()
--
-- Adapt the location info of an imported Mob. This is only necessary for
-- Mobs in instances, because instances are not available in the WoW
-- zone tables.
-----------------------------------------------------------------------------
local function MI2_AdaptImportLocation( mobInfo, importZoneTable )
	-- decode mob location information
	local mobData = {}
	MI2_DecodeMobLocation( mobInfo, mobData )
	local loc = mobData.location
	if not loc or not loc.z then return end

	-- find correct zone name
	local zone = mobData.location.z
	local cont = mobData.location.c
	local zoneName = importZoneTable[zone]
	if not zoneName and cont then
		zoneName = MI2_Zones[cont][zone]
	end

	-- update the mobs location info
	if zoneName and zoneName ~= "" then
		MI2_SetNewZone( zoneName, cont, zone)
		importZoneTable[MI2_CurZone] = zoneName
		mobInfo.ml = (loc.x1 or "").."/"..(loc.y1 or "").."/"..(loc.x2 or "").."/"..(loc.y2 or "").."/"..cont.."/"..zone
	else
		mobInfo.ml = nil
	end
end -- MI2_AdaptImportLocation()


-----------------------------------------------------------------------------
-- MI2_SlashAction_ImportMobData()
--
-- Import externally supplied MobInfo database into own database.
-----------------------------------------------------------------------------
function MI2_SlashAction_ImportMobData()
	local newMobs, updatedMobs, newHealth, newItems = 0, 0, 0, 0
	local mobIndex, mobInfo, healthInfo
	local oldCurZone = MI2_CurZone

	chattext( MI_TXT_SLASH_DB_IMPORT )

	-- import loot items into main loot item database
	for itemId, itemInfo in MI2_ItemNameTable_Import do
		if not MI2_ItemNameTable[itemId] then
			MI2_ItemNameTable[itemId] = itemInfo
			newItems = newItems + 1
		end
	end

	-- import health data into main Mob health database
	for mobIndex, healthInfo in MobHealthDB_Import do
		if not MobHealthDB[mobIndex] then
			MobHealthDB[mobIndex] = healthInfo
			newHealth = newHealth + 1
		end
	end

	-- swap name/id in zone name table
	if MI2_ZoneTable_Import.cnt then
		local zoneName, zoneId
		local newTable = {}
		MI2_ZoneTable_Import.cnt = nil
		for zoneName, zoneId in MI2_ZoneTable_Import do
			newTable[zoneId] = zoneName
		end
		MI2_ZoneTable_Import = newTable
	end

	-- import Mobs into main Mob database
	for mobIndex, mobInfo in MobInfoDB_Import do
		MI2_RemoveCharData( mobInfo )
		MI2_AdaptImportLocation( mobInfo, MI2_ZoneTable_Import )
		if MobInfoDB[mobIndex] then
			updatedMobs = updatedMobs + 1
			if MobInfoConfig.ImportOnlyNew == 0 then
				-- import Mob that already exists
				MI2_UpdateMob( mobIndex, mobInfo )
			end
		else
			-- import unknown Mob
			MobInfoDB[mobIndex] = mobInfo
			newMobs = newMobs + 1
		end
	end

	-- update item cross reference table after import
	if MobInfoConfig.ImportOnlyNew == 0 then
		MI2_BuildXRefItemTable()
	end

	-- restore current zone ID after import
	MI2_CurZone = oldCurZone

	chattext( MI_TXT_SLASH_IMPORTED..newMobs..MI_TXT_SLASH_NEW_MOBS )
	chattext( MI_TXT_SLASH_IMPORTED..newHealth..MI_TXT_SLASH_NEW_HP_VAL )
	chattext( MI_TXT_SLASH_IMPORTED..newItems..MI_TXT_SLASH_NEW_ITEMS )
	if MobInfoConfig.ImportOnlyNew == 0 then
		chattext( MI_TXT_SLASH_UPD_DATA..updatedMobs..MI_TXT_SLASH_EXS_MOBS )
	else
		chattext( MI_TXT_SLASH_NOT_UPD..updatedMobs..MI_TXT_SLASH_EXS_MOBS )
	end

	-- update database options frame
	MobInfoConfig.ImportSignature = MI2_Import_Signature
	MI2_DbOptionsFrameOnShow()
end  -- MI2_SlashAction_ImportMobData()


-----------------------------------------------------------------------------
-- MI2_SlashAction_DeleteSearch()
--
-- Delete all Mobs in the search result list from the MobInfo database.
-- This function will ask for confirmation before deleting.
-----------------------------------------------------------------------------
function MI2_SlashAction_DeleteSearch()
	local confirmationText = string.format( MI_TXT_DEL_SEARCH_CONFIRM, MI2_NumMobsFound )
	StaticPopupDialogs["MOBINFO_CONFIRMATION"].text = confirmationText
	StaticPopupDialogs["MOBINFO_CONFIRMATION"].OnAccept = MI2_DeleteSearchResultMobs
	local dialog = StaticPopup_Show( "MOBINFO_CONFIRMATION", "")
end -- MI2_SlashAction_DeleteSearch()


-----------------------------------------------------------------------------
-- MI2_SlashInit()
--
-- Add all Slash Commands
-----------------------------------------------------------------------------
function MI2_SlashInit()
	SlashCmdList["MOBINFO"] = MI2_SlashParse
	SLASH_MOBINFO1 = "/mobinfo2" 
	SLASH_MOBINFO2 = "/mi2" 
end  -- MI2_SlashInit()


-----------------------------------------------------------------------------
-- MI2_SlashParse()
--
-- Parses the msg entered as a slash command. This function is also used
-- for the internal purpose of setting all options in the options dialog.
-- When used by the options dialog there is no need to actually update the
-- dialog, which is indicated by the "updateOptions" parameter.
-----------------------------------------------------------------------------
function MI2_SlashParse( msg, updateOptions )
	-- extract option name and option argument from message string
	local _, _, cmd, param = string.find( string.lower(msg), "([%w_]*)[ ]*([-%w]*)") 
	
	-- handle show/hide of options dialog first of all
	-- handle all simple commands that dont require parsing right here
	if  not cmd  or  cmd == ""  or  cmd == "config"  then
		if  frmMIConfig:IsVisible()  then
			frmMIConfig:Hide()
		else
			frmMIConfig:Show()
		end
		return
	elseif  cmd == 'version'  then
		chattext( MI_TXT_SLASH_VERSION..miVersionNo )
		return
	elseif  cmd == 'convertdroprate'  then
		MI2_StartDropRateConversion()
		return
	elseif  cmd == 'help'  then
		chattext( MI_TXT_SLASH_USAGE )
		chattext( MI_TXT_SLASH_HELP..mifontLightGreen..'http://www.dizzarian.com/forums/viewforum.php?f=16' )
		return
	end

	-- search for the option data structure matching the command
	local optionName, optionData
	for idx, val in MI2_OPTIONS do
		local lower_opt = string.lower( idx )
		local optionCommand = string.sub(lower_opt, 8)
		if cmd == lower_opt or cmd == optionCommand then
			optionName = string.sub(idx, 8)
			optionData = val
			break
		end
	end

	-- now call the option handler for the more complex commands
	if  optionData  then
		MI2_OptionParse( optionName, optionData, param, updateOptions )
	end
end -- of MI2_SlashParse()


-----------------------------------------------------------------------------
-- MI2_OptionParse()
--
-- Parses the more complex option toggle/set commands. There are 4
-- categories of options:
--   * options that can toggle between an on and off state
--   * options that represent a numeric value
--   * options that represent a text
--   * options that activate a special functionality represented by a
--     handler function that must correspond to a specific naming convention
-----------------------------------------------------------------------------
function MI2_OptionParse( optionName, optionData, param, updateOptions )
	-- handle the option according to its option type: its either a
	-- switch being toggleg, a value being set, or a special action
	if optionData.val then
		-- it is a slider setting a value
		-- get new option value from parameter and set it
		local optValue = tonumber( param ) or 0
		MobInfoConfig[optionName] = optValue
		if  updateOptions  then
			chattext( optionData.text.." : "..mifontGreen..optValue )
		end

	elseif optionData.txt then
		-- it is a text based option
		MobInfoConfig[optionName] = param
		if  updateOptions  then
			chattext( optionData.text.." : "..mifontGreen..param )
		end

	elseif  MobInfoConfig[optionName]  then
		-- it is a switch toggle option:
		-- get current option value and toggle it to the opposite state (On<->Off)
		local valTxt = { val0 = MI_TXT_SLASH_OFF,  val1 = MI_TXT_SLASH_ON }
		local optValue = MobInfoConfig[ optionName ]
		optValue = 1 - optValue  -- toggle option
		MobInfoConfig[optionName] = optValue
		chattext( optionData.text.." : "..mifontGreen..valTxt["val"..optValue] )

		-- special case: disabling MobInfo requires extra processing
		if optionName == "DisableMobInfo" then MI2_UpdateMobInfoState() end
		-- some toggle switches control recording options which in turn controls events
		MI2_InitializeEventTable()
	else
		-- special action commands have a corresponding handler function
		local actionHandlerName = "MI2_SlashAction_"..optionName
		local actionHandler = getglobal( actionHandlerName )
		if  actionHandler  then
			actionHandler()
			updateOptions = true -- for AllOn, AllOff, etc.
		end
	end

	-- update font and position of health / mana texts
	MI2_MobHealth_SetPos()

	-- update options dialog if shown and if requested
	if  frmMIConfig:IsVisible()  and  updateOptions  then
		MI2_UpdateOptions()
	end

end  -- MI2_OptionParse()

