

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
        ['Cultivate Packet of Seeds'] = {[[Interface\Icons\inv_misc_food_45]], 10},
        ['Furbolg Form'] 			  = {[[Interface\Icons\Inv_misc_monsterclaw_04]], 2},
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
        ['Curse of Tongues']    = {1.6, {'all'}},
        ['Mind-numbing Poison'] = {1.6, {'all'}},
        ["Nature's Swiftness"]  = {0,
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
        ['Shadow Trance']       = {0, {'Shadow Bolt'}},
        ['Presence of Mind']    = {0,
           {'Conjure Food', 'Conjure Water', 'Conjure Mana Agate', 'Conjure Mana Citrine', 'Conjure Mana Jade', 'Conjure Mana Ruby',
            'Fireball', 'Frostbolt', 'Flamestrike',
            'Polymorph', 'Pyroblast',
            'Scorch',}
        },
    }

    MODUI_INTERRUPTS_TO_TRACK = {
        ['Bash'] = true, ['Blackout'] = true, ['Blind'] = true, ['Blink'] = true,
        ['Charge Stun'] = true, ['Concussion Blow'] = true, ['Counterspell - Silenced'] = true,
        ['Death Coil'] = true, ['Divine Intervention'] = true, ['Divine Protection'] = true, ['Divine Shield'] = true,
        ['Earth Shock'] = true,
        ['Fear'] = true, ['Feral Charge Effect'] = true, ['Freezing Trap Effect'] = true,
        ['Gouge'] = true,
        ['Hammer of Justice'] = true,
        ['Ice Block'] = true, ['Impact'] = true, ['Inferno Effect'] = true, ['Intercept Stun'] = true, ['Intimidating Shout'] = true, ['Intimidation'] = true,
        ['Kidney Shot'] = true, ['Kick'] = true, ['Kick - Silenced'] = true,
        ['Mace Stun Effect'] = true,
        ['Polymorph'] = true, ['Pounce'] = true, ['Psychic Scream'] = true, ['Pummel'] = true,
        ['Reckless Charge'] = true, ['Revenge Stun'] = true,
        ['Scatter Shot'] = true, ['Shield Bash'] = true, ['Shield Bash - Silenced'] = true, ['Silence'] = true, ['Spell Lock'] = true, ['Starfire Stun'] = true,
        ['Wyvern Sting'] = true,
    }

    MODUI_BUFFS_TO_TRACK = {
            -- MISC
    	['Free Action Potion']     = {[[Interface\Icons\Inv_potion_04]], 30},
        ['Invulnerability']        = {[[Interface\Icons\Spell_holy_divineintervention]], 6},
            -- RACIALS
        ['Perception']             = {[[Interface\Icons\Spell_nature_sleep]], 20},
        ['Stoneform']              = {[[Interface\Icons\Spell_shadow_unholystrength]], 8},
        ['Will of the Forsaken']   = {[[Interface\Icons\Spell_shadow_raisedead]], 5},
            -- ENGINEERING
        ['Frost Reflector']        = {[[Interface\Icons\Spell_frost_frostward]], 5},
        ['Fire Reflector']         = {[[Interface\Icons\Spell_fire_sealoffire]], 5},
        ['Shadow Reflector']       = {[[Interface\Icons\Spell_shadow_antishadow]], 5},
            -- DRUID
    	['Abolish Poison']         = {[[Interface\Icons\Spell_nature_nullifypoison_02]], 8},
    	['Nature\'s Grasp']        = {[[Interface\Icons\Spell_nature_natureswrath]], 45},
            -- HUNTER
        ['Feign Death']            = {[[Interface\Icons\Ability_rogue_feigndeath]], 360},
            -- MAGE
    	['Frost Ward']             = {[[Interface\Icons\Spell_frost_frostward]], 30},
    	['Fire Ward']              = {[[Interface\Icons\Spell_fire_firearmor]], 30},
    	['Ice Block']              = {[[Interface\Icons\Spell_frost_frost]], 10},
            -- PALADIN
    	['Blessing of Protection'] = {[[Interface\Icons\Spell_holy_sealofprotection]], 8},
    	['Blessing of Freedom']    = {[[Interface\Icons\Spell_holy_sealofvalor]], 10},
    	['Divine Protection']      = {[[Interface\Icons\Spell_holy_restoration]], 8},
            -- PRIEST
        ['Power Infusion']         = {[[Interface\Icons\Spell_holy_powerinfusion]], 20},
    	['Power Word: Shield']     = {[[Interface\Icons\Spell_holy_powerwordshield]], 30},
            -- ROGUE
        ['Vanish']                 = {[[Interface\Icons\Ability_vanish]], 10},
            -- WARLOCK
    	-- ['Shadow Trance'] = {'Interface\\Icons\\Spell_shadow_twilight', 10},
    }

    MODUI_DEBUFFS_TO_TRACK = {
            -- BLACKWING LAIR
        ['Burning Adrenaline']       = {[[Interface\Icons\Spell_shadow_unholystrength]], 20, 'None'},
            -- MOLTEN CORE
        ['Living Bomb']              = {[[Interface\Icons\Inv_enchant_essenceastralsmall]], 8, 'None'},
            -- ENGINEERING
        ['Iron Grenade']             = {[[Interface\Icons\Spell_fire_selfdestruct]], 3, 'None'},
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

    --
