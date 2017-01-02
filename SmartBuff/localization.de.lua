-------------------------------------------------------------------------------
-- German localization
-------------------------------------------------------------------------------

if (GetLocale() == "deDE") then
	
-- Bindings
BINDING_NAME_SMARTBUFF_BIND_TRIGGER = "Trigger";
BINDING_NAME_SMARTBUFF_BIND_TARGET  = "Ziel";
BINDING_NAME_SMARTBUFF_BIND_OPTIONS = "Optionen";
BINDING_NAME_SMARTBUFF_BIND_RESETBUFFTIMERS = "Buff Timer l\195\182schen";

-- Druid
SMARTBUFF_DRUID_CAT = "Katzengestalt";
SMARTBUFF_DRUID_MOONKIN = "Moonkingestalt";
SMARTBUFF_DRUID_TRACK = "Humanoide aufsp\195\188ren";
SMARTBUFF_DRUID = { };
SMARTBUFF_DRUID[1] = {"Mal der Wildnis", 30, SMARTBUFF_CONST_GROUP, {1,10,20,30,40,50,60}, "WPET", "Gabe der Wildnis", 60, {50,60}, {"Wilde Beeren","Wilder Dornwurz"}};
SMARTBUFF_DRUID[2] = {"Dornen", 10, SMARTBUFF_CONST_GROUP, {6,14,24,34,44,54}, "MAGE;PRIEST;WARLOCK;WPET;" .. SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[3] = {"Omen der Klarsicht", 10, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[4] = {"Baumrinde", 0.25, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[5] = {"Griff der Natur", 0.75, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[6] = {"Tigerfuror", 0.1, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_CAT};

-- Mage
SMARTBUFF_MAGE = { };
SMARTBUFF_MAGE[1] = {"Arkane Intelligenz", 30, SMARTBUFF_CONST_GROUP, {1,14,28,42,56}, "ROGUE;WARRIOR;HPET;WPET", "Arkane Brillanz", 60, {56}, {"Arkanes Pulver"}};
SMARTBUFF_MAGE[2] = {"Eisr\195\188stung", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[3] = {"Frostr\195\188stung", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[4] = {"Magische R\195\188stung", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[5] = {"Magie d\195\164mpfen", 10, SMARTBUFF_CONST_GROUP, {12,24,36,48,60}, "HPET;WPET"};
SMARTBUFF_MAGE[6] = {"Magie verst\195\164rken", 10, SMARTBUFF_CONST_GROUP, {18,30,42,54}, "HPET;WPET"};
SMARTBUFF_MAGE[7] = {"Manaschild", 1, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[8] = {"Feuerzauberschutz", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[9] = {"Frostzauberschutz", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[10] = {"Eisbarriere", 1, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE_PATTERN = {"r\195\188stung$"};

-- Priest
SMARTBUFF_PRIEST = { };
SMARTBUFF_PRIEST[1] = {"Machtwort: Seelenst\195\164rke", 30, SMARTBUFF_CONST_GROUP, {1,12,24,36,48,60}, "WPET", "Gebet der Seelenst\195\164rke", 60, {48,60}, {"Heilige Kerze","Hochheilige Kerze"}};
SMARTBUFF_PRIEST[2] = {"Schattenschutz", 10, SMARTBUFF_CONST_GROUP, {30,42,56}, "WPET", "Gebet des Schattenschutzes", 20, {56}, {"Hochheilige Kerze"}};
SMARTBUFF_PRIEST[3] = {"Inneres Feuer", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[4] = {"G\195\182ttlicher Willen", 30, SMARTBUFF_CONST_GROUP, {40,42,54,60}, "ROGUE;WARRIOR;HPET;WPET", "Gebet der Willenskraft", 60, {60}, {"Hochheilige Kerze"}};
SMARTBUFF_PRIEST[5] = {"Machtwort: Schild", 0.5, SMARTBUFF_CONST_GROUP, {6,12,18,24,30,36,42,48,54,60}, "MAGE;WARLOCK;ROGUE;PALADIN;WARRIOR;DRUID;HUNTER;SHAMAN;HPET;WPET"};
SMARTBUFF_PRIEST[6] = {"Furchtzauberschutz", 10, SMARTBUFF_CONST_GROUP, {20}};
SMARTBUFF_PRIEST[7] = {"Elunes Anmut", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[8] = {"R\195\188ckkopplung", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[9] = {"Schattenwache", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[10] = {"Ber\195\188hrung der Schw\195\164che", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[11] = {"Innerer Fokus", -1, SMARTBUFF_CONST_SELF};

-- Warlock
SMARTBUFF_WARLOCK = { };
SMARTBUFF_WARLOCK[1] = {"D\195\164monenr\195\188stung", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[2] = {"D\195\164monenhaut", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[3] = {"Unendlicher Atem", 10, SMARTBUFF_CONST_GROUP, {16}, "HPET;WPET"};
SMARTBUFF_WARLOCK[4] = {"Gro\195\159e Unsichtbarkeit entdecken", 10, SMARTBUFF_CONST_GROUP, {50}, "HPET;WPET"};
SMARTBUFF_WARLOCK[5] = {"Unsichtbarkeit entdecken", 10, SMARTBUFF_CONST_GROUP, {38}, "HPET;WPET"};
SMARTBUFF_WARLOCK[6] = {"Geringe Unsichtbarkeit entdecken", 10, SMARTBUFF_CONST_GROUP, {26}, "HPET;WPET"};
SMARTBUFF_WARLOCK[7] = {"Seelenverbindung", 0, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK_PATTERN = {"^D\195\164monen%a+", "Unsichtbarkeit entdecken$"};

-- Hunter
SMARTBUFF_HUNTER = { };
SMARTBUFF_HUNTER[1] = {"Aura des Volltreffers", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[2] = {"Schnellfeuer", 0.2, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[3] = {"Aspekt des Falken", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[4] = {"Aspekt des Affen", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[5] = {"Aspekt der Wildnis", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[6] = {"Aspekt des Wildtiers", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER_PATTERN = {"^Aspekt de%a %a+"};

-- Shaman
SMARTBUFF_SHAMAN = { };
SMARTBUFF_SHAMAN[1] = {"Blitzschlagschild", 10, SMARTBUFF_CONST_SELF};
--SMARTBUFF_SHAMAN[2] = {"Felsbei\195\159erwaffe", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[2] = {"Waffe des Felsbei\195\159ers", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[3] = {"Waffe des Frostbrands", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[4] = {"Waffe der Flammenzunge", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[5] = {"Waffe des Windzorns", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[6] = {"Wasseratmung", 10, SMARTBUFF_CONST_GROUP, {22}};

-- Warrior
SMARTBUFF_WARRIOR = { };
SMARTBUFF_WARRIOR[1] = {"Schlachtruf", 2, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[2] = {"Berserkerwut", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[3] = {"Blutrausch", 0.165, SMARTBUFF_CONST_SELF};

-- Rogue
SMARTBUFF_ROGUE = { };
SMARTBUFF_ROGUE[1]  = {"Klingenwirbel", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[2]  = {"Zerh\195\164ckseln", 0.2, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[3]  = {"Entrinnen", 0.2, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[4]  = {"Sofort wirkendes Gift VI", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[5]  = {"Sofort wirkendes Gift V", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[6]  = {"Sofort wirkendes Gift IV", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[7]  = {"Sofort wirkendes Gift III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[8]  = {"Sofort wirkendes Gift II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[9]  = {"Sofort wirkendes Gift", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[10] = {"Wundgift IV", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[11] = {"Wundgift III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[12] = {"Wundgift II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[13] = {"Wundgift", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[14] = {"Gedankenbenebelndes Gift III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[15] = {"Gedankenbenebelndes Gift II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[16] = {"Gedankenbenebelndes Gift", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[17] = {"T\195\182dliches Gift IV", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[18] = {"T\195\182dliches Gift III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[19] = {"T\195\182dliches Gift II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[20] = {"T\195\182dliches Gift", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[21] = {"Verkr\195\188ppelndes Gift II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[22] = {"Verkr\195\188ppelndes Gift", 30, SMARTBUFF_CONST_INV};

-- Paladin
SMARTBUFF_PALADIN = { };
SMARTBUFF_PALADIN[1]  = {"Zorn der Gerechtigkeit", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[2]  = {"Heiliger Schild", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[3]  = {"Segen der Macht", 5, SMARTBUFF_CONST_GROUP, {4,12,22,32,42,52,60}, "DRUID;MAGE;PRIEST;SHAMAN;WARLOCK;WPET", "Gro\195\159er Segen der Macht", 15, {52,60}, {"Symbol der K\195\182nige","Symbol der K\195\182nige"} };
SMARTBUFF_PALADIN[4]  = {"Segen der Weisheit", 5, SMARTBUFF_CONST_GROUP, {14,24,34,44,54,60}, "ROGUE;SHAMAN;WARRIOR;HPET;WPET", "Gro\195\159er Segen der Weisheit", 15, {54,60}, {"Symbol der K\195\182nige","Symbol der K\195\182nige"} };
SMARTBUFF_PALADIN[5]  = {"Segen der Rettung", 5, SMARTBUFF_CONST_GROUP, {26}, "SHAMAN;WARRIOR;HPET;WPET", "Gro\195\159er Segen der Rettung", 15, {60}, {"Symbol der K\195\182nige"} };
SMARTBUFF_PALADIN[6]  = {"Segen der K\195\182nige", 5, SMARTBUFF_CONST_GROUP, {20}, "SHAMAN;WPET", "Gro\195\159er Segen der K\195\182nige", 15, {60}, {"Symbol der K\195\182nige"} };
SMARTBUFF_PALADIN[7]  = {"Segen des Refugiums", 5, SMARTBUFF_CONST_GROUP, {30,40,50,60}, "DRUID;HUNTER;MAGE;PRIEST;ROGUE;SHAMAN;WARLOCK;HPET;WPET", "Gro\195\159er Segen des Refugiums", 15, {60}, {"Symbol der K\195\182nige"} };
SMARTBUFF_PALADIN[8]  = {"Segen des Lichts", 5, SMARTBUFF_CONST_GROUP, {40,50,60}, "SHAMAN;WPET", "Gro\195\159er Segen des Lichts", 15, {60}, {"Symbol der K\195\182nige"} };
--SMARTBUFF_PALADIN[9]  = {"Segen der Freiheit", 0.165, SMARTBUFF_CONST_GROUP, {18}};
--SMARTBUFF_PALADIN[10] = {"Segen des Schutzes", 1, SMARTBUFF_CONST_GROUP, {10,24,38}};
SMARTBUFF_PALADIN[9]  = {"Siegel des Befehls", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[10] = {"Siegel des Furors", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[11] = {"Siegel der Gerechtigkeit", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[12] = {"Siegel des Lichts", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[13] = {"Siegel der Rechtschaffenheit", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[14] = {"Siegel der Weisheit", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[15] = {"Siegel des Kreuzfahrers", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[16] = {"Aura der Hingabe", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[17] = {"Aura der Vergeltung", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[18] = {"Aura der Konzentration", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[19] = {"Aura des Schattenwiderstands", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[20] = {"Aura des Frostwiderstands", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[21] = {"Aura des Feuerwiderstands", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[22] = {"Aura der Heiligkeit", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN_PATTERN = {"^Siegel de%a %a+"};


-- Stones and oils
SMARTBUFF_WEAPON = { };
SMARTBUFF_WEAPON[1]  = {"Rauer Wetzstein", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[2]  = {"Grober Wetzstein", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[3]  = {"Schwerer Wetzstein", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[4]  = {"Robuster Wetzstein", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[5]  = {"Verdichteter Wetzstein", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[6]  = {"Elementarwetzstein", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[7]  = {"Rauer Gewichtsstein", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[8]  = {"Grober Gewichtsstein", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[9]  = {"Schwerer Gewichtsstein", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[10] = {"Robuster Gewichtsstein", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[11] = {"Verdichteter Gewichtsstein", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[12] = {"Schatten\195\182l", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[13] = {"Frost\195\182l", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[14] = {"Schwaches Mana\195\182l", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[15] = {"Geringes Mana\195\182l", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[16] = {"Hervorragendes Mana\195\182l", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[17] = {"Schwaches Zauber\195\182l", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[18] = {"Geringes Zauber\195\182l", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[19] = {"Zauber\195\182l", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[20] = {"Hervorragendes Zauber\195\182l", 30, SMARTBUFF_CONST_INV};

SMARTBUFF_WEAPON_STANDARD = {"Dolche", "\195\164xte", "schwerter", "streitkolben", "St\195\164be", "Faustwaffen"};
SMARTBUFF_WEAPON_BLUNT = {"streitkolben", "Faustwaffen", "St\195\164be"};
SMARTBUFF_WEAPON_BLUNT_PATTERN = "Gewichtsstein$";
SMARTBUFF_WEAPON_SHARP = {"Dolche", "\195\164xte", "schwerter", "Stangenwaffen"};
SMARTBUFF_WEAPON_SHARP_PATTERN = "Wetzstein$";

-- Tracking
SMARTBUFF_TRACKING = { };
SMARTBUFF_TRACKING[1]  = {"Mineraliensuche", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[2]  = {"Kr\195\164utersuche", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[3]  = {"Schatzsucher", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[4]  = {"Humanoide aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[5]  = {"Wildtiere aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[6]  = {"Untote aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[7]  = {"Verborgenes aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[8]  = {"Elementare aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[9]  = {"D\195\164monen aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[10] = {"Riesen aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[11] = {"Drachkin aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[12] = {"D\195\164monen Sp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[13] = {"Untote Sp\195\188ren", -1, SMARTBUFF_CONST_TRACK};

-- Racial
SMARTBUFF_RACIAL = { };
SMARTBUFF_RACIAL[1]  = {"Steinform", 0.133, SMARTBUFF_CONST_SELF}; -- Dwarv
SMARTBUFF_RACIAL[2]  = {"Wachsamkeit", 0.333, SMARTBUFF_CONST_SELF}; -- Human
SMARTBUFF_RACIAL[3]  = {"Kochendes Blut", 0.416, SMARTBUFF_CONST_SELF}; -- Orc
SMARTBUFF_RACIAL[4]  = {"Berserker", 0.166, SMARTBUFF_CONST_SELF}; -- Troll
SMARTBUFF_RACIAL[5]  = {"Wille der Verlassenen", 0.083, SMARTBUFF_CONST_SELF}; -- Undead


-- Creature type
SMARTBUFF_HUMANOID  = "Humanoid";
SMARTBUFF_DEMON     = "D\195\164mon";
SMARTBUFF_BEAST     = "Wildtier";
SMARTBUFF_DEMONTYPE = "Wichtel";

-- Classes
SMARTBUFF_CLASSES = {"Druide", "J\195\164ger", "Magier", "Paladin", "Priester", "Schurke", "Schamane", "Hexenmeister", "Krieger", "J\195\164ger Pet", "Hexer Pet"};

-- Templates and Instances
SMARTBUFF_TEMPLATES = {"Solo", "Gruppe", "Raid", "Schlachtfeld", "MC", "Ony", "BWL", "AQ", "ZG", "Custom 1", "Custom 2", "Custom 3", "Custom 4", "Custom 5"};
SMARTBUFF_INSTANCES = {"Der geschmolzene Kern", "Onyxias Hort", "Pechschwingenhort", "Ahn'Qiraj", "Zul'Gurub", "Alteractal", "Arathi Becken", "Warsongschlucht"};

-- Mount
SMARTBUFF_MOUNT = "Erh\195\182ht Tempo um (%d+)%%.";


-- Options Frame Text
SMARTBUFF_OFT                = "SmartBuff An/Aus";
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
SMARTBUFF_OFT_BUFFS          = "Buffs/F\195\164higkeiten";
SMARTBUFF_OFT_TARGET         = "Bufft das anvisierte Ziel";
SMARTBUFF_OFT_DONE           = "Fertig";
SMARTBUFF_OFT_APPLY          = "\195\156bernehmen";
SMARTBUFF_OFT_GRPBUFFSIZE    = "Gruppengr\195\182sse";
SMARTBUFF_OFT_MESSAGES       = "Unterdr\195\188cke Meldungen";
SMARTBUFF_OFT_MSGNORMAL      = "Normal";
SMARTBUFF_OFT_MSGWARNING     = "Warnung";
SMARTBUFF_OFT_MSGERROR       = "Fehler";
SMARTBUFF_OFT_HIDEMMBUTTON   = "Verberge Minimap-Knopf";
SMARTBUFF_OFT_REBUFFTIMER    = "Rebuff Timer";
SMARTBUFF_OFT_AUTOSWITCHTMP  = "Vorlagenwechsel";
SMARTBUFF_OFT_SELFFIRST      = "Mich zuerst";
SMARTBUFF_OFT_SCROLLWHEEL    = "Bufft mit Scrollrad";
SMARTBUFF_OFT_TARGETSWITCH   = "bei Zielwechsel";
SMARTBUFF_OFT_BUFFTARGET     = "Bufft das Ziel";
SMARTBUFF_OFT_BUFFPVP        = "Buff PvP";
SMARTBUFF_OFT_AUTOSWITCHTMPINST = "Instanzen";
SMARTBUFF_OFT_CHECKCHARGES   = "Aufladungen";
SMARTBUFF_OFT_RBT            = "Reset BT";
SMARTBUFF_OFT_BUFFINCITIES   = "Bufft in St\195\164dten";
SMARTBUFF_OFT_CTRASYNC       = "CTRA Sync";
SMARTBUFF_OFT_ADVGRPBUFFCHECK = "Grp Buff Check";
SMARTBUFF_OFT_ADVGRPBUFFRANGE = "Grp Range Check";
SMARTBUFF_OFT_BLDURATION     = "Blacklisted";

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
SMARTBUFF_OFTT_HIDEMMBUTTON  = "Verbirgt den SmartBuff Minimap-Knopf.";
SMARTBUFF_OFTT_REBUFFTIMER   = "Wieviele Sekunden vor Ablauf der Buffs,\nsoll daran erinnert werden.\n0 = Deaktivert";
SMARTBUFF_OFTT_SELFFIRST     = "Bufft den eigenen Charakter immer zuerst.";
SMARTBUFF_OFTT_SCROLLWHEEL   = "Bufft beim Bewegen des Scrollrads vor und zur\195\188ck.";
SMARTBUFF_OFTT_TARGETSWITCH  = "Bufft beim Wechsel eines Ziels.";
SMARTBUFF_OFTT_BUFFTARGET    = "Bufft zuerst das aktuelle Ziel,\nfalls dies freundlich ist.";
SMARTBUFF_OFTT_BUFFPVP       = "Bufft auch Spieler im PvP Modus,\nwenn man selbst nicht im PvP ist.";
SMARTBUFF_OFTT_AUTOSWITCHTMP = "Wechselt automatisch die Buff-Vorlage,\nwenn der Gruppentyp sich \195\164ndert.";
SMARTBUFF_OFTT_AUTOSWITCHTMPINST = "Wechselt automatisch die Buff-Vorlage,\nwenn die Instanz sich \195\164ndert.";
SMARTBUFF_OFTT_CHECKCHARGES  = "Erinnerung wenn die Aufladungen\neines Buffs bald aufgebraucht sind.";
SMARTBUFF_OFTT_BUFFINCITIES  = "Bufft auch in den Hauptst\195\164dten.\nWenn du PvP geflagged bist, bufft es immer.";
SMARTBUFF_OFTT_CTRASYNC      = "Aktiviert die Synchronisation mit CTRA,\num die Buff-Zeiten der anderen Spieler zu erhalten.\nFunktioniert nur im Raid.";
SMARTBUFF_OFTT_ADVGRPBUFFCHECK = "Der erweiterte Gruppenbuff-Check\nbezieht auch die Einzelbuffs mitein,\nbevor ein Gruppenbuff benutzt wird.";
SMARTBUFF_OFTT_ADVGRPBUFFRANGE = "Der erweiterte Gruppenbuff-Distanz-Check\n\195\188berpr\195\188ft ob jedes Gruppenmitglied auch innerhalb der Buff-Distanz ist,\nbevor ein Gruppenbuff benutzt wird.";
SMARTBUFF_OFTT_BLDURATION    = "Wieviele Sekunden ein Spieler auf\ndie schwarze Liste gesetzt wird.\n0 = Deaktivert";

-- Buffsetup Frame Text
SMARTBUFF_BST_SELFONLY       = "Nur mich";
SMARTBUFF_BST_COMBATIN       = "Im Kampf";
SMARTBUFF_BST_COMBATOUT      = "Aus dem Kampf";
SMARTBUFF_BST_MAINHAND       = "Waffenhand";
SMARTBUFF_BST_OFFHAND        = "Schildhand";
SMARTBUFF_BST_REMINDER       = "Benachrichtigung";

-- Buffsetup Frame Tooltip Text
SMARTBUFF_BSTT_SELFONLY      = "Bufft nur dein eigenen Charakter."; 
SMARTBUFF_BSTT_COMBATIN      = "Bufft innerhalb des Kampfes.";
SMARTBUFF_BSTT_COMBATOUT     = "Bufft ausserhalb des Kampfes.";
SMARTBUFF_BSTT_MAINHAND      = "Bufft die Haupthand.";
SMARTBUFF_BSTT_OFFHAND       = "Bufft die Schildhand.";
SMARTBUFF_BSTT_REMINDER      = "Erinnerungs-Nachricht ausgeben.";
SMARTBUFF_BSTT_REBUFFTIMER   = "Wieviele Sekunden vor Ablauf des Buffs,\nsoll daran erinnert werden.\n0 = Globaler Rebuff Timer";

-- Messages
SMARTBUFF_MSG_LOADED         = "geladen";
SMARTBUFF_MSG_DISABLED       = "SmartBuff ist deaktiviert!";
SMARTBUFF_MSG_SUBGROUP       = "Du hast die Subgruppe gewechselt, bitte \195\188berpr\195\188fe die Einstellungen!";
SMARTBUFF_MSG_NOTHINGTODO    = "Nichts zu buffen";
SMARTBUFF_MSG_BUFFED         = "gebuffed";
SMARTBUFF_MSG_OOR            = "ist ausser Reichweite zum Buffen!";
--SMARTBUFF_MSG_CD             = "hat noch Cooldown";
SMARTBUFF_MSG_CD             = "Globaler Cooldown!";
SMARTBUFF_MSG_CHAT           = "nicht m\195\182glich \195\188ber Chat-Befehl!";
SMARTBUFF_MSG_SHAPESHIFT     = "In Verwandlung kann nicht gebufft werden!";
SMARTBUFF_MSG_NOACTIONSLOT   = "muss in einem Slot auf der Aktionsleiste sein, dass es funktioniert!";
SMARTBUFF_MSG_GROUP          = "Gruppe";
SMARTBUFF_MSG_NEEDS          = "ben\195\182tigt";
SMARTBUFF_MSG_OOM            = "Zuwenig Mana/Wut/Energie!";
SMARTBUFF_MSG_STOCK          = "Aktueller Bestand";
SMARTBUFF_MSG_NOREAGENT      = "Zuwenig";
SMARTBUFF_MSG_DEACTIVATED    = "deaktiviert!";
SMARTBUFF_MSG_REBUFF         = "ReBuff";
SMARTBUFF_MSG_LEFT           = "\195\188brig";
SMARTBUFF_MSG_CLASS          = "Klasse";
SMARTBUFF_MSG_CHARGES        = "Aufladungen";

end
