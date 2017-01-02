--[[
 Decursive (v 1.9.8) add-on for World of Warcraft UI
 Copyright (C) 2006 Archarodim ( http://www.2072productions.com/?to=decursive-continued.txt )
 This is the continued work of the original Decursive (v1.9.4) by Quu
 Decursive 1.9.4 is in public domain ( www.quutar.com )
 
 License:
	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2
	of the License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
 
	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
--]]

-------------------------------------------------------------------------------
-- Version : Russian ( by Maus )
-------------------------------------------------------------------------------
if ( GetLocale() == "ruRU" ) then

--start added in Rc4
DCR_ALLIANCE_NAME = 'Альянс';

DCR_LOC_CLASS_DRUID   = 'Друид';
DCR_LOC_CLASS_HUNTER  = 'Охотник';
DCR_LOC_CLASS_MAGE    = 'Маг';
DCR_LOC_CLASS_PALADIN = 'Паладин';
DCR_LOC_CLASS_PRIEST  = 'Жрец';
DCR_LOC_CLASS_ROGUE   = 'Разбойник';
DCR_LOC_CLASS_SHAMAN  = 'Шаман';
DCR_LOC_CLASS_WARLOCK = 'Чернокнижник';
DCR_LOC_CLASS_WARRIOR = 'Воин';

DCR_STR_OTHER	    = 'Другое';
DCR_STR_ANCHOR	    = 'Якорь';
DCR_STR_OPTIONS	    = 'Настройки';
DCR_STR_CLOSE	    = 'Закрыть';
DCR_STR_DCR_PRIO    = 'Приоритеты Decursive';
DCR_STR_DCR_SKIP    = 'Пропуски Decursive';
DCR_STR_QUICK_POP   = 'Быстрое заполнение';
DCR_STR_POP	    = 'Список заполнений';
DCR_STR_GROUP	    = 'Группа ';

DCR_STR_NOMANA	    = 'Недостаточно маны!';
DCR_STR_UNUSABLE    = 'Не возможно использовать снятие проклятия!';
DCR_STR_NEED_CURE_ACTION_IN_BARS = 'Decursive не удалось найти ваше заклинание \"снятия\" ни на одной из ваших панелей действий. Decursive нужно это для проверки маны...';


DCR_UP		    = 'Вверх';
DCR_DOWN	    = 'Вниз';

DCR_PRIORITY_SHOW   = 'ПР';
DCR_POPULATE	    = 'ЗП';
DCR_SKIP_SHOW	    = 'П';
DCR_ANCHOR_SHOW	    = 'Я';
DCR_OPTION_SHOW	    = 'O';
DCR_CLEAR_PRIO	    = 'О';
DCR_CLEAR_SKIP	    = 'О';


--end added in Rc4
DCR_LOC_AF_TYPE = {};
DCR_LOC_AF_TYPE [DCR_DISEASE] = 'Болезнь';
DCR_LOC_AF_TYPE [DCR_MAGIC]   = 'Магия';
DCR_LOC_AF_TYPE [DCR_POISON]  = 'Яд';
DCR_LOC_AF_TYPE [DCR_CURSE]   = 'Проклятие';
DCR_LOC_AF_TYPE [DCR_CHARMED] = 'Контроль разума';


DCR_PET_FELHUNTER = "Охотник Скверны";
DCR_PET_DOOMGUARD = "Страж ужаса";
DCR_PET_FEL_CAST  = "Пожирание магии";
DCR_PET_DOOM_CAST = "Рассеивание заклинаний";

DCR_SPELL_CURE_DISEASE        = 'Излечение болезни';
DCR_SPELL_ABOLISH_DISEASE     = 'Устранение болезни';
DCR_SPELL_PURIFY              = 'Омовение';
DCR_SPELL_CLEANSE             = 'Очищение';
DCR_SPELL_DISPELL_MAGIC       = 'Рассеивание заклинаний';
DCR_SPELL_CURE_POISON         = 'Выведение яда';
DCR_SPELL_ABOLISH_POISON      = 'Устранение яда';
DCR_SPELL_REMOVE_LESSER_CURSE = 'Снятие малого проклятия';
DCR_SPELL_REMOVE_CURSE        = 'Снятие проклятия';
DCR_SPELL_PURGE               = 'Развеяние магии';
DCR_SPELL_NO_RANK             = '';
DCR_SPELL_RANK_1              = 'Уровень 1';
DCR_SPELL_RANK_2              = 'Уровень 2';

BINDING_NAME_DCRCLEAN   = "Очистить Группу";
BINDING_NAME_DCRSHOW    = "Показать/скрыть главную панель Decursive";
BINDING_NAME_DCROPTION  = "Показать/скрыть параметры окна";

BINDING_NAME_DCRPRADD     = "Добавить цель в список приоритетов";
BINDING_NAME_DCRPRCLEAR   = "Очистить список приоритетов";
BINDING_NAME_DCRPRLIST    = "Вывести список приоритетов";
BINDING_NAME_DCRPRSHOW    = "Показать или скрыть список приоритета";

BINDING_NAME_DCRSKADD   = "Добавить цель в список пропусков";
BINDING_NAME_DCRSKCLEAR = "Очистить список пропусков";
BINDING_NAME_DCRSKLIST  = "Распечатка списка пропусков";
BINDING_NAME_DCRSKSHOW  = "Показать или скрыть список пропусков";


DCR_DISABLE_AUTOSELFCAST = "Decursive обнаружил что опция \"%s\" включена.\n\nDecursive не может нормально работать, когда она активна.\n\nХотите её отключить?";

DCR_PRIORITY_LIST  = "Список приоритетов";
DCR_SKIP_LIST_STR  = "Список пропусков";
DCR_SKIP_OPT_STR   = "Меню настроек Decursive";
DCR_POPULATE_LIST  = "Быстро заполнить список Decursive";
DCR_RREMOVE_ID     = "Удалить данного игрока";
DCR_HIDE_MAIN      = "Скрыть окно Decursive";
DCR_SHOW_MSG	   = "введите /dcrshow";
DCR_IS_HERE_MSG	   = "Decursive ";

DCR_PRINT_CHATFRAME = "Выводить сообщения в стандартный чат";
DCR_PRINT_CUSTOM    = "Выводить сообщения в окно";
DCR_PRINT_ERRORS    = "Выводить сообщения об ошибках";

DCR_SHOW_TOOLTIP    = "Отображать подсказки к зараж. игрокам";
DCR_REVERSE_LIVELIST= "Заполнять активный список снизу вверх";
DCR_TIE_LIVELIST    = "Привязка обзора активного списка к окну DCR";
DCR_HIDE_LIVELIST   = "Скрыть активный список";

DCR_AMOUNT_AFFLIC   = "Количество отображаемых заражений : ";
DCR_BLACK_LENGTH    = "Секунд в чёрном списке : ";
DCR_SCAN_LENGTH     = "Секунд между активными скан.: ";
DCR_ABOLISH_CHECK   = "Провер. устр. яда/болезни перед лечением";
DCR_BEST_SPELL      = "Всегда исп. наивысший ранг заклинания.";
DCR_RANDOM_ORDER    = "Лечить в случайном порядке";
DCR_CURE_PETS       = "Скан и лечение питомцев";
DCR_IGNORE_STEALTH  = "Игнорировать невидимых игроков";
DCR_PLAY_SOUND	    = "Проиграть звук, если есть кого лечить";
DCR_ANCHOR          = "Сообщения Decursive";
DCR_CHECK_RANGE     = "Проверить дистанцию";
DCR_DONOT_BL_PRIO   = "Не вносить в ЧС имена из списка приор.";
DCR_CHOOSE_CURE	    = "Лечение:";


-- $s is spell name
-- $a is affliction name/type
-- $t is target name
DCR_DISPELL_ENEMY    = "Применение \"$s\" на врага!";
DCR_NOT_CLEANED      = "Ничего не очищено";
DCR_CLEAN_STRING     = "Снятие \"$a\" с $t";
DCR_SPELL_FOUND      = "\"$s\" заклинание найдено!";
DCR_NO_SPELLS        = "Найдены не лечебные заклинания!";
DCR_NO_SPELLS_RDY    = "Не лечебное заклинание готово к применению!";
DCR_OUT_OF_RANGE     = "$t в не достижения и должен быть вылечен от \"$a\"!";
DCR_IGNORE_STRING    = "\"$a\" на $t... игнорируется";

DCR_INVISIBLE_LIST = {
    ["Крадущийся зверь"]       = true,
    ["Незаметность"]     = true,
    ["Слиться с тенью"]  = true,
}

-- this causes the target to be ignored!!!!
DCR_IGNORELIST = {
    ["Изгнание"]      = true,
    ["Бегство в астрал"] = true,
};

-- ignore this effect
DCR_SKIP_LIST = {
    ["Мирный сон"] = true,
    ["Глубокий сон без сновидений"] = true,
    ["Внутреннее зрение"] = true,
    ["Мутагенный укол"] = true,
};

-- ignore the effect bassed on the class
DCR_SKIP_BY_CLASS_LIST = {
    [DCR_CLASS_WARRIOR] = {
	["Древняя истерия"]   = true,
	["Воспламенение маны"]        = true,
	["Запятнанный разум"]       = true,
    };
    [DCR_CLASS_ROGUE] = {
	["Безмолвие"]            = true;
	["Древняя истерия"]   = true,
	["Воспламенение маны"]        = true,
	["Запятнанный разум"]       = true,
    };
    [DCR_CLASS_HUNTER] = {
	["Оковы магмы"]     = true,
    };
    [DCR_CLASS_MAGE] = {
	["Оковы магмы"]     = true,
    };
};

end