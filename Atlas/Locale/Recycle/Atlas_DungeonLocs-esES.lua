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
-- Última Actualización (last update): 03/06/2008

--]]


if ( GetLocale() == "esES" ) then

AtlasDLLocale = {

	--Common
	["Battlegrounds"] = "Campos de Batalla";
	["Blue"] = "Azul";
	["Dungeon Locations"] = "Lugares de Mazmorras";
	["Instances"] = "Mazmorras";
	["White"] = "Blanco";

	--Places
	["Alterac Mountains"] = "Montañas de Alterac";
	["Alterac Valley"] = "Valle de Alterac";
	["Arathi Basin"] = "Cuenca de Arathi";
	["Arathi Highlands"] = "Tierras Altas de Arathi";
	["Ashenvale"] = "Vallefresno";
	["Auchenai Crypts"] = "Criptas Auchenai";
	["Auchindoun"] = "Auchindoun";
	["Badlands"] = "Tierras del Interior";
	["Black Temple"] = "Templo Oscuro";
	["Blackfathom Deeps"] = "Caverna Brazanegra";
	["Blackrock Depths"] = "Profundidades de Roca Negra";
	["Blackrock Mountain"] = "Montaña de Roca Negra";
	["Blackrock Spire"] = "Cumbre de Roca Negra";
	["Blackwing Lair"] = "Guarida Alanegra";
	["Blade's Edge Mountains"] = "Montañas Filoespada";
	["Caverns of Time"] = "Cavernas del Tiempo";
	["Coilfang Reservoir"] = "Reserva Colmillo Torcido";
	["Deadwind Pass"] = "Paso de la Muerte";
	["Desolace"] = "Desolace";
	["Dire Maul"] = "La Masacre";
	["Dun Morogh"] = "Dun Morogh";
	["Dustwallow Marsh"] = "Marjal Revolcafango";
	["Eastern Kingdoms"] = "Reinos del Este";
	["Eastern Plaguelands"] = "Tierras de la Peste del Este";
	["Feralas"] = "Feralas";
	["Ghostlands"] = "Tierras Fantasma";
	["Gnomeregan"] = "Gnomeregan";
	["Gruul's Lair"] = "Guarida de Gruul";
	["Hellfire Citadel"] = "Ciudadela de Fuego Infernal";
	["Hellfire Peninsula"] = "Península del Fuego Infernal";
	["Hellfire Ramparts"] = "Murallas del Fuego Infernal";
	["Hillsbrad Foothills"] = "Laderas de Trabalomas";
	["Hyjal Summit"] = "La Cima Hyjal";
	["Isle of Quel'Danas"] = "Isla de Quel'Danas";
	["Kalimdor"] = "Kalimdor";
	["Karazhan"] = "Karazhan";
	["Magisters' Terrace"] = "Bancal del Magister";
	["Magtheridon's Lair"] = "La Guarida de Magtheridon";
	["Mana-Tombs"] = "Tumbas de Maná";
	["Maraudon"] = "Maraudon";
	["Molten Core"] = "Núcleo Fundido";
	["Naxxramas"] = "Naxxramas";
	["Netherstorm"] = "Tormenta Abisal";
	["Old Hillsbrad Foothills"] = "Antiguas Laderas de Trabalomas";
	["Onyxia's Lair"] = "Guarida de Onyxia";
	["Orgrimmar"] = "Orgrimmar";
	["Outland"] = "Terrallende";
	["Ragefire Chasm"] = "Sima Ígnea";
	["Razorfen Downs"] = "Horado Rajacieno";
	["Razorfen Kraul"] = "Zahúrda Rojocieno";
	["Ruins of Ahn'Qiraj"] = "Las Ruinas de Ahn'Qiraj";
	["Scarlet Monastery"] = "Monasterio Escarlata";
	["Scholomance"] = "Scholomance";
	["Serpentshrine Cavern"] = "Caverna del Santuario de la Serpiente";
	["Sethekk Halls"] = "Salas Sethekk";
	["Shadow Labyrinth"] = "Laberinto de las Sombras";
	["Shadowfang Keep"] = "Castillo de Colmillo Oscuro";
	["Shadowmoon Valley"] = "Valle Sombraluna";
	["Silithus"] = "Silithus";
	["Silverpine Forest"] = "Bosque de Argenteos";
	["Stormwind City"] = "Ciudad de Ventormenta";
	["Stranglethorn Vale"] = "Vega de Tuercespina";
	["Stratholme"] = "Stratholme";
	["Sunken Temple"] = "El Templo de Atal'Hakkar";
	["Sunwell Plateau"] = "Meseta del pozo del Sol";
	["Swamp of Sorrows"] = "Pantano de las Penas";
	["Tanaris"] = "Tanaris";
	["Tempest Keep"] = "El Castillo de la Tempestad";
	["Temple of Ahn'Qiraj"] = "El Templo de Ahn'Qiraj";
	["Terokkar Forest"] = "Bosque de Terrokkar";
	["The Arcatraz"] = "El Arcatraz";
	["The Barrens"] = "Los Baldíos";
	["The Black Morass"] = "La Ciénaga Negra";
	["The Blood Furnace"] = "El Horno de la Sangre";
	["The Botanica"] = "El Invernáculo";
	["The Deadmines"] = "Las Minas de la Muerte";
	["The Eye"] = "El Ojo";
	["The Mechanar"] = "El Mechanar";
	["The Shattered Halls"] = "Las Salas Arrasadas";
	["The Slave Pens"] = "El Campo de Esclavos";
	["The Steamvault"] = "La cámara de Vapor";
	["The Stockade"] = "Mazmorras de Ventormenta";
	["The Underbog"] = "La Sotiénaga";
	["Tirisfal Glades"] = "Claros de Trisfal";
	["Uldaman"] = "Uldaman";
	["Wailing Caverns"] = "Cuevas de los Lamentos";
	["Warsong Gulch"] = "Garganta Grito de Guerra";
	["Western Plaguelands"] = "Tierras de la Peste del Oeste";
	["Westfall"] = "Páramos de Poniente";
	["Zangarmarsh"] = "Marisma de Zangar";
	["Zul'Aman"] = "Zul'Aman";
	["Zul'Farrak"] = "Zul'Farrak";
	["Zul'Gurub"] = "Zul'Gurub";

};
end
