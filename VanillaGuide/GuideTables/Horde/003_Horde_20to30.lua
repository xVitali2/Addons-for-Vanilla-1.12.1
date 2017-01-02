--[[--------------------------------------------------
003_Horde_20to30.lua
Authors: mrmr
Version: 1.04.2
------------------------------------------------------
Description: Guide Serie - 003 From Lvl 20 to Lvl 30
    1.04.1
        -- First Release
            Horde's Guide
            from level 20 to lever 30
    1.04.2
    	-- no changes in here for this revision
------------------------------------------------------
Connection:
--]]--------------------------------------------------

Table_003_Horde_20to30 = {
-----------20-21 Stonetalon Mountains
	--[201] = {
	[2021] = {
		title = "20-21 Stonetalon Mountains",
		--n = "20-21 Stonetalon Mountains",
		--pID = 104, nID = 202, 
		--itemCount = 20,
		items = {
			[1] = { str = "20-21 Stonetalon Mountains" },
			[2] = { str = "01) Run to Malaka'Jin (at 71.94)", x = 71, y = 94, zone = "Stonetalon Mountains" },
			[3] = { str = "02) Accept #ACCEPT\"Blood Feeders\"# " },
			[4] = { str = "03) Turn in #TURNIN\"Letter to Jin'Zil\"# (74.97 in the cave) ... accept #ACCEPT\"Jin'Zil's Forest Magic\"# ", x = 74, y = 97, zone = "Stonetalon Mountains" },
			[5] = { str = "04) Then go accept #ACCEPT\"Arachnophobia\"# (wanted poster is at 59.75)", x = 59, y = 75, zone = "Stonetalon Mountains" },
			[6] = { str = "05) Go do: #DOQUEST\"Blood Feeders\"# along with #DOQUEST\"Deepmoss Spider Eggs\"# and #DOQUEST\"Arachnophobia\"# (around 54.76) NOTE: you can skip Arachnophobia for now, you'll return here later...", x = 54, y = 76, zone = "Stonetalon Mountains" },
			[7] = { str = "06) Then turn in #TURNIN\"Ziz Fizziks\"# (the goblin in the hut at Windshear Crag, 58.62) ... accept #ACCEPT\"Super Reaper 6000\"# ", x = 58, y = 62, zone = "Stonetalon Mountains" },
			[8] = { str = "07) Then do: #DOQUEST\"Goblin Invaders\"# and #DOQUEST\"Super Reaper 6000\"# (the mobs are just north in Windshear Crag)" },
			[9] = { str = "08) Then turn in #TURNIN\"Super Reaper 6000\"# (58.62) ... accept #ACCEPT\"Further Instructions\"# ", x = 58, y = 62, zone = "Stonetalon Mountains" },
			[10] = { str = "09) Run to Sun Rock Retreat at 46.59.", x = 46, y = 59, zone = "Stonetalon Mountains" },
			[11] = { str = "10) Turn in #TURNIN\"Arachnophobia\"# and #TURNIN\"Kaya's Alive\"# if you did the escort quest" },
			[12] = { str = "11) Get FP there." },
			[13] = { str = "12) Run up the little #VIDEOpathway# and accept #ACCEPT\"Boulderslide Ravine\"# and #ACCEPT\"Trouble in the Deeps\"# (at 47.64)", x = 47, y = 64, zone = "Stonetalon Mountains" },
			[14] = { str = "13) Then go do #DOQUEST\"Boulderslide Ravine\"# (at 61.92)", x = 61, y = 92, zone = "Stonetalon Mountains" },
			[15] = { str = "14) Then turn in #TURNIN\"Blood Feeders\"# (71.95)", x = 71, y = 95, zone = "Stonetalon Mountains" },
			[16] = { str = "15) Turn in #TURNIN\"Goblin Invaders\"# (at 35.27 in the Barrens) ... accept #ACCEPT\"Shredding Machines\"#   (I SKIP \"#NPCThe Elder Crone\"# )", x = 35, y = 27, zone = "The Barrens" },
			[17] = { str = "16) Hearth to XRs." },
			[18] = { str = "17) Run north to Ashenvale (stopping along the way to turn in #TURNIN\"Report to Kadrak\"# (at 48.5) but SKIP \"#NPCThe Warsong Reports\"# ", x = 48, y = 5, zone = "The Barrens" },
			--[19] = { str = "." },
			--[20] = { str = "." },
		}
	},

-----------21-21 Ashenvale
	--[202] = {
	[2121] = {
		title = "21-21 Ashenvale",
		--n = "21-21 Ashenvale",
		--pID = 201, nID = 203,
		--itemCount = 11,
		items = {
			[1] = { str = "21-21 Ashenvale" },
			[2] = { str = "01) Run to Splintertree Post (at 73.65)", x = 73, y = 65, zone = "Ashenvale" },
			[3] = { str = "02) Turn in #TURNIN\"The Ashenvale Hunt\"# .  Then accept and turn in #TURNIN\"The Ashenvale Hunt\"# again." },
			[4] = { str = "03) Get FP in Splintertree Post." },
			[5] = { str = "04) Run all the way to Zoram Strand (at 13.31), grind mobs along the way.", x = 13, y = 31, zone = "Ashenvale" },
			[6] = { str = "05) Get FP there. (12.33).  Turn in #TURNIN\"Trouble in the Deeps\"# .. i SKIP \"#NPCThe Essence of Aku'Mai\"# ", x = 12, y = 33, zone = "Ashenvale" },
			[7] = { str = "06) Do the following quests:" },
			[8] = { str = "07) Accept and do #DOQUEST\"Naga at the Zoram Strand\"# then turn it in." },
			[9] = { str = "08) Hearth back to XRs, if hearth stone is still on a cooldown, fly there." },
			--[10] = { str = "." },
			--[11] = { str = "." },
		}
	},

-----------22-23 Southern Barrens
	--[203] = {
	[2223] = {
		title = "22-23 Southern Barrens",
		--n = "22-23 Southern Barrens",
		--pID = 202, nID = 204,
		--itemCount = 19,
		items = {
			[1] = { str = "22-23 Southern Barrens" },
			[2] = { str = "01) Fly to CT." },
			[3] = { str = "02) Turn in #TURNIN\"Jorn Skyseer\"# ... accept #ACCEPT\"Ishamuhale\"# and #ACCEPT\"Melor Sends Word\"# " },
			[4] = { str = "03) Make CT your home." },
			[5] = { str = "04) I give bloodshards to the gnoll in the cage to get increased agility/spirit." },
			[6] = { str = "05) Run south and keep an eye out for the mob named #NPCOwatanka# (around 45.62), he drops 'Owatanka's Tailspike' which starts #ACCEPT\"Owatanka\"# ", x = 45, y = 62, zone = "The Barrens" },
			[7] = { str = "06) #DOQUEST\"Egg Hunt\"# (44.71)", x = 44, y = 71, zone = "The Barrens" },
			[8] = { str = "07) #DOQUEST\"Chen's Empty Keg\"# (if you have it)" },
			[9] = { str = "08) #DOQUEST\"Betrayal from Within\"# and #DOQUEST\"Weapons of Choice\"# (43.79)", x = 43, y = 79, zone = "The Barrens" },
			[10] = { str = "09) Accept #ACCEPT\"Gann's Reclamation\"# from #NPCGann Stonespire#.  Then go do it (at 46.86). Then turn it in, accept #ACCEPT\"Revenge of Gann\"# ", x = 46, y = 86, zone = "The Barrens" },
			[11] = { str = "10) Hearth back to Camp Taurajo, turn in #TURNIN\"Weapons of Choice\"# and #TURNIN\"Betrayal from Within\"# ... accept #ACCEPT\"Betrayal from Within\"# part2" },
			[12] = { str = "11) Fly to XR." },
			[13] = { str = "12) Turn in #TURNIN\"Betrayal from Within\"# part2 and #TURNIN\"Egg Hunt\"# " },
			[14] = { str = "13) Do #DOQUEST\"Ishamuhale\"# (at 60.32)", x = 60, y = 32, zone = "The Barrens" },
			[15] = { str = "14) Turn in #TURNIN\"Further Instructions\"# (at Ratchet 63.37) ... accept #ACCEPT\"Further Instructions\"# part2", x = 63, y = 37, zone = "The Barrens" },
			[16] = { str = "15) Turn in #TURNIN\"Deepmoss Spider Eggs\"# and #TURNIN\"Chen's Empty Keg\"# " },
			[17] = { str = "16) Fly to Stonetalon Mountains..." },
			--[18] = { str = "." },
			--[19] = { str = "." },
		}
	},

-----------23-25 Stonetalon Mountains
	--[204] = {
	[2325] = {
		title = "23-25 Stonetalon Mountains",
		--n = "23-25 Stonetalon Mountains",
		--pID = 203, nID = 205,
		--itemCount = 24,
		items = {
			[1] = { str = "23-25 Stonetalon Mountains" },
			[2] = { str = "01) Accept all quests at Sun Rock Retreat (which include: #ACCEPT\"Cenarius' Legacy\"# #ACCEPT\"Cycle of Rebirth\"# and #ACCEPT\"Harpies Threaten\"# )..." },
			[3] = { str = "02) Make Sun Rock Retreat your home." },
			[4] = { str = "03) Turn in #TURNIN\"Boulderslide Ravine\"# .. I SKIP \"#NPCEarthen Arise\"# (accept #ACCEPT\"Elemental War\"# there though)" },
			[5] = { str = "04) Do:" },
			[6] = { str = "05) #DOQUEST\"Cycle of Rebirth\"#   (pick up the seeds around 48.41)", x = 48, y = 41, zone = "Stonetalon Mountains" },
			[7] = { str = "06) #DOQUEST\"Cenarius' Legacy\"#   (done at around 35.14)", x = 35, y = 14, zone = "Stonetalon Mountains" },
			[8] = { str = "07) #DOQUEST\"Jin'Zil's Forest Magic\"# (the mobs are around the path at 45.27, and the area at 34.14)", x = 45, y = 27, zone = "Stonetalon Mountains" },
			[9] = { str = "08) Go back to Sun Rock Retreat and turn in #TURNIN\"Cycle of Rebirth\"# ... accept #ACCEPT\"New Life\"# " },
			[10] = { str = "09) Turn in #TURNIN\"Cenarius' Legacy\"# ... accept  #ACCEPT\"Ordanus\"# " },
			[11] = { str = "#HUNTER10) NOTE: I skip getting my level 24 spells/abilities (cause there's little that are useful at this level)#" },
			[12] = { str = "11) Go turn in #TURNIN\"Further Instructions\"# part2 (58.62)... accept #ACCEPT\"Gerenzo Wrenchwhistle\"# ", x = 58, y = 62, zone = "Stonetalon Mountains" },
			[13] = { str = "12) Go do #DOQUEST\"Gerenzo Wrenchwhistle\"# (at 64.41)  and #DOQUEST\"Shredding Machines\"#   (kill #NPCXT:4# and #NPCXT:9#)", x = 64, y = 41, zone = "Stonetalon Mountains" },
			[14] = { str = "13) Then turn in #TURNIN\"Gerenzo Wrenchwhistle\"# . (58.62). If you couldn't do Arachnophobia, do it now!", x = 58, y = 62, zone = "Stonetalon Mountains" },
			[15] = { str = "14) Run down south and turn in #TURNIN\"Jin'Zil's Forest Magic\"# (74.97)", x = 74, y = 97, zone = "Stonetalon Mountains" },
			[16] = { str = "15) Turn in #TURNIN\"Shredding Machines\"# (in the Barrens at 35.27)", x = 35, y = 27, zone = "The Barrens" },
			[17] = { str = "16) Hearth back to Sun Rock Retreat and turn in #TURNIN\"Arachnophobia\"# if you just did it." },
			[18] = { str = "17) Stock back up on food/water." },
			[19] = { str = "18) Go do #DOQUEST\"Harpies Threaten\"# along with #DOQUEST\"Elemental War\"# and #DOQUEST\"New Life\"# (all at the Charred Vale, 32.67)", x = 32, y = 67, zone = "Stonetalon Mountains" },
			[20] = { str = "19) Once they are all done, make sure you are at least 5 bars away from level 25, so you may have to grind a little.  " },
			[21] = { str = "20) Then go turn them all in, and accept #ACCEPT\"Calling in the Reserves\"# " },
			[22] = { str = "21) Then fly to CT..." },
			--[23] = { str = "." },
			--[24] = { str = "." },
		}
	},

-----------25-25 Southern Barrens2
	--[205] = {
	[2525] = {
		title = "25-25 Southern Barrens",
		--n = "25-25 Southern Barrens",
		--pID = 204, nID = 206,
		--itemCount = 14,
		items = {
			[1] = { str = "25-25 Southern Barrens" },
			[2] = { str = "01) Turn in #TURNIN\"Ishamuhale\"# ... accept #ACCEPT\"Enraged Thunder Lizards\"# " },
			[3] = { str = "02) Make CT your home." },
			[4] = { str = "03) Accept #ACCEPT\"A New Ore Sample\"# (need to be lvl 25 to get this)" },
			[5] = { str = "04) Go down and do:" },
			[6] = { str = "05) #DOQUEST\"Enraged Thunder Lizards\"# " },
			[7] = { str = "06) You should find the mob #NPCWashte Pawne#, he drops 'Washte Pawne Feather' which starts #ACCEPT\"Washte Pawne\"# " },
			[8] = { str = "07) #DOQUEST\"Revenge of Gann\"# (at 47.85) Once done, Turn it in, accept the next part...", x = 47, y = 85, zone = "The Barrens" },
			[9] = { str = "08) Do #DOQUEST\"Revenge of Gann\"# Part 3 (at 46.85), then turn it in.", x = 46, y = 85, zone = "The Barrens" },
			[10] = { str = "09) Head south down the path to the Great Lift (at 44.91 in the barrens) and turn in #TURNIN\"Calling in the Reserves\"# ", x = 44, y = 91, zone = "The Barrens" },
			[11] = { str = "10) Accept #ACCEPT\"Message to Freewind Post\"# " },
			[12] = { str = "11) Run to Freewind Post... (45.50 in Thousand Needles)", x = 45, y = 50, zone = "Thousand Needles" },
			--[13] = { str = "." },
			--[14] = { str = "." },
		}
	},

-----------25-26 Thousand Needles
	--[206] = {
	[2526] = {
		title = "25-26 Thousand Needles",
		--n = "25-26 Thousand Needles",
		--pID = 205, nID = 207,
		--itemCount = 23,
		items = {
			[1] = { str = "25-26 Thousand Needles" },
			[2] = { str = "01) Turn in #TURNIN\"Message to Freewind Post\"# accept #ACCEPT\"Pacify the Centaur\"# " },
			[3] = { str = "02) Accept #ACCEPT\"Wanted - Arnak Grimtotem\"# #ACCEPT\"Alien Egg\"# and #ACCEPT\"Wind Rider\"# " },
			[4] = { str = "03) Get FP there." },
			[5] = { str = "04) Go do (in the following order):" },
			[6] = { str = "05) #DOQUEST\"Pacify the Centaur\"# (mobs are just north)" },
			[7] = { str = "06) #DOQUEST\"Test of Faith\"# (the cave at 52.43)", x = 52, y = 43, zone = "Thousand Needles" },
			[8] = { str = "07) #DOQUEST\"A New Ore Sample\"#   (if you can't find the drop, just skip it for now)" },
			[9] = { str = "08) #DOQUEST\"Alien Egg\"# (this egg has 4 possible spawn points, either at around: 52.56 / 45.63 / 41.60 / 50.56, and there might be more, just check around those areas.)", x = 52, y = 56, zone = "Thousand Needles" },
			[10] = { str = "09) If you're not level 26 (or two bars away from it), grind till you are." },
			[11] = { str = "10) Go up to Freewind Post (45.50)..", x = 45, y = 50, zone = "Thousand Needles" },
			[12] = { str = "11) Turn in #TURNIN\"Pacify the Centaur\"# ... accept #ACCEPT\"Grimtotem Spying\"# " },
			[13] = { str = "12) Turn in #TURNIN\"Alien Egg\"# ... accept #ACCEPT\"Serpent Wild\"# " },
			[14] = { str = "13) Hearth to Camp Taurajo." },
			[15] = { str = "14) Turn in #TURNIN\"Enraged Thunder Lizards\"# and #TURNIN\"Washte Pawne\"# ... accept #ACCEPT\"Cry of the Thunderhawk\"# " },
			[16] = { str = "15) Turn in #TURNIN\"A New Ore Sample\"# " },
			[17] = { str = "16) Go do #DOQUEST\"Cry of the Thunderhawk\"# then turn it in ... I SKIP \"#NPCMahren Skyseer\"# " },
			[18] = { str = "17) Fly to Thunder Bluff to get new spells/abilities." },
			[19] = { str = "18) Turn in #TURNIN\"Melor Sends Word\"# (61.80 on the Hunter Rise)... accept #ACCEPT\"Steelsnap\"# ", x = 61, y = 80, zone = "Thunder Bluff" },
			[20] = { str = "19) Accept #ACCEPT\"The sacred Flame\"# (55.51)", x = 55, y = 51, zone = "Thunder Bluff" },
			[21] = { str = "20) Fly to Splintertree Post, Ashenvale..." },
			--[22] = { str = "." },
			--[23] = { str = "." },
		}
	},

-----------26-27 Ashenvale
	--[207] = {
	[2627] = {
		title = "26-27 Ashenvale",
		--n = "26-27 Ashenvale",
		--pID = 206, nID = 208,
		--itemCount = 26,
		items = {
			[1] = { str = "26-27 Ashenvale" },
			[2] = { str = "01) Make it your home." },
			[3] = { str = "02) Do the following order:" },
			[4] = { str = "03) Accept all the quests, which include: #ACCEPT\"Stonetalon Standstill\"# #ACCEPT\"Satyr Horns\"# #ACCEPT\"Ashenvale Outrunners\"# (accept this at 71.68).  Make sure #ACCEPT\"The Ashenvale Hunt\"# is turned in at #NPCSenani Thunderheart# (you can accept this quest right at the NPC itself). Note: I SKIP \"#NPCWarsong Supplies\"# and \"#NPCThe Lost Pages\"# ", x = 71, y = 68, zone = "Ashenvale" },
			[5] = { str = "04) Kill the first of the three mobs related to the Ashenvale hunt:" },
			[6] = { str = "05) #DOQUEST\"Sharptalon's Claw\"# (Kill #NPCSharptalon# (patrols around 74.70), then he drops the item that starts this quest) (hint: easy way to kill it (he's lvl 31 mob), is to bring his health to a 3rd left, then drag him into the guards at Splintertree Post, they will finish em). ", x = 74, y = 70, zone = "Ashenvale" },
			[7] = { str = "06) Do: #DOQUEST\"Ashenvale Outrunners\"# (around 71.72)#HUNTER  (use track hidden, to find them better). # Once the quest is completed, turn it in when you get the chance.", x = 71, y = 72, zone = "Ashenvale" },
			[8] = { str = "07) Then go slightly west and do #DOQUEST\"Torek's Assault\"# (starts at 68.75)", x = 68, y = 75, zone = "Ashenvale" },
			[9] = { str = "08) Then go do #DOQUEST\"Stonetalon Standstill\"# (the lake at 53.70) *find and kill #NPCTideress# he drops an item which starts: #ACCEPT\"The Befouled Element\"# ", x = 53, y = 70, zone = "Ashenvale" },
			[10] = { str = "09) Kill #NPCUrsangous#, (around 42.67) #DOQUEST\"Ursangous's Paw\"# (Ashenvale hunt)", x = 42, y = 67, zone = "Ashenvale" },
			[11] = { str = "10) Kill #NPCShadumbra# (around 56.54) #DOQUEST\"Shadumbra's Head\"# (Ashenvale hunt)", x = 56, y = 54, zone = "Ashenvale" },
			[12] = { str = "11) #DOQUEST\"The sacred Flame\"# (first find a phial killing the dryads at 61.52, then fill it at the moonwell at 60.72)", x = 60, y = 72, zone = "Ashenvale" },
			[13] = { str = "12) Hearth to Splintertree Post to turn in #TURNIN\"Stonetalon Standstill\"# #TURNIN\"The Befouled Element\"# (accept #ACCEPT\"Je'neu of the Earthen Ring\"# ) #TURNIN\"Torek's Assault\"# and all three of the 'Ashenvale Hunt' quests, then accept and complete #TURNIN\"The Hunt Completed\"# " },
			[14] = { str = "13) Fly to Zoram Strand, and turn in #TURNIN\"Je'neu of the Earthen Ring\"# " },
			[15] = { str = "14) Accept and do #DOQUEST\"Vorsha the Lasher\"# .  Once done go back and turn it in." },
			[16] = { str = "15) Accept and do: #DOQUEST\"Between a Rock and a Thistlefur\"# (34.37) and #DOQUEST\"Troll Charm\"# (the cave is at 38.30).  #VIDEONOTE:#  While you are in the cave, there is an escort quest (a white bear-formed druid in a cage) called #DOQUEST\"Freedom to Ruul\"# , try to do this quest, you may have to fight 3-5 mobs at once several times, if you fail then it can be skipped.", x = 34, y = 37, zone = "Ashenvale" },
			[17] = { str = "16) Once they are both completed, go turn in #TURNIN\"Between a Rock and a Thistlefur\"# and #TURNIN\"Troll Charm\"# (back at the Zoram Strand), then hearth back to Splintertree Post.  Turn in #TURNIN\"Freedom to Ruul\"# (if you did it)" },
			[18] = { str = "17) If im not level 27 i'll grind till I am." },
			[19] = { str = "18) Go do #DOQUEST\"Ordanus\"# (61.52) (#VIDEOfight your way to him, just kill the guy, grab his head and jump out of there!#)", x = 61, y = 52, zone = "Ashenvale" },
			[20] = { str = "19) Go do: #DOQUEST\"Satyr Horns\"# (done at the Night Run, 67.53)  (entrance to the area is around 64.42).", x = 67, y = 53, zone = "Ashenvale" },
			[21] = { str = "20) Run back to Splintertree Post (don't hearth).  Turn in #TURNIN\"Satyr Horns\"#" },
			[22] = { str = "21) Fly to Stonetalon Mountains..." },
			--[23] = { str = "." },
			--[24] = { str = "." },
		}
	},

-----------27-27 Stonetalon Mountains
	--[208] = {
	[2727] = {
		title = "27-27 Stonetalon Mountains",
		--n = "27-27 Stonetalon Mountains",
		--pID = 207, nID = 209,
		--itemCount = 11,
		items = {
			[1] = { str = "27-27 Stonetalon Mountains" },
			[2] = { str = "01) Turn in #TURNIN\"Ordanus\"# ... I SKIP \"#NPCThe Den\"# " },
			[3] = { str = "02) Make Sun Rock Retreat your home." },
			[4] = { str = "03) Accept and do #DOQUEST\"Bloodfury Bloodline\"# , go kill Bloodfury Ripper (at 30.63) (grinding mobs along the way) , then hearth back.." },
			[5] = { str = "04) Turn #TURNIN\"Bloodfury Bloodline\"# in." },
			[6] = { str = "05) Fly to Thunder Bluff." },
			[7] = { str = "06) Make Thunder Bluff your home." },
			[8] = { str = "07) Turn in #TURNIN\"The sacred Flame\"# (54.51 in TB)... accept #ACCEPT\"The sacred Flame\"# part2", x = 54, y = 51, zone = "Thunder Bluff" },
			[9] = { str = "08) Fly to Thousand Needles..." },
			--[10] = { str = "." },
			--[11] = { str = "." },
		}
	},

-----------27-29 Thousand Needles
	--[209] = {
	[2729] = {
		title = "27-29 Thousand Needles",
		--n = "27-29 Thousand Needles",
		--pID = 208, nID = 210,
		--itemCount = 37,
		items = {
			[1] = { str = "27-29 Thousand Needles" },
			[2] = { str = "01) Turn in #TURNIN\"The sacred Flame\"# ... accept #ACCEPT\"The sacred Flame\"# part3" },
			[3] = { str = "02) I do the following order:" },
			[4] = { str = "03) #DOQUEST\"The sacred Flame\"# (charge the brazier in the cave at 44.37)  ", x = 44, y = 37, zone = "Thousand Needles" },
			[5] = { str = "04) Go to Whitereach Post (21.32), accept #ACCEPT\"Hypercapacitor Gizmo\"# , Turn in #TURNIN\"Serpent Wild\"# ...accept #ACCEPT\"Sacred Fire\"# ", x = 21, y = 32, zone = "Thousand Needles" },
			[6] = { str = "05) Go do: #DOQUEST\"Sacred Fire\"# (35.36)", x = 35, y = 36, zone = "Thousand Needles" },
			[7] = { str = "06) #DOQUEST\"Wind Rider\"# (11.36)", x = 11, y = 36, zone = "Thousand Needles" },
			[8] = { str = "07) #DOQUEST\"Homeward Bound\"# (escort starts at 17.40)  (if the Elite gets in the way, skip it)", x = 17, y = 40, zone = "Thousand Needles" },
			[9] = { str = "08) #DOQUEST\"Steelsnap\"# (Steelsnap patrols around 16.25)  ", x = 16, y = 25, zone = "Thousand Needles" },
			[10] = { str = "09) Hearth to Thunder Bluff." },
			[11] = { str = "10) Get new spells/abilities." },
			[12] = { str = "11) Turn in #TURNIN\"Steelsnap\"# (on Hunter Rise) ... accept #ACCEPT\"Frostmaw\"# " },
			[13] = { str = "12) Turn in #TURNIN\"Sacred Fire\"# (on Elder Rise) ... accept #ACCEPT\"Arikara\"# " },
			[14] = { str = "13) Fly back to 1K Needles." },
			[15] = { str = "14) Make Freewind Post your home." },
			[16] = { str = "15) Turn in #TURNIN\"The sacred Flame\"# and #TURNIN\"Wind Rider\"# " },
			[17] = { str = "16) Go to the Darkcloud Pinnacle (the entrance ramp is at 31.36) and do the following quests: #DOQUEST\"Grimtotem Spying\"# (the notes are up in the rises at 31.32, 33.39, and 39.41)", x = 31, y = 36, zone = "Thousand Needles" },
			[18] = { str = "17) #DOQUEST\"Arikara\"# (done up at 37.35) ", x = 37, y = 35, zone = "Thousand Needles" },
			[19] = { str = "18) #DOQUEST\"Wanted - Arnak Grimtotem\"# (he is up at 38.27)", x = 38, y = 27, zone = "Thousand Needles" },
			[20] = { str = "19) #DOQUEST\"Free at Last\"# (escort quest starts up at 38.27)", x = 38, y = 27, zone = "Thousand Needles" },
			[21] = { str = "20) Go to Whitereach Post (21.32), turn in #TURNIN\"Arikara\"# and #TURNIN\"Homeward Bound\"#", x = 21, y = 32, zone = "Thousand Needles" },
			[22] = { str = "21) You should be level 29 by now, if not grind to level 29, I grind away at centuars around Camp E'Thok (18.23)", x = 18, y = 23, zone = "Thousand Needles" },
			[23] = { str = "22) Then do #DOQUEST\"Hypercapacitor Gizmo\"# (Elite) (kill mobs around the cage, at 22.24, free him, #HUNTERuse immolation trap/fear# to kill it)  ", x = 22, y = 24, zone = "Thousand Needles" },
			[24] = { str = "23) Kill the #NPCGalak Messenger#, he drops 'Assassination Note' which starts #ACCEPT\"Assassination Plot\"# Turn in for Easy XP.  Also turn in #TURNIN\"Hypercapacitor Gizmo\"#" },
			[25] = { str = "24) Then do: #DOQUEST\"Protect Kanati Greycloud\"# " },
			[26] = { str = "25) If you are not at least 4 bars from level 30, grind until you are.  Then hearth back to Freewind Post." },
			[27] = { str = "26) Turn in #TURNIN\"Free at Last\"# #TURNIN\"Wanted - Arnak Grimtotem\"# #TURNIN\"Grimtotem Spying\"#" },
			[28] = { str = "27) NOTE: I skip \"#NPCTest of Endurance\"# " },
			[29] = { str = "28) Fly to Orgrimmar" },
			[30] = { str = "29) Make Orgrimmar your home." },
			[31] = { str = "30) Get new spells/abilities." },
			[32] = { str = "31) Go to Undercity (UC).  You need to get on the zeppelin just right outside of Orgrimmar." },
			[33] = { str = "32) Run to Tarren Mill in Hillsbrad Foothills.. (You can just bypass the UC for now if you like and just follow the path south out of Tirisfal Glades and into Silverpine Forest)" },
			--[36] = { str = "." },
			--[37] = { str = "." },
		}
	},

-----------29-30 Hillsbrad Foothills
	--[210] = {
	[2930] = {
		title = "29-30 Hillsbrad Foothills",
		--n = "29-30 Hillsbrad Foothills",
		--pID = 209, nID = 301,
		--itemCount = 19,
		items = {
			[1] = { str = "29-30 Hillsbrad Foothills" },
			[2] = { str = "01) accept #ACCEPT\"Time To Strike\"# (at the Southpoint Tower, right when u enter Hillsbrad)" },
			[3] = { str = "02) Once at Tarren Mill:" },
			[4] = { str = "03) Turn in #TURNIN\"Time To Strike\"# " },
			[5] = { str = "04) Accept #ACCEPT\"Helcular's Revenge\"# " },
			[6] = { str = "05) Accept #ACCEPT\"Elixir of Pain\"# " },
			[7] = { str = "06) GET FLIGHT PATH THERE!!!!" },
			[8] = { str = "07) Go start killing Yetis..." },
			[9] = { str = "08) I keep grinding away at Yetis until I hit 30. (OPTIONAL: you could go do RFK instead of the grinding)" },
			[10] = { str = "09) also, the \"#NPCHelcular's Rod\"# should have dropped before hitting 30, if not keep grinding away till it does." },
			[11] = { str = "10) As soon as i hit 30, I hearth to Orgrimmar to get new spells/abilities." },
			[12] = { str = "11) Then go back to Hillsbrad." },
			[13] = { str = "12) Turn #TURNIN\"Helcular's Revenge\"# in, accept the next part to it." },
			[14] = { str = "13) go back to the Yeti cave..." },
			[15] = { str = "14) charge The Flame of Azel and the Flame of Veraz,  for the quest #DOQUEST\"Helcular's Revenge\"# " },
			[16] = { str = "15) I keep grinding away at Yetis until my pet levels up." },
			[17] = { str = "16) go up into Alterac Mountains..." },
			--[18] = { str = "." },
			--[19] = { str = "." },
		}
	},
}
