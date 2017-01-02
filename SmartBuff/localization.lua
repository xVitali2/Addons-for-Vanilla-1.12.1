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
SMARTBUFF_CONST_TRACK = "TRACK";
 
-------------------------------------------------------------------------------
-- English localization (Default)
-------------------------------------------------------------------------------

-- Bindings
BINDING_NAME_SMARTBUFF_BIND_TRIGGER = "Trigger";
BINDING_NAME_SMARTBUFF_BIND_TARGET  = "Target";
BINDING_NAME_SMARTBUFF_BIND_OPTIONS = "Option menu";

-- Druid
SMARTBUFF_DRUID = { };
SMARTBUFF_DRUID[1] = {"Mark of the Wild", SMARTBUFF_CONST_GROUP, {1,10,20,30,40,50,60}, nil, "Gift of the Wild", {50,60}, {"Wild Berries","Wild Thornroot"}};
SMARTBUFF_DRUID[2] = {"Thorns", SMARTBUFF_CONST_GROUP, {6,14,24,34,44,54}, "MAGE;PRIEST;WARLOCK"};
SMARTBUFF_DRUID[3] = {"Omen of Clarity", SMARTBUFF_CONST_SELF};
SMARTBUFF_DRUID[4] = {"Barkskin", SMARTBUFF_CONST_SELF};
SMARTBUFF_DRUID_CAT = "Cat Form";
SMARTBUFF_DRUID_TRACK = "Track Humanoids";

-- Mage
SMARTBUFF_MAGE = { };
SMARTBUFF_MAGE[1] = {"Arcane Intellect", SMARTBUFF_CONST_GROUP, {1,14,28,42,56}, "#NOMANA#", "Arcane Brilliance", {56}, {"Arcane Powder"}};
SMARTBUFF_MAGE[2] = {"Ice Armor", SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[3] = {"Frost Armor", SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[4] = {"Mage Armor", SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[5] = {"Dampen Magic", SMARTBUFF_CONST_GROUP, {12,24,36,48,60}};
SMARTBUFF_MAGE[6] = {"Amplify Magic", SMARTBUFF_CONST_GROUP, {18,30,42,54}};
SMARTBUFF_MAGE_PATTERN = {"%a+ Armor$"};

-- Priest
SMARTBUFF_PRIEST = { };
SMARTBUFF_PRIEST[1] = {"Power Word: Fortitude", SMARTBUFF_CONST_GROUP, {1,12,24,36,48,60}, nil, "Prayer of Fortitude", {48,60}, {"Holy Candle","Sacred Candle"}};
SMARTBUFF_PRIEST[2] = {"Shadow Protection", SMARTBUFF_CONST_GROUP, {30,42,56}};
SMARTBUFF_PRIEST[3] = {"Inner Fire", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[4] = {"Divine Spirit", SMARTBUFF_CONST_GROUP, {40,42,54,60}, "#NOMANA#", "Prayer of Spirit", {60}, {"Sacred Candle"}};
SMARTBUFF_PRIEST[5] = {"Power Word: Shield", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[6] = {"Fear Ward", SMARTBUFF_CONST_GROUP, {20}};
SMARTBUFF_PRIEST[7] = {"Elune's Grace", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[8] = {"Feedback", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[9] = {"Shadowguard", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[10] = {"Touch of Weakness", SMARTBUFF_CONST_SELF};

-- Warlock
SMARTBUFF_WARLOCK = { };
SMARTBUFF_WARLOCK[1] = {"Demon Armor", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[2] = {"Demon Skin", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[3] = {"Unending Breath", SMARTBUFF_CONST_GROUP, {16}};
SMARTBUFF_WARLOCK[4] = {"Detect Greater Invisibility", SMARTBUFF_CONST_GROUP, {50}};
SMARTBUFF_WARLOCK[5] = {"Detect Invisibility", SMARTBUFF_CONST_GROUP, {38}};
SMARTBUFF_WARLOCK[6] = {"Detect Lesser Invisibility", SMARTBUFF_CONST_GROUP, {26}};
SMARTBUFF_WARLOCK[7] = {"Soul Link", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK_PATTERN = {"^Demon %a+", "^Detect %a+ Invisibility$"};

-- Hunter
SMARTBUFF_HUNTER = { };
SMARTBUFF_HUNTER[1] = {"Trueshot Aura", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[2] = {"Aspect of the Hawk", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[3] = {"Aspect of the Monkey", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[4] = {"Aspect of the Wild", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[5] = {"Aspect of the Beast", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER_PATTERN = {"^Aspect of"};

-- Shaman
SMARTBUFF_SHAMAN = { };
SMARTBUFF_SHAMAN[1] = {"Lightning Shield", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[2] = {"Rockbiter Weapon", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[3] = {"Frostbrand Weapon", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[4] = {"Flametongue Weapon", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[5] = {"Windfury Weapon", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[6] = {"Water Breathing", SMARTBUFF_CONST_GROUP, {22}};

-- Warrior
SMARTBUFF_WARRIOR = { };
SMARTBUFF_WARRIOR[1] = {"Battle Shout", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[2] = {"Berserker Rage", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[3] = {"Bloodrage", SMARTBUFF_CONST_SELF};

-- Rogue
SMARTBUFF_ROGUE = { };
SMARTBUFF_ROGUE[1] = {"Detect Traps", SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[2] = {"Blade Flurry", SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[3] = {"Evasion", SMARTBUFF_CONST_SELF};

-- Paladin
SMARTBUFF_PALADIN = { };
SMARTBUFF_PALADIN[1] = {"Righteous Fury", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[2] = {"Holy Shield", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[3] = {"Devotion Aura", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[4] = {"Retribution Aura", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[5] = {"Concentration Aura", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[6] = {"Shadow Resistance Aura", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[7] = {"Frost Resistance Aura", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[8] = {"Fire Resistance Aura", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[9] = {"Sanctity Aura", SMARTBUFF_CONST_SELF};


-- Tracking
SMARTBUFF_TRACKING = { };
SMARTBUFF_TRACKING[1]  = {"Find Minerals", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[2]  = {"Find Herbs", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[3]  = {"Find Treasure", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[4]  = {"Track Humanoids", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[5]  = {"Track Beasts", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[6]  = {"Track Undead", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[7]  = {"Track Hidden", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[8]  = {"Track Elementals", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[9]  = {"Track Demons", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[10] = {"Track Giants", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[11] = {"Track Dragonkin", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[12] = {"Sense Demons", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[13] = {"Sense Undead", SMARTBUFF_CONST_TRACK};

-- Creature type
SMARTBUFF_HUMANOID  = "Humanoid";
SMARTBUFF_DEMON     = "Demon";
SMARTBUFF_BEAST     = "Beast";
SMARTBUFF_DEMONTYPE = "Imp";

-- Mount
SMARTBUFF_MOUNT = "Increases speed by (%d+)%%.";

-- Options Frame Text
SMARTBUFF_OFT                = "SmartBuff On/Off";
SMARTBUFF_OFT_MENU           = "Show/Hide options menu";
SMARTBUFF_OFT_TARGET         = "Buffs the selected target";
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
SMARTBUFF_OFT_BUFFS          = "Buffs";
SMARTBUFF_OFT_TARGET         = "Buffs the selected target";
SMARTBUFF_OFT_DONE           = "Done";
SMARTBUFF_OFT_APPLY          = "Apply";
SMARTBUFF_OFT_GRPBUFFSIZE    = "Group size";
SMARTBUFF_OFT_MESSAGES       = "Disable messages";
SMARTBUFF_OFT_MSGNORMAL      = "normal";
SMARTBUFF_OFT_MSGWARNING     = "warning";
SMARTBUFF_OFT_MSGERROR       = "error";

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

-- Messages
SMARTBUFF_MSG_LOADED         = "loaded";
SMARTBUFF_MSG_NOTLOADED      = "not loaded: Player is not a Druid/Mage/Priest/Warlock/Hunter";
SMARTBUFF_MSG_DISABLED       = "Smart Buff is disabled!";
SMARTBUFF_MSG_SUBGROUP       = "You've joined a new subgroup, please check the options!";
SMARTBUFF_MSG_NOTHINGTODO    = "Nothing to do";
SMARTBUFF_MSG_BUFFED         = "buffed";
SMARTBUFF_MSG_OOR            = "is out of range to buff!";
SMARTBUFF_MSG_CD             = "has cooldown!";
SMARTBUFF_MSG_CHAT           = "not possible in chat mode!";
SMARTBUFF_MSG_SHAPESHIFT     = "Casting is not allowed in shapeshift form!";
SMARTBUFF_MSG_NOACTIONSLOT   = "needs a slot in an actionbar to working properly!";
SMARTBUFF_MSG_GROUP          = "Group";
SMARTBUFF_MSG_NEEDS          = "needs";
SMARTBUFF_MSG_OOM            = "Not enough mana/rage/energy!";
SMARTBUFF_MSG_STOCK          = "Actual stock of";
SMARTBUFF_MSG_NOREAGENT      = "Out of reagent:";
SMARTBUFF_MSG_DEACTIVATED    = "deactivated!";


-------------------------------------------------------------------------------
-- German localization
-------------------------------------------------------------------------------

if (GetLocale() == "deDE") then
	
-- Bindings
BINDING_NAME_SMARTBUFF_BIND_TRIGGER = "Trigger";
BINDING_NAME_SMARTBUFF_BIND_TARGET  = "Ziel";
BINDING_NAME_SMARTBUFF_BIND_OPTIONS = "Optionen";

-- Druid
SMARTBUFF_DRUID = { };
SMARTBUFF_DRUID[1] = {"Mal der Wildnis", SMARTBUFF_CONST_GROUP, {1,10,20,30,40,50,60}, nil, "Gabe der Wildnis", {50,60}, {"Wilde Beeren","Wilder Dornwurz"}};
SMARTBUFF_DRUID[2] = {"Dornen", SMARTBUFF_CONST_GROUP, {6,14,24,34,44,54}, "MAGE;PRIEST;WARLOCK"};
SMARTBUFF_DRUID[3] = {"Omen der Klarsicht", SMARTBUFF_CONST_SELF};
SMARTBUFF_DRUID[4] = {"Baumrinde", SMARTBUFF_CONST_SELF};
SMARTBUFF_DRUID_CAT = "Katzengestalt";
SMARTBUFF_DRUID_TRACK = "Humanoide aufsp\195\188ren";

-- Mage
SMARTBUFF_MAGE = { };
SMARTBUFF_MAGE[1] = {"Arkane Intelligenz", SMARTBUFF_CONST_GROUP, {1,14,28,42,56}, "#NOMANA#", "Arkane Brillanz", {56}, {"Arkanes Pulver"}};
SMARTBUFF_MAGE[2] = {"Eisr\195\188stung", SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[3] = {"Frostr\195\188stung", SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[4] = {"Magische R\195\188stung", SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[5] = {"Magied\195\164mpfer", SMARTBUFF_CONST_GROUP, {12,24,36,48,60}};
SMARTBUFF_MAGE[6] = {"Magie verst\195\164rken", SMARTBUFF_CONST_GROUP, {18,30,42,54}};
SMARTBUFF_MAGE_PATTERN = {"r\195\188stung$"};

-- Priest
SMARTBUFF_PRIEST = { };
SMARTBUFF_PRIEST[1] = {"Machtwort: Seelenst\195\164rke", SMARTBUFF_CONST_GROUP, {1,12,24,36,48,60}, nil, "Gebet der Seelenst\195\164rke", {48,60}, {"Heilige Kerze","Hochheilige Kerze"}};
SMARTBUFF_PRIEST[2] = {"Schattenschutz", SMARTBUFF_CONST_GROUP, {30,42,56}};
SMARTBUFF_PRIEST[3] = {"Inneres Feuer", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[4] = {"G\195\182ttlicher Willen", SMARTBUFF_CONST_GROUP, {40,42,54,60}, "#NOMANA#", "Gebet der Willenskraft", {60}, {"Hochheilige Kerze"}};
SMARTBUFF_PRIEST[5] = {"Machtwort: Schild", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[6] = {"Furcht-Zauberschutz", SMARTBUFF_CONST_GROUP, {20}};
SMARTBUFF_PRIEST[7] = {"Elunes Anmut", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[8] = {"R\195\188ckkopplung", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[9] = {"Schattenwache", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[10] = {"Ber\195\188hrung der Schw\195\164che ", SMARTBUFF_CONST_SELF};

-- Warlock
SMARTBUFF_WARLOCK = { };
SMARTBUFF_WARLOCK[1] = {"D\195\164monenr\195\188stung", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[2] = {"D\195\164monenhaut", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[3] = {"Unendlicher Atem", SMARTBUFF_CONST_GROUP, {16}};
SMARTBUFF_WARLOCK[4] = {"Gro\195\159e Unsichtbarkeit entdecken", SMARTBUFF_CONST_GROUP, {50}};
SMARTBUFF_WARLOCK[5] = {"Unsichtbarkeit entdecken", SMARTBUFF_CONST_GROUP, {38}};
SMARTBUFF_WARLOCK[6] = {"Geringe Unsichtbarkeit entdecken", SMARTBUFF_CONST_GROUP, {26}};
SMARTBUFF_WARLOCK[7] = {"Seelenverbindung", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK_PATTERN = {"^D\195\164monen%a+", "Unsichtbarkeit entdecken$"};

-- Hunter
SMARTBUFF_HUNTER = { };
SMARTBUFF_HUNTER[1] = {"Aura des Volltreffers", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[2] = {"Aspekt des Falken", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[3] = {"Aspekt des Affen", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[4] = {"Aspekt der Wildnis", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[5] = {"Aspekt des Wildtiers", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER_PATTERN = {"^Aspekt de%a %a+"};

-- Shaman
SMARTBUFF_SHAMAN = { };
SMARTBUFF_SHAMAN[1] = {"Blitzschlagschild", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[2] = {"Felsbei\195\159erwaffe", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[3] = {"Waffe des Frostbrands", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[4] = {"Waffe der Flammenzunge", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[5] = {"Waffe des Windfurors", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[6] = {"Wasseratmung", SMARTBUFF_CONST_GROUP, {22}};

-- Warrior
SMARTBUFF_WARRIOR = { };
SMARTBUFF_WARRIOR[1] = {"Schlachtruf", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[2] = {"Berserkerwut", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[3] = {"Blutrausch", SMARTBUFF_CONST_SELF};

-- Rogue
SMARTBUFF_ROGUE = { };
SMARTBUFF_ROGUE[1] = {"Fallen entdecken", SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[2] = {"Klingenwirbel", SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[3] = {"Entrinnen", SMARTBUFF_CONST_SELF};

-- Paladin
SMARTBUFF_PALADIN = { };
SMARTBUFF_PALADIN[1] = {"Zorn der Gerechtigkeit", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[2] = {"Heiliger Schild", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[3] = {"Aura der Hingabe", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[4] = {"Aura der Vergeltung", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[5] = {"Aura der Konzentration", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[6] = {"Aura des Schattenwiderstands", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[7] = {"Aura des Frostwiderstands", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[8] = {"Aura des Feuerwiderstands", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[9] = {"Aura der Heiligkeit", SMARTBUFF_CONST_SELF};


-- Tracking
SMARTBUFF_TRACKING = { };
SMARTBUFF_TRACKING[1]  = {"Mineraliensuche", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[2]  = {"Kr\195\164utersuche", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[3]  = {"Schatzsucher", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[4]  = {"Humanoide aufsp\195\188ren", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[5]  = {"Wildtiere aufsp\195\188ren", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[6]  = {"Untote aufsp\195\188ren", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[7]  = {"Verborgenes aufsp\195\188ren", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[8]  = {"Elementare aufsp\195\188ren", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[9]  = {"D\195\164monen aufsp\195\188ren", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[10] = {"Riesen aufsp\195\188ren", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[11] = {"Drachkin aufsp\195\188ren", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[12] = {"D\195\164monen Sp\195\188ren", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[13] = {"Untote Sp\195\188ren", SMARTBUFF_CONST_TRACK};

-- Creature type
SMARTBUFF_HUMANOID  = "Humanoid";
SMARTBUFF_DEMON     = "D\195\164mon";
SMARTBUFF_BEAST     = "Wildtier";
SMARTBUFF_DEMONTYPE = "Wichtel";

-- Mount
SMARTBUFF_MOUNT = "Erh\195\182ht Tempo um (%d+)%%.";

-- Options Frame Text
SMARTBUFF_OFT                = "Smart Buff An/Aus";
SMARTBUFF_OFT_MENU           = "Zeige/verberge das Optionen-Men\195\188";
SMARTBUFF_OFT_AUTO           = "Erinnerung";
SMARTBUFF_OFT_AUTOTIMER      = "Check Timer";
SMARTBUFF_OFT_AUTOCOMBAT     = "im Kampf";
SMARTBUFF_OFT_AUTOCHAT       = "Chat";
SMARTBUFF_OFT_AUTOSPLASH     = "Splash";
SMARTBUFF_OFT_AUTOSOUND      = "Ton";
SMARTBUFF_OFT_AUTOREST       = "Unterdr\195\188ckt in St\195\164dten";
SMARTBUFF_OFT_HUNTERPETS     = "J\195\164ger Pets buffen";
SMARTBUFF_OFT_WARLOCKPETS    = "Hexer Pets buffen";
SMARTBUFF_OFT_ARULES         = "Zus\195\164tzliche Regeln";
SMARTBUFF_OFT_GRP            = "Raid Sub-Gruppen zum Buffen";
SMARTBUFF_OFT_SUBGRPCHANGED  = "\195\150ffnet automatisch das Men\195\188\nbei Sub-Gruppen wechsel";
SMARTBUFF_OFT_BUFFS          = "Buffs";
SMARTBUFF_OFT_TARGET         = "Bufft das anvisierte Ziel";
SMARTBUFF_OFT_DONE           = "Fertig";
SMARTBUFF_OFT_APPLY          = "\195\156bernehmen";
SMARTBUFF_OFT_GRPBUFFSIZE    = "Gruppengr\195\182sse";
SMARTBUFF_OFT_MESSAGES       = "Unterdr\195\188cke Meldungen";
SMARTBUFF_OFT_MSGNORMAL      = "Normal";
SMARTBUFF_OFT_MSGWARNING     = "Warnung";
SMARTBUFF_OFT_MSGERROR       = "Fehler";

-- Options Frame Tooltip Text
SMARTBUFF_OFTT               = "Schaltet SmartBuff An/Aus";
SMARTBUFF_OFTT_AUTO          = "Schaltet die Erinnerung an fehlende Buffs An/Aus";
SMARTBUFF_OFTT_AUTOTIMER     = "Verz\195\182gerung in Sekunden zwischen zwei Checks.";
SMARTBUFF_OFTT_AUTOCOMBAT    = "Check auch w\195\164hrend dem Kampf durchf\195\188hren.";
SMARTBUFF_OFTT_AUTOCHAT      = "Zeigt fehlende Buffs als Chat-Meldung an.";
SMARTBUFF_OFTT_AUTOSPLASH    = "Zeigt fehlende Buffs als Splash-Meldung\nin der mitte des Bildschirms an.";
SMARTBUFF_OFTT_AUTOSOUND     = "Bei fehlende Buffs erklingt ein Ton.";
SMARTBUFF_OFTT_AUTOREST      = "Erinnerung wird in den\nHauptst\195\164dten unterdr\195\188ckt.";
SMARTBUFF_OFTT_HUNTERPETS    = "Bufft die J\195\164ger Pets auch.";
SMARTBUFF_OFTT_WARLOCKPETS   = "Bufft die Hexer Pets auch,\nausser den " .. SMARTBUFF_DEMONTYPE .. ".";
SMARTBUFF_OFTT_ARULES        = "Bufft nicht:\n- Dornen auf Magier, Priester und Hexer\n- Arkane Intelligenz auf Klassen ohne Mana\n- G\195\182ttlicher Willen auf Klassen ohne Mana";
SMARTBUFF_OFTT_SUBGRPCHANGED = "\195\150ffnet automatisch das SmartBuff Men\195\188,\nwenn du die Sub-Gruppe gewechselt hast.";
SMARTBUFF_OFTT_GRPBUFFSIZE   = "Anzahl Spieler die in der Gruppe sein m\195\188ssen\nund den Gruppen-Buff nicht haben,\ndamit der Gruppen-Buff verwendet wird.";

-- Messages
SMARTBUFF_MSG_LOADED         = "geladen";
SMARTBUFF_MSG_NOTLOADED      = "nicht geladen: Spieler ist kein Druide/Magier/Priester/Hexenmeister/J\195\164ger";
SMARTBUFF_MSG_DISABLED       = "Smart Buff ist deaktiviert";
SMARTBUFF_MSG_SUBGROUP       = "Du hast die Subgruppe gewechselt, bitte \195\188berpr\195\188fe die Einstellungen";
SMARTBUFF_MSG_NOTHINGTODO    = "Nichts zu buffen";
SMARTBUFF_MSG_BUFFED         = "gebuffed";
SMARTBUFF_MSG_OOR            = "ist ausser Reichweite zum Buffen";
SMARTBUFF_MSG_CD             = "hat noch Cooldown";
SMARTBUFF_MSG_CHAT           = "nicht m\195\182glich \195\188ber Chat-Befehl";
SMARTBUFF_MSG_SHAPESHIFT     = "In Verwandlung kann nicht gebufft werden";
SMARTBUFF_MSG_NOACTIONSLOT   = "muss in einem Slot auf der Aktionsleiste sein, dass es funktioniert!";
SMARTBUFF_MSG_GROUP          = "Gruppe";
SMARTBUFF_MSG_NEEDS          = "ben\195\182tigt";
SMARTBUFF_MSG_OOM            = "Zuwenig Mana/Wut/Energie!";
SMARTBUFF_MSG_STOCK          = "Aktueller Bestand";
SMARTBUFF_MSG_NOREAGENT      = "Zuwenig";
SMARTBUFF_MSG_DEACTIVATED    = "deaktiviert!";

end


-------------------------------------------------------------------------------
-- French localization 
-- Last update : 04/01/2006 
-- By ( Sasmira, Cosmos Team )
-------------------------------------------------------------------------------

if (GetLocale() == "frFR") then

-- Bindings
BINDING_NAME_SMARTBUFF_BIND_TRIGGER = "D\195\169clencheur";
BINDING_NAME_SMARTBUFF_BIND_TARGET  = "Cible";
BINDING_NAME_SMARTBUFF_BIND_OPTIONS = "Menu d\'Options";

-- Druid
SMARTBUFF_DRUID = { };
SMARTBUFF_DRUID[1] = {"Marque du fauve", SMARTBUFF_CONST_GROUP, {1,10,20,30,40,50,60}, nil, "Don du fauve", {50,60}, {"Baie sauvage","Epinette sauvage"}};
--SMARTBUFF_DRUID[1] = {"Marque de la nature", SMARTBUFF_CONST_GROUP, {1,10,20,30,40,50,60}, nil, "Cadeau de la nature", {50,60}, {"Baie sauvage","Epinette sauvage"}};
SMARTBUFF_DRUID[2] = {"Epines", SMARTBUFF_CONST_GROUP, {6,14,24,34,44,54}, "MAGE;PRIEST;WARLOCK"};
SMARTBUFF_DRUID[3] = {"Augure de clart\195\169", SMARTBUFF_CONST_SELF};
SMARTBUFF_DRUID[4] = {"Ecorce", SMARTBUFF_CONST_SELF};
SMARTBUFF_DRUID_CAT = "Forme de f\195\169lin";
SMARTBUFF_DRUID_TRACK = "Pistage des humano\195\175des";

-- Mage
SMARTBUFF_MAGE = { };
SMARTBUFF_MAGE[1] = {"Intelligence des arcanes", SMARTBUFF_CONST_GROUP, {1,14,28,42,56}, "#NOMANA#", "Illumination des arcanes", {56}, {"Poudre des arcanes"}};
SMARTBUFF_MAGE[2] = {"Armure de glace", SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[3] = {"Armure de givre", SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[4] = {"Armure du mage", SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[5] = {"Att\195\169nuation de la magie", SMARTBUFF_CONST_GROUP, {12,24,36,48,60}};
SMARTBUFF_MAGE[6] = {"Amplification de la magie", SMARTBUFF_CONST_GROUP, {18,30,42,54}};
SMARTBUFF_MAGE_PATTERN = {"^Armure d%a %a+"};

-- Priest
SMARTBUFF_PRIEST = { };
SMARTBUFF_PRIEST[1] = {"Mot de pouvoir : Robustesse", SMARTBUFF_CONST_GROUP, {1,12,24,36,48,60}, nil, "Pri\195\168re de robustesse", {48,60}, {"Bougie sanctifi\195\169e","Bougie sacr\195\169e"}};
SMARTBUFF_PRIEST[2] = {"Protection contre l'ombre", SMARTBUFF_CONST_GROUP, {30,42,56}};
SMARTBUFF_PRIEST[3] = {"Feu int\195\169rieur", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[4] = {"Esprit divin", SMARTBUFF_CONST_GROUP, {40,42,54,60}, "#NOMANA#", "Pri\195\168re d'Esprit", {60}, {"Bougie sacr\195\169e"}};
SMARTBUFF_PRIEST[5] = {"Mot de pouvoir : Bouclier", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[6] = {"Gardien de la peur", SMARTBUFF_CONST_GROUP, {20}};
SMARTBUFF_PRIEST[7] = {"Gr\195\162ce d\'Elune", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[8] = {"R\195\169action", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[9] = {"Garde de l'ombre", SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[10] = {"Toucher de faiblesse", SMARTBUFF_CONST_SELF};

-- Warlock
SMARTBUFF_WARLOCK = { };
SMARTBUFF_WARLOCK[1] = {"Armure d\195\169moniaque", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[2] = {"Peau de d\195\169mon", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[3] = {"Respiration interminable", SMARTBUFF_CONST_GROUP, {16}};
SMARTBUFF_WARLOCK[4] = {"D\195\169tection l'invisibilit\195\169 sup\195\169rieure", SMARTBUFF_CONST_GROUP, {50}};
SMARTBUFF_WARLOCK[5] = {"D\195\169tection de l'invisibilit\195\169", SMARTBUFF_CONST_GROUP, {38}};
SMARTBUFF_WARLOCK[6] = {"D\195\169tection de l'invisibilit\195\169 Inf\195\169rieure", SMARTBUFF_CONST_GROUP, {26}};
SMARTBUFF_WARLOCK[7] = {"Lien spirituel", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK_PATTERN = {"e D\195\169mon", "^D\195\169tection %.*l'invisibilit\195\169"};

-- Hunter
SMARTBUFF_HUNTER = { };
SMARTBUFF_HUNTER[1] = {"Aura de pr\195\169cision", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[2] = {"Aspect du faucon", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[3] = {"Aspect du singe", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[4] = {"Aspect de la nature", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[5] = {"Aspect de la b\195\170te", SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER_PATTERN = {"^Aspect d"};

-- Shaman
SMARTBUFF_SHAMAN = { };
SMARTBUFF_SHAMAN[1] = {"Bouclier de foudre", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[2] = {"Arme croque-roc", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[3] = {"Arme de glace", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[4] = {"Arme langue de feu", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[5] = {"Arme furie-des-vents", SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[6] = {"Respiration aquatique", SMARTBUFF_CONST_GROUP, {22}};

-- Warrior
SMARTBUFF_WARRIOR = { };
SMARTBUFF_WARRIOR[1] = {"Cri de guerre", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[2] = {"Furie berzerker", SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[3] = {"Bloodrage", SMARTBUFF_CONST_SELF}; -- NOT TRANSLATED

-- Rogue
SMARTBUFF_ROGUE = { };
SMARTBUFF_ROGUE[1] = {"D\195\169tection des pi\195\168ges", SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[2] = {"D\195\169luge de lames", SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[3] = {"Evasion", SMARTBUFF_CONST_SELF};

-- Paladin
SMARTBUFF_PALADIN = { };
SMARTBUFF_PALADIN[1] = {"Righteous Fury", SMARTBUFF_CONST_SELF}; -- NOT TRANSLATED
SMARTBUFF_PALADIN[2] = {"Bouclier divin", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[3] = {"Aura de d\195\169votion", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[4] = {"Aura de vindicte", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[5] = {"Aura de concentration", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[6] = {"Aura de r\195\169sistance \195\160 l'ombre", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[7] = {"Aura de r\195\169sistance au givre", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[8] = {"Aura de r\195\169sistance au feu", SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[9] = {"Aura de saintet\195\169", SMARTBUFF_CONST_SELF};


-- Tracking
SMARTBUFF_TRACKING = { };
SMARTBUFF_TRACKING[1]  = {"D\195\169couverte de gisements", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[2]  = {"D\195\169couverte d\'herbes", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[3]  = {"D\195\169couverte de tr\195\169sors", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[4]  = {"Pistage des humano\195\175des", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[5]  = {"Pistage des b\195\170tes", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[6]  = {"Pistage des morts-vivants", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[7]  = {"Pistage des camoufl\195\169s", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[8]  = {"Pistage des \195\169l\195\169mentaires", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[9]  = {"Pistage des d\195\169mons", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[10] = {"Pistage des g\195\169ants", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[11] = {"Pistage des draconiens", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[12] = {"Sentir les d\195\169mons", SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[13] = {"Sentir les morts-vivants", SMARTBUFF_CONST_TRACK};

-- Creature type
SMARTBUFF_HUMANOID  = "Humano\195\175de";
SMARTBUFF_DEMON     = "D\195\169mon";
SMARTBUFF_BEAST     = "B\195\170te";
SMARTBUFF_DEMONTYPE = "Diablotin";

-- Mount
SMARTBUFF_MOUNT = "Augmente la vitesse de (%d+)%%.";

-- Options Frame Text
SMARTBUFF_OFT                = "ON/OFF Smart Buff";
SMARTBUFF_OFT_MENU           = "Afficher/Cacher le menu d\'options";
SMARTBUFF_OFT_AUTO           = "Rappel";
SMARTBUFF_OFT_AUTOTIMER      = "V\195\169rification";
SMARTBUFF_OFT_AUTOCOMBAT     = "En combat";
SMARTBUFF_OFT_AUTOCHAT       = "Chat";
SMARTBUFF_OFT_AUTOSPLASH     = "Splash";
SMARTBUFF_OFT_AUTOSOUND      = "Son";
SMARTBUFF_OFT_AUTOREST       = "D\195\169sactiver en ville";
SMARTBUFF_OFT_HUNTERPETS     = "Buff: Pets Chasseur";
SMARTBUFF_OFT_WARLOCKPETS    = "Buff: Pets D\195\169mo.";
SMARTBUFF_OFT_ARULES         = "R\195\168gles avanc\195\169es";
SMARTBUFF_OFT_GRP            = "Sous Groupe Raid \195\160 Buffer";
SMARTBUFF_OFT_SUBGRPCHANGED  = "Ouvrir le menu d\'options, lorsque \n le sous groupe a chang\195\169";
SMARTBUFF_OFT_BUFFS          = "Buffs";
SMARTBUFF_OFT_TARGET         = "Buffs la cible s\195\169lectionn\195\169e";
SMARTBUFF_OFT_DONE           = "Quitter";
SMARTBUFF_OFT_APPLY          = "Appliquer";
SMARTBUFF_OFT_GRPBUFFSIZE    = "Taille: Groupe";
SMARTBUFF_OFT_MESSAGES       = "D\195\169sactiver messages";
SMARTBUFF_OFT_MSGNORMAL      = "normal";
SMARTBUFF_OFT_MSGWARNING     = "avertissement";
SMARTBUFF_OFT_MSGERROR       = "erreur";

-- Options Frame Tooltip Text
SMARTBUFF_OFTT               = "ON/OFF SmartBuff";
SMARTBUFF_OFTT_AUTO          = "ON/OFF le rappel de buff";
SMARTBUFF_OFTT_AUTOTIMER     = "D\195\169lai en secondes entre deux v\195\169rifications.";
SMARTBUFF_OFTT_AUTOCOMBAT    = "Lance une v\195\169rification en combat.";
SMARTBUFF_OFTT_AUTOCHAT      = "Affiche dans le chat un message lorsque le buff est expir\195\169.";
SMARTBUFF_OFTT_AUTOSPLASH    = "Affiche un message au milieu de l\'\195\169cran \nlorsque le buff est expir\195\169.";
SMARTBUFF_OFTT_AUTOSOUND     = "Joue un son is les buffs sont expir\195\169s.";
SMARTBUFF_OFTT_AUTOREST      = "D\195\169sactiver le rappel en capitale villes.";
SMARTBUFF_OFTT_HUNTERPETS    = "Buff les pets de Chasseur.";
SMARTBUFF_OFTT_WARLOCKPETS   = "Buff les pets de D\195\169moniste, except\195\169 le " .. SMARTBUFF_DEMONTYPE .. ".";
SMARTBUFF_OFTT_ARULES        = "Ne peut \195\170tre lanc\195\169:\n- Epines sur Mages, Pr\195\170tres et D\195\169monistes\n- Intelligence des Arcanes sur des unit\195\169s sans Mana\n- Esprit Divin sur des unit\195\169s sans Mana";
SMARTBUFF_OFTT_SUBGRPCHANGED = "Ouvre Automatiquement le menu d\'options de SmartBuff,\nlorsque vous avez chang\195\169 de sous groupe.";
SMARTBUFF_OFTT_GRPBUFFSIZE   = "Le nombre de joueurs que vous avez \ndans le groupe pour utiliser le Buff de groupe.";

-- Messages
SMARTBUFF_MSG_LOADED         = "lanc\195\169";
SMARTBUFF_MSG_NOTLOADED      = "Arr\195\170t\195\169: le joueur n\'est pas un Druide/Mage/Pr\195\170tre/D\195\169moniste/Chasseur";
SMARTBUFF_MSG_DISABLED       = "Smart Buff est d\195\169sactiv\195\169";
SMARTBUFF_MSG_SUBGROUP       = "Vous avez joint un nouveau sous groupe, merci de v\195\169rifier les options!";
SMARTBUFF_MSG_NOTHINGTODO    = "Tous les Buffs sont deja lanc\195\169s";
SMARTBUFF_MSG_BUFFED         = "Appliqu\195\169";
SMARTBUFF_MSG_OOR            = "Est hors de port\195\169 pour \195\170tre buff!";
SMARTBUFF_MSG_CD             = "est expir\195\169!";
SMARTBUFF_MSG_CHAT           = "Impossible en mode chat!";
SMARTBUFF_MSG_SHAPESHIFT     = "Le lancement du sort ne peux pas se faire sous cette forme!";
SMARTBUFF_MSG_NOACTIONSLOT   = "a besoin d\'un emplacement dans une barre d'action pour fonctionner correctement!";
SMARTBUFF_MSG_GROUP          = "Groupe";
SMARTBUFF_MSG_NEEDS          = "a besoin de";
SMARTBUFF_MSG_OOM            = "Pas assez de mana/rage/\195\169nergie!";
SMARTBUFF_MSG_STOCK          = "Stock actuel de";
SMARTBUFF_MSG_NOREAGENT      = "Pas de r\195\169actif:";
SMARTBUFF_MSG_DEACTIVATED    = "d\195\169sactivat\195\169!";

end
