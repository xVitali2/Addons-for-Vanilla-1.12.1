local L = AceLibrary("AceLocale-2.2"):new("Automaton_Gossip")

L:RegisterTranslations("frFR", function() return {
	--------------
	-- Gossip Text
	--------------
--	["<Touch the unstable rift crystal.>"] = true,
--	["<Place my hand on the orb.>"] = true,
--	["Thank you, Stable Master. Please take the animal."] = true,
--	["With pleasure. These things stink!"] = true,
--	["Trick or Treat!"] = true,

	-------------
	-- Quest Text
	-------------
	-- Alterac Valley quests
	["Empty Stables"] = "Ecuries vides",
	["Ram Hide Harnesses"] = "Harnais en cuir de bélier",
	["Alterac Ram Hide"] = "Peau de bélier d'Alterac",
	["Ram Riding Harnesses"] = "Harnais pour béliers",
	["Frostwolf Hide"] = "Peau de loup des glaces",
	["More Booty!"] = "Plus de butin !",
	["More Armor Scraps"] = "Plus de morceaux d'armure !",
	["Armor Scraps"] = "Morceaux d'armures",
	["Coldtooth Supplies"] = "Fournitures de Froide-dent",
	["Irondeep Supplies"] = "Fournitures de Gouffrefer",
	["Lokholar the Ice Lord"] = "Lokholar le Seigneur des Glaces",
	["Stormpike Soldier's Blood"] = "Sang de soldat stormpike",
	["A Gallon of Blood"] = "Quelques litres de sang",
	["Ivus the Forest Lord"] = "Ivus le Seigneur des forêts",
	["Storm Crystal"] = "Cristal de tempête",
	["Crystal Cluster"] = "Grappes de cristaux",
	["Call of Air - Slidore's Fleet"] = "L'appel des airs - l'escadrille de Slidore",
	["Call of Air - Vipore's Fleet"] = "L'appel des airs - l'escadrille de Vipore",
	["Call of Air - Ichman's Fleet"] = "L'appel des airs - l'escadrille d'Ichman",
	["Frostwolf Soldier's Medal"] = "Médaille de soldat frostwolf",
	["Frostwolf Lieutenant's Medal"] = "Médaille de lieutenant frostwolf",
	["Frostwolf Commander's Medal"] = "	Médaille de commandant frostwolf",
	["Call of Air - Guse's Fleet"] = "L'appel des airs - l'escadrille de Guse",
	["Call of Air - Jeztor's Fleet"] = "L'appel des airs - l'escadrille de Jeztor",
	["Call of Air - Mulverick's Fleet"] = "L'appel des airs - l'escadrille de Mulverick",
	["Stormpike Soldier's Flesh"] = "Chair de soldat stormpike",
	["Stormpike Lieutenant's Flesh"] = "Chair de lieutenant stormpike",
	["Stormpike Commander's Flesh"] = "Chair de commandant stormpike",

	--Mark of Honor quests
	["For Great Honor"] = "Pour un grand honneur",
	["Concerted Efforts"] = "Des efforts concertés",
	["Conquering Arathi Basin"] = "La conquête du bassin d'Arathi",
	["Claiming Arathi Basin"] = "La revendication du bassin d'Arathi",
	["Invaders of Alterac Valley"] = "Les envahisseurs de la vallée d'Alterac",
	["Remember Alterac Valley!"] = "Souvenez-vous de la vallée d'Alterac !",
	["Battle of Warsong Gulch"] = "La bataille du goulet des Warsong",
	["Fight for Warsong Gultch"] = "La lutte pour le goulet des Warsong",
	["Alterac Valley Mark of Honor"] = "Marque d'honneur de la vallée d'Alterac",
	["Arathi Basin Mark of Honor"] = "Marque d'honneur du bassin d'Arathi",
	["Warsong Gulch Mark of Honor"] = "Marque d'honneur du goulet des Warsong",

	-- Felwood salves
	["Salve via Gathering"] = "Du baume contre une récolte",
	["Fel Creep"] = "Gangrimpante",
	["Salve via Mining"] = "Du baume par la pioche",
	["Tainted Vitriol"] = "Vitriol contaminé",
	["Salve via Skinning"] = "Du baume contre des peaux",
	["Patch of Tainted Skin"] = "Morceau de peau contaminée",
	["Salve via Hunting"] = "Du baume en chassant",
	["Corrupted Soul Shard"] = "Fragment d'âme corrompue",
	["Salve via Disenchanting"] = "Du baume contre des désenchantements",
	["Lesser Nether Essence"] = "Essence du néant inférieure",

	-- Felwood plants
	["Corrupted Whipper Root"] = "La navetille corrompue",
	["Corrupted Songflower"] = "La fleur-de-chant corrompue",
	["Corrupted Windblossom"] = "La fleur-de-vent corrompue",
	["Corrupted Night Dragon"] = "Dragon nocturne corrompu",
	["Cenarion Plant Salve"] = "Baume végétal cénarien",

	-- Thorium Shells -> Thorium Arrows Quest
	-- ["A Fair Trade"] = true,
	-- ["Thorium Shells"] = true,

	-- Ravenholdt
	["Syndicate Emblems"] = "Emblèmes du Syndicat",
	["Syndicate Emblem"] = "Emblème du Syndicat",

	-- Cenarion
	["Encrypted Twilight Texts"] = "Les textes du crépuscule cryptés",
	["Encrypted Twilight Text"] = "Texte du crépuscule crypté",

	-- Cenarion Expedition
	-- ["Identify Plant Parts"] = true,
	-- ["Unidentified Plant Parts"] = true,

	-- Argent Dawn
	["Minion's Scourgestones"] = "Pierre du Fléau des serviteurs",
	["Minion's Scourgestone"] = "Pierre du Fléau des serviteurs",
	["Invader's Scourgestones"] = "Pierres du Fléau des envahisseurs",
	["Invader's Scourgestone"] = "Pierre du Fléau des envahisseurs",
	["Corruptor's Scourgestones"] = "Pierres du Fléau des corrupteurs",
	["Corruptor's Scourgestone"] = "Pierre du Fléau des corrupteurs",

	-- Timbermaw
	["Feathers for Grazle"] = "Des plumes pour Grifleur",
	["Feathers for Nafien"] = "Des plumes pour Nafien",
	["Beads for Salfa"] = "Des perles pour Salfa",
	["Deadwood Headdress Feather"] = "Coiffure de plumes mort-bois",
	["Winterfall Spirit Beads"] = "Perles d'esprit tombe-hiver",

	-- Cauldron quests
	["Gahrron's Withering Cauldron"] = "Chaudron de la Flétrissure de Gahrron",
	["Writhing Haunt Cauldron"] = "Le Chaudron du Repaire putride",
	["Felstone Field Cauldron"] = "Le Chaudron du champ de Felstone",
	["Dalson's Tears Cauldron"] = "Chaudron des Larmes de Dalson",
	["Arcane Quickener"] = "Catalyseur des arcanes",
	["Ectoplasmic Resonator"] = "Résonateur ectoplasmique",
	["Somatic Intensifier"] = "Intensificateur somatique",
	["Osseous Agitator"] = "Agitateur osseux",

	-- Gadgetzan
	["Water Pouch Bounty"] = "Prime de la poche à eau",
	["Wastewander Water Pouch"] = "Outre de Bat-le-désert",

	-- Thorium Brotherhood
	["Gaining Acceptance"] = "Se faire accepter",
	["Dark Iron Residue"] = "Résidu de sombrefer",
	["Restoring Fiery Flux Supplies via Kingsblood"] = "Réapprovisionnement en flux embrasé (Sang-royal)",
	["Kingsblood"] = "Sang-royal",
	["Restoring Fiery Flux Supplies via Iron"] = "Réapprovisionnement en flux embrasé (Fer)",
	["Iron Bar"] = "Barre de fer",
	["Restoring Fiery Flux Supplies via Heavy Leather"] = "Réapprovisionnement en flux embrasé (Cuir lourd)",
	["Heavy Leather"] = "Cuir lourd",
	["Incendosaur Scale"] = "Ecaille d'Incendosaure",
	["Coal"] = "Charbon",
	["Favor Amongst the Brotherhood, Dark Iron Ore"] = "Faveur auprès de la Confrérie, Minerai de sombre",
	["Dark Iron Ore"] = "Minerai de sombrefer",
	["Favor Amongst the Brotherhood, Blood of the Mountain"] = "Faveur auprès de la Confrérie, Sang de la montagne",
	["Blood of the Mountain"] = "Sang de la montagne",
	["Favor Amongst the Brotherhood, Core Leather"] = "Faveur auprès de la Confrérie, Cuir du Magma",
	["Core Leather"] = "Cuir du Magma",
	["Favor Amongst the Brotherhood, Fiery Core"] = "Faveur auprès de la Confrérie, Noyau de feu",
	["Fiery Core"] = "Noyau de feu",
	["Favor Amongst the Brotherhood, Lava Core"] = "Faveur auprès de la Confrérie, Noyau de lave",
	["Lava Core"] = "Noyau de lave",

	-- City faction
	["Additional Runecloth"] = "Encore de l'étoffe runique",
	["Runecloth"] = "Etoffe runique",

	-- Wildhammer faction
	["Troll Necklace Bounty"] = "Chasse aux colliers trolls",
	["Troll Tribal Necklace"] = "Collier tribal troll",

	-- E'ko quests
	["Chillwind E'ko Item"] = "E'ko de Noroît",
	["Chillwind E'ko Quest"] = "L'E'ko de Noroît",
	["Frostmaul E'ko Item"] = "E'ko de Cognegivre",
	["Frostmaul E'ko Quest"] = "L'E'ko de Cognegivre",
	["Frostsaber E'ko Item"] = "E'ko de sabre-de-givre",
	["Frostsaber E'ko Quest"] = "L'E'ko des sabres-de-givre",
	["Ice Thistle E'ko Item"] = "E'ko de Chardon de glace",
	["Ice Thistle E'ko Quest"] = "L'E'ko des Chardon de Glace",
	["Shardtooth E'ko Item"] = "E'ko de Croc acéré",
	["Shardtooth E'ko Quest"] = "L'E'ko des Crocs acérés",
	["Wildkin E'ko Item"] = "E'ko d'Indomptable",
	["Wildkin E'ko Quest"] = "L'E'ko des Indomptables",
	["Winterfall E'ko"] = "E'ko des Tombe-hiver",

	-- Zul'Gurub quests
	["Zulian, Razzashi, and Hakkari Coins"] = "Pièces zuliennes, razzashi et hakkari",
	["Zulian Coin"] = "Pièce zulienne",
	["Razzashi Coin"] = "Pièce Razzashi",
	["Hakkari Coin"] = "Pièce hakkari",
	["Gurubashi, Vilebranch, and Witherbark Coins"] = "Pièces Gurubashi, Vilebranch et Witherbark",
	["Gurubashi Coin"] = "Pièce Gurubashi",
	["Vilebranch Coin"] = "Pièce Vilebranch",
	["Witherbark Coin"] = "Pièce Witherbark",
	["Sandfury, Skullsplitter, and Bloodscalp Coins"] = "Pièces Sandfury, Skullsplitter et Bloodscalp",
	["Sandfury Coin"] = "Pièce Sandfury",
	["Skullsplitter Coin"] = "Pièce Skullsplitter",
	["Bloodscalp Coin"] = "Pièce Bloodscalp",
	
	-- AQ War Effort (Horde)
--	["The Horde Needs More Runecloth Bandages!"] = true,
--	["The Horde Needs More Mageweave Bandages!"] = true,
--	["The Horde Needs More Wool Bandages!"] = true,
--	["The Horde Needs More Rugged Leather!"] = true,
--	["The Horde Needs More Thick Leather!"] = true,
--	["The Horde Needs More Heavy Leather!"] = true,
--	["The Horde Needs More Purple Lotus!"] = true,
--	["The Horde Needs More Firebloom!"] = true,
--	["The Horde Needs More Peacebloom!"] = true,
--	["The Horde Needs More Mithril Bars!"] = true,
--	["The Horde Needs More Tin Bars!"] = true,
--	["The Horde Needs More Copper Bars!"] = true,
--	["The Horde Needs More Lean Wolf Steaks!"] = true,
--	["The Horde Needs More Spotted Yellowtail!"] = true,
--	["The Horde Needs More Baked Salmon!"] = true,
		
	-- AQ War Effort (Alliance)
--	["The Alliance Needs More Linen Bandages!"] = true,
--	["The Alliance Needs More Silk Bandages!"] = true,
--	["The Alliance Needs More Runecloth Bandages!"] = true,
--	["The Alliance Needs More Light Leather!"] = true,
--	["The Alliance Needs More Medium Leather!"] = true,
--	["The Alliance Needs More Thick Leather!"] = true,
--	["The Alliance Needs More Stranglekelp!"] = true,
--	["The Alliance Needs More Purple Lotus!"] = true,
--	["The Alliance Needs More Arthas' Tears!"] = true,
--	["The Alliance Needs More Copper Bars!"] = true,
--	["The Alliance Needs More Iron Bars!"] = true,
--	["The Alliance Needs More Thorium Bars!"] = true,
--	["The Alliance Needs More Rainbow Fin Albacore!"] = true,
--	["The Alliance Needs More Roast Raptor!"] = true,
--	["The Alliance Needs More Spotted Yellowtail!"] = true,

	-- AQ War Effort Items
--	["Linen Bandage"] = true,
--	["Wool Bandage"] = true,
--	["Silk Bandage"] = true,
--	["Mageweave Bandage"] = true,
--	["Runecloth Bandage"] = true,
--	["Light Leather"] = true,
--	["Medium Leather"] = true,
	["Heavy Leather"] = "Cuir lourd",
--	["Thick Leather"] = true,
--	["Rugged Leather"] = true,
--	["Purple Lotus"] = true,
--	["Stranglekelp"] = true,
--	["Arthas' Tears"] = true,
--	["Firebloom"] = true,
--	["Peacebloom"] = true,
--	["Copper Bar"] = true,
--	["Tin Bar"] = true,
	["Iron Bar"] = "Barre de fer",
--	["Mithril Bar"] = true,
--	["Thorium Bar"] = true,
--	["Lean Wolf Steak"] = true,
--	["Spotted Yellowtail"] = true,
--	["Baked Salmon"] = true,
--	["Roast Raptor"] = true,
--	["Rainbow Fin Albacore"] = true,

	-- Commendation Signets
--	["One Commendation Signet"] = true,
--	["Ten Commendation Signets"] = true,
--	["Horde Commendation Signet"] = true,
--	["Alliance Commendation Signet"] = true,
} end )
