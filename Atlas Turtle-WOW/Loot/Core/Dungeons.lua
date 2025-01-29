local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");

function AtlasLoot_DungeonsMenu1()
	AtlasLoot_PrepMenu(nil, AL["Dungeons & Raids"])
	AtlasLootCharDB.LastBoss = "DUNGEONSMENU1"
	AtlasLootCharDB.LastBossText = AL["Dungeons & Raids"]
	AtlasLootItemsFrame_NEXT:Show()
    --RFC
    AtlasLootMenuItem_1_Name:SetText(AL["[13-18] Ragefire Chasm"]);
	AtlasLootMenuItem_1_Extra:SetText(AL["Orgrimmar"]);
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_1.lootpage="RFCTaragaman";
	AtlasLootMenuItem_1:Show();
    --WC
    AtlasLootMenuItem_2_Name:SetText(AL["[17-24] Wailing Caverns"]);
	AtlasLootMenuItem_2_Extra:SetText(AL["Barrens"]);
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_2.lootpage="WCLordCobrahn";
	AtlasLootMenuItem_2:Show();
	--DM
	AtlasLootMenuItem_3_Name:SetText(AL["[17-24] The Deadmines"]);
	AtlasLootMenuItem_3_Extra:SetText(AL["Westfall"]);
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_3.lootpage="DMRhahkZor";
	AtlasLootMenuItem_3:Show();
	--SFK
	AtlasLootMenuItem_4_Name:SetText(AL["[22-30] Shadowfang Keep"]);
	AtlasLootMenuItem_4_Extra:SetText(AL["Silverpine Forest"]);
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_4.lootpage="SFKRethilgore";
	AtlasLootMenuItem_4:Show();
	--BFD
	AtlasLootMenuItem_5_Name:SetText(AL["[23-32] Blackfathom Deeps"]);
	AtlasLootMenuItem_5_Extra:SetText(AL["Ashenvale"]);
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_5.lootpage="BFDGhamoora";
	AtlasLootMenuItem_5:Show();
	--Stockades
	AtlasLootMenuItem_6_Name:SetText(AL["[22-30] The Stockade"]);
	AtlasLootMenuItem_6_Extra:SetText(AL["Stormwind"]);
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_6.lootpage="SWStTargorr";
	AtlasLootMenuItem_6:Show();
	--Gnomer
	AtlasLootMenuItem_7_Name:SetText(AL["[29-38] Gnomeregan"]);
	AtlasLootMenuItem_7_Extra:SetText(AL["Dun Morogh"]);
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_7.lootpage="GnGrubbis";
	AtlasLootMenuItem_7:Show();
	--RFK
	AtlasLootMenuItem_8_Name:SetText(AL["[29-38] Razorfen Kraul"]);
	AtlasLootMenuItem_8_Extra:SetText(AL["Barrens"]);
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_8.lootpage="RFKAggem";
	AtlasLootMenuItem_8:Show();
	--Crescent Grove
	AtlasLootMenuItem_9_Name:SetText(AL["[32-38] The Crescent Grove"]);
	AtlasLootMenuItem_9_Extra:SetText(AL["Ashenvale"]);
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_9.lootpage="TCGGrovetenderEngryss";
	AtlasLootMenuItem_9:Show();
	--SM GY
	AtlasLootMenuItem_10_Name:SetText(AL["[27-36] Scarlet Monastery (Graveyard)"]);
	AtlasLootMenuItem_10_Extra:SetText(AL["Tirisfal Glades"]);
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_10.lootpage="SMVishas";
	AtlasLootMenuItem_10:Show();
	--SM Library
	AtlasLootMenuItem_11_Name:SetText(AL["[28-39] Scarlet Monastery (Library)"]);
	AtlasLootMenuItem_11_Extra:SetText(AL["Tirisfal Glades"]);
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_11.lootpage="SMHoundmasterLoksey";
	AtlasLootMenuItem_11:Show();
	--SM Armory
	AtlasLootMenuItem_12_Name:SetText(AL["[32-41] Scarlet Monastery (Armory)"]);
	AtlasLootMenuItem_12_Extra:SetText(AL["Tirisfal Glades"]);
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_12.lootpage="SMHerod";
	AtlasLootMenuItem_12:Show();
	--SM Cathedral
	AtlasLootMenuItem_13_Name:SetText(AL["[35-45] Scarlet Monastery (Cathedral)"]);
	AtlasLootMenuItem_13_Extra:SetText(AL["Tirisfal Glades"]);
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_13.lootpage="SMFairbanks";
	AtlasLootMenuItem_13:Show();
	--RFD
	AtlasLootMenuItem_14_Name:SetText(AL["[36-46] Razorfen Downs"]);
	AtlasLootMenuItem_14_Extra:SetText(AL["Barrens"]);
	AtlasLootMenuItem_14_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_14.lootpage="RFDTutenkash";
	AtlasLootMenuItem_14:Show();
	--Uldaman
	AtlasLootMenuItem_15_Name:SetText(AL["[40-51] Uldaman"]);
	AtlasLootMenuItem_15_Extra:SetText(AL["Badlands"]);
	AtlasLootMenuItem_15_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_15.lootpage="UldBaelog";
	AtlasLootMenuItem_15:Show();
	--Gilneas
	AtlasLootMenuItem_16_Name:SetText(AL["[42-50] Gilneas City"]);
	AtlasLootMenuItem_16_Extra:SetText(AL["Gilneas"]);
	AtlasLootMenuItem_16_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_16.lootpage="GCMatthiasHoltz";
	AtlasLootMenuItem_16:Show();
	--Mara
	AtlasLootMenuItem_17_Name:SetText(AL["[45-55] Maraudon"]);
	AtlasLootMenuItem_17_Extra:SetText(AL["Desolace"]);
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_17.lootpage="MaraNoxxion";
	AtlasLootMenuItem_17:Show();
	--ZF
	AtlasLootMenuItem_18_Name:SetText(AL["[44-54] Zul'Farrak"]);
	AtlasLootMenuItem_18_Extra:SetText(AL["Tanaris"]);
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_18.lootpage="ZFAntusul";
	AtlasLootMenuItem_18:Show();
	--ST
	AtlasLootMenuItem_19_Name:SetText(AL["[50-60] The Sunken Temple"]);
	AtlasLootMenuItem_19_Extra:SetText(AL["Swamp of Sorrows"]);
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_19.lootpage="STBalconyMinibosses";
	AtlasLootMenuItem_19:Show();
	--HFQ
	AtlasLootMenuItem_20_Name:SetText(AL["[50-60] Hateforge Quarry"]);
	AtlasLootMenuItem_20_Extra:SetText(AL["Burning Steppes"]);
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_20.lootpage="HQHighForemanBargulBlackhammer";
	AtlasLootMenuItem_20:Show();
	--BRD
	AtlasLootMenuItem_21_Name:SetText(AL["[52-60] Blackrock Depths"]);
	AtlasLootMenuItem_21_Extra:SetText(AL["Burning Steppes"]);
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_21.lootpage="BRDLordRoccor";
	AtlasLootMenuItem_21:Show();
	--DME
	AtlasLootMenuItem_22_Name:SetText(AL["[55-60] Dire Maul (East)"]);
	AtlasLootMenuItem_22_Extra:SetText(AL["Feralas"]);
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_22.lootpage="DMEPusillin";
	AtlasLootMenuItem_22:Show();
	--DMW
	AtlasLootMenuItem_23_Name:SetText(AL["[57-60] Dire Maul (West)"]);
	AtlasLootMenuItem_23_Extra:SetText(AL["Feralas"]);
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_23.lootpage="DMWTendrisWarpwood";
	AtlasLootMenuItem_23:Show();
	--DMN
	AtlasLootMenuItem_24_Name:SetText(AL["[57-60] Dire Maul (North)"]);
	AtlasLootMenuItem_24_Extra:SetText(AL["Feralas"]);
	AtlasLootMenuItem_24_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_24.lootpage="DMNGuardMoldar";
	AtlasLootMenuItem_24:Show();
	--Scholo
	AtlasLootMenuItem_25_Name:SetText(AL["[58-60] Scholomance"]);
	AtlasLootMenuItem_25_Extra:SetText(AL["Western Plaguelands"]);
	AtlasLootMenuItem_25_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_25.lootpage="SCHOLOKirtonostheHerald";
	AtlasLootMenuItem_25:Show();
	--Strat
	AtlasLootMenuItem_26_Name:SetText(AL["[58-60] Stratholme"]);
	AtlasLootMenuItem_26_Extra:SetText(AL["Eastern Plaguelands"]);
	AtlasLootMenuItem_26_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_26.lootpage="STRATSkull";
	AtlasLootMenuItem_26:Show();
	--LBRS
	AtlasLootMenuItem_27_Name:SetText(AL["[55-60] Lower Blackrock Spire"]);
	AtlasLootMenuItem_27_Extra:SetText(AL["Burning Steppes"]);
	AtlasLootMenuItem_27_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_27.lootpage="LBRSSpirestoneButcher";
	AtlasLootMenuItem_27:Show();
	--UBRS
	AtlasLootMenuItem_28_Name:SetText(AL["[58-60] Upper Blackrock Spire"]);
	AtlasLootMenuItem_28_Extra:SetText(AL["Burning Steppes"]);
	AtlasLootMenuItem_28_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_28.lootpage="UBRSEmberseer";
	AtlasLootMenuItem_28:Show();
	--Kara crypt
	AtlasLootMenuItem_29_Name:SetText(AL["[58-60] Karazhan Crypt"]);
	AtlasLootMenuItem_29_Extra:SetText(AL["Deadwind Pass"]);
	AtlasLootMenuItem_29_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_29.lootpage="KCMarrowspike";
	AtlasLootMenuItem_29:Show()
	--CoT:BM
	AtlasLootMenuItem_30_Name:SetText(AL["[60] Caverns of Time: Black Morass"]);
	AtlasLootMenuItem_30_Extra:SetText(AL["Tanaris"]);
	AtlasLootMenuItem_30_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_30.lootpage="COTBMChronar";
	AtlasLootMenuItem_30:Show()
end

function AtlasLoot_DungeonsMenu2()
	AtlasLoot_PrepMenu(nil, AL["Dungeons & Raids"])
	AtlasLootCharDB.LastBoss = "DUNGEONSMENU2"
	AtlasLootCharDB.LastBossText = AL["Dungeons & Raids"]
	AtlasLootItemsFrame_PREV:Show()
	--SWV
    AtlasLootMenuItem_1_Name:SetText(AL["[60] Stormwind Vault"]);
	AtlasLootMenuItem_1_Extra:SetText(AL["Stormwind"]);
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_1.lootpage="SWVAszoshGrimflame";
	AtlasLootMenuItem_1:Show();
	--ZG
    AtlasLootMenuItem_3_Name:SetText(AL["[RAID] Zul'Gurub"]);
	AtlasLootMenuItem_3_Extra:SetText(AL["Stranglethorn Vale"]);
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_3.lootpage="ZGJeklik";
	AtlasLootMenuItem_3:Show();
	--AQ20
	AtlasLootMenuItem_4_Name:SetText(AL["[RAID] Ruins of Ahn'Qiraj"]);
	AtlasLootMenuItem_4_Extra:SetText(AL["Silithus"]);
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_4.lootpage="AQ20Kurinnaxx";
	AtlasLootMenuItem_4:Show();
	--MC
	AtlasLootMenuItem_5_Name:SetText(AL["[RAID] Molten Core"]);
	AtlasLootMenuItem_5_Extra:SetText(AL["Burning Steppes"]);
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_5.lootpage="MCLucifron";
	AtlasLootMenuItem_5:Show();
	--Ony
	AtlasLootMenuItem_6_Name:SetText(AL["[RAID] Onyxia's Lair"]);
	AtlasLootMenuItem_6_Extra:SetText(AL["Dustwallow Marsh"]);
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_6.lootpage="Onyxia";
	AtlasLootMenuItem_6:Show();
	--LKH
	AtlasLootMenuItem_7_Name:SetText(AL["[RAID] Lower Karazhan Halls"]);
	AtlasLootMenuItem_7_Extra:SetText(AL["Deadwind Pass"]);
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_7.lootpage="LKHRolfen";
	AtlasLootMenuItem_7:Show();
	--BWL
	AtlasLootMenuItem_8_Name:SetText(AL["[RAID] Blackwing Lair"]);
	AtlasLootMenuItem_8_Extra:SetText(AL["Burning Steppes"]);
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_8.lootpage="BWLRazorgore";
	AtlasLootMenuItem_8:Show();
	--ES
	AtlasLootMenuItem_9_Name:SetText(AL["[RAID] Emerald Sanctum"]);
	AtlasLootMenuItem_9_Extra:SetText(AL["Hyjal"]);
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_9.lootpage="ESErennius";
	AtlasLootMenuItem_9:Show();
	--AQ40
	AtlasLootMenuItem_10_Name:SetText(AL["[RAID] Temple of Ahn'Qiraj"]);
	AtlasLootMenuItem_10_Extra:SetText(AL["Silithus"]);
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_10.lootpage="AQ40Skeram";
	AtlasLootMenuItem_10:Show();
	--Naxx
	AtlasLootMenuItem_11_Name:SetText(AL["[RAID] Naxxramas"]);
	AtlasLootMenuItem_11_Extra:SetText(AL["Eastern Plaguelands"]);
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_11.lootpage="NAXPatchwerk";
	AtlasLootMenuItem_11:Show();
end