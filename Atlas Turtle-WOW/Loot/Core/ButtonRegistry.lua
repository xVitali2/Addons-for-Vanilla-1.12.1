local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot")

local BC = AceLibrary("Babble-Class-2.2")
local BS = AceLibrary("Babble-Spell-2.2")
local BB = AceLibrary("Babble-Boss-2.2")
local BF = AceLibrary("Babble-Faction-2.2")
local BZ = AceLibrary("Babble-Zone-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2")

AtlasLoot_ButtonRegistry = {
	--WoW Instances
	["HQHighForemanBargulBlackhammer"] = {
		Title = "High Foreman Bargul Blackhammer",
		Next_Page = "HQEngineerFiggles",
		Next_Title = "Engineer Figgles"
	},
	["HQEngineerFiggles"] = {
		Title = "Engineer Figgles",
		Next_Page = "HQCorrosis",
		Next_Title = "Corrosis",
		Prev_Page = "HQHighForemanBargulBlackhammer",
		Prev_Title = "High Foreman Bargul Blackhammer"
	},
	["HQCorrosis"] = {
		Title = "Corrosis",
		Next_Page = "HQHatereaverAnnihilator",
		Next_Title = "Hatereaver Annihilator",
		Prev_Page = "HQEngineerFiggles",
		Prev_Title = "Engineer Figgles"
	},
	["HQHatereaverAnnihilator"] = {
		Title = "Hatereaver Annihilator",
		Next_Page = "HQHargeshDoomcaller",
		Next_Title = "Hargesh Doomcaller",
		Prev_Page = "HQCorrosis",
		Prev_Title = "Corrosis"
	},
	["HQHargeshDoomcaller"] = {
		Title = "Hargesh Doomcaller",
		Next_Page = "HQTrash",
		Next_Title = AL["Trash Mobs"],
		Prev_Page = "HQHatereaverAnnihilator",
		Prev_Title = "Hatereaver Annihilator"
	},
	["HQTrash"] = {
		Title = AL["Trash Mobs"],
		Prev_Page = "HQHargeshDoomcaller",
		Prev_Title = "Hargesh Doomcaller",
	},
	["BRDLordRoccor"] = {
		Title = "Lord Roccor",
		Next_Page = "BRDHighInterrogatorGerstahn",
		Next_Title = "High Interrogator Gerstahn"
	},
	["BRDHighInterrogatorGerstahn"] = {
		Title = "High Interrogator Gerstahn",
		Next_Page = "BRDAnubshiah",
		Next_Title = "Anub'shiah",
		Prev_Page = "BRDLordRoccor",
		Prev_Title = "Lord Roccor"
	},
	["BRDAnubshiah"] = {
		Title = "Anub'shiah",
		Next_Page = "BRDEviscerator",
		Next_Title = "Eviscerator",
		Prev_Page = "BRDHighInterrogatorGerstahn",
		Prev_Title = "High Interrogator Gerstahn",
	},
	["BRDEviscerator"] = {
		Title = "Eviscerator",
		Next_Page = "BRDGorosh",
		Next_Title = "Gorosh the Dervish",
		Prev_Page = "BRDAnubshiah",
		Prev_Title = "Anub'shiah",
	},
	["BRDGorosh"] = {
		Title = "Gorosh the Dervish",
		Next_Page = "BRDGrizzle",
		Next_Title = "Grizzle",
		Prev_Page = "BRDEviscerator",
		Prev_Title = "Eviscerator",
	},
	["BRDGrizzle"] = {
		Title = "Grizzle",
		Next_Page = "BRDHedrum",
		Next_Title = "Hedrum the Creeper",
		Prev_Page = "BRDGorosh",
		Prev_Title = "Gorosh the Dervish",
	},
	["BRDHedrum"] = {
		Title = "Hedrum the Creeper",
		Next_Page = "BRDOkthor",
		Next_Title = "Ok'thor the Breaker",
		Prev_Page = "BRDGrizzle",
		Prev_Title = "Grizzle",
	},
	["BRDOkthor"] = {
		Title = "Ok'thor the Breaker",
		Next_Page = "BRDTheldren",
		Next_Title = "Theldren",
		Prev_Page = "BRDHedrum",
		Prev_Title = "Hedrum the Creeper",
	},
	["BRDTheldren"] = {
		Title = "Theldren",
		Next_Page = "BRDHoundmaster",
		Next_Title = "Houndmaster Grebmar",
		Prev_Page = "BRDOkthor",
		Prev_Title = "Ok'thor the Breaker",
	},
	["BRDHoundmaster"] = {
		Title = "Houndmaster Grebmar",
		Next_Page = "BRDPyromancerLoregrain",
		Next_Title = "Pyromancer Loregrain".." ("..AL["Rare"]..")",
		Prev_Page = "BRDTheldren",
		Prev_Title = "Theldren",
	},
	["BRDPyromancerLoregrain"] = {
		Title = "Pyromancer Loregrain".." ("..AL["Rare"]..")",
		Next_Page = "BRDTheVault",
		Next_Title = "The Vault",
		Prev_Page = "BRDHoundmaster",
		Prev_Title = "Houndmaster Grebmar",
	},
	["BRDTheVault"] = {
		Title = "The Vault",
		Next_Page = "BRDWarderStilgiss",
		Next_Title = "Warder Stilgiss".." ("..AL["Rare"]..")",
		Prev_Page = "BRDPyromancerLoregrain",
		Prev_Title = "Pyromancer Loregrain".." ("..AL["Rare"]..")",
	},
	["BRDWarderStilgiss"] = {
		Title = "Warder Stilgiss".." ("..AL["Rare"]..")",
		Next_Page = "BRDVerek",
		Next_Title = "Verek".." ("..AL["Rare"]..")",
		Prev_Page = "BRDTheVault",
		Prev_Title = "The Vault",
	},
	["BRDVerek"] = {
		Title = "Verek".." ("..AL["Rare"]..")",
		Next_Page = "BRDFineousDarkvire",
		Next_Title = "Fineous Darkvire",
		Prev_Page = "BRDWarderStilgiss",
		Prev_Title = "Warder Stilgiss".." ("..AL["Rare"]..")",
	},
	["BRDFineousDarkvire"] = {
		Title = "Fineous Darkvire",
		Next_Page = "BRDLordIncendius",
		Next_Title = "Lord Incendius",
		Prev_Page = "BRDVerek",
		Prev_Title = "Verek".." ("..AL["Rare"]..")",
	},
	["BRDLordIncendius"] = {
		Title = "Lord Incendius",
		Next_Page = "BRDBaelGar",
		Next_Title = "Bael'Gar",
		Prev_Page = "BRDFineousDarkvire",
		Prev_Title = "Fineous Darkvire",
	},
	["BRDBaelGar"] = {
		Title = "Bael'Gar",
		Next_Page = "BRDGeneralAngerforge",
		Next_Title = "General Angerforge",
		Prev_Page = "BRDLordIncendius",
		Prev_Title = "Lord Incendius",
	},
	["BRDGeneralAngerforge"] = {
		Title = "General Angerforge",
		Next_Page = "BRDGolemLordArgelmach",
		Next_Title = "Golem Lord Argelmach",
		Prev_Page = "BRDBaelGar",
		Prev_Title = "Bael'Gar",
	},
	["BRDGolemLordArgelmach"] = {
		Title = "Golem Lord Argelmach",
		Next_Page = "BRDGuzzler",
		Next_Title = "The Grim Guzzler",
		Prev_Page = "BRDGeneralAngerforge",
		Prev_Title = "General Angerforge",
	},
	["BRDGuzzler"] = {
		Title = "The Grim Guzzler",
		Next_Page = "BRDFlamelash",
		Next_Title = "Ambassador Flamelash",
		Prev_Page = "BRDGolemLordArgelmach",
		Prev_Title = "Golem Lord Argelmach",
	},
	["BRDFlamelash"] = {
		Title = "Ambassador Flamelash",
		Next_Page = "BRDPanzor",
		Next_Title = "Panzor the Invincible".." ("..AL["Rare"]..")",
		Prev_Page = "BRDGuzzler",
		Prev_Title = "The Grim Guzzler",
	},
	["BRDPanzor"] = {
		Title = "Panzor the Invincible".." ("..AL["Rare"]..")",
		Next_Page = "BRDTomb",
		Next_Title = "Summoner's Tomb",
		Prev_Page = "BRDFlamelash",
		Prev_Title = "Ambassador Flamelash",
	},
	["BRDTomb"] = {
		Title = "Summoner's Tomb",
		Next_Page = "BRDMagmus",
		Next_Title = "Magmus",
		Prev_Page = "BRDPanzor",
		Prev_Title = "Panzor the Invincible".." ("..AL["Rare"]..")",
	},
	["BRDMagmus"] = {
		Title = "Magmus",
		Next_Page = "BRDPrincess",
		Next_Title = "Princess Moira Bronzebeard",
		Prev_Page = "BRDTomb",
		Prev_Title = "Summoner's Tomb",
	},
	["BRDPrincess"] = {
		Title = "Princess Moira Bronzebeard",
		Next_Page = "BRDEmperorDagranThaurissan",
		Next_Title = "Emperor Dagran Thaurissan",
		Prev_Page = "BRDMagmus",
		Prev_Title = "Magmus",
	},
	["BRDEmperorDagranThaurissan"] = {
		Title = "Emperor Dagran Thaurissan",
		Next_Page = "BRDTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "BRDPrincess",
		Prev_Title = "Princess Moira Bronzebeard",
	},
	["BRDTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "BRDEmperorDagranThaurissan",
		Prev_Title = "Emperor Dagran Thaurissan",
	},
	["LBRSSpirestoneButcher"] = {
		Title = "Spirestone Butcher".." ("..AL["Rare"]..")",
		Next_Page = "LBRSSpirestoneBattleLord",
		Next_Title = "Spirestone Battle Lord".." ("..AL["Rare"]..")",
	},
	["LBRSSpirestoneBattleLord"] = {
		Title = "Spirestone Battle Lord".." ("..AL["Rare"]..")",
		Next_Page = "LBRSSpirestoneLordMagus",
		Next_Title = "Spirestone Lord Magus".." ("..AL["Rare"]..")",
		Prev_Page = "LBRSSpirestoneButcher",
		Prev_Title = "Spirestone Butcher".." ("..AL["Rare"]..")",
	},
	["LBRSSpirestoneLordMagus"] = {
		Title = "Spirestone Lord Magus".." ("..AL["Rare"]..")",
		Next_Page = "LBRSOmokk",
		Next_Title = "Highlord Omokk",
		Prev_Page = "LBRSSpirestoneBattleLord",
		Prev_Title = "Spirestone Battle Lord".." ("..AL["Rare"]..")",
	},
	["LBRSOmokk"] = {
		Title = "Highlord Omokk",
		Next_Page = "LBRSVosh",
		Next_Title = "Shadow Hunter Vosh'gajin",
		Prev_Page = "LBRSSpirestoneLordMagus",
		Prev_Title = "Spirestone Lord Magus".." ("..AL["Rare"]..")",
	},
	["LBRSVosh"] = {
		Title = "Shadow Hunter Vosh'gajin",
		Next_Page = "LBRSVoone",
		Next_Title = "War Master Voone",
		Prev_Page = "LBRSOmokk",
		Prev_Title = "Highlord Omokk",
	},
	["LBRSVoone"] = {
		Title = "War Master Voone",
		Next_Page = "LBRSFelguard",
		Next_Title = "Burning Felguard".." ("..AL["Rare"]..")",
		Prev_Page = "LBRSVosh",
		Prev_Title = "Shadow Hunter Vosh'gajin",
	},
	["LBRSFelguard"] = {
		Title = "Burning Felguard".." ("..AL["Rare"]..")",
		Next_Page = "LBRSGrayhoof",
		Next_Title = "Mor Grayhoof",
		Prev_Page = "LBRSVoone",
		Prev_Title = "War Master Voone",
	},
	["LBRSGrayhoof"] = {
		Title = "Mor Grayhoof",
		Next_Page = "LBRSGrimaxe",
		Next_Title = "Bannok Grimaxe".." ("..AL["Rare"]..")",
		Prev_Page = "LBRSFelguard",
		Prev_Title = "Burning Felguard".." ("..AL["Rare"]..")",
	},
	["LBRSGrimaxe"] = {
		Title = "Bannok Grimaxe".." ("..AL["Rare"]..")",
		Next_Page = "LBRSSmolderweb",
		Next_Title = "Mother Smolderweb",
		Prev_Page = "LBRSGrayhoof",
		Prev_Title = "Mor Grayhoof",
	},
	["LBRSSmolderweb"] = {
		Title = "Mother Smolderweb",
		Next_Page = "LBRSCrystalFang",
		Next_Title = "Crystal Fang".." ("..AL["Rare"]..")",
		Prev_Page = "LBRSGrimaxe",
		Prev_Title = "Bannok Grimaxe".." ("..AL["Rare"]..")",
	},
	["LBRSCrystalFang"] = {
		Title = "Crystal Fang".." ("..AL["Rare"]..")",
		Next_Page = "LBRSDoomhowl",
		Next_Title = "Urok Doomhowl",
		Prev_Page = "LBRSSmolderweb",
		Prev_Title = "Mother Smolderweb",
	},
	["LBRSDoomhowl"] = {
		Title = "Urok Doomhowl",
		Next_Page = "LBRSZigris",
		Next_Title = "Quartermaster Zigris",
		Prev_Page = "LBRSCrystalFang",
		Prev_Title = "Crystal Fang".." ("..AL["Rare"]..")",
	},
	["LBRSZigris"] = {
		Title = "Quartermaster Zigris",
		Next_Page = "LBRSHalycon",
		Next_Title = "Halycon",
		Prev_Page = "LBRSDoomhowl",
		Prev_Title = "Urok Doomhowl",
	},
	["LBRSHalycon"] = {
		Title = "Halycon",
		Next_Page = "LBRSSlavener",
		Next_Title = "Gizrul the Slavener",
		Prev_Page = "LBRSZigris",
		Prev_Title = "Quartermaster Zigris",
	},
	["LBRSSlavener"] = {
		Title = "Gizrul the Slavener",
		Next_Page = "LBRSBashguud",
		Next_Title = "Ghok Bashguud".." ("..AL["Rare"]..")",
		Prev_Page = "LBRSHalycon",
		Prev_Title = "Halycon",
	},
	["LBRSBashguud"] = {
		Title = "Ghok Bashguud".." ("..AL["Rare"]..")",
		Next_Page = "LBRSWyrmthalak",
		Next_Title = "Overlord Wyrmthalak",
		Prev_Page = "LBRSSlavener",
		Prev_Title = "Gizrul the Slavener",
	},
	["LBRSWyrmthalak"] = {
		Title = "Overlord Wyrmthalak",
		Next_Page = "LBRSTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "LBRSBashguud",
		Prev_Title = "Ghok Bashguud".." ("..AL["Rare"]..")",
	},
	["LBRSTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "LBRSWyrmthalak",
		Prev_Title = "Overlord Wyrmthalak",
	},
	["UBRSEmberseer"] = {
		Title = "Pyroguard Emberseer",
		Next_Page = "UBRSSolakar",
		Next_Title = "Solakar Flamewreath",
	},
	["UBRSSolakar"] = {
		Title = "Solakar Flamewreath",
		Next_Page = "UBRSFlame",
		Next_Title = "Father Flame",
		Prev_Page = "UBRSEmberseer",
		Prev_Title = "Pyroguard Emberseer",
	},
	["UBRSFlame"] = {
		Title = "Father Flame",
		Next_Page = "UBRSRunewatcher",
		Next_Title = "Jed Runewatcher".." ("..AL["Rare"]..")",
		Prev_Page = "UBRSSolakar",
		Prev_Title = "Solakar Flamewreath",
	},
	["UBRSRunewatcher"] = {
		Title = "Jed Runewatcher".." ("..AL["Rare"]..")",
		Next_Page = "UBRSAnvilcrack",
		Next_Title = "Goraluk Anvilcrack".." ("..AL["Rare"]..")",
		Prev_Page = "UBRSFlame",
		Prev_Title = "Father Flame",
	},
	["UBRSAnvilcrack"] = {
		Title = "Goraluk Anvilcrack".." ("..AL["Rare"]..")",
		Next_Page = "UBRSRend",
		Next_Title = "Warchief Rend Blackhand",
		Prev_Page = "UBRSRunewatcher",
		Prev_Title = "Jed Runewatcher".." ("..AL["Rare"]..")",
	},
	["UBRSRend"] = {
		Title = "Warchief Rend Blackhand",
		Next_Page = "UBRSGyth",
		Next_Title = "Gyth",
		Prev_Page = "UBRSAnvilcrack",
		Prev_Title = "Goraluk Anvilcrack".." ("..AL["Rare"]..")",
	},
	["UBRSGyth"] = {
		Title = "Gyth",
		Next_Page = "UBRSBeast",
		Next_Title = "The Beast",
		Prev_Page = "UBRSRend",
		Prev_Title = "Warchief Rend Blackhand",
	},
	["UBRSBeast"] = {
		Title = "The Beast",
		Next_Page = "UBRSValthalak",
		Next_Title = "Lord Valthalak",
		Prev_Page = "UBRSGyth",
		Prev_Title = "Gyth",
	},
	["UBRSValthalak"] = {
		Title = "Lord Valthalak",
		Next_Page = "UBRSDrakkisath",
		Next_Title = "General Drakkisath",
		Prev_Page = "UBRSBeast",
		Prev_Title = "The Beast",
	},
	["UBRSDrakkisath"] = {
		Title = "General Drakkisath",
		Next_Page = "UBRSTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "UBRSValthalak",
		Prev_Title = "Lord Valthalak",
	},
	["UBRSTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "UBRSDrakkisath",
		Prev_Title = "General Drakkisath",
	},
	["KCMarrowspike"] = {
		Title = "Marrowspike",
		Next_Page = "KCHivaxxis",
		Next_Title = "Hivaxxis",
	},
	["KCHivaxxis"] = {
		Title = "Hivaxxis",
		Next_Page = "KCCorpsemuncher",
		Next_Title = "Corpsemuncher",
		Prev_Page = "KCMarrowspike",
		Prev_Title = "Marrowspike",
	},
	["KCCorpsemuncher"] = {
		Title = "Corpsemuncher",
		Next_Page = "KCGuardCaptainGort",
		Next_Title = "Guard Captain Gort",
		Prev_Page = "KCHivaxxis",
		Prev_Title = "Hivaxxis",
	},
	["KCGuardCaptainGort"] = {
		Title = "Guard Captain Gort",
		Next_Page = "KCArchlichEnkhraz",
		Next_Title = "Archlich Enkhraz",
		Prev_Page = "KCCorpsemuncher",
		Prev_Title = "Corpsemuncher",
	},
	["KCArchlichEnkhraz"] = {
		Title = "Archlich Enkhraz",
		Next_Page = "KCCommanderAnderson",
		Next_Title = "Commander Anderson",
		Prev_Page = "KCGuardCaptainGort",
		Prev_Title = "Guard Captain Gort",
	},
	["KCCommanderAnderson"] = {
		Title = "Commander Anderson",
		Next_Page = "KCAlarus",
		Next_Title = "Alarus",
		Prev_Page = "KCArchlichEnkhraz",
		Prev_Title = "Archlich Enkhraz",
	},
	["KCAlarus"] = {
		Title = "Alarus",
		Next_Page = "KCTreasure",
		Next_Title = "Half-Buried Treasure Chest",
		Prev_Page = "KCCommanderAnderson",
		Prev_Title = "Commander Anderson",
	},
	["KCTreasure"] = {
		Title = "Half-Buried Treasure Chest",
		Prev_Page = "KCAlarus",
		Prev_Title = "Alarus",
		Next_Page = "KCTrash",
		Next_Title = AL["Trash Mobs"],
	},
	["KCTrash"] = {
		Title = AL["Trash Mobs"],
		Prev_Page = "KCTreasure",
		Prev_Title = "Half-Buried Treasure Chest",
		Next_Page = "KCMarrowspike",
		Next_Title = "Marrowspike",
	},
	["COTBMChronar"] = {
		Title = "Chronar",
		Next_Page = "COTBMHarbingerAphygth",
		Next_Title = "Harbinger Aph'ygth",
		Prev_Page = "COTTrash",
		Prev_Title = AL["Trash Mobs"],
	},
	["COTBMHarbingerAphygth"] = {
		Title = "Harbinger Aph'ygth",
		Next_Page = "COTBMEpidamu",
		Next_Title = "Epidamu",
		Prev_Page = "COTBMChronar",
		Prev_Title = "Chronar",
	},
	["COTBMEpidamu"] = {
		Title = "Epidamu",
		Next_Page = "COTBMDriftingAvatar",
		Next_Title = "Drifting Avatar of Time",
		Prev_Page = "COTBMChronar",
		Prev_Title = "Chronar",
	},
	["COTBMDriftingAvatar"] = {
		Title = "Drifting Avatar of Time",
		Next_Page = "COTBMTimeLordEpochronos",
		Next_Title = "Time-Lord Epochronos",
		Prev_Page = "COTBMEpidamu",
		Prev_Title = "Epidamu",
	},
	["COTBMTimeLordEpochronos"] = {
		Title = "Time-Lord Epochronos",
		Next_Page = "COTBMMossheart",
		Next_Title = "Mossheart",
		Prev_Page = "COTBMDriftingAvatar",
		Prev_Title = "Drifting Avatar of Time",
	},
	["COTBMMossheart"] = {
		Title = "Mossheart",
		Next_Page = "COTBMRotmaw",
		Next_Title = "Rotmaw",
		Prev_Page = "COTBMTimeLordEpochronos",
		Prev_Title = "Time-Lord Epochronos",
	},
	["COTBMRotmaw"] = {
		Title = "Rotmaw",
		Next_Page = "COTBMAntnormi",
		Next_Title = "Antnormi",
		Prev_Page = "COTBMMossheart",
		Prev_Title = "Mossheart",
	},
	["COTBMAntnormi"] = {
		Title = "Antnormi",
		Next_Page = "COTTrash",
		Next_Title = AL["Trash Mobs"],
		Prev_Page = "COTBMRotmaw",
		Prev_Title = "Rotmaw",
	},
	["COTTrash"] = {
		Title = AL["Trash Mobs"],
		Next_Page = "COTBMChronar",
		Next_Title = "Chronar",
		Prev_Page = "COTBMAntnormi",
		Prev_Title = "Antnormi",
	},
	--["COTBMInfiniteChromie"] = {
	--   Title = "Infinite Chromie",
	--  Prev_Page = "COTBMAntnormi",
	--     Prev_Title = "Antnormi",
	--},
	["SWVAszoshGrimflame"] = {
		Title = "Aszosh Grimflame",
		Prev_Page = "SWVTrash",
		Prev_Title =  AL["Trash Mobs"],
		Next_Page = "SWVThamGrarr",
		Next_Title = "Tham'Grarr",
	},
	["SWVThamGrarr"] = {
		Title = "Tham'Grarr",
		Next_Page = "SWVBlackBride",
		Next_Title = "Black Bride",
		Prev_Page = "SWVAszoshGrimflame",
		Prev_Title = "Aszosh Grimflame",
	},
	["SWVBlackBride"] = {
		Title = "Black Bride",
		Next_Page = "SWVDamian",
		Next_Title = "Damian",
		Prev_Page = "SWVThamGrarr",
		Prev_Title = "Tham'Grarr",
	},
	["SWVDamian"] = {
		Title = "Damian",
		Next_Page = "SWVVolkanCruelblade",
		Next_Title = "Volkan Cruelblade",
		Prev_Page = "SWVBlackBride",
		Prev_Title = "Black Bride",
	},
	["SWVVolkanCruelblade"] = {
		Title = "Volkan Cruelblade",
		Next_Page = "SWVVaultArmoryEquipment",
		Next_Title = "Arc'tiras / Vault Armory Equipment",
		Prev_Page = "SWVDamian",
		Prev_Title = "Damian",
	},
	["SWVVaultArmoryEquipment"] = {
		Title = "Arc'tiras / Vault Armory Equipment",
		Prev_Page = "SWVVolkanCruelblade",
		Prev_Title = "Volkan Cruelblade",
		Next_Page = "SWVTrash",
		Next_Title = AL["Trash Mobs"],
	},
	["SWVTrash"] = {
		Title = AL["Trash Mobs"],
		Prev_Page = "SWVVaultArmoryEquipment",
		Prev_Title = "Arc'tiras / Vault Armory Equipment",
		Next_Page = "SWVAszoshGrimflame",
		Next_Title = "Aszosh Grimflame",
	},
	["BWLRazorgore"] = {
		Title = "Razorgore the Untamed",
		Next_Page = "BWLVaelastrasz",
		Next_Title = "Vaelastrasz the Corrupt",
	},
	["BWLVaelastrasz"] = {
		Title = "Vaelastrasz the Corrupt",
		Next_Page = "BWLLashlayer",
		Next_Title = "Broodlord Lashlayer",
		Prev_Page = "BWLRazorgore",
		Prev_Title = "Razorgore the Untamed",
	},
	["BWLLashlayer"] = {
		Title = "Broodlord Lashlayer",
		Next_Page = "BWLFiremaw",
		Next_Title = "Firemaw",
		Prev_Page = "BWLVaelastrasz",
		Prev_Title = "Vaelastrasz the Corrupt",
	},
	["BWLFiremaw"] = {
		Title = "Firemaw",
		Next_Page = "BWLEbonroc",
		Next_Title = "Ebonroc",
		Prev_Page = "BWLLashlayer",
		Prev_Title = "Broodlord Lashlayer",
	},
	["BWLEbonroc"] = {
		Title = "Ebonroc",
		Next_Page = "BWLFlamegor",
		Next_Title = "Flamegor",
		Prev_Page = "BWLFiremaw",
		Prev_Title = "Firemaw",
	},
	["BWLFlamegor"] = {
		Title = "Flamegor",
		Next_Page = "BWLChromaggus",
		Next_Title = "Chromaggus",
		Prev_Page = "BWLEbonroc",
		Prev_Title = "Ebonroc",
	},
	["BWLChromaggus"] = {
		Title = "Chromaggus",
		Next_Page = "BWLNefarian",
		Next_Title = "Nefarian",
		Prev_Page = "BWLFlamegor",
		Prev_Title = "Flamegor",
	},
	["BWLNefarian"] = {
		Title = "Nefarian",
		Next_Page = "BWLTrashMobs",
		Next_Title = "Trash Mobs",
		Prev_Page = "BWLChromaggus",
		Prev_Title = "Chromaggus",
	},
	["BWLTrashMobs"] = {
		Title = "Trash Mobs",
		Prev_Page = "BWLNefarian",
		Prev_Title = "Nefarian",
	},
	["DMRhahkZor"] = {
		Title = "Rhahk'Zor",
		Next_Page = "DMMinerJohnson",
		Next_Title = "Miner Johnson".." ("..AL["Rare"]..")",
	},
	["DMMinerJohnson"] = {
		Title = "Miner Johnson".." ("..AL["Rare"]..")",
		Next_Page = "DMSneed",
		Next_Title = "Sneed",
		Prev_Page = "DMRhahkZor",
		Prev_Title = "Rhahk'Zor",
	},
	["DMSneed"] = {
		Title = "Sneed",
		Next_Page = "DMSneedsShredder",
		Next_Title = "Sneed's Shredder",
		Prev_Page = "DMMinerJohnson",
		Prev_Title = "Miner Johnson".." ("..AL["Rare"]..")",
	},
	["DMSneedsShredder"] = {
		Title = "Sneed's Shredder",
		Next_Page = "DMGilnid",
		Next_Title = "Gilnid",
		Prev_Page = "DMSneed",
		Prev_Title = "Sneed",
	},
	["DMGilnid"] = {
		Title = "Gilnid",
		Next_Page = "DMMrSmite",
		Next_Title = "Mr. Smite",
		Prev_Page = "DMSneedsShredder",
		Prev_Title = "Sneed's Shredder",
	},
	["DMMrSmite"] = {
		Title = "Mr. Smite",
		Next_Page = "DMCookie",
		Next_Title = "Cookie",
		Prev_Page = "DMGilnid",
		Prev_Title = "Gilnid",
	},
	["DMCookie"] = {
		Title = "Cookie",
		Next_Page = "DMCaptainGreenskin",
		Next_Title = "Captain Greenskin",
		Prev_Page = "DMMrSmite",
		Prev_Title = "Mr. Smite",
	},
	["DMCaptainGreenskin"] = {
		Title = "Captain Greenskin",
		Next_Page = "DMVanCleef",
		Next_Title = "Edwin VanCleef",
		Prev_Page = "DMCookie",
		Prev_Title = "Cookie",
	},
	["DMVanCleef"] = {
		Title = "Edwin VanCleef",
		Next_Page = "DMTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "DMCaptainGreenskin",
		Prev_Title = "Captain Greenskin",
	},
	["DMTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "DMVanCleef",
		Prev_Title = "Edwin VanCleef",
	},
	["TCGGrovetenderEngryss"] = {
		Title = "Grovetender Engryss",
		Next_Page = "TCGKeeperRanathos",
		Next_Title = "Keeper Ranathos",
	},
	["TCGKeeperRanathos"] = {
		Title = "Keeper Ranathos",
		Next_Page = "TCGHighPriestessAlathea",
		Next_Title = "High Priestess A'lathea",
		Prev_Page = "TCGGrovetenderEngryss",
		Prev_Title = "Grovetender Engryss",
	},
	["TCGHighPriestessAlathea"] = {
		Title = "High Priestess A'lathea",
		Next_Page = "TCGFenektistheDeceiver",
		Next_Title = "Fenektis the Deceiver",
		Prev_Page = "TCGKeeperRanathos",
		Prev_Title = "Keeper Ranathos",
	},
	["TCGFenektistheDeceiver"] = {
		Title = "Fenektis the Deceiver",
		Next_Page = "TCGMasterRaxxieth",
		Next_Title = "Master Raxxieth",
		Prev_Page = "TCGHighPriestessAlathea",
		Prev_Title = "High Priestess A'lathea",
	},
	["TCGMasterRaxxieth"] = {
		Title = "Master Raxxieth",
		Next_Page = "TCGTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "TCGFenektistheDeceiver",
		Prev_Title = "Fenektis the Deceiver",
	},
	["TCGTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "TCGMasterRaxxieth",
		Prev_Title = "Master Raxxieth",
	},
	["GnGrubbis"] = {
		Title = "Grubbis",
		Next_Page = "GnViscousFallout",
		Next_Title = "Viscous Fallout",
	},
	["GnViscousFallout"] = {
		Title = "Viscous Fallout",
		Next_Page = "GnElectrocutioner6000",
		Next_Title = "Electrocutioner 6000",
		Prev_Page = "GnGrubbis",
		Prev_Title = "Grubbis",
	},
	["GnElectrocutioner6000"] = {
		Title = "Electrocutioner 6000",
		Next_Page = "GnCrowdPummeler960",
		Next_Title = "Crowd Pummeler 9-60",
		Prev_Page = "GnViscousFallout",
		Prev_Title = "Viscous Fallout",
	},
	["GnCrowdPummeler960"] = {
		Title = "Crowd Pummeler 9-60",
		Next_Page = "GnDIAmbassador",
		Next_Title = "Dark Iron Ambassador",
		Prev_Page = "GnElectrocutioner6000",
		Prev_Title = "Electrocutioner 6000",
	},
	["GnDIAmbassador"] = {
		Title = "Dark Iron Ambassador",
		Next_Page = "GnMekgineerThermaplugg",
		Next_Title = "Mekgineer Thermaplugg",
		Prev_Page = "GnCrowdPummeler960",
		Prev_Title = "Crowd Pummeler 9-60",
	},
	["GnMekgineerThermaplugg"] = {
		Title = "Mekgineer Thermaplugg",
		Next_Page = "GnTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "GnDIAmbassador",
		Prev_Title = "Dark Iron Ambassador",
	},
	["GnTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "GnMekgineerThermaplugg",
		Prev_Title = "Mekgineer Thermaplugg",
	},
	["MCLucifron"] = {
		Title = "Lucifron",
		Next_Page = "MCMagmadar",
		Next_Title = "Magmadar",
	},
	["MCMagmadar"] = {
		Title = "Magmadar",
		Next_Page = "MCGehennas",
		Next_Title = "Gehennas",
		Prev_Page = "MCLucifron",
		Prev_Title = "Lucifron",
	},
	["MCGehennas"] = {
		Title = "Gehennas",
		Next_Page = "MCGarr",
		Next_Title = "Garr",
		Prev_Page = "MCMagmadar",
		Prev_Title = "Magmadar",
	},
	["MCGarr"] = {
		Title = "Garr",
		Next_Page = "MCShazzrah",
		Next_Title = "Shazzrah",
		Prev_Page = "MCGehennas",
		Prev_Title = "Gehennas",
	},
	["MCShazzrah"] = {
		Title = "Shazzrah",
		Next_Page = "MCGeddon",
		Next_Title = "Baron Geddon",
		Prev_Page = "MCGarr",
		Prev_Title = "Garr",
	},
	["MCGeddon"] = {
		Title = "Baron Geddon",
		Next_Page = "MCGolemagg",
		Next_Title = "Golemagg the Incinerator",
		Prev_Page = "MCShazzrah",
		Prev_Title = "Shazzrah",
	},
	["MCGolemagg"] = {
		Title = "Golemagg the Incinerator",
		Next_Page = "MCSulfuron",
		Next_Title = "Sulfuron Harbinger",
		Prev_Page = "MCGeddon",
		Prev_Title = "Baron Geddon",
	},
	["MCSulfuron"] = {
		Title = "Sulfuron Harbinger",
		Next_Page = "MCMajordomo",
		Next_Title = "Majordomo Executus",
		Prev_Page = "MCGolemagg",
		Prev_Title = "Golemagg the Incinerator",
	},
	["MCMajordomo"] = {
		Title = "Majordomo Executus",
		Next_Page = "MCRagnaros",
		Next_Title = "Ragnaros",
		Prev_Page = "MCSulfuron",
		Prev_Title = "Sulfuron Harbinger",
	},
	["MCRagnaros"] = {
		Title = "Ragnaros",
		Next_Page = "MCTrashMobs",
		Next_Title = "Trash Mobs",
		Prev_Page = "MCMajordomo",
		Prev_Title = "Majordomo Executus",
	},
	["MCTrashMobs"] = {
		Title = "Trash Mobs",
		Next_Page = "MCRANDOMBOSSDROPS",
		Next_Title = "Random Boss Loot",
		Prev_Page = "MCRagnaros",
		Prev_Title = "Ragnaros",
	},
	["MCRANDOMBOSSDROPS"] = {
		Title = "Random Boss Loot",
		Prev_Page = "MCTrashMobs",
		Prev_Title = "Trash Mobs",
	},
	["NAXPatchwerk"] = {
		Title = "Patchwerk",
		Next_Page = "NAXGrobbulus",
		Next_Title = "Grobbulus",
	},
	["NAXGrobbulus"] = {
		Title = "Grobbulus",
		Next_Page = "NAXGluth",
		Next_Title = "Gluth",
		Prev_Page = "NAXPatchwerk",
		Prev_Title = "Patchwerk",
	},
	["NAXGluth"] = {
		Title = "Gluth",
		Next_Page = "NAXThaddius",
		Next_Title = "Thaddius",
		Prev_Page = "NAXGrobbulus",
		Prev_Title = "Grobbulus",
	},
	["NAXThaddius"] = {
		Title = "Thaddius",
		Next_Page = "NAXAnubRekhan",
		Next_Title = "Anub'Rekhan",
		Prev_Page = "NAXGluth",
		Prev_Title = "Gluth",
	},
	["NAXAnubRekhan"] = {
		Title = "Anub'Rekhan",
		Next_Page = "NAXGrandWidowFaerlina",
		Next_Title = "Grand Widow Faerlina",
		Prev_Page = "NAXThaddius",
		Prev_Title = "Thaddius",
	},
	["NAXGrandWidowFaerlina"] = {
		Title = "Grand Widow Faerlina",
		Next_Page = "NAXMaexxna",
		Next_Title = "Maexxna",
		Prev_Page = "NAXAnubRekhan",
		Prev_Title = "Anub'Rekhan",
	},
	["NAXMaexxna"] = {
		Title = "Maexxna",
		Next_Page = "NAXNoththePlaguebringer",
		Next_Title = "Noth the Plaguebringer",
		Prev_Page = "NAXGrandWidowFaerlina",
		Prev_Title = "Grand Widow Faerlina",
	},
	["NAXNoththePlaguebringer"] = {
		Title = "Noth the Plaguebringer",
		Next_Page = "NAXHeigantheUnclean",
		Next_Title = "Heigan the Unclean",
		Prev_Page = "NAXMaexxna",
		Prev_Title = "Maexxna",
	},
	["NAXHeigantheUnclean"] = {
		Title = "Heigan the Unclean",
		Next_Page = "NAXLoatheb",
		Next_Title = "Loatheb",
		Prev_Page = "NAXNoththePlaguebringer",
		Prev_Title = "Noth the Plaguebringer",
	},
	["NAXLoatheb"] = {
		Title = "Loatheb",
		Next_Page = "NAXInstructorRazuvious",
		Next_Title = "Instructor Razuvious",
		Prev_Page = "NAXHeigantheUnclean",
		Prev_Title = "Heigan the Unclean",
	},
	["NAXInstructorRazuvious"] = {
		Title = "Instructor Razuvious",
		Next_Page = "NAXGothiktheHarvester",
		Next_Title = "Gothik the Harvester",
		Prev_Page = "NAXLoatheb",
		Prev_Title = "Loatheb",
	},
	["NAXGothiktheHarvester"] = {
		Title = "Gothik the Harvester",
		Next_Page = "NAXTheFourHorsemen",
		Next_Title = "The Four Horsemen",
		Prev_Page = "NAXInstructorRazuvious",
		Prev_Title = "Instructor Razuvious",
	},
	["NAXTheFourHorsemen"] = {
		Title = "The Four Horsemen",
		Next_Page = "NAXSapphiron",
		Next_Title = "Sapphiron",
		Prev_Page = "NAXGothiktheHarvester",
		Prev_Title = "Gothik the Harvester",
	},
	["NAXSapphiron"] = {
		Title = "Sapphiron",
		Next_Page = "NAXKelThuzard",
		Next_Title = "Kel'Thuzad",
		Prev_Page = "NAXTheFourHorsemen",
		Prev_Title = "The Four Horsemen",
	},
	["NAXKelThuzard"] = {
		Title = "Kel'Thuzad",
		Next_Page = "NAXTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "NAXSapphiron",
		Prev_Title = "Sapphiron",
	},
	["NAXTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "NAXKelThuzard",
		Prev_Title = "Kel'Thuzad",
	},
	["SMVishas"] = {
		Title = "Interrogator Vishas",
		Next_Page = "SMScorn",
		Next_Title = "Scorn".." (".."Scourge Invasion"..")",
	},
	["SMScorn"] = {
		Title = "Scorn".." (".."Scourge Invasion"..")",
		Next_Page = "SMIronspine",
		Next_Title = "Ironspine".." ("..AL["Rare"]..")",
		Prev_Page = "SMVishas",
		Prev_Title = "Interrogator Vishas",
	},
	["SMIronspine"] = {
		Title = "Ironspine".." ("..AL["Rare"]..")",
		Next_Page = "SMAzshir",
		Next_Title = "Azshir the Sleepless".." ("..AL["Rare"]..")",
		Prev_Page = "SMScorn",
		Prev_Title = "Scorn".." (".."Scourge Invasion"..")",
	},
	["SMAzshir"] = {
		Title = "Azshir the Sleepless".." ("..AL["Rare"]..")",
		Next_Page = "SMFallenChampion",
		Next_Title = "Fallen Champion".." ("..AL["Rare"]..")",
		Prev_Page = "SMIronspine",
		Prev_Title = "Ironspine".." ("..AL["Rare"]..")",
	},
	["SMFallenChampion"] = {
		Title = "Fallen Champion".." ("..AL["Rare"]..")",
		Next_Page = "SMBloodmageThalnos",
		Next_Title = "Bloodmage Thalnos",
		Prev_Page = "SMAzshir",
		Prev_Title = "Azshir the Sleepless".." ("..AL["Rare"]..")",
	},
	["SMBloodmageThalnos"] = {
		Title = "Bloodmage Thalnos",
		Next_Page = "SMGTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "SMFallenChampion",
		Prev_Title = "Fallen Champion".." ("..AL["Rare"]..")",
	},
	["SMGTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "SMBloodmageThalnos",
		Prev_Title = "Bloodmage Thalnos",
	},
	["SMHoundmasterLoksey"] = {
		Title = "Houndmaster Loksey",
		Next_Page = "SMDoan",
		Next_Title = "Arcanist Doan",
	},
	["SMDoan"] = {
		Title = "Arcanist Doan",
		Next_Page = "SMLTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "SMHoundmasterLoksey",
		Prev_Title = "Houndmaster Loksey",
	},
	["SMLTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "SMDoan",
		Prev_Title = "Arcanist Doan",
	},
	["SMHerod"] = {
		Title = "Herod",
		Next_Page = "SMATrash",
		Next_Title = "Trash Mobs",
	},
	["SMATrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "SMHerod",
		Prev_Title = "Herod",
	},
	["SMFairbanks"] = {
		Title = "High Inquisitor Fairbanks",
		Next_Page = "SMMograine",
		Next_Title = "Scarlet Commander Mograine",
	},
	["SMMograine"] = {
		Title = "Scarlet Commander Mograine",
		Next_Page = "SMWhitemane",
		Next_Title = "High Inquisitor Whitemane",
		Prev_Page = "SMFairbanks",
		Prev_Title = "High Inquisitor Fairbanks",
	},
	["SMWhitemane"] = {
		Title = "High Inquisitor Whitemane",
		Next_Page = "SMCTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "SMMograine",
		Prev_Title = "Scarlet Commander Mograine",
	},
	["SMCTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "SMWhitemane",
		Prev_Title = "High Inquisitor Whitemane",
	},
	["SCHOLOBlood"] = {
		Title = "Blood Steward of Kirtonos",
		Next_Page = "SCHOLOKirtonostheHerald",
		Next_Title = "Kirtonos the Herald",
	},
	["SCHOLOKirtonostheHerald"] = {
		Title = "Kirtonos the Herald",
		Next_Page = "SCHOLOJandiceBarov",
		Next_Title = "Jandice Barov",
		Prev_Page = "SCHOLOBlood",
		Prev_Title = "Blood Steward of Kirtonos",
	},
	["SCHOLOJandiceBarov"] = {
		Title = "Jandice Barov",
		Next_Page = "SCHOLOLordBlackwood",
		Next_Title = "Lord Blackwood".." (".."Scourge Invasion"..")",
		Prev_Page = "SCHOLOKirtonostheHerald",
		Prev_Title = "Kirtonos the Herald",
	},
	["SCHOLOLordBlackwood"] = {
		Title = "Lord Blackwood".." (".."Scourge Invasion"..")",
		Next_Page = "SCHOLORattlegore",
		Next_Title = "Rattlegore",
		Prev_Page = "SCHOLOJandiceBarov",
		Prev_Title = "Jandice Barov",
	},
	["SCHOLORattlegore"] = {
		Title = "Rattlegore",
		Next_Page = "SCHOLODeathKnight",
		Next_Title = "Death Knight Darkreaver",
		Prev_Page = "SCHOLOLordBlackwood",
		Prev_Title = "Lord Blackwood".." (".."Scourge Invasion"..")",
	},
	["SCHOLODeathKnight"] = {
		Title = "Death Knight Darkreaver",
		Next_Page = "SCHOLOMarduk",
		Next_Title = "Marduk Blackpool",
		Prev_Page = "SCHOLORattlegore",
		Prev_Title = "Rattlegore",
	},
	["SCHOLOMarduk"] = {
		Title = "Marduk Blackpool",
		Next_Page = "SCHOLOVectus",
		Next_Title = "Vectus",
		Prev_Page = "SCHOLODeathKnight",
		Prev_Title = "Death Knight Darkreaver",
	},
	["SCHOLOVectus"] = {
		Title = "Vectus",
		Next_Page = "SCHOLORasFrostwhisper",
		Next_Title = "Ras Frostwhisper",
		Prev_Page = "SCHOLOMarduk",
		Prev_Title = "Marduk Blackpool",
	},
	["SCHOLORasFrostwhisper"] = {
		Title = "Ras Frostwhisper",
		Next_Page = "SCHOLOKormok",
		Next_Title = "Kormok",
		Prev_Page = "SCHOLOVectus",
		Prev_Title = "Vectus",
	},
	["SCHOLOKormok"] = {
		Title = "Kormok",
		Next_Page = "SCHOLOInstructorMalicia",
		Next_Title = "Instructor Malicia",
		Prev_Page = "SCHOLORasFrostwhisper",
		Prev_Title = "Ras Frostwhisper",
	},
	["SCHOLOInstructorMalicia"] = {
		Title = "Instructor Malicia",
		Next_Page = "SCHOLODoctorTheolenKrastinov",
		Next_Title = "Doctor Theolen Krastinov",
		Prev_Page = "SCHOLOKormok",
		Prev_Title = "Kormok",
	},
	["SCHOLODoctorTheolenKrastinov"] = {
		Title = "Doctor Theolen Krastinov",
		Next_Page = "SCHOLOLorekeeperPolkelt",
		Next_Title = "Lorekeeper Polkelt",
		Prev_Page = "SCHOLOInstructorMalicia",
		Prev_Title = "Instructor Malicia",
	},
	["SCHOLOLorekeeperPolkelt"] = {
		Title = "Lorekeeper Polkelt",
		Next_Page = "SCHOLOTheRavenian",
		Next_Title = "The Ravenian",
		Prev_Page = "SCHOLODoctorTheolenKrastinov",
		Prev_Title = "Doctor Theolen Krastinov",
	},
	["SCHOLOTheRavenian"] = {
		Title = "The Ravenian",
		Next_Page = "SCHOLOLordAlexeiBarov",
		Next_Title = "Lord Alexei Barov",
		Prev_Page = "SCHOLOLorekeeperPolkelt",
		Prev_Title = "Lorekeeper Polkelt",
	},
	["SCHOLOLordAlexeiBarov"] = {
		Title = "Lord Alexei Barov",
		Next_Page = "SCHOLOLadyIlluciaBarov",
		Next_Title = "Lady Illucia Barov",
		Prev_Page = "SCHOLOTheRavenian",
		Prev_Title = "The Ravenian",
	},
	["SCHOLOLadyIlluciaBarov"] = {
		Title = "Lady Illucia Barov",
		Next_Page = "SCHOLODarkmasterGandling",
		Next_Title = "Darkmaster Gandling",
		Prev_Page = "SCHOLOLordAlexeiBarov",
		Prev_Title = "Lord Alexei Barov",
	},
	["SCHOLODarkmasterGandling"] = {
		Title = "Darkmaster Gandling",
		Next_Page = "SCHOLOTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "SCHOLOLadyIlluciaBarov",
		Prev_Title = "Lady Illucia Barov",
	},
	["SCHOLOTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "SCHOLODarkmasterGandling",
		Prev_Title = "Darkmaster Gandling",
	},
	["SFKRethilgore"] = {
		Title = "Rethilgore",
		Next_Page = "SFKFelSteed",
		Next_Title = "Fel Steed",
	},
	["SFKFelSteed"] = {
		Title = "Fel Steed",
		Next_Page = "SFKRazorclawtheButcher",
		Next_Title = "Razorclaw the Butcher",
		Prev_Page = "SFKRethilgore",
		Prev_Title = "Rethilgore",
	},
	["SFKRazorclawtheButcher"] = {
		Title = "Razorclaw the Butcher",
		Next_Page = "SFKSilverlaine",
		Next_Title = "Baron Silverlaine",
		Prev_Page = "SFKFelSteed",
		Prev_Title = "Fel Steed",
	},
	["SFKSilverlaine"] = {
		Title = "Baron Silverlaine",
		Next_Page = "SFKSpringvale",
		Next_Title = "Commander Springvale",
		Prev_Page = "SFKRazorclawtheButcher",
		Prev_Title = "Razorclaw the Butcher",
	},
	["SFKSpringvale"] = {
		Title = "Commander Springvale",
		Next_Page = "SFKSever",
		Next_Title = "Sever".." (".."Scourge Invasion"..")",
		Prev_Page = "SFKSilverlaine",
		Prev_Title = "Baron Silverlaine",
	},
	["SFKSever"] = {
		Title = "Sever".." (".."Scourge Invasion"..")",
		Next_Page = "SFKOdotheBlindwatcher",
		Next_Title = "Odo the Blindwatcher",
		Prev_Page = "SFKSpringvale",
		Prev_Title = "Commander Springvale",
	},
	["SFKOdotheBlindwatcher"] = {
		Title = "Odo the Blindwatcher",
		Next_Page = "SFKDeathswornCaptain",
		Next_Title = "Deathsworn Captain".." ("..AL["Rare"]..")",
		Prev_Page = "SFKSever",
		Prev_Title = "Sever".." (".."Scourge Invasion"..")",
	},
	["SFKDeathswornCaptain"] = {
		Title = "Deathsworn Captain".." ("..AL["Rare"]..")",
		Next_Page = "SFKFenrustheDevourer",
		Next_Title = "Fenrus the Devourer",
		Prev_Page = "SFKOdotheBlindwatcher",
		Prev_Title = "Odo the Blindwatcher",
	},
	["SFKFenrustheDevourer"] = {
		Title = "Fenrus the Devourer",
		Next_Page = "SFKArugalsVoidwalker",
		Next_Title = "Arugal's Voidwalker",
		Prev_Page = "SFKDeathswornCaptain",
		Prev_Title = "Deathsworn Captain".." ("..AL["Rare"]..")",
	},
	["SFKArugalsVoidwalker"] = {
		Title = "Arugal's Voidwalker",
		Next_Page = "SFKWolfMasterNandos",
		Next_Title = "Wolf Master Nandos",
		Prev_Page = "SFKFenrustheDevourer",
		Prev_Title = "Fenrus the Devourer",
	},
	["SFKWolfMasterNandos"] = {
		Title = "Wolf Master Nandos",
		Next_Page = "SFKArchmageArugal",
		Next_Title = "Archmage Arugal",
		Prev_Page = "SFKArugalsVoidwalker",
		Prev_Title = "Arugal's Voidwalker",
	},
	["SFKArchmageArugal"] = {
		Title = "Archmage Arugal",
		Next_Page = "SFKTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "SFKWolfMasterNandos",
		Prev_Title = "Wolf Master Nandos",
	},
	["SFKTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "SFKArchmageArugal",
		Prev_Title = "Archmage Arugal",
	},
	["SWStTargorr"] = {
		Title = "Targorr the Dread",
		Next_Page = "SWStKamDeepfury",
		Next_Title = "Kam Deepfury",
	},
	["SWStKamDeepfury"] = {
		Title = "Kam Deepfury",
		Next_Page = "SWStHamhock",
		Next_Title = "Hamhock",
		Prev_Page = "SWStTargorr",
		Prev_Title = "Targorr the Dread",
	},
	["SWStHamhock"] = {
		Title = "Hamhock",
		Next_Page = "SWStDextren",
		Next_Title = "Dextren Ward",
		Prev_Page = "SWStKamDeepfury",
		Prev_Title = "Kam Deepfury",
	},
	["SWStDextren"] = {
		Title = "Dextren Ward",
		Next_Page = "SWStBazil",
		Next_Title = "Bazil Thredd",
		Prev_Page = "SWStHamhock",
		Prev_Title = "Hamhock",
	},
	["SWStBazil"] = {
		Title = "Bazil Thredd",
		Next_Page = "SWStBruegalIronknuckle",
		Next_Title = "Bruegal Ironknuckle".." ("..AL["Rare"]..")",
		Prev_Page = "SWStDextren",
		Prev_Title = "Dextren Ward",
	},
	["SWStBruegalIronknuckle"] = {
		Title = "Bruegal Ironknuckle".." ("..AL["Rare"]..")",
		Next_Page = "SWStTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "SWStBazil",
		Prev_Title = "Bazil Thredd",
	},
	["SWStTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "SWStBruegalIronknuckle",
		Prev_Title = "Bruegal Ironknuckle".." ("..AL["Rare"]..")",
	},
	["STRATSkull"] = {
		Title = "Skul".." ("..AL["Rare"]..")",
		Next_Page = "STRATStratholmeCourier",
		Next_Title = "Stratholme Courier",
	},
	["STRATStratholmeCourier"] = {
		Title = "Stratholme Courier",
		Next_Page = "STRATPostmaster",
		Next_Title = "Postmaster Malown",
		Prev_Page = "STRATSkull",
		Prev_Title = "Skul".." ("..AL["Rare"]..")",
	},
	["STRATPostmaster"] = {
		Title = "Postmaster Malown",
		Next_Page = "STRATFrasSiabi",
		Next_Title = "Fras Siabi",
		Prev_Page = "STRATStratholmeCourier",
		Prev_Title = "Stratholme Courier",
	},
	["STRATFrasSiabi"] = {
		Title = "Fras Siabi",
		Next_Page = "STRATAtiesh",
		Next_Title = "Atiesh",
		Prev_Page = "STRATPostmaster",
		Prev_Title = "Postmaster Malown",
	},
	["STRATAtiesh"] = {
		Title = "Atiesh",
		Next_Page = "STRATBalzaphon",
		Next_Title = "Balzaphon".." (".."Scourge Invasion"..")",
		Prev_Page = "STRATFrasSiabi",
		Prev_Title = "Fras Siabi",
	},
	["STRATBalzaphon"] = {
		Title = "Balzaphon".." (".."Scourge Invasion"..")",
		Next_Page = "STRATHearthsingerForresten",
		Next_Title = "Hearthsinger Forresten".." ("..AL["Rare"]..")",
		Prev_Page = "STRATAtiesh",
		Prev_Title = "Atiesh",
	},
	["STRATHearthsingerForresten"] = {
		Title = "Hearthsinger Forresten".." ("..AL["Rare"]..")",
		Next_Page = "STRATTheUnforgiven",
		Next_Title = "The Unforgiven",
		Prev_Page = "STRATBalzaphon",
		Prev_Title = "Balzaphon".." (".."Scourge Invasion"..")",
	},
	["STRATTheUnforgiven"] = {
		Title = "The Unforgiven",
		Next_Page = "STRATTimmytheCruel",
		Next_Title = "Timmy the Cruel",
		Prev_Page = "STRATHearthsingerForresten",
		Prev_Title = "Hearthsinger Forresten".." ("..AL["Rare"]..")",
	},
	["STRATTimmytheCruel"] = {
		Title = "Timmy the Cruel",
		Next_Page = "STRATMalor",
		Next_Title = "Malor the Zealous",
		Prev_Page = "STRATTheUnforgiven",
		Prev_Title = "The Unforgiven",
	},
	["STRATMalor"] = {
		Title = "Malor the Zealous",
		Next_Page = "STRATMalorsStrongbox",
		Next_Title = "Malor's Strongbox",
		Prev_Page = "STRATTimmytheCruel",
		Prev_Title = "Timmy the Cruel",
	},
	["STRATMalorsStrongbox"] = {
		Title = "Malor's Strongbox",
		Next_Page = "STRATCrimsonHammersmith",
		Next_Title = "Crimson Hammersmith",
		Prev_Page = "STRATMalor",
		Prev_Title = "Malor the Zealous",
	},
	["STRATCrimsonHammersmith"] = {
		Title = "Crimson Hammersmith",
		Next_Page = "STRATCannonMasterWilley",
		Next_Title = "Cannon Master Willey",
		Prev_Page = "STRATMalorsStrongbox",
		Prev_Title = "Malor's Strongbox",
	},
	["STRATCannonMasterWilley"] = {
		Title = "Cannon Master Willey",
		Next_Page = "STRATArchivistGalford",
		Next_Title = "Archivist Galford",
		Prev_Page = "STRATCrimsonHammersmith",
		Prev_Title = "Crimson Hammersmith",
	},
	["STRATArchivistGalford"] = {
		Title = "Archivist Galford",
		Next_Page = "STRATBalnazzar",
		Next_Title = "Balnazzar",
		Prev_Page = "STRATCannonMasterWilley",
		Prev_Title = "Cannon Master Willey",
	},
	["STRATBalnazzar"] = {
		Title = "Balnazzar",
		Next_Page = "STRATSothosJarien",
		Next_Title = "Sothos".." & ".."Jarien",
		Prev_Page = "STRATArchivistGalford",
		Prev_Title = "Archivist Galford",
	},
	["STRATSothosJarien"] = {
		Title = "Sothos".." & ".."Jarien",
		Next_Page = "STRATStonespine",
		Next_Title = "Stonespine".." ("..AL["Rare"]..")",
		Prev_Page = "STRATBalnazzar",
		Prev_Title = "Balnazzar",
	},
	["STRATStonespine"] = {
		Title = "Stonespine".." ("..AL["Rare"]..")",
		Next_Page = "STRATBaronessAnastari",
		Next_Title = "Baroness Anastari",
		Prev_Page = "STRATSothosJarien",
		Prev_Title = "Sothos".." & ".."Jarien",
	},
	["STRATBaronessAnastari"] = {
		Title = "Baroness Anastari",
		Next_Page = "STRATBlackGuardSwordsmith",
		Next_Title = "Black Guard Swordsmith",
		Prev_Page = "STRATStonespine",
		Prev_Title = "Stonespine".." ("..AL["Rare"]..")",
	},
	["STRATBlackGuardSwordsmith"] = {
		Title = "Black Guard Swordsmith",
		Next_Page = "STRATNerubenkan",
		Next_Title = "Nerub'enkan",
		Prev_Page = "STRATBaronessAnastari",
		Prev_Title = "Baroness Anastari",
	},
	["STRATNerubenkan"] = {
		Title = "Nerub'enkan",
		Next_Page = "STRATMalekithePallid",
		Next_Title = "Maleki the Pallid",
		Prev_Page = "STRATBlackGuardSwordsmith",
		Prev_Title = "Black Guard Swordsmith",
	},
	["STRATMalekithePallid"] = {
		Title = "Maleki the Pallid",
		Next_Page = "STRATMagistrateBarthilas",
		Next_Title = "Magistrate Barthilas",
		Prev_Page = "STRATNerubenkan",
		Prev_Title = "Nerub'enkan",
	},
	["STRATMagistrateBarthilas"] = {
		Title = "Magistrate Barthilas",
		Next_Page = "STRATRamsteintheGorger",
		Next_Title = "Ramstein the Gorger",
		Prev_Page = "STRATMalekithePallid",
		Prev_Title = "Maleki the Pallid",
	},
	["STRATRamsteintheGorger"] = {
		Title = "Ramstein the Gorger",
		Next_Page = "STRATBaronRivendare",
		Next_Title = "Baron Rivendare",
		Prev_Page = "STRATMagistrateBarthilas",
		Prev_Title = "Magistrate Barthilas",
	},
	["STRATBaronRivendare"] = {
		Title = "Baron Rivendare",
		Next_Page = "STRATTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "STRATRamsteintheGorger",
		Prev_Title = "Ramstein the Gorger",
	},
	["STRATTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "STRATBaronRivendare",
		Prev_Title = "Baron Rivendare",
	},
	["STBalconyMinibosses"] = {
		Title = "Balcony Minibosses",
		Next_Page = "STAtalalarion",
		Next_Title = "Atal'alarion",
	},
	["STAtalalarion"] = {
		Title = "Atal'alarion",
		Next_Page = "STSpawnOfHakkar",
		Next_Title = "Spawn of Hakkar",
		Prev_Page = "STBalconyMinibosses",
		Prev_Title = "Balcony Minibosses",
	},
	["STSpawnOfHakkar"] = {
		Title = "Spawn of Hakkar",
		Next_Page = "STAvatarofHakkar",
		Next_Title = "Avatar of Hakkar",
		Prev_Page = "STAtalalarion",
		Prev_Title = "Atal'alarion",
	},
	["STAvatarofHakkar"] = {
		Title = "Avatar of Hakkar",
		Next_Page = "STJammalan",
		Next_Title = "Jammal'an the Prophet",
		Prev_Page = "STSpawnOfHakkar",
		Prev_Title = "Spawn of Hakkar",
	},
	["STJammalan"] = {
		Title = "Jammal'an the Prophet",
		Next_Page = "STOgom",
		Next_Title = "Ogom the Wretched",
		Prev_Page = "STAvatarofHakkar",
		Prev_Title = "Avatar of Hakkar",
	},
	["STOgom"] = {
		Title = "Ogom the Wretched",
		Next_Page = "STDreamscythe",
		Next_Title = "Dreamscythe",
		Prev_Page = "STJammalan",
		Prev_Title = "Jammal'an the Prophet",
	},
	["STDreamscythe"] = {
		Title = "Dreamscythe",
		Next_Page = "STWeaver",
		Next_Title = "Weaver",
		Prev_Page = "STOgom",
		Prev_Title = "Ogom the Wretched",
	},
	["STWeaver"] = {
		Title = "Weaver",
		Next_Page = "STMorphaz",
		Next_Title = "Morphaz",
		Prev_Page = "STDreamscythe",
		Prev_Title = "Dreamscythe",
	},
	["STMorphaz"] = {
		Title = "Morphaz",
		Next_Page = "STHazzas",
		Next_Title = "Hazzas",
		Prev_Page = "STWeaver",
		Prev_Title = "Weaver",
	},
	["STHazzas"] = {
		Title = "Hazzas",
		Next_Page = "STEranikus",
		Next_Title = "Shade of Eranikus",
		Prev_Page = "STMorphaz",
		Prev_Title = "Morphaz",
	},
	["STEranikus"] = {
		Title = "Shade of Eranikus",
		Next_Page = "STTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "STHazzas",
		Prev_Title = "Hazzas",
	},
	["STTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "STEranikus",
		Prev_Title = "Shade of Eranikus",
	},
	["UldBaelog"] = {
		Title = "Baelog",
		Next_Page = "UldOlaf",
		Next_Title = "Olaf",
	},
	["UldOlaf"] = {
		Title = "Olaf",
		Next_Page = "UldEric",
		Next_Title = "Eric 'The Swift'",
		Prev_Page = "UldBaelog",
		Prev_Title = "Baelog",
	},
	["UldEric"] = {
		Title = "Eric 'The Swift'",
		Next_Page = "UldRevelosh",
		Next_Title = "Revelosh",
		Prev_Page = "UldOlaf",
		Prev_Title = "Olaf",
	},
	["UldRevelosh"] = {
		Title = "Revelosh",
		Next_Page = "UldIronaya",
		Next_Title = "Ironaya",
		Prev_Page = "UldEric",
		Prev_Title = "Eric 'The Swift'",
	},
	["UldIronaya"] = {
		Title = "Ironaya",
		Next_Page = "UldAncientStoneKeeper",
		Next_Title = "Ancient Stone Keeper",
		Prev_Page = "UldRevelosh",
		Prev_Title = "Revelosh",
	},
	["UldAncientStoneKeeper"] = {
		Title = "Ancient Stone Keeper",
		Next_Page = "UldGalgannFirehammer",
		Next_Title = "Galgann Firehammer",
		Prev_Page = "UldIronaya",
		Prev_Title = "Ironaya",
	},
	["UldGalgannFirehammer"] = {
		Title = "Galgann Firehammer",
		Next_Page = "UldGrimlok",
		Next_Title = "Grimlok",
		Prev_Page = "UldAncientStoneKeeper",
		Prev_Title = "Ancient Stone Keeper",
	},
	["UldGrimlok"] = {
		Title = "Grimlok",
		Next_Page = "UldArchaedas",
		Next_Title = "Archaedas",
		Prev_Page = "UldGalgannFirehammer",
		Prev_Title = "Galgann Firehammer",
	},
	["UldArchaedas"] = {
		Title = "Archaedas",
		Next_Page = "UldTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "UldGrimlok",
		Prev_Title = "Grimlok",
	},
	["UldTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "UldArchaedas",
		Prev_Title = "Archaedas",
	},
	["GCMatthiasHoltz"] = {
		Title = AL["Matthias Holtz"],
		Next_Page = "GCPackmasterRagetooth",
		Next_Title = AL["Packmaster Ragetooth"],
		Prev_Page = "GCTrash",
		Prev_Title = AL["Trash Mobs"],
	},
	["GCPackmasterRagetooth"] = {
		Title = AL["Packmaster Ragetooth"],
		Next_Page = "GCJudgeSutherland",
		Next_Title = AL["Judge Sutherland"],
		Prev_Page = "GCMatthiasHoltz",
		Prev_Title = AL["Matthias Holtz"],
	},
	["GCJudgeSutherland"] = {
		Title = AL["Judge Sutherland"],
		Prev_Page = "GCPackmasterRagetooth",
		Prev_Title = AL["Packmaster Ragetooth"],
		Next_Page = "GCDustivanBlackcowl",
		Next_Title = AL["Dustivan Blackcowl"],
	},
	["GCDustivanBlackcowl"] = {
		Title = AL["Dustivan Blackcowl"],
		Prev_Page = "GCJudgeSutherland",
		Prev_Title = AL["Judge Sutherland"],
		Next_Page = "GCMarshalMagnusGreystone",
		Next_Title = AL["Marshal Magnus Greystone"],
	},
	["GCMarshalMagnusGreystone"] = {
		Title = AL["Marshal Magnus Greystone"],
		Prev_Page = "GCDustivanBlackcowl",
		Prev_Title = AL["Dustivan Blackcowl"],
		Next_Page = "GCHorsemasterLevvin",
		Next_Title = AL["Horsemaster Levvin"],
	},
	["GCHorsemasterLevvin"] = {
		Title = AL["Horsemaster Levvin"],
		Prev_Page = "GCMarshalMagnusGreystone",
		Prev_Title = AL["Marshal Magnus Greystone"],
		Next_Page = "GCHarlowFamilyChest",
		Next_Title = AL["Harlow Family Chest"],
	},
	["GCHarlowFamilyChest"] = {
		Title = AL["Harlow Family Chest"],
		Prev_Page = "GCHorsemasterLevvin",
		Prev_Title = AL["Horsemaster Levvin"],
		Next_Page = "GCGennGreymane",
		Next_Title = AL["Genn Greymane"],
	},
	["GCGennGreymane"] = {
		Title = AL["Genn Greymane"],
		Prev_Page = "GCHarlowFamilyChest",
		Prev_Title = AL["Harlow Family Chest"],
		Next_Page = "GCTrash",
		Next_Title = AL["Trash Mobs"],
	},
	["GCTrash"] = {
		Title = AL["Trash Mobs"],
		Prev_Page = "GCGennGreymane",
		Prev_Title = AL["Genn Greymane"],
		Next_Page = "GCMatthiasHoltz",
		Next_Title = AL["Matthias Holtz"],
	},
	["ZGJeklik"] = {
		Title = "High Priestess Jeklik",
		Next_Page = "ZGVenoxis",
		Next_Title = "High Priest Venoxis",
	},
	["ZGVenoxis"] = {
		Title = "High Priest Venoxis",
		Next_Page = "ZGMarli",
		Next_Title = "High Priestess Mar'li",
		Prev_Page = "ZGJeklik",
		Prev_Title = "High Priestess Jeklik",
	},
	["ZGMarli"] = {
		Title = "High Priestess Mar'li",
		Next_Page = "ZGMandokir",
		Next_Title = "Bloodlord Mandokir",
		Prev_Page = "ZGVenoxis",
		Prev_Title = "High Priest Venoxis",
	},
	["ZGMandokir"] = {
		Title = "Bloodlord Mandokir",
		Next_Page = "ZGGrilek",
		Next_Title = "Gri'lek",
		Prev_Page = "ZGMarli",
		Prev_Title = "High Priestess Mar'li",
	},
	["ZGGrilek"] = {
		Title = "Gri'lek",
		Next_Page = "ZGHazzarah",
		Next_Title = "Hazza'rah",
		Prev_Page = "ZGMandokir",
		Prev_Title = "Bloodlord Mandokir",
	},
	["ZGHazzarah"] = {
		Title = "Hazza'rah",
		Next_Page = "ZGRenataki",
		Next_Title = "Renataki",
		Prev_Page = "ZGGrilek",
		Prev_Title = "Gri'lek",
	},
	["ZGRenataki"] = {
		Title = "Renataki",
		Next_Page = "ZGWushoolay",
		Next_Title = "Wushoolay",
		Prev_Page = "ZGHazzarah",
		Prev_Title = "Hazza'rah",
	},
	["ZGWushoolay"] = {
		Title = "Wushoolay",
		Next_Page = "ZGGahzranka",
		Next_Title = "Gahz'ranka",
		Prev_Page = "ZGRenataki",
		Prev_Title = "Renataki",
	},
	["ZGGahzranka"] = {
		Title = "Gahz'ranka",
		Next_Page = "ZGThekal",
		Next_Title = "High Priest Thekal",
		Prev_Page = "ZGWushoolay",
		Prev_Title = "Wushoolay",
	},
	["ZGThekal"] = {
		Title = "High Priest Thekal",
		Next_Page = "ZGArlokk",
		Next_Title = "High Priestess Arlokk",
		Prev_Page = "ZGGahzranka",
		Prev_Title = "Gahz'ranka",
	},
	["ZGArlokk"] = {
		Title = "High Priestess Arlokk",
		Next_Page = "ZGJindo",
		Next_Title = "Jin'do the Hexxer",
		Prev_Page = "ZGThekal",
		Prev_Title = "High Priest Thekal",
	},
	["ZGJindo"] = {
		Title = "Jin'do the Hexxer",
		Next_Page = "ZGHakkar",
		Next_Title = "Hakkar",
		Prev_Page = "ZGArlokk",
		Prev_Title = "High Priestess Arlokk",
	},
	["ZGHakkar"] = {
		Title = "Hakkar",
		Next_Page = "ZGShared",
		Next_Title = "Random Boss Loot",
		Prev_Page = "ZGJindo",
		Prev_Title = "Jin'do the Hexxer",
	},
	["ZGShared"] = {
		Title = "Random Boss Loot",
		Next_Page = "ZGTrash1",
		Next_Title = "Trash Mobs",
		Prev_Page = "ZGHakkar",
		Prev_Title = "Hakkar",
	},
	["ZGTrash1"] = {
		Title = "Trash Mobs",
		Next_Page = "ZGEnchants",
		Next_Title = "ZG Enchants",
		Prev_Page = "ZGShared",
		Prev_Title = "Random Boss Loot",
	},
	["ZGEnchants"] = {
		Title = "ZG Enchants",
		Prev_Page = "ZGTrash1",
		Prev_Title = "Trash Mobs",
	},
	["BFDGhamoora"] = {
		Title = "Ghamoo-ra",
		Next_Page = "BFDLadySarevess",
		Next_Title = "Lady Sarevess",
	},
	["BFDLadySarevess"] = {
		Title = "Lady Sarevess",
		Next_Page = "BFDGelihast",
		Next_Title = "Gelihast",
		Prev_Page = "BFDGhamoora",
		Prev_Title = "Ghamoo-ra",
	},
	["BFDGelihast"] = {
		Title = "Gelihast",
		Next_Page = "BFDBaronAquanis",
		Next_Title = "Baron Aquanis",
		Prev_Page = "BFDLadySarevess",
		Prev_Title = "Lady Sarevess",
	},
	["BFDBaronAquanis"] = {
		Title = "Baron Aquanis",
		Next_Page = "BFDTwilightLordKelris",
		Next_Title = "Twilight Lord Kelris",
		Prev_Page = "BFDGelihast",
		Prev_Title = "Gelihast",
	},
	["BFDTwilightLordKelris"] = {
		Title = "Twilight Lord Kelris",
		Next_Page = "BFDOldSerrakis",
		Next_Title = "Old Serra'kis",
		Prev_Page = "BFDBaronAquanis",
		Prev_Title = "Baron Aquanis",
	},
	["BFDOldSerrakis"] = {
		Title = "Old Serra'kis",
		Next_Page = "BFDAkumai",
		Next_Title = "Aku'mai",
		Prev_Page = "BFDTwilightLordKelris",
		Prev_Title = "Twilight Lord Kelris",
	},
	["BFDAkumai"] = {
		Title = "Aku'mai",
		Next_Page = "BFDTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "BFDOldSerrakis",
		Prev_Title = "Old Serra'kis",
	},
	["BFDTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "BFDAkumai",
		Prev_Title = "Aku'mai",
	},
	["DMEPusillin"] = {
		Title = "Pusillin",
		Prev_Page = "DMETrash",
		Prev_Title = "Trash Mobs",
		Next_Page = "DMEZevrimThornhoof",
		Next_Title = "Zevrim Thornhoof",
	},
	["DMEZevrimThornhoof"] = {
		Title = "Zevrim Thornhoof",
		Next_Page = "DMEHydro",
		Next_Title = "Hydrospawn",
		Prev_Page = "DMEPusillin",
		Prev_Title = "Pusillin",
	},
	["DMEHydro"] = {
		Title = "Hydrospawn",
		Next_Page = "DMELethtendris",
		Next_Title = "Lethtendris",
		Prev_Page = "DMEZevrimThornhoof",
		Prev_Title = "Zevrim Thornhoof",
	},
	["DMELethtendris"] = {
		Title = "Lethtendris",
		Next_Page = "DMEPimgib",
		Next_Title = "Pimgib",
		Prev_Page = "DMEHydro",
		Prev_Title = "Hydrospawn",
	},
	["DMEPimgib"] = {
		Title = "Pimgib",
		Next_Page = "DMEAlzzin",
		Next_Title = "Alzzin the Wildshaper",
		Prev_Page = "DMELethtendris",
		Prev_Title = "Lethtendris",
	},
	["DMEAlzzin"] = {
		Title = "Alzzin the Wildshaper",
		Next_Page = "DMEIsalien",
		Next_Title = "Isalien",
		Prev_Page = "DMEPimgib",
		Prev_Title = "Pimgib",
	},
	["DMEIsalien"] = {
		Title = "Isalien",
		Next_Page = "DMEShard",
		Next_Title = "Felvine Shard",
		Prev_Page = "DMEAlzzin",
		Prev_Title = "Alzzin the Wildshaper",
	},
	["DMEShard"] = {
		Title = "Felvine Shard",
		Next_Page = "DMETrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "DMEIsalien",
		Prev_Title = "Isalien",
	},
	["DMETrash"] = {
		Title = "Trash Mobs",
		Next_Page = "DMEPusillin",
		Next_Title = "Pusillin",
		Prev_Page = "DMEShard",
		Prev_Title = "Felvine Shard",
	},
	["DMWTendrisWarpwood"] = {
		Title = "Tendris Warpwood",
		Next_Page = "DMWIllyannaRavenoak",
		Next_Title = "Illyanna Ravenoak",
		Prev_Page = "DMWTrash",
		Prev_Title = "Trash Mobs",
	},
	["DMWIllyannaRavenoak"] = {
		Title = "Illyanna Ravenoak",
		Next_Page = "DMWMagisterKalendris",
		Next_Title = "Magister Kalendris",
		Prev_Page = "DMWTendrisWarpwood",
		Prev_Title = "Tendris Warpwood",
	},
	["DMWMagisterKalendris"] = {
		Title = "Magister Kalendris",
		Next_Page = "DMWTsuzee",
		Next_Title = "Tsu'zee".." ("..AL["Rare"]..")",
		Prev_Page = "DMWIllyannaRavenoak",
		Prev_Title = "Illyanna Ravenoak",
	},
	["DMWTsuzee"] = {
		Title = "Tsu'zee".." ("..AL["Rare"]..")",
		Next_Page = "DMWImmolthar",
		Next_Title = "Immol'thar",
		Prev_Page = "DMWMagisterKalendris",
		Prev_Title = "Magister Kalendris",
	},
	["DMWImmolthar"] = {
		Title = "Immol'thar",
		Next_Page = "DMWHelnurath",
		Next_Title = "Lord Hel'nurath".." ("..AL["Rare"]..")",
		Prev_Page = "DMWTsuzee",
		Prev_Title = "Tsu'zee".." ("..AL["Rare"]..")",
	},
	["DMWHelnurath"] = {
		Title = "Lord Hel'nurath".." ("..AL["Rare"]..")",
		Next_Page = "DMWPrinceTortheldrin",
		Next_Title = "Prince Tortheldrin",
		Prev_Page = "DMWImmolthar",
		Prev_Title = "Immol'thar",
	},
	["DMWPrinceTortheldrin"] = {
		Title = "Prince Tortheldrin",
		Next_Page = "DMWRevanchion",
		Next_Title = "Revanchion".." (".."Scourge Invasion"..")",
		Prev_Page = "DMWHelnurath",
		Prev_Title = "Lord Hel'nurath".." ("..AL["Rare"]..")",
	},
	["DMWRevanchion"] = {
		Title = "Revanchion".." (".."Scourge Invasion"..")",
		Next_Page = "DMWTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "DMWPrinceTortheldrin",
		Prev_Title = "Prince Tortheldrin",
	},
	["DMWTrash"] = {
		Title = "Trash Mobs",
		Next_Page = "DMWTendrisWarpwood",
		Next_Title = "Tendris Warpwood",
		Prev_Page = "DMWRevanchion",
		Prev_Title = "Revanchion".." (".."Scourge Invasion"..")",
	},
	["DMNGuardMoldar"] = {
		Title = "Guard Mol'dar",
		Next_Page = "DMNStomperKreeg",
		Next_Title = "Stomper Kreeg",
	},
	["DMNStomperKreeg"] = {
		Title = "Stomper Kreeg",
		Next_Page = "DMNGuardFengus",
		Next_Title = "Guard Fengus",
		Prev_Page = "DMNGuardMoldar",
		Prev_Title = "Guard Mol'dar",
	},
	["DMNGuardFengus"] = {
		Title = "Guard Fengus",
		Next_Page = "DMNThimblejack",
		Next_Title = "Knot Thimblejack",
		Prev_Page = "DMNStomperKreeg",
		Prev_Title = "Stomper Kreeg",
	},
	["DMNThimblejack"] = {
		Title = "Knot Thimblejack",
		Next_Page = "DMNGuardSlipkik",
		Next_Title = "Guard Slip'kik",
		Prev_Page = "DMNGuardFengus",
		Prev_Title = "Guard Fengus",
	},
	["DMNGuardSlipkik"] = {
		Title = "Guard Slip'kik",
		Next_Page = "DMNCaptainKromcrush",
		Next_Title = "Captain Kromcrush",
		Prev_Page = "DMNThimblejack",
		Prev_Title = "Knot Thimblejack",
	},
	["DMNCaptainKromcrush"] = {
		Title = "Captain Kromcrush",
		Next_Page = "DMNKingGordok",
		Next_Title = "King Gordok",
		Prev_Page = "DMNGuardSlipkik",
		Prev_Title = "Guard Slip'kik",
	},
	["DMNKingGordok"] = {
		Title = "King Gordok",
		Next_Page = "DMNChoRush",
		Next_Title = "Cho'Rush the Observer",
		Prev_Page = "DMNCaptainKromcrush",
		Prev_Title = "Captain Kromcrush",
	},
	["DMNChoRush"] = {
		Title = "Cho'Rush the Observer",
		Next_Page = "DMNTRIBUTERUN",
		Next_Title = "Tribute Run",
		Prev_Page = "DMNKingGordok",
		Prev_Title = "King Gordok",
	},
	["DMNTRIBUTERUN"] = {
		Title = "Tribute Run",
		Next_Page = "DMNTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "DMNChoRush",
		Prev_Title = "Cho'Rush the Observer",
	},
	["DMNTrash"] = {
		Title = "Trash Mobs",
		Next_Page = "DMNGuardMoldar",
		Next_Title = "Guard Mol'dar",
		Prev_Page = "DMNTRIBUTERUN",
		Prev_Title = "Tribute Run",
	},
	["MaraKhanVeng"] = {
		Title = "Veng",
		Next_Page = "MaraNoxxion",
		Next_Title = "Noxxion",
		Prev_Page = "MaraTrash",
		Prev_Title = "Trash Mobs",
	},
	["MaraNoxxion"] = {
		Title = "Noxxion",
		Next_Page = "MaraRazorlash",
		Next_Title = "Razorlash",
		Prev_Page = "MaraKhanVeng",
		Prev_Title = "Veng",
	},
	["MaraRazorlash"] = {
		Title = "Razorlash",
		Next_Page = "MaraKhanMaraudos",
		Next_Title = "Maraudos",
		Prev_Page = "MaraNoxxion",
		Prev_Title = "Noxxion",
	},
	["MaraKhanMaraudos"] = {
		Title = "Maraudos",
		Next_Page = "MaraLordVyletongue",
		Next_Title = "Lord Vyletongue",
		Prev_Page = "MaraRazorlash",
		Prev_Title = "Razorlash",
	},
	["MaraLordVyletongue"] = {
		Title = "Lord Vyletongue",
		Next_Page = "MaraMeshlok",
		Next_Title = "Meshlok the Harvester".." ("..AL["Rare"]..")",
		Prev_Page = "MaraKhanMaraudos",
		Prev_Title = "Maraudos",
	},
	["MaraMeshlok"] = {
		Title = "Meshlok the Harvester".." ("..AL["Rare"]..")",
		Next_Page = "MaraCelebras",
		Next_Title = "Celebras the Cursed",
		Prev_Page = "MaraLordVyletongue",
		Prev_Title = "Lord Vyletongue",
	},
	["MaraCelebras"] = {
		Title = "Celebras the Cursed",
		Next_Page = "MaraLandslide",
		Next_Title = "Landslide",
		Prev_Page = "MaraMeshlok",
		Prev_Title = "Meshlok the Harvester".." ("..AL["Rare"]..")",
	},
	["MaraLandslide"] = {
		Title = "Landslide",
		Next_Page = "MaraTinkererGizlock",
		Next_Title = "Tinkerer Gizlock",
		Prev_Page = "MaraCelebras",
		Prev_Title = "Celebras the Cursed",
	},
	["MaraTinkererGizlock"] = {
		Title = "Tinkerer Gizlock",
		Next_Page = "MaraRotgrip",
		Next_Title = "Rotgrip",
		Prev_Page = "MaraLandslide",
		Prev_Title = "Landslide",
	},
	["MaraRotgrip"] = {
		Title = "Rotgrip",
		Next_Page = "MaraPrincessTheradras",
		Next_Title = "Princess Theradras",
		Prev_Page = "MaraTinkererGizlock",
		Prev_Title = "Tinkerer Gizlock",
	},
	["MaraPrincessTheradras"] = {
		Title = "Princess Theradras",
		Next_Page = "MaraTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "MaraRotgrip",
		Prev_Title = "Rotgrip",
	},
	["MaraTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "MaraPrincessTheradras",
		Prev_Title = "Princess Theradras",
		Next_Page = "MaraKhanVeng",
		Next_Title = "Veng",
	},
	["RFCOggleflint"] = {
		Title = "Oggleflint",
		Next_Page = "RFCTaragaman",
		Next_Title = "Taragaman the Hungerer",
		Prev_Page = "RFCBazzalan",
		Prev_Title = "Bazzalan",
	},
	["RFCTaragaman"] = {
		Title = "Taragaman the Hungerer",
		Next_Page = "RFCJergosh",
		Next_Title = "Jergosh the Invoker",
		Prev_Page = "RFCOggleflint",
		Prev_Title = "Oggleflint",
	},
	["RFCJergosh"] = {
		Title = "Jergosh the Invoker",
		Next_Page = "RFCBazzalan",
		Next_Title = "Bazzalan",
		Prev_Page = "RFCTaragaman",
		Prev_Title = "Taragaman the Hungerer",
	},
	["RFCBazzalan"] = {
		Title = "Bazzalan",
		Prev_Page = "RFCJergosh",
		Prev_Title = "Jergosh the Invoker",
		Next_Page = "RFCOggleflint",
		Next_Title = "Oggleflint",
	},
	["RFDTutenkash"] = {
		Title = "Tuten'kash",
		Prev_Page = "RFDTrash",
		Prev_Title = "Trash Mobs",
		Next_Page = "RFDHenryStern",
		Next_Title = "Henry Stern",
	},
	["RFDHenryStern"] = {
		Title = "Henry Stern",
		Next_Page = "RFDLadyF",
		Next_Title = "Lady Falther'ess".." (".."Scourge Invasion"..")",
		Prev_Page = "RFDTutenkash",
		Prev_Title = "Tuten'kash",
	},
	["RFDLadyF"] = {
		Title = "Lady Falther'ess".." (".."Scourge Invasion"..")",
		Next_Page = "RFDPlaguemaw",
		Next_Title = "Plaguemaw the Rotting",
		Prev_Page = "RFDHenryStern",
		Prev_Title = "Henry Stern",
	},
	["RFDPlaguemaw"] = {
		Title = "Plaguemaw the Rotting",
		Next_Page = "RFDMordreshFireEye",
		Next_Title = "Mordresh Fire Eye",
		Prev_Page = "RFDLadyF",
		Prev_Title = "Lady Falther'ess".." (".."Scourge Invasion"..")",
	},
	["RFDMordreshFireEye"] = {
		Title = "Mordresh Fire Eye",
		Next_Page = "RFDGlutton",
		Next_Title = "Glutton",
		Prev_Page = "RFDPlaguemaw",
		Prev_Title = "Plaguemaw the Rotting",
	},
	["RFDGlutton"] = {
		Title = "Glutton",
		Next_Page = "RFDRagglesnout",
		Next_Title = "Ragglesnout".." ("..AL["Rare"]..")",
		Prev_Page = "RFDMordreshFireEye",
		Prev_Title = "Mordresh Fire Eye",
	},
	["RFDRagglesnout"] = {
		Title = "Ragglesnout".." ("..AL["Rare"]..")",
		Next_Page = "RFDAmnennar",
		Next_Title = "Amnennar the Coldbringer",
		Prev_Page = "RFDGlutton",
		Prev_Title = "Glutton",
	},
	["RFDAmnennar"] = {
		Title = "Amnennar the Coldbringer",
		Next_Page = "RFDTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "RFDRagglesnout",
		Prev_Title = "Ragglesnout".." ("..AL["Rare"]..")",
	},
	["RFDTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "RFDAmnennar",
		Prev_Title = "Amnennar the Coldbringer",
		Next_Page = "RFDTutenkash",
		Next_Title = "Tuten'kash",
	},
	["RFKAggem"] = {
		Title = "Aggem Thorncurse",
		Next_Page = "RFKDeathSpeakerJargba",
		Next_Title = "Death Speaker Jargba",
	},
	["RFKDeathSpeakerJargba"] = {
		Title = "Death Speaker Jargba",
		Next_Page = "RFKOverlordRamtusk",
		Next_Title = "Overlord Ramtusk",
		Prev_Page = "RFKAggem",
		Prev_Title = "Aggem Thorncurse",
	},
	["RFKOverlordRamtusk"] = {
		Title = "Overlord Ramtusk",
		Next_Page = "RFKRazorfenSpearhide",
		Next_Title = "Razorfen Spearhide".." ("..AL["Rare"]..")",
		Prev_Page = "RFKDeathSpeakerJargba",
		Prev_Title = "Death Speaker Jargba",
	},
	["RFKRazorfenSpearhide"] = {
		Title = "Razorfen Spearhide".." ("..AL["Rare"]..")",
		Next_Page = "RFKAgathelos",
		Next_Title = "Agathelos the Raging",
		Prev_Page = "RFKOverlordRamtusk",
		Prev_Title = "Overlord Ramtusk",
	},
	["RFKAgathelos"] = {
		Title = "Agathelos the Raging",
		Next_Page = "RFKBlindHunter",
		Next_Title = "Blind Hunter".." ("..AL["Rare"]..")",
		Prev_Page = "RFKRazorfenSpearhide",
		Prev_Title = "Razorfen Spearhide".." ("..AL["Rare"]..")",
	},
	["RFKBlindHunter"] = {
		Title = "Blind Hunter".." ("..AL["Rare"]..")",
		Next_Page = "RFKCharlgaRazorflank",
		Next_Title = "Charlga Razorflank",
		Prev_Page = "RFKAgathelos",
		Prev_Title = "Agathelos the Raging",
	},
	["RFKCharlgaRazorflank"] = {
		Title = "Charlga Razorflank",
		Next_Page = "RFKEarthcallerHalmgar",
		Next_Title = "Earthcaller Halmgar".." ("..AL["Rare"]..")",
		Prev_Page = "RFKBlindHunter",
		Prev_Title = "Blind Hunter".." ("..AL["Rare"]..")",
	},
	["RFKEarthcallerHalmgar"] = {
		Title = "Earthcaller Halmgar".." ("..AL["Rare"]..")",
		Next_Page = "RFKTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "RFKCharlgaRazorflank",
		Prev_Title = "Charlga Razorflank",
	},
	["RFKTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "RFKEarthcallerHalmgar",
		Prev_Title = "Earthcaller Halmgar".." ("..AL["Rare"]..")",
	},
	["AQ20Kurinnaxx"] = {
		Title = "Kurinnaxx",
		Next_Page = "AQ20Andorov",
		Next_Title = "Lieutenant General Andorov",
	},
	["AQ20Andorov"] = {
		Title = "Lieutenant General Andorov",
		Next_Page = "AQ20CAPTAIN",
		Next_Title = AtlasLoot_TableNames["AQ20CAPTAIN"][1],
		Prev_Page = "AQ20Kurinnaxx",
		Prev_Title = "Kurinnaxx",
	},
	["AQ20CAPTAIN"] = {
		Title = AtlasLoot_TableNames["AQ20CAPTAIN"][1],
		Next_Page = "AQ20Rajaxx",
		Next_Title = "General Rajaxx",
		Prev_Page = "AQ20Andorov",
		Prev_Title = "Lieutenant General Andorov",
	},
	["AQ20Rajaxx"] = {
		Title = "General Rajaxx",
		Next_Page = "AQ20Moam",
		Next_Title = "Moam",
		Prev_Page = "AQ20CAPTAIN",
		Prev_Title = AtlasLoot_TableNames["AQ20CAPTAIN"][1],
	},
	["AQ20Moam"] = {
		Title = "Moam",
		Next_Page = "AQ20Buru",
		Next_Title = "Buru the Gorger",
		Prev_Page = "AQ20Rajaxx",
		Prev_Title = "General Rajaxx",
	},
	["AQ20Buru"] = {
		Title = "Buru the Gorger",
		Next_Page = "AQ20Ayamiss",
		Next_Title = "Ayamiss the Hunter",
		Prev_Page = "AQ20Moam",
		Prev_Title = "Moam",
	},
	["AQ20Ayamiss"] = {
		Title = "Ayamiss the Hunter",
		Next_Page = "AQ20Ossirian",
		Next_Title = "Ossirian the Unscarred",
		Prev_Page = "AQ20Buru",
		Prev_Title = "Buru the Gorger",
	},
	["AQ20Ossirian"] = {
		Title = "Ossirian the Unscarred",
		Next_Page = "AQ20Trash",
		Next_Title = "Trash Mobs",
		Prev_Page = "AQ20Ayamiss",
		Prev_Title = "Ayamiss the Hunter",
	},
	["AQ20Trash"] = {
		Title = "Trash Mobs",
		Next_Page = "AQ20ClassBooks",
		Next_Title = "Class Books",
		Prev_Page = "AQ20Ossirian",
		Prev_Title = "Ossirian the Unscarred",
	},
	["AQ20ClassBooks"] = {
		Title = "Class Books",
		Prev_Page = "AQ20Trash",
		Prev_Title = "Trash Mobs",
	},
	["AQ40Skeram"] = {
		Title = "The Prophet Skeram",
		Next_Page = "AQ40Trio",
		Next_Title = "The Bug Family",
	},
	["AQ40Trio"] = {
		Title = "The Bug Family",
		Next_Page = "AQ40Sartura",
		Next_Title = "Battleguard Sartura",
		Prev_Page = "AQ40Skeram",
		Prev_Title = "The Prophet Skeram",
	},
	["AQ40Sartura"] = {
		Title = "Battleguard Sartura",
		Next_Page = "AQ40Fankriss",
		Next_Title = "Fankriss the Unyielding",
		Prev_Page = "AQ40Trio",
		Prev_Title = "The Bug Family",
	},
	["AQ40Fankriss"] = {
		Title = "Fankriss the Unyielding",
		Next_Page = "AQ40Viscidus",
		Next_Title = "Viscidus",
		Prev_Page = "AQ40Sartura",
		Prev_Title = "Battleguard Sartura",
	},
	["AQ40Viscidus"] = {
		Title = "Viscidus",
		Next_Page = "AQ40Huhuran",
		Next_Title = "Princess Huhuran",
		Prev_Page = "AQ40Fankriss",
		Prev_Title = "Fankriss the Unyielding",
	},
	["AQ40Huhuran"] = {
		Title = "Princess Huhuran",
		Next_Page = "AQ40Emperors",
		Next_Title = "The Twin Emperors",
		Prev_Page = "AQ40Viscidus",
		Prev_Title = "Viscidus",
	},
	["AQ40Emperors"] = {
		Title = "The Twin Emperors",
		Next_Page = "AQ40Ouro",
		Next_Title = "Ouro",
		Prev_Page = "AQ40Huhuran",
		Prev_Title = "Princess Huhuran",
	},
	["AQ40Ouro"] = {
		Title = "Ouro",
		Next_Page = "AQ40CThun",
		Next_Title = "C'Thun",
		Prev_Page = "AQ40Emperors",
		Prev_Title = "The Twin Emperors",
	},
	["AQ40CThun"] = {
		Title = "C'Thun",
		Next_Page = "AQ40Trash1",
		Next_Title = "Trash Mobs",
		Prev_Page = "AQ40Ouro",
		Prev_Title = "Ouro",
	},
	["AQ40Trash1"] = {
		Title = "Trash Mobs",
		Next_Page = "AQEnchants",
		Next_Title = "AQ Enchants",
		Prev_Page = "AQ40CThun",
		Prev_Title = "C'Thun",
	},
	["AQEnchants"] = {
		Title = "AQ Enchants",
		Next_Page = "AQOpening",
		Next_Title = "AQ Opening Quest Chain",
		Prev_Page = "AQ40Trash1",
		Prev_Title = "Trash Mobs",
	},
	["AQOpening"] = {
		Title = "AQ Opening Quest Chain",
		Prev_Page = "AQEnchants",
		Prev_Title = "AQ Enchants",
	},
	["WCLordCobrahn"] = {
		Title = "Lord Cobrahn",
		Next_Page = "WCLadyAnacondra",
		Next_Title = "Lady Anacondra",
	},
	["WCLadyAnacondra"] = {
		Title = "Lady Anacondra",
		Next_Page = "WCKresh",
		Next_Title = "Kresh",
		Prev_Page = "WCLordCobrahn",
		Prev_Title = "Lord Cobrahn",
	},
	["WCKresh"] = {
		Title = "Kresh",
		Next_Page = "WCLordPythas",
		Next_Title = "Lord Pythas",
		Prev_Page = "WCLadyAnacondra",
		Prev_Title = "Lady Anacondra",
	},
	["WCLordPythas"] = {
		Title = "Lord Pythas",
		Next_Page = "WCSkum",
		Next_Title = "Skum",
		Prev_Page = "WCKresh",
		Prev_Title = "Kresh",
	},
	["WCSkum"] = {
		Title = "Skum",
		Next_Page = "WCLordSerpentis",
		Next_Title = "Lord Serpentis",
		Prev_Page = "WCLordPythas",
		Prev_Title = "Lord Pythas",
	},
	["WCLordSerpentis"] = {
		Title = "Lord Serpentis",
		Next_Page = "WCVerdan",
		Next_Title = "Verdan the Everliving",
		Prev_Page = "WCSkum",
		Prev_Title = "Skum",
	},
	["WCVerdan"] = {
		Title = "Verdan the Everliving",
		Next_Page = "WCMutanus",
		Next_Title = "Mutanus the Devourer",
		Prev_Page = "WCLordSerpentis",
		Prev_Title = "Lord Serpentis",
	},
	["WCMutanus"] = {
		Title = "Mutanus the Devourer",
		Next_Page = "WCDeviateFaerieDragon",
		Next_Title = "Deviate Faerie Dragon".." ("..AL["Rare"]..")",
		Prev_Page = "WCVerdan",
		Prev_Title = "Verdan the Everliving",
	},
	["WCDeviateFaerieDragon"] = {
		Title = "Deviate Faerie Dragon".." ("..AL["Rare"]..")",
		Next_Page = "WCTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "WCMutanus",
		Prev_Title = "Mutanus the Devourer",
	},
	["WCTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "WCDeviateFaerieDragon",
		Prev_Title = "Deviate Faerie Dragon".." ("..AL["Rare"]..")",
	},
	["ZFAntusul"] = {
		Title = "Antu'sul",
		Next_Page = "ZFWitchDoctorZumrah",
		Next_Title = "Witch Doctor Zum'rah",
	},
	["ZFWitchDoctorZumrah"] = {
		Title = "Witch Doctor Zum'rah",
		Next_Page = "ZFSezzziz",
		Next_Title = "Shadowpriest Sezz'ziz",
		Prev_Page = "ZFAntusul",
		Prev_Title = "Antu'sul",
	},
	["ZFSezzziz"] = {
		Title = "Shadowpriest Sezz'ziz",
		Next_Page = "ZFDustwraith",
		Next_Title = "Dustwraith".." ("..AL["Rare"]..")",
		Prev_Page = "ZFWitchDoctorZumrah",
		Prev_Title = "Witch Doctor Zum'rah",
	},
	["ZFDustwraith"] = {
		Title = "Dustwraith".." ("..AL["Rare"]..")",
		Next_Page = "ZFZerillis",
		Next_Title = "Zerillis".." ("..AL["Rare"]..")",
		Prev_Page = "ZFSezzziz",
		Prev_Title = "Shadowpriest Sezz'ziz",
	},
	["ZFZerillis"] = {
		Title = "Zerillis".." ("..AL["Rare"]..")",
		Next_Page = "ZFGahzrilla",
		Next_Title = "Gahz'rilla",
		Prev_Page = "ZFDustwraith",
		Prev_Title = "Dustwraith".." ("..AL["Rare"]..")",
	},
	["ZFGahzrilla"] = {
		Title = "Gahz'rilla",
		Next_Page = "ZFChiefUkorzSandscalp",
		Next_Title = "Chief Ukorz Sandscalp",
		Prev_Page = "ZFZerillis",
		Prev_Title = "Zerillis".." ("..AL["Rare"]..")",
	},
	["ZFChiefUkorzSandscalp"] = {
		Title = "Chief Ukorz Sandscalp",
		Next_Page = "ZFTrash",
		Next_Title = "Trash Mobs",
		Prev_Page = "ZFGahzrilla",
		Prev_Title = "Gahz'rilla",
	},
	["ZFTrash"] = {
		Title = "Trash Mobs",
		Prev_Page = "ZFChiefUkorzSandscalp",
		Prev_Title = "Chief Ukorz Sandscalp",
	},

	-- Emerald Sanctum
	["ESErennius"] = {
		Title = AL["Erennius"],
		Next_Page = "ESSolnius1",
		Next_Title = AL["Solnius the Awakener"],
		Prev_Page = "ESTrash",
		Prev_Title = AL["Trash Mobs"],
	},
	["ESSolnius1"] = {
		Title = AL["Solnius the Awakener"],
		Next_Page = "ESSolnius2",
		Next_Title = AL["Solnius the Awakener (Page 2)"],
		Prev_Page = "ESErennius",
		Prev_Title = AL["Erennius"],
	},
	["ESSolnius2"] = {
		Title = AL["Solnius the Awakener (Page 2)"],
		Next_Page = "ESHardMode",
		Next_Title = AL["Favor of Erennius (ES Hard Mode)"],
		Prev_Page = "ESSolnius1",
		Prev_Title = AL["Solnius the Awakener"],
	},
	["ESHardMode"] = {
		Title = AL["Favor of Erennius (ES Hard Mode)"],
		Next_Page = "ESTrash",
		Next_Title = AL["Trash Mobs"],
		Prev_Page = "ESSolnius2",
		Prev_Title = AL["Solnius the Awakener"],
	},
	["ESTrash"] = {
		Title = AL["Trash Mobs"],
		Next_Page = "ESErennius",
		Next_Title = AL["Erennius"],
		Prev_Page = "ESSolnius2",
		Prev_Title = AL["Solnius the Awakener (Page 2)"],
	},

	-- Lower Karazhan Halls
	["LKHRolfen"] = {
		Title = AL["Master Blacksmith Rolfen"],
		Next_Page = "LKHBroodQueenAraxxna",
		Next_Title = AL["Brood Queen Araxxna"],
		Prev_Page = "LKHEnchants",
		Prev_Title = AL["LKH Enchants"],
	},
	["LKHBroodQueenAraxxna"] = {
		Title = AL["Brood Queen Araxxna"],
		Next_Page = "LKHLordBlackwaldII",
		Next_Title = AL["Lord Blackwald II"],
		Prev_Page = "LKHRolfen",
		Prev_Title = AL["Master Blacksmith Rolfen"],
	},
	["LKHLordBlackwaldII"] = {
		Title = AL["Lord Blackwald II"],
		Prev_Page = "LKHBroodQueenAraxxna",
		Prev_Title = AL["Brood Queen Araxxna"],
		Next_Page = "LKHClawlordHowlfang",
		Next_Title = AL["Clawlord Howlfang"],
	},
	["LKHClawlordHowlfang"] = {
		Title = AL["Clawlord Howlfang"],
		Next_Page = "LKHGrizikil",
		Next_Title = AL["Grizikil"],
		Prev_Page = "LKHLordBlackwaldII",
		Prev_Title = AL["Lord Blackwald II"],
	},
	["LKHGrizikil"] = {
		Title = AL["Grizikil"],
		Next_Page = "LKHMoroes",
		Next_Title = AL["Moroes"],
		Prev_Page = "LKHClawlordHowlfang",
		Prev_Title = AL["Clawlord Howlfang"],
	},
	["LKHMoroes"] = {
		Title = AL["Moroes"],
		Next_Page = "LKHTrash",
		Next_Title = AL["Trash Mobs"],
		Prev_Page = "LKHGrizikil",
		Prev_Title = AL["Grizikil"],
	},
	["LKHTrash"] = {
		Title = AL["Trash Mobs"],
		Next_Page = "LKHEnchants",
		Next_Title = AL["LKH Enchants"],
		Prev_Page = "LKHMoroes",
		Prev_Title = AL["Moroes"],
	},
	["LKHEnchants"] = {
		Title = AL["LKH Enchants"],
		Next_Page = "LKHRolfen",
		Next_Title = AL["Master Blacksmith Rolfen"],
		Prev_Page = "LKHTrash",
		Prev_Title = AL["Trash Mobs"],
	},

	-- World Bosses
	["AAzuregos"] = {
		Title = "Azuregos",
		Next_Page = "DEmeriss",
		Next_Title = "Emeriss",
		Prev_Page = "CowKing",
		Prev_Title = "There Is No Cow Level",
	},
	["DEmeriss"] = {
		Title = "Emeriss",
		Next_Page = "DLethon",
		Next_Title = "Lethon",
		Prev_Page = "AAzuregos",
		Prev_Title = "Azuregos",
	},
	["DLethon"] = {
		Title = "Lethon",
		Next_Page = "DTaerar",
		Next_Title = "Taerar",
		Prev_Page = "DEmeriss",
		Prev_Title = "Emeriss",
	},
	["DTaerar"] = {
		Title = "Taerar",
		Next_Page = "DYsondre",
		Next_Title = "Ysondre",
		Prev_Page = "DLethon",
		Prev_Title = "Lethon",
	},
	["DYsondre"] = {
		Title = "Ysondre",
		Next_Page = "KKazzak",
		Next_Title = "Lord Kazzak",
		Prev_Page = "DTaerar",
		Prev_Title = "Taerar",
	},
	["KKazzak"] = {
		Title = "Lord Kazzak",
		Next_Page = "Turtlhu",
		Next_Title = "Turtlhu, the Black Turtle of Doom",
		Prev_Page = "DYsondre",
		Prev_Title = "Ysondre"
	},
	["Turtlhu"] = {
		Title = "Turtlhu, the Black Turtle of Doom",
		Next_Page = "Nerubian",
		Next_Title = "Nerubian Overseer",
		Prev_Page = "KKazzak",
		Prev_Title = "Lord Kazzak"
	},
	["Nerubian"] = {
		Title = "Nerubian Overseer",
		Next_Page = "Reaver",
		Next_Title = "Dark Reaver of Karazhan",
		Prev_Page = "Turtlhu",
		Prev_Title = "Turtlhu, the Black Turtle of Doom",
	},
	["Reaver"] = {
		Title = "Dark Reaver of Karazhan",
		Next_Page = "Ostarius",
		Next_Title = "Ostarius",
		Prev_Page = "Nerubian",
		Prev_Title = "Nerubian Overseer",
	},
	["Ostarius"] = {
		Title = "Ostarius",
		Next_Page = "Concavius",
		Next_Title = "Concavius",
		Prev_Page = "Reaver",
		Prev_Title = "Dark Reaver of Karazhan",
	},
	["Concavius"] = {
		Title = AL["Concavius"],
		Next_Page = "CowKing",
		Next_Title = AL["The Cow King"],
		Prev_Page = "Ostarius",
		Prev_Title = AL["Ostarius"],
	},
	["CowKing"] = {
		Title = AL["There Is No Cow Level"],
		Next_Page =	"AAzuregos",
		Next_Title = AL["Azuregos"],
		Prev_Page = "Concavius",
		Prev_Title = AL["Concavius"],
	},
	--WoW Factions
	["Argent1"] = {
		Title = BF["Argent Dawn"]..": "..AL["Token Hand-Ins"],
		Next_Page = "Argent2",
		Next_Title = BF["Argent Dawn"]..": "..BF["Friendly"].."-"..BF["Exalted"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Argent2"] = {
		Title = BF["Argent Dawn"]..": "..BF["Friendly"].."-"..BF["Honored"],
		Prev_Page = "Argent1",
		Prev_Title = BF["Argent Dawn"]..": "..AL["Token Hand-Ins"],
		Next_Page = "Argent3",
		Next_Title = BF["Argent Dawn"]..": "..BF["Revered"].."-"..BF["Exalted"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Argent3"] = {
		Title = BF["Argent Dawn"]..": "..BF["Revered"].."-"..BF["Exalted"],
		Prev_Page = "Argent2",
		Prev_Title = BF["Argent Dawn"]..": "..BF["Friendly"].."-"..BF["Honored"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Bloodsail1"] = {
		Title = BF["Bloodsail Buccaneers"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Warderns1"] = {
		Title = AL["Wardens of Time"] .. ": " .. AL["Friendly"] .. " & " .. AL["Honored"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"],
		Next_Page = "Warderns2",
		Next_Title = AL["Wardens of Time"] .. ": " .. AL["Revered"] .. " & " .. AL["Exalted"],
		Prev_Page = "Warderns2",
		Prev_Title = AL["Wardens of Time"] .. ": " .. AL["Revered"] .. " & " .. AL["Exalted"],
	},
	["Warderns2"] = {
		Title = AL["Wardens of Time"] .. ": " .. AL["Revered"] .. " & " .. AL["Exalted"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"],
		Next_Page = "Warderns1",
		Next_Title = AL["Wardens of Time"] .. ": " .. AL["Friendly"] .. " & " .. AL["Honored"],
		Prev_Page = "Warderns1",
		Prev_Title = AL["Wardens of Time"] .. ": " .. AL["Friendly"] .. " & " .. AL["Honored"],
	},
	["AQBroodRings"] = {
		Title = BF["Brood of Nozdormu"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Cenarion1"] = {
		Title = BF["Cenarion Circle"]..": "..BF["Friendly"],
		Next_Page = "Cenarion2",
		Next_Title = BF["Cenarion Circle"]..": "..BF["Honored"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Cenarion2"] = {
		Title = BF["Cenarion Circle"]..": "..BF["Honored"],
		Next_Page = "Cenarion3",
		Next_Title = BF["Cenarion Circle"]..": "..BF["Revered"],
		Prev_Page = "Cenarion1",
		Prev_Title = BF["Cenarion Circle"]..": "..BF["Friendly"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Cenarion3"] = {
		Title = BF["Cenarion Circle"]..": "..BF["Revered"],
		Next_Page = "Cenarion4",
		Next_Title = BF["Cenarion Circle"]..": "..BF["Exalted"],
		Prev_Page = "Cenarion2",
		Prev_Title = BF["Cenarion Circle"]..": "..BF["Honored"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Cenarion4"] = {
		Title = BF["Cenarion Circle"]..": "..BF["Exalted"],
		Prev_Page = "Cenarion3",
		Prev_Title = BF["Cenarion Circle"]..": "..BF["Revered"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Darkmoon"] = {
		Title = BF["Darkmoon Faire"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Defilers"] = {
		Title = BF["The Defilers"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Frostwolf1"] = {
		Title = BF["Frostwolf Clan"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["GelkisClan1"] = {
		Title = BF["Gelkis Clan Centaur"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["WaterLords1"] = {
		Title = BF["Hydraxian Waterlords"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["LeagueofArathor"] = {
		Title = BF["The League of Arathor"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
		},
	["Ironforge"] = {
		Title = BF["Ironforge"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"],
	},
	["Darnassus"] = {
		Title = BF["Darnassus"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"],
	},
	["Stormwind"] = {
		Title = BF["Stormwind"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"],
	},
	["GnomereganExiles"] = {
		Title = BF["Gnomeregan Exiles"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"],
	},
	["DarkspearTrolls"] = {
		Title = BF["Darkspear Trolls"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"],
	},
	["DurotarLaborUnion"] = {
		Title = "Durotar Labor Union",
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"],
	},
	["Undercity"] = {
		Title = BF["Undercity"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"],
	},
	["Orgrimmar"] = {
		Title = BF["Orgrimmar"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"],
	},
	["ThunderBluff"] = {
		Title = BF["Thunder Bluff"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"],
	},
	["Dalaran"] = {
		Title = "Dalaran",
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"],
	},
	["Helf"] = {
		Title = "Silvermoon Remnant",
		Next_Page = "Helf2",
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Helf2"] = {
		Title = "Silvermoon Remnant",
		Next_Page = "Helf3",
		Prev_Page = "Helf",
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Helf3"] = {
		Title = "Silvermoon Remnant",
		Prev_Page = "Helf2",
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Revantusk"] = {
		Title = "Revantusk Trolls",
		Next_Page = "Revantusk2",
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Revantusk2"] = {
		Title = "Revantusk Trolls",
		Next_Page = "Revantusk3",
		Prev_Page = "Revantusk",
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Revantusk3"] = {
		Title = "Revantusk Trolls",
		Prev_Page = "Revantusk2",
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["MagramClan1"] = {
		Title = BF["Magram Clan Centaur"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Stormpike1"] = {
		Title = BF["Stormpike Guard"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Thorium1"] = {
		Title = BF["Thorium Brotherhood"]..": "..BF["Friendly"].."/"..BF["Honored"],
		Next_Page = "Thorium2",
		Next_Title = BF["Thorium Brotherhood"]..": "..BF["Revered"].."/"..BF["Exalted"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Thorium2"] = {
		Title = BF["Thorium Brotherhood"]..": "..BF["Revered"].."/"..BF["Exalted"],
		Prev_Page = "Thorium1",
		Prev_Title = BF["Thorium Brotherhood"]..": "..BF["Friendly"].."/"..BF["Honored"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Timbermaw"] = {
		Title = BF["Timbermaw Hold"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Wildhammer"] = {
		Title = BF["Wildhammer Clan"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"],
	},
	["Wintersaber1"] = {
		Title = BF["Wintersaber Trainers"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Zandalar1"] = {
		Title = BF["Zandalar Tribe"]..": "..BF["Friendly"].."/"..BF["Honored"],
		Next_Page = "Zandalar2",
		Next_Title = BF["Zandalar Tribe"]..": "..BF["Revered"].."/"..BF["Exalted"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["Zandalar2"] = {
		Title = BF["Zandalar Tribe"]..": "..BF["Revered"].."/"..BF["Exalted"],
		Prev_Page = "Zandalar1",
		Prev_Title = BF["Zandalar Tribe"]..": "..BF["Friendly"].."/"..BF["Honored"],
		Back_Page = "REPMENU",
		Back_Title = AL["Factions"]
	},
	["BRRepFriendly"] = {
		Title = AL["Blood Ring Friendly Rewards"],
		Back_Page = "BRRepMenu",
		Prev_Page = "BRRepTokens",
		Prev_Title = AL["Token of Blood Rewards"],
		Next_Page = "BRRepHonored",
		Next_Title = AL["Blood Ring Honored Rewards"],
	},
	["BRRepHonored"] = {
		Title = AL["Blood Ring Honored Rewards"],
		Back_Page = "BRRepMenu",
		Prev_Page = "BRRepFriendly",
		Prev_Title = AL["Blood Ring Friendly Rewards"],
		Next_Page = "BRRepRevered",
		Next_Title = AL["Blood Ring Revered Rewards"],
	},
	["BRRepRevered"] = {
		Title = AL["Blood Ring Revered Rewards"],
		Back_Page = "BRRepMenu",
		Prev_Page = "BRRepHonored",
		Prev_Title = AL["Blood Ring Honored Rewards"],
		Next_Page = "BRRepExalted",
		Next_Title = AL["Blood Ring Exalted Rewards"],
	},
	["BRRepExalted"] = {
		Title = AL["Blood Ring Exalted Rewards"],
		Back_Page = "BRRepMenu",
		Prev_Page = "BRRepRevered",
		Prev_Title = AL["Blood Ring Revered Rewards"],
		Next_Page = "BRRepTokens",
		Next_Title = AL["Token of Blood Rewards"],
	},
	["BRRepTokens"] = {
		Title = AL["Token of Blood Rewards"],
		Back_Page = "BRRepMenu",
		Prev_Page = "BRRepExalted",
		Prev_Title = AL["Blood Ring Exalted Rewards"],
		Next_Page = "BRRepFriendly",
		Next_Title = AL["Blood Ring Friendly Rewards"],
	},
	["ABRepFriendly2029"] = {
		Back_Page = "ABRepMenu",
		Title = "AB 20-29 Friendly Rewards",
		Next_Page = "ABRepFriendly3039",
		Prev_Page = "ABRepExalted",
	},
	["ABRepFriendly3039"] = {
		Back_Page = "ABRepMenu",
		Title = "AB 30-39 Friendly Rewards",
		Next_Page = "ABRepFriendly4049",
		Prev_Page = "ABRepFriendly2029",
	},
	["ABRepFriendly4049"] = {
		Back_Page = "ABRepMenu",
		Title = "AB 40-49 Friendly Rewards",
		Next_Page = "ABRepFriendly5059",
		Prev_Page = "ABRepFriendly3039",
	},
	["ABRepFriendly5059"] = {
		Back_Page = "ABRepMenu",
		Title = "AB 50-59 Friendly Rewards",
		Next_Page = "ABRepHonored2029",
		Prev_Page = "ABRepFriendly4049",
	},
	["ABRepHonored2029"] = {
		Back_Page = "ABRepMenu",
		Title = AL["AB 20-29 Honored Rewards"],
		Next_Page = "ABRepHonored3039",
		Prev_Page = "ABRepFriendly5059",
	},
	["ABRepHonored3039"] = {
		Back_Page = "ABRepMenu",
		Title = AL["AB 30-39 Honored Rewards"],
		Next_Page = "ABRepHonored4049",
		Prev_Page = "ABRepHonored2029",
	},
	["ABRepHonored4049"] = {
		Back_Page = "ABRepMenu",
		Title = AL["AB 40-49 Honored Rewards"],
		Next_Page = "ABRepHonored5059",
		Prev_Page = "ABRepHonored3039",
	},
	["ABRepHonored5059"] = {
		Back_Page = "ABRepMenu",
		Title = AL["AB 50-59 Honored Rewards"],
		Next_Page = "ABRepRevered2029",
		Prev_Page = "ABRepHonored4049",
	},
	["ABRepRevered2029"] = {
		Back_Page = "ABRepMenu",
		Title = AL["AB 20-29 Revered Rewards"],
		Next_Page = "ABRepRevered3039",
		Prev_Page = "ABRepHonored5059",
	},
	["ABRepRevered3039"] = {
		Back_Page = "ABRepMenu",
		Title = AL["AB 30-39 Revered Rewards"],
		Next_Page = "ABRepRevered4049",
		Prev_Page = "ABRepRevered2029",
	},
	["ABRepRevered4049"] = {
		Back_Page = "ABRepMenu",
		Title = AL["AB 40-49 Revered Rewards"],
		Next_Page = "ABRepRevered5059",
		Prev_Page = "ABRepRevered3039",
	},
	["ABRepRevered5059"] = {
		Back_Page = "ABRepMenu",
		Title = AL["AB 50-59 Revered Rewards"],
		Next_Page = "ABRepExalted",
		Prev_Page = "ABRepRevered4049",
	},
	["ABRepExalted"] = {
		Back_Page = "ABRepMenu",
		Title = AL["AB Exalted Rewards"],
		Prev_Page = "ABRepRevered5059",
		Next_Page = "ABRepFriendly2029",
	},
	["AVRepFriendly"] = {
		Title = AL["Friendly Reputation Rewards"],
		Back_Page = "AVRepMenu",
		Prev_Page = "AVLokholarIvus",
		Prev_Title = AL["Ivus & Lokholar"],
		Next_Page = "AVRepHonored",
		Next_Title = AL["AV Honored Rewards"],
	},
	["AVRepHonored"] = {
		Title = AL["Honored Reputation Rewards"],
		Back_Page = "AVRepMenu",
		Prev_Page = "AVRepFriendly",
		Prev_Title = AL["AV Friendly Rewards"],
		Next_Page = "AVRepRevered",
		Next_Title = AL["AV Revered Rewards"],
	},
	["AVRepRevered"] = {
		Title = AL["Revered Reputation Rewards"],
		Back_Page = "AVRepMenu",
		Prev_Page = "AVRepHonored",
		Prev_Title = AL["AV Honored Rewards"],
		Next_Page = "AVRepExalted",
		Next_Title = AL["AV Exalted Rewards"],
	},
	["AVRepExalted"] = {
		Title = AL["Exalted Reputation Rewards"],
		Back_Page = "AVRepMenu",
		Prev_Page = "AVRepRevered",
		Prev_Title = AL["AV Revered Rewards"],
		Next_Page = "AVKorrak",
		Next_Title = AL["Korrak the Bloodrager"],
	},
	["AVKorrak"] = {
		Title = AL["Korrak the Bloodrager"],
		Back_Page = "AVRepMenu",
		Prev_Page = "AVRepExalted",
		Prev_Title = AL["AV Exalted Rewards"],
		Next_Page = "AVLokholarIvus",
		Next_Title = AL["Ivus & Lokholar"],
	},
	["AVLokholarIvus"] = {
		Title = AL["Ivus & Lokholar"],
		Back_Page = "AVRepMenu",
		Prev_Page = "AVKorrak",
		Prev_Title = AL["Korrak the Bloodrager"],
		Next_Page = "AVRepFriendly",
		Next_Title = AL["AV Friendly Rewards"],
	},
	["WSGRepFriendly2029"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 20-29 Friendly Rewards",
		Next_Page = "WSGRepFriendly3039",
		Prev_Page = "WSGRepExalted60",
	},
	["WSGRepFriendly3039"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 30-39 Friendly Rewards",
		Next_Page = "WSGRepFriendly4049",
		Prev_Page = "WSGRepFriendly2029",
	},
	["WSGRepFriendly4049"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 40-49 Friendly Rewards",
		Next_Page = "WSGRepHonored1019",
		Prev_Page = "WSGRepFriendly3039",
	},
	["WSGRepHonored1019"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 10-19 Honored Rewards",
		Next_Page = "WSGRepHonored2029",
		Prev_Page = "WSGRepFriendly4049",
	},
	["WSGRepHonored2029"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 20-29 Honored Rewards",
		Next_Page = "WSGRepHonored3039",
		Prev_Page = "WSGRepHonored1019",
	},
	["WSGRepHonored3039"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 30-39 Honored Rewards",
		Next_Page = "WSGRepHonored4049",
		Prev_Page = "WSGRepHonored2029",
	},
	["WSGRepHonored4049"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 40-49 Honored Rewards",
		Next_Page = "WSGRepHonored5059",
		Prev_Page = "WSGRepHonored3039",
	},
	["WSGRepHonored5059"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 50-59 Honored Rewards",
		Next_Page = "WSGRepRevered1019",
		Prev_Page = "WSGRepHonored4049",
	},
	["WSGRepRevered1019"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 10-19 Revered Rewards",
		Next_Page = "WSGRepRevered2029",
		Prev_Page = "WSGRepHonored5059",
	},
	["WSGRepRevered2029"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 20-29 Revered Rewards",
		Next_Page = "WSGRepRevered3039",
		Prev_Page = "WSGRepRevered1019",
	},
	["WSGRepRevered3039"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 30-39 Revered Rewards",
		Next_Page = "WSGRepRevered4049",
		Prev_Page = "WSGRepRevered2029",
	},
	["WSGRepRevered4049"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 40-49 Revered Rewards",
		Next_Page = "WSGRepRevered5059",
		Prev_Page = "WSGRepRevered3039",
	},
	["WSGRepRevered5059"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 50-59 Revered Rewards",
		Next_Page = "WSGRepExalted4049",
		Prev_Page = "WSGRepRevered4049",
	},
	["WSGRepExalted4049"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 40-49 Exalted Rewards",
		Next_Page = "WSGRepExalted5059",
		Prev_Page = "WSGRepRevered5059",
	},
	["WSGRepExalted5059"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 50-59 Exalted Rewards",
		Next_Page = "WSGRepExalted60",
		Prev_Page = "WSGRepExalted4049",
	},
	["WSGRepExalted60"] = {
		Back_Page = "WSGRepMenu",
		Title = "WSG 60 Exalted Rewards",
		Prev_Page = "WSGRepExalted5059",
		Next_Page = "WSGRepFriendly2029",
	},
	["PvP60Accessories1"] = {
		Title = AL["PvP Trinkets"],
		Next_Page = "PvP60Accessories2",
		Next_Title = AtlasLoot_TableNames["PvP60Accessories2"][1],
		Back_Page = "PVPMENU",
		Back_Title = AL["PvP Rewards"]
	},
	["PvP60Accessories2"] = {
		Title = AtlasLoot_TableNames["PvP60Accessories2"][1],
		Next_Page = "PvP60Accessories3",
		Next_Title = AtlasLoot_TableNames["PvP60Accessories3"][1],
		Prev_Page = "PvP60Accessories1",
		Prev_Title = AL["PvP Accessories"]..": "..AL["Level 60"],
		Back_Page = "PVPMENU",
		Back_Title = AL["PvP Rewards"]
	},
	["PvP60Accessories3"] = {
		Title = AtlasLoot_TableNames["PvP60Accessories3"][1],
		Prev_Page = "PvP60Accessories2",
		Prev_Title = AtlasLoot_TableNames["PvP60Accessories2"][1],
		Back_Page = "PVPMENU",
		Back_Title = AL["PvP Rewards"]
	},
	["PVPWeapons1"] = {
		Title = AL["Rank 14 Weapons"],
		Next_Page = "PVPWeapons2",
		Next_Title = AL["Rank 14 Weapons"],
		Back_Page = "PVPMENU",
		Back_Title = AL["PvP Rewards"]
	},
	["PVPWeapons2"] = {
		Title = AL["Rank 14 Weapons"],
		Prev_Page = "PVPWeapons1",
		Prev_Title = AL["Rank 14 Weapons"],
		Back_Page = "PVPMENU",
		Back_Title = AL["PvP Rewards"]
	},
	["PVPDruid"] = {
		Title = BC["Druid"],
		Back_Page = "PVPSET",
		Back_Title = AL["PvP Armor Sets"]
	},
	["PVPHunter"] = {
		Title = BC["Hunter"],
		Back_Page = "PVPSET",
		Back_Title = AL["PvP Armor Sets"]
	},
	["PVPMage"] = {
		Title = BC["Mage"],
		Back_Page = "PVPSET",
		Back_Title = AL["PvP Armor Sets"]
	},
	["PVPPaladin"] = {
		Title = BC["Paladin"],
		Back_Page = "PVPSET",
		Back_Title = AL["PvP Armor Sets"]
	},
	["PVPPriest"] = {
		Title = BC["Priest"],
		Back_Page = "PVPSET",
		Back_Title = AL["PvP Armor Sets"]
	},
	["PVPRogue"] = {
		Title = BC["Rogue"],
		Back_Page = "PVPSET",
		Back_Title = AL["PvP Armor Sets"]
	},
	["PVPShaman"] = {
		Title = BC["Shaman"],
		Back_Page = "PVPSET",
		Back_Title = AL["PvP Armor Sets"]
	},
	["PVPWarlock"] = {
		Title = BC["Warlock"],
		Back_Page = "PVPSET",
		Back_Title = AL["PvP Armor Sets"]
	},
	["PVPWarrior"] = {
		Title = BC["Warrior"],
		Back_Page = "PVPSET",
		Back_Title = AL["PvP Armor Sets"]
	},
	["T0Druid"] = {
		Title = BC["Druid"],
		Back_Page = "T0SET",
		Back_Title = AL["Tier 0/0.5 Sets"]
	},
	["T0Hunter"] = {
		Title = BC["Hunter"],
		Back_Page = "T0SET",
		Back_Title = AL["Tier 0/0.5 Sets"]
	},
	["T0Mage"] = {
		Title = BC["Mage"],
		Back_Page = "T0SET",
		Back_Title = AL["Tier 0/0.5 Sets"]
	},
	["T0Paladin"] = {
		Title = BC["Paladin"],
		Back_Page = "T0SET",
		Back_Title = AL["Tier 0/0.5 Sets"]
	},
	["T0Priest"] = {
		Title = BC["Priest"],
		Back_Page = "T0SET",
		Back_Title = AL["Tier 0/0.5 Sets"]
	},
	["T0Rogue"] = {
		Title = BC["Rogue"],
		Back_Page = "T0SET",
		Back_Title = AL["Tier 0/0.5 Sets"]
	},
	["T0Shaman"] = {
		Title = BC["Shaman"],
		Back_Page = "T0SET",
		Back_Title = AL["Tier 0/0.5 Sets"]
	},
	["T0Warlock"] = {
		Title = BC["Warlock"],
		Back_Page = "T0SET",
		Back_Title = AL["Tier 0/0.5 Sets"]
	},
	["T0Warrior"] = {
		Title = BC["Warrior"],
		Back_Page = "T0SET",
		Back_Title = AL["Tier 0/0.5 Sets"]
	},
	["T1Druid"] = {
		Title = BC["Druid"],
		Back_Page = "T1SET",
		Back_Title = AL["Tier 1 Sets"]
	},
	["T1Hunter"] = {
		Title = BC["Hunter"],
		Back_Page = "T1SET",
		Back_Title = AL["Tier 1 Sets"]
	},
	["T1Mage"] = {
		Title = BC["Mage"],
		Back_Page = "T1SET",
		Back_Title = AL["Tier 1 Sets"]
	},
	["T1Paladin"] = {
		Title = BC["Paladin"],
		Back_Page = "T1SET",
		Back_Title = AL["Tier 1 Sets"]
	},
	["T1Priest"] = {
		Title = BC["Priest"],
		Back_Page = "T1SET",
		Back_Title = AL["Tier 1 Sets"]
	},
	["T1Rogue"] = {
		Title = BC["Rogue"],
		Back_Page = "T1SET",
		Back_Title = AL["Tier 1 Sets"]
	},
	["T1Shaman"] = {
		Title = BC["Shaman"],
		Back_Page = "T1SET",
		Back_Title = AL["Tier 1 Sets"]
	},
	["T1Warlock"] = {
		Title = BC["Warlock"],
		Back_Page = "T1SET",
		Back_Title = AL["Tier 1 Sets"]
	},
	["T1Warrior"] = {
		Title = BC["Warrior"],
		Back_Page = "T1SET",
		Back_Title = AL["Tier 1 Sets"]
	},
	["T2Druid"] = {
		Title = BC["Druid"],
		Back_Page = "T2SET",
		Back_Title = AL["Tier 2 Sets"]
	},
	["T2Hunter"] = {
		Title = BC["Hunter"],
		Back_Page = "T2SET",
		Back_Title = AL["Tier 2 Sets"]
	},
	["T2Mage"] = {
		Title = BC["Mage"],
		Back_Page = "T2SET",
		Back_Title = AL["Tier 2 Sets"]
	},
	["T2Paladin"] = {
		Title = BC["Paladin"],
		Back_Page = "T2SET",
		Back_Title = AL["Tier 2 Sets"]
	},
	["T2Priest"] = {
		Title = BC["Priest"],
		Back_Page = "T2SET",
		Back_Title = AL["Tier 2 Sets"]
	},
	["T2Rogue"] = {
		Title = BC["Rogue"],
		Back_Page = "T2SET",
		Back_Title = AL["Tier 2 Sets"]
	},
	["T2Shaman"] = {
		Title = BC["Shaman"],
		Back_Page = "T2SET",
		Back_Title = AL["Tier 2 Sets"]
	},
	["T2Warlock"] = {
		Title = BC["Warlock"],
		Back_Page = "T2SET",
		Back_Title = AL["Tier 2 Sets"]
	},
	["T2Warrior"] = {
		Title = BC["Warrior"],
		Back_Page = "T2SET",
		Back_Title = AL["Tier 2 Sets"]
	},
	["T3Druid"] = {
		Title = BC["Druid"],
		Back_Page = "T3SET",
		Back_Title = AL["Tier 3 Sets"]
	},
	["T3Hunter"] = {
		Title = BC["Hunter"],
		Back_Page = "T3SET",
		Back_Title = AL["Tier 3 Sets"]
	},
	["T3Mage"] = {
		Title = BC["Mage"],
		Back_Page = "T3SET",
		Back_Title = AL["Tier 3 Sets"]
	},
	["T3Paladin"] = {
		Title = BC["Paladin"],
		Back_Page = "T3SET",
		Back_Title = AL["Tier 3 Sets"]
	},
	["T3Priest"] = {
		Title = BC["Priest"],
		Back_Page = "T3SET",
		Back_Title = AL["Tier 3 Sets"]
	},
	["T3Rogue"] = {
		Title = BC["Rogue"],
		Back_Page = "T3SET",
		Back_Title = AL["Tier 3 Sets"]
	},
	["T3Shaman"] = {
		Title = BC["Shaman"],
		Back_Page = "T3SET",
		Back_Title = AL["Tier 3 Sets"]
	},
	["T3Warlock"] = {
		Title = BC["Warlock"],
		Back_Page = "T3SET",
		Back_Title = AL["Tier 3 Sets"]
	},
	["T3Warrior"] = {
		Title = BC["Warrior"],
		Back_Page = "T3SET",
		Back_Title = AL["Tier 3 Sets"]
	},
	["AQ40Druid"] = {
		Title = BC["Druid"],
		Back_Page = "AQ40SET",
		Back_Title = AL["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Hunter"] = {
		Title = BC["Hunter"],
		Back_Page = "AQ40SET",
		Back_Title = AL["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Mage"] = {
		Title = BC["Mage"],
		Back_Page = "AQ40SET",
		Back_Title = AL["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Paladin"] = {
		Title = BC["Paladin"],
		Back_Page = "AQ40SET",
		Back_Title = AL["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Priest"] = {
		Title = BC["Priest"],
		Back_Page = "AQ40SET",
		Back_Title = AL["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Rogue"] = {
		Title = BC["Rogue"],
		Back_Page = "AQ40SET",
		Back_Title = AL["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Shaman"] = {
		Title = BC["Shaman"],
		Back_Page = "AQ40SET",
		Back_Title = AL["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Warlock"] = {
		Title = BC["Warlock"],
		Back_Page = "AQ40SET",
		Back_Title = AL["Temple of Ahn'Qiraj Sets"]
	},
	["AQ40Warrior"] = {
		Title = BC["Warrior"],
		Back_Page = "AQ40SET",
		Back_Title = AL["Temple of Ahn'Qiraj Sets"]
	},
	["AQ20Druid"] = {
		Title = BC["Druid"],
		Back_Page = "AQ20SET",
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Hunter"] = {
		Title = BC["Hunter"],
		Back_Page = "AQ20SET",
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Mage"] = {
		Title = BC["Mage"],
		Back_Page = "AQ20SET",
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Paladin"] = {
		Title = BC["Paladin"],
		Back_Page = "AQ20SET",
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Priest"] = {
		Title = BC["Priest"],
		Back_Page = "AQ20SET",
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Rogue"] = {
		Title = BC["Rogue"],
		Back_Page = "AQ20SET",
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Shaman"] = {
		Title = BC["Shaman"],
		Back_Page = "AQ20SET",
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Warlock"] = {
		Title = BC["Warlock"],
		Back_Page = "AQ20SET",
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"]
	},
	["AQ20Warrior"] = {
		Title = BC["Warrior"],
		Back_Page = "AQ20SET",
		Back_Title = AL["Ruins of Ahn'Qiraj Sets"]
	},
	["ZGDruid"] = {
		Title = BC["Druid"],
		Back_Page = "ZGSET",
		Back_Title = AL["Zul'Gurub Sets"]
	},
	["ZGHunter"] = {
		Title = BC["Hunter"],
		Back_Page = "ZGSET",
		Back_Title = AL["Zul'Gurub Sets"]
	},
	["ZGMage"] = {
		Title = BC["Mage"],
		Back_Page = "ZGSET",
		Back_Title = AL["Zul'Gurub Sets"]
	},
	["ZGPaladin"] = {
		Title = BC["Paladin"],
		Back_Page = "ZGSET",
		Back_Title = AL["Zul'Gurub Sets"]
	},
	["ZGPriest"] = {
		Title = BC["Priest"],
		Back_Page = "ZGSET",
		Back_Title = AL["Zul'Gurub Sets"]
	},
	["ZGRogue"] = {
		Title = BC["Rogue"],
		Back_Page = "ZGSET",
		Back_Title = AL["Zul'Gurub Sets"]
	},
	["ZGShaman"] = {
		Title = BC["Shaman"],
		Back_Page = "ZGSET",
		Back_Title = AL["Zul'Gurub Sets"]
	},
	["ZGWarlock"] = {
		Title = BC["Warlock"],
		Back_Page = "ZGSET",
		Back_Title = AL["Zul'Gurub Sets"]
	},
	["ZGWarrior"] = {
		Title = BC["Warrior"],
		Back_Page = "ZGSET",
		Back_Title = AL["Zul'Gurub Sets"]
	},
	["DEADMINES"] = {
		Title = BIS["Defias Leather"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["WAILING"] = {
		Title = BIS["Embrace of the Viper"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["SCARLET"] = {
		Title = BIS["Chain of the Scarlet Crusade"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["BLACKROCKD"] = {
		Title = BIS["The Gladiator"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["GreymaneArmor"] = {
		Title = "Greymane Armor",
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["IncendosaurSkinArmor"] = {
		Title = "Incendosaur Skin Armor",
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["IRONWEAVE"] = {
		Title = BIS["Ironweave Battlesuit"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["ScholoCloth"] = {
		Title = BZ["Scholomance"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["ScholoLeather"] = {
		Title = BZ["Scholomance"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["ScholoMail"] = {
		Title = BZ["Scholomance"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["ScholoPlate"] = {
		Title = BZ["Scholomance"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["STRAT"] = {
		Title = BIS["The Postmaster"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["ScourgeInvasion"] = {
		Title = AL["Scourge Invasion"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["ShardOfGods"] = {
		Title = BIS["Shard of the Gods"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["ZGRings"] = {
		Title = BZ["Zul'Gurub"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["HakkariBlades"] = {
		Title = BZ["Zul'Gurub"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["PrimalBlessing"] = {
		Title = BZ["Zul'Gurub"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["SpiritofEskhandar"] = {
		Title = BIS["Spirit of Eskhandar"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["DalRend"] = {
		Title = BIS["Dal'Rend's Arms"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["SpiderKiss"] = {
		Title = BIS["Spider's Kiss"],
		Back_Page = "PRE60SET",
		Back_Title = AL["Pre 60 Sets"]
	},
	["SteelPlate"] = {
		Title = "Steel Plate",
		Back_Page = "CRAFTSET2",
		Back_Title = AL["Crafted Sets"],
	},
	["ImperialPlate"] = {
		Title = BIS["Imperial Plate"],
		Back_Page = "CRAFTSET2",
		Back_Title = AL["Crafted Sets"]
	},
	["RuneEtchedArmor"] = {
		Title = "Rune-Etched Armor",
		Back_Page = "CRAFTSET2",
		Back_Title = AL["Crafted Sets"]
	},
	["TheDarksoul"] = {
		Title = BIS["The Darksoul"],
		Back_Page = "CRAFTSET2",
		Back_Title = AL["Crafted Sets"]
	},
	["BloodsoulEmbrace"] = {
		Title = BIS["Bloodsoul Embrace"],
		Back_Page = "CRAFTSET2",
		Back_Title = AL["Crafted Sets"]
	},
	["HateforgeArmor"] = {
		Title = "Hateforge Armor",
		Back_Page = "CRAFTSET2",
		Back_Title = AL["Crafted Sets"]
	},
	["TowerforgeBattlegear"] = {
		Title = "Towerforge Battlegear",
		Back_Page = "CRAFTSET2",
		Back_Title = AL["Crafted Sets"]
	},
	["DreamsteelArmor"] = {
		Title = "Dreamsteel Armor",
		Back_Page = "CRAFTSET2",
		Back_Title = AL["Crafted Sets"]
	},
	["AugerersAttire"] = {
			Title = "Augerer's Attire",
			Back_Page = "CRAFTSET",
			Back_Title = AL["Crafted Sets"],
	},
	["ShadoweaveSet"] = {
			Title = "Shadoweave",
			Back_Page = "CRAFTSET",
			Back_Title = AL["Crafted Sets"],
	},
	["DivinersGarments"] = {
			Title = "Diviner's Garments",
			Back_Page = "CRAFTSET",
			Back_Title = AL["Crafted Sets"],
	},
	["PillagersGarb"] = {
			Title = "Pillager's Garb",
			Back_Page = "CRAFTSET",
			Back_Title = AL["Crafted Sets"],
	},
	["MoonclothRegalia"] = {
		Title = "Mooncloth Regalia",
		Back_Page = "CRAFTSET",
		Back_Title = AL["Crafted Sets"]
	},
	["BloodvineG"] = {
		Title = BIS["Bloodvine Garb"],
		Back_Page = "CRAFTSET",
		Back_Title = AL["Crafted Sets"]
	},
	["FlarecoreRegalia"] = {
		Title = "Flarecore Regalia",
		Back_Page = "CRAFTSET",
		Back_Title = AL["Crafted Sets"]
	},
	["DreamthreadRegalia"] = {
		Title = "Dreamthread Regalia",
		Back_Page = "CRAFTSET",
		Back_Title = AL["Crafted Sets"]
	},
	["GriftersArmor"] = {
		Title = "Grifter's Armor",
		Back_Page = "CRAFTSET",
		Back_Title = AL["Crafted Sets"]
	},
	["PrimalistsTrappings"] = {
		Title = "Primalist's Trappings",
		Back_Page = "CRAFTSET",
		Back_Title = AL["Crafted Sets"]
	},
	["VolcanicArmor"] = {
		Title = BIS["Volcanic Armor"],
		Back_Page = "CRAFTSET",
		Back_Title = AL["Crafted Sets"]
	},
	["IronfeatherArmor"] = {
		Title = BIS["Ironfeather Armor"],
		Back_Page = "CRAFTSET",
		Back_Title = AL["Crafted Sets"]
	},
	["StormshroudArmor"] = {
		Title = BIS["Stormshroud Armor"],
		Back_Page = "CRAFTSET",
		Back_Title = AL["Crafted Sets"]
	},
	["DevilsaurArmor"] = {
		Title = BIS["Devilsaur Armor"],
		Back_Page = "CRAFTSET",
		Back_Title = AL["Crafted Sets"]
	},
	["BloodTigerH"] = {
		Title = BIS["Blood Tiger Harness"],
		Back_Page = "CRAFTSET",
		Back_Title = AL["Crafted Sets"]
	},
	["PrimalBatskin"] = {
		Title = BIS["Primal Batskin"],
		Back_Page = "CRAFTSET",
		Back_Title = AL["Crafted Sets"]
	},
	["ConvergenceoftheElements"] = {
		Title = "Convergence of the Elements",
		Back_Page = "CRAFTSET",
		Back_Title = AL["Crafted Sets"]
	},
	["DreamhideBattlegarb"] = {
		Title = "Dreamhide Battlegarb",
		Back_Page = "CRAFTSET",
		Back_Title = AL["Crafted Sets"]
	},
	["RedDragonM"] = {
		Title = "Red Dragon Mail",
		Back_Page = "CRAFTSET2",
		Back_Title = AL["Crafted Sets"],
	},
	["GreenDragonM"] = {
		Title = BIS["Green Dragon Mail"],
		Back_Page = "CRAFTSET2",
		Back_Title = AL["Crafted Sets"]
	},
	["BlueDragonM"] = {
		Title = BIS["Blue Dragon Mail"],
		Back_Page = "CRAFTSET2",
		Back_Title = AL["Crafted Sets"]
	},
	["BlackDragonM"] = {
		Title = BIS["Black Dragon Mail"],
		Back_Page = "CRAFTSET2",
		Back_Title = AL["Crafted Sets"]
	},
	["CraftedWeapons1"] = {
		Title = AL["Crafted Epic Weapons"],
		Back_Page = "CRAFTINGMENU",
		Back_Title = AL["Collections"]
	},
	["Tabards"] = {
		Title = AL["Tabards"],
		Back_Page = "SETMENU",
		Back_Title = AL["Collections"]
	},
	["Legendaries"] = {
		Title = AL["Legendary Items"],
		Back_Page = "SETMENU",
		Back_Title = AL["Collections"]
	},
	["Artifacts"] = {
		Title = AL["Artifact Items"],
		Back_Page = "SETMENU",
		Back_Title = AL["Collections"]
	},
	["PvPMountsPvP"] = {
		Title = AL["PvP Mounts"],
		Back_Page = "PVPMENU",
		Back_Title = AL["PvP Rewards"]
	},
	["UnobMounts"] = {
		Title = AL["Unobtainable Mounts"],
		Back_Page = "SETMENU",
		Back_Title = AL["Collections"]
	},
	["OldMounts"] = {
		Title = AL["Old Mounts"],
		Back_Page = "SETMENU",
		Back_Title = AL["Collections"]
	},
	["RareMounts"] = {
		Title = AL["Rare Mounts"],
		Back_Page = "SETMENU",
		Back_Title = AL["Collections"]
	},
	["RarePets1"] = {
		Title = AL["Rare Pets"],
		Next_Page = "RarePets2",
		Next_Title = AL["Rare Pets"],
		Back_Page = "SETMENU",
		Back_Title = AL["Collections"]
	},
	["RarePets2"] = {
		Title = AL["Rare Pets"],
		Prev_Page = "RarePets1",
		Prev_Title = AL["Rare Pets"],
		Back_Page = "SETMENU",
		Back_Title = AL["Collections"]
	},
	["WorldEpics1"] = {
		Title = AtlasLoot_TableNames["WorldEpics1"][1],
		Next_Page = "WorldEpics2",
		Next_Title = AtlasLoot_TableNames["WorldEpics2"][1],
		Back_Page = "WORLDEPICS",
		Back_Title = AL["World Epics"]
	},
	["WorldEpics2"] = {
		Title = AtlasLoot_TableNames["WorldEpics2"][1],
		Next_Page = "WorldEpics3",
		Next_Title = AtlasLoot_TableNames["WorldEpics3"][1],
		Prev_Page = "WorldEpics1",
		Prev_Title = AtlasLoot_TableNames["WorldEpics1"][1],
		Back_Page = "WORLDEPICS",
		Back_Title = AL["World Epics"]
	},
	["WorldEpics3"] = {
		Title = AtlasLoot_TableNames["WorldEpics3"][1],
		Prev_Page = "WorldEpics2",
		Prev_Title = AtlasLoot_TableNames["WorldEpics2"][1],
		Back_Page = "WORLDEPICS",
		Back_Title = AL["World Epics"]
	},
	["WorldBluesHead"] = {
		Title = AtlasLoot_TableNames["WorldBluesHead"][1],
		Next_Page = "WorldBluesNeck",
		Next_Title = AtlasLoot_TableNames["WorldBluesNeck"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesNeck"] = {
		Title = AtlasLoot_TableNames["WorldBluesNeck"][1],
		Next_Page = "WorldBluesShoulder",
		Next_Title = AtlasLoot_TableNames["WorldBluesShoulder"][1],
		Prev_Page = "WorldBluesHead",
		Prev_Title = AtlasLoot_TableNames["WorldBluesHead"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesShoulder"] = {
		Title = AtlasLoot_TableNames["WorldBluesShoulder"][1],
		Next_Page = "WorldBluesBack",
		Next_Title = AtlasLoot_TableNames["WorldBluesBack"][1],
		Prev_Page = "WorldBluesNeck",
		Prev_Title = AtlasLoot_TableNames["WorldBluesNeck"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesBack"] = {
		Title = AtlasLoot_TableNames["WorldBluesBack"][1],
		Next_Page = "WorldBluesChest",
		Next_Title = AtlasLoot_TableNames["WorldBluesChest"][1],
		Prev_Page = "WorldBluesShoulder",
		Prev_Title = AtlasLoot_TableNames["WorldBluesShoulder"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesChest"] = {
		Title = AtlasLoot_TableNames["WorldBluesChest"][1],
		Next_Page = "WorldBluesWrist",
		Next_Title = AtlasLoot_TableNames["WorldBluesWrist"][1],
		Prev_Page = "WorldBluesBack",
		Prev_Title = AtlasLoot_TableNames["WorldBluesBack"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesWrist"] = {
		Title = AtlasLoot_TableNames["WorldBluesWrist"][1],
		Next_Page = "WorldBluesHands",
		Next_Title = AtlasLoot_TableNames["WorldBluesHands"][1],
		Prev_Page = "WorldBluesChest",
		Prev_Title = AtlasLoot_TableNames["WorldBluesChest"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesHands"] = {
		Title = AtlasLoot_TableNames["WorldBluesHands"][1],
		Next_Page = "WorldBluesWaist",
		Next_Title = AtlasLoot_TableNames["WorldBluesWaist"][1],
		Prev_Page = "WorldBluesWrist",
		Prev_Title = AtlasLoot_TableNames["WorldBluesWrist"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesWaist"] = {
		Title = AtlasLoot_TableNames["WorldBluesWaist"][1],
		Next_Page = "WorldBluesLegs",
		Next_Title = AtlasLoot_TableNames["WorldBluesLegs"][1],
		Prev_Page = "WorldBluesHands",
		Prev_Title = AtlasLoot_TableNames["WorldBluesHands"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesLegs"] = {
		Title = AtlasLoot_TableNames["WorldBluesLegs"][1],
		Next_Page = "WorldBluesFeet",
		Next_Title = AtlasLoot_TableNames["WorldBluesFeet"][1],
		Prev_Page = "WorldBluesWaist",
		Prev_Title = AtlasLoot_TableNames["WorldBluesWaist"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesFeet"] = {
		Title = AtlasLoot_TableNames["WorldBluesFeet"][1],
		Next_Page = "WorldBluesRing",
		Next_Title = AtlasLoot_TableNames["WorldBluesRing"][1],
		Prev_Page = "WorldBluesLegs",
		Prev_Title = AtlasLoot_TableNames["WorldBluesLegs"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesRing"] = {
		Title = AtlasLoot_TableNames["WorldBluesRing"][1],
		Next_Page = "WorldBluesTrinket",
		Next_Title = AtlasLoot_TableNames["WorldBluesTrinket"][1],
		Prev_Page = "WorldBluesFeet",
		Prev_Title = AtlasLoot_TableNames["WorldBluesFeet"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesTrinket"] = {
		Title = AtlasLoot_TableNames["WorldBluesTrinket"][1],
		Next_Page = "WorldBluesWand",
		Next_Title = AtlasLoot_TableNames["WorldBluesWand"][1],
		Prev_Page = "WorldBluesRing",
		Prev_Title = AtlasLoot_TableNames["WorldBluesRing"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesWand"] = {
		Title = AtlasLoot_TableNames["WorldBluesWand"][1],
		Next_Page = "WorldBluesHeldInOffhand",
		Next_Title = AtlasLoot_TableNames["WorldBluesHeldInOffhand"][1],
		Prev_Page = "WorldBluesTrinket",
		Prev_Title = AtlasLoot_TableNames["WorldBluesTrinket"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesHeldInOffhand"] = {
		Title = AtlasLoot_TableNames["WorldBluesHeldInOffhand"][1],
		Next_Page = "WorldBlues1HAxes",
		Next_Title = AtlasLoot_TableNames["WorldBlues1HAxes"][1],
		Prev_Page = "WorldBluesWand",
		Prev_Title = AtlasLoot_TableNames["WorldBluesWand"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBlues1HAxes"] = {
		Title = AtlasLoot_TableNames["WorldBlues1HAxes"][1],
		Next_Page = "WorldBlues1HMaces",
		Next_Title = AtlasLoot_TableNames["WorldBlues1HMaces"][1],
		Prev_Page = "WorldBluesHeldInOffhand",
		Prev_Title = AtlasLoot_TableNames["WorldBluesHeldInOffhand"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBlues1HMaces"] = {
		Title = AtlasLoot_TableNames["WorldBlues1HMaces"][1],
		Next_Page = "WorldBlues1HSwords",
		Next_Title = AtlasLoot_TableNames["WorldBlues1HSwords"][1],
		Prev_Page = "WorldBlues1HAxes",
		Prev_Title = AtlasLoot_TableNames["WorldBlues1HAxes"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBlues1HSwords"] = {
		Title = AtlasLoot_TableNames["WorldBlues1HSwords"][1],
		Next_Page = "WorldBlues2HAxes",
		Next_Title = AtlasLoot_TableNames["WorldBlues2HAxes"][1],
		Prev_Page = "WorldBlues1HMaces",
		Prev_Title = AtlasLoot_TableNames["WorldBlues1HMaces"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBlues2HAxes"] = {
		Title = AtlasLoot_TableNames["WorldBlues2HAxes"][1],
		Next_Page = "WorldBlues2HMaces",
		Next_Title = AtlasLoot_TableNames["WorldBlues2HMaces"][1],
		Prev_Page = "WorldBlues1HSwords",
		Prev_Title = AtlasLoot_TableNames["WorldBlues1HSwords"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBlues2HMaces"] = {
		Title = AtlasLoot_TableNames["WorldBlues2HMaces"][1],
		Next_Page = "WorldBlues2HSwords",
		Next_Title = AtlasLoot_TableNames["WorldBlues2HSwords"][1],
		Prev_Page = "WorldBlues2HAxes",
		Prev_Title = AtlasLoot_TableNames["WorldBlues2HAxes"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBlues2HSwords"] = {
		Title = AtlasLoot_TableNames["WorldBlues2HSwords"][1],
		Next_Page = "WorldBluesDaggers",
		Next_Title = AtlasLoot_TableNames["WorldBluesDaggers"][1],
		Prev_Page = "WorldBlues2HMaces",
		Prev_Title = AtlasLoot_TableNames["WorldBlues2HMaces"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesDaggers"] = {
		Title = AtlasLoot_TableNames["WorldBluesDaggers"][1],
		Next_Page = "WorldBluesFistWeapons",
		Next_Title = AtlasLoot_TableNames["WorldBluesFistWeapons"][1],
		Prev_Page = "WorldBlues2HSwords",
		Prev_Title = AtlasLoot_TableNames["WorldBlues2HSwords"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesFistWeapons"] = {
		Title = AtlasLoot_TableNames["WorldBluesFistWeapons"][1],
		Next_Page = "WorldBluesPolearms",
		Next_Title = AtlasLoot_TableNames["WorldBluesPolearms"][1],
		Prev_Page = "WorldBluesDaggers",
		Prev_Title = AtlasLoot_TableNames["WorldBluesDaggers"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesPolearms"] = {
		Title = AtlasLoot_TableNames["WorldBluesPolearms"][1],
		Next_Page = "WorldBluesStaves",
		Next_Title = AtlasLoot_TableNames["WorldBluesStaves"][1],
		Prev_Page = "WorldBluesFistWeapons",
		Prev_Title = AtlasLoot_TableNames["WorldBluesFistWeapons"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesStaves"] = {
		Title = AtlasLoot_TableNames["WorldBluesStaves"][1],
		Next_Page = "WorldBluesBows",
		Next_Title = AtlasLoot_TableNames["WorldBluesBows"][1],
		Prev_Page = "WorldBluesPolearms",
		Prev_Title = AtlasLoot_TableNames["WorldBluesPolearms"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesBows"] = {
		Title = AtlasLoot_TableNames["WorldBluesBows"][1],
		Next_Page = "WorldBluesCrossbows",
		Next_Title = AtlasLoot_TableNames["WorldBluesCrossbows"][1],
		Prev_Page = "WorldBluesStaves",
		Prev_Title = AtlasLoot_TableNames["WorldBluesStaves"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesCrossbows"] = {
		Title = AtlasLoot_TableNames["WorldBluesCrossbows"][1],
		Next_Page = "WorldBluesGuns",
		Next_Title = AtlasLoot_TableNames["WorldBluesGuns"][1],
		Prev_Page = "WorldBluesBows",
		Prev_Title = AtlasLoot_TableNames["WorldBluesBows"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesGuns"] = {
		Title = AtlasLoot_TableNames["WorldBluesGuns"][1],
		Next_Page = "WorldBluesShields",
		Next_Title = AtlasLoot_TableNames["WorldBluesShields"][1],
		Prev_Page = "WorldBluesCrossbows",
		Prev_Title = AtlasLoot_TableNames["WorldBluesCrossbows"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["WorldBluesShields"] = {
		Title = AtlasLoot_TableNames["WorldBluesShields"][1],
		Prev_Page = "WorldBluesGuns",
		Prev_Title = AtlasLoot_TableNames["WorldBluesGuns"][1],
		Back_Page = "WORLDBLUES",
		Back_Title = AL["World Blues"],
	},
	["ZGTrash1"] = {
		Title = AtlasLoot_TableNames["ZGTrash1"][1],
		Next_Page = "ZGTrash2",
		Next_Title = AtlasLoot_TableNames["ZGTrash2"][1],
	},
	["ZGTrash2"] = {
		Title = AtlasLoot_TableNames["ZGTrash2"][1],
		Prev_Page = "ZGTrash1",
		Prev_Title = AtlasLoot_TableNames["ZGTrash1"][1],
	},
	["AQ40Trash1"] = {
		Title = AtlasLoot_TableNames["AQ40Trash1"][1],
		Next_Page = "AQ40Trash2",
		Next_Title = AtlasLoot_TableNames["AQ40Trash2"][1],
	},
	["AQ40Trash2"] = {
		Title = AtlasLoot_TableNames["AQ40Trash2"][1],
		Prev_Page = "AQ40Trash1",
		Prev_Title = AtlasLoot_TableNames["AQ40Trash1"][1],
	},
	["ChildrensWeek"] = {
		Title = AL["Children's Week"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["Winterviel1"] = {
		Title = AL["Feast of Winter Veil"],
		Next_Page = "Winterviel2",
		Next_Title = AtlasLoot_TableNames["Winterviel2"][1],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["Winterviel2"] = {
		Title = AtlasLoot_TableNames["Winterviel2"][1],
		Prev_Page = "Winterviel1",
		Prev_Title = AL["Feast of Winter Veil"],
		Next_Page = "WintervielSnowball",
		Next_Title = "Snowball",
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["WintervielSnowball"] = {
		Title = "Snowball";
		Next_Page = "Winterviel1";
		Next_Title = AL["Feast of Winter Veil"];
		Prev_Page = "Winterviel2";
		Prev_Title = AtlasLoot_TableNames["Winterviel2"][1];
		Back_Page = "WORLDEVENTMENU";
		Back_Title = AL["World Events"];
	},
	["Halloween1"] = {
		Title = AL["Hallow's End"],
		Next_Page = "Halloween2",
		Next_Title = AL["Hallow's End"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["Halloween2"] = {
		Title = AL["Hallow's End"],
		Prev_Page = "Halloween1",
		Prev_Title = AL["Hallow's End"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["HarvestFestival"] = {
		Title = AL["Harvest Festival"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["Valentineday"] = {
		Title = AL["Love is in the Air"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["LunarFestival1"] = {
		Title = AL["Lunar Festival"],
		Next_Page = "LunarFestival2",
		Next_Title = AL["Lunar Festival"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["LunarFestival2"] = {
		Title = AL["Lunar Festival"],
		Prev_Page = "LunarFestival1",
		Prev_Title = AL["Lunar Festival"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["MidsummerFestival"] = {
		Title = AL["Midsummer Fire Festival"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["Noblegarden"] = {
		Title = AL["Noblegarden"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["ElementalInvasion"] = {
		Title = AL["Elemental Invasion"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["GurubashiArena"] = {
		Title = AL["Gurubashi Arena Booty Run"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["ScourgeInvasionEvent1"] = {
		Title = AL["Scourge Invasion"],
		Next_Page = "ScourgeInvasionEvent2",
		Next_Title = AtlasLoot_TableNames["ScourgeInvasionEvent2"][1],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["ScourgeInvasionEvent2"] = {
		Title = AtlasLoot_TableNames["ScourgeInvasionEvent2"][1],
		Prev_Page = "ScourgeInvasionEvent1",
		Prev_Title = AL["Scourge Invasion"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["FishingExtravaganza"] = {
		Title = AL["Stranglethorn Fishing Extravaganza"],
		Back_Page = "WORLDEVENTMENU",
		Back_Title = AL["World Events"]
	},
	["AbyssalTemplars"] = {
		Title = AL["Abyssal Council"].." - "..AL["Templars"],
		Back_Page = "AbyssalCouncil",
		Back_Title = AL["Abyssal Council"]
	},
	["AbyssalDukes"] = {
		Title = AL["Abyssal Council"].." - "..AL["Dukes"],
		Back_Page = "AbyssalCouncil",
		Back_Title = AL["Abyssal Council"]
	},
	["AbyssalLords"] = {
		Title = AL["Abyssal Council"].." - "..AL["High Council"],
		Back_Page = "AbyssalCouncil",
		Back_Title = AL["Abyssal Council"]
	},
	["AlchemyApprentice1"] = {
		Title = BS["Alchemy"]..": "..AL["Apprentice"],
		Back_Page = "ALCHEMYMENU",
		Back_Title = BS["Alchemy"],
		Next_Page = "AlchemyJourneyman1",
		Next_Title = BS["Alchemy"]..": "..AL["Journeyman"]
	},
	["AlchemyJourneyman1"] = {
		Title = BS["Alchemy"]..": "..AL["Journeyman"],
		Back_Page = "ALCHEMYMENU",
		Back_Title = BS["Alchemy"],
		Next_Page = "AlchemyExpert1",
		Next_Title = BS["Alchemy"]..": "..AL["Expert"],
		Prev_Page = "AlchemyApprentice1",
		Prev_Title = BS["Alchemy"]..": "..AL["Apprentice"]
	},
	["AlchemyExpert1"] = {
		Title = BS["Alchemy"]..": "..AL["Expert"],
		Back_Page = "ALCHEMYMENU",
		Back_Title = BS["Alchemy"],
		Next_Page = "AlchemyArtisan1",
		Next_Title = BS["Alchemy"]..": "..AL["Artisan"],
		Prev_Page = "AlchemyJourneyman1",
		Prev_Title = BS["Alchemy"]..": "..AL["Journeyman"]
	},
	["AlchemyArtisan1"] = {
		Title = BS["Alchemy"]..": "..AL["Artisan"],
		Back_Page = "ALCHEMYMENU",
		Back_Title = BS["Alchemy"],
		Next_Page = "AlchemyArtisan2",
		Next_Title = BS["Alchemy"]..": "..AL["Artisan"],
		Prev_Page = "AlchemyExpert1",
		Prev_Title = BS["Alchemy"]..": "..AL["Expert"]
	},
	["AlchemyArtisan2"] = {
		Title = BS["Alchemy"]..": "..AL["Artisan"],
		Back_Page = "ALCHEMYMENU",
		Back_Title = BS["Alchemy"],
		Prev_Page = "AlchemyArtisan1",
		Prev_Title = BS["Alchemy"]..": "..AL["Artisan"]
	},
	["SmithingApprentice1"] = {
		Title = BS["Blacksmithing"]..": "..AL["Apprentice"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Next_Page = "SmithingJourneyman1",
		Next_Title = BS["Blacksmithing"]..": "..AL["Journeyman"]
	},
	["SmithingJourneyman1"] = {
		Title = BS["Blacksmithing"]..": "..AL["Journeyman"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingApprentice1",
		Prev_Title = BS["Blacksmithing"]..": "..AL["Apprentice"],
		Next_Page = "SmithingJourneyman2",
		Next_Title = BS["Blacksmithing"]..": "..AL["Journeyman"]
	},
	["SmithingJourneyman2"] = {
		Title = BS["Blacksmithing"]..": "..AL["Journeyman"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingJourneyman1",
		Prev_Title = BS["Blacksmithing"]..": "..AL["Journeyman"],
		Next_Page = "SmithingExpert1",
		Next_Title = BS["Blacksmithing"]..": "..AL["Expert"]
	},
	["SmithingExpert1"] = {
		Title = BS["Blacksmithing"]..": "..AL["Expert"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingJourneyman2",
		Prev_Title = BS["Blacksmithing"]..": "..AL["Journeyman"],
		Next_Page = "SmithingExpert2",
		Next_Title = BS["Blacksmithing"]..": "..AL["Expert"]
	},
	["SmithingExpert2"] = {
		Title = BS["Blacksmithing"]..": "..AL["Expert"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingExpert1",
		Prev_Title = BS["Blacksmithing"]..": "..AL["Expert"],
		Next_Page = "SmithingExpert3",
		Next_Title = BS["Blacksmithing"]..": "..AL["Expert"]
	},
	["SmithingExpert3"] = {
		Title = AL["Blacksmithing"] .. ": " .. AL["Expert"],
		Back_Page = "SMITHINGMENU",
		Back_Title = AL["Blacksmithing"],
		Prev_Page = "SmithingExpert2",
		Prev_Title = AL["Blacksmithing"] .. ": " .. AL["Expert"],
		Next_Page = "SmithingArtisan1",
		Next_Title = AL["Blacksmithing"] .. ": " .. AL["Artisan"],
	},
	["SmithingArtisan1"] = {
		Title = BS["Blacksmithing"]..": "..AL["Artisan"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingExpert2",
		Prev_Title = BS["Blacksmithing"]..": "..AL["Expert"],
		Next_Page = "SmithingArtisan2",
		Next_Title = BS["Blacksmithing"]..": "..AL["Artisan"]
	},
	["SmithingArtisan2"] = {
		Title = BS["Blacksmithing"]..": "..AL["Artisan"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingArtisan1",
		Prev_Title = BS["Blacksmithing"]..": "..AL["Artisan"],
		Next_Page = "SmithingArtisan3",
		Next_Title = BS["Blacksmithing"]..": "..AL["Artisan"],
	},
	["SmithingArtisan3"] = {
		Title = BS["Blacksmithing"]..": "..AL["Artisan"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingArtisan2",
		Prev_Title = BS["Blacksmithing"]..": "..AL["Artisan"],
		Next_Page = "SmithingArtisan4",
		Next_Title = BS["Blacksmithing"]..": "..AL["Artisan"],
	},
	["SmithingArtisan4"] = {
		Title = AL["Blacksmithing"] .. ": " .. AL["Artisan"],
		Back_Page = "SMITHINGMENU",
		Back_Title = AL["Blacksmithing"],
		Prev_Page = "SmithingArtisan3",
		Prev_Title = AL["Blacksmithing"] .. ": " .. AL["Artisan"],
		Next_Page = "Armorsmith1",
		Next_Title = AL["Blacksmithing"] .. ": " .. AL["Armorsmith"],
	},	
	["Armorsmith1"] = {
		Title = BS["Armorsmith"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "SmithingArtisan3",
		Prev_Title = BS["Blacksmithing"]..": "..AL["Artisan"],
		Next_Page = "Weaponsmith1",
		Next_Title = BS["Weaponsmith"]
	},
	["Weaponsmith1"] = {
		Title = BS["Weaponsmith"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "Armorsmith1",
		Prev_Title = BS["Armorsmith"],
		Next_Page = "Axesmith1",
		Next_Title = AL["Master Axesmith"]
	},
	["Axesmith1"] = {
		Title = AL["Master Axesmith"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "Weaponsmith1",
		Prev_Title = BS["Weaponsmith"],
		Next_Page = "Hammersmith1",
		Next_Title = AL["Master Hammersmith"]
	},
	["Hammersmith1"] = {
		Title = AL["Master Hammersmith"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "Axesmith1",
		Prev_Title = AL["Master Axesmith"],
		Next_Page = "Swordsmith1",
		Next_Title = AL["Master Swordsmith"]
	},
	["Swordsmith1"] = {
		Title = AL["Master Swordsmith"],
		Back_Page = "SMITHINGMENU",
		Back_Title = BS["Blacksmithing"],
		Prev_Page = "Hammersmith1",
		Prev_Title = AL["Master Hammersmith"]
	},
	["EnchantingApprentice1"] = {
		Title = BS["Enchanting"]..": "..AL["Apprentice"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Next_Page = "EnchantingJourneyman1",
		Next_Title = BS["Enchanting"]..": "..AL["Journeyman"]
	},
	["EnchantingJourneyman1"] = {
		Title = BS["Enchanting"]..": "..AL["Journeyman"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Prev_Page = "EnchantingApprentice1",
		Prev_Title = BS["Enchanting"]..": "..AL["Apprentice"],
		Next_Page = "EnchantingJourneyman2",
		Next_Title = BS["Enchanting"]..": "..AL["Journeyman"]
	},
	["EnchantingJourneyman2"] = {
		Title = BS["Enchanting"]..": "..AL["Journeyman"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Prev_Page = "EnchantingJourneyman1",
		Prev_Title = BS["Enchanting"]..": "..AL["Journeyman"],
		Next_Page = "EnchantingExpert1",
		Next_Title = BS["Enchanting"]..": "..AL["Expert"]
	},
	["EnchantingExpert1"] = {
		Title = BS["Enchanting"]..": "..AL["Expert"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Prev_Page = "EnchantingJourneyman2",
		Prev_Title = BS["Enchanting"]..": "..AL["Journeyman"],
		Next_Page = "EnchantingExpert2",
		Next_Title = BS["Enchanting"]..": "..AL["Expert"]
	},
	["EnchantingExpert2"] = {
		Title = BS["Enchanting"]..": "..AL["Expert"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Prev_Page = "EnchantingExpert1",
		Prev_Title = BS["Enchanting"]..": "..AL["Expert"],
		Next_Page = "EnchantingArtisan1",
		Next_Title = BS["Enchanting"]..": "..AL["Artisan"]
	},
	["EnchantingArtisan1"] = {
		Title = BS["Enchanting"]..": "..AL["Artisan"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Prev_Page = "EnchantingExpert2",
		Prev_Title = BS["Enchanting"]..": "..AL["Expert"],
		Next_Page = "EnchantingArtisan2",
		Next_Title = BS["Enchanting"]..": "..AL["Artisan"]
	},
	["EnchantingArtisan2"] = {
		Title = BS["Enchanting"]..": "..AL["Artisan"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Prev_Page = "EnchantingArtisan1",
		Prev_Title = BS["Enchanting"]..": "..AL["Artisan"],
		Next_Page = "EnchantingArtisan3",
		Next_Title = BS["Enchanting"]..": "..AL["Artisan"]
	},
	["EnchantingArtisan3"] = {
		Title = BS["Enchanting"]..": "..AL["Artisan"],
		Back_Page = "ENCHANTINGMENU",
		Back_Title = BS["Enchanting"],
		Prev_Page = "EnchantingArtisan2",
		Prev_Title = BS["Enchanting"]..": "..AL["Artisan"]
	},
	["EngineeringApprentice1"] = {
		Title = BS["Engineering"]..": "..AL["Apprentice"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Next_Page = "EngineeringJourneyman1",
		Next_Title = BS["Engineering"]..": "..AL["Journeyman"]
	},
	["EngineeringJourneyman1"] = {
		Title = BS["Engineering"]..": "..AL["Journeyman"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "EngineeringApprentice1",
		Prev_Title = BS["Engineering"]..": "..AL["Apprentice"],
		Next_Page = "EngineeringJourneyman2",
		Next_Title = BS["Engineering"]..": "..AL["Journeyman"]
	},
	["EngineeringJourneyman2"] = {
		Title = BS["Engineering"]..": "..AL["Journeyman"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "EngineeringJourneyman1",
		Prev_Title = BS["Engineering"]..": "..AL["Journeyman"],
		Next_Page = "EngineeringExpert1",
		Next_Title = BS["Engineering"]..": "..AL["Expert"]
	},
	["EngineeringExpert1"] = {
		Title = BS["Engineering"]..": "..AL["Expert"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "EngineeringJourneyman2",
		Prev_Title = BS["Engineering"]..": "..AL["Journeyman"],
		Next_Page = "EngineeringExpert2",
		Next_Title = BS["Engineering"]..": "..AL["Expert"]
	},
	["EngineeringExpert2"] = {
		Title = BS["Engineering"]..": "..AL["Expert"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "EngineeringExpert1",
		Prev_Title = BS["Engineering"]..": "..AL["Expert"],
		Next_Page = "EngineeringArtisan1",
		Next_Title = BS["Engineering"]..": "..AL["Artisan"]
	},
	["EngineeringArtisan1"] = {
		Title = BS["Engineering"]..": "..AL["Artisan"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "EngineeringExpert2",
		Prev_Title = BS["Engineering"]..": "..AL["Expert"],
		Next_Page = "EngineeringArtisan2",
		Next_Title = BS["Engineering"]..": "..AL["Artisan"]
	},
	["EngineeringArtisan2"] = {
		Title = BS["Engineering"]..": "..AL["Artisan"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "EngineeringArtisan1",
		Prev_Title = BS["Engineering"]..": "..AL["Artisan"],
		Next_Page = "Gnomish1",
		Next_Title = AL["Gnomish Engineering"]
	},
	["Gnomish1"] = {
		Title = AL["Gnomish Engineering"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "EngineeringArtisan2",
		Prev_Title = BS["Engineering"]..": "..AL["Artisan"],
		Next_Page = "Goblin1",
		Next_Title = AL["Goblin Engineering"]
	},
	["Goblin1"] = {
		Title = AL["Goblin Engineering"],
		Back_Page = "ENGINEERINGMENU",
		Back_Title = BS["Engineering"],
		Prev_Page = "Gnomish1",
		Prev_Title = AL["Gnomish Engineering"]
	},
	["LeatherApprentice1"] = {
		Title = BS["Leatherworking"]..": "..AL["Apprentice"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Next_Page = "LeatherJourneyman1",
		Next_Title = BS["Leatherworking"]..": "..AL["Journeyman"]
	},
	["LeatherJourneyman1"] = {
		Title = BS["Leatherworking"]..": "..AL["Journeyman"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherApprentice1",
		Prev_Title = BS["Leatherworking"]..": "..AL["Apprentice"],
		Next_Page = "LeatherJourneyman2",
		Next_Title = BS["Leatherworking"]..": "..AL["Journeyman"]
	},
	["LeatherJourneyman2"] = {
		Title = BS["Leatherworking"]..": "..AL["Journeyman"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherJourneyman1",
		Prev_Title = BS["Leatherworking"]..": "..AL["Journeyman"],
		Next_Page = "LeatherExpert1",
		Next_Title = BS["Leatherworking"]..": "..AL["Expert"]
	},
	["LeatherExpert1"] = {
		Title = BS["Leatherworking"]..": "..AL["Expert"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherJourneyman2",
		Prev_Title = BS["Leatherworking"]..": "..AL["Journeyman"],
		Next_Page = "LeatherExpert2",
		Next_Title = BS["Leatherworking"]..": "..AL["Expert"]
	},
	["LeatherExpert2"] = {
		Title = BS["Leatherworking"]..": "..AL["Expert"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherExpert1",
		Prev_Title = BS["Leatherworking"]..": "..AL["Expert"],
		Next_Page = "LeatherArtisan1",
		Next_Title = BS["Leatherworking"]..": "..AL["Artisan"]
	},
	["LeatherArtisan1"] = {
		Title = BS["Leatherworking"]..": "..AL["Artisan"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherExpert2",
		Prev_Title = BS["Leatherworking"]..": "..AL["Expert"],
		Next_Page = "LeatherArtisan2",
		Next_Title = BS["Leatherworking"]..": "..AL["Artisan"]
	},
	["LeatherArtisan2"] = {
		Title = BS["Leatherworking"]..": "..AL["Artisan"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherArtisan1",
		Prev_Title = BS["Leatherworking"]..": "..AL["Artisan"],
		Next_Page = "LeatherArtisan3",
		Next_Title = BS["Leatherworking"]..": "..AL["Artisan"]
	},
	["LeatherArtisan3"] = {
		Title = BS["Leatherworking"]..": "..AL["Artisan"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherArtisan2",
		Prev_Title = BS["Leatherworking"]..": "..AL["Artisan"],
		Next_Page = "Dragonscale1",
		Next_Title = BS["Dragonscale Leatherworking"]
	},
	["Dragonscale1"] = {
		Title = BS["Dragonscale Leatherworking"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "LeatherArtisan3",
		Prev_Title = BS["Leatherworking"]..": "..AL["Artisan"],
		Next_Page = "Elemental1",
		Next_Title = BS["Elemental Leatherworking"]
	},
	["Elemental1"] = {
		Title = BS["Elemental Leatherworking"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "Dragonscale1",
		Prev_Title = BS["Dragonscale Leatherworking"],
		Next_Page = "Tribal1",
		Next_Title = BS["Tribal Leatherworking"]
	},
	["Tribal1"] = {
		Title = BS["Tribal Leatherworking"],
		Back_Page = "LEATHERWORKINGMENU",
		Back_Title = BS["Leatherworking"],
		Prev_Page = "Elemental1",
		Prev_Title = BS["Elemental Leatherworking"]
	},
	["Herbalism1"] = {
		Title = BS["Herbalism"],
		Back_Page = "CRAFTINGMENU",
		Back_Title = AL["Crafting"],
		Next_Page = "Herbalism2",
		Next_Title = BS["Herbalism"]
	},
	["Herbalism2"] = {
		Title = BS["Herbalism"],
		Back_Page = "CRAFTINGMENU",
		Back_Title = AL["Crafting"],
		Prev_Page = "Herbalism1",
		Prev_Title = BS["Herbalism"]
	},
	["Mining1"] = {
		Title = BS["Mining"],
		Back_Page = "MININGMENU",
		Back_Title = AL["Crafting"],
		Next_Page = "Mining2",
		Next_Title = BS["Mining"]
	},
	["Mining2"] = {
		Title = BS["Mining"],
		Back_Page = "MININGMENU",
		Back_Title = AL["Crafting"],
		Next_Page = "Smelting1",
		Next_Title = BS["Smelting"],
		Prev_Page = "Mining1",
		Prev_Title = BS["Mining"]
	},
	["Smelting1"] = {
		Title = BS["Smelting"],
		Back_Page = "MININGMENU",
		Back_Title = AL["Crafting"],
		Prev_Page = "Mining2",
		Prev_Title = BS["Mining"]
	},
	["TailoringApprentice1"] = {
		Title = BS["Tailoring"]..": "..AL["Apprentice"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Next_Page = "TailoringApprentice2",
		Next_Title = BS["Tailoring"]..": "..AL["Journeyman"]
	},
	["TailoringApprentice2"] = {
		Title = BS["Tailoring"]..": "..AL["Apprentice"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringApprentice1",
		Prev_Title = BS["Tailoring"]..": "..AL["Apprentice"],
		Next_Page = "TailoringJourneyman1",
		Next_Title = BS["Tailoring"]..": "..AL["Journeyman"]
	},
	["TailoringJourneyman1"] = {
		Title = BS["Tailoring"]..": "..AL["Journeyman"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringApprentice2",
		Prev_Title = BS["Tailoring"]..": "..AL["Apprentice"],
		Next_Page = "TailoringJourneyman2",
		Next_Title = BS["Tailoring"]..": "..AL["Journeyman"]
	},
	["TailoringJourneyman2"] = {
		Title = BS["Tailoring"]..": "..AL["Journeyman"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringJourneyman1",
		Prev_Title = BS["Tailoring"]..": "..AL["Journeyman"],
		Next_Page = "TailoringExpert1",
		Next_Title = BS["Tailoring"]..": "..AL["Expert"]
	},
	["TailoringExpert1"] = {
		Title = BS["Tailoring"]..": "..AL["Expert"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringJourneyman2",
		Prev_Title = BS["Tailoring"]..": "..AL["Journeyman"],
		Next_Page = "TailoringExpert2",
		Next_Title = BS["Tailoring"]..": "..AL["Expert"]
	},
	["TailoringExpert2"] = {
		Title = BS["Tailoring"]..": "..AL["Expert"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringExpert1",
		Prev_Title = BS["Tailoring"]..": "..AL["Expert"],
		Next_Page = "TailoringArtisan1",
		Next_Title = BS["Tailoring"]..": "..AL["Artisan"]
	},
	["TailoringArtisan1"] = {
		Title = BS["Tailoring"]..": "..AL["Artisan"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringExpert2",
		Prev_Title = BS["Tailoring"]..": "..AL["Expert"],
		Next_Page = "TailoringArtisan2",
		Next_Title = BS["Tailoring"]..": "..AL["Artisan"]
	},
	["TailoringArtisan2"] = {
		Title = BS["Tailoring"]..": "..AL["Artisan"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringArtisan1",
		Prev_Title = BS["Tailoring"]..": "..AL["Artisan"],
		Next_Page = "TailoringArtisan3",
		Next_Title = BS["Tailoring"]..": "..AL["Artisan"],
	},
	["TailoringArtisan3"] = {
		Title = BS["Tailoring"]..": "..AL["Artisan"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringArtisan2",
		Prev_Title = BS["Tailoring"]..": "..AL["Artisan"],
		Next_Page = "TailoringArtisan4",
		Next_Title = BS["Tailoring"]..": "..AL["Artisan"],
	},
	["TailoringArtisan4"] = {
		Title = BS["Tailoring"]..": "..AL["Artisan"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringArtisan3",
		Prev_Title = BS["Tailoring"]..": "..AL["Artisan"],
		Next_Page = "TailoringArtisan5",
		Next_Title = BS["Tailoring"] .. ": " .. AL["Artisan"],
	},
	["TailoringArtisan5"] = {
		Title = BS["Tailoring"] .. ": " .. AL["Artisan"],
		Back_Page = "TAILORINGMENU",
		Back_Title = BS["Tailoring"],
		Prev_Page = "TailoringArtisan4",
		Prev_Title = BS["Tailoring"] .. ": " .. AL["Artisan"],
	},
	["CookingApprentice1"] = {
		Title = BS["Cooking"]..": "..AL["Apprentice"],
		Back_Page = "COOKINGMENU",
		Back_Title = BS["Cooking"],
		Next_Page = "CookingJourneyman1",
		Next_Title = BS["Cooking"]..": "..AL["Journeyman"],
	},
	["CookingJourneyman1"] = {
		Title = BS["Cooking"]..": "..AL["Journeyman"],
		Back_Page = "COOKINGMENU",
		Back_Title = BS["Cooking"],
		Prev_Page = "CookingApprentice1",
		Prev_Title = BS["Cooking"]..": "..AL["Apprentice"],
		Next_Page = "CookingExpert1",
		Next_Title = BS["Cooking"]..": "..AL["Journeyman"],
	},
	["CookingExpert1"] = {
		Title = BS["Cooking"]..": "..AL["Expert"],
		Back_Page = "COOKINGMENU",
		Back_Title = BS["Cooking"],
		Prev_Page = "CookingJourneyman1",
		Prev_Title = BS["Cooking"]..": "..AL["Journeyman"],
		Next_Page = "CookingArtisan1",
		Next_Title = BS["Cooking"]..": "..AL["Artisan"],
	},
	["CookingArtisan1"] = {
		Title = BS["Cooking"]..": "..AL["Artisan"],
		Back_Page = "COOKINGMENU",
		Back_Title = BS["Cooking"],
		Prev_Page = "CookingExpert1",
		Prev_Title = BS["Cooking"]..": "..AL["Expert"],
	},
	["FirstAid1"] = {
		Title = BS["First Aid"],
		Back_Page = "CRAFTINGMENU",
		Back_Title = AL["Crafting"],
	},
	["Survival1"] = {
		Title = AL["Survival"],
		Back_Page = "SURVIVALMENU",
		Back_Title = AL["Survival"],
		Prev_Page = "Survival2",
		Prev_Title = AL["Garderning"],
		Next_Page = "Survival2",
		Next_Title = AL["Garderning"],
	},
	["Survival2"] = {
		Title = AL["Garderning"],
		Back_Page = "SURVIVALMENU",
		Back_Title = AL["Survival"],
		Prev_Page = "Survival1",
		Prev_Title = AL["Survival"],
		Next_Page = "Survival1",
		Next_Title = AL["Survival"],
	},
	["Poisons1"] = {
		Title = BS["Poisons"],
		Back_Page = "CRAFTINGMENU",
		Back_Title = AL["Crafting"],
	},
}