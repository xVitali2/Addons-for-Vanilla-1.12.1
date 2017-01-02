--[[--------------------------------------------------
----- VanillaGuide -----
------------------
GuideTable.lua
Authors: mrmr
Version: 1.04.3
------------------------------------------------------
Description: 
    	Object Handling the Guides
    1.00
		-- Initial Ace2 release
	1.99a
		-- Ally addition starter version
    1.03
		-- No Changes. Just adjusting "version".
    		1.99x for a beta release was a weird choise.
	1.04.1
		-- This will be the place where we "prepare" the guides, 
			upon player login.
			We'll include all the needed guides here and we'll provide
			function to retrive informations too
	1.04.2
		-- no changes in here for this revision
	1.04.3
		-- Fixed typo for Loch Modan and Redridge Mountains
------------------------------------------------------
Connection:
--]]--------------------------------------------------

--local VGuide = VGuide
Dv(" VGuide GuideTable.lua Start")

objGuideTable = {}
objGuideTable.__index = objGuideTable

function objGuideTable:new(oSettings)
	local obj = {}
    setmetatable(obj, self)

	local function TablesMerge(t1, t2)
	    for k, v in pairs(t2) do
	        if (type(v) == "table") and (type(t1[k] or false) == "table") then
	            TablesMerge(t1[k], t2[k])
	        else
	            t1[k] = v
	        end
	    end
	    return t1
	end

	local function ColorizeTable(t1)
		for k1, _ in pairs(t1) do
			if type(t1[k1].items) == "table" then
				for k2, v2 in pairs(t1[k1].items) do
					if v2 then
						local opentext = {
							[1] = {
								["find"] = "#ACCEPT",
								["replace"] = "|c0000ffff"
							},
							[2] = {
								["find"] = "#DOQUEST",
								["replace"] = "|c000079d2"
							},
							[3] = {
								["find"] = "#TURNIN",
								["replace"] = "|c0000ff00"
							},
							[4] = {
								["find"] = "#NPC",
								["replace"] = "|c00ff00ff"
							},
							[5] = {
								["find"] = "#COORDS",
								["replace"] = "|c00ffff00"
							},
							[6] = {
								["find"] = "#VIDEO",
								["replace"] = "|c00ff0000"
							},
							[7] = {
								["find"] = "#PICTURE",
								["replace"] = "|c00fca742"
							},
							[8] = {
								["find"] = "#HUNTER", 
								["replace"] = "|c00a80000"
							},
						}
						for n = 1, getn(opentext) do
							t1[k1].items[k2].str = gsub(t1[k1].items[k2].str, opentext[n]["find"],opentext[n]["replace"])
						end
						t1[k1].items[k2].str = gsub(t1[k1].items[k2].str, "#","|r")
					end
				end
			end
		end
		return t1
	end

	obj.TableDDM = {
		lvl1 = {
			{ "v", "Introduction", id = 1},
			{ "s", "Starting Zones" },
			{ "s", "Later Leveling" },
			{ "s", "Profession Guides" },
		},
		lvl2 = {
			["Later Leveling"] = {
				{ "s", "12-20" },
				{ "s", "20-30" },
				{ "s", "30-40" },
				{ "s", "40-50" },
				{ "s", "50-60" },
			},
			["Profession Guides"] = {
				{ "v", "Alchemy", id = nil },
				{ "v", "Blacksmithing", id = nil },
				{ "v", "[H] Cooking", id = nil },
				{ "v", "[A] Cooking", id = nil },
				{ "v", "Enchanting", id = nil },
				{ "v", "Engineering", id = nil },
				{ "v", "Leatherworking", id = nil },
				{ "v", "Tailoring", id = nil }
			},
			["[H] Starting Zones"] = {
				{ "s", "Orcs & Trolls" },
				{ "s", "Taurens" },
				{ "s", "Undeads" },
			},
			["[A] Starting Zones"] = {
				{ "s", "Humans" },
				{ "s", "Dwarves & Gnomes" },
				{ "s", "Night Elves" },
			},
		},
		lvl3 = {
			["Orcs & Trolls"] = {
				{ "v", "1-6 Durotar", id = nil },
				{ "v", "6-9 Durotar", id = nil },
				{ "v", "9-12 Durotar", id = nil },
			},
			["Taurens"] = {
				{ "v", "1-6 Mulgore", id = nil },
				{ "v", "6-10 Mulgore", id = nil },
				{ "v", "10-12 Mulgore", id = nil },
			},
			["Undeads"] = {
				{ "v", "1-6 DeathKnell", id = nil },
				{ "v", "6-10 Tirisfal Glades", id = nil },
				{ "v", "10-12 Tirisfal Glades", id = nil },          
			},
			["[H] 12-20"] = {
				{ "v", "12-15 Barrens", id = nil },
				{ "v", "15-16 Stonetalon Mountains", id = nil },
				{ "v", "16-20 Barrens (part 1)", id = nil },
				{ "v", "16-20 Barrens (part 2)", id = nil },
			},
			["[H] 20-30"] = {
				{ "v", "20-21 Stonetalon Mountains", id = nil },
				{ "v", "21-21 Ashenvale", id = nil },
				{ "v", "22-23 Southern Barrens", id = nil },
				{ "v", "23-25 Stonetalon Mountains", id = nil },
				{ "v", "25-25 Southern Barrens", id = nil },
				{ "v", "25-26 Thousand Needles", id = nil },
				{ "v", "26-27 Ashenvale", id = nil },
				{ "v", "27-27 Stonetalon Mountains", id = nil },
				{ "v", "27-29 Thousand Needles", id = nil },
				{ "v", "29-30 Hillsbrad Foothills", id = nil },
			},
			["[H] 30-40"] = {
				{ "v", "30-30 Alterac Mountains", id = nil },
				{ "v", "30-30 Arathi Highlands", id = nil },
				{ "v", "30-31 Stranglethorn Vale", id = nil },
				{ "v", "31-32 TN (Shimmering Flats)", id = nil },
				{ "v", "32-34 Desolace", id = nil },
				{ "v", "34-35 Stranglethorn Vale", id = nil },
				{ "v", "35-37 Arathi Highlands", id = nil },
				{ "v", "37-37 Alterac Mountains", id = nil },
				{ "v", "37-37 Thousand Needles", id = nil },
				{ "v", "37-38 Dustwallow Marsh", id = nil },
				{ "v", "38-40 Stranglethorn Vale", id = nil },
			},
			["[H] 40-50"] = {
				{ "v", "40-41 Badlands", id = nil },
				{ "v", "41-42 Swamp of Sorrows", id = nil },
				{ "v", "42-43 Stranglethorn Vale", id = nil },
				{ "v", "43-43 Desolace", id = nil },
				{ "v", "43-43 Dustwallow Marsh", id = nil },
				{ "v", "43-44 Tanaris", id = nil },
				{ "v", "44-46 Feralas", id = nil },
				{ "v", "46-46 Azshara", id = nil },
				{ "v", "46-47 Hinterlands", id = nil },
				{ "v", "47-47 Stranglethorn Vale", id = nil },
				{ "v", "47-48 Searing Gorge", id = nil },
				{ "v", "48-48 Swamp of Sorrows", id = nil },
				{ "v", "48-49 Ferelas", id = nil },
				{ "v", "49-50 Tanaris", id = nil },
			},
			["[H] 50-60"] = {
				{ "v", "50-50 Azshara", id = nil },
				{ "v", "50-50 Hinterlands", id = nil },
				{ "v", "50-51 Blasted Lands", id = nil },
				{ "v", "51-52 Un'Goro Crater", id = nil },
				{ "v", "52-53 Burning Steppes", id = nil },
				{ "v", "53-54 Azshara", id = nil },
				{ "v", "54-54 Felwood", id = nil },
				{ "v", "54-55 Winterspring", id = nil },
				{ "v", "55-55 Felwood", id = nil },
				{ "v", "55-55 Silithus", id = nil },
				{ "v", "55-56 Western Plaguelands", id = nil },
				{ "v", "56-57 Eastern Plaguelands", id = nil },
				{ "v", "57-58 Western Plaguelands", id = nil },
				{ "v", "58-60 Winterspring", id = nil },
			},

			["Humans"] = {
				{ "v", "1-10 Elwynn Forest", id = nil },
				{ "v", "10-12 Westfall and Loch Modan", id = nil },
			},
			["Dwarves & Gnomes"] = {
				{ "v", "1-6 Cold Ridge Valley", id = nil },
				{ "v", "6-12 Dun Morogh", id = nil },
			},
			["Night Elves"] = {
				{ "v", "1-6 Teldrassil", id = nil },
				{ "v", "6-12 Teldrassil", id = nil },
			},
			["[A] 12-20"] = {
				{ "v", "12-14 Darkshore", id = nil },
				{ "v", "14-17 Darkshore", id = nil },
				{ "v", "17-18 Loch Modan", id = nil },
				{ "v", "18-20 Redridge Mountains", id = nil },
			},
			["[A] 20-30"] = {
				{ "v", "20-21 Darkshore", id = nil },
				{ "v", "21-22 Ashenvale", id = nil },
				{ "v", "22-23 Stonetalon Mountains", id = nil },
				{ "v", "23-24 Darkshore", id = nil },
				{ "v", "24-25 Ashenvale", id = nil },
				{ "v", "25-27 Wetlands", id = nil },
				{ "v", "27-28 Lakeshire", id = nil },
				{ "v", "28-29 Duskwood", id = nil },
				{ "v", "29-30 Ashenvale", id = nil },
				{ "v", "30-30 Wetlands", id = nil },
			},
			["[A] 30-40"] = {
				{ "v", "30-31 Hillsbrad Foothills", id = nil },
				{ "v", "31-31 Alterac Mountains", id = nil },
				{ "v", "31-32 Arathi Highlands", id = nil },
				{ "v", "32-32 Stranglethorn Vale", id = nil },
				{ "v", "32-33 Thousand Needles (Shimmering Flats)", id = nil },
				{ "v", "33-33 Stonetalon Mountains", id = nil },
				{ "v", "33-35 Desolace", id = nil },
				{ "v", "35-36 Stranglethorn Vale", id = nil },
				{ "v", "36-37 Alterac Mountains", id = nil },
				{ "v", "37-38 Arathi Highlands", id = nil },
				{ "v", "38-38 Dustwallow Marsh", id = nil },
				{ "v", "38-40 Stranglethorn Vale", id = nil },
			},
			["[A] 40-50"] = {
				{ "v", "40-41 Badlands", id = nil },
				{ "v", "41-41 Swamp of Sorrows", id = nil },
				{ "v", "41-42 Desolace", id = nil },
				{ "v", "42-43 Stranglethron Vale", id = nil },
				{ "v", "43-43 Tanaris", id = nil },
				{ "v", "43-45 Feralas", id = nil },
				{ "v", "45-46 Uldaman", id = nil },
				{ "v", "46-47 The Hinterlands", id = nil },
				{ "v", "47-47 Feralas", id = nil },
				{ "v", "47-48 Tanaris", id = nil },
				{ "v", "48-48 The Hinterlands", id = nil },
				{ "v", "48-49 Stranglethorn Vale", id = nil },
				{ "v", "49-50 Blasted Lands", id = nil },
			},
			["[A] 50-60"] = {
				{ "v", "50-51 Searing Gorge", id = nil },
				{ "v", "51-52 Un’Goro Crater", id = nil },
				{ "v", "52-53 Azshara", id = nil },
				{ "v", "53-54 Felwood", id = nil },
				{ "v", "54-54 Tanaris", id = nil },
				{ "v", "54-54 Felwood", id = nil },
				{ "v", "54-55 Winterspring", id = nil },
				{ "v", "55-56 Burning Steppes", id = nil },
				{ "v", "56-56 Tanaris", id = nil },
				{ "v", "56-56 Silithus", id = nil },
				{ "v", "56-57 Western Plaguelands", id = nil },
				{ "v", "57-58 Eastern Plaguelands", id = nil },
				{ "v", "58-58 Western Plaguelands", id = nil },
				{ "v", "58-58 Eastern Plaguelands", id = nil },
				{ "v", "58-59 Western Plaguelands", id = nil },
				{ "v", "59-60 Winterspring", id = nil },
			},
		},
	}

	local tCharInfo = oSettings:GetSettingsCharInfo()

	obj.Guide = {}
	obj.NoGuide = {}
	obj.GuideCount = 0
	obj.NoGuideCount = 0
	obj.Faction = tCharInfo.Faction
	obj.Race = tCharInfo.Race
	tCharInfo = nil

	-- Guides Praparation methods
	obj.PrepareGuidesTableHorde = function(self, tRace)
		obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_001_Introduction))
		if tRace == "Tauren" then 
			obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_002_Mulgore))
		elseif tRace == "Undead" then 
			obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_002_TirisfalGlades))
		else 
			obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_002_Durotar))
		end
		obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_003_Horde_12to20))
		obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_003_Horde_20to30))
		obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_003_Horde_30to40))
		obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_003_Horde_40to50))
		obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_003_Horde_50to60))
		obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_004_Professions))
	end

	obj.PrepareNoGuidesTableHorde = function(self, tRace)
		-- we normilize here, cause "indexes" will clash otherwise 
		if tRace == "Tauren" then 
			obj.NoGuide = TablesMerge(obj.NoGuide, ColorizeTable(Table_002_TirisfalGlades))
			obj:NormalizeGuide(obj.NoGuide, nil)
			obj.NoGuide = TablesMerge(obj.NoGuide, ColorizeTable(Table_002_Durotar))
		elseif tRace == "Undead" then 
			obj.NoGuide = TablesMerge(obj.NoGuide, ColorizeTable(Table_002_Durotar))
			obj:NormalizeGuide(obj.NoGuide, nil)
			obj.NoGuide = TablesMerge(obj.NoGuide, ColorizeTable(Table_002_Mulgore))			
		else
			
			obj.NoGuide = TablesMerge(obj.NoGuide, ColorizeTable(Table_002_Mulgore))
			obj:NormalizeGuide(obj.NoGuide, nil)
			obj.NoGuide = TablesMerge(obj.NoGuide, ColorizeTable(Table_002_TirisfalGlades))
		end
	end

	obj.PrepareGuidesTableAlliance = function(self, tRace)
		obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_001_Introduction))
		if tRace == "Human" then
			obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_002_ElwynnForest))
		elseif tRace == "Night Elf" then
			obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_002_Teldrassil))
		else
			obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_002_DunMorogh))
		end
		obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_003_Alliance_12to20))
		obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_003_Alliance_20to30))
		obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_003_Alliance_30to40))
		obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_003_Alliance_40to50))
		obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_003_Alliance_50to60))
		obj.Guide = TablesMerge(obj.Guide, ColorizeTable(Table_004_Professions))
	end

	obj.PrepareNoGuidesTableAlliance = function(self, tRace)
		-- we normilize here, cause "indexes" will clash otherwise 
		if tRace == "Human" then
			obj.NoGuide = TablesMerge(obj.NoGuide, ColorizeTable(Table_002_DunMorogh))
			obj:NormalizeGuide(obj.NoGuide, nil)
			obj.NoGuide = TablesMerge(obj.NoGuide, ColorizeTable(Table_002_Teldrassil))
		elseif tRace == "Night Elf" then
			obj.NoGuide = TablesMerge(obj.NoGuide, ColorizeTable(Table_002_ElwynnForest))
			obj:NormalizeGuide(obj.NoGuide, nil)
			obj.NoGuide = TablesMerge(obj.NoGuide, ColorizeTable(Table_002_DunMorogh))
		else
			obj.NoGuide = TablesMerge(obj.NoGuide, ColorizeTable(Table_002_Teldrassil))
			obj:NormalizeGuide(obj.NoGuide, nil)
			obj.NoGuide = TablesMerge(obj.NoGuide, ColorizeTable(Table_002_ElwynnForest))
		end
	end

	obj.NormalizeGuide = function(self, t, offset)
		if not offset then offset = 0 end

		-- the index_table will store all the guideIDs, as they are readen from file.
		-- then, once done, those IDs are sorted (from lower to higer)
		local index_table = {}
		for i,_ in pairs(t) do
			table.insert(index_table, i)
		end
		table.sort(index_table)

		-- this for-cicle will sort the tables, so we'll have them listed from lower to higer
		-- Every ID will be converted from its original value to a new incremental index
		-- starting from 1 (Introduction)
		local c = 0 + offset
		for _,v in ipairs(index_table) do
			c = c + 1
			t[c] = t[v]
			if v ~= c then
				t[v] = nil
			end
		end

		return t, c - offset
	end

	-- DropDownMenu Preparation methods
	local function xSearchID(tDDMsection)
		for _,v1 in ipairs(tDDMsection) do
			for k,v2 in ipairs(obj.Guide) do
				-- we use the "plain" method here, as in those "title" string
				-- we could find special characters like "-" and "["
				if string.find(v2.title, v1[2], 1, true) then 
					v1.id = k
				end
			end
		end
	end
	
	obj.DefineDDMProfessionsSubMenu = function(self)
		xSearchID(obj.TableDDM.lvl2["Profession Guides"])
	end

	obj.DefineDDMStartingZonesSubMenu = function(self, tFaction)
		if tFaction == "Horde" then
			xSearchID(obj.TableDDM.lvl3["Orcs & Trolls"])
			xSearchID(obj.TableDDM.lvl3["Taurens"])
			xSearchID(obj.TableDDM.lvl3["Undeads"])
		else
			xSearchID(obj.TableDDM.lvl3["Humans"])
			xSearchID(obj.TableDDM.lvl3["Night Elves"])
			xSearchID(obj.TableDDM.lvl3["Dwarves & Gnomes"])
		end
	end

	obj.DefineDDMLaterLevelingSubMenu = function(self, tFaction)
		if tFaction == "Horde" then
			xSearchID(obj.TableDDM.lvl3["[H] 12-20"])
			xSearchID(obj.TableDDM.lvl3["[H] 20-30"])
			xSearchID(obj.TableDDM.lvl3["[H] 30-40"])
			xSearchID(obj.TableDDM.lvl3["[H] 40-50"])
			xSearchID(obj.TableDDM.lvl3["[H] 50-60"])
		else
			xSearchID(obj.TableDDM.lvl3["[A] 12-20"])
			xSearchID(obj.TableDDM.lvl3["[A] 20-30"])
			xSearchID(obj.TableDDM.lvl3["[A] 30-40"])
			xSearchID(obj.TableDDM.lvl3["[A] 40-50"])
			xSearchID(obj.TableDDM.lvl3["[A] 50-60"])
		end
	end

	-- Clear Tables read from .toc
	obj.ClearInitialTablesContent = function(self)
		Table_001_Introduction = nil
		Table_002_Durotar = nil
		Table_002_Mulgore = nil
		Table_002_TirisfalGlades = nil
		Table_002_DunMorogh = nil
		Table_002_Teldrassil = nil
		Table_002_ElwynnForest = nil
		Table_003_Horde_12to20 = nil
		Table_003_Horde_20to30 = nil
		Table_003_Horde_30to40 = nil
		Table_003_Horde_40to50 = nil
		Table_003_Horde_50to60 = nil
		Table_003_Alliance_12to20 = nil
		Table_003_Alliance_20to30 = nil
		Table_003_Alliance_30to40 = nil
		Table_003_Alliance_40to50 = nil
		Table_003_Alliance_50to60 = nil
		Table_004_Professions = nil
	end

	-- Query object methods
	obj.GetGuide = function(self, nGuideID)
		if nGuideID > obj.GuideCount then 
			Dv(" -- Guide not present! ID exceed the GuideCount value!")
		elseif nGuideID < 1 then
			Dv(" -- negative or zero ID! Are you joking?")
		else
			return obj.Guide[nGuideID]
		end
	end

	obj.GetTableDDM = function(self)
		return obj.TableDDM
	end

	-- Constructor Main
	if obj.Faction == "Horde" then
		obj:PrepareGuidesTableHorde(obj.Race)
		obj:PrepareNoGuidesTableHorde(obj.Race)
	else
		obj:PrepareGuidesTableAlliance(obj.Race)
		obj:PrepareNoGuidesTableAlliance(obj.Race)
	end
	
	-- we use a HUGE offset here, so we know those NoGuide will end up at the end!
	obj.NoGuide, obj.NoGuideCount = obj:NormalizeGuide(obj.NoGuide, 100500)
	obj.Guide = TablesMerge(obj.Guide, obj.NoGuide)
	
	obj.Guide, obj.GuideCount = obj:NormalizeGuide(obj.Guide, nil)

	obj:DefineDDMProfessionsSubMenu()
	obj:DefineDDMStartingZonesSubMenu(obj.Faction)
	obj:DefineDDMLaterLevelingSubMenu(obj.Faction)

	obj:ClearInitialTablesContent()

	return obj
end

Dv(" VGuide GuideTable.lua Start")
--return VGuide

--[[
do
-----------------------------------------------------------------
	Table_001_Introduction = {
		[0001] = {	title = "Introduction" },
	}
-----------------------------------------------------------------
	Table_002_Durotar = {
		[0106] = {	title = "1-6 Durotar" },
		[0609] = {	title = "6-9 Durotar" },
		[0912] = {	title = "9-12 Durotar" },
	}
	Table_002_Mulgore = {
		[0106] = {	title = "1-6 Mulgore" },
		[0610] = {	title = "6-10 Mulgore" },
		[1012] = {	title = "10-12 Mulgore" },
	}
	Table_002_TirisfalGlades = {
		[0106] = {	title = "1-6 DeathKnell (Tirisfal Glades)" },
		[0610] = {	title = "6-10 Tirisfal Glades" },
		[1012] = {	title = "10-12 Tirisfal Glades" },
	}
-----------------------------------------------------------------	
	Table_002_DunMorogh = {
		[0106] = {	title = "1-6 Cold Ridge Valley" },
        [0612] = {	title = "6-12 Dun Morogh" },
    }
	Table_002_Teldrassil = {
		[0106] = {	title = "1-6 Teldrassil" },
		[0612] = {	title = "6-12 Teldrassil" },
	}
	Table_002_ElwynnForest = {
		[0110] = {	title = "1-10 Elwynn Forest" },
		[1012] = {	title = "10-12 Westfall and Loch Modan" },
	}
-----------------------------------------------------------------
	Table_003_Horde_12to20 = {
		[1215] = {	title = "12-15 Barrens" },
		[1516] = {	title = "15-16 Stonetalon Mountains" },
		[1618] = {	title = "16-20 Barrens Part 1" },
		[1820] = {	title = "16-20 Barrens Part 2" },
	}
	Table_003_Horde_20to30 = {
		[2021] = { title = "20-21 Stonetalon Mountains" },
		[2121] = {	title = "21-21 Ashenvale" },
		[2223] = {	title = "22-23 Southern Barrens" },
		[2325] = {	title = "23-25 Stonetalon Mountains" },
		[2525] = {	title = "25-25 Southern Barrens" },
		[2526] = {	title = "25-26 Thousand Needles" },
		[2627] = {	title = "26-27 Ashenvale" },
		[2727] = {	title = "27-27 Stonetalon Mountains" },
		[2729] = {	title = "27-29 Thousand Needles" },
		[2930] = {	title = "29-30 Hillsbrad Foothills" },
	}
	Table_003_Horde_30to40 = {
		[3029] = {	title = "30-30 Alterac Mountains" },
		[3030] = {	title = "30-30 Arathi Highlands" },
		[3031] = {	title = "30-31 Stranglethorn Vale" },
		[3132] = {	title = "31-32 TN (Shimmering Flats)" },
		[3234] = {	title = "32-34 Desolace" },
		[3435] = {	title = "34-35 Stranglethorn Vale" },
		[3537] = {	title = "35-37 Arathi Highlands" },
		[3736] = {	title = "37-37 Alterac Mountains" },
		[3737] = {	title = "37-37 Thousand Needles" },
		[3738] = {	title = "37-38 Dustwallow Marsh" },
		[3840] = {	title = "38-40 Stranglethorn Vale" },
	}
	Table_003_Horde_40to50 = {
		[4041] = {	title = "40-41 Badlands" },
		[4142] = {	title = "41-42 Swamp of Sorrows" },
		[4243] = {	title = "42-43 Stranglethorn Vale" },
		[4342] = {	title = "43-43 Desolace" },
		[4343] = {	title = "43-43 Dustwallow Marsh" },
		[4344] = {	title = "43-44 Tanaris" },
		[4446] = {	title = "44-46 Feralas" },
		[4646] = {	title = "46-46 Azshara" },
		[4647] = {	title = "46-47 Hinterlands" },
		[4747] = {	title = "47-47 Stranglethorn Vale" },
		[4748] = {	title = "47-48 Searing Gorge" },
		[4848] = {	title = "48-48 Swamp of Sorrows" },
		[4849] = {	title = "48-49 Feralas" },
		[4950] = {	title = "49-50 Tanaris" },
	}
	Table_003_Horde_50to60 = {
		[5049] = {	title = "50-50 Azshara" },
		[5050] = {	title = "50-50 Hinterlands" },
		[5051] = {	title = "50-51 Blasted Lands" },
		[5152] = {	title = "51-52 Un'Goro Crater" },
		[5253] = {	title = "52-53 Burning Steppes" },
		[5354] = {	title = "53-54 Azshara" },
		[5454] = {	title = "54-54 Felwood" },
		[5455] = {	title = "54-55 Winterspring" },
		[5554] = {	title = "55-55 Felwood" },
		[5555] = {	title = "55-55 Silithus" },
		[5556] = {	title = "55-56 Western Plaguelands" },
		[5657] = {	title = "56-57 Eastern Plaguelands" },
		[5758] = {	title = "57-58 Western Plaguelands" },
		[5860] = {	title = "58-60 Winterspring" },
	}
-----------------------------------------------------------------
	Table_003_Alliance_12to20 = {
		[1214] = {	title = "12-14 Darkshore" },
		[1417] = {	title = "14-17 Darkshore" },
		[1718] = {	title = "17-18 Loch Modan" },
		[1820] = {	title = "18-20 Redridge Mountains" },
	}
	Table_003_Alliance_20to30 = {
		[2021] = {  title = "20-21 Darkshore" },
        [2122] = {  title = "21-22 Ashenvale" },
        [2223] = {  title = "22-23 Stonetalon Mountains" },
        [2324] = {  title = "23-24 Darkshore" },
        [2425] = {  title = "24-25 Ashenvale" },
        [2526] = {  title = "25-27 Wetlands" },
        [2728] = {  title = "27-28 Lakeshire" },
        [2829] = {  title = "28-29 Duskwood" },
        [2930] = {	title = "29-30 Ashenvale" },
		[3030] = {  title = "30-30 Wetlands" },
	}
	Table_003_Alliance_30to40 = {
		[3031] = {	title = "30-31 Hillsbrad Foothills" },
		[3131] = {	title = "31-31 Alterac Mountains" },
		[3132] = {	title = "31-32 Arathi Highlands" },
		[3232] = {	title = "32-32 Stranglethorn Vale" },
		[3233] = {	title = "32-33 Thousand Needles (Shimmering Flats)" },
		[3333] = {	title = "33-33 Stonetalon Mountains" },
		[3335] = {	title = "33-35 Desolace" },
		[3536] = {	title = "35-36 Stranglethorn Vale" },
		[3637] = {	title = "36-37 Alterac Mountains" },
		[3738] = {  title = "37-38 Arathi Highlands" },
	    [3838] = {	title = "38-38 Dustwallow Marsh", }
		[3840] = {	title = "38-40 Stranglethorn Vale" },
	}
	Table_003_Alliance_40to50 = {
		[4041] = {	title = "40-41 Badlands" },
		[4141] = {	title = "41-41 Swamp of Sorrows" },
		[4142] = {	title = "41-42 Desolace" },
		[4243] = {	title = "42-43 Stranglethron Vale" },
		[4343] = {	title = "43-43 Tanaris" },
		[4345] = {	title = "43-45 Feralas" },
		[4546] = {	title = "45-46 Uldaman" },
		[4647] = {	title = "46-47 The Hinterlands" },
		[4747] = {	title = "47-47 Feralas" },
		[4748] = {	title = "47-48 Tanaris" },
		[4848] = {	title = "48-48 The Hinterlands" },
		[4849] = {	title = "48-49 Stranglethorn Vale" },
		[4950] = {	title = "49-50 Blasted Lands" },
	}
	Table_003_Alliance_50to60 = {
		[5051] = {	title = "50-51 Searing Gorge" },
		[5152] = {	title = "51-52 Un’Goro Crater" },
		[5253] = {	title = "52-53 Azshara" },
		[5354] = {	title = "53-54 Felwood" },
		[5453] = {	title = "54-54 Tanaris" },
		[5454] = {	title = "54-54 Felwood" },
		[5455] = {	title = "54-55 Winterspring" },
		[5556] = {	title = "55-56 Burning Steppes" },
		[5655] = {	title = "56-56 Tanaris" },
		[5656] = {	title = "56-56 Silithus" },
		[5657] = {	title = "56-57 Western Plaguelands" },
		[5758] = {	title = "57-58 Eastern Plaguelands" },
		[5857] = {	title = "58-58 Western Plaguelands" },
		[5858] = {	title = "58-58 Eastern Plaguelands" },
		[5859] = {	title = "58-59 Western Plaguelands" },
		[5960] = {	title = "59-60 Winterspring" },
	}
-----------------------------------------------------------------
	Table_004_Professions = {
		[7002] = {	title = "1-300 Alchemy" },
		[7003] = {	title = "1-300 Blacksmithing" },
		[7004] = {	title = "1-300 Cooking (Horde)" },
		[7005] = {	title = "1-300 Cooking (Alliance)" },
		[7006] = {	title = "1-300 Enchanting" },
		[7007] = {	title = "1-300 Engineering" },
		[7008] = {	title = "1-300 Leatherworking" },
		[7009] = {	title = "1-300 Tailoring" },
	}
end
]]
