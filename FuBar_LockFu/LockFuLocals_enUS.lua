local L = AceLibrary("AceLocale-2.0"):new("LockFu")

L:RegisterTranslations("enUS", function() return {
	lockbars = "Lock the bars",
	lockchat = "Lock the chat",
	playclicksoundtext = "Play sound on click",
	showhinttext = "Show hint in tooltip",
	
	tiplocked = "|cff00ff00Locked",
	tipunlocked = "|cffff0000Unlocked",
	tipbars = "Bars:",
	tipchat = "Chat:",
	
	hintleftclick = "|cffffffffLeft-Click |cff00ff00the icon to toggle both the lock on the bars and the chat.",
	hintleftclickalt = "|cffffffffLeft-Click |cff00ff00the icon to toggle both the lock.",
	hintrightclick = "|cffffffffRight-Click |cff00ff00to toggle independantly and select options.",
	hintrightclickalt = "|cffffffffRight-Click |cff00ff00to select options.",
	
	barsbybongos = "|cff555555Bars controlled by Bongos",
} end)