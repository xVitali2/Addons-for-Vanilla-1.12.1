

    HEX_CLASS_COLORS = {
        ['DRUID']   = 'ff7d0a',
        ['HUNTER']  = 'abd473',
        ['MAGE']    = '69ccf0',
        ['PALADIN'] = 'f58cba',
        ['PRIEST']  = 'ffffff',
        ['ROGUE']   = 'fff569',
        ['SHAMAN']  = '0070de',
        ['WARLOCK'] = '9482c9',
        ['WARRIOR'] = 'c79c6e',
    }

    SPELL_SCHOOL_COLORS = {
        ['Physical'] = {r =  1, g =  1, b =  0},
        ['Holy']     = {r =  1, g = .9, b = .5},
        ['Fire']     = {r =  1, g = .5, b =  0},
        ['Nature']   = {r = .3, g =  1, b = .3},
        ['Frost']    = {r = .5, g =  1, b =  1},
        ['Shadow']   = {r = .5, g = .5, b =  1},
        ['Arcane']   = {r =  1, g = .5, b =  1},
    }

    MODUI_SPELLCASTS_TO_TRACK = {
            -- MISC
        ['Acid Spit']					= {[[Interface\Icons\spell_nature_acid_01]], 3},
    	['Bomb']						= {[[Interface\Icons\spell_fire_selfdestruct]], 2},
    	['Black Sludge']				= {[[Interface\Icons\spell_shadow_callofbone]], 3},
    	['Boulder']						= {[[Interface\Icons\inv_stone_10]], 2},
    	['Chained Bolt']				= {[[Interface\Icons\spell_nature_chainlightning]], 1.8},
    	['Chains of Ice'] 				= {[[Interface\Icons\spell_frost_chainsofice]], 1.5},
    	['Clone']						= {[[Interface\Icons\spell_shadow_blackplague]], 2.5},
    	['Creeping Mold'] 				= {[[Interface\Icons\spell_shadow_creepingplague]], 3},
    	['Cripple'] 					= {[[Interface\Icons\spell_shadow_cripple]], 3},
    	['Crystal Flash']				= {[[Interface\Icons\spell_shadow_teleport]], 2},
    	['Crystal Gaze'] 				= {[[Interface\Icons\ability_golemthunderclap]], 2},
    	['Crystalline Slumber'] 		= {[[Interface\Icons\spell_nature_sleep]], 2},
    	['Cultivate Packet of Seeds'] 	= {[[Interface\Icons\inv_misc_food_45]], 10},
    	['Curse of Mending']			= {[[Interface\Icons\spell_shadow_antishadow]], 1},
    	['Curse of the Deadwood']		= {[[Interface\Icons\spell_shadow_gathershadows]], 2},
    	['Curse of the Fallen Magram'] 	= {[[Interface\Icons\spell_shadow_unholyfrenzy]], 2},
        ['Dark Sludge']					= {[[Interface\Icons\spell_shadow_creepingplague]], 5},
    	['Dire Growl'] 					= {[[Interface\Icons\ability_racial_cannibalize]], 1},
    	['Fevered Fatigue'] 			= {[[Interface\Icons\spell_nature_nullifydisease]], 3},
    	['Fire Shield II'] 				= {[[Interface\Icons\spell_fire_immolation]], 1},
    	['Flame Spike']					= {[[Interface\Icons\spell_fire_flamebolt]], 3},
    	['Flamespit']					= {[[Interface\Icons\spell_fire_selfdestruct]], 3},
    	['Freeze Solid']				= {[[Interface\Icons\spell_frost_glacier]], 2.5},
    	['Furbolg Form'] 				= {[[Interface\Icons\Inv_misc_monsterclaw_04]], 2},
    	['Diseased Slime']				= {[[Interface\Icons\spell_shadow_creepingplague]], 2},
    	['Disenchant']					= {[[Interface\Icons\Inv_Enchant_Disenchant]], 3},
    	['Drink Minor Potion']			= {[[Interface\Icons\Spell_holy_heal]], 3},
    	['Dynamite']					= {[[Interface\Icons\spell_fire_selfdestruct]], 1},
    	['Earthgrab Totem']				= {[[Interface\Icons\spell_nature_naturetouchdecay]], .5},
    	['Exploding Shot']				= {[[Interface\Icons\spell_fire_fireball02]], 1},
    	['Icicle']						= {[[Interface\Icons\spell_frost_frostbolt02]], 1.5},
    	['Ink Spray']					= {[[Interface\Icons\spell_nature_sleep]], 1},
    	['Healing Ward']				= {[[Interface\Icons\spell_holy_layonhands]], 2},
    	['Holy Smite']					= {[[Interface\Icons\Spell_holy_holysmite]], 2.5},
    	['Lizard Bolt']					= {[[Interface\Icons\spell_nature_lightning]], 2},
    	['Plague Cloud'] 				= {[[Interface\Icons\spell_shadow_callofbone]], 2},
    	['Plague Mind']					= {[[Interface\Icons\spell_shadow_callofbone]], 4},
    	['Poisoned Shot'] 				= {[[Interface\Icons\ability_poisons]], 2},
    	['Quick Flame Ward'] 			= {[[Interface\Icons\spell_fire_sealoffire]], 1.5},
    	['Shrink'] 						= {[[Interface\Icons\spell_shadow_antishadow]], 3},
    	['Silithid Pox'] 				= {[[Interface\Icons\spell_nature_nullifydisease]], 2},
    	['Slowing Poison'] 				= {[[Interface\Icons\spell_nature_slowpoison]], 1},
    	['Toxic Spit'] 					= {[[Interface\Icons\spell_nature_corrosivebreath]], 2.5},
    	['Trelane\'s Freezing Touch'] 	= {[[Interface\Icons\spell_shadow_unsummonbuilding]], 3},
    	['Wandering Plague']			= {[[Interface\Icons\spell_shadow_callofbone]], 2},
    	['Wither Touch']				= {[[Interface\Icons\spell_nature_drowsy]], 2},
            -- AHN'QIRAJ
        ['Explode']                   = {[[Interface\Icons\Spell_fire_selfdestruct]], 6},
            -- BLACKROCK SPIRE
        ['Flame Buffet']              = {[[Interface\Icons\Spell_fire_selfdestruct]], 6},
            -- BLACKWING LAIR
        ['Shadow Flame']              = {[[Interface\Icons\Spell_fire_incinerate]], 2},
        ['Wing Buffet']               = {[[Interface\Icons\Inv_misc_monsterscales_14]], 1},
        ['Bellowing Roar']            = {[[Interface\Icons\Spell_fire_fire]], 1.75},
            -- MOLTEN CORE
        ['Dark Mending']              = {[[Interface\Icons\Spell_shadow_chilltouch]], 2},
        ['Dominate Mind']             = {[[Interface\Icons\Spell_shadow_shadowworddominate]], 2},
        ['Elemental Fire']            = {[[Interface\Icons\Spell_fire_fireball02]], .5},
        ['Magma Blast']               = {[[Interface\Icons\Spell_fire_fireblast]], 1},
        ['Summon Ragnaros']           = {[[Interface\Icons\Spell_fire_lavaspawn]], 10},
            -- ONYXIA
        ['Breath']                    = {[[Interface\Icons\Spell_fire_fire]], 8},
            -- DIRE MAIL
        ['Arcane Bolt']               = {[[Interface\Icons\Spell_arcane_starfire]], 1},
            -- STRATHOLME
        ['Banshee Wail']              = {[[Interface\Icons\Spell_shadow_shadowbolt]], 1.5},
        ['Venom Spit']                = {[[Interface\Icons\Spell_nature_corrosivebreath]], 2.5},
            -- GLOBAL
        ['Dark Mending']              = {[[Interface\Icons\Spell_shadow_chilltouch]], 2},
        ['Hearthstone']               = {[[Interface\Icons\INV_Misc_Rune_01]], 10},
        ['Magic Dust']                = {[[Interface\Icons\Inv_misc_dust_02]], 1.5},
        ['Reckless Charge']           = {[[Interface\Icons\Spell_nature_astralrecal]], .1},
        ['Sleep']                     = {[[Interface\Icons\Spell_nature_sleep]], 1.5},
        ['War Stomp']                 = {[[Interface\Icons\Ability_warstomp]], .5},
            -- ENGINEERING
        ['Rough Copper Bomb']         = {[[Interface\Icons\Inv_misc_bomb_09]], 1},
    	['Large Copper Bomb']         = {[[Interface\Icons\Inv_misc_bomb_01]], 1},
    	['Small Bronze Bomb']         = {[[Interface\Icons\Inv_misc_bomb_09]], 1},
    	['Big Bronze Bomb']           = {[[Interface\Icons\Inv_misc_bomb_05]], 1},
    	['Iron Grenade']              = {[[Interface\Icons\Inv_misc_bomb_08]], 1},
    	['Big Iron Bomb']             = {[[Interface\Icons\Inv_misc_bomb_01]], 1},
    	['Mithril Frag Bomb']         = {[[Interface\Icons\Inv_misc_bomb_02]], 1},
    	['Hi-Explosive Bomb']         = {[[Interface\Icons\Inv_misc_bomb_07]], 1},
    	['Thorium Grenade']           = {[[Interface\Icons\Inv_misc_bomb_08]], 1},
    	['Dark Iron Bomb']            = {[[Interface\Icons\Inv_misc_bomb_05]], 1},
    	['Arcane Bomb']               = {[[Interface\Icons\Spell_shadow_mindbomb]], 1},
            -- FIRST AID
    	['Linen Bandage']             = {[[Interface\Icons\Inv_misc_bandage_15]], 3},
    	['Heavy Linen Bandage']       = {[[Interface\Icons\Inv_misc_bandage_18]], 3},
    	['Wool Bandage']              = {[[Interface\Icons\Inv_misc_bandage_14]], 3},
    	['Heavy Wool Bandage']        = {[[Interface\Icons\Inv_misc_bandage_17]], 3},
    	['Silk Bandage']              = {[[Interface\Icons\Inv_misc_bandage_01]], 3},
    	['Heavy Silk Bandage']        = {[[Interface\Icons\Inv_misc_bandage_02]], 3},
    	['Mageweave Bandage']         = {[[Interface\Icons\Inv_misc_bandage_19]], 3},
    	['Heavy Mageweave Bandage']   = {[[Interface\Icons\Inv_misc_bandage_20]], 3},
    	['Runecloth Bandage']         = {[[Interface\Icons\Inv_misc_bandage_11]], 3},
    	['Heavy Runecloth Bandage']   = {[[Interface\Icons\Inv_misc_bandage_12]], 3},
            -- DRUID
        ['Entangling Roots']          = {[[Interface\Icons\Spell_nature_stranglevines]], 1.5},
        ['Healing Touch']             = {[[Interface\Icons\Spell_nature_healingtouch]], 3},
        ['Hibernate']                 = {[[Interface\Icons\Spell_nature_sleep]], 1.5},
        ['Rebirth']                   = {[[Interface\Icons\Spell_nature_reincarnation]], 2},
        ['Regrowth']                  = {[[Interface\Icons\Spell_nature_resistnature]], 2},
        ['Soothe Animal']             = {[[Interface\Icons\Ability_hunter_beastsoothe]], 1.5},
        ['Starfire']                  = {[[Interface\Icons\Spell_arcane_starfire]], 3},
        ['Teleport: Moonglade']       = {[[Interface\Icons\Spell_arcane_teleportmoonglade]], 10},
        ['Wrath']                     = {[[Interface\Icons\Spell_nature_abolishmagic]], 1.5},
            -- HUNTER
        ['Aimed Shot']                = {[[Interface\Icons\Inv_spear_07]], 2.5},
        ['Dismiss Pet']               = {[[Interface\Icons\Spell_nature_spiritwolf]], 5},
        ['Eyes of the Beast']         = {[[Interface\Icons\Ability_eyeoftheowl]], 2},
        ['Revive Pet']                = {[[Interface\Icons\Ability_hunter_beastsoothe]], 10},
        ['Scare Beast']               = {[[Interface\Icons\Ability_druid_cower]], 1.5},
            -- MAGE
        ['Conjure Food']              = {[[Interface\Icons\Inv_misc_food_73cinnamonroll]], 3},
        ['Conjure Water']             = {[[Interface\Icons\Inv_drink_18]], 3},
        ['Conjure Mana Agate']        = {[[Interface\Icons\Inv_misc_gem_emerald_01]], 3},
        ['Conjure Mana Citrine']      = {[[Interface\Icons\Inv_misc_gem_opal_01]], 3},
        ['Conjure Mana Jade']         = {[[Interface\Icons\Inv_misc_gem_emerald_02]], 3},
        ['Conjure Mana Ruby']         = {[[Interface\Icons\Inv_misc_gem_ruby_01]], 3},
        ['Fireball']                  = {[[Interface\Icons\Spell_fire_flamebolt]], 3},
        ['Frostbolt']                 = {[[Interface\Icons\Spell_frost_frostbolt02]], 3},
        ['Flamestrike']               = {[[Interface\Icons\Spell_fire_selfdestruct]], 3},
        ['Polymorph']                 = {[[Interface\Icons\Spell_nature_polymorph]], 1.5},
        ['Polymorph: Pig']            = {[[Interface\Icons\Spell_magic_polymorphpig]], 1.5},
        ['Polymorph: Turtle']         = {[[Interface\Icons\Ability_hunter_pet_turtle]], 1.5},
        ['Portal: Darnassus']         = {[[Interface\Icons\Spell_arcane_portaldarnassus]], 10},
    	['Portal: Thunder Bluff']     = {[[Interface\Icons\Spell_arcane_portalthunderbluff]], 10},
    	['Portal: Ironforge']         = {[[Interface\Icons\Spell_arcane_portalironforge]], 10},
    	['Portal: Orgrimmar']         = {[[Interface\Icons\Spell_arcane_portalorgrimmar]], 10},
    	['Portal: Stormwind']         = {[[Interface\Icons\Spell_arcane_portalstormwind]], 10},
    	['Portal: Undercity']         = {[[Interface\Icons\Spell_arcane_portalundercity]], 10},
    	['Teleport: Darnassus']       = {[[Interface\Icons\Spell_arcane_teleportdarnassus]], 10},
    	['Teleport: Thunder Bluff']   = {[[Interface\Icons\Spell_arcane_teleportthunderbluff]], 10},
    	['Teleport: Ironforge']       = {[[Interface\Icons\Spell_arcane_portalironforge]], 10},
    	['Teleport: Orgrimmar']       = {[[Interface\Icons\Spell_arcane_teleportorgrimmar]], 10},
    	['Teleport: Stormwind']       = {[[Interface\Icons\Spell_arcane_teleportstormwind]], 10},
    	['Teleport: Undercity']       = {[[Interface\Icons\Spell_arcane_teleportundercity]], 10},
        ['Pyroblast']                 = {[[Interface\Icons\Spell_fire_fireball02]], 6},
        ['Scorch']                    = {[[Interface\Icons\Spell_fire_soulburn]], 1.5},
            -- PALADIN
        ['Hammer of Wrath']           = {[[Interface\Icons\Ability_ThunderClap]], 1},
        ['Holy Light']                = {[[Interface\Icons\Spell_holy_holybolt]], 2.5},
        ['Holy Wrath']                = {[[Interface\Icons\Spell_holy_weaponmastery]], 2},
        ['Flash of Light']            = {[[Interface\Icons\Spell_holy_flashheal]], 1.5},
        ['Redemption']                = {[[Interface\Icons\Spell_holy_resurrection]], 10},
        ['Summon Warhorse']           = {[[Interface\Icons\Spell_nature_swiftness]], 3},
        ['Summon Charger']            = {[[Interface\Icons\Ability_mount_charger]], 3},
        ['Turn Undead']               = {[[Interface\Icons\Spell_holy_turnundead]], 1.5},
            -- PRIEST
        ['Flash Heal']                = {[[Interface\Icons\Spell_holy_flashheal]], 1.5},
        ['Greater Heal']              = {[[Interface\Icons\Spell_holy_greaterheal]], 2.5},
        ['Heal']                      = {[[Interface\Icons\Spell_holy_heal]], 2.5},
        ['Holy Fire']                 = {[[Interface\Icons\Spell_holy_searinglight]], 3.5},
        ['Mana Burn']                 = {[[Interface\Icons\Spell_shadow_manaburn]], 3},
        ['Mind Blast']                = {[[Interface\Icons\Spell_shadow_unholyfrenzy]], 1.5},
        ['Mind Control']              = {[[Interface\Icons\Spell_shadow_shadowworddominate]], 3},
        ['Prayer of Healing']         = {[[Interface\Icons\Spell_holy_prayerofhealing02]], 3},
        ['Resurrection']              = {[[Interface\Icons\Spell_holy_resurrection]], 10},
        ['Shackle Undead']            = {[[Interface\Icons\Spell_nature_slow]], 1.5},
        ['Smite']                     = {[[Interface\Icons\Spell_holy_holysmite]], 2.5},
            -- ROGUE
        ['Disarm Trap']               = {[[Interface\Icons\Spell_shadow_grimward]], 5},
        ['Mind-numbing Poison']       = {[[Interface\Icons\Spell_nature_nullifydisease]], 3},
        ['Mind-numbing Poison II']    = {[[Interface\Icons\Spell_nature_nullifydisease]], 3},
        ['Mind-numbing Poison III']   = {[[Interface\Icons\Spell_nature_nullifydisease]], 3},
        ['Instant Poison']            = {[[Interface\Icons\Spell_nature_corrosivebreath]], 3},
        ['Instant Poison II']         = {[[Interface\Icons\Spell_nature_corrosivebreath]], 3},
        ['Instant Poison III']        = {[[Interface\Icons\Spell_nature_corrosivebreath]], 3},
        ['Instant Poison IV']         = {[[Interface\Icons\Spell_nature_corrosivebreath]], 3},
        ['Instant Poison V']          = {[[Interface\Icons\Spell_nature_corrosivebreath]], 3},
        ['Instant Poison VI']         = {[[Interface\Icons\Spell_nature_corrosivebreath]], 3},
        ['Deadly Poison']             = {[[Interface\Icons\Ability_rogue_dualweild]], 3},
        ['Deadly Poison II']          = {[[Interface\Icons\Ability_rogue_dualweild]], 3},
        ['Deadly Poison III']         = {[[Interface\Icons\Ability_rogue_dualweild]], 3},
        ['Deadly Poison IV']          = {[[Interface\Icons\Ability_rogue_dualweild]], 3},
        ['Deadly Poison V']           = {[[Interface\Icons\Ability_rogue_dualweild]], 3},
        ['Crippling Poison']          = {[[Interface\Icons\Ability_poisonsting]], 3},
        ['Pick Lock']                 = {[[Interface\Icons\Spell_nature_moonkey]], 5},
            -- SHAMAN
        ['Ancestral Spirit']          = {[[Interface\Icons\Spell_nature_regenerate]], 10},
        ['Astral Recall']             = {[[Interface\Icons\Spell_nature_astralrecal]], 10},
        ['Chain Heal']                = {[[Interface\Icons\Spell_nature_healingwavegreater]], 2.5},
        ['Chain Lightning']           = {[[Interface\Icons\Spell_nature_chainlightning]], 1.5},
        ['Far Sight']                 = {[[Interface\Icons\Spell_nature_farsight]], 2},
        ['Ghost Wolf']                = {[[Interface\Icons\Spell_nature_spiritwolf]], 3},
        ['Healing Wave']              = {[[Interface\Icons\Spell_nature_healingwavegreater]], 2.5},
        ['Lesser Healing Wave']       = {[[Interface\Icons\Spell_nature_healingwavelesser]], 1.5},
        ['Lightning Bolt']            = {[[Interface\Icons\Spell_nature_lightning]], 3},
            -- WARLOCK
        ['Banish']                    = {[[Interface\Icons\Spell_shadow_cripple]], 1.5},
        ['Create Firestone']          = {[[Interface\Icons\Inv_misc_gem_bloodstone_02]], 3},
        ['Create Healthstone']        = {[[Interface\Icons\Inv_stone_04]], 3},
        ['Create Spellstone']         = {[[Interface\Icons\Inv_misc_gem_sapphire_01]], 5},
        ['Create Soulstone']          = {[[Interface\Icons\Spell_shadow_soulgem]], 3},
        ['Enslave Demon']             = {[[Interface\Icons\Spell_shadow_enslavedemon]], 3},
        ['Fear']                      = {[[Interface\Icons\Spell_shadow_possession]], 1.5},
        ['Howl of Terror']            = {[[Interface\Icons\Ability_warlock_howlofterror]], 2},
        ['Immolate']                  = {[[Interface\Icons\Spell_fire_immolation]], 1.5},
        ['Inferno']                   = {[[Interface\Icons\Spell_fire_incinerate]], 2},
        ['Ritual of Doom']            = {[[Interface\Icons\Spell_shadow_antimagicshell]], 10},
        ['Rain of Fire']              = {[[Interface\Icons\Spell_shadow_rainoffire]], 6},
        ['Ritual of Summoning']       = {[[Interface\Icons\Spell_shadow_twilight]], 5},
        ['Searing Pain']              = {[[Interface\Icons\Spell_fire_soulburn]], 1.5},
        ['Seduction']                 = {[[Interface\Icons\Spell_shadow_mindsteal]], 1.5},
        ['Shadow Bolt']               = {[[Interface\Icons\Spell_shadow_shadowbolt]], 2.5},
        ['Soul Fire']                 = {[[Interface\Icons\Spell_fire_fireball02]], 4},
        ['Summon Dreadsteed']         = {[[Interface\Icons\Ability_mount_dreadsteed]], 3},
        ['Summon Felhunter']          = {[[Interface\Icons\Spell_shadow_summonfelhunter]], 6},
        ['Summon Felsteed']           = {[[Interface\Icons\Spell_nature_swiftness]], 3},
        ['Summon Imp']                = {[[Interface\Icons\Spell_shadow_summonimp]], 6},
        ['Summon Succubus']           = {[[Interface\Icons\Spell_shadow_summonsuccubus]], 6},
        ['Summon Voidwalker']         = {[[Interface\Icons\Spell_shadow_summonvoidwalker]], 6},
    }

    MODUI_CHANNELED_HEALS_SPELLCASTS_TO_TRACK = {
            -- FIRST AID
        ['First Aid']   = {[[Interface\Icons\Spell_holy_heal]], 5.5, 1},
            -- DRUID
        ['Tranquility'] = {[[Interface\Icons\Spell_nature_tranquility]], 9.5, 2},
    }

    MODUI_CHANNELED_SPELLCASTS_TO_TRACK = {
            -- HUNTER
        ['Eagle Eye']         = {[[Interface\Icons\Ability_hunter_eagleeye]], 60},
    	['Eyes of the Beast'] = {[[Interface\Icons\Ability_eyeoftheowl]], 60},
        ['Mend Pet']          = {[[Interface\Icons\Ability_hunter_mendpet]], 10},
            -- MAGE
        ['Arcane Missile']    = {[[Interface\Icons\Spell_nature_starfall]], 2.25},
        ['Arcane Missiles']   = {[[Interface\Icons\Spell_nature_starfall]], 4.25},
        ['Blizzard']          = {[[Interface\Icons\Spell_frost_icestorm]], 8},
        ['Evocation']         = {[[Interface\Icons\Spell_nature_purge]], 8},
            -- PRIEST
        ['Mind Flay']         = {[[Interface\Icons\Spell_shadow_siphonmana]], 3},
        ['Mind Vision']       = {[[Interface\Icons\Spell_holy_mindvision]], 60},
            -- WARLOCK
        ['Drain Life']        = {[[Interface\Icons\Spell_shadow_lifedrain02]], 5},
        ['Drain Mana']        = {[[Interface\Icons\Spell_shadow_siphonmana]], 5},
        ['Drain Soul']        = {[[Interface\Icons\Spell_shadow_haunting]], 4},
        ['Hellfire']          = {[[Interface\Icons\Spell_holy_heal]], 6},
        ['Rain of Fire']      = {[[Interface\Icons\Spell_shadow_rainoffire]], 6},
    }

    MODUI_INSTANT_SPELLCASTS_TO_TRACK = {
            -- DRUID
		['Moonfire']         = true,
            -- MAGE
		['Arcane Explosion'] = true,
		['Cone of Cold']     = true,
		['Fire Blast']       = true,
		['Frost Nova']       = true,
            -- PRIEST
		['Holy Nova']        = true,
            -- SHAMAN
		['Earth Shock']      = true,
		['Flame Shock']      = true,
		['Frost Shock']      = true,
            -- WARLOCK
		['Shadowburn']       = true,
	}

    MODUI_TIME_MODIFIER_BUFFS_TO_TRACK = {
        ['Barkskin']                    = {1.4, {'all'}},
        ['Burning Adrenaline']          = {0,   {'all'}},
        ['Curse of Tongues']            = {1.6, {'all'}},
        ['Curse of the Eye']            = {1.2, {'all'}},
        ['Fang of the Crystal Spider']  = {1.1, {'all'}},
        ['Fel Domination']              = {.05,
            {
            'Summon Felhunter',
            'Summon Imp',
            'Summon Succubus',
            'Summon Voidwalker',}
        },
        ['Mind-numbing Poison']         = {1.6, {'all'}},
        ['Nature\'s Swiftness']         = {0,
            {   -- SHAMAN
            'Chain Heal',
            'Far Sight',
            'Ghost Wolf',
            'Healing Wave',
            'Lesser Healing Wave', 'Lightning Bolt',
                -- DRUID
            'Entangling Roots',
            'Healing Touch',
            'Hibernate',
            'Rebirth',
            'Regrowth',
            'Soothe Animal',
            'Wrath',}
        },
        ['Rapid Fire']	              = {.6, {'Aimed Shot'}},
        ['Shadow Trance']             = {0, {'Shadow Bolt'}},
        ['Presence of Mind']          = {0,
           {'Conjure Food', 'Conjure Water', 'Conjure Mana Agate', 'Conjure Mana Citrine', 'Conjure Mana Jade', 'Conjure Mana Ruby',
            'Fireball', 'Frostbolt', 'Flamestrike',
            'Polymorph', 'Polymorph: Pig', 'Polymorph: Turtle', 'Pyroblast',
            'Scorch',}
        },
        ['Mind Quickening']          = {.66,
           {'Conjure Food', 'Conjure Water', 'Conjure Mana Agate', 'Conjure Mana Citrine', 'Conjure Mana Jade', 'Conjure Mana Ruby',
            'Fireball', 'Frostbolt', 'Flamestrike',
            'Polymorph', 'Polymorph: Pig', 'Polymorph: Turtle', 'Pyroblast',
            'Scorch',}
        },
    }

    MODUI_INTERRUPTS_TO_TRACK = {
        ['Bash'] = true, ['Bear Form'] = true, ['Blackout'] = true, ['Blind'] = true, ['Blink'] = true,
        ['Cat Form'] = true, ['Charge Stun'] = true, ['Cheap Shot'] = true, ['Concussion Blow'] = true, ['Counterspell - Silenced'] = true,
        ['Death Coil'] = true, ['Dire Bear Form'] = true, ['Divine Intervention'] = true, ['Divine Protection'] = true, ['Divine Shield'] = true,
        ['Earth Shock'] = true, ['Elemental Mastery'] =  true,
        ['Fear'] = true, ['Feral Charge Effect'] = true, ['Fire Ward'] = true, ['Freezing Trap Effect'] = true, ['Frost Armor'] = true, ['Frost Ward'] = true,
        ['Gouge'] = true, ['Ghost Wolf'] = true,
        ['Hammer of Justice'] = true,
        ['Ice Armor'] = true, ['Ice Barrier'] = true, ['Ice Block'] = true, ['Impact'] = true, ['Inferno Effect'] = true, ['Inner Fire'] = true, ['Intercept Stun'] = true, ['Intimidating Shout'] = true, ['Intimidation'] = true, ['Iron Grenade'] = true,
        ['Kidney Shot'] = true, ['Kick'] = true, ['Kick - Silenced'] = true,
        ['Lightning Shield'] = true,
        ['Mace Stun Effect'] = true, ['Mage Armor'] = true, ['Mana Shield'] = true,
        ['Nature\'s Swiftness'] =  true,
        ['Polymorph'] = true, ['Polymorph: Pig'] = true, ['Polymorph: Turtle'] = true,['Pounce'] = true, ['Psychic Scream'] = true, ['Pummel'] = true,
        ['Reckless Charge'] = true, ['Revenge Stun'] = true,
        ['Scatter Shot'] = true, ['Seal of the Crusader'] = true, ['Seal of Righteousness'] = true, ['Shadow Ward'] = true, ['Shield Bash'] = true, ['Shield Bash - Silenced'] = true, ['Silence'] = true, ['Spell Lock'] = true, ['Starfire Stun'] = true, ['Stun'] = true,
        ['Thorium Grenade'] = true, ['Tidal Charm'] = true, ['Travel Form'] = true,
        ['Wyvern Sting'] = true,
    }

    --  TODO: DR/decay
    MODUI_BUFFS_TO_TRACK = {
            -- MISC
        ['Invulnerability']        = {[[Interface\Icons\Spell_holy_divineintervention]], 6},
        ['Ward of the Eye']        = {[[Interface\Icons\spell_totem_wardofdraining]], 6},
            -- RACIALS
        ['Perception']             = {[[Interface\Icons\Spell_nature_sleep]], 20},
        ['Stoneform']              = {[[Interface\Icons\Spell_shadow_unholystrength]], 8},
        ['Will of the Forsaken']   = {[[Interface\Icons\Spell_shadow_raisedead]], 5},
            -- ALCHEMY
        ['Free Action']            = {[[Interface\Icons\Inv_potion_04]], 30},
        ['Invulnerability']        = {[[Interface\Icons\Inv_potion_04]], 6},
        ['Living Free Action']     = {[[Interface\Icons\Inv_potion_07]], 5},
            -- ENGINEERING
        ['Flash Bomb']             = {[[Interface\Icons\Spell_Shadow_Darksummoning]], 10},
        ['Frost Reflector']        = {[[Interface\Icons\Spell_frost_frostward]], 5},
        ['Fire Reflector']         = {[[Interface\Icons\Spell_fire_sealoffire]], 5},
        ['Shadow Reflector']       = {[[Interface\Icons\Spell_shadow_antishadow]], 5},
            -- DRUID
    	['Abolish Poison']         = {[[Interface\Icons\Spell_nature_nullifypoison_02]], 8},
    	['Nature\'s Grasp']        = {[[Interface\Icons\Spell_nature_natureswrath]], 45},
        ['Innervate']              = {[[Interface\Icons\Spell_nature_lightning]], 20},
        --['Rejuvenation']           = {[[Interface\Icons\Spell_nature_rejuvenation]], 12},
            -- HUNTER
        ['Feign Death']            = {[[Interface\Icons\Ability_rogue_feigndeath]], 360},
        ['Improved Concussive Shot'] = {[[Interface\Icons\Spell_frost_stun]], 3},
            -- MAGE
    	['Frost Ward']             = {[[Interface\Icons\Spell_frost_frostward]], 30},
    	['Fire Ward']              = {[[Interface\Icons\Spell_fire_firearmor]], 30},
    	['Ice Block']              = {[[Interface\Icons\Spell_frost_frost]], 10},
        --['Ice Barrier']            = {[[Interface\Icons\Spell_ice_lament]], 60},
            -- PALADIN
    	['Blessing of Protection'] = {[[Interface\Icons\Spell_holy_sealofprotection]], 8},
    	['Blessing of Freedom']    = {[[Interface\Icons\Spell_holy_sealofvalor]], 10},
    	['Divine Protection']      = {[[Interface\Icons\Spell_holy_restoration]], 8},
            -- PRIEST
        ['Power Infusion']         = {[[Interface\Icons\Spell_holy_powerinfusion]], 20},
    	['Power Word: Shield']     = {[[Interface\Icons\Spell_holy_powerwordshield]], 30},
            -- ROGUE
        ['Vanish']                 = {[[Interface\Icons\Ability_vanish]], 10},
        ['Gouge']                  = {[[Interface\Icons\Ability_gouge]], 5}
            -- WARLOCK
    	-- ['Shadow Trance'] = {'Interface\\Icons\\Spell_shadow_twilight', 10},
    }

    MODUI_DEBUFFS_TO_TRACK = {
            -- MISC
        ['Flee']				     = {[[Interface\Icons\spell_magic_polymorphchicken]], 10},
        ['Reckless Charge']          = {[[Interface\Icons\Spell_nature_astralrecal]], 12},
        ['Sleep']                    = {[[Interface\Icons\Spell_nature_sleep]], 12},
        ['Tidal Charm']              = {[[Interface\Icons\Spell_frost_summonwaterelemental]], 3},
            -- BLACKWING LAIR
        ['Burning Adrenaline']       = {[[Interface\Icons\Spell_shadow_unholystrength]], 20, 'None'},
            -- MOLTEN CORE
        ['Living Bomb']              = {[[Interface\Icons\Inv_enchant_essenceastralsmall]], 8, 'None'},
            -- ENGINEERING
        ['Iron Grenade']             = {[[Interface\Icons\Spell_fire_selfdestruct]], 3, 'None'},
        ['Net-o-Matic']              = {[[Interface\Icons\ability_ensnare]], 10},
        ['Thorium Grenade']          = {[[Interface\Icons\Spell_fire_selfdestruct]], 3, 'None'},
            -- DRUID
        ['Hibernate']                = {[[Interface\Icons\Spell_nature_sleep]], 40, 'Magic'},
            -- HUNTER
        ['Freezing Trap']            = {[[Interface\Icons\Spell_frost_chainsofice]], 20, 'Magic'},
        ['Scare Beast']              = {[[Interface\Icons\Ability_druid_cower]], 20, 'Magic'},
            -- MAGE
        ['Polymorph']                = {[[Interface\Icons\Spell_nature_polymorph]], 50, 'Magic'},
        ['Polymorph: Pig']           = {[[Interface\Icons\Spell_magic_polymorphpig]], 50, 'Magic'},
        ['Polymorph: Turtle']        = {[[Interface\Icons\Ability_hunter_pet_turtle]], 50, 'Magic'},
            -- PALADIN
        ['Hammer of Justice']        = {[[Interface\Icons\Spell_holy_sealofmight]], 6, 'Magic'},
        ['Repentance']               = {[[Interface\Icons\Spell_holy_prayerofhealing]], 6, 'Magic'},
            -- PRIEST
        ['Mind Control']             = {[[Interface\Icons\Spell_shadow_siphonmana]], 3, 'None'},
        ['Mind Vision']              = {[[Interface\Icons\Spell_holy_mindvision]], 60, 'None'},
        ['Psychic Scream']           = {[[Interface\Icons\Spell_shadow_psychicscream]], 8, 'None'},
            -- ROGUE
        ['Blind']                    = {[[Interface\Icons\Spell_shadow_mindsteal]], 10, 'Poison'},
        ['Cheap Shot']               = {[[Interface\Icons\Ability_cheapshot]], 5, 'None'},
        ['Gouge']                    = {[[Interface\Icons\Ability_gouge]], 4, 'None'},
        ['Kidney Shot']              = {[[Interface\Icons\Ability_rogue_kidneyshot]], 6, 'None'},
        ['Sap']                      = {[[Interface\Icons\Ability_sap]], 11},
            -- WARLOCK
        ['Curse of Exhaustion']      = {[[Interface\Icons\Spell_shadow_grimward]], 12, 'Curse'},
        ['Curse of Tongues']         = {[[Interface\Icons\Spell_shadow_curseoftounges]], 30, 'Curse'},
        ['Death Coil']               = {[[Interface\Icons\Spell_shadow_deathcoil]], 3, 'Magic'},
        ['Drain Mana']               = {[[Interface\Icons\Spell_shadow_siphonmana]], 5, 'Magic'},
        ['Fear']                     = {[[Interface\Icons\Spell_shadow_possession]], 20, 'Magic'},
        ['Howl of Terror']           = {[[Interface\Icons\Spell_shadow_deathscream]], 15, 'Magic'},
            -- WARRIOR
        ['Charge Stun']              = {[[Interface\Icons\Spell_frost_stun]], 1, 'None'},
        ['Intercept Stun']           = {[[Interface\Icons\Spell_frost_stun]], 3, 'None'},
    }

    MODUI_TOTEMS = {
        ['Grounding']         = {   icon = 'Spell_Nature_GroundingTotem',
                                    time = 45,
                                    type = 'Earth'
                                },
        ['Earthbind']         = {   icon = 'Spell_Nature_StrengthOfEarthTotem02',
                                    time = 45,
                                    type = 'Earth'
                                },
        ['Stoneclaw']         = {   icon = 'Spell_Nature_StoneClawTotem',
                                    time = 15,
                                    type = 'Earth',
                                    -- rank[index] equals hitpoints in this case
                                    rank = {206, 276, 316, 346, 426, 486},
                                },
        ['Strength of Earth'] = {   icon = 'Spell_nature_earthbindtotem',
                                    time = 120,
                                    type = 'Earth'
                                },
        ['Stoneskin']         = {   icon = 'Spell_Nature_StoneSkinTotem',
                                    time = 120,
                                    type = 'Earth'
                                    },
        ['Tremor']            = {   icon = 'Spell_Nature_TremorTotem',
                                    time = 120,
                                    type = 'Earth'
                                },
            --
        ['Fire Nova']         = {   icon = 'Spell_Fire_SealOfFire',
                                    time = 5,
                                    type = 'Fire'
                                },
        ['Flametongue']       = {   icon = 'Spell_Nature_GuardianWard',
                                    time = 120,
                                    type = 'Fire'
                                },
        ['Frost Resistance']  = {   icon = 'Spell_FrostResistanceTotem_01',
                                    time = 120,
                                    type = 'Fire'
                                },
        ['Magma']             = {   icon = 'Spell_Fire_SelfDestruct',
                                    time = 20,
                                    type = 'Fire'
                                },
        ['Searing']           = {   icon = 'Spell_Fire_SearingTotem',
                                    time = 55,
                                    type = 'Fire',
                                    -- rank[index] equals hitpoints in this case
                                    rank = {30, 35, 40, 45, 50, 55},
                                },
            --
        ['Grace of Air']      = {   icon = 'Spell_Nature_InvisibilityTotem',
                                    time = 120,
                                    type = 'Air'
                                },
        ['Nature Resistance'] = {   icon = 'Spell_Nature_NatureResistanceTotem',
                                    time = 120,
                                    type = 'Air'
                                },
        ['Sentry']            = {   icon = 'Spell_Nature_RemoveCurse',
                                    time = 300,
                                    type = 'Air'
                                },
        ['Tranquil Air']      = {   icon = 'Spell_Nature_Brilliance',
                                    time = 120,
                                    type = 'Air'
                                },
        ['Windfury']          = {   icon = 'Spell_Nature_Windfury',
                                    time = 120,
                                    type = 'Air'
                                },
        ['Windwall']          = {   icon = 'Spell_Nature_EarthBind',
                                    time = 120,
                                    type = 'Air'
                                },
            --
        ['Disease Cleansing'] = {   icon = 'Spell_Nature_DiseaseCleansingTotem',
                                    time = 120,
                                    type = 'Water'
                                },
        ['Fire Resistance']   = {   icon = 'Spell_FireResistanceTotem_01',
                                    time = 120,
                                    type = 'Water'
                                },
        ['Healing Stream']    = {   icon = 'INV_Spear_04',
                                    time = 60,
                                    type = 'Water'
                                },
        ['Mana Spring']       = {   icon = 'Spell_Nature_ManaRegenTotem',
                                    time = 60,
                                    type = 'Water'
                                },
        ['Mana Tide']         = {   icon = 'Spell_Frost_SummonWaterElemental',
                                    time = 12,
                                    type = 'Water'
                                },
        ['Poison Cleansing']  = {   icon = 'Spell_Nature_PoisonCleansingTotem',
                                    time = 120,
                                    type = 'Water'
                                },
        ['Ancient Mana Spring'] = {
                                    icon = 'INV_Wand_01',
                                    time = 24,
                                    type = 'Water'
        }
    }

    --
