--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 - 2008 Dan Gilbert
	Email me at loglow@gmail.com

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]

-- Atlas English Localization
-- Compiled by Dan Gilbert
-- loglow@gmail.com
-- Many thanks to all contributors!

--************************************************
-- Global Atlas Strings
--************************************************

if ( GetLocale() == "enUS" or GetLocale() == "enGB" ) then

local BLUE = "|cff6666ff";
local GREY = "|cff999999";
local GREN = "|cff66cc33";
local _RED = "|cffcc6666";
local ORNG = "|cffcc9933";
local PURP = "|cff9900ff";
local WHIT = "|cffffffff";
local INDENT = "   ";

AtlasSortIgnore = {"the (.+)"};

ATLAS_TITLE = "Atlas";
ATLAS_SUBTITLE = "Instance Map Browser";
ATLAS_DESC = "Atlas is an instance map browser.";

BINDING_HEADER_ATLAS_TITLE = "Atlas Bindings";
BINDING_NAME_ATLAS_TOGGLE = "Toggle Atlas";
BINDING_NAME_ATLAS_OPTIONS = "Toggle Options";
BINDING_NAME_ATLAS_AUTOSEL = "Auto-Select";

ATLAS_SLASH = "/atlas";
ATLAS_SLASH_OPTIONS = "options";

ATLAS_STRING_LOCATION = "Location";
ATLAS_STRING_LEVELRANGE = "Level Range";
ATLAS_STRING_PLAYERLIMIT = "Player Limit";
ATLAS_STRING_SELECT_CAT = "Select Category";
ATLAS_STRING_SELECT_MAP = "Select Map";
ATLAS_STRING_SEARCH = "Search";
ATLAS_STRING_CLEAR = "Clear";
ATLAS_STRING_MINLEVEL = "Minimum Level";

ATLAS_OPTIONS_BUTTON = "Options";
ATLAS_OPTIONS_TITLE = "Atlas Options";
ATLAS_OPTIONS_SHOWBUT = "Show Button on Minimap";
ATLAS_OPTIONS_AUTOSEL = "Auto-Select Instance Map";
ATLAS_OPTIONS_BUTPOS = "Button Position";
ATLAS_OPTIONS_TRANS = "Transparency";
ATLAS_OPTIONS_DONE = "Done";
ATLAS_OPTIONS_REPMAP = "Replace the World Map";
ATLAS_OPTIONS_RCLICK = "Right-Click for World Map";
ATLAS_OPTIONS_SHOWMAPNAME = "Show map name";
ATLAS_OPTIONS_RESETPOS = "Reset Position";
ATLAS_OPTIONS_ACRONYMS = "Display Acronyms";
ATLAS_OPTIONS_SCALE = "Scale";
ATLAS_OPTIONS_BUTRAD = "Button Radius";
ATLAS_OPTIONS_CLAMPED = "Clamp window to screen";
ATLAS_OPTIONS_HELP = "Left-click and drag to move this window.";
ATLAS_OPTIONS_CTRL = "Hold down Control for tooltips";
ATLAS_OPTIONS_COORDS = "Show coordinates on the World Map";

ATLAS_BUTTON_TOOLTIP_TITLE = "Atlas";
ATLAS_BUTTON_TOOLTIP_HINT = "Left-click to open Atlas.\nMiddle-click for Atlas options.\nRight-click and drag to move this button.";
ATLAS_TITAN_HINT = "Left-click to open Atlas.\nMiddle-click for Atlas options.\nRight-click for the display menu.";

ATLAS_OPTIONS_CATDD = "Sort Instance Maps by:";
ATLAS_DDL_CONTINENT = "Continent";
ATLAS_DDL_CONTINENT_EASTERN = "Eastern Kingdoms Instances";
ATLAS_DDL_CONTINENT_KALIMDOR = "Kalimdor Instances";
ATLAS_DDL_LEVEL = "Level";
ATLAS_DDL_LEVEL_MENU = "Instances sorted by level";
ATLAS_DDL_PARTYSIZE = "Party Size";
ATLAS_DDL_PARTYSIZE_5 = "Instances for 5 Players";
ATLAS_DDL_PARTYSIZE_10 = "Instances for 10 Players";
ATLAS_DDL_PARTYSIZE_20 = "Instances for 20 Players";
ATLAS_DDL_PARTYSIZE_40 = "Instances for 40 Players";
ATLAS_DDL_ALL = "All";
ATLAS_DDL_ALL_MENU = "Showing all instances";
ATLAS_DDL_TYPE = "Type";
ATLAS_DDL_TYPE_DUNGEONS = "Dungeons";
ATLAS_DDL_TYPE_RAIDS = "Raids";
ATLAS_DDL_WORLDBOSSES = "World Bosses";
ATLAS_DDL_TYPE_ENTRANCE = GREN.."Entrances";
ATLAS_DDL_BGS = GREN.."Battlegrounds";
ATLAS_DDL_DUNGEON_LOCATIONS = GREN.."Dungeon Locations";
ATLAS_DDL_FLIGHT_PATHS = GREN.."Flight Path Maps";
ATLAS_DDL_LEVELING_GUIDE = "Leveling Guide";
ATLAS_DDL_LEVELING_GUIDE_ALLIANCE1 = "Alliance Leveling Guide Part 1";
ATLAS_DDL_LEVELING_GUIDE_ALLIANCE2 = "Alliance Leveling Guide Part 2";
ATLAS_DDL_LEVELING_GUIDE_HORDE1 = "Horde Leveling Guide Part 1";
ATLAS_DDL_LEVELING_GUIDE_HORDE2 = "Horde Leveling Guide Part 2";

ATLAS_INSTANCE_BUTTON = "Instance";
ATLAS_ENTRANCE_BUTTON = "Entrance";
ATLAS_SEARCH_UNAVAIL = "Search Unavailable";

AtlasZoneSubstitutions = {
	["The Temple of Atal'Hakkar"] = "Sunken Temple";
	["Ahn'Qiraj"] = "Temple of Ahn'Qiraj";
};

AtlasLocale = {

--************************************************
-- Zone Names, Acronyms, and Common Strings
--************************************************

	--Common strings
	["Adult"] = "Adult";
	["AKA"] = "AKA";
	["Alliance"] = "Alliance";
	["Arcane"] = "Arcane";
	["Arcane Container"] = "Arcane Container";
	["Argent Dawn"] = "Argent Dawn";
	["Arms Warrior"] = "Arms Warrior";
	["Attunement Required"] = "Attunement Required";
	["Back"] = "Back";
	["Basement"] = "Basement";
	["Bat"] = "Bat";
	["Battleground Maps"] = "Battleground Maps";
	["Battlegrounds"] = "Battlegrounds";
	["Blacksmithing Plans"] = "Blacksmithing Plans";
	["Blue"] = "Blue";
	["Boss"] = "Boss";
	["Brazier of Invocation"] = "Brazier of Invocation";
	["Chase Begins"] = "Chase Begins";
	["Chase Ends"] = "Chase Ends";
	["Child"] = "Child";
	["Connection"] = "Connection";
	["Connections"] = "Connections";
	["Damage: "] = "Damage: ";
	["D2 Summon"] = "D2 Summon";
	["Dungeon Locations"] = "Dungeon Locations";
	["East"] = "East";
	["Elevator"] = "Elevator";
	["End"] = "End";
	["Entrance"] = "Entrance";
	["Event"] = "Event";
	["Exalted"] = "Exalted";
	["Exit"] = "Exit";
	["Fire"] = "Fire";
	["Fourth Stop"] = "Fourth Stop";
	["Front"] = "Front";
	["Frost"] = "Frost";
	["Ghost"] = "Ghost";
	["Hallow's End"] = "Hallow's End";
	["Heroic"] = "Heroic";
	["Horde Leveling Guide"] = "Horde Leveling Guide";
	["Alliance Leveling Guide"] = "Alliance Leveling Guide";
	["Holy Paladin"] = "Holy Paladin";
	["Holy Priest"] = "Holy Priest";
	["Horde"] = "Horde";
	["Hunter"] = "Hunter";
	["Imp"] = "Imp";
	["Instances"] = "Instances";
	["Key"] = "Key";
	["Lower"] = "Lower";
	["Lunar"] = "Lunar";
	["Lunar Festival"] = "Lunar Festival";
	["Mage"] = "Mage";
	["Meeting Stone"] = "Meeting Stone";
	["Moonwell"] = "Moonwell";
	["Nature"] = "Nature";
	["Neutral"] = "Neutral";
	["North"] = "North";
	["Optional"] = "Optional";
	["Orange"] = "Orange";
	["Outside"] = "Outside";
	["Paladin"] = "Paladin";
	["Panther"] = "Panther";
	["Portal"] = "Portal";
	["Priest"] = "Priest";
	["Protection Warrior"] = "Protection Warrior";
	["Purple"] = "Purple";
	["Random"] = "Random";
	["Raptor"] = "Raptor";
	["Rare"] = "Rare";
	["Red"] = "Red";
	["Rep"] = "Rep";
	["Repair"] = "Repair";
	["Rescued"] = "Rescued";
	["Retribution Paladin"] = "Retribution Paladin";
	["Rewards"] = "Rewards";
	["Rogue"] = "Rogue";
	["Scourge Invasion"] = "Scourge Invasion";
	["Second Stop"] = "Second Stop";
	["Shadow"] = "Shadow";
	["Shadow Priest"] = "Shadow Priest";
	["Shaman"] = "Shaman";
	["Side"] = "Side";
	["Snake"] = "Snake";
	["South"] = "South";
	["Spawn Point"] = "Spawn Point";
	["Spider"] = "Spider";
	["Start"] = "Start";
	["Summon"] = "Summon";
	["Teleport"] = "Teleport";
	["Third Stop"] = "Third Stop";
	["through "] = "through ";
	["Tiger"] = "Tiger";
	["Top"] = "Top";
	["Trash Mobs"] = "Trash Mobs";
	["Undead"] = "Undead";
	["Underwater"] = "Underwater";
	["Unknown"] = "Unknown";
	["Upper"] = "Upper";
	["Varies"] = "Varies";
	["Various"] = "Various";
	["Wanders"] = "Wanders";
	["Warlock"] = "Warlock";
	["Warrior"] = "Warrior";
	["West"] = "West";
	["White"] = "White";
	
	--Instance names and acronyms
	["Armory"] = "Armory";
	["Blackfathom Deeps"] = "Blackfathom Deeps"; ["BFD"] = "BFD";
	["Blackrock Depths"] = "Blackrock Depths"; ["BRD"] = "BRD";
	["Blackrock Spire"] = "Blackrock Spire"; ["LBRS"] = "LBRS"; ["UBRS"] = "UBRS";
	["Blackwing Lair"] = "Blackwing Lair"; ["BWL"] = "BWL";
	["Cathedral"] = "Cathedral"; ["Cath"] = "Cath";
	["Dire Maul"] = "Dire Maul"; ["DME"] = "DME"; ["DMN"] = "DMN"; ["DMW"] = "DMW";
	["Gnomeregan"] = "Gnomeregan"; ["Gnome"] = "Gnome";
	["Graveyard"] = "Graveyard"; ["GY"] = "GY";
	["Library"] = "Library"; ["Lib"] = "Lib";
	["Lower Blackrock Spire"] = "Lower Blackrock Spire";
	["Maraudon"] = "Maraudon"; ["Mara"] = "Mara";
	["Molten Core"] = "Molten Core"; ["MC"] = "MC";
	["Naxxramas"] = "Naxxramas"; ["Nax"] = "Nax";
	["Onyxia's Lair"] = "Onyxia's Lair"; ["Ony"] = "Ony";
	["Ragefire Chasm"] = "Ragefire Chasm"; ["RFC"] = "RFC";
	["Razorfen Downs"] = "Razorfen Downs"; ["RFD"] = "RFD";
	["Razorfen Kraul"] = "Razorfen Kraul"; ["RFK"] = "RFK";
	["Ruins of Ahn'Qiraj"] = "Ruins of Ahn'Qiraj"; ["AQ20"] = "AQ20";
	["Scarlet Monastery"] = "Scarlet Monastery"; ["SM"] = "SM"; ["SM Lib"] = "SM Lib"; ["SM Arm"] = "SM Arm"; ["SM Cath"] = "SM Cath"; ["SM GY"] = "SM GY";
	["Scholomance"] = "Scholomance"; ["Scholo"] = "Scholo";
	["Shadowfang Keep"] = "Shadowfang Keep"; ["SFK"] = "SFK";
	["Stratholme"] = "Stratholme"; ["Strat"] = "Strat";
	["Sunken Temple"] = "Sunken Temple"; ["ST"] = "ST";
	["Temple of Ahn'Qiraj"] = "Temple of Ahn'Qiraj"; ["AQ40"] = "AQ40";
	["The Deadmines"] = "The Deadmines"; ["DM"] = "DM";
	["The Stockade"] = "The Stockade"; ["Stocks"] = "Stocks";
	["Uldaman"] = "Uldaman"; ["Uld"] = "Uld";
	["Upper Blackrock Spire"] = "Upper Blackrock Spire";
	["Wailing Caverns"] = "Wailing Caverns"; ["WC"] = "WC";
	["Zul'Farrak"] = "Zul'Farrak"; ["ZF"] = "ZF";
	["Zul'Gurub"] = "Zul'Gurub"; ["ZG"] = "ZG";
	
	--Continents
	["Eastern Kingdoms"] = "Eastern Kingdoms";
	["Kalimdor"] = "Kalimdor";
	
	--Outdoor zones, Locations
	["Ashenvale"] = "Ashenvale";
	["Badlands"] = "Badlands";
	["Blackrock Mountain"] = "Blackrock Mountain"; ["BRM"] = "BRM";
	["Burning Steppes"] = "Burning Steppes";
	["Deadwind Pass"] = "Deadwind Pass";
	["Desolace"] = "Desolace";
	["Dun Morogh"] = "Dun Morogh";
	["Dustwallow Marsh"] = "Dustwallow Marsh";
	["Eastern Plaguelands"] = "Eastern Plaguelands";
	["Feralas"] = "Feralas";
	["Orgrimmar"] = "Orgrimmar";
	["Searing Gorge"] = "Searing Gorge";
	["Silithus"] = "Silithus";
	["Silverpine Forest"] = "Silverpine Forest";
	["Stormwind City"] = "Stormwind City";
	["Stranglethorn Vale"] = "Stranglethorn Vale";
	["Swamp of Sorrows"] = "Swamp of Sorrows";
	["Tanaris"] = "Tanaris";
	["The Barrens"] = "The Barrens";
	["Tirisfal Glades"] = "Tirisfal Glades";
	["Western Plaguelands"] = "Western Plaguelands";
	["Westfall"] = "Westfall";
	
	--Set names
	["Set: "] = "Set: ";
	["Embrace of the Viper"] = "Embrace of the Viper";
	["Ironweave Battlesuit"] = "Ironweave Battlesuit";
	["The Gladiator"] = "The Gladiator";
	["Spider's Kiss"] = "Spider's Kiss";
	["Chain of the Scarlet Crusade"] = "Chain of the Scarlet Crusade";
	["Necropile Raiment"] = "Necropile Raiment";
	["Cadaverous Garb"] = "Cadaverous Garb";
	["Bloodmail Regalia"] = "Bloodmail Regalia";
	["Deathbone Guardian"] = "Deathbone Guardian";
	["The Postmaster"] = "The Postmaster";
	["Defias Leather"] = "Defias Leather";
	["Primal Blessing"] = "Primal Blessing";
	["The Twin Blades of Hakkari"] = "The Twin Blades of Hakkari";
	["D1/D2 Sets"] = "D1/D2 Sets";
	["ZG Sets"] = "ZG Sets";
	["ZG Ring Sets"] = "ZG Ring Sets";
	["AQ20 Sets"] = "AQ20 Sets";
	["AQ40 Sets"] = "AQ40 Sets";
	["T1 Sets"] = "T1 Sets";
	["T2 Sets"] = "T2 Sets";
	["T3 Sets"] = "T3 Sets";

--************************************************
-- Kalimdor Instance Data
--************************************************

	--Ragefire Chasm
	["Maur Grimtotem"] = "Maur Grimtotem";
	["Oggleflint <Ragefire Chieftain>"] = "Oggleflint <Ragefire Chieftain>";
	["Taragaman the Hungerer"] = "Taragaman the Hungerer";
	["Jergosh the Invoker"] = "Jergosh the Invoker";
	["Zelemar the Wrathful"] = "Zelemar the Wrathful";
	["Bazzalan"] = "Bazzalan";
	
	--Wailing Caverns
	["Disciple of Naralex"] = "Disciple of Naralex";
	["Mysterious Wailing Caverns Chest"] = "Mysterious Wailing Caverns Chest";
	["Lord Cobrahn <Fanglord>"] = "Lord Cobrahn <Fanglord>";
	["Lady Anacondra <Fanglord>"] = "Lady Anacondra <Fanglord>";
	["Kresh"] = "Kresh";
	["Lord Pythas <Fanglord>"] = "Lord Pythas <Fanglord>";
	["Skum"] = "Skum";
	["Lord Serpentis <Fanglord>"] = "Lord Serpentis <Fanglord>";
	["Verdan the Everliving"] = "Verdan the Everliving";
	["Mutanus the Devourer"] = "Mutanus the Devourer";
	["Naralex"] = "Naralex";
	["Deviate Faerie Dragon"] = "Deviate Faerie Dragon";
	
	--Blackfathom Deeps
	["Ghamoo-ra"] = "Ghamoo-ra";
	["Lorgalis Manuscript"] = "Lorgalis Manuscript";
	["Lady Sarevess"] = "Lady Sarevess";
	["Argent Guard Thaelrid <The Argent Dawn>"] = "Argent Guard Thaelrid <The Argent Dawn>";
	["Gelihast"] = "Gelihast";
	["Shrine of Gelihast"] = "Shrine of Gelihast";
	["Lorgus Jett"] = "Lorgus Jett";
	["Fathom Stone"] = "Fathom Stone";
	["Baron Aquanis"] = "Baron Aquanis";
	["Twilight Lord Kelris"] = "Twilight Lord Kelris";
	["Old Serra'kis"] = "Old Serra'kis";
	["Aku'mai"] = "Aku'mai";
	["Morridune"] = "Morridune";
	["Altar of the Deeps"] = "Altar of the Deeps";
	
	--Razorfen Kraul
	["Roogug"] = "Roogug";
	["Aggem Thorncurse <Death's Head Prophet>"] = "Aggem Thorncurse <Death's Head Prophet>";
	["Death Speaker Jargba <Death's Head Captain>"] = "Death Speaker Jargba <Death's Head Captain>";
	["Overlord Ramtusk"] = "Overlord Ramtusk";
	["Razorfen Spearhide"] = "Razorfen Spearhide";
	["Agathelos the Raging"] = "Agathelos the Raging";
	["Blind Hunter"] = "Blind Hunter";
	["Charlga Razorflank <The Crone>"] = "Charlga Razorflank <The Crone>";
	["Willix the Importer"] = "Willix the Importer";
	["Heralath Fallowbrook"] = "Heralath Fallowbrook";
	["Earthcaller Halmgar"] = "Earthcaller Halmgar";

	--Razorfen Downs
	["Tuten'kash"] = "Tuten'kash";
	["Henry Stern"] = "Henry Stern";
	["Belnistrasz"] = "Belnistrasz";
	["Sah'rhee"] = "Sah'rhee";
	["Lady Falther'ess"] = "Lady Falther'ess";
	["Mordresh Fire Eye"] = "Mordresh Fire Eye";
	["Glutton"] = "Glutton";
	["Ragglesnout"] = "Ragglesnout";
	["Amnennar the Coldbringer"] = "Amnennar the Coldbringer";
	["Plaguemaw the Rotting"] = "Plaguemaw the Rotting";
	
	--Zul'Farrak
	["Mallet of Zul'Farrak"] = "Mallet of Zul'Farrak";
	["Antu'sul <Overseer of Sul>"] = "Antu'sul <Overseer of Sul>";
	["Theka the Martyr"] = "Theka the Martyr";
	["Witch Doctor Zum'rah"] = "Witch Doctor Zum'rah";
	["Zul'Farrak Dead Hero"] = "Zul'Farrak Dead Hero";
	["Nekrum Gutchewer"] = "Nekrum Gutchewer";
	["Shadowpriest Sezz'ziz"] = "Shadowpriest Sezz'ziz";
	["Dustwraith"] = "Dustwraith";
	["Sergeant Bly"] = "Sergeant Bly";
	["Weegli Blastfuse"] = "Weegli Blastfuse";
	["Murta Grimgut"] = "Murta Grimgut";
	["Raven"] = "Raven";
	["Oro Eyegouge"] = "Oro Eyegouge";
	["Sandfury Executioner"] = "Sandfury Executioner";
	["Hydromancer Velratha"] = "Hydromancer Velratha";
	["Gahz'rilla"] = "Gahz'rilla";
	["Elder Wildmane"] = "Elder Wildmane";
	["Chief Ukorz Sandscalp"] = "Chief Ukorz Sandscalp";
	["Ruuzlu"] = "Ruuzlu";
	["Zerillis"] = "Zerillis";
	["Sandarr Dunereaver"] = "Sandarr Dunereaver";
	
	--Maraudon	
	["Scepter of Celebras"] = "Scepter of Celebras";
	["Veng <The Fifth Khan>"] = "Veng <The Fifth Khan>";
	["Noxxion"] = "Noxxion";
	["Razorlash"] = "Razorlash";
	["Maraudos <The Fourth Khan>"] = "Maraudos <The Fourth Khan>";
	["Lord Vyletongue"] = "Lord Vyletongue";
	["Meshlok the Harvester"] = "Meshlok the Harvester";
	["Celebras the Cursed"] = "Celebras the Cursed";
	["Landslide"] = "Landslide";
	["Tinkerer Gizlock"] = "Tinkerer Gizlock";
	["Rotgrip"] = "Rotgrip";
	["Princess Theradras"] = "Princess Theradras";
	["Elder Splitrock"] = "Elder Splitrock";
	
	--Dire Maul (East)
	["Pusillin"] = "Pusillin";
	["Zevrim Thornhoof"] = "Zevrim Thornhoof";
	["Hydrospawn"] = "Hydrospawn";
	["Lethtendris"] = "Lethtendris";
	["Pimgib"] = "Pimgib";
	["Old Ironbark"] = "Old Ironbark";
	["Alzzin the Wildshaper"] = "Alzzin the Wildshaper";
	["Isalien"] = "Isalien";
	["A Dusty Tome"] = "A Dusty Tome";
	["Felvine Shard"] = "Felvine Shard";
	["Dire Maul Books"] = "Dire Maul Books";
	
	--Dire Maul (North)
	["Crescent Key"] = "Crescent Key";--omitted from Dire Maul (West)
	["Gordok Courtyard Key"] = "Gordok Courtyard Key";
	["Gordok Inner Door Key"] = "Gordok Inner Door Key";
	--"Library" omitted from here and DM West because of SM: "Library" duplicate
	["Guard Mol'dar"] = "Guard Mol'dar";
	["Stomper Kreeg <The Drunk>"] = "Stomper Kreeg <The Drunk>";
	["Guard Fengus"] = "Guard Fengus";
	["Knot Thimblejack"] = "Knot Thimblejack";
	["Guard Slip'kik"] = "Guard Slip'kik";
	["Captain Kromcrush"] = "Captain Kromcrush";
	["King Gordok"] = "King Gordok";
	["Cho'Rush the Observer"] = "Cho'Rush the Observer";
	["Falrin Treeshaper"] = "Falrin Treeshaper";
	["Lorekeeper Lydros"] = "Lorekeeper Lydros";
	["Lorekeeper Javon"] = "Lorekeeper Javon";
	["Lorekeeper Kildrath"] = "Lorekeeper Kildrath";
	["Lorekeeper Mykos"] = "Lorekeeper Mykos";
	["Shen'dralar Provisioner"] = "Shen'dralar Provisioner";
	["Skeletal Remains of Kariel Winthalus"] = "Skeletal Remains of Kariel Winthalus";
	["Tribute Run"] = "Tribute Run";

	--Dire Maul (West)
	["J'eevee's Jar"] = "J'eevee's Jar";
	["Pylons"] = "Pylons";
	["Shen'dralar Ancient"] = "Shen'dralar Ancient";
	["Tendris Warpwood"] = "Tendris Warpwood";
	["Ancient Equine Spirit"] = "Ancient Equine Spirit";
	["Illyanna Ravenoak"] = "Illyanna Ravenoak";
	["Ferra"] = "Ferra";
	["Magister Kalendris"] = "Magister Kalendris";
	["Tsu'zee"] = "Tsu'zee";
	["Immol'thar"] = "Immol'thar";
	["Lord Hel'nurath"] = "Lord Hel'nurath";
	["Prince Tortheldrin"] = "Prince Tortheldrin";
	["Falrin Treeshaper"] = "Falrin Treeshaper";
	["Lorekeeper Lydros"] = "Lorekeeper Lydros";
	["Lorekeeper Javon"] = "Lorekeeper Javon";
	["Lorekeeper Kildrath"] = "Lorekeeper Kildrath";
	["Lorekeeper Mykos"] = "Lorekeeper Mykos";
	["Shen'dralar Provisioner"] = "Shen'dralar Provisioner";
	["Skeletal Remains of Kariel Winthalus"] = "Skeletal Remains of Kariel Winthalus";
	["The Prince's Chest"] = "The Prince's Chest";
	["Revanchion"] = "Revanchion";
	
	--Onyxia's Lair
	["Drakefire Amulet"] = "Drakefire Amulet";
	["Onyxian Warders"] = "Onyxian Warders";
	["Whelp Eggs"] = "Whelp Eggs";
	["Onyxia"] = "Onyxia";

	--Temple of Ahn'Qiraj
	["Brood of Nozdormu"] = "Brood of Nozdormu";
	["The Prophet Skeram"] = "The Prophet Skeram";
	["Bug Trio"] = "Bug Trio";
	["Vem"] = "Vem";
	["Lord Kri"] = "Lord Kri";
	["Princess Yauj"] = "Princess Yauj";
	["Battleguard Sartura"] = "Battleguard Sartura";
	["Fankriss the Unyielding"] = "Fankriss the Unyielding";
	["Viscidus"] = "Viscidus";
	["Princess Huhuran"] = "Princess Huhuran";
	["Twin Emperors"] = "Twin Emperors";
	["Emperor Vek'lor"] = "Emperor Vek'lor";
	["Emperor Vek'nilash"] = "Emperor Vek'nilash";
	["Ouro"] = "Ouro";
	["C'Thun"] = "C'Thun";
	["Andorgos <Brood of Malygos>"] = "Andorgos <Brood of Malygos>";
	["Vethsera <Brood of Ysera>"] = "Vethsera <Brood of Ysera>";
	["Kandrostrasz <Brood of Alexstrasza>"] = "Kandrostrasz <Brood of Alexstrasza>";
	["Arygos"] = "Arygos";
	["Caelestrasz"] = "Caelestrasz";
	["Merithra of the Dream"] = "Merithra of the Dream";
	["AQ Enchants"] = "AQ Enchants";
	["AQ Opening Quest Chain"] = "AQ Opening Quest Chain";
	
	--Ruins of Ahn'Qiraj
	["Cenarion Circle"] = "Cenarion Circle";
	["Kurinnaxx"] = "Kurinnaxx";
	["Lieutenant General Andorov"] = "Lieutenant General Andorov";
	["Four Kaldorei Elites"] = "Four Kaldorei Elites";
	["General Rajaxx"] = "General Rajaxx";
	["Captain Qeez"] = "Captain Qeez";
	["Captain Tuubid"] = "Captain Tuubid";
	["Captain Drenn"] = "Captain Drenn";
	["Captain Xurrem"] = "Captain Xurrem";
	["Major Yeggeth"] = "Major Yeggeth";
	["Major Pakkon"] = "Major Pakkon";
	["Colonel Zerran"] = "Colonel Zerran";
	["Moam"] = "Moam";
	["Buru the Gorger"] = "Buru the Gorger";
	["Ayamiss the Hunter"] = "Ayamiss the Hunter";
	["Ossirian the Unscarred"] = "Ossirian the Unscarred";
	["Safe Room"] = "Safe Room";
	["Class Books"] = "Class Books";
	["AQ20 Class Sets"] = "AQ20 Class Sets";
	
--****************************
-- Eastern Kingdoms Instances
--****************************
	
	--Blackrock Depths
	["Shadowforge Key"] = "Shadowforge Key";
	["Prison Cell Key"] = "Prison Cell Key";
	["Jail Break!"] = "Jail Break!";
	["Banner of Provocation"] = "Banner of Provocation";
	["Lord Roccor"] = "Lord Roccor";
	["Kharan Mighthammer"] = "Kharan Mighthammer";
	["Commander Gor'shak <Kargath Expeditionary Force>"] = "Commander Gor'shak <Kargath Expeditionary Force>";
	["Marshal Windsor"] = "Marshal Windsor";
	["High Interrogator Gerstahn <Twilight's Hammer Interrogator>"] = "High Interrogator Gerstahn <Twilight's Hammer Interrogator>";
	["Ring of Law"] = "Ring of Law";
	["Anub'shiah"] = "Anub'shiah";
	["Eviscerator"] = "Eviscerator";
	["Gorosh the Dervish"] = "Gorosh the Dervish";
	["Grizzle"] = "Grizzle";
	["Hedrum the Creeper"] = "Hedrum the Creeper";
	["Ok'thor the Breaker"] = "Ok'thor the Breaker";
	["Theldren"] = "Theldren";
	["Lefty"] = "Lefty";
	["Malgen Longspear"] = "Malgen Longspear";
	["Gnashjaw <Malgen Longspear's Pet>"] = "Gnashjaw <Malgen Longspear's Pet>";
	["Korv"] = "Korv";
	["Rezznik"] = "Rezznik";
	["Rotfang"] = "Rotfang";
	["Snokh Blackspine"] = "Snokh Blackspine";
	["Va'jashni"] = "Va'jashni";
	["Volida"] = "Volida";
	["Houndmaster Grebmar"] = "Houndmaster Grebmar";
	["Elder Morndeep"] = "Elder Morndeep";
	["High Justice Grimstone"] = "High Justice Grimstone";
	["Monument of Franclorn Forgewright"] = "Monument of Franclorn Forgewright";
	["Pyromancer Loregrain"] = "Pyromancer Loregrain";
	["The Vault"] = "The Vault";
	["Warder Stilgiss"] = "Warder Stilgiss";
	["Verek"] = "Verek";
	["Watchman Doomgrip"] = "Watchman Doomgrip";
	["Fineous Darkvire <Chief Architect>"] = "Fineous Darkvire <Chief Architect>";
	["The Black Anvil"] = "The Black Anvil";
	["Lord Incendius"] = "Lord Incendius";
	["Bael'Gar"] = "Bael'Gar";
	["Shadowforge Lock"] = "Shadowforge Lock";
	["General Angerforge"] = "General Angerforge";
	["Golem Lord Argelmach"] = "Golem Lord Argelmach";
	["Field Repair Bot 74A"] = "Field Repair Bot 74A";
	["The Grim Guzzler"] = "The Grim Guzzler";
	["Hurley Blackbreath"] = "Hurley Blackbreath";
	["Lokhtos Darkbargainer <The Thorium Brotherhood>"] = "Lokhtos Darkbargainer <The Thorium Brotherhood>";
	["Mistress Nagmara"] = "Mistress Nagmara";
	["Phalanx"] = "Phalanx";
	["Plugger Spazzring"] = "Plugger Spazzring";
	["Private Rocknot"] = "Private Rocknot";
	["Ribbly Screwspigot"] = "Ribbly Screwspigot";
	["Ambassador Flamelash"] = "Ambassador Flamelash";
	["Panzor the Invincible"] = "Panzor the Invincible";
	["Summoner's Tomb"] = "Summoner's Tomb";
	["Chest of The Seven"] = "Chest of The Seven";
	["The Lyceum"] = "The Lyceum";
	["Magmus"] = "Magmus";
	["Emperor Dagran Thaurissan"] = "Emperor Dagran Thaurissan";
	["Princess Moira Bronzebeard <Princess of Ironforge>"] = "Princess Moira Bronzebeard <Princess of Ironforge>";
	["High Priestess of Thaurissan"] = "High Priestess of Thaurissan";
	["The Black Forge"] = "The Black Forge";
	["Core Fragment"] = "Core Fragment";
	["Overmaster Pyron"] = "Overmaster Pyron";
	["BRDRogue"] = "|cfffff468Rogue";
	["BRDHunter"] = "|cffaad372Hunter";
	["BRDMage"] = "|cff68ccefMage";
	["BRDPet"] = "|cffaad372Pet";
	["BRDPriest"] = "|cffffffffPriest";
	["BRDShaman"] = "|cff2773ffShaman";
	["BRDEngineer"] = "|cffc69b6dEngineer";

	--Blackrock Spire (Lower)
	["Vaelan"] = "Vaelan";
	["Warosh <The Cursed>"] = "Warosh <The Cursed>";
	["Elder Stonefort"] = "Elder Stonefort";
	["Roughshod Pike"] = "Roughshod Pike";
	["Spirestone Butcher"] = "Spirestone Butcher";
	["Highlord Omokk"] = "Highlord Omokk";
	["Spirestone Battle Lord"] = "Spirestone Battle Lord";
	["Spirestone Lord Magus"] = "Spirestone Lord Magus";
	["Shadow Hunter Vosh'gajin"] = "Shadow Hunter Vosh'gajin";
	["Fifth Mosh'aru Tablet"] = "Fifth Mosh'aru Tablet";
	["Bijou"] = "Bijou";
	["War Master Voone"] = "War Master Voone";
	["Mor Grayhoof"] = "Mor Grayhoof";
	["Sixth Mosh'aru Tablet"] = "Sixth Mosh'aru Tablet";
	["Bijou's Belongings"] = "Bijou's Belongings";
	["Human Remains"] = "Human Remains";
	["Unfired Plate Gauntlets"] = "Unfired Plate Gauntlets";
	["Bannok Grimaxe <Firebrand Legion Champion>"] = "Bannok Grimaxe <Firebrand Legion Champion>";
	["Mother Smolderweb"] = "Mother Smolderweb";
	["Crystal Fang"] = "Crystal Fang";
	["Urok's Tribute Pile"] = "Urok's Tribute Pile";
	["Urok Doomhowl"] = "Urok Doomhowl";
	["Quartermaster Zigris <Bloodaxe Legion>"] = "Quartermaster Zigris <Bloodaxe Legion>";
	["Halycon"] = "Halycon";
	["Gizrul the Slavener"] = "Gizrul the Slavener";
	["Ghok Bashguud <Bloodaxe Champion>"] = "Ghok Bashguud <Bloodaxe Champion>";
	["Overlord Wyrmthalak"] = "Overlord Wyrmthalak";
	["Burning Felguard"] = "Burning Felguard";

	--Blackrock Spire (Upper)
	["Seal of Ascension"] = "Seal of Ascension";
	["Pyroguard Emberseer"] = "Pyroguard Emberseer";
	["Solakar Flamewreath"] = "Solakar Flamewreath";
	["Father Flame"] = "Father Flame";
	["Darkstone Tablet"] = "Darkstone Tablet";
	["Doomrigger's Coffer"] = "Doomrigger's Coffer";
	["Jed Runewatcher <Blackhand Legion>"] = "Jed Runewatcher <Blackhand Legion>";
	["Goraluk Anvilcrack <Blackhand Legion Armorsmith>"] = "Goraluk Anvilcrack <Blackhand Legion Armorsmith>";
	["Warchief Rend Blackhand"] = "Warchief Rend Blackhand";
	["Gyth <Rend Blackhand's Mount>"] = "Gyth <Rend Blackhand's Mount>";
	["Awbee"] = "Awbee";
	["The Beast"] = "The Beast";
	["Lord Valthalak"] = "Lord Valthalak";
	["Finkle Einhorn"] = "Finkle Einhorn";
	["General Drakkisath"] = "General Drakkisath";
	["Drakkisath's Brand"] = "Drakkisath's Brand";
	
	--Blackwing Lair
	["Razorgore the Untamed"] = "Razorgore the Untamed";
	["Vaelastrasz the Corrupt"] = "Vaelastrasz the Corrupt";
	["Broodlord Lashlayer"] = "Broodlord Lashlayer";
	["Firemaw"] = "Firemaw";
	["Draconic for Dummies"] = "Draconic for Dummies";
	["Master Elemental Shaper Krixix"] = "Master Elemental Shaper Krixix";
	["Ebonroc"] = "Ebonroc";
	["Flamegor"] = "Flamegor";
	["Chromaggus"] = "Chromaggus";
	["Nefarian"] = "Nefarian";
	["Alchemy Lab"] = "Alchemy Lab";
	
	--Gnomeregan
	["Workshop Key"] = "Workshop Key";
	["Blastmaster Emi Shortfuse"] = "Blastmaster Emi Shortfuse";
	["Grubbis"] = "Grubbis";
	["Chomper"] = "Chomper";
	["Clean Room"] = "Clean Room";
	["Tink Sprocketwhistle <Engineering Supplies>"] = "Tink Sprocketwhistle <Engineering Supplies>";
	["The Sparklematic 5200"] = "The Sparklematic 5200";
	["Mail Box"] = "Mail Box";
	["Kernobee"] = "Kernobee";
	["Alarm-a-bomb 2600"] = "Alarm-a-bomb 2600";
	["Matrix Punchograph 3005-B"] = "Matrix Punchograph 3005-B";
	["Viscous Fallout"] = "Viscous Fallout";
	["Electrocutioner 6000"] = "Electrocutioner 6000";
	["Matrix Punchograph 3005-C"] = "Matrix Punchograph 3005-C";
	["Crowd Pummeler 9-60"] = "Crowd Pummeler 9-60";
	["Matrix Punchograph 3005-D"] = "Matrix Punchograph 3005-D";
	["Dark Iron Ambassador"] = "Dark Iron Ambassador";
	["Mekgineer Thermaplugg"] = "Mekgineer Thermaplugg";
	
	--Molten Core
	["Hydraxian Waterlords"] = "Hydraxian Waterlords";
	["Aqual Quintessence"] = "Aqual Quintessence";
	["Eternal Quintessence"] = "Eternal Quintessence";
	["Lucifron"] = "Lucifron";
	["Magmadar"] = "Magmadar";
	["Gehennas"] = "Gehennas";
	["Garr"] = "Garr";
	["Shazzrah"] = "Shazzrah";
	["Baron Geddon"] = "Baron Geddon";
	["Golemagg the Incinerator"] = "Golemagg the Incinerator";
	["Sulfuron Harbinger"] = "Sulfuron Harbinger";
	["Majordomo Executus"] = "Majordomo Executus";
	["Ragnaros"] = "Ragnaros";
	["Random Boss Loot"] = "Random Boss Loot";

	--SM: Library
	["Houndmaster Loksey"] = "Houndmaster Loksey";
	["Arcanist Doan"] = "Arcanist Doan";
	["Doan's Strongbox"] = "Doan's Strongbox";

	--SM: Armory
	["The Scarlet Key"] = "The Scarlet Key";--omitted from SM: Cathedral
	["Herod <The Scarlet Champion>"] = "Herod <The Scarlet Champion>";

	--SM: Cathedral
	["High Inquisitor Fairbanks"] = "High Inquisitor Fairbanks";
	["Scarlet Commander Mograine"] = "Scarlet Commander Mograine";
	["High Inquisitor Whitemane"] = "High Inquisitor Whitemane";

	--SM: Graveyard
	["Interrogator Vishas"] = "Interrogator Vishas";
	["Vorrel Sengutz"] = "Vorrel Sengutz";
	["Bloodmage Thalnos"] = "Bloodmage Thalnos";
	["Ironspine"] = "Ironspine";
	["Azshir the Sleepless"] = "Azshir the Sleepless";
	["Fallen Champion"] = "Fallen Champion";
	["Scorn"] = "Scorn";
	
	--Scholomance
	["Skeleton Key"] = "Skeleton Key";
	["Viewing Room Key"] = "Viewing Room Key";
	["Viewing Room"] = "Viewing Room";
	["Blood of Innocents"] = "Blood of Innocents";
	["Divination Scryer"] = "Divination Scryer";
	["Blood Steward of Kirtonos"] = "Blood Steward of Kirtonos";
	["The Deed to Southshore"] = "The Deed to Southshore";
	["Kirtonos the Herald"] = "Kirtonos the Herald";
	["Jandice Barov"] = "Jandice Barov";
	["Journal of Jandice Barov"] = "Journal of Jandice Barov";
	["The Deed to Tarren Mill"] = "The Deed to Tarren Mill";
	["Lord Blackwood"] = "Lord Blackwood";
	["Rattlegore"] = "Rattlegore";
	["Death Knight Darkreaver"] = "Death Knight Darkreaver";
	["Marduk Blackpool"] = "Marduk Blackpool";
	["Vectus"] = "Vectus";
	["Ras Frostwhisper"] = "Ras Frostwhisper";
	["The Deed to Brill"] = "The Deed to Brill";
	["Kormok"] = "Kormok";
	["Instructor Malicia"] = "Instructor Malicia";
	["Doctor Theolen Krastinov <The Butcher>"] = "Doctor Theolen Krastinov <The Butcher>";
	["Lorekeeper Polkelt"] = "Lorekeeper Polkelt";
	["The Ravenian"] = "The Ravenian";
	["Lord Alexei Barov"] = "Lord Alexei Barov";
	["The Deed to Caer Darrow"] = "The Deed to Caer Darrow";
	["Lady Illucia Barov"] = "Lady Illucia Barov";
	["Darkmaster Gandling"] = "Darkmaster Gandling";
	["Torch Lever"] = "Torch Lever";
	["Secret Chest"] = "Secret Chest";
	["Alchemy Lab"] = "Alchemy Lab";
	["Old Treasure Chest"] = "Old Treasure Chest";
	
	--Shadowfang Keep
	["Deathsworn Captain"] = "Deathsworn Captain";
	["Rethilgore <The Cell Keeper>"] = "Rethilgore <The Cell Keeper>";
	["Sorcerer Ashcrombe"] = "Sorcerer Ashcrombe";
	["Deathstalker Adamant"] = "Deathstalker Adamant";
	["Landen Stilwell"] = "Landen Stilwell";
	["Deathstalker Vincent"] = "Deathstalker Vincent";
	["Fel Steed"] = "Fel Steed";
	["Jordan's Hammer"] = "Jordan's Hammer";
	["Crate of Ingots"] = "Crate of Ingots";
	["Razorclaw the Butcher"] = "Razorclaw the Butcher";
	["Baron Silverlaine"] = "Baron Silverlaine";
	["Commander Springvale"] = "Commander Springvale";
	["Odo the Blindwatcher"] = "Odo the Blindwatcher";
	["Fenrus the Devourer"] = "Fenrus the Devourer";
	["Arugal's Voidwalker"] = "Arugal's Voidwalker";
	["The Book of Ur"] = "The Book of Ur";
	["Wolf Master Nandos"] = "Wolf Master Nandos";
	["Archmage Arugal"] = "Archmage Arugal";
	["Sever"] = "Sever";

	--Stratholme
	["The Scarlet Key"] = "The Scarlet Key";
	["Key to the City"] = "Key to the City";
	["Various Postbox Keys"] = "Various Postbox Keys";
	["Living Side"] = "Living Side";
	["Undead Side"] = "Undead Side";
	["Skul"] = "Skul";
	["Stratholme Courier"] = "Stratholme Courier";
	["Fras Siabi"] = "Fras Siabi";
	["Atiesh <Hand of Sargeras>"] = "Atiesh <Hand of Sargeras>";
	["Balzaphon"] = "Balzaphon";
	["Hearthsinger Forresten"] = "Hearthsinger Forresten";
	["The Unforgiven"] = "The Unforgiven";
	["Elder Farwhisper"] = "Elder Farwhisper";
	["Timmy the Cruel"] = "Timmy the Cruel";
	["Malor the Zealous"] = "Malor the Zealous";
	["Malor's Strongbox"] = "Malor's Strongbox";
	["Crimson Hammersmith"] = "Crimson Hammersmith";
	["Cannon Master Willey"] = "Cannon Master Willey";
	["Archivist Galford"] = "Archivist Galford";
	["Grand Crusader Dathrohan"] = "Grand Crusader Dathrohan";
	["Balnazzar"] = "Balnazzar";
	["Sothos"] = "Sothos";
	["Jarien"] = "Jarien";
	["Magistrate Barthilas"] = "Magistrate Barthilas";
	["Aurius"] = "Aurius";
	["Stonespine"] = "Stonespine";
	["Baroness Anastari"] = "Baroness Anastari";
	["Black Guard Swordsmith"] = "Black Guard Swordsmith";
	["Nerub'enkan"] = "Nerub'enkan";
	["Maleki the Pallid"] = "Maleki the Pallid";
	["Ramstein the Gorger"] = "Ramstein the Gorger";
	["Baron Rivendare"] = "Baron Rivendare";
	["Ysida Harmon"] = "Ysida Harmon";
	["Crusaders' Square Postbox"] = "Crusaders' Square Postbox";
	["Market Row Postbox"] = "Market Row Postbox";
	["Festival Lane Postbox"] = "Festival Lane Postbox";
	["Elders' Square Postbox"] = "Elders' Square Postbox";
	["King's Square Postbox"] = "King's Square Postbox";
	["Fras Siabi's Postbox"] = "Fras Siabi's Postbox";
	["Third Postbox Opened"] = "Third Postbox Opened";
	["Postmaster Malown"] = "Postmaster Malown";

	--The Deadmines
	["Rhahk'Zor <The Foreman>"] = "Rhahk'Zor <The Foreman>";
	["Miner Johnson"] = "Miner Johnson";
	["Sneed <Lumbermaster>"] = "Sneed <Lumbermaster>";
	["Sneed's Shredder <Lumbermaster>"] = "Sneed's Shredder <Lumbermaster>";
	["Gilnid <The Smelter>"] = "Gilnid <The Smelter>";
	["Defias Gunpowder"] = "Defias Gunpowder";
	["Captain Greenskin"] = "Captain Greenskin";
	["Edwin VanCleef <Defias Kingpin>"] = "Edwin VanCleef <Defias Kingpin>";
	["Mr. Smite <The Ship's First Mate>"] = "Mr. Smite <The Ship's First Mate>";
	["Cookie <The Ship's Cook>"] = "Cookie <The Ship's Cook>";
	
	--The Stockade
	["Targorr the Dread"] = "Targorr the Dread";
	["Kam Deepfury"] = "Kam Deepfury";
	["Hamhock"] = "Hamhock";
	["Bazil Thredd"] = "Bazil Thredd";
	["Dextren Ward"] = "Dextren Ward";
	["Bruegal Ironknuckle"] = "Bruegal Ironknuckle";

	--The Sunken Temple
	["The Temple of Atal'Hakkar"] = "The Temple of Atal'Hakkar";
	["Yeh'kinya's Scroll"] = "Yeh'kinya's Scroll";
	["Balcony Minibosses"] = "Balcony Minibosses";
	["Gasher"] = "Gasher";
	["Loro"] = "Loro";
	["Hukku"] = "Hukku";
	["Zolo"] = "Zolo";
	["Mijan"] = "Mijan";
	["Zul'Lor"] = "Zul'Lor";
	["Altar of Hakkar"] = "Altar of Hakkar";
	["Atal'alarion <Guardian of the Idol>"] = "Atal'alarion <Guardian of the Idol>";
	["Dreamscythe"] = "Dreamscythe";
	["Weaver"] = "Weaver";
	["Avatar of Hakkar"] = "Avatar of Hakkar";
	["Jammal'an the Prophet"] = "Jammal'an the Prophet";
	["Ogom the Wretched"] = "Ogom the Wretched";
	["Morphaz"] = "Morphaz";
	["Hazzas"] = "Hazzas";
	["Shade of Eranikus"] = "Shade of Eranikus";
	["Essence Font"] = "Essence Font";
	["Spawn of Hakkar"] = "Spawn of Hakkar";
	["Elder Starsong"] = "Elder Starsong";
	["Statue Activation Order"] = "Statue Activation Order";
	["Malfurion Stormrage"] = "Malfurion Stormrage";
	
	--Uldaman
	["Staff of Prehistoria"] = "Staff of Prehistoria";
	["Baelog"] = "Baelog";
	["Eric \"The Swift\""] = "Eric \"The Swift\"";
	["Olaf"] = "Olaf";
	["Baelog's Chest"] = "Baelog's Chest";
	["Conspicuous Urn"] = "Conspicuous Urn";
	["Remains of a Paladin"] = "Remains of a Paladin";
	["Revelosh"] = "Revelosh";
	["Ironaya"] = "Ironaya";
	["Obsidian Sentinel"] = "Obsidian Sentinel";
	["Annora <Enchanting Trainer>"] = "Annora <Enchanting Trainer>";
	["Ancient Stone Keeper"] = "Ancient Stone Keeper";
	["Galgann Firehammer"] = "Galgann Firehammer";
	["Tablet of Will"] = "Tablet of Will";
	["Shadowforge Cache"] = "Shadowforge Cache";
	["Grimlok <Stonevault Chieftain>"] = "Grimlok <Stonevault Chieftain>";
	["Archaedas <Ancient Stone Watcher>"] = "Archaedas <Ancient Stone Watcher>";
	["The Discs of Norgannon"] = "The Discs of Norgannon";
	["Ancient Treasure"] = "Ancient Treasure";
	
	--Zul'Gurub
	["Zandalar Tribe"] = "Zandalar Tribe";
	["Mudskunk Lure"] = "Mudskunk Lure";
	["Gurubashi Mojo Madness"] = "Gurubashi Mojo Madness";
	["High Priestess Jeklik"] = "High Priestess Jeklik";
	["High Priest Venoxis"] = "High Priest Venoxis";
	["Zanza the Restless"] = "Zanza the Restless";
	["High Priestess Mar'li"] = "High Priestess Mar'li";
	["Bloodlord Mandokir"] = "Bloodlord Mandokir";
	["Ohgan"] = "Ohgan";
	["Edge of Madness"] = "Edge of Madness";
	["Gri'lek"] = "Gri'lek";
	["Hazza'rah"] = "Hazza'rah";
	["Renataki"] = "Renataki";
	["Wushoolay"] = "Wushoolay";
	["Gahz'ranka"] = "Gahz'ranka";
	["High Priest Thekal"] = "High Priest Thekal";
	["Zealot Zath"] = "Zealot Zath";
	["Zealot Lor'Khan"] = "Zealot Lor'Khan";
	["High Priestess Arlokk"] = "High Priestess Arlokk";
	["Jin'do the Hexxer"] = "Jin'do the Hexxer";
	["Hakkar"] = "Hakkar";
	["Muddy Churning Waters"] = "Muddy Churning Waters";
	["Jinxed Hoodoo Pile"] = "Jinxed Hoodoo Pile";
	["ZG Enchants"] = "ZG Enchants";
	
	--Naxxramas
	["Archmage Tarsis Kir-Moldir"] = "Archmage Tarsis Kir-Moldir";
	["Mr. Bigglesworth"] = "Mr. Bigglesworth";
	["Abomination Wing"] = "Abomination Wing";
	["Patchwerk"] = "Patchwerk";
	["Grobbulus"] = "Grobbulus";
	["Gluth"] = "Gluth";
	["Thaddius"] = "Thaddius";
	["Stalagg"] = "Stalagg";
	["Feugen"] = "Feugen";
	["Spider Wing"] = "Spider Wing";
	["Anub'Rekhan"] = "Anub'Rekhan";
	["Grand Widow Faerlina"] = "Grand Widow Faerlina";
	["Maexxna"] = "Maexxna";
	["Deathknight Wing"] = "Deathknight Wing";
	["Instructor Razuvious"] = "Instructor Razuvious";
	["Gothik the Harvester"] = "Gothik the Harvester";
	["The Four Horsemen"] = "The Four Horsemen";
	["Thane Korth'azz"] = "Thane Korth'azz";
	["Lady Blaumeux"] = "Lady Blaumeux";
	["Highlord Mograine <The Ashbringer>"] = "Highlord Mograine <The Ashbringer>";
	["Sir Zeliek"] = "Sir Zeliek";
	["Four Horsemen Chest"] = "Four Horsemen Chest";
	["Plague Wing"] = "Plague Wing";
	["Noth the Plaguebringer"] = "Noth the Plaguebringer";
	["Heigan the Unclean"] = "Heigan the Unclean";
	["Loatheb"] = "Loatheb";
	["Frostwyrm Lair"] = "Frostwyrm Lair";
	["Sapphiron"] = "Sapphiron";
	["Kel'Thuzad"] = "Kel'Thuzad";
	

--************************************************
-- Instance Entrance Maps
--************************************************

	--Blackrock Mountain (Entrance)
	["Bodley"] = "Bodley";
	["Overmaster Pyron"] = "Overmaster Pyron";
	["Lothos Riftwaker"] = "Lothos Riftwaker";
	["Franclorn Forgewright"] = "Franclorn Forgewright";
	["Orb of Command"] = "Orb of Command";
	["Scarshield Quartermaster <Scarshield Legion>"] = "Scarshield Quartermaster <Scarshield Legion>";

	--Gnomeregan (Entrance)
	["Transpolyporter"] = "Transpolyporter";
	["Sprok <Away Team>"] = "Sprok <Away Team>";
	["Matrix Punchograph 3005-A"] = "Matrix Punchograph 3005-A";
	["Namdo Bizzfizzle <Engineering Supplies>"] = "Namdo Bizzfizzle <Engineering Supplies>";
	["Techbot"] = "Techbot";

	--Maraudon (Entrance)
	["The Nameless Prophet"] = "The Nameless Prophet";
	["Kolk <The First Kahn>"] = "Kolk <The First Kahn>";
	["Gelk <The Second Kahn>"] = "Gelk <The Second Kahn>";
	["Magra <The Third Kahn>"] = "Magra <The Third Kahn>";
	["Cavindra"] = "Cavindra";
	["Cursed Centaur"] = "Cursed Centaur";

	--The Deadmines (Entrance)
	["Marisa du'Paige"] = "Marisa du'Paige";
	["Brainwashed Noble"] = "Brainwashed Noble";
	["Foreman Thistlenettle"] = "Foreman Thistlenettle";

	--Sunken Temple (Entrance)
	["Jade"] = "Jade";
	["Kazkaz the Unholy"] = "Kazkaz the Unholy";
	["Zekkis"] = "Zekkis";
	["Veyzhak the Cannibal"] = "Veyzhak the Cannibal";

	--Uldaman (Entrance)
	["Hammertoe Grez"] = "Hammertoe Grez";
	["Magregan Deepshadow"] = "Magregan Deepshadow";
	["Tablet of Ryun'Eh"] = "Tablet of Ryun'Eh";
	["Krom Stoutarm's Chest"] = "Krom Stoutarm's Chest";
	["Garrett Family Chest"] = "Garrett Family Chest";
	["Digmaster Shovelphlange"] = "Digmaster Shovelphlange";

	--Wailing Caverns (Entrance)
	["Mad Magglish"] = "Mad Magglish";
	["Trigore the Lasher"] = "Trigore the Lasher";
	["Boahn <Druid of the Fang>"] = "Boahn <Druid of the Fang>";
	["Above the Entrance:"] = "Above the Entrance:";
	["Ebru <Disciple of Naralex>"] = "Ebru <Disciple of Naralex>";
	["Nalpak <Disciple of Naralex>"] = "Nalpak <Disciple of Naralex>";
	["Kalldan Felmoon <Specialist Leatherworking Supplies>"] = "Kalldan Felmoon <Specialist Leatherworking Supplies>";
	["Waldor <Leatherworking Trainer>"] = "Waldor <Leatherworking Trainer>";

	--Dire Maul (Entrance)
	["Dire Pool"] = "Dire Pool";
	["Dire Maul Arena"] = "Dire Maul Arena";
	["Mushgog"] = "Mushgog";
	["Skarr the Unbreakable"] = "Skarr the Unbreakable";
	["The Razza"] = "The Razza";
	["Elder Mistwalker"] = "Elder Mistwalker";
	["Griniblix the Spectator"] = "Griniblix the Spectator";

	--World Bosses
	["Azshara"] = "Azshara";
	["Azuregos"] = "Azuregos";
	["Emerald Dragons"] = "Emerald Dragons";
	["Spirit of Azuregos"] = "Spirit of Azuregos";
	["Lethon"] = "Lethon";
	["Emeriss"] = "Emeriss";
	["Taerar"] = "Taerar";
	["Ysondre"] = "Ysondre";
	["Duskwood"] = "Duskwood";
	["The Hinterlands"] = "The Hinterlands";
	["Feralas"] = "Feralas";
	["Ashenvale"] = "Ashenvale";
	["Emerald Dragons Trash"] = "Emerald Dragons Trash";
	["Lord Kazzak"] = "Lord Kazzak";
	["Nethergarde Keep"] = "Nethergarde Keep";
	
	--Battlegrounds
	
	--Places
	["Alterac Mountains"] = "Alterac Mountains";
	["Alterac Valley"] = "Alterac Valley"; ["AV"] = "AV";
	["Arathi Basin"] = "Arathi Basin"; ["AB"] = "AB";
	["Arathi Highlands"] = "Arathi Highlands";
	["Ashenvale"] = "Ashenvale";
	["Eastern Kingdoms"] = "Eastern Kingdoms";
	["Eye of the Storm"] = "Eye of the Storm"; ["EotS"] = "EotS";
	["Hillsbrad Foothills"] = "Hillsbrad Foothills";
	["Kalimdor"] = "Kalimdor";
	["Netherstorm"] = "Netherstorm";
	["Outland"] = "Outland";
	["The Barrens"] = "The Barrens";
	["Warsong Gulch"] = "Warsong Gulch"; ["WSG"] = "WSG";
	["Friendly Reputation Rewards"] = "Friendly Reputation Rewards";
	["Honored Reputation Rewards"] = "Honored Reputation Rewards";
	["Revered Reputation Rewards"] = "Revered Reputation Rewards";
	["Exalted Reputation Rewards"] = "Exalted Reputation Rewards";
	
	--Alterac Valley (North)
	["Stormpike Guard"] = "Stormpike Guard";
	["Dun Baldar"] = "Dun Baldar";
	["Vanndar Stormpike <Stormpike General>"] = "Vanndar Stormpike <Stormpike General>";
	["Dun Baldar North Marshal"] = "Dun Baldar North Marshal";
	["Dun Baldar South Marshal"] = "Dun Baldar South Marshal";
	["Icewing Marshal"] = "Icewing Marshal";
	["Iceblood Marshal"] = "Iceblood Marshal";
	["Stonehearth Marshal"] = "Stonehearth Marshal";
	["East Frostwolf Marshal"] = "East Frostwolf Marshal";
	["West Frostwolf Marshal"] = "West Frostwolf Marshal";
	["Tower Point Marshal"] = "Tower Point Marshal";
	["Prospector Stonehewer"] = "Prospector Stonehewer";
	["Irondeep Mine"] = "Irondeep Mine";
	["Morloch"] = "Morloch";
	["Umi Thorson"] = "Umi Thorson";
	["Keetar"] = "Keetar";
	["Arch Druid Renferal"] = "Arch Druid Renferal";
	["Dun Baldar North Bunker"] = "Dun Baldar North Bunker";
	["Wing Commander Mulverick"] = "Wing Commander Mulverick";--omitted from AVS
	["Murgot Deepforge"] = "Murgot Deepforge";
	["Dirk Swindle <Bounty Hunter>"] = "Dirk Swindle <Bounty Hunter>";
	["Athramanis <Bounty Hunter>"] = "Athramanis <Bounty Hunter>";
	["Lana Thunderbrew <Blacksmithing Supplies>"] = "Lana Thunderbrew <Blacksmithing Supplies>";
	["Stormpike Aid Station"] = "Stormpike Aid Station";
	["Stormpike Stable Master <Stable Master>"] = "Stormpike Stable Master <Stable Master>";
	["Stormpike Ram Rider Commander"] = "Stormpike Ram Rider Commander";
	["Svalbrad Farmountain <Trade Goods>"] = "Svalbrad Farmountain <Trade Goods>";
	["Kurdrum Barleybeard <Reagents & Poison Supplies>"] = "Kurdrum Barleybeard <Reagents & Poison Supplies>";
	["Stormpike Quartermaster"] = "Stormpike Quartermaster";
	["Jonivera Farmountain <General Goods>"] = "Jonivera Farmountain <General Goods>";
	["Brogus Thunderbrew <Food & Drink>"] = "Brogus Thunderbrew <Food & Drink>";
	["Wing Commander Ichman"] = "Wing Commander Ichman";--omitted from AVS
	["Wing Commander Slidore"] = "Wing Commander Slidore";--omitted from AVS
	["Wing Commander Vipore"] = "Wing Commander Vipore";--omitted from AVS
	["Dun Baldar South Bunker"] = "Dun Baldar South Bunker";
	["Corporal Noreg Stormpike"] = "Corporal Noreg Stormpike";
	["Gaelden Hammersmith <Stormpike Supply Officer>"] = "Gaelden Hammersmith <Stormpike Supply Officer>";
	["Stormpike Graveyard"] = "Stormpike Graveyard";
	["Icewing Cavern"] = "Icewing Cavern";
	["Stormpike Banner"] = "Stormpike Banner";
	["Stormpike Lumber Yard"] = "Stormpike Lumber Yard";
	["Wing Commander Jeztor"] = "Wing Commander Jeztor";--omitted from AVS
	["Icewing Bunker"] = "Icewing Bunker";
	["Wing Commander Guse"] = "Wing Commander Guse";--omitted from AVS
	["Stonehearth Graveyard"] = "Stonehearth Graveyard";
	["Stonehearth Outpost"] = "Stonehearth Outpost";
	["Captain Balinda Stonehearth <Stormpike Captain>"] = "Captain Balinda Stonehearth <Stormpike Captain>";
	["Snowfall Graveyard"] = "Snowfall Graveyard";
	["Korrak the Bloodrager"] = "Korrak the Bloodrager";
	["Ichman's Beacon"] = "Ichman's Beacon";
	["Mulverick's Beacon"] = "Mulverick's Beacon";
	["Stonehearth Bunker"] = "Stonehearth Bunker";
	["Ivus the Forest Lord"] = "Ivus the Forest Lord";
	["Western Crater"] = "Western Crater";
	["Vipore's Beacon"] = "Vipore's Beacon";
	["Jeztor's Beacon"] = "Jeztor's Beacon";
	["Eastern Crater"] = "Eastern Crater";
	["Slidore's Beacon"] = "Slidore's Beacon";
	["Guse's Beacon"] = "Guse's Beacon";
	["Graveyards, Capturable Areas"] = "Graveyards, Capturable Areas";--omitted from AVS
	["Bunkers, Towers, Destroyable Areas"] = "Bunkers, Towers, Destroyable Areas";--omitted from AVS
	["Assault NPCs, Quest Areas"] = "Assault NPCs, Quest Areas";--omitted from AVS
	["Steamsaw"] = "Steamsaw";--omitted from AVS

	--Alterac Valley (South)
	["Frostwolf Clan"] = "Frostwolf Clan";
	["Frostwolf Keep"] = "Frostwolf Keep";
	["Drek'Thar <Frostwolf General>"] = "Drek'Thar <Frostwolf General>";
	["Duros"] = "Duros";
	["Drakan"] = "Drakan";
	["West Frostwolf Warmaster"] = "West Frostwolf Warmaster";
	["East Frostwolf Warmaster"] = "East Frostwolf Warmaster";
	["Tower Point Warmaster"] = "Tower Point Warmaster";
	["Iceblood Warmaster"] = "Iceblood Warmaster";
	["Icewing Warmaster"] = "Icewing Warmaster";
	["Stonehearth Warmaster"] = "Stonehearth Warmaster";
	["Dun Baldar North Warmaster"] = "Dun Baldar North Warmaster";
	["Dun Baldar South Warmaster"] = "Dun Baldar South Warmaster";
	["Lokholar the Ice Lord"] = "Lokholar the Ice Lord";
	["Iceblood Garrison"] = "Iceblood Garrison";
	["Captain Galvangar <Frostwolf Captain>"] = "Captain Galvangar <Frostwolf Captain>";
	["Iceblood Tower"] = "Iceblood Tower";
	["Iceblood Graveyard"] = "Iceblood Graveyard";
	["Tower Point"] = "Tower Point";
	["Coldtooth Mine"] = "Coldtooth Mine";
	["Taskmaster Snivvle"] = "Taskmaster Snivvle";
	["Masha Swiftcut"] = "Masha Swiftcut";
	["Aggi Rumblestomp"] = "Aggi Rumblestomp";
	["Frostwolf Graveyard"] = "Frostwolf Graveyard";
	["Jotek"] = "Jotek";
	["Smith Regzar"] = "Smith Regzar";
	["Primalist Thurloga"] = "Primalist Thurloga";
	["Sergeant Yazra Bloodsnarl"] = "Sergeant Yazra Bloodsnarl";
	["Frostwolf Stable Master <Stable Master>"] = "Frostwolf Stable Master <Stable Master>";
	["Frostwolf Wolf Rider Commander"] = "Frostwolf Wolf Rider Commander";
	["Frostwolf Quartermaster"] = "Frostwolf Quartermaster";
	["West Frostwolf Tower"] = "West Frostwolf Tower";
	["East Frostwolf Tower"] = "East Frostwolf Tower";
	["Frostwolf Relief Hut"] = "Frostwolf Relief Hut";
	["Wildpaw Cavern"] = "Wildpaw Cavern";
	["Frostwolf Banner"] = "Frostwolf Banner";

	--Arathi Basin
	["The Defilers"] = "The Defilers";
	["The League of Arathor"] = "The League of Arathor";
	["Trollbane Hall"] = "Trollbane Hall";
	["Defiler's Den"] = "Defiler's Den";
	["Stables"] = "Stables";
	["Gold Mine"] = "Gold Mine";
	["Blacksmith"] = "Blacksmith";
	["Lumber Mill"] = "Lumber Mill";
	["Farm"] = "Farm";

	--Warsong Gulch
	["Warsong Outriders"] = "Warsong Outriders";
	["Silverwing Sentinels"] = "Silverwing Sentinels";
	["Silverwing Hold"] = "Silverwing Hold";
	["Warsong Lumber Mill"] = "Warsong Lumber Mill";
	
	--Dungeon Locations	

	--Places
	["Alterac Mountains"] = "Alterac Mountains";
	["Alterac Valley"] = "Alterac Valley";
	["Arathi Basin"] = "Arathi Basin";
	["Arathi Highlands"] = "Arathi Highlands";
	["Ashenvale"] = "Ashenvale";
	["Badlands"] = "Badlands";
	["Blackfathom Deeps"] = "Blackfathom Deeps";
	["Blackrock Depths"] = "Blackrock Depths";
	["Blackrock Mountain"] = "Blackrock Mountain";
	["Blackrock Spire"] = "Blackrock Spire";
	["Blackwing Lair"] = "Blackwing Lair";
	["Deadwind Pass"] = "Deadwind Pass";
	["Desolace"] = "Desolace";
	["Dire Maul"] = "Dire Maul";
	["Dun Morogh"] = "Dun Morogh";
	["Dustwallow Marsh"] = "Dustwallow Marsh";
	["Eastern Kingdoms"] = "Eastern Kingdoms";
	["Eastern Plaguelands"] = "Eastern Plaguelands";
	["Feralas"] = "Feralas";
	["Gnomeregan"] = "Gnomeregan";
	["Hillsbrad Foothills"] = "Hillsbrad Foothills";
	["Kalimdor"] = "Kalimdor";
	["Maraudon"] = "Maraudon";
	["Molten Core"] = "Molten Core";
	["Naxxramas"] = "Naxxramas";
	["Onyxia's Lair"] = "Onyxia's Lair";
	["Orgrimmar"] = "Orgrimmar";
	["Ragefire Chasm"] = "Ragefire Chasm";
	["Razorfen Downs"] = "Razorfen Downs";
	["Razorfen Kraul"] = "Razorfen Kraul";
	["Ruins of Ahn'Qiraj"] = "Ruins of Ahn'Qiraj";
	["Scarlet Monastery"] = "Scarlet Monastery";
	["Scholomance"] = "Scholomance";
	["Shadowfang Keep"] = "Shadowfang Keep";
	["Silithus"] = "Silithus";
	["Silverpine Forest"] = "Silverpine Forest";
	["Stormwind City"] = "Stormwind City";
	["Stranglethorn Vale"] = "Stranglethorn Vale";
	["Stratholme"] = "Stratholme";
	["Sunken Temple"] = "Sunken Temple";
	["Swamp of Sorrows"] = "Swamp of Sorrows";
	["Tanaris"] = "Tanaris";
	["Temple of Ahn'Qiraj"] = "Temple of Ahn'Qiraj";
	["The Barrens"] = "The Barrens";
	["The Deadmines"] = "The Deadmines";
	["The Stockade"] = "The Stockade";
	["Tirisfal Glades"] = "Tirisfal Glades";
	["Uldaman"] = "Uldaman";
	["Wailing Caverns"] = "Wailing Caverns";
	["Warsong Gulch"] = "Warsong Gulch";
	["Western Plaguelands"] = "Western Plaguelands";
	["Westfall"] = "Westfall";
	["Zul'Farrak"] = "Zul'Farrak";
	["Zul'Gurub"] = "Zul'Gurub";
	
	--Flight points
	["Aerie Peak"] = "Aerie Peak";
	["Alliance"] = "Alliance";
	["Arathi Highlands"] = "Arathi Highlands";
	["Ashenvale"] = "Ashenvale";
	["Astranaar"] = "Astranaar";
	["Auberdine"] = "Auberdine";
	["Azshara"] = "Azshara";
	["Badlands"] = "Badlands";
	["Blasted Lands"] = "Blasted Lands";
	["Blood Watch"] = "Blood Watch";
	["Bloodvenom Post"] = "Bloodvenom Post";
	["Booty Bay"] = "Booty Bay";
	["Brackenwall Village"] = "Brackenwall Village";
	["Burning Steppes"] = "Burning Steppes";
	["Camp Mojache"] = "Camp Mojache";
	["Camp Taurajo"] = "Camp Taurajo";
	["Cenarion Hold"] = "Cenarion Hold";
	["Chillwind Point"] = "Chillwind Point";
	["Crossroads"] = "Crossroads";
	["Darkshire"] = "Darkshire";
	["Darkshore"] = "Darkshore";
	["Desolace"] = "Desolace";
	["Druid-only"] = "Druid-only";
	["Dun Morogh"] = "Dun Morogh";
	["Durotar"] = "Durotar";
	["Duskwood"] = "Duskwood";
	["Dustwallow Marsh"] = "Dustwallow Marsh";
	["Eastern Kingdoms"] = "Eastern Kingdoms";
	["Eastern Plaguelands"] = "Eastern Plaguelands";
	["Elwynn Forest"] = "Elwynn Forest";
	["Emerald Sanctuary"] = "Emerald Sanctuary";
	["Everlook"] = "Everlook";
	["Eversong Woods"] = "Eversong Woods";
	["Feathermoon Stronghold"] = "Feathermoon Stronghold";
	["Felwood"] = "Felwood";
	["Feralas"] = "Feralas";
	["Flame Crest"] = "Flame Crest";
	["Flight Path Maps"] = "Flight Path Maps";
	["Freewind Post"] = "Freewind Post";
	["Gadgetzan"] = "Gadgetzan";
	["Grom'Gol Base Camp"] = "Grom'Gol Base Camp";
	["Hammerfall"] = "Hammerfall";
	["Hillsbrad Foothills"] = "Hillsbrad Foothills";
	["Horde"] = "Horde";
	["Ironforge"] = "Ironforge";
	["Kalimdor"] = "Kalimdor";
	["Kargath"] = "Kargath";
	["Lakeshire"] = "Lakeshire";
	["Light's Hope Chapel"] = "Light's Hope Chapel";
	["Loch Modan"] = "Loch Modan";
	["Marshal's Refuge"] = "Marshall's Refuge";
	["Menethil Harbor"] = "Menethil Harbor";
	["Moonglade"] = "Moonglade";
	["Morgan's Vigil"] = "Morgan's Vigil";
	["Mulgore"] = "Mulgore";
	["Nethergarde Keep"] = "Nethergarde Keep";
	["Nighthaven"] = "Nighthaven";
	["Nijel's Point"] = "Nijel's Point";
	["Orgrimmar"] = "Orgrimmar";
	["Ratchet"] = "Ratchet";
	["Redridge Mountains"] = "Redridge Mountains";
	["Refuge Pointe"] = "Refuge Pointe";
	["Revantusk Village"] = "Revantusk Village";
	["Rut'Theran Village"] = "Rut'Theran Village";
	["Searing Gorge"] = "Searing Gorge";
	["Sentinel Hill"] = "Sentinel Hill";
	["Shadowprey Village"] = "Shadowprey Village";
	["Silithus"] = "Silithus";
	["Silverpine Forest"] = "Silverpine Forest";
	["South of the path along Lake Elune'ara"] = "South of the path along Lake Elune'ara";
	["Southshore"] = "Southshore";
	["Splintertree Post"] = "Splintertree Post";
	["Stonard"] = "Stonard";
	["Stonetalon Mountains"] = "Stonetalon Mountains";
	["Stonetalon Peak"] = "Stonetalon Peak";
	["Stormwind City"] = "Stormwind City";
	["Stranglethorn Vale"] = "Stranglethorn Vale";
	["Sun Rock Retreat"] = "Sun Rock Retreat";
	["Swamp of Sorrows"] = "Swamp of Sorrows";
	["Talonbranch Glade"] = "Talonbranch Glade";
	["Talrendis Point"] = "Talrendis Point";
	["Tanaris"] = "Tanaris";
	["Tarren Mill"] = "Tarren Mill";
	["Teldrassil"] = "Teldrassil";
	["Thalanaar"] = "Thalanaar";
	["The Barrens"] = "The Barrens";
	["The Hinterlands"] = "The Hinterlands";
	["The Sepulcher"] = "The Sepulcher";
	["Thelsamar"] = "Thelsamar";
	["Theramore Isle"] = "Theramore Isle";
	["Thorium Point"] = "Thorium Point";
	["Thousand Needles"] = "Thousand Needles";
	["Thunder Bluff"] = "Thunder Bluff";
	["Tirisfal Glades"] = "Tirisfal Glades";
	["Un'Goro Crater"] = "Un'Goro Crater";
	["Undercity"] = "Undercity";
	["Valormok"] = "Valormok";
	["West of the path to Timbermaw Hold"] = "West of the path to Timbermaw Hold";
	["Western Plaguelands"] = "Western Plaguelands";
	["Westfall"] = "Westfall";
	["Wetlands"] = "Wetlands";
	["Winterspring"] = "Winterspring";
	["Zoram'gar Outpost"] = "Zoram'gar Outpost";
	["Tauren Leveling Guide"] = "Tauren Leveling Guide";
	["Undead Leveling Guide"] = "Undead Leveling Guide";
	["Troll/Orc Leveling Guide"] = "Troll/Orc Leveling Guide"; 
	["Horde Leveling Guide"] = "Horde Leveling Guide";
	["Human Leveling Guide"] = "Human Leveling Guide";
	["Night Elf Leveling Guide"] = "Night Elf Leveling Guide";
	["Gnome/Dwarf Leveling Guide"] = "Gnome/Dwarf Leveling Guide"; 
	["Alliance Leveling Guide"] = "Alliance Leveling Guide";
};

end
