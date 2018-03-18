local _G = getfenv()
local L = AceLibrary("AceLocale-2.2"):new("AtlasLoot")
local BC = AceLibrary("Babble-Class-2.2")
local BZ = AceLibrary("Babble-Zone-2.2")

function AtlasLootPvPMenu()
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
	AtlasLootMenuItem_8_Extra:SetText("|cffFF8400"..L["Level 60"])
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Helmet_05")
	AtlasLootMenuItem_8.lootpage="PVPSET"
	AtlasLootMenuItem_8:Show()
	--PvP Accessories
	AtlasLootMenuItem_9_Name:SetText(L["PvP Accessories"])
	AtlasLootMenuItem_9_Extra:SetText("|cffFF8400"..L["Level 60"])
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Talisman_09")
	AtlasLootMenuItem_9.lootpage="PvP60Accessories1"
	AtlasLootMenuItem_9:Show()
	-- Warsong Gulch Rewards
	AtlasLootMenuItem_17_Name:SetText(BZ["Warsong Gulch"])
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_17.lootpage="WSGRepMenu"
	AtlasLootMenuItem_17:Show()
	--Weapons
	AtlasLootMenuItem_23_Name:SetText(L["Rank 14 Weapons"])
	AtlasLootMenuItem_23_Extra:SetText("|cffFF8400"..L["Level 60"])
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\INV_Sword_11")
	AtlasLootMenuItem_23.lootpage="PVPWeapons1"
	AtlasLootMenuItem_23:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["PvP Rewards"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLootWSGRepMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "PVPMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Friendly
	AtlasLootMenuItem_2_Name:SetText(L["Friendly Reputation Rewards"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_2.lootpage="WSGRepFriendly"
	AtlasLootMenuItem_2:Show()
	--Honored
AtlasLootMenuItem_3_Name:SetText(L["Honored Reputation Rewards"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_3.lootpage="WSGRepHonored5059"
	AtlasLootMenuItem_3:Show()
	--Revered
	AtlasLootMenuItem_4_Name:SetText(L["Revered Reputation Rewards"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_4.lootpage="WSGRepRevered5059"
	AtlasLootMenuItem_4:Show()
	--Exalted
	AtlasLootMenuItem_5_Name:SetText(L["Exalted Reputation Rewards"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Misc_Rune_07")
	AtlasLootMenuItem_5.lootpage="WSGRepExalted60"
	AtlasLootMenuItem_5:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BZ["Warsong Gulch"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLootABRepMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "PVPMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Friendly
	AtlasLootMenuItem_2_Name:SetText(L["Friendly Reputation Rewards"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_2.lootpage="ABRepFriendly"
	AtlasLootMenuItem_2:Show()
	--Honored
	AtlasLootMenuItem_3_Name:SetText(L["Honored Reputation Rewards"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_3.lootpage="ABRepHonored5059"
	AtlasLootMenuItem_3:Show()
	--Revered
	AtlasLootMenuItem_4_Name:SetText(L["Revered Reputation Rewards"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_4.lootpage="ABRepRevered5059"
	AtlasLootMenuItem_4:Show()
	--Exalted
	AtlasLootMenuItem_5_Name:SetText(L["Exalted Reputation Rewards"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07")
	AtlasLootMenuItem_5.lootpage="ABRepExalted"
	AtlasLootMenuItem_5:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BZ["Arathi Basin"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLootAVRepMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "PVPMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
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
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BZ["Alterac Valley"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLootPVPSetMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "PVPMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
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
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["PvP Armor Sets"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end