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
local AL = AceLibrary("AceLocale-2.2"):new("Atlas");

AtlasSortIgnore = {"the (.+)"};

BINDING_HEADER_ATLAS_TITLE = "Atlas Bindings";
BINDING_NAME_ATLAS_TOGGLE = "Toggle Atlas";
BINDING_NAME_ATLAS_OPTIONS = "Toggle Options";
BINDING_NAME_ATLAS_AUTOSEL = "Auto-Select";

ATLAS_SUBTITLE = "Instance Map Browser";
ATLAS_DESC = "Atlas is an instance map browser.";

ATLAS_STRING_LOCATION = "Location";
ATLAS_STRING_LEVELRANGE = "Level Range";
ATLAS_STRING_PLAYERLIMIT = "Player Limit";
ATLAS_STRING_SELECT_CAT = "Select Category";
ATLAS_STRING_SELECT_MAP = "Select Map";
ATLAS_STRING_SEARCH = "Search";
ATLAS_STRING_CLEAR = "Clear";
ATLAS_STRING_MINLEVEL = "Minimum Level";

ATLAS_OPTIONS_BUTTON = "Options";
ATLAS_OPTIONS_SHOWBUT = "Show Button on Minimap";
ATLAS_OPTIONS_AUTOSEL = "Auto-Select Instance Map";
ATLAS_OPTIONS_BUTPOS = "Button Position";
ATLAS_OPTIONS_TRANS = "Transparency";
ATLAS_OPTIONS_DONE = "Done";
ATLAS_OPTIONS_RCLICK = "Right-Click for World Map";
ATLAS_OPTIONS_SHOWMAPNAME = "Show map name";
ATLAS_OPTIONS_RESETPOS = "Reset Position";
ATLAS_OPTIONS_ACRONYMS = "Display Acronyms";
ATLAS_OPTIONS_SCALE = "Scale";
ATLAS_OPTIONS_BUTRAD = "Button Radius";
ATLAS_OPTIONS_CLAMPED = "Clamp window to screen";
ATLAS_OPTIONS_HELP = "Left-click and drag to move this window.";

ATLAS_BUTTON_TOOLTIP_TITLE = "Atlas";
ATLAS_BUTTON_TOOLTIP_HINT = "Left-click to open Atlas.\nMiddle-click for Atlas options.\nRight-click and drag to move this button.";
ATLAS_TITAN_HINT = "Left-click to open Atlas.\nMiddle-click for Atlas options.\nRight-click for the display menu.";

ATLAS_OPTIONS_CATDD = "Sort Instance Maps by:";
ATLAS_DDL_CONTINENT = "Continent";
ATLAS_DDL_CONTINENT_EASTERN = "Eastern Kingdoms Instances";
ATLAS_DDL_CONTINENT_KALIMDOR = "Kalimdor Instances";
ATLAS_DDL_LEVEL = "Level";
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
ATLAS_DDL_TYPE_ENTRANCE = "Entrances";
ATLAS_DDL_BGS = "Battlegrounds";
ATLAS_DDL_DUNGEON_LOCATIONS = "Dungeon Locations";
ATLAS_DDL_FLIGHT_PATHS = "Flight Path Maps";
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
};

AL:RegisterTranslations("enUS", function() return {
	
	--************************************************
	-- Zone Names, Acronyms, and Common Strings
	--************************************************
	
	--Common strings
	["Atlas Options"] = true;
	--Colors
	["Blue"] = true;
	["Purple"] = true;
	["Red"] = true;
	["Orange"] = true;
	["White"] = true;
	--Mobs types
	["Boss"] = true;
	["Rare"] = true;
	["Bat"] = true;
	["Snake"] = true;
	["Raptor"] = true;
	["Spider"] = true;
	["Tiger"] = true;
	["Panther"] = true;
	["Pet"] = true;
	["Engineer"] = true;
	--Magic types
	["Fire"] = true;
	["Nature"] = true;
	["Frost"] = true;
	["Shadow"] = true;
	["Arcane"] = true;
	--Events
	["Hallow's End"] = true;
	["Scourge Invasion"] = true;		
	["Lunar Festival"] = true;
	--Other
	["East"] = true;
	["North"] = true;
	["South"] = true;
	["West"] = true;		
	["Battlegrounds"] = true;		
	["Lower"] = true;	
	["Upper"] = true;		
	["Entrance"] = true;
	["Exit"] = true;		
	["Chase Begins"] = true;
	["Chase Ends"] = true;		
	["AKA"] = true;	
	["Attunement Required"] = true;
	["Back"] = true;
	["Back1"] = true;
	["Blacksmithing Plans"] = true;	
	["Brazier of Invocation"] = true;
	["Connection"] = true;
	["Connections"] = true;
	["Damage: "] = true;
	["Тier 0.5 Summon"] = true;
	["Dungeon Locations"] = true;
	["Elevator"] = true;
	["Front"] = true;
	["Front1"] = true;
	["Ghost"] = true;		
	["Heroic"] = true;
	["Instances"] = true;
	["Key"] = true;
	["Meeting Stone"] = true;
	["Moonwell"] = true;
	["Neutral"] = true; -- NPC reaction
	["Optional"] = true;
	["Outside"] = true;
	["Portal"] = true;
	["Random"] = true;
	["Reputation"] = true;
	["Rescued"] = true;
	["Side"] = true;
	["Summon"] = true;
	["Teleport"] = true;
	["through "] = true;
	["Trash Mobs"] = true;
	["Unknown"] = true;
	["Varies"] = true;
	["Various"] = true;
	["Wanders"] = true;
	
	--Instance names and acronyms
	["Armory"] = true;
	["Cathedral"] = true;
	["Graveyard"] = true;
	["Library"] = true;
	["Sunken Temple"] = true;
	
	--Set names
	["Set: "] = true;
	["Tier 0/0.5 Sets"] = true;
	["Zul'Gurub Sets"] = true;
	["Zul'Gurub Ring Sets"] = true;
	["Ruins of Ahn'Qiraj Sets"] = true;
	["Temple of Ahn'Qiraj Sets"] = true;
	["Tier 1 Sets"] = true;
	["Tier 2 Sets"] = true;
	["Tier 3 Sets"] = true;
	
	--************************************************
	-- Kalimdor Instance Data
	--************************************************
	
	--Ragefire Chasm
	["Oggleflint"] = true;
	
	--Wailing Caverns
	["Disciple of Naralex"] = true;
	["Mysterious Wailing Caverns Chest"] = true;
	
	--Blackfathom Deeps
	["Lorgalis Manuscript"] = true;
	["Argent Guard Thaelrid"] = true;
	["Shrine of Gelihast"] = true;
	["Fathom Stone"] = true;
	["Morridune"] = true;
	["Altar of the Deeps"] = true;
	
	--Razorfen Kraul
	["Razorfen Spearhide"] = true;
	["Willix the Importer"] = true;
	["Heralath Fallowbrook"] = true;
	
	--Razorfen Downs
	["Henry Stern"] = true;
	["Belnistrasz"] = true;
	["Sah'rhee"] = true;
	
	--Zul'Farrak
	["Mallet of Zul'Farrak"] = true;
	["Theka the Martyr"] = true;
	["Zul'Farrak Dead Hero"] = true;
	["Nekrum Gutchewer"] = true;
	["Dustwraith"] = true;
	["Sergeant Bly"] = true;
	["Weegli Blastfuse"] = true;
	["Murta Grimgut"] = true;
	["Raven"] = true;
	["Oro Eyegouge"] = true;
	["Sandfury Executioner"] = true;
	["Hydromancer Velratha"] = true;
	["Elder Wildmane"] = true;
	["Zerillis"] = true;
	["Sandarr Dunereaver"] = true;
	
	--Maraudon	
	["Scepter of Celebras"] = true;
	["Veng"] = true;
	["Maraudos"] = true;
	["Elder Splitrock"] = true;
	
	--Dire Maul (East)
	["Old Ironbark"] = true;
	["A Dusty Tome"] = true;
	["Felvine Shard"] = true;
	["Dire Maul Books"] = true;
	
	--Dire Maul (North)
	["Crescent Key"] = true;--omitted from Dire Maul (West)
	["Gordok Courtyard Key"] = true;
	["Gordok Inner Door Key"] = true;
	--"Library" omitted from here and DM West because of SM: "Library" duplicate
	["Stomper Kreeg"] = true;
	["Knot Thimblejack"] = true;
	["Tribute Run"] = true;
	
	--Dire Maul (West)
	["J'eevee's Jar"] = true;
	["Pylons"] = true;
	["Shen'dralar Ancient"] = true;
	["Ancient Equine Spirit"] = true;
	["Ferra"] = true;
	["Falrin Treeshaper"] = true;
	["Lorekeeper Lydros"] = true;
	["Lorekeeper Javon"] = true;
	["Lorekeeper Kildrath"] = true;
	["Lorekeeper Mykos"] = true;
	["Shen'dralar Provisioner"] = true;
	["Skeletal Remains of Kariel Winthalus"] = true;
	["The Prince's Chest"] = true;
	
	--Onyxia's Lair
	["Drakefire Amulet"] = true;
	["Onyxian Warders"] = true;
	["Whelp Eggs"] = true;
	
	--Temple of Ahn'Qiraj
	["Bug Trio"] = true;
	["Andorgos"] = true;
	["Vethsera"] = true;
	["Kandrostrasz"] = true;
	["Arygos"] = true;
	["Caelestrasz"] = true;
	["Merithra of the Dream"] = true;
	["AQ Enchants"] = true;
	["AQ Opening Quest Chain"] = true;
	
	--Ruins of Ahn'Qiraj
	["Four Kaldorei Elites"] = true;
	["Captain Qeez"] = true;
	["Captain Tuubid"] = true;
	["Captain Drenn"] = true;
	["Captain Xurrem"] = true;
	["Major Yeggeth"] = true;
	["Major Pakkon"] = true;
	["Colonel Zerran"] = true;
	["Safe Room"] = true;
	["Class Books"] = true;
	
	--****************************
	-- Eastern Kingdoms Instances
	--****************************
	
	--Blackrock Depths
	["Shadowforge Key"] = true;
	["Prison Cell Key"] = true;
	["Jail Break!"] = true;
	["Banner of Provocation"] = true;
	["Kharan Mighthammer"] = true;
	["Commander Gor'shak"] = true;
	["Marshal Windsor"] = true;
	["Ring of Law"] = true;
	["Theldren"] = true;
	["Lefty"] = true;
	["Malgen Longspear"] = true;
	["Gnashjaw"] = true;
	["Korv"] = true;
	["Rezznik"] = true;
	["Rotfang"] = true;
	["Snokh Blackspine"] = true;
	["Va'jashni"] = true;
	["Volida"] = true;
	["Elder Morndeep"] = true;
	["High Justice Grimstone"] = true;
	["Monument of Franclorn Forgewright"] = true;
	["The Vault"] = true;
	["The Black Anvil"] = true;
	["Shadowforge Lock"] = true;
	["Field Repair Bot 74A"] = true;
	["The Grim Guzzler"] = true;
	["Lokhtos Darkbargainer"] = true;
	["Mistress Nagmara"] = true;
	["Plugger Spazzring"] = true;
	["Private Rocknot"] = true;
	["Summoner's Tomb"] = true;
	["Chest of The Seven"] = true;
	["The Lyceum"] = true;
	["High Priestess of Thaurissan"] = true;
	["The Black Forge"] = true;
	["Core Fragment"] = true;
	["Overmaster Pyron"] = true;
	
	--Blackrock Spire (Lower)
	["Vaelan"] = true;
	["Warosh"] = true;
	["Elder Stonefort"] = true;
	["Roughshod Pike"] = true;
	["Spirestone Butcher"] = true;
	["Spirestone Battle Lord"] = true;
	["Spirestone Lord Magus"] = true;
	["Fifth Mosh'aru Tablet"] = true;
	["Bijou"] = true;
	["Sixth Mosh'aru Tablet"] = true;
	["Bijou's Belongings"] = true;
	["Human Remains"] = true;
	["Unfired Plate Gauntlets"] = true;
	["Urok's Tribute Pile"] = true;
	["Burning Felguard"] = true;
	
	--Blackrock Spire (Upper)
	["Seal of Ascension"] = true;
	["Father Flame"] = true;
	["Darkstone Tablet"] = true;
	["Doomrigger's Coffer"] = true;
	["Awbee"] = true;
	["Finkle Einhorn"] = true;
	["Drakkisath's Brand"] = true;
	
	--Blackwing Lair
	["Draconic for Dummies"] = true;
	["Master Elemental Shaper Krixix"] = true;
	["Alchemy Lab"] = true;
	
	--Gnomeregan
	["Workshop Key"] = true;
	["Blastmaster Emi Shortfuse"] = true;
	["Clean Room"] = true;
	["Tink Sprocketwhistle"] = true;
	["The Sparklematic 5200"] = true;
	["Mail Box"] = true;
	["Kernobee"] = true;
	["Alarm-a-bomb 2600"] = true;
	["Matrix Punchograph 3005-B"] = true;
	["Matrix Punchograph 3005-C"] = true;
	["Matrix Punchograph 3005-D"] = true;
	
	--Molten Core
	["Aqual Quintessence"] = true;
	["Eternal Quintessence"] = true;
	["Random Boss Loot"] = true;
	
	--Naxxramas
	["Archmage Tarsis Kir-Moldir"] = true;
	["Mr. Bigglesworth"] = true;
	["Abomination Wing"] = true;
	["Spider Wing"] = true;
	["Deathknight Wing"] = true;
	["Four Horsemen Chest"] = true;
	["Plague Wing"] = true;
	["Frostwyrm Lair"] = true;
	
	--SM: Library
	["Doan's Strongbox"] = true;
	
	--SM: Armory
	["The Scarlet Key"] = true;--omitted from SM: Cathedral
	
	--SM: Graveyard
	["Vorrel Sengutz"] = true;
	
	--Scholomance
	["Skeleton Key"] = true;
	["Viewing Room Key"] = true;
	["Viewing Room"] = true;
	["Blood of Innocents"] = true;
	["Divination Scryer"] = true;
	["Blood Steward of Kirtonos"] = true;
	["The Deed to Southshore"] = true;
	["Journal of Jandice Barov"] = true;
	["The Deed to Tarren Mill"] = true;
	["The Deed to Brill"] = true;
	["The Deed to Caer Darrow"] = true;
	["Torch Lever"] = true;
	["Old Treasure Chest"] = true;
	
	--Shadowfang Keep
	["Sorcerer Ashcrombe"] = true;
	["Deathstalker Adamant"] = true;
	["Landen Stilwell"] = true;
	["Deathstalker Vincent"] = true;
	["Fel Steed"] = true;
	["Jordan's Hammer"] = true;
	["Crate of Ingots"] = true;
	["Arugal's Voidwalker"] = true;
	["The Book of Ur"] = true;
	
	--Stratholme
	["Key to the City"] = true;
	["Various Postbox Keys"] = true;
	["Living Side"] = true;
	["Undead Side"] = true;
	["Stratholme Courier"] = true;
	["Fras Siabi"] = true;
	["Atiesh"] = true;
	["Elder Farwhisper"] = true;
	["Malor's Strongbox"] = true;
	["Crimson Hammersmith"] = true;
	["Grand Crusader Dathrohan"] = true;
	["Aurius"] = true;
	["Black Guard Swordsmith"] = true;
	["Ysida Harmon"] = true;
	["Crusaders' Square Postbox"] = true;
	["Market Row Postbox"] = true;
	["Festival Lane Postbox"] = true;
	["Elders' Square Postbox"] = true;
	["King's Square Postbox"] = true;
	["Fras Siabi's Postbox"] = true;
	["Third Postbox Opened"] = true;
	
	--The Deadmines
	["Sneed's Shredder"] = true;
	["Defias Gunpowder"] = true;
	
	--The Sunken Temple
	["Yeh'kinya's Scroll"] = true;
	["Balcony Minibosses"] = true;
	["Altar of Hakkar"] = true;
	["Essence Font"] = true;
	["Spawn of Hakkar"] = true;
	["Elder Starsong"] = true;
	["Statue Activation Order"] = true;
	["Malfurion Stormrage"] = true;
	
	--Uldaman
	["Staff of Prehistoria"] = true;
	["Baelog's Chest"] = true;
	["Conspicuous Urn"] = true;
	["Remains of a Paladin"] = true;
	["Annora"] = true;
	["Tablet of Will"] = true;
	["Shadowforge Cache"] = true;
	["The Discs of Norgannon"] = true;
	["Ancient Treasure"] = true;
	
	--Zul'Gurub
	["Mudskunk Lure"] = true;
	["Gurubashi Mojo Madness"] = true;
	["Zanza the Restless"] = true;
	["Ohgan"] = true;
	["Edge of Madness"] = true;
	["Zealot Zath"] = true;
	["Zealot Lor'Khan"] = true;
	["Muddy Churning Waters"] = true;
	["Jinxed Hoodoo Pile"] = true;
	["ZG Enchants"] = true;		
	
	--************************************************
	-- Instance Entrance Maps
	--************************************************
	
	--Blackrock Mountain (Entrance)
	["Bodley"] = true;
	["Overmaster Pyron"] = true;
	["Lothos Riftwaker"] = true;
	["Franclorn Forgewright"] = true;
	["Orb of Command"] = true;
	["Scarshield Quartermaster"] = true;
	
	--Gnomeregan (Entrance)
	["Transpolyporter"] = true;
	["Sprok"] = true;
	["Matrix Punchograph 3005-A"] = true;
	["Namdo Bizzfizzle"] = true;
	["Techbot"] = true;
	
	--Maraudon (Entrance)
	["The Nameless Prophet"] = true;
	["Kolk"] = true;
	["Gelk"] = true;
	["Magra"] = true;
	["Cavindra"] = true;
	["Cursed Centaur"] = true;
	
	--The Deadmines (Entrance)
	["Marisa du'Paige"] = true;
	["Brainwashed Noble"] = true;
	["Foreman Thistlenettle"] = true;
	
	--Sunken Temple (Entrance)
	["Jade"] = true;
	["Kazkaz the Unholy"] = true;
	["Zekkis"] = true;
	["Veyzhak the Cannibal"] = true;
	
	--Uldaman (Entrance)
	["Hammertoe Grez"] = true;
	["Magregan Deepshadow"] = true;
	["Tablet of Ryun'Eh"] = true;
	["Krom Stoutarm's Chest"] = true;
	["Garrett Family Chest"] = true;
	["Digmaster Shovelphlange"] = true;
	
	--Wailing Caverns (Entrance)
	["Mad Magglish"] = true;
	["Trigore the Lasher"] = true;
	["Boahn"] = true;
	["Above the Entrance:"] = true;
	["Ebru"] = true;
	["Nalpak"] = true;
	["Kalldan Felmoon"] = true;
	["Waldor"] = true;
	
	--Dire Maul (Entrance)
	["Dire Pool"] = true;
	["Dire Maul Arena"] = true;
	["Mushgog"] = true;
	["Skarr the Unbreakable"] = true;
	["The Razza"] = true;
	["Elder Mistwalker"] = true;
	["Griniblix the Spectator"] = true;
	
	--World Bosses
	["Emerald Dragons"] = true;
	["Spirit of Azuregos"] = true;
	["Emerald Dragons Trash"] = true;
	["Nethergarde Keep"] = true;
	
	--Battlegrounds
	
	--Places
	["Friendly Reputation Rewards"] = true;
	["Honored Reputation Rewards"] = true;
	["Revered Reputation Rewards"] = true;
	["Exalted Reputation Rewards"] = true;
	
	--Alterac Valley (North)
	["Stormpike Guard"] = true;
	["Dun Baldar"] = true;
	["Vanndar Stormpike"] = true;
	["Dun Baldar North Marshal"] = true;
	["Dun Baldar South Marshal"] = true;
	["Icewing Marshal"] = true;
	["Iceblood Marshal"] = true;
	["Stonehearth Marshal"] = true;
	["East Frostwolf Marshal"] = true;
	["West Frostwolf Marshal"] = true;
	["Tower Point Marshal"] = true;
	["Prospector Stonehewer"] = true;
	["Irondeep Mine"] = true;
	["Morloch"] = true;
	["Umi Thorson"] = true;
	["Keetar"] = true;
	["Arch Druid Renferal"] = true;
	["Dun Baldar North Bunker"] = true;
	["Wing Commander Mulverick"] = true;--omitted from AVS
	["Murgot Deepforge"] = true;
	["Dirk Swindle"] = true;
	["Athramanis"] = true;
	["Lana Thunderbrew"] = true;
	["Stormpike Aid Station"] = true;
	["Stormpike Stable Master"] = true;
	["Stormpike Ram Rider Commander"] = true;
	["Svalbrad Farmountain"] = true;
	["Kurdrum Barleybeard"] = true;
	["Stormpike Quartermaster"] = true;
	["Jonivera Farmountain"] = true;
	["Brogus Thunderbrew"] = true;
	["Wing Commander Ichman"] = true;--omitted from AVS
	["Wing Commander Slidore"] = true;--omitted from AVS
	["Wing Commander Vipore"] = true;--omitted from AVS
	["Dun Baldar South Bunker"] = true;
	["Corporal Noreg Stormpike"] = true;
	["Gaelden Hammersmith"] = true;
	["Stormpike Graveyard"] = true;
	["Icewing Cavern"] = true;
	["Stormpike Banner"] = true;
	["Stormpike Lumber Yard"] = true;
	["Wing Commander Jeztor"] = true;--omitted from AVS
	["Icewing Bunker"] = true;
	["Wing Commander Guse"] = true;--omitted from AVS
	["Stonehearth Graveyard"] = true;
	["Stonehearth Outpost"] = true;
	["Captain Balinda Stonehearth"] = true;
	["Snowfall Graveyard"] = true;
	["Korrak the Bloodrager"] = true;
	["Ichman's Beacon"] = true;
	["Mulverick's Beacon"] = true;
	["Stonehearth Bunker"] = true;
	["Ivus the Forest Lord"] = true;
	["Western Crater"] = true;
	["Vipore's Beacon"] = true;
	["Jeztor's Beacon"] = true;
	["Eastern Crater"] = true;
	["Slidore's Beacon"] = true;
	["Guse's Beacon"] = true;
	["Graveyards, Capturable Areas"] = true;--omitted from AVS
	["Bunkers, Towers, Destroyable Areas"] = true;--omitted from AVS
	["Assault NPCs, Quest Areas"] = true;--omitted from AVS
	["Steamsaw"] = true;--omitted from AVS
	
	--Alterac Valley (South)
	["Frostwolf Clan"] = true;
	["Frostwolf Keep"] = true;
	["Drek'Thar"] = true;
	["Duros"] = true;
	["Drakan"] = true;
	["West Frostwolf Warmaster"] = true;
	["East Frostwolf Warmaster"] = true;
	["Tower Point Warmaster"] = true;
	["Iceblood Warmaster"] = true;
	["Icewing Warmaster"] = true;
	["Stonehearth Warmaster"] = true;
	["Dun Baldar North Warmaster"] = true;
	["Dun Baldar South Warmaster"] = true;
	["Lokholar the Ice Lord"] = true;
	["Iceblood Garrison"] = true;
	["Captain Galvangar"] = true;
	["Iceblood Tower"] = true;
	["Iceblood Graveyard"] = true;
	["Tower Point"] = true;
	["Coldtooth Mine"] = true;
	["Taskmaster Snivvle"] = true;
	["Masha Swiftcut"] = true;
	["Aggi Rumblestomp"] = true;
	["Frostwolf Graveyard"] = true;
	["Jotek"] = true;
	["Smith Regzar"] = true;
	["Primalist Thurloga"] = true;
	["Sergeant Yazra Bloodsnarl"] = true;
	["Frostwolf Stable Master"] = true;
	["Frostwolf Wolf Rider Commander"] = true;
	["Frostwolf Quartermaster"] = true;
	["West Frostwolf Tower"] = true;
	["East Frostwolf Tower"] = true;
	["Frostwolf Relief Hut"] = true;
	["Wildpaw Cavern"] = true;
	["Frostwolf Banner"] = true;
	
	--Arathi Basin
	["The Defilers"] = true;
	["The League of Arathor"] = true;
	["Trollbane Hall"] = true;
	["Defiler's Den"] = true;
	["Stables"] = true;
	["Gold Mine"] = true;
	["Blacksmith"] = true;
	["Lumber Mill"] = true;
	["Farm"] = true;
	
	--Warsong Gulch
	["Warsong Outriders"] = true;
	["Silverwing Sentinels"] = true;
	["Silverwing Hold"] = true;
	["Warsong Lumber Mill"] = true;
	
	--Flight points
	["Flight Path Maps"] = true;
	["Druid-only"] = true;
	["Aerie Peak"] = true;
	["Astranaar"] = true;
	["Auberdine"] = true;
	["Bloodvenom Post"] = true;
	["Booty Bay"] = true;
	["Brackenwall Village"] = true;
	["Camp Mojache"] = true;
	["Camp Taurajo"] = true;
	["Cenarion Hold"] = true;
	["Chillwind Point"] = true;
	["Crossroads"] = true;
	["Darkshire"] = true;
	["Everlook"] = true;
	["Feathermoon Stronghold"] = true;
	["Flame Crest"] = true;
	["Freewind Post"] = true;
	["Gadgetzan"] = true;
	["Grom'Gol Base Camp"] = true;
	["Hammerfall"] = true;
	["Kargath"] = true;
	["Lakeshire"] = true;
	["Light's Hope Chapel"] = true;
	["Marshal's Refuge"] = true;
	["Menethil Harbor"] = true;
	["Morgan's Vigil"] = true;
	["Nethergarde Keep"] = true;
	["Nighthaven"] = true;
	["Nijel's Point"] = true;
	["Ratchet"] = true;
	["Refuge Pointe"] = true;
	["Revantusk Village"] = true;
	["Rut'Theran Village"] = true;
	["Sentinel Hill"] = true;
	["Shadowprey Village"] = true;
	["Southshore"] = true;
	["Splintertree Post"] = true;
	["Stonard"] = true;
	["Stonetalon Peak"] = true;
	["Sun Rock Retreat"] = true;
	["Talonbranch Glade"] = true;
	["Talrendis Point"] = true;
	["Tarren Mill"] = true;
	["Thalanaar"] = true;
	["The Sepulcher"] = true;
	["The Shimmering Flats"] = "The Shimmering Flats",
	["Thelsamar"] = true;
	["Theramore Isle"] = true;
	["Thorium Point"] = true;
	["Valormok"] = true;
	["Zoram'gar Outpost"] = true;
	["South of the path along Lake Elune'ara"] = true;
	["West of the path to Timbermaw Hold"] = true;
	["Tauren Leveling Guide"] = true;
	["Undead Leveling Guide"] = true;
	["Troll/Orc Leveling Guide"] = true; 
	["Horde Leveling Guide"] = true;
	["Human Leveling Guide"] = true;
	["Night Elf Leveling Guide"] = true;
	["Gnome/Dwarf Leveling Guide"] = true; 
	["Alliance Leveling Guide"] = true;
} end)