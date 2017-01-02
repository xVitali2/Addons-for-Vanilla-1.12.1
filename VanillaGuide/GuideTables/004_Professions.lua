--[[--------------------------------------------------
004_Professions.lua
Authors: mrmr
Version: 1.04.2
------------------------------------------------------
Description: Guide Serie - 004 Professions
    1.04.1
        -- First Release
            Professions Guides
	1.04.2
		-- no changes in here for this revision
------------------------------------------------------
Connection:
--]]--------------------------------------------------

Table_004_Professions = {
-----------1-300 Alchemy
	[7002] = {
		title = "1-300 Alchemy",
		--n = "1-300 Alchemy",
		--pID = 1, nID = 10003,
		--itemCount = 14,
		items = {
			[1] = { str = "#NPC1-300 Alchemy#" },
			[2] = { str = "#DOQUESTAprx. Mats Required#: #VIDEO60#x #TURNINPeacebloom# #VIDEO60#x #TURNINSilverleaf# #VIDEO75#x #TURNINEmpty Vial#" ..
				"#VIDEO80#x #TURNINBriarthorn# #VIDEO30#x #TURNINBruiseweed# #VIDEO65#x #TURNINLeaded Vial#" .. 
				"#VIDEO15#x #TURNINMageroyal# #VIDEO40#x #TURNINStranglekelp# #VIDEO30#x #TURNINLiferoot# #VIDEO30#x #TURNINKingsblood#" ..
				"#VIDEO45#x #TURNINGoldthorn# #VIDEO5#x #TURNINSteelbloom# #VIDEO70#x #TURNINSungrass#" ..
				"#VIDEO15#x #TURNINKhadgars Whisker# #VIDEO90#x #TURNINCrystal Vial# #VIDEO20#x #TURNINArthas Tears#" ..
				"#VIDEO40#x #TURNINBlindweed# #VIDEO40#x #TURNINGolden Sansam# #VIDEO40#x #TURNINMountain Silversage#" },
			[3] = { str = "#VIDEO[1-60]# 60x Minor Healing Potions (1x Peacebloom, 1x Silverleaf, 1x Empty Vial)" },
			[4] = { str = "#VIDEO[60-110]# 50x Lesser Healing Potions (1x Minor Healing Potion, 1x Briarthorn)" },
			[5] = { str = "#VIDEO[110-140]# 30x Healing Potion (1x Bruiseweed, 1x Briarthorn, 1x Leaded Vial)" },
			[6] = { str = "#VIDEO[140-155]# 15x Lesser Mana Potion (1x Mageroyal, 1x Stranglekelp, 1x Empty Vial)" },
			[7] = { str = "#VIDEO[155-185]# 30x Greater Healing Potions (1x Liferoot, 1x Kingsblood, 1x Leaded Vial)" },
			[8] = { str = "#VIDEO[185-210]# 25x Elixir of Agility (1x Stranglekelp, 1x Goldthorn, 1x Leaded Vial)" },
			[9] = { str = "#VIDEO[210-215]# 5x Elixir of Greater Defence (1x Steelbloom, 1x Goldthorn, 1x Leaded Vial)" },
			[10] = { str = "#VIDEO[215-230]# 15x Superior Healing Potion (1x Sungrass, 1x Khadgars Wisker, 1x Crystal Vial)" },
			[11] = { str = "#VIDEO[230-250]# 20x Elixir of Detect Undead (1x Arthas Tears, 1x Crystal Vial)" },
			[12] = { str = "#VIDEO[250-265]# 15x Elixir of Greater Agility (1x Sungrass, 1x Goldthorn, 1x Crystal Vial)" },
			[13] = { str = "#VIDEO[265-285]# 20x Superior Mana Potion (2x Sungrass, 2x Blindweed, 1x Crystal Vial)" },
			[14] = { str = "#VIDEO[285-300]# 20x Major Healing Potion (2x Golden Sansam, 1x Mountain Silversage, 1x Crystal Vial)" },
		}
	},

-----------1-300 Blacksmithing
	[7003] = {
		title = "1-300 Blacksmithing",
		--n = "1-300 Blacksmithing",
		--pID = 10002, nID = 10004, 
		--itemCount = 23,
		items = {
			[1] = { str = "#NPC1-300 Blacksmithing#" },
			[2] = { str = "#DOQUESTAprx. Mats Required#: #VIDEO90#x #TURNINRough Stone# #VIDEO380#x #TURNINCopper Bar# #VIDEO20#x #TURNINCoarse Stone# " ..
				"#VIDEO5#x #TURNINSilver Bar# #VIDEO120#x #TURNINBronze Bar# #VIDEO150#x #TURNINHeavy Stone# " ..
				"#VIDEO5#x #TURNINGold Bar# #VIDEO200#x #TURNINIron Bar# #VIDEO30#x #TURNINGreen Dye# " ..
				"#VIDEO380#x #TURNINSteel Bar# #VIDEO80#x #TURNINSolid Stone# #VIDEO230#x #TURNINMithril Bar# " ..
				"#VIDEO20#x #TURNINDense Stone# #VIDEO430#x #TURNINThorium Bar# #VIDEO10#x #TURNINCore of Earth# " ..
				"#VIDEO90#x #TURNINMageweave Cloth# #VIDEO60#x #TURNINRugged Leather#" },
			[3] = { str = "#VIDEO[1-25]# 50x Rough Sharpening Stones (1x Rough Stone)" },
			[4] = { str = "#VIDEO[25-45]# 20x Rough Grinding Stones (2x Rough Stone)" },
			[5] = { str = "#VIDEO[45-75]# 30x Copper Chain Belt (6x Copper Bar)" },
			[6] = { str = "#VIDEO[75-80]# 10x Coarse Grinding Stones (2x Coarse Stones)" },
			[7] = { str = "#VIDEO[80-100]# 20x Runed Copper Belt (10x Copper Bar)" },
			[8] = { str = "#VIDEO[100-105]# 5x Silver Rod (1x Silver Bar, 2x Rough Grinding Stone)" },
			[9] = { str = "#VIDEO[105-125]# 20x Rough Bronze Leggings (6x Bronze Bar)" },
			[10] = { str = "#VIDEO[125-150]# 50x Heavy Grinding Stone (3x Heavy Stone)" },
			[11] = { str = "#VIDEO[150-155]# 5x Golden Rod (1x Gold Bar, 2x Coard Grinding Stone)" },
			[12] = { str = "#VIDEO[155-165]# 10x Green Iron Leggings (8x Iron Bar, 1x Heavy Grinding Stone, 1x Green Dye)" },
			[13] = { str = "#VIDEO[165-185]# 20x Green Iron Bracers (6x Iron Bar, 1x Green Dye)" },
			[14] = { str = "#VIDEO[185-200]# 15x Golden Scale Bracers (5x Steel Bar, 2x Heavy Grinding Stone)" },
			[15] = { str = "#VIDEO[200-210]# 20x Solid Grinding Stone (4x Solid Stone)" },
			[16] = { str = "#VIDEO[210-215]# 5x Golden Scale Bracers (5x Steel Bar, 2x Heavy Grinding Stone)" },
			[17] = { str = "#VIDEO[215-235]# 20x Steel Plate Helm (14x Steel Bar, 1x Solid Grinding Stone)" },
			[18] = { str = "#VIDEO[235-250]# 15x Mithril Coif (10x Mithril Bar, 6x Mageweave Cloth)" ..
			"If you are lucky enough to have the Mithril Spurs plan, then make those until 275." },
			[19] = { str = "#VIDEO[250-260]# 20x Dense Sharpening Stones (1x Dense Stone)" },
			[20] = { str = "#VIDEO[260-265]# #ACCEPTArmorsmiths# make the following: " ..
					"5x Earthforged Leggings (16x Mithril Bar, 2x Core of Earth)" },
			[21] = { str = "#VIDEO[260-265]# #ACCEPTWeaponsmiths# make any of the following: " .. 
					"5x Light Earthforged Blade (12x Mithril Bar, 4x Core of Earth) " .. 
					"5x Light Emberforged Hammer (12x Mithril Bar, 4x Heart of Fire) " .. 
					"5x Light Skyforged Axe (12x Mithril Bar, 4x Breath of Wind)" }, 
			[22] = { str = "Go see Derotain Mudsipper in Gadgetzan and give him Thorium Bars until you get the plans for the Imperial Plate Belt, Bracers, and Boots." },
			[23] = { str = "#VIDEO[265-275]# 10x Imperial Plate Belt (10x Thorium Bar, 6x Rugged Leather)" },
			[24] = { str = "#VIDEO[275-295]# 20x Imperial Plate Bracers (12x Thorium Bar)" },
			[25] = { str = "#VIDEO[295-300]# 5x Imperial Plate Boots (18x Thorium Bar)" },
		}
	},

-----------1-300 Cooking (Horde & Alliance)
	[7004] = {
		title = "1-300 [H] Cooking",
		--n = "1-300 Cooking (Horde)",
		--pID = 10003, nID = 10005, 
		--itemCount = 11,
		items = {
			[1] = { str = "#NPC1-300 Cooking (Horde)#" },
			[2] = { str = "#VIDEO[1-40]# 70x Spice Bread (1x Simple Flour, 1x Mild Spices)" },
			[3] = { str = "#VIDEO[40-90]# 60x Smoked Bear Meat (1x Bear Meat) " .. 
				"Go to The Sepulcher in Silverpine Forest and buy the Smoked Bear Meat recipe " .. 
				"from Andrew Hilbert. Kill Grizzled bears around Silverpien Forest for Bear Meat." },
			[4] = { str = "#VIDEO[90-125]# 40x Dig Rat Stew (1x Dig Rat) " .. 
				"Go find Grub in The Barrens. He's in a tower by Grosh'gek Farm. " .. 
				"(Just north off the road between Crossroads and Ratchet.) " .. 
				"Pick up the quest for Dig Rat stew. Kill Dig Rats until you have 30 more " .. 
				"than the quest needs. Complete the quest and cook." },
			[5] = { str = "#VIDEO[125-175]# 60x Hot Lion Chops (1x Lion Meat, 1x Hot Spices) " .. 
				"To train as an Expert cook, go to Shadowprey Village and buy " .. 
				"the Expert Cooking Book from Wulan. Go to the Crossroads and buy the " .. 
				"Hot Lion Chops recipe from Zargh and 60 Hot Spices. " .. 
				"Kill Mountain Lions around HIllsbrad Foothills for Lion Meat." },
			[6] = { str = "#VIDEO[175-200]# 30x Roast Raptor (1x Raptor Flesh, 1x Hot Spices) " .. 
				"Go to Grom'gol and buy the Roast Raptor recipe from Nerrist and about 30 Hot Spices. " .. 
				"Kill Raptors around Grom'gol for Raptor Flesh." },
			[7] = { str = "#VIDEO[200-225]# 30x Spider Sausage (2x White Spider Meat) " ..
				"Go to the trainer and train Spider Sausage. " .. 
				"Kill Darkfangs around Dustwallow Marsh for White Spider Meat." },
			[8] = { str = "#VIDEO[225]# Cooking Quest Time! " .. 
				"Go to Gadgetzan. Speak to Dirge Quikcleave. Obtain Artisan Cooking Quest. " .. 
				"Pick up the Tender Wolf Steaks recipe. You need 12 Giant Eggs, 10 Zesty Clam Meat, and 20 Alterac Swiss. " .. 
				"Alterac Swiss: Thunderbluff Innkeeper " .. 
				"Giant Eggs: Owlbeasts in The Hinterlands " .. 
				"Zesty Clam Meat: Steamwheedle Port for the Turtles " .. 
				"Go to Bloodvenom Post in Felwood and buy the Monster Omelet recipe from Bale and 150 Soothing Spices." },
			[9] = { str = "#VIDEO[225-250]# 25x Monster Omelet (1x Giant Egg, 2x Soothing Spices) OR " .. 
				"25x Tender Wolf Steaks (1x Tender Wolf Meat, 1x Soothing Spices)" },
			[10] = { str = "#VIDEO[250-285]# 35x Charred Bear Kabobs (1x Bear Flank) OR " .. 
				"35x Juicy Bear Burger (1x Bear Flank)" },
			[11] = { str = "#VIDEO[285-300]# 20x Smoked Desert Dumplings (1x Sandworm Meat, 1x Soothing Spice)" .. 
				"Go to Cenarion Hold in Silithus. Speak to Calandrath for the Desert Recipe quest chain." .. 
				"When you get to the third quest, you'll get a recipe for Smoked Desert Dumplings." .. 
				"Kill Dredge Crushers and Strikers for the Sandworm Meat." .. 
				"You'll only need about 10 more than the quest needs plus the Soothing Spices (20ish)." },
		}
	},

-----------1-300 Cooking (Horde & Alliance)
	[7005] = {
		title = "1-300 [A] Cooking",
		--n = "1-300 Cooking (Alliance)",
		--pID = 10004, nID = 10006, 
		--itemCount = 13,
		items = {
			[1] = { str = "#NPC1-300 Cooking (Alliance)#" },
			[2] = { str = "#VIDEO[1-40]# 70x Spice Bread (1x Simple Flour, 1x Mild Spices)" },
			[3] = { str = "#VIDEO[40-75]# 40x Smoked Bear Meat (1x Bear Meat) " .. 
				"Go to Drac Roughcut in Thelsamar, Loch Modan and buy the Smoked Bear Meat recipe. " .. 
				"Kill bears around Loch Modan for Bear Meat." },
			[4] = { str = "#VIDEO[75-85]# 10x Crab Cake (1x Crawler Meat) " .. 
				"Kill Crawlers around Darkshore and Westfall for Crawler Meat. " .. 
				"You'll need about 10. Don't sell any Crawler Claws you find. We need them later." },
			[5] = { str = "#VIDEO[85-100]# 20x Cooked Crab Claw (1x Crab Claw, 1x Mild Spice) " .. 
				"Go to Stormwind City and buy the Cooked Crab Claw recipe from Kendor Kabonka. " .. 
				"Get about 20 Mild Spices. Go back to Darkshore or Westfall for anymore claws." },
			[6] = { str = "#VIDEO[100-130]# 30x Seasond Wolf Kabob (2x Lean Wolf Flank, 1x Stormwind Seasoning Herbs) " .. 
				"Go to Chef Grual in Darkshire. Get Seasond Wolf Kabobs Quest. Get Stormwind Seasoning Herbs from Felcia Grump in the Trade District. " .. 
				"Kill Ravagers and Wolves around Duskwood for Lean Wolf Flank." },
			[7] = { str = "#VIDEO[130-175]# 50x Curiosly Tasty Omelet (1x Raptor Egg, 1x Hot Spice) " .. 
				"Train for Expert Cooking at Shandrina by Mystral Lake in Ashenvale. " .. 
				"Go to Kendor Kabonka in Stormwind to buy the Curiosly Tasty Omelet recipe. " .. 
				"Kill Raptors in Arathi Highlands for Raptor Eggs. (Keep any Raptor Meat!)" },
			[8] = { str = "#VIDEO[175-200]# 30x Roast Raptor (1x Raptor Flesh, 1x Hot Spices) " .. 
				"Go to Rebel Camp in STV and buy the Roast Raptor recipe from Corporal Bluth and about 40 Hot Spices. " .. 
				"Kill Raptors around the Gurubashi Arena." },
			[9] = { str = "#VIDEO[200-225]# 30x Spider Sausage (2x White Spider Meat)" ..
				"Go to the trainer and train Spider Sausage." .. 
				"Kill Darkfangs around Dustwallow Marsh for White Spider Meat." },
			[10] = { str = "#VIDEO[225]# Cooking Quest Time! " .. 
				"Go to Gadgetzan. Speak to Dirge Quikcleave. Obtain Artisan Cooking Quest. " .. 
				"Pick up the Tender Wolf Steaks recipe. You need 12 Giant Eggs, 10 Zesty Clam Meat, and 20 Alterac Swiss. " .. 
				"Alterac Swiss: Ben Trias in Stormwind Trade District " .. 
				"Giant Eggs: Owlbeasts in The Hinterlands " .. 
				"Zesty Clam Meat: Steamwheedle Port for the Turtles " .. 
				"Go to Talonbranch Glade in Felwood and buy the Monster Omelet recipe from Malygen and 150 Soothing Spices." },
			[11] = { str = "#VIDEO[225-250]# 25x Monster Omelet (1x Giant Egg, 2x Soothing Spices) OR " .. 
				"25x Tender Wolf Steaks (1x Tender Wolf Meat, 1x Soothing Spices)" },
			[12] = { str = "#VIDEO[250-285]# 35x Charred Bear Kabobs (1x Bear Flank) OR" .. 
				"35x Juicy Bear Burger (1x Bear Flank)" },
			[13] = { str = "#VIDEO[285-300]# 20x Smoked Desert Dumplings (1x Sandworm Meat, 1x Soothing Spice) " .. 
				"Go to Cenarion Hold in Silithus. Speak to Calandrath for the Desert Recipe quest chain. " .. 
				"When you get to the third quest, you'll get a recipe for Smoked Desert Dumplings. " .. 
				"Kill Dredge Crushers and Strikers for the Sandworm Meat. " .. 
				"You'll only need about 10 more than the quest needs plus the Soothing Spices (20ish)." },
		}
	},

-----------1-300 Enchanting
	[7006] = {
		title = "1-300 Enchanting",
		--n = "1-300 Enchanting",
		--pID = 10005, nID = 10007, 
		--itemCount = 26,
		items = {
			[1] = { str = "#NPC1-300 Enchanting#" },
			[2] = { str = "#DOQUESTAprx. Mats Required#: " .. 
			"#VIDEO150#x #TURNINStrange Dust# #VIDEO90#x #TURNINSoul Dust# #VIDEO170#x #TURNINVision Dust# " .. 
			"#VIDEO300#x #TURNINDream Dust# #VIDEO90#x #TURNINIllusion Dust# #VIDEO15#x #TURNINSimple Wood# " .. 
			"#VIDEO15#x #TURNINLesser Magic Essence# #VIDEO25#x #TURNINGreater Magic Essence# #VIDEO15#x #TURNINLesser Astral Essence# " .. 
			"#VIDEO2#x #TURNINGreater Astral Essence# #VIDEO25#x #TURNINLesser Mystic Essence# #VIDEO2#x #TURNINGreater Mystic Essence# " .. 
			"#VIDEO15#x #TURNINLesser Nether Essence# #VIDEO10#x #TURNINGreater Nether Essence# #VIDEO40#x #TURNINPurple Lotus# " .. 
			"#VIDEO20#x #TURNINCrystal Vial# #VIDEO4x# #TURNINGreater Eternal Essence# #VIDEO2#x #TURNINLarge Brilliant Shard# " .. 
			"#VIDEO1#x #TURNINShadowgem# #VIDEO1x# #TURNINIridescent Pearl# #VIDEO1#x #TURNINBlack Pearl# " .. 
			"#VIDEO1#x #TURNINGolden Pearl# #VIDEO1x# #TURNINCopper Rod# #VIDEO1#x #TURNINSilver Rod# " .. 
			"#VIDEO1#x #TURNINGolden Rod# #VIDEO1#x #TURNINTruesilver Rod# #VIDEO1#x #TURNINArcanite Rod#" },
			[3] = { str = "#VIDEO[1-2]# 1x Runed Copper Rod (1x Copper Rod, 1x Strange Dust, 1x Lesser Magic Essence)" },
			[4] = { str = "#VIDEO[2-75]# 74x Enchant Bracer - Minor Health (1x Strange Dust)" },
			[5] = { str = "#VIDEO[75-85]# 10x Enchant Bracer - Minor Deflection (1x Lesser Magic Essence, 1x Strange Dust)" },
			[6] = { str = "#VIDEO[85-100]# 15x Enchant Bracer - Minor Stamina (3x Strange Dust)" },
			[7] = { str = "#VIDEO[100-101]# 1x Runed Silver Rod (1x Silver Rod, 6x Strange Dust, 3x Greater Magic Essence, 1x Shadowgem" },
			[8] = { str = "#VIDEO[101-105]# 5x Enchant Bracer - Minor Stamina (3x Strange Dust)" },
			[9] = { str = "#VIDEO[105-120]# 15x Greater Magic Wand (1x Simple Wood, 1x Greater Magic Essence)" },
			[10] = { str = "#VIDEO[120-130]# 10x Enchant Shield - Minor Stamina (1x Lesser Astral Essence, 2x Strange Dust)" },
			[11] = { str = "#VIDEO[130-150]# 25x Enchant Bracer - Lesser Stamina (2x Soul Dust)" },
			[12] = { str = "#VIDEO[150-151]# 1x Runed Golden Rod (1x Golden Rod, 1x Iridescent Pearl, 2x Greater Astral Essence, 2x Soul Dust)" },
			[13] = { str = "#VIDEO[151-160]# 9x Enchant Bracer - Lesser Stamina (2x Sould Dust)" },
			[14] = { str = "#VIDEO[160-165]# 5x Enchant Shield - Lesser Stamina (1x Lesser Mystic Essence, 1x Soul Dust)" },
			[15] = { str = "#VIDEO[165-180]# 15x Enchant Bracer - Spirit (1x Lesser Mystic Essence)" },
			[16] = { str = "#VIDEO[180-200]# 20x Enchant Bracer - Strength (1x Vision Dust)" },
			[17] = { str = "#VIDEO[200-201]# 1x Runed Truesilver Rod (1x Truesilver Rod, 1x Black Pearl, 2x Greater Mystic Essence, 2x Vision Dust)" },
			[18] = { str = "#VIDEO[201-205]# 4x Enchant Bracer - Strength (1x Vision Dust)" },
			[19] = { str = "#VIDEO[205-225]# 20x Enchant Cloak - Greater Defense (3x Vision Dust)" },
			[20] = { str = "#VIDEO[225-235]# 10x Enchant Gloves - Agility (1x Lesser Nether Essence, 1x Vision Dust)" },
			[21] = { str = "#VIDEO[235-245]# 10x Enchant Chest - Superior Health (6x Vision Dust)" },
			[22] = { str = "#VIDEO[245-250]# 5x Enchant Bracer - Greater Strength (2x Dream Dust, 1x Greater Nether Essence)" },
			[23] = { str = "#VIDEO[250-270]# 20x Lesser Mana Oil (3x Dream Dust, 2x Purple Lotus, 1x Crystal Vial) " .. 
				"You can buy this formula from Kania in Cenarion Hold, Silithus." },
			[24] = { str = "#VIDEO[270-290]# 20x Enchant Shield - Greater Stamina (10x Dream Dust) OR " .. 
				"20x Enchant Boots: Greater Stamina (10x Dream Dust)" },
			[25] = { str = "#VIDEO[290-291]# 1x Runed Arcanite Rod (1x Arcanite Rod, 1x Golden Pearl, 10x Illusion Dust, 4x Greater Eternal Essence, 1x Runed Truesilver Rod, 2x Large Brilliant Shard)" },
			[26] = { str = "#VIDEO[291-300]# 9x Enchant Cloak - Superior Defense (8x Illusion Dust)" },
		}
	},

-----------1-300 Engineering
	[7007] = {
		title = "1-300 Engineering",
		--n = "1-300 Engineering",
		--pID = 10006, nID = 10008, 
		--itemCount = 26,
		items = {
			[1] = { str = "#NPC1-300 Engineering#" },
			[2] = { str = "#DOQUESTAprx. Mats Required#: " .. 
			"#VIDEO90#x #TURNINRough Stone# #VIDEO80#x #TURNINCoarse Stone# #VIDEO75#x #TURNINHeavy Stone# " .. 
			"#VIDEO90#x #TURNINSolid Stone# #VIDEO50#x #TURNINDense Stone# #VIDEO10#x #TURNINWooden Stock# " .. 
			"#VIDEO29#x #TURNINWeak Flux# #VIDEO50#x #TURNINHeavy Leather# #VIDEO10#x #TURNINWool Cloth# " .. 
			"#VIDEO10#x #TURNINMageweave Cloth# #VIDEO33#x #TURNINRune Cloth# #VIDEO51#x #TURNINCopper Bars# " .. 
			"#VIDEO10#x #TURNINSilver Bars# #VIDEO55#x #TURNINBronze Bars# #VIDEO19#x #TURNINIron Bars# " .. 
			"#VIDEO4#x #TURNINSteel Bars# #VIDEO126#x #TURNINMithril Bars# #VIDEO129#x #TURNINThorium Bars#" },
			[3] = { str = "#VIDEO[1-40]# 40x Rough Blasting Powder (1x Rough Stone)" },
			[4] = { str = "#VIDEO[40-50]# 10x Handful of Copper Bolt (1x Copper Bar)" },
			[5] = { str = "#VIDEO[50-51]# 1x Arclight Spanner (6x Copper Bar)" },
			[6] = { str = "#VIDEO[51-65]# 14x Copper Tubes (2x Copper Bar, 1x Weak Flux)" },
			[7] = { str = "#VIDEO[65-75]# 10x Rough Boom Sticks (1x Copper Tube, 1x Handful of Copper Bolts, 1x Wooden Stock)" },
			[8] = { str = "#VIDEO[75-95]# 20x Coarse Blasting Powder (1x Coarse Stone)" },
			[9] = { str = "#VIDEO[95-105]# 20x Silver Contacts (1x Silver Bar)" },
			[10] = { str = "#VIDEO[105-120]# 15x Bronze Tubes (2x Bronze Bar, 1x Weak Flux)" },
			[11] = { str = "#VIDEO[120-125]# 5x Small Bronze Bombs (1x Wool Cloth, 1x Silver Contact, 4x Coarse Blasting Powder, 2x Bronze Bar)" },
			[12] = { str = "#VIDEO[125-145]# 20x Heavy Blasting Powder (1x Heavy Stone)" },
			[13] = { str = "#VIDEO[145-150]# 5x Big Bronze Bombs (2x Heavy Blasting Powder, 3x Bronze Bar, 1x Silver Contact)" },
			[14] = { str = "#VIDEO[150-175]# 25x Blue/Green/Red Fireworks (1x Heavy Leather, 1x Heavy Blasting Powder)" },
			[15] = { str = "#VIDEO[175-176]# 1x Gyromatic Micro-Adjustor (4x Steel Bar)" },
			[16] = { str = "#VIDEO[176-190]# 14x Solid Blasting Pwder (2x Solid Stone)" },
			[17] = { str = "#VIDEO[190-195]# 5x Big Iron Bomb (3x Iron Bar, 3x Heavy Blasting Powder, 1x Silver Contact)" },
			[18] = { str = "#VIDEO[195-205]# 20x Mithril Tubes (3x Mithril Bar)" },
			[19] = { str = "#VIDEO[205-210]# 5x Unstable Triggers (1x Mithril Bar, 1x Mageweave Cloth, 1x Solid Blasting Powder)" },
			[20] = { str = "#VIDEO[210-225]# 15x Hi-Impact Mithril Slugs (1x Mithril Bar, 1x Solid Blasting Powder)" },
			[21] = { str = "#VIDEO[225-235]# 10x Mithril Casings (3x Mithril Bar)" },
			[22] = { str = "#VIDEO[235-245]# 10x Hi-Explosive Bomb (2x Mithril Casings, 1x Unstable Trigger, 2x Solid Blasting Powder)" },
			[23] = { str = "#VIDEO[245-250]# 5x Mithril Gyro-Shot (2x Mithril Bar, 2x Solid Blasting Powder)" },
			[24] = { str = "#VIDEO[250-260]# 10x Dense Blasting Powder (2x Dense Stone)" },
			[25] = { str = "#VIDEO[260-290]# 30x Thorium Widget (3x Thorium Bar, 1x Runecloth)" },
			[26] = { str = "#VIDEO[290-300]# 10x Thorium Shells (2x Thorium Bar, 1x Dense Blasting Powder)" },
		}
	},

-----------1-300 Leatherworking
	[7008] = {
		title = "1-300 Leatherworking",
		--n = "1-300 Leatherworking",
		--pID = 10007, nID = 10009, 
		--itemCount = 24,
		items = {
			[1] = { str = "#NPC1-300 Leatherworking#" },
			[2] = { str = "#VIDEO[1-205]# #DOQUESTAprx. Mats Required#: " .. 
			"#VIDEO275#x #TURNINLight Leather# #VIDEO20#x #TURNINLight Hide# #VIDEO25#x #TURNINMedium Hide# " .. 
			"#VIDEO420#x #TURNINHeavy Leather# #VIDEO10#x #TURNINHeavy Hide# #VIDEO30#x #TURNINBolt of Silk Cloth# " .. 
			"#VIDEO10#x #TURNINIron Buckles#" },
			[3] = { str = "#VIDEO[1-35]# 35x Light Armor Kit (Total: 35x Light Leather)" },
			[4] = { str = "#VIDEO[35-55]# 20x Cured Light Hide (Total: 20x Light Hide)" },
			[5] = { str = "#VIDEO[55-85]# 30x Embossed Leather Gloves (Total: 90x Light Leather)" },
			[6] = { str = "#VIDEO[85-100]# 15x Fine Leather Belt (Total: 90x Light Leather)" },
			[7] = { str = "#VIDEO[100-120]# 25x Cured Medium Hide (Total: 25x Medium Hide)" },
			[8] = { str = "#VIDEO[120-125]# 10x Fine Leather Belt (Total: 60x Light Leather)" },
			[9] = { str = "#VIDEO[125-150]# 25x Dark Leather Belt (Total: 25x Fine Leather Belt, 25x Cured Medium Hide)" },
			[10] = { str = "#VIDEO[150-160]# 10x Cured Heavy Hide (Total: 10x Heavy Hide)" },
			[11] = { str = "#VIDEO[160-170]# 10x Heavy Armor Kit (Total: 50x Heavy Leather)" },
			[12] = { str = "#VIDEO[170-180]# 10x Dusky Leather Leggings (Total: 100x Heavy Leather)" },
			[13] = { str = "#VIDEO[180-190]# 10x Barbaric Shoulders (Total: 80x Heavy Leather, 10x Cured Heavy Hide)" },
			[14] = { str = "#VIDEO[190-195]# 5x Dusky Bracers (Total: 80x Heavy Leather)" },
			[15] = { str = "#VIDEO[195-205]# 10x Dusky Belt (Total: 100x Heavy Leather, 20x Bolt of Silk Cloth, 10x Iron Buckle)" },
			[16] = { str = "#VIDEO[205-250]# #DOQUESTAprx. Mats Required#:                                            " .. 
				"#ACCEPTElemental Leatherworking#: #VIDEO405-455#x #TURNINThick Leather#                                            " .. 
				"#ACCEPTDragonscale Leatherworking:# #VIDEO441-483#x #TURNINThick Leather# #VIDEO40#x #TURNINScorpid Scale# #VIDEO10#x #TURNINWorn Dragonscale#                                            " .. 
				"#ACCEPTTribal Leatherworking#: #VIDEO427-449#x #TURNINThick Leather# #VIDEO112#x #TURNINurtle Scale# #VIDEO11#x #TURNINWildvine# #VIDEO2#x #TURNINCured Thick Hide#" },
			[17] = { str = "#ACCEPTElemental Leatherworking# #VIDEO[205-230]# 25x Nightscape Headband/Tunic (Total: 125-175x Thick Leather) " },
			[18] = { str = "#ACCEPTElemental Leatherworking# #VIDEO[230-250]# 20x Nightscape Pants (Total: 280x Thick Leather)" },
			[19] = { str = "#ACCEPTDragonscale Leatherworking# #VIDEO[205-226]# 21x Nightscape Headband/Tunic (Total: 105-147x Thick Leather) " }, 
			[20] = { str = "#ACCEPTDragonscale Leatherworking# #VIDEO[226-228]# 2x Tough Scorpid Breastplate (Total: 24x Thick Leather, 24x Scorpid Scale) " }, 
			[21] = { str = "#ACCEPTDragonscale Leatherworking# #VIDEO[228-230]# 2x Tough Scorpid Gloves (Total: 12x Thick Leather, 16x Scorpid Scale) " }, 
			[22] = { str = "#ACCEPTDragonscale Leatherworking# #VIDEO[230-250]# 20x Nightscape Pants (Total: 280x Thick Leather)" },
			[23] = { str = "#ACCEPTTribal Leatherworking# #VIDEO[205-211]# 6x Thick Armor Kit (Total: 30x Thick Leather) " }, 
			[24] = { str = "#ACCEPTTribal Leatherworking# #VIDEO[211-222]# 11x Nightscape Headband/Tunic (Total: 55-77x Thick Leather) " }, 
			[25] = { str = "#ACCEPTTribal Leatherworking# #VIDEO[222-224]# 2x Turtle Scale Gloves (Total: 12x Thick Leather, 16x Turtle Scale) " },
			[26] = { str = "#ACCEPTTribal Leatherworking# #VIDEO[224-226]# 2x Turtle Scale Breastplate (Total: 12x Thick Leather, 24x Turtle Scale) " }, 
			[27] = { str = "#ACCEPTTribal Leatherworking# #VIDEO[226-228]# 2x Turtle Scale Bracers (Total: 16x Thick Leather, 24x Turtle Scale) " }, 
			[28] = { str = "#ACCEPTTribal Leatherworking# #VIDEO[228-229]# 1x Wild Leather Vest (Total: 12x Thick Leather, 2x Wildvine)" }, 
			[29] = { str = "#ACCEPTTribal Leatherworking# #VIDEO[229-230]# 1x Wild Leather Helmet (Total: 10x Thick Leather, 2x Wildvine) " }, 
			[30] = { str = "#ACCEPTTribal Leatherworking# #VIDEO[230-232]# 2x Turtle Scale Helm (Total: 28x Thick Leather, 48x Turtle Scale) " }, 
			[31] = { str = "#ACCEPTTribal Leatherworking# #VIDEO[232-250]# 18x Nightscape Pants (Total: 252x Thick Leather)" },
			[32] = { str = "#VIDEO[250-300]# #DOQUESTAprx. Mats Required#: #VIDEO160#x #TURNINThick Leather# #VIDEO470#x #TURNINRugged Leather#" },
			[33] = { str = "#VIDEO[250-260]# 10x Nightscape Boots (Total: 160x Thick Leather)" },
			[34] = { str = "#VIDEO[260-270]# 10x Wicked Leather Gauntlets (Total: 80x Rugged Leather)" },
			[35] = { str = "#VIDEO[270-285]# 15x Wicked Leather Bracers (Total: 180x Rugged Leather)" },
			[36] = { str = "#VIDEO[285-300]# 15x Wicked Leather Headband (Total: 210x Rugged Leather)" },
		}
	},

-----------1-300 Tailoring
	[7009] = {
		title = "1-300 Tailoring",
		--n = "1-300 Tailoring",
		--pID = 10008, nID = 1, 
		--itemCount = 22,
		items = {
			[1] = { str = "#NPC1-300 Tailoring#" },
			[2] = { str = "#DOQUESTAprx. Mats Required#: #VIDEO160#x #TURNINLinen Cloth# #VIDEO200#x #TURNINWool Cloth# #VIDEO760#x #TURNINSilk Cloth# " .. 
			"#VIDEO520#x #TURNINMageweave Cloth# #VIDEO900#x #TURNINRunecloth# #VIDEO120#x #TURNINRugged Leather# " .. 
			"#VIDEO75#x #TURNINCoarse Thread# #VIDEO135#x #TURNINFine Thread# #VIDEO5#x #TURNINGray Dye# " .. 
			"#VIDEO30#x #TURNINBlue Dye# #VIDEO10#x #TURNINBleach# #VIDEO60#x #TURNINRed Dye# " .. 
			"#VIDEO45#x #TURNINSilken Thread# #VIDEO60#x #TURNINHeavy Silken Thread# #VIDEO40#x #TURNINRune Thread#" },
			[3] = { str = "#VIDEO[1-50]# 80x Bolt of Linen Cloth (2x Linen Cloth)" },
			[4] = { str = "#VIDEO[50-70]# 20x Linen Bag (3x Bolt of Linen Cloth, 3x Coarse Thread)" },
			[5] = { str = "#VIDEO[70-75]# 5x Reinforced Linen Cape (2x Bolt of Linen Cloth, 3x Coarse Thread)" },
			[6] = { str = "#VIDEO[75-105]# 60x Bolt of Woolen Cloth (3x Wool Cloth)" },
			[7] = { str = "#VIDEO[105-110]# 5x Gray Woolen Shirt (2x Bool of Woolen Cloth, 1x Fine Thread, 1x Gray Dye)" },
			[8] = { str = "#VIDEO[110-125]# 15x Double-stitched Woolen Shoulders (3x Bolt of Woolen Cloth, 2x Fine Thread)" },
			[9] = { str = "#VIDEO[125-145]# 190x Bolt of Silk Cloth (4x Silk Cloth)" },
			[10] = { str = "#VIDEO[145-160]# 15x Azure Silk Hood (2x Bolt of Silk Cloth, 2x Blue Dye, 1x Fine Thread)" },
			[11] = { str = "#VIDEO[160-170]# 10x Silk Headband (3x Bolt of Silk Cloth, 2x Fine Thread)" },
			[12] = { str = "#VIDEO[170-175]# 5x Formal White Shirt (3x Bolt of Silk Cloth, 2x Bleach, 1x FIne Thread)" },
			[13] = { str = "#VIDEO[175-185]# 100x Bolt of Mageweave (5x Mageweave Cloth)" },
			[14] = { str = "#VIDEO[185-200]# 15x Crimson Silk Vest (4x Bolt of Silk Cloth, 2x Red Dye, 2x Fine Thread)" },
			[15] = { str = "#VIDEO[200-215]# 15x Crimson Silk Pantaloons (4x Bolt of Silk Cloth, 2x Red Dye, 2x Silken Thread)" },
			[16] = { str = "#VIDEO[215-220]# 5x Black Mageweave Leggings/Vest (2x Bolt of Mageweave, 3x Silken Thread)" },
			[17] = { str = "#VIDEO[220-230]# 10x Black Mageweave Gloves (2x Bolt of Mageweave, 2x Heavy Silken Thread)" },
			[18] = { str = "#VIDEO[230-250]# 20x Black Mageweave Headband/Shoulders (3x Bolt of Mageweave, 2x Heavy Silken Thread)" },
			[19] = { str = "#VIDEO[250-260]# 180x Bolt of Runecloth (5x Runecloth)" },
			[20] = { str = "#VIDEO[260-275]# 15x Runecloth Belt (3x Bolt of Runecloth, 1x Rune Thread)" },
			[21] = { str = "#VIDEO[275-280]# 5x Runecloth Bag (5x Bolt of Runecloth, 2x Rugged Leather, 1x Rune Thread)" },
			[22] = { str = "#VIDEO[280-300]# 20x Runecloth Gloves (4x Bolt of Runecloth, 4x Rugged Leather, 1x Rune Thread)" },
		}
	},
}