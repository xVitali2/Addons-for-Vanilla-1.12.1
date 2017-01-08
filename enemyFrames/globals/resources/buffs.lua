	SPELLINFO_INTERRUPTS_TO_TRACK = {
		-- MISC 
		-- DRUID
		-- HUNTER
		-- MAGE
		-- PALADIN
		-- PRIEST
		-- ROGUE
		[EF_L_KICK] = true,
		-- SHAMAN
		[EF_L_EARTHSHOCK] = true,
		-- WARLOCK
		-- WARRIOR 
		[EF_L_PUMMEL] = true, [EF_L_SHIELDBASH] = true,  
    }
	SPELLINFO_INTERRUPT_BUFFS_TO_TRACK = {
		-- MISC
		[EF_L_INFERNOEFFECT] = true, [EF_L_IRONGRENADE] = true,  [EF_L_RECKLESSCHARGE] = true, [EF_L_TIDALCHARM] = true, [EF_L_THORIUMGRENADE] = true, 
		-- DRUID
		[EF_L_BASH] = true, 				[EF_L_BEARFORM] = true, 	[EF_L_CATFORM] = true,				[EF_L_DIREBEARFORM] = true, 	
		[EF_L_FERALCHARGEEFFECT] = true, 	[EF_L_MOONKINFORM] = true,	[EF_L_NATURESWIFTNESS] =  true, 	[EF_L_POUNCE] = true, 		
		[EF_L_TRAVELFORM] = true, 			[EF_L_STARFIRESTUN] = true,
		-- HUNTER
		[EF_L_ASPECTOFTHECHEETAH] =  true, 	[EF_L_ASPECTOFTHEHAWK] =  true, [EF_L_ASPECTOFTHEMONKEY] =  true, 	[EF_L_FREEZINGTRAPEFFECT] = true, 
		[EF_L_IMPROVEDCONCUSSIVESHOT] = true,[EF_L_INTIMIDATION] = true, 	[EF_L_SCATTERSHOT] = true, 			[EF_L_WYVERNSTING] = true,
		-- MAGE
		[EF_L_BLINK] = true, 		[EF_L_COUNTERSPELLSILENCED] = true, [EF_L_FIREWARD] = true, 	[EF_L_FROSTARMOR] = true,	[EF_L_FROSTWARD] = true, 	
		[EF_L_ICEBARRIER] = true, 	[EF_L_ICEARMOR] = true, 			[EF_L_ICEBLOCK] = true, 	[EF_L_IMPACT] = true, 		[EF_L_MAGEARMOR] = true, 	
		[EF_L_MANASHIELD] = true, 	[EF_L_POLYMORPH] = true, 			[EF_L_POLYMORPHPIG] = true,	[EF_L_POLYMORPHTURTLE] = true,
		-- PALADIN
		[EF_L_DIVINEINTERVENTION] = true, 	[EF_L_DIVINEPROTECTION] = true, 		[EF_L_DIVINESHIELD] = true, [EF_L_HAMMEROFJUSTICE] = true, 
		[EF_L_SEALOFTHECRUSADER] = true, 	[EF_L_SEALOFRIGHTEOUSNESS] = true, 		[EF_L_STUN] = true,
		-- PRIEST
		[EF_L_BLACKOUT] = true, 	[EF_L_INNERFIRE] = true, [EF_L_PSYCHICSCREAM] = true,   [EF_L_SILENCE] = true,
		-- ROGUE
		[EF_L_BLIND] = true, [EF_L_CHEAPSHOT] = true, [EF_L_GOUGE] = true, [EF_L_KIDNEYSHOT] = true, [EF_L_KICKSILENCED] = true,
		-- SHAMAN
		[EF_L_ELEMENTALMASTERY] =  true, [EF_L_GHOSTWOLF] = true, [EF_L_LIGHTNINGSHIELD] = true, [EF_L_NATURESWIFTNESS] =  true,
		-- WARLOCK
		[EF_L_DEATHCOIL] = true, [EF_L_FEAR] = true, [EF_L_SHADOWWARD] = true, [EF_L_SPELLLOCK] = true, 
		-- WARRIOR
		[EF_L_CHARGESTUN] = true, 	[EF_L_CONCUSSIONBLOW] = true, 		[EF_L_INTERCEPTSTUN] = true, [EF_L_INTIMIDATINGSHOUT] = true, [EF_L_MACESTUNEFFECT] = true, 
		[EF_L_REVENGESTUN] = true, 	[EF_L_SHIELDBASHSILENCED] = true,    
    }
	SPELLINFO_TIME_MODIFIER_BUFFS_TO_TRACK = {
		[EF_L_BARKSKIN]					= {['mod'] = 1.4, 	['list'] = {'all'}},	-- its 1 second flat increase but 1.4 should be close enough
		[EF_L_CURSEOFTONGUES] 			= {['mod'] = 1.6, 	['list'] = {'all'}},
		
		[EF_L_CURSEOFTHEEYE] 			= {['mod'] = 1.2, 	['list'] = {'all'}},
		
		[EF_L_MINDNUMBINGPOISON] 		= {['mod'] = 1.6, 	['list'] = {'all'}},	[EF_L_MINDNUMBINGPOISON2] 		= {['mod'] = 1.6, 	['list'] = {'all'}},	[EF_L_MINDNUMBINGPOISON3] 		= {['mod'] = 1.6, 	['list'] = {'all'}},
		
		[EF_L_FANGOFTHECRYSTALSPIDER] 	= {['mod'] = 1.1, 	['list'] = {'all'}},
		
		[EF_L_NATURESWIFTNESS] 		= {['mod'] = 0.1, 	['list'] = {EF_L_CHAINHEAL, EF_L_CHAINLIGHTNING, EF_L_FARSIGHT, EF_L_GHOSTWOLF, EF_L_HEALINGWAVE, EF_L_LESSERHEALINGWAVE, EF_L_LIGHTNINGBOLT,   -- shaman
															EF_L_ENTANGLINGROOTS, EF_L_HEALINGTOUCH, EF_L_HIBERNATE, EF_L_REBIRTH, EF_L_REGROWTH, EF_L_SOOTHEANIMAL, EF_L_WRATH}}, -- druid
								  
		[EF_L_RAPIDFIRE]					= {['mod'] = .6, 	['list'] = {EF_L_AIMEDSHOT}},
		[EF_L_SHADOWTRANCE] 				= {['mod'] = 0, 	['list'] = {EF_L_SHADOWBOLT}},
		[EF_L_FELDOMINATION]				= {['mod'] = 0.05, 	['list'] = {EF_L_SUMFELHUNTER, EF_L_SUMIMP, EF_L_SUMSUCCUBUS, EF_L_SUMVOIDWALKER}},
		
		[EF_L_PRESENCEOFMIND] 				= {['mod'] = 0, 	['list'] = {EF_L_FIREBALL, EF_L_FROSTBOLT, EF_L_PYROBLAST, EF_L_SCORCH, EF_L_POLYMORPH, EF_L_POLYMORPHPIG, EF_L_POLYMORPHTURTLE}},
		[EF_L_MINDQUICKENING]				= {['mod'] = 0.66, 	['list'] = {EF_L_FIREBALL, EF_L_FROSTBOLT, EF_L_PYROBLAST, EF_L_SCORCH, EF_L_POLYMORPH, EF_L_POLYMORPHPIG, EF_L_POLYMORPHTURTLE}},		
	}
	
	SPELLINFO_BUFFS_TO_TRACK = {
	
        -- MISC & MOBS
		[EF_L_FIRSTAID]				= {['icon'] = [[Interface\Icons\Spell_holy_heal]],					['duration'] = 8,	['display'] = false,},
		[EF_L_FLEE]					= {['icon'] = [[Interface\Icons\spell_magic_polymorphchicken]],		['duration'] = 10,},
    	[EF_L_FREEACTION]     		= {['icon'] = [[Interface\Icons\Inv_potion_04]], 					['duration'] = 30, 	['type'] = 'magic', 	['prio'] = 4},
		[EF_L_INVULNERABILITY]     	= {['icon'] = [[Interface\Icons\Spell_holy_divineintervention]], 	['duration'] = 6, 	['type'] = 'magic',		['prio'] = 5},
		[EF_L_LIVINGFREEACTION] 	= {['icon'] = [[Interface\Icons\Inv_potion_07]], 					['duration'] = 5, 	['type'] = 'magic', 	['prio'] = 4},
		[EF_L_NETOMATIC]       		= {['icon'] = [[Interface\Icons\ability_ensnare]], 					['duration'] = 10, 	['type'] = 'physical',	['prio'] = 2},
		[EF_L_PERCEPTION]       	= {['icon'] = [[Interface\Icons\Spell_nature_sleep]], 				['duration'] = 20,},
		[EF_L_RECENTLYBANDAGED]		= {['icon'] = [[Interface\Icons\inv_misc_bandage_08]],				['duration'] = 60,	['display'] = false,},
		[EF_L_RECKLESSCHARGE] 		= {['icon'] = [[Interface\Icons\Spell_nature_astralrecal]], 		['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3},
		[EF_L_SLEEP] 				= {['icon'] = [[Interface\Icons\Spell_nature_sleep]], 				['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3},
		[EF_L_STONEFORM] 			= {['icon'] = [[Interface\Icons\Inv_gauntlets_03]], 				['duration'] = 8,},
		[EF_L_TIDALCHARM] 			= {['icon'] = [[Interface\Icons\Spell_frost_summonwaterelemental]], ['duration'] = 3, 	['type'] = 'magic', 	['prio'] = 2},
		[EF_L_WARDOFTHEEYE]			= {['icon'] = [[Interface\Icons\spell_totem_wardofdraining]],		['duration'] = 6,							['prio'] = 3},
    	[EF_L_WILLOFTHEFORSAKEN]   	= {['icon'] = [[Interface\Icons\Spell_shadow_raisedead]], 			['duration'] = 5,							['prio'] = 2},
    	--!!Kvital CFM Mod
		[EF_L_WARSTOMP]				= {['icon'] = [[Interface\Icons\Ability_warstomp]], 				['duration'] = 2, 	['display'] = true,		['prio'] = 2},
		--!!
            -- ENGINEERING
		[EF_L_FLASHBOMB] 			= {['icon'] = [[Interface\Icons\Spell_Shadow_Darksummoning]], 		['duration'] = 10, 	['prio'] = 2},
		[EF_L_FIREREFLECTOR]       	= {['icon'] = [[Interface\Icons\Spell_fire_sealoffire]], 			['duration'] = 5},
        [EF_L_FROSTREFLECTOR]      	= {['icon'] = [[Interface\Icons\Spell_frost_frostward]], 			['duration'] = 5},     
        [EF_L_SHADOWREFLECTOR]     	= {['icon'] = [[Interface\Icons\Spell_shadow_antishadow]], 			['duration'] = 5},
		[EF_L_THORIUMGRENADE] 		= {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], 			['duration'] = 3, 	['type'] = 'physical', ['prio'] = 2},
		[EF_L_IRONGRENADE] 			= {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], 			['duration'] = 3, 	['type'] = 'physical', ['prio'] = 2},
		
            -- DRUID
		[EF_L_ABOLISHPOISON]       	= {['icon'] = [[Interface\Icons\Spell_nature_nullifypoison_02]],	['duration'] = 8,	['type'] = 'magic' },
		[EF_L_BARKSKIN]				= {['icon'] = [[Interface\Icons\Spell_nature_stoneclawtotem]],		['duration'] = 15,	['type'] = 'magic', 	['prio'] = 2},
		[EF_L_DASH]					= {['icon'] = [[Interface\Icons\ability_druid_dash]],				['duration'] = 15,	['type'] = 'physical',},
		[EF_L_DEMORALIZINGROAR]		= {['icon'] = [[Interface\Icons\ability_druid_demoralizingroar]],	['duration'] = 30,	['display'] = true,},
		[EF_L_ENTANGLINGROOTS] 		= {['icon'] = [[Interface\Icons\Spell_nature_stranglevines]], 		['duration'] = 24, 	['display'] = true,		['type'] = 'magic', 	['prio'] = 1, 	['dr'] = EF_L_CONTROLLEDROOT},
		[EF_L_ENRAGED]				= {['icon'] = [[Interface\Icons\Ability_druid_enrage]],				['duration'] = 10,	['display'] = true,},
		[EF_L_FERALCHARGEEFFECT]	= {['icon'] = [[Interface\Icons\Ability_hunter_pet_bear]],			['duration'] = 4,	['type'] = 'physical', 	['prio'] = 1},
		[EF_L_FRENZIEDREGENERATION]	= {['icon'] = [[Interface\Icons\ability_bullrush]],					['duration'] = 10,	['display'] = true,},
		[EF_L_GROWL]				= {['icon'] = [[Interface\Icons\ability_physical_taunt]],			['duration'] = 3,	['display'] = true,},
		[EF_L_HIBERNATE] 			= {['icon'] = [[Interface\Icons\Spell_nature_sleep]], 				['duration'] = 20, 	['type'] = 'magic', 	['prio'] = 3},
		[EF_L_INNERVATE] 			= {['icon'] = [[Interface\Icons\Spell_nature_lightning]], 			['duration'] = 20, 	['type'] = 'magic', 	['prio'] = 2},
		[EF_L_INSECTSWARM]			= {['icon'] = [[Interface\Icons\Spell_nature_insectswarm]],			['duration'] = 12,	['display'] = true,},
		[EF_L_MOONFIRE]				= {['icon'] = [[Interface\Icons\spell_nature_starfall]],			['duration'] = 12,	['display'] = true,},
		[EF_L_NATURESGRACE]			= {['icon'] = [[Interface\Icons\Spell_nature_naturesblessing]],		['duration'] = 15,	['display'] = true,},
    	[EF_L_NATURESGRASP]        	= {['icon'] = [[Interface\Icons\Spell_nature_natureswrath]], 		['type'] = 'magic', ['duration'] = 45},
		[EF_L_POUNCE]				= {['icon'] = [[Interface\Icons\Ability_druid_supriseattack]],		['duration'] = 2,	['display'] = true,},
		[EF_L_RAKE]					= {['icon'] = [[Interface\Icons\Ability_druid_disembowel]],			['duration'] = 9,	['display'] = true,},
		[EF_L_RIP]					= {['icon'] = [[Interface\Icons\Ability_ghoulfrenzy]],				['duration'] = 12,	['display'] = true,},
		[EF_L_TIGERSFURY]			= {['icon'] = [[Interface\Icons\ability_mount_jungletiger]],		['duration'] = 6,	['display'] = true,},
		
			-- HUNTER 	
		[EF_L_BESTIALWRATH]			= {['icon'] = [[Interface\Icons\ability_druid_ferociousbite]],		['duration'] = 18,							['prio'] = 2},
		[EF_L_CONCUSSIVESHOT]		= {['icon'] = [[Interface\Icons\Spell_frost_stun]],					['duration'] = 4, 	['type'] = 'magic',		['prio'] = 1},
		[EF_L_COUNTERATTACK]		= {['icon'] = [[Interface\Icons\Ability_warrior_challange]],		['duration'] = 5,	['type'] = 'physical',	['prio'] = 1},
		[EF_L_DETERRENCE]			= {['icon'] = [[Interface\Icons\ability_whirlwind]],				['duration'] = 10, 							['prio'] = 1},
		[EF_L_IMMOLATIONTRAPEFFECT]	= {['icon'] = [[Interface\Icons\Spell_fire_flameshock]],			['duration'] = 15,	['display'] = true,},
		[EF_L_IMPROVEDCONCUSSIVESHOT]= {['icon'] = [[Interface\Icons\Spell_frost_stun]], 				['duration'] = 3, 	['type'] = 'magic', 	['prio'] = 2},
		[EF_L_IMPROVEDWINGCLIP]		= {['icon'] = [[Interface\Icons\Ability_rogue_trip]],				['duration'] = 5,	['type'] = 'physical',},
		[EF_L_INTIMIDATION]			= {['icon'] = [[Interface\Icons\ability_devour]],					['duration'] = 3,	['type'] = 'physical',	['prio'] = 1},
		[EF_L_QUICKSHOTS]			= {['icon'] = [[Interface\Icons\ability_warrior_innerrage]],		['duration'] = 12,	['display'] = true,},
		[EF_L_RAPIDFIRE]			= {['icon'] = [[Interface\Icons\ability_hunter_runningshot]],		['duration'] = 15,	['type'] = 'magic',},
		[EF_L_SCATTERSHOT]			= {['icon'] = [[Interface\Icons\Ability_golemstormbolt]],			['duration'] = 4, 	['type'] = 'physical',	['prio'] = 2},
		[EF_L_SCAREBEAST] 			= {['icon'] = [[Interface\Icons\Ability_druid_cower]], 				['duration'] = 10, 	['type'] = 'magic', 	['prio'] = 2, 	['dr'] = EF_L_FEAR},
		[EF_L_SCORPIDSTING]			= {['icon'] = [[Interface\Icons\Ability_hunter_criticalshot]],		['duration'] = 20,	['display'] = true,},
		[EF_L_SERPENTSTING]			= {['icon'] = [[Interface\Icons\Ability_hunter_quickshot]],			['duration'] = 15,	['display'] = true,},
		[EF_L_FREEZINGTRAPEFFECT] 	= {['icon'] = [[Interface\Icons\Spell_frost_chainsofice]], 			['duration'] = 20, 	['type'] = 'magic',		['prio'] = 3},
		[EF_L_VIPERSTING]			= {['icon'] = [[Interface\Icons\Ability_hunter_aimedshot]], 		['duration'] = 8, 	['type'] = 'poison', 	['prio'] = 1},
		[EF_L_WINGCLIP]				= {['icon'] = [[Interface\Icons\Ability_rogue_trip]],				['duration'] = 10,	['type'] = 'physical',},
		[EF_L_WYVERNSTING]			= {['icon'] = [[Interface\Icons\Inv_spear_02]], 					['duration'] = 12, 	['type'] = 'poison', 	['prio'] = 3},
		
            -- MAGE
		[EF_L_ARCANEPOWER]			= {['icon'] = [[Interface\Icons\spell_nature_lightning]],			['duration'] = 15,	['display'] = false,},
		[EF_L_BLASTWAVE] 			= {['icon'] = [[Interface\Icons\Spell_holy_excorcism_02]], 			['duration'] = 6, 	['type'] = 'physical', 	['prio'] = 1},
		[EF_L_CLEARCASTING]			= {['icon'] = [[Interface\Icons\Spell_frost_manaburn]], 			['duration'] = 15,  ['type'] = 'magic', 	},
		[EF_L_COUNTERSPELLSILENCED] = {['icon'] = [[Interface\Icons\Spell_frost_iceshock]], 			['duration'] = 4,  	['type'] = 'magic', 	['prio'] = 2},
		[EF_L_CONEOFCOLD] 			= {['icon'] = [[Interface\Icons\Spell_frost_glacier]], 				['duration'] = 10, 	['type'] = 'magic',		['display'] = false,},
		[EF_L_CHILLED] 				= {['icon'] = [[Interface\Icons\Spell_frost_frostarmor02]], 		['duration'] = 7, 	['display'] = true,},
		[EF_L_FIREBALL]				= {['icon'] = [[Interface\Icons\Spell_fire_flamebolt]],				['duration'] = 8,	['display'] = false,},
		[EF_L_FROSTBITE] 			= {['icon'] = [[Interface\Icons\Spell_frost_frostarmor]], 			['duration'] = 5, 	['type'] = 'magic', 	['prio'] = 1},
		[EF_L_FROSTNOVA] 			= {['icon'] = [[Interface\Icons\Spell_frost_frostnova]], 			['duration'] = 8, 	['type'] = 'magic', 	['prio'] = 1, 	['dr'] = EF_L_CONTROLLEDROOT},
    	[EF_L_FROSTWARD]           	= {['icon'] = [[Interface\Icons\Spell_frost_frostward]], 			['duration'] = 30, 	['type'] = 'magic'},
		[EF_L_FROSTBOLT]			= {['icon'] = [[Interface\Icons\Spell_frost_frostbolt02]], 			['duration'] = 10, 	['type'] = 'magic',		['display'] = false,},
    	[EF_L_FIREWARD]            	= {['icon'] = [[Interface\Icons\Spell_fire_firearmor]], 			['duration'] = 30, 	['type'] = 'magic'},
		--['Ice Barrier']			= {['icon'] = [[Interface\Icons\Spell_ice_lament]], 				['duration'] = 60, 	['type'] = 'magic'},
    	[EF_L_ICEBLOCK]            	= {['icon'] = [[Interface\Icons\Spell_frost_frost]], 				['duration'] = 10, 	['prio'] = 5},
		[EF_L_IMPACT] 				= {['icon'] = [[Interface\Icons\Spell_fire_meteorstorm]], 			['duration'] = 2, 	['type'] = 'physical', 	['prio'] = 1},
		[EF_L_FIREVULNERABILITY]	= {['icon'] = [[Interface\Icons\Spell_fire_soulburn]],				['duration'] = 30,	['display'] = false,},
		[EF_L_POLYMORPH] 			= {['icon'] = [[Interface\Icons\Spell_nature_polymorph]], 			['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3, 	['dr'] = EF_L_POLYMORPH},
		[EF_L_POLYMORPHPIG]         = {['icon'] = [[Interface\Icons\Spell_magic_polymorphpig]], 		['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3, 	['dr'] = EF_L_POLYMORPH},
		[EF_L_POLYMORPHTURTLE]      = {['icon'] = [[Interface\Icons\Ability_hunter_pet_turtle]],		['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3, 	['dr'] = EF_L_POLYMORPH},
		[EF_L_PYROBLAST]			= {['icon'] = [[Interface\Icons\Spell_fire_fireball02]],			['duration'] = 12,	['display'] = false,},
		[EF_L_SLOWFALL]				= {['icon'] = [[Interface\Icons\spell_magic_featherfall]],			['duration'] = 30,	['display'] = true,},
		[EF_L_WINTERSCHILL]			= {['icon'] = [[Interface\Icons\Spell_frost_chillingblast]], 		['duration'] = 15, 	['type'] = 'magic', 	['display'] = false,},
		
            -- PALADIN
		[EF_L_BLESSINGOFSACRIFICE]	= {['icon'] = [[Interface\Icons\spell_holy_sealofsacrifice]],		['duration'] = 30,	['display'] = false,},
    	[EF_L_BLESSINGOFPROTECTION]	= {['icon'] = [[Interface\Icons\Spell_holy_sealofprotection]], 		['duration'] = 10, 	['type'] = 'magic', 	['prio'] = 2},
    	[EF_L_BLESSINGOFFREEDOM]   	= {['icon'] = [[Interface\Icons\Spell_holy_sealofvalor]], 			['duration'] = 16, 	['type'] = 'magic'},
    	[EF_L_DIVINEPROTECTION]    	= {['icon'] = [[Interface\Icons\Spell_holy_restoration]], 			['duration'] = 8, 	['prio'] = 4},
		[EF_L_DIVINESHIELD]			= {['icon'] = [[Interface\Icons\Spell_holy_divineintervention]], 	['duration'] = 12, 	['prio'] = 5},
		[EF_L_FORBEARANCE]			= {['icon'] = [[Interface\Icons\spell_holy_removecurse]], 			['duration'] = 60, 	['display'] = false,},
		[EF_L_HAMMEROFJUSTICE] 		= {['icon'] = [[Interface\Icons\Spell_holy_sealofmight]], 			['duration'] = 5, 	['type'] = 'magic',		['prio'] = 1,	['dr'] = EF_L_CONTROLLEDSTUN},
		[EF_L_JUDGEMENTOFTHECRUSADER]= {['icon'] = [[Interface\Icons\Spell_holy_holysmite]], 			['duration'] = 10, 	['type'] = 'magic',						['display'] = false,},
		[EF_L_JUDGEMENTOFJUSTICE] 	= {['icon'] = [[Interface\Icons\Spell_holy_sealofwrath]], 			['duration'] = 10, 	['type'] = 'magic',						['display'] = false,},
		[EF_L_JUDJEMENTOFLIGHT] 	= {['icon'] = [[Interface\Icons\spell_holy_healingaura]], 			['duration'] = 10, 	['type'] = 'magic',						['display'] = false,},
		[EF_L_JUDGEMENTOFWISDOM] 	= {['icon'] = [[Interface\Icons\Spell_holy_righteousnessaura]], 	['duration'] = 10, 	['type'] = 'magic',						['display'] = false,},
		[EF_L_REPENTANCE] 			= {['icon'] = [[Interface\Icons\Spell_holy_prayerofhealing]], 		['duration'] = 6, 	['type'] = 'magic', 	['prio'] = 3},
		[EF_L_SEALOFCOMMAND]		= {['icon'] = [[Interface\Icons\Ability_warrior_innerrage]],		['duration'] = 30,	['display'] = false,},
		[EF_L_SEALOFJUSTICE]		= {['icon'] = [[Interface\Icons\Spell_holy_sealofwrath]],			['duration'] = 30,	['display'] = false,},
		[EF_L_SEALOFLIGHT]			= {['icon'] = [[Interface\Icons\spell_holy_healingaura]],			['duration'] = 30,	['display'] = false,},		
		[EF_L_SEALOFRIGHTEOUSNESS]	= {['icon'] = [[Interface\Icons\Ability_ThunderBolt]],				['duration'] = 30,	['display'] = false,},
		[EF_L_SEALOFTHECRUSADER]	= {['icon'] = [[Interface\Icons\Spell_holy_holysmite]],				['duration'] = 30,	['display'] = false,},
		[EF_L_SEALOFWISDOM]			= {['icon'] = [[Interface\Icons\Spell_holy_righteousnessaura]],		['duration'] = 30,	['display'] = false,},
		[EF_L_STUN] 				= {['icon'] = [[Interface\Icons\Spell_frost_stun]], 				['duration'] = 2, 	['display'] = true,		['type'] = 'physical', 				 	['display'] = false,},
		[EF_L_VENGEANCE]			= {['icon'] = [[Interface\Icons\Spell_holy_righteousnessaura]],		['duration'] = 8,	['display'] = false,},
		[EF_L_VINDICATION]			= {['icon'] = [[Interface\Icons\Spell_holy_vindication]],			['duration'] = 10,	['display'] = false,},
		
            -- PRIEST
		[EF_L_ABOLISHDISEASE]		= {['icon'] = [[Interface\Icons\Spell_nature_nullifydisease]],		['duration'] = 8,	['display'] = false,},
		[EF_L_BLACKOUT] 			= {['icon'] = [[Interface\Icons\Spell_shadow_gathershadows]], 		['duration'] = 3, 	['type'] = 'magic', 	['prio'] = 1},
		[EF_L_DEVOURINGPLAGUE]		= {['icon'] = [[Interface\Icons\Spell_shadow_blackplague]],			['duration'] = 24,	['display'] = true,},
		[EF_L_LIGHTWELLRENEW]		= {['icon'] = [[Interface\Icons\spell_holy_summonlightwell]],		['duration'] = 10,	['display'] = false,},
		[EF_L_MINDFLAY] 			= {['icon'] = [[Interface\Icons\Spell_shadow_siphonmana]], 			['duration'] = 3, 	['type'] = 'magic', 	['display'] = false,},
    	[EF_L_POWERWORDSHIELD]    	= {['icon'] = [[Interface\Icons\Spell_holy_powerwordshield]], 		['duration'] = 30, 	['type'] = 'magic'},
		[EF_L_POWERINFUSION]		= {['icon'] = [[Interface\Icons\spell_holy_powerinfusion]], 		['duration'] = 15, 	['type'] = 'magic'},
		[EF_L_PSYCHICSCREAM] 		= {['icon'] = [[Interface\Icons\Spell_shadow_psychicscream]], 		['duration'] = 8, 	['type'] = 'magic', 	['prio'] = 1, 	['dr'] = EF_L_FEAR},
		[EF_L_SHADOWVULNERABILITY]	= {['icon'] = [[Interface\Icons\Spell_shadow_blackplague]],			['duration'] = 15,	['display'] = true},
		[EF_L_SHADOWWORDPAIN]		= {['icon'] = [[Interface\Icons\spell_shadow_shadowwordpain]],		['duration'] = 24,	['display'] = true,},
		[EF_L_SILENCE]				= {['icon'] = [[Interface\Icons\Spell_shadow_impphaseshift]], 		['duration'] = 5, 	['type'] = 'magic', 	['prio'] = 2},
		[EF_L_RENEW]				= {['icon'] = [[Interface\Icons\spell_holy_renew]],					['duration'] = 15,	['display'] = false,},
		[EF_L_WEAKENEDSOUL]			= {['icon'] = [[Interface\Icons\spell_holy_ashestoashes]],			['duration'] = 15,	['display'] = false,},
		
		--[[	ROGUE 	]]--
		[EF_L_ADRENALINERUSH]		= {['icon'] = [[Interface\Icons\spell_shadow_shadowworddominate]],	['duration'] = 15,	},
		[EF_L_BLADEFLURRY]			= {['icon'] = [[Interface\Icons\ability_warrior_punishingblow]],	['duration'] = 15,	['display'] = false,},
		[EF_L_BLIND]				= {['icon'] = [[Interface\Icons\Spell_shadow_mindsteal]],			['duration'] = 10,	['type'] = 'poison',	['prio'] = 3},
		[EF_L_CHEAPSHOT] 			= {['icon'] = [[Interface\Icons\Ability_cheapshot]], 				['duration'] = 4, 	['type'] = 'physical', 	['prio'] = 1},
		[EF_L_CRIPPLINGPOISON]		= {['icon'] = [[Interface\Icons\Ability_poisonsting]],				['duration'] = 12,	['type'] = 'poison',	['display'] = false,},
		[EF_L_DEADLYPOISONV]		= {['icon'] = [[Interface\Icons\ability_rogue_dualweild]],			['duration'] = 12,	['display'] = false,},
		[EF_L_EVASION]				= {['icon'] = [[Interface\Icons\spell_shadow_shadowward]],			['duration'] = 15,	['display'] = false,},
		[EF_L_EXPOSEARMOR]			= {['icon'] = [[Interface\Icons\Ability_warrior_riposte]],			['duration'] = 30,	['display'] = false,},
		[EF_L_GARROTE]				= {['icon'] = [[Interface\Icons\ability_rogue_garrote]],			['duration'] = 18,	['display'] = true,},
		[EF_L_GHOSTLYSTRIKE]		= {['icon'] = [[Interface\Icons\Spell_shadow_curse]],				['duration'] = 7,	['display'] = false,},
		[EF_L_GOUGE] 				= {['icon'] = [[Interface\Icons\Ability_gouge]], 					['duration'] = 5, 	['type'] = 'physical', 	['prio'] = 2, 	['dr'] = EF_L_DISORIENT},
		[EF_L_HEMORRHAGE]			= {['icon'] = [[Interface\Icons\spell_shadow_lifedrain]],			['duration'] = 15,	['display'] = false,},
		[EF_L_KICKSILENCED] 		= {['icon'] = [[Interface\Icons\Ability_kick]], 					['duration'] = 2, 	['type'] = 'physical', 	['prio'] = 1},
		[EF_L_MINDNUMBINGPOISON3]	= {['icon'] = [[Interface\Icons\spell_nature_nullifydisease]],		['duration'] = 14,	['display'] = false,},
		[EF_L_RIPOSTE]				= {['icon'] = [[Interface\Icons\Ability_warrior_challange]],		['duration'] = 6,	['type'] = 'physical',	['prio'] = 1},
		[EF_L_SAP] 					= {['icon'] = [[Interface\Icons\Ability_sap]], 						['duration'] = 11, 	['display'] = true,		['type'] = 'physical', 	['prio'] = 3, 	['dr'] = EF_L_DISORIENT},
		[EF_L_SPRINT]				= {['icon'] = [[Interface\Icons\Ability_rogue_sprint]],				['duration'] = 15,	['display'] = true,		['prio'] = 1},
		[EF_L_KIDNEYSHOT] 			= {['icon'] = [[Interface\Icons\Ability_rogue_kidneyshot]], 		['duration'] = 6, 	['type'] = 'physical', 	['prio'] = 2,	['dr'] = EF_L_CONTROLLEDSTUN},
		[EF_L_WOUNDPOISONIV]		= {['icon'] = [[Interface\Icons\Inv_misc_herb_16]],					['duration'] = 15,	['type'] = 'poison',	['display'] = false,},
		
			-- SHAMAN
		[EF_L_EARTHBIND]			= {['icon'] = [[Interface\Icons\spell_nature_strengthofearthtotem02]],['duration'] = 5,	['type'] = 'magic',},
		[EF_L_FLAMESHOCK]			= {['icon'] = [[Interface\Icons\spell_fire_flameshock]],			['duration'] = 12,	['display'] = true,},
		[EF_L_FOCUSEDCASTING]		= {['icon'] = [[Interface\Icons\Spell_arcane_blink]],				['duration'] = 6,	['display'] = false,},
		[EF_L_FROSTSHOCK]			= {['icon'] = [[Interface\Icons\Spell_frost_frostshock]],			['duration'] = 8,	['display'] = true,		['type'] = 'magic',		['prio'] = 1, 	['dr'] = EF_L_FROSTSHOCK},
		[EF_L_GROUNDINGTOTEMEFFECT]	= {['icon'] = [[Interface\Icons\Spell_nature_groundingtotem]],		['duration'] = 10,	['type'] = 'magic',		['prio'] = 3},
		[EF_L_HEALINGWAY]			= {['icon'] = [[Interface\Icons\Spell_nature_healingway]],			['duration'] = 15,	['display'] = false,},
		[EF_L_MANATIDETOTEM]		= {['icon'] = [[Interface\Icons\Spell_frost_summonwaterelemental]],	['duration'] = 12,},
		[EF_L_STORMSTRIKE]			= {['icon'] = [[Interface\Icons\Spell_holy_sealofmight]],			['duration'] = 12,	['display'] = true,},
		
		     -- WARLOCK
		[EF_L_CORRUPTION]			= {['icon'] = [[Interface\Icons\Spell_shadow_abominationexplosion]],['duration'] = 18,	['display'] = true,},
		[EF_L_CURSEOFAGONY]			= {['icon'] = [[Interface\Icons\Spell_shadow_curseofsargeras]],		['duration'] = 24,	['display'] = true,},
		[EF_L_CURSEOFEXHAUSTION]	= {['icon'] = [[Interface\Icons\Spell_shadow_grimward]],			['duration'] = 30,	['display'] = true,		['type'] = 'curse',},
		[EF_L_CURSEOFTONGUES]		= {['icon'] = [[Interface\Icons\Spell_shadow_curseoftounges]],		['duration'] = 30,	['display'] = true,		['type'] = 'curse',},
		[EF_L_DEATHCOIL]			= {['icon'] = [[Interface\Icons\Spell_shadow_deathcoil]],			['duration'] = 3,	['display'] = true,		['type'] = 'magic',		['prio'] = 1},
		[EF_L_DRAINLIFE]			= {['icon'] = [[Interface\Icons\Spell_shadow_lifedrain02]],			['duration'] = 5,	['display'] = false,},
		[EF_L_DRAINMANA]			= {['icon'] = [[Interface\Icons\Spell_shadow_siphonmana]],			['duration'] = 5,	['display'] = false,},
		[EF_L_DRAINSOUL]			= {['icon'] = [[Interface\Icons\Spell_shadow_haunting]],			['duration'] = 15,	['display'] = true,},
		[EF_L_FEAR] 				= {['icon'] = [[Interface\Icons\Spell_shadow_possession]], 			['duration'] = 15, 	['display'] = true,		['type'] = 'magic', 	['prio'] = 2, 	['dr'] = EF_L_FEAR},
		[EF_L_HEALTHFUNNEL]			= {['icon'] = [[Interface\Icons\Spell_shadow_lifedrain]],			['duration'] = 10,	['display'] = false,},
		[EF_L_IMMOLATE]				= {['icon'] = [[Interface\Icons\Spell_fire_immolation]],			['duration'] = 15, 	['type'] = 'magic',						['display'] = true,},
		[EF_L_SEDUCTION]			= {['icon'] = [[Interface\Icons\Spell_shadow_mindsteal]],			['duration'] = 10, 	['type'] = 'magic', 	['prio'] = 3, 	['dr'] = EF_L_FEAR},
		[EF_L_SHADOWBURN]			= {['icon'] = [[Interface\Icons\spell_shadow_scourgebuild]],		['duration'] = 5,	['display'] = false,},
    	[EF_L_SHADOWTRANCE] 		= {['icon'] = [[Interface\Icons\Spell_shadow_twilight]], 			['duration'] = 10, 	['type'] = 'magic'},
		[EF_L_SHADOWWARD]			= {['icon'] = [[Interface\Icons\Spell_shadow_antishadow]],			['duration'] = 30,	['type'] = 'magic'},
		[EF_L_SIPHONLIFE]			= {['icon'] = [[Interface\Icons\Spell_shadow_requiem]],				['duration'] = 30,	['display'] = false,},
	
		--[[	WARRRIOR 	]]--
		[EF_L_BERSERKERRAGE]		= {['icon'] = [[Interface\Icons\Spell_nature_ancestralguardian]],	['duration'] = 10,										},
		[EF_L_BLOODRAGE]			= {['icon'] = [[Interface\Icons\Ability_racial_bloodrage]], 		['duration'] = 10,	['display'] = false,},
		[EF_L_BLOODTHIRST]			= {['icon'] = [[Interface\Icons\spell_nature_bloodlust]], 			['duration'] = 8,	['display'] = false,},
		[EF_L_CHALLENGINGSHOUT]		= {['icon'] = [[Interface\Icons\Ability_bullrush]], 				['duration'] = 6,	['display'] = false,},
		[EF_L_CHARGE] 				= {['icon'] = [[Interface\Icons\Spell_frost_stun]], 				['duration'] = 1, 	['type'] = 'physical', 	['prio'] = 1,	['dr'] = EF_L_CONTROLLEDSTUN},
		[EF_L_CONCUSSIONBLOW] 		= {['icon'] = [[Interface\Icons\Ability_thunderbolt]], 				['duration'] = 5, 	['type'] = 'physical', 	['prio'] = 1},
		[EF_L_DEATHWISH]			= {['icon'] = [[Interface\Icons\Spell_shadow_deathpact]], 			['duration'] = 30,},
		[EF_L_DEEPWOUNDS]			= {['icon'] = [[Interface\Icons\Ability_backstab]], 				['duration'] = 12,	['display'] = false,},
		[EF_L_DEMORALIZINGSHOUT]	= {['icon'] = [[Interface\Icons\ability_warrior_warcry]], 			['duration'] = 30,	['display'] = false,},
		[EF_L_DISARM] 				= {['icon'] = [[Interface\Icons\Ability_warrior_disarm]], 			['duration'] = 8, 	['display'] = true,		['type'] = 'physical', 	['prio'] = 1},
		[EF_L_ENRAGE]				= {['icon'] = [[Interface\Icons\Spell_shadow_unholyfrenzy]], 		['duration'] = 12,	['display'] = false,},
		[EF_L_HAMSTRING] 			= {['icon'] = [[Interface\Icons\Ability_shockwave]], 				['duration'] = 15, 	['display'] = true,		['type'] = 'physical', 	['prio'] = 1},		
		[EF_L_IMPROVEDHAMSTRING] 	= {['icon'] = [[Interface\Icons\Ability_shockwave]], 				['duration'] = 5, 	['display'] = true,		['type'] = 'physical', 	['prio'] = 2},
		[EF_L_INTERCEPTSTUN] 		= {['icon'] = [[Interface\Icons\Spell_frost_stun]], 				['duration'] = 3, 	['type'] = 'physical', 	['prio'] = 1,	['dr'] = EF_L_CONTROLLEDSTUN},
		[EF_L_INTIMIDATINGSHOUT]	= {['icon'] = [[Interface\Icons\Ability_golemthunderclap]], 		['duration'] = 8, 	['type'] = 'physical', 	['prio'] = 2, 	['dr'] = EF_L_FEAR},
		[EF_L_LASTSTAND]			= {['icon'] = [[Interface\Icons\spell_holy_ashestoashes]], 			['duration'] = 20,  ['display'] = true,},
		[EF_L_MACESTUNEFFECT]		= {['icon'] = [[Interface\Icons\Spell_frost_stun]],					['duration'] = 3,	['type'] = 'physical',	['prio'] = 1,},
		[EF_L_MORTALSTRIKE] 		= {['icon'] = [[Interface\Icons\Ability_warrior_savageblow]], 		['duration'] = 10, 	['type'] = 'physical'},
		[EF_L_REND]					= {['icon'] = [[Interface\Icons\Ability_gouge]], 					['duration'] = 21,	['display'] = true,},
		[EF_L_RETALIATION]			= {['icon'] = [[Interface\Icons\Ability_warrior_challange]],		['duration'] = 15,							['prio'] = 2,},
		[EF_L_SHIELDBASHSILENCED] 	= {['icon'] = [[Interface\Icons\Ability_warrior_shieldbash]], 		['duration'] = 3, 	['type'] = 'magic',		['prio'] = 2},
		[EF_L_SHIELDBLOCK]			= {['icon'] = [[Interface\Icons\ability_defend]], 					['duration'] = 5,	['display'] = false,},
		[EF_L_SHIELDWALL] 			= {['icon'] = [[Interface\Icons\Ability_warrior_shieldwall]], 		['duration'] = 10, 	['display'] = true,		['prio'] = 2},
		[EF_L_SWEEPINGSTRIKES]		= {['icon'] = [[Interface\Icons\Ability_rogue_slicedice]], 			['duration'] = 20,	['display'] = false,},
		[EF_L_THUNDERCLAP]			= {['icon'] = [[Interface\Icons\Spell_nature_thunderclap]], 		['duration'] = 30,	['display'] = true,},
    }
	
	SPELLINFO_UNIQUE_DEBUFFS = {
		[EF_L_KIDNEYSHOT] 	= {['icon'] = [[Interface\Icons\Ability_rogue_kidneyshot]], ['cp'] = {2, 3, 4, 5, 6}, 		['type'] = 'physical', ['prio'] = 2,	['dr'] = EF_L_CONTROLLEDSTUN},
		[EF_L_RUPTURE] 		= {['icon'] = [[Interface\Icons\Ability_rogue_rupture]], 	['cp'] = {8, 10, 12, 14, 16}, 	['type'] = 'physical', ['display'] = true,},
	}	
	
	-- used to check if mouseover cast should be aimed at mouseover target
	SPELLINFO_SINGLE_TARGET_BUFF_SPELLS = {
		-- DRUID
		[EF_L_ABOLISHPOISON] = true, 	[EF_L_CUREPOISON] = true, 	[EF_L_HEALINGTOUCH] = true, [EF_L_MARKOFTHEWILD] = true, [EF_L_REBIRTH] = true, 
		[EF_L_REGROWTH] = true,		[EF_L_REJUVENATION] = true, 	[EF_L_REMOVECURSE] = true,
		
		-- MAGE
		[EF_L_AMPLIFYMAGIC] = true, [EF_L_ARCANEINTELLECT] = true, [EF_L_DAMPENMAGIC] = true, [EF_L_REMOVELESSERCURSE] = true, 
		
		-- PALADIN
		[EF_L_BLESSINGOFPROTECTION] = true, 	[EF_L_BLESSINGOFFREEDOM] = true, 	[EF_L_BLESSINGOFKINGS] = true, 	[EF_L_BLESSINGOFMIGHT] = true, 
		[EF_L_BLESSINGOFSANCTUARY] = true,	[EF_L_BLESSINGOFSACRIFICE] = true,	[EF_L_BLESSINGOFWISDOM] = true, 	[EF_L_CLEANSE] = true, 
		[EF_L_DIVINEINTERVENTION] = true, 	[EF_L_FLASHOFLIGHT] = true, 			[EF_L_HOLYLIGHT] = true, 			[EF_L_LAYOFHANDS] = true, 
		[EF_L_PURIFY] = true, 
		
		-- PRIEST
		[EF_L_CUREDISEASE] = true, 		[EF_L_DIVINESPIRIT] = true, 	[EF_L_GREATERHEAL] = true, 		[EF_L_FEARWARD] = true, 			[EF_L_FLASHHEAL] = true, 
		[EF_L_HEAL] = true, 			[EF_L_LESSERHEAL] = true, 		[EF_L_POWERINFUSION] = true, 	[EF_L_POWERWORDFORTITUDE] = true,	
		[EF_L_POWERWORDSHIELD] = true, 	[EF_L_RENEW] = true, 			[EF_L_SHADOWPROTECTION] = true,
		
		-- SHAMAN
		[EF_L_CHAINHEAL] = true, 		[EF_L_HEALINGWAVE] = true, 		[EF_L_LESSERHEALINGWAVE] = true,
	}
	
	SPELLINFO_DEBUFF_REFRESHING_SPELLS = {
		-- DRUID
		[EF_L_MOONFIRE]			= {EF_L_MOONFIRE},
		[EF_L_RAKE]				= {EF_L_RAKE},
		[EF_L_RIP]		  		= {EF_L_RIP},
		
		-- HUNTER
		[EF_L_WINGCLIP]			= {EF_L_WINGCLIP,},
		-- MAGE
		[EF_L_FIREBALL] 		= {EF_L_FIREBALL, },		
		[EF_L_BLIZZARD] 		= {EF_L_WINTERSCHILL,},
		[EF_L_CONEOFCOLD] 		= {EF_L_WINTERSCHILL,},
		[EF_L_FROSTNOVA] 		= {EF_L_WINTERSCHILL,},
		[EF_L_FROSTBOLT] 		= {EF_L_FROSTBOLT, EF_L_WINTERSCHILL,},
		[EF_L_SCORCH]			= {EF_L_IMPROVEDSCORCH,},
		-- PALADIN
		[EF_L_JUDGEMENTOFTHECRUSADER] = {EF_L_JUDGEMENTOFTHECRUSADER,}, [EF_L_JUDGEMENTOFJUSTICE] = {EF_L_JUDGEMENTOFJUSTICE,}, [EF_L_JUDJEMENTOFLIGHT] = {EF_L_JUDJEMENTOFLIGHT,},
		[EF_L_JUDGEMENTOFWISDOM] = {EF_L_JUDGEMENTOFWISDOM,},
		-- PRIEST
		[EF_L_MINDFLAY] 				= {EF_L_SHADOWVULNERABILITY,},
		[EF_L_MINDBLAST] 				= {EF_L_SHADOWVULNERABILITY,},
		[EF_L_SHADOWVULNERABILITY] 		= {EF_L_SHADOWVULNERABILITY,},
		-- ROGUE
		[EF_L_HEMORRHAGE]			= {EF_L_HEMORRHAGE,},
		[EF_L_WOUNDPOISONIV] 		= {EF_L_WOUNDPOISONIV,},
		[EF_L_DEADLYPOISONV] 		= {EF_L_DEADLYPOISONV,},
		-- SHAMAN
		[EF_L_FLAMESHOCK]		= {EF_L_FLAMESHOCK,},
		[EF_L_FROSTSHOCK]		= {EF_L_FROSTSHOCK,},
		-- WARLOCK
		[EF_L_IMMOLATE]			= {EF_L_IMMOLATE,},
		-- WARRRIOR
		[EF_L_HAMSTRING]		= {EF_L_HAMSTRING,},
		[EF_L_MORTALSTRIKE]		= {EF_L_MORTALSTRIKE,},
	}
	
	SPELLINFO_ROOTS_SNARES = {
		-- MISC
		[EF_L_NETOMATIC] = {EF_L_NETOMATIC,}, 
		-- DRUID
		[EF_L_ENTANGLINGROOTS] = {EF_L_ENTANGLINGROOTS,}, [EF_L_FERALCHARGEEFFECT] = {EF_L_FERALCHARGEEFFECT,}, 
		-- HUNTER
		[EF_L_CONCUSSIVESHOT] = {EF_L_CONCUSSIVESHOT,}, [EF_L_WINGCLIP] = {EF_L_WINGCLIP,}, [EF_L_IMPROVEDWINGCLIP] = {EF_L_IMPROVEDWINGCLIP,}, 
		-- MAGE
		[EF_L_BLASTWAVE] = {EF_L_BLASTWAVE,}, [EF_L_CONEOFCOLD] = {EF_L_CONEOFCOLD,}, [EF_L_FROSTBITE] = {EF_L_FROSTBITE,}, [EF_L_FROSTNOVA] = {EF_L_FROSTNOVA,}, [EF_L_FROSTBOLT] = {EF_L_FROSTBOLT,}, 
		-- PALADIN		
		-- PRIEST	
		[EF_L_MINDFLAY] = {EF_L_MINDFLAY,},
		-- ROGUE 
		-- SHAMAN
		[EF_L_FROSTSHOCK]	 = {EF_L_FROSTSHOCK,},	
		-- WARRRIOR	
		[EF_L_HAMSTRING] = {EF_L_HAMSTRING,}, [EF_L_IMPROVEDHAMSTRING] = {EF_L_IMPROVEDHAMSTRING,},
	}
	--