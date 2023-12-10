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
	AtlasLootMenuItem_8_Name:SetText(RED..BS["Blacksmithing"]);
	AtlasLootMenuItem_8_Extra:SetText(WHITE..L["Mail"]);
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Chest_Chain_04");
	AtlasLootMenuItem_8.isheader = true;
	AtlasLootMenuItem_8:Show();
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
	AtlasLootMenuItem_16_Name:SetText(RED..BS["Blacksmithing"]);
	AtlasLootMenuItem_16_Extra:SetText(WHITE..L["Plate"]);
	AtlasLootMenuItem_16_Icon:SetTexture("Interface\\Icons\\INV_Chest_Chain_04");
	AtlasLootMenuItem_16.isheader = true;
	AtlasLootMenuItem_16:Show();
	--Steel Plate
	AtlasLootMenuItem_18_Name:SetText("Steel Plate");
	AtlasLootMenuItem_18_Extra:SetText("");
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Helmet_25");
	AtlasLootMenuItem_18.lootpage="SteelPlate";
	AtlasLootMenuItem_18:Show();
	--Imperial Plate
	AtlasLootMenuItem_19_Name:SetText(BIS["Imperial Plate"]);
	AtlasLootMenuItem_19_Extra:SetText("");
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\INV_Belt_01");
	AtlasLootMenuItem_19.lootpage="ImperialPlate";
	AtlasLootMenuItem_19:Show();
	--Rune-Etched Armor
	AtlasLootMenuItem_20_Name:SetText("Rune-Etched Armor");
	AtlasLootMenuItem_20_Extra:SetText("");
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\inv_helmet_06");
	AtlasLootMenuItem_20.lootpage="RuneEtchedArmor";
	AtlasLootMenuItem_20:Show();
	--The Darksoul
	AtlasLootMenuItem_21_Name:SetText(BIS["The Darksoul"]);
	AtlasLootMenuItem_21_Extra:SetText("");
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Shoulder_01");
	AtlasLootMenuItem_21.lootpage="TheDarksoul";
	AtlasLootMenuItem_21:Show();
	--Dreamsteel Armor
	AtlasLootMenuItem_22_Name:SetText("Dreamsteel Armor");
	AtlasLootMenuItem_22_Extra:SetText("");
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\INV_Bracer_03");
	AtlasLootMenuItem_22.lootpage="DreamsteelArmor";
	AtlasLootMenuItem_22:Show();

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
	--Armorsmith
	AtlasLootMenuItem_7_Name:SetText(BS["Armorsmith"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Chest_Plate04")
	AtlasLootMenuItem_7.lootpage="Armorsmith1"
	AtlasLootMenuItem_7:Show()
	--Weaponsmith
	AtlasLootMenuItem_22_Name:SetText(BS["Weaponsmith"])
	AtlasLootMenuItem_22_Extra:SetText("")
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\INV_Sword_25")
	AtlasLootMenuItem_22.lootpage="Weaponsmith1"
	AtlasLootMenuItem_22:Show()
	--Master Axesmith
	AtlasLootMenuItem_23_Name:SetText(L["Master Axesmith"])
	AtlasLootMenuItem_23_Extra:SetText("")
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\INV_Axe_05")
	AtlasLootMenuItem_23.lootpage="Axesmith1"
	AtlasLootMenuItem_23:Show()
	--Master Hammersmith
	AtlasLootMenuItem_24_Name:SetText(L["Master Hammersmith"])
	AtlasLootMenuItem_24_Extra:SetText("")
	AtlasLootMenuItem_24_Icon:SetTexture("Interface\\Icons\\INV_Hammer_23")
	AtlasLootMenuItem_24.lootpage="Hammersmith1"
	AtlasLootMenuItem_24:Show()
	--Master Swordsmith
	AtlasLootMenuItem_25_Name:SetText(L["Master Swordsmith"])
	AtlasLootMenuItem_25_Extra:SetText("")
	AtlasLootMenuItem_25_Icon:SetTexture("Interface\\Icons\\INV_Sword_41")
	AtlasLootMenuItem_25.lootpage="Swordsmith1"
	AtlasLootMenuItem_25:Show()
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
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Enchanting"]..": "..L["Expert"])
	AtlasLootMenuItem_4_Extra:SetText("")
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_4.lootpage="EnchantingExpert1"
	AtlasLootMenuItem_4:Show()
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Enchanting"]..": "..L["Journeyman"])
	AtlasLootMenuItem_3_Extra:SetText("")
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_3.lootpage = "EnchantingJourneyman1"
	AtlasLootMenuItem_3:Show()
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Enchanting"]..": "..L["Artisan"])
	AtlasLootMenuItem_5_Extra:SetText("")
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Trade_Engraving")
	AtlasLootMenuItem_5.lootpage="EnchantingArtisan1"
	AtlasLootMenuItem_5:Show()
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
	--Gnomish Engineering
	AtlasLootMenuItem_7_Name:SetText(L["Gnomish Engineering"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Gizmo_02")
	AtlasLootMenuItem_7.lootpage="Gnomish1"
	AtlasLootMenuItem_7:Show()
	--Goblin Engineering
	AtlasLootMenuItem_22_Name:SetText(L["Goblin Engineering"])
	AtlasLootMenuItem_22_Extra:SetText("")
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\Spell_Fire_Selfdestruct")
	AtlasLootMenuItem_22.lootpage="Goblin1"
	AtlasLootMenuItem_22:Show()
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
	--Dragonscale Leatherworking
	AtlasLootMenuItem_7_Name:SetText(BS["Dragonscale Leatherworking"])
	AtlasLootMenuItem_7_Extra:SetText("")
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Misc_MonsterScales_03")
	AtlasLootMenuItem_7.lootpage="Dragonscale1"
	AtlasLootMenuItem_7:Show()
	--Tribal Leatherworking
	AtlasLootMenuItem_8_Name:SetText(BS["Tribal Leatherworking"])
	AtlasLootMenuItem_8_Extra:SetText("")
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Spell_Nature_NullWard")
	AtlasLootMenuItem_8.lootpage="Tribal1"
	AtlasLootMenuItem_8:Show()
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
		getglobal("AtlasLootItem_"..i):Hide();
	end
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i):Hide();
		getglobal("AtlasLootMenuItem_"..i).isheader = false;
	end
	getglobal("AtlasLootItemsFrame_BACK"):Show();
	getglobal("AtlasLootItemsFrame_BACK").lootpage = "CRAFTINGMENU";
	getglobal("AtlasLootItemsFrame_NEXT"):Hide();
	getglobal("AtlasLootItemsFrame_PREV"):Hide();
	getglobal("AtlasLootServerQueryButton"):Hide();
	--Apprentice
	AtlasLootMenuItem_2_Name:SetText(L["Survival"]);
	AtlasLootMenuItem_2_Extra:SetText("");
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_Survival");
	AtlasLootMenuItem_2.lootpage = "Survival1";
	AtlasLootMenuItem_2:Show();
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(L["Garderning"]);
	AtlasLootMenuItem_3_Extra:SetText("");
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\trade_herbalism");
	AtlasLootMenuItem_3.lootpage = "Survival2";
	AtlasLootMenuItem_3:Show();
end