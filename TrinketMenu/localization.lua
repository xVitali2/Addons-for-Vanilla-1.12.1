--[[ TrinketMenuOpt.lua : Options and sort window for TrinketMenu ]]

TrinketMenu.CheckOptInfo = {
	{"ShowIcon","ON","Minimap Button","Show or hide minimap button."},
	{"SquareMinimap","OFF","Square Minimap","Move minimap button as if around a square minimap.","ShowIcon"},
	{"CooldownCount","OFF","Cooldown Numbers","Display time remaining on cooldowns ontop of the button."},
	{"TooltipFollow","OFF","At Mouse","Display all tooltips near the mouse.","ShowTooltips"},
	{"KeepOpen","OFF","Keep Menu Open","Keep menu open at all times."},
	{"KeepDocked","ON","Keep Menu Docked","Keep menu docked at all times."},
	{"Notify","OFF","Notify When Ready","Sends an overhead notification when a trinket's cooldown is complete."},
	{"DisableToggle","OFF","Disable Toggle","Disables the minimap button's ability to toggle the trinket frame.","ShowIcon"},
	{"NotifyChatAlso","OFF","Notify Chat Also","Sends notifications through chat also."},
	{"Locked","OFF","Lock Windows","Prevents the windows from being moved, resized or rotated."},
	{"ShowTooltips","ON","Show Tooltips","Shows tooltips."},
	{"NotifyThirty","ON","Notify At 30 sec","Sends an overhead notification when a trinket has 30 seconds left on cooldown."},
	{"MenuOnShift","OFF","Menu On Shift","Check this to prevent the menu appearing unless Shift is held."},
	{"TinyTooltips","OFF","Tiny Tooltips","Shrink trinket tooltips to only their name, charges and cooldown.","ShowTooltips"},
	{"SetColumns","OFF","Set Menu Columns","Define how many trinkets before the menu will wrap to the next row.\n\nUncheck to let TrinketMenu choose how to wrap the menu."},
	{"LargeCooldown","ON","Large Numbers","Display the cooldown time in a larger font.","CooldownCount"},
	{"ShowHotKeys","ON","Show Key Bindings","Display the key bindings over the equipped trinkets."},
	{"StopOnSwap","OFF","Stop Queue On Swap","Swapping a passive trinket stops an auto queue.  Check this to also stop the auto queue when a clickable trinket is manually swapped in via TrinketMenu.  This will have the most use to those with frequent trinkets marked Priority."},
	{"HideOnLoad","OFF","Close On Profile Load","Check this to dismiss this window when you load a profile."}
}

-- table.insert(TrinketMenu.CheckOptInfo,)

TrinketMenu.TooltipInfo = {
	{"TrinketMenu_LockButton","Lock Windows","Prevents the windows from being moved, resized or rotated."},
	{"TrinketMenu_Trinket0Check","Top Trinket Auto Queue","Check this to enable auto queue for this trinket slot.  You can also Alt+Click the trinket slot to toggle Auto Queue."},
	{"TrinketMenu_Trinket1Check","Bottom Trinket Auto Queue","Check this to enable auto queue for this trinket slot.  You can also Alt+Click the trinket slot to toggle Auto Queue."},
	{"TrinketMenu_SortPriority","High Priority","When checked, this trinket will be swapped in as soon as possible, whether the equipped trinket is on cooldown or not.\n\nWhen unchecked, this trinket will not equip over one already worn that's not on cooldown."},
	{"TrinketMenu_SortDelay","Swap Delay","This is the time (in seconds) before a trinket will be swapped out.  ie, for Earthstrike you want 20 seconds to get the full 20 second effect of the buff."},		{"TrinketMenu_SortKeepEquipped","Pause Queue","Check this to suspend the auto queue while this trinket is equipped. ie, for Carrot on a Stick if you have a mod to auto-equip it to a slot with Auto Queue active."},
	{"TrinketMenu_SortKeepEquipped","Pause Queue","Check this to suspend the auto queue while this trinket is equipped. ie, for Carrot on a Stick if you have a mod to auto-equip it to a slot with Auto Queue active."},
	{"TrinketMenu_Profiles","Profiles","Here you can load or save auto queue profiles."},
	{"TrinketMenu_Delete","Delete","Remove this trinket from the list.  Trinkets further down the list don't affect performance at all.  This option is merely to keep the list managable. Note: Trinkets in your bags will return to end of the list."},
	{"TrinketMenu_ProfilesDelete","Delete Profile","Remove this profile."},
	{"TrinketMenu_ProfilesLoad","Load Profile","Load a queue order for the selected trinket slot.  You can double-click a profile to load it also."},
	{"TrinketMenu_ProfilesSave","Save Profile","Save the queue order from the selected trinket slot.  Either trinket slot can use saved profiles."},
	{"TrinketMenu_ProfileName","Profile Name","Enter a name to call the profile.  When saved, you can load this profile to either trinket slot."},
}

TRINKETMENU_TRNKETS = " trinkets"

-- TrinketMenuQueue.lua
TRINKETMENU_PRIORITY = "Priority"
TRINKETMENU_PAUSE_QUEUE = "Pause Queue"
TRINKETMENU_STOP_QUEUE = "-- stop queue here --"
TRINKETMENU_STOP_QUEUE_TOOLTIP1 = "Stop Queue Here"
TRINKETMENU_STOP_QUEUE_TOOLTIP2 = "Move this to mark the lowest trinket to auto queue. Sometimes you may want a passive trinket with a click effect to be the end (Burst of Knowledge, Second Wind, etc)."

TRINKETMENU_ERROR_MSG = "|cFFBBBBBBTrinketMenu:|cFFFFFFFF "
TRINKETMENU_ERROR_MSG1 = "First parameter must be 0 for top trinket or 1 for bottom."
TRINKETMENU_ERROR_MSG2 = "Second parameter is either ON, OFF, PAUSE, RESUME or the beginning of a list of trinkets in a sort order."
TRINKETMENU_ERROR_MSG3 = "Trinket or profile \""
TRINKETMENU_ERROR_MSG4 = "\" not found."
TRINKETMENU_ERROR_MSG5 = " Expected ON, OFF, PAUSE, RESUME or SORT+list"
TRINKETMENU_ERROR_MSG6 = "|cFFBBBBBBTrinketMenu.GetQueue:|cFFFFFFFF Parameter must be 0 for top trinket or 1 for bottom."
TRINKETMENU_ERROR_MSG7 = "No profiles saved yet."

-- TrinketMenu.lua
TRINKETMENU_ADDON_LOAD = "|cFFFFFF00TrinketMenu load:"
TRINKETMENU_CMD_LOAD = "/trinket load (top|bottom) profilename\nie: /trinket load bottom PvP"

TRINKETMENU_CMDS = "|cFFFFFF00TrinketMenu useage:"
TRINKETMENU_CMD1 = "/trinket or /trinketmenu : toggle the window"
TRINKETMENU_CMD2 = "/trinket reset : reset all settings"
TRINKETMENU_CMD3 = "/trinket opt : summon options window"
TRINKETMENU_CMD4 = "/trinket lock|unlock : toggles window lock"
TRINKETMENU_CMD5 = "/trinket scale main|menu (number) : sets an exact scale"
TRINKETMENU_CMD6 = "/trinket load top|bottom profilename : loads a profile to top or bottom trinket"

TRINKETMENU_CMD_SCALES = "|cFFFFFF00TrinketMenu scale:"
TRINKETMENU_CMD_SCALE1 = "/trinket scale main (number) : set exact main scale"
TRINKETMENU_CMD_SCALE2 = "/trinket scale menu (number) : set exact menu scale"
TRINKETMENU_CMD_SCALE3 = "ie, /trinket scale menu 0.85"
TRINKETMENU_CMD_SCALE4 = "Note: You can drag the lower-right corner of either window to scale.  This slash command is for those who want to set an exact scale."

TRINKETMENU_RESET = "Are you sure you want to reset TrinketMenu to default state and reload the UI?"
TRINKETMENU_YES = "Yes"
TRINKETMENU_NO = "No"

-- TrinketMenuOpt.xml
TRINKETMENU_OPTIONS = "Options"
TRINKETMENU_MINIMAP_TOOLTIP1 = "Click: toggle options\nDrag: move icon"
TRINKETMENU_MINIMAP_TOOLTIP2 = "Left click: toggle trinkets\nRight click: toggle options\nDrag: move icon"
TRINKETMENU_5_TRINKETS = "5 trinkets"

-- TrinketMenuQueue.xml
TRINKETMENU_PROFILENAME = "Profile name"
TRINKETMENU_BUTTOM = "Bottom      "
TRINKETMENU_TOP = "Top      "
TRINKETMENU_DELAY = "Delay"
TRINKETMENU_SEC = "sec"
TRINKETMENU_PROFILE = "Profile"
TRINKETMENU_DELETE = "Delete"	
TRINKETMENU_LOAD = "Load"
TRINKETMENU_SAVE = "Save"
TRINKETMENU_CANCEL = "Cancel"
	
-- Bindings.xml
BINDING_NAME_TRINKETMENU_TOGGLE = "Toggle TrinketMenu"
BINDING_NAME_TRINKETMENU_TOP = "Use Top Trinket"
BINDING_NAME_TRINKETMENU_BOTTOM = "Use Bottom Trinket"