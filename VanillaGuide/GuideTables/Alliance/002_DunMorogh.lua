--[[--------------------------------------------------
002_DunMorogh.lua
Authors: mrmr
Version: 1.04.3
------------------------------------------------------
Description: Guide Serie - 002 DunMorogh
    1.04.1
        -- First Release
            Dwarves&Gnomes DunMorogh's Guide
            from level 1 to lever 12
    1.04.2
        -- no changes in here for this revision
	1.04.3
		-- Added color codes
			Fixed various spelling errors			
------------------------------------------------------
Connection:
--]]--------------------------------------------------

Table_002_DunMorogh = {
-----------1-6 Cold Ridge Valley
    --[13] = {
    [0106] = {
        title = "1-6 Cold Ridge Valley",
        --n = "1-6 Cold Ridge Valley",
        --pID = 1, nID = 14,
        --itemCount = 25,
        items = {
            [1] = { str = "1-6 Cold Ridge Valley" },
            [2] = { str = "01) Right in front of where you start accept #ACCEPT“Dwarven Outfitters”#" },      
            [3] = { str = "02) Go south around 28,73 and kill wolves for the meat then go back to 29,71 and turn in #TURNIN“Dwarven Outfitters”# then accept #ACCEPT“Encrypted Rune”# and #ACCEPT“Coldridge Valley Mail Delivery pt.1”# ", x = 29, y = 71, zone = "Dun Morogh" },
            [4] = { str = "03) To your left accept #ACCEPT“A New Threat”# " },
            [5] = { str = "04) At 30,74 kill Burly Troggs and at 26,72 there is a camp of Rockjaw Troggs, kill them for #DOQUEST“A New Threat”# ", x = 26, y = 72, zone = "Dun Morogh" },
            [6] = { str = "05) Go back to 29,71 and turn in #TURNIN“A New Threat”# you should be level 3 now " },
            [7] = { str = "06) Go to Anvilmar at 28,69 and turn in your classes skill npc quest which was “Encrypted Rune for a rogue”", x = 28, y = 69, zone = "Dun Morogh" },
            [8] = { str = "07) Accept #ACCEPT“A Refugee's Quandary”# inside " },
            [9] = { str = "08) Follow the road south to 22,71 and turn in #TURNIN“Coldridge Valley Mail Delivery pt.1”# accept #ACCEPT“Coldridge Valley Mail Delivery pt.2”# and #ACCEPT“The Boar Hunter”#", x = 22, y = 71, zone = "Dun Morogh" },
            [10] = { str = "09) Just behind him start killing small boars until you have 12 for #DOQUEST“The Boar Hunter”# then go back to 22,71 and turn it in" },
            [11] = { str = "10) At 20,76 clear the front of the tent and grab #NPCFelix's Box# for #DOQUEST“A Refugee's Quandary”#", x = 20, y = 76, zone = "Dun Morogh" },
            [12] = { str = "11) At 22,80 clear in front of the tent and grab #NPCFelix's Chest# for #DOQUEST“A Refugee's Quandary”#", x = 22, y = 80, zone = "Dun Morogh" },
            [13] = { str = "12) Run up to 25,75 (it’s the end of the road on the map) and turn in #TURNIN“Coldridge Valley Mail Delivery pt.2”# and accept #ACCEPT“The Troll Cave”# ", x = 25, y = 75, zone = "Dun Morogh" },
            [14] = { str = "13) At 26,79 clear in front of the cave and grab #NPCFelix's Bucket of Bolts# for #DOQUEST“A Refugee's Quandary”# then kill the trolls in and out of it until you complete #DOQUEST“The Troll Cave”#", x = 26, y = 79, zone = "Dun Morogh" },
            [15] = { str = "14) Run back up to 25,75 and turn in #TURNIN“The Troll Cave”# accept #ACCEPT“The Stolen Journal”# you should be level 5 or very close to it now.", x = 25, y = 75, zone = "Dun Morogh" },
            [16] = { str = "15) Go back in the cave at 26,79 and go left at the 3 directions to 30,80 and kill #NPCGrik'nir the Cold# for #DOQUEST“The Stolen Journal”# ", x = 30, y = 80, zone = "Dun Morogh" },
            [17] = { str = "16) Return back to 25,75 and turn in #TURNIN“The Stolen Journal”# accept #ACCEPT“Senir's Observations pt.1”#", x = 25, y = 75, zone = "Dun Morogh" },
            [18] = { str = "17) Turn around and accept #ACCEPT“Scalding Mornbrew Delivery”# and hearth." },
            [19] = { str = "18) Run up into Anvilmar at 28,69 and turn in #TURNIN“A Refugee's Quandary”#.", x = 28, y = 69, zone = "Dun Morogh" },
            [20] = { str = "19) Go further back and turn in #TURNIN“Scalding Mornbrew Delivery”# accept #ACCEPT“Bring Back the Mug”#." },
            [21] = { str = "20) Get training before you leave." },
            [22] = { str = "21) Run right to 25,75, everything is yellow so nothing will attack you, and turn in #TURNIN“Bring Back the Mug”#.", x = 25, y = 75, zone = "Dun Morogh" },
            [23] = { str = "22) Head toward the tunnel and turn in #TURNIN“Senir's Observations pt.1”# at 33,71 and accept #ACCEPT“Senir's Observations pt.2”#.", x = 33, y = 71, zone = "Dun Morogh" },
            [24] = { str = "23) You should be about 500 xp to 6 now." },
            [25] = { str = "24) About 10 feet away accept #ACCEPT“Supplies to Tannok”#." },
        }
    },

-----------6-12 Dun Morogh
    --[14] = {
    [0612] = {
        title = "6-12 Dun Morogh",
        --n = "6-12 Dun Morogh",
        --pID = 13, nID = 101,
        --itemCount = 71,
        items = {
            [1] = { str = "6-12 Dun Morogh" },
            [2] = { str = "01) Go through the tunnel and kill all the mobs on the way. Follow the road to 46,53 in Kharanos and kill mobs until you’re level 6. Save your #NPCBoar Ribs# and #NPCBoar Meat#.", x = 46, y = 53, zone = "Dun Morogh" },
            [3] = { str = "02) Once at 46,53 turn in #TURNIN“Senir's Observations pt.2”#" },
            [4] = { str = "03) Up ahead on the right, in front of the Inn, accept #ACCEPT“Beer Basted Boar Ribs”#" },
            [5] = { str = "04) Go inside the Inn and turn in #TURNIN“Supplies to Tannok”#" },
            [6] = { str = "05) Go to the Innkeeper, make it your home and purchase a #NPCRhapsody Malt# for #DOQUEST“Beer Basted Boar Ribs”#" },
            [7] = { str = "06) Get new skills" },
            [8] = { str = "07) Go across the road from the Inn and accept #ACCEPT“Tools For Steelgrill”#" },
            [9] = { str = "08) Go NE to 49,48 and accept #ACCEPT“Stocking Jetsteam”# and #ACCEPT“The Grizzled Den”#", x = 49, y = 48, zone = "Dun Morogh" },
            [10] = { str = "09) Go to the left house and turn in #TURNIN“Tools For Steelgrill”#" },
            [11] = { str = "10) By the tree out front accept #ACCEPT“Ammo For Rumbleshot”#" },
            [12] = { str = "11) Go to the small camp at 44,56 and open the box for #DOQUEST“Ammo For Rumbleshot”#", x = 44, y = 56, zone = "Dun Morogh" },
            [13] = { str = "12) From around this camp to the SW kill boars and bears until you finish #DOQUEST“Stocking Jetsteam”# and #DOQUEST“Beer Basted Boar Ribs”#" },
            [14] = { str = "13) If you’re having trouble finding boars, just go to around 40,65 there are a lot. ", x = 40, y = 65, zone = "Dun Morogh" },
            [15] = { str = "14) Go into the Grizzled Den at 42,54 and kill Wendingos until you get 8 manes for #DOQUEST“The Grizzled Den”#", x = 42, y = 54, zone = "Dun Morogh" },
            [16] = { str = "15) You also want to head out to 40,65 and turn in #TURNIN“Ammo For Rumbleshot”# watch the scene it’s cool, only if you aren’t time running. You should be level 7 or very close now", x = 40, y = 65, zone = "Dun Morogh" },
            [17] = { str = "16) Hearth back to Kharanos" },
            [18] = { str = "17) Just outside the Inn, turn in #TURNIN“Beer Basted Boar Ribs”#" },
            [19] = { str = "18) Go to the house at 45,49, NE of the Inn, and accept #ACCEPT“Operation Recombobulation”#", x = 45, y = 49, zone = "Dun Morogh" },
            [20] = { str = "19) Run NE to 49,48 and turn in #TURNIN“Stocking Jetsteam”# accept #ACCEPT“Evershine”#", x = 49, y = 48, zone = "Dun Morogh" },
            [21] = { str = "20) Turn in #TURNIN“The Grizzled Den”#" },
            [22] = { str = "21) You should be close to half way through level 7 " },
            [23] = { str = "22) Run west to 30,45 and turn in #TURNIN“Evershine”# accept #ACCEPT“A Favor For Evershine”# and #ACCEPT“The Perfect Stout”#. ", x = 30, y = 45, zone = "Dun Morogh" },
            [24] = { str = "23) Beside him accept #ACCEPT“Bitter Rivals”#" },
            [25] = { str = "24) To the North/NE from here you’ll find tons of bears, leopards, and boars to kill for #DOQUEST“A Favor For Evershine”# You should ding level 8 while killing for this. " },
            [26] = { str = "25) Kill troll seers and open baskets at 41,44 and 41,35 for #DOQUEST“The Perfect Stout”# the drops kinda suck off the trolls and the baskets can be hard to get. ", x = 41, y = 44, zone = "Dun Morogh" },
            [27] = { str = "26) Die so you end up in Kharanos" },
            [28] = { str = "27) Next to the GY accept #ACCEPT“Frostmane Hold”#" },
            [29] = { str = "28) Go into the Inn and buy a #NPCThunder Ale# off the Innkeeper and down in the basement, give the ale to Jarven Thunderbrew. When he leaves touch the barrel to turn in #TURNIN“Bitter Rivals”# accept #ACCEPT“Return to Marleth”#. " },
            [30] = { str = "29) Get new skills" },
            [31] = { str = "30) Go west to Brewnall Village again at 30,45 and turn in #TURNIN“The Perfect Stout”# and #TURNIN“A Favor For Evershine”# accept #ACCEPT“Return to Bellowfiz”# and #ACCEPT“Shimmer Stout”#. ", x = 30, y = 45, zone = "Dun Morogh" },
            [32] = { str = "31) Next to him turn in #TURNIN“Return to Marleth”# you should be past half way to level 9 now" },
            [33] = { str = "32) Go west of Brewnall and kill leper gnomes until you complete #DOQUEST“Operation Recombobulation”# you should hit level 9 getting kills " },
            [34] = { str = "33) Go to 24,50 and enter the cave kill 5 headhunters and explore the cave for #DOQUEST“Frostmane Hold”# To explore it just run in and stay to the right, it will curve left and you can see a raised platform with mobs, get near it to complete exploration ", x = 24, y = 50, zone = "Dun Morogh" },
            [35] = { str = "34) Die so you end up at Kharanos " },
            [36] = { str = "35) Either straight down the steps of the Inn, or north of the GY, turn in #TURNIN“Frostmane Hold”# accept #ACCEPT“The Reports”# " },
            [37] = { str = "36) Go NW in the house at 45,49 and turn in #TURNIN“Operation Recombobulation”# ", x = 45, y = 49, zone = "Dun Morogh" },
            [38] = { str = "37) Go east to 49,48 and turn in #TURNIN“Return to Bellowfiz”# you should be half way to level 10 now " },
            [39] = { str = "38) Go North to IF at 53,35 ", x = 53, y = 35, zone = "Dun Morogh" },
            [40] = { str = "39) Make IF your home at 21,55 ", x = 21, y = 55, zone = "Ironforge" },
            [41] = { str = "40) Go to 39,56 in IF, behind the bank, in the kings room, turn in #TURNIN“The Reports”#", x = 39, y = 56, zone = "Ironforge" },
            [42] = { str = "41) Enter the tram at 76,51 ", x = 76, y = 51, zone = "Ironforge" },
            [43] = { str = "42) Take the tram down to SW " },
            [44] = { str = "43) Go to 66,62 and get the FP ", x = 66, y = 62, zone = "Stormwind City" },
            [45] = { str = "44) Reach goldshire and enter the Inn at 42,65 ", x = 42, y = 65, zone = "Elwynn Forest" },
            [46] = { str = "45) Just to your left accept #ACCEPT“Kobold Candles”#" },
            [47] = { str = "46) Exit the Inn and go straight out and accept #ACCEPT“The Fargodeep Mine”#" },
            [48] = { str = "47) In the blacksmith house right here accept #ACCEPT“Elmore's Task”#" },
            [49] = { str = "48) Go near the carts at 42,67 and accept #ACCEPT“Gold Dust Exchange”#", x = 42, y = 67, zone = "Elwynn Forest" },
            [50] = { str = "49) Go south to the Fargodeep Mine at 39,82 and kill the kobold until you complete all 3 quests #DOQUEST“The Fargodeep Mine”#, #DOQUEST“Gold Dust Exchange”#, and #DOQUEST“Kobold Candles”# Make sure you go in the lower entrance so #DOQUEST“The Fargodeep Mine”# is easier ", x = 39, y = 82, zone = "Elwynn Forest" },
            [51] = { str = "50) Once all 3 are done go to the Stonefield Farm just up the hill east at 34,84 and accept #ACCEPT“Lost Necklace”# SKIP #VIDEO“Princess Must Die!”#", x = 34, y = 84, zone = "Elwynn Forest" },
            [52] = { str = "51) Go east to the Maclure Vinyard st 43,85 and turn in #TURNIN“Lost Necklace”# accept #ACCEPT“Pie For Billy”# then turn around and kill boars until it’s finished ", x = 43, y = 85, zone = "Elwynn Forest" },
            [53] = { str = "52) At 43,80 and accept #ACCEPT“Young Lovers”#", x = 43, y = 80, zone = "Elwynn Forest" },
            [54] = { str = "53) Go back west to 34,84 and turn in #TURNIN“Pie For Billy”# SKIP #VIDEO“Back to Billy”#", x = 34, y = 84, zone = "Elwynn Forest" },
            [55] = { str = "54) Go west to the river at 29,85 and turn in #TURNIN“Young Lovers”# accept #ACCEPT“Speak with Gramma”#", x = 29, y = 85, zone = "Elwynn Forest" },
            [56] = { str = "55) Go back to 34,84 and turn in #TURNIN“Speak with Gramma”# in the house, accept #ACCEPT“Note to William”# You should be level 10 now ", x = 34, y = 84, zone = "Elwynn Forest" },
            [57] = { str = "56) Go back to Goldshire, either die or run " },
            [58] = { str = "57) Go into the tram again at 63,10 accept #ACCEPT“Deeprun Rat Roundup”# just collect 5 rats and turn it in. You could skip this and keep the flute, It can really piss people off if you play it non stop around the IF bank. SKIP #VIDEO“Me Brother, Nipsy”# unless you go back to SW on the tram because you get crap xp", x = 63, y = 10, zone = "Stormwind City" },
            [59] = { str = "58) After this you should be a bit over half way to level 11 " },
            [60] = { str = "59) Run east to 68,55 and accept #ACCEPT“The Public Servant”#", x = 68, y = 55, zone = "Dun Morogh" },
            [61] = { str = "60) Go behind him and accept #ACCEPT“Those Blasted Troggs!”#" },
            [62] = { str = "61) Go in the pit below and kill the troggs here and in the cave for both quests then turn them back in at 68,55 " },
            [63] = { str = "62) Go east to 80,51 and follow the path into Loch Modan ", x = 80, y = 51, zone = "Dun Morogh" },
            [64] = { str = "63) Go to 22,73 and accept #ACCEPT“In Defense of the King's Lands”#", x = 22, y = 73, zone = "Loch Modan" },
            [65] = { str = "64) Go up in the tower and accept #ACCEPT“The Trogg Threat”#" },
            [66] = { str = "65) At 33,50 grab the FP ", x = 33, y = 50, zone = "Loch Modan" },
            [67] = { str = "66) Look for Mountaineer Kadrell and accept #ACCEPT“Rat Catching”#" },
            [68] = { str = "67) Kill troggs from 27,53 and north for #DOQUEST“In Defense of the King's Lands”# and #DOQUEST“The Trogg Threat”#", x = 27, y = 53, zone = "Loch Modan" },
            [69] = { str = "68) Go back to 22,73 and turn them both in ", x = 22, y = 73, zone = "Loch Modan" },
            [70] = { str = "69) Go north to the tower at 24,18 and turn in #TURNIN“Stormpike's Delivery”#", x = 24, y = 18, zone = "Loch Modan" },
            [71] = { str = "70) You should be level 12 now or close to it. You can grind if you’d like. Follow the Night Elf to IF guide but just go backwards. You’re going to go north through the wetlands to menethil, then take the boat to auberdine from here." },
        }
    },
}