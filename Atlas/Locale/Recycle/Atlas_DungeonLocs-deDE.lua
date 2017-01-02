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

if ( GetLocale() == "deDE" ) then

AtlasDLLocale = {

	--Common
	["Battlegrounds"] = "Schlachtfelder";
	["Blue"] = "Blau";
	["Dungeon Locations"] = "Instanzen-Standorte";
	["Instances"] = "Instanzen";
	["White"] = "Weiß";

	--Places
	["Alterac Mountains"] = "Alteracgebirge";
	["Alterac Valley"] = "Alteractal";
	["Arathi Basin"] = "Arathibecken";
	["Arathi Highlands"] = "Arathihochland";
	["Ashenvale"] = "Eschental";
	["Auchenai Crypts"] = "Auchenaikrypta";
	["Auchindoun"] = "Auchindoun";
	["Badlands"] = "Ödland";
	["Black Temple"] = "Der Schwarze Tempel";
	["Blackfathom Deeps"] = "Tiefschwarze Grotte";
	["Blackrock Depths"] = "Schwarzfelstiefen";
	["Blackrock Mountain"] = "Der Schwarzfels";
	["Blackrock Spire"] = "Schwarzfelsspitze";
	["Blackwing Lair"] = "Pechschwingenhort";
	["Blade's Edge Mountains"] = "Schergrat";
	["Caverns of Time"] = "Höhlen der Zeit";
	["Coilfang Reservoir"] = "Der Echsenkessel";
	["Deadwind Pass"] = "Gebirgspass der Totenwinde";
	["Desolace"] = "Desolace";
	["Dire Maul"] = "Düsterbruch";
	["Dun Morogh"] = "Dun Morogh";
	["Dustwallow Marsh"] = "Düstermarschen";
	["Eastern Kingdoms"] = "Östliche Königreiche";
	["Eastern Plaguelands"] = "Östliche Pestländer";
	["Feralas"] = "Feralas";
	["Ghostlands"] = "Geisterlande";
	["Gnomeregan"] = "Gnomeregan";
	["Gruul's Lair"] = "Gruuls Unterschlupf";
	["Hellfire Citadel"] = "Höllenfeuerzitadelle";
	["Hellfire Peninsula"] = "Höllenfeuerhalbinsel";
	["Hellfire Ramparts"] = "Höllenfeuerbollwerk";
	["Hillsbrad Foothills"] = "Vorgebirge des Hügellands";
	["Hyjal Summit"] = "Hyjalgipfel";
	["Isle of Quel'Danas"] = "Insel von Quel'Danas";
	["Kalimdor"] = "Kalimdor";
	["Karazhan"] = "Karazhan";
	["Magisters' Terrace"] = "Terrasse der Magister";
	["Magtheridon's Lair"] = "Magtheridons Kammer";
	["Mana-Tombs"] = "Managruft";
	["Maraudon"] = "Maraudon";
	["Molten Core"] = "Geschmolzener Kern";
	["Naxxramas"] = "Naxxramas";
	["Netherstorm"] = "Nethersturm";
	["Old Hillsbrad Foothills"] = "Vorgebirge des Alten Hügellands";
	["Onyxia's Lair"] = "Onyxias Hort";
	["Orgrimmar"] = "Orgrimmar";
	["Outland"] = "Scherbenwelt";
	["Ragefire Chasm"] = "Der Flammenschlund";
	["Razorfen Downs"] = "Hügel der Klingenhauer";
	["Razorfen Kraul"] = "Kral der Klingenhauer";
	["Ruins of Ahn'Qiraj"] = "Ruinen von Ahn'Qiraj";
	["Scarlet Monastery"] = "Das scharlachrote Kloster";
	["Scholomance"] = "Scholomance";
	["Serpentshrine Cavern"] = "Höhle des Schlangenschreins";
	["Sethekk Halls"] = "Sethekkhallen";
	["Shadow Labyrinth"] = "Schattenlabyrinth";
	["Shadowfang Keep"] = "Burg Schattenfang";
	["Shadowmoon Valley"] = "Schattenmondtal";
	["Silithus"] = "Silithus";
	["Silverpine Forest"] = "Silberwald";
	["Stormwind City"] = "Sturmwind";
	["Stranglethorn Vale"] = "Schlingendorntal";
	["Stratholme"] = "Stratholme";
	["Sunken Temple"] = "Der Tempel von Atal'Hakkar";
	["Sunwell Plateau"] = "Sonnenbrunnenplateau";
	["Swamp of Sorrows"] = "Sümpfe des Elends";
	["Tanaris"] = "Tanaris";
	["Tempest Keep"] = "Festung der Stürme";
	["Temple of Ahn'Qiraj"] = "Tempel von Ahn'Qiraj";
	["Terokkar Forest"] = "Wälder von Terrokar";
	["The Arcatraz"] = "Die Arkatraz";
	["The Barrens"] = "Brachland";
	["The Black Morass"] = "Der schwarze Morast";
	["The Blood Furnace"] = "Der Blutkessel";
	["The Botanica"] = "Die Botanika";
	["The Deadmines"] = "Die Todesminen";
	["The Eye"] = "Festung der Stürme";
	["The Mechanar"] = "Die Mechanar";
	["The Shattered Halls"] = "Die zerschmetterten Hallen";
	["The Slave Pens"] = "Die Sklavenunterkünfte";
	["The Steamvault"] = "Die Dampfkammer";
	["The Stockade"] = "Das Verlies";
	["The Underbog"] = "Der Tiefensumpf";
	["Tirisfal Glades"] = "Tirisfal";
	["Uldaman"] = "Uldaman";
	["Wailing Caverns"] = "Die Höhlen des Wehklagens";
	["Warsong Gulch"] = "Kriegshymnenschlucht";
	["Western Plaguelands"] = "Westliche Pestländer";
	["Westfall"] = "Westfall";
	["Zangarmarsh"] = "Zangarmarschen";
	["Zul'Aman"] = "Zul'Aman";
	["Zul'Farrak"] = "Zul'Farrak";
	["Zul'Gurub"] = "Zul'Gurub";

};

end