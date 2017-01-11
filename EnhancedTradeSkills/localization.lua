--
-- localization file, EN and DE supported now
--
-- global stuff

PINKY_VERSION = "1.16.9";
PINKY_BANNER = "Enhanced Trade Skills v1.16.9 /etsconfig";
PINKY_RELEASE = "Sep 25, 2006";

PINKY_INV = "inv";
PINKY_INV_PLUS = "inv+";
PINKY_TOTAL = "total";
PINKY_TOTAL_PLUS = "total+";
PINKY_TITLE = "title";
PINKY_TRUE = "true";
PINKY_FALSE = "false";
PINKY_TOGGLE = "toggle";
BINDING_HEADER_ETS_SEP = "Enhanced Trade Skills";


-- load all in english incase locale not known

PINKY_HELP_MSG = "/ets [<string>] dumps inventory and bank contents, optionally matching <string>";
PINKY_DUMP = "%s: %d = %d inventory + %d bank";
PINKY_DUMP1 = "%s: %d inventory (missing bank information)";
PINKY_BANK = "%d unique items in the bank";
PINKY_BANK_EMPTY = "No bank information, please visit the bank";

PINKY_BEAST_TRAINING = "Beast Training";

PINKY_INVALID_DISPLAY_CMD = "Invalid display command: %s (expected 'column true/false')";
PINKY_INVALID_DISPLAY_SETTING = "Invalid display setting (%s) for column (%s) (allowed settings are true and false)";
PINKY_INVALID_DISPLAY_COLUMN = "Invalid display column (%s), allowed values are (inv, inv+, total, total+)";
PINKY_DISPLAY_SETTING = "Setting %s display to %s";

PINKY_INVALID_FILTER_CMD = "Invalid filter command: %s (expected 'filterName true/false')";
PINKY_INVALID_FILTER_SETTING = "Invalid filter setting (%s) for filter (%s) (allowed settings are true and false)";
-- note, do not translate optimal/medium/easy/trivial - they are internal strings and might not be localized
PINKY_INVALID_FILTER_NAME = "Invalid filter name (%s), allowed values are (inv, inv+, total, total+, optimal, medium, easy, trivial)";
PINKY_FILTER_SETTING = "Setting %s filter to %s";
PINKY_RESET = "Your settings have been reset to default";

PINKY_FILTER_OPTIMAL_BUTTON_TEXT = "Filter out 'optimal' (orange) items";
PINKY_FILTER_MEDIUM_BUTTON_TEXT = "Filter out 'medium' (yellow) items";
PINKY_FILTER_EASY_BUTTON_TEXT = "Filter out 'easy' (green) items";
PINKY_FILTER_TRIVIAL_BUTTON_TEXT = "Filter out 'trivial' (gray) items";

PINKY_FILTER_INV_BUTTON_TEXT = "Filter out items you can not make with your inventory";
PINKY_FILTER_INV_PLUS_BUTTON_TEXT = "Filter out items you can not make from your inventory and vendor";
PINKY_FILTER_TOTAL_BUTTON_TEXT = "Filter out items you can not make with your inventory and bank";
PINKY_FILTER_TOTAL_PLUS_BUTTON_TEXT = "Filter out items you can not make from your inventory, bank, and vendor";

PINKY_DISPLAY_INV_BUTTON_TEXT = "Display the Inventory-only column";
PINKY_DISPLAY_INV_PLUS_BUTTON_TEXT = "Display the Inventory and Vendor Column";
PINKY_DISPLAY_TOTAL_BUTTON_TEXT = "Display the Inventory and Bank column";
PINKY_DISPLAY_TOTAL_PLUS_BUTTON_TEXT = "Display the Inventory, Bank, and Vendor column";
PINKY_DISPLAY_TITLE_BUTTON_TEXT = "Display the Filter Settings In Titlebar";
BEAST_TRAIN = "Beast Training";
TOGGLE_FILTER_ON = "Turn Filter ON";
TOGGLE_FILTER_OFF = "Turn Filter OFF";
 TOGGLE_FILTER_TIP = "This will turn your filters on or off";
BINDING_NAME_ETS_NAME	= "Configure Options";


if ( GetLocale() == "frFR" ) then

-- french locale in here - any offers ?
elseif ( GetLocale() == "ruRU" ) then
--by CFM
PINKY_DUMP = "%s: %d = %d в инвентаре + %d в банке";
PINKY_DUMP1 = "%s: %d в инвентаре (нет информации из банка)";
PINKY_BANK = "%d уникальных предметов в банке";
PINKY_BANK_EMPTY = "Нет информации из банка, пожалуйста, посетите банк.";

PINKY_BEAST_TRAINING = "Дрессировка";

PINKY_INVALID_DISPLAY_CMD = "Invalid display command: %s (expected 'column true/false')";
PINKY_INVALID_DISPLAY_SETTING = "Invalid display setting (%s) for column (%s) (allowed settings are true and false)";
PINKY_INVALID_DISPLAY_COLUMN = "Invalid display column (%s), allowed values are (inv, inv+, total, total+)";
PINKY_DISPLAY_SETTING = "Настройки %s отображения %s";

PINKY_INVALID_FILTER_CMD = "Invalid filter command: %s (expected 'filterName true/false')";
PINKY_INVALID_FILTER_SETTING = "Invalid filter setting (%s) for filter (%s) (allowed settings are true and false)";
PINKY_INVALID_FILTER_NAME = "Invalid filter name (%s), allowed values are (inv, inv+, total, total+, optimal, medium, easy, trivial)";
PINKY_FILTER_SETTING = "Настройки %s фильтра %s";
PINKY_RESET = "Ваши настройки были сброшены на стандартные";

PINKY_FILTER_OPTIMAL_BUTTON_TEXT = "Фильтр для 'optimal' (orange) предметов";
PINKY_FILTER_MEDIUM_BUTTON_TEXT = "Фильтр для 'medium' (yellow) предметов";
PINKY_FILTER_EASY_BUTTON_TEXT = "Фильтр для 'easy' (green) предметов";
PINKY_FILTER_TRIVIAL_BUTTON_TEXT = "Фильтр для 'trivial' (gray) предметов";

PINKY_FILTER_INV_BUTTON_TEXT = "Фильтр для предметы которые вы не можете сделать с предметами инвентаря";
PINKY_FILTER_INV_PLUS_BUTTON_TEXT = "Фильтр для предметы которые вы не можете сделать с предметами инвентаря и продавца";
PINKY_FILTER_TOTAL_BUTTON_TEXT = "Фильтр для предметы которые вы не можете сделать с предметами инвентаря и банка";
PINKY_FILTER_TOTAL_PLUS_BUTTON_TEXT = "Фильтр для предметы которые вы не можете сделать с предметами инвентаря, банка и продавца";

PINKY_DISPLAY_INV_BUTTON_TEXT = "Показывать колонки только из инвентаря";
PINKY_DISPLAY_INV_PLUS_BUTTON_TEXT = "Показывать колонки из инвентаря и продавца";
PINKY_DISPLAY_TOTAL_BUTTON_TEXT = "Показывать колонки из инвентаря и банка";
PINKY_DISPLAY_TOTAL_PLUS_BUTTON_TEXT = "Показывать колонки из инвентаря, банка и продавца";
PINKY_DISPLAY_TITLE_BUTTON_TEXT = "Показывать настройки фильтра в заголовке окна";
BEAST_TRAIN = "Дрессировка";
TOGGLE_FILTER_ON = "Включить фильтр";
TOGGLE_FILTER_OFF = "Выключить фильтр";
 TOGGLE_FILTER_TIP = "Нажать, чтобы включить или выключить фильтр";
BINDING_NAME_ETS_NAME	= "Настройки";

elseif ( GetLocale() == "deDE" ) then

  PINKY_HELP_MSG = "/ets [<string>] gibt den Inhalt von Inventar und Bank aus, optional nur <string>";
  PINKY_DUMP = "%s: %d = %d Inventar + %d Bank";
  PINKY_DUMP1 = "%s: %d Inventar (ohne Bank-Informationen)";
  PINKY_BANK = "%d verschiedene Gegenst\195\164nde in der Bank";
  PINKY_BANK_EMPTY = "Keine Bankinformationen gespeichert, bitte Bank besuchen";

  PINKY_BEAST_TRAINING = "Begleiter Training";

  PINKY_INVALID_DISPLAY_CMD = "Ung\195\188ltige Anzeigeeinstellung: %s (erwartet: 'Spalte true/false')";
  PINKY_INVALID_DISPLAY_SETTING = "Ung\195\188ltige Anzeigeeinstellung (%s) f\195\188r Spalte (%s) (Erlaubte Einstellungen sind true und false)";
  PINKY_INVALID_DISPLAY_COLUMN = "Ung\195\188ltige Anzeigespalte (%s), erlaubte Werte sind (inv, inv+, total, total+)";
  PINKY_DISPLAY_SETTING = "Setze %s Anzeige auf %s";

  PINKY_INVALID_FILTER_CMD = "Ung\195\188ltige Filtereinstellung: %s (erwartet: 'FilterName true/false')";
  PINKY_INVALID_FILTER_SETTING = "Ung\195\188ltige Filtereinstellung (%s) f\195\188r Filter (%s) (erlaubte Einstellungen sind true und false)";
  -- note, do not translate optimal/medium/easy/trivial - they are internal strings and might not be localized
  PINKY_INVALID_FILTER_NAME = "Ung\195\188ltiger Filtername (%s), erlaubte Werte sind (inv, inv+, total, total+, optimal, medium, easy, trivial)";
  PINKY_FILTER_SETTING = "Setze %s Filter auf %s";
  PINKY_RESET = "Ihre Einstellungen werden auf Standartwert zurьckgesetzt";

  PINKY_FILTER_OPTIMAL_BUTTON_TEXT = "'optimal' (orange) Gegenst\195\164nde ausfiltern";
  PINKY_FILTER_MEDIUM_BUTTON_TEXT = "'medium' (gelbe) Gegenst\195\164nde ausfiltern";
  PINKY_FILTER_EASY_BUTTON_TEXT = "'easy' (gr\195\188ne) Gegenst\195\164nde ausfiltern";
  PINKY_FILTER_TRIVIAL_BUTTON_TEXT = "'trivial' (graue) Gegenst\195\164nde ausfiltern";

  PINKY_FILTER_INV_BUTTON_TEXT = "Gegenst\195\164nde ausfiltern welche nicht mit Zutaten im Inventar hergestellt werden k\195\182nnen";
  PINKY_FILTER_INV_PLUS_BUTTON_TEXT = "Gegenst\195\164nde ausfiltern welche nicht mit Zutaten im Inventar und vom H\195\164ndler hergestellt werden k\195\182nnen";
  PINKY_FILTER_TOTAL_BUTTON_TEXT = "Gegenst\195\164nde ausfiltern welche nicht mit Zutaten im Inventar und in der Bank hergestellt werden k\195\182nnen";
  PINKY_FILTER_TOTAL_PLUS_BUTTON_TEXT = "Gegenst\195\164nde ausfiltern welche nicht mit Zutaten im Inventar, in der Bank und vom H\195\164ndler hergestellt werden k\195\182nnen";

  PINKY_DISPLAY_INV_BUTTON_TEXT = "Spalte Nur-Inventar anzeigen";
  PINKY_DISPLAY_INV_PLUS_BUTTON_TEXT = "Spalte Inventar und H\195\164ndler anzeigen";
  PINKY_DISPLAY_TOTAL_BUTTON_TEXT = "Spalte Inventar und Bank anzeigen";
  PINKY_DISPLAY_TOTAL_PLUS_BUTTON_TEXT = "Spalte Inventar, Bank und H\195\164ndler anzeigen";
  PINKY_DISPLAY_TITLE_BUTTON_TEXT = "Anzeigen der Filtersettings in der Titelbar";
  BEAST_TRAIN = "Wildtierausbildung";
  TOGGLE_FILTER_ON = "Filter Ein"; 
  TOGGLE_FILTER_OFF = "Filter Aus";
  TOGGLE_FILTER_TIP = "Dies wird ihre Filter Ein-/Ausschalten";
  BINDING_NAME_ETS_NAME	= "Einstellungs-Optionen";

end

