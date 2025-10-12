-- 
-- Default English Localisation for MobInfo
--
-- created by Stephan Wilms 
--

MI_DESCRIPTION = "adds information about mobs to the tooltip and adds health/mana info to the target frame"

MI2_SpellSchools = { Arcane="ar", Fire="fi", Frost="fr", Shadow="sh", Holy="ho", Nature="na" }


MI_TXT_GOLD   = " Gold"
MI_TXT_SILVER = " Silver"
MI_TXT_COPPER = " Copper"

MI_TXT_CONFIG_TITLE		= "MobInfo 2  Options"
MI_TXT_WELCOME          = "Welcome to MobInfo 2"
MI_TXT_OPEN				= "Open"
MI_TXT_CLASS			= "Class "
MI_TXT_HEALTH			= "Health "
MI_TXT_MANA				= "Mana "
MI_TXT_XP				= "XP "
MI_TXT_KILLS			= "Kills "
MI_TXT_DAMAGE			= "Damage + [DPS] "
MI_TXT_TIMES_LOOTED		= "Times Looted "
MI_TXT_EMPTY_LOOTS		= "Empty Loots "
MI_TXT_TO_LEVEL			= "# to level"
MI_TXT_QUALITY			= "Quality "
MI_TXT_CLOTH_DROP		= "Cloth drops "
MI_TXT_COIN_DROP		= "Avg Coin Drop "
MI_TEXT_ITEM_VALUE		= "Avg Item Value "
MI_TXT_MOB_VALUE		= "Total Mob Value "
MI_TXT_COMBINED			= "Combined: "
MI_TXT_MOB_DB_SIZE		= "MobInfo Database Size:  "
MI_TXT_HEALTH_DB_SIZE	= "Health Database Size:  "
MI_TXT_PLAYER_DB_SIZE	= "Player Health Database Size:  "
MI_TXT_ITEM_DB_SIZE		= "Item Database Size:  "
MI_TXT_CUR_TARGET		= "Current Target:  "
MI_TXT_MH_DISABLED		= "MobInfo WARNING: Separate MobHealth AddOn found. The internal MobHealth functionality is disabled until the separate MobHealth AddOn is removed."
MI_TXT_MH_DISABLED2		= (MI_TXT_MH_DISABLED.."\n\n You will NOT loose your data when disabling separate MobHealth.\n\nBenefits: movable health/mana display with percentage support and adjustable font and size")
MI_TXT_CLR_ALL_CONFIRM	= "Do you really want to perform the following delet operation: "
MI_TXT_SEARCH_LEVEL		= "Mob Level:"
MI_TXT_SEARCH_MOBTYPE	= "Mob Type:"
MI_TXT_SEARCH_LOOTS		= "Mob Looted:"
MI_TXT_TRIM_DOWN_CONFIRM = "WARNING: this is an immediate permanent delete. Do you really want to delete all mob data not selected as being recorded."
MI_TXT_CLAM_MEAT		= "Clam Meat"
MI_TXT_SHOWING			= "List Shows: "
MI_TXT_DROPPED_BY		= "Dropped By "
MI_TXT_LOCATION			= "Location: "
MI_TXT_DEL_SEARCH_CONFIRM = "Do you really want to DELETE the %d Mobs in the search result list from the MobInfo database ?"
MI_TXT_WRONG_LOC		= "ERROR : MobInfo database locale is incompatible with your WoW client locale. MobInfo database is unusable until fixed."
MI_TXT_STATUS = "Status: "
MI_TXT_STATUS_ALREADY = "Status: <data already imported"
MI_TXT_STATUS_OLD = "Status: <import database too old for import>"
MI_TXT_STATUS_WRONG = "Status: <import database has wrong language (locale)>"
MI_TXT_STATUS_AVAILABLE = " available for import"
MI_TXT_STATUS_NOIMPORT = "Status: <no import data>"
MI_TXT_MOBS = " Mobs"
MI_TXT_MOBS_1 = " Mobs:"
MI_TXT_HP_VALUES = " HP values"
MI_TXT_MANA = " Mana"
MI_TXT_HP = "HP    "
MI_TXT_LEVEL = " L"
MI_TXT_XP = "XP    "
MI_TXT_KTL = " KtL    "
MI_TXT_DMG = "Dmg "
MI_TXT_DPS = " Dps   "
MI_TXT_KILLS = "Kills  "
MI_TXT_LOOTS = " Loots"
MI_TXT_CL = "CL     "
MI_TXT_EL = " EL      "
MI_TXT_VAL = "Val    "
MI_TXT_COINS = " Coins"
MI_TXT_Q = "Q      "
MI_TXT_DEBUG_INFO = "--------------  D e b u g   I n f o  --------------"
MI_TXT_DEBUG_DBG = "[DBG] "
MI_TXT_DEBUG_BI = "bi(basic info)"
MI_TXT_DEBUG_QI = "qi(quality info)"
MI_TXT_DEBUG_ML = "ml(mob location)"
MI_TXT_DEBUG_IL = "il(item list)"
MI_TXT_DEBUG_RE = "re(resists)"
MI_TXT_DEBUG_CHAR_DATA = "(char data)"
MI_TXT_DEBUG_HP = "hp(health data)"
MI_TXT_IMMUN = "Immun:"
MI_TXT_RESIST = "Resist:"
MI_TXT_NEW_CORPSE = "storing new corpse ID"
MI_TXT_LOOT_SLOT = "Loot: slot"
MI_TXT_Q_NAME = "name"
MI_TXT_Q_ID = "id"
MI_TXT_Q_q = "q"
MI_TXT_REC_NEW_DPS = "recording new dps: idx"
MI_TXT_NEW_DPS = "new dps"
MI_TXT_REC_NEW_MIN_DMG = "recording new MIN dmg "
MI_TXT_REC_NEW_DMG_FOR = " for "
MI_TXT_REC_NEW_DMG_OLD = "old"
MI_TXT_REC_NEW_MAX_DMG = "recording new MAX dmg "
MI_TXT_REC_KILL_MOB = "recording kill: mob"
MI_TXT_REC_KILL_MOB_KILLS = "kills"
MI_TXT_REC_KILL_MOB_XP = "XP"
MI_TXT_REC_LOC = "recording location"
MI_TXT_SLASH_VER = "v"
MI_TXT_SLASH_DAT_TARGET = "data for target "
MI_TXT_SLASH_DAT_DEL = " has been deleted"
MI_TXT_SLASH_DAT_DB_DEL = "database deleted: "
MI_TXT_SLASH_DB_IMPORT = " starting external database import ...."
MI_TXT_SLASH_IMPORTED = " imported "
MI_TXT_SLASH_NEW_MOBS = " new Mobs"
MI_TXT_SLASH_NEW_HP_VAL = " new health values"
MI_TXT_SLASH_NEW_ITEMS = " new loot items"
MI_TXT_SLASH_UPD_DATA = " updated data for "
MI_TXT_SLASH_EXS_MOBS = " existing Mobs"
MI_TXT_SLASH_NOT_UPD = " did NOT update data for "
MI_TXT_SLASH_VERSION = " MobInfo-2 Version "
MI_TXT_SLASH_USAGE = " Usage: enter /mobinfo2 or /mi2 to open interface"
MI_TXT_SLASH_HELP = " for AddOn help go to "
MI_TXT_SLASH_OFF = "-OFF-"
MI_TXT_SLASH_ON = "-ON-"
MI_TXT_SEARCH_DEL = "search result deleted : "
MI_TXT_SEARCH_MOBS = " Mobs"
MI_TXT_SEARCH_LVL = "  L"
MI_TXT_EVENTS_NEW_TARGET = "new target: id"
MI_TXT_EVENTS_LAST = "last"
MI_TXT_EVENTS_NON_MOB = "non mob loot event: action"
MI_TXT_EVENTS_TYPE = "type"
MI_TXT_EVENTS_NO_XP = "no XP kill event: mob"
MI_TXT_EVENTS_KILL_XP = "kill event with XP: mob"
MI_TXT_EVENTS_XP = "xp"
MI_TXT_EVENTS_MI_VER = "MobInfo-2  v"
MI_TXT_EVENTS_MI_LOADED = "  Loaded, enter /mi2 or /mobinfo2 for interface"
MI_TXT_CONVDROPRATE_CONVERTER = "DR Converter: "
MI_TXT_CONVDROPRATE_MOBSFOUND = " Mobs found in DropRate data,"
MI_TXT_CONVDROPRATE_NEWMOBSFOUND = " new Mobs added to database,"
MI_TXT_CONVDROPRATE_EXISTINGMOBS = " existing Mobs expanded,"
MI_TXT_CONVDROPRATE_PARTIALMOBS = " Mobs partially converted,"
MI_TXT_CONVDROPRATE_SKIPPEDITEMS = " unknown items skipped,"
MI_TXT_CONVDROPRATE_ADDEDITEMS = " items added to database,"
MI_TXT_CONVDROPRATE_CONVERSTART = "DropRate conversion started ..."
MI_TXT_CONVDROPRATE_NOTFOUND = "DropRate database not found"

MI2_CHATMSG_MONSTEREMOTE = "attempts to run away"

BINDING_HEADER_MI2HEADER	= "MobInfo 2"
BINDING_NAME_MI2CONFIG	= "Open MobInfo2 Options"

MI2_FRAME_TEXTS = {}
MI2_FRAME_TEXTS["MI2_FrmTooltipOptions"]	= "Mob Tooltip Content"
MI2_FRAME_TEXTS["MI2_FrmHealthOptions"]		= "Mob Health Options"
MI2_FRAME_TEXTS["MI2_FrmDatabaseOptions"]	= "Database Options"
MI2_FRAME_TEXTS["MI2_FrmHealthValueOptions"]= "Health Value"
MI2_FRAME_TEXTS["MI2_FrmManaValueOptions"]	= "Mana Value"
MI2_FRAME_TEXTS["MI2_FrmSearchOptions"]		= "Search Options"
MI2_FRAME_TEXTS["MI2_FrmSearchLevel"]		= "Mob Level"
MI2_FRAME_TEXTS["MI2_FrmItemTooltip"]		= "Item Tooltip Options"
MI2_FRAME_TEXTS["MI2_FrmImportDatabase"]	= "Import External MobInfo Database"

--
-- This section defines all buttons in the options dialog
--   text : the text displayed on the button
--  help : the (short) one line help text for the button
--   info : additional multi line info text for button
--      info is displayed in the help tooltip below the "help" line
--      info is optional and can be omitted if not required
--

MI2_OPTIONS = {};

MI2_OPTIONS["MI2_OptSearchMinLevel"] = 
{ text = "Min"; help = "minimum mob level for search options"; }

MI2_OPTIONS["MI2_OptSearchMaxLevel"] = 
{ text = "Max"; help = "maximum mob level for search options (must be < 66)"; }

MI2_OPTIONS["MI2_OptSearchNormal"] = 
{ text = "Normal"; help = "include Normal type mobs in search result"; }

MI2_OPTIONS["MI2_OptSearchElite"] = 
{ text = "Elite"; help = "include Elite type mobs in search result"; }

MI2_OPTIONS["MI2_OptSearchBoss"] = 
{ text = "Boss"; help = "include Boss type mobs in search result"; }

MI2_OPTIONS["MI2_OptSearchMinLoots"] = 
{ text = "Min"; help = "minimum number of times the Mob must have been looted"; }

MI2_OPTIONS["MI2_OptSearchMobName"] = 
{ text = "Mob Name"; help = "partial or complete mob name to search for";
info = 'Leave empty to not retrict search to specific items\nEntering "*" selects all items.'; }

MI2_OPTIONS["MI2_OptSearchItemName"] = 
{ text = "Item Name"; help = "partial or complete item name to search for";
info = 'leave empty to search for all item names'; }

MI2_OPTIONS["MI2_OptSortByValue"] = 
{ text = "Sort by Profit"; help = "Sort search result list by mob profit";
info = 'Sort the mobs by the profit you can make from killing them.'; }

MI2_OPTIONS["MI2_OptSortByItem"] = 
{ text = "Sort by Item Count"; help = "Sort search result list by item count";
info = 'Sort the Mobs by how many of the specified item(s) they drop.'; }

MI2_OPTIONS["MI2_OptItemTooltip"] = 
{ text = "List Mobs in Item Tooltip"; help = "Display names of Mobs dropping an item in item tooltip";
info = "List the names of all Mobs that drop a hovered item\nin the item tooltip. For each item list the amount\ndropped by the Mob along with percentage." }

MI2_OPTIONS["MI2_OptCompactMode"] = 
{ text = "Compact Mob Tooltip"; help = "Enables a compact mob tooltip layout with 2 values per tooltip line";
info = "Compact tooltip uses short abbreviated texts for the tooltip desriptions.\nTo disable a tolltip line both entries on that line must be disabled." }

MI2_OPTIONS["MI2_OptDisableMobInfo"] = 
{ text = "Disable Tooltip Info"; help = "Disable displaying Mob info in the tooltips";
info = "This will totally disable mob information in both the mob tooltip\nand the item tooltip." }

MI2_OPTIONS["MI2_OptShowClass"] = 
{ text = "Mob Class"; help = "Show Mob class info"; }

MI2_OPTIONS["MI2_OptShowHealth"] = 
{ text = "Health"; help = "Show Mob health info (current/max)"; }

MI2_OPTIONS["MI2_OptShowMana"] = 
{ text = "Mana"; help = "Show Mob mana/rage/energy info (current/max)"; }

MI2_OPTIONS["MI2_OptShowXp"] = 
{ text = "XP"; help = "Show number of experience points this Mob gives";
info = "This is the actual last XP value that the Mob \ngave you. \n(not shown for Mobs that are grey to you)" }

MI2_OPTIONS["MI2_OptShowNo2lev"] = 
{ text = "Number to Level"; help = "Show number of kills needed to level";
info = "This tells you how often you must kill the \nsame Mob you just killed to reach the next level\n(not shown for Mobs that are grey to you)" }

MI2_OPTIONS["MI2_OptShowDamage"] = 
{ text = "Damage / DPS"; help = "Show Mob damage range (Min/Max) and DPS (damage per second)"; 
info = "Damage range and DPS is calculated and storedseparately per char.\nDPS updates slowly but progressively with each fight." }

MI2_OPTIONS["MI2_OptShowCombined"] = 
{ text = "Combined Mobs Info"; help = "Show combined mode message in tooltip";
info = "Show a mesage in the tooltip indicating that combined mode\nis active and listing all mob levels that have been combined\ninto one tooltip." }

MI2_OPTIONS["MI2_OptShowKills"] = 
{ text = "Killed"; help = "Show number of times you killed the Mob";
info = "The kill count is calculated and stored\nseparately per char." }

MI2_OPTIONS["MI2_OptShowLoots"] = 
{ text = "Looted"; help = "Show number of times a Mob has been looted"; }

MI2_OPTIONS["MI2_OptShowCloth"] = 
{ text = "Cloth Pickups"; help = "Show how often the Mob has given cloth loot"; }

MI2_OPTIONS["MI2_OptShowEmpty"] = 
{ text = "Empty Loots"; help = "Show number of empty corpses found (num/percent)";
info = "This counter gets incremented when you open\n a corpse that has no loot." }

MI2_OPTIONS["MI2_OptShowTotal"] = 
{ text = "Total Value"; help = "Show total average Mob value";
info = "This is the sum of average coin drop and \naverage item value." }

MI2_OPTIONS["MI2_OptShowCoin"] = 
{ text = "Coin Drop"; help = "Show average coin drop per Mob";
info = "The total coin value is accumulated and divided\nby the looted counter.\n(does not get shown if coin count is 0)" }

MI2_OPTIONS["MI2_OptShowIV"] = 
{ text = "Item Value"; help = "Show average item value per Mob";
info = "The total item value is accumulated and divided\nby the looted counter.\n(does not get shown if item value is 0)" }

MI2_OPTIONS["MI2_OptShowQuality"] = 
{ text = "Loot Quality Overview"; help = "Show loot quality counters and percentage";
info = "This counts how many items out of the 5 rarity categories\nthe Mob has given as loot. Categories with 0 drops dont\nget shown. The percentage is the persent chance to get\nan item of the specific rarety from the monster as loot." }

MI2_OPTIONS["MI2_OptShowLocation"] = 
{ text = "Mob Location"; help = "Show the location where the Mob can be found";
info = "Recording location data must be ENABLED for this to work."; }

MI2_OPTIONS["MI2_OptShowItems"] = 
{ text = "Basic Loot Item List"; help = "Show the names and amount of all basic loot items";
info = "Basic loot items are all loot items except for cloth and skinning loot.\nRecording loot item data must be ENABLED for this to work"; }

MI2_OPTIONS["MI2_OptShowClothSkin"] = 
{ text = "Cloth and Skinning Loot"; help = "Show names and amount of all cloth and skinning loot items";
info = "Recording loot item data must be ENABLED for this to work"; }

MI2_OPTIONS["MI2_OptShowBlankLines"] = 
{ text = "Show Blank Lines"; help = "Show Blank lines in ToolTip";
info = "Blank lines are meant to improve readability by\ncreating sections in the tooltip" }

MI2_OPTIONS["MI2_OptShowResists"] = 
{ text = "Resists and Immunities"; help = "Show resistances and immunities in ToolTip";
info = "Recorded data about the Mobs elemental spell school\nresistances or immunities is added to the tooltip." }

MI2_OPTIONS["MI2_OptCombinedMode"] = 
{ text = "Combine Same Mobs"; help = "Combine data for Mob with same name";
info = "Combined mode will accumulate the data for Mobs with\nthe same name but different level. When enabled a\nindicator gets displayed in the tooltip" }

MI2_OPTIONS["MI2_OptKeypressMode"] = 
{ text = "Press ALT Key for Mob Info"; help = "Only Show MobInfo in tooltip when ALT key is pressed"; }

MI2_OPTIONS["MI2_OptItemFilter"] = 
{ text = "Loot Item Filter"; help = "Set filtering expression for loot item display in tooltips";
info = "Display only those loot items in the Mob tooltip that include\nthe filter text. E.g. entering 'cloth' will show only items with\n'cloth' in the item name.\nEnter nothing to see all items." }

MI2_OPTIONS["MI2_OptSavePlayerHp"] = 
{ text = "Save player health data permanently"; help = "Permanently store player health data from PvP battles.";
info = "Normally player health data from PvP fights is discarded after\na session. Setting this option allows you to retain that data." }

MI2_OPTIONS["MI2_OptAllOn"] = 
{ text = "All ON"; help = "Switch all MobInfo show options to ON"; }

MI2_OPTIONS["MI2_OptAllOff"] = 
{ text = "All OFF"; help = "Switch all MobInfo show options to OFF"; }

MI2_OPTIONS["MI2_OptMinimal"] = 
{ text = "Minimal"; help = "Show a minimum of useful Mob info"; }

MI2_OPTIONS["MI2_OptDefault"] = 
{ text = "Default"; help = "Show a default set of useful Mob info"; }

MI2_OPTIONS["MI2_OptBtnDone"] = 
{ text = "Done"; help = "Close MobInfo options dialog"; }

MI2_OPTIONS["MI2_OptStableMax"] = 
{ text = "Show Stable Health Max"; help = "Show a stable health maximum in target frame";
info = "When enabled the health maximum displayed in the \nMob target frame is not changed during a fight\nThe updated value is show when the next fight begins."; }

MI2_OPTIONS["MI2_OptTargetHealth"] = 
{ text = "Show Health Value"; help = "Show health value in target frame"; }

MI2_OPTIONS["MI2_OptTargetMana"] = 
{ text = "Show Mana Value"; help = "Show mana value in target frame"; }

MI2_OPTIONS["MI2_OptHealthPercent"] = 
{ text = "Show Percent"; help = "Add percentage to health in target frame"; }

MI2_OPTIONS["MI2_OptManaPercent"] = 
{ text = "Show Percent"; help = "Add percentage to mana in target frame"; }

MI2_OPTIONS["MI2_OptHealthPosX"] = 
{ text = "Horizontal Position"; help = "Adjust horizontal position of health in target frame"; }

MI2_OPTIONS["MI2_OptHealthPosY"] = 
{ text = "Vertical Position"; help = "Adjust vertical position of health in target frame"; }

MI2_OPTIONS["MI2_OptManaPosX"] = 
{ text = "Horizontal Position"; help = "Adjust horizontal position of mana in target frame"; }

MI2_OPTIONS["MI2_OptManaPosY"] = 
{ text = "Vertical Position"; help = "Adjust vertical position of mana in target frame"; }

MI2_OPTIONS["MI2_OptTargetFont"] = 
{ text = "Font"; help = "Set font for health/mana values in target frame";
choice1= "NumberFont"; choice2="GameFont"; choice3="ItemTextFont" }

MI2_OPTIONS["MI2_OptTargetFontSize"] = 
{ text = "Font Size"; help = "Set font size for health/mana values in target frame"; }

MI2_OPTIONS["MI2_OptClearTarget"] = 
{ text = "Delete Target Data"; help = "Delete data for current target from databases."; }

MI2_OPTIONS["MI2_OptClearMobDb"] = 
{ text = "Delete Database"; help = "Delete entire contents of mob info database."; }

MI2_OPTIONS["MI2_OptClearHealthDb"] = 
{ text = "Delete Database"; help = "Delete entire contents of mob health database."; }

MI2_OPTIONS["MI2_OptClearPlayerDb"] = 
{ text = "Delete Database"; help = "Delete entire contents of player health database."; }

MI2_OPTIONS["MI2_OptSaveItems"] = 
{ text = "Record Mob loot item data for quality:"; help = "Turn this on to record loot item details for all Mobs.";
info = "You can choose the quality level of items to be recorded."; }

MI2_OPTIONS["MI2_OptSaveBasicInfo"] = 
{ text = "Record basic Mob info"; help = "Record a set of basic mob information.";
info = "Basic mob info includes: mob type, counters for: loot, empty loot, cloth, money, items value, items quality overview"; }

MI2_OPTIONS["MI2_OptSaveCharData"] = 
{ text = "Record character specific Mob data"; help = "Record all Mob data that is character specific.";
info = "This will enable or disable saving of the following data:\nnumber of kills, min/max damage, DPS (damage per sec), Mob XP\n\nThis data is saved separately for each character. Saving it can\nonly be enabled/disabled for the entire set of 4 values"; }

MI2_OPTIONS["MI2_OptSaveLocation"] = 
{ text = "Record data describing the Mob location"; help = "Record the area and coordinates where the Mob can be found." }

MI2_OPTIONS["MI2_OptSaveResist"] = 
{ text = "Record data about Resistances & Immunities"; help = "Record data about a Mobs resistances and immunities to spell schools.";
info = "For spell schools MobInfo records how many spells per school\nhit successfully versus how many are resisted."; }

MI2_OPTIONS["MI2_OptItemsQuality"] = 
{ text = ""; help = "Record loot item details for selected quality and better.";
choice1 = "Grey & Better"; choice2="White & Better"; choice3="Green & Better" }

MI2_OPTIONS["MI2_OptTrimDownMobData"] = 
{ text = "Minimize Mob Database Size"; help = "Minimize Mob database size by removing surplus data.";
info = "Surplus data is all data within the database that is not marked as\nbeing recorded."; }

MI2_OPTIONS["MI2_OptImportMobData"] = 
{ text = "Start the Import"; help = "Import an external Mob Database into your own Mob Database";
info = "IMPORTANT: please read the import instructions !\nALWAYS backup your own Mob database BEFORE import !"; }

MI2_OPTIONS["MI2_OptDeleteSearch"] = 
{ text = "DELETE"; help = "Deletes all Mobs in the search result list from the MobInfo database.";
info = "WARNING: this operation can not be undone.\nPlease use with care !\nYou might want to backup your MobInfo database before deleting Mobs."; }

MI2_OPTIONS["MI2_OptImportOnlyNew"] = 
{ text = "Import only unknown Mobs"; help = "Import only Mobs that do not exist in your own database";
info = "Activating this option prevents that the data of existing Mobs\nis modified. Only unknown (ie. new) Mobs will get imported. This\nallows importing partially overlapping database without causing\nconsistency problems."; }

MI2_OPTIONS["MI2_MainOptionsFrameTab1"] = 
{ text = "Tooltip"; help = "Set options for displaying mob info in tooltip"; }

MI2_OPTIONS["MI2_MainOptionsFrameTab2"] = 
{ text = "Health/Mana"; help = "Set options for displaying health/mana in target frame"; }

MI2_OPTIONS["MI2_MainOptionsFrameTab3"] = 
{ text = "Database"; help = "Database management options"; }

MI2_OPTIONS["MI2_MainOptionsFrameTab4"] = 
{ text = "Search"; help = "Search through the Database"; }

MI2_OPTIONS["MI2_SearchResultFrameTab1"] = 
{ text = "Mob List"; help = ""; }

MI2_OPTIONS["MI2_SearchResultFrameTab2"] = 
{ text = "Items List"; help = ""; }

