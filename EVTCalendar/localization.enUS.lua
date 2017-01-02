----------------------------------------------------------------
-- EVTCalendar English Localization
-- Author: Reed
-- 
--
----------------------------------------------------------------


EVT_SLASH = "/evt";
EVT_CALENDAR = "EVTCalendar";
EVT_HELP = "help";
EVT_ABOUT = "about";
--MONTHS
EVT_JAN = "January";
EVT_FEB = "Feburary";
EVT_MAR = "March";
EVT_APR = "April";
EVT_MAY = "May";
EVT_JUN = "June";
EVT_JUL = "July";
EVT_AUG = "August";
EVT_SEP = "September";
EVT_OCT = "October";
EVT_NOV = "November";
EVT_DEC = "December";
--DAYS
EVT_SUN = "Sunday";
EVT_MON = "Monday";
EVT_TUE = "Tuesday";
EVT_WED = "Wednesday";
EVT_THU = "Thursday";
EVT_FRI = "Friday";
EVT_SAT = "Saturday";
--Chat
EVT_INVITE_QUEUE = "has invited you to an event. Do you accept?"

evtSubMenu = {
		[1] = {"Blackfathom Depths", "Blackrock Depths", "Blackrock Spire", "The Deadmines", "Dire Maul", "Gnomeregan", "Maraudon", "Ragefire Chasm", "Razorfen Downs", "Razorfen Kraul", "Scarlet Monastery", "Scholomance", "Shadowfang Keep", "The Stockades", "Stratholome", "The Sunken Temple", "Uldaman", "Wailing Caverns", "Zul'Farak" },
		[2] = {"Blackwing Lair", "Molten Core", "Naxxramas", "Onyxia's Lair", "Ruins of Ahn'Qiraj", "Temple of Ahn'Qiraj", "Zul'Gurub"},
		[3] = {"Warsong Gultch", "Arathi Basin", "Alterac Valley", "World"}
	};

evtTypes = {"Dungeon", "Raid", "PvP", "Quests", "Meeting", "Event", "Other" };

evtInvites = {"Party", "Raid", "Guild", "Guild Officers"};

evtInviteLock = {"None", "Officers", "Self"};