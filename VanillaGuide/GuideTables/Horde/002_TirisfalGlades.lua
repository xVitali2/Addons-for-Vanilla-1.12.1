--[[--------------------------------------------------
002-TirisfalGlades.lua
Authors: mrmr, lanjelin
Version: 1.04.3
------------------------------------------------------
Description: Guide Serie - 002 Tirisfal Glades
    1.04.1
        -- First Release
            Undead Tirisfal Glades's Guide
            from level 1 to lever 12
    1.04.2
    	-- no changes in here for this revision
    1.04.3
	    -- Cleanup in text
	    	Changed formatting of coords
	    	Changed color coding
	    	Playtested every step
------------------------------------------------------
--]]--------------------------------------------------
Table_002_TirisfalGlades = {
	[0106] = {
		title = "1-6 Deathknell (Tirisfal Glades)",
		items = {
			[1] = { str = "1-6 DeathKnell (Tirisfal Glades)" },
			[2] = { str = "Run up the steps and exit the Crypt." },
			[3] = { str = "Accept the quest #GETRude Awakening# from #NPCUndertaker Mordothen#, then run down the hill and turn it in at #NPCShadow Priest Sarvis#. #COORD[31,66]#", x = 31, y = 66, zone = "Tirisfal Glades" },
			[4] = { str = "Accept #GETThe Mindless Ones#." },
			[5] = { str = "Go down the hill to complete #DOThe Mindless Ones#, then run back and turn them in." , x = 32, y = 63, zone = "Tirisfal Glades"},
			[6] = { str = "Accept #GETRattling the Rattlecages#, #GETTainted Scroll, and #GETThe Damned#" },
			[7] = { str = "Turn in #INTainted Scroll# at your class trainer then get new spells/skills." },
			[8] = { str = "Complete #DOThe Damned# along with #DORattling the Rattlecages#. These are found on the outskirts the village. When done, turn them in and accept #GETMarla's Last Wish#." },
			[9] = { str = "Go outside the church, accept #GETNight Web's Hollow# and #GETScavenging Deathknell#." },
			[10] = { str = "Complete #DOScavenging Deathknell# which are found around and inside buildings in the village, then run down to #COORD[37,62]# and kill Samuel Fipps for #DOMarla's Last Wish#.", x = 37, y = 62, zone = "Tirisfal Glades" },
			[11] = { str = "Run to the cave at #COORD[27,59]# and do #DONight Web's Hollow#.", x = 27, y = 59, zone = "Tirisfal Glades" },
			[12] = { str = "Then run to the cemetery in the village to #COORD[31,64]# and click the #ITEMgrave# to bury the skull.", x = 31, y = 64, zone = "Tirisfal Glades" },
			[13] = { str = "Turn in all the quests which are #INNight Web's Hollow#, #INScavenging Deathknell# and  #INMarla's Last Wish#." },
			[14] = { str = "Accept #DOThe Scarlet Crusade# outside the church, go do it at #COORD[37,67]#, then run back and turn it in.", x = 37, y = 67, zone = "Tirisfal Glades" },
			[15] = { str = "Accept #GETThe Red Messenger# and go and do it at #COORD[36,68]#, killing #NPCMeven Korgal#. Run back and turn it in.", x = 36, y = 68, zone = "Tirisfal Glades" },
			[16] = { str = "Accept #GETVital Intelligence# then get new spells/skills if you are level 6, if not grind until level 6 and do this." },
			[17] = { str = "Run to the north of Death Knell and accept #GETA Rogue's Deal# at #COORD[38,57]#, then leave the starting area.", x = 38, y = 57, zone = "Tirisfal Glades" },
    	}
	},
	[0610] = {
		title = "6-10 Tirisfal Glades",
		items = {
			[1] = { str = "6-10 Tirisfal Glades" },
			[2] = { str = "Go down the hill and accept #GETFields of Grief# from #NPCDeathguard Simmer# #COORD[41,54]#, then go to the Pumpkin farm at #COORD[37,52]# to loot 10 #ITEM[Tirisfal Pumpkin]#.", x = 37, y = 52, zone = "Tirisfal Glades" },
			[3] = { str = "Go back to the road around #COORD[46,57]# to accept #GETGordo's Task#. #NPCGordo# is roaming along the road.", x = 46, y = 57, zone = "Tirisfal Glades" },
			[4] = { str = "Run towards Brill picking up 3 #ITEM[Gloom Weed]# along the way. Turn them in at #NPCJunior Apothecary Holland# #COORD[58,50]#, and accept #GETDoom Weed#.", x = 58, y = 50, zone = "Tirisfal Glades" },
			[5] = { str = "Talk to #NPCDeathguard Dillinger# at #COORD[58,51]# and accept #GETA Putrid Task#.", x = 58, y = 51, zone = "Tirisfal Glades" },
			[6] = { str = "Turn in #INFields of Grief# at #NPCApothecary Johaan# Accept #GETFields of Grief pt.2# and #GETA New Plague# #COORD[59,52]#", x = 59, y = 52, zone = "Tirisfal Glades" },
			[7] = { str = "Turn in #INVital Intelligence# at #NPCExecutor Zygand# and accept #GETAt War with the Scarlet Crusade#. Accept #GETWanted: Maggot Eye# from the #ITEMWanted! sign# just behind him." },
			[8] = { str = "Get #GETProof of Demise# from #NPC# and #GETGraverobbers# from #NPCMagistrate Sevren#." },			
			[9] = { str = "Go into the Inn #COORD[62,53]# and turn in #INA Rogue's Deal# at the #NPCInnkeeper#, and make it your home. Be sure to pick up First Aid from #NPCNurse Neela#.", x = 62, y = 53, zone = "Tirisfal Glades" },
			[10] = { str = "Go to the basement of the Inn, and complete #INFields of Grief part2# at #NPCCaptured Scarlet Zealot#." },
			[11] = { str = "Go back to the bridge at #COORD[53,53]# and kill the Scourge for 7 #ITEM[Putrid Claw]#.", x = 53, y = 53, zone = "Tirisfal Glades" },
			[12] = { str = "Run back to #NPCDeathguard Dillinger# at #COORD[58,51]# and turn in #INA Putrid Task#. You should now be level 7. Accept #GETThe Mills Overrun#.", x = 58, y = 51, zone = "Tirisfal Glades" },
			[13] = { str = "Go back into the Inn #COORD[62,53]# and accept #GETThe Haunted Mills# from #NPCColeman Farthing#, at second floor, accept #GETThe Chill of Death# from #NPCGretchen Dedmar#.", x = 62, y = 53, zone = "Tirisfal Glades" },
			[14] = { str = "Run past the Pumpkin farm to the tower at #COORD[32,47]# and kill #NPCScarlet Warrior# for #DOAt War with the Scarlet Crusade#. On your way, kill #NPCDuskbats# and #NPCDarkhound# for 5 #ITEM[Duskbat Pelt]# and 5 #ITEM[Darkhound Blood]#.", x = 32, y = 47, zone = "Tirisfal Glades" },
			[15] = { str = "When all these are done, Hearth back to Brill. Go outside to the trade supplies, and buy a #ITEM[Coarse Thread]#. Run back into the Inn and turn in #INThe Chill of Death#." },
			[16] = { str = "Run back outside, and turn in #INProof of Demise#, #INAt War with the Scarlet Crusade# accept #GETAt War with the Scarlet Crusade pt.2#, and turn in #INA New Plague#, accepting #GETA New Plague pt.2#." },
			[17] = { str = "Run north to #COORD[59,30]# for #DOWanted: Maggot Eye#, doing #DOGraverobbers# and #DODoom Weed# along the way.", x = 59, y = 30, zone = "Tirisfal Glades" },
			[18] = { str = "When those are done, go to the beach at #COORD[61,29]#, and kill #NPCMurlocs# until you have 5 #ITEM[Vile Fin Scale]#.", x = 61, y = 29, zone = "Tirisfal Glades" },
			[19] = { str = "Go back to #NPCJunior Apothecary Holland# at #COORD[58,50]# and turn in #INDoom Weed#.", x = 57, y = 49, zone = "Tirisfal Glades" },
			[20] = { str = "Go back to Brill and turn in #INA New Plague# and accept #GETA New Plague pt.2# at #NPCApothecary Johaan# #COORD[59,52]#", x = 59, y = 52, zone = "Tirisfal Glades" },
			[21] = { str = "Turn in #INWanted: Maggot Eye# at #NPCExecutor Zygand# #COORD[61,52]#, and #INGraverobbers# at #NPCMagistrate Sevren#. Accept #GETForsaken Duties# and #GETThe Prodigal Lich#.", x = 61, y = 52, zone = "Tirisfal Glades" },
			[22] = { str = "Travel to the tower at #COORD[51,68]# and kill 3 #NPCScarlet Missionaries#, 3 #NPCScarlet Zealots# and #NPCCaptain Parrine#.", x = 51, y = 68, zone = "Tirisfal Glades" },
			[23] = { str = "Go to Agamand Hills #COORD[47,39]#, and kill #NPCDevlin Agamand# for #DOThe Haunted Mills#.", x = 47, y = 39, zone = "Tirisfal Glades" },			
			[24] = { str = "Run back to #NPCExecutor Zygand# #COORD[61,52]# in Brill, and turn in #INAt War with the Scarlet Crusade pt.2# and accept #INAt War with the Scarlet Crusade pt.3#", x = 61, y = 52, zone = "Tirisfal Glades" },
			[25] = { str = "Then talk to #NPCColeman Farthing# inside the Inn, turn in #INThe Haunted Mills# and accept #GETDeaths in the Family#" },		
			[26] = { str = "You should now be level 10, grab new spells, and accept your #GETClass quest#, but don't do it yet." },
    	}
	},
	[1012] = {
		title = "10-12 Tirisfal Glades",
		items = {
			[1] = { str = "10-12 Tirisfal Glades" },
			[2] = { str = "Go to Agamand Hills #COORD[47,36]# and kill #NPCRattlecage Soldiers# and #NPCDarkeye Bonecasters#, looting them for #ITEM[Notched Ribs]# and #ITEM[Blackened Skulls]#.", x = 47, y = 36, zone = "Tirisfal Glades" },
			[3] = { str = "If #ITEM[A Letter to Yvette]# drops, pick it up, and accept #GETA Letter Undelivered#."},
			[4] = { str = "Kill #NPCNissa# #COORD[49,36]#, #NPCGregor# #COORD[46,29]# and #NPCThurman Agamand# #COORD[44,34]#, making sure to loot all their remains.", x = 44, y = 34, zone = "Tirisfal Glades" },
			[5] = { str = "Run back to #NPCDeathguard Dillinger# at #COORD[58,51]# in Brill, and turn in #IThe Mills Overrun#", x = 58, y = 51, zone = "Tirisfal Glades"  },
			[6] = { str = "Run into the Inn, and turn in #INA Letter Undelivered# at #NPCYvette Farthing#. Turn in #INDeaths in the Family# at #NPCColeman Farthing#, accept #GETSpeak with Sevren#." },
			[7] = { str = "Turn in #INSpeak with Sevren# at #NPCMagistrate Sevren# #COORD[61,51]#, skip #SKIPThe Family Crypt#.", x = 61, y = 51, zone = "Tirisfal Glades" },
			[8] = { str = "Run to the Undercity. Do your class quest.", x = 62, y = 65, zone = "Tirisfal Glades" },
			[9] = { str = "Visit the Weapon Master at #COORD[57,33]# to learn new weapon skills.", x = 57, y = 33, zone = "Undercity" },
			[10] = { str = "Go to the Mage Quarter and speak with #NPCBethor Iceshard# #COORD[84,17]# and turn in #INThe Prodical Lich#, accept #GETThe Lich's Identity#.", x = 84, y = 17, zone = "Undercity" },
			[11] = { str = "Exit Undercity, and go to #COORD[65,60]#. Turn in #INForsaken Duties#, accept #GETReturn to the Magistrate# and #GETRear Guard Patrol#.", x = 65, y = 60, zone = "Tirisfal Glades" },
			[12] = { str = "Go to #COORD[75,61]# and kill 8 #NPCBleeding Horrors# and 8 #NPCWandering Spirits# for #DORear Guard Patrol#", x = 75, y = 61, zone = "Tirisfal Glades" },
			[13] = { str = "Run north to #COORD[80,56]# and kill 5 #NPCScarlet Friars# and #NPCCaptain Vachon# for #DOAt War with the Scarlet Crusade pt.3#.", x = 80, y = 56, zone = "Tirisfal Glades" },
			[14] = { str = "Go east to #COORD[85,53]# and kill #NPCVicious Night Web Spiders# until you get 4 #ITEM[Vicious Night Web Spider Venom]#.", x = 85, y = 53, zone = "Tirisfal Glades" },
			[15] = { str = "Go to Brightwater Lake and swim to Gunther's Retreat. Click #ITEM[Gunther's Books]# at #COORD[68,42]# to loot #ITEM[The Lich's Spellbook]#, then go back to #COORD[65,60]# and turn in #INRear Guard Patrol#.", x = 68, y = 42, zone = "Tirisfal Glades" },
			[16] = { str = "Enter the Undercity. Go to #COORD[84,17]# and turn in #INThe Lich's Identity# accept #GETReturn the Book#.", x = 84, y = 17, zone = "Undercity" },
			[17] = { str = "Hearth or run back to Brill." },
			[18] = { str = "Turn in #INAt War with the Scarlet Crusade pt.3# and accept #GETAt War with the Scarlet Crusade pt.4#. Turn in #INA New Plague pt.2# accept #GETA New Plague pt.3# and turn in #INReturn to the Magistrate#. Go to the basement of the Inn, and turn in #INA New Plague pt.3#." },
			[19] = { str = "Go back to Gunther's Retreat at #COORD[68,42]# and turn in #INReturn the Book#, accept #GETProving Allegiance#. Grab a #ITEM[Candle of Beckoning]# from the #ITEMCrate of Candles#.", x = 68, y = 42, zone = "Tirisfal Glades" },
			[20] = { str = "Go to the small island just south #COORD[67,45]#, and use the candle on the #ITEMDinner Table# to summon #NPCLillith Nefara#. Kill her, then go back to #NPCGunther Arcanus# and turn the quest in, accepting #GETThe Prodigal Lich Returns#.", x = 67, y = 45, zone = "Tirisfal Glades" },
			[21] = { str = "Go to the tower up the pathway at #COORD[79,26]# and kill #NPCCaptain Melrache# and 2 #NPCScarlet Bodyguard# for #DOAt War with the Scarlet Crusade pt.4#.", x = 79, y = 26, zone = "Tirisfal Glades" },
			[22] = { str = "Go back to Brill and turn in #INAt War with the Scarlet Crusade#, then run to the Undercity and at the Mage Quarter #COORD[84,17]# turn in #INThe Prodigal Lich Returns#.", x = 84, y = 17, zone = "Undercity" },
			[23] = { str = "You should now be level 12, so get your training for level 12." },
			[24] = { str = "Exit Undercity, and run to the Zeppelin Tower at #COORD[61,59]#. Get on the zeppelin to Orgrimmar.", x = 61, y = 59, zone = "Tirisfal Glades" },
			[25] = { str = "Run in to Orgrimmar #COORD[46,12]#and get the flight path #COORD[45,64]#.", x = 45, y = 64, zone = "Orgrimmar" },
			[26] = { str = "Run back out of Orgrimmar, and south to Razor Hill. Accept #GETConscript of the Horde# from #NPCTakrin Pathseeker# #COORD[51,44]#", x = 51, y = 44, zone = "Durotar"  },
			[27] = { str = "Head west and in to the Barrens, #COORD[35,42]#.", x = 35, y = 42, zone = "Durotar" },
    	}
	},
}