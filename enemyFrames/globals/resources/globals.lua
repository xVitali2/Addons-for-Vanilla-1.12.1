
    HEX_CLASS_COLORS = {
        ['DRUID']   = 'ff7d0a',
        ['HUNTER']  = 'abd473',
        ['MAGE']    = '69ccf0',
        ['PALADIN'] = 'f58cba',
        ['PRIEST']  = 'ffffff',
        ['ROGUE']   = 'fff569',
        ['SHAMAN']  = 'f58cba',--'0070de',
        ['WARLOCK'] = '9482c9',
        ['WARRIOR'] = 'c79c6e',
    }
	
	RGB_SPELL_SCHOOL_COLORS = 
	{
		['physical'] 	= {.9, .9, 0},
		['arcane'] 		= {.9, .4, .9},
		['fire']		= {.9, .4, 0},
		['nature'] 		= {.3, .9, .2},
		['frost'] 		= {.4,.9, .9},
		['shadow'] 		= {.4, .4, .9},
		['holy'] 		= {.9, .4, .9}
	}

	RGB_FACTION_COLORS = 
	{
		['Alliance'] 	= {['r'] = 0, ['g'] = .68, ['b'] = .94}, 
		['Horde'] 		= {['r'] = 1, ['g'] = .1, ['b'] = .1}
	}
	
	RGB_POWER_COLORS =
	{
		['energy']		= {1, 1, 0},
		['focus']		= {1, .5, .25},
		['mana']		= {0, 0, 1},
		['rage']		= {1, 0, 0},
		
	}
	
	RGB_BORDER_DEBUFFS_COLOR =
	{
		--['none']		= {.8, 0, 0}
		['curse']		= {.6, 0, 1},
		['disease']		= {.6, .4, 0},
		['magic'] 		= {.2, .6, 1},
		['physical'] 	= {.8, 0, 0},
		['poison'] 		= {0, .6, 0},		
	}
	
	local iconFolders = 
	{
		['class'] 		= [[Interface\AddOns\enemyFrames\globals\resources\ClassIcons\ClassIcon_]],
		['rank']  		= [[Interface\PvPRankBadges\PvPRank]],
		['portrait'] 	= [[Interface\characterframe\TEMPORARYPORTRAIT-]],
	}

	GET_DEFAULT_ICON = function(op, value)
		local dir = iconFolders[op]
		-- rank file hack
		local a = op == 'rank' and value < 10 and '0' or ''
		return dir .. a .. value
	end
	
	RAID_TARGET_TCOORDS = 
	{
		['star']		= {0, .25, 0, .25},
		['circle']		= {.25, .5, 0, .25},
		['diamond']		= {.5, .75, 0, .25},
		['triangle']	= {.75, 1, 0, .25},
		
		['moon']		= {0, .25, .25, .5},
		['square']		= {.25, .5, .25, .5},
		['cross']		= {.5, .75, .25, .5},
		['skull'] 		= {.75, 1, .25, .5},
	}		
    
	SPELLINFO_WSG_FLAGS = {
		['Alliance'] 	= {['icon'] = [[Interface\Icons\inv_bannerpvp_02]]},
		['Horde'] 		= {['icon'] = [[Interface\Icons\inv_bannerpvp_01]]},
	}

	--
