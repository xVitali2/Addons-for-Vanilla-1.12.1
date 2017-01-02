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

AtlasBGLocale = {

	--Common
	["Alliance"] = "Allianz";
	["Battleground Maps"] = "Schlachtfeldkarten";
	["Entrance"] = "Eingang";
	["Horde"] = "Horde";
	["Neutral"] = "Neutral";
	["North"] = "Nord";
	["Orange"] = "Orange";
	["Red"] = "Rot";
	["Rep"] = "Ruf";
	["Rescued"] = "Gerettet";
	["South"] = "Süd";
	["Summon"] = "Beschwörbar";
	["White"] = "Weiß";

	--Places
	["Alterac Mountains"] = "Alteracgebirge";
	["Alterac Valley"] = "Alteractal"; ["AV"] = "AV";
	["Arathi Basin"] = "Arathibecken"; ["AB"] = "AB";
	["Arathi Highlands"] = "Arathihochland";
	["Ashenvale"] = "Eschental";
	["Eastern Kingdoms"] = "Östliche Königreiche";
	["Eye of the Storm"] = "Auge des Sturms"; ["EotS"] = "Auge";
	["Hillsbrad Foothills"] = "Vorgebirge des Hügellands";
	["Kalimdor"] = "Kalimdor";
	["Netherstorm"] = "Nethersturm";
	["Outland"] = "Scherbenwelt";
	["The Barrens"] = "Brachland";
	["Warsong Gulch"] = "Kriegshymnenschlucht"; ["WSG"] = "WS";

	--Alterac Valley (North)
	["Stormpike Guard"] = "Sturmlanzengarde";
	["Dun Baldar"] = "Dun Baldar";
	["Vanndar Stormpike <Stormpike General>"] = "Vanndar Sturmlanze <General der Sturmlanzen>";
	["Dun Baldar North Marshal"] = "Marschall der Nordtruppen von Dun Baldar";
	["Dun Baldar South Marshal"] = "Marschall der Südtruppen von Dun Baldar";
	["Icewing Marshal"] = "Marschall der Eisschwingentruppen";
	["Stonehearth Marshal"] = "Marschall der Steinbruchtruppen";
	["Prospector Stonehewer"] = "Ausgrabungsleiter Steinhauer";
	["Irondeep Mine"] = "Eisenschachtmine";
	["Morloch"] = "Morloch";
	["Umi Thorson"] = "Umi Thorson";
	["Keetar"] = "Keetar";
	["Arch Druid Renferal"] = "Erzdruide Renferal";
	["Dun Baldar North Bunker"] = "Nordbunker von Dun Baldar";
	["Wing Commander Mulverick"] = "Schwadronskommandant Mulverick";--omitted from AVS
	["Murgot Deepforge"] = "Murgot Tiefenschmied";
	["Dirk Swindle <Bounty Hunter>"] = "Dirk Schwindel <Kopfgeldjäger>";
	["Athramanis <Bounty Hunter>"] = "Athramanis <Kopfgeldjäger>";
	["Lana Thunderbrew <Blacksmithing Supplies>"] = "Lana Donnerbräu <Schmiedekunstbedarf>";
	["Stormpike Aid Station"] = "Lazarett der Sturmlanzen";
	["Stormpike Stable Master <Stable Master>"] = "Stallmeister der Sturmlanzen <Stallmeister>";
	["Stormpike Ram Rider Commander"] = "Kommandant der Sturmlanzenwidderreiter";
	["Svalbrad Farmountain <Trade Goods>"] = "Svalbrad Bergweh <Handwerkswaren>";
	["Kurdrum Barleybeard <Reagents & Poison Supplies>"] = "Kurdrum Gerstenbart <Reagenzien & Giftreagenzien>";
	["Stormpike Quartermaster"] = "Rüstmeister der Sturmlanzen";
	["Jonivera Farmountain <General Goods>"] = "Jonivera Bergweh <Gemischtwaren>";
	["Brogus Thunderbrew <Food & Drink>"] = "Brogus Donnerbräu <Essen & Getränke>";
	["Wing Commander Ichman"] = "Schwadronskommandant Ichman";--omitted from AVS
	["Wing Commander Slidore"] = "Schwadronskommandant Erzrutsch";--omitted from AVS
	["Wing Commander Vipore"] = "Schwadronskommandant Vipore";--omitted from AVS
	["Dun Baldar South Bunker"] = "Südbunker von Dun Baldar";
	["Corporal Noreg Stormpike"] = "Korporal Noreg Sturmlanze";
	["Gaelden Hammersmith <Stormpike Supply Officer>"] = "Gaelden Hammerschmied <Versorgungsoffizier der Sturmlanzen>";
	["Stormpike Graveyard"] = "Friedhof der Sturmlanzen";
	["Icewing Cavern"] = "Eisschwingenhöhle";
	["Stormpike Banner"] = "Banner der Sturmlanzen";
	["Stormpike Lumber Yard"] = "Sägewerk der Sturmlanzen";
	["Wing Commander Jeztor"] = "Schwadronskommandant Jeztor";--omitted from AVS
	["Icewing Bunker"] = "Eisschwingenbunker";
	["Wing Commander Guse"] = "Schwadronskommandant Guse";--omitted from AVS
	["Stonehearth Graveyard"] = "Steinbruchfriedhof";
	["Stormpike Ram Rider Commander"] = "Kommandant der Sturmlanzenwidderreiter";
	["Stonehearth Outpost"] = "Steinbruchaußenposten";
	["Captain Balinda Stonehearth <Stormpike Captain>"] = "Hauptmann Balinda Steinbruch <Hauptmann der Sturmlanzen>";
	["Snowfall Graveyard"] = "Schneewehenfriedhof";
	["Ichman's Beacon"] = "Ichmans Signal";
	["Mulverick's Beacon"] = "Mulvericks Signal";
	["Stonehearth Bunker"] = "Steinbruchbunker";
	["Ivus the Forest Lord"] = "Ivus der Waldfürst";
	["Western Crater"] = "Westlicher Krater";
	["Vipore's Beacon"] = "Vipores Signal";
	["Jeztor's Beacon"] = "Jeztors Signal";
	["Eastern Crater"] = "Östlicher Krater";
	["Slidore's Beacon"] = "Erzrutschs Signal";
	["Guse's Beacon"] = "Guses Signal";
	["Graveyards, Capturable Areas"] = "Friedhöfe, Einnehmbare Gebiete";--omitted from AVS
	["Bunkers, Towers, Destroyable Areas"] = "Bunker, Türme, Zerstörbare Gebiete";--omitted from AVS
	["Assault NPCs, Quest Areas"] = "Angreifbare NPCs, Questgebiete";--omitted from AVS

	--Alterac Valley (South)
	["Frostwolf Clan"] = "Frostwolfklan";
	["Frostwolf Keep"] = "Burg Frostwolf";
	["Drek'Thar <Frostwolf General>"] = "Drek'Thar <General der Frostwölfe>";
	["Duros"] = "Duros";
	["Drakan"] = "Drakan";
	["West Frostwolf Warmaster"] = "Westkriegsmeister der Frostwölfe";
	["East Frostwolf Warmaster"] = "Ostkriegsmeister der Frostwölfe";
	["Tower Point Warmaster"] = "Kriegsmeister der Turmstellung";
	["Iceblood Warmaster"] = "Kriegsmeister der Eisbluttruppen";
	["Lokholar the Ice Lord"] = "Lokholar der Eislord";
	["Iceblood Garrison"] = "Eisblutgarnison";
	["Captain Galvangar <Frostwolf Captain>"] = "Hauptmann Galvangar <Hauptmann der Frostwölfe>";
	["Iceblood Tower"] = "Eisblutturm";
	["Iceblood Graveyard"] = "Eisblutfriedhof";
	["Tower Point"] = "Turmstellung";
	["Coldtooth Mine"] = "Eisbeißermine";
	["Taskmaster Snivvle"] = "Zuchtmeister Schnuffel";
	["Masha Swiftcut"] = "Masha Schnellstreich";
	["Aggi Rumblestomp"] = "Aggi Polterbein";
	["Frostwolf Graveyard"] = "Friedhof der Frostwölfe";
	["Jotek"] = "Jotek";
	["Smith Regzar"] = "Schmied Regzar";
	["Primalist Thurloga"] = "Primalist Thurloga";
	["Sergeant Yazra Bloodsnarl"] = "Unteroffizier Yazra Murrblut";
	["Frostwolf Stable Master <Stable Master>"] = "Stallmeisterin der Frostwölfe <Stallmeisterin>";
	["Frostwolf Wolf Rider Commander"] = "Wolfsreiterkommandant der Frostwölfe";
	["Frostwolf Quartermaster"] = "Rüstmeister der Frostwölfe";
	["West Frostwolf Tower"] = "Westlicher Frostwolfturm";
	["East Frostwolf Tower"] = "Östlicher Frostwolfturm";
	["Frostwolf Relief Hut"] = "Heilerhütte der Frostwölfe";
	["Wildpaw Cavern"] = "Höhle der Wildpfoten";
	["Frostwolf Banner"] = "Banner der Frostwölfe";

	--Arathi Basin
	["The Defilers"] = "Die Entweihten";
	["The League of Arathor"] = "Der Bund von Arathor";
	["Trollbane Hall"] = "Trollbanns Halle";
	["Defiler's Den"] = "Die entweihte Feste";
	["Stables"] = "Ställe";
	["Gold Mine"] = "Goldmine";
	["Smithy"] = "Schmiede";
	["Lumber Mill"] = "Sägewerk";
	["Farm"] = "Hof";

	--Warsong Gulch
	["Warsong Outriders"] = "Kriegshymnenklan";
	["Silverwing Sentinels"] = "Schildwachen der Silberschwingen";
	["Silverwing Hold"] = "Feste der Silberschwingen";
	["Warsong Lumber Mill"] = "Sägewerk des Kriegshymnenklans";

	--Eye of the Storm
	["Graveyard"] = "Friedhof";
	["Flag"] = "Flagge";
	["Mage Tower"] = "Magierturm";
	["Draenei Ruins"] = "Draeneiruinen";
	["Fel Reaver Ruins"] = "Teufelshäscherruinen";
	["Blood Elf Tower"] = "Blutelfenturm";

};

end