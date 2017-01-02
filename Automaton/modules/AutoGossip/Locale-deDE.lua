local L = AceLibrary("AceLocale-2.2"):new("Automaton_Gossip")

L:RegisterTranslations("deDE", function() return {
	--------------
	-- Gossip Text
	--------------
	["<Touch the unstable rift crystal.>"] = "<Touch the unstable rift crystal.>",
	["<Place my hand on the orb.>"] = "<Place my hand on the orb.>",
	["Thank you, Stable Master. Please take the animal."] = "Thank you, Stable Master. Please take the animal.",
	["With pleasure. These things stink!"] = "With pleasure. These things stink!",
	["Trick or Treat!"] = "Trick or Treat!",

	-------------
	-- Quest Text
	-------------
	-- Alterac Valley quests
	["Empty Stables"] = "Verwaiste Ställe",
	["Ram Hide Harnesses"] = "Widderledernes Zaumzeug",
	["Alterac Ram Hide"] = "Alteracwidderbalg",
	["Ram Riding Harnesses"] = "Widderzaumzeug",
	["Frostwolf Hide"] = "Frostwolfbalg",
	["More Booty!"] = "Mehr Beute!",
	["More Armor Scraps"] = "Mehr Rüstungsfetzen",
	["Armor Scraps"] = "Rüstungsfetzen",
	["Coldtooth Supplies"] = "Coldtooth-Vorräte",
	["Irondeep Supplies"] = "Irondeep-Vorräte",
	["Lokholar the Ice Lord"] = "Lokholar der Eislord",
	["Stormpike Soldier's Blood"] = "Blut eines Stormpike-Soldaten",
	["A Gallon of Blood"] = "Eine Gallone Blut",
	["Ivus the Forest Lord"] = "Ivus der Waldfürst",
	["Storm Crystal"] = "Sturmkristall",
	["Crystal Cluster"] = "Ivus der Waldfürst",
	["Call of Air - Slidore's Fleet"] = "Ruf der Lüfte - Slidores Luftflotte",
	["Call of Air - Vipore's Fleet"] = "Ruf der Lüfte - Vipores Luftflotte",
	["Call of Air - Ichman's Fleet"] = "Ruf der Lüfte - Ichmans Luftflotte",
	["Frostwolf Soldier's Medal"] = "Frostwolf Medaille des Soldaten",
	["Frostwolf Lieutenant's Medal"] = "Frostwolf Medaille des Lieutenants",
	["Frostwolf Commander's Medal"] = "Frostwolf Medaille des Kommandanten",
	["Call of Air - Guse's Fleet"] = "Ruf der Lüfte - Guses Luftflotte",
	["Call of Air - Jeztor's Fleet"] = "Ruf der Lüfte - Jeztors Luftflotte",
	["Call of Air - Mulverick's Fleet"] = "Ruf der Lüfte - Mulvericks Luftflotte",
	["Stormpike Soldier's Flesh"] = "Fleisch eines Stormpike-Soldaten",
	["Stormpike Lieutenant's Flesh"] = "Fleisch eines Stormpike-Lieutenants",
	["Stormpike Commander's Flesh"] = "	Fleisch eines Stormpike-Kommandanten",

	--Mark of Honor quests
	["For Great Honor"] = "Große Ehre",
	["Concerted Efforts"] = "Gemeinsames Bestreben",
	["Conquering Arathi Basin"] = "Eroberung des Arathibeckens",
	["Claiming Arathi Basin"] = "Inbesitznahme des Arathibeckens",
	["Invaders of Alterac Valley"] = "Die Invasoren des Alteractals",
	["Remember Alterac Valley!"] = "Vergesst das Alteractal nicht!",
	["Battle of Warsong Gulch"] = "Schlacht der Warsongschlucht",
	["Fight for Warsong Gultch"] = "Kampf um die Warsongschlucht",
	["Alterac Valley Mark of Honor"] = "Ehrenabzeichen des Alteractals",
	["Arathi Basin Mark of Honor"] = "Ehrenabzeichen des Arathibeckens",
	["Warsong Gulch Mark of Honor"] = "Ehrenabzeichen der Warsongschlucht",

	-- Felwood salves
	["Salve via Gathering"] = "Salbe durch Sammlung",
	["Fel Creep"] = "Teufelsunhold",
	["Salve via Mining"] = "Salbe durch Bergbau",
	["Tainted Vitriol"] = "Besudeltes Vitriol",
	["Salve via Skinning"] = "Salbe durch Kürschnerei",
	["Patch of Tainted Skin"] = "Besudelter Hautfetzen",
	["Salve via Hunting"] = "Salbe durch Jagd",
	["Corrupted Soul Shard"] = "Verderbter Seelensplitter",
	["Salve via Disenchanting"] = "Salbe durch Entzauberung",
	["Lesser Nether Essence"] = "Geringe Netheressenz",

	-- Felwood plants
	["Corrupted Whipper Root"] = "Verderbte Peitscherwurzel",
	["Corrupted Songflower"] = "Verderbte Liedblume",
	["Corrupted Windblossom"] = "Verderbte Windblüte",
	["Corrupted Night Dragon"] = "Verderbter Nachtdrache",
	["Cenarion Plant Salve"] = "Cenarische Pflanzensalbe",

	-- Thorium Shells -> Thorium Arrows Quest
	["A Fair Trade"] = "Ein fairer Handel",
	["Thorium Shells"] = "Thoriumpatronen",

	-- Ravenholdt
	["Syndicate Emblems"] = "Syndikatsembleme",
	["Syndicate Emblem"] = "Emblem des Syndikats",

	-- Cenarion
	["Encrypted Twilight Texts"] = "Verschlüsselte Texte der Twilight",
	["Encrypted Twilight Text"] = "Verschlüsselter Text der Twilight",

	-- Cenarion Expedition
	["Identify Plant Parts"] = "Identify Plant Parts",
	["Unidentified Plant Parts"] = "Unidentified Plant Parts",

	-- Argent Dawn
	["Minion's Scourgestones"] = "Geißelsteine des Dieners",
	["Minion's Scourgestone"] = "Geißelstein des Dieners",
	["Invader's Scourgestones"] = "Geißelsteine des Eindringlings",
	["Invader's Scourgestone"] = "Geißelstein des Eindringlings",
	["Corruptor's Scourgestones"] = "Geißelsteine des Verderbers",
	["Corruptor's Scourgestone"] = "Geißelstein des Verderbers",

	-- Timbermaw
	["Feathers for Grazle"] = "Federn für Grazle",
	["Feathers for Nafien"] = "Federn für Nafien",
	["Beads for Salfa"] = "Perlen für Salfa",
	["Deadwood Headdress Feather"] = "Kopfputzfeder der Totenwaldfelle",
	["Winterfall Spirit Beads"] = "Geisterperlen der Winterfelle",

	-- Cauldron quests
	["Gahrron's Withering Cauldron"] = "Der Kessel von Gahrrons Trauerfeld",
	["Writhing Haunt Cauldron"] = "Der Kessel des trostlosen Felds",
	["Felstone Field Cauldron"] = "Der Kessel des Teufelssteinfelds",
	["Dalson's Tears Cauldron"] = "Der Kessel von Dalsons Tränenfeld",
	["Arcane Quickener"] = "Arkanbeschleuniger",
	["Ectoplasmic Resonator"] = "Ektoplasmaresonator",
	["Somatic Intensifier"] = "Somatischer Verstärker",
	["Osseous Agitator"] = "Knöcherner Aufstachler",

	-- Gadgetzan
	["Water Pouch Bounty"] = "Wasserbeutelkopfgeld",
	["Wastewander Water Pouch"] = "Wasserbeutel eines Wüstenläufers",

	-- Thorium Brotherhood
	["Gaining Acceptance"] = "Erlangte Anerkennung",
	["Dark Iron Residue"] = "Dunkeleisenrückstände",
	["Restoring Fiery Flux Supplies via Kingsblood"] = "Nachschub an feurigem Fluxus: Königsblut",
	["Kingsblood"] = "Königsblut",
	["Restoring Fiery Flux Supplies via Iron"] = "Nachschub an feurigem Fluxus: Eisen",
	["Iron Bar"] = "Eisenbarren",
	["Restoring Fiery Flux Supplies via Heavy Leather"] = "Nachschub an feurigem Fluxus: Schweres Leder",
	["Heavy Leather"] = "Schweres Leder",
	["Incendosaur Scale"] = "Incendosaurierschuppe",
	["Coal"] = "Kohle",
	["Favor Amongst the Brotherhood, Dark Iron Ore"] = "Gunst der Bruderschaft, Dunkeleisenerz",
	["Dark Iron Ore"] = "Dunkeleisenerz",
	["Favor Amongst the Brotherhood, Blood of the Mountain"] = "Gunst der Bruderschaft, Blut des Berges",
	["Blood of the Mountain"] = "Blut des Berges",
	["Favor Amongst the Brotherhood, Core Leather"] = "Gunst der Bruderschaft, Kernhäute",
	["Core Leather"] = "Kernleder",
	["Favor Amongst the Brotherhood, Fiery Core"] = "Gunst der Bruderschaft, Feuerkern",
	["Fiery Core"] = "Feuerkern",
	["Favor Amongst the Brotherhood, Lava Core"] = "Gunst der Bruderschaft, Lavakern",
	["Lava Core"] = "Lavakern",

	-- City faction
	["Additional Runecloth"] = "Noch mehr Runenstoff",
	["Runecloth"] = "Runenstoff",

	-- Wildhammer faction
	["Troll Necklace Bounty"] = "Kopfgeld für Trollhalsketten",
	["Troll Tribal Necklace"] = "Troll-Stammeshalskette",

	-- E'ko quests
	["Chillwind E'ko Item"] = "E'ko einer Eiswindschimäre",
	["Chillwind E'ko Quest"] = "E'ko der Eiswindschimären",
	["Frostmaul E'ko Item"] = "E'ko der Frosthagelriesen",
	["Frostmaul E'ko Quest"] = "E'ko der Frosthagelriesen",
	["Frostsaber E'ko Item"] = "E'ko eines Frostsäblers",
	["Frostsaber E'ko Quest"] = "E'ko der Frostsäbler",
	["Ice Thistle E'ko Item"] = "E'ko eines Eisdistelyetis",
	["Ice Thistle E'ko Quest"] = "E'ko der Eisdistelyetis",
	["Shardtooth E'ko Item"] = "E'ko eines Splitterzahns",
	["Shardtooth E'ko Quest"] = "E'ko eines Splitterzahns",
	["Wildkin E'ko Item"] = "E'ko eines Wildekins",
	["Wildkin E'ko Quest"] = "E'ko der Wildekin",
	["Winterfall E'ko"] = "E'ko der Winterfelle",

	-- Zul'Gurub quests
	["Zulian, Razzashi, and Hakkari Coins"] = "Münzen der Razzashi, Hakkari und zulianische Mün",
	["Zulian Coin"] = "Zulianische Münze",
	["Razzashi Coin"] = "Münze der Razzashi",
	["Hakkari Coin"] = "Münze der Hakkari",
	["Gurubashi, Vilebranch, and Witherbark Coins"] = "Münzen der Gurubashi, Vilebranch und Witherbark",
	["Gurubashi Coin"] = "Münze der Gurubashi",
	["Vilebranch Coin"] = "Münze der Vilebranch",
	["Witherbark Coin"] = "Münze der Witherbark",
	["Sandfury, Skullsplitter, and Bloodscalp Coins"] = "Münzen der Sandfury, Skullsplitter und Blutskalp",
	["Sandfury Coin"] = "Münze der Sandfury",
	["Skullsplitter Coin"] = "Münze der Skullsplitter",
	["Bloodscalp Coin"] = "Münze der Blutskalp",
	
	-- AQ War Effort (Horde)
	["The Horde Needs More Runecloth Bandages!"] = "Die Horde braucht mehr Runenstoffbandagen!",
	["The Horde Needs More Mageweave Bandages!"] = "Die Horde braucht mehr Magiestoffbandagen!",
	["The Horde Needs More Wool Bandages!"] = "Die Horde braucht mehr Wollstoffbandagen!",
	["The Horde Needs More Rugged Leather!"] = "Die Horde braucht mehr Unverw\195\188liches Leder!",
	["The Horde Needs More Thick Leather!"] = "Die Horde braucht mehr Dickes Leder!",
	["The Horde Needs More Heavy Leather!"] = "Die Horde braucht mehr Schweres Leder!",
	["The Horde Needs More Purple Lotus!"] = "Die Horde braucht mehr Lila Lotus!",
	["The Horde Needs More Firebloom!"] = "Die Horde braucht mehr Feuerb\195\188ten!",
	["The Horde Needs More Peacebloom!"] = "Die Horde braucht mehr Friendsblume!n",
	["The Horde Needs More Mithril Bars!"] = "Die Horde braucht mehr Mithrilbarren!",
	["The Horde Needs More Tin Bars!"] = "Die Horde braucht mehr Zinnbarren!",
	["The Horde Needs More Copper Bars!"] = "Die Horde braucht mehr Kupferbarren!",
	["The Horde Needs More Lean Wolf Steaks!"] = "The Horde Needs More Lean Wolf Steaks!",
	["The Horde Needs More Spotted Yellowtail!"] = "The Horde Needs More Spotted Yellowtail!",
	["The Horde Needs More Baked Salmon!"] = "Die Horde braucht mehr R\195\164cherlachs!",
		
	-- AQ War Effort (Alliance)
	["The Alliance Needs More Linen Bandages!"] = "Die Allianz braucht mehr Leinensotffbandagen!" ,
	["The Alliance Needs More Silk Bandages!"] = "Die Allianz braucht mehr Seidenstoffbandagen!",
	["The Alliance Needs More Runecloth Bandages!"] = "Die Allianz braucht mehr Runenstoffbandagen!",
	["The Alliance Needs More Light Leather!"] = "Die Allianz braucht mehr Leichtes Leder!",
	["The Alliance Needs More Medium Leather!"] = "Die Allianz braucht mehr Mittleres Leder!",
	["The Alliance Needs More Thick Leather!"] = "Die Allianz braucht mehr Dickes Leder!",
	["The Alliance Needs More Stranglekelp!"] = "Die Allianz braucht mehr W\195\188rgetang!",
	["The Alliance Needs More Purple Lotus!"] = "Die Allianz braucht mehr Lila Lotus!",
	["The Alliance Needs More Arthas' Tears!"] = "Die Allianz braucht mehr Arthas' Tr\195\164nen!",
	["The Alliance Needs More Copper Bars!"] = "Die Allianz braucht mehr Kupferbarren!",
	["The Alliance Needs More Iron Bars!"] = "Die Allianz braucht mehr Eisenbarren!",
	["The Alliance Needs More Thorium Bars!"] = "Die Allianz braucht mehr Thoriumbarren!",
	["The Alliance Needs More Rainbow Fin Albacore!"] = "The Alliance Needs More Rainbow Fin Albacore!",
	["The Alliance Needs More Roast Raptor!"] = "The Alliance Needs More Roast Raptor!",
	["The Alliance Needs More Spotted Yellowtail!"] = "The Alliance Needs More Spotted Yellowtail!",

	-- AQ War Effort Items
	["Linen Bandage"] = "Leinenstoffbandage",
	["Wool Bandage"] = "Wollstoffandage",
	["Silk Bandage"] = "Seidenstoffbandage",
	["Mageweave Bandage"] = "Magiestoffbandage",
	["Runecloth Bandage"] = "Runenstoffbandage",
	["Light Leather"] = "Leichtes Leder",
	["Medium Leather"] = "Mittleres Leder",
	["Heavy Leather"] = "Schweres Leder",
	["Thick Leather"] = "Dickes Leder",
	["Rugged Leather"] = "Unverw\195\188stliches Leder",
	["Purple Lotus"] = "Lila Lotus",
	["Stranglekelp"] = "W\195\188rgetang",
	["Arthas' Tears"] = "Arthas' Tr\195\164nen",
	["Firebloom"] = "Feuerb\195\188te",
	["Peacebloom"] = "Friendsblume",
	["Copper Bar"] = "Kupferbarren",
	["Tin Bar"] = "Zinnbarren",
	["Iron Bar"] = "Eisenbarren",
	["Mithril Bar"] = "Mithrilbarren",
	["Thorium Bar"] = "Thoriumbarren",
	["Lean Wolf Steak"] = "Lean Wolf Steak",
	["Spotted Yellowtail"] = "Spotted Yellowtail",
	["Baked Salmon"] = "R\195\164cherlachs",
	["Roast Raptor"] = "Roast Raptor",
	["Rainbow Fin Albacore"] = "Rainbow Fin Albacore",

	-- Commendation Signets
	["One Commendation Signet"] = "One Commendation Signet",
	["Ten Commendation Signets"] = "Ten Commendation Signets",
	["Horde Commendation Signet"] = "Horde Commendation Signet",
	["Alliance Commendation Signet"] = "Alliance Commendation Signet",
} end )
