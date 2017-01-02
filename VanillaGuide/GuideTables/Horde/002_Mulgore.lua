--[[--------------------------------------------------
002_Mulgore.lua
Authors: mrmr
Version: 1.04.2
------------------------------------------------------
Description: Guide Serie - 001 Introduction
    1.04.1
        -- First Release
            Taurens Mulgore's Guide
            from level 1 to lever 12
    1.04.2
    	-- no changes in here for this revision
------------------------------------------------------
Connection:
--]]--------------------------------------------------

Table_002_Mulgore = {
-----------1-6 Mulgore
	--[14] = {
	[0106] = {
		title = "1-6 Mulgore",
        --ddmtype = 'v'
        --ddmlvl = '2'
	    --n = "1-6 Mulgore",
	    --pID = 1, nID = 15,
	    --itemCount = 17,
	    items = {
			[1] = { str = "1-6 Mulgore" },
			[2] = { str = "In reference to the Shamans, please look down the guide at the class quest part and follow the link which will give you all the information on your class quests as you have them from level 4." },
			[3] = { str = "01) Talk to Grull Hawkwing (44,77) and accept #ACCEPT\"The Hunt Begins\"# then go outside the area kill Plainstriders and loot 7 feathers and 7 meat. Run back turn it in and accept #ACCEPT\"The Hunt Continues\"# and accept #ACCEPT\"Etched Note\"#.", x = 44, y = 77, zone = "Mulgore" },
			[4] = { str = "02) Talk to your class trainer and turn in #TURNIN\"Etched Note\"# then talk to Chief Hawkwind and accept #ACCEPT\"A Humble Task\"#." },
			[5] = { str = "03) Go to (50,81) and turn in #TURNIN\"A Humble Task\"# at Greatmother Hawkwind, accept the next part then click the water pouch on the fountain, then run back and turn in #TURNIN\"A Humble Task\"# and accept #ACCEPT\"Rites of the Earthmother\"#. ", x = 50, y = 81, zone = "Mulgore" },
			[6] = { str = "04) Grind to level 3 then run back to Camp Narache and accept #ACCEPT\"Break Sharptusk!\"#." },
			[7] = { str = "05) South of the camp around (44,88) kill 10 Cougars and loot their pelts then run to (42,92) and talk to Seer Graytongue and turn in #TURNIN\"Rite of the Earthmother\"# and accept #ACCEPT\"Rite of Strength\"#.", x = 44, y = 88, zone = "Mulgore" },
			[8] = { str = "06) Run back to Camp Narache to Chief Hawkwind (44,77) turn in #TURNIN\"The Hunt Continues\"# and accept #ACCEPT\"The Battleboars\"# grinding mobs along the way until you hit level 4." },
			[9] = { str = "07) Run to (53,81) and kill Battleboar until you have 8 Flank and 8 Snout. ", x = 53, y = 81, zone = "Mulgore" },
			[10] = { str = "08) Run to the cave at (58,85) kill the Quilboar for 12 Belts as you make your way to the tent at (64,77) and kill Sharptusk making sure to loot him for #DOQUEST\"Break Sharptusk!\"# then run to the little cave at (63,82) and on the inside is a Dirt-stained Map. Use it to start #ACCEPT\"Attack on Camp Narache\"#.", x = 58, y = 85, zone = "Mulgore" },
			[11] = { str = "09) Hearth back to Camp Narache go to Chief Hawkwind (44,77) and turn in #TURNIN\"The Battleboars\"#, #TURNIN\"Attack on Camp Narache\"# and #TURNIN\"Rite of Strength\"# then accept #ACCEPT\"Rites of the Earthmother\"# part 2.", x = 44, y = 77, zone = "Mulgore" },
			[12] = { str = "10) Talk to Brave Windfeather and turn in #TURNIN\"Break Sharptusk!\"#." },
			[13] = { str = "11) Go to (38,81) and speak to Antur Fallow and accept #ACCEPT\"A Task Unfinished\"# then continue following the road to Bloodhoof Village.", x = 38, y = 81, zone = "Mulgore" },
			[14] = { str = "12) Talk to Innkeeper Kauth and turn in #TURNIN\"A Task Unfinished\"# and make Bloodhoof Village your home." },
			[15] = { str = "13) You should be level 6 now, if not grind the little exp you should need until you are." },
			--[16] = { str = "." },
			--[17] = { str = "." },
		}
	},

-----------6-10 Mulgore
	--[15] = {
	[0610] = {
		title = "6-10 Mulgore",
		--n = "6-10 Mulgore",
		--pID = 14, nID = 16,
		--itemCount = 20,
		items = {
			[1] = { str = "6-10 Mulgore" },
			[2] = { str = "01) Talk to Baine Bloodhoof and turn in #TURNIN\"Rites of the Earthmother\"# accept #ACCEPT\"Sharing the Land\"#, #ACCEPT\"Rite of Vision\"# and #ACCEPT\"Dwarven Digging\"#." },
			[3] = { str = "02) Accept #ACCEPT\"Poison Water\"# from Mull Thunderhorn (48,60). Talk to Zarlman Two-Moons (47,57) turn in #TURNIN\"Rite of Vision\"# and accept part 2.", x = 48, y = 60, zone = "Mulgore" },
			[4] = { str = "03) Talk to Ruul Eagletalon (47,62) accept #ACCEPT\"Dangers of the Windfury\"# then talk to Harken Windtotem (48,59) and accept #ACCEPT\"Swoop Hunting\"#. Talk to Maur Raincaller (47,57) accept #ACCEPT\"Mazzranache\"#.", x = 47, y = 62, zone = "Mulgore" },
			[5] = { str = "04) Go southeast to (51,66) and kill Trophy Swops for 8 Quills, Prairie Wolfs for 6 Paws, Plainstriders for 4 Talons and underneath trees loot 2 Ambercorns and 2 Well Stones near the well (53,64).", x = 51, y = 66, zone = "Mulgore" },
			[6] = { str = "05) Go to (52,70) and kill the Palemane for #DOQUEST\"Sharing the Land\"#.", x = 52, y = 70, zone = "Mulgore" },
			[7] = { str = "06) At (33,41) kill Harpies for 8 Windfury Talons. Then to (31,50) and acquire broken tools for #DOQUEST\"Dwarven Digging\"#.", x = 33, y = 41, zone = "Mulgore" },
			[8] = { str = "07) Then go to (59,62) and accept #ACCEPT\"The Ravaged Caravan\"# from Morin Cloudstalker. Go to (54,48) and click on the crates to turn it in then accept the second part. Run back to Morin Cloudstalker (59,62) and turn it in then accept #ACCEPT\"The Venture Co.\"# and #ACCEPT\"Supervisor Fizsprocket\"#.", x = 59, y = 62, zone = "Mulgore" },
			[9] = { str = "08) Grind to level 8 if you aren't quite there yet." },
			[10] = { str = "09) Go back to Bloodhoof Village and turn in #TURNIN\"Poison Water\"#, #TURNIN\"Dangers of the Windfury\"#, #TURNIN\"Swoop Hunting\"# then turn in #TURNIN\"Rite of Vision\"# and accept the next part. Accept #ACCEPT\"Winterhoof Cleansing\"#." },
			[11] = { str = "10) Go to (53,67) and cleanse it using Thunderhorn's item. Then run back to Mull Thunderhorn (49,60) and turn in #TURNIN\"Winterhoof Cleansing\"# and accept #ACCEPT\"Thunderhorn Totem\"#.", x = 53, y = 67, zone = "Mulgore" },
			[12] = { str = "11) Go to (47,57) and drink #TURNIN\"Water of the Seers\"# in your backpack, then follow the wolf spirit.", x = 47, y = 57, zone = "Mulgore" },
			[13] = { str = "12) Turn in #TURNIN\"Rite of Vision\"# (33,36) when the spirit stops and accept #ACCEPT\"Rite of Wisdom\"#.", x = 33, y = 36, zone = "Mulgore" },
			[14] = { str = "13) Continue to (59,25) to Lorekeeper Raintotem and accept #ACCEPT\"A Sacred Burial\"#. ", x = 59, y = 25, zone = "Mulgore" },
			[15] = { str = "14) Go to the Ancestral Spirit at the Red Rocks (60,21) turn in #TURNIN\"Rite of Wisdom\"# accept #ACCEPT\"Journey into Thunder Bluff\"# and kill 8 Bristleback Interlopers nearby and once done speak to Lorekeeper Raintotem (59,25) and turn in #TURNIN\"A Sacred Burial\"#.", x = 60, y = 21, zone = "Mulgore" },
			[16] = { str = "15) Go to Thunder Bluff to the Forge at (39,55) and destroy the Prospector's Picks here by clicking on them to destroy them.", x = 39, y = 55, zone = "Thunder Bluff" },
			[17] = { str = "16) Go to (69,51) and talk to Cairne Bloodhoof to turn in #TURNIN\"Journey into Thunder Bluff\"# accept #ACCEPT\"Rise of the Earthmother\"#.", x = 69, y = 51, zone = "Thunder Bluff" },
			[18] = { str = "17) You should now be level 10, if not grind to it. Its time to do your class quest and below will tell you each class quest and how to do them but you can wait until you hit 12 before doing them to continue with Joana's 12-60 guide." },
			--[19] = { str = "." },
			--[20] = { str = "." },
		}
	},

-----------10-12 Mulgore
	--[16] ={
	[1012] = {
		title = "10-12 Mulgore",
		--n = "10-12 Mulgore",
		--pID = 15, nID = 101,
		--itemCount = 19,
		items = {
			[1] = { str = "10-12 Mulgore" },
			[2] = { str = "01) Hearth to Bloodhoof Village. Talk to Skorm Whitecloud (46,60) accept #ACCEPT\"The Hunter's Way\"#.", x = 46, y = 60, zone = "Mulgore" },
			[3] = { str = "02) Turn in #TURNIN\"Dwarven Digging\"# and #TURNIN\"Thunderhorn Totem\"# then accept #ACCEPT\"Thunderhorn Cleansing\"#." },
			[4] = { str = "03) Go to 48,60 and speak to Baine Bloodhoof and turn in #TURNIN\"Sharing the Land\"#.", x = 48, y = 60, zone = "Mulgore" },
			[5] = { str = "04) Go to the Water Well at (44,45) and use it to cleanse your totem in your inventory.", x = 44, y = 45, zone = "Mulgore" },
			[6] = { str = "05) Go to (45,16) and kill Flatland Prowlers until you have 4 claws.", x = 45, y = 16, zone = "Mulgore" },
			[7] = { str = "06) Go to (61,47) and you should see the Venture Co. Mine. Kill 14 Workers and 6 Supervisors. Take a right at the first intersection and you should see Fizsprocket, then kill him.", x = 61, y = 47, zone = "Mulgore" },
			[8] = { str = "07) Go to (59,62) and turn in #TURNIN\"The Venture Co.\"# and #TURNIN\"Supervisor Fizsprocket\"#.", x = 59, y = 62, zone = "Mulgore" },
			[9] = { str = "08) Go to (49,60) and turn in #TURNIN\"Thunderhorn Cleansing\"# then accept #ACCEPT\"Wildmane Totem\"#. Go to (69,51) and turn in #TURNIN\"Rites of the Earthmother\"#.", x = 49, y = 60, zone = "Mulgore" },
			[10] = { str = "09) Go to (46,60) and turn in #TURNIN\"The Hunters Way\"#.", x = 46, y = 60, zone = "Mulgore" },
			[11] = { str = "10) Go to (38,60) in Thunder Bluff and you should see Eyahn Eagletalon. Accept #ACCEPT\"Preparation for Ceremony\"#.", x = 38, y = 60, zone = "Thunder Bluff" },
			[12] = { str = "11) Go behind Thunder Buff and kill Bluffwatchers until you have 6 Azure and 6 Bronze Feathers then run back to (38,60) and turn it in.", x = 38, y = 60, zone = "Thunder Bluff" },
			[13] = { str = "12) Run back to Bloodhoof Village but make sure you kill Prairie Alphas along the way until you have 8 Teeth." },
			[14] = { str = "13) Go to (49,60) and turn in #TURNIN\"Windmane Totem\"#.", x = 49, y = 60, zone = "Mulgore" },
			[15] = { str = "14) You should be level 12 now, if not grind to it then run into the Barrens following the path until you come to Camp Taurajo. Talk to Kirge Sternhorn (44,58) and accept #ACCEPT\"Journey to the Crossroads\"# and get the Flight Path.", x = 44, y = 58, zone = "Mulgore" },
			[16] = { str = "15) Run north up the road until you get to the Crossroads and turn in #TURNIN\"Journey to the Crossroads\"# get the Flight Path." },
			[17] = { str = "16) Now you can continue with the 12-15 Barrens guide which is in the 1-60 guide." },
			--[18] = { str = "." },
			--[19] = { str = "." },
    	}
	},
}
