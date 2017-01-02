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

if ( GetLocale() == "frFR" ) then
AtlasFPLocale = {

	["Aerie Peak"] = "Nid-de-l'Aigle";
	["Allerian Stronghold"] = "Bastion Allérien";
	["Alliance"] = "Alliance";
	["Altar of Sha'tar"] = "Autel de Sha'tar";
	["Arathi Highlands"] = "Hautes-Terres d'Arathi";
	["Area 52"] = "Zone 52";
	["Ashenvale"] = "Orneval";
	["Astranaar"] = "Astranaar";
	["Auberdine"] = "Auberdine";
	["Azshara"] = "Azshara";
	["Azuremyst Isle"] = "Ile de Brume-Azur";
	["Badlands"] = "Terres Ingrates";
	["Blackwind Landing"] = "Le raie'odrome de Noirvent";
	["Blade's Edge Mountains"] = "Les Tranchantes";
	["Blasted Lands"] = "Terres Foudroyées";
	["Blood Watch"] = "Guet du sang";
	["Bloodmyst Isle"] = "Ile de Brume-Sang";
	["Bloodvenom Post"] = "Poste de la Vénéneuse";
	["Booty Bay"] = "Baie-du-Butin";
	["Brackenwall Village"] = "Mur-de-Fougères";
	["Burning Steppes"] = "Steppes Ardentes";
	["Camp Mojache"] = "Camp Mojache";
	["Camp Taurajo"] = "Camp Taurajo";
	["Cenarion Hold"] = "Fort Cénarien";
	["Chillwind Point"] = "Camp Noroît";
	["Cosmowrench"] = "Cosmovrille";
	["Crossroads"] = "La Croisée";
	["Darkshire"] = "Sombre-comté";
	["Darkshore"] = "Sombrivage";
	["Desolace"] = "Désolace";
	["Druid-only"] = "Druide seulement";
	["Dun Morogh"] = "Dun Morogh";
	["Durotar"] = "Durotar";
	["Duskwood"] = "Bois de la pénombre";
	["Dustwallow Marsh"] = "Marécage d'Âprefange";
	["Eastern Kingdoms"] = "Royaumes de l'Est";
	["Eastern Plaguelands"] = "Maleterres de l'est";
	["Elwynn Forest"] = "Forêt d'Elwynn";
	["Emerald Sanctuary"] = "Sanctuaire d'émeraude";
	["Evergrove"] = "Bosquet éternel";
	["Everlook"] = "Long-Guet";
	["Eversong Woods"] = "Bois des Chants-éternels";
	["Falcon Watch"] = "Guet de l'épervier";
	["Feathermoon Stronghold"] = "Bastion de Pennelune";
	["Felwood"] = "Gangrebois";
	["Feralas"] = "Féralas";
	["Flame Crest"] = "Corniche des flammes";
	["Flight Path Maps"] = "Cartes des trajets aériens";
	["Forest Song"] = "Chant des forêts";
	["Freewind Post"] = "Poste de Librevent";
	["Gadgetzan"] = "Gadgetzan";
	["Garadar"] = "Garadar";
	["Ghostlands"] = "Terres Fantômes";
	["Grom'Gol Base Camp"] = "Campement Grom'Gol";
	["Hammerfall"] = "Trépas-d'Orgrim";
	["Hatchet Hills"] = "Zul'Aman"; -- A Confirmer
	["Hellfire Peninsula"] = "Péninsule des Flammes Infernales";
	["Hillsbrad Foothills"] = "Contreforts de Hautebrande";
	["Honor Hold"] = "Bastion de l'Honneur";
	["Horde"] = "Horde";
	["Ironforge"] = "Forgefer";
	["Isle of Quel'Danas"] = "Île de Quel'Danas";
	["Kalimdor"] = "Kalimdor";
	["Kargath"] = "Kargath";
	["Lakeshire"] = "Comté-du-Lac";
	["Light's Hope Chapel"] = "Chapelle de l'Espoir de Lumière";
	["Loch Modan"] = "Loch Modan";
	["Marshal's Refuge"] = "Refuge de Marshal";
	["Menethil Harbor"] = "Port de Menethil";
	["Mok'Nathal Village"] = "Mok'Nathal";
	["Moonglade"] = "Reflet-de-Lune";
	["Morgan's Vigil"] = "Veille de Morgan";
	["Mudsprocket"] = "Bourbe-à-Brac";
	["Mulgore"] = "Mulgore";
	["Nagrand"] = "Nagrand";
	["Nethergarde Keep"] = "Rempart-du-Néant";
	["Netherstorm"] = "Raz-de-Néant";
	["Nighthaven"] = "Havrenuit";
	["Nijel's Point"] = "Combe de Nijel";
	["Orebor Harborage"] = "Havre d'Orebor";
	["Orgrimmar"] = "Orgrimmar";
	["Outland"] = "Outreterre";
	["Ratchet"] = "Cabestan";
	["Rebel Camp"] = "Camp rebel";
	["Redridge Mountains"] = "Les Carmines";
	["Refuge Pointe"] = "Refuge de l'Ornière";
	["Requires honored faction with Sha'tari Skyguard"] = "Honoré avec la Garde-ciel sha'tari";
	["Revantusk Village"] = "Village des Vengebroches";
	["Rut'Theran Village"] = "Village de Rut'Theran";
	["Sanctum of the Stars"] = "Sanctum des étoiles";
	["Searing Gorge"] = "Gorge des Vents Brûlants";
	["Sentinel Hill"] = "Collines des Sentinelles";
	["Shadowmoon Valley"] = "Vallée d'Ombrelune";
	["Shadowmoon Village"] = "Village d'Ombrelune";
	["Shadowprey Village"] = "Proie-de-l'Ombre";
	["Shatter Point"] = "Halte du Fracas";
	["Shattrath City"] = "Shattrath";
	["Silithus"] = "Silithus";
	["Silvermoon"] = "Lune d'argent";
	["Silverpine Forest"] = "Forêt des Pins Argentés";
	["Skyguard Outpost"] = "Avant-Poste de Garde-Ciel";
	["South of the path along Lake Elune'ara"] = "Sud du chemin du lac d'Elune'ara";
	["Southshore"] = "Austrivage";
	["Spinebreaker Post"] = "Poste de Brise-échine";
	["Splintertree Post"] = "Poste de Bois-brisé";
	["Stonard"] = "Pierrêche";
	["Stonebreaker Hold"] = "Fort des Brise-pierres";
	["Stonetalon Mountains"] = "Les Serres-Rocheuses";
	["Stonetalon Peak"] = "Pic des Serres-Rocheuses";
	["Stormwind City"] = "Hurlevent";
	["Stranglethorn Vale"] = "Vallée de Strangleronce";
	["Sun's Reach"] = "Confins du soleil";
	["Sun Rock Retreat"] = "La Retraite de Roche-Soleil";
	["Swamp of Sorrows"] = "Marais des Chagrins";
	["Swamprat Post"] = "Poste du Rat des marais";
	["Sylvanaar"] = "Sylvanaar";
	["Talonbranch Glade"] = "Clairière de Griffebranche";
	["Talrendis Point"] = "Halte de Talrendis";
	["Tanaris"] = "Tanaris";
	["Tarren Mill"] = "Moulin-de-Tarren";
	["Telaar"] = "Telaar";
	["Teldrassil"] = "Teldrassil";
	["Telredor"] = "Telredor";
	["Temple of Telhamat"] = "Temple de Telhamat";
	["Terokkar Forest"] = "Forêt de Terokkar";
	["Thalanaar"] = "Thalanaar";
	["The Aldor"] = "Les Aldor";
	["The Barrens"] = "Les Tarides";
	["The Dark Portal"] = "Escalier du Destin"; -- A Confirmer
	["The Exodar"] = "L'Exodar";
	["The Hinterlands"] = "Les Hinterlands";
	["The Scryers"] = "Les Clairvoyants";
	["The Sepulcher"] = "Le Sépulcre";
	["The Stormspire"] = "La Foudreflêche";
	["Thelsamar"] = "Thelsamar";
	["Theramore Isle"] = "Ile de Theramore";
	["Thorium Point"] = "Halte du Thorium";
	["Thousand Needles"] = "Mille Pointes";
	["Thrallmar"] = "Thrallmar";
	["Thunder Bluff"] = "Pitons-du-Tonnerre";
	["Thunderlord Stronghold"] = "Bastion des Sire-tonnerre";
	["Tirisfal Glades"] = "Clairières de Tirisfal";
	["Toshley's Station"] = "Poste de Toshley";
	["Tranquillien"] = "Tranquillien";
	["Un'Goro Crater"] = "Cratère d'Un'Goro";
	["Undercity"] = "Fossoyeuse";
	["Valormok"] = "Valormok";
	["West of the path to Timbermaw Hold"] = "Ouest du chemin du Repaire des Grumegueules";
	["Western Plaguelands"] = "Maleterres de l'ouest";
	["Westfall"] = "Marche de l'Ouest";
	["Wetlands"] = "Les Paluns";
	["Wildhammer Stronghold"] = "Bastion des Marteaux-hardis";
	["Winterspring"] = "Berceau-de-l'Hiver";
	["Zabra'jin"] = "Zabra'jin";
	["Zangarmarsh"] = "Marécage de Zangar";
	["Zoram'gar Outpost"] = "Avant-poste de Zoram'gar";

};
end