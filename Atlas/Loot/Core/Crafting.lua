local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");
local BC = AceLibrary("Babble-Class-2.2")
local BS = AceLibrary("Babble-Spell-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2")

local RED = "|cffff0000";
local ORANGE = "|cffFF8400";
local WHITE = "|cffFFFFFF";

function AtlasLoot_CraftingMenu()
	for i = 1, 30, 1 do
		getglobal("AtlasLootItem_"..i):Hide();
	end
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i):Hide();
		getglobal("AtlasLootMenuItem_"..i).isheader = false;
	end
	getglobal("AtlasLootItemsFrame_BACK"):Hide();
	getglobal("AtlasLootItemsFrame_NEXT"):Hide();
	getglobal("AtlasLootItemsFrame_PREV"):Hide();
	getglobal("AtlasLootServerQueryButton"):Hide();
	--Alchemy
	AtlasLootMenuItem_2_Name:SetText(BS["Alchemy"]);
	AtlasLootMenuItem_2_Extra:SetText("");
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy");
	AtlasLootMenuItem_2.lootpage="ALCHEMYMENU";
	AtlasLootMenuItem_2:Show();
	--Blacksmithing
	AtlasLootMenuItem_3_Name:SetText(BS["Blacksmithing"]);
	AtlasLootMenuItem_3_Extra:SetText("");
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing");
	AtlasLootMenuItem_3.lootpage="SMITHINGMENU";
	AtlasLootMenuItem_3:Show();
	--Enchanting
	AtlasLootMenuItem_4_Name:SetText(BS["Enchanting"]);
	AtlasLootMenuItem_4_Extra:SetText("");
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Trade_Engraving");
	AtlasLootMenuItem_4.lootpage="ENCHANTINGMENU";
	AtlasLootMenuItem_4:Show();
	--Engineering
	AtlasLootMenuItem_5_Name:SetText(BS["Engineering"]);
	AtlasLootMenuItem_5_Extra:SetText("");
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Trade_Engineering");
	AtlasLootMenuItem_5.lootpage="ENGINEERINGMENU";
	AtlasLootMenuItem_5:Show();
	--Herbalism
	AtlasLootMenuItem_6_Name:SetText(BS["Herbalism"]);
	AtlasLootMenuItem_6_Extra:SetText("");
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Trade_Herbalism");
	AtlasLootMenuItem_6.lootpage="Herbalism1";
	AtlasLootMenuItem_6:Show();
	--Leatherworking
	AtlasLootMenuItem_7_Name:SetText(BS["Leatherworking"]);
	AtlasLootMenuItem_7_Extra:SetText("");
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17");
	AtlasLootMenuItem_7.lootpage="LEATHERWORKINGMENU";
	AtlasLootMenuItem_7:Show();
	--Mining
	AtlasLootMenuItem_8_Name:SetText(BS["Mining"]);
	AtlasLootMenuItem_8_Extra:SetText("");
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Trade_Mining");
	AtlasLootMenuItem_8.lootpage="MININGMENU";
	AtlasLootMenuItem_8:Show();
	--Tailoring
	AtlasLootMenuItem_9_Name:SetText(BS["Tailoring"]);
	AtlasLootMenuItem_9_Extra:SetText("");
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring");
	AtlasLootMenuItem_9.lootpage="TAILORINGMENU";
	AtlasLootMenuItem_9:Show();
	--Cooking
	AtlasLootMenuItem_11_Name:SetText(BS["Cooking"]);
	AtlasLootMenuItem_11_Extra:SetText("");
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\INV_Misc_Food_15");
	AtlasLootMenuItem_11.lootpage="COOKINGMENU";
	AtlasLootMenuItem_11:Show();
	--First Aid
	AtlasLootMenuItem_12_Name:SetText(BS["First Aid"]);
	AtlasLootMenuItem_12_Extra:SetText("");
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfSacrifice");
	AtlasLootMenuItem_12.lootpage="FirstAid1";
	AtlasLootMenuItem_12:Show();
	--Poisons
	AtlasLootMenuItem_14_Name:SetText(BS["Poisons"]);
	AtlasLootMenuItem_14_Extra:SetText("|cfffff468"..BC["Rogue"]);
	AtlasLootMenuItem_14_Icon:SetTexture("Interface\\Icons\\Trade_BrewPoison");
	AtlasLootMenuItem_14.lootpage="Poisons1";
	AtlasLootMenuItem_14:Show();
	--Crafted Armor Sets
	AtlasLootMenuItem_17_Name:SetText(AL["Crafted Sets"]);
	AtlasLootMenuItem_17_Extra:SetText("");
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Box_01");
	AtlasLootMenuItem_17.lootpage="CRAFTSET";
	AtlasLootMenuItem_17:Show();
	--Crafted Epic Weapons
	AtlasLootMenuItem_18_Name:SetText(AL["Crafted Epic Weapons"]);
	AtlasLootMenuItem_18_Extra:SetText("");
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Hammer_Unique_Sulfuras");
	AtlasLootMenuItem_18.lootpage="CraftedWeapons1";
	AtlasLootMenuItem_18:Show();
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show();
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..AL["Crafting"]);
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
end

function AtlasLootCraftedSetMenu()
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
	--Tailoring Header
	AtlasLootMenuItem_2_Name:SetText(RED..BS["Tailoring"]);
	AtlasLootMenuItem_2_Extra:SetText("");
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Chest_Cloth_21");
	AtlasLootMenuItem_2.isheader = true;
	AtlasLootMenuItem_2:Show();
	--Bloodvine Garb
	AtlasLootMenuItem_3_Name:SetText(BIS["Bloodvine Garb"]);
	AtlasLootMenuItem_3_Extra:SetText("");
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Pants_Cloth_14");
	AtlasLootMenuItem_3.lootpage="BloodvineG";
	AtlasLootMenuItem_3:Show();
	--Leatherworking Leather Header
	AtlasLootMenuItem_5_Name:SetText(RED..BS["Leatherworking"]);
	AtlasLootMenuItem_5_Extra:SetText(WHITE..AL["Leather"]);
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Chest_Leather_04");
	AtlasLootMenuItem_5.isheader = true;
	AtlasLootMenuItem_5:Show();
	--Volcanic Armor
	AtlasLootMenuItem_6_Name:SetText(BIS["Volcanic Armor"]);
	AtlasLootMenuItem_6_Extra:SetText(ORANGE..AL["Fire Resistance Gear"]);
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\INV_Pants_06");
	AtlasLootMenuItem_6.lootpage="VolcanicArmor";
	AtlasLootMenuItem_6:Show();
	--Ironfeather Armor
	AtlasLootMenuItem_7_Name:SetText(BIS["Ironfeather Armor"]);
	AtlasLootMenuItem_7_Extra:SetText("");
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Chest_Leather_06");
	AtlasLootMenuItem_7.lootpage="IronfeatherArmor";
	AtlasLootMenuItem_7:Show();
	--Stormshroud Armor
	AtlasLootMenuItem_8_Name:SetText(BIS["Stormshroud Armor"]);
	AtlasLootMenuItem_8_Extra:SetText("");
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\INV_Chest_Leather_08");
	AtlasLootMenuItem_8.lootpage="StormshroudArmor";
	AtlasLootMenuItem_8:Show();
	--Devilsaur Armor
	AtlasLootMenuItem_9_Name:SetText(BIS["Devilsaur Armor"]);
	AtlasLootMenuItem_9_Extra:SetText("");
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\INV_Pants_Wolf");
	AtlasLootMenuItem_9.lootpage="DevilsaurArmor";
	AtlasLootMenuItem_9:Show();
	--Blood Tiger Harness
	AtlasLootMenuItem_10_Name:SetText(BIS["Blood Tiger Harness"]);
	AtlasLootMenuItem_10_Extra:SetText("");
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\INV_Shoulder_23");
	AtlasLootMenuItem_10.lootpage="BloodTigerH";
	AtlasLootMenuItem_10:Show();
	--Primal Batskin
	AtlasLootMenuItem_11_Name:SetText(BIS["Primal Batskin"]);
	AtlasLootMenuItem_11_Extra:SetText("");
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\INV_Chest_Leather_03");
	AtlasLootMenuItem_11.lootpage="PrimalBatskin";
	AtlasLootMenuItem_11:Show();
	--Mail Blacksmithing Header
	AtlasLootMenuItem_13_Name:SetText(RED..BS["Blacksmithing"]);
	AtlasLootMenuItem_13_Extra:SetText(WHITE..AL["Mail"]);
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\INV_Chest_Chain_04");
	AtlasLootMenuItem_13.isheader = true;
	AtlasLootMenuItem_13:Show();
	--Bloodsoul Embrace
	AtlasLootMenuItem_14_Name:SetText(BIS["Bloodsoul Embrace"]);
	AtlasLootMenuItem_14_Extra:SetText("");
	AtlasLootMenuItem_14_Icon:SetTexture("Interface\\Icons\\INV_Shoulder_15");
	AtlasLootMenuItem_14.lootpage="BloodsoulEmbrace";
	AtlasLootMenuItem_14:Show();
	--Leatherworking Mail Header
	AtlasLootMenuItem_20_Name:SetText(RED..BS["Leatherworking"]);
	AtlasLootMenuItem_20_Extra:SetText(WHITE..AL["Mail"]);
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\INV_Chest_Chain_12");
	AtlasLootMenuItem_20.isheader = true;
	AtlasLootMenuItem_20:Show();
	--Green Dragon Mail
	AtlasLootMenuItem_21_Name:SetText(BIS["Green Dragon Mail"]);
	AtlasLootMenuItem_21_Extra:SetText(ORANGE..AL["Nature Resistance Gear"]);
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Pants_05");
	AtlasLootMenuItem_21.lootpage="GreenDragonM";
	AtlasLootMenuItem_21:Show();
	--Blue Dragon Mail
	AtlasLootMenuItem_22_Name:SetText(BIS["Blue Dragon Mail"]);
	AtlasLootMenuItem_22_Extra:SetText(ORANGE..AL["Arcane Resistance Gear"]);
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\INV_Chest_Chain_04");
	AtlasLootMenuItem_22.lootpage="BlueDragonM";
	AtlasLootMenuItem_22:Show();
	--Black Dragon Mail
	AtlasLootMenuItem_23_Name:SetText(BIS["Black Dragon Mail"]);
	AtlasLootMenuItem_23_Extra:SetText(ORANGE..AL["Fire Resistance Gear"]);
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\INV_Pants_03");
	AtlasLootMenuItem_23.lootpage="BlackDragonM";
	AtlasLootMenuItem_23:Show();
	--Plate Blacksmithing header
	AtlasLootMenuItem_28_Name:SetText(RED..BS["Blacksmithing"]);
	AtlasLootMenuItem_28_Extra:SetText(WHITE..AL["Plate"]);
	AtlasLootMenuItem_28_Icon:SetTexture("Interface\\Icons\\INV_Chest_Plate10");
	AtlasLootMenuItem_28.isheader = true;
	AtlasLootMenuItem_28:Show();
	--Imperial Plate
	AtlasLootMenuItem_29_Name:SetText(BIS["Imperial Plate"]);
	AtlasLootMenuItem_29_Extra:SetText("");
	AtlasLootMenuItem_29_Icon:SetTexture("Interface\\Icons\\INV_Belt_01");
	AtlasLootMenuItem_29.lootpage="ImperialPlate";
	AtlasLootMenuItem_29:Show();
	--The Darksoul
	AtlasLootMenuItem_30_Name:SetText(BIS["The Darksoul"]);
	AtlasLootMenuItem_30_Extra:SetText("");
	AtlasLootMenuItem_30_Icon:SetTexture("Interface\\Icons\\INV_Shoulder_01");
	AtlasLootMenuItem_30.lootpage="TheDarksoul";
	AtlasLootMenuItem_30:Show();
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show();
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..AL["Crafted Sets"]);
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
end

function AtlasLoot_AlchemyMenu()
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
	AtlasLootMenuItem_2_Name:SetText(BS["Alchemy"]..": "..AL["Apprentice"]);
	AtlasLootMenuItem_2_Extra:SetText("");
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy");
	AtlasLootMenuItem_2.lootpage = "AlchemyApprentice1";
	AtlasLootMenuItem_2:Show();
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Alchemy"]..": "..AL["Journeyman"]);
	AtlasLootMenuItem_3_Extra:SetText("");
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy");
	AtlasLootMenuItem_3.lootpage = "AlchemyJourneyman1";
	AtlasLootMenuItem_3:Show();
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Alchemy"]..": "..AL["Expert"]);
	AtlasLootMenuItem_4_Extra:SetText("");
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy");
	AtlasLootMenuItem_4.lootpage="AlchemyExpert1";
	AtlasLootMenuItem_4:Show();
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Alchemy"]..": "..AL["Artisan"]);
	AtlasLootMenuItem_5_Extra:SetText("");
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Trade_Alchemy");
	AtlasLootMenuItem_5.lootpage="AlchemyArtisan1";
	AtlasLootMenuItem_5:Show();
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show();
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Alchemy"]);
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
end

function AtlasLoot_SmithingMenu()
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
	AtlasLootMenuItem_2_Name:SetText(BS["Blacksmithing"]..": "..AL["Apprentice"]);
	AtlasLootMenuItem_2_Extra:SetText("");
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing");
	AtlasLootMenuItem_2.lootpage = "SmithingApprentice1";
	AtlasLootMenuItem_2:Show();
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Blacksmithing"]..": "..AL["Journeyman"]);
	AtlasLootMenuItem_3_Extra:SetText("");
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing");
	AtlasLootMenuItem_3.lootpage = "SmithingJourneyman1";
	AtlasLootMenuItem_3:Show();
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Blacksmithing"]..": "..AL["Expert"]);
	AtlasLootMenuItem_4_Extra:SetText("");
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing");
	AtlasLootMenuItem_4.lootpage="SmithingExpert1";
	AtlasLootMenuItem_4:Show();
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Blacksmithing"]..": "..AL["Artisan"]);
	AtlasLootMenuItem_5_Extra:SetText("");
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Trade_BlackSmithing");
	AtlasLootMenuItem_5.lootpage="SmithingArtisan1";
	AtlasLootMenuItem_5:Show();
	--Armorsmith
	AtlasLootMenuItem_7_Name:SetText(BS["Armorsmith"]);
	AtlasLootMenuItem_7_Extra:SetText("");
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Chest_Plate04");
	AtlasLootMenuItem_7.lootpage="Armorsmith1";
	AtlasLootMenuItem_7:Show();
	--Weaponsmith
	AtlasLootMenuItem_22_Name:SetText(BS["Weaponsmith"]);
	AtlasLootMenuItem_22_Extra:SetText("");
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\INV_Sword_25");
	AtlasLootMenuItem_22.lootpage="Weaponsmith1";
	AtlasLootMenuItem_22:Show();
	--Master Axesmith
	AtlasLootMenuItem_23_Name:SetText(AL["Master Axesmith"]);
	AtlasLootMenuItem_23_Extra:SetText("");
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\INV_Axe_05");
	AtlasLootMenuItem_23.lootpage="Axesmith1";
	AtlasLootMenuItem_23:Show();
	--Master Hammersmith
	AtlasLootMenuItem_24_Name:SetText(AL["Master Hammersmith"]);
	AtlasLootMenuItem_24_Extra:SetText("");
	AtlasLootMenuItem_24_Icon:SetTexture("Interface\\Icons\\INV_Hammer_23");
	AtlasLootMenuItem_24.lootpage="Hammersmith1";
	AtlasLootMenuItem_24:Show();
	--Master Swordsmith
	AtlasLootMenuItem_25_Name:SetText(AL["Master Swordsmith"]);
	AtlasLootMenuItem_25_Extra:SetText("");
	AtlasLootMenuItem_25_Icon:SetTexture("Interface\\Icons\\INV_Sword_41");
	AtlasLootMenuItem_25.lootpage="Swordsmith1";
	AtlasLootMenuItem_25:Show();
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show();
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Blacksmithing"]);
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
end

function AtlasLoot_EnchantingMenu()
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
	AtlasLootMenuItem_2_Name:SetText(BS["Enchanting"]..": "..AL["Apprentice"]);
	AtlasLootMenuItem_2_Extra:SetText("");
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_Engraving");
	AtlasLootMenuItem_2.lootpage = "EnchantingApprentice1";
	AtlasLootMenuItem_2:Show();
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Enchanting"]..": "..AL["Expert"]);
	AtlasLootMenuItem_4_Extra:SetText("");
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Trade_Engraving");
	AtlasLootMenuItem_4.lootpage="EnchantingExpert1";
	AtlasLootMenuItem_4:Show();
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Enchanting"]..": "..AL["Journeyman"]);
	AtlasLootMenuItem_3_Extra:SetText("");
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Trade_Engraving");
	AtlasLootMenuItem_3.lootpage = "EnchantingJourneyman1";
	AtlasLootMenuItem_3:Show();
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Enchanting"]..": "..AL["Artisan"]);
	AtlasLootMenuItem_5_Extra:SetText("");
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Trade_Engraving");
	AtlasLootMenuItem_5.lootpage="EnchantingArtisan1";
	AtlasLootMenuItem_5:Show();
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show();
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Enchanting"]);
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
end

function AtlasLoot_EngineeringMenu()
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
	AtlasLootMenuItem_2_Name:SetText(BS["Engineering"]..": "..AL["Apprentice"]);
	AtlasLootMenuItem_2_Extra:SetText("");
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_Engineering");
	AtlasLootMenuItem_2.lootpage = "EngineeringApprentice1";
	AtlasLootMenuItem_2:Show();
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Engineering"]..": "..AL["Journeyman"]);
	AtlasLootMenuItem_3_Extra:SetText("");
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Trade_Engineering");
	AtlasLootMenuItem_3.lootpage = "EngineeringJourneyman1";
	AtlasLootMenuItem_3:Show();
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Engineering"]..": "..AL["Expert"]);
	AtlasLootMenuItem_4_Extra:SetText("");
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Trade_Engineering");
	AtlasLootMenuItem_4.lootpage="EngineeringExpert1";
	AtlasLootMenuItem_4:Show();
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Engineering"]..": "..AL["Artisan"]);
	AtlasLootMenuItem_5_Extra:SetText("");
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Trade_Engineering");
	AtlasLootMenuItem_5.lootpage="EngineeringArtisan1";
	AtlasLootMenuItem_5:Show();
	--Gnomish Engineering
	AtlasLootMenuItem_7_Name:SetText(AL["Gnomish Engineering"]);
	AtlasLootMenuItem_7_Extra:SetText("");
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Gizmo_02");
	AtlasLootMenuItem_7.lootpage="Gnomish1";
	AtlasLootMenuItem_7:Show();
	--Goblin Engineering
	AtlasLootMenuItem_22_Name:SetText(AL["Goblin Engineering"]);
	AtlasLootMenuItem_22_Extra:SetText("");
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\Spell_Fire_Selfdestruct");
	AtlasLootMenuItem_22.lootpage="Goblin1";
	AtlasLootMenuItem_22:Show();
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show();
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Engineering"]);
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
end

function AtlasLoot_LeatherworkingMenu()
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
	AtlasLootMenuItem_2_Name:SetText(BS["Leatherworking"]..": "..AL["Apprentice"]);
	AtlasLootMenuItem_2_Extra:SetText("");
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17");
	AtlasLootMenuItem_2.lootpage = "LeatherApprentice1";
	AtlasLootMenuItem_2:Show();
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Leatherworking"]..": "..AL["Journeyman"]);
	AtlasLootMenuItem_3_Extra:SetText("");
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17");
	AtlasLootMenuItem_3.lootpage = "LeatherJourneyman1";
	AtlasLootMenuItem_3:Show();
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Leatherworking"]..": "..AL["Expert"]);
	AtlasLootMenuItem_4_Extra:SetText("");
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17");
	AtlasLootMenuItem_4.lootpage="LeatherExpert1";
	AtlasLootMenuItem_4:Show();
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Leatherworking"]..": "..AL["Artisan"]);
	AtlasLootMenuItem_5_Extra:SetText("");
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Misc_ArmorKit_17");
	AtlasLootMenuItem_5.lootpage="LeatherArtisan1";
	AtlasLootMenuItem_5:Show();
	--Dragonscale Leatherworking
	AtlasLootMenuItem_7_Name:SetText(BS["Dragonscale Leatherworking"]);
	AtlasLootMenuItem_7_Extra:SetText("");
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Misc_MonsterScales_03");
	AtlasLootMenuItem_7.lootpage="Dragonscale1";
	AtlasLootMenuItem_7:Show();
	--Tribal Leatherworking
	AtlasLootMenuItem_8_Name:SetText(BS["Tribal Leatherworking"]);
	AtlasLootMenuItem_8_Extra:SetText("");
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Spell_Nature_NullWard");
	AtlasLootMenuItem_8.lootpage="Tribal1";
	AtlasLootMenuItem_8:Show();
	--Elemental Leatherworking
	AtlasLootMenuItem_22_Name:SetText(BS["Elemental Leatherworking"]);
	AtlasLootMenuItem_22_Extra:SetText("");
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\Spell_Fire_Volcano");
	AtlasLootMenuItem_22.lootpage="Elemental1";
	AtlasLootMenuItem_22:Show();
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show();
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Leatherworking"]);
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
end

function AtlasLoot_TailoringMenu()
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
	AtlasLootMenuItem_2_Name:SetText(BS["Tailoring"]..": "..AL["Apprentice"]);
	AtlasLootMenuItem_2_Extra:SetText("");
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring");
	AtlasLootMenuItem_2.lootpage = "TailoringApprentice1";
	AtlasLootMenuItem_2:Show();
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Tailoring"]..": "..AL["Journeyman"]);
	AtlasLootMenuItem_3_Extra:SetText("");
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring");
	AtlasLootMenuItem_3.lootpage = "TailoringJourneyman1";
	AtlasLootMenuItem_3:Show();
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Tailoring"]..": "..AL["Expert"]);
	AtlasLootMenuItem_4_Extra:SetText("");
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring");
	AtlasLootMenuItem_4.lootpage="TailoringExpert1";
	AtlasLootMenuItem_4:Show();
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Tailoring"]..": "..AL["Artisan"]);
	AtlasLootMenuItem_5_Extra:SetText("");
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Trade_Tailoring");
	AtlasLootMenuItem_5.lootpage="TailoringArtisan1";
	AtlasLootMenuItem_5:Show();
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show();
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Tailoring"]);
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
end

function AtlasLoot_CookingMenu()
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
	AtlasLootMenuItem_2_Name:SetText(BS["Cooking"]..": "..AL["Apprentice"]);
	AtlasLootMenuItem_2_Extra:SetText("");
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Misc_Food_15");
	AtlasLootMenuItem_2.lootpage = "CookingApprentice1";
	AtlasLootMenuItem_2:Show();
	--Journeyman
	AtlasLootMenuItem_3_Name:SetText(BS["Cooking"]..": "..AL["Journeyman"]);
	AtlasLootMenuItem_3_Extra:SetText("");
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Misc_Food_15");
	AtlasLootMenuItem_3.lootpage = "CookingJourneyman1";
	AtlasLootMenuItem_3:Show();
	--Expert
	AtlasLootMenuItem_4_Name:SetText(BS["Cooking"]..": "..AL["Expert"]);
	AtlasLootMenuItem_4_Extra:SetText("");
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Misc_Food_15");
	AtlasLootMenuItem_4.lootpage="CookingExpert1";
	AtlasLootMenuItem_4:Show();
	--Artisan
	AtlasLootMenuItem_5_Name:SetText(BS["Cooking"]..": "..AL["Artisan"]);
	AtlasLootMenuItem_5_Extra:SetText("");
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\INV_Misc_Food_15");
	AtlasLootMenuItem_5.lootpage="CookingArtisan1";
	AtlasLootMenuItem_5:Show();
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show();
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Cooking"]);
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
end

function AtlasLoot_MiningMenu()
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
	--Mining
	AtlasLootMenuItem_2_Name:SetText(BS["Mining"]);
	AtlasLootMenuItem_2_Extra:SetText("");
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Trade_Mining");
	AtlasLootMenuItem_2.lootpage = "Mining1";
	AtlasLootMenuItem_2:Show();
	--Smelting
	AtlasLootMenuItem_17_Name:SetText(BS["Smelting"]);
	AtlasLootMenuItem_17_Extra:SetText("");
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\Spell_Fire_FlameBlades");
	AtlasLootMenuItem_17.lootpage = "Smelting1";
	AtlasLootMenuItem_17:Show();
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show();
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..BS["Mining"]);
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
end