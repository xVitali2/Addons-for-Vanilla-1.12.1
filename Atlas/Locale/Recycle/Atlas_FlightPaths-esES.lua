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

--]]

-- Datos de Atlas (Español)
-- Traducido por --> maqjav|Marosth de Tyrande<--
-- maqjav@hotmail.com
-- Úlltima Actualización (last update): 27/06/2008

--]]
if ( GetLocale() ==	"esES" ) then

AtlasFPLocale = {

	["Aerie Peak"] = "Pico Nidal";
	["Allerian Stronghold"] = "Bastión Allerian";
	["Alliance"] = "Alianza";
	["Altar of Sha'tar"] = "Altar de Sha'tar";
	["Arathi Highlands"] = "Tierras Altas de Arathi";
	["Area 52"] = "Area 52";
	["Ashenvale"] = "Vallefresno";
	["Astranaar"] = "Astranaar";
	["Auberdine"] = "Auberdine";
	["Azshara"] = "Azshara";
	["Azuremyst Isle"] = "Isla Bruma Azur";
	["Badlands"] = "Tierras del Interior";
	["Blackwind Landing"] = "Alto de los Vientonegro";
	["Blade's Edge Mountains"] = "Montañas Filospada";
	["Blasted Lands"] = "Las Tierras Devastadas";
	["Blood Watch"] = "Avanzada de Sangre";
	["Bloodmyst Isle"] = "Isla Bruma de Sangre";
	["Bloodvenom Post"] = "Puesto del Veneno";
	["Booty Bay"] = "Bahía del Botín";
	["Brackenwall Village"] = "Poblado Murohelecho";
	["Burning Steppes"] = "Las Estepas Ardientes";
	["Camp Mojache"] = "Campamento Mojache";
	["Camp Taurajo"] = "Campamento Taurajo";
	["Cenarion Hold"] = "Fuerte Cenarion";
	["Chillwind Point"] = "Campamento del Orvallo";
	["Cosmowrench"] = "Cosmotirón";
	["Crossroads"] = "El Cruce";
	["Darkshire"] = "Villa Oscura";
	["Darkshore"] = "Costa Oscura";
	["Desolace"] = "Desolace";
	["Druid-only"] = "Solo druidas";
	["Dun Morogh"] = "Dun Morogh";
	["Durotar"] = "Durotar";
	["Duskwood"] = "Bosque del Ocaso";
	["Dustwallow Marsh"] = "Marjal Revolcafango";
	["Eastern Kingdoms"] = "Las Tierras del Este";
	["Eastern Plaguelands"] = "Tierras de la Peste del Este";
	["Elwynn Forest"] = "Bosque de Elwynn";
	["Emerald Sanctuary"] = "Santuario Esmeralda";
	["Evergrove"] = "Soto Eterno"; --Check
	["Everlook"] = "Soto Eterno"; --Check
	["Eversong Woods"] = "Bosque Canción Eterna";
	["Falcon Watch"] = "Avanzada del Halcón";
	["Feathermoon Stronghold"] = "Bastión Plumaluna";
	["Felwood"] = "Felwood";
	["Feralas"] = "Feralas";
	["Flame Crest"] = "Peñasco Llamarada";
	["Flight Path Maps"] = "Mapas de rutas de vuelo";
	["Forest Song"] = "Bosque Canción Eterna";
	["Freewind Post"] = "Poblado Viento Libre";
	["Gadgetzan"] = "Gadgetzan";
	["Garadar"] = "Garadar";
	["Ghostlands"] = "Tierras Fantasma";
	["Grom'Gol Base Camp"] = "Campamento Grom'Gol";
	["Hammerfall"] = "Sentencia";
	["Hatchet Hills"] = "Colinas Hacha";
	["Hellfire Peninsula"] = "Península de Fuego Infernal";
	["Hillsbrad Foothills"] = "Laderas de Trabalomas";
	["Honor Hold"] = "Bastión del Honor";
	["Horde"] = "Horda";
	["Ironforge"] = "Forjaz";
	["Isle of Quel'Danas"] = "Isla de Quel'Danas";
	["Kalimdor"] = "Kalimdor";
	["Kargath"] = "Kargath";
	["Lakeshire"] = "Villa del Lago";
	["Light's Hope Chapel"] = "Capilla de la Esperanza de la Luz";
	["Loch Modan"] = "Loch Modan";
	["Marshal's Refuge"] = "Refugio de Marshall";
	["Menethil Harbor"] = "Refugio de Marshal";
	["Mok'Nathal Village"] = "Aldea Mok'Nathal";
	["Moonglade"] = "Claro de la Luna";
	["Morgan's Vigil"] = "Vigilia de Morgan";
	["Mudsprocket"] = "Piñón de Barro";
	["Mulgore"] = "Mulgore";
	["Nagrand"] = "Nagrand";
	["Nethergarde Keep"] = "Castillo de Netherguard"; --Check
	["Netherstorm"] = "Tormenta Abisal";
	["Nighthaven"] = "Amparo de la Noche";
	["Nijel's Point"] = "Punta de Nijel";
	["Orebor Harborage"] = "Puerto Orebor";
	["Orgrimmar"] = "Orgrimmar";
	["Outland"] = "Terrallende";
	["Ratchet"] = "Trinquete";
	["Rebel Camp"] = "Asentamiento Rebelde";
	["Redridge Mountains"] = "Montañas Crestagrana";
	["Refuge Pointe"] = "Refugio de la Zaga";
	["Requires honored faction with Sha'tari Skyguard"] = "Requiere honorable con la facción Guardia del cielo Sha'tari";
	["Revantusk Village"] = "Poblado Sañadiente";
	["Rut'Theran Village"] = "Aldea Rut'Theran";
	["Sanctum of the Stars"] = "Sagrario de las Estrellas";
	["Searing Gorge"] = "La Garganta de Fuego";
	["Sentinel Hill"] = "Colina de la Centinela";
	["Shadowmoon Valley"] = "Valle Sombraluna";
	["Shadowmoon Village"] = "Aldea Sombraluna";
	["Shadowprey Village"] = "Aldea Cazasombras";
	["Shatter Point"] = "Punta de Expedición";
	["Shattrath City"] = "Ciudad de Shattrath";
	["Silithus"] = "Silithus";
	["Silvermoon"] = "Lunargenta";
	["Silverpine Forest"] = "Bosque de Argenteos";
	["Skyguard Outpost"] = "Avanzada de la Guardia del cielo";
	["South of the path along Lake Elune'ara"] = "Sur del camino a Lago Elune'ara";
	["Southshore"] = "Costasur";
	["Spinebreaker Post"] = "Armeria de Expedición";
	["Splintertree Post"] = "Puesto del Hachazo";
	["Stonard"] = "Rocal";
	["Stonebreaker Hold"] = "Bastión Rompepedras";
	["Stonetalon Mountains"] = "Sierra Espolon";
	["Stonetalon Peak"] = "Cima del Espolón";
	["Stormwind City"] = "Ciudad de Ventormenta";
	["Stranglethorn Vale"] = "Vega de Tuercespina";
	["Sun's Reach"] = "Fuente del Sol";
	["Sun Rock Retreat"] = "Refugio Roca del Sol";
	["Swamp of Sorrows"] = "Pantano de las Penas";
	["Swamprat Post"] = "Avanzada Rata del Pantano";
	["Sylvanaar"] = "Sylvanaar";
	["Talonbranch Glade"] = "Claro Ramaespolón";
	["Talrendis Point"] = "Punta Talrendis";
	["Tanaris"] = "Tanaris";
	["Tarren Mill"] = "Molino Tarren";
	["Telaar"] = "Telaar";
	["Teldrassil"] = "Teldrassil";
	["Telredor"] = "Telredor";
	["Temple of Telhamat"] = "Templo de Telhamat";
	["Terokkar Forest"] = "Bosque de Terokkar";
	["Thalanaar"] = "Thalanaar";
	["The Aldor"] = "Los Aldor";
	["The Barrens"] = "Los Baldíos";
	["The Dark Portal"] = "El Portal Oscuro";
	["The Exodar"] = "Exodar";
	["The Hinterlands"] = "Tierras del Interior";
	["The Scryers"] = "Los Arúspices";
	["The Sepulcher"] = "El Sepulcro";
	["The Stormspire"] = "La Flecha de la Tormenta";
	["Thelsamar"] = "Thelsamar";
	["Theramore Isle"] = "Isla Theramore";
	["Thorium Point"] = "Puesto del Torio";
	["Thousand Needles"] = "Las Mil Agujas";
	["Thrallmar"] = "Thrallmar";
	["Thunder Bluff"] = "Cima del Trueno";
	["Thunderlord Stronghold"] = "Bastión Señor del Trueno";
	["Tirisfal Glades"] = "Claros de Tirisfal";
	["Toshley's Station"] = "Estación de Toshley";
	["Tranquillien"] = "Tranquillien";
	["Un'Goro Crater"] = "Crater de Un'Goro";
	["Undercity"] = "Entrañas";
	["Valormok"] = "Valormok";
	["West of the path to Timbermaw Hold"] = "Oeste del camino al Puesto Vigóa del Cubil";
	["Western Plaguelands"] = "Tierras de la Peste del Oeste";
	["Westfall"] = "Paramos de Poniente";
	["Wetlands"] = "Los Humedales";
	["Wildhammer Stronghold"] = "Bastión Martillo Salvaje";
	["Winterspring"] = "Cuna del Invierno";
	["Zabra'jin"] = "Zabra'jin";
	["Zangarmarsh"] = "Marmisma de Zangar";
	["Zoram'gar Outpost"] = "Avanzada de Zoram'gar";

};
end