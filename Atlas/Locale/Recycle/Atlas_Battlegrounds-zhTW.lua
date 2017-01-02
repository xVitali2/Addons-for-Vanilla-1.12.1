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

AtlasBGLocale = {

	--Common
	["Alliance"] = "聯盟";
	["Battleground Maps"] = "戰場地圖";
	["Entrance"] = "入口";
	["Horde"] = "部落";
	["Neutral"] = "中立";
	["North"] = "北";
	["Orange"] = "橙";
	["Red"] = "紅";
	["Rep"] = "聲望";
	["Rescued"] = "營救";
	["South"] = "南";
	["Summon"] = "召喚";
	["White"] = "灰";

	--Places
	["Alterac Mountains"] = "奧特蘭克山脈";
	["Alterac Valley"] = "奧特蘭克山谷"; ["AV"] = "AV/奧山";
	["Arathi Basin"] = "阿拉希盆地"; ["AB"] = "AB/阿拉希";
	["Arathi Highlands"] = "阿拉希高地";
	["Ashenvale"] = "梣谷";
	["Eastern Kingdoms"] = "東部王國";
	["Eye of the Storm"] = "暴風之眼"; ["EotS"] = "EotS/暴風";
	["Hillsbrad Foothills"] = "希爾斯布萊德丘陵";
	["Kalimdor"] = "卡林多";
	["Netherstorm"] = "虛空風暴";
	["Outland"] = "外域";
	["The Barrens"] = "貧瘠之地";
	["Warsong Gulch"] = "戰歌峽谷"; ["WSG"] = "WSG/戰歌";

	--Alterac Valley (North)
	["Stormpike Guard"] = "雷矛衛隊";
	["Dun Baldar"] = "丹巴達爾";
	["Vanndar Stormpike <Stormpike General>"] = "范達爾·雷矛";
	["Dun Baldar North Marshal"] = "丹巴達爾北部元帥";
	["Dun Baldar South Marshal"] = "丹巴達爾南部元帥";
	["Icewing Marshal"] = "冰翼元帥";
	["Stonehearth Marshal"] = "石爐元帥";
	["Prospector Stonehewer"] = "勘察員塔雷·石鎬";
	["Irondeep Mine"] = "深鐵礦坑";
	["Morloch"] = "莫洛克";
	["Umi Thorson"] = "烏米·托爾森";
	["Keetar"] = "基塔爾";
	["Arch Druid Renferal"] = "大德魯伊雷弗拉爾";
	["Dun Baldar North Bunker"] = "丹巴達爾北部碉堡";
	["Wing Commander Mulverick"] = "空軍指揮官穆維里克";--omitted from AVS
	["Murgot Deepforge"] = "莫高特·深爐";
	["Dirk Swindle <Bounty Hunter>"] = "德爾克 <賞金獵人>";
	["Athramanis <Bounty Hunter>"] = "亞斯拉瑪尼斯 <賞金獵人>";
	["Lana Thunderbrew <Blacksmithing Supplies>"] = "蘭納·雷酒 <鐵匠補給>";
	["Stormpike Aid Station"] = "雷矛急救站";
	["Stormpike Stable Master <Stable Master>"] = "雷矛獸欄管理員";
	["Stormpike Ram Rider Commander"] = "雷矛山羊騎兵指揮官";
	["Svalbrad Farmountain <Trade Goods>"] = "斯瓦爾布萊德·遠山 <商品>";
	["Kurdrum Barleybeard <Reagents & Poison Supplies>"] = "庫德拉姆·麥鬚 <材料與藥水補給>";
	["Stormpike Quartermaster"] = "雷矛軍需官";
	["Jonivera Farmountain <General Goods>"] = "約尼維拉·遠山 <一般物品>";
	["Brogus Thunderbrew <Food & Drink>"] = "布羅古斯·雷酒 <食物和飲料>";
	["Wing Commander Ichman"] = "空軍指揮官艾克曼";--omitted from AVS
	["Wing Commander Slidore"] = "空軍指揮官斯里多爾";--omitted from AVS
	["Wing Commander Vipore"] = "空軍指揮官維波里";--omitted from AVS
	["Dun Baldar South Bunker"] = "丹巴達爾南部碉堡";
	["Corporal Noreg Stormpike"] = "諾雷格·雷矛下士";
	["Gaelden Hammersmith <Stormpike Supply Officer>"] = "蓋爾丁 <雷矛物資商人>";
	["Stormpike Graveyard"] = "雷矛墓地";
	["Icewing Cavern"] = "冰翼洞穴";
	["Stormpike Banner"] = "雷矛軍旗";
	["Stormpike Lumber Yard"] = "雷矛林場";
	["Wing Commander Jeztor"] = "空軍指揮官傑斯托";--omitted from AVS
	["Icewing Bunker"] = "冰翼碉堡";
	["Wing Commander Guse"] = "空軍指揮官古斯";--omitted from AVS
	["Stonehearth Graveyard"] = "石爐墓地";
	["Stormpike Ram Rider Commander"] = "雷矛山羊騎兵指揮官";
	["Stonehearth Outpost"] = "石爐哨站";
	["Captain Balinda Stonehearth <Stormpike Captain>"] = "巴琳達·石爐上尉";
	["Snowfall Graveyard"] = "落雪墓地";
	["Ichman's Beacon"] = "艾克曼的信號燈";
	["Mulverick's Beacon"] = "穆維里克的信號燈";
	["Stonehearth Bunker"] = "石爐碉堡";
	["Ivus the Forest Lord"] = "『森林之王』伊弗斯";
	["Western Crater"] = "西部凹地";
	["Vipore's Beacon"] = "維波里的信號燈";
	["Jeztor's Beacon"] = "傑斯托的信號燈";
	["Eastern Crater"] = "東部凹地";
	["Slidore's Beacon"] = "斯里多爾的信號燈";
	["Guse's Beacon"] = "古斯的信號燈";
	["Graveyards, Capturable Areas"] = "墓地, 可佔領的地區";--omitted from AVS
	["Bunkers, Towers, Destroyable Areas"] = "碉堡, 哨塔, 可摧毀的地區";--omitted from AVS
	["Assault NPCs, Quest Areas"] = "突擊 NPCs, 任務地區";--omitted from AVS

	--Alterac Valley (South)
	["Frostwolf Clan"] = "霜狼氏族";
	["Frostwolf Keep"] = "霜狼要塞";
	["Drek'Thar <Frostwolf General>"] = "德雷克塔爾";
	["Duros"] = "杜洛斯";
	["Drakan"] = "崔坎";
	["West Frostwolf Warmaster"] = "西部霜狼將領";
	["East Frostwolf Warmaster"] = "東部霜狼將領";
	["Tower Point Warmaster"] = "哨塔高地將領";
	["Iceblood Warmaster"] = "冰血將領";
	["Lokholar the Ice Lord"] = "『冰雪之王』洛克霍拉";
	["Iceblood Garrison"] = "冰血要塞";
	["Captain Galvangar <Frostwolf Captain>"] = "加爾范上尉";
	["Iceblood Tower"] = "冰血哨塔";
	["Iceblood Graveyard"] = "冰血墓地";
	["Tower Point"] = "哨塔高地";
	["Coldtooth Mine"] = "冷齒礦坑";
	["Taskmaster Snivvle"] = "監工斯尼維爾";
	["Masha Swiftcut"] = "瑪莎";
	["Aggi Rumblestomp"] = "埃其";
	["Frostwolf Graveyard"] = "霜狼墓地";
	["Jotek"] = "喬泰克";
	["Smith Regzar"] = "鐵匠雷格薩";
	["Primalist Thurloga"] = "原獵者瑟魯加";
	["Sergeant Yazra Bloodsnarl"] = "亞斯拉·血矛";
	["Frostwolf Stable Master <Stable Master>"] = "霜狼獸欄管理員";
	["Frostwolf Wolf Rider Commander"] = "霜狼騎兵指揮官";
	["Frostwolf Quartermaster"] = "霜狼軍需官";
	["West Frostwolf Tower"] = "西部霜狼哨塔";
	["East Frostwolf Tower"] = "東部霜狼哨塔";
	["Frostwolf Relief Hut"] = "霜狼急救站";
	["Wildpaw Cavern"] = "蠻爪洞穴";
	["Frostwolf Banner"] = "霜狼軍旗";

	--Arathi Basin
	["The Defilers"] = "污染者";
	["The League of Arathor"] = "阿拉索聯軍";
	["Trollbane Hall"] = "托爾貝恩大廳";
	["Defiler's Den"] = "污染者之穴";
	["Stables"] = "獸欄";
	["Gold Mine"] = "金礦";
	["Smithy"] = "鐵匠舖";
	["Lumber Mill"] = "伐木場";
	["Farm"] = "農場";

	--Warsong Gulch
	["Warsong Outriders"] = "戰歌偵察騎兵";
	["Silverwing Sentinels"] = "銀翼要塞的戰士";
	["Silverwing Hold"] = "銀翼要塞";
	["Warsong Lumber Mill"] = "戰歌伐木廠";

	--Eye of the Storm
	["Graveyard"] = "墓地";
	["Flag"] = "旗幟";
	["Mage Tower"] = "法師塔";
	["Draenei Ruins"] = "德萊尼廢墟";
	["Fel Reaver Ruins"] = "惡魔搶奪者廢墟";
	["Blood Elf Tower"] = "血精靈哨塔";

};
end
