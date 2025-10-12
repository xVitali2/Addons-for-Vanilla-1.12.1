--
-- MobInfo2.lua
--
-- Main module of MobInfo-2 AddOn
miVersionNo = ' 3.12'
--
-- MobInfo-2 is a World of Warcraft AddOn that provides you with useful
-- additional information about Mobs (ie. opponents/monsters). It adds
-- new information to the game's Tooltip when you hover with your mouse
-- over a mob. It also adds a numeric display of the Mobs health
-- and mana (current and max) to the Mob target frame.
--
-- MobInfo-2 is the continuation of the original "MobInfo" by Dizzarian,
-- combined with the original "MobHealth2" by Wyv. Both Dizzarian and
-- Wyv sadly no longer play WoW and stopped maintaining their AddOns.
-- I have "inhereted" MobInfo from Dizzarian and MobHealth-2 from Wyv
-- and now continue to update and improve the united result.
--

-- global vars
MI2_Debug = 0  -- 0=no debug info, 1=minimal debug info, 2=extensive debug info, 3=more extensive+event info
MI2_DebugItems = 0  -- 0=no item debug info, 1=show item ID and item value in tooltip
MI2_DebugEvents = 0  -- 0=no item event info, 1=show decoded events, 2=show all incoming events

MI2_DB_VERSION = 8
MI2_IMPORT_DB_VERSION = 6

local MI2_RecentLoots, MI2_MobCache, MI2_MobCacheIdx, MI2_XRefItemTable
local MI2_NewCorpseIdx = 0
local MI2_CurrentCorpseIndex = nil
local MI2_RecentLoots = {}
local MI2_SpellToSchool = {}
local MI2_CACHE_SIZE = 30

-- skinning loot table using localization independant item IDs:
--    Ruined Leather Scraps, Light Leather, Medium Leather, Heavy Leather, Thick Leather, Rugged Leather
--    Chimera Leather, Devilsaur Leather, Frostsaber Leather, Warbear Leather, Core Leather, Thin Kodo Leather
--    Light Hide, Medium Hide, Heavy Hide, Thick Hide, Rugged Hide, Shadowcat Hide, Thick Wolfhide
--    Scorpid Scale, Red Whelp Scales, Turtle Scales, Black Whelp Scales, Brilliant Chromatic Scale
--    Black Dragonscale, Blue Dragonscale, Red Dragonscale, Green Dragonscale, Worn Dragonscale, Heavy Scorpid Scale
--    deviate scale, perfect deviate scale, green whelp scale, worn dragonscale
--
-- removed "Shiny Fish Scales" ([17057]=1,) because its also normal loot
--
local miSkinLoot = { [2934]=1, [2318]=1, [2319]=1, [4234]=1, [4304]=1, [8170]=1, 
                    [15423]=1,[15417]=1,[15422]=1,[15419]=1,[17012]=1, [5082]=1,
                      [783]=1, [4232]=1, [4235]=1, [8169]=1, [8171]=1, [7428]=1, [8368]=1,
                     [8154]=1,[7287]=1, [8167]=1, [7286]=1,[12607]=1,
                    [15416]=1,[15415]=1,[15414]=1,[15412]=1, [8165]=1,[15408]=1,
                     [6470]=1, [6471]=1, [7392]=1, [8165]=1,  }

-- cloth loot table using localization independant item IDs
-- Linen Cloth, Wool Cloth, Silk Cloth, Mageweave Cloth, Felcloth, Runecloth, Mooncloth
local miClothLoot = { [2589]=1, [2592]=1, [4306]=1, [4338]=1, [14256]=1, [14047]=1, [14342]=1 };

local MI2_ItemCollapseList = { [2725]=0, [2728]=0, [2730]=0, [2732]=0, 
                               [2734]=0, [2735]=0, [2738]=0, [2740]=0, [2742]=0,
                               [2745]=0, [2748]=0, [2749]=0, [2750]=0, [2751]=0 }

-- global MobInfo color constansts
mifontBlue = "|cff0000ff"
mifontItemBlue = "|cff2060ff"
mifontLightBlue = "|cff00e0ff"
mifontLightGreen = "|cff60ff60"
mifontGreen = "|cff00ff00"
mifontRed = "|cffff0000"
mifontLightRed = "|cffff8080"
mifontGold = "|cffffcc00"
mifontGray = "|cff888888"
mifontWhite = "|cffffffff"
mifontSubWhite = "|cffbbbbbb"
mifontMageta = "|cffe040ff" -- old magenta: "|cffff00ff"
mifontYellow  = "|cffffff00"
mifontCyan   = "|cff00ffff"
mifontOrange = "|cffff7000"
MI2_QualityColor = { [1]=mifontGray, [2]=mifontWhite, [3]=mifontGreen, [4]=mifontItemBlue, [5]=mifontMageta, [6]=mifontOrange, [7]=mifontRed }


-----------------------------------------------------------------------------
-- MI2_GetMobData( mobName, mobLevel [, unitId] )
--
-- Get and return all the data that MobInfo knows about a given mob.
-- This is an externally available interface function that can be
-- called by other AddOns to access MobInfo data. It should be fast,
-- efficient, and easy to use
--
-- The data describing a Mob is returned in table form as described below.
--
-- To identify the mob you must supply its name and level. You can
-- optionally supply a "unitId" to get additional info:
--   mobName : name of mob, eg. "Forest Lurker"
--   mobLevel : mob level as integer number
--   unitId : optional WoW unit identification, should be either
--            "target" or "mouseover"
--
-- Examples:
--    A.   mobData = MI2_GetMobData( "Forest Lurker", 10 )
--    B.   mobData = MI2_GetMobData( "Forest Lurker", 10, "target" )
--
-- Return Value:
-- The return value is a LUA table with one table entry for each value that
-- MobInfo can know about a Mob. Note that table entries exist ONLY if the
-- corresponding value has actually been collected for the given Mob.
-- Unrecorded values do NOT exist in the table and thus evaluate to a NIL
-- expression.
--
-- Values you can get without "unitId" (as per Example A above):
--    mobData.healthMax  :  health maximum
--    mobData.xp         :  experience value
--    mobData.kills      :  number of times current player has killed this mob
--    mobData.minDamage  :  minimum damage done by mob
--    mobData.maxDamage  :  maximum damage done by mob
--    mobData.dps        :  dps of Mon against current player
--    mobData.loots      :  number of times this mob has been looted
--    mobData.emptyLoots :  number of times this mob gave empty loot
--    mobData.clothCount :  number of times this mob gave cloth loot
--    mobData.copper     :  total money loot of this mob as copper amount
--    mobData.itemValue  :  total item value loot of this mob as copper amount
--    mobData.mobType    :  mob type for special mobs: 1=normal, 2=rare/elite, 3=boss
--    mobData.r1         :  number of rarity 1 loot items (grey)
--    mobData.r2         :  number of rarity 2 loot items (white)
--    mobData.r3         :  number of rarity 3 loot items (green)
--    mobData.r4         :  number of rarity 4 loot items (blue)
--    mobData.r5         :  number of rarity 5 loot items (purple)
--    mobData.itemList   :  table that lists all recorded items looted from this mob
--                          table entry index gives WoW item ID, 
--                          table entry value gives item amount
--
-- Additional values you will get with "unitId" (as per Example B above):
--    mobData.class      :  class of mob as localized text
--    mobData.healthCur  :  current health of given unit
--    mobData.manaCur    :  current mana of given unit
--    mobData.manaMax    :  maximum mana for given unit
--
-- Code Example:
--    
--    local mobData = MI2_GetMobData( "Forest Lurker", 10 )
--    
--    if mobData.xp then
--        DEFAULT_CHAT_FRAME:AddMessage( "XP = "..mobData.xp ) 
--    end
--    
--    if mobData.copper and mobData.loots then
--        local avgLoot = mobData.copper / mobData.loots
--        DEFAULT_CHAT_FRAME:AddMessage( "average loot = "..avgLoot ) 
--    end
-----------------------------------------------------------------------------
function MI2_GetMobData( mobName, mobLevel, unitId )
	if not mobName or not mobLevel then return end

	local mobData = {}
	local mobIndex = mobName..":"..mobLevel

	-- decode unit specific mob data that is not recorded in mob database
	MI2_GetUnitBasedMobData( mobIndex, mobData, unitId, mobLevel )

	-- access Mob database and decode the data
	local mobInfo = MobInfoDB[mobIndex]
	if  mobInfo then
		MI2_GetMobDataFromMobInfo( mobInfo, mobData )
	end

	return mobData
end -- MI2_GetMobData()


-----------------------------------------------------------------------------
-- MI2_GetMobDataFromMobInfo()
--
-- Extract all data describing a specific mob from a given mob database
-- record (called "mobInfo"). The mobInfo data is in a compressed format
-- that requires decoding to make it usable.
-----------------------------------------------------------------------------
function MI2_GetMobDataFromMobInfo( mobInfo, mobData )
	MI2_DecodeBasicMobData( mobInfo, mobData )
	MI2_DecodePlayerSpecificData( mobInfo, mobData, MI2_PlayerName )
	MI2_DecodeQualityOverview( mobInfo, mobData )
	MI2_DecodeMobLocation( mobInfo, mobData )
	MI2_DecodeItemList( mobInfo, mobData )
	MI2_DecodeResists( mobInfo, mobData )
end -- MI2_GetMobDataFromMobInfo()


-----------------------------------------------------------------------------
-- MI2_GetUnitBasedMobData()
--
-- Obtain and store all unit specific mob data.
-----------------------------------------------------------------------------
function MI2_GetUnitBasedMobData( mobIndex, mobData, unitId, mobLevel )
    -- get mobs PPP and calculate max health
	local mobPPP = MobHealth_PPP(mobIndex)
	if mobPPP <= 0 then mobPPP = 1 end
	mobData.healthMax = floor(mobPPP * 100 + 0.5)

	-- obtain unit specific values if unitId is given
	if unitId then
		mobData.class = UnitClass(unitId)
		if UnitHealthMax(unitId) == 100 then
			mobData.healthCur = floor(mobPPP * UnitHealth(unitId) + 0.5)
		else
			mobData.healthCur = UnitHealth(unitId)
		end
		mobData.manaCur = UnitMana( unitId )
		mobData.manaMax = UnitManaMax( unitId )
	end

	mobData.color = GetDifficultyColor( mobLevel )
end -- MI2_GetUnitBasedMobData()


-----------------------------------------------------------------------------
-- MI2_FetchMobData()
--
-- Internal function for accessing a mobData record
-- This function implements a caching mechanism for faster access
-- to database records. The cache stores the last 30 Mob records.
-- Data returned by "MI2_FetchMobData()" should NOT be modified because
-- modifications are written back into the main database file.
-----------------------------------------------------------------------------
function MI2_FetchMobData( mobIndex )
	local mobData = MI2_MobCache[mobIndex]
	if mobIndex and not mobData then
		local mobInfo = MobInfoDB[mobIndex]
		mobData = { mobType=1, resists={} }
		if mobInfo then
			MI2_GetMobDataFromMobInfo( mobInfo, mobData )
		end
		MI2_MobCache[mobIndex] = mobData

		local oldMob = MI2_MobCache[MI2_MobCacheIdx]
		if oldMob then
			MI2_MobCache[oldMob] = nil
		end

		MI2_MobCache[MI2_MobCacheIdx] = mobIndex
		MI2_MobCacheIdx = MI2_MobCacheIdx + 1
		if MI2_MobCacheIdx > MI2_CACHE_SIZE then
			MI2_MobCacheIdx = 1
		end
	end
	return mobData
end -- MI2_FetchMobData()


-----------------------------------------------------------------------------
-- MI2_DecodeBasicMobData()
--
-- Decode the basic mob data. This function is used by the public
-- "MI2_GetMobData()" and also by the Mob search routines.
-----------------------------------------------------------------------------
function MI2_DecodeBasicMobData( mobInfo, mobData, mobIndex )
	if mobIndex then
		mobInfo = MobInfoDB[mobIndex]
		if not mobInfo then
			-- unknown mob is being looted
			mobData.loots = 1
			return
		end
	end

	-- decode mob basic info: loots, empty loots, experience, cloth count, money looted, item value looted, mob type
	mobData.mobType = 1
	if mobInfo.bi then
		local a,b,lt,el,cp,iv,cc,xp,mt,sc = string.find( mobInfo.bi, "(%d*)/(%d*)/(%d*)/(%d*)/(%d*)/(%d*)/(%d*)/(%d*)")
		mobData.loots		= tonumber(lt)
		mobData.emptyLoots	= tonumber(el)
		mobData.xp			= tonumber(xp)
		mobData.clothCount	= tonumber(cc)
		mobData.copper		= tonumber(cp)
		mobData.itemValue	= tonumber(iv)
		mobData.mobType		= tonumber(mt) or 1
		mobData.skinCount	= tonumber(sc)
	end

	if mobData.mobType > 10 then
		mobData.lowHpAction = floor(mobData.mobType / 10)
		mobData.mobType = mobData.mobType - mobData.lowHpAction * 10
	end
end -- MI2_DecodeBasicMobData()


-----------------------------------------------------------------------------
-- MI2_DecodeMobLocation()
--
-- Decode mob location info, skip invalid location data
-- The location is encoded in the mob record entry "ml".
-- The decoded data is stored in the given "mobData" structure.
-----------------------------------------------------------------------------
function MI2_DecodeMobLocation( mobInfo, mobData, mobIndex )
	if mobIndex then
		mobInfo = MobInfoDB[mobIndex]
	end

	if mobInfo.ml then
		local a,b,x1,y1,x2,y2,c,z,n = string.find( mobInfo.ml, "(%d*)/(%d*)/(%d*)/(%d*)/(%d*)/(%d*)")
		mobData.location = {}
		mobData.location.x1	= tonumber(x1)
		mobData.location.y1	= tonumber(y1)
		mobData.location.x2	= tonumber(x2)
		mobData.location.y2	= tonumber(y2)
		mobData.location.c	= tonumber(c)
		mobData.location.z	= (tonumber(z) or 0)
		if not mobData.location.x1 or not mobData.location.x2 or 
				not mobData.location.y1 or not mobData.location.y2 or 
				mobData.location.z == 0 then
			mobData.location = nil
		end
	end
end -- MI2_DecodeMobLocation()


-----------------------------------------------------------------------------
-- MI2_DecodeQualityOverview()
--
-- Decode item quality data: loot count per item rarity category
-- The loot items quality overview is encoded in the mob record entry "qi".
-- The decoded data is stored in the given "mobData" structure.
-----------------------------------------------------------------------------
function MI2_DecodeQualityOverview( mobInfo, mobData, mobIndex )
	if mobIndex then
		mobInfo = MobInfoDB[mobIndex]
	end

	if mobInfo.qi then
		local a,b,r1,r2,r3,r4,r5 = string.find( mobInfo.qi, "(%d*)/(%d*)/(%d*)/(%d*)/(%d*)")
		mobData.r1	= tonumber(r1)
		mobData.r2	= tonumber(r2)
		mobData.r3	= tonumber(r3)
		mobData.r4	= tonumber(r4)
		mobData.r5	= tonumber(r5)
	end
end -- MI2_DecodeQualityOverview


-----------------------------------------------------------------------------
-- MI2_DecodePlayerSpecificData()
--
-- Decode player specific data: number of kills, min damage, max damage, dps
-- Player specific data is encoded in mob record entries starting with
-- the lowercase letter "c" plus a player name index number, eg. "c7",
-- this is called the player ID code. The playerName parameter must give
-- the player ID code for the player data to decode.
-- The decoded data is stored in the given "mobData" structure.
-----------------------------------------------------------------------------
function MI2_DecodePlayerSpecificData( mobInfo, mobData, playerName, mobIndex )
	if mobIndex then
		mobInfo = MobInfoDB[mobIndex]
	end

	if mobInfo[playerName] then
		local a,b,kl,mind,maxd,dps,xp = string.find( mobInfo[playerName], "(%d*)/(%d*)/(%d*)/(%d*)/*(%d*)")
		mobData.kills		= tonumber(kl)
		mobData.minDamage	= tonumber(mind)
		mobData.maxDamage	= tonumber(maxd)
		mobData.dps			= tonumber(dps)
		if xp then
			mobData.xp		= tonumber(xp)
		end
	end
end


-----------------------------------------------------------------------------
-- MI2_DecodeResists()
--
-- Decode mob resistances and immunities info
-- The location is encoded in the mob record entry "re".
-- The decoded data is stored in the given "mobData" structure.
-----------------------------------------------------------------------------
function MI2_DecodeResists( mobInfo, mobData, mobIndex )
	if mobIndex then
		mobInfo = MobInfoDB[mobIndex]
	end

	if mobInfo.re then
		local a,b,ar,arHits,fi,fiHits,fr,frHits,ho,hoHits,na,naHits,sh,shHits = string.find( mobInfo.re, "(%-?%d*),(%-?%d*)/(%-?%d*),(%-?%d*)/(%-?%d*),(%-?%d*)/(%-?%d*),(%-?%d*)/(%-?%d*),(%-?%d*)/(%-?%d*),(%-?%d*)")
		mobData.resists = {}
		mobData.resists.ar	= tonumber(ar)
		mobData.resists.fi	= tonumber(fi)
		mobData.resists.fr	= tonumber(fr)
		mobData.resists.ho	= tonumber(ho)
		mobData.resists.na	= tonumber(na)
		mobData.resists.sh	= tonumber(sh)
		mobData.resists.arHits	= tonumber(arHits)
		mobData.resists.fiHits	= tonumber(fiHits)
		mobData.resists.frHits	= tonumber(frHits)
		mobData.resists.hoHits	= tonumber(hoHits)
		mobData.resists.naHits	= tonumber(naHits)
		mobData.resists.shHits	= tonumber(shHits)
	end
end -- MI2_DecodeMobLocation()


-----------------------------------------------------------------------------
-- MI2_DecodeItemList()
--
-- Decode the item list encoded in the "il" string of a mobInfo database
-- record. The result is stored in the given mobData record as a new
-- record field called "itemList".
-----------------------------------------------------------------------------
function MI2_DecodeItemList( mobInfo, mobData, mobIndex )
	if mobIndex then
		mobInfo = MobInfoDB[mobIndex]
	end

	if mobInfo.il then
		local lootItems = mobInfo.il
		local s,e, item, amount = string.find( lootItems, "(%d+)[:]?(%d*)" )
		if e then mobData.itemList = {} end
		while e do
			mobData.itemList[tonumber(item)] = tonumber(amount) or 1
			s,e, item, amount = string.find( lootItems, "/(%d+)[:]?(%d*)", e+1 )
		end
	end
end -- MI2_DecodeItemList()


-----------------------------------------------------------------------------
-- MI2_StoreBasicInfo()
--
-- Store the mob basic info in the mob database. Basic info includes the
-- mob loot quality overview counters.
-----------------------------------------------------------------------------
local function MI2_StoreBasicInfo( mobIndex, mobData )
	local mobInfo = MobInfoDB[mobIndex]
	if not mobInfo then
		mobInfo = {}
		MobInfoDB[mobIndex] = mobInfo
	end

	local mobType = mobData.mobType or 1
	if mobData.lowHpAction then
		mobType = mobType + mobData.lowHpAction * 10
	end

	local basicInfo = (mobData.loots or "").."/"..(mobData.emptyLoots or "").."/"..(mobData.copper or "").."/"..(mobData.itemValue or "").."/"..(mobData.clothCount or "").."//"..(mobType or "").."/"..(mobData.skinCount or "")
	if basicInfo ~= "///////" then
		mobInfo.bi = basicInfo
	end

	local qualityInfo = (mobData.r1 or "").."/"..(mobData.r2 or "").."/"..(mobData.r3 or "").."/"..(mobData.r4 or "").."/"..(mobData.r5 or "")
	if qualityInfo ~= "////" then
		mobInfo.qi = qualityInfo
	end
end -- MI2_StoreBasicInfo()


-----------------------------------------------------------------------------
-- MI2_StoreLocation()
--
-- Store the mob location data in the mob database.
-----------------------------------------------------------------------------
function MI2_StoreLocation( mobIndex, loc )
	local mobInfo = MobInfoDB[mobIndex]
	if not mobInfo then
		mobInfo = {}
		MobInfoDB[mobIndex] = mobInfo
	end

	local locationInfo = (loc.x1 or "").."/"..(loc.y1 or "").."/"..(loc.x2 or "").."/"..(loc.y2 or "").."/"..(loc.c or "").."/"..(loc.z or "").."/"..(loc.n or "")
	if locationInfo ~= "//////" then
		mobInfo.ml = locationInfo
	end
end -- MI2_StoreLocation()


-----------------------------------------------------------------------------
-- MI2_StoreCharData()
--
-- Store the char specific mob data in the mob database.
-----------------------------------------------------------------------------
local function MI2_StoreCharData( mobIndex, mobData, playerName )
	local mobInfo = MobInfoDB[mobIndex]
	if not mobInfo then
		mobInfo = {}
		MobInfoDB[mobIndex] = mobInfo
	end

	local playerInfo = (mobData.kills or "").."/"..(mobData.minDamage or "").."/"..(mobData.maxDamage or "").."/"..(mobData.dps or "").."/"..(mobData.xp or "")
	if playerInfo ~= "////" then
		mobInfo[playerName] = playerInfo
	end
end -- MI2_StoreCharData()


-----------------------------------------------------------------------------
-- MI2_StoreLootItems()
--
-- Store a mobs loot items list in mob database.
-----------------------------------------------------------------------------
local function MI2_StoreLootItems( mobIndex, mobData )
	local mobInfo = MobInfoDB[mobIndex]
	if not mobInfo then
		mobInfo = {}
		MobInfoDB[mobIndex] = mobInfo
	end
	-- create loot item list string for database
	local itemList = ""
	if mobData.itemList then
		local prefix = ""
		for itemID, amount in pairs(mobData.itemList) do
			itemList = itemList..prefix..itemID
			if amount > 1 then
				itemList = itemList..":"..amount
			end
			prefix = "/"
		end
	end

	if itemList ~= "" then
		mobInfo.il = itemList
	end
end -- MI2_StoreLootItems()


-----------------------------------------------------------------------------
-- MI2_StoreResistData()
--
-- Store resist data for mob in mob database. Data will only be saved if
-- resistances exist.
-----------------------------------------------------------------------------
function MI2_StoreResistData( mobIndex )
	local mobData = MI2_FetchMobData( mobIndex )
	resData = mobData.resists

	-- store only if resistances exist
	if resData.ar or resData.fi or resData.fr or resData.ho or resData.na or resData.sh then
		local mobInfo = MobInfoDB[mobIndex]
		if not mobInfo then
			mobInfo = {}
			MobInfoDB[mobIndex] = mobInfo
		end
		local resistString = 
				(resData.ar or "")..","..(resData.arHits or "").."/"..
				(resData.fi or "")..","..(resData.fiHits or "").."/"..
				(resData.fr or "")..","..(resData.frHits or "").."/"..
				(resData.ho or "")..","..(resData.hoHits or "").."/"..
				(resData.na or "")..","..(resData.naHits or "").."/"..
				(resData.sh or "")..","..(resData.shHits or "")
		mobInfo.re = resistString
	end
end -- MI2_StoreResistData()


-----------------------------------------------------------------------------
-- MI2_StoreAllMobData()
--
-- Store all recorded data for a given mob in the mob database.
-----------------------------------------------------------------------------
function MI2_StoreAllMobData( mobData, mobName, mobLevel, playerName, mobIndex )
	if not mobIndex then
		mobIndex = mobName..":"..mobLevel
	end

	if MobInfoConfig.SaveBasicInfo == 1 then
		MI2_StoreBasicInfo( mobIndex, mobData )
	end

	if MobInfoConfig.SaveLocation == 1 and mobData.location then
		MI2_StoreLocation( mobIndex, mobData.location )
	end

	if MobInfoConfig.SaveCharData == 1 then
		MI2_StoreCharData( mobIndex, mobData, MI2_PlayerName )
	end

	if MobInfoConfig.SaveItems == 1 then
		MI2_StoreLootItems( mobIndex, mobData )
	end

	if MobInfoConfig.SaveResist == 1 then
		MI2_StoreResistData( mobIndex )
	end
end -- MI2_StoreAllMobData()


-----------------------------------------------------------------------------
-- MI2_RemoveCharData()
--
-- Remove all char specific data from the given Mob database record.
-----------------------------------------------------------------------------
function MI2_RemoveCharData( mobInfo )
	for entryName, entryData in pairs(mobInfo) do
		if entryName ~= "bi" and entryName ~= "qi" and entryName ~= "il" and entryName ~= "ml" and entryName ~= "ver" then
			mobInfo[entryName] = nil
		end
	end
end -- MI2_RemoveCharData()


-----------------------------------------------------------------------------
-- MI2_PrepareForImport()
--
-- Prepare for importing external MobInfo databases into the main database.
-----------------------------------------------------------------------------
function MI2_PrepareForImport()
	local mobDbSize, healthDbSize, itemDbSize = 0, 0, 0

	if not MobInfoDB then return end

	--	external database version number check
	local version = MobInfoDB["DatabaseVersion:0"].ver
	if version and (version < MI2_IMPORT_DB_VERSION or version > MI2_DB_VERSION) then
		MI2_Import_Status = "BADVER"
		return
	end

	local locale = MobInfoDB["DatabaseVersion:0"].loc
	if locale and locale ~= GetLocale() then
		MI2_Import_Status = "BADLOC"
		return
	end

	-- calculate Mob database size and import signature
	local levelSum, nameSum = 0, 0
	for index in pairs(MobInfoDB) do  
		mobDbSize = mobDbSize + 1
		local mobName, mobLevel = MI2_GetIndexComponents( index )
		levelSum = levelSum + mobLevel
		nameSum = nameSum + string.len( mobName )
	end
	for index in pairs(MobHealthDB) do  healthDbSize = healthDbSize + 1  end
	for index in pairs(MI2_ItemNameTable) do  itemDbSize = itemDbSize + 1  end
	MI2_Import_Signature = mobDbSize.."_"..healthDbSize.."_"..itemDbSize.."_"..levelSum.."_"..nameSum

	-- store copy of databases to be imported and calculate import status
	MobInfoDB["DatabaseVersion:0"] = nil
	MobInfoDB_Import = MobInfoDB
	MI2_ItemNameTable_Import = MI2_ItemNameTable
	--MI2_ZoneTable_Import = MI2_ZoneTable
	MobHealthDB_Import = MobHealthDB
	if mobDbSize > 1 then
		MI2_Import_Status = (mobDbSize-1)..MI_TXT_MOBS
	end
	if healthDbSize > 0 then
		if MI2_Import_Status then
			MI2_Import_Status = MI2_Import_Status.." & " 
		end
		MI2_Import_Status = (MI2_Import_Status or "")..healthDbSize..MI_TXT_HP_VALUES
	end
end -- MI2_PrepareForImport()
	
-----------------------------------------------------------------------------
-- MI2_DeleteMobData()
--
-- Delete data for a specific Mob from database and current target table.
-----------------------------------------------------------------------------
function MI2_DeleteMobData( mobIndex, deleteHealth )
	if mobIndex then
		MobInfoDB[mobIndex] = nil
		if deleteHealth then
			MobHealthDB[mobIndex] = nil
		end
		if mobIndex == MI2_Target.mobIndex then
			MI2_Target = {}
			MobHealth_Display()
		end
	end
end  -- MI2_DeleteMobData()


-----------------------------------------------------------------------------
-- MI2_DeleteItemFromDB()
--
-- Delete data for a specific Mob from database and current target table.
-----------------------------------------------------------------------------
function MI2_DeleteItemFromDB( itemID )
	for mobIndex, mobInfo in pairs(MobInfoDB) do
		local mobData = {}
		MI2_DecodeItemList( mobInfo, mobData )
		if mobData.itemList then
			mobData.itemList[itemID] = nil
			MI2_StoreLootItems( mobIndex, mobData )
		end
	end
	MI2_ItemNameTable[itemID] = nil
end  -- MI2_DeleteItemFromDB()


-----------------------------------------------------------------------------
-- MI2_DeleteAllMobData()
--
-- Set the global MobInfo player name. This is the abbreviated player name
-- that is just an index into the MobInfo player name table, where the real
-- name of the player is stored.
-----------------------------------------------------------------------------
function MI2_SetPlayerName()
	local charName = GetCVar( "realmName" )..':'..UnitName("player")
	if not MI2_CharTable[charName] then
		MI2_CharTable.charCount = MI2_CharTable.charCount + 1
		MI2_CharTable[charName] = "c"..MI2_CharTable.charCount
	end
	MI2_PlayerName = MI2_CharTable[charName]
end -- MI2_SetPlayerName()


-----------------------------------------------------------------------------
-- MI2_ClearMobCache()
--
-- Empty oput the mob data cache
-----------------------------------------------------------------------------
function MI2_ClearMobCache()
	MI2_MobCache = {}
	MI2_MobCacheIdx = 1
end -- MI2_ClearMobCache


-----------------------------------------------------------------------------
-- MI2_DeleteAllMobData()
--
-- Delete entire Mob database
-----------------------------------------------------------------------------
function MI2_DeleteAllMobData()
	MobInfoDB = { ["DatabaseVersion:0"] = { ver = MI2_DB_VERSION, loc=GetLocale() } }
	MI2_CharTable = { charCount = 0 }
	MI2_ItemNameTable = {}
	MI2_XRefItemTable = {}
	MI2_SetPlayerName()
	MI2_ClearMobCache()
	MI2_ZoneTable = { }
end  -- MI2_DeleteAllMobData()


-----------------------------------------------------------------------------
-- chattext()
--
-- spits out msg to the chat channel.
-----------------------------------------------------------------------------
function chattext(txt)
	if( DEFAULT_CHAT_FRAME ) then
		DEFAULT_CHAT_FRAME:AddMessage( mifontLightBlue.."<MI2> "..txt)
	end
end -- chattext()


-----------------------------------------------------------------------------
-- midebug()
--
-- add debug message to chat channel, handle debug detail level if given
-----------------------------------------------------------------------------
function midebug( txt, dbgLevel )
	if DEFAULT_CHAT_FRAME then
		if dbgLevel then
			if dbgLevel <= MI2_Debug then
				DEFAULT_CHAT_FRAME:AddMessage( mifontLightBlue.."[MI2DBG] "..txt)
			end
		else
			DEFAULT_CHAT_FRAME:AddMessage( mifontLightBlue.."<MI2DBG> "..txt)
		end
	end
end -- midebug()


-----------------------------------------------------------------------------
-- MI2_InitOptions()
--
-- initialize MobInfo configuration options
-- this takes into account new options that have been added to MobInfo
-- in the course of developement
-----------------------------------------------------------------------------
 function MI2_InitOptions()
	-- initialize MobInfoConfig
	if not MobInfoConfig or not MobInfoConfig.ShowLoots then
		MobInfoConfig = { }
		MI2_SlashAction_Default()
	end

	-- initial defaults for all config options
	if  not MobInfoConfig.ShowBlankLines	then  MobInfoConfig.ShowBlankLines = 1	end
	if  not MobInfoConfig.TargetFontSize	then  MobInfoConfig.TargetFontSize = 10	end
	if  not MobInfoConfig.DisableMobInfo	then  MobInfoConfig.DisableMobInfo = 0	end
	if  not MobInfoConfig.ShowDamage	then  MobInfoConfig.ShowDamage = 1		end
	if  not MobInfoConfig.ShowMana		then  MobInfoConfig.ShowMana = 1		end
	if  not MobInfoConfig.ShowEmpty		then  MobInfoConfig.ShowEmpty = 0		end
	if  not MobInfoConfig.CombinedMode	then  MobInfoConfig.CombinedMode = 0	end
	if  not MobInfoConfig.ShowCombined	then  MobInfoConfig.ShowCombined = 1	end
	if  not MobInfoConfig.KeypressMode	then  MobInfoConfig.KeypressMode = 0	end
	if  not MobInfoConfig.StableMax		then  MobInfoConfig.StableMax = 0		end
	if  not MobInfoConfig.TargetHealth	then  MobInfoConfig.TargetHealth = 1	end
	if  not MobInfoConfig.TargetMana	then  MobInfoConfig.TargetMana = 1		end
	if  not MobInfoConfig.HealthPercent	then  MobInfoConfig.HealthPercent = 1	end
	if  not MobInfoConfig.ManaPercent	then  MobInfoConfig.ManaPercent = 1		end
	if  not MobInfoConfig.HealthPosX	then  MobInfoConfig.HealthPosX = -7		end
	if  not MobInfoConfig.HealthPosY	then  MobInfoConfig.HealthPosY = 11		end
	if  not MobInfoConfig.ManaPosX		then  MobInfoConfig.ManaPosX = -7		end
	if  not MobInfoConfig.ManaPosY		then  MobInfoConfig.ManaPosY = 11		end
	if  not MobInfoConfig.TargetFont	then  MobInfoConfig.TargetFont = 2		end
	if  not MobInfoConfig.SavePlayerHp	then  MobInfoConfig.SavePlayerHp = 0	end
	if  not MobInfoConfig.CompactMode	then  MobInfoConfig.CompactMode = 1		end
	if  not MobInfoConfig.ShowItems		then  MobInfoConfig.ShowItems = 1		end
	if  not MobInfoConfig.SaveItems		then  MobInfoConfig.SaveItems = 1		end
	if  not MobInfoConfig.SaveCharData	then  MobInfoConfig.SaveCharData = 1	end
	if  not MobInfoConfig.ItemsQuality	then  MobInfoConfig.ItemsQuality = 2	end
	if  not MobInfoConfig.SaveBasicInfo	then  MobInfoConfig.SaveBasicInfo = 1	end
	if  not MobInfoConfig.ItemTooltip	then  MobInfoConfig.ItemTooltip = 1		end
	if  not MobInfoConfig.ItemFilter	then  MobInfoConfig.ItemFilter = ""		end
	if  not MobInfoConfig.ShowLocation	then  MobInfoConfig.ShowLocation = 1	end
	if  not MobInfoConfig.SaveLocation	then  MobInfoConfig.SaveLocation = 1	end
	if  not MobInfoConfig.ShowClothSkin	then  MobInfoConfig.ShowClothSkin = 1	end
	if  not MobInfoConfig.ImportOnlyNew	then  MobInfoConfig.ImportOnlyNew = 0	end
	if  not MobInfoConfig.SaveResist	then  MobInfoConfig.SaveResist = 1		end
	if  not MobInfoConfig.ShowResists	then  MobInfoConfig.ShowResists = 1		end

	-- former option "HealthOff" has been renamed to "DisableHealth"
	if  not MobInfoConfig.DisableHealth  then  
		MobInfoConfig.DisableHealth = (MobInfoConfig.HealthOff or 0)
	end

	-- config values that no longer exist
	if  MobInfoConfig.HealthOff		then	MobInfoConfig.HealthOff = nil  end
	if  MobInfoConfig.ManaDistance	then	MobInfoConfig.ManaDistance = nil end
	if  MobInfoConfig.ShowPercent	then	MobInfoConfig.ShowPercent = nil end
	if  MobInfoConfig.CustomTracks	then	MobInfoConfig.CustomTracks = nil end
	if  MobInfoConfig.SaveAllValues	then	MobInfoConfig.SaveAllValues = nil end
	if  MobInfoConfig.MobDbVersion	then	MobInfoConfig.MobDbVersion = nil end
	if  MobInfoConfig.MobDbVersion	then	MobInfoConfig.MobDbVersion = nil end
	if  MobInfoConfig.ClearOnExit	then	MobInfoConfig.ClearOnExit = nil end
	if  MobInfoConfig.SaveGoodItems	then	MobInfoConfig.SaveGoodItems = nil	end
	if  MobInfoConfig.SaveQualityData	then	MobInfoConfig.SaveQualityData = nil	end
end -- MI2_InitOptions()


-----------------------------------------------------------------------------
-- MI2_IndexComponents()
--
-- Return the component parts of a mob index: mob name, mob level
-----------------------------------------------------------------------------
function MI2_GetIndexComponents( mobIndex )
	local a, b, mobName, mobLevel = string.find(mobIndex, "(.+):(.+)$")
	mobLevel = tonumber(mobLevel)
	return mobName, mobLevel
end  -- MI2_IndexComponents()


-----------------------------------------------------------------------------
-- MI2_UpdateDatabaseToV7()
--
-- Update MobInfo database to version V7. This function can handle most of
-- the old versions and variants.
-----------------------------------------------------------------------------
local function MI2_UpdateDatabaseToV7()
	-- loop through all Mobs in the database
	for mobIndex, mobInfo in pairs(MobInfoDB) do
		-- build new "basic info" entry from old separate entries
		if (mobInfo.lt or mobInfo.el or mobInfo.cp or mobInfo.iv or mobInfo.cc) and not mobInfo.bi then
			if mobInfo.lt and mobInfo.lt <= 0 then mobInfo.lt = nil end
			if mobInfo.cp and mobInfo.cp <= 0 then mobInfo.cp = nil end
			if mobInfo.iv and mobInfo.iv <= 0 then mobInfo.iv = nil end
			if mobInfo.el and mobInfo.el <= 0 then mobInfo.el = nil end
			if mobInfo.cc and mobInfo.cc <= 0 then mobInfo.cc = nil end
			mobInfo.bi = (mobInfo.lt or "").."/"..(mobInfo.el or "").."/"..(mobInfo.cp or "").."/"..(mobInfo.iv or "").."/"..(mobInfo.cc or "").."//"..(mobInfo.mt or "").."/"
		end
		local s, slashCount = string.gsub( (mobInfo.bi or ""), "/", "@" )
		if slashCount == 6 then mobInfo.bi = mobInfo.bi.."/"; slashCount = slashCount + 1 end
		if mobInfo.bi == "////////" then mobInfo.bi = nil end
		if mobInfo.bi and slashCount ~= 7 then mobInfo.bi = nil end

		-- build new "quality info" entry from  old separate entries
		if (mobInfo.r0 or mobInfo.r1 or mobInfo.r2 or mobInfo.r3 or mobInfo.r4) and not mobInfo.qi then
			if mobInfo.r0 and mobInfo.r0 <= 0 then mobInfo.r0 = nil end
			if mobInfo.r1 and mobInfo.r1 <= 0 then mobInfo.r1 = nil end
			if mobInfo.r2 and mobInfo.r2 <= 0 then mobInfo.r2 = nil end
			if mobInfo.r3 and mobInfo.r3 <= 0 then mobInfo.r3 = nil end
			if mobInfo.r4 and mobInfo.r4 <= 0 then mobInfo.r4 = nil end
			mobInfo.qi = (mobInfo.r0 or "").."/"..(mobInfo.r1 or "").."/"..(mobInfo.r2 or "").."/"..(mobInfo.r3 or "").."/"..(mobInfo.r4 or "")
		end
		if mobInfo.qi == "////" then  mobInfo.qi = nil  end

		-- loop through all Mob database record entries, process char
		-- specific data, remove invalid or empty entries
		for entryName, entryData in pairs(mobInfo) do
			if type(entryData) == "table" then
				-- char specific data in table form found: convert it to new DB format
				local dl = entryData.dl
				local du = entryData.du
				local dd = entryData.dd
				if (dl or du) and not dd then
					dd = dl.."/"..du.."/"..0
				end
				mobInfo[entryName] = (entryData.kl or "").."/"..(dd or "").."/"..(mobInfo.xp or "")
			else
				local isCharEntry = (type(entryData) == "string") and (string.find(entryName,":") ~= nil or MI2_CharTable[entryName]) and string.find(entryData,"/") ~= nil
				isCharEntry = isCharEntry or type(entryData) == "string"
				if isCharEntry then
					if mobInfo[entryName] == "///" or mobInfo[entryName] == "///" then
						mobInfo[entryName] = nil
					end
				elseif entryName ~= "bi" and entryName ~= "qi" and entryName ~= "il" and entryName ~= "ml" and entryName ~= "re" then
					mobInfo[entryName] = nil
				end
			end
		end -- for
	end -- for

	-- loop through all Mobs in the database and convert char name into char index
	-- delete all empty mob records
	for mobIndex, mobInfo in pairs(MobInfoDB) do
		local entryCount = 0
		for entryName, entryData in pairs(mobInfo) do
			entryCount = entryCount + 1
			local isCharEntry = (type(entryData) == "string") and string.find(entryName,":") ~= nil and string.find(entryData,"/") ~= nil
			if isCharEntry then
				if not MI2_CharTable[entryName] then
					MI2_CharTable.charCount = MI2_CharTable.charCount + 1
					MI2_CharTable[entryName] = "c"..MI2_CharTable.charCount
				end
				mobInfo[MI2_CharTable[entryName]] = entryData
				mobInfo[entryName] = nil
			end
		end -- for
		if entryCount == 0 then
			MobInfoDB[mobIndex] = nil
		end
	end -- for
end -- MI2_UpdateDatabaseToV7()


-----------------------------------------------------------------------------
-- MI2_UpdateDatabaseV7ToV8()
--
-- update database from V7 to V8 : add all zones to the MobInfo
-- zone table and give them new zone IDs, index the zone table
-- by ID instead of name
-----------------------------------------------------------------------------
local function MI2_UpdateDatabaseV7ToV8()
	local zoneName, zoneId, mobIndex, mobInfo, newZoneTable

	-- swap index with name in zone table
	newZoneTable = {}
	--MI2_ZoneTable.cnt = nil
	for zoneName, zoneId in pairs(MI2_ZoneTable) do
		newZoneTable[zoneId] = zoneName
	end
	MI2_ZoneTable = newZoneTable
	--MI2_ZoneTable.cnt = 0

	-- add names of ALL zones to zone table and store
	-- the new zone ID in mob data
	for mobIndex, mobInfo in pairs(MobInfoDB) do
		local mobData = {}
		MI2_DecodeMobLocation( mobInfo, mobData )
		if mobData.location then
			local zone = mobData.location.z
			if zone < 100 then
				local cont = mobData.location.c
				zoneName = MI2_Zones[cont][zone]
				--MI2_SetNewZone( zoneName )
				mobData.location.z = MI2_CurZone
				MI2_StoreLocation( mobIndex, mobData.location )
			end
		end
	end
end -- MI2_UpdateDatabaseV7ToV8()


-----------------------------------------------------------------------------
-- MI2_CleanupDatabases()
--
-- Cleanup for MobInfo database. This function corrects bugs in the
-- MobInfo database and applies changes that have been made to the
-- format of the actual database entires.
-----------------------------------------------------------------------------
function MI2_CleanupDatabases()
	local mobIndex, mobInfo
	local dbVerInfo = MobInfoDB["DatabaseVersion:0"] or { ver=0 }
	local version = dbVerInfo.ver

	MobInfoDB["DatabaseVersion:0"] = nil
	MobInfoDB.DatabaseVersion = nil

	-- delete DB entries with buggy index
	for mobIndex in pairs(MobInfoDB) do
		local mobName, mobLevel = MI2_GetIndexComponents( mobIndex )
		if not mobName or not mobLevel or mobName == "" then
			MobInfoDB[mobIndex] = nil
		end
	end

	-- update database to current version
	if version  < 7 then
		MI2_UpdateDatabaseToV7()
	end
	if version  < 8 then
		MI2_UpdateDatabaseV7ToV8()
	end

	MobInfoDB["DatabaseVersion:0"] = { ver = MI2_DB_VERSION, loc=GetLocale() }
end  -- MI2_CleanupDatabases()


-----------------------------------------------------------------------------
-- MI2_SetNewZone()
--
-- Set a new zone as the MI2 current zone. Add the zone to the MI2 zone
-- name table if zone is unknown.
-----------------------------------------------------------------------------
function MI2_SetNewZone( zoneName,  continent, zone)
	if not zoneName or zoneName == "" then return end

	-- find zone ID if zone is already known
	local name, id, zoneId
	for id, name in pairs(MI2_ZoneTable) do
		if name == zoneName then
			zoneId = id
			break
		end
	end

	-- add unknown zone to table
	if not zoneId then
	--	MI2_ZoneTable.cnt = MI2_ZoneTable.cnt + 1
		zoneId = continent*100+zone--200 + MI2_ZoneTable.cnt
		MI2_ZoneTable[zoneId] = zoneName
	end

	MI2_CurZone = zone
end -- MI2_SetNewZone()


-----------------------------------------------------------------------------
-- MI2_AddItemToXRefTable()
--
-- update the cross reference table for fast item lookup
-- The table is indexed by item name and lists all Mobs that drop the item
-----------------------------------------------------------------------------
local function MI2_AddItemToXRefTable( mobIndex, itemName, itemAmount )
	if not MI2_XRefItemTable[itemName] then
		MI2_XRefItemTable[itemName] = {}
	end

	local oldAmount = MI2_XRefItemTable[itemName][mobIndex]
	MI2_XRefItemTable[itemName][mobIndex] = (oldAmount or 0) + itemAmount
end -- MI2_AddItemToXRefTable()


-----------------------------------------------------------------------------
-- MI2_BuildXRefItemTable()
--
-- build the cross reference table for fast item lookup
-- The table is indexed by item name and lists all Mobs that drop the item.
-- It is needed for quickly generating the "Dropped By" list in item tooltips.
-----------------------------------------------------------------------------
function MI2_BuildXRefItemTable()
	local mobIndex, mobInfo

	MI2_XRefItemTable = {}
	for mobIndex, mobInfo in pairs(MobInfoDB) do
		local mobData = {}
		MI2_DecodeItemList( mobInfo, mobData )
		if mobData.itemList then 
			for itemID, amount in pairs(mobData.itemList) do
				local itemText = MI2_ItemNameTable[itemID]
				if itemText then
					itemText = string.sub( itemText, 1, -3 )
					MI2_AddItemToXRefTable( mobIndex, itemText, amount )
				end
			end
		end
	end
end -- MI2_BuildXRefItemTable()


-----------------------------------------------------------------------------
-- MI2_CombineLocations()
--
-- Combine the location area of a given Mob with a second (new) location.
-- The "correctWrongZone" flag can be sued to force a correction if wrong
-- zones in mobData.
-----------------------------------------------------------------------------
local function MI2_CombineLocations( mobData, loc2, correctWrongZone )
	local loc1 = mobData.location
	if loc1 or loc2 then
		if not loc1 or not loc1.z then
			mobData.location = loc2
		elseif loc2 then
			if loc1.z ~= loc2.z or loc1.c ~= loc2.c then
				if correctWrongZone then
					mobData.location = loc2
				end
			else
				if loc2.x1 < loc1.x1 then loc1.x1 = loc2.x1 end
				if loc2.x2 > loc1.x2 then loc1.x2 = loc2.x2 end
				if loc2.y1 < loc1.y1 then loc1.y1 = loc2.y1 end
				if loc2.y2 > loc1.y2 then loc1.y2 = loc2.y2 end
			end
		end
	end
end -- MI2_CombineLocations


-----------------------------------------------------------------------------
-- MI2_RecordLocationAndType()
--
-- Record the current player location as the Mob location, record the type
-- of the mob (normal, elite, boss). This function is intended to be called
-- when targetting a Mob.
-----------------------------------------------------------------------------
function MI2_RecordLocationAndType( mobIndex )
	if MI2_MouseoverIndex == mobIndex then return end

	local mobData = MI2_FetchMobData( mobIndex )

	if MobInfoConfig.SaveLocation == 1 then
		local x, y = GetPlayerMapPosition("player")
		x = floor( x * 100.0 )
		y = floor( y * 100.0 )
		local cont=GetCurrentMapContinent()
		local zon=GetCurrentMapZone()
		local newLocation = { x1=x, x2=x, y1=y, y2=y, c=cont, z=zon}
		midebug( MI_TXT_REC_LOC.."  ("..x.."/"..y.."),c="..cont..", z="..zon, 1 )
		MI2_CombineLocations( mobData, newLocation, true )
		MI2_StoreLocation( mobIndex, mobData.location )
	end

	if MobInfoConfig.SaveBasicInfo == 1 then
		local mobType = UnitClassification("target")
		if mobType == "normal" then
		elseif mobType == "rare" or mobType == "elite" then
			mobData.mobType = 2
		elseif mobType == "rareelite" or mobType == "worldboss" then
			mobData.mobType = 3
		end
		if mobData.mobType > 1 then
			MI2_StoreBasicInfo( mobIndex, mobData )
		end
	end
end -- MI2_RecordLocationAndType()


-----------------------------------------------------------------------------
-- MI2_RecordExtraMobType()
--
-- Record the current player location as the Mob location, record the type
-- of the mob (normal, elite, boss). This function is intended to be called
-- when targetting a Mob.
-----------------------------------------------------------------------------
function MI2_RecordLowHpAction( creature, action )
	if MobInfoConfig.SaveBasicInfo == 1 and MI2_Target.mobIndex and MI2_Target.name == creature then
		local mobData = MI2_FetchMobData( MI2_Target.mobIndex )
		mobData.lowHpAction = action
		MI2_StoreBasicInfo( MI2_Target.mobIndex, mobData )
	end
end -- MI2_RecordExtraMobType()


-----------------------------------------------------------------------------
-- MI2_RecordKill()
--
-- record data related to a mob kill
-- attempt to find correct mob DB index based on situation and killed mobs
-- name (kill msg gives only name, not level)
-----------------------------------------------------------------------------
function MI2_RecordKill( creatureName, xp )
	-- try to find DB index for mob that was killed
	local mobIndex
	if MI2_Target.name == creatureName then
		mobIndex = MI2_Target.mobIndex
	elseif MI2_LastTargetIdx and string.find(MI2_LastTargetIdx, creatureName) then
		mobIndex = MI2_LastTargetIdx
	else
		for i=1,MI2_CACHE_SIZE do
			local idx = MI2_MobCache[i]
			if idx and string.find(idx, creatureName) then
				mobIndex = idx
				break
			end
		end
	end

	if MobInfoConfig.SaveCharData == 1 and mobIndex then
		local mobData = MI2_FetchMobData( mobIndex )
		if xp then
			mobData.xp = xp
		end
		if (xp and not mobData.killed) or not xp then
			mobData.kills = (mobData.kills or 0) + 1
			mobData.killed = 1
		end
		midebug( MI_TXT_REC_KILL_MOB.."="..mobIndex..", "..MI_TXT_REC_KILL_MOB_KILLS.."="..mobData.kills..", "..MI_TXT_REC_KILL_MOB_XP.."="..(xp or "nil"), 1 )
		MI2_StoreCharData( mobIndex, mobData, MI2_PlayerName )
	end
end -- MI2_RecordKill()


-----------------------------------------------------------------------------
-- MI2_RecordDamage()
--
-- record min/max damage value for mob
-----------------------------------------------------------------------------
function MI2_RecordDamage( mobIndex, damage )
	if damage > 0 then
		local mobData = MI2_FetchMobData( mobIndex )
		if not mobData.minDamage or mobData.minDamage <= 0 then
			mobData.minDamage, mobData.maxDamage = damage, damage
		elseif damage < mobData.minDamage then
			midebug( MI_TXT_REC_NEW_MIN_DMG..damage..MI_TXT_REC_NEW_DMG_FOR.."["..mobIndex.."] ("..MI_TXT_REC_NEW_DMG_OLD.."="..mobData.minDamage..")", 1 )
			mobData.minDamage = damage
		elseif damage > mobData.maxDamage then
			midebug( MI_TXT_REC_NEW_MAX_DMG..damage..MI_TXT_REC_NEW_DMG_FOR.."["..mobIndex.."] ("..MI_TXT_REC_NEW_DMG_OLD.."="..mobData.maxDamage..")", 1 )
			mobData.maxDamage = damage
		end
	end
end -- MI2_RecordDamage()


-----------------------------------------------------------------------------
-- MI2_RecordDps()
--
-- record a new dps (damage per second) value for a specific mob
-- dps gets calculated from damage done within a given time
-----------------------------------------------------------------------------
function MI2_RecordDps( mobIndex, deltaTime, damage  )
	-- only store dps for fights longer then 4 seconds
	if MobInfoConfig.SaveCharData == 1 and deltaTime > 4 then
		local mobData = MI2_FetchMobData( mobIndex )
		local newDps = damage / deltaTime
		if not mobData.dps then mobData.dps = newDps end
		mobData.dps = floor( ((2.0 * mobData.dps) + newDps) / 3.0 )
		MI2_StoreCharData( mobIndex, mobData, MI2_PlayerName )
		midebug( MI_TXT_REC_NEW_DPS.."="..mobIndex..", "..MI_TXT_NEW_DPS.."="..mobData.dps, 1 )
	end
end -- MI2_RecordDps()


-----------------------------------------------------------------------------
-- MI2_AddTwoMobs()
--
-- add the data for two mobs,
-- the data of the second mob (mobData2) is added to the data of the first
-- mob (mobData1). The result is returned in "mobData1".
-----------------------------------------------------------------------------
function MI2_AddTwoMobs( mobData1, mobData2 )
	-- add up basic mob data
	mobData1.loots = (mobData1.loots or 0) + (mobData2.loots or 0)
	mobData1.kills = (mobData1.kills or 0) + (mobData2.kills or 0)
	mobData1.emptyLoots = (mobData1.emptyLoots or 0) + (mobData2.emptyLoots or 0)
	mobData1.clothCount = (mobData1.clothCount or 0) + (mobData2.clothCount or 0)
	mobData1.copper = (mobData1.copper or 0) + (mobData2.copper or 0)
	mobData1.itemValue = (mobData1.itemValue or 0) + (mobData2.itemValue or 0)
	mobData1.skinCount = (mobData1.skinCount or 0) + (mobData2.skinCount or 0)
	mobData1.r1 = (mobData1.r1 or 0) + (mobData2.r1 or 0)
	mobData1.r2 = (mobData1.r2 or 0) + (mobData2.r2 or 0)
	mobData1.r3 = (mobData1.r3 or 0) + (mobData2.r3 or 0)
	mobData1.r4 = (mobData1.r4 or 0) + (mobData2.r4 or 0)
	mobData1.r5 = (mobData1.r5 or 0) + (mobData2.r5 or 0)
	if mobData2.mobType then mobData1.mobType = mobData2.mobType end
	if not mobData1.xp then mobData1.xp = mobData2.xp end

	MI2_CombineLocations( mobData1, mobData2.location )

	-- combine DPS
	if not mobData1.dps then
		mobData1.dps = mobData2.dps
	else
		if mobData2.dps then
			mobData1.dps = floor( ((2.0 * mobData1.dps) + mobData2.dps) / 3.0 )
		end
	end

	-- combine resist data
	local resdat1 = mobData1.resists or {}
	local resdat2 = mobData2.resists or {}
	resdat1.ar	= (resdat1.ar or 0) + (resdat2.ar or 0)
	resdat1.fi	= (resdat1.fi or 0) + (resdat2.fi or 0)
	resdat1.fr	= (resdat1.fr or 0) + (resdat2.fr or 0)
	resdat1.ho	= (resdat1.ho or 0) + (resdat2.ho or 0)
	resdat1.na	= (resdat1.na or 0) + (resdat2.na or 0)
	resdat1.sh	= (resdat1.sh or 0) + (resdat2.sh or 0)
	resdat1.arHits	= (resdat1.arHits or 0) + (resdat2.arHits or 0)
	resdat1.fiHits	= (resdat1.fiHits or 0) + (resdat2.fiHits or 0)
	resdat1.frHits	= (resdat1.frHits or 0) + (resdat2.frHits or 0)
	resdat1.hoHits	= (resdat1.hoHits or 0) + (resdat2.hoHits or 0)
	resdat1.naHits	= (resdat1.naHits or 0) + (resdat2.naHits or 0)
	resdat1.shHits	= (resdat1.shHits or 0) + (resdat2.shHits or 0)
	mobData1.resists = resdat1

	-- combine minimum and maximum damage	
	if (mobData2.minDamage or 99999) < (mobData1.minDamage or 99999) then
		mobData1.minDamage = mobData2.minDamage
	end
	if (mobData2.maxDamage or 0) > (mobData1.maxDamage or 0) then
		mobData1.maxDamage = mobData2.maxDamage
	end
	
	-- add loot item tables
	if mobData2.itemList then
		if not mobData1.itemList then mobData1.itemList = {} end
		for itemID, amount in pairs(mobData2.itemList) do
			mobData1.itemList[itemID] = (mobData1.itemList[itemID] or 0) + mobData2.itemList[itemID]
		end
	end

	if mobData1.loots == 0 then mobData1.loots = nil end
	if mobData1.kills == 0 then mobData1.kills = nil end
	if mobData1.emptyLoots == 0 then mobData1.emptyLoots = nil end
	if mobData1.clothCount == 0 then mobData1.clothCount = nil end
	if mobData1.copper == 0 then mobData1.copper = nil end
	if mobData1.itemValue == 0 then mobData1.itemValue = nil end
	if mobData1.skinCount == 0 then mobData1.skinCount = nil end
	if mobData1.dps == 0 then mobData1.dps = nil end
	if mobData1.r1 == 0 then mobData1.r1 = nil end
	if mobData1.r2 == 0 then mobData1.r2 = nil end
	if mobData1.r3 == 0 then mobData1.r3 = nil end
	if mobData1.r4 == 0 then mobData1.r4 = nil end
	if mobData1.r5 == 0 then mobData1.r5 = nil end
end  -- MI2_AddTwoMobs


-----------------------------------------------------------------------------
-- MI2_GetMobHealthStr()
--
-- Returns the mobhealth in the form of xx/xx from the mobdb formed by
-- MobHealth mod Pulled from Telo's MobHealth
-----------------------------------------------------------------------------
local function MI2_GetMobHealthStr( index, healthPercent )
	local ppp = MobHealth_PPP( index )
	if ppp > 0 and healthPercent then
		return string.format("%d / %d", (healthPercent * ppp) + 0.5, (100 * ppp) + 0.5)
	end
end -- MI2_GetMobHealthStr()


-----------------------------------------------------------------------------
-- copper2text()
--
-- Turns a full copper amount to a readable string, eg. 10340 = 1g 3s 40c
-----------------------------------------------------------------------------
function copper2text(copper)
	local g,s,c
		
	g = floor(copper / COPPER_PER_GOLD)
	s = floor(copper / COPPER_PER_SILVER) - g * SILVER_PER_GOLD
	c = copper - g * COPPER_PER_GOLD - s * COPPER_PER_SILVER

	if g > 0 then  
  		return mifontWhite..g..mifontYellow..'g '..mifontWhite..s ..mifontSubWhite..'s '..mifontWhite..c..mifontGold..'c'
	end  

	if s > 0 then  
  		return mifontWhite..s ..mifontSubWhite..'s '..mifontWhite..c..mifontGold..'c'
	end  

	return mifontWhite..c..mifontGold..'c'
end


-----------------------------------------------------------------------------
-- lootName2Copper()
--
-- Turns a lootname like 1 Gold 3 Silver 40 Copper to total copper 10340
-----------------------------------------------------------------------------
function lootName2Copper(item)
	local i = 0
	local g,s,c = 0
	local money = 0
	  
	i = string.find(item, MI_TXT_GOLD )
	if i then
		g = tonumber( string.sub(item,0,i-1) )
		item = string.sub(item,i+5,string.len(item))
		money = money + ((g or 0) * COPPER_PER_GOLD)
	end
	i = string.find(item, MI_TXT_SILVER )
	if i then
		s = tonumber( string.sub(item,0,i-1) )
		item = string.sub(item,i+7,string.len(item))
		money = money + ((s or 0) * COPPER_PER_SILVER)
	end
	i = string.find(item, MI_TXT_COPPER )
	if i then
		c = tonumber( string.sub(item,0,i-1) )
		money = money + (c or 0)
	end

	return money
end -- lootName2Copper()


-----------------------------------------------------------------------------
-- MI2_FindItemValue()
--
-- Find the item value in either the Auctioneer database or in out own copy
-- of the Auctioneer item value database or by asking KC_Items
-----------------------------------------------------------------------------
function MI2_FindItemValue( itemID )
	local price = 0
	
	-- check if KC_Items is available and knows the price
	if KC_Common and KC_Common.GetItemPrices then
		price = KC_Common:GetItemPrices(itemID) or 0

	-- check if ItemsSync is installed and knows the price
	elseif ISync and ISync.FetchDB then
		price = tonumber( ISync:FetchDB(itemID, "price") or 0 )
	end

	-- check if Auctioneer is installed and knows the price
	if price == 0 and Auctioneer_GetVendorBuyPrice then
		price = Auctioneer_GetVendorSellPrice(itemID)
	end

	-- check if Informant is installed and knows the price
	if price == 0 and Informant then
		local itdata = Informant.GetItem(itemID)--byCFM
		if (itdata and itdata['sell'] and itdata['sell'] ~= 0) then price=itdata['sell'] end --byCFM
	end
	-- check if pfUI is installed and knows the price
	if price == 0 and pfUI and pfSellData then
		if pfSellData[itemID] then --by CFM
			local _, _, sell,_ = strfind(pfSellData[itemID], "(.*),(.*)") -- by CFM
			price = tonumber(sell) -- by CFM
		end
	end
	return price or 0
end -- MI2_FindItemValue()


-----------------------------------------------------------------------------
-- GetLootId()
--
-- get loot ID code for given loot slot number, also return link object
-----------------------------------------------------------------------------
local function GetLootId( slot )
	local itemId = 0
	local link = GetLootSlotLink( slot )

	if link then
		local _, _, idCode = string.find(link, "|Hitem:(%d+):(%d+):(%d+):")
		itemId = tonumber( idCode or 0 )
	end

	return itemId
end -- GetLootId()


-----------------------------------------------------------------------------
-- MI2_RecordLootSlotData()
--
-- Record the data for one loot item. This function is called in turn for
-- each loot item in the loot window.
-- Retiurns 2 values : isSkinningItem, isClamMeat
-----------------------------------------------------------------------------
local function MI2_RecordLootSlotData( mobIndex, mobData, slotID )
	local skinningLoot = false

	-- obtain loot slot data from WoW
	-- abort loot processing upon finding clam meat (ie. a clam was opened)
	local texture, itemName, quantity, quality = GetLootSlotInfo( slotID )
	if string.find(itemName, MI_TXT_CLAM_MEAT) ~= nil then  return false,true  end
	local itemID = GetLootId( slotID )
	quality = quality + 1

	-- identify and count money loot, make sure it does not get counted as an item
	if LootSlotIsCoin(slotID) then
		local money = lootName2Copper(itemName)
		mobData.copper = (mobData.copper or 0) + money
		quality = -1
	end

	-- record item data within Mob database and in global item table
	-- update cross reference table accordingly
	if MobInfoConfig.SaveItems == 1 and quality >= MobInfoConfig.ItemsQuality then
		if not mobData.itemList then mobData.itemList = {} end
		mobData.itemList[itemID] = (mobData.itemList[itemID] or 0) + quantity
		MI2_ItemNameTable[itemID] = itemName.."/"..quality
		MI2_AddItemToXRefTable( mobIndex, itemName, quantity )
	end

	-- exit right here if this is a skinning loot window
	if slotID == 1 and miSkinLoot[itemID] then  return true,false  end

	if LootSlotIsItem(slotID) then
		local itemValue = MI2_FindItemValue( itemID )
		mobData.itemValue = (mobData.itemValue or 0) + itemValue
		-- try to skip quest items in quality overview
		if itemValue < 1 and quality == 2 then quality = -1 end
	end

	-- cloth drop couter
	if miClothLoot[itemID] then
		mobData.clothCount = (mobData.clothCount or 0) + miClothLoot[itemID]
	end

	-- record loot item quality (if enabled)
	if quality == 1 then 
		mobData.r1 = (mobData.r1 or 0) + 1
	elseif quality == 2 then
		mobData.r2 = (mobData.r2 or 0) + 1
	elseif quality == 3 then
		mobData.r3 = (mobData.r3 or 0) + 1
	elseif quality == 4 then
		mobData.r4 = (mobData.r4 or 0) + 1
	elseif quality == 5 then
		mobData.r5 = (mobData.r5 or 0) + 1
	end
	
	midebug( MI_TXT_LOOT_SLOT.."="..slotID..", "..MI_TXT_Q_NAME.."=["..itemName.."], "..MI_TXT_Q_ID.."=["..itemID.."], "..MI_TXT_Q_q.."=["..(quality).."]", 1 )
	return false,false
end -- MI2_RecordLootSlotData()


-----------------------------------------------------------------------------
-- MI2_RecordAllLootItems()
--
-- Record the data for all items found in the currently open loot window.
-- Return to the caller whether this loot window represents real mob loot
-- or not. Examples for "not" are: skinning, clam loot
-----------------------------------------------------------------------------
function MI2_RecordAllLootItems( mobIndex, numItems )
	local skinningLoot = false
	local mobData = MI2_FetchMobData( mobIndex )

	-- iterate through all loot slots and record data for each item
	for slotID = 1, numItems, 1 do
		local skin, clam = MI2_RecordLootSlotData( mobIndex, mobData, slotID )
		if clam then return end
		skinningLoot = skinningLoot or skin
	end -- for loop

	if skinningLoot then
		mobData.skinCount = (mobData.skinCount or 0) + 1
	else
		-- update loot and empty loot counter
		mobData.loots = (mobData.loots or 0) + 1
		if numItems < 1 then
			mobData.emptyLoots = (mobData.emptyLoots or 0) + 1
		end
	end

	if MobInfoConfig.SaveBasicInfo == 1 then
		MI2_StoreBasicInfo( mobIndex, mobData )
	end
	if MobInfoConfig.SaveItems == 1 then
		MI2_StoreLootItems( mobIndex, mobData )
	end
end -- MI2_RecordAllLootItems()


-----------------------------------------------------------------------------
-- MI2_GetCorpseId()
--
-- create a (hopefully) unique corpse ID out of the loot items found in 
-- the corpse loot window, return nil if loot is empty
-- WoW Bug: GetNumLootItems() includes emptied loot window slots
-----------------------------------------------------------------------------
function MI2_GetCorpseId( index )
	local corpseId
	local numItems = 0 
	local numSlots = GetNumLootItems()

	if index and numSlots > 0 then
		corpseId = index
		for slot = 1, numSlots do
			local texture, item = GetLootSlotInfo( slot )
			if item ~= "" then corpseId = corpseId..item end
		end
	end

	return corpseId
end -- MI2_GetCorpseId()


-----------------------------------------------------------------------------
-- MI2_StoreCorpseId()
--
-- enter given corpse ID into list of all corpse IDs
-- a list of corpse IDs is maintained to allow detecting corpse reopening
-----------------------------------------------------------------------------
function MI2_StoreCorpseId( corpseId, isNewCorpse )
	midebug( MI_TXT_NEW_CORPSE.." ["..(corpseId or "nil").."], newIdx="..MI2_NewCorpseIdx..", curIdx="..(MI2_CurrentCorpseIndex or "<nil>"), 1 )

	-- store a new corpse ID
	if isNewCorpse then
		MI2_NewCorpseIdx = MI2_NewCorpseIdx + 1
		if MI2_NewCorpseIdx > 10 then
			MI2_NewCorpseIdx = 1
		end
		MI2_CurrentCorpseIndex = MI2_NewCorpseIdx
	end

	if MI2_CurrentCorpseIndex then
		MI2_RecentLoots[MI2_CurrentCorpseIndex] = corpseId
		if not corpseId then
			MI2_CurrentCorpseIndex = nil
		end
	end
end -- MI2_StoreCorpseId()


-----------------------------------------------------------------------------
-- MI2_CheckForCorpseReopen()
--
-- Check if the corpse for the given mob index is being reopened.
-- This is done by calculating a (hopefully) unique corpse ID and adding
-- it to the list if it is a new corpse ID. 
-----------------------------------------------------------------------------
function MI2_CheckForCorpseReopen( mobIndex )
	local isReopen = false
	local corpseId = MI2_GetCorpseId( mobIndex )

	-- check if corpse ID is already in the list
	for index, recentCorpseId in pairs(MI2_RecentLoots) do
		if recentCorpseId == corpseId then
			MI2_CurrentCorpseIndex = index
			isReopen = true
			break
		end
	end

	-- add corpse ID the the list if it is a new one
	if corpseId and not isReopen then
		MI2_StoreCorpseId( corpseId, 1 )
	end

	return isReopen
end -- MI2_CheckForCorpseReopen()


-----------------------------------------------------------------------------
-- MI2_GetLootItemString()
--
-- Get and return a string describing a specific loot item.
-- The loot item is identified by its item ID.
-- The color for the string is returned as well
-----------------------------------------------------------------------------
function MI2_GetLootItemString( itemID )
	local itemString = MI2_ItemNameTable[itemID] or tostring(itemID)
	local color

	-- extract quality from string
	local s,e, quality = string.find( itemString, "/(%d+)" )
	if s then itemString = string.sub( itemString, 1, s-1 ) end
	if quality then color = MI2_QualityColor[tonumber(quality)] end

	return itemString, (color or mifontLightRed)
end -- MI2_GetLootItemString()


-----------------------------------------------------------------------------
-- MI2_AddOneItemToTooltip()
--
-- Add one loot item description line to the tooltip. Item description
-- texts can optionally be shortened. Skinning loot uses skinned counter
-- instead of looted counter.
-----------------------------------------------------------------------------
local function MI2_AddOneItemToTooltip( mobData, itemID, amount, useFilter )
	local itemText, itemColor = MI2_GetLootItemString( itemID )

	-- apply item filter is requested
	if useFilter then
		if MobInfoConfig.ItemFilter ~= ""  then
			local itemNotOK = string.find( string.lower(itemText), string.lower(MobInfoConfig.ItemFilter) ) == nil
			if itemNotOK then return end
		end
	else
		itemColor = "* "..itemColor -- prefix for cloth and skinning loot
	end

	-- shorten item text to keep tooltip reasonably small
	local shortItemNames = true
	
	if shortItemNames and string.len(itemText) > 35 then
		itemText = string.sub(itemText,1,35).."..."
	end
	
	itemText = itemText..": "..amount

	local totalAmount = mobData.loots
	if miSkinLoot[itemID] then
		totalAmount = mobData.skinCount
	end
	if totalAmount and totalAmount > 0 then
		itemText = itemText.." ("..ceil(amount/totalAmount*100).."%)"  
	end
	
	GameTooltip:AddLine( itemColor..itemText )
end -- MI2_AddOneItemToTooltip


-----------------------------------------------------------------------------
-- MI2_AddItemsToTooltip()
--
-- Add the list of items to the Mob tooltip. This function must be
-- called only for mobs that exist and that have an existing item list.
--
-- Notoriously similar and numerous items that radically increase tooltip
-- size without being of much (if any) interest will be collapsed into
-- just one item (example: "Green Hills of Stranglethorn" pages).
-----------------------------------------------------------------------------
local function MI2_AddItemsToTooltip( mobData )
	local normalList = {}
	local collapsedList = {}
	local skinList = {}
	local clothList = {}

	-- sort items into 4 separate lists: normal, skin, cloth, collapsed
	for itemID, amount in pairs(mobData.itemList) do
		if miSkinLoot[itemID] then
			skinList[itemID] = amount
		elseif miClothLoot[itemID] then
			clothList[itemID] = amount
		elseif MI2_ItemCollapseList[itemID] then
			-- collapse almost identical items into one item
			if MI2_ItemCollapseList[itemID] == 0 then
				MI2_ItemCollapseList[itemID] = itemID
			end
			local collapsedID = MI2_ItemCollapseList[itemID]
			collapsedList[collapsedID] = (collapsedList[collapsedID] or 0) + amount
		else
			normalList[itemID] = amount
		end
	end

	-- add all cloth and skinning items to tooltip
	if MobInfoConfig.ShowClothSkin == 1 then
		for itemID, amount in pairs(skinList) do
			MI2_AddOneItemToTooltip( mobData, itemID, amount, false )
		end
		for itemID, amount in pairs(clothList) do
			MI2_AddOneItemToTooltip( mobData, itemID, amount, false )
		end
	end

	-- third: add normal and collapsed items to tooltip
	if MobInfoConfig.ShowItems == 1 then
		for itemID, amount in pairs(normalList) do
			MI2_AddOneItemToTooltip( mobData, itemID, amount, true )
		end
		for itemID, amount in pairs(collapsedList) do
			MI2_AddOneItemToTooltip( mobData, itemID, amount, true )
		end
	end
end -- MI2_AddItemsToTooltip


-----------------------------------------------------------------------------
-- MI2_AddLocationToTooltip()
--
-- Add the Mob location to the tooltip. Mob location always uses an entire
-- tooltip line.
-----------------------------------------------------------------------------
local function MI2_AddLocationToTooltip( location, showFullLocation )
	local x = floor( (location.x1 + location.x2) / 2 )
	local y = floor( (location.y1 + location.y2) / 2 )
	local index = location.c*100+location.z
	local zone = MI2_ZoneTable[index]
	if zone then
		if showFullLocation then
			GameTooltip:AddLine( mifontGold..MI_TXT_LOCATION..mifontWhite..zone.." ("..x.."/"..y..")" )
		else
			GameTooltip:AddLine( mifontGold..MI_TXT_LOCATION..mifontWhite..zone )
		end
	end
end -- MI2_AddLocationToTooltip()


-----------------------------------------------------------------------------
-- MI2_AddResistToTooltip()
--
-- Add the Mob resistances and immunities data to the tooltip.
-----------------------------------------------------------------------------
local function MI2_AddResistToTooltip( resistData )
	local resiatances = ""
	local immunities = ""
	local shortcut, value

	for shortcut, value in pairs(resistData) do
		if string.len(shortcut) < 3 then
			local hits = tonumber(resistData[shortcut.."Hits"]) or 1
			if value < 0 then
				if hits < 1 then
					immunities = "  "..immunities..MI2_SpellSchools[shortcut]
				else
					immunities = "  "..immunities..MI2_SpellSchools[shortcut].."(partial)"
				end
			elseif value > 0 then
				resiatances = "  "..resiatances..MI2_SpellSchools[shortcut]..":"..ceil((value/hits)*100).."%"
			end
		end
	end

	if resiatances ~= "" then
		GameTooltip:AddLine( mifontGold..MI_TXT_RESIST..mifontWhite..resiatances )
	end

	if immunities ~= "" then
		GameTooltip:AddLine( mifontGold..MI_TXT_IMMUN..mifontWhite..immunities )
	end
end -- MI2_AddResistToTooltip


-----------------------------------------------------------------------------
-- MI2_CreateNormalTooltip()
--
-- add all collected mob data to the game tooltip, data is only added if
-- corresponding "Show" flag is set
-----------------------------------------------------------------------------
local function MI2_CreateNormalTooltip( mobData, mobIndex, showFullLocation )
	local copperAvg, itemValueAvg
	local addEmptyLine = 0
	
	if mobData.lowHpAction == 1 then
		GameTooltip:AddLine( mifontLightRed..">>>  "..MI2_CHATMSG_MONSTEREMOTE.."  <<<" )
	end

	if mobData.class and MobInfoConfig.ShowClass == 1 then
		GameTooltip:AddDoubleLine( mifontGold..MI_TXT_CLASS, mifontWhite..mobData.class )
	end

	if mobData.healthCur and MobInfoConfig.ShowHealth == 1 then
		GameTooltip:AddDoubleLine( mifontGold..MI_TXT_HEALTH, mifontWhite..mobData.healthCur.." / "..mobData.healthMax )
		MI2_HealthLine = GameTooltip:NumLines()
	end

	if mobData.manaMax and mobData.manaMax > 0 and MobInfoConfig.ShowMana == 1 then
		GameTooltip:AddDoubleLine( mifontGold..MI_TXT_MANA, mifontWhite..mobData.manaCur.." / "..mobData.manaMax )
		MI2_ManaLine = GameTooltip:NumLines()
	end

	local mobGivesXp = not (mobData.color.r == 0.5  and  mobData.color.g == 0.5  and  mobData.color.b == 0.5)
	if mobGivesXp and mobData.xp then
		if MobInfoConfig.ShowXp == 1 then
			GameTooltip:AddDoubleLine( mifontGold..MI_TXT_XP, mifontWhite..mobData.xp )
		end 
		if MobInfoConfig.ShowNo2lev == 1 then
			GameTooltip:AddDoubleLine( mifontGold..MI_TXT_TO_LEVEL, mifontWhite..mobData.mob2Level )
		end 
	end

	if (mobData.minDamage or mobData.dps) and MobInfoConfig.ShowDamage == 1 then 
		GameTooltip:AddDoubleLine( mifontGold..MI_TXT_DAMAGE, mifontWhite..(mobData.minDamage or 0).."-"..(mobData.maxDamage or 0).."  ["..(mobData.dps or 0).."]" )
	end

	addEmptyLine = MobInfoConfig.ShowBlankLines

	if  MobInfoConfig.CombinedMode == 1  and  MobInfoConfig.ShowCombined == 1  then
		if addEmptyLine == 1 then GameTooltip:AddLine("\n") addEmptyLine = 0 end
		GameTooltip:AddLine( mifontGray.."["..MI_TXT_COMBINED..mobData.combinedStr.."]" )
	end

	if mobData.kills and MobInfoConfig.ShowKills == 1 then
		if addEmptyLine == 1 then GameTooltip:AddLine("\n") addEmptyLine = 0 end
		GameTooltip:AddDoubleLine( mifontGold..MI_TXT_KILLS, mifontWhite..mobData.kills )
	end          

	if  mobData.loots  and  MobInfoConfig.ShowLoots == 1  then
		if addEmptyLine == 1 then GameTooltip:AddLine("\n") addEmptyLine = 0 end
		GameTooltip:AddDoubleLine( mifontGold..MI_TXT_TIMES_LOOTED, mifontWhite..mobData.loots )
	end

	if  mobData.emptyLoots  and  MobInfoConfig.ShowEmpty == 1  then
		local emptyLootsStr = mifontWhite..mobData.emptyLoots
		if  mobData.loots  then
			emptyLootsStr = emptyLootsStr.." ("..ceil((mobData.emptyLoots/mobData.loots)*100).."%) "
		end
		if addEmptyLine == 1 then GameTooltip:AddLine("\n") addEmptyLine = 0 end
		GameTooltip:AddDoubleLine( mifontGold..MI_TXT_EMPTY_LOOTS, emptyLootsStr )
	end

	if mobData.clothCount and MobInfoConfig.ShowCloth == 1 then
		local clothStr = mifontWhite..mobData.clothCount
		if mobData.loots then
			clothStr = clothStr.." ("..ceil((mobData.clothCount/mobData.loots)*100).."%) "
		end
		if addEmptyLine == 1 then GameTooltip:AddLine("\n") addEmptyLine = 0 end
		GameTooltip:AddDoubleLine( mifontGold..MI_TXT_CLOTH_DROP, clothStr )
	end

	if mobData.copper and mobData.loots then
		copperAvg = ceil( mobData.copper / mobData.loots )
		if MobInfoConfig.ShowCoin == 1 then
			if addEmptyLine == 1 then GameTooltip:AddLine("\n") addEmptyLine = 0 end
			GameTooltip:AddDoubleLine(mifontGold..MI_TXT_COIN_DROP,mifontWhite..copper2text(copperAvg))
		end
	end

	if mobData.itemValue and mobData.loots then
		itemValueAvg = ceil( mobData.itemValue / mobData.loots )
		if MobInfoConfig.ShowIV == 1 then
			if addEmptyLine == 1 then GameTooltip:AddLine("\n") addEmptyLine = 0 end
			GameTooltip:AddDoubleLine(mifontGold..MI_TEXT_ITEM_VALUE,mifontWhite..copper2text(itemValueAvg))
		end
	end

	local totalValue = (copperAvg or 0) + (itemValueAvg or 0)
	if totalValue > 0 and MobInfoConfig.ShowTotal == 1 then
		if addEmptyLine == 1 then GameTooltip:AddLine("\n") addEmptyLine = 0 end
		GameTooltip:AddDoubleLine(mifontGold..MI_TXT_MOB_VALUE,mifontWhite..copper2text(totalValue))
	end

	if mobData.qualityStr ~= "" and MobInfoConfig.ShowQuality == 1 then
		if addEmptyLine == 1 then GameTooltip:AddLine("\n") addEmptyLine = 0 end
		GameTooltip:AddDoubleLine(mifontGold..MI_TXT_QUALITY, mobData.qualityStr)
	end

	if mobData.resists and MobInfoConfig.ShowResists == 1 then
		MI2_AddResistToTooltip( mobData.resists )
	end

	if mobData.location and MobInfoConfig.ShowLocation == 1 then
		if addEmptyLine == 1 then GameTooltip:AddLine("\n") addEmptyLine = 0 end
		MI2_AddLocationToTooltip( mobData.location, showFullLocation )
	end

	addEmptyLine = MobInfoConfig.ShowBlankLines

	if mobData.itemList and (MobInfoConfig.ShowItems == 1 or MobInfoConfig.ShowClothSkin == 1) then
		if addEmptyLine == 1 then GameTooltip:AddLine("\n") addEmptyLine = 0 end
		MI2_AddItemsToTooltip( mobData )
	end
end -- MI2_CreateNormalTooltip()


-----------------------------------------------------------------------------
-- MI2_CreateDebugTooltip()
--
-- For debugging purposes append the actual mob database contents to the
-- tooltip
-----------------------------------------------------------------------------
local function MI2_CreateDebugTooltip( mobIndex )
	GameTooltip:AddLine(MI_TXT_DEBUG_INFO)
	GameTooltip:AddDoubleLine(MI_TXT_DEBUG_DBG..mifontGold.."mobIndex=",mobIndex)
	if MobInfoDB[mobIndex] then
		if MobInfoDB[mobIndex].bi then GameTooltip:AddDoubleLine(MI_TXT_DEBUG_DBG..mifontGold..MI_TXT_DEBUG_BI,mifontWhite..MobInfoDB[mobIndex].bi) end
		if MobInfoDB[mobIndex].qi then GameTooltip:AddDoubleLine(MI_TXT_DEBUG_DBG..mifontGold..MI_TXT_DEBUG_QI,mifontWhite..MobInfoDB[mobIndex].qi) end
		if MobInfoDB[mobIndex].ml then GameTooltip:AddDoubleLine(MI_TXT_DEBUG_DBG..mifontGold..MI_TXT_DEBUG_ML,mifontWhite..MobInfoDB[mobIndex].ml) end
		if MobInfoDB[mobIndex].il then GameTooltip:AddDoubleLine(MI_TXT_DEBUG_DBG..mifontGold..MI_TXT_DEBUG_IL,mifontWhite..MobInfoDB[mobIndex].il) end
		if MobInfoDB[mobIndex].re then GameTooltip:AddDoubleLine(MI_TXT_DEBUG_DBG..mifontGold..MI_TXT_DEBUG_RE,mifontWhite..MobInfoDB[mobIndex].re) end
		if MI2_PlayerName and MobInfoDB[mobIndex][MI2_PlayerName] then GameTooltip:AddDoubleLine(MI_TXT_DEBUG_DBG..mifontGold..MI2_PlayerName..MI_TXT_DEBUG_CHAR_DATA,mifontWhite..MobInfoDB[mobIndex][MI2_PlayerName]) end
	end
	if MobHealthDB[mobIndex] then GameTooltip:AddDoubleLine(MI_TXT_DEBUG_DBG..mifontGold..MI_TXT_DEBUG_HP.."=",mifontWhite..MobHealthDB[mobIndex]) end
end


-----------------------------------------------------------------------------
-- MI2_CreateCompactTooltip()
--
-- add all collected mob data to the game tooltip, data is only added if
-- corresponding "Show" flag is set
-----------------------------------------------------------------------------
local function MI2_CreateCompactTooltip( mobData, mobIndex, showFullLocation )
	local firstLine = GameTooltip:NumLines() + 1

	if mobData.lowHpAction == 1 then
		GameTooltip:AddLine( mifontLightRed..">>>  "..MI2_CHATMSG_MONSTEREMOTE.."  <<<" )
	end

	if mobData.class and MobInfoConfig.ShowClass == 1 then
		GameTooltip:AddDoubleLine( mifontGold..MI_TXT_CLASS, mifontWhite..mobData.class )
	end

	if (mobData.healthCur or mobData.manaMax and mobData.manaMax > 0)  
			and (MobInfoConfig.ShowHealth == 1 or MobInfoConfig.ShowMana == 1) then
		GameTooltip:AddDoubleLine( mifontGold..MI_TXT_HP..mifontWhite..(mobData.healthCur or 0).." / "..(mobData.healthMax or 0), mifontWhite..(mobData.manaCur or 0).." / "..(mobData.manaMax or 0)..mifontGold..MI_TXT_MANA )
		MI2_HealthLine = GameTooltip:NumLines()
		if mobData.manaMax and mobData.manaMax > 0 then
			MI2_ManaLine = MI2_HealthLine
		end
	end

	local mobGivesXp = not (mobData.color.r == 0.5  and  mobData.color.g == 0.5  and  mobData.color.b == 0.5)
	if mobGivesXp and mobData.xp and (MobInfoConfig.ShowXp == 1 or MobInfoConfig.ShowNo2lev == 1) then
		GameTooltip:AddDoubleLine( mifontGold..MI_TXT_XP..mifontWhite..mobData.xp, mifontWhite..mobData.mob2Level..mifontGold..MI_TXT_KTL )
	end

	if (mobData.minDamage or mobData.dps) and MobInfoConfig.ShowDamage == 1 then
		GameTooltip:AddDoubleLine( mifontGold..MI_TXT_DMG..mifontWhite..(mobData.minDamage or 0).."-"..(mobData.maxDamage or 0), mifontWhite..(mobData.dps or 0)..mifontGold..MI_TXT_DPS )
	end

	if  MobInfoConfig.CombinedMode == 1  and  MobInfoConfig.ShowCombined == 1  then
		GameTooltip:AddLine( mifontGray.."["..MI_TXT_COMBINED..mobData.combinedStr.."]" )
	end

	if (mobData.kills or mobData.loots) and (MobInfoConfig.ShowKills == 1 or MobInfoConfig.ShowLoots == 1)  then
		GameTooltip:AddDoubleLine( mifontGold..MI_TXT_KILLS..mifontWhite..(mobData.kills or 0), mifontWhite..(mobData.loots or 0)..mifontGold..MI_TXT_LOOTS )
	end          

	if  (mobData.emptyLoots or mobData.clothCount) and (MobInfoConfig.ShowCloth == 1 or MobInfoConfig.ShowEmpty == 1)  then
		local emptyLootsStr = mifontWhite..(mobData.emptyLoots or 0)
		if  mobData.loots  then
			emptyLootsStr = emptyLootsStr.." ("..ceil(((mobData.emptyLoots or 0)/mobData.loots)*100).."%) "
		end
		local clothStr = mifontWhite..(mobData.clothCount or 0)
		if mobData.loots then
			clothStr = clothStr.." ("..ceil(((mobData.clothCount or 0)/mobData.loots)*100).."%) "
		end
		GameTooltip:AddDoubleLine( mifontGold..MI_TXT_CL..mifontWhite..clothStr, mifontWhite..emptyLootsStr..mifontGold..MI_TXT_EL )
	end

	if (mobData.copper or mobData.itemValue) and mobData.loots and MobInfoConfig.ShowTotal == 1 then
		local copperAvg = ceil( (mobData.copper or 0) / mobData.loots )
		local itemValueAvg = ceil( (mobData.itemValue or 0) / mobData.loots )
		local totalValue = copperAvg + itemValueAvg
		if totalValue > 0 then
			GameTooltip:AddDoubleLine( mifontGold..MI_TXT_VAL..mifontWhite..copper2text(totalValue), mifontWhite..copper2text(copperAvg)..mifontGold..MI_TXT_COINS )
		end
	end

	if  mobData.qualityStr ~= ""  and  MobInfoConfig.ShowQuality == 1  then
		GameTooltip:AddLine( mifontGold..MI_TXT_Q..mifontWhite..mobData.qualityStr )
	end

	if mobData.resists and MobInfoConfig.ShowResists == 1 then
		MI2_AddResistToTooltip( mobData.resists )
	end

	if mobData.location and MobInfoConfig.ShowLocation == 1 then
		MI2_AddLocationToTooltip( mobData.location, showFullLocation )
	end
	
	if mobData.itemList and (MobInfoConfig.ShowItems == 1 or MobInfoConfig.ShowClothSkin == 1) then
		MI2_AddItemsToTooltip( mobData )
	end
end -- MI2_CreateCompactTooltip()


-----------------------------------------------------------------------------
-- MI2_BuildQualityString()
--
-- Build a string drepresenting the loot quality overview for the given mob.
-----------------------------------------------------------------------------
local function MI2_BuildQualityString( mobData )
	local quality, chance
	local rt = mobData.loots or 1
 
	mobData.qualityStr = ""
	for idx = 1, 5 do
		quality = mobData["r"..idx]
		if quality then
			chance = ceil( quality / rt * 100.0 )
			if chance > 100 then chance = 100 end
			mobData.qualityStr = mobData.qualityStr..MI2_QualityColor[idx]..quality.."("..chance.."%) "
		end
	end
end  -- MI2_CreateQualityString


-----------------------------------------------------------------------------
-- MI2_BuildMobInfoTooltip()
--
-- create game tooltip contents
-- this includes handling the combined mode where data for several mobs
-- with same name but different levels has to be added up
-----------------------------------------------------------------------------
function MI2_BuildMobInfoTooltip( mobName, mobLevel, showFullLocation )
	-- do not add anything to the tooltip for players
	if  UnitIsPlayer("mouseover")  then  return  end

	-- record mob location at mouseover
	local mobIndex = mobName..":"..mobLevel
	if not showFullLocation then
		MI2_RecordLocationAndType( mobIndex )
	end

	MI2_MouseoverIndex = mobIndex

	-- get mob data for hovered mob
	local mobData = MI2_FetchMobData( MI2_MouseoverIndex )
	mobData.combinedStr = ""

	-- handle combined Mob mode : try to find the other Mobs with same
	-- name but differing level, add their data to the tooltip data
	if  MobInfoConfig.CombinedMode == 1 and mobLevel > 0 then
		local combined = { combinedStr = "" }
		MI2_AddTwoMobs( combined, mobData )
		for levelToCombine = mobLevel-4, mobLevel+4, 1 do
			if levelToCombine ~= mobLevel  then
				local mobIndex = mobName..":"..levelToCombine
				if MobInfoDB[mobIndex] then
					local dataToCombine = MI2_FetchMobData( mobIndex )
					MI2_AddTwoMobs( combined, dataToCombine )
					combined.combinedStr = combined.combinedStr..MI_TXT_LEVEL..levelToCombine
					combined.color = GetDifficultyColor( levelToCombine )
				end
			else
				combined.combinedStr = combined.combinedStr..MI_TXT_LEVEL..levelToCombine
			end
		end
		mobData = combined
	end

	-- add unit and xp data for hovered mob
	MI2_GetUnitBasedMobData( MI2_MouseoverIndex, mobData, "mouseover", mobLevel )
	if not mobData.color then mobData.color = {r=1.0;b=1.0;c=1.0} end
	if mobData.xp then
		-- calculate number of mobs to next level based on mob experience
		local xpCurrent = UnitXP("player") + mobData.xp
		local xpToLevel = UnitXPMax("player") - xpCurrent
		mobData.mob2Level = ceil(abs(xpToLevel / mobData.xp))+1
	end

	-- display the Mob data within the game tooltip
	MI2_BuildQualityString( mobData )
	if IsAltKeyDown() and IsControlKeyDown() then
		MI2_CreateDebugTooltip( MI2_MouseoverIndex )
	elseif MobInfoConfig.CompactMode == 1 then
		MI2_CreateCompactTooltip( mobData, MI2_MouseoverIndex, showFullLocation )
	else
		MI2_CreateNormalTooltip( mobData, MI2_MouseoverIndex, showFullLocation )
	end
end -- MI2_BuildMobInfoTooltip()


-----------------------------------------------------------------------------
-- MI2_DebugShowContainerItemInfo()
--
-- Show debugging info for the current hovered container item.
-- The info is added to the game tooltip.
-- This function is called only if "MI2_DebugItems > 0"
-----------------------------------------------------------------------------
local function MI2_DebugShowContainerItemInfo()
	local frame = GetMouseFocus()
	if frame then
		local frameName = (frame:GetName() or "")
		local _,_,parenFrameName, num = string.find( frameName, "(.+)Item(%d+)" )
		if parenFrameName and num then
			local parentFrame = getglobal( parenFrameName )
			if parentFrame then
				local link = GetContainerItemLink( parentFrame:GetID(), frame:GetID() )
				local _, _, itemID = string.find((link or ""), "|Hitem:(%d+):(%d+):(%d+):")
				if IsControlKeyDown() then GameTooltip:AddLine( mifontSubWhite.."[frame="..frameName..",item="..link.."]" ) end
				if itemID then
					local itemValue = MI2_BasePrices[tonumber(itemID)]
					if itemValue then
						GameTooltip:AddLine( mifontSubWhite.."[itemID="..itemID..",price="..itemValue.."]" )
					else
						GameTooltip:AddLine( mifontRed.."** NO PRICE ** "..mifontMageta.."item="..link..mifontMageta..",itemID="..itemID )
					end
					GameTooltip:Show()
				end
			end
		end
	end
end -- MI2_DebugShowContainerItemInfo()


-----------------------------------------------------------------------------
-- MI2_BuildItemDataTooltip()
--
-- Build the additional game tooltip content for a given item name.
-- If the item is a known loot item this function will add the names of
-- all Mobs that drop the item to the game tooltip. Each Mob name will
-- appear on its own line.
-----------------------------------------------------------------------------
function MI2_BuildItemDataTooltip( itemName )
	if MI2_DebugItems > 0 then MI2_DebugShowContainerItemInfo() end

	-- get the table of all Mobs that drop the item, exit if none
	local itemFound = MI2_XRefItemTable[itemName]
	if not itemFound then return false end

	-- Create a list of mobs dropping this item that is indexed by only
	-- the base Mob name. For each Mob calculate the chance to drop.
	-- Create a second list referencing the same data that is indexed
	-- numerically so that it can then be sorted by chance to get.
	local numMobs = 0
	local resultList = {}
	local sortList = {}
	local mobIndex, itemAmount
	for mobIndex, itemAmount in pairs(itemFound) do
		local mobData = {}
		MI2_DecodeBasicMobData( nil, mobData, mobIndex )

		local mobName, mobLevel = MI2_GetIndexComponents( mobIndex )
		local itemData = resultList[mobName]
		if not itemData then
			numMobs = numMobs + 1
			itemData = { name = mobName, loots = 0, count = 0 }
			resultList[mobName] = itemData
			sortList[numMobs] = itemData
		end

		itemData.loots = itemData.loots + (mobData.loots or 0)
		itemData.count = itemData.count + itemAmount
		if itemData.loots > 0 then
			itemData.chance = floor(100.0 * itemData.count / itemData.loots + 0.5)
			if itemData.chance > 100 then itemData.chance = 100 end
			if itemData.loots < 6 then
				itemData.rating = itemData.chance + itemData.loots * 1000
			else
				itemData.rating = itemData.chance + 6000
			end
		else
			itemData.chance = itemData.count
			itemData.rating = itemData.chance
		end
	end

	-- sort list of Mobs by chance to get
	table.sort( sortList, function(a,b) return (a.rating > b.rating) end  )

	-- add Mobs to tooltip
	GameTooltip:AddLine( mifontLightBlue..MI_TXT_DROPPED_BY..numMobs..MI_TXT_MOBS_1 )
	if numMobs > 8 then numMobs = 8 end
	for idx = 1, numMobs do
		local data = sortList[idx]
		if data.loots > 0 then
			GameTooltip:AddDoubleLine( mifontLightBlue.."  "..data.name, mifontWhite..data.chance.."% ("..data.count.."/"..data.loots..")" )
		else
			GameTooltip:AddDoubleLine( mifontLightBlue.."  "..data.name, mifontWhite..data.chance )
		end
	end

	return true
end -- MI2_BuildItemDataTooltip()


-----------------------------------------------------------------------------
-- MI2_ScanSpellbook()
--
-- Scan the spellbook to enter all spells and their spell school into
-- the "MI2_SpellToSchool" conversion table that is needed for resistances
-- and immunities recording.
-----------------------------------------------------------------------------
function MI2_ScanSpellbook()
	local spellBookPage = 2
	
	while spellBookPage > 0 do
		local pageName, texture, offset, numSpells = GetSpellTabInfo( spellBookPage )
		if pageName and offset and numSpells then
			for spellIndex = (offset+1), (offset + numSpells) do
				local spellName = GetSpellName( spellIndex, BOOKTYPE_SPELL )
				if spellName and (not string.find(spellName,":")) then
					for school in pairs(MI2_SpellSchools) do
						local schoolOK = string.find( pageName, school )
						if schoolOK and string.len(school) > 2 then
							MI2_SpellToSchool[spellName] = school
						end
					end
				end
			end
			spellBookPage = spellBookPage + 1
		else
			spellBookPage = 0
		end
	end
end -- MI2_ScanSpellbook


-----------------------------------------------------------------------------
-- MI2_RecordHit()
--
-- Calculate an updated DPS (damage per second) based on the current target
-- data in "MI2_Target" and the new damage value given as parameter.
-----------------------------------------------------------------------------
function MI2_RecordHit( damage, spell, school, isPeriodic )
	if not MI2_Target.FightStartTime then
		MI2_Target.FightStartTime = GetTime() - 1.0
		MI2_Target.FightEndTime = GetTime()
		MI2_Target.FightDamage = damage
	elseif MI2_Target.FightEndTime then
		MI2_Target.FightEndTime = GetTime()
		MI2_Target.FightDamage = MI2_Target.FightDamage + damage
	end

	if spell and school and MI2_SpellSchools[school] then
		MI2_SpellToSchool[spell] = school
	elseif spell then
		school = MI2_SpellToSchool[spell]
	end

	-- record spell hit data (needed for spell resist calculations)
	local acronym = MI2_SpellSchools[school]
	if school and acronym and not isPeriodic then
		local mobData = MI2_FetchMobData( MI2_Target.mobIndex )
		mobData.resists[acronym.."Hits"] = (mobData.resists[acronym.."Hits"] or 0)+ 1
	end
end  -- MI2_RecordHit()


-----------------------------------------------------------------------------
-- MI2_RecordImmunResist()
--
-- Record that the given mob has either resisted a spell or is immune to
-- a spell.
-----------------------------------------------------------------------------
function MI2_RecordImmunResist( mobName, spell, isResist )
	if mobName == MI2_Target.name and MI2_Target.ResOk then
		local mobIndex = MI2_Target.mobIndex
		local mobData = MI2_FetchMobData( mobIndex )
		local school = MI2_SpellToSchool[spell]
		if school then
			local acronym = MI2_SpellSchools[school]
			if isResist then
				mobData.resists[acronym] = (mobData.resists[acronym] or 0) + 1
			else
				mobData.resists[acronym] = -1
			end
		end
	end
end -- MI2_RecordImmunResist()


-----------------------------------------------------------------------------
-- MI2_UpdateMobInfoState()
--
-- Enable or disable all Mob ToolTip options depending on state of
-- "DisableMobInfo". Update event handlers accordingly.
-----------------------------------------------------------------------------
function MI2_UpdateMobInfoState()
	local children = { MI2_FrmTooltipOptions:GetChildren() }

	-- update MobInfo options dialog
	for index, frame in pairs(children) do
		if frame ~= MI2_OptDisableMobInfo and frame ~= MI2_OptItemFilter then
			if MobInfoConfig.DisableMobInfo == 0 then
				frame:Enable()
				getglobal(frame:GetName().."Text"):SetTextColor( 1.0, 0.8, 0.0 )
			else
				frame:Disable()
				getglobal(frame:GetName().."Text"):SetTextColor( 0.5, 0.5, 0.5 )
			end
		end
	end
end  -- MI2_UpdateMobInfoState()

-----------------------------------------------------------------------------
-- MI2_UpdateTooltipHealthMana()
--
-- Update the health and mana values in the Mob tooltip, if they exist.
-----------------------------------------------------------------------------
function MI2_UpdateTooltipHealthMana( healthCur, healthMax )
	local tooltip = "GameTooltip"
	if TipBuddyTooltip then tooltip = "TipBuddyTooltip" end
	if MI2_HealthLine and healthCur then
		local healthText = healthCur.." / "..healthMax
		if MobInfoConfig.CompactMode == 1 then
			local healthLine = getglobal(tooltip.."TextLeft"..MI2_HealthLine)
			healthLine:SetText( mifontGold..MI_TXT_HP..mifontWhite..healthText )
		else
			local healthLine = getglobal(tooltip.."TextRight"..MI2_HealthLine)
			healthLine:SetText( mifontWhite..healthText )
		end
	end

	if MI2_ManaLine then
		local manaText = mifontWhite..UnitMana("mouseover").." / "..UnitManaMax("mouseover")
		local manaLine = getglobal(tooltip.."TextRight"..MI2_ManaLine)
		if MobInfoConfig.CompactMode == 1 then
			manaLine:SetText( manaText..mifontGold..MI_TXT_MANA )
		else
			manaLine:SetText( manaText )
		end
	end
end -- MI2_UpdateTooltipHealthMana()

