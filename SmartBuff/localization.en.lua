-------------------------------------------------------------------------------
-- Globals
-------------------------------------------------------------------------------

SMARTBUFF_TTC_R = 1;
SMARTBUFF_TTC_G = 1;
SMARTBUFF_TTC_B = 1;
SMARTBUFF_TTC_A = 1;

SMARTBUFF_CONST_AUTOSOUND = "Deathbind Sound";
--SMARTBUFF_CONST_AUTOSOUND = "TaxiNodeDiscovered";
--SMARTBUFF_CONST_AUTOSOUND = "GLUECREATECHARACTERBUTTON";

SMARTBUFF_CONST_GROUP = "GROUP";
SMARTBUFF_CONST_SELF  = "SELF";
SMARTBUFF_CONST_FORCESELF = "FORCESELF";
SMARTBUFF_CONST_TRACK = "TRACK";
SMARTBUFF_CONST_WEAPON = "WEAPON";
SMARTBUFF_CONST_INV = "INVENTORY";

SMARTBUFF_BUFFTEXT = " Test";

--[[
SystemFont 
GameFontNormal 
GameFontNormalSmall 
GameFontNormalLarge 
GameFontHighlight 
GameFontHighlightSmall 
GameFontHighlightSmallOutline 
GameFontHighlightLarge 
GameFontDisable 
GameFontDisableSmall 
GameFontDisableLarge 
GameFontGreen 
GameFontGreenSmall 
GameFontGreenLarge 
GameFontRed 
GameFontRedSmall 
GameFontRedLarge 
GameFontWhite 
GameFontDarkGraySmall 
NumberFontNormalYellow 
NumberFontNormalSmallGray 
QuestFontNormalSmall 
DialogButtonHighlightText
ErrorFont 
TextStatusBarText 
CombatLogFont 
NumberFontNormalLarge
NumberFontNormalHuge
]]--
SMARTBUFF_CONST_SPLASHFONT = "NumberFontNormalHuge";
 
-------------------------------------------------------------------------------
-- English localization (Default)
-------------------------------------------------------------------------------

-- Bindings
BINDING_NAME_SMARTBUFF_BIND_TRIGGER = "Trigger";
BINDING_NAME_SMARTBUFF_BIND_TARGET  = "Target";
BINDING_NAME_SMARTBUFF_BIND_OPTIONS = "Option menu";
BINDING_NAME_SMARTBUFF_BIND_RESETBUFFTIMERS = "Reset buff timers";

-- Druid
SMARTBUFF_DRUID_CAT = "Cat Form";
SMARTBUFF_DRUID_MOONKIN = "Moonkin Form";
SMARTBUFF_DRUID_TRACK = "Track Humanoids";
SMARTBUFF_DRUID = { };
SMARTBUFF_DRUID[1] = {"Mark of the Wild", 30, SMARTBUFF_CONST_GROUP, {1,10,20,30,40,50,60}, "WPET", "Gift of the Wild", 60, {50,60}, {"Wild Berries","Wild Thornroot"}};
SMARTBUFF_DRUID[2] = {"Thorns", 10, SMARTBUFF_CONST_GROUP, {6,14,24,34,44,54}, "MAGE;PRIEST;WARLOCK;WPET;" .. SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[3] = {"Omen of Clarity", 10, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[4] = {"Barkskin", 0.25, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[5] = {"Nature's Grasp", 0.75, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[6] = {"Tiger's Fury", 0.1, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_CAT};

-- Mage
SMARTBUFF_MAGE = { };
SMARTBUFF_MAGE[1] = {"Arcane Intellect", 30, SMARTBUFF_CONST_GROUP, {1,14,28,42,56}, "ROGUE;WARRIOR;HPET;WPET", "Arcane Brilliance", 60, {56}, {"Arcane Powder"}};
SMARTBUFF_MAGE[2] = {"Ice Armor", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[3] = {"Frost Armor", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[4] = {"Mage Armor", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[5] = {"Dampen Magic", 10, SMARTBUFF_CONST_GROUP, {12,24,36,48,60}, "HPET;WPET"};
SMARTBUFF_MAGE[6] = {"Amplify Magic", 10, SMARTBUFF_CONST_GROUP, {18,30,42,54}, "HPET;WPET"};
SMARTBUFF_MAGE[7] = {"Mana Shield", 1, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[8] = {"Fire Ward", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[9] = {"Frost Ward", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[10] = {"Ice Barrier", 1, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE_PATTERN = {"%a+ Armor$"};

-- Priest
SMARTBUFF_PRIEST = { };
SMARTBUFF_PRIEST[1] = {"Power Word: Fortitude", 30, SMARTBUFF_CONST_GROUP, {1,12,24,36,48,60}, "WPET", "Prayer of Fortitude", 60, {48,60}, {"Holy Candle","Sacred Candle"}};
SMARTBUFF_PRIEST[2] = {"Shadow Protection", 10, SMARTBUFF_CONST_GROUP, {30,42,56}, "WPET", "Prayer of Shadow Protection", 20, {56}, {"Sacred Candle"}};
SMARTBUFF_PRIEST[3] = {"Inner Fire", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[4] = {"Divine Spirit", 30, SMARTBUFF_CONST_GROUP, {40,42,54,60}, "ROGUE;WARRIOR;HPET;WPET", "Prayer of Spirit", 60, {60}, {"Sacred Candle"}};
SMARTBUFF_PRIEST[5] = {"Power Word: Shield", 0.5, SMARTBUFF_CONST_GROUP, {6,12,18,24,30,36,42,48,54,60}, "MAGE;WARLOCK;ROGUE;PALADIN;WARRIOR;DRUID;HUNTER;SHAMAN;HPET;WPET"};
SMARTBUFF_PRIEST[6] = {"Fear Ward", 10, SMARTBUFF_CONST_GROUP, {20}};
SMARTBUFF_PRIEST[7] = {"Elune's Grace", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[8] = {"Feedback", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[9] = {"Shadowguard", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[10] = {"Touch of Weakness", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[11] = {"Inner Focus", -1, SMARTBUFF_CONST_SELF};

-- Warlock
SMARTBUFF_WARLOCK = { };
SMARTBUFF_WARLOCK[1] = {"Demon Armor", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[2] = {"Demon Skin", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[3] = {"Unending Breath", 10, SMARTBUFF_CONST_GROUP, {16}, "HPET;WPET"};
SMARTBUFF_WARLOCK[4] = {"Detect Greater Invisibility", 10, SMARTBUFF_CONST_GROUP, {50}, "HPET;WPET"};
SMARTBUFF_WARLOCK[5] = {"Detect Invisibility", 10, SMARTBUFF_CONST_GROUP, {38}, "HPET;WPET"};
SMARTBUFF_WARLOCK[6] = {"Detect Lesser Invisibility", 10, SMARTBUFF_CONST_GROUP, {26}, "HPET;WPET"};
SMARTBUFF_WARLOCK[7] = {"Soul Link", 0, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK_PATTERN = {"^Demon %a+", "^Detect %a+ Invisibility$"};

-- Hunter
SMARTBUFF_HUNTER = { };
SMARTBUFF_HUNTER[1] = {"Trueshot Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[2] = {"Rapid Fire", 0.2, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[3] = {"Aspect of the Hawk", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[4] = {"Aspect of the Monkey", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[5] = {"Aspect of the Wild", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[6] = {"Aspect of the Beast", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER_PATTERN = {"^Aspect of"};

-- Shaman
SMARTBUFF_SHAMAN = { };
SMARTBUFF_SHAMAN[1] = {"Lightning Shield", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[2] = {"Rockbiter Weapon", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[3] = {"Frostbrand Weapon", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[4] = {"Flametongue Weapon", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[5] = {"Windfury Weapon", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[6] = {"Water Breathing", 10, SMARTBUFF_CONST_GROUP, {22}};

-- Warrior
SMARTBUFF_WARRIOR = { };
SMARTBUFF_WARRIOR[1] = {"Battle Shout", 2, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[2] = {"Berserker Rage", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[3] = {"Bloodrage", 0.165, SMARTBUFF_CONST_SELF};

-- Rogue
SMARTBUFF_ROGUE = { };
SMARTBUFF_ROGUE[1]  = {"Blade Flurry", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[2]  = {"Slice and Dice", 0.2, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[3]  = {"Evasion", 0.2, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[4]  = {"Instant Poison VI", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[5]  = {"Instant Poison V", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[6]  = {"Instant Poison IV", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[7]  = {"Instant Poison III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[8]  = {"Instant Poison II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[9]  = {"Instant Poison", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[10] = {"Wound Poison IV", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[11] = {"Wound Poison III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[12] = {"Wound Poison II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[13] = {"Wound Poison", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[14] = {"Mind-numbing Poison III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[15] = {"Mind-numbing Poison II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[16] = {"Mind-numbing Poison", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[17] = {"Deadly Poison IV", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[18] = {"Deadly Poison III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[19] = {"Deadly Poison II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[20] = {"Deadly Poison", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[21] = {"Crippling Poison II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[22] = {"Crippling Poison", 30, SMARTBUFF_CONST_INV};

-- Paladin
SMARTBUFF_PALADIN = { };
SMARTBUFF_PALADIN[1] = {"Righteous Fury", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[2] = {"Holy Shield", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[3]  = {"Blessing of Might", 5, SMARTBUFF_CONST_GROUP, {4,12,22,32,42,52,60}, "DRUID;MAGE;PRIEST;SHAMAN;WARLOCK;WPET", "Greater Blessing of Might", 15, {52,60}, {"Symbol of Kings","Symbol of Kings"} };
SMARTBUFF_PALADIN[4]  = {"Blessing of Wisdom", 5, SMARTBUFF_CONST_GROUP, {14,24,34,44,54,60}, "ROGUE;SHAMAN;WARRIOR;HPET;WPET", "Greater Blessing of Wisdom", 15, {54,60}, {"Symbol of Kings","Symbol of Kings"} };
SMARTBUFF_PALADIN[5]  = {"Blessing of Salvation", 5, SMARTBUFF_CONST_GROUP, {26}, "SHAMAN;WARRIOR;HPET;WPET", "Greater Blessing of Salvation", 15, {60}, {"Symbol of Kings"} };
SMARTBUFF_PALADIN[6]  = {"Blessing of Kings", 5, SMARTBUFF_CONST_GROUP, {20}, "SHAMAN;WPET", "Greater Blessing of Kings", 15, {60}, {"Symbol of Kings"} };
SMARTBUFF_PALADIN[7]  = {"Blessing of Sanctuary", 5, SMARTBUFF_CONST_GROUP, {30,40,50,60}, "DRUID;HUNTER;MAGE;PRIEST;ROGUE;SHAMAN;WARLOCK;HPET;WPET", "Greater Blessing of Sanctuary", 15, {60}, {"Symbol of Kings"} };
SMARTBUFF_PALADIN[8]  = {"Blessing of Light", 5, SMARTBUFF_CONST_GROUP, {40,50,60}, "SHAMAN;WPET", "Greater Blessing of Light", 15, {60}, {"Symbol of Kings"} };
--SMARTBUFF_PALADIN[9]  = {"Blessing of Freedom", 0.165, SMARTBUFF_CONST_GROUP, {18}};
--SMARTBUFF_PALADIN[10] = {"Blessing of Protection", 1, SMARTBUFF_CONST_GROUP, {10,24,38}};
SMARTBUFF_PALADIN[9]  = {"Seal of Command", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[10] = {"Seal of Fury", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[11] = {"Seal of Justice", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[12] = {"Seal of Light", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[13] = {"Seal of Righteousness", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[14] = {"Seal of Wisdom", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[15] = {"Seal of the Crusader", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[16] = {"Devotion Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[17] = {"Retribution Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[18] = {"Concentration Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[19] = {"Shadow Resistance Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[20] = {"Frost Resistance Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[21] = {"Fire Resistance Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[22] = {"Sanctity Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN_PATTERN = {"^Seal of %a+"};


-- Stones and oils
SMARTBUFF_WEAPON = { };
SMARTBUFF_WEAPON[1]  = {"Rough Sharpening Stone", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[2]  = {"Coarse Sharpening Stone", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[3]  = {"Heavy Sharpening Stone", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[4]  = {"Solid Sharpening Stone", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[5]  = {"Dense Sharpening Stone", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[6]  = {"Elemental Sharpening Stone", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[7]  = {"Rough Weightstone", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[8]  = {"Coarse Weightstone", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[9]  = {"Heavy Weightstone", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[10] = {"Solid Weightstone", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[11] = {"Dense Weightstone", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[12] = {"Shadow Oil", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[13] = {"Frost Oil", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[14] = {"Minor Mana Oil", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[15] = {"Lesser Mana Oil", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[16] = {"Brilliant Mana Oil", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[17] = {"Minor Wizard Oil", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[18] = {"Lesser Wizard Oil", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[19] = {"Wizard Oil", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[20] = {"Brilliant Wizard Oil", 30, SMARTBUFF_CONST_INV};

SMARTBUFF_WEAPON_STANDARD = {"Daggers", "Axes", "Swords", "Maces", "Staves", "Fist Weapons", "Polearms"};
SMARTBUFF_WEAPON_BLUNT = {"Maces", "Staves", "Fist Weapons"};
SMARTBUFF_WEAPON_BLUNT_PATTERN = "Weightstone$";
SMARTBUFF_WEAPON_SHARP = {"Daggers", "Axes", "Swords", "Polearms"};
SMARTBUFF_WEAPON_SHARP_PATTERN = "Sharpening Stone$";

-- Tracking
SMARTBUFF_TRACKING = { };
SMARTBUFF_TRACKING[1]  = {"Find Minerals", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[2]  = {"Find Herbs", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[3]  = {"Find Treasure", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[4]  = {"Track Humanoids", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[5]  = {"Track Beasts", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[6]  = {"Track Undead", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[7]  = {"Track Hidden", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[8]  = {"Track Elementals", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[9]  = {"Track Demons", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[10] = {"Track Giants", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[11] = {"Track Dragonkin", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[12] = {"Sense Demons", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[13] = {"Sense Undead", -1, SMARTBUFF_CONST_TRACK};

-- Racial
SMARTBUFF_RACIAL = { };
SMARTBUFF_RACIAL[1]  = {"Stoneform", 0.133, SMARTBUFF_CONST_SELF}; -- Dwarv
SMARTBUFF_RACIAL[2]  = {"Perception", 0.333, SMARTBUFF_CONST_SELF}; -- Human
SMARTBUFF_RACIAL[3]  = {"Blood Fury", 0.416, SMARTBUFF_CONST_SELF}; -- Orc
SMARTBUFF_RACIAL[4]  = {"Berserking", 0.166, SMARTBUFF_CONST_SELF}; -- Troll
SMARTBUFF_RACIAL[5]  = {"Will of the Forsaken", 0.083, SMARTBUFF_CONST_SELF}; -- Undead


-- Creature type
SMARTBUFF_HUMANOID  = "Humanoid";
SMARTBUFF_DEMON     = "Demon";
SMARTBUFF_BEAST     = "Beast";
SMARTBUFF_DEMONTYPE = "Imp";

-- Classes
SMARTBUFF_CLASSES = {"Druid", "Hunter", "Mage", "Paladin", "Priest", "Rogue", "Shaman", "Warlock", "Warrior", "Hunter Pet", "Warlock Pet"};

-- Templates and Instances
SMARTBUFF_TEMPLATES = {"Solo", "Party", "Raid", "Battleground", "MC", "Ony", "BWL", "AQ", "ZG", "Custom 1", "Custom 2", "Custom 3", "Custom 4", "Custom 5"};
SMARTBUFF_INSTANCES = {"Molten Core", "Onyxia's Lair", "Blackwing Lair", "Ahn'Qiraj", "Zul'Gurub", "Alterac Valley", "Arathi Basin", "Warsong Gulch"};

-- Mount
SMARTBUFF_MOUNT = "Increases speed by (%d+)%%.";

-- Options Frame Text
SMARTBUFF_OFT                = "SmartBuff On/Off";
SMARTBUFF_OFT_MENU           = "Show/Hide options menu";
SMARTBUFF_OFT_AUTO           = "Reminder";
SMARTBUFF_OFT_AUTOTIMER      = "Check timer";
SMARTBUFF_OFT_AUTOCOMBAT     = "in combat";
SMARTBUFF_OFT_AUTOCHAT       = "Chat";
SMARTBUFF_OFT_AUTOSPLASH     = "Splash";
SMARTBUFF_OFT_AUTOSOUND      = "Sound";
SMARTBUFF_OFT_AUTOREST       = "Disable in cities";
SMARTBUFF_OFT_HUNTERPETS     = "Buff Hunter pets";
SMARTBUFF_OFT_WARLOCKPETS    = "Buff Warlock pets";
SMARTBUFF_OFT_ARULES         = "Advance rules";
SMARTBUFF_OFT_GRP            = "Raid Subgroups to buff";
SMARTBUFF_OFT_SUBGRPCHANGED  = "Open options menu, when\nsubgroup has changed";
SMARTBUFF_OFT_BUFFS          = "Buffs/Abilities";
SMARTBUFF_OFT_TARGET         = "Buffs the selected target";
SMARTBUFF_OFT_DONE           = "Done";
SMARTBUFF_OFT_APPLY          = "Apply";
SMARTBUFF_OFT_GRPBUFFSIZE    = "Group size";
SMARTBUFF_OFT_MESSAGES       = "Disable messages";
SMARTBUFF_OFT_MSGNORMAL      = "normal";
SMARTBUFF_OFT_MSGWARNING     = "warning";
SMARTBUFF_OFT_MSGERROR       = "error";
SMARTBUFF_OFT_HIDEMMBUTTON   = "Hide minimap-button";
SMARTBUFF_OFT_REBUFFTIMER    = "Rebuff Timer";
SMARTBUFF_OFT_AUTOSWITCHTMP  = "Switch template";
SMARTBUFF_OFT_SELFFIRST      = "Self first";
SMARTBUFF_OFT_SCROLLWHEEL    = "Buff on scrollwheel";
SMARTBUFF_OFT_TARGETSWITCH   = "target change";
SMARTBUFF_OFT_BUFFTARGET     = "Buff target";
SMARTBUFF_OFT_BUFFPVP        = "Buff PvP";
SMARTBUFF_OFT_AUTOSWITCHTMPINST = "Instances";
SMARTBUFF_OFT_CHECKCHARGES   = "Check charges";
SMARTBUFF_OFT_RBT            = "Reset BT";
SMARTBUFF_OFT_BUFFINCITIES   = "Buff in cities";
SMARTBUFF_OFT_CTRASYNC       = "CTRA sync";
SMARTBUFF_OFT_ADVGRPBUFFCHECK = "Grp buff check";
SMARTBUFF_OFT_ADVGRPBUFFRANGE = "Grp range check";
SMARTBUFF_OFT_BLDURATION     = "Blacklisted";

-- Options Frame Tooltip Text
SMARTBUFF_OFTT               = "Toggles SmartBuff On/Off";
SMARTBUFF_OFTT_AUTO          = "Toggles the buff reminder On/Off";
SMARTBUFF_OFTT_AUTOTIMER     = "Delay in seconds between two checks.";
SMARTBUFF_OFTT_AUTOCOMBAT    = "Run the check also in combat.";
SMARTBUFF_OFTT_AUTOCHAT      = "Displays missing buffs as chat message.";
SMARTBUFF_OFTT_AUTOSPLASH    = "Displays missing buffs as splash message\nin the middle of the screen.";
SMARTBUFF_OFTT_AUTOSOUND     = "Plays a sound if buffs are missing.";
SMARTBUFF_OFTT_AUTOREST      = "Disable reminder in capital cities";
SMARTBUFF_OFTT_HUNTERPETS    = "Buff the Hunter pets as well.";
SMARTBUFF_OFTT_WARLOCKPETS   = "Buff the Warlock pets as well, except the " .. SMARTBUFF_DEMONTYPE .. ".";
SMARTBUFF_OFTT_ARULES        = "Does not cast:\n- Thorns on Mages, Priests and Warlocks\n- Arcane Intellect on units without Mana\n- Divine Spirit on units without Mana";
SMARTBUFF_OFTT_SUBGRPCHANGED = "Automatically opens the SmartBuff options menu,\nwhen you have changed the subgroup.";
SMARTBUFF_OFTT_GRPBUFFSIZE   = "How many players missing the groupbuff and have to be in\nthe group, that the groupbuff will casted.";
SMARTBUFF_OFTT_HIDEMMBUTTON  = "Hides the SmartBuff minimap-button.";
SMARTBUFF_OFTT_REBUFFTIMER   = "How many seconds before a buff expires,\nthe reminder should alert you.\n0 = Deactivated";
SMARTBUFF_OFTT_SELFFIRST     = "Buffs your character first of all others.";
SMARTBUFF_OFTT_SCROLLWHEEL   = "Casts buffs when you roll your\nscrollwheel forward or backward.";
SMARTBUFF_OFTT_TARGETSWITCH  = "Casts buffs when you switch your target.";
SMARTBUFF_OFTT_BUFFTARGET    = "Buffs first the current target,\nif it is friendly.";
SMARTBUFF_OFTT_BUFFPVP       = "Buff PvP flagged players,\nalso if you are not PvP flagged.";
SMARTBUFF_OFTT_AUTOSWITCHTMP = "Automatically switches the template,\nif the group type changes.";
SMARTBUFF_OFTT_AUTOSWITCHTMPINST = "Automatically switches the template,\nif the instance changes.";
SMARTBUFF_OFTT_CHECKCHARGES  = "Displays low amount of\ncharges on a buff.";
SMARTBUFF_OFTT_BUFFINCITIES  = "Buffs also if you are in capital cities.\nIf you are PvP flagged, it buffs in any case.";
SMARTBUFF_OFTT_CTRASYNC      = "Activate syncronisation with CTRA\nto retrive the bufftime left from other players.\nWorks only in raids.";
SMARTBUFF_OFTT_ADVGRPBUFFCHECK = "The advanced group buff check is also looking\non single buffs on the group buff check.";
SMARTBUFF_OFTT_ADVGRPBUFFRANGE = "The advanced group range check is also looking\nif each player in group is in range.";
SMARTBUFF_OFTT_BLDURATION    = "How many seconds, players will be blacklistet\n0 = Deactivated";

-- Buffsetup Frame Text
SMARTBUFF_BST_SELFONLY       = "Self only";
SMARTBUFF_BST_COMBATIN       = "In combat";
SMARTBUFF_BST_COMBATOUT      = "Out of combat";
SMARTBUFF_BST_MAINHAND       = "Main Hand";
SMARTBUFF_BST_OFFHAND        = "Off Hand";
SMARTBUFF_BST_REMINDER       = "Notification";

-- Buffsetup Frame Tooltip Text
SMARTBUFF_BSTT_SELFONLY      = "Buffs only your character."; 
SMARTBUFF_BSTT_COMBATIN      = "Buffs if you are in combat.";
SMARTBUFF_BSTT_COMBATOUT     = "Buffs if you are out of combat.";
SMARTBUFF_BSTT_MAINHAND      = "Buffs the Main Hand.";
SMARTBUFF_BSTT_OFFHAND       = "Buffs the Off Hand.";
SMARTBUFF_BSTT_REMINDER      = "Display reminder message.";
SMARTBUFF_BSTT_REBUFFTIMER   = "How many seconds before a buff expires,\nthe reminder should alert you.\n0 = global rebuff timer";

-- Messages
SMARTBUFF_MSG_LOADED         = "loaded";
SMARTBUFF_MSG_DISABLED       = "SmartBuff is disabled!";
SMARTBUFF_MSG_SUBGROUP       = "You've joined a new subgroup, please check the options!";
SMARTBUFF_MSG_NOTHINGTODO    = "Nothing to do";
SMARTBUFF_MSG_BUFFED         = "buffed";
SMARTBUFF_MSG_OOR            = "is out of range to buff!";
--SMARTBUFF_MSG_CD             = "has cooldown!";
SMARTBUFF_MSG_CD             = "Global cooldown!";
SMARTBUFF_MSG_CHAT           = "not possible in chat mode!";
SMARTBUFF_MSG_SHAPESHIFT     = "Casting is not allowed in shapeshift form!";
SMARTBUFF_MSG_NOACTIONSLOT   = "needs a slot in an actionbar to working properly!";
SMARTBUFF_MSG_GROUP          = "Group";
SMARTBUFF_MSG_NEEDS          = "needs";
SMARTBUFF_MSG_OOM            = "Not enough mana/rage/energy!";
SMARTBUFF_MSG_STOCK          = "Actual stock of";
SMARTBUFF_MSG_NOREAGENT      = "Out of reagent:";
SMARTBUFF_MSG_DEACTIVATED    = "deactivated!";
SMARTBUFF_MSG_REBUFF         = "Rebuff";
SMARTBUFF_MSG_LEFT           = "left";
SMARTBUFF_MSG_CLASS          = "Class";
SMARTBUFF_MSG_CHARGES        = "charges";
