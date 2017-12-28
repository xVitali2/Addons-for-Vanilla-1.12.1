if ( GetLocale() == "ruRU" ) then
-- RUSSIAN VERSION by CFM
-- DEFAULT_CHAT_FRAME:AddMessage("ruRU")
	BINDING_NAME_WIMSHOWNEW = "Показать новые сообщения";
	BINDING_NAME_WIMHISTORY = "Просмотр истории";
	BINDING_NAME_WIMENABLE = "Включить/выключить";
	BINDING_NAME_WIMTOGGLE = "Переключить сообщения";
	BINDING_NAME_WIMSHOWALL = "Показывать все сообщения";
	BINDING_NAME_WIMHIDEALL = "Скрыть все сообщения";
	
	-- Class Names
	WIM_LOCALIZED_DRUID = "Друид";
	WIM_LOCALIZED_HUNTER = "Охотник";
	WIM_LOCALIZED_MAGE = "Маг";
	WIM_LOCALIZED_PALADIN = "Паладин";
	WIM_LOCALIZED_PRIEST = "Жрец";
	WIM_LOCALIZED_ROGUE = "Разбойник";
	WIM_LOCALIZED_SHAMAN = "Шаман";
	WIM_LOCALIZED_WARLOCK = "Чернокнижник";
	WIM_LOCALIZED_WARRIOR = "Воин";
--	CFM
	--icons.xml
WIM_L_CONVERSATIONS="Переговоры";
WIM_L_CONVERSATIONSMENU="Меню переговоров";
WIM_L_SHOWNEWMESSAGES="Показать новые сообщения";
WIM_L_WIMOPTIONS="Настройки WIM";
WIM_L_RIGHTCLICK="Правая кнопка";
WIM_L_LEFTCLICK="Левая кнопка";
	--options.xml
WIM_L_ENABLEWIM="Включить WIM";
WIM_L_DISPLAYOPT="Показать настройки";
WIM_L_INCOMWHISP="Шёпот Вам";
WIM_L_OUTGOMWHISP="Шёпот от Вас";
WIM_L_SYSMESS="Системные сообщения";
WIM_L_ERRORMESS="Сообщения ошибок";
WIM_L_WEBADDRESSLINK="Ссылка";
WIM_L_SHOWSHORTCUTBAR="Панель быстрого\nдоступа.";
WIM_L_THISSETLIMIT="Эта настройка ограничивает \nминимальную высоту окон.";
WIM_L_SHOWTIMESTAMPS="Метки времени.";
WIM_L_SHOWCHARINFO="Инф. о персонажах:";
WIM_L_CHANGESWILLBEMADE="Изменения будут внесены \nс новыми окнами сообщений только.\n|cffffffff(Требуется фоновый запрос /who.)|r";
WIM_L_CLASSICONS="Значки классов";
WIM_L_CHANGESWILLBEMADENEWMESS="Изменения будут внесены \nтолько с новыми окнами сообщений.";
WIM_L_CLASSCOLORS="Цвета классов";
WIM_L_CHARDETAILS="Детали персонажа";
WIM_L_MINIMAPICON="Значок на миникарте";
WIM_L_SHOWMINIMAPICON="Показать значок на миникарте";
WIM_L_FREEMOVING="Свободное \nперемещение";
WIM_L_FREEMOVINGTOOLTIP="Когда включено, Shift-Left-нажатие \nпо значку на миникарте, позволяет Вам \nдвигать его по всему окну.";
WIM_L_WINDOWS=" Окна ";
WIM_L_GENERAL=" Основные ";
WIM_L_FILTERS=" Фильтры ";
WIM_L_HISTORY=" История ";
WIM_L_HISTORYAUTOFOCUS="Авто. фокусировка на всплывающее окно.";
WIM_L_HISTORYFOCUSSENDMESS="Держать фокус после отправки сообщения.";
WIM_L_HISTORYFOCUSONLYCITY="Только пока в крупном городе.";
WIM_L_SHOWTOOLTIPS="Показывать всплывающие подсказки.";
WIM_L_POPUPWINDOWWHENSENDINGWHISP="Всплывающее окно при отправке шёпота.";
WIM_L_POPUPWINDOWWHENRECEIVINGNEWWHISP="Всплывающее окно при получении нового шёпота.";
WIM_L_POPUPWINDOWWHENRECEIVINGREPLIES="Всплывающее окно при получении ответа.";
WIM_L_DISABLEPOPUPSINCOMBAT="Отключить всплывающие окна во время боя.";
WIM_L_SUPRESSWHISPFROMDEFCHAT="Подавлять шепоты из стандартного окна чата.";
WIM_L_PLAYSOUND="Играть звуки когда сообщение пришло.";
WIM_L_SORTCONV="Сортировать список переговоров по алфавиту.";
WIM_L_AFKANDDNDMESS="Показать AFK и DND сообщения.";
WIM_L_ESCTOCLOSEWINDOWS="Использовать кнопку 'ESC' для закрытия окон.";
WIM_L_ESCTOCLOSEWINDOWSTOOLTIP="Using the 'Escape Key' has its limitations. |cffffffffExample: Windows will close when opening map.|r";
WIM_L_INTERCEPTWHISPCOM="Перехватывать команду шёпота.";
WIM_L_INTERCEPTWHISPCOMTOOLTIP="WIM будет перехватывать команду шёпота и автоматически открывать новое окно.. (Например: /ш или /w).";
WIM_L_CASCADINGDIR="Включить каскадирование. \nНаправление:";
WIM_L_SETLOC="Уст. местоположение";
WIM_L_ALIASING="Включить прозвище";
WIM_L_SHOWASCOMMENT="Показать как комментарий";
WIM_L_BUTNAME="Имя";
WIM_L_BUTALIAS="Прозвище";
WIM_L_ADD="Добавить";
WIM_L_ADDNEWALIAS="Добавить новое прозвище";
WIM_L_REMOVE="Удалить";
WIM_L_EDIT="Редактировать";
WIM_L_EDITALIAS="Ред. прозвище";
WIM_L_ENABLEFILTER="Включить фильтры";
WIM_L_KEYWORDSANDPHRASES="ключевые слова/фразы";
WIM_L_ACTION="Действие";
WIM_L_ADDNEWFILTER="Добавить новый фильтр";
WIM_L_EDITFILTER="Редактировать фильтр";
WIM_L_ENABLEHISTORY="Включить историю";
WIM_L_RECEVERYONE="Запись всех";
WIM_L_RECFRIENDS="Запись друзей";
WIM_L_RECGUILD="Запись гильдии";
WIM_L_INCOMMESS="Входящие сообщения";
WIM_L_OUTGOMMESS="Исходящие сообщения";
WIM_L_SHOWHISTORYINMESS="История в сообщении:";
WIM_L_SETMAXMESSPERUSER="Максимум сообщений на\nпользователя:";
WIM_L_DELMESSOLDERTHAN="Удалить сообщения старше чем:";
WIM_L_RECORDEDUSERS="Записанные пользователи";
WIM_L_SAVEDMESS="Сохр. сообщения";
WIM_L_DELUSER="Удалить\nпользователя";
WIM_L_VIEWHISTORY="Просмотр истории";
WIM_L_CHARNAME="Имя персонажа";
WIM_L_CHARALIAS="Прозвище персонажа";
WIM_L_CANCEL="Отмена";
WIM_L_OK="Ок";
WIM_L_PERFORMFOLLACT="Выполните следующие действия:";
WIM_L_ERREXAMPLEERRMESS="Ошибка: Пример сообщения об ошибке";
WIM_L_KEYWORDSANDPHRASETOFILTER="Ключевое слово/фраза для фильтра";
WIM_L_IGNORE="Игнорировать";
WIM_L_BLOCK="Блокировать";
WIM_L_PAZZA="Сумасшедший";
WIM_L_NONEWMESS="Нет новых сообщений.";
WIM_L_RECENTCONV="Недавние переговоры 1 или 20";
WIM_L_WIMDOC="WIM документация";
WIM_L_DESCRIPTION=" Описание ";
WIM_L_VERSIONHISTORY=" История версий ";
WIM_L_DIDYOUKNOW=" А Вы знаете? ";
WIM_L_CREDITS=" Признательность ";
WIM_L_BLOCKLEVEL="Блокировать шёпот от игроков ниже 10 уровня.";
WIM_L_BLOCKLVL="WIM не будет отображать шёпот от игрока ниже 10 уровня, исключение если вы друзья, члены гильдии или игрок прошептал себе на той же сессии.";
--options.lua
WIM_L_ICONPOSIT="Расположение значка";
WIM_L_FONTSIZE="Размер шрифта";
WIM_L_WINDOWSIZEPERC="Размер окна (проценты)";
WIM_L_TRANSPARENCYPERC="Прозрачность (проценты)";
WIM_L_WINDOWWIDTH="Ширина окна";
WIM_L_WINDOWHEIGHT="Высота окна";
WIM_L_UP="Вверх";
WIM_L_DOWN="Вниз";
WIM_L_LEFT="Влево";
WIM_L_RIGHT="Вправо";
WIM_L_UPANDLEFT="Вверх & Влево";
WIM_L_UPANDRIGHT="Вверх & Вправо";
WIM_L_DOWNANDLEFT="Вниз & Влево";
WIM_L_DOWNANDRIGHT="Вниз & Вправо";
WIM_L_DRAGTOSETDEFSPAWN="Двигать, чтобы установить\nместо появления окон.";
WIM_L_DAY="День";
WIM_L_WEEK="Неделя";
WIM_L_MONTH="Месяц";
WIM_L_ERRINVALIDKEYWORD="Ошибка: неверное ключевое слово/фраза!";
WIM_L_ERRKEYWORDALREADYUSED="Ошибка: ключевое слово/фраза уже используется!";
WIM_L_ERRNAMEALREADYUSED="Ошибка: имя уже оспользуется!";
WIM_L_ERRINVALIAS="Ошибка: неверное прозвище!";
WIM_L_ERRINVNAME="Ошибка: неверное имя!";
WIM_L_WINDOWHEIGHTLIM="Высота окна |cffffffff(Ограничена панелью быстрого доступа)|r";
--history.lua
WIM_L_NONESHOWALL="Нет (Показывать все)";
--history.xml
WIM_L_HISTORYVIEWER="WIM просмотр истории";
WIM_L_USERS="Пользователи";
WIM_L_FILTERS2="Фильтры";
WIM_L_MESS="Сообщения";
--urlcopy.xml
WIM_L_URLCOPY="Скопировать URL";
--wim.lua
WIM_L_NONE=" - Нет -";
WIM_L_NONEC="|cffffffff - Нет -";
WIM_L_INSPECT="Осмотреть";
WIM_L_TRADE="Обмен";
WIM_L_INVITE="Пригласить";
WIM_L_TARGET="Выбрать целью";
--wim.xml
WIM_L_XTOOLTIP="Shift &amp; Left-нажатие чтобы завершить беседу.";
WIM_L_HISTORYTOOLTIP="Нажать для просмотра истории сообщений.";
WIM_L_RUSUREYOUWANTIGNORE="Вы хотите \nигнорировать этого игрока?";
--//CFM

WIM_DESCRIPTION = [[
WIM (WoW Instant Messenger)
|cffffffff
WIM именно так он называется; интерфейс для шепотов в игре. Он был специально разработан, чтобы не мешать вам (когда в рейде) но и имеет удобные окна чата для каждого пользователя, с которыми вы общаетесь. 

Не забудьте проверить ваш экран назначения клавиш и найти там что-либо полезное.
|r
Полезные команды:
/wim			|cffffffff- Окно настроек|r
/wim history	|cffffffff- Просмотр истории|r
/wim help		|cffffffff- (это окно)|r

Дополнительные команды:
/wim reset			|cffffffff- Сбросить все настройки.|r
/wim reset filters	|cffffffff- Сбросить все в разделе фильтры.|r
/wim clear history	|cffffffff- Очистить историю.|r

WIM интегрируется в следующие аддоны:|cffffffff
TitanPanel
]]

WIM_DIDYOUKNOW = [[
А Вы знаете...|cffffffff написав команду |r/wim |cffffffffВы откроете настройки интерфейса WIM где Вы можете изменить внешний вид и возможности WIM?|r

А Вы знаете...|cffffffff WIM вышел с плагином для Titan Panel? Посмотрите в  меню плагинов Titan'а!|r

А Вы знаете...|cffffffff если Вы нажмете "Назначение клавиш" в "Настройки", Вы можете назначить несколько полезных клавиш для WIM?|r

А Вы знаете...|cffffffff Вы можете сделать значок на миникарте свободно перемещаемый? В этом режиме, Вы можете нажать Shift-LeftClick на значке на миникарте чтобы передвинуть его куда угодно.|r

А Вы знаете...|cffffffff при нажатии клавиши Tab в сообщении, вы можете переключаться между другими сообщениями также?|r

А Вы знаете...|cffffffff у меня ужасная орфография? Пожалуйста, не стесняйтесь, сообщите мне о неточностях!|r

А Вы знаете...|cffffffff WIM имеет много настроек, есть полоса прокрутки во вкладке общие настройки? Проверьте их. Там могут быть некоторые возможности, о которых вы не знали!|r
]]

WIM_CREDITS = [[
WIM (WoW Instant Messenger) от Pazza <Bronzebeard>. 
|cffffffffОбщие представления и идеи Sloans <Bronzebeard>.|r

Я хочу сказать спасибо всем тем, кто тестировал WIM, а также высказывал свои замечания и предложения, включая:
|cffffffff
- Nachonut <Bronzebeard>
- Sloans <Bronzebeard>
- Everyone in Resurgence <Bronzebeard>
|r

Я хочу также сказать спасибо тем, кто с нами сотрудничал на ui.WorldOfWar.net и на Curse-Gaming.com.
]]
end