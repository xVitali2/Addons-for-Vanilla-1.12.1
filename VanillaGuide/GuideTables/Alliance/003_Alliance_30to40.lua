--[[--------------------------------------------------
003_Alliance_30to40.lua
Authors: mrmr, lanjelin
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
			Adjustment to coordinate visibility
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
			[2] = { str = "Run into southshore at #COORD[49,52]# and grab the FP", x = 49, y = 52, zone = "Hillsbrad Foothills" },
			[3] = { str = "Stop at the barn east of the FP, accept #GETCostly Menace#" },
			[4] = { str = "Go to the house in front of the barn, turn in #INSouthshore# SKIP the next part " },
			[5] = { str = "Go in front of the Inn, accept #GETHints of a New Plague#" },
			[6] = { str = "Go in the Inn, make it your home, then accept #GETDown the Coast#." },
			[7] = { str = "In front of the town hall, accept #GETCrushridge Bounty#" },
			[8] = { str = "Go in the town hall, accept #GETSyndicate Assassins#" },
			[9] = { str = "Go just SW of Southshore and do #DODown the Coast# on the shore, killing murlocs. Turn it in at the Inn when you’re done, accept #GETFarren's Proof pt.1#" },
			[10] = { str = "Do #DOFarren's Proof pt.1# again on the shore, if I’m not level 31 by the time I’m done getting heads, I grind till I am." },
			[11] = { str = "Go back to the Inn, turn in #INFarren's Proof pt.1# accept #GETFarren’s Proof pt.2# hand that in just out front of the Inn, accept #GETFarren’s Proof pt.3# Go back into the Inn, hand it in accept #GETStormwind ho!# " },
			[12] = { str = "Go do #DOStormwind ho!# just SE of the dock now, kill the naga along the shore." },
			[13] = { str = "Go back to the Inn hand in Stormwind ho! , accept #GETReassignment#" },
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
			[2] = { str = "Run up into Alterac Mountains near the AV entrance around #COORD[64,38]# and kill lions for #DOCostly Menace# They’re all along the southern border near AV. I usually get all mine in front and West of AV", x = 64, y = 38, zone = "Alterac Mountains" },
			[3] = { str = "Go east of AV and do #DOSyndicate Assassins# at the camp around #COORD[55,67]#. There is a camp close to AV but this one has a quest you can grab near the tents on the table. Clear the camp and touch the syndicate document, accept #GETForeboding Plans# and #GETEncrypted Letter#", x = 55, y = 67, zone = "Alterac Mountains" },
			[4] = { str = "Hearth to Southshore" },
			[5] = { str = "Go into the town hall, turn in #INSyndicate Assassins# and #INForeboding Plans# accept #GETNoble Deaths#" },
			[6] = { str = "Stop at the house North of the Inn, turn in #INEncrypted Letter# accept #GETLetter to Stormpike#" },
			[7] = { str = "Go to the barn and turn in #INCostly Menace#" },
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
			[2] = { str = "Accept #GETNorthfold Manor# grind to it at #COORD[33,27]# I grind here until I’m level 32", x = 33, y = 27, zone = "Arathi Highlands" },
			[3] = { str = "Hearth to Southshore, Fly to Refuge point, turn in #INNorthfold Manor# Fly to IF" },
			[4] = { str = "Go to the hall of explorers at #COORD[69,20]# in IF accept #GETReclaimers' Business# in Desolace then go turn in #INLetter to Stormpike# accept #GETFurther Mysteries#", x = 69, y = 20, zone = "Arathi Highlands" },
			[5] = { str = "Accept #GETThe Brassbolts Brothers# in The Hall of Arms at #COORD[72,93]# then get new skills", x = 72, y = 93, zone = "Arathi Highlands" },
			[6] = { str = "Make IF your home at #COORD[18,51]# Buy some #NPCBloodstone Ore# for a quest later in STV. If there is none check the AH in Booty Bay", x = 18, y = 51, zone = "Arathi Highlands" },
			[7] = { str = "Fly to SW" },
			[8] = { str = "Go to the Keep at #COORD[72,15]# and hand in #INReassignment#", x = 72, y = 15, zone = "Stormwind City" },
			[9] = { str = "Go to #COORD[39,27]# in the Cathedral and hand in #INCleansing the Eye#", x = 39, y = 27, zone = "Stormwind City" },
			[10] = { str = "Fly to Duskwood, then run to #COORD[44,66]# and go south into STV", x = 44, y = 66, zone = "Duskwood" }
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
			[3] = { str = "Accept #GETThe Second Rebellion# and #GETBad Medicine#" },
			[4] = { str = "Then accept #GETKrazek's Cookery#" },
			[5] = { str = "Go to Nessingway’s at #COORD[35,10]# and accept #GETWelcome to the Jungle# then turn it in behind you. This opens the 3 quest givers here.", x = 35, y = 10, zone = "Stranglethorn Vale" },
			[6] = { str = "Now Accept #GETRaptor Mastery pt.1# #GETPanther Mastery pt.1# #GETTiger Mastery pt.1# Don’t accept the page-collecting quest until you have all the pages." },
			[7] = { str = "Do #DOPanther Mastery pt.1# & #DOTiger Mastery pt.1# Tigers are just behind Nessingway’s, and the Panthers are to the east some but centralized around 41,9", x = 41, y = 9, zone = "Stranglethorn Vale" },
			[8] = { str = "Go to #COORD[44,10]# and do #DOThe Second Rebellion# and the Kurzen supply crate at 44,9 in front of the Inn for #DOBad Medicine# the remedies are a low drop from medicine men.", x = 44, y = 10, zone = "Stranglethorn Vale" },
			[9] = { str = "Run back up to the rebel camp at 37,3 Turn in #INThe Second Rebellion# and #INBad Medicine# SKIP #VIDEOSpecial Forces#.", x = 37, y = 3, zone = "Stranglethorn Vale" },
			[10] = { str = "Go back to Nessingway’s at #COORD[35,10]# and hand in #INPanther Mastery# pt.1 & #INTiger Mastery pt.1# accept #GETPanther Mastery pt.2# & #GETTiger Mastery pt.2#.", x = 35, y = 10, zone = "Stranglethorn Vale" },
			[11] = { str = "Kill Stranglethorn Tigers for around #COORD[29,10]# for #DOTiger Mastery pt.2# and the Panthers around #COORD[28,12]# for #DOPanther Mastery pt.2#.", x = 29, y = 10, zone = "Stranglethorn Vale" },
			[12] = { str = "Kill Stranglethorn Raptors for #COORD[26,15]# #DORaptor Mastery pt.1#", x = 26, y = 15, zone = "Stranglethorn Vale" },
			[13] = { str = "Go back to Nessingway’s at #COORD[35,10]# and turn in #INTiger Mastery pt.2#, #INPanther Mastery pt.2#, and #INRaptor Mastery pt.1#. Accept #GETTiger Mastery pt.3#, #GETPanther Mastery pt.3# and #GETRaptor Mastery pt.2#", x = 35, y = 10, zone = "Stranglethorn Vale" },
			[14] = { str = "Run to Booty Bay and get the FP." },
			[15] = { str = "Turn in #INKrazek's Cookery# on the top floor of the inn, accept and hand back in (the bloodstone ores) #GETFavor for Krazek# then accept #GETReturn to Corporal Kaleb# (this quest gives you your first helm) also accept #GETInvestigate the Camp# and #GETSupplies to Private Thorsen#" },
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
			[4] = { str = "Go to #COORD[78,77]# and turn in #INThe Brassbolts Brothers# accept #GETHardened Shells# and #GETSalt Flat Venom#", x = 78, y = 77, zone = "Thousand Needles" },
			[5] = { str = "Go a little beside these guys and grab #GETRocket Car Parts#, #GETWharfmaster Dizzywig# and #GETHemet Nesingwary#" },
			[6] = { str = "Go east to #COORD[80,75]# and accept #GETLoad Lightening#", x = 80, y = 75, zone = "Thousand Needles" },
			[7] = { str = "Go to #COORD[81,77]# and accept #GETA Bump in the Road#", x = 81, y = 77, zone = "Thousand Needles" },
			[8] = { str = "Now the car parts for #DORocket Car Parts# are scattered all over here, so grab them as you quest. The Buzzards for #DOLoad Lightening# are all over as well so kill one if you see it." },
			[9] = { str = "Start off by going south and killing gazers and crystalhide at #COORD[76,87]# for #DOA Bump in the Road#", x = 76, y = 87, zone = "Thousand Needles" },
			[10] = { str = "Kill scorpions at #COORD[71,74]# and north of here for #DOSalt Flat Venom#", x = 71, y = 74, zone = "Thousand Needles" },
			[11] = { str = "Kill Basilisks around #COORD[73,59]# for #DOA Bump in the Road#", x = 73, y = 59, zone = "Thousand Needles" },
			[12] = { str = "Kill Turtles at #COORD[82,54]# for #DOHardened Shells#", x = 82, y = 54, zone = "Thousand Needles" },
			[13] = { str = "Stop at #COORD[86,66]# and do #DOLoad Lightening#", x = 86, y = 66, zone = "Thousand Needles" },
			[14] = { str = "Run back to #COORD[77,77]# turn in #INRocket Car Parts#", x = 77, y = 77, zone = "Thousand Needles" },
			[15] = { str = "Go to the 2 npc’s next east of here and hand in #INSalt Flat Venom# and #INHardened Shells# then accept #GETMartek the Exiled#" },
			[16] = { str = "Run east to #COORD[80,75]# turn in #INLoad Lightening# accept #GETGoblin Sponsorship pt.1#", x = 80, y = 75, zone = "Thousand Needles" },
			[17] = { str = "Go to #COORD[81,77]# and turn in #INA Bump in the Road#", x = 81, y = 77, zone = "Thousand Needles" },
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
			[2] = { str = "Accept #GETReclaiming the Charred Vale# in front of the moonwell then go do it in the Charred Vale at #COORD[32,66]# while going towards Desolace ", x = 32, y = 66, zone = "Stonetalon Mountains" },
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
			[2] = { str = "Make Nijel’s Point your home then fly back to Stonetalon and hand in #INReclaiming the Charred Vale# SKIP the next part." },
			[3] = { str = "Hearth back to Desolace" },
			[4] = { str = "Go south of the Inn, hand in #INReclaimers' Business# in Desolace accept #GETReagents for Reclaimers Inc pt.1# and #GETThe Karnitol Shipwreck pt.1#" },
			[5] = { str = "I SKIP both of the faction centaur quests. It’s just a useless grind for 2 quests that aren’t worth it." },
			[6] = { str = "Accept #GETCentaur Bounty#" },
			[7] = { str = "Go south a little bit more and accept #GETVahlarriel's Search pt.1#" },
			[8] = { str = "Run west to #COORD[56,17]# #DOVahlarriel's Search pt.1# accept #GETVahlarriel’s Search pt.2#", x = 56, y = 17, zone = "Desolace" },
			[9] = { str = "Run east to Sargeron around #COORD[75,20]# and kill the demons for #DOReagents for Reclaimers Inc pt.1#", x = 75, y = 20, zone = "Desolace" },
			[10] = { str = "Run back to Nijel’s, hand in #INVahlarriel’s Search pt.2# accept #GETVahlarriel’s Search pt.3#" },
			[11] = { str = "Run up a bit more, turn in #INReagents for Reclaimers Inc pt.1# accept #GETReagents for Reclaimers Inc pt.2#" },
			[12] = { str = "Now start grinding on the scorps and other stuff for #DOReagents for Reclaimers Inc pt.2# as you head to #COORD[62,38]# and accept #GETBone Collector# since the scorps are a low drop rate just kill them as you’re running around", x = 62, y = 38, zone = "Desolace" },
			[13] = { str = "Run east until you’re at kolkar village around #COORD[72,45]#. Kill them for #DOCentaur Bounty# If you’re not 34 when done with this, grind until you are", x = 72, y = 45, zone = "Desolace" },
			[14] = { str = "Grind down to #COORD[60,61]# and accept #GETKodo Roundup# This is a unique quest where you tame a kodo at the GY then bring it back until you have 5.", x = 60, y = 61, zone = "Desolace" },
			[15] = { str = "If you see the pack of aged kodo’s running around kill 3 of them for #DOReagents for Reclaimers Inc pt.2# if not you can find some inside the kodo graveyard." },
			[16] = { str = "Go to the Kodo Graveyard around #COORD[51,58]#. Do #DOBone Collector# everytime you come to pick up a kodo for roundup.", x = 51, y = 58, zone = "Desolace" },
			[17] = { str = "Once you’re done with #DOKodo Roundup# hand it in and run NW of the GY towards the water. Killing scorps if you still need them." },
			[18] = { str = "Grab #GETSceptre of Light# at #COORD[38,27]# near the big tower", x = 38, y = 27, zone = "Desolace" },
			[19] = { str = "Go south on the beach to #COORD[36,30]# and finish #DOThe Karnitol Shipwreck pt.1# accept #GETThe Karnitol Shipwreck pt.2# then accept #GETClaim Rackmore's Treasure!# from Rackmore’s log. If your quest log is full drop centaur bounty.", x = 36, y = 30, zone = "Desolace" },
			[20] = { str = "Kill Drysnaps in the waters right here for the silver key of #DOClaim Rackmore's Treasure!# and The Slitherblades just North of here for the golden key." },
			[21] = { str = "Run up to Thunder Axe Fortress at #COORD[56,29]# and go in the main building in the center and turn in #INVahlarriel’s Search pt.3# at #COORD[54,26]# accept #GETSearch for Tyranis#", x = 54, y = 26, zone = "Desolace" },
			[22] = { str = "Run out and right, kill a seer up in a tower for #DOSceptre of Light#" },
			[23] = { str = "Go to the building west of the entrance at #COORD[53,29]# kill Tyranis Malem for #DOSearch for Tyranis# then turn it back in inside the main building. Clear the way in the main building to the right because an escort is next.", x = 53, y = 29, zone = "Desolace" },
			[24] = { str = "Accept the escort quest #GETReturn to Vahlarriel# DON’T attack anything unless it hits or or she’ll ignore it and keep walking. The reason it seems is melee just follow her, only the mages can hit her to start combat." },
			[25] = { str = "Go to #COORD[62,38]# and turn in #INBone Collector#", x = 62, y = 38, zone = "Desolace" },
			[26] = { str = "Run back to #COORD[38,27]# and turn in #INSceptre of Light# accept #GETBook of the Ancients#", x = 38, y = 27, zone = "Desolace" },
			[27] = { str = "Swim all the way NW on the map to Ranazjar Isle and open the chest at 30,9 for #DOClaim Rackmore's Treasure!#", x = 30, y = 9, zone = "Desolace" },
			[28] = { str = "Go to the back of the island and clear all around the serpent statue at 28,7. You’re gonna do #DOBook of the Ancients# This quest bugs if you do not click the gem in your inventory and then on the statue. Don’t just click on the statue. He’s 38 but super easy.", x = 28, y = 7, zone = "Desolace" },
			[29] = { str = "Swim back to #COORD[38,27]# and turn in #INBook of the Ancients#", x = 38, y = 27, zone = "Desolace" },
			[30] = { str = "Hearth to Nijel’s" },
			[31] = { str = "Go south of the Inn and turn in #INReagents for Reclaimers Inc pt.2# SKIP pt.3 for now, and #GETThe Karnitol Shipwreck pt.2# SKIP the rest." },
			[32] = { str = "Go south a bit more, turn in #INCentaur Bounty#" },
			[33] = { str = "Finally turn in #INReturn to Vahlarriel#" },
			[34] = { str = "You should be within 2 bars to level 35 now. I grind down on the Centaurs at Gelkis Village at #COORD[37,80]# until level 35", x = 37, y = 80, zone = "Desolace" },
			[35] = { str = "Head south into Feralas to get the FP, this will again save more time later on." },
			[36] = { str = "Get on the Boat at #COORD[43,42]# and grab the FP in Feathermoon. Fly to Theramore, then to Rachet.", x = 43, y = 42, zone = "Desolace" },
			[37] = { str = "Go to the engineer hut at #COORD[62,36]# and hand in #INGoblin Sponsorship pt.1# accept #GETGoblin Sponsorship pt.2# Then run out on the dock and hand in #INWharfmaster Dizzywig# accept #GETParts for Kravel#", x = 62, y = 36, zone = "Desolace" },
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
			[2] = { str = "Hand in #INGoblin Sponsorship pt.2# as you get off the boat, accept #GETGoblin Sponsorship pt.3#" },
			[3] = { str = "Go in the Inn make BB your home, Accept #GETSinging Blue Shards#" },
			[4] = { str = "Accept #GETHostile Takeover# and #GETBloodscalp Ears#" },
			[5] = { str = "Accept #GETThe Haunted Isle# and turn it in just outside the door, accept #GETThe Stone of the Tides# Then turn in #INGoblin Sponsorship pt.3# accept #GETGoblin Sponsorship pt.4#" },
			[6] = { str = "Go into the shop Tan-Your-Hide Leatherworks and accept #GETSupply and Demand# (it’s down the ramp from the FP)" },
			[7] = { str = "Go around #COORD[48,21]# and Kill Shadowmaw Panthers for #DOPanther Mastery pt.3#", x = 48, y = 21, zone = "Stranglethorn Vale" },
			[8] = { str = "Run west to the Venture Co. Base Camp at #COORD[43,18]# and Kill the goblins here for #DOHostile Takeover# while you climb the Operations Tower behind the base for #DOGoblin Sponsorship pt.4# You’re going to climb it and kill Foreman Cozzle for his key.", x = 43, y = 18, zone = "Stranglethorn Vale" },
			[9] = { str = "If you still don’t have all the crystals kill the goblins until you do, then enter the tiny shack next to the base at #COORD[43,20]# and open the chest to get the blueprints for #DOGoblin Sponsorship pt.4#", x = 43, y = 20, zone = "Stranglethorn Vale" },
			[10] = { str = "Kill Lashtail Raptors around #COORD[37,22]# for #DORaptor Mastery pt.2#", x = 37, y = 22, zone = "Stranglethorn Vale" },
			[11] = { str = "Kill Elter Tigers around #COORD[33,18]# for #DOTiger Mastery pt.3#", x = 33, y = 18, zone = "Stranglethorn Vale" },
			[12] = { str = "Run towards Nessingways and kill the crocs in the river around it for #DOSupply and Demand#" },
			[13] = { str = "Go to Nessingways and turn in #INTiger Mastery pt.3#, #INPanther Mastery pt.3#, #INRaptor Mastery pt.2#, and #INHemet Nesingwary#, Accept #GETTiger Mastery pt.4# #GETPanther Mastery pt.4# and #GETRaptor Mastery pt.3#" },
			[14] = { str = "Run back south to the top of the hill at #COORD[32,17]# and kill Sin’Dall for #DOTiger Mastery pt.4# then turn it back in at Nessingways", x = 32, y = 17, zone = "Stranglethorn Vale" },
			[15] = { str = "Go up to the rebel camp at 37,3 and hand in #INSupplies to Private Thorsen#, If he’s not here look south of the camp, if you save him when he patrols you can also get #GETJungle Secrets# then u turn that in at the camp and get #GETBookie Herod#", x = 37, y = 3, zone = "Stranglethorn Vale" },
			[16] = { str = "Hand in #INReturn to Corporal Kaleb# get your helm" },
			[17] = { str = "Accept #GETSpecial Forces#" },
			[18] = { str = "Go to the Inn looking building at 43,9 touch the book on the 2nd floor and hand in #INBookie Herod# accept #GETThe Hidden Key#", x = 43, y = 9, zone = "Stranglethorn Vale" },
			[19] = { str = "Go in the cave at 45,7 and kill the mobs in here for #DOSpecial Forces# and make your way to the chest for #DOBookie Herod# , it’s down the first fork, only 1 level down then in the boxes. Accept #GETThe Spy Revealed!# (Easy from here)", x = 45, y = 7, zone = "Stranglethorn Vale" },
			[20] = { str = "Now grind back out since you should be close to level 36. Once your out go back to the rebel camp." },
			[21] = { str = "Hand in #INSpecial Forces# SKIP the next part" },
			[22] = { str = "Hand in #INThe Spy Revealed!# accept #GETPatrol Schedules# turn around and hand that in and accept #GETReport to Doren# then turn around again and hand that back in (told you it was easy)" },
			[23] = { str = "You should definitely be level 36 by now. We’ll get skills soon" },
			[24] = { str = "Go south toward the GY, then go west north of the river and kill basalisks for #DOSinging Blue Shards# if you don’t get them all now don’t worry there is more south." },
			[25] = { str = "Kill Bloodscalp at #COORD[29,19]# for #DOBloodscalp Ears# You’ll probably have to clear it 2-3 times. They’re easy", x = 29, y = 19, zone = "Stranglethorn Vale" },
			[26] = { str = "Kill Basalisks to finish #DOSinging Blue Shards# just west of here above the shore." },
			[27] = { str = "Run south on the Island till it says complete for #DOThe Stone of the Tides# Go back up and kill basalisks if needed." },
			[28] = { str = "Hearth to BB" },
			[29] = { str = "Turn in #INSinging Blue Shards# SKIP the next for now" },
			[30] = { str = "Go upstairs turn in #INInvestigate the Camp#, #INBloodscalp Ears#" },
			[31] = { str = "Go just outside, turn in #INThe Stone of the Tides# and #INGoblin Sponsorship pt.4# Accept #GETWater Elementals# and #GETGoblin Sponsorship pt.5#" },
			[32] = { str = "Go into the shop Tan-Your-Hide Leatherworks and turn in #INSupply and Demand# (it’s down the ramp from the FP) accept #GETSome assembly required#" },
			[33] = { str = "I’m half way to level 37 at this point" },
			[34] = { str = "Fly to IF get new skills then fly to Menethil Harbor, make it your home, and sail to Theramore" },
			[35] = { str = "If you’re first aid is at 225 go do #GETTriage# then fly to Gadgetzan" },
			[36] = { str = "Run out to Shimmering Flats at #COORD[77,77]# and turn in #INParts for Kravel# accept #GETDelivery to the Gnomes# then turn around and hand it in", x = 77, y = 77, zone = "Stranglethorn Vale" },
			[37] = { str = "Go a little East and hand in #INGoblin Sponsorship pt.5# accept #GETThe Eighteenth Pilot# then hand it in 2 feet away, accept #GETRazzeric's Tweaking#" },
			[38] = { str = "Grab #GETThe Rumormonger# at #COORD[77,77]# then Hearth to Menethil Harbor", x = 77, y = 77, zone = "Stranglethorn Vale" },
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
			[2] = { str = "Go to the Town Hall and turn in #INFurther Mysteries# accept #GETDark Council# and #GETNoble Deaths#" },
			[3] = { str = "Make Southshore your home" },
			[4] = { str = "Run into Alterac Mountains to #COORD[47,55]# and kill ogres for Crushridge Bounty", x = 47, y = 55, zone = "Alterac Mountains" },
			[5] = { str = "Grind up to Strahnbrad around #COORD[60,43]# and kill the syndicate and grab their rings for #DONoble Deaths# You can also kill shadow mages here for #DODark Council# which is easier than killing them in the camps later", x = 60, y = 43, zone = "Alterac Mountains" },
			[6] = { str = "Grind your way west to to the house at #COORD[39,16]# and kill #NPCNagaz# for #DODark Council#. I take out the first camp you come across then grind anything in my way west that’s not in a camp. ", x = 39, y = 16, zone = "Alterac Mountains" },
			[7] = { str = "You wanna be at least 2 bars from level 37, if so hearth to SS" },
			[8] = { str = "Run across from the Inn, turn in #INCrushridge Bounty# SKIP the next" },
			[9] = { str = "Go in the Inn, turn in #INDark Council# and #INNoble Deaths#" },
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
			[2] = { str = "Accept #GETWorth Its Weight In Gold#" },
			[3] = { str = "Run to #COORD[62,33]# touch the crystal and accept #GETThe Princess Trapped#", x = 62, y = 33, zone = "Arathi Highlands" },
			[4] = { str = "Go just east of Hammerfall to #COORD[80,40]#. (Load up on bloodstone ore here, you can sell it for a few g per 4 in BB) This is a tree, behind it is the path up to the cave to kill kobolds for #DOThe Princess Trapped# If you get them all before the end of the cave you have to continue to the end to hand it in by touching Iridescent Shards and accept #GETStones of Binding#", x = 80, y = 40, zone = "Arathi Highlands" },
			[5] = { str = "You should be just about ¼ through this level when you exit the cave." },
			[6] = { str = "Go to the circle of east binding, just west of Hammerfall at #COORD[80,36]# and grab the cresting key from the rock.", x = 80, y = 36, zone = "Arathi Highlands" },
			[7] = { str = "Stop at #COORD[60,53]# and hand in #INHints of a New Plague? Pt.1# accept #GETHints of a New Plague? Pt.2# If you see the courier kill him. Simply send your pet in get aggro, when he’s hurt some multi shot some off of him. He’s easy, just feign and let pet die once courier is dead. The courier walks between refuge and tarren mill.", x = 60, y = 53, zone = "Arathi Highlands" },
			[8] = { str = "Kill the trolls all around the lake at #COORD[67,69]# for #DOWorth Its Weight In Gold# you can get tusks and medicine bags off the guys here, to get the dagger you have to kill Shadow Hunters in the cave at #COORD[68,74]#", x = 68, y = 74, zone = "Arathi Highlands" },
			[9] = { str = "Go to the circle of outer binding at #COORD[52,50]# and grab the thundering key from the rock.", x = 52, y = 50, zone = "Arathi Highlands" },
			[10] = { str = "Go to refuge point and hand in #INWorth Its Weight In Gold# this opens up #GETWand Over Fist# from another NPC" },
			[11] = { str = "Go do #DOWand Over Fist# by killing #NPCColdrage# in the cave at #COORD[53,77]# (follow the left path) run back to Refuge hand it in, SKIP the rest", x = 53, y = 77, zone = "Arathi Highlands" },
			[12] = { str = "Go to the circle of west binding at #COORD[25,30]# and grab the burning key from the rock.", x = 25, y = 30, zone = "Arathi Highlands" },
			[13] = { str = "I found the courier at this point on the road (varies since he travels)" },
			[14] = { str = "Go to the circle of inner binding at #COORD[36,57]# and turn in #INStones of Binding# on the rock, SKIP the rest.", x = 36, y = 57, zone = "Arathi Highlands" },
			[15] = { str = "Run SW of here, there is a path that leads behind Stromgarde at #COORD[31,64]# follow it around to the cave path at #COORD[21,75]#", x = 31, y = 64, zone = "Arathi Highlands" },
			[16] = { str = "Swim over to the ship and accept #GETLand HO!# then turn around and hand it in." },
			[17] = { str = "Accept #GETDeep Sea Salvage#" },
			[18] = { str = "Go by the fire accept #GETDrowned Sorrows# and #GETSunken Treasure pt.1#" },
			[19] = { str = "Do #DOSunken Treasure pt.1# by escorting him right behind you in the cave. Turn it in, accept #GETSunken Treasure pt.2#" },
			[20] = { str = "Go down south near the sunken ships, around #COORD[24,84]# and do #DOSunken Treasure pt.2# (use goggles to find them easy), #DODrowned Sorrows# (nagas), and #DODeep Sea Salvage# (2 on each ship)", x = 24, y = 84, zone = "Arathi Highlands" },
			[21] = { str = "Turn in #INDeep Sea Salvage# on the dock" },
			[22] = { str = "Turn in #INDrowned Sorrows# next to the fire, then #INSunken Treasure pt.2# accept #GETSunken Treasure pt.3#" },
			[23] = { str = "Hand that in on the dock accept #GETSunken Treasure pt.4#" },
			[24] = { str = "Run back towards Go’Shek Farm, if you haven’t found the courier yet abandon quest and hearth to SS. If so go to #COORD[60,53]# and hand in #INHints of a New Plague? Pt.2# accept #GETHints of a New Plague? Pt.3# then turn it right back in accept #GETHints of a New Plague? Pt.4#", x = 60, y = 53, zone = "Arathi Highlands" },
			[25] = { str = "Escort her when done turn it back in and accept #GETHints of a New Plague? Pt.5# Grind until youre 3500 xp to level 38" },
			[26] = { str = "Hearth to Southshore" },
			[27] = { str = "Turn in #INHints of a New Plague? Pt.5# just outside the Inn" },
			[28] = { str = "Fly to Stormwind for new skills and get the quest #GETMorgan Stern# from Angus Stern at 41 89, then fly to Menethil and sail to Theramore", x = 41, y = 89, zone = "Stormwind" },
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
			[2] = { str = "Run up near the Inn, accept #GETThey Call Him Smiling Jim#" },
			[3] = { str = "Go in the Inn, accept #GETMudrock Soup and Bugs# and make Theramore your home. " },
			[4] = { str = "Go to the 2nd floor of the castle behind the Inn, not the tower, turn in #INThey Call Him Smiling Jim# This gives you hints about some quests at the old Inn near the Barrens." },
			[5] = { str = "Buy 3 soothing spices from the trade supplies person in the houst at #COORD[66,51]# (for upcoming quest) ", x = 66, y = 51, zone = "Dustwallow Marsh" },
			[6] = { str = "Just as you exit Theramore, go right and kill Mudrock turtles along the shore for #DOMudrock Soup and Bugs#" },
			[7] = { str = "Go to the house at #COORD[55,26]# and accept #GETSoothing Spices# then turn it right back in, accept #GETJarl Needs eyes#", x = 55, y = 26, zone = "Dustwallow Marsh" },
			[8] = { str = "Touch the mound of dirt beside the house, accept #GETThe Orc Report#" },
			[9] = { str = "Run over to Darkmist Cavern at #COORD[32,23]# and kill spiders inside and outside for #DOJarl Needs eyes# They drop 1-2 every kill", x = 32, y = 23, zone = "Dustwallow Marsh" },
			[10] = { str = "Stop at #COORD[35,38]# and grab #GETHungry!#", x = 35, y = 38, zone = "Dustwallow Marsh" },
			[11] = { str = "Go to #COORD[29,47]#, the shady rest inn, and grab these 3 quests, touch the hoofprints just out front #GETSuspicious Hoofprints# the badge on the board laying on the floorboards (it’s a tiny badge) #GETLieutenant Paval Reethe pt.1# and the shield over the fireplace #GETThe Black Shield pt.1# ", x = 29, y = 47, zone = "Dustwallow Marsh" },
			[12] = { str = "Run over to #COORD[54,56]# and open the shipping crate for #DORazzeric's Tweaking#", x = 54, y = 56, zone = "Dustwallow Marsh" },
			[13] = { str = "Hearth to Theramore" },
			[14] = { str = "Turn in #INMudrock Soup and Bugs# in front of you, accept #GET… and bugs#" },
			[15] = { str = "Go to the docks at the tower and turn in #INThe Orc Report# accept #GETCaptain Vimes# Run in the castle behind the Inn and turn it in" },
			[16] = { str = "Turn in #INLieutenant Paval Reethe pt.1# accept #GETLieutenant Paval Reethe pt.2#" },
			[17] = { str = " Turn in #INThe Black Shield pt.1# accept #GETThe Black Shield pt.2#" },
			[18] = { str = "Turn in #INSuspicious Hoofprints# accept the next quest " },
			[19] = { str = "Turn around and hand in #INLieutenant Paval Reethe pt.2# accept #GETDaelin's Men# then turn around hand it in accept #GETThe Deserters pt.1#" },
			[20] = { str = "Go to the blacksmith house, turn in #INThe Black Shield pt.2# accept #GETThe Black Shield pt.3# go turn it in back up in the castle" },
			[21] = { str = "Run out to #COORD[55,26]# and turn in #INJarl Needs eyes# SKIP the next", x = 55, y = 26, zone = "Dustwallow Marsh" },
			[22] = { str = "Go just NE of here and kill murlocs for #DOHungry!#" },
			[23] = { str = "Stop at #COORD[46,17]# and clear some raptors until you’re 50% or more into 39, then accept #GETStinky's Escape# just follow him, and kill what attacks him. Really easy.", x = 46, y = 17, zone = "Dustwallow Marsh" },
			[24] = { str = "Stop at #COORD[35,38]# turn in #INHungry!#", x = 35, y = 38, zone = "Dustwallow Marsh" },
			[25] = { str = "Go to the tower at #COORD[35,53]# and attack Balos Jacken, at ¼ life he’ll become friendly and then turn in #INThe Deserters pt.1# accept #GETThe Deserters pt.2#", x = 35, y = 53, zone = "Dustwallow Marsh" },
			[26] = { str = "Die so you end up near Theramore" },
			[27] = { str = "Turn in #INStinky's Escape# in the Inn " },
			[28] = { str = "Go up in the castle, turn in #INThe Deserters pt.2#" },
			[29] = { str = "Fly to Gadgetzan and run up to the Shimmering Flats to #COORD[80,76]# turn in #INRazzeric's Tweaking# accept #GETSafety First pt.1# turn it in in Gadget and accept #GETSafety First pt.2# then run back to the flats and hand it in", x = 80, y = 76, zone = "Dustwallow Marsh" },
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
			[2] = { str = "Run towards the Inn, accept #GETThe Bloodsail Buccaneers pt.1# halfway" },
			[3] = { str = "Go in the building next to the half boat upside down, accept #GETScaring Shaky#" },
			[4] = { str = "Go in the Inn, make it your home, accept #GETVenture Company Mining#" },
			[5] = { str = "Go upstairs, turn in #INThe Rumormonger# accept #GETDream Dust In the Swamp# and #GETSkullsplitter Tusks#" },
			[6] = { str = "Go just outside, hand in #INSunken Treasure pt.4# SKIP the next" },
			[7] = { str = "Go to around #COORD[33,39]# and kill raptors for #DORaptor Mastery pt.3#", x = 33, y = 39, zone = "Stranglethorn Vale" },
			[8] = { str = "Kill Snapjaw Crocolisks from the stream at #COORD[38,30]# to the lake at #COORD[41,19]# for #DOSome assembly required#", x = 38, y = 30, zone = "Stranglethorn Vale" },
			[9] = { str = "Go to the Island at #COORD[20,23]# and kill elementals for #DOWater Elementals# You should be close to level 39 by now, either grind on the elementals or raptors and basalisks around #COORD[33,39]#", x = 20, y = 23, zone = "Stranglethorn Vale" },
			[10] = { str = "Once you’re level 39, grind your way east to the road then to #COORD[41,41]# and kill the goblins for #DOVenture Company Mining#", x = 41, y = 41, zone = "Stranglethorn Vale" },
			[11] = { str = "Run up to the camps around #COORD[42,37]# and do #DOSkullsplitter Tusks#", x = 42, y = 37, zone = "Stranglethorn Vale" },
			[12] = { str = "Now you’re gonna have to find Bhag'thera for #DOPanther Mastery pt.4# she is anywhere between just north of Mosh’ogg at #COORD[49,25]# to just north of the ZG entrance at #COORD[48,17]# she’s elite. Easy way to do it is lay immolation trap and run her into it, once pet gets half health fear it and keep attacking it", x = 48, y = 25, zone = "Stranglethorn Vale" },
			[13] = { str = "Hearth back to BB" },
			[14] = { str = " Turn in #INVenture Company Mining#" },
			[15] = { str = "Go upstairs, turn in #INSkullsplitter Tusks#" },
			[16] = { str = "Walk outside, turn in #INWater Elementals# SKIP the next" },
			[17] = { str = "Go into the shop Tan-Your-Hide Leatherworks and turn in #INSome assembly required# accept #GETExcelsior#" },
			[18] = { str = "Go out of BB and turn left to the camp of pirates at #COORD[27,69]# and touch the letter on the barrel, turn in #INThe Bloodsail Buccaneers pt.1# accept #GETThe Bloodsail Buccaneers pt.2#", x = 27, y = 69, zone = "Stranglethorn Vale" },
			[19] = { str = "Go kill gorillas around #COORD[32,65]# just NE of BB for #DOScaring Shaky#", x = 32, y = 65, zone = "Stranglethorn Vale" },
			[20] = { str = "Run back to BB" },
			[21] = { str = "Turn right after the tunnel, turn in #INScaring Shaky# accept #GETReturn to MacKinley#" },
			[22] = { str = "Follow the lower dock towards the Inn, turn in #INThe Bloodsail Buccaneers pt.2# accept #GETThe Bloodsail Buccaneers pt.3#" },
			[23] = { str = "Go In the house across from the half ship, turn in #INReturn to MacKinley# accept #GETVoodoo Dues#" },
			[24] = { str = "Go up top the Inn, accept #GETUp To Snuff#" },
			[25] = { str = "Go just outside, turn in #INThe Bloodsail Buccaneers pt.3# accept #GETThe Bloodsail Buccaneers pt.4#" },
			[26] = { str = "You should have close to all the STV pages, if not buy the few that you need. You don’t need 1-27 they go in this order. 1,4,6,8,#COORD[10,11]#,#COORD[14,16]#,#COORD[18,20]#,#COORD[21,24]#,#COORD[25,26]#,27" },
			[27] = { str = "Go up near Grom’Gol, search the shore there for the 38 elite croc for #DOExcelsior# stay away from the base or the guards will get you" },
			[28] = { str = "Run up to Nessingways at #COORD[35,10]# and turn in #INRaptor Mastery pt.3# and #INPanther Mastery pt.4# accept #GETRaptor Mastery pt.4#", x = 35, y = 10, zone = "Stranglethorn Vale" },
			[29] = { str = "Accept #GETThe Green Hills of Stranglethorn# then turn it in" },
			[30] = { str = "You should be at lest 25% or less to level 40 now go grind on basalisks and raptors around #COORD[33,39]# until you’re 40.", x = 33, y = 39, zone = "Stranglethorn Vale" },
			[31] = { str = "Hearth to BB" },
			[32] = { str = "Go into the shop Tan-Your-Hide Leatherworks and turn in #INExcelsior#" },
			[33] = { str = "Now fly to IF and accept #GETIronband Wants You# from Prospector Stormpike at 74 11, and either to Darnassus to get your new skills and your mount, or get skills in IF and prepare for a few badlands quests by buying a frost oil and a gyrochronatom (don’t by a gyro if you can’t find a frost oil) Then a healing potion and lesser invisibility potion. Again don’t get either of the potions if you can’t get a frost oil or gyro.", x = 74, y = 11, zone = "Iron Forge" },
			[34] = { str = "Fly to Loch Modan, Stable your pet, and make Thelsamar your home" },
			[35] = { str = "Go in the house behind the Inn, accept #GETBadlands Reagent Run#" },
			[36] = { str = "Run to #COORD[65,65]# and accept #GETFind Agmond#", x = 65, y = 65, zone = "Loch Modan" },
			[37] = { str = "Run down into Badlands at #COORD[46,76]#", x = 46, y = 76, zone = "Loch Modan" },
		}
	},
}
