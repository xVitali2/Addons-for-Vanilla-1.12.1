
--[[ ----------------------------------------------------------------

			简 体 中 文

-------------------------------------------------------------------]]

if( GetLocale() == "zhCN" ) then

-- Errors
-- -------
COESTR_NOTASHAMAN = "你不是一个萨满祭司。无法加载COE";
COESTR_NOTOTEM = "无可用图腾";
COESTR_UI_NOTASSIGNED = "<无赋值文本>";
COESTR_INVALIDELEMENT = "图腾中的不完整元素: ";


-- Notifications
-- --------------
COESTR_TOTEMWARNING = "%s将在%d秒后到期";
COESTR_TOTEMEXPIRED = "%s到期了";
COESTR_TOTEMDESTROYED = "%s被摧毁了";
COESTR_SWITCHTOSET = "%s图腾组合被激活";
COESTR_FIXEDSETS = "你的图腾阵施放顺序已固定";
COESTR_UDATEDSAVED = "存档变量已更新版本 ";
COESTR_FIXEDDISPLAY = "存档变量中的错误已被修正。";
COESTR_TOTEMSRELOADED = "图腾已被重置";
COESTR_RESTARTINGSET = "动态图腾组合重置";
COESTR_RESET = "计时器已被重置";
COESTR_HEALCOOLDOWN = " 还没有准备好！";
COESTR_NOHEALING = "不需要治疗";
COESTR_HEALING = "治疗%s，法术为%s(等级%d)";
COESTR_HEALLOWERRANK = "魔法不足。使用等级%d代替";
COESTR_HEALOOM = "魔法不足！";


-- String patterns
-- ----------------
COESTR_SCANTOTEMS = "图腾";
COESTR_TOTEMTOOLS = "工具：(.*)图腾";
COESTR_TOTEMMANA = "(%d*)法力值";
COESTR_TOTEMRANK = "等级 (%d)";
COESTR_MINUTEDURATION = "(%d%.%d%d)分钟";
COESTR_MINUTEDURATION_INT = "(%d)分钟";
COESTR_SECDURATION = "(%d%d?)秒";
COESTR_CASTBYNAME = "%(等级 (%d)%)";
COESTR_TOTEMDAMAGE = { ".+击中(.+图腾) ?%u*造成(%d+)点",
											 ".+对(.+图腾) ?%u*造成(%d+)的致命一击伤害",
											 ".+击中(.+ 图腾)造成(%d+)点",
											 ".+对(.+图腾)造成(%d+)的致命一击伤害" };
COESTR_TOTEMHEALTH = { "生命值为(%d*)的", "生命值为(%d*)点的" };
COESTR_SHOCKSPELL = {"(%a*震击)", "地震术" };
COESTR_HEALINGWAVE = "治疗波";
COESTR_LESSERWAVE = "次级治疗波";
COESTR_MINAMOUNT = "(%d*)到";
COESTR_MAXAMOUNT = "到(%d*)";
COESTR_TRINKET = "^.*%[被迷惑的水之魂%].*$"; 


-- Totem Advisor
-- --------------
COESTR_POISON = "中毒";
COESTR_DISEASE = "疾病";
COESTR_TOTEMPOISON = "清毒图腾";
COESTR_TOTEMDISEASE = "祛病图腾";
COESTR_TOTEMTREMOR = "战栗图腾";
COESTR_CLEANSINGTOTEM = "立即施放%s！";

COESTR_TREMOR = {
	"睡眠", "恐吓", "心灵尖啸", "精神控制", "低沉咆哮", "恐惧",
	"破胆怒吼", "恐慌", "恐吓尖啸", "诱惑",
	"恐惧嚎叫", "破胆怒吼", "水晶沉睡"
}


-- Tools
-- ---------
COESTR_TOTEMTOOLS_EARTH = "大地";
COESTR_TOTEMTOOLS_FIRE = "火焰";
COESTR_TOTEMTOOLS_WATER = "水之";
COESTR_TOTEMTOOLS_AIR = "空气";


-- Elements
-- ---------
COESTR_ELEMENT_EARTH = "大地";
COESTR_ELEMENT_FIRE = "火焰";
COESTR_ELEMENT_WATER = "水";
COESTR_ELEMENT_AIR = "空气";


-- UI elements
-- ------------
COEUI_STRINGS = {
COE_ConfigClose = "关闭";
COE_ConfigTotemTabPanel = "图腾设定";
COE_ConfigHealingTabPanel = "治疗设定";
COE_ConfigDebuffTabPanel = "Debuff设定";
COE_ConfigTotemTotemBar = "图腾栏";
COE_ConfigTotemTotemOptions = "设定";
COE_ConfigTotemTotemSets = "图腾组合";
COE_OptionEnableTotemBar = "开启图腾栏";
COE_OptionHideBackdrop = "不活动时隐藏背景";
COE_OptionEnableTimers = "开启图腾计时器";
COE_OptionEnableTimerNotifications = "开启信息通知";
COE_OptionTTAlignment = "图腾注释定位";
COE_OptionDisplayMode = "图腾栏默认图腾";
COE_OptionDisplayAlignment = "计时器框体形状";
COE_OptionAdvisor = "开启图腾顾问";
COE_OptionEnableSets = "开启图腾组合";
COE_OptionEnableAutoSwitch = "PVP时自动激活图腾组合";
COE_OptionActiveSet = "动态图腾组合";
COE_OptionNewSet = "新组合";
COE_OptionDeleteSet = "删除组合";
COE_OptionConfigureSet = "配置组合";
COE_OptionStopConfigureSet = "决定";
COE_OptionCastOrderString = "施放顺序";
COE_OptionConfigureBar = "配置所需图腾";
COE_OptionFixBar = "固定图腾栏";
COE_OptionConfigureOrder = "配置图腾顺序";
COE_OptionScanTotems = "重新扫描图腾";
COE_OptionCurrentFrame = "选择要配制的图腾系";
COE_OptionDirection = "该系图腾栏弹出方向";
COE_OptionFrameMode = "该系图腾栏模式";
COE_OptionFlexCount = "该系静态按钮数量";
COE_OptionScaling = "放缩比例";
COE_OptionEnableTimerFrame = "使用单独的计时器框体";
COE_OptionGroupBars = "移动全部图腾栏";
COE_OptionOverrideRank = "设定1级图腾组合键";
COE_OptionFrameTimersOnly = "只在计时器框体中显示图腾计时";
}


-- Tooltips
-- ---------
COEUI_TOOLTIPS = {
COE_ConfigTotemTab = "显示图腾设定";
COE_ConfigHealingTab = "显示治疗设定";
COE_ConfigDebuffTab = "显示debuff设定";
COE_OptionEnableTotemBar = "开启并显示你的图腾栏";
COE_OptionHideBackdrop = "当鼠标不在图腾栏上时隐藏背景";
COE_OptionEnableTimers = "在图腾按钮中显示图腾残余时间";
COE_OptionEnableTimerNotifications = "当图腾到期或被摧毁时显示警告";
COE_OptionAdvisor = "当你或你的队友有一个可被图腾解除的debuff时提示你";
COE_OptionEnableAutoSwitch = "当目标转向一个敌方玩家时自动激活相应职业的图腾组合";
COE_OptionFixBar = "固定图腾栏以防止意外移动";
COE_OptionGroupBars = "当你移动一个图腾栏的时候，其他图腾栏也一起移动";
}

COESTR_TRINKET_TOOLTIP = "被迷惑的水之魂"; 
COESTR_TRINKET_TOTEM = "上古法力之泉图腾";

-- Combo boxes
-- ------------
COEUI_TTALIGN = {
{ "ANCHOR_TOPLEFT"; "左上" };
{ "ANCHOR_LEFT"; "左" };
{ "ANCHOR_BOTTOMLEFT"; "左下" }; 
{ "ANCHOR_TOPRIGHT"; "右上" };
{ "ANCHOR_RIGHT"; "右" };
{ "ANCHOR_BOTTOMRIGHT"; "右下" };
{ "DISABLED"; "不可用" };
}

COEUI_DISPLAYMODE = { "自定义", "最新施放的", "动态图腾组合" }
 
COEUI_DISPLAYALIGN = { "方形", "垂直", "水平" }

COEUI_PVPSETS = { "[PVP] 德鲁伊", "[PVP] 猎人", "[PVP] 法师", "[PVP] 圣骑士", "[PVP] 牧师", 
	"[PVP] 盗贼", "[PVP] 萨满祭司", "[PVP] 术士", "[PVP] 战士" }
COEUI_DEFAULTSET = "默认";

COEUI_OVERRIDERANK = { "无按键", "使用SHIFT", "使用ALT", "使用CTRL" };

COEUI_CURRENTFRAME = { "大地", "火焰", "水", "空气" };

COEUI_DIRECTION = { "上", "下", "左", "右" };

COEUI_FRAMEMODE = { "关闭", "打开", "弹出", "隐藏" };


-- Key bindings
-- -------------
BINDING_HEADER_CALLOFELEMENTS = "Call Of Elements";
BINDING_NAME_COESHOWCONFIG = "显示设置菜单";
BINDING_NAME_COEBESTHEAL = "最佳等级治疗波";
BINDING_NAME_COEBATTLEHEAL = "最佳等级次级治疗波";
BINDING_NAME_COETHROWADVISED = "施放下一个建议图腾";
BINDING_NAME_COENEXTSET = "激活下一组图腾组合";
BINDING_NAME_COETHROWSET = "施放动态图腾组合";
BINDING_NAME_COERESTARTSET = "重启动态图腾组合";
BINDING_NAME_TOTEMEARTH1 = "大地图腾#1";
BINDING_NAME_TOTEMEARTH2 = "大地图腾#2";
BINDING_NAME_TOTEMEARTH3 = "大地图腾#3";
BINDING_NAME_TOTEMEARTH4 = "大地图腾#4";
BINDING_NAME_TOTEMEARTH5 = "大地图腾#5";
BINDING_NAME_TOTEMFIRE1 = "火焰图腾#1";
BINDING_NAME_TOTEMFIRE2 = "火焰图腾#2";
BINDING_NAME_TOTEMFIRE3 = "火焰图腾#3";
BINDING_NAME_TOTEMFIRE4 = "火焰图腾#4";
BINDING_NAME_TOTEMFIRE5 = "火焰图腾#5";
BINDING_NAME_TOTEMWATER1 = "水之图腾#1";
BINDING_NAME_TOTEMWATER2 = "水之图腾#2";
BINDING_NAME_TOTEMWATER3 = "水之图腾#3";
BINDING_NAME_TOTEMWATER4 = "水之图腾#4";
BINDING_NAME_TOTEMWATER5 = "水之图腾#5";
BINDING_NAME_TOTEMWATER6 = "水之图腾#6";
BINDING_NAME_TOTEMAIR1 = "空气图腾#1";
BINDING_NAME_TOTEMAIR2 = "空气图腾#2";
BINDING_NAME_TOTEMAIR3 = "空气图腾#3";
BINDING_NAME_TOTEMAIR4 = "空气图腾#4";
BINDING_NAME_TOTEMAIR5 = "空气图腾#5";
BINDING_NAME_TOTEMAIR6 = "空气图腾#6";
BINDING_NAME_TOTEMAIR7 = "空气图腾#7";


-- Key modifiers
-- --------------
COEMODIFIER_ALT = "ALT";
COEMODIFIER_ALT_SHORT = "A";
COEMODIFIER_CTRL = "CTRL";
COEMODIFIER_CTRL_SHORT = "C";
COEMODIFIER_SHIFT = "SHIFT";
COEMODIFIER_SHIFT_SHORT = "S";
COEMODIFIER_NUMPAD = "Num Pad";
COEMODIFIER_NUMPAD_SHORT = "NP";


-- Shell commands
-- ---------------
COESHELL_INTRO = "Call Of Elements的命令行指令:";
COESHELL_CONFIG = "'/coe' or '/coe config' - 显示设置窗口";
COESHELL_LIST = "'/coe list' - 显示这份列表";
COESHELL_NEXTSET = "'/coe nexset' - 切换到下一组自定义图腾组合或默认图腾组合";
COESHELL_PRIORSET = "'/coe priorset' - 切换到前一组自定义图腾组合或默认图腾组合";
COESHELL_SET = "'/coe set <名字>' - 切换到指定名字的图腾组合。";
COESHELL_RESTARTSET = "'/coe restartset' - 你下次施放图腾组合时重置所有图腾";
COESHELL_RESET = "'/coe reset' - 重置所有计时器和动态图腾组合";
COESHELL_RESETFRAMES = "'/coe resetframes' - 移动各系图腾栏到屏幕中央";
COESHELL_RESETORDERING = "'/coe resetordering' - 重置你的图腾栏顺序";
COESHELL_RELOAD = "'/coe reload' - 重置所有图腾和图腾组合";
COESHELL_MACRONOTE = "下面的命令只有当你把它作为宏拖曳到动作条上时才会起作用:";
COESHELL_THROWSET = "'/coe throwset' - 施放动态图腾组合";
COESHELL_ADVISED = "'/coe advised' - 施放下一个建议图腾";

end
