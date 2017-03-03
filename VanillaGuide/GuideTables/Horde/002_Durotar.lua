--[[--------------------------------------------------
002_Durotar.lua
Authors: mrmr, lanjelin
Version: 1.04.3
------------------------------------------------------
Description: Guide Serie - 001 Introduction
    1.04.1
        -- First Release
            Orcs&Trolls Durotar's Guide
            from level 1 to lever 12
    1.04.2
    	-- no changes in here for this revision
    1.04.3
	    -- Cleanup in text, changed formatting of coords
------------------------------------------------------
Connection:
--]]--------------------------------------------------

Table_002_Durotar = {
-----------1-6 Durotar
  	--[11] = {
  	[0106] = {
  		title = "1-6 Durotar",
	    --n = "1-6 Durotar",
	    --pID = 1, nID = 12,
	    --itemCount = 19,
	    items = {
			[1] = { str = "1-6 Durotar" },
			[2] = { str = "I do every single quest in Durotar! Here's the fastest way to do em:" },
			[3] = { str = "Start off accepting #GETYour Place In The World# . (Right in front of you) " },
			[4] = { str = "Then turn it in at #COORD#COORD[42,68]## ... accept #GETCutting Teeth# " },
			[5] = { str = "Go start doing: #DOCutting Teeth# (keep step #5 in mind)" },
			[6] = { str = "Once you hit level 2, go accept #GETSarkoth# at #COORD[40,62]#", x = 40, y = 62, zone = "Durotar" },
			[7] = { str = "Go do #DOSarkoth# at #COORD[40,66]#.", x = 40, y = 66, zone = "Durotar" },
			[8] = { str = "Then turn #INSarkoth# in at #COORD[40,62]# ... Accept #GETSarkoth# pt.2", x = 40, y = 62, zone = "Durotar" },
			[9] = { str = "Make sure #DOCutting Teeth# is complete." },
			[10] = { str = "Go turn in #INSarkoth# pt.2 and #INCutting Teeth# at #COORD[42,68]# ... Accept #GETEtched Tablet# and #GETSting of the Scorpid# ", x = 42, y = 68, zone = "Durotar" },
			[11] = { str = "Turn in #GETEtched Tablet#, around #COORD[43,69]#, and get new spells/abilities for your class.", x = 43, y = 69, zone = "Durotar" },
			[12] = { str = "Then accept and do the following:  #DOSting of the Scorpid#   #DOVile Familiars#   #DOGalgar's Cactus Apple Surprise# and #DOLazy Peons#   (all these are done north and north-east of Valley of Trials)" },
			[13] = { str = "Turn all those quests in, then accept #GETBurning Blade Medallion# and #GETThazz'ril's Pick# " },
			[14] = { str = "Go do #DOBurning Blade Medallion# and #DOThazz'ril's Pick#, these are done in the cave at #COORD[44,56]#", x = 44, y = 56, zone = "Durotar" },
			[15] = { str = "Once those two quests are done use your hearthstone." },
			[16] = { str = "Turn those 2 quests in and accept #GETReport to Sen'jin Village# " },
			[17] = { str = "The starting area is now completed.  Leave starting noob zone (by heading east)." },
			--[18] = { str = "." },
			--[19] = { str = "." },
		}
	},

-----------6-9 Durotar
	--[12] = {
	[0609] = {
		title = "6-9 Durotar",
	    --n = "6-9 Durotar",
	    --pID = 11, nID = 13, 
	    --itemCount = 31,
	    items = {
			[1] = { str = "6-9 Durotar" },
			[2] = { str = "Accept #GETA Peon's Burden# at #COORD[52,68]#", x = 52, y = 68, zone = "Durotar" },
			[3] = { str = "Accept #GETThwarting Kolkar Aggression# at #COORD[54,75]#", x = 54, y = 75, zone = "Durotar" },
			[4] = { str = "Go turn in #INReport to Sen'jin Village# at Sen'jen Village, #COORD[55,74]#", x = 55, y = 74, zone = "Durotar" },
			[5] = { str = "Then collect all the quests in Sen'jin Village.  (which include:  #GETA solvent Spirit# #GETPractical Prey# #GETMinshina's Skull# #GETReport to Orgnil# and #GETZalazane# )" },
			[6] = { str = "Do NOT do #NPCA solvent Spirit# at the water around Sen'jin Village.  Make sure the quest is accepted though." },
			[7] = { str = "Then run up to Razor Hill #COORD[52,44]#, grinding mobs along the way, and make sure you get to level 6 before you get up there for new spells.", x = 52, y = 44, zone = "Durotar" },
			[8] = { str = "Turn in #INReport to Orgnil# and collect all the quests at Razor Hill (#GETDark Storms# #GETVanquish the Betrayers# , #GETEncroachment# #GETBreak a Few Eggs# " },
			[9] = { str = "Go up to the watch tower north-west of Razor Hill, at #COORD[49,40]# and accept #GETCarry Your Weight# ", x = 49, y = 40, zone = "Durotar" },
			[10] = { str = "Go in the Inn #COORD[51,41]# and turn in #INA Peon's Burden# .  And also make Razor Hill your home.", x = 51, y = 41, zone = "Durotar" },
			[11] = { str = "Get first aid. at #COORD[54,41]#", x = 51, y = 41, zone = "Durotar" },
			[12] = { str = "Then go do this: #DOVanquish the Betrayers# along with #DOCarry Your Weight#. These are done at Tiragarde Keep, #COORD[57,55]#", x = 57, y = 55, zone = "Durotar" },
			[13] = { str = "After killing Benedict (he is up in the building at #COORD[59,58]#), get his key, go up the steps, open the chest and grab the note that starts:  #GETThe Admiral's Orders# accept the quest.", x = 59, y = 58, zone = "Durotar" },
			[14] = { str = "Go turn in #INVanquish the Betrayers# #INThe Admiral's Orders# and #INCarry Your Weight# at Razor Hill #COORD[52,44]#, and accept #GETFrom The Wreckage....# #GETThe Admiral's Orders# (part2).", x = 52, y = 44, zone = "Durotar" },
			[15] = { str = "Go do #DOA solvent Spirit# and #DOFrom The Wreckage....# Do these two quests at the water east of Tiragarde Keep, around #COORD[62,50]#.", x = 62, y = 50, zone = "Durotar" },
			[16] = { str = "Then do the first half of #DOEncroachment# at #COORD[49,49]#.", x = 49, y = 49, zone = "Durotar" },
			[17] = { str = "Then if you're not at least 3 bars away from lvl 8, grind till you are, go turn in #INFrom The Wreckage....# at Razor Hill #COORD[52,44]# and get new spells/abilities.", x = 52, y = 44, zone = "Durotar" },
			[18] = { str = "Run way down south and do #DOThwarting Kolkar Aggression# at #COORD[48,79]# ", x = 48, y = 79, zone = "Durotar" },
			[19] = { str = "Once that is done turn it in at #COORD[54,75]#.", x = 54, y = 75, zone = "Durotar" },
			[20] = { str = "Turn in #INA solvent Spirit# at Sen'jin #COORD[55,74]#", x = 55, y = 74, zone = "Durotar" },
			[21] = { str = "Then go to Echo Isles (the islands south-east of Durotar) and do the following 4 quests together:" },
			[22] = { str = "#DOBreak a Few Egg# " },
			[23] = { str = "#DOPractical Prey# " },
			[24] = { str = "#DOMinshina's Skull#  at #COORD[67,87]#", x = 67, y = 87, zone = "Durotar" },
			[25] = { str = "#DOZalazane# at #COORD[67,86]#." },
			[26] = { str = "After completing all these quests, die on purpose, so you end up right at Sen'jin Village #COORD[55,74]#...", x = 55, y = 74, zone = "Durotar" },
			[27] = { str = "Turn in #INPractical Prey# #INMinshina's Skull# and #INZalazane# .  Save the quest reward item #NPCFaintly Glowing Skull# for a later quest called #NPCBurning Shadows# " },
			[28] = { str = "Hearth to Razor Hill.  Turn in #INBreak a Few Eggs# " },
			[29] = { str = "Then do the second half of #DOEncroachment# (west of Razor Hill, at #COORD[42,38]#)", x = 42, y = 38, zone = "Durotar" },
			--[30] = { str = "." },
			--[31] = { str = "." },
		}
	},

-----------9-12 Durotar
	--[13] = {
	[0912] = {
		title = "9-12 Durotar",
	    --n = "9-12 Durotar",
	    --pID = 12, nID = 101, 
	    --itemCount = 45,
	    items = {
			[1] = { str = "9-12 Durotar" },
			[2] = { str = "Then go up and accept #GETLost But Not Forgotten# at the little hut at #COORD[43,30]#", x = 43, y = 30, zone = "Durotar" },
			[3] = { str = "Then go up (grind mobs along the way) and accept  #GETWinds in the Desert# at the goblin, #COORD[46,22]#.", x = 46, y = 22, zone = "Durotar" },
			[4] = { str = "Then do #DOWinds in the Desert# " },
			[5] = { str = "Then turn it in, accept  #GETSecuring the Lines# at #COORD[46,22]#", x = 46, y = 22, zone = "Durotar" },
			[6] = { str = "Grind mobs to lvl 10." },
			[7] = { str = "Go down to razor hill #COORD[52,44]#, turn in #INEncroachment# ", x = 52, y = 44, zone = "Durotar" },
			[8] = { str = "Get new spells/abilities." },
			[9] = { str = "Do your level 10 class quests." },
			[10] = { str = "Then go way west (grinding mobs along the way) and accept #GETNeed for a Cure# at #COORD[41,18]#", x = 41, y = 18, zone = "Durotar" },
			[11] = { str = "Go to Orgrimmar at #COORD[45,11]#", x = 45, y = 11, zone = "Durotar" },
			[12] = { str = "Then turn in #INThe Admiral's Orders# in thrall's chamber #COORD[34,36]#", x = 34, y = 36, zone = "Orgrimmar" },
			[13] = { str = "Accept #GETHidden Enemies# (Thrall gives it)" },
			[14] = { str = "Go into Cleft of Shadow, accept #GETFinding the Antidote# #COORD[46,53]#", x = 46, y = 53, zone = "Orgrimmar" },
			[15] = { str = "Then go do #DOSecuring the Lines# at #COORD[53,23]# in Durotar", x = 53, y = 23, zone = "Durotar" },
			[16] = { str = "Turn in #INSecuring the Lines# at #COORD[46,22]#", x = 46, y = 22, zone = "Durotar" },
			[17] = { str = "Then go do #DOFinding the Antidote# (the scorpids are all over the place) and #DOLost But Not Forgotten# (all along the river west of Durotar)" },
			[18] = { str = "Then go do #DODark Storms# at #COORD[41,26]#", x = 41, y = 26, zone = "Durotar" },
			[19] = { str = "Turn in #INLost But Not Forgotten# #COORD[43,30]#", x = 43, y = 30, zone = "Durotar" },
			[20] = { str = "Turn in #INDark Storms# at Razor Hill, #COORD[52,44]#", x = 52, y = 44, zone = "Durotar" },
			[21] = { str = "Accept #GETMargoz# " },
			[22] = { str = "Turn in #INMargoz# at #COORD[56,20]# accept #GETSkull Rock# ", x = 56, y = 20, zone = "Durotar" },
			[23] = { str = "Go do #DOSkull Rock# along with #DOHidden Enemies# in the cave at #COORD[54,11]#", x = 54, y = 11, zone = "Durotar" },
			[24] = { str = "If you can, try to kill Gazz'uz, he drops 'Eye of Burning Shadow' item which starts #GETBurning Shadows# quest.  HINT: use the quest reward item #NPCFaintly Glowing Skull# to help you kill him, he's tough without it, also try to party up with somebody if you can." },
			[25] = { str = "Turn in #INSkull Rock# #COORD[56,20]# accept #GETNeeru Fireblade# ", x = 56, y = 20, zone = "Durotar" },
			[26] = { str = "Go to into Orgrimmar." },
			[27] = { str = "Turn in #INHidden Enemies# at #COORD[33,37]# in Orgrimmar accept the next part to #GETHidden Enemies# ", x = 33, y = 37, zone = "Orgrimmar" },
			[28] = { str = "Go to Cleft of Shadows #COORD[47,53]# and turn in #INFinding the Antidote# ", x = 47, y = 53, zone = "Orgrimmar" },
			[29] = { str = "Turn in #INNeeru Fireblade# and #INBurning Shadows# at Neeru Fireblade #COORD[49,50]# accept #GETAk'Zeloth# ", x = 49, y = 50, zone = "Orgrimmar" },
			[30] = { str = "Also keep talking to him to complete #DOHidden Enemies# " },
			[31] = { str = "Then go back to Thrall and turn in #INHidden Enemies# again. The 3rd part refers to RFC instance, which I skip." },
			[32] = { str = "Leave Orgrimmar, and turn in #INNeed for a Cure# at #COORD[41,18]# (you will most likely have to accept it again to turn it in)", x = 40, y = 62, zone = "Durotar" },
			[33] = { str = "Hearth to Razor Hill." },
			[34] = { str = "Build up first aid." },
			[35] = { str = "Get new spells/abilities." },
			[36] = { str = "Accept #GETConscript of the Horde# at #COORD[50,43]# in Razor Hill", x = 51, y = 44, zone = "Durotar" },
			[37] = { str = "Run west into the Barrens...at #COORD[35,42]#", x = 35, y = 42, zone = "Durotar" },
			--[44] = { str = "." },
			--[45] = { str = "." },
		}
	},

}
