assert( oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRAOMainTank")
local roster = AceLibrary("RosterLib-2.0")
local paintchips = AceLibrary("PaintChips-2.0")
local surface = AceLibrary("Surface-1.0")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["MainTank"] = true,
	["Optional/MainTank"] = true,
	["Options for the maintanks."] = true,
	["Scale"] = true,
	["Set frame scale."] = true,
	["Alpha"] = true,
	["Set frame alpha."] = true,
	["Raid icon"] = true,
	["Toggle raid icons."] = true,
	["Frames"] = true,
	["Options for the maintank frames."] = true,
	["Grow up"] = "Grow up",
	["Toggle growup."] = true,
	["Inverse"] = true,
	["Toggle inverse healthbar."] = true,
	["Deficit"] = true,
	["Toggle deficit health."] = true,
	["Click cast"] = true,
	["Toggle clickcast support."] = true,
	["Click target"] = true,
	["Define clicktargets."] = true,
	["Define the clicktarget for maintank."] = true,
	["Define the clicktarget for target."] = true,
	["Define the clicktarget for targettarget."] = true,
	["Target"] = true,
	["Maintank"] = true,
	["Target Target"] = true,
	["Nr of Maintanks shown."] = true,
	["Nr Maintanks"] = true,
	["Class color"] = true,
	["Color healthbars by class."] = true,
	["Enemy color"] = true,
	["Set the color for enemies. (used when classcolor is enabled)"] = true,
	["Color Aggro"] = true,
	["Color aggro status for MTs on their names. Orange has target, Green is tanking, Red has no aggro."] = true,
	["Backdrop"] = true,
	["Toggle the backdrop."] = true,
	["Highlight"] = true,
	["Toggle highlighting your target."] = true,
	["Reverse"] = true,
	["Toggle reverse order MT|MTT|MTTT or MTTT|MTT|MT."] = true,
	["Numbers"] = true,
	["Toggle showing of MT numbers."] = true,
	["Tooltips"] = true,
	["Toggle showing of tooltips."] = true,
	["Show"] = true,
	["Show maintank."] = true,
	["Show target."] = true,
	["Show targettarget."] = true,
	["Define which frames you want to see."] = true,
	["Layout"] = true,
	["Set the layout for the MT frames."] = true,
	["Vertical"] = true,
	["Horizontal"] = true,
} end )

L:RegisterTranslations("ruRU", function() return {
	["MainTank"] = "Основной танк (MT)",
	["Optional/MainTank"] = "Дополнительно/MT",
	["Options for the maintanks."] = "Опции для MT.",
	["Scale"] = "Масштаб",
	["Set frame scale."] = "Установка масштаба рамок.",
	["Alpha"] = "Прозрачность",
	["Set frame alpha."] = "Установка прозрачности рамок.",
	["Raid icon"] = "Иконки рейда",
	["Toggle raid icons."] = "Вкл./Выкл. иконок рейда.",
	["Frames"] = "Рамки",
	["Options for the maintank frames."] = "Опции для рамок MT.",
	["Grow up"] = "Рост вверх",
	["Toggle growup."] = "Вкл./Выкл. рост вверх.",
	["Inverse"] = "Инверсия",
	["Toggle inverse healthbar."] = "Вкл./Выкл. инверсии полосы здоровья.",
	["Deficit"] = "Нехватка",
	["Toggle deficit health."] = "Вкл./Выкл. отображения нехватки здоровья.",
	["Click cast"] = "Click cast",
	["Toggle clickcast support."] = "Toggle clickcast support.",
	["Click target"] = "Нажатие на рамки",
	["Define clicktargets."] = "Определение взятия в цель.",
	["Define the clicktarget for maintank."] = "Определение взятия в цель по нажатии на рамку MT.",
	["Define the clicktarget for target."] = "Определение взятия в цель по нажатии на рамку цели.",
	["Define the clicktarget for targettarget."] = "Определение взятия в цель по нажатии на рамку цель цели.",
	["Target"] = "Цель",
	["Maintank"] = "MT",
	["Target Target"] = "Цель цели",
	["Nr of Maintanks shown."] = "Количество отображаемых MT.",
	["Nr Maintanks"] = "Количество MT",
	["Class color"] = "Цвет класса",
	["Color healthbars by class."] = "Цветные полосы здоровья по классам.",
	["Enemy color"] = "Цвет врага",
	["Set the color for enemies. (used when classcolor is enabled)"] = "Установка цвета для врагов. (Используется, когда цвет класса включен)",
	["Color Aggro"] = "Цвет аггро",
	["Color aggro status for MTs on their names. Orange has target, Green is tanking, Red has no aggro."] = "Статус цвета аггро для MT на их именах. Оранжевый - имеет цель, Зеленый - танкует, Красный - не имеет аггро.",
	["Backdrop"] = "Фон",
	["Toggle the backdrop."] = "Вкл./Выкл. фона.",
	["Highlight"] = "Выделение",
	["Toggle highlighting your target."] = "Вкл./Выкл. выделения вашей цели.",
	["Reverse"] = "Обратный порядок",
	["Toggle reverse order MT|MTT|MTTT or MTTT|MTT|MT."] = "Вкл./Выкл. обратного порядка: PT|PTT|PTTT или PTTT|PTT|PT.",
	["Numbers"] = "Номера",
	["Toggle showing of MT numbers."] = "Вкл./Выкл. отображения номеров на MT.",
	["Tooltips"] = "Подсказки",
	["Toggle showing of tooltips."] = "Вкл./Выкл. отображения подсказок.",
	["Show"] = "Отображение",
	["Show maintank."] = "Отображение MT.",
	["Show target."] = "Отображение цели.",
	["Show targettarget."] = "Отображение цели цели.",
	["Define which frames you want to see."] = "Установка отображаемых рамок.",
	["Layout"] = "Располжение",
	["Set the layout for the MT frames."] = "Установика расположения для рамок MT.",
	["Vertical"] = "Вертикально",
	["Horizontal"] = "Горизонтально",
} end )

L:RegisterTranslations("koKR", function() return {
	["MainTank"] = "메인탱커창",
	["Optional/MainTank"] = "부가/메인탱커",
	["Options for the maintanks."] = "메인탱커에 대한 설정을 변경합니다.",
	["Scale"] = "크기",
	["Set frame scale."] = "창의 크기를 설정합니다.",
	["Alpha"] = "투명도",
	["Set frame alpha."] = "창의 투명도를 설정합니다.",
	["Raid icon"] = "공격대아이콘",
	["Toggle raid icons."] = "공격대 아이콘 표시를 토글합니다.",
	["Frames"] = "창",
	["Options for the maintank frames."] = "메인탱커 창에 관한 설정을 변경합니다.",
	["Grow up"] = "방향",
	["Toggle growup."] = "창의 진행 방향을 토글합니다.",
	["Inverse"] = "반전",
	["Toggle inverse healthbar."] = "생명력바 반전기능을 토글합니다.",
	["Deficit"] = "결손치",
	["Toggle deficit health."] = "생명력바 결손치 표시기능을 토글합니다.",
	["Click cast"] = "시전",
	["Toggle clickcast support."] = "클릭캐스트 기능 지원을 토글합니다.",
	["Click target"] = "클릭시대상선정",
	["Define clicktargets."] = "클릭시 선택 대상을 정의합니다.",
	["Define the clicktarget for maintank."] = "메인탱커를 클릭시 선택 대상을 정의합니다.",
	["Define the clicktarget for target."] = "대상 클릭시 선택 대상을 정의합니다.",
	["Define the clicktarget for targettarget."] = "대상의 대상을 클릭시 선택 대상을 정의합니다.",
	["Target"] = "대상",
	["Maintank"] = "메인탱커",
	["Target Target"] = "대상의대상",
	["Nr of Maintanks shown."] = "메인탱커의 번호를 표시합니다.",
	["Nr Maintanks"] = "메인탱커의 수",
	["Class color"] = "직업별색상",
	["Color healthbars by class."] = "직업별로 생명력바의 색상을 변경합니다.",
	["Enemy color"] = "적색상",
	["Set the color for enemies. (used when classcolor is enabled)"] = "적의 경우의 색상을 설정합니다. (직업별색상 기능을 사용할 때)",
	["Color Aggro"] = "어그로 색상",
	["Color aggro status for MTs on their names. Orange has target, Green is tanking, Red has no aggro."] = "현재 상태에 따라서 탱커를 위한 어그로 색상을 표시합니다. 오렌지는 대상. 녹색은 탱커 적색은 어그로 없음입니다.",
	["Backdrop"] = "배경",
	["Toggle the backdrop."] = "배경 토글",
	["Highlight"] = "강조",
	["Toggle highlighting your target."] = "대상 강조 기능 토글",
	["Reverse"] = "반전",
	["Toggle reverse order MT|MTT|MTTT or MTTT|MTT|MT."] = "메인탱커목록의 순서를 반대로 표시합니다.",
	["Numbers"] = "메인탱커번호",
	["Toggle showing of MT numbers."] = "메인탱커의 번호의 표시를 토글합니다.",
	["Tooltips"] = "툴팁",
	["Toggle showing of tooltips."] = "툴팁의 표시를 토글합니다.",
	["Show"] = "표시",
	["Show maintank."] = "메인탱커 표시",
	["Show target."] = "대상 표시",
	["Show targettarget."] = "대상의 대상 표시",
	["Define which frames you want to see."] = "표시하길 원하는 창을 정의합니다.",
	["Layout"] = "레이아웃",
	["Set the layout for the MT frames."] = "메인탱커창의 레이아웃을 설정합니다.",
	["Vertical"] = "수직",
	["Horizontal"] = "수평",
} end )

L:RegisterTranslations("zhCN", function() return {
	["MainTank"] = "MT目标",
	["Optional/MainTank"] = "Optional/MainTank",
	["Options for the maintanks."] = "MT选项",
	["Scale"] = "大小",
	["Set frame scale."] = "设定框体大小",
	["Alpha"] = "透明度",
	["Set frame alpha."] = "设置框体透明度",
	["Raid icon"] = "raid图标",
	["Toggle raid icons."] = "显示raid图标",
	["Frames"] = "框体",
	["Options for the maintank frames."] = "MT框体选项",
	["Grow up"] = "往上增添",
	["Toggle growup."] = "选择往上增添",
	["Inverse"] = "翻转",
	["Toggle inverse healthbar."] = "选择翻转血条",
	["Deficit"] = "亏损血量",
	["Toggle deficit health."] = "显示亏损血量",
	["Click cast"] = "点击施法",
	["Toggle clickcast support."] = "选择点击施法支持",
	["Click target"] = "点击设定目标",
	["Define clicktargets."] = "定义点击设定目标",
	["Define the clicktarget for maintank."] = "定义点击MT设定的目标",
	["Define the clicktarget for target."] = "定义点击MTT设定的目标",
	["Define the clicktarget for targettarget."] = "定义点击MTTT设定的目标",
	["Target"] = "目标",
	["Maintank"] = "MT",
	["Target Target"] = "目标的目标",
	["Nr of Maintanks shown."] = "显示的MT数量",
	["Nr Maintanks"] = "MT数量",
	["Class color"] = "职业颜色",
	["Color healthbars by class."] = "把血条着色为职业颜色",
	["Enemy color"] = "敌人颜色",
	["Set the color for enemies. (used when classcolor is enabled)"] = "为敌人设置颜色(需要激活职业颜色)",
	["Color Aggro"] = "仇恨颜色",
	["Color aggro status for MTs on their names. Orange has target, Green is tanking, Red has no aggro."] = "MT的名字边框用颜色来显示仇恨的状态。橘红是有目标，绿色是正在坦克，红色是没有仇恨",
	["Backdrop"] = "背景",
	["Toggle the backdrop."] = "显示背景",
	["Highlight"] = "高亮",
	["Toggle highlighting your target."] = "高亮显示你的目标",
	["Reverse"] = "逆转",
	["Toggle reverse order MT|MTT|MTTT or MTTT|MTT|MT."] = "逆转顺序：MT|MTT|MTTT 或 MTTT|MTT|MT",
	["Numbers"] = "数量",
	["Toggle showing of MT numbers."] = "显示MT的数量",
	["Tooltips"] = "提示",
	["Toggle showing of tooltips."] = "选择显示提示",
	["Show"] = "显示",
	["Show maintank."] = "显示MT",
	["Show target."] = "显示目标",
	["Show targettarget."] = "显示目标的目标",
	["Define which frames you want to see."] = "定义想要看到的框架",
	["Layout"] = "布局",
	["Set the layout for the MT frames."] = "设置MT框架的布局",
	["Vertical"] = "垂直",
	["Horizontal"] = "水平",
} end )

L:RegisterTranslations("zhTW", function() return {
	["MainTank"] = "主坦",
	["Optional/MainTank"] = "可選/主坦",
	["Options for the maintanks."] = "主坦選項",
	["Scale"] = "大小",
	["Set frame scale."] = "設定框架大小",
	["Alpha"] = "透明度",
	["Set frame alpha."] = "設定框架透明度",
	["Raid icon"] = "團隊圖示",
	["Toggle raid icons."] = "切換團隊圖示",
	["Frames"] = "框體",
	["Options for the maintank frames."] = "主坦框架選項",
	["Grow up"] = "往上排列",
	["Toggle growup."] = "切換往上排列",
	["Inverse"] = "倒轉",
	["Toggle inverse healthbar."] = "切換倒轉血條",
	["Deficit"] = "減少血量",
	["Toggle deficit health."] = "顯示減少血量",
	["Click cast"] = "點擊施法",
	["Toggle clickcast support."] = "切換點擊施法支援",
	["Click target"] = "點擊設定目標",
	["Define clicktargets."] = "定義點擊設定目標",
	["Define the clicktarget for maintank."] = "定義點擊MT設定的目標",
	["Define the clicktarget for target."] = "定義點擊MTT設定的目標",
	["Define the clicktarget for targettarget."] = "定義點擊MTTT設定的目標",
	["Target"] = "目標",
	["Maintank"] = "主坦",
	["Target Target"] = "目標的目標",
	["Nr of Maintanks shown."] = "顯示的主坦數量",
	["Nr Maintanks"] = "主坦數量",
	["Class color"] = "職業顏色",
	["Color healthbars by class."] = "依職業設定血條顏色",
	["Enemy color"] = "敵人顏色",
	["Set the color for enemies. (used when classcolor is enabled)"] = "為敵人設定顏色(需要使用職業顏色)",
	["Color Aggro"] = "仇恨顏色",
	["Color aggro status for MTs on their names. Orange has target, Green is tanking, Red has no aggro."] = "主坦的名字邊框用顏色來顯示仇恨的狀態。橘紅是有目標，綠色是正在坦怪，紅色是沒有仇恨。",
	["Backdrop"] = "背景",
	["Toggle the backdrop."] = "顯示背景",
	["Highlight"] = "高亮度",
	["Toggle highlighting your target."] = "高亮度顯示你的目標",
	["Reverse"] = "反轉",
	["Toggle reverse order MT|MTT|MTTT or MTTT|MTT|MT."] = "反轉順序：MT|MTT|MTTT 或 MTTT|MTT|MT",
	["Numbers"] = "數量",
	["Toggle showing of MT numbers."] = "顯示主坦的數量",
	["Tooltips"] = "提示",
	["Toggle showing of tooltips."] = "顯示提示",
	["Show"] = "顯示",
	["Show maintank."] = "顯示主坦",
	["Show target."] = "顯示目標",
	["Show targettarget."] = "顯示目標的目標",
	["Define which frames you want to see."] = "定義想要看到的框架",
	["Layout"] = "佈置",
	["Set the layout for the MT frames."] = "設定主坦框架的佈置",
	["Vertical"] = "垂直",
	["Horizontal"] = "水平",
} end )

L:RegisterTranslations("deDE", function() return {
	["Options for the maintanks."] = "Einstellungen f\195\188r die Maintanks.",
	["Scale"] = "Gr\195\182\195\159e",
	["Set frame scale."] = "Setze Framegr\195\182\195\159e",
	["Set frame alpha."] = "Setze Framealpha",
	["Toggle raid icons."] = "Aktiviert Raidicons.",
	["Options for the maintank frames."] = "Einstellungen fr die Maintanks-Frames.",
	["Toggle growup."] = "Aktiviert das aufbauen nach oben.",
	["Inverse"] = "Invertieren",
	["Toggle inverse healthbar."] = "Aktiviert invertierte Lebensbalken.",
	["Deficit"] = "Defizit",
	["Toggle deficit health."] = "Aktiviert Lebensdefizit",
	["Toggle clickcast support."] = "Aktiviert Clickcast support.",
	["Define clicktargets."] = "Definiert Clicktargets.",
	["Define the clicktarget for maintank."] = "Definiert Clicktarget f\195\188r Maintank.",
	["Define the clicktarget for target."] = "Definiert Clicktarget f\195\188r target.",
	["Define the clicktarget for targettarget."] = "Definiert Clicktarget f\195\188r targettarget.",
	["Nr of Maintanks shown."] = "Nr der Maintanks anzeigen.",
	["Color healthbars by class."] = "F\195\164rbt Lebensbalken nach Klassen",
	["Set the color for enemies. (used when classcolor is enabled)"] = "Setzt die Farbe f\195\188r Gegner. (nur mit Classcolor aktiv)",
	["Color aggro status for MTs on their names. Orange has target, Green is tanking, Red has no aggro."] = "Farbaggro status f\195\188r die MTs. Orange hat ein Ziel, Gr\195\188n tankt, Rot hat keine aggro.",
} end )

L:RegisterTranslations("frFR", function() return {
	["MainTank"] = "MainTank",
	["Optional/MainTank"] = "Optionnel/MainTank",
	["Options for the maintanks."] = "Optons concernant les maintanks.",
	["Scale"] = "Taille",
	["Set frame scale."] = "D\195\169termine la taille des cadres.",
	["Alpha"] = "Transparence",
	["Set frame alpha."] = "D\195\169termine la transparence des cadres.",
	["Raid icon"] = "Ic\195\180nedeRaid",
	["Toggle raid icons."] = "Affiche ou non les ic\195\180nes de raid.",
	["Frames"] = "Cadres",
	["Options for the maintank frames."] = "Options concernant les cadres des maintanks.",
	["Grow up"] = "VersleHaut",
	["Toggle growup."] = "Ajoute ou non les MTs vers le haut.",
	["Inverse"] = "Inverser",
	["Toggle inverse healthbar."] = "Inverse ou non le sens de remplissage des barres de vie.",
	["Deficit"] = "D\195\169ficit",
	["Toggle deficit health."] = "Affiche ou non le d\195\169ficit en vie.",
	["Click cast"] = "Click cast",
	["Toggle clickcast support."] = "Active ou non le support des addons de \"clickcasting\".",
	["Click target"] = "Click target",
	["Define clicktargets."] = "D\195\169termine la cible des clics.",
	["Define the clicktarget for maintank."] = "D\195\169termine la cible lors du clic sur le cadre du maintank.",
	["Define the clicktarget for target."] = "D\195\169termine la cible lors du clic sur le cadre de la cible.",
	["Define the clicktarget for targettarget."] = "D\195\169termine la cible lors du clic sur le cadre de la cible de la cible.",
	["Target"] = "Cible",
	["Maintank"] = "Maintank",
	["Target Target"] = "CibledelaCible",
	["Nr of Maintanks shown."] = "Nombre de maintanks \195\160 afficher.",
	["Nr Maintanks"] = "Nbre de maintanks",
	["Class color"] = "CouleurdeClasse",
	["Color healthbars by class."] = "Colore les barres de vie selon la classe.",
	["Enemy color"] = "CouleurEnnemi",
	["Set the color for enemies. (used when classcolor is enabled)"] = "D\195\169termine la couleur pour les ennemis. (utilis\195\169 si CouleurdeClasse est activ\195\169)",
	["Color Aggro"] = "Couleur d'aggro",
	["Color aggro status for MTs on their names. Orange has target, Green is tanking, Red has no aggro."] = "Indique le statut de l'aggro des MTs selon la couleur de leurs noms. Orange s'ils ont la cible, Vert s'ils tankent, Rouge s'ils n'ont pas l'aggro.",
	["Backdrop"] = "Fond",
	["Toggle the backdrop."] = "Affiche ou non le fond.",
	["Highlight"] = "Surbrillance",
	["Toggle highlighting your target."] = "Met ou non en surbrillance votre cible.",
	["Reverse"] = "Inverser",
	["Toggle reverse order MT|MTT|MTTT or MTTT|MTT|MT."] = "Inverse ou non l'ordre d'affichage. (MT|MTT|MTTT ou MTTT|MTT|MT)",
	["Numbers"] = "Num\195\169ros",
	["Toggle showing of MT numbers."] = "Affiche ou non les num\195\169ros des MTs.",
	["Tooltips"] = "Infobulles",
	["Toggle showing of tooltips."] = "Affiche ou non les infobulles.",
	["Show"] = "Afficher",
	["Show maintank."] = "Affiche le maintank.",
	["Show target."] = "Affiche la cible.",
	["Show targettarget."] = "Affiche la cible de la cible.",
	["Define which frames you want to see."] = "D\195\169termine les cadres que vous souhaitez voir.",
	["Layout"] = "Style",
	["Set the layout for the MT frames."] = "D\195\169termine le style des cadres des MTs.",
	["Vertical"] = "Vertical",
	["Horizontal"] = "Horizontal",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

oRAOMainTank = oRA:NewModule("maintankoptional")
oRAOMainTank.defaults = {
	raidicon = true,
	alpha = 1,
	scale = 1,
	growup = false,
	inverse = false,
	deficit = false,
	clickcast = true,
	ctmaintank = "maintank",
	cttarget = "target",
	cttargettarget = "targettarget",
	nrmts = 10,
	classcolor = true,
	enemycolor = "cc2200",
	coloraggro = true,
	backdrop = true,
	highlight = true,
	reverse = false,
	numbers = true,
	tooltips = true,
	showmt = true,
	showmtt = true,
	showmttt = true,
	layout = L["Vertical"],
}
oRAOMainTank.optional = true
oRAOMainTank.name = L["Optional/MainTank"]
oRAOMainTank.consoleCmd = "mt"
oRAOMainTank.consoleOptions = {
	type = "group", name = L["MainTank"], desc = L["Options for the maintanks."],
	args = {
		nr = {
			type = "range", name = L["Nr Maintanks"], desc = L["Nr of Maintanks shown."],
			get = function() return oRAOMainTank.db.profile.nrmts end,
			set = function(v) oRAOMainTank:SetNrMaintanks(v) end,
			min = 0, max = 10, step = 1,
		},	
		frames = {
			type = "group", name = L["Frames"], desc = L["Options for the maintank frames."],
			args = {
				classcolor = {
					type = "toggle", name = L["Class color"], desc = L["Color healthbars by class."],
					get = function() return oRAOMainTank.db.profile.classcolor end,
					set = function(v) oRAOMainTank:SetClassColor(v) end,
				},
				enemycolor = {
					type = "color", name = L["Enemy color"], desc = L["Set the color for enemies. (used when classcolor is enabled)"],
					get = function()
						local _, r, g, b = paintchips:GetRGBPercent( oRAOMainTank.db.profile.enemycolor )
						return r, g, b
					end,
					set = function(r, g, b)
						local hex = format("%02x%02x%02x", r*255, g*255, b*255)
						paintchips:RegisterHex( hex )
						oRAOMainTank.db.profile.enemycolor = hex
					end,
					disabled = function() return not oRAOMainTank.db.profile.classcolor end,					
				},
				coloraggro = {
					type = "toggle", name = L["Color Aggro"], desc = L["Color aggro status for MTs on their names. Orange has target, Green is tanking, Red has no aggro."],
					get = function() return oRAOMainTank.db.profile.coloraggro end,
					set = function(v) oRAOMainTank.db.profile.coloraggro = v end,
				},
				backdrop = {
					type = "toggle", name = L["Backdrop"], desc = L["Toggle the backdrop."],
					get = function() return oRAOMainTank.db.profile.backdrop end,
					set = function(v) oRAOMainTank.db.profile.backdrop = v end,
				},
				highlight = {
					type = "toggle", name = L["Highlight"], desc = L["Toggle highlighting your target."],
					get = function() return oRAOMainTank.db.profile.highlight end,
					set = function(v) oRAOMainTank.db.profile.highlight = v end,
				},
		
				scale = {
					type = "range", name = L["Scale"], desc = L["Set frame scale."],
					get = function() return oRAOMainTank.db.profile.scale end,
					set = function(v) oRAOMainTank:SetScale(v) end,
					min = 0.1,
					max = 2,
				},				
				alpha = {
					type = "range", name = L["Alpha"], desc = L["Set frame alpha."],
					get = function() return oRAOMainTank.db.profile.alpha end,
					set = function(v) oRAOMainTank:SetAlpha(v) end,
					min = 0.1,
					max = 1,
				},
				raidicon = {
					type = "toggle", name = L["Raid icon"], desc = L["Toggle raid icons."],
					get = function() return oRAOMainTank.db.profile.raidicon end,
					set = function(v) oRAOMainTank:ToggleRaidIcon(v) end,
				},
				growup = {
					type = "toggle", name = L["Grow up"], desc = L["Toggle growup."],
					get = function() return oRAOMainTank.db.profile.growup end,
					set = function(v) oRAOMainTank:ToggleGrowup(v) end,
				},

				inverse = {
					type = "toggle", name = L["Inverse"], desc = L["Toggle inverse healthbar."],
					get = function() return oRAOMainTank.db.profile.inverse end,
					set = function(v) oRAOMainTank:ToggleInverse(v) end,
				},
				reverse = {
					type = "toggle", name = L["Reverse"], desc = L["Toggle reverse order MT|MTT|MTTT or MTTT|MTT|MT."],
					get = function() return oRAOMainTank.db.profile.reverse end,
					set = function(v) oRAOMainTank:ToggleReverse(v) end,
				},
				numbers = {
					type = "toggle", name = L["Numbers"], desc = L["Toggle showing of MT numbers."],
					get = function() return oRAOMainTank.db.profile.numbers end,
					set = function(v) oRAOMainTank:ToggleNumbers(v) end,
				},
				tooltips = {
					type = "toggle", name = L["Tooltips"], desc = L["Toggle showing of tooltips."],
					get = function() return oRAOMainTank.db.profile.tooltips end,
					set = function(v) oRAOMainTank.db.profile.tooltips = v end,
				},				
				deficit = {
					type = "toggle", name = L["Deficit"], desc = L["Toggle deficit health."],
					get = function() return oRAOMainTank.db.profile.deficit end,
					set = function(v) oRAOMainTank:ToggleDeficit(v) end,
				},
				clickcast = {
					type = "toggle", name = L["Click cast"], desc = L["Toggle clickcast support."],
					get = function() return oRAOMainTank.db.profile.clickcast end,
					set = function(v) oRAOMainTank.db.profile.clickcast = v end,
				},
				layout = {
					type = "text", name = L["Layout"], desc = L["Set the layout for the MT frames."],
					get = function() return oRAOMainTank.db.profile.layout end,
					set = function(v) oRAOMainTank:SetLayout(v) end,
					validate = {L["Vertical"], L["Horizontal"]}
				},
				clicktarget = {
					type = "group", name = L["Click target"], desc = L["Define clicktargets."],
					args = {
						maintank = {
							type = "text", name = L["Maintank"], desc = L["Define the clicktarget for maintank."],
							get = function() return oRAOMainTank.db.profile.ctmaintank end,
							set = function(v) oRAOMainTank.db.profile.ctmaintank = v end,
							validate = { L["Maintank"], L["Target"], L["Target Target"] }
						},
						target = {
							type = "text", name = L["Target"], desc = L["Define the clicktarget for target."],
							get = function() return oRAOMainTank.db.profile.cttarget end,
							set = function(v) oRAOMainTank.db.profile.cttarget = v end,
							validate = { L["Maintank"], L["Target"], L["Target Target"] }
						},
						targettarget = {
							type = "text", name = L["Target Target"], desc = L["Define the clicktarget for targettarget."],
							get = function() return oRAOMainTank.db.profile.cttargettarget end,
							set = function(v) oRAOMainTank.db.profile.cttargettarget = v end,
							validate = { L["Maintank"], L["Target"], L["Target Target"] }
						},
					},
				},
				show = {
					type = "group", name = L["Show"], desc = L["Define which frames you want to see."],
					args = {
						maintank = {
							type = "toggle", name = L["Maintank"], desc = L["Show maintank."],
							get = function() return oRAOMainTank.db.profile.showmt end,
							set = function(v)
								oRAOMainTank.db.profile.showmt = v
								oRAOMainTank:UpdateFrameShow()
							end,
						},
						target = {
							type = "toggle", name = L["Target"], desc = L["Show target."],
							get = function() return oRAOMainTank.db.profile.showmtt end,
							set = function(v)
								oRAOMainTank.db.profile.showmtt = v
								oRAOMainTank:UpdateFrameShow()
							end,
						},
						targettarget = {
							type = "toggle", name = L["Target Target"], desc = L["Show targettarget."],
							get = function() return oRAOMainTank.db.profile.showmttt end,
							set = function(v)
								oRAOMainTank.db.profile.showmttt = v
								oRAOMainTank:UpdateFrameShow()
							end,
						},
					},
				},
			},
		},	
	}	
}


------------------------------
--      Initialization      --
------------------------------

function oRAOMainTank:OnEnable()
	self.mtf = {}
	self.mttf = {}
	self.mtttf = {}

	paintchips:RegisterHex(self.db.profile.enemycolor or "cc2200" )

	self:SetupFrames()

	self:RegisterEvent("oRA_MainTankUpdate")
	self:RegisterEvent("oRA_LeftRaid")
	self:RegisterEvent("oRA_JoinedRaid", "oRA_MainTankUpdate")
	self:RegisterEvent("RosterLib_RosterChanged", function() self:oRA_MainTankUpdate() end)

	self:RegisterEvent("oRA_BarTexture")

	-- Check for Watchdog
	if (WatchDog_OnClick) then
		oRA_MainTankFramesCustomClick = WatchDog_OnClick
	end
end


function oRAOMainTank:OnDisable()
	self:UnregisterAllEvents()
end



------------------------------
--      Event Handlers      --
------------------------------

function oRAOMainTank:oRA_LeftRaid()
	self.mainframe:Hide()
end

function oRAOMainTank:oRA_MainTankUpdate( maintanktable )
	maintanktable = maintanktable or self.core.maintanktable
	if not maintanktable then return end

	local showmt, unitid


	for i = 1, self.db.profile.nrmts do
		unitid = roster:GetUnitIDFromName(maintanktable[i])

		if unitid then
			if self.db.profile.showmt then
				if not self.mtf[i] then self.mtf[i] = self:CreateUnitFrame( self.mainframe, i, "mt" ) end
				self.mtf[i].unit = unitid
			end
			if self.db.profile.showmtt then
				if not self.mttf[i] then self.mttf[i] = self:CreateUnitFrame( self.mainframe, i, "mtt" ) end
				self.mttf[i].unit = unitid
			end

			if self.db.profile.showmttt then
				if not self.mtttf[i] then self.mtttf[i] = self:CreateUnitFrame( self.mainframe, i, "mttt" ) end
				self.mtttf[i].unit = unitid
			end

			showmt = true

		else -- unit nolonger in the raid or unknown
			if self.mtf and self.mtf[i] then self.mtf[i].unit = nil end
			if self.mttf and self.mttf[i] then self.mttf[i].unit = nil end
			if self.mtttf and self.mtttf[i] then self.mtttf[i].unit = nil end
		end
	end


	if showmt and self.mainframe then
		self.mainframe:Show()
	elseif self.mainframe then
		self.mainframe:Hide()
	end
	self:TriggerEvent("oRA_UpdateConfigGUI")
end

function oRAOMainTank:oRA_BarTexture( texture )
	for _, f in pairs({ self.mtf, self.mttf, self.mtttf }) do
		for _, f in pairs(f) do
			f.bar:SetStatusBarTexture(surface:Fetch(texture))
			f.bar.texture:SetTexture(surface:Fetch(texture))
		end
	end
end


------------------------------
-- ConsoleOption Functions  --
------------------------------

function oRAOMainTank:SetScale(scale)
	self.db.profile.scale = scale

	if self.mainframe then
		self.mainframe:SetScale(scale)
	end
	self:RestorePosition()
end


function oRAOMainTank:SetAlpha(alpha)
	self.db.profile.alpha = alpha

	if self.mainframe then
		self.mainframe:SetAlpha(alpha)
	end
end

function oRAOMainTank:SetClassColor(state)
	self.db.profile.classcolor = state
	if self.mtf then
		for _, f in pairs(self.mtf) do
			self:UpdateHealthBar(f.bar, self:GetUnit(f))
		end
	end
	if self.mttf then
		for _, f in pairs(self.mttf) do
			self:UpdateHealthBar(f.bar, self:GetUnit(f))
		end
	end
	if self.mtttf then
		for _, f in pairs(self.mtttf) do
			self:UpdateHealthBar(f.bar, self:GetUnit(f))
		end
	end
end


function oRAOMainTank:UpdateFrameShow()
	for _, f in pairs({self.mtf, self.mttf, self.mtttf}) do
		if f then
			for _, f in pairs(f) do
				if f then
					self:SetStyle(f)
					if f.type == "mt" then
						if self.db.profile.showmt then f:Show() else f:Hide() end
					elseif f.type == "mtt" then
						if self.db.profile.showmtt then f:Show() else f:Hide() end
					else 
						if self.db.profile.showmttt then f:Show() else f:Hide() end
					end
				end
			end
		end
	end
	self:ToggleNumbers(self.db.profile.numbers)
end


function oRAOMainTank:ToggleRaidIcon(state)
	self.db.profile.raidicon = state

	if state then return end

	for _, f in pairs({ self.mtf, self.mttf, self.mtttf }) do
		if f then
			for _, f in pairs(f) do
				if f then f.raidicon:Hide() end
			end
		end
	end
end

function oRAOMainTank:ToggleNumbers(state)
	self.db.profile.numbers = state

	local ff = self.mtttf

	if self.db.profile.showmtt then ff = self.mttf end
	if self.db.profile.showmt then ff = self.mtf end

	if not ff then return end

	for _, f in pairs(ff) do
		if state and f.number then
			f.number:Show()
		elseif f.number then
			f.number:Hide()
		end
	end
end

function oRAOMainTank:SetLayout(state)
	self.db.profile.layout = state
	for _, f in pairs({self.mtf, self.mttf, self.mtttf}) do
		if f then
			for _, f in pairs(f) do
				if f then self:SetStyle(f) end
			end
		end
	end	
end


function oRAOMainTank:ToggleGrowup(state)
	self.db.profile.growup = state
	for _, f in pairs({self.mtf, self.mttf, self.mtttf}) do
		if f then
			for _, f in pairs(f) do
				if f then self:SetStyle(f) end
			end
		end
	end	
end

function oRAOMainTank:ToggleInverse(state)
	self.db.profile.inverse = state
end

function oRAOMainTank:ToggleReverse(state)
	self.db.profile.reverse = state
	
	for _, f in pairs({self.mtf, self.mttf, self.mtttf}) do
		if f then
			for _, f in pairs(f) do
				if f then self:SetStyle(f) end
			end
		end
	end	
end

function oRAOMainTank:ToggleDeficit(state)
	self.db.profile.deficit = state

	for _, f in pairs({self.mtf, self.mttf, self.mtttf}) do
		if f then
			for _, f in pairs(f) do
				if f then self:UpdateHealthBar(f.bar, self:GetUnit(f)) end
			end
		end
	end

end

function oRAOMainTank:SetNrMaintanks( nr )
	self.db.profile.nrmts = nr

	for i = ( nr + 1 ), 10 do
		if self.mtf and self.mtf[i] then self.mtf[i].unit = nil end
		if self.mttf and self.mttf[i] then self.mttf[i].unit = nil end
		if self.mtttf and self.mtttf[i] then self.mtttf[i].unit = nil end
	end

	-- We always show 10 MT assignment buttons anyway, since you should be able
	-- to set the MTs if you are the raid leader, but show less in your local
	-- UI - so triggering this event doesn't do anything now, but .. it's here.
	self:TriggerEvent("oRA_UpdateConfigGUI")
	self:oRA_MainTankUpdate()
end

------------------------------
--     Utility Functions    --
------------------------------

function oRAOMainTank:SavePosition()
	local f = self.mainframe
	if not f then return end

	local s = f:GetEffectiveScale()
		
	self.db.profile.posx = f:GetLeft() * s
	self.db.profile.posy = f:GetTop() * s	
end


function oRAOMainTank:RestorePosition()
	local x = self.db.profile.posx
	local y = self.db.profile.posy

	if not x or not y then return end

	local f = self.mainframe
	if not f then return end
	local s = f:GetEffectiveScale()

	f:ClearAllPoints()
	f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / s, y / s)
end


function oRAOMainTank:SetupFrames()
	local f = CreateFrame("Frame", nil, UIParent)
	f:Hide()
	f:SetMovable(true)
	f:SetScript("OnUpdate", function() self:OnUpdate() end)
	f:SetWidth(100)
	f:SetHeight(100)
	f:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	f:SetAlpha(self.db.profile.alpha)
	f:SetScale(self.db.profile.scale)

	f.update = 0

	self.mainframe = f
	self:RestorePosition()
end


function oRAOMainTank:CreateUnitFrame( parent, id, type )
	-- Main frame
	-- local f = CreateFrame("Button", "oRA_MainTankFrames_" .. type .. id, parent)
	local f = CreateFrame("Button", nil, parent)
	f:Hide()
	f:EnableMouse(true)
	f:SetMovable(true)
	f:RegisterForClicks("LeftButtonUp", "RightButtonUp", "MiddleButtonUp", "Button4Up", "Button5Up")
	f:RegisterForDrag("LeftButton")
	f:SetScript("OnEnter", function() self:OnEnter() end)
	f:SetScript("OnLeave", function() GameTooltip:Hide() end)
	f:SetScript("OnClick", function() self:OnClick() end)
	f:SetScript("OnDragStart", function() if IsAltKeyDown() then parent:StartMoving() end end)
	f:SetScript("OnDragStop", function() parent:StopMovingOrSizing() self:SavePosition() end)

	-- Tank Statusbar
	f.bar = CreateFrame("StatusBar", nil, f)
	f.bar:SetMinMaxValues(0,100)

	-- Tank Statusbar background texture, visible when the bar depleats
	f.bar.texture = f.bar:CreateTexture(nil, "BORDER")
	f.bar.texture:SetVertexColor(1, 0, 0, 0.5)

	-- Tank Statusbar text
	f.bar.text = f.bar:CreateFontString(nil, "OVERLAY")
	f.bar.text:SetFontObject(GameFontHighlightSmall)
	f.bar.text:SetJustifyH("RIGHT")

	-- Tank Number
	f.number = f.bar:CreateFontString(nil, "OVERLAY")
	f.number:SetFontObject(GameFontHighlightSmall)
	f.number:SetJustifyH("RIGHT")

	-- Tank Name
	f.name = f.bar:CreateFontString(nil, "OVERLAY")
	f.name:SetFontObject(GameFontHighlightSmall)
	f.name:SetJustifyH("LEFT")

	-- Raid Icons
	f.raidicon = f.bar:CreateTexture(nil, "OVERLAY")
	f.raidicon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
	f.raidicon:Hide()

	-- Set static stuff and style
	f.number:SetText(id..".")
	f.type = type
	f:SetID(id)

	self:SetStyle(f)

	return f
end

function oRAOMainTank:GetPosition( f )
	local relframe, relx, rely
	
	if self.db.profile.layout == L["Horizontal"] then -- HORIZONTAL POSITIONING
		-- default positioning
		relframe = self.mainframe
		relx = 136 * (f:GetID() - 1)
		if self.db.profile.reverse then relx = relx * -1 end
		rely = 0
		
		if f.type == "mtt" and self.db.profile.showmt then
			relframe = self.mtf[f:GetID()]
			relx = 0
			rely = -21
			if self.db.profile.growup then rely = 21 end
		end
		
		-- same deal for mttt adjust if mtt or mt is shown
		if f.type == "mttt" then
			if self.db.profile.showmtt then
				relframe = self.mttf[f:GetID()]
				relx = 0
				rely = -21
				if self.db.profile.growup then rely = 21 end
			elseif self.db.profile.showmt then
				relframe = self.mtf[f:GetID()]
				relx = 0
				rely = -21
				if self.db.profile.growup then rely = 21 end
			end
		end
					
	else -- VERTICAL POSITIONING
		-- default positioning
		relframe = self.mainframe
		relx = 0
		if self.db.profile.growup then
			rely = 21 * (f:GetID() - 1)
		else 
			rely = -21 * (f:GetID() - 1)
		end	
		
	  -- adjust positioning for mtt if mt is shown
		if f.type == "mtt" and self.db.profile.showmt then
			relframe = self.mtf[f:GetID()]
			relx = 120
			if self.db.profile.reverse then relx = -120 end
			rely = 0
		end
	
		-- same deal for mttt adjust if mtt or mt is shown
		if f.type == "mttt" then
			if self.db.profile.showmtt then
				relframe = self.mttf[f:GetID()]
				relx = 120
				if self.db.profile.reverse then relx = -120 end
				rely = 0
			elseif self.db.profile.showmt then
				relframe = self.mtf[f:GetID()]
				relx = 120
				if self.db.profile.reverse then relx = -120 end
				rely = 0			
			end
		end	
	end
	return relframe, relx, rely
end


function oRAOMainTank:SetStyle(f)
	local relframe, relx, rely = self:GetPosition(f)
	
	self:SetWHP(f, 120, 21, "TOPLEFT", relframe, "TOPLEFT", relx , rely)

	f:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16})

	if self.db.profile.backdrop then
		f:SetBackdropColor(0, 0, 0, .5)
	else 
		f:SetBackdropColor(0, 0, 0, 0)
	end
	
	f.bar:SetStatusBarTexture(surface:Fetch(self.core.db.profile.bartexture))
	f.bar.texture:SetTexture(surface:Fetch(self.core.db.profile.bartexture))
	f.bar.texture:SetVertexColor(.5, .5, .5, .5)
	
	self:SetWHP(f.bar, 112, 16, "LEFT", f, "LEFT", 4, 0)
	self:SetWHP(f.bar.texture, 112, 16, "CENTER", f.bar, "CENTER", 0, 0)
	if self.db.profile.reverse then
		f.number:SetJustifyH("LEFT")
	else
		f.number:SetJustifyH("RIGHT")
	end
	
	self:SetWHP(f.number, 32, 14, self.db.profile.reverse and "LEFT" or "RIGHT", f, self.db.profile.reverse and "RIGHT" or "LEFT", 0, 0)

	if not self.db.profile.numbers then
		f.number:Hide()
	else
		if f.type == "mt" and self.db.profile.showmt then
			f.number:Show()
		elseif f.type == "mtt" and not self.db.profile.showmt and self.db.profile.showmtt then
			f.number:Show()
		elseif f.type == "mttt" and not self.db.profile.showmt and not self.db.profile.showmtt and self.db.profile.showmttt then
			f.number:Show()
		else
			f.number:Hide()
		end
	end

	self:SetWHP(f.raidicon, 14, 14, "LEFT", f.bar, "LEFT", 1, 0)		
	self:SetWHP(f.name, 62, 14, "LEFT", f.bar, "LEFT", 18, 0)
	self:SetWHP(f.bar.text, 32, 14, "RIGHT", f.bar, "RIGHT", 0, 0)

end


function oRAOMainTank:SetWHP(f, width, height, p1, relative, p2, x, y)
	if not f then return end

	f:SetWidth(width)
	f:SetHeight(height)

	if p1 then
		f:ClearAllPoints()
		f:SetPoint(p1, relative, p2, x, y)
	end
end


function oRAOMainTank:GetUnit(f, click)
	if not f or not f.type then return end

	if not click then
		if f.type == "mt" then return f.unit end
		if f.type == "mtt" then return f.unit .. "target" end
		if f.type == "mttt" then return f.unit .. "targettarget" end
	else
		local c
		if f.type == "mt" then c = self.db.profile.ctmaintank end
		if f.type == "mtt" then c = self.db.profile.cttarget end
		if f.type == "mttt" then c = self.db.profile.cttargettarget end
		if c == L["Maintank"] then return f.unit end
		if c == L["Target"] then return f.unit .. "target" end
		if c == L["TargetTarget"] then return f.unit .. "targettarget" end
	end
end


function oRAOMainTank:UpdateFrames(f)
	for _, f in pairs(f) do
		if f.unit then
			local unit = self:GetUnit(f)

			if UnitExists(unit) then
				f.name:SetText(UnitName(unit))

				self:UpdateHealthBar(f.bar, unit)

				if self.db.profile.raidicon then
					self:UpdateRaidIcon(f, unit)
				end

				if f.type == "mt" and self.db.profile.coloraggro then
					if UnitExists( unit .. "target" ) then
						f.name:SetTextColor( 1, 0.5, 0.25, 1 )
						if UnitExists( unit .. "targettarget") then
							if UnitIsUnit(unit, unit .. "targettarget") then
								f.name:SetTextColor(0.5, 1, 0.5, 1)
							else
								f.name:SetTextColor(1, 0, 0, 1)
							end
						end
					else
						f.name:SetTextColor( 1, 1, 1, 1)
					end
				else 
					if UnitIsEnemy(unit, "player") then f.name:SetTextColor( 1, 0, 0, 1)
					else f.name:SetTextColor( 1, 1, 1, 1) end
				end
				
				if UnitIsUnit( unit, "target") and self.db.profile.highlight then
					f:SetBackdropColor(1, .84, 0, 1 )
				elseif self.db.profile.backdrop then
					f:SetBackdropColor(0, 0, 0, .5)
				else
					f:SetBackdropColor(0, 0, 0, 0)
				end
				
				f:Show()
			else
				f:Hide()
			end

		else
			f:Hide()
		end
	end
end


function oRAOMainTank:UpdateHealthBar(bar, unit)
	local cur, max = UnitHealth(unit) or 0, UnitHealthMax(unit) or 0
	local perc = cur / max

	bar:SetMinMaxValues(0, max)
	
	if self.db.profile.inverse then
		bar:SetValue(max - cur)
	else
		bar:SetValue(cur)
	end

	if self.db.profile.classcolor then
		if not UnitIsEnemy(unit, "player") then 
			local _, class = UnitClass( unit )
			local _, r,g,b = paintchips:GetRGBPercent( class )
			bar:SetStatusBarColor(r,g,b)
		else
			local _, r,g,b = paintchips:GetRGBPercent( self.db.profile.enemycolor )
			bar:SetStatusBarColor(r,g,b)
		end
	else
		bar:SetStatusBarColor(self:GetHealthBarColor(perc))
	end
	
	if self.db.profile.deficit then
		local val = max - cur
		if val > 1000 then
			val = ceil(val/100)/10 .. "k"
		elseif val == 0 then
			val = ""
		end
		
		bar.text:SetText(val)
	else
		bar.text:SetText(ceil(perc * 100) .. "%")
	end

	bar:Show()
end


function oRAOMainTank:GetHealthBarColor(perc)
	local r, g

	if perc > 0.5 then
		r = (1.0 - perc) * 2
		g = 1.0
	else
		r = 1.0
		g = perc * 2
	end

	return r, g, 0
end


function oRAOMainTank:UpdateRaidIcon(f, unit)
	local icon = GetRaidTargetIndex(unit)

	if icon then
		SetRaidTargetIconTexture(f.raidicon, icon)
		f.raidicon:Show()
	else
		f.raidicon:Hide()
	end
end

-------------------------------
--    Key Binding Handlers   --
-------------------------------

function oRAOMainTank:BindingAssist( nr )
	if self.mtf and self.mtf[nr] and self.mtf[nr].unit then
		local unit = self:GetUnit( self.mtf[nr] )
		if unit and UnitExists( unit .."target") then
			AssistUnit(unit)
		end
	end
end

function oRAOMainTank:BindingTarget( nr )
	if self.mtf and self.mtf[nr] and self.mtf[nr].unit then
		local unit = self:GetUnit( self.mtf[nr] )
		if unit then 
			TargetUnit(unit)
		end
	end
end


-------------------------------
--   Frame Script Functions  --
-------------------------------

function oRAOMainTank:OnUpdate()
	this.update = this.update + arg1

	if this.update >= 0.3 then
		if self.db.profile.showmt then self:UpdateFrames(self.mtf) end
		if self.db.profile.showmtt then self:UpdateFrames(self.mttf) end
		if self.db.profile.showmttt then self:UpdateFrames(self.mtttf) end

		this.update = 0
	end
end


function oRAOMainTank:OnEnter()
	if not self.db.profile.tooltips then return end
	local unit = self:GetUnit(this)

	GameTooltip_SetDefaultAnchor(GameTooltip, this)

	if unit and GameTooltip:SetUnit(unit) then
		this.updateTooltip = TOOLTIP_UPDATE_TIME
	else
		this.updateTooltip = nil
	end
end


function oRAOMainTank:OnClick()
	local unit = self:GetUnit(this,true)
	if self.db.profile.clickcast and oRA_MainTankFramesCustomClick then
		oRA_MainTankFramesCustomClick(arg1, unit)
	elseif UnitExists(unit) then
		TargetUnit(unit)
	end
	-- this following piece of code is specifically for attack on assist.
--	if unit == this.unit .. "target" and UnitExists( this.unit ) then
--			AssistUnit("player")
--	end

end