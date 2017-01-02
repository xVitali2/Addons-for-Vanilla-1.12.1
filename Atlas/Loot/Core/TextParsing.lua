local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");

--------------------------------------------------------------------------------
-- Text replacement function
--------------------------------------------------------------------------------
function AtlasLoot_FixText(text)
    --Armour class
    text = gsub(text, "#a1#", AL["Cloth"]);
    text = gsub(text, "#a2#", AL["Leather"]);
    text = gsub(text, "#a3#", AL["Mail"]);
    text = gsub(text, "#a4#", AL["Plate"]);

    --Body slot
    text = gsub(text, "#s1#", AL["Head"]);
    text = gsub(text, "#s2#", AL["Neck"]);
    text = gsub(text, "#s3#", AL["Shoulder"]);
    text = gsub(text, "#s4#", AL["Back"]);
    text = gsub(text, "#s5#", AL["Chest"]);
    text = gsub(text, "#s6#", AL["Shirt"]);
    text = gsub(text, "#s7#", AL["Tabard"]);
    text = gsub(text, "#s8#", AL["Wrist"]);
    text = gsub(text, "#s9#", AL["Hands"]);
    text = gsub(text, "#s10#", AL["Waist"]);
    text = gsub(text, "#s11#", AL["Legs"]);
    text = gsub(text, "#s12#", AL["Feet"]);
    text = gsub(text, "#s13#", AL["Ring"]);
    text = gsub(text, "#s14#", AL["Trinket"]);
    text = gsub(text, "#s15#", AL["Held In Off-hand"]);
    text = gsub(text, "#s16#", AL["Relic"]);

    --Weapon Weilding
    text = gsub(text, "#h1#", AL["One-Hand"]);
    text = gsub(text, "#h2#", AL["Two-Hand"]);
    text = gsub(text, "#h3#", AL["Main Hand"]);
    text = gsub(text, "#h4#", AL["Off Hand"]);

    --Weapon type
    text = gsub(text, "#w1#", AL["Axe"]);
    text = gsub(text, "#w2#", AL["Bow"]);
    text = gsub(text, "#w3#", AL["Crossbow"]);
    text = gsub(text, "#w4#", AL["Dagger"]);
    text = gsub(text, "#w5#", AL["Gun"]);
    text = gsub(text, "#w6#", AL["Mace"]);
    text = gsub(text, "#w7#", AL["Polearm"]);
    text = gsub(text, "#w8#", AL["Shield"]);
    text = gsub(text, "#w9#", AL["Staff"]);
    text = gsub(text, "#w10#", AL["Sword"]);
    text = gsub(text, "#w11#", AL["Thrown"]);
    text = gsub(text, "#w12#", AL["Wand"]);
    text = gsub(text, "#w13#", AL["Fist Weapon"]);
    text = gsub(text, "#w14#", AL["Fishing Pole"]);

    -- Misc. Equipment
    text = gsub(text, "#e1#", AL["Potion"]);
    text = gsub(text, "#e2#", AL["Food"]);
    text = gsub(text, "#e3#", AL["Drink"]);
    text = gsub(text, "#e4#", AL["Bandage"]);
    text = gsub(text, "#e5#", AL["Arrow"]);
    text = gsub(text, "#e6#", AL["Bullet"]);
    text = gsub(text, "#e7#", AL["Mount"]);
    text = gsub(text, "#e8#", AL["Ammo Pouch"]);
    text = gsub(text, "#e9#", AL["Quiver"]);
    text = gsub(text, "#e10#", AL["Bag"]);
    text = gsub(text, "#e11#", AL["Enchant"]);
    text = gsub(text, "#e12#", AL["Trade Goods"]);
    text = gsub(text, "#e13#", AL["Scope"]);
    text = gsub(text, "#e14#", AL["Key"]);
    text = gsub(text, "#e15#", AL["Pet"]);
    text = gsub(text, "#e16#", AL["Idol"]);
    text = gsub(text, "#e17#", AL["Totem"]);
    text = gsub(text, "#e18#", AL["Libram"]);
    text = gsub(text, "#e19#", AL["Darkmoon Faire Card"]);
    text = gsub(text, "#e20#", AL["Book"]);
    text = gsub(text, "#e21#", AL["Banner"]);
    text = gsub(text, "#e22#", AL["Needed to purchase rewards"]);
    text = gsub(text, "#e23#", AL["Gem"]);
    text = gsub(text, "#e24#", AL["Use to purchase rewards"]);
    text = gsub(text, "#e25#", AL["Use to purchase rewards (Horde)"]);
    text = gsub(text, "#e26#", AL["Use to purchase rewards (Alliance)"]);
    text = gsub(text, "#e27#", AL["Token"]);
    text = gsub(text, "#e28#", AL["Crafting Reagent"]);
    text = gsub(text, "#e31#", AL["random stats"]);
	text = gsub(text, "#e32#", AL["random resistance"]);
	text = gsub(text, "#e33#", AL["random colour"]);

    -- Classes
    text = gsub(text, "#c1#", AL["Druid"]); -- =q13=#c1#
    text = gsub(text, "#c2#", AL["Hunter"]); -- =q14=#c2#
    text = gsub(text, "#c3#", AL["Mage"]); -- =q10=#c3#
    text = gsub(text, "#c4#", AL["Paladin"]); -- =q16=#c4#
    text = gsub(text, "#c5#", AL["Priest"]); -- =q9=#c5#
    text = gsub(text, "#c6#", AL["Rogue"]); -- =q12=#c6#
    text = gsub(text, "#c7#", AL["Shaman"]); -- =q15=#c7#
    text = gsub(text, "#c8#", AL["Warlock"]); -- =q11=#c8#
    text = gsub(text, "#c9#", AL["Warrior"]); -- =q17=#c9#

    --Skill
    text = gsub(text, "#sk1#", AL["Apprentice"]);
    text = gsub(text, "#sk2#", AL["Journeyman"]);
    text = gsub(text, "#sk3#", AL["Expert"]);
    text = gsub(text, "#sk4#", AL["Artisan"]);
	
    --Professions
    text = gsub(text, "#p1#", AL["Alchemy"]);
    text = gsub(text, "#p2#", AL["Blacksmithing"]);
    text = gsub(text, "#p3#", AL["Cooking"]);
    text = gsub(text, "#p4#", AL["Enchanting"]);
    text = gsub(text, "#p5#", AL["Engineering"]);
    text = gsub(text, "#p6#", AL["First Aid"]);
    text = gsub(text, "#p7#", AL["Leatherworking"]);
    text = gsub(text, "#p8#", AL["Tailoring"]);
    text = gsub(text, "#p9#", AL["Dragonscale"]);
    text = gsub(text, "#p10#", AL["Tribal"]);
    text = gsub(text, "#p11#", AL["Elemental"]);
    text = gsub(text, "#p13#", AL["Lockpicking"]);
    text = gsub(text, "#p14#", AL["Gnomish Engineering"]);
    text = gsub(text, "#p15#", AL["Goblin Engineering"]);

    --Reputation
    text = gsub(text, "#r1#", AL["Neutral"]);
    text = gsub(text, "#r2#", AL["Friendly"]);
    text = gsub(text, "#r3#", AL["Honored"]);
    text = gsub(text, "#r4#", AL["Revered"]);
    text = gsub(text, "#r5#", AL["Exalted"]);

    --Battleground Factions
    text = gsub(text, "#b1#", AL["Stormpike Guard"]);
    text = gsub(text, "#b2#", AL["Frostwolf Clan"]);
    text = gsub(text, "#b3#", AL["Silverwing Sentinels"]);
    text = gsub(text, "#b4#", AL["Warsong Outriders"]);
    text = gsub(text, "#b5#", AL["The League of Arathor"]);
    text = gsub(text, "#b6#", AL["The Defilers"]);
    
    --BRDArena
    text = gsub(text, "#brd1#", AL["Anub'shiah"]);
    text = gsub(text, "#brd2#", AL["Eviscerator"]);
    text = gsub(text, "#brd3#", AL["Gorosh the Dervish"]);
    text = gsub(text, "#brd4#", AL["Grizzle"]);
    text = gsub(text, "#brd5#", AL["Hedrum the Creeper"]);
    text = gsub(text, "#brd6#", AL["Ok'thor the Breaker"]);

    --Sunken Temple Mini Bosses
    text = gsub(text, "#st1#", AL["Gasher"]);
    text = gsub(text, "#st2#", AL["Hukku"]);
    text = gsub(text, "#st3#", AL["Loro"]);
    text = gsub(text, "#st4#", AL["Mijan"]);
    text = gsub(text, "#st5#", AL["Zolo"]);
    text = gsub(text, "#st6#", AL["Zul'Lor"]);


    -- Misc phrases and mod specific stuff
    text = gsub(text, "#m1#", AL["Classes"]);
    text = gsub(text, "#m2#", AL["This Item Begins a Quest"]);
    text = gsub(text, "#m3#", AL["Quest Item"]);
    text = gsub(text, "#m4#", AL["Quest Reward"]);
    text = gsub(text, "#m5#", AL["Shared"]);
    text = gsub(text, "#m6#", AL["Horde"]); -- =q6=#m6#
    text = gsub(text, "#m7#", AL["Alliance"]); -- =q8=#m7#
    text = gsub(text, "#m8#", AL["Unique"]);
    text = gsub(text, "#m9#", AL["Right Half"]);
    text = gsub(text, "#m10#", AL["Left Half"]);
    text = gsub(text, "#m11#", AL["28 Slot Soul"]);
    text = gsub(text, "#m12#", AL["18 Slot"]);
    text = gsub(text, "#m13#", AL["10 Slot"]);
    text = gsub(text, "#m14#", AL["(300)"]);
    text = gsub(text, "#m15#", AL["(295)"]);
    text = gsub(text, "#m16#", AL["(275)"]);
    text = gsub(text, "#m17#", AL["(265)"]);
    text = gsub(text, "#m18#", AL["(290)"]);
    text = gsub(text, "#m19#", AL["Set"]);
    text = gsub(text, "#m20#", AL["(285)"]);
    text = gsub(text, "#m21#", AL["16 Slot"]);
	text = gsub(text, "#m22#", AL["Schematic: Field Repair Bot 74A"]);
    text = gsub(text, "#m23#", AL["Container"]);
    text = gsub(text, "#m24#", AL["Blacksmithing Plans"]);
    text = gsub(text, "#m25#", AL["Consumable"]);
    text = gsub(text, "#m26#", AL["(185)"]);
    text = gsub(text, "#m27#", AL["(160)"]);
    text = gsub(text, "#m28#", AL["(125)"]);
    text = gsub(text, "#m29#", AL["(200)"]);
    text = gsub(text, "#m30#", AL["(1)"]);
    text = gsub(text, "#m31#", AL["Reagent"]);
	text = gsub(text, "#m32#", AL["Binds when picked up"]);
	text = gsub(text, "#m33#", AL["Misc"]);
	text = gsub(text, "#m34#", AL["Use to purchase rewards"]);
	text = gsub(text, "#m35#", AL["Fireworks"]);
	text = gsub(text, "#m36#", AL["Used to summon boss"]);
    text = gsub(text, "#m37#", AL["24 Slot"]);
    text = gsub(text, "#m38#", AL["Coin"]);
    text = gsub(text, "#m39#", AL["Bijou"]);
    text = gsub(text, "#m40#", AL["Doll"]);
	
	-- Random names
    text = gsub(text, "#x1#", AL["Lord Cobrahn"]);
    text = gsub(text, "#x2#", AL["Lady Anacondra"]);
    text = gsub(text, "#x3#", AL["Lord Serpentis"]);
    text = gsub(text, "#x4#", AL["Druid of the Fang"]);
    text = gsub(text, "#x5#", AL["Lord Pythas"]);
    text = gsub(text, "#x6#", AL["Edwin VanCleef"]);
    text = gsub(text, "#x7#", AL["Captain Greenskin"]);
    text = gsub(text, "#x8#", AL["Defias Strip Miner"]);
    text = gsub(text, "#x9#", AL["Overseer/Taskmaster"]);
    text = gsub(text, "#x10#", AL["Primal Hakkari Kossack"]);
    text = gsub(text, "#x11#", AL["Primal Hakkari Shawl"]);
    text = gsub(text, "#x12#", AL["Primal Hakkari Bindings"]);
    text = gsub(text, "#x13#", AL["Primal Hakkari Sash"]);
    text = gsub(text, "#x14#", AL["Primal Hakkari Stanchion"]);
    text = gsub(text, "#x15#", AL["Primal Hakkari Aegis"]);
    text = gsub(text, "#x16#", AL["Primal Hakkari Girdle"]);
    text = gsub(text, "#x17#", AL["Primal Hakkari Armsplint"]);
    text = gsub(text, "#x18#", AL["Primal Hakkari Tabard"]);
    text = gsub(text, "#x19#", AL["Qiraji Ornate Hilt"]);
    text = gsub(text, "#x20#", AL["Qiraji Martial Drape"]);
    text = gsub(text, "#x21#", AL["Qiraji Magisterial Ring"]);
    text = gsub(text, "#x22#", AL["Qiraji Ceremonial Ring"]);
    text = gsub(text, "#x23#", AL["Qiraji Regal Drape"]);
    text = gsub(text, "#x24#", AL["Qiraji Spiked Hilt"]);
    text = gsub(text, "#x25#", AL["Qiraji Bindings of Dominance"]);
    text = gsub(text, "#x26#", AL["Vek'nilash's Circlet"]);
    text = gsub(text, "#x27#", AL["Ouro's Intact Hide"]);
    text = gsub(text, "#x28#", AL["Husk of the Old God"]);
    text = gsub(text, "#x29#", AL["Qiraji Bindings of Command"]);
    text = gsub(text, "#x30#", AL["Vek'lor's Diadem"]);
    text = gsub(text, "#x31#", AL["Skin of the Great Sandworm"]);
    text = gsub(text, "#x32#", AL["Carapace of the Old God"]);
    text = gsub(text, "#x33#", AL["Defender"]);
    text = gsub(text, "#x34#", AL["Trash Mobs"]);
    text = gsub(text, "#x35#", AL["Champion"]);
    text = gsub(text, "#x36#", AL["Centurion"]);
    text = gsub(text, "#x37#", AL["Herod"]);
    text = gsub(text, "#x38#", AL["Protector"]);
    text = gsub(text, "#x39#", AL["Myrmidon"]);
	text = gsub(text, "#x40#", AL["Defias Pirate"]);
	text = gsub(text, "#x41#", AL["Prisoner/Insurgent/Convict"]);
	text = gsub(text, "#x42#", AL["Black Guard Swordsmith"]);
	text = gsub(text, "#x43#", AL["Crimson Hammersmith"]);
	text = gsub(text, "#x44#", AL["Shadowforge Flame Keeper"]);
	text = gsub(text, "#x45#", AL["Anvilrage Marshal"]);
	text = gsub(text, "#x46#", AL["Anvilrage Captain"]);
	text = gsub(text, "#x47#", AL["Weapon Technician"]);
	text = gsub(text, "#x48#", AL["Doomforge Craftsman"]);
	text = gsub(text, "#x49#", AL["Doomforge Arcanasmith"]);
	text = gsub(text, "#x50#", AL["Hammered Patron"]);
	text = gsub(text, "#x51#", AL["Scarshield Warlock"]);
	text = gsub(text, "#x52#", AL["Firebrand Pyromancer"]);
	text = gsub(text, "#x53#", AL["Firebrand Grunt"]);
	text = gsub(text, "#x54#", AL["Firebrand Invoker"]);
	text = gsub(text, "#x55#", AL["Firebrand Legionnaire"]);
	text = gsub(text, "#x56#", AL["Spirestone Mystic"]);
	text = gsub(text, "#x57#", AL["Spirestone Warlord"]);
	text = gsub(text, "#x58#", AL["Spire Spider/Spiderling"]);
	text = gsub(text, "#x59#", AL["Blackhand Elite"]);
	text = gsub(text, "#x60#", AL["Blackhand Assassin"]);
	text = gsub(text, "#x61#", AL["Death Talon Wyrmguard"]);
	text = gsub(text, "#x62#", AL["Dark Iron Agent"]);
	text = gsub(text, "#x63#", AL["Molten Destroyer"]);
	text = gsub(text, "#x64#", AL["Scarlet Trainee"]);
	text = gsub(text, "#x65#", AL["Scarlet Commander Mograine"]);
	text = gsub(text, "#x66#", AL["Guardsman"]);
	text = gsub(text, "#x67#", AL["Plagued Hatchling"]);
	text = gsub(text, "#x68#", AL["Scholomance Adept"]);
	text = gsub(text, "#x69#", AL["Scholomance Dark Summoner"]);
	text = gsub(text, "#x70#", AL["Spectral Researcher"]);
    text = gsub(text, "#x71#", AL["Twilight Corrupter"]);
    text = gsub(text, "#x72#", AL["Thuzadin Shadowcaster"]);
    text = gsub(text, "#x73#", AL["Crimson Sorcerer"]);
    text = gsub(text, "#x74#", AL["Crimson Battle Mage"]);
    text = gsub(text, "#x75#", AL["Spectral Citizen"]);
    text = gsub(text, "#x76#", AL["Ghoul Ravener"]);
    text = gsub(text, "#x77#", AL["Crimson Inquisitor"]);
    text = gsub(text, "#x78#", AL["Atal'ai Witch Doctor"]);
    text = gsub(text, "#x79#", AL["Murk Worm"]);
    text = gsub(text, "#x80#", AL["Crimson Templar"]);
    text = gsub(text, "#x81#", AL["Azure Templar"]);
    text = gsub(text, "#x82#", AL["Earthen Templar"]);
    text = gsub(text, "#x83#", AL["Hoary Templar"]);
    text = gsub(text, "#x84#", AL["The Duke of Zephyrs"]);
    text = gsub(text, "#x85#", AL["The Duke of Shards"]);
    text = gsub(text, "#x86#", AL["The Duke of Cynders"]);
    text = gsub(text, "#x87#", AL["The Duke of Fathoms"]);
    text = gsub(text, "#x88#", AL["High Marshal Whirlaxis"]);
    text = gsub(text, "#x89#", AL["Baron Kazum"]);
    text = gsub(text, "#x90#", AL["Prince Skaldrenox"]);
    text = gsub(text, "#x91#", AL["Lord Skwol"]);
    text = gsub(text, "#x92#", AL["Baron Charr"]);
    text = gsub(text, "#x93#", AL["Avalanchion"]);
    text = gsub(text, "#x94#", AL["Princess Tempestria"]);
    text = gsub(text, "#x95#", AL["The Windreaver"]);

	-- Misc
    text = gsub(text, "#j1#", AL["Dungeon 1 Set"]);
    text = gsub(text, "#j2#", AL["Dungeon 2 Set"]);
    text = gsub(text, "#j3#", AL["D2 Summonable"]);
    text = gsub(text, "#j4#", AL["Token Hand-Ins"]);
    text = gsub(text, "#j5#", AL["Level 60"]);
    text = gsub(text, "#j6#", AL["Fire Resistance Gear"]);
    text = gsub(text, "#j7#", AL["Arcane Resistance Gear"]);
    text = gsub(text, "#j8#", AL["Nature Resistance Gear"]);
    text = gsub(text, "#j9#", AL["Frost Resistance Gear"]);
    text = gsub(text, "#j10#", AL["Shadow Resistance Gear"]);
    text = gsub(text, "#j11#", AL["Master Angler"]);
    text = gsub(text, "#j12#", AL["First Prize"]);
    text = gsub(text, "#j13#", AL["Rare Fish Rewards"]);
    text = gsub(text, "#j14#", AL["Rare Fish"]);
    text = gsub(text, "#j15#", AL["Fire"]);
    text = gsub(text, "#j16#", AL["Water"]);
    text = gsub(text, "#j17#", AL["Earth"]);
    text = gsub(text, "#j18#", AL["Air"]);

    -- Blacksmithing Crafted Sets
    text = gsub(text, "#craftbp1#", AL["Imperial Plate"]);
    text = gsub(text, "#craftbp2#", AL["The Darksoul"]);
    text = gsub(text, "#craftbm1#", AL["Bloodsoul Embrace"]);

    -- Tailoring Crafted Sets
    text = gsub(text, "#craftt1#", AL["Bloodvine Garb"]);

    -- Leatherworking Crafted Sets
    text = gsub(text, "#craftlwl1#", AL["Volcanic Armor"]);
    text = gsub(text, "#craftlwl2#", AL["Ironfeather Armor"]);
    text = gsub(text, "#craftlwl3#", AL["Stormshroud Armor"]);
    text = gsub(text, "#craftlwl4#", AL["Devilsaur Armor"]);
    text = gsub(text, "#craftlwl5#", AL["Blood Tiger Harness"]);
    text = gsub(text, "#craftlwl6#", AL["Primal Batskin"]);
    text = gsub(text, "#craftlwm1#", AL["Green Dragon Mail"]);
    text = gsub(text, "#craftlwm2#", AL["Blue Dragon Mail"]);
    text = gsub(text, "#craftlwm3#", AL["Black Dragon Mail"]);
    
	-- Chests, boxes
    text = gsub(text, "#cb1#", AL["Doan's Strongbox"]);
    --[[text = gsub(text, "#cb2#", ATLASLOOT_Chest of The Seven);
    text = gsub(text, "#cb3#", ATLASLOOT_The Vault);
    text = gsub(text, "#cb4#", ATLASLOOT_Dark Coffer);
    text = gsub(text, "#cb5#", ATLASLOOT_The Secret Safe);
    text = gsub(text, "#cb6#", ATLASLOOT_Ogre Tannin Basket);]]
    text = gsub(text, "#cb7#", AL["Fengus's Chest"]);
    --[[text = gsub(text, "#cb8#", ATLASLOOT_The Princes Chest);]]
    text = gsub(text, "#cb9#", AL["Felvine Shard"]);
    text = gsub(text, "#cb10#", AL["Unforged Rune Covered Breastplate"]);
    --[[text = gsub(text, "#cb11#", ATLASLOOT_Unfinished Painting);
    text = gsub(text, "#cb12#", ATLASLOOT_Frostwhispers Embalming Fluid);--]]
    text = gsub(text, "#cb13#", AL["Malor's Strongbox"]);
    --[[text = gsub(text, "#cb14#", ATLASLOOT_Baelogs Chest);
    text = gsub(text, "#cb15#", ATLASLOOT_Conspicuous Urn);--]]
    text = gsub(text, "#cb16#", AL["Gift of Adoration"]);
    text = gsub(text, "#cb17#", AL["Box of Chocolates"]);
    text = gsub(text, "#cb18#", AL["Treat Bag"]);
    --[[text = gsub(text, "#cb19#", ATLASLOOT_Gaily Wrapped Present);
    text = gsub(text, "#cb20#", ATLASLOOT_Festive Gift);
    text = gsub(text, "#cb21#", ATLASLOOT_Ticking Present);
    text = gsub(text, "#cb22#", ATLASLOOT_Gently Shaken Gift);
    text = gsub(text, "#cb24#", ATLASLOOT_Lunar Festival Fireworks Pack);
    text = gsub(text, "#cb25#", ATLASLOOT_Lucky Red Envelope);--]]
    text = gsub(text, "#cb25#", AL["Brightly Colored Egg"]);
    text = gsub(text, "#cb26#", AL["Small Rocket Recipes"]);
    text = gsub(text, "#cb27#", AL["Large Rocket Recipes"]);
    text = gsub(text, "#cb28#", AL["Cluster Rocket Recipes"]);
    text = gsub(text, "#cb29#", AL["Large Cluster Rocket Recipes"]);
    text = gsub(text, "#cb30#", AL["Warpwood Pod"]);
    text = gsub(text, "#cb31#", AL["Scarab Coffer"]);
    text = gsub(text, "#cb32#", AL["Greater Scarab Coffer"]);
	
    --Pre60 Sets
    text = gsub(text, "#pre60s1#", AL["Defias Leather"]);
    text = gsub(text, "#pre60s2#", AL["Embrace of the Viper"]);
    text = gsub(text, "#pre60s3#", AL["Chain of the Scarlet Crusade"]);
    text = gsub(text, "#pre60s4#", AL["The Gladiator"]);
    text = gsub(text, "#pre60s5#", AL["Ironweave Battlesuit"]);
    text = gsub(text, "#pre60s6#", AL["Necropile Raiment"]);
    text = gsub(text, "#pre60s7#", AL["Cadaverous Garb"]);
    text = gsub(text, "#pre60s8#", AL["Bloodmail Regalia"]);
    text = gsub(text, "#pre60s9#", AL["Deathbone Guardian"]);
    text = gsub(text, "#pre60s10#", AL["The Postmaster"]);
    text = gsub(text, "#pre60s11#", AL["Regalia of Undead Cleansing"]);
    text = gsub(text, "#pre60s12#", AL["Undead Slayer's Armor"]);
    text = gsub(text, "#pre60s13#", AL["Garb of the Undead Slayer"]);
    text = gsub(text, "#pre60s14#", AL["Battlegear of Undead Slaying"]);
    text = gsub(text, "#pre60s15#", AL["Shard of the Gods"]);
    text = gsub(text, "#pre60s16#", AL["Major Mojo Infusion"]);
    text = gsub(text, "#pre60s17#", AL["Overlord's Resolution"]);
    text = gsub(text, "#pre60s18#", AL["Prayer of the Primal"]);
    text = gsub(text, "#pre60s19#", AL["Zanzil's Concentration"]);
    text = gsub(text, "#pre60s20#", AL["Spirit of Eskhandar"]);
    text = gsub(text, "#pre60s21#", AL["The Twin Blades of Hakkari"]);
    text = gsub(text, "#pre60s22#", AL["Primal Blessing"]);
    text = gsub(text, "#pre60s23#", AL["Dal'Rend's Arms"]);
    text = gsub(text, "#pre60s24#", AL["Spider's Kiss"]);

    --ZG Sets
    text = gsub(text, "#zgs1#", AL["Haruspex's Garb"]);
    text = gsub(text, "#zgs2#", AL["Predator's Armor"]);
    text = gsub(text, "#zgs3#", AL["Illusionist's Attire"]);
    text = gsub(text, "#zgs4#", AL["Freethinker's Armor"]);
    text = gsub(text, "#zgs5#", AL["Confessor's Raiment"]);
    text = gsub(text, "#zgs6#", AL["Madcap's Outfit"]);
    text = gsub(text, "#zgs7#", AL["Augur's Regalia"]);
    text = gsub(text, "#zgs8#", AL["Demoniac's Threads"]);
    text = gsub(text, "#zgs9#", AL["Vindicator's Battlegear"]);
    
    --AQ20 Sets
    text = gsub(text, "#aq20s1#", AL["Symbols of Unending Life"]);
    text = gsub(text, "#aq20s2#", AL["Trappings of the Unseen Path"]);
    text = gsub(text, "#aq20s3#", AL["Trappings of Vaulted Secrets"]);
    text = gsub(text, "#aq20s4#", AL["Battlegear of Eternal Justice"]);
    text = gsub(text, "#aq20s5#", AL["Finery of Infinite Wisdom"]);
    text = gsub(text, "#aq20s6#", AL["Emblems of Veiled Shadows"]);
    text = gsub(text, "#aq20s7#", AL["Gift of the Gathering Storm"]);
    text = gsub(text, "#aq20s8#", AL["Implements of Unspoken Names"]);
    text = gsub(text, "#aq20s9#", AL["Battlegear of Unyielding Strength"]);
    
    --AQ40 Sets
    text = gsub(text, "#aq40s1#", AL["Genesis Raiment"]);
    text = gsub(text, "#aq40s2#", AL["Striker's Garb"]);
    text = gsub(text, "#aq40s3#", AL["Enigma Vestments"]);
    text = gsub(text, "#aq40s4#", AL["Avenger's Battlegear"]);
    text = gsub(text, "#aq40s5#", AL["Garments of the Oracle"]);
    text = gsub(text, "#aq40s6#", AL["Deathdealer's Embrace"]);
    text = gsub(text, "#aq40s7#", AL["Stormcaller's Garb"]);
    text = gsub(text, "#aq40s8#", AL["Doomcaller's Attire"]);
    text = gsub(text, "#aq40s9#", AL["Conqueror's Battlegear"]);
    
    --T0 Sets
    text = gsub(text, "#t0s1#", AL["Wildheart Raiment"]);
    text = gsub(text, "#t0s2#", AL["Beaststalker Armor"]);
    text = gsub(text, "#t0s3#", AL["Magister's Regalia"]);
    text = gsub(text, "#t0s4#", AL["Lightforge Armor"]);
    text = gsub(text, "#t0s5#", AL["Vestments of the Devout"]);
    text = gsub(text, "#t0s6#", AL["Shadowcraft Armor"]);
    text = gsub(text, "#t0s7#", AL["The Elements"]);
    text = gsub(text, "#t0s8#", AL["Dreadmist Raiment"]);
    text = gsub(text, "#t0s9#", AL["Battlegear of Valor"]);
    
    --T0.5 Sets
    text = gsub(text, "#t05s1#", AL["Feralheart Raiment"]);
    text = gsub(text, "#t05s2#", AL["Beastmaster Armor"]);
    text = gsub(text, "#t05s3#", AL["Sorcerer's Regalia"]);
    text = gsub(text, "#t05s4#", AL["Soulforge Armor"]);
    text = gsub(text, "#t05s5#", AL["Vestments of the Virtuous"]);
    text = gsub(text, "#t05s6#", AL["Darkmantle Armor"]);
    text = gsub(text, "#t05s7#", AL["The Five Thunders"]);
    text = gsub(text, "#t05s8#", AL["Deathmist Raiment"]);
    text = gsub(text, "#t05s9#", AL["Battlegear of Heroism"]);
    
    --T1 Sets
    text = gsub(text, "#t1s1#", AL["Cenarion Raiment"]);
    text = gsub(text, "#t1s2#", AL["Giantstalker Armor"]);
    text = gsub(text, "#t1s3#", AL["Arcanist Regalia"]);
    text = gsub(text, "#t1s4#", AL["Lawbringer Armor"]);
    text = gsub(text, "#t1s5#", AL["Vestments of Prophecy"]);
    text = gsub(text, "#t1s6#", AL["Nightslayer Armor"]);
    text = gsub(text, "#t1s7#", AL["The Earthfury"]);
    text = gsub(text, "#t1s8#", AL["Felheart Raiment"]);
    text = gsub(text, "#t1s9#", AL["Battlegear of Might"]);
    
    --T2 Sets
    text = gsub(text, "#t2s1#", AL["Stormrage Raiment"]);
    text = gsub(text, "#t2s2#", AL["Dragonstalker Armor"]);
    text = gsub(text, "#t2s3#", AL["Netherwind Regalia"]);
    text = gsub(text, "#t2s4#", AL["Judgement Armor"]);
    text = gsub(text, "#t2s5#", AL["Vestments of Transcendence"]);
    text = gsub(text, "#t2s6#", AL["Bloodfang Armor"]);
    text = gsub(text, "#t2s7#", AL["The Ten Storms"]);
    text = gsub(text, "#t2s8#", AL["Nemesis Raiment"]);
    text = gsub(text, "#t2s9#", AL["Battlegear of Wrath"]);
    
    --T3 Sets
    text = gsub(text, "#t3s1#", AL["Dreamwalker Raiment"]);
    text = gsub(text, "#t3s2#", AL["Cryptstalker Armor"]);
    text = gsub(text, "#t3s3#", AL["Frostfire Regalia"]);
    text = gsub(text, "#t3s4#", AL["Redemption Armor"]);
    text = gsub(text, "#t3s5#", AL["Vestments of Faith"]);
    text = gsub(text, "#t3s6#", AL["Bonescythe Armor"]);
    text = gsub(text, "#t3s7#", AL["The Earthshatterer"]);
    text = gsub(text, "#t3s8#", AL["Plagueheart Raiment"]);
    text = gsub(text, "#t3s9#", AL["Dreadnaught's Battlegear"]);
    
    --BoN
    text = gsub(text, "#pob1#", AL["Path of the Conqueror"]);
    text = gsub(text, "#pob2#", AL["Path of the Invoker"]);
    text = gsub(text, "#pob3#", AL["Path of the Protector"]);
    
    --PvP Epic Horde Sets
    text = gsub(text, "#pvpeh1#", AL["Warlord's Sanctuary"]);
    text = gsub(text, "#pvpeh2#", AL["Warlord's Pursuit"]);
    text = gsub(text, "#pvpeh3#", AL["Warlord's Regalia"]);
    text = gsub(text, "#pvpeh4#", AL["Warlord's Raiment"]);
    text = gsub(text, "#pvpeh5#", AL["Warlord's Vestments"]);
    text = gsub(text, "#pvpeh6#", AL["Warlord's Earthshaker"]);
    text = gsub(text, "#pvpeh7#", AL["Warlord's Threads"]);
    text = gsub(text, "#pvpeh8#", AL["Warlord's Battlegear"]);
    text = gsub(text, "#pvpeh9#", AL["Warlord's Aegis"]);
    
    --PvP Epic Alliance Sets
    text = gsub(text, "#pvpea1#", AL["Field Marshal's Sanctuary"]);
    text = gsub(text, "#pvpea2#", AL["Field Marshal's Pursuit"]);
    text = gsub(text, "#pvpea3#", AL["Field Marshal's Regalia"]);
    text = gsub(text, "#pvpea4#", AL["Field Marshal's Aegis"]);
    text = gsub(text, "#pvpea5#", AL["Field Marshal's Raiment"]);
    text = gsub(text, "#pvpea6#", AL["Field Marshal's Vestments"]);
    text = gsub(text, "#pvpea7#", AL["Field Marshal's Threads"]);
    text = gsub(text, "#pvpea8#", AL["Field Marshal's Battlegear"]);
    text = gsub(text, "#pvpea9#", AL["Field Marshal's Earthshaker"]);
    
    --PvP Rare Horde Sets
    text = gsub(text, "#pvprh1#", AL["Champion's Refuge"]);
    text = gsub(text, "#pvprh2#", AL["Champion's Pursuance"]);
    text = gsub(text, "#pvprh3#", AL["Champion's Arcanum"]);
    text = gsub(text, "#pvprh4#", AL["Champion's Investiture"]);
    text = gsub(text, "#pvprh5#", AL["Champion's Guard"]);
    text = gsub(text, "#pvprh6#", AL["Champion's Stormcaller"]);
    text = gsub(text, "#pvprh7#", AL["Champion's Dreadgear"]);
    text = gsub(text, "#pvprh8#", AL["Champion's Battlearmor"]);
    text = gsub(text, "#pvprh9#", AL["Champion's Redoubt"]);
    
    --PvP Rare Alliance Sets
    text = gsub(text, "#pvpra1#", AL["Lieutenant Commander's Refuge"]);
    text = gsub(text, "#pvpra2#", AL["Lieutenant Commander's Pursuance"]);
    text = gsub(text, "#pvpra3#", AL["Lieutenant Commander's Arcanum"]);
    text = gsub(text, "#pvpra4#", AL["Lieutenant Commander's Redoubt"]);
    text = gsub(text, "#pvpra5#", AL["Lieutenant Commander's Investiture"]);
    text = gsub(text, "#pvpra6#", AL["Lieutenant Commander's Guard"]);
    text = gsub(text, "#pvpra7#", AL["Lieutenant Commander's Dreadgear"]);
    text = gsub(text, "#pvpra8#", AL["Lieutenant Commander's Battlearmor"]);
    text = gsub(text, "#pvpra9#", AL["Lieutenant Commander's Stormcaller"]);
    
    --Rogue
    text = gsub(text, "#rp1#", AL["Poisons"]);
    text = gsub(text, "#rp2#", AL["Reagent"]);
    
    --Crafting
    text = gsub(text, "#sr#", AL["Skill:"]);
    text = gsub(text, "#lr#", AL["Level:"]);
    text = gsub(text, "=so1=", "|cffff7f3f"); --orange skill
    text = gsub(text, "=so2=", "|cffffff00"); --yellow skill
    text = gsub(text, "=so3=", "|cff3fbf3f"); --green skill
    text = gsub(text, "=so4=", "|cff7f7f7f"); --gray skill
	
    --Misc PvP Set Text
    text = gsub(text, "#pvps1#", AL["Epic Set"]);
    text = gsub(text, "#pvps2#", AL["Rare Set"]);
    
    --Text colouring
    text = gsub(text, "=q0=", "|cff9d9d9d");
    text = gsub(text, "=q1=", "|cffFFFFFF");
    text = gsub(text, "=q2=", "|cff1eff00");
    text = gsub(text, "=q3=", "|cff0070dd");
    text = gsub(text, "=q4=", "|cffa335ee");
    text = gsub(text, "=q5=", "|cffFF8000");
    text = gsub(text, "=q6=", "|cffFF0000");
	text = gsub(text, "=q7=", "|cff03c0f6"); -- "dropped by" colour
	text = gsub(text, "=q8=", "|cff2773ff"); -- alliance colour, alliance rank colour
	text = gsub(text, "=q9=", "|cffffffff"); -- priest colour
	text = gsub(text, "=q10=", "|cff68ccef"); -- mage colour
	text = gsub(text, "=q11=", "|cff9382c9"); -- warlock colour
	text = gsub(text, "=q12=", "|cfffff468"); -- rogue colour
	text = gsub(text, "=q13=", "|cffff7c0a"); -- druid colour
	text = gsub(text, "=q14=", "|cffaad372"); -- hunter colour
	text = gsub(text, "=q15=", "|cff2773ff"); -- shaman colour
	text = gsub(text, "=q16=", "|cfff48cba"); -- paladin colour
	text = gsub(text, "=q17=", "|cffc69b6d"); -- warrior colour
	text = gsub(text, "=q18=", "|cffff3100"); -- horde rank colour
	text = gsub(text, "=q19=", "|cffe6cc80"); -- horde rank colour
    text = gsub(text, "=ec1=", "|cffFF8400");
    text = gsub(text, "=ds=", "|cffFFd200");
	
	--Dropped by names
    text = gsub(text, "#db1#", AL["Patchwerk"]);
    text = gsub(text, "#db2#", AL["Grobbulus"]);
    text = gsub(text, "#db3#", AL["Gluth"]);
    text = gsub(text, "#db4#", AL["Thaddius"]);
    text = gsub(text, "#db5#", AL["Anub'Rekhan"]);
    text = gsub(text, "#db6#", AL["Faerlina"]);
    text = gsub(text, "#db7#", AL["Maexxna"]);
    text = gsub(text, "#db8#", AL["Noth"]);
    text = gsub(text, "#db9#", AL["Heigan"]);
    text = gsub(text, "#db10#", AL["Loatheb"]);
    text = gsub(text, "#db11#", AL["Razuvious"]);
    text = gsub(text, "#db12#", AL["Gothik"]);
    text = gsub(text, "#db13#", AL["The Four Horsemen"]);
    text = gsub(text, "#db14#", AL["Kel'Thuzad"]);
    text = gsub(text, "#db15#", AL["Onyxia"]);
    text = gsub(text, "#db16#", AL["Ragnaros"]);
    text = gsub(text, "#db17#", AL["Razorgore the Untamed"]);
    text = gsub(text, "#db18#", AL["Vaelastrasz the Corrupt"]);
    text = gsub(text, "#db19#", AL["Broodlord Lashlayer"]);
    text = gsub(text, "#db20#", AL["Firemaw"]);
    text = gsub(text, "#db21#", AL["Ebonroc"]);
    text = gsub(text, "#db22#", AL["Flamegor"]);
    text = gsub(text, "#db23#", AL["Chromaggus"]);
    text = gsub(text, "#db24#", AL["Nefarian"]);
    text = gsub(text, "#db25#", AL["Lucifron"]);
    text = gsub(text, "#db26#", AL["Magmadar"]);
    text = gsub(text, "#db27#", AL["Gehennas"]);
    text = gsub(text, "#db28#", AL["Garr"]);
    text = gsub(text, "#db29#", AL["Baron Geddon"]);
    text = gsub(text, "#db30#", AL["Shazzrah"]);
    text = gsub(text, "#db31#", AL["Sulfuron Harbinger"]);
    text = gsub(text, "#db32#", AL["Golemagg the Incinerator"]);
    text = gsub(text, "#db33#", AL["Darkmaster Gandling"]);
    text = gsub(text, "#db34#", AL["Baron Rivendare"]);
    text = gsub(text, "#db35#", AL["General Drakkisath"]);
    text = gsub(text, "#db36#", AL["Ras Frostwhisper"]);
    text = gsub(text, "#db37#", AL["Doctor Theolen Krastinov"]);
    text = gsub(text, "#db38#", AL["Hearthsinger Forresten"]);
    text = gsub(text, "#db39#", AL["Solakar Flamewreath"]);
    text = gsub(text, "#db40#", AL["Archivist Galford"]);
    text = gsub(text, "#db41#", AL["Maleki the Pallid"]);
    text = gsub(text, "#db42#", AL["Jandice Barov"]);
    text = gsub(text, "#db43#", AL["Lorekeeper Polkelt"]);
    text = gsub(text, "#db44#", AL["Baroness Anastari"]);
    text = gsub(text, "#db45#", AL["Cannon Master Willey"]);
    text = gsub(text, "#db46#", AL["Instructor Malicia"]);
    text = gsub(text, "#db47#", AL["Shadow Hunter Vosh'gajin"]);
    text = gsub(text, "#db48#", AL["Rattlegore"]);
    text = gsub(text, "#db49#", AL["Gizrul the Slavener"]);
    text = gsub(text, "#db50#", AL["Mother Smolderweb"]);
    text = gsub(text, "#db51#", AL["The Unforgiven"]);
    text = gsub(text, "#db52#", AL["The Ravenian"]);
    text = gsub(text, "#db53#", AL["Overlord Wyrmthalak"]);
    text = gsub(text, "#db54#", AL["War Master Voone"]);
    text = gsub(text, "#db55#", AL["Nerub'enkan"]);
    text = gsub(text, "#db56#", AL["Gyth"]);
    text = gsub(text, "#db57#", AL["Pyroguard Emberseer"]);
    text = gsub(text, "#db58#", AL["Highlord Omokk"]);
    text = gsub(text, "#db59#", AL["Warchief Rend Blackhand"]);
    text = gsub(text, "#db60#", AL["Ramstein the Gorger"]);
    text = gsub(text, "#db61#", AL["Kirtonos the Herald"]);
    text = gsub(text, "#db62#", AL["The Beast"]);
    text = gsub(text, "#db63#", AL["Lord Alexei Barov"]);
    text = gsub(text, "#db64#", AL["Timmy the Cruel"]);
    text = gsub(text, "#db65#", AL["Balnazzar"]);
	
	--Zones abbreviations
    text = gsub(text, "#z1#", "("..AL["MC"]..")");
    text = gsub(text, "#z2#", AL["Scholo"]);
    text = gsub(text, "#z3#", AL["Strat"]);
    text = gsub(text, "#z4#", AL["LBRS"]);
    text = gsub(text, "#z5#", AL["UBRS"]);
    
    --Currency Icons
    text = gsub(text, "#gold#", "Interface\\AddOns\\AtlasLoot\\Images\\gold");
    text = gsub(text, "#silver#", "Interface\\AddOns\\AtlasLoot\\Images\\silver");
    text = gsub(text, "#copper#", "Interface\\AddOns\\AtlasLoot\\Images\\bronze");
    text = gsub(text, "#wsg#", "Interface\\Icons\\INV_Misc_Rune_07");
    text = gsub(text, "#ab#", "Interface\\Icons\\INV_Jewelry_Amulet_07");
    text = gsub(text, "#av#", "Interface\\Icons\\INV_Jewelry_Necklace_21");
    text = gsub(text, "#horde#", "Interface\\AddOns\\AtlasLoot\\Images\\Horde");
    text = gsub(text, "#alliance#", "Interface\\AddOns\\AtlasLoot\\Images\\Alliance");
    text = gsub(text, "#darkmoon#", "Interface\\Icons\\INV_Misc_Ticket_Darkmoon_01");
    text = gsub(text, "#ccombat#", "Interface\\Icons\\INV_Jewelry_Talisman_06");
    text = gsub(text, "#ctactical#", "Interface\\Icons\\INV_Jewelry_Amulet_02");
    text = gsub(text, "#clogistics#", "Interface\\Icons\\INV_Jewelry_Necklace_16");
    text = gsub(text, "#cremulos#", "Interface\\Icons\\INV_Jewelry_Necklace_14");
    text = gsub(text, "#ccenarius#", "Interface\\Icons\\INV_Jewelry_Necklace_12");
    text = gsub(text, "#zandalar#", "Interface\\Icons\\INV_Misc_Coin_08");
    
	return text;
end
