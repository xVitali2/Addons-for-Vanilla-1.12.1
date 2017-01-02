local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");

local ORANGE = "|cffFF8400";

function AtlasLootRepMenu()
	for i = 1, 30, 1 do
		getglobal("AtlasLootItem_"..i):Hide();
	end
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i):Hide();
		getglobal("AtlasLootMenuItem_"..i).isheader = false;
	end
	getglobal("AtlasLootItemsFrame_NEXT"):Hide();
	getglobal("AtlasLootItemsFrame_PREV"):Hide();
	getglobal("AtlasLootItemsFrame_BACK"):Hide();
	getglobal("AtlasLootServerQueryButton"):Hide();
	--Argent Dawn
	AtlasLootMenuItem_2_Name:SetText(AL["Argent Dawn"]);
	AtlasLootMenuItem_2_Extra:SetText("");
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Talisman_08");
	AtlasLootMenuItem_2.lootpage="Argent1";
	AtlasLootMenuItem_2:Show();
	--Bloodsail Pirates
	AtlasLootMenuItem_17_Name:SetText(AL["Bloodsail Buccaneers"]);
	AtlasLootMenuItem_17_Extra:SetText("");
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\INV_Helmet_66");
	AtlasLootMenuItem_17.lootpage="Bloodsail1";
	AtlasLootMenuItem_17:Show();
	--Brood of Nozdormu
	AtlasLootMenuItem_3_Name:SetText(AL["Brood of Nozdormu"]);
	AtlasLootMenuItem_3_Extra:SetText("");
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Ring_40");
	AtlasLootMenuItem_3.lootpage="AQBroodRings";
	AtlasLootMenuItem_3:Show();
	--Cenarion Hold
	AtlasLootMenuItem_18_Name:SetText(AL["Cenarion Circle"]);
	AtlasLootMenuItem_18_Extra:SetText("");
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\INV_Chest_Plate07");
	AtlasLootMenuItem_18.lootpage="Cenarion1";
	AtlasLootMenuItem_18:Show();
	--Darkmoon Faire
	AtlasLootMenuItem_4_Name:SetText(AL["Darkmoon Faire"]);
	AtlasLootMenuItem_4_Extra:SetText("");
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\INV_Misc_Ticket_Tarot_Maelstrom_01");
	AtlasLootMenuItem_4.lootpage="Darkmoon";
	AtlasLootMenuItem_4:Show();
	--The Defilers
	AtlasLootMenuItem_25_Name:SetText(AL["The Defilers"]);
	AtlasLootMenuItem_25_Extra:SetText("|cffFF0000"..AL["Horde"]);
	AtlasLootMenuItem_25_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07");
	AtlasLootMenuItem_25.lootpage="Defilers";
	AtlasLootMenuItem_25:Show();
	--Frostwolf Clan
	AtlasLootMenuItem_26_Name:SetText(AL["Frostwolf Clan"]);
	AtlasLootMenuItem_26_Extra:SetText("|cffFF0000"..AL["Horde"]);
	AtlasLootMenuItem_26_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_FrostwolfTrinket_01");
	AtlasLootMenuItem_26.lootpage="Frostwolf1";
	AtlasLootMenuItem_26:Show();
	--Gelkis Clan Centaur
	AtlasLootMenuItem_19_Name:SetText(AL["Gelkis Clan Centaur"]);
	AtlasLootMenuItem_19_Extra:SetText("");
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\INV_Misc_Head_Centaur_01");
	AtlasLootMenuItem_19.lootpage="GelkisClan1";
	AtlasLootMenuItem_19:Show();
	--Hydraxian Waterlords
	AtlasLootMenuItem_5_Name:SetText(AL["Hydraxian Waterlords"]);
	AtlasLootMenuItem_5_Extra:SetText("");
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Frost_FrostArmor");
	AtlasLootMenuItem_5.lootpage="WaterLords1";
	AtlasLootMenuItem_5:Show();
	--The League of Arathor
	AtlasLootMenuItem_10_Name:SetText(AL["The League of Arathor"]);
	AtlasLootMenuItem_10_Extra:SetText("|cff2773ff"..AL["Alliance"]);
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_Amulet_07");
	AtlasLootMenuItem_10.lootpage="LeagueofArathor";
	AtlasLootMenuItem_10:Show();
	--Magram Clan Centaur
	AtlasLootMenuItem_20_Name:SetText(AL["Magram Clan Centaur"]);
	AtlasLootMenuItem_20_Extra:SetText("");
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\INV_Misc_Head_Centaur_01");
	AtlasLootMenuItem_20.lootpage="MagramClan1";
	AtlasLootMenuItem_20:Show();
	--Stormpike Guard
	AtlasLootMenuItem_11_Name:SetText(AL["Stormpike Guard"]);
	AtlasLootMenuItem_11_Extra:SetText("|cff2773ff"..AL["Alliance"]);
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\INV_Jewelry_StormPikeTrinket_01");
	AtlasLootMenuItem_11.lootpage="Stormpike1";
	AtlasLootMenuItem_11:Show();
	--Thorium Brotherhood
	AtlasLootMenuItem_6_Name:SetText(AL["Thorium Brotherhood"]);
	AtlasLootMenuItem_6_Extra:SetText("");
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\INV_Ingot_Mithril");
	AtlasLootMenuItem_6.lootpage="Thorium1";
	AtlasLootMenuItem_6:Show();
	--Timbermaw Hold
	AtlasLootMenuItem_21_Name:SetText(AL["Timbermaw Hold"]);
	AtlasLootMenuItem_21_Extra:SetText("");
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\INV_Misc_Horn_01");
	AtlasLootMenuItem_21.lootpage="Timbermaw";
	AtlasLootMenuItem_21:Show();
	--The Wintersaber Trainers
	AtlasLootMenuItem_7_Name:SetText(AL["Wintersaber Trainers"]);
	AtlasLootMenuItem_7_Extra:SetText("|cff2773ff"..AL["Alliance"]);
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Ability_Mount_PinkTiger");
	AtlasLootMenuItem_7.lootpage="Wintersaber1";
	AtlasLootMenuItem_7:Show();
	--Zandalar Tribe
	AtlasLootMenuItem_22_Name:SetText(AL["Zandalar Tribe"]);
	AtlasLootMenuItem_22_Extra:SetText("");
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\INV_Misc_Coin_08");
	AtlasLootMenuItem_22.lootpage="Zandalar1";
	AtlasLootMenuItem_22:Show();
	for i = 1, 30, 1 do
		getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show();
	end
	AtlasLoot_BossName:SetText("|cffFFFFFF"..AL["Factions"]);
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
end
