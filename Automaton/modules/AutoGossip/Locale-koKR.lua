local L = AceLibrary("AceLocale-2.2"):new("Automaton_Gossip")

L:RegisterTranslations("koKR", function() return {
	--------------
	-- Gossip Text
	--------------
	["<Touch the unstable rift crystal.>"] = "불안정한 균열의 수정을 건드립니다",
	["<Place my hand on the orb.>"] = "보주에 손을 얹습니다",
	--["Thank you, Stable Master. Please take the animal."] = true,
	--["With pleasure. These things stink!"] = true,
	--["Trick or Treat!"] = true,

	-------------
	-- Quest Text
	-------------
	-- Alterac Valley quests
	["Empty Stables"] = "빈 우리",
	["Ram Hide Harnesses"] = "산양 통가죽 고삐",
	["Alterac Ram Hide"] = "알터랙 산양 통가죽",
	["Ram Riding Harnesses"] = "산양 통가죽 고삐",
	["Frostwolf Hide"] = "서리늑대 통가죽",
	["More Booty!"] = "추가 전리품!",
	["More Armor Scraps"] = "방어구 조각",
	["Armor Scraps"] = "방어구 조각",
	["Coldtooth Supplies"] = "얼음이빨 광산 보급품",
	["Irondeep Supplies"] = "깊은무쇠 광산 보급품",
	["Lokholar the Ice Lord"] = "얼음군주 로크홀라",
	["Stormpike Soldier's Blood"] = "스톰파이크 병사의 피",
	["A Gallon of Blood"] = "한 사발의 피",
	["Ivus the Forest Lord"] = "숲군주 이부스",
	["Storm Crystal"] = "폭풍 수정",
	["Crystal Cluster"] = "폭풍 수정 묶음",
	["Call of Air - Slidore's Fleet"] = "바람의 부름 - 실도르의 편대",
	["Call of Air - Vipore's Fleet"] = "바람의 부름 - 비포르의 편대",
	["Call of Air - Ichman's Fleet"] = "바람의 부름 - 이크만의 편대",
	["Frostwolf Soldier's Medal"] = "서리늑대 병사의 견장",
	["Frostwolf Lieutenant's Medal"] = "서리늑대 부관의 견장",
	["Frostwolf Commander's Medal"] = "서리늑대 지휘관의 견장",
	["Call of Air - Guse's Fleet"] = "바람의 부름 - 구스의 편대",
	["Call of Air - Jeztor's Fleet"] = "바람의 부름 - 제즈톨의 편대",
	["Call of Air - Mulverick's Fleet"] = "바람의 부름 - 멀베릭의 편대",
	["Stormpike Soldier's Flesh"] = "스톰파이크 병사의 전투식량",
	["Stormpike Lieutenant's Flesh"] = "스톰파이크 부관의 전투식량",
	["Stormpike Commander's Flesh"] = "스톰파이크 지휘관의 전투식량",

	--Mark of Honor quests
	["For Great Honor"] = "커다란 영광을 위하여",
	["Concerted Efforts"] = "공동의 노력",
	["Conquering Arathi Basin"] = "아라시 분지 정복",
	["Claiming Arathi Basin"] = "아라시 분지 공격",
	["Invaders of Alterac Valley"] = "알터랙 계곡의 침략자",
	["Remember Alterac Valley!"] = "잊지 말자, 알터랙 계곡!",
	["Battle of Warsong Gulch"] = "전쟁노래 협곡 전투",
	["Fight for Warsong Gultch"] = "전쟁노래 협곡 전투",
	["Alterac Valley Mark of Honor"] = "알터랙 계곡 명예 훈장",
	["Arathi Basin Mark of Honor"] = "아라시 분지 명예 훈장",
	["Warsong Gulch Mark of Honor"] = "전쟁노래 협곡 명예 훈장",

	-- Felwood salves
	["Salve via Gathering"] = "약초채집을 통한 고약 확보",
	["Fel Creep"] = "지옥덩굴",
	["Salve via Mining"] = "채광을 통한 고약 확보",
	["Tainted Vitriol"] = "오염된 황산",
	["Salve via Skinning"] = "무두질을 통한 고약 확보",
	["Patch of Tainted Skin"] = "오염된 가죽 조각",
	["Salve via Hunting"] = "사냥을 통한 고약 확보",
	["Corrupted Soul Shard"] = "오염된 영혼의 조각",
	["Salve via Disenchanting"] = "마력 추출을 통한 고약 확보",
	["Lesser Nether Essence"] = "하급 황천의 정수",

	-- Felwood plants
	["Corrupted Whipper Root"] = "채찍뿌리 줄기",
	["Corrupted Songflower"] = "오염된 노래꽃",
	["Corrupted Windblossom"] = "오염된 바람꽃",
	["Corrupted Night Dragon"] = "어둠용의 숨결",
	["Cenarion Plant Salve"] = "세나리온 식물 고약",

	-- Thorium Shells -> Thorium Arrows Quest
	-- ["A Fair Trade"] = true,
	-- ["Thorium Shells"] = true,

	-- Ravenholdt
	["Syndicate Emblems"] = "비밀결사대 문장",
	["Syndicate Emblem"] = "비밀결사대 문장",

	-- Cenarion
	["Encrypted Twilight Texts"] = "암호화된 황혼의 문서",
	["Encrypted Twilight Text"] = "암호화된 황혼의 문서",

	-- Cenarion Expedition
	-- ["Identify Plant Parts"] = true,
	-- ["Unidentified Plant Parts"] = true,

	-- Argent Dawn
	["Minion's Scourgestones"] = "앞잡이의 스컬지석",
	["Minion's Scourgestone"] = "앞잡이의 스컬지석",
	["Invader's Scourgestones"] = "침입자의 스컬지석",
	["Invader's Scourgestone"] = "침입자의 스컬지석",
	["Corruptor's Scourgestones"] = "타락자의 스컬지석",
	["Corruptor's Scourgestone"] = "타락자의 스컬지석",

	-- Timbermaw
	--["Feathers for Grazle"] = true,
	["Feathers for Nafien"] = "나피엔을 위한 깃털",
	["Beads for Salfa"] = "살파에게 정기의 구슬 가져다주기",
	["Deadwood Headdress Feather"] = "마른가지일족 깃털 머리장식",
	["Winterfall Spirit Beads"] = "눈사태일족 정기의 구슬",

	-- Cauldron quests
	["Gahrron's Withering Cauldron"] = "가론의 흉가 가마솥",
	["Writhing Haunt Cauldron"] = "고통의 흉가 가마솥",
	["Felstone Field Cauldron"] = "펠스톤 농장",
	["Dalson's Tears Cauldron"] = "달슨의 눈물",
	["Arcane Quickener"] = "비전 촉매제",
	["Ectoplasmic Resonator"] = "심령 공명체",
	["Somatic Intensifier"] = "체세포 강화물질",
	["Osseous Agitator"] = "골성 교반기",

	-- Gadgetzan
	["Water Pouch Bounty"] = "물주머니 현상금",
	["Wastewander Water Pouch"] = "사막유랑단 물주머니",

	-- Thorium Brotherhood
	--["Gaining Acceptance"] = true,
	["Dark Iron Residue"] = "검은무쇠 잔류물",
	["Restoring Fiery Flux Supplies via Kingsblood"] = "불꽃 융해촉진제 보급품",
	["Kingsblood"] = "왕꽃잎풀",
	["Restoring Fiery Flux Supplies via Iron"] = "불꽃 융해촉진제 재고 재비축 - 철",
	["Iron Bar"] = "철 주괴",
	--["Restoring Fiery Flux Supplies via Heavy Leather"] = true,
	["Heavy Leather"] = "질긴 가죽",
	["Incendosaur Scale"] = "인센도사우루스 비늘",
	["Coal"] = "석탄",
	--["Favor Amongst the Brotherhood, Dark Iron Ore"] = true,
	["Dark Iron Ore"] = "검은무쇠 광석",
	--["Favor Amongst the Brotherhood, Blood of the Mountain"] = true,
	["Blood of the Mountain"] = "산의 피",
	--["Favor Amongst the Brotherhood, Core Leather"] = true,
	["Core Leather"] = "용암 가죽",
	--["Favor Amongst the Brotherhood, Fiery Core"] = true,
	["Fiery Core"] = "불꽃의 정수",
	--["Favor Amongst the Brotherhood, Lava Core"] = true,
	["Lava Core"] = "화산의 정수",

	-- City faction
	["Additional Runecloth"] = "룬무늬 옷감 추가 기부",
	["Runecloth"] = "룬무늬 옷감",

	-- Wildhammer faction
	["Troll Necklace Bounty"] = "트롤 목걸이 현상금",
	["Troll Tribal Necklace"] = "트롤 전통 목걸이",

	-- E'ko quests
	["Chillwind E'ko Item"] = "서리바람 키메라의 에코",
	["Chillwind E'ko Quest"] = "서리바람 키메라의 에코",
	["Frostmaul E'ko Item"] = "서리망치거인의 에코",
	["Frostmaul E'ko Quest"] = "서리망치거인의 에코",
	["Frostsaber E'ko Item"] = "눈호랑이의 에코",
	["Frostsaber E'ko Quest"] = "눈호랑이의 에코",
	["Ice Thistle E'ko Item"] = "얼음엉겅퀴설인의 에코",
	["Ice Thistle E'ko Quest"] = "얼음엉겅퀴설인의 에코",
	["Shardtooth E'ko Item"] = "톱니이빨곰의 에코",
	["Shardtooth E'ko Quest"] = "톱니이빨곰의 에코",
	["Wildkin E'ko Item"] = "올빼미야수의 에코",
	["Wildkin E'ko Quest"] = "올빼미야수의 에코",
	["Winterfall E'ko"] = "눈사태일족의 에코",

	-- Zul'Gurub quests
	["Zulian, Razzashi, and Hakkari Coins"] = "줄리안, 래즈자쉬, 학카리부족 주화",
	["Zulian Coin"] = "줄리안부족 주화",
	["Razzashi Coin"] = "래즈자쉬부족 주화",
	["Hakkari Coin"] = "학카리부족 주화",
	["Gurubashi, Vilebranch, and Witherbark Coins"] = "구루바시, 썩은가지, 마른나무껍질부�",
	["Gurubashi Coin"] = "구루바시부족 주화",
	["Vilebranch Coin"] = "썩은가지부족 주화",
	["Witherbark Coin"] = "마른나무껍질부족 주화",
	["Sandfury, Skullsplitter, and Bloodscalp Coins"] = "성난모래, 백골가루, 붉은머리부족 주",
	["Sandfury Coin"] = "성난모래부족 주화",
	["Skullsplitter Coin"] = "백골가루부족 주화",
	["Bloodscalp Coin"] = "붉은머리부족 주화",
	
} end )
