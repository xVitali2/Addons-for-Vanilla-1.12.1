
local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot"); 
local BC = AceLibrary("Babble-Class-2.2")
local BS = AceLibrary("Babble-Spell-2.2")
local BF = AceLibrary("Babble-Faction-2.2")
local BZ = AceLibrary("Babble-Zone-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2")

-- Colours stored for code readability
local GREY = "|cff999999";
local RED = "|cffff0000";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff1eff00";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";


AtlasLoot_ButtonRegistry = {
	--WoW Factions
	["Argent1"] = {
		Title = BF["Argent Dawn"]..": "..AL["Token Hand-Ins"];
		Next_Page = "Argent2";
		Next_Title = BF["Argent Dawn"]..": "..BF["Friendly"].."-"..BF["Exalted"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];
	};
	["Argent2"] = {
		Title = BF["Argent Dawn"]..": "..BF["Friendly"].."-"..BF["Honored"];
		Prev_Page = "Argent1";
		Prev_Title = BF["Argent Dawn"]..": "..AL["Token Hand-Ins"];
		Next_Page = "Argent3";
		Next_Title = BF["Argent Dawn"]..": "..BF["Revered"].."-"..BF["Exalted"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];
	};
	["Argent3"] = {
		Title = BF["Argent Dawn"]..": "..BF["Revered"].."-"..BF["Exalted"];
		Prev_Page = "Argent2";
		Prev_Title = BF["Argent Dawn"]..": "..BF["Friendly"].."-"..BF["Honored"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];
	};
	["Bloodsail1"] = {
		Title = BF["Bloodsail Buccaneers"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["AQBroodRings"] = {
		Title = BF["Brood of Nozdormu"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["Cenarion1"] = {
		Title = BF["Cenarion Circle"]..": "..BF["Friendly"];
		Next_Page = "Cenarion2";
		Next_Title = BF["Cenarion Circle"]..": "..BF["Honored"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["Cenarion2"] = {
		Title = BF["Cenarion Circle"]..": "..BF["Honored"];
		Next_Page = "Cenarion3";
		Next_Title = BF["Cenarion Circle"]..": "..BF["Revered"];
		Prev_Page = "Cenarion1";
		Prev_Title = BF["Cenarion Circle"]..": "..BF["Friendly"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["Cenarion3"] = {
		Title = BF["Cenarion Circle"]..": "..BF["Revered"];
		Next_Page = "Cenarion4";
		Next_Title = BF["Cenarion Circle"]..": "..BF["Exalted"];
		Prev_Page = "Cenarion2";
		Prev_Title = BF["Cenarion Circle"]..": "..BF["Honored"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["Cenarion4"] = {
		Title = BF["Cenarion Circle"]..": "..BF["Exalted"];
		Prev_Page = "Cenarion3";
		Prev_Title = BF["Cenarion Circle"]..": "..BF["Revered"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["Darkmoon"] = {
		Title = BF["Darkmoon Faire"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["Defilers"] = {
		Title = BF["The Defilers"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["Frostwolf1"] = {
		Title = BF["Frostwolf Clan"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["GelkisClan1"] = {
		Title = BF["Gelkis Clan Centaur"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["WaterLords1"] = {
		Title = BF["Hydraxian Waterlords"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["LeagueofArathor"] = {
		Title = BF["The League of Arathor"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["MagramClan1"] = {
		Title = BF["Magram Clan Centaur"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["Stormpike1"] = {
		Title = BF["Stormpike Guard"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["Thorium1"] = {
		Title = BF["Thorium Brotherhood"]..": "..BF["Friendly"].."/"..BF["Honored"];
		Next_Page = "Thorium2";
		Next_Title = BF["Thorium Brotherhood"]..": "..BF["Revered"].."/"..BF["Exalted"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["Thorium2"] = {
		Title = BF["Thorium Brotherhood"]..": "..BF["Revered"].."/"..BF["Exalted"];
		Prev_Page = "Thorium1";
		Prev_Title = BF["Thorium Brotherhood"]..": "..BF["Friendly"].."/"..BF["Honored"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["Timbermaw"] = {
		Title = BF["Timbermaw Hold"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["Wintersaber1"] = {
		Title = BF["Wintersaber Trainers"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["Zandalar1"] = {
		Title = BF["Zandalar Tribe"]..": "..BF["Friendly"].."/"..BF["Honored"];
		Next_Page = "Zandalar2";
		Next_Title = BF["Zandalar Tribe"]..": "..BF["Revered"].."/"..BF["Exalted"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["Zandalar2"] = {
		Title = BF["Zandalar Tribe"]..": "..BF["Revered"].."/"..BF["Exalted"];
		Prev_Page = "Zandalar1";
		Prev_Title = BF["Zandalar Tribe"]..": "..BF["Friendly"].."/"..BF["Honored"];
		Back_Page = "REPMENU";
		Back_Title = AL["Factions"];;
	};
	["WSGRepFriendly"] = {
		Title = AL["Friendly Reputation Rewards"];
		Back_Page = "WSGRepMenu";
	};
	["WSGRepHonored1019"] = {
		Title = "10-19 "..AL["Honored Reputation Rewards"];
		Back_Page = "WSGRepMenu";
		Next_Page = "WSGRepHonored2029";
	};
	["WSGRepHonored2029"] = {
		Title = "20-29 "..AL["Honored Reputation Rewards"];
		Back_Page = "WSGRepMenu";
		Next_Page = "WSGRepHonored3039";
		Prev_Page = "WSGRepHonored1019";
	};
	["WSGRepHonored3039"] = {
		Title = "30-39 "..AL["Honored Reputation Rewards"];
		Back_Page = "WSGRepMenu";
		Next_Page = "WSGRepHonored4049";
		Prev_Page = "WSGRepHonored2029";
	};
	["WSGRepHonored4049"] = {
		Title = "40-49 "..AL["Honored Reputation Rewards"];
		Back_Page = "WSGRepMenu";
		Next_Page = "WSGRepHonored5059";
		Prev_Page = "WSGRepHonored3039";
	};
	["WSGRepHonored5059"] = {
		Title = "50-59 "..AL["Honored Reputation Rewards"];
		Back_Page = "WSGRepMenu";
		Prev_Page = "WSGRepHonored4049";
	};
	["WSGRepRevered1019"] = {
		Title = "10-19 "..AL["Revered Reputation Rewards"];
		Back_Page = "WSGRepMenu";
		Next_Page = "WSGRepRevered2029";
	};
	["WSGRepRevered2029"] = {
		Title = "20-29 "..AL["Revered Reputation Rewards"];
		Back_Page = "WSGRepMenu";
		Next_Page = "WSGRepRevered3039";
		Prev_Page = "WSGRepRevered1019";
	};
	["WSGRepRevered3039"] = {
		Title = "30-39 "..AL["Revered Reputation Rewards"];
		Back_Page = "WSGRepMenu";
		Next_Page = "WSGRepRevered4049";
		Prev_Page = "WSGRepRevered2029";
	};
	["WSGRepRevered4049"] = {
		Title = "40-49 "..AL["Revered Reputation Rewards"];
		Back_Page = "WSGRepMenu";
		Next_Page = "WSGRepRevered5059";
		Prev_Page = "WSGRepRevered3039";
	};
	["WSGRepRevered5059"] = {
		Title = "50-59 "..AL["Revered Reputation Rewards"];
		Back_Page = "WSGRepMenu";
		Prev_Page = "WSGRepRevered4049";
	};
	["WSGRepExalted4049"] = {
		Title = "40-49 "..AL["Exalted Reputation Rewards"];
		Back_Page = "WSGRepMenu";
		Next_Page = "WSGRepExalted5059";
	};
	["WSGRepExalted5059"] = {
		Title = "50-59 "..AL["Exalted Reputation Rewards"];
		Back_Page = "WSGRepMenu";
		Next_Page = "WSGRepExalted60";
		Prev_Page = "WSGRepExalted4049";
	};
	["WSGRepExalted60"] = {
		Title = "60 "..AL["Exalted Reputation Rewards"];
		Back_Page = "WSGRepMenu";
		Prev_Page = "WSGRepExalted5059";
	};
	["ABRepFriendly"] = {
		Title = AL["Friendly Reputation Rewards"];
		Back_Page = "ABRepMenu";
	};
	["ABRepHonored2029"] = {
		Title = "20-29 "..AL["Honored Reputation Rewards"];
		Back_Page = "ABRepMenu";
		Next_Page = "ABRepHonored3039";
	};
	["ABRepHonored3039"] = {
		Title = "30-39 "..AL["Honored Reputation Rewards"];
		Back_Page = "ABRepMenu";
		Next_Page = "ABRepHonored4049";
		Prev_Page = "ABRepHonored2029";
	};
	["ABRepHonored4049"] = {
		Title = "40-49 "..AL["Honored Reputation Rewards"];
		Back_Page = "ABRepMenu";
		Next_Page = "ABRepHonored5059";
		Prev_Page = "ABRepHonored3039";
	};
	["ABRepHonored5059"] = {
		Title = "50-59 "..AL["Honored Reputation Rewards"];
		Back_Page = "ABRepMenu";
		Prev_Page = "ABRepHonored4049";
	};
	["ABRepRevered2029"] = {
		Title = "20-29 "..AL["Revered Reputation Rewards"];
		Back_Page = "ABRepMenu";
		Next_Page = "ABRepRevered3039";
	};
	["ABRepRevered3039"] = {
		Title = "30-39 "..AL["Revered Reputation Rewards"];
		Back_Page = "ABRepMenu";
		Next_Page = "ABRepRevered4049";
		Prev_Page = "ABRepRevered2029";
	};
	["ABRepRevered4049"] = {
		Title = "40-49 "..AL["Revered Reputation Rewards"];
		Back_Page = "ABRepMenu";
		Next_Page = "ABRepRevered5059";
		Prev_Page = "ABRepRevered3039";
	};
	["ABRepRevered5059"] = {
		Title = "50-59 "..AL["Revered Reputation Rewards"];
		Back_Page = "ABRepMenu";
		Prev_Page = "ABRepRevered4049";
	};
	["ABRepExalted"] = {
		Title = AL["Exalted Reputation Rewards"];
		Back_Page = "ABRepMenu";
	};
	["AVRepFriendly"] = {
		Title = AL["Friendly Reputation Rewards"];
		Back_Page = "AVRepMenu";
		Next_Page = "AVRepHonored";
	};
	["AVRepHonored"] = {
		Title = AL["Honored Reputation Rewards"];
		Back_Page = "AVRepMenu";
		Next_Page = "AVRepRevered";
		Prev_Page = "AVRepFriendly";
	};
	["AVRepRevered"] = {
		Title = AL["Revered Reputation Rewards"];
		Back_Page = "AVRepMenu";
		Next_Page = "AVRepExalted";
		Prev_Page = "AVRepHonored";
	};
	["AVRepExalted"] = {
		Title = AL["Exalted Reputation Rewards"];
		Back_Page = "AVRepMenu";
		Prev_Page = "AVRepRevered";
	};
	["PvP60Accessories1"] = {
		Title = AL["PvP Trinkets"];
		Next_Page = "PvP60Accessories2";
		Next_Title = AtlasLoot_TableNames["PvP60Accessories2"][1];
		Back_Page = "PVPMENU";
		Back_Title = AL["PvP Rewards"];
	};
	["PvP60Accessories2"] = {
		Title = AtlasLoot_TableNames["PvP60Accessories2"][1];
		Next_Page = "PvP60Accessories3";
		Next_Title = AtlasLoot_TableNames["PvP60Accessories3"][1];
		Prev_Page = "PvP60Accessories1";
		Prev_Title = AL["PvP Accessories"]..": "..AL["Level 60"];
		Back_Page = "PVPMENU";
		Back_Title = AL["PvP Rewards"];
	};
	["PvP60Accessories3"] = {
		Title = AtlasLoot_TableNames["PvP60Accessories3"][1];
		Prev_Page = "PvP60Accessories2";
		Prev_Title = AtlasLoot_TableNames["PvP60Accessories2"][1];
		Back_Page = "PVPMENU";
		Back_Title = AL["PvP Rewards"];
	};
	["PVPWeapons1"] = {
		Title = AL["Rank 14 Weapons"];
		Next_Page = "PVPWeapons2";
		Next_Title = AL["Rank 14 Weapons"];
		Back_Page = "PVPMENU";
		Back_Title = AL["PvP Rewards"];
	};
	["PVPWeapons2"] = {
		Title = AL["Rank 14 Weapons"];
		Prev_Page = "PVPWeapons1";
		Prev_Title = AL["Rank 14 Weapons"];
		Back_Page = "PVPMENU";
		Back_Title = AL["PvP Rewards"];
	};
	["PVPDruid"] = {
		Title = BC["Druid"];
		Back_Page = "PVPSET";
		Back_Title = AL["PvP Armor Sets"];
	};
	["PVPHunter"] = {
		Title = BC["Hunter"];
		Back_Page = "PVPSET";
		Back_Title = AL["PvP Armor Sets"];
	};
	["PVPMage"] = {
		Title = BC["Mage"];
		Back_Page = "PVPSET";
		Back_Title = AL["PvP Armor Sets"];
	};
	["PVPPaladin"] = {
		Title = BC["Paladin"];
		Back_Page = "PVPSET";
		Back_Title = AL["PvP Armor Sets"];
	};
	["PVPPriest"] = {
		Title = BC["Priest"];
		Back_Page = "PVPSET";
		Back_Title = AL["PvP Armor Sets"];
	};
	["PVPRogue"] = {
		Title = BC["Rogue"];
		Back_Page = "PVPSET";
		Back_Title = AL["PvP Armor Sets"];
	};
	["PVPShaman"] = {
		Title = BC["Shaman"];
		Back_Page = "PVPSET";
		Back_Title = AL["PvP Armor Sets"];
	};
	["PVPWarlock"] = {
		Title = BC["Warlock"];
		Back_Page = "PVPSET";
		Back_Title = AL["PvP Armor Sets"];
	};
	["PVPWarrior"] = {
		Title = BC["Warrior"];
		Back_Page = "PVPSET";
		Back_Title = AL["PvP Armor Sets"];
	};
	["T0Druid"] = {
		Title = BC["Druid"];
		Back_Page = "T0SET";
		Back_Title = AL["Tier 0/0.5 Sets"];
	};
	["T0Hunter"] = {
		Title = BC["Hunter"];
		Back_Page = "T0SET";
		Back_Title = AL["Tier 0/0.5 Sets"];
	};
	["T0Mage"] = {
		Title = BC["Mage"];
		Back_Page = "T0SET";
		Back_Title = AL["Tier 0/0.5 Sets"];
	};
	["T0Paladin"] = {
		Title = BC["Paladin"];
		Back_Page = "T0SET";
		Back_Title = AL["Tier 0/0.5 Sets"];
	};
	["T0Priest"] = {
		Title = BC["Priest"];
		Back_Page = "T0SET";
		Back_Title = AL["Tier 0/0.5 Sets"];
	};
	["T0Rogue"] = {
		Title = BC["Rogue"];
		Back_Page = "T0SET";
		Back_Title = AL["Tier 0/0.5 Sets"];
	};
	["T0Shaman"] = {
		Title = BC["Shaman"];
		Back_Page = "T0SET";
		Back_Title = AL["Tier 0/0.5 Sets"];
	};
	["T0Warlock"] = {
		Title = BC["Warlock"];
		Back_Page = "T0SET";
		Back_Title = AL["Tier 0/0.5 Sets"];
	};
	["T0Warrior"] = {
		Title = BC["Warrior"];
		Back_Page = "T0SET";
		Back_Title = AL["Tier 0/0.5 Sets"];
	};
	["T1Druid"] = {
		Title = BC["Druid"];
		Back_Page = "T1SET";
		Back_Title = AL["Tier 1 Sets"];
	};
	["T1Hunter"] = {
		Title = BC["Hunter"];
		Back_Page = "T1SET";
		Back_Title = AL["Tier 1 Sets"];
	};
	["T1Mage"] = {
		Title = BC["Mage"];
		Back_Page = "T1SET";
		Back_Title = AL["Tier 1 Sets"];
	};
	["T1Paladin"] = {
		Title = BC["Paladin"];
		Back_Page = "T1SET";
		Back_Title = AL["Tier 1 Sets"];
	};
	["T1Priest"] = {
		Title = BC["Priest"];
		Back_Page = "T1SET";
		Back_Title = AL["Tier 1 Sets"];
	};
	["T1Rogue"] = {
		Title = BC["Rogue"];
		Back_Page = "T1SET";
		Back_Title = AL["Tier 1 Sets"];
	};
	["T1Shaman"] = {
		Title = BC["Shaman"];
		Back_Page = "T1SET";
		Back_Title = AL["Tier 1 Sets"];
	};
	["T1Warlock"] = {
		Title = BC["Warlock"];
		Back_Page = "T1SET";
		Back_Title = AL["Tier 1 Sets"];
	};
	["T1Warrior"] = {
		Title = BC["Warrior"];
		Back_Page = "T1SET";
		Back_Title = AL["Tier 1 Sets"];
	};
	["T2Druid"] = {
		Title = BC["Druid"];
		Back_Page = "T2SET";
		Back_Title = AL["Tier 2 Sets"];
	};
	["T2Hunter"] = {
		Title = BC["Hunter"];
		Back_Page = "T2SET";
		Back_Title = AL["Tier 2 Sets"];
	};
	["T2Mage"] = {
		Title = BC["Mage"];
		Back_Page = "T2SET";
		Back_Title = AL["Tier 2 Sets"];
	};
	["T2Paladin"] = {
		Title = BC["Paladin"];
		Back_Page = "T2SET";
		Back_Title = AL["Tier 2 Sets"];
	};
	["T2Priest"] = {
		Title = BC["Priest"];
		Back_Page = "T2SET";
		Back_Title = AL["Tier 2 Sets"];
	};
	["T2Rogue"] = {
		Title = BC["Rogue"];
		Back_Page = "T2SET";
		Back_Title = AL["Tier 2 Sets"];
	};
	["T2Shaman"] = {
		Title = BC["Shaman"];
		Back_Page = "T2SET";
		Back_Title = AL["Tier 2 Sets"];
	};
	["T2Warlock"] = {
		Title = BC["Warlock"];
		Back_Page = "T2SET";
		Back_Title = AL["Tier 2 Sets"];
	};
	["T2Warrior"] = {
		Title = BC["Warrior"];
		Back_Page = "T2SET";
		Back_Title = AL["Tier 2 Sets"];
	};
	["T3Druid"] = {
		Title = BC["Druid"];
		Back_Page = "T3SET";
		Back_Title = AL["Tier 3 Sets"];
	};
	["T3Hunter"] = {
		Title = BC["Hunter"];
		Back_Page = "T3SET";
		Back_Title = AL["Tier 3 Sets"];
	};
	["T3Mage"] = {
		Title = BC["Mage"];
		Back_Page = "T3SET";
		Back_Title = AL["Tier 3 Sets"];
	};
	["T3Paladin"] = {
		Title = BC["Paladin"];
		Back_Page = "T3SET";
		Back_Title = AL["Tier 3 Sets"];
	};
	["T3Priest"] = {
		Title = BC["Priest"];
		Back_Page = "T3SET";
		Back_Title = AL["Tier 3 Sets"];
	};
	["T3Rogue"] = {
		Title = BC["Rogue"];
		Back_Page = "T3SET";
		Back_Title = AL["Tier 3 Sets"];
	};
	["T3Shaman"] = {
		Title = BC["Shaman"];
		Back_Page = "T3SET";
		Back_Title = AL["Tier 3 Sets"];
	};
	["T3Warlock"] = {
		Title = BC["Warlock"];
		Back_Page = "T3SET";
		Back_Title = AL["Tier 3 Sets"];
	};
	["T3Warrior"] = {
		Title = BC["Warrior"];
		Back_Page = "T3SET";
		Back_Title = AL["Tier 3 Sets"];
	};
	["AQ40Druid"] = {
		Title = BC["Druid"];
		Back_Page = "AQ40SET";
		Back_Title = AL["Temple of Ahn'Qiraj Sets"];
	};
	["AQ40Hunter"] = {
		Title = BC["Hunter"];
		Back_Page = "AQ40SET";
		Back_Title = AL["Temple of Ahn'Qiraj Sets"];
	};
	["AQ40Mage"] = {
		Title = BC["Mage"];
		Back_Page = "AQ40SET";
		Back_Title = AL["Temple of Ahn'Qiraj Sets"];
	};
	["AQ40Paladin"] = {
		Title = BC["Paladin"];
		Back_Page = "AQ40SET";
		Back_Title = AL["Temple of Ahn'Qiraj Sets"];
	};
	["AQ40Priest"] = {
		Title = BC["Priest"];
		Back_Page = "AQ40SET";
		Back_Title = AL["Temple of Ahn'Qiraj Sets"];
	};
	["AQ40Rogue"] = {
		Title = BC["Rogue"];
		Back_Page = "AQ40SET";
		Back_Title = AL["Temple of Ahn'Qiraj Sets"];
	};
	["AQ40Shaman"] = {
		Title = BC["Shaman"];
		Back_Page = "AQ40SET";
		Back_Title = AL["Temple of Ahn'Qiraj Sets"];
	};
	["AQ40Warlock"] = {
		Title = BC["Warlock"];
		Back_Page = "AQ40SET";
		Back_Title = AL["Temple of Ahn'Qiraj Sets"];
	};
	["AQ40Warrior"] = {
		Title = BC["Warrior"];
		Back_Page = "AQ40SET";
		Back_Title = AL["Temple of Ahn'Qiraj Sets"];
	};
	["AQ20Druid"] = {
		Title = BC["Druid"];
		Back_Page = "AQ20SET";
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"];
	};
	["AQ20Hunter"] = {
		Title = BC["Hunter"];
		Back_Page = "AQ20SET";
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"];
	};
	["AQ20Mage"] = {
		Title = BC["Mage"];
		Back_Page = "AQ20SET";
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"];
	};
	["AQ20Paladin"] = {
		Title = BC["Paladin"];
		Back_Page = "AQ20SET";
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"];
	};
	["AQ20Priest"] = {
		Title = BC["Priest"];
		Back_Page = "AQ20SET";
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"];
	};
	["AQ20Rogue"] = {
		Title = BC["Rogue"];
		Back_Page = "AQ20SET";
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"];
	};
	["AQ20Shaman"] = {
		Title = BC["Shaman"];
		Back_Page = "AQ20SET";
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"];
	};
	["AQ20Warlock"] = {
		Title = BC["Warlock"];
		Back_Page = "AQ20SET";
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"];
	};
	["AQ20Warrior"] = {
		Title = BC["Warrior"];
		Back_Page = "AQ20SET";
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"];
	};
	["ZGDruid"] = {
		Title = BC["Druid"];
		Back_Page = "ZGSET";
		Back_Title = AL["Zul'Gurub Sets"];
	};
	["ZGHunter"] = {
		Title = BC["Hunter"];
		Back_Page = "ZGSET";
		Back_Title = AL["Zul'Gurub Sets"];
	};
	["ZGMage"] = {
		Title = BC["Mage"];
		Back_Page = "ZGSET";
		Back_Title = AL["Zul'Gurub Sets"];
	};
	["ZGPaladin"] = {
		Title = BC["Paladin"];
		Back_Page = "ZGSET";
		Back_Title = AL["Zul'Gurub Sets"];
	};
	["ZGPriest"] = {
		Title = BC["Priest"];
		Back_Page = "ZGSET";
		Back_Title = AL["Zul'Gurub Sets"];
	};
	["ZGRogue"] = {
		Title = BC["Rogue"];
		Back_Page = "ZGSET";
		Back_Title = AL["Zul'Gurub Sets"];
	};
	["ZGShaman"] = {
		Title = BC["Shaman"];
		Back_Page = "ZGSET";
		Back_Title = AL["Zul'Gurub Sets"];
	};
	["ZGWarlock"] = {
		Title = BC["Warlock"];
		Back_Page = "ZGSET";
		Back_Title = AL["Zul'Gurub Sets"];
	};
	["ZGWarrior"] = {
		Title = BC["Warrior"];
		Back_Page = "ZGSET";
		Back_Title = AL["Zul'Gurub Sets"];
	};
	["DEADMINES"] = {
		Title = BIS["Defias Leather"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["WAILING"] = {
		Title = BIS["Embrace of the Viper"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["SCARLET"] = {
		Title = BIS["Chain of the Scarlet Crusade"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["BLACKROCKD"] = {
		Title = BIS["The Gladiator"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["IRONWEAVE"] = {
		Title = BIS["Ironweave Battlesuit"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["ScholoCloth"] = {
		Title = BZ["Scholomance"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["ScholoLeather"] = {
		Title = BZ["Scholomance"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["ScholoMail"] = {
		Title = BZ["Scholomance"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["ScholoPlate"] = {
		Title = BZ["Scholomance"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["STRAT"] = {
		Title = BIS["The Postmaster"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["ScourgeInvasion"] = {
		Title = AL["Scourge Invasion"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["ShardOfGods"] = {
		Title = BIS["Shard of the Gods"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["ZGRings"] = {
		Title = BZ["Zul'Gurub"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["HakkariBlades"] = {
		Title = BZ["Zul'Gurub"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["PrimalBlessing"] = {
		Title = BZ["Zul'Gurub"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["SpiritofEskhandar"] = {
		Title = BIS["Spirit of Eskhandar"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["DalRend"] = {
		Title = BIS["Dal'Rend's Arms"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["SpiderKiss"] = {
		Title = BIS["Spider's Kiss"];
		Back_Page = "PRE60SET";
		Back_Title = AL["Pre 60 Sets"];
	};
	["ImperialPlate"] = {
		Title = BIS["Imperial Plate"];
		Back_Page = "CRAFTSET";
		Back_Title = AL["Crafted Sets"];
	};
	["TheDarksoul"] = {
		Title = BIS["The Darksoul"];
		Back_Page = "CRAFTSET";
		Back_Title = AL["Crafted Sets"];
	};
	["BloodsoulEmbrace"] = {
		Title = BIS["Bloodsoul Embrace"];
		Back_Page = "CRAFTSET";
		Back_Title = AL["Crafted Sets"];
	};
	["BloodvineG"] = {
		Title = BIS["Bloodvine Garb"];
		Back_Page = "CRAFTSET";
		Back_Title = AL["Crafted Sets"];
	};
	["VolcanicArmor"] = {
		Title = BIS["Volcanic Armor"];
		Back_Page = "CRAFTSET";
		Back_Title = AL["Crafted Sets"];
	};
	["IronfeatherArmor"] = {
		Title = BIS["Ironfeather Armor"];
		Back_Page = "CRAFTSET";
		Back_Title = AL["Crafted Sets"];
	};
	["StormshroudArmor"] = {
		Title = BIS["Stormshroud Armor"];
		Back_Page = "CRAFTSET";
		Back_Title = AL["Crafted Sets"];
	};
	["DevilsaurArmor"] = {
		Title = BIS["Devilsaur Armor"];
		Back_Page = "CRAFTSET";
		Back_Title = AL["Crafted Sets"];
	};
	["BloodTigerH"] = {
		Title = BIS["Blood Tiger Harness"];
		Back_Page = "CRAFTSET";
		Back_Title = AL["Crafted Sets"];
	};
	["PrimalBatskin"] = {
		Title = BIS["Primal Batskin"];
		Back_Page = "CRAFTSET";
		Back_Title = AL["Crafted Sets"];
	};
	["GreenDragonM"] = {
		Title = BIS["Green Dragon Mail"];
		Back_Page = "CRAFTSET";
		Back_Title = AL["Crafted Sets"];
	};
	["BlueDragonM"] = {
		Title = BIS["Blue Dragon Mail"];
		Back_Page = "CRAFTSET";
		Back_Title = AL["Crafted Sets"];
	};
	["BlackDragonM"] = {
		Title = BIS["Black Dragon Mail"];
		Back_Page = "CRAFTSET";
		Back_Title = AL["Crafted Sets"];
	};
	["CraftedWeapons1"] = {
		Title = AL["Crafted Epic Weapons"];
		Back_Page = "CRAFTINGMENU";
		Back_Title = AL["Collections"];
	};
	["Tabards"] = {
		Title = AL["Tabards"];
		Back_Page = "SETMENU";
		Back_Title = AL["Collections"];
	};
	["Legendaries"] = {
		Title = AL["Legendary Items"];
		Back_Page = "SETMENU";
		Back_Title = AL["Collections"];
	};
	["Artifacts"] = {
		Title = AL["Artifact Items"];
		Back_Page = "SETMENU";
		Back_Title = AL["Collections"];
	};
	["PvPMountsPvP"] = {
		Title = AL["PvP Mounts"];
		Back_Page = "PVPMENU";
		Back_Title = AL["PvP Rewards"];
	};
	["UnobMounts"] = {
		Title = AL["Unobtainable Mounts"];
		Back_Page = "SETMENU";
		Back_Title = AL["Collections"];
	};
	["OldMounts"] = {
		Title = AL["Old Mounts"];
		Back_Page = "SETMENU";
		Back_Title = AL["Collections"];
	};
	["RareMounts"] = {
		Title = AL["Rare Mounts"];
		Back_Page = "SETMENU";
		Back_Title = AL["Collections"];
	};
	["RarePets1"] = {
		Title = AL["Rare Pets"];
		Next_Page = "RarePets2";
		Next_Title = AL["Rare Pets"];
		Back_Page = "SETMENU";
		Back_Title = AL["Collections"];
	};
	["RarePets2"] = {
		Title = AL["Rare Pets"];
		Prev_Page = "RarePets1";
		Prev_Title = AL["Rare Pets"];
		Back_Page = "SETMENU";
		Back_Title = AL["Collections"];
	};
	["WorldEpics1"] = {
		Title = AtlasLoot_TableNames["WorldEpics1"][1];
		Next_Page = "WorldEpics2";
		Next_Title = AtlasLoot_TableNames["WorldEpics2"][1];
		Back_Page = "WORLDEPICS";
		Back_Title = AL["World Epics"];
	};
	["WorldEpics2"] = {
		Title = AtlasLoot_TableNames["WorldEpics2"][1];
		Next_Page = "WorldEpics3";
		Next_Title = AtlasLoot_TableNames["WorldEpics3"][1];
		Prev_Page = "WorldEpics1";
		Prev_Title = AtlasLoot_TableNames["WorldEpics1"][1];
		Back_Page = "WORLDEPICS";
		Back_Title = AL["World Epics"];
	};
	["WorldEpics3"] = {
		Title = AtlasLoot_TableNames["WorldEpics3"][1];
		Prev_Page = "WorldEpics2";
		Prev_Title = AtlasLoot_TableNames["WorldEpics2"][1];
		Back_Page = "WORLDEPICS";
		Back_Title = AL["World Epics"];
	};
	["ZGTrash1"] = {
		Title = AtlasLoot_TableNames["ZGTrash1"][1];
		Next_Page = "ZGTrash2";
		Next_Title = AtlasLoot_TableNames["ZGTrash2"][1];
	};
	["ZGTrash2"] = {
		Title = AtlasLoot_TableNames["ZGTrash2"][1];
		Prev_Page = "ZGTrash1";
		Prev_Title = AtlasLoot_TableNames["ZGTrash1"][1];
	};
	["AQ40Trash1"] = {
		Title = AtlasLoot_TableNames["AQ40Trash1"][1];
		Next_Page = "AQ40Trash2";
		Next_Title = AtlasLoot_TableNames["AQ40Trash2"][1];
	};
	["AQ40Trash2"] = {
		Title = AtlasLoot_TableNames["AQ40Trash2"][1];
		Prev_Page = "AQ40Trash1";
		Prev_Title = AtlasLoot_TableNames["AQ40Trash1"][1];
	};
	["ChildrensWeek"] = {
		Title = AL["Children's Week"];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["Winterviel1"] = {
		Title = AL["Feast of Winter Veil"];
		Next_Page = "Winterviel2";
		Next_Title = AtlasLoot_TableNames["Winterviel2"][1];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["Winterviel2"] = {
		Title = AtlasLoot_TableNames["Winterviel2"][1];
		Prev_Page = "Winterviel1";
		Prev_Title = AL["Feast of Winter Veil"];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["Halloween1"] = {
		Title = AL["Hallow's End"];
		Next_Page = "Halloween2";
		Next_Title = AL["Hallow's End"];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["Halloween2"] = {
		Title = AL["Hallow's End"];
		Prev_Page = "Halloween1";
		Prev_Title = AL["Hallow's End"];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["HarvestFestival"] = {
		Title = AL["Harvest Festival"];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["Valentineday"] = {
		Title = AL["Love is in the Air"];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["LunarFestival1"] = {
		Title = AL["Lunar Festival"];
		Next_Page = "LunarFestival2";
		Next_Title = AL["Lunar Festival"];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["LunarFestival2"] = {
		Title = AL["Lunar Festival"];
		Prev_Page = "LunarFestival1";
		Prev_Title = AL["Lunar Festival"];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["MidsummerFestival"] = {
		Title = AL["Midsummer Fire Festival"];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["Noblegarden"] = {
		Title = AL["Noblegarden"];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["ElementalInvasion"] = {
		Title = AL["Elemental Invasion"];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["GurubashiArena"] = {
		Title = AL["Gurubashi Arena Booty Run"];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["ScourgeInvasionEvent1"] = {
		Title = AL["Scourge Invasion"];
		Next_Page = "ScourgeInvasionEvent2";
		Next_Title = AtlasLoot_TableNames["ScourgeInvasionEvent2"][1];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["ScourgeInvasionEvent2"] = {
		Title = AtlasLoot_TableNames["ScourgeInvasionEvent2"][1];
		Prev_Page = "ScourgeInvasionEvent1";
		Prev_Title = AL["Scourge Invasion"];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["FishingExtravaganza"] = {
		Title = AL["Stranglethorn Fishing Extravaganza"];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	};
	["AbyssalTemplars"] = {
		Title = AL["Abyssal Council"].." - "..AL["Templars"];
		Back_Page = "AbyssalCouncil";
		Back_Title = AL["Abyssal Council"];
	};
	["AbyssalDukes"] = {
		Title = AL["Abyssal Council"].." - "..AL["Dukes"];
		Back_Page = "AbyssalCouncil";
		Back_Title = AL["Abyssal Council"];
	};
	["AbyssalLords"] = {
		Title = AL["Abyssal Council"].." - "..AL["High Council"];
		Back_Page = "AbyssalCouncil";
		Back_Title = AL["Abyssal Council"];
	};
	["AlchemyApprentice1"] = {
		Title = BS["Alchemy"]..": "..AL["Apprentice"];
		Back_Page = "ALCHEMYMENU";
		Back_Title = BS["Alchemy"];
		Next_Page = "AlchemyJourneyman1";
		Next_Title = BS["Alchemy"]..": "..AL["Journeyman"];
	};
	["AlchemyJourneyman1"] = {
		Title = BS["Alchemy"]..": "..AL["Journeyman"];
		Back_Page = "ALCHEMYMENU";
		Back_Title = BS["Alchemy"];
		Next_Page = "AlchemyExpert1";
		Next_Title = BS["Alchemy"]..": "..AL["Expert"];
		Prev_Page = "AlchemyApprentice1";
		Prev_Title = BS["Alchemy"]..": "..AL["Apprentice"];
	};
	["AlchemyExpert1"] = {
		Title = BS["Alchemy"]..": "..AL["Expert"];
		Back_Page = "ALCHEMYMENU";
		Back_Title = BS["Alchemy"];
		Next_Page = "AlchemyArtisan1";
		Next_Title = BS["Alchemy"]..": "..AL["Artisan"];
		Prev_Page = "AlchemyJourneyman1";
		Prev_Title = BS["Alchemy"]..": "..AL["Journeyman"];
	};
	["AlchemyArtisan1"] = {
		Title = BS["Alchemy"]..": "..AL["Artisan"];
		Back_Page = "ALCHEMYMENU";
		Back_Title = BS["Alchemy"];
		Next_Page = "AlchemyArtisan2";
		Next_Title = BS["Alchemy"]..": "..AL["Artisan"];
		Prev_Page = "AlchemyExpert1";
		Prev_Title = BS["Alchemy"]..": "..AL["Expert"];
	};
	["AlchemyArtisan2"] = {
		Title = BS["Alchemy"]..": "..AL["Artisan"];
		Back_Page = "ALCHEMYMENU";
		Back_Title = BS["Alchemy"];
		Prev_Page = "AlchemyArtisan1";
		Prev_Title = BS["Alchemy"]..": "..AL["Artisan"];
	};
	["SmithingApprentice1"] = {
		Title = BS["Blacksmithing"]..": "..AL["Apprentice"];
		Back_Page = "SMITHINGMENU";
		Back_Title = BS["Blacksmithing"];
		Next_Page = "SmithingJourneyman1";
		Next_Title = BS["Blacksmithing"]..": "..AL["Journeyman"];
	};
	["SmithingJourneyman1"] = {
		Title = BS["Blacksmithing"]..": "..AL["Journeyman"];
		Back_Page = "SMITHINGMENU";
		Back_Title = BS["Blacksmithing"];
		Prev_Page = "SmithingApprentice1";
		Prev_Title = BS["Blacksmithing"]..": "..AL["Apprentice"];
		Next_Page = "SmithingJourneyman2";
		Next_Title = BS["Blacksmithing"]..": "..AL["Journeyman"];
	};
	["SmithingJourneyman2"] = {
		Title = BS["Blacksmithing"]..": "..AL["Journeyman"];
		Back_Page = "SMITHINGMENU";
		Back_Title = BS["Blacksmithing"];
		Prev_Page = "SmithingJourneyman1";
		Prev_Title = BS["Blacksmithing"]..": "..AL["Journeyman"];
		Next_Page = "SmithingExpert1";
		Next_Title = BS["Blacksmithing"]..": "..AL["Expert"];
	};
	["SmithingExpert1"] = {
		Title = BS["Blacksmithing"]..": "..AL["Expert"];
		Back_Page = "SMITHINGMENU";
		Back_Title = BS["Blacksmithing"];
		Prev_Page = "SmithingJourneyman2";
		Prev_Title = BS["Blacksmithing"]..": "..AL["Journeyman"];
		Next_Page = "SmithingExpert2";
		Next_Title = BS["Blacksmithing"]..": "..AL["Expert"];
	};
	["SmithingExpert2"] = {
		Title = BS["Blacksmithing"]..": "..AL["Expert"];
		Back_Page = "SMITHINGMENU";
		Back_Title = BS["Blacksmithing"];
		Prev_Page = "SmithingExpert1";
		Prev_Title = BS["Blacksmithing"]..": "..AL["Expert"];
		Next_Page = "SmithingArtisan1";
		Next_Title = BS["Blacksmithing"]..": "..AL["Artisan"];
	};
	["SmithingArtisan1"] = {
		Title = BS["Blacksmithing"]..": "..AL["Artisan"];
		Back_Page = "SMITHINGMENU";
		Back_Title = BS["Blacksmithing"];
		Prev_Page = "SmithingExpert2";
		Prev_Title = BS["Blacksmithing"]..": "..AL["Expert"];
		Next_Page = "SmithingArtisan2";
		Next_Title = BS["Blacksmithing"]..": "..AL["Artisan"];
	};
	["SmithingArtisan2"] = {
		Title = BS["Blacksmithing"]..": "..AL["Artisan"];
		Back_Page = "SMITHINGMENU";
		Back_Title = BS["Blacksmithing"];
		Prev_Page = "SmithingArtisan1";
		Prev_Title = BS["Blacksmithing"]..": "..AL["Artisan"];
		Next_Page = "SmithingArtisan3";
		Next_Title = BS["Blacksmithing"];
	};
	["SmithingArtisan3"] = {
		Title = BS["Blacksmithing"]..": "..AL["Artisan"];
		Back_Page = "SMITHINGMENU";
		Back_Title = BS["Blacksmithing"];
		Prev_Page = "SmithingArtisan2";
		Prev_Title = BS["Blacksmithing"]..": "..AL["Artisan"];
		Next_Page = "Armorsmith1";
		Next_Title = BS["Armorsmith"];
	};
	["Armorsmith1"] = {
		Title = BS["Armorsmith"];
		Back_Page = "SMITHINGMENU";
		Back_Title = BS["Blacksmithing"];
		Prev_Page = "SmithingArtisan3";
		Prev_Title = BS["Blacksmithing"]..": "..AL["Artisan"];
		Next_Page = "Weaponsmith1";
		Next_Title = BS["Weaponsmith"];
	};
	["Weaponsmith1"] = {
		Title = BS["Weaponsmith"];
		Back_Page = "SMITHINGMENU";
		Back_Title = BS["Blacksmithing"];
		Prev_Page = "Armorsmith1";
		Prev_Title = BS["Armorsmith"];
		Next_Page = "Axesmith1";
		Next_Title = AL["Master Axesmith"];
	};
	["Axesmith1"] = {
		Title = AL["Master Axesmith"];
		Back_Page = "SMITHINGMENU";
		Back_Title = BS["Blacksmithing"];
		Prev_Page = "Weaponsmith1";
		Prev_Title = BS["Weaponsmith"];
		Next_Page = "Hammersmith1";
		Next_Title = AL["Master Hammersmith"];
	};
	["Hammersmith1"] = {
		Title = AL["Master Hammersmith"];
		Back_Page = "SMITHINGMENU";
		Back_Title = BS["Blacksmithing"];
		Prev_Page = "Axesmith1";
		Prev_Title = AL["Master Axesmith"];
		Next_Page = "Swordsmith1";
		Next_Title = AL["Master Swordsmith"];
	};
	["Swordsmith1"] = {
		Title = AL["Master Swordsmith"];
		Back_Page = "SMITHINGMENU";
		Back_Title = BS["Blacksmithing"];
		Prev_Page = "Hammersmith1";
		Prev_Title = AL["Master Hammersmith"];
	};
	["EnchantingApprentice1"] = {
		Title = BS["Enchanting"]..": "..AL["Apprentice"];
		Back_Page = "ENCHANTINGMENU";
		Back_Title = BS["Enchanting"];
		Next_Page = "EnchantingJourneyman1";
		Next_Title = BS["Enchanting"]..": "..AL["Journeyman"];
	};
	["EnchantingJourneyman1"] = {
		Title = BS["Enchanting"]..": "..AL["Journeyman"];
		Back_Page = "ENCHANTINGMENU";
		Back_Title = BS["Enchanting"];
		Prev_Page = "EnchantingApprentice1";
		Prev_Title = BS["Enchanting"]..": "..AL["Apprentice"];
		Next_Page = "EnchantingJourneyman2";
		Next_Title = BS["Enchanting"]..": "..AL["Journeyman"];
	};
	["EnchantingJourneyman2"] = {
		Title = BS["Enchanting"]..": "..AL["Journeyman"];
		Back_Page = "ENCHANTINGMENU";
		Back_Title = BS["Enchanting"];
		Prev_Page = "EnchantingJourneyman1";
		Prev_Title = BS["Enchanting"]..": "..AL["Journeyman"];
		Next_Page = "EnchantingExpert1";
		Next_Title = BS["Enchanting"]..": "..AL["Expert"];
	};
	["EnchantingExpert1"] = {
		Title = BS["Enchanting"]..": "..AL["Expert"];
		Back_Page = "ENCHANTINGMENU";
		Back_Title = BS["Enchanting"];
		Prev_Page = "EnchantingJourneyman2";
		Prev_Title = BS["Enchanting"]..": "..AL["Journeyman"];
		Next_Page = "EnchantingExpert2";
		Next_Title = BS["Enchanting"]..": "..AL["Expert"];
	};
	["EnchantingExpert2"] = {
		Title = BS["Enchanting"]..": "..AL["Expert"];
		Back_Page = "ENCHANTINGMENU";
		Back_Title = BS["Enchanting"];
		Prev_Page = "EnchantingExpert1";
		Prev_Title = BS["Enchanting"]..": "..AL["Expert"];
		Next_Page = "EnchantingArtisan1";
		Next_Title = BS["Enchanting"]..": "..AL["Artisan"];
	};
	["EnchantingArtisan1"] = {
		Title = BS["Enchanting"]..": "..AL["Artisan"];
		Back_Page = "ENCHANTINGMENU";
		Back_Title = BS["Enchanting"];
		Prev_Page = "EnchantingExpert2";
		Prev_Title = BS["Enchanting"]..": "..AL["Expert"];
		Next_Page = "EnchantingArtisan2";
		Next_Title = BS["Enchanting"]..": "..AL["Artisan"];
	};
	["EnchantingArtisan2"] = {
		Title = BS["Enchanting"]..": "..AL["Artisan"];
		Back_Page = "ENCHANTINGMENU";
		Back_Title = BS["Enchanting"];
		Prev_Page = "EnchantingArtisan1";
		Prev_Title = BS["Enchanting"]..": "..AL["Artisan"];
		Next_Page = "EnchantingArtisan3";
		Next_Title = BS["Enchanting"]..": "..AL["Artisan"];
	};
	["EnchantingArtisan3"] = {
		Title = BS["Enchanting"]..": "..AL["Artisan"];
		Back_Page = "ENCHANTINGMENU";
		Back_Title = BS["Enchanting"];
		Prev_Page = "EnchantingArtisan2";
		Prev_Title = BS["Enchanting"]..": "..AL["Artisan"];
	};
	["EngineeringApprentice1"] = {
		Title = BS["Engineering"]..": "..AL["Apprentice"];
		Back_Page = "ENGINEERINGMENU";
		Back_Title = BS["Engineering"];
		Next_Page = "EngineeringJourneyman1";
		Next_Title = BS["Engineering"]..": "..AL["Journeyman"];
	};
	["EngineeringJourneyman1"] = {
		Title = BS["Engineering"]..": "..AL["Journeyman"];
		Back_Page = "ENGINEERINGMENU";
		Back_Title = BS["Engineering"];
		Prev_Page = "EngineeringApprentice1";
		Prev_Title = BS["Engineering"]..": "..AL["Apprentice"];
		Next_Page = "EngineeringJourneyman2";
		Next_Title = BS["Engineering"]..": "..AL["Journeyman"];
	};
	["EngineeringJourneyman2"] = {
		Title = BS["Engineering"]..": "..AL["Journeyman"];
		Back_Page = "ENGINEERINGMENU";
		Back_Title = BS["Engineering"];
		Prev_Page = "EngineeringJourneyman1";
		Prev_Title = BS["Engineering"]..": "..AL["Journeyman"];
		Next_Page = "EngineeringExpert1";
		Next_Title = BS["Engineering"]..": "..AL["Expert"];
	};
	["EngineeringExpert1"] = {
		Title = BS["Engineering"]..": "..AL["Expert"];
		Back_Page = "ENGINEERINGMENU";
		Back_Title = BS["Engineering"];
		Prev_Page = "EngineeringJourneyman2";
		Prev_Title = BS["Engineering"]..": "..AL["Journeyman"];
		Next_Page = "EngineeringExpert2";
		Next_Title = BS["Engineering"]..": "..AL["Expert"];
	};
	["EngineeringExpert2"] = {
		Title = BS["Engineering"]..": "..AL["Expert"];
		Back_Page = "ENGINEERINGMENU";
		Back_Title = BS["Engineering"];
		Prev_Page = "EngineeringExpert1";
		Prev_Title = BS["Engineering"]..": "..AL["Expert"];
		Next_Page = "EngineeringArtisan1";
		Next_Title = BS["Engineering"]..": "..AL["Artisan"];
	};
	["EngineeringArtisan1"] = {
		Title = BS["Engineering"]..": "..AL["Artisan"];
		Back_Page = "ENGINEERINGMENU";
		Back_Title = BS["Engineering"];
		Prev_Page = "EngineeringExpert2";
		Prev_Title = BS["Engineering"]..": "..AL["Expert"];
		Next_Page = "EngineeringArtisan2";
		Next_Title = BS["Engineering"]..": "..AL["Artisan"];
	};
	["EngineeringArtisan2"] = {
		Title = BS["Engineering"]..": "..AL["Artisan"];
		Back_Page = "ENGINEERINGMENU";
		Back_Title = BS["Engineering"];
		Prev_Page = "EngineeringArtisan1";
		Prev_Title = BS["Engineering"]..": "..AL["Artisan"];
		Next_Page = "Gnomish1";
		Next_Title = AL["Gnomish Engineering"];
	};
	["Gnomish1"] = {
		Title = AL["Gnomish Engineering"];
		Back_Page = "ENGINEERINGMENU";
		Back_Title = BS["Engineering"];
		Prev_Page = "EngineeringArtisan2";
		Prev_Title = BS["Engineering"]..": "..AL["Artisan"];
		Next_Page = "Goblin1";
		Next_Title = AL["Goblin Engineering"];
	};
	["Goblin1"] = {
		Title = AL["Goblin Engineering"];
		Back_Page = "ENGINEERINGMENU";
		Back_Title = BS["Engineering"];
		Prev_Page = "Gnomish1";
		Prev_Title = AL["Gnomish Engineering"];
	};
	["LeatherApprentice1"] = {
		Title = BS["Leatherworking"]..": "..AL["Apprentice"];
		Back_Page = "LEATHERWORKINGMENU";
		Back_Title = BS["Leatherworking"];
		Next_Page = "LeatherJourneyman1";
		Next_Title = BS["Leatherworking"]..": "..AL["Journeyman"];
	};
	["LeatherJourneyman1"] = {
		Title = BS["Leatherworking"]..": "..AL["Journeyman"];
		Back_Page = "LEATHERWORKINGMENU";
		Back_Title = BS["Leatherworking"];
		Prev_Page = "LeatherApprentice1";
		Prev_Title = BS["Leatherworking"]..": "..AL["Apprentice"];
		Next_Page = "LeatherJourneyman2";
		Next_Title = BS["Leatherworking"]..": "..AL["Journeyman"];
	};
	["LeatherJourneyman2"] = {
		Title = BS["Leatherworking"]..": "..AL["Journeyman"];
		Back_Page = "LEATHERWORKINGMENU";
		Back_Title = BS["Leatherworking"];
		Prev_Page = "LeatherJourneyman1";
		Prev_Title = BS["Leatherworking"]..": "..AL["Journeyman"];
		Next_Page = "LeatherExpert1";
		Next_Title = BS["Leatherworking"]..": "..AL["Expert"];
	};
	["LeatherExpert1"] = {
		Title = BS["Leatherworking"]..": "..AL["Expert"];
		Back_Page = "LEATHERWORKINGMENU";
		Back_Title = BS["Leatherworking"];
		Prev_Page = "LeatherJourneyman2";
		Prev_Title = BS["Leatherworking"]..": "..AL["Journeyman"];
		Next_Page = "LeatherExpert2";
		Next_Title = BS["Leatherworking"]..": "..AL["Expert"];
	};
	["LeatherExpert2"] = {
		Title = BS["Leatherworking"]..": "..AL["Expert"];
		Back_Page = "LEATHERWORKINGMENU";
		Back_Title = BS["Leatherworking"];
		Prev_Page = "LeatherExpert1";
		Prev_Title = BS["Leatherworking"]..": "..AL["Expert"];
		Next_Page = "LeatherArtisan1";
		Next_Title = BS["Leatherworking"]..": "..AL["Artisan"];
	};
	["LeatherArtisan1"] = {
		Title = BS["Leatherworking"]..": "..AL["Artisan"];
		Back_Page = "LEATHERWORKINGMENU";
		Back_Title = BS["Leatherworking"];
		Prev_Page = "LeatherExpert2";
		Prev_Title = BS["Leatherworking"]..": "..AL["Expert"];
		Next_Page = "LeatherArtisan2";
		Next_Title = BS["Leatherworking"]..": "..AL["Artisan"];
	};
	["LeatherArtisan2"] = {
		Title = BS["Leatherworking"]..": "..AL["Artisan"];
		Back_Page = "LEATHERWORKINGMENU";
		Back_Title = BS["Leatherworking"];
		Prev_Page = "LeatherArtisan1";
		Prev_Title = BS["Leatherworking"]..": "..AL["Artisan"];
		Next_Page = "LeatherArtisan3";
		Next_Title = BS["Leatherworking"]..": "..AL["Artisan"];
	};
	["LeatherArtisan3"] = {
		Title = BS["Leatherworking"]..": "..AL["Artisan"];
		Back_Page = "LEATHERWORKINGMENU";
		Back_Title = BS["Leatherworking"];
		Prev_Page = "LeatherArtisan2";
		Prev_Title = BS["Leatherworking"]..": "..AL["Artisan"];
		Next_Page = "Dragonscale1";
		Next_Title = BS["Dragonscale Leatherworking"];
	};
	["Dragonscale1"] = {
		Title = BS["Dragonscale Leatherworking"];
		Back_Page = "LEATHERWORKINGMENU";
		Back_Title = BS["Leatherworking"];
		Prev_Page = "LeatherArtisan3";
		Prev_Title = BS["Leatherworking"]..": "..AL["Artisan"];
		Next_Page = "Elemental1";
		Next_Title = BS["Elemental Leatherworking"];
	};
	["Elemental1"] = {
		Title = BS["Elemental Leatherworking"];
		Back_Page = "LEATHERWORKINGMENU";
		Back_Title = BS["Leatherworking"];
		Prev_Page = "Dragonscale1";
		Prev_Title = BS["Dragonscale Leatherworking"];
		Next_Page = "Tribal1";
		Next_Title = BS["Tribal Leatherworking"];
	};
	["Tribal1"] = {
		Title = BS["Tribal Leatherworking"];
		Back_Page = "LEATHERWORKINGMENU";
		Back_Title = BS["Leatherworking"];
		Prev_Page = "Elemental1";
		Prev_Title = BS["Elemental Leatherworking"];
	};
	["Herbalism1"] = {
		Title = BS["Herbalism"];
		Back_Page = "CRAFTINGMENU";
		Back_Title = AL["Crafting"];
		Next_Page = "Herbalism2";
		Next_Title = BS["Herbalism"];
	};
	["Herbalism2"] = {
		Title = BS["Herbalism"];
		Back_Page = "CRAFTINGMENU";
		Back_Title = AL["Crafting"];
		Prev_Page = "Herbalism1";
		Prev_Title = BS["Herbalism"];
	};
	["Mining1"] = {
		Title = BS["Mining"];
		Back_Page = "MININGMENU";
		Back_Title = AL["Crafting"];
		Next_Page = "Mining2";
		Next_Title = BS["Mining"];
	};
	["Mining2"] = {
		Title = BS["Mining"];
		Back_Page = "MININGMENU";
		Back_Title = AL["Crafting"];
		Next_Page = "Smelting1";
		Next_Title = BS["Smelting"];
		Prev_Page = "Mining1";
		Prev_Title = BS["Mining"];
	};
	["Smelting1"] = {
		Title = BS["Smelting"];
		Back_Page = "MININGMENU";
		Back_Title = AL["Crafting"];
		Prev_Page = "Mining2";
		Prev_Title = BS["Mining"];
	};
	["TailoringApprentice1"] = {
		Title = BS["Tailoring"]..": "..AL["Apprentice"];
		Back_Page = "TAILORINGMENU";
		Back_Title = BS["Tailoring"];
		Next_Page = "TailoringJourneyman1";
		Next_Title = BS["Tailoring"]..": "..AL["Journeyman"];
	};
	["TailoringJourneyman1"] = {
		Title = BS["Tailoring"]..": "..AL["Journeyman"];
		Back_Page = "TAILORINGMENU";
		Back_Title = BS["Tailoring"];
		Prev_Page = "TailoringApprentice1";
		Prev_Title = BS["Tailoring"]..": "..AL["Apprentice"];
		Next_Page = "TailoringJourneyman2";
		Next_Title = BS["Tailoring"]..": "..AL["Journeyman"];
	};
	["TailoringJourneyman2"] = {
		Title = BS["Tailoring"]..": "..AL["Journeyman"];
		Back_Page = "TAILORINGMENU";
		Back_Title = BS["Tailoring"];
		Prev_Page = "TailoringJourneyman1";
		Prev_Title = BS["Tailoring"]..": "..AL["Journeyman"];
		Next_Page = "TailoringExpert1";
		Next_Title = BS["Tailoring"]..": "..AL["Expert"];
	};
	["TailoringExpert1"] = {
		Title = BS["Tailoring"]..": "..AL["Expert"];
		Back_Page = "TAILORINGMENU";
		Back_Title = BS["Tailoring"];
		Prev_Page = "TailoringJourneyman2";
		Prev_Title = BS["Tailoring"]..": "..AL["Journeyman"];
		Next_Page = "TailoringExpert2";
		Next_Title = BS["Tailoring"]..": "..AL["Expert"];
	};
	["TailoringExpert2"] = {
		Title = BS["Tailoring"]..": "..AL["Expert"];
		Back_Page = "TAILORINGMENU";
		Back_Title = BS["Tailoring"];
		Prev_Page = "TailoringExpert1";
		Prev_Title = BS["Tailoring"]..": "..AL["Expert"];
		Next_Page = "TailoringArtisan1";
		Next_Title = BS["Tailoring"]..": "..AL["Artisan"];
	};
	["TailoringArtisan1"] = {
		Title = BS["Tailoring"]..": "..AL["Artisan"];
		Back_Page = "TAILORINGMENU";
		Back_Title = BS["Tailoring"];
		Prev_Page = "TailoringExpert2";
		Prev_Title = BS["Tailoring"]..": "..AL["Expert"];
		Next_Page = "TailoringArtisan2";
		Next_Title = BS["Tailoring"]..": "..AL["Artisan"];
	};
	["TailoringArtisan2"] = {
		Title = BS["Tailoring"]..": "..AL["Artisan"];
		Back_Page = "TAILORINGMENU";
		Back_Title = BS["Tailoring"];
		Prev_Page = "TailoringArtisan1";
		Prev_Title = BS["Tailoring"]..": "..AL["Artisan"];
		Next_Page = "TailoringArtisan3";
		Next_Title = BS["Tailoring"]..": "..AL["Artisan"];
	};
	["TailoringArtisan3"] = {
		Title = BS["Tailoring"]..": "..AL["Artisan"];
		Back_Page = "TAILORINGMENU";
		Back_Title = BS["Tailoring"];
		Prev_Page = "TailoringArtisan2";
		Prev_Title = BS["Tailoring"]..": "..AL["Artisan"];
		Next_Page = "TailoringArtisan4";
		Next_Title = BS["Tailoring"]..": "..AL["Artisan"];
	};
	["TailoringArtisan4"] = {
		Title = BS["Tailoring"]..": "..AL["Artisan"];
		Back_Page = "TAILORINGMENU";
		Back_Title = BS["Tailoring"];
		Prev_Page = "TailoringArtisan3";
		Prev_Title = BS["Tailoring"]..": "..AL["Artisan"];
	};
	["CookingApprentice1"] = {
		Title = BS["Cooking"]..": "..AL["Apprentice"];
		Back_Page = "COOKINGMENU";
		Back_Title = BS["Cooking"];
		Next_Page = "CookingJourneyman1";
		Next_Title = BS["Cooking"]..": "..AL["Journeyman"];
	};
	["CookingJourneyman1"] = {
		Title = BS["Cooking"]..": "..AL["Journeyman"];
		Back_Page = "COOKINGMENU";
		Back_Title = BS["Cooking"];
		Prev_Page = "CookingApprentice1";
		Prev_Title = BS["Cooking"]..": "..AL["Apprentice"];
		Next_Page = "CookingExpert1";
		Next_Title = BS["Cooking"]..": "..AL["Journeyman"];
	};
	["CookingExpert1"] = {
		Title = BS["Cooking"]..": "..AL["Expert"];
		Back_Page = "COOKINGMENU";
		Back_Title = BS["Cooking"];
		Prev_Page = "CookingJourneyman1";
		Prev_Title = BS["Cooking"]..": "..AL["Journeyman"];
		Next_Page = "CookingArtisan1";
		Next_Title = BS["Cooking"]..": "..AL["Artisan"];
	};
	["CookingArtisan1"] = {
		Title = BS["Cooking"]..": "..AL["Artisan"];
		Back_Page = "COOKINGMENU";
		Back_Title = BS["Cooking"];
		Prev_Page = "CookingExpert1";
		Prev_Title = BS["Cooking"]..": "..AL["Expert"];
	};
	["FirstAid1"] = {
		Title = BS["First Aid"];
		Back_Page = "CRAFTINGMENU";
		Back_Title = AL["Crafting"];
	};
	["Poisons1"] = {
		Title = BS["Poisons"];
		Back_Page = "CRAFTINGMENU";
		Back_Title = AL["Crafting"];
	};
};