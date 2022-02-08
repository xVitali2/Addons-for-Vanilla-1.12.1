local _G = getfenv()
local L = AceLibrary("AceLocale-2.2"):new("AtlasLoot")
local BC = AceLibrary("Babble-Class-2.2")
local BZ = AceLibrary("Babble-Zone-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2")

local ORANGE = "|cffFF8400"

function AtlasLootSetMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Hide()
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--ZG
	AtlasLootMenuItem_3_Name:SetText(L["Zul'Gurub Sets"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_19")
	AtlasLootMenuItem_3.lootpage="ZGSET"
	AtlasLootMenuItem_3:Show()
	--AQ20
	AtlasLootMenuItem_4_Name:SetText(L["Ruins of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Ring_AhnQiraj_03")
	AtlasLootMenuItem_4.lootpage="AQ20SET"
	AtlasLootMenuItem_4:Show()
	--AQ40
	AtlasLootMenuItem_5_Name:SetText(L["Temple of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Sword_59")
	AtlasLootMenuItem_5.lootpage="AQ40SET"
	AtlasLootMenuItem_5:Show()
	--Legendaries
	AtlasLootMenuItem_7_Name:SetText(L["Legendary Items"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Staff_Medivh")
	AtlasLootMenuItem_7.lootpage="Legendaries"
	AtlasLootMenuItem_7:Show()
	--Artifacts
	AtlasLootMenuItem_8_Name:SetText(L["Artifact Items"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Sword_07")
	AtlasLootMenuItem_8.lootpage="Artifacts"
	AtlasLootMenuItem_8:Show()
	--Rare Pets
	AtlasLootMenuItem_9_Name:SetText(L["Rare Pets"])
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\Ability_Seal")
	AtlasLootMenuItem_9.lootpage="RarePets1"
	AtlasLootMenuItem_9:Show()
	--Rare Mounts
	AtlasLootMenuItem_10_Name:SetText(L["Rare Mounts"])
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\INV_Misc_QirajiCrystal_05")
	AtlasLootMenuItem_10.lootpage="RareMounts"
	AtlasLootMenuItem_10:Show()
	--Old Mounts
	AtlasLootMenuItem_11_Name:SetText(L["Old Mounts"])
	AtlasLootMenuItem_11_Extra:SetText("")
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\Ability_Mount_RidingHorse")
	AtlasLootMenuItem_11.lootpage="OldMounts"
	AtlasLootMenuItem_11:Show()
	--Unobtainable Mounts
	AtlasLootMenuItem_12_Name:SetText(L["Unobtainable Mounts"])
	AtlasLootMenuItem_12_Extra:SetText("")
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\Ability_Mount_Whitetiger")
	AtlasLootMenuItem_12.lootpage="UnobMounts"
	AtlasLootMenuItem_12:Show()
	--Tabards
	AtlasLootMenuItem_13_Name:SetText(L["Tabards"])
	AtlasLootMenuItem_13_Extra:SetText("")
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\INV_Shirt_GuildTabard_01")
	AtlasLootMenuItem_13.lootpage="Tabards"
	AtlasLootMenuItem_13:Show()
	--World Epics
	AtlasLootMenuItem_2_Name:SetText(L["Pre 60 Sets"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Sword_43")
	AtlasLootMenuItem_2.lootpage="PRE60SET"
	AtlasLootMenuItem_2:Show()
	--World Epics
	AtlasLootMenuItem_22_Name:SetText(L["World Epics"])
	AtlasLootMenuItem_22_Extra:SetText("")
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\INV_Box_04")
	AtlasLootMenuItem_22.lootpage="WORLDEPICS"
	AtlasLootMenuItem_22:Show()
	--World Blues
	AtlasLootMenuItem_23_Name:SetText(L["World Blues"])
	AtlasLootMenuItem_23_Extra:SetText("")
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\INV_Box_01")
	AtlasLootMenuItem_23.lootpage="WORLDBLUES"
	AtlasLootMenuItem_23:Show()
	--Dungeon Set 1/2
	AtlasLootMenuItem_17_Name:SetText(L["Tier 0/0.5 Sets"])
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Chest_Chain_03")
	AtlasLootMenuItem_17.lootpage="T0SET"
	AtlasLootMenuItem_17:Show()
	--Tier 1
	AtlasLootMenuItem_18_Name:SetText(L["Tier 1 Sets"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Pants_Mail_03")
	AtlasLootMenuItem_18.lootpage="T1SET"
	AtlasLootMenuItem_18:Show()
	--Tier 2
	AtlasLootMenuItem_19_Name:SetText(L["Tier 2 Sets"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\INV_Shoulder_32")
	AtlasLootMenuItem_19.lootpage="T2SET"
	AtlasLootMenuItem_19:Show()
	--Tier 3
	AtlasLootMenuItem_20_Name:SetText(L["Tier 3 Sets"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\INV_Chest_Plate02")
	AtlasLootMenuItem_20.lootpage="T3SET"
	AtlasLootMenuItem_20:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["Collections"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLootWorldEpicsMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "SETMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Lvl 30-39 BoE World Epics
	AtlasLootMenuItem_4_Name:SetText(L["Level 30-39"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Ring_15")
	AtlasLootMenuItem_4.lootpage="WorldEpics1"
	AtlasLootMenuItem_4:Show()
	--Lvl 40-49 BoE World Epics
	AtlasLootMenuItem_5_Name:SetText(L["Level 40-49"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Staff_29")
	AtlasLootMenuItem_5.lootpage="WorldEpics2"
	AtlasLootMenuItem_5:Show()
	--Lvl 50-60 BoE World Epics
	AtlasLootMenuItem_6_Name:SetText(L["Level 50-60"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\INV_Sword_19")
	AtlasLootMenuItem_6.lootpage="WorldEpics3"
	AtlasLootMenuItem_6:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["World Epics"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end
	
function AtlasLootWorldBluesMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "SETMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Head
	AtlasLootMenuItem_2_Name:SetText(L["Head"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Helmet_01")
	AtlasLootMenuItem_2.lootpage="WorldBluesHead"
	AtlasLootMenuItem_2:Show()
	--Neck
	AtlasLootMenuItem_3_Name:SetText(L["Neck"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_21")
	AtlasLootMenuItem_3.lootpage="WorldBluesNeck"
	AtlasLootMenuItem_3:Show()
	--Shoulder
	AtlasLootMenuItem_4_Name:SetText(L["Shoulder"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Shoulder_02")
	AtlasLootMenuItem_4.lootpage="WorldBluesShoulder"
	AtlasLootMenuItem_4:Show()
	--Back
	AtlasLootMenuItem_5_Name:SetText(L["Back1"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Misc_Cape_19")
	AtlasLootMenuItem_5.lootpage="WorldBluesBack"
	AtlasLootMenuItem_5:Show()
	--Chest
	AtlasLootMenuItem_6_Name:SetText(L["Chest"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\INV_Chest_Cloth_51")
	AtlasLootMenuItem_6.lootpage="WorldBluesChest"
	AtlasLootMenuItem_6:Show()
	--Wrist
	AtlasLootMenuItem_7_Name:SetText(L["Wrist"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Bracer_01")
	AtlasLootMenuItem_7.lootpage="WorldBluesWrist"
	AtlasLootMenuItem_7:Show()
	--Hands
	AtlasLootMenuItem_8_Name:SetText(L["Hands"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Gauntlets_14")
	AtlasLootMenuItem_8.lootpage="WorldBluesHands"
	AtlasLootMenuItem_8:Show()
	--Waist
	AtlasLootMenuItem_9_Name:SetText(L["Waist"])
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\INV_Belt_02")
	AtlasLootMenuItem_9.lootpage="WorldBluesWaist"
	AtlasLootMenuItem_9:Show()
	--Legs
	AtlasLootMenuItem_10_Name:SetText(L["Legs"])
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\INV_Pants_01")
	AtlasLootMenuItem_10.lootpage="WorldBluesLegs"
	AtlasLootMenuItem_10:Show()
	--Feet
	AtlasLootMenuItem_11_Name:SetText(L["Feet"])
	AtlasLootMenuItem_11_Extra:SetText("")
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\INV_Boots_01")
	AtlasLootMenuItem_11.lootpage="WorldBluesFeet"
	AtlasLootMenuItem_11:Show()
	--Ring
	AtlasLootMenuItem_12_Name:SetText(L["Rings"])
	AtlasLootMenuItem_12_Extra:SetText("")
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Ring_13")
	AtlasLootMenuItem_12.lootpage="WorldBluesRing"
	AtlasLootMenuItem_12:Show()
	--Trinket
	AtlasLootMenuItem_13_Name:SetText(L["Trinkets"])
	AtlasLootMenuItem_13_Extra:SetText("")
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\INV_Misc_EngGizmos_12")
	AtlasLootMenuItem_13.lootpage="WorldBluesTrinket"
	AtlasLootMenuItem_13:Show()
	--Wands
	AtlasLootMenuItem_14_Name:SetText(L["Wands"])
	AtlasLootMenuItem_14_Extra:SetText("")
	AtlasLootMenuItem_14_Icon:SetTexture("Interface\\Icons\\INV_Wand_05")
	AtlasLootMenuItem_14.lootpage="WorldBluesWand"
	AtlasLootMenuItem_14:Show()
	--Held in OffHand
	AtlasLootMenuItem_15_Name:SetText(L["Off Hand"].." & "..L["Relics"])
	AtlasLootMenuItem_15_Extra:SetText("")
	AtlasLootMenuItem_15_Icon:SetTexture("Interface\\Icons\\INV_Misc_Book_06")
	AtlasLootMenuItem_15.lootpage="WorldBluesHeldInOffhand"
	AtlasLootMenuItem_15:Show()
	--1h Axe
	AtlasLootMenuItem_17_Name:SetText(L["One-Handed Axes"])
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_ThrowingAxe_01")
	AtlasLootMenuItem_17.lootpage="WorldBlues1HAxes"
	AtlasLootMenuItem_17:Show()
	--1h Mace
	AtlasLootMenuItem_18_Name:SetText(L["One-Handed Maces"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Hammer_15")
	AtlasLootMenuItem_18.lootpage="WorldBlues1HMaces"
	AtlasLootMenuItem_18:Show()
	--1h Sword
	AtlasLootMenuItem_19_Name:SetText(L["One-Handed Swords"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\INV_Sword_05")
	AtlasLootMenuItem_19.lootpage="WorldBlues1HSwords"
	AtlasLootMenuItem_19:Show()
	--2h Axe
	AtlasLootMenuItem_20_Name:SetText(L["Two-Handed Axes"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\INV_ThrowingAxe_06")
	AtlasLootMenuItem_20.lootpage="WorldBlues2HAxes"
	AtlasLootMenuItem_20:Show()
	--2h Mace
	AtlasLootMenuItem_21_Name:SetText(L["Two-Handed Maces"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Hammer_17")
	AtlasLootMenuItem_21.lootpage="WorldBlues2HMaces"
	AtlasLootMenuItem_21:Show()
	--2h Sword
	AtlasLootMenuItem_22_Name:SetText(L["Two-Handed Swords"])
	AtlasLootMenuItem_22_Extra:SetText("")
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\INV_Sword_23")
	AtlasLootMenuItem_22.lootpage="WorldBlues2HSwords"
	AtlasLootMenuItem_22:Show()
	--Dagger
	AtlasLootMenuItem_23_Name:SetText(L["Daggers"])
	AtlasLootMenuItem_23_Extra:SetText("")
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\INV_Sword_33")
	AtlasLootMenuItem_23.lootpage="WorldBluesDaggers"
	AtlasLootMenuItem_23:Show()
	--Fists
	AtlasLootMenuItem_24_Name:SetText(L["Fist Weapons"])
	AtlasLootMenuItem_24_Extra:SetText("")
	AtlasLootMenuItem_24_Icon:SetTexture("Interface\\Icons\\INV_Gauntlets_04")
	AtlasLootMenuItem_24.lootpage="WorldBluesFistWeapons"
	AtlasLootMenuItem_24:Show()
	--Polearms
	AtlasLootMenuItem_25_Name:SetText(L["Polearms"])
	AtlasLootMenuItem_25_Extra:SetText("")
	AtlasLootMenuItem_25_Icon:SetTexture("Interface\\Icons\\INV_Spear_05")
	AtlasLootMenuItem_25.lootpage="WorldBluesPolearms"
	AtlasLootMenuItem_25:Show()
	--Staves
	AtlasLootMenuItem_26_Name:SetText(L["Staves"])
	AtlasLootMenuItem_26_Extra:SetText("")
	AtlasLootMenuItem_26_Icon:SetTexture("Interface\\Icons\\INV_Staff_29")
	AtlasLootMenuItem_26.lootpage="WorldBluesStaves"
	AtlasLootMenuItem_26:Show()
	--Bows
	AtlasLootMenuItem_27_Name:SetText(L["Bows"])
	AtlasLootMenuItem_27_Extra:SetText("")
	AtlasLootMenuItem_27_Icon:SetTexture("Interface\\Icons\\INV_Weapon_Bow_02")
	AtlasLootMenuItem_27.lootpage="WorldBluesBows"
	AtlasLootMenuItem_27:Show()
	--Crossbows
	AtlasLootMenuItem_28_Name:SetText(L["Crossbows"])
	AtlasLootMenuItem_28_Extra:SetText("")
	AtlasLootMenuItem_28_Icon:SetTexture("Interface\\Icons\\INV_Weapon_Crossbow_02")
	AtlasLootMenuItem_28.lootpage="WorldBluesCrossbows"
	AtlasLootMenuItem_28:Show()
	--Guns
	AtlasLootMenuItem_29_Name:SetText(L["Guns"])
	AtlasLootMenuItem_29_Extra:SetText("")
	AtlasLootMenuItem_29_Icon:SetTexture("Interface\\Icons\\INV_Weapon_Rifle_07")
	AtlasLootMenuItem_29.lootpage="WorldBluesGuns"
	AtlasLootMenuItem_29:Show()
	--Shields
	AtlasLootMenuItem_30_Name:SetText(L["Shields"])
	AtlasLootMenuItem_30_Extra:SetText("")
	AtlasLootMenuItem_30_Icon:SetTexture("Interface\\Icons\\INV_Shield_04")
	AtlasLootMenuItem_30.lootpage="WorldBluesShields"
	AtlasLootMenuItem_30:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["World Blues"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end
	
function AtlasLootPRE60SetMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "SETMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--The Deadmines - Defias Leather
	AtlasLootMenuItem_2_Name:SetText(BIS["Defias Leather"])
	AtlasLootMenuItem_2_Extra:SetText(ORANGE..BZ["The Deadmines"])
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Pants_12")
	AtlasLootMenuItem_2.lootpage="DEADMINES"
	AtlasLootMenuItem_2:Show()
	--Wailing Caverns - Embrace of the Viper
	AtlasLootMenuItem_3_Name:SetText(BIS["Embrace of the Viper"])
	AtlasLootMenuItem_3_Extra:SetText(ORANGE..BZ["Wailing Caverns"])
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Shirt_16")
	AtlasLootMenuItem_3.lootpage="WAILING"
	AtlasLootMenuItem_3:Show()
	--Scarlet Monastery - Chain of the Scarlet Crusade
	AtlasLootMenuItem_4_Name:SetText(BIS["Chain of the Scarlet Crusade"])
	AtlasLootMenuItem_4_Extra:SetText(ORANGE..BZ["Scarlet Monastery"])
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Gauntlets_19")
	AtlasLootMenuItem_4.lootpage="SCARLET"
	AtlasLootMenuItem_4:Show()
	--Blackrock Depths - The Gladiator
	AtlasLootMenuItem_5_Name:SetText(BIS["The Gladiator"])
	AtlasLootMenuItem_5_Extra:SetText(ORANGE..BZ["Blackrock Depths"])
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Helmet_01")
	AtlasLootMenuItem_5.lootpage="BLACKROCKD"
	AtlasLootMenuItem_5:Show()
	--Ironweave Battlesuit
	AtlasLootMenuItem_6_Name:SetText(BIS["Ironweave Battlesuit"])
	AtlasLootMenuItem_6_Extra:SetText(ORANGE..L["Various Locations"])
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\INV_Boots_Cloth_05")
	AtlasLootMenuItem_6.lootpage="IRONWEAVE"
	AtlasLootMenuItem_6:Show()
	--Stratholme - The Postmaster
	AtlasLootMenuItem_7_Name:SetText(BIS["The Postmaster"])
	AtlasLootMenuItem_7_Extra:SetText(ORANGE..BZ["Stratholme"])
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Boots_02")
	AtlasLootMenuItem_7.lootpage="STRAT"
	AtlasLootMenuItem_7:Show()
	--Scholomance - Cloth - Necropile Raiment
	AtlasLootMenuItem_8_Name:SetText(BIS["Necropile Raiment"])
	AtlasLootMenuItem_8_Extra:SetText(ORANGE..BZ["Scholomance"])
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Shoulder_02")
	AtlasLootMenuItem_8.lootpage="ScholoCloth"
	AtlasLootMenuItem_8:Show()
	--Scholomance - Leather - Cadaverous Garb
	AtlasLootMenuItem_9_Name:SetText(BIS["Cadaverous Garb"])
	AtlasLootMenuItem_9_Extra:SetText(ORANGE..BZ["Scholomance"])
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\INV_Belt_16")
	AtlasLootMenuItem_9.lootpage="ScholoLeather"
	AtlasLootMenuItem_9:Show()
	--Scholomance - Mail - Bloodmail Regalia
	AtlasLootMenuItem_10_Name:SetText(BIS["Bloodmail Regalia"])
	AtlasLootMenuItem_10_Extra:SetText(ORANGE..BZ["Scholomance"])
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\INV_Gauntlets_26")
	AtlasLootMenuItem_10.lootpage="ScholoMail"
	AtlasLootMenuItem_10:Show()
	--Scholomance - Plate - Deathbone Guardian
	AtlasLootMenuItem_11_Name:SetText(BIS["Deathbone Guardian"])
	AtlasLootMenuItem_11_Extra:SetText(ORANGE..BZ["Scholomance"])
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\INV_Belt_12")
	AtlasLootMenuItem_11.lootpage="ScholoPlate"
	AtlasLootMenuItem_11:Show()
	--Scourge Invasion
	AtlasLootMenuItem_12_Name:SetText(L["Scourge Invasion"])
	AtlasLootMenuItem_12_Extra:SetText(ORANGE..L["Various Locations"])
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Talisman_13")
	AtlasLootMenuItem_12.lootpage="ScourgeInvasion"
	AtlasLootMenuItem_12:Show()
	--Spider's Kiss
	AtlasLootMenuItem_17_Name:SetText(BIS["Spider's Kiss"])
	AtlasLootMenuItem_17_Extra:SetText(ORANGE..BZ["Lower Blackrock Spire"])
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Weapon_ShortBlade_16")
	AtlasLootMenuItem_17.lootpage="SpiderKiss"
	AtlasLootMenuItem_17:Show()
	--Dal'Rend's Arms
	AtlasLootMenuItem_18_Name:SetText(BIS["Dal'Rend's Arms"])
	AtlasLootMenuItem_18_Extra:SetText(ORANGE..BZ["Upper Blackrock Spire"])
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Sword_43")
	AtlasLootMenuItem_18.lootpage="DalRend"
	AtlasLootMenuItem_18:Show()
	--Zul'Gurub Rings
	AtlasLootMenuItem_19_Name:SetText(L["Zul'Gurub Rings"])
	AtlasLootMenuItem_19_Extra:SetText(ORANGE..BZ["Zul'Gurub"])
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\INV_Bijou_Orange")
	AtlasLootMenuItem_19.lootpage="ZGRings"
	AtlasLootMenuItem_19:Show()
	--Primal Blessing
	AtlasLootMenuItem_20_Name:SetText(BIS["Primal Blessing"])
	AtlasLootMenuItem_20_Extra:SetText(ORANGE..BZ["Zul'Gurub"])
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\INV_Weapon_Hand_01")
	AtlasLootMenuItem_20.lootpage="PrimalBlessing"
	AtlasLootMenuItem_20:Show()
	--The Twin Blades of Hakkari
	AtlasLootMenuItem_21_Name:SetText(BIS["The Twin Blades of Hakkari"])
	AtlasLootMenuItem_21_Extra:SetText(ORANGE..BZ["Zul'Gurub"])
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Sword_55")
	AtlasLootMenuItem_21.lootpage="HakkariBlades"
	AtlasLootMenuItem_21:Show()
	--Shard of the Gods
	AtlasLootMenuItem_22_Name:SetText(BIS["Shard of the Gods"])
	AtlasLootMenuItem_22_Extra:SetText(ORANGE..L["Various Locations"])
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\INV_Misc_MonsterScales_15")
	AtlasLootMenuItem_22.lootpage="ShardOfGods"
	AtlasLootMenuItem_22:Show()
	--Spirit of Eskhandar
	AtlasLootMenuItem_23_Name:SetText(BIS["Spirit of Eskhandar"])
	AtlasLootMenuItem_23_Extra:SetText(ORANGE..L["Various Locations"])
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\INV_Misc_MonsterClaw_04")
	AtlasLootMenuItem_23.lootpage="SpiritofEskhandar"
	AtlasLootMenuItem_23:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["Pre 60 Sets"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLootZGSetMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "SETMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="ZGPriest"
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="ZGMage"
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="ZGWarlock"
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="ZGRogue"
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="ZGDruid"
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="ZGHunter"
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="ZGShaman"
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="ZGPaladin"
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="ZGWarrior"
	AtlasLootMenuItem_21:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["Zul'Gurub Sets"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLootAQ40SetMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "SETMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="AQ40Priest"
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="AQ40Mage"
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="AQ40Warlock"
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="AQ40Rogue"
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="AQ40Druid"
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="AQ40Hunter"
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="AQ40Shaman"
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="AQ40Paladin"
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="AQ40Warrior"
	AtlasLootMenuItem_21:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["Temple of Ahn'Qiraj Sets"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLootAQ20SetMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "SETMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="AQ20Priest"
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="AQ20Mage"
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="AQ20Warlock"
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="AQ20Rogue"
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="AQ20Druid"
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="AQ20Hunter"
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="AQ20Shaman"
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="AQ20Paladin"
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="AQ20Warrior"
	AtlasLootMenuItem_21:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["Ruins of Ahn'Qiraj Sets"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLootT0SetMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "SETMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="T0Priest"
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="T0Mage"
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="T0Warlock"
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="T0Rogue"
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="T0Druid"
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="T0Hunter"
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="T0Shaman"
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="T0Paladin"
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="T0Warrior"
	AtlasLootMenuItem_21:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["Tier 0/0.5 Sets"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLootT1SetMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "SETMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="T1Priest"
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="T1Mage"
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="T1Warlock"
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="T1Rogue"
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="T1Druid"
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="T1Hunter"
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="T1Shaman"
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="T1Paladin"
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="T1Warrior"
	AtlasLootMenuItem_21:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["Tier 1 Sets"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLootT2SetMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "SETMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="T2Priest"
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="T2Mage"
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="T2Warlock"
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="T2Rogue"
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="T2Druid"
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="T2Hunter"
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="T2Shaman"
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="T2Paladin"
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="T2Warrior"
	AtlasLootMenuItem_21:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["Tier 2 Sets"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLootT3SetMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "SETMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="T3Priest"
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="T3Mage"
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="T3Warlock"
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="T3Rogue"
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="T3Druid"
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="T3Hunter"
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="T3Shaman"
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="T3Paladin"
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="T3Warrior"
	AtlasLootMenuItem_21:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["Tier 3 Sets"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end