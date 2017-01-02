--[[--------------------------------------------------
003_Alliance_30to40.lua
Authors: mrmr
Version: 1.04.3
------------------------------------------------------
Description: Guide Serie - 003 From Lvl 30 to Lvl 40
    1.04.1
        -- First Release
            Alliance's Guide
            from level 30 to lever 40
    1.04.2
    	-- no changes in here for this revision
	1.04.3
		-- Added color codes
			Fixed various spelling errors
------------------------------------------------------
Connection:
--]]--------------------------------------------------

Table_003_Alliance_30to40 = {
-----------30-31 Hillsbrad Foothills
	--[301] = {
	[3031] = {
		title = "30-31 Hillsbrad Foothills",
		--n = "30-31 Hillsbrad Foothills",
		--pID = 210, nID = 302,
		--itemCount = 13,
		items = {
			[1] = { str = "30-31 Hillsbrad Foothills" },
			[2] = { str = "Run into southshore at 49,52 and grab the FP", x = 49, y = 52, zone = "Hillsbrad Foothills" },
			[3] = { str = "Stop at the barn east of the FP, accept #ACCEPTCostly Menace#" },
			[4] = { str = "Go to the house in front of the barn, turn in  #TURNINSouthshore#  SKIP the next part " },
			[5] = { str = "Go in front of the Inn, accept #ACCEPTHints of a New Plague#" },
			[6] = { str = "Go in the Inn, make it your home, then accept  #ACCEPTDown the Coast#." },
			[7] = { str = "In front of the town hall, accept  #ACCEPTCrushridge Bounty#" },
			[8] = { str = "Go in the town hall, accept #ACCEPTSyndicate Assassins#" },
			[9] = { str = "Go just SW of Southshore and do  #DOQUESTDown the Coast#  on the shore, killing murlocs. Turn it in at the Inn when you’re done, accept  #ACCEPTFarren's Proof pt.1#" },
			[10] = { str = "Do  #DOQUESTFarren's Proof pt.1#  again on the shore, if I’m not level 31 by the time I’m done getting heads, I grind till I am." },
			[11] = { str = "Go back to the Inn, turn in  #TURNINFarren's Proof pt.1#  accept  #ACCEPTFarren’s Proof pt.2#  hand that in just out front of the Inn, accept  #ACCEPTFarren’s Proof pt.3#  Go back into the Inn, hand it in accept #ACCEPTStormwind ho!# " },
			[12] = { str = "Go do #DOQUESTStormwind ho!#  just SE of the dock now, kill the naga along the shore." },
			[13] = { str = "Go back to the Inn hand in Stormwind ho! , accept  #ACCEPTReassignment#" },
		}
	},

-----------31-31 Alterac Mountains
	--[302] = {
	[3131] = {
		title = "31-31 Alterac Mountains",
		--n = "31-31 Alterac Mountains",
		--pID = 301, nID = 303,
		--itemCount = 8,
		items = {
			[1] = { str = "31-31 Alterac Mountains" },
			[2] = { str = "Run up into Alterac Mountains near the AV entrance around 64,38 and kill lions for #DOQUESTCostly Menace# They’re all along the southern border near AV. I usually get all mine in front and West of AV", x = 64, y = 38, zone = "Alterac Mountains" },
			[3] = { str = "Go east of AV and do  #DOQUESTSyndicate Assassins#  at the camp around 55,67. There is a camp close to AV but this one has a quest you can grab near the tents on the table. Clear the camp and touch the syndicate document, accept  #ACCEPTForeboding Plans#  and  #ACCEPTEncrypted Letter#", x = 55, y = 67, zone = "Alterac Mountains" },
			[4] = { str = "Hearth to Southshore" },
			[5] = { str = "Go into the town hall, turn in  #TURNINSyndicate Assassins#  and  #TURNINForeboding Plans#  accept  #ACCEPTNoble Deaths#" },
			[6] = { str = "Stop at the house North of the Inn, turn in  #TURNINEncrypted Letter#  accept  #ACCEPTLetter to Stormpike#" },
			[7] = { str = "Go to the barn and turn in  #TURNINCostly Menace#" },
			[8] = { str = "Fly to Refuge Point" },
		}
	},

-----------31-32 Arathi Highlands
	--[303] = {
	[3132] = {
		title = "31-32 Arathi Highlands",
		--n = "31-32 Arathi Highlands",
		--pID = 302, nID = 304,
		--itemCount = 10,
		items = {
			[1] = { str = "31-32 Arathi Highlands" },
			[2] = { str = "Accept  #ACCEPTNorthfold Manor#  grind to it at 33,27 I grind here until I’m level 32", x = 33, y = 27, zone = "Arathi Highlands" },
			[3] = { str = "Hearth to Southshore, Fly to Refuge point, turn in  #TURNINNorthfold Manor#  Fly to IF" },
			[4] = { str = "Go to the hall of explorers at 69,20 in IF accept  #ACCEPTReclaimers' Business# in Desolace  then go turn in  #TURNINLetter to Stormpike#  accept  #ACCEPTFurther Mysteries#", x = 69, y = 20, zone = "Arathi Highlands" },
			[5] = { str = "Accept  #ACCEPTThe Brassbolts Brothers#  in The Hall of Arms at 72,93 then get new skills", x = 72, y = 93, zone = "Arathi Highlands" },
			[6] = { str = "Make IF your home at 18,51 Buy some #NPCBloodstone Ore# for a quest later in STV. If there is none check the AH in Booty Bay", x = 18, y = 51, zone = "Arathi Highlands" },
			[7] = { str = "Fly to SW" },
			[8] = { str = "Go to the Keep at 72,15 and hand in  #TURNINReassignment#", x = 72, y = 15, zone = "Stormwind City" },
			[9] = { str = "Go to 39,27 in the Cathedral and hand in  #TURNINCleansing the Eye#", x = 39, y = 27, zone = "Stormwind City" },
			[10] = { str = "Fly to Duskwood, then run to 44,66 and go south into STV", x = 44, y = 66, zone = "Duskwood" }
		}
	},

-----------32-32 Stranglethorn Vale
	--[304] = {
	[3232] = {
		title = "32-32 Stranglethorn Vale",
		--n = "32-32 Stranglethorn Vale",
		--pID = 303, nID = 305,
		--itemCount = 19,
		items = {
			[1] = { str = "32-32 Stranglethorn Vale" },
			[2] = { str = "Run to the Rebel Camp at 37,3 its just west after you enter.", x = 37, y = 3, zone = "Stranglethorn Vale" },
			[3] = { str = "Accept  #ACCEPTThe Second Rebellion#  and  #ACCEPTBad Medicine#" },
			[4] = { str = "Then accept  #ACCEPTKrazek's Cookery#" },
			[5] = { str = "Go to Nessingway’s at 35,10 and accept  #ACCEPTWelcome to the Jungle#  then turn it in behind you. This opens the 3 quest givers here.", x = 35, y = 10, zone = "Stranglethorn Vale" },
			[6] = { str = "Now Accept  #ACCEPTRaptor Mastery pt.1#   #ACCEPTPanther Mastery pt.1#   #ACCEPTTiger Mastery pt.1#  Don’t accept the page-collecting quest until you have all the pages." },
			[7] = { str = "Do  #DOQUESTPanther Mastery pt.1#  &  #DOQUESTTiger Mastery pt.1#  Tigers are just behind Nessingway’s, and the Panthers are to the east some but centralized around 41,9", x = 41, y = 9, zone = "Stranglethorn Vale" },
			[8] = { str = "Go to 44,10 and do  #DOQUESTThe Second Rebellion#  and the Kurzen supply crate at 44,9 in front of the Inn for  #DOQUESTBad Medicine#  the remedies are a low drop from medicine men.", x = 44, y = 10, zone = "Stranglethorn Vale" },
			[9] = { str = "Run back up to the rebel camp at 37,3 Turn in  #TURNINThe Second Rebellion#  and  #TURNINBad Medicine#  SKIP  #VIDEOSpecial Forces#.", x = 37, y = 3, zone = "Stranglethorn Vale" },
			[10] = { str = "Go back to Nessingway’s at 35,10 and hand in  #TURNINPanther Mastery# pt.1  &  #TURNINTiger Mastery pt.1#  accept  #ACCEPTPanther Mastery pt.2#  &  #ACCEPTTiger Mastery pt.2#.", x = 35, y = 10, zone = "Stranglethorn Vale" },
			[11] = { str = "Kill Stranglethorn Tigers for around 29,10 for  #DOQUESTTiger Mastery pt.2# and the Panthers around 28,12 for  #DOQUESTPanther Mastery pt.2#.", x = 29, y = 10, zone = "Stranglethorn Vale" },
			[12] = { str = "Kill Stranglethorn Raptors for 26,15  #DOQUESTRaptor Mastery pt.1#", x = 26, y = 15, zone = "Stranglethorn Vale" },
			[13] = { str = "Go back to Nessingway’s at 35,10 and turn in  #TURNINTiger Mastery pt.2#,  #TURNINPanther Mastery pt.2#, and  #TURNINRaptor Mastery pt.1#. Accept  #ACCEPTTiger Mastery pt.3#,  #ACCEPTPanther Mastery pt.3#  and  #ACCEPTRaptor Mastery pt.2#", x = 35, y = 10, zone = "Stranglethorn Vale" },
			[14] = { str = "Run to Booty Bay and get the FP." },
			[15] = { str = "Turn in  #TURNINKrazek's Cookery#  on the top floor of the inn, accept and hand back in (the bloodstone ores)  #ACCEPTFavor for Krazek#  then accept  #ACCEPTReturn to Corporal Kaleb#  (this quest gives you your first helm) also accept  #ACCEPTInvestigate the Camp#  and  #ACCEPTSupplies to Private Thorsen#" },
			[16] = { str = "Get on the Boat to Rachet" },
			[17] = { str = "Grab the FP" },
			[18] = { str = "Now for a little bit of a run through horde territory. Run all the way south in the barrens to the great lift and take it down into 1k needles. Jump off if you get attacked." },
			[19] = { str = "Run all the way south in the barrens to the great lift and take it down into 1k needles. Jump off if you get attacked." },
		}
	},

-----------32-33 Thousand Needles (Shimmering Flats)
	--[305] = {
	[3233] = {
		title = "32-33 Thousand Needles (Shimmering Flats)",
		--n = "32-33 Thousand Needles (Shimmering Flats)",		
		--pID = 304, nID = 306,
		--itemCount = 19,
		items = {
			[1] = { str = "32-33 Thousand Needles (Shimmering Flats)" },
			[2] = { str = "Now Get the FP on the west side of this zone at 8,18, it’s just inside Feralas. This will save a lot of time later on.", x = 8, y = 18, zone = "Thousand Needles" },
			[3] = { str = "You should be close to level 33 so grind to it on your way to Shimmering Flats." },
			[4] = { str = "Go to 78,77 and turn in  #TURNINThe Brassbolts Brothers#  accept  #ACCEPTHardened Shells#  and  #ACCEPTSalt Flat Venom#", x = 78, y = 77, zone = "Thousand Needles" },
			[5] = { str = "Go a little beside these guys and grab  #ACCEPTRocket Car Parts#,  #ACCEPTWharfmaster Dizzywig#  and  #ACCEPTHemet Nesingwary#" },
			[6] = { str = "Go east to 80,75 and accept  #ACCEPTLoad Lightening#", x = 80, y = 75, zone = "Thousand Needles" },
			[7] = { str = "Go to 81,77 and accept  #ACCEPTA Bump in the Road#", x = 81, y = 77, zone = "Thousand Needles" },
			[8] = { str = "Now the car parts for  #DOQUESTRocket Car Parts#  are scattered all over here, so grab them as you quest. The Buzzards for  #DOQUESTLoad Lightening#  are all over as well so kill one if you see it." },
			[9] = { str = "Start off by going south and killing gazers and crystalhide at 76,87 for  #DOQUESTA Bump in the Road#", x = 76, y = 87, zone = "Thousand Needles" },
			[10] = { str = "Kill scorpions at 71,74 and north of here for  #DOQUESTSalt Flat Venom#", x = 71, y = 74, zone = "Thousand Needles" },
			[11] = { str = "Kill Basilisks around 73,59 for  #DOQUESTA Bump in the Road#", x = 73, y = 59, zone = "Thousand Needles" },
			[12] = { str = "Kill Turtles at 82,54 for  #DOQUESTHardened Shells#", x = 82, y = 54, zone = "Thousand Needles" },
			[13] = { str = "Stop at 86,66 and do  #DOQUESTLoad Lightening#", x = 86, y = 66, zone = "Thousand Needles" },
			[14] = { str = "Run back to 77,77 turn in  #TURNINRocket Car Parts#", x = 77, y = 77, zone = "Thousand Needles" },
			[15] = { str = "Go to the 2 npc’s next east of here and hand in  #TURNINSalt Flat Venom#  and  #TURNINHardened Shells#  then accept  #ACCEPTMartek the Exiled#" },
			[16] = { str = "Run east to 80,75 turn in  #TURNINLoad Lightening#  accept  #ACCEPTGoblin Sponsorship pt.1#", x = 80, y = 75, zone = "Thousand Needles" },
			[17] = { str = "Go to 81,77 and turn in  #TURNINA Bump in the Road#", x = 81, y = 77, zone = "Thousand Needles" },
			[18] = { str = "Run south into Tanaris and Grab the FP at Gadgetzan" },
			[19] = { str = "Hearth back to IF and fly to Menethil Harbor, get on the boat to Theramore, Get FP and either fly to Stonetalon Mountains or go back and sail to Darkshore." },
		}
	},

-----------33-33 Stonetalon Mountains
	--[306] = {
	[3333] = {
		title = "33-33 Stonetalon Mountains",
		--n = "33-33 Stonetalon Mountains",
		--pID = 305, nID = 307,
		--itemCount = 2,
		items = {
			[1] = { str = "33-33 Stonetalon Mountains" },
			[2] = { str = "Accept  #ACCEPTReclaiming the Charred Vale#  in front of the moonwell then go do it in the Charred Vale at 32,66 while going towards Desolace ", x = 32, y = 66, zone = "Stonetalon Mountains" },
		}
	},

-----------33-35 Desolace
	--[307] = {
	[3335] = {
		title = "33-35 Desolace",
		--n = "33-35 Desolace",
		--pID = 306, nID = 308,
		--itemCount = 38,
		items = {
			[1] = { str = "33-35 Desolace" },
			[2] = { str = "Make Nijel’s Point your home then fly back to Stonetalon and hand in  #TURNINReclaiming the Charred Vale#  SKIP the next part." },
			[3] = { str = "Hearth back to Desolace" },
			[4] = { str = "Go south of the Inn, hand in  #TURNINReclaimers' Business# in Desolace  accept  #ACCEPTReagents for Reclaimers Inc pt.1#  and  #ACCEPTThe Karnitol Shipwreck pt.1#" },
			[5] = { str = "I SKIP both of the faction centaur quests. It’s just a useless grind for 2 quests that aren’t worth it." },
			[6] = { str = "Accept  #ACCEPTCentaur Bounty#" },
			[7] = { str = "Go south a little bit more and accept  #ACCEPTVahlarriel's Search pt.1#" },
			[8] = { str = "Run west to 56,17  #DOQUESTVahlarriel's Search pt.1#  accept  #ACCEPTVahlarriel’s Search pt.2#", x = 56, y = 17, zone = "Desolace" },
			[9] = { str = "Run east to Sargeron around 75,20 and kill the demons for  #DOQUESTReagents for Reclaimers Inc pt.1#", x = 75, y = 20, zone = "Desolace" },
			[10] = { str = "Run back to Nijel’s, hand in  #TURNINVahlarriel’s Search pt.2#  accept  #ACCEPTVahlarriel’s Search pt.3#" },
			[11] = { str = "Run up a bit more, turn in  #TURNINReagents for Reclaimers Inc pt.1#  accept  #ACCEPTReagents for Reclaimers Inc pt.2#" },
			[12] = { str = "Now start grinding on the scorps and other stuff for  #DOQUESTReagents for Reclaimers Inc pt.2#  as you head to 62,38 and accept  #ACCEPTBone Collector#  since the scorps are a low drop rate just kill them as you’re running around", x = 62, y = 38, zone = "Desolace" },
			[13] = { str = "Run east until you’re at kolkar village around 72,45. Kill them for  #DOQUESTCentaur Bounty#  If you’re not 34 when done with this, grind until you are", x = 72, y = 45, zone = "Desolace" },
			[14] = { str = "Grind down to 60,61 and accept  #ACCEPTKodo Roundup#  This is a unique quest where you tame a kodo at the GY then bring it back until you have 5.", x = 60, y = 61, zone = "Desolace" },
			[15] = { str = "If you see the pack of aged kodo’s running around kill 3 of them for  #DOQUESTReagents for Reclaimers Inc pt.2#  if not you can find some inside the kodo graveyard." },
			[16] = { str = "Go to the Kodo Graveyard around 51,58. Do  #DOQUESTBone Collector#  everytime you come to pick up a kodo for roundup.", x = 51, y = 58, zone = "Desolace" },
			[17] = { str = "Once you’re done with  #DOQUESTKodo Roundup#  hand it in and run NW of the GY towards the water. Killing scorps if you still need them." },
			[18] = { str = "Grab  #ACCEPTSceptre of Light#  at 38,27 near the big tower", x = 38, y = 27, zone = "Desolace" },
			[19] = { str = "Go south on the beach to 36,30 and finish  #DOQUESTThe Karnitol Shipwreck pt.1#  accept  #ACCEPTThe Karnitol Shipwreck pt.2#  then accept  #ACCEPTClaim Rackmore's Treasure!#  from Rackmore’s log. If your quest log is full drop centaur bounty.", x = 36, y = 30, zone = "Desolace" },
			[20] = { str = "Kill Drysnaps in the waters right here for the silver key of  #DOQUESTClaim Rackmore's Treasure!#  and The Slitherblades just North of here for the golden key." },
			[21] = { str = "Run up to Thunder Axe Fortress at 56,29 and go in the main building in the center and turn in  #TURNINVahlarriel’s Search pt.3#  at 54,26 accept  #ACCEPTSearch for Tyranis#", x = 54, y = 26, zone = "Desolace" },
			[22] = { str = "Run out and right, kill a seer up in a tower for  #DOQUESTSceptre of Light#" },
			[23] = { str = "Go to the building west of the entrance at 53,29 kill Tyranis Malem for  #DOQUESTSearch for Tyranis#  then turn it back in inside the main building. Clear the way in the main building to the right because an escort is next.", x = 53, y = 29, zone = "Desolace" },
			[24] = { str = "Accept the escort quest  #ACCEPTReturn to Vahlarriel#  DON’T attack anything unless it hits or or she’ll ignore it and keep walking. The reason it seems is melee just follow her, only the mages can hit her to start combat." },
			[25] = { str = "Go to 62,38 and turn in  #TURNINBone Collector#", x = 62, y = 38, zone = "Desolace" },
			[26] = { str = "Run back to 38,27 and turn in  #TURNINSceptre of Light#  accept  #ACCEPTBook of the Ancients#", x = 38, y = 27, zone = "Desolace" },
			[27] = { str = "Swim all the way NW on the map to Ranazjar Isle and open the chest at 30,9 for  #DOQUESTClaim Rackmore's Treasure!#", x = 30, y = 9, zone = "Desolace" },
			[28] = { str = "Go to the back of the island and clear all around the serpent statue at 28,7. You’re gonna do  #DOQUESTBook of the Ancients#  This quest bugs if you do not click the gem in your inventory and then on the statue. Don’t just click on the statue. He’s 38 but super easy.", x = 28, y = 7, zone = "Desolace" },
			[29] = { str = "Swim back to 38,27 and turn in  #TURNINBook of the Ancients#", x = 38, y = 27, zone = "Desolace" },
			[30] = { str = "Hearth to Nijel’s" },
			[31] = { str = "Go south of the Inn and turn in  #TURNINReagents for Reclaimers Inc pt.2#  SKIP pt.3 for now, and  #ACCEPTThe Karnitol Shipwreck pt.2#  SKIP the rest." },
			[32] = { str = "Go south a bit more, turn in  #TURNINCentaur Bounty#" },
			[33] = { str = "Finally turn in  #TURNINReturn to Vahlarriel#" },
			[34] = { str = "You should be within 2 bars to level 35 now. I grind down on the Centaurs at Gelkis Village at 37,80 until level 35", x = 37, y = 80, zone = "Desolace" },
			[35] = { str = "Head south into Feralas to get the FP, this will again save more time later on." },
			[36] = { str = "Get on the Boat at 43,42 and grab the FP in Feathermoon. Fly to Theramore, then to Rachet.", x = 43, y = 42, zone = "Desolace" },
			[37] = { str = "Go to the engineer hut at 62,36 and hand in  #TURNINGoblin Sponsorship pt.1#  accept  #ACCEPTGoblin Sponsorship pt.2#  Then run out on the dock and hand in  #TURNINWharfmaster Dizzywig#  accept  #ACCEPTParts for Kravel#", x = 62, y = 36, zone = "Desolace" },
			[38] = { str = "Get on the boat to Booty Bay" },
		}
	},

-----------35-36 Stranglethorn Vale
	--[308] = {
	[3536] = {
		title = "35-36 Stranglethorn Vale",
		--n = "35-36 Stranglethorn Vale",
		--pID = 307, nID = 309,
		--itemCount = 38,
		items = {
			[1] = { str = "35-36 Stranglethorn Vale" },
			[2] = { str = "Hand in  #TURNINGoblin Sponsorship pt.2#  as you get off the boat, accept  #ACCEPTGoblin Sponsorship pt.3#" },
			[3] = { str = "Go in the Inn make BB your home, Accept  #ACCEPTSinging Blue Shards#" },
			[4] = { str = "Accept  #ACCEPTHostile Takeover#  and  #ACCEPTBloodscalp Ears#" },
			[5] = { str = "Accept  #ACCEPTThe Haunted Isle#  and turn it in just outside the door, accept  #ACCEPTThe Stone of the Tides#  Then turn in  #TURNINGoblin Sponsorship pt.3#  accept  #ACCEPTGoblin Sponsorship pt.4#" },
			[6] = { str = "Go into the shop Tan-Your-Hide Leatherworks and accept  #ACCEPTSupply and Demand#  (it’s down the ramp from the FP)" },
			[7] = { str = "Go around 48,21 and Kill Shadowmaw Panthers for  #DOQUESTPanther Mastery pt.3#", x = 48, y = 21, zone = "Stranglethorn Vale" },
			[8] = { str = "Run west to the Venture Co. Base Camp at 43,18 and Kill the goblins here for  #DOQUESTHostile Takeover#  while you climb the Operations Tower behind the base for  #DOQUESTGoblin Sponsorship pt.4#  You’re going to climb it and kill Foreman Cozzle for his key.", x = 43, y = 18, zone = "Stranglethorn Vale" },
			[9] = { str = "If you still don’t have all the crystals kill the goblins until you do, then enter the tiny shack next to the base at 43,20 and open the chest to get the blueprints for  #DOQUESTGoblin Sponsorship pt.4#", x = 43, y = 20, zone = "Stranglethorn Vale" },
			[10] = { str = "Kill Lashtail Raptors around 37,22 for  #DOQUESTRaptor Mastery pt.2#", x = 37, y = 22, zone = "Stranglethorn Vale" },
			[11] = { str = "Kill Elter Tigers around 33,18 for  #DOQUESTTiger Mastery pt.3#", x = 33, y = 18, zone = "Stranglethorn Vale" },
			[12] = { str = "Run towards Nessingways and kill the crocs in the river around it for  #DOQUESTSupply and Demand#" },
			[13] = { str = "Go to Nessingways and turn in #TURNINTiger Mastery pt.3#,  #TURNINPanther Mastery pt.3#,  #TURNINRaptor Mastery pt.2#, and  #TURNINHemet Nesingwary#, Accept  #ACCEPTTiger Mastery pt.4#   #ACCEPTPanther Mastery pt.4#  and   #ACCEPTRaptor Mastery pt.3#" },
			[14] = { str = "Run back south to the top of the hill at 32,17 and kill Sin’Dall for  #DOQUESTTiger Mastery pt.4#  then turn it back in at Nessingways", x = 32, y = 17, zone = "Stranglethorn Vale" },
			[15] = { str = "Go up to the rebel camp at 37,3 and hand in  #TURNINSupplies to Private Thorsen#, If he’s not here look south of the camp, if you save him when he patrols you can also get  #ACCEPTJungle Secrets#  then u turn that in at the camp and get  #ACCEPTBookie Herod#", x = 37, y = 3, zone = "Stranglethorn Vale" },
			[16] = { str = "Hand in  #TURNINReturn to Corporal Kaleb#  get your helm" },
			[17] = { str = "Accept  #ACCEPTSpecial Forces#" },
			[18] = { str = "Go to the Inn looking building at 43,9 touch the book on the 2nd floor and hand in  #TURNINBookie Herod#  accept  #ACCEPTThe Hidden Key#", x = 43, y = 9, zone = "Stranglethorn Vale" },
			[19] = { str = "Go in the cave at 45,7 and kill the mobs in here for  #DOQUESTSpecial Forces#  and make your way to the chest for  #DOQUESTBookie Herod# , it’s down the first fork, only 1 level down then in the boxes. Accept  #ACCEPTThe Spy Revealed!#  (Easy from here)", x = 45, y = 7, zone = "Stranglethorn Vale" },
			[20] = { str = "Now grind back out since you should be close to level 36. Once your out go back to the rebel camp." },
			[21] = { str = "Hand in  #TURNINSpecial Forces#  SKIP the next part" },
			[22] = { str = "Hand in  #TURNINThe Spy Revealed!#  accept  #ACCEPTPatrol Schedules#  turn around and hand that in and accept  #ACCEPTReport to Doren#  then turn around again and hand that back in (told you it was easy)" },
			[23] = { str = "You should definitely be level 36 by now. We’ll get skills soon" },
			[24] = { str = "Go south toward the GY, then go west north of the river and kill basalisks for  #DOQUESTSinging Blue Shards#  if you don’t get them all now don’t worry there is more south." },
			[25] = { str = "Kill Bloodscalp at 29,19 for  #DOQUESTBloodscalp Ears#  You’ll probably have to clear it 2-3 times. They’re easy", x = 29, y = 19, zone = "Stranglethorn Vale" },
			[26] = { str = "Kill Basalisks to finish  #DOQUESTSinging Blue Shards#  just west of here above the shore." },
			[27] = { str = "Run south on the Island till it says complete for  #DOQUESTThe Stone of the Tides#  Go back up and kill basalisks if needed." },
			[28] = { str = "Hearth to BB" },
			[29] = { str = "Turn in  #TURNINSinging Blue Shards#  SKIP the next for now" },
			[30] = { str = "Go upstairs turn in  #TURNINInvestigate the Camp#,  #TURNINBloodscalp Ears#" },
			[31] = { str = "Go just outside, turn in  #TURNINThe Stone of the Tides#  and  #TURNINGoblin Sponsorship pt.4#  Accept  #ACCEPTWater Elementals#  and  #ACCEPTGoblin Sponsorship pt.5#" },
			[32] = { str = "Go into the shop Tan-Your-Hide Leatherworks and turn in  #TURNINSupply and Demand#  (it’s down the ramp from the FP) accept  #ACCEPTSome assembly required#" },
			[33] = { str = "I’m half way to level 37 at this point" },
			[34] = { str = "Fly to IF get new skills then fly to Menethil Harbor, make it your home, and sail to Theramore" },
			[35] = { str = "If you’re first aid is at 225 go do  #ACCEPTTriage#  then fly to Gadgetzan" },
			[36] = { str = "Run out to Shimmering Flats at 77,77 and turn in  #TURNINParts for Kravel#  accept  #ACCEPTDelivery to the Gnomes#  then turn around and hand it in", x = 77, y = 77, zone = "Stranglethorn Vale" },
			[37] = { str = "Go a little East and hand in  #TURNINGoblin Sponsorship pt.5#  accept  #ACCEPTThe Eighteenth Pilot#  then hand it in 2 feet away, accept  #ACCEPTRazzeric's Tweaking#" },
			[38] = { str = "Grab  #ACCEPTThe Rumormonger#  at 77,77 then Hearth to Menethil Harbor", x = 77, y = 77, zone = "Stranglethorn Vale" },
		}
	},

-----------36-37 Alterac Mountains
 	--[309] = {
 	[3637] = {
		title = "36-37 Alterac Mountains",
		--n = "36-37 Alterac Mountains",
		--pID = 308, nID = 310,
		--itemCount = 10,
		items = {
			[1] = { str = "36-37 Alterac Mountains" },
			[2] = { str = "Go to the Town Hall and turn in  #TURNINFurther Mysteries#  accept  #ACCEPTDark Council#  and  #ACCEPTNoble Deaths#" },
			[3] = { str = "Make Southshore your home" },
			[4] = { str = "Run into Alterac Mountains to 47,55 and kill ogres for  Crushridge Bounty", x = 47, y = 55, zone = "Alterac Mountains" },
			[5] = { str = "Grind up to Strahnbrad around 60,43 and kill the syndicate and grab their rings for  #DOQUESTNoble Deaths#  You can also kill shadow mages here for  #DOQUESTDark Council#   which is easier than killing them in the camps later", x = 60, y = 43, zone = "Alterac Mountains" },
			[6] = { str = "Grind your way west to to the house at 39,16 and kill #NPCNagaz# for  #DOQUESTDark Council#. I take out the first camp you come across then grind anything in my way west that’s not in a camp. ", x = 39, y = 16, zone = "Alterac Mountains" },
			[7] = { str = "You wanna be at least 2 bars from level 37, if so hearth to SS" },
			[8] = { str = "Run across from the Inn, turn in  #TURNINCrushridge Bounty#  SKIP the next" },
			[9] = { str = "Go in the Inn, turn in  #TURNINDark Council#  and  #TURNINNoble Deaths#" },
			[10] = { str = "Fly to Arathi Highlands" },
		}
	},

-----------37-38 Arathi Highlands
	--[310] = {
	[3738] = {
	    title = "37-38 Arathi Highlands",
	    --n = "37-38 Arathi Highlands",
	    --pID = 309, nID = 311,
	    --itemCount = 28,
	    items = {
			[1] = { str = "37-38 Arathi Highlands" },
			[2] = { str = "Accept  #ACCEPTWorth Its Weight In Gold#" },
			[3] = { str = "Run to 62,33 touch the crystal and accept  #ACCEPTThe Princess Trapped#", x = 62, y = 33, zone = "Arathi Highlands" },
			[4] = { str = "Go just east of Hammerfall to 80,40. (Load up on bloodstone ore here, you can sell it for a few g per 4 in BB) This is a tree, behind it is the path up to the cave to kill kobolds for  #DOQUESTThe Princess Trapped#  If you get them all before the end of the cave you have to continue to the end to hand it in by touching Iridescent Shards and accept  #ACCEPTStones of Binding#", x = 80, y = 40, zone = "Arathi Highlands" },
			[5] = { str = "You should be just about ¼ through this level when you exit the cave." },
			[6] = { str = "Go to the circle of east binding, just west of Hammerfall at 80,36 and grab the cresting key from the rock.", x = 80, y = 36, zone = "Arathi Highlands" },
			[7] = { str = "Stop at 60,53 and hand in  #TURNINHints of a New Plague? Pt.1#  accept  #ACCEPTHints of a New Plague? Pt.2#  If you see the courier kill him. Simply send your pet in get aggro, when he’s hurt some multi shot some off of him. He’s easy, just feign and let pet die once courier is dead. The courier walks between refuge and tarren mill.", x = 60, y = 53, zone = "Arathi Highlands" },
			[8] = { str = "Kill the trolls all around the lake at 67,69 for  #DOQUESTWorth Its Weight In Gold#  you can get tusks and medicine bags off the guys here, to get the dagger you have to kill Shadow Hunters in the cave at 68,74", x = 68, y = 74, zone = "Arathi Highlands" },
			[9] = { str = "Go to the circle of outer binding at 52,50 and grab the thundering key from the rock.", x = 52, y = 50, zone = "Arathi Highlands" },
			[10] = { str = "Go to refuge point and hand in  #TURNINWorth Its Weight In Gold#  this opens up  #ACCEPTWand Over Fist#  from another NPC" },
			[11] = { str = "Go do  #DOQUESTWand Over Fist#  by killing #NPCColdrage# in the cave at 53,77 (follow the left path) run back to Refuge hand it in, SKIP the rest", x = 53, y = 77, zone = "Arathi Highlands" },
			[12] = { str = "Go to the circle of west binding at 25,30 and grab the burning key from the rock.", x = 25, y = 30, zone = "Arathi Highlands" },
			[13] = { str = "I found the courier at this point on the road (varies since he travels)" },
			[14] = { str = "Go to the circle of inner binding at 36,57 and turn in  #TURNINStones of Binding#  on the rock, SKIP the rest.", x = 36, y = 57, zone = "Arathi Highlands" },
			[15] = { str = "Run SW of here, there is a path that leads behind Stromgarde at 31,64 follow it around to the cave path at 21,75", x = 31, y = 64, zone = "Arathi Highlands" },
			[16] = { str = "Swim over to the ship and accept  #ACCEPTLand HO!#  then turn around and hand it in." },
			[17] = { str = "Accept  #ACCEPTDeep Sea Salvage#" },
			[18] = { str = "Go by the fire accept  #ACCEPTDrowned Sorrows#  and  #ACCEPTSunken Treasure pt.1#" },
			[19] = { str = "Do  #DOQUESTSunken Treasure pt.1#  by escorting him right behind you in the cave. Turn it in, accept  #ACCEPTSunken Treasure pt.2#" },
			[20] = { str = "Go down south near the sunken ships, around 24,84 and do  #DOQUESTSunken Treasure pt.2#  (use goggles to find them easy),  #DOQUESTDrowned Sorrows#  (nagas), and  #DOQUESTDeep Sea Salvage#  (2 on each ship)", x = 24, y = 84, zone = "Arathi Highlands" },
			[21] = { str = "Turn in  #TURNINDeep Sea Salvage#  on the dock" },
			[22] = { str = "Turn in  #TURNINDrowned Sorrows#  next to the fire, then   #TURNINSunken Treasure pt.2#  accept  #ACCEPTSunken Treasure pt.3#" },
			[23] = { str = "Hand that in on the dock accept  #ACCEPTSunken Treasure pt.4#" },
			[24] = { str = "Run back towards Go’Shek Farm, if you haven’t found the courier yet abandon quest and hearth to SS. If so go to 60,53 and hand in  #TURNINHints of a New Plague? Pt.2#  accept  #ACCEPTHints of a New Plague? Pt.3#  then turn it right back in accept  #ACCEPTHints of a New Plague? Pt.4#", x = 60, y = 53, zone = "Arathi Highlands" },
			[25] = { str = "Escort her when done turn it back in  and accept #ACCEPT“Hints of a New Plague? Pt.5”# Grind until youre 3500 xp to level 38" },
			[26] = { str = "Hearth to Southshore" },
			[27] = { str = "Turn in #TURNIN“Hints of a New Plague? Pt.5”# just outside the Inn" },
			[28] = { str = "Fly to Stormwind for new skills and get the quest #ACCEPTMorgan Stern# from Angus Stern at 41 89, then fly to Menethil and sail to Theramore", x = 41, y = 89, zone = "Stormwind" },
		}
	},

-----------38-38 Dustwallow Marsh
	--[311] = {
	[3838] = {
		title = "38-38 Dustwallow Marsh",
		--n = "38-38 Dustwallow Marsh",
		--pID = 310, nID = 312,
		--itemCount = 30,
		items = {
			[1] = { str = "38-38 Dustwallow Marsh" },
			[2] = { str = "Run up near the Inn, accept #ACCEPT“They Call Him Smiling Jim”#" },
			[3] = { str = "Go in the Inn, accept #ACCEPT“Mudrock Soup and Bugs”# and make Theramore your home. " },
			[4] = { str = "Go to the 2nd floor of the castle behind the Inn, not the tower, turn in #TURNIN“They Call Him Smiling Jim”# This gives you hints about some quests at the old Inn near the Barrens." },
			[5] = { str = "Buy 3 soothing spices from the trade supplies person in the houst at 66,51 (for upcoming quest) ", x = 66, y = 51, zone = "Dustwallow Marsh" },
			[6] = { str = "Just as you exit Theramore, go right and kill Mudrock turtles along the shore for #DOQUEST“Mudrock Soup and Bugs”#" },
			[7] = { str = "Go to the house at 55,26 and accept #ACCEPT“Soothing Spices”# then turn it right back in, accept #ACCEPT“Jarl Needs eyes”#", x = 55, y = 26, zone = "Dustwallow Marsh" },
			[8] = { str = "Touch the mound of dirt beside the house, accept #ACCEPT“The Orc Report”#" },
			[9] = { str = "Run over to Darkmist Cavern at 32,23 and kill spiders inside and outside for #DOQUEST“Jarl Needs eyes”# They drop 1-2 every kill", x = 32, y = 23, zone = "Dustwallow Marsh" },
			[10] = { str = "Stop at 35,38 and grab #ACCEPT“Hungry!”#", x = 35, y = 38, zone = "Dustwallow Marsh" },
			[11] = { str = "Go to 29,47, the shady rest inn, and grab these 3 quests, touch the hoofprints just out front #ACCEPT“Suspicious Hoofprints”# the badge on the board laying on the floorboards (it’s a tiny badge) #ACCEPT“Lieutenant Paval Reethe pt.1”# and the shield over the fireplace #ACCEPT“The Black Shield pt.1”# ", x = 29, y = 47, zone = "Dustwallow Marsh" },
			[12] = { str = "Run over to 54,56 and open the shipping crate for #DOQUEST“Razzeric's Tweaking”#", x = 54, y = 56, zone = "Dustwallow Marsh" },
			[13] = { str = "Hearth to Theramore" },
			[14] = { str = "Turn in #TURNIN“Mudrock Soup and Bugs”# in front of you, accept #ACCEPT“… and bugs”#" },
			[15] = { str = "Go to the docks at the tower and turn in #TURNIN“The Orc Report”# accept #ACCEPT“Captain Vimes”# Run in the castle behind the Inn and turn it in" },
			[16] = { str = "Turn in #TURNIN“Lieutenant Paval Reethe pt.1”# accept #ACCEPT“Lieutenant Paval Reethe pt.2”#" },
			[17] = { str = " Turn in #TURNIN“The Black Shield pt.1”# accept #ACCEPT“The Black Shield pt.2”#" },
			[18] = { str = "Turn in #TURNIN“Suspicious Hoofprints”# accept the next quest " },
			[19] = { str = "Turn around and hand in #TURNIN“Lieutenant Paval Reethe pt.2”# accept #ACCEPT“Daelin's Men”# then turn around hand it in accept #ACCEPT“The Deserters pt.1”#" },
			[20] = { str = "Go to the blacksmith house, turn in #TURNIN“The Black Shield pt.2”# accept #ACCEPT“The Black Shield pt.3”# go turn it in back up in the castle" },
			[21] = { str = "Run out to 55,26 and turn in #TURNIN“Jarl Needs eyes”# SKIP the next", x = 55, y = 26, zone = "Dustwallow Marsh" },
			[22] = { str = "Go just NE of here and kill murlocs for #DOQUEST“Hungry!”#" },
			[23] = { str = "Stop at 46,17 and clear some raptors until you’re 50% or more into 39, then accept #ACCEPT“Stinky's Escape”# just follow him, and kill what attacks him. Really easy.", x = 46, y = 17, zone = "Dustwallow Marsh" },
			[24] = { str = "Stop at 35,38 turn in #TURNIN“Hungry!”#", x = 35, y = 38, zone = "Dustwallow Marsh" },
			[25] = { str = "Go to the tower at 35,53 and attack Balos Jacken, at ¼ life he’ll become friendly and then turn in #TURNIN“The Deserters pt.1”# accept #ACCEPT“The Deserters pt.2”#", x = 35, y = 53, zone = "Dustwallow Marsh" },
			[26] = { str = "Die so you end up near Theramore" },
			[27] = { str = "Turn in #TURNIN“Stinky's Escape”# in the Inn " },
			[28] = { str = "Go up in the castle, turn in #TURNIN“The Deserters pt.2”#" },
			[29] = { str = "Fly to Gadgetzan and run up to the Shimmering Flats to 80,76 turn in #TURNIN“Razzeric's Tweaking”# accept #ACCEPT“Safety First pt.1”# turn it in in Gadget and accept #ACCEPT“Safety First pt.2”# then run back to the flats and hand it in", x = 80, y = 76, zone = "Dustwallow Marsh" },
			[30] = { str = "Hearth to Theramore and fly to Rachet, get on the boat to BB" },
		}
	},

-----------38-40 Stranglethorn Vale
	--[312] = {
	[3840] = {
		title = "38-40 Stranglethorn Vale",
		--n = "38-40 Stranglethorn Vale",
		--pID = 311, nID = 401,
		--itemCount = 38,
		items = {
			[1] = { str = "38-40 Stranglethorn Vale" },
			[2] = { str = "Run towards the Inn, accept #ACCEPT“The Bloodsail Buccaneers pt.1”# halfway" },
			[3] = { str = "Go in the building next to the half boat upside down, accept #ACCEPT“Scaring Shaky”#" },
			[4] = { str = "Go in the Inn, make it your home, accept #ACCEPT“Venture Company Mining”#" },
			[5] = { str = "Go upstairs, turn in #TURNIN“The Rumormonger”# accept #ACCEPT“Dream Dust In the Swamp”# and #ACCEPT“Skullsplitter Tusks”#" },
			[6] = { str = "Go just outside, hand in #TURNIN“Sunken Treasure pt.4”# SKIP the next" },
			[7] = { str = "Go to around 33,39 and kill raptors for  #DOQUEST“Raptor Mastery pt.3”#", x = 33, y = 39, zone = "Stranglethorn Vale" },
			[8] = { str = "Kill Snapjaw Crocolisks from the stream at 38,30 to the lake at 41,19 for #DOQUEST“Some assembly required”#", x = 38, y = 30, zone = "Stranglethorn Vale" },
			[9] = { str = "Go to the Island at 20,23 and kill elementals for #DOQUEST“Water Elementals”# You should be close to level 39 by now, either grind on the elementals or raptors and basalisks around 33,39", x = 20, y = 23, zone = "Stranglethorn Vale" },
			[10] = { str = "Once you’re level 39, grind your way east to the road then to 41,41 and kill the goblins for #DOQUEST“Venture Company Mining”#", x = 41, y = 41, zone = "Stranglethorn Vale" },
			[11] = { str = "Run up to the camps around 42,37 and do #DOQUEST“Skullsplitter Tusks”#", x = 42, y = 37, zone = "Stranglethorn Vale" },
			[12] = { str = "Now you’re gonna have to find Bhag'thera for #DOQUEST“Panther Mastery pt.4”# she is anywhere between just north of Mosh’ogg at 49,25 to just north of the ZG entrance at 48,17 she’s elite. Easy way to do it is lay immolation trap and run her into it, once pet gets half health fear it and keep attacking it", x = 48, y = 25, zone = "Stranglethorn Vale" },
			[13] = { str = "Hearth back to BB" },
			[14] = { str = " Turn in #TURNIN“Venture Company Mining”#" },
			[15] = { str = "Go upstairs, turn in #TURNIN“Skullsplitter Tusks”#" },
			[16] = { str = "Walk outside, turn in #TURNIN“Water Elementals”# SKIP the next" },
			[17] = { str = "Go into the shop Tan-Your-Hide Leatherworks and turn in #TURNIN“Some assembly required”# accept #ACCEPT“Excelsior”#" },
			[18] = { str = "Go out of BB and turn left to the camp of pirates at 27,69 and touch the letter on the barrel, turn in #TURNIN“The Bloodsail Buccaneers pt.1”# accept #ACCEPT“The Bloodsail Buccaneers pt.2”#", x = 27, y = 69, zone = "Stranglethorn Vale" },
			[19] = { str = "Go kill gorillas around 32,65 just NE of BB for #DOQUEST“Scaring Shaky”#", x = 32, y = 65, zone = "Stranglethorn Vale" },
			[20] = { str = "Run back to BB" },
			[21] = { str = "Turn right after the tunnel, turn in #TURNIN“Scaring Shaky”# accept #ACCEPT“Return to MacKinley”#" },
			[22] = { str = "Follow the lower dock towards the Inn, turn in #TURNIN“The Bloodsail Buccaneers pt.2”# accept #ACCEPT“The Bloodsail Buccaneers pt.3”#" },
			[23] = { str = "Go In the house across from the half ship, turn in #TURNIN“Return to MacKinley”# accept #ACCEPT“Voodoo Dues”#" },
			[24] = { str = "Go up top the Inn, accept #ACCEPT“Up To Snuff”#" },
			[25] = { str = "Go just outside, turn in #TURNIN“The Bloodsail Buccaneers pt.3”# accept #ACCEPT“The Bloodsail Buccaneers pt.4”#" },
			[26] = { str = "You should have close to all the STV pages, if not buy the few that you need. You don’t need 1-27 they go in this order. 1,4,6,8,10,11,14,16,18,20,21,24,25,26,27" },
			[27] = { str = "Go up near Grom’Gol, search the shore there for the 38 elite croc for #DOQUEST“Excelsior”# stay away from the base or the guards will get you" },
			[28] = { str = "Run up to Nessingways at 35,10 and turn in #TURNIN“Raptor Mastery pt.3”# and #TURNIN“Panther Mastery pt.4”#  accept #ACCEPT“Raptor Mastery pt.4”#", x = 35, y = 10, zone = "Stranglethorn Vale" },
			[29] = { str = "Accept #ACCEPT“The Green Hills of Stranglethorn”# then turn it in" },
			[30] = { str = "You should be at lest 25% or less to level 40 now go grind on basalisks and raptors around 33,39 until you’re 40.", x = 33, y = 39, zone = "Stranglethorn Vale" },
			[31] = { str = "Hearth to BB" },
			[32] = { str = "Go into the shop Tan-Your-Hide Leatherworks and turn in #TURNIN“Excelsior”#" },
			[33] = { str = "Now fly to IF and accept #ACCEPT“Ironband Wants You”# from Prospector Stormpike at 74 11, and either to Darnassus to get your new skills and your mount, or get skills in IF and prepare for a few badlands quests by buying a frost oil and a gyrochronatom (don’t by a gyro if you can’t find a frost oil) Then a healing potion and lesser invisibility potion. Again don’t get either of the potions if you can’t get a frost oil or gyro.", x = 74, y = 11, zone = "Iron Forge" },
			[34] = { str = "Fly to Loch Modan, Stable your pet, and make Thelsamar your home" },
			[35] = { str = "Go in the house behind the Inn, accept #ACCEPT“Badlands Reagent Run”#" },
			[36] = { str = "Run to 65,65 and accept #ACCEPT“Find Agmond”#", x = 65, y = 65, zone = "Loch Modan" },
			[37] = { str = "Run down into Badlands at 46,76", x = 46, y = 76, zone = "Loch Modan" },
		}
	},
}
