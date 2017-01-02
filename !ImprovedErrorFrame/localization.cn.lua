--------------------------------------------------
-- localization.cn.lua (Chinese) by shu
-- $LastChangedBy: Miravlix $
-- $Date: 2006-05-27 23:47:37 -0500 (Sat, 27 May 2006) $

if ( GetLocale() == "zhCN" ) then

	-- Interface Configuration
	IEF_FILE		= "文件: ";
	IEF_STRING		= "字符: ";
	IEF_LINE		= "行: ";
	IEF_COUNT		= "计数: ";
	IEF_ERROR		= "错误: ";
	--IEF_ADDON		= "AddOn: ";
	--IEF_PATH		= "Path: ";

	IEF_CANCEL		= "取消";
	IEF_CLOSE		= "关闭";
	IEF_REPORT		= "报告";

	IEF_INFINITE		= "无穷";

	-- Slash command strings
	IEF_NOTIFY_ON		= "ImprovedErrorFrame: 告警延迟通知生效.";
	IEF_NOTIFY_OFF		= "ImprovedErrorFrame: 发生时候立即报告.";
	IEF_BLINK_ON		= "ImprovedErrorFrame: Pending错误发生时候,闪烁.";
	IEF_BLINK_OFF		= "ImprovedErrorFrame: 按钮不闪烁.";
	IEF_COUNT_ON		= "ImprovedErrorFrame: 显示Pending错误计数.";
	IEF_COUNT_OFF		= "ImprovedErrorFrame: 不对Pending错误计数.";
	IEF_ALWAYS_ON		= "ImprovedErrorFrame: 显示错误按钮.";
	IEF_ALWAYS_OFF		= "ImprovedErrorFrame: 通知来时显示按钮.";
	IEF_SOUND_ON		= "ImprovedErrorFrame: 通知来时声音提示.";
	IEF_SOUND_OFF		= "ImprovedErrorFrame: 无声音提示.";
	IEF_EMPTY_ON		= "ImprovedErrorFrame: 按钮图像闪烁时消失.";
	IEF_EMPTY_OFF		= "ImprovedErrorFrame: 按钮图像闪烁时不变.";
	IEF_DEBUG_ON		= "ImprovedErrorFrame: FrameXML 动作日志开";
	IEF_DEBUG_OFF		= "ImprovedErrorFrame: FrameXML 动作日志关";
	--IEF_DEBUGCAPTURE_ON	= "ImprovedErrorFrame: Sea debug capture on";
	--IEF_DEBUGCAPTURE_OFF	= "ImprovedErrorFrame: Sea debug capture off";
	IEF_FORMAT_STR		= "格式: /ief <NOTIFY|BLINK|COUNT|ALWAYS|SOUND|EMPTY|DEBUG> <ON|OFF>";
	IEF_CURRENT_SETTINGS	= "当前设置:";
	IEF_BLINK_OPT		= "blink";
	IEF_NOTIFY_OPT		= "notify";
	IEF_COUNT_OPT		= "count";
	IEF_ALWAYS_OPT		= "always";
	IEF_SOUND_OPT		= "sound";
	IEF_EMPTY_OPT		= "empty";
	IEF_DEBUG_OPT		= "debug";
	IEF_ON			= "on";
	IEF_OFF			= "off";
	IEF_HELP_TEXT		= "/ief - 错误Frame配置";
	--IEF_HELP_DEBUGCAPTURE_TEXT =	"/iefd - Toggle for IEF capturing Sea debug prints";

	-- Tooltip Text
	IEF_TOOLTIP		= "点击查看错误.";
	-- Header Text
	IEF_TITLE_TEXT		= "错误队列";
	IEF_ERROR_TEXT		= "实时错误";

	-- Khaos/Cosmos descriptions
	IEF_OPTION_TEXT		= "改良版错误Frame";
	IEF_OPTION_HELP		= "允许设置错误选项.";
	IEF_HEADER_TEXT		= "改良版错误Frame";
	IEF_HEADER_HELP		= "错误报告选项配置.";
	IEF_NOTIFY_TEXT		= "错误队列";
	IEF_NOTIFY_HELP		= "如果勾选,错误将放入队列,稍后显示.";
	IEF_BLINK_TEXT		= "闪烁按钮";
	IEF_BLINK_HELP		= "如果勾选, 当为显示类型错误时,按钮闪烁.";
	IEF_COUNT_TEXT		= "在按钮上显示错误计数";
	IEF_COUNT_HELP		= "如果勾选, 按钮上将显示错误计数.";
	IEF_ALWAYS_TEXT		= "总是显示错误按钮";
	IEF_ALWAYS_HELP		= "如果勾选, 屏幕上总是出现错误按钮.";
	IEF_SOUND_TEXT		= "声音通知";
	IEF_SOUND_HELP		= "如果勾选, 错误发生时,声音警告.";
	IEF_EMPTY_TEXT		= "清楚按钮图像";
	IEF_EMPTY_HELP		= "如果勾选, 闪烁时错误按钮图像消失.";
	IEF_DEBUG_TEXT		= "动态FrameXML 错误日志";
	IEF_DEBUG_HELP		= "如果勾选, FrameXML.log 将以动态模式输出. (需要 UI 重启)";
	--IEF_DEBUGCAPTURE_TEXT	= "Capture Sea debug prints"
	--IEF_DEBUGCAPTURE_HELP	= "If checked, the frame will capture Sea debug prints and list them for copy/pasting in the IEF window"
end