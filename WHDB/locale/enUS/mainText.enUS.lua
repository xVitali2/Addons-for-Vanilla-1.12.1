local L = AceLibrary("AceLocale-2.2"):new("WHDBTextLocal")

L:RegisterTranslations("enUS", function() return {

	["Cartographer Database Registered."] = true,
	["WHDB Loaded."] = true,
	["Using EQL3."] = true,
	["Using QuestGuru."] = true,
	["Using default quest log."] = true,
	["MetaMap plotter enabled."] = true,
	["Cartographer plotter enabled."] = true,
	["MapNotes plotter enabled."] = true,
	
	["Commands available:"] = true,
	["/whdb help | This help."] = true,
	["/whdb com <quest name> | Get quest comments by quest name."] = true,
	["/whdb item <item name> | Get item drop info and show map if possible."] = true,
	["/whdb mob <monster name> | Get monser location and show map if possible."] = true,
	["/whdb clean | Clean map notes."] = true,
	["/whdb colors <0 or 1>| Enable/Disable coloring of text in the quest log."] = true,
	["/whdb copy <character>| Copy characters config to current one."] = true,
	["Note: All parameters are case sensitive!"] = true,
	["Quest Comments"] = true,
	["Drops for: "] = true,
	["Showing only the 5 first results."] = true,
	["Location for: "] = true,
	["Text colors enabled."] = true,
	["Text colors disabled."] = true,
	["Settings loaded."] = true,
	["There are no settings for this character."] = true,
	
	["(.*) slain"] = true, -- (mob name) slain
	["Unknown"] = true,
	["Zone: "] = true,
	["Level: "] = true,
	["Health: "] = true,
	["Coords: "] = true,
	["Dropped by: "] = true,
	["Drop Rate: "] = true,
	["\nDrop: "] = true,
	["Map Plots"] = true,
	["Comments"] = true,
	["END: "] = true,
	["Show Map"] = true,
	["Clean Map"] = true,
	
	["Error: MapNotes can't find the map."] = true,
	["Error: Map doesn't exist!"] = true,
	["No comments for this quest.\n\n"] = true,

} end)