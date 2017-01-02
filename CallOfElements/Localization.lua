
--[[ ----------------------------------------------------------------

			E N G L I S H

-------------------------------------------------------------------]]

-- Errors
-- -------
COESTR_NOTASHAMAN = "You are not a shaman. Unloading Call Of Elements";
COESTR_NOTOTEM = "No totem available yet";
COESTR_UI_NOTASSIGNED = "<No text assigned>";
COESTR_INVALIDELEMENT = "Invalid element found in totem: ";


-- Notifications
-- --------------
COESTR_TOTEMWARNING = "%s expires in %d seconds";
COESTR_TOTEMEXPIRED = "%s has expired";
COESTR_TOTEMDESTROYED = "%s has been DESTROYED";
COESTR_SWITCHTOSET = "%s totem set activated";
COESTR_FIXEDSETS = "Fixed the cast order localization of your totem sets.";
COESTR_UDATEDSAVED = "Saved variables have been updated to version ";
COESTR_FIXEDDISPLAY = "Errors in the SavedVariables have been corrected.";
COESTR_TOTEMSRELOADED = "Totems reloaded";
COESTR_RESTARTINGSET = "Active set restarted";
COESTR_RESET = "Timers have been reset";
COESTR_HEALCOOLDOWN = " is not ready yet!";
COESTR_NOHEALING = "No healing needed";
COESTR_HEALING = "Healing %s with %s (Rank %d)";
COESTR_HEALLOWERRANK = "Not enough mana. Using rank %d instead";
COESTR_HEALOOM = "Out of mana!";


-- String patterns
-- ----------------
COESTR_SCANTOTEMS = "Totem";
COESTR_TOTEMTOOLS = "Tools: (.*) Totem";
COESTR_TOTEMMANA = "(%d*) Mana";
COESTR_TOTEMRANK = "Rank (%d)";
COESTR_MINUTEDURATION = "(%d%.%d%d) min";
COESTR_MINUTEDURATION_INT = "(%d) min";
COESTR_SECDURATION = "(%d%d?) sec";
COESTR_CASTBYNAME = "%(Rank (%d)%)";
COESTR_TOTEMDAMAGE = { ".+ [crh]+its (.+ Totem) ?%u* for (%d+).*" };
COESTR_TOTEMHEALTH = { "(%d*) health" };
COESTR_SHOCKSPELL = "(%a* Shock)";
COESTR_HEALINGWAVE = "Healing Wave";
COESTR_LESSERWAVE = "Lesser Healing Wave";
COESTR_MINAMOUNT = "(%d*) to";
COESTR_MAXAMOUNT = "to (%d*)";
COESTR_TRINKET = "^.*%[Enamored Water Spirit%].*$"; 


-- Totem Advisor
-- --------------
COESTR_POISON = "Poison";
COESTR_DISEASE = "Disease";
COESTR_TOTEMPOISON = "Poison Cleansing Totem";
COESTR_TOTEMDISEASE = "Disease Cleansing Totem";
COESTR_TOTEMTREMOR = "Tremor Totem";
COESTR_CLEANSINGTOTEM = "Throw %s now!";

COESTR_TREMOR = {
	"Sleep", "Terrify", "Psychic Scream", "Mind Control", "Bellowing Roar", "Fear",
	"Intimidating Shout", "Panic", "Terrifying Screech", "Seduction",
	"Howl of Terror", "Intimidating Growl", "Crystalline Slumber", "Druid's Slumber"
}


-- Tools
-- ---------
COESTR_TOTEMTOOLS_EARTH = "Earth";
COESTR_TOTEMTOOLS_FIRE = "Fire";
COESTR_TOTEMTOOLS_WATER = "Water";
COESTR_TOTEMTOOLS_AIR = "Air";


-- Elements
-- ---------
COESTR_ELEMENT_EARTH = "Earth";
COESTR_ELEMENT_FIRE = "Fire";
COESTR_ELEMENT_WATER = "Water";
COESTR_ELEMENT_AIR = "Air";


-- UI elements
-- ------------
COEUI_STRINGS = {
COE_ConfigClose = "Close";
COE_ConfigTotemTabPanel = "Totem Options";
COE_ConfigHealingTabPanel = "Healing Options";
COE_ConfigDebuffTabPanel = "Debuff Options";
COE_ConfigTotemTotemBar = "Totem Bars";
COE_ConfigTotemTotemOptions = "Options";
COE_ConfigTotemTotemSets = "Totem Sets";
COE_OptionEnableTotemBar = "Enable Totem Bar";
COE_OptionHideBackdrop = "Hide background when inactive";
COE_OptionEnableTimers = "Enable totem timers";
COE_OptionEnableTimerNotifications = "Enable notifications";
COE_OptionTTAlignment = "Tooltip Alignment";
COE_OptionDisplayMode = "Anchor Button";
COE_OptionDisplayAlignment = "Button Alignment";
COE_OptionAdvisor = "Enable totem advisor";
COE_OptionEnableSets = "Enable totem sets";
COE_OptionEnableAutoSwitch = "Autoswitch sets in PVP";
COE_OptionActiveSet = "Active totem set";
COE_OptionNewSet = "New set";
COE_OptionDeleteSet = "Delete set";
COE_OptionConfigureSet = "Configure set";
COE_OptionStopConfigureSet = "OK";
COE_OptionCastOrderString = "Cast Order";
COE_OptionConfigureBar = "Configure Totems";
COE_OptionFixBar = "Fix totem bar positions";
COE_OptionConfigureOrder = "Configure Order";
COE_OptionScanTotems = "Reload Totems";
COE_OptionCurrentFrame = "Configure Bar";
COE_OptionDirection = "Direction";
COE_OptionFrameMode = "Bar mode";
COE_OptionFlexCount = "Static buttons";
COE_OptionScaling = "Scaling";
COE_OptionEnableTimerFrame = "Show separate timer frame";
COE_OptionGroupBars = "Move bars as group";
COE_OptionOverrideRank = "Rank 1 modifier";
COE_OptionFrameTimersOnly = "Show timers ONLY in timer frame";
}


-- Tooltips
-- ---------
COEUI_TOOLTIPS = {
COE_ConfigTotemTab = "Shows the totem options";
COE_ConfigHealingTab = "Shows the healing options";
COE_ConfigDebuffTab = "Shows the debuff options";
COE_OptionEnableTotemBar = "Enables and shows the totem bar\nwhich holds all of your available\ntotems for quick use";
COE_OptionHideBackdrop = "Hides the background when the mouse\nis not above the totem bar";
COE_OptionEnableTimers = "Enables the display of\nthe remaining totem time\nshown inside the totem button";
COE_OptionEnableTimerNotifications = "Displays warnings when a totem\nexpires or is destroyed";
COE_OptionAdvisor = "Displays notifications when you\nor a member of your party/raid\nhas a debuff that can be cured\nby one of your totems";
COE_OptionEnableAutoSwitch = "Automatically switches to the\nclass totem set when targetting an\nenemy player";
COE_OptionFixBar = "Fixes the totem bar position\nto prevent dragging it accidentally";
COE_OptionGroupBars = "When you drag one bar,\nthe other bars will follow";
}

COESTR_TRINKET_TOOLTIP = "Enamored Water Spirit"; 
COESTR_TRINKET_TOTEM = "Ancient Mana Spring Totem";

-- Combo boxes
-- ------------
COEUI_TTALIGN = {
{ "ANCHOR_TOPLEFT"; "Top Left" };
{ "ANCHOR_LEFT"; "Left" };
{ "ANCHOR_BOTTOMLEFT"; "Bottom Left" }; 
{ "ANCHOR_TOPRIGHT"; "Top Right" };
{ "ANCHOR_RIGHT"; "Right" };
{ "ANCHOR_BOTTOMRIGHT"; "Bottom Right" };
{ "DISABLED"; "Disabled" };
}

COEUI_DISPLAYMODE = { "Customize", "Timers Only", "Active Set" }
 
COEUI_DISPLAYALIGN = { "Box", "Vertical", "Horizontal" }

COEUI_PVPSETS = { "[PVP] Druid", "[PVP] Hunter", "[PVP] Mage", "[PVP] Paladin", "[PVP] Priest", 
	"[PVP] Rogue", "[PVP] Shaman", "[PVP] Warlock", "[PVP] Warrior" }
COEUI_DEFAULTSET = "Default";

COEUI_OVERRIDERANK = { "No key", "Use SHIFT", "Use ALT", "Use CTRL" };

COEUI_CURRENTFRAME = { "Earth", "Fire", "Water", "Air" };

COEUI_DIRECTION = { "Up", "Down", "Left", "Right" };

COEUI_FRAMEMODE = { "Closed", "Open", "Flex", "Hidden" };


-- Key bindings
-- -------------
BINDING_HEADER_CALLOFELEMENTS = "Call Of Elements";
BINDING_NAME_COESHOWCONFIG = "Show configuration dialog";
BINDING_NAME_COEBESTHEAL = "BestHeal";
BINDING_NAME_COEBATTLEHEAL = "BattleHeal";
BINDING_NAME_COETHROWADVISED = "Throw next advised totem";
BINDING_NAME_COENEXTSET = "Activate next totem set";
BINDING_NAME_COETHROWSET = "Throw the active totem set";
BINDING_NAME_COERESTARTSET = "Restart the active set";
BINDING_NAME_TOTEMEARTH1 = "Earth Totem #1";
BINDING_NAME_TOTEMEARTH2 = "Earth Totem #2";
BINDING_NAME_TOTEMEARTH3 = "Earth Totem #3";
BINDING_NAME_TOTEMEARTH4 = "Earth Totem #4";
BINDING_NAME_TOTEMEARTH5 = "Earth Totem #5";
BINDING_NAME_TOTEMFIRE1 = "Fire Totem #1";
BINDING_NAME_TOTEMFIRE2 = "Fire Totem #2";
BINDING_NAME_TOTEMFIRE3 = "Fire Totem #3";
BINDING_NAME_TOTEMFIRE4 = "Fire Totem #4";
BINDING_NAME_TOTEMFIRE5 = "Fire Totem #5";
BINDING_NAME_TOTEMWATER1 = "Water Totem #1";
BINDING_NAME_TOTEMWATER2 = "Water Totem #2";
BINDING_NAME_TOTEMWATER3 = "Water Totem #3";
BINDING_NAME_TOTEMWATER4 = "Water Totem #4";
BINDING_NAME_TOTEMWATER5 = "Water Totem #5";
BINDING_NAME_TOTEMWATER6 = "Water Totem #6";
BINDING_NAME_TOTEMAIR1 = "Air Totem #1";
BINDING_NAME_TOTEMAIR2 = "Air Totem #2";
BINDING_NAME_TOTEMAIR3 = "Air Totem #3";
BINDING_NAME_TOTEMAIR4 = "Air Totem #4";
BINDING_NAME_TOTEMAIR5 = "Air Totem #5";
BINDING_NAME_TOTEMAIR6 = "Air Totem #6";
BINDING_NAME_TOTEMAIR7 = "Air Totem #7";


-- Key modifiers
-- --------------
COEMODIFIER_ALT = "ALT";
COEMODIFIER_ALT_SHORT = "A";
COEMODIFIER_CTRL = "CTRL";
COEMODIFIER_CTRL_SHORT = "C";
COEMODIFIER_SHIFT = "SHIFT";
COEMODIFIER_SHIFT_SHORT = "S";
COEMODIFIER_NUMPAD = "Num Pad";
COEMODIFIER_NUMPAD_SHORT = "NP";


-- Shell commands
-- ---------------
COESHELL_INTRO = "Available shell commands for Call Of Elements:";
COESHELL_CONFIG = "'/coe' or '/coe config' - Shows the configuration dialog";
COESHELL_LIST = "'/coe list' - Shows this list";
COESHELL_NEXTSET = "'/coe nexset' - Switches to the next custom totem set or the default set";
COESHELL_PRIORSET = "'/coe priorset' - Switches to the prior custom totem set or the default set";
COESHELL_SET = "'/coe set <name>' - Switches to set with the specified name. <name> is case-sensitive";
COESHELL_RESTARTSET = "'/coe restartset' - Next time you throw the active set, it recasts all totems";
COESHELL_RESET = "'/coe reset' - Resets all timers and the active set";
COESHELL_RESETFRAMES = "'/coe resetframes' - Returns all element bars to the screen center";
COESHELL_RESETORDERING = "'/coe resetordering' - Resets the ordering of your totem bars";
COESHELL_RELOAD = "'/coe reload' - Reloads all totems and sets";
COESHELL_MACRONOTE = "The following commands only work as macros dragged to your action bars:";
COESHELL_THROWSET = "'/coe throwset' - Throws the active totem set";
COESHELL_ADVISED = "'/coe advised' - Throws the next advised totem";
