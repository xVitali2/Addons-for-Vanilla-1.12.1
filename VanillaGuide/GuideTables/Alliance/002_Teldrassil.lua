--[[--------------------------------------------------
002_Teldrassil.lua
Authors: mrmr
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
------------------------------------------------------
Connection:
--]]--------------------------------------------------

Table_002_Teldrassil = {
-----------1-6 Teldrassil
	--[11] = {
	[0106] = {
		title = "1-6 Teldrassil",
		--n = "1-6 Teldrassil",
		--pID = 1, nID = 12,
		--itemCount = 20,
		items = {
			[1] = { str = "1-6 Teldrassil" },
			[2] = { str = "Accept #ACCEPTThe Balance of Nature pt.1# at 58,44 and go do it by killing mobs at 57,45 and 61,43. Turn it in at 58,44.", x = 58, y = 44, zone = "Teldrassil" },
			[3] = { str = "Accept  #ACCEPTThe Balance of Nature pt.2# and  #ACCEPTEtched Sigil#  at 58,44.  #ACCEPTThe Woodland Protector pt.1#  at 59,42 and  #ACCEPTA Good Friend#  at 60,41.", x = 59, y = 42, zone = "Teldrassil" },
			[4] = { str = "Turn in  #TURNINThe Woodland Protector pt.1#  at 57,45 and accept  #ACCEPTThe Woodland Protector pt.2#  Mobs are at 56,46. Turn it in at 57,45.", x = 56, y = 46, zone = "Teldrassil" },
			[5] = { str = "Accept  #ACCEPTWebwood Venom#  at 57,41.", x = 57, y = 41, zone = "Teldrassil" },
			[6] = { str = "#HUNTERHunter:# Run up the ramp to the top of the tree, turn in  #TURNINEtched Sigil#  at 58,40 (hunter trainer) and get beast tracking.", x = 58, y = 40, zone = "Teldrassil" },
			[7] = { str = "Jump down and go do the following #DOQUESTThe Balance of Nature pt.2#  mobs are all around 60,35", x = 60, y = 35, zone = "Teldrassil" },
			[8] = { str = "#DOQUESTWebwood Venom#  at 57,32 in and outside the cave.", x = 57, y = 32, zone = "Teldrassil" },
			[9] = { str = "Turn in  #TURNINA Good Friend#  at 54,32 in a cove just west of the cave. Accept  #ACCEPTA Friend in Need#.", x = 54, y = 32, zone = "Teldrassil" },
			[10] = { str = "Turn in  #TURNINWebwood Venom#  at 57,41. Accept  #ACCEPTWebwood Egg#.", x = 57, y = 41, zone = "Teldrassil" },
			[11] = { str = "Turn in  #TURNINThe Balance of Nature pt.2#  at 58,44", x = 58, y = 44, zone = "Teldrassil" },
			[12] = { str = "Turn in  #TURNINA Friend in Need#  at 60,41, accept  #ACCEPTIverron's Antidote pt.1#", x = 60, y = 41, zone = "Teldrassil" },
			[13] = { str = "#DOQUESTIverron's Antidote pt.1#  (lilies and mushrooms) around 57,37.", x = 57, y = 37, zone = "Teldrassil" },
			[14] = { str = "#DOQUESTIverron's Antidote pt.1#  (ichor) in the cave 57,32 along with  #DOQUESTWebwood Egg#  at 56,26", x = 57, y = 32, zone = "Teldrassil" },
			[15] = { str = "Turn in  #TURNINWebwood Egg#  at 57,41 Accept  #ACCEPTTenaron's Summons#  then run up the ramp to the top of the tree and hand it in at 59,39. Accept  #ACCEPTCrown of the Earth pt.1# ", x = 57, y = 41, zone = "Teldrassil" },
			[16] = { str = "Turn in  #TURNINIverron's Antidote pt.1#  accept  #ACCEPTIverron's Antidote pt.2#." },
			[17] = { str = "Do  #DOQUESTCrown of the Earth pt.1#  at 59,32", x = 59, y = 32, zone = "Teldrassil" },
			[18] = { str = "Turn in  #TURNINIverron's Antidote pt.2#  at 54,32", x = 54, y = 32, zone = "Teldrassil" },
			[19] = { str = "Turn in  #TURNINCrown of the Earth pt.1#  at 59,39 Accept  #ACCEPTCrown of the Earth pt.2# ", x = 59, y = 39, zone = "Teldrassil" },
			[20] = { str = "If you’re not level 6 yet, you should be close. Level and get skills. Head towards Dolanaar" },
		}
	},

-----------6-12 Teldrassil
	--[12] = {
	[0612] = {
		title = "6-12 Teldrassil",
		--n = "6-12 Teldrassil",
		--pID = 11, nID = 101, 
		--itemCount = 57,
		items = {
			[1] = { str = "6-12 Teldrassil" },
			[2] = { str = "Accept  #ACCEPTDolanaar Delivery#  at 61,47", x = 61, y = 47, zone = "Teldrassil" },
			[3] = { str = "Accept  #ACCEPTZenn's Bidding#  at 60,56", x = 60, y = 56, zone = "Teldrassil" },
			[4] = { str = "Make Dolanaar your home." },
			[5] = { str = "Turn in  #TURNINDolanaar Delivery#  at 55,59 in Dolanaar", x = 55, y = 59, zone = "Teldrassil" },
			[6] = { str = "Turn in  #TURNINCrown of the Earth pt.2#  at 56,61 accept  #ACCEPTCrown of the Earth pt.3#", x = 56, y = 61, zone = "Teldrassil" },
			[7] = { str = "At the tower in Dolanaar grab the following." },
			[8] = { str = "#ACCEPTDenalan's Earth#,   #ACCEPTA Troubling Breeze#,  Get First Aid,  #ACCEPTThe Emerald Dreamcatcher#,   #ACCEPTTwisted Hatred#." },
			[9] = { str = "Accept  #ACCEPTThe Road to Darnassus#  from the mounted patrol (if she’s there) right around 56,57", x = 56, y = 57, zone = "Teldrassil" },
			[10] = { str = "#DOQUESTZenn's Bidding#  mobs east of Dolanaar" },
			[11] = { str = "#DOQUESTCrown of the Earth pt.3#  at 63,58.", x = 63, y = 58, zone = "Teldrassil" },
			[12] = { str = "Turn in  #TURNINA Troubling Breeze#  at 66,58 accept  #ACCEPTGnarlpine Corruption#.", x = 66, y = 58, zone = "Teldrassil" },
			[13] = { str = "#DOQUESTThe Emerald Dreamcatcher#  68,59", x = 68, y = 59, zone = "Teldrassil" },
			[14] = { str = "Turn in  #TURNINZenn's Bidding#  at 60,56 then go to the Dolanaar tower and accept  #ACCEPTSeek Redemption!#.", x = 60, y = 56, zone = "Teldrassil" },
			[15] = { str = "Do  #DOQUESTSeek Redemption!#  (cones under trees) while heading to 60,68 and turn in  #TURNINDenalan's Earth#", x = 60, y = 68, zone = "Teldrassil" },
			[16] = { str = "Accept and do  #ACCEPTTimberling Seeds#  (mobs all around lake) &  #ACCEPTTimberling Sprouts#  (seeds around trees near lake)" },
			[17] = { str = "Hand those back in and accept  #ACCEPTRellian Greenspyre#" },
			[18] = { str = "Turn in  #TURNINCrown of the Earth pt.3#  accept  #ACCEPTCrown of the Earth pt.4#" },
			[19] = { str = "Turn in  #TURNINGnarlpine Corruption#  accept  #ACCEPTThe Relics of Wakening#." },
			[20] = { str = "Turn in  #TURNINThe Emerald Dreamcatcher#  accept  #ACCEPTFerocitas the Dream Eater#" },
			[21] = { str = "You should be level 8 by now. Get new skills." },
			[22] = { str = "Finish  #DOQUESTSeek Redemption!#  Then go North of Starbreeze." },
			[23] = { str = "Do  #DOQUESTFerocitas the Dream Eater#  mobs around 68,53", x = 68, y = 53, zone = "Teldrassil" },
			[24] = { str = "Die on purpose so you end up at Dolanaar" },
			[25] = { str = "Run to Fel Rock Cave at 54,52 and do  #DOQUESTTwisted Hatred#  you can also wait until you’re 10 to do this to make it easier.", x = 54, y = 52, zone = "Teldrassil" },
			[26] = { str = "Turn in  #TURNINFerocitas the Dream Eater#  &  #TURNINTwisted Hatred at Dolanaar#." },
			[27] = { str = "Do  #DOQUESTThe Road to Darnassus#  at 46,52", x = 46, y = 52, zone = "Teldrassil" },
			[28] = { str = "Go do  #DOQUESTThe Relics of Wakening#  at 44,57 in the cave", x = 44, y = 57, zone = "Teldrassil" },
			[29] = { str = "Accept  #ACCEPTThe Sleeping Druid#  inside, kill shamans to get it, turn it in." },
			[30] = { str = "Accept  #ACCEPTDruid of the Claw#  do it at 45,58", x = 45, y = 58, zone = "Teldrassil" },
			[31] = { str = "Go south and do  #DOQUESTCrown of the Earth pt.4#  at 42,67.", x = 42, y = 67, zone = "Teldrassil" },
			[32] = { str = "Die so you end up at Dolanaar" },
			[33] = { str = "Turn in  #TURNINCrown of the Earth pt.4#  accept  #ACCEPTCrown of the Earth pt.5#." },
			[34] = { str = "Turn in  #TURNINThe Road to Darnassus#  just west of tower to mountie" },
			[35] = { str = "Turn in  #TURNINThe Relics of Wakening#  accept  #ACCEPTUrsal the Mauler#" },
			[36] = { str = "You should be level 10 now, if not grind to it" },
			[37] = { str = "Run to Darnassus and turn in  #TURNINRellian Greenspyre#  at 38,21 accept  #ACCEPTTumors#", x = 38, y = 21, zone = "Teldrassil" },
			[38] = { str = "Get  #ACCEPTNessa Shadowsong#  at 70,45 in Darnassus", x = 70, y = 45, zone = "Teldrassil" },
			[39] = { str = "Get  #ACCEPTThe  Glowing Fruit#  at 42,76.", x = 42, y = 76, zone = "Teldrassil" },
			[40] = { str = "Do  #DOQUESTUrsal the Mauler#  at 38,77.", x = 38, y = 77, zone = "Teldrassil" },
			[41] = { str = "Die so you’re in front of Darnassus." },
			[42] = { str = "#DOQUESTTumors#  at 42,42", x = 42, y = 42, zone = "Teldrassil" },
			[43] = { str = "#DOQUESTCrown of the Earth pt.5#  at 38,34", x = 38, y = 34, zone = "Teldrassil" },
			[44] = { str = "Accept  #ACCEPTThe Enchanted Glade#  at 38,34. Then do it at 35,43. Turn it back in", x = 38, y = 34, zone = "Teldrassil" },
			[45] = { str = "Accept  #ACCEPTTeldrassil#." },
			[46] = { str = "Run back to Darnassus, turn in  #TURNINTumors#  at 38,21 accept  #ACCEPTReturn to Denalan#.", x = 38, y = 21, zone = "Teldrassil" },
			[47] = { str = "Turn in  #TURNINTeldrassil#  atop the tower at 36,12 accept  #ACCEPTGrove of the Ancients#.", x = 36, y = 12, zone = "Teldrassil" },
			[48] = { str = "Hearth to Dolanaar." },
			[49] = { str = "Turn in  #TURNINCrown of the Earth pt.5#  accept  #ACCEPTCrown of the Earth pt.6.#" },
			[50] = { str = "Turn in  #TURNINUrsal the Mauler#." },
			[51] = { str = "Go SE to 60,68 Turn in  #TURNINReturn to Denalan#  accept  #ACCEPTOakenscowl elite#.", x = 60, y = 68, zone = "Teldrassil" },
			[52] = { str = "Turn in  #TURNINGlowing Fruit#" },
			[53] = { str = "Go kill  #NPCOakenscowl#  at 53,74. Turn it in at 60,68.", x = 53, y = 74, zone = "Teldrassil" },
			[54] = { str = "Run to Darnassus, if you’re not within 1100xp to level 12 yet grind on harpies North of the Darnassus entrance." },
			[55] = { str = "Turn in  #TURNINCrown of the Earth pt.6#  34,8 in Darnassus", x = 34, y = 8, zone = "Darnassus" },
			[56] = { str = "Get skills and run through gate at 30,41", x = 30, y = 41, zone = "Darnassus" },
			[57] = { str = "Run straight ahead to 56,92, turn in  #TURNINNessa Shadowsong#  accept  #ACCEPTThe Bounty of Teldrassil#  go hand it in to the hippogryph guy at 58,93 to get a free ride and accept  #ACCEPTFlight to Auberdine#.", x = 56, y = 92, zone = "Teldrassil" },
    	}
	},
}