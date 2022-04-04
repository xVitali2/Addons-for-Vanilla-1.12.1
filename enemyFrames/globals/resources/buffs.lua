local L = enemyFrames.L

SPELLINFO_INTERRUPTS_TO_TRACK = {
	-- MISC 
	-- DRUID
	-- HUNTER
	-- MAGE
	-- PALADIN
	-- PRIEST
	-- ROGUE
	[L['Kick']] = true,
	-- SHAMAN
	[L['Earth Shock']] = true,
	-- WARLOCK
	-- WARRIOR 
	[L['Pummel']] = true,
	[L['Shield Bash']] = true, 
}

SPELLINFO_INTERRUPT_BUFFS_TO_TRACK = {
	-- MISC
	[L['Inferno Effect']] = true,
	[L['Iron Grenade']] = true,
	[L['Reckless Charge']] = true,
	[L['Tidal Charm']] = true,
	[L['Thorium Grenade']] = true,
	[L['War Stomp']] = true,
	-- DRUID
	[L['Bash']] = true,
	[L['Bear Form']] = true,
	[L['Cat Form']] = true,
	[L['Dire Bear Form']] = true, 
	[L['Feral Charge Effect']] = true,
	[L['Moonkin Form']] = true,
	[L['Nature\'s Swiftness']] = true,
	[L['Pounce']] = true, 
	[L['Travel Form']] = true,
	[L['Starfire Stun']] = true,
	-- HUNTER
	[L['Aspect of the Cheetah']] = true,
	[L['Aspect of the Hawk']] = true,
	[L['Aspect of the Monkey']] = true,
	[L['Freezing Trap Effect']] = true, 
	[L['Improved Concussive Shot']] = true,
	[L['Intimidation']] = true,
	[L['Scatter Shot']] = true,
	[L['Wyvern Sting']] = true,
	-- MAGE
	[L['Blink']] = true,
	[L['Counterspell - Silenced']] = true,
	[L['Fire Ward']] = true,
	[L['Frost Armor']] = true,
	[L['Frost Ward']] = true, 
	[L['Ice Barrier']] = true,
	[L['Ice Armor']] = true,
	[L['Ice Block']] = true,
	[L['Impact']] = true,
	[L['Mage Armor']] = true, 
	[L['Mana Shield']] = true,
	[L['Polymorph']] = true,
	[L['Polymorph: Pig']] = true,
	[L['Polymorph: Turtle']] = true,
	-- PALADIN
	[L['Divine Intervention']] = true,
	[L['Divine Protection']] = true,
	[L['Divine Shield']] = true,
	[L['Hammer of Justice']] = true, 
	[L['Seal of the Crusader']] = true,
	[L['Seal of Righteousness']] = true,
	[L['Stun']] = true,
	-- PRIEST
	[L['Blackout']] = true,
	[L['Inner Fire']] = true,
	[L['Psychic Scream']] = true,
	[L['Silence']] = true,
	-- ROGUE
	[L['Blind']] = true,
	[L['Cheap Shot']] = true,
	[L['Gouge']] = true,
	[L['Kidney Shot']] = true,
	[L['Kick - Silenced']] = true,
	-- SHAMAN
	[L['Elemental Mastery']] = true,
	[L['Ghost Wolf']] = true,
	[L['Lightning Shield']] = true,
	[L['Nature\'s Swiftness']] = true,
	-- WARLOCK
	[L['Death Coil']] = true,
	[L['Fear']] = true,
	[L['Seduction']] = true,
	[L['Shadow Ward']] = true,
	[L['Spell Lock']] = true, 
	-- WARRIOR
	[L['Charge Stun']] = true,
	[L['Concussion Blow']] = true,
	[L['Intercept Stun']] = true,
	[L['Intimidating Shout']] = true,
	[L['Mace Stun Effect']] = true, 
	[L['Revenge Stun']] = true,
	[L['Shield Bash - Silenced']] = true, 
}

SPELLINFO_TIME_MODIFIER_BUFFS_TO_TRACK = {
	[L['Barkskin']] = {['mod'] = 1.4, ['list'] = {'all'}}, -- its 1 second flat increase but 1.4 should be close enough
	[L['Curse of Tongues']] = {['mod'] = 1.6, ['list'] = {'all'}},
	
	[L['Curse of the Eye']] = {['mod'] = 1.2, ['list'] = {'all'}},
	
	[L['Mind-numbing Poison']] = {['mod'] = 1.6, ['list'] = {'all'}},
	[L['Mind-numbing Poison II']] = {['mod'] = 1.6, ['list'] = {'all'}},
	[L['Mind-numbing Poison III']] = {['mod'] = 1.6, ['list'] = {'all'}},
	
	[L['Fang of the Crystal Spider']] = {['mod'] = 1.1, ['list'] = {'all'}},
	
	[L['Nature\'s Swiftness']] = {['mod'] = 0.1, ['list'] = {L['Chain Heal'], L['Chain Lightning'], L['Far Sight'], L['Ghost Wolf'], L['Healing Wave'], L['Lesser Healing Wave'], L['Lightning Bolt'], -- shaman
	L['Entangling Roots'], L['Healing Touch'], L['Hibernate'], L['Rebirth'], L['Regrowth'], L['Soothe Animal'], L['Wrath']}}, -- druid
	
	[L['Rapid Fire']] = {['mod'] = .6, ['list'] = {L['Aimed Shot']}},
	[L['Shadow Trance']] = {['mod'] = 0, ['list'] = {L['Shadow Bolt']}},
	[L['Fel Domination']] = {['mod'] = 0.05, ['list'] = {L['Summon Felhunter'], L['Summon Imp'], L['Summon Succubus'], L['Summon Voidwalker']}},
	
	[L['Presence of Mind']] = {['mod'] = 0, ['list'] = {L['Fireball'], L['Frostbolt'], L['Pyroblast'], L['Scorch'], L['Polymorph'], L['Polymorph: Pig'], L['Polymorph: Turtle']}},
	[L['Mind Quickening']] = {['mod'] = 0.66, ['list'] = {L['Fireball'], L['Frostbolt'], L['Pyroblast'], L['Scorch'], L['Polymorph'], L['Polymorph: Pig'], L['Polymorph: Turtle']}}, 
}

SPELLINFO_BUFFS_TO_TRACK = {
	
	-- MISC & MOBS
	[L['Cannibalize']] = {['icon'] = [[Interface\Icons\Ability_racial_cannibalize]], ['duration'] = 10, ['display'] = false,},
	[L['First Aid']] = {['icon'] = [[Interface\Icons\Spell_holy_heal]], ['duration'] = 8, ['display'] = false,},
	[L['Flee']] = {['icon'] = [[Interface\Icons\spell_magic_polymorphchicken]], ['duration'] = 10,},
	[L['Free Action']] = {['icon'] = [[Interface\Icons\Inv_potion_04]], ['duration'] = 30, ['type'] = 'magic', ['prio'] = 4},
	[L['Invulnerability']] = {['icon'] = [[Interface\Icons\Spell_holy_divineintervention]], ['duration'] = 6, ['type'] = 'magic', ['prio'] = 5},
	[L['Living Free Action']] = {['icon'] = [[Interface\Icons\Inv_potion_07]], ['duration'] = 5, ['type'] = 'magic', ['prio'] = 4},
	[L['Net-o-Matic']] = {['icon'] = [[Interface\Icons\ability_ensnare]], ['duration'] = 10, ['type'] = 'physical', ['prio'] = 2},
	[L['Perception']] = {['icon'] = [[Interface\Icons\Spell_nature_sleep]], ['duration'] = 20,},
	[L['Recently Bandaged']] = {['icon'] = [[Interface\Icons\inv_misc_bandage_08]], ['duration'] = 60, ['display'] = false,},
	[L["Reckless Charge"]] = {['icon'] = [[Interface\Icons\Spell_nature_astralrecal]], ['duration'] = 12, ['type'] = 'magic', ['prio'] = 3},
	[L["Sleep"]] = {['icon'] = [[Interface\Icons\Spell_nature_sleep]], ['duration'] = 12, ['type'] = 'magic', ['prio'] = 3},
	[L['Stoneform']] = {['icon'] = [[Interface\Icons\Inv_gauntlets_03]], ['duration'] = 8,},
	[L['Tidal Charm']] = {['icon'] = [[Interface\Icons\Spell_frost_summonwaterelemental]], ['duration'] = 3, ['type'] = 'magic', ['prio'] = 2},
	[L['War Stomp']] = {['icon'] = [[Interface\Icons\Ability_warstomp]], ['duration'] = 2, ['type'] = 'physical', ['prio'] = 1},
	[L['Ward of the Eye']] = {['icon'] = [[Interface\Icons\spell_totem_wardofdraining]], ['duration'] = 6, ['prio'] = 3},
	[L['Will of the Forsaken']] = {['icon'] = [[Interface\Icons\Spell_shadow_raisedead]], ['duration'] = 5, ['prio'] = 2},
	
	-- ENGINEERING
	[L["Flash Bomb"]] = {['icon'] = [[Interface\Icons\Spell_Shadow_Darksummoning]], ['duration'] = 10, ['prio'] = 2},
	[L['Fire Reflector']] = {['icon'] = [[Interface\Icons\Spell_fire_sealoffire]], ['duration'] = 5},
	[L['Frost Reflector']] = {['icon'] = [[Interface\Icons\Spell_frost_frostward]], ['duration'] = 5}, 
	[L['Shadow Reflector']] = {['icon'] = [[Interface\Icons\Spell_shadow_antishadow]], ['duration'] = 5},
	[L['Thorium Grenade']] = {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], ['duration'] = 3, ['type'] = 'physical', ['prio'] = 2},
	[L['Iron Grenade']] = {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], ['duration'] = 3, ['type'] = 'physical', ['prio'] = 2},
	
	-- DRUID
	[L['Abolish Poison']] = {['icon'] = [[Interface\Icons\Spell_nature_nullifypoison_02]], ['duration'] = 8, ['type'] = 'magic' },
	[L['Barkskin']] = {['icon'] = [[Interface\Icons\Spell_nature_stoneclawtotem]], ['duration'] = 15, ['type'] = 'magic', ['prio'] = 2},
	[L['Dash']] = {['icon'] = [[Interface\Icons\ability_druid_dash]], ['duration'] = 15, },
	[L['Demoralizing Roar']] = {['icon'] = [[Interface\Icons\ability_druid_demoralizingroar]], ['duration'] = 30, ['display'] = false,},
	[L['Entangling Roots']] = {['icon'] = [[Interface\Icons\Spell_nature_stranglevines]], ['duration'] = 12, ['type'] = 'magic', ['prio'] = 1, ['dr'] = 'Controlled Root'},
	[L['Enrage']] = {['icon'] = [[Interface\Icons\Ability_druid_enrage]], ['duration'] = 10, ['display'] = false,},
	[L['Feral Charge Effect']] = {['icon'] = [[Interface\Icons\Ability_hunter_pet_bear]], ['duration'] = 4, ['type'] = 'physical', ['prio'] = 1},
	[L['Frenzied Regeneration']] = {['icon'] = [[Interface\Icons\ability_bullrush]], ['duration'] = 10, ['display'] = false,},
	[L['Growl']] = {['icon'] = [[Interface\Icons\ability_physical_taunt]], ['duration'] = 3, ['display'] = false,},
	[L["Hibernate"]] = {['icon'] = [[Interface\Icons\Spell_nature_sleep]], ['duration'] = 20, ['type'] = 'magic', ['prio'] = 3},
	[L['Innervate']] = {['icon'] = [[Interface\Icons\Spell_nature_lightning]], ['duration'] = 20, ['type'] = 'magic', ['prio'] = 2},
	[L['Insect Swarm']] = {['icon'] = [[Interface\Icons\Spell_nature_insectswarm]], ['duration'] = 12, ['display'] = false,},
	[L['Moonfire']] = {['icon'] = [[Interface\Icons\spell_nature_starfall]], ['duration'] = 12, ['display'] = false,},
	[L['Nature\'s Grace']] = {['icon'] = [[Interface\Icons\Spell_nature_naturesblessing]], ['duration'] = 15, ['display'] = false,},
	[L['Nature\'s Grasp']] = {['icon'] = [[Interface\Icons\Spell_nature_natureswrath]], ['type'] = 'magic', ['duration'] = 45},
	[L['Pounce']] = {['icon'] = [[Interface\Icons\Ability_druid_supriseattack]], ['duration'] = 2, ['display'] = false,},
	[L['Rake']] = {['icon'] = [[Interface\Icons\Ability_druid_disembowel]], ['duration'] = 9, ['display'] = false,},
	[L['Rip']] = {['icon'] = [[Interface\Icons\Ability_ghoulfrenzy]], ['duration'] = 12, ['display'] = false,},
	[L['Tiger\'s Fury']] = {['icon'] = [[Interface\Icons\ability_mount_jungletiger]], ['duration'] = 6, ['display'] = false,},
	
	--[[ HUNTER ]]--
	[L['Bestial Wrath']] = {['icon'] = [[Interface\Icons\ability_druid_ferociousbite]], ['duration'] = 18, ['prio'] = 2},
	[L['Boar Charge']] = {['icon'] = [[Interface\Icons\Ability_hunter_pet_boar]], ['duration'] = 1, ['type'] = 'physical', ['prio'] = 2},
	[L['Concussive Shot']] = {['icon'] = [[Interface\Icons\Spell_frost_stun]], ['duration'] = 4, ['type'] = 'magic', ['prio'] = 1},
	[L['Counterattack']] = {['icon'] = [[Interface\Icons\Ability_warrior_challange]], ['duration'] = 5, ['type'] = 'physical', ['prio'] = 1},
	[L['Deterrence']] = {['icon'] = [[Interface\Icons\ability_whirlwind]], ['duration'] = 10, ['prio'] = 1},
	[L['Eagle Eye']] = {['icon'] = [[Interface\Icons\Ability_hunter_eagleeye]], ['duration'] = 60, ['display'] = false,},
	[L['Eyes of the Beast']] = {['icon'] = [[Interface\Icons\Ability_eyeoftheowl]], ['duration'] = 60, ['display'] = false,},
	[L['Immolation Trap Effect']] = {['icon'] = [[Interface\Icons\Spell_fire_flameshock]], ['duration'] = 15, ['display'] = false,},
	[L['Improved Concussive Shot']] = {['icon'] = [[Interface\Icons\Spell_frost_stun]], ['duration'] = 3, ['type'] = 'physical', ['prio'] = 2},
	[L['Improved Wing Clip']] = {['icon'] = [[Interface\Icons\Ability_rogue_trip]], ['duration'] = 5, ['type'] = 'physical',},
	[L['Intimidation']] = {['icon'] = [[Interface\Icons\ability_devour]], ['duration'] = 3, ['type'] = 'physical', ['prio'] = 1},
	[L['Quick Shots']] = {['icon'] = [[Interface\Icons\ability_warrior_innerrage]], ['duration'] = 12, ['display'] = false,},
	[L['Rapid Fire']] = {['icon'] = [[Interface\Icons\ability_hunter_runningshot]], ['duration'] = 15, ['type'] = 'magic',},
	[L['Scatter Shot']] = {['icon'] = [[Interface\Icons\Ability_golemstormbolt]], ['duration'] = 4, ['type'] = 'physical', ['prio'] = 2},
	[L["Scare Beast"]] = {['icon'] = [[Interface\Icons\Ability_druid_cower]], ['duration'] = 10, ['type'] = 'magic', ['prio'] = 2, ['dr'] = 'Fear'},
	[L['Scorpid Sting']] = {['icon'] = [[Interface\Icons\Ability_hunter_criticalshot]], ['duration'] = 20, ['display'] = false,},
	[L['Serpent Sting']] = {['icon'] = [[Interface\Icons\Ability_hunter_quickshot]], ['duration'] = 15, ['display'] = false,},
	[L["Freezing Trap Effect"]] = {['icon'] = [[Interface\Icons\Spell_frost_chainsofice]], ['duration'] = 20, ['type'] = 'magic', ['prio'] = 3},
	[L['Viper Sting']] = {['icon'] = [[Interface\Icons\Ability_hunter_aimedshot]], ['duration'] = 8, ['type'] = 'poison', ['prio'] = 1},
	[L['Wing Clip']] = {['icon'] = [[Interface\Icons\Ability_rogue_trip]], ['duration'] = 10, ['type'] = 'physical',},
	[L['Wyvern Sting']] = {['icon'] = [[Interface\Icons\Inv_spear_02]], ['duration'] = 12, ['type'] = 'poison', ['prio'] = 3},
	
	-- MAGE
	[L['Arcane Power']] = {['icon'] = [[Interface\Icons\spell_nature_lightning]], ['duration'] = 15, ['display'] = false,},
	[L['Blast Wave']] = {['icon'] = [[Interface\Icons\Spell_holy_excorcism_02]], ['duration'] = 6, ['type'] = 'physical', ['prio'] = 1},
	[L['Clearcasting']] = {['icon'] = [[Interface\Icons\Spell_frost_manaburn]], ['duration'] = 15, ['type'] = 'magic', },
	[L['Counterspell - Silenced']] = {['icon'] = [[Interface\Icons\Spell_frost_iceshock]], ['duration'] = 4, ['type'] = 'magic', ['prio'] = 2},
	[L["Cone of Cold"]] = {['icon'] = [[Interface\Icons\Spell_frost_glacier]], ['duration'] = 10, ['type'] = 'magic', ['display'] = false,},
	[L["Chilled"]] = {['icon'] = [[Interface\Icons\Spell_frost_frostarmor02]], ['duration'] = 7, ['display'] = false,},
	[L['Evocation']] = {['icon'] = [[Interface\Icons\Spell_nature_purge]], ['duration'] = 8, ['display'] = false,},
	[L['Fireball']] = {['icon'] = [[Interface\Icons\Spell_fire_flamebolt]], ['duration'] = 8, ['display'] = false,},
	[L["Frostbite"]] = {['icon'] = [[Interface\Icons\Spell_frost_frostarmor]], ['duration'] = 5, ['type'] = 'magic', ['prio'] = 1},
	[L["Frost Nova"]] = {['icon'] = [[Interface\Icons\Spell_frost_frostnova]], ['duration'] = 8, ['type'] = 'magic', ['prio'] = 1, ['dr'] = 'Controlled Root'},
	[L['Frost Ward']] = {['icon'] = [[Interface\Icons\Spell_frost_frostward]], ['duration'] = 30, ['type'] = 'magic'},
	[L['Frostbolt']] = {['icon'] = [[Interface\Icons\Spell_frost_frostbolt02]], ['duration'] = 10, ['type'] = 'magic', ['display'] = false,},
	[L['Fire Ward']] = {['icon'] = [[Interface\Icons\Spell_fire_firearmor]], ['duration'] = 30, ['type'] = 'magic'},
	--[L['Ice Barrier']] = {['icon'] = [[Interface\Icons\Spell_ice_lament]], ['duration'] = 60, ['type'] = 'magic'},
	[L['Ice Block']] = {['icon'] = [[Interface\Icons\Spell_frost_frost]], ['duration'] = 10, ['prio'] = 5},
	[L['Impact']] = {['icon'] = [[Interface\Icons\Spell_fire_meteorstorm]], ['duration'] = 2, ['type'] = 'physical', ['prio'] = 1},
	[L['Fire Vulnerability']] = {['icon'] = [[Interface\Icons\Spell_fire_soulburn]], ['duration'] = 30, ['display'] = false,},
	[L["Polymorph"]] = {['icon'] = [[Interface\Icons\Spell_nature_polymorph]], ['duration'] = 12, ['type'] = 'magic', ['prio'] = 3, ['dr'] = 'Polymorph'},
	[L['Polymorph: Pig']] = {['icon'] = [[Interface\Icons\Spell_magic_polymorphpig]], ['duration'] = 12, ['type'] = 'magic', ['prio'] = 3, ['dr'] = 'Polymorph'},
	[L['Polymorph: Turtle']] = {['icon'] = [[Interface\Icons\Ability_hunter_pet_turtle]], ['duration'] = 12, ['type'] = 'magic', ['prio'] = 3, ['dr'] = 'Polymorph'},
	[L['Pyroblast']] = {['icon'] = [[Interface\Icons\Spell_fire_fireball02]], ['duration'] = 12, ['display'] = false,},
	[L['Slow Fall']] = {['icon'] = [[Interface\Icons\spell_magic_featherfall]], ['duration'] = 30, ['display'] = false,},
	[L['Winter\'s Chill']] = {['icon'] = [[Interface\Icons\Spell_frost_chillingblast]], ['duration'] = 15, ['type'] = 'magic', ['display'] = false,},
	
	-- PALADIN
	[L['Blessing of Sacrifice']] = {['icon'] = [[Interface\Icons\spell_holy_sealofsacrifice]], ['duration'] = 30, ['display'] = false,},
	[L['Blessing of Protection']] = {['icon'] = [[Interface\Icons\Spell_holy_sealofprotection]], ['duration'] = 10, ['type'] = 'magic', ['prio'] = 2},
	[L['Blessing of Freedom']] = {['icon'] = [[Interface\Icons\Spell_holy_sealofvalor]], ['duration'] = 16, ['type'] = 'magic'},
	[L['Divine Protection']] = {['icon'] = [[Interface\Icons\Spell_holy_restoration]], ['duration'] = 8, ['prio'] = 4},
	[L['Divine Shield']] = {['icon'] = [[Interface\Icons\Spell_holy_divineintervention]], ['duration'] = 12, ['prio'] = 5},
	[L['Forbearance']] = {['icon'] = [[Interface\Icons\spell_holy_removecurse]], ['duration'] = 60, ['display'] = false,},
	[L["Hammer of Justice"]] = {['icon'] = [[Interface\Icons\Spell_holy_sealofmight]], ['duration'] = 5, ['type'] = 'magic', ['prio'] = 1, ['dr'] = 'Controlled Stun'},
	[L['Judgement of the Crusader']] = {['icon'] = [[Interface\Icons\Spell_holy_holysmite]], ['duration'] = 10, ['type'] = 'magic', ['display'] = false,},
	[L['Judgement of Justice']] = {['icon'] = [[Interface\Icons\Spell_holy_sealofwrath]], ['duration'] = 10, ['type'] = 'magic', ['display'] = false,},
	[L['Judgement of Light']] = {['icon'] = [[Interface\Icons\spell_holy_healingaura]], ['duration'] = 10, ['type'] = 'magic', ['display'] = false,},
	[L['Judgement of Wisdom']] = {['icon'] = [[Interface\Icons\Spell_holy_righteousnessaura]], ['duration'] = 10, ['type'] = 'magic', ['display'] = false,},
	[L['Repentance']] = {['icon'] = [[Interface\Icons\Spell_holy_prayerofhealing]], ['duration'] = 6, ['type'] = 'magic', ['prio'] = 3},
	[L['Seal of Command']] = {['icon'] = [[Interface\Icons\Ability_warrior_innerrage]], ['duration'] = 30, ['display'] = false,},
	[L['Seal of Justice']] = {['icon'] = [[Interface\Icons\Spell_holy_sealofwrath]], ['duration'] = 30, ['display'] = false,},
	[L['Seal of Light']] = {['icon'] = [[Interface\Icons\spell_holy_healingaura]], ['duration'] = 30, ['display'] = false,}, 
	[L['Seal of Righteousness']] = {['icon'] = [[Interface\Icons\Ability_ThunderBolt]], ['duration'] = 30, ['display'] = false,},
	[L['Seal of the Crusader']] = {['icon'] = [[Interface\Icons\Spell_holy_holysmite]], ['duration'] = 30, ['display'] = false,},
	[L['Seal of Wisdom']] = {['icon'] = [[Interface\Icons\Spell_holy_righteousnessaura]], ['duration'] = 30, ['display'] = false,},
	[L['Stun']] = {['icon'] = [[Interface\Icons\Spell_frost_stun]], ['duration'] = 2, ['type'] = 'physical', ['display'] = false,},
	[L['Vengeance']] = {['icon'] = [[Interface\Icons\Spell_holy_righteousnessaura]], ['duration'] = 8, ['display'] = false,},
	[L['Vindication']] = {['icon'] = [[Interface\Icons\Spell_holy_vindication]], ['duration'] = 10, ['display'] = false,},
	
	-- PRIEST
	[L['Abolish Disease']] = {['icon'] = [[Interface\Icons\Spell_nature_nullifydisease]], ['duration'] = 8, ['display'] = false,},
	[L['Blackout']] = {['icon'] = [[Interface\Icons\Spell_shadow_gathershadows]], ['duration'] = 3, ['type'] = 'magic', ['prio'] = 1},
	[L['Devouring Plague']] = {['icon'] = [[Interface\Icons\Spell_shadow_blackplague]], ['duration'] = 24, ['display'] = false,},
	[L['Holy Fire']] = {['icon'] = [[Interface\Icons\Spell_holy_searinglight]], ['duration'] = 10, ['display'] = false,},
	[L['Lightwell Renew']] = {['icon'] = [[Interface\Icons\spell_holy_summonlightwell]], ['duration'] = 10, ['display'] = false,},
	[L['Mind Flay']] = {['icon'] = [[Interface\Icons\Spell_shadow_siphonmana]], ['duration'] = 3, ['type'] = 'magic', ['display'] = false,},
	[L['Mind Soothe']] = {['icon'] = [[Interface\Icons\Spell_holy_mindsooth]], ['duration'] = 15, ['display'] = false,},
	[L['Mind Vision']] = {['icon'] = [[Interface\Icons\Spell_holy_mindvision]], ['duration'] = 60, ['display'] = false,},
	[L['Power Word: Shield']] = {['icon'] = [[Interface\Icons\Spell_holy_powerwordshield]], ['duration'] = 30, ['type'] = 'magic'},
	[L['Power Infusion']] = {['icon'] = [[Interface\Icons\spell_holy_powerinfusion]], ['duration'] = 15, ['type'] = 'magic'},
	[L['Psychic Scream']] = {['icon'] = [[Interface\Icons\Spell_shadow_psychicscream]], ['duration'] = 8, ['type'] = 'physical', ['prio'] = 1, ['dr'] = 'Fear'},
	[L['Shadow Vulnerability']] = {['icon'] = [[Interface\Icons\Spell_shadow_blackplague]], ['duration'] = 15, ['display'] = false},
	[L['Shadow Word: Pain']] = {['icon'] = [[Interface\Icons\spell_shadow_shadowwordpain]], ['duration'] = 24, ['display'] = false,},
	[L['Silence']] = {['icon'] = [[Interface\Icons\Spell_shadow_impphaseshift]], ['duration'] = 5, ['type'] = 'magic', ['prio'] = 2},
	[L['Renew']] = {['icon'] = [[Interface\Icons\spell_holy_renew]], ['duration'] = 15, ['display'] = false,},
	[L['Weakened Soul']] = {['icon'] = [[Interface\Icons\spell_holy_ashestoashes]], ['duration'] = 15, ['display'] = false,},
	
	--[[ ROGUE ]]--
	[L['Adrenaline Rush']] = {['icon'] = [[Interface\Icons\spell_shadow_shadowworddominate]], ['duration'] = 15, },
	[L['Blade Flurry']] = {['icon'] = [[Interface\Icons\ability_warrior_punishingblow]], ['duration'] = 15, ['display'] = false,},
	[L['Blind']] = {['icon'] = [[Interface\Icons\Spell_shadow_mindsteal]], ['duration'] = 10, ['type'] = 'poison', ['prio'] = 3},
	[L["Cheap Shot"]] = {['icon'] = [[Interface\Icons\Ability_cheapshot]], ['duration'] = 4, ['type'] = 'physical', ['prio'] = 1},
	[L['Crippling Poison']] = {['icon'] = [[Interface\Icons\Ability_poisonsting]], ['duration'] = 12, ['type'] = 'poison', ['display'] = false,},
	[L['Deadly Poison V']] = {['icon'] = [[Interface\Icons\ability_rogue_dualweild]], ['duration'] = 12, ['display'] = false,},
	[L['Evasion']] = {['icon'] = [[Interface\Icons\spell_shadow_shadowward]], ['duration'] = 15,},
	[L['Expose Armor']] = {['icon'] = [[Interface\Icons\Ability_warrior_riposte]], ['duration'] = 30, ['display'] = false,},
	[L['Garrote']] = {['icon'] = [[Interface\Icons\ability_rogue_garrote]], ['duration'] = 18, ['display'] = false,},
	[L['Ghostly Strike']] = {['icon'] = [[Interface\Icons\Spell_shadow_curse]], ['duration'] = 7, ['display'] = false,},
	[L["Gouge"]] = {['icon'] = [[Interface\Icons\Ability_gouge]], ['duration'] = 5, ['type'] = 'physical', ['prio'] = 2, ['dr'] = 'Disorient'},
	[L['Hemorrhage']] = {['icon'] = [[Interface\Icons\spell_shadow_lifedrain]], ['duration'] = 15, ['display'] = false,},
	[L['Kick - Silenced']] = {['icon'] = [[Interface\Icons\Ability_kick]], ['duration'] = 2, ['type'] = 'physical', ['prio'] = 1},
	[L['Mind-numbing Poison III']] = {['icon'] = [[Interface\Icons\spell_nature_nullifydisease]], ['duration'] = 14, ['display'] = false,},
	[L['Riposte']] = {['icon'] = [[Interface\Icons\Ability_warrior_challange]], ['duration'] = 6, ['type'] = 'physical', ['prio'] = 1},
	[L["Sap"]] = {['icon'] = [[Interface\Icons\Ability_sap]], ['duration'] = 11, ['type'] = 'physical', ['prio'] = 3, ['dr'] = 'Disorient'},
	[L['Sprint']] = {['icon'] = [[Interface\Icons\Ability_rogue_sprint]], ['duration'] = 15, ['prio'] = 1},
	[L['Kidney Shot']] = {['icon'] = [[Interface\Icons\Ability_rogue_kidneyshot]], ['duration'] = 6, ['type'] = 'physical', ['prio'] = 2, ['dr'] = 'Controlled Stun'},
	[L['Wound Poison IV']] = {['icon'] = [[Interface\Icons\Inv_misc_herb_16]], ['duration'] = 15, ['type'] = 'poison', ['display'] = false,},
	
	-- SHAMAN
	[L['Earthbind']] = {['icon'] = [[Interface\Icons\spell_nature_strengthofearthtotem02]],['duration'] = 5, ['type'] = 'magic',},
	[L['Flame Shock']] = {['icon'] = [[Interface\Icons\spell_fire_flameshock]], ['duration'] = 12, ['display'] = false,},
	[L['Focused Casting']] = {['icon'] = [[Interface\Icons\Spell_arcane_blink]], ['duration'] = 6, ['display'] = false,},
	[L['Frost Shock']] = {['icon'] = [[Interface\Icons\Spell_frost_frostshock]], ['duration'] = 8, ['type'] = 'magic', ['prio'] = 1, ['dr'] = 'Frost Shock'},
	[L['Grounding Totem Effect']] = {['icon'] = [[Interface\Icons\Spell_nature_groundingtotem]], ['duration'] = 10, ['type'] = 'magic', ['prio'] = 3},
	[L['Healing Way']] = {['icon'] = [[Interface\Icons\Spell_nature_healingway]], ['duration'] = 15, ['display'] = false,},
	[L['Mana Tide Totem']] = {['icon'] = [[Interface\Icons\Spell_frost_summonwaterelemental]], ['duration'] = 12,},
	[L['Stormstrike']] = {['icon'] = [[Interface\Icons\Spell_holy_sealofmight]], ['duration'] = 12, ['display'] = false,},
	
	-- WARLOCK
	[L['Corruption']] = {['icon'] = [[Interface\Icons\Spell_shadow_abominationexplosion]],['duration'] = 18, ['display'] = false,},
	[L['Curse of Agony']] = {['icon'] = [[Interface\Icons\Spell_shadow_curseofsargeras]], ['duration'] = 24, ['display'] = false,},
	[L['Curse of Exhaustion']] = {['icon'] = [[Interface\Icons\Spell_shadow_grimward]], ['duration'] = 30, ['type'] = 'curse',},
	[L['Curse of Tongues']] = {['icon'] = [[Interface\Icons\Spell_shadow_curseoftounges]], ['duration'] = 30, ['type'] = 'curse',},
	[L['Death Coil']] = {['icon'] = [[Interface\Icons\Spell_shadow_deathcoil]], ['duration'] = 3, ['type'] = 'magic', ['prio'] = 1},
	[L['Drain Life']] = {['icon'] = [[Interface\Icons\Spell_shadow_lifedrain02]], ['duration'] = 5, ['display'] = false,},
	[L['Drain Mana']] = {['icon'] = [[Interface\Icons\Spell_shadow_siphonmana]], ['duration'] = 5, ['display'] = false,},
	[L['Drain Soul']] = {['icon'] = [[Interface\Icons\Spell_shadow_haunting]], ['duration'] = 15, ['display'] = false,},
	[L['Eye of Kilrogg']] = {['icon'] = [[Interface\Icons\Spell_shadow_evileye]], ['duration'] = 45, ['display'] = false,},
	[L["Fear"]] = {['icon'] = [[Interface\Icons\Spell_shadow_possession]], ['duration'] = 15, ['type'] = 'magic', ['prio'] = 2, ['dr'] = 'Fear'},
	[L['Health Funnel']] = {['icon'] = [[Interface\Icons\Spell_shadow_lifedrain]], ['duration'] = 10, ['display'] = false,},
	[L['Immolate']] = {['icon'] = [[Interface\Icons\Spell_fire_immolation]], ['duration'] = 15, ['type'] = 'magic', ['display'] = false,},
	[L['Sacrifice']] = {['icon'] = [[Interface\Icons\Spell_shadow_sacrificialshield]], ['duration'] = 30, ['type'] = 'magic'},
	[L['Seduction']] = {['icon'] = [[Interface\Icons\Spell_shadow_mindsteal]], ['duration'] = 10, ['type'] = 'magic', ['prio'] = 3, ['dr'] = 'Fear'},
	[L['Shadowburn']] = {['icon'] = [[Interface\Icons\spell_shadow_scourgebuild]], ['duration'] = 5, ['display'] = false,},
	[L['Shadow Trance']] = {['icon'] = [[Interface\Icons\Spell_shadow_twilight]], ['duration'] = 10, ['type'] = 'magic'},
	[L['Shadow Ward']] = {['icon'] = [[Interface\Icons\Spell_shadow_antishadow]], ['duration'] = 30, ['type'] = 'magic'},
	[L['Siphon Life']] = {['icon'] = [[Interface\Icons\Spell_shadow_requiem]], ['duration'] = 30, ['display'] = false,},
	
	--[[ WARRRIOR ]]--
	[L['Berserker Rage']] = {['icon'] = [[Interface\Icons\Spell_nature_ancestralguardian]], ['duration'] = 10, },
	[L['Bloodrage']] = {['icon'] = [[Interface\Icons\Ability_racial_bloodrage]], ['duration'] = 10, ['display'] = false,},
	[L['Bloodthirst']] = {['icon'] = [[Interface\Icons\spell_nature_bloodlust]], ['duration'] = 8, ['display'] = false,},
	[L['Challenging Shout']] = {['icon'] = [[Interface\Icons\Ability_bullrush]], ['duration'] = 6, ['display'] = false,},
	[L['Charge']] = {['icon'] = [[Interface\Icons\Spell_frost_stun]], ['duration'] = 1, ['type'] = 'physical', ['prio'] = 1, ['dr'] = 'Controlled Stun'},
	[L['Concussion Blow']] = {['icon'] = [[Interface\Icons\Ability_thunderbolt]], ['duration'] = 5, ['type'] = 'physical', ['prio'] = 1},
	[L['Death Wish']] = {['icon'] = [[Interface\Icons\Spell_shadow_deathpact]], ['duration'] = 30,},
	[L['Deep Wounds']] = {['icon'] = [[Interface\Icons\Ability_backstab]], ['duration'] = 12, ['display'] = false,},
	[L['Demoralizing Shout']] = {['icon'] = [[Interface\Icons\ability_warrior_warcry]], ['duration'] = 30, ['display'] = false,},
	[L['Disarm']] = {['icon'] = [[Interface\Icons\Ability_warrior_disarm]], ['duration'] = 8, ['type'] = 'physical', ['prio'] = 1},
	[L['Enrage']] = {['icon'] = [[Interface\Icons\Spell_shadow_unholyfrenzy]], ['duration'] = 12, ['display'] = false,},
	[L['Hamstring']] = {['icon'] = [[Interface\Icons\Ability_shockwave]], ['duration'] = 15, ['type'] = 'physical', ['prio'] = 1}, 
	[L['Improved Hamstring']] = {['icon'] = [[Interface\Icons\Ability_shockwave]], ['duration'] = 5, ['type'] = 'physical', ['prio'] = 2},
	[L['Intercept Stun']] = {['icon'] = [[Interface\Icons\Spell_frost_stun]], ['duration'] = 3, ['type'] = 'physical', ['prio'] = 1, ['dr'] = 'Controlled Stun'},
	[L['Intimidating Shout']] = {['icon'] = [[Interface\Icons\Ability_golemthunderclap]], ['duration'] = 8, ['type'] = 'physical', ['prio'] = 2, ['dr'] = 'Fear'},
	[L['Last Stand']] = {['icon'] = [[Interface\Icons\spell_holy_ashestoashes]], ['duration'] = 20, },
	[L['Mace Stun Effect']] = {['icon'] = [[Interface\Icons\Spell_frost_stun]], ['duration'] = 3, ['type'] = 'physical', ['prio'] = 1,},
	[L['Mortal Strike']] = {['icon'] = [[Interface\Icons\Ability_warrior_savageblow]], ['duration'] = 10, ['type'] = 'physical'},
	[L['Rend']] = {['icon'] = [[Interface\Icons\Ability_gouge]], ['duration'] = 21, ['display'] = false,},
	[L['Retaliation']] = {['icon'] = [[Interface\Icons\Ability_warrior_challange]], ['duration'] = 15, ['prio'] = 2,},
	[L['Shield Bash - Silenced']] = {['icon'] = [[Interface\Icons\Ability_warrior_shieldbash]], ['duration'] = 3, ['type'] = 'magic', ['prio'] = 2},
	[L['Shield Block']] = {['icon'] = [[Interface\Icons\ability_defend]], ['duration'] = 5, ['display'] = false,},
	[L['Shield Wall']] = {['icon'] = [[Interface\Icons\Ability_warrior_shieldwall]], ['duration'] = 10, ['prio'] = 2},
	[L['Sweeping Strikes']] = {['icon'] = [[Interface\Icons\Ability_rogue_slicedice]], ['duration'] = 20, ['display'] = false,},
	[L['Thunder Clap']] = {['icon'] = [[Interface\Icons\Spell_nature_thunderclap]], ['duration'] = 30, ['display'] = false,},
}

SPELLINFO_UNIQUE_DEBUFFS = {
	-- rogue's debuffs with duration based on cp
	[L['Kidney Shot']] = {['icon'] = [[Interface\Icons\Ability_rogue_kidneyshot]], ['cp'] = {2, 3, 4, 5, 6}, ['type'] = 'physical', ['prio'] = 2, ['dr'] = 'Controlled Stun'},
	[L['Rupture']] = {['icon'] = [[Interface\Icons\Ability_rogue_rupture]], ['cp'] = {8, 10, 12, 14, 16}, ['type'] = 'physical', ['display'] = false,},
} 

-- used to check if mouseover cast should be aimed at mouseover target
SPELLINFO_SINGLE_TARGET_BUFF_SPELLS = {
	-- DRUID
	[L['Abolish Poison']] = true,
	[L['Cure Poison']] = true,
	[L['Healing Touch']] = true,
	[L['Mark of the Wild']] = true,
	[L['Rebirth']] = true, 
	[L['Regrowth']] = true,
	[L['Rejuvenation']] = true,
	[L['Remove Curse']] = true,
	-- MAGE
	[L['Amplify Magic']] = true,
	[L['Arcane Intellect']] = true,
	[L['Dampen Magic']] = true,
	[L['Remove Lesser Curse']] = true,
	-- PALADIN
	[L['Blessing of Protection']] = true,
	[L['Blessing of Freedom']] = true,
	[L['Blessing of Kings']] = true,
	[L['Blessing of Might']] = true, 
	[L['Blessing of Sanctuary']] = true,
	[L['Blessing of Sacrifice']] = true,
	[L['Blessing of Wisdom']] = true,
	[L['Cleanse']] = true, 
	[L['Divine Intervention']] = true,
	[L['Flash of Light']] = true,
	[L['Holy Light']] = true,
	[L['Lay on Hands']] = true, 
	[L['Purify']] = true,
	-- PRIEST
	[L['Cure Disease']] = true,
	[L['Divine Spirit']] = true,
	[L['Greater Heal']] = true,
	[L['Fear Ward']] = true,
	[L['Flash Heal']] = true, 
	[L['Heal']] = true,
	[L['Lesser Heal']] = true,
	[L['Power Infusion']] = true,
	[L['Power Word: Fortitude']] = true, 
	[L['Power Word: Shield']] = true,
	[L['Renew']] = true,
	[L['Shadow Protection']] = true,
	-- SHAMAN
	[L['Chain Heal']] = true,
	[L['Healing Wave']] = true,
	[L['Lesser Healing Wave']] = true,
}

SPELLINFO_DEBUFF_REFRESHING_SPELLS = {
	-- DRUID
	[L['Moonfire']] = {L['Moonfire']},
	[L['Rake']] = {L['Rake']},
	--[L['Regrowth']] = {},
	-- HUNTER
	[L['Wing Clip']] = {L['Wing Clip'],},
	-- MAGE
	[L['Fireball']] = {L['Fireball'], }, 
	[L['Blizzard']] = {L['Winter\'s Chill'],},
	[L['Cone of Cold']] = {L['Winter\'s Chill'],},
	[L['Frost Nova']] = {L['Winter\'s Chill'],},
	[L['Frostbolt']] = {L['Frostbolt'], L['Winter\'s Chill'],},
	[L['Scorch']] = {L['Improved Scorch'],},
	-- PALADIN
	[L['Judgement of the Crusader']] = {L['Judgement of the Crusader'],},
	[L['Judgement of Justice']] = {L['Judgement of Justice'],},
	[L['Judgement of Light']] = {L['Judgement of Light'],},
	[L['Judgement of Wisdom']] = {L['Judgement of Wisdom'],},
	-- PRIEST
	[L['Holy Fire']] = {L['Holy Fire'],},
	[L['Mind Flay']] = {L['Shadow Vulnerability'],},
	[L['Mind Blast']] = {L['Shadow Vulnerability'],},
	[L['Shadow Vulnerability']] = {L['Shadow Vulnerability'],},
	[L['Weakened Soul']] = {L['Power Word: Shield'],},
	-- ROGUE
	[L['Hemorrhage']] = {L['Hemorrhage'],},
	[L['Wound Poison IV']] = {L['Wound Poison IV'],},
	[L['Deadly Poison V']] = {L['Deadly Poison V'],},
	-- SHAMAN
	[L['Flame Shock']] = {L['Flame Shock'],},
	[L['Frost Shock']] = {L['Frost Shock'],},
	-- WARLOCK
	[L['Immolate']] = {L['Immolate'],},
	-- WARRRIOR
	[L['Hamstring']] = {L['Hamstring'],},
	[L['Mortal Strike']] = {L['Mortal Strike'],},
}

SPELLINFO_ROOTS_SNARES = {
	-- MISC
	[L['Net-o-Matic']] = true, 
	-- DRUID
	[L['Entangling Roots']] = true,
	[L['Feral Charge Effect']] = true, 
	-- HUNTER
	[L['Concussive Shot']] = true,
	[L['Wing Clip']] = true,
	[L['Improved Wing Clip']] = true, 
	-- MAGE
	[L['Blast Wave']] = true,
	[L["Cone of Cold"]] = true,
	[L["Frostbite"]] = true,
	[L["Frost Nova"]] = true,
	[L['Frostbolt']] = true, 
	-- PALADIN 
	-- PRIEST 
	[L['Mind Flay']] = true,
	-- ROGUE 
	-- SHAMAN
	[L['Frost Shock']] = true, 
	-- WARRRIOR 
	[L['Hamstring']] = true,
	[L['Improved Hamstring']] = true,
}
--