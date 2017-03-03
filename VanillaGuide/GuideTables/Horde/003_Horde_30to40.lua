--[[--------------------------------------------------
003_Horde_30to40.lua
Authors: mrmr, lanjelin
Version: 1.04.3
------------------------------------------------------
Description: Guide Serie - 003 From Lvl 30 to Lvl 40
    1.04.1
        -- First Release
            Horde's Guide
            from level 30 to lever 40
    1.04.2
    	-- no changes in here for this revision
    1.04.3
	    -- Cleanup in text, changed formatting of coords
------------------------------------------------------
Connection:
--]]--------------------------------------------------
Table_003_Horde_30to40 = {
	[3029] = {
		title = "30-30 Alterac Mountains",
		--L- Needs playtest
		items = {
			[1] = { str = "30-30 Alterac Mountains" },
			[2] = { str = "Do #DOElixir of Pain#, killing the level 32-34 #NPCMountain Lions# on the plateaus." },
			[3] = { str = "Charge the third flame #ITEMFlame of Uzel#, for the quest #DOHelcular's Revenge# " },
			[4] = { str = "Kill #NPCFrostmaw# (level 37 mob), it's a tough battle so prepare yourself! A group may be needed." },
			[5] = { str = "Run down to Southshore, to drive the rod into #ITEMHelcular's grave#, completing #INHelcular's Revenge# " },
			[6] = { str = "Run back to Tarren Mill" },
			[7] = { str = "Turn in #INElixir of Pain# " },
			[8] = { str = "Accept #GETThe Hammer May Fall#" },
			[9] = { str = "Run into Arathi Highlands." },
		}
	},
	[3030] = {
		title = "30-30 Arathi Highlands",
		--L- Needs playtest
		items = {
			[1] = { str = "30-30 Arathi Highlands" },		
			[2] = { str = "Do #DOThe Hammer May Fall# at #COORD[34,45]#", x = 34, y = 45, zone = "Arathi Highlands" },
			[3] = { str = "Then run to Hammerfall at #COORD[73,36]#", x = 73, y = 36, zone = "Arathi Highlands" },
			[4] = { str = "Accept #GETHammerfall#." },
			[5] = { str = "Turn in #INHammerfall#, accept #GETRaising Spirits# " },
			[6] = { str = "Turn in #INThe Hammer May Fall# " },
			[7] = { str = "Get the flightpath there." },
			[8] = { str = "Then do #DORaising Spirits#, just to the left of Hammerfall all around #COORD[64,37]#.  Turn it in and accept #GETRaising Spirits pt.2#", x = 64, y = 37, zone = "Arathi Highlands" },
			[9] = { str = "Turn in #INRaising Spirits pt.2#, accept #GETRaising Spirits pt.3#" },
			[10] = { str = "Turn in #INRaising Spirits pt.3#, skip #SKIPGuile of the Raptor# for now" },
			[11] = { str = "Hearth to Orgrimmar. Put #ITEM[Frostmaw's Mane]# into the bank to save bagspace. It will not be turned in until level 43." },
			[12] = { str = "Fly to Crossroads." },
			[13] = { str = "Run west in the Crossroads, accept #GETThe Swarm Grows# " },
			[14] = { str = "Then run west from the Crossroads to the guy in the hut, accept #GETThe Kolkar of Desolace# " },
			[15] = { str = "Run back to Crossroads and make it your home." },
			[16] = { str = "Fly to Ratchet and get on the boat to Booty Bay." },
		}
	},
	[3031] = {
		title = "30-31 Stranglethorn Vale",
		--L- Needs playtest
		items = {
			[1] = { str = "30-31 Stranglethorn Vale" },
			[2] = { str = "Get the flightpath in Booty Bay, and run up to Grom'Gol, getting the flightpath there too." },
			[3] = { str = "Go up north #COORD[35,10]# and start doing the Stranglethorn hunting quests", x = 35, y = 10, zone = "Stranglethorn Vale" },
			[4] = { str = "#DOWelcome to the Jungle#, accept and turn it in." },
			[5] = { str = "#DOTiger Mastery#, #NPCYoung Stranglethorn Tigers# at #COORD[33,10]#", x = 33, y = 10, zone = "Stranglethorn Vale" },
			[6] = { str = "#DOPanther Mastery#, #NPCYoung Panthers# at #COORD[41.09]#", x = 41, y = 9, zone = "Stranglethorn Vale" },
			[7] = { str = "#DOPanther Mastery#, #NPCPanthers# at #COORD[30,11]#", x = 30, y = 11, zone = "Stranglethorn Vale" },
			[8] = { str = "#DOTiger Mastery#, #NPCStranglethorn Tigers# at #COORD[30,10]#", x = 30, y = 11, zone = "Stranglethorn Vale" },
			[9] = { str = "#DORaptor Mastery#, #NPCStranglethorn Raptors# at #COORD[25,15]#", x = 25, y = 15, zone = "Stranglethorn Vale" },
			[10] = { str = "Accept #GETTiger Mastery#, #NPCElder Stranglethorn Tigers#, but don't do it now." },
			[11] = { str = "Accept #GETRaptor Mastery#, #NPCLashtail Raptors#, but don't do it now." },
			[12] = { str = "Skip the rest for now." },
			[13] = { str = "You should be level 31 for sure, if not grind to it" },
			[14] = { str = "Hearth to Crossroads." },
			[15] = { str = "Fly to Thousand Needles." },
			[16] = { str = "Go east into Shimmering Flats at #COORD[77,77]#.", x = 77, y = 77, zone = "Thousand Needles" },
		}
	},
	[3132] = {
		title = "31-32 TN (Shimmering Flats)",
		--L- Needs playtest
		items = {
			[1] = { str = "31-32 Thousand Needles (Shimmering Flats)" },
			[2] = { str = "Accept #GETHemet Nesingwary# and #GETWharfmaster Dizzywig#." },
			[3] = { str = "Accept and do the following together: #DOA Bump in the Road#, #DOHardened Shells#, #DOLoad Lightening#, #DORocket Car Parts#, #DOSalt Flat Venom#." },
			[4] = { str = "Turn them all in. Accept #GETGoblin Sponsorship# and #GETMartk the Exiled#, SKIP #SKIPEncrusted Tail Fins# (Elite)." },
			[5] = { str = "Go south into Tanaris to get flightpath in Gadgetzan at #COORD[51,25]#", x = 51, y = 25, zone = "Tanaris" },
			[6] = { str = "Hearth to Crossroads, then fly to Orgrimmar." },
			[7] = { str = "Turn in #INThe Swarm Grows# at #COORD[75,34]#, accept #GETThe Swarm Grows pt.2#.", x = 75, y = 34, zone = "Orgrimma" },
			[8] = { str = "Accept #GETAlliance Relations# from #NPCCraven Drok# in the Cleft of Shadow, #COORD[47,50]#", x = 47, y = 50, zone = "Orgrimmar" },
			[9] = { str = "Then go to #NPCKeldran# in Orgrimmar #COORD[23,53]# to accept #GETAlliance Relations pt.2#.", x = 23, y = 53, zone = "Orgrimmar" },
			[10] = { str = "Fly to Stonetalon Mountains, and run in to Desolace." },
		}
	},
	[3234] = {
		title = "32-34 Desolace",
		--L- Needs playtest
		items = {
			[1] = { str = "32-34 Desolace" },
			[2] = { str = "First thing to do here is start killing mobs at the Thunder Axe Fortress #COORD[55,24]# until #ITEM[Flayed Demon Skin]# dropps, which starts #GETThe Corrupter#.", x = 55, y = 24, zone = "Desolace" },
			[3] = { str = "After you got it, go do #DOKodo Roundup#, it starts at #COORD[60,61]#.", x = 60, y = 61, zone = "Desolace" },
			[4] = { str = "Then go to Ghost Walker Post #COORD[56,59]#", x = 56, y = 59, zone = "Desolace" },
			[5] = { str = "Turn in #INThe Kolkar of Desolace#, accept #GETKhan Dez'hepah#." },
			[6] = { str = "Accept #GETGelkis Alliance#, skip #SKIPMagram Alliance#." },
			[7] = { str = " Accept #GETCatch of the Day#. Turn in #INAlliance Relations#, accept #GETAlliance Relations pt.2# and #GETBefouled by Satyr# " },
			[8] = { str = "Turn in #INThe Corrupter#, accept #GETThe Corrupter pt.2#." },
			[9] = { str = "Turn in #INAlliance Relations pt.2#, accept #GETThe Burning of Spirits#." },
			[10] = { str = "Go do #DOBefouled by Satyr# and #DOThe Corrupter pt.2# at #COORD[75,22]#.", x = 75, y = 22, zone = "Desolace" },
			[11] = { str = "Do #DOKhan Dez'hepah#, at #COORD[73,48]#", x = 73, y = 48, zone = "Desolace" },
			[12] = { str = "Do #DOGelkis Alliance#, at #COORD[68,71]#", x = 68, y = 71, zone = "Desolace" },
			[13] = { str = "Go back to Ghost Walker Post #COORD[56,59]#, and turn in #INKhan Dez'hepah#, accept #GETCentaur Bounty#. Turn in #INBefouled by Satyr# and #INThe Corrupter pt.2#, accept #GETThe Corrupter pt.3#.", x = 56, y = 59, zone = "Desolace" },
			[14] = { str = "Then run to Shadowprey Village, stopping along the way to turn in #INGelkis Alliance# at #COORD[36,79]#, accept #GETStealing Supplies# ", x = 36, y = 79, zone = "Desolace" },
			[15] = { str = "Accept all quests at Shadowprey Village at #COORD[24,71]#; #GETHunting in Stranglethorn#, #GETHand of Iruxos#, #GETClam Bait# and #GETOther Fish to Fry# ", x = 24, y = 71, zone = "Desolace" },
			[16] = { str = "Make Shadowprey Village your home." },
			[17] = { str = "Go in the water and collect 10 #NPCShellfish#, from the Shellfish traps." },
			[18] = { str = "Turn those in at #NPCJinar'Zillen# for 2 #ITEMBloodbelly Fish#." },
			[19] = { str = "Travel up the water, collecting #ITEMSoft-shelled Clam Meat# for the quest #DOClam Bait# along the way" },
			[20] = { str = "Accept #GETClaim Rackmore's Treasure!# at the chest/wrecked boat along the shore, #COORD[36,30]#. The #ITEM[Silver Key]# is dropped by a #NPCDrysnap#, and the #ITEM[Golden Key]# is dropped by a #NPCSlitherblade#.", x = 36, y = 30, zone = "Desolace" },
			[21] = { str = "Go accept #GETSceptre of Light# from #NPCAzore Aldamort# at #COORD[38,27]#", x = 38, y = 27, zone = "Desolace" },
			[22] = { str = "Then go to Thunder Axe Fortress #COORD[54,29]# and do #DOThe Burning of Spirits#, #DOSceptre of Light# and #DOHand of Iruxos#.", x = 54, y = 29, zone = "Desolace" },
			[23] = { str = "Grind your way back to #NPCAzore Aldamort# #COORD[38,27]#, turn in #INSceptre of Light# in and get #GETBook of the Ancients#.", x = 38, y = 27, zone = "Desolace" },
			[24] = { str = "Then head off to do #DOOther Fish to Fry#, #DOClam Bait#, #DOThe Corrupter pt.3#, #DOClaim Rackmore's Treasure!# and #DOBook of the Ancients# from the shore and out to #COORD[27,06]#", x = 27, y = 6, zone = "Desolace" },
			[25] = { str = "Turn in #INClaim Rackmore's Treasure!# at the little chest at #COORD[29,08]#.", x = 29, y = 8, zone = "Desolace" },
			[26] = { str = "Turn in #INBook of the Ancients# at #COORD[38,27]#", x = 38, y = 27, zone = "Desolace" },
			[27] = { str = "Then go accept #GETBone Collector# at #COORD[62,38]#, grinding mobs along the way.", x = 62, y = 38, zone = "Desolace" },
			[28] = { str = "Go to Ghost Walker Post #COORD[56,59]#, turn in #INCatch of the Day# accept and turn in #INThe Burning of Spirits#, turn in #INThe Corrupter pt.3#, accept and turn in #INThe Corrupter pt.4#. Accept #GETAlliance Relations# Skip #SKIPThe Corrupter pt.5#.", x = 56, y = 59, zone = "Desolace" },
			[29] = { str = "Then do #DOBone Collector# at the kodo graveyard #COORD[51,58]#", x = 51, y = 58, zone = "Desolace" },
			[30] = { str = "Then #DOCentaur Bounty# and #DOStealing Supplies# #COORD[70,74]#", x = 70, y = 74, zone = "Desolace" },
			[31] = { str = "Then go turn in #INCentaur Bounty# at #COORD[56,59]#", x = 56, y = 59, zone = "Desolace" },
			[32] = { str = "Turn in #INBone Collector# at #COORD[62,38]#", x = 62, y = 38, zone = "Desolace" },
			[33] = { str = "Hearth to Shadowprey Village." },
			[34] = { str = "Turn in all quests, #INHand of Iruxos#, #INOther Fish to Fry# and #INClam Bait#. You should be level 34 by now." },
			[35] = { str = "Turn in #INStealing Supplies# at #COORD[36,79]# and accept #GETOngeku#.", x = 36, y = 79, zone = "Desolace" },
			[36] = { str = "Fly to Camp Taurajo (Barrens), then run south-east into Dustwallow Marsh #COORD[51,79]#.", x = 51, y = 79, zone = "The Barrens" },
			[37] = { str = "Collect the 3 quest-objects at the Shady Rest Inn" },
			[38] = { str = "#GETSuspicious Hoofprints#, just right outside in front of the inn." },
			[39] = { str = "#GETLieutenant Paval Reethe#, laying on one of the planks on the ground." },
			[40] = { str = "#GETThe Black Shield#, on top of the fireplace." },
			[41] = { str = "Now run to Brackenwall Village #COORD[35,29]#", x = 35, y = 29, zone = "Dustwallow Marsh" },
			[42] = { str = "Turn in those 3 quests, #INSuspicious Hoofprints# #INLieutenant Paval Reethe# and #INThe Black Shield#, accept and then turn in #INThe Black Shield pt.2# Skip #SKIPThe Black Shield pt.3#." },
		--L- Need to check Black Shield quests
			[43] = { str = "Stop at the troll vendor, buy the 3 first aid books." },
			[44] = { str = "Fly to Ratchet to turn in #INGoblin Sponsorship# and #INWharfmaster Dizzywig#, accept #GETGoblin Sponsorship pt.2# and #GETParts for Kravel#." },
			[45] = { str = "Get on the boat to Booty Bay." },
		}
	},
	[3435] = {
		title = "34-35 Stranglethorn Vale",
		--L- Needs playtest
		items = {
			[1] = { str = "34-35 Stranglethorn Vale" },
			[2] = { str = "Turn in #INGoblin Sponsorship pt.2#, accept #GETGoblin Sponsorship pt.3# Make Booty Bay your home! Accept #GETSinging Blue Shards#, #GETBloodscalp Ears#, #GETHostile Takeover# and #GETInvestigate the Camp#. Turn in #INGoblin Sponsorship pt.3# at #NPCBaron Revilgaz#, accept #GETGoblin Sponsorship pt.4#." },
			[3] = { str = "Fly to Grom'gol, and grab all the quests there; #GETThe Defense of Grom'gol#, #GETMok'thardin's Enchantment#, #GETBloodscalp Insight#, #GETHunt for Yenniku#, #GETTrollbane#, #GETBloody Bone Necklaces#, #GETThe Vile Reef#." },
			[4] = { str = "Make sure you save any #ITEM[Green Hills of Stranglethorn]# pages you find and mail them to your alt for storage, you will need them for a later quest." },
			[5] = { str = "You will need following: Chapter 1: 1, 4, 6 and 8. Chapter 2: 10, 11, 14 and 16. Chapter 3: 18, 20, 21 and 24. Chapter 4: 25, 26, and 27." },
			[6] = { str = "Do #DOSinging Blue Shards# at #COORD[25,19]#", x = 25, y = 19, zone = "Stranglethorn Vale" },
			[7] = { str = "Do #DOTiger Mastery#, killing #NPCElder Stranglethorn Tigers# at #COORD[31,19]#", x = 31, y = 19, zone = "Stranglethorn Vale" },
			[8] = { str = "Do #DOBloodscalp Ears#, #DOHunt for Yenniku# and #DOBloody Bone Necklaces# (no need to complete latter at this time)." },
			[9] = { str = "Do #DORaptor Mastery# and #DOThe Defense of Grom'gol# killing #NPCLashtail Raptors# just outside Grom'gol." },
			[10] = { str = "Go to Grom'gol and turn in #INHunt for Yenniku#, accept #GETHeadhunting#, turn in #INThe Defense of Grom'gol#, accept #GETThe Defense of Grom'gol pt.2#" },
			[11] = { str = "Do #DOHeadhunting# while finishing up #DOBloody Bone Necklaces# at #COORD[21,14]#", x = 21, y = 14, zone = "Stranglethorn Vale" },
			[12] = { str = "Do #DOThe Vile Reef# along with #DOEncrusted Tail Fins# at #COORD[24,24]#. Be careful not to drown.", x = 24, y = 24, zone = "Stranglethorn Vale" },
			[13] = { str = "Then go to Nesingwary's Expedition #COORD[35,10]#, turn in ALL quests and accept all new ones, except #SKIPThe Green Hills of Stranglethorn#.", x = 35, y = 10, zone = "Stranglethorn Vale" },
			[14] = { str = "Do #DOTiger Mastery# killing #NPCSin'Dall#, he is usually on top of the hill at #COORD[31,17]#. Go turn it in when done.", x = 31, y = 17, zone = "Stranglethorn Vale" },
			[15] = { str = "Do #DOHostile Takeover# along with #DOGoblin Sponsorship# at #COORD[44,19]#", x = 44, y = 19, zone = "Stranglethorn Vale" },
			[16] = { str = "Do #DOPanther Mastery# along with #DOMok'thardin's Enchantment#, kill #NPCShadowmaw Panthers# at #COORD[48,21]#", x = 48, y = 21, zone = "Stranglethorn Vale" },
			[17] = { str = "Do #DOThe Defense of Grom'gol pt.2# at #COORD[36,30]#", x = 36, y = 30, zone = "Stranglethorn Vale" },
			[18] = { str = "Head up north and turn in #INPanther Mastery#,accept #GETPanther Mastery#, #NPCBhag'thera#, but don't do it now." },
			[19] = { str = "Hearth to Booty Bay, turn in #INSinging Blue Shards#, #INHostile Takeover#, #INBloodscalp Ears# and #INInvestigate the Camp#." },
			[20] = { str = "Turn in #INGoblin Sponsorship pt.4#, accept #GETGoblin Sponsorship pt.5#." },
			[21] = { str = "Fly to Grom'gol and turn in all quests, #INThe Defense of Grom'gol#, #INMok'thardin's Enchantment#, #INHeadhunting#, #INBloody Bone Necklaces# and #INThe Vile Reef#." },
			[22] = { str = "You should be level 36 now, if not, grind to it. Accept #GETTrollbane#." },
			[23] = { str = "Get on the zeppelin to the Undercity." },
			[24] = { str = "Accept #GETTo Steal From Thieves# #COORD[63,49]#", x = 63, y = 49, zone = "Undercity" },
			[25] = { str = "Then fly to Hammerfall." },
		}
	},
	[3537] = {
		title = "35-37 Arathi Highlands",
		--L- Needs playtest
		items = {
			[1] = { str = "35-37 Arathi Highlands" },
			[2] = { str = "Make Hammerfall your home." },
			[3] = { str = "Turn in #INTrollbane#, SKIP #SKIPSigil of Strom#." },
			[4] = { str = "Accept #GETCall to Arms#, #GETFoul Magics# and #GETGuile of the Raptor# " },
			[5] = { str = "Grind your way down south and do #DOCall to Arms#." },
			[6] = { str = "Then go west of Hammerfall and accept #GETThe Princess Trapped# #COORD[62,33]#", x = 62, y = 33, zone = "Arathi Highlands" },
			[7] = { str = "Then go do #DOThe Princess Trapped# while grinding your way inside the cave." },
			[8] = { str = "Turn in #INThe Princess Trapped# in the cave, and accept #GETStones of Binding#." },
			[9] = { str = "Turn in #INCall to Arms#, accept #GETCall to Arms pt.2# " },
			[10] = { str = "Do #DOStones of Binding# First key, just west of Hammerfall at #COORD[66,29]#", x = 66, y = 29, zone = "Arathi Highlands" },
			[11] = { str = "Do #DOTo Steal From Thieves# at #COORD[54,40]#", x = 54, y = 40, zone = "Arathi Highlands" },
			[12] = { str = "Go down south a little and get the next key for #DOStones of Binding#, at #COORD[52,50]#", x = 52, y = 50, zone = "Arathi Highlands" },
			[13] = { str = "Do #DOCall to Arms pt.2# killing #NPCOgres#, and #DOGuile of the Raptor# killing #NPCHighland Fleshstalkers# around #COORD[50,75]#", x = 50, y = 75, zone = "Arathi Highlands" },
			[14] = { str = "Do #DOFoul Magics# at #COORD[31,28]#", x = 31, y = 28, zone = "Arathi Highlands" },
			[15] = { str = "Then go west and get the last key for #DOStones of Binding# at #COORD[25,31]#", x = 25, y = 31, zone = "Arathi Highlands" },
			[16] = { str = "Go discover Stromguard, and turn in #INStones of Binding#, at the Circle of Inner Binding #COORD[36,57]#. SKIP #SKIPBreaking the Keystone# (Elite), unless you get a group for it.", x = 36, y = 57, zone = "Arathi Highlands" },
			[17] = { str = "Hearth to Hammerfall." },
			[18] = { str = "Turn in #INFoul Magics#, #INGuile of the Raptor# and #INCall to Arms pt.2# " },
			[19] = { str = "Complete the #DOGuile of the Raptor# quest chain by running back and forth." },
			[20] = { str = "Fly to Tarren Mill." },
		}
	},
	[3736] = {
		title = "37-37 Alterac Mountains",
		--L- Needs playtest
		items = {
			[1] = { str = "37-37 Alterac Mountains" },
			[2] = { str = "Once at Tarren Mill, accept #GETStone Tokens# and #GETPrison Break In#, then go do them in Alterac Mountains at Dalaran." },
			[3] = { str = "Then turn them in and accept #GETDalaran Patrols# and #GETBracers of Binding#, doing them a bit further north then the last two." },
			[4] = { str = "Once they are both completed, die on purpose, so you end up at Tarren Mill." },
			[5] = { str = "Turn them in, then fly to Undercity." },
			[6] = { str = "Once in Undercity, turn in #INTo Steal From Thieves# and buy 3x#NPCSoothing Spices" },
			[7] = { str = "Get on zeppelin to Orgrimmar." },
			[8] = { str = "Once in Orgrimmar, turn in #INAlliance Relations# at #NPCKeldran# at #COORD[21,53]#", x = 21, y = 53, zone = "Orgrimmar" },
			[9] = { str = "Fly to Crossroads, making it your home." },
			[10] = { str = "Fly to Freewind Post (Thousand Needles)." },
		}
	},
	[3737] = {
		title = "37-37 Thousand Needles",
		--L- Needs playtest
		items = {
			[1] = { str = "37-37 Thousand Needles" },
			[2] = { str = "Run towards the Shimmering Flats.." },
			[3] = { str = "Turn in #INThe Swarm Grows#, accept #GETThe Swarm Grows pt.2# at #COORD[67,63]#", x = 67, y = 63, zone = "Thousand Needles" },
			[4] = { str = "Stop at the goblins and turn in #INParts for Kravel#, accept #GETDelivery to the Gnomes#, turn in #INDelivery to the Gnomes#, turn in #INGoblin Sponsorship pt.3#, accept #GETThe Eighteenth Pilot#, turn in #INThe Eighteenth Pilot#, accept #GETRazzeric's Tweaking#, turn in #INEncrusted Tail Fins#, lastly accept #GETThe Rumormonger#." },
			[5] = { str = "Do #DOThe Swarm Grows# and #DOParts of the Swarm# (quest starts from an item drop) at #COORD[71,85]#", x = 71, y = 85, zone = "Thousand Needles" },
			[6] = { str = "Then go turn in #INThe Swarm Grows# at #COORD[67,63]#", x = 67, y = 63, zone = "Thousand Needles" },
			[7] = { str = "Hearth to Crossroads" },
			[8] = { str = "Turn in #INParts of the Swarm#, accept #GETParts of the Swarm pt.2#" },
			[9] = { str = "Fly to Dustwallow Marsh." },
		}
	},
	[3738] = {
		title = "37-38 Dustwallow Marsh",
		--L- Needs playtest
		items = {
			[1] = { str = "37-38 Dustwallow Marsh" },
			[2] = { str = "Accept #GETTheramore Spies# and #GETThe Black Shield pt.3# " },
			[3] = { str = "Go slightly south of Brackenwall Village and accept #GETHungry!# from the ogre at #COORD[35,37]#", x = 35, y = 37, zone = "Dustwallow Marsh" },
			[4] = { str = "Do #DOTheramore Spies# and #DOThe Black Shield pt.3#. Do #DOHungry!# at #COORD[58,23]#", x = 58, y = 23, zone = "Dustwallow Marsh" },
		--L- Is Hungry available elysium?
			[5] = { str = "Stop at Jarl's cabin #COORD[55,25]#, get #GETThe Lost Report# by clicking the dirt mound next to his cabin, turn in #INSoothing Spices# and accept #GETJarl Needs Eyes#.", x = 55, y = 25, zone = "Dustwallow Marsh" },
			[6] = { str = "Go south at #COORD[54,56]# to retrive the #ITEM[Seaforium Booster]# for Razzeric.", x = 54, y = 56, zone = "Dustwallow Marsh" },
			[7] = { str = "Do #DOJarl Needs Eyes#." },
			[8] = { str = "Do the escort quest #DOStinky's Escape# that starts at #COORD[47,18]#.", x = 47, y = 18, zone = "Dustwallow Marsh" },
			[9] = { str = "Stop at Brackenwall Village and turn in all quests, accept new ones. Turn in #INHungry!#" },
			[10] = { str = "Go to Jarl's cabin at #COORD[55,25]#, go to the #ITEMDirt Mound# once again to get #GETThe Severed Head#, turn in #INJarl Needs Eyes#, SKIP #SKIPJarl Needs a Blade#", x = 55, y = 25, zone = "Dustwallow Marsh" },
			[11] = { str = "Grind some  at the raptors and such, at this point you should be a little over half way to 39." },
			[12] = { str = "Do #DOThe Theramore Docks#, the #ITEM[Captain's Documents]# are under the water at #COORD[71,51]#" , x = 71, y = 51, zone = "Dustwallow Marsh" },
			[13] = { str = "Then die on purpose, so you end up right at Brackenwall Village." },
			[14] = { str = "Turn in #INThe Theramore Docks# and #INThe Severed Head#, accept #GETThe Troll Witchdoctor#" },
			[15] = { str = "Hearth to Crossroads, fly to Ratchet and turn in #INStinky's Escape#, then get on the boat to Booty Bay." },
		}
	},
	[3840] = {
		title = "38-40 Stranglethorn Vale",
		--L- Needs playtest
		items = {
			[1] = { str = "38-40 Stranglethorn Vale" },
			[2] = { str = "Accept #GETThe Bloodsail Buccaneers#, #GETVenture Company Mining# and #GETScaring Shaky#." },
			[3] = { str = "Make Booty Bay your home, then go up the steps and turn in #INThe Rumormonger#. Fly to Grom'gol." },
			[4] = { str = "Accept #GETMok'thardin's Enchantment#, turn in #INThe Troll Witchdoctor#, then right click the cauldron and accept #GETMarg Speaks#." },
		--L- Is this available elysium?
			[5] = { str = "Do #DORaptor Mastery# along with #DOMok'thardin's Enchantment# at #COORD[31,41]#, kill #NPCJungle Stalkers#.", x = 31, y = 41, zone = "Stranglethorn Vale" },
			[6] = { str = "Grind away at raptors/cold eye ballisks till level 39." },
			[7] = { str = "Do #DOVenture Company Mining# at #COORD[40,42]#", x = 40, y = 42, zone = "Stranglethorn Vale" },
			[8] = { str = "Once that is done, go back to Grom'Gol and turn in #INMok'thardin's Enchantment pt.2#, accept #GETMok'thardin's Enchantment pt.3#." },
			[9] = { str = "Do #DOPanther Mastery#, kill #NPCBhag'thera# (he has 3 different spawn points, #COORD[48,20]#, #COORD[49,23]#, and #COORD[47,26]#)", x = 48, y = 20, zone = "Stranglethorn Vale" },
			[10] = { str = "Turn in #INPanther Mastery# and #INRaptor Mastery# at Nesingwary's Expedition #COORD[35,10]#", x = 35, y = 10, zone = "Stranglethorn Vale" },
			[11] = { str = "Accept #GETRaptor Mastery# for #NPCTethis#, but don't do it now." },
			[12] = { str = "Hearth to Booty Bay, turn in #INVenture Company Mining#." },
			[13] = { str = "Go do #DOThe Bloodsail Buccaneers# north-west of Booty Bay at #COORD[27,69]#, there's a little note on a barrel, click on it, accept new quest. ", x = 27, y = 69, zone = "Stranglethorn Vale" },
			[14] = { str = "Do #DOScaring Shaky# along with #DOMok'thardin's Enchantment pt.3# at #COORD[32,66]#.", x = 32, y = 66, zone = "Stranglethorn Vale" },
			[15] = { str = "Run back to Booty Bay, turn in #INScaring Shaky#, accept #GETReturn to MacKinley#, turn in #INThe Bloodsail Buccaneers#, accept #GETThe Bloodsail Buccaneers pt.2#, turn in #INReturn to MacKinley#, then turn in #INThe Bloodsail Buccaneers# at #NPCFleet Master Seahorn#." },
			[16] = { str = "Fly to Grom'gol, turn in #INMok'thardin's Enchantment pt.3#, accept #GETMok'thardin's Enchantment pt.4#" },
			[17] = { str = "You should be level 40 for sure now. If not, grind the rest of the way to 40 on Raptors/Cold Eye Basilisks." },
			[18] = { str = "Then get on the zeppelin to Undercity." },
			[19] = { str = "Check the Aution House for #ITEM[Frost Oil]#, #ITEM[Gyrochronatom]#, #ITEM[Healing Potion]#, #ITEM[Lesser Invisibility Potion]# and #ITEM[Patterned Bronze Bracers]# for some fast quests in Badlands." },
			[20] = { str = "Fly to Hammerfall, then run all the way to Badlands." },
		}
	},
}