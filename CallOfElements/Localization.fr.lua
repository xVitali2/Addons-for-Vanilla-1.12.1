--[[ ----------------------------------------------------------------

			F R E N C H by mcaoua

-------------------------------------------------------------------]]
if( GetLocale() == "frFR" ) then


-- Errors
-- -------
COESTR_NOTASHAMAN = "Vous n'\195\70tes pas un chaman. Call Of Elements d\195\169sactiv\195\169";
COESTR_NOTOTEM = "Aucun totem n'est disponible";
COESTR_UI_NOTASSIGNED = "<Pas assign\195\169>";
COESTR_INVALIDELEMENT = "El\195\169ment invalide dans le totem: ";


-- Notifications
-- --------------
COESTR_TOTEMWARNING = "%s expire dans %d secondes";
COESTR_TOTEMEXPIRED = "%s a expir\195\169";
COESTR_TOTEMDESTROYED = "%s a \195\169t\195\169 DETRUIT";
COESTR_SWITCHTOSET = "%s set activ\195\169";
COESTR_FIXEDSETS = "Corrig\195\169 l'ordre de cast des sets.";
COESTR_UDATEDSAVED = "Param\195\168tres sauvegard\195\169s actualis\195\169s pour cette version ";
COESTR_FIXEDDISPLAY = "Corrig\195\169 les erreurs dans les param\195\168tres.";
COESTR_TOTEMSRELOADED = "Totems relanc\195\169";
COESTR_RESTARTINGSET = "Modifi\195\169 le set actif ";
COESTR_RESET = "Timers remis à z\195\169ro";
COESTR_HEALCOOLDOWN = " n'est pas encore pr\195\170t!";
COESTR_NOHEALING = "Pas besoin de soins";
COESTR_HEALING = "Soigne %s avec %s (Rang %d)";
COESTR_HEALLOWERRANK = "Pas assez de mana. Utilise le rang %d";
COESTR_HEALOOM = "Pas assez de mana!";


-- String patterns
-- ----------------
COESTR_SCANTOTEMS = "Totem";
COESTR_TOTEMTOOLS = "Outils..:.Totem.(.*)";
COESTR_TOTEMMANA = "Mana.:.(%d*)";
COESTR_TOTEMRANK = "Rang (%d)";
COESTR_MINUTEDURATION = "(%d%.%d%d) min";
COESTR_MINUTEDURATION_INT = "(%d) min";
COESTR_SECDURATION = "(%d%d?) sec";
COESTR_CASTBYNAME = "%(Rang (%d)%)";
COESTR_TOTEMDAMAGE = { ".+ [crh]+touche (.+ Totem) ?%u* pour (%d+).*" };
COESTR_TOTEMHEALTH = { "(%d*) points de vie" };
COESTR_SHOCKSPELL = "(Horion de %a*)";
COESTR_HEALINGWAVE = "Vague de soins";
COESTR_LESSERWAVE = "Vague de soins inf\195\169rieurs";
COESTR_MINAMOUNT = "(%d*).\195\160";
COESTR_MAXAMOUNT = "\195\160.(%d*)";
COESTR_TRINKET = "^.*%[Esprit de l\039eau amoureux%].*$"; 


-- Totem Advisor
-- --------------
COESTR_POISON = "Poison";
COESTR_DISEASE = "Maladie"
COESTR_TOTEMPOISON = "Totem de Purification du poison";
COESTR_TOTEMDISEASE = "Totem de Purification des maladies";
COESTR_TOTEMTREMOR = "Totem de S\195\169isme";
COESTR_CLEANSINGTOTEM = "Lance %s maintenant!";

COESTR_TREMOR = {
	"Sommeil", "Terrifier", "Cri psychique", "Contr\195\180le mental", "Rugissement", "Peur",
	"Cri d'intimidation", "Panique", "Hurlement strident", "S\195\169duction",
	"Hurlement de terreur", "Grondement d'intimidation", "L\195\169thargie cristalline"
} 

-- Tools
-- ---------
COESTR_TOTEMTOOLS_EARTH = "de terre";
COESTR_TOTEMTOOLS_FIRE = "de feu";
COESTR_TOTEMTOOLS_WATER = "d'eau";
COESTR_TOTEMTOOLS_AIR = "d'air";


-- Elements
-- ---------
COESTR_ELEMENT_EARTH = "Terre";
COESTR_ELEMENT_FIRE = "Feu";
COESTR_ELEMENT_WATER = "Eau";
COESTR_ELEMENT_AIR = "Air";


-- UI elements
-- ------------
COEUI_STRINGS = {
COE_ConfigClose = "Fermer";
COE_ConfigTotemTabPanel = "Options Totem";
COE_ConfigHealingTabPanel = "Options Soins";
COE_ConfigDebuffTabPanel = "Options Debuff";
COE_ConfigTotemTotemBar = "Barres";
COE_ConfigTotemTotemOptions = "Options";
COE_ConfigTotemTotemSets = "Sets";
COE_OptionEnableTotemBar = "Activer";
COE_OptionHideBackdrop = "Cacher le fond quand inactif";
COE_OptionEnableTimers = "Activer l'affichage des dur\195\169es (Timers)";
COE_OptionEnableTimerNotifications = "Activer les notifications";
COE_OptionTTAlignment = "Alignement Tooltip";
COE_OptionDisplayMode = "Bouton d'ancre";
COE_OptionDisplayAlignment = "Alignement";
COE_OptionAdvisor = "Activer l'Advisor";
COE_OptionEnableSets = "Activer les sets";
COE_OptionEnableAutoSwitch = "Changement automatique en PVP";
COE_OptionActiveSet = "Activer set";
COE_OptionNefdwSet = "Nouveau set";
COE_OptionDeleteSet = "Effacer set";
COE_OptionConfigureSet = "Configurer set";
COE_OptionStopConfigureSet = "OK";
COE_OptionCastOrderString = "Ordre de cast";
COE_OptionConfigureBar = "Configurer Totems";
COE_OptionFixBar = "V\195\169rouiller la position";
COE_OptionConfigureOrder = "Configurer Ordre";
COE_OptionScanTotems = "Relancer";
COE_OptionCurrentFrame = "Configurer Barre";
COE_OptionDirection = "Direction";
COE_OptionFrameMode = "Mode";
COE_OptionFlexCount = "Boutons Statiques";
COE_OptionScaling = "Echelle";
COE_OptionEnableTimerFrame = "Affichage des dur\195\169es dans des boutons s\195\169par\195\169s";
COE_OptionGroupBars = "D\195\169placement group\195\169";
COE_OptionOverrideRank = "Forcer le Rang 1";
COE_OptionFrameTimersOnly = "Montrer les dur\195\169es QUE dans les boutons s\195\169par\195\169s";
}


-- Tooltips
-- ---------
COEUI_TOOLTIPS = {
COE_ConfigTotemTab = "Montrer les option de Totem";
COE_ConfigHealingTab = "Montrer les options de soins";
COE_ConfigDebuffTab = "Montrer les options de debuff";
COE_OptionEnableTotemBar = "Activer et afficher la barre qui contient\nles totems disponibles que vous pouvez utiliser";
COE_OptionHideBackdrop = "Cache le fond lorsque la souris\nn'est pas sur la barre";
COE_OptionEnableTimers = "Active l'affichage du temps restant des totems";
COE_OptionEnableTimerNotifications = "Affiche un avertissement lorsqu'un\ntotem expire ou est d\195\169truit";
COE_OptionAdvisor = "Affiche un message lorsqu'un debuff peut \195\170tre enlev\195\169 par un de vos totems";
COE_OptionEnableAutoSwitch = "Active automatiquement le set en fontion\nde la classe de l'ennemi cibl\195\169";
COE_OptionFixBar = "V\195\169rouille la position de la barre\nafin d'\195\169viter un d\195\169placement accidentel";
COE_OptionGroupBars = "Lorsque vous d\195\169placer une barre,\nles autres sont d\195\169plac\195\169es en m\195\170me temps";
}

COESTR_TRINKET_TOOLTIP = "Esprit de l\039eau amoureux"; 
COESTR_TRINKET_TOTEM = "Ressort Antique De Mana";


-- Combo boxes
-- ------------
COEUI_TTALIGN = {
{ "ANCHOR_TOPLEFT"; "Haut gauche" };
{ "ANCHOR_LEFT"; "Gauche" };
{ "ANCHOR_BOTTOMLEFT"; "Bas gauche" }; 
{ "ANCHOR_TOPRIGHT"; "Haut droite" };
{ "ANCHOR_RIGHT"; "Droite" };
{ "ANCHOR_BOTTOMRIGHT"; "Bas droite" };
{ "DISABLED"; "D\195\169sactiv\195\169" };
}

COEUI_DISPLAYMODE = { "Customize", "Timers", "Set actif" }
 
COEUI_DISPLAYALIGN = { "Box", "Vertical", "Horizontal" }

COEUI_PVPSETS = { "[PVP] Druide", "[PVP] Chasseur", "[PVP] Mage", "[PVP] Paladin", "[PVP] Pr\195\170tre", 
	"[PVP] Voleur", "[PVP] Chaman", "[PVP] D\195\169moniste", "[PVP] Guerrier" }
COEUI_DEFAULTSET = "D\195\169faut";

COEUI_OVERRIDERANK = { "Aucune", "Avec SHIFT", "Avec ALT", "Avec CTRL" };

COEUI_CURRENTFRAME = { "Terre", "Feu", "Eau", "Air" };

COEUI_DIRECTION = { "Haut", "Bas", "Gauche", "Droite" };

COEUI_FRAMEMODE = { "Ferm\195\169", "Ouvert", "Flex", "Cach\195\169" };


-- Key bindings
-- -------------
BINDING_HEADER_CALLOFELEMENTS = "Call Of Elements";
BINDING_NAME_COESHOWCONFIG = "Afficher configuration";
BINDING_NAME_COEBESTHEAL = "Meilleur soin";
BINDING_NAME_COEBATTLEHEAL = "BattleHeal";
BINDING_NAME_COETHROWADVISED = "Lancer le Totem propos\195\169";
BINDING_NAME_COENEXTSET = "Activer le set suivant";
BINDING_NAME_COETHROWSET = "Lancer le set actif";
BINDING_NAME_COERESTARTSET = "Relancer le set actif";
BINDING_NAME_TOTEMEARTH1 = "Totem de terre #1";
BINDING_NAME_TOTEMEARTH2 = "Totem de terre #2";
BINDING_NAME_TOTEMEARTH3 = "Totem de terre #3";
BINDING_NAME_TOTEMEARTH4 = "Totem de terre #4";
BINDING_NAME_TOTEMEARTH5 = "Totem de terre #5";
BINDING_NAME_TOTEMFIRE1 = "Totem de feu #1";
BINDING_NAME_TOTEMFIRE2 = "Totem de feu #2";
BINDING_NAME_TOTEMFIRE3 = "Totem de feu #3";
BINDING_NAME_TOTEMFIRE4 = "Totem de feu #4";
BINDING_NAME_TOTEMFIRE5 = "Totem de feu #5";
BINDING_NAME_TOTEMWATER1 = "Totem d'eau #1";
BINDING_NAME_TOTEMWATER2 = "Totem d'eau #2";
BINDING_NAME_TOTEMWATER3 = "Totem d'eau #3";
BINDING_NAME_TOTEMWATER4 = "Totem d'eau #4";
BINDING_NAME_TOTEMWATER5 = "Totem d'eau #5";
BINDING_NAME_TOTEMWATER6 = "Totem d'eau #6";
BINDING_NAME_TOTEMAIR1 = "Totem d'air #1";
BINDING_NAME_TOTEMAIR2 = "Totem d'air #2";
BINDING_NAME_TOTEMAIR3 = "Totem d'air #3";
BINDING_NAME_TOTEMAIR4 = "Totem d'air #4";
BINDING_NAME_TOTEMAIR5 = "Totem d'air #5";
BINDING_NAME_TOTEMAIR6 = "Totem d'air #6";
BINDING_NAME_TOTEMAIR7 = "Totem d'air #7";


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
COESHELL_INTRO = "Commandes disponibles pour Call Of Elements:";
COESHELL_CONFIG = "'/coe' or '/coe config' - Affiche l'\195\169cran de configuration";
COESHELL_LIST = "'/coe list' - Affiche cette liste";
COESHELL_NEXTSET = "'/coe nexset' - Active le prochain set ou au set par d\195\169faut";
COESHELL_PRIORSET = "'/coe priorset' -Active le set pr\195\169c\195\169dent ou au set par d\195\169faut";
COESHELL_SET = "'/coe set <name>' - Active le set sp\195\169cifi\195\169. <name> est case-sensitive";
COESHELL_RESTARTSET = "'/coe restartset' - Au prochain lancement du set, tous les totems seront relanc\195\169s";
COESHELL_RESET = "'/coe reset' - Initialisation des timers et du set actif";
COESHELL_RESETFRAMES = "'/coe resetframes' - Affiche toutes les barres au centre de l'\195\169cran";
COESHELL_RESETORDERING = "'/coe resetordering' - Initialise l'ordre des totems";
COESHELL_RELOAD = "'/coe reload' - Recharge tous les totems et les sets";
COESHELL_MACRONOTE = "les commandes suivantes ne fonctionnent qu'avec des macros dans les barres d'action:";
COESHELL_THROWSET = "'/coe throwset' - Lance le set actif";
COESHELL_ADVISED = "'/coe advised' - lance le totem propos\195\169";


end
-- ß  \195\159
-- ö  \195\182
-- é  \195\169
-- â  \195\162
-- ä  \195\164
-- à  \195\160
-- ç  \195\167
-- ê  \195\170
-- ë  \195\171
-- è  \195\168
-- ï  \195\175
-- î  \195\174
-- ô  \195\180
-- ö  \195\182
-- ù  \195\185
-- ß  \195\159
-- DEFAULT_CHAT_FRAME:AddMessage(element);
-- COE:DebugMessage( "mcaoua:"..);	
