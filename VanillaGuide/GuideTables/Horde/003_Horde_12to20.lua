--[[--------------------------------------------------
003_Horde_12to20.lua
Authors: mrmr
Version: 1.04.2
------------------------------------------------------
Description: Guide Serie - 003 From Lvl 12 to Lvl 20
    1.04.1
        -- First Release
            Horde's Guide
            from level 12 to lever 20
    1.04.2
    	-- no changes in here for this revision
------------------------------------------------------
Connection:
--]]--------------------------------------------------

Table_003_Horde_12to20 = {
-----------12-15 Barrens
	--[101] = {
	[1215] = {
		title = "12-15 Barrens",
		--n = "12-15 Barrens",
		--pID = 13, nID = 102, 
		--itemCount = 34,
		items = {
			[1] = { str = "12-15 Barrens" },
			[2] = { str = "01) Turn in #TURNIN\"Conscript of the Horde\"# (62.19 in the Barrens) accept #ACCEPT\"Crossroads Conscription\"# ", x = 62, y = 19, zone = "The Barrens" },
			[3] = { str = "02) Then turn in #TURNIN\"Ak'Zeloth\"# (62.20) I SKIP \"#NPCThe Demon Seed\"# ", x = 62, y = 20, zone = "The Barrens" },
			[4] = { str = "03) Run to XRs (Crossroads) (at 52.30) #HUNTER (If you're a hunter do step 4)#", x = 52, y = 30, zone = "The Barrens" },
			[5] = { str = "#HUNTER04) While on my way to XRs, I  abandon my crab and tame a Savannah Huntress cat, for my new pet.#" },
			[6] = { str = "05) Once at XRs (at 52.30) turn in #TURNIN\"Crossroads Conscription\"# Then accept all quests in XRs (which includes: #ACCEPT\"Meats to Orgrimmar\"# #ACCEPT\"Plainstrider Menace\"#   #ACCEPT\"The Forgotten Pools\"# #ACCEPT\"Raptor Thieves\"# #ACCEPT\"Wharfmaster Dizzywig\"# #ACCEPT\"Fungal Spores\"# #ACCEPT\"Disrupt the Attacks\"# #ACCEPT\"Supplies for the Crossroads\"# and #ACCEPT\"Harpy Raiders\"# on top of the watch tower).  Turn in #TURNIN\"Meats to Orgrimmar\"# i SKIP \"#NPCRide to Orgrimmar\"# ", x = 52, y = 30, zone = "The Barrens" },
			[7] = { str = "06) Make XRs your home." },
			[8] = { str = "07) Get FP (Flight Path)" },
			[9] = { str = "08) Then go do:  #DOQUEST\"Disrupt the Attacks\"# along with #DOQUEST\"Plainstrider Menace\"# and #DOQUEST\"Raptor Thieves\"# (all around 54.26).  NOTE: If you find #ACCEPT\"Chen's Empty Keg\"# accept it.", x = 54, y = 26, zone = "The Barrens" },
			[10] = { str = "09) Once #DOQUEST\"Disrupt the Attacks\"# is completed go turn it in (at 52.30) and accept #ACCEPT\"Supplies for the Crossroads\" ", x = 52, y = 30, zone = "The Barrens" },
			[11] = { str = "10) Go do #DOQUEST\"Supplies for the Crossroads\"# (at 56.26), then run back to Thork and #ACCEPT\"The Disruption Ends\"#, you'll be going back up to the razormanes one more time.", x = 56, y = 26, zone = "The Barrens" },
			[12] = { str = "11) If you find #ACCEPT\"Chen's Empty Keg\"# accept it." },
			[13] = { str = "12) Once #DOQUEST\"Plainstrider Menace\"# & #DOQUEST\"The Disruption Ends\"# and are complete..." },    
			[14] = { str = "13) Go to Ratchet, get the Flight Path there (63.37) and accept #ACCEPT\"Raptor Horns\"# #ACCEPT\"Samophlange\"# #ACCEPT\"Southsea Freebooters\"#  #ACCEPT\"The Guns of Northwatch\"# .  Turn in #TURNIN\"Chen's Empty Keg\"# if you have it ... accept the next part to it, and focus on doing this quest while throughout the Barrens.", x = 63, y = 37, zone = "The Barrens" },
			[15] = { str = "14) Grab the quest #ACCEPT\"WANTED: Baron Longshore\"# (the wanted sign by the bank)" },
			[16] = { str = "15) Turn in #TURNIN\"Wharfmaster Dizzywig\"# (goblin on the docks) accept #ACCEPT\"Miner's Fortune\"# " },
			[17] = { str = "16) Then go do #DOQUEST\"Southsea Freebooters\"# along with #DOQUEST\"WANTED: Baron Longshore\"# (along the shore just south of Ratchet)" },
			[18] = { str = "17) Once those are done, turn them in (at 63.36), accept new ones, then go do:", x = 63, y = 36, zone = "The Barrens" },
			[19] = { str = "18) #TURNIN\"The Missing Shipment\"# (just turn this in at the goblin at the docks) accept #ACCEPT\"The Missing Shipment\"# part2" },
			[20] = { str = "19) Run back, to Gazlowe (63.36), turn in #TURNIN\"The Missing Shipment\"# part2 accept #ACCEPT\"Stolen Booty\"# ", x = 63, y = 36, zone = "The Barrens" },
			[21] = { str = "20) Then go do #DOQUEST\"Stolen Booty\"# (south of Ratchet again) (Telescopic Lens=64.49, and Shipment of Boots=63.50)", x = 63, y = 50, zone = "The Barrens" },
			[22] = { str = "21) Once #DOQUEST\"Stolen Booty\"#  is completed hearth to XRs. (don't turn it in yet)" },
			[23] = { str = "22) Turn in #TURNIN\"The Disruption Ends\"# and #TURNIN\"Supplies for the Crossroads\"# " },
			[24] = { str = "23) Turn in #TURNIN\"Plainstrider Menace\"# (It should be done by now) accept #ACCEPT\"The Zhevra\"# .  Also accept #ACCEPT\"Consumed by Hatred\"# and #ACCEPT\"Lost in Battle\"# " },
			[25] = { str = "24) At this point, I make sure I have three/four 6 slot bags, if I don't, I buy them at the bag vendor." },
			[26] = { str = "25) Run west from XRs, go to the guy in the hut... (at 45.28)", x = 45, y = 28, zone = "The Barrens" },
			[27] = { str = "26) Accept: #ACCEPT\"Kolkar Leaders\"# and #ACCEPT\"Centaur Bracers\"# " },
			[28] = { str = "27) Then go start doing:" },
			[29] = { str = "28) #DOQUEST\"Kolkar Leaders\"# #DOQUEST\"Centaur Bracers\"# #DOQUEST\"Raptor Thieves\"# #DOQUEST\"The Zhevra\"# #DOQUEST\"Fungal Spores\"#  and  #DOQUEST\"The Forgotten Pools\"# (all of these are done just slightly north of where you are)" },
			[30] = { str = "29) Once #DOQUEST\"Kolkar Leaders\"# is done.. (Barak is at 43.24) ", x = 43, y = 24, zone = "The Barrens" },
			[31] = { str = "30) Go do: #DOQUEST\"Harpy Raiders\"# (at 38.17)", x = 38, y = 17, zone = "The Barrens" },
			[32] = { str = "31) Once #DOQUEST\"Harpy Raiders\"# is done, grind your way down into Stonetalon Mountains (at 35.27 in the Barrens)...", x = 35, y = 27, zone = "The Barrens" },
			--[33] = { str = "." },
			--[34] = { str = "." },
		}
	},

-----------15-16 Stonetalon Mountains
	--[102] = {
	[1516] = {
		title = "15-16 Stonetalon Mountains",
		--n = "15-16 Stonetalon Mountains",
		--pID = 101, nID = 103, 
		--itemCount = 9,
		items = {
			[1] = { str = "15-16 Stonetalon Mountains" },
			[2] = { str = "01) Accept #ACCEPT\"Goblin Invaders\"# (you should first accept #ACCEPT\"Spirits of Stonetalon\"# from Zor Lonetree in Orgrimmar, but this is a lvl13 quest. Grab it if you're in Orgrimmar at that level) and #ACCEPT\"Avenge My Village\"# (at 35.27 in the Barrens)", x = 35, y = 27, zone = "The Barrens" },
			[3] = { str = "02) Go do: #DOQUEST\"Avenge My Village\"# then turn it in." },
			[4] = { str = "03) Then do: #DOQUEST\"Kill Grundig Darkcloud\"# (he is at 73.86)", x = 73, y = 86, zone = "Stonetalon Mountains" },
			[5] = { str = "04) NOTE: I usually skip the escort quest there (#DOQUEST\"Protect Kaya\"# 73.85 in the hut), This quest can be a little tough, kill the Sorcerer first that pops out during the one battle you have to fight.  If it's too hard for you, you can skip it.", x = 73, y = 85, zone = "Stonetalon Mountains" },
			[6] = { str = "05) Turn in #TURNIN\"Kill Grundig Darkcloud\"# and #TURNIN\"Protect Kaya\"# if you did it (at 35.28 in the Barrens) ... accept #ACCEPT\"Kaya's Alive\"# ", x = 35, y = 28, zone = "The Barrens" },
			[7] = { str = "06) Then go back to the Barrens.." },
			--[8] = { str = "." },
			--[9] = { str = "." },
		}
	},

-----------16-20 Barrens PART1
	--[103] = {
	--[1620] = {
	[1618] = {
		title = "16-20 Barrens (part 1)",
		--n = "16-20 Barrens Part 1",
		--pID = 102, nID = 104, 
		--itemCount = 37,
		items = {
			[1] = { str = "16-20 Barrens Part 1" },
			[2] = { str = "01) Grind your way back to the guy in the hut (at 45.28)", x = 45, y = 28, zone = "The Barrens" },
			[3] = { str = "02) Turn in #TURNIN\"Kolkar Leaders\"# accept #ACCEPT\"Verog the Dervish\"# .  Also turn in #TURNIN\"Centaur Bracers\"# if it is done, if not don't worry." },
			[4] = { str = "03) Make sure you finish up #DOQUEST\"Raptor Thieves\"# #DOQUEST\"The Zhevra\"# #DOQUEST\"Fungal Spores\"# and #DOQUEST\"The Forgotten Pools\"# before returning to the XRs." },
			[5] = { str = "04) Run to XRs (Cross Roads at 52.30)", x = 52, y = 30, zone = "The Barrens" },
			[6] = { str = "05) Turn in ALL quests, grab ALL new ones..." },
			[7] = { str = "06) then do #ACCEPT\"Apothecary Zamah\"# Which has you run all the way to Thunder Bluff (TB) at the spirt rise cave. Do these along the way:" },
			[8] = { str = "07) Grind your way down south (to 49.50) and do #DOQUEST\"Lost in Battle\"# (Manrik's Wife)  She's laying dead by the hut, west of the bridge.", x = 49, y = 50, zone = "The Barrens" },
			[9] = { str = "08) Go down to Camp Taurajo (CT) accept #ACCEPT\"Tribes at War\"# (gnoll in the cage at 44.59), and get FP there. ", x = 44, y = 59, zone = "The Barrens" },
			[10] = { str = "09) Then do #DOQUEST\"Apothecary Zamah\"# Which has you run all the way to Thunder Bluff (TB) (in Mulgore at 39.27).", x = 39, y = 27, zone = "Mulgore" },
			[11] = { str = "10) Once at TB, go to #NPCweapon master# (40.62), #HUNTERget Guns and Staff skills. (I do this as a Hunter),# get what weapon skills you need for your class)" },
			[12] = { str = "11) Get new spells/abilities." },
			[13] = { str = "12) Turn in #TURNIN\"Apothecary Zamah\"# the cave below the spirit rise (at 29.29).", x = 29, y = 29, zone = "The Barrens" },
			[14] = { str = "13) Go to first aid guy at spirit rise to build up first aid." },
			[15] = { str = "14) Go up to the tower in middle of town to get FP, but DON'T fly back to XRs." },
			[16] = { str = "15) Hearth back to XRs." },
			[17] = { str = "16) Turn in #TURNIN\"Lost in Battle\"# " },
			[18] = { str = "17) Then go north west of XRs and do #DOQUEST\"Prowlers of the Barrens\"# (37.20)", x = 37, y = 20, zone = "The Barrens" },
			[19] = { str = "18) Then #DOQUEST\"Harpy Lieutenants\"# (38.14)", x = 38, y = 14, zone = "The Barrens" },
			[20] = { str = "19) Then grind your way east and do #DOQUEST\"Samophlange\"# (52.11) complete the whole chain, which in the end has you kill the goblin for the key. " },
			[21] = { str = "20) Then go east to Sludge Fen and do #DOQUEST\"Ignition\"# (56.8)", x = 56, y = 8, zone = "The Barrens" },
			[22] = { str = "21) Then do #DOQUEST\"The Escape\"# (#VIDEOSee video on how I do Ignition and Escape#)" },
			[23] = { str = "22) Then go north-east and do #DOQUEST\"Miner's Fortune\"# (61.5)", x = 61, y = 5, zone = "The Barrens" },
			[24] = { str = "23) Then grind your way south to Ratchet (63.37)...", x = 63, y = 37, zone = "The Barrens" },
			[25] = { str = "24) Turn in #TURNIN\"Stolen Booty\"#  #TURNIN\"Samophlange\"# #TURNIN\"The Escape\"# ... accept #ACCEPT\"Ziz Fizziks\"# ... and SKIP \"#NPCWenikee Boltbucket\"# " },
			[26] = { str = "25) Turn in #TURNIN\"Miner's Fortune\"# " },
			[27] = { str = "26) Then go west of ratchet and do #DOQUEST\"The Stagnant Oasis\"# and #DOQUEST\"Verog the Dervish\"# (at 54.43)", x = 54, y = 43, zone = "The Barrens" },
			[28] = { str = "27) Then run to XRs (52.30)..", x = 52, y = 30, zone = "The Barrens" },
			[29] = { str = "28) Turn in #TURNIN\"Prowlers of the Barrens\"# #TURNIN\"Harpy Lieutenants\"# and #TURNIN\"The Stagnant Oasis\"# ... accept #ACCEPT\"Altered Beings\"# #ACCEPT\"Echeyakee\"# #ACCEPT\"Serena Bloodfeather\"# #ACCEPT\"Report to Kadrak\"# and #ACCEPT\"Egg Hunt\"# " },
			[30] = { str = "29) Go west of XRs (45.28), to turn in: #TURNIN\"Centaur Bracers\"# and #TURNIN\"Verog the Dervish\"# ... I SKIP \"#NPCHezrul Bloodmark\"# ", x = 45, y = 28, zone = "The Barrens" },
			[31] = { str = "30) Then grind your way north and do: #DOQUEST\"Serena Bloodfeather\"# (at 38.11)", x = 38, y = 11, zone = "The Barrens" },
			[32] = { str = "31) Then go east (grind mobs along the way) and do #DOQUEST\"Echeyakee\"# (coords are at 55.17) ", x = 55, y = 17, zone = "The Barrens" },
			[33] = { str = "32) Hearth to XRs." },
			[34] = { str = "33) Turn in #TURNIN\"Echeyakee\"# ... accept #ACCEPT\"The Angry Scytheclaws\"# " },
			[35] = { str = "34) Turn in #TURNIN\"Serena Bloodfeather\"# accept #ACCEPT\"Letter to Jin'Zil\"# .  Make sure that #ACCEPT\"Consumed by Hatred\"# is also accepted." },
			--[36] = { str = "." },
			--[37] = { str = "." },
		}
	},

-----------16-20 Barrens PART2
	--[104] = {
	--[1620] = {
	[1820] = {
		title = "16-20 Barrens (part 2)",
		--n = "16-20 Barrens Part 2",
		--pID = 103, nID = 201, 
		--itemCount = 31,
		items = {
			[1] = { str = "16-20 Barrens Part 2" },
			[2] = { str = "01) Go down south and do:" },
			[3] = { str = "02) #DOQUEST\"Altered Beings\"#   (55.42)", x = 55, y = 42, zone = "The Barrens" },
			[4] = { str = "03) #DOQUEST\"Raptor Horns\"# along with #DOQUEST\"Stolen Silver\"#   (at 57.54)  ", x = 57, y = 54, zone = "The Barrens" },
			[5] = { str = "04) #DOQUEST\"The Angry Scytheclaws\"#   (51.46)", x = 51, y = 46, zone = "The Barrens" },
			[6] = { str = "05) #DOQUEST\"Tribes at War\"# along with #DOQUEST\"Consumed by Hatred\"#   (at 51.54)", x = 51, y = 54, zone = "The Barrens" },
			[7] = { str = "06) Then grind your way to Camp Taurajo (45.58)", x = 45, y = 58, zone = "The Barrens" },
			[8] = { str = "07) Accept #ACCEPT\"Weapons of Choice\"# " },
			[9] = { str = "08) Go to gnoll in the cage..." },
			[10] = { str = "09) Turn in #TURNIN\"Tribes at War\"# accept #ACCEPT\"Blood Shards of Agamaggan\"# and #ACCEPT\"Betrayal from Within\"# " },
			[11] = { str = "10) Turn in #TURNIN\"Blood Shards of Agamaggan\"# " },
			[12] = { str = "11) Turn in 10 bloodshards for #TURNIN\"Spirit of the Wind\"# (repeatable quest) for fast run speed." },
			[13] = { str = "12) At this point, you should be about half way to level 20." },
			[14] = { str = "13) Now comes the fun part:  #NPCWailing Caverns# Instance! (at 46.36).  You will need a full group to do this.  OPTIONAL: GRIND all the way to level 20! (which is what I do, but it's not recommended).  I grind away at beasts and brisstlebacks just north of CT.  " },
			[15] = { str = "14) Keep an eye out for the mobs named #NPCLakota'mani# (a big grey kodo around 45.53) and #NPCOwatanka#. They drops #NPCHoof of Lakota'mani# which starts #DOQUEST\"Lakota'mani\"# and #NPCOwatanka's Tailspike# which starts #DOQUEST\"Owatanka\"#.  Turn these in at CT when you get the chance." },
			[16] = { str = "15) Once you are at least 5 bars away from 20, run to XRs..." },
			[17] = { str = "16) Turn in #TURNIN\"Stolen Silver\"# #TURNIN\"Consumed by Hatred\"# #TURNIN\"Altered Beings\"# and #TURNIN\"The Angry Scytheclaws\"# ...accept all new quests.  SKIP \"#NPCMura Runetotem\"# .  You should be lvl 20 now." },
			[18] = { str = "17) Fly to Orgrimmar, get new spells/abilities." },
			[19] = { str = "18) Grab #ACCEPT\"The Ashenvale Hunt\"# quest" },
			[20] = { str = "19) Hearth back to XRs." },
			[21] = { str = "20) Fly to Ratchet..." },
			[22] = { str = "21) Turn in #TURNIN\"Chen's Empty Keg\"# (if you did it, if not don't worry) ... accept the next part to it." },
			[23] = { str = "22) Turn in #TURNIN\"Raptor Horns\"# accept #ACCEPT\"Deepmoss Spider Eggs\"# and #ACCEPT\"Ziz Fizziks\"# " },
			[24] = { str = "23) Then go do: #DOQUEST\"The Guns of Northwatch\"# (at 60.55)  (#VIDEOSee complete video on this quest along with the escort quest#)", x = 60, y = 55, zone = "The Barrens" },
			[25] = { str = "24) Then once #DOQUEST\"The Guns of Northwatch\"# is done, do:" },
			[26] = { str = "25) #DOQUEST\"Free From the Hold\"# (escort quest)" },
			[27] = { str = "26) Turn in both quests at Ratchet, then.." },
			[28] = { str = "27) Hearth to XRs. (if hearth stone is still on a cooldown, fly to XRs)" },
			[29] = { str = "28) Run west into Stonetalon Mountains..." },
			--[30] = { str = "." },
			--[31] = { str = "." },
    	}
	},

}