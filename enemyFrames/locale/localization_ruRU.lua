if GetLocale() ~= 'ruRU' then return end

local L = enemyFrames.L
-- Russian localization by Lichery

-- bindings
BINDING_HEADER_EFKHEADER = 'Enemy Frames'
BINDING_NAME_SETKT = 'Назначить Череп цели'
BINDING_NAME_GETKT = 'Цель Череп'
BINDING_NAME_SETSTAR = 'Назначить Звезду цели'
BINDING_NAME_SETMOON = 'Назначить Луну цели'
BINDING_NAME_SETSQUARE = 'Назначить Квадрат цели'
BINDING_NAME_SETDIAMOND = 'Назначить Ромб цели'
BINDING_NAME_SETCROSS = 'Назначить Крест цели'
BINDING_NAME_SETCIRCLE = 'Назначить Круг цели'
BINDING_NAME_SETTRIANGLE = 'Назначить Треугольник цели'

L['[enemyFrames] v%s loaded. |cffffffff/efs|cff%s for menu settings.'] = '[enemyFrames] вер.%s загружен. Введите |cffffffff/efs|cff%s для настроек.'
L['Warsong Gulch'] = 'Ущелье Песни Войны'
L['Arathi Basin'] = 'Низина Арати'
L['Alterac Valley'] = 'Альтеракская долина'
L['toggle EFC low health announcement'] = 'Вкл./Откл. объявление о низком здоровье держателя флага (противника)'
L['settings menu'] = 'Настройки'
L['S'] = 'Н'
L['enemyFrames Settings'] = 'Настройки enemyFrames'
L['Horde'] = 'Орда'
L['Alliance'] = 'Альянс'
L['H'] = 'О'
L['A'] = 'А'
L['Player'] = 'Игрок'
L['lock'] = 'Заблокировани'
L['unlock'] = 'Разблокировано'
L['drag-me'] = 'перетащите меня'
L['Click to target'] = 'Нажмите для нацеливания'
L['Get ready to cap!'] = 'Приготовьтесь к захвату!'
L['EFC has less than %d%% Health!'] = 'Держатель флага (противник) имеет меньше %d%% здоровья!'
L['[enemyFrames] New version detected.'] = '[enemyFrames] Обнаружена новая версия.'
L['!ver %s available!'] = '!доступна вер. %s !'
L['Seal of'] = 'Печать'
L['Judgement of'] = 'Правосудие'
L['Vanish'] = 'Исчезновение'

-- features tab
L['features'] = 'Функции'
L['Enable outside of BattleGrounds'] = 'Включить вне Полей боя'
L['Mouseover cast on frames'] = 'Произнесение в курсор мыши на фреймах'
L['Moveable Target Cast Bar'] = 'Подвижная панель произнесения цели'
L['Integrated Target Cast Bar'] = 'Интегрированная панель произнесения цели'
L['Prio debuff on Target Portrait'] = 'Приоритет дебаффов на портрете цели'
L['Prio debuff on Player Portrait'] = 'Приоритет дебаффов на портрете игрока'
L['Debuff timers on target'] = 'Таймеры дебаффов на цели'
L['battlegrounds'] = 'Поля боя'
L['Incoming Spells (BGs only)'] = 'Входящие заклинания (только Поля боя)'
L['Class colored map blips'] = 'Цвета классов на карте'
L['Low Health EFC announcement'] = 'Объявление о низком здоровье\nдержателя флага (противника)'
-- general tab
L['general'] = 'Общее'
L['Show enemyFrames'] = 'Показать enemyFrames'
L['scale'] = 'Масштаб'
L['layout'] = 'Макет'
-- nameplates tab
L['nameplates'] = 'Полосы здоровья'
L['Class color on enemy nameplates'] = 'Цвет класса'
L['Enable nameplate cast bar'] = 'Включить полосу применения'
L['Show Raid Marks'] = 'Показать метки рейда'
L['Enable nameplate debuffs'] = 'Включить дебаффы'
-- optionals tab
L['optionals'] = 'Доп-но'
L['optional'] = 'Дополнительно'
L['Display names'] = 'Показать имена'
L['Display Health %'] = 'Показать % здоровья'
L['Display mana bar'] = 'Показать панель маны'
L['Display cast timers'] = 'Показать таймеры произнесения'
L['Display nearby units only'] = 'Показать только близлежащие единицы'
L['Display Target Counter'] = 'Показать счетчик цели'


L['(.+) attempts to run away in fear!'] = '(.+) в панике пытается бежать!'
-- wsgHandler.lua
L['The %s [Ff]lag was picked up by %s!'] = '%2$s подобрал.- флаг %1$s!'
L['The %s [Ff]lag was dropped by %s!'] = '%2$s потерял.- флаг %1$s!'
L['%s captured the %s [Ff]lag!'] = '%s захватил.- флаг %s!'

-- HitsCrits func
L['%s\'s %s hits %s for %d'] = '\"%2$s\" %1$s наносит %3$s %4$d.' -- include (SPELLLOGOTHEROTHER, SPELLLOGOTHERSELF, SPELLLOGSCHOOLOTHEROTHER, SPELLLOGSCHOOLOTHERSELF)
L['%s\'s %s crits %s for %d'] = '\"%2$s\" %1$s наносит %3$s %4$d.' -- include (SPELLLOGCRITOTHEROTHER, SPELLLOGCRITOTHERSELF, SPELLLOGCRITSCHOOLOTHEROTHER, SPELLLOGCRITSCHOOLOTHERSELF)
L['Your %s hits %s for %d'] = 'Ваше заклинание \"%s\" наносит %s %d' -- include (SPELLLOGSCHOOLSELFOTHER, SPELLLOGSCHOOLSELFSELF, SPELLLOGSELFOTHER, SPELLLOGSELFSELF)
L['Your %s crits %s for %d'] = 'Ваше заклинание \"%s\" наносит %s %d' -- include (SPELLLOGCRITSCHOOLSELFOTHER, SPELLLOGCRITSCHOOLSELFSELF, SPELLLOGCRITSELFOTHER, SPELLLOGCRITSELFSELF)
L['You_HitsCrits'] = 'вам'
-- channelDot func
L['%s\'s %s drains'] = '\"%2$s\" %1$s отнимает' -- include (SPELLPOWERDRAINOTHEROTHER, SPELLPOWERDRAINOTHERSELF, SPELLPOWERLEECHOTHEROTHER, SPELLPOWERLEECHOTHERSELF)
L['Mana'] = 'Мана'

-- custom strings ONLY for this locale
enemyFrames.custom_locale_strings = {
	['Horde'] = 'Орды', -- флаг Орды
	['Alliance'] = 'Альянса' -- флаг Альянса
}
