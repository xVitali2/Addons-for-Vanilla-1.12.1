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

AtlasBGLocale = {

	--Common
	["Alliance"] = "Alliance";
	["Battleground Maps"] = "Cartes des champs de bataille";
	["Entrance"] = "Entrée";
	["Horde"] = "Horde";
	["Neutral"] = "Neutre";
	["North"] = "Nord";
	["Orange"] = "Orange "; -- Espace pour le blanc avant une double ponctuation française
	["Red"] = "Rouge "; -- Espace pour le blanc avant une double ponctuation française
	["Rep"] = "Reput ";
	["Rescued"] = "Sauvé";
	["South"] = "Sud";
	["Summon"] = "Invoqué";
	["White"] = "Blanc "; -- Espace pour le blanc avant une double ponctuation française
	
	--Places
	["Alterac Mountains"] = "Montagnes d'Alterac";
	["Alterac Valley"] = "Vallée d'Alterac"; ["AV"] = "AV/Alterac";
	["Arathi Basin"] = "Bassin d'Arathi"; ["AB"] = "AB/Arathi";
	["Arathi Highlands"] = "Hautes-Terres d'Arathi";
	["Ashenvale"] = "Orneval";
	["Eastern Kingdoms"] = "Royaumes de l'Est";
	["Eye of the Storm"] = "L'Œil du Cyclone"; ["EotS"] = "EotS/L'Œil";
	["Hillsbrad Foothills"] = "Contreforts de Hautebrande";
	["Kalimdor"] = "Kalimdor";
	["Netherstorm"] = "Raz-de-Néant";
	["Outland"] = "Outreterre";
	["The Barrens"] = "Les Tarides";
	["Warsong Gulch"] = "Goulet des Chanteguerres"; ["WSG"] = "WSG/Goulet";
	
	--Alterac Valley (North)
	["Stormpike Guard"] = "Garde Foudrepique";
	["Dun Baldar"] = "Dun Baldar";
	["Vanndar Stormpike <Stormpike General>"] = "Vanndar Foudrepique <Général Foudrepique>";
	["Dun Baldar North Marshal"] = "Maréchal de Dun Baldar nord";
	["Dun Baldar South Marshal"] = "Maréchal de Dun Baldar sud";
	["Icewing Marshal"] = "Maréchal de l'Aile de glace";
	["Stonehearth Marshal"] = "Maréchal de Gîtepierre";
	["Prospector Stonehewer"] = "Prospectrice Taillepierre";
	["Irondeep Mine"] = "Mine de Gouffrefer";
	["Morloch"] = "Morloch";
	["Umi Thorson"] = "Umi Thorson";
	["Keetar"] = "Keetar";
	["Arch Druid Renferal"] = "Archidruide Ranfarouche";
	["Dun Baldar North Bunker"] = "Fortin nord de Dun Baldar";
	["Wing Commander Mulverick"] = "Chef d'escadrille Mulverick";
	["Murgot Deepforge"] = "Murgot Forge-profonde";
	["Dirk Swindle <Bounty Hunter>"] = "Dirk Lembrouille <Chasseur de primes>";
	["Athramanis <Bounty Hunter>"] = "Athramanis <Chasseur de primes>";
	["Lana Thunderbrew <Blacksmithing Supplies>"] = "Lana Tonnebière <Fournitures de forgeron>";
	["Stormpike Aid Station"] = "Poste de Secours Foudrepique";
	["Stormpike Stable Master <Stable Master>"] = "Maître des écuries Foudrepique <Maître des écuries>";
	["Stormpike Ram Rider Commander"] = "Commandant Chevaucheur de bélier Foudrepique";
	["Svalbrad Farmountain <Trade Goods>"] = "Svalbrad Mont-lointain <Fournitures d'artisanat>";
	["Kurdrum Barleybeard <Reagents & Poison Supplies>"] = "Kurdrum Barbe-d'orge <Composants & fournitures pour poisons>";
	["Stormpike Quartermaster"] = "Intendant Foudrepique";
	["Jonivera Farmountain <General Goods>"] = "Jonivera Mont-lointain <Fournitures générales>";
	["Brogus Thunderbrew <Food & Drink>"] = "Brogus Tonnebière <Nourriture & boissons>";
	["Wing Commander Ichman"] = "Chef d'escadrille Ichman";
	["Wing Commander Slidore"] = "Chef d'escadrille Slidore";
	["Wing Commander Vipore"] = "Chef d'escadrille Vipore";
	["Dun Baldar South Bunker"] = "Fortin sud de Dun Baldar";
	["Corporal Noreg Stormpike"] = "Caporal Noreg Foudrepique";
	["Gaelden Hammersmith <Stormpike Supply Officer>"] = "Gaelden Forgemartel <Officier de ravitaillement Foudrepique>";
	["Stormpike Graveyard"] = "Cimetière Foudrepique";
	["Icewing Cavern"] = "Caverne de l'Aile de glace";
	["Stormpike Banner"] = "Bannière foudrepique";
	["Stormpike Lumber Yard"] = "Entrepôt de bois Foudrepique";
	["Wing Commander Jeztor"] = "Chef d'escadrille Jeztor";
	["Icewing Bunker"] = "Tour de l'Aile de glace";
	["Wing Commander Guse"] = "Chef d'escadrille Guse";
	["Stonehearth Graveyard"] = "Cimetière Gîtepierre";
	["Stormpike Ram Rider Commander"] = "Commandant Chevaucheur de bélier Foudrepique";
	["Stonehearth Outpost"] = "Avant-poste de Gîtepierre";
	["Captain Balinda Stonehearth <Stormpike Captain>"] = "Capitaine Balinda Gîtepierre <Capitaine Foudrepique>";
	["Snowfall Graveyard"] = "Cimetière des neiges";
	["Ichman's Beacon"] = "Balise d'Ichman";
	["Mulverick's Beacon"] = "Balise de Mulverick";
	["Stonehearth Bunker"] = "Tour de Gîtepierre";
	["Ivus the Forest Lord"] = "Ivus le Seigneur de la forêt";
	["Western Crater"] = "Cratère Ouest";
	["Vipore's Beacon"] = "Balise de Vipore";
	["Jeztor's Beacon"] = "Balise de Jeztor";
	["Eastern Crater"] = "Cratère Est";
	["Slidore's Beacon"] = "Balise de Slidore";
	["Guse's Beacon"] = "Balise de Guse";
	["Graveyards, Capturable Areas"] = "Cimetières, Zones capturable";--omitted from AVS
	["Bunkers, Towers, Destroyable Areas"] = "Fortins, Tours, Zones destructibles";--omitted from AVS
	["Assault NPCs, Quest Areas"] = "PNJs, Zones de quêtes";--omitted from AVS

	--Alterac Valley (South)
	["Frostwolf Clan"] = "Clan Loup-de-givre";
	["Frostwolf Keep"] = "Donjon Loup-de-givre";
	["Drek'Thar <Frostwolf General>"] = "Drek'Thar <Général Loup-de-givre>";
	["Duros"] = "Duros";
	["Drakan"] = "Drakan";
	["West Frostwolf Warmaster"] = "Maître de guerre Loup-de-givre ouest";
	["East Frostwolf Warmaster"] = "Maître de guerre Loup-de-givre est";
	["Tower Point Warmaster"] = "Maître de guerre de la Tour de la halte";
	["Iceblood Warmaster"] = "Maître de guerre de Glace-sang";
	["Lokholar the Ice Lord"] = "Lokholar le Seigneur de glace";
	["Iceblood Garrison"] = "Garnison de Glace-sang";
	["Captain Galvangar <Frostwolf Captain>"] = "Capitaine Galvangar <Capitaine Loup-de-givre>";
	["Iceblood Tower"] = "Tour de Glace-sang";
	["Iceblood Graveyard"] = "Cimetière de Glace-sang";
	["Tower Point"] = "Tour de la Halte";
	["Coldtooth Mine"] = "Mine de Froidedent";
	["Taskmaster Snivvle"] = "Sous-chef Snivvle";
	["Masha Swiftcut"] = "Masha Vivecoupe";
	["Aggi Rumblestomp"] = "Aggi Grondécrase";
	["Frostwolf Graveyard"] = "Cimetière de Loup-de-givre";
	["Jotek"] = "Jotek";
	["Smith Regzar"] = "Forgeron Regzar";
	["Primalist Thurloga"] = "Primaliste Thurloga";
	["Sergeant Yazra Bloodsnarl"] = "Sergent Yazra Gronde-sang";
	["Frostwolf Stable Master <Stable Master>"] = "Maître des écuries Loup-de-givre <Maître des écuries>";
	["Frostwolf Wolf Rider Commander"] = "Commandant Chevaucheur de loup Loup-de-givre";
	["Frostwolf Quartermaster"] = "Intendant Loup-de-givre";
	["West Frostwolf Tower"] = "Tour Loup-de-givre occidentale";
	["East Frostwolf Tower"] = "Tour Loup-de-givre orientale";
	["Frostwolf Relief Hut"] = "Hutte de guérison Loup-de-givre";
	["Wildpaw Cavern"] = "Caverne des Follepatte";
	["Frostwolf Banner"] = "Bannière Loup-de-givre";

	--Arathi Basin
	["The Defilers"] = "Les Profanateurs";
	["The League of Arathor"] = "La Ligue d'Arathor";
	["Trollbane Hall"] = "Manoir de Trollemort";
	["Defiler's Den"] = "L'antre des Profanateurs";
	["Stables"] = "Ecuries";
	["Gold Mine"] = "Mine";
	["Smithy"] = "Forge";
	["Lumber Mill"] = "Scierie";
	["Farm"] = "Ferme";

	--Warsong Gulch
	["Warsong Outriders"] = "Voltigeurs Chanteguerre";
	["Silverwing Sentinels"] = "Sentinelles d'Aile-argent";
	["Silverwing Hold"] = "Fort d'Aile-argent";
	["Warsong Lumber Mill"] = "Scierie des Chanteguerre";

	--Eye of the Storm
	["Graveyard"] = "Cimetière";
	["Flag"] = "Drapeau";
	["Mage Tower"] = "Tour des mages";
	["Draenei Ruins"] = "Ruines draenei";
	["Fel Reaver Ruins"] = "Ruines des saccageurs gangrenés";
	["Blood Elf Tower"] = "Tour des elfes de sang";
};
end
