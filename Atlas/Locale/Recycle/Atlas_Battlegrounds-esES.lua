--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005, 2008 Dan Gilbert
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

-- Datos de Atlas (Español)
-- Traducido por --> maqjav|Marosth de Tyrande<--
-- maqjav@hotmail.com
-- Última Actualización (last update): 03/06/2008

--]]

if ( GetLocale() == "esES" ) then

AtlasBGLocale = {

	--Common
	["Alliance"] = "Alianza";
	["Battleground Maps"] = "Mapas de Campos de Batalla";
	["Entrance"] = "Entrada";
	["Horde"] = "Horda";
	["Neutral"] = "Neutral";
	["North"] = "Norte";
	["Orange"] = "Naranja";
	["Red"] = "Rojo";
	["Rep"] = "Rep";
	["Rescued"] = "Rescate";
	["South"] = "Sur";
	["Summon"] = "Invocar";
	["White"] = "Blanco";
	
	--Places
	["Alterac Mountains"] = "Montañas Alterac";
	["Alterac Valley"] = "Valle de Alterac"; ["AV"] = "VA";
	["Arathi Basin"] = "Cuenca de Arathi"; ["AB"] = "CA";
	["Arathi Highlands"] = "Tierras Altas de Arathi";
	["Ashenvale"] = "Vallefresno";
	["Eastern Kingdoms"] = "Reinos del Este";
	["Eye of the Storm"] = "El Ojo de la Tormenta"; ["EotS"] = "OT";
	["Hillsbrad Foothills"] = "Laderas de Trabalomas";
	["Kalimdor"] = "Kalimdor";
	["Netherstorm"] = "Tormenta Abisal";
	["Outland"] = "Terrallende";
	["The Barrens"] = "Los Baldíos";
	["Warsong Gulch"] = "Garganta Grito de Guerra"; ["WSG"] = "GGG";
	
	--Alterac Valley (North)
	["Stormpike Guard"] = "Guardia Pico Tormenta";
	["Dun Baldar"] = "Dun Baldar";
	["Vanndar Stormpike <Stormpike General>"] = "Vanndar Pico Tormenta <General Pico Tormenta>";
	["Dun Baldar North Marshal"] = "Alguacil de Dun Baldar Norte";
	["Dun Baldar South Marshal"] = "Alguacil de Dun Baldar Sur";
	["Icewing Marshal"] = "Alguacil Alahielo";
	["Stonehearth Marshal"] = "Alguacil Piedrahogar";
	["Prospector Stonehewer"] = "Prospectora Tallapiedra";
	["Irondeep Mine"] = "Mina Ferrohondo";
	["Morloch"] = "Morloch";
	["Umi Thorson"] = "Umi Thorson";
	["Keetar"] = "Keetar";
	["Arch Druid Renferal"] = "Archidruida Renferal";
	["Dun Baldar North Bunker"] = "Búnker Norte de Dun Baldar";
	["Wing Commander Mulverick"] = "Comandante del aire Mulverick";--omitted from AVS
	["Murgot Deepforge"] = "Murgot Forjahonda";
	["Dirk Swindle <Bounty Hunter>"] = "Dirk Estafa <Cazador de recompensas>";
	["Athramanis <Bounty Hunter>"] = "Athramanis <Cazadora de recompensas>";
	["Lana Thunderbrew <Blacksmithing Supplies>"] = "Lana Cebatruenos <Suministros de herrería>";
	["Stormpike Aid Station"] = "Puesto de socorro de Pico Tormenta";
	["Stormpike Stable Master <Stable Master>"] = "Maestra de establo de Pico Tormenta <Maestra de establos>";
	["Stormpike Ram Rider Commander"] = "Comandante de jinetes de carneros de Pico Tormenta";
	["Svalbrad Farmountain <Trade Goods>"] = "Svalbrad Montelejano <Objetos comerciables>";
	["Kurdrum Barleybeard <Reagents & Poison Supplies>"] = "Kurdrum Barbacebada <Suministros de venenos y componentes>";
	["Stormpike Quartermaster"] = "Intendente de Pico Tormenta";
	["Jonivera Farmountain <General Goods>"] = "Jonivera Montelejano <Pertrechos>";
	["Brogus Thunderbrew <Food & Drink>"] = "Brogus Cebatruenos <Alimentos y bebidas>";
	["Wing Commander Ichman"] = "Comandante del aire Ichman";--omitted from AVS
	["Wing Commander Slidore"] = "Comandante del aire Slidore";--omitted from AVS
	["Wing Commander Vipore"] = "Comandante del aire Vipore";--omitted from AVS
	["Dun Baldar South Bunker"] = "Búnker Sur de Dun Baldar";
	["Corporal Noreg Stormpike"] = "Cabo Noreg Pico Tormenta";
	["Gaelden Hammersmith <Stormpike Supply Officer>"] = "Gaelden Martillero <Oficial de suministros Pico Tormenta>";
	["Stormpike Graveyard"] = "Cementerio Pico Tormenta";
	["Icewing Cavern"] = "Cueva Ala Gélida";
	["Stormpike Banner"] = "Estandarte de Pico Tormenta";
	["Stormpike Lumber Yard"] = "Stormpike Lumber Yard"; --FALTA
	["Wing Commander Jeztor"] = "Comandante del aire Jeztor";--omitted from AVS
	["Icewing Bunker"] = "Búnker Ala Gélida";
	["Wing Commander Guse"] = "Comandante del aire Guse";--omitted from AVS
	["Stonehearth Graveyard"] = "Cementerio Piedrahogar";
	["Stormpike Ram Rider Commander"] = "Comandante de jinetes de carneros de Pico Tormenta";
	["Stonehearth Outpost"] = "Puesto de salida Piedrahogar";
	["Captain Balinda Stonehearth <Stormpike Captain>"] = "Capitana Balinda Piedrahogar <Capitana Pico Tormenta>";
	["Snowfall Graveyard"] = "Cementerio Avalancha";
	["Ichman's Beacon"] = "Señal de Inchman";
	["Mulverick's Beacon"] = "Señal de Mulverick";
	["Stonehearth Bunker"] = "Búnker Piedrahogar";
	["Ivus the Forest Lord"] = "Ivus el Señor del Bosque";
	["Western Crater"] = "Cráter occidental";
	["Vipore's Beacon"] = "Señal de Vipore";
	["Jeztor's Beacon"] = "Señal de Jeztor";
	["Eastern Crater"] = "Cráter del este";
	["Slidore's Beacon"] = "Señal de Slidore";
	["Guse's Beacon"] = "Señal de Guse";
	["Graveyards, Capturable Areas"] = "Cementerios, Areas capturables";--omitted from AVS
	["Bunkers, Towers, Destroyable Areas"] = "Búnkers, Torres, Areas destruibles";--omitted from AVS
	["Assault NPCs, Quest Areas"] = "Personajes de asalto, Areas de Misiones";--omitted from AVS

	--Alterac Valley (South)
	["Frostwolf Clan"] = "Clan Lobo Gélido";
	["Frostwolf Keep"] = "Bastión Lobo Gélido";
	["Drek'Thar <Frostwolf General>"] = "Drek'Thar <General Lobo Gélido>";
	["Duros"] = "Duros";
	["Drakan"] = "Drakan";
	["West Frostwolf Warmaster"] = "Maestro de guerra del oeste Lobo Gélido";
	["East Frostwolf Warmaster"] = "Maestro de guerra del este Lobo Gélido";
	["Tower Point Warmaster"] = "Maestro de guerra de Punta de la Torre";
	["Iceblood Warmaster"] = "Maestro de guerra Sangrehielo";
	["Lokholar the Ice Lord"] = "Lokholar el Señor de Hielo";
	["Iceblood Garrison"] = "Baluarte Sangre Fría";
	["Captain Galvangar <Frostwolf Captain>"] = "Capitán Galvangar <Capitán Lobo Gélido>";
	["Iceblood Tower"] = "Torre Sangre Fría";
	["Iceblood Graveyard"] = "Cementerio Sangre Fría";
	["Tower Point"] = "Punto Torre";
	["Coldtooth Mine"] = "Mina Dentefrío";
	["Taskmaster Snivvle"] = "Capataz Sniwle";
	["Masha Swiftcut"] = "Masha Corteveloz";
	["Aggi Rumblestomp"] = "Aggi Piesdeplomo";
	["Frostwolf Graveyard"] = "Cementerio Lobo Gélido";
	["Jotek"] = "Jotek";
	["Smith Regzar"] = "Herrero Regzar";
	["Primalist Thurloga"] = "Primalist Thurloga";
	["Sergeant Yazra Bloodsnarl"] = "Sargento Yazra Gruñidosangriento";
	["Frostwolf Stable Master <Stable Master>"] = "Maestra de establo Lobo Gélido <Maestro de establos>";
	["Frostwolf Wolf Rider Commander"] = "Comandate jinete de lobos Lobo Gélido";
	["Frostwolf Quartermaster"] = "Intendente Lobo Gélido";
	["West Frostwolf Tower"] = "Torre Lobo Gélido Oeste";
	["East Frostwolf Tower"] = "Torre Lobo Gélido Este";
	["Frostwolf Relief Hut"] = "Puesto de auxilio de Lobo Gélido";
	["Wildpaw Cavern"] = "Caverna Zarpa Salvaje";
	["Frostwolf Banner"] = "Estandarte de Lobo Gélido";

	--Arathi Basin
	["The Defilers"] = "Los Rapiñadores";
	["The League of Arathor"] = "La Liga de Arathor";
	["Trollbane Hall"] = "Bastión de Trollbane";
	["Defiler's Den"] = "Guarida de los Rapiñadores";
	["Stables"] = "Establo";
	["Gold Mine"] = "Mina de Oro";
	["Smithy"] = "Herrería";
	["Lumber Mill"] = "Aserradero";
	["Farm"] = "Granja";

	--Warsong Gulch
	["Warsong Outriders"] = "Escoltas de Grito de Guerra";
	["Silverwing Sentinels"] = "Centinelas Ala de Plata";
	["Silverwing Hold"] = "Bastión Ala de Plata";
	["Warsong Lumber Mill"] = "Serrería Grito de Guerra";

	--Eye of the Storm
	["Graveyard"] = "Cementerio";
	["Flag"] = "Bandera";
	["Mage Tower"] = "Torre de los Magos";
	["Draenei Ruins"] = "Ruinas de los Draenei";
	["Fel Reaver Ruins"] = "Ruinas de Atracador Vil";
	["Blood Elf Tower"] = "Torre de los Elfos de Sangre";

};
end
