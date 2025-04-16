local _G = getfenv()
local L = AceLibrary("AceLocale-2.2"):new("AtlasLoot")
local BC = AceLibrary("Babble-Class-2.2")
local BZ = AceLibrary("Babble-Zone-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2")

local ORANGE = "|cffFF8400"
local data = AtlasLoot_Data["AtlasLootSetItems"]

function AtlasLoot_GetDataSource(dataID)
	local source = nil
	for k in pairs(AtlasLoot_Data) do
		if source then
			break
		end
		for i in pairs(AtlasLoot_Data[k]) do
			if i == dataID then
				source = k
				break
			end
		end
	end
	return source
end

function AtlasLoot_PrepMenu(backPage, title)
	for i = 1, 30, 1 do
		_G["AtlasLootItem_" .. i]:Hide()
		_G["AtlasLootItem_" .. i.."Border"]:Hide()
	end
	for i = 1, 30, 1 do
		local button = _G["AtlasLootMenuItem_" .. i]
		_G["AtlasLootMenuItem_" .. i.."Border"]:Hide()
		button:Hide()
		button.isheader = false
		button.container = nil
		button.dataSource = nil
		_G["AtlasLootMenuItem_" .. i .. "_Icon"]:SetTexCoord(0, 1, 0, 1)
	end
	if backPage then
		AtlasLootItemsFrame_BACK:Show()
		AtlasLootItemsFrame_BACK.lootpage = backPage
	else
		AtlasLootItemsFrame_BACK:Hide()
	end
	AtlasLootItemsFrame_NEXT:Hide()
	AtlasLootItemsFrame_PREV:Hide()
	AtlasLootServerQueryButton:Hide()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_" .. i .. "_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF" .. title)
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLootSetMenu()
	AtlasLoot_PrepMenu(nil, L["Collections"])
	AtlasLootCharDB.LastBoss = "SETMENU"
	AtlasLootCharDB.LastBossText = "Collections"
	--Pre 60 Sets
	AtlasLootMenuItem_1_Name:SetText(L["Pre 60 Sets"])
	AtlasLootMenuItem_1_Extra:SetText("")
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\INV_Sword_43")
	AtlasLootMenuItem_1.lootpage="PRE60SET"
	AtlasLootMenuItem_1:Show()
	--ZG
	AtlasLootMenuItem_2_Name:SetText(L["Zul'Gurub Sets"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Sword_55")
	AtlasLootMenuItem_2.lootpage="ZGSET"
	AtlasLootMenuItem_2:Show()
	--AQ20
	AtlasLootMenuItem_3_Name:SetText(L["Ruins of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Axe_15")
	AtlasLootMenuItem_3.lootpage="AQ20SET"
	AtlasLootMenuItem_3:Show()
	--AQ40
	AtlasLootMenuItem_4_Name:SetText(L["Temple of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Sword_59")
	AtlasLootMenuItem_4.lootpage="AQ40SET"
	AtlasLootMenuItem_4:Show()
	--Upper Karazhan Set
	AtlasLootMenuItem_5_Name:SetText("Tower of Karazhan Sets")
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Staff_Medivh")
	AtlasLootMenuItem_5.lootpage="K40SET"
	AtlasLootMenuItem_5:Show()
	--PriestSets
	AtlasLootMenuItem_7_Name:SetText("|cffffffff"..L["Priest Sets"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_7.lootpage="PriestSet"
	AtlasLootMenuItem_7:Show()
	--MageSets
	AtlasLootMenuItem_8_Name:SetText("|cff68ccef"..L["Mage Sets"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_8.lootpage="MageSet"
	AtlasLootMenuItem_8:Show()
	--WarlockSets
	AtlasLootMenuItem_9_Name:SetText("|cff9382c9"..L["Warlock Sets"])
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_9.lootpage="WarlockSet"
	AtlasLootMenuItem_9:Show()
	--RogueSets
	AtlasLootMenuItem_10_Name:SetText("|cfffff468"..L["Rogue Sets"])
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_10.lootpage="RogueSet"
	AtlasLootMenuItem_10:Show()
	--DruidSets
	AtlasLootMenuItem_11_Name:SetText("|cffff7c0a"..L["Druid Sets"])
	AtlasLootMenuItem_11_Extra:SetText("")
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_11.lootpage="DruidSet"
	AtlasLootMenuItem_11:Show()
	--HunterSets
	AtlasLootMenuItem_12_Name:SetText("|cffaad372"..L["Hunter Sets"])
	AtlasLootMenuItem_12_Extra:SetText("")
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_12.lootpage="HunterSet"
	AtlasLootMenuItem_12:Show()
	--ShamanSets
	AtlasLootMenuItem_13_Name:SetText("|cff2773ff"..L["Shaman Sets"])
	AtlasLootMenuItem_13_Extra:SetText("")
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_13.lootpage="ShamanSet"
	AtlasLootMenuItem_13:Show()
	--PaladinSets
	AtlasLootMenuItem_14_Name:SetText("|cfff48cba"..L["Paladin Sets"])
	AtlasLootMenuItem_14_Extra:SetText("")
	AtlasLootMenuItem_14_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_14.lootpage="PaladinSet"
	AtlasLootMenuItem_14:Show()
	--WarriorSets
	AtlasLootMenuItem_15_Name:SetText("|cffc69b6d"..L["Warrior Sets"])
	AtlasLootMenuItem_15_Extra:SetText("")
	AtlasLootMenuItem_15_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_15.lootpage="WarriorSet"
	AtlasLootMenuItem_15:Show()
	--Dungeon Set 1/2
	AtlasLootMenuItem_16_Name:SetText(L["Tier 0/0.5 Sets"])
	AtlasLootMenuItem_16_Extra:SetText("")
	AtlasLootMenuItem_16_Icon:SetTexture("Interface\\Icons\\INV_Chest_Chain_03")
	AtlasLootMenuItem_16.lootpage="T0SET"
	AtlasLootMenuItem_16:Show()
	--Tier 1
	AtlasLootMenuItem_17_Name:SetText(L["Tier 1 Sets"])
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Pants_Mail_03")
	AtlasLootMenuItem_17.lootpage="T1SET"
	AtlasLootMenuItem_17:Show()
	--Tier 2
	AtlasLootMenuItem_18_Name:SetText(L["Tier 2 Sets"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Shoulder_32")
	AtlasLootMenuItem_18.lootpage="T2SET"
	AtlasLootMenuItem_18:Show()
	--Tier 3
	AtlasLootMenuItem_19_Name:SetText(L["Tier 3 Sets"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\INV_Chest_Plate02")
	AtlasLootMenuItem_19.lootpage="T3SET"
	AtlasLootMenuItem_19:Show()
	--World Blues
	AtlasLootMenuItem_21_Name:SetText(L["World Blues"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Box_01")
	AtlasLootMenuItem_21.lootpage="WORLDBLUES"
	AtlasLootMenuItem_21:Show()
	--World Epics
	AtlasLootMenuItem_22_Name:SetText(L["World Epics"])
	AtlasLootMenuItem_22_Extra:SetText("")
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\INV_Box_04")
	AtlasLootMenuItem_22.lootpage="WORLDEPICS"
	AtlasLootMenuItem_22:Show()
	--Legendaries
	AtlasLootMenuItem_23_Name:SetText(L["Legendary Items"])
	AtlasLootMenuItem_23_Extra:SetText("")
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\INV_Staff_Medivh")
	AtlasLootMenuItem_23.lootpage="Legendaries"
	AtlasLootMenuItem_23:Show()
	--Artifacts
	AtlasLootMenuItem_24_Name:SetText(L["Artifact Items"])
	AtlasLootMenuItem_24_Extra:SetText("")
	AtlasLootMenuItem_24_Icon:SetTexture("Interface\\Icons\\INV_Sword_07")
	AtlasLootMenuItem_24.lootpage="Artifacts"
	AtlasLootMenuItem_24:Show()
	--Rare Pets
	AtlasLootMenuItem_25_Name:SetText(L["Rare Pets"])
	AtlasLootMenuItem_25_Extra:SetText("")
	AtlasLootMenuItem_25_Icon:SetTexture("Interface\\Icons\\Ability_Seal")
	AtlasLootMenuItem_25.lootpage="RarePets1"
	AtlasLootMenuItem_25:Show()
	--Rare Mounts
	AtlasLootMenuItem_26_Name:SetText(L["Rare Mounts"])
	AtlasLootMenuItem_26_Extra:SetText("")
	AtlasLootMenuItem_26_Icon:SetTexture("Interface\\Icons\\INV_Misc_QirajiCrystal_05")
	AtlasLootMenuItem_26.lootpage="RareMounts"
	AtlasLootMenuItem_26:Show()
	--Old Mounts
	AtlasLootMenuItem_27_Name:SetText(L["Old Mounts"])
	AtlasLootMenuItem_27_Extra:SetText("")
	AtlasLootMenuItem_27_Icon:SetTexture("Interface\\Icons\\Ability_Mount_RidingHorse")
	AtlasLootMenuItem_27.lootpage="OldMounts"
	AtlasLootMenuItem_27:Show()
	--Unobtainable Mounts
	AtlasLootMenuItem_28_Name:SetText(L["Unobtainable Mounts"])
	AtlasLootMenuItem_28_Extra:SetText("")
	AtlasLootMenuItem_28_Icon:SetTexture("Interface\\Icons\\Ability_Mount_Whitetiger")
	AtlasLootMenuItem_28.lootpage="UnobMounts"
	AtlasLootMenuItem_28:Show()
	--Tabards
	AtlasLootMenuItem_29_Name:SetText(L["Tabards"])
	AtlasLootMenuItem_29_Extra:SetText("")
	AtlasLootMenuItem_29_Icon:SetTexture("Interface\\Icons\\INV_Shirt_GuildTabard_01")
	AtlasLootMenuItem_29.lootpage="Tabards"
	AtlasLootMenuItem_29:Show()
	-- Fashion
	AtlasLootMenuItem_30_Name:SetText(L["Fashion"])
	AtlasLootMenuItem_30_Extra:SetText("")
	AtlasLootMenuItem_30_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_Pet_Turtle")
	AtlasLootMenuItem_30.lootpage = "DonationRewards2"
	AtlasLootMenuItem_30:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootWorldEpicsMenu()
	AtlasLoot_PrepMenu("SETMENU", L["World Epics"])
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
end
	
function AtlasLootWorldBluesMenu()
	AtlasLoot_PrepMenu("SETMENU", L["World Blues"])
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
end

function AtlasLootPriestSetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Priest Sets"])
	--T0
	AtlasLootMenuItem_1_Name:SetText("|cffffffff"..L["Tier 0/0.5 Sets"])
	AtlasLootMenuItem_1_Extra:SetText("")
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_1.lootpage="T0Priest"
	AtlasLootMenuItem_1.container = data.T0PriestC
	AtlasLootMenuItem_1:Show()
	--T1
	AtlasLootMenuItem_2_Name:SetText("|cffffffff"..L["Tier 1 Sets"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_2.lootpage="T1Priest"
	AtlasLootMenuItem_2.container = data.T1PriestC
	AtlasLootMenuItem_2:Show()
	--ZG
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..L["Zul'Gurub Sets"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="ZGPriest"
	AtlasLootMenuItem_3.container = data.ZGPriestC
	AtlasLootMenuItem_3:Show()
	--AQ20
	AtlasLootMenuItem_4_Name:SetText("|cffffffff"..L["Ruins of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_4.lootpage="AQ20Priest"
	AtlasLootMenuItem_4.container = data.AQ20PriestC
	AtlasLootMenuItem_4:Show()
	--T2
	AtlasLootMenuItem_5_Name:SetText("|cffffffff"..L["Tier 2 Sets"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_5.lootpage="T2Priest"
	AtlasLootMenuItem_5.container = data.T2PriestC
	AtlasLootMenuItem_5:Show()
	--AQ40
	AtlasLootMenuItem_6_Name:SetText("|cffffffff"..L["Temple of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_6.lootpage="AQ40Priest"
	AtlasLootMenuItem_6.container = data.AQ40PriestC
	AtlasLootMenuItem_6:Show()
	--T3
	AtlasLootMenuItem_7_Name:SetText("|cffffffff"..L["Tier 3 Sets"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_7.lootpage="T3Priest"
	AtlasLootMenuItem_7.container = data.T3PriestC
	AtlasLootMenuItem_7:Show()
	--T35
	AtlasLootMenuItem_8_Name:SetText("|cffffffff"..L["Tower of Karazhan Sets"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_8.lootpage="T35Priest"
	AtlasLootMenuItem_8.container = data.T35PriestC
	AtlasLootMenuItem_8:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootMageSetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Mage Sets"])
	--T0
	AtlasLootMenuItem_1_Name:SetText("|cff68ccef"..L["Tier 0/0.5 Sets"])
	AtlasLootMenuItem_1_Extra:SetText("")
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_1.lootpage="T0Mage"
	AtlasLootMenuItem_1.container = data.T0MageC
	AtlasLootMenuItem_1:Show()
	--T1
	AtlasLootMenuItem_2_Name:SetText("|cff68ccef"..L["Tier 1 Sets"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_2.lootpage="T1Mage"
	AtlasLootMenuItem_2.container = data.T1MageC
	AtlasLootMenuItem_2:Show()
	--ZG
	AtlasLootMenuItem_3_Name:SetText("|cff68ccef"..L["Zul'Gurub Sets"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_3.lootpage="ZGMage"
	AtlasLootMenuItem_3.container = data.ZGMageC
	AtlasLootMenuItem_3:Show()
	--AQ20
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..L["Ruins of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="AQ20Mage"
	AtlasLootMenuItem_4.container = data.AQ20MageC
	AtlasLootMenuItem_4:Show()
	--T2
	AtlasLootMenuItem_5_Name:SetText("|cff68ccef"..L["Tier 2 Sets"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_5.lootpage="T2Mage"
	AtlasLootMenuItem_5.container = data.T2MageC
	AtlasLootMenuItem_5:Show()
	--AQ40
	AtlasLootMenuItem_6_Name:SetText("|cff68ccef"..L["Temple of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_6.lootpage="AQ40Mage"
	AtlasLootMenuItem_6.container = data.AQ40MageC
	AtlasLootMenuItem_6:Show()
	--T3
	AtlasLootMenuItem_7_Name:SetText("|cff68ccef"..L["Tier 3 Sets"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_7.lootpage="T3Mage"
	AtlasLootMenuItem_7.container = data.T3MageC
	AtlasLootMenuItem_7:Show()
	--T35
	AtlasLootMenuItem_8_Name:SetText("|cff68ccef"..L["Tower of Karazhan Sets"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_8.lootpage="T35Mage"
	AtlasLootMenuItem_8.container = data.T35MageC
	AtlasLootMenuItem_8:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootWarlockSetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Warlock Sets"])
	--T0
	AtlasLootMenuItem_1_Name:SetText("|cff9382c9"..L["Tier 0/0.5 Sets"])
	AtlasLootMenuItem_1_Extra:SetText("")
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_1.lootpage="T0Warlock"
	AtlasLootMenuItem_1.container = data.T0WarlockC
	AtlasLootMenuItem_1:Show()
	--T1
	AtlasLootMenuItem_2_Name:SetText("|cff9382c9"..L["Tier 1 Sets"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_2.lootpage="T1Warlock"
	AtlasLootMenuItem_2.container = data.T1WarlockC
	AtlasLootMenuItem_2:Show()
	--ZG
	AtlasLootMenuItem_3_Name:SetText("|cff9382c9"..L["Zul'Gurub Sets"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_3.lootpage="ZGWarlock"
	AtlasLootMenuItem_3.container = data.ZGWarlockC
	AtlasLootMenuItem_3:Show()
	--AQ20
	AtlasLootMenuItem_4_Name:SetText("|cff9382c9"..L["Ruins of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_4.lootpage="AQ20Warlock"
	AtlasLootMenuItem_4.container = data.AQ20WarlockC
	AtlasLootMenuItem_4:Show()
	--T2
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..L["Tier 2 Sets"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="T2Warlock"
	AtlasLootMenuItem_5.container = data.T2WarlockC
	AtlasLootMenuItem_5:Show()
	--AQ40
	AtlasLootMenuItem_6_Name:SetText("|cff9382c9"..L["Temple of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_6.lootpage="AQ40Warlock"
	AtlasLootMenuItem_6.container = data.AQ40WarlockC
	AtlasLootMenuItem_6:Show()
	--T3
	AtlasLootMenuItem_7_Name:SetText("|cff9382c9"..L["Tier 3 Sets"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_7.lootpage="T3Warlock"
	AtlasLootMenuItem_7.container = data.T3WarlockC
	AtlasLootMenuItem_7:Show()
	--T35
	AtlasLootMenuItem_8_Name:SetText("|cff9382c9"..L["Tower of Karazhan Sets"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_8.lootpage="T35Warlock"
	AtlasLootMenuItem_8.container = data.T35WarlockC
	AtlasLootMenuItem_8:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootRogueSetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Rogue Sets"])
	--T0
	AtlasLootMenuItem_1_Name:SetText("|cfffff468"..L["Tier 0/0.5 Sets"])
	AtlasLootMenuItem_1_Extra:SetText("")
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_1.lootpage="T0Rogue"
	AtlasLootMenuItem_1.container = data.T0RogueC
	AtlasLootMenuItem_1:Show()
	--T1
	AtlasLootMenuItem_2_Name:SetText("|cfffff468"..L["Tier 1 Sets"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_2.lootpage="T1Rogue"
	AtlasLootMenuItem_2.container = data.T1RogueC
	AtlasLootMenuItem_2:Show()
	--ZG
	AtlasLootMenuItem_3_Name:SetText("|cfffff468"..L["Zul'Gurub Sets"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_3.lootpage="ZGRogue"
	AtlasLootMenuItem_3.container = data.ZGRogueC
	AtlasLootMenuItem_3:Show()
	--AQ20
	AtlasLootMenuItem_4_Name:SetText("|cfffff468"..L["Ruins of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_4.lootpage="AQ20Rogue"
	AtlasLootMenuItem_4.container = data.AQ20RogueC
	AtlasLootMenuItem_4:Show()
	--T2
	AtlasLootMenuItem_5_Name:SetText("|cfffff468"..L["Tier 2 Sets"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_5.lootpage="T2Rogue"
	AtlasLootMenuItem_5.container = data.T2RogueC
	AtlasLootMenuItem_5:Show()
	--AQ40
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..L["Temple of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="AQ40Rogue"
	AtlasLootMenuItem_6.container = data.AQ40RogueC
	AtlasLootMenuItem_6:Show()
	--T3
	AtlasLootMenuItem_7_Name:SetText("|cfffff468"..L["Tier 3 Sets"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_7.lootpage="T3Rogue"
	AtlasLootMenuItem_7.container = data.T3RogueC
	AtlasLootMenuItem_7:Show()
	--T35
	AtlasLootMenuItem_8_Name:SetText("|cfffff468"..L["Tower of Karazhan Sets"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_8.lootpage="T35Rogue"
	AtlasLootMenuItem_8.container = data.T35RogueC
	AtlasLootMenuItem_8:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootDruidSetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Druid Sets"])
	--T0
	AtlasLootMenuItem_1_Name:SetText("|cffff7c0a"..L["Tier 0/0.5 Sets"])
	AtlasLootMenuItem_1_Extra:SetText("")
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_1.lootpage="T0Druid"
	AtlasLootMenuItem_1.container = data.T0DruidC
	AtlasLootMenuItem_1:Show()
	--T1
	AtlasLootMenuItem_2_Name:SetText("|cffff7c0a"..L["Tier 1 Sets"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_2.lootpage="T1Druid"
	AtlasLootMenuItem_2.container = data.T1DruidC
	AtlasLootMenuItem_2:Show()
	--ZG
	AtlasLootMenuItem_3_Name:SetText("|cffff7c0a"..L["Zul'Gurub Sets"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_3.lootpage="ZGDruid"
	AtlasLootMenuItem_3.container = data.ZGDruidC
	AtlasLootMenuItem_3:Show()
	--AQ20
	AtlasLootMenuItem_4_Name:SetText("|cffff7c0a"..L["Ruins of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_4.lootpage="AQ20Druid"
	AtlasLootMenuItem_4.container = data.AQ20DruidC
	AtlasLootMenuItem_4:Show()
	--T2
	AtlasLootMenuItem_5_Name:SetText("|cffff7c0a"..L["Tier 2 Sets"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_5.lootpage="T2Druid"
	AtlasLootMenuItem_5.container = data.T2DruidC
	AtlasLootMenuItem_5:Show()
	--AQ40
	AtlasLootMenuItem_6_Name:SetText("|cffff7c0a"..L["Temple of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_6.lootpage="AQ40Druid"
	AtlasLootMenuItem_6.container = data.AQ40DruidC
	AtlasLootMenuItem_6:Show()
	--T3
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..L["Tier 3 Sets"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="T3Druid"
	AtlasLootMenuItem_7.container = data.T3DruidC
	AtlasLootMenuItem_7:Show()
	--T35
	AtlasLootMenuItem_8_Name:SetText("|cffff7c0a"..L["Tower of Karazhan Sets"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_8.lootpage="T35Druid"
	AtlasLootMenuItem_8.container = data.T35DruidC
	AtlasLootMenuItem_8:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootHunterSetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Hunter Sets"])
	--T0
	AtlasLootMenuItem_1_Name:SetText("|cffaad372"..L["Tier 0/0.5 Sets"])
	AtlasLootMenuItem_1_Extra:SetText("")
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_1.lootpage="T0Hunter"
	AtlasLootMenuItem_1.container = data.T0HunterC
	AtlasLootMenuItem_1:Show()
	--T1
	AtlasLootMenuItem_2_Name:SetText("|cffaad372"..L["Tier 1 Sets"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_2.lootpage="T1Hunter"
	AtlasLootMenuItem_2.container = data.T1HunterC
	AtlasLootMenuItem_2:Show()
	--ZG
	AtlasLootMenuItem_3_Name:SetText("|cffaad372"..L["Zul'Gurub Sets"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_3.lootpage="ZGHunter"
	AtlasLootMenuItem_3.container = data.ZGHunterC
	AtlasLootMenuItem_3:Show()
	--AQ20
	AtlasLootMenuItem_4_Name:SetText("|cffaad372"..L["Ruins of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_4.lootpage="AQ20Hunter"
	AtlasLootMenuItem_4.container = data.AQ20HunterC
	AtlasLootMenuItem_4:Show()
	--T2
	AtlasLootMenuItem_5_Name:SetText("|cffaad372"..L["Tier 2 Sets"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_5.lootpage="T2Hunter"
	AtlasLootMenuItem_5.container = data.T2HunterC
	AtlasLootMenuItem_5:Show()
	--AQ40
	AtlasLootMenuItem_6_Name:SetText("|cffaad372"..L["Temple of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_6.lootpage="AQ40Hunter"
	AtlasLootMenuItem_6.container = data.AQ40HunterC
	AtlasLootMenuItem_6:Show()
	--T3
	AtlasLootMenuItem_7_Name:SetText("|cffaad372"..L["Tier 3 Sets"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_7.lootpage="T3Hunter"
	AtlasLootMenuItem_7.container = data.T3HunterC
	AtlasLootMenuItem_7:Show()
	--T35
	AtlasLootMenuItem_8_Name:SetText("|cffaad372"..L["Tower of Karazhan Sets"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_8.lootpage="T35Hunter"
	AtlasLootMenuItem_8.container = data.T35HunterC
	AtlasLootMenuItem_8:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootShamanSetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Shaman Sets"])
	--T0
	AtlasLootMenuItem_1_Name:SetText("|cff2773ff"..L["Tier 0/0.5 Sets"])
	AtlasLootMenuItem_1_Extra:SetText("")
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_1.lootpage="T0Shaman"
	AtlasLootMenuItem_1.container = data.T0ShamanC
	AtlasLootMenuItem_1:Show()
	--T1
	AtlasLootMenuItem_2_Name:SetText("|cff2773ff"..L["Tier 1 Sets"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_2.lootpage="T1Shaman"
	AtlasLootMenuItem_2.container = data.T1ShamanC
	AtlasLootMenuItem_2:Show()
	--ZG
	AtlasLootMenuItem_3_Name:SetText("|cff2773ff"..L["Zul'Gurub Sets"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_3.lootpage="ZGShaman"
	AtlasLootMenuItem_3.container = data.ZGShamanC
	AtlasLootMenuItem_3:Show()
	--AQ20
	AtlasLootMenuItem_4_Name:SetText("|cff2773ff"..L["Ruins of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_4.lootpage="AQ20Shaman"
	AtlasLootMenuItem_4.container = data.AQ20ShamanC
	AtlasLootMenuItem_4:Show()
	--T2
	AtlasLootMenuItem_5_Name:SetText("|cff2773ff"..L["Tier 2 Sets"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_5.lootpage="T2Shaman"
	AtlasLootMenuItem_5.container = data.T2ShamanC
	AtlasLootMenuItem_5:Show()
	--AQ40
	AtlasLootMenuItem_6_Name:SetText("|cff2773ff"..L["Temple of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_6.lootpage="AQ40Shaman"
	AtlasLootMenuItem_6.container = data.AQ40ShamanC
	AtlasLootMenuItem_6:Show()
	--T3
	AtlasLootMenuItem_7_Name:SetText("|cff2773ff"..L["Tier 3 Sets"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_7.lootpage="T3Shaman"
	AtlasLootMenuItem_7.container = data.T3ShamanC
	AtlasLootMenuItem_7:Show()
	--T35
	AtlasLootMenuItem_8_Name:SetText("|cff2773ff"..L["Tower of Karazhan Sets"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_8.lootpage="T35Shaman"
	AtlasLootMenuItem_8.container = data.T35ShamanC
	AtlasLootMenuItem_8:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootPaladinSetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Paladin Sets"])
	--T0
	AtlasLootMenuItem_1_Name:SetText("|cfff48cba"..L["Tier 0/0.5 Sets"])
	AtlasLootMenuItem_1_Extra:SetText("")
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_1.lootpage="T0Paladin"
	AtlasLootMenuItem_1.container = data.T0PaladinC
	AtlasLootMenuItem_1:Show()
	--T1
	AtlasLootMenuItem_2_Name:SetText("|cfff48cba"..L["Tier 1 Sets"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_2.lootpage="T1Paladin"
	AtlasLootMenuItem_2.container = data.T1PaladinC
	AtlasLootMenuItem_2:Show()
	--ZG
	AtlasLootMenuItem_3_Name:SetText("|cfff48cba"..L["Zul'Gurub Sets"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_3.lootpage="ZGPaladin"
	AtlasLootMenuItem_3.container = data.ZGPaladinC
	AtlasLootMenuItem_3:Show()
	--AQ20
	AtlasLootMenuItem_4_Name:SetText("|cfff48cba"..L["Ruins of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_4.lootpage="AQ20Paladin"
	AtlasLootMenuItem_4.container = data.AQ20PaladinC
	AtlasLootMenuItem_4:Show()
	--T2
	AtlasLootMenuItem_5_Name:SetText("|cfff48cba"..L["Tier 2 Sets"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_5.lootpage="T2Paladin"
	AtlasLootMenuItem_5.container = data.T2PaladinC
	AtlasLootMenuItem_5:Show()
	--AQ40
	AtlasLootMenuItem_6_Name:SetText("|cfff48cba"..L["Temple of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_6.lootpage="AQ40Paladin"
	AtlasLootMenuItem_6.container = data.AQ40PaladinC
	AtlasLootMenuItem_6:Show()
	--T3
	AtlasLootMenuItem_7_Name:SetText("|cfff48cba"..L["Tier 3 Sets"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_7.lootpage="T3Paladin"
	AtlasLootMenuItem_7.container = data.T3PaladinC
	AtlasLootMenuItem_7:Show()
	--T35
	AtlasLootMenuItem_8_Name:SetText("|cfff48cba"..L["Tower of Karazhan Sets"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_8.lootpage="T35Paladin"
	AtlasLootMenuItem_8.container = data.T35PaladinC
	AtlasLootMenuItem_8:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootWarriorSetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Warrior Sets"])
	--T0Warrior
	AtlasLootMenuItem_1_Name:SetText("|cffc69b6d"..L["Tier 0/0.5 Sets"])
	AtlasLootMenuItem_1_Extra:SetText("")
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_1.lootpage="T0Warrior"
	AtlasLootMenuItem_1.container = data.T0WarriorC
	AtlasLootMenuItem_1:Show()
	--T1Warrior
	AtlasLootMenuItem_2_Name:SetText("|cffc69b6d"..L["Tier 1 Sets"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_2.lootpage="T1Warrior"
	AtlasLootMenuItem_2.container = data.T1WarriorC
	AtlasLootMenuItem_2:Show()
	--ZGWarrior
	AtlasLootMenuItem_3_Name:SetText("|cffc69b6d"..L["Zul'Gurub Sets"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_3.lootpage="ZGWarrior"
	AtlasLootMenuItem_3.container = data.ZGWarriorC
	AtlasLootMenuItem_3:Show()
	--AQ20Warrior
	AtlasLootMenuItem_4_Name:SetText("|cffc69b6d"..L["Ruins of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_4.lootpage="AQ20Warrior"
	AtlasLootMenuItem_4.container = data.AQ20WarriorC
	AtlasLootMenuItem_4:Show()
	--T2Warrior
	AtlasLootMenuItem_5_Name:SetText("|cffc69b6d"..L["Tier 2 Sets"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_5.lootpage="T2Warrior"
	AtlasLootMenuItem_5.container = data.T2WarriorC
	AtlasLootMenuItem_5:Show()
	--AQ40Warrior
	AtlasLootMenuItem_6_Name:SetText("|cffc69b6d"..L["Temple of Ahn'Qiraj Sets"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_6.lootpage="AQ40Warrior"
	AtlasLootMenuItem_6.container = data.AQ40WarriorC
	AtlasLootMenuItem_6:Show()
	--T3Warrior
	AtlasLootMenuItem_7_Name:SetText("|cffc69b6d"..L["Tier 3 Sets"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_7.lootpage="T3Warrior"
	AtlasLootMenuItem_7.container = data.T3WarriorC
	AtlasLootMenuItem_7:Show()
	--T35Warrior
	AtlasLootMenuItem_8_Name:SetText("|cffc69b6d"..L["Tower of Karazhan Sets"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_8.lootpage="T35Warrior"
	AtlasLootMenuItem_8.container = data.T35WarriorC
	AtlasLootMenuItem_8:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end
	
function AtlasLootPRE60SetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Pre 60 Sets"])
	--The Deadmines - Defias Leather
	AtlasLootMenuItem_2_Name:SetText(BIS["Defias Leather"])
	AtlasLootMenuItem_2_Extra:SetText(ORANGE..BZ["The Deadmines"])
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Pants_12")
	AtlasLootMenuItem_2.lootpage="DEADMINES"
	AtlasLootMenuItem_2.container = data.DeadminesC
	AtlasLootMenuItem_2:Show()
	--Wailing Caverns - Embrace of the Viper
	AtlasLootMenuItem_3_Name:SetText(BIS["Embrace of the Viper"])
	AtlasLootMenuItem_3_Extra:SetText(ORANGE..BZ["Wailing Caverns"])
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Shirt_16")
	AtlasLootMenuItem_3.lootpage="WAILING"
	AtlasLootMenuItem_3.container = data.WailingC
	AtlasLootMenuItem_3:Show()
	--Scarlet Monastery - Chain of the Scarlet Crusade
	AtlasLootMenuItem_4_Name:SetText(BIS["Chain of the Scarlet Crusade"])
	AtlasLootMenuItem_4_Extra:SetText(ORANGE..BZ["Scarlet Monastery"])
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Gauntlets_19")
	AtlasLootMenuItem_4.lootpage="SCARLET"
	AtlasLootMenuItem_4.container = data.ScarletC
	AtlasLootMenuItem_4:Show()
	--Gilneas City - Greymane Armor
	AtlasLootMenuItem_5_Name:SetText("Greymane Armor")
	AtlasLootMenuItem_5_Extra:SetText(ORANGE.."Greymane City")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\inv_helmet_02")
	AtlasLootMenuItem_5.lootpage="GreymaneArmor"
	AtlasLootMenuItem_5.container = data.GilneasC
	AtlasLootMenuItem_5:Show()
	--Hateforge Quarry - Incendosaur Skin Armor
	AtlasLootMenuItem_6_Name:SetText("Incendosaur Skin Armor")
	AtlasLootMenuItem_6_Extra:SetText(ORANGE.."Hateforge Quarry")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\INV_Shoulder_23")
	AtlasLootMenuItem_6.lootpage="IncendosaurSkinArmor"
	AtlasLootMenuItem_6.container = data.HateforgeC
	AtlasLootMenuItem_6:Show()
	--Blackrock Depths - The Gladiator
	AtlasLootMenuItem_7_Name:SetText(BIS["The Gladiator"])
	AtlasLootMenuItem_7_Extra:SetText(ORANGE..BZ["Blackrock Depths"])
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Helmet_01")
	AtlasLootMenuItem_7.lootpage="BLACKROCKD"
	AtlasLootMenuItem_7.container = data.BlackrockdC
	AtlasLootMenuItem_7:Show()
	--Ironweave Battlesuit
	AtlasLootMenuItem_8_Name:SetText(BIS["Ironweave Battlesuit"])
	AtlasLootMenuItem_8_Extra:SetText(ORANGE..L["Various Locations"])
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Boots_Cloth_05")
	AtlasLootMenuItem_8.lootpage="IRONWEAVE"
	AtlasLootMenuItem_8.container = data.IronweaveC
	AtlasLootMenuItem_8:Show()
	--Stratholme - The Postmaster
	AtlasLootMenuItem_9_Name:SetText(BIS["The Postmaster"])
	AtlasLootMenuItem_9_Extra:SetText(ORANGE..BZ["Stratholme"])
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\INV_Boots_02")
	AtlasLootMenuItem_9.lootpage="STRAT"
	AtlasLootMenuItem_9.container = data.StratC
	AtlasLootMenuItem_9:Show()
	--Scholomance - Cloth - Necropile Raiment
	AtlasLootMenuItem_10_Name:SetText(BIS["Necropile Raiment"])
	AtlasLootMenuItem_10_Extra:SetText(ORANGE..BZ["Scholomance"])
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\INV_Shoulder_02")
	AtlasLootMenuItem_10.lootpage="ScholoCloth"
	AtlasLootMenuItem_10.container = data.ScholoClothC
	AtlasLootMenuItem_10:Show()
	--Scholomance - Leather - Cadaverous Garb
	AtlasLootMenuItem_11_Name:SetText(BIS["Cadaverous Garb"])
	AtlasLootMenuItem_11_Extra:SetText(ORANGE..BZ["Scholomance"])
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\INV_Belt_16")
	AtlasLootMenuItem_11.lootpage="ScholoLeather"
	AtlasLootMenuItem_11.container = data.ScholoLeatherC
	AtlasLootMenuItem_11:Show()
	--Scholomance - Mail - Bloodmail Regalia
	AtlasLootMenuItem_12_Name:SetText(BIS["Bloodmail Regalia"])
	AtlasLootMenuItem_12_Extra:SetText(ORANGE..BZ["Scholomance"])
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\INV_Gauntlets_26")
	AtlasLootMenuItem_12.lootpage="ScholoMail"
	AtlasLootMenuItem_12.container = data.ScholoMailC
	AtlasLootMenuItem_12:Show()
	--Scholomance - Plate - Deathbone Guardian
	AtlasLootMenuItem_13_Name:SetText(BIS["Deathbone Guardian"])
	AtlasLootMenuItem_13_Extra:SetText(ORANGE..BZ["Scholomance"])
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\INV_Belt_12")
	AtlasLootMenuItem_13.lootpage="ScholoPlate"
	AtlasLootMenuItem_13.container = data.ScholoPlateC
	AtlasLootMenuItem_13:Show()
	--Scourge Invasion
	AtlasLootMenuItem_14_Name:SetText(L["Scourge Invasion"])
	AtlasLootMenuItem_14_Extra:SetText(ORANGE..L["Various Locations"])
	AtlasLootMenuItem_14_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Talisman_13")
	AtlasLootMenuItem_14.lootpage="ScourgeInvasion"
	AtlasLootMenuItem_14.container = data.ScourgeInvasionC
	AtlasLootMenuItem_14:Show()
	--Spider's Kiss
	AtlasLootMenuItem_17_Name:SetText(BIS["Spider's Kiss"])
	AtlasLootMenuItem_17_Extra:SetText(ORANGE..BZ["Lower Blackrock Spire"])
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Weapon_ShortBlade_16")
	AtlasLootMenuItem_17.lootpage="SpiderKiss"
	AtlasLootMenuItem_17.container = data.SpiderKissC
	AtlasLootMenuItem_17:Show()
	--Dal'Rend's Arms
	AtlasLootMenuItem_18_Name:SetText(BIS["Dal'Rend's Arms"])
	AtlasLootMenuItem_18_Extra:SetText(ORANGE..BZ["Upper Blackrock Spire"])
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Sword_43")
	AtlasLootMenuItem_18.lootpage="DalRend"
	AtlasLootMenuItem_18.container = data.DalRendC
	AtlasLootMenuItem_18:Show()
	--Zul'Gurub Rings
	AtlasLootMenuItem_19_Name:SetText(L["Zul'Gurub Rings"])
	AtlasLootMenuItem_19_Extra:SetText(ORANGE..BZ["Zul'Gurub"])
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\INV_Bijou_Orange")
	AtlasLootMenuItem_19.lootpage="ZGRings"
	AtlasLootMenuItem_19.container = data.ZGRingsC
	AtlasLootMenuItem_19:Show()
	--Primal Blessing
	AtlasLootMenuItem_20_Name:SetText(BIS["Primal Blessing"])
	AtlasLootMenuItem_20_Extra:SetText(ORANGE..BZ["Zul'Gurub"])
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\INV_Weapon_Hand_01")
	AtlasLootMenuItem_20.lootpage="PrimalBlessing"
	AtlasLootMenuItem_20.container = data.PrimalBlessingC
	AtlasLootMenuItem_20:Show()
	--The Twin Blades of Hakkari
	AtlasLootMenuItem_21_Name:SetText(BIS["The Twin Blades of Hakkari"])
	AtlasLootMenuItem_21_Extra:SetText(ORANGE..BZ["Zul'Gurub"])
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Sword_55")
	AtlasLootMenuItem_21.lootpage="HakkariBlades"
	AtlasLootMenuItem_21.container = data.HakkariBladesC
	AtlasLootMenuItem_21:Show()
	--Shard of the Gods
	AtlasLootMenuItem_22_Name:SetText(BIS["Shard of the Gods"])
	AtlasLootMenuItem_22_Extra:SetText(ORANGE..L["Various Locations"])
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\INV_Misc_MonsterScales_15")
	AtlasLootMenuItem_22.lootpage="ShardOfGods"
	AtlasLootMenuItem_22.container = data.ShardOfGodsC
	AtlasLootMenuItem_22:Show()
	--Spirit of Eskhandar
	AtlasLootMenuItem_23_Name:SetText(BIS["Spirit of Eskhandar"])
	AtlasLootMenuItem_23_Extra:SetText(ORANGE..L["Various Locations"])
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\INV_Misc_MonsterClaw_04")
	AtlasLootMenuItem_23.lootpage="SpiritofEskhandar"
	AtlasLootMenuItem_23.container = data.SpiritofEskhandarC
	AtlasLootMenuItem_23:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootZGSetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Zul'Gurub Sets"])
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="ZGPriest"
	AtlasLootMenuItem_3.container = data.ZGPriestC
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="ZGMage"
	AtlasLootMenuItem_4.container = data.ZGMageC
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="ZGWarlock"
	AtlasLootMenuItem_5.container = data.ZGWarlockC
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="ZGRogue"
	AtlasLootMenuItem_6.container = data.ZGRogueC
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="ZGDruid"
	AtlasLootMenuItem_7.container = data.ZGDruidC
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="ZGHunter"
	AtlasLootMenuItem_18.container = data.ZGHunterC
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="ZGShaman"
	AtlasLootMenuItem_19.container = data.ZGShamanC
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="ZGPaladin"
	AtlasLootMenuItem_20.container = data.ZGPaladinC
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="ZGWarrior"
	AtlasLootMenuItem_21.container = data.ZGWarriorC
	AtlasLootMenuItem_21:Show()
	--Zul'Gurub Rings
	AtlasLootMenuItem_23_Name:SetText(L["Zul'Gurub Rings"])
	AtlasLootMenuItem_23_Extra:SetText("")
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Ring_46")
	AtlasLootMenuItem_23.lootpage = "ZGRings"
	AtlasLootMenuItem_23.container = data.ZGRingsC
	AtlasLootMenuItem_23:Show()
	--Primal Blessing
	AtlasLootMenuItem_24_Name:SetText(L["Primal Blessing"])
	AtlasLootMenuItem_24_Extra:SetText("")
	AtlasLootMenuItem_24_Icon:SetTexture("Interface\\Icons\\INV_Weapon_Hand_01")
	AtlasLootMenuItem_24.lootpage = "PrimalBlessing"
	AtlasLootMenuItem_24.container = data.PrimalBlessingC
	AtlasLootMenuItem_24:Show()
	--The Twin Blades of Hakkari
	AtlasLootMenuItem_25_Name:SetText(L["The Twin Blades of Hakkari"])
	AtlasLootMenuItem_25_Extra:SetText("")
	AtlasLootMenuItem_25_Icon:SetTexture("Interface\\Icons\\INV_Sword_55")
	AtlasLootMenuItem_25.lootpage = "HakkariBlades"
	AtlasLootMenuItem_25.container = data.HakkariBladesC
	AtlasLootMenuItem_25:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootAQ40SetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Temple of Ahn'Qiraj Sets"])
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="AQ40Priest"
	AtlasLootMenuItem_3.container = data.AQ40PriestC
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="AQ40Mage"
	AtlasLootMenuItem_4.container = data.AQ40MageC
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="AQ40Warlock"
	AtlasLootMenuItem_5.container = data.AQ40WarlockC
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="AQ40Rogue"
	AtlasLootMenuItem_6.container = data.AQ40RogueC
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="AQ40Druid"
	AtlasLootMenuItem_7.container = data.AQ40DruidC
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="AQ40Hunter"
	AtlasLootMenuItem_18.container = data.AQ40HunterC
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="AQ40Shaman"
	AtlasLootMenuItem_19.container = data.AQ40ShamanC
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="AQ40Paladin"
	AtlasLootMenuItem_20.container = data.AQ40PaladinC
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="AQ40Warrior"
	AtlasLootMenuItem_21.container = data.AQ40WarriorC
	AtlasLootMenuItem_21:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootAQ20SetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Ruins of Ahn'Qiraj Sets"])
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="AQ20Priest"
	AtlasLootMenuItem_3.container = data.AQ20PriestC
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="AQ20Mage"
	AtlasLootMenuItem_4.container = data.AQ20MageC
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="AQ20Warlock"
	AtlasLootMenuItem_5.container = data.AQ20WarlockC
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="AQ20Rogue"
	AtlasLootMenuItem_6.container = data.AQ20RogueC
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="AQ20Druid"
	AtlasLootMenuItem_7.container = data.AQ20DruidC
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="AQ20Hunter"
	AtlasLootMenuItem_18.container = data.AQ20HunterC
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="AQ20Shaman"
	AtlasLootMenuItem_19.container = data.AQ20ShamanC
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="AQ20Paladin"
	AtlasLootMenuItem_20.container = data.AQ20PaladinC
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="AQ20Warrior"
	AtlasLootMenuItem_21.container = data.AQ20WarriorC
	AtlasLootMenuItem_21:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootT0SetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Tier 0/0.5 Sets"])
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="T0Priest"
	AtlasLootMenuItem_3.container = data.T0PriestC
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="T0Mage"
	AtlasLootMenuItem_4.container = data.T0MageC
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="T0Warlock"
	AtlasLootMenuItem_5.container = data.T0WarlockC
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="T0Rogue"
	AtlasLootMenuItem_6.container = data.T0RogueC
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="T0Druid"
	AtlasLootMenuItem_7.container = data.T0DruidC
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="T0Hunter"
	AtlasLootMenuItem_18.container = data.T0HunterC
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="T0Shaman"
	AtlasLootMenuItem_19.container = data.T0ShamanC
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="T0Paladin"
	AtlasLootMenuItem_20.container = data.T0PaladinC
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="T0Warrior"
	AtlasLootMenuItem_21.container = data.T0WarriorC
	AtlasLootMenuItem_21:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootT1SetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Tier 1 Sets"])
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="T1Priest"
	AtlasLootMenuItem_3.container = data.T1PriestC
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="T1Mage"
	AtlasLootMenuItem_4.container = data.T1MageC
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="T1Warlock"
	AtlasLootMenuItem_5.container = data.T1WarlockC
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="T1Rogue"
	AtlasLootMenuItem_6.container = data.T1RogueC
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="T1Druid"
	AtlasLootMenuItem_7.container = data.T1DruidC
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="T1Hunter"
	AtlasLootMenuItem_18.container = data.T1HunterC
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="T1Shaman"
	AtlasLootMenuItem_19.container = data.T1ShamanC
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="T1Paladin"
	AtlasLootMenuItem_20.container = data.T1PaladinC
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="T1Warrior"
	AtlasLootMenuItem_21.container = data.T1WarriorC
	AtlasLootMenuItem_21:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootT2SetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Tier 2 Sets"])
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="T2Priest"
	AtlasLootMenuItem_3.container = data.T2PriestC
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="T2Mage"
	AtlasLootMenuItem_4.container = data.T2MageC
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="T2Warlock"
	AtlasLootMenuItem_5.container = data.T2WarlockC
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="T2Rogue"
	AtlasLootMenuItem_6.container = data.T2RogueC
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="T2Druid"
	AtlasLootMenuItem_7.container = data.T2DruidC
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="T2Hunter"
	AtlasLootMenuItem_18.container = data.T2HunterC
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="T2Shaman"
	AtlasLootMenuItem_19.container = data.T2ShamanC
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="T2Paladin"
	AtlasLootMenuItem_20.container = data.T2PaladinC
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.container = data.T2WarriorC
	AtlasLootMenuItem_21.lootpage="T2Warrior"
	AtlasLootMenuItem_21:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootT3SetMenu()
	AtlasLoot_PrepMenu("SETMENU", L["Tier 3 Sets"])
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="T3Priest"
	AtlasLootMenuItem_3.container = data.T3PriestC
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="T3Mage"
	AtlasLootMenuItem_4.container = data.T3MageC
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="T3Warlock"
	AtlasLootMenuItem_5.container = data.T3WarlockC
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="T3Rogue"
	AtlasLootMenuItem_6.container = data.T3RogueC
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="T3Druid"
	AtlasLootMenuItem_7.container = data.T3DruidC
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="T3Hunter"
	AtlasLootMenuItem_18.container = data.T3HunterC
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="T3Shaman"
	AtlasLootMenuItem_19.container = data.T3ShamanC
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="T3Paladin"
	AtlasLootMenuItem_20.container = data.T3PaladinC
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="T3Warrior"
	AtlasLootMenuItem_21.container = data.T3WarriorC
	AtlasLootMenuItem_21:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end

function AtlasLootUKSetMenu()
	AtlasLoot_PrepMenu("SETMENU", "|cffFFFFFF"..L["Tower of Karazhan Sets"])
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="T35Priest"
	AtlasLootMenuItem_3.container = data.T35PriestC
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="T35Mage"
	AtlasLootMenuItem_4.container = data.T35MageC
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="T35Warlock"
	AtlasLootMenuItem_5.container = data.T35WarlockC
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="T35Rogue"
	AtlasLootMenuItem_6.container = data.T35RogueC
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="T35Druid"
	AtlasLootMenuItem_7.container = data.T35DruidC
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="T35Hunter"
	AtlasLootMenuItem_18.container = data.T35HunterC
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="T35Shaman"
	AtlasLootMenuItem_19.container = data.T35ShamanC
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="T35Paladin"
	AtlasLootMenuItem_20.container = data.T35PaladinC
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="T35Warrior"
	AtlasLootMenuItem_21.container = data.T35WarriorC
	AtlasLootMenuItem_21:Show()
	for i = 1, 30 do
		local button = _G["AtlasLootMenuItem_" .. i]
		button.dataSource = AtlasLoot_GetDataSource(button.lootpage)
		if button.container then
			_G["AtlasLootMenuItem_"..i.."Border"]:Show()
		end
	end
end