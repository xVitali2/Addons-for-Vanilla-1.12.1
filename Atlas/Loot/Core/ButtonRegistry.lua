local L = AceLibrary("AceLocale-2.2"):new("AtlasLoot") 
local BC = AceLibrary("Babble-Class-2.2")
local BS = AceLibrary("Babble-Spell-2.2")
local BF = AceLibrary("Babble-Faction-2.2")
local BZ = AceLibrary("Babble-Zone-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2")

AtlasLoot_ButtonRegistry = {
	--WoW Factions
	["Argent1"] = {
		Title = BF["Argent Dawn"]..": "..L["Token Hand-Ins"],
		Next_Page = "Argent2",
		Next_Title = BF["Argent Dawn"]..": "..BF["Friendly"].."-"..BF["Exalted"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Argent2"] = {
		Title = BF["Argent Dawn"]..": "..BF["Friendly"].."-"..BF["Honored"],
		Prev_Page = "Argent1",
		Prev_Title = BF["Argent Dawn"]..": "..L["Token Hand-Ins"],
		Next_Page = "Argent3",
		Next_Title = BF["Argent Dawn"]..": "..BF["Revered"].."-"..BF["Exalted"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Argent3"] = {
		Title = BF["Argent Dawn"]..": "..BF["Revered"].."-"..BF["Exalted"],
		Prev_Page = "Argent2",
		Prev_Title = BF["Argent Dawn"]..": "..BF["Friendly"].."-"..BF["Honored"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Bloodsail1"] = {
		Title = BF["Bloodsail Buccaneers"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["AQBroodRings"] = {
		Title = BF["Brood of Nozdormu"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Cenarion1"] = {
		Title = BF["Cenarion Circle"]..": "..BF["Friendly"],
		Next_Page = "Cenarion2",
		Next_Title = BF["Cenarion Circle"]..": "..BF["Honored"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Cenarion2"] = {
		Title = BF["Cenarion Circle"]..": "..BF["Honored"],
		Next_Page = "Cenarion3",
		Next_Title = BF["Cenarion Circle"]..": "..BF["Revered"],
		Prev_Page = "Cenarion1",
		Prev_Title = BF["Cenarion Circle"]..": "..BF["Friendly"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Cenarion3"] = {
		Title = BF["Cenarion Circle"]..": "..BF["Revered"],
		Next_Page = "Cenarion4",
		Next_Title = BF["Cenarion Circle"]..": "..BF["Exalted"],
		Prev_Page = "Cenarion2",
		Prev_Title = BF["Cenarion Circle"]..": "..BF["Honored"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Cenarion4"] = {
		Title = BF["Cenarion Circle"]..": "..BF["Exalted"],
		Prev_Page = "Cenarion3",
		Prev_Title = BF["Cenarion Circle"]..": "..BF["Revered"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Darkmoon"] = {
		Title = BF["Darkmoon Faire"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Defilers"] = {
		Title = BF["The Defilers"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Frostwolf1"] = {
		Title = BF["Frostwolf Clan"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["GelkisClan1"] = {
		Title = BF["Gelkis Clan Centaur"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["WaterLords1"] = {
		Title = BF["Hydraxian Waterlords"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["LeagueofArathor"] = {
		Title = BF["The League of Arathor"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["MagramClan1"] = {
		Title = BF["Magram Clan Centaur"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Stormpike1"] = {
		Title = BF["Stormpike Guard"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Thorium1"] = {
		Title = BF["Thorium Brotherhood"]..": "..BF["Friendly"].."/"..BF["Honored"],
		Next_Page = "Thorium2",
		Next_Title = BF["Thorium Brotherhood"]..": "..BF["Revered"].."/"..BF["Exalted"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Thorium2"] = {
		Title = BF["Thorium Brotherhood"]..": "..BF["Revered"].."/"..BF["Exalted"],
		Prev_Page = "Thorium1",
		Prev_Title = BF["Thorium Brotherhood"]..": "..BF["Friendly"].."/"..BF["Honored"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Timbermaw"] = {
		Title = BF["Timbermaw Hold"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Wintersaber1"] = {
		Title = BF["Wintersaber Trainers"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Zandalar1"] = {
		Title = BF["Zandalar Tribe"]..": "..BF["Friendly"].."/"..BF["Honored"],
		Next_Page = "Zandalar2",
		Next_Title = BF["Zandalar Tribe"]..": "..BF["Revered"].."/"..BF["Exalted"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["Zandalar2"] = {
		Title = BF["Zandalar Tribe"]..": "..BF["Revered"].."/"..BF["Exalted"],
		Prev_Page = "Zandalar1",
		Prev_Title = BF["Zandalar Tribe"]..": "..BF["Friendly"].."/"..BF["Honored"],
		Back_Page = "REPMENU",
		Back_Title = L["Factions"]
	},
	["WSGRepFriendly"] = {
		Title = L["Friendly Reputation Rewards"],
		Back_Page = "WSGRepMenu",
	},
	["WSGRepHonored1019"] = {
		Title = "10-19 "..L["Honored Reputation Rewards"],
		Back_Page = "WSGRepMenu",
		Next_Page = "WSGRepHonored2029",
	},
	["WSGRepHonored2029"] = {
		Title = "20-29 "..L["Honored Reputation Rewards"],
		Back_Page = "WSGRepMenu",
		Next_Page = "WSGRepHonored3039",
		Prev_Page = "WSGRepHonored1019",
	},
	["WSGRepHonored3039"] = {
		Title = "30-39 "..L["Honored Reputation Rewards"],
		Back_Page = "WSGRepMenu",
		Next_Page = "WSGRepHonored4049",
		Prev_Page = "WSGRepHonored2029",
	},
	["WSGRepHonored4049"] = {
		Title = "40-49 "..L["Honored Reputation Rewards"],
		Back_Page = "WSGRepMenu",
		Next_Page = "WSGRepHonored5059",
		Prev_Page = "WSGRepHonored3039",
	},
	["WSGRepHonored5059"] = {
		Title = "50-59 "..L["Honored Reputation Rewards"],
		Back_Page = "WSGRepMenu",
		Prev_Page = "WSGRepHonored4049",
	},
	["WSGRepRevered1019"] = {
		Title = "10-19 "..L["Revered Reputation Rewards"],
		Back_Page = "WSGRepMenu",
		Next_Page = "WSGRepRevered2029",
	},
	["WSGRepRevered2029"] = {
		Title = "20-29 "..L["Revered Reputation Rewards"],
		Back_Page = "WSGRepMenu",
		Next_Page = "WSGRepRevered3039",
		Prev_Page = "WSGRepRevered1019",
	},
	["WSGRepRevered3039"] = {
		Title = "30-39 "..L["Revered Reputation Rewards"],
		Back_Page = "WSGRepMenu",
		Next_Page = "WSGRepRevered4049",
		Prev_Page = "WSGRepRevered2029",
	},
	["WSGRepRevered4049"] = {
		Title = "40-49 "..L["Revered Reputation Rewards"],
		Back_Page = "WSGRepMenu",
		Next_Page = "WSGRepRevered5059",
		Prev_Page = "WSGRepRevered3039",
	},
	["WSGRepRevered5059"] = {
		Title = "50-59 "..L["Revered Reputation Rewards"],
		Back_Page = "WSGRepMenu",
		Prev_Page = "WSGRepRevered4049",
	},
	["WSGRepExalted4049"] = {
		Title = "40-49 "..L["Exalted Reputation Rewards"],
		Back_Page = "WSGRepMenu",
		Next_Page = "WSGRepExalted5059",
	},
	["WSGRepExalted5059"] = {
		Title = "50-59 "..L["Exalted Reputation Rewards"],
		Back_Page = "WSGRepMenu",
		Next_Page = "WSGRepExalted60",
		Prev_Page = "WSGRepExalted4049",
	},
	["WSGRepExalted60"] = {
		Title = "60 "..L["Exalted Reputation Rewards"],
		Back_Page = "WSGRepMenu",
		Prev_Page = "WSGRepExalted5059",
	},
	["ABRepFriendly"] = {
		Title = L["Friendly Reputation Rewards"],
		Back_Page = "ABRepMenu",
	},
	["ABRepHonored2029"] = {
		Title = "20-29 "..L["Honored Reputation Rewards"],
		Back_Page = "ABRepMenu",
		Next_Page = "ABRepHonored3039",
	},
	["ABRepHonored3039"] = {
		Title = "30-39 "..L["Honored Reputation Rewards"],
		Back_Page = "ABRepMenu",
		Next_Page = "ABRepHonored4049",
		Prev_Page = "ABRepHonored2029",
	},
	["ABRepHonored4049"] = {
		Title = "40-49 "..L["Honored Reputation Rewards"],
		Back_Page = "ABRepMenu",
		Next_Page = "ABRepHonored5059",
		Prev_Page = "ABRepHonored3039",
	},
	["ABRepHonored5059"] = {
		Title = "50-59 "..L["Honored Reputation Rewards"],
		Back_Page = "ABRepMenu",
		Prev_Page = "ABRepHonored4049",
	},
	["ABRepRevered2029"] = {
		Title = "20-29 "..L["Revered Reputation Rewards"],
		Back_Page = "ABRepMenu",
		Next_Page = "ABRepRevered3039",
	},
	["ABRepRevered3039"] = {
		Title = "30-39 "..L["Revered Reputation Rewards"],
		Back_Page = "ABRepMenu",
		Next_Page = "ABRepRevered4049",
		Prev_Page = "ABRepRevered2029",
	},
	["ABRepRevered4049"] = {
		Title = "40-49 "..L["Revered Reputation Rewards"],
		Back_Page = "ABRepMenu",
		Next_Page = "ABRepRevered5059",
		Prev_Page = "ABRepRevered3039",
	},
	["ABRepRevered5059"] = {
		Title = "50-59 "..L["Revered Reputation Rewards"],
		Back_Page = "ABRepMenu",
		Prev_Page = "ABRepRevered4049",
	},
	["ABRepExalted"] = {
		Title = L["Exalted Reputation Rewards"],
		Back_Page = "ABRepMenu",
	},
	["AVRepFriendly"] = {
		Title = L["Friendly Reputation Rewards"],
		Back_Page = "AVRepMenu",
		Next_Page = "AVRepHonored",
	},
	["AVRepHonored"] = {
		Title = L["Honored Reputation Rewards"],
		Back_Page = "AVRepMenu",
		Next_Page = "AVRepRevered",
		Prev_Page = "AVRepFriendly",
	},
	["AVRepRevered"] = {
		Title = L["Revered Reputation Rewards"],
		Back_Page = "AVRepMenu",
		Next_Page = "AVRepExalted",
		Prev_Page = "AVRepHonored",
	},
	["AVRepExalted"] = {
		Title = L["Exalted Reputation Rewards"],
		Back_Page = "AVRepMenu",
		Prev_Page = "AVRepRevered",
	},
	["PvP60Accessories1"] = {
		Title = L["PvP Trinkets"],
		Next_Page = "PvP60Accessories2",
		Next_Title = AtlasLoot_TableNames["PvP60Accessories2"][1],
		Back_Page = "PVPMENU",
		Back_Title = L["PvP Rewards"]
	},
	["PvP60Accessories2"] = {
		Title = AtlasLoot_TableNames["PvP60Accessories2"][1],
		Next_Page = "PvP60Accessories3",
		Next_Title = AtlasLoot_TableNames["PvP60Accessories3"][1],
		Prev_Page = "PvP60Accessories1",
		Prev_Title = L["PvP Accessories"]..": "..L["Level 60"],
		Back_Page = "PVPMENU",
		Back_Title = L["PvP Rewards"]
	},
	["PvP60Accessories3"] = {
		Title = AtlasLoot_TableNames["PvP60Accessories3"][1],
		Prev_Page = "PvP60Accessories2",
		Prev_Title = AtlasLoot_TableNames["PvP60Accessories2"][1],
		Back_Page = "PVPMENU",
		Back_Title = L["PvP Rewards"]
	},
	["PVPWeapons1"] = {
		Title = L["Rank 14 Weapons"],
		Next_Page = "PVPWeapons2",
		Next_Title = L["Rank 14 Weapons"],
		Back_Page = "PVPMENU",
		Back_Title = L["PvP Rewards"]
	},
	["PVPWeapons2"] = {
		Title = L["Rank 14 Weapons"],
		Prev_Page = "PVPWeapons1",
		Prev_Title = L["Rank 14 Weapons"],
		Back_Page = "PVPMENU",
		Back_Title = L["PvP Rewards"]
	},
	["PVPDruid"] = {
		Title = BC["Druid"],
		Back_Page = "PVPSET",
		Back_Title = L["PvP Armor Sets"]
	},
	["PVPHunter"] = {
		Title = BC["Hunter"],
		Back_Page = "PVPSET",
		Back_Title = L["PvP Armor Sets"]
	},
	["PVPMage"] = {
		Title = BC["Mage"],
		Back_Page = "PVPSET",
		Back_Title = L["PvP Armor Sets"]
	},
	["PVPPaladin"] = {
		Title = BC["Paladin"],
		Back_Page = "PVPSET",
		Back_Title = L["PvP Armor Sets"]
	},
	["PVPPriest"] = {
		Title = BC["Priest"],
		Back_Page = "PVPSET",
		Back_Title = L["PvP Armor Sets"]
	},
	["PVPRogue"] = {
		Title = BC["Rogue"],
		Back_Page = "PVPSET",
		Back_Title = L["PvP Armor Sets"]
	},
	["PVPShaman"] = {
		Title = BC["Shaman"],
		Back_Page = "PVPSET",
		Back_Title = L["PvP Armor Sets"]
	},
	["PVPWarlock"] = {
		Title = BC["Warlock"],
		Back_Page = "PVPSET",
		Back_Title = L["PvP Armor Sets"]
	},
	["PVPWarrior"] = {
		Title = BC["Warrior"],
		Back_Page = "PVPSET",
		Back_Title = L["PvP Armor Sets"]
	},
	["T0Druid"] = {
		Title = BC["Druid"],
		Back_Page = "T0SET",
		Back_Title = L["Tier 0/0.5 Sets"]
	},
	["T0Hunter"] = {
		Title = BC["Hunter"],
		Back_Page = "T0SET",
		Back_Title = L["Tier 0/0.5 Sets"]
	},
	["T0Mage"] = {
		Title = BC["Mage"],
		Back_Page = "T0SET",
		Back_Title = L["Tier 0/0.5 Sets"]
	},
	["T0Paladin"] = {
		Title = BC["Paladin"],
		Back_Page = "T0SET",
		Back_Title = L["Tier 0/0.5 Sets"]
	},
	["T0Priest"] = {
		Title = BC["Priest"],
		Back_Page = "T0SET",
		Back_Title = L["Tier 0/0.5 Sets"]
	},
	["T0Rogue"] = {
		Title = BC["Rogue"],
		Back_Page = "T0SET",
		Back_Title = L["Tier 0/0.5 Sets"]
	},
	["T0Shaman"] = {
		Title = BC["Shaman"],
		Back_Page = "T0SET",
		Back_Title = L["Tier 0/0.5 Sets"]
	},
	["T0Warlock"] = {
		Title = BC["Warlock"],
		Back_Page = "T0SET",
		Back_Title = L["Tier 0/0.5 Sets"]
	},
	["T0Warrior"] = {
		Title = BC["Warrior"],
		Back_Page = "T0SET",
		Back_Title = L["Tier 0/0.5 Sets"]
	},
	["T1Druid"] = {
		Title = BC["Druid"],
		Back_Page = "T1SET",
		Back_Title = L["Tier 1 Sets"]
	},
	["T1Hunter"] = {
		Title = BC["Hunter"],
		Back_Page = "T1SET",
		Back_Title = L["Tier 1 Sets"]
	},
	["T1Mage"] = {
		Title = BC["Mage"],
		Back_Page = "T1SET",
		Back_Title = L["Tier 1 Sets"]
	},
	["T1Paladin"] = {
		Title = BC["Paladin"],
		Back_Page = "T1SET",
		Back_Title = L["Tier 1 Sets"]
	},
	["T1Priest"] = {
		Title = BC["Priest"],
		Back_Page = "T1SET",
		Back_Title = L["Tier 1 Sets"]
	},
	["T1Rogue"] = {
		Title = BC["Rogue"],
		Back_Page = "T1SET",
		Back_Title = L["Tier 1 Sets"]
	},
	["T1Shaman"] = {
		Title = BC["Shaman"],
		Back_Page = "T1SET",
		Back_Title = L["Tier 1 Sets"]
	},
	["T1Warlock"] = {
		Title = BC["Warlock"],
		Back_Page = "T1SET",
		Back_Title = L["Tier 1 Sets"]
	},
	["T1Warrior"] = {
		Title = BC["Warrior"],
		Back_Page = "T1SET",
		Back_Title = L["Tier 1 Sets"]
	},
	["T2Druid"] = {
		Title = BC["Druid"],
		Back_Page = "T2SET",
		Back_Title = L["Tier 2 Sets"]
	},
	["T2Hunter"] = {
		Title = BC["Hunter"],
		Back_Page = "T2SET",
		Back_Title = L["Tier 2 Sets"]
	},
	["T2Mage"] = {
		Title = BC["Mage"],
		Back_Page = "T2SET",
		Back_Title = L["Tier 2 Sets"]
	},
	["T2Paladin"] = {
		Title = BC["Paladin"],
		Back_Page = "T2SET",
		Back_Title = L["Tier 2 Sets"]
	},
	["T2Priest"] = {
		Title = BC["Priest"],
		Back_Page = "T2SET",
		Back_Title = L["Tier 2 Sets"]
	},
	["T2Rogue"] = {
		Title = BC["Rogue"],
		Back_Page = "T2SET",
		Back_Title = L["Tier 2 Sets"]
	},
	["T2Shaman"] = {
		Title = BC["Shaman"],
		Back_Page = "T2SET",
		Back_Title = L["Tier 2 Sets"]
	},
	["T2Warlock"] = {
		Title = BC["Warlock"],
		Back_Page = "T2SET",
		Back_Title = L["Tier 2 Sets"]
	},
	["T2Warrior"] = {
		Title = BC["Warrior"],
		Back_Page = "T2SET",
		Back_Title = L["Tier 2 Sets"]
	},
	["T3Druid"] = {
		Title = BC["Druid"],
		Back_Page = "T3SET",
		Back_Title = L["Tier 3 Sets"]
	},
	["T3Hunter"] = {
		Title = BC["Hunter"],
		Back_Page = "T3SET",
		Back_Title = L["Tier 3 Sets"]
	},
	["T3Mage"] = {
		Title = BC["Mage"],
		Back_Page = "T3SET",
		Back_Title = L["Tier 3 Sets"]
	},
	["T3Paladin"] = {
		Title = BC["Paladin"],
		Back_Page = "T3SET",
		Back_Title = L["Tier 3 Sets"]
	},
	["T3Priest"] = {
		Title = BC["Priest"],
		Back_Page = "T3SET",
		Back_Title = L["Tier 3 Sets"]
	},
	["T3Rogue"] = {
		Title = BC["Rogue"],
		Back_Page = "T3SET",
		Back_Title = L["Tier 3 Sets"]
	},
	["T3Shaman"] = {
		Title = BC["Shaman"],
		Back_Page = "T3SET",
		Back_Title = L["Tier 3 Sets"]
	},
	["T3Warlock"] = {
		Title = BC["Warlock"],
		Back_Page = "T3SET",
		Back_Title = L["Tier 3 Sets"]
	},
	["T3Warrior"] = {
		Title = BC["Warrior"],
		Back_Page = "T3SET",
		Back_Title = L["Tier 3 Sets"]
	},
	["AQ40Druid"] = {
		Title = BC["Druid"],
		Back_Page = "AQ40SET",
		Back_Title = L["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Hunter"] = {
		Title = BC["Hunter"],
		Back_Page = "AQ40SET",
		Back_Title = L["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Mage"] = {
		Title = BC["Mage"],
		Back_Page = "AQ40SET",
		Back_Title = L["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Paladin"] = {
		Title = BC["Paladin"],
		Back_Page = "AQ40SET",
		Back_Title = L["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Priest"] = {
		Title = BC["Priest"],
		Back_Page = "AQ40SET",
		Back_Title = L["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Rogue"] = {
		Title = BC["Rogue"],
		Back_Page = "AQ40SET",
		Back_Title = L["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Shaman"] = {
		Title = BC["Shaman"],
		Back_Page = "AQ40SET",
		Back_Title = L["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Warlock"] = {
		Title = BC["Warlock"],
		Back_Page = "AQ40SET",
		Back_Title = L["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Warrior"] = {
		Title = BC["Warrior"],
		Back_Page = "AQ40SET",
		Back_Title = L["Temple of Ahn'Qiraj Sets"]
	},
	["AQ20Druid"] = {
		Title = BC["Druid"],
		Back_Page = "AQ20SET",
		Back_Title = L["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Hunter"] = {
		Title = BC["Hunter"],
		Back_Page = "AQ20SET",
		Back_Title = L["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Mage"] = {
		Title = BC["Mage"],
		Back_Page = "AQ20SET",
		Back_Title = L["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Paladin"] = {
		Title = BC["Paladin"],
		Back_Page = "AQ20SET",
		Back_Title = L["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Priest"] = {
		Title = BC["Priest"],
		Back_Page = "AQ20SET",
		Back_Title = L["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Rogue"] = {
		Title = BC["Rogue"],
		Back_Page = "AQ20SET",
		Back_Title = L["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Shaman"] = {
		Title = BC["Shaman"],
		Back_Page = "AQ20SET",
		Back_Title = L["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Warlock"] = {
		Title = BC["Warlock"],
		Back_Page = "AQ20SET",
		Back_Title = L["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Warrior"] = {
		Title = BC["Warrior"],
		Back_Page = "AQ20SET",
		Back_Title = L["Ruins of Ahn'Qiraj Sets"]
	},
	["ZGDruid"] = {
		Title = BC["Druid"],
		Back_Page = "ZGSET",
		Back_Title = L["Zul'Gurub Sets"]
	},
	["ZGHunter"] = {
		Title = BC["Hunter"],
		Back_Page = "ZGSET",
		Back_Title = L["Zul'Gurub Sets"]
	},
	["ZGMage"] = {
		Title = BC["Mage"],
		Back_Page = "ZGSET",
		Back_Title = L["Zul'Gurub Sets"]
	},
	["ZGPaladin"] = {
		Title = BC["Paladin"],
		Back_Page = "ZGSET",
		Back_Title = L["Zul'Gurub Sets"]
	},
	["ZGPriest"] = {
		Title = BC["Priest"],
		Back_Page = "ZGSET",
		Back_Title = L["Zul'Gurub Sets"]
	},
	["ZGRogue"] = {
		Title = BC["Rogue"],
		Back_Page = "ZGSET",
		Back_Title = L["Zul'Gurub Sets"]
	},
	["ZGShaman"] = {
		Title = BC["Shaman"],
		Back_Page = "ZGSET",
		Back_Title = L["Zul'Gurub Sets"]
	},
	["ZGWarlock"] = {
		Title = BC["Warlock"],
		Back_Page = "ZGSET",
		Back_Title = L["Zul'Gurub Sets"]
	},
	["ZGWarrior"] = {
		Title = BC["Warrior"],
		Back_Page = "ZGSET",
		Back_Title = L["Zul'Gurub Sets"]
	},
	["DEADMINES"] = {
		Title = BIS["Defias Leather"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["WAILING"] = {
		Title = BIS["Embrace of the Viper"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["SCARLET"] = {
		Title = BIS["Chain of the Scarlet Crusade"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["BLACKROCKD"] = {
		Title = BIS["The Gladiator"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["IRONWEAVE"] = {
		Title = BIS["Ironweave Battlesuit"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["ScholoCloth"] = {
		Title = BZ["Scholomance"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["ScholoLeather"] = {
		Title = BZ["Scholomance"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["ScholoMail"] = {
		Title = BZ["Scholomance"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["ScholoPlate"] = {
		Title = BZ["Scholomance"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["STRAT"] = {
		Title = BIS["The Postmaster"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["ScourgeInvasion"] = {
		Title = L["Scourge Invasion"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["ShardOfGods"] = {
		Title = BIS["Shard of the Gods"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["ZGRings"] = {
		Title = BZ["Zul'Gurub"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["HakkariBlades"] = {
		Title = BZ["Zul'Gurub"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["PrimalBlessing"] = {
		Title = BZ["Zul'Gurub"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["SpiritofEskhandar"] = {
		Title = BIS["Spirit of Eskhandar"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["DalRend"] = {
		Title = BIS["Dal'Rend's Arms"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["SpiderKiss"] = {
		Title = BIS["Spider's Kiss"],
		Back_Page = "PRE60SET",
		Back_Title = L["Pre 60 Sets"]
	},
	["ImperialPlate"] = {
		Title = BIS["Imperial Plate"],
		Back_Page = "CRAFTSET",
		Back_Title = L["Crafted Sets"]
	},
	["TheDarksoul"] = {
		Title = BIS["The Darksoul"],
		Back_Page = "CRAFTSET",
		Back_Title = L["Crafted Sets"]
	},
	["BloodsoulEmbrace"] = {
		Title = BIS["Bloodsoul Embrace"],
		Back_Page = "CRAFTSET",
		Back_Title = L["Crafted Sets"]
	},
	["BloodvineG"] = {
		Title = BIS["Bloodvine Garb"],
		Back_Page = "CRAFTSET",
		Back_Title = L["Crafted Sets"]
	},
	["VolcanicArmor"] = {
		Title = BIS["Volcanic Armor"],
		Back_Page = "CRAFTSET",
		Back_Title = L["Crafted Sets"]
	},
	["IronfeatherArmor"] = {
		Title = BIS["Ironfeather Armor"],
		Back_Page = "CRAFTSET",
		Back_Title = L["Crafted Sets"]
	},
	["StormshroudArmor"] = {
		Title = BIS["Stormshroud Armor"],
		Back_Page = "CRAFTSET",
		Back_Title = L["Crafted Sets"]
	},
	["DevilsaurArmor"] = {
		Title = BIS["Devilsaur Armor"],
		Back_Page = "CRAFTSET",
		Back_Title = L["Crafted Sets"]
	},
	["BloodTigerH"] = {
		Title = BIS["Blood Tiger Harness"],
		Back_Page = "CRAFTSET",
		Back_Title = L["Crafted Sets"]
	},
	["PrimalBatskin"] = {
		Title = BIS["Primal Batskin"],
		Back_Page = "CRAFTSET",
		Back_Title = L["Crafted Sets"]
	},
	["GreenDragonM"] = {
		Title = BIS["Green Dragon Mail"],
		Back_Page = "CRAFTSET",
		Back_Title = L["Crafted Sets"]
	},
	["BlueDragonM"] = {
		Title = BIS["Blue Dragon Mail"],
		Back_Page = "CRAFTSET",
		Back_Title = L["Crafted Sets"]
	},
	["BlackDragonM"] = {
		Title = BIS["Black Dragon Mail"],
		Back_Page = "CRAFTSET",
		Back_Title = L["Crafted Sets"]
	},
	["CraftedWeapons1"] = {
		Title = L["Crafted Epic Weapons"],
		Back_Page = "CRAFTINGMENU",
		Back_Title = L["Collections"]
	},
	["Tabards"] = {
		Title = L["Tabards"],
		Back_Page = "SETMENU",
		Back_Title = L["Collections"]
	},
	["Legendaries"] = {
		Title = L["Legendary Items"],
		Back_Page = "SETMENU",
		Back_Title = L["Collections"]
	},
	["Artifacts"] = {
		Title = L["Artifact Items"],
		Back_Page = "SETMENU",
		Back_Title = L["Collections"]
	},
	["PvPMountsPvP"] = {
		Title = L["PvP Mounts"],
		Back_Page = "PVPMENU",
		Back_Title = L["PvP Rewards"]
	},
	["UnobMounts"] = {
		Title = L["Unobtainable Mounts"],
		Back_Page = "SETMENU",
		Back_Title = L["Collections"]
	},
	["OldMounts"] = {
		Title = L["Old Mounts"],
		Back_Page = "SETMENU",
		Back_Title = L["Collections"]
	},
	["RareMounts"] = {
		Title = L["Rare Mounts"],
		Back_Page = "SETMENU",
		Back_Title = L["Collections"]
	},
	["RarePets1"] = {
		Title = L["Rare Pets"],
		Next_Page = "RarePets2",
		Next_Title = L["Rare Pets"],
		Back_Page = "SETMENU",
		Back_Title = L["Collections"]
	},
	["RarePets2"] = {
		Title = L["Rare Pets"],
		Prev_Page = "RarePets1",
		Prev_Title = L["Rare Pets"],
		Back_Page = "SETMENU",
		Back_Title = L["Collections"]
	},
	["WorldEpics1"] = {
		Title = AtlasLoot_TableNames["WorldEpics1"][1],
		Next_Page = "WorldEpics2",
		Next_Title = AtlasLoot_TableNames["WorldEpics2"][1],
		Back_Page = "WORLDEPICS",
		Back_Title = L["World Epics"]
	},
	["WorldEpics2"] = {
		Title = AtlasLoot_TableNames["WorldEpics2"][1],
		Next_Page = "WorldEpics3",
		Next_Title = AtlasLoot_TableNames["WorldEpics3"][1],
		Prev_Page = "WorldEpics1",
		Prev_Title = AtlasLoot_TableNames["WorldEpics1"][1],
		Back_Page = "WORLDEPICS",
		Back_Title = L["World Epics"]
	},
	["WorldEpics3"] = {
		Title = AtlasLoot_TableNames["WorldEpics3"][1],
		Prev_Page = "WorldEpics2",
		Prev_Title = AtlasLoot_TableNames["WorldEpics2"][1],
		Back_Page = "WORLDEPICS",
		Back_Title = L["World Epics"]
	},
	["WorldBluesHead"] = {
		Title = AtlasLoot_TableNames["WorldBluesHead"][1],
		Next_Page = "WorldBluesNeck",
		Next_Title = AtlasLoot_TableNames["WorldBluesNeck"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesNeck"] = {
		Title = AtlasLoot_TableNames["WorldBluesNeck"][1],
		Next_Page = "WorldBluesShoulder",
		Next_Title = AtlasLoot_TableNames["WorldBluesShoulder"][1],
		Prev_Page = "WorldBluesHead",
		Prev_Title = AtlasLoot_TableNames["WorldBluesHead"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesShoulder"] = {
		Title = AtlasLoot_TableNames["WorldBluesShoulder"][1],
		Next_Page = "WorldBluesBack",
		Next_Title = AtlasLoot_TableNames["WorldBluesBack"][1],
		Prev_Page = "WorldBluesNeck",
		Prev_Title = AtlasLoot_TableNames["WorldBluesNeck"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesBack"] = {
		Title = AtlasLoot_TableNames["WorldBluesBack"][1],
		Next_Page = "WorldBluesChest",
		Next_Title = AtlasLoot_TableNames["WorldBluesChest"][1],
		Prev_Page = "WorldBluesShoulder",
		Prev_Title = AtlasLoot_TableNames["WorldBluesShoulder"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesChest"] = {
		Title = AtlasLoot_TableNames["WorldBluesChest"][1],
		Next_Page = "WorldBluesWrist",
		Next_Title = AtlasLoot_TableNames["WorldBluesWrist"][1],
		Prev_Page = "WorldBluesBack",
		Prev_Title = AtlasLoot_TableNames["WorldBluesBack"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesWrist"] = {
		Title = AtlasLoot_TableNames["WorldBluesWrist"][1],
		Next_Page = "WorldBluesHands",
		Next_Title = AtlasLoot_TableNames["WorldBluesHands"][1],
		Prev_Page = "WorldBluesChest",
		Prev_Title = AtlasLoot_TableNames["WorldBluesChest"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesHands"] = {
		Title = AtlasLoot_TableNames["WorldBluesHands"][1],
		Next_Page = "WorldBluesWaist",
		Next_Title = AtlasLoot_TableNames["WorldBluesWaist"][1],
		Prev_Page = "WorldBluesWrist",
		Prev_Title = AtlasLoot_TableNames["WorldBluesWrist"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesWaist"] = {
		Title = AtlasLoot_TableNames["WorldBluesWaist"][1],
		Next_Page = "WorldBluesLegs",
		Next_Title = AtlasLoot_TableNames["WorldBluesLegs"][1],
		Prev_Page = "WorldBluesHands",
		Prev_Title = AtlasLoot_TableNames["WorldBluesHands"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesLegs"] = {
		Title = AtlasLoot_TableNames["WorldBluesLegs"][1],
		Next_Page = "WorldBluesFeet",
		Next_Title = AtlasLoot_TableNames["WorldBluesFeet"][1],
		Prev_Page = "WorldBluesWaist",
		Prev_Title = AtlasLoot_TableNames["WorldBluesWaist"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesFeet"] = {
		Title = AtlasLoot_TableNames["WorldBluesFeet"][1],
		Next_Page = "WorldBluesRing",
		Next_Title = AtlasLoot_TableNames["WorldBluesRing"][1],
		Prev_Page = "WorldBluesLegs",
		Prev_Title = AtlasLoot_TableNames["WorldBluesLegs"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesRing"] = {
		Title = AtlasLoot_TableNames["WorldBluesRing"][1],
		Next_Page = "WorldBluesTrinket",
		Next_Title = AtlasLoot_TableNames["WorldBluesTrinket"][1],
		Prev_Page = "WorldBluesFeet",
		Prev_Title = AtlasLoot_TableNames["WorldBluesFeet"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesTrinket"] = {
		Title = AtlasLoot_TableNames["WorldBluesTrinket"][1],
		Next_Page = "WorldBluesWand",
		Next_Title = AtlasLoot_TableNames["WorldBluesWand"][1],
		Prev_Page = "WorldBluesRing",
		Prev_Title = AtlasLoot_TableNames["WorldBluesRing"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesWand"] = {
		Title = AtlasLoot_TableNames["WorldBluesWand"][1],
		Next_Page = "WorldBluesHeldInOffhand",
		Next_Title = AtlasLoot_TableNames["WorldBluesHeldInOffhand"][1],
		Prev_Page = "WorldBluesTrinket",
		Prev_Title = AtlasLoot_TableNames["WorldBluesTrinket"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesHeldInOffhand"] = {
		Title = AtlasLoot_TableNames["WorldBluesHeldInOffhand"][1],
		Next_Page = "WorldBlues1HAxes",
		Next_Title = AtlasLoot_TableNames["WorldBlues1HAxes"][1],
		Prev_Page = "WorldBluesWand",
		Prev_Title = AtlasLoot_TableNames["WorldBluesWand"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBlues1HAxes"] = {
		Title = AtlasLoot_TableNames["WorldBlues1HAxes"][1],
		Next_Page = "WorldBlues1HMaces",
		Next_Title = AtlasLoot_TableNames["WorldBlues1HMaces"][1],
		Prev_Page = "WorldBluesHeldInOffhand",
		Prev_Title = AtlasLoot_TableNames["WorldBluesHeldInOffhand"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBlues1HMaces"] = {
		Title = AtlasLoot_TableNames["WorldBlues1HMaces"][1],
		Next_Page = "WorldBlues1HSwords",
		Next_Title = AtlasLoot_TableNames["WorldBlues1HSwords"][1],
		Prev_Page = "WorldBlues1HAxes",
		Prev_Title = AtlasLoot_TableNames["WorldBlues1HAxes"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBlues1HSwords"] = {
		Title = AtlasLoot_TableNames["WorldBlues1HSwords"][1],
		Next_Page = "WorldBlues2HAxes",
		Next_Title = AtlasLoot_TableNames["WorldBlues2HAxes"][1],
		Prev_Page = "WorldBlues1HMaces",
		Prev_Title = AtlasLoot_TableNames["WorldBlues1HMaces"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBlues2HAxes"] = {
		Title = AtlasLoot_TableNames["WorldBlues2HAxes"][1],
		Next_Page = "WorldBlues2HMaces",
		Next_Title = AtlasLoot_TableNames["WorldBlues2HMaces"][1],
		Prev_Page = "WorldBlues1HSwords",
		Prev_Title = AtlasLoot_TableNames["WorldBlues1HSwords"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBlues2HMaces"] = {
		Title = AtlasLoot_TableNames["WorldBlues2HMaces"][1],
		Next_Page = "WorldBlues2HSwords",
		Next_Title = AtlasLoot_TableNames["WorldBlues2HSwords"][1],
		Prev_Page = "WorldBlues2HAxes",
		Prev_Title = AtlasLoot_TableNames["WorldBlues2HAxes"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBlues2HSwords"] = {
		Title = AtlasLoot_TableNames["WorldBlues2HSwords"][1],
		Next_Page = "WorldBluesDaggers",
		Next_Title = AtlasLoot_TableNames["WorldBluesDaggers"][1],
		Prev_Page = "WorldBlues2HMaces",
		Prev_Title = AtlasLoot_TableNames["WorldBlues2HMaces"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesDaggers"] = {
		Title = AtlasLoot_TableNames["WorldBluesDaggers"][1],
		Next_Page = "WorldBluesFistWeapons",
		Next_Title = AtlasLoot_TableNames["WorldBluesFistWeapons"][1],
		Prev_Page = "WorldBlues2HSwords",
		Prev_Title = AtlasLoot_TableNames["WorldBlues2HSwords"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesFistWeapons"] = {
		Title = AtlasLoot_TableNames["WorldBluesFistWeapons"][1],
		Next_Page = "WorldBluesPolearms",
		Next_Title = AtlasLoot_TableNames["WorldBluesPolearms"][1],
		Prev_Page = "WorldBluesDaggers",
		Prev_Title = AtlasLoot_TableNames["WorldBluesDaggers"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesPolearms"] = {
		Title = AtlasLoot_TableNames["WorldBluesPolearms"][1],
		Next_Page = "WorldBluesStaves",
		Next_Title = AtlasLoot_TableNames["WorldBluesStaves"][1],
		Prev_Page = "WorldBluesFistWeapons",
		Prev_Title = AtlasLoot_TableNames["WorldBluesFistWeapons"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesStaves"] = {
		Title = AtlasLoot_TableNames["WorldBluesStaves"][1],
		Next_Page = "WorldBluesBows",
		Next_Title = AtlasLoot_TableNames["WorldBluesBows"][1],
		Prev_Page = "WorldBluesPolearms",
		Prev_Title = AtlasLoot_TableNames["WorldBluesPolearms"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesBows"] = {
		Title = AtlasLoot_TableNames["WorldBluesBows"][1],
		Next_Page = "WorldBluesCrossbows",
		Next_Title = AtlasLoot_TableNames["WorldBluesCrossbows"][1],
		Prev_Page = "WorldBluesStaves",
		Prev_Title = AtlasLoot_TableNames["WorldBluesStaves"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesCrossbows"] = {
		Title = AtlasLoot_TableNames["WorldBluesCrossbows"][1],
		Next_Page = "WorldBluesGuns",
		Next_Title = AtlasLoot_TableNames["WorldBluesGuns"][1],
		Prev_Page = "WorldBluesBows",
		Prev_Title = AtlasLoot_TableNames["WorldBluesBows"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesGuns"] = {
		Title = AtlasLoot_TableNames["WorldBluesGuns"][1],
		Next_Page = "WorldBluesShields",
		Next_Title = AtlasLoot_TableNames["WorldBluesShields"][1],
		Prev_Page = "WorldBluesCrossbows",
		Prev_Title = AtlasLoot_TableNames["WorldBluesCrossbows"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["WorldBluesShields"] = {
		Title = AtlasLoot_TableNames["WorldBluesShields"][1],
		Prev_Page = "WorldBluesGuns",
		Prev_Title = AtlasLoot_TableNames["WorldBluesGuns"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = L["World Blues"],
	},
	["ZGTrash1"] = {
		Title = AtlasLoot_TableNames["ZGTrash1"][1],
		Next_Page = "ZGTrash2",
		Next_Title = AtlasLoot_TableNames["ZGTrash2"][1],
	},
	["ZGTrash2"] = {
		Title = AtlasLoot_TableNames["ZGTrash2"][1],
		Prev_Page = "ZGTrash1",
		Prev_Title = AtlasLoot_TableNames["ZGTrash1"][1],
	},
	["AQ40Trash1"] = {
		Title = AtlasLoot_TableNames["AQ40Trash1"][1],
		Next_Page = "AQ40Trash2",
		Next_Title = AtlasLoot_TableNames["AQ40Trash2"][1],
	},
	["AQ40Trash2"] = {
		Title = AtlasLoot_TableNames["AQ40Trash2"][1],
		Prev_Page = "AQ40Trash1",
		Prev_Title = AtlasLoot_TableNames["AQ40Trash1"][1],
	},
	["ChildrensWeek"] = {
		Title = L["Children's Week"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["Winterviel1"] = {
		Title = L["Feast of Winter Veil"],
		Next_Page = "Winterviel2",
		Next_Title = AtlasLoot_TableNames["Winterviel2"][1],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["Winterviel2"] = {
		Title = AtlasLoot_TableNames["Winterviel2"][1],
		Prev_Page = "Winterviel1",
		Prev_Title = L["Feast of Winter Veil"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["Halloween1"] = {
		Title = L["Hallow's End"],
		Next_Page = "Halloween2",
		Next_Title = L["Hallow's End"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["Halloween2"] = {
		Title = L["Hallow's End"],
		Prev_Page = "Halloween1",
		Prev_Title = L["Hallow's End"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["HarvestFestival"] = {
		Title = L["Harvest Festival"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["Valentineday"] = {
		Title = L["Love is in the Air"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["LunarFestival1"] = {
		Title = L["Lunar Festival"],
		Next_Page = "LunarFestival2",
		Next_Title = L["Lunar Festival"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["LunarFestival2"] = {
		Title = L["Lunar Festival"],
		Prev_Page = "LunarFestival1",
		Prev_Title = L["Lunar Festival"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["MidsummerFestival"] = {
		Title = L["Midsummer Fire Festival"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["Noblegarden"] = {
		Title = L["Noblegarden"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["ElementalInvasion"] = {
		Title = L["Elemental Invasion"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["GurubashiArena"] = {
		Title = L["Gurubashi Arena Booty Run"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["ScourgeInvasionEvent1"] = {
		Title = L["Scourge Invasion"],
		Next_Page = "ScourgeInvasionEvent2",
		Next_Title = AtlasLoot_TableNames["ScourgeInvasionEvent2"][1],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["ScourgeInvasionEvent2"] = {
		Title = AtlasLoot_TableNames["ScourgeInvasionEvent2"][1],
		Prev_Page = "ScourgeInvasionEvent1",
		Prev_Title = L["Scourge Invasion"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["FishingExtravaganza"] = {
		Title = L["Stranglethorn Fishing Extravaganza"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = L["World Events"]
	},
	["AbyssalTemplars"] = {
		Title = L["Abyssal Council"].." - "..L["Templars"],
		Back_Page = "AbyssalCouncil",
		Back_Title = L["Abyssal Council"]
	},
	["AbyssalDukes"] = {
		Title = L["Abyssal Council"].." - "..L["Dukes"],
		Back_Page = "AbyssalCouncil",
		Back_Title = L["Abyssal Council"]
	},
	["AbyssalLords"] = {
		Title = L["Abyssal Council"].." - "..L["High Council"],
		Back_Page = "AbyssalCouncil",
		Back_Title = L["Abyssal Council"]
	},
	["AlchemyApprentice1"] = {
		Title = BS["Alchemy"]..": "..L["Apprentice"],
		Back_Page = "ALCHEMYMENU",
		Back_Title = BS["Alchemy"],
		Next_Page = "AlchemyJourneyman1",
		Next_Title = BS["Alchemy"]..": "..L["Journeyman"]
	},
	["AlchemyJourneyman1"] = {
		Title = BS["Alchemy"]..": "..L["Journeyman"],
		Back_Page = "ALCHEMYMENU",
		Back_Title = BS["Alchemy"],
		Next_Page = "AlchemyExpert1",
		Next_Title = BS["Alchemy"]..": "..L["Expert"],
		Prev_Page = "AlchemyApprentice1",
		Prev_Title = BS["Alchemy"]..": "..L["Apprentice"]
	},
	["AlchemyExpert1"] = {
		Title = BS["Alchemy"]..": "..L["Expert"],
		Back_Page = "ALCHEMYMENU",
		Back_Title = BS["Alchemy"],
		Next_Page = "AlchemyArtisan1",
		Next_Title = BS["Alchemy"]..": "..L["Artisan"],
		Prev_Page = "AlchemyJourneyman1",
		Prev_Title = BS["Alchemy"]..": "..L["Journeyman"]
	},
	["AlchemyArtisan1"] = {
		Title = BS["Alchemy"]..": "..L["Artisan"],
		Back_Page = "ALCHEMYMENU",
		Back_Title = BS["Alchemy"],
		Next_Page = "AlchemyArtisan2",
		Next_Title = BS["Alchemy"]..": "..L["Artisan"],
		Prev_Page = "AlchemyExpert1",
		Prev_Title = BS["Alchemy"]..": "..L["Expert"]
	},
	["AlchemyArtisan2"] = {
		Title = BS["Alchemy"]..": "..L["Artisan"],
		Back_Page = "ALCHEMYMENU",
		Back_Title = BS["Alchemy"],
		Prev_Page = "AlchemyArtisan1",
		Prev_Title = BS["Alchemy"]..": "..L["Artisan"]
	},
	["SmithingApprentice1"] = {
		Title = BS["Blacksmithing"]..": "..L["Apprentice"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Next_Page = "SmithingJourneyman1",
		Next_Title = BS["Blacksmithing"]..": "..L["Journeyman"]
	},
	["SmithingJourneyman1"] = {
		Title = BS["Blacksmithing"]..": "..L["Journeyman"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingApprentice1",
		Prev_Title = BS["Blacksmithing"]..": "..L["Apprentice"],
		Next_Page = "SmithingJourneyman2",
		Next_Title = BS["Blacksmithing"]..": "..L["Journeyman"]
	},
	["SmithingJourneyman2"] = {
		Title = BS["Blacksmithing"]..": "..L["Journeyman"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingJourneyman1",
		Prev_Title = BS["Blacksmithing"]..": "..L["Journeyman"],
		Next_Page = "SmithingExpert1",
		Next_Title = BS["Blacksmithing"]..": "..L["Expert"]
	},
	["SmithingExpert1"] = {
		Title = BS["Blacksmithing"]..": "..L["Expert"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingJourneyman2",
		Prev_Title = BS["Blacksmithing"]..": "..L["Journeyman"],
		Next_Page = "SmithingExpert2",
		Next_Title = BS["Blacksmithing"]..": "..L["Expert"]
	},
	["SmithingExpert2"] = {
		Title = BS["Blacksmithing"]..": "..L["Expert"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingExpert1",
		Prev_Title = BS["Blacksmithing"]..": "..L["Expert"],
		Next_Page = "SmithingArtisan1",
		Next_Title = BS["Blacksmithing"]..": "..L["Artisan"]
	},
	["SmithingArtisan1"] = {
		Title = BS["Blacksmithing"]..": "..L["Artisan"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingExpert2",
		Prev_Title = BS["Blacksmithing"]..": "..L["Expert"],
		Next_Page = "SmithingArtisan2",
		Next_Title = BS["Blacksmithing"]..": "..L["Artisan"]
	},
	["SmithingArtisan2"] = {
		Title = BS["Blacksmithing"]..": "..L["Artisan"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingArtisan1",
		Prev_Title = BS["Blacksmithing"]..": "..L["Artisan"],
		Next_Page = "SmithingArtisan3",
		Next_Title = BS["Blacksmithing"]
	},
	["SmithingArtisan3"] = {
		Title = BS["Blacksmithing"]..": "..L["Artisan"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingArtisan2",
		Prev_Title = BS["Blacksmithing"]..": "..L["Artisan"],
		Next_Page = "Armorsmith1",
		Next_Title = BS["Armorsmith"]
	},
	["Armorsmith1"] = {
		Title = BS["Armorsmith"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingArtisan3",
		Prev_Title = BS["Blacksmithing"]..": "..L["Artisan"],
		Next_Page = "Weaponsmith1",
		Next_Title = BS["Weaponsmith"]
	},
	["Weaponsmith1"] = {
		Title = BS["Weaponsmith"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "Armorsmith1",
		Prev_Title = BS["Armorsmith"],
		Next_Page = "Axesmith1",
		Next_Title = L["Master Axesmith"]
	},
	["Axesmith1"] = {
		Title = L["Master Axesmith"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "Weaponsmith1",
		Prev_Title = BS["Weaponsmith"],
		Next_Page = "Hammersmith1",
		Next_Title = L["Master Hammersmith"]
	},
	["Hammersmith1"] = {
		Title = L["Master Hammersmith"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "Axesmith1",
		Prev_Title = L["Master Axesmith"],
		Next_Page = "Swordsmith1",
		Next_Title = L["Master Swordsmith"]
	},
	["Swordsmith1"] = {
		Title = L["Master Swordsmith"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "Hammersmith1",
		Prev_Title = L["Master Hammersmith"]
	},
	["EnchantingApprentice1"] = {
		Title = BS["Enchanting"]..": "..L["Apprentice"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Next_Page = "EnchantingJourneyman1",
		Next_Title = BS["Enchanting"]..": "..L["Journeyman"]
	},
	["EnchantingJourneyman1"] = {
		Title = BS["Enchanting"]..": "..L["Journeyman"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Prev_Page = "EnchantingApprentice1",
		Prev_Title = BS["Enchanting"]..": "..L["Apprentice"],
		Next_Page = "EnchantingJourneyman2",
		Next_Title = BS["Enchanting"]..": "..L["Journeyman"]
	},
	["EnchantingJourneyman2"] = {
		Title = BS["Enchanting"]..": "..L["Journeyman"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Prev_Page = "EnchantingJourneyman1",
		Prev_Title = BS["Enchanting"]..": "..L["Journeyman"],
		Next_Page = "EnchantingExpert1",
		Next_Title = BS["Enchanting"]..": "..L["Expert"]
	},
	["EnchantingExpert1"] = {
		Title = BS["Enchanting"]..": "..L["Expert"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Prev_Page = "EnchantingJourneyman2",
		Prev_Title = BS["Enchanting"]..": "..L["Journeyman"],
		Next_Page = "EnchantingExpert2",
		Next_Title = BS["Enchanting"]..": "..L["Expert"]
	},
	["EnchantingExpert2"] = {
		Title = BS["Enchanting"]..": "..L["Expert"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Prev_Page = "EnchantingExpert1",
		Prev_Title = BS["Enchanting"]..": "..L["Expert"],
		Next_Page = "EnchantingArtisan1",
		Next_Title = BS["Enchanting"]..": "..L["Artisan"]
	},
	["EnchantingArtisan1"] = {
		Title = BS["Enchanting"]..": "..L["Artisan"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Prev_Page = "EnchantingExpert2",
		Prev_Title = BS["Enchanting"]..": "..L["Expert"],
		Next_Page = "EnchantingArtisan2",
		Next_Title = BS["Enchanting"]..": "..L["Artisan"]
	},
	["EnchantingArtisan2"] = {
		Title = BS["Enchanting"]..": "..L["Artisan"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Prev_Page = "EnchantingArtisan1",
		Prev_Title = BS["Enchanting"]..": "..L["Artisan"],
		Next_Page = "EnchantingArtisan3",
		Next_Title = BS["Enchanting"]..": "..L["Artisan"]
	},
	["EnchantingArtisan3"] = {
		Title = BS["Enchanting"]..": "..L["Artisan"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Prev_Page = "EnchantingArtisan2",
		Prev_Title = BS["Enchanting"]..": "..L["Artisan"]
	},
	["EngineeringApprentice1"] = {
		Title = BS["Engineering"]..": "..L["Apprentice"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Next_Page = "EngineeringJourneyman1",
		Next_Title = BS["Engineering"]..": "..L["Journeyman"]
	},
	["EngineeringJourneyman1"] = {
		Title = BS["Engineering"]..": "..L["Journeyman"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "EngineeringApprentice1",
		Prev_Title = BS["Engineering"]..": "..L["Apprentice"],
		Next_Page = "EngineeringJourneyman2",
		Next_Title = BS["Engineering"]..": "..L["Journeyman"]
	},
	["EngineeringJourneyman2"] = {
		Title = BS["Engineering"]..": "..L["Journeyman"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "EngineeringJourneyman1",
		Prev_Title = BS["Engineering"]..": "..L["Journeyman"],
		Next_Page = "EngineeringExpert1",
		Next_Title = BS["Engineering"]..": "..L["Expert"]
	},
	["EngineeringExpert1"] = {
		Title = BS["Engineering"]..": "..L["Expert"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "EngineeringJourneyman2",
		Prev_Title = BS["Engineering"]..": "..L["Journeyman"],
		Next_Page = "EngineeringExpert2",
		Next_Title = BS["Engineering"]..": "..L["Expert"]
	},
	["EngineeringExpert2"] = {
		Title = BS["Engineering"]..": "..L["Expert"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "EngineeringExpert1",
		Prev_Title = BS["Engineering"]..": "..L["Expert"],
		Next_Page = "EngineeringArtisan1",
		Next_Title = BS["Engineering"]..": "..L["Artisan"]
	},
	["EngineeringArtisan1"] = {
		Title = BS["Engineering"]..": "..L["Artisan"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "EngineeringExpert2",
		Prev_Title = BS["Engineering"]..": "..L["Expert"],
		Next_Page = "EngineeringArtisan2",
		Next_Title = BS["Engineering"]..": "..L["Artisan"]
	},
	["EngineeringArtisan2"] = {
		Title = BS["Engineering"]..": "..L["Artisan"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "EngineeringArtisan1",
		Prev_Title = BS["Engineering"]..": "..L["Artisan"],
		Next_Page = "Gnomish1",
		Next_Title = L["Gnomish Engineering"]
	},
	["Gnomish1"] = {
		Title = L["Gnomish Engineering"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "EngineeringArtisan2",
		Prev_Title = BS["Engineering"]..": "..L["Artisan"],
		Next_Page = "Goblin1",
		Next_Title = L["Goblin Engineering"]
	},
	["Goblin1"] = {
		Title = L["Goblin Engineering"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "Gnomish1",
		Prev_Title = L["Gnomish Engineering"]
	},
	["LeatherApprentice1"] = {
		Title = BS["Leatherworking"]..": "..L["Apprentice"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Next_Page = "LeatherJourneyman1",
		Next_Title = BS["Leatherworking"]..": "..L["Journeyman"]
	},
	["LeatherJourneyman1"] = {
		Title = BS["Leatherworking"]..": "..L["Journeyman"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherApprentice1",
		Prev_Title = BS["Leatherworking"]..": "..L["Apprentice"],
		Next_Page = "LeatherJourneyman2",
		Next_Title = BS["Leatherworking"]..": "..L["Journeyman"]
	},
	["LeatherJourneyman2"] = {
		Title = BS["Leatherworking"]..": "..L["Journeyman"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherJourneyman1",
		Prev_Title = BS["Leatherworking"]..": "..L["Journeyman"],
		Next_Page = "LeatherExpert1",
		Next_Title = BS["Leatherworking"]..": "..L["Expert"]
	},
	["LeatherExpert1"] = {
		Title = BS["Leatherworking"]..": "..L["Expert"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherJourneyman2",
		Prev_Title = BS["Leatherworking"]..": "..L["Journeyman"],
		Next_Page = "LeatherExpert2",
		Next_Title = BS["Leatherworking"]..": "..L["Expert"]
	},
	["LeatherExpert2"] = {
		Title = BS["Leatherworking"]..": "..L["Expert"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherExpert1",
		Prev_Title = BS["Leatherworking"]..": "..L["Expert"],
		Next_Page = "LeatherArtisan1",
		Next_Title = BS["Leatherworking"]..": "..L["Artisan"]
	},
	["LeatherArtisan1"] = {
		Title = BS["Leatherworking"]..": "..L["Artisan"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherExpert2",
		Prev_Title = BS["Leatherworking"]..": "..L["Expert"],
		Next_Page = "LeatherArtisan2",
		Next_Title = BS["Leatherworking"]..": "..L["Artisan"]
	},
	["LeatherArtisan2"] = {
		Title = BS["Leatherworking"]..": "..L["Artisan"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherArtisan1",
		Prev_Title = BS["Leatherworking"]..": "..L["Artisan"],
		Next_Page = "LeatherArtisan3",
		Next_Title = BS["Leatherworking"]..": "..L["Artisan"]
	},
	["LeatherArtisan3"] = {
		Title = BS["Leatherworking"]..": "..L["Artisan"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherArtisan2",
		Prev_Title = BS["Leatherworking"]..": "..L["Artisan"],
		Next_Page = "Dragonscale1",
		Next_Title = BS["Dragonscale Leatherworking"]
	},
	["Dragonscale1"] = {
		Title = BS["Dragonscale Leatherworking"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherArtisan3",
		Prev_Title = BS["Leatherworking"]..": "..L["Artisan"],
		Next_Page = "Elemental1",
		Next_Title = BS["Elemental Leatherworking"]
	},
	["Elemental1"] = {
		Title = BS["Elemental Leatherworking"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "Dragonscale1",
		Prev_Title = BS["Dragonscale Leatherworking"],
		Next_Page = "Tribal1",
		Next_Title = BS["Tribal Leatherworking"]
	},
	["Tribal1"] = {
		Title = BS["Tribal Leatherworking"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "Elemental1",
		Prev_Title = BS["Elemental Leatherworking"]
	},
	["Herbalism1"] = {
		Title = BS["Herbalism"],
		Back_Page = "CRAFTINGMENU",
		Back_Title = L["Crafting"],
		Next_Page = "Herbalism2",
		Next_Title = BS["Herbalism"]
	},
	["Herbalism2"] = {
		Title = BS["Herbalism"],
		Back_Page = "CRAFTINGMENU",
		Back_Title = L["Crafting"],
		Prev_Page = "Herbalism1",
		Prev_Title = BS["Herbalism"]
	},
	["Mining1"] = {
		Title = BS["Mining"],
		Back_Page = "MININGMENU",
		Back_Title = L["Crafting"],
		Next_Page = "Mining2",
		Next_Title = BS["Mining"]
	},
	["Mining2"] = {
		Title = BS["Mining"],
		Back_Page = "MININGMENU",
		Back_Title = L["Crafting"],
		Next_Page = "Smelting1",
		Next_Title = BS["Smelting"],
		Prev_Page = "Mining1",
		Prev_Title = BS["Mining"]
	},
	["Smelting1"] = {
		Title = BS["Smelting"],
		Back_Page = "MININGMENU",
		Back_Title = L["Crafting"],
		Prev_Page = "Mining2",
		Prev_Title = BS["Mining"]
	},
	["TailoringApprentice1"] = {
		Title = BS["Tailoring"]..": "..L["Apprentice"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Next_Page = "TailoringJourneyman1",
		Next_Title = BS["Tailoring"]..": "..L["Journeyman"]
	},
	["TailoringJourneyman1"] = {
		Title = BS["Tailoring"]..": "..L["Journeyman"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringApprentice1",
		Prev_Title = BS["Tailoring"]..": "..L["Apprentice"],
		Next_Page = "TailoringJourneyman2",
		Next_Title = BS["Tailoring"]..": "..L["Journeyman"]
	},
	["TailoringJourneyman2"] = {
		Title = BS["Tailoring"]..": "..L["Journeyman"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringJourneyman1",
		Prev_Title = BS["Tailoring"]..": "..L["Journeyman"],
		Next_Page = "TailoringExpert1",
		Next_Title = BS["Tailoring"]..": "..L["Expert"]
	},
	["TailoringExpert1"] = {
		Title = BS["Tailoring"]..": "..L["Expert"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringJourneyman2",
		Prev_Title = BS["Tailoring"]..": "..L["Journeyman"],
		Next_Page = "TailoringExpert2",
		Next_Title = BS["Tailoring"]..": "..L["Expert"]
	},
	["TailoringExpert2"] = {
		Title = BS["Tailoring"]..": "..L["Expert"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringExpert1",
		Prev_Title = BS["Tailoring"]..": "..L["Expert"],
		Next_Page = "TailoringArtisan1",
		Next_Title = BS["Tailoring"]..": "..L["Artisan"]
	},
	["TailoringArtisan1"] = {
		Title = BS["Tailoring"]..": "..L["Artisan"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringExpert2",
		Prev_Title = BS["Tailoring"]..": "..L["Expert"],
		Next_Page = "TailoringArtisan2",
		Next_Title = BS["Tailoring"]..": "..L["Artisan"]
	},
	["TailoringArtisan2"] = {
		Title = BS["Tailoring"]..": "..L["Artisan"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringArtisan1",
		Prev_Title = BS["Tailoring"]..": "..L["Artisan"],
		Next_Page = "TailoringArtisan3",
		Next_Title = BS["Tailoring"]..": "..L["Artisan"]
	},
	["TailoringArtisan3"] = {
		Title = BS["Tailoring"]..": "..L["Artisan"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringArtisan2",
		Prev_Title = BS["Tailoring"]..": "..L["Artisan"],
		Next_Page = "TailoringArtisan4",
		Next_Title = BS["Tailoring"]..": "..L["Artisan"]
	},
	["TailoringArtisan4"] = {
		Title = BS["Tailoring"]..": "..L["Artisan"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringArtisan3",
		Prev_Title = BS["Tailoring"]..": "..L["Artisan"]
	},
	["CookingApprentice1"] = {
		Title = BS["Cooking"]..": "..L["Apprentice"],
		Back_Page = "COOKINGMENU",
		Back_Title = BS["Cooking"],
		Next_Page = "CookingJourneyman1",
		Next_Title = BS["Cooking"]..": "..L["Journeyman"]
	},
	["CookingJourneyman1"] = {
		Title = BS["Cooking"]..": "..L["Journeyman"],
		Back_Page = "COOKINGMENU",
		Back_Title = BS["Cooking"],
		Prev_Page = "CookingApprentice1",
		Prev_Title = BS["Cooking"]..": "..L["Apprentice"],
		Next_Page = "CookingExpert1",
		Next_Title = BS["Cooking"]..": "..L["Journeyman"]
	},
	["CookingExpert1"] = {
		Title = BS["Cooking"]..": "..L["Expert"],
		Back_Page = "COOKINGMENU",
		Back_Title = BS["Cooking"],
		Prev_Page = "CookingJourneyman1",
		Prev_Title = BS["Cooking"]..": "..L["Journeyman"],
		Next_Page = "CookingArtisan1",
		Next_Title = BS["Cooking"]..": "..L["Artisan"]
	},
	["CookingArtisan1"] = {
		Title = BS["Cooking"]..": "..L["Artisan"],
		Back_Page = "COOKINGMENU",
		Back_Title = BS["Cooking"],
		Prev_Page = "CookingExpert1",
		Prev_Title = BS["Cooking"]..": "..L["Expert"]
	},
	["FirstAid1"] = {
		Title = BS["First Aid"],
		Back_Page = "CRAFTINGMENU",
		Back_Title = L["Crafting"]
	},
	["Poisons1"] = {
		Title = BS["Poisons"],
		Back_Page = "CRAFTINGMENU",
		Back_Title = L["Crafting"]
	}
}