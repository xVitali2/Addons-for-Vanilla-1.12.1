--[[--------------------------------------------------
003_Horde_40to50.lua
Authors: mrmr, lanjelin
Version: 1.04.3
------------------------------------------------------
Description: Guide Serie - 003 From Lvl 40 to Lvl 50
    1.04.1
        -- First Release
            Horde's Guide
            from level 40 to lever 50
    1.04.2
    	-- no changes in here for this revision
    1.04.3
	    -- Cleanup in text, changed formatting of coords
			Removed unavailable quests, and some elite quests
			Playtested every step.
------------------------------------------------------
Connection:
--]]--------------------------------------------------
Table_003_Horde_40to50 = {
	[4041] = {
		title = "40-41 Badlands",
		--L- Playtested, need a small fix at 6
		items = {
			[1] = { str = "40-41 Badlands" },
			[2] = { str = "The goal here is not to leave till you're level 41, so grind mobs everywhere you go. As you enter Badlands, run southwest to #COORD[42,52]#.", x = 42, y = 52, zone = "Badlands" },
			[3] = { str = "Turn in #INMartek the Exiled# at #COORD[42,52]# , accept #GETIndurium# and #GETBarbecued Buzzard Wings# ", x = 42, y = 52, zone = "Badlands" },
			[4] = { str = "Go down south a little and do #DOIndurium# #COORD[51,67]#", x = 51, y = 67, zone = "Badlands" },
			[5] = { str = "Go back up and turn #INIndurium# in, accept #GETNews for Fizzle#." },
			[6] = { str = "Then go north-west and accept #GETStudy of the Elements: Rock# at #COORD[25,44]#. NOTE: If you have the #ITEM[Frost Oil]#, the #ITEM[Gyrochronatom]#, the #ITEM[Healing Potion]#, the #ITEM[Lesser Invisibility Potion]# and the #ITEM[Patterned Bronze Bracers]# items, accept and complete all the quests there.", x = 25, y = 44, zone = "Badlands" },
		--L- Needs to be split
			[7] = { str = "Grind your way west to Kargath #COORD[04,46]#.", x = 4, y = 46, zone = "Badlands" },
			[8] = { str = "Get flightpath at Kargath. Do NOT make Kargath your home, it should still be Booty Bay." },
			[9] = { str = "Accept #GETCoyote Thieves#, #GETReport to Helgrum#, #GETBroken Alliances# and #GETBadlands Reagent Run#." },
			[10] = { str = "Go do #DOCoyote Thieves# and #DOBarbecued Buzzard Wings# around #COORD[14,60]#", x = 14, y = 60, zone = "Badlands" },
			[11] = { str = "Do #DOBroken Alliances#, #NPC Tho'grun# patrols the area counter-clockwise. (skip the next part of this quest)." },
			[12] = { str = "Do #DOBadlands Reagent Run#." },
			[13] = { str = "Do #DOStudy of the Elements: Rock#, kill #NPCLesser Rock Elemental# at #COORD[19,43]#. Turn in, accept next.", x = 19, y = 43, zone = "Badlands" },
			[14] = { str = "Do #DOStudy of the Elements: Rock#, kill #NPCRock Elemental# at #COORD[13,35]#. Turn in, accept next.", x = 13, y = 35, zone = "Badlands" },
			[15] = { str = "Do #DOStudy of the Elements: Rock#, kill #NPCGreater Rock Elemental# at #COORD[8,84]#.", x = 8, y = 84, zone = "Badlands" },
			[16] = { str = "Then make sure all Badlands quests besides #GETReport to Helgrum# are done and turned in." },
			[17] = { str = "You should be about level 41 right now, if not grind to it." },
			[18] = { str = "Hearth to BB and check if you have #DODream Dust in the Swamp# in your questlog. If not, go accept it from #NPCKrazek# at #COORD[27,77]#", x = 27, y = 77, zone = "Stranglethorn Vale" },
			[19] = { str = "Fly to Grom'gol." },
			[20] = { str = "Go turn in all the #NPCThe Green Hills of Stranglethorn Chapters/Quests# at Nesingwary's Expedition #COORD[35,10]# if you have all the pages for it, if not you have another chance to turn this in again later. You can also look in the AH for your missing pages.", x = 35, y = 10, zone = "Badlands" },
			[21] = { str = "Then run all the way to Swamp of Sorrows, stopping along the way to accept #GETNothing But the Truth# in Duskwood at #COORD[87,35]#", x = 87, y = 35, zone = "Duskwood" },
			[22] = { str = "Turn in #INNothing But the Truth# at the guy next to the questiver. Get #GETNothing But the Truth pt.2#, then run to Swamp of Sorrows." },
		}
	},
	[4142] = {
		title = "41-42 Swamp of Sorrows",
		--L- Playtested, needs adjust, some of the quests at 13-16 can be grouped.
		items = {
			[1] = { str = "41-42 Swamp of Sorrows" },
			[2] = { str = "Start off by doing #DODream Dust in the Swamp# #COORD[14,59]#.", x = 14, y = 59, zone = "Swamp of Sorrows" },
			[3] = { str = "#DONothing But the Truth# kill the #NPCMire Lord# for the #ITEM[Mire Lord Fungus]# at #COORD[06,32]#", x = 6, y = 32, zone = "Swamp of Sorrows" },
			[4] = { str = "Find and kill #NPCCudgel#, he drops #ITEM[Noboru's Cudgel]#, which starts #GETNoboru the Cudgel#. Spawns at #COORD[48,38]#, but roams the area.", x = 48, y = 38, zone = "Swamp of Sorrows" },
			[5] = { str = "Go turn in #INNoboru the Cudgel# #COORD[25,31]#, accept #GETDraenethyst Crystals# ", x = 25, y = 31, zone = "Swamp of Sorrows" },
			[6] = { str = "Grind your way to Stonard #COORD[45,54]#, make it your home, and pick up the flightpath", x = 45, y = 54, zone = "Swamp of Sorrows" },
			[7] = { str = "Accept #GETLack of Surplus# and #GETFresh Meat#, turn in #INReport to Helgrum#, accept #GETPool of Tears# (Elite)." },
			[8] = { str = "Do #DOPool of Tears#, #ITEM[Atal'ai Artifact]# is looted in the water around temple of Atal'hakkar (Sunken Temple)." },
			[9] = { str = "Do #DOLack of Surplus# then turn it in at #COORD[81,80]#, accept #GETLack of Surplus pt.2# and go do it.", x = 81, y = 80, zone = "Swamp of Sorrows" },
			[10] = { str = "Go do #DOFresh Meat# and #DONothing But the Truth#, #NPCShadow Panthers#' hearts." },
			[11] = { str = "Do #DODraenethyst Crystals#, then turn it in at #COORD[25,31]#", x = 25, y = 31, zone = "Swamp of Sorrows" },
			[12] = { str = "Do #DOOngeku#." },
			[13] = { str = "Turn in #INLack of Surplus pt.2#, accept #GETThreat From the Sea#" },
			[14] = { str = "Turn in #INThreat From the Sea# then accept #GETThreat From the Sea pt.2#." },
			[15] = { str = "Go do #DOThreat From the Sea pt.2# along with #DOFresh Meat#." },
			[16] = { str = "Turn in #INThreat From the Sea pt.2#, accept #GETContinued Threat#." },
			[17] = { str = "Go do #DOContinued Threat# then turn it in." },
			[18] = { str = "Hearth to Stonard." },
			[19] = { str = "Turn in #INFresh Meat# and #INPool of Tears#, accept #GETThe Atal'ai Exile# " },
			[20] = { str = "Should be about lvl 42 now, if not grind to it." },
			[21] = { str = "Fly to Grom'gol." },
		}
	},
	[4243] = {
		title = "42-43 Stranglethorn Vale",
		--L- Playtested
		items = {
			[1] = { str = "42-43 Stranglethorn Vale" },
			[2] = { str = "Accept #GETMok'thardin's Enchantment pt.4# and #GETSplit Bone Necklace#." },
			[3] = { str = "Fly to Booty Bay, and accept all quests, #GETThe Bloodsail Buccaneers#, #GETUp to Snuff#, #GETFool's Stout#, #GETAkiris by the Bundle#, #GETVoodoo Dues#, #GETStoley's Debt#, #GETStranglethorn Fever# and #GETKeep An Eye Out#" },
			[4] = { str = "Turn in #INDream Dust in the Swamp#, make Booty Bay your home." },
			[5] = { str = "Do #DOThe Bloodsail Buccaneers# along with #DOUp to Snuff# and #DOKeep An Eye Out# These are done at the shore around #COORD[31,80]#, and some more mobs can be found at #COORD[27,70]#.", x = 31, y = 80, zone = "Stranglethorn Vale" },
			[6] = { str = "Also do #DOStranglethorn Fever#, you will need 10x #ITEM[Gorilla Fang]#, and the #NPCWitch Doctor# is in the cave at #COORD[34,60]#", x = 34, y = 60, zone = "Stranglethorn Vale" },
			[7] = { str = "Do #DOMok'thardin's Enchantment pt.4# along with #DOAkiris by the Bundle# #COORD[25,63]#", x = 25, y = 63, zone = "Stranglethorn Vale" },
			[8] = { str = "Do #DOFool's Stout# along with #DOVoodoo Dues# #COORD[34,52]# and #COORD[39,58]#", x = 34, y = 52, zone = "Stranglethorn Vale" },
			[9] = { str = "Do #DOSkullsplitter Tusks# along with #DOSplit Bone Necklace# at #COORD[46,42]#. Skip #DOSplit Bone Necklace# if you get to 43 before getting all.", x = 46, y = 42, zone = "Stranglethorn Vale" },
			[10] = { str = "If not at least 2-3 bars away from 43, keep grinding til you are, then hearth to Booty Bay." },
			[11] = { str = "Turn in ALL quests and make sure to accept #GETTran'Rek# and #GETRumors for Kravel# from #NPCKrazek#, and #GETWhiskey Slim's Lost Grog# from #NPCWhiskey Slim#." },
			[12] = { str = "Fly to Grom'gol and turn in #INMok'thardin's Enchantment pt.4# and #INSplit Bone Necklace#. Accept #GETGrim Message#." },
			[13] = { str = "Get on the zeppelin to Orgrimmar" },
			[14] = { str = "Once there go to #NPCBelgrom Rockmaul# at #COORD[75,34]# and accept #GETA Threath in Feralas#", x = 75, y = 34, zone = "Orgrimmar" },
			[15] = { str = "Fly to Thunder Bluff, get #ITEM[Frostmaw's Mane]# from the bank if you put it there, then turn in #INFrostmaw#, accept #GETDeadmire# at #COORD[61,81]#.", x = 61, y = 81, zone = "Thunder Bluff" },
			[16] = { str = "Fly to Desolace." },
		}
	},
	[4342] = {
		title = "43-43 Desolace",
		--L- Playtested and corrected
		items = {
			[1] = { str = "43-43 Desolace" },
			[2] = { str = "Make Shadowprey Village your home." },
			[3] = { str = "Accept #GETPortals of the Legion# at #COORD[26,68]#", x = 26, y = 68, zone = "Desolace" },
			[4] = { str = "Go turn in #INOngeku# at #COORD[36,79]#, SKIP #SKIPKhan Jehn# ", x = 36, y = 79, zone = "Desolace" },
			[5] = { str = "Go to Mannoroc Coven at #COORD[50,76]# and do #DOPortals of the Legion# ", x = 50, y = 76, zone = "Desolace" },
			[6] = { str = "Then hearth or run back to Shadowprey Village" },
			[7] = { str = "Turn in #INPortals of the Legion# at #COORD[26,68]#", x = 26, y = 68, zone = "Desolace"},
			[8] = { str = "Fly to Dustwallow Marsh." },
		}
	},
	[4343] = {
		title = "43-43 Dustwallow Marsh",
		--L- Playtested and corrected
		items = {
			[1] = { str = "43-43 Dustwallow Marsh" },
			--[2] = { str = "Accept #GETIdentifying the Brood# " },
			[2] = { str = "Go down to #COORD[40,36]# and accept #DOQuestioning Reethe# then do it.", x = 40, y = 36, zone = "Dustwallow Marsh" },
			[3] = { str = "Go down and do #DODeadmire# around #COORD[47,55]#", x = 47, y = 55, zone = "Dustwallow Marsh" },
			[4] = { str = "Do #DOMarg Speaks#, kill the mobs at around #COORD[58,63]#", x = 58, y = 63, zone = "Dustwallow Marsh" },
			--[6] = { str = "Do #DOIdentifying the Brood# at #COORD[46,68]#.", x = 46, y = 68, zone = "Dustwallow Marsh" },
			[5] = { str = "Then grind your way back to Brackenwall Village." },
			--[8] = { str = "Turn in #INQuestioning Reethe# and #INIdentifying the Brood#, accept #GETThe Brood of Onyxia# " },
			--[9] = { str = "Run back and forth completing #DOThe Brood of Onyxia# and #DOThe Brood of Onyxia pt.2#. Skip #SKIPThe Brood of Onyxia pt.3#" },
			[6] = { str = "Turn in #INMarg Speaks#, accept #GETReport to Zor#." },
			[7] = { str = "Fly to Tanaris." },
		}
	},
	[4344] = {
		title = "43-44 Tanaris",
		--L- Playtested and corrected
		items = {
			[1] = { str = "43-44 Tanaris" },
			[2] = { str = "Go into Gadgetzan, make it your home." },
			[3] = { str = "Accept: #GETWANTED: Caliph Scorpidsting# and #GETWANTED: Andre Firebeard# from the #ITEMWanted! Poster#." },
			[4] = { str = "Turn in #INTran'Rek#, accept #GETGadgetzan Water Survey#, #GETWastewander Justice# and #GETWater Pouch Bounty#." },
			[5] = { str = "Go to the Shimmering Flats in Thousand Needles, at #COORD[78,77]# and turn in #INRumors for Kravel#, #INNews for Fizzle# and #INRazzeric's Tweaking#, accept #GETSafety First#.", x = 53, y = 76, zone = "Tanaris" },
			[6] = { str = "Accept #GETKeeping Pace#, Turn #INKeeping Pace# in at #NPCZamek#, then go pick up #ITEM[Rizzle's Plans]# at #COORD[77,77]#, accept #GETRizzle's Schematics#." },
			[7] = { str = "Accept #GETBack to Booty Bay# at #NPCKravel Koalbeard#, turn in #INRizzle's Schematics# at #NPCPozzik#." },
			[8] = { str = "Hearth back to Gadgetzan." },
			[9] = { str = "Turn in #INSafety First#. #SKIPSKIP the next part to this quest#." },
			[10] = { str = "Then grind your way east to Steamwheedle Port at #COORD[67,23]#", x = 67, y = 23, zone = "Tanaris" },
			[11] = { str = "Accept #GETPirate Hats Ahoy!# and #GETScreecher Spirits#, turn in #INStoley's Debt# and accept #GETStoley's Shipment#" },
			[12] = { str = "Do #DOWastewander Justice# along with #DOWater Pouch Bounty# at #COORD[64,29]# or #COORD[60,23]#", x = 64, y = 29, zone = "Tanaris" },
			[13] = { str = "Then do the following at Lost Rigger Cove #COORD[72,47]#; #DOPirate Hats Ahoy!#, #DOStoley's Shipment# and #DOWANTED: Andre Firebeard# ", x = 72, y = 47, zone = "Tanaris" },
			[14] = { str = "#DOShip Schedules# (find this in one of the #ITEMPirate's footlocker#, looted from mobs at Lost Rigger Cove. If the item cannot be found, just skip it)" },
			[15] = { str = "Once they're all done, hearth to Gadgetzan." },
			[16] = { str = "Turn in #INWater Pouch Bounty#, #INWastewander Justice#, accept #GETMore Wastewander Justice#. Save leftover #ITEM[Wastewander Water Puch]#." },
			[17] = { str = "Go do #DOGadgetzan Water Survey# at #COORD[38,29]#, grinding mobs along the way. Then go back and turn it in.", x = 38, y = 29, zone = "Tanaris" },
			[18] = { str = "Go to Steamwheedle Port. #COORD[67,23]#", x = 67, y = 23, zone = "Tanaris" },
			[19] = { str = "Turn in ALL quests there, accept #GETDeliver to MacKinley#." },
			[20] = { str = "Then do #DOMore Wastewander Justice# along with #DOWANTED: Caliph Scorpidsting# at #COORD[59,37]#.", x = 59, y = 37, zone = "Tanaris" },
			[21] = { str = "Hearth to Gadgetzan. Put all the #ITEM[Wastewander Water Pouches]# you have in the bank, as you will need them for a later quest." },
			[22] = { str = "Turn in #INMore Wastewander Justice# and #INWANTED: Caliph Scorpidsting#." },
			[23] = { str = "Fly to Freewind Post." },
			[24] = { str = "Run west into Feralas, #COORD[08,11]#", x = 8, y = 11, zone = "Thousand Needles" },
		}
	},
	[4446] = {
		title = "44-46 Feralas",
		--L- Playtested and corrected, needs a check @ 27
		items = {
			[1] = { str = "44-46 Feralas" },
			[2] = { str = "Run to Camp Mojache. #COORD[75,44]#", x = 75, y = 44, zone = "Feralas" },
			[3] = { str = "Turn in #INA Threat in Feralas#" },
			[4] = { str = "Accept ALL quests there: #GETA New Cloak's Sheen#, #GETThe Ogres of Feralas#, #GETGordunni Cobalt#, #GETWar on the Woodpaw#, #GETThe Mark of Quality# and #GETA Strange Request#. Skip #SKIPNatural Materials# for now." },
			[5] = { str = "Get flightpath, and make Camp Mojache your home." },
			[6] = { str = "Then do #DOWar on the Woodpaw# just north of Camp Mojache, #COORD[72,39]#", x = 72, y = 39, zone = "Feralas" },
			[7] = { str = "Do #DOThe Ogres of Feralas# along with #DOGordunni Cobalt# #COORD[75,31]#. Make sure to click one of the scrolls laying on the ground to start #GETThe Gordunni Scroll#.", x = 75, y = 31, zone = "Feralas" },
			[8] = { str = "Then do #DOA New Cloak's Sheen# #COORD[67,48]#", x = 67, y = 48, zone = "Feralas" },
			[9] = { str = "Go back to Camp Mojache, turn in ALL quests, accept all new quests: #GETDark Ceremony#, #GETThe Ogres of Feralas#, #GETA Grim Discovery# and #GETAlpha Strike#" },
			[10] = { str = "Go do #DOAlpha Strike# at #COORD[72,56]# then turn it in. Accept #GETWoodpaw Investigation#.", x = 72, y = 56, zone = "Feralas" },
			[11] = { str = "Go turn in #INWoodpaw Investigation# at #COORD[72,56]#, click the #ITEM[Woodpaw Battle Plans]# lying on top of a box, accept #GETThe Battle Plans# ", x = 72, y = 56, zone = "Feralas" },
			[12] = { str = "Then go do #DOA Grim Discovery# #COORD[67,46]#", x = 67, y = 46, zone = "Feralas" },
			[13] = { str = "Hearth back to Camp Mojache, turn in #INThe Battle Plans# and #INA Grim Discovery#, accept alle new quests: #GETStinglasher#, #GETZukk'ash Infestation# and #GETA Grim Discovery#." },
			[14] = { str = "If #ITEM[OOX-22/FE Distress Beacon]# drops, accept the quest #GETFind OOX-22/FE!# . Turn in #INFind OOX-22/FE!# at #COORD[53,55]#.", x = 53, y = 55, zone = "Feralas" },
			[15] = { str = "Then go do the following: #DOStinglasher# along with #DOZukk'ash Infestation# #COORD[77,62]#", x = 77, y = 62, zone = "Feralas" },
			[16] = { str = "#DOScreecher Spirits# #COORD[55,56]#", x = 55, y = 56, zone = "Feralas" },
			[17] = { str = "#DOThe Mark of Quality# #COORD[53,55]#", x = 53, y = 55, zone = "Feralas" },
			[18] = { str = "#DOThe Ogres of Feralas# part2 #COORD[59,68]#", x = 59, y = 68, zone = "Feralas" },
			[19] = { str = "#DODark Ceremony# #COORD[59,68]#, kill Gordunni Mage-Lord", x = 59, y = 68, zone = "Feralas" },
			[20] = { str = "Make sure you pick up an #ITEM[Hippogryph Egg]# down south-west around #COORD[59,76]# (looted from a nest), this will be turned in at Tanaris for a later quest.", x = 53, y = 76, zone = "Feralas" },
			[21] = { str = "Run back to Camp Mojache, then go turn those quests in. Accept #GETThe Gordunni Orb#" },
			[22] = { str = "Fly to Orgrimmar." },
			[23] = { str = "Accept #GETRipple Recovery# from #NPCDran Droffers# at #COORD[59,36]#", x = 59, y = 36, zone = "Orgrimmar" },
			[24] = { str = "Then turn in #INRipple Recovery# at the guy right next to #NPCDran#, accept #GETRipple Recovery# again." },
			[25] = { str = "Turn in #INParts of the Swarm# and #INA Grim Discovery# at #NPCBelgrom Rockmaul#, accept #GETBetrayed# #COORD[75,34]#.", x = 75, y = 34, zone = "Orgrimmar" },
			[26] = { str = "Go turn in #INA Strange Request#, accept #GETRetrun to Witch Doctor Uzer'i# in Cleft of Shadow, #COORD[49,50]#", x = 49, y = 50, zone = "Orgrimmar" },
			[27] = { str = "Go turn in #GETReport to Zor#, accept/complete #DOService to the Horde# in Valley of Wisdom, #COORD[38,38]#.", x = 38, y = 38, zone = "Orgrimmar" },
		--L- Needs to be checked
			[28] = { str = "Go turn in #INThe Gordunni Orb# in Valley of Spirits, #COORD[39,86]#", x = 39, y = 86, zone = "Orgrimmar" },
			[29] = { str = "Also get new spells/abilities while you are in Orgrimmar.", x = 37, y = 87, zone = "Orgrimmar" },
			[30] = { str = "You should have 90+ gold by now, so go buy your mount!" },
			[31] = { str = "Hearth back to Feralas." },
			[32] = { str = "Turn in #INRetrun to Witch Doctor Uzer#, accept #GETNatural Materials# and #GETTesting the Vessel# " },
			[33] = { str = "Then do #DONatural Materials#. Kill #NPCSprite Darters# at #COORD[68,48]# for #ITEM[Encrusted Minerals]#.", x = 68, y = 48, zone = "Feralas" },
			[34] = { str = "Kill #NPCWandering Forest Walker# (Elite) at #COORD[57,73]# for #ITEM[Splintered Log]#. You'll have to wait for respawn, so meanwhile do next step.", x = 57, y = 73, zone = "Feralas" },
			[35] = { str = "Kill #NPCHippogryphs# at #COORD[56,62]# and south for #ITEM[Resillent Sinew]# and #ITEM[Metallic Fragments]#.", x = 56, y = 62, zone = "Feralas" },
			[36] = { str = "If you're not level 46, keep grinding Hippogryphs till you are." },
			[37] = { str = "If #ITEM[OOX-22/FE Distress Beacon]# drops, accept the quest #GETFind OOX-22/FE!# . Turn in #INFind OOX-22/FE!# at #COORD[53,55]#.", x = 53, y = 55, zone = "Feralas" },
			[38] = { str = "Hearth or run back to Camp Mojache." },
			[39] = { str = "Turn in #INNatural Materials#, accept #GETThe Sunken Temple#." },
			[40] = { str = "Fly to Thunder Bluff" },
			[41] = { str = "Turn in #INDeadmire# at #COORD[61,81]#.", x = 61, y = 81, zone = "Thunder Bluff" },
			[42] = { str = "Fly to Splintertree Post (Ashenvale)" },
			[43] = { str = "Then go east into Azshara, there is a bridge just east of #COORD[92,46]#", x = 92, y = 46, zone = "Ashenvale" },
		}
	},
	[4646] = {
		title = "46-46 Azshara",
		--L- Playtested and corrected
		items = {
			[1] = { str = "46-46 Azshara" },
			[2] = { str = "Go accept #DOSpiritual Unrest# and #DOA Land Filled with Hatred# at #COORD[11,78]#", x = 11, y = 78, zone = "Azshara" },
			[3] = { str = "Go do them at #COORD[17,71]# and #COORD[20,62]#, then run back and turn them in.", x = 17, y = 71, zone = "Azshara" },
			[4] = { str = "Go to Valormok at #COORD[22,52]#", x = 22, y = 52, zone = "Azshara" },
			[5] = { str = "Turn in #INBetrayed#, #SKIPskip the next part to this quest#." },
			[6] = { str = "Get the FP there and fly to Orgrimmar." },
			[7] = { str = "Take the Zeppelin to Undercity." },
			[8] = { str = "Go to the Magic Quarter and accept #GETLines of Communication# at #COORD[73,32]#", x = 73, y = 32, zone = "Undercity" },
			[9] = { str = "Head to Apothecarium and accept #GETSeeping Corruption# and #GETErrand for Apothecary Zinge#, downstairs #COORD[49,70]#", x = 49, y = 70, zone = "Undercity" },
			[10] = { str = "Go turn in #GETErrand for Apothecary Zinge# at #COORD[58,55]#", x = 58, y = 55, zone = "Undercity" },
			[11] = { str = "Then back to the apothecary, turning in #INErrand for Apothecary Zinge#, accept #GETInto the Field#", x = 49, y = 70, zone = "Undercity" },
			[12] = { str = "You can put the #ITEM[Field Testing Kit]# and the #ITEM[Box of Empty Vials]# in the Bank for now."},
			[13] = { str = "Fly to Tarren Mill and make it your home."},
			[14] = { str = "Head to the Hinterlands. There is a passage at around #COORD[85,32]#", x = 85, y = 32, zone = "Hillsbrad Foothills" },
		}
	},
	[4647] = {
		title = "46-47 Hinterlands",
		--L- Playtested and corrected
		items = {
			[1] = { str = "46-47 Hinterlands" },
			[2] = { str = "Go turn in #INRipple Recovery# at #COORD[27,49]#, accept #GETA Sticky Situation# ", x = 27, y = 49, zone = "The Hinterlands" },
			[3] = { str = "Ride all the way to Revantusk Village at #COORD[77,80]#, get the flightpath there, at the docks.", x = 77, y = 80, zone = "The Hinterlands" },
			[4] = { str = "Accept #GETVilebranch Hooligans#, #GETCannibalistic Cousins#, #GETMessage to the Wildhammer#, #GETStalking the Stalkers#, #GETHunt the Savages# and #GETAvenging the Fallen# " },
			[5] = { str = "Then go do #DOWhiskey Slim's Lost Grog#, #DOVilebranch Hooligans#, #DOCannibalistic Cousins# #DOStalking the Stalkers#, #DOHunt the Savages#, #DOTesting the Vessel#, #DOAvenging the Fallen#, #DOLines of Communication#, #DOMessage to the Wildhammer# and #DOA Sticky Situation# - turn it in when you're in the area." },
			[6] = { str = "Do #DORin'ji is Trapped!#, escort quest that starts at #COORD[31,48]#", x = 31, y = 48, zone = "The Hinterlands" },
			[7] = { str = "Do #DOGrim Message#, be sure to accept #GETVenom Bottles# from one of those little bottles on the table. Place #ITEM[Nimboya's Laden Pike]# at #COORD[32,58]#", x = 32, y = 58, zone = "The Hinterlands" },
			[8] = { str = "If #ITEMOOX-09/HL Distress Beacon# drops, accept the quest #GETFind OOX-09/HL!#. Turn it in at #COORD[49,38]#", x = 49, y = 38, zone = "The Hinterlands" },
			[9] = { str = "Turn in #INRin'ji is Trapped!# at #COORD[86,59]#, accept #GETRin'ji's Secret# ", x = 86, y = 59, zone = "The Hinterlands" },
			[10] = { str = "Go to Revantusk Village, and turn in ALL the quests." },
			[11] = { str = "Then get to the flightpath, and fly to Tarren Mill." },
			[12] = { str = "Turn in #INVenom Bottles#, accept #GETUndamaged Venom Sac# " },
			[13] = { str = "Then ride back into Hinterlands, don’t fly!" },
			[14] = { str = "Go do #DOUndamaged Venom Sac#, turn in #INThe Atal'ai Exile#, accept #GETReturn to Fel'Zerul#" },
			[15] = { str = "When done, hearth to Tarren Mill." },
			[16] = { str = "Turn in #INUndamaged Venom Sac#, SKIP #SKIPConsult Master Gadrin# Only accept this quest if you still need to get a mount as orc/troll, as you turn it in in the same spot." },
			[17] = { str = "Fly to Undercity." },
			[18] = { str = "Turn in #INLines of Communication# and #INRin'ji's Secret#. " },
			[19] = { str = "Get 15x #ITEM[Silk Cloth]# from the bank/AH for a later quest." },
			[20] = { str = "Get on the zeppelin to Grom'gol." },
		}
	},
	[4747] = {
		title = "47-47 Stranglethorn Vale",
		--L- Playtested and corrected
		items = {
			[1] = { str = "47-47 Stranglethorn Vale" },
			[2] = { str = "Turn in #INGrim Message#."},
			[3] = { str = "Go do #DORaptor Mastery#, kill #NPCTethis# at #COORD[28,44]#, and go turn it in", x = 28, y = 44, zone = "Stranglethorn Vale" },
			[4] = { str = "Accept #GETBig Game Hunter# (Elite), go do it, then turn it in." },
			[5] = { str = "Go to Grom'gol then fly to Booty Bay." },
			[6] = { str = "Accept #GETThe Bloodsail Buccaneers pt.5#, turn in #INWhiskey Slim's Lost Grog#." },
			[7] = { str = "Make Booty Bay your home." },
			[8] = { str = "Turn in #INBack to Booty Bay# and #INDeliver to MacKinley# " },
			[9] = { str = "Find #ITEM[Half-Buried Bottle]# laying around the shore east of Booty Bay #COORD[33,76]#, until #ITEM[Carefully Folded Note]# drop, which starts #GETMessage in a Bottle# ", x = 33, y = 76, zone = "Stranglethorn Vale" },
			[10] = { str = "Go turn #INMessage in a Bottle# in at #COORD[38,80]# #SKIPSKIP the next part#, its a 51 elite.", x = 38, y = 80, zone = "Stranglethorn Vale" },
			[11] = { str = "Then go do #DOThe Bloodsail Buccaneers pt.5#, kill the three pirates in the three ships, while doing it, find #GETCortello's Riddle#, it's usually a little scroll downstairs in the middle ship." },
			[12] = { str = "Then hearth back to Booty Bay, if hearth stone still is on a cooldown, die on purpose." },
			[13] = { str = "Turn in #INThe Bloodsail Buccaneers pt.5#" },
			[14] = { str = "Fly to Kargath (Badlands)." },
			[15] = { str = "Go into Searing Gorge through the passage at #COORD[03,62].", x = 3, y = 62, zone = "Badlands" },
		}
	},
	[4748] = {
		title = "47-48 Searing Gorge",
		--L- Playtested and massively corrected
		items = {
			[1] = { str = "47-48 Searing Gorge" },
			[2] = { str = "Go south-east and do #DOCaught!#, guy in the outhouse #COORD[65,62]#, then turn it in. Accept #GETLedger from Tanaris#, pick up #ITEM[Goodsteel Ledger]# just beside the outhouse.", x = 65, y = 62, zone = "Searing Gorge" },
			[3] = { str = "Kill #NPCGlassweb Spiders# for the #DOLedger from Tanaris# quest." },
			[4] = { str = "Talk to #NPCKalaran Windblade# at #COORD[39,38]# on your way to Thorium Point #COORD[35,25]#. Listen to him to do #DODivine Retribution#, complete it and get #GETThe Flawless Flame#.", x = 35, y = 25, zone = "Searing Gorge" },
			[5] = { str = "Go to Thorium Point, get the flightpath, and accept #GETWhat the Flux?#.", x = 35, y = 25, zone = "Searing Gorge" },
			[6] = { str = "Do #DOWhat the Flux?# -the plans are right behind #NPCOverseer Maltorius#, and #DOThe Flawless Flame# by killing #NPCHeavy War Golem# and #NPCBlazing/Magma Elemental#." },
			[7] = { str = "Turn in #INThe Flawless Flame# and accept #GETForging the Shaft#, go turn in #INWhat the Flux?#, and accept #GETJOB OPPORTUNITY: Culling the Competition# from the #ITEMSign#." },
			[8] = { str = "Go do #DOForging the Shaft# and #DOJOB OPPORTUNITY: Culling the Competition#." },
			[9] = { str = "If #ITEM[Grimeslit Outhouse Key]# drops, accept the quest, and go turn it in at the outhouse at #COORD[65,62]#. If you're far from 48, you could grind a while for it.", x = 65, y = 62, zone = "Searing Gorge" },
			[10] = { str = "Turn in #INForging the Shaft#, SKIP #SKIPThe Flame's Casing#, turn in #INJOB OPPORTUNITY: Culling the Competition#." },
			[11] = { str = "Make sure you have all 20 #ITEM[Solid Crystal Leg Shaft]#, then head south into Burning Steppes, via Black Rock Mountains #COORD[34,77]#.", x = 34, y = 77, zone = "Searing Gorge" },
			[12] = { str = "Get flightpath there at #COORD[65,25]#, and fly directly to Stonard (Swamp of Sorrows).", x = 65, y = 25, zone = "Burning Steppes" },
		}
	},
	[4848] = {
		title = "48-48 Swamp of Sorrows",
		--L- Playtested and corrected
		items = {
			[1] = { str = "48-48 Swamp of Sorrows" },
			[2] = { str = "Do NOT make Stonard your home, it should still be Booty Bay." },
			[3] = { str = "Go to the #NPCFallen Hero of the Horde# #COORD[34,66]#, keep talking to him till you get the quest #GETThe Disgraced One# ", x = 34, y = 66, zone = "Swamp of Sorrows" },
			[4] = { str = "Then go do #DOCortello's Riddle# at #COORD[22,48]#, under the bridge click #ITEM[A Soggy Scroll]#. Accept #GETCortello's Riddle pt.2#", x = 22, y = 48, zone = "Swamp of Sorrows" },
			[5] = { str = "Go back to Stonard and turn in #INThe Disgraced One# and #INReturn to Fel'Zerul#. Accept #GETThe Missing Orders#" },
			[6] = { str = "Go turn in #INThe Missing Orders# in the inn, accept #GETThe Swamp Talker# " },
			[7] = { str = "Go do #DOThe Swamp Talker# in the cave at #COORD[65,78]#", x = 65, y = 78, zone = "Swamp of Sorrows" },
			[8] = { str = "Then head north east and kill the mob #NPCJarquia# at around #COORD[94,50]# or #COORD[92,65]#, he drops #ITEMGoodsteel's Balanced Flameberge# for the quest #DOLedger from Tanaris# ", x = 94, y = 50, zone = "Swamp of Sorrows" },
			[9] = { str = "Go to the #NPCFallen Hero of the Horde# #COORD[34,66]# and turn in #INThe Swamp Talker#. Accept and do #DOA Tale of Sorrow#, just talk with him. SKIP #SKIPThe Stones That Binds Us#.", x = 34, y = 66, zone = "Swamp of Sorrows" },
			[10] = { str = "Hearth to Booty Bay, and get on the boat to Ratchet." },
			[11] = { str = "Fly to Brackenwall Village (Dustwallow Marsh)." },
			--[11] = { str = "Fly to Brackenwall Village (Dustwallow Marsh). Once there accept #GETThe Brood of Onyxia pt.3# " },
			[12] = { str = "Head south and get the #ITEMOverdue Package# for the quest #DOLedger from Tanaris# at #COORD[54,55]#", x = 54, y = 55, zone = "Dustwallow Marsh" },
			--[13] = { str = "Go down a bit and do #DOThe Brood of Onyxia#, the #ITEM[Eggs of Onyxia]# can be found at #COORD[53,72]# and #COORD[48,75]#", x = 53, y = 72, zone = "Dustwallow Marsh" },
			[13] = { str = "Then head to Bloodfen Burrow cave #COORD[32,66]#, and do #DOCortello's Riddle#, click the #ITEM[Musty Scroll] inside the cave, turn in and accept the next part to it.", x = 32, y = 66, zone = "Dustwallow Marsh" },
			--[15] = { str = "Turn in #INThe Brood of Onyxia#, accept #GETChallenge Overlord Mok'Morokk#. Do #DOChallenge Overlord Mok'Morokk# Then turn it in." },
			[14] = { str = "Head back to Brackenwall Village, then fly to Gadgetzan (Tanaris)." },
			[15] = { str = "Turn in #INLedger from Tanaris# and #INInto the Field#, accept and complete #DOSlake that Thirst# using #ITEM[Wastewander Water Pouch]# from your bank. Put the #ITEM[Power Source]# in the bank for now." },
			[16] = { str = "Fly to Camp Mojache (Feralas)." },
		}
	},
	[4849] = {
		title = "48-49 Feralas",
		--L- Playtested and corrected
		items = {
			[1] = { str = "48-49 Feralas" },
			[2] = { str = "Make Camp Mojache your home. Turn in #INTesting the Vessel#, accept #GETHippogryph Muisek#, #GETVengeance on the Northspring# and #GETDark Heart# (Elite)." },
		--L-  ,  #GETImproved Quality# not available!?
			[3] = { str = "Go do #DOHippogryph Muisek# at #COORD[56,63]#", x = 56, y = 63, zone = "Feralas" },
			[4] = { str = "Hearth back to Camp Mojache, Turn in #INHippogryph Muisek# and accept #GETFaerie Dragon Muisek#." },
			[5] = { str = "Go do #DOFaerie Dragon Muisek# at #COORD[68,48]#, turn it in, accept #GETTreant Muisek# (Elite).", x = 68, y = 48, zone = "Feralas" },
			[6] = { str = "Go do #DOTreant Muisek# (Elite) at #COORD[57,73]#, turn it in, accept #GETMountain Giant Muisek# (Elite).", x = 57, y = 73, zone = "Feralas" },
			[7] = { str = "Go accept #GETZapped Giants# at #COORD[45,43]#.", x = 45, y = 43, zone = "Feralas" },
			[8] = { str = "Do #DOMountain Giant Muisek# (Elite) along with #DOZapped Giants# at #COORD[39,21]#. Zap then kill the #NPCCliff Giants#, to make them easier to kill.", x = 39, y = 21, zone = "Feralas" },
			[9] = { str = "Do #DOVengeance on the Northspring# and #DODark Heart# (Elite)." },
		--L- #DOImproved Quality#, #DOPerfect Yeti Hide#, not available! 1.12.2!?
			[10] = { str = "Run back and turn in #INZapped Giants#, then hearth to Camp Mojache." },
			[11] = { str = "Turn in #INMountain Giant Muisek# (Elite), accept #GETWeapons of Spirit#, then turn it in." },
			[12] = { str = "Turn in #INVengeance on the Northspring# and #INDark Heart#." },
			[13] = { str = "Accept #GETThe Strength of Corruption#." },
			[14] = { str = "Fly to Gadgetzan (Tanaris)." },
		}
	},
	[4950] = {
		title = "49-50 Tanaris",
		--L- Needs playtest
		items = {
			[1] = { str = "49-50 Tanaris" },
			[2] = { str = "Go to the #ITEMEgg-O-Matic# Machine in Gadgetzan, and turn in the #ITEM[Hippogryph Egg]# for #DOThe Super Egg-O-Matic#." },
			[3] = { str = "Make Gadgetzan your home." },
			[4] = { str = "Accept #GETThe Thirsty Goblin#, #GETNoxious Lair Investigation#, #GETSuper Sticky#, #GETThistleshrub Valley# and #GETThe Dunemaul Compound#." },
			[5] = { str = "Go turn in #INThe Sunken Temple# at #COORD[53,46]#, accept #GETThe Stone Circle# and #GETGahz'ridian#.", x = 52, y = 45, zone = "Tanaris" },
			[6] = { str = "Do #DOThe Dunemaul Compound#  in the area at #COORD[40,58]#, #NPCGor'marok# is in the cave at #COORD[41,57]#. Look for #ITEM[Gahz'ridian Ornaments]# for #DOGahz'ridian# while doing these next quests.", x = 40, y = 58, zone = "Tanaris" },
			[7] = { str = "Do #DONoxious Lair Investigation# at #COORD[34,47]#.", x = 34, y = 47, zone = "Tanaris" },
			[8] = { str = "Do #DOThistleshrub Valley# along with #DOThe Thirsty Goblin# at #COORD[28,65]#.", x = 28, y = 65, zone = "Tanaris" },
			[9] = { str = "Do #DOTooga's Quest#, escort turtle quest that starts in the Thistleshrub Valley, lead #NPCTooga# to #NPCTorta# at #COORD[66,25]#.", x = 66, y = 25, zone = "Tanaris" },
			--[10] = { str = "If you haven't completed #DOGahz'ridian# yet, get the rest of the #ITEM[Gahz'ridian Ornaments]# at #COORD[39,73]#.", x = 39, y = 73, zone = "Tanaris" },
			[10] = { str = "Turn in #INTooga's Quest# along with #INScreecher Spirits#, SKIP #SKIPThe Prophecy of Mosh'Aru#." },
			[11] = { str = "Go back to Gadgetzan and turn in #INThe Thirsty Goblin#, accept #GETIn Good Taste# turn it in, accept #GETSprinkle's Secret Ingredient#, turn in #INThistleshrub Valley#, #INThe Dunemaul Compound# and #INNoxious Lair Investigation#, accept #GETThe Scrimshank Redemption#." },
			[12] = { str = "Get your #ITEM[Sampling Kit]# and #ITEM[Power Source]# from the bank, accept #GETTanaris Field Sampling# from it, then go do it. turn in #INGahz'ridian# at #COORD[52,45]#.", x = 52, y = 45, zone = "Tanaris" },
			[13] = { str = "Do #DOThe Scrimshank Redemption#, in the cave at #COORD[56,70]# The secret for finding the item for this quest is keep making right turns in the cave and it will lead you to it.", x = 53, y = 70, zone = "Tanaris" },
			[14] = { str = "If the #ITEM[OOX-17/TN Distress Beacon]# drops, accept the quest #GETFind OOX-17/TN!# and tun it in at #COORD[60,64]#.", x = 60, y = 64, zone = "Tanaris" },
			[15] = { str = "Hearth to Gadgetzan." },
			[16] = { str = "Turn in #INTanaris Field Sampling#, accept #GETReturn to Apothecary Zinge#." },
			[17] = { str = "Turn in #INThe Scrimshank Redemption#, accept #GETInsect Part Analysis#." },
			[18] = { str = "Turn in #INInsect Part Analysis#, accept #GETInsect Part Analysis pt.2#." },
			[19] = { str = "Turn in #INInsect Part Analysis pt.2#, accept #GETRise of the Silithid#." },
			[20] = { str = "Fly to Orgrimmar, and make it your home." },
			[21] = { str = "Get the #ITEM[Box of Empty Vials]# out of your Bank." },
			[22] = { str = "Fly to Azshara." },
		}
	},
}
