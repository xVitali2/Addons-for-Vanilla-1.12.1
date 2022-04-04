local L = enemyFrames.L

SPELLINFO_TRADECASTS_TO_TRACK = {
	-- MISC
	[L['Fishing']] = {['icon'] = [[Interface\Icons\Trade_Fishing]], ['casttime'] = 30},
	-- ALCHEMY
	[L['Greater Healing Potion']] = {['icon'] = [[Interface\Icons\Inv_potion_52]], ['casttime'] = 3},
	[L['Greater Fire Protection Potion']] = {['icon'] = [[Interface\Icons\Inv_potion_24]], ['casttime'] = 3},
	[L['Mageblood Potion']] = {['icon'] = [[Interface\Icons\inv_potion_45]], ['casttime'] = 3},
	[L['Major Healing Potion']] = {['icon'] = [[Interface\Icons\Inv_potion_54]], ['casttime'] = 3},
	[L['Major Mana Potion']] = {['icon'] = [[Interface\Icons\Inv_potion_76]], ['casttime'] = 3},
	[L['Mana Potion']] = {['icon'] = [[Interface\Icons\Inv_potion_72]], ['casttime'] = 3},
	[L['Swiftness Potion']] = {['icon'] = [[Interface\Icons\Inv_potion_95]], ['casttime'] = 3},
	[L['Transmute: Arcanite']] = {['icon'] = [[Interface\Icons\Inv_misc_stonetablet_05]], ['casttime'] = 25},
	-- BLACKSMITH 
	[L['Rough Sharpening Stone']] = {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_01]], ['casttime'] = 5.125},
	[L['Rough Weightstone']] = {['icon'] = [[Interface\Icons\inv_stone_weightstone_01]], ['casttime'] = 5.125},
	[L['Coarse Sharpening Stone']] = {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_02]], ['casttime'] = 5.125},
	[L['Coarse Weightstone']] = {['icon'] = [[Interface\Icons\inv_stone_weightstone_02]], ['casttime'] = 5.125},
	[L['Heavy Sharpening Stone']] = {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_03]], ['casttime'] = 5.125},
	[L['Heavy Weightstone']] = {['icon'] = [[Interface\Icons\inv_stone_weightstone_03]], ['casttime'] = 5.125},
	[L['Solid Sharpening Stone']] = {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_04]], ['casttime'] = 5.125},
	[L['Solid Weightstone']] = {['icon'] = [[Interface\Icons\inv_stone_weightstone_04]], ['casttime'] = 5.125},
	[L['Dense Sharpening Stone']] = {['icon'] = [[Interface\Icons\inv_stone_sharpeningstone_05]], ['casttime'] = 8},
	[L['Dense Weightstone']] = {['icon'] = [[Interface\Icons\inv_stone_weightstone_05]], ['casttime'] = 8},
	-- COOKING
	[L['Smoked Sagefish']] = {['icon'] = [[Interface\Icons\Inv_misc_fish_20]], ['casttime'] = 3},
	[L['Savory Deviate Delight']] = {['icon'] = [[Interface\Icons\Inv_misc_monsterhead_04]], ['casttime'] = 3},
	[L['Thistle Tea']] = {['icon'] = [[Interface\Icons\inv_drink_milk_05]], ['casttime'] = 3},
	-- ENCHANTING
	[L['Enchant Chest - Minor Mana']] = {['icon'] = [[Interface\Icons\Ability_warstomp]], ['casttime'] = 5},
	-- ENGINEERING
	[L['Enchanted Leather']] = {['icon'] = [[Interface\Icons\inv_misc_rune_05]], ['casttime'] = 12.5},
	[L['Rough Blasting Powder']] = {['icon'] = [[Interface\Icons\inv_misc_dust_01]], ['casttime'] = 5.125},
	[L['Coarse Blasting Powder']] = {['icon'] = [[Interface\Icons\inv_misc_dust_02]], ['casttime'] = 5.125},
	[L['Heavy Blasting Powder']] = {['icon'] = [[Interface\Icons\inv_misc_dust_06]], ['casttime'] = 5.125},
	[L['Solid Blasting Powder']] = {['icon'] = [[Interface\Icons\inv_misc_powder_black]], ['casttime'] = 8},
	[L['Dense Blasting Powder']] = {['icon'] = [[Interface\Icons\inv_misc_ammo_gunpowder_01]],['casttime'] = 8},
	
	[L['Arclight Spanner']] = {['icon'] = [[Interface\Icons\inv_misc_wrench_01]], ['casttime'] = 8},
	[L['Copper Modulator']] = {['icon'] = [[Interface\Icons\inv_gizmo_03]], ['casttime'] = 5.125},
	[L['Handful of Copper Bolts']] = {['icon'] = [[Interface\Icons\inv_misc_gear_06]], ['casttime'] = 1.5}, 
	-- FIRST AID
	[L['Linen Bandage']] = {['icon'] = [[Interface\Icons\Inv_misc_bandage_15]], ['casttime'] = 3},
	[L['Heavy Linen Bandage']] = {['icon'] = [[Interface\Icons\Inv_misc_bandage_18]], ['casttime'] = 3},
	[L['Wool Bandage']] = {['icon'] = [[Interface\Icons\Inv_misc_bandage_14]], ['casttime'] = 3},
	[L['Heavy Wool Bandage']] = {['icon'] = [[Interface\Icons\Inv_misc_bandage_17]], ['casttime'] = 3},
	[L['Silk Bandage']] = {['icon'] = [[Interface\Icons\Inv_misc_bandage_01]], ['casttime'] = 3},
	[L['Heavy Silk Bandage']] = {['icon'] = [[Interface\Icons\Inv_misc_bandage_02]], ['casttime'] = 3},
	[L['Mageweave Bandage']] = {['icon'] = [[Interface\Icons\Inv_misc_bandage_19]], ['casttime'] = 3},
	[L['Heavy Mageweave Bandage']] = {['icon'] = [[Interface\Icons\Inv_misc_bandage_20]], ['casttime'] = 3},
	[L['Runecloth Bandage']] = {['icon'] = [[Interface\Icons\Inv_misc_bandage_11]], ['casttime'] = 3},
	[L['Heavy Runecloth Bandage']] = {['icon'] = [[Interface\Icons\Inv_misc_bandage_12]], ['casttime'] = 3},
	-- LEATHERWORKING
	
	[L['Skinning']] = {['icon'] = [[Interface\Icons\inv_misc_pelt_wolf_01]], ['casttime'] = 3},
	-- MINING
	[L['Smelt Copper']] = {['icon'] = [[Interface\Icons\Inv_ingot_02]], ['casttime'] = 3},
	[L['Copper Bar']] = {['icon'] = [[Interface\Icons\Inv_ingot_02]], ['casttime'] = 3},
	[L['Smelt Tin']] = {['icon'] = [[Interface\Icons\Inv_ingot_05]], ['casttime'] = 3},
	[L['Smelt Bronze']] = {['icon'] = [[Interface\Icons\Inv_ingot_02]], ['casttime'] = 3}, 
	[L['Smelt Silver']] = {['icon'] = [[Interface\Icons\Inv_ingot_01]], ['casttime'] = 3}, 
	[L['Smelt Gold']] = {['icon'] = [[Interface\Icons\Inv_ingot_03]], ['casttime'] = 3},
	[L['Smelt Iron']] = {['icon'] = [[Interface\Icons\Inv_ingot_04]], ['casttime'] = 3},
	[L['Smelt Mithril']] = {['icon'] = [[Interface\Icons\Inv_ingot_06]], ['casttime'] = 3},
	[L['Smelt Truesilver']] = {['icon'] = [[Interface\Icons\Inv_ingot_08]], ['casttime'] = 3},
	[L['Smelt Thorium']] = {['icon'] = [[Interface\Icons\Inv_ingot_07]], ['casttime'] = 3}, 
	[L['Thorium Bar']] = {['icon'] = [[Interface\Icons\Inv_ingot_07]], ['casttime'] = 3}, 
	-- TAILORING
	[L['Bolt of Linen Cloth']] = {['icon'] = [[Interface\Icons\inv_fabric_linen_02]], ['casttime'] = 3},
	[L['Bolt of Woolen Cloth']] = {['icon'] = [[Interface\Icons\inv_fabric_wool_03]], ['casttime'] = 5.125},
	[L['Bolt of Silk Cloth']] = {['icon'] = [[Interface\Icons\inv_fabric_silk_03]], ['casttime'] = 5.125},
	[L['Bolt of Mageweave']] = {['icon'] = [[Interface\Icons\inv_fabric_mageweave_03]], ['casttime'] = 8},
	[L['Bolt of Runecloth']] = {['icon'] = [[Interface\Icons\inv_fabric_purplefire_02]], ['casttime'] = 12.5},
	
}

SPELLINFO_SPELLCASTS_TO_TRACK = {
	-- MISC & MOB SPELLS
	[L['Acid Spit']] = {['icon'] = [[Interface\Icons\spell_nature_acid_01]], ['casttime'] = 3},
	[L['Bomb']] = {['icon'] = [[Interface\Icons\spell_fire_selfdestruct]], ['casttime'] = 2},
	[L['Banshee Curse']] = {['icon'] = [[Interface\Icons\spell_nature_drowsy]], ['casttime'] = 2},
	[L['Black Sludge']] = {['icon'] = [[Interface\Icons\spell_shadow_callofbone]], ['casttime'] = 3},
	[L['Boulder']] = {['icon'] = [[Interface\Icons\inv_stone_10]], ['casttime'] = 2},
	[L['Chained Bolt']] = {['icon'] = [[Interface\Icons\spell_nature_chainlightning]], ['casttime'] = 1.8},
	[L['Chains of Ice']] = {['icon'] = [[Interface\Icons\spell_frost_chainsofice]], ['casttime'] = 1.5},
	[L['Clone']] = {['icon'] = [[Interface\Icons\spell_shadow_blackplague]], ['casttime'] = 2.5},
	[L['Creeping Mold']] = {['icon'] = [[Interface\Icons\spell_shadow_creepingplague]], ['casttime'] = 3},
	[L['Cripple']] = {['icon'] = [[Interface\Icons\spell_shadow_cripple]], ['casttime'] = 3},
	[L['Crystal Flash']] = {['icon'] = [[Interface\Icons\spell_shadow_teleport]], ['casttime'] = 2, ['immune'] = true,},
	[L['Crystal Gaze']] = {['icon'] = [[Interface\Icons\ability_golemthunderclap]], ['casttime'] = 2, ['immune'] = true,},
	[L['Crystalline Slumber']] = {['icon'] = [[Interface\Icons\spell_nature_sleep]], ['casttime'] = 2, ['immune'] = true,},
	[L['Cultivate Packet of Seeds']] = {['icon'] = [[Interface\Icons\inv_misc_food_45]], ['casttime'] = 10},
	[L['Curse of Mending']] = {['icon'] = [[Interface\Icons\spell_shadow_antishadow]], ['casttime'] = 1},
	[L['Curse of the Deadwood']] = {['icon'] = [[Interface\Icons\spell_shadow_gathershadows]], ['casttime'] = 2},
	[L['Curse of the Fallen Magram']] = {['icon'] = [[Interface\Icons\spell_shadow_unholyfrenzy]], ['casttime'] = 2},
	[L['Dark Sludge']] = {['icon'] = [[Interface\Icons\spell_shadow_creepingplague]], ['casttime'] = 5},
	[L['Decayed Strength']] = {['icon'] = [[Interface\Icons\spell_holy_harmundeadaura]], ['casttime'] = 2},
	[L['Dire Growl']] = {['icon'] = [[Interface\Icons\ability_racial_cannibalize]], ['casttime'] = 1, ['immune'] = true,},
	[L['Fevered Fatigue']] = {['icon'] = [[Interface\Icons\spell_nature_nullifydisease]], ['casttime'] = 3,},
	[L['Fire Shield II']] = {['icon'] = [[Interface\Icons\spell_fire_immolation]], ['casttime'] = 1,},
	[L['Flame Spike']] = {['icon'] = [[Interface\Icons\spell_fire_flamebolt]], ['casttime'] = 3,},
	[L['Flamespit']] = {['icon'] = [[Interface\Icons\spell_fire_selfdestruct]], ['casttime'] = 3,}, 
	[L['Freeze Solid']] = {['icon'] = [[Interface\Icons\spell_frost_glacier]], ['casttime'] = 2.5},
	[L['Furbolg Form']] = {['icon'] = [[Interface\Icons\Inv_misc_monsterclaw_04]], ['casttime'] = 2, ['immune'] = true,},
	[L['Diseased Slime']] = {['icon'] = [[Interface\Icons\spell_shadow_creepingplague]], ['casttime'] = 2, ['immune'] = true,},
	[L['Disenchant']] = {['icon'] = [[Interface\Icons\Inv_Enchant_Disenchant]], ['casttime'] = 3},
	[L['Drink Minor Potion']] = {['icon'] = [[Interface\Icons\Spell_holy_heal]], ['casttime'] = 3},
	[L['Dynamite']] = {['icon'] = [[Interface\Icons\spell_fire_selfdestruct]], ['casttime'] = 1},
	[L['Earthgrab Totem']] = {['icon'] = [[Interface\Icons\spell_nature_naturetouchdecay]], ['casttime'] = .5}, 
	[L['Exploding Shot']] = {['icon'] = [[Interface\Icons\spell_fire_fireball02]], ['casttime'] = 1},
	[L['Icicle']] = {['icon'] = [[Interface\Icons\spell_frost_frostbolt02]], ['casttime'] = 1.5},
	[L['Ink Spray']] = {['icon'] = [[Interface\Icons\spell_nature_sleep]], ['casttime'] = 1, ['immune'] = true,},
	[L['Healing Ward']] = {['icon'] = [[Interface\Icons\spell_holy_layonhands]], ['casttime'] = 2},
	[L['Holy Smite']] = {['icon'] = [[Interface\Icons\Spell_holy_holysmite]], ['casttime'] = 2.5},
	[L['Lizard Bolt']] = {['icon'] = [[Interface\Icons\spell_nature_lightning]], ['casttime'] = 2},
	[L['Plague Cloud']] = {['icon'] = [[Interface\Icons\spell_shadow_callofbone]], ['casttime'] = 2,},
	[L['Plague Mind']] = {['icon'] = [[Interface\Icons\spell_shadow_callofbone]], ['casttime'] = 4},
	[L['Poisoned Shot']] = {['icon'] = [[Interface\Icons\ability_poisons]], ['casttime'] = 2,},
	[L['Quick Flame Ward']] = {['icon'] = [[Interface\Icons\spell_fire_sealoffire]], ['casttime'] = 1.5,},
	[L['Shrink']] = {['icon'] = [[Interface\Icons\spell_shadow_antishadow]], ['casttime'] = 3,},
	[L['Silithid Pox']] = {['icon'] = [[Interface\Icons\spell_nature_nullifydisease]], ['casttime'] = 2,},
	[L['Slowing Poison']] = {['icon'] = [[Interface\Icons\spell_nature_slowpoison]], ['casttime'] = 1,},
	[L['Toxic Spit']] = {['icon'] = [[Interface\Icons\spell_nature_corrosivebreath]], ['casttime'] = 2.5,},
	[L['Trelane\'s Freezing Touch']] = {['icon'] = [[Interface\Icons\spell_shadow_unsummonbuilding]], ['casttime'] = 3,},
	[L['Wandering Plague']] = {['icon'] = [[Interface\Icons\spell_shadow_callofbone]], ['casttime'] = 2},
	[L['Weak Frostbolt']] = {['icon'] = [[Interface\Icons\spell_frost_frostbolt02]], ['casttime'] = 2.2},
	[L['Wither Touch']] = {['icon'] = [[Interface\Icons\spell_nature_drowsy]], ['casttime'] = 2},
	-- AHN'QIRAJ
	[L['Explode']] = {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], ['casttime'] = 6},
	-- BLACKWING LAIR
	[L['Shadow Flame']] = {['icon'] = [[Interface\Icons\Spell_fire_incinerate]], ['casttime'] = 2},
	[L['Wing Buffet']] = {['icon'] = [[Interface\Icons\Inv_misc_monsterscales_14]], ['casttime'] = 1},
	[L['Bellowing Roar']] = {['icon'] = [[Interface\Icons\Spell_fire_fire]], ['casttime'] = 1.75},
	-- BLACKROCK SPIRE
	[L['Flame Buffet']] = {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], ['casttime'] = 6},
	-- ONYXIA
	[L['Breath']] = {['icon'] = [[Interface\Icons\Spell_fire_fire]], ['casttime'] = 8},
	-- MOLTEN CORE
	[L['Dark Mending']] = {['icon'] = [[Interface\Icons\Spell_shadow_chilltouch]], ['casttime'] = 2},
	[L['Dominate Mind']] = {['icon'] = [[Interface\Icons\Spell_shadow_shadowworddominate]], ['casttime'] = 2},
	[L['Elemental Fire']] = {['icon'] = [[Interface\Icons\Spell_fire_fireball02]], ['casttime'] = .5},
	[L['Magma Blast']] = {['icon'] = [[Interface\Icons\Spell_fire_fireblast]], ['casttime'] = 1},
	[L['Summon Ragnaros']] = {['icon'] = [[Interface\Icons\Spell_fire_lavaspawn]], ['casttime'] = 10},
	-- DIRE MAIL
	[L['Arcane Bolt']] = {['icon'] = [[Interface\Icons\Spell_arcane_starfire]], ['casttime'] = 1},
	-- STRATHOLME
	[L['Banshee Wail']] = {['icon'] = [[Interface\Icons\Spell_shadow_shadowbolt]], ['casttime'] = 1.5},
	[L['Venom Spit']] = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 2.5},
	
	-- GLOBAL
	[L['Dark Mending']] = {['icon'] = [[Interface\Icons\Spell_shadow_chilltouch]], ['casttime'] = 2},
	[L['Escape Artist']] = {['icon'] = [[Interface\Icons\ability_rogue_trip]], ['casttime'] = .5},
	[L['Hearthstone']] = {['icon'] = [[Interface\Icons\INV_Misc_Rune_01]], ['casttime'] = 10},
	[L['Magic Dust']] = {['icon'] = [[Interface\Icons\Inv_misc_dust_02]], ['casttime'] = 1.5},
	[L['Reckless Charge']] = {['icon'] = [[Interface\Icons\Spell_nature_astralrecal]], ['casttime'] = .1},
	[L['Sleep']] = {['icon'] = [[Interface\Icons\Spell_nature_sleep]], ['casttime'] = 1.5},
	[L['War Stomp']] = {['icon'] = [[Interface\Icons\Ability_warstomp]], ['casttime'] = .5},
	
	-- ENGINEERING
	[L['Rough Copper Bomb']] = {['icon'] = [[Interface\Icons\Inv_misc_bomb_09]], ['casttime'] = 1},
	[L['Large Copper Bomb']] = {['icon'] = [[Interface\Icons\Inv_misc_bomb_01]], ['casttime'] = 1},
	[L['Small Bronze Bomb']] = {['icon'] = [[Interface\Icons\Inv_misc_bomb_09]], ['casttime'] = 1},
	[L['Big Bronze Bomb']] = {['icon'] = [[Interface\Icons\Inv_misc_bomb_05]], ['casttime'] = 1},
	[L['Iron Grenade']] = {['icon'] = [[Interface\Icons\Inv_misc_bomb_08]], ['casttime'] = 1},
	[L['Big Iron Bomb']] = {['icon'] = [[Interface\Icons\Inv_misc_bomb_01]], ['casttime'] = 1},
	[L['Mithril Frag Bomb']] = {['icon'] = [[Interface\Icons\Inv_misc_bomb_02]], ['casttime'] = 1},
	[L['Hi-Explosive Bomb']] = {['icon'] = [[Interface\Icons\Inv_misc_bomb_07]], ['casttime'] = 1},
	[L['Thorium Grenade']] = {['icon'] = [[Interface\Icons\Inv_misc_bomb_08]], ['casttime'] = 1},
	[L['Dark Iron Bomb']] = {['icon'] = [[Interface\Icons\Inv_misc_bomb_05]], ['casttime'] = 1},
	[L['Arcane Bomb']] = {['icon'] = [[Interface\Icons\Spell_shadow_mindbomb]], ['casttime'] = 1},
	[L['Ultrasafe Transporter: Gadgetzan']] = {['icon'] = [[Interface\Icons\Inv_misc_enggizmos_12]], ['casttime'] = 10},
	[L['Dimensional Ripper - Everlook']] = {['icon'] = [[Interface\Icons\Inv_misc_enggizmos_15]], ['casttime'] = 10},
	
	-- DRUID
	[L['Entangling Roots']] = {['icon'] = [[Interface\Icons\Spell_nature_stranglevines]], ['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'nature', ['class'] = 'DRUID'},
	[L['Healing Touch']] = {['icon'] = [[Interface\Icons\Spell_nature_healingtouch]], ['casttime'] = 3, ['class'] = 'DRUID'},
	[L['Hibernate']] = {['icon'] = [[Interface\Icons\Spell_nature_sleep]], ['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'nature', ['class'] = 'DRUID'},
	[L['Rebirth']] = {['icon'] = [[Interface\Icons\Spell_nature_reincarnation]], ['casttime'] = 2, ['class'] = 'DRUID'},
	[L['Regrowth']] = {['icon'] = [[Interface\Icons\Spell_nature_resistnature]], ['casttime'] = 2, ['class'] = 'DRUID'},
	[L['Soothe Animal']] = {['icon'] = [[Interface\Icons\Ability_hunter_beastsoothe]], ['casttime'] = 1.5, ['class'] = 'DRUID'},
	[L['Starfire']] = {['icon'] = [[Interface\Icons\Spell_arcane_starfire]], ['casttime'] = 3, ['type'] = 'dmg', ['school'] = 'nature', ['class'] = 'DRUID'},
	[L['Teleport: Moonglade']] = {['icon'] = [[Interface\Icons\Spell_arcane_teleportmoonglade]], ['casttime'] = 10, ['class'] = 'DRUID'},
	[L['Wrath']] = {['icon'] = [[Interface\Icons\Spell_nature_abolishmagic]], ['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'nature', ['class'] = 'DRUID'},
	-- HUNTER
	[L['Aimed Shot']] = {['icon'] = [[Interface\Icons\Inv_spear_07]], ['casttime'] = 2.5, ['type'] = 'dmg', ['school'] = 'physical', ['class'] = 'HUNTER', ['immune'] = true,},
	[L['Dismiss Pet']] = {['icon'] = [[Interface\Icons\Spell_nature_spiritwolf]], ['casttime'] = 5},
	[L['Eyes of the Beast']] = {['icon'] = [[Interface\Icons\Ability_eyeoftheowl]], ['casttime'] = 2},
	[L['Multi-Shot']] = {['icon'] = [[Interface\Icons\ability_upgrademoonglaive]], ['casttime'] = 0.5, ['type'] = 'dmg', ['school'] = 'physical', ['class'] = 'HUNTER', ['immune'] = true,},
	[L['Revive Pet']] = {['icon'] = [[Interface\Icons\Ability_hunter_beastsoothe]], ['casttime'] = 10},
	[L['Scare Beast']] = {['icon'] = [[Interface\Icons\Ability_druid_cower]], ['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'physical', ['class'] = 'HUNTER'},
	-- MAGE
	-- [L['Arcane Missile']] = {[[Interface\Icons\Spell_nature_starfall]], 3},
	-- [L['Arcane Missiles']] = {[[Interface\Icons\Spell_nature_starfall]], 5},
	-- [L['Blizzard']] = {[[Interface\Icons\Spell_frost_icestorm]], 8},
	[L['Conjure Food']] = {['icon'] = [[Interface\Icons\Inv_misc_food_73cinnamonroll]], ['casttime'] = 3, ['class'] = 'MAGE'},
	[L['Conjure Water']] = {['icon'] = [[Interface\Icons\Inv_drink_18]], ['casttime'] = 3, ['class'] = 'MAGE'},
	[L['Conjure Mana Agate']] = {['icon'] = [[Interface\Icons\Inv_misc_gem_emerald_01]], ['casttime'] = 3, ['class'] = 'MAGE'},
	[L['Conjure Mana Citrine']] = {['icon'] = [[Interface\Icons\Inv_misc_gem_opal_01]], ['casttime'] = 3, ['class'] = 'MAGE'},
	[L['Conjure Mana Jade']] = {['icon'] = [[Interface\Icons\Inv_misc_gem_emerald_02]], ['casttime'] = 3, ['class'] = 'MAGE'},
	[L['Conjure Mana Ruby']] = {['icon'] = [[Interface\Icons\Inv_misc_gem_ruby_01]], ['casttime'] = 3, ['class'] = 'MAGE'},
	-- [L['Evocation']] = {[[Interf ace\Icons\Spell_nature_purge]], 8},
	[L['Fireball']] = {['icon'] = [[Interface\Icons\Spell_fire_flamebolt]], ['casttime'] = 2.5, ['class'] = 'MAGE', ['type'] = 'dmg', ['school'] = 'fire', },
	[L['Frostbolt']] = {['icon'] = [[Interface\Icons\Spell_frost_frostbolt02]], ['casttime'] = 2.5, ['class'] = 'MAGE', ['type'] = 'dmg', ['school'] = 'frost'},
	[L['Flamestrike']] = {['icon'] = [[Interface\Icons\Spell_fire_selfdestruct]], ['casttime'] = 3, ['class'] = 'MAGE'},
	[L['Polymorph']] = {['icon'] = [[Interface\Icons\Spell_nature_polymorph]], ['casttime'] = 1.5, ['class'] = 'MAGE', ['type'] = 'dmg', ['school'] = 'arcane',},
	[L['Polymorph: Pig']] = {['icon'] = [[Interface\Icons\Spell_magic_polymorphpig]], ['casttime'] = 1.5, ['class'] = 'MAGE', ['type'] = 'dmg', ['school'] = 'arcane',},
	[L['Polymorph: Turtle']] = {['icon'] = [[Interface\Icons\Ability_hunter_pet_turtle]], ['casttime'] = 1.5, ['class'] = 'MAGE', ['type'] = 'dmg', ['school'] = 'arcane',},
	[L['Portal: Darnassus']] = {['icon'] = [[Interface\Icons\Spell_arcane_portaldarnassus]], ['casttime'] = 10},
	[L['Portal: Thunder Bluff']] = {['icon'] = [[Interface\Icons\Spell_arcane_portalthunderbluff]], ['casttime'] = 10},
	[L['Portal: Ironforge']] = {['icon'] = [[Interface\Icons\Spell_arcane_portalironforge]], ['casttime'] = 10},
	[L['Portal: Orgrimmar']] = {['icon'] = [[Interface\Icons\Spell_arcane_portalorgrimmar]], ['casttime'] = 10},
	[L['Portal: Stormwind']] = {['icon'] = [[Interface\Icons\Spell_arcane_portalstormwind]], ['casttime'] = 10},
	[L['Portal: Undercity']] = {['icon'] = [[Interface\Icons\Spell_arcane_portalundercity]], ['casttime'] = 10},
	[L['Teleport: Darnassus']] = {['icon'] = [[Interface\Icons\Spell_arcane_teleportdarnassus]], ['casttime'] = 10},
	[L['Teleport: Thunder Bluff']] = {['icon'] = [[Interface\Icons\Spell_arcane_teleportthunderbluff]],['casttime'] = 10},
	[L['Teleport: Ironforge']] = {['icon'] = [[Interface\Icons\Spell_arcane_portalironforge]], ['casttime'] = 10},
	[L['Teleport: Orgrimmar']] = {['icon'] = [[Interface\Icons\Spell_arcane_teleportorgrimmar]], ['casttime'] = 10},
	[L['Teleport: Stormwind']] = {['icon'] = [[Interface\Icons\Spell_arcane_teleportstormwind]], ['casttime'] = 10},
	[L['Teleport: Undercity']] = {['icon'] = [[Interface\Icons\Spell_arcane_teleportundercity]], ['casttime'] = 10},
	[L['Pyroblast']] = {['icon'] = [[Interface\Icons\Spell_fire_fireball02]], ['casttime'] = 6, ['type'] = 'dmg', ['school'] = 'fire', ['class'] = 'MAGE'},
	[L['Scorch']] = {['icon'] = [[Interface\Icons\Spell_fire_soulburn]], ['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'fire', ['class'] = 'MAGE'},
	-- PALADIN
	[L['Hammer of Wrath']] = {['icon'] = [[Interface\Icons\Ability_ThunderClap]], ['casttime'] = 1},
	[L['Holy Light']] = {['icon'] = [[Interface\Icons\Spell_holy_holybolt]], ['casttime'] = 2.5},
	[L['Holy Wrath']] = {['icon'] = [[Interface\Icons\Spell_holy_weaponmastery]], ['casttime'] = 2},
	[L['Flash of Light']] = {['icon'] = [[Interface\Icons\Spell_holy_flashheal]], ['casttime'] = 1.5},
	[L['Redemption']] = {['icon'] = [[Interface\Icons\Spell_holy_resurrection]], ['casttime'] = 10},
	[L['Summon Warhorse']] = {['icon'] = [[Interface\Icons\Spell_nature_swiftness]], ['casttime'] = 3},
	[L['Summon Charger']] = {['icon'] = [[Interface\Icons\Ability_mount_charger]], ['casttime'] = 3},
	[L['Turn Undead']] = {['icon'] = [[Interface\Icons\Spell_holy_turnundead]], ['casttime'] = 1.5},
	
	-- PRIEST
	[L['Flash Heal']] = {['icon'] = [[Interface\Icons\Spell_holy_flashheal]], ['casttime'] = 1.5},
	[L['Greater Heal']] = {['icon'] = [[Interface\Icons\Spell_holy_greaterheal]], ['casttime'] = 2.5},
	[L['Heal']] = {['icon'] = [[Interface\Icons\Spell_holy_heal]], ['casttime'] = 2.5},
	[L['Holy Fire']] = {['icon'] = [[Interface\Icons\Spell_holy_searinglight]], ['casttime'] = 3.5, ['type'] = 'dmg', ['school'] = 'holy', ['class'] = 'PRIEST'},
	[L['Lesser Heal']] = {['icon'] = [[Interface\Icons\Spell_holy_lesserheal]], ['casttime'] = 1.5},
	[L['Mana Burn']] = {['icon'] = [[Interface\Icons\Spell_shadow_manaburn]], ['casttime'] = 3, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = 'PRIEST'},
	[L['Mind Blast']] = {['icon'] = [[Interface\Icons\Spell_shadow_unholyfrenzy]], ['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = 'PRIEST'},
	[L['Mind Control']] = {['icon'] = [[Interface\Icons\Spell_shadow_shadowworddominate]], ['casttime'] = 3, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = 'PRIEST'},
	[L['Prayer of Healing']] = {['icon'] = [[Interface\Icons\Spell_holy_prayerofhealing02]], ['casttime'] = 3},
	[L['Resurrection']] = {['icon'] = [[Interface\Icons\Spell_holy_resurrection]], ['casttime'] = 10},
	[L['Shackle Undead']] = {['icon'] = [[Interface\Icons\Spell_nature_slow]], ['casttime'] = 1.5},
	[L['Smite']] = {['icon'] = [[Interface\Icons\Spell_holy_holysmite]], ['casttime'] = 2.5, ['type'] = 'dmg', ['school'] = 'holy', ['class'] = 'PRIEST'},
	-- ROGUE
	[L['Disarm Trap']] = {['icon'] = [[Interface\Icons\Spell_shadow_grimward]], ['casttime'] = 5},
	[L['Mind-numbing Poison']] = {['icon'] = [[Interface\Icons\Spell_nature_nullifydisease]], ['casttime'] = 3},
	[L['Mind-numbing Poison II']] = {['icon'] = [[Interface\Icons\Spell_nature_nullifydisease]], ['casttime'] = 3},
	[L['Mind-numbing Poison III']] = {['icon'] = [[Interface\Icons\Spell_nature_nullifydisease]], ['casttime'] = 3},
	[L['Instant Poison']] = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
	[L['Instant Poison II']] = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
	[L['Instant Poison III']] = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
	[L['Instant Poison IV']] = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
	[L['Instant Poison V']] = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
	[L['Instant Poison VI']] = {['icon'] = [[Interface\Icons\Spell_nature_corrosivebreath]], ['casttime'] = 3},
	[L['Deadly Poison']] = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], ['casttime'] = 3},
	[L['Deadly Poison II']] = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], ['casttime'] = 3},
	[L['Deadly Poison III']] = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], ['casttime'] = 3},
	[L['Deadly Poison IV']] = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], ['casttime'] = 3},
	[L['Deadly Poison V']] = {['icon'] = [[Interface\Icons\Ability_rogue_dualweild]], ['casttime'] = 3},
	[L['Crippling Poison']] = {['icon'] = [[Interface\Icons\Ability_poisonsting]], ['casttime'] = 3},
	[L['Pick Lock']] = {['icon'] = [[Interface\Icons\Spell_nature_moonkey]], ['casttime'] = 5},
	-- SHAMAN
	[L['Ancestral Spirit']] = {['icon'] = [[Interface\Icons\Spell_nature_regenerate]], ['casttime'] = 10},
	[L['Astral Recall']] = {['icon'] = [[Interface\Icons\Spell_nature_astralrecal]], ['casttime'] = 10},
	[L['Chain Heal']] = {['icon'] = [[Interface\Icons\Spell_nature_healingwavegreater]], ['casttime'] = 2.5},
	[L['Chain Lightning']] = {['icon'] = [[Interface\Icons\Spell_nature_chainlightning]], ['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'nature', ['class'] = 'SHAMAN'},
	[L['Far Sight']] = {['icon'] = [[Interface\Icons\Spell_nature_farsight]], ['casttime'] = 2},
	[L['Ghost Wolf']] = {['icon'] = [[Interface\Icons\Spell_nature_spiritwolf]], ['casttime'] = 3},
	[L['Healing Wave']] = {['icon'] = [[Interface\Icons\Spell_nature_healingwavegreater]], ['casttime'] = 2.5},
	[L['Lesser Healing Wave']] = {['icon'] = [[Interface\Icons\Spell_nature_healingwavelesser]], ['casttime'] = 1.5},
	[L['Lightning Bolt']] = {['icon'] = [[Interface\Icons\Spell_nature_lightning]], ['casttime'] = 2.5, ['type'] = 'dmg', ['school'] = 'nature', ['class'] = 'SHAMAN'},
	-- WARLOCK
	[L['Banish']] = {['icon'] = [[Interface\Icons\Spell_shadow_cripple]], ['casttime'] = 1.5},
	[L['Create Firestone']] = {['icon'] = [[Interface\Icons\Inv_misc_gem_bloodstone_02]], ['casttime'] = 3},
	[L['Create Healthstone (Major)']] = {['icon'] = [[Interface\Icons\Inv_stone_04]], ['casttime'] = 3},
	[L['Create Spellstone']] = {['icon'] = [[Interface\Icons\Inv_misc_gem_sapphire_01]], ['casttime'] = 5},
	[L['Create Soulstone (Major)']] = {['icon'] = [[Interface\Icons\Spell_shadow_soulgem]], ['casttime'] = 3},
	[L['Enslave Demon']] = {['icon'] = [[Interface\Icons\Spell_shadow_enslavedemon]], ['casttime'] = 3},
	[L['Fear']] = {['icon'] = [[Interface\Icons\Spell_shadow_possession]], ['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = 'WARLOCK'},
	[L['Howl of Terror']] = {['icon'] = [[Interface\Icons\Spell_shadow_deathscream]], ['casttime'] = 2, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = 'WARLOCK'},
	[L['Immolate']] = {['icon'] = [[Interface\Icons\Spell_fire_immolation]], ['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'fire', ['class'] = 'WARLOCK'},
	[L['Inferno']] = {['icon'] = [[Interface\Icons\Spell_fire_incinerate]], ['casttime'] = 2},
	[L['Ritual of Doom']] = {['icon'] = [[Interface\Icons\Spell_shadow_antimagicshell]], ['casttime'] = 10},
	[L['Ritual of Summoning']] = {['icon'] = [[Interface\Icons\Spell_shadow_twilight]], ['casttime'] = 5},
	[L['Searing Pain']] = {['icon'] = [[Interface\Icons\Spell_fire_soulburn]], ['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'fire', ['class'] = 'WARLOCK'},
	[L['Seduction']] = {['icon'] = [[Interface\Icons\Spell_shadow_mindsteal]], ['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = 'WARLOCK'},
	[L['Shadow Bolt']] = {['icon'] = [[Interface\Icons\Spell_shadow_shadowbolt]], ['casttime'] = 2.5, ['type'] = 'dmg', ['school'] = 'shadow', ['class'] = 'WARLOCK'},
	[L['Soul Fire']] = {['icon'] = [[Interface\Icons\Spell_fire_fireball02]], ['casttime'] = 4, ['type'] = 'dmg', ['school'] = 'fire', ['class'] = 'WARLOCK'},
	[L['Soulstone Resurrection']] = {['icon'] = [[Interface\Icons\Spell_shadow_soulgem]], ['casttime'] = 3},
	[L['Summon Dreadsteed']] = {['icon'] = [[Interface\Icons\Ability_mount_dreadsteed]], ['casttime'] = 3},
	[L['Eye of Kilrogg']] = {['icon'] = [[Interface\Icons\Spell_shadow_evileye]], ['casttime'] = 5},
	[L['Summon Felhunter']] = {['icon'] = [[Interface\Icons\Spell_shadow_summonfelhunter]], ['casttime'] = 10},
	[L['Summon Felsteed']] = {['icon'] = [[Interface\Icons\Spell_nature_swiftness]], ['casttime'] = 3},
	[L['Summon Imp']] = {['icon'] = [[Interface\Icons\Spell_shadow_summonimp]], ['casttime'] = 10},
	[L['Summon Succubus']] = {['icon'] = [[Interface\Icons\Spell_shadow_summonsuccubus]], ['casttime'] = 10},
	[L['Summon Voidwalker']] = {['icon'] = [[Interface\Icons\Spell_shadow_summonvoidwalker]],['casttime'] = 10},
	-- WARRIOR
	[L['Slam']] = {['icon'] = [[Interface\Icons\ability_warrior_decisivestrike]], ['casttime'] = 1.5, ['type'] = 'dmg', ['school'] = 'physical', ['class'] = 'WARRRIOR', ['immune'] = true,},
	
}

SPELLINFO_CHANNELED_HEALS_SPELLCASTS_TO_TRACK = {
	-- DRUID
	[L['Tranquility']] = {['icon'] = [[Interface\Icons\Spell_nature_tranquility]], ['casttime'] = 10, ['tick'] = 2},
	-- FIRST AID
	[L['First Aid']] = {['icon'] = [[Interface\Icons\Spell_holy_heal]], ['casttime'] = 7, ['tick'] = 1},
	-- HUNTER
	[L['Mend Pet']] = {['icon'] = [[Interface\Icons\Ability_hunter_mendpet]], ['casttime'] = 5, ['tick'] = 1},
	-- WARLOCK
	[L['Health Funnel']] = {['icon'] = [[Interface\Icons\Spell_shadow_lifedrain]], ['casttime'] = 10, ['tick'] = 1}, 
}

SPELLINFO_CHANNELED_SPELLCASTS_TO_TRACK = {
	-- MISC
	[L['Cannibalize']] = {['icon'] = [[Interface\Icons\Ability_racial_cannibalize]],['casttime'] = 10},
	[L['Gnomish Death Ray']] = {['icon'] = [[Interface\Icons\inv_gizmo_08]], ['casttime'] = 4},
	-- DRUID
	[L['Hurricane']] = {['icon'] = [[Interface\Icons\Spell_nature_cyclone]], ['casttime'] = 9.5, ['tick'] = 1},
	
	-- HUNTER
	[L['Eagle Eye']] = {['icon'] = [[Interface\Icons\Ability_hunter_eagleeye]], ['casttime'] = 60},
	[L['Eyes of the Beast']] = {['icon'] = [[Interface\Icons\Ability_eyeoftheowl]], ['casttime'] = 60}, 
	
	-- MAGE
	[L['Arcane Missile']] = {['icon'] = [[Interface\Icons\Spell_nature_starfall]], ['casttime'] = 2.5},
	[L['Arcane Missiles']] = {['icon'] = [[Interface\Icons\Spell_nature_starfall]], ['casttime'] = 4.5},
	[L['Blizzard']] = {['icon'] = [[Interface\Icons\Spell_frost_icestorm]], ['casttime'] = 7.5, ['tick'] = 1},
	[L['Evocation']] = {['icon'] = [[Interface\Icons\Spell_nature_purge]], ['casttime'] = 8},
	
	-- PRIEST
	[L['Mind Flay']] = {['icon'] = [[Interface\Icons\Spell_shadow_siphonmana]], ['casttime'] = 3, ['tick'] = 1},
	[L['Mind Vision']] = {['icon'] = [[Interface\Icons\Spell_holy_mindvision]], ['casttime'] = 30},
	
	-- WARLOCK
	[L['Drain Life']] = {['icon'] = [[Interface\Icons\Spell_shadow_lifedrain02]], ['casttime'] = 4.5, ['tick'] = 1},
	[L['Drain Mana']] = {['icon'] = [[Interface\Icons\Spell_shadow_siphonmana]], ['casttime'] = 4.5, ['tick'] = 1},
	[L['Drain Soul']] = {['icon'] = [[Interface\Icons\Spell_shadow_haunting]], ['casttime'] = 14.5, ['tick'] = 3},
	[L['Rain of Fire']] = {['icon'] = [[Interface\Icons\Spell_shadow_rainoffire]], ['casttime'] = 7.5, ['tick'] = 2}, 
	
}

SPELLINFO_INSTANT_SPELLCASTS_TO_TRACK = {
	-- MISC
	[L['Shoot']] = true,
	
	-- DRUID
	[L['Moonfire']] = true,
	
	-- MAGE
	[L['Arcane Explosion']] = true,
	[L['Cone of Cold']] = true,
	[L['Fire Blast']] = true,
	[L['Frost Nova']] = true,
	
	-- PALADIN
	[L['Holy Shock']] = true, 
	
	-- PRIEST
	[L['Holy Nova']] = true,
	
	-- SHAMAN
	[L['Earth Shock']] = true,
	[L['Flame Shock']] = true,
	[L['Frost Shock']] = true,
	
	-- WARLOCK
	[L['Shadowburn']] = true,
}
--