--[[
-- Atlas  : Localisation Française "frFR" (http://www.atlasmod.com/phpBB3/viewforum.php?f=6)
-- Version WoW 2.4.2 (french client)
-- Sur un travail de Wysiwyg, Trasher en 2007 / 2008
-- Mise à jour par Kiria et Trasher 
-- le 25/06/2008
--]]

if ( GetLocale() == "frFR" ) then

--************************************************
-- Global Atlas Strings
--************************************************

AtlasSortIgnore = {"le (.+)", "la (.+)", "les (.+)"};

ATLAS_TITLE    = "Atlas";
ATLAS_SUBTITLE = "Navigateur de cartes d'instances";
ATLAS_DESC     = "Atlas est un navigateur de cartes d'instances.";

BINDING_HEADER_ATLAS_TITLE = "Atlas";
BINDING_NAME_ATLAS_TOGGLE  = "Atlas [Ouvrir/Fermer]";
BINDING_NAME_ATLAS_OPTIONS = "Options [Ouvrir/Fermer]";
BINDING_NAME_ATLAS_AUTOSEL = "Auto-Select";

ATLAS_SLASH         = "/atlas";
ATLAS_SLASH_OPTIONS = "options";

ATLAS_STRING_LOCATION    = "Lieu";
ATLAS_STRING_LEVELRANGE  = "Niveau";
ATLAS_STRING_PLAYERLIMIT = "Limite de joueurs";
ATLAS_STRING_SELECT_CAT  = "Choix de la catégorie";
ATLAS_STRING_SELECT_MAP  = "Choix de la carte";
ATLAS_STRING_SEARCH      = "Rechercher";
ATLAS_STRING_CLEAR       = "Nettoyer";
ATLAS_STRING_MINLEVEL	 = "Niveau Minimum";

ATLAS_OPTIONS_BUTTON      = "Options";
ATLAS_OPTIONS_TITLE       = "Atlas Options";
ATLAS_OPTIONS_SHOWBUT     = "Voir le bouton sur la mini-carte";
ATLAS_OPTIONS_AUTOSEL     = "Sélection automatique de la carte";
ATLAS_OPTIONS_BUTPOS      = "Position du bouton";
ATLAS_OPTIONS_TRANS       = "Transparence";
ATLAS_OPTIONS_DONE        = "Valider";
ATLAS_OPTIONS_REPMAP      = "Remplacer la carte du monde";
ATLAS_OPTIONS_RCLICK      = "Clic droit pour la carte du monde";
ATLAS_OPTIONS_SHOWMAPNAME = "Afficher le nom de la carte";
ATLAS_OPTIONS_RESETPOS    = "Position initiale";
ATLAS_OPTIONS_ACRONYMS    = "Afficher les acronymes VO/VF";
ATLAS_OPTIONS_SCALE       = "Echelle";
ATLAS_OPTIONS_BUTRAD      = "Rayon du bouton";
ATLAS_OPTIONS_CLAMPED     = "Fixer la fenêtre à l'écran";
ATLAS_OPTIONS_HELP        = "Clic gauche pour déplacer cette fenêtre.";
ATLAS_OPTIONS_CTRL        = "Maintenir la touche Ctrl enfoncée pour voir les infobulles"
ATLAS_OPTIONS_COORDS      = "Montrer les coordonnées sur la carte du monde"

ATLAS_BUTTON_TOOLTIP_TITLE = "Atlas";
ATLAS_BUTTON_TOOLTIP_HINT = "Clic gauche pour ouvrir Atlas.\nClic milieu pour les options d'Atlas.\nClic droit pour déplacer ce bouton.";
ATLAS_TITAN_HINT = "Clic gauche pour ouvrir Atlas.\nClic milieu pour les options d'Atlas.\nClic droit pour le menu d'affichage.";

ATLAS_OPTIONS_CATDD          = "Trier les instances par :";
ATLAS_DDL_CONTINENT          = "Continent";
ATLAS_DDL_CONTINENT_EASTERN  = "Instances des Royaumes de l'Est";
ATLAS_DDL_CONTINENT_KALIMDOR = "Instances de Kalimdor";
ATLAS_DDL_CONTINENT_OUTLAND  = "Instances de l'Outreterre";
ATLAS_DDL_LEVEL              = "Niveau";
ATLAS_DDL_LEVEL_UNDER45      = "Instances avant Niveau 45";
ATLAS_DDL_LEVEL_45TO60       = "Instances Niveau 45-60";
ATLAS_DDL_LEVEL_60TO70       = "Instances Niveau 60-70";
ATLAS_DDL_LEVEL_70PLUS       = "Instances Niveau 70+";
ATLAS_DDL_PARTYSIZE          = "Taille de Groupe";
ATLAS_DDL_PARTYSIZE_5        = "Instances pour 5 Joueurs";
ATLAS_DDL_PARTYSIZE_10       = "Instances pour 10 Joueurs";
ATLAS_DDL_PARTYSIZE_20TO40   = "Instances pour 20-40 Joueurs";
ATLAS_DDL_EXPANSION          = "Extension";
ATLAS_DDL_EXPANSION_OLD_AO	 = "Instances du Vieux Monde (A-O)";
ATLAS_DDL_EXPANSION_OLD_PZ	 = "Instances du Vieux Monde (P-Z)";
ATLAS_DDL_EXPANSION_BC       = "Instances Burning Crusade";
ATLAS_DDL_TYPE				 = "Type";
ATLAS_DDL_TYPE_INSTANCE_AK	 = "Instances A-K";
ATLAS_DDL_TYPE_INSTANCE_MZ	 = "Instances M-Z";
ATLAS_DDL_TYPE_ENTRANCE		 = "Entrées";

ATLAS_INSTANCE_BUTTON = "Instance";
ATLAS_ENTRANCE_BUTTON = "Entrée";
ATLAS_SEARCH_UNAVAIL  = "Recherche Indisponible";

ATLAS_HELP = {"A propos d'Atlas\n===========\n\nAtlas est un add-on pour l'interface de World of Warcraft qui fournit de nombreuses cartes supplémentaires ainsi qu'un navigateur de cartes. Taper la commande '/atlas' ou cliquer sur l'icône de mini-carte pour ouvrir la fenêtre d'Atlas. Le panneau d'options vous permet d'enlever cette icône, d'activer ou non les différentes options : Sélection automatique, Remplacer la Carte du Monde, Clic droit, Changer la position de l'icône, ou ajuster la transparence de la fenêtre principale. Si l'option de Sélection automatique est activée, Atlas ouvrira automatiquement la carte de l'instance dans laquelle vous êtes. Si l'option Remplacer la Carte du Monde est activée, Atlas s'ouvrira à la place de la carte du monde lorsque vous êtes dans un donjon. Si l'option Clic droit est activée, vous pourrez cliquer droit sur Atlas pour ouvrir la Carte du monde. Vous pouvez déplacer la fenêtre d'Atlas en faisant un clic gauche maintenu. Utilisez le petit symbole de verrou dans le coin en haut à droite pour fixer la fenêtre en place."};

AtlasZoneSubstitutions = {
	["Le temple d'Atal'Hakkar"]	= "Le temple englouti";
	["Ahn'Qiraj"]				= "Le Temple d'Ahn'Qiraj";
	["Ruines d'Ahn'Qiraj"]		= "Les Ruines d'Ahn'Qiraj";
	["Karazhan"]				= "Karazhan [A] (Début)";
	["Temple Noir"]				= "Temple Noir [A] (Début)";	
};

AtlasLocale = {

--************************************************
-- Zone Names, Acronyms, and Common Strings
--************************************************

	--Common strings
	["Adult"] = "Adulte";
	["AKA"] = "AKA";
	["Alliance"] = "Alliance";
	["Arcane Container"] = "Arcane Container";
	["Argent Dawn"] = "Aube d'argent";
	["Arms Warrior"] = "Guerrier Armes";
	["Attunement Required"] = "Harmonisation requise";
	["Back"] = "de derrière"; -- Back de Back Door, trouver mieux
	["Basement"] = "Sous-sol";
	["Bat"] = "Chauve-souris";
	["Blacksmithing Plans"] = "Plans de forge";
	["Boss"] = "Boss";
	["Brazier of Invocation"] = "Brasero d'invocation";
	["Brewfest"] = "Fête des Brasseurs";
	["Chase Begins"] = "Début de la chasse";
	["Chase Ends"] = "Fin de la chasse";
	["Child"] = "Enfant";
	["Connection"] = "Connexion";
	["DS2"] = "Set D2";
	["East"] = "Est";
	["Elevator"] = "Ascenseur";
	["End"] = "Fin";
	["Entrance"] = "Entrée";
	["Event"] = "Evènement "; -- Espace pour le blanc avant une double ponctuation
	["Exalted"] = "Exalté";
	["Exit"] = "Sortie";
	["Fourth Stop"] = "Quatrième arrêt";
	["Front"] = "Principale"; -- Front de Front Door, trouver mieux
	["Ghost"] = "Fantôme";
	["Hallow's End"] = "Sanssaint";
	["Heroic"] = "Héroïque";
	["Holy Paladin"] = "Paladin Sacré";
	["Holy Priest"] = "Prêtre Sacré";
	["Horde"] = "Horde";
	["Hunter"] = "Chasseur";
	["Imp"] = "Diablotin";
	["Key"] = "Clé "; -- Espace pour le blanc avant une double ponctuation
	["Lower"] = "En bas";
	["Lunar"] = "Fête lunaire";
	["Mage"] = "Mage";
	["Main"] = "Principal";
	["Meeting Stone"] = "Pierre de rencontre";
	["Moonwell"] = "Puits de lune";
	["North"] = "Nord";
	["Optional"] = "Optionel";
	["Orange"] = "Orange";
	["Outside"] = "Extérieur";
	["Paladin"] = "Paladin";
	["Panther"] = "Panthère";
	["Patrols"] = "Patrouille";
	["Portal"] = "Portail";
	["Priest"] = "Prêtre";
	["Protection Warrior"] = "Guerrier Protection";
	["Purple"] = "Violet";
	["Random"] = "Aléatoire";
	["Raptor"] = "Raptor";
	["Rare"] = "Rare";
	["Rep"] = "Réput "; -- Espace pour le blanc avant une double ponctuation 
	["Repair"] = "Réparation";
	["Retribution Paladin"] = "Paladin Vindicte";
	["Rewards"] = "Récompenses";
	["Rogue"] = "Voleur";
	["Second Stop"] = "Deuxième arrêt";
	["Shadow Priest"] = "Prêtre Ombre";
	["Shaman"] = "Chaman";
	["Side"] = "Coté";
	["Snake"] = "Serpent";
	["Spawn Point"] = "Points d'apparition";
	["Spider"] = "Araignée";
	["Start"] = "Début";
	["Summon"] = "Invoqué";
	["Third Stop"] = "Troisième arrêt";
	["Tiger"] = "Tigre";
	["Top"] = "Haut";
	["Undead"] = "Mort-vivant";
	["Underwater"] = "Sous l'eau";
	["Unknown"] = "Inconnu";
	["Upper"] = "En haut";
	["Varies"] = "Variable";
	["Wanders"] = "Errant";
	["Warlock"] = "Démoniste";
	["Warrior"] = "Guerrier";
	["West"] = "Ouest";
	["Workshop"] = "Atelier";

	--Instance names and acronyms
	["Armory"] = "Armurerie";
	["Auchenai Crypts"] = "Cryptes Auchenaï"; ["AC"] = "AC";
	["Auchindoun"] = "Auchindoun"; ["Auch"] = "Auch";
	["Black Temple"] = "Temple Noir"; ["BT"] = "BT";
	["Blackfathom Deeps"] = "Profondeurs de Brassenoire"; ["BFD"] = "BFD";
	["Blackrock Depths"] = "Profondeurs de Rochenoire"; ["BRD"] = "BRD";
	["Blackrock Spire"] = "Pic Rochenoire"; ["LBRS"] = "LBRS/Pic 1"; ["UBRS"] = "UBRS/Pic 2";
	["Blackwing Lair"] = "Repaire de l'Aile Noire"; ["BWL"] = "BWL";
	["Cathedral"] = "Cathédrale"; ["Cath"] = "Cath";
	["Caverns of Time"] = "Grottes du Temps"; ["CoT"] = "CoT/GT";
	["Coilfang Reservoir"] = "Réservoir de Glissecroc"; ["CR"] = "CR";
	["Dire Maul"] = "Hache-tripes"; ["DM"] = "DM/HT";
	["Gnomeregan"] = "Gnomeregan"; ["Gnome"] = "Gnome";
	["Graveyard"] = "Cimetière"; ["GY"] = "GY";
	["Gruul's Lair"] = "Repaire de Gruul"; ["GL"] = "GL";
	["Hellfire Citadel"] = "Citadelle des Flammes infernales"; ["HFC"] = "HFC";
	["Hellfire Ramparts"] = "Remparts des Flammes infernales"; ["Ramp"] = "Ramp";
	["Hyjal Summit"] = "Sommet d'Hyjal"; ["CoT3"] = "CoT3/GT3";
	["Karazhan"] = "Karazhan"; ["Kara"] = "Kara";
	["Library"] = "Bibliothèque"; ["Lib"] = "Lib";
	["Magisters' Terrace"] = "Terrasse des Magistères"; ["MT"] = "MT";
	["Magtheridon's Lair"] = "Le repaire de Magtheridon"; ["Mag"] = "Mag";
	["Mana-Tombs"] = "Tombes-mana"; ["MT"] = "MT";
	["Maraudon"] = "Maraudon"; ["Mara"] = "Mara";
	["Molten Core"] = "Cœur du Magma"; ["MC"] = "MC";
	["Naxxramas"] = "Naxxramas"; ["Nax"] = "Nax";
	["Old Hillsbrad Foothills"] = "Contreforts de Hautebrande d'antan"; ["CoT1"] = "CoT1/GT1";
	["Onyxia's Lair"] = "Repaire d'Onyxia"; ["Ony"] = "Ony";
	["Ragefire Chasm"] = "Gouffre de Ragefeu"; ["RFC"] = "RFC";
	["Razorfen Downs"] = "Souilles de Tranchebauge"; ["RFD"] = "RFD";
	["Razorfen Kraul"] = "Kraal de Tranchebauge"; ["RFK"] = "RFK";
	["Ruins of Ahn'Qiraj"] = "Ruines d'Ahn'Qiraj"; ["AQ20"] = "AQ20";
	["Scarlet Monastery"] = "Monastère écarlate"; ["SM"] = "SM/Le Mona";
	["Scholomance"] = "Scholomance"; ["Scholo"] = "Scholo";
	["Serpentshrine Cavern"] = "Caverne du sanctuaire du Serpent"; ["SC"] = "SSC";
	["Sethekk Halls"] = "Les salles des Sethekk"; ["Seth"] = "Seth";
	["Shadow Labyrinth"] = "Labyrinthe des ombres"; ["SL"] = "SL/Laby";
	["Shadowfang Keep"] = "Donjon d'Ombrecroc"; ["SFK"] = "SFK";
	["Stratholme"] = "Stratholme"; ["Strat"] = "Strat";
	["Sunken Temple"] = "Temple englouti"; ["ST"] = "ST";
	["Sunwell Plateau"] = "Plateau du Puits de soleil"; ["SP"] = "SP";
	["Tempest Keep"] = "Donjon de la Tempête"; ["TK"] = "TK";
	["Temple of Ahn'Qiraj"] = "Ahn'Qiraj"; ["AQ40"] = "AQ40";
	["The Arcatraz"] = "L'Arcatraz"; ["Arca"] = "Arca";
	["The Black Morass"] = "Le Noir Marécage"; ["CoT2"] = "CoT2/GT2";
	["The Blood Furnace"] = "La Fournaise du sang"; ["BF"] = "BF";
	["The Botanica"] = "La Botanica"; ["Bota"] = "Bota";
	["The Deadmines"] = "Les Mortemines"; ["VC"] = "VC";
	["The Eye"] = "L'Œil"; ["Eye"] = "Eye/TK";
	["The Mechanar"] = "Le Méchanar"; ["Mech"] = "Mech";
	["The Shattered Halls"] = "Les Salles brisées"; ["SH"] = "SH";
	["The Slave Pens"] = "Les enclos aux esclaves"; ["SP"] = "SP";
	["The Steamvault"] = "Le Caveau de la vapeur"; ["SV"] = "SV";
	["The Stockade"] = "La Prison"; ["Stocks"] = "Stocks/Prison";
	["The Underbog"] = "La Basse-tourbière"; ["UB"] = "UB";
	["Uldaman"] = "Uldaman"; ["Uld"] = "Uld";
	["Wailing Caverns"] = "Cavernes des lamentations"; ["WC"] = "WC/Lam";
	["Zul'Aman"] = "Zul'Aman"; ["ZA"] = "ZA";
	["Zul'Farrak"] = "Zul'Farrak"; ["ZF"] = "ZF";
	["Zul'Gurub"] = "Zul'Gurub"; ["ZG"] = "ZG";
	
	--Continents
	["Eastern Kingdoms"] = "Royaumes de l'Est";
	["Kalimdor"] = "Kalimdor";
	["Outland"] = "Outreterre";
	
	--Outdoor zones, Locations
	["Ashenvale"] = "Orneval";
	["Badlands"] = "Terres ingrates";
	["Blackrock Mountain"] = "Mont Rochenoire"; ["BRM"] = "BRM";
	["Blade's Edge Mountains"] = "Les Tranchantes";
	["Burning Steppes"] = "Steppes ardentes";
	["Deadwind Pass"] = "Défilé de Deuillevent";
	["Desolace"] = "Désolace";
	["Dun Morogh"] = "Dun Morogh";
	["Dustwallow Marsh"] = "Marécage d'Âprefange";
	["Eastern Plaguelands"] = "Maleterres de l'est";
	["Feralas"] = "Féralas";
	["Ghostlands"] = "Terres Fantômes";
	["Hellfire Peninsula"] = "Péninsule des Flammes infernales";
	["Isle of Quel'Danas"] = "Île de Quel’Danas";
	["Netherstorm"] = "Raz-de-Néant";
	["Orgrimmar"] = "Orgrimmar";
	["Searing Gorge"] = "Gorge des Vents brûlants";
	["Shadowmoon Valley"] = "Vallée d'Ombrelune";
	["Silithus"] = "Silithus";
	["Silverpine Forest"] = "Forêt des Pins Argentés";
	["Stormwind City"] = "Hurlevent";
	["Stranglethorn Vale"] = "Vallée de Strangleronce";
	["Swamp of Sorrows"] = "Marais des Chagrins";
	["Tanaris"] = "Tanaris";
	["Terokkar Forest"] = "Forêt de Terokkar";
	["The Barrens"] = "Les Tarides";
	["Tirisfal Glades"] = "Clairières de Tirisfal";
	["Western Plaguelands"] = "Maleterres de l'ouest";
	["Westfall"] = "Marche de l'Ouest";
	["Zangarmarsh"] = "Marécage de Zangar";

--************************************************
-- Kalimdor Instance Data
--************************************************

	--Ragefire Chasm
	["Maur Grimtotem"] = "Maur Totem-sinistre";
	["Oggleflint <Ragefire Chieftain>"] = "Lorgnesilex <Chef Ragefeu>";
	["Taragaman the Hungerer"] = "Taragaman l'Affameur";
	["Jergosh the Invoker"] = "Jergosh l'Invocateur";
	["Zelemar the Wrathful"] = "Zelemar le Courroucé";
	["Bazzalan"] = "Bazzalan";
	
	--Wailing Caverns
	["Disciple of Naralex"] = "Disciple de Naralex";
	["Lord Cobrahn <Fanglord>"] = "Seigneur Cobrahn <Seigneur-Croc>";
	["Lady Anacondra <Fanglord>"] = "Dame Anacondra <Seigneur-Croc>";
	["Kresh"] = "Kresh";
	["Lord Pythas <Fanglord>"] = "Seigneur Pythas <Seigneur-Croc>";
	["Skum"] = "Skum";
	["Lord Serpentis <Fanglord>"] = "Seigneur Serpentis <Seigneur-Croc>";
	["Verdan the Everliving"] = "Verdan l'Immortel";
	["Mutanus the Devourer"] = "Mutanus le Dévoreur";
	["Naralex"] = "Naralex";
	["Deviate Faerie Dragon"] = "Dragon féerique déviant";
	
	--Blackfathom Deeps
	["Ghamoo-ra"] = "Ghamoo-ra";
	["Lorgalis Manuscript"] = "Manuscrit de Lorgalis";
	["Lady Sarevess"] = "Dame Sarevess";
	["Argent Guard Thaelrid <The Argent Dawn>"] = "Garde d’argent Thaelrid <L'Aube d'argent>";
	["Gelihast"] = "Gelihast";
	["Shrine of Gelihast"] = "Autel de Gelihast";
	["Lorgus Jett"] = "Lorgus Jett";
	["Fathom Stone"] = "Noyau de la Brasse";
	["Baron Aquanis"] = "Baron Aquanis";
	["Twilight Lord Kelris"] = "Seigneur du crépuscule Kelris";
	["Old Serra'kis"] = "Vieux Serra'kis";
	["Aku'mai"] = "Aku'mai";
	["Morridune"] = "Morridune";
	["Altar of the Deeps"] = "Autel des profondeurs";
	
	--Razorfen Kraul
	["Roogug"] = "Roogug";
	["Aggem Thorncurse <Death's Head Prophet>"] = "Aggem Malépine <Prophète de la Tête de mort>";
	["Death Speaker Jargba <Death's Head Captain>"] = "Nécrorateur Jargba <Capitaine des Têtes de mort>";
	["Overlord Ramtusk"] = "Seigneur Brusquebroche";
	["Razorfen Spearhide"] = "Lanceur de Tranchebauge";
	["Agathelos the Raging"] = "Agathelos le Déchaîné";
	["Blind Hunter"] = "Chasseur aveugle";
	["Charlga Razorflank <The Crone>"] = "Charlga Trancheflanc <La mégère>";
	["Willix the Importer"] = "Willix l’Importateur";
	["Heralath Fallowbrook"] = "Heralath Ruissefriche";
	["Earthcaller Halmgar"] = "Implorateur de la terre Halmgar";

	--Razorfen Downs
	["Tuten'kash"] = "Tuten'kash";
	["Henry Stern"] = "Henry Stern";
	["Belnistrasz"] = "Belnistrasz";
	["Sah'rhee"] = "Sah'rhee";
	["Mordresh Fire Eye"] = "Mordresh Oeil-de-feu";
	["Glutton"] = "Glouton";
	["Ragglesnout"] = "Ragglesnout";
	["Amnennar the Coldbringer"] = "Amnennar le Porte-froid";
	["Plaguemaw the Rotting"] = "Pestegueule le Pourrissant";
	
	--Zul'Farrak
	["Mallet of Zul'Farrak"] = "Marteau de Zul'Farrak";
	["Antu'sul <Overseer of Sul>"] = "Antu'sul <Surveillant de Sul>";
	["Theka the Martyr"] = "Theka le Martyr";
	["Witch Doctor Zum'rah"] = "Sorcier-docteur Zum'rah";
	["Zul'Farrak Dead Hero"] = "Héros mort de Zul'Farrak";
	["Nekrum Gutchewer"] = "Nekrum Mâchentrailles";
	["Shadowpriest Sezz'ziz"] = "Prêtre des ombres Sezz'ziz";
	["Dustwraith"] = "Ame en peine poudreuse";
	["Sergeant Bly"] = "Sergent Bly";
	["Weegli Blastfuse"] = "Gigoto Explomèche";
	["Murta Grimgut"] = "Murta Mornentraille";
	["Raven"] = "Corbeau";
	["Oro Eyegouge"] = "Oro Crève-oeil";
	["Sandfury Executioner"] = "Bourreau Furie-des-sables";
	["Hydromancer Velratha"] = "Hydromancienne Velratha";
	["Gahz'rilla"] = "Gahz'rilla";
	["Elder Wildmane"] = "Ancienne Crin-sauvage";
	["Chief Ukorz Sandscalp"] = "Chef Ukorz Scalpessable";
	["Ruuzlu"] = "Ruuzlu";
	["Zerillis"] = "Zerillis";
	["Sandarr Dunereaver"] = "Sandarr Ravadune";
	
	--Maraudon	
	["Scepter of Celebras"] = "Sceptre de Celebras";
	["Veng <The Fifth Khan>"] = "Veng <Le cinquième Kahn>";
	["Noxxion"] = "Noxcion";
	["Razorlash"] = "Tranchefouet";
	["Maraudos <The Fourth Khan>"] = "Maraudos <Le quatrième Kahn>";
	["Lord Vyletongue"] = "Seigneur Vylelangue";
	["Meshlok the Harvester"] = "Meshlok le Moissonneur";
	["Celebras the Cursed"] = "Celebras le Maudit";
	["Landslide"] = "Glissement de terrain";
	["Tinkerer Gizlock"] = "Bricoleur Kadenaz";
	["Rotgrip"] = "Grippe-charogne";
	["Princess Theradras"] = "Princesse Theradras";
	["Elder Splitrock"] = "Ancien Pierre-fendue";
	
	--Dire Maul (East)
	["Pusillin"] = "Pusillin";
	["Zevrim Thornhoof"] = "Zevrim Sabot-de-ronce";
	["Hydrospawn"] = "Hydrogénos";
	["Lethtendris"] = "Lethtendris";
	["Pimgib"] = "Pimgib";
	["Old Ironbark"] = "Vieil Ecorcefer";
	["Alzzin the Wildshaper"] = "Alzzin le modeleur";
	["Isalien"] = "Isalien";
	
	--Dire Maul (North)
	["Crescent Key"] = "Clé en croissant";
	["Library"] = "Bibliothèque";
	["Guard Mol'dar"] = "Garde Mol'dar";
	["Stomper Kreeg <The Drunk>"] = "Kreeg le Marteleur <L'ivrogne>";
	["Guard Fengus"] = "Garde Fengus";
	["Knot Thimblejack"] = "Noué Dédodevie";
	["Guard Slip'kik"] = "Garde Slip'kik";
	["Captain Kromcrush"] = "Capitaine Kromcrush";
	["King Gordok"] = "Roi Gordok";
	["Cho'Rush the Observer"] = "Cho'Rush l'Observateur";

	--Dire Maul (West)
	["J'eevee's Jar"] = "Bocal de J'eevee";
	["Pylons"] = "Pylônes";
	["Shen'dralar Ancient"] = "Ancienne de Shen'Dralar";
	["Tendris Warpwood"] = "Tendris Crochebois";
	["Ancient Equine Spirit"] = "Ancien esprit équin";
	["Illyanna Ravenoak"] = "Illyanna Corvichêne";
	["Ferra"] = "Ferra";
	["Magister Kalendris"] = "Magistère Kalendris";
	["Tsu'zee"] = "Tsu'zee";
	["Immol'thar"] = "Immol'thar";
	["Lord Hel'nurath"] = "Seigneur Hel'nurath";
	["Prince Tortheldrin"] = "Prince Tortheldrin";
	["Falrin Treeshaper"] = "Falrin Sculpteflore";
	["Lorekeeper Lydros"] = "Gardien du savoir Lydros";
	["Lorekeeper Javon"] = "Gardien du savoir Javon";
	["Lorekeeper Kildrath"] = "Gardien du savoir Kildrath";
	["Lorekeeper Mykos"] = "Gardienne du savoir Mykos";
	["Shen'dralar Provisioner"] = "Approvisionneur Shen'dralar";
	["Skeletal Remains of Kariel Winthalus"] = "Restes squelettiques de Kariel Winthalus";
	
	--Onyxia's Lair
	["Drakefire Amulet"] = "Amulette drakefeu";
	["Onyxian Warders"] = "Gardiens onyxiens";
	["Whelp Eggs"] = "Œufs";
	["Onyxia"] = "Onyxia";

	--Temple of Ahn'Qiraj
	["Brood of Nozdormu"] = "Progéniture de Nozdormu";
	["The Prophet Skeram"] = "Le Prophète Skeram";
	["The Bug Family"] = "La famille insecte";
	["Vem"] = "Vem";
	["Lord Kri"] = "Seigneur Kri";
	["Princess Yauj"] = "Princesse Yauj";
	["Battleguard Sartura"] = "Garde de guerre Sartura";
	["Fankriss the Unyielding"] = "Fankriss l'Inflexible";
	["Viscidus"] = "Viscidus";
	["Princess Huhuran"] = "Princesse Huhuran";
	["Twin Emperors"] = "Les Empereurs jumeaux";
	["Emperor Vek'lor"] = "Empereur Vek'lor";
	["Emperor Vek'nilash"] = "Empereur Vek'nilash";
	["Ouro"] = "Ouro";
	["Eye of C'Thun"] = "Œil de C'Thun";
	["C'Thun"] = "C'Thun";
	["Andorgos <Brood of Malygos>"] = "Andorgos <Rejeton de Malygos>";
	["Vethsera <Brood of Ysera>"] = "Vethsera <Rejeton d'Ysera>";
	["Kandrostrasz <Brood of Alexstrasza>"] = "Kandrostrasz <Rejeton d'Alexstrasza>";
	["Arygos"] = "Arygos";
	["Caelestrasz"] = "Caelestrasz";
	["Merithra of the Dream"] = "Merithra du Rêve";
	
	--Ruins of Ahn'Qiraj
	["Cenarion Circle"] = "Cercle cénarien";
	["Kurinnaxx"] = "Kurinnaxx";
	["Lieutenant General Andorov"] = "Général de division Andorov";
	["Four Kaldorei Elites"] = "Quatre Elite kaldorei";
	["General Rajaxx"] = "Général Rajaxx";
	["Captain Qeez"] = "Capitaine Qeez";
	["Captain Tuubid"] = "Capitaine Tuubid";
	["Captain Drenn"] = "Capitaine Drenn";
	["Captain Xurrem"] = "Capitaine Xurrem";
	["Major Yeggeth"] = "Major Yeggeth";
	["Major Pakkon"] = "Major Parron";
	["Colonel Zerran"] = "Colonel Zerran";
	["Moam"] = "Moam";
	["Buru the Gorger"] = "Buru Grandgosier";
	["Ayamiss the Hunter"] = "Ayamiss le Chasseur";
	["Ossirian the Unscarred"] = "Ossirian l'Intouché";
	["Safe Room"] = "Pièce sûre";

	--CoT: The Black Morass
	["Opening of the Dark Portal"] = "Ouverture de la Porte des Ténèbres";
	["Keepers of Time"] = "Gardiens du Temps";
	["Key of Time"] = "Clé du Temps";
	["Sa'at <Keepers of Time>"] = "Sa'at <Les Gardiens du temps>";
	["Wave 6: Chrono Lord Deja"] = "Vague 6 : Chronoseigneur Déjà";
	["Wave 12: Temporus"] = "Vague 12 : Temporus";
	["Wave 18: Aeonus"] = "Vague 18 : Aeonus";
	["The Dark Portal"] = "La Porte des Ténèbres";
	["Medivh"] = "Medivh";

	--CoT: Hyjal Summit
	["Battle for Mount Hyjal"] = "Bataille pour le Mont Hyjal";
	["The Scale of the Sands"] = "La Balance des sables";
	["Alliance Base"] = "Base de l'Alliance";
	["Lady Jaina Proudmoore"] = "Dame Jaina Portvaillant";
	["Horde Encampment"] = "Campement de la Horde";
	["Thrall <Warchief>"] = "Thrall <Chef de guerre>";
	["Night Elf Village"] = "Village des Elfes de la Nuit";
	["Tyrande Whisperwind <High Priestess of Elune>"] = "Tyrande Murmevent <Grande prêtresse d'Elune>";
	["Rage Winterchill"] = "Rage Froidhiver";
	["Anetheron"] = "Anetheron";
	["Kaz'rogal"] = "Kazgorath";
	["Azgalor"] = "Azgalor";
	["Archimonde"] = "Archimonde";
	["Indormi <Keeper of Ancient Gem Lore>"] = "Indormi <Gardienne du savoir ancien des gemmes>";
	["Tydormu <Keeper of Lost Artifacts>"] = "Tydormu <Gardien des artefacts perdus>";

	--CoT: Old Hillsbrad Foothills
	["Escape from Durnholde Keep"] = "L'évasion du Fort-de-Durn";
	["Erozion"] = "Erozion";
	["Brazen"] = "Airain";
	["Landing Spot"] = "Zone d'atterrissage";
	["Southshore"] = "Austrivage";
	["Tarren Mill"] = "Moulin-de-Tarren";
	["Lieutenant Drake"] = "Lieutenant Drake";
	["Thrall"] = "Thrall";
	["Captain Skarloc"] = "Capitaine Skarloc";
	["Epoch Hunter"] = "Chasseur d'époques";
	["Taretha"] = "Taretha";
	["Jonathan Revah"] = "Jonathan Revah";
	["Jerry Carter"] = "Jerry Carter";
	["Traveling"] = "Itinérants";
	["Thomas Yance <Travelling Salesman>"] = "Thomas Yance <Marchand itinérant>";
	["Aged Dalaran Wizard"] = "Sorcier de Dalaran âgé";
	["Kel'Thuzad <The Kirin Tor>"] = "Kel'Thuzad <Le Kirin Tor>";
	["Helcular"] = "Helcular";
	["Farmer Kent"] = "Kent le fermier";
	["Sally Whitemane"] = "Sally Blanchetête";
	["Renault Mograine"] = "Renault Mograine";
	["Little Jimmy Vishas"] = "Petit Jimmy Vishas";
	["Herod the Bully"] = "Hérode le Malmeneur";
	["Nat Pagle"] = "Nat Pagle";
	["Hal McAllister"] = "Hal McAllister";
	["Zixil <Aspiring Merchant>"] = "Zixil <Marchand en herbe>";
	["Overwatch Mark 0 <Protector>"] = "Vigilant modèle 0 <Protecteur>";
	["Southshore Inn"] = "Auberge d'Austrivage";
	["Captain Edward Hanes"] = "Capitaine Edward Hanes";
	["Captain Sanders"] = "Capitaine Sanders";
	["Commander Mograine"] = "Commandant Mograine";
	["Isillien"] = "Isillien";
	["Abbendis"] = "Abbendis";
	["Fairbanks"] = "Fairbanks";
	["Tirion Fordring"] = "Tirion Fordring";
	["Arcanist Doan"] = "Arcaniste Doan";
	["Taelan"] = "Taelan";
	["Barkeep Kelly <Bartender>"] = "Kelly le serveur <Tavernier>";
	["Frances Lin <Barmaid>"] = "Frances Lin <Serveuse>";
	["Chef Jessen <Speciality Meat & Slop>"] = "Chef Jessen <Spécialités de viandes & pâtées>";
	["Stalvan Mistmantle"] = "Stalvan Mantebrume";
	["Phin Odelic <The Kirin Tor>"] = "Phin Odelic <Le Kirin Tor>";
	["Southshore Town Hall"] = "Hôtel de ville d'Austrivage";
	["Magistrate Henry Maleb"] = "Magistrat Henry Maleb";
	["Raleigh the True"] = "Raleigh le Vrai";
	["Nathanos Marris"] = "Nathanos Marris";
	["Bilger the Straight-laced"] = "Sentine le Guindé";
	["Innkeeper Monica"] = "Aubergiste Monica";
	["Julie Honeywell"] = "Julie Miellepuits";
	["Jay Lemieux"] = "Jay Lemieux";
	["Young Blanchy"] = "Jeune Blanchy";

--****************************
-- Eastern Kingdoms Instances
--****************************
	
	--Blackrock Depths
	["Shadowforge Key"] = "Clé ombreforge";
	["Prison Cell Key"] = "Clé de la prison";
	["Jail Break!"] = "Evasion !";
	["Banner of Provocation"] = "Bannière de provocation";
	["Lord Roccor"] = "Seigneur Roccor";
	["Kharan Mighthammer"] = "Kharan Force-martel";
	["Commander Gor'shak <Kargath Expeditionary Force>"] = "Commandant Gor'shak <Corps expéditionnaire de Kargath>";
	["Marshal Windsor"] = "Maréchal Windsor";
	["High Interrogator Gerstahn <Twilight's Hammer Interrogator>"] = "Grand Interrogateur Gerstahn <Inquisiteur du Marteau du crépuscule>";
	["Ring of Law"] = "Cercle de la loi";
	["Anub'shiah"] = "Anub'shiah";
	["Eviscerator"] = "Eviscérateur";
	["Gorosh the Dervish"] = "Gorosh le Derviche";
	["Grizzle"] = "Grison";
	["Hedrum the Creeper"] = "Hedrum le Rampant";
	["Ok'thor the Breaker"] = "Ok'thor le Briseur";
	["Theldren"] = "Theldren";
	["Lefty"] = "Le Gaucher";
	["Malgen Longspear"] = "Malgen Long-épieu";
	["Gnashjaw <Malgen Longspear's Pet>"] = "Grince-mâchoires <Familier de Malgen Longspear>";
	["Rotfang"] = "Crocs-pourris";
	["Va'jashni"] = "Va'jashni";
	["Houndmaster Grebmar"] = "Maître-chien Grebmar";
	["Elder Morndeep"] = "Ancien Gouffre-du-matin";
	["High Justice Grimstone"] = "Juge Supérieur Mornepierre";
	["Monument of Franclorn Forgewright"] = "Statue de Franclorn Le Forgebusier";
	["Pyromancer Loregrain"] = "Pyromancien Blé-du-savoir";
	["The Vault"] = "La Chambre forte";
	["Warder Stilgiss"] = "Gardien Stilgiss";
	["Verek"] = "Verek";
	["Watchman Doomgrip"] = "Sentinelle Ruinepoigne";
	["Fineous Darkvire <Chief Architect>"] = "Fineous Sombrevire <Chef architecte>";
	["The Black Anvil"] = "L'Enclume noire";
	["Lord Incendius"] = "Seigneur Incendius";
	["Bael'Gar"] = "Bael'Gar";
	["Shadowforge Lock"] = "Le verrou d'Ombreforge";
	["General Angerforge"] = "Général Forgehargne";
	["Golem Lord Argelmach"] = "Seigneur golem Argelmach";
	["Field Repair Bot 74A"] = "Robot réparateur 74A";
	["The Grim Guzzler"] = "Le sinistre dévoreur";
	["Hurley Blackbreath"] = "Hurley Soufflenoir";
	["Lokhtos Darkbargainer <The Thorium Brotherhood>"] = "Lokhtos Sombrescompte <La Confrérie du thorium>";
	["Mistress Nagmara"] = "Gouvernante Nagmara";
	["Phalanx"] = "Phalange";
	["Plugger Spazzring"] = "Lanfiche Brouillecircuit";
	["Private Rocknot"] = "Soldat Rochenoeud";
	["Ribbly Screwspigot"] = "Ribbly Fermevanne";
	["Coren Direbrew"] = "Coren Navrebière";
	["Ambassador Flamelash"] = "Ambassadeur Cinglefouet";
	["Panzor the Invincible"] = "Panzor l'Invincible";
	["Summoner's Tomb"] = "La tombe des invocateurs";
	["The Lyceum"] = "Le Lyceum";
	["Magmus"] = "Magmus";
	["Emperor Dagran Thaurissan"] = "Empereur Dagran Thaurissan";
	["Princess Moira Bronzebeard <Princess of Ironforge>"] = "Princesse Moira Barbe-de-bronze <Princesse de Forgefer>";
	["High Priestess of Thaurissan"] = "Grande prêtresse de Thaurissan";
	["The Black Forge"] = "La Forge noire";
	["Core Fragment"] = "Fragment du Magma";
	["Overmaster Pyron"] = "Grand seigneur Pyron";

	--Blackrock Spire (Lower)
	["Vaelan"] = "Vaelan";
	["Warosh <The Cursed>"] = "Warosh <Les maudits>";
	["Elder Stonefort"] = "Ancien Fort-de-pierre";
	["Roughshod Pike"] = "Pique de fortune";
	["Spirestone Butcher"] = "Boucher Pierre-du-pic";
	["Highlord Omokk"] = "Généralissime Omokk";
	["Spirestone Battle Lord"] = "Seigneur de bataille Pierre-du-pic";
	["Spirestone Lord Magus"] = "Seigneur magus Pierre-du-pic";
	["Shadow Hunter Vosh'gajin"] = "Chasseresse des ombres Vosh'gajin";
	["Fifth Mosh'aru Tablet"] = "Cinquième tablette Mosh'aru";
	["Bijou"] = "Bijou";
	["War Master Voone"] = "Maître de guerre Voone";
	["Mor Grayhoof"] = "Mor Sabot-gris";
	["Sixth Mosh'aru Tablet"] = "Sixième tablette Mosh'aru";
	["Bijou's Belongings"] = "Affaires de Bijou";
	["Human Remains"] = "Restes humains";
	["Unfired Plate Gauntlets"] = "Gantelets en plaques inachevés";
	["Bannok Grimaxe <Firebrand Legion Champion>"] = "Bannok Hache-sinistre <Champion de la légion Brandefeu>";
	["Mother Smolderweb"] = "Matriarche Couveuse";
	["Crystal Fang"] = "Croc cristallin";
	["Urok's Tribute Pile"] = "Pile d'offrandes à Urok";
	["Urok Doomhowl"] = "Urok Hurleruine";
	["Quartermaster Zigris <Bloodaxe Legion>"] = "Intendant Zigris <Légion Hache-sanglante>";
	["Halycon"] = "Halycon";
	["Gizrul the Slavener"] = "Gizrul l'esclavagiste";
	["Ghok Bashguud <Bloodaxe Champion>"] = "Ghok Bounnebaffe <Champion des Hache-sanglante>";
	["Overlord Wyrmthalak"] = "Seigneur Wyrmthalak";
	["Burning Felguard"] = "Gangregarde ardent";

	--Blackrock Spire (Upper)
	["Seal of Ascension"] = "Sceau d'ascension";
	["Pyroguard Emberseer"] = "Pyrogarde Prophète ardent";
	["Solakar Flamewreath"] = "Solakar Voluteflamme";
	["Father Flame"] = "Père des flammes";
	["Darkstone Tablet"] = "Tablette de Sombrepierre";
	["Doomrigger's Coffer"] = "Fermoir de Frèteruine";
	["Jed Runewatcher <Blackhand Legion>"] = "Jed Guette-runes <Légion Main-noire>";
	["Goraluk Anvilcrack <Blackhand Legion Armorsmith>"] = "Goraluk Brisenclume <Fabricant d'armures de la légion Main-noire>";
	["Warchief Rend Blackhand"] = "Chef de guerre Rend Main-noire";
	["Gyth <Rend Blackhand's Mount>"] = "Gyth <Monture de Rend Main-noire>";
	["Awbee"] = "Awbee";
	["The Beast"] = "La Bête";
	["Lord Valthalak"] = "Seigneur Valthalak";
	["Finkle Einhorn"] = "Finkle Einhorn";
	["General Drakkisath"] = "Général Drakkisath";
	["Drakkisath's Brand"] = "Marque de Drakkisath";

	--Blackwing Lair
	["Razorgore the Untamed"] = "Tranchetripe l'Indompté";
	["Vaelastrasz the Corrupt"] = "Vaelastrasz le Corrompu";
	["Broodlord Lashlayer"] = "Seigneur des couvées Lanistaire";
	["Firemaw"] = "Gueule-de-feu";
	["Draconic for Dummies (Chapter VII)"] = "Le draconique pour les nuls (Chapitre VII)";
	["Master Elemental Shaper Krixix"] = "Maître élémentaire Krixix le Sculpteur";
	["Ebonroc"] = "Rochébène";
	["Flamegor"] = "Flamegor";
	["Chromaggus"] = "Chromaggus";
	["Nefarian"] = "Nefarian";

	--Gnomeregan
	["Workshop Key"] = "Clé d'atelier";
	["Blastmaster Emi Shortfuse"] = "Maître-dynamiteur Emi Courtemèche";
	["Grubbis"] = "Grubbis";
	["Chomper"] = "Mâchouilleur";
	["Clean Room"] = "Zone propre";
	["Tink Sprocketwhistle <Engineering Supplies>"] = "Bricolo Sifflepignon <Fournitures d'ingénieur>";
	["The Sparklematic 5200"] = "Le Brille-o-Matic 5200";
	["Mail Box"] = "Boîte aux lettres";
	["Kernobee"] = "Kernobee";
	["Alarm-a-bomb 2600"] = "Alarme-bombe 2600";
	["Matrix Punchograph 3005-B"] = "Matrice d'Encodage 3005-B";
	["Viscous Fallout"] = "Retombée visqueuse";
	["Electrocutioner 6000"] = "Electrocuteur 6000";
	["Matrix Punchograph 3005-C"] = "Matrice d'Encodage 3005-C";
	["Crowd Pummeler 9-60"] = "Faucheur de foule 9-60";
	["Matrix Punchograph 3005-D"] = "Matrice d'Encodage 3005-D";
	["Dark Iron Ambassador"] = "Ambassadeur Sombrefer";
	["Mekgineer Thermaplugg"] = "Mekgénieur Thermojoncteur";

	--Molten Core
	["Hydraxian Waterlords"] = "Les Hydraxiens";
	["Aqual Quintessence"] = "Quintessence aquatique";
	["Eternal Quintessence"] = "Quintessence éternelle";
	["Lucifron"] = "Lucifron";
	["Magmadar"] = "Magmadar";
	["Gehennas"] = "Gehennas";
	["Garr"] = "Garr";
	["Shazzrah"] = "Shazzrah";
	["Baron Geddon"] = "Baron Geddon";
	["Golemagg the Incinerator"] = "Golemagg l'Incinérateur";
	["Sulfuron Harbinger"] = "Messager de Sulfuron";
	["Majordomo Executus"] = "Chambellan Executus";
	["Ragnaros"] = "Ragnaros";

	--SM: Library
	["Houndmaster Loksey"] = "Maître-chien Loksey";
	["Arcanist Doan"] = "Arcaniste Doan";

	--SM: Armory
	["The Scarlet Key"] = "La Clé écarlate";
	["Herod <The Scarlet Champion>"] = "Hérode <Le champion écarlate>";

	--SM: Cathedral
	["High Inquisitor Fairbanks"] = "Grand Inquisiteur Fairbanks";
	["Scarlet Commander Mograine"] = "Commandant écarlate Mograine";
	["High Inquisitor Whitemane"] = "Grande inquisitrice Blanchetête";

	--SM: Graveyard
	["Interrogator Vishas"] = "Interrogateur Vishas";
	["Vorrel Sengutz"] = "Vorrel Sengutz";
	["Pumpkin Shrine"] = "Sanctuaire Citrouille";
	["Headless Horseman"] = "Cavalier sans tête";
	["Bloodmage Thalnos"] = "Mage de sang Thalnos";
	["Ironspine"] = "Echine-de-fer";
	["Azshir the Sleepless"] = "Azshir le Sans-sommeil";
	["Fallen Champion"] = "Champion déchu";

	--Scholomance
	["Skeleton Key"] = "Clé squelette";
	["Viewing Room Key"] = "Clé de la Chambre des visions";
	["Viewing Room"] = "Chambre des visions";
	["Blood of Innocents"] = "Sang des innocents";
	["Divination Scryer"] = "Clairvoyant";
	["Darkreaver"] = "Ravassombre";
	["Blood Steward of Kirtonos"] = "Régisseuse sanglante de Kirtonos";
	["The Deed to Southshore"] = "Titre de propriété d'Austrivage";
	["Kirtonos the Herald"] = "Kirtonos le Héraut";
	["Jandice Barov"] = "Jandice Barov";
	["The Deed to Tarren Mill"] = "Titre de propriété de Moulin-de-Tarren";
	["Rattlegore"] = "Cliquettripes";
	["Death Knight Darkreaver"] = "Chevalier de la mort Ravassombre";
	["Marduk Blackpool"] = "Marduk Noirétang";
	["Vectus"] = "Vectus";
	["Ras Frostwhisper"] = "Ras Murmegivre";
	["The Deed to Brill"] = "Titre de propriété de Brill";
	["Kormok"] = "Kormok";
	["Instructor Malicia"] = "Instructeur Malicia";
	["Doctor Theolen Krastinov <The Butcher>"] = "Docteur Theolen Krastinov <Le Boucher>";
	["Lorekeeper Polkelt"] = "Gardien du savoir Polkelt";
	["The Ravenian"] = "Le Voracien";
	["Lord Alexei Barov"] = "Seigneur Alexei Barov";
	["The Deed to Caer Darrow"] = "Titre de propriété de Caer Darrow";
	["Lady Illucia Barov"] = "Dame Illucia Barov";
	["Darkmaster Gandling"] = "Sombre Maître Gandling";
	["Torch Lever"] = "Torche levier";
	["Secret Chest"] = "Vieux coffre au trésor";
	["Alchemy Lab"] = "Laboratoire d'alchimie";

	--Shadowfang Keep
	["Deathsworn Captain"] = "Capitaine Ligemort";
	["Rethilgore <The Cell Keeper>"] = "Rethiltripe <Le gardien de la cellule>";
	["Sorcerer Ashcrombe"] = "Ensorceleur Ashcrombe";
	["Deathstalker Adamant"] = "Nécrotraqueur Adamant";
	["Landen Stilwell"] = "Landen Morpuits";
	["Deathstalker Vincent"] = "Nécrotraqueur Vincent";
	["Fel Steed"] = "Palefroi corrompu";
	["Jordan's Hammer"] = "Marteau de Jordan";
	["Crate of Ingots"] = "Caisse de lingots";
	["Razorclaw the Butcher"] = "Tranchegriffe le Boucher";
	["Baron Silverlaine"] = "Baron d'Argelaine";
	["Commander Springvale"] = "Commandant Printeval";
	["Odo the Blindwatcher"] = "Odo l'Aveugle";
	["Fenrus the Devourer"] = "Fenrus le Dévoreur";
	["Arugal's Voidwalker"] = "Marcheur du Vide d’Arugal";
	["The Book of Ur"] = "Le Livre d'Ur";
	["Wolf Master Nandos"] = "Maître-loup Nandos";
	["Archmage Arugal"] = "Archimage Arugal";
	
	--Stratholme
	["The Scarlet Key"] = "La Clé écarlate";
	["Key to the City"] = "Clé de la ville";
	["Various Postbox Keys"] = "Clé des boîtes à lettres";
	["Living Side"] = "Coté Phalange";
	["Undead Side"] = "Coté Baron";
	["Skul"] = "Krân";
	["Stratholme Courier"] = "Messager de Stratholme";
	["Fras Siabi"] = "Fras Siabi";
	["Atiesh <Hand of Sargeras>"] = "Atiesh <Main de Sargeras>";
	["Hearthsinger Forresten"] = "Chanteloge Forrestin";
	["The Unforgiven"] = "Le Condamné";
	["Elder Farwhisper"] = "Ancien Murmeloin";
	["Timmy the Cruel"] = "Timmy le Cruel";
	["Malor the Zealous"] = "Malor le Zélé";
	["Malor's Strongbox"] = "Coffre de Malor";
	["Crimson Hammersmith"] = "Forgeur de marteaux cramoisi";
	["Cannon Master Willey"] = "Maître canonnier Willey";
	["Archivist Galford"] = "Archiviste Galford";
	["Grand Crusader Dathrohan"] = "Grand croisé Dathrohan";
	["Balnazzar"] = "Balnazzar";
	["Sothos"] = "Sothos";
	["Jarien"] = "Jarien";
	["Magistrate Barthilas"] = "Magistrat Barthilas";
	["Aurius"] = "Aurius";
	["Stonespine"] = "Echine-de-pierre";
	["Baroness Anastari"] = "Baronne Anastari";
	["Black Guard Swordsmith"] = "Fabricant d'épées de la Garde noire";
	["Nerub'enkan"] = "Nerub'enkan";
	["Maleki the Pallid"] = "Maleki le Blafard";
	["Ramstein the Gorger"] = "Ramstein Grandgosier";
	["Baron Rivendare"] = "Baron Vaillefendre";
	["Ysida Harmon"] = "Ysida Harmon";
	["Crusaders' Square Postbox"] = "Boîte de la place des Croisés";
	["Market Row Postbox"] = "Boîte de l'allée du Marché";
	["Festival Lane Postbox"] = "Boîte de l'allée du Festival";
	["Elders' Square Postbox"] = "Boîte de la place des Anciens";
	["King's Square Postbox"] = "Boîte de la place du Roi";
	["Fras Siabi's Postbox"] = "Boîte de Fras Siabi";
	["3rd Box Opened"] = "3ème boîte ouverte";
	["Postmaster Malown"] = "Postier Malown";
	
	--The Deadmines
	["Rhahk'Zor <The Foreman>"] = "Rhahk'Zor <Le contremaître>";
	["Miner Johnson"] = "Mineur Johnson";
	["Sneed <Lumbermaster>"] = "Sneed <Bûcheron>";
	["Sneed's Shredder <Lumbermaster>"] = "Déchiqueteur de Sneed <Bûcheron>";
	["Gilnid <The Smelter>"] = "Gilnid <Le fondeur>";
	["Defias Gunpowder"] = "Poudre à canon de défias";
	["Captain Greenskin"] = "Capitaine Vertepeau";
	["Edwin VanCleef <Defias Kingpin>"] = "Edwin VanCleef <Caïd défias>";
	["Mr. Smite <The Ship's First Mate>"] = "M. Châtiment <Le premier officier du navire>";
	["Cookie <The Ship's Cook>"] = "Macaron <Le cuistot du navire>";

	--The Stockade
	["Targorr the Dread"] = "Targorr le Terrifiant";
	["Kam Deepfury"] = "Kam Furie-du-fond";
	["Hamhock"] = "Hamhock";
	["Bazil Thredd"] = "Bazil Thredd";
	["Dextren Ward"] = "Dextren Ward";
	["Bruegal Ironknuckle"] = "Bruegal Poing-de-fer";
	
	--The Sunken Temple
	["The Temple of Atal'Hakkar"] = "Le temple d'Atal'Hakkar";
	["Yeh'kinya's Scroll"] = "Parchemin de Yeh'kinya";
	["Atal'ai Defenders"] = "Défenseurs Atal'ai";
	["Gasher"] = "Balafreur";
	["Loro"] = "Loro";
	["Hukku"] = "Hukku";
	["Zolo"] = "Zolo";
	["Mijan"] = "Mijan";
	["Zul'Lor"] = "Zul'Lor";
	["Altar of Hakkar"] = "Autel d'Hakkar";
	["Atal'alarion <Guardian of the Idol>"] = "Atal'alarion <Gardien de l'idole>";
	["Dreamscythe"] = "Fauche-rêve";
	["Weaver"] = "Tisserand";
	["Avatar of Hakkar"] = "Avatar d'Hakkar";
	["Jammal'an the Prophet"] = "Jammal'an le prophète";
	["Ogom the Wretched"] = "Ogom le Misérable";
	["Morphaz"] = "Morphaz";
	["Hazzas"] = "Hazzas";
	["Shade of Eranikus"] = "Ombre d'Eranikus";
	["Essence Font"] = "Réceptacle d'essence";
	["Spawn of Hakkar"] = "Rejeton d'Hakkar";
	["Elder Starsong"] = "Ancienne Chantétoile";
	["Statue Activation Order"] = "Ordre d'activation des statues";
	
	--Uldaman
	["Staff of Prehistoria"] = "Bâton de la préhistoire";
	["Baelog"] = "Baelog";
	["Eric \"The Swift\""] = "Eric \"l'Agile\"";
	["Olaf"] = "Olaf";
	["Baelog's Chest"] = "Coffre de Baelog";
	["Conspicuous Urn"] = "Urne ostentatoire";
	["Remains of a Paladin"] = "Restes d'un paladin";
	["Revelosh"] = "Revelosh";
	["Ironaya"] = "Ironaya";
	["Obsidian Sentinel"] = "Sentinelle d'obsidienne";
	["Annora <Enchanting Trainer>"] = "Annora <Maître des enchanteurs>";
	["Ancient Stone Keeper"] = "Ancien gardien des pierres";
	["Galgann Firehammer"] = "Galgann Martel-de-feu";
	["Tablet of Will"] = "Tablette de Volonté";
	["Shadowforge Cache"] = "Cachette d'Ombreforge";
	["Grimlok <Stonevault Chieftain>"] = "Grimlok <Chef des Cavepierres>";
	["Archaedas <Ancient Stone Watcher>"] = "Archaedas <Ancien gardien des pierres>";
	["The Discs of Norgannon"] = "Les Disques de Norgannon";
	["Ancient Treasure"] = "Trésor Antique";

	--Zul'Gurub
	["Zandalar Tribe"] = "Tribu Zandalar";
	["Mudskunk Lure"] = "Appât au Puant de vase";
	["Gurubashi Mojo Madness"] = "Folie mojo des Gurubashi";
	["High Priestess Jeklik"] = "Grande prêtresse Jeklik";
	["High Priest Venoxis"] = "Grand prêtre Venoxis";
	["Zanza the Restless"] = "Zanza le Sans-Repos";
	["High Priestess Mar'li"] = "Grande prêtresse Mar'li";
	["Bloodlord Mandokir"] = "Seigneur sanglant Mandokir";
	["Ohgan"] = "Ohgan";
	["Edge of Madness"] = "Frontières de la folie";
	["Gri'lek"] = "Gri'lek";
	["Hazza'rah"] = "Hazza'rah";
	["Renataki"] = "Renataki";
	["Wushoolay"] = "Wushoolay";
	["Gahz'ranka"] = "Gahz'ranka";
	["High Priest Thekal"] = "Grand prêtre Thekal";
	["Zealot Zath"] = "Zélote Zath";
	["Zealot Lor'Khan"] = "Zélote Lor'Khan";
	["High Priestess Arlokk"] = "Grande prêtresse Arlokk";
	["Jin'do the Hexxer"] = "Jin'do le Maléficieur";
	["Hakkar"] = "Hakkar";
	["Muddy Churning Waters"] = "Eaux troubles et agitées";

	--Naxxramas
	["Archmage Tarsis Kir-Moldir"] = "Archimage Tarsis Kir-Moldir";
	["Mr. Bigglesworth"] = "Mr. Bigglesworth";
	["Abomination Wing"] = "Aile des Abominations";
	["Patchwerk"] = "Le Recousu";
	["Grobbulus"] = "Grobbulus";
	["Gluth"] = "Gluth";
	["Thaddius"] = "Thaddius";
	["Spider Wing"] = "Aile des Araignées";
	["Anub'Rekhan"] = "Anub'Rekhan";
	["Grand Widow Faerlina"] = "Grande veuve Faerlina";
	["Maexxna"] = "Maexxna";
	["Deathknight Wing"] = "Aile des Chevaliers de la mort";
	["Instructor Razuvious"] = "Instructeur Razuvious";
	["Gothik the Harvester"] = "Gothik le Moissonneur";
	["The Four Horsemen"] = "Les quatre cavaliers";
	["Thane Korth'azz"] = "Thane Korth'azz";
	["Lady Blaumeux"] = "Dame Blaumeux";
	["Highlord Mograine <The Ashbringer>"] = "Généralissime Mograine <Le Porte-cendres>";
	["Sir Zeliek"] = "Sir Zeliek";
	["Four Horsemen Chest"] = "Four Horsemen Chest";
	["Plague Wing"] = "Aile de la Peste";
	["Noth the Plaguebringer"] = "Noth le Porte-peste";
	["Heigan the Unclean"] = "Heigan l'Impur";
	["Loatheb"] = "Horreb";
	["Frostwyrm Lair"] = "Repaire de la Wyrm des glaces";
	["Sapphiron"] = "Sapphiron";
	["Kel'Thuzad"] = "Kel'Thuzad";
	
	--Karazhan Start
	["The Violet Eye"] = "L'Œil pourpre";--omitted from Karazhan End
	["The Master's Key"] = "La clé du maître";--omitted from Karazhan End
	["Blackened Urn"] = "Urne noircie";
	["Staircase to the Ballroom"] = "Escalier de la salle de bal";
	["Stairs to Upper Stable"] = "Escalier vers les Ecuries";
	["Ramp to the Guest Chambers"] = "Rampe vers les Appartements des hôtes";
	["Stairs to Opera House Orchestra Level"] = "Escalier vers la fosse de l'Opéra";
	["Ramp from Mezzanine to Balcony"] = "Rampe de la Mezzanine au Balcon";
	["Connection to Master's Terrace"] = "Connexion à la terrasse du Maître";
	["Path to the Broken Stairs"] = "Chemin vers l'Escalier brisé";
	["Hastings <The Caretaker>"] = "Hastings <Le gardien>";
	["Servant Quarters"] = "Quartier des serviteurs";
	["Hyakiss the Lurker"] = "Hyakiss la Rôdeuse";
["Rokad the Ravager"] = "Rodak le ravageur"; -- attente de confirmation par l'equipe de trad.
	["Shadikith the Glider"] = "Shadikith le glisseur";
	["Berthold <The Doorman>"] = "Berthold <Le concierge>";
	["Calliard <The Nightman>"] = "Calliard <Le veilleur de nuit>";
	["Attumen the Huntsman"] = "Attumen le Veneur";
	["Midnight"] = "Minuit";
	["Koren <The Blacksmith>"] = "Koren <Le forgeron>";
	["Moroes <Tower Steward>"] = "Moroes <Régisseur de la tour>";
	["Baroness Dorothea Millstipe"] = "Baronne Dorothea Millstipe";
	["Lady Catriona Von'Indi"] = "Dame Catriona Von'Indi";
	["Lady Keira Berrybuck"] = "Dame Keira Berrybuck";
	["Baron Rafe Dreuger"] = "Baron Rafe Dreuger";
	["Lord Robin Daris"] = "Seigneur Robin Daris";
	["Lord Crispin Ference"] = "Seigneur Crispin Ference";
	["Bennett <The Sergeant at Arms>"] = "Bennett <L'huissier>";
	["Ebonlocke <The Noble>"] = "Bouclenoire <Les nobles>";
	["Keanna's Log"] = "Journal de Keanna";
	["Maiden of Virtue"] = "Damoiselle de vertu";
	["Sebastian <The Organist>"] = "Sebastian <L'Organiste>";
	["Barnes <The Stage Manager>"] = "Barnes <Le Régisseur>";
	["The Opera Event"] = "L'Opéra";
	["Red Riding Hood"] = "Petit Chaperon Rouge";
	["The Big Bad Wolf"] = "Le Grand Méchant Loup";
	["Wizard of Oz"] = "Magicien d'Oz";
	["Dorothee"] = "Dorothée";
	["Tito"] = "Tito";
	["Strawman"] = "Homme de paille";
	["Tinhead"] = "Tête de fer-blanc";
	["Roar"] = "Graou";
	["The Crone"] = "La Mégère";
	["Romulo and Julianne"] = "Romulo et Julianne";
	["Romulo"] = "Romulo";
	["Julianne"] = "Julianne";
	["The Master's Terrace"] = "La terrasse du Maître";
	["Nightbane"] = "Plaie-de-nuit";

	--Karazhan End
	["Broken Stairs"] = "L'Escalier brisé";
	["Ramp to Guardian's Library"] = "Rampe vers la Bibliothèque du Gardien";
	["Suspicious Bookshelf"] = "Bibliotheque suspecte";
	["Ramp up to the Celestial Watch"] = "Rampe montant vers Le Guet céleste";
	["Ramp down to the Gamesman's Hall"] = "Rampe déscendant vers le Hall du Flambeur";
	["Chess Event"] = "L'Echéquier";
	["Ramp to Medivh's Chamber"] = "Rampe vers la chambre de Medivh";
	["Spiral Stairs to Netherspace"] = "Escalier en spiral vers le Néantespace";
	["The Curator"] = "Le conservateur";
	["Wravien <The Mage>"] = "Wravien <Le Mage>";
	["Gradav <The Warlock>"] = "Gradav <Le Démoniste>";
	["Kamsis <The Conjurer>"] = "Kamsis <L'Invocateur>";
	["Terestian Illhoof"] = "Terestian Malsabot";
	["Kil'rek"] = "Kil'rek";
	["Shade of Aran"] = "Ombre d'Aran";
	["Netherspite"] = "Dédain-du-Néant";
	["Ythyar"] = "Ythyar";
	["Echo of Medivh"] = "Echo de Medivh";
	["Dust Covered Chest"] = "Coffre couvert de poussière";
	["Prince Malchezaar"] = "Prince Malchezaar";

	--Zul'Aman
	["Harrison Jones"] = "Harrison Jones";
	["Nalorakk <Bear Avatar>"] = "Nalorakk <Avatar d'Ours>";
	["Tanzar"] = "Tanzar";
	["The Map of Zul'Aman"] = "Carte de Zul'Aman de Budd";
	["Akil'Zon <Eagle Avatar>"] = "Akil'Zon <Avatar d'Aigle>";
	["Harkor"] = "Harkor";
	["Jan'Alai <Dragonhawk Avatar>"] = "Jan'Alai <Avatar de Faucon-dragon>";
	["Kraz"] = "Kraz";
	["Halazzi <Lynx Avatar>"] = "Halazzi <Avatar de Lynx>";
	["Ashli"] = "Ashli";
	["Zungam"] = "Zungam";
	["Hex Lord Malacrass"] = "Seigneur des maléfices Malacrass";
	["Thurg"] = "Thurg";
	["Gazakroth"] = "Gazakroth";
	["Lord Raadan"] = "Seigneur Raadan";
	["Darkheart"] = "Sombrecoeur";
	["Alyson Antille"] = "Alyson Antille";
	["Slither"] = "Sinueux";
	["Fenstalker"] = "Traquetourbe";
	["Koragg"] = "Koragg";
	["Zul'jin"] = "Zul'jin";
	["Forest Frogs"] = "Grenouilles forestière";
	["Kyren <Reagents>"] = "Kyren <Composants>";
	["Gunter <Food Vendor>"] = "Gunter <Vendeur de nourriture>";
	["Adarrah"] = "Adarrah";
	["Brennan"] = "Brennan";
	["Darwen"] = "Darwen";
	["Deez"] = "Deez";
	["Galathryn"] = "Galathryn";
	["Mitzi"] = "Mitzi";
	["Mannuth"] = "Mannuth";
	
	--Magisters Terrace
	["Shattered Sun Offensive"] = "Opération Soleil brisé";
	["Selin Fireheart"] = "Selin Coeur-de-feu";
	["Fel Crystals"] = "Gangrecristaux";
	["Tyrith"] = "Tyrith";
	["Vexallus"] = "Vexallus";
	["Scrying Orb"] = "Orbe de divination";
	["Kalecgos"] = "Kalecgos";
	["Priestess Delrissa"] = "Prêtresse Delrissa";
	["Kael'thas Sunstrider <Lord of the Blood Elves>"] = "Kael'thas Haut-soleil <Seigneur des elfes de sang>";

	--Sunwell Plateau
	["Kalecgos"] = "Kalecgos";
	["Sathrovarr the Corruptor"] = "Sathrovarr le Corrupteur";
	["Madrigosa"] = "Madrigosa";
	["Brutallus"] = "Brutallus";
	["Felmyst"] = "Gangrebrume";
	["Eredar Twins"] = "Les jumelles Eredar";
	["Grand Warlock Alythess"] = "Grande démoniste Alythess";
	["Lady Sacrolash"] = "Dame Sacrolash";
	["M'uru"] = "M'uru";
	["Entropius"] = "Entropius";
	["Kil'jaeden <The Deceiver>"] = "Kil'jaeden <Le Trompeur>";

--*******************
-- Outland Instances
--*******************
	
	--HFC: The Blood Furnace
	["Thrallmar"] = "Thrallmar";--omitted from other HFC
	["Honor Hold"] = "Bastion de l'honneur";--omitted from other HFC
	["Flamewrought Key"] = "Clé en flammes forgées";--omitted from other HFC
	["The Maker"] = "Le Faiseur";
	["Broggok"] = "Broggok";
	["Keli'dan the Breaker"] = "Keli'dan le Briseur";
	
	--HFC: The Shattered Halls
	["Shattered Halls Key"] = "Clé des Salles brisées";
	["Randy Whizzlesprocket"] = "Randy Vizirouage";
	["Drisella"] = "Drisella";
	["Grand Warlock Nethekurse"] = "Grand démoniste Néanathème";
	["Blood Guard Porung"] = "Garde de sang Porung";
	["Warbringer O'mrogg"] = "Porteguerre O'mrogg";
	["Warchief Kargath Bladefist"] = "Chef de guerre Kargath Lamepoing";
	["Shattered Hand Executioner"] = "Bourreau de la Main brisée";
	["Private Jacint"] = "Soldat Jacint";
	["Rifleman Brownbeard"] = "Fusilier Brownbeard";
["Captain Alina"] = "Captaine Alina"; -- attente de confirmation par l'equipe de trad.
	["Scout Orgarr"] = "Eclaireur Orgarr";
["Korag Proudmane"] = "Korag Proudmane"; -- attente de confirmation par l'equipe de trad.
	["Captain Boneshatter"] = "Capitaine Fracasse-os";

	--HFC: Hellfire Ramparts
	["Watchkeeper Gargolmar"] = "Gardien des guetteurs Gargolmar";
	["Omor the Unscarred"] = "Omor l'Intouché";
	["Vazruden"] = "Vazruden";
	["Nazan <Vazruden's Mount>"] = "Nazan <Monture de Vazruden>";
	["Reinforced Fel Iron Chest"] = "Coffre en gangrefer renforcé";

	--HFC: Magtheridon's Lair
	["Magtheridon"] = "Magtheridon";

	--CR: The Slave Pens
	["Cenarion Expedition"] = "Expédition cénarienne";--omitted from other CR
	["Reservoir Key"] = "Clé du réservoir";--omitted from other CR
	["Mennu the Betrayer"] = "Mennu le Traître";
	["Weeder Greenthumb"] = "Weeder la Main-verte";
	["Skar'this the Heretic"] = "Skar'this l'Hérétique";
	["Rokmar the Crackler"] = "Rokmar le Crépitant";
	["Naturalist Bite"] = "Naturaliste Morsure";
	["Quagmirran"] = "Bourbierreux";
	["Ahune <The Frost Lord>"] = "Ahune <Le seigneur du Givre>";
	
	--CR: The Underbog
	["Hungarfen"] = "Hungarfen";
	["The Underspore"] = "Palme de sporielle";
	["Ghaz'an"] = "Ghaz'an";
	["Earthbinder Rayge"] = "Lieur de terre Rayge";
	["Swamplord Musel'ek"] = "Seigneur des marais Musel'ek";
	["Claw <Swamplord Musel'ek's Pet>"] = "Griffe <Familier du seigneur des marais Musel'ek>";
	["The Black Stalker"] = "La Traqueuse noire";
	
	--CR: The Steamvault
	["Hydromancer Thespia"] = "Hydromancienne Thespia";
	["Main Chambers Access Panel"] = "Panneau d'accès de la salle principale";
	["Second Fragment Guardian"] = "Gardien du second fragment";
	["Mekgineer Steamrigger"] = "Mékgénieur Montevapeur";
	["Warlord Kalithresh"] = "Seigneur de guerre Kalithresh";
	
	--CR: Serpentshrine Cavern
	["Hydross the Unstable <Duke of Currents>"] = "Hydross l'Instable <Duc des courants>";
	["The Lurker Below"] = "Le Rôdeur d'En-bas";
	["Leotheras the Blind"] = "Leotheras l'Aveugle";
	["Fathom-Lord Karathress"] = "Seigneur des fonds Karathress";
	["Seer Olum"] = "Voyant Olum";
	["Morogrim Tidewalker"] = "Morogrim Marcheur-des-flots";
	["Lady Vashj <Coilfang Matron>"] = "Dame Vashj <Matrone de Glissecroc>";
	
	--Auch: Mana-Tombs
	["The Consortium"] = "Le Consortium";
	["Auchenai Key"] = "Clé Auchenaï";--omitted from other Auch
	["The Eye of Haramad"] = "L'Oeil d'Haramad";
	["Pandemonius"] = "Pandemonius";
	["Shadow Lord Xiraxis"] = "Seigneur des ténèbres Xiraxis";
	["Ambassador Pax'ivi"] = "Ambassadeur Pax'ivi";
	["Tavarok"] = "Tavarok";
	["Cryo-Engineer Sha'heen"] = "Cryo-Ingénieur Sha'heen";
	["Ethereal Transporter Control Panel"] = "Panneau de contrôle du transporteur étherien";
	["Nexus-Prince Shaffar"] = "Prince-nexus Shaffar";
	["Yor <Void Hound of Shaffar>"] = "Yor <Molosse du Vide de Shaffar>";
	
	--Auch: Auchenai Crypts
	["Lower City"] = "Ville basse";--omitted from other Auch
	["Shirrak the Dead Watcher"] = "Shirrak le Veillemort";
	["Exarch Maladaar"] = "Exarque Maladaar";
	["Avatar of the Martyred"] = "Avatar des martyrs";
	["D'ore"] = "D'ore";
	
	--Auch: Sethekk Halls
	["Essence-Infused Moonstone"] = "Pierre de lune imprégnée d'essence";
	["Darkweaver Syth"] = "Tisseur d'ombre Syth";
	["Lakka"] = "Lakka";
	["The Saga of Terokk"] = "La Saga de Terokk";
	["Anzu"] = "Anzu";
	["Talon King Ikiss"] = "Roi-serre Ikiss";
	
	--Auch: Shadow Labyrinth
	["Shadow Labyrinth Key"] = "Clé du labyrinthe des ombres";
	["Spy To'gun"] = "Espion To'gun";
	["Ambassador Hellmaw"] = "Ambassadeur Gueule-d'enfer";
	["Blackheart the Inciter"] = "Cœur-noir le Séditieux";
	["Grandmaster Vorpil"] = "Grand Maître Vorpil";
	["The Codex of Blood"] = "Codex de sang";
	["Murmur"] = "Marmon";
	["First Fragment Guardian"] = "Gardien du premier fragment";
	
	--TK: The Botanica
	["The Sha'tar"] = "Les Sha'tar";--omitted from other TK
	["Warpforged Key"] = "Clé dimensionnelle";--omitted from other TK
	["Commander Sarannis"] = "Commandant Sarannis";
	["High Botanist Freywinn"] = "Grand botaniste Freywinn";
	["Thorngrin the Tender"] = "Rirépine le Tendre";
	["Laj"] = "Laj";
	["Warp Splinter"] = "Brise-dimension";
	
	--TK: The Arcatraz
	["Key to the Arcatraz"] = "Clé de l'Arcatraz";
	["Zereketh the Unbound"] = "Zereketh le Délié";
	["Third Fragment Guardian"] = "Gardien du troisième fragment";
	["Dalliah the Doomsayer"] = "Dalliah l'Auspice-funeste";
	["Wrath-Scryer Soccothrates"] = "Scrute-courroux Soccothrates";
	["Udalo"] = "Udalo";
	["Harbinger Skyriss"] = "Messager Cieuriss";
	["Warden Mellichar"] = "Gardien Mellichar";
	["Millhouse Manastorm"] = "Milhouse Tempête-de-mana";
	
	--TK: The Mechanar
	["Gatewatcher Gyro-Kill"] = "Gardien de porte Gyro-Meurtre";
	["Gatewatcher Iron-Hand"] = "Gardien de porte Main-en-fer";
	["Cache of the Legion"] = "Cache de la Légion";
	["Mechano-Lord Capacitus"] = "Mécano-seigneur Capacitus";
	["Overcharged Manacell"] = "Cellule de mana surchargée";
	["Nethermancer Sepethrea"] = "Néantomancien Sepethrea";
	["Pathaleon the Calculator"] = "Pathaleon le Calculateur";
	
	--TK: The Eye
	["The Tempest Key"] = "La clé de la Tempête";
	["Al'ar <Phoenix God>"] = "Al'ar <Dieu phénix>";
	["Void Reaver"] = "Saccageur du Vide";
	["High Astromancer Solarian"] = "Grande Astromancienne Solarian";
	["Thaladred the Darkener <Advisor to Kael'thas>"] = "Thaladred l'Assombrisseur <Conseiller de Kael'thas>";
	["Master Engineer Telonicus <Advisor to Kael'thas>"] = "Maître ingénieur Telonicus <Conseiller de Kael'thas>";
	["Grand Astromancer Capernian <Advisor to Kael'thas>"] = "Grande astromancienne Capernian <Conseillère de Kael'thas>";
	["Lord Sanguinar <The Blood Hammer>"] = "Seigneur Sanguinar <Le Marteau de sang>";
	
	--Gruul's Lair
	["High King Maulgar <Lord of the Ogres>"] = "Haut Roi Maulgar <Seigneur des ogres>";
	["Kiggler the Crazed"] = "Kiggler le Cinglé";
	["Blindeye the Seer"] = "Oeillaveugle le Voyant";
	["Olm the Summoner"] = "Olm l'Invocateur";
	["Krosh Firehand"] = "Krosh Brasemain";
	["Gruul the Dragonkiller"] = "Gruul le Tue-dragon";
	
	--Black Temple (Start)
	["Ashtongue Deathsworn"] = "Ligemort Cendrelangue";--omitted from other BT
	["Medallion of Karabor"] = "Médaillon de Karabor";--omitted from other BT
	["Towards Reliquary of Souls"] = "Vers Reliquaire des âmes";
	["Towards Teron Gorefiend"] = "Vers Teron Fielsang";
	["Towards Illidan Stormrage"] = "Vers Illidan Hurlorage";
	["Spirit of Olum"] = "Esprit d'Olum";
	["High Warlord Naj'entus"] = "Grand seigneur de guerre Naj'entus";
	["Supremus"] = "Supremus";
	["Shade of Akama"] = "Ombre d'Akama";
	["Spirit of Udalo"] = "Esprit d'Udalo";
	["Aluyen <Reagents>"] = "Aluyen <Composants>";
	["Okuno <Ashtongue Deathsworn Quartermaster>"] = "Okuno <Intendant des ligemorts cendrelangue>";
	["Seer Kanai"] = "Voyant Kanai";
	
	--Black Temple (Basement)
	["Gurtogg Bloodboil"] = "Gurtogg Fièvresang";
	["Reliquary of Souls"] = "Reliquaire des âmes";
	["Essence of Suffering"] = "Essence de la souffrance";
	["Essence of Desire"] = "Essence du désir";
	["Essence of Anger"] = "Essence de la colère";
	["Teron Gorefiend"] = "Teron Fielsang";
	
	--Black Temple (Top)
	["Mother Shahraz"] = "Mère Shahraz";
	["The Illidari Council"] = "Le conseil Illidari";
	["Lady Malande"] = "Dame Malande";
	["Gathios the Shatterer"] = "Gathios le Briseur";
	["High Nethermancer Zerevor"] = "Grand néantomancien Zerevor";
	["Veras Darkshadow"] = "Veras Ombrenoir";
	["Illidan Stormrage <The Betrayer>"] = "Illidan Hurlorage <Le Traître>";

--************************************************
-- Instance Entrance Maps
--************************************************

	--Auchindoun (Entrance)
	["Ha'Lei"] = "Ha'Lei";
	["Greatfather Aldrimus"] = "Grandpère Aldrimus";
	["Clarissa"] = "Clarissa";
	["Ramdor the Mad"] = "Ramdor le Fol";
	["Horvon the Armorer <Armorsmith>"] = "Horvon l'Armurier <Fabricant d'armures>";
	["Nexus-Prince Haramad"] = "Prince-nexus Haramad";
	["Artificer Morphalius"] = "Artificier Morphalius";
	["Mamdy the \"Ologist\""] = "Mamdy \"l'Ologiste\"";
	["\"Slim\" <Shady Dealer>"] = "\"Mince\" <Marchand douteux>";
	["\"Captain\" Kaftiz"] = "\"Captain\" Kaftiz";
	["Isfar"] = "Isfar";
	["Field Commander Mahfuun"] = "Commandant Mahfuun";
	["Spy Grik'tha"] = "Espionne Grik'tha";
	["Provisioner Tsaalt"] = "Approvisionneur Tsaalt";
	["Dealer Tariq <Shady Dealer>"] = "Camelot Tariq <Marchand douteux>";
	
	--Blackfathom Deeps (Entrance)
	--Nothing to translate!
	
	--Blackrock Mountain (Entrance)
	["Bodley"] = "Bodley";
	["Overmaster Pyron"] = "Grand seigneur Pyron";
	["Lothos Riftwaker"] = "Lothos Ouvrefaille";
	["Franclorn Forgewright"] = "Franclorn Le Forgebusier";
	["Orb of Command"] = "Orbe de Commandement";
	["Scarshield Quartermaster <Scarshield Legion>"] = "Intendant du Bouclier balafré <Légion du Bouclier balafré>";
	
	--Coilfang Reservoir (Entrance)
	["Watcher Jhang"] = "Guetteur Jhang";
	["Mortog Steamhead"] = "Mortog Têtavapeur";
	
	--Gnomeregan (Entrance)
	["Transpolyporter"] = "Portail de multitéléportation";
	["Sprok <Away Team>"] = "Sproque <Equipe envoyée>";
	["Matrix Punchograph 3005-A"] = "Matrice d'Encodage 3005-A";
	["Namdo Bizzfizzle <Engineering Supplies>"] = "Namdo Ventaperte <Fournitures d'ingénieur>";
	["Techbot"] = "Techbot";
	
	--Maraudon (Entrance)
	["The Nameless Prophet"] = "Le Prophète sans nom";
	["Kolk <The First Kahn>"] = "Kolk <Le premier Khan>";
	["Gelk <The Second Kahn>"] = "Gelk <Le deuxième Kahn>";
	["Magra <The Third Kahn>"] = "Magra <Le troisième Kahn>";
	["Cavindra"] = "Cavindra";
	
	--The Deadmines (Entrance)
	["Marisa du'Paige"] = "Marisa du'Paige";
	["Brainwashed Noble"] = "Noble manipulé";
	["Foreman Thistlenettle"] = "Contremaître Crispechardon";

	--Sunken Temple (Entrance)
	["Jade"] = "Jade";
	["Kazkaz the Unholy"] = "Kazkaz l'Impie";
	["Zekkis"] = "Zekkis";
	["Veyzhak the Cannibal"] = "Veyzhak le Cannibale";
	
	--Uldaman (Entrance)
	["Hammertoe Grez"] = "Martèlorteil Grez";
	["Magregan Deepshadow"] = "Magregan Fondombre";
	["Tablet of Ryun'Eh"] = "Tablette de Ryun'eh";
	["Krom Stoutarm's Chest"] = "Trésor de Krom Rudebras";
	["Garrett Family Chest"] = "Trésor de la famille Garrett";
	["Digmaster Shovelphlange"] = "Maître des fouilles Pellaphlange";
	
	--Wailing Caverns (Entrance)
	["Mad Magglish"] = "Magglish le Dingue";
	["Trigore the Lasher"] = "Trigore le Flagelleur";
	["Boahn <Druid of the Fang>"] = "Boahn <Druide du Croc>";
	["Above the Entrance:"] = "Au-dessus de l'entrée :";
	["Ebru <Disciple of Naralex>"] = "Ebru <Disciple de Naralex>";
	["Nalpak <Disciple of Naralex>"] = "Nalpak <Disciple de Naralex>";
	["Kalldan Felmoon <Specialist Leatherworking Supplies>"] = "Kalldan Gangrelune <Fournitures de travailleur du cuir spécialiste>";
	["Waldor <Leatherworking Trainer>"] = "Waldor <Maître des travailleurs du cuir>";
	
	--Dire Maul (Entrance)
	["Dire Pool"] = "Bassin redoutable";
	["Dire Maul Arena"] = "L'Etripoir";
	["Mushgog"] = "Mushgog";
	["Skarr the Unbreakable"] = "Bâlhafr l'Invaincu";
	["The Razza"] = "La Razza";
	["Elder Mistwalker"] = "Ancienne Marche-brume";
	
	--Caverns of Time (Entrance)
	["Steward of Time <Keepers of Time>"] = "Régisseur du temps <Les Gardiens du temps>";
	["Alexston Chrome <Tavern of Time>"] = "Alexston Chrome <Gargotte du temps>";
	["Yarley <Armorer>"] = "Yarley <Armurier>";
	["Bortega <Reagents & Poison Supplies>"] = "Bortega <Composants & poisons>";
	["Galgrom <Provisioner>"] = "Galgrom <Approvisionneur>";
	["Alurmi <Keepers of Time Quartermaster>"] = "Alurmi <Intendant des gardiens du Temps>";
	["Zaladormu"] = "Zaladormu";
	["Soridormi <The Scale of Sands>"] = "Soridormi <La Balance des sables>";
	["Arazmodu <The Scale of Sands>"] = "Arazmodu <La Balance des sables>";
	["Andormu <Keepers of Time>"] = "Andormu <Les Gardiens du temps>";
	["Nozari <Keepers of Time>"] = "Nozari <Les Gardiens du temps>";
	
	--Karazhan (Entrance)
	["Archmage Leryda"] = "Archimage Leryda";
	["Apprentice Darius"] = "Apprenti Darius";
	["Archmage Alturus"] = "Archimage Alturus";
	["Stairs to Underground Pond"] = "Escalier vers le bassin souterrain";
	["Stairs to Underground Well"] = "Escalier vers le puits souterrain";
	["Charred Bone Fragment"] = "Fragment d'os carbonisé";
	
	--Scarlet Monastery (Entrance)
	--Nothing to translate!
	
};
end
