--[[--------------------------------------------------
003_Alliance_12to20.lua
Authors: mrmr
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
------------------------------------------------------
Connection:
--]]--------------------------------------------------

Table_003_Alliance_12to20 = {
-----------12-14 Darkshore
	--[101] = {
	[1214] = {
		title = "12-14 Darkshore",
		--n = "12-14 Darkshore",
		--pID = 12, nID = 102, 
		--itemCount = 39,
		items = {
			[1] = { str = "12-14 Darkshore" },
			[2] = { str = "Once you land accept  #ACCEPTWashed Ashore pt.1#  right in front of you." },
			[3] = { str = "Turn in  #TURNINFlight to Auberdine#  accept  #ACCEPTReturn to Nessa#  I fly back to Darnassus to get it done. She’s right off the edge of the dock." },
			[4] = { str = "Run out on the docks of Auberdine and accept  #ACCEPTFor Love Eternal#  at 35,43.", x = 35, y = 43, zone = "Darkshore" },
			[5] = { str = "Go upstairs and accept  #ACCEPTBuzzbox 827#." },
			[6] = { str = "Accept  #ACCEPTCave Mushrooms#  in front of the Inn." },
			[7] = { str = "Accept  #ACCEPTThe Red Crystal#  near the bridge" },
			[8] = { str = "Buy some 6 slot bags if you haven’t found 3 by now at 37,40 then accept  #ACCEPTBashal'Aran pt.1#  and  #ACCEPTTools of the Highborne#.", x = 37, y = 40, zone = "Darkshore" },
			[9] = { str = "Go south over the bridge, accept  #ACCEPTPlagued Lands#." },
			[10] = { str = "Run inside, accept  #ACCEPTHow Big a Threat? pt.1#." },
			[11] = { str = "Go do  #DOQUESTWashed Ashore pt.1#  at 36,50 grind from town to there to get Crawler legs for  #DOQUESTBuzzbox 827#.", x = 36, y = 50, zone = "Darkshore" },
			[12] = { str = "Turn in  #TURNINBuzzbox 827#  at 36,46 accept  #ACCEPTBuzzbox 411#", x = 36, y = 46, zone = "Darkshore" },
			[13] = { str = "Turn in  #TURNINWashed Ashore pt.1#  accept   #ACCEPTWashed Ashore pt.2#." },
			[14] = { str = "Do  #DOQUESTWashed Ashore pt.2#  at 31,46 west of boat dock. Turn it in", x = 31, y = 46, zone = "Darkshore" },
			[15] = { str = "#DOQUESTBuzzbox 411#  Threshers look like loch ness in the water, Turn it in at 41,28 accept  #ACCEPTBuzzbox 323#", x = 41, y = 28, zone = "Darkshore" },
			[16] = { str = "Stop at 36,51 accept  #ACCEPTBeached Sea Creature#.", x = 36, y = 51, zone = "Darkshore" },
			[17] = { str = "#DOQUESTBashal'Aran pt.1#  at 44,36 grinding along the way, accept  #ACCEPTBashal'Aran pt.2#  killing grells around him for earrings.", x = 44, y = 36, zone = "Darkshore" },
			[18] = { str = "Turn in  #TURNINBashal'Aran pt.2#  at 44,36 accept  #ACCEPTBashal’Aran pt.3#", x = 44, y = 36, zone = "Darkshore" },
			[19] = { str = "Do  #DOQUESTBashal’Aran pt.3#  by killing satyr’s and turn it in accept  #ACCEPTBashal’Aran pt.4# " },
			[20] = { str = "Grind to 47,48 and do  #DOQUESTThe Red Crystal#", x = 47, y = 48, zone = "Darkshore" },
			[21] = { str = "Grind to 40,53 to find the camp for  #DOQUESTHow Big a Threat? pt.1#", x = 40, y = 53, zone = "Darkshore" },
			[22] = { str = "Run down to Ameth’Aran at 40,59 and accept   #ACCEPTThe Fall of Ameth'Aran#  do it at 43,58 and 42,63", x = 40, y = 59, zone = "Darkshore" },
			[23] = { str = "Do  #DOQUESTTools of the Highborne#  while in here, killing mobs for them." },
			[24] = { str = "Do  #DOQUESTFor Love Eternal#  at 41,58 she’s lvl 16 but easy.", x = 41, y = 58, zone = "Darkshore" },
			[25] = { str = "Do  #DOQUESTBashal’Aran pt.4#  at 42,61", x = 42, y = 61, zone = "Darkshore" },
			[26] = { str = "Turn in  #TURNINThe Fall of Ameth'Aran#  at 40,59.", x = 40, y = 59, zone = "Darkshore" },
			[27] = { str = "To the west of Amath’Aran do  #DOQUESTPlagued Lands#." },
			[28] = { str = "Hearth back to Auberdine Turn in  #TURNINPlagued Lands#  at the first house accept  #ACCEPTCleansing the Infected#" },
			[29] = { str = "Go inside turn in  #TURNINHow Big a Threat? pt.1#  accept  #ACCEPTHow Big a Threat? Pt.2#" },
			[30] = { str = "Accept  #ACCEPTThundris Windweaver.#" },
			[31] = { str = "Go Upstairs accept  #ACCEPTThe Tower of Althalaxx pt.1#" },
			[32] = { str = "Don’t do  Deep Ocean, Vast Sea  it’s too hard and not worth it" },
			[33] = { str = "Go in the merchant house, turn in  #TURNINTools of the Highborne#." },
			[34] = { str = "Turn in  #TURNINThundris Windweaver# accept  #ACCEPTThe Cliffspring River#" },
			[35] = { str = "Turn in  #TURNINThe Red Crystal#  near the Inn accept  #ACCEPTAs Water Cascades#" },
			[36] = { str = "Fill the Vial in the Moonwell for  #DOQUESTAs Water Cascades#" },
			[37] = { str = "Accept  #ACCEPTWANTED: Murkdeep!#  in front of the Inn (lvl 15 quest now)" },
			[38] = { str = "Turn in  #TURNINFor Love Eternal#  on the dock. Watch the love story." },
			[39] = { str = "You should be 14 by now get skills in Darnassus and be sure to accept the quest #ACCEPTTrouble In Darkshore# from Chief Archaeologist Greywhisker at 23,64" },
		}
	},

-----------14-17 Darkshore
	--[102] = {
	[1417] = {
		title = "14-17 Darkshore",
		--n = "14-17 Darkshore",
		--pID = 101, nID = 103, 
		--itemCount = 38,
		items = {
			[1] = { str = "14-17 Darkshore" },
			[2] = { str = "Turn in  #TURNINBashal’Aran pt.4#  at 44,36.", x = 44, y = 36, zone = "Darkshore" },
			[3] = { str = "Kill Moonstalkers and Rabid Thistle Bears all around 48,30 while you head to 50,25 for  #DOQUESTThe Cliffspring River#.", x = 50, y = 25, zone = "Darkshore" },
			[4] = { str = "Accept  #ACCEPTBeached Sea Turtle#  at 44,20", x = 44, y = 20, zone = "Darkshore" },
			[5] = { str = "Turn in  #TURNINBuzzbox 323#  at 51,24 accept  #ACCEPTBuzzbox 525#", x = 51, y = 24, zone = "Darkshore" },
			[6] = { str = "Go to 54,32 and do  #DOQUESTCave Mushrooms#.", x = 54, y = 32, zone = "Darkshore" },
			[7] = { str = "Head south stopping at 47,48 to do  #DOQUESTAs Water Cascades#  accept  #ACCEPTThe Fragments Within#.", x = 47, y = 48, zone = "Darkshore" },
			[8] = { str = "Grind to 40,53 and do  #DOQUESTHow Big a Threat? Pt.2#", x = 40, y = 53, zone = "Darkshore" },
			[9] = { str = "Stop at 37,62 and accept  #ACCEPTBeached Sea Turtle#", x = 37, y = 62, zone = "Darkshore" },
			[10] = { str = "Follow the shore and  Beached Sea Creature  at 36,70.", x = 36, y = 70, zone = "Darkshore" },
			[11] = { str = "Turn in  #TURNINGrove of the Ancients#  at 43,76", x = 43, y = 76, zone = "Darkshore" },
			[12] = { str = "Kill Grizzled Thistle Bear south of Grove of the Ancients for  #DOQUESTBuzzbox 525#  then turn it in at 41,80.", x = 41, y = 80, zone = "Darkshore" },
			[13] = { str = "Stop at 35,74 and do  #DOQUESTWANTED: Murkdeep!#  you have to clear the camp, then the 2 waves from the ocean, then he comes. He’s lvl 19 If you have trouble with him just kite him.", x = 35, y = 74, zone = "Darkshore" },
			[14] = { str = "Grind over to 32,80 and get  #ACCEPTBeached Sea Creature#.", x = 32, y = 80, zone = "Darkshore" },
			[15] = { str = "Hearth back to Auberdine and turn in all beached creature quests at the hippogryph dock" },
			[16] = { str = "Go under the dock and accept  #ACCEPTFruit of the Sea#" },
			[17] = { str = "Turn in  #TURNINCave Mushrooms#  in front of the Inn, accept  #ACCEPTOnu#" },
			[18] = { str = "Turn in  #TURNINThe Fragments Within#  in front of the Inn" },
			[19] = { str = "Accept  #ACCEPTThe Absent Minded Prospector#  at 37,41", x = 37, y = 41, zone = "Darkshore" },
			[20] = { str = "Go to the merchant house turn in  #TURNINThe Cliffspring River#." },
			[21] = { str = "You should be level 15 by now so you can accept  #ACCEPTThe Blackwood Corrupted#." },
			[22] = { str = "#ACCEPTCleansing the Infected#  at the first house accept  #ACCEPTTharnariun's Hope#." },
			[23] = { str = "Turn in  #TURNINHow Big a Threat? Pt.2#  accept  #ACCEPTA Lost Master#" },
			[24] = { str = "Fill the #NPCCleansing Bowl# at the Moonwell" },
			[25] = { str = "You should be level 16 now, fly to Darnassus and get new skills." },
			[26] = { str = "Do  #DOQUESTThe Blackwood Corrupted#  at 50,34(grains) clear before all 3 pick ups or the spawn will give adds. If so just run.", x = 50, y = 34, zone = "Darkshore" },
			[27] = { str = "Go do  #DOQUESTTharnariun's Hope#  at 51,37 (den mother) If you can’t kill her with the level 9 adds, kill them off and run until she’s alone. Immolate trap her and shoot first so you get the adds, not the pet.", x = 51, y = 37, zone = "Darkshore" },
			[28] = { str = "Do  #DOQUESTThe Blackwood Corrupted#  51,33(nuts) 52,33(fruit)", x = 51, y = 33, zone = "Darkshore" },
			[29] = { str = "Clear around the bonfire at 52,33 and place the food. Don’t worry they turn friendly.When #NPCXabraxxis# appears kill him. #NPCTalisman# falls beside.", x = 52, y = 33, zone = "Darkshore" },
			[30] = { str = "Go to 54,24 turn in  #TURNINThe Tower of Althalaxx pt.1#  Accept  #ACCEPTThe Tower of Althalaxx pt.2#  do it. Kill any mob around the tower, NOT in it.", x = 54, y = 24, zone = "Darkshore" },
			[31] = { str = "Turn in  #TURNINThe Tower of Althalaxx pt.2#  accept  #ACCEPTThe Tower of Althalaxx pt.3#" },
			[32] = { str = "Run to 53,18 and accept  #ACCEPTBeached Sea Creature#", x = 53, y = 18, zone = "Darkshore" },
			[33] = { str = "Do  #DOQUESTFruit of the Sea#  from crawlers around here." },
			[34] = { str = "Hearth back to Auberdine (if you’re not 17 yet you will be) turn in  #TURNINBeached Sea Creature#  on the dock." },
			[35] = { str = "Turn in  #TURNINFruit of the Sea#  under the dock." },
			[36] = { str = "Turn in  #TURNINThe Blackwood Corrupted#  in the merchant house." },
			[37] = { str = "Turn in  #TURNINTharnariun's Hope#  at the last house." },
			[38] = { str = "Get on boat to Menethil Harbor. Follow attached run to IF." },
		}
	},

-----------17-18 Loch Modan
	--[103] = {
	[1718] = {
		title = "17-18 Loch Modan",
		--n = "17-18 Loch Modan",
		--pID = 102, nID = 104, 
		--itemCount = 30,
		items = {
			[1] = { str = "17-18 Loch Modan" },
			[2] = { str = "Stop right in Loch Modan tower at 24,18 and accept  #ACCEPTFilthy Paws#  and  #ACCEPTStormpike's Order#", x = 24, y = 18, zone = "Loch Modan" },
			[3] = { str = "Run in the Cave at 35,18 and do  #DOQUESTFilthy Paws#  Boxes are on the ground. Then turn it back in at 24,18", x = 35, y = 18, zone = "Loch Modan" },
			[4] = { str = "Arrive at Thelsamar and get the FP at 33,50.", x = 33, y = 50, zone = "Loch Modan" },
			[5] = { str = "Accept  #ACCEPTIronband's Excavation#  in the last house on the right." },
			[6] = { str = "Turn in  #TURNINIronband's Excavation#  at 64,66 Accept  #ACCEPTGathering Idols#.", x = 64, y = 66, zone = "Loch Modan" },
			[7] = { str = "Accept  #ACCEPTExcavation Progress Report#  at 65,65", x = 65, y = 65, zone = "Loch Modan" },
			[8] = { str = "Do  #DOQUESTGathering Idols#  behind here then turn it back in." },
			[9] = { str = "Go behind the excavation site to the house at 82,62.", x = 82, y = 62, zone = "Loch Modan" },
			[10] = { str = "Turn right when you enter and accept  #ACCEPTCrocolisk Hunting#  (behind hunter trainer) then go to the other side and accept  #ACCEPTA Hunter's Boast# " },
			[11] = { str = "Go do  #DOQUESTA Hunter's Boast#  birds in front of the house." },
			[12] = { str = "Turn in  #TURNINA Hunter's Boast#  accept  #ACCEPTA Hunter's Challenge#  do it, mobs are around 75,41.", x = 75, y = 41, zone = "Loch Modan" },
			[13] = { str = "Turn in  #TURNINA Hunter's Challenge#  Accept  #ACCEPTVyrin's Revenge pt.1#" },
			[14] = { str = "Go to 63,47 and accept  #ACCEPTBingles' Missing Supplies#. Requires pre-quest #ACCEPTFind Bingles# from Gnoarn at 69,50 in Ironforge ", x = 63, y = 47, zone = "Loch Modan" },
			[15] = { str = "Do  #DOQUESTCrocolisk Hunting#  here on the shore and the island at 54,38", x = 54, y = 38, zone = "Loch Modan" },
			[16] = { str = "Grab all the parts for  #DOQUESTBingles' Missing Supplies#  at (54,27 blastencapper), (48,30 wrench), (51,23 hammer), (48,20 screwdriver) ", x = 54, y = 27, zone = "Loch Modan" },
			[17] = { str = "Run up to the dam from the west side and accept  #ACCEPTA Dark Threat Looms pt.1#  at 45,13 then run out the east entrance and turn it in on the barrel guarded by 2 sappers accept  #ACCEPTA Dark Threat Looms pt.2#", x = 45, y = 13, zone = "Loch Modan" },
			[18] = { str = "Turn in  #TURNINA Dark Threat Looms pt.2#  at 45,13", x = 45, y = 13, zone = "Loch Modan" },
			[19] = { str = "Run down the west coast and turn in  #TURNINExcavation Progress Report#  in Thelsamar, accept  #ACCEPTReport to Ironforge#." },
			[20] = { str = "Go to 38,61 and do  #DOQUESTVyrin's Revenge pt.1#", x = 38, y = 61, zone = "Loch Modan" },
			[21] = { str = "Run back to the house at 83,62 turn in  #TURNINCrocolisk Hunting#  and  #TURNINVyrin's Revenge pt.1#  accept  #ACCEPTWyrin’s Revenge pt.2#.", x = 83, y = 62, zone = "Loch Modan" },
			[22] = { str = "Turn in  #TURNINWyrin’s Revenge pt.2#  behind you." },
			[23] = { str = "Go to 63,47 Turn in  #TURNINBingles' Missing Supplies#", x = 63, y = 47, zone = "Loch Modan" },
			[24] = { str = "Run down to 22,70 and follow the path North into Dun Morogh", x = 22, y = 70, zone = "Loch Modan" },
			[25] = { str = "Run along the road to Ironforge at 53,35.", x = 53, y = 35, zone = "Dun Morogh" },
			[26] = { str = "Get IF weapon training at 61,89. Get flight path at 55,38 inside then turn in  #TURNINReport to Ironforge#  at 74,12 skip  #VIDEOPowder to Ironband#", x = 74, y = 12, zone = "Ironforge" },
			[27] = { str = "Get on the tram at 76,51", x = 76, y = 51, zone = "Ironforge" },
			[28] = { str = "Turn in  #TURNINStormpike's Order#  at 58,16 in Stormwind", x = 58, y = 16, zone = "Stormwind City" },
			[29] = { str = "Get SW weapons training at 57,57 and FP at 66,62", x = 66, y = 62, zone = "Stormwind City" },
			[30] = { str = "Run towards 91,73 in Elwynn Forest and enter Redridge Mountains", x = 91, y = 73, zone = "Elwynn Forest" },
		}
	},

-----------18-20 Redridge Mountains
	--[104] = {
	[1820] = {
		title = "18-20 Redridge Mountains",
		--n = "18-20 Redridge Mountains",
		--pID = 103, nID = 201, 
		--itemCount = 29,
		items = {
			[1] = { str = "18-20 Redridge Mountains" },
			[2] = { str = "Accept  #ACCEPTEncroaching Gnolls#  from the patrol around 15,71", x = 15, y = 71, zone = "Redridge Mountains" },
			[3] = { str = "Turn in  #TURNINEncroaching Gnolls#  at 30,60 Accept  #ACCEPTAssessing the Threat#", x = 30, y = 60, zone = "Redridge Mountains" },
			[4] = { str = "Get flight path." },
			[5] = { str = "Cross the bridge, on the right accept  #ACCEPTBlackrock Menace#  on the left accept  #ACCEPTThe Lost Tools#" },
			[6] = { str = "SKIP  #VIDEOElmore's Task#  SKIP  #VIDEOThe Price of Shoes#" },
			[7] = { str = "Accept  #ACCEPTHilary's Necklace#  on the dock." },
			[8] = { str = "Accept  #ACCEPTSelling Fish#  near the shed out front" },
			[9] = { str = "Go in the Inn and accept  #ACCEPTA Free Lunch# , SKIP  #VIDEODry Times#" },
			[10] = { str = "Go west of Lakeshire and accept  #ACCEPTRedridge Goulash#." },
			[11] = { str = "Get Great Goretusk Snouts just west of the houses (watch out for bellygrub we’ll get him later) for  #DOQUESTRedridge Goulash#." },
			[12] = { str = "Then head toward 41,54 to do  #DOQUESTThe Lost Tools#  and do  #DOQUESTSelling Fish#  by killing murlocs, keep an eye out for a glinting mud pile underwater for  #DOQUESTHilary's Necklace#  Save at least 8 murloc fins for a later quest", x = 41, y = 54, zone = "Redridge Mountains" },
			[13] = { str = "Turn in  #TURNINThe Lost Tools#  by the bridge accept  #ACCEPTThe Everstill Bridge#" },
			[14] = { str = "Turn in  #TURNINHilary's Necklace#  on the dock." },
			[15] = { str = "Turn in  #TURNINSelling Fish#  by the shed in front of the houses." },
			[16] = { str = "You should be half way to level 20 at this point." },
			[17] = { str = "Turn in  #TURNINA Free Lunch#  around 14,70 accept  #ACCCEPTVisit the Herbalist#.", x = 14, y = 70, zone = "Redridge Mountains" },
			[18] = { str = "Kill spiders for  #DOQUESTRedridge Goulash#  between 14,70 and 29,83.", x = 29, y = 83, zone = "Redridge Mountains" },
			[19] = { str = "Kill condors for  #DOQUESTRedridge Goulash#  around 57,73", x = 57, y = 73, zone = "Redridge Mountains" },
			[20] = { str = "Turn in  #TURNINAssessing the Threat#  near the FP" },
			[21] = { str = "Accept  #ACCEPTMurloc Poachers#  in front of the shed." },
			[22] = { str = "Stop at the house just west of Lakeshire, turn in  #TURNINVisit the Herbalist#  accept  #ACCEPTDelivering Daffodils#" },
			[23] = { str = "Go to the next house, turn in  #TURNINRedridge Goulash#" },
			[24] = { str = "Go in the Inn and turn in  #TURNINDelivering Daffodils#." },
			[25] = { str = "Kill Murlocs east of the bridge for  #DOQUESTMurloc Poachers#." },
			[26] = { str = "Kill Gnolls north of Lakeshire for  #DOQUESTThe Everstill Bridge#." },
			[27] = { str = "Turn in  #TURNINThe Everstill Bridge#  next to the Bridge" },
			[28] = { str = "Turn in  #TURNINMurloc Poachers#  in front of the shed." },
			[29] = { str = "Hearth back to Auberdine. You should definitely be level 20 by this point and at least half way to level 21." },
		}
	},
}
