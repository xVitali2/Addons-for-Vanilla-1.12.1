local _G = getfenv()
local L = AceLibrary("AceLocale-2.2"):new("AtlasLoot")
local BC = AceLibrary("Babble-Class-2.2")
local BS = AceLibrary("Babble-Spell-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2")

local RED = "|cffff0000"
local ORANGE = "|cffFF8400"
local WHITE = "|cffFFFFFF"

function AtlasLoot_CraftingMenu()
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
	--Alchemy
	AtlasLootMenuItem_2_Name:SetText(BS["Alchemy"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy")
	AtlasLootMenuItem_2.lootpage="ALCHEMYMENU"
	AtlasLootMenuItem_2:Show()
	--Blacksmithing
	AtlasLootMenuItem_3_Name:SetText(BS["Blacksmithing"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_3.lootpage="SMITHINGMENU"
	AtlasLootMenuItem_3:Show()
	--Enchanting
	AtlasLootMenuItem_4_Name:SetText(BS["Enchanting"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_4.lootpage="ENCHANTINGMENU"
	AtlasLootMenuItem_4:Show()
	--Engineering
	AtlasLootMenuItem_5_Name:SetText(BS["Engineering"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Trade_Engineering")
	AtlasLootMenuItem_5.lootpage="ENGINEERINGMENU"
	AtlasLootMenuItem_5:Show()
	--Herbalism
	AtlasLootMenuItem_6_Name:SetText(BS["Herbalism"])
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Trade_Herbalism")
	AtlasLootMenuItem_6.lootpage="Herbalism1"
	AtlasLootMenuItem_6:Show()
	--Leatherworking
	AtlasLootMenuItem_7_Name:SetText(BS["Leatherworking"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_7.lootpage="LEATHERWORKINGMENU"
	AtlasLootMenuItem_7:Show()
	--Mining
	AtlasLootMenuItem_8_Name:SetText(BS["Mining"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Trade_Mining")
	AtlasLootMenuItem_8.lootpage="MININGMENU"
	AtlasLootMenuItem_8:Show()
	--Tailoring
	AtlasLootMenuItem_9_Name:SetText(BS["Tailoring"])
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_9.lootpage="TAILORINGMENU"
	AtlasLootMenuItem_9:Show()
	--Jewelcrafting
	AtlasLootMenuItem_10_Name:SetText(BS["Jewelcrafting"])
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_11")
	AtlasLootMenuItem_10.lootpage="JEWELCRAFTMENU"
	AtlasLootMenuItem_10:Show()
	--Cooking
	AtlasLootMenuItem_11_Name:SetText(BS["Cooking"])
	AtlasLootMenuItem_11_Extra:SetText("")
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\INV_Misc_Food_15")
	AtlasLootMenuItem_11.lootpage="COOKINGMENU"
	AtlasLootMenuItem_11:Show()
	--First Aid
	AtlasLootMenuItem_12_Name:SetText(BS["First Aid"])
	AtlasLootMenuItem_12_Extra:SetText("")
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfSacrifice")
	AtlasLootMenuItem_12.lootpage="FirstAid1"
	AtlasLootMenuItem_12:Show()
	--Survival
	AtlasLootMenuItem_13_Name:SetText("Survival")
	AtlasLootMenuItem_13_Extra:SetText("")
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\Trade_Survival")
	AtlasLootMenuItem_13.lootpage="SURVIVALMENU"
	AtlasLootMenuItem_13:Show()
	--Poisons
	AtlasLootMenuItem_15_Name:SetText(BS["Poisons"])
	AtlasLootMenuItem_15_Extra:SetText("|cfffff468"..BC["Rogue"])
	AtlasLootMenuItem_15_Icon:SetTexture("Interface\\Icons\\Trade_BrewPoison")
	AtlasLootMenuItem_15.lootpage="Poisons1"
	AtlasLootMenuItem_15:Show()
	--Crafted Armor Sets
	AtlasLootMenuItem_17_Name:SetText("Crafted Sets (Cloth, Leather)")
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Box_01")
	AtlasLootMenuItem_17.lootpage="CRAFTSET"
	AtlasLootMenuItem_17:Show()
	--Crafted Armor Sets2
	AtlasLootMenuItem_18_Name:SetText("Crafted Sets (Mail, Plate)")
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Box_02")
	AtlasLootMenuItem_18.lootpage="CRAFTSET2"
	AtlasLootMenuItem_18:Show()
	--Crafted Epic Weapons
	AtlasLootMenuItem_20_Name:SetText(L["Crafted Epic Weapons"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\INV_Hammer_Unique_Sulfuras")
	AtlasLootMenuItem_20.lootpage="CraftedWeapons1"
	AtlasLootMenuItem_20:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["Crafting"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end
function AtlasLootCraftedSetMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "CRAFTINGMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Show()
	_G["AtlasLootItemsFrame_NEXT"].lootpage = "CRAFTSET2"
	_G["AtlasLootItemsFrame_PREV"]:Show()
	_G["AtlasLootItemsFrame_PREV"].lootpage = "CRAFTSET2"
	_G["AtlasLootServerQueryButton"]:Hide()
	--Tailoring Header
	AtlasLootMenuItem_1_Name:SetText(RED..BS["Tailoring"])
	AtlasLootMenuItem_1_Extra:SetText("")
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\INV_Chest_Cloth_21")
	AtlasLootMenuItem_1.isheader = true
	AtlasLootMenuItem_1:Show()
	--Augerer's Attire
	AtlasLootMenuItem_3_Name:SetText("Augerer's Attire")
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Helmet_11")
	AtlasLootMenuItem_3.lootpage="AugerersAttire"
	AtlasLootMenuItem_3:Show()
	--Shadoweave
	AtlasLootMenuItem_4_Name:SetText("Shadoweave")
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Helmet_27")
	AtlasLootMenuItem_4.lootpage="ShadoweaveSet"
	AtlasLootMenuItem_4:Show()
	--Diviner's Garments
	AtlasLootMenuItem_5_Name:SetText("Diviner's Garments")
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Helmet_33")
	AtlasLootMenuItem_5.lootpage="DivinersGarments"
	AtlasLootMenuItem_5:Show()
	--Pillager's Garb
	AtlasLootMenuItem_6_Name:SetText("Pillager's Garb")
	AtlasLootMenuItem_6_Extra:SetText("")
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\INV_Helmet_28")
	AtlasLootMenuItem_6.lootpage="PillagersGarb"
	AtlasLootMenuItem_6:Show()
	--Mooncloth Regalia
	AtlasLootMenuItem_7_Name:SetText("Mooncloth Regalia")
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\inv_misc_bandana_01")
	AtlasLootMenuItem_7.lootpage="MoonclothRegalia"
	AtlasLootMenuItem_7:Show()
	--Bloodvine Garb
	AtlasLootMenuItem_8_Name:SetText(BIS["Bloodvine Garb"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Pants_Cloth_14")
	AtlasLootMenuItem_8.lootpage="BloodvineG"
	AtlasLootMenuItem_8:Show()
	--Flarecore Regalia
	AtlasLootMenuItem_9_Name:SetText("Flarecore Regalia")
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\inv_chest_cloth_18")
	AtlasLootMenuItem_9.lootpage="FlarecoreRegalia"
	AtlasLootMenuItem_9:Show()
	--Dreamthread Regalia
	AtlasLootMenuItem_10_Name:SetText("Dreamthread Regalia")
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\INV_Gauntlets_23")
	AtlasLootMenuItem_10.lootpage="DreamthreadRegalia"
	AtlasLootMenuItem_10:Show()
	--Leatherworking Leather Header
	AtlasLootMenuItem_16_Name:SetText(RED..BS["Leatherworking"])
	AtlasLootMenuItem_16_Extra:SetText(WHITE..L["Leather"])
	AtlasLootMenuItem_16_Icon:SetTexture("Interface\\Icons\\INV_Chest_Leather_04")
	AtlasLootMenuItem_16.isheader = true
	AtlasLootMenuItem_16:Show()
	--Grifter's Armor
	AtlasLootMenuItem_18_Name:SetText("Grifter's Armor")
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Helmet_33")
	AtlasLootMenuItem_18.lootpage="GriftersArmor"
	AtlasLootMenuItem_18:Show()
	--Primalist's Trappings
	AtlasLootMenuItem_19_Name:SetText("Primalist's Trappings")
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Inv_Chest_Plate06")
	AtlasLootMenuItem_19.lootpage="PrimalistsTrappings"
	AtlasLootMenuItem_19:Show()
	--Volcanic Armor
	AtlasLootMenuItem_20_Name:SetText(BIS["Volcanic Armor"])
	AtlasLootMenuItem_20_Extra:SetText(ORANGE..L["Fire Resistance Gear"])
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\INV_Pants_06")
	AtlasLootMenuItem_20.lootpage="VolcanicArmor"
	AtlasLootMenuItem_20:Show()
	--Ironfeather Armor
	AtlasLootMenuItem_21_Name:SetText(BIS["Ironfeather Armor"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Chest_Leather_06")
	AtlasLootMenuItem_21.lootpage="IronfeatherArmor"
	AtlasLootMenuItem_21:Show()
	--Stormshroud Armor
	AtlasLootMenuItem_22_Name:SetText(BIS["Stormshroud Armor"])
	AtlasLootMenuItem_22_Extra:SetText("")
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\INV_Chest_Leather_08")
	AtlasLootMenuItem_22.lootpage="StormshroudArmor"
	AtlasLootMenuItem_22:Show()
	--Devilsaur Armor
	AtlasLootMenuItem_23_Name:SetText(BIS["Devilsaur Armor"])
	AtlasLootMenuItem_23_Extra:SetText("")
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\INV_Pants_Wolf")
	AtlasLootMenuItem_23.lootpage="DevilsaurArmor"
	AtlasLootMenuItem_23:Show()
	--Blood Tiger Harness
	AtlasLootMenuItem_24_Name:SetText(BIS["Blood Tiger Harness"])
	AtlasLootMenuItem_24_Extra:SetText("")
	AtlasLootMenuItem_24_Icon:SetTexture("Interface\\Icons\\INV_Shoulder_23")
	AtlasLootMenuItem_24.lootpage="BloodTigerH"
	AtlasLootMenuItem_24:Show()
	--Primal Batskin
	AtlasLootMenuItem_25_Name:SetText(BIS["Primal Batskin"])
	AtlasLootMenuItem_25_Extra:SetText("")
	AtlasLootMenuItem_25_Icon:SetTexture("Interface\\Icons\\INV_Chest_Leather_03")
	AtlasLootMenuItem_25.lootpage="PrimalBatskin"
	AtlasLootMenuItem_25:Show()
	--Convergence of the Elements
	AtlasLootMenuItem_26_Name:SetText("Convergence of the Elements")
	AtlasLootMenuItem_26_Extra:SetText("")
	AtlasLootMenuItem_26_Icon:SetTexture("Interface\\Icons\\INV_Helmet_13")
	AtlasLootMenuItem_26.lootpage="ConvergenceoftheElements"
	AtlasLootMenuItem_26:Show()
	--Dreamhide Battlegarb
	AtlasLootMenuItem_27_Name:SetText("Dreamhide Battlegarb")
	AtlasLootMenuItem_27_Extra:SetText("")
	AtlasLootMenuItem_27_Icon:SetTexture("Interface\\Icons\\inv_shoulder_18")
	AtlasLootMenuItem_27.lootpage="DreamhideBattlegarb"
	AtlasLootMenuItem_27:Show()

	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..L["Crafted Sets"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLootCraftedSet2Menu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "CRAFTINGMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Show()
	_G["AtlasLootItemsFrame_NEXT"].lootpage = "CRAFTSET"
	_G["AtlasLootItemsFrame_PREV"]:Show()
	_G["AtlasLootItemsFrame_PREV"].lootpage = "CRAFTSET"
	--Leatherworking Mail Header
	AtlasLootMenuItem_1_Name:SetText(RED..BS["Leatherworking"])
	AtlasLootMenuItem_1_Extra:SetText(WHITE..L["Mail"])
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\INV_Chest_Chain_12")
	AtlasLootMenuItem_1.isheader = true
	AtlasLootMenuItem_1:Show()
	--Red Dragon Mail
	AtlasLootMenuItem_3_Name:SetText("Red Dragon Mail")
	AtlasLootMenuItem_3_Extra:SetText(ORANGE..L["Fire Resistance Gear"])
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\inv_chest_chain_06")
	AtlasLootMenuItem_3.lootpage="RedDragonM"
	AtlasLootMenuItem_3:Show()
	--Green Dragon Mail
	AtlasLootMenuItem_4_Name:SetText(BIS["Green Dragon Mail"])
	AtlasLootMenuItem_4_Extra:SetText(ORANGE..L["Nature Resistance Gear"])
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Pants_05")
	AtlasLootMenuItem_4.lootpage="GreenDragonM"
	AtlasLootMenuItem_4:Show()
	--Blue Dragon Mail
	AtlasLootMenuItem_5_Name:SetText(BIS["Blue Dragon Mail"])
	AtlasLootMenuItem_5_Extra:SetText(ORANGE..L["Arcane Resistance Gear"])
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Chest_Chain_04")
	AtlasLootMenuItem_5.lootpage="BlueDragonM"
	AtlasLootMenuItem_5:Show()
	--Black Dragon Mail
	AtlasLootMenuItem_6_Name:SetText(BIS["Black Dragon Mail"])
	AtlasLootMenuItem_6_Extra:SetText(ORANGE..L["Fire Resistance Gear"])
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\INV_Pants_03")
	AtlasLootMenuItem_6.lootpage="BlackDragonM"
	AtlasLootMenuItem_6:Show()
	
	--Mail Blacksmithing Header
	AtlasLootMenuItem_8_Name:SetText(RED..BS["Blacksmithing"])
	AtlasLootMenuItem_8_Extra:SetText(WHITE..L["Mail"])
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Chest_Chain_04")
	AtlasLootMenuItem_8.isheader = true
	AtlasLootMenuItem_8:Show()
	--Bloodsoul Embrace
	AtlasLootMenuItem_9_Name:SetText(BIS["Bloodsoul Embrace"])
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\INV_Shoulder_15")
	AtlasLootMenuItem_9.lootpage="BloodsoulEmbrace"
	AtlasLootMenuItem_9:Show()
	--Hateforge Armor
	AtlasLootMenuItem_10_Name:SetText("Hateforge Armor")
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\INV_Helmet_10")
	AtlasLootMenuItem_10.lootpage="HateforgeArmor"
	AtlasLootMenuItem_10:Show()
	--Towerforge Battlegear
	AtlasLootMenuItem_11_Name:SetText("Towerforge Battlegear")
	AtlasLootMenuItem_11_Extra:SetText("")
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\INV_Helmet_37")
	AtlasLootMenuItem_11.lootpage="TowerforgeBattlegear"
	AtlasLootMenuItem_11:Show()


	--Mail Blacksmithing Header
	AtlasLootMenuItem_16_Name:SetText(RED..BS["Blacksmithing"])
	AtlasLootMenuItem_16_Extra:SetText(WHITE..L["Plate"])
	AtlasLootMenuItem_16_Icon:SetTexture("Interface\\Icons\\INV_Chest_Chain_04")
	AtlasLootMenuItem_16.isheader = true
	AtlasLootMenuItem_16:Show()
	--Steel Plate
	AtlasLootMenuItem_18_Name:SetText("Steel Plate")
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Helmet_25")
	AtlasLootMenuItem_18.lootpage="SteelPlate"
	AtlasLootMenuItem_18:Show()
	--Imperial Plate
	AtlasLootMenuItem_19_Name:SetText(BIS["Imperial Plate"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\INV_Belt_01")
	AtlasLootMenuItem_19.lootpage="ImperialPlate"
	AtlasLootMenuItem_19:Show()
	--Rune-Etched Armor
	AtlasLootMenuItem_20_Name:SetText("Rune-Etched Armor")
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\inv_helmet_06")
	AtlasLootMenuItem_20.lootpage="RuneEtchedArmor"
	AtlasLootMenuItem_20:Show()
	--The Darksoul
	AtlasLootMenuItem_21_Name:SetText(BIS["The Darksoul"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shoulder_01")
	AtlasLootMenuItem_21.lootpage="TheDarksoul"
	AtlasLootMenuItem_21:Show()
	--Dreamsteel Armor
	AtlasLootMenuItem_22_Name:SetText("Dreamsteel Armor")
	AtlasLootMenuItem_22_Extra:SetText("")
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\INV_Bracer_03")
	AtlasLootMenuItem_22.lootpage="DreamsteelArmor"
	AtlasLootMenuItem_22:Show()

	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF".."Crafted Sets 2")
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLoot_AlchemyMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "CRAFTINGMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Apprentice
	AtlasLootMenuItem_2_Name:SetText(BS["Alchemy"]..": "..L["Apprentice"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy")
	AtlasLootMenuItem_2.lootpage = "AlchemyApprentice1"
	AtlasLootMenuItem_2:Show()
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Alchemy"]..": "..L["Journeyman"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy")
	AtlasLootMenuItem_3.lootpage = "AlchemyJourneyman1"
	AtlasLootMenuItem_3:Show()
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Alchemy"]..": "..L["Expert"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy")
	AtlasLootMenuItem_4.lootpage="AlchemyExpert1"
	AtlasLootMenuItem_4:Show()
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Alchemy"]..": "..L["Artisan"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy")
	AtlasLootMenuItem_5.lootpage="AlchemyArtisan1"
	AtlasLootMenuItem_5:Show()
	--Flasks
	AtlasLootMenuItem_7_Name:SetText(BS["Alchemy"]..": "..L["Flasks"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy")
	AtlasLootMenuItem_7.lootpage="AlchemyFlasks1"
	AtlasLootMenuItem_7:Show()
	--Protection Pots
	AtlasLootMenuItem_8_Name:SetText(BS["Alchemy"]..": "..L["Protection Potions"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy")
	AtlasLootMenuItem_8.lootpage="AlchemyProtectionPots1"
	AtlasLootMenuItem_8:Show()
	--Healing and Mana
	AtlasLootMenuItem_9_Name:SetText(BS["Alchemy"]..": "..L["Healing and Mana Potions"])
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy")
	AtlasLootMenuItem_9.lootpage="AlchemyHealingAndMana1"
	AtlasLootMenuItem_9:Show()
	--Transmutes
	AtlasLootMenuItem_10_Name:SetText(BS["Alchemy"]..": "..L["Transmutes"])
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy")
	AtlasLootMenuItem_10.lootpage="AlchemyTransmutes1"
	AtlasLootMenuItem_10:Show()
	--Defensive pots
	AtlasLootMenuItem_11_Name:SetText(BS["Alchemy"]..": "..L["Defensive Potions and Elixirs"])
	AtlasLootMenuItem_11_Extra:SetText("")
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy")
	AtlasLootMenuItem_11.lootpage="AlchemyDefensive1"
	AtlasLootMenuItem_11:Show()
	--Offensive pots
	AtlasLootMenuItem_12_Name:SetText(BS["Alchemy"]..": "..L["Offensive Potions and Elixirs"])
	AtlasLootMenuItem_12_Extra:SetText("")
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy")
	AtlasLootMenuItem_12.lootpage="AlchemyOffensive1"
	AtlasLootMenuItem_12:Show()
	--Other
	AtlasLootMenuItem_13_Name:SetText(BS["Alchemy"]..": "..L["Other"])
	AtlasLootMenuItem_13_Extra:SetText("")
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy")
	AtlasLootMenuItem_13.lootpage="AlchemyOther1"
	AtlasLootMenuItem_13:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Alchemy"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLoot_SmithingMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "CRAFTINGMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Apprentice
	AtlasLootMenuItem_2_Name:SetText(BS["Blacksmithing"]..": "..L["Apprentice"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_2.lootpage = "SmithingApprentice1"
	AtlasLootMenuItem_2:Show()
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Blacksmithing"]..": "..L["Journeyman"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_3.lootpage = "SmithingJourneyman1"
	AtlasLootMenuItem_3:Show()
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Blacksmithing"]..": "..L["Expert"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_4.lootpage="SmithingExpert1"
	AtlasLootMenuItem_4:Show()
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Blacksmithing"]..": "..L["Artisan"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_5.lootpage="SmithingArtisan1"
	AtlasLootMenuItem_5:Show()
	--BS Helm
	AtlasLootMenuItem_7_Name:SetText(BS["Blacksmithing"]..": "..L["Helm"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_7.lootpage="SmithingHelm1"
	AtlasLootMenuItem_7:Show()
	--BS Shoulders
	AtlasLootMenuItem_8_Name:SetText(BS["Blacksmithing"]..": "..L["Shoulders"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_8.lootpage="SmithingShoulders1"
	AtlasLootMenuItem_8:Show()
	--BS Chest
	AtlasLootMenuItem_9_Name:SetText(BS["Blacksmithing"]..": "..L["Chest"])
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_9.lootpage="SmithingChest1"
	AtlasLootMenuItem_9:Show()
	--BS Bracers
	AtlasLootMenuItem_10_Name:SetText(BS["Blacksmithing"]..": "..L["Bracers"])
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_10.lootpage="SmithingBracers1"
	AtlasLootMenuItem_10:Show()
	--BS Gloves
	AtlasLootMenuItem_11_Name:SetText(BS["Blacksmithing"]..": "..L["Gloves"])
	AtlasLootMenuItem_11_Extra:SetText("")
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_11.lootpage="SmithingGloves1"
	AtlasLootMenuItem_11:Show()
	--BS Belt
	AtlasLootMenuItem_12_Name:SetText(BS["Blacksmithing"]..": "..L["Belt"])
	AtlasLootMenuItem_12_Extra:SetText("")
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_12.lootpage="SmithingBelt1"
	AtlasLootMenuItem_12:Show()
	--BS Pants
	AtlasLootMenuItem_13_Name:SetText(BS["Blacksmithing"]..": "..L["Pants"])
	AtlasLootMenuItem_13_Extra:SetText("")
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_13.lootpage="SmithingPants1"
	AtlasLootMenuItem_13:Show()
	--BS Boots
	AtlasLootMenuItem_14_Name:SetText(BS["Blacksmithing"]..": "..L["Boots"])
	AtlasLootMenuItem_14_Extra:SetText("")
	AtlasLootMenuItem_14_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_14.lootpage="SmithingBoots1"
	AtlasLootMenuItem_14:Show()
	--BS Belt Buckles
	AtlasLootMenuItem_15_Name:SetText(BS["Blacksmithing"]..": "..L["Belt Buckles"])
	AtlasLootMenuItem_15_Extra:SetText("")
	AtlasLootMenuItem_15_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_15.lootpage="SmithingBuckles1"
	AtlasLootMenuItem_15:Show()
	--BS Axes
	AtlasLootMenuItem_17_Name:SetText(BS["Blacksmithing"]..": "..L["Axes"])
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_17.lootpage="SmithingAxes1"
	AtlasLootMenuItem_17:Show()
	--BS Swords
	AtlasLootMenuItem_18_Name:SetText(BS["Blacksmithing"]..": "..L["Swords"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_18.lootpage="SmithingSwords1"
	AtlasLootMenuItem_18:Show()
	--BS Maces
	AtlasLootMenuItem_19_Name:SetText(BS["Blacksmithing"]..": "..L["Maces"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_19.lootpage="SmithingMaces1"
	AtlasLootMenuItem_19:Show()
	--BS Fist
	AtlasLootMenuItem_20_Name:SetText(BS["Blacksmithing"]..": "..L["Fist"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_20.lootpage="SmithingFist1"
	AtlasLootMenuItem_20:Show()
	--BS Daggers
	AtlasLootMenuItem_21_Name:SetText(BS["Blacksmithing"]..": "..L["Daggers"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_21.lootpage="SmithingDaggers1"
	AtlasLootMenuItem_21:Show()
	--BS Misc
	AtlasLootMenuItem_22_Name:SetText(BS["Blacksmithing"]..": "..L["Misc"])
	AtlasLootMenuItem_22_Extra:SetText("")
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing")
	AtlasLootMenuItem_22.lootpage="SmithingMisc1"
	AtlasLootMenuItem_22:Show()
	--Armorsmith
	AtlasLootMenuItem_24_Name:SetText(BS["Blacksmithing"]..": "..BS["Armorsmith"])
	AtlasLootMenuItem_24_Extra:SetText("")
	AtlasLootMenuItem_24_Icon:SetTexture("Interface\\Icons\\INV_Chest_Plate04")
	AtlasLootMenuItem_24.lootpage="Armorsmith1"
	AtlasLootMenuItem_24:Show()
	--Weaponsmith
	AtlasLootMenuItem_25_Name:SetText(BS["Blacksmithing"]..": "..BS["Weaponsmith"])
	AtlasLootMenuItem_25_Extra:SetText("")
	AtlasLootMenuItem_25_Icon:SetTexture("Interface\\Icons\\INV_Sword_25")
	AtlasLootMenuItem_25.lootpage="Weaponsmith1"
	AtlasLootMenuItem_25:Show()
	--Master Axesmith
	AtlasLootMenuItem_26_Name:SetText(BS["Blacksmithing"]..": "..L["Master Axesmith"])
	AtlasLootMenuItem_26_Extra:SetText("")
	AtlasLootMenuItem_26_Icon:SetTexture("Interface\\Icons\\INV_Axe_05")
	AtlasLootMenuItem_26.lootpage="Axesmith1"
	AtlasLootMenuItem_26:Show()
	--Master Hammersmith
	AtlasLootMenuItem_27_Name:SetText(BS["Blacksmithing"]..": "..L["Master Hammersmith"])
	AtlasLootMenuItem_27_Extra:SetText("")
	AtlasLootMenuItem_27_Icon:SetTexture("Interface\\Icons\\INV_Hammer_23")
	AtlasLootMenuItem_27.lootpage="Hammersmith1"
	AtlasLootMenuItem_27:Show()
	--Master Swordsmith
	AtlasLootMenuItem_28_Name:SetText(BS["Blacksmithing"]..": "..L["Master Swordsmith"])
	AtlasLootMenuItem_28_Extra:SetText("")
	AtlasLootMenuItem_28_Icon:SetTexture("Interface\\Icons\\INV_Sword_41")
	AtlasLootMenuItem_28.lootpage="Swordsmith1"
	AtlasLootMenuItem_28:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Blacksmithing"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLoot_EnchantingMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "CRAFTINGMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Apprentice
	AtlasLootMenuItem_2_Name:SetText(BS["Enchanting"]..": "..L["Apprentice"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_2.lootpage = "EnchantingApprentice1"
	AtlasLootMenuItem_2:Show()
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Enchanting"]..": "..L["Journeyman"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_3.lootpage = "EnchantingJourneyman1"
	AtlasLootMenuItem_3:Show()
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Enchanting"]..": "..L["Expert"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_4.lootpage="EnchantingExpert1"
	AtlasLootMenuItem_4:Show()
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Enchanting"]..": "..L["Artisan"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_5.lootpage="EnchantingArtisan1"
	AtlasLootMenuItem_5:Show()
	--By Slot, Cloak
	AtlasLootMenuItem_7_Name:SetText(BS["Enchanting"]..": "..L["Cloak"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_7.lootpage="EnchantingCloak1"
	AtlasLootMenuItem_7:Show()
	--By Slot, Chest
	AtlasLootMenuItem_8_Name:SetText(BS["Enchanting"]..": "..L["Chest"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_8.lootpage="EnchantingChest1"
	AtlasLootMenuItem_8:Show()
	--By Slot, Bracer
	AtlasLootMenuItem_9_Name:SetText(BS["Enchanting"]..": "..L["Bracers"])
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_9.lootpage="EnchantingBracer1"
	AtlasLootMenuItem_9:Show()
	--By Slot, Glove
	AtlasLootMenuItem_10_Name:SetText(BS["Enchanting"]..": "..L["Gloves"])
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_10.lootpage="EnchantingGlove1"
	AtlasLootMenuItem_10:Show()
	--By Slot, Boots
	AtlasLootMenuItem_11_Name:SetText(BS["Enchanting"]..": "..L["Boots"])
	AtlasLootMenuItem_11_Extra:SetText("")
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_11.lootpage="EnchantingBoots1"
	AtlasLootMenuItem_11:Show()
	--By Slot, 2H Weapon
	AtlasLootMenuItem_12_Name:SetText(BS["Enchanting"]..": "..L["2H Weapon"])
	AtlasLootMenuItem_12_Extra:SetText("")
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_12.lootpage="Enchanting2HWeapon1"
	AtlasLootMenuItem_12:Show()
	--By Slot, Weapon
	AtlasLootMenuItem_13_Name:SetText(BS["Enchanting"]..": "..L["Weapon"])
	AtlasLootMenuItem_13_Extra:SetText("")
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_13.lootpage="EnchantingWeapon1"
	AtlasLootMenuItem_13:Show()
	--By Slot, Shield
	AtlasLootMenuItem_14_Name:SetText(BS["Enchanting"]..": "..L["Shield"])
	AtlasLootMenuItem_14_Extra:SetText("")
	AtlasLootMenuItem_14_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_14.lootpage="EnchantingShield1"
	AtlasLootMenuItem_14:Show()
	--By Slot, Misc
	AtlasLootMenuItem_15_Name:SetText(BS["Enchanting"]..": "..L["Misc"])
	AtlasLootMenuItem_15_Extra:SetText("")
	AtlasLootMenuItem_15_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_15.lootpage="EnchantingMisc1"
	AtlasLootMenuItem_15:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Enchanting"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLoot_EngineeringMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "CRAFTINGMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Apprentice
	AtlasLootMenuItem_2_Name:SetText(BS["Engineering"]..": "..L["Apprentice"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_Engineering")
	AtlasLootMenuItem_2.lootpage = "EngineeringApprentice1"
	AtlasLootMenuItem_2:Show()
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Engineering"]..": "..L["Journeyman"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Trade_Engineering")
	AtlasLootMenuItem_3.lootpage = "EngineeringJourneyman1"
	AtlasLootMenuItem_3:Show()
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Engineering"]..": "..L["Expert"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Trade_Engineering")
	AtlasLootMenuItem_4.lootpage="EngineeringExpert1"
	AtlasLootMenuItem_4:Show()
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Engineering"]..": "..L["Artisan"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Trade_Engineering")
	AtlasLootMenuItem_5.lootpage="EngineeringArtisan1"
	AtlasLootMenuItem_5:Show()
	--Equipment
	AtlasLootMenuItem_7_Name:SetText(BS["Engineering"]..": "..L["Equipment"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Trade_Engineering")
	AtlasLootMenuItem_7.lootpage="EngineeringEquipment1"
	AtlasLootMenuItem_7:Show()
	--Trinkets
	AtlasLootMenuItem_8_Name:SetText(BS["Engineering"]..": "..L["Trinkets"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Trade_Engineering")
	AtlasLootMenuItem_8.lootpage="EngineeringTrinkets1"
	AtlasLootMenuItem_8:Show()
	--Explosives
	AtlasLootMenuItem_9_Name:SetText(BS["Engineering"]..": "..L["Explosives"])
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\Trade_Engineering")
	AtlasLootMenuItem_9.lootpage="EngineeringExplosives1"
	AtlasLootMenuItem_9:Show()
	-- Weapons
	AtlasLootMenuItem_10_Name:SetText(BS["Engineering"]..": "..L["Weapons"])
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\Trade_Engineering")
	AtlasLootMenuItem_10.lootpage="EngineeringWeapons1"
	AtlasLootMenuItem_10:Show()
	--Parts
	AtlasLootMenuItem_11_Name:SetText(BS["Engineering"]..": "..L["Parts"])
	AtlasLootMenuItem_11_Extra:SetText("")
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\Trade_Engineering")
	AtlasLootMenuItem_11.lootpage="EngineeringParts1"
	AtlasLootMenuItem_11:Show()
	--Misc
	AtlasLootMenuItem_12_Name:SetText(BS["Engineering"]..": "..L["Misc"])
	AtlasLootMenuItem_12_Extra:SetText("")
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\Trade_Engineering")
	AtlasLootMenuItem_12.lootpage="EngineeringMisc1"
	AtlasLootMenuItem_12:Show()
	--Gnomish Engineering
	AtlasLootMenuItem_17_Name:SetText(L["Gnomish Engineering"])
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Gizmo_02")
	AtlasLootMenuItem_17.lootpage="Gnomish1"
	AtlasLootMenuItem_17:Show()
	--Goblin Engineering
	AtlasLootMenuItem_18_Name:SetText(L["Goblin Engineering"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Spell_Fire_Selfdestruct")
	AtlasLootMenuItem_18.lootpage="Goblin1"
	AtlasLootMenuItem_18:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Engineering"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLoot_LeatherworkingMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "CRAFTINGMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Apprentice
	AtlasLootMenuItem_2_Name:SetText(BS["Leatherworking"]..": "..L["Apprentice"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_2.lootpage = "LeatherApprentice1"
	AtlasLootMenuItem_2:Show()
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Leatherworking"]..": "..L["Journeyman"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_3.lootpage = "LeatherJourneyman1"
	AtlasLootMenuItem_3:Show()
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Leatherworking"]..": "..L["Expert"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_4.lootpage="LeatherExpert1"
	AtlasLootMenuItem_4:Show()
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Leatherworking"]..": "..L["Artisan"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_5.lootpage="LeatherArtisan1"
	AtlasLootMenuItem_5:Show()
	
	--Leatherworking Helm
	AtlasLootMenuItem_7_Name:SetText(BS["Leatherworking"]..": "..L["Helm"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_7.lootpage="LeatherHelm1"
	AtlasLootMenuItem_7:Show()
	--Leatherworking Shoulders
	AtlasLootMenuItem_8_Name:SetText(BS["Leatherworking"]..": "..L["Shoulders"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_8.lootpage="LeatherShoulders1"
	AtlasLootMenuItem_8:Show()	
	--Leatherworking Cape
	AtlasLootMenuItem_9_Name:SetText(BS["Leatherworking"]..": "..L["Cloak"])
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_9.lootpage="LeatherCloak1"
	AtlasLootMenuItem_9:Show()	
	--Leatherworking Chest
	AtlasLootMenuItem_10_Name:SetText(BS["Leatherworking"]..": "..L["Chest"])
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_10.lootpage="LeatherChest1"
	AtlasLootMenuItem_10:Show()
	--Leatherworking Bracers
	AtlasLootMenuItem_11_Name:SetText(BS["Leatherworking"]..": "..L["Bracers"])
	AtlasLootMenuItem_11_Extra:SetText("")
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_11.lootpage="LeatherBracers1"
	AtlasLootMenuItem_11:Show()	
	--Leatherworking Gloves
	AtlasLootMenuItem_12_Name:SetText(BS["Leatherworking"]..": "..L["Gloves"])
	AtlasLootMenuItem_12_Extra:SetText("")
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_12.lootpage="LeatherGloves1"
	AtlasLootMenuItem_12:Show()
	--Leatherworking Belt
	AtlasLootMenuItem_13_Name:SetText(BS["Leatherworking"]..": "..L["Belt"])
	AtlasLootMenuItem_13_Extra:SetText("")
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_13.lootpage="LeatherBelt1"
	AtlasLootMenuItem_13:Show()
	--Leatherworking Pants
	AtlasLootMenuItem_14_Name:SetText(BS["Leatherworking"]..": "..L["Pants"])
	AtlasLootMenuItem_14_Extra:SetText("")
	AtlasLootMenuItem_14_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_14.lootpage="LeatherPants1"
	AtlasLootMenuItem_14:Show()	
	--Leatherworking Boots
	AtlasLootMenuItem_15_Name:SetText(BS["Leatherworking"]..": "..L["Boots"])
	AtlasLootMenuItem_15_Extra:SetText("")
	AtlasLootMenuItem_15_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_15.lootpage="LeatherBoots1"
	AtlasLootMenuItem_15:Show()
	--Leatherworking Bags
	AtlasLootMenuItem_17_Name:SetText(BS["Leatherworking"]..": "..L["Bags"])
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_17.lootpage="LeatherBags1"
	AtlasLootMenuItem_17:Show()
	--Leatherworking Misc
	AtlasLootMenuItem_18_Name:SetText(BS["Leatherworking"]..": "..L["Misc"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17")
	AtlasLootMenuItem_18.lootpage="LeatherMisc1"
	AtlasLootMenuItem_18:Show()
	
	--Dragonscale Leatherworking
	AtlasLootMenuItem_20_Name:SetText(BS["Dragonscale Leatherworking"])
	AtlasLootMenuItem_20_Extra:SetText("")
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\INV_Misc_MonsterScales_03")
	AtlasLootMenuItem_20.lootpage="Dragonscale1"
	AtlasLootMenuItem_20:Show()
	--Tribal Leatherworking
	AtlasLootMenuItem_21_Name:SetText(BS["Tribal Leatherworking"])
	AtlasLootMenuItem_21_Extra:SetText("")
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\Spell_Nature_NullWard")
	AtlasLootMenuItem_21.lootpage="Tribal1"
	AtlasLootMenuItem_21:Show()
	--Elemental Leatherworking
	AtlasLootMenuItem_22_Name:SetText(BS["Elemental Leatherworking"])
	AtlasLootMenuItem_22_Extra:SetText("")
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\Spell_Fire_Volcano")
	AtlasLootMenuItem_22.lootpage="Elemental1"
	AtlasLootMenuItem_22:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Leatherworking"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLoot_TailoringMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "CRAFTINGMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Apprentice
	AtlasLootMenuItem_2_Name:SetText(BS["Tailoring"]..": "..L["Apprentice"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_2.lootpage = "TailoringApprentice1"
	AtlasLootMenuItem_2:Show()
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Tailoring"]..": "..L["Journeyman"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_3.lootpage = "TailoringJourneyman1"
	AtlasLootMenuItem_3:Show()
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Tailoring"]..": "..L["Expert"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_4.lootpage="TailoringExpert1"
	AtlasLootMenuItem_4:Show()
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Tailoring"]..": "..L["Artisan"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_5.lootpage="TailoringArtisan1"
	AtlasLootMenuItem_5:Show()
	
	--Tailoring Helm
	AtlasLootMenuItem_7_Name:SetText(BS["Tailoring"]..": "..L["Helm"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_7.lootpage="TailoringHelm1"
	AtlasLootMenuItem_7:Show()
	--Tailoring Shoulders
	AtlasLootMenuItem_8_Name:SetText(BS["Tailoring"]..": "..L["Shoulders"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_8.lootpage="TailoringShoulders1"
	AtlasLootMenuItem_8:Show()	
	--Tailoring Cape
	AtlasLootMenuItem_9_Name:SetText(BS["Tailoring"]..": "..L["Cloak"])
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_9.lootpage="TailoringCloak1"
	AtlasLootMenuItem_9:Show()	
	--Tailoring Chest
	AtlasLootMenuItem_10_Name:SetText(BS["Tailoring"]..": "..L["Chest"])
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_10.lootpage="TailoringChest1"
	AtlasLootMenuItem_10:Show()
	--Tailoring Bracers
	AtlasLootMenuItem_11_Name:SetText(BS["Tailoring"]..": "..L["Bracers"])
	AtlasLootMenuItem_11_Extra:SetText("")
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_11.lootpage="TailoringBracers1"
	AtlasLootMenuItem_11:Show()	
	--Tailoring Gloves
	AtlasLootMenuItem_12_Name:SetText(BS["Tailoring"]..": "..L["Gloves"])
	AtlasLootMenuItem_12_Extra:SetText("")
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_12.lootpage="TailoringGloves1"
	AtlasLootMenuItem_12:Show()
	--Tailoring Belt
	AtlasLootMenuItem_13_Name:SetText(BS["Tailoring"]..": "..L["Belt"])
	AtlasLootMenuItem_13_Extra:SetText("")
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_13.lootpage="TailoringBelt1"
	AtlasLootMenuItem_13:Show()
	--Tailoring Pants
	AtlasLootMenuItem_14_Name:SetText(BS["Tailoring"]..": "..L["Pants"])
	AtlasLootMenuItem_14_Extra:SetText("")
	AtlasLootMenuItem_14_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_14.lootpage="TailoringPants1"
	AtlasLootMenuItem_14:Show()	
	--Tailoring Boots
	AtlasLootMenuItem_15_Name:SetText(BS["Tailoring"]..": "..L["Boots"])
	AtlasLootMenuItem_15_Extra:SetText("")
	AtlasLootMenuItem_15_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_15.lootpage="TailoringBoots1"
	AtlasLootMenuItem_15:Show()
	--Tailoring Shirt
	AtlasLootMenuItem_17_Name:SetText(BS["Tailoring"]..": "..L["Shirt"])
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_17.lootpage="TailoringShirt1"
	AtlasLootMenuItem_17:Show()
	--Tailoring Bags
	AtlasLootMenuItem_18_Name:SetText(BS["Tailoring"]..": "..L["Bags"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_18.lootpage="TailoringBags1"
	AtlasLootMenuItem_18:Show()
	--Tailoring Misc
	AtlasLootMenuItem_19_Name:SetText(BS["Tailoring"]..": "..L["Misc"])
	AtlasLootMenuItem_19_Extra:SetText("")
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring")
	AtlasLootMenuItem_19.lootpage="TailoringMisc1"
	AtlasLootMenuItem_19:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Tailoring"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLoot_CookingMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "CRAFTINGMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Apprentice
	AtlasLootMenuItem_2_Name:SetText(BS["Cooking"]..": "..L["Apprentice"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Misc_Food_15")
	AtlasLootMenuItem_2.lootpage = "CookingApprentice1"
	AtlasLootMenuItem_2:Show()
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Cooking"]..": "..L["Journeyman"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Misc_Food_15")
	AtlasLootMenuItem_3.lootpage = "CookingJourneyman1"
	AtlasLootMenuItem_3:Show()
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Cooking"]..": "..L["Expert"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Misc_Food_15")
	AtlasLootMenuItem_4.lootpage="CookingExpert1"
	AtlasLootMenuItem_4:Show()
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Cooking"]..": "..L["Artisan"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Misc_Food_15")
	AtlasLootMenuItem_5.lootpage="CookingArtisan1"
	AtlasLootMenuItem_5:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Cooking"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLoot_MiningMenu()
	for i = 1, 30, 1 do
		_G["AtlasLootItem_"..i]:Hide()
	end
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i]:Hide()
		_G["AtlasLootMenuItem_"..i].isheader = false
	end
	_G["AtlasLootItemsFrame_BACK"]:Show()
	_G["AtlasLootItemsFrame_BACK"].lootpage = "CRAFTINGMENU"
	_G["AtlasLootItemsFrame_NEXT"]:Hide()
	_G["AtlasLootItemsFrame_PREV"]:Hide()
	_G["AtlasLootServerQueryButton"]:Hide()
	--Mining
	AtlasLootMenuItem_2_Name:SetText(BS["Mining"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_Mining")
	AtlasLootMenuItem_2.lootpage = "Mining1"
	AtlasLootMenuItem_2:Show()
	--Smelting
	AtlasLootMenuItem_17_Name:SetText(BS["Smelting"])
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\Spell_Fire_FlameBlades")
	AtlasLootMenuItem_17.lootpage = "Smelting1"
	AtlasLootMenuItem_17:Show()
	for i = 1, 30, 1 do
		_G["AtlasLootMenuItem_"..i.."_Extra"]:Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Mining"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end

function AtlasLoot_SurvivalMenu()
	for i = 1, 30, 1 do
		getglobal("AtlasLootItem_"..i):Hide()
	end
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i):Hide()
		getglobal("AtlasLootMenuItem_"..i).isheader = false
	end
	getglobal("AtlasLootItemsFrame_BACK"):Show()
	getglobal("AtlasLootItemsFrame_BACK").lootpage = "CRAFTINGMENU"
	getglobal("AtlasLootItemsFrame_NEXT"):Hide()
	getglobal("AtlasLootItemsFrame_PREV"):Hide()
	getglobal("AtlasLootServerQueryButton"):Hide()
	--Apprentice
	AtlasLootMenuItem_2_Name:SetText(L["Survival"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_Survival")
	AtlasLootMenuItem_2.lootpage = "Survival1"
	AtlasLootMenuItem_2:Show()
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(L["Garderning"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\trade_herbalism")
	AtlasLootMenuItem_3.lootpage = "Survival2"
	AtlasLootMenuItem_3:Show()
end
function AtlasLoot_JewelcraftingMenu()
	for i = 1, 30, 1 do
		getglobal("AtlasLootItem_"..i):Hide()
	end
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i):Hide()
		getglobal("AtlasLootMenuItem_"..i).isheader = false
	end
	getglobal("AtlasLootItemsFrame_BACK"):Show()
	getglobal("AtlasLootItemsFrame_BACK").lootpage = "CRAFTINGMENU"
	getglobal("AtlasLootItemsFrame_NEXT"):Hide()
	getglobal("AtlasLootItemsFrame_PREV"):Hide()
	getglobal("AtlasLootServerQueryButton"):Hide()
	--Apprentice
	AtlasLootMenuItem_2_Name:SetText(BS["Jewelcrafting"]..": "..L["Apprentice"])
	AtlasLootMenuItem_2_Extra:SetText("")
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_11")
	AtlasLootMenuItem_2.lootpage = "JewelcraftingApprentice1"
	AtlasLootMenuItem_2:Show()
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Jewelcrafting"]..": "..L["Journeyman"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_11")
	AtlasLootMenuItem_3.lootpage = "JewelcraftingJourneyman1"
	AtlasLootMenuItem_3:Show()
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Jewelcrafting"]..": "..L["Expert"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_11")
	AtlasLootMenuItem_4.lootpage="JewelcraftingExpert1"
	AtlasLootMenuItem_4:Show()
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Jewelcrafting"]..": "..L["Artisan"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_11")
	AtlasLootMenuItem_5.lootpage="JewelcraftingArtisan1"
	AtlasLootMenuItem_5:Show()
	--Gemstones
	AtlasLootMenuItem_7_Name:SetText(BS["Jewelcrafting"]..": "..L["Gemstones"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_01")
	AtlasLootMenuItem_7.lootpage="JewelcraftingGemstones1"
	AtlasLootMenuItem_7:Show()
	--Rings
	AtlasLootMenuItem_8_Name:SetText(BS["Jewelcrafting"]..": "..L["Rings"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_01")
	AtlasLootMenuItem_8.lootpage="JewelcraftingRings1"
	AtlasLootMenuItem_8:Show()
	--Amulets
	AtlasLootMenuItem_9_Name:SetText(BS["Jewelcrafting"]..": "..L["Amulets"])
	AtlasLootMenuItem_9_Extra:SetText("")
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_01")
	AtlasLootMenuItem_9.lootpage="JewelcraftingAmulets1"
	AtlasLootMenuItem_9:Show()
	--Head
	AtlasLootMenuItem_10_Name:SetText(BS["Jewelcrafting"]..": "..L["Head"])
	AtlasLootMenuItem_10_Extra:SetText("")
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_01")
	AtlasLootMenuItem_10.lootpage="JewelcraftingHelm1"
	AtlasLootMenuItem_10:Show()
	--Bracers
	AtlasLootMenuItem_11_Name:SetText(BS["Jewelcrafting"]..": "..L["Bracers"])
	AtlasLootMenuItem_11_Extra:SetText("")
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_01")
	AtlasLootMenuItem_11.lootpage="JewelcraftingBracers1"
	AtlasLootMenuItem_11:Show()
	--Offhands
	AtlasLootMenuItem_12_Name:SetText(BS["Jewelcrafting"]..": "..L["Off-hand"])
	AtlasLootMenuItem_12_Extra:SetText("")
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_01")
	AtlasLootMenuItem_12.lootpage="JewelcraftingOffHands1"
	AtlasLootMenuItem_12:Show()
	--Staves
	AtlasLootMenuItem_13_Name:SetText(BS["Jewelcrafting"]..": "..L["Staff"])
	AtlasLootMenuItem_13_Extra:SetText("")
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_01")
	AtlasLootMenuItem_13.lootpage="JewelcraftingStaves1"
	AtlasLootMenuItem_13:Show()
	--Trinkets
	AtlasLootMenuItem_14_Name:SetText(BS["Jewelcrafting"]..": "..L["Trinkets"])
	AtlasLootMenuItem_14_Extra:SetText("")
	AtlasLootMenuItem_14_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_01")
	AtlasLootMenuItem_14.lootpage="JewelcraftingTrinkets1"
	AtlasLootMenuItem_14:Show()
	--Misc
	AtlasLootMenuItem_15_Name:SetText(BS["Jewelcrafting"]..": "..L["Misc"])
	AtlasLootMenuItem_15_Extra:SetText("")
	AtlasLootMenuItem_15_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_01")
	AtlasLootMenuItem_15.lootpage="JewelcraftingMisc1"
	AtlasLootMenuItem_15:Show()
	--Gemology
	AtlasLootMenuItem_17_Name:SetText(BS["Jewelcrafting"]..": "..L["Gemology"])
	AtlasLootMenuItem_17_Extra:SetText("")
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_11")
	AtlasLootMenuItem_17.lootpage="JewelcraftingGemology1"
	AtlasLootMenuItem_17:Show()
	--Goldsmithing
	AtlasLootMenuItem_18_Name:SetText(BS["Jewelcrafting"]..": "..L["Goldsmithing"])
	AtlasLootMenuItem_18_Extra:SetText("")
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Necklace_11")
	AtlasLootMenuItem_18.lootpage="JewelcraftingGoldsmithing1"
	AtlasLootMenuItem_18:Show()
	
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show()
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Jewelcrafting"])
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame)
end