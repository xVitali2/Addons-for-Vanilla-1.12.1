local L = AceLibrary("AceLocale-2.0"):new("LockFu")

L:RegisterTranslations("deDE", function() return {
		lockbars = "Leisten festsetzen",
		lockchat = "Chat festsetzen",
		playclicksoundtext = "Klickgeräusch abspielen",
		showhinttext = "Zeige Hinweis im Tooltip",
	
		tiplocked = "|cff00ff00festgesetzt",
		tipunlocked = "|cffff0000nicht festgesetzt",
		tipbars = "Leisten:",
		tipchat = "Chat:",
		
		hintleftclick = "|cffffffffLinks-Klick |cff00ff00auf das Symbol, um sowohl Leisten als auch Chat umzuschalten.",
		hintrightclick = "|cffffffffRechts-Klick |cff00ff00um sie unabhängig von einander anzuw�hlen und Einstellungen zu machen.",
} end)