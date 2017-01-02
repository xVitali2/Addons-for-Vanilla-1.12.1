--[[--------------------------------------------------
002_ElwynnForest.lua
Authors: mrmr
Version: 1.04.3
------------------------------------------------------
Description: Guide Serie - 001 Elwynn Forest
    1.04.1
        -- First Release
            Human Elwynn Forest's Guide
            from level 1 to lever 12
    1.04.2
    	-- no changes in here for this revision
	1.04.3
		-- Added color codes
			Fixed various spelling errors
------------------------------------------------------
Connection:
--]]--------------------------------------------------

Table_002_ElwynnForest = {
-----------1-10 Elwynn Forest
	--[15] = {
	[0110] = {
		title = "1-10 Elwynn Forest",
		--n = "1-10 Elwynn Forest",
		--pID = 1, nID = 16,
		--itemCount = 69,
		items = {
			[1] = { str = "1-10 Elwynn Forest" },
			[2] = { str = "Directly in front of where you start accept #ACCEPTA Threat Within# then go in the building and turn it in, accept #ACCEPTKobold Camp Cleanup#" },
			[3] = { str = "Run back out, and turn in #TURNINWelcome!# at the wagons at 47,41", x = 47, y = 41, zone = "Elwynn Forest" },
			[4] = { str = "Go to the nook at the NW corner of the building at 48,40 and accept #ACCEPTWolves Across the Border#", x = 48, y = 40, zone = "Elwynn Forest" },
			[5] = { str = "Kill the wolves in front of you for #DOQUESTWolves Across the Border# while working your way to the Kobold Vermin at 47,35 for #DOQUESTKobold Camp Cleanup#", x = 47, y = 35, zone = "Elwynn Forest" },
			[6] = { str = "Go back to 48,40 and turn in #TURNINWolves Across the Border#", x = 48, y = 40, zone = "Elwynn Forest" },
			[7] = { str = "Run into the house at 48,41 and turn in #TURNINKobold Camp Cleanup# accept #ACCEPTSimple Letter# and #ACCEPTInvestigate Echo Ridge#", x = 48, y = 41, zone = "Elwynn Forest" },
			[8] = { str = "Go to your class trainer and turn in #TURNINSimple Letter# and get new skills", x = 50, y = 42, zone = "Elwynn Forest" },
			[9] = { str = "Exit the house and accept #ACCEPTBrotherhood of Thieves#" },
			[10] = { str = "Go NW toward the cave at 47,32 and kill Kobold Workers on the way for #DOQUESTInvestigate Echo Ridge#", x = 47, y = 32, zone = "Elwynn Forest" },
			[11] = { str = "Go West to 54,40 and go south killing the defias for #DOQUESTBrotherhood of Thieves# you should be level 4 by the time you’re done, if not just grind until you are", x = 54, y = 40, zone = "Elwynn Forest" },
			[12] = { str = "Run back to the abbey at 48,42 and turn in #TURNINBrotherhood of Thieves# accept #ACCEPTMilly Osworth# and #ACCEPTBounty on Garrick Padfoot#", x = 48, y = 42, zone = "Elwynn Forest" },
			[13] = { str = "Go inside the house and turn in #TURNINInvestigate Echo Ridge# accept #ACCEPTSkirmish at Echo Ridge# then get new skills" },
			[14] = { str = "Go north of the house at 50,39 next to the barn, turn in #TURNINMilly Osworth# accept #ACCEPTMilly's Harvest#", x = 50, y = 39, zone = "Elwynn Forest" },
			[15] = { str = "Go back east and grab the grapes in the garden at 54,48 for #DOQUESTMilly's Harvest# then NE to 57,48 you’ll see a shack with padfoot and a thug. Kill him for #DOQUESTBounty on Garrick Padfoot#", x = 57, y = 48, zone = "Elwynn Forest" },
			[16] = { str = "Go back to 50,39 and turn in #TURNINMilly's Harvest# accept #ACCEPTGrape Manifest#", x = 50, y = 39, zone = "Elwynn Forest" },
			[17] = { str = "Go into the cave at 47,31 and kill Kobold Laborer’s for #DOQUESTSkirmish at Echo Ridge#", x = 47, y = 31, zone = "Elwynn Forest" },
			[18] = { str = "Hearth back to the Abbey" },
			[19] = { str = "Turn in #TURNINBounty on Garrick Padfoot#" },
			[20] = { str = "Go inside the house, turn in #TURNINSkirmish at Echo Ridge# accept #ACCEPTReport to Goldshire#" },
			[21] = { str = "Go to the top of the tower through the spiral staircase, turn in #TURNINGrape Manifest#" },
			[22] = { str = "Go to 45,47 and accept #ACCEPTRest and Relaxation#", x = 45, y = 47, zone = "Elwynn Forest" },
			[23] = { str = "If you’re not level 6 you should be close, just grind on a few mobs while you head towards the house near Goldshire at 46,62 and pick up skinning if you want it", x = 46, y = 42, zone = "Elwynn Forest" },
			[24] = { str = "Enter the Inn at 42,65", x = 42, y = 65, zone = "Elwynn Forest" },
			[25] = { str = "Accept #ACCEPTKobold Candles#" },
			[26] = { str = "Near the bar turn in #TURNINRest and Relaxation# and make Goldshire your home" },
			[27] = { str = "Exit the Inn, turn in #TURNINReport to Goldshire# accept #ACCEPTThe Fargodeep Mine#" },
			[28] = { str = "Find your trainer and buy new skills." },
			[29] = { str = "Go near the carts at 42,67 and accept #ACCEPTGold Dust Exchange#", x = 42, y = 67, zone = "Elwynn Forest" },
			[30] = { str = "Go south to the Fargodeep Mine at 39,82 and kill the kobold until you complete all 3 quests #DOQUESTThe Fargodeep Mine#, #DOQUESTGold Dust Exchange#, and #DOQUEATKobold Candles# Make sure you go in the lower entrance so The Fargodeep Mine is easier", x = 39, y = 82, zone = "Elwynn Forest" },
			[31] = { str = "Once all 3 are done go to the Stonefield Farm just up the hill east at 34,84 and accept #ACCEPTLost Necklace# SKIP #VIDEOPrincess Must Die!# if you cannot fight 3 mobs at a time.", x = 34, y = 84, zone = "Elwynn Forest" },
			[32] = { str = "Go east to the Maclure Vinyard at 43,80 and accept #ACCEPTYoung Lovers#", x = 43, y = 80, zone = "Elwynn Forest" },
			[33] = { str = "Go to 43,85 and turn in #TURNINLost Necklace# accept #ACCEPTPie For Billy# then kill boars until it’s finished.", x = 43, y = 85, zone = "Elwynn Forest" },
			[34] = { str = "Go back west to 34,84 and turn in #TURNINPie For Billy# and accept #ACCEPTBack to Billy#", x = 34, y = 84, zone = "Elwynn Forest" },
			[35] = { str = "Go west some to the river at 29,85 and turn in #TURNINYoung Lovers# accept #ACCEPTSpeak with Gramma#", x = 29, y = 85, zone = "Elwynn Forest" },
			[36] = { str = "Go back to 34,84 and turn in #TURNINSpeak with Gramma# in the house, accept #ACCEPTNote to William#", x = 34, y = 84, zone = "Elwynn Forest" },
			[37] = { str = "Run back east to 43,85 and turn in #TURNINBack to Billy# accept #ACCEPTGoldtooth#", x = 43, y = 85, zone = "Elwynn Forest" },
			[38] = { str = "Go in the bottom entrance of the Fargodeep Mine at 39,82 and to about 41,78 inside and kill #NPCGoldtooth# for #DOQUESTGoldtooth# You should ding level 7 during this quest.", x = 41, y = 78, zone = "Elwynn Forest" },
			[39] = { str = "Hearth back to Goldshire" },
			[40] = { str = "In the Inn turn in #TURNINKobold Candles# accept #ACCEPTShipment to Stormwind# also turn in #TURNINNote to William# accept #ACCEPTCollecting Kelp#" },
			[41] = { str = "Straight outside the Inn, turn in #TURNINThe Fargodeep Mine# accept #ACCEPTThe Jasperlode Mine#" },
			[42] = { str = "South near the fence, turn in #TURNINGold Dust Exchange# You should have dinged level 7 now, accept #ACCEPTA Fishy Peril#" },
			[43] = { str = "Turn around by the blacksmith and turn it in, accept #ACCEPTFurther Concerns#" },
			[44] = { str = "Kill murlocs around the lake at 51,65 for #DOQUESTCollecting Kelp#", x = 51, y = 65, zone = "Elwynn Forest" },
			[45] = { str = "Grind up to the Jasperlode Mine at 61,53 and run through it about half way to 60,50 for #DOQUESTThe Jasperlode Mine#", x = 60, y = 50, zone = "Elwynn Forest" },
			[46] = { str = "Run to the bridge at 73,72 and turn in #TURNINFurther Concerns# accept #ACCEPTFind the Lost Guards# and #ACCEPTProtect the Frontier#", x = 73, y = 72, zone = "Elwynn Forest" },
			[47] = { str = "Stop at the house NE of here at 79,68 and accept #ACCEPTRed Linen Goods#", x = 79, y = 68, zone = "Elwynn Forest" },
			[48] = { str = "At the center of the camp, 81,66, accept #ACCEPTA Bundle of Trouble#", x = 81, y = 66, zone = "Elwynn Forest" },
			[49] = { str = "Run just west of the waterfall at 72,60 touch the mangled body and turn in #TURNINFind the Lost Guards# accept #ACCEPTDiscover Rolf’s Fate# You should now be level 8, if not grind until you are.", x = 72, y = 60, zone = "Elwynn Forest" },
			[50] = { str = "Go to the murloc camp at 79,55 and loot the mangled body there (might need a group, but usually always people here) and turn in #TURNINDiscover Rolf’s Fate# accept #ACCEPTReport to Thomas#", x = 79, y = 55, zone = "Elwynn Forest" },
			[51] = { str = "Go south to 81,66 and turn in #TURNIN“A Bundle of Trouble”#", x = 81, y = 66, zone = "Elwynn Forest" },
			[52] = { str = "Cross the road and go south and east and finish killing the bears and wolves for #DOQUEST“Protect the Frontier”# bears are kinda scarce so you might have to search." },
			[53] = { str = "While doing this you can get some, if not all, of the red bandannas for  #DOQUESTRed Linen Goods# at 90,78", x = 90, y = 78, zone = "Elwynn Forest" },
			[54] = { str = "Go back to 73,72 near the bridge and turn in #TURNIN“Protect the Frontier”# and #TURNIN“Report to Thomas”# accept #ACCEPT“Deliver Thomas' Report”#", x = 73, y = 72, zone = "Elwynn Forest" },
			[55] = { str = "Go down to the pumpkin patch at 69,78 and kill the rest of the defias for #DOQUESTRed Linen Goods# ", x = 69, y = 78, zone = "Elwynn Forest" },
			[56] = { str = "You might find #NPCFurlbrow's Deed# on the defias while you’re killing defias just hold it for now." },
			[57] = { str = "Go to 79,68 and turn in #TURNINRed Linen Goods# it should make you level 9 or bring you really close", x = 79, y = 68, zone = "Elwynn Forest" },
			[58] = { str = "Stop at the bridge again at 73,72 and accept #ACCEPT“Report to Gryan Stoutmantle”# must be level 9 to accept", x = 73, y = 72, zone = "Elwynn Forest" },
			[59] = { str = "Hearth to Goldshire" },
			[60] = { str = "By the front door turn in #TURNIN“Collecting Kelp”# accept #ACCEPT“The Escape”#" },
			[61] = { str = "Just outside the Inn turn in #TURNIN“The Jasperlode Mine”# and #TURNIN“Deliver Thomas' Report”# SKIP #VIDEO“Cloth and Leather Armor”# accept #ACCEPT“Westbrook Garrison Needs Help!”#" },
			[62] = { str = "In the blacksmith house right here accept #ACCEPT“Elmore's Task”# then get training" },
			[63] = { str = "Run south to the Maclure Vinyard at 43,89 and turn in #TURNIN“The Escape”#", x = 43, y = 89, zone = "Elwynn Forest" },
			[64] = { str = "Run west to the Stonefield Farm at 34,84 and turn in #TURNIN“Goldtooth”#", x = 34, y = 84, zone = "Elwynn Forest" },
			[65] = { str = "Go NW to 34,74 and turn in #TURNIN“Westbrook Garrison Needs Help!”# accept #ACCEPT“Riverpaw Gnoll Bounty”# and accept #ACCEPT“Hogger!”# from the wanted sign", x = 34, y = 74, zone = "Elwynn Forest" },
			[66] = { str = "Go just south of the road and start killing gnolls for #DOQUEST“Riverpaw Gnoll Bounty”# they can also drop a #NPCGold Schedule# which starts a quest" },
			[67] = { str = " Go back up to 34,74 and turn in #TURNIN“Riverpaw Gnoll Bounty”#", x = 34, y = 74, zone = "Elwynn Forest" },
			[68] = { str = "You should be very close to level 10 now." },
			[69] = { str = "Follow the road west into Westfall" },
		}
	},

-----------10-12 Westfall and Loch Modan
	--[16] = {
	[1012] = {
		title = "10-12 Westfall and Loch Modan",
		--n = "10-12 Westfall and Loch Modan",
		--pID = 15, nID = 101,
		--itemCount = 34,
		items = {
			[1] = { str = "10-12 Westfall and Loch Modan" },
			[2] = { str = "Go to 59,19 and turn in #TURNIN“Furlbrow’s Deed”# if you found it before", x = 59, y = 19, zone = "Westfall" },
			[3] = { str = "Accept #ACCEPT“Westfall Stew”# SKIP #VIDEO“Poor Old Blanchy”#" },
			[4] = { str = "Go in the house at 56,30 and turn in #TURNIN“Westfall Stew”#", x = 56, y = 30, zone = "Westfall" },
			[5] = { str = "Go to 56,47 and turn in #TURNIN“Report to Gryan Stoutmantle”#", x = 56, y = 47, zone = "Westfall" },
			[6] = { str = "Go in the tower and accept #ACCEPT“A Swift Message”#" },
			[7] = { str = "Get the FP at 56,52 and turn in #TURNIN“A Swift Message”# accept #ACCEPT“Continue to Stormwind”#", x = 56, y = 52, zone = "Westfall" },
			[8] = { str = "Fly to SW unless you did hogger, then hearth to Goldshire and turn it in outside the Inn then buy new skills" },
			[9] = { str = "In SW go to 56,64 and turn in #TURNIN“Shipment to Stormwind”#", x = 56, y = 64, zone = "Stormwind" },
			[10] = { str = "Train new weapons at 57,57", x = 57, y = 57, zone = "Stormwind" },
			[11] = { str = "Go to 74,47 and turn in #TURNIN“Continue to Stormwind”# accept #ACCEPT“Dungar Longdrink”#", x = 74, y = 47, zone = "Stormwind" },
			[12] = { str = "Go to 51,12 and turn in #TURNIN“Elmore's Task”#  accept #ACCEPT“Stormpike's Delivery”# this will be done on the way to the Wetlands", x = 51, y = 12, zone = "Stormwind" },
			[13] = { str = "Go to 78,45 and accept #ACCEPT“A Warrior’s Training”# or your classes level 10 quest.", x = 78, y = 45, zone = "Stormwind" },
			[14] = { str = "Go to 66,62 and turn in #TURNIN“Stormpike's Delivery”# accept #ACCEPT#“Return to Lewis”# then fly back to Westfall", x = 66, y = 62, zone = "Stormwind" },
			[15] = { str = "Go to the tower at 56,47 and turn in #TURNIN“Return to Lewis”#", x = 56, y = 47, zone = "Westfall" },
			[16] = { str = "Fly back to SW #NPCWarrior:# Go in the bar at 74,37 and turn in #TURNIN“A Warrior’s Training”# accept #ACCEPT“Bartleby the Drunk”# then turn around and hand it in accept #ACCEPT“Beat Bartleby#", x = 74, y = 37, zone = "Stormwind" },
			[17] = { str = "#NPCWarrior:# Kick bartleby’s ass then talk to him again and accept #ACCEPT“Bartleby's Mug”# then turn it in behind you and learn your defense" },
			[18] = { str = "Go into the tram at 63,8 and take it to IF", x = 63, y = 8, zone = "Stormwind" },
			[19] = { str = "Once it stops accept #ACCEPT“Deeprun Rat Roundup”# just collect 5 rats and turn it in. You could skip this and keep the flute, It can really piss people off if you play it non stop around the IF bank. SKIP #VIDEO“Me Brother, Nipsy”# unless you go back to SW on the tram because it rewards little xp" },
			[20] = { str = "Grab the FP at 55,47", x = 55, y = 47, zone = "Ironforge" },
			[21] = { str = "After the rat quest you should be close to level 11" },
			[22] = { str = "Leave IF and head into Dun Morogh" },
			[23] = { str = "Run east to 68,55 and accept #ACCEPT“The Public Servant”#", x = 68, y = 55, zone = "Dun Morogh" },
			[24] = { str = "Go behind him and accept #ACCEPT“Those Blasted Troggs!”#" },
			[25] = { str = "Go in the pit below and kill the troggs here and in the cave for both quests then turn them back in at 68,55", x = 68, y = 55, zone = "Dun Morogh" },
			[26] = { str = "Go east to 80,51 and follow the path into Loch Modan", x = 80, y = 51, zone = "Dun Morogh" },
			[27] = { str = "Go to 22,73 and accept #ACCEPT“In Defense of the King's Lands”#", x = 22, y = 73, zone = "Loch Modan" },
			[28] = { str = "Go up in the tower and accept #ACCEPT“The Trogg Threat”#" },
			[29] = { str = "At 33,50 grab the FP", x = 33, y = 50, zone = "Loch Modan" },
			[30] = { str = "Look for Mountaineer Kadrell and accept #ACCEPT“Rat Catching”#" },
			[31] = { str = "Kill troggs from 27,53 and north for #DOQUEST“In Defense of the King's Lands”# and #DOQUEST“The Trogg Threat”#", x = 27, y = 53, zone = "Loch Modan" },
			[32] = { str = "Go back to 22,73 and turn them both in", x = 22, y = 73, zone = "Loch Modan" },
			[33] = { str = "Go north to the tower at 24,18 and turn in #TURNIN“Stormpike's Delivery”#", x = 24, y = 18, zone = "Loch Modan" },
			[34] = { str = "You should be level 12 now or close to it. You can grind if you’d like. Follow the Night Elf to IF guide but just go backwards. You’re going to go north through the wetlands to menethil, then take the boat to auberdine from here." },
		}
	},
}