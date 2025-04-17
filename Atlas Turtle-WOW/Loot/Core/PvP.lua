local _G = getfenv()
local L = AceLibrary("AceLocale-2.2"):new("AtlasLoot")
local BC = AceLibrary("Babble-Class-2.2")
local BZ = AceLibrary("Babble-Zone-2.2")
local RED = "|cffff0000"
local ORANGE = "|cffFF8400"

function AtlasLootPvPMenu()
	AtlasLoot_PrepMenu(nil, L["PvP Rewards"])
	AtlasLootCharDB.LastBoss = "PVPMENU"
	AtlasLootCharDB.LastBossText = L["PvP Rewards"]
	-- Alterac Valley Rewards
	AtlasLootMenuItem_2_Name:SetText(BZ["Alterac Valley"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_21")
	AtlasLootMenuItem_2.lootpage="AVRepMenu"
	AtlasLootMenuItem_2:Show()
	-- Arathi Basin Rewards
	AtlasLootMenuItem_3_Name:SetText(BZ["Arathi Basin"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_3.lootpage="ABRepMenu"
	AtlasLootMenuItem_3:Show()
	--PvP Mounts
	AtlasLootMenuItem_6_Name:SetText(L["PvP Mounts"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_Mount_RidingHorse")
	AtlasLootMenuItem_6.lootpage="PvPMountsPvP"
	AtlasLootMenuItem_6:Show()
	--PvP
	AtlasLootMenuItem_8_Name:SetText(L["PvP Armor Sets"])
	AtlasLootMenuItem_8_Extra:SetText(ORANGE..L["Rank 7-13"])
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Helmet_05")
	AtlasLootMenuItem_8.lootpage="PVPSET"
	AtlasLootMenuItem_8:Show()
	--PvP Accessories
	AtlasLootMenuItem_9_Name:SetText(L["PvP Accessories"])
	AtlasLootMenuItem_9_Extra:SetText(ORANGE..L["Rank 2-9"])
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Talisman_09")
	AtlasLootMenuItem_9.lootpage="PvP60Accessories1"
	AtlasLootMenuItem_9:Show()
	-- Warsong Gulch Rewards
	AtlasLootMenuItem_17_Name:SetText(BZ["Warsong Gulch"])
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_17.lootpage="WSGRepMenu"
	AtlasLootMenuItem_17:Show()
	-- Blood Ring Rewards
	AtlasLootMenuItem_18_Name:SetText(BZ["Blood Ring"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\inv_jewelry_ring_04")
	AtlasLootMenuItem_18.lootpage="BRRepMenu"
	AtlasLootMenuItem_18:Show()
	--Weapons
	AtlasLootMenuItem_23_Name:SetText(L["PvP Weapons"])
	AtlasLootMenuItem_23_Extra:SetText(ORANGE..L["Rank 14"])
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\INV_Sword_11")
	AtlasLootMenuItem_23.lootpage="PVPWeapons1"
	AtlasLootMenuItem_23:Show()
end

function AtlasLootBRRepMenu()
	AtlasLoot_PrepMenu("PVPMENU", BZ["Blood Ring"])
	--Friendly
	AtlasLootMenuItem_2_Name:SetText("Friendly Reputation Rewards")
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\inv_jewelry_ring_04")
	AtlasLootMenuItem_2.lootpage="BRRepFriendly"
	AtlasLootMenuItem_2:Show()
	--Honored
	AtlasLootMenuItem_3_Name:SetText("Honored Reputation Rewards")
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\inv_jewelry_ring_04")
	AtlasLootMenuItem_3.lootpage="BRRepHonored"
	AtlasLootMenuItem_3:Show()
	--Revered
	AtlasLootMenuItem_4_Name:SetText("Revered Reputation Rewards")
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\inv_jewelry_ring_04")
	AtlasLootMenuItem_4.lootpage="BRRepRevered"
	AtlasLootMenuItem_4:Show()
	--Exalted
	AtlasLootMenuItem_5_Name:SetText("Exalted Reputation Rewards")
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\inv_jewelry_ring_04")
	AtlasLootMenuItem_5.lootpage="BRRepExalted"
	AtlasLootMenuItem_5:Show()
	--Token of Blood
	AtlasLootMenuItem_6_Name:SetText("Token of Blood Rewards")
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\inv_jewelry_talisman_04")
	AtlasLootMenuItem_6.lootpage="BRRepTokens"
	AtlasLootMenuItem_6:Show()
end

function AtlasLootWSGRepMenu()
	AtlasLoot_PrepMenu("PVPMENU", BZ["Warsong Gulch"])

	--Friendly Header
	AtlasLootMenuItem_2_Name:SetText(L["Friendly Reputation Rewards"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_2.isheader = true
	AtlasLootMenuItem_2:Show()
	--Friendly 20-29
	AtlasLootMenuItem_3_Name:SetText("20-29")
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_3.lootpage="WSGRepFriendly2029"
	AtlasLootMenuItem_3:Show()
	--Friendly 30-39
	AtlasLootMenuItem_4_Name:SetText("30-39")
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_4.lootpage="WSGRepFriendly3039"
	AtlasLootMenuItem_4:Show()
	--Friendly 40-49
	AtlasLootMenuItem_5_Name:SetText("40-49")
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_5.lootpage="WSGRepFriendly4049"
	AtlasLootMenuItem_5:Show()
	--Honored Header
	AtlasLootMenuItem_7_Name:SetText(L["Honored Reputation Rewards"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_7.isheader = true
	AtlasLootMenuItem_7:Show()
	--Honored 10-19
	AtlasLootMenuItem_8_Name:SetText("10-19")
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_8.lootpage="WSGRepHonored1019"
	AtlasLootMenuItem_8:Show()
	--Honored 20-29
	AtlasLootMenuItem_9_Name:SetText("20-29")
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_9.lootpage="WSGRepHonored2029"
	AtlasLootMenuItem_9:Show()
	--Honored 30-39
	AtlasLootMenuItem_10_Name:SetText("30-39")
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_10.lootpage="WSGRepHonored3039"
	AtlasLootMenuItem_10:Show()
	--Honored 40-49
	AtlasLootMenuItem_11_Name:SetText("40-49")
	AtlasLootMenuItem_11_Extra:SetText("")
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_11.lootpage="WSGRepHonored4049"
	AtlasLootMenuItem_11:Show()
	--Honored 50-59
	AtlasLootMenuItem_12_Name:SetText("50-59")
	AtlasLootMenuItem_12_Extra:SetText("")
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_12.lootpage="WSGRepHonored5059"
	AtlasLootMenuItem_12:Show()
	--Exalted Header
	AtlasLootMenuItem_17_Name:SetText(L["Exalted Reputation Rewards"])
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_17.isheader = true
	AtlasLootMenuItem_17:Show()
	--Exalted 40-49
	AtlasLootMenuItem_18_Name:SetText("40-49")
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_18.lootpage="WSGRepExalted4049"
	AtlasLootMenuItem_18:Show()
	--Exalted 50-59
	AtlasLootMenuItem_19_Name:SetText("50-59")
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_19.lootpage="WSGRepExalted5059"
	AtlasLootMenuItem_19:Show()
	--Exalted 60-60
	AtlasLootMenuItem_20_Name:SetText("60")
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_20.lootpage="WSGRepExalted60"
	AtlasLootMenuItem_20:Show()
	--Revered Header
	AtlasLootMenuItem_22_Name:SetText(L["Revered Reputation Rewards"])
	AtlasLootMenuItem_22_Extra:SetText("")
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_22.isheader = true
	AtlasLootMenuItem_22:Show()
	--Revered 10-19
	AtlasLootMenuItem_23_Name:SetText("10-19")
	AtlasLootMenuItem_23_Extra:SetText("")
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_23.lootpage="WSGRepRevered1019"
	AtlasLootMenuItem_23:Show()
	--Revered 20-29
	AtlasLootMenuItem_24_Name:SetText("20-29")
	AtlasLootMenuItem_24_Extra:SetText("")
	AtlasLootMenuItem_24_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_24.lootpage="WSGRepRevered2029"
	AtlasLootMenuItem_24:Show()
	--Revered 30-39
	AtlasLootMenuItem_25_Name:SetText("30-39")
	AtlasLootMenuItem_25_Extra:SetText("")
	AtlasLootMenuItem_25_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_25.lootpage="WSGRepRevered3039"
	AtlasLootMenuItem_25:Show()
	--Revered 40-49
	AtlasLootMenuItem_26_Name:SetText("40-49")
	AtlasLootMenuItem_26_Extra:SetText("")
	AtlasLootMenuItem_26_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_26.lootpage="WSGRepRevered4049"
	AtlasLootMenuItem_26:Show()
	--Revered 50-59
	AtlasLootMenuItem_27_Name:SetText("50-59")
	AtlasLootMenuItem_27_Extra:SetText("")
	AtlasLootMenuItem_27_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_27.lootpage="WSGRepRevered5059"
	AtlasLootMenuItem_27:Show()
end

function AtlasLootABRepMenu()
	AtlasLoot_PrepMenu("PVPMENU", BZ["Arathi Basin"])
	--Friendly Header
	AtlasLootMenuItem_2_Name:SetText(L["Friendly Reputation Rewards"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_2.isheader = true
	AtlasLootMenuItem_2:Show()
	--Friendly 20-29
	AtlasLootMenuItem_3_Name:SetText("20-29")
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_3.lootpage="ABRepFriendly2029"
	AtlasLootMenuItem_3:Show()
	--Friendly 30-39
	AtlasLootMenuItem_4_Name:SetText("30-39")
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_4.lootpage="ABRepFriendly3039"
	AtlasLootMenuItem_4:Show()
	--Friendly 40-49
	AtlasLootMenuItem_5_Name:SetText("40-49")
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_5.lootpage="ABRepFriendly4049"
	AtlasLootMenuItem_5:Show()
	--Friendly 50-59
	AtlasLootMenuItem_6_Name:SetText("50-59")
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_6.lootpage="ABRepFriendly5059"
	AtlasLootMenuItem_6:Show()
	--Honored Header
	AtlasLootMenuItem_8_Name:SetText(L["Honored Reputation Rewards"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_8.isheader = true
	AtlasLootMenuItem_8:Show()
	--Honored 20-29
	AtlasLootMenuItem_9_Name:SetText("20-29")
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_9.lootpage="ABRepHonored2029"
	AtlasLootMenuItem_9:Show()
	--Honored 30-39
	AtlasLootMenuItem_10_Name:SetText("30-39")
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_10.lootpage="ABRepHonored3039"
	AtlasLootMenuItem_10:Show()
	--Honored 40-49
	AtlasLootMenuItem_11_Name:SetText("40-49")
	AtlasLootMenuItem_11_Extra:SetText("")
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_11.lootpage="ABRepHonored4049"
	AtlasLootMenuItem_11:Show()
	--Honored 50-59
	AtlasLootMenuItem_12_Name:SetText("50-59")
	AtlasLootMenuItem_12_Extra:SetText("")
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_12.lootpage="ABRepHonored5059"
	AtlasLootMenuItem_12:Show()
	--Exalted Header
	AtlasLootMenuItem_17_Name:SetText(L["Exalted Reputation Rewards"])
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_17.isheader = true
	AtlasLootMenuItem_17:Show()
	--Exalted
	AtlasLootMenuItem_18_Name:SetText("60")
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_18.lootpage="ABRepExalted"
	AtlasLootMenuItem_18:Show()
	--Revered Header
	AtlasLootMenuItem_23_Name:SetText(L["Revered Reputation Rewards"])
	AtlasLootMenuItem_23_Extra:SetText("")
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_23.isheader = true
	AtlasLootMenuItem_23:Show()
	--Revered 20-29
	AtlasLootMenuItem_24_Name:SetText("20-29")
	AtlasLootMenuItem_24_Extra:SetText("")
	AtlasLootMenuItem_24_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_24.lootpage="ABRepRevered2029"
	AtlasLootMenuItem_24:Show()
	--Revered 30-39
	AtlasLootMenuItem_25_Name:SetText("30-39")
	AtlasLootMenuItem_25_Extra:SetText("")
	AtlasLootMenuItem_25_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_25.lootpage="ABRepRevered3039"
	AtlasLootMenuItem_25:Show()
	--Revered 40-49
	AtlasLootMenuItem_26_Name:SetText("40-49")
	AtlasLootMenuItem_26_Extra:SetText("")
	AtlasLootMenuItem_26_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_26.lootpage="ABRepRevered4049"
	AtlasLootMenuItem_26:Show()
	--Revered 50-59
	AtlasLootMenuItem_27_Name:SetText("50-59")
	AtlasLootMenuItem_27_Extra:SetText("")
	AtlasLootMenuItem_27_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_27.lootpage="ABRepRevered5059"
	AtlasLootMenuItem_27:Show()
end

function AtlasLootAVRepMenu()
	AtlasLoot_PrepMenu("PVPMENU", BZ["Alterac Valley"])
	--Friendly
	AtlasLootMenuItem_2_Name:SetText(L["Friendly Reputation Rewards"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_21")
	AtlasLootMenuItem_2.lootpage="AVRepFriendly"
	AtlasLootMenuItem_2:Show()
	--Honored
	AtlasLootMenuItem_3_Name:SetText(L["Honored Reputation Rewards"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_21")
	AtlasLootMenuItem_3.lootpage="AVRepHonored"
	AtlasLootMenuItem_3:Show()
	--Revered
	AtlasLootMenuItem_4_Name:SetText(L["Revered Reputation Rewards"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_21")
	AtlasLootMenuItem_4.lootpage="AVRepRevered"
	AtlasLootMenuItem_4:Show()
	--Exalted
	AtlasLootMenuItem_5_Name:SetText(L["Exalted Reputation Rewards"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_21")
	AtlasLootMenuItem_5.lootpage="AVRepExalted"
	AtlasLootMenuItem_5:Show()
	--Korrak
	AtlasLootMenuItem_6_Name:SetText(L["Korrak the Bloodrager"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_21")
	AtlasLootMenuItem_6.lootpage="AVKorrak"
	AtlasLootMenuItem_6:Show()
	--LokholarIvus
	AtlasLootMenuItem_7_Name:SetText(L["Ivus & Lokholar"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_21")
	AtlasLootMenuItem_7.lootpage="AVLokholarIvus"
	AtlasLootMenuItem_7:Show()
end

function AtlasLootPVPSetMenu()
	AtlasLoot_PrepMenu("PVPMENU", L["PvP Armor Sets"])
	--Priest
	AtlasLootMenuItem_3_Name:SetText("|cffffffff"..BC["Priest"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield")
	AtlasLootMenuItem_3.lootpage="PVPPriest"
	AtlasLootMenuItem_3:Show()
	--Mage
	AtlasLootMenuItem_4_Name:SetText("|cff68ccef"..BC["Mage"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm")
	AtlasLootMenuItem_4.lootpage="PVPMage"
	AtlasLootMenuItem_4:Show()
	--Warlock
	AtlasLootMenuItem_5_Name:SetText("|cff9382c9"..BC["Warlock"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges")
	AtlasLootMenuItem_5.lootpage="PVPWarlock"
	AtlasLootMenuItem_5:Show()
	--Rogue
	AtlasLootMenuItem_6_Name:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Ability_BackStab")
	AtlasLootMenuItem_6.lootpage="PVPRogue"
	AtlasLootMenuItem_6:Show()
	--Druid
	AtlasLootMenuItem_7_Name:SetText("|cffff7c0a"..BC["Druid"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration")
	AtlasLootMenuItem_7.lootpage="PVPDruid"
	AtlasLootMenuItem_7:Show()
	--Hunter
	AtlasLootMenuItem_18_Name:SetText("|cffaad372"..BC["Hunter"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot")
	AtlasLootMenuItem_18.lootpage="PVPHunter"
	AtlasLootMenuItem_18:Show()
	--Shaman
	AtlasLootMenuItem_19_Name:SetText("|cff2773ff"..BC["Shaman"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01")
	AtlasLootMenuItem_19.lootpage="PVPShaman"
	AtlasLootMenuItem_19:Show()
	--Paladin
	AtlasLootMenuItem_20_Name:SetText("|cfff48cba"..BC["Paladin"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight")
	AtlasLootMenuItem_20.lootpage="PVPPaladin"
	AtlasLootMenuItem_20:Show()
	--Warrior
	AtlasLootMenuItem_21_Name:SetText("|cffc69b6d"..BC["Warrior"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shield_05")
	AtlasLootMenuItem_21.lootpage="PVPWarrior"
	AtlasLootMenuItem_21:Show()
end