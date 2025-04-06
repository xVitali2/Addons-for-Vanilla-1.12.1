local _G = getfenv()
local L = AceLibrary("AceLocale-2.2"):new("AtlasLoot")
local BF = AceLibrary("Babble-Faction-2.2")
local BZ = AceLibrary("Babble-Zone-2.2")

function AtlasLootRepMenu()
	AtlasLoot_PrepMenu(nil, L["Factions"])
	AtlasLootCharDB.LastBoss = "REPMENU"
	AtlasLootCharDB.LastBossText = "Factions"
	--Argent Dawn
	AtlasLootMenuItem_1_Name:SetText(BF["Argent Dawn"])
	AtlasLootMenuItem_1_Extra:SetText("")
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Talisman_08")
	AtlasLootMenuItem_1.lootpage="Argent1"
	AtlasLootMenuItem_1:Show()
	--Bloodsail Pirates
	AtlasLootMenuItem_2_Name:SetText(BF["Bloodsail Buccaneers"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Helmet_66")
	AtlasLootMenuItem_2.lootpage="Bloodsail1"
	AtlasLootMenuItem_2:Show()
	--Brood of Nozdormu
	AtlasLootMenuItem_3_Name:SetText(BF["Brood of Nozdormu"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Ring_40")
	AtlasLootMenuItem_3.lootpage="AQBroodRings"
	AtlasLootMenuItem_3:Show()
	--Darkmoon Faire
	AtlasLootMenuItem_4_Name:SetText(BF["Darkmoon Faire"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Misc_Ticket_Tarot_Maelstrom_01")
	AtlasLootMenuItem_4.lootpage="Darkmoon"
	AtlasLootMenuItem_4:Show()
	--Hydraxian Waterlords
	AtlasLootMenuItem_5_Name:SetText(BF["Hydraxian Waterlords"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Frost_FrostArmor")
	AtlasLootMenuItem_5.lootpage="WaterLords1"
	AtlasLootMenuItem_5:Show()
	--Dalaran
	AtlasLootMenuItem_6_Name:SetText(BZ["Dalaran"])
	AtlasLootMenuItem_6_Extra:SetText("|cff2773ff"..BF["Alliance"])
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\INV_Staff_13")
	AtlasLootMenuItem_6.lootpage="Dalaran"
	AtlasLootMenuItem_6:Show()
	--Wildhammer Clan
	AtlasLootMenuItem_7_Name:SetText(BF["Wildhammer Clan"])
	AtlasLootMenuItem_7_Extra:SetText("|cff2773ff"..BF["Alliance"])
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_06")
	AtlasLootMenuItem_7.lootpage="Wildhammer"
	AtlasLootMenuItem_7:Show()
	--Stormwind
	AtlasLootMenuItem_8_Name:SetText(BF["Stormwind"])
	AtlasLootMenuItem_8_Extra:SetText("|cff2773ff"..BF["Alliance"])
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Staff_13")
	AtlasLootMenuItem_8.lootpage="Stormwind"
	AtlasLootMenuItem_8:Show()
	--Gnomeregan Exiles
	AtlasLootMenuItem_9_Name:SetText(BF["Gnomeregan Exiles"])
	AtlasLootMenuItem_9_Extra:SetText("|cff2773ff"..BF["Alliance"])
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\INV_Staff_13")
	AtlasLootMenuItem_9.lootpage="GnomereganExiles"
	AtlasLootMenuItem_9:Show()
	--Ironforge
	AtlasLootMenuItem_10_Name:SetText(BF["Ironforge"])
	AtlasLootMenuItem_10_Extra:SetText("|cff2773ff"..BF["Alliance"])
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\INV_Staff_13")
	AtlasLootMenuItem_10.lootpage="Ironforge"
	AtlasLootMenuItem_10:Show()
	--Stormpike Guard
	AtlasLootMenuItem_11_Name:SetText(BF["Stormpike Guard"])
	AtlasLootMenuItem_11_Extra:SetText("|cff2773ff"..BF["Alliance"])
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_StormPikeTrinket_01")
	AtlasLootMenuItem_11.lootpage="Stormpike1"
	AtlasLootMenuItem_11:Show()
	--Darnassus
	AtlasLootMenuItem_12_Name:SetText(BF["Darnassus"])
	AtlasLootMenuItem_12_Extra:SetText("|cff2773ff"..BF["Alliance"])
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\INV_Staff_13")
	AtlasLootMenuItem_12.lootpage="Darnassus"
	AtlasLootMenuItem_12:Show()
	--Silvermoon
	AtlasLootMenuItem_13_Name:SetText(BF["Silvermoon Remnant"])
	AtlasLootMenuItem_13_Extra:SetText("|cff2773ff"..BF["Alliance"])
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\INV_Staff_13")
	AtlasLootMenuItem_13.lootpage="Helf"
	AtlasLootMenuItem_13:Show()
	--The Wintersaber Trainers
	AtlasLootMenuItem_14_Name:SetText(BF["Wintersaber Trainers"])
	AtlasLootMenuItem_14_Extra:SetText("|cff2773ff"..BF["Alliance"])
	AtlasLootMenuItem_14_Icon:SetTexture("Interface\\Icons\\Ability_Mount_PinkTiger")
	AtlasLootMenuItem_14.lootpage="Wintersaber1"
	AtlasLootMenuItem_14:Show()
	--The League of Arathor
	AtlasLootMenuItem_15_Name:SetText(BF["The League of Arathor"])
	AtlasLootMenuItem_15_Extra:SetText("|cff2773ff"..BF["Alliance"])
	AtlasLootMenuItem_15_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_15.lootpage="LeagueofArathor"
	AtlasLootMenuItem_15:Show()
	--Timbermaw Hold
	AtlasLootMenuItem_16_Name:SetText(BF["Timbermaw Hold"])
	AtlasLootMenuItem_16_Extra:SetText("")
	AtlasLootMenuItem_16_Icon:SetTexture("Interface\\Icons\\INV_Misc_Horn_01")
	AtlasLootMenuItem_16.lootpage="Timbermaw"
	AtlasLootMenuItem_16:Show()
	--Zandalar Tribe
	AtlasLootMenuItem_17_Name:SetText(BF["Zandalar Tribe"])
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Misc_Coin_08")
	AtlasLootMenuItem_17.lootpage="Zandalar1"
	AtlasLootMenuItem_17:Show()
	--Cenarion Hold
	AtlasLootMenuItem_18_Name:SetText(BF["Cenarion Circle"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Chest_Plate07")
	AtlasLootMenuItem_18.lootpage="Cenarion1"
	AtlasLootMenuItem_18:Show()
	--Gelkis Clan Centaur
	AtlasLootMenuItem_19_Name:SetText(BF["Gelkis Clan Centaur"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\INV_Misc_Head_Centaur_01")
	AtlasLootMenuItem_19.lootpage="GelkisClan1"
	AtlasLootMenuItem_19:Show()
	--Magram Clan Centaur
	AtlasLootMenuItem_20_Name:SetText(BF["Magram Clan Centaur"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\INV_Misc_Head_Centaur_01")
	AtlasLootMenuItem_20.lootpage="MagramClan1"
	AtlasLootMenuItem_20:Show()
	--Thorium Brotherhood
	AtlasLootMenuItem_21_Name:SetText(BF["Thorium Brotherhood"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Ingot_Mithril")
	AtlasLootMenuItem_21.lootpage="Thorium1"
	AtlasLootMenuItem_21:Show()
	--Warderns
	AtlasLootMenuItem_22_Name:SetText(BF["Wardens of Time"])
	AtlasLootMenuItem_22_Extra:SetText("")
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\inv_weapon_hand_06")
	AtlasLootMenuItem_22.lootpage="Warderns1"
	AtlasLootMenuItem_22:Show()
	--Orgrimmar
	AtlasLootMenuItem_24_Name:SetText(BF["Orgrimmar"])
	AtlasLootMenuItem_24_Extra:SetText("|cffFF0000"..BF["Horde"])
	AtlasLootMenuItem_24_Icon:SetTexture("Interface\\Icons\\INV_Staff_13")
	AtlasLootMenuItem_24.lootpage="Orgrimmar"
	AtlasLootMenuItem_24:Show()
	--Thunder Bluff
	AtlasLootMenuItem_25_Name:SetText(BF["Thunder Bluff"])
	AtlasLootMenuItem_25_Extra:SetText("|cffFF0000"..BF["Horde"])
	AtlasLootMenuItem_25_Icon:SetTexture("Interface\\Icons\\INV_Staff_13")
	AtlasLootMenuItem_25.lootpage="ThunderBluff"
	AtlasLootMenuItem_25:Show()
	--Durotar Labor Union
	AtlasLootMenuItem_26_Name:SetText(BF["Durotar Labor Union"])
	AtlasLootMenuItem_26_Extra:SetText("|cffFF0000"..BF["Horde"])
	AtlasLootMenuItem_26_Icon:SetTexture("Interface\\Icons\\INV_Staff_13")
	AtlasLootMenuItem_26.lootpage="DurotarLaborUnion"
	AtlasLootMenuItem_26:Show()
	--Undercity
	AtlasLootMenuItem_27_Name:SetText(BF["Undercity"])
	AtlasLootMenuItem_27_Extra:SetText("|cffFF0000"..BF["Horde"])
	AtlasLootMenuItem_27_Icon:SetTexture("Interface\\Icons\\INV_Staff_13")
	AtlasLootMenuItem_27.lootpage="Undercity"
	AtlasLootMenuItem_27:Show()
	--Raventusk
	AtlasLootMenuItem_28_Name:SetText(BF["Revantusk Trolls"])
	AtlasLootMenuItem_28_Extra:SetText("|cffFF0000"..BF["Horde"])
	AtlasLootMenuItem_28_Icon:SetTexture("Interface\\Icons\\INV_Misc_Head_Troll_01")
	AtlasLootMenuItem_28.lootpage="Revantusk"
	AtlasLootMenuItem_28:Show()
	--The Defilers
	AtlasLootMenuItem_29_Name:SetText(BF["The Defilers"])
	AtlasLootMenuItem_29_Extra:SetText("|cffFF0000"..BF["Horde"])
	AtlasLootMenuItem_29_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_29.lootpage="Defilers"
	AtlasLootMenuItem_29:Show()
	--Frostwolf Clan
	AtlasLootMenuItem_30_Name:SetText(BF["Frostwolf Clan"])
	AtlasLootMenuItem_30_Extra:SetText("|cffFF0000"..BF["Horde"])
	AtlasLootMenuItem_30_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_FrostwolfTrinket_01")
	AtlasLootMenuItem_30.lootpage="Frostwolf1"
	AtlasLootMenuItem_30:Show()
end