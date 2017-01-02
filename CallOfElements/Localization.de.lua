--[[ ----------------------------------------------------------------

			G E R M A N

-------------------------------------------------------------------]]

if( GetLocale() == "deDE" ) then

-- Errors
-- -------
COESTR_NOTASHAMAN = "Ihr seid kein Schamane. Entlade Call Of Elements";
COESTR_NOTOTEM = "Noch kein Totem verf\195\188gbar";
COESTR_UI_NOTASSIGNED = "<Kein Text zugewiesen>";
COESTR_INVALIDELEMENT = "Unbekannter Elementname im Totem gefunden: ";


-- Notifications
-- --------------
COESTR_TOTEMWARNING = "%s l\195\164uft in %d Sekunden ab";
COESTR_TOTEMEXPIRED = "%s ist abgelaufen";
COESTR_TOTEMDESTROYED = "%s wurde ZERST\195\150RT";
COESTR_SWITCHTOSET = "%s Totemset aktiviert";
COESTR_FIXEDSETS = "Die Lokalisierung der Elementreihenfolgen Eurer Totemsets wurden korrigiert.";
COESTR_UDATEDSAVED = "Gespeicherte Einstellungen aktualisiert auf Version ";
COESTR_FIXEDDISPLAY = "Es wurden Fehler in den gespeicherten Einstellungen behoben.";
COESTR_TOTEMSRELOADED = "Totems wurden neu geladen";
COESTR_RESTARTINGSET = "Aktives Set wurde erneuert";
COESTR_RESET = "Timer wurden zur\195\188ckgesetzt";
COESTR_HEALCOOLDOWN = " ist noch nicht bereit!";
COESTR_NOHEALING = "Keine Heilung n\195\182tig";
COESTR_HEALING = "Heile %s mit %s (Rang %d)";
COESTR_HEALLOWERRANK = "Nicht genug Mana. Benutze stattdessen Rang %d";
COESTR_HEALOOM = "Kein Mana mehr!";


-- String patterns
-- ----------------
COESTR_SCANTOTEMS = "Totem";
COESTR_TOTEMTOOLS = "Werkzeuge: (.*)totem";
COESTR_TOTEMMANA = "(%d*) Mana";
COESTR_TOTEMRANK = "Rang (%d)";
COESTR_MINUTEDURATION = "(%d[%.,]%d%d) Min";
COESTR_MINUTEDURATION_INT = "(%d) Min";
COESTR_SECDURATION = "(%d%d?) Sek";
COESTR_CASTBYNAME = "%(Rang (%d)%)";
COESTR_TOTEMDAMAGE = { ".+ trifft (Totem .-) ?%u*%.? kritisch f\195\188r (%d+).",
	".+ trifft (Totem .-) ?%u*%.? f\195\188r (%d+)." }; 
COESTR_TOTEMHEALTH = { "(%d*) Punkt%(en%) Gesundheit"; "(%d*) Gesundheit" }; 
COESTR_SHOCKSPELL = "(%a*schock)";
COESTR_HEALINGWAVE = "Welle der Heilung";
COESTR_LESSERWAVE = "Geringe Welle der Heilung";
COESTR_MINAMOUNT = "(%d*) bis";
COESTR_MAXAMOUNT = "bis (%d*)";
COESTR_TRINKET = "^.*%[Entz\195\188ckter Wassergeist%].*$"; 


-- Totem Advisor
-- --------------
COESTR_POISON = "Gift";
COESTR_DISEASE = "Krankheit";
COESTR_TOTEMPOISON = "Totem der Giftreinigung";
COESTR_TOTEMDISEASE = "Totem der Krankheitsreinigung";
COESTR_TOTEMTREMOR = "Totem des Erdsto\195\159es";
COESTR_CLEANSINGTOTEM = "Jetzt %s werfen!";

COESTR_TREMOR = {
	"Schlaf", "Terrify", "Psychic Scream", "Mind Control", "Dr\195\182hnendes Gebr\195\188ll", "Fear",
	"Intimidating Shout", "Panic", "Terrifying Screech", "Seduction",
	"Howl of Terror", "Einsch\195\188chterndes Knurren"
}


-- Tools
-- ---------
COESTR_TOTEMTOOLS_EARTH = "Erd";
COESTR_TOTEMTOOLS_FIRE = "Feuer";
COESTR_TOTEMTOOLS_WATER = "Wasser";
COESTR_TOTEMTOOLS_AIR = "Luft";


-- Elements
-- ---------
COESTR_ELEMENT_EARTH = "Erde";
COESTR_ELEMENT_FIRE = "Feuer";
COESTR_ELEMENT_WATER = "Wasser";
COESTR_ELEMENT_AIR = "Luft";


-- UI elements
-- ------------
COEUI_STRINGS = {
COE_ConfigClose = "Schlie\195\159en";
COE_ConfigTotemTabPanel = "Totemoptionen";
COE_ConfigHealingTabPanel = "Heilungsoptionen";
COE_ConfigDebuffTabPanel = "Debuff-Optionen";
COE_ConfigTotemTotemBar = "Totemleisten";
COE_ConfigTotemTotemOptions = "Optionen";
COE_ConfigTotemTotemSets = "Totem Sets";
COE_OptionEnableTotemBar = "Totemleiste aktivieren";
COE_OptionHideBackdrop = "Hintergrund verbergen wenn inaktiv";
COE_OptionEnableTimers = "Totem Timer aktivieren";
COE_OptionEnableTimerNotifications = "Warnungen anzeigen";
COE_OptionTTAlignment = "Tooltip Ausrichtung";
COE_OptionDisplayMode = "Ankerbutton";
COE_OptionDisplayAlignment = "Anordnung";
COE_OptionAdvisor = "Totemvorschl\195\164ge aktivieren";
COE_OptionEnableSets = "Totem Sets aktivieren";
COE_OptionEnableAutoSwitch = "Sets im PVP automatisch wechseln";
COE_OptionActiveSet = "Aktives Totemset";
COE_OptionNewSet = "Neues Set";
COE_OptionDeleteSet = "Set l\195\182schen";
COE_OptionConfigureSet = "Set konfigurieren";
COE_OptionStopConfigureSet = "OK";
COE_OptionCastOrderString = "Reihenfolge";
COE_OptionConfigureBar = "Totems konfigurieren";
COE_OptionFixBar = "Totemleisten fixieren";
COE_OptionConfigureOrder = "Totemreihenfolge";
COE_OptionScanTotems = "Totems neu laden";
COE_OptionCurrentFrame = "Leiste konfigurieren";
COE_OptionDirection = "Ausrichtung";
COE_OptionFrameMode = "Modus";
COE_OptionFlexCount = "Statische Buttons";
COE_OptionScaling = "Skalierung";
COE_OptionEnableTimerFrame = "Separates Timerfenster anzeigen";
COE_OptionOverrideRank = "Rang 1 Taste";
COE_OptionGroupBars = "Leisten als Gruppe ziehen";
COE_OptionFrameTimersOnly = "Timer NUR im Timerfenster anzeigen";
}


-- Tooltips
-- ---------
COEUI_TOOLTIPS = {
COE_ConfigTotemTab = "Zeigt die Totemoptionen an";
COE_ConfigHealingTab = "Zeigt die Heilungs-Optionen an";
COE_ConfigDebuffTab = "Zeigt die Debuff-Optionen an";
COE_OptionEnableTotemBar = "Aktiviert die Totemleiste,\ndie alle verf\195\188gbaren Totems\nzur schnellen Benutzung anzeigt";
COE_OptionHideBackdrop = "Verbirgt den Hintergrund wenn sich\ndie Maus nicht über der Totemleiste befindet";
COE_OptionEnableTimers = "Aktiviert die Anzeige der noch\nverbleibenden Totemzeit in den Totembuttons";
COE_OptionEnableTimerNotifications = "Zeigt Warnungen an, wenn ein Totem\nabl\195\164uft oder zerst\195\182rt wird";
COE_OptionAdvisor = "Benachrichtigt Euch wenn Ihr oder ein Mitglied\nEurer Gruppe einen Debuff hat,\nder mit einem eurer Totems heilbar ist";
COE_OptionEnableAutoSwitch = "Aktiviert automatisch das passende Totemset,\nwenn ein feindlicher Spieler angew\195\164hlt wird";
COE_OptionFixBar = "Fixiert die Totemleiste, so dass sie nicht mehr\nversehentlich verschoben werden kann";
COE_OptionGroupBars = "Wenn Ihr eine Leiste zieht,\nfolgen die anderen Leisten der Bewegung";
}

COESTR_TRINKET_TOOLTIP = "Entz\195\188ckter Wassergeist"; 
COESTR_TRINKET_TOTEM = "Uraltes Totem der Manaquelle";


-- Combo boxes
-- ------------
COEUI_TTALIGN = {
{ "ANCHOR_TOPLEFT"; "Oben links" };
{ "ANCHOR_LEFT"; "Links" };
{ "ANCHOR_BOTTOMLEFT"; "Unten links" }; 
{ "ANCHOR_TOPRIGHT"; "Oben rechts" };
{ "ANCHOR_RIGHT"; "Rechts" };
{ "ANCHOR_BOTTOMRIGHT"; "Unten rechts" };
{ "DISABLED"; "Deaktiviert" };
}

COEUI_DISPLAYMODE = { "Benutzerdefiniert", "Nur Timer", "Aktives Set" }

COEUI_DISPLAYALIGN = { "Box", "Vertikal", "Horizontal" }

COEUI_PVPSETS = { "[PVP] Druide", "[PVP] Hexer", "[PVP] J\195\164ger", "[PVP] Krieger", "[PVP] Magier", 
	"[PVP] Paladin", "[PVP] Priester", "[PVP] Schamane", "[PVP] Schurke" }
COEUI_DEFAULTSET = "Standardset";

COEUI_OVERRIDERANK = { "Keine Taste", "Mit SHIFT", "Mit ALT", "Mit STRG" };

COEUI_CURRENTFRAME = { "Erde", "Feuer", "Wasser", "Luft" };

COEUI_DIRECTION = { "Hoch", "Runter", "Links", "Rechts" };

COEUI_FRAMEMODE = { "Geschlossen", "Offen", "Flex", "Unsichtbar" };


-- Key bindings
-- -------------
BINDING_HEADER_CALLOFELEMENTS = "Call Of Elements";
BINDING_NAME_COESHOWCONFIG = "Konfigurationsdialog anzeigen";
BINDING_NAME_COEBESTHEAL = "Beste Heilung";
BINDING_NAME_COEBATTLEHEAL = "Kampf-Heilung";
BINDING_NAME_COETHROWADVISED = "Vorgeschlagenen Totem werfen";
BINDING_NAME_COENEXTSET = "Zum n\195\164chsten Totemset wechseln ";
BINDING_NAME_COETHROWSET = "Das aktive Totemset werfen";
BINDING_NAME_COERESTARTSET = "Das aktive Totemset erneuern";
BINDING_NAME_TOTEMEARTH1 = "Erdtotem #1";
BINDING_NAME_TOTEMEARTH2 = "Erdtotem #2";
BINDING_NAME_TOTEMEARTH3 = "Erdtotem #3";
BINDING_NAME_TOTEMEARTH4 = "Erdtotem #4";
BINDING_NAME_TOTEMEARTH5 = "Erdtotem #5";
BINDING_NAME_TOTEMFIRE1 = "Feuertotem #1";
BINDING_NAME_TOTEMFIRE2 = "Feuertotem #2";
BINDING_NAME_TOTEMFIRE3 = "Feuertotem #3";
BINDING_NAME_TOTEMFIRE4 = "Feuertotem #4";
BINDING_NAME_TOTEMFIRE5 = "Feuertotem #5";
BINDING_NAME_TOTEMWATER1 = "Wassertotem #1";
BINDING_NAME_TOTEMWATER2 = "Wassertotem #2";
BINDING_NAME_TOTEMWATER3 = "Wassertotem #3";
BINDING_NAME_TOTEMWATER4 = "Wassertotem #4";
BINDING_NAME_TOTEMWATER5 = "Wassertotem #5";
BINDING_NAME_TOTEMWATER6 = "Wassertotem #6";
BINDING_NAME_TOTEMAIR1 = "Lufttotem #1";
BINDING_NAME_TOTEMAIR2 = "Lufttotem #2";
BINDING_NAME_TOTEMAIR3 = "Lufttotem #3";
BINDING_NAME_TOTEMAIR4 = "Lufttotem #4";
BINDING_NAME_TOTEMAIR5 = "Lufttotem #5";
BINDING_NAME_TOTEMAIR6 = "Lufttotem #6";
BINDING_NAME_TOTEMAIR7 = "Lufttotem #7";


-- Key modifiers
-- --------------
COEMODIFIER_ALT = "ALT";
COEMODIFIER_ALT_SHORT = "A";
COEMODIFIER_CTRL = "STRG";
COEMODIFIER_CTRL_SHORT = "ST";
COEMODIFIER_SHIFT = "SHIFT";
COEMODIFIER_SHIFT_SHORT = "S";
COEMODIFIER_NUMPAD = "Num Pad";
COEMODIFIER_NUMPAD_SHORT = "NP";


-- Shell commands
-- ---------------
COESHELL_INTRO = "Verf\195\188gbare Befehle f\195\188r Call Of Elements:";
COESHELL_CONFIG = "'/coe' oder '/coe config' - Zeigt den Konfigurationsdialog an";
COESHELL_LIST = "'/coe list' - Zeigt diese Liste an";
COESHELL_NEXTSET = "'/coe nexset' - Wechselt zum n\195\164chsten Benutzerset oder zum Standardset";
COESHELL_PRIORSET = "'/coe priorset' - Wechselt zum vorherigen Benutzerset oder zum Standardset";
COESHELL_SET = "'/coe set <name>' - Wechselt zum Set mit dem angegebenen Namen. Gro\195\159-/Kleinschreibung ist wichtig";
COESHELL_RESTARTSET = "'/coe restartset' - Totems werden neu geworfen, wenn das aktive Set das n\195\164chste Mal geworfen wird";
COESHELL_RESET = "'/coe reset' - Setzt alle Timer und das aktive Set zurück";
COESHELL_RESETFRAMES = "'/coe resetframes' - Alle Leisten kehren zur Mitte des Bildschirms zurück";
COESHELL_RESETORDERING = "'/coe resetordering' - Setzt die Reihenfolgen der Totems zurück";
COESHELL_RELOAD = "'/coe reload' - Lädt alle Totems und Sets neu";
COESHELL_MACRONOTE = "Die folgenden Befehle funktionieren nur als Makros auf einem Action Button:";
COESHELL_THROWSET = "'/coe throwset' - Wirft den n\195\164chsten Totem des aktiven Totemsets";
COESHELL_ADVISED = "'/coe advised' - Wirft den n\195\164chsten vorgeschlagenen Totem";

end
