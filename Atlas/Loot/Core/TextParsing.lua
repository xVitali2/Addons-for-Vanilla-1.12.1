local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");
local BC = AceLibrary("Babble-Class-2.2")
local BZ = AceLibrary("Babble-Zone-2.2")
local BS = AceLibrary("Babble-Spell-2.2")
local BB = AceLibrary("Babble-Boss-2.2")
local BF = AceLibrary("Babble-Faction-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2")
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
    text = gsub(text, "#s4#", AL["Back1"]);
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
    text = gsub(text, "#e10#", AL["Slot"]);
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
    text = gsub(text, "#e23#", AL["random stats"]);
	text = gsub(text, "#e24#", AL["random resistance"]);
	text = gsub(text, "#e25#", AL["random colour"]);

    -- Classes
    text = gsub(text, "#c1#", BC["Druid"]); -- =q13=#c1#
    text = gsub(text, "#c2#", BC["Hunter"]); -- =q14=#c2#
    text = gsub(text, "#c3#", BC["Mage"]); -- =q10=#c3#
    text = gsub(text, "#c4#", BC["Paladin"]); -- =q16=#c4#
    text = gsub(text, "#c5#", BC["Priest"]); -- =q9=#c5#
    text = gsub(text, "#c6#", BC["Rogue"]); -- =q12=#c6#
    text = gsub(text, "#c7#", BC["Shaman"]); -- =q15=#c7#
    text = gsub(text, "#c8#", BC["Warlock"]); -- =q11=#c8#
    text = gsub(text, "#c9#", BC["Warrior"]); -- =q17=#c9#

    --Skill
    text = gsub(text, "#sk1#", AL["Apprentice"]);
    text = gsub(text, "#sk2#", AL["Journeyman"]);
    text = gsub(text, "#sk3#", AL["Expert"]);
    text = gsub(text, "#sk4#", AL["Artisan"]);
	
    --Professions
    text = gsub(text, "#p1#", BS["Alchemy"]);
    text = gsub(text, "#p2#", BS["Blacksmithing"]);
    text = gsub(text, "#p3#", BS["Cooking"]);
    text = gsub(text, "#p4#", BS["Enchanting"]);
    text = gsub(text, "#p5#", BS["Engineering"]);
    text = gsub(text, "#p6#", BS["First Aid"]);
    text = gsub(text, "#p7#", BS["Leatherworking"]);
    text = gsub(text, "#p8#", BS["Tailoring"]);
    text = gsub(text, "#p9#", AL["Dragonscale"]);
    text = gsub(text, "#p10#", AL["Tribal"]);
    text = gsub(text, "#p11#", AL["Elemental"]);
    text = gsub(text, "#p13#", BS["Lockpicking"]);
    text = gsub(text, "#p14#", AL["Gnomish Engineering"]);
    text = gsub(text, "#p15#", AL["Goblin Engineering"]);
    text = gsub(text, "#p16#", BS["Skinning"]);
    text = gsub(text, "#p17#", AL["LW"]);

    --Reputation
    text = gsub(text, "#r1#", BF["Neutral"]);
    text = gsub(text, "#r2#", BF["Friendly"]);
    text = gsub(text, "#r3#", BF["Honored"]);
    text = gsub(text, "#r4#", BF["Revered"]);
    text = gsub(text, "#r5#", BF["Exalted"]);

    --Battleground Factions
    text = gsub(text, "#b1#", BF["Stormpike Guard"]);
    text = gsub(text, "#b2#", BF["Frostwolf Clan"]);
    text = gsub(text, "#b3#", BF["Silverwing Sentinels"]);
    text = gsub(text, "#b4#", BF["Warsong Outriders"]);
    text = gsub(text, "#b5#", BF["The League of Arathor"]);
    text = gsub(text, "#b6#", BF["The Defilers"]);
    
    --BRDArena
    text = gsub(text, "#brd1#", BB["Anub'shiah"]);
    text = gsub(text, "#brd2#", BB["Eviscerator"]);
    text = gsub(text, "#brd3#", BB["Gorosh the Dervish"]);
    text = gsub(text, "#brd4#", BB["Hedrum the Creeper"]);
    text = gsub(text, "#brd5#", BB["Ok'thor the Breaker"]);

    --Sunken Temple Mini Bosses
    text = gsub(text, "#st1#", BB["Gasher"]);
    text = gsub(text, "#st2#", BB["Hukku"]);
    text = gsub(text, "#st3#", BB["Loro"]);
    text = gsub(text, "#st4#", BB["Mijan"]);
    text = gsub(text, "#st5#", BB["Zolo"]);
    text = gsub(text, "#st6#", BB["Zul'Lor"]);


    -- Misc phrases and mod specific stuff
    text = gsub(text, "#m1#", AL["Doll"]);
    text = gsub(text, "#m2#", AL["This Item Begins a Quest"]);
    text = gsub(text, "#m3#", AL["Quest Item"]);
    text = gsub(text, "#m4#", AL["Quest Reward"]);
    text = gsub(text, "#m5#", AL["Shared"]);
    text = gsub(text, "#m6#", BF["Horde"]); -- =q6=#m6#
    text = gsub(text, "#m7#", BF["Alliance"]); -- =q8=#m7#
    text = gsub(text, "#m8#", AL["Unique"]);
    text = gsub(text, "#m9#", AL["Right Half"]);
    text = gsub(text, "#m10#", AL["Left Half"]);
    text = gsub(text, "#m11#", AL["28 Slot Bag"]);
    text = gsub(text, "#m12#", AL["18 Slot Bag"]);
    text = gsub(text, "#m13#", AL["10 Slot Bag"]);
	text = gsub(text, "#m14#", AL["Needed to purchase rewards"]);
	text = gsub(text, "#m15#", AL["Fireworks"]);
	text = gsub(text, "#m16#", AL["Used to summon boss"]);
    text = gsub(text, "#m17#", AL["24 Slot Bag"]);
    text = gsub(text, "#m18#", AL["Coin"]);
	text = gsub(text, "#m19#", AL["Bijou"]);
	text = gsub(text, "#m20#", AL["Misc"]);
    text = gsub(text, "#m21#", AL["16 Slot Bag"]);
	text = gsub(text, "#m22#", AL["Schematic: Field Repair Bot 74A"]);
    text = gsub(text, "#m23#", AL["Container"]);
    text = gsub(text, "#m24#", AL["Blacksmithing Plans"]);
    text = gsub(text, "#m25#", AL["Consumable"]);
    text = gsub(text, "#m26#", AL["Reagent"]);
	text = gsub(text, "#m27#", AL["Binds when picked up"]);
	text = gsub(text, "#m28#", AL["pickpocketed"]);
	text = gsub(text, "#m29#", AL["vendor"]);
	text = gsub(text, "#m30#", AL["Lunar Festival Fireworks Pack"]);
	text = gsub(text, "#m31#", AL["Lucky Red Envelope"]);
	text = gsub(text, "#m32#", AL["Gently Shaken Gift"]);
	text = gsub(text, "#m33#", AL["Smokywood Pastures Special Gift"]);
	text = gsub(text, "#m34#", AL["Festive Gift"]);
	text = gsub(text, "#m35#", AL["Gaily Wrapped Present"]);
	text = gsub(text, "#m36#", AL["Smokywood Pastures"]);
	
	-- Random names
    text = gsub(text, "#x1#", BB["Lord Cobrahn"]);
    text = gsub(text, "#x2#", BB["Lady Anacondra"]);
    text = gsub(text, "#x3#", BB["Lord Serpentis"]);
    text = gsub(text, "#x4#", AL["Druid of the Fang"]);
    text = gsub(text, "#x5#", BB["Lord Pythas"]);
    text = gsub(text, "#x6#", BB["Edwin VanCleef"]);
    text = gsub(text, "#x7#", AL["The Windreaver"]);
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
    text = gsub(text, "#x37#", BB["Herod"]);
    text = gsub(text, "#x38#", AL["Protector"]);
    text = gsub(text, "#x39#", AL["Myrmidon"]);
	text = gsub(text, "#x40#", AL["Defias Pirate"]);
	text = gsub(text, "#x41#", AL["Prisoner/Insurgent/Convict"]);
    text = gsub(text, "#x42#", AL["Princess Tempestria"]);
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
	text = gsub(text, "#x65#", BB["Scarlet Commander Mograine"]);
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
    text = gsub(text, "#x94#", BB["Plugger Spazzring"]);
    text = gsub(text, "#x95#", BB["Ribbly Screwspigot"]);
    text = gsub(text, "#x96#", AL["Lokhtos Darkbargainer"]);
    text = gsub(text, "#x97#", BB["Phalanx"]);
    text = gsub(text, "#x98#", BB["Hurley Blackbreath"]);
    text = gsub(text, "#x99#", BB["Isalien"]);
    text = gsub(text, "#x100#", BB["Lord Valthalak"]);
    text = gsub(text, "#x101#", BB["Sothos"]);
    text = gsub(text, "#x102#", BB["Jarien"]);
    text = gsub(text, "#x103#", BB["Mor Grayhoof"]);
    text = gsub(text, "#x104#", BB["Kormok"]);

	-- Misc
	text = gsub(text, "#j1#", AL["Tier 0.5"]);
    text = gsub(text, "#j2#", AL["Tier 0.5 Summonable"]);
    text = gsub(text, "#j3#", AL["Fire Resistance Gear"]);
    text = gsub(text, "#j4#", AL["Arcane Resistance Gear"]);
    text = gsub(text, "#j5#", AL["Nature Resistance Gear"]);
    text = gsub(text, "#j6#", AL["Master Angler"]);
    text = gsub(text, "#j7#", AL["First Prize"]);
    text = gsub(text, "#j8#", AL["Rare Fish Rewards"]);
    text = gsub(text, "#j9#", AL["Rare Fish"]);
    text = gsub(text, "#j10#", AL["Fire"]);
    text = gsub(text, "#j11#", AL["Water"]);
    text = gsub(text, "#j12#", AL["Earth"]);
    text = gsub(text, "#j13#", AL["Air"]);
    text = gsub(text, "#j14#", AL["Collector's Edition"]);
    text = gsub(text, "#j15#", AL["Arena Spoils"]);
    text = gsub(text, "#j16#", AL["Graveyard"]);
    text = gsub(text, "#j17#", AL["Relic Coffer"]);
    text = gsub(text, "#j18#", AL["Dark Keeper"]);

	-- Blacksmithing Crafted Sets
    text = gsub(text, "#craftbp1#", BIS["Imperial Plate"]);
    text = gsub(text, "#craftbp2#", BIS["The Darksoul"]);
    text = gsub(text, "#craftbm1#", BIS["Bloodsoul Embrace"]);

    -- Tailoring Crafted Sets
    text = gsub(text, "#craftt1#", BIS["Bloodvine Garb"]);

    -- Leatherworking Crafted Sets
    text = gsub(text, "#craftlwl1#", BIS["Volcanic Armor"]);
    text = gsub(text, "#craftlwl2#", BIS["Ironfeather Armor"]);
    text = gsub(text, "#craftlwl3#", BIS["Stormshroud Armor"]);
    text = gsub(text, "#craftlwl4#", BIS["Devilsaur Armor"]);
    text = gsub(text, "#craftlwl5#", BIS["Blood Tiger Harness"]);
    text = gsub(text, "#craftlwl6#", BIS["Primal Batskin"]);
    text = gsub(text, "#craftlwm1#", BIS["Green Dragon Mail"]);
    text = gsub(text, "#craftlwm2#", BIS["Blue Dragon Mail"]);
    text = gsub(text, "#craftlwm3#", BIS["Black Dragon Mail"]);
    
	-- Chests, boxes
    text = gsub(text, "#cb1#", AL["Doan's Strongbox"]);
    text = gsub(text, "#cb2#", AL["Fengus's Chest"]);
    text = gsub(text, "#cb3#", AL["Felvine Shard"]);
    text = gsub(text, "#cb4#", AL["Unforged Rune Covered Breastplate"]);
    text = gsub(text, "#cb5#", AL["Malor's Strongbox"]);
    text = gsub(text, "#cb6#", AL["Gift of Adoration"]);
    text = gsub(text, "#cb7#", AL["Box of Chocolates"]);
    text = gsub(text, "#cb8#", AL["Treat Bag"]);
    text = gsub(text, "#cb9#", AL["Brightly Colored Egg"]);
    text = gsub(text, "#cb10#", AL["Small Rocket Recipes"]);
    text = gsub(text, "#cb11#", AL["Large Rocket Recipes"]);
    text = gsub(text, "#cb12#", AL["Cluster Rocket Recipes"]);
    text = gsub(text, "#cb13#", AL["Large Cluster Rocket Recipes"]);
    text = gsub(text, "#cb14#", AL["Warpwood Pod"]);
    text = gsub(text, "#cb15#", AL["Scarab Coffer"]);
    text = gsub(text, "#cb16#", AL["Greater Scarab Coffer"]);
    text = gsub(text, "#cb17#", AL["Chest of The Seven"]);
    text = gsub(text, "#cb18#", AL["Dark Coffer"]);
    text = gsub(text, "#cb19#", AL["Secret Safe"]);
	
    --Other Sets
    text = gsub(text, "#oth_s1#", BIS["Defias Leather"]);
    text = gsub(text, "#oth_s2#", BIS["Embrace of the Viper"]);
    text = gsub(text, "#oth_s3#", BIS["Chain of the Scarlet Crusade"]);
    text = gsub(text, "#oth_s4#", BIS["The Gladiator"]);
    text = gsub(text, "#oth_s5#", BIS["Ironweave Battlesuit"]);
    text = gsub(text, "#oth_s6#", BIS["Necropile Raiment"]);
    text = gsub(text, "#oth_s7#", BIS["Cadaverous Garb"]);
    text = gsub(text, "#oth_s8#", BIS["Bloodmail Regalia"]);
    text = gsub(text, "#oth_s9#", BIS["Deathbone Guardian"]);
    text = gsub(text, "#oth_s10#", BIS["The Postmaster"]);
    text = gsub(text, "#oth_s11#", BIS["Regalia of Undead Cleansing"]);
    text = gsub(text, "#oth_s12#", BIS["Undead Slayer's Armor"]);
    text = gsub(text, "#oth_s13#", BIS["Garb of the Undead Slayer"]);
    text = gsub(text, "#oth_s14#", BIS["Battlegear of Undead Slaying"]);
    text = gsub(text, "#oth_s15#", BIS["Shard of the Gods"]);
    text = gsub(text, "#oth_s16#", BIS["Major Mojo Infusion"]);
    text = gsub(text, "#oth_s17#", BIS["Overlord's Resolution"]);
    text = gsub(text, "#oth_s18#", BIS["Prayer of the Primal"]);
    text = gsub(text, "#oth_s19#", BIS["Zanzil's Concentration"]);
    text = gsub(text, "#oth_s20#", BIS["Spirit of Eskhandar"]);
    text = gsub(text, "#oth_s21#", BIS["The Twin Blades of Hakkari"]);
    text = gsub(text, "#oth_s22#", BIS["Primal Blessing"]);
    text = gsub(text, "#oth_s23#", BIS["Dal'Rend's Arms"]);
    text = gsub(text, "#oth_s24#", BIS["Spider's Kiss"]);

    --ZG Sets
    text = gsub(text, "#zgs1#", BIS["Haruspex's Garb"]);
    text = gsub(text, "#zgs2#", BIS["Predator's Armor"]);
    text = gsub(text, "#zgs3#", BIS["Illusionist's Attire"]);
    text = gsub(text, "#zgs4#", BIS["Freethinker's Armor"]);
    text = gsub(text, "#zgs5#", BIS["Confessor's Raiment"]);
    text = gsub(text, "#zgs6#", BIS["Madcap's Outfit"]);
    text = gsub(text, "#zgs7#", BIS["Augur's Regalia"]);
    text = gsub(text, "#zgs8#", BIS["Demoniac's Threads"]);
    text = gsub(text, "#zgs9#", BIS["Vindicator's Battlegear"]);
    
    --AQ20 Sets
    text = gsub(text, "#aq20s1#", BIS["Symbols of Unending Life"]);
    text = gsub(text, "#aq20s2#", BIS["Trappings of the Unseen Path"]);
    text = gsub(text, "#aq20s3#", BIS["Trappings of Vaulted Secrets"]);
    text = gsub(text, "#aq20s4#", BIS["Battlegear of Eternal Justice"]);
    text = gsub(text, "#aq20s5#", BIS["Finery of Infinite Wisdom"]);
    text = gsub(text, "#aq20s6#", BIS["Emblems of Veiled Shadows"]);
    text = gsub(text, "#aq20s7#", BIS["Gift of the Gathering Storm"]);
    text = gsub(text, "#aq20s8#", BIS["Implements of Unspoken Names"]);
    text = gsub(text, "#aq20s9#", BIS["Battlegear of Unyielding Strength"]);
    
    --AQ40 Sets
    text = gsub(text, "#aq40s1#", BIS["Genesis Raiment"]);
    text = gsub(text, "#aq40s2#", BIS["Striker's Garb"]);
    text = gsub(text, "#aq40s3#", BIS["Enigma Vestments"]);
    text = gsub(text, "#aq40s4#", BIS["Avenger's Battlegear"]);
    text = gsub(text, "#aq40s5#", BIS["Garments of the Oracle"]);
    text = gsub(text, "#aq40s6#", BIS["Deathdealer's Embrace"]);
    text = gsub(text, "#aq40s7#", BIS["Stormcaller's Garb"]);
    text = gsub(text, "#aq40s8#", BIS["Doomcaller's Attire"]);
    text = gsub(text, "#aq40s9#", BIS["Conqueror's Battlegear"]);
    
    --T0 Sets
    text = gsub(text, "#t0s1#", BIS["Wildheart Raiment"]);
    text = gsub(text, "#t0s2#", BIS["Beaststalker Armor"]);
    text = gsub(text, "#t0s3#", BIS["Magister's Regalia"]);
    text = gsub(text, "#t0s4#", BIS["Lightforge Armor"]);
    text = gsub(text, "#t0s5#", BIS["Vestments of the Devout"]);
    text = gsub(text, "#t0s6#", BIS["Shadowcraft Armor"]);
    text = gsub(text, "#t0s7#", BIS["The Elements"]);
    text = gsub(text, "#t0s8#", BIS["Dreadmist Raiment"]);
    text = gsub(text, "#t0s9#", BIS["Battlegear of Valor"]);
    
    --T0.5 Sets
    text = gsub(text, "#t05s1#", BIS["Feralheart Raiment"]);
    text = gsub(text, "#t05s2#", BIS["Beastmaster Armor"]);
    text = gsub(text, "#t05s3#", BIS["Sorcerer's Regalia"]);
    text = gsub(text, "#t05s4#", BIS["Soulforge Armor"]);
    text = gsub(text, "#t05s5#", BIS["Vestments of the Virtuous"]);
    text = gsub(text, "#t05s6#", BIS["Darkmantle Armor"]);
    text = gsub(text, "#t05s7#", BIS["The Five Thunders"]);
    text = gsub(text, "#t05s8#", BIS["Deathmist Raiment"]);
    text = gsub(text, "#t05s9#", BIS["Battlegear of Heroism"]);
    
    --T1 Sets
    text = gsub(text, "#t1s1#", BIS["Cenarion Raiment"]);
    text = gsub(text, "#t1s2#", BIS["Giantstalker Armor"]);
    text = gsub(text, "#t1s3#", BIS["Arcanist Regalia"]);
    text = gsub(text, "#t1s4#", BIS["Lawbringer Armor"]);
    text = gsub(text, "#t1s5#", BIS["Vestments of Prophecy"]);
    text = gsub(text, "#t1s6#", BIS["Nightslayer Armor"]);
    text = gsub(text, "#t1s7#", BIS["The Earthfury"]);
    text = gsub(text, "#t1s8#", BIS["Felheart Raiment"]);
    text = gsub(text, "#t1s9#", BIS["Battlegear of Might"]);
    
    --T2 Sets
    text = gsub(text, "#t2s1#", BIS["Stormrage Raiment"]);
    text = gsub(text, "#t2s2#", BIS["Dragonstalker Armor"]);
    text = gsub(text, "#t2s3#", BIS["Netherwind Regalia"]);
    text = gsub(text, "#t2s4#", BIS["Judgement Armor"]);
    text = gsub(text, "#t2s5#", BIS["Vestments of Transcendence"]);
    text = gsub(text, "#t2s6#", BIS["Bloodfang Armor"]);
    text = gsub(text, "#t2s7#", BIS["The Ten Storms"]);
    text = gsub(text, "#t2s8#", BIS["Nemesis Raiment"]);
    text = gsub(text, "#t2s9#", BIS["Battlegear of Wrath"]);
    
    --T3 Sets
    text = gsub(text, "#t3s1#", BIS["Dreamwalker Raiment"]);
    text = gsub(text, "#t3s2#", BIS["Cryptstalker Armor"]);
    text = gsub(text, "#t3s3#", BIS["Frostfire Regalia"]);
    text = gsub(text, "#t3s4#", BIS["Redemption Armor"]);
    text = gsub(text, "#t3s5#", BIS["Vestments of Faith"]);
    text = gsub(text, "#t3s6#", BIS["Bonescythe Armor"]);
    text = gsub(text, "#t3s7#", BIS["The Earthshatterer"]);
    text = gsub(text, "#t3s8#", BIS["Plagueheart Raiment"]);
    text = gsub(text, "#t3s9#", BIS["Dreadnaught's Battlegear"]);
    
    --BoN
    text = gsub(text, "#pob1#", AL["Path of the Conqueror"]);
    text = gsub(text, "#pob2#", AL["Path of the Invoker"]);
    text = gsub(text, "#pob3#", AL["Path of the Protector"]);
    
    --PvP Epic Horde Sets
    text = gsub(text, "#pvpeh1#", BIS["Warlord's Sanctuary"]);
    text = gsub(text, "#pvpeh2#", BIS["Warlord's Pursuit"]);
    text = gsub(text, "#pvpeh3#", BIS["Warlord's Regalia"]);
    text = gsub(text, "#pvpeh4#", BIS["Warlord's Raiment"]);
    text = gsub(text, "#pvpeh5#", BIS["Warlord's Vestments"]);
    text = gsub(text, "#pvpeh6#", BIS["Warlord's Earthshaker"]);
    text = gsub(text, "#pvpeh7#", BIS["Warlord's Threads"]);
    text = gsub(text, "#pvpeh8#", BIS["Warlord's Battlegear"]);
    
    --PvP Epic Alliance Sets
    text = gsub(text, "#pvpea1#", BIS["Field Marshal's Sanctuary"]);
    text = gsub(text, "#pvpea2#", BIS["Field Marshal's Pursuit"]);
    text = gsub(text, "#pvpea3#", BIS["Field Marshal's Regalia"]);
    text = gsub(text, "#pvpea4#", BIS["Field Marshal's Aegis"]);
    text = gsub(text, "#pvpea5#", BIS["Field Marshal's Raiment"]);
    text = gsub(text, "#pvpea6#", BIS["Field Marshal's Vestments"]);
    text = gsub(text, "#pvpea7#", BIS["Field Marshal's Threads"]);
    text = gsub(text, "#pvpea8#", BIS["Field Marshal's Battlegear"]);
    
    --PvP Rare Horde Sets
    text = gsub(text, "#pvprh1#", BIS["Champion's Refuge"]);
    text = gsub(text, "#pvprh2#", BIS["Champion's Pursuance"]);
    text = gsub(text, "#pvprh3#", BIS["Champion's Arcanum"]);
    text = gsub(text, "#pvprh4#", BIS["Champion's Investiture"]);
    text = gsub(text, "#pvprh5#", BIS["Champion's Guard"]);
    text = gsub(text, "#pvprh6#", BIS["Champion's Stormcaller"]);
    text = gsub(text, "#pvprh7#", BIS["Champion's Dreadgear"]);
    text = gsub(text, "#pvprh8#", BIS["Champion's Battlearmor"]);
    
    --PvP Rare Alliance Sets
    text = gsub(text, "#pvpra1#", BIS["Lieutenant Commander's Refuge"]);
    text = gsub(text, "#pvpra2#", BIS["Lieutenant Commander's Pursuance"]);
    text = gsub(text, "#pvpra3#", BIS["Lieutenant Commander's Arcanum"]);
    text = gsub(text, "#pvpra4#", BIS["Lieutenant Commander's Redoubt"]);
    text = gsub(text, "#pvpra5#", BIS["Lieutenant Commander's Investiture"]);
    text = gsub(text, "#pvpra6#", BIS["Lieutenant Commander's Guard"]);
    text = gsub(text, "#pvpra7#", BIS["Lieutenant Commander's Dreadgear"]);
    text = gsub(text, "#pvpra8#", BIS["Lieutenant Commander's Battlearmor"]);
    
    --Rogue
    text = gsub(text, "#rp1#", BS["Poisons"]);
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
    text = gsub(text, "#db1#", BB["Patchwerk"]);
    text = gsub(text, "#db2#", BB["Grobbulus"]);
    text = gsub(text, "#db3#", BB["Gluth"]);
    text = gsub(text, "#db4#", BB["Thaddius"]);
    text = gsub(text, "#db5#", BB["Anub'Rekhan"]);
    text = gsub(text, "#db6#", BB["Grand Widow Faerlina"]);
    text = gsub(text, "#db7#", BB["Maexxna"]);
    text = gsub(text, "#db8#", BB["Noth the Plaguebringer"]);
    text = gsub(text, "#db9#", BB["Heigan the Unclean"]);
    text = gsub(text, "#db10#", BB["Loatheb"]);
    text = gsub(text, "#db11#", BB["Instructor Razuvious"]);
    text = gsub(text, "#db12#", BB["Gothik the Harvester"]);
    text = gsub(text, "#db13#", BB["The Four Horsemen"]);
    text = gsub(text, "#db14#", BB["Kel'Thuzad"]);
    text = gsub(text, "#db15#", BB["Onyxia"]);
    text = gsub(text, "#db16#", BB["Ragnaros"]);
    text = gsub(text, "#db17#", BB["Razorgore the Untamed"]);
    text = gsub(text, "#db18#", BB["Vaelastrasz the Corrupt"]);
    text = gsub(text, "#db19#", BB["Broodlord Lashlayer"]);
    text = gsub(text, "#db20#", BB["Firemaw"]);
    text = gsub(text, "#db21#", BB["Ebonroc"]);
    text = gsub(text, "#db22#", BB["Flamegor"]);
    text = gsub(text, "#db23#", BB["Chromaggus"]);
    text = gsub(text, "#db24#", BB["Nefarian"]);
    text = gsub(text, "#db25#", BB["Lucifron"]);
    text = gsub(text, "#db26#", BB["Magmadar"]);
    text = gsub(text, "#db27#", BB["Gehennas"]);
    text = gsub(text, "#db28#", BB["Garr"]);
    text = gsub(text, "#db29#", BB["Baron Geddon"]);
    text = gsub(text, "#db30#", BB["Shazzrah"]);
    text = gsub(text, "#db31#", BB["Sulfuron Harbinger"]);
    text = gsub(text, "#db32#", BB["Golemagg the Incinerator"]);
    text = gsub(text, "#db33#", BB["Darkmaster Gandling"]);
    text = gsub(text, "#db34#", BB["Baron Rivendare"]);
    text = gsub(text, "#db35#", BB["General Drakkisath"]);
    text = gsub(text, "#db36#", BB["Ras Frostwhisper"]);
    text = gsub(text, "#db37#", BB["Doctor Theolen Krastinov"]);
    text = gsub(text, "#db38#", BB["Hearthsinger Forresten"]);
    text = gsub(text, "#db39#", BB["Solakar Flamewreath"]);
    text = gsub(text, "#db40#", BB["Archivist Galford"]);
    text = gsub(text, "#db41#", BB["Maleki the Pallid"]);
    text = gsub(text, "#db42#", BB["Jandice Barov"]);
    text = gsub(text, "#db43#", BB["Lorekeeper Polkelt"]);
    text = gsub(text, "#db44#", BB["Baroness Anastari"]);
    text = gsub(text, "#db45#", BB["Cannon Master Willey"]);
    text = gsub(text, "#db46#", BB["Instructor Malicia"]);
    text = gsub(text, "#db47#", BB["Shadow Hunter Vosh'gajin"]);
    text = gsub(text, "#db48#", BB["Rattlegore"]);
    text = gsub(text, "#db49#", BB["Gizrul the Slavener"]);
    text = gsub(text, "#db50#", BB["Mother Smolderweb"]);
    text = gsub(text, "#db51#", BB["The Unforgiven"]);
    text = gsub(text, "#db52#", BB["The Ravenian"]);
    text = gsub(text, "#db53#", BB["Overlord Wyrmthalak"]);
    text = gsub(text, "#db54#", BB["War Master Voone"]);
    text = gsub(text, "#db55#", BB["Nerub'enkan"]);
    text = gsub(text, "#db56#", BB["Gyth"]);
    text = gsub(text, "#db57#", BB["Pyroguard Emberseer"]);
    text = gsub(text, "#db58#", BB["Highlord Omokk"]);
    text = gsub(text, "#db59#", BB["Warchief Rend Blackhand"]);
    text = gsub(text, "#db60#", BB["Ramstein the Gorger"]);
    text = gsub(text, "#db61#", BB["Kirtonos the Herald"]);
    text = gsub(text, "#db62#", BB["The Beast"]);
    text = gsub(text, "#db63#", BB["Lord Alexei Barov"]);
    text = gsub(text, "#db64#", BB["Timmy the Cruel"]);
    text = gsub(text, "#db65#", BB["Balnazzar"]);
    text = gsub(text, "#db66#", BB["Balzaphon"]);
    text = gsub(text, "#db67#", BB["Lord Blackwood"]);
    text = gsub(text, "#db68#", BB["Revanchion"]);
    text = gsub(text, "#db69#", BB["Scorn"]);
    text = gsub(text, "#db70#", BB["Sever"]);
    text = gsub(text, "#db71#", BB["Lady Falther'ess"]);
	
	--Zones abbreviations
    text = gsub(text, "#z1#", "MC");
    text = gsub(text, "#z2#", "Scholo");
    text = gsub(text, "#z3#", "Strat");
    text = gsub(text, "#z4#", "LBRS");
    text = gsub(text, "#z5#", "UBRS");
    
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
    
	--Ranks
    text = gsub(text, "#rank1#", AL["Rank 1"]);
    text = gsub(text, "#rank2#", AL["Rank 2"]);
    text = gsub(text, "#rank3#", AL["Rank 3"]);
    text = gsub(text, "#rank4#", AL["Rank 4"]);
    text = gsub(text, "#rank5#", AL["Rank 5"]);
    text = gsub(text, "#rank6#", AL["Rank 6"]);
    text = gsub(text, "#rank7#", AL["Rank 7"]);
    text = gsub(text, "#rank8#", AL["Rank 8"]);
    text = gsub(text, "#rank9#", AL["Rank 9"]);
    text = gsub(text, "#rank10#", AL["Rank 10"]);
    text = gsub(text, "#rank11#", AL["Rank 11"]);
    text = gsub(text, "#rank12#", AL["Rank 12"]);
    text = gsub(text, "#rank13#", AL["Rank 13"]);
    text = gsub(text, "#rank14#", AL["Rank 14"]);

	--Events
    text = gsub(text, "#ev1#", AL["Feast of Winter Veil"]);
    text = gsub(text, "#ev2#", AL["Love is in the Air"]);
    text = gsub(text, "#ev3#", AL["Midsummer Fire Festival"]);
    text = gsub(text, "#ev4#", AL["Children's Week"]);
	
	--Zones
    text = gsub(text, "#zone1#", BZ["Stratholme"]);
    text = gsub(text, "#zone2#", BZ["Scholomance"]);
    text = gsub(text, "#zone3#", BZ["Dire Maul (West)"]);
    text = gsub(text, "#zone4#", BZ["Scarlet Monastery"]);
    text = gsub(text, "#zone5#", BZ["Shadowfang Keep"]);
    text = gsub(text, "#zone6#", BZ["Razorfen Downs"]);
    text = gsub(text, "#zone7#", BZ["Un'Goro Crater"]);
    text = gsub(text, "#zone8#", BZ["Winterspring"]);
    text = gsub(text, "#zone9#", BZ["Azshara"]);
    text = gsub(text, "#zone10#", BZ["Silithus"]);
	return text;
end