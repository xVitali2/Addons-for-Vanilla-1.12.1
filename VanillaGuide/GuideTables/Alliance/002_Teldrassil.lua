--[[--------------------------------------------------
002_Teldrassil.lua
Authors: mrmr, lanjelin
Version: 1.04.3
------------------------------------------------------
Description: Guide Serie - 002 Teldrassil
	1.04.1
		-- First Release
			Night Elves Teldrassil's Guide
			from level 1 to lever 12
	1.04.2
		-- no changes in here for this revision
	1.04.3
		-- Added color codes
			Fixed various spelling errors
			Adjustment to coordinate visibility
			Playtested every step
------------------------------------------------------
Connection:
--]]--------------------------------------------------
Table_002_Teldrassil = {
	[0106] = {
		title = "1-6 Teldrassil",
		items = {
			[1] = { str = "1-6 Teldrassil" },
			[2] = { str = "Accept #GETThe Balance of Nature pt.1# from #NPCConservator Ilthalaine# just in front og you, and go do it by killing mobs at #COORD[57,45]# and #COORD[61,43]#.", x = 57, y = 45, zone = "Teldrassil" },
			[3] = { str = "Run back to turn it in, then accept #GETThe Balance of Nature pt.2# and #GETEtched Sigil# at #COORD[59,44]#.", x = 59, y = 44, zone = "Teldrassil" },
			[4] = { str = "Get #GETThe Woodland Protector pt.1# at #COORD[60,43]# and #GETA Good Friend# at #COORD[61,42]#.", x = 61, y = 42, zone = "Teldrassil" },
			[5] = { str = "Turn in #INThe Woodland Protector pt.1# at #COORD[58,45]# and accept #GETThe Woodland Protector pt.2#", x = 58, y = 45, zone = "Teldrassil" },
			[6] = { str = "Do #DOThe Woodland Protector pt.2# at #COORD[56,46]#. Run back and turn it in at #COORD[57,45]#.", x = 56, y = 46, zone = "Teldrassil" },
			[7] = { str = "Accept #GETWebwood Venom# at #COORD[58,42]#. Go turn in #INEtched Sigil# at your class trainer. Get new skills.", x = 58, y = 42, zone = "Teldrassil" },
			[8] = { str = "Head over to #COORD[60,35]# and do #DOThe Balance of Nature pt.2#, mobs are all around.", x = 60, y = 35, zone = "Teldrassil" },
			[9] = { str = "Do #DOWebwood Venom# at #COORD[57,32]#, in and outside the cave.", x = 57, y = 32, zone = "Teldrassil" },
			[10] = { str = "Turn in #INA Good Friend# at #COORD[55,33]# in a cove just west of the cave. Accept #GETA Friend in Need#.", x = 55, y = 33, zone = "Teldrassil" },
			[11] = { str = "Turn in #INWebwood Venom# at #COORD[58,42]#. Accept #GETWebwood Egg#.", x = 58, y = 42, zone = "Teldrassil" },
			[12] = { str = "Turn in #INThe Balance of Nature pt.2# at #COORD[59,44]#", x = 59, y = 44, zone = "Teldrassil" },
			[13] = { str = "Turn in #INA Friend in Need# at #COORD[61,42]#, accept #GETIverron's Antidote pt.1#", x = 61, y = 42, zone = "Teldrassil" },
			[14] = { str = "Do #DOIverron's Antidote pt.1#, get #ITEMMoonpetal Lily# and #ITEMHyancinth Mushroom# around #COORD[57,37]#.", x = 57, y = 37, zone = "Teldrassil" },
			[15] = { str = "For #DOIverron's Antidote pt.1#, get #ITEMWebwood Ichor# from a #NPCWebwood Spider# #COORD[57,32]#. Get #ITEMWebwood Egg# for #DOWebwood Egg# at #COORD[57,26]# inside the cave.", x = 57, y = 36, zone = "Teldrassil" },
			[16] = { str = "Turn in #INWebwood Egg# at #COORD[58,42]# Accept #GETTenaron's Summons#, then run up the ramp to the top of the tree and hand it in at #COORD[59,39]#. Accept #GETCrown of the Earth pt.1# ", x = 58, y = 42, zone = "Teldrassil" },
			[17] = { str = "Turn in #INIverron's Antidote pt.1# accept #GETIverron's Antidote pt.2# at #COORD[61,42]#.", x = 61, y = 42, zone = "Teldrassil" },
			[18] = { str = "Run over and turn in #INIverron's Antidote pt.2# at #COORD[54,32]#", x = 54, y = 32, zone = "Teldrassil" },
			[19] = { str = "Fill the #ITEM[Crystal Phial]# for #DOCrown of the Earth pt.1# at #COORD[59,32]#", x = 59, y = 32, zone = "Teldrassil" },
			[20] = { str = "Run back to the top of the tree at #COORD[59,39]#, and turn in #INCrown of the Earth pt.1#. Accept #GETCrown of the Earth pt.2# ", x = 59, y = 39, zone = "Teldrassil" },
			[21] = { str = "If you’re not level 6 yet, you should be close. Level and get skills." },
		}
	},
	[0612] = {
		title = "6-12 Teldrassil",
		--L- Needs playtest
		items = {
			[1] = { str = "6-12 Teldrassil" },
			[2] = { str = "Accept #GETDolanaar Delivery# at #COORD[61,47]#", x = 61, y = 47, zone = "Teldrassil" },
			[3] = { str = "Accept #GETZenn's Bidding# at #COORD[60,56]#", x = 60, y = 56, zone = "Teldrassil" },
			[4] = { str = "Make Dolanaar your home." },
			[5] = { str = "Turn in #INDolanaar Delivery# at #COORD[55,59]# in Dolanaar", x = 55, y = 59, zone = "Teldrassil" },
			[6] = { str = "Turn in #INCrown of the Earth pt.2# at #COORD[56,61]# accept #GETCrown of the Earth pt.3#", x = 56, y = 61, zone = "Teldrassil" },
			[7] = { str = "At the tower in Dolanaar grab the following." },
			[8] = { str = "#GETDenalan's Earth#, #GETA Troubling Breeze#, Get First Aid, #GETThe Emerald Dreamcatcher#, #GETTwisted Hatred#." },
			[9] = { str = "Accept #GETThe Road to Darnassus# from the mounted patrol (if she’s there) right around #COORD[56,57]#", x = 56, y = 57, zone = "Teldrassil" },
			[10] = { str = "#DOZenn's Bidding# mobs east of Dolanaar" },
			[11] = { str = "#DOCrown of the Earth pt.3# at #COORD[63,58]#.", x = 63, y = 58, zone = "Teldrassil" },
			[12] = { str = "Turn in #INA Troubling Breeze# at #COORD[66,58]# accept #GETGnarlpine Corruption#.", x = 66, y = 58, zone = "Teldrassil" },
			[13] = { str = "#DOThe Emerald Dreamcatcher# #COORD[68,59]#", x = 68, y = 59, zone = "Teldrassil" },
			[14] = { str = "Turn in #INZenn's Bidding# at #COORD[60,56]# then go to the Dolanaar tower and accept #GETSeek Redemption!#.", x = 60, y = 56, zone = "Teldrassil" },
			[15] = { str = "Do #DOSeek Redemption!# #ITEM(cones under trees)# while heading to #COORD[60,68]# and turn in #INDenalan's Earth#", x = 60, y = 68, zone = "Teldrassil" },
			[16] = { str = "Accept and do #GETTimberling Seeds# (mobs all around lake) & #GETTimberling Sprouts# (seeds around trees near lake)" },
			[17] = { str = "Hand those back in and accept #GETRellian Greenspyre#" },
			[18] = { str = "Turn in #INCrown of the Earth pt.3# accept #GETCrown of the Earth pt.4#" },
			[19] = { str = "Turn in #INGnarlpine Corruption# accept #GETThe Relics of Wakening#." },
			[20] = { str = "Turn in #INThe Emerald Dreamcatcher# accept #GETFerocitas the Dream Eater#" },
			[21] = { str = "You should be level 8 by now. Get new skills." },
			[22] = { str = "Finish #DOSeek Redemption!# Then go North of Starbreeze." },
			[23] = { str = "Do #DOFerocitas the Dream Eater# mobs around #COORD[68,53]#", x = 68, y = 53, zone = "Teldrassil" },
			[24] = { str = "Die on purpose so you end up at Dolanaar" },
			[25] = { str = "Run to Fel Rock Cave at #COORD[54,52]# and do #DOTwisted Hatred# you can also wait until you’re 10 to do this to make it easier.", x = 54, y = 52, zone = "Teldrassil" },
			[26] = { str = "Turn in #INFerocitas the Dream Eater# and #INTwisted Hatred at Dolanaar#." },
			[27] = { str = "Do #DOThe Road to Darnassus# at #COORD[46,52]#", x = 46, y = 52, zone = "Teldrassil" },
			[28] = { str = "Go do #DOThe Relics of Wakening# at #COORD[44,57]# in the cave", x = 44, y = 57, zone = "Teldrassil" },
			[29] = { str = "Accept #GETThe Sleeping Druid# inside, kill shamans to get it, turn it in." },
			[30] = { str = "Accept #GETDruid of the Claw# do it at #COORD[45,58]#", x = 45, y = 58, zone = "Teldrassil" },
			[31] = { str = "Go south and do #DOCrown of the Earth pt.4# at #COORD[42,67]#.", x = 42, y = 67, zone = "Teldrassil" },
			[32] = { str = "Die so you end up at Dolanaar" },
			[33] = { str = "Turn in #INCrown of the Earth pt.4# accept #GETCrown of the Earth pt.5#." },
			[34] = { str = "Turn in #INThe Road to Darnassus# just west of tower to mountie" },
			[35] = { str = "Turn in #INThe Relics of Wakening# accept #GETUrsal the Mauler#" },
			[36] = { str = "You should be level 10 now, if not grind to it" },
			[37] = { str = "Run to Darnassus and turn in #INRellian Greenspyre# at #COORD[38,21]# accept #GETTumors#", x = 38, y = 21, zone = "Teldrassil" },
			[38] = { str = "Get #GETNessa Shadowsong# at #COORD[70,45]# in Darnassus", x = 70, y = 45, zone = "Teldrassil" },
			[39] = { str = "Get #GETThe Glowing Fruit# at #COORD[42,76]#.", x = 42, y = 76, zone = "Teldrassil" },
			[40] = { str = "Do #DOUrsal the Mauler# at #COORD[38,77]#.", x = 38, y = 77, zone = "Teldrassil" },
			[41] = { str = "Die so you’re in front of Darnassus." },
			[42] = { str = "#DOTumors# at #COORD[42,42]#", x = 42, y = 42, zone = "Teldrassil" },
			[43] = { str = "#DOCrown of the Earth pt.5# at #COORD[38,34]#", x = 38, y = 34, zone = "Teldrassil" },
			[44] = { str = "Accept #GETThe Enchanted Glade# at #COORD[38,34]#. Then do it at #COORD[35,43]#. Turn it back in", x = 38, y = 34, zone = "Teldrassil" },
			[45] = { str = "Accept #GETTeldrassil#." },
			[46] = { str = "Run back to Darnassus, turn in #INTumors# at #COORD[38,21]# accept #GETReturn to Denalan#.", x = 38, y = 21, zone = "Teldrassil" },
			[47] = { str = "Turn in #INTeldrassil# atop the tower at #COORD[36,12]# accept #GETGrove of the Ancients#.", x = 36, y = 12, zone = "Teldrassil" },
			[48] = { str = "Hearth to Dolanaar." },
			[49] = { str = "Turn in #INCrown of the Earth pt.5# accept #GETCrown of the Earth pt.6.#" },
			[50] = { str = "Turn in #INUrsal the Mauler#." },
			[51] = { str = "Go SE to #COORD[60,68]# Turn in #INReturn to Denalan# accept #GETOakenscowl elite#.", x = 60, y = 68, zone = "Teldrassil" },
			[52] = { str = "Turn in #INGlowing Fruit#" },
			[53] = { str = "Go kill #NPCOakenscowl# at #COORD[53,74]#. Turn it in at #COORD[60,68]#.", x = 53, y = 74, zone = "Teldrassil" },
			[54] = { str = "Run to Darnassus, if you’re not within 1100xp to level 12 yet grind on #NPCHarpies# North of the Darnassus entrance." },
			[55] = { str = "Turn in #INCrown of the Earth pt.6# 34,8 in Darnassus", x = 34, y = 8, zone = "Darnassus" },
			[56] = { str = "Get skills and run through gate at #COORD[30,41]#", x = 30, y = 41, zone = "Darnassus" },
			[57] = { str = "Run straight ahead to #COORD[56,92]#, turn in #INNessa Shadowsong# accept #GETThe Bounty of Teldrassil# go hand it in to the hippogryph guy at #COORD[58,93]# to get a free ride and accept #GETFlight to Auberdine#.", x = 56, y = 92, zone = "Teldrassil" },
		--L- Turn in #INFlight to Auberdine# accept #GETReturn to Nessa# I fly back to Darnassus to get it done. She’s right off the edge of the dock.
		}
	},
}