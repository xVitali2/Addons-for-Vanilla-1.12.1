-- Last Update 25/03/18
if ( GetLocale() == "ruRU" ) then
BINDING_NAME_BGASSIST_TOGGLE = "Открыть окно BGAssist";
BGAssist_Alterac_Quests = {
	["Припасы Железного рудника"] 		= true,
	["Припасы Ледяного Зуба"] 			= true,
	["Всевидящее око мастера Рисона"] 	= true,
	["Пустые стойла"] 					= true,	-- Wolf/Ram turnin
	-- Horde
	["Больше добычи!"] 					= { item = 17422, min=20 },
	["Локолар Владыка Льда"] 			= { item = 17306, max=4 },
	["Галлон крови"] 					= { item = 17306, min=5 },
	["Упряжь из бараньей кожи"] 		= { item = 17642 },
	["Защита Черного Копья"] 			= { item = 18142 },
	["Хоть шерсти клок..."] 			= { item = 18143 },
	["Разыскивается: БОЛЬШЕ ДВОРФОВ!"] 	= { item = 18206 },
	["Костяная лихорадка"]				= { item = 18144 },
	["Небо зовет – флот Смуггла"]		= { item = 17326 },
	["Небо зовет – флот Мааши"]			= { item = 17327 },
	["Небо зовет – флот Маэстра"]		= { item = 17328 },
	-- Alliance
	["Больше обломков брони"] 			= { item = 17422, min=20 },
	["Ивус Лесной Властелин"] 			= { item = 17423, max=4 },
	["Гроздь кристаллов"] 				= { item = 17423, min=5 },
	["Упряжь ездовых баранов"] 			= { item = 17643 },
	["Какое такое копыто?"] 			= { item = 18145 },
	["Амулеты для Оленьего Шлема"] 		= { item = 18146 },
	["Разыскивается: БОЛЬШЕ ОРКОВ!"]	= { item = 18207 },
	["Любовь к ближнему"] 				= { item = 18147 },
	["Небо зовет – флот Слидора"]		= { item = 17502 },
	["Небо зовет – флот Змейера"]		= { item = 17503 },
	["Небо зовет – флот Ромеона"]		= { item = 17504 },
};
BGAssist_FlagRegexp = {
	["RESET"] = {	["regexp"] = "The flags are now placed at their bases." },
	["PICKED"] = {	["one"] = "FACTION", ["two"] = "PLAYER",
			["regexp"] = "The ([^ ]*) [fF]lag was picked up by ([^!]*)!" },
	["DROPPED"] = {	["one"] = "FACTION", ["two"] = "PLAYER",
			["regexp"] = "The ([^ ]*) [fF]lag was dropped by ([^!]*)!" },
	["RETURNED"] ={	["one"] = "FACTION", ["two"] = "PLAYER",
			["regexp"] = "The ([^ ]*) [fF]lag was returned to its base by ([^!]*)!" },
	["CAPTURED"] ={	["one"] = "PLAYER", ["two"] = "FACTION",
			["regexp"] = "([^ ]*) captured the ([^ ]*) flag!" },
};
ALTERACVALLEY 						= "Альтеракская долина";
WARSONGGULCH 						= "Ущелье Песни Войны";
ARATHIBASIN 						= "Низина Арати";

DISPLAY_MENU_LOCKWINDOW				= "Заблокировать окно";
DISPLAY_MENU_MINIMAPBUTTON			= "Показывать кнопку на миникарте"
DISPLAY_MENU_RANKWINDOW				= "Отображать окно подсчета рангов"
DISPLAY_MENU_CLASSWINDOWS			= "Отображать окна подсчета классов"
DISPLAY_MENU_AUTOSHOW				= "Отображать окно таймеров";
DISPLAY_MENU_AUTORELEASE			= "Автовоскрешение";
DISPLAY_MENU_AUTOQUEST				= "Автоподтверждение заданий";
DISPLAY_MENU_AUTOENTER				= "Автовход на ПБ";
DISPLAY_MENU_AUTOSIGNUP				= "Авторегистрация на ПБ";
DISPLAY_MENU_TIMERSHOW				= "Отображать таймеры захвата";
DISPLAY_MENU_ITEMSHOW				= "Отображать количество предметов на ПБ";
DISPLAY_MENU_GYCOUNTDOWN			= "Отображать таймер для воскрешения";
DISPLAY_MENU_FLAGTRACKING			= "Отслеживать флаги";
DISPLAY_MENU_TARGETTINGASSISTANCE	= "Отображать окно цели";
DISPLAY_MENU_AUTOACCEPTGROUP 		= "Потверждение группы на ПБ";
DISPLAY_MENU_AUTOLEAVEGROUP 		= "Покидать группу после завершения ПБ"
DISPLAY_MENU_NOPREEXISTING 			= "Не регистрироваться на существующие ПБ"
DISPLAY_MENU_SHOWCAPTUREDFLAGS 		= "Отображать захваченные флаги"
DISPLAY_TEXT_GRAVEYARD 				= "Кладбище"
DISPLAY_CURRENTCOUNT				= "\nТекущее количество: "
DISPLAY_UNKNOWN						= "(Неизвестен)"
DISPLAY_MINIMAPTOOLTIP				= "Нажмите левую клавишу мыши, чтобы открыть меню"
DISPLAY_MINIMAPTOOLTIP2				= "Нажмите правую клавишу мыши для перемещения значка"
DISPLAY_TITLEDISPLAY_CAPTURE		= "Захвачены"
DISPLAY_TITLEDISPLAY_ITEMS			= "Предметы"
DISPLAY_TITLEDISPLAY_TARGETS		= "Цели"
DISPLAY_RANKSCOUNT 					= "Нажмите, чтобы отправить посчитаные ранги в чат ПБ."
DISPLAY_TEXT_PREEXISTING 			= "Предлагаемый экземпляр ПБ уже существует"
DISPLAY_TEXT_ENTERINGBATTLEGROUNDS 	= "Зашел"
DISPLAY_TEXT_LEFTBATTLEGROUNDS		= "Вышел"
DISPLAY_TEXT_TIMEUNTILREZ			= "Времени до Воскрешения"
DISPLAY_TEXT_TIMELEFT				= "Осталось"
DISPLAY_TEXT_SECONDS				= "секунд"
DISPLAY_TEXT_MINUTES				= "минут"
DISPLAY_TEXT_NOTENTERINGAFK 		= "Не входит на ПБ т.к. ты афк";
DISPLAY_TEXT_FLAGHOLDERNOTCLOSEENOUGH	= "Держатель флага недостаточно близок к цели.";
BATTLEGROUND_GOSSIP_TEXT			= "Я хочу в бой.";
MATCHING_MARKED_AFK 				= "Вы отошли от компьютера, оставив сообщение: \"Отсутствует\".";
MATCHING_CLEARED_AFK 				= "Вы вернулись.";
FACTION_ALLIANCE 					= "Alliance";
FACTION_HORDE 						= "Horde";
CLASS_WARRIOR 						= "Воин";
CLASS_MAGE 							= "Маг";
CLASS_ROGUE 						= "Разбойник";
CLASS_DRUID 						= "Друид";
CLASS_HUNTER 						= "Охотник";
CLASS_SHAMAN 						= "Шаман";
CLASS_PRIEST 						= "Жрец";
CLASS_WARLOCK 						= "Чернокнижник";
CLASS_PALADIN 						= "Паладин";
end