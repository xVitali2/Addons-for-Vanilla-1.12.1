	-- Taken from enemyFrames by kuuurtz
	-- https://github.com/zetone/enemyFrames

	if FOCUS_BORDER_DEBUFFS_COLOR then return end
local BS = AceLibrary("Babble-Spell-2.2")
local B = AceLibrary("Babble-Item-2.0")
	FOCUS_BORDER_DEBUFFS_COLOR = {
		["none"]		= { 0.8, 0.0, 0.0, 1.0 },
		["curse"]		= { 0.6, 0.0, 1.0, 1.0 },
		["disease"]		= { 0.6, 0.4, 0.0, 1.0 },
		["magic"]		= { 0.2, 0.6, 1.0, 1.0 },
		["physical"]	= { 0.8, 0.0, 0.0, 1.0 },
		["poison"] 		= { 0.0, 0.6, 0.0, 1.0 },
	}

	FOCUS_INTERRUPTS_TO_TRACK = {
		[BS["Kick"]] = true,
		[BS["Earth Shock"]] = true,
		[BS["Pummel"]] = true,
		[BS["Shield Bash"]] = true,
	}

	FOCUS_INTERRUPT_BUFFS_TO_TRACK = {
		-- MISC
		[BS['Inferno Effect']] = true, [B['Iron Grenade']] = true,  [BS['Reckless Charge']] = true, [BS['Tidal Charm']] = true, [B['Thorium Grenade']] = true,
		-- DRUID
		[BS['Bash']] = true, 					[BS['Bear Form']] = true, 	 [BS['Cat Form']] = true,				[BS['Dire Bear Form']] = true,
		[BS['Feral Charge Effect']] = true, 	[BS['Moonkin Form']] = true, [BS['Nature\'s Swiftness']] =  true, 	[BS['Pounce']] = true,
		[BS['Travel Form']] = true, 			[BS['Starfire Stun']] = true,
		-- HUNTER
		[BS['Aspect of the Cheetah']] =  true, 	 [BS['Aspect of the Hawk']] =  true, [BS['Aspect of the Monkey']] =  true, 	[BS['Freezing Trap Effect']] = true,
		[BS['Improved Concussive Shot']] = true, [BS['Intimidation']] = true, 		 [BS['Scatter Shot']] = true, 			[BS['Wyvern Sting']] = true,
		-- MAGE
		[BS['Blink']] = true, 		[BS['Counterspell - Silenced']] = true,  [BS['Fire Ward']] = true, 	[BS['Frost Armor']] = true,	[BS['Frost Ward']] = true,
		[BS['Ice Barrier']] = true, [BS['Ice Armor']] = true, 				[BS['Ice Block']] = true, 	[BS['Impact']] = true, 		[BS['Mage Armor']] = true,
		[BS['Mana Shield']] = true, [BS['Polymorph']] = true, 				[BS['Polymorph: Pig']] = true, 							[BS['Polymorph: Turtle']] = true,
		-- PALADIN
		[BS['Divine Intervention']] = true, 	[BS['Divine Protection']] = true, 		[BS['Divine Shield']] = true, [BS['Hammer of Justice']] = true,
		[BS['Seal of the Crusader']] = true, 	[BS['Seal of Righteousness']] = true, 	[BS['Stun']] = true,
		-- PRIEST
		[BS['Blackout']] = true, [BS['Inner Fire']] = true, [BS['Psychic Scream']] = true,   [BS['Silence']] = true,
		-- ROGUE
		[BS['Blind']] = true, [BS['Cheap Shot']] = true, [BS['Gouge']] = true, [BS['Kidney Shot']] = true, [BS['Kick - Silenced']] = true,
		-- SHAMAN
		[BS['Elemental Mastery']] =  true, [BS['Ghost Wolf']] = true, [BS['Lightning Shield']] = true, [BS['Nature\'s Swiftness']] =  true,
		-- WARLOCK
		[BS['Death Coil']] = true, [BS['Fear']] = true, [BS['Shadow Ward']] = true, [BS['Spell Lock']] = true,
		-- WARRIOR
		[BS['Charge Stun']] = true, [BS['Concussion Blow']] = true, [BS['Intercept Stun']] = true, 	[BS['Intimidating Shout']] = true, [BS['Mace Stun Effect']] = true,
		[BS['Revenge Stun']] = true, 	[BS['Shield Bash - Silenced']] = true,
	}

	FOCUS_TIME_MODIFIER_BUFFS_TO_TRACK = {
		[BS['Barkskin']]					= {['mod'] = 1.4, 	['list'] = {'all'}},	-- its 1 second flat increase but 1.4 should be close enough
		[BS['Curse of Tongues']] 			= {['mod'] = 1.6, 	['list'] = {'all'}},

		[BS['Curse of the Eye']] 			= {['mod'] = 1.2, 	['list'] = {'all'}},

		[BS['Mind-numbing Poison']] 		= {['mod'] = 1.6, 	['list'] = {'all'}},	[BS['Mind-numbing Poison II']] 		= {['mod'] = 1.6, 	['list'] = {'all'}},	[BS['Mind-numbing Poison III']] 		= {['mod'] = 1.6, 	['list'] = {'all'}},

		[B['Fang of the Crystal Spider']] 	= {['mod'] = 1.1, 	['list'] = {'all'}},

		[BS['Nature\'s Swiftness']] 		= {['mod'] = 0.1, 	['list'] = {BS['Chain Heal'], BS['Chain Lightning'], BS['Far Sight'], BS['Ghost Wolf'], BS['Healing Wave'], BS['Lesser Healing Wave'], BS['Lightning Bolt'],   -- shaman
															BS['Entangling Roots'], BS['Healing Touch'], BS['Hibernate'], BS['Rebirth'], BS['Regrowth'], BS['Soothe Animal'], BS['Wrath']}}, -- druid

		[BS['Rapid Fire']]					= {['mod'] = .6, 	['list'] = {BS['Aimed Shot']}},
		[BS['Shadow Trance']] 				= {['mod'] = 0, 	['list'] = {BS['Shadow Bolt']}},
		[BS['Fel Domination']]				= {['mod'] = 0.05, 	['list'] = {BS['Summon Felhunter'], BS['Summon Imp'], BS['Summon Succubus'], BS['Summon Voidwalker']}},

		[BS['Presence of Mind']] 			= {['mod'] = 0, 	['list'] = {BS['Fireball'], BS['Frostbolt'], BS['Pyroblast'], BS['Scorch'], BS['Polymorph'], BS['Polymorph: Pig'], BS['Polymorph: Turtle']}},
		[BS['Mind Quickening']]				= {['mod'] = 0.66, 	['list'] = {BS['Fireball'], BS['Frostbolt'], BS['Pyroblast'], BS['Scorch'], BS['Polymorph'], BS['Polymorph: Pig'], BS['Polymorph: Turtle']}},
	}

	FOCUS_BUFFS_TO_TRACK = {

		-- MISC & MOBS
		[BS['First Aid']]				= {['icon'] = [[Interface\Icons\Spell_holy_heal]],					['duration'] = 8,	['display'] = true,},
		[BS['Flee']]					= {['icon'] = [[Interface\Icons\spell_magic_polymorphchicken]],		['duration'] = 10,},
		[B['Free Action']]     			= {['icon'] = [[Interface\Icons\Inv_potion_04]], 					['duration'] = 30, 	['type'] = 'magic', 	['prio'] = 4},
		[BS['Invulnerability']]        	= {['icon'] = [[Interface\Icons\Spell_holy_divineintervention]], 	['duration'] = 6, 	['type'] = 'magic',		['prio'] = 5},
		[B['Living Free Action']] 		= {['icon'] = [[Interface\Icons\Inv_potion_07]], 					['duration'] = 5, 	['type'] = 'magic', 	['prio'] = 4},
		[B['Net-o-Matic']]        		= {['icon'] = [[Interface\Icons\ability_ensnare]], 					['duration'] = 10, 	['type'] = 'physical',	['prio'] = 2},
		[BS['Perception']]        		= {['icon'] = [[Interface\Icons\Spell_nature_sleep]], 				['duration'] = 20,},
		[BS['Recently Bandaged']]		= {['icon'] = [[Interface\Icons\inv_misc_bandage_08]],				['duration'] = 60,	['display'] = true,},
		[BS["Reckless Charge"]] 		= {['icon'] = [[Interface\Icons\Spell_nature_astralrecal]], 		['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3},
		[BS["Sleep"]] 					= {['icon'] = [[Interface\Icons\Spell_nature_sleep]], 				['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3},
		[BS['Stoneform']] 				= {['icon'] = [[Interface\Icons\Inv_gauntlets_03]], 				['duration'] = 8,},
		[BS['Tidal Charm']] 			= {['icon'] = [[Interface\Icons\Spell_frost_summonwaterelemental]], ['duration'] = 3, 	['type'] = 'magic', 	['prio'] = 2},
		[BS['Ward of the Eye']]			= {['icon'] = [[Interface\Icons\spell_totem_wardofdraining]],		['duration'] = 6,							['prio'] = 3},
		[BS['Will of the Forsaken']]   	= {['icon'] = [[Interface\Icons\Spell_shadow_raisedead]], 			['duration'] = 5,							['prio'] = 2},
		[BS['Drink']]   				= {['icon'] = [[Interface\Icons\INV_Drink_07]], 					['duration'] = 0},

			-- ENGINEERING
		[BS["Flash Bomb"]] 				= {['icon'] = [[Interface\Icons\Spell_Shadow_Darksummoning]], 		['duration'] = 10, 	['prio'] = 2},
		[B['Fire Reflector']]         	= {['icon'] = [[Interface\Icons\Spell_fire_sealoffire]], 			['duration'] = 5},
		[B['Frost Reflector']]        	= {['icon'] = [[Interface\Icons\Spell_frost_frostward]], 			['duration'] = 5},
		[B['Shadow Reflector']]       	= {['icon'] = [[Interface\Icons\Spell_shadow_antishadow]], 			['duration'] = 5},
		[B['Thorium Grenade']] 			= {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], 			['duration'] = 3, 	['type'] = 'physical', ['prio'] = 2},
		[B['Iron Grenade']] 			= {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], 			['duration'] = 3, 	['type'] = 'physical', ['prio'] = 2},

			-- DRUID
		[BS['Abolish Poison']]         	= {['icon'] = [[Interface\Icons\Spell_nature_nullifypoison_02]],	['duration'] = 8,	['type'] = 'magic' },
		[BS['Barkskin']]				= {['icon'] = [[Interface\Icons\Spell_nature_stoneclawtotem]],		['duration'] = 15,	['type'] = 'magic', 	['prio'] = 2},
		[BS['Dash']]					= {['icon'] = [[Interface\Icons\ability_druid_dash]],				['duration'] = 15,	['type'] = 'physical',},
		[BS['Demoralizing Roar']]		= {['icon'] = [[Interface\Icons\ability_druid_demoralizingroar]],	['duration'] = 30,	['display'] = true,},
		[BS['Entangling Roots']] 		= {['icon'] = [[Interface\Icons\Spell_nature_stranglevines]], 		['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 1, 	['dr'] = 'Controlled Root'},
		[BS['Enrage']]					= {['icon'] = [[Interface\Icons\Ability_druid_enrage]],				['duration'] = 10,	['display'] = true,},
		[BS['Feral Charge Effect']]		= {['icon'] = [[Interface\Icons\Ability_hunter_pet_bear]],			['duration'] = 4,	['type'] = 'physical', 	['prio'] = 1},
		[BS['Frenzied Regeneration']]	= {['icon'] = [[Interface\Icons\ability_bullrush]],					['duration'] = 10,	['display'] = true,},
		[BS['Growl']]					= {['icon'] = [[Interface\Icons\ability_physical_taunt]],			['duration'] = 3,	['display'] = true,},
		[BS["Hibernate"]] 				= {['icon'] = [[Interface\Icons\Spell_nature_sleep]], 				['duration'] = 20, 	['type'] = 'magic', 	['prio'] = 3},
		[BS['Innervate']] 				= {['icon'] = [[Interface\Icons\Spell_nature_lightning]], 			['duration'] = 20, 	['type'] = 'magic', 	['prio'] = 2},
		[BS['Insect Swarm']]			= {['icon'] = [[Interface\Icons\Spell_nature_insectswarm]],			['duration'] = 12,	['display'] = true,},
		[BS['Moonfire']]				= {['icon'] = [[Interface\Icons\spell_nature_starfall]],			['duration'] = 12,	['display'] = true,},
		[BS['Nature\'s Grace']]			= {['icon'] = [[Interface\Icons\Spell_nature_naturesblessing]],		['duration'] = 15,	['display'] = true,},
		[BS['Nature\'s Grasp']]        	= {['icon'] = [[Interface\Icons\Spell_nature_natureswrath]], 		['type'] = 'magic', ['duration'] = 45},
		[BS['Pounce']]					= {['icon'] = [[Interface\Icons\Ability_druid_supriseattack]],		['duration'] = 2,	['display'] = true,},
		[BS['Rake']]					= {['icon'] = [[Interface\Icons\Ability_druid_disembowel]],			['duration'] = 9,	['display'] = true,},
		[BS['Rip']]						= {['icon'] = [[Interface\Icons\Ability_ghoulfrenzy]],				['duration'] = 12,	['display'] = true,},
		[BS['Tiger\'s Fury']]			= {['icon'] = [[Interface\Icons\ability_mount_jungletiger]],		['duration'] = 6,	['display'] = true,},

		--[[	HUNTER 	]]--
		[BS['Bestial Wrath']]			= {['icon'] = [[Interface\Icons\ability_druid_ferociousbite]],		['duration'] = 18,							['prio'] = 2},
		[BS['Concussive Shot']]			= {['icon'] = [[Interface\Icons\Spell_frost_stun]],					['duration'] = 4, 	['type'] = 'magic',		['prio'] = 1},
		[BS['Counterattack']]			= {['icon'] = [[Interface\Icons\Ability_warrior_challange]],		['duration'] = 5,	['type'] = 'physical',	['prio'] = 1},
		[BS['Deterrence']]				= {['icon'] = [[Interface\Icons\ability_whirlwind]],				['duration'] = 10, 							['prio'] = 1},
		[BS['Immolation Trap Effect']]	= {['icon'] = [[Interface\Icons\Spell_fire_flameshock]],			['duration'] = 15,	['display'] = true,},
		[BS['Improved Concussive Shot']] = {['icon'] = [[Interface\Icons\Spell_frost_stun]], 				['duration'] = 3, 	['type'] = 'magic', 	['prio'] = 2},
		[BS['Improved Wing Clip']]		= {['icon'] = [[Interface\Icons\Ability_rogue_trip]],				['duration'] = 5,	['type'] = 'physical',},
		[BS['Intimidation']]			= {['icon'] = [[Interface\Icons\ability_devour]],					['duration'] = 3,	['type'] = 'physical',	['prio'] = 1},
		[BS['Quick Shots']]				= {['icon'] = [[Interface\Icons\ability_warrior_innerrage]],		['duration'] = 12,	['display'] = true,},
		[BS['Rapid Fire']]				= {['icon'] = [[Interface\Icons\ability_hunter_runningshot]],		['duration'] = 15,	['type'] = 'magic',},
		[BS['Scatter Shot']]			= {['icon'] = [[Interface\Icons\Ability_golemstormbolt]],			['duration'] = 4, 	['type'] = 'physical',	['prio'] = 2},
		[BS["Scare Beast"]] 			= {['icon'] = [[Interface\Icons\Ability_druid_cower]], 				['duration'] = 10, 	['type'] = 'magic', 	['prio'] = 2, 	['dr'] = BS['Fear']},
		[BS['Scorpid Sting']]			= {['icon'] = [[Interface\Icons\Ability_hunter_criticalshot]],		['duration'] = 20,	['display'] = true,},
		[BS['Serpent Sting']]			= {['icon'] = [[Interface\Icons\Ability_hunter_quickshot]],			['duration'] = 15,	['display'] = true,},
		[BS["Freezing Trap Effect"]] 	= {['icon'] = [[Interface\Icons\Spell_frost_chainsofice]], 			['duration'] = 20, 	['type'] = 'magic',		['prio'] = 3},
		[BS['Viper Sting']]				= {['icon'] = [[Interface\Icons\Ability_hunter_aimedshot]], 		['duration'] = 8, 	['type'] = 'poison', 	['prio'] = 1},
		[BS['Wing Clip']]				= {['icon'] = [[Interface\Icons\Ability_rogue_trip]],				['duration'] = 10,	['type'] = 'physical',},
		[BS['Wyvern Sting']]			= {['icon'] = [[Interface\Icons\Inv_spear_02]], 					['duration'] = 12, 	['type'] = 'poison', 	['prio'] = 3},
		--['Feign Death']				= {['icon'] = [[Interface\Icons\Ability_Rogue_FeignDeath]], 		['duration'] = 0},

			-- MAGE
		[BS['Arcane Power']]			= {['icon'] = [[Interface\Icons\spell_nature_lightning]],			['duration'] = 15,	['display'] = true,},
		[BS['Blast Wave']] 				= {['icon'] = [[Interface\Icons\Spell_holy_excorcism_02]], 			['duration'] = 6, 	['type'] = 'physical', 	['prio'] = 1},
		[BS['Clearcasting']]			= {['icon'] = [[Interface\Icons\Spell_frost_manaburn]], 			['duration'] = 15,  ['type'] = 'magic', 	},
		[BS['Counterspell - Silenced']] = {['icon'] = [[Interface\Icons\Spell_frost_iceshock]], 			['duration'] = 4,  	['type'] = 'magic', 	['prio'] = 2},
		[BS["Cone of Cold"]] 			= {['icon'] = [[Interface\Icons\Spell_frost_glacier]], 				['duration'] = 10, 	['type'] = 'magic',		['display'] = true,},
		[BS["Chilled"]] 				= {['icon'] = [[Interface\Icons\Spell_frost_frostarmor02]], 		['duration'] = 7, 	['type'] = 'magic', ['display'] = true,},
		[BS['Fireball']]				= {['icon'] = [[Interface\Icons\Spell_fire_flamebolt]],				['duration'] = 8,	['type'] = 'physical', ['display'] = true,},
		[BS["Frostbite"]] 				= {['icon'] = [[Interface\Icons\Spell_frost_frostarmor]], 			['duration'] = 5, 	['type'] = 'magic', 	['prio'] = 1},
		[BS["Frost Nova"]] 				= {['icon'] = [[Interface\Icons\Spell_frost_frostnova]], 			['duration'] = 8, 	['type'] = 'magic', 	['prio'] = 1, 	['dr'] = 'Controlled Root'},
		[BS['Frost Ward']]             	= {['icon'] = [[Interface\Icons\Spell_frost_frostward]], 			['duration'] = 30, 	['type'] = 'magic'},
		[BS['Frostbolt']]				= {['icon'] = [[Interface\Icons\Spell_frost_frostbolt02]], 			['duration'] = 10, 	['type'] = 'magic',		['display'] = true,},
		[BS['Fire Ward']]              	= {['icon'] = [[Interface\Icons\Spell_fire_firearmor]], 			['duration'] = 30, 	['type'] = 'magic'},
		[BS['Ice Barrier']]				= {['icon'] = [[Interface\Icons\Spell_ice_lament]], 				['duration'] = 60, 	['type'] = 'magic'},
		[BS['Ice Block']]              	= {['icon'] = [[Interface\Icons\Spell_frost_frost]], 				['duration'] = 10, 	['prio'] = 5},
		[BS['Impact']]					= {['icon'] = [[Interface\Icons\Spell_fire_meteorstorm]], 			['duration'] = 2, 	['type'] = 'physical', 	['prio'] = 1},
		[BS['Fire Vulnerability']]		= {['icon'] = [[Interface\Icons\Spell_fire_soulburn]],				['duration'] = 30,	['display'] = true,},
		[BS["Polymorph"]] 				= {['icon'] = [[Interface\Icons\Spell_nature_polymorph]], 			['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3, 	['dr'] = BS['Polymorph']},
		[BS['Polymorph: Pig']]          = {['icon'] = [[Interface\Icons\Spell_magic_polymorphpig]], 		['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3, 	['dr'] = BS['Polymorph']},
		[BS['Polymorph: Turtle']]       = {['icon'] = [[Interface\Icons\Ability_hunter_pet_turtle]],		['duration'] = 12, 	['type'] = 'magic', 	['prio'] = 3, 	['dr'] = BS['Polymorph']},
		[BS['Pyroblast']]				= {['icon'] = [[Interface\Icons\Spell_fire_fireball02]],			['duration'] = 12,	['display'] = true,},
		[BS['Slow Fall']]				= {['icon'] = [[Interface\Icons\spell_magic_featherfall]],			['duration'] = 30,	['display'] = true,},
		[BS['Winter\'s Chill']]			= {['icon'] = [[Interface\Icons\Spell_frost_chillingblast]], 		['duration'] = 15, 	['type'] = 'magic', 	['display'] = true,},

		--['Frost Armor']				= {['icon'] = [[Interface\Icons\spell_frost_frostarmor02]],			['duration'] = 30,	['display'] = true,},

			-- PALADIN
		[BS['Blessing of Sacrifice']]	= {['icon'] = [[Interface\Icons\spell_holy_sealofsacrifice]],		['duration'] = 30,	['display'] = true,},
		[BS['Blessing of Protection']] 	= {['icon'] = [[Interface\Icons\Spell_holy_sealofprotection]], 		['duration'] = 10, 	['type'] = 'magic', 	['prio'] = 2},
		[BS['Blessing of Freedom']]    	= {['icon'] = [[Interface\Icons\Spell_holy_sealofvalor]], 			['duration'] = 16, 	['type'] = 'magic'},
		[BS['Divine Protection']]      	= {['icon'] = [[Interface\Icons\Spell_holy_restoration]], 			['duration'] = 8, 	['prio'] = 4},
		[BS['Divine Shield']]			= {['icon'] = [[Interface\Icons\Spell_holy_divineintervention]], 	['duration'] = 12, 	['prio'] = 5},
		[BS['Forbearance']]				= {['icon'] = [[Interface\Icons\spell_holy_removecurse]], 			['duration'] = 60, 	['display'] = true,},
		[BS["Hammer of Justice"]] 		= {['icon'] = [[Interface\Icons\Spell_holy_sealofmight]], 			['duration'] = 5, 	['type'] = 'magic',		['prio'] = 1,	['dr'] = 'Controlled Stun'},
		[BS['Judgement of the Crusader']] = {['icon'] = [[Interface\Icons\Spell_holy_holysmite]], 			['duration'] = 10, 	['type'] = 'magic',						['display'] = true,},
		[BS['Judgement of Justice']] 	= {['icon'] = [[Interface\Icons\Spell_holy_sealofwrath]], 			['duration'] = 10, 	['type'] = 'magic',						['display'] = true,},
		[BS['Judgement of Light']] 		= {['icon'] = [[Interface\Icons\spell_holy_healingaura]], 			['duration'] = 10, 	['type'] = 'magic',						['display'] = true,},
		[BS['Judgement of Wisdom']] 	= {['icon'] = [[Interface\Icons\Spell_holy_righteousnessaura]], 	['duration'] = 10, 	['type'] = 'magic',						['display'] = true,},
		[BS['Repentance']] 				= {['icon'] = [[Interface\Icons\Spell_holy_prayerofhealing]], 		['duration'] = 6, 	['type'] = 'magic', 	['prio'] = 3},
		[BS['Seal of Command']]			= {['icon'] = [[Interface\Icons\Ability_warrior_innerrage]],		['duration'] = 30,	['display'] = true,},
		[BS['Seal of Justice']]			= {['icon'] = [[Interface\Icons\Spell_holy_sealofwrath]],			['duration'] = 30,	['display'] = true,},
		[BS['Seal of Light']]			= {['icon'] = [[Interface\Icons\spell_holy_healingaura]],			['duration'] = 30,	['display'] = true,},
		[BS['Seal of Righteousness']]	= {['icon'] = [[Interface\Icons\Ability_ThunderBolt]],				['duration'] = 30,	['display'] = true,},
		[BS['Seal of the Crusader']]	= {['icon'] = [[Interface\Icons\Spell_holy_holysmite]],				['duration'] = 30,	['display'] = true,},
		[BS['Seal of Wisdom']]			= {['icon'] = [[Interface\Icons\Spell_holy_righteousnessaura]],		['duration'] = 30,	['display'] = true,},
		[BS['Stun']] 					= {['icon'] = [[Interface\Icons\Spell_frost_stun]], 				['duration'] = 2, 	['type'] = 'physical', 				 	['display'] = true,},
		[BS['Vengeance']]				= {['icon'] = [[Interface\Icons\Spell_holy_righteousnessaura]],		['duration'] = 8,	['display'] = true,},
		[BS['Vindication']]				= {['icon'] = [[Interface\Icons\Spell_holy_vindication]],			['duration'] = 10,	['display'] = true,},

			-- PRIEST
		[BS['Abolish Disease']]			= {['icon'] = [[Interface\Icons\Spell_nature_nullifydisease]],		['duration'] = 8,	['display'] = true,},
		[BS['Blackout']]				= {['icon'] = [[Interface\Icons\Spell_shadow_gathershadows]], 		['duration'] = 3, 	['type'] = 'magic', 	['prio'] = 1},
		[BS['Devouring Plague']]		= {['icon'] = [[Interface\Icons\Spell_shadow_blackplague]],			['duration'] = 24,	['display'] = true,},
		[BS['Lightwell Renew']]			= {['icon'] = [[Interface\Icons\spell_holy_summonlightwell]],		['duration'] = 10,	['display'] = true,},
		[BS['Mind Flay']] 				= {['icon'] = [[Interface\Icons\Spell_shadow_siphonmana]], 			['duration'] = 3, 	['type'] = 'magic', 	['display'] = true,},
		[BS['Power Word: Shield']]    	= {['icon'] = [[Interface\Icons\Spell_holy_powerwordshield]], 		['duration'] = 30, 	['type'] = 'magic'},
		[BS['Power Infusion']]			= {['icon'] = [[Interface\Icons\spell_holy_powerinfusion]], 		['duration'] = 15, 	['type'] = 'magic'},
		[BS['Psychic Scream']] 			= {['icon'] = [[Interface\Icons\Spell_shadow_psychicscream]], 		['duration'] = 8, 	['type'] = 'magic', 	['prio'] = 1, 	['dr'] = BS['Fear']},
		[BS['Shadow Vulnerability']]	= {['icon'] = [[Interface\Icons\Spell_shadow_blackplague]],			['duration'] = 15,	['display'] = true},
		[BS['Shadow Word: Pain']]		= {['icon'] = [[Interface\Icons\spell_shadow_shadowwordpain]],		['duration'] = 24,	['display'] = true,},
		[BS['Silence']]					= {['icon'] = [[Interface\Icons\Spell_shadow_impphaseshift]], 		['duration'] = 5, 	['type'] = 'magic', 	['prio'] = 2},
		[BS['Renew']]					= {['icon'] = [[Interface\Icons\spell_holy_renew]],					['duration'] = 15,	['display'] = true,},
		[BS['Weakened Soul']]			= {['icon'] = [[Interface\Icons\spell_holy_ashestoashes]],			['duration'] = 15,	['display'] = true,},
		[BS['Vampiric Embrace']]		= {['icon'] = [[Interface\Icons\spell_shadow_unsummonbuilding]],	['duration'] = 15, 	['type'] = 'curse'},

		--[[	ROGUE 	]]--
		[BS['Adrenaline Rush']]			= {['icon'] = [[Interface\Icons\spell_shadow_shadowworddominate]],	['duration'] = 15,	},
		[BS['Blade Flurry']]			= {['icon'] = [[Interface\Icons\ability_warrior_punishingblow]],	['duration'] = 15,	['display'] = true,},
		[BS['Blind']]					= {['icon'] = [[Interface\Icons\Spell_shadow_mindsteal]],			['duration'] = 10,	['type'] = 'poison',	['prio'] = 3},
		[BS["Cheap Shot"]] 				= {['icon'] = [[Interface\Icons\Ability_cheapshot]], 				['duration'] = 4, 	['type'] = 'physical', 	['prio'] = 1},
		[BS['Crippling Poison']]		= {['icon'] = [[Interface\Icons\Ability_poisonsting]],				['duration'] = 12,	['type'] = 'poison',	['display'] = true,},
		[BS['Deadly Poison V']]			= {['icon'] = [[Interface\Icons\ability_rogue_dualweild]],			['duration'] = 12,	['display'] = true,},
		[BS['Evasion']]					= {['icon'] = [[Interface\Icons\spell_shadow_shadowward]],			['duration'] = 15,	['display'] = true,},
		[BS['Expose Armor']]			= {['icon'] = [[Interface\Icons\Ability_warrior_riposte]],			['duration'] = 30,	['display'] = true,},
		[BS['Garrote']]					= {['icon'] = [[Interface\Icons\ability_rogue_garrote]],			['duration'] = 18,	['display'] = true,},
		[BS['Ghostly Strike']]			= {['icon'] = [[Interface\Icons\Spell_shadow_curse]],				['duration'] = 7,	['display'] = true,},
		[BS["Gouge"]] 					= {['icon'] = [[Interface\Icons\Ability_gouge]], 					['duration'] = 5, 	['type'] = 'physical', 	['prio'] = 2, 	['dr'] = 'Disorient'},
		[BS['Hemorrhage']]				= {['icon'] = [[Interface\Icons\spell_shadow_lifedrain]],			['duration'] = 15,	['display'] = true,},
		[BS['Kick - Silenced']] 		= {['icon'] = [[Interface\Icons\Ability_kick]], 					['duration'] = 2, 	['type'] = 'physical', 	['prio'] = 1},
		[BS['Mind-numbing Poison III']]	= {['icon'] = [[Interface\Icons\spell_nature_nullifydisease]],		['duration'] = 14,	['display'] = true,},
		[BS['Riposte']]					= {['icon'] = [[Interface\Icons\Ability_warrior_challange]],		['duration'] = 6,	['type'] = 'physical',	['prio'] = 1},
		[BS["Sap"]] 					= {['icon'] = [[Interface\Icons\Ability_sap]], 						['duration'] = 11, 	['type'] = 'physical', 	['prio'] = 3, 	['dr'] = 'Disorient'},
		[BS['Sprint']]					= {['icon'] = [[Interface\Icons\Ability_rogue_sprint]],				['duration'] = 15,							['prio'] = 1},
		[BS['Kidney Shot']] 			= {['icon'] = [[Interface\Icons\Ability_rogue_kidneyshot]], 		['duration'] = 6, 	['type'] = 'physical', 	['prio'] = 2,	['dr'] = 'Controlled Stun'},
		[BS['Wound Poison IV']]			= {['icon'] = [[Interface\Icons\Inv_misc_herb_16]],					['duration'] = 15,	['type'] = 'poison',	['display'] = true,},

			-- SHAMAN
		[BS['Earthbind']]				= {['icon'] = [[Interface\Icons\spell_nature_strengthofearthtotem02]],['duration'] = 5,	['type'] = 'magic',},
		[BS['Flame Shock']]				= {['icon'] = [[Interface\Icons\spell_fire_flameshock]],			['duration'] = 12,	['display'] = true,},
		[BS['Focused Casting']]			= {['icon'] = [[Interface\Icons\Spell_arcane_blink]],				['duration'] = 6,	['display'] = true,},
		[BS['Frost Shock']]				= {['icon'] = [[Interface\Icons\Spell_frost_frostshock]],			['duration'] = 8,	['type'] = 'magic',		['prio'] = 1, 	['dr'] = BS['Frost Shock']},
		[BS['Grounding Totem Effect']]	= {['icon'] = [[Interface\Icons\Spell_nature_groundingtotem]],		['duration'] = 10,	['type'] = 'magic',		['prio'] = 3},
		[BS['Healing Way']]				= {['icon'] = [[Interface\Icons\Spell_nature_healingway]],			['duration'] = 15,	['display'] = true,},
		[BS['Mana Tide Totem']]			= {['icon'] = [[Interface\Icons\Spell_frost_summonwaterelemental]],	['duration'] = 12,},
		[BS['Stormstrike']]				= {['icon'] = [[Interface\Icons\Spell_holy_sealofmight]],			['duration'] = 12,	['display'] = true,},

			 -- WARLOCK
		[BS['Corruption']]				= {['icon'] = [[Interface\Icons\Spell_shadow_abominationexplosion]],['duration'] = 18,	['display'] = true,},
		[BS['Curse of Agony']]			= {['icon'] = [[Interface\Icons\Spell_shadow_curseofsargeras]],		['duration'] = 24,	['display'] = true,},
		[BS['Curse of Exhaustion']]		= {['icon'] = [[Interface\Icons\Spell_shadow_grimward]],			['duration'] = 30,	['type'] = 'curse',},
		[BS['Curse of Tongues']]		= {['icon'] = [[Interface\Icons\Spell_shadow_curseoftounges]],		['duration'] = 30,	['type'] = 'curse',},
		[BS['Death Coil']]				= {['icon'] = [[Interface\Icons\Spell_shadow_deathcoil]],			['duration'] = 3,	['type'] = 'magic',		['prio'] = 1},
		[BS['Drain Life']]				= {['icon'] = [[Interface\Icons\Spell_shadow_lifedrain02]],			['duration'] = 5,	['display'] = true,},
		[BS['Drain Mana']]				= {['icon'] = [[Interface\Icons\Spell_shadow_siphonmana]],			['duration'] = 5,	['display'] = true,},
		[BS['Drain Soul']]				= {['icon'] = [[Interface\Icons\Spell_shadow_haunting]],			['duration'] = 15,											['display'] = true,},
		[BS["Fear"]] 					= {['icon'] = [[Interface\Icons\Spell_shadow_possession]], 			['duration'] = 15, 	['type'] = 'magic', 	['prio'] = 2, 	['dr'] = 'Fear'},
		[BS['Health Funnel']]			= {['icon'] = [[Interface\Icons\Spell_shadow_lifedrain]],			['duration'] = 10,	['display'] = true,},
		[BS['Immolate']]				= {['icon'] = [[Interface\Icons\Spell_fire_immolation]],			['duration'] = 15, 	['type'] = 'magic',						['display'] = true,},
		[BS['Seduction']]				= {['icon'] = [[Interface\Icons\Spell_shadow_mindsteal]],			['duration'] = 10, 	['type'] = 'magic', 	['prio'] = 3, 	['dr'] = BS['Fear']},
		[BS['Shadowburn']]				= {['icon'] = [[Interface\Icons\spell_shadow_scourgebuild]],		['duration'] = 5,	['display'] = true,},
		[BS['Shadow Trance']] 			= {['icon'] = [[Interface\Icons\Spell_shadow_twilight]], 			['duration'] = 10, 	['type'] = 'magic'},
		[BS['Shadow Ward']]				= {['icon'] = [[Interface\Icons\Spell_shadow_antishadow]],			['duration'] = 30,	['type'] = 'magic'},
		[BS['Siphon Life']]				= {['icon'] = [[Interface\Icons\Spell_shadow_requiem]],				['duration'] = 30,	['display'] = true,},
		[BS['Demon Skin']]				= {['icon'] = [[Interface\Icons\Spell_shadow_ragingscream]],		['duration'] = 60*3,},
		[BS['Demon Armor']]				= {['icon'] = [[Interface\Icons\Spell_shadow_ragingscream]],		['duration'] = 60*3,},

		--[[	WARRRIOR 	]]--
		[BS['Berserker Rage']]			= {['icon'] = [[Interface\Icons\Spell_nature_ancestralguardian]],	['duration'] = 10,										},
		[BS['Bloodrage']]				= {['icon'] = [[Interface\Icons\Ability_racial_bloodrage]], 		['duration'] = 10,	['display'] = true,},
		[BS['Bloodthirst']]				= {['icon'] = [[Interface\Icons\spell_nature_bloodlust]], 			['duration'] = 8,	['display'] = true,},
		[BS['Challenging Shout']]		= {['icon'] = [[Interface\Icons\Ability_bullrush]], 				['duration'] = 6,	['display'] = true,},
		[BS['Charge']] 					= {['icon'] = [[Interface\Icons\Spell_frost_stun]], 				['duration'] = 1, 	['type'] = 'physical', 	['prio'] = 1,	['dr'] = 'Controlled Stun'},
		[BS['Concussion Blow']] 		= {['icon'] = [[Interface\Icons\Ability_thunderbolt]], 				['duration'] = 5, 	['type'] = 'physical', 	['prio'] = 1},
		[BS['Death Wish']]				= {['icon'] = [[Interface\Icons\Spell_shadow_deathpact]], 			['duration'] = 30,},
		[BS['Deep Wounds']]				= {['icon'] = [[Interface\Icons\Ability_backstab]], 				['duration'] = 12,	['display'] = true,},
		[BS['Demoralizing Shout']]		= {['icon'] = [[Interface\Icons\ability_warrior_warcry]], 			['duration'] = 30,	['display'] = true,},
		[BS['Disarm']] 					= {['icon'] = [[Interface\Icons\Ability_warrior_disarm]], 			['duration'] = 8, 	['type'] = 'physical', 	['prio'] = 1},
		[BS['Enrage']]					= {['icon'] = [[Interface\Icons\Spell_shadow_unholyfrenzy]], 		['duration'] = 12,	['display'] = true,},
		[BS['Hamstring']]				= {['icon'] = [[Interface\Icons\Ability_shockwave]], 				['duration'] = 15, 	['type'] = 'physical', 	['prio'] = 1},
		[BS['Improved Hamstring']] 		= {['icon'] = [[Interface\Icons\Ability_shockwave]], 				['duration'] = 5, 	['type'] = 'physical', 	['prio'] = 2},
		[BS['Intercept Stun']] 			= {['icon'] = [[Interface\Icons\Spell_frost_stun]], 				['duration'] = 3, 	['type'] = 'physical', 	['prio'] = 1,	['dr'] = 'Controlled Stun'},
		[BS['Intimidating Shout']]		= {['icon'] = [[Interface\Icons\Ability_golemthunderclap]], 		['duration'] = 8, 	['type'] = 'physical', 	['prio'] = 2, 	['dr'] = BS['Fear']},
		[BS['Last Stand']]				= {['icon'] = [[Interface\Icons\spell_holy_ashestoashes]], 			['duration'] = 20, },
		[BS['Mace Stun Effect']]		= {['icon'] = [[Interface\Icons\Spell_frost_stun]],					['duration'] = 3,	['type'] = 'physical',	['prio'] = 1,},
		[BS['Mortal Strike']] 			= {['icon'] = [[Interface\Icons\Ability_warrior_savageblow]], 		['duration'] = 10, 	['type'] = 'physical'},
		[BS['Rend']]					= {['icon'] = [[Interface\Icons\Ability_gouge]], 					['duration'] = 21,	['display'] = true,},
		[BS['Retaliation']]				= {['icon'] = [[Interface\Icons\Ability_warrior_challange]],		['duration'] = 15,							['prio'] = 2,},
		[BS['Shield Bash - Silenced']] 	= {['icon'] = [[Interface\Icons\Ability_warrior_shieldbash]], 		['duration'] = 3, 	['type'] = 'magic',		['prio'] = 2},
		[BS['Shield Block']]			= {['icon'] = [[Interface\Icons\ability_defend]], 					['duration'] = 5,	['display'] = true,},
		[BS['Shield Wall']] 			= {['icon'] = [[Interface\Icons\Ability_warrior_shieldwall]], 		['duration'] = 10, 	 						['prio'] = 2},
		[BS['Sweeping Strikes']]		= {['icon'] = [[Interface\Icons\Ability_rogue_slicedice]], 			['duration'] = 20,	['display'] = true,},
		[BS['Thunder Clap']]			= {['icon'] = [[Interface\Icons\Spell_nature_thunderclap]], 		['duration'] = 30,	['display'] = true,},

		----------------

		-- DRUID
		[BS['Abolish Poison']] = { ['icon'] = [[Interface\Icons\spell_nature_nullifypoison_02]], ['duration'] = 12 },
		[BS['Mark of the Wild']] = { ['icon'] = [[Interface\Icons\spell_nature_regeneration]], ['duration'] = 0 },
		[BS['Regrowth']] = { ['icon'] = [[Interface\Icons\spell_nature_resistnature]], ['duration'] = 0 },
		[BS['Rejuvenation']] = { ['icon'] = [[Interface\Icons\spell_nature_rejuvenation]], ['duration'] = 0 },

		-- MAGE
		[BS['Amplify Magic']] = { ['icon'] = [[Interface\Icons\spell_holy_flashheal]], ['duration'] = 0 },
		[BS['Arcane Intellect']] = { ['icon'] = [[Interface\Icons\spell_holy_magicalsentry]], ['duration'] = 0 },
		[BS['Dampen Magic']] = { ['icon'] = [[Interface\Icons\spell_nature_abolishmagic]], ['duration'] = 0 },
		[BS['Mage Armor']] = { ['icon'] = [[Interface\Icons\spell_magearmor]], ['duration'] = 0 },
		[BS['Ice Armor']] = { ['icon'] = [[Interface\Icons\spell_frost_frostarmor02]], ['duration'] = 0 },
		[BS['Frost Armor']] = { ['icon'] = [[Interface\Icons\spell_frost_frostarmor02]], ['duration'] = 0 },
		[BS['Presence of Mind']] = { ['icon'] = [[Interface\Icons\spell_nature_enchantarmor]], ['duration'] = 0 },

		-- PALADIN
		[BS['Blessing of Kings']] = { ['icon'] = [[Interface\Icons\spell_magic_magearmor]], ['duration'] = 0 },
		[BS['Blessing of Might']] = { ['icon'] = [[Interface\Icons\spell_holy_fistofjustice]], ['duration'] = 0 },
		[BS['Blessing of Sanctuary']] = { ['icon'] = [[Interface\Icons\spell_holy_greaterblessingofsanctuary]], ['duration'] = 0 },
		[BS['Blessing of Wisdom']] = { ['icon'] = [[Interface\Icons\spell_holy_sealofwisdom]], ['duration'] = 0 },

		-- PRIEST
		[BS['Divine Spirit']] = { ['icon'] = [[Interface\Icons\spell_holy_divinespirit]], ['duration'] = 0 },
		[BS['Fear Ward']] = { ['icon'] = [[Interface\Icons\Spell_holy_excorcism.png]], ['duration'] = 0 },
		[BS['Power Infusion']] = { ['icon'] = [[Interface\Icons\spell_holy_powerinfusion]], ['duration'] = 0 },
		[BS['Power Word: Fortitude']] = { ['icon'] = [[Interface\Icons\spell_holy_wordfortitude]], ['duration'] = 0 },
		[BS['Power Word: Shield']] = { ['icon'] = [[Interface\Icons\spell_holy_powerwordshield]], ['duration'] = 0 },
		[BS['Renew']] = { ['icon'] = [[Interface\Icons\spell_holy_renew]], ['duration'] = 0 },
		[BS['Shadow Protection']] = { ['icon'] = [[Interface\Icons\spell_shadow_antishadow]], ['duration'] = 0 },

	}

	FOCUS_UNIQUE_DEBUFFS = {
		[BS['Kidney Shot']] = {['icon'] = [[Interface\Icons\Ability_rogue_kidneyshot]], ['cp'] = {2, 3, 4, 5, 6}, 		['type'] = 'physical', ['prio'] = 2,	['dr'] = 'Controlled Stun'},
		[BS['Rupture']] 	= {['icon'] = [[Interface\Icons\Ability_rogue_rupture]], 	['cp'] = {8, 10, 12, 14, 16}, 	['type'] = 'physical', ['display'] = true,},
	}

	FOCUS_DEBUFF_REFRESHING_SPELLS = {
		-- DRUID
		[BS['Moonfire']]		= {BS['Moonfire']},
		[BS['Rake']]			= {BS['Rake']},
		-- HUNTER
		[BS['Wing Clip']]		= {BS['Wing Clip'],},
		-- MAGE
		[BS['Fireball']] 		= {BS['Fireball'], },
		[BS['Blizzard']] 		= {BS['Winter\'s Chill'],},
		[BS['Cone of Cold']] 	= {BS['Winter\'s Chill'],},
		[BS['Frost Nova']] 		= {BS['Winter\'s Chill'],},
		[BS['Frostbolt']] 		= {BS['Frostbolt'], BS['Winter\'s Chill'],},
		[BS['Scorch']]			= {BS['Improved Scorch'],},
		-- PALADIN
		[BS['Judgement of the Crusader']] = {BS['Judgement of the Crusader'],}, [BS['Judgement of Justice']] = {BS['Judgement of Justice'],}, [BS['Judgement of Light']] = {BS['Judgement of Light'],},
		[BS['Judgement of Wisdom']] = {BS['Judgement of Wisdom'],},
		-- PRIEST
		[BS['Mind Flay']] 				= {BS['Shadow Vulnerability'],},
		[BS['Mind Blast']] 				= {BS['Shadow Vulnerability'],},
		[BS['Shadow Vulnerability']] 	= {BS['Shadow Vulnerability'],},
		-- ROGUE
		[BS['Hemorrhage']]			= {BS['Hemorrhage'],},
		[BS['Wound Poison IV']] 	= {BS['Wound Poison IV'],},
		[BS['Deadly Poison V']] 	= {BS['Deadly Poison V'],},
		-- SHAMAN
		[BS['Flame Shock']]		= {BS['Flame Shock'],},
		[BS['Frost Shock']]		= {BS['Frost Shock'],},
		-- WARLOCK
		[BS['Immolate']]		= {BS['Immolate'],},
		-- WARRRIOR
		[BS['Hamstring']]		= {BS['Hamstring'],},
		[BS['Mortal Strike']]	= {BS['Mortal Strike'],},
	}

	FOCUS_ROOTS_SNARES = {
		-- MISC
		[B['Net-o-Matic']] = true,
		-- DRUID
		[BS['Entangling Roots']] = true, [BS['Feral Charge Effect']] = true,
		-- HUNTER
		[BS['Concussive Shot']] = true, [BS['Wing Clip']] = true, [BS['Improved Wing Clip']] = true,
		-- MAGE
		[BS['Blast Wave']] = true, [BS["Cone of Cold"]] = true, [BS["Frostbite"]] = true, [BS["Frost Nova"]] = true, [BS['Frostbolt']] = true,
		-- PALADIN
		-- PRIEST
		[BS['Mind Flay']] = true,
		-- ROGUE
		-- SHAMAN
		[BS['Frost Shock']]	 = true,
		-- WARRRIOR
		[BS['Hamstring']] = true, [BS['Improved Hamstring']] = true,
	}