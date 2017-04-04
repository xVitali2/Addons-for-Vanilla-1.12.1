-- Taken from enemyFrames by kuuurtz
-- https://github.com/zetone/enemyFrames

if FOCUS_TRADECASTS_TO_TRACK then return end
local BS = AceLibrary("Babble-Spell-2.2")
local B = AceLibrary("Babble-Item-2.0")
FOCUS_TRADECASTS_TO_TRACK = {
	-- MISC
	[BS['Fishing']]									= {['icon'] = [[Interface\Icons\Trade_Fishing]], 			['casttime'] = 30},
	-- ALCHEMY
	[B['Greater Healing Potion']]					= {['icon'] = [[Interface\Icons\Inv_potion_52]], 			['casttime'] = 3},
	[B['Greater Fire Protection Potion']]			= {['icon'] = [[Interface\Icons\Inv_potion_24]], 			['casttime'] = 3},
	[B['Mageblood Potion']]							= {['icon'] = [[Interface\Icons\inv_potion_45]], 			['casttime'] = 3},
	[B['Major Healing Potion']]						= {['icon'] = [[Interface\Icons\Inv_potion_54]], 			['casttime'] = 3},
	[B['Major Mana Potion']]						= {['icon'] = [[Interface\Icons\Inv_potion_76]], 			['casttime'] = 3},
	[B['Mana Potion']]								= {['icon'] = [[Interface\Icons\Inv_potion_72]], 			['casttime'] = 3},
	[B['Swiftness Potion']]							= {['icon'] = [[Interface\Icons\Inv_potion_95]], 			['casttime'] = 3},
	[B['Transmute: Arcanite']]						= {['icon'] = [[Interface\Icons\Inv_misc_stonetablet_05]], 	['casttime'] = 25},
	-- BLACKSMITH
	[B['Rough Sharpening Stone']]					= {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_01]], ['casttime'] = 5.125},
	[B['Rough Weightstone']]						= {['icon'] = [[Interface\Icons\inv_stone_weightstone_01]], 	['casttime'] = 5.125},
	[B['Coarse Sharpening Stone']]					= {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_02]], ['casttime'] = 5.125},
	[B['Coarse Weightstone']]						= {['icon'] = [[Interface\Icons\inv_stone_weightstone_02]], 	['casttime'] = 5.125},
	[B['Heavy Sharpening Stone']]					= {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_03]], ['casttime'] = 5.125},
	[B['Heavy Weightstone']]						= {['icon'] = [[Interface\Icons\inv_stone_weightstone_03]], 	['casttime'] = 5.125},
	[B['Solid Sharpening Stone']]					= {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_04]], ['casttime'] = 5.125},
	[B['Solid Weightstone']]						= {['icon'] = [[Interface\Icons\inv_stone_weightstone_04]], 	['casttime'] = 5.125},
	[B['Dense Sharpening Stone']]					= {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_05]], ['casttime'] = 8},
	[B['Dense Weightstone']]						= {['icon'] = [[Interface\Icons\inv_stone_weightstone_05]], 	['casttime'] = 8},
	-- COOKING
	[B['Smoked Sagefish']]							= {['icon'] = [[Interface\Icons\Inv_misc_fish_20]], 		['casttime'] = 3},
	[B['Savory Deviate Delight']]					= {['icon'] = [[Interface\Icons\Inv_misc_monsterhead_04]], 	['casttime'] = 3},
	[B['Thistle Tea']]								= {['icon'] = [[Interface\Icons\inv_drink_milk_05]], 		['casttime'] = 3},
	-- ENCHANTING
	[B['Enchant Chest - Minor Mana']]				= {['icon'] = [[Interface\Icons\Ability_warstomp]], 		['casttime'] = 5},
	-- ENGINEERING
	[B['Enchanted Leather']]						= {['icon'] = [[Interface\Icons\inv_misc_rune_05]], 		['casttime'] = 12.5},
	[B['Rough Blasting Powder']]					= {['icon'] = [[Interface\Icons\inv_misc_dust_01]], 		['casttime'] = 5.125},
	[B['Coarse Blasting Powder']]					= {['icon'] = [[Interface\Icons\inv_misc_dust_02]], 		['casttime'] = 5.125},
	[B['Heavy Blasting Powder']]					= {['icon'] = [[Interface\Icons\inv_misc_dust_06]], 		['casttime'] = 5.125},
	[B['Solid Blasting Powder']]					= {['icon'] = [[Interface\Icons\inv_misc_powder_black]], 	['casttime'] = 8},
	[B['Dense Blasting Powder']]					= {['icon'] = [[Interface\Icons\inv_misc_ammo_gunpowder_01]],['casttime'] = 8},
	[B['Arclight Spanner']]							= {['icon'] = [[Interface\Icons\inv_misc_wrench_01]], 		['casttime'] = 8},
	[B['Copper Modulator']]							= {['icon'] = [[Interface\Icons\inv_gizmo_03]], 			['casttime'] = 5.125},
	[B['Handful of Copper Bolts']]					= {['icon'] = [[Interface\Icons\inv_misc_gear_06]], 		['casttime'] = 1.5},
	-- FIRST AID
	[B['Linen Bandage']]           					= {['icon'] = [[Interface\Icons\Inv_misc_bandage_15]], 		['casttime'] = 3},
	[B['Heavy Linen Bandage']]     					= {['icon'] = [[Interface\Icons\Inv_misc_bandage_18]], 		['casttime'] = 3},
	[B['Wool Bandage']]           					= {['icon'] = [[Interface\Icons\Inv_misc_bandage_14]], 		['casttime'] = 3},
	[B['Heavy Wool Bandage']]     					= {['icon'] = [[Interface\Icons\Inv_misc_bandage_17]], 		['casttime'] = 3},
	[B['Silk Bandage']]            					= {['icon'] = [[Interface\Icons\Inv_misc_bandage_01]], 		['casttime'] = 3},
	[B['Heavy Silk Bandage']]      					= {['icon'] = [[Interface\Icons\Inv_misc_bandage_02]], 		['casttime'] = 3},
	[B['Mageweave Bandage']]       					= {['icon'] = [[Interface\Icons\Inv_misc_bandage_19]], 		['casttime'] = 3},
	[B['Heavy Mageweave Bandage']] 					= {['icon'] = [[Interface\Icons\Inv_misc_bandage_20]], 		['casttime'] = 3},
	[B['Runecloth Bandage']]       					= {['icon'] = [[Interface\Icons\Inv_misc_bandage_11]], 		['casttime'] = 3},
	[B['Heavy Runecloth Bandage']]					= {['icon'] = [[Interface\Icons\Inv_misc_bandage_12]], 		['casttime'] = 3},
	-- LEATHERWORKING

	[BS['Skinning']]								= {['icon'] = [[Interface\Icons\inv_misc_pelt_wolf_01]], 	['casttime'] = 3},
	-- MINING
	[B['Smelt Copper']]								= {['icon'] = [[Interface\Icons\Inv_ingot_02]], 			['casttime'] = 3},
	[B['Copper Bar']]								= {['icon'] = [[Interface\Icons\Inv_ingot_02]], 			['casttime'] = 3},
	[B['Smelt Tin']]								= {['icon'] = [[Interface\Icons\Inv_ingot_05]], 			['casttime'] = 3},
	[B['Smelt Bronze']]								= {['icon'] = [[Interface\Icons\Inv_ingot_02]], 			['casttime'] = 3},
	[B['Smelt Silver']]								= {['icon'] = [[Interface\Icons\Inv_ingot_01]], 			['casttime'] = 3},
	[B['Smelt Gold']]								= {['icon'] = [[Interface\Icons\Inv_ingot_03]], 			['casttime'] = 3},
	[B['Smelt Iron']]								= {['icon'] = [[Interface\Icons\Inv_ingot_04]], 			['casttime'] = 3},
	[B['Smelt Mithril']]							= {['icon'] = [[Interface\Icons\Inv_ingot_06]], 			['casttime'] = 3},
	[B['Smelt Truesilver']]							= {['icon'] = [[Interface\Icons\Inv_ingot_08]], 			['casttime'] = 3},
	[B['Smelt Thorium']]							= {['icon'] = [[Interface\Icons\Inv_ingot_07]], 			['casttime'] = 3},
	[B['Thorium Bar']]								= {['icon'] = [[Interface\Icons\Inv_ingot_07]], 			['casttime'] = 3},
	-- TAILORING
	[B['Bolt of Linen Cloth']]						= {['icon'] = [[Interface\Icons\inv_fabric_linen_02]], 		['casttime'] = 3},
	[B['Bolt of Woolen Cloth']]						= {['icon'] = [[Interface\Icons\inv_fabric_wool_03]], 		['casttime'] = 5.125},
	[B['Bolt of Silk Cloth']]						= {['icon'] = [[Interface\Icons\inv_fabric_silk_03]], 		['casttime'] = 5.125},
	[B['Bolt of Mageweave']]						= {['icon'] = [[Interface\Icons\inv_fabric_mageweave_03]], 	['casttime'] = 8},
	[B['Bolt of Runecloth']]						= {['icon'] = [[Interface\Icons\inv_fabric_purplefire_02]], ['casttime'] = 12.5},
}

FOCUS_SPELLCASTS_TO_TRACK = {
	-- MISC & MOB SPELLS
	[BS['Acid Spit']]					= {['icon'] = [[Interface\Icons\spell_nature_acid_01]], 			['casttime'] = 3},
	[BS['Bomb']]						= {['icon'] = [[Interface\Icons\spell_fire_selfdestruct]], 			['casttime'] = 2},
	[BS['Black Sludge']]				= {['icon'] = [[Interface\Icons\spell_shadow_callofbone]], 			['casttime'] = 3},
	[BS['Boulder']]						= {['icon'] = [[Interface\Icons\inv_stone_10]], 					['casttime'] = 2},
	[BS['Chained Bolt']]				= {['icon'] = [[Interface\Icons\spell_nature_chainlightning]], 		['casttime'] = 1.8},
	[BS['Chains of Ice']] 				= {['icon'] = [[Interface\Icons\spell_frost_chainsofice]], 			['casttime'] = 1.5},
	[BS['Clone']]						= {['icon'] = [[Interface\Icons\spell_shadow_blackplague]], 		['casttime'] = 2.5},
	[BS['Creeping Mold']] 				= {['icon'] = [[Interface\Icons\spell_shadow_creepingplague]], 		['casttime'] = 3},
	[BS['Cripple']]						= {['icon'] = [[Interface\Icons\spell_shadow_cripple]], 			['casttime'] = 3},
	[BS['Crystal Flash']]				= {['icon'] = [[Interface\Icons\spell_shadow_teleport]], 			['casttime'] = 2,	['immune'] = true,},
	[BS['Crystal Gaze']] 				= {['icon'] = [[Interface\Icons\ability_golemthunderclap]], 		['casttime'] = 2,	['immune'] = true,},
	[BS['Crystalline Slumber']] 		= {['icon'] = [[Interface\Icons\spell_nature_sleep]], 				['casttime'] = 2,	['immune'] = true,},
	[BS['Cultivate Packet of Seeds']] 	= {['icon'] = [[Interface\Icons\inv_misc_food_45]], 				['casttime'] = 10},
	[BS['Curse of Mending']]			= {['icon'] = [[Interface\Icons\spell_shadow_antishadow]], 			['casttime'] = 1},
	[BS['Curse of the Deadwood']]		= {['icon'] = [[Interface\Icons\spell_shadow_gathershadows]], 		['casttime'] = 2},
	[BS['Curse of the Fallen Magram']] 	= {['icon'] = [[Interface\Icons\spell_shadow_unholyfrenzy]], 		['casttime'] = 2},
	[BS['Dark Sludge']]					= {['icon'] = [[Interface\Icons\spell_shadow_creepingplague]], 		['casttime'] = 5},
	[BS['Dire Growl']] 					= {['icon'] = [[Interface\Icons\ability_racial_cannibalize]], 		['casttime'] = 1,	['immune'] = true,},
	[BS['Fevered Fatigue']] 			= {['icon'] = [[Interface\Icons\spell_nature_nullifydisease]], 		['casttime'] = 3,},
	[BS['Fire Shield II']] 				= {['icon'] = [[Interface\Icons\spell_fire_immolation]], 			['casttime'] = 1,},
	[BS['Flame Spike']]					= {['icon'] = [[Interface\Icons\spell_fire_flamebolt]], 			['casttime'] = 3,},
	[BS['Flamespit']]					= {['icon'] = [[Interface\Icons\spell_fire_selfdestruct]], 			['casttime'] = 3,},
	[BS['Freeze Solid']]				= {['icon'] = [[Interface\Icons\spell_frost_glacier]], 				['casttime'] = 2.5},
	[BS['Furbolg Form']] 				= {['icon'] = [[Interface\Icons\Inv_misc_monsterclaw_04]], 			['casttime'] = 2,	['immune'] = true,},
	[BS['Diseased Slime']]				= {['icon'] = [[Interface\Icons\spell_shadow_creepingplague]], 	 	['casttime'] = 2,	['immune'] = true,},
	[BS['Disenchant']]					= {['icon'] = [[Interface\Icons\Inv_Enchant_Disenchant]], 			['casttime'] = 3},
	[BS['Drink Minor Potion']]			= {['icon'] = [[Interface\Icons\Spell_holy_heal]], 					['casttime'] = 3},
	[BS['Dynamite']]					= {['icon'] = [[Interface\Icons\spell_fire_selfdestruct]], 			['casttime'] = 1},
	[BS['Earthgrab Totem']]				= {['icon'] = [[Interface\Icons\spell_nature_naturetouchdecay]],	['casttime'] = .5},
	[BS['Exploding Shot']]				= {['icon'] = [[Interface\Icons\spell_fire_fireball02]], 			['casttime'] = 1},
	[BS['Icicle']]						= {['icon'] = [[Interface\Icons\spell_frost_frostbolt02]], 			['casttime'] = 1.5},
	[BS['Ink Spray']]					= {['icon'] = [[Interface\Icons\spell_nature_sleep]], 				['casttime'] = 1,	['immune'] = true,},
	[BS['Healing Ward']]				= {['icon'] = [[Interface\Icons\spell_holy_layonhands]], 			['casttime'] = 2},
	[BS['Holy Smite']]					= {['icon'] = [[Interface\Icons\Spell_holy_holysmite]], 			['casttime'] = 2.5},
	[BS['Lizard Bolt']]					= {['icon'] = [[Interface\Icons\spell_nature_lightning]], 			['casttime'] = 2},
	[BS['Plague Cloud']] 				= {['icon'] = [[Interface\Icons\spell_shadow_callofbone]], 			['casttime'] = 2,},
	[BS['Plague Mind']]					= {['icon'] = [[Interface\Icons\spell_shadow_callofbone]], 			['casttime'] = 4},
	[BS['Poisoned Shot']] 				= {['icon'] = [[Interface\Icons\ability_poisons]], 					['casttime'] = 2,},
	[BS['Quick Flame Ward']] 			= {['icon'] = [[Interface\Icons\spell_fire_sealoffire]], 			['casttime'] = 1.5,},
	[BS['Shrink']] 						= {['icon'] = [[Interface\Icons\spell_shadow_antishadow]], 			['casttime'] = 3,},
	[BS['Silithid Pox']] 				= {['icon'] = [[Interface\Icons\spell_nature_nullifydisease]], 		['casttime'] = 2,},
	[BS['Slowing Poison']] 				= {['icon'] = [[Interface\Icons\spell_nature_slowpoison]], 			['casttime'] = 1,},
	[BS['Toxic Spit']] 					= {['icon'] = [[Interface\Icons\spell_nature_corrosivebreath]], 	['casttime'] = 2.5,},
	[BS['Trelane\'s Freezing Touch']] 	= {['icon'] = [[Interface\Icons\spell_shadow_unsummonbuilding]], 	['casttime'] = 3,},
	[BS['Wandering Plague']]			= {['icon'] = [[Interface\Icons\spell_shadow_callofbone]], 			['casttime'] = 2},
	[BS['Weak Frostbolt']]				= {['icon'] = [[Interface\Icons\spell_frost_frostbolt02]], 			['casttime'] = 2.2},
	[BS['Wither Touch']]				= {['icon'] = [[Interface\Icons\spell_nature_drowsy]], 				['casttime'] = 2},
	[BS['Poison Bolt']]					= {['icon'] = [[Interface\Icons\spell_nature_corrosivebreath]],		['casttime'] = 2.3},
		-- AHN'QIRAJ
	[BS['Explode']]                 	= {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], 			['casttime'] = 6},
		-- BLACKWING LAIR
	[BS['Shadow Flame']]           		= {['icon'] = [[Interface\Icons\Spell_fire_incinerate]], 			['casttime'] = 2},
	[BS['Wing Buffet']]             	= {['icon'] = [[Interface\Icons\Inv_misc_monsterscales_14]],		['casttime'] = 1},
	[BS['Bellowing Roar']]          	= {['icon'] = [[Interface\Icons\Spell_fire_fire]], 					['casttime'] = 1.75},
		-- BLACKROCK SPIRE
	[BS['Flame Buffet']]              	= {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], 			['casttime'] = 6},
		-- ONYXIA
	[BS['Breath']]                  	= {['icon'] = [[Interface\Icons\Spell_fire_fire]], 					['casttime'] = 8},
		-- MOLTEN CORE
	[BS['Dark Mending']]              	= {['icon'] = [[Interface\Icons\Spell_shadow_chilltouch]], 			['casttime'] = 2},
	[BS['Dominate Mind']]             	= {['icon'] = [[Interface\Icons\Spell_shadow_shadowworddominate]], 	['casttime'] = 2},
	[BS['Elemental Fire']]            	= {['icon'] = [[Interface\Icons\Spell_fire_fireball02]], 			['casttime'] = .5},
	[BS['Magma Blast']]               	= {['icon'] = [[Interface\Icons\Spell_fire_flameshock]], 			['casttime'] = 1},
	[BS['Summon Ragnaros']]          	= {['icon'] = [[Interface\Icons\Spell_fire_lavaspawn]],				['casttime'] = 10},
		-- DIRE MAUL
	[BS['Arcane Bolt']]              	= {['icon'] = [[Interface\Icons\Spell_arcane_starfire]], 			['casttime'] = 1},
		-- STRATHOLME
	[BS['Banshee Wail']]              	= {['icon'] = [[Interface\Icons\Spell_shadow_shadowbolt]], 			['casttime'] = 1.5},
	[BS['Venom Spit']]                	= {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], 	['casttime'] = 2.5},

		-- GLOBAL
	[BS['Dark Mending']]            = {['icon'] = [[Interface\Icons\Spell_shadow_chilltouch]], 				['casttime'] = 2},
	[BS['Escape Artist']]				= {['icon'] = [[Interface\Icons\ability_rogue_trip]], 				['casttime'] = .5},
	[BS['Hearthstone']]             = {['icon'] = [[Interface\Icons\INV_Misc_Rune_01]], 					['casttime'] = 10},
	[BS['Magic Dust']]              = {['icon'] = [[Interface\Icons\Inv_misc_dust_02]], 					['casttime'] = 1.5},
	[BS['Reckless Charge']]         = {['icon'] = [[Interface\Icons\Spell_nature_astralrecal]], 			['casttime'] = .1},
	[BS['Sleep']]                   = {['icon'] = [[Interface\Icons\Spell_nature_sleep]], 					['casttime'] = 1.5},
	[BS['War Stomp']]               = {['icon'] = [[Interface\Icons\Ability_warstomp]], 					['casttime'] = .5},

		-- ENGINEERING
	[B['Rough Copper Bomb']]       = {['icon'] = [[Interface\Icons\Inv_misc_bomb_09]], 					['casttime'] = 1},
	[B['Large Copper Bomb']]       = {['icon'] = [[Interface\Icons\Inv_misc_bomb_01]], 					['casttime'] = 1},
	[B['Small Bronze Bomb']]       = {['icon'] = [[Interface\Icons\Inv_misc_bomb_09]], 					['casttime'] = 1},
	[B['Big Bronze Bomb']]         = {['icon'] = [[Interface\Icons\Inv_misc_bomb_05]], 					['casttime'] = 1},
	[B['Iron Grenade']]            = {['icon'] = [[Interface\Icons\Inv_misc_bomb_08]], 					['casttime'] = 1},
	[B['Big Iron Bomb']]           = {['icon'] = [[Interface\Icons\Inv_misc_bomb_01]], 					['casttime'] = 1},
	[B['Mithril Frag Bomb']]       = {['icon'] = [[Interface\Icons\Inv_misc_bomb_02]], 					['casttime'] = 1},
	[B['Hi-Explosive Bomb']]       = {['icon'] = [[Interface\Icons\Inv_misc_bomb_07]], 					['casttime'] = 1},
	[B['Thorium Grenade']]         = {['icon'] = [[Interface\Icons\Inv_misc_bomb_08]], 					['casttime'] = 1},
	[B['Dark Iron Bomb']]          = {['icon'] = [[Interface\Icons\Inv_misc_bomb_05]], 					['casttime'] = 1},
	[B['Arcane Bomb']]             = {['icon'] = [[Interface\Icons\Spell_shadow_mindbomb]],				['casttime'] = 1},

		-- DRUID
	[BS['Entangling Roots']]        = {['icon'] = [[Interface\Icons\Spell_nature_stranglevines]], 		['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'nature', 	['class'] = 'DRUID'},
	[BS['Healing Touch']]           = {['icon'] = [[Interface\Icons\Spell_nature_healingtouch]], 		['casttime'] = 3, 												['class'] = 'DRUID'},
	[BS['Hibernate']]              = {['icon'] = [[Interface\Icons\Spell_nature_sleep]], 				['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'nature', 	['class'] = 'DRUID'},
	[BS['Rebirth']]                 = {['icon'] = [[Interface\Icons\Spell_nature_reincarnation]], 		['casttime'] = 2, 												['class'] = 'DRUID'},
	[BS['Regrowth']]                = {['icon'] = [[Interface\Icons\Spell_nature_resistnature]], 		['casttime'] = 2, 												['class'] = 'DRUID'},
	[BS['Soothe Animal']]           = {['icon'] = [[Interface\Icons\Ability_hunter_beastsoothe]], 		['casttime'] = 1.5, 											['class'] = 'DRUID'},
	[BS['Starfire']]                = {['icon'] = [[Interface\Icons\Spell_arcane_starfire]], 			['casttime'] = 3, 	['type'] = 'dmg', ['school'] = 'nature', 	['class'] = 'DRUID'},
	[BS['Teleport: Moonglade']]     = {['icon'] = [[Interface\Icons\Spell_arcane_teleportmoonglade]], 	['casttime'] = 10, 												['class'] = 'DRUID'},
	[BS['Wrath']]                   = {['icon'] = [[Interface\Icons\Spell_nature_abolishmagic]], 		['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'nature', 	['class'] = 'DRUID'},
		-- HUNTER
	[BS['Aimed Shot']]              = {['icon'] = [[Interface\Icons\Inv_spear_07]], 					['casttime'] = 2.5, ['type'] = 'dmg', ['school'] = 'physical', 	['class'] = 'HUNTER',	['immune'] = true,},
	[BS['Dismiss Pet']]             = {['icon'] = [[Interface\Icons\Spell_nature_spiritwolf]], 			['casttime'] = 5},
	[BS['Eyes of the Beast']]       = {['icon'] = [[Interface\Icons\Ability_eyeoftheowl]], 				['casttime'] = 2},
	[BS['Multi-Shot']]              = {['icon'] = [[Interface\Icons\ability_upgrademoonglaive]], 		['casttime'] = 0.5, ['type'] = 'dmg', ['school'] = 'physical', 	['class'] = 'HUNTER',	['immune'] = true,},
	[BS['Revive Pet']]              = {['icon'] = [[Interface\Icons\Ability_hunter_beastsoothe]], 		['casttime'] = 10},
	[BS['Scare Beast']]             = {['icon'] = [[Interface\Icons\Ability_druid_cower]], 				['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'physical', 	['class'] = 'HUNTER'},
		-- MAGE
--        ['Arcane Missile']         = {[[Interface\Icons\Spell_nature_starfall]], 3},
--		['Arcane Missiles']         = {[[Interface\Icons\Spell_nature_starfall]], 5},
--        ['Blizzard']                = {[[Interface\Icons\Spell_frost_icestorm]], 8},
	[BS['Conjure Food']]            = {['icon'] = [[Interface\Icons\Inv_misc_food_73cinnamonroll]], 	['casttime'] = 3, 	['class'] = 'MAGE'},
	[BS['Conjure Water']]           = {['icon'] = [[Interface\Icons\Inv_drink_18]], 					['casttime'] = 3, 	['class'] = 'MAGE'},
	[BS['Conjure Mana Agate']]      = {['icon'] = [[Interface\Icons\Inv_misc_gem_emerald_01]], 			['casttime'] = 3, 	['class'] = 'MAGE'},
	[BS['Conjure Mana Citrine']]    = {['icon'] = [[Interface\Icons\Inv_misc_gem_opal_01]], 			['casttime'] = 3, 	['class'] = 'MAGE'},
	[BS['Conjure Mana Jade']]       = {['icon'] = [[Interface\Icons\Inv_misc_gem_emerald_02]], 			['casttime'] = 3, 	['class'] = 'MAGE'},
	[BS['Conjure Mana Ruby']]       = {['icon'] = [[Interface\Icons\Inv_misc_gem_ruby_01]], 			['casttime'] = 3, 	['class'] = 'MAGE'},
--        ['Evocation']               = {[[Interface\Icons\Spell_nature_purge]], 8},
	[BS['Fireball']]                = {['icon'] = [[Interface\Icons\Spell_fire_flamebolt]], 			['casttime'] = 2.5, ['class'] = 'MAGE',	['type'] = 'dmg', ['school'] = 'fire', },
	[BS['Frostbolt']]               = {['icon'] = [[Interface\Icons\Spell_frost_frostbolt02]], 			['casttime'] = 2.5, ['class'] = 'MAGE', ['type'] = 'dmg', ['school'] = 'frost'},
	[BS['Flamestrike']]             = {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], 			['casttime'] = 3, 	['class'] = 'MAGE'},
	[BS['Polymorph']]               = {['icon'] = [[Interface\Icons\Spell_nature_polymorph]], 			['casttime'] = 1.5, ['class'] = 'MAGE', ['type'] = 'dmg', ['school'] = 'arcane',},
	[BS['Polymorph: Pig']]          = {['icon'] = [[Interface\Icons\Spell_magic_polymorphpig]], 		['casttime'] = 1.5, ['class'] = 'MAGE', ['type'] = 'dmg', ['school'] = 'arcane',},
	[BS['Polymorph: Turtle']]       = {['icon'] = [[Interface\Icons\Ability_hunter_pet_turtle]], 		['casttime'] = 1.5, ['class'] = 'MAGE', ['type'] = 'dmg', ['school'] = 'arcane',},
	[BS['Portal: Darnassus']]       = {['icon'] = [[Interface\Icons\Spell_arcane_portaldarnassus]], 	['casttime'] = 10},
	[BS['Portal: Thunder Bluff']]   = {['icon'] = [[Interface\Icons\Spell_arcane_portalthunderbluff]], 	['casttime'] = 10},
	[BS['Portal: Ironforge']]       = {['icon'] = [[Interface\Icons\Spell_arcane_portalironforge]], 	['casttime'] = 10},
	[BS['Portal: Orgrimmar']]       = {['icon'] = [[Interface\Icons\Spell_arcane_portalorgrimmar]], 	['casttime'] = 10},
	[BS['Portal: Stormwind']]       = {['icon'] = [[Interface\Icons\Spell_arcane_portalstormwind]], 	['casttime'] = 10},
	[BS['Portal: Undercity']]       = {['icon'] = [[Interface\Icons\Spell_arcane_portalundercity]], 	['casttime'] = 10},
	[BS['Teleport: Darnassus']]     = {['icon'] = [[Interface\Icons\Spell_arcane_teleportdarnassus]], 	['casttime'] = 10},
	[BS['Teleport: Thunder Bluff']] = {['icon'] = [[Interface\Icons\Spell_arcane_teleportthunderbluff]],['casttime'] = 10},
	[BS['Teleport: Ironforge']]     = {['icon'] = [[Interface\Icons\Spell_arcane_portalironforge]], 	['casttime'] = 10},
	[BS['Teleport: Orgrimmar']]     = {['icon'] = [[Interface\Icons\Spell_arcane_teleportorgrimmar]], 	['casttime'] = 10},
	[BS['Teleport: Stormwind']]     = {['icon'] = [[Interface\Icons\Spell_arcane_teleportstormwind]], 	['casttime'] = 10},
	[BS['Teleport: Undercity']]     = {['icon'] = [[Interface\Icons\Spell_arcane_teleportundercity]], 	['casttime'] = 10},
	[BS['Pyroblast']]               = {['icon'] = [[Interface\Icons\Spell_fire_fireball02]], 			['casttime'] = 6, 	['type'] = 'dmg', ['school'] = 'fire', ['class'] = 'MAGE'},
	[BS['Scorch']]                  = {['icon'] = [[Interface\Icons\Spell_fire_soulburn]], 				['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'fire', ['class'] = 'MAGE'},
		-- PALADIN
	[BS['Hammer of Wrath']]         = {['icon'] = [[Interface\Icons\Ability_ThunderClap]], 				['casttime'] = 1},
	[BS['Holy Light']]              = {['icon'] = [[Interface\Icons\Spell_holy_holybolt]], 				['casttime'] = 2.5},
	[BS['Holy Wrath']]              = {['icon'] = [[Interface\Icons\Spell_holy_weaponmastery]], 		['casttime'] = 2},
	[BS['Flash of Light']]          = {['icon'] = [[Interface\Icons\Spell_holy_flashheal]], 			['casttime'] = 1.5},
	[BS['Redemption']]              = {['icon'] = [[Interface\Icons\Spell_holy_resurrection]], 			['casttime'] = 10},
	[BS['Summon Warhorse']]         = {['icon'] = [[Interface\Icons\Spell_nature_swiftness]], 			['casttime'] = 3},
	[BS['Summon Charger']]          = {['icon'] = [[Interface\Icons\Ability_mount_charger]], 			['casttime'] = 3},
	[BS['Turn Undead']]             = {['icon'] = [[Interface\Icons\Spell_holy_turnundead]], 			['casttime'] = 1.5},

		-- PRIEST
	[BS['Flash Heal']]              = {['icon'] = [[Interface\Icons\Spell_holy_flashheal]], 			['casttime'] = 1.5},
	[BS['Greater Heal']]            = {['icon'] = [[Interface\Icons\Spell_holy_greaterheal]], 			['casttime'] = 2.5},
	[BS['Heal']]                    = {['icon'] = [[Interface\Icons\Spell_holy_heal]], 					['casttime'] = 2.5},
	[BS['Holy Fire']]               = {['icon'] = [[Interface\Icons\Spell_holy_searinglight]], 			['casttime'] = 3.5, ['type'] = 'dmg', ['school'] = 'holy', 	 ['class'] = 'PRIEST'},
	[BS['Lesser Heal']]				= {['icon'] = [[Interface\Icons\Spell_holy_lesserheal]], 			['casttime'] = 2.5},
	[BS['Mana Burn']]               = {['icon'] = [[Interface\Icons\Spell_shadow_manaburn]], 			['casttime'] = 3, 	['type'] = 'dmg', ['school'] = 'shadow', ['class'] = 'PRIEST'},
	[BS['Mind Blast']]              = {['icon'] = [[Interface\Icons\Spell_shadow_unholyfrenzy]], 		['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = 'PRIEST'},
	[BS['Mind Control']]            = {['icon'] = [[Interface\Icons\Spell_shadow_shadowworddominate]], 	['casttime'] = 3, 	['type'] = 'dmg', ['school'] = 'shadow', ['class'] = 'PRIEST'},
	[BS['Prayer of Healing']]       = {['icon'] = [[Interface\Icons\Spell_holy_prayerofhealing02]], 	['casttime'] = 3},
	[BS['Resurrection']]            = {['icon'] = [[Interface\Icons\Spell_holy_resurrection]], 			['casttime'] = 10},
	[BS['Shackle Undead']]          = {['icon'] = [[Interface\Icons\Spell_nature_slow]], 				['casttime'] = 1.5},
	[BS['Smite']]                   = {['icon'] = [[Interface\Icons\Spell_holy_holysmite]], 			['casttime'] = 2.5, ['type'] = 'dmg', ['school'] = 'holy', ['class'] = 'PRIEST'},
		-- ROGUE
	[BS['Disarm Trap']]             = {['icon'] = [[Interface\Icons\Spell_shadow_grimward]], 		['casttime'] = 5},
	[BS['Mind-numbing Poison']]     = {['icon'] = [[Interface\Icons\Spell_nature_nullifydisease]], 	['casttime'] = 3},
	[BS['Mind-numbing Poison II']]  = {['icon'] = [[Interface\Icons\Spell_nature_nullifydisease]], 	['casttime'] = 3},
	[BS['Mind-numbing Poison III']] = {['icon'] = [[Interface\Icons\Spell_nature_nullifydisease]], 	['casttime'] = 3},
	[BS['Instant Poison']]          = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
	[BS['Instant Poison II']]       = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
	[BS['Instant Poison III']]      = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
	[BS['Instant Poison IV']]       = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
	[BS['Instant Poison V']]       = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
	[BS['Instant Poison VI']]       = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
	[BS['Deadly Poison']]           = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], 		['casttime'] = 3},
	[BS['Deadly Poison II']]        = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], 		['casttime'] = 3},
	[BS['Deadly Poison III']]       = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], 		['casttime'] = 3},
	[BS['Deadly Poison IV']]        = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], 		['casttime'] = 3},
	[BS['Deadly Poison V']]         = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], 		['casttime'] = 3},
	[BS['Crippling Poison']]        = {['icon'] = [[Interface\Icons\Ability_poisonsting]], 			['casttime'] = 3},
	[BS['Pick Lock']]               = {['icon'] = [[Interface\Icons\Spell_nature_moonkey]], 		['casttime'] = 5},
		-- SHAMAN
	[BS['Ancestral Spirit']]        = {['icon'] = [[Interface\Icons\Spell_nature_regenerate]], 			['casttime'] = 10},
	[BS['Astral Recall']]           = {['icon'] = [[Interface\Icons\Spell_nature_astralrecal]], 		['casttime'] = 10},
	[BS['Chain Heal']]              = {['icon'] = [[Interface\Icons\Spell_nature_healingwavegreater]], 	['casttime'] = 2.5},
	[BS['Chain Lightning']]         = {['icon'] = [[Interface\Icons\Spell_nature_chainlightning]], 		['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'nature', ['class'] = 'SHAMAN'},
	[BS['Far Sight']]               = {['icon'] = [[Interface\Icons\Spell_nature_farsight]], 			['casttime'] = 2},
	[BS['Ghost Wolf']]              = {['icon'] = [[Interface\Icons\Spell_nature_spiritwolf]], 			['casttime'] = 3},
	[BS['Healing Wave']]            = {['icon'] = [[Interface\Icons\Spell_nature_healingwavegreater]], 	['casttime'] = 2.5},
	[BS['Lesser Healing Wave']]     = {['icon'] = [[Interface\Icons\Spell_nature_healingwavelesser]], 	['casttime'] = 1.5},
	[BS['Lightning Bolt']]          = {['icon'] = [[Interface\Icons\Spell_nature_lightning]], 			['casttime'] = 2.5, ['type'] = 'dmg', ['school'] = 'nature', ['class'] = 'SHAMAN'},
		-- WARLOCK
	[BS['Banish']]                  	= {['icon'] = [[Interface\Icons\Spell_shadow_cripple]], 		['casttime'] = 1.5},
	[BS['Create Firestone']]        	= {['icon'] = [[Interface\Icons\Inv_misc_gem_bloodstone_02]], 	['casttime'] = 3},
	[BS['Create Healthstone (Major)']]  = {['icon'] = [[Interface\Icons\Inv_stone_04]], 				['casttime'] = 3},
	[BS['Create Spellstone']]       	= {['icon'] = [[Interface\Icons\Inv_misc_gem_sapphire_01]], 	['casttime'] = 5},
	[BS['Create Soulstone (Major)']]    = {['icon'] = [[Interface\Icons\Spell_shadow_soulgem]], 		['casttime'] = 3},
	[BS['Enslave Demon']]           	= {['icon'] = [[Interface\Icons\Spell_shadow_enslavedemon]], 	['casttime'] = 3},
	[BS['Fear']]                    	= {['icon'] = [[Interface\Icons\Spell_shadow_possession]], 		['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = 'WARLOCK'},
	[BS['Howl of Terror']]          	= {['icon'] = [[Interface\Icons\Spell_shadow_deathscream]], 	['casttime'] = 2, 	['type'] = 'dmg', ['school'] = 'shadow', ['class'] = 'WARLOCK'},
	[BS['Immolate']]               	 	= {['icon'] = [[Interface\Icons\Spell_fire_immolation]], 		['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'fire', 	 ['class'] = 'WARLOCK'},
	[BS['Inferno']]                 	= {['icon'] = [[Interface\Icons\Spell_fire_incinerate]], 		['casttime'] = 2},
	[BS['Ritual of Doom']]          	= {['icon'] = [[Interface\Icons\Spell_shadow_antimagicshell]], 	['casttime'] = 10},
	[BS['Ritual of Summoning']]     	= {['icon'] = [[Interface\Icons\Spell_shadow_twilight]], 		['casttime'] = 5},
	[BS['Searing Pain']]            	= {['icon'] = [[Interface\Icons\Spell_fire_soulburn]], 			['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'fire', 	 ['class'] = 'WARLOCK'},
	[BS['Seduction']]               	= {['icon'] = [[Interface\Icons\Spell_shadow_mindsteal]], 		['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = 'WARLOCK'},
	[BS['Shadow Bolt']]            		= {['icon'] = [[Interface\Icons\Spell_shadow_shadowbolt]], 		['casttime'] = 2.5, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = 'WARLOCK'},
	[BS['Soul Fire']]               	= {['icon'] = [[Interface\Icons\Spell_fire_fireball02]], 		['casttime'] = 4, 	['type'] = 'dmg', ['school'] = 'fire', 	 ['class'] = 'WARLOCK'},
	[BS['Soulstone Resurrection']]    	= {['icon'] = [[Interface\Icons\Spell_shadow_soulgem]], 		['casttime'] = 3},
	[BS['Summon Dreadsteed']]       	= {['icon'] = [[Interface\Icons\Ability_mount_dreadsteed]], 	['casttime'] = 3},
	[BS['Summon Felhunter']]        	= {['icon'] = [[Interface\Icons\Spell_shadow_summonfelhunter]], ['casttime'] = 10},
	[BS['Summon Felsteed']]         	= {['icon'] = [[Interface\Icons\Spell_nature_swiftness]], 		['casttime'] = 3},
	[BS['Summon Imp']]              	= {['icon'] = [[Interface\Icons\Spell_shadow_summonimp]], 		['casttime'] = 10},
	[BS['Summon Succubus']]         	= {['icon'] = [[Interface\Icons\Spell_shadow_summonsuccubus]], 	['casttime'] = 10},
	[BS['Summon Voidwalker']]       	= {['icon'] = [[Interface\Icons\Spell_shadow_summonvoidwalker]],['casttime'] = 10},
		-- WARRIOR
	[BS['Slam']]               			= {['icon'] = [[Interface\Icons\ability_warrior_decisivestrike]], ['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'physical', ['class'] = 'WARRRIOR',	['immune'] = true,},
}

FOCUS_CHANNELED_HEALS_SPELLCASTS_TO_TRACK = {
	-- DRUID
	[BS['Tranquility']]           	= {['icon'] = [[Interface\Icons\Spell_nature_tranquility]], ['casttime'] = 10,  ['tick'] = 2},
	-- FIRST AID
	[BS['First Aid']]           	= {['icon'] = [[Interface\Icons\Spell_holy_heal]], 			['casttime'] = 7, 	['tick'] = 1},
	-- WARLOCK
	[BS['Health Funnel']]           = {['icon'] = [[Interface\Icons\Spell_shadow_lifedrain]], 	['casttime'] = 10, 	['tick'] = 1},
}

FOCUS_CHANNELED_SPELLCASTS_TO_TRACK = {
	-- MISC
	[BS['Gnomish Death Ray']]		= {['icon'] = [[Interface\Icons\inv_gizmo_08]], 			['casttime'] = 4},
	-- DRUID
	[BS['Hurricane']]				= {['icon'] = [[Interface\Icons\Spell_nature_cyclone]], 	['casttime'] = 9.5, 	['tick'] = 1},

	-- HUNTER
	[BS['Eagle Eye']]      			= {['icon'] = [[Interface\Icons\Ability_hunter_eagleeye]], 	['casttime'] = 60},
	[BS['Eyes of the Beast']]       = {['icon'] = [[Interface\Icons\Ability_eyeoftheowl]], 		['casttime'] = 60},

	-- MAGE
	[BS['Arcane Missile']]         	= {['icon'] = [[Interface\Icons\Spell_nature_starfall]], 	['casttime'] = 2.5,		['tick'] = 3},
	[BS['Arcane Missiles']]         = {['icon'] = [[Interface\Icons\Spell_nature_starfall]], 	['casttime'] = 4.5, 	['tick'] = 3},
	[BS['Blizzard']]                = {['icon'] = [[Interface\Icons\Spell_frost_icestorm]], 	['casttime'] = 7.5, 	['tick'] = 1},
	[BS['Evocation']]               = {['icon'] = [[Interface\Icons\Spell_nature_purge]], 		['casttime'] = 8},

	-- PRIEST
	[BS['Mind Flay']]   	       	= {['icon'] = [[Interface\Icons\Spell_shadow_siphonmana]], 	['casttime'] = 3, 		['tick'] = 1},
	[BS['Mind Vision']]            = {['icon'] = [[Interface\Icons\Spell_holy_mindvision]], 	['casttime'] = 30},

	-- WARLOCK
	[BS['Drain Life']]              = {['icon'] = [[Interface\Icons\Spell_shadow_lifedrain02]], ['casttime'] = 4.5, 	['tick'] = 1},
	[BS['Drain Mana']]              = {['icon'] = [[Interface\Icons\Spell_shadow_siphonmana]], 	['casttime'] = 4.5, 	['tick'] = 1},
	[BS['Drain Soul']]            	= {['icon'] = [[Interface\Icons\Spell_shadow_haunting]], 	['casttime'] = 14.5, 	['tick'] = 3},
	[BS['Rain of Fire']]            = {['icon'] = [[Interface\Icons\Spell_shadow_rainoffire]], 	['casttime'] = 7.5, 	['tick'] = 2},
}

FOCUS_INSTANT_SPELLCASTS_TO_TRACK = {
	-- MISC
	[BS['Shoot']]				= true,

	-- DRUID
	[BS['Moonfire']] 			= true,

	-- MAGE
	[BS['Arcane Explosion']] 	= true,
	[BS['Cone of Cold']]		= true,
	[BS['Fire Blast']]			= true,
	[BS['Frost Nova']]			= true,

	-- PALADIN
	[BS['Holy Shock']]			= true,

	-- PRIEST
	[BS['Holy Nova']] 			= true,

	-- SHAMAN
	[BS['Earth Shock']] 		= true,
	[BS['Flame Shock']]			= true,
	[BS['Frost Shock']]			= true,

	-- WARLOCK
	[BS['Shadowburn']] 			= true,
}
