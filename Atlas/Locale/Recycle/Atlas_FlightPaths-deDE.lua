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

AtlasFPLocale = {

	["Aerie Peak"] = "Nistgipfel";
	["Allerian Stronghold"] = "Allerias Feste";
	["Alliance"] = "Allianz";
	["Altar of Sha'tar"] = "Altar der Sha'tar";
	["Arathi Highlands"] = "Arathihochland";
	["Area 52"] = "Area 52";
	["Ashenvale"] = "Eschental";
	["Astranaar"] = "Astranaar";
	["Auberdine"] = "Auberdine";
	["Azshara"] = "Azshara";
	["Azuremyst Isle"] = "Azurmythosinsel";
	["Badlands"] = "Ödland";
	["Blackwind Landing"] = "Schattenwindlager";
	["Blade's Edge Mountains"] = "Schergrat";
	["Blasted Lands"] = "Verwüstete Lande";
	["Blood Watch"] = "Blutwacht";
	["Bloodmyst Isle"] = "Blutmythosinsel";
	["Bloodvenom Post"] = "Blutgiftposten";
	["Booty Bay"] = "Beutebucht";
	["Brackenwall Village"] = "Brackenwall";
	["Burning Steppes"] = "Brennende Steppe";
	["Camp Mojache"] = "Camp Mojache";
	["Camp Taurajo"] = "Camp Taurajo";
	["Cenarion Hold"] = "Burg Cenarius";
	["Chillwind Point"] = "Zugwindlager";
	["Cosmowrench"] = "Kosmozang";
	["Crossroads"] = "Das Wegekreuz";
	["Darkshire"] = "Dunkelhain";
	["Darkshore"] = "Dunkelküste";
	["Desolace"] = "Desolace";
	["Druid-only"] = "Nur Druiden";
	["Dun Morogh"] = "Dun Morogh";
	["Durotar"] = "Durotar";
	["Duskwood"] = "Dämmerwald";
	["Dustwallow Marsh"] = "Düstermarschen";
	["Eastern Kingdoms"] = "Östliche Königreiche";
	["Eastern Plaguelands"] = "Östliche Pestländer";
	["Elwynn Forest"] = "Wald von Elwynn";
	["Emerald Sanctuary"] = "Smaragdrefugium";
	["Evergrove"] = "Der ewige Hain";
	["Everlook"] = "Ewige Warte";
	["Eversong Woods"] = "Immersangwald";
	["Falcon Watch"] = "Falkenwacht";
	["Feathermoon Stronghold"] = "Mondfederfeste";
	["Felwood"] = "Teufelswald";
	["Feralas"] = "Feralas";
	["Flame Crest"] = "Flammenkamm";
	["Flight Path Maps"] = "Fluglinienkarten";
	["Forest Song"] = "Waldeslied";
	["Freewind Post"] = "Freiwindposten";
	["Gadgetzan"] = "Gadgetzan";
	["Garadar"] = "Garadar";
	["Ghostlands"] = "Geisterlande";
	["Grom'Gol Base Camp"] = "Basislager von Grom'gol";
	["Hammerfall"] = "Hammerfall";
	["Hatchet Hills"] = "Axthügel";
	["Hellfire Peninsula"] = "Höllenfeuerhalbinsel";
	["Hillsbrad Foothills"] = "Vorgebirge des Hügellands";
	["Honor Hold"] = "Ehrenfeste";
	["Horde"] = "Horde";
	["Ironforge"] = "Eisenschmiede";
	["Isle of Quel'Danas"] = "Insel von Quel'Danas";
	["Kalimdor"] = "Kalimdor";
	["Kargath"] = "Kargath";
	["Lakeshire"] = "Seenhain";
	["Light's Hope Chapel"] = "Kapelle des hoffnungsvollen Lichts";
	["Loch Modan"] = "Loch Modan";
	["Marshal's Refuge"] = "Marschalls Zuflucht";
	["Menethil Harbor"] = "Hafen von Menethil";
	["Mok'Nathal Village"] = "Dorf der Mok'Nathal";
	["Moonglade"] = "Mondlichtung";
	["Morgan's Vigil"] = "Morgans Wacht";
	["Mudsprocket"] = "Morastwinkel";
	["Mulgore"] = "Mulgore";
	["Nagrand"] = "Nagrand";
	["Nethergarde Keep"] = "Burg Nethergarde";
	["Netherstorm"] = "Nethersturm";
	["Nighthaven"] = "Nachthafen";
	["Nijel's Point"] = "Die Nijelspitze";
	["Orebor Harborage"] = "Oreborzuflucht";
	["Orgrimmar"] = "Orgrimmar";
	["Outland"] = "Scherbenwelt";
	["Ratchet"] = "Ratschet";
	["Rebel Camp"] = "Rebellenlager";
	["Redridge Mountains"] = "Rotkammgebirge";
	["Refuge Pointe"] = "Die Zuflucht";
	["Requires honored faction with Sha'tari Skyguard"] = "Benötigt wohlwollenden Ruf bei Himmelswache der Sha'tari";
	["Revantusk Village"] = "Dorf der Bruchhauer";
	["Rut'Theran Village"] = "Rut'theran";
	["Sanctum of the Stars"] = "Sanktum der Sterne";
	["Searing Gorge"] = "Sengende Schlucht";
	["Sentinel Hill"] = "Späherkuppe";
	["Shadowmoon Valley"] = "Schattenmondtal";
	["Shadowmoon Village"] = "Schattenmond";
	["Shadowprey Village"] = "Schattenflucht";
	["Shatter Point"] = "Trümmerposten";
	["Shattrath City"] = "Shattrath";
	["Silithus"] = "Silithus";
	["Silvermoon"] = "Silbermond";
	["Silverpine Forest"] = "Silberwald";
	["Skyguard Outpost"] = "Außenposten der Himmelswache";
	["South of the path along Lake Elune'ara"] = "Südlich des Elune'ara Seewegs";
	["Southshore"] = "Süderstade";
	["Spinebreaker Post"] = "Rückenbrecherposten";
	["Splintertree Post"] = "Splitterholzposten";
	["Stonard"] = "Steinard";
	["Stonebreaker Hold"] = "Steinbrecherfeste";
	["Stonetalon Mountains"] = "Steinkrallengebirge";
	["Stonetalon Peak"] = "Der Steinkrallengipfel";
	["Stormwind City"] = "Sturmwind";
	["Stranglethorn Vale"] = "Schlingendorntal";
	["Sun's Reach"] = "Sonnenweiten";
	["Sun Rock Retreat"] = "Sonnenfels";
	["Swamp of Sorrows"] = "Sümpfe des Elends";
	["Swamprat Post"] = "Sumpfrattenposten";
	["Sylvanaar"] = "Sylvanaar";
	["Talonbranch Glade"] = "Nachtlaublichtung";
	["Talrendis Point"] = "Talrendisspitze";
	["Tanaris"] = "Tanaris";
	["Tarren Mill"] = "Tarrens Mühle";
	["Telaar"] = "Telaar";
	["Teldrassil"] = "Teldrassil";
	["Telredor"] = "Telredor";
	["Temple of Telhamat"] = "Tempel von Telhamat";
	["Terokkar Forest"] = "Wälder von Terokkar";
	["Thalanaar"] = "Thalanaar";
	["The Aldor"] = "Die Aldor";
	["The Barrens"] = "Brachland";
	["The Dark Portal"] = "Das Dunkle Portal";
	["The Exodar"] = "Die Exodar";
	["The Hinterlands"] = "Hinterland";
	["The Scryers"] = "Die Seher";
	["The Sepulcher"] = "Das Grabmal";
	["The Stormspire"] = "Die Sturmsäule";
	["Thelsamar"] = "Thelsamar";
	["Theramore Isle"] = "Die Insel Theramore";
	["Thorium Point"] = "Thoriumspitze";
	["Thousand Needles"] = "Tausend Nadeln";
	["Thrallmar"] = "Thrallmar";
	["Thunder Bluff"] = "Donnerfels";
	["Thunderlord Stronghold"] = "Donnerfeste";
	["Tirisfal Glades"] = "Tirisfal";
	["Toshley's Station"] = "Toshleys Station";
	["Tranquillien"] = "Tristessa";
	["Un'Goro Crater"] = "Krater von Un'Goro";
	["Undercity"] = "Unterstadt";
	["Valormok"] = "Valormok";
	["West of the path to Timbermaw Hold"] = "Westlich des Weges zur Holzschlundfeste";
	["Western Plaguelands"] = "Westliche Pestländer";
	["Westfall"] = "Westfall";
	["Wetlands"] = "Sumpfland";
	["Wildhammer Stronghold"] = "Wildhammerfeste";
	["Winterspring"] = "Winterquell";
	["Zabra'jin"] = "Zabra'jin";
	["Zangarmarsh"] = "Zangarmarschen";
	["Zoram'gar Outpost"] = "Außenposten von Zoram'gar";

};

end