local L = AceLibrary("AceLocale-2.2"):new("AuditorFu")

L:RegisterTranslations("enUS", function() return {

	-- Plugin Locals

	["NAME"] = "FuBar - AuditorFu",
	["DESCRIPTION"] = "Keeps track of incoming and outgoing cash by categories. Runs with or without FuBar.",
	
	-- Options Table Locals
	
	["TEXT_CASHFLOW"] = "Cashflow",
	["TEXT_TIMEFRAME"] = "Timeframe",
	["DESC_TIMEFRAME"] = "Sets timeframe for data to be displayed in the tooltip.",
	["TEXT_CASHFORMAT"] = "Money Format",
	["DESC_CASHFORMAT"] = "Sets the format in which money is displayed.",
	["TEXT_FUDISPLAY"] = "FuBar Display",
	["DESC_FUDISPLAY"] = "Sets the format in which money is displayed in FuBar.",
	["TEXT_TIPDISPLAY"] = "Tooltip Display",
	["DESC_TIPDISPLAY"] = "Sets the format in which money is displayed in the tooltip.",
	["TEXT_HIDETOTALS"] = "Hide Totals",
	["DESC_HIDETOTALS"] = "Hides the character totals from the tooltip.",
	["TEXT_HIDEDETAILS"] = "Hide Cashflow",
	["DESC_HIDEDETAILS"] = "Hides incomings and outgoings by category from the tooltip.",
	["TEXT_HIDESUMMARY"] = "Hide Summary",
	["DESC_HIDESUMMARY"] = "Hides summary of incomings and outgoings from the tooltip.",
	["TEXT_CHARSHOW"] = "Show Character",
	["DESC_CHARSHOW"] = "Show Auditor details for another of your characters.",
	["TEXT_IMPORT"] = "Import Data",
	["DESC_IMPORT"] = "Import data from Accountant. Accountant must be loaded for this to work, and you should only really do this once per character.",
	["TEXT_PURGE"] = "Purge Data",
	["DESC_PURGE"] = "Purges data for the selected character. This will DESTROY all data for the selected character.",
	["TEXT_FILTER"] = "Filter Data",
	["DESC_FILTER"] = "Filters data for the selected character out of the tooltip display.",
	["TEXT_FULLSTYLE"] = "Full Style",
	["TEXT_SHORTSTYLE"] = "Short Style",
	["TEXT_CONDSTYLE"] = "Condensed Style",
	["TEXT_GRAPHICAL"] = "Graphical Style",
	["TEXT_SESSION"] = "Session's Audit",
	["TEXT_DAY"] = "Today's Audit",
	["TEXT_WEEK"] = "Seven Day Audit",
	["TEXT_TOTAL"] = "Total Audit",
	["TEXT_RSESSION"] = "Reset Session",
	["DESC_RSESSION"] = "Resets data for this session. Does not affect day, last 7 days, or total data.",
	["TEXT_FOR"] = " for ",
	["TEXT_ON"] = " on ",
	["TEXT_FROMTOTALS"] = " from tooltip Totals.",
	["TEXT_ABSURD"] = "Absurd Details",
	["DESC_ABSURD"] = "Change the tooltip style to show absurd levels of detail.",
	
	-- Tooltip Locals
	
	["TEXT_LOOT"] = "Loot",
	["TEXT_VENDORS"] = "Vendors",
	["TEXT_QUEST"] = "Quest",
	["TEXT_TRADE"] = "Trade",
	["TEXT_MAIL"] = "Mail",
	["TEXT_AH"] = "Auction House",
	["TEXT_TRAIN"] = "Training",
	["TEXT_TAXI"] = "Flights",
	["TEXT_REPAIRS"] = "Repairs",
	["TEXT_OTHER"] = "Unknown",
	["TEXT_SOURCE"] = "Source",
	["TEXT_INCOMINGS"] = "Incomings",
	["TEXT_OUTGOINGS"] = "Outgoings",
	["TEXT_SUMMARY"] = "Summary",
	["TEXT_CHARACTERS"] = "Characters",
	["TEXT_NETPROFIT"] = "Net Profit",
	["TEXT_NETLOSS"] = "Net Loss",
	["TEXT_NETTOTAL"] = "Total",
	
	-- Absurdly Detailed Locals
	
	["ABSD_SESSION"] = "Session",
	["ABSD_WEEK"] = "Week",
	["ABSD_1"] = "Today",
	["ABSD_2"] = "Yesterday",
	["ABSD_3"] = "2 Days Ago",
	["ABSD_4"] = "3 Days Ago",
	["ABSD_5"] = "4 Days Ago",
	["ABSD_6"] = "5 Days Ago",
	["ABSD_7"] = "6 Days Ago",
	["ABSD_TOTAL"] = "All Time",
	
	-- Date Locals
	["DATE_01"] = "Jan",
	["DATE_02"] = "Feb",
	["DATE_03"] = "Mar",
	["DATE_04"] = "Apr",
	["DATE_05"] = "May",
	["DATE_06"] = "Jun",
	["DATE_07"] = "Jul",
	["DATE_08"] = "Aug",
	["DATE_09"] = "Sep",
	["DATE_10"] = "Oct",
	["DATE_11"] = "Nov",
	["DATE_12"] = "Dec",
	
	
	-- Popup Locals
	
	["POPUP_IMPORT"] = "Are you sure you want to import data from Accountant for this character? This will REPLACE your current Auditor data, if it exists. You should only import when you first run Auditor for each character. After you have done this for every character, you should disable Accountant, and AccountantFu if you run it.",
	["POPUP_PURGE"] = "Are you sure you want to purge ",
	["POPUP_PURGE2"] = "'s data? This will destroy ALL data for ",
	["POPUP_YES"] = "Yes",
	["POPUP_NO"] = "No",
	
	-- Import Locals
	
	["IMPORT_SERVER"] = "Server separated",
	["IMPORT_NOSERVER"] = "Non-server separated",
	["IMPORT_DATAIMPORT"] = " data imported for ",
	["IMPORT_ERROR"] = "Nothing to import! Either Accountant isn't loaded, or you have a version I've never seen. Sorry!",
	
	-- Data reconciliation
	
	["DATA_RECONCILIATION"] = "Data reconciliation performed for ",
	} end)