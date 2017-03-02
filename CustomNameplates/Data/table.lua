local L = AceLibrary("AceLocale-2.2"):new("CustomNameplates")
local BS = AceLibrary("Babble-Spell-2.3")

    CNP_HEX_CLASS_COLORS = {
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

    CNP_SPELL_SCHOOL_COLORS = {
        ['Physical'] = {r =  1, g =  1, b =  0},
        ['Holy']     = {r =  1, g = .9, b = .5},
        ['Fire']     = {r =  1, g = .5, b =  0},
        ['Nature']   = {r = .3, g =  1, b = .3},
        ['Frost']    = {r = .5, g =  1, b =  1},
        ['Shadow']   = {r = .5, g = .5, b =  1},
        ['Arcane']   = {r =  1, g = .5, b =  1},
    }

    CNP_SPELLCASTS_TO_TRACK = {
            -- MISC
	   [L['Cultivate Packet of Seeds']] = {[[Interface\Icons\inv_misc_food_45]], 10},
	   [L['Furbolg Form']] 			  	= {[[Interface\Icons\Inv_misc_monsterclaw_04]], 2},
	   [BS["Toxic Spit"]]				= {[[Interface\Icons\Spell_Nature_CorrosiveBreath]], 2},
	   [BS['Void Bolt']]				= {[[Interface\Icons\Spell_Shadow_ShadowBolt]],2},
            -- AHN'QIRAJ
       [L['Explode']]                   = {[[Interface\Icons\Spell_fire_selfdestruct]], 6},
            -- BLACKROCK SPIRE
       [L['Flame Buffet']]              = {[[Interface\Icons\Spell_fire_selfdestruct]], 6},
            -- BLACKWING LAIR
       [L['Shadow Flame']]              = {[[Interface\Icons\Spell_fire_incinerate]], 2},
       [L['Wing Buffet']]               = {[[Interface\Icons\Inv_misc_monsterscales_14]], 1},
       [L['Bellowing Roar']]            = {[[Interface\Icons\Spell_fire_fire]], 1.75},
            -- MOLTEN CORE
       [L['Dark Mending']]              = {[[Interface\Icons\Spell_shadow_chilltouch]], 2},
       [L['Dominate Mind']]             = {[[Interface\Icons\Spell_shadow_shadowworddominate]], 2},
       [L['Elemental Fire']]            = {[[Interface\Icons\Spell_fire_fireball02]], .5},
       [L['Magma Blast']]               = {[[Interface\Icons\Spell_fire_fireblast]], 1},
       [L['Summon Ragnaros']]           = {[[Interface\Icons\Spell_fire_lavaspawn]], 10},
            -- ONYXIA
       [L['Breath']]                    = {[[Interface\Icons\Spell_fire_fire]], 8},
            -- DIRE MAIL
       [L['Arcane Bolt']]               = {[[Interface\Icons\Spell_arcane_starfire]], 1},
            -- STRATHOLME
       [L['Banshee Wail']]              = {[[Interface\Icons\Spell_shadow_shadowbolt]], 1.5},
       [L['Venom Spit']]                = {[[Interface\Icons\Spell_nature_corrosivebreath]], 2.5},
            -- GLOBAL
       [L['Dark Mending']]              = {[[Interface\Icons\Spell_shadow_chilltouch]], 2},
       [L['Hearthstone']]               = {[[Interface\Icons\INV_Misc_Rune_01]], 10},
       [L['Magic Dust']]                = {[[Interface\Icons\Inv_misc_dust_02]], 1.5},
       [L['Reckless Charge']]           = {[[Interface\Icons\Spell_nature_astralrecal]], .1},
       [L['Sleep']]                     = {[[Interface\Icons\Spell_nature_sleep]], 1.5},
       [L['War Stomp']]                 = {[[Interface\Icons\Ability_warstomp]], .5},
            -- ENGINEERING
       [L['Rough Copper Bomb']]         = {[[Interface\Icons\Inv_misc_bomb_09]], 1},
       [L['Large Copper Bomb']]         = {[[Interface\Icons\Inv_misc_bomb_01]], 1},
       [L['Small Bronze Bomb']]         = {[[Interface\Icons\Inv_misc_bomb_09]], 1},
       [L['Big Bronze Bomb']]           = {[[Interface\Icons\Inv_misc_bomb_05]], 1},
       [L['Iron Grenade']]              = {[[Interface\Icons\Inv_misc_bomb_08]], 1},
       [L['Big Iron Bomb']]             = {[[Interface\Icons\Inv_misc_bomb_01]], 1},
       [L['Mithril Frag Bomb']]         = {[[Interface\Icons\Inv_misc_bomb_02]], 1},
       [L['Hi-Explosive Bomb']]         = {[[Interface\Icons\Inv_misc_bomb_07]], 1},
       [L['Thorium Grenade']]           = {[[Interface\Icons\Inv_misc_bomb_08]], 1},
       [L['Dark Iron Bomb']]            = {[[Interface\Icons\Inv_misc_bomb_05]], 1},
       [L['Arcane Bomb']]               = {[[Interface\Icons\Spell_shadow_mindbomb]], 1},
            -- FIRST AID
       [L['Linen Bandage']]             = {[[Interface\Icons\Inv_misc_bandage_15]], 3},
       [L['Heavy Linen Bandage']]       = {[[Interface\Icons\Inv_misc_bandage_18]], 3},
       [L['Wool Bandage']]              = {[[Interface\Icons\Inv_misc_bandage_14]], 3},
       [L['Heavy Wool Bandage']]        = {[[Interface\Icons\Inv_misc_bandage_17]], 3},
       [L['Silk Bandage']]              = {[[Interface\Icons\Inv_misc_bandage_01]], 3},
       [L['Heavy Silk Bandage']]        = {[[Interface\Icons\Inv_misc_bandage_02]], 3},
       [L['Mageweave Bandage']]         = {[[Interface\Icons\Inv_misc_bandage_19]], 3},
       [L['Heavy Mageweave Bandage']]   = {[[Interface\Icons\Inv_misc_bandage_20]], 3},
       [L['Runecloth Bandage']]         = {[[Interface\Icons\Inv_misc_bandage_11]], 3},
       [L['Heavy Runecloth Bandage']]   = {[[Interface\Icons\Inv_misc_bandage_12]], 3},
            -- DRUID
       [BS['Entangling Roots']]          = {[[Interface\Icons\Spell_nature_stranglevines]], 1.5},
       [BS['Healing Touch']]             = {[[Interface\Icons\Spell_nature_healingtouch]], 3},
       [BS['Hibernate']]                 = {[[Interface\Icons\Spell_nature_sleep]], 1.5},
       [BS['Rebirth']]                   = {[[Interface\Icons\Spell_nature_reincarnation]], 2},
       [BS['Regrowth']]                  = {[[Interface\Icons\Spell_nature_resistnature]], 2},
       [BS['Soothe Animal']]             = {[[Interface\Icons\Ability_hunter_beastsoothe]], 1.5},
       [BS['Starfire']]                  = {[[Interface\Icons\Spell_arcane_starfire]], 3},
       [BS['Teleport: Moonglade']]       = {[[Interface\Icons\Spell_arcane_teleportmoonglade]], 10},
       [BS['Wrath']]                     = {[[Interface\Icons\Spell_nature_abolishmagic]], 1.5},
            -- HUNTER
       [BS['Aimed Shot']]                = {[[Interface\Icons\Inv_spear_07]], 2.5},
       [BS['Dismiss Pet']]               = {[[Interface\Icons\Spell_nature_spiritwolf]], 5},
       [BS['Eyes of the Beast']]         = {[[Interface\Icons\Ability_eyeoftheowl]], 2},
       [BS['Revive Pet']]                = {[[Interface\Icons\Ability_hunter_beastsoothe]], 10},
       [BS['Scare Beast']]               = {[[Interface\Icons\Ability_druid_cower]], 1.5},
            -- MAGE
       [BS['Conjure Food']]              = {[[Interface\Icons\Inv_misc_food_73cinnamonroll]], 3},
       [BS['Conjure Water']]             = {[[Interface\Icons\Inv_drink_18]], 3},
       [BS['Conjure Mana Agate']]        = {[[Interface\Icons\Inv_misc_gem_emerald_01]], 3},
       [BS['Conjure Mana Citrine']]      = {[[Interface\Icons\Inv_misc_gem_opal_01]], 3},
       [BS['Conjure Mana Jade']]         = {[[Interface\Icons\Inv_misc_gem_emerald_02]], 3},
       [BS['Conjure Mana Ruby']]         = {[[Interface\Icons\Inv_misc_gem_ruby_01]], 3},
       [BS['Fireball']]                  = {[[Interface\Icons\Spell_fire_flamebolt]], 3},
       [BS['Frostbolt']]                 = {[[Interface\Icons\Spell_frost_frostbolt02]], 3},
       [BS['Flamestrike']]               = {[[Interface\Icons\Spell_fire_selfdestruct]], 3},
       [BS['Polymorph']]                 = {[[Interface\Icons\Spell_nature_polymorph]], 1.5},
       [BS['Polymorph: Pig']]            = {[[Interface\Icons\Spell_magic_polymorphpig]], 1.5},
       [BS['Polymorph: Turtle']]         = {[[Interface\Icons\Ability_hunter_pet_turtle]], 1.5},
       [BS['Portal: Darnassus']]         = {[[Interface\Icons\Spell_arcane_portaldarnassus]], 10},
       [BS['Portal: Thunder Bluff']]     = {[[Interface\Icons\Spell_arcane_portalthunderbluff]], 10},
       [BS['Portal: Ironforge']]         = {[[Interface\Icons\Spell_arcane_portalironforge]], 10},
       [BS['Portal: Orgrimmar']]         = {[[Interface\Icons\Spell_arcane_portalorgrimmar]], 10},
       [BS['Portal: Stormwind']]         = {[[Interface\Icons\Spell_arcane_portalstormwind]], 10},
       [BS['Portal: Undercity']]         = {[[Interface\Icons\Spell_arcane_portalundercity]], 10},
       [BS['Teleport: Darnassus']]       = {[[Interface\Icons\Spell_arcane_teleportdarnassus]], 10},
       [BS['Teleport: Thunder Bluff']]   = {[[Interface\Icons\Spell_arcane_teleportthunderbluff]], 10},
       [BS['Teleport: Ironforge']]       = {[[Interface\Icons\Spell_arcane_portalironforge]], 10},
       [BS['Teleport: Orgrimmar']]       = {[[Interface\Icons\Spell_arcane_teleportorgrimmar]], 10},
       [BS['Teleport: Stormwind']]       = {[[Interface\Icons\Spell_arcane_teleportstormwind]], 10},
       [BS['Teleport: Undercity']]       = {[[Interface\Icons\Spell_arcane_teleportundercity]], 10},
       [BS['Pyroblast']]                 = {[[Interface\Icons\Spell_fire_fireball02]], 6},
       [BS['Scorch']]                    = {[[Interface\Icons\Spell_fire_soulburn]], 1.5},
            -- PALADIN
       [BS['Hammer of Wrath']]           = {[[Interface\Icons\Ability_ThunderClap]], 1},
       [BS['Holy Light']]                = {[[Interface\Icons\Spell_holy_holybolt]], 2.5},
       [BS['Holy Wrath']]                = {[[Interface\Icons\Spell_holy_weaponmastery]], 2},
       [BS['Flash of Light']]            = {[[Interface\Icons\Spell_holy_flashheal]], 1.5},
       [BS['Redemption']]                = {[[Interface\Icons\Spell_holy_resurrection]], 10},
       [BS['Summon Warhorse']]           = {[[Interface\Icons\Spell_nature_swiftness]], 3},
       [BS['Summon Charger']]            = {[[Interface\Icons\Ability_mount_charger]], 3},
       [BS['Turn Undead']]               = {[[Interface\Icons\Spell_holy_turnundead]], 1.5},
            -- PRIEST
       [BS['Flash Heal']]                = {[[Interface\Icons\Spell_holy_flashheal]], 1.5},
       [BS['Greater Heal']]              = {[[Interface\Icons\Spell_holy_greaterheal]], 2.5},
       [BS['Heal']]                      = {[[Interface\Icons\Spell_holy_heal]], 2.5},
       [BS['Holy Fire']]                 = {[[Interface\Icons\Spell_holy_searinglight]], 3.5},
       [BS['Mana Burn']]                 = {[[Interface\Icons\Spell_shadow_manaburn]], 3},
       [BS['Mind Blast']]                = {[[Interface\Icons\Spell_shadow_unholyfrenzy]], 1.5},
       [BS['Mind Control']]              = {[[Interface\Icons\Spell_shadow_shadowworddominate]], 3},
       [BS['Prayer of Healing']]         = {[[Interface\Icons\Spell_holy_prayerofhealing02]], 3},
       [BS['Resurrection']]              = {[[Interface\Icons\Spell_holy_resurrection]], 10},
       [BS['Shackle Undead']]            = {[[Interface\Icons\Spell_nature_slow]], 1.5},
       [BS['Smite']]                     = {[[Interface\Icons\Spell_holy_holysmite]], 2.5},
            -- ROGUE
       [BS['Disarm Trap']]               = {[[Interface\Icons\Spell_shadow_grimward]], 5},
       [BS['Mind-numbing Poison']]       = {[[Interface\Icons\Spell_nature_nullifydisease]], 3},
       [BS['Mind-numbing Poison II']]    = {[[Interface\Icons\Spell_nature_nullifydisease]], 3},
       [BS['Mind-numbing Poison III']]   = {[[Interface\Icons\Spell_nature_nullifydisease]], 3},
       [BS['Instant Poison']]            = {[[Interface\Icons\Spell_nature_corrosivebreath]], 3},
       [BS['Instant Poison II']]         = {[[Interface\Icons\Spell_nature_corrosivebreath]], 3},
       [BS['Instant Poison III']]        = {[[Interface\Icons\Spell_nature_corrosivebreath]], 3},
       [BS['Instant Poison IV']]         = {[[Interface\Icons\Spell_nature_corrosivebreath]], 3},
       [BS['Instant Poison V']]          = {[[Interface\Icons\Spell_nature_corrosivebreath]], 3},
       [BS['Instant Poison VI']]         = {[[Interface\Icons\Spell_nature_corrosivebreath]], 3},
       [BS['Deadly Poison']]             = {[[Interface\Icons\Ability_rogue_dualweild]], 3},
       [BS['Deadly Poison II']]          = {[[Interface\Icons\Ability_rogue_dualweild]], 3},
       [BS['Deadly Poison III']]         = {[[Interface\Icons\Ability_rogue_dualweild]], 3},
       [BS['Deadly Poison IV']]          = {[[Interface\Icons\Ability_rogue_dualweild]], 3},
       [BS['Deadly Poison V']]           = {[[Interface\Icons\Ability_rogue_dualweild]], 3},
       [BS['Crippling Poison']]          = {[[Interface\Icons\Ability_poisonsting]], 3},
       [BS['Pick Lock']]                 = {[[Interface\Icons\Spell_nature_moonkey]], 5},
            -- SHAMAN
       [BS['Ancestral Spirit']]          = {[[Interface\Icons\Spell_nature_regenerate]], 10},
       [BS['Astral Recall']]             = {[[Interface\Icons\Spell_nature_astralrecal]], 10},
       [BS['Chain Heal']]                = {[[Interface\Icons\Spell_nature_healingwavegreater]], 2.5},
       [BS['Chain Lightning']]           = {[[Interface\Icons\Spell_nature_chainlightning]], 1.5},
       [BS['Far Sight']]                 = {[[Interface\Icons\Spell_nature_farsight]], 2},
       [BS['Ghost Wolf']]                = {[[Interface\Icons\Spell_nature_spiritwolf]], 3},
       [BS['Healing Wave']]              = {[[Interface\Icons\Spell_nature_healingwavegreater]], 2.5},
       [BS['Lesser Healing Wave']]       = {[[Interface\Icons\Spell_nature_healingwavelesser]], 1.5},
       [BS['Lightning Bolt']]            = {[[Interface\Icons\Spell_nature_lightning]], 3},
            -- WARLOCK
       [BS['Banish']]                    = {[[Interface\Icons\Spell_shadow_cripple]], 1.5},
       [BS["Corruption"]]				 = {[[Interface\Icons\Spell_Shadow_AbominationExplosion]], 2},
	   [BS['Create Firestone']]          = {[[Interface\Icons\Inv_misc_gem_bloodstone_02]], 3},
       [BS['Create Healthstone']]        = {[[Interface\Icons\Inv_stone_04]], 3},
       [BS['Create Spellstone']]         = {[[Interface\Icons\Inv_misc_gem_sapphire_01]], 5},
       [BS['Create Soulstone']]          = {[[Interface\Icons\Spell_shadow_soulgem]], 3},
       [BS['Enslave Demon']]             = {[[Interface\Icons\Spell_shadow_enslavedemon]], 3},
       [BS['Fear']]                      = {[[Interface\Icons\Spell_shadow_possession]], 1.5},
       [BS['Howl of Terror']]            = {[[Interface\Icons\Ability_warlock_howlofterror]], 2},
       [BS['Immolate']]                  = {[[Interface\Icons\Spell_fire_immolation]], 1.5},
       [BS['Inferno']]                   = {[[Interface\Icons\Spell_fire_incinerate]], 2},
       [BS['Ritual of Doom']]            = {[[Interface\Icons\Spell_shadow_antimagicshell]], 10},
       [BS['Rain of Fire']]              = {[[Interface\Icons\Spell_shadow_rainoffire]], 6},
       [BS['Ritual of Summoning']]       = {[[Interface\Icons\Spell_shadow_twilight]], 5},
       [BS['Searing Pain']]              = {[[Interface\Icons\Spell_fire_soulburn]], 1.5},
       [BS['Seduction']]                 = {[[Interface\Icons\Spell_shadow_mindsteal]], 1.5},
       [BS['Shadow Bolt']]               = {[[Interface\Icons\Spell_shadow_shadowbolt]], 2.5},
       [BS['Soul Fire']]                 = {[[Interface\Icons\Spell_fire_fireball02]], 4},
       [BS['Summon Dreadsteed']]         = {[[Interface\Icons\Ability_mount_dreadsteed]], 3},
       [BS['Summon Felhunter']]          = {[[Interface\Icons\Spell_shadow_summonfelhunter]], 6},
       [BS['Summon Felsteed']]           = {[[Interface\Icons\Spell_nature_swiftness]], 3},
       [BS['Summon Imp']]                = {[[Interface\Icons\Spell_shadow_summonimp]], 6},
       [BS['Summon Succubus']]           = {[[Interface\Icons\Spell_shadow_summonsuccubus]], 6},
       [BS['Summon Voidwalker']]         = {[[Interface\Icons\Spell_shadow_summonvoidwalker]], 6},
    }

    CNP_CHANNELED_HEALS_SPELLCASTS_TO_TRACK = {
            -- FIRST AID
       [BS['First Aid']]   = {[[Interface\Icons\Spell_holy_heal]], 5.5, 1},
            -- DRUID
       [BS['Tranquility']] = {[[Interface\Icons\Spell_nature_tranquility]], 10},
    }

    CNP_CHANNELED_SPELLCASTS_TO_TRACK = {
            -- HUNTER
       [BS['Eagle Eye']]         = {[[Interface\Icons\Ability_hunter_eagleeye]], 60},
       [BS['Eyes of the Beast']] = {[[Interface\Icons\Ability_eyeoftheowl]], 60},
       [BS['Mend Pet']]          = {[[Interface\Icons\Ability_hunter_mendpet]], 10},
            -- MAGE
       [L['Arcane Missile']]    = {[[Interface\Icons\Spell_nature_starfall]], 2.25},
       [BS['Arcane Missiles']]   = {[[Interface\Icons\Spell_nature_starfall]], 4.25},
       [BS['Blizzard']]          = {[[Interface\Icons\Spell_frost_icestorm]], 8},
       [BS['Evocation']]         = {[[Interface\Icons\Spell_nature_purge]], 8},
            -- PRIEST
       [BS['Mind Flay']]         = {[[Interface\Icons\Spell_shadow_siphonmana]], 3},
       [BS['Mind Vision']]       = {[[Interface\Icons\Spell_holy_mindvision]], 60},
            -- WARLOCK
       [BS['Drain Life']]        = {[[Interface\Icons\Spell_shadow_lifedrain02]], 5},
       [BS['Drain Mana']]        = {[[Interface\Icons\Spell_shadow_siphonmana]], 5},
       [BS['Drain Soul']]        = {[[Interface\Icons\Spell_shadow_haunting]], 4},
       [BS['Hellfire']]          = {[[Interface\Icons\Spell_holy_heal]], 6},
       [BS['Rain of Fire']]      = {[[Interface\Icons\Spell_shadow_rainoffire]], 6},
	   [BS['Health Funnel']]     = {[[Interface\Icons\Spell_Shadow_LifeDrain]], 10},
    }

    CNP_INSTANT_SPELLCASTS_TO_TRACK = {
            -- DRUID
		[BS['Moonfire']]         = true,
            -- MAGE
		[BS['Arcane Explosion']] = true,
		[BS['Cone of Cold']]     = true,
		[BS['Fire Blast']]       = true,
		[BS['Frost Nova']]       = true,
            -- PRIEST
		[BS['Holy Nova']]        = true,
            -- SHAMAN
		[BS['Earth Shock']]      = true,
		[BS['Flame Shock']]      = true,
		[BS['Frost Shock']]      = true,
            -- WARLOCK
		[BS['Shadowburn']]       = true,
	}

    CNP_TIME_MODIFIER_BUFFS_TO_TRACK = {
       [BS['Curse of Tongues']]    = {1.6, {'all'}},
       [BS['Mind-numbing Poison']] = {1.6, {'all'}},
        [BS["Nature's Swiftness"]]  = {0,
            {   -- SHAMAN
            BS['Chain Heal'],
            BS['Far Sight'],
            BS['Ghost Wolf'],
            BS['Healing Wave'],
            BS['Lesser Healing Wave'], BS['Lightning Bolt'],
                -- DRUID
            BS['Entangling Roots'],
            BS['Healing Touch'],
            BS['Hibernate'],
            BS['Rebirth'],
            BS['Regrowth'],
            BS['Soothe Animal'],
            BS['Wrath'],}
        },
       [BS['Shadow Trance']]       = {0, {BS['Shadow Bolt']}},
       [BS['Presence of Mind']]    = {0,
           {BS['Conjure Food'], BS['Conjure Water'], BS['Conjure Mana Agate'], BS['Conjure Mana Citrine'], BS['Conjure Mana Jade'], BS['Conjure Mana Ruby'],
            BS['Fireball'], BS['Frostbolt'], BS['Flamestrike'],
            BS['Polymorph'], BS['Pyroblast'],
            BS['Scorch'],}
        },
    }

    CNP_INTERRUPTS_TO_TRACK = {
        [BS['Bash']] = true, [BS['Blackout']] = true, [BS['Blind']] = true, [BS['Blink']] = true,
        [BS['Charge Stun']] = true, [BS['Concussion Blow']] = true, [BS['Counterspell - Silenced']] = true,
        [BS['Death Coil']] = true, [BS['Divine Intervention']] = true, [BS['Divine Protection']] = true, [BS['Divine Shield']] = true,
        [BS['Earth Shock']] = true,
        [BS['Fear']] = true, [L['Feral Charge Effect']] = true, [BS['Freezing Trap Effect']] = true,
        [BS['Gouge']] = true,
        [BS['Hammer of Justice']] = true,
        [BS['Ice Block']] = true, [BS['Impact']] = true, [L['Inferno Effect']] = true, [BS['Intercept Stun']] = true, [BS['Intimidating Shout']] = true, [BS['Intimidation']] = true,
        [BS['Kidney Shot']] = true, [BS['Kick']] = true, [BS['Kick - Silenced']] = true,
        [BS['Mace Stun Effect']] = true,
        [BS['Polymorph']] = true, [BS['Pounce']] = true, [BS['Psychic Scream']] = true, [BS['Pummel']] = true,
        [BS['Reckless Charge']] = true, [BS['Revenge Stun']] = true,
        [BS['Scatter Shot']] = true, [BS['Shield Bash']] = true, [BS['Shield Bash - Silenced']] = true, [BS['Silence']] = true, [BS['Spell Lock']] = true, [BS['Starfire Stun']] = true,
        [BS['Wyvern Sting']] = true,
    }

    CNP_BUFFS_TO_TRACK = {
            -- MISC
    	[L['Free Action Potion']]     = {[[Interface\Icons\Inv_potion_04]], 30},
        [L['Invulnerability']]        = {[[Interface\Icons\Spell_holy_divineintervention]], 6},
            -- RACIALS
        [BS['Perception']]             = {[[Interface\Icons\Spell_nature_sleep]], 20},
        [BS['Stoneform']]              = {[[Interface\Icons\Spell_shadow_unholystrength]], 8},
        [BS['Will of the Forsaken']]   = {[[Interface\Icons\Spell_shadow_raisedead]], 5},
            -- ENGINEERING
        [L['Frost Reflector']]        = {[[Interface\Icons\Spell_frost_frostward]], 5},
        [L['Fire Reflector']]         = {[[Interface\Icons\Spell_fire_sealoffire]], 5},
        [L['Shadow Reflector']]       = {[[Interface\Icons\Spell_shadow_antishadow]], 5},
            -- DRUID
    	[BS['Abolish Poison']]         = {[[Interface\Icons\Spell_nature_nullifypoison_02]], 8},
    	[BS['Nature\'s Grasp']]        = {[[Interface\Icons\Spell_nature_natureswrath]], 45},
            -- HUNTER
        [BS['Feign Death']]            = {[[Interface\Icons\Ability_rogue_feigndeath]], 360},
            -- MAGE
    	[BS['Frost Ward']]             = {[[Interface\Icons\Spell_frost_frostward]], 30},
    	[BS['Fire Ward']]              = {[[Interface\Icons\Spell_fire_firearmor]], 30},
    	[BS['Ice Block']]              = {[[Interface\Icons\Spell_frost_frost]], 10},
            -- PALADIN
    	[BS['Blessing of Protection']] = {[[Interface\Icons\Spell_holy_sealofprotection]], 8},
    	[BS['Blessing of Freedom']]    = {[[Interface\Icons\Spell_holy_sealofvalor]], 10},
    	[BS['Divine Protection']]      = {[[Interface\Icons\Spell_holy_restoration]], 8},
            -- PRIEST
        [BS['Power Infusion']]         = {[[Interface\Icons\Spell_holy_powerinfusion]], 20},
    	[BS['Power Word: Shield']]     = {[[Interface\Icons\Spell_holy_powerwordshield]], 30},
            -- ROGUE
        [BS['Vanish']]                 = {[[Interface\Icons\Ability_vanish]], 10},
            -- WARLOCK
    	-- [BS['Shadow Trance']] = {'Interface\\Icons\\Spell_shadow_twilight', 10},
    }

    CNP_DEBUFFS_TO_TRACK = {
            -- BLACKWING LAIR
        [L['Burning Adrenaline']]       = {[[Interface\Icons\Spell_shadow_unholystrength]], 20, 'None'},
            -- MOLTEN CORE
        [L['Living Bomb']]              = {[[Interface\Icons\Inv_enchant_essenceastralsmall]], 8, 'None'},
            -- ENGINEERING
        [L['Iron Grenade']]             = {[[Interface\Icons\Spell_fire_selfdestruct]], 3, 'None'},
        [L['Thorium Grenade']]          = {[[Interface\Icons\Spell_fire_selfdestruct]], 3, 'None'},
            -- DRUID
        [BS['Hibernate']]                = {[[Interface\Icons\Spell_nature_sleep]], 40, 'Magic'},
            -- HUNTER
        [BS['Freezing Trap']]            = {[[Interface\Icons\Spell_frost_chainsofice]], 20, 'Magic'},
        [BS['Scare Beast']]              = {[[Interface\Icons\Ability_druid_cower]], 20, 'Magic'},
            -- MAGE
        [BS['Polymorph']]                = {[[Interface\Icons\Spell_nature_polymorph]], 50, 'Magic'},
        [BS['Polymorph: Pig']]           = {[[Interface\Icons\Spell_magic_polymorphpig]], 50, 'Magic'},
        [BS['Polymorph: Turtle']]        = {[[Interface\Icons\Ability_hunter_pet_turtle]], 50, 'Magic'},
            -- PALADIN
        [BS['Hammer of Justice']]        = {[[Interface\Icons\Spell_holy_sealofmight]], 6, 'Magic'},
        [BS['Repentance']]               = {[[Interface\Icons\Spell_holy_prayerofhealing]], 6, 'Magic'},
            -- PRIEST
        [BS['Mind Control']]             = {[[Interface\Icons\Spell_shadow_siphonmana]], 3, 'None'},
        [BS['Mind Vision']]              = {[[Interface\Icons\Spell_holy_mindvision]], 60, 'None'},
        [BS['Psychic Scream']]           = {[[Interface\Icons\Spell_shadow_psychicscream]], 8, 'None'},
            -- ROGUE
        [BS['Blind']]                    = {[[Interface\Icons\Spell_shadow_mindsteal]], 10, 'Poison'},
        [BS['Cheap Shot']]               = {[[Interface\Icons\Ability_cheapshot]], 5, 'None'},
        [BS['Gouge']]                    = {[[Interface\Icons\Ability_gouge]], 4, 'None'},
        [BS['Kidney Shot']]              = {[[Interface\Icons\Ability_rogue_kidneyshot]], 6, 'None'},
            -- WARLOCK
        [BS['Curse of Exhaustion']]      = {[[Interface\Icons\Spell_shadow_grimward]], 12, 'Curse'},
        [BS['Curse of Tongues']]         = {[[Interface\Icons\Spell_shadow_curseoftounges]], 30, 'Curse'},
        [BS['Death Coil']]               = {[[Interface\Icons\Spell_shadow_deathcoil]], 3, 'Magic'},
        [BS['Drain Mana']]               = {[[Interface\Icons\Spell_shadow_siphonmana]], 5, 'Magic'},
        [BS['Fear']]                     = {[[Interface\Icons\Spell_shadow_possession]], 20, 'Magic'},
        [BS['Howl of Terror']]           = {[[Interface\Icons\Spell_shadow_deathscream]], 15, 'Magic'},
            -- WARRIOR
        [BS['Charge Stun']]              = {[[Interface\Icons\Spell_frost_stun]], 1, 'None'},
        [BS['Intercept Stun']]           = {[[Interface\Icons\Spell_frost_stun]], 3, 'None'},
    }

    --
