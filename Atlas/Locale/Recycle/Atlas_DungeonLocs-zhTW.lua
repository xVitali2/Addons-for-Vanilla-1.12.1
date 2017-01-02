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

if ( GetLocale() ==	"zhTW" ) then
AtlasDLLocale = {

	--Common
	["Battlegrounds"] = "戰場";
	["Blue"] = "藍";
	["Dungeon Locations"] = "地下城位置";
	["Instances"] = "副本";
	["White"] = "灰";

	--Places
	["Alterac Mountains"] = "奧特蘭克山山脈";
	["Alterac Valley"] = "奧特蘭克山谷";
	["Arathi Basin"] = "阿拉希盆地";
	["Arathi Highlands"] = "阿拉希高地";
	["Ashenvale"] = "梣谷";
	["Auchenai Crypts"] = "奧奇奈地穴";
	["Auchindoun"] = "奧齊頓";
	["Badlands"] = "荒蕪之地";
	["Black Temple"] = "黑暗神廟";
	["Blackfathom Deeps"] = "黑石深淵";
	["Blackrock Depths"] = "黑石深淵";
	["Blackrock Mountain"] = "黑石山";
	["Blackrock Spire"] = "黑石塔";
	["Blackwing Lair"] = "黑翼之巢";
	["Blade's Edge Mountains"] = "劍刃山脈";
	["Caverns of Time"] = "時光之穴";
	["Coilfang Reservoir"] = "盤牙蓄湖";
	["Deadwind Pass"] = "逆風小徑";
	["Desolace"] = "淒涼之地";
	["Dire Maul"] = "厄運之槌";
	["Dun Morogh"] = "丹莫洛";
	["Dustwallow Marsh"] = "塵泥沼澤 ";
	["Eastern Kingdoms"] = "東部王國";
	["Eastern Plaguelands"] = "東瘟疫之地";
	["Feralas"] = "菲拉斯";
	["Ghostlands"] = "鬼魂之地";
	["Gnomeregan"] = "諾姆瑞根";
	["Gruul's Lair"] = "戈魯爾之巢";
	["Hellfire Citadel"] = "地獄火堡壘";
	["Hellfire Peninsula"] = "地獄火半島";
	["Hellfire Ramparts"] = "地獄火壁壘 ";
	["Hillsbrad Foothills"] = "希爾斯布萊德丘陵";
	["Hyjal Summit"] = "海加爾山";
	["Isle of Quel'Danas"] = "奎爾達納斯之島";
	["Kalimdor"] = "卡林多";
	["Karazhan"] = "卡拉贊";
	["Magisters' Terrace"] = "博學者殿堂";
	["Magtheridon's Lair"] = "瑪瑟里頓的巢穴";
	["Mana-Tombs"] = "法力墓地";
	["Maraudon"] = "瑪拉頓";
	["Molten Core"] = "融火之心";
	["Naxxramas"] = "納克薩瑪斯";
	["Netherstorm"] = "虛空風暴";
	["Old Hillsbrad Foothills"] = "希爾斯布萊德丘陵舊址";
	["Onyxia's Lair"] = "奧妮克希亞的巢穴";
	["Orgrimmar"] = "奧格瑪";
	["Outland"] = "外域";
	["Ragefire Chasm"] = "怒焰裂谷";
	["Razorfen Downs"] = "剃刀高地";
	["Razorfen Kraul"] = "剃刀沼澤";
	["Ruins of Ahn'Qiraj"] = "安其拉廢墟";
	["Scarlet Monastery"] = "血色修道院";
	["Scholomance"] = "通靈學院";
	["Serpentshrine Cavern"] = "毒蛇神殿洞穴";
	["Sethekk Halls"] = "塞司克大廳";
	["Shadow Labyrinth"] = "暗影迷宮";
	["Shadowfang Keep"] = "影牙城堡";
	["Shadowmoon Valley"] = "影月谷";
	["Silithus"] = "希利蘇斯";
	["Silverpine Forest"] = "銀松森林";
	["Stormwind City"] = "暴風城";
	["Stranglethorn Vale"] = "荊棘谷";
	["Stratholme"] = "斯坦索姆";
	["Sunken Temple"] = "沈沒的神廟";
	["Sunwell Plateau"] = "太陽之井高地";
	["Swamp of Sorrows"] = "悲傷沼澤";
	["Tanaris"] = "塔納利斯";
	["Tempest Keep"] = "風暴要塞";
	["Temple of Ahn'Qiraj"] = "安其拉神廟";
	["Terokkar Forest"] = "泰洛卡森林";
	["The Arcatraz"] = "亞克崔茲";
	["The Barrens"] = "貧瘠之地";
	["The Black Morass"] = "黑色沼澤";
	["The Blood Furnace"] = "血熔爐";
	["The Botanica"] = "波塔尼卡";
	["The Deadmines"] = "死亡礦坑";
	["The Eye"] = "風暴之眼";
	["The Mechanar"] = "麥克那爾";
	["The Shattered Halls"] = "破碎大廳";
	["The Slave Pens"] = "奴隸監獄";
	["The Steamvault"] = "蒸汽洞窟";
	["The Stockade"] = "監獄";
	["The Underbog"] = "深幽泥沼";
	["Tirisfal Glades"] = "提里斯法林地";
	["Uldaman"] = "奧達曼";
	["Wailing Caverns"] = "哀嚎洞穴";
	["Warsong Gulch"] = "戰歌峽谷";
	["Western Plaguelands"] = "西瘟疫之地";
	["Westfall"] = "西部荒野";
	["Zangarmarsh"] = "贊格沼澤";
	["Zul'Aman"] = "祖阿曼";
	["Zul'Farrak"] = "祖爾法拉克";
	["Zul'Gurub"] = "祖爾格拉布";

};
end
