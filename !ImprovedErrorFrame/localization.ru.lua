-- Version : Russian ( by Maus )
-- last update : 08/4/2016 

if ( GetLocale() == "ruRU" ) then

-- Interface Configuration
IEF_FILE		= "Файл: ";
IEF_STRING		= "Строка: ";
IEF_LINE		= "Линия: ";
IEF_COUNT		= "Номер: ";
IEF_ERROR		= "Ошибка: ";
IEF_ADDON		= "Аддон: ";
IEF_PATH		= "Путь: ";

IEF_CANCEL		= "Отменить";
IEF_CLOSE		= "Закрыть";
IEF_REPORT		= "Отчет";

IEF_INFINITE		= "Бесконечный";

-- Slash command strings
IEF_NOTIFY_ON		= "ImprovedErrorFrame: Включить оповещение задержек уведомления.";
IEF_NOTIFY_OFF		= "ImprovedErrorFrame: Сообщать о только произошедших ошибках.";
IEF_BLINK_ON		= "ImprovedErrorFrame: Мерцание, когда обнаружена новая ошибка.";
IEF_BLINK_OFF		= "ImprovedErrorFrame: Кнопка не будет мерцать.";
IEF_COUNT_ON		= "ImprovedErrorFrame: Отображать число ошибок.";
IEF_COUNT_OFF		= "ImprovedErrorFrame: Не отображать число ошибок.";
IEF_ALWAYS_ON		= "ImprovedErrorFrame: Всегда отображать кнопку об ошибке.";
IEF_ALWAYS_OFF		= "ImprovedErrorFrame: Отображать кнопку после уведомления.";
IEF_SOUND_ON		= "ImprovedErrorFrame: Проигрывать звук после уведомления.";
IEF_SOUND_OFF		= "ImprovedErrorFrame: Звук не будет воспроизводиться.";
IEF_EMPTY_ON		= "ImprovedErrorFrame: Исчезновение кнопки после мерцания.";
IEF_EMPTY_OFF		= "ImprovedErrorFrame: После мерцания кнопка не измениться.";
IEF_DEBUG_ON		= "ImprovedErrorFrame: FrameXML ведение журнала вкл.";
IEF_DEBUG_OFF		= "ImprovedErrorFrame: FrameXML ведение журнала откл.";
IEF_STACK_ON		= "ImprovedErrorFrame: Трассировка стека вкл.";
IEF_STACK_OFF		= "ImprovedErrorFrame: Трассировка стека откл.";
IEF_DEBUGCAPTURE_ON	= "ImprovedErrorFrame: Захват отладки вкл.";
IEF_DEBUGCAPTURE_OFF	= "ImprovedErrorFrame: Захват отладки откл.";
IEF_FORMAT_STR		= "Формат: /ief <NOTIFY|BLINK|COUNT|ALWAYS|SOUND|EMPTY|DEBUG|STACK> <ON|OFF>";
IEF_CURRENT_SETTINGS	= "Текущие настройки:";
IEF_BLINK_OPT		= "blink";
IEF_NOTIFY_OPT		= "notify";
IEF_COUNT_OPT		= "count";
IEF_ALWAYS_OPT		= "always";
IEF_SOUND_OPT		= "sound";
IEF_EMPTY_OPT		= "empty";
IEF_DEBUG_OPT		= "debug";
IEF_STACK_OPT		= "stack";
IEF_ON			= "on";
IEF_OFF			= "off";
IEF_HELP_TEXT		= "/ief - Настройки Improved Error Frame";
IEF_HELP_DEBUGCAPTURE_TEXT =	"/iefd - Вкл/Выкл захват отладочных сообщений";

-- Tooltip Text
IEF_TOOLTIP		= "Нажмите, чтобы просмотреть ошибку.";
-- Header Text
IEF_TITLE_TEXT		= "Ошибки в очереди";
IEF_ERROR_TEXT		= "Ошибки в реальном времени";

-- Khaos/Cosmos descriptions
IEF_OPTION_TEXT		= "Improved Error Frame";
IEF_OPTION_HELP		= "Позволяет установить опции об отчете ошибки.";
IEF_HEADER_TEXT		= "Improved Error Frame";
IEF_HEADER_HELP		= "Различные настройки для отчетов об ошибках.";
IEF_NOTIFY_TEXT		= "Ошибки в очереди";
IEF_NOTIFY_HELP		= "Если активно, ошибки будут отображаться позже.";
IEF_BLINK_TEXT		= "Мигающая кнопка";
IEF_BLINK_HELP		= "Если активно, при обнаружении ошибок кнопка будет мигать.";
IEF_COUNT_TEXT		= "Показывать число ошибок на кнопке";
IEF_COUNT_HELP		= "Если выбрано, число ошибок будет отображено на кнопке.";
IEF_ALWAYS_TEXT		= "Всегда отображать кнопку ошибок";
IEF_ALWAYS_HELP		= "Если активно, кнопка всегда будет присутствовать на экране.";
IEF_SOUND_TEXT		= "Проигрывать звук уведомления";
IEF_SOUND_HELP		= "Если активно, при обнаружении ошибок, будет проигрываться звук.";
IEF_EMPTY_TEXT		= "Очистить графическую кнопку";
IEF_EMPTY_HELP		= "Если активно, кнопка ошибок будет очищена при мигании.";
IEF_DEBUG_TEXT		= "Подробный FrameXML журнал ошибок";
IEF_DEBUG_HELP		= "Если активно, FrameXML журнал будет выводиться в более расширенном режиме. (Требуется перезагрузить UI)";
IEF_STACK_TEXT		= "Захват трассировки стека";
IEF_STACK_HELP		= "Если активно, трассировка стека будет отображаться вместе с сообщением об ошибке";
IEF_DEBUGCAPTURE_TEXT	= "Захват сообщений отладки"
IEF_DEBUGCAPTURE_HELP	= "Если активно, то фрейм захвата сообщений отладки позволит копировать/вставлять его сообщения."

end