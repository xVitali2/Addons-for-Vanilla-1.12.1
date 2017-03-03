--[[--------------------------------------------------
003_Alliance_12to20.lua
Authors: mrmr, lanjelin
Version: 1.04.3
------------------------------------------------------
Description: Guide Serie - 003 From Lvl 12 to Lvl 20
	1.04.1
		-- First Release
			Alliance's Guide
			from level 12 to lever 20
	1.04.2
		-- no changes in here for this revision
	1.04.3
		-- Added color codes
			Fixed various spelling errors
			Adjustment to coordinate visibility
			Playtested and corrected all steps
------------------------------------------------------
Connection:
--]]--------------------------------------------------
Table_003_Alliance_12to20 = {
	[1214] = {
		title = "12-14 Darkshore",
		--L- Playtested and corrected
		items = {
			[1] = { str = "12-14 Darkshore" },
			[2] = { str = "Get #GETWashed Ashore pt.1# from #NPC# next to the flightmaster, and #GETFor Love Eternal# at the docks at #COORD[35,43]#.", x = 35, y = 43, zone = "Darkshore" },
			[3] = { str = "Be sure to pick up the flightpath aswell, unless you came from Teldrassil. Set Auberdine as your home." },
			[4] = { str = "Accept #GETBuzzbox 827# upstairs in the Inn, #GETCave Mushrooms# in front of the Inn and #GETThe Red Crystal# near the bridge" },
			[5] = { str = "Buy some 6 slot bags if you haven’t found 3 by now at #COORD[37,40]#, then accept #GETBashal'Aran pt.1# and #GETTools of the Highborne#.", x = 37, y = 40, zone = "Darkshore" },
			[6] = { str = "Go south over the bridge, accept #GETPlagued Lands# and #GETHow Big a Threat? pt.1#. Skip #SKIPA Lost Master# for now." },
			[7] = { str = "Go do #DOWashed Ashore pt.1# at #COORD[36,50]# grind from town to there to get #ITEM[Crawler Legs]# for #DOBuzzbox 827#.", x = 36, y = 50, zone = "Darkshore" },
			[8] = { str = "Turn in #INBuzzbox 827# at #COORD[36,46]# accept #GETBuzzbox 411#, and turn in #INWashed Ashore pt.1# accept #GETWashed Ashore pt.2#.", x = 36, y = 46, zone = "Darkshore" },
			[9] = { str = "Swim out and do #DOWashed Ashore pt.2# at #COORD[32,46]#. Turn it in", x = 32, y = 46, zone = "Darkshore" },
			[10] = { str = "Do #DOBuzzbox 411# by killing #NPCDarkshore Threshers# in the water. Turn it in at #COORD[42,29]# and accept #GETBuzzbox 323#. You might have to grind a few mobs to hit lvl 13 to accept the quest.", x = 42, y = 29, zone = "Darkshore" },
			[11] = { str = "Stop at #COORD[42,32]# accept #GETBeached Sea Creature#.", x = 42, y = 32, zone = "Darkshore" },
			[12] = { str = "Turn in #INBashal'Aran pt.1# at #COORD[44,36]# grinding along the way, accept #GETBashal'Aran pt.2# killing #NPCGrells# around him for #ITEM[Grell Earring]#.", x = 44, y = 36, zone = "Darkshore" },
			[13] = { str = "Turn in #INBashal'Aran pt.2# at #COORD[44,36]# accept #GETBashal’Aran pt.3#", x = 44, y = 36, zone = "Darkshore" },
			[14] = { str = "Do #DOBashal’Aran pt.3# by killing #NPCDeth'ryll Satyr# and turn it in accept #GETBashal’Aran pt.4# " },
			[15] = { str = "Grind to #COORD[47,48]# and do #DOThe Red Crystal#", x = 47, y = 48, zone = "Darkshore" },
			[16] = { str = "Grind to #COORD[40,53]# to find the camp for #DOHow Big a Threat? pt.1#", x = 40, y = 53, zone = "Darkshore" },
			[17] = { str = "Run down to #NPCAmeth’Aran# at #COORD[40,59]# and accept #GETThe Fall of Ameth'Aran#.", x = 40, y = 59, zone = "Darkshore" },
			[18] = { str = "Do #DOThe Fall of Ameth'Aran#, #DOBashal’Aran pt.4#, #DOTools of the Highborne# and #DOFor Love Eternal# in this area." },
			[19] = { str = "Turn in #INThe Fall of Ameth'Aran# at #COORD[40,59]#.", x = 40, y = 59, zone = "Darkshore" },
			[20] = { str = "Go across the road of Amath’Aran, and do #DOPlagued Lands#." },
			[21] = { str = "Hearth back to Auberdine, turn in #INFor Love Eternal#, #INBeached Sea Creature#, #INThe Red Crystal#, accept #GETAs Water Cascades#" },
			[22] = { str = "Fill the #ITEM[Empty Water Tube]# in the Moonwell for #DOAs Water Cascades#, turn in #INPlagued Lands#, accept #GETCleansing the Infected#, turn in #INHow Big a Threat? pt.1# accept #GETHow Big a Threat? Pt.2# and #GETThundris Windweaver#. Accept #GETThe Tower of Althalaxx pt.1# upstairs." },
			[23] = { str = "Go in the merchant house, turn in #INTools of the Highborne# and #INThundris Windweaver#, accept #GETThe Cliffspring River#." },
			[24] = { str = "You should be 14 by now, get skills in Darnassus and be sure to accept the quest #GETTrouble In Darkshore# from #NPCChief Archaeologist Greywhisker# at #COORD[23,64]#" },
		}
	},
	[1417] = {
		title = "14-17 Darkshore",
		--L- Playtested and corrected
		items = {
			[1] = { str = "14-17 Darkshore" },
			[2] = { str = "Turn in #INBashal’Aran pt.4# at #COORD[44,36]#.", x = 44, y = 36, zone = "Darkshore" },
			[3] = { str = "Kill #NPCMoonstalkers# and #NPCRabid Thistle Bears# all around #COORD[48,30]#, for #DOCleansing the Infected# and #DOBuzzbox 323#, then head to #COORD[50,25]# for #DOThe Cliffspring River#.", x = 50, y = 25, zone = "Darkshore" },
			[4] = { str = "Accept #GETBeached Sea Turtle# at #COORD[44,20]#", x = 44, y = 20, zone = "Darkshore" },
			[5] = { str = "Turn in #INBuzzbox 323# at #COORD[51,25]# accept #GETBuzzbox 525#", x = 51, y = 25, zone = "Darkshore" },
			[6] = { str = "Go to #COORD[55,33]# and do #DOCave Mushrooms#.", x = 55, y = 33, zone = "Darkshore" },
			[7] = { str = "Head south to #COORD[47,48]# to turn in #INAs Water Cascades#, accept #GETThe Fragments Within#.", x = 47, y = 48, zone = "Darkshore" },
			[8] = { str = "Grind to #COORD[40,53]# and do #DOHow Big a Threat? Pt.2#", x = 40, y = 53, zone = "Darkshore" },
			[9] = { str = "Go to #COORD[37,62]# and accept #GETBeached Sea Turtle#", x = 37, y = 62, zone = "Darkshore" },
			[10] = { str = "Continue south and accept #GETBeached Sea Creature# at #COORD[36,70]#.", x = 36, y = 70, zone = "Darkshore" },
			[11] = { str = "Kill #NPCGrizzled Thistle Bear# south of Grove of the Ancients for #DOBuzzbox 525# then turn it in at #COORD[41,81]#.", x = 41, y = 81, zone = "Darkshore" },		
			[12] = { str = "Head over to #COORD[32,80]# and get #GETBeached Sea Creature#.", x = 32, y = 80, zone = "Darkshore" },
			[13] = { str = "Hearth back to Auberdine, and turn in all the #INBeached Sea Creature# quests." },
			[14] = { str = "Accept #GETFruit of the Sea#, turn in #INCave Mushrooms# and accept #GETOnu#, turn in #INThe Fragments Within#, turn in #INTrouble In Darkshore# and accept #GETThe Absent Minded Prospector#" },
			[15] = { str = "Turn in #INThe Cliffspring River#, accept #GETThe Blackwood Corrupted#, turn in #INCleansing the Infected# and accept #GETTharnariun's Hope#, turn in #INHow Big a Threat? pt.2# accept #GETA Lost Master#" },
			[16] = { str = "Fill the #ITEM[Empty Cleansing Bowl]# at the Moonwell" }, -- Accept #GETWANTED: Murkdeep!# from the wanted sign next to the inn.
		--L-	[13] = { str = "Stop at #COORD[35,74]# and do #DOWANTED: Murkdeep!# you have to clear the camp, then the 2 waves from the ocean, then he comes. He’s lvl 19 If you have trouble with him just kite him.", x = 35, y = 74, zone = "Darkshore" },
			[17] = { str = "Pick up #ITEM[Grains]# for #DOThe Blackwood Corrupted# at #COORD[50,35]#.", x = 50, y = 35, zone = "Darkshore" },
			[18] = { str = "Go do #DOTharnariun's Hope# at #COORD[52,37]#.", x = 52, y = 37, zone = "Darkshore" },
			[19] = { str = "Get #ITEM[Nuts]# at #COORD[52,34]#, and #ITEM[Fruit]# at #COORD[52,33]# for #DOThe Blackwood Corrupted#.", x = 52, y = 34, zone = "Darkshore" },
			[20] = { str = "Clear around the bonfire at #COORD[52,33]# and place the food. Kill #NPCXabraxxis#, and loot the #ITEM[Talisman]# from the ground beside him..", x = 52, y = 33, zone = "Darkshore" },
			[21] = { str = "Go to #COORD[55,25]# turn in #INThe Tower of Althalaxx pt.1# Accept #GETThe Tower of Althalaxx pt.2#, and do it by killing mobs outside the tower.", x = 55, y = 25, zone = "Darkshore" },
			[22] = { str = "Turn in #INThe Tower of Althalaxx pt.2#, and accept #GETThe Tower of Althalaxx pt.3#" },
			[23] = { str = "Run to #COORD[53,18]# and accept #GETBeached Sea Creature#", x = 53, y = 18, zone = "Darkshore" },
			[24] = { str = "Do #DOFruit of the Sea# at the #NPCCrawlers# here." },
			[25] = { str = "Hearth back to Auberdine." },
			[26] = { str = "Turn in #INBeached Sea Creature#, #INFruit of the Sea#, #INThe Blackwood Corrupted# and #INTharnariun's Hope#." },
			[27] = { str = "Get on boat to Menethil Harbor, the left/south pier." },
			[28] = { str = "If you got flightpath to Thelsamar (Loch Modan), fly there, if not, run to #COORD[54,73]#, and follow the mountainpath to Loch Modan.", x = 54, y = 73, zone = "Wetlands" },
		}
	},
	[1718] = {
		title = "17-18 Loch Modan",
		--L- Playtested and corrected
		items = {
			[1] = { str = "17-18 Loch Modan" },
			[2] = { str = "Go to the Algaz Station bunker at #COORD[24,18]#, and accept #GETFilthy Paws# and #GETStormpike's Order#.", x = 24, y = 18, zone = "Loch Modan" },
			[3] = { str = "Run to the Cave at #COORD[35,18]# and do #DOFilthy Paws#, #ITEM[Miner's Gear]# are looted from the ground. Turn it in back at the bunker.", x = 35, y = 18, zone = "Loch Modan" },
			[4] = { str = "Go to Thelsamar at #COORD[33,50]#, and get the flightpath if you don't have it. DO NOT make it your home.", x = 33, y = 50, zone = "Loch Modan" },
			[5] = { str = "Accept #GETIronband's Excavation# in the last house on the right, go turn it in at #COORD[65,67]#, accept #GETGathering Idols# and #GETExcavation Progress Report#.", x = 65, y = 67, zone = "Loch Modan" },
			[6] = { str = "Do #DOGathering Idols# in the Excavation site just west, then turn it back in." },
			[7] = { str = "Run around the excavation site, and get to the house at #COORD[82,62]#.", x = 82, y = 62, zone = "Loch Modan" },
			[8] = { str = "Turn right when you enter, and accept #GETCrocolisk Hunting#, then go to the other side and accept #GETA Hunter's Boast#" },
			[9] = { str = "Do #DOA Hunter's Boast# by killing #NPCMountain Buzzard# in front of the house." },
			[10] = { str = "Turn in #INA Hunter's Boast# accept #GETA Hunter's Challenge#. Kill #NPCElder Mountain Boar# at around #COORD[76,46]#.", x = 76, y = 46, zone = "Loch Modan" },
			[11] = { str = "Turn in #INA Hunter's Challenge#, accept #GETVyrin's Revenge pt.1#." },
			[12] = { str = "Go to #COORD[64,48]# and accept #GETBingles' Missing Supplies#. Do #DOCrocolisk Hunting# here on the shore, and on the island at #COORD[54,38]# if necessary.", x = 64, y = 48, zone = "Loch Modan" },
			[13] = { str = "Get all the parts for #DOBingles' Missing Supplies#. #ITEM[Blastencapper]# at #COORD[54,27]#, #ITEM[Wrench]# at #COORD[49,30]#, #ITEM[Hammer]# at #COORD[52,24]#, and #ITEM[Screwdriver]# at #COORD[48,21]#.", x = 54, y = 27, zone = "Loch Modan" },
			[14] = { str = "Access the dam from the west side and accept #GETA Dark Threat Looms pt.1# at #COORD[46,14]#, then run out the east entrance and turn it in at the #ITEMSuspicious Barrel#, accept #GETA Dark Threat Looms pt.2#", x = 45, y = 13, zone = "Loch Modan" },
			[15] = { str = "Run back and turn in #INA Dark Threat Looms pt.2# at #COORD[46,14]#, SKIP #SKIPA Dark Threat Looms pt.3#.", x = 45, y = 13, zone = "Loch Modan" },
			[16] = { str = "Run down to Thelsamar and turn in #INExcavation Progress Report# at #COORD[37,47]#, accept #GETReport to Ironforge#.", x = 37, y = 47, zone = "Loch Modan" },
			[17] = { str = "Go to #COORD[38,61]# and do #DOVyrin's Revenge pt.1#.", x = 38, y = 61, zone = "Loch Modan" },
			[18] = { str = "Run back to the house at #COORD[83,62]# turn in #INCrocolisk Hunting# and #INVyrin's Revenge pt.1#, accept #GETWyrin’s Revenge pt.2#, and turn it in.", x = 83, y = 62, zone = "Loch Modan" },
			[19] = { str = "Go to #COORD[63,47]# and turn in #INBingles' Missing Supplies#.", x = 63, y = 47, zone = "Loch Modan" },
			[20] = { str = "If you got Ironforge flightpath, fly there, if not, run down to #COORD[22,70]# and follow the path North into Dun Morogh", x = 22, y = 70, zone = "Loch Modan" },
			[21] = { str = "Run along the road to Ironforge at #COORD[53,35]#.", x = 53, y = 35, zone = "Dun Morogh" },
			[22] = { str = "Get Ironforge weapon training at #COORD[61,89]#, and get flight path at #COORD[55,38]#. Turn in #INReport to Ironforge# at #COORD[74,12]#, SKIP #SKIPPowder to Ironband#.", x = 74, y = 12, zone = "Ironforge" },
			[23] = { str = "Get on the tram to Stormwind at #COORD[76,51]#.", x = 76, y = 51, zone = "Ironforge" },
			[24] = { str = "Turn in #INStormpike's Order# at #COORD[58,16]# in Stormwind.", x = 58, y = 16, zone = "Stormwind City" },
			[25] = { str = "Get Stormwind weapon training at #COORD[57,57]#, and flightpath at #COORD[66,62]#.", x = 66, y = 62, zone = "Stormwind City" },
			[26] = { str = "Leave Stormwind, then run towards #COORD[91,73]# in Elwynn Forest, and enter Redridge Mountains", x = 91, y = 73, zone = "Elwynn Forest" },
		}
	},
	[1820] = {
		title = "18-20 Redridge Mountains",
		--L- Playtested and corrected
		items = {
			[1] = { str = "18-20 Redridge Mountains" },
			[2] = { str = "Accept #GETEncroaching Gnolls# from #NPCGuard Parker# at #COORD[15,71]#.", x = 15, y = 71, zone = "Redridge Mountains" },
			[3] = { str = "Turn in #INEncroaching Gnolls# at #COORD[30,60]#, accept #GETAssessing the Threat#. Get the flightpath.", x = 30, y = 60, zone = "Redridge Mountains" },
			[4] = { str = "Cross the bridge, accept #GETBlackrock Menace#, #GETThe Lost Tools# and #GETThe Everstill Bridge#. SKIP #SKIPThe Price of Shoes#" },
			[5] = { str = "Accept #GETHilary's Necklace# on the dock, accept #GETSelling Fish# near the shed outside the Inn. Go inside the Inn and accept #GETA Free Lunch#, SKIP #SKIPDry Times#." },
			[6] = { str = "Go west of Lakeshire and accept #GETRedridge Goulash# inside the house at #COORD[23,44]#.", x = 23, y = 44, zone = "Redridge Mountains" },
			[7] = { str = "Get 5 #ITEM[Great Goretusk Snouts]# for #DORedridge Goulash# just west of the houses. Beware #NPCBellygrub#. Loot #ITEM[Hillary's Necklace]# from the #ITEMGlinting Mud Pile# underwater at #COORD[19,52]#.", x = 19, y = 52, zone = "Redridge Mountains" },
			[8] = { str = "Head towards #COORD[42,55]# for #DOThe Lost Tools# and #DOSelling Fish#. Save at least 8 #ITEM[Murloc Fins]# for a later quest.", x = 42, y = 55, zone = "Redridge Mountains" },
			[9] = { str = "Turn in #INThe Lost Tools# by the bridge, #INHilary's Necklace# on the dock, and #INSelling Fish# by the shed. You should be half way to level 20 at this point." },
			[10] = { str = "Turn in #INA Free Lunch# at #COORD[15,71]#, accept #GETVisit the Herbalist#.", x = 15, y = 71, zone = "Redridge Mountains" },
			[11] = { str = "Kill #NPCSpiders# for #DORedridge Goulash# between #COORD[15,71]# and #COORD[33,76]#.", x = 33, y = 76, zone = "Redridge Mountains" },
			[12] = { str = "Do #DOAssessing the Thread# at #COORD[31,84]# and #COORD[43,72]#.", x = 43, y = 72, zone = "Redridge Mountains" },
			[13] = { str = "Kill #NPCCondors# for #DORedridge Goulash# around #COORD[57,76]#", x = 57, y = 73, zone = "Redridge Mountains" },
			[14] = { str = "Run back to Lakeshire, turn in #INAssessing the Threat# near the flightpath. Go to the two houses West of Lakeshire, at #COORD[23,46]# and turn in #INRedridge Goulash# and #INVisit the Herbalist#, accept #GETDelivering Daffodils#", x = 23, y = 46, zone = "Redridge Mountains" },
			[15] = { str = "Go in the Inn and turn in #INDelivering Daffodils#. You should now be level 20, accept #GETMurloc Poachers# in front of the shed, if you still have the #ITEM[Murloc Fins]# in your bag, turn it in." },
			[16] = { str = "Kill #NPCGnolls# North of Lakeshire for #DOThe Everstill Bridge#, then turn it in." },
			[17] = { str = "Hearth back to Auberdine. You should definitely be level 20 by this point and at least half way to level 21." },
		}
	},
}