-------------------------------------------------------------------------------
-- French localization
-- Last update : 05/06/2006
-- By ( Sasmira, Cosmos Team )
-------------------------------------------------------------------------------

if (GetLocale() == "frFR") then

-- Bindings
BINDING_NAME_SMARTBUFF_BIND_TRIGGER = "D\195\169clencheur";
BINDING_NAME_SMARTBUFF_BIND_TARGET  = "Cible";
BINDING_NAME_SMARTBUFF_BIND_OPTIONS = "Menu d\'Options";
BINDING_NAME_SMARTBUFF_BIND_RESETBUFFTIMERS = "Reset buff timers";

-- Druid
SMARTBUFF_DRUID_CAT = "Forme de f\195\169lin";
SMARTBUFF_DRUID_MOONKIN = "Forme de s\195\169l\195\169nien";
SMARTBUFF_DRUID_TRACK = "Pistage des humano\195\175des";
SMARTBUFF_DRUID = { };
SMARTBUFF_DRUID[1] = {"Marque du fauve", 30, SMARTBUFF_CONST_GROUP, {1,10,20,30,40,50,60}, "WPET", "Don du fauve", 60, {50,60}, {"Baie sauvage","Epinette sauvage"}};
SMARTBUFF_DRUID[2] = {"Epines", 10, SMARTBUFF_CONST_GROUP, {6,14,24,34,44,54}, "MAGE;PRIEST;WARLOCK;WPET;" .. SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[3] = {"Augure de clart\195\169", 10, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[4] = {"Ecorce", 0.25, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[5] = {"Emprise de la nature", 0.75, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_MOONKIN};
SMARTBUFF_DRUID[6] = {"Furie f\195\169line", 0.1, SMARTBUFF_CONST_SELF, nil, SMARTBUFF_DRUID_CAT};

-- Mage
SMARTBUFF_MAGE = { };
SMARTBUFF_MAGE[1] = {"Intelligence des arcanes", 30, SMARTBUFF_CONST_GROUP, {1,14,28,42,56}, "ROGUE;WARRIOR;HPET;WPET", "Illumination des arcanes", 60, {56}, {"Poudre des arcanes"}};
SMARTBUFF_MAGE[2] = {"Armure de glace", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[3] = {"Armure de givre", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[4] = {"Armure du mage", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[5] = {"Att\195\169nuation de la magie", 10, SMARTBUFF_CONST_GROUP, {12,24,36,48,60}, "HPET;WPET"};
SMARTBUFF_MAGE[6] = {"Amplification de la magie", 10, SMARTBUFF_CONST_GROUP, {18,30,42,54}, "HPET;WPET"};
SMARTBUFF_MAGE[7] = {"Bouclier de mana", 1, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[8] = {"Gardien de feu", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[9] = {"Gardien de givre", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[10] = {"Barri\195\168re de glace", 1, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE_PATTERN = {"^Armure d%a %a+"};

-- Priest
SMARTBUFF_PRIEST = { };
SMARTBUFF_PRIEST[1] = {"Mot de pouvoir : Robustesse", 30, SMARTBUFF_CONST_GROUP, {1,12,24,36,48,60}, "WPET", "Pri\195\168re de robustesse", 60, {48,60}, {"Bougie sanctifi\195\169e","Bougie sacr\195\169e"}};
SMARTBUFF_PRIEST[2] = {"Protection contre l\'Ombre", 10, SMARTBUFF_CONST_GROUP, {30,42,56}, "WPET", "Pri\195\168re de protection contre l\'Ombre", 20, {56}, {"Bougie sacr\195\169e"}};
SMARTBUFF_PRIEST[3] = {"Feu int\195\169rieur", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[4] = {"Esprit divin", 30, SMARTBUFF_CONST_GROUP, {40,42,54,60}, "ROGUE;WARRIOR;HPET;WPET", "Pri\195\168re d'Esprit", 60, {60}, {"Bougie sacr\195\169e"}};
SMARTBUFF_PRIEST[5] = {"Mot de pouvoir : Bouclier", 0.5, SMARTBUFF_CONST_GROUP, {6,12,18,24,30,36,42,48,54,60}, "MAGE;WARLOCK;ROGUE;PALADIN;WARRIOR;DRUID;HUNTER;SHAMAN;HPET;WPET"};
SMARTBUFF_PRIEST[6] = {"Gardien de peur", 10, SMARTBUFF_CONST_GROUP, {20}};
SMARTBUFF_PRIEST[7] = {"Gr\195\162ce d\'Elune", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[8] = {"R\195\169action", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[9] = {"Garde de l\'ombre", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[10] = {"Toucher de faiblesse", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[11] = {"Concentration am\195\169lior\195\169e", -1, SMARTBUFF_CONST_SELF};

-- Warlock
SMARTBUFF_WARLOCK = { };
SMARTBUFF_WARLOCK[1] = {"Armure d\195\169moniaque", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[2] = {"Peau de d\195\169mon", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[3] = {"Respiration interminable", 10, SMARTBUFF_CONST_GROUP, {16}, "HPET;WPET"};
SMARTBUFF_WARLOCK[4] = {"D\195\169tection de l\'invisibilit\195\169 sup\195\169rieure", 10, SMARTBUFF_CONST_GROUP, {50}, "HPET;WPET"};
SMARTBUFF_WARLOCK[5] = {"D\195\169tection de l\'invisibilit\195\169", 10, SMARTBUFF_CONST_GROUP, {38}, "HPET;WPET"};
SMARTBUFF_WARLOCK[6] = {"D\195\169tection de l\'invisibilit\195\169 Inf\195\169rieure", 10, SMARTBUFF_CONST_GROUP, {26}, "HPET;WPET"};
SMARTBUFF_WARLOCK[7] = {"Lien spirituel", 0, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK_PATTERN = {"e D\195\169mon", "^D\195\169tection %.*l'invisibilit\195\169"};

-- Hunter
SMARTBUFF_HUNTER = { };
SMARTBUFF_HUNTER[1] = {"Aura de pr\195\169cision", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[2] = {"Tir rapide", 0.2, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[3] = {"Aspect du faucon", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[4] = {"Aspect du singe", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[5] = {"Aspect de la nature", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[6] = {"Aspect de la b\195\170te", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER_PATTERN = {"^Aspect d"};

-- Shaman
SMARTBUFF_SHAMAN = { };
SMARTBUFF_SHAMAN[1] = {"Bouclier de foudre", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[2] = {"Arme croque-roc", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[3] = {"Arme de glace", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[4] = {"Arme langue de feu", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[5] = {"Arme furie-des-vents", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[6] = {"Respiration aquatique", 10, SMARTBUFF_CONST_GROUP, {22}};

-- Warrior
SMARTBUFF_WARRIOR = { };
SMARTBUFF_WARRIOR[1] = {"Cri de guerre", 2, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[2] = {"Furie berzerker", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[3] = {"Rage sanguinaire", 0.165, SMARTBUFF_CONST_SELF};

-- Rogue
SMARTBUFF_ROGUE = { };
SMARTBUFF_ROGUE[1]  = {"D\195\169luge de lames", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[2]  = {"D\195\169biter", 0.2, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[3]  = {"Evasion", 0.2, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[4]  = {"Poison instantan\195\169 VI", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[5]  = {"Poison instantan\195\169 V", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[6]  = {"Poison instantan\195\169 IV", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[7]  = {"Poison instantan\195\169 III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[8]  = {"Poison instantan\195\169 II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[9]  = {"Poison instantan\195\169", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[10] = {"Poison douloureux IV", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[11] = {"Poison douloureux III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[12] = {"Poison douloureux II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[13] = {"Poison douloureux", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[14] = {"Poison de distraction mentale III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[15] = {"Poison de distraction mentale II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[16] = {"Poison de distraction mentale", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[17] = {"Poison mortel IV", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[18] = {"Poison mortel III", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[19] = {"Poison mortel II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[20] = {"Poison mortel", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[21] = {"Poison affaiblissant II", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_ROGUE[22] = {"Poison affaiblissant", 30, SMARTBUFF_CONST_INV};

-- Paladin
SMARTBUFF_PALADIN = { };
SMARTBUFF_PALADIN[1]  = {"Fureur vertueuse", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[2]  = {"Bouclier divin", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[3]  = {"B\195\169n\195\169diction de puissance", 5, SMARTBUFF_CONST_GROUP, {4,12,22,32,42,52,60}, "DRUID;MAGE;PRIEST;SHAMAN;WARLOCK;WPET", "B\195\169n\195\169diction de puissance sup\195\169rieure", 15, {52,60}, {"Symbole des rois","Symbole des rois"} };
SMARTBUFF_PALADIN[4]  = {"B\195\169n\195\169diction de sagesse", 5, SMARTBUFF_CONST_GROUP, {14,24,34,44,54,60}, "ROGUE;SHAMAN;WARRIOR;HPET;WPET", "B\195\169n\195\169diction de sagesse sup\195\169rieure", 15, {54,60}, {"Symbole des rois","Symbole des rois"} };
SMARTBUFF_PALADIN[5]  = {"B\195\169n\195\169diction de salut", 5, SMARTBUFF_CONST_GROUP, {26}, "SHAMAN;WARRIOR;HPET;WPET", "B\195\169n\195\169diction de salut sup\195\169rieure", 15, {60}, {"Symbole des rois"} };
SMARTBUFF_PALADIN[6]  = {"B\195\169n\195\169diction des rois", 5, SMARTBUFF_CONST_GROUP, {20}, "SHAMAN;WPET", "B\195\169n\195\169diction des rois sup\195\169rieure", 15, {60}, {"Symbole des rois"} };
SMARTBUFF_PALADIN[7]  = {"B\195\169n\195\169diction du sanctuaire", 5, SMARTBUFF_CONST_GROUP, {30,40,50,60}, "DRUID;HUNTER;MAGE;PRIEST;ROGUE;SHAMAN;WARLOCK;HPET;WPET", "B\195\169n\195\169diction du sanctuaire sup\195\169rieure", 15, {60}, {"Symbole des rois"} };
SMARTBUFF_PALADIN[8]  = {"B\195\169n\195\169diction de lumi\195\168re", 5, SMARTBUFF_CONST_GROUP, {40,50,60}, "SHAMAN;WPET", "B\195\169n\195\169diction de lumi\195\168re sup\195\169rieure", 15, {60}, {"Symbole des rois"} };
--SMARTBUFF_PALADIN[9]  = {"Blessing of Freedom", 0.165, SMARTBUFF_CONST_GROUP, {18}};
--SMARTBUFF_PALADIN[10] = {"Blessing of Protection", 1, SMARTBUFF_CONST_GROUP, {10,24,38}};
SMARTBUFF_PALADIN[9]  = {"Sceau d'autorit\195\169", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[10] = {"Sceau de fureur", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[11] = {"Sceau de justice", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[12] = {"Sceau de lumi\195\168re", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[13] = {"Sceau de pi\195\169t\195\169", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[14] = {"Sceau de sagesse", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[15] = {"Sceau du crois\195\169", 0.5, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[16] = {"Aura de d\195\169votion", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[17] = {"Aura de vindicte", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[18] = {"Aura de concentration", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[19] = {"Aura de r\195\169sistance \195\160 l\'ombre", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[20] = {"Aura de r\195\169sistance au givre", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[21] = {"Aura de r\195\169sistance au feu", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[22] = {"Aura de saintet\195\169", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN_PATTERN = {"^Sceau d"};


-- Stones and oils
SMARTBUFF_WEAPON = { };
SMARTBUFF_WEAPON[1]  = {"Pierre \195\160 aiguiser grossi\195\168re", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[2]  = {"Pierre \195\160 aiguiser brute", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[3]  = {"Pierre \195\160 aiguiser lourde", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[4]  = {"Pierre \195\160 aiguiser solide", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[5]  = {"Pierre \195\160 aiguiser dense", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[6]  = {"Pierre \195\160 aiguiser \195\169l\195\169mentaire", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[7]  = {"Caillou brut", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[8]  = {"Caillou grossier", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[9]  = {"Caillou lourd", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[10] = {"Caillou solide", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[11] = {"Caillou dense", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[12] = {"Huile des t\195\169n\195\168bres", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[13] = {"Huile glaciale", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[14] = {"Huile de mana mineure", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[15] = {"Huile de mana inf\195\169rieure", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[16] = {"Huile de mana brillante", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[17] = {"Huile de sorcier mineure", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[18] = {"Huile de sorcier inf\195\169rieure", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[19] = {"Huile de sorcier", 30, SMARTBUFF_CONST_INV};
SMARTBUFF_WEAPON[20] = {"Huile de sorcier brillante", 30, SMARTBUFF_CONST_INV};

-- ENGLISH
-- Daggers
-- Fist Weapons
-- One-Handed Axes
-- One-Handed Maces
-- One-Handed Swords
-- Staves
-- Two-Handed Axes
-- Two-Handed Maces
-- Two-Handed Swords
-- Polearms

-- FRENCH
-- Dagues
-- Armes de pugilat
-- Haches \195\160 une main
-- Masses \195\160 une main
-- Ep\195\169es \195\160 une main
-- B\195\162tons
-- Haches \195\160 deux mains
-- Masses \195\160 deux mains 
-- Ep\195\169es \195\160 deux mains 
-- Armes d\'hast

SMARTBUFF_WEAPON_STANDARD = {"Dagues", "Haches", "Ep\195\169es", "Masses", "B\195\162tons", "Armes de pugilat", "Armes d\'hast"};
SMARTBUFF_WEAPON_BLUNT = {"Masses", "B\195\162tons", "Armes de pugilat"};
SMARTBUFF_WEAPON_BLUNT_PATTERN = "^Caillou ";
SMARTBUFF_WEAPON_SHARP = {"Dagues", "Haches", "Ep\195\169es", "Armes d\'hast"};
SMARTBUFF_WEAPON_SHARP_PATTERN = "^Pierre \195\160 aiguiser";

-- Tracking
SMARTBUFF_TRACKING = { };
SMARTBUFF_TRACKING[1]  = {"D\195\169couverte de gisements", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[2]  = {"D\195\169couverte d\'herbes", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[3]  = {"D\195\169couverte de tr\195\169sors", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[4]  = {"Pistage des humano\195\175des", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[5]  = {"Pistage des b\195\170tes", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[6]  = {"Pistage des morts-vivants", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[7]  = {"Pistage des camoufl\195\169s", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[8]  = {"Pistage des \195\169l\195\169mentaires", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[9]  = {"Pistage des d\195\169mons", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[10] = {"Pistage des g\195\169ants", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[11] = {"Pistage des draconiens", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[12] = {"Sentir les d\195\169mons", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[13] = {"Sentir les morts-vivants", -1, SMARTBUFF_CONST_TRACK};

-- Racial
SMARTBUFF_RACIAL = { };
SMARTBUFF_RACIAL[1]  = {"Forme de pierre", 0.133, SMARTBUFF_CONST_SELF}; -- Dwarv
SMARTBUFF_RACIAL[2]  = {"Perception", 0.333, SMARTBUFF_CONST_SELF}; -- Human
SMARTBUFF_RACIAL[3]  = {"Fureur sanguinaire", 0.416, SMARTBUFF_CONST_SELF}; -- Orc
SMARTBUFF_RACIAL[4]  = {"Berserker", 0.166, SMARTBUFF_CONST_SELF}; -- Troll
SMARTBUFF_RACIAL[5]  = {"Volont\195\169 des R\195\169prouv\195\169s", 0.083, SMARTBUFF_CONST_SELF}; -- Undead


-- Creature type
SMARTBUFF_HUMANOID  = "Humano\195\175de";
SMARTBUFF_DEMON     = "D\195\169mon";
SMARTBUFF_BEAST     = "B\195\170te";
SMARTBUFF_DEMONTYPE = "Diablotin";

-- Classes
SMARTBUFF_CLASSES = {"Druide", "Chasseur", "Mage", "Paladin", "Pr\195\170tre", "Voleur", "Chaman", "D\195\169moniste", "Guerrier", "Chasseur Pet", "D\195\169moniste Pet"};

-- Templates and Instances
SMARTBUFF_TEMPLATES = {"Seul", "Groupe", "Raid", "Champs de Bataille", "MC", "Ony", "BWL", "AQ", "ZG", "Custom 1", "Custom 2", "Custom 3", "Custom 4", "Custom 5"};
SMARTBUFF_INSTANCES = {"C\197\147ur du Magma", "Repaire d\'Onyxia", "Repaire de l\'Aile noire", "Ahn'Qiraj", "Zul'Gurub", "Vall\195\169e d'Alterac", "Bassin d'Arathi", "Goulet des Warsong"};

-- Mount
SMARTBUFF_MOUNT = "Augmente la vitesse de (%d+)%%.";

-- Options Frame Text
SMARTBUFF_OFT                = "ON/OFF SmartBuff";
SMARTBUFF_OFT_MENU           = "Afficher/Cacher le menu d\'options";
SMARTBUFF_OFT_AUTO           = "Rappel";
SMARTBUFF_OFT_AUTOTIMER      = "V\195\169rifier";
SMARTBUFF_OFT_AUTOCOMBAT     = "En combat";
SMARTBUFF_OFT_AUTOCHAT       = "Chat";
SMARTBUFF_OFT_AUTOSPLASH     = "Splash";
SMARTBUFF_OFT_AUTOSOUND      = "Son";
SMARTBUFF_OFT_AUTOREST       = "D\195\169sactiver dans les Capitales";
SMARTBUFF_OFT_HUNTERPETS     = "Buff: Pets Chasseur";
SMARTBUFF_OFT_WARLOCKPETS    = "Buff: Pets D\195\169mo.";
SMARTBUFF_OFT_ARULES         = "R\195\168gles avanc\195\169es";
SMARTBUFF_OFT_GRP            = "Sous Groupe Raid \195\160 Buffer";
SMARTBUFF_OFT_SUBGRPCHANGED  = "Ouvrir le menu d\'options, lorsque \n le sous groupe a chang\195\169";
SMARTBUFF_OFT_BUFFS          = "Buffs/Capacit\195\169s";
SMARTBUFF_OFT_TARGET         = "Buffs la cible s\195\169lectionn\195\169e";
SMARTBUFF_OFT_DONE           = "Quitter";
SMARTBUFF_OFT_APPLY          = "Appliquer";
SMARTBUFF_OFT_GRPBUFFSIZE    = "Taille: Groupe";
SMARTBUFF_OFT_MESSAGES       = "D\195\169sactiver: Message";
SMARTBUFF_OFT_MSGNORMAL      = "Normal";
SMARTBUFF_OFT_MSGWARNING     = "Avertissement";
SMARTBUFF_OFT_MSGERROR       = "Erreur";
SMARTBUFF_OFT_HIDEMMBUTTON   = "Cacher: Bouton Minimap";
SMARTBUFF_OFT_REBUFFTIMER    = "Timer: Rebuff";
SMARTBUFF_OFT_SELFFIRST      = "Moi en premier";
SMARTBUFF_OFT_SCROLLWHEEL    = "Buff avec la Souris";
SMARTBUFF_OFT_TARGETSWITCH   = "Changer de Cible";
SMARTBUFF_OFT_BUFFTARGET     = "Buff sur Cible";
SMARTBUFF_OFT_BUFFPVP        = "JcJ Buff";
SMARTBUFF_OFT_AUTOSWITCHTMP  = "Changer de config";
SMARTBUFF_OFT_AUTOSWITCHTMPINST = "Instance";
SMARTBUFF_OFT_CHECKCHARGES   = "Charges";
SMARTBUFF_OFT_RBT            = "Reset BT";
SMARTBUFF_OFT_BUFFINCITIES   = "Buff dans les Cap.";
SMARTBUFF_OFT_CTRASYNC       = "CTRA sync";
SMARTBUFF_OFT_ADVGRPBUFFCHECK = "Grp buff check";
SMARTBUFF_OFT_ADVGRPBUFFRANGE = "Grp range check";
SMARTBUFF_OFT_BLDURATION     = "Blacklisted";

-- Options Frame Tooltip Text
SMARTBUFF_OFTT               = "ON/OFF SmartBuff";
SMARTBUFF_OFTT_AUTO          = "ON/OFF Le rappel de buff";
SMARTBUFF_OFTT_AUTOTIMER     = "D\195\169lai en secondes entre deux v\195\169rifications.";
SMARTBUFF_OFTT_AUTOCOMBAT    = "Lance une v\195\169rification en combat.";
SMARTBUFF_OFTT_AUTOCHAT      = "Affiche dans le chat un message lorsque le buff est expir\195\169.";
SMARTBUFF_OFTT_AUTOSPLASH    = "Affiche un message au milieu de l\'\195\169cran \nlorsque le buff est expir\195\169.";
SMARTBUFF_OFTT_AUTOSOUND     = "Joue un son lorsque les buffs sont expir\195\169s.";
SMARTBUFF_OFTT_AUTOREST      = "D\195\169sactiver le rappel dans les Capitales.";
SMARTBUFF_OFTT_HUNTERPETS    = "Buff les pets de Chasseur.";
SMARTBUFF_OFTT_WARLOCKPETS   = "Buff les pets de D\195\169moniste, except\195\169 le " .. SMARTBUFF_DEMONTYPE .. ".";
SMARTBUFF_OFTT_ARULES        = "Ne peut \195\170tre lanc\195\169:\n- Epines sur Mages, Pr\195\170tres et D\195\169monistes\n- Intelligence des Arcanes sur des unit\195\169s sans Mana\n- Esprit Divin sur des unit\195\169s sans Mana";
SMARTBUFF_OFTT_SUBGRPCHANGED = "Ouvre Automatiquement le menu d\'options de SmartBuff,\nlorsque vous changez de sous groupe.";
SMARTBUFF_OFTT_GRPBUFFSIZE   = "Le nombre de joueurs que vous avez \ndans le groupe pour utiliser le Buff de groupe.";
SMARTBUFF_OFTT_HIDEMMBUTTON  = "Cache le bouton SmartBuff de la Minimap.";
SMARTBUFF_OFTT_REBUFFTIMER   = "Indique le temps en secondes avant que le Buff expire,\nle rappel vous lancera une alerte.\n0 = D\195\169sactiv\195\169";
SMARTBUFF_OFTT_SELFFIRST     = "Buffs votre personnage en premier avant tous les autres.";
SMARTBUFF_OFTT_SCROLLWHEEL   = "Applique les buffs \nlorsque vous utilisez la molette de la souris.";
SMARTBUFF_OFTT_TARGETSWITCH  = "Lancer les buffs lorsque vous changez votre cible.";
SMARTBUFF_OFTT_BUFFTARGET    = "Buffs en premier la cible courante,\nde la m\195\170me faction.";
SMARTBUFF_OFTT_BUFFPVP       = "JcJ Buff sur les joueurs marqu\195\169s JcJ,\nm\195\170me si vous n\'\195\170tes pas vous aussi en JcJ.";
SMARTBUFF_OFTT_AUTOSWITCHTMP = "Change automatiquement de configuration,\nsi le type de groupe change.";
SMARTBUFF_OFTT_AUTOSWITCHTMPINST = "Change automatiquement de configuration,\nsi l\'instance change.";
SMARTBUFF_OFTT_CHECKCHARGES  = "Affiche un message au quantit\195\169 basse\nde charges que un Buff";
SMARTBUFF_OFTT_BUFFINCITIES  = "Buffs also if you are in capital cities.\nIf you are PvP flagged, it buffs in any case.";
SMARTBUFF_OFTT_CTRASYNC      = "Activate syncronisation with CTRA\nto retrive the bufftime left from other players.\nWorks only in raids.";
SMARTBUFF_OFTT_ADVGRPBUFFCHECK = "The advanced group buff check is also looking\non single buffs on the group buff check.";
SMARTBUFF_OFTT_ADVGRPBUFFRANGE = "The advanced group range check is also looking\nif each player in group is in range.";
SMARTBUFF_OFTT_BLDURATION    = "How many seconds, players will be blacklistet\n0 = Deactivated";

-- Buffsetup Frame Text
SMARTBUFF_BST_SELFONLY       = "Sur Soi";
SMARTBUFF_BST_COMBATIN       = "En combat";
SMARTBUFF_BST_COMBATOUT      = "Hors combat";
SMARTBUFF_BST_MAINHAND       = "Main Principale";
SMARTBUFF_BST_OFFHAND        = "Main Gauche";
SMARTBUFF_BST_REMINDER       = "Notification";

-- Buffsetup Frame Tooltip Text
SMARTBUFF_BSTT_SELFONLY      = "Buffs uniquement votre personnage."; 
SMARTBUFF_BSTT_COMBATIN      = "Buffs si vous \195\170tes en combat.";
SMARTBUFF_BSTT_COMBATOUT     = "Buffs si vous \195\170tes hors combat.";
SMARTBUFF_BSTT_MAINHAND      = "Buffs La Main Principale.";
SMARTBUFF_BSTT_OFFHAND       = "Buffs La Main Gauche.";
SMARTBUFF_BSTT_REMINDER      = "Afficher le message de rappel.";
SMARTBUFF_BSTT_REBUFFTIMER   = "Indique le temps en secondes avant que le Buff expire,\nle rappel vous lancera une alerte.\n0 = Timer: Rebuff";

-- Messages
SMARTBUFF_MSG_LOADED         = "lanc\195\169";
SMARTBUFF_MSG_DISABLED       = "SmartBuff est d\195\169sactiv\195\169 !";
SMARTBUFF_MSG_SUBGROUP       = "Vous venez de rejoindre un nouveau sous groupe, merci de v\195\169rifier les options !";
SMARTBUFF_MSG_NOTHINGTODO    = "STOP, IL N\'Y A PLUS RIEN A LANCER !!! Tous les Buffs sont deja lanc\195\169s ;-)";
SMARTBUFF_MSG_BUFFED         = "vient d\'\195\170tre appliqu\195\169(e)";
SMARTBUFF_MSG_OOR            = "est hors de port\195\169e pour \195\170tre buff\195\169 !"
--SMARTBUFF_MSG_CD             = "vient d\'expirer !";
SMARTBUFF_MSG_CD             = "Global d\'expirer !";
SMARTBUFF_MSG_CHAT           = "Impossible en mode chat!";
SMARTBUFF_MSG_SHAPESHIFT     = "Le lancement du sort ne peut pas se faire sous cette forme !";
SMARTBUFF_MSG_NOACTIONSLOT   = "a besoin d\'un emplacement dans une barre d\'action pour fonctionner correctement !";
SMARTBUFF_MSG_GROUP          = "Groupe";
SMARTBUFF_MSG_NEEDS          = "a besoin de";
SMARTBUFF_MSG_OOM            = "Vous n\'avez pas assez de mana/rage/\195\169nergie !";
SMARTBUFF_MSG_STOCK          = "Stock actuel de";
SMARTBUFF_MSG_NOREAGENT      = "Plus assez de r\195\169actif:";
SMARTBUFF_MSG_DEACTIVATED    = "d\195\169sactivat\195\169!";
SMARTBUFF_MSG_REBUFF         = "Rebuff";
SMARTBUFF_MSG_LEFT           = "temps restant";
SMARTBUFF_MSG_CLASS          = "Classe";
SMARTBUFF_MSG_CHARGES        = "charges";

end
