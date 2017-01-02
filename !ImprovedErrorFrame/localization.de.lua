-- Version : German (by DrVanGogh, StarDust)
-- $LastChangedBy: stardust $
-- $Date: 2006-09-05 03:51:03 -0500 (Tue, 05 Sep 2006) $

if ( GetLocale() == "deDE" ) then

	-- Interface Configuration
	IEF_FILE		= "Datei:";
	IEF_STRING		= "Codezeile:";
	IEF_LINE		= "Zeile:";
	IEF_COUNT		= "Fehler Nummer:";
	IEF_ERROR		= "Fehler:";
	IEF_ADDON		= "AddOn: ";
	IEF_PATH		= "Pfad: ";

	IEF_CANCEL		= "Abbrechen";
	IEF_CLOSE		= "Schlie\195\159en";
	IEF_REPORT		= "Melden";

	IEF_INFINITE		= "Unendlich";

	-- Slash command strings
	IEF_NOTIFY_ON		= "ErweitertesFehlerFenster: Fehler werden zur sp\195\164teren Anzeige gespeichert.";
	IEF_NOTIFY_OFF		= "ErweitertesFehlerFenster: Fehler werden angezeigt sobald jene auftreten.";
	IEF_BLINK_ON		= "ErweitertesFehlerFenster: Fehlerbutton blinkt bei neuem Fehler.";
	IEF_BLINK_OFF		= "ErweitertesFehlerFenster: Fehlerbutton blinkt nicht bei neuem Fehler.";
	IEF_COUNT_ON		= "ErweitertesFehlerFenster: Anzahl der Fehler wird angezeigt.";
	IEF_COUNT_OFF		= "ErweitertesFehlerFenster: Anzahl der Fehler wird nicht angezeigt.";
	IEF_ALWAYS_ON		= "ErweitertesFehlerFenster: Fehlerbutton wird immer angezeigt.";
	IEF_ALWAYS_OFF		= "ErweitertesFehlerFenster: Button wird bei Benachrichtigung angezeigt.";
	IEF_SOUND_ON		= "ErweitertesFehlerFenster: Sound wird bei Benachrichtigung abgespielt.";
	IEF_SOUND_OFF		= "ErweitertesFehlerFenster: Es wird kein Sound bei Benachrichtigung abgespielt.";
	IEF_EMPTY_ON		= "ErweitertesFehlerFenster: Buttongrafik verschwindet wenn blinkend.";
	IEF_EMPTY_OFF		= "ErweitertesFehlerFenster: Buttongrafik bleibt wenn blinkend.";
	IEF_DEBUG_ON		= "ErweitertesFehlerFenster: FrameXML genaue Protokollierung ein.";
	IEF_DEBUG_OFF		= "ErweitertesFehlerFenster: FrameXML genaue Protokollierung aus.";
	IEF_STACK_ON		= "ErweitertesFehlerFenster: Stack-Verfolgung ein.";
	IEF_STACK_OFF		= "ErweitertesFehlerFenster: Stack-Verfolgung aus.";
	IEF_DEBUGCAPTURE_ON	= "ErweitertesFehlerFenster: Sea Debug-Nachrichten abfangen ein.";
	IEF_DEBUGCAPTURE_OFF	= "ErweitertesFehlerFenster: Sea Debug-Nachrichten abfangen aus.";
	IEF_FORMAT_STR		= "Benutzung: /ief <MELDEN|BLINKEN|ANZAHL|IMMER|SOUND|LEER|DEBUG|STACK> <EIN|AUS>";
	IEF_CURRENT_SETTINGS	= "Momentane Einstellungen:";
	IEF_BLINK_OPT		= "blinken";
	IEF_NOTIFY_OPT		= "melden";
	IEF_COUNT_OPT		= "anzahl";
	IEF_ALWAYS_OPT		= "immer";
	IEF_SOUND_OPT		= "sound";
	IEF_EMPTY_OPT		= "leer";
	IEF_DEBUG_OPT		= "debug";
	IEF_STACK_OPT		= "stack";
	IEF_ON			= "ein";
	IEF_OFF			= "aus";
	IEF_HELP_TEXT		= "/ief - Einstellungen des Erweiterten Fehlerfensters";
	IEF_HELP_DEBUGCAPTURE_TEXT	= "/iefd - Sea Debug-Nachrichten abfangen ein/aus";

	-- Tooltip Text
	IEF_TOOLTIP		= "Klicken um Fehler anzuzeigen.";

	-- Header Text
	IEF_TITLE_TEXT		= "Gespeicherte Fehler";
	IEF_ERROR_TEXT		= "Echtzeit Fehler";

	-- Khaos/Cosmos descriptions
	IEF_OPTION_TEXT		= "Erweitertes Fehlerfenster";
	IEF_OPTION_HELP		= "Erlaubt es die Art der Fehlerberichterstattung zu ver\195\164ndern.";
	IEF_HEADER_TEXT		= "Erweitertes Fehlerfenster";
	IEF_HEADER_HELP		= "Unterschiedliche Einstellungen um die Fehlerberichterstattung an deine Bed\195\188rfnisse anzupassen.";
	IEF_NOTIFY_TEXT		= "Fehler in Liste speichern";
	IEF_NOTIFY_HELP		= "Wenn aktiviert, werden auftretende Fehler in einer Liste gespeichert um sp\195\164ter angezeigt zu werden.";
	IEF_BLINK_TEXT		= "Button blinkend";
	IEF_BLINK_HELP		= "Wenn aktiviert, blinkt der Button sobald neue Fehler gespeichert wurden.";
	IEF_COUNT_TEXT		= "Anzahl der Fehler im Button anzeigen";
	IEF_COUNT_HELP		= "Wenn aktiviert, wird die Anzahl der gespeicherten Fehler im Button als Zahl angezeigt.";
	IEF_ALWAYS_TEXT		= "Fehlerbutton immer anzeigen";
	IEF_ALWAYS_HELP		= "Wenn aktiviert, wird der Fehlerbutton immer angezeigt auch wenn keine Fehler aufgetreten sind.";
	IEF_SOUND_TEXT		= "Sound bei Fehler abspielen";
	IEF_SOUND_HELP		= "Wenn aktiviert, wird ein Sound abgespielt sobald ein neuer Fehler auftritt.";
	IEF_EMPTY_TEXT		= "Buttongrafik bei Fehler ausblenden";
	IEF_EMPTY_HELP		= "Wenn aktiviert, wird die Buttongrafik ausgeblendet wenn jener blinkt.";
	IEF_DEBUG_TEXT		= "Genaue FrameXML Fehlerprotokollierung";
	IEF_DEBUG_HELP		= "Wenn aktiviert, wird FrameXML.log in der erweiterten Protokollierung ausgelagert. (Erfordert neuladen des UI)";
	IEF_STACK_TEXT		= "Stack-Verfolgung speichern";
	IEF_STACK_HELP		= "Wenn aktiviert, wird die Stack-Verfolgung mit der Fehlermeldung angezeigt.";
	IEF_DEBUGCAPTURE_TEXT	= "Sea Debug-Nachrichten abfangen"
	IEF_DEBUGCAPTURE_HELP	= "Wenn aktiviert, werden Debug-Nachrichten vom AddOn Sea abgefangen und im Erweiterten Fehlerfenster angezeigt (f\195\188r einfache Weiterverarbeitung mittels Copy&Paste)."

end