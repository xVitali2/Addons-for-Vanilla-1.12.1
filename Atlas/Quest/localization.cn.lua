--[[

	AtlasQuest, a World of Warcraft addon.
	Email me at mystery8@gmail.com

	This file is part of AtlasQuest.

	AtlasQuest is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	AtlasQuest is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with AtlasQuest; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]


-- Localization for CTBC by yeachan(6区 阿拉希 “缘玥”公会 Ahunter）
-- Email：zhengguo@live.com
-- Rebuilt by Ananhaid（2区 伊利丹“紫雪之都”公会 NovaLOG）
-- Email：ananhaid[at]gmail.com
-- Last update: 2008-07-12

if ( GetLocale() == "zhCN" ) then
---------------
--- COLOURS ---
---------------

local GREY = "|cff999999";
local RED = "|cffff0000";
local REDA = "|cffcc6666";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff1eff00";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";
local YELLOW = "|cffFFd200";   -- Ingame Yellow


---------------
--- OPTIONS ---
---------------

AQHelpText = ""..WHITE.."命令格式为： /aq or atlasquest "..YELLOW.."[命令参数]"..WHITE.."\n命令参数有：help; option/config; show/hide; left/right; colour; autoshow"..RED.."（仅 Atlas）"
--
AQOptionsCaptionTEXT = "AtlasQuest 选项";
AQ_OK = "确定"

-- Autoshow
AQOptionsAutoshowTEXT = ""..WHITE.."伴随"..RED.."Atlas"..WHITE.."打开 AtlasQuest 面板。";
AQAtlasAutoON = "当你打开 Atlas 时，AtlasQuest 面板现在会自动显示"..GREEN.."（默认）"
AQAtlasAutoOFF = "当你打开 Atlas 时，AtlasQuest 面板"..RED.."不会"..WHITE.."自动显示"

-- Right/Left
AQOptionsLEFTTEXT = ""..WHITE.."AtlasQuest 面板显示位置在"..RED.."左"..WHITE..".";
AQOptionsRIGHTTEXT = ""..WHITE.."AtlasQuest 面板显示位置在"..RED.."右"..WHITE..".";
AQShowRight = "现在在"..RED.."右侧"..WHITE.."显示 AtlasQuest 面板";
AQShowLeft = "现在在"..RED.."左侧"..WHITE.."显示 AtlasQuest 面板"..GREEN.."（默认）";

-- Colour Check
AQOptionsCCTEXT = ""..WHITE.."根据任务等级显示任务颜色。"
AQCCON = "AtlasQuest 现在根据任务等级显示任务颜色。"
AQCCOFF = "AtlasQuest 现在不根据任务等级显示任务颜色。"

-- QuestLog Colour Check
AQQLColourChange = ""..WHITE.."将你任务日志里有的的任务染成"..BLUE.."蓝色。"

-- AutoQuery Quest Rewards
AQOptionsAutoQueryTEXT = ""..WHITE.."在服务器中自动搜索任务奖励中你未见过的物品。"

-- Suppress Server Query text
AQOptionsNoQuerySpamTEXT = ""..WHITE.."禁用服务器自动搜索。"

-- Use Comparison Tooltips
AQOptionsCompareTooltipTEXT = ""..WHITE.."将任务奖励物品与你自身装备物品进行比较。"


AQAbilities = BLUE .. "功能：" .. WHITE;
AQSERVERASKInformation = " 按右键察看物品窗口。"
AQSERVERASKAuto = " 尝试鼠标指向物品时搜寻。"
AQSERVERASK = "在服务器上搜寻："
AQERRORNOTSHOWN = "此物品不安全！"
AQERRORASKSERVER = "要按右键在服务器上查询吗？你可能会掉线。"
AQOptionB = "选项"
AQStoryB = "副本背景"
AQNoReward = ""..BLUE.." 没有奖励物品"
AQDiscription_OR = ""..GREY.." 或 "..WHITE..""
AQDiscription_AND = ""..GREY.." 和 "..WHITE..""
AQDiscription_REWARD = ""..BLUE.." 任务奖励："
AQDiscription_ATTAIN = "任务可接受等级："
AQDiscription_LEVEL = "任务等级："
AQDiscription_START = "开始地点：\n"
AQDiscription_AIM = "任务目标：\n"
AQDiscription_NOTE = "任务注释：\n"
AQDiscription_PREQUEST= "前导任务："
AQDiscription_FOLGEQUEST = "后续任务："
AQFinishedTEXT = "已完成的任务：";


------------------
--- ITEM TYPES ---
------------------

AQITEM_DAGGER = "匕首"
AQITEM_POLEARM = "长柄武器"
AQITEM_SWORD = "剑"
AQITEM_AXE = "斧"
AQITEM_WAND = "魔杖"
AQITEM_STAFF = "法杖"
AQITEM_MACE = "锤"
AQITEM_SHIELD = "盾"
AQITEM_GUN = "枪"
AQITEM_BOW = "弓"
AQITEM_CROSSBOW = "弩"
AQITEM_THROWN = "投掷武器"

AQITEM_WAIST = "腰带"
AQITEM_SHOULDER = "肩"
AQITEM_CHEST = "胸甲"
AQITEM_LEGS = "腿"
AQITEM_HANDS = "手"
AQITEM_FEET = "脚"
AQITEM_WRIST = "护腕"
AQITEM_HEAD = "头盔"
AQITEM_BACK = "背部"
AQITEM_TABARD = "衬衣"

AQITEM_CLOTH = "布甲"
AQITEM_LEATHER = "皮甲"
AQITEM_MAIL = "锁甲"
AQITEM_PLATE = "板甲"

AQITEM_OFFHAND = "副手"
AQITEM_MAINHAND = "主手"
AQITEM_ONEHAND = "单手"
AQITEM_TWOHAND = "双手"

AQITEM_ITEM = "物品"
AQITEM_TRINKET = "饰品"
AQITEM_RELIC = "圣物"
AQITEM_POTION = "药水"
AQITEM_OFFHAND = "副手物品"
AQITEM_NECK = "颈部"
AQITEM_PATTERN = "图样"
AQITEM_BAG = "背包"
AQITEM_RING = "戒指"
AQITEM_KEY = "钥匙"
AQITEM_GEM = "宝石"
AQITEM_QUIVER = "箭袋"
AQITEM_AMMOPOUCH = "弹药包"
AQITEM_ENCHANT = "附魔"



----------------------------------------------
---------------- DUNGEONS --------------------
----------------------------------------------



--------------- INST1 - Deadmines (VC) ---------------

Inst1Story = "这里曾经是人类最主要的产金地，希望矿井在部落第一次大战期间席卷暴风城的时候被废弃。现在迪菲亚兄弟会的人占据了那里并将这个黑暗的通道转变成他们的避难所。据说那些盗贼已经劝说了聪明的地精帮助他们在矿井的深处建造一些可怕的东西——但是没有人知道这是真的还是假的。有传言说，死亡矿井的入口在安宁的月溪镇中。"
Inst1Caption = "死亡矿井"
Inst1QAA = "7 个任务" -- how many quests for alliance
Inst1QAH = "无任务" -- for horde

--Quest 1 Alliance
Inst1Quest1 = "1. 红色丝质面罩"
Inst1Quest1_Level = "17"
Inst1Quest1_Attain = "14"
Inst1Quest1_Aim = "给哨兵岭哨塔的哨兵瑞尔带回10条红色丝质面罩。"
Inst1Quest1_Location = "哨兵瑞尔（西部荒野 - 哨兵岭; "..YELLOW.."56, 47"..WHITE.."）"
Inst1Quest1_Note = "你可以在副本内外的矿工身上找到红色丝质面罩。当你完成护送迪菲亚叛徒任务后才能接到这个任务。"
Inst1Quest1_Prequest = "有，（请见注释）"
Inst1Quest1_Folgequest = "无"
Inst1Quest1PreQuest = "true"
--
Inst1Quest1name1 = "结实的短剑"
Inst1Quest1name2 = "贝雕匕首"
Inst1Quest1name3 = "破甲之斧"

--Quest 2 Alliance
Inst1Quest2 = "2. 收集记忆"
Inst1Quest2_Level = "18"
Inst1Quest2_Attain = "14"
Inst1Quest2_Aim = "给暴风城的维尔德·蓟草带回4张矿业工会会员卡。"
Inst1Quest2_Location = "维尔德·蓟草（暴风城 - 矮人区; "..YELLOW.."65, 21"..WHITE.."）"
Inst1Quest2_Note = "就在你刚要进入副本之前的亡灵"..YELLOW.."副本入口地图[3]"..WHITE.."掉落矿工工会会员卡。"
Inst1Quest2_Prequest = "无"
Inst1Quest2_Folgequest = "无"
--
Inst1Quest2name1 = "掘地工之靴"
Inst1Quest2name2 = "陈旧的矿工手套"

--Quest 3 Alliance
Inst1Quest3 = "3. 我的兄弟……"
Inst1Quest3_Level = "20"
Inst1Quest3_Attain = "15"
Inst1Quest3_Aim = "将工头希斯耐特的探险者协会徽章交给暴风城的维尔德·蓟草。"
Inst1Quest3_Location = "维尔德·蓟草（暴风城 - 矮人区; "..YELLOW.."65,21"..WHITE.."）"
Inst1Quest3_Note = "就在你刚要进入副本之前的工头希斯奈特"..YELLOW.."副本入口地图[3]"..WHITE.."掉落矿探险者协会徽章。"
Inst1Quest3_Prequest = "无"
Inst1Quest3_Folgequest = "无"
--
Inst1Quest3name1 = "矿工的报复"

--Quest 4 Alliance
Inst1Quest4 = "4. 地底突袭"
Inst1Quest4_Level = "20"
Inst1Quest4_Attain = "15"
Inst1Quest4_Aim = "从死亡矿井中带回小型高能发动机，将其带给暴风城矮人区中的沉默的舒尼。"
Inst1Quest4_Location = "沉默的舒尼（暴风城 - 矮人区; "..YELLOW.."55,12"..WHITE.."）"
Inst1Quest4_Note = "你可以直接接到这个任务，你也可以从诺恩那里接到此任务的引导任务（铁炉堡 - 侏儒区; "..YELLOW.."69,50"..WHITE.."）。\n斯尼德的伐木机掉落小型高能发动机，位置在"..YELLOW.."[3]"..WHITE.."。"
Inst1Quest4_Prequest = "有，沉默的舒尼"
Inst1Quest4_Folgequest = "无"
Inst1Quest4PreQuest = "true"
--
Inst1Quest4name1 = "极地护手"
Inst1Quest4name2 = "紫貂魔杖"

--Quest 5 Alliance
Inst1Quest5 = "5. 迪菲亚兄弟会（系列任务）"
Inst1Quest5_Level = "22"
Inst1Quest5_Attain = "14"
Inst1Quest5_Aim = "杀死艾德温·范克里夫，把他的头交给格里安·斯托曼。"
Inst1Quest5_Location = "格里安·斯托曼（西部荒野 - 哨兵岭 "..YELLOW.."56,47 "..WHITE.."）"
Inst1Quest5_Note = "此系列任务开始于格里安·斯托曼（西部荒野 - 哨兵岭; "..YELLOW.."56,47"..WHITE.."）。\n艾德温·范克里夫是死亡矿井的最后一个 Boss。你可以在他的船的最上层找到他，位置在"..YELLOW.."[6]"..WHITE.."。"
Inst1Quest5_Prequest = "有，迪菲亚兄弟会"
Inst1Quest5_Folgequest = "有，未寄出的信"
Inst1Quest5PreQuest = "true"
--
Inst1Quest5name1 = "西部荒野马裤"
Inst1Quest5name2 = "西部荒野外套"
Inst1Quest5name3 = "西部荒野法杖"

--Quest 6 Alliance
Inst1Quest6 = "6. 正义试炼（圣骑士任务）"
Inst1Quest6_Level = "22"
Inst1Quest6_Attain = "20"
Inst1Quest6_Aim = "按照乔丹的武器材料单上的说明去寻找一些白石橡木、精炼矿石、乔丹的铁锤和一块科尔宝石，然后回到铁炉堡去见乔丹·斯迪威尔。"
Inst1Quest6_Location = "乔丹·斯迪威尔（丹莫罗 - 铁炉堡 "..YELLOW.."52,36 "..WHITE.."）"
Inst1Quest6_Note = "点击"..YELLOW.."[乔丹的武器材料单]"..WHITE.."查看乔丹的武器材料单。"
Inst1Quest6_Page = {2, "只有圣骑士们才能接到这个任务！\n\n1. 你可以从"..YELLOW.."[死亡矿井]"..WHITE.."地精木匠"..YELLOW.."[3]"..WHITE.."那儿得到白石橡木。\n\n2. 要得到精炼矿石，你必须先与白洛尔·石手交谈（洛克莫丹 - 塞尔萨玛; "..YELLOW.."35,44"..WHITE.."）。他会给你《白洛尔的矿石》任务。 你在一棵树后面找到乔丹的矿石"..YELLOW.."71,21"..WHITE.."。\n\n3. 你可以在"..YELLOW.."[影牙城堡]"..WHITE.."紧靠"..YELLOW.."[3]"..WHITE.."的地方找到乔丹的铁锤（安全地点）。\n\n4. 要得到科尔宝石，你必须去找桑迪斯·织风（黑海岸 - 奥伯丁; "..YELLOW.."37,40"..WHITE.."）并且做完《寻找科尔宝石》任务。为了完成这个任务，你必须杀掉"..YELLOW.."[黑暗深渊]"..WHITE.."前的黑暗深渊智者或者黑暗深渊海潮祭司。他们会掉落被污染的科尔宝石。桑迪斯·织风会为你清洁它的。", };
Inst1Quest6_Prequest = "有，勇气之书 > 正义试炼"
Inst1Quest6_Folgequest = "有，正义试炼"
Inst1Quest6PreQuest = "true"
--
Inst1Quest6name1 = "维里甘之拳 "

--Quest 7 Alliance
Inst1Quest7 = "7. 未寄出的信"
Inst1Quest7_Level = "22"
Inst1Quest7_Attain = "16"
Inst1Quest7_Aim = "搜查艾德温·范克里夫的尸体时，你从一堆杂乱的物品中找到了一封还未来得及发出的信。地址一栏上写着巴隆斯·阿历克斯顿，暴风城石工协会，城市大厅，教堂广场。"
Inst1Quest7_Location = "未寄出的信（范克里夫掉落 "..YELLOW.."[6]"..WHITE.."）"
Inst1Quest7_Note = "巴隆斯·阿历克斯顿在暴风城光明大教堂旁边"..YELLOW.."49,30"..WHITE.."。"
Inst1Quest7_Prequest = "无"
Inst1Quest7_Folgequest = "有，巴基尔·斯瑞德"
-- No Rewards for this quest



--------------- INST2 - Wailing Caverns (WC) ---------------

Inst2Story = "最近一个名叫纳拉雷克斯的暗夜精灵德鲁伊在贫瘠之地中的地下发现了一个错综复杂的洞穴网。这个被称作“哀嚎洞穴”的地方有很多的蒸汽缝隙，所以当蒸气喷射的时候发出的声音就犹如哀嚎一般，其因此而得名。纳拉雷克斯可以利用洞穴中的温泉来恢复贫瘠之地的生态，让这里重新获得生机——但是这样做需要吸收传说中的翡翠梦境的能量。一旦和翡翠梦境相连接，德鲁伊的视线中就变成了一场噩梦。不久之后，哀嚎洞穴开始变化——洞中的水开始腐化——曾经温顺的生物开始变成狂暴，致命的捕食者。据说纳拉雷克斯自己还居住在这个迷宫的最深处，他被翡翠梦境的边缘所困扰着。即使他以前的随从也被他们的主人所经历的噩梦所腐化——他们都变成了邪恶的尖牙德鲁伊。"
Inst2Caption = "哀嚎洞穴"
Inst2QAA = "5 个任务"
Inst2QAH = "7 个任务"

--Quest 1 Alliance
Inst2Quest1 = "1. 变异皮革"
Inst2Quest1_Level = "17"
Inst2Quest1_Attain = "13"
Inst2Quest1_Aim = "哀嚎洞穴的纳尔帕克想要20张变异皮革。"
Inst2Quest1_Location = "纳尔帕克（贫瘠之地 - 哀嚎洞穴; "..YELLOW.."47,36 "..WHITE.."）"
Inst2Quest1_Note = "每个副本前面或里面的变异的怪都可能掉落变异皮革。纳尔帕克在入口上方的山顶洞穴里。"
Inst2Quest1_Prequest = "无"
Inst2Quest1_Folgequest = "无"
--
Inst2Quest1name1 = "光滑的蛇鳞护腿"
Inst2Quest1name2 = "变异皮包"

--Quest 2 Alliance
Inst2Quest2 = "2. 港口的麻烦"
Inst2Quest2_Level = "18"
Inst2Quest2_Attain = "14"
Inst2Quest2_Aim = "棘齿城的起重机操作员比戈弗兹让你从疯狂的马格利什那儿取回一瓶99年波尔多陈酿，疯狂的马格利什就藏在哀嚎洞穴里。"
Inst2Quest2_Location = "起重机操作员比戈弗兹（贫瘠之地 - 棘齿城; "..YELLOW.."63,37 "..WHITE.."）"
Inst2Quest2_Note = "你进入副本杀死疯狂的马格利什，拿到酒瓶。当你进入洞穴后向右转，他就在一个凹进去的洞里"..YELLOW.."副本入口地图[2]"..WHITE.."。"
Inst2Quest2_Prequest = "无"
Inst2Quest2_Folgequest = "无"
-- No Rewards for this quest

--Quest 3 Alliance
Inst2Quest3 = "3. 智慧饮料"
Inst2Quest3_Level = "18"
Inst2Quest3_Attain = "14"
Inst2Quest3_Aim = "收集6份哀嚎香精，把它们交给棘齿城的麦伯克·米希瑞克斯。"
Inst2Quest3_Location = "麦伯克·米希瑞克斯（贫瘠之地 - 棘齿城; "..YELLOW.."62,37 "..WHITE.."）"
Inst2Quest3_Note = "此任务的前导任务也是在麦伯克·米希瑞克斯这儿接到的。\n软浆怪掉落香精。"
Inst2Quest3_Prequest = "有，迅猛龙角"
Inst2Quest3_Folgequest = "无"
Inst2Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst2Quest4 = "4. 清除变异者"
Inst2Quest4_Level = "21"
Inst2Quest4_Attain = "15"
Inst2Quest4_Aim = "哀嚎洞穴的厄布鲁要求你杀掉7只变异破坏者、7只剧毒飞蛇、7只变异蹒跚者和7只变异尖牙风蛇。"
Inst2Quest4_Location = "厄布鲁（贫瘠之地 - 哀嚎洞穴; "..YELLOW.."47,36 "..WHITE.."）"
Inst2Quest4_Note = "厄布鲁在入口上方山顶的洞穴里。"
Inst2Quest4_Prequest = "无"
Inst2Quest4_Folgequest = "无"
--
Inst2Quest4name1 = "图样：蛇鳞腰带"
Inst2Quest4name2 = "烧灼之棒"
Inst2Quest4name3 = "达格米尔护手   "

--Quest 5 Alliance
Inst2Quest5 = "5. 发光的碎片"
Inst2Quest5_Level = "25"
Inst2Quest5_Attain = "21"
Inst2Quest5_Aim = "去棘齿城寻找更多有关这块噩梦碎片的信息。"
Inst2Quest5_Location = "发光的碎片（掉落）（哀嚎洞穴"..YELLOW.."[9]"..WHITE.."）"
Inst2Quest5_Note = "当你杀死了最后的 Boss 吞噬者穆坦努斯后，你就会得到发光的碎片。而只有当你杀死了4个德鲁伊，并完成护送德鲁伊任务后，吞噬者穆坦努斯才会出现。\n当你拿到碎片后，你必须把它带回棘齿城，然后返回哀嚎洞穴外面山顶找到菲拉·古风。注意：去棘齿城找个地精说话，（就是做《什么什么平衡器》那个任务的地精），他头上是没有问号的，要自己去点他。"
Inst2Quest5_Prequest = "无"
Inst2Quest5_Folgequest = "有，在噩梦中"
--
Inst2Quest5name1 = "塔巴尔护肩   "
Inst2Quest5name2 = "泥潭沼泽长靴"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst2Quest1_HORDE = Inst2Quest1
Inst2Quest1_HORDE_Level = Inst2Quest1_Level
Inst2Quest1_HORDE_Attain = Inst2Quest1_Attain
Inst2Quest1_HORDE_Aim = Inst2Quest1_Aim
Inst2Quest1_HORDE_Location = Inst2Quest1_Location
Inst2Quest1_HORDE_Note = Inst2Quest1_Note
Inst2Quest1_HORDE_Prequest = Inst2Quest1_Prequest
Inst2Quest1_HORDE_Folgequest = Inst2Quest1_Folgequest
--
Inst2Quest1name1_HORDE = Inst2Quest1name1
Inst2Quest1name2_HORDE = Inst2Quest1name2

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst2Quest2_HORDE = Inst2Quest2
Inst2Quest2_HORDE_Level = Inst2Quest2_Level
Inst2Quest2_HORDE_Attain = Inst2Quest2_Attain
Inst2Quest2_HORDE_Aim = Inst2Quest2_Aim
Inst2Quest2_HORDE_Location = Inst2Quest2_Location
Inst2Quest2_HORDE_Note = Inst2Quest2_Note
Inst2Quest2_HORDE_Prequest = Inst2Quest2_Prequest
Inst2Quest2_HORDE_Folgequest = Inst2Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde
Inst2Quest3_HORDE = "3. 毒蛇花"
Inst2Quest3_HORDE_Level = "18"
Inst2Quest3_HORDE_Attain = "14"
Inst2Quest3_HORDE_Aim = "为雷霆崖的药剂师扎玛收集10朵毒蛇花。"
Inst2Quest3_HORDE_Location = "药剂师扎玛（雷霆崖 -灵魂高地; "..YELLOW.."22,20 "..WHITE.."）"
Inst2Quest3_HORDE_Note = "你可以在药剂师赫布瑞姆处领取前导任务（贫瘠之地 - 十字路口; "..YELLOW.."51,30"..WHITE.."）。\n你可以在山洞里副本前或副本内采到毒蛇花。学习草药学的玩家打开寻找草药技能就可以在自己的小地图上看到毒蛇花的位置。"
Inst2Quest3_HORDE_Prequest = "有，菌类孢子 -> 药剂师扎玛"
Inst2Quest3_HORDE_Folgequest = "无"
Inst2Quest3PreQuest_HORDE = "true"
--
Inst2Quest3name1_HORDE = "药剂师手套"

--Quest 4 Horde  (same as Quest 3 Alliance)
Inst2Quest4_HORDE = "4. 智慧饮料"
Inst2Quest4_HORDE_Level = Inst2Quest3_Level
Inst2Quest4_HORDE_Attain = Inst2Quest3_Attain
Inst2Quest4_HORDE_Aim = Inst2Quest3_Aim
Inst2Quest4_HORDE_Location = Inst2Quest3_Location
Inst2Quest4_HORDE_Note = Inst2Quest3_Note
Inst2Quest4_HORDE_Prequest = Inst2Quest3_Prequest
Inst2Quest4_HORDE_Folgequest = Inst2Quest3_Folgequest
Inst2Quest4PreQuest_HORDE = Inst2Quest3PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 4 Alliance)
Inst2Quest5_HORDE = "5. 清除变异者"
Inst2Quest5_HORDE_Level = Inst2Quest4_Level
Inst2Quest5_HORDE_Attain = Inst2Quest4_Attain
Inst2Quest5_HORDE_Aim = Inst2Quest4_Aim
Inst2Quest5_HORDE_Location = Inst2Quest4_Location
Inst2Quest5_HORDE_Note = Inst2Quest4_Note
Inst2Quest5_HORDE_Prequest = Inst2Quest4_Prequest
Inst2Quest5_HORDE_Folgequest = Inst2Quest4_Folgequest
--
Inst2Quest5name1_HORDE = Inst2Quest4name1
Inst2Quest5name2_HORDE = Inst2Quest4name2
Inst2Quest5name3_HORDE = Inst2Quest4name3

--Quest 6 Horde
Inst2Quest6_HORDE = "6. 尖牙德鲁伊（连续任务）"
Inst2Quest6_HORDE_Level = "22"
Inst2Quest6_HORDE_Attain = "18"
Inst2Quest6_HORDE_Aim = "将考布莱恩宝石、安娜科德拉宝石、皮萨斯宝石和瑟芬迪斯宝石交给雷霆崖的纳拉·蛮鬃。"
Inst2Quest6_HORDE_Location = "纳拉·蛮鬃（雷霆崖; "..YELLOW.."75,31 "..WHITE.."）"
Inst2Quest6_HORDE_Note = "系列任务始于哈缪尔·符文图腾（雷霆崖 - 长者高地; "..YELLOW.."78,28"..WHITE.."）\n掉落宝石的4个德鲁伊位于"..YELLOW.."[2]"..WHITE..", "..YELLOW.."[3]"..WHITE..", "..YELLOW.."[5]"..WHITE..", "..YELLOW.."[7]"..WHITE.."。"
Inst2Quest6_HORDE_Prequest = "有，哈缪尔·符文图腾 > 纳拉·蛮鬃 > 尖牙德鲁伊"
Inst2Quest6_HORDE_Folgequest = "无"
Inst2Quest6PreQuest_HORDE = "true"
--
Inst2Quest6name1_HORDE = "新月法杖"
Inst2Quest6name2_HORDE = "翼刃"

--Quest 7 Horde  (same as Quest 5 Alliance)
Inst2Quest7_HORDE = "7. 发光的碎片"
Inst2Quest7_HORDE_Level = Inst2Quest5_Level
Inst2Quest7_HORDE_Attain = Inst2Quest5_Attain
Inst2Quest7_HORDE_Aim = Inst2Quest5_Aim
Inst2Quest7_HORDE_Location = Inst2Quest5_Location
Inst2Quest7_HORDE_Note = Inst2Quest5_Note
Inst2Quest7_HORDE_Prequest = Inst2Quest5_Prequest
Inst2Quest7_HORDE_Folgequest = Inst2Quest5_Folgequest
--
Inst2Quest7name1_HORDE = Inst2Quest5name1
Inst2Quest7name2_HORDE = Inst2Quest5name2



--------------- INST3 - Ragefire Chasm (RFC) ---------------

Inst3Story = "怒焰裂谷是一个错综复杂的火焰洞穴，它位于兽人的新都城奥格瑞玛中。最近，有传言说一批崇拜恶魔阴影教的信徒占据了怒焰裂谷。这个被称为火刃的组织对杜隆塔尔的安全。许多人认为兽人的酋长萨尔已经意识到了火刃的存在并不打算摧毁他们，因为萨尔希望能够将他引到阴影议会那里。不管怎么样，黑暗的力量从怒焰裂谷散发出来，它们可能毁了兽人所有的一切。"
Inst3Caption = "怒焰裂谷"
Inst3QAA = "无任务"
Inst3QAH = "5 个任务"

--Quest 1 Horde
Inst3Quest1_HORDE = "1. 试探敌人"
Inst3Quest1_HORDE_Level = "15"
Inst3Quest1_HORDE_Attain = "9"
Inst3Quest1_HORDE_Aim = "在奥格瑞玛找到怒焰裂谷，杀掉8个怒焰穴居人和8个怒焰萨满祭司，然后向雷霆崖的拉哈罗复命。"
Inst3Quest1_HORDE_Location = "拉哈罗（雷霆崖 - 长者高地; "..YELLOW.."70,29 "..WHITE.."）"
Inst3Quest1_HORDE_Note = "你一开始就能找到穴居人。"
Inst3Quest1_HORDE_Prequest = "无"
Inst3Quest1_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 2 Horde
Inst3Quest2_HORDE = "2. 毁灭之力"
Inst3Quest2_HORDE_Level = "16"
Inst3Quest2_HORDE_Attain = "9"
Inst3Quest2_HORDE_Aim = "将《暗影法术研究》和《扭曲虚空的魔法》这两本书交给幽暗城的瓦里玛萨斯。"
Inst3Quest2_HORDE_Location = "瓦里玛萨斯（幽暗城 - 皇家区; "..YELLOW.."56,92 "..WHITE.."）"
Inst3Quest2_HORDE_Note = "燃刃信徒和燃刃术士掉落这两本书。"
Inst3Quest2_HORDE_Prequest = "无"
Inst3Quest2_HORDE_Folgequest = "无"
--
Inst3Quest2name1_HORDE = "苍白长裤"
Inst3Quest2name2_HORDE = "泥泞护腿"
Inst3Quest2name3_HORDE = "石像鬼护腿"

--Quest 3 Horde
Inst3Quest3_HORDE = "3. 寻找背包"
Inst3Quest3_HORDE_Level = "16"
Inst3Quest3_HORDE_Attain = "9"
Inst3Quest3_HORDE_Aim = "在怒焰裂谷搜寻玛尔·恐怖图腾的尸体以及他留下的东西。"
Inst3Quest3_HORDE_Location = "拉哈罗（雷霆崖 - 长者高地; "..YELLOW.."70,29 "..WHITE.."）"
Inst3Quest3_HORDE_Note = "你会在"..YELLOW.."[1]"..WHITE.."发现玛尔·恐怖图腾。得到背包后你需要把它交回给雷霆崖的拉哈罗。"
Inst3Quest3_HORDE_Prequest = "无"
Inst3Quest3_HORDE_Folgequest = "有，归还背包"
--
Inst3Quest3name1_HORDE = "羽珠护腕"
Inst3Quest3name2_HORDE = "草原狮护腕"

--Quest 4 Horde
Inst3Quest4_HORDE = "4. 隐藏的敌人"
Inst3Quest4_HORDE_Level = "16"
Inst3Quest4_HORDE_Attain = "9"
Inst3Quest4_HORDE_Aim = "杀死巴扎兰和祈求者耶戈什，然后返回奥格瑞玛见萨尔。"
Inst3Quest4_HORDE_Location = "萨尔（奥格瑞玛 - 智慧谷; "..YELLOW.."31,37 "..WHITE.."）"
Inst3Quest4_HORDE_Note = "你会在"..YELLOW.."[4]"..WHITE.."发现巴扎兰，在"..YELLOW.."[3]"..WHITE.."发现祈求者耶戈什。"
Inst3Quest4_HORDE_Prequest = "有，隐藏的敌人"
Inst3Quest4_HORDE_Folgequest = "有，隐藏的敌人"
Inst3Quest4PreQuest_HORDE = "true"
--
Inst3Quest4name1_HORDE = "奥格瑞玛之剑"
Inst3Quest4name2_HORDE = "奥格瑞玛之锤"
Inst3Quest4name3_HORDE = "奥格瑞玛之斧"
Inst3Quest4name4_HORDE = "奥格瑞玛法杖"

--Quest 5 Horde
Inst3Quest5_HORDE = "5. 饥饿者塔拉加曼"
Inst3Quest5_HORDE_Level = "16"
Inst3Quest5_HORDE_Attain = "9"
Inst3Quest5_HORDE_Aim = "进入怒焰裂谷，杀死饥饿者塔拉加曼，然后把他的心脏交给奥格瑞玛的尼尔鲁·火刃。"
Inst3Quest5_HORDE_Location = "尼尔鲁·火刃（奥格瑞玛 - 暗影裂口; "..YELLOW.."49,50 "..WHITE.."）"
Inst3Quest5_HORDE_Note = "你会在"..YELLOW.."[2]"..WHITE.."找到塔拉加曼。"
Inst3Quest5_HORDE_Prequest = "无"
Inst3Quest5_HORDE_Folgequest = "无"
-- No Rewards for this quest



--------------- INST4 - Uldaman (Ulda) ---------------

Inst4Story = "奥达曼是古代泰坦创世之时所留下的深埋于地下的城市。矮人探险队最近发觉到了这块被遗忘的城市，将泰坦一款失败的创造物：食腭怪唤醒了。传说说泰坦是从石头中创造了食腭怪。当实施证明这次试验很失败的时候，泰坦把食腭怪锁了起来并进行了第二次的尝试——最终创造了矮人这个种族。矮人创造的秘密被记录在精密的白金圆盘中——那是位于古代城市最底部的大型泰坦遗迹。最近，黑铁矮人在奥达曼进行了一系列的侵入活动，希望为他们的火焰之主拉格纳罗斯获得圆盘。然而，在这个地下城市中，有一些巨大的石头守卫会攻击任何入侵者。而白金圆盘是由一名巨大的石头守卫阿扎达斯。有传言说矮人的一些石头皮肤的祖先，土灵还居住在城市的隐蔽之处。"
Inst4Caption = "奥达曼"
Inst4QAA = "16 个任务"
Inst4QAH = "10 个任务"

--Quest 1 Alliance
Inst4Quest1 = "1. 一线希望"
Inst4Quest1_Level = "35"
Inst4Quest1_Attain = "35"
Inst4Quest1_Aim = "在奥达曼找到铁趾格雷兹。"
Inst4Quest1_Location = "勘察员雷杜尔（荒芜之地; "..YELLOW.."53,43 "..WHITE.."）"
Inst4Quest1_Note = "前导任务始于弄皱的地图（荒芜之地; "..YELLOW.."53,33"..WHITE.."）。\n你可以在进入"..YELLOW.."副本入口地图[1]"..WHITE.."找到铁趾格雷兹。"
Inst4Quest1_Prequest = "有，一线希望"
Inst4Quest1_Folgequest = "有，铁趾的护符"
Inst4Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst4Quest2 = "2. 铁趾的护符"
Inst4Quest2_Level = "40"
Inst4Quest2_Attain = "36"
Inst4Quest2_Aim = "找到铁趾的护符，把它交给奥达曼的铁趾。"
Inst4Quest2_Location = "铁趾格雷兹（奥达曼; "..YELLOW.."副本入口地图[1]"..WHITE.."）。"
Inst4Quest2_Note = "马格雷甘·深影掉落铁趾的护符"..YELLOW.."副本入口地图[2]"..WHITE.."。"
Inst4Quest2_Prequest = "有，一线希望"
Inst4Quest2_Folgequest = "有，铁趾的遗愿"
Inst4Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst4Quest3 = "3. 意志石板"
Inst4Quest3_Level = "45"
Inst4Quest3_Attain = "38"
Inst4Quest3_Aim = "找到意志石板，把它们交给铁炉堡的顾问贝尔格拉姆。"
Inst4Quest3_Location = "顾问贝尔格拉姆（铁炉堡 - 探险者大厅; "..YELLOW.."77,10 "..WHITE.."）"
Inst4Quest3_Note = "石板位置在"..YELLOW.."[8]"..WHITE.."。"
Inst4Quest3_Prequest = "有，铁趾的遗愿 -> 邪恶的使者"
Inst4Quest3_Folgequest = "无"
Inst4Quest3FQuest = "true"
--
Inst4Quest3name1 = "勇气勋章 "

--Quest 4 Alliance
Inst4Quest4 = "4. 能量石"
Inst4Quest4_Level = "36"
Inst4Quest4_Attain = "31"
Inst4Quest4_Aim = "给荒芜之地的里格弗兹带去8块德提亚姆能量石和8块安纳洛姆能量石。"
Inst4Quest4_Location = "里格弗兹（荒芜之地; "..YELLOW.."42,52 "..WHITE.."）"
Inst4Quest4_Note = "能量石可以在副本内外的暗炉敌人身上找到。"
Inst4Quest4_Prequest = "无"
Inst4Quest4_Folgequest = "无"
--
Inst4Quest4name1 = "能量石环"
Inst4Quest4name2 = "杜拉辛护腕"
Inst4Quest4name3 = "持久长靴"

--Quest 5 Alliance
Inst4Quest5 = "5. 阿戈莫德的命运"
Inst4Quest5_Level = "38"
Inst4Quest5_Attain = "33"
Inst4Quest5_Aim = "收集4个雕纹石罐，把它们交给洛克莫丹的勘察员基恩萨·铁环。"
Inst4Quest5_Location = "勘察员基恩萨·铁环（洛克莫丹 - 铁环挖掘场; "..YELLOW.."65,65 "..WHITE.."）"
Inst4Quest5_Note = "前导任务始于勘察员塔伯斯·雷矛（铁炉堡 - 探险者大厅; "..YELLOW.."74,12"..WHITE.."）。\n雕纹石罐散布于副本前的山洞里。"
Inst4Quest5_Prequest = "有，铁环挖掘场需要你！ -> 莫达洛克"
Inst4Quest5_Folgequest = "无"
Inst4Quest5PreQuest = "true"
--
Inst4Quest5name1 = "勘察者手套"

--Quest 6 Alliance
Inst4Quest6 = "6. 化解灾难"
Inst4Quest6_Level = "40"
Inst4Quest6_Attain = "32"
Inst4Quest6_Aim = "把雷乌纳石板带给迷失者塞尔杜林。"
Inst4Quest6_Location = "迷失者塞尔杜林（荒芜之地; "..YELLOW.."51,76 "..WHITE.."）"
Inst4Quest6_Note = "石板在洞穴北部，通道的东部尽头"..YELLOW.."副本入口地图[3]"..WHITE.."。"
Inst4Quest6_Prequest = "无"
Inst4Quest6_Folgequest = "有，远赴铁炉堡"
--
Inst4Quest6name1 = "末日预言者长袍"

--Quest 7 Alliance
Inst4Quest7 = "7. 失踪的矮人"
Inst4Quest7_Level = "40"
Inst4Quest7_Attain = "35"
Inst4Quest7_Aim = "在奥达曼找到巴尔洛戈。"
Inst4Quest7_Location = "勘察员塔伯斯·雷矛（铁炉堡 - 探险者大厅; "..YELLOW.."75,12 "..WHITE.."）"
Inst4Quest7_Note = "巴尔洛戈在"..YELLOW.."[1]"..WHITE.."。"
Inst4Quest7_Prequest = "无"
Inst4Quest7_Folgequest = "有，密室"
-- No Rewards for this quest

--Quest 8 Alliance
Inst4Quest8 = "8. 密室"
Inst4Quest8_Level = "40"
Inst4Quest8_Attain = "35"
Inst4Quest8_Aim = "阅读巴尔洛戈的日记，探索密室，然后向铁炉堡的勘察员塔伯斯·雷矛汇报。"
Inst4Quest8_Location = "巴尔洛戈（奥达曼;"..YELLOW.."[1]"..WHITE.."）"
Inst4Quest8_Note = "密室在"..YELLOW.."[4]"..WHITE.."。"
Inst4Quest8_Prequest = "有，失踪的矮人"
Inst4Quest8_Folgequest = "无"
Inst4Quest8FQuest = "true"
--
Inst4Quest8name1 = "矮人冲锋斧"
Inst4Quest8name2 = "探险者联盟徽章"

--Quest 9 Alliance
Inst4Quest9 = "9. 破碎的项链"
Inst4Quest9_Level = "41"
Inst4Quest9_Attain = "37"
Inst4Quest9_Aim = "找到破碎的项链的来源，从而了解其潜在的价值。"
Inst4Quest9_Location = "破碎的项链（随机掉落）（奥达曼）"
Inst4Quest9_Note = "把项链带给铁炉堡的塔瓦斯德·基瑟尔（铁炉堡 - 秘法区; "..YELLOW.."36,3"..WHITE.."）。"
Inst4Quest9_Prequest = "无"
Inst4Quest9_Folgequest = "有，昂贵的知识"
-- No Rewards for this quest

--Quest 10 Alliance
Inst4Quest10 = "10. 回到奥达曼"
Inst4Quest10_Level = "42"
Inst4Quest10_Attain = "37"
Inst4Quest10_Aim = "去奥达曼寻找塔瓦斯的魔法项链，被杀的圣骑士是最后一个拿着它的人。"
Inst4Quest10_Location = "塔瓦斯德·基瑟尔（铁炉堡 - 秘法区; "..YELLOW.."36,3 "..WHITE.."）"
Inst4Quest10_Note = "圣骑士在"..YELLOW.."[2]"..WHITE.."。"
Inst4Quest10_Prequest = "有，昂贵的知识"
Inst4Quest10_Folgequest = "有，寻找宝石"
-- No Rewards for this quest

--Quest 11 Alliance
Inst4Quest11 = "11. 寻找宝石"
Inst4Quest11_Level = "43"
Inst4Quest11_Attain = "38"
Inst4Quest11_Aim = "在奥达曼寻找红宝石、蓝宝石和黄宝石的下落。找到它们之后，通过塔瓦斯德给你的占卜之瓶和他进行联系。"
Inst4Quest11_Location = "圣骑士的遗体（奥达曼; "..YELLOW.."[2]"..WHITE.."）"
Inst4Quest11_Note = "宝石在"..YELLOW.."[1]"..WHITE.."，"..YELLOW.."[8]"..WHITE.."和"..YELLOW.."[9]"..WHITE.."。"
Inst4Quest11_Prequest = "有，回到奥达曼"
Inst4Quest11_Folgequest = "有，修复项链"
Inst4Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst4Quest12 = "12. 修复项链"
Inst4Quest12_Level = "44"
Inst4Quest12_Attain = "38"
Inst4Quest12_Aim = "从奥达曼最强大的石人身上获得能量源，然后将其交给铁炉堡的塔瓦斯德。"
Inst4Quest12_Location = "塔瓦斯德的占卜之碗"
Inst4Quest12_Note = "破碎项链的能量源在阿扎达斯掉落"..YELLOW.."[10]"..WHITE.."。"
Inst4Quest12_Prequest = "有，寻找宝石"
Inst4Quest12_Folgequest = "无"
--
Inst4Quest12name1 = "塔瓦斯德的魔法项链"
Inst4Quest12FQuest = "true"

--Quest 13 Alliance
Inst4Quest13 = "13. 奥达曼的蘑菇"
Inst4Quest13_Level = "42"
Inst4Quest13_Attain = "38"
Inst4Quest13_Aim = "收集12颗紫色蘑菇，把它们交给塞尔萨玛的加克。"
Inst4Quest13_Location = "加克（洛克莫丹 - 塞尔萨玛; "..YELLOW.."37,49 "..WHITE.."）"
Inst4Quest13_Note = "蘑菇散布于副本各处。"
Inst4Quest13_Prequest = "有，荒芜之地的材料"
Inst4Quest13_Folgequest = "无"
Inst4Quest13PreQuest = "true"
--
Inst4Quest13name1 = "滋补药剂"

--Quest 14 Alliance
Inst4Quest14 = "14. 失而复得"
Inst4Quest14_Level = "43"
Inst4Quest14_Attain = "33"
Inst4Quest14_Aim = "到奥达曼的北部大厅去找到克罗姆·粗臂的箱子，从里面拿出他的宝贵财产，然后回到铁炉堡把东西交给他。"
Inst4Quest14_Location = "克罗姆·粗臂（铁炉堡 - 探险者大厅; "..YELLOW.."74,9 "..WHITE.."）"
Inst4Quest14_Note = "你在进入副本前就找到克罗姆·粗臂的财产。它就在洞穴的北部，第一个通道的东南角尽头"..YELLOW.."副本入口地图[4]"..WHITE.."。"
Inst4Quest14_Prequest = "无"
Inst4Quest14_Folgequest = "无"
-- No Rewards for this quest

--Quest 15 Alliance
Inst4Quest15 = "15. 白金圆盘"
Inst4Quest15_Level = "47"
Inst4Quest15_Attain = "40"
Inst4Quest15_Aim = "和石头守护者交谈，从他那里了解更多古代的知识。一旦你了解到了所有的内容之后就激活诺甘农圆盘。 -> 把迷你版的诺甘农圆盘带到铁炉堡的探险者协会去。"
Inst4Quest15_Location = "诺甘农圆盘（奥达曼; "..YELLOW.."[11]"..WHITE.."）"
Inst4Quest15_Note = "接到任务后，和石头守护者交谈左边的盘子。然后再次使用白金圆盘，取得缩小版的圆盘， 并把缩小版的白金圆盘带给铁炉堡的资深探险家麦格拉斯（铁炉堡 - 探险者大厅; "..YELLOW.."69,18"..WHITE.."）。"
Inst4Quest15_Prequest = "无"
Inst4Quest15_Folgequest = "无"
--
Inst4Quest15name1 = "软皮袋"
Inst4Quest15name2 = "超强治疗药水"
Inst4Quest15name3 = "强效法力药水 "

--Quest 16 Alliance
Inst4Quest16 = "16. 奥达曼的能量源（法师任务）"
Inst4Quest16_Level = "40"
Inst4Quest16_Attain = "35"
Inst4Quest16_Aim = "找到一个黑曜石能量源，将其交给尘泥沼泽的塔贝萨。"
Inst4Quest16_Location = "塔贝萨（尘泥沼泽; "..YELLOW.."46,57 "..WHITE.."）"
Inst4Quest16_Note = "这个任务只能法师做！\n黑曜石哨兵"..YELLOW.."[5]"..WHITE.."掉落黑曜石能量源。"
Inst4Quest16_Prequest = "有，驱除魔鬼"
Inst4Quest16_Folgequest = "有，法力怒灵"
Inst4Quest16PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 4 Alliance)
Inst4Quest1_HORDE = "1. 能量石"
Inst4Quest1_HORDE_Level = Inst4Quest4_Level
Inst4Quest1_HORDE_Attain = Inst4Quest4_Attain
Inst4Quest1_HORDE_Aim = Inst4Quest4_Aim
Inst4Quest1_HORDE_Location = Inst4Quest4_Location
Inst4Quest1_HORDE_Note = Inst4Quest4_Note
Inst4Quest1_HORDE_Prequest = Inst4Quest4_Prequest
Inst4Quest1_HORDE_Folgequest = Inst4Quest4_Folgequest
--
Inst4Quest1name1_HORDE = Inst4Quest4name1
Inst4Quest1name2_HORDE = Inst4Quest4name2
Inst4Quest1name3_HORDE = Inst4Quest4name3

--Quest 2 Horde  (same as Quest 6 Alliance - different followup)
Inst4Quest2_HORDE = "2. 化解灾难"
Inst4Quest2_HORDE_Level = Inst4Quest6_Level
Inst4Quest2_HORDE_Attain = Inst4Quest6_Attain
Inst4Quest2_HORDE_Aim = Inst4Quest6_Aim
Inst4Quest2_HORDE_Location = Inst4Quest6_Location
Inst4Quest2_HORDE_Note = Inst4Quest6_Note
Inst4Quest2_HORDE_Prequest = Inst4Quest6_Prequest
Inst4Quest2_HORDE_Folgequest = "有，远赴幽暗城"
--
Inst4Quest2name1_HORDE = Inst4Quest6name1

--Quest 3 Horde
Inst4Quest3_HORDE = "3. 搜寻项链"
Inst4Quest3_HORDE_Level = "41"
Inst4Quest3_HORDE_Attain = "37"
Inst4Quest3_HORDE_Aim = "在奥达曼挖掘场中寻找一条珍贵的项链，然后将其交给奥格瑞玛的德兰·杜佛斯。项链有可能已经损坏。 "
Inst4Quest3_HORDE_Location = "德兰·杜佛斯（奥格瑞玛 - 暗巷区; "..YELLOW.."59,36 "..WHITE.."）"
Inst4Quest3_HORDE_Note = "项链在副本里是随机掉落的。"
Inst4Quest3_HORDE_Prequest = "无"
Inst4Quest3_HORDE_Folgequest = "有，搜寻项链，再来一次"
-- No Rewards for this quest

--Quest 4 Horde
Inst4Quest4_HORDE = "4. 搜寻项链，再来一次"
Inst4Quest4_HORDE_Level = "41"
Inst4Quest4_HORDE_Attain = "37"
Inst4Quest4_HORDE_Aim = "在奥达曼里找寻宝石的线索。"
Inst4Quest4_HORDE_Location = "德兰·杜佛斯（奥格瑞玛 - 暗巷区; "..YELLOW.."59,36 "..WHITE.."）"
Inst4Quest4_HORDE_Note = "圣骑士在"..YELLOW.."[2]"..WHITE.."。"
Inst4Quest4_HORDE_Prequest = "有，搜寻项链"
Inst4Quest4_HORDE_Folgequest = "有，翻译日记"
Inst4Quest4FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 5 Horde
Inst4Quest5_HORDE = "5. 翻译日记"
Inst4Quest5_HORDE_Level = "42"
Inst4Quest5_HORDE_Attain = "39"
Inst4Quest5_HORDE_Aim = "在荒芜之地的卡加斯哨所里寻找一个可以帮你翻译圣骑士日记的人。"
Inst4Quest5_HORDE_Location = "圣骑士的遗体（奥达曼; "..YELLOW.."[2]"..WHITE.."）"
Inst4Quest5_HORDE_Note = "翻译圣骑士日记的人加卡尔（荒芜之地 - 卡加斯; "..YELLOW.."2,46"..WHITE.."） -> 将项链借给加卡尔，他帮你翻译日记。"
Inst4Quest5_HORDE_Prequest = "有，搜寻项链，再来一次"
Inst4Quest5_HORDE_Folgequest = "有，寻找宝贝"
Inst4Quest5FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 6 Horde
Inst4Quest6_HORDE = "6. 寻找宝贝"
Inst4Quest6_HORDE_Level = "44"
Inst4Quest6_HORDE_Attain = "37"
Inst4Quest6_HORDE_Aim = "从奥达曼找回项链上的所有三块宝石和能量源，然后把它们交给卡加斯的加卡尔。\n红宝石被藏在暗影矮人层层设防的地区。\n黄宝石藏在石腭怪活动地区的一个瓮中。\n蓝宝石在格瑞姆洛克手中，他是石腭怪的领袖。\n能量源可能在奥达曼的某个最强生物的手中。"
Inst4Quest6_HORDE_Location = "加卡尔（荒芜之地 - 卡加斯; "..YELLOW.."2,46 "..WHITE.."）"
Inst4Quest6_HORDE_Note = "红宝石在暗炉矮人手里，黄宝石在石腭怪手里，而蓝宝石则在一个名叫格瑞姆洛克的石腭怪那里"..YELLOW.."[1]"..WHITE.."，"..YELLOW.."[8]"..WHITE.."和"..YELLOW.."[9]"..WHITE.."。  破碎项链的能量源从阿扎达斯身上掉落"..YELLOW.."[10]"..WHITE.."。"
Inst4Quest6_HORDE_Prequest = "有，翻译日记"
Inst4Quest6_HORDE_Folgequest = "有，交付宝石"
Inst4Quest6FQuest_HORDE = "true"
--
Inst4Quest6name1_HORDE = "加卡尔的强化项链"

--Quest 7 Horde
Inst4Quest7_HORDE = "7. 奥达曼的蘑菇"
Inst4Quest7_HORDE_Level = "42"
Inst4Quest7_HORDE_Attain = "36"
Inst4Quest7_HORDE_Aim = "收集12颗紫色蘑菇，把它们交给卡加斯的加卡尔。"
Inst4Quest7_HORDE_Location = "加卡尔（荒芜之地 - 卡加斯; "..YELLOW.."2,69 "..WHITE.."）"
Inst4Quest7_HORDE_Note = "前导任务也是在加卡尔这儿领取。\n蘑菇散布于副本内各处。"
Inst4Quest7_HORDE_Prequest = "有，荒芜之地的材料"
Inst4Quest7_HORDE_Folgequest = "有，荒芜之地的材料 II"
Inst4Quest7PreQuest_HORDE = "true"
--
Inst4Quest7name1_HORDE = "滋补药剂"

--Quest 8 Horde
Inst4Quest8_HORDE = "8. 寻找宝藏"
Inst4Quest8_HORDE_Level = "43"
Inst4Quest8_HORDE_Attain = "33"
Inst4Quest8_HORDE_Aim = "从奥达曼南部大厅的箱子中找到加勒特的家族宝藏，然后把它交给幽暗城的帕特里克·加瑞特。"
Inst4Quest8_HORDE_Location = "帕特里克·加瑞特（幽暗城; "..YELLOW.."72,48 "..WHITE.."）"
Inst4Quest8_HORDE_Note = "你在进入副本之前就会找到加勒特的家族宝藏。它就在南部通道的尽头"..YELLOW.."副本入口ditu[5]"..WHITE.."。"
Inst4Quest8_HORDE_Prequest = "无"
Inst4Quest8_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 9 Horde
Inst4Quest9_HORDE = "9. 白金圆盘"
Inst4Quest9_HORDE_Level = "47"
Inst4Quest9_HORDE_Attain = "40"
Inst4Quest9_HORDE_Aim = "和石头守护者交谈，从他那里了解更多古代的知识。一旦你了解到了所有的内容之后就激活诺甘农圆盘。 -> 把迷你版的诺甘农圆盘带到雷霆崖的贤者（圣者图希克）那里。"
Inst4Quest9_HORDE_Location = "诺甘农圆盘（奥达曼; "..YELLOW.."[11]"..WHITE.."）"
Inst4Quest9_HORDE_Note = "你领取到任务后，和石头守护着交谈盘子的左边。然后再次使用白金圆盘得到迷你版的圆盘，带着它去雷霆崖找圣者图希克（"..YELLOW.."34,46"..WHITE.."）。"
Inst4Quest9_HORDE_Prequest = "无"
Inst4Quest9_HORDE_Folgequest = "无"
--
Inst4Quest9name1_HORDE = "软皮袋"
Inst4Quest9name2_HORDE = "超强治疗药水"
Inst4Quest9name3_HORDE = "强效法力药水"

--Quest 10 Horde  (same as Quest 4 Alliance)
Inst4Quest10_HORDE = "10. 奥达曼的能量源（法师任务）"
Inst4Quest10_HORDE_Level = Inst4Quest16_Level
Inst4Quest10_HORDE_Attain = Inst4Quest16_Attain
Inst4Quest10_HORDE_Aim = Inst4Quest16_Aim
Inst4Quest10_HORDE_Location = Inst4Quest16_Location
Inst4Quest10_HORDE_Note = Inst4Quest16_Note
Inst4Quest10_HORDE_Prequest = Inst4Quest16_Prequest
Inst4Quest10_HORDE_Folgequest = Inst4Quest16_Folgequest
Inst4Quest10PreQuest_HORDE = Inst4Quest16PreQuest
-- No Rewards for this quest



--------------- INST5 - Blackrock Depths (BRD) ---------------

Inst5Story = "黑石深渊曾经是黑铁矮人的伟大都城，这个火山中的迷宫现在成为拉格纳罗斯火焰领主的王座所在地。拉格纳罗斯找到了使用石头和设计图来创造一支无敌石头人均对来帮助它征服黑石深渊。即使是需要打败奈法利安和他的龙子龙孙，拉格纳罗斯会不惜一切代价来达到最后的胜利。"
Inst5Caption = "黑石深渊"
Inst5QAA = "18 个任务"
Inst5QAH = "18 个任务"

--Quest 1 Alliance
Inst5Quest1 = "1. 黑铁的遗产"
Inst5Quest1_Level = "52"
Inst5Quest1_Attain = "48"
Inst5Quest1_Aim = "杀掉弗诺斯·达克维尔并拿回战锤铁胆。把铁胆之锤拿到索瑞森神殿去，将其放在弗兰克罗恩·铸铁的雕像上。"
Inst5Quest1_Location = "弗兰克罗恩·铸铁（黑石山; "..YELLOW.."副本入口地图[3]"..WHITE.."）"
Inst5Quest1_Note = "弗兰克罗恩在黑石的中心，在他的墓上方。你必须死亡后才能见到他！和他交谈2次，激活任务。\n弗诺斯·达克维尔在"..YELLOW.."[9]"..WHITE.."区。你会在"..YELLOW.."[7]"..WHITE.."区找到神殿。"
Inst5Quest1_Prequest = "无"
Inst5Quest1_Folgequest = "无"
--
Inst5Quest1name1 = "暗炉钥匙"

--Quest 2 Alliance
Inst5Quest2 = "2. 雷布里·斯库比格特"
Inst5Quest2_Level = "53"
Inst5Quest2_Attain = "48"
Inst5Quest2_Aim = "把雷布里的头颅交给燃烧平原的尤卡·斯库比格特。"
Inst5Quest2_Location = "尤卡·斯库比格特（燃烧平原 - 烈焰峰; "..YELLOW.."65,22"..WHITE.."）"
Inst5Quest2_Note = "可以直接接到任务，也可以接到前导任务从尤卡·斯库比格特（塔纳利斯 - 热砂港; "..YELLOW.."67,23"..WHITE.."）那儿得到。\n雷布里位于"..YELLOW.."[15]"..WHITE.."。"
Inst5Quest2_Prequest = "有，尤卡·斯库比格特"
Inst5Quest2_Folgequest = "无"
Inst5Quest2PreQuest = "true"
--
Inst5Quest2name1 = "怨恨之靴"
Inst5Quest2name2 = "忏悔肩铠 "
Inst5Quest2name3 = "钢条护甲"

--Quest 3 Alliance
Inst5Quest3 = "3. 爱情药水"
Inst5Quest3_Level = "54"
Inst5Quest3_Attain = "50"
Inst5Quest3_Aim = "将4份格罗姆之血、10块巨型银矿和装满水的娜玛拉之瓶交给黑石深渊的娜玛拉小姐。"
Inst5Quest3_Location = "娜玛拉小姐（黑石深渊; "..YELLOW.."[15]"..WHITE.."）"
Inst5Quest3_Note = "巨型银矿可从艾萨拉的巨人们那里得到。格罗姆之血可以请学习了草药学的玩家帮助寻找。 你可以在（安戈洛环形山 - 葛拉卡温泉; "..YELLOW.."31,50"..WHITE.."）为瓶子装满水。\n完成任务后，你可以使用后门而不必杀死法拉克斯。"
Inst5Quest3_Prequest = "无"
Inst5Quest3_Folgequest = "无"
--
Inst5Quest3name1 = "镣铐护腕 "
Inst5Quest3name2 = "娜玛拉的腰带"

--Quest 4 Alliance
Inst5Quest4 = "4. 霍尔雷·黑须"
Inst5Quest4_Level = "55"
Inst5Quest4_Attain = "50"
Inst5Quest4_Aim = "把遗失的雷酒秘方带给卡拉诺斯的拉格纳·雷酒。"
Inst5Quest4_Location = "拉格纳·雷酒（丹莫罗 - 卡拉诺斯; "..YELLOW.."46,52"..WHITE.."）"
Inst5Quest4_Note = "前导任务从 恩诺哈尔·雷酒（诅咒之地 - 守望堡; "..YELLOW.."61,18"..WHITE.."）处获得。\n如果你在"..YELLOW.."[15]"..WHITE.."区摧毁装有雷霆啤酒的桶，守卫就会出现。秘方就在这其中一个守卫身上。"
Inst5Quest4_Prequest = "有，拉格纳·雷酒"
Inst5Quest4_Folgequest = "无"
Inst5Quest4PreQuest = "true"
--
Inst5Quest4name1 = "矮人黑啤酒"
Inst5Quest4name2 = "迅捷木槌"
Inst5Quest4name3 = "叉刃巨斧"

--Quest 5 Alliance 
Inst5Quest5 = "5. 征服者派隆"
Inst5Quest5_Level = "52"
Inst5Quest5_Attain = "48"
Inst5Quest5_Aim = "杀掉征服者派隆，然后向加琳达复命。"
Inst5Quest5_Location = "加琳达（燃烧平原 - 摩根的岗哨; "..YELLOW.."85,69"..WHITE.."）"
Inst5Quest5_Note = "征服者派隆是副本门口外面的一个火元素精英。在黑石深渊地图的"..YELLOW.."[24]"..WHITE.."，黑石深渊副本入口地图的"..YELLOW.."[1]"..WHITE.."。"
Inst5Quest5_Prequest = "无"
Inst5Quest5_Folgequest = "有，伊森迪奥斯"
-- No Rewards for this quest

--Quest 6 Alliance
Inst5Quest6 = "6. 伊森迪奥斯！"
Inst5Quest6_Level = "56"
Inst5Quest6_Attain = "48"
Inst5Quest6_Aim = "在黑石深渊里找到伊森迪奥斯，然后把他干掉！"
Inst5Quest6_Location = "加琳达（燃烧平原 - 摩根的岗哨; "..YELLOW.."85,69"..WHITE.."）"
Inst5Quest6_Note = "伊森迪奥斯在"..YELLOW.."[10]"..WHITE.."。"
Inst5Quest6_Prequest = "有，征服者派隆"
Inst5Quest6_Folgequest = "无"
Inst5Quest6FQuest = "true"
--
Inst5Quest6name1 = "阳焰斗篷"
Inst5Quest6name2 = "夜暮手套"
Inst5Quest6name3 = "地穴恶魔护腕"
Inst5Quest6name4 = "坚定手套"

--Quest 7 Alliance
Inst5Quest7 = "7. 山脉之心"
Inst5Quest7_Level = "55"
Inst5Quest7_Attain = "50"
Inst5Quest7_Aim = "把山脉之心交给燃烧平原的麦克斯沃特·尤博格林。"
Inst5Quest7_Location = "麦克斯沃特·尤博格林（燃烧平原 - 烈焰峰; "..YELLOW.."65,23"..WHITE.."）"
Inst5Quest7_Note = "你可以从"..YELLOW.."[8]"..WHITE.."的宝箱里找到山脉之心。你必须打开黑色宝库所有的小宝箱出来 Boss 之后才能拿到钥匙。"
Inst5Quest7_Prequest = "无"
Inst5Quest7_Folgequest = "无"
-- No Rewards for this quest

--Quest 8 Alliance
Inst5Quest8 = "8. 好东西"
Inst5Quest8_Level = "56"
Inst5Quest8_Attain = "50"
Inst5Quest8_Aim = "到黑石深渊去找到20个黑铁挎包。当你完成任务之后，回到奥拉留斯那里复命。你认为黑石深渊里的黑铁矮人应该会有这些黑铁挎包。"
Inst5Quest8_Location = "奥拉留斯（燃烧平原 - 摩根的岗哨; "..YELLOW.."84,68"..WHITE.."）"
Inst5Quest8_Note = "所有矮人都可能掉落挎包。"
Inst5Quest8_Prequest = "无"
Inst5Quest8_Folgequest = "无"
--
Inst5Quest8name1 = "肮脏的背包"

--Quest 9 Alliance
Inst5Quest9 = "9. 温德索尔元帅（奥妮克希亚系列任务）"
Inst5Quest9_Level = "54"
Inst5Quest9_Attain = "48"
Inst5Quest9_Aim = "到西北部的黑石山脉去，在黑石深渊中找到温德索尔元帅的下落。\n狼狈不堪的约翰曾告诉你说温德索尔被关进了一个监狱。"
Inst5Quest9_Location = "麦克斯韦尔元帅（燃烧平原 - 摩根的岗哨; "..YELLOW.."84,68"..WHITE.."）"
Inst5Quest9_Note = "此系列任务始于赫林迪斯·河角（燃烧平原 - 摩根的岗哨"..YELLOW.."85,68"..WHITE.."）。\n温德索尔元帅在"..YELLOW.."[4]"..WHITE.."。完成这个任务后，你要回到麦克斯韦尔元帅那里."
Inst5Quest9_Prequest = "有，黑龙的威胁 -> 真正的主人"
Inst5Quest9_Folgequest = "有，被遗弃的希望 -> 弄皱的便笺"
Inst5Quest9PreQuest = "true"
--
Inst5Quest9name1 = "监督官头盔"
Inst5Quest9name2 = "盾甲铁靴"
Inst5Quest9name3 = "风剪护腿"

--Quest 10 Alliance
Inst5Quest10 = "10. 弄皱的便笺（奥妮克希亚系列任务）"
Inst5Quest10_Level = "58"
Inst5Quest10_Attain = "50"
Inst5Quest10_Aim = "温德索尔元帅也许会对你手中的东西感兴趣。毕竟，希望还没有被完全扼杀。"
Inst5Quest10_Location = "弄皱的便笺（掉落）（黑石深渊）"
Inst5Quest10_Note = "这个任务是弄皱的便笺触发的。温德索尔元帅在"..YELLOW.."[4]"..WHITE.."。副本里和外的所有黑铁矮人都有很大几率掉落便笺。"
Inst5Quest10_Prequest = "有，温德索尔元帅"
Inst5Quest10_Folgequest = "有，一丝希望"
Inst5Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst5Quest11 = "11. 一丝希望（奥妮克希亚系列任务）"
Inst5Quest11_Level = "58"
Inst5Quest11_Attain = "52"
Inst5Quest11_Aim = "找回温德索尔元帅遗失的情报。\n温德索尔元帅确信那些情报在安格弗将军和傀儡统帅阿格曼奇的手里。"
Inst5Quest11_Location = "温德索尔元帅（黑石深渊; "..YELLOW.."[4]"..WHITE.."）"
Inst5Quest11_Note = "温德索尔元帅在"..YELLOW.."[4]"..WHITE.."。\n傀儡统帅阿格曼奇在"..YELLOW.."[14]"..WHITE.."，安格弗将军在"..YELLOW.."[13]"..WHITE.."。"
Inst5Quest11_Prequest = "有，弄皱的便笺"
Inst5Quest11_Folgequest = "有，冲破牢笼！"
Inst5Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst5Quest12 = "12. 冲破牢笼！（奥妮克希亚系列任务）"
Inst5Quest12_Level = "58"
Inst5Quest12_Attain = "52"
Inst5Quest12_Aim = "帮助温德索尔元帅拿回他的装备并救出他的朋友。当你成功之后就回去向麦克斯韦尔元帅复命。"
Inst5Quest12_Location = "温德索尔元帅（黑石深渊; "..YELLOW.."[4]"..WHITE.."）"
Inst5Quest12_Note = "温德索尔元帅在"..YELLOW.."[4]"..WHITE.."。\n如果你清掉法律之环一圈的怪（"..YELLOW.."[6]"..WHITE.."）和通向副本门口的怪的话会轻松很多。护送完成后去找麦克斯韦尔元帅（燃烧平原 - 摩根的岗哨; "..YELLOW.."84,68"..WHITE.."）。"
Inst5Quest12_Prequest = "有，一丝希望"
Inst5Quest12_Folgequest = "有，集合在暴风城"
Inst5Quest12FQuest = "true"
--
Inst5Quest12name1 = "元素屏障"
Inst5Quest12name2 = "清算之刃"
Inst5Quest12name3 = "作战之刃"

--Quest 13 Alliance
Inst5Quest13 = "13. 烈焰精华"
Inst5Quest13_Level = "58"
Inst5Quest13_Attain = "52"
Inst5Quest13_Aim = "到黑石深渊去杀掉贝尔加。\n你只知道这个巨型怪物住在黑石深渊的最深处。记住你要使用特殊的黑龙皮从贝尔加的尸体上采集烈焰精华。\n将你采集到的烈焰精华交给塞勒斯·萨雷芬图斯。"
Inst5Quest13_Location = "塞勒斯·萨雷芬图斯（燃烧平原; "..YELLOW.."94,31"..WHITE.."）"
Inst5Quest13_Note = "此系列任务始于卡拉然·温布雷（灼热峡谷; "..YELLOW.."39,38"..WHITE.."）。\n 贝尔加在"..YELLOW.."[11]"..WHITE.."。"
Inst5Quest13_Prequest = "有，无瑕之焰 -> 烈焰精华"
Inst5Quest13_Folgequest = "无"
Inst5Quest13PreQuest = "true"
--
Inst5Quest13name1 = "页岩斗篷"
Inst5Quest13name2 = "龙皮肩铠"
Inst5Quest13name3 = "火山腰带"

--Quest 14 Alliance
Inst5Quest14 = "14. 卡兰·巨锤"
Inst5Quest14_Level = "59"
Inst5Quest14_Attain = "50"
Inst5Quest14_Aim = " 去黑石深渊找到卡兰·巨锤。\n国王提到卡兰在那里负责看守囚犯——也许你应该在监狱附近寻找他。"
Inst5Quest14_Location = "国王麦格尼·铜须（铁炉堡; "..YELLOW.."39,55"..WHITE.."）"
Inst5Quest14_Note = "前导任务始于皇家历史学家阿克瑟努斯（铁炉堡; "..YELLOW.."38,55"..WHITE.."）。卡兰·巨锤位于"..YELLOW.."[2]"..WHITE.."。"
Inst5Quest14_Prequest =  "有，索瑞森废墟"
Inst5Quest14_Folgequest = "有，卡兰的故事 - > 糟糕的消息 - > 王国的命运 - > 语出惊人的公主"
Inst5Quest14PreQuest = "true"
-- No Rewards for this quest

--Quest 15 Alliance
Inst5Quest15 = "15. 王国的命运"
Inst5Quest15_Level = "59"
Inst5Quest15_Attain = "51"
Inst5Quest15_Aim = "回到黑石深渊，从达格兰·索瑞森大帝的魔掌中救出铁炉堡公主茉艾拉·铜须。"
Inst5Quest15_Location = "国王麦格尼·铜须（铁炉堡; "..YELLOW.."39,55"..WHITE.."）"
Inst5Quest15_Note = "公主茉艾拉·铜须 位于"..YELLOW.."[21]"..WHITE.."。战斗中她可能会治疗达格兰。试着尽可能打断她。但是一定不能让她死掉，否则你的任务将会失败！与她交谈过后，你还要回到麦格尼·铜须那儿去。"
Inst5Quest15_Prequest = "有，糟糕的消息"
Inst5Quest15_Folgequest = "有，语出惊人的公主"
Inst5Quest15FQuest = "true"
--
Inst5Quest15name1 = "麦格尼的意志"
Inst5Quest15name2 = "铁炉堡歌唱石"

--Quest 16 Alliance
Inst5Quest16 = "16. 熔火之心的传送门"
Inst5Quest16_Level = "60"
Inst5Quest16_Attain = "55"
Inst5Quest16_Aim = "进入黑石深渊，在通往熔火之心的传送门附近找到一块熔火碎片，然后回到黑石山脉的洛索斯·天痕那里。"
Inst5Quest16_Location = "洛索斯·天痕（黑石山; "..YELLOW.."副本入口地图[2]"..WHITE.."）"
Inst5Quest16_Note = "完成这个任务之后你就可以从洛索斯·天痕旁边的传送石进入熔火之心。\n熔火碎片在"..YELLOW.."[23]"..WHITE.."。"
Inst5Quest16_Prequest = "无"
Inst5Quest16_Folgequest = "无"
-- No Rewards for this quest

--Quest 17 Alliance
Inst5Quest17 = "17. 挑战（T0.5升级任务）"
Inst5Quest17_Level = "60"
Inst5Quest17_Attain = "60"
Inst5Quest17_Aim = "前往黑石深渊竞技场并在你被裁决者格里斯通宣判时将挑衅旗帜放在它的中央。杀死瑟尔伦和他的战士们，再带着第一块瓦萨拉克护符回到东瘟疫之地的安希恩·哈莫那里。"
Inst5Quest17_Location = "法尔林·树影（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）"
Inst5Quest17_Note = "对于不同的职业后续任务是不同的。"
Inst5Quest17_Prequest = "无"
Inst5Quest17_Folgequest = "有，各个职业的职业任务（T0.5升级任务）"
-- No Rewards for this quest

--Quest 18 Alliance
Inst5Quest18 = "18. 鬼魂之杯（采矿任务）"
Inst5Quest18_Level = "55"
Inst5Quest18_Attain = "55"
Inst5Quest18_Aim = "鬼魂之杯的塞娜尼·雷心要你找到他想要的材料。"
Inst5Quest18_Location = "塞娜尼·雷心（黑石深渊; "..YELLOW.."[18]"..WHITE.."）"
Inst5Quest18_Note = "只有采矿技能大于230才能接到此任务，这个任务会是你学会如何熔炼黑铁矿石。材料如下：2个[红宝石]，20个[金锭]，10个[真银锭]。完成之后，如果你有[黑铁矿石]你可以在黑熔炉"..YELLOW.."[22]"..WHITE.."熔炼黑铁。"
Inst5Quest18_Prequest = "无"
Inst5Quest18_Folgequest = "无"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst5Quest1_HORDE = Inst5Quest1
Inst5Quest1_HORDE_Level = Inst5Quest1_Level
Inst5Quest1_HORDE_Attain = Inst5Quest1_Attain
Inst5Quest1_HORDE_Aim = Inst5Quest1_Aim
Inst5Quest1_HORDE_Location = Inst5Quest1_Location
Inst5Quest1_HORDE_Note = Inst5Quest1_Note
Inst5Quest1_HORDE_Prequest = Inst5Quest1_Prequest
Inst5Quest1_HORDE_Folgequest = Inst5Quest1_Folgequest
--
Inst5Quest1name1_HORDE = Inst5Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst5Quest2_HORDE = Inst5Quest2
Inst5Quest2_HORDE_Level = Inst5Quest2_Level
Inst5Quest2_HORDE_Attain = Inst5Quest2_Attain
Inst5Quest2_HORDE_Aim = Inst5Quest2_Aim
Inst5Quest2_HORDE_Location = Inst5Quest2_Location
Inst5Quest2_HORDE_Note = Inst5Quest2_Note
Inst5Quest2_HORDE_Prequest = Inst5Quest2_Prequest
Inst5Quest2_HORDE_Folgequest = Inst5Quest2_Folgequest
Inst5Quest2PreQuest_HORDE = Inst5Quest2PreQuest
--
Inst5Quest2name1_HORDE = Inst5Quest2name1
Inst5Quest2name2_HORDE = Inst5Quest2name2
Inst5Quest2name3_HORDE = Inst5Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst5Quest3_HORDE = Inst5Quest3
Inst5Quest3_HORDE_Level = Inst5Quest3_Level
Inst5Quest3_HORDE_Attain = Inst5Quest3_Attain
Inst5Quest3_HORDE_Aim = Inst5Quest3_Aim
Inst5Quest3_HORDE_Location = Inst5Quest3_Location
Inst5Quest3_HORDE_Note = Inst5Quest3_Note
Inst5Quest3_HORDE_Prequest = Inst5Quest3_Prequest
Inst5Quest3_HORDE_Folgequest = Inst5Quest3_Folgequest
--
Inst5Quest3name1_HORDE = Inst5Quest3name1
Inst5Quest3name2_HORDE = Inst5Quest3name2

--Quest 4 Horde
Inst5Quest4_HORDE = "4. 遗失的雷酒秘方"
Inst5Quest4_HORDE_Level = "55"
Inst5Quest4_HORDE_Attain = "50"
Inst5Quest4_HORDE_Aim = "把遗失的雷酒秘方交给卡加斯的薇薇安·拉格雷。"
Inst5Quest4_HORDE_Location = "暗法师薇薇安·拉格雷（荒芜之地 - 卡加斯; "..YELLOW.."2,47"..WHITE.."）"
Inst5Quest4_HORDE_Note = "前导任务由药剂师金格（幽暗城 - 炼金房; "..YELLOW.."50,68"..WHITE.."）给予。\n秘方在某个守卫身上，只要你破坏"..YELLOW.."[15]"..WHITE.."的酒桶这些守卫就会出现。"
Inst5Quest4_HORDE_Prequest = "有，薇薇安·拉格雷"
Inst5Quest4_HORDE_Folgequest = "无"
Inst5Quest4PreQuest_HORDE = "true"
--
Inst5Quest4name1_HORDE = "超强治疗药水"
Inst5Quest4name2_HORDE = "强效法力药水"
Inst5Quest4name3_HORDE = "迅捷木槌"
Inst5Quest4name4_HORDE = "叉刃巨斧"

--Quest 5 Horde  (same as Quest 6 Alliance)
Inst5Quest5_HORDE = "5. 山脉之心"
Inst5Quest5_HORDE_Level = Inst5Quest6_Level
Inst5Quest5_HORDE_Attain = Inst5Quest6_Attain
Inst5Quest5_HORDE_Aim = Inst5Quest6_Aim
Inst5Quest5_HORDE_Location = Inst5Quest6_Location
Inst5Quest5_HORDE_Note = Inst5Quest6_Note
Inst5Quest5_HORDE_Prequest = Inst5Quest6_Prequest
Inst5Quest5_HORDE_Folgequest = Inst5Quest6_Folgequest
-- No Rewards for this quest

--Quest 6 Horde
Inst5Quest6_HORDE = "6. 格杀勿论：黑铁矮人"
Inst5Quest6_HORDE_Level = "52"
Inst5Quest6_HORDE_Attain = "48"
Inst5Quest6_HORDE_Aim = "到黑石深渊去消灭那些邪恶的侵略者！军官高图斯要你去杀死15个铁怒卫士、10个铁怒狱卒和5个铁怒步兵。完成任务之后回去向他复命。"
Inst5Quest6_HORDE_Location = "通缉（荒芜之地 - 卡加斯; "..YELLOW.."3,47"..WHITE.."）"
Inst5Quest6_HORDE_Note = "矮人可在黑石深渊第一部分找到。\n卡加斯的高图斯在瞭望塔顶（荒芜之地; "..YELLOW.."5,47"..WHITE.."）。"
Inst5Quest6_HORDE_Prequest = "无"
Inst5Quest6_HORDE_Folgequest = "有，格杀勿论：高阶黑铁军官"
-- No Rewards for this quest

--Quest 7 Horde
Inst5Quest7_HORDE = "7. 格杀勿论：高阶黑铁军官"
Inst5Quest7_HORDE_Level = "54"
Inst5Quest7_HORDE_Attain = "49"
Inst5Quest7_HORDE_Aim = "到黑石深渊去消灭那些邪恶的侵略者！高图斯军阀要你杀死10个铁怒医师、10个铁怒士兵和10个铁怒军官。完成任务之后回去向他复命。"
Inst5Quest7_HORDE_Location = "通缉（荒芜之地 - 卡加斯; "..YELLOW.."3,47"..WHITE.."）"
Inst5Quest7_HORDE_Note = "矮人可以在"..YELLOW.."[11]"..WHITE.."贝尔加附近被找到。卡加斯的高图斯在瞭望塔顶（荒芜之地; "..YELLOW.."5,47"..WHITE.."）。\n任务开始于雷克斯洛特（荒芜之地 - 卡加斯; "..YELLOW.."5,47"..WHITE.."）。 格拉克·洛克鲁布位置在燃烧平原（"..YELLOW.."38,35"..WHITE.."）。 要绑定他并开始护送任务（精英），他的生命需要减少到低于50%。"
Inst5Quest7_HORDE_Prequest = "有，格杀勿论：黑铁矮人"
Inst5Quest7_HORDE_Folgequest = "有，格拉克·洛克鲁布 -> 押送囚徒（护送任务）"
Inst5Quest7FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 8 Horde
Inst5Quest8_HORDE = "8. 行动：杀死安格弗将军"
Inst5Quest8_HORDE_Level = "58"
Inst5Quest8_HORDE_Attain = "54"
Inst5Quest8_HORDE_Aim = "到黑石深渊去杀掉安格弗将军！当任务完成之后向军官高图斯复命。"
Inst5Quest8_HORDE_Location = "军官高图斯（荒芜之地 - 卡加斯; "..YELLOW.."5,47"..WHITE.."）"
Inst5Quest8_HORDE_Note = "安格弗将军位置在"..YELLOW.."[13]"..WHITE.."。注意：当他生命低于30%时，他会召唤帮手！"
Inst5Quest8_HORDE_Prequest = "有，押送囚徒"
Inst5Quest8_HORDE_Folgequest = "无"
Inst5Quest8FQuest_HORDE = "true"
--
Inst5Quest8name1_HORDE = "征服者勋章"

--Quest 9 Horde
Inst5Quest9_HORDE = "9. 机器的崛起"
Inst5Quest9_HORDE_Level = "58"
Inst5Quest9_HORDE_Attain = "52"
Inst5Quest9_HORDE_Aim = "找到并杀掉傀儡统帅阿格曼奇，将他的头交给鲁特维尔。你还需要从守卫着阿格曼奇的狂怒傀儡和战斗傀儡身上收集10块完整的元素核心。"
Inst5Quest9_HORDE_Location = "鲁特维尔·沃拉图斯（荒芜之地; "..YELLOW.."25,44"..WHITE.."）"
Inst5Quest9_HORDE_Note = "前导任务来自圣者塞朵拉·穆瓦丹尼（荒芜之地 - 卡加斯; "..YELLOW.."3,47"..WHITE.."）。\n你可以在"..YELLOW.."[14]"..WHITE.."发现阿格曼奇。"
Inst5Quest9_HORDE_Prequest = "有，机器的崛起"
Inst5Quest9_HORDE_Folgequest = "无"
Inst5Quest9PreQuest_HORDE = "true"
--
Inst5Quest9name1_HORDE = "蓝月披肩"
Inst5Quest9name2_HORDE = "雨法师斗篷"
Inst5Quest9name3_HORDE = "黑陶鳞片护甲"
Inst5Quest9name4_HORDE = "熔岩护手"

--Quest 10 Horde  (same as Quest 12 Alliance)
Inst5Quest10_HORDE = "10. 烈焰精华"
Inst5Quest10_HORDE_Level = Inst5Quest12_Level
Inst5Quest10_HORDE_Attain = Inst5Quest12_Attain
Inst5Quest10_HORDE_Aim = Inst5Quest12_Aim
Inst5Quest10_HORDE_Location = Inst5Quest12_Location
Inst5Quest10_HORDE_Note = Inst5Quest12_Note
Inst5Quest10_HORDE_Prequest = Inst5Quest12_Prequest
Inst5Quest10_HORDE_Folgequest = Inst5Quest12_Folgequest
Inst5Quest10PreQuest_HORDE = Inst5Quest12PreQuest
--
Inst5Quest10name1_HORDE = Inst5Quest12name1
Inst5Quest10name2_HORDE = Inst5Quest12name2
Inst5Quest10name3_HORDE = Inst5Quest12name3

--Quest 11 Horde
Inst5Quest11_HORDE = "11. 不和谐的烈焰"
Inst5Quest11_HORDE_Level = "52"
Inst5Quest11_HORDE_Attain = "48"
Inst5Quest11_HORDE_Aim = "到黑石山脉的采石场去干掉征服者派隆，然后向桑德哈特回报。"
Inst5Quest11_HORDE_Location = "桑德哈特（荒芜之地 - 卡加斯; "..YELLOW.."3,48"..WHITE.."）"
Inst5Quest11_HORDE_Note = "征服者派隆是副本门口外面的一个火元素精英。在黑石深渊"..YELLOW.."副本入口地图[1]"..WHITE.."。"
Inst5Quest11_HORDE_Prequest = "无"
Inst5Quest11_HORDE_Folgequest = "有，不和谐的火焰"
-- No Rewards for this quest

--Quest 12 Horde
Inst5Quest12_HORDE = "12. 不和谐的火焰"
Inst5Quest12_HORDE_Level = "56"
Inst5Quest12_HORDE_Attain = "48"
Inst5Quest12_HORDE_Aim = "进入黑石深渊并找到伊森迪奥斯。杀掉它，然后把你找到的信息汇报给桑德哈特。"
Inst5Quest12_HORDE_Location = "桑德哈特（荒芜之地 - 卡加斯; "..YELLOW.."3,48"..WHITE.."）"
Inst5Quest12_HORDE_Note = "伊森迪奥斯在"..YELLOW.."[10]"..WHITE.."。"
Inst5Quest12_HORDE_Prequest = "有，不和谐的烈焰"
Inst5Quest12_HORDE_Folgequest = "无"
Inst5Quest12FQuest_HORDE = "true"
--
Inst5Quest12name1_HORDE = "阳焰斗篷"
Inst5Quest12name2_HORDE = "夜暮手套"
Inst5Quest12name3_HORDE = "地穴恶魔护腕"
Inst5Quest12name4_HORDE = "坚定手套"

--Quest 13 Horde
Inst5Quest13_HORDE = "13. 最后的元素"
Inst5Quest13_HORDE_Level = "54"
Inst5Quest13_HORDE_Attain = "48"
Inst5Quest13_HORDE_Aim = "到黑石深渊去取得10份元素精华。你应该在那些作战傀儡和傀儡制造者身上找找，另外，薇薇安·拉格雷也提到了一些有关元素生物的话题……"
Inst5Quest13_HORDE_Location = "暗法师薇薇安·拉格雷（荒芜之地 - 卡加斯; "..YELLOW.."2,47"..WHITE.."）"
Inst5Quest13_HORDE_Note = "前导任务来自桑德哈特（荒芜之地 - 卡加斯; "..YELLOW.."3,48"..WHITE.."）。派隆就在副本入口处前。\n 每个元素生物都可能会掉落精华。"
Inst5Quest13_HORDE_Prequest = "有，不和谐的烈焰"
Inst5Quest13_HORDE_Folgequest = "无"
Inst5Quest13PreQuest_HORDE = "true"
--
Inst5Quest13name1_HORDE = "拉格雷的徽记之戒"

--Quest 14 Horde
Inst5Quest14_HORDE = "14. 指挥官哥沙克"
Inst5Quest14_HORDE_Level = "52"
Inst5Quest14_HORDE_Attain = "48"
Inst5Quest14_HORDE_Aim = "在黑石深渊里找到指挥官哥沙克。\n在那幅草图上画着的是一个铁栏后面的兽人，也许你应该到某个类似监狱的地方去找找看。"
Inst5Quest14_HORDE_Location = "神射手贾拉玛弗（荒芜之地 - 卡加斯; "..YELLOW.."5,47"..WHITE.."）"
Inst5Quest14_HORDE_Note = "前导任务来自桑德哈特（荒芜之地 - 卡加斯; "..YELLOW.."3,48"..WHITE.."）。派隆就在副本入口处前。\n你能在"..YELLOW.."[3]"..WHITE.."找到指挥官哥沙克。位于"..YELLOW.."[5]"..WHITE.."的审讯官格斯塔恩掉落打开监狱的钥匙。如果你跟他交谈并开始下一个任务，敌人便会出现。"
Inst5Quest14_HORDE_Prequest = "有，不和谐的烈焰"
Inst5Quest14_HORDE_Folgequest = "有，出了什么事？"
Inst5Quest14PreQuest_HORDE = "true"

--Quest 15 Horde
Inst5Quest15_HORDE = "15. 拯救公主"
Inst5Quest15_HORDE_Level = "59"
Inst5Quest15_HORDE_Attain = "50"
Inst5Quest15_HORDE_Aim = "杀掉达格兰·索瑞森大帝，然后将铁炉堡公主茉艾拉·铜须从他的邪恶诅咒中拯救出来。"
Inst5Quest15_HORDE_Location = "萨尔（奥格瑞玛; "..YELLOW.."31,37"..WHITE.."）"
Inst5Quest15_HORDE_Note = "与卡兰·巨锤和萨尔交谈后，你将得到这个任务。\n达格兰·索瑞森大帝在"..YELLOW.."[21]"..WHITE.."。虽然公主会治疗达格兰，但是如果想完成任务，就一定不要杀死公主。切记，切记！！！尝试打断公主的治疗施法。"
Inst5Quest15_HORDE_Prequest = "有，指挥官哥沙克"
Inst5Quest15_HORDE_Folgequest = "有，拯救公主？"
Inst5Quest15FQuest_HORDE = "true"
--
Inst5Quest15name1_HORDE = "萨尔的决心"
Inst5Quest15name2_HORDE = "奥格瑞玛之眼"

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst5Quest16_HORDE = Inst5Quest16
Inst5Quest16_HORDE_Level = Inst5Quest16_Level
Inst5Quest16_HORDE_Attain = Inst5Quest16_Attain
Inst5Quest16_HORDE_Aim = Inst5Quest16_Aim
Inst5Quest16_HORDE_Location = Inst5Quest16_Location
Inst5Quest16_HORDE_Note = Inst5Quest16_Note
Inst5Quest16_HORDE_Prequest = Inst5Quest16_Prequest
Inst5Quest16_HORDE_Folgequest = Inst5Quest16_Folgequest
-- No Rewards for this quest

--Quest 17 Horde  (same as Quest 17 Alliance)
Inst5Quest17_HORDE = Inst5Quest17
Inst5Quest17_HORDE_Level = Inst5Quest17_Level
Inst5Quest17_HORDE_Attain = Inst5Quest17_Attain
Inst5Quest17_HORDE_Aim = Inst5Quest17_Aim
Inst5Quest17_HORDE_Location = Inst5Quest17_Location
Inst5Quest17_HORDE_Note = Inst5Quest17_Note
Inst5Quest17_HORDE_Prequest = Inst5Quest17_Prequest
Inst5Quest17_HORDE_Folgequest = Inst5Quest17_Folgequest
-- No Rewards for this quest

--Quest 18 Horde  (same as Quest 18 Alliance)
Inst5Quest18_HORDE = Inst5Quest18
Inst5Quest18_HORDE_Level = Inst5Quest18_Level
Inst5Quest18_HORDE_Attain = Inst5Quest18_Attain
Inst5Quest18_HORDE_Aim = Inst5Quest18_Aim
Inst5Quest18_HORDE_Location = Inst5Quest18_Location
Inst5Quest18_HORDE_Note = Inst5Quest18_Note
Inst5Quest18_HORDE_Prequest = Inst5Quest18_Prequest
Inst5Quest18_HORDE_Folgequest = Inst5Quest18_Folgequest
-- No Rewards for this quest



--------------- INST6 - Blackwing Lair (BWL) ---------------

Inst6Story = {
  ["Page1"] = "黑翼之巢，它位于黑石塔的最顶端。奈法利安就在那里进行着他的秘密计划的最后步骤，并准备摧毁拉格纳罗斯的势力，最终统治整个艾泽拉斯。",
  ["Page2"] = "座落在黑石山脉中的巨型要塞是由矮人建筑大师弗兰克罗恩·铸铁设计的，作为力量和实力的象征，这座要塞被邪恶的黑铁矮人占据了数个世纪之久。但是，黑龙死亡之翼的儿子奈法利安对这座要塞有着别的打算。他和他的黑龙军团占据了黑石塔的上层区域，并与黑石深渊中的那些侍奉火焰之王拉格纳罗斯的黑铁矮人不断交战。拉格纳罗斯找到了为岩石赋予生命的方法，并准备制造一支无坚不摧的傀儡大军，以此来帮助他实施征服整个黑石山的计划。",
  ["Page3"] = "而奈法利安则发誓要毁灭拉格纳罗斯，因此他近期以来加速了扩张军队的步伐，就像他的父亲死亡之翼曾经尝试过的那样。虽然死亡之翼最终失败了，但看起来奈法利安很有希望获得成功。他对于权力的疯狂渴求甚至引起了红龙军团的警觉——他们一直是黑龙最强大的敌人。不过，即便奈法利安的目标非常明显，他所采用的手段却不为人知。但是据信他正在尝试杂交各种颜色的龙以制造出最强大的战士。\n \n奈法利安的藏身之所被称为黑翼之巢，它位于黑石塔的最顶端。奈法利安就在那里进行着他的秘密计划的最后步骤，并准备摧毁拉格纳罗斯的势力，最终统治整个艾泽拉斯。",
  ["MaxPages"] = "3",
};
Inst6Caption = "黑翼之巢"
Inst6Caption2 = "黑翼之巢（故事背景 第1部分）"
Inst6Caption3 = "黑翼之巢（故事背景 第2部分）"

Inst6QAA = "3 个任务"
Inst6QAH = "3 个任务"

--Quest 1 Alliance
Inst6Quest1 = "1. 奈法里奥斯的腐蚀"
Inst6Quest1_Level = "60"
Inst6Quest1_Attain = "60"
Inst6Quest1_Aim = "干掉奈法利安并拿到红色节杖碎片。把红色节杖碎片带给塔纳利斯时光之穴门口的阿纳克洛斯。你必须在5小时之内完成这个任务。"
Inst6Quest1_Location = "堕落的瓦拉斯塔兹（黑翼之巢; "..YELLOW.."[2]"..WHITE.."）"
Inst6Quest1_Note = "只有一人能拾取碎片。阿纳克洛斯（塔纳利斯 - 时光之穴; "..YELLOW.."65,49"..WHITE.."）"
Inst6Quest1_Prequest = "无"
Inst6Quest1_Folgequest = "无"
-- No Rewards for this quest

--Quest 2 Alliance
Inst6Quest2 = "2. 黑石之王"
Inst6Quest2_Level = "60"
Inst6Quest2_Attain = "60"
Inst6Quest2_Aim = "将奈法利安的头颅交给暴风城的伯瓦尔·弗塔根公爵。 "
Inst6Quest2_Location = "奈法利安的头颅（奈法利安掉落; "..YELLOW.."[9]"..WHITE.."）"
Inst6Quest2_Note = "伯瓦尔·弗塔根公爵（暴风城 - 暴风要塞; "..YELLOW.."78,20"..WHITE.."）。接下来前往艾法希比元帅（暴风城 - 英雄谷; "..YELLOW.."67,72"..WHITE.."）领取奖励。"
Inst6Quest2_Prequest = "无"
Inst6Quest2_Folgequest = "有，黑石之王"
--
Inst6Quest2name1 = "屠龙大师勋章"
Inst6Quest2name2 = "屠龙大师宝珠"
Inst6Quest2name3 = "屠龙大师之戒"

--Quest 3 Alliance
Inst6Quest3 = "3. 唯一的领袖"
Inst6Quest3_Level = "60"
Inst6Quest3_Attain = "60"
Inst6Quest3_Aim = "将勒什雷尔的头颅交给希利苏斯塞纳里奥要塞的流沙守望者巴里斯托尔斯。 "
Inst6Quest3_Location = "勒什雷尔的头颅（勒什雷尔掉落; "..YELLOW.."[3]"..WHITE.."）"
Inst6Quest3_Note = "只有一人能拾取头颅。（现版本不再限一人）"
Inst6Quest3_Prequest = "无"
Inst6Quest3_Folgequest = "有，正义之路"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst6Quest1_HORDE = Inst6Quest1
Inst6Quest1_HORDE_Level = Inst6Quest1_Level
Inst6Quest1_HORDE_Attain = Inst6Quest1_Attain
Inst6Quest1_HORDE_Aim = Inst6Quest1_Aim
Inst6Quest1_HORDE_Location = Inst6Quest1_Location
Inst6Quest1_HORDE_Note = Inst6Quest1_Note
Inst6Quest1_HORDE_Prequest = Inst6Quest1_Prequest
Inst6Quest1_HORDE_Folgequest = Inst6Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde
Inst6Quest2_HORDE = "2. 黑石之王"
Inst6Quest2_HORDE_Level = "60"
Inst6Quest2_HORDE_Attain = "60"
Inst6Quest2_HORDE_Aim = "将奈法利安的头颅交给奥格瑞玛的萨尔。"
Inst6Quest2_HORDE_Location = "奈法利安的头颅（奈法利安掉落; "..YELLOW.."[9]"..WHITE.."）"
Inst6Quest2_HORDE_Note = "下一步前往萨鲁法尔大王（奥格瑞玛 - 力量谷; "..YELLOW.."51,76"..WHITE.."）领取奖励。"
Inst6Quest2_HORDE_Prequest = "无"
Inst6Quest2_HORDE_Folgequest = "有，黑石之王"
--
Inst6Quest2name1_HORDE = "屠龙大师勋章"
Inst6Quest2name2_HORDE = "屠龙大师宝珠"
Inst6Quest2name3_HORDE = "屠龙大师之戒"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst6Quest3_HORDE = Inst6Quest3
Inst6Quest3_HORDE_Level = Inst6Quest3_Level
Inst6Quest3_HORDE_Attain = Inst6Quest3_Attain
Inst6Quest3_HORDE_Aim = Inst6Quest3_Aim
Inst6Quest3_HORDE_Location = Inst6Quest3_Location
Inst6Quest3_HORDE_Note = Inst6Quest3_Note
Inst6Quest3_HORDE_Prequest = Inst6Quest3_Prequest
Inst6Quest3_HORDE_Folgequest = Inst6Quest3_Folgequest
-- No Rewards for this quest



--------------- INST7 - Blackfathom Deeps (BFD) ---------------

Inst7Story = "位于灰谷佐拉姆海岸的黑暗深渊曾经是为供奉暗夜精灵月神艾露尼尔建造的。然而，在大爆炸中，神庙受到极大的冲击然后沉入了海中。它一直保持着原样——直到，其蕴含的古老的力量吸引来了纳迦和萨特。传说，古代怪兽阿库麦尔就居住在神庙遗迹中。作为古代之神最喜欢的宠物之一，阿库麦尔就一直生活在这个地区进行捕食。在阿库麦尔的吸引下，一群被称作幕光之锤的教徒也聚集在这里从事邪恶的勾当。"
Inst7Caption = "黑暗深渊"
Inst7QAA = "6 个任务"
Inst7QAH = "5 个任务"

--Quest 1 Alliance
Inst7Quest1 = "1. 深渊中的知识"
Inst7Quest1_Level = "23"
Inst7Quest1_Attain = "10"
Inst7Quest1_Aim = "把洛迦里斯手稿带给铁炉堡的葛利·硬骨。"
Inst7Quest1_Location = "葛利·硬骨（铁炉堡 - 荒弃的洞穴; "..YELLOW.."50,5"..WHITE.."）"
Inst7Quest1_Note = "你可以在靠近"..YELLOW.."[2]"..WHITE.."的水中找到手稿。"
Inst7Quest1_Prequest = "无"
Inst7Quest1_Folgequest = "无"
--
Inst7Quest1name1 = "鼓励之戒"

--Quest 2 Alliance
Inst7Quest2 = "2. 研究堕落"
Inst7Quest2_Level = "24"
Inst7Quest2_Attain = "18"
Inst7Quest2_Aim = "奥伯丁的戈沙拉·夜语需要8块堕落者的脑干。"
Inst7Quest2_Location = "戈沙拉·夜语（黑海岸 - 奥伯丁; "..YELLOW.."38,43"..WHITE.."）"
Inst7Quest2_Note = "前导任务可以从阿古斯·夜语（暴风城 - 花园; "..YELLOW.."21,55"..WHITE.."）处得到。 黑暗深渊副本里面和门前的所有纳迦都可能掉落脑干。"
Inst7Quest2_Prequest = "有，遥远的旅途"
Inst7Quest2_Folgequest = "无"
Inst7Quest2PreQuest = "true"
--
Inst7Quest2name1 = "虫壳护腕"
Inst7Quest2name2 = "教士斗篷"

--Quest 3 Alliance
Inst7Quest3 = "3. 寻找塞尔瑞德"
Inst7Quest3_Level = "24"
Inst7Quest3_Attain = "18"
Inst7Quest3_Aim = "到黑色深渊去找到银月守卫塞尔瑞德。"
Inst7Quest3_Location = "哨兵山德拉斯（达纳苏斯 - 工匠区; "..YELLOW.."55,24"..WHITE.."）"
Inst7Quest3_Note = "你可以在"..YELLOW.."[4]"..WHITE.."找到银月守卫塞尔瑞德。"
Inst7Quest3_Prequest = "无"
Inst7Quest3_Folgequest = "有，黑暗深渊中的恶魔"
-- No Rewards for this quest

--Quest 4 Alliance
Inst7Quest4 = "4. 黑暗深渊中的恶魔"
Inst7Quest4_Level = "27"
Inst7Quest4_Attain = "18"
Inst7Quest4_Aim = "把梦游者克尔里斯的头颅交给达纳苏斯的哨兵塞尔高姆。"
Inst7Quest4_Location = "哨兵塞尔瑞德（黑暗深渊; "..YELLOW.."[4]"..WHITE.."）"
Inst7Quest4_Note = "克尔里斯在"..YELLOW.."[8]"..WHITE.."。你可以哨兵找到塞尔高姆（达纳苏斯 - 工匠区; "..YELLOW.."55,24"..WHITE.."）。注意！如果你点燃了克尔里斯旁边的火焰，敌人会出现并攻击你。"
Inst7Quest4_Prequest = "有，寻找塞尔瑞德"
Inst7Quest4_Folgequest = "无"
Inst7Quest4FQuest = "true"
--
Inst7Quest4name1 = "墓碑节杖"
Inst7Quest4name2 = "极光圆盾"

--Quest 5 Alliance
Inst7Quest5 = "5. 暮光之锤的末日"
Inst7Quest5_Level = "25"
Inst7Quest5_Attain = "20"
Inst7Quest5_Aim = "收集10个暮光坠饰，把它们交给达纳苏斯的银月守卫玛纳杜斯。"
Inst7Quest5_Location = "银月守卫玛纳杜斯（达纳苏斯 - 工匠区; "..YELLOW.."55,23"..WHITE.."）"
Inst7Quest5_Note = "每个暮光敌人都会掉落坠饰。"
Inst7Quest5_Prequest = "无"
Inst7Quest5_Folgequest = "无"
--
Inst7Quest5name1 = "云光长靴"
Inst7Quest5name2 = "赤木束带"

--Quest 6 Alliance
Inst7Quest6 = "6. 索兰鲁克宝珠（术士任务）"
Inst7Quest6_Level = "25"
Inst7Quest6_Attain = "20"
Inst7Quest6_Aim = "找到3块索兰鲁克宝珠的碎片和1块索兰鲁克宝珠的大碎片，把它们交给贫瘠之地的杜安·卡汉。"
Inst7Quest6_Location = "杜安·卡汉（贫瘠之地; "..YELLOW.."49,57"..WHITE.."）"
Inst7Quest6_Note = "只有术士才能得到这个任务！3块索兰鲁克宝珠的碎片，你可以从"..YELLOW.."[黑暗深渊]"..WHITE.."的暮光侍僧那里得到。那块索兰鲁克宝珠的大碎片，你要去"..YELLOW.."[影牙城堡]"..WHITE.."找影牙魔魂狼人。"
Inst7Quest6_Prequest = "无"
Inst7Quest6_Folgequest = "无"
--
Inst7Quest6name1 = "索兰鲁克宝珠"
Inst7Quest6name2 = "索拉鲁克法杖"


--Quest 1 Horde
Inst7Quest1_HORDE = "1. 阿库麦尔水晶"
Inst7Quest1_HORDE_Level = "22"
Inst7Quest1_HORDE_Attain = "17"
Inst7Quest1_HORDE_Aim = "收集20颗阿库麦尔蓝宝石，把它们交给灰谷的耶努萨克雷。"
Inst7Quest1_HORDE_Location = "耶努萨克雷（灰谷 - 佐拉姆加前哨站; "..YELLOW.."11,33"..WHITE.."）"
Inst7Quest1_HORDE_Note = "前导任务《帮助耶努萨克雷》可以在苏纳曼（石爪山脉 - 烈日石居; "..YELLOW.."47,64"..WHITE.."）接到。蓝宝石多生长在通往黑暗深渊入口的那条通道的洞穴墙壁上。"
Inst7Quest1_HORDE_Prequest = "有，帮助耶努萨克雷"
Inst7Quest1_HORDE_Folgequest = "无"
Inst7Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst7Quest2_HORDE = "2. 上古之神的仆从"
Inst7Quest2_HORDE_Level = "26"
Inst7Quest2_HORDE_Attain = "18"
Inst7Quest2_HORDE_Aim = "把潮湿的便笺交给灰谷的耶努萨克雷。 -> 杀掉黑暗深渊里的洛古斯·杰特，然后向灰谷的耶努萨克雷复命。"
Inst7Quest2_HORDE_Location = "潮湿的便笺（掉落）（请见注释）"
Inst7Quest2_HORDE_Note = "潮湿的便笺可从黑暗深渊海潮祭司处得到（5% 掉落几率）。然后去耶努萨克雷（灰谷 - 佐拉姆加前哨站; "..YELLOW.."11,33"..WHITE.."）。洛古斯·杰特在"..YELLOW.."[6]"..WHITE.."。"
Inst7Quest2_HORDE_Prequest = "无"
Inst7Quest2_HORDE_Folgequest = "无"
--
Inst7Quest2name1_HORDE = "巨拳指环 "
Inst7Quest2name2_HORDE = "栗壳衬肩"

--Quest 3 Horde
Inst7Quest3_HORDE = "3. 废墟之间"
Inst7Quest3_HORDE_Level = "27"
Inst7Quest3_HORDE_Attain = "21"
Inst7Quest3_HORDE_Aim = "把深渊之核交给灰谷佐拉姆加前哨站里的耶努萨克雷。"
Inst7Quest3_HORDE_Location = "耶努萨克雷（灰谷 - 佐拉姆加前哨站; "..YELLOW.."11,33"..WHITE.."）"
Inst7Quest3_HORDE_Note = "深渊之核在"..YELLOW.."[7]"..WHITE.."区水域里。当你得到深远之核后，阿奎尼斯男爵会出现并攻击你。他会掉落一件任务物品，你要把它带给耶努萨克雷。"
Inst7Quest3_HORDE_Prequest = "无"
Inst7Quest3_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Horde
Inst7Quest4_HORDE = "4. 黑暗深渊中的恶魔"
Inst7Quest4_HORDE_Level = "27"
Inst7Quest4_HORDE_Attain = "19"
Inst7Quest4_HORDE_Aim = "把梦游者克尔里斯的头颅带回雷霆崖交给巴珊娜·符文图腾 。"
Inst7Quest4_HORDE_Location = "银月守卫塞尔瑞德（黑暗深渊; "..YELLOW.."[4]"..WHITE.."）"
Inst7Quest4_HORDE_Note = "克尔里斯在"..YELLOW.."[8]"..WHITE.."。巴珊娜·符文图腾可以在（雷霆崖 - 长者高地 "..YELLOW.."70,33"..WHITE.."）处找到。注意！如果你点燃了克尔里斯身旁的火焰，会出现敌人攻击你。"
Inst7Quest4_HORDE_Prequest = "无"
Inst7Quest4_HORDE_Folgequest = "无"
--
Inst7Quest4name1_HORDE = "墓碑节杖"
Inst7Quest4name2_HORDE = "极光圆盾"

--Quest 5 Horde  (same as Quest 6 Alliance)
Inst7Quest5_HORDE = "5. 索兰鲁克宝珠（术士任务）"
Inst7Quest5_HORDE_Level = "25"
Inst7Quest5_HORDE_Attain = "20"
Inst7Quest5_HORDE_Aim = Inst7Quest6_Aim
Inst7Quest5_HORDE_Location = Inst7Quest6_Location
Inst7Quest5_HORDE_Note = Inst7Quest6_Note
Inst7Quest5_HORDE_Prequest = Inst7Quest6_Prequest
Inst7Quest5_HORDE_Folgequest = Inst7Quest6_Folgequest
--
Inst7Quest5name1_HORDE = Inst7Quest6name1
Inst7Quest5name2_HORDE = Inst7Quest6name2



--------------- INST8 - Lower Blackrock Spire (LBRS) ---------------

Inst8Story = "黑石深渊深处的巨大堡垒是由矮人建筑大师弗兰克罗恩·铸铁所设计的。这个堡垒是矮人力量的象征并被邪恶的黑铁矮人占据了数个世纪。然而，奈法利安——死亡之翼狡猾的儿子——对这个巨大的堡垒别有意图。他和他的黑龙军团占据了上层黑石塔并向占据着黑石深渊的黑铁矮人宣战。奈法利安知道矮人是由强大的火元素拉格纳罗斯所领导的，所以他立志要摧毁他的敌人并将黑石深渊全都占为己有。"
Inst8Caption = "黑石塔下层"
Inst8QAA = "14 个任务"
Inst8QAH = "14 个任务"

--Quest 1 Alliance
Inst8Quest1 = "1. 最后的石板"
Inst8Quest1_Level = "58"
Inst8Quest1_Attain = "55"
Inst8Quest1_Aim = "将第五块和第六块摩沙鲁石板交给塔纳利斯的勘查员詹斯·铁靴。"
Inst8Quest1_Location = "勘查员詹斯·铁靴（塔纳利斯 - 热砂港; "..YELLOW.."66,23"..WHITE.."）"
Inst8Quest1_Note = "你可以在"..YELLOW.."[7]"..WHITE.."和"..YELLOW.."[9]"..WHITE.."附近找到石板。\n任务奖励来自《面对叶基亚》。 你可以在勘查员詹斯·铁靴旁边找到叶基亚。"
Inst8Quest1_Prequest = "有，失落的摩沙鲁石板"
Inst8Quest1_Folgequest = "有，面对叶基亚"
Inst8Quest1PreQuest = "true"
--
Inst8Quest1name1 = "褪色的哈卡莱披风"
Inst8Quest1name2 = "破碎的哈卡莱披风"

--Quest 2 Alliance
Inst8Quest2 = "2. 基布雷尔的特殊宠物"
Inst8Quest2_Level = "59"
Inst8Quest2_Attain = "55"
Inst8Quest2_Aim = "到黑石塔去找到血斧座狼幼崽。使用笼子来捕捉这些凶猛的小野兽，然后把笼中的座狼幼崽交给基布雷尔。"
Inst8Quest2_Location = "基布雷尔（燃烧平原 - 烈焰峰; "..YELLOW.."65,22"..WHITE.."）"
Inst8Quest2_Note = "你可以在"..YELLOW.."[17]"..WHITE.."找到座狼幼崽。"
Inst8Quest2_Prequest = "无"
Inst8Quest2_Folgequest = "无"
--
Inst8Quest2name1 = "座狼笼"

--Quest 3 Alliance
Inst8Quest3 = "3. 蜘蛛卵"
Inst8Quest3_Level = "59"
Inst8Quest3_Attain = "55"
Inst8Quest3_Aim = "到黑石塔去为基布雷尔收集15枚尖塔蜘蛛卵。"
Inst8Quest3_Location = "基布雷尔（燃烧平原 - 烈焰峰; "..YELLOW.."65,22"..WHITE.."）"
Inst8Quest3_Note = "你可以在"..YELLOW.."[13]"..WHITE.."附近找到蜘蛛卵。"
Inst8Quest3_Prequest = "无"
Inst8Quest3_Folgequest = "无"
--
Inst8Quest3name1 = "烟网蜘蛛笼"

--Quest 4 Alliance
Inst8Quest4 = "4. 蛛后的乳汁"
Inst8Quest4_Level = "60"
Inst8Quest4_Attain = "55"
Inst8Quest4_Aim = "你可以在黑石塔的中心地带找到烟网蛛后。与她战斗，让她在你体内注入毒汁。如果你有能力的话，就杀死她吧。当你中毒之后，回到狼狈不堪的约翰那儿，他会从你的身体里抽取这些‘蛛后的乳汁’。 "
Inst8Quest4_Location = "狼狈不堪的约翰（燃烧平原 - 烈焰峰; "..YELLOW.."65,23"..WHITE.."）"
Inst8Quest4_Note = "烟网蛛后在"..YELLOW.."[13]"..WHITE..".如果中毒后解除，那么任务就会失败。"
Inst8Quest4_Prequest = "无"
Inst8Quest4_Folgequest = "无"
--
Inst8Quest4name1 = "约翰的无尽之杯"

--Quest 5 Alliance
Inst8Quest5 = "5. 座狼之源"
Inst8Quest5_Level = "59"
Inst8Quest5_Attain = "55"
Inst8Quest5_Aim = "到黑石塔去摧毁那里的座狼源头。当你离开的时候，赫林迪斯喊出了一个名字：哈雷肯。这个词就是兽人语中‘座狼’的意思。"
Inst8Quest5_Location = "赫林迪斯·河角（燃烧平原 - 摩根的岗哨; "..YELLOW.."5,47"..WHITE.."）"
Inst8Quest5_Note = "哈雷肯在"..YELLOW.."[17]"..WHITE.."。"
Inst8Quest5_Prequest = "无"
Inst8Quest5_Folgequest = "无"
--
Inst8Quest5name1 = "阿斯托里长袍"
Inst8Quest5name2 = "吊钩外套"
Inst8Quest5name3 = "碧鳞胸甲"

--Quest 6 Alliance
Inst8Quest6 = "6. 乌洛克"
Inst8Quest6_Level = "60"
Inst8Quest6_Attain = "55"
Inst8Quest6_Aim = "阅读瓦罗什的卷轴。将瓦罗什的蟑螂交给他。"
Inst8Quest6_Location = "瓦罗什（黑石塔下层; "..YELLOW.."[2]"..WHITE.."）"
Inst8Quest6_Note = "要得到瓦罗什的蟑螂，你必须首先杀死乌洛克"..YELLOW.."[15]"..WHITE.."。要完成召唤，你需要长矛和 欧莫克大王的头颅"..YELLOW.."[5]"..WHITE.."。长矛在"..YELLOW.."[3]"..WHITE.."。在召唤出乌洛克之前，会出现几群食人魔，你可以用长矛来伤害它们。"
Inst8Quest6_Prequest = "无"
Inst8Quest6_Folgequest = "无"
--
Inst8Quest6name1 = "棱石护符"

--Quest 7 Alliance
Inst8Quest7 = "7. 比修的装置"
Inst8Quest7_Level = "59"
Inst8Quest7_Attain = "55"
Inst8Quest7_Aim = "找到比修的装置并把它们还给她。祝你好运！"
Inst8Quest7_Location = "比修（黑石塔下层; "..YELLOW.."[3]"..WHITE.."）"
Inst8Quest7_Note = "你可以在前往烟网蛛后的路上找到比修的装置"..YELLOW.."[13]"..WHITE.."。\n麦克斯韦元帅（燃烧平原 - 摩根的岗哨; "..YELLOW.."84,58"..WHITE.."）。"
Inst8Quest7_Prequest = "无"
Inst8Quest7_Folgequest = "有，给麦克斯韦尔的消息"
-- No Rewards for this quest

--Quest 8 Alliance
Inst8Quest8 = "8. 麦克斯韦尔的任务"
Inst8Quest8_Level = "59"
Inst8Quest8_Attain = "57"
Inst8Quest8_Aim = "到黑石塔去消灭指挥官沃恩、欧莫克大王和维姆萨拉克。完成任务之后回到麦克斯韦尔元帅处复命。"
Inst8Quest8_Location = "麦克斯韦尔（燃烧平原 - 摩根的岗哨; "..YELLOW.."84,58"..WHITE.."）"
Inst8Quest8_Note = "指挥官沃恩在"..YELLOW.."[9]"..WHITE.."，欧莫克大王在"..YELLOW.."[5]"..WHITE.."，维姆萨拉克在"..YELLOW.."[19]"..WHITE.."。"
Inst8Quest8_Prequest = "有，给麦克斯韦尔的消息"
Inst8Quest8_Folgequest = "无"
Inst8Quest8FQuest = "true"
--
Inst8Quest8name1 = "维姆萨拉克的镣铐"
Inst8Quest8name2 = "欧莫克的瘦身腰带"
Inst8Quest8name3 = "哈雷肯的笼口"
Inst8Quest8name4 = "沃什加斯的绳索"
Inst8Quest8name5 = "沃恩的邪恶之握"

--Quest 9 Alliance
Inst8Quest9 = "9. 晋升印章"
Inst8Quest9_Level = "60"
Inst8Quest9_Attain = "57"
Inst8Quest9_Aim = "找到三块命令宝石：燃棘宝钻、尖石宝钻和血斧宝钻。把它们和原始晋升印章一起交给维埃兰."
Inst8Quest9_Location = "维埃兰（黑石塔下层; "..YELLOW.."[1]"..WHITE.."）"
Inst8Quest9_Note = "燃棘宝钻从欧莫克大王"..YELLOW.."[5]"..WHITE.."，尖石宝钻从指挥官沃恩"..YELLOW.."[9]"..WHITE.."，血斧宝钻从维姆萨拉克"..YELLOW.."[19]"..WHITE.."。原始晋升印章是黑石塔所有小怪掉落，完成这个之后你就能得到黑石塔上层的钥匙。"
Inst8Quest9_Prequest = "无"
Inst8Quest9_Folgequest = "有，晋升印章"
-- No Rewards for this quest

--Quest 10 Alliance
Inst8Quest10 = "10. 达基萨斯将军的命令"
Inst8Quest10_Level = "60"
Inst8Quest10_Attain = "55"
Inst8Quest10_Aim = "把达基萨斯将军的命令交给燃烧平原的麦克斯韦尔元帅。"
Inst8Quest10_Location = "达基萨斯将军的命令（维姆萨拉克掉落; "..YELLOW.."[19]"..WHITE.."）"
Inst8Quest10_Note = "麦克斯韦尔元帅（燃烧平原 - 摩根的岗哨; "..YELLOW.."84,58"..WHITE.."）"
Inst8Quest10_Prequest = "无"
Inst8Quest10_Folgequest = "有，达基萨斯将军之死（"..YELLOW.."黑石塔上层"..WHITE.."）"
-- No Rewards for this quest

--Quest 11 Alliance
Inst8Quest11 = "11. 瓦塔拉克饰品的左瓣"
Inst8Quest11_Level = "60"
Inst8Quest11_Attain = "60"
Inst8Quest11_Aim = "使用召唤火盆召唤出莫尔·灰蹄的灵魂，然后杀掉他。完成之后，将召唤火盆与瓦塔拉克饰品的左瓣还给黑石山的伯德雷。"
Inst8Quest11_Location = "伯德雷（黑石山; "..YELLOW.."副本入口地图[D]"..WHITE.."）"
Inst8Quest11_Note = "你需要超维度幽灵显形器才能看到伯德雷，你可以从《寻找安泰恩》任务得到它。\n\n莫尔·灰蹄在"..YELLOW.."[9]"..WHITE.."召唤。"
Inst8Quest11_Prequest = "有，重要的材料"
Inst8Quest11_Folgequest = "有，奥卡兹岛在你前方……"
Inst8Quest11PreQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst8Quest12 = "12. 瓦塔拉克饰品的右瓣"
Inst8Quest12_Level = "60"
Inst8Quest12_Attain = "60"
Inst8Quest12_Aim = "在比斯巨兽的房间里使用召唤火盆，召唤瓦塔拉克公爵。杀死他，对尸体使用瓦塔拉克的饰品。然后将瓦塔拉克的饰品还给瓦塔拉克公爵之魂。"
Inst8Quest12_Location = "伯德雷（黑石山; "..YELLOW.."副本入口地图[D]"..WHITE.."）"
Inst8Quest12_Note = "你需要超维度幽灵显形器才能看到伯德雷。你可以从《寻找安泰恩》任务得到它。\n\n莫尔·灰蹄在"..YELLOW.."[9]"..WHITE.."召唤。"
Inst8Quest12_Prequest = "有，更多重要的材料"
Inst8Quest12_Folgequest = "有，最后的准备（"..YELLOW.."黑石塔上层"..WHITE.."）"
Inst8Quest12PreQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst8Quest13 = "13. 沃什加斯的蛇石（锻造-铸剑大师任务）"
Inst8Quest13_Level = "60"
Inst8Quest13_Attain = "51"
Inst8Quest13_Aim = "到黑石塔去杀死暗影猎手沃什加斯，将沃什加斯的蛇石交给基尔拉姆。"
Inst8Quest13_Location = "基尔拉姆（冬泉谷 - 永望镇; "..YELLOW.."61,37"..WHITE.."）"
Inst8Quest13_Note = "暗影猎手沃什加斯在"..YELLOW.."[7]"..WHITE.."。"
Inst8Quest13_Prequest = "无"
Inst8Quest13_Folgequest = "无"
--
Inst8Quest13name1 = "设计图：黎明之刃"

--Quest 14 Alliance
Inst8Quest14 = "14. 火热的死亡"
Inst8Quest14_Level = "60"
Inst8Quest14_Attain = "58"
Inst8Quest14_Aim = "世界上一定有人知道关于这副手套的事情，祝你好运！"
Inst8Quest14_Location = "人类的残骸（黑石塔下层; "..YELLOW.."[9]"..WHITE.."）"
Inst8Quest14_Note = "煅造任务。确保从人类残骸"..YELLOW.."[11]"..WHITE.."附近拿到这个板甲手套，交给玛雷弗斯·暗锤（冬泉谷 - 永望镇; "..YELLOW.."61,39"..WHITE.."）。 "
Inst8Quest14_Prequest = "无"
Inst8Quest14_Folgequest = "有，炽热板甲护手"
--
Inst8Quest14name1 = "设计图：炽热板甲护手 "
Inst8Quest14name2 = "炽热板甲护手"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst8Quest1_HORDE = Inst8Quest1
Inst8Quest1_HORDE_Level = Inst8Quest1_Level
Inst8Quest1_HORDE_Attain = Inst8Quest1_Attain
Inst8Quest1_HORDE_Aim = Inst8Quest1_Aim
Inst8Quest1_HORDE_Location = Inst8Quest1_Location
Inst8Quest1_HORDE_Note = Inst8Quest1_Note
Inst8Quest1_HORDE_Prequest = Inst8Quest1_Prequest
Inst8Quest1_HORDE_Folgequest = Inst8Quest1_Folgequest
Inst8Quest1PreQuest_HORDE = Inst8Quest1PreQuest
--
Inst8Quest1name1_HORDE = Inst8Quest1name1
Inst8Quest1name2_HORDE = Inst8Quest1name2

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst8Quest2_HORDE = Inst8Quest2
Inst8Quest2_HORDE_Level = Inst8Quest2_Level
Inst8Quest2_HORDE_Attain = Inst8Quest2_Attain
Inst8Quest2_HORDE_Aim = Inst8Quest2_Aim
Inst8Quest2_HORDE_Location = Inst8Quest2_Location
Inst8Quest2_HORDE_Note = Inst8Quest2_Note
Inst8Quest2_HORDE_Prequest = Inst8Quest2_Prequest
Inst8Quest2_HORDE_Folgequest = Inst8Quest2_Folgequest
--
Inst8Quest2name1_HORDE = Inst8Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst8Quest3_HORDE = Inst8Quest3
Inst8Quest3_HORDE_Level = Inst8Quest3_Level
Inst8Quest3_HORDE_Attain = Inst8Quest3_Attain
Inst8Quest3_HORDE_Aim = Inst8Quest3_Aim
Inst8Quest3_HORDE_Location = Inst8Quest3_Location
Inst8Quest3_HORDE_Note = Inst8Quest3_Note
Inst8Quest3_HORDE_Prequest = Inst8Quest3_Prequest
Inst8Quest3_HORDE_Folgequest = Inst8Quest3_Folgequest
--
Inst8Quest3name1_HORDE = Inst8Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst8Quest4_HORDE = Inst8Quest4
Inst8Quest4_HORDE_Level = Inst8Quest4_Level
Inst8Quest4_HORDE_Attain = Inst8Quest4_Attain
Inst8Quest4_HORDE_Aim = Inst8Quest4_Aim
Inst8Quest4_HORDE_Location = Inst8Quest4_Location
Inst8Quest4_HORDE_Note = Inst8Quest4_Note
Inst8Quest4_HORDE_Prequest = Inst8Quest4_Prequest
Inst8Quest4_HORDE_Folgequest = Inst8Quest4_Folgequest
--
Inst8Quest4name1_HORDE = Inst8Quest4name1

--Quest 5 Horde
Inst8Quest5_HORDE = "5. 座狼的首领"
Inst8Quest5_HORDE_Level = "59"
Inst8Quest5_HORDE_Attain = "55"
Inst8Quest5_HORDE_Aim = "杀死血斧座狼的领袖，哈雷肯。"
Inst8Quest5_HORDE_Location = "神射手贾拉玛弗（荒芜之地 - 卡加斯; "..YELLOW.."5,47"..WHITE.."）"
Inst8Quest5_HORDE_Note = "哈雷肯在"..YELLOW.."[17]"..WHITE.."。"
Inst8Quest5_HORDE_Prequest = "无"
Inst8Quest5_HORDE_Folgequest = "无"
--
Inst8Quest5name1_HORDE = "阿斯托里长袍"
Inst8Quest5name2_HORDE = "吊钩外套"
Inst8Quest5name3_HORDE = "碧鳞胸甲"

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst8Quest6_HORDE = Inst8Quest6
Inst8Quest6_HORDE_Level = Inst8Quest6_Level
Inst8Quest6_HORDE_Attain = Inst8Quest6_Attain
Inst8Quest6_HORDE_Aim = Inst8Quest6_Aim
Inst8Quest6_HORDE_Location = Inst8Quest6_Location
Inst8Quest6_HORDE_Note = Inst8Quest6_Note
Inst8Quest6_HORDE_Prequest = Inst8Quest6_Prequest
Inst8Quest6_HORDE_Folgequest = Inst8Quest6_Folgequest
--
Inst8Quest6name1_HORDE = Inst8Quest6name1

--Quest 7 Horde
Inst8Quest7_HORDE = "7. 狡猾的比修"
Inst8Quest7_HORDE_Level = "59"
Inst8Quest7_HORDE_Attain = "55"
Inst8Quest7_HORDE_Aim = "到黑石塔去查明比修的下落。"
Inst8Quest7_HORDE_Location = "雷克斯洛特（荒芜之地 - 卡加斯; "..YELLOW.."5,47"..WHITE.."）"
Inst8Quest7_HORDE_Note = "比修在"..YELLOW.."[8]"..WHITE.."。"
Inst8Quest7_HORDE_Prequest = "无"
Inst8Quest7_HORDE_Folgequest = "有，比修的装置"
-- No Rewards for this quest

--Quest 8 Horde
Inst8Quest8_HORDE = "8. 比修的装置"
Inst8Quest8_HORDE_Level = "59"
Inst8Quest8_HORDE_Attain = "55"
Inst8Quest8_HORDE_Aim = "找到比修的装置并把它们还给她。你记得她说过她把装置藏在城市的最底层。"
Inst8Quest8_HORDE_Location = "比修（黑石塔下层; "..YELLOW.."[3]"..WHITE.."）"
Inst8Quest8_HORDE_Note = "你可以在在通往烟网蛛后的路上找到比修的装置"..YELLOW.."[13]"..WHITE.."。"
Inst8Quest8_HORDE_Prequest = "有，狡猾的比修"
Inst8Quest8_HORDE_Folgequest = "有，比修的侦查报告"
Inst8Quest8FQuest_HORDE = "true"
--
Inst8Quest8name1_HORDE = "乱风手套"
Inst8Quest8name2_HORDE = "海港束带"

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst8Quest9_HORDE = Inst8Quest9
Inst8Quest9_HORDE_Level = Inst8Quest9_Level
Inst8Quest9_HORDE_Attain = Inst8Quest9_Attain
Inst8Quest9_HORDE_Aim = Inst8Quest9_Aim
Inst8Quest9_HORDE_Location = Inst8Quest9_Location
Inst8Quest9_HORDE_Note = Inst8Quest9_Note
Inst8Quest9_HORDE_Prequest = Inst8Quest9_Prequest
Inst8Quest9_HORDE_Folgequest = Inst8Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde
Inst8Quest10_HORDE = "10. 高图斯的命令"
Inst8Quest10_HORDE_Level = "60"
Inst8Quest10_HORDE_Attain = "55"
Inst8Quest10_HORDE_Aim = "杀死欧莫克大王、指挥官沃恩和维姆萨拉克。找到重要的黑石文件，然后向卡加斯的军官高图斯汇报。"
Inst8Quest10_HORDE_Location = "高图斯（荒芜之地 - 卡加斯; "..YELLOW.."65,22"..WHITE.."）"
Inst8Quest10_HORDE_Note = "奥妮克希亚钥匙前导任务。指挥官沃恩在"..YELLOW.."[9]"..WHITE.."，欧莫克大王在 "..YELLOW.."[5]"..WHITE.."，维姆萨拉克在 "..YELLOW.."[19]"..WHITE.."。黑石文件在3个 Boss 的其中一个边上。"
Inst8Quest10_HORDE_Prequest = "无"
Inst8Quest10_HORDE_Folgequest = "有，伊崔格的智慧  -> 为部落而战（"..YELLOW.."黑石塔上层"..WHITE.."）"
--
Inst8Quest10name1_HORDE = "Wyrmthalak's Shackles"
Inst8Quest10name2_HORDE = "Omokk's Girth Restrainer"
Inst8Quest10name3_HORDE = "Halycon's Muzzle"
Inst8Quest10name4_HORDE = "Vosh'gajin's Strand"
Inst8Quest10name5_HORDE = "Voone's Vice Grips"

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst8Quest11_HORDE = Inst8Quest11
Inst8Quest11_HORDE_Level = Inst8Quest11_Level
Inst8Quest11_HORDE_Attain = Inst8Quest11_Attain
Inst8Quest11_HORDE_Aim = Inst8Quest11_Aim
Inst8Quest11_HORDE_Location = Inst8Quest11_Location
Inst8Quest11_HORDE_Note = Inst8Quest11_Note
Inst8Quest11_HORDE_Prequest = Inst8Quest11_Prequest
Inst8Quest11_HORDE_Folgequest = Inst8Quest11_Folgequest
Inst8Quest11PreQuest_HORDE = Inst8Quest11PreQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst8Quest12_HORDE = Inst8Quest12
Inst8Quest12_HORDE_Level = Inst8Quest12_Level
Inst8Quest12_HORDE_Attain = Inst8Quest12_Attain
Inst8Quest12_HORDE_Aim = Inst8Quest12_Aim
Inst8Quest12_HORDE_Location = Inst8Quest12_Location
Inst8Quest12_HORDE_Note = Inst8Quest12_Note
Inst8Quest12_HORDE_Prequest = Inst8Quest12_Prequest
Inst8Quest12_HORDE_Folgequest = Inst8Quest12_Folgequest
Inst8Quest12PreQuest_HORDE = Inst8Quest12PreQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst8Quest13_HORDE = Inst8Quest13
Inst8Quest13_HORDE_Level = Inst8Quest13_Level
Inst8Quest13_HORDE_Attain = Inst8Quest13_Attain
Inst8Quest13_HORDE_Aim = Inst8Quest13_Aim
Inst8Quest13_HORDE_Location = Inst8Quest13_Location
Inst8Quest13_HORDE_Note = Inst8Quest13_Note
Inst8Quest13_HORDE_Prequest = Inst8Quest13_Prequest
Inst8Quest13_HORDE_Folgequest = Inst8Quest13_Folgequest
--
Inst8Quest13name1_HORDE = Inst8Quest13name1

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst8Quest14_HORDE = Inst8Quest14
Inst8Quest14_HORDE_Level = Inst8Quest14_Level
Inst8Quest14_HORDE_Attain = Inst8Quest14_Attain
Inst8Quest14_HORDE_Aim = Inst8Quest14_Aim
Inst8Quest14_HORDE_Location = Inst8Quest14_Location
Inst8Quest14_HORDE_Note = Inst8Quest14_Note
Inst8Quest14_HORDE_Prequest = Inst8Quest14_Prequest
Inst8Quest14_HORDE_Folgequest = Inst8Quest14_Folgequest
--
Inst8Quest14name1_HORDE = Inst8Quest14name1
Inst8Quest14name2_HORDE = Inst8Quest14name2



--------------- INST9 - Upper Blackrock Spire (UBRS) ---------------

Inst9Story = "黑石深渊深处的巨大堡垒是由矮人建筑大师弗兰克罗恩·铸铁所设计的。这个堡垒是矮人力量的象征并被邪恶的黑铁矮人占据了数个世纪。然而，奈法利安——死亡之翼狡猾的儿子——对这个巨大的堡垒别有意图。他和他的黑龙军团占据了上层黑石塔并向占据着黑石深渊的黑铁矮人宣战。奈法利安知道矮人是由强大的火元素拉格纳罗斯所领导的，所以他立志要摧毁他的敌人并将黑石深渊全都占为己有。"
Inst9Caption = "黑石塔上层"
Inst9QAA = "11 个任务"
Inst9QAH = "12 个任务"

--Quest 1 Alliance
Inst9Quest1 = "1. 监护者"
Inst9Quest1_Level = "60"
Inst9Quest1_Attain = "57"
Inst9Quest1_Aim = "到冬泉谷去找到哈尔琳，把奥比的鳞片交给她。"
Inst9Quest1_Location = "奥比（黑石塔上层; "..YELLOW.."[7]"..WHITE.."）"
Inst9Quest1_Note = "你可以在竞技场边上的房间找到奥比"..YELLOW.."[7]"..WHITE.."。它呆在一个突出物上面。\n哈尔琳在冬泉谷（"..YELLOW.."54,51"..WHITE.."）。在冬泉谷的洞里的最里面通过站在传送符文上从而到她身边。"
Inst9Quest1_Prequest = "无"
Inst9Quest1_Folgequest = "有，蓝龙之怒"
-- No Rewards for this quest

--Quest 2 Alliance
Inst9Quest2 = "2. 芬克·恩霍尔，为您效劳！"
Inst9Quest2_Level = "60"
Inst9Quest2_Attain = "58"
Inst9Quest2_Aim = "与永望镇的玛雷弗斯·暗锤谈一谈。"
Inst9Quest2_Location = "芬克·恩霍尔（黑石塔上层; "..YELLOW.."[8]"..WHITE.."）"
Inst9Quest2_Note = "芬克·恩霍尔会在拨完比斯巨兽的皮后出现。玛雷弗斯·暗锤在（冬泉谷 - 永望镇; "..YELLOW.."61,38"..WHITE.."）。"
Inst9Quest2_Prequest = "无"
Inst9Quest2_Folgequest = "有，阿卡纳护腿，血色学者之帽，嗜血胸甲"
-- No Rewards for this quest

--Quest 3 Alliance
Inst9Quest3 = "3. 冷冻龙蛋"
Inst9Quest3_Level = "60"
Inst9Quest3_Attain = "57"
Inst9Quest3_Aim = "在孵化间对着某颗龙蛋使用龙蛋冷冻器初号机。"
Inst9Quest3_Location = "丁奇·斯迪波尔（燃烧平原 - 烈焰峰; "..YELLOW.."65,24"..WHITE.."）"
Inst9Quest3_Note = "你可以在烈焰之父的房间找到龙蛋"..YELLOW.."[2]"..WHITE.."。"
Inst9Quest3_Prequest = "有，冰风奇美拉角 -> 返回丁奇身边"
Inst9Quest3_Folgequest = "有，莱尼德·巴萨罗梅 -> 贝蒂娜·比格辛克（"..YELLOW.."通灵学院"..WHITE.."）"
Inst9Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst9Quest4 = "4. 艾博希尔之眼"
Inst9Quest4_Level = "60"
Inst9Quest4_Attain = "55"
Inst9Quest4_Aim = "将艾博希尔之眼交给艾萨拉的海达克西斯公爵。"
Inst9Quest4_Location = "海达克西斯公爵（艾萨拉; "..YELLOW.."79,73"..WHITE.."）"
Inst9Quest4_Note = "你可以找到艾博希尔在"..YELLOW.."[1]"..WHITE.."。"
Inst9Quest4_Prequest = "有，雷暴和磐石"
Inst9Quest4_Folgequest = "有，熔火之心"
Inst9Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst9Quest5 = "5. 达基萨斯将军之死"
Inst9Quest5_Level = "60"
Inst9Quest5_Attain = "55"
Inst9Quest5_Aim = "到黑石塔去杀掉达基萨斯将军，完成任务之后就回到麦克斯韦尔元帅那里复命。"
Inst9Quest5_Location = "麦克斯韦尔元帅（燃烧平原 - 摩根的岗哨; "..YELLOW.."82,68"..WHITE.."）"
Inst9Quest5_Note = "达基萨斯将军在"..YELLOW.."[9]"..WHITE.."。"
Inst9Quest5_Prequest = "有，达基萨斯将军的命令（"..YELLOW.."黑石塔下层"..WHITE.."）"
Inst9Quest5_Folgequest = "无"
Inst9Quest5PreQuest = "true"
--
Inst9Quest5name1 = "暴君印记"
Inst9Quest5name2 = "比斯巨兽之眼"
Inst9Quest5name3 = "黑手饰物"

--Quest6 Alliance
Inst9Quest6 = "6. 末日扣环"
Inst9Quest6_Level = "60"
Inst9Quest6_Attain = "57"
Inst9Quest6_Aim = "将末日扣环交给燃烧平原的玛亚拉·布莱特文。"
Inst9Quest6_Location = "玛亚拉·布莱特文（燃烧平原 - 摩根的岗哨; "..YELLOW.."84,69"..WHITE.."）"
Inst9Quest6_Note = "你可以接到这个任务的前续任务，从雷明顿·瑞治维尔伯爵（暴风城 - 暴风要塞; "..YELLOW.."74,30"..WHITE.."）。 末日扣环在烈焰之父的房间"..YELLOW.."[3]"..WHITE.."的一个箱子里。"
Inst9Quest6_Prequest = "有，玛亚拉·布莱特文"
Inst9Quest6_Folgequest = "有，瑞治维尔的箱子"
Inst9Quest6PreQuest = "true"
--
Inst9Quest6name1 = "迅捷皮靴"
Inst9Quest6name2 = "瞬击护臂"

--Quest7 Alliance
Inst9Quest7 = "7. 龙火护符"
Inst9Quest7_Level = "60"
Inst9Quest7_Attain = "52"
Inst9Quest7_Aim = "你必须从达基萨斯将军身上取回黑龙勇士之血，你可以在黑石塔的晋升大厅后面的房间里找到他。"
Inst9Quest7_Location = "哈尔琳（冬泉谷; "..YELLOW.."54,51"..WHITE.."）"
Inst9Quest7_Note = "联盟奥妮克希亚钥匙系列任务的最后一步。达基萨斯将军在"..YELLOW.."[9]"..WHITE.."。"
Inst9Quest7_Prequest = "有，巨龙之眼"
Inst9Quest7_Folgequest = "无"
Inst9Quest7PreQuest = "true"
--
Inst9Quest7name1 = "龙火护符"

--Quest8 Alliance
Inst9Quest8 = "8. 黑手的命令"
Inst9Quest8_Level = "60"
Inst9Quest8_Attain = "55"
Inst9Quest8_Aim = "真是个愚蠢的兽人。看来你需要找到那枚烙印并获得达基萨斯徽记才可以使用命令宝珠。"
Inst9Quest8_Location = "黑手的命令（裂盾军需官掉落; "..YELLOW.."副本入口地图[7]"..WHITE.."）"
Inst9Quest8_Note = "黑翼之巢的进门任务。你可以在黑石塔副本的门口右侧附近找到裂盾军需官，宝珠就在达基萨斯将军"..YELLOW.."[9]"..WHITE.."身后。 "
Inst9Quest8_Prequest = "无"
Inst9Quest8_Folgequest = "无"
-- No Rewards for this quest

--Quest 9 Alliance
Inst9Quest9 = "9. 最后的准备"
Inst9Quest9_Level = "60"
Inst9Quest9_Attain = "60"
Inst9Quest9_Aim = "从黑石塔的兽人那儿收集40副黑石护腕，把它们和一瓶超级能量合剂一起交给黑石山的伯德雷。"
Inst9Quest9_Location = "伯德雷（黑石山; "..YELLOW.."副本入口地图[D]"..WHITE.."）"
Inst9Quest9_Note = "你需要超维度幽灵显形器才能看到伯德雷。你可以从《寻找安泰恩》任务得到它。黑石塔的兽人掉落黑石护腕。超级能量合剂是炼金制造。"
Inst9Quest9_Prequest = "有，瓦塔拉克护符的右瓣（"..YELLOW.."黑石塔下层"..WHITE.."）"
Inst9Quest9_Folgequest = "有，瓦塔拉克公爵"
Inst9Quest9PreQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst9Quest10 = "10. 瓦塔拉克公爵"
Inst9Quest10_Level = "60"
Inst9Quest10_Attain = "60"
Inst9Quest10_Aim = "在比斯巨兽的房间里使用召唤火盆，召唤瓦塔拉克公爵。杀死他，对尸体使用瓦塔拉克的饰品。然后将瓦塔拉克的饰品还给瓦塔拉克公爵之魂。"
Inst9Quest10_Location = "伯德雷（黑石山; "..YELLOW.."副本入口地图[D]"..WHITE.."）"
Inst9Quest10_Note = "你需要超维度幽灵显形器才能看到伯德雷。你可以从《寻找安泰恩》任务得到它。召唤瓦塔拉克公爵在 "..YELLOW.."[8]"..WHITE.."。向伯德雷回复领取奖励。"
Inst9Quest10_Prequest = "有，最后的准备"
Inst9Quest10_Folgequest = "有，向伯德雷回复 "
Inst9Quest10FQuest = "true"
--
Inst9Quest10name1 = "符咒火盆"
Inst9Quest10name2 = "符咒火盆用户手册"

--Quest 11 Alliance
Inst9Quest11 = "11. 恶魔熔炉（煅造-铸甲大师任务）"
Inst9Quest11_Level = "60"
Inst9Quest11_Attain = "58"
Inst9Quest11_Aim = "到黑石塔去找到古拉鲁克。杀死他，然后用血污长矛刺入他的尸体。当他的灵魂被吸干后，这支矛就会成为穿魂长矛。你还必须找到未铸造的符文覆饰胸甲。将穿魂长矛和未铸造的符文覆饰胸甲都交给冬泉谷的罗拉克斯。"
Inst9Quest11_Location = "罗拉克斯（冬泉谷; "..YELLOW.."64,74"..WHITE.."）"
Inst9Quest11_Note = "煅造任务。古拉鲁克在"..YELLOW.."[5]"..WHITE.."。"
Inst9Quest11_Prequest = "无"
Inst9Quest11_Folgequest = "无"
--
Inst9Quest11name1 = "设计图-魔铸胸甲"
Inst9Quest11name2 = "屠魔药剂"
Inst9Quest11name3 = "魔吻背包"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst9Quest1_HORDE = Inst9Quest1
Inst9Quest1_HORDE_Level = Inst9Quest1_Level
Inst9Quest1_HORDE_Attain = Inst9Quest1_Attain
Inst9Quest1_HORDE_Aim = Inst9Quest1_Aim
Inst9Quest1_HORDE_Location = Inst9Quest1_Location
Inst9Quest1_HORDE_Note = Inst9Quest1_Note
Inst9Quest1_HORDE_Prequest = Inst9Quest1_Prequest
Inst9Quest1_HORDE_Folgequest = Inst9Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst9Quest2_HORDE = Inst9Quest2
Inst9Quest2_HORDE_Level = Inst9Quest2_Level
Inst9Quest2_HORDE_Attain = Inst9Quest2_Attain
Inst9Quest2_HORDE_Aim = Inst9Quest2_Aim
Inst9Quest2_HORDE_Location = Inst9Quest2_Location
Inst9Quest2_HORDE_Note = Inst9Quest2_Note
Inst9Quest2_HORDE_Prequest = Inst9Quest2_Prequest
Inst9Quest2_HORDE_Folgequest = Inst9Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst9Quest3_HORDE = Inst9Quest3
Inst9Quest3_HORDE_Level = Inst9Quest3_Level
Inst9Quest3_HORDE_Attain = Inst9Quest3_Attain
Inst9Quest3_HORDE_Aim = Inst9Quest3_Aim
Inst9Quest3_HORDE_Location = Inst9Quest3_Location
Inst9Quest3_HORDE_Note = Inst9Quest3_Note
Inst9Quest3_HORDE_Prequest = Inst9Quest3_Prequest
Inst9Quest3_HORDE_Folgequest = Inst9Quest3_Folgequest
Inst9Quest3PreQuest_HORDE = Inst9Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst9Quest4_HORDE = Inst9Quest4
Inst9Quest4_HORDE_Level = Inst9Quest4_Level
Inst9Quest4_HORDE_Attain = Inst9Quest4_Attain
Inst9Quest4_HORDE_Aim = Inst9Quest4_Aim
Inst9Quest4_HORDE_Location = Inst9Quest4_Location
Inst9Quest4_HORDE_Note = Inst9Quest4_Note
Inst9Quest4_HORDE_Prequest = Inst9Quest4_Prequest
Inst9Quest4_HORDE_Folgequest = Inst9Quest4_Folgequest
Inst9Quest4PreQuest_HORDE = Inst9Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde
Inst9Quest5_HORDE = "5. 黑暗石板"
Inst9Quest5_HORDE_Level = "60"
Inst9Quest5_HORDE_Attain = "57"
Inst9Quest5_HORDE_Aim = "将黑暗石板交给卡加斯的暗法师薇薇安·拉格雷。"
Inst9Quest5_HORDE_Location = "薇薇安·拉格雷（荒芜之地 - 卡加斯; "..YELLOW.."2,47"..WHITE.."）"
Inst9Quest5_HORDE_Note = "你可以接到前续任务从药剂师金格（幽暗城 - 炼金房; "..YELLOW.."50,68"..WHITE.."）。黑暗石板在烈焰之父的房间（"..YELLOW.."[3]"..WHITE.."）。"
Inst9Quest5_HORDE_Prequest = "有，薇薇安·拉格雷和黑暗石板"
Inst9Quest5_HORDE_Folgequest = "无"
Inst9Quest5PreQuest_HORDE = "true"
--
Inst9Quest5name1_HORDE = "迅捷皮靴"
Inst9Quest5name2_HORDE = "瞬击护臂"

--Quest6 Horde
Inst9Quest6_HORDE = "6. 为部落而战！"
Inst9Quest6_HORDE_Level = "60"
Inst9Quest6_HORDE_Attain = "55"
Inst9Quest6_HORDE_Aim = "去黑石塔杀死大酋长雷德·黑手，带着他的头颅返回奥格瑞玛。"
Inst9Quest6_HORDE_Location = "萨尔（奥格瑞玛; "..YELLOW.."31,38"..WHITE.."）"
Inst9Quest6_HORDE_Note = "奥妮克希亚钥匙任务。大酋长雷德·黑手在 "..YELLOW.."[6]"..WHITE.."。"
Inst9Quest6_HORDE_Prequest = "有，高图斯的命令 -> 伊崔格的智慧"
Inst9Quest6_HORDE_Folgequest = "有，部落的勇士"
Inst9Quest6PreQuest_HORDE = "true"
--
Inst9Quest6name1_HORDE = "暴君印记"
Inst9Quest6name2_HORDE = "比斯巨兽之眼"
Inst9Quest6name3_HORDE = "黑手饰物"

--Quest7 Horde
Inst9Quest7_HORDE = "7. 黑龙幻像"
Inst9Quest7_HORDE_Level = "60"
Inst9Quest7_HORDE_Attain = "57"
Inst9Quest7_HORDE_Aim = "到黑石塔去收集20颗黑色龙人的眼球，完成任务之后回到巫女麦兰达那里。"
Inst9Quest7_HORDE_Location = "巫女麦兰达（西瘟疫之地; "..YELLOW.."50,77"..WHITE.."）"
Inst9Quest7_HORDE_Note = "黑色的龙会掉落眼球。"
Inst9Quest7_HORDE_Prequest = "有，部落的勇士 -> 雷克萨的证明"
Inst9Quest7_HORDE_Folgequest = "有，埃博斯塔夫"
Inst9Quest7FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest8 Horde
Inst9Quest8_HORDE = "8. 黑龙勇士之血"
Inst9Quest8_HORDE_Level = "60"
Inst9Quest8_HORDE_Attain = "56"
Inst9Quest8_HORDE_Aim = "到黑石塔去杀掉达基萨斯将军，把它的血交给罗卡鲁。"
Inst9Quest8_HORDE_Location = "罗卡鲁（凄凉之地 - 葬影村; "..YELLOW.."25,71"..WHITE.."）"
Inst9Quest8_HORDE_Note = "部落奥妮克希亚钥匙系列任务的最后一步。达基萨斯将军在"..YELLOW.."[9]"..WHITE.."。"
Inst9Quest8_HORDE_Prequest = "有，埃博斯塔夫 -> 龙骨试炼……"
Inst9Quest8_HORDE_Folgequest = "无"
Inst9Quest8FQuest_HORDE = "true"
--
Inst9Quest8name1_HORDE = "龙火护符"

--Quest 9 Horde  (same as Quest 8 Alliance)
Inst9Quest9_HORDE = "9. 黑手的命令"
Inst9Quest9_HORDE_Level = Inst9Quest8_Level
Inst9Quest9_HORDE_Attain = Inst9Quest8_Attain
Inst9Quest9_HORDE_Aim = Inst9Quest8_Aim
Inst9Quest9_HORDE_Location = Inst9Quest8_Location
Inst9Quest9_HORDE_Note = Inst9Quest8_Note
Inst9Quest9_HORDE_Prequest = Inst9Quest8_Prequest
Inst9Quest9_HORDE_Folgequest = Inst9Quest8_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 9 Alliance)
Inst9Quest10_HORDE = "10. 最后的准备"
Inst9Quest10_HORDE_Level = Inst9Quest9_Level
Inst9Quest10_HORDE_Attain = Inst9Quest9_Attain
Inst9Quest10_HORDE_Aim = Inst9Quest9_Aim
Inst9Quest10_HORDE_Location = Inst9Quest9_Location
Inst9Quest10_HORDE_Note = Inst9Quest9_Note
Inst9Quest10_HORDE_Prequest = Inst9Quest9_Prequest
Inst9Quest10_HORDE_Folgequest = Inst9Quest9_Folgequest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 10 Alliance)
Inst9Quest11_HORDE = "11. 瓦塔拉克公爵"
Inst9Quest11_HORDE_Level = Inst9Quest10_Level
Inst9Quest11_HORDE_Attain = Inst9Quest10_Attain
Inst9Quest11_HORDE_Aim = Inst9Quest10_Aim
Inst9Quest11_HORDE_Location = Inst9Quest10_Location
Inst9Quest11_HORDE_Note = Inst9Quest10_Note
Inst9Quest11_HORDE_Prequest = Inst9Quest10_Prequest
Inst9Quest11_HORDE_Folgequest = Inst9Quest10_Folgequest
--
Inst9Quest11name1_HORDE = Inst9Quest10name1
Inst9Quest11name2_HORDE = Inst9Quest10name2

--Quest 12 Horde  (same as Quest 11 Alliance)
Inst9Quest12_HORDE = "12. 恶魔熔炉"
Inst9Quest12_HORDE_Level = Inst9Quest11_Level
Inst9Quest12_HORDE_Attain = Inst9Quest11_Attain
Inst9Quest12_HORDE_Aim = Inst9Quest11_Aim
Inst9Quest12_HORDE_Location = Inst9Quest11_Location
Inst9Quest12_HORDE_Note = Inst9Quest11_Note
Inst9Quest12_HORDE_Prequest = Inst9Quest11_Prequest
Inst9Quest12_HORDE_Folgequest = Inst9Quest11_Folgequest
--
Inst9Quest12name1_HORDE = Inst9Quest11name1
Inst9Quest12name2_HORDE = Inst9Quest11name2
Inst9Quest12name3_HORDE = Inst9Quest11name3



--------------- INST10 - Dire Maul East (DM) ---------------

Inst10Story = "埃雷萨拉斯古城是在一万二千年前由当时的一批暗夜精灵法师秘密地建造的，它被用于保护艾莎拉皇后最宝贵的奥法秘密。虽然受到了世界大震动的影响，这座伟大的城市基本屹立在那里，现在其被称为厄运之槌。这座遗迹城市分为三个部分，分别被不同的生物所占据——包括幽灵般的高等精灵，邪恶的萨特和鲁莽的食人魔。只有最勇敢的冒险队伍才敢进入这个破碎的城市并面对远古大厅中邪恶力量。"
Inst10Caption = "厄运之槌（东）"
Inst10QAA = "6 个任务"
Inst10QAH = "6 个任务"

--Quest 1 Alliance
Inst10Quest1 = "1. 普希林和埃斯托尔迪"
Inst10Quest1_Level = "58"
Inst10Quest1_Attain = "54"
Inst10Quest1_Aim = "到厄运之槌去找到小鬼普希林。你可以使用任何手段从小鬼那里得到埃斯托尔迪的咒术之书。"
Inst10Quest1_Location = "埃斯托尔迪（菲拉斯 - 拉瑞斯小亭; "..YELLOW.."76,37"..WHITE.."）"
Inst10Quest1_Note = "普希林在厄运之槌"..YELLOW.."东"..WHITE.."的"..YELLOW.."[1]"..WHITE.."。你一和它说话它就跑，但是最后会停下并可以被攻击在"..YELLOW.."[2]"..WHITE.."。它还会掉落月牙钥匙，也就是厄运之槌北和西的钥匙。"
Inst10Quest1_Prequest = "无"
Inst10Quest1_Folgequest = "无"
--
Inst10Quest1name1 = "活跃之靴"
Inst10Quest1name2 = "奔行者之剑"

--Quest 2 Alliance
Inst10Quest2 = "2. 蕾瑟塔蒂丝的网"
Inst10Quest2_Level = "57"
Inst10Quest2_Attain = "54"
Inst10Quest2_Aim = "把蕾瑟塔蒂丝的网交给菲拉斯羽月要塞的拉托尼库斯·月矛。"
Inst10Quest2_Location = "拉托尼库斯·月矛（菲拉斯 - 羽月要塞; "..YELLOW.."30,46"..WHITE.."）"
Inst10Quest2_Note = "蕾瑟塔蒂丝在厄运之槌"..YELLOW.."东"..WHITE.."的"..YELLOW.."[3]"..WHITE.."。前续任务可以从铁炉堡的信使考雷·落锤接到。"
Inst10Quest2_Prequest = "有，羽月要塞"
Inst10Quest2_Folgequest = "无"
Inst10Quest2PreQuest = "true"
--
Inst10Quest2name1 = "学识匕首"

--Quest 3 Alliance
Inst10Quest3 = "3. 魔藤碎片"
Inst10Quest3_Level = "60"
Inst10Quest3_Attain = "59"
Inst10Quest3_Aim = "在厄运之槌中找到魔藤，然后从它上面采集一块碎片。只有干掉了奥兹恩之后，你才能进行采集工作。使用净化之匣安全地封印碎片，然后将其交给月光林地永夜港的拉比恩·萨图纳。"
Inst10Quest3_Location = "拉比恩·萨图纳（月光林地; "..YELLOW.."51,44"..WHITE.."）"
Inst10Quest3_Note = "奥兹恩在厄运之槌"..YELLOW.."东"..WHITE.."的"..YELLOW.."[5]"..WHITE.."。净化之匣在希利苏斯"..YELLOW.."62,54"..WHITE.."。前续任务同样来自拉比恩·萨图纳。"
Inst10Quest3_Prequest = "有，净化之匣"
Inst10Quest3_Folgequest = "无"
Inst10Quest3PreQuest = "true"
--
Inst10Quest3name1 = "米利的盾牌"
Inst10Quest3name2 = "米利的词典"

--Quest 4 Alliance
Inst10Quest4 = "4. 瓦塔拉克饰品的左瓣"
Inst10Quest4_Level = "60"
Inst10Quest4_Attain = "60"
Inst10Quest4_Aim = "使用召唤火盆召唤出伊萨利恩的灵魂，然后杀掉她。完成之后，将召唤火盆与瓦塔拉克饰品的左瓣还给伯德雷。"
Inst10Quest4_Location = "伯德雷（黑石山; "..YELLOW.."副本入口地图[D]"..WHITE.."）"
Inst10Quest4_Note = "你需要超维度幽灵显形器才能看到伯德雷。你可以从《寻找安泰恩》任务得到它。召唤伊萨利恩在"..YELLOW.."[5]"..WHITE.."。"
Inst10Quest4_Prequest = "有，重要的材料"
Inst10Quest4_Folgequest = "有，奥卡兹岛在你前方……"
Inst10Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst10Quest5 = "5. 瓦塔拉克饰品的右瓣"
Inst10Quest5_Level = "60"
Inst10Quest5_Attain = "60"
Inst10Quest5_Aim = "使用召唤火盆召唤出伊萨莉恩的灵魂，然后杀掉他。完成之后，将召唤火盆与瓦塔拉克公爵的饰品还给伯德雷。"
Inst10Quest5_Location = "伯德雷（黑石山; "..YELLOW.."副本入口地图[D]"..WHITE.."）"
Inst10Quest5_Note = "你需要超维度幽灵显形器才能看到伯德雷。你可以从《寻找安泰恩》任务得到它。召唤伊萨利恩在"..YELLOW.."[5]"..WHITE.."。"
Inst10Quest5_Prequest = "有，更多重要的材料"
Inst10Quest5_Folgequest = "有，最后的准备（"..YELLOW.."黑石塔上层"..WHITE.."）"
Inst10Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst10Quest6 = "6. 监牢之链（术士任务）"
Inst10Quest6_Level = "60"
Inst10Quest6_Attain = "60"
Inst10Quest6_Aim = "到菲拉斯的厄运之槌去，从扭木广场的荒野萨特身上找到15份萨特之血，然后把它们交给腐烂之痕的戴奥。"
Inst10Quest6_Location = "衰老的戴奥（诅咒之地 - 腐烂之痕; "..YELLOW.."34,50"..WHITE.."）"
Inst10Quest6_Note = "术士召唤末日守卫任务，你可以从衰老的戴奥那里接到相关的其他任务。最容易找到荒野萨特是从厄运之槌东的“后门”进入（菲拉斯 - 拉瑞斯小亭; "..YELLOW.."77,37"..WHITE.."）。 你需要有月牙钥匙才能开门。"
Inst10Quest6_Prequest = "无"
Inst10Quest6_Folgequest = "无"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst10Quest1_HORDE = Inst10Quest1
Inst10Quest1_HORDE_Level = Inst10Quest1_Level
Inst10Quest1_HORDE_Attain = Inst10Quest1_Attain
Inst10Quest1_HORDE_Aim = Inst10Quest1_Aim
Inst10Quest1_HORDE_Location = Inst10Quest1_Location
Inst10Quest1_HORDE_Note = Inst10Quest1_Note
Inst10Quest1_HORDE_Prequest = Inst10Quest1_Prequest
Inst10Quest1_HORDE_Folgequest = Inst10Quest1_Folgequest
--
Inst10Quest1name1_HORDE = Inst10Quest1name1
Inst10Quest1name2_HORDE = Inst10Quest1name2

--Quest 2 Horde
Inst10Quest2_HORDE = "2. 蕾瑟塔蒂丝的网"
Inst10Quest2_HORDE_Level = "57"
Inst10Quest2_HORDE_Attain = "54"
Inst10Quest2_HORDE_Aim = "把蕾瑟塔蒂丝的网交给非拉斯莫沙彻营地的塔罗·刺蹄。"
Inst10Quest2_HORDE_Location = "塔罗·刺蹄（菲拉斯 - 莫沙彻营地; "..YELLOW.."76,43"..WHITE.."）"
Inst10Quest2_HORDE_Note = "蕾瑟塔蒂丝在厄运之槌"..YELLOW.."东"..WHITE.."的"..YELLOW.."[3]"..WHITE.."。前续任务接自奥格瑞玛的公告员高拉克。"
Inst10Quest2_HORDE_Prequest = "有，莫沙彻营地"
Inst10Quest2_HORDE_Folgequest = "无"
Inst10Quest2PreQuest_HORDE = "true"
--
Inst10Quest2name1_HORDE = "学识匕首"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst10Quest3_HORDE = Inst10Quest3
Inst10Quest3_HORDE_Level = Inst10Quest3_Level
Inst10Quest3_HORDE_Attain = Inst10Quest3_Attain
Inst10Quest3_HORDE_Aim = Inst10Quest3_Aim
Inst10Quest3_HORDE_Location = Inst10Quest3_Location
Inst10Quest3_HORDE_Note = Inst10Quest3_Note
Inst10Quest3_HORDE_Prequest = Inst10Quest3_Prequest
Inst10Quest3_HORDE_Folgequest = Inst10Quest3_Folgequest
--
Inst10Quest3name1_HORDE = Inst10Quest3name1
Inst10Quest3name2_HORDE = Inst10Quest3name2

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst10Quest4_HORDE = Inst10Quest4
Inst10Quest4_HORDE_Level = Inst10Quest4_Level
Inst10Quest4_HORDE_Attain = Inst10Quest4_Attain
Inst10Quest4_HORDE_Aim = Inst10Quest4_Aim
Inst10Quest4_HORDE_Location = Inst10Quest4_Location
Inst10Quest4_HORDE_Note = Inst10Quest4_Note
Inst10Quest4_HORDE_Prequest = Inst10Quest4_Prequest
Inst10Quest4_HORDE_Folgequest = Inst10Quest4_Folgequest
Inst10Quest4PreQuest_HORDE = Inst10Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst10Quest5_HORDE = Inst10Quest5
Inst10Quest5_HORDE_Level = Inst10Quest5_Level
Inst10Quest5_HORDE_Attain = Inst10Quest5_Attain
Inst10Quest5_HORDE_Aim = Inst10Quest5_Aim
Inst10Quest5_HORDE_Location = Inst10Quest5_Location
Inst10Quest5_HORDE_Note = Inst10Quest5_Note
Inst10Quest5_HORDE_Prequest = Inst10Quest5_Prequest
Inst10Quest5_HORDE_Folgequest = Inst10Quest5_Folgequest
Inst10Quest5PreQuest_HORDE = Inst10Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst10Quest6_HORDE = Inst10Quest6
Inst10Quest6_HORDE_Level = Inst10Quest6_Level
Inst10Quest6_HORDE_Attain = Inst10Quest6_Attain
Inst10Quest6_HORDE_Aim = Inst10Quest6_Aim
Inst10Quest6_HORDE_Location = Inst10Quest6_Location
Inst10Quest6_HORDE_Note = Inst10Quest6_Note
Inst10Quest6_HORDE_Prequest = Inst10Quest6_Prequest
Inst10Quest6_HORDE_Folgequest = Inst10Quest6_Folgequest
-- No Rewards for this quest



--------------- INST11 - Dire Maul North (DM) ---------------

Inst11Story = "埃雷萨拉斯古城是在一万二千年前由当时的一批暗夜精灵法师秘密地建造的，它被用于保护艾莎拉皇后最宝贵的奥法秘密。虽然受到了世界大震动的影响，这座伟大的城市基本屹立在那里，现在其被称为厄运之槌。这座遗迹城市分为三个部分，分别被不同的生物所占据——包括幽灵般的高等精灵，邪恶的萨特和鲁莽的食人魔。只有最勇敢的冒险队伍才敢进入这个破碎的城市并面对远古大厅中邪恶力量。"
Inst11Caption = "厄运之槌（北）"
Inst11QAA = "4 个任务"
Inst11QAH = "4 个任务"

--Quest 1 Alliance
Inst11Quest1 = "1. 破碎的陷阱 "
Inst11Quest1_Level = "60"
Inst11Quest1_Attain = "60"
Inst11Quest1_Aim = "修复这个陷阱。"
Inst11Quest1_Location = "破碎的陷阱（厄运之槌; "..YELLOW.."北"..WHITE.."）"
Inst11Quest1_Note = "可重复任务。修好陷阱你必须有[瑟银零件]和一瓶[冰霜之油]。"
Inst11Quest1_Prequest = "无"
Inst11Quest1_Folgequest = "无"
-- No Rewards for this quest

--Quest 2 Alliance
Inst11Quest2 = "2. 戈多克食人魔装"
Inst11Quest2_Level = "60"
Inst11Quest2_Attain = "57"
Inst11Quest2_Aim = "把4份符文布卷、8块硬甲皮、2卷符文线和一份食人魔鞣酸交给诺特·希姆加克。他现在被拴在厄运之槌的戈多克食人魔那边。"
Inst11Quest2_Location = "诺特·希姆加克（厄运之槌; "..YELLOW.."北，[4]"..WHITE.."）"
Inst11Quest2_Note = "可重复任务，食人魔鞣酸可以从"..YELLOW.."（上层）[4]"..WHITE.."附近得到。"
Inst11Quest2_Prequest = "无"
Inst11Quest2_Folgequest = "无"
--
Inst11Quest2name1 = "戈多克食人魔装"

--Quest 3 Alliance
Inst11Quest3 = "3. 救诺特出去！"
Inst11Quest3_Level = "60"
Inst11Quest3_Attain = "60"
Inst11Quest3_Aim = "为诺特找到食人魔镣铐钥匙。"
Inst11Quest3_Location = "诺特·希姆加克（厄运之槌; "..YELLOW.."北，[4]"..WHITE.."）"
Inst11Quest3_Note = "可重复任务，副本里任何食人魔都可能掉落镣铐钥匙。"
Inst11Quest3_Prequest = "无"
Inst11Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst11Quest4 = "4. 戈多克食人魔的事务"
Inst11Quest4_Level = "60"
Inst11Quest4_Attain = "56"
Inst11Quest4_Aim = "找到戈多克力量护手，并将它交给厄运之槌的克罗卡斯。"
Inst11Quest4_Location = "克罗卡斯（厄运之槌; "..YELLOW.."北，[5]"..WHITE.."）"
Inst11Quest4_Note = "王子在厄运之槌"..YELLOW.."西"..WHITE.."的"..YELLOW.."[7]"..WHITE.."。力量护手在王子附近的一个箱子里，交任务时你也必须确保你有“当国王真好”这个状态。"
Inst11Quest4_Prequest = "无"
Inst11Quest4_Folgequest = "无"
--
Inst11Quest4name1 = "戈多克裹手"
Inst11Quest4name2 = "戈多克手套"
Inst11Quest4name3 = "戈多克手甲"
Inst11Quest4name4 = "戈多克护手"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst11Quest1_HORDE = Inst11Quest1
Inst11Quest1_HORDE_Level = Inst11Quest1_Level
Inst11Quest1_HORDE_Attain = Inst11Quest1_Attain
Inst11Quest1_HORDE_Aim = Inst11Quest1_Aim
Inst11Quest1_HORDE_Location = Inst11Quest1_Location
Inst11Quest1_HORDE_Note = Inst11Quest1_Note
Inst11Quest1_HORDE_Prequest = Inst11Quest1_Prequest
Inst11Quest1_HORDE_Folgequest = Inst11Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst11Quest2_HORDE = Inst11Quest2
Inst11Quest2_HORDE_Level = Inst11Quest2_Level
Inst11Quest2_HORDE_Attain = Inst11Quest2_Attain
Inst11Quest2_HORDE_Aim = Inst11Quest2_Aim
Inst11Quest2_HORDE_Location = Inst11Quest2_Location
Inst11Quest2_HORDE_Note = Inst11Quest2_Note
Inst11Quest2_HORDE_Prequest = Inst11Quest2_Prequest
Inst11Quest2_HORDE_Folgequest = Inst11Quest2_Folgequest
--
Inst11Quest2name1_HORDE = Inst11Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst11Quest3_HORDE = Inst11Quest3
Inst11Quest3_HORDE_Level = Inst11Quest3_Level
Inst11Quest3_HORDE_Attain = Inst11Quest3_Attain
Inst11Quest3_HORDE_Aim = Inst11Quest3_Aim
Inst11Quest3_HORDE_Location = Inst11Quest3_Location
Inst11Quest3_HORDE_Note = Inst11Quest3_Note
Inst11Quest3_HORDE_Prequest = Inst11Quest3_Prequest
Inst11Quest3_HORDE_Folgequest = Inst11Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst11Quest4_HORDE = Inst11Quest4
Inst11Quest4_HORDE_Level = Inst11Quest4_Level
Inst11Quest4_HORDE_Attain = Inst11Quest4_Attain
Inst11Quest4_HORDE_Aim = Inst11Quest4_Aim
Inst11Quest4_HORDE_Location = Inst11Quest4_Location
Inst11Quest4_HORDE_Note = Inst11Quest4_Note
Inst11Quest4_HORDE_Prequest = Inst11Quest4_Prequest
Inst11Quest4_HORDE_Folgequest = Inst11Quest4_Folgequest
--
Inst11Quest4name1_HORDE = Inst11Quest4name1
Inst11Quest4name2_HORDE = Inst11Quest4name2
Inst11Quest4name3_HORDE = Inst11Quest4name3
Inst11Quest4name4_HORDE = Inst11Quest4name4



--------------- INST12 - Dire Maul West (DM) ---------------

Inst12Story = "埃雷萨拉斯古城是在一万二千年前由当时的一批暗夜精灵法师秘密地建造的，它被用于保护艾莎拉皇后最宝贵的奥法秘密。虽然受到了世界大震动的影响，这座伟大的城市基本屹立在那里，现在其被称为厄运之槌。这座遗迹城市分为三个部分，分别被不同的生物所占据——包括幽灵般的高等精灵，邪恶的萨特和鲁莽的食人魔。只有最勇敢的冒险队伍才敢进入这个破碎的城市并面对远古大厅中邪恶力量。"
Inst12Caption = "厄运之槌（西）"
Inst12QAA = "17 个任务"
Inst12QAH = "17 个任务"

--Quest 1 Alliance
Inst12Quest1 = "1. 精灵的传说"
Inst12Quest1_Level = "60"
Inst12Quest1_Attain = "54"
Inst12Quest1_Aim = "到厄运之槌去寻找卡里尔·温萨鲁斯。向羽月要塞的学者卢索恩·纹角报告你所找到的信息。"
Inst12Quest1_Location = "学者卢索恩·纹角（菲拉斯 - 羽月要塞; "..YELLOW.."31,43"..WHITE.."）"
Inst12Quest1_Note = "卡里尔·温萨鲁斯在厄运之槌"..YELLOW.."图书馆（西）"..WHITE.."。"
Inst12Quest1_Prequest = "无"
Inst12Quest1_Folgequest = "无"
-- No Rewards for this quest

--Quest 2 Alliance
Inst12Quest2 = "2. 伊莫塔尔的疯狂"
Inst12Quest2_Level = "60"
Inst12Quest2_Attain = "56"
Inst12Quest2_Aim = "你必须干掉5座水晶塔周围的守卫，那5座水晶塔维持着关押伊莫塔尔的监狱。一旦水晶塔的能量被削弱，伊莫塔尔周围的能量力场就会消散。\n 进入伊莫塔尔的监狱，干掉站在中间的那个恶魔。最后，在图书馆挑战托塞德林王子。当任务完成之后，到庭院中去找辛德拉古灵。"
Inst12Quest2_Location = "辛德拉古灵（厄运之槌; "..YELLOW.."西，（上层）[1]"..WHITE.."）"
Inst12Quest2_Note = "水晶塔被标记为"..BLUE.."[B]"..WHITE.."。伊莫塔尔在"..YELLOW.."[6]"..WHITE.."，托塞德林王子在"..YELLOW.."[7]"..WHITE.."。"
Inst12Quest2_Prequest = "无"
Inst12Quest2_Folgequest = "有，辛德拉的宝藏"
-- No Rewards for this quest

--Quest 3 Alliance
Inst12Quest3 = "3. 辛德拉的宝藏"
Inst12Quest3_Level = "60"
Inst12Quest3_Attain = "57"
Inst12Quest3_Aim = "返回图书馆去找到辛德拉的宝藏。拿取你的奖励吧！"
Inst12Quest3_Location = "辛德拉古灵（厄运之槌; "..YELLOW.."西，（上层）[1]"..WHITE.."）"
Inst12Quest3_Note = "你可以在图书馆的梯子下面找到宝藏"..YELLOW.."[7]"..WHITE.."。"
Inst12Quest3_Prequest = "有，伊莫塔尔的疯狂"
Inst12Quest3_Folgequest = "无"
Inst12Quest3FQuest = "true"
--
Inst12Quest3name1 = "莎草长靴"
Inst12Quest3name2 = "密林头盔"
Inst12Quest3name3 = "碾骨者"

--Quest 4 Alliance
Inst12Quest4 = "4. 克索诺斯恐惧战马（术士任务）"
Inst12Quest4_Level = "60"
Inst12Quest4_Attain = "60"
Inst12Quest4_Aim = "阅读莫苏尔的指南，并召唤出一匹克索诺斯恐惧战马，击败它，然后控制它的灵魂。."
Inst12Quest4_Location = "莫苏尔（燃烧平原; "..YELLOW.."12,31"..WHITE.."）"
Inst12Quest4_Note = "术士的史诗战马任务的最后一步。首先必须关闭水晶塔"..BLUE.."[B]"..WHITE.."。和需要杀掉伊莫塔尔"..YELLOW.."[6]"..WHITE.."。然后你可以召唤。准备20个以上的灵魂碎片是必须的，你必须消耗碎片才能维持法阵。杀死恐惧战马后，和马的灵魂对话即可完成任务。"
Inst12Quest4_Prequest = "有，末日蜡烛（"..YELLOW.."通灵学院"..WHITE.."）"
Inst12Quest4_Folgequest = "无"
Inst12Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst12Quest5 = "5. 翡翠梦境（德鲁伊饰品任务）"
Inst12Quest5_Level = "60"
Inst12Quest5_Attain = "59"
Inst12Quest5_Aim = "将这本典籍交给它的主人。"
Inst12Quest5_Location = "翡翠梦境（厄运之槌的所有几个副本的 Boss 都可能掉落）"
Inst12Quest5_Note = "奖励德鲁伊的职业饰品。把书交给博学者基尔达斯（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）。"
Inst12Quest5_Prequest = "无"
Inst12Quest5_Folgequest = "无"
--
Inst12Quest5name1 = "埃雷萨拉斯皇家徽记"

--Quest 6 Alliance
Inst12Quest6 = "6. 最伟大的猎手（猎人饰品任务）"
Inst12Quest6_Level = "60"
Inst12Quest6_Attain = "54"
Inst12Quest6_Aim = "将这本典籍交给它的主人。"
Inst12Quest6_Location = "最伟大的猎手（厄运之槌的所有几个副本的 Boss 都可能掉落）"
Inst12Quest6_Note = "奖励猎人的职业饰品。把书交给博学者基尔达斯（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）。"
Inst12Quest6_Prequest = "无"
Inst12Quest6_Folgequest = "无"
--
Inst12Quest6name1 = "埃雷萨拉斯皇家徽记"

--Quest 7 Alliance
Inst12Quest7 = "7. 奥法师的食谱（法师饰品任务）"
Inst12Quest7_Level = "60"
Inst12Quest7_Attain = "54"
Inst12Quest7_Aim = "将这本典籍交给它的主人。"
Inst12Quest7_Location = "奥法师的食谱（厄运之槌的所有几个副本的 Boss 都可能掉落）"
Inst12Quest7_Note = "奖励法师的职业饰品。把书交给博学者基尔达斯（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）。"
Inst12Quest7_Prequest = "无"
Inst12Quest7_Folgequest = "无"
--
Inst12Quest7name1 = "埃雷萨拉斯皇家徽记"

--Quest 8 Alliance
Inst12Quest8 = "8. 圣光之力（圣骑士饰品任务）"
Inst12Quest8_Level = "60"
Inst12Quest8_Attain = "54"
Inst12Quest8_Aim = "将这本典籍交给它的主人。"
Inst12Quest8_Location = "圣光之力（厄运之槌的所有几个副本的 Boss 都可能掉落）"
Inst12Quest8_Note = "奖励圣骑士的职业饰品。把书交给博学者基尔达斯（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）。"
Inst12Quest8_Prequest = "无"
Inst12Quest8_Folgequest = "无"
--
Inst12Quest8name1 = "埃雷萨拉斯皇家徽记"

--Quest 9 Alliance
Inst12Quest9 = "9. 光明不会告诉你的事情（牧师饰品任务）"
Inst12Quest9_Level = "60"
Inst12Quest9_Attain = "56"
Inst12Quest9_Aim = "将这本典籍交给它的主人。"
Inst12Quest9_Location = "光明不会告诉你的事情（厄运之槌的所有几个副本的 Boss 都可能掉落）"
Inst12Quest9_Note = "奖励牧师的职业饰品。把书交给博学者基尔达斯（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）。"
Inst12Quest9_Prequest = "无"
Inst12Quest9_Folgequest = "无"
--
Inst12Quest9name1 = "埃雷萨拉斯皇家徽记"

--Quest 10 Alliance
Inst12Quest10 = "10. 迦罗娜：潜行与诡计研究（盗贼饰品任务）"
Inst12Quest10_Level = "60"
Inst12Quest10_Attain = "54"
Inst12Quest10_Aim = "将这本典籍交给它的主人。"
Inst12Quest10_Location = "迦罗娜：潜行与诡计研究（厄运之槌的所有几个副本的 Boss 都可能掉落）"
Inst12Quest10_Note = "奖励盗贼的职业饰品。把书交给博学者基尔达斯（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）。"
Inst12Quest10_Prequest = "无"
Inst12Quest10_Folgequest = "无"
--
Inst12Quest10name1 = "埃雷萨拉斯皇家徽记"

--Quest 11 Alliance
Inst12Quest11 = "11. 你与冰霜震击（萨满祭司饰品任务）"
Inst12Quest11_Level = "60"
Inst12Quest11_Attain = "59"
Inst12Quest11_Aim = "将这本典籍交给它的主人。"
Inst12Quest11_Location = "你与冰霜震击（厄运之槌的所有几个副本的 Boss 都可能掉落）"
Inst12Quest11_Note = "奖励萨满祭司的职业饰品。把书交给博学者基尔达斯（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）。"
Inst12Quest11_Prequest = "无"
Inst12Quest11_Folgequest = "无"
--
Inst12Quest11name1 = "埃雷萨拉斯皇家徽记"

--Quest 12 Alliance
Inst12Quest12 = "12. 束缚之影（术士饰品任务）"
Inst12Quest12_Level = "60"
Inst12Quest12_Attain = "54"
Inst12Quest12_Aim = "将这本典籍交给它的主人。"
Inst12Quest12_Location = "束缚之影（厄运之槌的所有几个副本的 Boss 都可能掉落）"
Inst12Quest12_Note = "奖励术士的职业饰品。把书交给博学者基尔达斯（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）。"
Inst12Quest12_Prequest = "无"
Inst12Quest12_Folgequest = "无"
--
Inst12Quest12name1 = "埃雷萨拉斯皇家徽记"

--Quest 13 Alliance
Inst12Quest13 = "13. 防御宝典（战士饰品任务）"
Inst12Quest13_Level = "60"
Inst12Quest13_Attain = "57"
Inst12Quest13_Aim = "将这本典籍交给它的主人。"
Inst12Quest13_Location = "防御宝典（厄运之槌的所有几个副本的 Boss 都可能掉落）"
Inst12Quest13_Note = "奖励战士的职业饰品。把书交给博学者基尔达斯（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）。"
Inst12Quest13_Prequest = "无"
Inst12Quest13_Folgequest = "无"
--
Inst12Quest13name1 = "埃雷萨拉斯皇家徽记"

--Quest 14 Alliance
Inst12Quest14 = "14. 专注圣典"
Inst12Quest14_Level = "60"
Inst12Quest14_Attain = "60"
Inst12Quest14_Aim = "将专注圣典、1块原始黑钻石、4份大块魔光碎片和2张暗影之皮交给厄运之槌的博学者莱德罗斯，以换取一份专注秘药。"
Inst12Quest14_Location = "博学者莱德罗斯（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）"
Inst12Quest14_Note = "没有前续任务，但是 精灵的传说任务必须完成后才能接到这个任务。"
Inst12Quest14_Prequest = "无"
Inst12Quest14_Folgequest = "无"
--
Inst12Quest14name1 = "专注秘药"

--Quest 15 Alliance
Inst12Quest15 = "15. 防护圣典"
Inst12Quest15_Level = "60"
Inst12Quest15_Attain = "60"
Inst12Quest15_Aim = "将防护圣典、1块原始黑钻石、2份大块魔光碎片和1份磨损的憎恶缝合线交给厄运之槌的博学者莱德罗斯，以换取一份防护秘药。"
Inst12Quest15_Location = "博学者莱德罗斯（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）"
Inst12Quest15_Note = "没有前续任务，但是 精灵的传说任务必须完成后才能接到这个任务。"
Inst12Quest15_Prequest = "无"
Inst12Quest15_Folgequest = "无"
--
Inst12Quest15name1 = "防护秘药"

--Quest 16 Alliance
Inst12Quest16 = "16. 急速圣典"
Inst12Quest16_Level = "60"
Inst12Quest16_Attain = "60"
Inst12Quest16_Aim = "将急速圣典、1块原始黑钻石、2份大块魔光碎片和2份英雄之血交给厄运之槌的博学者莱德罗斯，以换取一份急速秘药。"
Inst12Quest16_Location = "博学者莱德罗斯（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）"
Inst12Quest16_Note = "没有前续任务，但是 精灵的传说任务必须完成后才能接到这个任务。"
Inst12Quest16_Prequest = "无"
Inst12Quest16_Folgequest = "无"
--
Inst12Quest16name1 = "急速秘药"

--Quest 17 Alliance
Inst12Quest17 = "17. 弗洛尔的屠龙技术纲要（战士，圣骑士）"
Inst12Quest17_Level = "60"
Inst12Quest17_Attain = "60"
Inst12Quest17_Aim = "将《弗洛尔的屠龙技术纲要》还回图书馆。"
Inst12Quest17_Location = "弗洛尔的屠龙技术纲要（"..YELLOW.."厄运之槌"..WHITE.."的 Boss 都可能掉落）"
Inst12Quest17_Note = "战士和圣骑士才能接此任务。把书交给博学者莱德罗斯（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）。完成后开始奎尔塞拉任务。"
Inst12Quest17_Prequest = "无"
Inst12Quest17_Folgequest = "有，煅造奎尔塞拉"
-- No Rewards for this quest


--Quest 1 Horde
Inst12Quest1_HORDE = "1. 精灵的传说"
Inst12Quest1_HORDE_Level = "60"
Inst12Quest1_HORDE_Attain = "54"
Inst12Quest1_HORDE_Aim = "到厄运之槌去寻找卡里尔·温萨鲁斯。向莫沙彻营地的先知科鲁拉克报告你所找到的信息。"
Inst12Quest1_HORDE_Location = "先知科鲁拉克（菲拉斯 - 莫沙彻营地; "..YELLOW.."74,43"..WHITE.."）"
Inst12Quest1_HORDE_Note = "卡里尔·温萨鲁斯在（厄运之槌; "..YELLOW.."西，"..GREEN.."图书馆[1']"..WHITE.."）。"
Inst12Quest1_HORDE_Prequest = "无"
Inst12Quest1_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst12Quest2_HORDE = Inst12Quest2
Inst12Quest2_HORDE_Level = Inst12Quest2_Level
Inst12Quest2_HORDE_Attain = Inst12Quest2_Attain
Inst12Quest2_HORDE_Aim = Inst12Quest2_Aim
Inst12Quest2_HORDE_Location = Inst12Quest2_Location
Inst12Quest2_HORDE_Note = Inst12Quest2_Note
Inst12Quest2_HORDE_Prequest = Inst12Quest2_Prequest
Inst12Quest2_HORDE_Folgequest = Inst12Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst12Quest3_HORDE = Inst12Quest3
Inst12Quest3_HORDE_Level = Inst12Quest3_Level
Inst12Quest3_HORDE_Attain = Inst12Quest3_Attain
Inst12Quest3_HORDE_Aim = Inst12Quest3_Aim
Inst12Quest3_HORDE_Location = Inst12Quest3_Location
Inst12Quest3_HORDE_Note = Inst12Quest3_Note
Inst12Quest3_HORDE_Prequest = Inst12Quest3_Prequest
Inst12Quest3_HORDE_Folgequest = Inst12Quest3_Folgequest
Inst12Quest3FQuest_HORDE = "true"
--
Inst12Quest3name1_HORDE = Inst12Quest3name1
Inst12Quest3name2_HORDE = Inst12Quest3name2
Inst12Quest3name3_HORDE = Inst12Quest3name3

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst12Quest4_HORDE = Inst12Quest4
Inst12Quest4_HORDE_Level = Inst12Quest4_Level
Inst12Quest4_HORDE_Attain = Inst12Quest4_Attain
Inst12Quest4_HORDE_Aim = Inst12Quest4_Aim
Inst12Quest4_HORDE_Location = Inst12Quest4_Location
Inst12Quest4_HORDE_Note = Inst12Quest4_Note
Inst12Quest4_HORDE_Prequest = Inst12Quest4_Prequest
Inst12Quest4_HORDE_Folgequest = Inst12Quest4_Folgequest
Inst12Quest4PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst12Quest5_HORDE = Inst12Quest5
Inst12Quest5_HORDE_Level = Inst12Quest5_Level
Inst12Quest5_HORDE_Attain = Inst12Quest5_Attain
Inst12Quest5_HORDE_Aim = Inst12Quest5_Aim
Inst12Quest5_HORDE_Location = Inst12Quest5_Location
Inst12Quest5_HORDE_Note = Inst12Quest5_Note
Inst12Quest5_HORDE_Prequest = Inst12Quest5_Prequest
Inst12Quest5_HORDE_Folgequest = Inst12Quest5_Folgequest
--
Inst12Quest5name1_HORDE = Inst12Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst12Quest6_HORDE = Inst12Quest6
Inst12Quest6_HORDE_Level = Inst12Quest6_Level
Inst12Quest6_HORDE_Attain = Inst12Quest6_Attain
Inst12Quest6_HORDE_Aim = Inst12Quest6_Aim
Inst12Quest6_HORDE_Location = Inst12Quest6_Location
Inst12Quest6_HORDE_Note = Inst12Quest6_Note
Inst12Quest6_HORDE_Prequest = Inst12Quest6_Prequest
Inst12Quest6_HORDE_Folgequest = Inst12Quest6_Folgequest
--
Inst12Quest6name1_HORDE = Inst12Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst12Quest7_HORDE = Inst12Quest7
Inst12Quest7_HORDE_Level = Inst12Quest7_Level
Inst12Quest7_HORDE_Attain = Inst12Quest7_Attain
Inst12Quest7_HORDE_Aim = Inst12Quest7_Aim
Inst12Quest7_HORDE_Location = Inst12Quest7_Location
Inst12Quest7_HORDE_Note = Inst12Quest7_Note
Inst12Quest7_HORDE_Prequest = Inst12Quest7_Prequest
Inst12Quest7_HORDE_Folgequest = Inst12Quest7_Folgequest
--
Inst12Quest7name1_HORDE = Inst12Quest7name1

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst12Quest8_HORDE = Inst12Quest8
Inst12Quest8_HORDE_Level = Inst12Quest8_Level
Inst12Quest8_HORDE_Attain = Inst12Quest8_Attain
Inst12Quest8_HORDE_Aim = Inst12Quest8_Aim
Inst12Quest8_HORDE_Location = Inst12Quest8_Location
Inst12Quest8_HORDE_Note = Inst12Quest8_Note
Inst12Quest8_HORDE_Prequest = Inst12Quest8_Prequest
Inst12Quest8_HORDE_Folgequest = Inst12Quest8_Folgequest
--
Inst12Quest8name1_HORDE = Inst12Quest8name1

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst12Quest9_HORDE = Inst12Quest9
Inst12Quest9_HORDE_Level = Inst12Quest9_Level
Inst12Quest9_HORDE_Attain = Inst12Quest9_Attain
Inst12Quest9_HORDE_Aim = Inst12Quest9_Aim
Inst12Quest9_HORDE_Location = Inst12Quest9_Location
Inst12Quest9_HORDE_Note = Inst12Quest9_Note
Inst12Quest9_HORDE_Prequest = Inst12Quest9_Prequest
Inst12Quest9_HORDE_Folgequest = Inst12Quest9_Folgequest
--
Inst12Quest9name1_HORDE = Inst12Quest9name1

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst12Quest10_HORDE = Inst12Quest10
Inst12Quest10_HORDE_Level = Inst12Quest10_Level
Inst12Quest10_HORDE_Attain = Inst12Quest10_Attain
Inst12Quest10_HORDE_Aim = Inst12Quest10_Aim
Inst12Quest10_HORDE_Location = Inst12Quest10_Location
Inst12Quest10_HORDE_Note = Inst12Quest10_Note
Inst12Quest10_HORDE_Prequest = Inst12Quest10_Prequest
Inst12Quest10_HORDE_Folgequest = Inst12Quest10_Folgequest
--
Inst12Quest10name1_HORDE = Inst12Quest10name1

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst12Quest11_HORDE = Inst12Quest11
Inst12Quest11_HORDE_Level = Inst12Quest11_Level
Inst12Quest11_HORDE_Attain = Inst12Quest11_Attain
Inst12Quest11_HORDE_Aim = Inst12Quest11_Aim
Inst12Quest11_HORDE_Location = Inst12Quest11_Location
Inst12Quest11_HORDE_Note = Inst12Quest11_Note
Inst12Quest11_HORDE_Prequest = Inst12Quest11_Prequest
Inst12Quest11_HORDE_Folgequest = Inst12Quest11_Folgequest
--
Inst12Quest11name1_HORDE = Inst12Quest11name1

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst12Quest12_HORDE = Inst12Quest12
Inst12Quest12_HORDE_Level = Inst12Quest12_Level
Inst12Quest12_HORDE_Attain = Inst12Quest12_Attain
Inst12Quest12_HORDE_Aim = Inst12Quest12_Aim
Inst12Quest12_HORDE_Location = Inst12Quest12_Location
Inst12Quest12_HORDE_Note = Inst12Quest12_Note
Inst12Quest12_HORDE_Prequest = Inst12Quest12_Prequest
Inst12Quest12_HORDE_Folgequest = Inst12Quest12_Folgequest
--
Inst12Quest12name1_HORDE = Inst12Quest12name1

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst12Quest13_HORDE = Inst12Quest13
Inst12Quest13_HORDE_Level = Inst12Quest13_Level
Inst12Quest13_HORDE_Attain = Inst12Quest13_Attain
Inst12Quest13_HORDE_Aim = Inst12Quest13_Aim
Inst12Quest13_HORDE_Location = Inst12Quest13_Location
Inst12Quest13_HORDE_Note = Inst12Quest13_Note
Inst12Quest13_HORDE_Prequest = Inst12Quest13_Prequest
Inst12Quest13_HORDE_Folgequest = Inst12Quest13_Folgequest
--
Inst12Quest13name1_HORDE = Inst12Quest13name1

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst12Quest14_HORDE = Inst12Quest14
Inst12Quest14_HORDE_Level = Inst12Quest14_Level
Inst12Quest14_HORDE_Attain = Inst12Quest14_Attain
Inst12Quest14_HORDE_Aim = Inst12Quest14_Aim
Inst12Quest14_HORDE_Location = Inst12Quest14_Location
Inst12Quest14_HORDE_Note = Inst12Quest14_Note
Inst12Quest14_HORDE_Prequest = Inst12Quest14_Prequest
Inst12Quest14_HORDE_Folgequest = Inst12Quest14_Folgequest
--
Inst12Quest14name1_HORDE = Inst12Quest14name1

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst12Quest15_HORDE = Inst12Quest15
Inst12Quest15_HORDE_Level = Inst12Quest15_Level
Inst12Quest15_HORDE_Attain = Inst12Quest15_Attain
Inst12Quest15_HORDE_Aim = Inst12Quest15_Aim
Inst12Quest15_HORDE_Location = Inst12Quest15_Location
Inst12Quest15_HORDE_Note = Inst12Quest15_Note
Inst12Quest15_HORDE_Prequest = Inst12Quest15_Prequest
Inst12Quest15_HORDE_Folgequest = Inst12Quest15_Folgequest
--
Inst12Quest15name1_HORDE = Inst12Quest15name1

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst12Quest16_HORDE = Inst12Quest16
Inst12Quest16_HORDE_Level = Inst12Quest16_Level
Inst12Quest16_HORDE_Attain = Inst12Quest16_Attain
Inst12Quest16_HORDE_Aim = Inst12Quest16_Aim
Inst12Quest16_HORDE_Location = Inst12Quest16_Location
Inst12Quest16_HORDE_Note = Inst12Quest16_Note
Inst12Quest16_HORDE_Prequest = Inst12Quest16_Prequest
Inst12Quest16_HORDE_Folgequest = Inst12Quest16_Folgequest
--
Inst12Quest16name1_HORDE = Inst12Quest16name1

--Quest 17 Horde  (same as Quest 17 Alliance)
Inst12Quest17_HORDE = Inst12Quest17
Inst12Quest17_HORDE_Level = Inst12Quest17_Level
Inst12Quest17_HORDE_Attain = Inst12Quest17_Attain
Inst12Quest17_HORDE_Aim = Inst12Quest17_Aim
Inst12Quest17_HORDE_Location = Inst12Quest17_Location
Inst12Quest17_HORDE_Note = Inst12Quest17_Note
Inst12Quest17_HORDE_Prequest = Inst12Quest17_Prequest
Inst12Quest17_HORDE_Folgequest = Inst12Quest17_Folgequest
-- No Rewards for this quest



--------------- INST13 - Maraudon (Mara) ---------------

Inst13Story = "玛拉顿被狂暴的玛拉顿半人马所保护，那是凄凉之地最神圣的地方。玛拉顿是扎尔塔的伟大神庙，扎尔塔使半神塞纳留斯不朽的儿子之一。传说说扎尔塔和瑟莱德丝大地元素公主的私生子成为了半人马种族。据说半人马这个野蛮的种族在其出生了之后就开始转向他们的父亲并将其杀死。有些人则相信瑟莱德丝在悲伤中将扎尔塔的灵魂困了起来，并将其藏在洞中——利用它的能量来达到一些不可告人的目的。在玛拉顿错综复杂的地下通道中到处都是邪恶的半人马可汗灵魂和瑟莱德丝的元素爪牙。"
Inst13Caption = "玛拉顿"
Inst13QAA = "8 个任务"
Inst13QAH = "8 个任务"

--Quest 1 Alliance
Inst13Quest1 = "1. 暗影残片"
Inst13Quest1_Level = "42"
Inst13Quest1_Attain = "39"
Inst13Quest1_Aim = "从玛拉顿收集10块暗影残片，然后把它们交给尘泥沼泽塞拉摩岛上的大法师特沃什。"
Inst13Quest1_Location = "大法师特沃什（尘泥沼泽 - 塞拉摩岛; "..YELLOW.."66,49"..WHITE.."）"
Inst13Quest1_Note = "暗影残片可以从“暗影碎片巡游者”或者“暗影碎片击碎者”身上找到。"
Inst13Quest1_Prequest = "无"
Inst13Quest1_Folgequest = "无"
--
Inst13Quest1name1 = "热情暗影残片坠饰"
Inst13Quest1name2 = "巨型暗影碎片坠饰"

--Quest 2 Alliance
Inst13Quest2 = "2. 维利塔恩的污染"
Inst13Quest2_Level = "47"
Inst13Quest2_Attain = "41"
Inst13Quest2_Aim = "在玛拉顿里用天蓝水瓶在橙色水晶池中装满水。\n在维利斯塔姆藤蔓上使用装满水的天蓝水瓶，使堕落的诺克赛恩幼体出现。\n治疗8株植物并杀死那些诺克赛恩幼体，然后向尼耶尔前哨站的塔琳德莉亚复命。"
Inst13Quest2_Location = "塔琳德莉亚（凄凉之地 - 尼耶尔前哨站; "..YELLOW.."68,8"..WHITE.."）"
Inst13Quest2_Note = "你可以在玛拉顿里任何一个橙色的水池装水。藤蔓生长在橙色或紫色区域。"
Inst13Quest2_Prequest = "无"
Inst13Quest2_Folgequest = "无"
--
Inst13Quest2name1 = "树种之环"
Inst13Quest2name2 = "山艾束腰"
Inst13Quest2name3 = "枝爪护手"

--Quest 3 Alliance
Inst13Quest3 = "3. 扭曲的邪恶"
Inst13Quest3_Level = "47"
Inst13Quest3_Attain = "41"
Inst13Quest3_Aim = "为凄凉之地的维洛收集25个瑟莱德丝水晶雕像。"
Inst13Quest3_Location = "维洛（凄凉之地; "..YELLOW.."62,39"..WHITE.."）"
Inst13Quest3_Note = "大多数玛拉顿里的敌人都掉落雕像。"
Inst13Quest3_Prequest = "无"
Inst13Quest3_Folgequest = "无"
--
Inst13Quest3name1 = "聪颖长袍"
Inst13Quest3name2 = "轻环头盔"
Inst13Quest3name3 = "无情链甲"
Inst13Quest3name4 = "巨石肩铠"

--Quest 4 Alliance
Inst13Quest4 = "4. 贱民的指引"
Inst13Quest4_Level = "48"
Inst13Quest4_Attain = "39"
Inst13Quest4_Aim = "阅读贱民的指引，然后从玛拉顿得到联合坠饰，将其交给凄凉之地南部的半人马贱民。"
Inst13Quest4_Location = "半人马贱民（凄凉之地; "..YELLOW.."45,86"..WHITE.."）"
Inst13Quest4_Note = "5个可汗（《贱民的指引》的描述）"
Inst13Quest4_Page = {2, "你会在凄凉之地的南部找到半人马贱民。他在 "..YELLOW.."44,85"..WHITE.." 和  "..YELLOW.."50,87"..WHITE.."  之间来回走动。\n首先，你必须杀死无名预言者（"..YELLOW.."副本入口地图[A]"..WHITE.."）。你可以在进入副本之前找到它，就在你选择进紫色入口还是橙色入口那里。杀了它后，你还要杀死5个可汗。如果你选择中间的路，你会找到第一可汗（"..YELLOW.."副本入口地图[1]"..WHITE.."）。第二可汗在玛拉顿进入副本之前的紫色部分（"..YELLOW.."副本入口地图[2]"..WHITE.."）。第三可汗在进入副本之前的橙色部分（"..YELLOW.."副本入口地图[3]"..WHITE.."）。 第四可汗在"..YELLOW.."[4]"..WHITE.."附近。第五可汗在"..YELLOW.."[1]"..WHITE.."附近。", };
Inst13Quest4_Prequest = "无"
Inst13Quest4_Folgequest = "无"
--
Inst13Quest4name1 = "天选者印记"

--Quest 5 Alliance
Inst13Quest5 = "5. 玛拉顿的传说"
Inst13Quest5_Level = "49"
Inst13Quest5_Attain = "41"
Inst13Quest5_Aim = "找回塞雷布拉斯节杖的两个部分：塞雷布拉斯魔棒和塞雷布拉斯钻石。\n然后设法和塞雷布拉斯对话。"
Inst13Quest5_Location = "凯雯德拉（凄凉之地 - 玛拉顿; "..YELLOW.."副本入口地图[4]"..WHITE.."）"
Inst13Quest5_Note = "凯雯德拉就在进入副本之前的橙色部分的开始处。\n你可以从诺克塞恩那里得到塞雷布拉斯魔棒"..YELLOW.."[2]"..WHITE.."，从维利塔恩那里得到塞雷布拉斯钻石"..YELLOW.."[5]"..WHITE.."。塞雷布拉斯在"..YELLOW.."[7]"..WHITE.."。你需要打败他才能和他说话。"
Inst13Quest5_Prequest = "无"
Inst13Quest5_Folgequest = "有，塞雷布拉斯节杖"
-- No Rewards for this quest

--Quest 6 Alliance
Inst13Quest6 = "6. 塞雷布拉斯节杖"
Inst13Quest6_Level = "49"
Inst13Quest6_Attain = "41"
Inst13Quest6_Aim = "帮助赎罪的塞雷布拉斯制作塞雷布拉斯节杖。\n当仪式完成之后再和他谈谈。"
Inst13Quest6_Location = "赎罪的塞雷布拉斯（玛拉顿 "..YELLOW.."[7]"..WHITE.."）"
Inst13Quest6_Note = "塞雷布拉斯制造节杖。当仪式完成之后，和他对话。"
Inst13Quest6_Prequest = "有，玛拉顿的传说"
Inst13Quest6_Folgequest = "无"
Inst13Quest6FQuest = "true"
--
Inst13Quest6name1 = "塞雷布拉斯节杖"

--Quest 7 Alliance
Inst13Quest7 = "7. 大地的污染"
Inst13Quest7_Level = "51"
Inst13Quest7_Attain = "45"
Inst13Quest7_Aim = "杀死瑟莱德丝公主，然后回到凄凉之地尼耶尔前哨站的守护者玛兰迪斯那里复命。"
Inst13Quest7_Location = "守护者玛兰迪斯（凄凉之地 - 尼耶尔前哨站; "..YELLOW.."63,10"..WHITE.."）"
Inst13Quest7_Note = "瑟莱德丝公主在"..YELLOW.."[11]"..WHITE.."。"
Inst13Quest7_Prequest = "无"
Inst13Quest7_Folgequest = "有，生命之种"
--
Inst13Quest7name1 = "痛击之刃"
Inst13Quest7name2 = "苏醒之杖"
Inst13Quest7name3 = "绿色守护者之弓"

--Quest 8 Alliance
Inst13Quest8 = "8. 生命之种"
Inst13Quest8_Level = "51"
Inst13Quest8_Attain = "39"
Inst13Quest8_Aim = "到月光林地去找到雷姆洛斯，将生命之种交给他。"
Inst13Quest8_Location = "扎尔塔的灵魂（玛拉顿 "..YELLOW.."[11]"..WHITE.."）"
Inst13Quest8_Note = "杀死公主后，扎尔塔的灵魂就会出现（"..YELLOW.."[11]"..WHITE.."）。守护者雷姆洛斯在（月光林地 - 雷姆洛斯神殿; "..YELLOW.."36,41"..WHITE.."）。"
Inst13Quest8_Prequest = "有，大地的污染"
Inst13Quest8_Folgequest = "无"
Inst13Quest8FQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst13Quest1_HORDE = "1. 暗影残片"
Inst13Quest1_HORDE_Level = "42"
Inst13Quest1_HORDE_Attain = "39"
Inst13Quest1_HORDE_Aim = "从玛拉顿收集10块暗影残片，然后把它们交给奥格瑞玛的尤塞尔奈。"
Inst13Quest1_HORDE_Location = "尤塞尔奈（奥格瑞玛 - 精神谷; "..YELLOW.."39,86"..WHITE.."）"
Inst13Quest1_HORDE_Note = "暗影残片可以从“暗影碎片巡游者”或者“暗影碎片击碎者”身上找到。"
Inst13Quest1_HORDE_Prequest = "无"
Inst13Quest1_HORDE_Folgequest = "无"
--
Inst13Quest1name1_HORDE = "热情暗影残片坠饰"
Inst13Quest1name2_HORDE = "巨型暗影碎片坠饰"

--Quest 2 Horde
Inst13Quest2_HORDE = "2. 维利塔恩的污染"
Inst13Quest2_HORDE_Level = "47"
Inst13Quest2_HORDE_Attain = "41"
Inst13Quest2_HORDE_Aim = "在玛拉顿里用天蓝水瓶在橙色水晶池中装满水。\n在维利斯塔姆藤蔓上使用装满水的天蓝水瓶，使堕落的诺克赛恩幼体出现。\n治疗8株植物并杀死那些诺克赛恩幼体，然后向葬影村的瓦克·战痕复命。"
Inst13Quest2_HORDE_Location = "瓦克·战痕（凄凉之地 - 葬影村; "..YELLOW.."23,70"..WHITE.."）"
Inst13Quest2_HORDE_Note = "你可以在玛拉顿里任何一个橙色的水池装水。藤蔓生长在橙色或紫色区域。"
Inst13Quest2_HORDE_Prequest = "无"
Inst13Quest2_HORDE_Folgequest = "无"
--
Inst13Quest2name1_HORDE = "树种之环"
Inst13Quest2name2_HORDE = "山艾束腰 "
Inst13Quest2name3_HORDE = "枝爪护手"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst13Quest3_HORDE = Inst13Quest3
Inst13Quest3_HORDE_Level = Inst13Quest3_Level
Inst13Quest3_HORDE_Attain = Inst13Quest3_Attain
Inst13Quest3_HORDE_Aim = Inst13Quest3_Aim
Inst13Quest3_HORDE_Location = Inst13Quest3_Location
Inst13Quest3_HORDE_Note = Inst13Quest3_Note
Inst13Quest3_HORDE_Prequest = Inst13Quest3_Prequest
Inst13Quest3_HORDE_Folgequest = Inst13Quest3_Folgequest
--
Inst13Quest3name1_HORDE = Inst13Quest3name1
Inst13Quest3name2_HORDE = Inst13Quest3name2
Inst13Quest3name3_HORDE = Inst13Quest3name3
Inst13Quest3name4_HORDE = Inst13Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst13Quest4_HORDE = Inst13Quest4
Inst13Quest4_HORDE_Level = Inst13Quest4_Level
Inst13Quest4_HORDE_Attain = Inst13Quest4_Attain
Inst13Quest4_HORDE_Aim = Inst13Quest4_Aim
Inst13Quest4_HORDE_Location = Inst13Quest4_Location
Inst13Quest4_HORDE_Note = Inst13Quest4_Note
Inst13Quest4_HORDE_Page = Inst13Quest4_Page
Inst13Quest4_HORDE_Prequest = Inst13Quest4_Prequest
Inst13Quest4_HORDE_Folgequest = Inst13Quest4_Folgequest
--
Inst13Quest4name1_HORDE = Inst13Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst13Quest5_HORDE = Inst13Quest5
Inst13Quest5_HORDE_Level = Inst13Quest5_Level
Inst13Quest5_HORDE_Attain = Inst13Quest5_Attain
Inst13Quest5_HORDE_Aim = Inst13Quest5_Aim
Inst13Quest5_HORDE_Location = Inst13Quest5_Location
Inst13Quest5_HORDE_Note = Inst13Quest5_Note
Inst13Quest5_HORDE_Prequest = Inst13Quest5_Prequest
Inst13Quest5_HORDE_Folgequest = Inst13Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst13Quest6_HORDE = Inst13Quest6
Inst13Quest6_HORDE_Level = Inst13Quest6_Level
Inst13Quest6_HORDE_Attain = Inst13Quest6_Attain
Inst13Quest6_HORDE_Aim = Inst13Quest6_Aim
Inst13Quest6_HORDE_Location = Inst13Quest6_Location
Inst13Quest6_HORDE_Note = Inst13Quest6_Note
Inst13Quest6_HORDE_Prequest = Inst13Quest6_Prequest
Inst13Quest6_HORDE_Folgequest = Inst13Quest6_Folgequest
Inst13Quest6FQuest_HORDE = Inst13Quest6FQuest
--
Inst13Quest6name1_HORDE = Inst13Quest6name1

--Quest 7 Horde
Inst13Quest7_HORDE = "7. 大地的污染"
Inst13Quest7_HORDE_Level = "51"
Inst13Quest7_HORDE_Attain = "45"
Inst13Quest7_HORDE_Aim = "杀死瑟莱德丝公主，然后回到凄凉之地葬影村附近的瑟琳德拉那里复命。"
Inst13Quest7_HORDE_Location = "瑟琳德拉（凄凉之地 - 葬影村; "..YELLOW.."27,77"..WHITE.."）"
Inst13Quest7_HORDE_Note = "瑟莱德丝公主在"..YELLOW.."[11]"..WHITE.."。"
Inst13Quest7_HORDE_Prequest = "无"
Inst13Quest7_HORDE_Folgequest = "有，生命之种"
--
Inst13Quest7name1_HORDE = "痛击之刃"
Inst13Quest7name2_HORDE = "苏醒之杖"
Inst13Quest7name3_HORDE = "绿色守护者之弓"

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst13Quest8_HORDE = Inst13Quest8
Inst13Quest8_HORDE_Level = Inst13Quest8_Level
Inst13Quest8_HORDE_Attain = Inst13Quest8_Attain
Inst13Quest8_HORDE_Aim = Inst13Quest8_Aim
Inst13Quest8_HORDE_Location = Inst13Quest8_Location
Inst13Quest8_HORDE_Note = Inst13Quest8_Note
Inst13Quest8_HORDE_Prequest = Inst13Quest8_Prequest
Inst13Quest8_HORDE_Folgequest = Inst13Quest8_Folgequest
Inst13Quest8FQuest_HORDE = Inst13Quest8FQuest
-- No Rewards for this quest



--------------- INST14 - Molten Core (MC) ---------------

Inst14Story = "熔火之心就在黑石深渊的底层。这是黑石山的中心，也是很久以前扭转矮人内战情势的地方，索瑞森大帝将元素火焰之王，拉格纳罗斯召唤到世界来。尽管火焰之王无法远离熔火之心，但人们相信他的元素爪牙控制着黑铁矮人，在遗迹之外组建军队。拉格纳罗斯休眠的燃烧之湖有一道裂缝连接火平面，让邪恶的元素可以通过。拉格纳罗斯的首要代理人是管理者埃克索图斯——因为这是唯一能唤醒火焰之王的狡猾元素。"
Inst14Caption = "熔火之心"
Inst14QAA = "5 个任务"
Inst14QAH = "5 个任务"

--Quest 1 Alliance
Inst14Quest1 = "1. 熔火之心"
Inst14Quest1_Level = "60"
Inst14Quest1_Attain = "58"
Inst14Quest1_Aim = "杀死一个火焰之王、一个熔岩巨人、一个上古熔火恶犬和一个熔岩奔腾者，然后回到艾萨拉的海达克西斯公爵那里。"
Inst14Quest1_Location = "海达克西斯公爵（艾萨拉; "..YELLOW.."79,73"..WHITE.."）"
Inst14Quest1_Note = "这些都不是熔火之心的 Boss。"
Inst14Quest1_Prequest = "有，艾博希尔之眼（"..YELLOW.."黑石塔上层"..WHITE.."）"
Inst14Quest1_Folgequest = "有，海达克西斯的使者"
Inst14Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst14Quest2 = "2. 敌人之手"
Inst14Quest2_Level = "60"
Inst14Quest2_Attain = "60"
Inst14Quest2_Aim = "将鲁西弗隆之手、萨弗隆之手、基赫纳斯之手和沙斯拉尔之手交给艾萨拉的海达克西斯公爵。"
Inst14Quest2_Location = "海达克西斯公爵（艾萨拉; "..YELLOW.."79,73"..WHITE.."）"
Inst14Quest2_Note = "鲁西弗隆在"..YELLOW.."[1]"..WHITE.."，萨弗隆先驱者在"..YELLOW.."[8]"..WHITE.."，基赫纳斯在"..YELLOW.."[3]"..WHITE.."，还有沙斯拉尔在"..YELLOW.."[5]"..WHITE.."。"
Inst14Quest2_Prequest = "有，海达克西斯的使者"
Inst14Quest2_Folgequest = "无"
Inst14Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst14Quest3 = "3. 逐风者桑德兰"
Inst14Quest3_Level = "60"
Inst14Quest3_Attain = "60"
Inst14Quest3_Aim = "如果你想要把逐风者桑德兰从监牢里释放出来，你就必须找到左右两块逐风者禁锢之颅，10块源质锭，以及火焰之王的精华，把它们交给德米提恩。"
Inst14Quest3_Location = "德米提恩（希利苏斯; "..YELLOW.."22,9"..WHITE.."）"
Inst14Quest3_Note = "雷霆之怒，逐风者的祝福之剑部分任务，当你从加尔"..YELLOW.."[4]"..WHITE.."拿到逐风者禁锢之颅右半和迦顿男爵"..YELLOW.."[6]"..WHITE.."拿到逐风者禁锢之颅左半后，与德米提恩对话开启任务线。拉格纳罗斯"..YELLOW.."[10]"..WHITE.."掉落火焰之王的精华。完成这些后，召唤并杀掉桑德兰王子，这是一个40人团队 Boss。"
Inst14Quest3_Prequest = "有，复生之瓶"
Inst14Quest3_Folgequest = "有，觉醒吧，雷霆之怒！"
Inst14Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst14Quest4 = "4. 瑟银兄弟会契约"
Inst14Quest4_Level = "60"
Inst14Quest4_Attain = "60"
Inst14Quest4_Aim = "如果你愿意接受萨弗隆的设计图，请将瑟银兄弟会契约交给罗克图斯·暗契。"
Inst14Quest4_Location = "罗克图斯·暗契（黑石深渊; "..YELLOW.."[15]"..WHITE.."）"
Inst14Quest4_Note = "你需要萨弗隆铁锭来与洛克图斯签订契约。熔火之心的焚化者古雷曼格"..YELLOW.."[7]"..WHITE.."掉落铁锭。"
Inst14Quest4_Prequest = "无"
Inst14Quest4_Folgequest = "无"
--
Inst14Quest4name1 = "设计图：萨弗隆之锤"

--Quest 5 Alliance
Inst14Quest5 = "5. 远古石叶"
Inst14Quest5_Level = "60"
Inst14Quest5_Attain = "60"
Inst14Quest5_Aim = "找到远古石叶的主人。"
Inst14Quest5_Location = "在（火焰之王的宝箱; "..YELLOW.."[9]"..WHITE.."）之中，可能有远古石叶。"
Inst14Quest5_Note = "把远古石叶交还给古树瓦特鲁斯（费伍德森林 - 铁木森林; "..YELLOW.."49,24"..WHITE.."）。"
Inst14Quest5_Prequest = "无"
Inst14Quest5_Folgequest = "有，龙筋箭袋（"..YELLOW.."艾索雷葛斯"..WHITE.."）"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst14Quest1_HORDE = Inst14Quest1
Inst14Quest1_HORDE_Level = Inst14Quest1_Level
Inst14Quest1_HORDE_Attain = Inst14Quest1_Attain
Inst14Quest1_HORDE_Aim = Inst14Quest1_Aim
Inst14Quest1_HORDE_Location = Inst14Quest1_Location
Inst14Quest1_HORDE_Note = Inst14Quest1_Note
Inst14Quest1_HORDE_Prequest = Inst14Quest1_Prequest
Inst14Quest1_HORDE_Folgequest = Inst14Quest1_Folgequest
Inst14Quest1PreQuest_HORDE = Inst14Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst14Quest2_HORDE = Inst14Quest2
Inst14Quest2_HORDE_Level = Inst14Quest2_Level
Inst14Quest2_HORDE_Attain = Inst14Quest2_Attain
Inst14Quest2_HORDE_Aim = Inst14Quest2_Aim
Inst14Quest2_HORDE_Location = Inst14Quest2_Location
Inst14Quest2_HORDE_Note = Inst14Quest2_Note
Inst14Quest2_HORDE_Prequest = Inst14Quest2_Prequest
Inst14Quest2_HORDE_Folgequest = Inst14Quest2_Folgequest
Inst14Quest2FQuest_HORDE = Inst14Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst14Quest3_HORDE = Inst14Quest3
Inst14Quest3_HORDE_Level = Inst14Quest3_Level
Inst14Quest3_HORDE_Attain = Inst14Quest3_Attain
Inst14Quest3_HORDE_Aim = Inst14Quest3_Aim
Inst14Quest3_HORDE_Location = Inst14Quest3_Location
Inst14Quest3_HORDE_Note = Inst14Quest3_Note
Inst14Quest3_HORDE_Prequest = Inst14Quest3_Prequest
Inst14Quest3_HORDE_Folgequest = Inst14Quest3_Folgequest
Inst14Quest3PreQuest_HORDE = Inst14Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst14Quest4_HORDE = Inst14Quest4
Inst14Quest4_HORDE_Level = Inst14Quest4_Level
Inst14Quest4_HORDE_Attain = Inst14Quest4_Attain
Inst14Quest4_HORDE_Aim = Inst14Quest4_Aim
Inst14Quest4_HORDE_Location = Inst14Quest4_Location
Inst14Quest4_HORDE_Note = Inst14Quest4_Note
Inst14Quest4_HORDE_Prequest = Inst14Quest4_Prequest
Inst14Quest4_HORDE_Folgequest = Inst14Quest4_Folgequest
--
Inst14Quest4name1_HORDE = Inst14Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst14Quest5_HORDE = Inst14Quest5
Inst14Quest5_HORDE_Level = Inst14Quest5_Level
Inst14Quest5_HORDE_Attain = Inst14Quest5_Attain
Inst14Quest5_HORDE_Aim = Inst14Quest5_Aim
Inst14Quest5_HORDE_Location = Inst14Quest5_Location
Inst14Quest5_HORDE_Note = Inst14Quest5_Note
Inst14Quest5_HORDE_Prequest = Inst14Quest5_Prequest
Inst14Quest5_HORDE_Folgequest = Inst14Quest5_Folgequest
-- No Rewards for this quest



--------------- INST15 - Naxxramas (Naxx) ---------------

Inst15Story = "飘浮在瘟疫之地上空的浮空要塞纳克萨玛斯是巫妖王最强大的副官——克尔苏加德的旗舰。巫妖王的仆从们在这座要塞中筹划着新的攻势，要给整个艾泽拉斯世界带来恐慌和灾难。天灾军团再一次开始了他们的征程……"
Inst15Caption = "纳克萨玛斯"
Inst15QAA = "5 个任务"
Inst15QAH = "5 个任务"

--Quest 1 Alliance
Inst15Quest1 = "1. 克尔苏加德的末日"
Inst15Quest1_Level = "60"
Inst15Quest1_Attain = "60"
Inst15Quest1_Aim = "将克尔苏加德的护符匣带往东瘟疫之地圣光之愿礼拜堂。"
Inst15Quest1_Location = "克尔苏加德（纳克萨玛斯; "..YELLOW.."绿色 2"..WHITE.."）"
Inst15Quest1_Note = "英尼戈·蒙托尔神父（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."81,58"..WHITE.."）"
Inst15Quest1_Prequest = "无"
Inst15Quest1_Folgequest = "无"
--
Inst15Quest1name1 = "勇士印记"
Inst15Quest1name2 = "勇士印记"

--Quest 2 Alliance
Inst15Quest2 = "2. 我只会唱这一首歌……"
Inst15Quest2_Level = "60"
Inst15Quest2_Attain = "60"
Inst15Quest2_Aim = "将2个冰冻符文、2个水之精华、2块蓝宝石和30金币交给东瘟疫之地圣光之愿礼拜堂的工匠威尔海姆。"
Inst15Quest2_Location = "工匠威尔海姆（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."81,60"..WHITE.."）"
Inst15Quest2_Note = "纳克萨玛斯掉落的溶解之语可以从墙上得到冰冻符文。"
Inst15Quest2_Prequest = "无"
Inst15Quest2_Folgequest = "无"
--
Inst15Quest2name1 = "冰川护腿"
Inst15Quest2name2 = "破冰护腿"
Inst15Quest2name3 = "寒鳞护腿"
Inst15Quest2name4 = "北极护腿"

--Quest 3 Alliance
Inst15Quest3 = "3. 战争的回响"
Inst15Quest3_Level = "60"
Inst15Quest3_Attain = "60"
Inst15Quest3_Aim = "东瘟疫之地圣光之愿礼拜堂的指挥官埃里戈尔·黎明使者要你杀死5个畸形妖、5只岩肤石像鬼、8个死亡骑士队长和3只毒性捕猎者。"
Inst15Quest3_Location = "指挥官埃里戈尔·黎明使者（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."82,58"..WHITE.."）"
Inst15Quest3_Note = "需要杀死的怪物是各个不同的区的小怪。这个任务完成后才能制作 T3 套装。"
Inst15Quest3_Prequest = "无"
Inst15Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst15Quest4 = "4. 拉玛兰迪的命运"
Inst15Quest4_Level = "60"
Inst15Quest4_Attain = "60"
Inst15Quest4_Aim = "进入纳克萨玛斯的宫殿，找到拉玛兰迪的下落。"
Inst15Quest4_Location = "科尔法克斯，圣光之勇士（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."82,58"..WHITE.."）"
Inst15Quest4_Note = "纳克萨玛斯的小怪随机掉落拉玛兰迪的命运，任何有此任务的都可以拾取。"
Inst15Quest4_Prequest = "无"
Inst15Quest4_Folgequest = "有，拉玛兰迪的寒冰之握"
-- No Rewards for this quest

--Quest 5 Alliance
Inst15Quest5 = "5. 拉玛兰迪的寒冰之握"
Inst15Quest5_Level = "60"
Inst15Quest5_Attain = "60"
Inst15Quest5_Aim = "东瘟疫之地圣光之愿礼拜堂的科尔法克斯要1个冰冻符文、1块蓝宝石和1块奥金锭。"
Inst15Quest5_Location = "科尔法克斯，圣光之勇士（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."82,58"..WHITE.."）"
Inst15Quest5_Note = "纳克萨玛斯掉落的溶解之语可以从墙上得到冰冻符文。"
Inst15Quest5_Prequest = "有，拉玛兰迪的命运"
Inst15Quest5_Folgequest = "无"
Inst15Quest5FQuest = "true"
--
Inst15Quest5name1 = "拉玛兰迪的寒冰之握"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst15Quest1_HORDE = Inst15Quest1
Inst15Quest1_HORDE_Level = Inst15Quest1_Level
Inst15Quest1_HORDE_Attain = Inst15Quest1_Attain
Inst15Quest1_HORDE_Aim = Inst15Quest1_Aim
Inst15Quest1_HORDE_Location = Inst15Quest1_Location
Inst15Quest1_HORDE_Note = Inst15Quest1_Note
Inst15Quest1_HORDE_Prequest = Inst15Quest1_Prequest
Inst15Quest1_HORDE_Folgequest = Inst15Quest1_Folgequest
--
Inst15Quest1name1_HORDE = Inst15Quest1name1
Inst15Quest1name2_HORDE = Inst15Quest1name2
Inst15Quest1name3_HORDE = Inst15Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst15Quest2_HORDE = Inst15Quest2
Inst15Quest2_HORDE_Level = Inst15Quest2_Level
Inst15Quest2_HORDE_Attain = Inst15Quest2_Attain
Inst15Quest2_HORDE_Aim = Inst15Quest2_Aim
Inst15Quest2_HORDE_Location = Inst15Quest2_Location
Inst15Quest2_HORDE_Note = Inst15Quest2_Note
Inst15Quest2_HORDE_Prequest = Inst15Quest2_Prequest
Inst15Quest2_HORDE_Folgequest = Inst15Quest2_Folgequest
--
Inst15Quest2name1_HORDE = Inst15Quest2name1
Inst15Quest2name2_HORDE = Inst15Quest2name2
Inst15Quest2name3_HORDE = Inst15Quest2name3
Inst15Quest2name4_HORDE = Inst15Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst15Quest3_HORDE = Inst15Quest3
Inst15Quest3_HORDE_Level = Inst15Quest3_Level
Inst15Quest3_HORDE_Attain = Inst15Quest3_Attain
Inst15Quest3_HORDE_Aim = Inst15Quest3_Aim
Inst15Quest3_HORDE_Location = Inst15Quest3_Location
Inst15Quest3_HORDE_Note = Inst15Quest3_Note
Inst15Quest3_HORDE_Prequest = Inst15Quest3_Prequest
Inst15Quest3_HORDE_Folgequest = Inst15Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst15Quest4_HORDE = Inst15Quest4
Inst15Quest4_HORDE_Level = Inst15Quest4_Level
Inst15Quest4_HORDE_Attain = Inst15Quest4_Attain
Inst15Quest4_HORDE_Aim = Inst15Quest4_Aim
Inst15Quest4_HORDE_Location = Inst15Quest4_Location
Inst15Quest4_HORDE_Note = Inst15Quest4_Note
Inst15Quest4_HORDE_Prequest = Inst15Quest4_Prequest
Inst15Quest4_HORDE_Folgequest = Inst15Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst15Quest5_HORDE = Inst15Quest5
Inst15Quest5_HORDE_Level = Inst15Quest5_Level
Inst15Quest5_HORDE_Attain = Inst15Quest5_Attain
Inst15Quest5_HORDE_Aim = Inst15Quest5_Aim
Inst15Quest5_HORDE_Location = Inst15Quest5_Location
Inst15Quest5_HORDE_Note = Inst15Quest5_Note
Inst15Quest5_HORDE_Prequest = Inst15Quest5_Prequest
Inst15Quest5_HORDE_Folgequest = Inst15Quest5_Folgequest
Inst15Quest5FQuest_HORDE = Inst15Quest5FQuest
--
Inst15Quest5name1_HORDE = Inst15Quest5name1



--------------- INST16 - Onyxia's Lair (Ony) ---------------

Inst16Story = "奥妮克希亚是强大之龙死亡之翼的女儿，也是黑石塔擅长阴谋的奈法利安大王的妹妹。据说奥妮克希亚喜欢借由干涉人类种族的政治来腐化他们。为达此目的他会变成各种人型生物形态，使用魔法和力量干预不同种族间的所有事情。有些人更认为奥妮克希亚使用父亲曾用过的化名——皇室普瑞斯托。若不插手凡人事务的时候，奥妮克希亚就在黑龙谷下的一处火焰洞穴居住，那是尘泥沼泽里的一个阴暗沼泽。阴险的黑龙军团剩余成员在此守护着她。"
Inst16Caption = "奥妮克希亚的巢穴"
Inst16QAA = "2 个任务"
Inst16QAH = "2 个任务"

--Quest 1 Alliance
Inst16Quest1 = "1. 铸造奎尔塞拉"
Inst16Quest1_Level = "60"
Inst16Quest1_Attain = "60"
Inst16Quest1_Aim = "你必须设法让奥妮克希亚对这把未淬火的上古之刃喷射火焰。完成之后，捡起加热过的上古之刃。你要注意的是，加热过的上古之刃不会一直保持被加热的状态，时间非常紧迫。"
Inst16Quest1_Location = "博学者莱德罗斯（厄运之槌; "..YELLOW.."北，图书馆[1']"..WHITE..")"
Inst16Quest1_Note = "当奥妮克希亚的生命值在10%到15%时，在她前面放置未淬火的上古之刃，她将为此淬火。当奥妮克希亚死亡，重新拾取任务物品，选择她的尸体并使用它后，就可以返回完成此任务。"
Inst16Quest1_Prequest = "有，弗洛尔的屠龙技术纲要（厄运之槌; "..YELLOW..""..WHITE.."） -> 铸造奎尔塞拉"
Inst16Quest1_Folgequest = "无"
Inst16Quest1PreQuest = "true"
--
Inst16Quest1name1 = "奎尔塞拉"

--Quest 2 Alliance
Inst16Quest2 = "2. 联盟的胜利"
Inst16Quest2_Level = "60"
Inst16Quest2_Attain = "60"
Inst16Quest2_Aim = "将奥妮克希亚的头颅交给暴风城的伯瓦尔·弗塔根公爵。"
Inst16Quest2_Location = "奥妮克希亚的头颅（奥妮克希亚掉落; "..YELLOW.."[3]"..WHITE.."）"
Inst16Quest2_Note = "伯瓦尔·弗塔根公爵在（暴风城 - 暴风要塞; "..YELLOW.."78,20"..WHITE.."）。只有在团队中的一人可以拾取此物品并且只可完成一次。\n\n下一步任务领取奖励。"
Inst16Quest2_Prequest = "无"
Inst16Quest2_Folgequest = "有，英雄庆典"
--
Inst16Quest2name1 = "奥妮克希亚龙血护符"
Inst16Quest2name2 = "屠龙者的徽记"
Inst16Quest2name3 = "奥妮克希亚龙牙坠饰"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst16Quest1_HORDE = Inst16Quest1
Inst16Quest1_HORDE_Attain = Inst16Quest1_Attain
Inst16Quest1_HORDE_Level = Inst16Quest1_Level
Inst16Quest1_HORDE_Aim = Inst16Quest1_Aim
Inst16Quest1_HORDE_Location = Inst16Quest1_Location
Inst16Quest1_HORDE_Note = Inst16Quest1_Note
Inst16Quest1_HORDE_Prequest = Inst16Quest1_Prequest
Inst16Quest1_HORDE_Folgequest = Inst16Quest1_Folgequest
Inst16Quest1PreQuest_HORDE = Inst16Quest1PreQuest
--
Inst16Quest1name1_HORDE = Inst16Quest1name1

--Quest 2 Horde
Inst16Quest2_HORDE = "2. 部落的胜利"
Inst16Quest2_HORDE_Level = "60"
Inst16Quest2_HORDE_Attain = "60"
Inst16Quest2_HORDE_Aim = "将奥妮克希亚的头颅交给奥格瑞玛的萨尔。 "
Inst16Quest2_HORDE_Location = "奥妮克希亚的头颅（奥妮克希亚掉落; "..YELLOW.."[3]"..WHITE.."）"
Inst16Quest2_HORDE_Note = "萨尔在（奥格瑞玛 - 智慧谷; "..YELLOW.."31,37"..WHITE.."）。 只有在团队中的一人可以拾取此物品并且只可完成一次。\n\n下一步任务领取奖励。"
Inst16Quest2_HORDE_Prequest = "无"
Inst16Quest2_HORDE_Folgequest = "有，万众敬仰"
--
Inst16Quest2name1_HORDE = "奥妮克希亚龙血护符"
Inst16Quest2name2_HORDE = "屠龙者的徽记"
Inst16Quest2name3_HORDE = "奥妮克希亚龙牙坠饰"



--------------- INST17 - Razorfen Downs (RFD) ---------------

Inst17Story = "剃刀高地和剃刀沼泽一样由巨大的藤蔓组成，剃刀高地是野猪人的传统都城。在那错综复杂的荆棘迷宫中居住着大群忠诚的野猪人军队以及他们的高等牧师——亡首部族。然而最近，一股阴影力量笼罩了这个原始的洞穴。亡灵天灾的人在巫妖寒冰之王亚门纳尔的带领下控制了野猪部族并将荆棘迷宫变成了亡灵力量的堡垒。现在野猪人正奋力战斗来重新夺回他们的城市，并阻止亚门纳尔继续控制贫瘠之地。"
Inst17Caption = "剃刀高地"
Inst17QAA = "3 个任务"
Inst17QAH = "4 个任务"

--Quest 1 Alliance
Inst17Quest1 = "1. 邪恶之地"
Inst17Quest1_Level = "35"
Inst17Quest1_Attain = "28"
Inst17Quest1_Aim = "杀掉8个剃刀沼泽护卫者、8个剃刀沼泽织棘者和8个亡首教徒，然后向剃刀高地入口处的麦雷姆·月歌复命。"
Inst17Quest1_Location = "麦雷姆·月歌（贫瘠之地 - 剃刀高地; "..YELLOW.."49,94 "..WHITE.."）"
Inst17Quest1_Note = "这些怪出现在你进入副本前经过的路上。"
Inst17Quest1_Prequest = "无"
Inst17Quest1_Folgequest = "无"
-- No Rewards for this quest

--Quest 2 Alliance
Inst17Quest2 = "2. 封印神像"
Inst17Quest2_Level = "37"
Inst17Quest2_Attain = "34"
Inst17Quest2_Aim = "保护奔尼斯特拉兹来到剃刀高地的野猪人神像处。当他在进行仪式封印神像时保护他。"
Inst17Quest2_Location = "奔尼斯特拉兹（剃刀高地; "..YELLOW.."[2] "..WHITE.."）"
Inst17Quest2_Note = "你必须同意帮助奔尼斯特拉兹封印神像，封印过程中会刷新怪物攻击他，必须保证他的安全。完成后在神像面前获得奖励。"
Inst17Quest2_Prequest = "有，剃刀高地的亡灵天灾"
Inst17Quest2_Folgequest = "无"
Inst17Quest2PreQuest = "true"
--
Inst17Quest2name1 = "龙爪戒指"

--Quest 3 Alliance
Inst17Quest3 = "3. 与圣光同在"
Inst17Quest3_Level = "42"
Inst17Quest3_Attain = "39"
Inst17Quest3_Aim = "大主教本尼迪塔斯要你去杀死剃刀高地的寒冰之王亚门纳尔。"
Inst17Quest3_Location = "大主教本尼迪塔斯（暴风城 - 光明大教堂; "..YELLOW.."39,27 "..WHITE.."）"
Inst17Quest3_Note = "寒冰之王亚门纳尔是剃刀高地的最后一个 Boss。你可以在"..YELLOW.."[6]"..WHITE.."找到他。"
Inst17Quest3_Prequest = "无"
Inst17Quest3_Folgequest = "无"
--
Inst17Quest3name1 = "征服者之剑"
Inst17Quest3name2 = "琥珀之光"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst17Quest1_HORDE = Inst17Quest1
Inst17Quest1_HORDE_Level = Inst17Quest1_Level
Inst17Quest1_HORDE_Attain = Inst17Quest1_Attain
Inst17Quest1_HORDE_Aim = Inst17Quest1_Aim
Inst17Quest1_HORDE_Location = Inst17Quest1_Location
Inst17Quest1_HORDE_Note = Inst17Quest1_Note
Inst17Quest1_HORDE_Prequest = Inst17Quest1_Prequest
Inst17Quest1_HORDE_Folgequest = Inst17Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde
Inst17Quest2_HORDE = "2. 邪恶的盟友"
Inst17Quest2_HORDE_Level = "36"
Inst17Quest2_HORDE_Attain = "28"
Inst17Quest2_HORDE_Aim = "把玛克林大使的头颅带给幽暗城的瓦里玛萨斯。"
Inst17Quest2_HORDE_Location = "瓦里玛萨斯（幽暗城 - 皇家区; "..YELLOW.."56,92 "..WHITE.."）"
Inst17Quest2_HORDE_Note = "剃刀沼泽最后的 Boss 给出前导任务。玛克林大使位置在进入副本前外面的空地上（贫瘠之地 - 剃刀高地; "..YELLOW.."48,92"..WHITE.."）。"
Inst17Quest2_HORDE_Prequest = "有，邪恶的盟友"
Inst17Quest2_HORDE_Folgequest = "无"
Inst17Quest2PreQuest_HORDE = "true"
--
Inst17Quest2name1_HORDE = "破颅者"
Inst17Quest2name2_HORDE = "钉枪"
Inst17Quest2name3_HORDE = "狂热长袍"

--Quest 3 Horde  (same as Quest 2 Alliance)
Inst17Quest3_HORDE = "3. Extinguishing the Idol"
Inst17Quest3_HORDE_Level = Inst17Quest2_Level
Inst17Quest3_HORDE_Attain = Inst17Quest2_Attain
Inst17Quest3_HORDE_Aim = Inst17Quest2_Aim
Inst17Quest3_HORDE_Location = Inst17Quest2_Location
Inst17Quest3_HORDE_Note = Inst17Quest2_Note
Inst17Quest3_HORDE_Prequest = Inst17Quest2_Prequest
Inst17Quest3_HORDE_Folgequest = Inst17Quest2_Folgequest
Inst17Quest3PreQuest_HORDE = Inst17Quest2PreQuest
--
Inst17Quest3name1_HORDE = Inst17Quest2name1

--Quest 4 Horde
Inst17Quest4_HORDE = "4. 寒冰之王"
Inst17Quest4_HORDE_Level = "42"
Inst17Quest4_HORDE_Attain = "37"
Inst17Quest4_HORDE_Aim = "安德鲁·布隆奈尔要你杀了寒冰之王亚门纳尔并将其头骨带回来。"
Inst17Quest4_HORDE_Location = "安德鲁·布隆奈尔（幽暗城 - 魔法区; "..YELLOW.."72,32 "..WHITE.."）"
Inst17Quest4_HORDE_Note = "寒冰之王亚门纳尔是剃刀高地最后一个 Boss。位于"..YELLOW.."[6]"..WHITE.."。"
Inst17Quest4_HORDE_Prequest = "无"
Inst17Quest4_HORDE_Folgequest = "无"
--
Inst17Quest4name1_HORDE = "征服者之剑"
Inst17Quest4name2_HORDE = "琥珀之光"



--------------- INST18 - Razorfen Kraul (RFK) ---------------

Inst18Story = "在一万年前的古代战争中，万能的半神阿迦玛甘和燃烧军团进行了激战。虽然这头巨大的猪在战斗中倒下了，但是他的努力最终拯救了艾泽拉斯大陆免遭涂炭。虽然已经过去了很久，但是在它血液流淌的地方巨大的荆棘藤蔓生长出来。那些被认为是半神后代的野猪人占领了这些地区并将其奉为圣地。这些荆棘地的中心被称为剃刀岭。而巨大的剃刀沼泽则被一个老丑婆卡尔加·刺肋所占据。在她的统治下，信奉萨满教的野猪人和别的部族以及部落为敌。有些人甚至猜测卡尔加还在和亡灵天灾的有来往——她想要联合亡灵天灾来达到一些不可告人的险恶目的。"
Inst18Caption = "剃刀沼泽"
Inst18QAA = "5 个任务"
Inst18QAH = "5 个任务"

--Quest 1 Alliance
Inst18Quest1 = "1. 蓝叶薯"
Inst18Quest1_Level = "26"
Inst18Quest1_Attain = "20"
Inst18Quest1_Aim = "找到一个开孔的箱子。\n找到一根地鼠指挥棒。\n找到并阅读《地鼠指挥手册》。\n在剃刀沼泽里用开孔的箱子召唤一只地鼠，然后用指挥棒驱使它去搜寻蓝叶薯。\n把地鼠指挥棒、开孔的箱子和10块蓝叶薯交给棘齿城的麦伯克·米希瑞克斯。"
Inst18Quest1_Location = "麦伯克·米希瑞克斯（贫瘠之地 - 棘齿城; "..YELLOW.."62,37"..WHITE.."）"
Inst18Quest1_Note = "开孔的箱子，地鼠指挥棒和《地鼠指挥手册》都在麦伯克·米希瑞克斯附近不远的地方。"
Inst18Quest1_Prequest = "无"
Inst18Quest1_Folgequest = "无"
--
Inst18Quest1name1 = "一小袋宝石"

--Quest 2 Alliance
Inst18Quest2 = "2. 临终遗言"
Inst18Quest2_Level = "30"
Inst18Quest2_Attain = "27"
Inst18Quest2_Aim = "将塔莎拉的坠饰带给达纳苏斯的塔莎拉·静水。"
Inst18Quest2_Location = "赫尔拉斯·静水（剃刀沼泽; "..YELLOW.." [8]"..WHITE.."）"
Inst18Quest2_Note = "坠饰随机掉落。你必须把坠饰带给塔莎拉·静水（达纳苏斯 - 贸易区; "..YELLOW.."69,67"..WHITE.."）。"
Inst18Quest2_Prequest = "无"
Inst18Quest2_Folgequest = "无"
--
Inst18Quest2name1 = "悲伤披风"
Inst18Quest2name2 = "枪骑兵战靴"

--Quest 3 Alliance
Inst18Quest3 = "3. 进口商威利克斯"
Inst18Quest3_Level = "30"
Inst18Quest3_Attain = "22"
Inst18Quest3_Aim = "护送进口商威利克斯逃出剃刀沼泽。"
Inst18Quest3_Location = "进口商威利克斯（剃刀沼泽; "..YELLOW.." [8]"..WHITE.."）"
Inst18Quest3_Note = "你必须把威利克斯护送到入口处。完成后向他领取奖励。"
Inst18Quest3_Prequest = "无"
Inst18Quest3_Folgequest = "无"
--
Inst18Quest3name1 = "猴子戒指"
Inst18Quest3name2 = "蛇环"
Inst18Quest3name3 = "猛虎指环"

--Quest 4 Alliance
Inst18Quest4 = "4. 卡尔加·刺肋"
Inst18Quest4_Level = "34"
Inst18Quest4_Attain = "29"
Inst18Quest4_Aim = "把卡尔加·刺肋的徽章交给萨兰纳尔的法芬德尔。"
Inst18Quest4_Location = "法芬德尔（菲拉斯 - 萨兰纳尔; "..YELLOW.."89,46"..WHITE.."）"
Inst18Quest4_Note = "卡尔加·刺肋"..YELLOW.."[7]"..WHITE.."掉落徽章。"
Inst18Quest4_Prequest = "有，亨里格的日记"
Inst18Quest4_Folgequest = "有，卡尔加·刺肋"
Inst18Quest4PreQuest = "true"
--
Inst18Quest4name1 = "法芬德尔的猎枪"
Inst18Quest4name2 = "绿宝石护肩"
Inst18Quest4name3 = "石拳束带"
Inst18Quest4name4 = "石饰圆盾"

--Quest 5 Alliance
Inst18Quest5 = "5. 弗伦的铠甲（战士任务）"
Inst18Quest5_Level = "28"
Inst18Quest5_Attain = "20"
Inst18Quest5_Aim = "收集必需的材料，将它们交给暴风城的弗伦·长须。"
Inst18Quest5_Location = "弗伦·长须（暴风城 - 矮人区; "..YELLOW.."57,16"..WHITE.."）"
Inst18Quest5_Note = "只有战士才能接到这个任务！\n你可以从鲁古格"..YELLOW.."[1]"..WHITE.."得到燃素。\n\n湿地的蜘蛛掉落烧焦的蜘蛛牙，石爪山脉的奇美幼崽拉掉落烧焦的奇美拉角、雌奇美拉掉落光滑的奇美拉角。"
Inst18Quest5_Prequest = "有，铸盾师"
Inst18Quest5_Folgequest = "有，（请见注释）"
Inst18Quest5PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst18Quest1_HORDE = Inst18Quest1
Inst18Quest1_HORDE_Level = Inst18Quest1_Level
Inst18Quest1_HORDE_Attain = Inst18Quest1_Attain
Inst18Quest1_HORDE_Aim = Inst18Quest1_Aim
Inst18Quest1_HORDE_Location = Inst18Quest1_Location
Inst18Quest1_HORDE_Note = Inst18Quest1_Note
Inst18Quest1_HORDE_Prequest = Inst18Quest1_Prequest
Inst18Quest1_HORDE_Folgequest = Inst18Quest1_Folgequest
--
Inst18Quest1name1_HORDE = Inst18Quest1name1

--Quest 2 Horde  (same as Quest 3 Alliance)
Inst18Quest2_HORDE = "2. 进口商威利克斯"
Inst18Quest2_HORDE_Level = Inst18Quest3_Level
Inst18Quest2_HORDE_Attain = Inst18Quest3_Attain
Inst18Quest2_HORDE_Aim = Inst18Quest3_Aim
Inst18Quest2_HORDE_Location = Inst18Quest3_Location
Inst18Quest2_HORDE_Note = Inst18Quest3_Note
Inst18Quest2_HORDE_Prequest = Inst18Quest3_Prequest
Inst18Quest2_HORDE_Folgequest = Inst18Quest3_Folgequest
--
Inst18Quest2name1_HORDE = Inst18Quest3name1
Inst18Quest2name2_HORDE = Inst18Quest3name2
Inst18Quest2name3_HORDE = Inst18Quest3name3

-- Quest 3 Horde
Inst18Quest3_HORDE = "3. 蝙蝠的粪便"
Inst18Quest3_HORDE_Level = "33"
Inst18Quest3_HORDE_Attain = "30"
Inst18Quest3_HORDE_Aim = "帮幽暗城的大药剂师法拉尼尔带回一堆沼泽蝙蝠的粪便。"
Inst18Quest3_HORDE_Location = "法拉尼尔（幽暗城 - 炼金房; "..YELLOW.."48,69 "..WHITE.."）"
Inst18Quest3_HORDE_Note = "任何蝙蝠都会掉落沼泽蝙蝠的粪便。"
Inst18Quest3_HORDE_Prequest = "无"
Inst18Quest3_HORDE_Folgequest = "有，狂热之心（"..YELLOW.."[剃刀高地]"..WHITE.."）"
-- No Rewards for this quest

--Quest 4 Horde
Inst18Quest4_HORDE = "4. 奥尔德的报复"
Inst18Quest4_HORDE_Level = "34"
Inst18Quest4_HORDE_Attain = "29"
Inst18Quest4_HORDE_Aim = "把卡尔加·刺肋的心脏交给雷霆崖的奥尔德·石塔。"
Inst18Quest4_HORDE_Location = "奥尔德·石塔（雷霆崖; "..YELLOW.."36,59 "..WHITE.."）"
Inst18Quest4_HORDE_Note = "卡尔加·刺肋在"..YELLOW.."[7]"..WHITE.."、"
Inst18Quest4_HORDE_Prequest = "无"
Inst18Quest4_HORDE_Folgequest = "无"
--
Inst18Quest4name1_HORDE = "绿宝石护肩"
Inst18Quest4name2_HORDE = "石拳束带"
Inst18Quest4name3_HORDE = "石饰圆盾"

--Quest 5 Horde
Inst18Quest5_HORDE = "5. 野蛮护甲（战士任务）"
Inst18Quest5_HORDE_Level = "30"
Inst18Quest5_HORDE_Attain = "20"
Inst18Quest5_HORDE_Aim = "为索恩格瑞姆收集15根烟雾铁锭、10份蓝铜粉、10块铁锭和1瓶燃素。"
Inst18Quest5_HORDE_Location = "索恩格瑞姆·火眼（贫瘠之地; "..YELLOW.."57,30 "..WHITE.."）"
Inst18Quest5_HORDE_Note = "只有战士才能接到这个任务！\n你可以从鲁古格"..YELLOW.."[1]"..WHITE.."得到燃素。\n\n完成这个任务后他会给你一个新的任务。"
Inst18Quest5_HORDE_Prequest = "有，和索恩格瑞姆交谈"
Inst18Quest5_HORDE_Folgequest = "有，（请见注释）"
Inst18Quest5PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST19 - SM: Library (SM Lib) ---------------

Inst19Story = "血色修道院曾经是洛丹伦王国牧师的荣耀之地——那里是学习圣光只是和膜拜的中心。随着在第三次大战中亡灵天灾的崛起，宁静的修道院成为了疯狂的血色十字军的要塞。十字军对于所有非人类都有着偏激的态度，无论他们是自己的盟友还是对手。他们相信所有任何外来者都带着亡灵的瘟疫——他们必须被摧毁。有报告说所有进入修道院的冒险者都要面对血色十字军指挥官莫格莱尼——他控制了一群狂热的十字军战士。然而，修道院的真正主人是大检察官怀特迈恩——一个疯狂的牧师，她具有复活死去的战士来为其效劳的能力。"
Inst19Caption = "血色修道院（图书馆）"
Inst19QAA = "3 个任务"
Inst19QAH = "5 个任务"

--Quest 1 Alliance
Inst19Quest1 = "1. 泰坦神话"
Inst19Quest1_Level = "38"
Inst19Quest1_Attain = "28"
Inst19Quest1_Aim = "从修道院拿回《泰坦神话》，把它交给铁炉堡的图书馆员麦伊·苍尘。"
Inst19Quest1_Location = "图书馆员麦伊·苍尘（铁炉堡 - 探险者大厅; "..YELLOW.."74,12 "..WHITE.."）"
Inst19Quest1_Note = "你可以在血色修道院的图书馆奥法师杜安之前左侧一个走廊的地板上（"..YELLOW.."[2]"..WHITE.."）找到这本书。"
Inst19Quest1_Prequest = "无"
Inst19Quest1_Folgequest = "无"
--
Inst19Quest1name1 = "探险者协会的奖状"

--Quest 2 Alliance
Inst19Quest2 = "2. 能量仪祭（法师任务）"
Inst19Quest2_Level = "40"
Inst19Quest2_Attain = "30"
Inst19Quest2_Aim = "将《能量仪祭》交给尘泥沼泽的塔贝萨。"
Inst19Quest2_Location = "塔贝萨（尘泥沼泽; "..YELLOW.."43,57"..WHITE.."）"
Inst19Quest2_Note = "法师职业任务，你可以在血色修道院的图书馆奥法师杜安之前左侧一个走廊的地板上（"..YELLOW.."[2]"..WHITE.."）找到这本书。"
Inst19Quest2_Prequest = "有，解封咒语"
Inst19Quest2_Folgequest = "有，法师的魔杖"
Inst19Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst19Quest3 = "3. 以圣光之名"
Inst19Quest3_Level = "40"
Inst19Quest3_Attain = "34"
Inst19Quest3_Aim = "杀死大检察官怀特迈恩，血色十字军指挥官莫格莱尼，十字军的勇士赫洛德和驯犬者洛克希并向南海镇的莱雷恩复命。"
Inst19Quest3_Location =  "虔诚的莱雷恩（希尔斯布莱德丘陵 - 南海镇; "..YELLOW.."51,58 "..WHITE.."）"
Inst19Quest3_Note ="此系列任务始于克罗雷修士（暴风城 - 光明大教堂; "..YELLOW.."42,24"..WHITE.."）。\n大检察官怀特迈恩和血色十字军指挥官莫格莱尼在血色修道院"..YELLOW.."教堂[2]"..WHITE.."，赫洛德在血色修道院"..YELLOW.."军械库[1]"..WHITE.."，驯犬者洛克希在血色修道院"..YELLOW.."图书馆[1]"..WHITE.."。"
Inst19Quest3_Prequest = "有，安东修士 -> 血色之路"
Inst19Quest3_Folgequest = "有"
Inst19Quest3PreQuest = "true"
--
Inst19Quest3name1 = "平静之剑"
Inst19Quest3name2 = "咬骨之斧"
Inst19Quest3name3 = "黑暗威胁"
Inst19Quest3name4 = "洛瑞卡宝珠"


--Quest 1 Horde
Inst19Quest1_HORDE = "1. 狂热之心"
Inst19Quest1_HORDE_Level = "33"
Inst19Quest1_HORDE_Attain = "30"
Inst19Quest1_HORDE_Aim = "幽暗城的大药剂师法拉尼尔需要20颗狂热之心。"
Inst19Quest1_HORDE_Location = "大药剂师法拉尼尔（幽暗城 - 炼金房; "..YELLOW.."48,69 "..WHITE.."）"
Inst19Quest1_HORDE_Note = "血色所有的怪物均会掉落。"
Inst19Quest1_HORDE_Prequest = "有，蝙蝠的粪便（"..YELLOW.."[剃刀沼泽]"..WHITE.."）"
Inst19Quest1_HORDE_Folgequest = "无"
Inst19Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst19Quest2_HORDE = "2. 知识的试炼"
Inst19Quest2_HORDE_Level = "36"
Inst19Quest2_HORDE_Attain = "26"
Inst19Quest2_HORDE_Aim = "找到《亡灵的起源》，把它交给幽暗城的帕科瓦·芬塔拉斯。"
Inst19Quest2_HORDE_Location = "帕科瓦·芬塔拉斯（幽暗城 - 炼金房; "..YELLOW.."57,65 "..WHITE.."）"
Inst19Quest2_HORDE_Note = "此系列任务始于多恩·平原行者（千针石林; "..YELLOW.."53,41"..WHITE.."）。\n书在血色修道院图书馆里。"
Inst19Quest2_HORDE_Prequest = "有，信仰的试炼 -> 耐力的试炼 -> 力量的试炼"
Inst19Quest2_HORDE_Folgequest = "有，知识的试炼"
Inst19Quest2PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde
Inst19Quest3_HORDE = "3. 堕落者纲要"
Inst19Quest3_HORDE_Level = "38"
Inst19Quest3_HORDE_Attain = "28"
Inst19Quest3_HORDE_Aim = "从提瑞斯法林地血色修道院里找到《堕落者纲要》，把它交给雷霆崖的圣者图希克。"
Inst19Quest3_HORDE_Location = "圣者图希克（雷霆崖; "..YELLOW.."34,47"..WHITE.."）"
Inst19Quest3_HORDE_Note = "你可以在血色图书馆里找到这这本书。"
Inst19Quest3_HORDE_Prequest = "无"
Inst19Quest3_HORDE_Folgequest = "无"
--
Inst19Quest3name1_HORDE = "邪恶防护者"
Inst19Quest3name2_HORDE = "力石圆盾"
Inst19Quest3name3_HORDE = "终结宝珠"

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst19Quest4_HORDE = "4. 能量仪祭（法师任务）"
Inst19Quest4_HORDE_Level = Inst19Quest2_Level
Inst19Quest4_HORDE_Attain = Inst19Quest2_Attain
Inst19Quest4_HORDE_Aim = Inst19Quest2_Aim
Inst19Quest4_HORDE_Location = Inst19Quest2_Location
Inst19Quest4_HORDE_Note = Inst19Quest2_Note
Inst19Quest4_HORDE_Prequest = Inst19Quest2_Prequest
Inst19Quest4_HORDE_Folgequest = Inst19Quest2_Folgequest
Inst19Quest4PreQuest_HORDE = Inst19Quest2_PreQuest
-- No Rewards for this quest

--Quest 5 Horde
Inst19Quest5_HORDE = "5. 深入血色修道院"
Inst19Quest5_HORDE_Level = "42"
Inst19Quest5_HORDE_Attain = "33"
Inst19Quest5_HORDE_Aim = "杀掉大检察官怀特迈恩、血色十字军指挥官莫格莱尼、血色十字军勇士赫洛德和驯犬者洛克希，然后向幽暗城的瓦里玛萨斯回报。"
Inst19Quest5_HORDE_Location = "瓦里玛萨斯（幽暗城 - 皇家区; "..YELLOW.."56,92 "..WHITE.."）"
Inst19Quest5_HORDE_Note = "大检察官怀特迈恩和血色十字军指挥官莫格莱尼在血色修道院"..YELLOW.."教堂[2]"..WHITE.."，赫洛德在血色修道院"..YELLOW.."军械库[1]"..WHITE.."，驯犬者洛克希在血色修道院"..YELLOW.."图书馆[1]"..WHITE.."。"
Inst19Quest5_HORDE_Prequest = "无"
Inst19Quest5_HORDE_Folgequest = "无"
--
Inst19Quest5name1_HORDE = "预兆之剑"
Inst19Quest5name2_HORDE = "预言藤杖"
Inst19Quest5name3_HORDE = "龙血项链"



--------------- INST20 - Scholomance (Scholo) ---------------

Inst20Story = "通灵学院位于凯尔达隆废弃的城堡中的地下室中。那里曾经是高贵的巴罗夫家族的，但是在第二次大战中凯尔达隆变成了一块废墟。法师克尔苏加德经常向他的诅咒神教信徒承诺可以用对于巫妖王的效忠来换取永恒的生命。巴罗克家族受到克尔苏加德的魅惑而将城堡和其地下室献给了亡灵天灾。那些信徒然后将巴罗夫家族的人杀死并把地下室变成了通灵学院。虽然克尔苏加德不再住在这个地下室中，但是狂热的信徒和讲师都还留在那里。强大的巫妖，莱斯·霜语以亡灵天灾的名义控制了这里——而凡人亡灵巫师黑暗院长加丁则是这个学校邪恶的校长。"
Inst20Caption = "通灵学院"
Inst20QAA = "10 个任务"
Inst20QAH = "10 个任务"

--Quest 1 Alliance
Inst20Quest1 = "1. 瘟疫之龙"
Inst20Quest1_Level = "58"
Inst20Quest1_Attain = "55"
Inst20Quest1_Aim = "杀掉20只瘟疫龙崽，然后向圣光之愿礼拜堂的贝蒂娜·比格辛克复命。"
Inst20Quest1_Location = "贝蒂娜·比格辛克（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."81,59"..WHITE.."）"
Inst20Quest1_Note = "瘟疫之龙在尸骨储藏所，去往血骨傀儡的大房间。"
Inst20Quest1_Prequest = "无"
Inst20Quest1_Folgequest = "有，健康的龙鳞"
-- No Rewards for this quest

--Quest 2 Alliance
Inst20Quest2 = "2. 健康的龙鳞"
Inst20Quest2_Level = "58"
Inst20Quest2_Attain = "56"
Inst20Quest2_Aim = "把健康的龙鳞交给东瘟疫之地圣光之愿礼拜堂中的贝蒂娜·比格辛克。"
Inst20Quest2_Location = "健康的龙鳞（通灵学院瘟疫龙崽掉落）"
Inst20Quest2_Note = "瘟疫龙崽掉落健康的龙鳞（8% 掉率）。贝蒂娜·比格辛克在（东瘟疫之地 - 圣光之愿礼拜堂;"..YELLOW.."81,59"..WHITE.."）。"
Inst20Quest2_Prequest = "有，瘟疫之龙"
Inst20Quest2_Folgequest = "无"
Inst20Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst20Quest3 = "3. 瑟尔林·卡斯迪诺夫教授"
Inst20Quest3_Level = "60"
Inst20Quest3_Attain = "55"
Inst20Quest3_Aim = "在通灵学院中找到瑟尔林·卡斯迪诺夫教授。杀死他，并烧毁艾瓦·萨克霍夫和卢森·萨克霍夫的遗体。任务完成后就回到艾瓦·萨克霍夫那儿。"
Inst20Quest3_Location = "艾瓦·萨克霍夫（西瘟疫之地 - 凯尔达隆; "..YELLOW.."70,73"..WHITE.."）"
Inst20Quest3_Note = "你可以在"..YELLOW.."[9]"..WHITE.."找到瑟尔林·卡斯迪诺夫教授。"
Inst20Quest3_Prequest = "无"
Inst20Quest3_Folgequest = "有，卡斯迪诺夫的恐惧之袋"
-- No Rewards for this quest

--Quest 4 Alliance
Inst20Quest4 = "4. 卡斯迪诺夫的恐惧之袋"
Inst20Quest4_Level = "60"
Inst20Quest4_Attain = "55"
Inst20Quest4_Aim = "在通灵学院找到詹迪斯·巴罗夫并打败她。从她的尸体上找到卡斯迪诺夫的恐惧之袋，然后将其交给艾瓦·萨克霍夫。"
Inst20Quest4_Location = "艾瓦·萨克霍夫（西瘟疫之地 - 凯尔达隆; "..YELLOW.."70,73"..WHITE.."）"
Inst20Quest4_Note = "你可以在"..YELLOW.."[3]"..WHITE.."詹迪斯·巴罗夫。"
Inst20Quest4_Prequest = "有，瑟尔林·卡斯迪诺夫教授"
Inst20Quest4_Folgequest = "有，传令官基尔图诺斯"
Inst20Quest4FQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst20Quest5 = "5. 传令官基尔图诺斯"
Inst20Quest5_Level = "60"
Inst20Quest5_Attain = "55"
Inst20Quest5_Aim = "带着无辜者之血回到通灵学院，将它放在门廊的火盆下面，基尔图诺斯会前来吞噬你的灵魂。勇敢地战斗吧，不要退缩！杀死基尔图诺斯，然后回到艾瓦·萨克霍夫那儿。"
Inst20Quest5_Location = "艾瓦·萨克霍夫（西瘟疫之地 - 凯尔达隆; "..YELLOW.."70,73"..WHITE.."）"
Inst20Quest5_Note = "门廊就在"..YELLOW.."[2]"..WHITE.."。"
Inst20Quest5_Prequest = "有，卡斯迪诺夫的恐惧之袋"
Inst20Quest5_Folgequest = "有，莱斯·霜语"
Inst20Quest5FQuest = "true"
--
Inst20Quest5name1 = "鬼灵精华"
Inst20Quest5name2 = "波尼的玫瑰"
Inst20Quest5name3 = "米拉之歌"

--Quest 6 Alliance
Inst20Quest6 = "6. 巫妖莱斯·霜语"
Inst20Quest6_Level = "60"
Inst20Quest6_Attain = "60"
Inst20Quest6_Aim = "在通灵学院里找到莱斯·霜语。当你找到他之后，使用禁锢灵魂的遗物破除其亡灵的外壳。如果你成功地破除了他的不死之身，就杀掉他并拿到莱斯·霜语的头颅。把那个头颅交给马杜克镇长。"
Inst20Quest6_Location = "马杜克镇长（西瘟疫之地 - 凯尔达隆; "..YELLOW.."70,73"..WHITE.."）"
Inst20Quest6_Note = "你可以在"..YELLOW.."[7]"..WHITE.."找到莱斯·霜语。"
Inst20Quest6_Prequest = "有，莱斯·霜语  - > 禁锢灵魂的遗物"
Inst20Quest6_Folgequest = "无"
Inst20Quest6PreQuest = "true"
--
Inst20Quest6name1 = "达隆郡之盾"
Inst20Quest6name2 = "凯尔达隆战剑"
Inst20Quest6name3 = "凯尔达隆之冠"
Inst20Quest6name4 = "达隆郡之刺"

--Quest 7 Alliance
Inst20Quest7 = "7. 巴罗夫家族的宝藏"
Inst20Quest7_Level = "60"
Inst20Quest7_Attain = "52"
Inst20Quest7_Aim = "到通灵学院中去取得巴罗夫家族的宝藏。这份宝藏包括四份地契：凯尔达隆地契、布瑞尔地契、塔伦米尔地契，还有南海镇地契。完成任务之后就回到维尔顿·巴罗夫那儿去。"
Inst20Quest7_Location = "维尔顿·巴罗夫（西瘟疫之地 - 寒风营地; "..YELLOW.."43,83"..WHITE.."）"
Inst20Quest7_Note = "你可以在"..YELLOW.."[12]"..WHITE.."找到凯尔达隆地契，在"..YELLOW.."[7]"..WHITE.."找到布瑞尔地契，在"..YELLOW.."[4]"..WHITE.."找到塔伦米尔地契，在"..YELLOW.."[1]"..WHITE.."找到南海镇地契。"
Inst20Quest7_Prequest = "无"
Inst20Quest7_Folgequest = "有，巴罗夫的继承人\n（去亡灵壁垒暗杀阿莱克斯·巴罗夫。把他的脑袋交给维尔顿·巴罗夫。）"
-- No Rewards for this quest

--Quest 8 Alliance
Inst20Quest8 = "8. 黎明先锋"
Inst20Quest8_Level = "60"
Inst20Quest8_Attain = "58"
Inst20Quest8_Aim = "将黎明先锋放在通灵学院的观察室里。打败维克图斯,然后回到贝蒂娜·比格辛克那里去。"
Inst20Quest8_Location = "贝蒂娜·比格辛克（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."81,59"..WHITE.."）"
Inst20Quest8_Note = "雏龙精华开始于丁奇·斯迪波尔（燃烧平原 - 烈焰峰; "..YELLOW.."65,23"..WHITE.."）。 观察室在"..YELLOW.."[6]"..WHITE.."。"
Inst20Quest8_Prequest = "有，雏龙精华 - > 莱尼德·巴萨罗梅 - > 贝蒂娜·比格辛克"
Inst20Quest8_Folgequest = "无"
Inst20Quest8PreQuest = "true"
--
Inst20Quest8name1 = "断风者"
Inst20Quest8name2 = "舞动之藤"

--Quest 9 Alliance
Inst20Quest9 = "9. 瓶中的小鬼（术士任务）"
Inst20Quest9_Level = "60"
Inst20Quest9_Attain = "60"
Inst20Quest9_Aim = "把瓶中的小鬼带到通灵学院的炼金实验室中。在小鬼制造出羊皮纸之后，把瓶子还给戈瑟奇·邪眼。"
Inst20Quest9_Location = "戈瑟奇·邪眼（燃烧平原; "..YELLOW.."12,31"..WHITE.."）"
Inst20Quest9_Note = "只有术士才能得到这个任务！你可以在"..YELLOW.."[7]"..WHITE.."找到炼金实验室。"
Inst20Quest9_Prequest = "有，莫苏尔·召血者 - > 克索诺斯星尘"
Inst20Quest9_Folgequest = "有，克索诺斯恐惧战马"
Inst20Quest9PreQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst20Quest10 = "10. 瓦塔拉克饰品的左瓣"
Inst20Quest10_Level = "60"
Inst20Quest10_Attain = "60"
Inst20Quest10_Aim = "使用召唤火盆召唤出库尔莫克的灵魂，然后杀掉他。完成之后，将召唤火盆与瓦塔拉克饰品的左瓣还给黑石山的伯德雷。"
Inst20Quest10_Location = "伯德雷（黑石山; "..YELLOW.."副本入口地图[D] "..WHITE.."）"
Inst20Quest10_Note = "你需要超维度幽灵显形器才能看到伯德雷。你可以从《寻找安泰恩》任务得到它。\n\n库尔莫克在"..YELLOW.."[7]"..WHITE.."。"
Inst20Quest10_Prequest = "有，重要的材料"
Inst20Quest10_Folgequest = " 有，奥卡兹岛在你前方……"
Inst20Quest10PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst20Quest1_HORDE = Inst20Quest1
Inst20Quest1_HORDE_Level = Inst20Quest1_Level
Inst20Quest1_HORDE_Attain = Inst20Quest1_Attain
Inst20Quest1_HORDE_Aim = Inst20Quest1_Aim
Inst20Quest1_HORDE_Location = Inst20Quest1_Location
Inst20Quest1_HORDE_Note = Inst20Quest1_Note
Inst20Quest1_HORDE_Prequest = Inst20Quest1_Prequest
Inst20Quest1_HORDE_Folgequest = Inst20Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst20Quest2_HORDE = Inst20Quest2
Inst20Quest2_HORDE_Level = Inst20Quest2_Level
Inst20Quest2_HORDE_Attain = Inst20Quest2_Attain
Inst20Quest2_HORDE_Aim = Inst20Quest2_Aim
Inst20Quest2_HORDE_Location = Inst20Quest2_Location
Inst20Quest2_HORDE_Note = Inst20Quest2_Note
Inst20Quest2_HORDE_Prequest = Inst20Quest2_Prequest
Inst20Quest2_HORDE_Folgequest = Inst20Quest2_Folgequest
Inst20Quest2FQuest_HORDE = Inst20Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst20Quest3_HORDE = Inst20Quest3
Inst20Quest3_HORDE_Level = Inst20Quest3_Level
Inst20Quest3_HORDE_Attain = Inst20Quest3_Attain
Inst20Quest3_HORDE_Aim = Inst20Quest3_Aim
Inst20Quest3_HORDE_Location = Inst20Quest3_Location
Inst20Quest3_HORDE_Note = Inst20Quest3_Note
Inst20Quest3_HORDE_Prequest = Inst20Quest3_Prequest
Inst20Quest3_HORDE_Folgequest = Inst20Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst20Quest4_HORDE = Inst20Quest4
Inst20Quest4_HORDE_Level = Inst20Quest4_Level
Inst20Quest4_HORDE_Attain = Inst20Quest4_Attain
Inst20Quest4_HORDE_Aim = Inst20Quest4_Aim
Inst20Quest4_HORDE_Location = Inst20Quest4_Location
Inst20Quest4_HORDE_Note = Inst20Quest4_Note
Inst20Quest4_HORDE_Prequest = Inst20Quest4_Prequest
Inst20Quest4_HORDE_Folgequest = Inst20Quest4_Folgequest
Inst20Quest4FQuest_HORDE = Inst20Quest4FQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst20Quest5_HORDE = Inst20Quest5
Inst20Quest5_HORDE_Level = Inst20Quest5_Level
Inst20Quest5_HORDE_Attain = Inst20Quest5_Attain
Inst20Quest5_HORDE_Aim = Inst20Quest5_Aim
Inst20Quest5_HORDE_Location = Inst20Quest5_Location
Inst20Quest5_HORDE_Note = Inst20Quest5_Note
Inst20Quest5_HORDE_Prequest = Inst20Quest5_Prequest
Inst20Quest5_HORDE_Folgequest = Inst20Quest5_Folgequest
Inst20Quest5FQuest_HORDE = Inst20Quest5FQuest
--
Inst20Quest5name1_HORDE = Inst20Quest5name1
Inst20Quest5name2_HORDE = Inst20Quest5name2
Inst20Quest5name3_HORDE = Inst20Quest5name3

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst20Quest6_HORDE = Inst20Quest6
Inst20Quest6_HORDE_Level = Inst20Quest6_Level
Inst20Quest6_HORDE_Attain = Inst20Quest6_Attain
Inst20Quest6_HORDE_Aim = Inst20Quest6_Aim
Inst20Quest6_HORDE_Location = Inst20Quest6_Location
Inst20Quest6_HORDE_Note = Inst20Quest6_Note
Inst20Quest6_HORDE_Prequest = Inst20Quest6_Prequest
Inst20Quest6_HORDE_Folgequest = Inst20Quest6_Folgequest
Inst20Quest6PreQuest_HORDE = Inst20Quest6PreQuest
--
Inst20Quest6name1_HORDE = Inst20Quest6name1
Inst20Quest6name2_HORDE = Inst20Quest6name2
Inst20Quest6name3_HORDE = Inst20Quest6name3
Inst20Quest6name4_HORDE = Inst20Quest6name4

--Quest 7 Horde
Inst20Quest7_HORDE = "7. 巴罗夫家族的宝藏"
Inst20Quest7_HORDE_Level = "60"
Inst20Quest7_HORDE_Attain = "52"
Inst20Quest7_HORDE_Aim = "到通灵学院中去取得巴罗夫家族的宝藏。这份宝藏包括四份地契：凯尔达隆地契、布瑞尔地契、塔伦米尔地契，还有南海镇地契。当你拿到这四份地契之后就回到阿莱克斯·巴罗夫那儿去。"
Inst20Quest7_HORDE_Location = "阿莱克斯·巴罗夫（西瘟疫之地 - 亡灵壁垒; "..YELLOW.."28,57"..WHITE.."）"
Inst20Quest7_HORDE_Note = "你可以在"..YELLOW.."[12]"..WHITE.."找到凯尔达隆地契，在"..YELLOW.."[7]"..WHITE.."找到布瑞尔地契，在"..YELLOW.."[4]"..WHITE.."找到塔伦米尔地契，在"..YELLOW.."[1]"..WHITE.."找到南海镇地契。"
Inst20Quest7_HORDE_Prequest = "无"
Inst20Quest7_HORDE_Folgequest = "有，巴罗夫的继承人\n（到寒风营地去暗杀维尔顿·巴罗夫。把他的脑袋交给阿莱克斯·巴罗夫。）"
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst20Quest8_HORDE = Inst20Quest8
Inst20Quest8_HORDE_Level = Inst20Quest8_Level
Inst20Quest8_HORDE_Attain = Inst20Quest8_Attain
Inst20Quest8_HORDE_Aim = Inst20Quest8_Aim
Inst20Quest8_HORDE_Location = Inst20Quest8_Location
Inst20Quest8_HORDE_Note = Inst20Quest8_Note
Inst20Quest8_HORDE_Prequest = Inst20Quest8_Prequest
Inst20Quest8_HORDE_Folgequest = Inst20Quest8_Folgequest
Inst20Quest8PreQuest_HORDE = Inst20Quest8PreQuest
--
Inst20Quest8name1_HORDE = Inst20Quest8name1
Inst20Quest8name2_HORDE = Inst20Quest8name2

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst20Quest9_HORDE = Inst20Quest9
Inst20Quest9_HORDE_Level = Inst20Quest9_Level
Inst20Quest9_HORDE_Attain = Inst20Quest9_Attain
Inst20Quest9_HORDE_Aim = Inst20Quest9_Aim
Inst20Quest9_HORDE_Location = Inst20Quest9_Location
Inst20Quest9_HORDE_Note = Inst20Quest9_Note
Inst20Quest9_HORDE_Prequest = Inst20Quest9_Prequest
Inst20Quest9_HORDE_Folgequest = Inst20Quest9_Folgequest
Inst20Quest9PreQuest_HORDE = Inst20Quest9PreQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst20Quest10_HORDE = Inst20Quest10
Inst20Quest10_HORDE_Level = Inst20Quest10_Level
Inst20Quest10_HORDE_Attain = Inst20Quest10_Attain
Inst20Quest10_HORDE_Aim = Inst20Quest10_Aim
Inst20Quest10_HORDE_Location = Inst20Quest10_Location
Inst20Quest10_HORDE_Note = Inst20Quest10_Note
Inst20Quest10_HORDE_Prequest = Inst20Quest10_Prequest
Inst20Quest10_HORDE_Folgequest = Inst20Quest10_Folgequest
Inst20Quest10PreQuest_HORDE = Inst20Quest10PreQuest
-- No Rewards for this quest



--------------- INST21 - Shadowfang Keep (SFK) ---------------

Inst21Story = "在第三次大战中，奇灵托的法师和亡灵天灾进行了殊死的战斗。当达拉然的法师最终在战斗中战死之后，他们的意志转移到了复苏的亡灵天灾身上，然后重生了。由于对于缓慢的进展感到失望（并且对他的手下的建议不予理会）大法师阿鲁高选择召唤异次沅空间的生物来壮大达拉然日渐消失的力量。阿鲁高的召唤将贪婪的狼人带到了艾泽拉斯大陆。这些狂暴的狼型生物不仅屠杀了亡灵天灾的人，而且迅速将目标转向那些法师。那些狼人开始围攻席瓦莱恩男爵的城堡。这座位于焚木村的城堡不久之后变成了黑暗势力的聚集地并从此荒废。因为对于自己罪过的愧疚，阿鲁高将那些狼人当作自己的孩子并隐居在“影牙城堡”中。据说他还住在那里，被他巨大的宠物芬鲁斯所保护着，另外，在城堡中还徘徊着瓦莱恩男爵的那些复仇的幽灵。"
Inst21Caption = "影牙城堡"
Inst21QAA = "2 个任务"
Inst21QAH = "4 个任务"

--Quest 1 Alliance
Inst21Quest1 = "1. 正义试炼（圣骑士任务）"
Inst21Quest1_Level = "22"
Inst21Quest1_Attain = "20"
Inst21Quest1_Aim = "按照乔丹的武器材料单上的说明去寻找一些白石橡木、精炼矿石、乔丹的铁锤和一块科尔宝石，然后回到铁炉堡去见乔丹·斯迪威尔。"
Inst21Quest1_Location = "乔丹·斯迪威尔（丹莫罗 - 铁炉堡 "..YELLOW.."52,36 "..WHITE.."）"
Inst21Quest1_Note = "点击"..YELLOW.."[乔丹的武器材料单]"..WHITE.."查看乔丹的武器材料单。"
Inst21Quest1_Page = {2, "只有圣骑士们才能接到这个任务！\n\n1. 你可以从"..YELLOW.."[死亡矿井]"..WHITE.."地精木匠"..YELLOW.."[3]"..WHITE.."那儿得到白石橡木。\n\n2. 要得到精炼矿石，你必须先与白洛尔·石手交谈（洛克莫丹 - 塞尔萨玛; "..YELLOW.."35,44"..WHITE.."）。他会给你《白洛尔的矿石》任务。 你在一棵树后面找到乔丹的矿石"..YELLOW.."71,21"..WHITE.."。\n\n3. 你可以在"..YELLOW.."[影牙城堡]"..WHITE.."紧靠"..YELLOW.."[3]"..WHITE.."的地方找到乔丹的铁锤（安全地点）。\n\n4. 要得到科尔宝石，你必须去找桑迪斯·织风（黑海岸 - 奥伯丁; "..YELLOW.."37,40"..WHITE.."）并且做完《寻找科尔宝石》任务。为了完成这个任务，你必须杀掉"..YELLOW.."[黑暗深渊]"..WHITE.."前的黑暗深渊智者或者黑暗深渊海潮祭司。他们会掉落被污染的科尔宝石。桑迪斯·织风会为你清洁它的。", };
Inst21Quest1_Prequest = "有，勇气之书 -> 正义试炼"
Inst21Quest1_Folgequest = "有，正义试炼"
Inst21Quest1PreQuest = "true"
--
Inst21Quest1name1 = "维里甘之拳"

--Quest 2 Alliance
Inst21Quest2 = "2. 索兰鲁克宝珠（术士任务）"
Inst21Quest2_Level = "25"
Inst21Quest2_Attain = "20"
Inst21Quest2_Aim = "找到3块索兰鲁克宝珠的碎片和1块索兰鲁克宝珠的大碎片，把它们交给贫瘠之地的杜安·卡汉。"
Inst21Quest2_Location = "杜安·卡汉（贫瘠之地; "..YELLOW.."49,57"..WHITE.."）"
Inst21Quest2_Note = "只有术士才能得到这个任务！3块索兰鲁克宝珠的碎片，你可以从"..YELLOW.."[黑暗深渊]"..WHITE.."的暮光侍僧那里得到。那块索兰鲁克宝珠的大碎片，你要去"..YELLOW.."[影牙城堡]"..WHITE.."找影牙魔魂狼人。"
Inst21Quest2_Prequest = "无"
Inst21Quest2_Folgequest = "无"
--
Inst21Quest2name1 = "索兰鲁克宝珠"
Inst21Quest2name2 = "索拉鲁克法杖"


--Quest 1 Horde
Inst21Quest1_HORDE = "1. 影牙城堡里的亡灵哨兵"
Inst21Quest1_HORDE_Level = "25"
Inst21Quest1_HORDE_Attain = "18"
Inst21Quest1_HORDE_Aim = "找到亡灵哨兵阿达曼特和亡灵哨兵文森特。"
Inst21Quest1_HORDE_Location = "高级执行官哈德瑞克（银松森林 - 瑟伯切尔; "..YELLOW.."43,40"..WHITE.."）"
Inst21Quest1_HORDE_Note = "阿达曼特位于"..YELLOW.."[1]"..WHITE.."，文森特在你一进庭院的右侧"..YELLOW.."[2]"..WHITE.."。"
Inst21Quest1_HORDE_Prequest = "无"
Inst21Quest1_HORDE_Folgequest = "无"
--
Inst21Quest1name1_HORDE = "鬼魂衬肩"

--Quest 2 Horde
Inst21Quest2_HORDE = "2. 乌尔之书"
Inst21Quest2_HORDE_Level = "26"
Inst21Quest2_HORDE_Attain = "16"
Inst21Quest2_HORDE_Aim = "把乌尔之书带给幽暗城炼金区里的看守者贝尔杜加。"
Inst21Quest2_HORDE_Location = "看守者贝尔杜加（幽暗城 - 炼金房; "..YELLOW.."53,54"..WHITE.."）"
Inst21Quest2_HORDE_Note = "你可以找到书在进门的左边"..YELLOW.."[8]"..WHITE..")。"
Inst21Quest2_HORDE_Prequest = "无"
Inst21Quest2_HORDE_Folgequest = "无"
--
Inst21Quest2name1_HORDE = "灰色长靴"
Inst21Quest2name2_HORDE = "钢钉护腕"

--Quest 3 Horde
Inst21Quest3_HORDE = "3. 除掉阿鲁高"
Inst21Quest3_HORDE_Level = "27"
Inst21Quest3_HORDE_Attain = "18"
Inst21Quest3_HORDE_Aim = "杀死阿鲁高，把他的头带给瑟伯切尔的达拉尔·道恩维沃尔。"
Inst21Quest3_HORDE_Location = "达拉尔·道恩维沃尔（银松森林 - 瑟伯切尔; "..YELLOW.."44,39"..WHITE.."）"
Inst21Quest3_HORDE_Note = "你可以在"..YELLOW.."[10]"..WHITE.."找到阿鲁高。"
Inst21Quest3_HORDE_Prequest = "无"
Inst21Quest3_HORDE_Folgequest = "无"
--
Inst21Quest3name1_HORDE = "希尔瓦娜斯的图章"

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst21Quest4_HORDE = "4. 索兰鲁克宝珠（术士任务）"
Inst21Quest4_HORDE_Level = Inst21Quest2_Level
Inst21Quest4_HORDE_Attain = Inst21Quest2_Attain
Inst21Quest4_HORDE_Aim = Inst21Quest2_Aim
Inst21Quest4_HORDE_Location = Inst21Quest2_Location
Inst21Quest4_HORDE_Note = Inst21Quest2_Note
Inst21Quest4_HORDE_Prequest = Inst21Quest2_Prequest
Inst21Quest4_HORDE_Folgequest = Inst21Quest2_Folgequest
--
Inst21Quest4name1_HORDE = Inst21Quest2name1
Inst21Quest4name2_HORDE = Inst21Quest2name1



--------------- INST22 - Stratholme (Strat) ---------------

Inst22Story = "斯坦索姆曾经是洛丹伦北部一颗璀璨的明珠，但是就是在这座城市阿尔萨斯王子背叛了他的导师乌瑟尔，并屠杀了数百个被认为感染了可怕瘟疫的臣民。阿尔萨斯不久之后就向巫妖王臣服。这个破碎的城市也被巫妖克尔苏拉德领导的亡灵天灾所占据。而一直由大十字军战士达索汉领导的血色十字军分遣队也占据了这个城市的一部分。这两方力量在城市中进行着激烈的战斗。而那些勇敢（亦或是愚蠢的）的冒险者在进入斯坦索姆之后将不得不面对两方的力量。据说整座城市由三座大型的通灵塔以及无数强大的亡灵巫师，女妖和憎恶所守卫着。据报告，邪恶的死亡骑士乘坐在一匹骷髅战马——他会将怒火倾泻在任何胆敢进入亡灵天灾领域的人。"
Inst22Caption = "斯坦索姆"
Inst22QAA = "18 个任务"
Inst22QAH = "19 个任务"

--Quest 1 Alliance
Inst22Quest1 = "1. 血肉不会撒谎"
Inst22Quest1_Level = "60"
Inst22Quest1_Attain = "55"
Inst22Quest1_Aim = "从斯坦索姆找回20个瘟疫肉块，并把它们交给贝蒂娜·比格辛克。你觉得斯坦索姆中的生灵都不大可能长着肉……"
Inst22Quest1_Location = "贝蒂娜·比格辛克（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."81,59"..WHITE.."）"
Inst22Quest1_Note = "斯坦索姆里多数敌人都会掉落瘟疫肉块，但是掉落率很低。"
Inst22Quest1_Prequest = "无"
Inst22Quest1_Folgequest = "有，活跃的探子"
-- No Rewards for this quest

--Quest 2 Alliance
Inst22Quest2 = "2. 活跃的探子"
Inst22Quest2_Level = "60"
Inst22Quest2_Attain = "55"
Inst22Quest2_Aim = "到斯坦索姆去探索那里的通灵塔。找到新的天灾军团档案，把它交给贝蒂娜·比格辛克。"
Inst22Quest2_Location = "贝蒂娜·比格辛克（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."81,59"..WHITE.."）"
Inst22Quest2_Note = "天灾军团档案在三个塔中的一个里，这三个塔在"..YELLOW.."[15]"..WHITE.."，"..YELLOW.."[16]"..WHITE.."和"..YELLOW.."[17]"..WHITE.."。"
Inst22Quest2_Prequest = "有，血肉不会撒谎"
Inst22Quest2_Folgequest = "无"
Inst22Quest2FQuest = "true"
--
Inst22Quest2name1 = "黎明之印"
Inst22Quest2name2 = "黎明符文"

--Quest 3 Alliance
Inst22Quest3 = "3. 神圣之屋"
Inst22Quest3_Level = "60"
Inst22Quest3_Attain = "55"
Inst22Quest3_Aim = "到北方的斯坦索姆去，寻找散落在城市中的补给箱，并收集5瓶斯坦索姆圣水。当你找到足够的圣水之后就回去向莱尼德·巴萨罗梅复命。"
Inst22Quest3_Location = "莱尼德·巴萨罗梅（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."80,58"..WHITE.."）"
Inst22Quest3_Note = "在斯坦索姆各处的箱子里你可以找到圣水。但是，如果你打开箱子，虫子可能会出现并攻击你。"
Inst22Quest3_Prequest = "无"
Inst22Quest3_Folgequest = "无"
--
Inst22Quest3name1 = "超强治疗药水"
Inst22Quest3name2 = "强效法力药水"
Inst22Quest3name3 = "忏悔之冠"
Inst22Quest3name4 = "忏悔者指环"

--Quest 4 Alliance
Inst22Quest4 = "4. 弗拉斯·希亚比"
Inst22Quest4_Level = "60"
Inst22Quest4_Attain = "55"
Inst22Quest4_Aim = "找到弗拉斯·希亚比在斯坦索姆的烟草店，并从中找回一盒希亚比的烟草，把它交给烟鬼拉鲁恩。"
Inst22Quest4_Location = "烟鬼拉鲁恩（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."80,58"..WHITE.."）"
Inst22Quest4_Note = "烟草店在"..YELLOW.."[1]"..WHITE.."附近。当你打开盒子，弗拉斯·希亚比会突然出现。"
Inst22Quest4_Prequest = "无"
Inst22Quest4_Folgequest = "无"
--
Inst22Quest4name1 = "烟鬼的打火器"

--Quest 5 Alliance
Inst22Quest5 = "5. 永不安息的灵魂"
Inst22Quest5_Level = "60"
Inst22Quest5_Attain = "55"
Inst22Quest5_Aim = "对斯坦索姆里已成为鬼魂的居民们使用埃根的冲击器。当永不安息的灵魂从他们的鬼魂外壳解放出来后，再次使用冲击器 - 他们就会彻底自由了！\n释放15个永不安息的灵魂，然后回到埃根那里。"
Inst22Quest5_Location = "埃根（东瘟疫之地; "..YELLOW.."14,33"..WHITE.."）"
Inst22Quest5_Note = "前导任务从护理者奥林处获得（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."79,63"..WHITE.."）\n鬼魂居民在斯坦索姆到处走动。"
Inst22Quest5_Prequest = "有，永不安息的灵魂"
Inst22Quest5_Folgequest = "无"
Inst22Quest5PreQuest = "true"
--
Inst22Quest5name1 = "希望的证明"

--Quest 6 Alliance
Inst22Quest6 = "6. 爱与家庭（系列任务）"
Inst22Quest6_Level = "60"
Inst22Quest6_Attain = "52"
Inst22Quest6_Aim = "到瘟疫之地北部的斯坦索姆去。你可以在血色十字军堡垒中找到“爱与家庭”这幅画，它被隐藏在另一幅描绘两个月亮的画之后。\n把这幅画还给提里奥·弗丁。"
Inst22Quest6_Location = "画家瑞弗蕾（西瘟疫之地 - 凯尔达隆; "..YELLOW.."65,75"..WHITE.."）"
Inst22Quest6_Note = "前导任务从提里奥·弗丁处获得（西瘟疫之地; "..YELLOW.."7,43"..WHITE.."）。\n画在"..YELLOW.."[10]"..WHITE.."。"
Inst22Quest6_Prequest = "有，救赎 - > 遗忘的记忆 - > 失落的荣耀 - > 爱与家庭"
Inst22Quest6_Folgequest = "有，寻找麦兰达"
Inst22Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst22Quest7 = "7. 米奈希尔的礼物（系列任务）"
Inst22Quest7_Level = "60"
Inst22Quest7_Attain = "57"
Inst22Quest7_Aim = "到斯坦索姆城里去找到米奈希尔的礼物，把巫妖生前的遗物放在那块邪恶的土地上。"
Inst22Quest7_Location = "莱尼德·巴萨罗梅（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."80,58"..WHITE.."）"
Inst22Quest7_Note = "前导任务从马杜克镇长（西瘟疫之地 - 凯尔达隆; "..YELLOW.."70,73"..WHITE.."）处获得。\n你可以在"..YELLOW.."[19]"..WHITE.."附近找到标志。也可以参见：通灵学院里的"..YELLOW.."[巫妖莱斯·霜语]"..WHITE.."。"
Inst22Quest7_Prequest = "有，莱斯·霜语 - > 亡灵莱斯·霜语"
Inst22Quest7_Folgequest = "有，米奈希尔的礼物"
Inst22Quest7PreQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst22Quest8 = "8. 奥里克斯的清算"
Inst22Quest8_Level = "60"
Inst22Quest8_Attain = "55"
Inst22Quest8_Aim = "杀掉瑞文戴尔男爵。"
Inst22Quest8_Location = "奥里克斯（斯坦索姆; "..YELLOW.."[13]"..WHITE.."）"
Inst22Quest8_Note = "要开始这个任务你需要给奥里克斯 [信仰奖章]。 你可以从玛洛尔的保险箱拿到这个奖章，箱子就在"..YELLOW.."[7]"..WHITE.."附近。将奖章给了奥里克斯之后，他会在对抗男爵"..YELLOW.."[19]"..WHITE.."的战斗中支持你。杀死男爵后，你需要再次和奥里克斯谈话以取得任务回报奖励。"
Inst22Quest8_Prequest = "无"
Inst22Quest8_Folgequest = "无"
--
Inst22Quest8name1 = "殉难者的意志"
Inst22Quest8name2 = "殉难者之血"

--Quest 9 Alliance
Inst22Quest9 = "9. 档案管理员"
Inst22Quest9_Level = "60"
Inst22Quest9_Attain = "55"
Inst22Quest9_Aim = "在斯坦索姆城中找到血色十字军的档案管理员加尔福特，杀掉他，然后烧毁血色十字军档案。"
Inst22Quest9_Location = "尼古拉斯·瑟伦霍夫公爵（东瘟疫之地 - 圣光之愿礼拜堂"..YELLOW.."81, 59"..WHITE.."）"
Inst22Quest9_Note = "档案和档案管理员在"..YELLOW.."[10]"..WHITE.."。"
Inst22Quest9_Prequest = "无"
Inst22Quest9_Folgequest = "有，可怕的真相"
-- No Rewards for this quest

--Quest 10 Alliance
Inst22Quest10 = "10. 可怕的真相"
Inst22Quest10_Level = "60"
Inst22Quest10_Attain = "55"
Inst22Quest10_Aim = "将巴纳扎尔的头颅交给东瘟疫之地的尼古拉斯·瑟伦霍夫公爵。"
Inst22Quest10_Location = "巴纳扎尔（斯坦索姆; "..YELLOW.."[11]"..WHITE.."）"
Inst22Quest10_Note = "尼古拉斯·瑟伦霍夫公爵在（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."81, 59"..WHITE.."）。"
Inst22Quest10_Prequest = "有，档案管理员"
Inst22Quest10_Folgequest = "有，超越"
Inst22Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst22Quest11 = "11. 超越"
Inst22Quest11_Level = "60"
Inst22Quest11_Attain = "55"
Inst22Quest11_Aim = "到斯坦索姆去杀掉瑞文戴尔男爵，把他的头颅交给尼古拉斯·瑟伦霍夫公爵。"
Inst22Quest11_Location = "尼古拉斯·瑟伦霍夫公爵（东瘟疫之地 - 圣光之愿礼拜堂; "..YELLOW.."81, 59"..WHITE.."）"
Inst22Quest11_Note = "瑞文戴尔男爵在"..YELLOW.."[19]"..WHITE.."。"
Inst22Quest11_Prequest = "有，可怕的真相"
Inst22Quest11_Folgequest = "无"
Inst22Quest11FQuest = "true"
--
Inst22Quest11name1 = "黎明守护者"
Inst22Quest11name2 = "银色十字军"
Inst22Quest11name3 = "银色复仇者"

--Quest 12 Alliance
Inst22Quest12 = "12. 死人的请求"
Inst22Quest12_Level = "60"
Inst22Quest12_Attain = "58"
Inst22Quest12_Aim = "进入斯坦索姆，从瑞文戴尔男爵手中救出伊思达。"
Inst22Quest12_Location = "伊思达·哈尔蒙（东瘟疫之地 - 斯坦索姆）"
Inst22Quest12_Note = "伊思达·哈尔蒙就站在斯坦索姆副本门口。你需要超维度幽灵显形器才能看到伊思达·哈尔蒙。联盟这个任务的前续任务接自德莉亚娜（铁炉堡 "..YELLOW.."43,52"..WHITE.."），部落的接自莫克瓦尔（奥格瑞玛 "..YELLOW.."38,37"..WHITE.."）。\n这个同时也是著名的45分钟杀瑞文戴尔男爵任务。"
Inst22Quest12_Prequest = "有，寻找安泰恩"
Inst22Quest12_Folgequest = "有，生命的证据"
Inst22Quest12PreQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst22Quest13 = "13. 瓦塔拉克饰品的左瓣 "
Inst22Quest13_Level = "60"
Inst22Quest13_Attain = "60"
Inst22Quest13_Aim = "使用召唤火盆召唤出亚雷恩和索托斯的灵魂，然后杀掉他们。完成之后，将召唤火盆与瓦塔拉克饰品的左瓣还给黑石山的伯德雷。"
Inst22Quest13_Location = "伯德雷（黑石山; "..YELLOW.."副本入口地图中的[D]"..WHITE.."）"
Inst22Quest13_Note = "你需要超维度幽灵显形器才能看到伯德雷。你可以从《寻找安泰恩》任务得到它。\n\n召唤亚雷恩和索托斯在"..YELLOW.."[11]"..WHITE.."。"
Inst22Quest13_Prequest = "有，重要的材料"
Inst22Quest13_Folgequest = "有，奥卡兹岛在你前方…… "
Inst22Quest13PreQuest = "true"
-- No Rewards for this quest

--Quest 14 Alliance
Inst22Quest14 = "14. 瓦塔拉克饰品的右瓣"
Inst22Quest14_Level = "60"
Inst22Quest14_Attain = "60"
Inst22Quest14_Aim = "使用召唤火盆召唤出亚雷恩和索托斯的灵魂，然后杀掉他。完成之后，将召唤火盆与瓦塔拉克公爵的饰品还给黑石山的伯德雷。"
Inst22Quest14_Location = "伯德雷（黑石山; "..YELLOW.."副本入口地图中的[D]"..WHITE.."）"
Inst22Quest14_Note = "你需要超维度幽灵显形器才能看到伯德雷。你可以从《寻找安泰恩》任务得到它。\n\n召唤亚雷恩和索托斯在"..YELLOW.."[11]"..WHITE.."。"
Inst22Quest14_Prequest = "有，更多重要的材料"
Inst22Quest14_Folgequest = "有，最后的准备（"..YELLOW.."[黑石塔上层]"..WHITE.."）"
Inst22Quest14PreQuest = "true"
-- No Rewards for this quest

--Quest 15 Alliance
Inst22Quest15 = "15. 埃提耶什，守护者的传说之杖"
Inst22Quest15_Level = "60"
Inst22Quest15_Attain = "60"
Inst22Quest15_Aim = "塔纳利斯时光之穴的阿纳克洛斯要你前往斯坦索姆，在神圣之地上使用埃提耶什，守护者的传说之杖。击败被驱赶出法杖的生物，然后回到阿纳克洛斯那里去。 "
Inst22Quest15_Location = "阿纳克洛斯（塔纳利斯 - 时光之穴; "..YELLOW.."65,49"..WHITE.."）"
Inst22Quest15_Note = "召唤位置在"..YELLOW.."[2]"..WHITE.."。"
Inst22Quest15_Prequest = "有"
Inst22Quest15_Folgequest = "无"
--
Inst22Quest15name1 = "埃提耶什，守护者的传说之杖"
Inst22Quest15name2 = "埃提耶什，守护者的传说之杖"
Inst22Quest15name3 = "埃提耶什，守护者的传说之杖"
Inst22Quest15name4 = "埃提耶什，守护者的传说之杖"

--Quest 16 Alliance
Inst22Quest16 = "16. 腐蚀（铸剑大师任务）"
Inst22Quest16_Level = "60"
Inst22Quest16_Attain = "50"
Inst22Quest16_Aim = "在斯坦索姆找到黑衣守卫铸剑师，然后杀死他。将黑色卫士徽记交给亡灵杀手瑟里尔。"
Inst22Quest16_Location = "亡灵杀手瑟里尔（冬泉谷 - 永望镇; "..YELLOW.."61,37"..WHITE.."）"
Inst22Quest16_Note = "召唤黑衣守卫铸剑师在"..YELLOW.."[15]"..WHITE.."。"
Inst22Quest16_Prequest = "无"
Inst22Quest16_Folgequest = "无"
--
Inst22Quest16name1 = "设计图：闪耀轻剑 "

--Quest 17 Alliance
Inst22Quest17 = "17. 甜美的平静（铸锤大师任务）"
Inst22Quest17_Level = "60"
Inst22Quest17_Attain = "51"
Inst22Quest17_Aim = "到斯坦索姆去杀死红衣铸锤师。将红衣铸锤师的围裙交给莉莉丝。"
Inst22Quest17_Location = "轻盈的莉莉丝（冬泉谷 - 永望镇; "..YELLOW.."61,37"..WHITE.."）"
Inst22Quest17_Note = "召唤红衣铸锤师在"..YELLOW.."[8]"..WHITE.."。"
Inst22Quest17_Prequest = "无"
Inst22Quest17_Folgequest = "无"
--
Inst22Quest17name1 = "设计图：魔法战锤"

--Quest 18 Alliance
Inst22Quest18 = "18. 光与影的平衡（牧师任务）"
Inst22Quest18_Level = "60"
Inst22Quest18_Attain = "60"
Inst22Quest18_Aim = "在总计有15个农夫被杀死之前拯救50个农夫。完成任务之后与艾瑞斯·哈文法谈谈。\n你可以通过浏览死亡布告来了解自己拯救了多少农夫。"
Inst22Quest18_Location = "艾瑞斯·哈文法（东瘟疫之地; "..YELLOW.."21,18"..WHITE.."）"
Inst22Quest18_Note = "如果要看到艾瑞斯·哈文法和接到任务，你需要神圣之眼（火焰之王的宝箱在"..YELLOW.."[熔火之心]"..WHITE.."）或者鬼灵精华（"..YELLOW.."[通灵学院]"..WHITE.."传令官基尔图诺斯任务奖励）。\n\n完成后，将神圣之眼、诺达希尔碎片和暗影之眼（ 诅咒之地"..YELLOW.."[魔王库鲁尔]"..WHITE.."掉落）组合，将得到牧师史诗法杖——祈福。"
Inst22Quest18_Prequest = "无"
Inst22Quest18_Folgequest = "无"
--
Inst22Quest18name1 = "诺达希尔碎片"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst22Quest1_HORDE = Inst22Quest1
Inst22Quest1_HORDE_Level = Inst22Quest1_Level
Inst22Quest1_HORDE_Attain = Inst22Quest1_Attain
Inst22Quest1_HORDE_Aim = Inst22Quest1_Aim
Inst22Quest1_HORDE_Location = Inst22Quest1_Location
Inst22Quest1_HORDE_Note = Inst22Quest1_Note
Inst22Quest1_HORDE_Prequest = Inst22Quest1_Prequest
Inst22Quest1_HORDE_Folgequest = Inst22Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst22Quest2_HORDE = Inst22Quest2
Inst22Quest2_HORDE_Level = Inst22Quest2_Level
Inst22Quest2_HORDE_Attain = Inst22Quest2_Attain
Inst22Quest2_HORDE_Aim = Inst22Quest2_Aim
Inst22Quest2_HORDE_Location = Inst22Quest2_Location
Inst22Quest2_HORDE_Note = Inst22Quest2_Note
Inst22Quest2_HORDE_Prequest = Inst22Quest2_Prequest
Inst22Quest2_HORDE_Folgequest = Inst22Quest2_Folgequest
Inst22Quest2FQuest_HORDE = Inst22Quest2FQuest
--
Inst22Quest2name1_HORDE = Inst22Quest2name1
Inst22Quest2name2_HORDE = Inst22Quest2name2

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst22Quest3_HORDE = Inst22Quest3
Inst22Quest3_HORDE_Level = Inst22Quest3_Level
Inst22Quest3_HORDE_Attain = Inst22Quest3_Attain
Inst22Quest3_HORDE_Aim = Inst22Quest3_Aim
Inst22Quest3_HORDE_Location = Inst22Quest3_Location
Inst22Quest3_HORDE_Note = Inst22Quest3_Note
Inst22Quest3_HORDE_Prequest = Inst22Quest3_Prequest
Inst22Quest3_HORDE_Folgequest = Inst22Quest3_Folgequest
--
Inst22Quest3name1_HORDE = Inst22Quest3name1
Inst22Quest3name2_HORDE = Inst22Quest3name2
Inst22Quest3name3_HORDE = Inst22Quest3name3
Inst22Quest3name4_HORDE = Inst22Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst22Quest4_HORDE = Inst22Quest4
Inst22Quest4_HORDE_Level = Inst22Quest4_Level
Inst22Quest4_HORDE_Attain = Inst22Quest4_Attain
Inst22Quest4_HORDE_Aim = Inst22Quest4_Aim
Inst22Quest4_HORDE_Location = Inst22Quest4_Location
Inst22Quest4_HORDE_Note = Inst22Quest4_Note
Inst22Quest4_HORDE_Prequest = Inst22Quest4_Prequest
Inst22Quest4_HORDE_Folgequest = Inst22Quest4_Folgequest
--
Inst22Quest4name1_HORDE = Inst22Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst22Quest5_HORDE = Inst22Quest5
Inst22Quest5_HORDE_Level = Inst22Quest5_Level
Inst22Quest5_HORDE_Attain = Inst22Quest5_Attain
Inst22Quest5_HORDE_Aim = Inst22Quest5_Aim
Inst22Quest5_HORDE_Location = Inst22Quest5_Location
Inst22Quest5_HORDE_Note = Inst22Quest5_Note
Inst22Quest5_HORDE_Prequest = Inst22Quest5_Prequest
Inst22Quest5_HORDE_Folgequest = Inst22Quest5_Folgequest
Inst22Quest5PreQuest_HORDE = Inst22Quest5PreQuest
--
Inst22Quest5name1_HORDE = Inst22Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst22Quest6_HORDE = Inst22Quest6
Inst22Quest6_HORDE_Level = Inst22Quest6_Level
Inst22Quest6_HORDE_Attain = Inst22Quest6_Attain
Inst22Quest6_HORDE_Aim = Inst22Quest6_Aim
Inst22Quest6_HORDE_Location = Inst22Quest6_Location
Inst22Quest6_HORDE_Note = Inst22Quest6_Note
Inst22Quest6_HORDE_Prequest = Inst22Quest6_Prequest
Inst22Quest6_HORDE_Folgequest = Inst22Quest6_Folgequest
Inst22Quest6PreQuest_HORDE = Inst22Quest6PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst22Quest7_HORDE = Inst22Quest7
Inst22Quest7_HORDE_Level = Inst22Quest7_Level
Inst22Quest7_HORDE_Attain = Inst22Quest7_Attain
Inst22Quest7_HORDE_Aim = Inst22Quest7_Aim
Inst22Quest7_HORDE_Location = Inst22Quest7_Location
Inst22Quest7_HORDE_Note = Inst22Quest7_Note
Inst22Quest7_HORDE_Prequest = Inst22Quest7_Prequest
Inst22Quest7_HORDE_Folgequest = Inst22Quest7_Folgequest
Inst22Quest7PreQuest_HORDE = Inst22Quest7PreQuest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst22Quest8_HORDE = Inst22Quest8
Inst22Quest8_HORDE_Level = Inst22Quest8_Level
Inst22Quest8_HORDE_Attain = Inst22Quest8_Attain
Inst22Quest8_HORDE_Aim = Inst22Quest8_Aim
Inst22Quest8_HORDE_Location = Inst22Quest8_Location
Inst22Quest8_HORDE_Note = Inst22Quest8_Note
Inst22Quest8_HORDE_Prequest = Inst22Quest8_Prequest
Inst22Quest8_HORDE_Folgequest = Inst22Quest8_Folgequest
--
Inst22Quest8name1_HORDE = Inst22Quest8name1
Inst22Quest8name2_HORDE = Inst22Quest8name2

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst22Quest9_HORDE = Inst22Quest9
Inst22Quest9_HORDE_Level = Inst22Quest9_Level
Inst22Quest9_HORDE_Attain = Inst22Quest9_Attain
Inst22Quest9_HORDE_Aim = Inst22Quest9_Aim
Inst22Quest9_HORDE_Location = Inst22Quest9_Location
Inst22Quest9_HORDE_Note = Inst22Quest9_Note
Inst22Quest9_HORDE_Prequest = Inst22Quest9_Prequest
Inst22Quest9_HORDE_Folgequest = Inst22Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst22Quest10_HORDE = Inst22Quest10
Inst22Quest10_HORDE_Level = Inst22Quest10_Level
Inst22Quest10_HORDE_Attain = Inst22Quest10_Attain
Inst22Quest10_HORDE_Aim = Inst22Quest10_Aim
Inst22Quest10_HORDE_Location = Inst22Quest10_Location
Inst22Quest10_HORDE_Note = Inst22Quest10_Note
Inst22Quest10_HORDE_Prequest = Inst22Quest10_Prequest
Inst22Quest10_HORDE_Folgequest = Inst22Quest10_Folgequest
Inst22Quest10FQuest_HORDE = Inst22Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst22Quest11_HORDE = Inst22Quest11
Inst22Quest11_HORDE_Level = Inst22Quest11_Level
Inst22Quest11_HORDE_Attain = Inst22Quest11_Attain
Inst22Quest11_HORDE_Aim = Inst22Quest11_Aim
Inst22Quest11_HORDE_Location = Inst22Quest11_Location
Inst22Quest11_HORDE_Note = Inst22Quest11_Note
Inst22Quest11_HORDE_Prequest = Inst22Quest11_Prequest
Inst22Quest11_HORDE_Folgequest = Inst22Quest11_Folgequest
Inst22Quest11FQuest_HORDE = Inst22Quest11FQuest
--
Inst22Quest11name1_HORDE = Inst22Quest11name1
Inst22Quest11name2_HORDE = Inst22Quest11name2
Inst22Quest11name3_HORDE = Inst22Quest11name3

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst22Quest12_HORDE = Inst22Quest12
Inst22Quest12_HORDE_Level = Inst22Quest12_Level
Inst22Quest12_HORDE_Attain = Inst22Quest12_Attain
Inst22Quest12_HORDE_Aim = Inst22Quest12_Aim
Inst22Quest12_HORDE_Location = Inst22Quest12_Location
Inst22Quest12_HORDE_Note = Inst22Quest12_Note
Inst22Quest12_HORDE_Prequest = Inst22Quest12_Prequest
Inst22Quest12_HORDE_Folgequest = Inst22Quest12_Folgequest
Inst22Quest12PreQuest_HORDE = Inst22Quest12PreQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst22Quest13_HORDE = Inst22Quest13
Inst22Quest13_HORDE_Level = Inst22Quest13_Level
Inst22Quest13_HORDE_Attain = Inst22Quest13_Attain
Inst22Quest13_HORDE_Aim = Inst22Quest13_Aim
Inst22Quest13_HORDE_Location = Inst22Quest13_Location
Inst22Quest13_HORDE_Note = Inst22Quest13_Note
Inst22Quest13_HORDE_Prequest = Inst22Quest13_Prequest
Inst22Quest13_HORDE_Folgequest = Inst22Quest13_Folgequest
Inst22Quest13PreQuest_HORDE = Inst22Quest13PreQuest
-- No Rewards for this quest

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst22Quest14_HORDE = Inst22Quest14
Inst22Quest14_HORDE_Level = Inst22Quest14_Level
Inst22Quest14_HORDE_Attain = Inst22Quest14_Attain
Inst22Quest14_HORDE_Aim = Inst22Quest14_Aim
Inst22Quest14_HORDE_Location = Inst22Quest14_Location
Inst22Quest14_HORDE_Note = Inst22Quest14_Note
Inst22Quest14_HORDE_Prequest = Inst22Quest14_Prequest
Inst22Quest14_HORDE_Folgequest = Inst22Quest14_Folgequest
Inst22Quest14PreQuest_HORDE = Inst22Quest14PreQuest
-- No Rewards for this quest

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst22Quest15_HORDE = Inst22Quest15
Inst22Quest15_HORDE_Level = Inst22Quest15_Level
Inst22Quest15_HORDE_Attain = Inst22Quest15_Attain
Inst22Quest15_HORDE_Aim = Inst22Quest15_Aim
Inst22Quest15_HORDE_Location = Inst22Quest15_Location
Inst22Quest15_HORDE_Note = Inst22Quest15_Note
Inst22Quest15_HORDE_Prequest = Inst22Quest15_Prequest
Inst22Quest15_HORDE_Folgequest = Inst22Quest15_Folgequest
Inst22Quest15PreQuest_HORDE = Inst22Quest15PreQuest
--
Inst22Quest15name1_HORDE = Inst22Quest15name1
Inst22Quest15name2_HORDE = Inst22Quest15name2
Inst22Quest15name3_HORDE = Inst22Quest15name3
Inst22Quest15name4_HORDE = Inst22Quest15name4

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst22Quest16_HORDE = Inst22Quest16
Inst22Quest16_HORDE_Level = Inst22Quest16_Level
Inst22Quest16_HORDE_Attain = Inst22Quest16_Attain
Inst22Quest16_HORDE_Aim = Inst22Quest16_Aim
Inst22Quest16_HORDE_Location = Inst22Quest16_Location
Inst22Quest16_HORDE_Note = Inst22Quest16_Note
Inst22Quest16_HORDE_Prequest = Inst22Quest16_Prequest
Inst22Quest16_HORDE_Folgequest = Inst22Quest16_Folgequest
--
Inst22Quest16name1_HORDE = Inst22Quest16name1

--Quest 17 Horde  (same as Quest 17 Alliance)
Inst22Quest17_HORDE = Inst22Quest17
Inst22Quest17_HORDE_Level = Inst22Quest17_Level
Inst22Quest17_HORDE_Attain = Inst22Quest17_Attain
Inst22Quest17_HORDE_Aim = Inst22Quest17_Aim
Inst22Quest17_HORDE_Location = Inst22Quest17_Location
Inst22Quest17_HORDE_Note = Inst22Quest17_Note
Inst22Quest17_HORDE_Prequest = Inst22Quest17_Prequest
Inst22Quest17_HORDE_Folgequest = Inst22Quest17_Folgequest
--
Inst22Quest17name1_HORDE = Inst22Quest17name1

--Quest 18 Horde
Inst22Quest18_HORDE = "18. 吞咽者拉姆斯登"
Inst22Quest18_HORDE_Level = "60"
Inst22Quest18_HORDE_Attain = "56"
Inst22Quest18_HORDE_Aim = "到斯坦索姆去，杀掉吞咽者拉姆斯登。把他的头颅交给纳萨诺斯。"
Inst22Quest18_HORDE_Location = "纳萨诺斯·凋零者（东瘟疫之地; "..YELLOW.."26,74"..WHITE.."）"
Inst22Quest18_HORDE_Note = "前续任务也是从他这里接。拉姆斯登在"..YELLOW.."[18]"..WHITE.."。"
Inst22Quest18_HORDE_Prequest = "有，游侠之王的命令 -> 暗翼蝠"
Inst22Quest18_HORDE_Folgequest = "无"
Inst22Quest18PreQuest_HORDE = "true"
--
Inst22Quest18name1_HORDE = "阿莱克希斯皇家戒指"
Inst22Quest18name2_HORDE = "元素之环"

--Quest 19 Horde  (same as Quest 18 Alliance)
Inst22Quest19_HORDE = "19. 光与影的平衡（牧师任务）"
Inst22Quest19_HORDE_Level = Inst22Quest18_Level
Inst22Quest19_HORDE_Attain = Inst22Quest18_Attain
Inst22Quest19_HORDE_Aim = Inst22Quest18_Aim
Inst22Quest19_HORDE_Location = Inst22Quest18_Location
Inst22Quest19_HORDE_Note = Inst22Quest18_Note
Inst22Quest19_HORDE_Prequest = Inst22Quest18_Prequest
Inst22Quest19_HORDE_Folgequest = Inst22Quest18_Folgequest
--
Inst22Quest19name1_HORDE = Inst22Quest18name1



--------------- INST23 - The Ruins of Ahn'Qiraj (AQ20) ---------------

Inst23Story = "在流沙之战最后几个小时里，四巨龙军团和暗夜精灵的联军将战场逼至其拉帝国的最中心，希利苏斯的异种虫群退败至最终堡垒安其拉城。但在安其拉之门内，等待着的却是大规模的其拉异种虫，数量是卡利姆多联军所无法想象的。经过漫长的战役，卡利姆多联军仍然无法击败其拉帝王以及他的异种虫群，只能以一个强大的魔法结界将它们困禁在内，而安其拉城也因为战火而成了一个被诅咒的废墟。经过了数千年，其拉的侵略心却没有因为结界而消退。新一代的异种虫群从巢穴中慢慢的破茧而出，安其拉废墟又再度充满了其拉异种虫。这股威胁一定要被消灭，否则艾泽拉斯将可能会被这股恐怖的新世代其拉势力给毁灭。"
Inst23Caption = "安其拉废墟"
Inst23QAA = "2 个任务"
Inst23QAH = "2 个任务"

--Quest 1 Alliance
Inst23Quest1 = "1. 奥斯里安之死"
Inst23Quest1_Level = "60"
Inst23Quest1_Attain = "60"
Inst23Quest1_Aim = "将无疤者奥斯里安的头颅交给希利苏斯塞纳里奥要塞的指挥官玛尔利斯。"
Inst23Quest1_Location = "无疤者奥斯里安的头颅（无疤者奥斯里安掉落; "..YELLOW.."[6]"..WHITE.."）"
Inst23Quest1_Note = "指挥官玛尔利斯（希利苏斯 - 塞纳里奥要塞; "..YELLOW.."49,34"..WHITE.."）"
Inst23Quest1_Prequest = "无"
Inst23Quest1_Folgequest = "无"
--
Inst23Quest1name1 = "流沙护符"
Inst23Quest1name2 = "流沙咒符"
Inst23Quest1name3 = "流沙颈饰"
Inst23Quest1name4 = "流沙坠饰"

--Quest 2 Alliance
Inst23Quest2 = "2. 完美的毒药"
Inst23Quest2_Level = "60"
Inst23Quest2_Attain = "60"
Inst23Quest2_Aim = "塞纳里奥要塞的德尔克·雷木让你把温诺希斯的毒囊和库林纳克斯的毒囊交给他。"
Inst23Quest2_Location = "德尔克·雷木（希利苏斯 - 塞纳里奥要塞; "..YELLOW.."52,39"..WHITE.."）"
Inst23Quest2_Note = "高阶祭司温诺希斯"..YELLOW.."祖尔格拉布"..WHITE.."掉落温诺希斯的毒囊。库林纳克斯"..YELLOW.."安其拉废墟"..WHITE..""..YELLOW.."[1]"..WHITE.."掉落库林纳克斯的毒囊。"
Inst23Quest2_Prequest = "无"
Inst23Quest2_Folgequest = "无"
--
Inst23Quest2name1 = "拉文霍德切割者"
Inst23Quest2name2 = "开闸刀"
Inst23Quest2name3 = "雷木之刺"
Inst23Quest2name4 = "康恩之怒"
Inst23Quest2name5 = "法拉德的装填器"
Inst23Quest2name6 = "西蒙尼的耕种用锤"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst23Quest1_HORDE = Inst23Quest1
Inst23Quest1_HORDE_Level = Inst23Quest1_Level
Inst23Quest1_HORDE_Attain = Inst23Quest1_Attain
Inst23Quest1_HORDE_Aim = Inst23Quest1_Aim
Inst23Quest1_HORDE_Location = Inst23Quest1_Location
Inst23Quest1_HORDE_Note = Inst23Quest1_Note
Inst23Quest1_HORDE_Prequest = Inst23Quest1_Prequest
Inst23Quest1_HORDE_Folgequest = Inst23Quest1_Folgequest
--
Inst23Quest1name1_HORDE = Inst23Quest1name1
Inst23Quest1name2_HORDE = Inst23Quest1name2
Inst23Quest1name3_HORDE = Inst23Quest1name3
Inst23Quest1name4_HORDE = Inst23Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst23Quest2_HORDE = Inst23Quest2
Inst23Quest2_HORDE_Level = Inst23Quest2_Level
Inst23Quest2_HORDE_Attain = Inst23Quest2_Attain
Inst23Quest2_HORDE_Aim = Inst23Quest2_Aim
Inst23Quest2_HORDE_Location = Inst23Quest2_Location
Inst23Quest2_HORDE_Note = Inst23Quest2_Note
Inst23Quest2_HORDE_Prequest = Inst23Quest2_Prequest
Inst23Quest2_HORDE_Folgequest = Inst23Quest2_Folgequest
--
Inst23Quest2name1_HORDE = Inst23Quest2name1
Inst23Quest2name2_HORDE = Inst23Quest2name2
Inst23Quest2name3_HORDE = Inst23Quest2name3
Inst23Quest2name4_HORDE = Inst23Quest2name4
Inst23Quest2name5_HORDE = Inst23Quest2name5
Inst23Quest2name6_HORDE = Inst23Quest2name6



--------------- INST24 - The Stockade (Stocks) ---------------

Inst24Story = "监狱是位于暴风城运河区戒备森原的牢房。那里由典狱官塞尔沃特看守着，监狱是那些小偷，政治犯，谋杀者和许多最危险的罪犯的家园。最近，异常暴动导致了监狱的混乱——所有的守卫都被赶了出来，里面的罪犯可以自由的活动。典狱官塞尔沃特试图控制局面并召集勇敢的冒险者进入监狱杀死暴动的主脑——那个狡猾的巴吉尔·特雷德。"
Inst24Caption = "监狱"
Inst24QAA = "6 个任务"
Inst24QAH = "无任务"

--Quest 1 Alliance
Inst24Quest1 = "1. 伸张正义"
Inst24Quest1_Level = "25"
Inst24Quest1_Attain = "22"
Inst24Quest1_Aim = "把塔格尔的头颅带给湖畔镇的卫兵伯尔顿。"
Inst24Quest1_Location = "卫兵伯尔顿（赤脊山 - 湖畔镇; "..YELLOW.."26,46 "..WHITE.."）"
Inst24Quest1_Note = "你可以在"..YELLOW.."[1]"..WHITE.."找到塔格尔。"
Inst24Quest1_Prequest = "无"
Inst24Quest1_Folgequest = "无"
--
Inst24Quest1name1 = "磷铝长剑"
Inst24Quest1name2 = "硬根法杖"

--Quest 2 Alliance
Inst24Quest2 = "2. 罪与罚"
Inst24Quest2_Level = "26"
Inst24Quest2_Attain = "22"
Inst24Quest2_Aim = "夜色镇的米尔斯迪普议员要你杀死迪克斯特·瓦德，并把他的手带回来作为证明。"
Inst24Quest2_Location = "米尔斯迪普议员（暮色森林 - 夜色镇; "..YELLOW.."72,47 "..WHITE.."）"
Inst24Quest2_Note = "你可以在"..YELLOW.."[5]"..WHITE.."找到迪克斯特·瓦德."
Inst24Quest2_Prequest = "无"
Inst24Quest2_Folgequest = "无"
--
Inst24Quest2name1 = "大使之靴"
Inst24Quest2name2 = "夜色郡锁甲护腿"

--Quest 3 Alliance
Inst24Quest3 = "3. 镇压暴动"
Inst24Quest3_Level = "26"
Inst24Quest3_Attain = "22"
Inst24Quest3_Aim = "暴风城的典狱官塞尔沃特要求你杀死监狱中的10名迪菲亚囚徒、8名迪菲亚罪犯和8名迪菲亚叛军。"
Inst24Quest3_Location = "典狱官塞尔沃特（暴风城 - 监狱; "..YELLOW.."41,58 "..WHITE.."）"
Inst24Quest3_Note = "副本外的典狱官会给你这个任务。"
Inst24Quest3_Prequest = "无"
Inst24Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst24Quest4 = "4. 鲜血的颜色"
Inst24Quest4_Level = "26"
Inst24Quest4_Attain = "22"
Inst24Quest4_Aim = "暴风城的尼科瓦·拉斯克要你取得10条红色毛纺面罩。"
Inst24Quest4_Location = "尼科瓦·拉斯克（暴风城 - 旧城区; "..YELLOW.."73,46 "..WHITE.."）"
Inst24Quest4_Note = "副本里每个敌人都可能掉落面罩。"
Inst24Quest4_Prequest = "无"
Inst24Quest4_Folgequest = "无"
-- No Rewards for this quest

--Quest 5 Alliance
Inst24Quest5 = "5. 卡姆·深怒"
Inst24Quest5_Level = "27"
Inst24Quest5_Attain = "25"
Inst24Quest5_Aim = "丹莫德的莫特雷·加玛森要求你把卡姆·深怒的头颅交给他。"
Inst24Quest5_Location = "莫特雷·加玛森（湿地 - 丹莫德; "..YELLOW.."49,18 "..WHITE.."）"
Inst24Quest5_Note = "前导任务也从莫特雷·加玛森处得到。你可以在"..YELLOW.."[2]"..WHITE.."找到卡姆·深怒。"
Inst24Quest5_Prequest = "有，黑铁战争"
Inst24Quest5_Folgequest = "无"
Inst24Quest5PreQuest = "true"
--
Inst24Quest5name1 = "辩护腰带 "
Inst24Quest5name2 = "碎头者"

--Quest 6 Alliance
Inst24Quest6 = "6. 监狱暴动（系列任务）"
Inst24Quest6_Level = "29"
Inst24Quest6_Attain = "16"
Inst24Quest6_Aim = "杀死巴基尔·斯瑞德，把他的头带给监狱的典狱官塞尔沃特。"
Inst24Quest6_Location = "典狱官塞尔沃特（暴风城 - 监狱; "..YELLOW.."41,58 "..WHITE.."）"
Inst24Quest6_Note = "前导任务详情请参见"..YELLOW.."[死亡矿井][迪菲亚兄弟会]"..WHITE..".。\n巴基尔·斯瑞德在"..YELLOW.."[4]"..WHITE.."。"
Inst24Quest6_Prequest = "有，未寄出的信 -> 巴吉尔·特雷德"
Inst24Quest6_Folgequest = "有，好奇的访客"
Inst24Quest6PreQuest = "true"
-- No Rewards for this quest



--------------- INST25 - Sunken Temple (ST) ---------------

Inst25Story = "在一千年之前，强大的古拉巴什王国被一次大型内部战争所毁灭。一部份被称为阿塔莱的巨魔牧师试图将古代血神哈卡灵魂掠夺者带回这个世界。虽然这些牧师被击败并最终被流放，这个伟大的王国变得四分五裂。流放的牧师逃到了北面，来到了悲伤沼泽。他们为哈卡建立了一座伟大的神庙——在那里他们期望能够把哈卡重新带回世间。伟大的守护神龙伊瑟拉了解了阿塔莱的计划并将神庙摧毁沉入沼泽之中。在今天，神庙沉没的遗迹被绿龙所守卫并阻止任何人进入或者出去。然而，有些阿塔莱巨魔从伊瑟拉的怒火中幸存下来并再此奖自己奉献与复活哈卡的事业中。 "
Inst25Caption = "沉没的神庙"
Inst25QAA = "17 个任务"
Inst25QAH = "17 个任务"

--Quest 1 Alliance
Inst25Quest1 = "1. 进入阿塔哈卡神庙"
Inst25Quest1_Level = "50"
Inst25Quest1_Attain = "41"
Inst25Quest1_Aim = "为暴风城的布罗哈恩·铁桶收集10块阿塔莱石板。"
Inst25Quest1_Location = "布罗哈恩·铁桶（暴风城 - 矮人区; "..YELLOW.."64,20"..WHITE.."）"
Inst25Quest1_Note = "前导任务在此领取。\n\n石板你在神庙内外里到处都能见到。"
Inst25Quest1_Prequest = "有，调查神庙 -> 拉普索迪的故事"
Inst25Quest1_Folgequest = "无"
Inst25Quest1PreQuest = "true"
--
Inst25Quest1name1 = "守护之符"

--Quest 2 Alliance
Inst25Quest2 = "2. 沉没的神庙"
Inst25Quest2_Level = "51"
Inst25Quest2_Attain = "46"
Inst25Quest2_Aim = "到塔纳利斯找到玛尔冯·瑞文斯克。"
Inst25Quest2_Location = "安吉拉斯·月风（菲拉斯 - 羽月要塞; "..YELLOW.."31,45"..WHITE.."）"
Inst25Quest2_Note = "你可以在"..YELLOW.."52,45"..WHITE.."处找到玛尔冯·瑞文斯克。"
Inst25Quest2_Prequest = "无"
Inst25Quest2_Folgequest = "有，石环"
-- No Rewards for this quest

--Quest 3 Alliance
Inst25Quest3 = "3. 深入神庙"
Inst25Quest3_Level = "51"
Inst25Quest3_Attain = "46"
Inst25Quest3_Aim = "在悲伤沼泽沉没的神庙中找到哈卡祭坛。"
Inst25Quest3_Location = "玛尔冯·瑞文斯克（塔纳利斯; "..YELLOW.."52,45"..WHITE.."）"
Inst25Quest3_Note = "祭坛就在图中"..YELLOW.."[1]"..WHITE.."的位置。"
Inst25Quest3_Prequest = "有，石环"
Inst25Quest3_Folgequest = "无"
Inst25Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance

Inst25Quest4 = "4. 雕像群的秘密"
Inst25Quest4_Level = "51"
Inst25Quest4_Attain = "46"
Inst25Quest4_Aim = "到沉没的神庙去，揭开雕像群中隐藏的秘密。"
Inst25Quest4_Location = "玛尔冯·瑞文斯克（塔纳利斯; "..YELLOW.."52,45"..WHITE.."）"
Inst25Quest4_Note = "雕像群就在图中"..YELLOW.."[1]"..WHITE.."所示位置，按照地图指示的顺序打开他们。"
Inst25Quest4_Prequest = "有，深入神庙"
Inst25Quest4_Folgequest = "无"
Inst25Quest4FQuest = "true"
--
Inst25Quest4name1 = "哈卡莱骨灰"

--Quest 5 Alliance
Inst25Quest5 = "5. 邪恶之雾"
Inst25Quest5_Level = "52"
Inst25Quest5_Attain = "47"
Inst25Quest5_Aim = "收集5份阿塔莱之雾的样本，然后向安戈洛环形山的穆尔金复命。"
Inst25Quest5_Location = "格雷甘·山酒（菲拉斯; "..YELLOW.."45,25"..WHITE.."）"
Inst25Quest5_Note = "前导任务《穆尔金和拉瑞安》开始于穆尔金（安戈洛环形山 - 马绍尔营地; "..YELLOW.."42,9"..WHITE.."）。你可以从阿塔哈卡神庙里的神庙深渊潜伏者、黑暗虫或者融合软泥怪那里得到阿塔莱之雾。"
Inst25Quest5_Prequest = "有，穆尔金和拉瑞安 -> 造访格雷甘"
Inst25Quest5_Folgequest = "无"
Inst25Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst25Quest6 = "6. 神灵哈卡（系列任务）"
Inst25Quest6_Level = "53"
Inst25Quest6_Attain = "42"
Inst25Quest6_Aim = "将装满的哈卡之卵交给塔纳利斯的叶基亚。"
Inst25Quest6_Location = "叶基亚（塔纳利斯 - 热砂港; "..YELLOW.."66,22"..WHITE.."）"
Inst25Quest6_Note = "此系列任务始于《尖啸者的灵魂》（同样在此领取，见"..YELLOW.."[祖儿法拉克]"..WHITE.."）。\n你必须在"..YELLOW.."[3]"..WHITE.."使用哈卡之卵，触发事件。一旦事件开始，敌人会像潮水般涌出来攻击你。其中一些敌人掉落哈卡莱之血。用这些血液熄灭包含哈卡灵魂能量的不灭火焰。当你熄灭所有的火焰时，哈卡的化身就可以进入我们的世界了。"
Inst25Quest6_Prequest = "有，尖啸者的灵魂 -> 远古之卵"
Inst25Quest6_Folgequest = "无"
Inst25Quest6PreQuest = "true"
--
Inst25Quest6name1 = "灰岩头盔"
Inst25Quest6name2 = "生命之力短剑"
Inst25Quest6name3 = "珠光头饰"

--Quest 7 Alliance
Inst25Quest7 = "7. 预言者迦玛兰"
Inst25Quest7_Level = "53"
Inst25Quest7_Attain = "38"
Inst25Quest7_Aim = "辛特兰的阿塔莱流放者要你给他带回迦玛兰的头。"
Inst25Quest7_Location = "阿塔莱流放者（辛特兰; "..YELLOW.."33,75"..WHITE.."）"
Inst25Quest7_Note = "你可以在"..YELLOW.."[4]"..WHITE.."找到迦玛兰。"
Inst25Quest7_Prequest = "无"
Inst25Quest7_Folgequest = "无"
--
Inst25Quest7name1 = "雨行护腿"
Inst25Quest7name2 = "流放者头盔"

--Quest 8 Alliance
Inst25Quest8 = "8. 伊兰尼库斯精华"
Inst25Quest8_Level = "55"
Inst25Quest8_Attain = "48"
Inst25Quest8_Aim = "把伊兰尼库斯精华放在精华之泉里，精华之泉就在沉没的神庙中，伊兰尼库斯的巢穴里。"
Inst25Quest8_Location = "伊兰尼库斯精华（伊兰尼库斯的阴影掉落; "..YELLOW.."[6]"..WHITE.."）"
Inst25Quest8_Note = "伊兰尼库斯精华要打伊兰尼库斯的阴影才能掉落。你可以在"..YELLOW.."[6]"..WHITE.."找到他，精华之泉就在他旁边。"
Inst25Quest8_Prequest = "无"
Inst25Quest8_Folgequest = "无"
--
Inst25Quest8name1 = "被禁锢的伊兰尼库斯精华"

--Quest 9 Alliance
Inst25Quest9 = "9. 巨魔的羽毛（术士任务）"
Inst25Quest9_Level = "52"
Inst25Quest9_Attain = "50"
Inst25Quest9_Aim = "到沉没的神庙去，从巨魔们身上获得6支巫毒羽毛。"
Inst25Quest9_Location = "伊普斯（费伍德森林; "..YELLOW.."42,45"..WHITE.."）"
Inst25Quest9_Note = "术士职业任务。6小巨魔每只掉一个羽毛。"
Inst25Quest9_Prequest = "有，小鬼的要求 -> 奇怪的材料"
Inst25Quest9_Folgequest = "无"
Inst25Quest9PreQuest = "true"
--
Inst25Quest9name1 = "灵魂收割者"
Inst25Quest9name2 = "深渊碎片"
Inst25Quest9name3 = "束缚长袍"

--Quest 10 Alliance
Inst25Quest10 = "10. 巫毒羽毛（战士任务）"
Inst25Quest10_Level = "52"
Inst25Quest10_Attain = "50"
Inst25Quest10_Aim = "将你从沉没的神庙的巨魔身上得到的巫毒羽毛交给部落英雄的灵魂。"
Inst25Quest10_Location = "部落英雄的灵魂（尘泥沼泽; "..YELLOW.."34,66"..WHITE.."）"
Inst25Quest10_Note = "战士职业任务。6小巨魔每只掉一个羽毛。"
Inst25Quest10_Prequest = "有，困扰的灵魂  -> 魔誓者之战"
Inst25Quest10_Folgequest = "无"
Inst25Quest10PreQuest = "true"
--
Inst25Quest10name1 = "怒火面甲"
Inst25Quest10name2 = "钻石水瓶"
Inst25Quest10name3 = "刺钢护肩"

--Quest 11 Alliance
Inst25Quest11 = "11. 巫毒羽毛（萨满任务）"
Inst25Quest11_Level = "52"
Inst25Quest11_Attain = "50"
Inst25Quest11_Aim = "将巫毒羽毛交给捕风者巴斯拉。"
Inst25Quest11_Location = "捕风者巴斯拉（奥特兰克山脉; "..YELLOW.."80,67"..WHITE.."）"
Inst25Quest11_Note = "萨满职业任务。6小巨魔每只掉一个羽毛。"
Inst25Quest11_Prequest = "有，灵魂图腾"
Inst25Quest11_Folgequest = "无"
Inst25Quest11PreQuest = "true"
--
Inst25Quest11name1 = "蓝铜之拳"
Inst25Quest11name2 = "被迷惑的水之魂"
Inst25Quest11name3 = "荒野之杖"

--Quest 12 Alliance
Inst25Quest12 = "12. 更好的材料（德鲁伊任务）"
Inst25Quest12_Level = "52"
Inst25Quest12_Attain = "50"
Inst25Quest12_Aim = "从沉没的神庙底部的守卫身上得到一些腐烂藤蔓，把它们交给托尔瓦·寻路者。"
Inst25Quest12_Location = "托尔瓦·寻路者（安戈洛环形山; "..YELLOW.."72,76"..WHITE.."）"
Inst25Quest12_Note = "德鲁伊职业任务。腐烂藤蔓掉落自召唤的阿塔拉利恩"..YELLOW.."[1]"..WHITE.."，必须正确的破解雕像群的秘密。"
Inst25Quest12_Prequest = "有，托尔瓦·寻路者 -> 毒性测试"
Inst25Quest12_Folgequest = "无"
Inst25Quest12PreQuest = "true"
--
Inst25Quest12name1 = "斑白毛皮"
Inst25Quest12name2 = " 森林的拥抱"
Inst25Quest12name3 = "月影手杖"

--Quest 13 Alliance
Inst25Quest13 = "13. 神庙中的绿龙（猎人任务）"
Inst25Quest13_Level = "52"
Inst25Quest13_Attain = "50"
Inst25Quest13_Aim = "将摩弗拉斯的牙齿交给艾萨拉的奥汀克。他住在埃达拉斯废墟东北部悬崖的顶端。"
Inst25Quest13_Location = "奥汀克（艾萨拉; "..YELLOW.."42,43"..WHITE.."）"
Inst25Quest13_Note = "猎人职业任务。摩弗拉斯在"..YELLOW.."[5]"..WHITE.."。"
Inst25Quest13_Prequest = "有，猎人的护符 -> 碎浪多头怪"
Inst25Quest13_Folgequest = "无"
Inst25Quest13PreQuest = "true"
--
Inst25Quest13name1 = "狩猎长矛"
Inst25Quest13name2 = "魔暴龙眼"
Inst25Quest13name3 = "魔暴龙牙"

--Quest 14 Alliance
Inst25Quest14 = "14. 毁灭摩弗拉斯（法师任务）"
Inst25Quest14_Level = "52"
Inst25Quest14_Attain = "50"
Inst25Quest14_Aim = "从摩弗拉斯身上取回奥术碎片，然后返回大法师克希雷姆那儿。"
Inst25Quest14_Location = "大法师克希雷姆，摩弗拉斯（艾萨拉; "..YELLOW.."29,40"..WHITE.."）"
Inst25Quest14_Note = "法师职业任务。摩弗拉斯在"..YELLOW.."[5]"..WHITE.."。"
Inst25Quest14_Prequest = "有，法师的会见 -> 纳迦的珊瑚"
Inst25Quest14_Folgequest = "无"
Inst25Quest14PreQuest = "true"
--
Inst25Quest14name1 = "冰川之矛"
Inst25Quest14name2 = "奥术水晶坠饰"
Inst25Quest14name3 = "火焰宝石"

--Quest 15 Alliance
Inst25Quest15 = "15. 摩弗拉斯之血（牧师任务）"
Inst25Quest15_Level = "52"
Inst25Quest15_Attain = "50"
Inst25Quest15_Aim = "前往沉没的阿塔哈卡神庙，杀死绿龙摩弗拉斯，将他的血液交给费伍德森林中的格雷塔·苔蹄。沉没的神庙的入口就在悲伤沼泽中。"
Inst25Quest15_Location = "奥汀克（艾萨拉; "..YELLOW.."42,43"..WHITE.."）"
Inst25Quest15_Note = "牧师职业任务。摩弗拉斯 在"..YELLOW.."[5]"..WHITE.."。 格雷塔·苔蹄在（费伍德森林 - 翡翠圣地; "..YELLOW.."51,82"..WHITE.."）。"
Inst25Quest15_Prequest = "有，塞纳里奥议会的求助 -> 亡灵的腐液"
Inst25Quest15_Folgequest = "无"
Inst25Quest15PreQuest = "true"
--
Inst25Quest15name1 = "祝福珠串"
Inst25Quest15name2 = "悲哀之杖"
Inst25Quest15name3 = "希望之环"

--Quest 16 Alliance
Inst25Quest16 = "16. 碧蓝钥匙（盗贼任务）"
Inst25Quest16_Level = "52"
Inst25Quest16_Attain = "50"
Inst25Quest16_Aim = "将碧蓝钥匙交给乔拉齐·拉文霍德公爵。"
Inst25Quest16_Location = " 大法师克希雷姆（艾萨拉; "..YELLOW.."29,40"..WHITE.."）"
Inst25Quest16_Note = "盗贼职业任务。摩弗拉斯"..YELLOW.."[5]"..WHITE.."掉落钥匙。乔拉齐·拉文霍德公爵在（奥特兰克山谷 - 拉文霍德; "..YELLOW.."86,79"..WHITE.."）。"
Inst25Quest16_Prequest = "有，简单的要求 -> 密文碎片"
Inst25Quest16_Folgequest = "无"
Inst25Quest16PreQuest = "true"
--
Inst25Quest16name1 = "乌黑面具"
Inst25Quest16name2 = "耳语长靴"
Inst25Quest16name3 = "暗色蝠斗篷"

--Quest 17 Alliance
Inst25Quest17 = "17. 铸造力量之石（圣骑士任务）"
Inst25Quest17_Level = "52"
Inst25Quest17_Attain = "50"
Inst25Quest17_Aim = "将巫毒羽毛带给阿什拉姆·瓦罗菲斯特。"
Inst25Quest17_Location = "阿什拉姆·瓦罗菲斯特（西瘟疫之地 - 寒风营地; "..YELLOW.."43,85"..WHITE.."）"
Inst25Quest17_Note = "圣骑士职业任务。6小巨魔一只掉一个。"
Inst25Quest17_Prequest = "有，堕落者的天灾石"
Inst25Quest17_Folgequest = "无"
Inst25Quest17PreQuest = "true"
--
Inst25Quest17name1 = "神圣力量之石"
Inst25Quest17name2 = "光铸利刃"
Inst25Quest17name3 = "神圣宝珠"
Inst25Quest17name4 = "礼节徽记"


--Quest 1 Horde
Inst25Quest1_HORDE = "1. 阿塔哈卡神庙"
Inst25Quest1_HORDE_Level = "50"
Inst25Quest1_HORDE_Attain = "38"
Inst25Quest1_HORDE_Aim = "收集20个哈卡神像，把它们带给斯通纳德的费泽鲁尔。"
Inst25Quest1_HORDE_Location = "费泽鲁尔（悲伤沼泽 - 斯通纳德; "..YELLOW.."47,54"..WHITE.."）"
Inst25Quest1_HORDE_Note = "神庙里的所有敌人都掉落哈卡神像。"
Inst25Quest1_HORDE_Prequest = "有，泪水之池 -> 向费泽鲁尔复命"
Inst25Quest1_HORDE_Folgequest = "无"
Inst25Quest1PreQuest_HORDE = "true"
--
Inst25Quest1name1_HORDE = "守护之符"

--Quest 2 Horde
Inst25Quest2_HORDE = "2. 沉没的神庙"
Inst25Quest2_HORDE_Level = "51"
Inst25Quest2_HORDE_Attain = "46"
Inst25Quest2_HORDE_Aim = "到塔纳利斯找到玛尔冯·瑞文斯克。"
Inst25Quest2_HORDE_Location = "巫医尤克里（菲拉斯; "..YELLOW.."74,43"..WHITE.."）"
Inst25Quest2_HORDE_Note = "玛尔冯·瑞文斯克的位置在"..YELLOW.."52,45"..WHITE.."。"
Inst25Quest2_HORDE_Prequest = "无"
Inst25Quest2_HORDE_Folgequest = "有，石环"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst25Quest3_HORDE = Inst25Quest3
Inst25Quest3_HORDE_Level = Inst25Quest3_Level
Inst25Quest3_HORDE_Attain = Inst25Quest3_Attain
Inst25Quest3_HORDE_Aim = Inst25Quest3_Aim
Inst25Quest3_HORDE_Location = Inst25Quest3_Location
Inst25Quest3_HORDE_Note = Inst25Quest3_Note
Inst25Quest3_HORDE_Prequest = Inst25Quest3_Prequest
Inst25Quest3_HORDE_Folgequest = Inst25Quest3_Folgequest
Inst25Quest3FQuest_HORDE = Inst25Quest3FQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst25Quest4_HORDE = Inst25Quest4
Inst25Quest4_HORDE_Level = Inst25Quest4_Level
Inst25Quest4_HORDE_Attain = Inst25Quest4_Attain
Inst25Quest4_HORDE_Aim = Inst25Quest4_Aim
Inst25Quest4_HORDE_Location = Inst25Quest4_Location
Inst25Quest4_HORDE_Note = Inst25Quest4_Note
Inst25Quest4_HORDE_Prequest = Inst25Quest4_Prequest
Inst25Quest4_HORDE_Folgequest = Inst25Quest4_Folgequest
Inst25Quest4FQuest_HORDE = Inst25Quest4FQuest
--
Inst25Quest4name1_HORDE = Inst25Quest4name1

--Quest 5 Horde
Inst25Quest5_HORDE = "5. 除草器的燃料"
Inst25Quest5_HORDE_Level = "52"
Inst25Quest5_HORDE_Attain = "50"
Inst25Quest5_HORDE_Aim = "收集5份阿塔莱之雾的样本，然后将它们送到马绍尔营地的拉瑞安那里。"
Inst25Quest5_HORDE_Location = "莉芙·雷兹菲克斯（贫瘠之地; "..YELLOW.."62,38"..WHITE.."）"
Inst25Quest5_HORDE_Note = "前导任务《拉瑞安和穆尔金》开始于拉瑞安（安戈洛环形山; "..YELLOW.."45,8"..WHITE.."）。沉没的神庙里的神庙深渊潜伏者、黑暗虫和软泥怪身上都有阿塔莱之雾。"
Inst25Quest5_HORDE_Prequest = "有，拉瑞安和穆尔金 > 玛尔冯的车间"
Inst25Quest5_HORDE_Folgequest = "无"
Inst25Quest5PreQuest_HORDE = "true"

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst25Quest6_HORDE = Inst25Quest6
Inst25Quest6_HORDE_Level = Inst25Quest6_Level
Inst25Quest6_HORDE_Attain = Inst25Quest6_Attain
Inst25Quest6_HORDE_Aim = Inst25Quest6_Aim
Inst25Quest6_HORDE_Location = Inst25Quest6_Location
Inst25Quest6_HORDE_Note = Inst25Quest6_Note
Inst25Quest6_HORDE_Prequest = Inst25Quest6_Prequest
Inst25Quest6_HORDE_Folgequest = Inst25Quest6_Folgequest
Inst25Quest6PreQuest_HORDE = Inst25Quest6PreQuest
--
Inst25Quest6name1_HORDE = Inst25Quest6name1
Inst25Quest6name2_HORDE = Inst25Quest6name2
Inst25Quest6name3_HORDE = Inst25Quest6name3

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst25Quest7_HORDE = Inst25Quest7
Inst25Quest7_HORDE_Level = Inst25Quest7_Level
Inst25Quest7_HORDE_Attain = Inst25Quest7_Attain
Inst25Quest7_HORDE_Aim = Inst25Quest7_Aim
Inst25Quest7_HORDE_Location = Inst25Quest7_Location
Inst25Quest7_HORDE_Note = Inst25Quest7_Note
Inst25Quest7_HORDE_Prequest = Inst25Quest7_Prequest
Inst25Quest7_HORDE_Folgequest = Inst25Quest7_Folgequest
--
Inst25Quest7name1_HORDE = Inst25Quest7name1
Inst25Quest7name2_HORDE = Inst25Quest7name2

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst25Quest8_HORDE = Inst25Quest8
Inst25Quest8_HORDE_Level = Inst25Quest8_Level
Inst25Quest8_HORDE_Attain = Inst25Quest8_Attain
Inst25Quest8_HORDE_Aim = Inst25Quest8_Aim
Inst25Quest8_HORDE_Location = Inst25Quest8_Location
Inst25Quest8_HORDE_Note = Inst25Quest8_Note
Inst25Quest8_HORDE_Prequest = Inst25Quest8_Prequest
Inst25Quest8_HORDE_Folgequest = Inst25Quest8_Folgequest
--
Inst25Quest8name1_HORDE = Inst25Quest8name1

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst25Quest9_HORDE = Inst25Quest9
Inst25Quest9_HORDE_Level = Inst25Quest9_Level
Inst25Quest9_HORDE_Attain = Inst25Quest9_Attain
Inst25Quest9_HORDE_Aim = Inst25Quest9_Aim
Inst25Quest9_HORDE_Location = Inst25Quest9_Location
Inst25Quest9_HORDE_Note = Inst25Quest9_Note
Inst25Quest9_HORDE_Prequest = Inst25Quest9_Prequest
Inst25Quest9_HORDE_Folgequest = Inst25Quest9_Folgequest
Inst25Quest9PreQuest_HORDE = Inst25Quest9PreQuest
--
Inst25Quest9name1_HORDE = Inst25Quest9name1
Inst25Quest9name2_HORDE = Inst25Quest9name2
Inst25Quest9name3_HORDE = Inst25Quest9name3

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst25Quest10_HORDE = Inst25Quest10
Inst25Quest10_HORDE_Level = Inst25Quest10_Level
Inst25Quest10_HORDE_Attain = Inst25Quest10_Attain
Inst25Quest10_HORDE_Aim = Inst25Quest10_Aim
Inst25Quest10_HORDE_Location = Inst25Quest10_Location
Inst25Quest10_HORDE_Note = Inst25Quest10_Note
Inst25Quest10_HORDE_Prequest = Inst25Quest10_Prequest
Inst25Quest10_HORDE_Folgequest = Inst25Quest10_Folgequest
Inst25Quest10PreQuest_HORDE = Inst25Quest10PreQuest
--
Inst25Quest10name1_HORDE = Inst25Quest10name1
Inst25Quest10name2_HORDE = Inst25Quest10name2
Inst25Quest10name3_HORDE = Inst25Quest10name3

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst25Quest11_HORDE = Inst25Quest11
Inst25Quest11_HORDE_Level = Inst25Quest11_Level
Inst25Quest11_HORDE_Attain = Inst25Quest11_Attain
Inst25Quest11_HORDE_Aim = Inst25Quest11_Aim
Inst25Quest11_HORDE_Location = Inst25Quest11_Location
Inst25Quest11_HORDE_Note = Inst25Quest11_Note
Inst25Quest11_HORDE_Prequest = Inst25Quest11_Prequest
Inst25Quest11_HORDE_Folgequest = Inst25Quest11_Folgequest
Inst25Quest11PreQuest_HORDE = Inst25Quest11PreQuest
--
Inst25Quest11name1_HORDE = Inst25Quest11name1
Inst25Quest11name2_HORDE = Inst25Quest11name2
Inst25Quest11name3_HORDE = Inst25Quest11name3

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst25Quest12_HORDE = Inst25Quest12
Inst25Quest12_HORDE_Level = Inst25Quest12_Level
Inst25Quest12_HORDE_Attain = Inst25Quest12_Attain
Inst25Quest12_HORDE_Aim = Inst25Quest12_Aim
Inst25Quest12_HORDE_Location = Inst25Quest12_Location
Inst25Quest12_HORDE_Note = Inst25Quest12_Note
Inst25Quest12_HORDE_Prequest = Inst25Quest12_Prequest
Inst25Quest12_HORDE_Folgequest = Inst25Quest12_Folgequest
Inst25Quest12PreQuest_HORDE = Inst25Quest12PreQuest
--
Inst25Quest12name1_HORDE = Inst25Quest12name1
Inst25Quest12name2_HORDE = Inst25Quest12name2
Inst25Quest12name3_HORDE = Inst25Quest12name3

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst25Quest13_HORDE = Inst25Quest13
Inst25Quest13_HORDE_Level = Inst25Quest13_Level
Inst25Quest13_HORDE_Attain = Inst25Quest13_Attain
Inst25Quest13_HORDE_Aim = Inst25Quest13_Aim
Inst25Quest13_HORDE_Location = Inst25Quest13_Location
Inst25Quest13_HORDE_Note = Inst25Quest13_Note
Inst25Quest13_HORDE_Prequest = Inst25Quest13_Prequest
Inst25Quest13_HORDE_Folgequest = Inst25Quest13_Folgequest
Inst25Quest13PreQuest_HORDE = Inst25Quest13PreQuest
--
Inst25Quest13name1_HORDE = Inst25Quest13name1
Inst25Quest13name2_HORDE = Inst25Quest13name2
Inst25Quest13name3_HORDE = Inst25Quest13name3

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst25Quest14_HORDE = Inst25Quest14
Inst25Quest14_HORDE_Level = Inst25Quest14_Level
Inst25Quest14_HORDE_Attain = Inst25Quest14_Attain
Inst25Quest14_HORDE_Aim = Inst25Quest14_Aim
Inst25Quest14_HORDE_Location = Inst25Quest14_Location
Inst25Quest14_HORDE_Note = Inst25Quest14_Note
Inst25Quest14_HORDE_Prequest = Inst25Quest14_Prequest
Inst25Quest14_HORDE_Folgequest = Inst25Quest14_Folgequest
Inst25Quest14PreQuest_HORDE = Inst25Quest14PreQuest
--
Inst25Quest14name1_HORDE = Inst25Quest14name1
Inst25Quest14name2_HORDE = Inst25Quest14name2
Inst25Quest14name3_HORDE = Inst25Quest14name3

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst25Quest15_HORDE = Inst25Quest15
Inst25Quest15_HORDE_Level = Inst25Quest15_Level
Inst25Quest15_HORDE_Attain = Inst25Quest15_Attain
Inst25Quest15_HORDE_Aim = Inst25Quest15_Aim
Inst25Quest15_HORDE_Location = Inst25Quest15_Location
Inst25Quest15_HORDE_Note = Inst25Quest15_Note
Inst25Quest15_HORDE_Prequest = Inst25Quest15_Prequest
Inst25Quest15_HORDE_Folgequest = Inst25Quest15_Folgequest
Inst25Quest15PreQuest_HORDE = Inst25Quest15PreQuest
--
Inst25Quest15name1_HORDE = Inst25Quest15name1
Inst25Quest15name2_HORDE = Inst25Quest15name2
Inst25Quest15name3_HORDE = Inst25Quest15name3

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst25Quest16_HORDE = Inst25Quest16
Inst25Quest16_HORDE_Level = Inst25Quest16_Level
Inst25Quest16_HORDE_Attain = Inst25Quest16_Attain
Inst25Quest16_HORDE_Aim = Inst25Quest16_Aim
Inst25Quest16_HORDE_Location = Inst25Quest16_Location
Inst25Quest16_HORDE_Note = Inst25Quest16_Note
Inst25Quest16_HORDE_Prequest = Inst25Quest16_Prequest
Inst25Quest16_HORDE_Folgequest = Inst25Quest16_Folgequest
Inst25Quest16PreQuest_HORDE = Inst25Quest16PreQuest
--
Inst25Quest16name1_HORDE = Inst25Quest16name1
Inst25Quest16name2_HORDE = Inst25Quest16name2
Inst25Quest16name3_HORDE = Inst25Quest16name3

--Quest 17 Horde
Inst25Quest17_HORDE = "17. 远古的邪恶（圣骑士）"
Inst25Quest17_HORDE_Level = "52"
Inst25Quest17_HORDE_Attain = "50"
Inst25Quest17_HORDE_Aim = "揭开阿塔哈卡神庙的秘密，释放阿塔拉利恩并击败他，从他的尸体上取走腐烂藤蔓。完成任务之后向亡灵壁垒的麦拉·黎明之刃复命。"
Inst25Quest17_HORDE_Location = "希尔瓦娜斯·风行者（幽暗城 - 皇家区; "..YELLOW.."59,94"..WHITE.."）"
Inst25Quest17_HORDE_Note = "圣骑士职业任务。腐烂藤蔓掉落自召唤的阿塔拉利恩"..YELLOW.."[1]"..WHITE.."，必须正确的破解雕像群的秘密。麦拉·黎明之刃在（提瑞斯法林地 - 亡灵壁垒; "..YELLOW.."83,71"..WHITE.."）。"
Inst25Quest17_HORDE_Prequest = "有，前往亡灵壁垒  ->  女妖之王的智慧"
Inst25Quest17_HORDE_Folgequest = "无"
Inst25Quest17PreQuest_HORDE = "true"
--
Inst25Quest17name1_HORDE = "天灾杀手"



--------------- INST26 - The Temple of Ahn'Qiraj (AQ40) ---------------

Inst26Story = "在安其拉中心矗立着一座古老神庙综合体。它在史前时代就被建造，用以纪念伟大的神与提供其拉大军繁衍的场地。自数千年前的流沙之战结束后，其拉帝国的双子皇帝就被青铜龙阿纳克洛斯和暗夜精灵们以强大的魔法结界困在了神庙里。随着时间流逝，流沙权杖已被重组，魔法结界上的封印也逐渐消失，通往安其拉神庙深处的道路也再度敞开。那些被困在神庙地下蠢蠢欲动的其拉军团开始准备入侵。为了避免第二次流沙之战再度爆发、贪婪的虫群再次于卡利姆多大陆倾巢而出，无论如何一定要阻止它们。"
Inst26Caption = "安其拉神殿"
Inst26QAA = "3 个任务"
Inst26QAH = "3 个任务"

--Quest 1 Alliance
Inst26Quest1 = "1. 克苏恩的遗产"
Inst26Quest1_Level = "60"
Inst26Quest1_Attain = "60"
Inst26Quest1_Aim = "将克苏恩之眼交给安其拉神殿的凯雷斯特拉兹。"
Inst26Quest1_Location = "克苏恩之眼（克苏恩掉落; "..YELLOW.."[9]"..WHITE.."）"
Inst26Quest1_Note = "凯雷斯特拉兹（安其拉神殿; "..YELLOW.."2'"..WHITE.."）"
Inst26Quest1_Prequest = "无"
Inst26Quest1_Folgequest = "有，卡利姆多的救世主"
-- No Rewards for this quest

--Quest 2 Alliance
Inst26Quest2 = "2. 卡利姆多的救世主"
Inst26Quest2_Level = "60"
Inst26Quest2_Attain = "60"
Inst26Quest2_Aim = "把克苏恩之眼交给时光之穴的阿纳克洛斯。"
Inst26Quest2_Location = "克苏恩之眼（克苏恩掉落; "..YELLOW.."[9]"..WHITE.."）"
Inst26Quest2_Note = "阿纳克洛斯（塔纳利斯 - 时光之穴; "..YELLOW.."65,49"..WHITE.."）"
Inst26Quest2_Prequest = "有，克苏恩的遗产"
Inst26Quest2_Folgequest = "无"
Inst26Quest2FQuest = "true"
--
Inst26Quest2name1 = "堕落神明咒符"
Inst26Quest2name2 = "堕落神明披风"
Inst26Quest2name3 = "堕落神明之戒"

--Quest 3 Alliance
Inst26Quest3 = "3. 其拉的秘密"
Inst26Quest3_Level = "60"
Inst26Quest3_Attain = "60"
Inst26Quest3_Aim = "把上古其拉神器交给隐藏在神殿入口处的龙类。"
Inst26Quest3_Location = "上古其拉神器（安其拉神殿随机掉落）"
Inst26Quest3_Note = "交给安多葛斯（安其拉神殿; "..YELLOW.."1'"..WHITE.."）。"
Inst26Quest3_Prequest = "无"
Inst26Quest3_Folgequest = "无"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst26Quest1_HORDE = Inst26Quest1
Inst26Quest1_HORDE_Level = Inst26Quest1_Level
Inst26Quest1_HORDE_Attain = Inst26Quest1_Attain
Inst26Quest1_HORDE_Aim = Inst26Quest1_Aim
Inst26Quest1_HORDE_Location = Inst26Quest1_Location
Inst26Quest1_HORDE_Note = Inst26Quest1_Note
Inst26Quest1_HORDE_Prequest = Inst26Quest1_Prequest
Inst26Quest1_HORDE_Folgequest = Inst26Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst26Quest2_HORDE = Inst26Quest2
Inst26Quest2_HORDE_Level = Inst26Quest2_Level
Inst26Quest2_HORDE_Attain = Inst26Quest2_Attain
Inst26Quest2_HORDE_Aim = Inst26Quest2_Aim
Inst26Quest2_HORDE_Location = Inst26Quest2_Location
Inst26Quest2_HORDE_Note = Inst26Quest2_Note
Inst26Quest2_HORDE_Prequest = Inst26Quest2_Prequest
Inst26Quest2_HORDE_Folgequest = Inst26Quest2_Folgequest
Inst26Quest2FQuest_HORDE = Inst26Quest2FQuest
--
Inst26Quest2name1_HORDE = Inst26Quest2name1
Inst26Quest2name2_HORDE = Inst26Quest2name2
Inst26Quest2name3_HORDE = Inst26Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst26Quest3_HORDE = Inst26Quest3
Inst26Quest3_HORDE_Level = Inst26Quest3_Level
Inst26Quest3_HORDE_Attain = Inst26Quest3_Attain
Inst26Quest3_HORDE_Aim = Inst26Quest3_Aim
Inst26Quest3_HORDE_Location = Inst26Quest3_Location
Inst26Quest3_HORDE_Note = Inst26Quest3_Note
Inst26Quest3_HORDE_Prequest = Inst26Quest3_Prequest
Inst26Quest3_HORDE_Folgequest = Inst26Quest3_Folgequest
-- No Rewards for this quest



--------------- INST27 - Zul'Farrak (ZF) ---------------

Inst27Story = "日光暴晒下的这座城市是沙怒巨魔的家园，他们一向以来都以其无情和黑暗魔法而闻名。巨魔传说中有一把强大的名叫鞭笞者苏萨斯的武器能够让最弱小的人可以击败最强大的敌人。很久以前，这把武器被分成了两半。然而，有传言说这两半可以在祖尔法拉克任何地方找到。据说还有一批加基森派来的雇佣兵进入了城市并被困住。他们的命运还不得而知。但是也许最让人感到不安的是一头远古生物正沉睡在城市中心的一个神圣的水池中——它是一个半神，它会摧毁任何胆敢唤醒它的人。"
Inst27Caption = "祖尔法拉克"
Inst27QAA = "7 个任务"
Inst27QAH = "7 个任务"

--Quest 1 Alliance
Inst27Quest1 = "1. 巨魔调和剂"
Inst27Quest1_Level = "45"
Inst27Quest1_Attain = "40"
Inst27Quest1_Aim = "收集20瓶巨魔调和剂，把它们交给加基森的特伦顿·轻锤。"
Inst27Quest1_Location = "特伦顿·轻锤（塔纳利斯 - 加基森; "..YELLOW.."51,28 "..WHITE.."）"
Inst27Quest1_Note = "每个巨魔都可能掉落调和剂。"
Inst27Quest1_Prequest = "无"
Inst27Quest1_Folgequest = "无"
-- No Rewards for this quest

--Quest 2 Alliance
Inst27Quest2 = "2. 圣甲虫的壳"
Inst27Quest2_Level = "45"
Inst27Quest2_Attain = "40"
Inst27Quest2_Aim = "给加基森的特兰雷克带去5个完整的圣甲虫壳。"
Inst27Quest2_Location = "特兰雷克（塔纳利斯 - 加基森; "..YELLOW.."51,26 "..WHITE.."）"
Inst27Quest2_Note = "前导任务始于克拉兹克（荆棘谷 - 藏宝海湾; "..YELLOW.."25,77"..WHITE.."）。\n每个圣甲虫都可能掉落壳儿。大量圣甲虫集中在"..YELLOW.."[2]"..WHITE.."。"
Inst27Quest2_Prequest = "有，特兰雷克"
Inst27Quest2_Folgequest = "无"
Inst27Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst27Quest3 = "3. 深渊皇冠"
Inst27Quest3_Level = "46"
Inst27Quest3_Attain = "40"
Inst27Quest3_Aim = "将深渊皇冠交给尘泥沼泽的塔贝萨。"
Inst27Quest3_Location = "塔贝萨（尘泥沼泽; "..YELLOW.."46,57 "..WHITE.."）"
Inst27Quest3_Note = "前导任务从彬克（铁炉堡; "..YELLOW.."25,8"..WHITE.."）处获得。\n水占师维蕾萨掉落深渊皇冠。你可以在"..YELLOW.."[6]"..WHITE.."找到她。"
Inst27Quest3_Prequest = "有，塔贝萨的任务"
Inst27Quest3_Folgequest = "无"
Inst27Quest3PreQuest = "true"
--
Inst27Quest3name1 = "幻法之杖"
Inst27Quest3name2 = "晶岩肩铠"

--Quest 4 Alliance
Inst27Quest4 = "4. 耐克鲁姆的徽章（系列任务）"
Inst27Quest4_Level = "47"
Inst27Quest4_Attain = "40"
Inst27Quest4_Aim = "将耐克鲁姆的徽章交给诅咒之地的萨迪斯·格希德。"
Inst27Quest4_Location = "萨迪斯·格希德（诅咒之地 - 守望堡; "..YELLOW.."66,19 "..WHITE.."）"
Inst27Quest4_Note = "此系列任务始于狮鹫管理员沙拉克·鹰斧（辛特兰 - 蛮锤城堡; "..YELLOW.."9,44"..WHITE.."）。\n你可以在"..YELLOW.."[4]"..WHITE.."找到耐克鲁姆。"
Inst27Quest4_Prequest = "有，枯木巨魔的牢笼 -> 萨迪斯·格希德"
Inst27Quest4_Folgequest = "有，占卜"
Inst27Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst27Quest5 = "5. 摩沙鲁的预言（系列任务）"
Inst27Quest5_Level = "47"
Inst27Quest5_Attain = "40"
Inst27Quest5_Aim = "将第一块和第二块摩沙鲁石板交给塔纳利斯的叶基亚。"
Inst27Quest5_Location = "叶基亚（塔纳利斯 - 热砂港; "..YELLOW.."66,22 "..WHITE.."）"
Inst27Quest5_Note = "前导任务也是在此获得。\n\n两块石板分别由殉教者塞卡"..YELLOW.."[2]"..WHITE.."和水占师维蕾萨"..YELLOW.."[6]"..WHITE.."掉落。"
Inst27Quest5_Prequest = "有，尖啸者的灵魂"
Inst27Quest5_Folgequest = "有，远古之卵"
Inst27Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst27Quest6 = "6. 探水棒"
Inst27Quest6_Level = "47"
Inst27Quest6_Attain = "40"
Inst27Quest6_Aim = "把探水棒交给加基森的首席工程师沙克斯·比格维兹。"
Inst27Quest6_Location = "比格维兹（塔纳利斯 - 加基森; "..YELLOW.."52,28 "..WHITE.."）"
Inst27Quest6_Note = "你可以从布莱中士那里得到探水棒。你可以在"..YELLOW.."[4]"..WHITE.."找到他。但要在神庙百人斩事件后后打败布莱中士，才能得到探水棒。"
Inst27Quest6_Prequest = "无"
Inst27Quest6_Folgequest = "无"
--
Inst27Quest6name1 = "石工兄弟会之戒"
Inst27Quest6name2 = "工程学协会头盔"

--Quest 7 Alliance
Inst27Quest7 = "7. 加兹瑞拉"
Inst27Quest7_Level = "50"
Inst27Quest7_Attain = "40"
Inst27Quest7_Aim = "把加兹瑞拉的鳞片交给闪光平原的维兹尔·铜栓。"
Inst27Quest7_Location = "维兹尔·铜栓（千针石林 - 闪光平原; "..YELLOW.."78,77 "..WHITE.."）"
Inst27Quest7_Note = "前导任务从科罗莫特·钢尺（铁炉堡 - 侏儒区; "..YELLOW.."68,46"..WHITE.."）得到。但这不是一个必要的任务。\n你可以在"..YELLOW.."[6]"..WHITE.."使用祖尔法拉克之槌敲锣召唤加兹瑞拉。\n槌来自守护者奇尔加（辛特兰 - 祖尔祭坛; "..YELLOW.."49,70"..WHITE.."）的神圣之槌并在辛萨罗祭坛"..YELLOW.."59,77"..WHITE.."上使用，才能在祖尔法拉克敲锣。"
Inst27Quest7_Prequest = "有，铜栓兄弟"
Inst27Quest7_Folgequest = "无"
Inst27Quest7PreQuest = "true"
--
Inst27Quest7name1 = "棍子上的胡萝卜"


--Quest 1 Horde
Inst27Quest1_HORDE = "1. 蜘蛛之神（系列任务）"
Inst27Quest1_HORDE_Level = "45"
Inst27Quest1_HORDE_Attain = "40"
Inst27Quest1_HORDE_Aim = "阅读塞卡石板，了解枯木巨魔的蜘蛛之神的名字，然后回到加德林大师那里。"
Inst27Quest1_HORDE_Location = "加德林大师（杜隆塔尔 - 森金村; "..YELLOW.."55,74 "..WHITE.."）"
Inst27Quest1_HORDE_Note = "此任务始于辛特兰巨魔村庄的毒液瓶任务。\n你会在"..YELLOW.."[2]"..WHITE.."发现石板。"
Inst27Quest1_HORDE_Prequest = "有，毒液瓶 -> 请教加德林大师"
Inst27Quest1_HORDE_Folgequest = "有，召唤沙德拉"
Inst27Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 1 Alliance)
Inst27Quest2_HORDE = "2. 巨魔调和剂"
Inst27Quest2_HORDE_Level = Inst27Quest1_Level
Inst27Quest2_HORDE_Attain = Inst27Quest1_Attain
Inst27Quest2_HORDE_Aim = Inst27Quest1_Aim
Inst27Quest2_HORDE_Location = Inst27Quest1_Location
Inst27Quest2_HORDE_Note = Inst27Quest1_Note
Inst27Quest2_HORDE_Prequest = Inst27Quest1_Prequest
Inst27Quest2_HORDE_Folgequest = Inst27Quest1_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 2 Alliance)
Inst27Quest3_HORDE = "3. 圣甲虫的壳"
Inst27Quest3_HORDE_Level = Inst27Quest2_Level
Inst27Quest3_HORDE_Attain = Inst27Quest2_Attain
Inst27Quest3_HORDE_Aim = Inst27Quest2_Aim
Inst27Quest3_HORDE_Location = Inst27Quest2_Location
Inst27Quest3_HORDE_Note = Inst27Quest2_Note
Inst27Quest3_HORDE_Prequest = Inst27Quest2_Prequest
Inst27Quest3_HORDE_Folgequest = Inst27Quest2_Folgequest
Inst27Quest3PreQuest_HORDE = Inst27Quest2PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 3 Alliance - no prequest)
Inst27Quest4_HORDE = "4. 深渊皇冠"
Inst27Quest4_HORDE_Level = Inst27Quest3_Level
Inst27Quest4_HORDE_Attain = Inst27Quest3_Attain
Inst27Quest4_HORDE_Aim = Inst27Quest3_Aim
Inst27Quest4_HORDE_Location = Inst27Quest3_Location
Inst27Quest4_HORDE_Note = "水占师维蕾萨掉落深渊皇冠。你可以在"..YELLOW.."[6]"..WHITE.."找到她。"
Inst27Quest4_HORDE_Prequest = "无"
Inst27Quest4_HORDE_Folgequest = Inst27Quest3_Folgequest
--
Inst27Quest4name1_HORDE = Inst27Quest3name1
Inst27Quest4name2_HORDE = Inst27Quest3name2

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst27Quest5_HORDE = Inst27Quest5
Inst27Quest5_HORDE_Level = Inst27Quest5_Level
Inst27Quest5_HORDE_Attain = Inst27Quest5_Attain
Inst27Quest5_HORDE_Aim = Inst27Quest5_Aim
Inst27Quest5_HORDE_Location = Inst27Quest5_Location
Inst27Quest5_HORDE_Note = Inst27Quest5_Note
Inst27Quest5_HORDE_Prequest = Inst27Quest5_Prequest
Inst27Quest5_HORDE_Folgequest = Inst27Quest5_Folgequest
Inst27Quest5PreQuest_HORDE = Inst27Quest5Prequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst27Quest6_HORDE = Inst27Quest6
Inst27Quest6_HORDE_Level = Inst27Quest6_Level
Inst27Quest6_HORDE_Attain = Inst27Quest6_Attain
Inst27Quest6_HORDE_Aim = Inst27Quest6_Aim
Inst27Quest6_HORDE_Location = Inst27Quest6_Location
Inst27Quest6_HORDE_Note = Inst27Quest6_Note
Inst27Quest6_HORDE_Prequest = Inst27Quest6_Prequest
Inst27Quest6_HORDE_Folgequest = Inst27Quest6_Folgequest
--
Inst27Quest6name1_HORDE = Inst27Quest6name1
Inst27Quest6name2_HORDE = Inst27Quest6name2

--Quest 7 Horde  (same as Quest 7 Alliance - no prequest)
Inst27Quest7_HORDE = Inst27Quest7
Inst27Quest7_HORDE_Level = Inst27Quest7_Level
Inst27Quest7_HORDE_Attain = Inst27Quest7_Attain
Inst27Quest7_HORDE_Aim = Inst27Quest7_Aim
Inst27Quest7_HORDE_Location = Inst27Quest7_Location
Inst27Quest7_HORDE_Note = "你可以在"..YELLOW.."[6]"..WHITE.."使用祖尔法拉克之槌敲锣召唤加兹瑞拉。\n槌来自守护者奇尔加（辛特兰 - 祖尔祭坛; "..YELLOW.."49,70"..WHITE.."）的神圣之槌并在辛萨罗祭坛"..YELLOW.."59,77"..WHITE.."上使用，才能在祖尔法拉克敲锣。"
Inst27Quest7_HORDE_Prequest = "无"
Inst27Quest7_HORDE_Folgequest = Inst27Quest7_Folgequest
--
Inst27Quest7name1_HORDE = Inst27Quest7name1



--------------- INST28 - Zul'Gurub (ZG) ---------------

Inst28Story = {
  ["Page1"] = "早在几千年前，强大的古拉巴什帝国陷入了一场规模浩大的内战，一群极具影响力的被称作阿塔莱的巨魔祭司，信奉着一个名叫夺灵者·哈卡的嗜血的邪神。这些阿塔莱祭司虽然已被击败并被处以永久的流放，但伟大的巨魔帝国就这样崩塌了。被流放的祭司们来到了北方的悲伤沼泽。在这里，他们为哈卡神建造了一座大神庙——阿塔哈卡神庙，并继续在那里为他们的主人重返物质世界而作准备……",
  ["Page2"] = "终于，阿塔莱祭司发现，哈卡的物质形态只有在古老的古拉巴什帝国的首都——祖尔格拉布，才能召唤出来。不幸的是，这些祭司们最近真的成功召唤出哈卡——传闻证实可怕的夺灵者真的出现在古拉巴什废墟的中心。\n \n为了镇压血神，所有的巨魔都联合起来，派出了一支由高阶牧师组成的小队深入这座古老的城市。队中的每个牧师都是一位远古之神的强大战士，他们分别代表着蝙蝠、豹、老虎、蜘蛛和蛇的力量，但是尽管如此，强大的哈卡仍然轻易地击败了他们。现在这些勇士和他们的远古之神全都臣服于夺灵者的力量。如果有任何冒险者想进入废墟禁地挑战强大的血神哈卡，他们就必须先击败这些高阶牧师。",
  ["MaxPages"] = "2",
};
Inst28Caption = "祖尔格拉布"
Inst28QAA = "4 个任务"
Inst28QAH = "4 个任务"

--Quest 1 Alliance
Inst28Quest1 = "1. 祭司的头颅"
Inst28Quest1_Level = "60"
Inst28Quest1_Attain = "58"
Inst28Quest1_Aim = "将神圣之索穿上5颗导魔师的头颅，然后把这一串头颅交给尤亚姆巴岛上的伊克萨尔。"
Inst28Quest1_Location = "伊克萨尔（荆棘谷 - 尤亚姆巴岛; "..YELLOW.."15,15"..WHITE.."）"
Inst28Quest1_Note = "请你确认每次都搜索了高阶祭司的尸体。"
Inst28Quest1_Prequest = "无"
Inst28Quest1_Folgequest = "无"
--
Inst28Quest1name1 = "扭曲头颅腰带"
Inst28Quest1name2 = "皱缩头颅腰带"
Inst28Quest1name3 = "防腐头颅腰带"
Inst28Quest1name4 = "细小头颅腰带"

--Quest 2 Alliance
Inst28Quest2 = "2. 哈卡之心"
Inst28Quest2_Level = "60"
Inst28Quest2_Attain = "58"
Inst28Quest2_Aim = "把哈卡之心交给尤亚姆巴岛上的莫托尔。"
Inst28Quest2_Location = "哈卡之心（哈卡掉落; "..YELLOW.."[11]"..WHITE.."）"
Inst28Quest2_Note = "莫托尔（荆棘谷 - 尤亚姆巴岛; "..YELLOW.."15,15"..WHITE.."）"
Inst28Quest2_Prequest = "无"
Inst28Quest2_Folgequest = "无"
--
Inst28Quest2name1 = "赞达拉英雄徽记"
Inst28Quest2name2 = "赞达拉英雄护符"
Inst28Quest2name3 = "赞达拉英雄勋章"

--Quest 3 Alliance
Inst28Quest3 = "3. 纳特的卷尺"
Inst28Quest3_Level = "60"
Inst28Quest3_Attain = "59"
Inst28Quest3_Aim = "将纳特的卷尺交给尘泥沼泽的纳特·帕格。"
Inst28Quest3_Location = "破碎的工具箱（祖尔格拉布 - 隔水哈卡之岛的东北的岸边。）"
Inst28Quest3_Note = "找到纳特·帕格（尘泥沼泽; "..YELLOW.."59,60"..WHITE.."）。 完成任务后你可以从他那里购买哈卡之岛臭泥鱼诱饵，可以在祖尔格拉布召唤隐藏的加兹兰卡。"
Inst28Quest3_Prequest = "无"
Inst28Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst28Quest4 = "4. 完美的毒药"
Inst28Quest4_Level = "60"
Inst28Quest4_Attain = "60"
Inst28Quest4_Aim = "塞纳里奥要塞的德尔克·雷木让你把温诺希斯的毒囊和库林纳克斯的毒囊交给他。"
Inst28Quest4_Location = "德尔克·雷木（希利苏斯 - 塞纳里奥要塞; "..YELLOW.."52,39"..WHITE.."）"
Inst28Quest4_Note = "高阶祭司温诺希斯"..YELLOW.."祖尔格拉布"..WHITE.."掉落温诺希斯的毒囊。库林纳克斯"..YELLOW.."安其拉废墟"..WHITE..""..YELLOW.."[1]"..WHITE.."掉落库林纳克斯的毒囊。"
Inst28Quest4_Prequest = "无"
Inst28Quest4_Folgequest = "无"
--
Inst28Quest4name1 = "拉文霍德切割者"
Inst28Quest4name2 = "开闸刀"
Inst28Quest4name3 = "雷木之刺"
Inst28Quest4name4 = "康恩之怒"
Inst28Quest4name5 = "法拉德的装填器"
Inst28Quest4name6 = "西蒙尼的耕种用锤"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst28Quest1_HORDE = Inst28Quest1
Inst28Quest1_HORDE_Level = Inst28Quest1_Level
Inst28Quest1_HORDE_Attain = Inst28Quest1_Attain
Inst28Quest1_HORDE_Aim = Inst28Quest1_Aim
Inst28Quest1_HORDE_Location = Inst28Quest1_Location
Inst28Quest1_HORDE_Note = Inst28Quest1_Note
Inst28Quest1_HORDE_Prequest = Inst28Quest1_Prequest
Inst28Quest1_HORDE_Folgequest = Inst28Quest1_Folgequest
--
Inst28Quest1name1_HORDE = Inst28Quest1name1
Inst28Quest1name2_HORDE = Inst28Quest1name2
Inst28Quest1name3_HORDE = Inst28Quest1name3
Inst28Quest1name4_HORDE = Inst28Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst28Quest2_HORDE = Inst28Quest2
Inst28Quest2_HORDE_Level = Inst28Quest2_Level
Inst28Quest2_HORDE_Attain = Inst28Quest2_Attain
Inst28Quest2_HORDE_Aim = Inst28Quest2_Aim
Inst28Quest2_HORDE_Location = Inst28Quest2_Location
Inst28Quest2_HORDE_Note = Inst28Quest2_Note
Inst28Quest2_HORDE_Prequest = Inst28Quest2_Prequest
Inst28Quest2_HORDE_Folgequest = Inst28Quest2_Folgequest
--
Inst28Quest2name1_HORDE = Inst28Quest2name1
Inst28Quest2name2_HORDE = Inst28Quest2name2
Inst28Quest2name3_HORDE = Inst28Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst28Quest3_HORDE = Inst28Quest3
Inst28Quest3_HORDE_Level = Inst28Quest3_Level
Inst28Quest3_HORDE_Attain = Inst28Quest3_Attain
Inst28Quest3_HORDE_Aim = Inst28Quest3_Aim
Inst28Quest3_HORDE_Location = Inst28Quest3_Location
Inst28Quest3_HORDE_Note = Inst28Quest3_Note
Inst28Quest3_HORDE_Prequest = Inst28Quest3_Prequest
Inst28Quest3_HORDE_Folgequest = Inst28Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst28Quest4_HORDE = Inst28Quest4
Inst28Quest4_HORDE_Level = Inst28Quest4_Level
Inst28Quest4_HORDE_Attain = Inst28Quest4_Attain
Inst28Quest4_HORDE_Aim = Inst28Quest4_Aim
Inst28Quest4_HORDE_Location = Inst28Quest4_Location
Inst28Quest4_HORDE_Note = Inst28Quest4_Note
Inst28Quest4_HORDE_Prequest = Inst28Quest4_Prequest
Inst28Quest4_HORDE_Folgequest = Inst28Quest4_Folgequest
--
Inst28Quest4name1_HORDE = Inst28Quest4name1
Inst28Quest4name2_HORDE = Inst28Quest4name2
Inst28Quest4name3_HORDE = Inst28Quest4name3
Inst28Quest4name4_HORDE = Inst28Quest4name4
Inst28Quest4name5_HORDE = Inst28Quest4name5
Inst28Quest4name6_HORDE = Inst28Quest4name6



--------------- INST29 - Gnomeregan (Gnomer) ---------------

Inst29Story = "位于丹莫洛的科技奇迹城市诺莫瑞根世代以来都是侏儒的主城。最近，一群邪恶的变异食鄂怪侵入了包括侏儒主城在内的多处丹莫洛地区。为了做出殊死一搏来干掉入侵的食腭怪，大工匠梅卡托克命令打开城市中的紧急辐射水箱。侏儒在等待那些食腭怪死亡或者逃跑的同时也在寻找躲避辐射的方法。不幸的是，虽然食腭怪在经过辐射之后感染了毒性——但是它们的攻击没有停止，也没有丝毫的减弱。那些没有被辐射杀死的侏儒被迫逃离，他们在附近的矮人城市铁炉堡找到了安身之处。大工匠梅卡托克组建了一个智囊团来商议重新夺回他们挚爱的城市的计划。传说大工匠梅卡托克曾经最信任的顾问，麦克尼尔·瑟玛普拉格被判了他的人民并纵容了这次入侵的发生。现在，他的心智，麦克尼尔·瑟玛普拉格还留在诺莫瑞根中——他在继续筹划着自己黑暗的计划并成为这座城市新的科技领主。"
Inst29Caption = "诺莫瑞根"
Inst29QAA = "10 个任务"
Inst29QAH = "5 个任务"

--Quest 1 Alliance
Inst29Quest1 = "1. 拯救尖端机器人！"
Inst29Quest1_Level = "26"
Inst29Quest1_Attain = "20"
Inst29Quest1_Aim = "将尖端机器人的存储器核心交给铁炉堡的工匠大师欧沃斯巴克。"
Inst29Quest1_Location = "工匠大师欧沃斯巴克（铁炉堡 - 侏儒区; "..YELLOW.."69,50 "..WHITE.."）"
Inst29Quest1_Note = "你可以在萨尔努修士（暴风城 - 教堂广场; "..YELLOW.."40,30"..WHITE.."）那儿接到此任务的前导任务。\n在你进入副本之前，后门附近"..YELLOW.."副本入口地图[4]"..WHITE.."，可以找到尖端机器人。"
Inst29Quest1_Prequest = "有，工匠大师欧沃斯巴克"
Inst29Quest1_Folgequest = "无"
Inst29Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest2 Alliance
Inst29Quest2 = "2. 诺恩"
Inst29Quest2_Level = "27"
Inst29Quest2_Attain = "20"
Inst29Quest2_Aim = "用空铅瓶对着辐射入侵者或者辐射抢劫者，从它们身上收集放射尘。瓶子装满之后，把它交给卡拉诺斯的奥齐·电环。"
Inst29Quest2_Location = "奥齐·电环（丹莫罗 - 卡拉诺斯; "..YELLOW.."45,49 "..WHITE.."）"
Inst29Quest2_Note = "你可以在诺恩（铁炉堡 - 侏儒区; "..YELLOW.."69,50"..WHITE.."）那儿得到此任务的前导任务。\n要得到辐射尘，你必须对"..RED.."活的"..WHITE.."辐射入侵者或者辐射抢劫者使用空铅瓶。"
Inst29Quest2_Prequest = "有，灾难之后"
Inst29Quest2_Folgequest = "有，更多的辐射尘"
Inst29Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest3 Alliance
Inst29Quest3 = "3. 更多的辐射尘！"
Inst29Quest3_Level = "30"
Inst29Quest3_Attain = "23"
Inst29Quest3_Aim = "到诺莫瑞根去收集高强度辐射尘。要多加小心，这种辐射尘非常不稳定，很快就会分解。奥齐要求你把沉重的铅瓶也交给他。"
Inst29Quest3_Location = "奥齐·电环（丹莫罗 - 卡拉诺斯; "..YELLOW.."45,49 "..WHITE.."）"
Inst29Quest3_Note = "要得到辐射尘，你必须对"..RED.."活的"..WHITE.."辐射泥浆怪，辐射潜伏者，辐射水元素使用沉重的铅瓶。"
Inst29Quest3_Prequest = "有，诺恩"
Inst29Quest3_Folgequest = "无"
Inst29Quest3FQuest = "true"
-- No Rewards for this quest

--Quest4 Alliance
Inst29Quest4 = "4. 陀螺式挖掘机"
Inst29Quest4_Level = "30"
Inst29Quest4_Attain = "20"
Inst29Quest4_Aim = "收集24副机械内胆，把它们交给暴风城的舒尼。"
Inst29Quest4_Location = "沉默的舒尼（暴风城 - 矮人区; "..YELLOW.."55,12 "..WHITE.."）"
Inst29Quest4_Note = "每个机器人都掉落内胆。"
Inst29Quest4_Prequest = "无"
Inst29Quest4_Folgequest = "无"
--
Inst29Quest4name1 = "舒尼的扳手"
Inst29Quest4name2 = "欺诈手套"

--Quest5 Alliance
Inst29Quest5 = "5. 基础模组"
Inst29Quest5_Level = "30"
Inst29Quest5_Attain = "24"
Inst29Quest5_Aim = "收集12个基础模组，把它们交给铁炉堡的科劳莫特·钢尺。"
Inst29Quest5_Location = "科劳莫特·钢尺（铁炉堡 - 侏儒区; "..YELLOW.."68,46 "..WHITE.."）"
Inst29Quest5_Note = "你可以在玛希尔（达纳苏斯 - 战士区; "..YELLOW.."59,45"..WHITE.."）那儿得到此任务的前导任务。\n每个诺莫瑞根的敌人都可能掉落基础模组。"
Inst29Quest5_Prequest = "有，帮助科劳莫特"
Inst29Quest5_Folgequest = "无"
Inst29Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest6 Alliance
Inst29Quest6 = "6. 抢救数据"
Inst29Quest6_Level = "30"
Inst29Quest6_Attain = "25"
Inst29Quest6_Aim = "将彩色穿孔卡片交给铁炉堡的大机械师卡斯派普。"
Inst29Quest6_Location = "大机械师卡斯派普（铁炉堡 - 侏儒区; "..YELLOW.."69,48 "..WHITE.."）"
Inst29Quest6_Note = "你可以在加克希姆·尘链（石爪山脉; "..YELLOW.."59,67"..WHITE.."）那儿得到此任务的前导任务。但这不是一个必要的任务。\n白色卡片随机掉落。你可以在进入副本之前紧靠后门入口处"..YELLOW.."副本入口地图[3]"..WHITE.."找到第一终端。第二个在"..YELLOW.."[3]"..WHITE.."，第三个在"..YELLOW.."[5]"..WHITE.."，而第四个在"..YELLOW.."[6]"..WHITE.."。"
Inst29Quest6_Prequest = "有，卡斯派普的任务"
Inst29Quest6_Folgequest = "无"
Inst29Quest6PreQuest = "true"
--
Inst29Quest6name1 = "修理工的斗篷"
Inst29Quest6name2 = "蒸汽锤"

--Quest7 Alliance
Inst29Quest7 = "7. 一团混乱"
Inst29Quest7_Level = "30"
Inst29Quest7_Attain = "22"
Inst29Quest7_Aim = "将克努比护送到出口，然后向藏宝海湾的斯库提汇报。"
Inst29Quest7_Location = "克努比（诺莫瑞根 "..YELLOW.."[3]"..WHITE.."）"
Inst29Quest7_Note = "护送任务！你可以在（荆棘谷 - 藏宝海湾; "..YELLOW.."27,77"..WHITE.."）找到斯库提。"
Inst29Quest7_Prequest = "无"
Inst29Quest7_Folgequest = "无"
--
Inst29Quest7name1 = "焊接护腕"
Inst29Quest7name2 = "精灵之翼"

--Quest8 Alliance
Inst29Quest8 = "8. 大叛徒"
Inst29Quest8_Level = "35"
Inst29Quest8_Attain = "25"
Inst29Quest8_Aim = "到诺莫瑞根去杀掉麦克尼尔·瑟玛普拉格。完成任务之后向大工匠梅卡托克报告。"
Inst29Quest8_Location = "大工匠梅卡托克（铁炉堡 - 侏儒区; "..YELLOW.."68,48"..WHITE.."）"
Inst29Quest8_Note = "你可以在"..YELLOW.."[8]"..WHITE.."找到麦克尼尔·瑟玛普拉格。他是诺莫瑞根最后一个 Boss。\n在战斗中你必须按下它旁边的按钮阻止他放炸弹。"
Inst29Quest8_Prequest = "无"
Inst29Quest8_Folgequest = "无"
--
Inst29Quest8name1 = "公民长袍"
Inst29Quest8name2 = "旅行皮裤"
Inst29Quest8name3 = "双链护腿 "

--Quest 9 Alliance
Inst29Quest9 = "9. 脏兮兮的戒指"
Inst29Quest9_Level = "34"
Inst29Quest9_Attain = "28"
Inst29Quest9_Aim = "想方法把脏兮兮的戒指弄干净。"
Inst29Quest9_Location = "脏兮兮的戒指（诺莫瑞根随机掉落）"
Inst29Quest9_Note = "这个戒指可以在清洁器5200型中清洁，位置在"..YELLOW.."[2]"..WHITE.."。"
Inst29Quest9_Prequest = "无"
Inst29Quest9_Folgequest = "有，戒指归来"
-- No Rewards for this quest

--Quest 10 Alliance
Inst29Quest10 = "10. 戒指归来"
Inst29Quest10_Level = "34"
Inst29Quest10_Attain = "28"
Inst29Quest10_Aim = "你要么自己留着这枚戒指，要么就按照戒指内侧刻着的名字找到它的主人。"
Inst29Quest10_Location = "闪亮的金戒指（从脏兮兮的戒指清洁后获得）"
Inst29Quest10_Note = "把它交给塔瓦斯德·基瑟尔（铁炉堡 - 秘法区; "..YELLOW.."36,3"..WHITE.."）。奖励的戒指为随机属性。"
Inst29Quest10_Prequest = "有，脏兮兮的戒指"
Inst29Quest10_Folgequest = "有，侏儒的手艺"
Inst29Quest10FQuest = "true"
--
Inst29Quest10name1 = "闪亮的金戒指"


--Quest 1 Horde
Inst29Quest1_HORDE = "1. 出发！诺莫瑞根！"
Inst29Quest1_HORDE_Level = "35"
Inst29Quest1_HORDE_Attain = "25"
Inst29Quest1_HORDE_Aim = "等斯库提调整好地精传送器。"
Inst29Quest1_HORDE_Location = "斯库提（荆棘谷 - 藏宝海湾; "..YELLOW.."27,77 "..WHITE.."）"
Inst29Quest1_HORDE_Note = "你可以在索维克（奥格瑞玛 - 荣誉谷; "..YELLOW.."75,25"..WHITE.."）那儿得到此任务的前导任务。\n当你完成这个任务，你可以使用藏宝海湾的传送器。"
Inst29Quest1_HORDE_Prequest = "有，主工程师斯库提"
Inst29Quest1_HORDE_Folgequest = "无"
Inst29Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 7 Alliance)
Inst29Quest2_HORDE = "2. 一团混乱"
Inst29Quest2_HORDE_Level = Inst29Quest7_Level
Inst29Quest2_HORDE_Attain = Inst29Quest7_Attain
Inst29Quest2_HORDE_Aim = Inst29Quest7_Aim
Inst29Quest2_HORDE_Location = Inst29Quest7_Location
Inst29Quest2_HORDE_Note = Inst29Quest7_Note
Inst29Quest2_HORDE_Prequest = Inst29Quest7_Prequest
Inst29Quest2_HORDE_Folgequest = Inst29Quest7_Folgequest
--
Inst29Quest2name1_HORDE = Inst29Quest7name1
Inst29Quest2name2_HORDE = Inst29Quest7name2

--Quest3 Horde
Inst29Quest3_HORDE = "3. 设备之战"
Inst29Quest3_HORDE_Level = "35"
Inst29Quest3_HORDE_Attain = "25"
Inst29Quest3_HORDE_Aim = "从诺莫瑞根拿到钻探设备蓝图和麦克尼尔的保险箱密码，把它们交给奥格瑞玛的诺格。"
Inst29Quest3_HORDE_Location = "诺格（奥格瑞玛 - 荣誉谷; "..YELLOW.."75,25 "..WHITE.."）"
Inst29Quest3_HORDE_Note = "你可以在"..YELLOW.."[8]"..WHITE.."发现麦克尼尔·瑟玛普拉格。他是诺莫瑞根最后一个 Boss。\n在战斗中你必须按下它旁边的按钮阻止他放炸弹。"
Inst29Quest3_HORDE_Prequest = "无"
Inst29Quest3_HORDE_Folgequest = "无"
--
Inst29Quest3name1_HORDE = "公民长袍"
Inst29Quest3name2_HORDE = "旅行皮裤"
Inst29Quest3name3_HORDE = "双链护腿"

--Quest 4 Horde  (same as Quest 9 Alliance)
Inst29Quest4_HORDE = "4. 脏兮兮的戒指"
Inst29Quest4_HORDE_Level = Inst29Quest9_Level
Inst29Quest4_HORDE_Attain = Inst29Quest9_Attain
Inst29Quest4_HORDE_Aim = Inst29Quest9_Aim
Inst29Quest4_HORDE_Location = Inst29Quest9_Location
Inst29Quest4_HORDE_Note = Inst29Quest9_Note
Inst29Quest4_HORDE_Prequest = Inst29Quest9_Prequest
Inst29Quest4_HORDE_Folgequest = Inst29Quest9_Folgequest
-- No Rewards for this quest

--Quest 5 Horde
Inst29Quest5_HORDE = "5. 戒指归来"
Inst29Quest5_HORDE_Level = "34"
Inst29Quest5_HORDE_Attain = "28"
Inst29Quest5_HORDE_Aim = "你要么自己留着这枚戒指，要么就按照戒指内侧刻着的名字找到它的主人。"
Inst29Quest5_HORDE_Location = "闪亮的金戒指（从脏兮兮的戒指清洁后获得）"
Inst29Quest5_HORDE_Note = "把戒指交给诺格（奥格瑞玛 - 荣誉谷; "..YELLOW.."75,25"..WHITE.."）。奖励的戒指为随机属性。"
Inst29Quest5_HORDE_Prequest = "有，脏兮兮的戒指"
Inst29Quest5_HORDE_Folgequest = "无"
Inst29Quest5FQuest = "true"
--
Inst29Quest5name1_HORDE = "闪亮的金戒指"



--------------- INST37 - HFC: Ramparts (Ramp) ---------------

Inst37Story = {
  ["Page1"] = "在满目疮痍的外域，地狱火半岛的中心矗立着地狱火堡垒。在第一次和第二次兽人战争中，它作为兽人的基地，是不可攻克的象征。多年来，人们以为这座巨大的堡垒已经被遗弃了……\n \n直到最近。\n \n虽然德拉诺大陆被耐奥祖不计后果的破坏了，但是在地狱火堡垒中仍然居住着劫掠成性的红色狂暴堕落兽人。虽然这个新出现的野蛮种族还带着不少谜团，更令人吃惊的是他们的数量还在不断增长。\n \n虽然萨尔和格罗姆地狱咆哮已经杀死了玛诺洛斯，终止了部落的堕落。但是有报告显示地狱火堡垒中的野蛮兽人找到了一种新的堕落之源来满足他们原始的嗜血欲望。",
  ["Page2"] = "这些兽人的领袖是谁暂时无人可知，但是可以充分相信他们不是为燃烧军团工作。\n \n也许外域传来的最令人不安的消息就是从堡垒地下深处传来的雷霆一样的野蛮怒吼。许多人开始猜想这些怪异的吼叫是否同堕落兽人以及他们不断增长的数量有关。不幸的是，这些问题都没有答案。\n \n至少现在如此。",
  ["MaxPages"] = "2",
};
Inst37Caption = "地狱火堡垒：城墙"
Inst37QAA = "3 个任务"
Inst37QAH = "3 个任务"
Inst37General = {
    {
    "巡视者加戈玛",
    "巡视者加戈玛是你在地狱火城墙碰到的第一个 Boss。他带着2个地狱火岗哨。对付他的方法是要么干掉他的随从要么控制住他的随从，因为如果不这么做他们会治疗巡视者加戈玛。让护甲最高的远程队员站在离加戈玛最远的位置，因为他会对最远的队员冲锋。他对布衣的伤害没有那么强，不过最好还是让护甲比较高的队员来承受伤害。",
    RED .. "致死打击" .. WHITE .. "：巡视者加戈玛有时候会给 MT 以致死打击减少10%的治疗效果并可以叠加，但是不需要 2T 因为他实在太容易死了。",
    },

    {
    "无疤者奥摩尔",
    "奥摩尔会对玩家释放背叛光环：每秒钟对15码以内的队员造成360到440点暗影伤害。受到光环影响的可以远离队友。",
    RED .. "召唤地狱犬" .. WHITE .. "：每几秒钟召唤'地狱犬'。这些地狱犬攻击很强，但是血量很少，应该很快就能被杀死。",
    },

    {
    "瓦兹德和纳杉",
    "瓦兹德会在你杀死平台前面的2个守卫的时候降落。纳杉会在瓦兹德到20%血量的时候降落。",
    "瓦兹德()：你瞧不起它？\n" .. RED .. "纳杉（龙息术）" .. WHITE .. "：纳杉会对它的前面目标造成面火焰伤害。 坦克应该把它拉的背离队友。\n" .. RED .. "纳杉（火焰弹）" .. WHITE .. "：纳杉会向玩家扔火球，造成2000左右伤害，并在周围造成每秒600的火焰伤害。每个人都一定要远离火圈！",
    },
};

--Quest 1 Alliance
Inst37Quest1 = "1. 攻陷城墙"
Inst37Quest1_Level = "62"
Inst37Quest1_Attain = "59"
Inst37Quest1_Aim = "杀死巡视者加戈玛、无疤者奥摩尔和座龙纳杉，并将加戈玛之手、奥摩尔之蹄和纳杉之颅交给地狱火半岛上的荣耀堡内的冈尼。"
Inst37Quest1_Location = "卡德维克中尉（地狱火半岛 - 荣誉堡; "..YELLOW.."57, 66"..WHITE.."）"
Inst37Quest1_Note = "加戈玛在"..YELLOW.."[1]"..WHITE.."，奥摩尔在"..YELLOW.."[2]"..WHITE.."，纳杉在"..YELLOW.."[3]"..WHITE.."。冈尼在（地狱火半岛 - 荣耀堡; "..YELLOW.."56, 67"..WHITE.."）。\n\n要接到这个任务，你必须完成邪恶的咒语这个任务，这个任务的起始任务是知己知彼，起始 NPC 是达纳斯·托尔贝恩（地狱火半岛 - 荣耀堡; "..YELLOW.."57, 67"..WHITE.."）。"
Inst37Quest1_Prequest = "有，知己知彼 -> 邪恶的咒语"
Inst37Quest1_Folgequest = "有，愤怒之心（"..YELLOW.."地狱火堡垒：鲜血熔炉"..WHITE.."）"
Inst37Quest1PreQuest = "true"
--
Inst37Quest1name1 = "精确手甲"
Inst37Quest1name2 = "翡翠战士肩铠"
Inst37Quest1name3 = "魔法力量护肩"
Inst37Quest1name4 = "稳步皮靴"

--Quest 2 Alliance
Inst37Quest2 = "2. 黑暗之潮"
Inst37Quest2_Level = "62"
Inst37Quest2_Attain = "59"
Inst37Quest2_Aim = "将不祥的信件交给地狱火半岛上荣耀堡的远征军指挥官达纳斯·托尔贝恩。"
Inst37Quest2_Location = "不祥的信件（瓦兹德掉落; "..YELLOW.."[3]"..WHITE.."）"
Inst37Quest2_Note = "远征军指挥官达纳斯·托尔贝恩在（地狱火半岛 - 荣耀堡; "..YELLOW.."57, 67"..WHITE.."）。"
Inst37Quest2_Prequest = "无"
Inst37Quest2_Folgequest = "有，鲜血就是生命（"..YELLOW.."地狱火堡垒：鲜血熔炉"..WHITE.."）"
Inst37Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst37Quest3 = "3. 悬赏：纳杉的骑鞭（英雄日常）"
Inst37Quest3_Level = "70"
Inst37Quest3_Attain = "70"
Inst37Quest3_Aim = "商人扎雷姆要你进入地狱火城墙取得纳杉的骑鞭，完成任务后回到沙塔斯城贫民窟，领取你的奖赏。"
Inst37Quest3_Location = "商人扎雷姆（沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE.."）"
Inst37Quest3_Note = "这个日常任务只能在英雄难度副本完成。纳杉在"..YELLOW.."[3]"..WHITE.."。"
Inst37Quest3_Prequest = "无"
Inst37Quest3_Folgequest = "无"
--
Inst37Quest3name1 = "公正徽章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst37Quest1_HORDE = Inst37Quest1
Inst37Quest1_HORDE_Level = Inst37Quest1_Level
Inst37Quest1_HORDE_Attain = Inst37Quest1_Attain
Inst37Quest1_HORDE_Aim = "杀死巡视者加戈玛、无疤者奥摩尔和座龙纳杉，并将加戈玛之手、奥摩尔之蹄和纳杉之颅交给地狱火半岛上的萨尔玛内的卡萨雷兹。"
Inst37Quest1_HORDE_Location = "石头守卫斯托克顿（地狱火半岛 - 萨尔玛; "..YELLOW.."55, 36"..WHITE.."）"
Inst37Quest1_HORDE_Note = "加戈玛在"..YELLOW.."[1]"..WHITE.."，奥摩尔在"..YELLOW.."[2]"..WHITE.."，纳杉在"..YELLOW.."[3]"..WHITE.."。卡萨雷兹在（地狱火半岛 - 萨尔玛; "..YELLOW.."55, 36"..WHITE.."）。要接到这个任务，你必须完成机甲残骸这个任务，从你在诅咒之地接到跨越黑暗之门的任务开始的一连串连续任务。"
Inst37Quest1_HORDE_Prequest = "有，跨越黑暗之门 -> 机甲残骸"
Inst37Quest1_HORDE_Folgequest = Inst37Quest1_Folgequest
Inst37Quest1PreQuest_HORDE = Inst37Quest1PreQuest
--
Inst37Quest1name1_HORDE = Inst37Quest1name1
Inst37Quest1name2_HORDE = Inst37Quest1name2
Inst37Quest1name3_HORDE = Inst37Quest1name3
Inst37Quest1name4_HORDE = Inst37Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst37Quest2_HORDE = Inst37Quest2
Inst37Quest2_HORDE_Level = Inst37Quest2_Level
Inst37Quest2_HORDE_Attain = Inst37Quest2_Attain
Inst37Quest2_HORDE_Aim = "将不祥的信件交给地狱火半岛上萨尔玛的纳兹格雷尔。"
Inst37Quest2_HORDE_Location = Inst37Quest2_Location
Inst37Quest2_HORDE_Note = "纳兹格雷尔在（地狱火半岛 - 萨尔玛; "..YELLOW.."55, 36"..WHITE.."）。"
Inst37Quest2_HORDE_Prequest = Inst37Quest2_Prequest
Inst37Quest2_HORDE_Folgequest = Inst37Quest2_Folgequest
Inst37Quest2FQuest_HORDE = Inst37Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst37Quest3_HORDE = Inst37Quest3
Inst37Quest3_HORDE_Level = Inst37Quest3_Level
Inst37Quest3_HORDE_Attain = Inst37Quest3_Attain
Inst37Quest3_HORDE_Aim = Inst37Quest3_Aim
Inst37Quest3_HORDE_Location = Inst37Quest3_Location
Inst37Quest3_HORDE_Note = Inst37Quest3_Note
Inst37Quest3_HORDE_Prequest = Inst37Quest3_Prequest
Inst37Quest3_HORDE_Folgequest = Inst37Quest3_Folgequest
--
Inst37Quest3name1_HORDE = Inst37Quest3name1



--------------- INST38 - HFC: Blood Furnace (BF) ---------------

Inst38Story = {
  ["Page1"] = "在满目疮痍的外域，地狱火半岛的中心矗立着地狱火堡垒。在第一次和第二次兽人战争中，它作为兽人的基地，是不可攻克的象征。多年来，人们以为这座巨大的堡垒已经被遗弃了……\n \n直到最近。\n \n虽然德拉诺大陆被耐奥祖不计后果的破坏了，但是在地狱火堡垒中仍然居住着劫掠成性的红色狂暴堕落兽人。虽然这个新出现的野蛮种族还带着不少谜团，更令人吃惊的是他们的数量还在不断增长。\n \n虽然萨尔和格罗姆地狱咆哮已经杀死了玛诺洛斯，终止了部落的堕落。但是有报告显示地狱火堡垒中的野蛮兽人找到了一种新的堕落之源来满足他们原始的嗜血欲望。",
  ["Page2"] = "这些兽人的领袖是谁暂时无人可知，但是可以充分相信他们不是为燃烧军团工作。\n \n也许外域传来的最令人不安的消息就是从堡垒地下深处传来的雷霆一样的野蛮怒吼。许多人开始猜想这些怪异的吼叫是否同堕落兽人以及他们不断增长的数量有关。不幸的是，这些问题都没有答案。\n \n至少现在如此。",
  ["MaxPages"] = "2",
};
Inst38Caption = "地狱火堡垒：鲜血熔炉"
Inst38QAA = "3 个任务"
Inst38QAH = "3 个任务"
Inst38General = {
    {
    "制造者",
    "很简单的 Boss，坦克拉住然后杀了就可以了。",
    RED .. "击退" .. WHITE .. "：近距离击退攻击，打击所有近战范围内的玩家，（似乎有仇恨减少的效果）。\n" .. RED .. "精神控制" .. WHITE .. "：控制一个玩家并且能提高被控制玩家的伤害。",
    },

    {
    "布洛戈克",
    "比较难的战斗，当你打开屋子里的摇杆时就触发了战斗。Boss 前会依次出现4波四周监牢里的被关押兽人，而且一波比一波厉害。而且中间你不能停止战斗，所以可以最后留一个怪一直变羊（或心灵控制）来让大家缓慢恢复。",
   RED .. "4波怪" .. WHITE .. "：第一波是4个普通的怪，二波是3个普通怪一个精英怪，三波是各2个，最后是1个普通3个精英。\n" .. RED .. "毒性之箭" .. WHITE .. "：对所有他面前的玩家喷射毒箭。\n" .. RED .. "毒性之云" .. WHITE .. "：向一个玩家投掷一个毒性炸弹，造成少量伤害，但是对炸弹四周的玩家造成每秒650的伤害，一定要躲开。",
    },

    {
    "击碎者克里丹",
    "最后一个 Boss 但是并不是很难。战斗会在你攻击他周围的怪之后开始，当全部5个怪消灭之后就会开始与 Boss 的战斗。",
   RED .. "周围小怪" .. WHITE .. "：它们会释放一个是你受到暗影伤害提高1000点的魔法，一定要及时解除。\n" .. RED .. "群体暗影箭" .. WHITE .. "：群体暗影箭，没有诅咒的情况下造成并不是很高的伤害。\n" .. RED .. "爆炸" .. WHITE .. "：每过几秒 Boss 会喊 '靠近点！'和停止攻击。2至5秒后（不确定）会发生爆炸，对周围玩家造成4000多的火焰伤害。如果看见喊话就跑远点吧。",
    },
};

--Quest 1 Alliance
Inst38Quest1 = "1. 鲜血就是生命"
Inst38Quest1_Level = "63"
Inst38Quest1_Attain = "59"
Inst38Quest1_Aim = "收集10份邪兽人血样，把它们交给地狱火半岛上的荣耀堡内的冈尼。"
Inst38Quest1_Location = "冈尼（地狱火半岛 - 荣誉堡; "..YELLOW.."56, 67"..WHITE.."）"
Inst38Quest1_Note = "鲜血熔炉里兽人怪都可能掉落。"
Inst38Quest1_Prequest = "有，黑暗之潮"
Inst38Quest1_Folgequest = "无"
Inst38Quest1PreQuest = "true"
--
Inst38Quest1name1 = "惩戒胸甲"
Inst38Quest1name2 = "致命钻孔虫护腿"
Inst38Quest1name3 = "枭兽头饰"
Inst38Quest1name4 = "缀鳞毁灭护腿"

--Quest 2 Alliance
Inst38Quest2 = "2. 愤怒之心"
Inst38Quest2_Level = "63"
Inst38Quest2_Attain = "59"
Inst38Quest2_Aim = "全面调查鲜血熔炉，然后向地狱火半岛上的荣耀堡内的远征军指挥官达纳斯·托尔贝恩汇报。"
Inst38Quest2_Location = "冈尼（地狱火半岛 - 荣誉堡; "..YELLOW.."56, 67"..WHITE.."）。"
Inst38Quest2_Note = "走到最终 Boss 房间即可完成任务。远征军指挥官达纳斯·托尔贝恩在（地狱火半岛 - 荣耀堡; "..YELLOW.."57, 67"..WHITE.."）。"
Inst38Quest2_Prequest = "有，削弱城墙"
Inst38Quest2_Folgequest = "无"
Inst38Quest2PreQuest = "true"
--
Inst38Quest2name1 = "清澈火红坠饰"
Inst38Quest2name2 = "神圣治疗指环"
Inst38Quest2name3 = "完美平衡斗篷"

--Quest 3 Alliance
Inst38Quest3 = "3. 悬赏：克里丹的羽饰法杖 (英雄日常)"
Inst38Quest3_Level = "70"
Inst38Quest3_Attain = "70"
Inst38Quest3_Aim = "商人扎雷姆要求你夺得克里丹的羽饰法杖。将法杖带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst38Quest3_Location = "商人扎雷姆（沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE.."）"
Inst38Quest3_Note = "这个日常任务只能在英雄难度副本完成。击碎者克里丹在 "..YELLOW.."[3]"..WHITE.."。"
Inst38Quest3_Prequest = "无"
Inst38Quest3_Folgequest = "无"
--
Inst38Quest3name1 = "公正徽章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst38Quest1_HORDE = Inst38Quest1
Inst38Quest1_HORDE_Level = Inst38Quest1_Level
Inst38Quest1_HORDE_Attain = Inst38Quest1_Attain
Inst38Quest1_HORDE_Aim = "收集10份邪兽人血样，把它们交给地狱火半岛上的萨尔玛内的卡萨雷兹。"
Inst38Quest1_HORDE_Location = "卡萨雷兹（地狱火半岛 - 萨尔玛; "..YELLOW.."55, 36"..WHITE.."）"
Inst38Quest1_HORDE_Note = Inst38Quest1_Note
Inst38Quest1_HORDE_Prequest = Inst38Quest1_Prequest
Inst38Quest1_HORDE_Folgequest = Inst38Quest1_Folgequest
Inst38Quest1PreQuest_HORDE = Inst38Quest1PreQuest
--
Inst38Quest1name1_HORDE = Inst38Quest1name1
Inst38Quest1name2_HORDE = Inst38Quest1name2
Inst38Quest1name3_HORDE = Inst38Quest1name3
Inst38Quest1name4_HORDE = Inst38Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst38Quest2_HORDE = Inst38Quest2
Inst38Quest2_HORDE_Level = Inst38Quest2_Level
Inst38Quest2_HORDE_Attain = Inst38Quest2_Attain
Inst38Quest2_HORDE_Aim = "全面调查鲜血熔炉，然后向地狱火半岛上的萨尔玛内的纳兹格雷尔汇报。"
Inst38Quest2_HORDE_Location = "卡萨雷兹（地狱火半岛 - 萨尔玛; "..YELLOW.."55,36"..WHITE.."）"
Inst38Quest2_HORDE_Note = "走到最终 Boss 房间即可完成任务。纳兹格雷尔在（地狱火半岛 - 萨尔玛; "..YELLOW.."55,36"..WHITE.."）。"
Inst38Quest2_HORDE_Prequest = Inst38Quest2_Prequest
Inst38Quest2_HORDE_Folgequest = Inst38Quest2_Folgequest
Inst38Quest2PreQuest_HORDE = Inst38Quest2PreQuest
--
Inst38Quest2name1_HORDE = Inst38Quest2name1
Inst38Quest2name2_HORDE = Inst38Quest2name2
Inst38Quest2name3_HORDE = Inst38Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst38Quest3_HORDE = Inst38Quest3
Inst38Quest3_HORDE_Level = Inst38Quest3_Level
Inst38Quest3_HORDE_Attain = Inst38Quest3_Attain
Inst38Quest3_HORDE_Aim = Inst38Quest3_Aim
Inst38Quest3_HORDE_Location = Inst38Quest3_Location
Inst38Quest3_HORDE_Note = Inst38Quest3_Note
Inst38Quest3_HORDE_Prequest = Inst38Quest3_Prequest
Inst38Quest3_HORDE_Folgequest = Inst38Quest3_Folgequest
--
Inst38Quest3name1_HORDE = Inst38Quest3name1



--------------- INST39 - HFC: Shattered Halls (SH) ---------------

Inst39Story = {
  ["Page1"] = "在满目疮痍的外域，地狱火半岛的中心矗立着地狱火堡垒。在第一次和第二次兽人战争中，它作为兽人的基地，是不可攻克的象征。多年来，人们以为这座巨大的堡垒已经被遗弃了……\n \n直到最近。\n \n虽然德拉诺大陆被耐奥祖不计后果的破坏了，但是在地狱火堡垒中仍然居住着劫掠成性的红色狂暴堕落兽人。虽然这个新出现的野蛮种族还带着不少谜团，更令人吃惊的是他们的数量还在不断增长。\n \n虽然萨尔和格罗姆地狱咆哮已经杀死了玛诺洛斯，终止了部落的堕落。但是有报告显示地狱火堡垒中的野蛮兽人找到了一种新的堕落之源来满足他们原始的嗜血欲望。",
  ["Page2"] = "这些兽人的领袖是谁暂时无人可知，但是可以充分相信他们不是为燃烧军团工作。\n \n也许外域传来的最令人不安的消息就是从堡垒地下深处传来的雷霆一样的野蛮怒吼。许多人开始猜想这些怪异的吼叫是否同堕落兽人以及他们不断增长的数量有关。不幸的是，这些问题都没有答案。\n \n至少现在如此。",
  ["MaxPages"] = "2",
};
Inst39Caption = "地狱火堡垒：破碎大厅"
Inst39QAA = "10 个任务"
Inst39QAH = "9 个任务"
Inst39General = {
    {
    "高阶术士奈瑟库斯",
    "当你靠近高阶术士奈瑟库斯时，他前面有3个恶魔守卫保护着他。在第3个恶魔守卫被消灭之后（击杀次序无关紧要），奈瑟库斯会出来攻击队伍。 在整个战斗中，奈瑟库斯都会施放虚空空间，在施放后1秒内对站在上面的玩家造成每秒1000点暗影伤害。包括坦克在内的所有玩家都需要及时跑出./n　他还会对随机玩家施放死亡缠绕，造成2000点暗影伤害并且恐惧玩家4秒，治疗他自己大约2000点生命值。/n　在20%生命时，奈瑟库斯会施放黑暗螺旋技能，对接近他的任何人造成2000点物理伤害，并且以很快的频率溅射暗影箭，暗影箭会造成1500点暗影伤害。最好尽快消耗他剩余的生命值以减少己方伤亡甚至灭团。",
    RED .. "黑暗螺旋" .. WHITE .. "在20%生命的时候，奈瑟库斯会使用他的黑暗螺旋技能。他将攻击任何接近他的人，造成2000点物理伤害，并且飞快的对随机目标溅射出暗影箭。 暗影箭会造成1500暗影伤害。\n" .. RED .. "死亡缠绕" .. WHITE .. ": 他会向随机目标施放死亡缠绕，造成2000点暗影伤害，恐惧目标4秒，并且治疗奈瑟库斯（估计2000HP）。\n" .. RED .. "次级暗影裂隙" .. WHITE .. ": 召唤一片虚空空间，对站立在其中的玩家造成每秒1000暗影伤害。",
    },

    {
    "战争使者沃姆罗格",
    "坦克战争使者沃姆罗格的玩家应该站在房间的中间，让大家有空间来移动躲避他的冲击波和AoE恐惧（只有猎人靠他们超过40码的射程可以躲避AoE恐惧）。他有一个致命的技能就是连续2次的冲击波，造成6000伤害。近战职业在看到boss的武器开始燃烧之后应该迅速移动远离boss以避免冲击波伤害，只有坦克一个人可以承受伤害。治疗者应该在boss施放冲击波之前保持坦克血量为满。",
   RED .. "恐惧:" .. WHITE .. " 影响身边所有玩家的恐惧怒吼.\n" .. RED .. "毒性之箭:" .. WHITE .. " 对所有他面前的玩家喷射毒箭.\n" .. RED .. "燃烧武器/冲击波:" .. WHITE .. " 当战争使者沃姆罗格的武器开始燃烧时，他对近战目标造成1000火焰伤害。然后他会连续施放2次冲击波（每次造成2500 - 3200伤害）。/n" .. RED .. "" .. WHITE .. ": ",
    },

    {
    "酋长卡加斯·刃拳",
    "刃拳是一个比较简单的战斗，但是至少还有这么几个要点需要注意：他攻击板甲的伤害约为700，属于比较弱小的；他不会法术攻击，所以魔法增效会起到不小的效果；每几秒钟他会召唤一个非精英守卫从大厅北面跑过来，出现的怪物种类是随机的，但是生命值都很低，很快就可以杀死。每35秒卡加斯会进行刀锋之舞，以高速在不同目标之间进行冲锋，造成1000点顺劈伤害和轻微AoE效果。为了击败他你可以杀死增援，或者无视增援直接DPS掉boss。很重要的一点是队员站位需要分散，离开大厅的中间，不然刀锋之舞会相当危险。他生命值很高，但是整场战斗并不难。",
   RED .. "召唤援助:" .. WHITE .. "蛮兵、收割者和神射手护卫将从北面出现帮助boss.\n" .. RED .. "刀锋之舞:" .. WHITE .. " 这是他的必杀技，每35秒卡加斯会进行一次刀锋之舞，在随机目标之间进行冲锋，造成1000点顺劈伤害和一点点AoE伤害.",
    },
};


--Quest 1 Alliance
Inst39Quest1 = "1. 邪能灰烬"
Inst39Quest1_Level = "70"
Inst39Quest1_Attain = "67"
Inst39Quest1_Aim = "荣耀堡的大法师萨布兰希要求你给她带回一块邪能灰烬。"
Inst39Quest1_Location = "大法师萨布兰希 (地狱火半岛--荣誉堡; "..YELLOW.."54, 66"..WHITE..")"
Inst39Quest1_Note = "杀死高阶术士奈瑟库斯后,它会掉落一个护符. 在它座位边上的火盆上使用即可得到邪能灰烬."
Inst39Quest1_Prequest = "无"
Inst39Quest1_Folgequest = "无"
--
Inst39Quest1name1 = "助理牧师长靴"
Inst39Quest1name2 = "符文蚀刻腰带"
Inst39Quest1name3 = "维护手套"
Inst39Quest1name4 = " 远征军斥候护肩 "
Inst39Quest1name5 = "无惧护手"

--Quest 2 Alliance
Inst39Quest2 = "2. 邪部落的荣耀"
Inst39Quest2_Level = "70"
Inst39Quest2_Attain = "66"
Inst39Quest2_Aim = "荣耀堡的战地指挥官洛姆斯要求你杀死8名碎手军团士兵、4名碎手百夫长和4名碎手勇士。"
Inst39Quest2_Location = "战地指挥官洛姆斯 (地狱火半岛--荣誉堡; "..YELLOW.."57, 63"..WHITE..")"
Inst39Quest2_Note = "破碎大厅里就是这些怪"
Inst39Quest2_Prequest = "无"
Inst39Quest2_Folgequest = "无"
-- No Rewards for this quest

--Quest 3 Alliance
Inst39Quest3 = "3. 扭转战局"
Inst39Quest3_Level = "70"
Inst39Quest3_Attain = "67"
Inst39Quest3_Aim = "将卡加斯酋长之拳交给荣耀堡的远征军指挥官达纳斯·托尔贝恩。"
Inst39Quest3_Location = "远征军指挥官达纳斯·托尔贝恩 (地狱火半岛--荣誉堡; "..YELLOW.."57, 67"..WHITE..")"
Inst39Quest3_Note = "卡加斯酋长 就在"..YELLOW.."[4]"..WHITE.."."
Inst39Quest3_Prequest = "无"
Inst39Quest3_Folgequest = "无"
--
Inst39Quest3name1 = "奈瑟库斯的痛苦魔杖"
Inst39Quest3name2 = "苏醒披风"
Inst39Quest3name3 = "纳利库的复仇"
Inst39Quest3name4 = "警醒卫士勋章"

--Quest 4 Alliance
Inst39Quest4 = "4. 堡垒的禁锢（英雄模式）"
Inst39Quest4_Level = "70"
Inst39Quest4_Attain = "70"
Inst39Quest4_Aim = "在艾琳娜上尉被处死之前解救她."
Inst39Quest4_Location = "兰帝·韦兹普特 (破碎大厅; "..YELLOW.."英雄模式"..WHITE..")"
Inst39Quest4_Note = "需要英雄难度副本."
Inst39Quest4_Prequest = "无"
Inst39Quest4_Folgequest = "无"
-- No Rewards for this quest

--Quest 5 Alliance
Inst39Quest5 = "5.  纳鲁的试炼：仁慈（英雄模式）"
Inst39Quest5_Level = "70"
Inst39Quest5_Attain = "70"
Inst39Quest5_Aim = "沙塔斯城的阿达尔要求你从地狱火堡垒的破碎大厅中取回未使用的刽子手之斧。\n\n该任务必须在英雄等级难度的地下城中完成。"
Inst39Quest5_Location = "阿达尔 (沙塔斯城; "..YELLOW.."53, 43"..WHITE..")"
Inst39Quest5_Note = "需要英雄难度."
Inst39Quest5_Prequest = "无"
Inst39Quest5_Folgequest = "无"
-- No Rewards for this quest

--Quest 6 Alliance
Inst39Quest6 = "6. 大地之母眼泪"
Inst39Quest6_Level = "70"
Inst39Quest6_Attain = "70"
Inst39Quest6_Aim = " 从战争使者沃姆罗格夺回大地之母的眼泪，把它交给维恩避难所的 戴维·韦恩"
Inst39Quest6_Location = "戴维·韦恩(泰罗卡森林; "..YELLOW.."78,39"..WHITE..")."
Inst39Quest6_Note = "战争使者沃姆罗格在 "..YELLOW.."3"..WHITE.."."
Inst39Quest6_Prequest = "有，能源舰的热源 (能量舰) & 魔语辞典 (暗影迷宫)"
Inst39Quest6_Folgequest = "有，伊利达雷的克星"
Inst39Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst39Quest7 = "7. 卡琳娜的要求 (英雄模式)"
Inst39Quest7_Level = "70"
Inst39Quest7_Attain = "70"
Inst39Quest7_Aim = "从地狱火堡垒破碎大厅的高阶术士奈瑟库斯手中夺得暮色魔典，从奥金顿塞泰克大厅的黑暗编织者塞斯手中夺得忘却之名，将它们交给卡琳娜·拉瑟德."
Inst39Quest7_Location = "卡琳娜·拉瑟德 (虚空风暴 - 52区; "..YELLOW.."32,63"..WHITE..")"
Inst39Quest7_Note = "需要英雄模式副本."
Inst39Quest7_Prequest = "有，同事的帮助 ("..YELLOW.."卡拉赞"..WHITE..")"
Inst39Quest7_Folgequest = "有，夜之魇 ("..YELLOW.."卡拉赞"..WHITE..")"
Inst39Quest7PreQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst39Quest8 = "8.  悬赏：刃拳的印记(英雄日常)"
Inst39Quest8_Level = "70"
Inst39Quest8_Attain = "70"
Inst39Quest8_Aim = "商人扎雷姆要求你夺得刃拳的印记。将印记带回沙塔斯城的贫民窟交给他，就能领取奖赏。."
Inst39Quest8_Location = "商人扎雷姆 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst39Quest8_Note = "卡加斯·刃拳 在"..YELLOW.."[5]"..WHITE.."."
Inst39Quest8_Prequest = "无"
Inst39Quest8_Folgequest = "无"
--
Inst39Quest8name1 = "公正徽章"

--Quest 9 Alliance
Inst39Quest9 = "9. 悬赏：碎手百夫长 (普通日常)"
Inst39Quest9_Level = "70"
Inst39Quest9_Attain = "70"
Inst39Quest9_Aim = "虚空猎手玛哈杜恩要求你杀死4名碎手百夫长。完成任务后返回沙塔斯城的贫民窟，找他领取奖赏."
Inst39Quest9_Location = "虚空猎手玛哈杜恩 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst39Quest9_Note = "普通日常任务."
Inst39Quest9_Prequest = "无"
Inst39Quest9_Folgequest = "无"
--
Inst39Quest9name1 = "Ethereum Prison Key"

--Quest 10 Alliance
Inst39Quest10 = "10. Entry Into the Citadel"
Inst39Quest10_Level = "70"
Inst39Quest10_Attain = "68"
Inst39Quest10_Aim = "Bring the Primed Key Mold to Force Commander Danath at Honor Hold in Hellfire Peninsula."
Inst39Quest10_Location = "Primed Key Mold  (drops from Smith Gorlunk in Shadowmoon Valley - Ata'mal Terrace; "..YELLOW.."68,36"..WHITE..")"
Inst39Quest10_Note = "The Smith that drops the Primed Key Mold is easily soloable and very easily reachable with a flying mount.\n\nForce Commander Danath is at (Hellfire Peninsula - Honor Hold; "..YELLOW.."57,67"..WHITE.."). He sends you to Grand Master Dumphry for the next part of the quest at (Hellfire Peninsula - Honor Hold; "..YELLOW.."51,60"..WHITE..")..."
Inst39Quest10_Page = {2, "Grand Master Dumphry will ask for 4 x [Fel Iron Bar], 2 x [Arcane Dust] and 4 x [Mote of Fire].\n\nAfter turning the materials in you need to use the Charred Key Mold he gives you at the corpse of a Fel Reaver. You do not need to kill the Fel Reaver yourself, just use the mold at it.\n\nReturn to Grand Master Dumphry at (Hellfire Peninsula - Honor Hold; "..YELLOW.."51,60"..WHITE..") for your reward.", };
Inst39Quest10_Prequest = "No"
Inst39Quest10_Folgequest = "Yes, Grand Master Dumphry -> Hotter than Hell"
--
Inst39Quest10name1 = "Shattered Halls Key"


--Quest 1 Horde  (same as Quest 2 Alliance)
Inst39Quest1_HORDE = "1. 邪部落的荣耀"
Inst39Quest1_HORDE_Level = Inst39Quest2_Level
Inst39Quest1_HORDE_Attain = Inst39Quest2_Attain
Inst39Quest1_HORDE_Aim = "萨尔玛的暗影猎手塔金要求你杀死8名碎手军团士兵、4名碎手百夫长和4名碎手勇士。"
Inst39Quest1_HORDE_Location = "暗影猎手塔金(地狱火半岛 - 萨尔玛; "..YELLOW.."55, 36"..WHITE..")"
Inst39Quest1_HORDE_Note = Inst39Quest2_Note
Inst39Quest1_HORDE_Prequest = Inst39Quest2_Prequest
Inst39Quest1_HORDE_Folgequest = Inst39Quest2_Folgequest
-- No Rewards for this quest

--Quest 2 Horde
Inst39Quest2_HORDE = "2. 酋长的意志"
Inst39Quest2_HORDE_Level = "70"
Inst39Quest2_HORDE_Attain = "67"
Inst39Quest2_HORDE_Aim = "将卡加斯酋长之拳交给萨尔玛的纳兹格雷尔。"
Inst39Quest2_HORDE_Location = "纳兹格雷尔 (地狱火半岛 - 萨尔玛; "..YELLOW.."55, 36"..WHITE..")"
Inst39Quest2_HORDE_Note = "卡加斯酋长就在 "..YELLOW.."[4]"..WHITE.."."
Inst39Quest2_HORDE_Prequest = "无"
Inst39Quest2_HORDE_Folgequest = "无"
--
Inst39Quest2name1_HORDE = "Rod of Dire Shadows"
Inst39Quest2name2_HORDE = "Vicar's Cloak"
Inst39Quest2name3_HORDE = "Conquerer's Band"
Inst39Quest2name4_HORDE = "Maimfist's Choker"

--Quest 3 Horde
Inst39Quest3_HORDE = "3. 堡垒的禁锢(英雄模式)"
Inst39Quest3_HORDE_Level = "70"
Inst39Quest3_HORDE_Attain = "70"
Inst39Quest3_HORDE_Aim = "在碎骨队长被处决前解救他"
Inst39Quest3_HORDE_Location = "崔塞拉 (破碎大厅; "..YELLOW.."英雄模式"..WHITE..")"
Inst39Quest3_HORDE_Note = "需要英雄难度副本."
Inst39Quest3_HORDE_Prequest = "无"
Inst39Quest3_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 5 Alliance)
Inst39Quest4_HORDE = "4. 纳鲁的试炼：仁慈 (英雄模式)"
Inst39Quest4_HORDE_Level = Inst39Quest5_Level
Inst39Quest4_HORDE_Attain = Inst39Quest5_Attain
Inst39Quest4_HORDE_Aim = Inst39Quest5_Aim
Inst39Quest4_HORDE_Location = Inst39Quest5_Location
Inst39Quest4_HORDE_Note = Inst39Quest5_Note
Inst39Quest4_HORDE_Prequest = Inst39Quest5_Prequest
Inst39Quest4_HORDE_Folgequest = Inst39Quest5_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 6 Alliance)
Inst39Quest5_HORDE = "5. 大地之母的眼泪"
Inst39Quest5_HORDE_Level = Inst39Quest6_Level
Inst39Quest5_HORDE_Attain = Inst39Quest6_Attain
Inst39Quest5_HORDE_Aim = Inst39Quest6_Aim
Inst39Quest5_HORDE_Location = Inst39Quest6_Location
Inst39Quest5_HORDE_Note = Inst39Quest6_Note
Inst39Quest5_HORDE_Prequest = Inst39Quest6_Prequest
Inst39Quest5_HORDE_Folgequest = Inst39Quest6_Folgequest
Inst39Quest5PreQuest_HORDE = Inst39Quest6Prequest
-- No Rewards for this quest

--Quest 6 Alliance  (same as Quest 7 Alliance)
Inst39Quest6_HORDE = "6. 卡琳娜的要求 (英雄模式)"
Inst39Quest6_HORDE_Level = Inst39Quest7_Level
Inst39Quest6_HORDE_Attain = Inst39Quest7_Attain
Inst39Quest6_HORDE_Aim = Inst39Quest7_Aim
Inst39Quest6_HORDE_Location = Inst39Quest7_Location
Inst39Quest6_HORDE_Note = Inst39Quest7_Note
Inst39Quest6_HORDE_Prequest = Inst39Quest7_Prequest
Inst39Quest6_HORDE_Folgequest = Inst39Quest7_Folgequest
Inst39Quest6PreQuest_HORDE = Inst39Quest7PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 8 Alliance)
Inst39Quest7_HORDE = "7.  悬赏：刃拳的印记 (英雄日常)"
Inst39Quest7_HORDE_Level = Inst39Quest8_Level
Inst39Quest7_HORDE_Attain = Inst39Quest8_Attain
Inst39Quest7_HORDE_Aim = Inst39Quest8_Aim
Inst39Quest7_HORDE_Location = Inst39Quest8_Location
Inst39Quest7_HORDE_Note = Inst39Quest8_Note
Inst39Quest7_HORDE_Prequest = Inst39Quest8_Prequest
Inst39Quest7_HORDE_Folgequest = Inst39Quest8_Folgequest
--
Inst39Quest7name1_HORDE = Inst39Quest8name1

--Quest 8 Horde  (same as Quest 9 Alliance)
Inst39Quest8_HORDE = "8. 悬赏：碎手百夫长  (普通日常)"
Inst39Quest8_HORDE_Level = Inst39Quest9_Level
Inst39Quest8_HORDE_Attain = Inst39Quest9_Attain
Inst39Quest8_HORDE_Aim = Inst39Quest9_Aim
Inst39Quest8_HORDE_Location = Inst39Quest9_Location
Inst39Quest8_HORDE_Note = Inst39Quest9_Note
Inst39Quest8_HORDE_Prequest = Inst39Quest9_Prequest
Inst39Quest8_HORDE_Folgequest = Inst39Quest9_Folgequest
--
Inst39Quest8name1_HORDE = Inst39Quest9name1

--Quest 9 Horde
Inst39Quest9_HORDE = "9. Entry Into the Citadel"
Inst39Quest9_HORDE_Level = "70"
Inst39Quest9_HORDE_Attain = "68"
Inst39Quest9_HORDE_Aim = "Bring the Primed Key Mold to Nazgrel at Thrallmar in Hellfire Peninsula."
Inst39Quest9_HORDE_Location = "Primed Key Mold  (drops from Smith Gorlunk in Shadowmoon Valley - Ata'mal Terrace; "..YELLOW.."68,36"..WHITE..")"
Inst39Quest9_HORDE_Note = "The Smith that drops the Primed Key Mold is easily soloable and very easily reachable with a flying mount.\n\nNazgrel is at (Hellfire Peninsula - Thrallmar; "..YELLOW.."55,36"..WHITE.."). He sends you to Grand Master Rohok for the next part of the quest at (Hellfire Peninsula - Thrallmar; "..YELLOW.."53,38"..WHITE..")..."
Inst39Quest9_HORDE_Page = {2, "Grand Master Rohok will ask for 4 x [Fel Iron Bar], 2 x [Arcane Dust] and 4 x [Mote of Fire].\n\nAfter turning the materials in you need to use the Charred Key Mold he gives you at the corpse of a Fel Reaver. You do not need to kill the Fel Reaver yourself, just use the mold at it.\n\nReturn to Grand Master Rohok at (Hellfire Peninsula - Thrallmar; "..YELLOW.."53,38"..WHITE..") for your reward.", };
Inst39Quest9_HORDE_Prequest = "No"
Inst39Quest9_HORDE_Folgequest = "Yes, Grand Master Rohok -> Hotter than Hell"
--
Inst39Quest9name1_HORDE = "Shattered Halls Key"



--------------- INST40 - HFC: Magtheridon's Lair ---------------

Inst40Story = {
  ["Page1"] = "在满目疮痍的外域，地狱火半岛的中心矗立着地狱火堡垒。在第一次和第二次兽人战争中，它作为兽人的基地，是不可攻克的象征。多年来，人们以为这座巨大的堡垒已经被遗弃了\n \直到最近\n \n虽然德拉诺大陆被耐奥祖不计后果的破坏了，但是在地狱火堡垒中仍然居住着劫掠成性的红色狂暴堕落兽人。虽然这个新出现的野蛮种族还带着不少谜团，更令人吃惊的是他们的数量还在不断增长。\n \n虽然萨尔和格罗姆地狱咆哮已经杀死了玛诺洛斯，终止了部落的堕落。但是有报告显示地狱火堡垒中的野蛮兽人找到了一种新的堕落之源来满足他们原始的嗜血欲望。",
  ["Page2"] = "这些兽人的领袖是谁暂时无人可知，但是可以充分相信他们不是为燃烧军团工作。\n \n也许外域传来的最令人不安的消息就是从堡垒地下深处传来的雷霆一样的野蛮怒吼。许多人开始猜想这些怪异的吼叫是否同堕落兽人以及他们不断增长的数量有关。不幸的是，这些问题都没有答案。\n \n至少现在如此",
  ["MaxPages"] = "2",
};
Inst40Caption = "地狱火堡垒：玛瑟里顿的巢穴"
Inst40QAA = "1 个任务"
Inst40QAH = "1 个任务"

--Quest 1 Alliance
Inst40Quest1 = "1. 纳鲁的试炼：玛瑟里顿的巢穴"
Inst40Quest1_Level = "70"
Inst40Quest1_Attain = "70"
Inst40Quest1_Aim = "沙塔斯城的阿达尔要你杀死玛瑟里顿"
Inst40Quest1_Location = "阿达尔 (沙塔斯城; "..YELLOW.."53, 43"..WHITE..")"
Inst40Quest1_Note = "必须完成纳鲁的试炼--仁慈，力量，坚韧."
Inst40Quest1_Prequest = "有, 纳鲁的试炼--仁慈，力量，坚韧."
Inst40Quest1_Folgequest = "无"
Inst40Quest1PreQuest = "true"
--
Inst40Quest1name1 = "凤凰之火指环"

--Quest 2 Alliance
Inst40Quest2 = "2. 玛瑟里顿之死"
Inst40Quest2_Level = "70"
Inst40Quest2_Attain = "70"
Inst40Quest2_Aim = "将玛瑟里顿的头颅交给荣耀堡的远征军指挥官达纳斯·托尔贝恩."
Inst40Quest2_Location = "玛瑟里顿的头颅(玛瑟里顿掉落; "..YELLOW.."[1]"..WHITE..")"
Inst40Quest2_Note = "团队中只有一个人能够得到头颅来触发这个任务. 远征军指挥官达纳斯·托尔贝恩 在 （地狱火半岛 - 荣耀堡） "..YELLOW.."57,67"..WHITE.."."
Inst40Quest2_Prequest = "No."
Inst40Quest2_Folgequest = "No"
--
Inst40Quest2name1 = "阿达尔的防御徽记"
Inst40Quest2name2 = "阿达尔的防御徽记"
Inst40Quest2name3 = "纳鲁圣光卫士指环"
Inst40Quest2name4 = "反抗之戒"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst40Quest1_HORDE = Inst40Quest1
Inst40Quest1_HORDE_Level = Inst40Quest1_Level
Inst40Quest1_HORDE_Attain = Inst40Quest1_Attain
Inst40Quest1_HORDE_Aim = Inst40Quest1_Aim
Inst40Quest1_HORDE_Location = Inst40Quest1_Location
Inst40Quest1_HORDE_Note = Inst40Quest1_Note
Inst40Quest1_HORDE_Prequest = Inst40Quest1_Prequest
Inst40Quest1_HORDE_Folgequest = Inst40Quest1_Folgequest
Inst40Quest1PreQuest_HORDE = Inst40Quest1PreQuest
--
Inst40Quest1name1_HORDE = Inst40Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst40Quest2_HORDE = Inst40Quest2
Inst40Quest2_HORDE_Level = Inst40Quest2_Level
Inst40Quest2_HORDE_Attain = Inst40Quest2_Attain
Inst40Quest2_HORDE_Aim = "将玛瑟里顿的头颅交给萨尔玛的纳兹格雷尔。"
Inst40Quest2_HORDE_Location = Inst40Quest2_Location
Inst40Quest2_HORDE_Note = "团队中只有一个人能够得到头颅来触发这个任务. 纳兹格雷尔 在（地狱火半岛 - 萨尔玛） "..YELLOW.."55,36"..WHITE.."."
Inst40Quest2_HORDE_Prequest = Inst40Quest2_Prequest
Inst40Quest2_HORDE_Folgequest = Inst40Quest2_Folgequest
--
Inst40Quest2name1_HORDE = Inst40Quest2name1
Inst40Quest2name2_HORDE = Inst40Quest2name2
Inst40Quest2name3_HORDE = Inst40Quest2name3
Inst40Quest2name4_HORDE = Inst40Quest2name4



--------------- INST41 - CR: The Slave Pens (SP) ---------------

Inst41Story = "赞加沼泽微妙的生态平衡已经被破坏了。\n\n非自然的现象正在腐蚀和破坏沼泽原生的动植物。\n\n骚乱的源头来自于给人不安预感的盘牙水库。\n\n传闻这一神秘建筑物的所有人不是别人，正是臭名昭著的瓦斯琪女士。\n\n在一切变得太迟之前，只有你能够揭发她的恶毒计划并阻止她和她的手下！\n\n盘牙水库分为4个部分，3个5人副本（奴隶围栏，幽暗沼泽，蒸汽地窟）和一个25人团队副本（毒蛇神殿） "
Inst41Caption = "盘牙水库：奴隶围栏"
Inst41QAA = "2 个任务"
Inst41QAH = "2 个任务"
Inst41General = {
    {
    "背叛者门努",
    "背叛者门努是你会遇到的第一个boss。他在一条被其他小怪包围着的斜坡上巡逻。他是一个萨满类型的boss（就象妖术师金度），他会使用近身攻击，并且安插图腾（dps，火焰新星和治疗图腾）。一定要指定你的一个队员尽快消灭图腾（特别是治疗图腾，因为它的治疗速度还是非常快的）。整场战斗还是比较简单直接的。",
    RED .. "图腾:" .. WHITE .. "他会插4种图腾，当然，治疗图腾是最重要的，应即使打掉.\n\n" .. BLUE .. "英雄难度要点：腐化新星图腾无论是被打掉还是3秒之后爆炸都会造成6000左右伤害，故千万不要打腐化新星图腾，不断变换位置tank BOSS是最好的办法。",
    },

    {
    "巨钳鲁克玛尔",
    "碎裂者鲁克玛尔是这一分支的第二个boss。他长得就像一只巨大的龙虾/螃蟹。他会对坦克进行近身攻击，并使用2种技能",
   RED .. "重伤:" .. WHITE .. " 每2秒对目标造成850 - 1000点伤害，持续直到目标被完全治愈。（状态的描述是：在目标被完全治愈之前，使目标大量失血的恐怖攻击。每2秒造成1096 - 1304点伤害直到治愈）.\n" .. RED .. "冰霜箭:" .. WHITE .. " 一种与寒冰箭类似的攻击，对随机目标释放，造成伤害并且将目标减速.\n" .. BLUE .. "英雄难度要点：boss的群体寒冰箭是有射程的，治疗和猎人站在最远位置可以不被寒冰箭打到。",
    },

    {
    "夸格米拉",
    "夸格米拉是奴隶围栏中第三个也是最后一个boss。他是一个孢子巨人类型的boss。战斗是比较简单的坦克战，注意在boss前边的那个远征军的NPC一定要确保不死，能从NPC那里得到一个110自然抗的buff，boss战会容易很多",
   RED .. "毒箭攻击:" .. WHITE .. " 造成2500 - 2600的直接伤害和一个每一跳800点伤害的dot效果，可以驱散或者治疗补充血. \n" .. RED .. "毒液喷吐" .. WHITE .. " 对其前面大约90°的范围喷射毒液，这时MT最好将其拉的背离人群.",
    },
};

--Quest 1 Alliance
Inst41Quest1 = "1. 失踪的同伴"
Inst41Quest1_Level = "65"
Inst41Quest1_Attain = "62"
Inst41Quest1_Aim = "查明缚地者雷葛、博学者拜特、除草者格林萨姆和唤风者克劳恩的下落，然后返回赞加沼泽的盘牙水库，向观察者杰哈恩复命。"
Inst41Quest1_Location = "观察者杰哈恩 (盘牙水库; "..YELLOW.."52, 36"..WHITE..")"
Inst41Quest1_Note = "博学者拜特在 "..YELLOW.."[4]"..WHITE..",除草者格林萨姆在 "..YELLOW.."[2]"..WHITE..", 这个任务还要去幽暗沼泽才能全部完成"
Inst41Quest1_Prequest = "无"
Inst41Quest1_Folgequest = "无"
Inst41Quest1PreQuest = "true"
--
Inst41Quest1name1 = "Cenarion Ring of Casting"
Inst41Quest1name2 = "Goldenvine Wraps"
Inst41Quest1name3 = "Dark Cloak of the Marsh"

--Quest 2 Alliance
Inst41Quest2 = "2. 悬赏：夸格米拉之心 (英雄日常)"
Inst41Quest2_Level = "70"
Inst41Quest2_Attain = "70"
Inst41Quest2_Aim = "商人扎雷姆要求你取回夸格米拉之心。将心脏带回沙塔斯城的贫民窟交给他，就能领取奖赏."
Inst41Quest2_Location = "商人扎雷姆 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst41Quest2_Note = "夸格米拉 在 "..YELLOW.."[6]"..WHITE.."."
Inst41Quest2_Prequest = "无"
Inst41Quest2_Folgequest = "无"
--
Inst41Quest2name1 = "公正徽章"

--Quest 3 Alliance
Inst41Quest3 = "3. 卡达什圣杖 (英雄模式)"
Inst41Quest3_Level = "70"
Inst41Quest3_Attain = "70"
Inst41Quest3_Aim = "将土灵徽记和灿烂徽记交给盘牙水库奴隶围栏的异教徒斯卡希斯."
Inst41Quest3_Location = "异教徒斯卡希斯 (奴隶围栏; "..YELLOW.."英雄模式 [4]"..WHITE..")"
Inst41Quest3_Note = "土灵徽记掉落自 格鲁尔  "..YELLOW.."格鲁尔的巢穴"..WHITE.." 灿烂徽记掉落自 夜之魇 "..YELLOW.."卡拉赞"..WHITE..".\n\n这个任务曾经是毒蛇神殿的进门任务."
Inst41Quest3_Prequest = "无"
Inst41Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst41Quest4 = "4. 冰霜之王埃霍恩 (季节性 仲夏火焰节)"
Inst41Quest4_Level = "70"
Inst41Quest4_Attain = "65"
Inst41Quest4_Aim = "前往赞加沼泽盘牙水库的奴隶围栏，与努玛·云女谈一谈."
Inst41Quest4_Location = "大地之环长者 (所有主城的仲夏篝火旁)"
Inst41Quest4_Note = "努玛就在奴隶围栏的入口处.当然，这个任务也不是召唤埃霍恩的必须任务，只要你在65级以上，不用完成任何任务也可以召唤埃霍恩"
Inst41Quest4_Prequest = "有，反正的活动 -> 通知长者"
Inst41Quest4_Folgequest = "有, 埃霍恩就在这里!"
Inst41Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst41Quest5 = "5. 埃霍恩就在这里! (季节性 仲夏火焰节)"
Inst41Quest5_Level = "70"
Inst41Quest5_Attain = "65"
Inst41Quest5_Aim = "前往奴隶围栏，寻找鲁玛·天母的下落."
Inst41Quest5_Location = "努玛·云女(奴隶围栏; "..YELLOW.."副本入口处"..WHITE..")"
Inst41Quest5_Note = "鲁玛·天母 在 "..YELLOW.."[1]"..WHITE..". 你可以不做任何任务就可以接到这个任务."
Inst41Quest5_Prequest = "有, 冰霜之王埃霍恩 (非必须的)"
Inst41Quest5_Folgequest = "有, 召唤埃霍恩"
Inst41Quest5FQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst41Quest6 = "6. 召唤埃霍恩 (日常-仲夏火焰节)"
Inst41Quest6_Level = "70"
Inst41Quest6_Attain = "65"
Inst41Quest6_Aim = "将大地之环熔岩图腾带到寒冰之石旁边去."
Inst41Quest6_Location = "鲁玛·天母 (奴隶围栏; "..YELLOW.."[1]附近"..WHITE..")"
Inst41Quest6_Note = "寒冰之石就在离鲁玛很近的地方。完成这个任务并召唤埃霍恩 在 "..YELLOW.."[1]"..WHITE..". 完成这个任务将算一个日常."
Inst41Quest6_Prequest = "有, 埃霍恩就在这里!"
Inst41Quest6_Folgequest = "无"
Inst41Quest6FQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst41Quest7 = "7. 埃霍恩的碎片 (季节性 仲夏火焰节)"
Inst41Quest7_Level = "70"
Inst41Quest7_Attain = "65"
Inst41Quest7_Aim = "将寒冰碎片交给鲁玛·天母."
Inst41Quest7_Location = "埃霍恩的碎片 (在杀死寒冰之王后，你可以得到)"
Inst41Quest7_Note = "鲁玛·天母  (奴隶围栏; "..YELLOW.."1"..WHITE.."). 这个物品每个角色一年只能得到一个."
Inst41Quest7_Prequest = "无"
Inst41Quest7_Folgequest = "无"
--
Inst41Quest7name1 = "Tabard of Summer Skies"
Inst41Quest7name2 = "Tabard of Summer Flames"
Inst41Quest7name3 = "Burning Blossom"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst41Quest1_HORDE = Inst41Quest1
Inst41Quest1_HORDE_Level = Inst41Quest1_Level
Inst41Quest1_HORDE_Attain = Inst41Quest1_Attain
Inst41Quest1_HORDE_Aim = Inst41Quest1_Aim
Inst41Quest1_HORDE_Location = Inst41Quest1_Location
Inst41Quest1_HORDE_Note = Inst41Quest1_Note
Inst41Quest1_HORDE_Prequest = Inst41Quest1_Prequest
Inst41Quest1_HORDE_Folgequest = Inst41Quest1_Folgequest
Inst41Quest1PreQuest_HORDE = Inst41Quest1PreQuest
--
Inst41Quest1name1_HORDE = Inst41Quest1name1
Inst41Quest1name2_HORDE = Inst41Quest1name2
Inst41Quest1name3_HORDE = Inst41Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst41Quest2_HORDE = Inst41Quest2
Inst41Quest2_HORDE_Level = Inst41Quest2_Level
Inst41Quest2_HORDE_Attain = Inst41Quest2_Attain
Inst41Quest2_HORDE_Aim = Inst41Quest2_Aim
Inst41Quest2_HORDE_Location = Inst41Quest2_Location
Inst41Quest2_HORDE_Note = Inst41Quest2_Note
Inst41Quest2_HORDE_Prequest = Inst41Quest2_Prequest
Inst41Quest2_HORDE_Folgequest = Inst41Quest2_Folgequest
--
Inst41Quest2name1_HORDE = Inst41Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst41Quest3_HORDE = Inst41Quest3
Inst41Quest3_HORDE_Level = Inst41Quest3_Level
Inst41Quest3_HORDE_Attain = Inst41Quest3_Attain
Inst41Quest3_HORDE_Aim = Inst41Quest3_Aim
Inst41Quest3_HORDE_Location = Inst41Quest3_Location
Inst41Quest3_HORDE_Note = Inst41Quest3_Note
Inst41Quest3_HORDE_Prequest = Inst41Quest3_Prequest
Inst41Quest3_HORDE_Folgequest = Inst41Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst41Quest4_HORDE = Inst41Quest4
Inst41Quest4_HORDE_Level = Inst41Quest4_Level
Inst41Quest4_HORDE_Attain = Inst41Quest4_Attain
Inst41Quest4_HORDE_Aim = Inst41Quest4_Aim
Inst41Quest4_HORDE_Location = Inst41Quest4_Location
Inst41Quest4_HORDE_Note = Inst41Quest4_Note
Inst41Quest4_HORDE_Prequest = Inst41Quest4_Prequest
Inst41Quest4_HORDE_Folgequest = Inst41Quest4_Folgequest
Inst41Quest4PreQuest_HORDE = Inst41Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst41Quest5_HORDE = Inst41Quest5
Inst41Quest5_HORDE_Level = Inst41Quest5_Level
Inst41Quest5_HORDE_Attain = Inst41Quest5_Attain
Inst41Quest5_HORDE_Aim = Inst41Quest5_Aim
Inst41Quest5_HORDE_Location = Inst41Quest5_Location
Inst41Quest5_HORDE_Note = Inst41Quest5_Note
Inst41Quest5_HORDE_Prequest = Inst41Quest5_Prequest
Inst41Quest5_HORDE_Folgequest = Inst41Quest5_Folgequest
Inst41Quest5FQuest_HORDE = Inst41Quest5FQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst41Quest6_HORDE = Inst41Quest6
Inst41Quest6_HORDE_Level = Inst41Quest6_Level
Inst41Quest6_HORDE_Attain = Inst41Quest6_Attain
Inst41Quest6_HORDE_Aim = Inst41Quest6_Aim
Inst41Quest6_HORDE_Location = Inst41Quest6_Location
Inst41Quest6_HORDE_Note = Inst41Quest6_Note
Inst41Quest6_HORDE_Prequest = Inst41Quest6_Prequest
Inst41Quest6_HORDE_Folgequest = Inst41Quest6_Folgequest
Inst41Quest6FQuest_HORDE = Inst41Quest6FQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst41Quest7_HORDE = Inst41Quest7
Inst41Quest7_HORDE_Level = Inst41Quest7_Level
Inst41Quest7_HORDE_Attain = Inst41Quest7_Attain
Inst41Quest7_HORDE_Aim = Inst41Quest7_Aim
Inst41Quest7_HORDE_Location = Inst41Quest7_Location
Inst41Quest7_HORDE_Note = Inst41Quest7_Note
Inst41Quest7_HORDE_Prequest = Inst41Quest7_Prequest
Inst41Quest7_HORDE_Folgequest = Inst41Quest7_Folgequest
--
Inst41Quest7name1_HORDE = Inst41Quest7name1
Inst41Quest7name2_HORDE = Inst41Quest7name2
Inst41Quest7name3_HORDE = Inst41Quest7name3



--------------- INST42 - CR: The Steamvault (SV) ---------------

Inst42Story = "赞加沼泽微妙的生态平衡已经被破坏了。\n\n非自然的现象正在腐蚀和破坏沼泽原生的动植物。\n\n骚乱的源头来自于给人不安预感的盘牙水库。\n\n传闻这一神秘建筑物的所有人不是别人，正是臭名昭著的瓦斯琪女士。\n\n在一切变得太迟之前，只有你能够揭发她的恶毒计划并阻止她和她的手下！\n\n盘牙水库分为4个部分，3个5人副本（奴隶围栏，幽暗沼泽，蒸汽地窟）和一个25人团队副本（毒蛇神殿） "
Inst42Caption = "盘牙水库：蒸汽地窟"
Inst42QAA = "7 个任务"
Inst42QAH = "7 个任务"

Inst42General = {
    {
    "水术师瑟丝比娅",
    "水术师瑟丝比娅有2个守卫（水元素，如果队伍中有术士的话可以放逐）。如果你没有放逐的职业，那么你的坦克需要冲锋并且拉住boss和一个守卫，而其他的队员迅速消灭掉第二个。守卫会随机施放800 - 1000点伤害的冰箭，治疗要注意。如果你有一个可以驱散魔法的职业，要注意驱散肺部爆破和包围之风效果。水术师瑟丝比娅在失去了2个守卫之后还是比较简单的。",
    RED .. "闪电之云" .. WHITE .. "召唤一片闪电之云，持续14秒。对该区域中的玩家造成1575 - 2025点自然伤害并且在接下来的每2秒造成1838 -2362点额外伤害。。\n" .. RED .. "肺部爆破" .. WHITE .. ": 每2秒造成602 - 698点伤害。这是一个魔法减益效果，可以被驱散。\n" .. RED .. "包围之风:" .. WHITE .. " 用一股旋风包围一个玩家，使其昏迷6秒。魔法效果，可被驱散。\n\n" .. BLUE .. "英雄难度要点：风筝BOSS,DPS水元素,打BOSS时候注意躲雷云. 最简单的风筝办法就是宠物停在水中,然后给他加个误导射击,然后猎人开BOSS,战士接水元素。",
    },

    {
    "机械师斯蒂里格",
    "你必须当心他的超级缩小射线技能。如果你的战士能够准确控制法术反射技能的时间，可以将射线反射给boss，这样会让战斗简单很多。如果你能够成功的通过AoE干掉修理员，阻止他们为boss恢复生命值，战斗会很简单。（修理员不是精英）。",
   RED .. "电击网:" .. WHITE .. " 该技能每3秒造成400 - 700自然伤害，并且让玩家10秒不能移动\n" .. RED .. "锯刀:" .. WHITE .. " 造成物理伤害的圆锥范围攻击.\n" .. RED .. "超级缩小射线:" .. WHITE .. " 玩家造成的伤害减少35%.\n".. RED .. "斯蒂姆雷格的修理员:" .. WHITE .. " 这些小怪会治疗斯蒂姆雷格大约1000生命",
    },

    {
    "督军卡利瑟里斯",
    "作为盘牙水库最高等级分支的最终boss，督军卡利瑟里斯具有应有的难度，并且战斗也需要一定时间。队伍必须稳定的进行dps，因为他的生命值很高，并且会定期反射魔法。他另一个值得注意的技能就是穿刺，对随机目标造成每3秒500点物理伤害。如果他在某个目标的穿刺作用时间消失之前再次穿刺，那么作用时间会更新，效果会累积，治疗者必须注意。同时，不时他会大喊一声然后从旁边的某个水箱中吸取能量。在这个时候，这个水箱是可以攻击的，并且队伍中的每个成员都必须攻击水箱，包括治疗。因为boss会在吸取能量的时候停止攻击。在boss完成吸取水箱的能量之前，玩家必须消灭水箱。如果boss成功的吸取了能量，他就会激怒，获得100%攻击速度增加，和75%的攻击伤害增加。因为水箱只有在boss吸取能量的时候才能攻击。只要队伍能够成功的摧毁boss吸取能量的每一个水箱，那么boss战就没有难度了。",
   RED .. "穿刺:" .. WHITE .. " 每3秒对一个目标造成500物理伤害，持续9秒\n" .. RED .. "法术反射:" .. WHITE .. " 法术被反射。效果是大气泡，也可以通过侦测魔法观察.\n" .. RED .. "军阀之怒:" .. WHITE .. " 这是他最危险的技能，大致情况是他会从旁边的一个纳加蒸馏器身上吸取力量，当法术完成之后，他会激怒，获得100%攻击速度增加，和75%的攻击伤害增加.",
    },
};

--Quest 1 Alliance
Inst42Quest1 = "1. 督军的末日"
Inst42Quest1_Level = "70"
Inst42Quest1_Attain = "67"
Inst42Quest1_Aim = "观察者杰哈恩要求你找到并杀死盘牙水库的督军卡利瑟里斯。"
Inst42Quest1_Location = "观察者杰哈恩 (盘牙水库; "..YELLOW.."52, 36"..WHITE..")"
Inst42Quest1_Note = "一定要在BOSS使用水箱时打破它们."
Inst42Quest1_Prequest = "无"
Inst42Quest1_Folgequest = "无"
--
Inst42Quest1name1 = "Hydromancer's Headwrap"
Inst42Quest1name2 = "Helm of the Claw"
Inst42Quest1name3 = "Earthwarden's Coif"
Inst42Quest1name4 = "Myrmidon's Headdress"

--Quest 2 Alliance
Inst42Quest2 = "2. 瓦丝琪的命令"
Inst42Quest2_Level = "70"
Inst42Quest2_Attain = "67"
Inst42Quest2_Aim = "将瓦丝琪女王的命令交给赞加沼泽塞纳里奥庇护所的伊谢尔·风歌。"
Inst42Quest2_Location = "这个任务是从蒸汽地窟的小怪身上随机掉落的物品触发的. 伊谢尔·风歌在"..YELLOW.."78, 62"..WHITE.."."
Inst42Quest2_Note = "这个任务能够是你向塞纳里奥庇护所上交 盘牙武器"
Inst42Quest2_Prequest = "无"
Inst42Quest2_Folgequest = "无"
-- No Rewards for this quest

--Quest 3 Alliance
Inst42Quest3 = "3. 纳鲁的试炼 ：力量(英雄模式)"
Inst42Quest3_Level = "70"
Inst42Quest3_Attain = "70"
Inst42Quest3_Aim = "沙塔斯城的阿达尔要求你取回卡利瑟里斯的三叉戟和摩摩尔的精华。"
Inst42Quest3_Location = "阿达尔 (沙塔斯城; "..YELLOW.."53, 43"..WHITE..")"
Inst42Quest3_Note = "需要英雄模式。摩摩尔的精华出自暗影迷宫."
Inst42Quest3_Prequest = "无"
Inst42Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst42Quest4 = "4. 地下的土壤"
Inst42Quest4_Level = "70"
Inst42Quest4_Attain = "70"
Inst42Quest4_Aim = "从水术师瑟丝比娅手中夺得水下洞穴的沃土，将它交给韦恩的避难所的戴维·韦恩."
Inst42Quest4_Location = "戴维·韦恩 (泰罗卡森林; "..YELLOW.."78,39"..WHITE..")."
Inst42Quest4_Note = "水术师瑟丝比娅在 "..YELLOW.."[1]"..WHITE.."."
Inst42Quest4_Prequest = "有,  能源舰的热源 (能量舰) & 魔语辞典 (暗影迷宫)"
Inst42Quest4_Folgequest = "有，伊利达雷的克星"
Inst42Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst42Quest5 = "5. 第二块和第三块"
Inst42Quest5_Level = "70"
Inst42Quest5_Attain = "68"
Inst42Quest5_Aim = "在盘牙洞穴的秘法容器里取得第二块钥匙碎片，风暴要塞的秘法容器里取得第三块钥匙碎片。完成任务后回到撒塔斯城的卡德加那里。"
Inst42Quest5_Location = "卡德加(沙塔斯城; "..YELLOW.."53,43"..WHITE..")"
Inst42Quest5_Note = "秘法容器就在 "..YELLOW.."[2]"..WHITE..", 在一小潭水的底部."
Inst42Quest5_Prequest = "有，卡拉赞的钥匙（暗影迷宫）"
Inst42Quest5_Folgequest = "有，麦迪文的触摸 (黑暗沼泽)"
Inst42Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst42Quest6 = "6. 悬赏：盘牙侍从 (普通日常)"
Inst42Quest6_Level = "70"
Inst42Quest6_Attain = "70"
Inst42Quest6_Aim = "虚空猎手玛哈杜恩要求你杀死14名盘牙侍从。完成任务后返回沙塔斯城的贫民窟，找他领取奖赏."
Inst42Quest6_Location = "虚空猎手玛哈杜恩 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst42Quest6_Note = "普通日常任务."
Inst42Quest6_Prequest = "无"
Inst42Quest6_Folgequest = "无"
--
Inst42Quest6name1 = "Ethereum Prison Key"

--Quest 7 Alliance
Inst42Quest7 = "7. 悬赏：督军的论文 (英雄日常)"
Inst42Quest7_Level = "70"
Inst42Quest7_Attain = "70"
Inst42Quest7_Aim = "商人扎雷姆要求你夺得督军的论文。将论文带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst42Quest7_Location = "商人扎雷姆 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst42Quest7_Note = "督军卡利瑟里斯 在 "..YELLOW.."[4]"..WHITE.."."
Inst42Quest7_Prequest = "无"
Inst42Quest7_Folgequest = "无"
--
Inst42Quest7name1 = "公正徽章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst42Quest1_HORDE = Inst42Quest1
Inst42Quest1_HORDE_Level = Inst42Quest1_Level
Inst42Quest1_HORDE_Attain = Inst42Quest1_Attain
Inst42Quest1_HORDE_Aim = Inst42Quest1_Aim
Inst42Quest1_HORDE_Location = Inst42Quest1_Location
Inst42Quest1_HORDE_Note = Inst42Quest1_Note
Inst42Quest1_HORDE_Prequest = Inst42Quest1_Prequest
Inst42Quest1_HORDE_Folgequest = Inst42Quest1_Folgequest
--
Inst42Quest1name1_HORDE = Inst42Quest1name1
Inst42Quest1name2_HORDE = Inst42Quest1name2
Inst42Quest1name3_HORDE = Inst42Quest1name3
Inst42Quest1name4_HORDE = Inst42Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst42Quest2_HORDE = Inst42Quest2
Inst42Quest2_HORDE_Level = Inst42Quest2_Level
Inst42Quest2_HORDE_Attain = Inst42Quest2_Attain
Inst42Quest2_HORDE_Aim = Inst42Quest2_Aim
Inst42Quest2_HORDE_Location = Inst42Quest2_Location
Inst42Quest2_HORDE_Note = Inst42Quest2_Note
Inst42Quest2_HORDE_Prequest = Inst42Quest2_Prequest
Inst42Quest2_HORDE_Folgequest = Inst42Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst42Quest3_HORDE = Inst42Quest3
Inst42Quest3_HORDE_Level = Inst42Quest3_Level
Inst42Quest3_HORDE_Attain = Inst42Quest3_Attain
Inst42Quest3_HORDE_Aim = Inst42Quest3_Aim
Inst42Quest3_HORDE_Location = Inst42Quest3_Location
Inst42Quest3_HORDE_Note = Inst42Quest3_Note
Inst42Quest3_HORDE_Prequest = Inst42Quest3_Prequest
Inst42Quest3_HORDE_Folgequest = Inst42Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst42Quest4_HORDE = Inst42Quest4
Inst42Quest4_HORDE_Level = Inst42Quest4_Level
Inst42Quest4_HORDE_Attain = Inst42Quest4_Attain
Inst42Quest4_HORDE_Aim = Inst42Quest4_Aim
Inst42Quest4_HORDE_Location = Inst42Quest4_Location
Inst42Quest4_HORDE_Note = Inst42Quest4_Note
Inst42Quest4_HORDE_Prequest = Inst42Quest4_Prequest
Inst42Quest4_HORDE_Folgequest = Inst42Quest4_Folgequest
Inst42Quest4PreQuest_HORDE = Inst42Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst42Quest5_HORDE = Inst42Quest5
Inst42Quest5_HORDE_Level = Inst42Quest5_Level
Inst42Quest5_HORDE_Attain = Inst42Quest5_Attain
Inst42Quest5_HORDE_Aim = Inst42Quest5_Aim
Inst42Quest5_HORDE_Location = Inst42Quest5_Location
Inst42Quest5_HORDE_Note = Inst42Quest5_Note
Inst42Quest5_HORDE_Prequest = Inst42Quest5_Prequest
Inst42Quest5_HORDE_Folgequest = Inst42Quest5_Folgequest
Inst42Quest5PreQuest_HORDE = Inst42Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst42Quest6_HORDE = Inst42Quest6
Inst42Quest6_HORDE_Level = Inst42Quest6_Level
Inst42Quest6_HORDE_Attain = Inst42Quest6_Attain
Inst42Quest6_HORDE_Aim = Inst42Quest6_Aim
Inst42Quest6_HORDE_Location = Inst42Quest6_Location
Inst42Quest6_HORDE_Note = Inst42Quest6_Note
Inst42Quest6_HORDE_Prequest = Inst42Quest6_Prequest
Inst42Quest6_HORDE_Folgequest = Inst42Quest6_Folgequest
--
Inst42Quest6name1_HORDE = Inst42Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst42Quest7_HORDE = Inst42Quest7
Inst42Quest7_HORDE_Level = Inst42Quest7_Level
Inst42Quest7_HORDE_Attain = Inst42Quest7_Attain
Inst42Quest7_HORDE_Aim = Inst42Quest7_Aim
Inst42Quest7_HORDE_Location = Inst42Quest7_Location
Inst42Quest7_HORDE_Note = Inst42Quest7_Note
Inst42Quest7_HORDE_Prequest = Inst42Quest7_Prequest
Inst42Quest7_HORDE_Folgequest = Inst42Quest7_Folgequest
--
Inst42Quest7name1_HORDE = Inst42Quest7name1



--------------- INST43 - CR: The Underbog (UB) ---------------

Inst43Story = "赞加沼泽微妙的生态平衡已经被破坏了。\n\n非自然的现象正在腐蚀和破坏沼泽原生的动植物。\n\n骚乱的源头来自于给人不安预感的盘牙水库。\n\n传闻这一神秘建筑物的所有人不是别人，正是臭名昭著的瓦斯琪女士。\n\n在一切变得太迟之前，只有你能够揭发她的恶毒计划并阻止她和她的手下！\n\n盘牙水库分为4个部分，3个5人副本（奴隶围栏，幽暗沼泽，蒸汽地窟）和一个25人团队副本（毒蛇神殿） "
Inst43Caption = "盘牙水库：幽暗沼泽"
Inst43QAA = "5 个任务"
Inst43QAH = "5 个任务"

Inst43General = {
    {
    "霍加尔芬",
    "所有的队伍成员必须观察地下沼泽蘑菇并且离开其范围，包括坦克在内。在霍加尔芬的生命值降低到某个程度以下时，它会开始使用邪恶孢子。包括坦克在内所有队员都需要离开boss附近，以免受到AoE伤害，同时避免Boss治疗自己。注意：霍加尔芬旁边的两个孢子巨人与boss并不是仇恨连接的，强烈推荐单独消灭",
    RED .. "孢子云" .. WHITE .. "会在随机地点让这些蘑菇出现。生长几秒钟之后，这些蘑菇会放出孢子云,由孢子蘑菇释放的AoE型DoT。在20秒内每2秒造成360 - 540点自然伤害，最多累积5次\n" .. RED .. "邪恶孢子" .. WHITE .. ": 霍加尔芬将自己的根扎入地下，释放出AoE的毒性云雾，造成每秒400 - 600伤害，并且对霍加尔芬造成4倍于伤害量的治疗。范围15码。",
    },

    {
    "加兹安",
    "你队伍中的主坦克需要第一个进入战场来吸引加兹安。加兹安必须侧面朝向小队，不然队员会受到酸性喷射和尾巴扫击的伤害。当坦克吸引了加兹安之后，他就开始受到酸性呼吸的伤害，但是这并不难于治疗。由于加兹安会在20% 生命时激怒，所以需要将需要长冷却的dps技能保持在那之后使用。",
   RED .. "酸性喷射:" .. WHITE .. " 正面宽圆锥范围内攻击，造成2000 - 2500伤害.\n" .. RED .. "尾巴扫击:" .. WHITE .. " 和奥妮克西娅的尾巴扫击类似，附带500 - 800伤害的击退效果.\n" .. RED .. "酸性呼吸:" .. WHITE .. " 这个技能每3秒造成144点伤害，最多可堆积4次，不可驱散。",
    },

    {
    "沼地领主穆塞雷克",
    "一开始坦克需要冲向这个猎人boss的宠物：利爪，如果有小D也可以把熊一直睡，然后转换目标为boss本人。当坦克获得了足够仇恨之后（需要3 - 4秒），其他队员也可以开始攻击目标。每隔几秒沼地领主穆塞雷克就会冰冻所有队员，并且拉开距离射击。坦克需要尽快回到他的近战范围内并且吸引住boss。当猎人死亡之后，队员可以全力对付利爪。在它的生命值降低到5%左右时会变为友善目标，并且变形成一个德鲁伊。",
   RED .. "瞄准射击:" .. WHITE .. " 没有被近距离坦克吸引住时会使用这一技能，对布衣可以造成2000点以上伤害\n" .. RED .. "多重射击:" .. WHITE .. " 对若干随机队员射击，造成2000 - 2500点奥术伤害。.\n" .. RED .. "冰冻陷阱:" .. WHITE .. " 常会冰冻所有队员3秒，然后拉开距离.",
    },
    
    {
    "黑色阔步者",
    "分散站位是避免闪电伤害的关键。但是真正造成伤害的是漂浮术和静电充能。静电充能每次伤害为750，除非得到治疗，玩家会被杀死。如果可能的话，安排好第二治疗和第二坦克。这一boss的战斗比起该副本中之前的战斗来说相对困难。",
   RED .. "闪电链:" .. WHITE .. " 与萨满的技能类似，攻击接近的几个目标\n" .. RED .. "漂浮术:" .. WHITE .. " 给予玩家一个减益状态，让他漂浮在空中远离队员和boss.\n" .. RED .. "静电充能:" .. WHITE .. " DoT伤害，对玩家及邻近队友造成750点每跳伤害。这一状态无法被驱散，除非得到治疗，玩家会被杀死.",
    },
};

--Quest 1 Alliance
Inst43Quest1 = "1. 失踪的同伴"
Inst43Quest1_Level = "65"
Inst43Quest1_Attain = "62"
Inst43Quest1_Aim = "查明缚地者雷葛、博学者拜特、除草者格林萨姆和唤风者克劳恩的下落，然后返回赞加沼泽的盘牙水库，向观察者杰哈恩复命。"
Inst43Quest1_Location = "观察者杰哈恩 (盘牙水库; "..YELLOW.."52, 36"..WHITE..")"
Inst43Quest1_Note = "缚地者雷葛在 "..YELLOW.."[3]"..WHITE..", 唤风者克劳恩在 "..YELLOW.."[4]"..WHITE..".注意，雷葛是潜行的，你需要走近些才能看见它，克劳恩则需要杀掉BOSS或者将它打成16%的血它才能变回原形，才能和他说话完成任务"
Inst43Quest1_Prequest = "无"
Inst43Quest1_Folgequest = "无"
Inst43Quest1PreQuest = "true"
--
Inst43Quest1name1 = "Cenarion Ring of Casting"
Inst43Quest1name2 = "Goldenvine Wraps"
Inst43Quest1name3 = "Dark Cloak of the Marsh"

--Quest 2 Alliance
Inst43Quest2 = "2. 孢子叶"
Inst43Quest2_Level = "65"
Inst43Quest2_Attain = "63"
Inst43Quest2_Aim = "将一片幽暗孢子叶交给赞加沼泽孢子村的塔苏。"
Inst43Quest2_Location = "塔苏 (赞加沼泽; "..YELLOW.."19, 49"..WHITE..")"
Inst43Quest2_Note = "你必须和孢子村声望中立才能接到任务。幽暗孢子叶就在霍加尔芬身后 "..YELLOW.."[1]"..WHITE.."."
Inst43Quest2_Prequest = "无"
Inst43Quest2_Folgequest = "无"
--
Inst43Quest2name1 = "Everlasting Underspore Frond"

--Quest 3 Alliance
Inst43Quest3 = "3. 黑色阔步者"
Inst43Quest3_Level = "65"
Inst43Quest3_Attain = "63"
Inst43Quest3_Aim = "将黑色阔步者的大脑交给赞加沼泽孢子村的肯尼克斯。"
Inst43Quest3_Location = "肯尼克斯 (赞加沼泽; "..YELLOW.."19, 49"..WHITE..")"
Inst43Quest3_Note = "你必须和孢子村中立才能接到这个任务，黑色阔步者就在 "..YELLOW.."[5]"..WHITE.."."
Inst43Quest3_Prequest = "无"
Inst43Quest3_Folgequest = "无"
--
Inst43Quest3name1 = "灌注精华的蘑菇"
Inst43Quest3name2 = "灌注能量的蘑菇"

--Quest 4 Alliance
Inst43Quest4 = "4. 悬赏：黑色阔步者的卵 (英雄日常)"
Inst43Quest4_Level = "70"
Inst43Quest4_Attain = "70"
Inst43Quest4_Aim = "商人扎雷姆要求你取回一枚黑色阔步者的卵。将卵带回沙塔斯城的贫民窟交给他，就能领取奖赏."
Inst43Quest4_Location = "商人扎雷姆 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst43Quest4_Note = "黑色阔步者 在 "..YELLOW.."[5]"..WHITE.."."
Inst43Quest4_Prequest = "无"
Inst43Quest4_Folgequest = "无"
--
Inst43Quest4name1 = "公正徽章"

--Quest 5 Alliance
Inst43Quest5 = "5. 我要红色木槿！"
Inst43Quest5_Level = "65"
Inst43Quest5_Attain = "63"
Inst43Quest5_Aim = "将5朵红色木槿交给赞加沼泽孢子村的舒特."
Inst43Quest5_Location = "舒特 (赞加沼泽 - 孢子村; "..YELLOW.."19,50"..WHITE..")"
Inst43Quest5_Note = "你必须和孢子村达到友善以上声望才能接到这个任务."
Inst43Quest5_Prequest = "No"
Inst43Quest5_Folgequest = "有, 我还要红色木槿!"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst43Quest1_HORDE = Inst43Quest1
Inst43Quest1_HORDE_Level = Inst43Quest1_Level
Inst43Quest1_HORDE_Attain = Inst43Quest1_Attain
Inst43Quest1_HORDE_Aim = Inst43Quest1_Aim
Inst43Quest1_HORDE_Location = Inst43Quest1_Location
Inst43Quest1_HORDE_Note = Inst43Quest1_Note
Inst43Quest1_HORDE_Prequest = Inst43Quest1_Prequest
Inst43Quest1_HORDE_Folgequest = Inst43Quest1_Folgequest
Inst43Quest1PreQuest_HORDE = Inst43Quest1PreQuest
--
Inst43Quest1name1_HORDE = Inst43Quest1name1
Inst43Quest1name2_HORDE = Inst43Quest1name2
Inst43Quest1name3_HORDE = Inst43Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst43Quest2_HORDE = Inst43Quest2
Inst43Quest2_HORDE_Level = Inst43Quest2_Level
Inst43Quest2_HORDE_Attain = Inst43Quest2_Attain
Inst43Quest2_HORDE_Aim = Inst43Quest2_Aim
Inst43Quest2_HORDE_Location = Inst43Quest2_Location
Inst43Quest2_HORDE_Note = Inst43Quest2_Note
Inst43Quest2_HORDE_Prequest = Inst43Quest2_Prequest
Inst43Quest2_HORDE_Folgequest = Inst43Quest2_Folgequest
--
Inst43Quest2name1_HORDE = Inst43Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst43Quest3_HORDE = Inst43Quest3
Inst43Quest3_HORDE_Level = Inst43Quest3_Level
Inst43Quest3_HORDE_Attain = Inst43Quest3_Attain
Inst43Quest3_HORDE_Aim = Inst43Quest3_Aim
Inst43Quest3_HORDE_Location = Inst43Quest3_Location
Inst43Quest3_HORDE_Note = Inst43Quest3_Note
Inst43Quest3_HORDE_Prequest = Inst43Quest3_Prequest
Inst43Quest3_HORDE_Folgequest = Inst43Quest3_Folgequest
--
Inst43Quest3name1_HORDE = Inst43Quest3name1
Inst43Quest3name2_HORDE = Inst43Quest3name2

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst43Quest4_HORDE = Inst43Quest4
Inst43Quest4_HORDE_Level = Inst43Quest4_Level
Inst43Quest4_HORDE_Attain = Inst43Quest4_Attain
Inst43Quest4_HORDE_Aim = Inst43Quest4_Aim
Inst43Quest4_HORDE_Location = Inst43Quest4_Location
Inst43Quest4_HORDE_Note = Inst43Quest4_Note
Inst43Quest4_HORDE_Prequest = Inst43Quest4_Prequest
Inst43Quest4_HORDE_Folgequest = Inst43Quest4_Folgequest
--
Inst43Quest4name1_HORDE = Inst43Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst43Quest5_HORDE = Inst43Quest5
Inst43Quest5_HORDE_Level = Inst43Quest5_Level
Inst43Quest5_HORDE_Attain = Inst43Quest5_Attain
Inst43Quest5_HORDE_Aim = Inst43Quest5_Aim
Inst43Quest5_HORDE_Location = Inst43Quest5_Location
Inst43Quest5_HORDE_Note = Inst43Quest5_Note
Inst43Quest5_HORDE_Prequest = Inst43Quest5_Prequest
Inst43Quest5_HORDE_Folgequest = Inst43Quest5_Folgequest
-- No Rewards for this quest



--------------- INST44 - Auchindoun: Auchenai Crypts (AC) ---------------

Inst44Story = "几千年来，德莱尼人将死者埋葬在他们最神圣的庙宇奥金顿之中.\n\n但是，暗影议会的成员潜入了奥金顿，准备召唤无比邪恶的恐怖生物。他们可耻的魔法造成了一场大爆炸，将庙宇炸的四分五裂，周围的地区也成为了一片焦土\n\n爆炸同时在虚空中切开了一条裂缝，将另一个世界的灵体带入了外域。以前被埋葬的德莱尼人无法安息的灵魂在废墟中游荡。而且，暗影议会召唤的恐惧生物就要突破暗影议会控制它的努力了.\n\n你必须防止它降临到这个世界中.\n\n奥金顿分为4个5人副本，64-66的法力坟墓，65-67的奥金尼地穴，67-69的塞泰克大厅和70-72的暗影迷宫."
Inst44Caption = "奥金顿：奥金尼地穴"
Inst44QAA = "2 个任务"
Inst44QAH = "4 个任务"
Inst44General = {
    {
    "死亡观察者希尔拉克",
    "希尔拉克不会从台阶上下来，所以队伍需要冲上去。对付他有几个战略。其中一个战略是四方移动战略，这样他的集中火力伤害将会降到最小。队伍站成一个四方形，2个在左边，2个在右边。当大家都到位之后，坦克将希尔拉克拉到四方形的一个角落上。为了保证治疗者的生存，最好他们从楼梯上走下去躲避集中火力的伤害。",
    RED .. "食肉撕咬" .. WHITE .. "近战范围内的流血debuff，当希尔拉克把玩家拉近身时施放。\n" .. RED .. "约束魔法" .. WHITE .. ": 对所有玩家施放一个debuff， 增加施法时间50%，最多积累4次，效果为施法时间增加200%.\n" .. RED .. "集中火力:" .. WHITE .. "希尔拉克会做出’死亡守望者施拉克正在集中他的能量‘这样的动作，然后在某个玩家脚下放出标记。3 - 5 秒之后，标记会进行类似冲击波的攻击，对附近的玩家造成1650点火焰伤害。",
    },

    {
    "大主教玛拉达尔",
    "战斗的关键是尽量减少影之生物的数量（最好为0）。每次当一个影之生物被制造出来之后，集中火力迅速消灭它。然后再攻击大主教。万一有多个影之生物出现，可以用冰霜新星控制。在20% 生命时，大主教会召唤一个攻击力非常强劲的殉教者之灵。集中杀死大主教，然后再消灭殉教者之灵。",
   RED .. "召唤殉教者之灵:" .. WHITE .. " 在20% 生命时，大主教将会召唤一个殉教者之灵，它会使用恶心的致死打击技能。\n" .. RED .. "心灵顺劈斩:" .. WHITE .. "所有的伤害和治疗都降低50%。\n" .. RED .. "召唤影之生物:" .. WHITE .. "制造一个玩家的阴影来攻击队员。阴影对布衣造成706 - 878伤害，还会使用伤害在1500左右的致死打击。\n" .. RED .. "心灵尖啸:" .. WHITE .. " 群体恐惧.",
    },
};

--Quest 1 Alliance
Inst44Quest1 = "1. 一切都会变好的"
Inst44Quest1_Level = "67"
Inst44Quest1_Attain = "64"
Inst44Quest1_Aim = "奥金顿奥金尼地穴外的奥德里姆斯宗父要你进入奥金尼地穴，消灭大主教玛拉达尔。"
Inst44Quest1_Location = "奥德里姆斯宗父 (泰罗卡森林; "..YELLOW.."35,65 "..WHITE..")"
Inst44Quest1_Note = "大主教玛拉达尔 在 "..YELLOW.."[2]"..WHITE..". 这个任务的起始任务是 我看到了死德莱尼人 ，起始NPC是 哈雷 (泰罗卡森林; "..YELLOW.."35,65"..WHITE..")."
Inst44Quest1_Prequest = "有，唤魂者利维休斯"
Inst44Quest1_Folgequest = "无"
Inst44Quest1PreQuest = "true"
--
Inst44Quest1name1 = "奥金尼学者长袍"
Inst44Quest1name2 = "奥金尼僧侣外套"
Inst44Quest1name3 = "奥金尼猎手外套"
Inst44Quest1name4 = "主教护卫者"

--Quest 2 Alliance
Inst44Quest2 = "2. 悬赏：主教的灵魂宝钻 (英雄日常)"
Inst44Quest2_Level = "70"
Inst44Quest2_Attain = "70"
Inst44Quest2_Aim = "商人扎雷姆要求你夺得主教的灵魂宝钻。将宝钻带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst44Quest2_Location = "商人扎雷姆 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst44Quest2_Note = "大主教玛拉达尔 在"..YELLOW.."[2]"..WHITE.."."
Inst44Quest2_Prequest = "无"
Inst44Quest2_Folgequest = "无"
--
Inst44Quest2name1 = "公正徽章"


--Quest 1 Horde
Inst44Quest1_HORDE = "1. 奥金顿"
Inst44Quest1_HORDE_Level = "68"
Inst44Quest1_HORDE_Attain = "67"
Inst44Quest1_HORDE_Aim = "前往泰罗卡森林白骨荒野的奥金尼地穴，杀死大主教玛拉达尔，解救德欧里的灵魂。"
Inst44Quest1_HORDE_Location = "阿达尔 (沙塔斯城; "..YELLOW.."54,45"..WHITE..")"
Inst44Quest1_HORDE_Note = "大主教玛拉达尔 在 "..YELLOW.."[2]"..WHITE.."."
Inst44Quest1_HORDE_Prequest = "有，谜底揭晓"
Inst44Quest1_HORDE_Folgequest = "有，"
Inst44Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst44Quest2_HORDE = "2. 灵魂之眼"
Inst44Quest2_HORDE_Level = "68"
Inst44Quest2_HORDE_Attain = "69"
Inst44Quest2_HORDE_Aim = "在奥金尼地穴中找到一面灵魂之镜，用它召唤纳格兰上古兽人先祖的黑暗之魂。消灭15个黑暗的灵魂，让兽人先祖得以安然长眠。\n\n完成任务后，向先祖之地的卡舒尔宗母复命。"
Inst44Quest2_HORDE_Location = "德欧里 (奥金尼地穴; "..YELLOW..""..WHITE.."). 卡舒尔宗母 在 (Nagrand; "..YELLOW.."26,61"..WHITE..")."
Inst44Quest2_HORDE_Note = "最好有一个3人以上小队再召唤兽人先祖."
Inst44Quest2_HORDE_Prequest = "有，奥金顿。。"
Inst44Quest2_HORDE_Folgequest = "有，返回盖亚安祖母身边"
Inst44Quest2FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 1 Alliance)
Inst44Quest3_HORDE = "3. 一切都会变好的"
Inst44Quest3_HORDE_Level = Inst44Quest1_Level
Inst44Quest3_HORDE_Attain = Inst44Quest1_Attain
Inst44Quest3_HORDE_Aim = Inst44Quest1_Aim
Inst44Quest3_HORDE_Location = Inst44Quest1_Location
Inst44Quest3_HORDE_Note = Inst44Quest1_Note
Inst44Quest3_HORDE_Prequest = Inst44Quest1_Prequest
Inst44Quest3_HORDE_Folgequest = Inst44Quest1_Folgequest
Inst44Quest3PreQuest_HORDE = Inst44Quest1PreQuest
--
Inst44Quest3name1_HORDE = Inst44Quest1name1
Inst44Quest3name2_HORDE = Inst44Quest1name2
Inst44Quest3name3_HORDE = Inst44Quest1name3
Inst44Quest3name4_HORDE = Inst44Quest1name4

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst44Quest4_HORDE = "4. 悬赏：主教的灵魂宝钻 (英雄日常)"
Inst44Quest4_HORDE_Level = Inst44Quest2_Level
Inst44Quest4_HORDE_Attain = Inst44Quest2_Attain
Inst44Quest4_HORDE_Aim = Inst44Quest2_Aim
Inst44Quest4_HORDE_Location = Inst44Quest2_Location
Inst44Quest4_HORDE_Note = Inst44Quest2_Note
Inst44Quest4_HORDE_Prequest = Inst44Quest2_Prequest
Inst44Quest4_HORDE_Folgequest = Inst44Quest2_Folgequest
--
Inst44Quest4name1_HORDE = Inst44Quest2name1



--------------- INST45 - Auchindoun: Mana Tombs (MT) ---------------

Inst45Story = "几千年来，德莱尼人将死者埋葬在他们最神圣的庙宇奥金顿之中.\n\n但是，暗影议会的成员潜入了奥金顿，准备召唤无比邪恶的恐怖生物。他们可耻的魔法造成了一场大爆炸，将庙宇炸的四分五裂，周围的地区也成为了一片焦土\n\n爆炸同时在虚空中切开了一条裂缝，将另一个世界的灵体带入了外域。以前被埋葬的德莱尼人无法安息的灵魂在废墟中游荡。而且，暗影议会召唤的恐惧生物就要突破暗影议会控制它的努力了.\n\n你必须防止它降临到这个世界中.\n\n奥金顿分为4个5人副本，64-66的法力坟墓，65-67的奥金尼地穴，67-69的塞泰克大厅和70-72的暗影迷宫."
Inst45Caption = "奥金顿：法力陵墓"
Inst45QAA = "5 个任务"
Inst45QAH = "5 个任务"
Inst45General = {
    {
    "潘德莫努斯",
    "虽然不是必须，但是暗影抗性在该场boss战中能起到很大作用。因为boss几乎所有的伤害都是暗影伤害（除了虚空爆炸）。暗抗装备，药水和buff（牧师），光环都有作用。\n战斗的关键是随时注意观察暗影护盾技能的动画效果（boss身边的绿色半圆圈）。每一个dps，包括坦克在内，在暗影护盾作用的5秒内都必须停止攻击。另外还有一点值得注意的是，你应该在一面墙附近坦克这个boss，防止boss将坦克击退后超出治疗范围。",
    RED .. "近战攻击：" .. WHITE .. "造成暗影伤害，这意味着暗影抗性是非常重要的（抵抗前伤害为700 - 1000）。\n" .. RED .. "暗影护盾：" .. WHITE .. ": 反射所有对他施放的法术，并且对近战攻击者造成800 - 1000点伤害（绿色半圆形动画）。护盾有效时间约为5秒。\n" .. RED .. "虚空爆炸:" .. WHITE .. " 对所有附近的目标造成1000 - 2000点物理伤害并且将目标击退，伤害可以由护甲减免。有时候他会连续进行2 - 3次类似攻击.\n\n" .. BLUE .. "英雄难度要点：有一定的暗抗装会很好打.BOSS攻击很高(因为是暗影),建议双治疗解决,开虚空盾的时候停止攻击。",
    },

    {
    "塔瓦洛克",
    "没有特殊战略，基本的坦克/dps战",
   RED .. "半月斩:" .. WHITE .. " 施放出一道弧形攻击，对面前锥形范围内的玩家造成普通攻击伤害外加125点额外伤害。\n" .. RED .. "水晶囚笼:" .. WHITE .. "该技能对随机队员施放，每秒造成10%伤害，持续5秒.\n" .. RED .. "地震:" .. WHITE .. " 对40码内的玩家造成919 - 1181点物理伤害，并使他们眩晕3秒。\n\n" .. BLUE .. "英雄难度要点：硬顶此BOSS,仍然建议2治疗,注意:BOSS大约30秒发动一次顺劈,伤害是8000一下,没错你没看错,8000一下的顺劈.还有范围击晕,攻击频率较高,注意开保命技能。",
    },

    {
    "节点亲王沙法尔",
    "在这场战斗中你将会看到，节点亲王沙法尔附近有3个非精英的虚空道标，并且他们会制造伤害（类似法师类型）。如果你让它们生存的时间太长，它们会变成3个精英的虚空道标。所以你应该在对付boss之前快速dps掉它们。节点亲王沙法尔在战斗中将会从虚空中召唤它们，所以要随时关注它们的出现，不用关心王子，将火力集中到虚空道标上。战斗的关键在于，在一开始的时候，由于3个道标都是存在的，它们和boss的火力都会聚集在拉怪的人身上。如果在消灭掉3个道标之后你还没有失去任何队员，那么剩下的战斗也没有什么难度了。",
   RED .. "火球:" .. WHITE .. " 造成1300 - 1650点伤害的火球。\n" .. RED .. "冰箭:" .. WHITE .. " 造成900 - 1200伤害的冰箭.\n" .. RED .. "冰霜新星:" .. WHITE .. " 同法师技能，造成550伤害.\n\n" .. BLUE .. "英雄难度要点：打这个BOSS他完全没有物理攻击,你可以放弃防御技能堆血堆暴击增加DPS. 1.5秒左右一次的冰剑火球交替释放,对治疗是个考验,不过还好掉血比较平稳.技能要舍得用。",
    },
};

--Quest 1 Alliance
Inst45Quest1 = "1. 安全第一"
Inst45Quest1_Level = "66"
Inst45Quest1_Attain = "64"
Inst45Quest1_Aim = "工匠莫法鲁斯要你杀死10个虚灵盗墓者、5个虚灵巫师、5个节点潜行者和5个虚灵缚法者。\n\n全部搞定之后，激活沙法尔房间的前一个房间中的虚灵传送器。"
Inst45Quest1_Location = "工匠莫法鲁斯  在(泰罗卡森林; "..YELLOW.."39,58"..WHITE..")"
Inst45Quest1_Note = "虚灵传送器 在 "..YELLOW.."[3]"..WHITE.."."
Inst45Quest1_Prequest = "无"
Inst45Quest1_Folgequest = "有, 别人的烂摊子"
-- No Rewards for this quest

--Quest 2 Alliance
Inst45Quest2 = "2. 别人的烂摊子"
Inst45Quest2_Level = "66"
Inst45Quest2_Attain = "64"
Inst45Quest2_Aim = "护送低温工程师沙赫恩穿过法力陵墓，在他从沙法尔的灵体收集器中收集灵体能量时保护他。\n\n完成任务后向节点亲王哈拉迈德复命，他就在星界财团设立在法力陵墓外的营地中。"
Inst45Quest2_Location = "低温工程师沙赫恩 (法力坟墓; "..YELLOW.."[3]"..WHITE..")"
Inst45Quest2_Note = "护送沙赫恩之前，点击位于 "..YELLOW.."[3]"..WHITE..". 的传送器。他身边会有几个NPC帮助他，不过在护送之前，最好还是把副本清光光，不留活口."
Inst45Quest2_Prequest = "有，安全第一"
Inst45Quest2_Folgequest = "无"
Inst45Quest2FQuest = "true"
--
Inst45Quest2name1 = "星界财团裹布"
Inst45Quest2name2 = "低温手套"
Inst45Quest2name3 = "星界财团相位衬肩"
Inst45Quest2name4 = "血肉兽的金属胫甲"

--Quest 3 Alliance
Inst45Quest3 = "3. 扫除竞争者"
Inst45Quest3_Level = "66"
Inst45Quest3_Attain = "64"
Inst45Quest3_Aim = "法力陵墓外的节点亲王哈拉迈德要你杀死节点亲王沙法尔，并将沙法尔的护腕带交给他。"
Inst45Quest3_Location = "节点亲王哈拉迈德 (泰罗卡 -奥金顿; "..YELLOW.."39,58"..WHITE..")."
Inst45Quest3_Note = "在这场战斗中你将会看到，节点王子夏法附近有3个非精英的虚空道标，并且他们会制造伤害（类似法师类型）。如果你让它们生存的时间太长，它们会变成3个精英的虚空道标。所以你应该在对付boss之前快速dps掉它们。节点王子夏法在战斗中将会从虚空中召唤它们，所以要随时关注它们的出现，不用关心王子，将火力集中到虚空道标上。"
Inst45Quest3_Prequest = "无"
Inst45Quest3_Folgequest = "无"
--
Inst45Quest3name1 = "哈拉迈德的三环护腿"
Inst45Quest3name2 = "星界财团板甲护腿"
Inst45Quest3name3 = "哈拉迈德的裹腿"
Inst45Quest3name4 = "哈拉迈德的链甲护腿"

--Quest 4 Alliance
Inst45Quest4 = "4. 法力陵墓的密室 (英雄模式)"
Inst45Quest4_Level = "70"
Inst45Quest4_Attain = "70"
Inst45Quest4_Aim = "刀锋山巴什伊尔码头的指挥官阿密尔的幻影要你使用法力墓地静止密室钥匙打开奥金顿的法力陵墓静止密室。 \n\n这个任务只能在英雄模式的难度下进行."
Inst45Quest4_Location = "指挥官阿密尔的幻影 (刀锋山; "..YELLOW.."52,15"..WHITE..")."
Inst45Quest4_Note = "需要英雄难度. 有2个密室. 第一个就在潘德莫努斯身后，第二个在节点亲王沙法尔的房间里。你们其中每个人都需要有节点亲王的印记。"
Inst45Quest4_Prequest = "有，节点亲王的印记"
Inst45Quest4_Folgequest = "无"
Inst45Quest4PreQuest = "true"
--
Inst45Quest4name1 = "公正徽章"

--Quest 5 Alliance
Inst45Quest5 = "5. 悬赏：沙法尔的精致饰物 (英雄日常)"
Inst45Quest5_Level = "70"
Inst45Quest5_Attain = "70"
Inst45Quest5_Aim = "商人扎雷姆要求你夺得沙法尔的精致饰物。将饰物带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst45Quest5_Location = "商人扎雷姆 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst45Quest5_Note = "节点亲王沙法尔 在 "..YELLOW.."[5]"..WHITE.."."
Inst45Quest5_Prequest = "无"
Inst45Quest5_Folgequest = "无"
--
Inst45Quest5name1 = "公正徽章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst45Quest1_HORDE = Inst45Quest1
Inst45Quest1_HORDE_Level = Inst45Quest1_Level
Inst45Quest1_HORDE_Attain = Inst45Quest1_Attain
Inst45Quest1_HORDE_Aim = Inst45Quest1_Aim
Inst45Quest1_HORDE_Location = Inst45Quest1_Location
Inst45Quest1_HORDE_Note = Inst45Quest1_Note
Inst45Quest1_HORDE_Prequest = Inst45Quest1_Prequest
Inst45Quest1_HORDE_Folgequest = Inst45Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst45Quest2_HORDE = Inst45Quest2
Inst45Quest2_HORDE_Level = Inst45Quest2_Level
Inst45Quest2_HORDE_Attain = Inst45Quest2_Attain
Inst45Quest2_HORDE_Aim = Inst45Quest2_Aim
Inst45Quest2_HORDE_Location = Inst45Quest2_Location
Inst45Quest2_HORDE_Note = Inst45Quest2_Note
Inst45Quest2_HORDE_Prequest = Inst45Quest2_Prequest
Inst45Quest2_HORDE_Folgequest = Inst45Quest2_Folgequest
Inst45Quest2FQuest_HORDE = Inst45Quest2FQuest
--
Inst45Quest2name1_HORDE = Inst45Quest2name1
Inst45Quest2name2_HORDE = Inst45Quest2name2
Inst45Quest2name3_HORDE = Inst45Quest2name3
Inst45Quest2name4_HORDE = Inst45Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst45Quest3_HORDE = Inst45Quest3
Inst45Quest3_HORDE_Level = Inst45Quest3_Level
Inst45Quest3_HORDE_Attain = Inst45Quest3_Attain
Inst45Quest3_HORDE_Aim = Inst45Quest3_Aim
Inst45Quest3_HORDE_Location = Inst45Quest3_Location
Inst45Quest3_HORDE_Note = Inst45Quest3_Note
Inst45Quest3_HORDE_Prequest = Inst45Quest3_Prequest
Inst45Quest3_HORDE_Folgequest = Inst45Quest3_Folgequest
--
Inst45Quest3name1_HORDE = Inst45Quest3name1
Inst45Quest3name2_HORDE = Inst45Quest3name2
Inst45Quest3name3_HORDE = Inst45Quest3name3
Inst45Quest3name4_HORDE = Inst45Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst45Quest4_HORDE = Inst45Quest4
Inst45Quest4_HORDE_Level = Inst45Quest4_Level
Inst45Quest4_HORDE_Attain = Inst45Quest4_Attain
Inst45Quest4_HORDE_Aim = Inst45Quest4_Aim
Inst45Quest4_HORDE_Location = Inst45Quest4_Location
Inst45Quest4_HORDE_Note = Inst45Quest4_Note
Inst45Quest4_HORDE_Prequest = Inst45Quest4_Prequest
Inst45Quest4_HORDE_Folgequest = Inst45Quest4_Folgequest
Inst45Quest4PreQuest_HORDE = Inst45Quest4PreQuest
--
Inst45Quest4name1_HORDE = Inst45Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst45Quest5_HORDE = Inst45Quest5
Inst45Quest5_HORDE_Level = Inst45Quest5_Level
Inst45Quest5_HORDE_Attain = Inst45Quest5_Attain
Inst45Quest5_HORDE_Aim = Inst45Quest5_Aim
Inst45Quest5_HORDE_Location = Inst45Quest5_Location
Inst45Quest5_HORDE_Note = Inst45Quest5_Note
Inst45Quest5_HORDE_Prequest = Inst45Quest5_Prequest
Inst45Quest5_HORDE_Folgequest = Inst45Quest5_Folgequest
--
Inst45Quest5name1_HORDE = Inst45Quest5name1



--------------- INST46 - Auchindoun: Sethekk Halls (Seth) ---------------

Inst46Story = "几千年来，德莱尼人将死者埋葬在他们最神圣的庙宇奥金顿之中.\n\n但是，暗影议会的成员潜入了奥金顿，准备召唤无比邪恶的恐怖生物。他们可耻的魔法造成了一场大爆炸，将庙宇炸的四分五裂，周围的地区也成为了一片焦土\n\n爆炸同时在虚空中切开了一条裂缝，将另一个世界的灵体带入了外域。以前被埋葬的德莱尼人无法安息的灵魂在废墟中游荡。而且，暗影议会召唤的恐惧生物就要突破暗影议会控制它的努力了.\n\n你必须防止它降临到这个世界中.\n\n奥金顿分为4个5人副本，64-66的法力坟墓，65-67的奥金尼地穴，67-69的塞泰克大厅和70-72的暗影迷宫."
Inst46Caption = "奥金顿：塞泰克大厅"
Inst46QAA = "5 个任务"
Inst46QAH = "5 个任务"
Inst46General = {
    {
    "黑暗编织者塞斯",
    "黑暗编织者塞斯本人是比较弱小的。这场战斗唯一需要注意的是每一召唤阶段（一共有三次：75%，50%和25%）。当黑暗编织者塞斯每次召唤手下时，暂时不要管boss，清理掉所有的元素生物。然后再把火力集中到boss身上。在元素出现时使用恐惧可以降低治疗压力。",
    RED .. "奥术/冰霜/火焰震击：" .. WHITE .. "每种都造成480 - 840点伤害。\n" .. RED .. "闪电链" .. WHITE .. ": 类似萨满的技能，对附近几个目标也造成伤害。\n" .. RED .. "近战攻击:" .. WHITE .. " 近战攻击可造成1000 - 1200暗影伤害。（暗影抗性和道具在这场战斗中对坦克比较有用）\n" .. RED .. "召唤元素:" .. WHITE .. " 每下降25%生命（指的是75%，50%和25%生命时），黑暗编织者塞斯会召唤4个元素生物（暗影，火，水和奥术）。它们的攻击一次造成700点左右伤害，但是可以被恐惧。",
    },

    {
    "利爪之王艾吉斯",
    "战斗时最好在中间tank  BOSS，这样在boss释放魔爆术的时候可以让所有人有充分的时间躲到柱子后面（注意一定要让柱子档住你和boss才能避免被魔爆术攻击到），boss释放魔爆术后tank及时把boss拉回中间。",
   RED .. "奥术爆炸:" .. WHITE .. " 在使用了闪现术之后，利爪之王艾吉斯马上开始施放奥术爆炸，施法时间5秒，法术范围40码，造成5000 - 6000伤害.\n" .. RED .. "奥术散射:" .. WHITE .. " AoE奥术箭（40码），造成1500 - 2000奥术伤害.\n" .. RED .. "变形术:" .. WHITE .. " 他会对随机队员施放变形术，持续5秒。法术可以被驱散，被变形的目标会回复生命值，所以最好在队友回满血的时候解除变羊效果。",
    },
    
     {
    "安苏",
    "开始召唤以后整个大厅会有很多鸟飞起来,很是壮观,接下来会有4个战鹰石像围绕着BOSS,它们会分别给BOSS下掉血的debuff,以及加自己攻击速度的buff. 法师在这里一定要节省蓝,BOSS在70%和40%左右血会变成无敌状态召唤小怪,大量非精英鸟,法师留蓝杀掉以后即可火力全开.\n\nBOSS会定期尖啸,打晕全体人.不过施法前会有施法条可观察,大约3秒反应时间,MT需要立刻打开防御饰品,治疗要套盾加好HOT.跟蜘蛛3有些类似. BOSS不碾压攻击在2200左右,所以血必须多于6000才是安全. ",
   RED .. "总体注意2点 法师留蓝 治疗不要OT",
    },
};

--Quest 1 Alliance
Inst46Quest1 = "1. 兄弟反目"
Inst46Quest1_Level = "69"
Inst46Quest1_Attain = "65"
Inst46Quest1_Aim = "进入塞泰克大厅，杀死黑暗编织者塞斯，然后解救被囚禁的拉卡。完成任务后向塞泰克大厅外的伊斯法尔复命。"
Inst46Quest1_Location = "伊斯法尔 (泰罗卡森林; "..YELLOW.."44,65"..WHITE..")"
Inst46Quest1_Note = "无"
Inst46Quest1_Prequest = "无"
Inst46Quest1_Folgequest = "无"
--
Inst46Quest1name1 = "塞泰克先知颈环"
Inst46Quest1name2 = "塞泰克神谕项链"
Inst46Quest1name3 = "利爪领主的项圈"
Inst46Quest1name4 = "乌鸦卫士印记"

--Quest 2 Alliance
Inst46Quest2 = "2. 泰罗克的传说"
Inst46Quest2_Level = "69"
Inst46Quest2_Attain = "65"
Inst46Quest2_Aim = "将泰罗克的面具、泰罗克的羽毛和泰罗克的传说交给塞泰克大厅外的伊斯法尔。"
Inst46Quest2_Location = "伊斯法尔(泰罗卡森林; "..YELLOW.."44,65"..WHITE..")"
Inst46Quest2_Note = "面具在 1, 书在 2, 羽毛在 3. 面具和羽毛是boss掉落, 书在地上."
Inst46Quest2_Prequest = "无"
Inst46Quest2_Folgequest = "无"
--
Inst46Quest2name1 = "泰罗克的传说"
Inst46Quest2name2 = "泰罗克的面具"
Inst46Quest2name3 = "泰罗克的羽毛"

--Quest 3 Alliance
Inst46Quest3 = "3. 消灭乌鸦之神 (德鲁伊 - 史诗飞行任务)"
Inst46Quest3_Level = "70"
Inst46Quest3_Attain = "70"
Inst46Quest3_Aim = "杀死乌鸦之神，然后向塞纳里奥庇护所的莫希斯·轻翼复命。"
Inst46Quest3_Location = "莫希斯·轻翼 (赞加沼泽 - 塞纳里奥庇护所; "..YELLOW.."80,65"..WHITE..")"
Inst46Quest3_Note = "这是德鲁伊史诗飞行形态任务的最后一步."
Inst46Quest3_Prequest = "有, 寻找月亮石"
Inst46Quest3_Folgequest = "No"
Inst46Quest3PreQuest = "true"
--
Inst46Quest3name1 = "Idol of the Raven Goddess"

--Quest 4 Alliance
Inst46Quest4 = "4. 卡琳娜的请求 (英雄模式)"
Inst46Quest4_Level = "70"
Inst46Quest4_Attain = "70"
Inst46Quest4_Aim = "从地狱火堡垒破碎大厅的高阶术士奈瑟库斯手中夺得暮色魔典，从奥金顿塞泰克大厅的黑暗编织者塞斯手中夺得忘却之名，将它们交给卡琳娜·拉瑟德."
Inst46Quest4_Location = "卡琳娜·拉瑟德 (虚空风暴 - 52区; "..YELLOW.."32,63"..WHITE..")"
Inst46Quest4_Note = "黑暗编织者赛斯 在 "..YELLOW.."[1]"..WHITE.."."
Inst46Quest4_Prequest = "有，同事的帮助 ("..YELLOW.."卡拉赞"..WHITE..")"
Inst46Quest4_Folgequest = "有，夜之魇 ("..YELLOW.."卡拉赞"..WHITE..")"
Inst46Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst46Quest5 = "5. 悬赏：艾吉斯的冠羽 (英雄日常)"
Inst46Quest5_Level = "70"
Inst46Quest5_Attain = "70"
Inst46Quest5_Aim = "商人扎雷姆要求你夺得艾吉斯的冠羽。将羽毛带回沙塔斯城的贫民窟交给他，就能领取奖赏."
Inst46Quest5_Location = "商人扎雷姆 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst46Quest5_Note = "利爪之王艾吉斯 在 "..YELLOW.."[3]"..WHITE.."."
Inst46Quest5_Prequest = "无"
Inst46Quest5_Folgequest = "无"
--
Inst46Quest5name1 = "公正徽章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst46Quest1_HORDE = Inst46Quest1
Inst46Quest1_HORDE_Level = Inst46Quest1_Level
Inst46Quest1_HORDE_Attain = Inst46Quest1_Attain
Inst46Quest1_HORDE_Aim = Inst46Quest1_Aim
Inst46Quest1_HORDE_Location = Inst46Quest1_Location
Inst46Quest1_HORDE_Note = Inst46Quest1_Note
Inst46Quest1_HORDE_Prequest = Inst46Quest1_Prequest
Inst46Quest1_HORDE_Folgequest = Inst46Quest1_Folgequest
--
Inst46Quest1name1_HORDE = Inst46Quest1name1
Inst46Quest1name2_HORDE = Inst46Quest1name2
Inst46Quest1name3_HORDE = Inst46Quest1name3
Inst46Quest1name4_HORDE = Inst46Quest1name4

--Quest2 Horde  (same as Quest 2 Alliance)
Inst46Quest2_HORDE = Inst46Quest2
Inst46Quest2_HORDE_Level = Inst46Quest2_Level
Inst46Quest2_HORDE_Attain = Inst46Quest2_Attain
Inst46Quest2_HORDE_Aim = Inst46Quest2_Aim
Inst46Quest2_HORDE_Location = Inst46Quest2_Location
Inst46Quest2_HORDE_Note = Inst46Quest2_Note
Inst46Quest2_HORDE_Prequest = Inst46Quest2_Prequest
Inst46Quest2_HORDE_Folgequest = Inst46Quest2_Folgequest
--
Inst46Quest2name1_HORDE = Inst46Quest2name1
Inst46Quest2name2_HORDE = Inst46Quest2name2
Inst46Quest2name3_HORDE = Inst46Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst46Quest3_HORDE = Inst46Quest3
Inst46Quest3_HORDE_Level = Inst46Quest3_Level
Inst46Quest3_HORDE_Attain = Inst46Quest3_Attain
Inst46Quest3_HORDE_Aim = Inst46Quest3_Aim
Inst46Quest3_HORDE_Location = Inst46Quest3_Location
Inst46Quest3_HORDE_Note = Inst46Quest3_Note
Inst46Quest3_HORDE_Prequest = Inst46Quest3_Prequest
Inst46Quest3_HORDE_Folgequest = Inst46Quest3_Folgequest
Inst46Quest3PreQuest_HORDE = Inst46Quest3PreQuest
--
Inst46Quest3name1_HORDE = Inst46Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst46Quest4_HORDE = Inst46Quest4
Inst46Quest4_HORDE_Level = Inst46Quest4_Level
Inst46Quest4_HORDE_Attain = Inst46Quest4_Attain
Inst46Quest4_HORDE_Aim = Inst46Quest4_Aim
Inst46Quest4_HORDE_Location = Inst46Quest4_Location
Inst46Quest4_HORDE_Note = Inst46Quest4_Note
Inst46Quest4_HORDE_Prequest = Inst46Quest4_Prequest
Inst46Quest4_HORDE_Folgequest = Inst46Quest4_Folgequest
Inst46Quest4PreQuest_HORDE = Inst46Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst46Quest5_HORDE = Inst46Quest5
Inst46Quest5_HORDE_Level = Inst46Quest5_Level
Inst46Quest5_HORDE_Attain = Inst46Quest5_Attain
Inst46Quest5_HORDE_Aim = Inst46Quest5_Aim
Inst46Quest5_HORDE_Location = Inst46Quest5_Location
Inst46Quest5_HORDE_Note = Inst46Quest5_Note
Inst46Quest5_HORDE_Prequest = Inst46Quest5_Prequest
Inst46Quest5_HORDE_Folgequest = Inst46Quest5_Folgequest
--
Inst46Quest5name1_HORDE = Inst46Quest5name1



--------------- INST47 - Auchindoun: Shadow Labyrinth (SLabs) ---------------

Inst47Story = "几千年来，德莱尼人将死者埋葬在他们最神圣的庙宇奥金顿之中.\n\n但是，暗影议会的成员潜入了奥金顿，准备召唤无比邪恶的恐怖生物。他们可耻的魔法造成了一场大爆炸，将庙宇炸的四分五裂，周围的地区也成为了一片焦土\n\n爆炸同时在虚空中切开了一条裂缝，将另一个世界的灵体带入了外域。以前被埋葬的德莱尼人无法安息的灵魂在废墟中游荡。而且，暗影议会召唤的恐惧生物就要突破暗影议会控制它的努力了.\n\n你必须防止它降临到这个世界中.\n\n奥金顿分为4个5人副本，64-66的法力坟墓，65-67的奥金尼地穴，67-69的塞泰克大厅和70-72的暗影迷宫."
Inst47Caption = "奥金顿：暗影迷宫"
Inst47QAA = "11 个任务"
Inst47QAH = "11 个任务"
Inst47General = {
    {
    "赫尔默大使",
    "这个boss主要有2种技能。恐惧技能的冷却时间是30秒钟，酸性呼吸技能可以降低护甲。他是普通的坦克/dps战斗，坦克需要切换姿态来避免恐惧。每个队员都需要被恐惧到，因为未被恐惧的队员将成为他的目标。",
    RED .. "AoE恐惧：" .. WHITE .. "40码范围内所有玩家被恐惧5秒。\n" .. RED .. "腐蚀酸箭" .. WHITE .. ": 在他正前方圆锥形范围内放射出酸性云，降低护甲值4000 - 5000点，每5秒造成1100 - 1500点自然伤害，持续30秒。",
    },

    {
    "煽动者布莱卡特",
    "这个boss有些麻烦。首先你必须清空所有的小怪，否则boss会召唤他们来帮忙。他有3个主要技能。有一个大范围的AoE击退，会清除仇恨，随机冲锋某一个队员，以及控制所有的队员让玩家自相攻击。在房间的中间坦克他。其他队伍成员背靠柱子/角落站立，以免被击退的过远。关键是队员要站立得分散，在boss进行心灵控制时不会进行太多的内战。",
   RED .. "冲锋:" .. WHITE .. " 对随机目标冲锋，造成300 - 500点伤害.\n" .. RED .. "制造混乱:" .. WHITE .. " 该技能会控制所有队员15秒（不可抵抗/驱散）。同时会清空煽动者布莱卡特的仇恨列表。.\n" .. RED .. "战争践踏:" .. WHITE .. " AoE击退，造成1000 - 2000伤害，同时清除仇恨。",
    },

    {
    "沃匹尔大师",
    "当BOSS喊话的时候，会随机从地上5个召唤法阵（BOSS平台背后还有一个，一般没人注意到）出现一个虚空旅者，每个2500HP，当元素怪靠近BOSS后，会释放AOE暗影冲击并为BOSS回部分血。所以我们采取的战术，在BOSS前2次传送前，所有DPS主要击杀虚空旅者，当MT被放逐后立即驱散。在2次传送完后，虚空旅者的刷新速度会大大加快，这时候需要MT将BOSS拉着到处跑，尽量远离虚空旅者，而其他控制职业，如FS、LR等这时候尽量在DPS的同时控制住大量的虚空旅者，直到BOSS被击杀。",
   RED .. "群体暗影箭：" .. WHITE .. " 800-1000暗影伤害 。\n" .. RED .. "放逐术：" .. WHITE .. " 无视仇恨随机放逐一个目标，可驱散 .\n" .. RED .. "暗影牵制:" .. WHITE .. " BOSS回到台子上并将所有玩家传送至平台，在平台释放火焰之雨，每3秒2000火焰伤害 .",
    },
    
    {
    "摩摩尔",
    "首先，摩摩尔的仇恨视野很小，你可以在他周围站好位置。这可以让摩摩尔之触技能只影响到一个玩家。（与加顿男爵的技能相似，你可以靠近墙壁减少跌落伤害）。战斗的关键是让坦克一直保持在近战范围内，不然摩摩尔的共鸣技能会造成灭团。在每一次摩摩尔施放音速爆破时，所有玩家除了坦克要远离boss。在这之前注意让坦克保持满血，因为他会受到巨大伤害。",
   RED .. "摩摩尔之触：" .. WHITE .. " 15秒的debuff，当倒数15秒满时，队员将爆发造成2000 - 3000点自然伤害，同时沉默5秒。\n" .. RED .. "音速爆破：" .. WHITE .. " 当漠漠做出动作：‘摩摩尔从空气中集中能量。。。’时，他会对附近的敌人施放5000 - 8000自然伤害的AoE效果，同时在接下来的9秒之内还会受到持续性自然伤害。受到该技能影响的玩家移动速度下降90%.\n" .. RED .. "共鸣:" .. WHITE .. " 如果摩摩尔的近战范围内没有人，那么他会对队伍施放引导法术，造成2000点自然伤害，并且在45秒内受到的自然伤害提高2000点.",
    },
};

--Quest 1 Alliance
Inst47Quest1 = "1. 寻找间谍托古恩"
Inst47Quest1_Level = "70"
Inst47Quest1_Attain = "68"
Inst47Quest1_Aim = "进入奥金顿的暗影迷宫，寻找间谍托古恩的下落。."
Inst47Quest1_Location = "间谍格利克萨 (泰罗卡森林; "..YELLOW.."40,72"..WHITE..")"
Inst47Quest1_Note = "托古恩 在 "..YELLOW.."[1]"..WHITE..", "
Inst47Quest1_Prequest = "无"
Inst47Quest1_Folgequest = "有, 灵魂装置"
-- No Rewards for this quest

--Quest 2 Alliance
Inst47Quest2 = "2. 灵魂装置"
Inst47Quest2_Level = "70"
Inst47Quest2_Attain = "68"
Inst47Quest2_Aim = "偷取5个灵魂装置，将它们交给沙塔斯城圣光广场的间谍女王梅丽萨·海克隆。"
Inst47Quest2_Location = "托古恩 (暗影迷宫; "..YELLOW.."[1]"..WHITE..")"
Inst47Quest2_Note = "间谍女王梅丽萨·海克隆 (沙塔斯城; "..YELLOW.."51,45"..WHITE..")"
Inst47Quest2_Prequest = "有，寻找间谍托古恩"
Inst47Quest2_Folgequest = "无"
Inst47Quest2FQuest = "true"
--
Inst47Quest2name1 = "沙塔斯裹腕"
Inst47Quest2name2 = "间谍女王的护腕"
Inst47Quest2name3 = "奥金尼护腕"
Inst47Quest2name4 = "沙塔尔精炼臂甲"

--Quest 3 Alliance
Inst47Quest3 = "3. 恶魔名册"
Inst47Quest3_Level = "70"
Inst47Quest3_Attain = "68"
Inst47Quest3_Aim = "进入奥金顿的暗影迷宫，从煽动者布莱卡特手中夺得恶魔名册。完成任务后返回纳格兰向奥图里斯复命。"
Inst47Quest3_Location = "受难者奥图里斯 (纳格兰; "..YELLOW.."27,43"..WHITE..")"
Inst47Quest3_Note = "这个是影月谷连续任务的最后一步，起始NPC 奥尔多在在影月谷（61 28），占星者在影月谷（55 58）"
Inst47Quest3_Prequest = "有,伊利丹的手下"
Inst47Quest3_Folgequest = "有，回报奥尔多 或 回报占星者"
-- No Rewards for this quest

--Quest 4 Alliance
Inst47Quest4 = "4. 奥金顿的麻烦"
Inst47Quest4_Level = "70"
Inst47Quest4_Attain = "68"
Inst47Quest4_Aim = "前往泰罗卡森林的奥金顿，向暗影迷宫入口处的战地指挥官玛弗恩报到."
Inst47Quest4_Location = "间谍女王梅丽萨·海克隆 (沙塔斯城; "..YELLOW.."51,45"..WHITE..")"
Inst47Quest4_Note = "None"
Inst47Quest4_Prequest = "无"
Inst47Quest4_Folgequest = "有，鲜血法典"
-- No Rewards for this quest

--Quest 5 Alliance
Inst47Quest5 = "5. 鲜血法典"
Inst47Quest5_Level = "70"
Inst47Quest5_Attain = "68"
Inst47Quest5_Aim = "阅读奥金顿暗影迷宫中的鲜血法典."
Inst47Quest5_Location = "战地指挥官玛弗恩 (泰罗卡森林; "..YELLOW.."40,72"..WHITE..")"
Inst47Quest5_Note = "鲜血之书就在沃匹尔大师的前面"
Inst47Quest5_Prequest = "有, 奥金顿的麻烦"
Inst47Quest5_Folgequest = "有, 深入迷宫"
Inst47Quest5FQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst47Quest6 = "6. 深入迷宫"
Inst47Quest6_Level = "70"
Inst47Quest6_Attain = "68"
Inst47Quest6_Aim = "杀死摩摩尔，然后返回沙塔斯城的圣光广场，将暗影迷宫的秘密告诉间谍女王梅丽萨·海克隆."
Inst47Quest6_Location = "鲜血法典(暗影迷宫; "..YELLOW.."[4]"..WHITE..")"
Inst47Quest6_Note = "间谍女王梅丽萨·海克隆 (沙塔斯城; "..YELLOW.."51,45"..WHITE..")"
Inst47Quest6_Prequest = "有，鲜血法典"
Inst47Quest6_Folgequest = "无"
Inst47Quest6FQuest = "true"
--
Inst47Quest6name1 = "沙塔斯软靴"
Inst47Quest6name2 = "间谍女王的长靴"
Inst47Quest6name3 = "奥金尼长靴"
Inst47Quest6name4 = "沙塔尔精炼护胫"

--Quest 7 Alliance
Inst47Quest7 = "7. 纳鲁的试炼：力量 (英雄模式)"
Inst47Quest7_Level = "70"
Inst47Quest7_Attain = "70"
Inst47Quest7_Aim = "沙塔斯城的阿达尔要求你取回卡利瑟里斯的三叉戟和摩摩尔的精华。\n\n该任务必须在英雄等级难度的地下城中完成。."
Inst47Quest7_Location = "阿达尔 (沙塔斯城; "..YELLOW.."53,43"..WHITE..")"
Inst47Quest7_Note = "卡利瑟里斯的三叉戟出自英雄难度的蒸汽地窟."
Inst47Quest7_Prequest = "无"
Inst47Quest7_Folgequest = "无"
-- No Rewards for this quest

--Quest 8 Alliance
Inst47Quest8 = "8. 卡拉赞的钥匙"
Inst47Quest8_Level = "70"
Inst47Quest8_Attain = "68"
Inst47Quest8_Aim = "卡德加要求你进入奥金顿的暗影迷宫中，回收储藏在那里的一个奥术容器中的第一块钥匙碎片."
Inst47Quest8_Location = "卡德加 (沙塔斯城; "..YELLOW.."54,44"..WHITE..")"
Inst47Quest8_Note = "这是卡拉赞钥匙任务链的一个，其余2个出自蒸汽地窟和禁魔监狱."
Inst47Quest8_Prequest = "有，卡德加"
Inst47Quest8_Folgequest = "有，卡拉赞的钥匙"
Inst47Quest8PreQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst47Quest9 = "9. 魔语辞典"
Inst47Quest9_Level = "69"
Inst47Quest9_Attain = "67"
Inst47Quest9_Aim = "从沃匹尔大师手中夺得魔语辞典，将它交给韦恩的避难所的戴维·韦恩."
Inst47Quest9_Location = "戴维·韦恩 (泰罗卡森林; "..YELLOW.."78,39"..WHITE..")."
Inst47Quest9_Note = "沃匹尔大师 在 "..YELLOW.."[4]"..WHITE.."."
Inst47Quest9_Prequest = "有, 其它的材料"
Inst47Quest9_Folgequest = "无"
Inst47Quest9PreQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst47Quest10 = "10. 悬赏：摩摩尔的低语 (英雄日常)"
Inst47Quest10_Level = "70"
Inst47Quest10_Attain = "70"
Inst47Quest10_Aim = "商人扎雷姆要求你夺得摩摩尔的低语。将这件器物带回沙塔斯城的贫民窟交给他，就能领取奖赏."
Inst47Quest10_Location = "商人扎雷姆 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst47Quest10_Note = "This daily quest can only be completed on Heroic difficulty.\n\nMurmur is at "..YELLOW.."[5]"..WHITE.."."
Inst47Quest10_Prequest = "无"
Inst47Quest10_Folgequest = "无"
--
Inst47Quest10name1 = "公正徽章"

--Quest 11 Alliance
Inst47Quest11 = "11. 悬赏：恶毒导师 (普通日常)"
Inst47Quest11_Level = "70"
Inst47Quest11_Attain = "70"
Inst47Quest11_Aim = "虚空猎手玛哈杜恩要求你杀死3名恶毒导师。完成任务后返回沙塔斯城的贫民窟，找他领取奖赏."
Inst47Quest11_Location = "虚空猎手玛哈杜恩 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst47Quest11_Note = "普通日常任务."
Inst47Quest11_Prequest = "No"
Inst47Quest11_Folgequest = "No"
--
Inst47Quest11name1 = "Ethereum Prison Key"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst47Quest1_HORDE = Inst47Quest1
Inst47Quest1_HORDE_Level = Inst47Quest1_Level
Inst47Quest1_HORDE_Attain = Inst47Quest1_Attain
Inst47Quest1_HORDE_Aim = Inst47Quest1_Aim
Inst47Quest1_HORDE_Location = Inst47Quest1_Location
Inst47Quest1_HORDE_Note = Inst47Quest1_Note
Inst47Quest1_HORDE_Prequest = Inst47Quest1_Prequest
Inst47Quest1_HORDE_Folgequest = Inst47Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst47Quest2_HORDE = Inst47Quest2
Inst47Quest2_HORDE_Level = Inst47Quest2_Level
Inst47Quest2_HORDE_Attain = Inst47Quest2_Attain
Inst47Quest2_HORDE_Aim = Inst47Quest2_Aim
Inst47Quest2_HORDE_Location = Inst47Quest2_Location
Inst47Quest2_HORDE_Note = Inst47Quest2_Note
Inst47Quest2_HORDE_Prequest = Inst47Quest2_Prequest
Inst47Quest2_HORDE_Folgequest = Inst47Quest2_Folgequest
Inst47Quest2FQuest_HORDE = Inst47Quest2FQuest
--
Inst47Quest2name1_HORDE = Inst47Quest2name1
Inst47Quest2name2_HORDE = Inst47Quest2name2
Inst47Quest2name3_HORDE = Inst47Quest2name3
Inst47Quest2name4_HORDE = Inst47Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst47Quest3_HORDE = Inst47Quest3
Inst47Quest3_HORDE_Level = Inst47Quest3_Level
Inst47Quest3_HORDE_Attain = Inst47Quest3_Attain
Inst47Quest3_HORDE_Aim = Inst47Quest3_Aim
Inst47Quest3_HORDE_Location = Inst47Quest3_Location
Inst47Quest3_HORDE_Note = Inst47Quest3_Note
Inst47Quest3_HORDE_Prequest = Inst47Quest3_Prequest
Inst47Quest3_HORDE_Folgequest = Inst47Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst47Quest4_HORDE = Inst47Quest4
Inst47Quest4_HORDE_Level = Inst47Quest4_Level
Inst47Quest4_HORDE_Attain = Inst47Quest4_Attain
Inst47Quest4_HORDE_Aim = Inst47Quest4_Aim
Inst47Quest4_HORDE_Location = Inst47Quest4_Location
Inst47Quest4_HORDE_Note = Inst47Quest4_Note
Inst47Quest4_HORDE_Prequest = Inst47Quest4_Prequest
Inst47Quest4_HORDE_Folgequest = Inst47Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst47Quest5_HORDE = Inst47Quest5
Inst47Quest5_HORDE_Level = Inst47Quest5_Level
Inst47Quest5_HORDE_Attain = Inst47Quest5_Attain
Inst47Quest5_HORDE_Aim = Inst47Quest5_Aim
Inst47Quest5_HORDE_Location = Inst47Quest5_Location
Inst47Quest5_HORDE_Note = Inst47Quest5_Note
Inst47Quest5_HORDE_Prequest = Inst47Quest5_Prequest
Inst47Quest5_HORDE_Folgequest = Inst47Quest5_Folgequest
Inst47Quest5FQuest_HORDE = Inst47Quest5FQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst47Quest6_HORDE = Inst47Quest6
Inst47Quest6_HORDE_Level = Inst47Quest6_Level
Inst47Quest6_HORDE_Attain = Inst47Quest6_Attain
Inst47Quest6_HORDE_Aim = Inst47Quest6_Aim
Inst47Quest6_HORDE_Location = Inst47Quest6_Location
Inst47Quest6_HORDE_Note = Inst47Quest6_Note
Inst47Quest6_HORDE_Prequest = Inst47Quest6_Prequest
Inst47Quest6_HORDE_Folgequest = Inst47Quest6_Folgequest
Inst47Quest6FQuest_HORDE = Inst47Quest6FQuest
--
Inst47Quest6name1_HORDE = Inst47Quest6name1
Inst47Quest6name2_HORDE = Inst47Quest6name2
Inst47Quest6name3_HORDE = Inst47Quest6name3
Inst47Quest6name4_HORDE = Inst47Quest6name4

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst47Quest7_HORDE = Inst47Quest7
Inst47Quest7_HORDE_Level = Inst47Quest7_Level
Inst47Quest7_HORDE_Attain = Inst47Quest7_Attain
Inst47Quest7_HORDE_Aim = Inst47Quest7_Aim
Inst47Quest7_HORDE_Location = Inst47Quest7_Location
Inst47Quest7_HORDE_Note = Inst47Quest7_Note
Inst47Quest7_HORDE_Prequest = Inst47Quest7_Prequest
Inst47Quest7_HORDE_Folgequest = Inst47Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst47Quest8_HORDE = Inst47Quest8
Inst47Quest8_HORDE_Level = Inst47Quest8_Level
Inst47Quest8_HORDE_Attain = Inst47Quest8_Attain
Inst47Quest8_HORDE_Aim = Inst47Quest8_Aim
Inst47Quest8_HORDE_Location = Inst47Quest8_Location
Inst47Quest8_HORDE_Note = Inst47Quest8_Note
Inst47Quest8_HORDE_Prequest = Inst47Quest8_Prequest
Inst47Quest8_HORDE_Folgequest = Inst47Quest8_Folgequest
Inst47Quest8PreQuest_HORDE = Inst47Quest8PreQuest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst47Quest9_HORDE = Inst47Quest9
Inst47Quest9_HORDE_Level = Inst47Quest9_Level
Inst47Quest9_HORDE_Attain = Inst47Quest9_Attain
Inst47Quest9_HORDE_Aim = Inst47Quest9_Aim
Inst47Quest9_HORDE_Location = Inst47Quest9_Location
Inst47Quest9_HORDE_Note = Inst47Quest9_Note
Inst47Quest9_HORDE_Prequest = Inst47Quest9_Prequest
Inst47Quest9_HORDE_Folgequest = Inst47Quest9_Folgequest
Inst47Quest9PreQuest_HORDE = Inst47Quest8PreQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst47Quest10_HORDE = Inst47Quest10
Inst47Quest10_HORDE_Level = Inst47Quest10_Level
Inst47Quest10_HORDE_Attain = Inst47Quest10_Attain
Inst47Quest10_HORDE_Aim = Inst47Quest10_Aim
Inst47Quest10_HORDE_Location = Inst47Quest10_Location
Inst47Quest10_HORDE_Note = Inst47Quest10_Note
Inst47Quest10_HORDE_Prequest = Inst47Quest10_Prequest
Inst47Quest10_HORDE_Folgequest = Inst47Quest10_Folgequest
--
Inst47Quest10name1_HORDE = Inst47Quest10name1

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst47Quest11_HORDE = Inst47Quest11
Inst47Quest11_HORDE_Level = Inst47Quest11_Level
Inst47Quest11_HORDE_Attain = Inst47Quest11_Attain
Inst47Quest11_HORDE_Aim = Inst47Quest11_Aim
Inst47Quest11_HORDE_Location = Inst47Quest11_Location
Inst47Quest11_HORDE_Note = Inst47Quest11_Note
Inst47Quest11_HORDE_Prequest = Inst47Quest11_Prequest
Inst47Quest11_HORDE_Folgequest = Inst47Quest11_Folgequest
--
Inst47Quest11name1_HORDE = Inst47Quest11name1



--------------- INST48 - CR: Serpentshrine Cavern (SSC) ---------------

Inst48Story = "赞加沼泽微妙的生态平衡已经被破坏了。\n\n非自然的现象正在腐蚀和破坏沼泽原生的动植物。\n\n骚乱的源头来自于给人不安预感的盘牙水库。\n\n传闻这一神秘建筑物的所有人不是别人，正是臭名昭著的瓦斯琪女士。\n\n在一切变得太迟之前，只有你能够揭发她的恶毒计划并阻止她和她的手下！\n\n盘牙水库分为4个部分，3个5人副本（奴隶围栏，幽暗沼泽，蒸汽地窟）和一个25人团队副本（毒蛇神殿） "
Inst48Caption = "盘牙水库：毒蛇神殿"
Inst48QAA = "2 个任务"
Inst48QAH = "2 个任务"

--Quest 1 Alliance
Inst48Quest1 = "1. 永恒水瓶"
Inst48Quest1_Level = "70"
Inst48Quest1_Attain = "70"
Inst48Quest1_Aim = "时光之穴的索莉多米要你从盘牙水库的瓦丝琪那里取回瓦丝琪的水瓶残余，并从风暴要塞的凯尔萨斯·逐日者那里取回凯尔萨斯的水瓶残余."
Inst48Quest1_Location = "索莉多米 (塔纳利斯--时光之穴; "..YELLOW.."58,57"..WHITE.."). NPC会在附近游荡."
Inst48Quest1_Note = "要进去时光之穴--海加尔之战，这个任务是必须完成的. 瓦丝琪 在 "..YELLOW.."[6]"..WHITE.."."
Inst48Quest1_Prequest = "无"
Inst48Quest1_Folgequest = "无"
-- No Rewards for this quest

--Quest 2 Alliance
Inst48Quest2 = "2. 危险的秘密"
Inst48Quest2_Level = "70"
Inst48Quest2_Attain = "70"
Inst48Quest2_Aim = "前往影月谷内的守望者牢笼，与阿卡玛谈一谈."
Inst48Quest2_Location = "先知奥鲁姆 (毒蛇神殿; "..YELLOW.."[4]"..WHITE..")"
Inst48Quest2_Note = "阿卡玛 在 (影月谷 - 守望者的牢笼; "..YELLOW.."58,48"..WHITE..").\n\n这个任务是曾经黑暗神殿开门任务的一部分，奥尔多声望可以从 学者希拉 (影月谷 - 奥尔多祭坛; "..YELLOW.."62,38"..WHITE..")接到，占星者声望可以从 奥术师塞里斯 (影月谷 - 群星圣殿; "..YELLOW.."56,59"..WHITE..") 接到."
Inst48Quest2_Prequest = "有, 巴尔里石板 -> 阿卡玛的保证"
Inst48Quest2_Folgequest = "有, 灰舌的计谋 ("..YELLOW.."风暴要塞-风暴之眼"..WHITE..")"
Inst48Quest2PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst48Quest1_HORDE = Inst48Quest1
Inst48Quest1_HORDE_Level = Inst48Quest1_Level
Inst48Quest1_HORDE_Attain = Inst48Quest1_Attain
Inst48Quest1_HORDE_Aim = Inst48Quest1_Aim
Inst48Quest1_HORDE_Location = Inst48Quest1_Location
Inst48Quest1_HORDE_Note = Inst48Quest1_Note
Inst48Quest1_HORDE_Prequest = Inst48Quest1_Prequest
Inst48Quest1_HORDE_Folgequest = Inst48Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst48Quest2_HORDE = Inst48Quest2
Inst48Quest2_HORDE_Level = Inst48Quest2_Level
Inst48Quest2_HORDE_Attain = Inst48Quest2_Attain
Inst48Quest2_HORDE_Aim = Inst48Quest2_Aim
Inst48Quest2_HORDE_Location = Inst48Quest2_Location
Inst48Quest2_HORDE_Note = Inst48Quest2_Note
Inst48Quest2_HORDE_Prequest = Inst48Quest2_Prequest
Inst48Quest2_HORDE_Folgequest = Inst48Quest2_Folgequest
Inst48Quest2PreQuest_HORDE = Inst48Quest2PreQuest
-- No Rewards for this quest



--------------- INST49 - CoT: Black Morass (BM) ---------------

Inst49Story = "麦迪文，最后的魔法守护者，出生时就被邪恶的泰坦萨格拉斯附身.\n\n是麦迪文第一个联络上了邪恶术士古尔丹并为燃烧军团的入侵提供帮助。\n\n他们一起协力打开了黑暗之门，连通了德拉诺和艾泽拉斯，无数嗜血的兽人疯狂涌入妄图毁灭这个世界。\n\n这个副本设计是在黑暗沼泽，也就是现在的诅咒之地。玩家们需要在麦迪文打开黑暗之门的过程中保护他"
Inst49Caption = "时光之穴：黑暗沼泽"
Inst49QAA = "7 个任务"
Inst49QAH = "7 个任务"
Inst49General = {
    {
    "时空领主德亚",
    "就像其他由裂隙守护者或裂隙领主守卫着的传送门一样，时空领主德亚的传送门也会不断产生无限龙。根据你的队伍结构，你可以暂时无视它们，首先击杀boss再干掉龙类，你也可以在它们刷新的同时对付它们（如果你认为它们对麦迪文的威胁太大）。如果你想要优先对付boss，你必须随时驱散你的队员身上的时间流逝状态，因为你需要提高你的dps速度。",
    RED .. "时间流逝" .. WHITE .. "降低玩家攻击速度60％，移动速度60％，持续10秒，可以被驱散。\n" .. RED .. "致死打击" .. WHITE .. ": 对目标造成武器伤害外加若干伤害，减少治疗效果50％，持续10秒。\n" .. RED .. "战争践踏:" .. WHITE .. " 对附近目标造成通常攻击伤害外加500点伤害，将它们击退，并击晕2秒。",
    },

    {
    "坦普卢斯",
    "坦普卢斯的debuff可以在坦克身上堆积很多层，这样你的治疗的法力会不足以保持坦克生存。一个应对的方法是让坦克在身上的debuff堆积了4层之后开始风筝boss，同时也需要回头对boss远程攻击以保持仇恨。还有一个方法是使用2个坦克，轮流获得boss的仇恨。",
   RED .. "致死伤害:" .. WHITE .. " 治疗效果降低10％，最多可堆积10次.",
    },

    {
    "埃欧努斯",
    "最后的boss是名为埃欧努斯的无限龙。他的攻击力很强。这里最危险的部分是他的时间停止技能发动时，每个人都不能行动或施法。治疗需要不断的更新坦克身上的hot效果。当时间停止效果消失后，马上向坦克身上套盾，并且使用其他大治疗技能恢复。它死亡之后裂隙就会关闭，麦迪文会说出最后的台词。",
   RED .. "时间停止:" .. WHITE .. "AoE击晕（50码距离），持续5－8秒。",
    },
};

--Quest 1 Alliance
Inst49Quest1 = "1. 黑色沼泽"
Inst49Quest1_Level = "70"
Inst49Quest1_Attain = "66"
Inst49Quest1_Aim = "深入时光之穴，前往正在发生黑暗之门开启这一历史事件的黑色沼泽，与萨艾特谈一谈."
Inst49Quest1_Location = "Andormu (Tanaris; "..YELLOW.."58,54"..WHITE..")"
Inst49Quest1_Note = "必先提前完成逃离敦霍尔德任务，萨艾特就在副本门口进去一点点."
Inst49Quest1_Prequest = "无"
Inst49Quest1_Folgequest = "有，开启黑暗之门"
-- No Rewards for this quest

--Quest 2 Alliance
Inst49Quest2 = "2. 开启黑暗之门"
Inst49Quest2_Level = "70"
Inst49Quest2_Attain = "66"
Inst49Quest2_Aim = "时光之穴黑色沼泽的萨艾特要求你保护麦迪文，直到他成功开启黑暗之门。\n\n任务完成后向萨艾特复命。"
Inst49Quest2_Location = "萨艾特 (黑暗沼泽 "..YELLOW.."入口"..WHITE..")"
Inst49Quest2_Note = "如果你半途失败了."
Inst49Quest2_Prequest = "有, 黑暗沼泽"
Inst49Quest2_Folgequest = "有, 龙族的英雄"
Inst49Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst49Quest3 = "3. 龙族的英雄"
Inst49Quest3_Level = "70"
Inst49Quest3_Attain = "66"
Inst49Quest3_Aim = "返回塔纳利斯沙漠的时光之穴，向幼时的安多尔姆复命."
Inst49Quest3_Location = "安多尔姆 (塔纳利斯; "..YELLOW.."58,54"..WHITE..")"
Inst49Quest3_Note = ""
Inst49Quest3_Prequest = "有，开启黑暗之门"
Inst49Quest3_Folgequest = "无"
Inst49Quest3FQuest = "true"
--
Inst49Quest3name1 = "Band of the Guardian"
Inst49Quest3name2 = "Keeper's Ring of Piety"
Inst49Quest3name3 = "Time-bending Gem"
Inst49Quest3name4 = "Andormu's Tear"

--Quest 4 Alliance
Inst49Quest4 = "4. 麦迪文的触摸"
Inst49Quest4_Level = "70"
Inst49Quest4_Attain = "69"
Inst49Quest4_Aim = "进入时光之穴，说服麦迪文让复原的学徒钥匙重新获得打开卡拉赞大门的能力。"
Inst49Quest4_Location = "卡德加 (沙塔斯城; "..YELLOW.."54,44"..WHITE..")"
Inst49Quest4_Note = "杀死第18波boss埃欧努斯死后，你才能在副本中与麦迪文对话."
Inst49Quest4_Prequest = "有，第二块和第三块"
Inst49Quest4_Folgequest = "有，返回卡德加身边"
Inst49Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst49Quest5 = "5. 药剂大师 (炼金术)"
Inst49Quest5_Level = "70"
Inst49Quest5_Attain = "68"
Inst49Quest5_Aim = "去时光之穴的黑暗沼泽，从裂隙守卫者和裂隙领主身上收集10份永恒精华，同时将5瓶特效防御药剂，5瓶掌控药剂，5瓶特效敏捷药剂一同交给沙塔斯城的罗罗基姆."
Inst49Quest5_Location = "罗罗基姆 (沙塔斯城 - 贫民窟; "..YELLOW.."46,23"..WHITE..")"
Inst49Quest5_Note = ""
Inst49Quest5_Prequest = "有, 药剂大师"
Inst49Quest5_Folgequest = "无"
Inst49Quest5PreQuest = "有"
-- No Rewards for this quest

--Quest 6 Alliance
Inst49Quest6 = "6. 悬赏：埃欧努斯的沙漏 (英雄日常)"
Inst49Quest6_Level = "70"
Inst49Quest6_Attain = "70"
Inst49Quest6_Aim = "商人扎雷姆要求你夺得埃欧努斯的沙漏。将沙漏带回沙塔斯城的贫民窟交给他，就能领取奖赏."
Inst49Quest6_Location = "商人扎雷姆 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst49Quest6_Note = "埃欧努斯 就是最后一波的boss."
Inst49Quest6_Prequest = "无"
Inst49Quest6_Folgequest = "无"
--
Inst49Quest6name1 = "公正徽章"

--Quest 7 Alliance
Inst49Quest7 = "7. 悬赏：裂隙领主 (普通日常)"
Inst49Quest7_Level = "70"
Inst49Quest7_Attain = "70"
Inst49Quest7_Aim = "虚空猎手玛哈杜恩要求你杀死4名裂隙领主。完成任务后返回沙塔斯城的贫民窟，找他领取奖赏。"
Inst49Quest7_Location = "虚空猎手玛哈杜恩 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst49Quest7_Note = "普通日常任务."
Inst49Quest7_Prequest = "No"
Inst49Quest7_Folgequest = "No"
--
Inst49Quest7name1 = "公正徽章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst49Quest1_HORDE = Inst49Quest1
Inst49Quest1_HORDE_Level = Inst49Quest1_Level
Inst49Quest1_HORDE_Attain = Inst49Quest1_Attain
Inst49Quest1_HORDE_Aim = Inst49Quest1_Aim
Inst49Quest1_HORDE_Location = Inst49Quest1_Location
Inst49Quest1_HORDE_Note = Inst49Quest1_Note
Inst49Quest1_HORDE_Prequest = Inst49Quest1_Prequest
Inst49Quest1_HORDE_Folgequest = Inst49Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst49Quest2_HORDE = Inst49Quest2
Inst49Quest2_HORDE_Level = Inst49Quest2_Level
Inst49Quest2_HORDE_Attain = Inst49Quest2_Attain
Inst49Quest2_HORDE_Aim = Inst49Quest2_Aim
Inst49Quest2_HORDE_Location = Inst49Quest2_Location
Inst49Quest2_HORDE_Note = Inst49Quest2_Note
Inst49Quest2_HORDE_Prequest = Inst49Quest2_Prequest
Inst49Quest2_HORDE_Folgequest = Inst49Quest2_Folgequest
Inst49Quest2FQuest_HORDE = Inst49Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst49Quest3_HORDE = Inst49Quest3
Inst49Quest3_HORDE_Level = Inst49Quest3_Level
Inst49Quest3_HORDE_Attain = Inst49Quest3_Attain
Inst49Quest3_HORDE_Aim = Inst49Quest3_Aim
Inst49Quest3_HORDE_Location = Inst49Quest3_Location
Inst49Quest3_HORDE_Note = Inst49Quest3_Note
Inst49Quest3_HORDE_Prequest = Inst49Quest3_Prequest
Inst49Quest3_HORDE_Folgequest = Inst49Quest3_Folgequest
Inst49Quest3FQuest_HORDE = Inst49Quest3FQuest
--
Inst49Quest3name1_HORDE = Inst49Quest3name1
Inst49Quest3name2_HORDE = Inst49Quest3name2
Inst49Quest3name3_HORDE = Inst49Quest3name3
Inst49Quest3name4_HORDE = Inst49Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst49Quest4_HORDE = Inst49Quest4
Inst49Quest4_HORDE_Level = Inst49Quest4_Level
Inst49Quest4_HORDE_Attain = Inst49Quest4_Attain
Inst49Quest4_HORDE_Aim = Inst49Quest4_Aim
Inst49Quest4_HORDE_Location = Inst49Quest4_Location
Inst49Quest4_HORDE_Note = Inst49Quest4_Note
Inst49Quest4_HORDE_Prequest = Inst49Quest4_Prequest
Inst49Quest4_HORDE_Folgequest = Inst49Quest4_Folgequest
Inst49Quest4PreQuest_HORDE = Inst49Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst49Quest5_HORDE = Inst49Quest5
Inst49Quest5_HORDE_Level = Inst49Quest5_Level
Inst49Quest5_HORDE_Attain = Inst49Quest5_Attain
Inst49Quest5_HORDE_Aim = Inst49Quest5_Aim
Inst49Quest5_HORDE_Location = Inst49Quest5_Location
Inst49Quest5_HORDE_Note = Inst49Quest5_Note
Inst49Quest5_HORDE_Prequest = Inst49Quest5_Prequest
Inst49Quest5_HORDE_Folgequest = Inst49Quest5_Folgequest
Inst49Quest5PreQuest_HORDE = Inst49Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst49Quest6_HORDE = Inst49Quest6
Inst49Quest6_HORDE_Level = Inst49Quest6_Level
Inst49Quest6_HORDE_Attain = Inst49Quest6_Attain
Inst49Quest6_HORDE_Aim = Inst49Quest6_Aim
Inst49Quest6_HORDE_Location = Inst49Quest6_Location
Inst49Quest6_HORDE_Note = Inst49Quest6_Note
Inst49Quest6_HORDE_Prequest = Inst49Quest6_Prequest
Inst49Quest6_HORDE_Folgequest = Inst49Quest6_Folgequest
--
Inst49Quest6name1_HORDE = Inst49Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst49Quest7_HORDE = Inst49Quest7
Inst49Quest7_HORDE_Level = Inst49Quest7_Level
Inst49Quest7_HORDE_Attain = Inst49Quest7_Attain
Inst49Quest7_HORDE_Aim = Inst49Quest7_Aim
Inst49Quest7_HORDE_Location = Inst49Quest7_Location
Inst49Quest7_HORDE_Note = Inst49Quest7_Note
Inst49Quest7_HORDE_Prequest = Inst49Quest7_Prequest
Inst49Quest7_HORDE_Folgequest = Inst49Quest7_Folgequest
--
Inst49Quest7name1_HORDE = Inst49Quest7name1



--------------- INST50 - CoT: Battle of Mount Hyjal ---------------

Inst50Story = "在麦迪文的指导下，萨尔和卡利姆多人类部队首领吉安娜·普罗德摩尔认识到他们必须将分歧抛之脑后。/n/n同时，玛法里奥和泰兰德领导的暗夜精灵也意识到他们必须团结起来才能保护世界之树。在达成共识之后，艾泽拉斯的各个种族开始尽最大可能加强世界之树的防御工事。/n/n玛法里奥依靠所有人的力量成功地释放出诺达希尔的怒火，彻底消灭了阿克蒙德，将燃烧军团从永恒之井赶了出去。/n/n这场最后的战役震撼了卡利姆多的大地，未能吸取永恒之井能量的燃烧军团在艾泽拉斯联合阵营的威力面前灰飞烟灭。."
Inst50Caption = "时光之穴：海加尔之战"
Inst50QAA = "1 个任务"
Inst50QAH = "1 个任务"

--Quest 1 Alliance
Inst50Quest1 = "1. 古老的神器"
Inst50Quest1_Level = "70"
Inst50Quest1_Attain = "70"
Inst50Quest1_Aim = "前往塔纳利斯的时光之穴并且进入海加尔山战役。进入之后，击败瑞奇·寒冬并且将时间定相护符交给影月谷的阿卡玛."
Inst50Quest1_Location = "阿卡玛 (影月谷; "..YELLOW.."58,48"..WHITE..")"
Inst50Quest1_Note = "瑞奇·寒冬 就在 "..YELLOW.."[1]"..WHITE.."."
Inst50Quest1_Prequest = "有，灰舌伪装 (风暴之眼)"
Inst50Quest1_Folgequest = "有，被囚禁的灵魂"
Inst50Quest1PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst50Quest1_HORDE = Inst50Quest1
Inst50Quest1_HORDE_Level = Inst50Quest1_Level
Inst50Quest1_HORDE_Attain = Inst50Quest1_Attain
Inst50Quest1_HORDE_Aim = Inst50Quest1_Aim
Inst50Quest1_HORDE_Location = Inst50Quest1_Location
Inst50Quest1_HORDE_Note = Inst50Quest1_Note
Inst50Quest1_HORDE_Prequest = Inst50Quest1_Prequest
Inst50Quest1_HORDE_Folgequest = Inst50Quest1_Folgequest
Inst50Quest1PreQuest_HORDE = Inst50Quest1PreQuest
-- No Rewards for this quest



--------------- INST51 - CoT: Old Hillsbrad ---------------

Inst51Story = "敦霍尔德城堡是人类兽族第二次大战时洛丹伦王国的南方的前沿要塞。.\n\n这时候萨尔在人族指挥官布莱克眼里，萨尔只不过是一个傀儡酋长。他想利用萨尔的力量来控制其他人。\n\n但是萨尔知道，他生来注定要带领兽人摆脱枷锁，所以他开始了的逃离敦霍尔德的旅程。\n\n这个副本表现的是10年前的希尔斯布莱德，那是部落还没有摧毁敦霍尔德而且塔伦米尔没有沦陷在亡灵天灾手里。"
Inst51Caption = "时光之穴：旧希尔斯布莱德"
Inst51QAA = "5 个任务"
Inst51QAH = "5 个任务"
Inst51General = {
    {
    "德拉克中尉",
    "当兵营陷入大火并爆炸之后，第一个boss德拉克少尉就出现了。这是很简单的战斗，他是一个典型的战士，你知道应该怎么对付他。",
    RED .. "断筋：" .. WHITE .. "对目标造成63点伤害并且降低移动速度50％，持续15秒。\n" .. RED .. "胁迫怒吼" .. WHITE .. ": 使目标因恐惧而麻痹8秒，周围其他目标逃跑。\n" .. RED .. "致死打击：" .. WHITE .. " 对目标造成武器伤害外加120点额外伤害，降低所有治疗的效果50％，持续10秒.\n" .. RED .. "旋风斩：" .. WHITE .. "攻击周围所有目标，造成武器伤害外加300点额外伤害。",
    },

    {
    "斯卡洛克上尉",
    "斯卡洛克队长总是带有2个手下，一个敦霍尔德老兵和一个敦霍尔德狱卒。在跑出敦霍尔德城堡之后，斯卡洛克队长将骑马追上来。然后他会下马和萨尔对话。在这段时间里可以吃喝至最佳状态。当他们谈话结束后战斗就开始了。首先要杀死敦霍尔德狱卒，因为他的心灵尖啸很麻烦，然后是另一个手下。萨尔会在战斗中帮助你。治疗需要稍微照看萨尔的生命值。斯卡洛克队长是一个圣骑士，有时候他会治疗自己（需要打断）。",
   RED .. "清洁术:" .. WHITE .. " 清洁一个队友，消除一个中毒效果，一个疾病效果和一个魔法效果。\n" .. RED .. "正义之锤:" .. WHITE .. "击晕一个敌人，使其不能移动或战斗，持续6秒。\n" .. RED .. "圣光术:" .. WHITE .. "治疗一个队友5600－5900点生命\n" .. RED .. "神圣之盾" .. WHITE .. ": 提高格档几率30％，持续10秒，每次成功的格档后对攻击者造成350－450点伤害。",
    },

    {
    "击碎者克里丹",
    "战斗之前有3波龙需要击败。前2波每波有3只龙，第3波有4只。每一波中都有1只施法者类型的需要在没有坦克的情况下优先击杀，因为他们会给近战目标施放一个debuff，－50％治疗效果和－50%伤害。有时候第3波中有2只这种龙。在3波龙都死亡之后，你有短暂的时间来休息。Boss战很简单，不需要补充你的buff，因为boss会周期性的消除它们。死亡来临技能，会对随机目标施放。坦克应该背靠墙壁坦克，以免被boss击飞。",
   RED .. "死亡来临:" .. WHITE .. " 每3秒造成750点暗影伤害。\n" .. RED .. "魔法干扰光环:" .. WHITE .. " 周期性从附近敌对目标身上移除魔法效果。\n" .. RED .. "砂之吐息:" .. WHITE .. " 对自己面前圆锥型范围内目标造成奥术伤害，降低移动速度50％，攻击速度延长100％，持续10秒。",
    },
};

--Quest 1 Alliance
Inst51Quest1 = "1. 往日的希尔斯布莱德"
Inst51Quest1_Level = "68"
Inst51Quest1_Attain = "66"
Inst51Quest1_Aim = "时光之穴的安多尔姆要求你进入旧希尔斯布莱德丘陵，与伊洛希恩谈一谈。."
Inst51Quest1_Location = "安多尔姆 (塔纳利斯; "..YELLOW.."58,54"..WHITE..")"
Inst51Quest1_Note = "必须完成时光之穴门口守护巨龙接的任务"
Inst51Quest1_Prequest = "有，时光之穴"
Inst51Quest1_Folgequest = "有, 塔蕾莎的计谋"
Inst51Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst51Quest2 = "2. 塔蕾莎的计谋"
Inst51Quest2_Level = "68"
Inst51Quest2_Attain = "66"
Inst51Quest2_Aim = "进入敦霍尔德城堡，将伊洛希恩交给你的燃烧弹包分别放入5间收容所内的木桶，并启动定时装置。\n\n引爆燃烧弹后，与被关押在敦霍尔德城堡地牢中的萨尔谈一谈."
Inst51Quest2_Location = "伊洛希恩 (旧希尔斯布莱德 "..YELLOW.."入口"..WHITE..")"
Inst51Quest2_Note = "去南海镇看看那些名人，像老克和血色男女."
Inst51Quest2_Prequest = "有，往日的希尔斯布莱德"
Inst51Quest2_Folgequest = "有，逃离敦霍尔德"
Inst51Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst51Quest3 = "3. 逃离敦霍尔德"
Inst51Quest3_Level = "68"
Inst51Quest3_Attain = "66"
Inst51Quest3_Aim = "准备就绪后告知萨尔。保护萨尔逃离敦霍尔德城堡，并与他一起搭救塔蕾莎。\n\n任务完成后与旧希尔斯布莱德丘陵的伊洛希恩谈一谈."
Inst51Quest3_Location = "萨尔 (旧希尔斯布莱德 "..YELLOW.."Basement of the Keep"..WHITE..")"
Inst51Quest3_Note = "护送路上你会遇见3个BOSS，如果你半路失败需要从新重置副本来做."
Inst51Quest3_Prequest = "有, 塔蕾莎的计谋"
Inst51Quest3_Folgequest = "有, 返回安多尔姆身边"
Inst51Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst51Quest4 = "4. 返回安多尔姆身边"
Inst51Quest4_Level = "68"
Inst51Quest4_Attain = "66"
Inst51Quest4_Aim = "返回塔纳利斯沙漠的时光之穴，向幼时的安多尔姆复命."
Inst51Quest4_Location = "安多尔姆 (旧希尔斯布莱德 "..YELLOW.."入口"..WHITE..")"
Inst51Quest4_Note = "安多尔姆在副本里."
Inst51Quest4_Prequest = "有，逃离敦霍尔德"
Inst51Quest4_Folgequest = "无"
Inst51Quest4FQuest = "true"
--
Inst51Quest4name1 = "Tempest's Touch"
Inst51Quest4name2 = "Southshore Sneakers"
Inst51Quest4name3 = "Tarren Mill Defender's Cinch"
Inst51Quest4name4 = "Warchief's Mantle"

--Quest 5 Alliance
Inst51Quest5 = "5. 悬赏：时空猎手的头颅 (英雄日常)"
Inst51Quest5_Level = "70"
Inst51Quest5_Attain = "70"
Inst51Quest5_Aim = "商人扎雷姆要求你取回时空猎手的头颅。将头颅带回沙塔斯城的贫民窟交给他，就能领取奖赏."
Inst51Quest5_Location = "商人扎雷姆 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst51Quest5_Note = "时空猎手 在 "..YELLOW.."[5]"..WHITE.."."
Inst51Quest5_Prequest = "无"
Inst51Quest5_Folgequest = "无"
--
Inst51Quest5name1 = "公正徽章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst51Quest1_HORDE = Inst51Quest1
Inst51Quest1_HORDE_Level = Inst51Quest1_Level
Inst51Quest1_HORDE_Attain = Inst51Quest1_Attain
Inst51Quest1_HORDE_Aim = Inst51Quest1_Aim
Inst51Quest1_HORDE_Location = Inst51Quest1_Location
Inst51Quest1_HORDE_Note = Inst51Quest1_Note
Inst51Quest1_HORDE_Prequest = Inst51Quest1_Prequest
Inst51Quest1_HORDE_Folgequest = Inst51Quest1_Folgequest
Inst51Quest1PreQuest_HORDE = Inst51Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst51Quest2_HORDE = Inst51Quest2
Inst51Quest2_HORDE_Level = Inst51Quest2_Level
Inst51Quest2_HORDE_Attain = Inst51Quest2_Attain
Inst51Quest2_HORDE_Aim = Inst51Quest2_Aim
Inst51Quest2_HORDE_Location = Inst51Quest2_Location
Inst51Quest2_HORDE_Note = Inst51Quest2_Note
Inst51Quest2_HORDE_Prequest = Inst51Quest2_Prequest
Inst51Quest2_HORDE_Folgequest = Inst51Quest2_Folgequest
Inst51Quest2FQuest_HORDE = Inst51Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst51Quest3_HORDE = Inst51Quest3
Inst51Quest3_HORDE_Level = Inst51Quest3_Level
Inst51Quest3_HORDE_Attain = Inst51Quest3_Attain
Inst51Quest3_HORDE_Aim = Inst51Quest3_Aim
Inst51Quest3_HORDE_Location = Inst51Quest3_Location
Inst51Quest3_HORDE_Note = Inst51Quest3_Note
Inst51Quest3_HORDE_Prequest = Inst51Quest3_Prequest
Inst51Quest3_HORDE_Folgequest = Inst51Quest3_Folgequest
Inst51Quest3FQuest_HORDE = Inst51Quest3FQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst51Quest4_HORDE = Inst51Quest4
Inst51Quest4_HORDE_Level = Inst51Quest4_Level
Inst51Quest4_HORDE_Attain = Inst51Quest4_Attain
Inst51Quest4_HORDE_Aim = Inst51Quest4_Aim
Inst51Quest4_HORDE_Location = Inst51Quest4_Location
Inst51Quest4_HORDE_Note = Inst51Quest4_Note
Inst51Quest4_HORDE_Prequest = Inst51Quest4_Prequest
Inst51Quest4_HORDE_Folgequest = Inst51Quest4_Folgequest
Inst51Quest4FQuest_HORDE = Inst51Quest4FQuest
--
Inst51Quest4name1_HORDE = Inst51Quest4name1
Inst51Quest4name2_HORDE = Inst51Quest4name2
Inst51Quest4name3_HORDE = Inst51Quest4name3
Inst51Quest4name4_HORDE = Inst51Quest4name4

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst51Quest5_HORDE = Inst51Quest5
Inst51Quest5_HORDE_Level = Inst51Quest5_Level
Inst51Quest5_HORDE_Attain = Inst51Quest5_Attain
Inst51Quest5_HORDE_Aim = Inst51Quest5_Aim
Inst51Quest5_HORDE_Location = Inst51Quest5_Location
Inst51Quest5_HORDE_Note = Inst51Quest5_Note
Inst51Quest5_HORDE_Prequest = Inst51Quest5_Prequest
Inst51Quest5_HORDE_Folgequest = Inst51Quest5_Folgequest
--
Inst51Quest5name1_HORDE = Inst51Quest5name1



--------------- INST52 - Gruul's Lair (GL) ---------------

Inst52Story = "屠龙者格鲁尔，正如它的名字，是一个嗜血屠龙的戈隆，它也是25人RADI格鲁尔的巢穴的最终BOSS "
Inst52Caption = "格鲁尔的巢穴"
Inst52QAA = "1 个任务"
Inst52QAH = "1 个任务"

--Quest 1 Alliance
Inst52Quest1 = "1. 卡达什圣杖"
Inst52Quest1_Level = "70"
Inst52Quest1_Attain = "70"
Inst52Quest1_Aim = "将土灵徽记和灿烂徽记交给盘牙水库英雄难度奴隶围栏的异教徒斯卡希斯."
Inst52Quest1_Location = "异教徒斯卡希斯 在 (盘牙水库; "..YELLOW.."英雄模式 [3]"..WHITE..")"
Inst52Quest1_Note = "土灵徽记 掉落自 格鲁尔"..YELLOW.."格鲁尔的巢穴 [2]"..WHITE.." 灿烂徽记 掉落自 夜之魇 "..YELLOW.."卡拉赞 [11]"..WHITE.."."
Inst52Quest1_Prequest = "无"
Inst52Quest1_Folgequest = "无"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst52Quest1_HORDE = Inst52Quest1
Inst52Quest1_HORDE_Level = Inst52Quest1_Level
Inst52Quest1_HORDE_Attain = Inst52Quest1_Attain
Inst52Quest1_HORDE_Aim = Inst52Quest1_Aim
Inst52Quest1_HORDE_Location = Inst52Quest1_Location
Inst52Quest1_HORDE_Note = Inst52Quest1_Note
Inst52Quest1_HORDE_Prequest = Inst52Quest1_Prequest
Inst52Quest1_HORDE_Folgequest = Inst52Quest1_Folgequest
-- No Rewards for this quest



--------------- INST53 - Karazhan (Kara) ---------------

Inst53Story = "麦迪文之塔以艾泽拉斯伟大的魔法师--先知麦迪文而闻名天下.\n\n他死后，一场突如其来的巨大灾难降临在这和周边的土地上.\n\n近几年来，一些暮色森林的贵族曾冒险去逆风小径探险并调查弥漫在那一带的奇异的死亡气息。他们进入了黑暗中的高塔，却再有没有回来.\n\n事实上，一些目击者坚称那些贵族们的亡魂依然徘徊在卡拉赞之内，痛苦地忍受着诅咒的折磨，他们将永远也无法离开塔中的支离破碎的大厅。另有一些其他的亡魂占据了夕日麦迪文那间令人毛骨悚然的研究室，那里充满了恶魔对于疯狂法师召唤的回应。\n\n坐落在逆风小径的这个副本是10人的70级团队副本."
Inst53Caption = "卡拉赞"
Inst53QAA = "14 个任务"
Inst53QAH = "14 个任务"
Inst53General = {
    {
    "猎手阿图门",
    "",
    RED .. "第一阶段：" .. WHITE .. "副坦背靠墙使午夜背朝队伍。 当午夜的血量降到95%时阿图门将出现在他身边。在阿图门被MT拉住前不要尝试攻击并尽量在其出现的那一刻停止治疗。单纯利用远程将其打到95%，近战提前上去将可能在阿图门出现时被秒。一旦阿图门被拉开就可以开始dps午夜。其间MT对boss保持挫志雷霆，法师小D注意解除诅咒。\n" .. RED .. "第二阶段" .. WHITE .. ": 当午夜血量下降到25%时，短暂的几秒时间后阿图门将骑上它。 在这个过程中所有DPS停止攻击， 它的仇恨已被清空， 两个坦克第一时间对其建立仇恨以防BOSS攻击其他成员。。唯一的改变是该阶段他将对随机一名远程人员进行冲锋并对其造成4500左右伤害。 因此在BOSS仇恨稳定后， 所有治疗与远程DPS可以靠近BOSS身后，留个猎人或者直接让副坦站在远程位置。 这样的好处是BOSS只会对他进行冲锋。DPS保持在BOSS的正后方防止被顺劈,所有治疗看好MT， 让一个骑士/萨满适当照看被冲锋的成员.维持这样的节奏将阿图门打到0％，他没有更多花招了。",
    },

    {
    "莫罗斯",
    "你可以利用任何团队感觉良好的方式来击杀ADDS，建议你无论出现何种组合都优先击杀神牧。同样的，若有神圣骑士那么也要优先解决。 在所有治疗职业都被干掉后，暗牧将是首要考虑目标。如果武器战或惩戒骑存在于该次组合里，那么一定要保证在你准备击杀前他们被稳定地控制着。 至于防战，开打后可以先TANK或者风筝，在干掉其余三个ADDS后将其锁住，直到杀掉BOSS。\n两个牧师ADDS和神圣骑士使用物理攻击伤害非常低，因此不需要TANK。 处理武器战士和惩戒骑士时，全场风筝击杀的办法很不错，如果你有多余的TANK也可以选择定点击杀，但治疗也必须高度集中以免坦克被秒。战斗进入最后百分30的狂暴阶段，这时候如果你的治疗仍有余力，那么DOWN掉他便是毫无悬念的，若治疗已经不堪重负，那么战士随时做好自保，DPS以最快速度RUSH掉。",
   RED .. "1：" .. WHITE .. "战斗的关键除了控制之外最重要的就在于团队能够以多快的速度解决掉未被控制的ADDS以便尽快投入BOSS战.如果合适，就可以留一个怪一直控制\n" .. RED .. "2：" .. WHITE .. " 当莫罗斯致盲第2仇恨后，保证第一时间驱除，以避免他同时凿击MT导致无人TANK的情况出现当莫罗斯对某个玩家使用绞喉后，骑士应该立即对该名玩家使用保护祝福以祛除流血效果.\n" .. RED .. "3：" .. WHITE .. "在被控制的怪和牧师中间安排一个法师，以防不测",
    },

    {
    "贞节圣女",
    "这场战斗必须防止的地方有三，神圣之怒连人，神圣之火所附DOT导致死亡，忏悔12秒内MT死亡。对此的应对方法是，分散站位，在这个前提下，把牧师与骑士平均分派在各个点以便解除魔法，并且保证忏悔时间内有治疗处于清醒状态。近战算上MT只能站三个，BOSS的碰撞体积较大，三个人保持最远攻击距离'鼎足而立'，保证不被神圣之怒连到即可。治疗最重要的是第一时间驱散你附近的玩家所中的DOT。而实际上这个BOSS对于刚入卡拉赞开荒的MT来说是比较狠的，因此保证MT存活也需要你的专注。",
   RED .. "忏悔的应对：" .. WHITE .. " 现在的应对方法是让一个骑士给MT上牺牲祝福，可以是低级的这样的作用是在BOSS释放忏悔后打MT的一瞬间骑士也能迅速醒来，这样平稳度过10秒便很轻松了。需要注意，BOSS在忏悔发动后有可能会直接跑去找骑士而不是MT，因此建议负责牺牲祝福的骑士站在MT背后位置。这样能给MT最大的反应时间。当然MT切换状态使用狂暴之怒来也可免疫忏悔，保证boss不乱跑。\n" .. RED .. "其他要点：" .. WHITE .. " 猎人与术士的宠物收好，他们也会连人。战斗前给近战DPS上魔法抑制，这样能有效减少神圣奉献对他们造成的伤害，给近战上上HOT基本就能保证他们的血量。人品较烂的战士可能会在忏悔刚发动后遭到连续的碾压，这样治疗跟不上的话就挂了，因此治疗石，大红，盾墙，破斧头等叼招都留在这个时候，该用就用。保证自己忏悔时不死这个BOSS就算过了大半了",
    },
    
    {
    "小红帽",
    "大灰狼随机将一目标便为小红帽，持续10秒，被变形的玩家护甲为0，移动速度提高到180%。在此期间内大灰狼只会攻击被变成小红帽的玩家。被变成小红帽的被狼打到一下4000，辗压 6000，暴击8000。当开始有人变身成为小红帽时，即按照上图路径进行绕场，未变身的坦克及近战人员进入内圈尾随大野狼，治疗人员则是进入内圈对小红帽进行预唱动作。防恐也可以先行施加在主坦身上。当狼追逐小红帽时所受到的一切伤害都不计算仇恨。所以主坦克建立好初始仇恨在每次追逐过后会返回主坦克，dps不用太忌讳OT。 除了恐惧的问题外，坦克BOSS过程中基本上没有太大的问题。",
    RED .. "法师" .. WHITE .. "对队友们施放魔法增效，以增加治疗能力。\n" .. RED .. "战士" .. WHITE .. ":可藉由雷霆减缓大灰狼攻击的速度。",
    },

    {
    "罗密欧与朱丽叶",
    "战斗分为3个阶段。第一阶段你将面对朱丽叶一个人，然后面对罗密欧一个人，最后同时面对2个人。每次都要把他们杀死.第三阶段要在10秒内将2个人同时杀死，否则他们会不断复活。",
   RED .. "第一阶段：" .. WHITE .. "第一阶段可以用打断施法的技能不断打断朱丽叶的DD魔法和治疗魔法，以节省治疗的法力值。同时可以靠法师窃取，ss狗吞噬和牧师的驱散来驱散朱丽叶的魔法。\n" .. RED .. "第二阶段：" .. WHITE .. "罗密欧的攻击很高，所以要及时治疗。罗密欧要背对墙Tank住，以减少击退对Dps职业的影响。侦测魔法最好开启，时刻注意Daring的出现。要迅速让法师偷过来/地狱犬吃掉/驱散掉。否则很容易团灭。.\n" .. RED .. "第三阶段：" .. WHITE .. " 和第一，第二阶段对罗密欧与朱丽叶的战术相同，但由于DPS被分散，战斗会拖得比较长一些，如果团队都集中精神的话，这个阶段不是什么大问题。当两个boss都到10%的时候，全力DPS掉。如果他们的血量不均衡，收敛一下DPS来平衡两个boss的血量，这样他们可以在5-10秒内连续被干掉，将2个人Tank在舞台的两端会使战斗容易些。致死打击和盗贼的致伤毒药对于战斗有比较大的帮助。侦测魔法最好开启，时刻注意Devotion的出现。要迅速让法师偷过来/地狱犬吃掉/驱散掉。战士们需要在进入第三阶段的时候站在前两个阶段的尸体上，这样他们复活的时候能够第一时间获取仇恨并拉到位。",
    },

    {
    "绿野仙踪",
    "多萝茜将会是第一个发动攻击的BOSS。因为他没有仇恨，所以无法被坦。在战斗过程中，他会召唤托托。托托会中断施法，所以副坦克必须在他出来后把它抓住，以避免法系人员受到伤害。注意，若在多萝茜死亡前先击杀托托，多萝茜将会狂暴。。\n狮子将会是第二个发动攻击的BOSS。副坦克必须在他加入战斗的第一时间上前拉住仇恨，让它在恐惧链接结束后不至于去找法系人员。术士、牧师及猎人皆可以恐惧他。因此恐惧链是必须的。\n稻草人将是第三个发动攻击的BOSS。火焰伤害将会对他造成六秒的混乱，因此法师可以使用灼烧不断的攻击，让他陷入混乱并放风筝。副坦克可以在一开始稍微拉仇恨，让他不至于一出现就造成法系的伤亡。若使用火球术，稻草人的混乱可能会因为其附加效果解除混乱，这是法师必须考虑到的重点。\n铁皮人将会是第四个发动攻击的BOSS。他发动攻击之初，速度相当的快，主坦克必须第一时间将它抓住，并且开始制造仇恨。待时间久了之后，他开始生锈，并且效果开始叠加，即可开始绕着舞台风筝。\n前面四个BOSS解决之后，巫婆便会出现。一开始他会出现在舞台的正中央，主坦克必须马上上前准备制造仇恨。在攻击的过程中，他会随机施放龙卷风将玩家卷上空中，在空中无法施法，但是可以使用瞬发法术。故若治疗职业不幸被吹上天，记得使用HOT(持续性治疗法术)或是盾等方式维持主坦克生命力。",
   RED .. "击杀顺序：" .. WHITE .. "多萝茜→托托→狮子→稻草人→铁皮人",
    },
    
    {
    "馆长",
    "MT将馆长拉在房间中央略靠入口处。其他人分散开，人与人之间时刻保持在12—15码距离，这点很重要，若靠的过近，闪电球的闪电链将可能同时连到数人，而若离得过远，则有可能超出治疗范围。治疗者的位置最为关键，你必须找到一个可以治疗到MT，AT以及本组其他成员的位置",
    RED .. "闪电球阶段（持续120秒）:" .. WHITE .. "在开局到第一次唤醒以及每次唤醒之后的战斗流程都是相同的。这段时间里DPS应该把注意力集中在每12秒刷一个的闪电球上，它的血量约为13000。它没有多少物理伤害。闪电球刷新后的第一目标通常是随机的。你必须尽可能的将所有DPS都集中到它身上，以保证在下一个刷新前能够解决掉。\n" .. RED .. "唤醒阶段（持续20秒）" .. WHITE .. ": 馆长耗尽法力后便进入该阶段。这20秒内他不再召唤闪电球，也不会有任何攻击行为。有点类似于克苏恩的虚弱，所承受的伤害为平时的200％，你只需全力DPS。这一阶段最重要的其实也就是所有人尽可能多的输出伤害。站位方面不用做何改变，一切以最大化输出为主。\n" .. RED .. "激怒阶段:" .. WHITE .. "重复前面两个阶段，直到馆长的血量下降到15％左右，战斗进入激怒阶段。该阶段的仇恨奥弹与物理攻击频率都有显著加快，但不再召唤闪电球，因此也不会再进入唤醒状态。那么很显然，这个阶段依然是考验团队RUSH的能力.",
    },
};

--Quest 1 Alliance
Inst53Quest1 = "1. 评估事态"
Inst53Quest1_Level = "70"
Inst53Quest1_Attain = "69"
Inst53Quest1_Aim = "进入卡拉赞寻找库雷恩."
Inst53Quest1_Location = "大法师奥图鲁斯 (逆风小径; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest1_Note = "库雷恩 就在 过了猎手阿图门之后的"..YELLOW.."[1]"..WHITE.."."
Inst53Quest1_Prequest = "有, 紫罗兰之眼"
Inst53Quest1_Folgequest = "有,金娜的日记"
Inst53Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst53Quest2 = "2. 金娜的日记"
Inst53Quest2_Level = "70"
Inst53Quest2_Attain = "70"
Inst53Quest2_Aim = "在卡拉赞的会客间搜寻金娜的日记，然后将它交给卡拉赞外的大法师奥图鲁斯。"
Inst53Quest2_Location = "库雷恩 (卡拉赞; "..YELLOW.."[1]"..WHITE..")"
Inst53Quest2_Note = "奥图鲁斯 (逆风小径; "..YELLOW.."47,75"..WHITE.."). 书就在通向贞节圣女的大厅的第二个房间 "..YELLOW.."[3]"..WHITE..", 在桌子上."
Inst53Quest2_Prequest = "有, 评估事态"
Inst53Quest2_Folgequest = "有, 恶魔的气息"
Inst53Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst53Quest3 = "3. 恶魔的气息"
Inst53Quest3_Level = "70"
Inst53Quest3_Attain = "70"
Inst53Quest3_Aim = "大法师奥图鲁斯要求你消灭出现在卡拉赞顶部的恶魔."
Inst53Quest3_Location = "大法师奥图鲁斯 (逆风小径; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest3_Note = "玛克扎尔王子 (卡拉赞; "..YELLOW.."[10]"..WHITE..")"
Inst53Quest3_Prequest = "有, 金娜的日记"
Inst53Quest3_Folgequest = "有, 新的指示"
Inst53Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst53Quest4 = "4. 联络达拉然"
Inst53Quest4_Level = "70"
Inst53Quest4_Attain = "70"
Inst53Quest4_Aim = "将奥图鲁斯的报告交给达拉然外的大法师塞德瑞克."
Inst53Quest4_Location = "大法师奥图鲁斯 (逆风小径; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest4_Note = "大法师塞德瑞克 (奥特兰克山脉.; "..YELLOW.."15,54"..WHITE..")"
Inst53Quest4_Prequest = "有, 恶魔的气息"
Inst53Quest4_Folgequest = "无"
Inst53Quest4FQuest = "true"
--
Inst53Quest4name1 = "紫罗兰徽章"

--Quest 5 Alliance
Inst53Quest5 = "5. 麦迪文的日记"
Inst53Quest5_Level = "70"
Inst53Quest5_Attain = "70"
Inst53Quest5_Aim = "逆风小径的大法师奥图鲁斯要你进入卡拉赞，与拉维恩谈一谈"
Inst53Quest5_Location = "大法师奥图鲁斯 (逆风小径; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest5_Note = "需要紫罗兰之眼尊敬拉维恩在图书馆馆长的后边 "..YELLOW.."[5]"..WHITE.."."
Inst53Quest5_Prequest = "无"
Inst53Quest5_Folgequest = "有, 妥善保管"
-- No Rewards for this quest

--Quest 6 Alliance
Inst53Quest6 = "6. 妥善保管"
Inst53Quest6_Level = "70"
Inst53Quest6_Attain = "70"
Inst53Quest6_Aim = "与卡拉赞守护者的图书馆中的格拉达夫谈一谈."
Inst53Quest6_Location = "拉维恩 (卡拉赞; "..YELLOW.."图书馆"..WHITE..")"
Inst53Quest6_Note = "格拉达夫和拉维恩在同一房间"
Inst53Quest6_Prequest = "有, 麦迪文的日记"
Inst53Quest6_Folgequest = "有, 卡姆希丝"
Inst53Quest6FQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst53Quest7 = "7. 卡姆希丝"
Inst53Quest7_Level = "70"
Inst53Quest7_Attain = "70"
Inst53Quest7_Aim = "与卡拉赞守护者的图书馆里的卡姆希丝谈一谈."
Inst53Quest7_Location = "格拉达夫 (卡拉赞; "..YELLOW.."图书馆"..WHITE..")"
Inst53Quest7_Note = "卡姆希丝和格拉达夫在同一房间"
Inst53Quest7_Prequest = "有, 妥善保管"
Inst53Quest7_Folgequest = "有, 埃兰之影"
Inst53Quest7FQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst53Quest8 = "8. 埃兰之影"
Inst53Quest8_Level = "70"
Inst53Quest8_Attain = "70"
Inst53Quest8_Aim = "将麦迪文的日记交给卡拉赞守护者的图书馆中的卡姆希丝."
Inst53Quest8_Location = "卡姆希丝 (卡拉赞; "..YELLOW.."Library"..WHITE..")"
Inst53Quest8_Note = "埃兰之影 在 "..YELLOW.."[7]"..WHITE.."."
Inst53Quest8_Prequest = "有, 卡姆希丝"
Inst53Quest8_Folgequest = "有, 大师的露台"
Inst53Quest8FQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst53Quest9 = "9. 主宰的露台"
Inst53Quest9_Level = "70"
Inst53Quest9_Attain = "70"
Inst53Quest9_Aim = "前往卡拉赞的主宰的露台并阅读麦迪文的日记。完成任务后带着麦迪文的日记回到大法师奥图鲁斯那里."
Inst53Quest9_Location = "卡姆希丝 (卡拉赞; "..YELLOW.."图书馆"..WHITE..")"
Inst53Quest9_Note = "大法师奥图鲁斯 (逆风小径; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest9_Prequest = "有, 埃兰之影"
Inst53Quest9_Folgequest = "有, 发掘过去"
Inst53Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst53Quest10 = "10. 发掘过去"
Inst53Quest10_Level = "70"
Inst53Quest10_Attain = "70"
Inst53Quest10_Aim = "大法师奥图鲁斯要你去逆风小径位于卡拉赞南部的山脉中取回一片烧焦的白骨碎片."
Inst53Quest10_Location = "大法师奥图鲁斯 (逆风小径; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest10_Note = "烧焦的白骨碎片在 逆风小径 "..YELLOW.."44,78"..WHITE.." "
Inst53Quest10_Prequest = "有, 大师的露台"
Inst53Quest10_Folgequest = "有, 同事的帮助"
Inst53Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst53Quest11 = "11. 同事的帮助"
Inst53Quest11_Level = "70"
Inst53Quest11_Attain = "70"
Inst53Quest11_Aim = "将烧焦的白骨碎片带给虚空风暴的."
Inst53Quest11_Location = "大法师奥图鲁斯 (逆风小径; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest11_Note = "卡琳娜·拉瑟德 (52区; "..YELLOW.."32,63"..WHITE..")"
Inst53Quest11_Prequest = "有, 发掘过去"
Inst53Quest11_Folgequest = "有, 卡琳娜的要求"
Inst53Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst53Quest12 = "12. 卡琳娜的要求"
Inst53Quest12_Level = "70"
Inst53Quest12_Attain = "70"
Inst53Quest12_Aim = "从地狱火堡垒破碎大厅的高阶术士奈瑟库斯手中夺得暮色魔典，从奥金顿塞泰克大厅的黑暗编织者塞斯手中夺得忘却之名，将它们交给卡琳娜·拉瑟德。\n\n该任务必须在英雄难度下完成."
Inst53Quest12_Location = "卡琳娜·拉瑟德 (虚空风暴 - 52区; "..YELLOW.."32,63"..WHITE..")"
Inst53Quest12_Note = "这个任务需要你跑一遍英雄难度的破碎大厅和塞泰克大厅"
Inst53Quest12_Prequest = "有, 同事的帮助"
Inst53Quest12_Folgequest = "有,夜之魇"
Inst53Quest12FQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst53Quest13 = "13. 夜之魇"
Inst53Quest13_Level = "70"
Inst53Quest13_Attain = "70"
Inst53Quest13_Aim = "前往卡拉赞的大师的露台使用卡琳娜的骨灰坛来召唤夜之魇。从夜之魇的尸体取得微弱的秘法精华并带给大法师奥图鲁斯"
Inst53Quest13_Location = "卡琳娜·拉瑟德 (虚空风暴 - 52区; "..YELLOW.."32,63"..WHITE..")"
Inst53Quest13_Note = "如果你成功杀死了夜之魇，那就找大法师奥图鲁斯领取奖励吧，祝你好运!"
Inst53Quest13_Prequest = "有, 卡琳娜的要求"
Inst53Quest13_Folgequest = "无"
Inst53Quest13FQuest = "true"
--
Inst53Quest13name1 = "Pulsing Amethyst"
Inst53Quest13name2 = "Soothing Amethyst"
Inst53Quest13name3 = "Infused Amethyst"

--Quest 14 Alliance
Inst53Quest14 = "14. 卡达什圣杖"
Inst53Quest14_Level = "70"
Inst53Quest14_Attain = "70"
Inst53Quest14_Aim = "将土灵徽记和灿烂徽记交给盘牙水库奴隶围栏的异教徒斯卡希斯."
Inst53Quest14_Location = "异教徒斯卡希斯  (奴隶围栏; "..YELLOW.."英雄难度 [3]"..WHITE..")"
Inst53Quest14_Note = "土灵徽记 掉落自 格鲁尔"..YELLOW.."格鲁尔的巢穴 [2]"..WHITE.." 灿烂徽记 掉落自 夜之魇 "..YELLOW.."卡拉赞 [11]"..WHITE.."."
Inst53Quest14_Prequest = "无"
Inst53Quest14_Folgequest = "无"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst53Quest1_HORDE = Inst53Quest1
Inst53Quest1_HORDE_Level = Inst53Quest1_Level
Inst53Quest1_HORDE_Attain = Inst53Quest1_Attain
Inst53Quest1_HORDE_Aim = Inst53Quest1_Aim
Inst53Quest1_HORDE_Location = Inst53Quest1_Location
Inst53Quest1_HORDE_Note = Inst53Quest1_Note
Inst53Quest1_HORDE_Prequest = Inst53Quest1_Prequest
Inst53Quest1_HORDE_Folgequest = Inst53Quest1_Folgequest
Inst53Quest1PreQuest_HORDE = Inst53Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst53Quest2_HORDE = Inst53Quest2
Inst53Quest2_HORDE_Level = Inst53Quest2_Level
Inst53Quest2_HORDE_Attain = Inst53Quest2_Attain
Inst53Quest2_HORDE_Aim = Inst53Quest2_Aim
Inst53Quest2_HORDE_Location = Inst53Quest2_Location
Inst53Quest2_HORDE_Note = Inst53Quest2_Note
Inst53Quest2_HORDE_Prequest = Inst53Quest2_Prequest
Inst53Quest2_HORDE_Folgequest = Inst53Quest2_Folgequest
Inst53Quest2FQuest_HORDE = Inst53Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst53Quest3_HORDE = Inst53Quest3
Inst53Quest3_HORDE_Level = Inst53Quest3_Level
Inst53Quest3_HORDE_Attain = Inst53Quest3_Attain
Inst53Quest3_HORDE_Aim = Inst53Quest3_Aim
Inst53Quest3_HORDE_Location = Inst53Quest3_Location
Inst53Quest3_HORDE_Note = Inst53Quest3_Note
Inst53Quest3_HORDE_Prequest = Inst53Quest3_Prequest
Inst53Quest3_HORDE_Folgequest = Inst53Quest3_Folgequest
Inst53Quest3FQuest_HORDE = Inst53Quest3FQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst53Quest4_HORDE = Inst53Quest4
Inst53Quest4_HORDE_Level = Inst53Quest4_Level
Inst53Quest4_HORDE_Attain = Inst53Quest4_Attain
Inst53Quest4_HORDE_Aim = Inst53Quest4_Aim
Inst53Quest4_HORDE_Location = Inst53Quest4_Location
Inst53Quest4_HORDE_Note = Inst53Quest4_Note
Inst53Quest4_HORDE_Prequest = Inst53Quest4_Prequest
Inst53Quest4_HORDE_Folgequest = Inst53Quest4_Folgequest
Inst53Quest4FQuest_HORDE = Inst53Quest4FQuest
--
Inst53Quest4name1_HORDE = Inst53Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst53Quest5_HORDE = Inst53Quest5
Inst53Quest5_HORDE_Level = Inst53Quest5_Level
Inst53Quest5_HORDE_Attain = Inst53Quest5_Attain
Inst53Quest5_HORDE_Aim = Inst53Quest5_Aim
Inst53Quest5_HORDE_Location = Inst53Quest5_Location
Inst53Quest5_HORDE_Note = Inst53Quest5_Note
Inst53Quest5_HORDE_Prequest = Inst53Quest5_Prequest
Inst53Quest5_HORDE_Folgequest = Inst53Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst53Quest6_HORDE = Inst53Quest6
Inst53Quest6_HORDE_Level = Inst53Quest6_Level
Inst53Quest6_HORDE_Attain = Inst53Quest6_Attain
Inst53Quest6_HORDE_Aim = Inst53Quest6_Aim
Inst53Quest6_HORDE_Location = Inst53Quest6_Location
Inst53Quest6_HORDE_Note = Inst53Quest6_Note
Inst53Quest6_HORDE_Prequest = Inst53Quest6_Prequest
Inst53Quest6_HORDE_Folgequest = Inst53Quest6_Folgequest
Inst53Quest6FQuest_HORDE = Inst53Quest6FQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst53Quest7_HORDE = Inst53Quest7
Inst53Quest7_HORDE_Level = Inst53Quest7_Level
Inst53Quest7_HORDE_Attain = Inst53Quest7_Attain
Inst53Quest7_HORDE_Aim = Inst53Quest7_Aim
Inst53Quest7_HORDE_Location = Inst53Quest7_Location
Inst53Quest7_HORDE_Note = Inst53Quest7_Note
Inst53Quest7_HORDE_Prequest = Inst53Quest7_Prequest
Inst53Quest7_HORDE_Folgequest = Inst53Quest7_Folgequest
Inst53Quest7FQuest_HORDE = Inst53Quest7FQuest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst53Quest8_HORDE = Inst53Quest8
Inst53Quest8_HORDE_Level = Inst53Quest8_Level
Inst53Quest8_HORDE_Attain = Inst53Quest8_Attain
Inst53Quest8_HORDE_Aim = Inst53Quest8_Aim
Inst53Quest8_HORDE_Location = Inst53Quest8_Location
Inst53Quest8_HORDE_Note = Inst53Quest8_Note
Inst53Quest8_HORDE_Prequest = Inst53Quest8_Prequest
Inst53Quest8_HORDE_Folgequest = Inst53Quest8_Folgequest
Inst53Quest8FQuest_HORDE = Inst53Quest8FQuest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst53Quest9_HORDE = Inst53Quest9
Inst53Quest9_HORDE_Level = Inst53Quest9_Level
Inst53Quest9_HORDE_Attain = Inst53Quest9_Attain
Inst53Quest9_HORDE_Aim = Inst53Quest9_Aim
Inst53Quest9_HORDE_Location = Inst53Quest9_Location
Inst53Quest9_HORDE_Note = Inst53Quest9_Note
Inst53Quest9_HORDE_Prequest = Inst53Quest9_Prequest
Inst53Quest9_HORDE_Folgequest = Inst53Quest9_Folgequest
Inst53Quest9FQuest_HORDE = Inst53Quest9FQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst53Quest10_HORDE = Inst53Quest10
Inst53Quest10_HORDE_Level = Inst53Quest10_Level
Inst53Quest10_HORDE_Attain = Inst53Quest10_Attain
Inst53Quest10_HORDE_Aim = Inst53Quest10_Aim
Inst53Quest10_HORDE_Location = Inst53Quest10_Location
Inst53Quest10_HORDE_Note = Inst53Quest10_Note
Inst53Quest10_HORDE_Prequest = Inst53Quest10_Prequest
Inst53Quest10_HORDE_Folgequest = Inst53Quest10_Folgequest
Inst53Quest10FQuest_HORDE = Inst53Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst53Quest11_HORDE = Inst53Quest11
Inst53Quest11_HORDE_Level = Inst53Quest11_Level
Inst53Quest11_HORDE_Attain = Inst53Quest11_Attain
Inst53Quest11_HORDE_Aim = Inst53Quest11_Aim
Inst53Quest11_HORDE_Location = Inst53Quest11_Location
Inst53Quest11_HORDE_Note = Inst53Quest11_Note
Inst53Quest11_HORDE_Prequest = Inst53Quest11_Prequest
Inst53Quest11_HORDE_Folgequest = Inst53Quest11_Folgequest
Inst53Quest11FQuest_HORDE = Inst53Quest11FQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst53Quest12_HORDE = Inst53Quest12
Inst53Quest12_HORDE_Level = Inst53Quest12_Level
Inst53Quest12_HORDE_Attain = Inst53Quest12_Attain
Inst53Quest12_HORDE_Aim = Inst53Quest12_Aim
Inst53Quest12_HORDE_Location = Inst53Quest12_Location
Inst53Quest12_HORDE_Note = Inst53Quest12_Note
Inst53Quest12_HORDE_Prequest = Inst53Quest12_Prequest
Inst53Quest12_HORDE_Folgequest = Inst53Quest12_Folgequest
Inst53Quest12FQuest_HORDE = Inst53Quest12FQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst53Quest13_HORDE = Inst53Quest13
Inst53Quest13_HORDE_Level = Inst53Quest13_Level
Inst53Quest13_HORDE_Attain = Inst53Quest13_Attain
Inst53Quest13_HORDE_Aim = Inst53Quest13_Aim
Inst53Quest13_HORDE_Location = Inst53Quest13_Location
Inst53Quest13_HORDE_Note = Inst53Quest13_Note
Inst53Quest13_HORDE_Prequest = Inst53Quest13_Prequest
Inst53Quest13_HORDE_Folgequest = Inst53Quest13_Folgequest
Inst53Quest13FQuest_HORDE = Inst53Quest13FQuest
--
Inst53Quest13name1_HORDE = Inst53Quest13name1
Inst53Quest13name2_HORDE = Inst53Quest13name2
Inst53Quest13name3_HORDE = Inst53Quest13name3

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst53Quest14_HORDE = Inst53Quest14
Inst53Quest14_HORDE_Level = Inst53Quest14_Level
Inst53Quest14_HORDE_Attain = Inst53Quest14_Attain
Inst53Quest14_HORDE_Aim = Inst53Quest14_Aim
Inst53Quest14_HORDE_Location = Inst53Quest14_Location
Inst53Quest14_HORDE_Note = Inst53Quest14_Note
Inst53Quest14_HORDE_Prequest = Inst53Quest14_Prequest
Inst53Quest14_HORDE_Folgequest = Inst53Quest14_Folgequest
-- No Rewards for this quest



--------------- INST54 - TK: Arcatraz (Arc) ---------------
Inst54Story = "风暴要塞原先是神秘的纳鲁用来在大宇宙中旅行的跨次元飞船。燃烧军团的统领，堕落泰坦萨格拉斯看见了来自阿古斯行星的艾瑞达人的智慧，决定使他们成为他的恶魔军队的一员。阿克蒙德和基尔加丹，艾瑞达人的2个领袖，接受了萨格拉斯的邀请。但是第三位领袖维伦看到萨格拉斯是邪恶的，乘坐着纳鲁的风暴要塞逃离了阿古斯行星。穿越了扭曲虚空之后，维伦和他的追随者最终到达了一个被他们称为德拉诺的新世界。基尔加丹为了消灭所有艾瑞达人的残余（现在被称为德莱尼人），将德拉诺大陆的兽人腐化为野蛮的战士，大肆屠杀德莱尼人。此外，血精灵的领袖凯尔萨斯王子发现了风暴要塞中潜藏的奥术能量，用武力将风暴要塞从纳鲁和德莱尼人手中抢了过来。"
Inst54Caption = "风暴要塞：禁魔监狱"
Inst54QAA = "6 个任务"
Inst54QAH = "6 个任务"
Inst54General = {

    {
    "自由的瑟雷凯斯",
    "暗影抗性装备和药水在战斗中非常有效，因为boss本身就是暗影。他所有的技能都可以躲开，虚空领域看上去就是一个黑色圆环，不要站在里面就可以了。至于腐蚀之种，它的攻击范围很小，只有10码。",
   RED .. "腐蚀之种：" .. WHITE .. " 对目标施放一枚恶魔种子，在18秒内造成3600点暗影伤害。当目标受到2500点暗影伤害之后，种子会爆发，对10码内的玩家造成伤害.\n" .. RED .. "暗影新星：" .. WHITE .. "AoE暗影冲击波，造成2200－2500暗影伤害，附带击退效果.\n" .. RED .. "随机虚空领域：" .. WHITE .. "在房间内随机施放，对处于其中的玩家造成每秒1500暗影伤害。",
    },

    {
    "末日预言者达尔莉安",
    "必须要避免的一点是不要在坦克身上有debuff的时候治疗他。当达利阿开始施放旋风技能时（她在这个时候不会移动），所有人包括坦克在内都需要移动开。当旋风技能结束时她会施放治疗，这时候近战再上去打断。",
    RED .. "末日诉说者的恩赐：" .. WHITE .. "这是一个危险的debuff，不能被驱散。当身上有这个debuff的队员受到治疗时，有一定几率也会治疗达尔莉安。\n" .. RED .. "治疗：" .. WHITE .. ": 在她生命不多时，施放了旋风技能之后她会施放这个技能。可以被打断（脚踢，反制等）。\n" .. RED .. "旋风：" .. WHITE .. "对附近的敌人进行旋风打击，持续8秒，造成通常伤害外加725点额外伤害。",
    },

    {
    "天怒预言者苏克拉底",
    "这个小boss比较难。他的击飞技能能够把玩家打飞40码。这样你必须背靠墙。这样当玩家背靠墙之后他会对随机玩家进行冲锋，在身后留下一道火痕。火痕会造成直接伤害和火系dot。\n此外，不要站在boss附近。他的火焰光环范围大约在15码左右，进入这个范围的玩家会受到一个火焰debuff的火焰伤害。你的队伍必须尽快干掉这个boss，治疗者不可能在这里支持很长时间。在必要的时候德鲁伊需要激活牧师。",
   RED .. "击飞:" .. WHITE .. "对附近10码的玩家进行沉重打击并将他们击飞.\n" .. RED .. "献祭：" .. WHITE .. " 对附近的玩家造成每2秒832至918点火焰伤害.\n" .. RED .. "恶魔之火残焰:" .. WHITE .. " 苏格拉底经过的地方身后将留下一道火焰残余，对任何站在上面的玩家造成每秒2000点伤害。\n" .. RED .. "恶魔之火震击：" .. WHITE .. "对一个玩家造成1500直接伤害，并且接下来受到12秒的火焰dot效果。",
    },

    {
    "预言者斯克瑞斯",
    "这一场战斗很有乐趣，也很有挑战。当你靠近这个正在引导一些罐子的血法师时，事件开始了。会分别出来四个罐子，其中第二个罐子是一个小侏儒，他会在后来的战斗中帮助你。其余3个罐子分别是小鬼，MC老七似的怪和精英龙人，中间有休息时间。BOSS战斗一开始是基本的坦克/dps战，但是他的技能很厉害。精神燃烧会对队员造成大量伤害，而一次不走运的精神控制会使战斗变得更为艰难。在战斗中他会复制自己2－3次。这时候你将会面对2个先驱者。所有队员应该马上将火力集中到无人坦克的那个先驱者身上。新出现的先驱者的生命较少，可以被很快杀死。如果你的队伍能够干掉复制，同时保持生存，那么胜利最终属于你们。",
   RED .. "精神燃烧:" .. WHITE .. " 对随机队伍目标造成1500－2000点伤害.\n" .. RED .. "精神控制：" .. WHITE .. " 对随机队伍目标进行精神控制.\n" .. RED .. "复制:" .. WHITE .. " 复制自己，出现一个同样技能但是HP很低的精英.",
    },
};

--Quest 1 Alliance
Inst54Quest1 = "1. 末日的预言者"
Inst54Quest1_Level = "70"
Inst54Quest1_Attain = "70"
Inst54Quest1_Aim = "进入风暴要塞的禁魔监狱，杀死预言者斯克瑞斯。完成任务后返回沙塔斯城的圣光广场，向阿达尔复命。"
Inst54Quest1_Location = "阿达尔 (沙塔斯城; "..YELLOW.."53,43"..WHITE..")"
Inst54Quest1_Note = "这是虚空风暴开始的一个连续任务，初始任务NPC是虚空行者 凯泽 在 "..YELLOW.."32,64"..WHITE.."."
Inst54Quest1_Prequest = "有,完成三角测量"
Inst54Quest1_Folgequest = "无"
Inst54Quest1PreQuest = "true"
--
Inst54Quest1name1 = "Potent Sha'tari Pendant"
Inst54Quest1name2 = "A'dal's Recovery Necklace"
Inst54Quest1name3 = "Shattrath Choker of Power"

--Quest 2 Alliance
Inst54Quest2 = "2. 先知乌达鲁"
Inst54Quest2_Level = "70"
Inst54Quest2_Attain = "68"
Inst54Quest2_Aim = "前往风暴要塞的禁魔监狱，寻找乌达鲁."
Inst54Quest2_Location = "阿卡玛 (影月谷; "..YELLOW.."58,48"..WHITE..")"
Inst54Quest2_Note = "需要完成影月谷的一个连续任务，初始NPC在 影月谷 "..YELLOW.."62,38"..WHITE.."(奥尔多) and "..YELLOW.."56,59"..WHITE.." (占星者)"
Inst54Quest2_Prequest = "有, 阿卡玛"
Inst54Quest2_Folgequest = "有, 神秘的征兆"
Inst54Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst54Quest3 = "3.纳鲁的试炼：坚韧（英雄难度）"
Inst54Quest3_Level = "70"
Inst54Quest3_Attain = "70"
Inst54Quest3_Aim = "沙塔斯城的阿达尔要求你从风暴要塞的禁魔监狱中救出米尔豪斯·法力风暴."
Inst54Quest3_Location = "阿达尔 (沙塔斯城; "..YELLOW.."53,43"..WHITE..")"
Inst54Quest3_Note = "这个任务需要英雄难度. 米尔豪斯·法力风暴就在监护者梅里卡尔的房间"..YELLOW.."[6]"..WHITE.."."
Inst54Quest3_Prequest = "无"
Inst54Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst54Quest4 = "4. 第二块和第三块"
Inst54Quest4_Level = "70"
Inst54Quest4_Attain = "68"
Inst54Quest4_Aim = "在盘牙洞穴的秘法容器里取得第二块钥匙碎片，风暴要塞的秘法容器里取得第三块钥匙碎片。完成任务后回到撒塔斯城的卡德加那里。"
Inst54Quest4_Location = "卡德加 (沙塔斯城; "..YELLOW.."53,43"..WHITE..")"
Inst54Quest4_Note = "秘法容器 在 "..YELLOW.."[2]"..WHITE.."."
Inst54Quest4_Prequest = "有, 卡拉赞的钥匙 (暗影迷宫)"
Inst54Quest4_Folgequest = "有, 麦迪文的触摸(黑色沼泽)"
Inst54Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst54Quest5 = "5. 悬赏：斯克瑞斯的卷轴 (英雄日常)"
Inst54Quest5_Level = "70"
Inst54Quest5_Attain = "70"
Inst54Quest5_Aim = "商人扎雷姆要求你夺得斯克瑞斯的卷轴。将卷轴带回沙塔斯城的贫民窟交给他，就能领取奖赏."
Inst54Quest5_Location = "商人扎雷姆 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst54Quest5_Note = "斯克瑞斯 在 "..YELLOW.."[6]"..WHITE.."."
Inst54Quest5_Prequest = "无"
Inst54Quest5_Folgequest = "无"
--
Inst54Quest5name1 = "公正徽章"

--Quest 6 Alliance
Inst54Quest6 = "6. 悬赏：禁魔监狱斥候 (普通日常)"
Inst54Quest6_Level = "70"
Inst54Quest6_Attain = "70"
Inst54Quest6_Aim = "虚空猎手玛哈杜恩要求你杀死5名禁魔监狱斥候。完成任务后返回沙塔斯城的贫民窟，找他领取奖赏."
Inst54Quest6_Location = "虚空猎手玛哈杜恩 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst54Quest6_Note = "普通日常."
Inst54Quest6_Prequest = "No"
Inst54Quest6_Folgequest = "No"
--
Inst54Quest6name1 = "Ethereum Prison Key"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst54Quest1_HORDE = Inst54Quest1
Inst54Quest1_HORDE_Level = Inst54Quest1_Level
Inst54Quest1_HORDE_Attain = Inst54Quest1_Attain
Inst54Quest1_HORDE_Aim = Inst54Quest1_Aim
Inst54Quest1_HORDE_Location = Inst54Quest1_Location
Inst54Quest1_HORDE_Note = Inst54Quest1_Note
Inst54Quest1_HORDE_Prequest = Inst54Quest1_Prequest
Inst54Quest1_HORDE_Folgequest = Inst54Quest1_Folgequest
Inst54Quest1PreQuest_HORDE = Inst54Quest1PreQuest
--
Inst54Quest1name1_HORDE = Inst54Quest1name1
Inst54Quest1name2_HORDE = Inst54Quest1name2
Inst54Quest1name3_HORDE = Inst54Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst54Quest2_HORDE = Inst54Quest2
Inst54Quest2_HORDE_Level = Inst54Quest2_Level
Inst54Quest2_HORDE_Attain = Inst54Quest2_Attain
Inst54Quest2_HORDE_Aim = Inst54Quest2_Aim
Inst54Quest2_HORDE_Location = Inst54Quest2_Location
Inst54Quest2_HORDE_Note = Inst54Quest2_Note
Inst54Quest2_HORDE_Prequest = Inst54Quest2_Prequest
Inst54Quest2_HORDE_Folgequest = Inst54Quest2_Folgequest
Inst54Quest2PreQuest_HORDE = Inst54Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst54Quest3_HORDE = Inst54Quest3
Inst54Quest3_HORDE_Level = Inst54Quest3_Level
Inst54Quest3_HORDE_Attain = Inst54Quest3_Attain
Inst54Quest3_HORDE_Aim = Inst54Quest3_Aim
Inst54Quest3_HORDE_Location = Inst54Quest3_Location
Inst54Quest3_HORDE_Note = Inst54Quest3_Note
Inst54Quest3_HORDE_Prequest = Inst54Quest3_Prequest
Inst54Quest3_HORDE_Folgequest = Inst54Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst54Quest4_HORDE = Inst54Quest4
Inst54Quest4_HORDE_Level = Inst54Quest4_Level
Inst54Quest4_HORDE_Attain = Inst54Quest4_Attain
Inst54Quest4_HORDE_Aim = Inst54Quest4_Aim
Inst54Quest4_HORDE_Location = Inst54Quest4_Location
Inst54Quest4_HORDE_Note = Inst54Quest4_Note
Inst54Quest4_HORDE_Prequest = Inst54Quest4_Prequest
Inst54Quest4_HORDE_Folgequest = Inst54Quest4_Folgequest
Inst54Quest4PreQuest_HORDE = Inst54Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst54Quest5_HORDE = Inst54Quest5
Inst54Quest5_HORDE_Level = Inst54Quest5_Level
Inst54Quest5_HORDE_Attain = Inst54Quest5_Attain
Inst54Quest5_HORDE_Aim = Inst54Quest5_Aim
Inst54Quest5_HORDE_Location = Inst54Quest5_Location
Inst54Quest5_HORDE_Note = Inst54Quest5_Note
Inst54Quest5_HORDE_Prequest = Inst54Quest5_Prequest
Inst54Quest5_HORDE_Folgequest = Inst54Quest5_Folgequest
--
Inst54Quest5name1_HORDE = Inst54Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst54Quest6_HORDE = Inst54Quest6
Inst54Quest6_HORDE_Level = Inst54Quest6_Level
Inst54Quest6_HORDE_Attain = Inst54Quest6_Attain
Inst54Quest6_HORDE_Aim = Inst54Quest6_Aim
Inst54Quest6_HORDE_Location = Inst54Quest6_Location
Inst54Quest6_HORDE_Note = Inst54Quest6_Note
Inst54Quest6_HORDE_Prequest = Inst54Quest6_Prequest
Inst54Quest6_HORDE_Folgequest = Inst54Quest6_Folgequest
--
Inst54Quest6name1_HORDE = Inst54Quest6name1



--------------- INST55 - TK: Botanica (Bot) ---------------

Inst55Story = "风暴要塞原先是神秘的纳鲁用来在大宇宙中旅行的跨次元飞船。燃烧军团的统领，堕落泰坦萨格拉斯看见了来自阿古斯行星的艾瑞达人的智慧，决定使他们成为他的恶魔军队的一员。阿克蒙德和基尔加丹，艾瑞达人的2个领袖，接受了萨格拉斯的邀请。但是第三位领袖维伦看到萨格拉斯是邪恶的，乘坐着纳鲁的风暴要塞逃离了阿古斯行星。穿越了扭曲虚空之后，维伦和他的追随者最终到达了一个被他们称为德拉诺的新世界。基尔加丹为了消灭所有艾瑞达人的残余（现在被称为德莱尼人），将德拉诺大陆的兽人腐化为野蛮的战士，大肆屠杀德莱尼人。此外，血精灵的领袖凯尔萨斯王子发现了风暴要塞中潜藏的奥术能量，用武力将风暴要塞从纳鲁和德莱尼人手中抢了过来。"
Inst55Caption = "风暴要塞 - 生态船"
Inst55QAA = "5 个任务"
Inst55QAH = "5 个任务"
Inst55General = {
    {
    "指挥官萨拉妮丝",
    "坦克可以在她的桥上拉住她，然后她会马上开始在坦克身上叠加奥术共振效果。最好驱散这些效果。很快她的生命就会降低到50％，随后她开始召唤救援。小队应该有一个计划来对付这些救援，控制他们或者干掉他们。例如说我们可以不断恐惧他们，迅速杀死boss，然后干掉血精灵护卫和血精灵修复者.",
    RED .. "奥术灾难" .. WHITE .. "瞬发的武器攻击，造成50％武器伤害，并且目标身上每一层奥术共振都会造成1200点额外伤害。\n" .. RED .. "奥术共振" .. WHITE .. ": 在近战武器击中时有一定几率触发，使目标受到的奥术伤害增加1200点。\n" .. RED .. "召唤救援" .. WHITE .. ": 在50％生命时，撒拉妮斯会召唤2个非精英的血精灵护卫和一个精英的血精灵修复者。（血精灵修复者会对她施放强效资料术，治疗9000点以上生命。他还可以给血精灵护卫buff，使他们可以施放500点伤害的奥术攻击）。",
    },

    {
    "高级植物学家弗雷温",
    "这场战斗的核心就在于站位。很重要的一点是在弗雷温开始引导宁静的时候我们把他的保护者拉出他的视线，这样我们就可以快速干掉它们。比较简单的一个策略是在桥上面对付boss然后利用墙来阻断视线。当boss刚刚变成生命之树的时候，每个人都要跑到墙的另一面去，然后等保护者一转过墙角就快速干掉它们。\n战斗的另一点就是在它施放的幼苗。幼苗会对队员，通常是坦克，施放某种debuff。我们能够驱散的只是魔法效果。但是它们的生命值很低，并且boss召唤它们的频率很快。我们需要有1个dps职业照看这些幼苗，它们只有1500血，几乎一出来就被干掉了。但是它们出现的速度如此之快，我们有可能需要第二个dps职业来对付它们，不过这也是视战斗情况而定。",
   RED .. "棘刺保护者:" .. WHITE .. "棘刺保护者可以使用'荆棘射击'技能，这是一种远程攻击，可以造成1200点自然伤害.\n" .. RED .. "种植‘某种颜色’的幼苗:" .. WHITE .. " 每5－10秒种植一次，可以施放一种debuff.\n" .. RED .. "生命之树:" .. WHITE .. " 每30 - 40秒弗莱文会变形成为一棵生命之树，并且开始引导不可打断的宁静法术，每秒治疗他和他的保护者964点生命。同时他会召唤3个保护者。",
    },

    {
    "看管者索恩格林",
    "在拉boss之前，他南边的一条走廊应该被清空，那里的墙上有隐形的虚空藤蔓。然后将boss从站立的地方拉到空旷的大厅中，这是为了避免他的地狱火施放到一个已经被牺牲技能击晕了的队员身上造成秒杀。他的牺牲技能对随机目标施放，需要对中了该技能的队员不断进行治疗。而他的地狱火技能很好躲开，在施放技能之前他会大叫，这时候要尽快离开他身边。",
   RED .. "激怒:" .. WHITE .. " 在20％生命时他会激怒，近战伤害增加。\n" .. RED .. "地狱火:" .. WHITE .. " AoE的火焰伤害，每秒造成1200 - 1500火焰伤害，持续8 - 10 秒，同时会大叫：我要烧尽你们.\n" .. RED .. "牺牲:" .. WHITE .. " 击晕一个队员并且每秒吸收642 - 708伤害，同时大叫：‘你的生命是我的’.",
    },
    
    {
    "拉伊",
    "拉伊的战斗比较简单，可以就在它站立的地方坦克它。在每个底座上面安排一个远程dps这样他们在消灭掉拉伊的召唤之后可以马上把火力转向boss。此外还有它的致病技能，但是只要及时驱散并且照顾好召唤，很快战斗就可以结束了。",
   RED .. "过敏反应:" .. WHITE .. " 使一个目标生病18秒，在此期间目标受到的伤害提高500点。同时造成自然伤害。生病的目标有一定几率传染给临近的队友。\n" .. RED .. "召唤荆棘:" .. WHITE .. "在拉伊面前的2个底座上出现一个荆棘鞭挞者或荆棘抽刺者攻击小队。",
    },
    
    {
    "迁跃扭木",
    "迁跃扭木的战斗不难，主要考验你的队伍集中火力的能力。\n战斗开始坦克要把boss拉好，然后dps和治疗都开始负起自己的责任。\n在战斗中boss会周期性的召唤树苗，树苗会缓慢走向队伍，并不会立刻造成威胁。召唤20秒过后，boss会吞噬树苗，根据树苗剩余生命的多少，恢复1％至30％生命。\n由于吞噬回复的生命值相当多，杀掉这些树苗是战斗中的首要目标。当他们出现时，所有dps必须集中尽快消灭它们。\n如果你的队伍能够坚持下去，这场战斗并不困难。",
   RED .. "群体奥术箭:" .. WHITE .. "AoE奥术箭，造成1500 - 2200 奥术伤害。\n" .. RED .. "践踏:" .. WHITE .. " 40码范围AoE击晕，造成1000 - 2500物理伤害，受到的物理伤害提高550点，持续5秒.\n" .. RED .. "召唤树苗:" .. WHITE .. " 召唤6只树苗从草地上开始攻击队伍，造成很小的物理伤害。召唤20秒后，boss会吞噬掉树苗，恢复等同于全部树苗剩余生命值的HP。",
    },
    
};

--Quest 1 Alliance
Inst55Quest1 = "1. 如何杀入禁魔监狱"
Inst55Quest1_Level = "70"
Inst55Quest1_Attain = "67"
Inst55Quest1_Aim = "阿达尔要你取回禁魔监狱钥匙的上半块和下半块，他会将这两块碎片组合成禁魔监狱钥匙."
Inst55Quest1_Location = "阿达尔 (沙塔斯城; "..YELLOW.."53,43"..WHITE..")"
Inst55Quest1_Note = "下半块出自 迁跃扭木 "..YELLOW.."[5]"..WHITE..". 上板块出自能量舰."
Inst55Quest1_Prequest = "有, 送往沙塔斯的特殊货物 "
Inst55Quest1_Folgequest = "有, 末日的预言者 (禁魔监狱)"
Inst55Quest1PreQuest = "true"
--
Inst55Quest1name1 = "Sha'tari Anchorite's Cloak"
Inst55Quest1name2 = "A'dal's Gift"
Inst55Quest1name3 = "Naaru Belt of Precision"
Inst55Quest1name4 = "Shattrath's Champion Belt"
Inst55Quest1name5 = "Sha'tari Vindicator's Waistguard"
Inst55Quest1name6 = "Key to the Arcatraz"

--Quest 2 Alliance
Inst55Quest2 = "2. 夺回钥石"
Inst55Quest2_Level = "70"
Inst55Quest2_Attain = "67"
Inst55Quest2_Aim = "进入风暴要塞的生态船，从指挥官萨拉妮丝手中夺得钥石，将它交给紫罗兰之塔的大法师瓦格斯."
Inst55Quest2_Location = "大法师瓦格斯 (虚空风暴; "..YELLOW.."58,86"..WHITE..")"
Inst55Quest2_Note = "指挥官萨拉妮丝 在 "..YELLOW.."[1]"..WHITE.."."
Inst55Quest2_Prequest = "有, 钥匙的主人"
Inst55Quest2_Folgequest = "无"
Inst55Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst55Quest3 = "3. 药水大师 (炼金术)"
Inst55Quest3_Level = "70"
Inst55Quest3_Attain = "68"
Inst55Quest3_Aim = "劳兰娜·萨维尔要你去风暴要塞的生态船，从高级植物学家弗雷温那里得到植物学家的指南，同时交给她5瓶超强治疗药水，5瓶超强法力药水和5瓶超强昏睡药水."
Inst55Quest3_Location = "劳兰娜·萨维尔 (赞加沼泽--塞纳里奥庇护所; "..YELLOW.."80,64"..WHITE..")"
Inst55Quest3_Note = "高级植物学家弗雷温 在 "..YELLOW.."[2]"..WHITE.."."
Inst55Quest3_Prequest = "有, 药水大师"
Inst55Quest3_Folgequest = "无"
Inst55Quest3PreQuest = "有"
-- No Rewards for this quest

--Quest 4 Alliance
Inst55Quest4 = "4. 悬赏：扭木碎片 (英雄日常)"
Inst55Quest4_Level = "70"
Inst55Quest4_Attain = "70"
Inst55Quest4_Aim = "商人扎雷姆要求你夺得一份扭木碎片。将碎片带回沙塔斯城的贫民窟交给他，就能领取奖赏."
Inst55Quest4_Location = "商人扎雷姆 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst55Quest4_Note = "迁跃扭木 在 "..YELLOW.."[5]"..WHITE.."."
Inst55Quest4_Prequest = "无"
Inst55Quest4_Folgequest = "无"
--
Inst55Quest4name1 = "公正徽章"

--Quest 5 Alliance
Inst55Quest5 = "5. 悬赏：寻日者导魔者 (普通日常)"
Inst55Quest5_Level = "70"
Inst55Quest5_Attain = "70"
Inst55Quest5_Aim = "虚空猎手玛哈杜恩要求你杀死6名寻日者导魔者。完成任务后返回沙塔斯城的贫民窟，找他领取奖赏."
Inst55Quest5_Location = "虚空猎手玛哈杜恩 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst55Quest5_Note = "普通日常任务."
Inst55Quest5_Prequest = "无"
Inst55Quest5_Folgequest = "无"
--
Inst55Quest5name1 = "Ethereum Prison Key"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst55Quest1_HORDE = Inst55Quest1
Inst55Quest1_HORDE_Level = Inst55Quest1_Level
Inst55Quest1_HORDE_Attain = Inst55Quest1_Attain
Inst55Quest1_HORDE_Aim = Inst55Quest1_Aim
Inst55Quest1_HORDE_Location = Inst55Quest1_Location
Inst55Quest1_HORDE_Note = Inst55Quest1_Note
Inst55Quest1_HORDE_Prequest = Inst55Quest1_Prequest
Inst55Quest1_HORDE_Folgequest = Inst55Quest1_Folgequest
Inst55Quest1PreQuest_HORDE = Inst55Quest1PreQuest
--
Inst55Quest1name1_HORDE = Inst55Quest1name1
Inst55Quest1name2_HORDE = Inst55Quest1name2
Inst55Quest1name3_HORDE = Inst55Quest1name3
Inst55Quest1name4_HORDE = Inst55Quest1name4
Inst55Quest1name5_HORDE = Inst55Quest1name5
Inst55Quest1name6_HORDE = Inst55Quest1name6

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst55Quest2_HORDE = Inst55Quest2
Inst55Quest2_HORDE_Level = Inst55Quest2_Level
Inst55Quest2_HORDE_Attain = Inst55Quest2_Attain
Inst55Quest2_HORDE_Aim = Inst55Quest2_Aim
Inst55Quest2_HORDE_Location = Inst55Quest2_Location
Inst55Quest2_HORDE_Note = Inst55Quest2_Note
Inst55Quest2_HORDE_Prequest = Inst55Quest2_Prequest
Inst55Quest2_HORDE_Folgequest = Inst55Quest2_Folgequest
Inst55Quest2PreQuest_HORDE = Inst55Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst55Quest3_HORDE = Inst55Quest3
Inst55Quest3_HORDE_Level = Inst55Quest3_Level
Inst55Quest3_HORDE_Attain = Inst55Quest3_Attain
Inst55Quest3_HORDE_Aim = Inst55Quest3_Aim
Inst55Quest3_HORDE_Location = Inst55Quest3_Location
Inst55Quest3_HORDE_Note = Inst55Quest3_Note
Inst55Quest3_HORDE_Prequest = Inst55Quest3_Prequest
Inst55Quest3_HORDE_Folgequest = Inst55Quest3_Folgequest
Inst55Quest3PreQuest_HORDE = Inst55Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst55Quest4_HORDE = Inst55Quest4
Inst55Quest4_HORDE_Level = Inst55Quest4_Level
Inst55Quest4_HORDE_Attain = Inst55Quest4_Attain
Inst55Quest4_HORDE_Aim = Inst55Quest4_Aim
Inst55Quest4_HORDE_Location = Inst55Quest4_Location
Inst55Quest4_HORDE_Note = Inst55Quest4_Note
Inst55Quest4_HORDE_Prequest = Inst55Quest4_Prequest
Inst55Quest4_HORDE_Folgequest = Inst55Quest4_Folgequest
--
Inst55Quest4name1_HORDE = Inst55Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst55Quest5_HORDE = Inst55Quest5
Inst55Quest5_HORDE_Level = Inst55Quest5_Level
Inst55Quest5_HORDE_Attain = Inst55Quest5_Attain
Inst55Quest5_HORDE_Aim = Inst55Quest5_Aim
Inst55Quest5_HORDE_Location = Inst55Quest5_Location
Inst55Quest5_HORDE_Note = Inst55Quest5_Note
Inst55Quest5_HORDE_Prequest = Inst55Quest5_Prequest
Inst55Quest5_HORDE_Folgequest = Inst55Quest5_Folgequest
--
Inst55Quest5name1_HORDE = Inst55Quest5name1



--------------- INST56 - TK: Mechanar (Mech) ---------------

Inst56Story = "风暴要塞原先是神秘的纳鲁用来在大宇宙中旅行的跨次元飞船。燃烧军团的统领，堕落泰坦萨格拉斯看见了来自阿古斯行星的艾瑞达人的智慧，决定使他们成为他的恶魔军队的一员。阿克蒙德和基尔加丹，艾瑞达人的2个领袖，接受了萨格拉斯的邀请。但是第三位领袖维伦看到萨格拉斯是邪恶的，乘坐着纳鲁的风暴要塞逃离了阿古斯行星。穿越了扭曲虚空之后，维伦和他的追随者最终到达了一个被他们称为德拉诺的新世界。基尔加丹为了消灭所有艾瑞达人的残余（现在被称为德莱尼人），将德拉诺大陆的兽人腐化为野蛮的战士，大肆屠杀德莱尼人。此外，血精灵的领袖凯尔萨斯王子发现了风暴要塞中潜藏的奥术能量，用武力将风暴要塞从纳鲁和德莱尼人手中抢了过来。"
Inst56Caption = "风暴要塞 - 能量舰"
Inst56QAA = "4 个任务"
Inst56QAH = "4 个任务"
Inst56General = {
    {
    "看守者埃隆汉",
    "英雄模式下 躲他的拳头,其余没难度",
    RED .. "重重的抡起它的拳头" .. WHITE .. "：赶紧跑开吧，这时候它不动的",
    },
    
    {
    "机械领主卡帕西图斯",
    "这个boss最厉害的攻击是虚空充能，它可以很轻易的造成团灭。你的队员需要躲开悬浮炸弹的伤害。你可以将除了坦克和近战dps的队员躲在通往boss的楼梯上。然后你的坦克将boss拉到它的房间边缘作战，远离他原来的位置。虚空充能炸弹将从那里释放。\n此外，你还需要当心他的反射盾技能。你可以通过侦测魔法技能探测，并且他的反射盾都有独特的动画显示：红色的物理攻击反射和绿色的魔法反射。",
    RED .. "裂颅：" .. WHITE .. "单体debuff，降低耐力200点。\n" .. RED .. "虚空充能" .. WHITE .. ": 在整场战斗中，机械领主卡帕西图斯都会召唤悬浮炸弹。当这些炸弹爆炸时，会连续造成2次小的AoE伤害，然后是一次较大的AoE伤害（2000－3000）。\n" .. RED .. "伤害反射盾:" .. WHITE .. " 在boss身边召唤保护盾（红色），对击中它的近战攻击者造成750点奥术伤害\n" .. RED .. "魔法反射盾:" .. WHITE .. " 在boss身边召唤保护盾（绿色），反射100％的魔法攻击，持续10秒。\n" .. BLUE .. "英雄难度要点：英雄模式的这个BOSS会给玩家身上放正极电或者负极电的DEBUFF，电极相同的玩家在一起会得到伤害加成（比如2个同极电的在一起就会使伤害提高100%，3个同极电的在一起伤害会提高200%，以此类推），电极不同的玩家在一起则会相互放电造成伤害（每一次约2000伤害）。",
    },

    {
    "灵术师塞比瑟蕾",
    "首先要清空灵术师塞比瑟蕾的房间，因为你需要一定的空间来风筝2个愤怒火焰。只要能够小心的风筝火焰，战斗很简单。\n在boss战开始之后，灵术师塞比瑟蕾召唤2个愤怒火焰。获得愤怒火焰仇恨的人要将它们从队伍附近带开。它们移动速度很慢所以风筝起来应该很简单。\n在坦克中了困惑效果之后要马上解除，让坦克马上重新获得仇恨，否则她会攻击别人",
   RED .. "龙息术:" .. WHITE .. " 与法师法术相同，造成的困惑效果会清除仇恨.\n" .. RED .. "霜击:" .. WHITE .. " 移动速度降低50％.\n" .. RED .. "召唤愤怒火焰:" .. WHITE .. " 进入战斗之后，灵术师塞比瑟蕾会召唤2个愤怒火焰（你不能放逐或恐惧它们）。它们的近战攻击会造成500－800点火焰伤害，在移动的时候会在地上留下一道火痕。不要踩在火痕上。在很短一段时间之后，它们会停止追逐它们的目标，开始施放地狱火。它们永远不会攻击boss的目标.\n\n" .. BLUE .. "英雄难度要点：英雄模式下会有3个火元素，更加考验站位，确保第2仇恨不是治疗可以在MT被龙息后被至于导致灭团。",
    },

    {
    "计算者帕萨雷恩",
    "战斗比较简单，让一个坦克来面对boss，剩余的队员全力对付召唤出来的幽魂。当所有的幽魂被消灭之后就去对付boss。至于他的精神控制，对被控制的队员稍微控制一下（恐惧，变羊……）就可以了。当然，如果有牧师或SS群恐，法师冰霜新星也可以控制怪然后集中BOSS",
   RED .. "沉默（AoE）:" .. WHITE .. " 范围沉默，持续3秒.\n" .. RED .. "统御意志:" .. WHITE .. "精神控制技能，无法驱散.\n" .. RED .. "法力抽取:" .. WHITE .. "血精灵种族技能，抽取大约1500法力值.\n" .. RED .. "召唤虚空幽魂:" .. WHITE .. " 每30－45秒他会召唤4只虚空幽魂，幽魂会施放1300－1700伤害的奥术飞弹技能。\n\n" .. BLUE .. "英雄难度要点：BOSS攻击并不高,开始他会控制一个队友,可以冰箱解除,战斗开始30秒左右会招第一波小怪,可以先恐惧 冰环,治疗注意自己仇恨.等第二波小怪出来法师暴掉,期间DPS BOSS,最后阶段BOSS会狂暴,攻击速度和攻击都提升,开个泼技能就过去了,然后就祈祷自己的运气吧。切记，这个boss奥爆可以打断",
    },
};

--Quest 1 Alliance
Inst56Quest1 = "1. 如何杀入禁魔监狱"
Inst56Quest1_Level = "70"
Inst56Quest1_Attain = "67"
Inst56Quest1_Aim = "阿达尔要你取回禁魔监狱钥匙的上半块和下半块，他会将这两块碎片组合成禁魔监狱钥匙."
Inst56Quest1_Location = "阿达尔 (沙塔斯城; "..YELLOW.."53,43"..WHITE..")"
Inst56Quest1_Note = "上半块由 计算者帕萨雷恩的影像 掉落，就在 "..YELLOW.."[5]"..WHITE..". 下半块在生态船."
Inst56Quest1_Prequest = "有, 送往沙塔斯的特殊货物 "
Inst56Quest1_Folgequest = "有, 末日的预言者 (禁魔监狱)"
Inst56Quest1PreQuest = "true"
--
Inst56Quest1name1 = "Sha'tari Anchorite's Cloak"
Inst56Quest1name2 = "A'dal's Gift"
Inst56Quest1name3 = "Naaru Belt of Precision"
Inst56Quest1name4 = "Shattrath's Champion Belt"
Inst56Quest1name5 = "Sha'tari Vindicator's Waistguard"
Inst56Quest1name6 = "Key to the Arcatraz"

--Quest 2 Alliance
Inst56Quest2 = "2. 能源舰的热源"
Inst56Quest2_Level = "69"
Inst56Quest2_Attain = "67"
Inst56Quest2_Aim = "将超载的魔法晶格交给韦恩的避难所的戴维·韦恩."
Inst56Quest2_Location = "戴维·韦恩 (泰罗卡森林; "..YELLOW.."78,39"..WHITE..")."
Inst56Quest2_Note = "魔法晶格在 机械领主卡帕西图斯 "..YELLOW.."[3]"..WHITE.." 前面，挨着墙的一个箱子里."
Inst56Quest2_Prequest = "有, 其它的材料"
Inst56Quest2_Folgequest = "无"
Inst56Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst56Quest3 = "3. 悬赏：帕萨雷恩的投影仪 (英雄日常)"
Inst56Quest3_Level = "70"
Inst56Quest3_Attain = "70"
Inst56Quest3_Aim = "商人扎雷姆要求你夺得帕萨雷恩的投影仪。将投影仪带回沙塔斯城的贫民窟交给他，就能领取奖赏."
Inst56Quest3_Location = "商人扎雷姆 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst56Quest3_Note = " 帕萨雷恩 在"..YELLOW.."[5]"..WHITE.."."
Inst56Quest3_Prequest = "No"
Inst56Quest3_Folgequest = "No"
--
Inst56Quest3name1 = "公正徽章"

--Quest 4 Alliance
Inst56Quest4 = "4. 悬赏：风暴锻铸摧毁者 (普通日常)"
Inst56Quest4_Level = "70"
Inst56Quest4_Attain = "70"
Inst56Quest4_Aim = "虚空猎手玛哈杜恩要求你杀死5名风暴锻铸摧毁者。完成任务后返回沙塔斯城的贫民窟，找他领取奖赏."
Inst56Quest4_Location = "虚空猎手玛哈杜恩 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst56Quest4_Note = "普通日常任务."
Inst56Quest4_Prequest = "无"
Inst56Quest4_Folgequest = "无"
--
Inst56Quest4name1 = "Ethereum Prison Key"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst56Quest1_HORDE = Inst56Quest1
Inst56Quest1_HORDE_Level = Inst56Quest1_Level
Inst56Quest1_HORDE_Attain = Inst56Quest1_Attain
Inst56Quest1_HORDE_Aim = Inst56Quest1_Aim
Inst56Quest1_HORDE_Location = Inst56Quest1_Location
Inst56Quest1_HORDE_Note = Inst56Quest1_Note
Inst56Quest1_HORDE_Prequest = Inst56Quest1_Prequest
Inst56Quest1_HORDE_Folgequest = Inst56Quest1_Folgequest
Inst56Quest1PreQuest_HORDE = Inst56Quest1PreQuest
--
Inst56Quest1name1_HORDE = Inst56Quest1name1
Inst56Quest1name2_HORDE = Inst56Quest1name2
Inst56Quest1name3_HORDE = Inst56Quest1name3
Inst56Quest1name4_HORDE = Inst56Quest1name4
Inst56Quest1name5_HORDE = Inst56Quest1name5
Inst56Quest1name6_HORDE = Inst56Quest1name6

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst56Quest2_HORDE = Inst56Quest2
Inst56Quest2_HORDE_Level = Inst56Quest2_Level
Inst56Quest2_HORDE_Attain = Inst56Quest2_Attain
Inst56Quest2_HORDE_Aim = Inst56Quest2_Aim
Inst56Quest2_HORDE_Location = Inst56Quest2_Location
Inst56Quest2_HORDE_Note = Inst56Quest2_Note
Inst56Quest2_HORDE_Prequest = Inst56Quest2_Prequest
Inst56Quest2_HORDE_Folgequest = Inst56Quest2_Folgequest
Inst56Quest2PreQuest_HORDE = Inst56Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst56Quest3_HORDE = Inst56Quest3
Inst56Quest3_HORDE_Level = Inst56Quest3_Level
Inst56Quest3_HORDE_Attain = Inst56Quest3_Attain
Inst56Quest3_HORDE_Aim = Inst56Quest3_Aim
Inst56Quest3_HORDE_Location = Inst56Quest3_Location
Inst56Quest3_HORDE_Note = Inst56Quest3_Note
Inst56Quest3_HORDE_Prequest = Inst56Quest3_Prequest
Inst56Quest3_HORDE_Folgequest = Inst56Quest3_Folgequest
--
Inst56Quest3name1_HORDE = Inst56Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst56Quest4_HORDE = Inst56Quest4
Inst56Quest4_HORDE_Level = Inst56Quest4_Level
Inst56Quest4_HORDE_Attain = Inst56Quest4_Attain
Inst56Quest4_HORDE_Aim = Inst56Quest4_Aim
Inst56Quest4_HORDE_Location = Inst56Quest4_Location
Inst56Quest4_HORDE_Note = Inst56Quest4_Note
Inst56Quest4_HORDE_Prequest = Inst56Quest4_Prequest
Inst56Quest4_HORDE_Folgequest = Inst56Quest4_Folgequest
--
Inst56Quest4name1_HORDE = Inst56Quest4name1



--------------- INST57 - SM: Armory (SM Arm) ---------------

Inst57Story = "血色修道院曾经是洛丹伦王国牧师的荣耀之地——那里是学习圣光只是和膜拜的中心。随着在第三次大战中亡灵天灾的崛起，宁静的修道院成为了疯狂的血色十字军的要塞。十字军对于所有非人类都有着偏激的态度，无论他们是自己的盟友还是对手。他们相信所有任何外来者都带着亡灵的瘟疫——他们必须被摧毁。有报告说所有进入修道院的冒险者都要面对血色十字军指挥官莫格莱尼——他控制了一群狂热的十字军战士。然而，修道院的真正主人是大检察官怀特迈恩——一个疯狂的牧师，她具有复活死去的战士来为其效劳的能力。"
Inst57Caption = "血色修道院：军械库"
Inst57QAA = "1 个任务"
Inst57QAH = "2 个任务"

--Quest 1 Alliance
Inst57Quest1 = "1. 以圣光之名"
Inst57Quest1_Level = "40"
Inst57Quest1_Attain = "34"
Inst57Quest1_Aim = "杀死大检察官怀特迈恩，血色十字军指挥官莫格莱尼，十字军的勇士赫洛德和驯犬者洛克希并向南海镇的莱雷恩复命。"
Inst57Quest1_Location = "虔诚的莱雷恩（希尔斯布莱德丘陵 - 南海镇; "..YELLOW.."51,58 "..WHITE.."）"
Inst57Quest1_Note = "此系列任务始于克罗雷修士（暴风城 - 光明大教堂; "..YELLOW.."42,24"..WHITE.."）。\n大检察官怀特迈恩和血色十字军指挥官莫格莱尼在血色修道院"..YELLOW.."教堂[2]"..WHITE.."，赫洛德在血色修道院"..YELLOW.."军械库[1]"..WHITE.."，驯犬者洛克希在血色修道院"..YELLOW.."图书馆[1]"..WHITE.."。"
Inst57Quest1_Prequest ="有，安东修士 -> 血色之路"
Inst57Quest1_Folgequest = "无"
Inst57Quest1PreQuest = "true"
--
Inst57Quest1name1 = "平静之剑"
Inst57Quest1name2 = "咬骨之斧"
Inst57Quest1name3 = "黑暗威胁"
Inst57Quest1name4 = "洛瑞卡宝珠"


--Quest 1 Horde
Inst57Quest1_HORDE = "1. 狂热之心"
Inst57Quest1_HORDE_Level = "33"
Inst57Quest1_HORDE_Attain = "30"
Inst57Quest1_HORDE_Aim = "幽暗城的大药剂师法拉尼尔需要20颗狂热之心。"
Inst57Quest1_HORDE_Location = "大药剂师法拉尼尔（幽暗城 - 炼金房; "..YELLOW.."48,69 "..WHITE.."）"
Inst57Quest1_HORDE_Note = "血色所有的怪均掉落。"
Inst57Quest1_HORDE_Prequest = "有，蝙蝠的粪便（"..YELLOW.."[剃刀沼泽]"..WHITE.."）"
Inst57Quest1_HORDE_Folgequest = "无"
Inst57Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst57Quest2_HORDE = "2. 深入血色修道院"
Inst57Quest2_HORDE_Level = "42"
Inst57Quest2_HORDE_Attain = "33"
Inst57Quest2_HORDE_Aim = "杀掉大检察官怀特迈恩、血色十字军指挥官莫格莱尼、血色十字军勇士赫洛德和驯犬者洛克希，然后向幽暗城的瓦里玛萨斯回报。"
Inst57Quest2_HORDE_Location = "瓦里玛萨斯（幽暗城 - 皇家区; "..YELLOW.."56,92 "..WHITE.."）"
Inst57Quest2_HORDE_Note = "大检察官怀特迈恩和血色十字军指挥官莫格莱尼在血色修道院"..YELLOW.."教堂[2]"..WHITE.."，赫洛德在血色修道院"..YELLOW.."军械库[1]"..WHITE.."，驯犬者洛克希在血色修道院"..YELLOW.."图书馆[1]"..WHITE.."。"
Inst57Quest2_HORDE_Prequest = "无"
Inst57Quest2_HORDE_Folgequest = "无"
--
Inst57Quest2name1_HORDE = "预兆之剑"
Inst57Quest2name2_HORDE = "预言藤杖"
Inst57Quest2name3_HORDE = "龙血项链"



--------------- INST58 - SM: Cathedral (SM Cath) ---------------

Inst58Story = "血色修道院曾经是洛丹伦王国牧师的荣耀之地——那里是学习圣光只是和膜拜的中心。随着在第三次大战中亡灵天灾的崛起，宁静的修道院成为了疯狂的血色十字军的要塞。十字军对于所有非人类都有着偏激的态度，无论他们是自己的盟友还是对手。他们相信所有任何外来者都带着亡灵的瘟疫——他们必须被摧毁。有报告说所有进入修道院的冒险者都要面对血色十字军指挥官莫格莱尼——他控制了一群狂热的十字军战士。然而，修道院的真正主人是大检察官怀特迈恩——一个疯狂的牧师，她具有复活死去的战士来为其效劳的能力。"
Inst58Caption = "血色修道院：教堂"
Inst58QAA = "1 个任务"
Inst58QAH = "2 个任务"

--Quest 1 Alliance
Inst58Quest1 = "1. 以圣光之名"
Inst58Quest1_Level = "40"
Inst58Quest1_Attain = "34"
Inst58Quest1_Aim =  "杀死大检察官怀特迈恩，血色十字军指挥官莫格莱尼，十字军的勇士赫洛德和驯犬者洛克希并向南海镇的莱雷恩复命。"
Inst58Quest1_Location = "虔诚的莱雷恩（希尔斯布莱德丘陵 - 南海镇; "..YELLOW.."51,58 "..WHITE.."）"
Inst58Quest1_Note = "此系列任务始于克罗雷修士（暴风城 - 光明大教堂; "..YELLOW.."42,24"..WHITE.."）。\n大检察官怀特迈恩和血色十字军指挥官莫格莱尼在血色修道院"..YELLOW.."教堂[2]"..WHITE.."，赫洛德在血色修道院"..YELLOW.."军械库[1]"..WHITE.."，驯犬者洛克希在血色修道院"..YELLOW.."图书馆[1]"..WHITE.."。"
Inst58Quest1_Prequest = "有，安东修士 -> 血色之路"
Inst58Quest1_Folgequest = "无"
Inst58Quest1PreQuest = "true"
--
Inst58Quest1name1 = "平静之剑"
Inst58Quest1name2 = "咬骨手斧"
Inst58Quest1name3 = "黑暗威胁"
Inst58Quest1name4 = "洛瑞卡宝珠"


--Quest 1 Horde
Inst58Quest1_HORDE = "1. 狂热之心"
Inst58Quest1_HORDE_Level = "33"
Inst58Quest1_HORDE_Attain = "30"
Inst58Quest1_HORDE_Aim = "幽暗城的大药剂师法拉尼尔需要20颗狂热之心。"
Inst58Quest1_HORDE_Location = "大药剂师法拉尼尔（幽暗城 - 炼金房; "..YELLOW.."48,69 "..WHITE.."）"
Inst58Quest1_HORDE_Note = "血色所有的怪均掉落。"
Inst58Quest1_HORDE_Prequest = "有，蝙蝠的粪便（"..YELLOW.."[剃刀沼泽]"..WHITE.."）"
Inst58Quest1_HORDE_Folgequest = "无"
Inst58Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst58Quest2_HORDE = "2. 深入血色修道院"
Inst58Quest2_HORDE_Level = "42"
Inst58Quest2_HORDE_Attain = "33"
Inst58Quest2_HORDE_Aim = "杀掉大检察官怀特迈恩、血色十字军指挥官莫格莱尼、血色十字军勇士赫洛德和驯犬者洛克希，然后向幽暗城的瓦里玛萨斯回报。"
Inst58Quest2_HORDE_Location = "瓦里玛萨斯（幽暗城 - 皇家区; "..YELLOW.."56,92 "..WHITE.."）"
Inst58Quest2_HORDE_Note = "大检察官怀特迈恩 和 血色十字军指挥官莫格莱尼 在 "..YELLOW.."血色修道院：教堂 [2]"..WHITE..",赫洛德 在 "..YELLOW.."血色修道院：军械库[1]"..WHITE.."，  驯犬者洛克希 在 "..YELLOW.."血色修道院：图书馆[1]"..WHITE.."."
Inst58Quest2_HORDE_Prequest = "无"
Inst58Quest2_HORDE_Folgequest = "无"
--
Inst58Quest2name1_HORDE = "预兆之剑"
Inst58Quest2name2_HORDE = "预言藤杖"
Inst58Quest2name3_HORDE = "龙血项链"



--------------- INST59 - SM: Graveyard (SM GY) ---------------

Inst59Story = "血色修道院曾经是洛丹伦王国牧师的荣耀之地——那里是学习圣光只是和膜拜的中心。随着在第三次大战中亡灵天灾的崛起，宁静的修道院成为了疯狂的血色十字军的要塞。十字军对于所有非人类都有着偏激的态度，无论他们是自己的盟友还是对手。他们相信所有任何外来者都带着亡灵的瘟疫——他们必须被摧毁。有报告说所有进入修道院的冒险者都要面对血色十字军指挥官莫格莱尼——他控制了一群狂热的十字军战士。然而，修道院的真正主人是大检察官怀特迈恩——一个疯狂的牧师，她具有复活死去的战士来为其效劳的能力。"
Inst59Caption = "血色修道院：墓地"
Inst59QAA = "1 个任务"
Inst59QAH = "3 个任务"

--Quest 1 Alliance
Inst59Quest1 = "1. 召唤无头骑士（日常 - 季节性）"
Inst59Quest1_Level = "70"
Inst59Quest1_Attain = "70"
Inst59Quest1_Aim = "将一根悲伤蜡烛插入翻过的泥土。"
Inst59Quest1_Location = "南瓜神龛（血色修道院 - 墓地; "..YELLOW.."[2]"..WHITE.."）"
Inst59Quest1_Note = "南瓜神龛旁边就是翻过的泥土。这是一个只有在万圣节期间的季节性日常任务。\n\n召唤出来的无头骑士是70级别 Boss。"
Inst59Quest1_Prequest = "No"
Inst59Quest1_Folgequest = "No"
-- No Rewards for this quest


--Quest 1 Horde
Inst59Quest1_HORDE = "1. 沃瑞尔的复仇"
Inst59Quest1_HORDE_Level = "33"
Inst59Quest1_HORDE_Attain = "25"
Inst59Quest1_HORDE_Aim = "把沃瑞尔·森加斯的结婚戒指还给塔伦米尔的莫尼卡·森古特斯。"
Inst59Quest1_HORDE_Location =  "沃瑞尔·森加斯（血色修道院 - 墓地; "..YELLOW.."[1]"..WHITE.."）"
Inst59Quest1_HORDE_Note = "沃瑞尔·森加斯位于血色修道院墓地前部。南茜在（奥特兰克山脉; "..YELLOW.."31,32"..WHITE..")。 她有任务需要的戒指。"
Inst59Quest1_HORDE_Prequest = "无"
Inst59Quest1_HORDE_Folgequest = "无"
--
Inst59Quest1name1_HORDE = "沃瑞尔的靴子"
Inst59Quest1name2_HORDE = "悲哀衬肩"
Inst59Quest1name3_HORDE = "十字军斗篷"

--Quest 2 Horde
Inst59Quest2_HORDE = "2. 狂热之心"
Inst59Quest2_HORDE_Level = "33"
Inst59Quest2_HORDE_Attain = "30"
Inst59Quest2_HORDE_Aim = "幽暗城的大药剂师法拉尼尔需要20颗狂热之心。"
Inst59Quest2_HORDE_Location = "大药剂师法拉尼尔（幽暗城 - 炼金房; "..YELLOW.."48,69 "..WHITE.."）"
Inst59Quest2_HORDE_Note =  "血色所有的怪均掉落。"
Inst59Quest2_HORDE_Prequest = "有，蝙蝠的粪便（"..YELLOW.."[剃刀沼泽]"..WHITE.."）"
Inst59Quest2_HORDE_Folgequest = "无"
Inst59Quest2PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 1 Alliance)
Inst59Quest3_HORDE = "3. Call the Headless Horseman (Daily - Seasonal)"
Inst59Quest3_HORDE_Level = Inst59Quest1_Level
Inst59Quest3_HORDE_Attain = Inst59Quest1_Attain
Inst59Quest3_HORDE_Aim = Inst59Quest1_Aim
Inst59Quest3_HORDE_Location = Inst59Quest1_Location
Inst59Quest3_HORDE_Note = Inst59Quest1_Note
Inst59Quest3_HORDE_Prequest = Inst59Quest1_Prequest
Inst59Quest3_HORDE_Folgequest = Inst59Quest1_Folgequest
-- No Rewards for this quest



--------------- INST61 - TK: The Eye ---------------

Inst61Story = "风暴要塞原先是神秘的纳鲁用来在大宇宙中旅行的跨次元飞船。血精灵的领袖凯尔萨斯王子发现了风暴要塞中潜藏的奥术能量，用武力将风暴要塞从纳鲁和德莱尼人手中抢了过来."
Inst61Caption = "风暴之眼"
Inst61QAA = "3 个任务"
Inst61QAH = "3 个任务"

--Quest 1 Alliance
Inst61Quest1 = "1. 灰舌的伪装"
Inst61Quest1_Level = "70"
Inst61Quest1_Attain = "70"
Inst61Quest1_Aim = "前往风暴要塞，穿上灰舌的伪装杀死奥. 完成任务后向影月谷的阿卡玛复命."
Inst61Quest1_Location = "阿卡玛 (影月谷; "..YELLOW.."58,48"..WHITE..")"
Inst61Quest1_Note = "这个是黑暗神殿任务链的一步."
Inst61Quest1_Prequest = "有, 神秘的征兆"
Inst61Quest1_Folgequest = "有, 古老的神器 (海加尔)"
Inst61Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst61Quest2 = "2. 凯尔萨斯和翠绿的魔珠"
Inst61Quest2_Level = "70"
Inst61Quest2_Attain = "70"
Inst61Quest2_Aim = "将翠绿的魔珠交给沙塔斯城的阿达尔."
Inst61Quest2_Location = "翠绿的魔珠 (掉落)"
Inst61Quest2_Note = "翠绿的魔珠由 凯尔萨斯 逐日者掉落"..YELLOW.."[4]"..WHITE.."."
Inst61Quest2_Prequest = "无"
Inst61Quest2_Folgequest = "无"
-- No Rewards for this quest

--Quest 3 Alliance
Inst61Quest3 = "3. 永恒水瓶"
Inst61Quest3_Level = "70"
Inst61Quest3_Attain = "70"
Inst61Quest3_Aim = "时光之穴的索莉多米要你从盘牙水库的瓦丝琪那里取回瓦丝琪的水瓶残余，并从风暴要塞的凯尔萨斯·逐日者那里取回凯尔萨斯的水瓶残余."
Inst61Quest3_Location = "索莉多米 (塔纳利斯--时光之穴; "..YELLOW.."58,57"..WHITE.."). NPC在附近游荡."
Inst61Quest3_Note = "曾经，要进去时光之穴--海加尔之战，这个任务是必须完成的. 卡尔萨斯 逐日者 在 "..YELLOW.."[4]"..WHITE.."."
Inst61Quest3_Prequest = "无"
Inst61Quest3_Folgequest = "无"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst61Quest1_HORDE = Inst61Quest1
Inst61Quest1_HORDE_Level = Inst61Quest1_Level
Inst61Quest1_HORDE_Attain = Inst61Quest1_Attain
Inst61Quest1_HORDE_Aim = Inst61Quest1_Aim
Inst61Quest1_HORDE_Location = Inst61Quest1_Location
Inst61Quest1_HORDE_Note = Inst61Quest1_Note
Inst61Quest1_HORDE_Prequest = Inst61Quest1_Prequest
Inst61Quest1_HORDE_Folgequest = Inst61Quest1_Folgequest
Inst61Quest1PreQuest_HORDE = Inst61Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst61Quest2_HORDE = Inst61Quest2
Inst61Quest2_HORDE_Level = Inst61Quest2_Level
Inst61Quest2_HORDE_Attain = Inst61Quest2_Attain
Inst61Quest2_HORDE_Aim = Inst61Quest2_Aim
Inst61Quest2_HORDE_Location = Inst61Quest2_Location
Inst61Quest2_HORDE_Note = Inst61Quest2_Note
Inst61Quest2_HORDE_Prequest = Inst61Quest2_Prequest
Inst61Quest2_HORDE_Folgequest = Inst61Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst61Quest3_HORDE = Inst61Quest3
Inst61Quest3_HORDE_Level = Inst61Quest3_Level
Inst61Quest3_HORDE_Attain = Inst61Quest3_Attain
Inst61Quest3_HORDE_Aim = Inst61Quest3_Aim
Inst61Quest3_HORDE_Location = Inst61Quest3_Location
Inst61Quest3_HORDE_Note = Inst61Quest3_Note
Inst61Quest3_HORDE_Prequest = Inst61Quest3_Prequest
Inst61Quest3_HORDE_Folgequest = Inst61Quest3_Folgequest
-- No Rewards for this quest



--------------- INST62 - Black Temple (BT) ---------------

Inst62Story = {
  ["Page1"] = "在德拉诺大陆分崩离析之前，黑暗神殿的名字叫做卡拉波神庙，是德莱尼人供奉先知维伦的圣堂。而邪恶的古尔丹在打开了黑暗之门后，把这里占据了.",
  ["Page2"] = "在德拉诺大陆被燃烧军团的铁蹄碾碎后，这里改名叫做黑暗堡垒。后来玛瑟里顿又占据了这里，不过没多久，从诺森德铩羽而归的伊利丹成了这里新的主人，并将这里改名叫做‘黑暗神殿’，已然发疯的伊利丹和他的手下们就盘踞在这里.",
  ["MaxPages"] = "2",
};
Inst62Caption = "黑暗神殿"
Inst62QAA = "3 个任务"
Inst62QAH = "3 个任务"

--Quest 1 Alliance
Inst62Quest1 = "1. 寻找灰舌"
Inst62Quest1_Level = "70"
Inst62Quest1_Attain = "70"
Inst62Quest1_Aim = "在黑暗神殿内找到阿卡玛的死誓者."
Inst62Quest1_Location = "克希利 (影月谷; "..YELLOW.."65,44"..WHITE..")."
Inst62Quest1_Note = ""
Inst62Quest1_Prequest = "有，帮助阿卡玛 "
Inst62Quest1_Folgequest = "有，灰舌族的救赎"
Inst62Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst62Quest2 = "2. 灰舌族的救赎"
Inst62Quest2_Level = "70"
Inst62Quest2_Attain = "70"
Inst62Quest2_Aim = "击败黑暗神庙的阿卡玛的阴影来帮助阿卡玛夺回他的灵魂。完成后回到先知卡奈那裡."
Inst62Quest2_Location = "先知卡奈 (黑色神庙; "..YELLOW.."[]"..WHITE..")."
Inst62Quest2_Note = "阿卡玛之影 在 "..YELLOW.."[4]"..WHITE.."."
Inst62Quest2_Prequest = "有,寻找灰舌"
Inst62Quest2_Folgequest = "有,背叛者之死 "
Inst62Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst62Quest3 = "3. 背叛者之死"
Inst62Quest3_Level = "70"
Inst62Quest3_Attain = "70"
Inst62Quest3_Aim = "先知卡奈要你杀死黑色神庙里的背叛者伊利丹怒风."
Inst62Quest3_Location = "先知卡奈 (黑色神庙; "..YELLOW.."[]"..WHITE..")."
Inst62Quest3_Note = "伊利丹怒风 在 黑色神庙上层地图的 "..YELLOW.."[3]"..WHITE.." ."
Inst62Quest3_Prequest = "有，灰舌族的救赎"
Inst62Quest3_Folgequest = "无"
Inst62Quest3FQuest = "true"
--
Inst62Quest3name1 = "Blessed Medallion of Karabor"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst62Quest1_HORDE = Inst62Quest1
Inst62Quest1_HORDE_Level = Inst62Quest1_Level
Inst62Quest1_HORDE_Attain = Inst62Quest1_Attain
Inst62Quest1_HORDE_Aim = Inst62Quest1_Aim
Inst62Quest1_HORDE_Location = Inst62Quest1_Location
Inst62Quest1_HORDE_Note = Inst62Quest1_Note
Inst62Quest1_HORDE_Prequest = Inst62Quest1_Prequest
Inst62Quest1_HORDE_Folgequest = Inst62Quest1_Folgequest
Inst62Quest1PreQuest_HORDE = Inst62Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst62Quest2_HORDE = Inst62Quest2
Inst62Quest2_HORDE_Level = Inst62Quest2_Level
Inst62Quest2_HORDE_Attain = Inst62Quest2_Attain
Inst62Quest2_HORDE_Aim = Inst62Quest2_Aim
Inst62Quest2_HORDE_Location = Inst62Quest2_Location
Inst62Quest2_HORDE_Note = Inst62Quest2_Note
Inst62Quest2_HORDE_Prequest = Inst62Quest2_Prequest
Inst62Quest2_HORDE_Folgequest = Inst62Quest2_Folgequest
Inst62Quest2FQuest_HORDE = Inst62Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst62Quest3_HORDE = Inst62Quest3
Inst62Quest3_HORDE_Level = Inst62Quest3_Level
Inst62Quest3_HORDE_Attain = Inst62Quest3_Attain
Inst62Quest3_HORDE_Aim = Inst62Quest3_Aim
Inst62Quest3_HORDE_Location = Inst62Quest3_Location
Inst62Quest3_HORDE_Note = Inst62Quest3_Note
Inst62Quest3_HORDE_Prequest = Inst62Quest3_Prequest
Inst62Quest3_HORDE_Folgequest = Inst62Quest3_Folgequest
Inst62Quest3FQuest_HORDE = Inst62Quest3FQuest
--
Inst62Quest3name1_HORDE = Inst62Quest3name1



--------------- INST63 - Zul'Aman (ZA) ---------------

Inst63Story = "千百年来，祖阿曼的要塞都是阿曼尼巨魔的权力中心，以及狡猾而无畏的督军祖尔金的老巢。祖尔金花费了数年的时间在祖阿曼的城墙后面筹备他的计划。由于对部落允许让他的仇敌血精灵加入，他开始积极地按照妖术领主玛拉卡斯提出的建议行动起来：将野兽之神的力量禁锢在阿曼尼部族最强大的战士体内."
Inst63Caption = "祖阿曼"
Inst63QAA = "8 个任务"
Inst63QAH = "8 个任务"

--Quest 1 Alliance
Inst63Quest1 = "1. 诱人的保证"
Inst63Quest1_Level = "70"
Inst63Quest1_Attain = "70"
Inst63Quest1_Aim = "战斧岭的巴德·奈德雷克要你前往祖阿曼的高阶祭司纳洛拉克所在的平台，找回他的地图."
Inst63Quest1_Location = "巴德·奈德雷 (幽魂之地; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest1_Note = "你可以在 高阶牧师 纳洛拉克  "..YELLOW.."[1]"..WHITE.."附近找到地图. 前续任务接自  格里伏塔(沙塔斯城 - 贫民窟; "..YELLOW.."65,69"..WHITE..")."
Inst63Quest1_Prequest = "有，闪亮闪亮的东西"
Inst63Quest1_Folgequest = "有,X标记……你的末日!"
Inst63Quest1PreQuest = "true"
--
Inst63Quest1name1 = "破烂的巫术布袋"

--Quest 2 Alliance
Inst63Quest2 = "2. X标记……你的末日!"
Inst63Quest2_Level = "70"
Inst63Quest2_Attain = "70"
Inst63Quest2_Aim = "进入祖阿曼并调查哈尔拉兹的大厅、加亚莱的平台和埃基尔松的平台。将这些地方的细节报告给巴德，他的营地就在幽魂之地."
Inst63Quest2_Location = "巴德·奈德雷 (幽魂之地; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest2_Note = "哈尔拉兹的大厅 在 "..YELLOW.."[4]"..WHITE..", 加亚莱的平台 在 "..YELLOW.."[3]"..WHITE.." and 埃基尔松的平台 在 "..YELLOW.."[2]"..WHITE..". \n\n据说不用打boss就可以完成任务，只要在附近就可以." 
Inst63Quest2_Prequest = "有, 诱人的保证"
Inst63Quest2_Folgequest = "有, 妖术领主？哈!"
Inst63Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst63Quest3 = "3. 妖术领主？哈！"
Inst63Quest3_Level = "70"
Inst63Quest3_Attain = "70"
Inst63Quest3_Aim = "战斧岭的巴德·奈德雷克要你前往祖阿曼，杀死妖术领主玛拉卡斯."
Inst63Quest3_Location = "巴德·奈德雷 (幽魂之地; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest3_Note = "妖术领主玛拉卡斯 在 "..YELLOW.."[5]"..WHITE.."."
Inst63Quest3_Prequest = "X标记……你的末日!"
Inst63Quest3_Folgequest = "无"
Inst63Quest3FQuest = "true"
--
Inst63Quest3name1 = "公正徽章"

--Quest 4 Alliance
Inst63Quest4 = "4. 夺牙奇兵"
Inst63Quest4_Level = "70"
Inst63Quest4_Attain = "70"
Inst63Quest4_Aim = "普雷蒙要你从祖阿曼的巨魔身上收集10根森林巨魔獠牙，把它们带回巴德的营地交给他."
Inst63Quest4_Location = "普雷蒙 (幽魂之地; "..YELLOW.."71,68"..WHITE..")"
Inst63Quest4_Note = "森林巨魔獠牙副本离的怪都会掉落."
Inst63Quest4_Prequest = "无"
Inst63Quest4_Folgequest = "有, 失踪的巨魔"
-- No Rewards for this quest

--Quest 5 Alliance
Inst63Quest5 = "5. 失踪的巨魔"
Inst63Quest5_Level = "70"
Inst63Quest5_Attain = "70"
Inst63Quest5_Aim = "普雷蒙希望你深入祖阿曼，找到并帮助他的表兄苏加姆."
Inst63Quest5_Location = "普雷蒙 (幽魂之地; "..YELLOW.."71,68"..WHITE..")"
Inst63Quest5_Note = "据说苏加姆在玛拉卡斯 "..YELLOW.."[5]"..WHITE.."北边的一个小帐篷里 . 你找到他后他会给你下一步任务."
Inst63Quest5_Prequest = "有，夺牙奇兵"
Inst63Quest5_Folgequest = "有，破烂的巫毒人偶"
Inst63Quest5FQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst63Quest6 = "6. 破烂的巫毒人偶"
Inst63Quest6_Level = "70"
Inst63Quest6_Attain = "70"
Inst63Quest6_Aim = "将破烂的巫毒人偶交给沙塔斯城的格里伏塔."
Inst63Quest6_Location = "苏加姆 (祖阿曼; "..YELLOW.." [5]北边"..WHITE..")"
Inst63Quest6_Note = "格里伏塔 在 (沙塔斯城 - 贫民窟; "..YELLOW.."65,69"..WHITE..")."
Inst63Quest6_Prequest = "有, 失踪的巨魔"
Inst63Quest6_Folgequest = "无"
Inst63Quest6FQuest = "true"
--
Inst63Quest6name1 = " 魔法阿曼尼珠宝"

--Quest 7 Alliance
Inst63Quest7 = "7. 督军之血"
Inst63Quest7_Level = "70"
Inst63Quest7_Attain = "70"
Inst63Quest7_Aim = "把祖尔金之血带给巴德·奈德雷，他的营地就在祖阿曼外面的鬼魂之地."
Inst63Quest7_Location = "祖尔金之血 (祖尔金掉落; "..YELLOW.."[6]"..WHITE..")"
Inst63Quest7_Note = "团队中只有一个人能够得到祖尔金之血."
Inst63Quest7_Prequest = "无"
Inst63Quest7_Folgequest = "有, 密探小姐"
-- No Rewards for this quest

--Quest 8 Alliance
Inst63Quest8 = "8. 密探小姐"
Inst63Quest8_Level = "70"
Inst63Quest8_Attain = "70"
Inst63Quest8_Aim = "向多娜·布拉斯库回报，好领取你的奖励。多娜目前待在鬼魂之地，就在祖阿曼的外头."
Inst63Quest8_Location = "多娜·布拉斯库 (幽魂之地; "..YELLOW.."70,68"..WHITE..")"
Inst63Quest8_Note = ""
Inst63Quest8_Prequest = "有，督军之血"
Inst63Quest8_Folgequest = "无"
Inst63Quest8FQuest = "true"
--
Inst63Quest8name1 = "公正徽章"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst63Quest1_HORDE = Inst63Quest1
Inst63Quest1_HORDE_Level = Inst63Quest1_Level
Inst63Quest1_HORDE_Attain = Inst63Quest1_Attain
Inst63Quest1_HORDE_Aim = Inst63Quest1_Aim
Inst63Quest1_HORDE_Location = Inst63Quest1_Location
Inst63Quest1_HORDE_Note = Inst63Quest1_Note
Inst63Quest1_HORDE_Prequest = Inst63Quest1_Prequest
Inst63Quest1_HORDE_Folgequest = Inst63Quest1_Folgequest
Inst63Quest1PreQuest_HORDE = Inst63Quest1PreQuest
--
Inst63Quest1name1_HORDE = Inst63Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst63Quest2_HORDE = Inst63Quest2
Inst63Quest2_HORDE_Level = Inst63Quest2_Level
Inst63Quest2_HORDE_Attain = Inst63Quest2_Attain
Inst63Quest2_HORDE_Aim = Inst63Quest2_Aim
Inst63Quest2_HORDE_Location = Inst63Quest2_Location
Inst63Quest2_HORDE_Note = Inst63Quest2_Note
Inst63Quest2_HORDE_Prequest = Inst63Quest2_Prequest
Inst63Quest2_HORDE_Folgequest = Inst63Quest2_Folgequest
Inst63Quest2FQuest_HORDE = Inst63Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst63Quest3_HORDE = Inst63Quest3
Inst63Quest3_HORDE_Level = Inst63Quest3_Level
Inst63Quest3_HORDE_Attain = Inst63Quest3_Attain
Inst63Quest3_HORDE_Aim = Inst63Quest3_Aim
Inst63Quest3_HORDE_Location = Inst63Quest3_Location
Inst63Quest3_HORDE_Note = Inst63Quest3_Note
Inst63Quest3_HORDE_Prequest = Inst63Quest3_Prequest
Inst63Quest3_HORDE_Folgequest = Inst63Quest3_Folgequest
Inst63Quest3FQuest_HORDE = Inst63Quest3FQuest
--
Inst63Quest3name1_HORDE = Inst63Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst63Quest4_HORDE = Inst63Quest4
Inst63Quest4_HORDE_Level = Inst63Quest4_Level
Inst63Quest4_HORDE_Attain = Inst63Quest4_Attain
Inst63Quest4_HORDE_Aim = Inst63Quest4_Aim
Inst63Quest4_HORDE_Location = Inst63Quest4_Location
Inst63Quest4_HORDE_Note = Inst63Quest4_Note
Inst63Quest4_HORDE_Prequest = Inst63Quest4_Prequest
Inst63Quest4_HORDE_Folgequest = Inst63Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst63Quest5_HORDE = Inst63Quest5
Inst63Quest5_HORDE_Level = Inst63Quest5_Level
Inst63Quest5_HORDE_Attain = Inst63Quest5_Attain
Inst63Quest5_HORDE_Aim = Inst63Quest5_Aim
Inst63Quest5_HORDE_Location = Inst63Quest5_Location
Inst63Quest5_HORDE_Note = Inst63Quest5_Note
Inst63Quest5_HORDE_Prequest = Inst63Quest5_Prequest
Inst63Quest5_HORDE_Folgequest = Inst63Quest5_Folgequest
Inst63Quest5FQuest_HORDE = Inst63Quest5FQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst63Quest6_HORDE = Inst63Quest6
Inst63Quest6_HORDE_Level = Inst63Quest6_Level
Inst63Quest6_HORDE_Attain = Inst63Quest6_Attain
Inst63Quest6_HORDE_Aim = Inst63Quest6_Aim
Inst63Quest6_HORDE_Location = Inst63Quest6_Location
Inst63Quest6_HORDE_Note = Inst63Quest6_Note
Inst63Quest6_HORDE_Prequest = Inst63Quest6_Prequest
Inst63Quest6_HORDE_Folgequest = Inst63Quest6_Folgequest
Inst63Quest6FQuest_HORDE = Inst63Quest6FQuest
--
Inst63Quest6name1_HORDE = Inst63Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst63Quest7_HORDE = Inst63Quest7
Inst63Quest7_HORDE_Level = Inst63Quest7_Level
Inst63Quest7_HORDE_Attain = Inst63Quest7_Attain
Inst63Quest7_HORDE_Aim = Inst63Quest7_Aim
Inst63Quest7_HORDE_Location = Inst63Quest7_Location
Inst63Quest7_HORDE_Note = Inst63Quest7_Note
Inst63Quest7_HORDE_Prequest = Inst63Quest7_Prequest
Inst63Quest7_HORDE_Folgequest = Inst63Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst63Quest8_HORDE = Inst63Quest8
Inst63Quest8_HORDE_Level = Inst63Quest8_Level
Inst63Quest8_HORDE_Attain = Inst63Quest8_Attain
Inst63Quest8_HORDE_Aim = Inst63Quest8_Aim
Inst63Quest8_HORDE_Location = Inst63Quest8_Location
Inst63Quest8_HORDE_Note = Inst63Quest8_Note
Inst63Quest8_HORDE_Prequest = Inst63Quest8_Prequest
Inst63Quest8_HORDE_Folgequest = Inst63Quest8_Folgequest
Inst63Quest8FQuest_HORDE = Inst63Quest8FQuest
--
Inst63Quest8name1_HORDE = Inst63Quest8name1



--------------- INST67 - Magisters' Terrace (MgT) ---------------

Inst67Story = "魔导师平台，凯尔萨斯王子在奎尔丹纳斯岛的领地。经历了风暴要塞的失败之后，很多人以为这位血精灵之王已然身死，但是他却被更为强大的能量复活了。如今的凯尔萨斯已经面目全非，胸口那块散发诡异颜色的绿色水晶让他变得邪气十足。唯一没变的，是他为了追逐更强能量的信念……"
Inst67Caption = "魔导师平台"
Inst67QAA = "5 个任务"
Inst67QAH = "5 个任务"

--Quest 1 Alliance
Inst67Quest1 = "1. 悬赏：痛苦妖女 (普通日常)"
Inst67Quest1_Level = "70"
Inst67Quest1_Attain = "70"
Inst67Quest1_Aim = "虚空猎手玛哈杜恩要你前往魔导师平台，杀死4个痛苦妖女，完成任务后向他复命"
Inst67Quest1_Location = "虚空猎手玛哈杜恩 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst67Quest1_Note = "普通日常任务."
Inst67Quest1_Prequest = "无"
Inst67Quest1_Folgequest = "无"
--
Inst67Quest1name1 = "Ethereum Prison Key"

--Quest 2 Alliance
Inst67Quest2 = "2. 悬赏：凯尔萨斯王子的徽记之戒 (英雄日常)"
Inst67Quest2_Level = "70"
Inst67Quest2_Attain = "70"
Inst67Quest2_Aim = "商人扎雷姆要你取得凯尔萨斯王子的徽记之戒，完成任务后向沙塔斯城贫民窟商人扎雷姆复命."
Inst67Quest2_Location = "商人扎雷姆 (沙塔斯城 - 贫民窟; "..YELLOW.."74,35"..WHITE..")"
Inst67Quest2_Note = "英雄日常任务.\n\n凯尔萨斯王子 在 "..YELLOW.."[6]"..WHITE.."."
Inst67Quest2_Prequest = "无"
Inst67Quest2_Folgequest = "无"
--
Inst67Quest2name1 = "公正徽章"

--Quest 3 Alliance
Inst67Quest3 = "3. 魔导师平台"
Inst67Quest3_Level = "70"
Inst67Quest3_Attain = "70"
Inst67Quest3_Aim = "阳湾港的主教拉瑞瑟要你搜寻魔导师平台，找到血精灵间谍塔雷斯."
Inst67Quest3_Location = "主教拉瑞瑟 (奎尔丹纳斯 - 阳湾港; "..YELLOW.."47,31"..WHITE..")"
Inst67Quest3_Note = "塔雷斯 在副本 "..YELLOW.."[2]"..WHITE..". 完成这个任务线后你才能进入英雄模式的魔导师平台.\n\n这个任务的前续可以从 圣光护卫者阿德因 (沙塔斯城 - 奥尔多高地; "..YELLOW.."35,36"..WHITE..") or 达斯雷·射日者 (沙塔斯城 - 占星者平台; "..YELLOW.."55,80"..WHITE..")."
Inst67Quest3_Prequest = "有, 太阳井的危机，使命的召唤"
Inst67Quest3_Folgequest = "有, 占星球"
Inst67Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst67Quest4 = "4. 占星球"
Inst67Quest4_Level = "70"
Inst67Quest4_Attain = "70"
Inst67Quest4_Aim = "塔雷斯 要你在魔导师平台中的阳台上使用占卜宝珠."
Inst67Quest4_Location = "塔雷斯 (魔导师平台; "..YELLOW.."[2]"..WHITE..")"
Inst67Quest4_Note = "占卜宝珠 在 "..YELLOW.."[4]"..WHITE..". 在经过一小段'电影‘后，卡雷苟斯会出现开始下一步任务."
Inst67Quest4_Prequest = "有, 魔导师平台"
Inst67Quest4_Folgequest = "有，大难不死"
Inst67Quest4FQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst67Quest5 = "5. 大难不死"
Inst67Quest5_Level = "70"
Inst67Quest5_Attain = "70"
Inst67Quest5_Aim = "卡雷苟斯要你杀死魔导师平台的凯尔萨斯王子. 完成任务后带着他的头颅向阳湾港拉瑞瑟复命."
Inst67Quest5_Location = "卡雷苟斯 (魔导师平台; "..YELLOW.."[4]"..WHITE..")"
Inst67Quest5_Note = "凯尔萨斯逐日者 "..YELLOW.."[6]"..WHITE..". 完成任务之后你将能够进入英雄难度的魔导师平台.\n\n拉瑞瑟 在 奎尔丹纳斯 - 阳湾港(; "..YELLOW.."47,31"..WHITE..")."
Inst67Quest5_Prequest = "有，占星球"
Inst67Quest5_Folgequest = "无"
Inst67Quest5FQuest = "true"
--
Inst67Quest5name1 = "Bright Crimson Spinel"
Inst67Quest5name2 = "Runed Crimson Spinel"
Inst67Quest5name3 = "Teardrop Crimson Spinel"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst67Quest1_HORDE = Inst67Quest1
Inst67Quest1_HORDE_Level = Inst67Quest1_Level
Inst67Quest1_HORDE_Attain = Inst67Quest1_Attain
Inst67Quest1_HORDE_Aim = Inst67Quest1_Aim
Inst67Quest1_HORDE_Location = Inst67Quest1_Location
Inst67Quest1_HORDE_Note = Inst67Quest1_Note
Inst67Quest1_HORDE_Prequest = Inst67Quest1_Prequest
Inst67Quest1_HORDE_Folgequest = Inst67Quest1_Folgequest
--
Inst67Quest1name1_HORDE = Inst67Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst67Quest2_HORDE = Inst67Quest2
Inst67Quest2_HORDE_Level = Inst67Quest2_Level
Inst67Quest2_HORDE_Attain = Inst67Quest2_Attain
Inst67Quest2_HORDE_Aim = Inst67Quest2_Aim
Inst67Quest2_HORDE_Location = Inst67Quest2_Location
Inst67Quest2_HORDE_Note = Inst67Quest2_Note
Inst67Quest2_HORDE_Prequest = Inst67Quest2_Prequest
Inst67Quest2_HORDE_Folgequest = Inst67Quest2_Folgequest
--
Inst67Quest2name1_HORDE = Inst67Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst67Quest3_HORDE = Inst67Quest3
Inst67Quest3_HORDE_Level = Inst67Quest3_Level
Inst67Quest3_HORDE_Attain = Inst67Quest3_Attain
Inst67Quest3_HORDE_Aim = Inst67Quest3_Aim
Inst67Quest3_HORDE_Location = Inst67Quest3_Location
Inst67Quest3_HORDE_Note = Inst67Quest3_Note
Inst67Quest3_HORDE_Prequest = Inst67Quest3_Prequest
Inst67Quest3_HORDE_Folgequest = Inst67Quest3_Folgequest
Inst67Quest3PreQuest_HORDE = Inst67Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst67Quest4_HORDE = Inst67Quest4
Inst67Quest4_HORDE_Level = Inst67Quest4_Level
Inst67Quest4_HORDE_Attain = Inst67Quest4_Attain
Inst67Quest4_HORDE_Aim = Inst67Quest4_Aim
Inst67Quest4_HORDE_Location = Inst67Quest4_Location
Inst67Quest4_HORDE_Note = Inst67Quest4_Note
Inst67Quest4_HORDE_Prequest = Inst67Quest4_Prequest
Inst67Quest4_HORDE_Folgequest = Inst67Quest4_Folgequest
Inst67Quest4FQuest_HORDE = Inst67Quest4FQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst67Quest5_HORDE = Inst67Quest5
Inst67Quest5_HORDE_Level = Inst67Quest5_Level
Inst67Quest5_HORDE_Attain = Inst67Quest5_Attain
Inst67Quest5_HORDE_Aim = Inst67Quest5_Aim
Inst67Quest5_HORDE_Location = Inst67Quest5_Location
Inst67Quest5_HORDE_Note = Inst67Quest5_Note
Inst67Quest5_HORDE_Prequest = Inst67Quest5_Prequest
Inst67Quest5_HORDE_Folgequest = Inst67Quest5_Folgequest
Inst67Quest5FQuest_HORDE = Inst67Quest5FQuest
--
Inst67Quest5name1_HORDE = Inst67Quest5name1
Inst67Quest5name2_HORDE = Inst67Quest5name2
Inst67Quest5name3_HORDE = Inst67Quest5name3



--------------- INST68 - Sunwell Plateau ---------------

Inst68Story = "在最新的2.4版本《决战太阳之井》中，燃烧军团的恶魔领主基尔加丹将从太阳之井中重返世界，他的栖身之地将成为一个全新的25人副本：太阳井高地"
Inst68Caption = "太阳井高地"
Inst68QAA = "无任务"
Inst68QAH = "无任务"



---------------------------------------------------
---------------- BATTLEGROUNDS --------------------
---------------------------------------------------



--------------- INST33 - Alterac Valley (AV) ---------------

Inst33Story = "雷矛远征军已经在奥特兰克山谷中安营扎寨，想要研究这里的资源和远古遗物。尽管他们来此的目的并不是为了挑衅，但是矮人们却与居住在山谷南部的霜狼氏族发生了激烈的冲突。霜狼氏族由此发誓要将入侵者赶出他们的家园. "
Inst33Caption = "奥特兰克山谷"
Inst33QAA = "18 个任务"
Inst33QAH = "18 个任务"

--Quest 1 Alliance
Inst33Quest1 = "1. 战斗的召唤：奥特兰克山谷 (战场日常)"
Inst33Quest1_Level = "51"
Inst33Quest1_Attain = "51"
Inst33Quest1_Aim = "在奥特兰克山谷战场中获得一场胜利，然后向任意联盟主城或沙塔斯城中的联盟准将复命."
Inst33Quest1_Location = "联盟准将:\n   沙塔斯城：贫民窟 "..YELLOW.."67,34"..WHITE.."\n   暴风城：暴风要塞 - "..YELLOW.."83,14"..WHITE.."\n   铁炉堡：武器大厅 - "..YELLOW.."70,91"..WHITE.."\n   达纳苏斯：战士区 - "..YELLOW.."59,36"..WHITE.."\n   埃索达：圣光穹顶 - "..YELLOW.."25,55"..WHITE.." "
Inst33Quest1_Note = "战场日常任务."
Inst33Quest1_Prequest = "无"
Inst33Quest1_Folgequest = "无"
-- No Rewards for this quest

--Quest 2 Alliance
Inst33Quest2 = "2. 国王的命令"
Inst33Quest2_Level = "60"
Inst33Quest2_Attain = "51"
Inst33Quest2_Aim = "到希尔斯布莱德丘陵地区的奥特兰克山谷去。到那里之后，和哈格丁中尉谈谈."
Inst33Quest2_Location = "洛泰姆中尉 (铁炉堡; "..YELLOW.."30,62"..WHITE..")"
Inst33Quest2_Note = "哈格丁中尉 在(奥特兰克山脉; "..YELLOW.."39,81"..WHITE..")."
Inst33Quest2_Prequest = "无"
Inst33Quest2_Folgequest = "有，实验场"
-- No Rewards for this quest

--Quest 3 Alliance
Inst33Quest3 = "3. 实验场"
Inst33Quest3_Level = "60"
Inst33Quest3_Attain = "51"
Inst33Quest3_Aim = "到主基地东南边的冰翼洞穴中去找到雷矛军旗，然后把它交给哈格丁中尉."
Inst33Quest3_Location = "哈格丁中尉 (奥特兰克山谷; "..YELLOW.."39,81"..WHITE..")"
Inst33Quest3_Note = "雷矛军旗在 奥特兰克山谷北部地图 冰翼洞穴 "..YELLOW.."[11]"..WHITE.." . 当你声望提升到一个新的等级后，你可以与同一个NPC交谈领取更高级的雷矛徽章."
Inst33Quest3_Prequest = "无"
Inst33Quest3_Folgequest = "无"
Inst33Quest3FQuest = "true"
--
Inst33Quest3name1 = "Stormpike Insignia Rank 1"
Inst33Quest3name2 = "The Frostwolf Artichoke"

--Quest 4 Alliance
Inst33Quest4 = "4. 奥特兰克山谷的战斗"
Inst33Quest4_Level = "60"
Inst33Quest4_Attain = "51"
Inst33Quest4_Aim = "进入奥特兰克山谷，击败部落将军德雷克塔尔。然后回到勘查员塔雷·石镐那里."
Inst33Quest4_Location = "勘查员塔雷·石镐 (奥特兰克山脉; "..YELLOW.."41,78"..WHITE..") and\n(奥特兰克山谷 - 北部地图; "..YELLOW.."[B]"..WHITE..")"
Inst33Quest4_Note = "德雷克塔尔 在 (奥特兰克山谷 - 南部地图; "..YELLOW.."[B]"..WHITE.."). 完成这个任务并不一定需要杀死德雷克塔尔，只要赢得奥特兰克山谷的战斗即可."
Inst33Quest4_Prequest = "无"
Inst33Quest4_Folgequest = "有，雷矛英雄"
--
Inst33Quest4name1 = "Bloodseeker"
Inst33Quest4name2 = "Ice Barbed Spear"
Inst33Quest4name3 = "Wand of Biting Cold"
Inst33Quest4name4 = "Cold Forged Hammer"

--Quest 5 Alliance
Inst33Quest5 = "5. 军需官"
Inst33Quest5_Level = "60"
Inst33Quest5_Attain = "51"
Inst33Quest5_Aim = "与雷矛军需官谈一谈."
Inst33Quest5_Location = "巡山人布比罗 (奥特兰克山谷 - 北部地图; "..YELLOW.."[** MISSING INFO **]"..WHITE..")"
Inst33Quest5_Note = "雷矛军需官 在 (奥特兰克山谷 - 北部地图; "..YELLOW.."[7]"..WHITE..")."
Inst33Quest5_Prequest = "无"
Inst33Quest5_Folgequest = "无"
-- No Rewards for this quest

--Quest 6 Alliance
Inst33Quest6 = "6. 冷齿矿洞的补给"
Inst33Quest6_Level = "60"
Inst33Quest6_Attain = "51"
Inst33Quest6_Aim = "把10份冷齿矿洞补给品交给丹巴达尔的联盟军需官."
Inst33Quest6_Location = "雷矛军需官 (奥特兰克山谷 - 北部地图; "..YELLOW.."[7]"..WHITE..")"
Inst33Quest6_Note = "补给可以在冷齿矿洞找到 (奥特兰克山谷 - 南部地图; "..YELLOW.."[6]"..WHITE..")."
Inst33Quest6_Prequest = "无"
Inst33Quest6_Folgequest = "无"
-- No Rewards for this quest

--Quest 7 Alliance
Inst33Quest7 = "7. 深铁矿洞的补给"
Inst33Quest7_Level = "60"
Inst33Quest7_Attain = "51"
Inst33Quest7_Aim = "把10份深铁矿洞补给品交给丹巴达尔的联盟军需官."
Inst33Quest7_Location = "雷矛军需官 (奥特兰克山谷 - 北部地图; "..YELLOW.."[7]"..WHITE..")"
Inst33Quest7_Note = "补给可以在深铁矿洞找到 (奥特兰克山谷 - 北部地图; "..YELLOW.."[1]"..WHITE..")."
Inst33Quest7_Prequest = "无"
Inst33Quest7_Folgequest = "无"
-- No Rewards for this quest

--Quest 8 Alliance
Inst33Quest8 = "8. 护甲碎片"
Inst33Quest8_Level = "60"
Inst33Quest8_Attain = "51"
Inst33Quest8_Aim = "给丹巴达尔的莫高特·深炉带去20块护甲碎片."
Inst33Quest8_Location = "莫高特·深炉 (奥特兰克山谷 - 北部地图; "..YELLOW.."[4]"..WHITE..")"
Inst33Quest8_Note = "护甲碎片可以从对方阵营的玩家尸体中拾取，任务是可重复的."
Inst33Quest8_Prequest = "无"
Inst33Quest8_Folgequest = "有，更多的护甲碎片"
-- No Rewards for this quest

--Quest 9 Alliance
Inst33Quest9 = "9. 占领矿洞"
Inst33Quest9_Level = "60"
Inst33Quest9_Attain = "51"
Inst33Quest9_Aim = "占领一座还没有被雷矛部族控制的矿洞，然后向丹巴达尔的雷矛军需官复命."
Inst33Quest9_Location = "杜尔根·雷矛 (奥特兰克山谷; "..YELLOW.."37,78"..WHITE..")"
Inst33Quest9_Note = "要完成这个任务，你需要杀死矿洞中的头目 (奥特兰克山谷 - 北部地图; "..YELLOW.."[1]"..WHITE..")  (奥特兰克山谷 - 南部地图; "..YELLOW.."[6]"..WHITE..") while the Horde control it."
Inst33Quest9_Prequest = "无"
Inst33Quest9_Folgequest = "无"
-- No Rewards for this quest

--Quest 10 Alliance
Inst33Quest10 = "10. 哨塔和碉堡"
Inst33Quest10_Level = "60"
Inst33Quest10_Attain = "51"
Inst33Quest10_Aim = "摧毁敌方的某座哨塔或者碉堡中的旗帜，然后向丹巴达尔的杜尔根·雷矛复命."
Inst33Quest10_Location = "杜尔根·雷矛 (奥特兰克山谷; "..YELLOW.."37,78"..WHITE..")"
Inst33Quest10_Note = "只需要烧毁旗帜即可，不需要一定摧毁哨塔或碉堡."
Inst33Quest10_Prequest = "无"
Inst33Quest10_Folgequest = "无"
-- No Rewards for this quest

--Quest 11 Alliance
Inst33Quest11 = "11. 奥特兰克山谷的墓地"
Inst33Quest11_Level = "60"
Inst33Quest11_Attain = "51"
Inst33Quest11_Aim = "占领一座墓地，然后向丹巴达尔的诺雷格·雷矛中尉复命."
Inst33Quest11_Location = "诺雷格·雷矛 (奥特兰克山谷; "..YELLOW.."37,78"..WHITE..")"
Inst33Quest11_Note = "只需要烧毁旗帜即可，不需要一定占领墓地."
Inst33Quest11_Prequest = "无"
Inst33Quest11_Folgequest = "无"
-- No Rewards for this quest

--Quest 12 Alliance
Inst33Quest12 = "12. 补充坐骑"
Inst33Quest12_Level = "60"
Inst33Quest12_Attain = "51"
Inst33Quest12_Aim = "找到奥特兰克山谷中的山羊。使用雷矛训练颈圈来驯服它们。被驯服的山羊会跟随你回到兽栏管理员那里，然后与兽栏管理员谈话以获得你的奖励."
Inst33Quest12_Location = "兽栏管理员 (奥特兰克山谷 - 北部地图; "..YELLOW.."[6]"..WHITE..")"
Inst33Quest12_Note = "你可以在基地南面找到这些羊，像猎人抓宠物一样驯服羊，然后带它回去复命."
Inst33Quest12_Prequest = "无"
Inst33Quest12_Folgequest = "无"
-- No Rewards for this quest

--Quest 13 Alliance
Inst33Quest13 = "13. 山羊坐具"
Inst33Quest13_Level = "60"
Inst33Quest13_Attain = "51"
Inst33Quest13_Aim = "进入敌人的基地，杀死霜狼获得它的皮来作为山羊坐骑的器具，去吧"
Inst33Quest13_Location = "雷矛山羊骑兵指挥官 (奥特兰克山谷 - 北部地图; "..YELLOW.."[6]"..WHITE..")"
Inst33Quest13_Note = "霜狼可以在奥特兰克山谷的南部找到."
Inst33Quest13_Prequest = "无"
Inst33Quest13_Folgequest = "无"
-- No Rewards for this quest

--Quest 14 Alliance
Inst33Quest14 = "14. 水晶簇"
Inst33Quest14_Level = "60"
Inst33Quest14_Attain = "51"
Inst33Quest14_Aim = "你可以躲避硝烟弥漫的战场，激烈战斗之外，你可以帮助我收集霜狼氏族身上的风暴水晶.."
Inst33Quest14_Location = "大德鲁伊雷弗拉尔  (奥特兰克山谷 - 北部地图; "..YELLOW.."[2]"..WHITE..")"
Inst33Quest14_Note = "在募集大约200个风暴水晶后，大德鲁伊伊类弗拉尔开始向（奥特兰克山谷 - 北部地图（ "..YELLOW.."[19]"..WHITE.."）移动，他将启动召唤法阵需要10个玩家去协助召唤。如果成功，森林之王伊弗斯将被召唤出来帮助抵抗部落."
Inst33Quest14_Prequest = "无"
Inst33Quest14_Folgequest = "无"
-- No Rewards for this quest

--Quest 15 Alliance
Inst33Quest15 = "15. 森林之王伊弗斯"
Inst33Quest15_Level = "60"
Inst33Quest15_Attain = "51"
Inst33Quest15_Aim = "霜狼氏族的战士身上带着一种名叫暴风水晶的符咒，我们可以用这些符咒来召唤伊弗斯。快去拿来那些水晶吧."
Inst33Quest15_Location = "大德鲁伊雷弗拉尔 (奥特兰克山谷 - 北部地图; "..YELLOW.."[2]"..WHITE..")"
Inst33Quest15_Note = "在募集大约200个风暴水晶后，大德鲁伊伊类弗拉尔开始向（奥特兰克山谷 - 北部地图（ "..YELLOW.."[19]"..WHITE.."）移动，他将启动召唤法阵需要10个玩家去协助召唤。如果成功，森林之王伊弗斯将被召唤出来帮助抵抗部落."
Inst33Quest15_Prequest = "无"
Inst33Quest15_Folgequest = "无"
-- No Rewards for this quest

--Quest 16 Alliance
Inst33Quest16 = "16. 天空的召唤 - 维波里的空军"
Inst33Quest16_Level = "60"
Inst33Quest16_Attain = "51"
Inst33Quest16_Aim = "你必须去对付守卫前线的部落精英士兵!我现在命令你去削弱那些绿皮蛮子的力量，把他们的中尉和军团士兵的勋章给我拿来。当我拿到足够的勋章时，我会命令开始对他们进行空中打击的."
Inst33Quest16_Location = "空军指挥官维波里 (奥特兰克山谷 - 北部地图; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest16_Note = "你可以从对方阵营的尸体上得到这些勋章."
Inst33Quest16_Prequest = "无"
Inst33Quest16_Folgequest = "无"
-- No Rewards for this quest

--Quest 17 Alliance
Inst33Quest17 = "17. 天空的召唤 - 斯里多尔的空军"
Inst33Quest17_Level = "60"
Inst33Quest17_Attain = "51"
Inst33Quest17_Aim = "我的狮鹫兽应该在前线作战，但是在那里的敌人被削弱之前，它们是无法发动攻击的。部落的战士胸前挂着代表荣誉的勋章勇猛冲锋，而你要做的就是从他们腐烂的尸体上把勋章拿下来，并把它们交视只要敌人在前线的力量受到足够的打击，我就会发出命令进行空袭!我们将从空中给敌人造成致命的创伤!!"
Inst33Quest17_Location = "空军指挥官斯里多尔 (奥特兰克山谷 - 北部地图; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest17_Note = "你可以从对方阵营的尸体上得到这些勋章."
Inst33Quest17_Prequest = "无"
Inst33Quest17_Folgequest = "无"
-- No Rewards for this quest

--Quest 18 Alliance
Inst33Quest18 = "18. 天空的召唤 - 艾克曼的空军"
Inst33Quest18_Level = "60"
Inst33Quest18_Attain = "51"
Inst33Quest18_Aim = "它们的士气很低，战士。自从我们上次对部落的空中打击失败之后，它们就拒绝再次飞行!你必须鼓舞它们的士气。回到战场并攻击部落的核心力量，杀死他们的指挥官和卫兵。尽可能带回更多的勋章!我向你保证，当我的狮鹫兽看到这些战利品并嗅到敌人的鲜血时，它们就会再次起飞!现在就出发吧!"
Inst33Quest18_Location = "空军指挥官艾克曼 (奥特兰克山谷 - 北部地图; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest18_Note = "你可以从对方阵营的尸体上得到这些勋章."
Inst33Quest18_Prequest = "无"
Inst33Quest18_Folgequest = "无"
-- No Rewards for this quest


--Quest 1 Horde
Inst33Quest1_HORDE = "1. 战斗的召唤：奥特兰克山谷 (战场日常)"
Inst33Quest1_HORDE_Level = "51"
Inst33Quest1_HORDE_Attain = "51"
Inst33Quest1_HORDE_Aim = "在奥特兰克山谷战场中获得一场胜利，然后向任意部落主城或沙塔斯城中的部落战争使者复命."
Inst33Quest1_HORDE_Location = "部落战场使者:\n   沙塔斯城：贫民窟 - "..YELLOW.."70,54"..WHITE.."\n   奥格瑞玛：荣耀谷 - "..YELLOW.."80,30"..WHITE.."\n   雷霆崖：猎手高地 - "..YELLOW.."56,77"..WHITE.."\n   幽暗城 - "..YELLOW.."61,88"..WHITE.."\n   银月城 - "..YELLOW.."97,38"
Inst33Quest1_HORDE_Note = "51级你才能接到这个任务，完成任务会基于你的级别奖励金钱和经验."
Inst33Quest1_HORDE_Prequest = "无"
Inst33Quest1_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 2 Horde
Inst33Quest2_HORDE = "2. 保卫霜狼氏族"
Inst33Quest2_HORDE_Level = "60"
Inst33Quest2_HORDE_Attain = "51"
Inst33Quest2_HORDE_Aim = "到希尔斯布莱德丘陵地区的奥特兰克山谷去。找到拉格隆德并和他谈谈，然后成为霜狼氏族的士兵."
Inst33Quest2_HORDE_Location = "霜狼大使 (奥格瑞玛 - 力量谷 "..YELLOW.."50,71"..WHITE..")"
Inst33Quest2_HORDE_Note = "拉格隆德 (奥特兰克山脉; "..YELLOW.."62,59"..WHITE..")."
Inst33Quest2_HORDE_Prequest = "无"
Inst33Quest2_HORDE_Folgequest = "有，实验场"
-- No Rewards for this quest

--Quest 3 Horde
Inst33Quest3_HORDE = "3. 实验场"
Inst33Quest3_HORDE_Level = "60"
Inst33Quest3_HORDE_Attain = "51"
Inst33Quest3_HORDE_Aim = "到主基地东南边的蛮爪洞穴中去找到霜狼军旗，然后把它交给拉格隆德."
Inst33Quest3_HORDE_Location = "拉格隆德 (奥特兰克山脉; "..YELLOW.."62,59"..WHITE..")"
Inst33Quest3_HORDE_Note = "霜狼军旗 在蛮爪洞穴 (奥特兰克山谷 - 南部地图; "..YELLOW.."[9]"..WHITE.."). 每当声望到达一个级别，你可以在这个人这里得到升级的徽章."
Inst33Quest3_HORDE_Prequest = "有，保卫霜狼氏族"
Inst33Quest3_HORDE_Folgequest = "无"
Inst33Quest3FQuest_HORDE = "true"
--
Inst33Quest3name1_HORDE = "Frostwolf Insignia Rank 1"
Inst33Quest3name2_HORDE = "Peeling the Onion"

--Quest 4 Horde
Inst33Quest4_HORDE = "4. 为奥特兰克而战"
Inst33Quest4_HORDE_Level = "60"
Inst33Quest4_HORDE_Attain = "51"
Inst33Quest4_HORDE_Aim = "进入奥特兰克山谷，击败矮人将军范达尔·雷矛。然后回到沃加·死爪那里."
Inst33Quest4_HORDE_Location = "沃加·死爪 (奥特兰克山脉; "..YELLOW.."64,60"..WHITE..")"
Inst33Quest4_HORDE_Note = "范达尔 雷矛 在 (奥特兰克山谷 - 北部地图; "..YELLOW.."[B]"..WHITE.."). 不一定需要杀死范达尔才能完成任务，赢得胜利就行."
Inst33Quest4_HORDE_Prequest = "无"
Inst33Quest4_HORDE_Folgequest = "有，霜狼氏族的英雄"
--
Inst33Quest4name1_HORDE = "Bloodseeker"
Inst33Quest4name2_HORDE = "Ice Barbed Spear"
Inst33Quest4name3_HORDE = "Wand of Biting Cold"
Inst33Quest4name4_HORDE = "Cold Forged Hammer"

--Quest 5 Horde
Inst33Quest5_HORDE = "5. 霜狼军需官"
Inst33Quest5_HORDE_Level = "60"
Inst33Quest5_HORDE_Attain = "51"
Inst33Quest5_HORDE_Aim = "与霜狼军需官谈一谈."
Inst33Quest5_HORDE_Location = "乔泰克 (奥特兰克山谷 - 南部地图; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest5_HORDE_Note = "霜狼军需官 在 "..YELLOW.."[10]"..WHITE.." ."
Inst33Quest5_HORDE_Prequest = "无"
Inst33Quest5_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 6 Horde
Inst33Quest6_HORDE = "6. 冷齿矿洞的补给"
Inst33Quest6_HORDE_Level = "60"
Inst33Quest6_HORDE_Attain = "51"
Inst33Quest6_HORDE_Aim = "把10份冷齿矿洞补给品交给霜狼要塞的部落军需官."
Inst33Quest6_HORDE_Location = "霜狼军需官 (奥特兰克山谷 - 南部地图; "..YELLOW.."[10]"..WHITE..")"
Inst33Quest6_HORDE_Note = "补给品 可以在冷齿矿洞找到 (奥特兰克山谷 - 南部地图; "..YELLOW.."[6]"..WHITE..")."
Inst33Quest6_HORDE_Prequest = "无"
Inst33Quest6_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 7 Horde
Inst33Quest7_HORDE = "7. 深铁矿洞的补给"
Inst33Quest7_HORDE_Level = "60"
Inst33Quest7_HORDE_Attain = "51"
Inst33Quest7_HORDE_Aim = "把10份深铁矿洞补给品交给霜狼要塞的部落军需官."
Inst33Quest7_HORDE_Location = "霜狼军需官 (奥特兰克山谷 - 南部地图; "..YELLOW.."[10]"..WHITE..")"
Inst33Quest7_HORDE_Note = "补给品 可以在深铁矿洞找到 (奥特兰克山谷 - 北部地图; "..YELLOW.."[1]"..WHITE..")."
Inst33Quest7_HORDE_Prequest = "无"
Inst33Quest7_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 8 Horde
Inst33Quest8_HORDE = "8. 敌人的物资"
Inst33Quest8_HORDE_Level = "60"
Inst33Quest8_HORDE_Attain = "51"
Inst33Quest8_HORDE_Aim = "给霜狼村的铁匠雷格萨带去20块护甲碎片."
Inst33Quest8_HORDE_Location = "铁匠雷格萨 (奥特兰克山谷 - 南部地图; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest8_HORDE_Note = "这是个可重复任务."
Inst33Quest8_HORDE_Prequest = "无"
Inst33Quest8_HORDE_Folgequest = "有，更多的物资!"
-- No Rewards for this quest

--Quest 9 Horde
Inst33Quest9_HORDE = "9. 占领矿洞"
Inst33Quest9_HORDE_Level = "60"
Inst33Quest9_HORDE_Attain = "51"
Inst33Quest9_HORDE_Aim = "占领一座矿洞，然后向霜狼村的霜狼军需官报告."
Inst33Quest9_HORDE_Location = "霜狼军需官 (奥特兰克山脉; "..YELLOW.."66,55"..WHITE..")"
Inst33Quest9_HORDE_Note = "完成这个任务你只要杀死洞里的首领即可."
Inst33Quest9_HORDE_Prequest = "无"
Inst33Quest9_HORDE_Folgequest ="无"
-- No Rewards for this quest

--Quest 10 Horde
Inst33Quest10_HORDE = "10. 哨塔和碉堡"
Inst33Quest10_HORDE_Level = "60"
Inst33Quest10_HORDE_Attain = "51"
Inst33Quest10_HORDE_Aim = "占领敌方的某座哨塔，然后向霜狼村的提卡·血牙复命."
Inst33Quest10_HORDE_Location = "提卡·血牙 (奥特兰克山脉; "..YELLOW.."66,55"..WHITE..")"
Inst33Quest10_HORDE_Note = "不用摧毁，只需开旗即可."
Inst33Quest10_HORDE_Prequest = "无"
Inst33Quest10_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 11 Horde
Inst33Quest11_HORDE = "11. 奥特兰克山谷的墓地"
Inst33Quest11_HORDE_Level = "60"
Inst33Quest11_HORDE_Attain = "51"
Inst33Quest11_HORDE_Aim = "占领一座墓地，然后向霜狼村的亚斯拉复命."
Inst33Quest11_HORDE_Location = "亚斯拉 (奥特兰克山脉; "..YELLOW.."66,55"..WHITE..")"
Inst33Quest11_HORDE_Note = "只需开旗即可."
Inst33Quest11_HORDE_Prequest = "无"
Inst33Quest11_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 12 Horde
Inst33Quest12_HORDE = "12. 补充坐骑"
Inst33Quest12_HORDE_Level = "60"
Inst33Quest12_HORDE_Attain = "51"
Inst33Quest12_HORDE_Aim = "找到奥特兰克山谷中的霜狼。使用霜狼口套来驯服它们。被驯服的霜狼会跟随你回到兽栏管理员那里，然后与兽栏管理员谈话以获得你的奖励."
Inst33Quest12_HORDE_Location = "霜狼兽栏管理员 (奥特兰克山谷 - 南部地图; "..YELLOW.."[9]"..WHITE..")"
Inst33Quest12_HORDE_Note = "基地外面就可以找到这些狼."
Inst33Quest12_HORDE_Prequest = "无"
Inst33Quest12_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 13 Horde
Inst33Quest13_HORDE = "13. 羊皮坐具"
Inst33Quest13_HORDE_Level = "60"
Inst33Quest13_HORDE_Attain = "51"
Inst33Quest13_HORDE_Aim = "杀死雷矛卫队用作坐骑的山羊，我们就可以将羊皮作为我们的坐垫"
Inst33Quest13_HORDE_Location = "霜狼骑兵指挥官 (奥特兰克山谷 - 南部地图; "..YELLOW.."[9]"..WHITE..")"
Inst33Quest13_HORDE_Note = "羊能在北部的奥特兰克山谷找到."
Inst33Quest13_HORDE_Prequest = "无"
Inst33Quest13_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 14 Horde
Inst33Quest14_HORDE = "14. 联盟之血"
Inst33Quest14_HORDE_Level = "60"
Inst33Quest14_HORDE_Attain = "51"
Inst33Quest14_HORDE_Aim = "从联盟尸体上边得到联盟之血，把它交给我."
Inst33Quest14_HORDE_Location = "指挥官瑟鲁加  (奥特兰克山谷 - 南部地图; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest14_HORDE_Note = "你可以从对方阵营的尸体上得到这些东西"
Inst33Quest14_HORDE_Prequest = "无"
Inst33Quest14_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 15 Horde
Inst33Quest15_HORDE = "15. 冰雪之王洛克霍拉"
Inst33Quest15_HORDE_Level = "60"
Inst33Quest15_HORDE_Attain = "51"
Inst33Quest15_HORDE_Aim = "收集足够的联盟之血后，你就可以召唤冰雪之王."
Inst33Quest15_HORDE_Location = "指挥官瑟鲁加  (奥特兰克山谷 - 南部地图; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest15_HORDE_Note = "当交齐150个联盟之血后，指挥官瑟鲁加开始向（奥特兰克山谷 - 南部地图; "..YELLOW.."[14]"..WHITE.."）移动。召唤法阵需要10个玩家去协助召唤。如果成功，冰雪之王洛克霍拉将被召唤出来以对抗联盟。"
Inst33Quest15_HORDE_Prequest = "无"
Inst33Quest15_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 16 Horde
Inst33Quest16_HORDE = "16. 天空的召唤 - 古斯的部队"
Inst33Quest16_HORDE_Level = "60"
Inst33Quest16_HORDE_Attain = "51"
Inst33Quest16_HORDE_Aim = "收集联盟卫兵的肉，把它交给我"
Inst33Quest16_HORDE_Location = "空军指挥官古斯 (奥特兰克山谷 - 南部地图; "..YELLOW.."[13]"..WHITE..")"
Inst33Quest16_HORDE_Note = "你可以从对方阵营的尸体上得到这些东西"
Inst33Quest16_HORDE_Prequest = "无"
Inst33Quest16_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 17 Horde
Inst33Quest17_HORDE = "17. 天空的召唤 - 杰斯托的部队"
Inst33Quest17_HORDE_Level = "60"
Inst33Quest17_HORDE_Attain = "51"
Inst33Quest17_HORDE_Aim = "收集联盟士官的食物，把它交给我."
Inst33Quest17_HORDE_Location = "空军指挥官杰斯托  (奥特兰克山谷 - 南部地图; "..YELLOW.."[13]"..WHITE..")"
Inst33Quest17_HORDE_Note = "你可以从对方阵营的尸体上得到这些东西"
Inst33Quest17_HORDE_Prequest = "无"
Inst33Quest17_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 18 Horde
Inst33Quest18_HORDE = "18. 天空的召唤 - 穆维里克的部队"
Inst33Quest18_HORDE_Level = "60"
Inst33Quest18_HORDE_Attain = "51"
Inst33Quest18_HORDE_Aim = "收集联盟指挥官的食物，把它交给我"
Inst33Quest18_HORDE_Location = "空军指挥官穆维里克 (奥特兰克山谷 - 南部地图; "..YELLOW.."[13]"..WHITE..")"
Inst33Quest18_HORDE_Note = "你可以从对方阵营的尸体上得到这些东西"
Inst33Quest18_HORDE_Prequest = "无"
Inst33Quest18_HORDE_Folgequest = "无"
-- No Rewards for this quest



--------------- INST34 - Arathi Basin (AB) ---------------

Inst34Story = "位于阿拉希高地的阿拉希盆地是一处激动人心的战场。盆地拥有丰富的资源，部落和联盟都对此垂涎不已。污染者和阿拉索联军在阿拉希盆地展开激战，想要为他们所在的阵营抢夺盆地中的资源."
Inst34Caption = "阿拉希盆地"
Inst34QAA = "4 个任务"
Inst34QAH = "4 个任务"

--Quest 1 Alliance
Inst34Quest1 = "1. 战斗的召唤：阿拉希盆地 (战场日常)"
Inst34Quest1_Level = "20"
Inst34Quest1_Attain = "20"
Inst34Quest1_Aim = "阿拉希盆地战场中获得一场胜利，然后向任意联盟主城或沙塔斯城中的联盟准将复命."
Inst34Quest1_Location = "联盟准将:\n   沙塔斯城：贫民窟 "..YELLOW.."67,34"..WHITE.."\n   暴风城：暴风要塞 - "..YELLOW.."83,14"..WHITE.."\n   铁炉堡：武器大厅 - "..YELLOW.."70,91"..WHITE.."\n   达纳苏斯：战士区 - "..YELLOW.."59,36"..WHITE.."\n   埃索达：圣光穹顶 - "..YELLOW.."25,55"..WHITE.." "
Inst34Quest1_Note = "你达到20级才能接到这个任务，完成任务将基于你的级别奖励经验和金钱."
Inst34Quest1_Prequest = "无"
Inst34Quest1_Folgequest = "无"
-- No Rewards for this quest

--Quest 2 Alliance
Inst34Quest2 = "2. 阿拉希盆地之战!"
Inst34Quest2_Level = "25"
Inst34Quest2_Attain = "25"
Inst34Quest2_Aim = "进攻矿洞、伐木场、铁匠铺和农场，然后向避难谷地的奥斯莱特元帅复命."
Inst34Quest2_Location = "奥斯莱特元帅  (阿拉希高地-避难谷地; "..YELLOW.."46,45"..WHITE..")"
Inst34Quest2_Note = "开旗就可."
Inst34Quest2_Prequest = "无"
Inst34Quest2_Folgequest = "无"
-- No Rewards for this quest

--Quest 3 Alliance
Inst34Quest3 = "3. 控制四座基地"
Inst34Quest3_Level = "60"
Inst34Quest3_Attain = "60"
Inst34Quest3_Aim = "进入阿拉希盆地，同时占据并控制四座基地，当任务完成之后向避难谷地的奥斯莱特元帅报告."
Inst34Quest3_Location = "奥斯莱特元帅 (阿拉希高地-避难谷地; "..YELLOW.."46,45"..WHITE..")"
Inst34Quest3_Note = "你必须和阿拉索联军声望达到友善才能接到这个任务."
Inst34Quest3_Prequest = "无"
Inst34Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst34Quest4 = "4. 控制五座基地"
Inst34Quest4_Level = "60"
Inst34Quest4_Attain = "60"
Inst34Quest4_Aim = "同时控制阿拉希盆地中的五座基地，然后向避难谷地的奥斯莱特元帅复命."
Inst34Quest4_Location = "奥斯莱特元帅 (阿拉希高地-避难谷地; "..YELLOW.."46,45"..WHITE..")"
Inst34Quest4_Note = "你必须和阿拉索联军达到崇拜才能接到这个任务."
Inst34Quest4_Prequest = "无"
Inst34Quest4_Folgequest = "无"
--
Inst34Quest4name1 = "Arathor Battle Tabard"


--Quest 1 Horde
Inst34Quest1_HORDE = "1. 战斗的召唤：阿拉希盆地 (战场日常)"
Inst34Quest1_HORDE_Level = "20"
Inst34Quest1_HORDE_Attain = "20"
Inst34Quest1_HORDE_Aim = "在阿拉希盆地战场中获得一场胜利，然后向任意部落主城或沙塔斯城中的部落战争使者复命."
Inst34Quest1_HORDE_Location = "部落战场使者:\n   沙塔斯城：贫民窟 - "..YELLOW.."70,54"..WHITE.."\n   奥格瑞玛：荣耀谷 - "..YELLOW.."80,30"..WHITE.."\n   雷霆崖：猎手高地 - "..YELLOW.."56,77"..WHITE.."\n   幽暗城 - "..YELLOW.."61,88"..WHITE.."\n   银月城 - "..YELLOW.."97,38"
Inst34Quest1_HORDE_Note = "你达到20级才能接到这个任务，完成任务将基于你的级别奖励经验和金钱."
Inst34Quest1_HORDE_Prequest = "无"
Inst34Quest1_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 2 Horde
Inst34Quest2_HORDE = "2. 阿拉希盆地之战!"
Inst34Quest2_HORDE_Level = "25"
Inst34Quest2_HORDE_Attain = "25"
Inst34Quest2_HORDE_Aim = "进攻阿拉希盆地的矿洞、伐木场、铁匠铺和兽栏，然后向落锤镇的屠杀者杜维尔复命."
Inst34Quest2_HORDE_Location = "屠杀者杜维尔 (阿拉希高地 - 落槌镇; "..YELLOW.."74,35"..WHITE..")"
Inst34Quest2_HORDE_Note = "The locations to be assaulted are marked on the map as 1 through 4."
Inst34Quest2_HORDE_Prequest = "No"
Inst34Quest2_HORDE_Folgequest = "No"
-- No Rewards for this quest

--Quest 3 Horde
Inst34Quest3_HORDE = "3. 夺取四座基地"
Inst34Quest3_HORDE_Level = "60"
Inst34Quest3_HORDE_Attain = "60"
Inst34Quest3_HORDE_Aim = "同时占据阿拉希盆地中的四座基地，然后向落锤镇的屠杀者杜维尔复命."
Inst34Quest3_HORDE_Location = "屠杀者杜维尔 (阿拉希高地 - 落槌镇; "..YELLOW.."74,35"..WHITE..")"
Inst34Quest3_HORDE_Note = "你必须和污染者声望达到友善才能接到任务."
Inst34Quest3_HORDE_Prequest = "无"
Inst34Quest3_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Horde
Inst34Quest4_HORDE = "4. 夺取五座基地"
Inst34Quest4_HORDE_Level = "60"
Inst34Quest4_HORDE_Attain = "60"
Inst34Quest4_HORDE_Aim = "同时占据阿拉希盆地中的五座基地，然后向落锤镇的屠杀者杜维尔复命."
Inst34Quest4_HORDE_Location = "屠杀者杜维尔 (阿拉希高地 - 落槌镇; "..YELLOW.."74,35"..WHITE..")"
Inst34Quest4_HORDE_Note = "你必须和污染者声望达到崇敬才能接到."
Inst34Quest4_HORDE_Prequest = "无"
Inst34Quest4_HORDE_Folgequest = "无"
--
Inst34Quest4name1_HORDE = "Battle Tabard of the Defilers"



--------------- INST35 - Warsong Gulch (WSG) ---------------

Inst35Story = "战歌峡谷位于灰谷森林南部。在第三次兽人战争中，格罗姆·地狱咆哮和他麾下的兽人们几乎将战歌峡谷附近的森林砍伐殆尽。其中部分兽人仍然盘踞在这里，继续砍伐着森林，想要扩张部落的势力范围。他们称自己为战歌侦查骑兵。\n\n暗夜精灵早已纠集兵力，打算收复灰谷森林。他们想要将战歌侦察骑兵彻底赶出这片土地。因此，银翼哨兵挺身而出，发誓在将兽人驱逐出战歌峡谷之前他们决不休息. "
Inst35Caption = "战歌峡谷（WSG）"
Inst35QAA = "1 个任务"
Inst35QAH = "1 个任务"

--Quest 1 Alliance
Inst35Quest1 = "1. 战斗的召唤：战歌峡谷 (战场日常)"
Inst35Quest1_Level = "10"
Inst35Quest1_Attain = "10"
Inst35Quest1_Aim = "在战歌峡谷战场中获得一场胜利，然后向任意联盟主城或沙塔斯城中的联盟准将复命."
Inst35Quest1_Location = "联盟准将:\n   沙塔斯城：贫民窟 "..YELLOW.."67,34"..WHITE.."\n   暴风城：暴风要塞 - "..YELLOW.."83,14"..WHITE.."\n   铁炉堡：武器大厅 - "..YELLOW.."70,91"..WHITE.."\n   达纳苏斯：战士区 - "..YELLOW.."59,36"..WHITE.."\n   埃索达：圣光穹顶 - "..YELLOW.."25,55"..WHITE.." "
Inst35Quest1_Note = "这是战场日常任务，你达到10级才能接到这个任务，完成任务将基于你的级别奖励经验和金钱."
Inst35Quest1_Prequest = "无"
Inst35Quest1_Folgequest = "无"
-- No Rewards for this quest

--Quest 1 Horde
Inst35Quest1_HORDE = "1. 战斗的召唤：战歌峡谷 (战场日常)"
Inst35Quest1_HORDE_Level = "10"
Inst35Quest1_HORDE_Attain = "10"
Inst35Quest1_HORDE_Aim = "在战歌峡谷战场中获得一场胜利，然后向任意部落主城或沙塔斯城中的部落战争使者复命."
Inst35Quest1_HORDE_Location = "部落战场使者:\n   沙塔斯城：贫民窟 - "..YELLOW.."70,54"..WHITE.."\n   奥格瑞玛：荣耀谷 - "..YELLOW.."80,30"..WHITE.."\n   雷霆崖：猎手高地 - "..YELLOW.."56,77"..WHITE.."\n   幽暗城 - "..YELLOW.."61,88"..WHITE.."\n   银月城 - "..YELLOW.."97,38"
Inst35Quest1_HORDE_Note = "这是战场日常任务，你达到10级才能接到这个任务，完成任务将基于你的级别奖励经验和金钱."
Inst35Quest1_HORDE_Prequest = "无"
Inst35Quest1_HORDE_Folgequest = "无"
-- No Rewards for this quest



--------------- INST60 - Eye of the Storm ---------------

Inst60Story = "风暴之眼位于外域的虚空风暴地区，是一处激动人心的新战场。该战场有“维持占领”模式和“夺旗”模式两种玩法，高等级的联盟和部落玩家可以在两个浮空群岛上进行15v15的对抗。这些岛屿由三座桥梁连接。此外，还有四座俯瞰战场的塔楼可充当小规模对抗的争夺目标。而地图的中央，还会刷新一面旗帜供各队伍争夺."
Inst60Caption = "风暴之眼"
Inst60QAA = "1 个任务"
Inst60QAH = "1 个任务"

--Quest 1 Alliance
Inst60Quest1 = "1. 战斗的召唤：风暴之眼 (战场日常)"
Inst60Quest1_Level = "61"
Inst60Quest1_Attain = "61"
Inst60Quest1_Aim = "在风暴之眼战场中获得一场胜利，然后向任意联盟主城或沙塔斯城中的联盟准将复命."
Inst60Quest1_Location = "联盟准将:\n   沙塔斯城：贫民窟 "..YELLOW.."67,34"..WHITE.."\n   暴风城：暴风要塞 - "..YELLOW.."83,14"..WHITE.."\n   铁炉堡：武器大厅 - "..YELLOW.."70,91"..WHITE.."\n   达纳苏斯：战士区 - "..YELLOW.."59,36"..WHITE.."\n   埃索达：圣光穹顶 - "..YELLOW.."25,55"
Inst60Quest1_Note = "这是战场日常任务，你达到61级才能接到这个任务，完成任务将基于你的级别奖励经验和金钱."
Inst60Quest1_Prequest = "无"
Inst60Quest1_Folgequest = "无"
-- No Rewards for this quest

--Quest 1 Horde
Inst60Quest1_HORDE = "1. 战斗的召唤：风暴之眼 (战场日常)"
Inst60Quest1_HORDE_Level = "61"
Inst60Quest1_HORDE_Attain = "61"
Inst60Quest1_HORDE_Aim = "在风暴之眼战场中获得一场胜利，然后向任意部落主城或沙塔斯城中的部落战争使者复命."
Inst60Quest1_HORDE_Location = "部落战场使者:\n   沙塔斯城：贫民窟 - "..YELLOW.."70,54"..WHITE.."\n   奥格瑞玛：荣耀谷 - "..YELLOW.."80,30"..WHITE.."\n   雷霆崖：猎手高地 - "..YELLOW.."56,77"..WHITE.."\n   幽暗城 - "..YELLOW.."61,88"..WHITE.."\n   银月城 - "..YELLOW.."97,38"
Inst60Quest1_HORDE_Note = "这是战场日常任务，你达到61级才能接到这个任务，完成任务将基于你的级别奖励经验和金钱."
Inst60Quest1_HORDE_Prequest = "无"
Inst60Quest1_HORDE_Folgequest = "无"
-- No Rewards for this quest



---------------------------------------------------
---------------- OUTDOOR RAIDS --------------------
---------------------------------------------------



--------------- INST30 - Dragons of Nightmare ---------------

Inst30Story = {
  ["Page1"] = "世界之树陷入了一场骚乱。僻静的灰谷、暮色森林、菲拉斯以及辛特兰面临着新的威胁。绿龙军团的四条守护巨龙从翡翠梦境来到了艾泽拉斯世界，这些曾经忠心耿耿的守护者，现在却为世界带来了毁灭和死亡的气息。拿起武器，跟你的伙伴一同进入那些神秘的森林——只有你能从巨龙手中拯救艾泽拉斯。",
  ["Page2"] = "翡翠梦境的守护巨龙伊瑟拉统治着神秘的绿龙军团。她居住在翡翠梦境中，支配着世界万物的演化方向。她是自然和梦幻的守护者，她统治的绿龙军团负责保护世界之树，只有德鲁伊才能通过世界之树进入翡翠梦境。\n近来，在翡翠梦境中的某种新的黑暗力量的驱使下，伊瑟拉最忠诚的守护者们穿越世界之树，来到了艾泽拉斯世界，妄图使世界再度陷入疯狂和恐慌。即使是最强大的冒险者也应该对这些巨龙退避三舍，否则他就将为此付出惨重的代价。",
  ["Page3"] = "受翡翠梦境黑暗力量的影响，莱索恩的龙鳞失去了光泽，他拥有了汲取敌人幻象的力量。这些幻象可以赋予巨龙治疗的能力。毫无疑问，莱索恩被认为是伊瑟拉手下最强大的守护者。",
  ["Page4"] = "在翡翠梦境的某种神秘的黑暗力量诱惑下，高贵的艾莫莉丝成为了一头腐烂、患病的怪物。少数侥幸生还者称，他们死去的伙伴的尸体上长出了腐烂的蘑菇，那情形异常恐怖。艾莫莉丝是伊瑟拉统治的绿龙军团中最可怕的巨龙。",
  ["Page5"] = "泰拉尔或许是伊瑟拉的守护者中受黑暗力量影响最深的巨龙。翡翠梦境的黑暗力量彻底摧毁了泰拉尔的心智和肉体。他成为拥有分身术的巨龙幽灵，各个分身都具备强大的魔法破坏力。泰拉尔是个狡猾无情的敌人，他妄图使艾泽拉斯世界的所有生物都陷入疯狂。",
  ["Page6"] = "伊瑟拉最忠诚的守护者伊森德雷如今已面目全非，她在艾泽拉斯大陆上散播着恐慌和混乱。她先前拥有的治疗能力被黑暗魔法所取代，她能释放烟状的闪电波并召唤恶魔德鲁伊。伊森德雷和她的龙族拥有催眠技能，可以使敌人陷入最可怕的噩梦。",
  ["MaxPages"] = "6",
};
Inst30Caption = "梦魇之龙"
Inst30Caption2 = "伊瑟拉和绿龙军团"
Inst30Caption3 = "莱索恩"
Inst30Caption4 = "艾莫莉丝"
Inst30Caption5 = "泰拉尔"
Inst30Caption6 = "伊森德雷"
Inst30QAA = "1 个任务"
Inst30QAH = "1 个任务"

--Quest 1 Alliance
Inst30Quest1 = "1. 梦魇的缠绕"
Inst30Quest1_Level = "60"
Inst30Quest1_Attain = "60"
Inst30Quest1_Aim = "寻找能解读梦魇包裹的物品中所隐藏的信息的人."
Inst30Quest1_Location = "梦魇包裹的物品 (掉落自 泰拉尔, 伊森德雷, 艾莫莉丝 或 莱索恩)"
Inst30Quest1_Note = "物品交给 守护者雷姆洛斯  (月光林地; "..YELLOW.."36,41"..WHITE..")."
Inst30Quest1_Prequest = "无"
Inst30Quest1_Folgequest = "有,唤醒传说"
--
Inst30Quest1name1 = "Malfurion's Signet Ring"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst30Quest1_HORDE = Inst30Quest1
Inst30Quest1_HORDE_Level = Inst30Quest1_Level
Inst30Quest1_HORDE_Attain = Inst30Quest1_Attain
Inst30Quest1_HORDE_Aim = Inst30Quest1_Aim
Inst30Quest1_HORDE_Location = Inst30Quest1_Location
Inst30Quest1_HORDE_Note = Inst30Quest1_Note
Inst30Quest1_HORDE_Prequest = Inst30Quest1_Prequest
Inst30Quest1_HORDE_Folgequest = Inst30Quest1_Folgequest
--
Inst30Quest1name1_HORDE = Inst30Quest1name1



--------------- INST31 - Azuregos ---------------

Inst31Story = "在世界大分裂之前，暗夜精灵之城埃达拉斯在如今被称作艾萨拉的土地上可说是非常繁盛。据说很多古老和强大的高等精灵神器，可能就藏在强极一时的堡垒里。经历了无数世代，蓝龙军团全力保护神器与魔法传说，确保它们不落入凡人手中。蓝龙，艾索雷葛斯的出现，似乎暗示着那些具有极重要意义的物品，像是预言中的永恒之瓶，或许就能在艾萨拉的荒野里找到。无论艾索雷葛斯在寻找什么，可以肯定的是：他会誓死保卫艾萨拉的魔法宝藏。"
Inst31Caption = "艾索雷葛斯"
Inst31QAA = "1 个任务"
Inst31QAH = "1 个任务"

--Quest 1 Alliance
Inst31Quest1 = "1. 龙筋箭袋 (猎人史诗任务)"
Inst31Quest1_Level = "60"
Inst31Quest1_Attain = "60"
Inst31Quest1_Aim = "费伍德森林的古树哈斯塔特要求你带回一块成年蓝龙的肌腱."
Inst31Quest1_Location = "古树哈斯塔特 (费伍德森林 - 铁木树林; "..YELLOW.."48,24"..WHITE..")"
Inst31Quest1_Note = "杀死艾索雷葛斯得到蓝龙肉，它在 艾萨拉 "..YELLOW.."[1]"..WHITE.."."
Inst31Quest1_Prequest = "有，远古石叶 ("..YELLOW.."熔火之心"..WHITE..")"
Inst31Quest1_Folgequest = "无"
Inst31Quest1PreQuest = "true"
--
Inst31Quest1name1 = "Ancient Sinew Wrapped Lamina"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst31Quest1_HORDE = Inst31Quest1
Inst31Quest1_HORDE_Level = Inst31Quest1_Level
Inst31Quest1_HORDE_Attain = Inst31Quest1_Attain
Inst31Quest1_HORDE_Aim = Inst31Quest1_Aim
Inst31Quest1_HORDE_Location = Inst31Quest1_Location
Inst31Quest1_HORDE_Note = Inst31Quest1_Note
Inst31Quest1_HORDE_Prequest = Inst31Quest1_Prequest
Inst31Quest1_HORDE_Folgequest = Inst31Quest1_Folgequest
Inst31Quest1PreQuest_HORDE = Inst31Quest1PreQuest
--
Inst31Quest1name1_HORDE = Inst31Quest1name1



--------------- INST32 - Highlord Kruul ---------------

Inst32Story = "在燃烧军团于第三次大战获胜之后，由恶魔卡扎克所领导的剩余敌军，退回了诅咒之地。到现在为止他们都还住在那里，一个叫腐烂之痕的地方，等待黑暗之门再度敞开。谣传黑暗之门再度敞开之时，卡扎克将带着他剩下的军队前往外域。曾经是兽人家园的德拉诺，外域被兽人萨满耐奥祖所建造的数个传送门同时开启而分割开来，现在更成为被暗夜精灵背叛者伊利丹统帅的恶魔军队所占领的破碎世界。"
Inst32Caption = "卡扎克"
Inst32QAA = "无任务"
Inst32QAH = "无任务"



--------------- INST64 - Doom Lord Kazzak ---------------

Inst64Story = {
  ["Page1"] = "燃烧军团第二次入侵艾泽拉斯时,卡扎克领主是入侵军最高级别的指挥官之一。当时军团拥有一把叫龙王战刃的神器，它浸透了大地、时光、梦境、魔法和生命五种力量(正是从五色龙族的身上掠夺而来)。即便有此神兵在手，阿克蒙德和他的将士们最终依旧兵败于海加尔山，这把战刃也在战斗中被击碎。卡扎克知道第三次大战的结局已无法挽回，于是被迫撤退。战后，战刃的碎片被联军秘密地藏匿了起来.",
  ["Page2"] = "最近，卡扎克和他的爪牙们重新激活了黑暗之门，卡扎克本人穿越了传送门前往外域统帅当地的军团大军。而与此同时，他委托他留在艾泽拉斯的最强副官——也就是魔王库鲁尔——去取回龙王碎片。一旦库鲁尔成功，这把强大的战刃将能被再度重铸。有了龙王战刃，再配上那清洗宇宙中一切生命的疯狂执念，军团将再一次不可阻挡.",
  ["MaxPages"] = "2",
};
Inst64Caption = "末日领主卡扎克"
Inst64QAA = "无任务"
Inst64QAH = "无任务"



--------------- INST65 - Doomwalker ---------------

Inst65Story = "末日行者是基尔加丹制造的一个魔铁机器，用来看守黑暗神殿。\n\n它是一个户外首领，拥有120级装绑的紫装掉落"
Inst65Caption = "末日行者"
Inst65QAA = "无任务"
Inst65QAH = "无任务"



--------------- INST66 - Skettis ---------------

Inst66Story = "斯克提斯曾经是鸦人的首府，现在斯克提斯的鸦人首领泰罗克在聚集自己的力量，来对沙塔斯城展开攻击，沙塔斯天空卫队当然不能坐视不管，他们正招募玩家加入抵抗泰罗克的战斗中。"
Inst66Caption = "斯克提斯"
Inst66QAA = "13 个任务"
Inst66QAH = "13 个任务"

--Quest 1 Alliance
Inst66Quest1 = "1. 前往斯克提斯!"
Inst66Quest1_Level = "70"
Inst66Quest1_Attain = "70"
Inst66Quest1_Aim = "前往位于斯克提斯外的黑风码头，将炸药包交给空军上尉杜尔因."
Inst66Quest1_Location = "尤拉  (沙塔斯城; "..YELLOW.."65,42"..WHITE..")"
Inst66Quest1_Note = "该任务的前续任务也是这个人接到的. 黑风码头 在 "..YELLOW.."[1]"..WHITE.."."
Inst66Quest1_Prequest = "有，临近的威胁"
Inst66Quest1_Folgequest = "有，轰炸斯克提斯"
Inst66Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst66Quest2 = "2. 轰炸斯克提斯 (日常)"
Inst66Quest2_Level = "70"
Inst66Quest2_Attain = "70"
Inst66Quest2_Aim = "找到斯克提斯巢穴上面的巨大的卡利鸟蛋，利用天空卫队的炸弹毁掉它们。完成任务之后回去向空军上尉杜尔因复命."
Inst66Quest2_Location = "空军上尉杜尔因 (泰罗卡森林 - 黑风码头; "..YELLOW.."65,66"..WHITE..")"
Inst66Quest2_Note = "日常任务，你可以在飞行坐骑上完成轰炸任务."
Inst66Quest2_Prequest = "有，前往斯克提斯!"
Inst66Quest2_Folgequest = "无"
Inst66Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst66Quest3 = "3. 逃离斯克提斯 (日常)"
Inst66Quest3_Level = "70"
Inst66Quest3_Attain = "70"
Inst66Quest3_Aim = "护送天空卫队囚犯前往安全的地方，然后向空军上尉杜尔因复命."
Inst66Quest3_Location = "天空卫队囚犯 (泰罗卡森林 - 斯克提斯; "..YELLOW.."[4]"..WHITE..")"
Inst66Quest3_Note = "日常任务，囚犯有3个可能的刷新点，地图上标注为 4 的地方."
Inst66Quest3_Prequest = "无"
Inst66Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst66Quest4 = "4. 饥饿的虚空鳐"
Inst66Quest4_Level = "70"
Inst66Quest4_Attain = "70"
Inst66Quest4_Aim = "在黑风码头南边的森林内使用虚空鳐的笼子，并在饥饿的虚空鳐旁杀死黑风追迹者。完成任务之后回去向天空卫队训练师德萨克复命."
Inst66Quest4_Location = "天空卫队训练师德萨克 (泰罗卡森林 - 黑风码头; "..YELLOW.."63,66"..WHITE..")"
Inst66Quest4_Note = "黑风追迹者分布在斯克提斯的四周，南部居多，确保你杀死的是追迹者同时保证饥饿的虚空鳐同时也在你杀死的目标附近."
Inst66Quest4_Prequest = "无"
Inst66Quest4_Folgequest = "无"
--
Inst66Quest4name1 = "Elixir of Major Agility"
Inst66Quest4name2 = "Adept's Elixir"

--Quest 5 Alliance
Inst66Quest5 = "5.阴影世界"
Inst66Quest5_Level = "70"
Inst66Quest5_Attain = "70"
Inst66Quest5_Aim = "瑟维里要你进入斯克提斯，从居住在那里的鸦人身上找到6份暗影之尘."
Inst66Quest5_Location = "瑟维里 (泰罗卡森林 - 黑风码头; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest5_Note = "任务是可重复性的，斯克提斯的鸦人都可能掉落暗影之尘."
Inst66Quest5_Prequest = "无"
Inst66Quest5_Folgequest = "无"
--
Inst66Quest5name1 = "Elixir of Shadows"

--Quest 6 Alliance
Inst66Quest6 = "6. 鸦爪祭司的秘密"
Inst66Quest6_Level = "70"
Inst66Quest6_Attain = "70"
Inst66Quest6_Aim = "从瑟维里那儿获取暗影药剂。前往斯克提斯，利用暗影药剂找到并杀死伊沙尔、斯卡基克和塞尔利克三位鸦爪祭司。完成任务后向空军指挥官阿达利斯复命."
Inst66Quest6_Location = "空军指挥官阿达利斯 (泰罗卡森林 - 黑风码头; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest6_Note = "你必须首先完成阴影世界任务喝下暗影药剂才能看见这个几个祭祀.\n\n 伊沙尔 在"..YELLOW.."[5]"..WHITE..", 斯卡基克 在 "..YELLOW.."[6]"..WHITE.." 塞尔利克 在 "..YELLOW.."[7]"..WHITE.."."
Inst66Quest6_Prequest = "有，阴影世界"
Inst66Quest6_Folgequest = "无"
Inst66Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst66Quest7 = "7. 伊沙尔的历书"
Inst66Quest7_Level = "70"
Inst66Quest7_Attain = "70"
Inst66Quest7_Aim = "把伊沙尔的历书带给天空卫队的指挥官阿达利斯."
Inst66Quest7_Location = "伊沙尔的历书 (鸦人祭祀伊沙尔 掉落; "..YELLOW.."[5]"..WHITE..")"
Inst66Quest7_Note = "空军指挥官阿达利斯 在 泰罗卡森林 - 黑风码头 ("..YELLOW.."64,66"..WHITE..")."
Inst66Quest7_Prequest = "No"
Inst66Quest7_Folgequest = "有, 贫民窟的盟友"
-- No Rewards for this quest

--Quest 8 Alliance
Inst66Quest8 = "8. 贫民窟的盟友"
Inst66Quest8_Level = "70"
Inst66Quest8_Attain = "70"
Inst66Quest8_Aim = "将伊沙尔的历书交给沙塔斯城贫民窟中的救赎者瑞拉克."
Inst66Quest8_Location = "空军指挥官阿达利斯 (泰罗卡森林 - 黑风码头; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest8_Note = "救赎者瑞拉克 在 沙塔斯城 贫民窟 ("..YELLOW.."52,20"..WHITE..")."
Inst66Quest8_Prequest = "有, 伊沙尔的历书"
Inst66Quest8_Folgequest = "有, 末日将至"
Inst66Quest8FQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst66Quest9 = "9. 末日将至"
Inst66Quest9_Level = "70"
Inst66Quest9_Attain = "70"
Inst66Quest9_Aim = "向空军指挥官阿达利斯汇报泰罗克归来一事."
Inst66Quest9_Location = "救赎者瑞拉克 (沙塔斯城 - 贫民窟; "..YELLOW.."52,20"..WHITE..")"
Inst66Quest9_Note = "空军指挥官阿达利斯 在 泰罗卡森林 - 黑风码头 ("..YELLOW.."64,66"..WHITE.."). Hazzik, who is nearby, will give you the followup quest."
Inst66Quest9_Prequest = "有, 贫民窟的盟友"
Inst66Quest9_Folgequest = "有, 哈吉克的协议"
Inst66Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst66Quest10 = "10. 哈吉克的协议"
Inst66Quest10_Level = "70"
Inst66Quest10_Attain = "70"
Inst66Quest10_Aim = "进入斯克提斯的东部区域，在哈吉克的住处中找到哈吉克的包裹，然后把包裹带回去给他."
Inst66Quest10_Location = "哈吉克 (泰罗卡森林 - 黑风码头; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest10_Note = "哈吉克的包裹 在 "..YELLOW.."[8]"..WHITE.."."
Inst66Quest10_Prequest = "有，末日降至"
Inst66Quest10_Folgequest = "有，粗糙的伪装"
Inst66Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst66Quest11 = "11. 粗糙的伪装"
Inst66Quest11_Level = "70"
Inst66Quest11_Attain = "70"
Inst66Quest11_Aim = "穿上粗糙的鸦人伪装服，从萨哈克那儿取得《仇敌的血脉》，然后向哈吉克复命."
Inst66Quest11_Location = "哈吉克 (泰罗卡森林 - 黑风码头; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest11_Note = "萨哈克 在 "..YELLOW.."[3]"..WHITE..". "
Inst66Quest11_Prequest = "有，哈吉克的协议"
Inst66Quest11_Folgequest = "有，仇敌的血脉"
Inst66Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst66Quest12 = "12. 仇敌的血脉"
Inst66Quest12_Level = "70"
Inst66Quest12_Attain = "70"
Inst66Quest12_Aim = "在斯克提斯找到召唤法阵中央的颅骨堆，在此使用10个迷失卷轴，并击败每一只被召唤出来的后裔。完成之后带着从它们身上取下的信物回去向哈吉克复命."
Inst66Quest12_Location = "哈吉克 (泰罗卡森林 - 黑风码头; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest12_Note = "召唤法阵 位于 "..GREEN.."[1']"..WHITE..". 每次召唤只会掉落一个任务物品，所以招之前请事先商量任务物品归属."
Inst66Quest12_Prequest = "有，粗糙的伪装"
Inst66Quest12_Folgequest = "无"
Inst66Quest12FQuest = "true"
--
Inst66Quest12name1 = "Time-Lost Offering"

--Quest 13 Alliance
Inst66Quest13 = "13. 泰罗克的毁灭"
Inst66Quest13_Level = "70"
Inst66Quest13_Attain = "70"
Inst66Quest13_Aim = "将哈吉克准备好的失落的祭品带到斯克提斯中央的颅骨堆，召唤出泰罗克并击败它。完成这个任务之后回去向空军指挥官阿达利斯复命."
Inst66Quest13_Location = "空军指挥官阿达利斯 (泰罗卡森林 - 黑风码头; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest13_Note = "召唤泰罗克 在 "..YELLOW.."[2]"..WHITE..". 小帮助，当泰罗克血量低时，他会进入无敌状态，这时候需要等天空卫队丢下蓝色的烟雾弹，把泰罗克引到烟雾弹上才能解除他的无敌状态."
Inst66Quest13_Prequest = "有，仇敌的血脉"
Inst66Quest13_Folgequest = "无"
Inst66Quest13PreQuest = "true"
--
Inst66Quest13name1 = "Jeweled Rod"
Inst66Quest13name2 = "Scout's Throwing Knives"
Inst66Quest13name3 = "Severin's Cane"
Inst66Quest13name4 = "Windcharger's Lance"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst66Quest1_HORDE = Inst66Quest1
Inst66Quest1_HORDE_Level = Inst66Quest1_Level
Inst66Quest1_HORDE_Attain = Inst66Quest1_Attain
Inst66Quest1_HORDE_Aim = Inst66Quest1_Aim
Inst66Quest1_HORDE_Location = Inst66Quest1_Location
Inst66Quest1_HORDE_Note = Inst66Quest1_Note
Inst66Quest1_HORDE_Prequest = Inst66Quest1_Prequest
Inst66Quest1_HORDE_Folgequest = Inst66Quest1_Folgequest
Inst66Quest1PreQuest_HORDE = Inst66Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst66Quest2_HORDE = Inst66Quest2
Inst66Quest2_HORDE_Level = Inst66Quest2_Level
Inst66Quest2_HORDE_Attain = Inst66Quest2_Attain
Inst66Quest2_HORDE_Aim = Inst66Quest2_Aim
Inst66Quest2_HORDE_Location = Inst66Quest2_Location
Inst66Quest2_HORDE_Note = Inst66Quest2_Note
Inst66Quest2_HORDE_Prequest = Inst66Quest2_Prequest
Inst66Quest2_HORDE_Folgequest = Inst66Quest2_Folgequest
Inst66Quest2PreQuest_HORDE = Inst66Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst66Quest3_HORDE = Inst66Quest3
Inst66Quest3_HORDE_Level = Inst66Quest3_Level
Inst66Quest3_HORDE_Attain = Inst66Quest3_Attain
Inst66Quest3_HORDE_Aim = Inst66Quest3_Aim
Inst66Quest3_HORDE_Location = Inst66Quest3_Location
Inst66Quest3_HORDE_Note = Inst66Quest3_Note
Inst66Quest3_HORDE_Prequest = Inst66Quest3_Prequest
Inst66Quest3_HORDE_Folgequest = Inst66Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst66Quest4_HORDE = Inst66Quest4
Inst66Quest4_HORDE_Level = Inst66Quest4_Level
Inst66Quest4_HORDE_Attain = Inst66Quest4_Attain
Inst66Quest4_HORDE_Aim = Inst66Quest4_Aim
Inst66Quest4_HORDE_Location = Inst66Quest4_Location
Inst66Quest4_HORDE_Note = Inst66Quest4_Note
Inst66Quest4_HORDE_Prequest = Inst66Quest4_Prequest
Inst66Quest4_HORDE_Folgequest = Inst66Quest4_Folgequest
--
Inst66Quest4name1_HORDE = Inst66Quest4name1
Inst66Quest4name2_HORDE = Inst66Quest4name2

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst66Quest5_HORDE = Inst66Quest5
Inst66Quest5_HORDE_Level = Inst66Quest5_Level
Inst66Quest5_HORDE_Attain = Inst66Quest5_Attain
Inst66Quest5_HORDE_Aim = Inst66Quest5_Aim
Inst66Quest5_HORDE_Location = Inst66Quest5_Location
Inst66Quest5_HORDE_Note = Inst66Quest5_Note
Inst66Quest5_HORDE_Prequest = Inst66Quest5_Prequest
Inst66Quest5_HORDE_Folgequest = Inst66Quest5_Folgequest
--
Inst66Quest5name1_HORDE = Inst66Quest5name1
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst66Quest6_HORDE = Inst66Quest6
Inst66Quest6_HORDE_Level = Inst66Quest6_Level
Inst66Quest6_HORDE_Attain = Inst66Quest6_Attain
Inst66Quest6_HORDE_Aim = Inst66Quest6_Aim
Inst66Quest6_HORDE_Location = Inst66Quest6_Location
Inst66Quest6_HORDE_Note = Inst66Quest6_Note
Inst66Quest6_HORDE_Prequest = Inst66Quest6_Prequest
Inst66Quest6_HORDE_Folgequest = Inst66Quest6_Folgequest
Inst66Quest6PreQuest_HORDE = Inst66Quest6PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst66Quest7_HORDE = Inst66Quest7
Inst66Quest7_HORDE_Level = Inst66Quest7_Level
Inst66Quest7_HORDE_Attain = Inst66Quest7_Attain
Inst66Quest7_HORDE_Aim = Inst66Quest7_Aim
Inst66Quest7_HORDE_Location = Inst66Quest7_Location
Inst66Quest7_HORDE_Note = Inst66Quest7_Note
Inst66Quest7_HORDE_Prequest = Inst66Quest7_Prequest
Inst66Quest7_HORDE_Folgequest = Inst66Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst66Quest8_HORDE = Inst66Quest8
Inst66Quest8_HORDE_Level = Inst66Quest8_Level
Inst66Quest8_HORDE_Attain = Inst66Quest8_Attain
Inst66Quest8_HORDE_Aim = Inst66Quest8_Aim
Inst66Quest8_HORDE_Location = Inst66Quest8_Location
Inst66Quest8_HORDE_Note = Inst66Quest8_Note
Inst66Quest8_HORDE_Prequest = Inst66Quest8_Prequest
Inst66Quest8_HORDE_Folgequest = Inst66Quest8_Folgequest
Inst66Quest8FQuest_HORDE = Inst66Quest8FQuest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst66Quest9_HORDE = Inst66Quest9
Inst66Quest9_HORDE_Level = Inst66Quest9_Level
Inst66Quest9_HORDE_Attain = Inst66Quest9_Attain
Inst66Quest9_HORDE_Aim = Inst66Quest9_Aim
Inst66Quest9_HORDE_Location = Inst66Quest9_Location
Inst66Quest9_HORDE_Note = Inst66Quest9_Note
Inst66Quest9_HORDE_Prequest = Inst66Quest9_Prequest
Inst66Quest9_HORDE_Folgequest = Inst66Quest9_Folgequest
Inst66Quest9FQuest_HORDE = Inst66Quest9FQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst66Quest10_HORDE = Inst66Quest10
Inst66Quest10_HORDE_Level = Inst66Quest10_Level
Inst66Quest10_HORDE_Attain = Inst66Quest10_Attain
Inst66Quest10_HORDE_Aim = Inst66Quest10_Aim
Inst66Quest10_HORDE_Location = Inst66Quest10_Location
Inst66Quest10_HORDE_Note = Inst66Quest10_Note
Inst66Quest10_HORDE_Prequest = Inst66Quest10_Prequest
Inst66Quest10_HORDE_Folgequest = Inst66Quest10_Folgequest
Inst66Quest10FQuest_HORDE = Inst66Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst66Quest11_HORDE = Inst66Quest11
Inst66Quest11_HORDE_Level = Inst66Quest11_Level
Inst66Quest11_HORDE_Attain = Inst66Quest11_Attain
Inst66Quest11_HORDE_Aim = Inst66Quest11_Aim
Inst66Quest11_HORDE_Location = Inst66Quest11_Location
Inst66Quest11_HORDE_Note = Inst66Quest11_Note
Inst66Quest11_HORDE_Prequest = Inst66Quest11_Prequest
Inst66Quest11_HORDE_Folgequest = Inst66Quest11_Folgequest
Inst66Quest11FQuest_HORDE = Inst66Quest11FQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst66Quest12_HORDE = Inst66Quest12
Inst66Quest12_HORDE_Level = Inst66Quest12_Level
Inst66Quest12_HORDE_Attain = Inst66Quest12_Attain
Inst66Quest12_HORDE_Aim = Inst66Quest12_Aim
Inst66Quest12_HORDE_Location = Inst66Quest12_Location
Inst66Quest12_HORDE_Note = Inst66Quest12_Note
Inst66Quest12_HORDE_Prequest = Inst66Quest12_Prequest
Inst66Quest12_HORDE_Folgequest = Inst66Quest12_Folgequest
Inst66Quest12FQuest_HORDE = Inst66Quest12FQuest
--
Inst66Quest12name1_HORDE = Inst66Quest12name1

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst66Quest13_HORDE = Inst66Quest13
Inst66Quest13_HORDE_Level = Inst66Quest13_Level
Inst66Quest13_HORDE_Attain = Inst66Quest13_Attain
Inst66Quest13_HORDE_Aim = Inst66Quest13_Aim
Inst66Quest13_HORDE_Location = Inst66Quest13_Location
Inst66Quest13_HORDE_Note = Inst66Quest13_Note
Inst66Quest13_HORDE_Prequest = Inst66Quest13_Prequest
Inst66Quest13_HORDE_Folgequest = Inst66Quest13_Folgequest
Inst66Quest13PreQuest_HORDE = Inst66Quest13PreQuest
Inst66Quest13FQuest_HORDE = Inst66Quest13FQuest
--
Inst66Quest13name1_HORDE = Inst66Quest13name1
Inst66Quest13name2_HORDE = Inst66Quest13name2
Inst66Quest13name3_HORDE = Inst66Quest13name3
Inst66Quest13name4_HORDE = Inst66Quest13name4


---------------------------
--- AQ Instance Numbers ---
---------------------------

-- 1  = Deadmines (VC)
-- 2  = Wailing Caverns (WC)
-- 3  = Ragefire Chasm (RFC)
-- 4  = Uldaman (ULD)
-- 5  = Blackrock Depths (BRD)
-- 6  = Blackwing Lair (BWL)
-- 7  = Blackfathom Deeps (BFD)
-- 8  = Lower Blackrock Spire (LBRS)
-- 9  = Upper Blackrock Spire (UBRS)
-- 10 = Dire Maul East (DM)
-- 11 = Dire Maul North (DM)
-- 12 = Dire Maul West (DM)
-- 13 = Maraudon (Mara)
-- 14 = Molten Core (MC)
-- 15 = Naxxramas (Naxx)
-- 16 = Onyxia's Lair (Ony)
-- 17 = Razorfen Downs (RFD)
-- 18 = Razorfen Kraul (RFK)
-- 19 = SM: Library (SM Lib)
-- 20 = Scholomance (Scholo)
-- 21 = Shadowfang Keep (SFK)
-- 22 = Stratholme (Strat)
-- 23 = The Ruins of Ahn'Qiraj (AQ20)
-- 24 = The Stockade (Stocks)
-- 25 = Sunken Temple (ST)
-- 26 = The Temple of Ahn'Qiraj (AQ40)
-- 27 = Zul'Farrak (ZF)
-- 28 = Zul'Gurub (ZG)
-- 29 = Gnomeregan (Gnomer)
-- 30 = Four Dragons
-- 31 = Azuregos
-- 32 = Highlord Kruul
-- 33 = Alterac Valley (AV)
-- 34 = Arathi Basin (AB)
-- 35 = Warsong Gulch (WSG)
-- 36 =  default "rest"
-- 37 = HFC: Ramparts (Ramp)
-- 38 = HFC: Blood Furnace (BF)
-- 39 = HFC: Shattered Halls (SH)
-- 40 = HFC: Magtheridon's Lair
-- 41 = CR: The Slave Pens (SP)
-- 42 = CR: The Steamvault (SV)
-- 43 = CR: The Underbog (UB)
-- 44 = Auchindoun: Auchenai Crypts (AC)
-- 45 = Auchindoun: Mana Tombs (MT)
-- 46 = Auchindoun: Sethekk Halls (Seth)
-- 47 = Auchindoun: Shadow Labyrinth (SLabs)
-- 48 = CR: Serpentshrine Cavern (SSC)
-- 49 = CoT: Black Morass (BM)
-- 50 = CoT: Battle of Mount Hyjal
-- 51 = CoT: Old Hillsbrad
-- 52 = Gruul's Lair (GL)
-- 53 = Karazhan (Kara)
-- 54 = TK: Arcatraz (Arc)
-- 55 = TK: Botanica (Bot)
-- 56 = TK: Mechanar (Mech)
-- 57 = SM: Armory (SM Arm)
-- 58 = SM: Cathedral (SM Cath)
-- 59 = SM: Graveyard (SM GY)
-- 60 = Eye of the Storm
-- 61 = TK: The Eye
-- 62 = Black Temple (BT)
-- 63 = Zul'Aman (ZA)
-- 64 = Doom Lord Kazzak
-- 65 = Doomwalker
-- 66 = Skettis
-- 67 = Magisters' Terrace
-- 68 = Sunwell Plateau
end
