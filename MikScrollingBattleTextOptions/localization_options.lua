-------------------------------------------------------------------------------------
-- Title: Mik's Scrolling Battle Text Options
-- Author: Mik
-- Maintainer: Athene
-------------------------------------------------------------------------------------

-- Create Options "namespace."
MikSBTOpt = {};


------------------------------
-- Interface messages
------------------------------

MikSBTOpt.MSG_INHERIT_TEXT					= "Inherit";
MikSBTOpt.MSG_NORMAL_PREVIEW_TEXT				= "Normal";
MikSBTOpt.MSG_CRIT_PREVIEW_TEXT				= "Crit";
MikSBTOpt.MSG_CURRENT_PROFILE_TEXT				= "Current Profile";
MikSBTOpt.MSG_SCROLL_AREA_PREVIEW_TEXT			= "Preview Message";


MikSBTOpt.MSG_EVENT_MESSAGE_LABEL_TOOLTIP				= "Click here to edit what output message will be displayed when the event occurs.\n\nAny event codes will be substituted with actual data."
MikSBTOpt.MSG_EVENT_MESSAGE_EDITBOX_TOOLTIP_PREFIX		= "Available Event Codes:\n\n";
MikSBTOpt.MSG_EVENT_COLOR_SWATCH_TOOLTIP				= "Allows you to pick the display color for the event.";
MikSBTOpt.MSG_EVENT_EDIT_FONT_SETTINGS_BUTTON_LABEL		= "Edit Fonts";
MikSBTOpt.MSG_EVENT_EDIT_FONT_SETTINGS_BUTTON_TOOLTIP		= "Edits the event's font settings.  These settings are inherited from the scroll area if they are set to inherit.";
MikSBTOpt.MSG_EVENT_STICKY_CHECKBOX_TOOLTIP			= "Sets whether or not to display this event using the sticky style.";
MikSBTOpt.MSG_EVENT_EDIT_TRIGGER_BUTTON_LABEL			= "Edit Trigger";
MikSBTOpt.MSG_EVENT_EDIT_TRIGGER_BUTTON_TOOLTIP			= "Edits the event's trigger settings.";
MikSBTOpt.MSG_EVENT_SOUND_BUTTON_TOOLTIP				= "Allows you to pick a sound to play when the event occurs.";
MikSBTOpt.MSG_TRIGGER_ENABLE_TOOLTIP				= "Sets whether or not the trigger is enabled."
MikSBTOpt.MSG_TRIGGER_MESSAGE_LABEL_TOOLTIP			= "Click here to edit what output message will be displayed when the trigger occurs."
MikSBTOpt.MSG_TRIGGER_MESSAGE_EDITBOX_TOOLTIP			= "Enter the output message to be displayed with the trigger occurs.";
MikSBTOpt.MSG_TRIGGER_STICKY_CHECKBOX_TOOLTIP			= "Sets whether or not to display this trigger using the sticky style.";
MikSBTOpt.MSG_TRIGGER_EDIT_FONT_SETTINGS_BUTTON_LABEL		= "Edit Fonts";
MikSBTOpt.MSG_TRIGGER_EDIT_FONT_SETTINGS_BUTTON_TOOLTIP	= "Edits the trigger's font settings.  These settings are inherited from the notification scroll area if they are set to inherit.";
MikSBTOpt.MSG_TRIGGER_EDIT_TRIGGER_SETTINGS_BUTTON_LABEL	= "Edit Trigger";
MikSBTOpt.MSG_TRIGGER_EDIT_TRIGGER_SETTINGS_BUTTON_TOOLTIP	= "Edits the trigger's settings.";
MikSBTOpt.MSG_TRIGGER_DELETE_TRIGGER_BUTTON_TOOLTIP		= "Deletes the trigger.";
MikSBTOpt.MSG_TRIGGER_APPLICABLE_CLASSES_LABEL			= "Applicable Trigger Classes:";
MikSBTOpt.MSG_TRIGGER_NEW_TRIGGER_DEFAULT_MESSAGE		= "New Trigger: Click here to edit.";
MikSBTOpt.MSG_SUPPRESSION_ENABLE_TOOLTIP				= "Sets whether or not the suppression is enabled.";
MikSBTOpt.MSG_SUPPRESSION_DELETE_SUPPRESSION_BUTTON_TOOLTIP	= "Deletes the suppression.";
MikSBTOpt.MSG_SUPPRESSION_MESSAGE_LABEL_TOOLTIP			= "Click here to edit the search pattern to suppress."
MikSBTOpt.MSG_SUPPRESSION_MESSAGE_EDITBOX_TOOLTIP		= "Enter the search pattern to be suppressed.";
MikSBTOpt.MSG_SUPPRESSION_NEW_SUPPRESSION_DEFAULT_MESSAGE	= "New Suppression: Click here to edit.";

-- Class Names.
MikSBTOpt.MSG_CLASS_NAME_DRUID	= "Druid";
MikSBTOpt.MSG_CLASS_NAME_HUNTER	= "Hunter";
MikSBTOpt.MSG_CLASS_NAME_MAGE		= "Mage";
MikSBTOpt.MSG_CLASS_NAME_PALADIN	= "Paladin";
MikSBTOpt.MSG_CLASS_NAME_PRIEST	= "Priest";
MikSBTOpt.MSG_CLASS_NAME_ROGUE	= "Rogue";
MikSBTOpt.MSG_CLASS_NAME_SHAMAN	= "Shaman";
MikSBTOpt.MSG_CLASS_NAME_WARLOCK	= "Warlock";
MikSBTOpt.MSG_CLASS_NAME_WARRIOR	= "Warrior";


------------------------------
-- Interface objects info
------------------------------

MikSBTOpt.TABS = {
 [1] = { Label="General", Tooltip="Display general options."},
 [2] = { Label="Incoming", Tooltip="Display options for the incoming scroll area."},
 [3] = { Label="Outgoing", Tooltip="Display options for the outgoing scroll area."},
 [4] = { Label="Notification", Tooltip="Display options for the notification scroll area."},
 [5] = { Label="Triggers", Tooltip="Display options for the trigger system."},
 [6] = { Label="Suppressions", Tooltip="Display options for the suppression system."},
};

MikSBTOpt.DROPDOWNS = {
 ["Tab1FrameProfileDropdown"]	= { Label="Profile", Tooltip="Selects the current profile."},
 ["ScrollAreaDropdown"]			= { Label="Scroll Area", Tooltip="Selects the scroll area to configure."},
 ["TextAlignDropdown"]			= { Label="Text Align", Tooltip="The alignment of the text for the scroll area."},
 ["AnimationStyleDropdown"]		= { Label="Animation Style", Tooltip="The animation style for the scroll area."},
 ["ScrollDirectionDropdown"]	= { Label="Scroll Direction", Tooltip="The scroll direction for the scroll area."},
 ["FontDropdown"] 				= { Label="Normal Font"},
 ["FontOutlineDropdown"]		= { Label="Normal Font Outline"},
 ["FontCritDropdown"]			= { Label="Crit Font"},
 ["FontOutlineCritDropdown"]	= { Label="Crit Font Outline"},
 ["TriggerTypeDropdown"]		= { Label="Trigger Type", Tooltip="Select the type of trigger."},
 ["StanceDropdown"]				= { Label="Required Stance", Tooltip="Select the stance required to enable this trigger."},
};

MikSBTOpt.CHECKBOXES = {
 ["Tab1FrameDisableCheckbox"]			= { Label="Disable Mik's Scrolling Battle Text", Tooltip="Sets whether or not MSBT is disabled."},
 ["Tab1FrameShowPartialEffectsCheckbox"]	= { Label="Show Partial Effects", Tooltip="Sets whether or not to show partial resists, absorbs, blocks, etc."},
 ["Tab1FrameShowAllManaGainsCheckbox"]	= { Label="Show All Mana Gains", Tooltip="Sets whether or not to show all mana gains: mp5, drinking, etc. |cffff0000(spammy !)"},
 ["Tab1FrameLowHealthSoundCheckbox"]	= { Label="Low Health Sound", Tooltip="Sets whether or not to play a sound when your health is low."},
 ["Tab1FrameLowManaSoundCheckbox"]		= { Label="Low Mana Sound", Tooltip="Sets whether or not to play a sound when your mana is low."},
 ["Tab1FrameUseStickyCritsCheckbox"]	= { Label="Display Crits Sticky", Tooltip="Sets whether or not to display crits using the sticky style."},
 ["Tab1FrameShowOverhealsCheckbox"]		= { Label="Show Overheals", Tooltip="Sets whether or not to display overhealing information."},
 ["Tab1FrameShowGameDamageCheckbox"]	= { Label="Show Game Damage", Tooltip="Sets whether or not to display the game's damage above the enemy's heads."},
 ["Tab2FrameShowEventsCheckbox"]		= { Label="Enable Incoming Events", Tooltip="Sets whether or not to enable incoming events."},
 ["Tab3FrameShowEventsCheckbox"]		= { Label="Enable Outgoing Events", Tooltip="Sets whether or not to enable outgoing events."},
 ["Tab4FrameShowEventsCheckbox"]		= { Label="Enable Notification Events", Tooltip="Sets whether or not to enable notification events."},
 ["InheritFontSizeCheckbox"] 			= { Label="Inherit Font Size"},
 ["InheritFontSizeCritCheckbox"]		= { Label="Inherit Crit Font Size"},
};

MikSBTOpt.SLIDERS = {
 ["Tab1FrameAnimationStepSlider"]	= { Label="Animation Speed", Tooltip="Sets the speed of the animation."},
 ["ScrollHeightSlider"]			= { Label="Scroll Height", Tooltip="The height of the scroll area."}, 
 ["FontSizeSlider"]			= { Label="Font Size"},
 ["FontSizeCritSlider"]			= { Label="Font Crit Size"},
 ["ThresholdSlider"]			= { Label="Threshold Percentage", Tooltip="Sets the threshold percentage which must be passed for the trigger to fire."},
};

MikSBTOpt.BUTTONS = {
 ["Tab1FrameEditFontSettingsButton"]	= { Label="Edit Master Font Settings", Tooltip="Edits the master font settings.  These settings will be inherited by each scroll area and the events therein unless they are overridden."},
 ["Tab1FrameEditBlizzardFontSettingsButton"]	= { Label="Edit Game Damage Font", Tooltip="Edits Blizzard's scrolling text font settings."},
 ["Tab2FrameEditFontSettingsButton"]	= { Label="Edit Scroll Area Fonts", Tooltip="Edits the incoming scroll area font settings.  These settings will be inherited by each event in the incoming scroll area unless they are overridden."},
 ["Tab3FrameEditFontSettingsButton"]	= { Label="Edit Scroll Area Fonts", Tooltip="Edits the outgoing scroll area font settings.  These settings will be inherited by each event in the outgoing scroll area unless they are overridden."},
 ["Tab4FrameEditFontSettingsButton"]	= { Label="Edit Scroll Area Fonts", Tooltip="Edits the notification scroll area font settings.  These settings will be inherited by each event in the notification scroll area unless they are overridden."},
 ["Tab1FrameLoadProfileButton"]		= { Label="Load Profile", Tooltip="Loads the selected profile."},
 ["Tab1FrameDeleteProfileButton"]		= { Label="Delete Profile", Tooltip="Deletes the selected profile."},
 ["Tab1FrameResetProfileButton"]		= { Label="Reset Profile", Tooltip="Resets the selected profile to the default settings."},
 ["Tab1FrameCreateProfileButton"]		= { Label="Create Profile", Tooltip="Creates a new profile with the default settings."},
 ["Tab2FrameConfigureScrollAreaButton"]	= { Label="Configure Scroll Area", Tooltip="Allows you to configure the animation style, scroll direction, text align, scroll height, and location of the scroll areas."},
 ["PreviewButton"] 				= { Label="Preview", Tooltip="Previews a test message in all the scrolling areas."},
 ["SaveButton"]					= { Label="Save Settings", Tooltip="Saves the new settings for the scroll areas."},
 ["CancelButton"] 				= { Label="Cancel", Tooltip="Cancels the changes."},
 ["Tab5FrameAddTriggerButton"]		= { Label="Add New Trigger", Tooltip="Adds a new trigger that can be configured."},
 ["SaveTriggerButton"]				= { Label="Save Settings", Tooltip="Saves the settings for the trigger."},
 ["CancelTriggerButton"]			= { Label="Cancel", Tooltip="Cancels the changes."},
 ["Tab6FrameAddSuppressionButton"]		= { Label="Add New Suppression", Tooltip="Adds a new suppression."},
};

MikSBTOpt.EDITBOXES = {
 ["Tab1FrameNewProfileNameEditbox"]	= { Label="New Profile Name", Tooltip="Allows you to enter the name of a new profile."},
 ["XOffsetEditbox"]			= { Label="X Offset", Tooltip="Allows you to enter the X offset of the selected scroll frame."},
 ["YOffsetEditbox"]			= { Label="Y Offset", Tooltip="Allows you to enter the Y offset of the selected scroll frame."},
 ["IconNameEditbox"]			= { Label="Icon Path", Tooltip="Allows you to enter the path of the file to display as icon."},
 ["SearchPattern1Editbox"]		= { Label="Search Pattern 1", Tooltip="Allows you to enter a search pattern that will cause the trigger to fire."},
 ["SearchPattern2Editbox"]		= { Label="Search Pattern 2", Tooltip="Allows you to enter a search pattern that will cause the trigger to fire."},
};

MikSBTOpt.FRAMES = {
 ["MSBTScrollAreaMoverIncomingFrame"]	= { Tooltip="Indicates the anchor column for the incoming scroll area.  Drag this frame to the location you want or use the control frame x and y offset edit boxes."},
 ["MSBTScrollAreaMoverOutgoingFrame"]	= { Tooltip="Indicates the anchor column for the outgoing scroll area.  Drag this frame to the location you want or use the control frame x and y offset edit boxes."},
 ["MSBTScrollAreaMoverNotificationFrame"]	= { Tooltip="Indicates the anchor column for the notification scroll area.  Drag this frame to the location you want or use the control frame x and y offset edit boxes."},
}

MikSBTOpt.FONT_SETTINGS_TOOLTIPS = {
 ["Master"] = {
  FontSettingsTitle="Master",
  Font="Set the master font for non-crits.  This will be inherited by each scroll area and its events.",
  FontCrit="Set the master font for crits.  This will be inherited by each scroll area and its events.",
  Outline="Set the master font outline for non-crits.  This will be inherited by each scroll area and its events.",
  OutlineCrit="Set the master font outline for crits.  This will be inherited by each scroll area and its events.",
  FontSize="Set the master font size for non-crits.  This will be inherited by each scroll area and its events.",
  FontSizeCrit="Set the master font size for crits.  This will be inherited by each scroll area and its events.",
 },
 ["ScrollArea"] = {
  Font="Set the scroll area font for non-crits.  This will be inherited by each event in the scroll area.",
  FontCrit="Set the scroll area font for crits.  This will be inherited by each event in the scroll area.",
  Outline="Set the scroll area font outline for non-crits.  This will be inherited by each event in the scroll area.",
  OutlineCrit="Set the scroll area font outline for crits.  This will be inherited by each event in the scroll area.",
  InheritFontSize="Set whether or not to inherit the font size for non-crits from the master font settings.",
  InheritFontSizeCrit="Set whether or not to inherit the font size for crits from the master font settings.",
  FontSize="Set the scroll area font size for non-crits.  This will be inherited by each event in the scroll area.",
  FontSizeCrit="Set the scroll area font size for crits.  This will be inherited by each event in the scroll area.",
 },
 ["Event"] = {
  Font="Set the event font for non-crits.",
  FontCrit="Set the event font for crits.",
  Outline="Set the event font outline for non-crits.",
  OutlineCrit="Set the event font outline for crits.",
  InheritFontSize="Set whether or not to inherit the font size for non-crits from the scroll area font settings.",
  InheritFontSizeCrit="Set whether or not to inherit the font size for crits from the scroll area font settings.",
  FontSize="Set the event font size for non-crits.",
  FontSizeCrit="Set the event font size for crits.",
 },
 ["Trigger"] = {
  Font="Set the triger font.",
  Outline="Set the trigger font outline.",
  InheritFontSize="Set whether or not to inherit the font size from the notification scroll area font settings.",
  FontSize="Set the trigger font size.",
 },
 ["Blizzard"] = {
  FontSettingsTitle="Blizzard",
  Font="Set the Blizzard scrolling texts font.",
 }
}

MikSBTOpt.INCOMING_EVENTS = {
 [1]	= { Label="Melee Damage", Tooltips={ShowCheckbox="Sets whether or not to show incoming melee damage.", Editbox="%a - Amount of damage taken.\n%n - Name of the attacker."}},
 [2]	= { Label="Melee Misses", Tooltips={ShowCheckbox="Sets whether or not to show incoming melee misses.", Editbox="%n - Name of the attacker."}},
 [3]	= { Label="Melee Dodges", Tooltips={ShowCheckbox="Sets whether or not to show incoming melee dodges.", Editbox="%n - Name of the attacker."}},
 [4]	= { Label="Melee Parries", Tooltips={ShowCheckbox="Sets whether or not to show incoming melee parries.", Editbox="%n - Name of the attacker."}},
 [5]	= { Label="Melee Blocks", Tooltips={ShowCheckbox="Sets whether or not to show incoming melee blocks.", Editbox="%n - Name of the attacker."}},
 [6]	= { Label="Melee Absorbs", Tooltips={ShowCheckbox="Sets whether or not to show absorbed incoming melee damage.", Editbox="%n - Name of the attacker."}},
 [7]	= { Label="Melee Immunes", Tooltips={ShowCheckbox="Sets whether or not to show incoming melee damage you are immune to.", Editbox="%n - Name of the attacker."}},
 [8]	= { Label="Ability/Spell Damage", Tooltips={ShowCheckbox="Sets whether or not to show incoming spell and ability damage.", Editbox="%a - Amount of damage taken.\n%n - Name of the attacker.\n%s - Name of the spell or ability.\n%t - Type of damage taken."}},
 [9]	= { Label="Ability/Spell DoTs", Tooltips={ShowCheckbox="Sets whether or not to show incoming spell and ability damage over time.", Editbox="%a - Amount of damage taken.\n%n - Name of the attacker.\n%s - Name of the spell or ability.\n%t - Type of damage taken."}},
 [10]	= { Label="Ability Misses", Tooltips={ShowCheckbox="Sets whether or not to show incoming ability misses.", Editbox="%n - Name of the attacker.\n%s - Name of the ability."}},
 [11]	= { Label="Ability Dodges", Tooltips={ShowCheckbox="Sets whether or not to show incoming ability dodges.", Editbox="%n - Name of the attacker.\n%s - Name of the ability."}},
 [12]	= { Label="Ability Parries", Tooltips={ShowCheckbox="Sets whether or not to show incoming ability parries.", Editbox="%n - Name of the attacker.\n%s - Name of the ability."}},
 [13]	= { Label="Ability Blocks", Tooltips={ShowCheckbox="Sets whether or not to show incoming ability blocks.", Editbox="%n - Name of the attacker.\n%s - Name of the ability."}},
 [14] = { Label="Spell Resists", Tooltips={ShowCheckbox="Sets whether or not to show incoming spell resists.", Editbox="%n - Name of the attacker.\n%s - Name of the spell."}},
 [15] = { Label="Ability/Spell Absorbs", Tooltips={ShowCheckbox="Sets whether or not to show absorbed damage from incoming spells and abilities.", Editbox="%n - Name of the attacker.\n%s - Name of the spell or ability."}},
 [16] = { Label="Ability/Spell Immunes", Tooltips={ShowCheckbox="Sets whether or not to show incoming spell and ability damage you are immune to.", Editbox="%n - Name of the attacker.\n%s - Name of the spell or ability."}},
 [17] = { Label="Ability/Spell Reflects", Tooltips={ShowCheckbox="Sets whether or not to show incoming spell and ability damage you reflected.", Editbox="%n - Name of the attacker.\n%s - Name of the spell or ability."}},
 [18] = { Label="Heals", Tooltips={ShowCheckbox="Sets whether or not to show incoming heals.", Editbox="%a - Amount of healing taken.\n%n - Name of the healer.\n%s - Name of the spell."}},
 [19] = { Label="Heals Over Time", Tooltips={ShowCheckbox="Sets whether or not to show incoming heals over time.", Editbox="%a - Amount of healing taken.\n%n - Name of the healer.\n%s - Name of the spell."}},
 [20] = { Label="Environmental Damage", Tooltips={ShowCheckbox="Sets whether or not to show environmental (falling, drowning, lava, etc...) damage.", Editbox="%a - Amount of damage taken.\n%s - Name of the source of the damage (falling, drowning, lava, etc...)"}},
 [21] = { Label="Pet Melee Damage", Tooltips={ShowCheckbox="Sets whether or not to show incoming melee damage on your pet.", Editbox="%a - Amount of damage taken.\n%n - Name of the attacker."}},
 [22] = { Label="Pet Melee Misses", Tooltips={ShowCheckbox="Sets whether or not to show incoming melee misses on your pet.", Editbox="%n - Name of the attacker."}},
 [23] = { Label="Pet Melee Dodges", Tooltips={ShowCheckbox="Sets whether or not to show incoming melee dodges on your pet.", Editbox="%n - Name of the attacker."}},
 [24] = { Label="Pet Melee Parries", Tooltips={ShowCheckbox="Sets whether or not to show incoming melee parries on your pet.", Editbox="%n - Name of the attacker."}},
 [25] = { Label="Pet Melee Blocks", Tooltips={ShowCheckbox="Sets whether or not to show incoming melee blocks on your pet.", Editbox="%n - Name of the attacker."}},
 [26] = { Label="Pet Melee Absorbs", Tooltips={ShowCheckbox="Sets whether or not to show absorbed incoming melee damage on your pet.", Editbox="%n - Name of the attacker."}},
 [27] = { Label="Pet Melee Immunes", Tooltips={ShowCheckbox="Sets whether or not to show incoming melee damage your pet is immune to.", Editbox="%n - Name of the attacker."}},
 [28] = { Label="Pet Ability/Spell Damage", Tooltips={ShowCheckbox="Sets whether or not to show incoming spell and ability damage on your pet.", Editbox="%a - Amount of damage taken.\n%n - Name of the attacker.\n%s - Name of the spell or ability.\n%t - Type of damage taken."}},
 [29] = { Label="Pet Ability/Spell DoTs", Tooltips={ShowCheckbox="Sets whether or not to show incoming spell and ability damage over time on your pet.", Editbox="%a - Amount of damage taken.\n%n - Name of the attacker.\n%s - Name of the spell or ability.\n%t - Type of damage taken."}},
 [30] = { Label="Pet Ability Misses", Tooltips={ShowCheckbox="Sets whether or not to show incoming ability misses on your pet.", Editbox="%n - Name of the attacker.\n%s - Name of the ability."}},
 [31] = { Label="Pet Ability Dodges", Tooltips={ShowCheckbox="Sets whether or not to show incoming ability dodges on your pet.", Editbox="%n - Name of the attacker.\n%s - Name of the ability."}},
 [32] = { Label="Pet Ability Parries", Tooltips={ShowCheckbox="Sets whether or not to show incoming ability parries on your pet.", Editbox="%n - Name of the attacker.\n%s - Name of the ability."}},
 [33] = { Label="Pet Ability Blocks", Tooltips={ShowCheckbox="Sets whether or not to show incoming ability blocks on your pet.", Editbox="%n - Name of the attacker.\n%s - Name of the ability."}},
 [34] = { Label="Pet Spell Resists", Tooltips={ShowCheckbox="Sets whether or not to show incoming spell resists on your pet.", Editbox="%n - Name of the attacker.\n%s - Name of the spell."}},
 [35] = { Label="Pet Ability/Spell Absorbs", Tooltips={ShowCheckbox="Sets whether or not to show absorbed damage from incoming spells and abilities on your pet.", Editbox="%n - Name of the attacker.\n%s - Name of the spell or ability."}},
 [36] = { Label="Pet Ability/Spell Immunes", Tooltips={ShowCheckbox="Sets whether or not to show incoming spell and ability damage your pet is immune to.", Editbox="%n - Name of the attacker.\n%s - Name of the spell or ability."}},
 [37] = { Label="Pet Heals", Tooltips={ShowCheckbox="Sets whether or not to show incoming heals on your pet.", Editbox="%a - Amount of healing taken.\n%n - Name of the healer.\n%s - Name of the spell."}},
 [38] = { Label="Pet Heals Over Time", Tooltips={ShowCheckbox="Sets whether or not to show incoming heals over time on your pet.", Editbox="%a - Amount of healing taken.\n%n - Name of the healer.\n%s - Name of the spell."}},
};

MikSBTOpt.OUTGOING_EVENTS = {
 [1]	= { Label="Melee Damage", Tooltips={ShowCheckbox="Sets whether or not to show outgoing melee damage.", Editbox="%a - Amount of damage done.\n%n - Name of the attacked unit."}},
 [2]	= { Label="Melee Misses", Tooltips={ShowCheckbox="Sets whether or not to show outgoing melee misses.", Editbox="%n - Name of the attacked unit."}},
 [3]	= { Label="Melee Dodges", Tooltips={ShowCheckbox="Sets whether or not to show outgoing melee dodges.", Editbox="%n - Name of the attacked unit."}},
 [4]	= { Label="Melee Parries", Tooltips={ShowCheckbox="Sets whether or not to show outgoing melee parries.", Editbox="%n - Name of the attacked unit."}},
 [5]	= { Label="Melee Blocks", Tooltips={ShowCheckbox="Sets whether or not to show outgoing melee blocks.", Editbox="%n - Name of the attacked unit."}},
 [6]	= { Label="Melee Absorbs", Tooltips={ShowCheckbox="Sets whether or not to show absorbed outgoing melee damage.", Editbox="%n - Name of the attacked unit."}},
 [7]	= { Label="Melee Immunes", Tooltips={ShowCheckbox="Sets whether or not to show outgoing melee damage the enemy is immune to.", Editbox="%n - Name of the attacked unit."}},
 [8]	= { Label="Melee Evades", Tooltips={ShowCheckbox="Sets whether or not to show outgoing melee evades.", Editbox="%n - Name of the attacked unit."}},
 [9]	= { Label="Ability/Spell Damage", Tooltips={ShowCheckbox="Sets whether or not to show outgoing spell and ability damage.", Editbox="%a - Amount of damage done.\n%n - Name of the attacked unit.\n%s - Name of the spell or ability.\n%t - Type of damage done."}},
 [10]	= { Label="Ability/Spell DoTs", Tooltips={ShowCheckbox="Sets whether or not to show outgoing spell and ability damage over time.", Editbox="%a - Amount of damage done.\n%n - Name of the attacked unit.\n%s - Name of the spell or ability.\n%t - Type of damage done."}},
 [11]	= { Label="Ability Misses", Tooltips={ShowCheckbox="Sets whether or not to show outgoing ability misses.", Editbox="%n - Name of the attacked unit.\n%s - Name of the ability."}},
 [12]	= { Label="Ability Dodges", Tooltips={ShowCheckbox="Sets whether or not to show outgoing ability dodges.", Editbox="%n - Name of the attacked unit.\n%s - Name of the ability."}},
 [13]	= { Label="Ability Parries", Tooltips={ShowCheckbox="Sets whether or not to show outgoing ability parries.", Editbox="%n - Name of the attacked unit.\n%s - Name of the ability."}},
 [14]	= { Label="Ability Blocks", Tooltips={ShowCheckbox="Sets whether or not to show outgoing ability blocks.", Editbox="%n - Name of the attacked unit.\n%s - Name of the ability."}},
 [15] = { Label="Spell Resists", Tooltips={ShowCheckbox="Sets whether or not to show outgoing spell resists.", Editbox="%n - Name of the attacked unit.\n%s - Name of the spell."}},
 [16] = { Label="Ability/Spell Absorbs", Tooltips={ShowCheckbox="Sets whether or not to show absorbed damage from outgoing spells and abilities.", Editbox="%n - Name of the attacked unit.\n%s - Name of the spell or ability."}},
 [17] = { Label="Ability/Spell Immunes", Tooltips={ShowCheckbox="Sets whether or not to show outgoing spell and ability damage the enemy is immune to.", Editbox="%n - Name of the attacked unit.\n%s - Name of the spell or ability."}},
 [18] = { Label="Ability/Spell Reflects", Tooltips={ShowCheckbox="Sets whether or not to show outgoing spell and ability damage reflected back to you.", Editbox="%n - Name of the attacked unit.\n%s - Name of the spell or ability."}},
 [19] = { Label="Ability/Spell Evades", Tooltips={ShowCheckbox="Sets whether or not to show outgoing spell and ability evades.", Editbox="%n - Name of the attacked unit.\n%s - Name of the spell or ability."}},
 [20] = { Label="Heals", Tooltips={ShowCheckbox="Sets whether or not to show outgoing heals.", Editbox="%a - Amount of healing done.\n%n - Name of the healed unit.\n%s - Name of the spell."}},
 [21] = { Label="Heals Over Time", Tooltips={ShowCheckbox="Sets whether or not to show outgoing heals over time.", Editbox="%a - Amount of healing done.\n%n - Name of the healed unit.\n%s - Name of the spell."}},
 [22] = { Label="Pet Melee Damage", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing melee damage.", Editbox="%a - Amount of damage done.\n%n - Name of the attacked unit."}},
 [23]	= { Label="Pet Melee Misses", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing melee misses.", Editbox="%n - Name of the attacked unit."}},
 [24]	= { Label="Pet Melee Dodges", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing melee dodges.", Editbox="%n - Name of the attacked unit."}},
 [25]	= { Label="Pet Melee Parries", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing melee parries.", Editbox="%n - Name of the attacked unit."}},
 [26]	= { Label="Pet Melee Blocks", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing melee blocks.", Editbox="%n - Name of the attacked unit."}},
 [27]	= { Label="Pet Melee Absorbs", Tooltips={ShowCheckbox="Sets whether or not to show your pet's absorbed outgoing melee damage.", Editbox="%n - Name of the attacked unit."}},
 [28]	= { Label="Pet Melee Immunes", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing melee damage the enemy is immune to.", Editbox="%n - Name of the attacked unit."}},
 [29]	= { Label="Pet Melee Evades", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing melee evades.", Editbox="%n - Name of the attacked unit."}},
 [30]	= { Label="Pet Ability/Spell Damage", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing spell and ability damage.", Editbox="%a - Amount of damage done.\n%n - Name of the attacked unit.\n%s - Name of the spell or ability.\n%t - Type of damage done."}},
 [31]	= { Label="Pet Ability Misses", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing ability misses.", Editbox="%n - Name of the attacked unit.\n%s - Name of the ability."}},
 [32]	= { Label="Pet Ability Dodges", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing ability dodges.", Editbox="%n - Name of the attacked unit.\n%s - Name of the ability."}},
 [33]	= { Label="Pet Ability Parries", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing ability parries.", Editbox="%n - Name of the attacked unit.\n%s - Name of the ability."}},
 [34]	= { Label="Pet Ability Blocks", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing ability blocks.", Editbox="%n - Name of the attacked unit.\n%s - Name of the ability."}},
 [35] = { Label="Pet Spell Resists", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing spell resists.", Editbox="%n - Name of the attacked unit.\n%s - Name of the spell."}},
 [36] = { Label="Pet Ability/Spell Absorbs", Tooltips={ShowCheckbox="Sets whether or not to show your pet's absorbed damage from outgoing spells and abilities.", Editbox="%n - Name of the attacked unit.\n%s - Name of the spell or ability."}},
 [37] = { Label="Pet Ability/Spell Immunes", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing spell and ability damage the enemy is immune to.", Editbox="%n - Name of the attacked unit.\n%s - Name of the spell or ability."}},
 [38] = { Label="Pet Ability/Spell Evades", Tooltips={ShowCheckbox="Sets whether or not to show your pet's outgoing spell and ability evades.", Editbox="%n - Name of the attacked unit.\n%s - Name of the spell or ability."}},
};

MikSBTOpt.NOTIFICATION_EVENTS = {
 [1]	= { Label="Debuffs", Tooltips={ShowCheckbox="Sets whether or not to show debuffs you are afflicted by.", Editbox="%s - Name of the debuff."}},
 [2]	= { Label="Buffs", Tooltips={ShowCheckbox="Sets whether or not to show buffs you receive.", Editbox="%s - Name of the buff."}},
 [3]	= { Label="Item Buffs", Tooltips={ShowCheckbox="Sets whether or not to show buffs your items receive.", Editbox="%s - Name of the item buff."}},
 [4]	= { Label="Buff Fades", Tooltips={ShowCheckbox="Sets whether or not to show buffs and debuffs that have faded from you.", Editbox="%s - Name of the buff/debuff."}},
 [5]	= { Label="Enter Combat", Tooltips={ShowCheckbox="Sets whether or not to show when you have entered combat.", Editbox="None."}},
 [6]	= { Label="Leave Combat", Tooltips={ShowCheckbox="Sets whether or not to show when you have left combat.", Editbox="None."}},
 [7]	= { Label="Power Gains", Tooltips={ShowCheckbox="Sets whether or not to show when you gain extra mana, rage, or energy.", Editbox="%a - Amount of energy gained.\n%s - Type of power gained (energy, rage, mana)."}},
 [8]	= { Label="Power Losses", Tooltips={ShowCheckbox="Sets whether or not to show when you lose mana, rage, or energy from drains.", Editbox="%a - Amount of energy lost.\n%s - Type of power lost (energy, rage, mana)."}},
 [9]	= { Label="Combo Point Gains", Tooltips={ShowCheckbox="Sets whether or not to show when you gain combo points.", Editbox="%a - Amount of combo points you have."}},
 [10]	= { Label="Combo Points Full", Tooltips={ShowCheckbox="Sets whether or not to show when you attain full combo points.", Editbox="%a - Amount of combo points you have."}},
 [11]	= { Label="Honor Gains", Tooltips={ShowCheckbox="Sets whether or not to show when you gain honor.", Editbox="%a - Amount of honor you gained."}},
 [12]	= { Label="Reputation Gains", Tooltips={ShowCheckbox="Sets whether or not to show when you gain reputation.", Editbox="%a - Amount of reputation you gained.\n%s - Name of the faction."}},
 [13]	= { Label="Reputation Losses", Tooltips={ShowCheckbox="Sets whether or not to show when you lose reputation.", Editbox="%a - Amount of reputation you lost.\n%s - Name of the faction."}},
 [14]	= { Label="Skill Gains", Tooltips={ShowCheckbox="Sets whether or not to show when you gain skill points.", Editbox="%a - Amount of points you have in the skill.\n%s - Name of the skill."}},
 [15]	= { Label="Experience Gains", Tooltips={ShowCheckbox="Sets whether or not to show when you gain experience points.", Editbox="%a - Amount of experience you gained."}},
 [16]	= { Label="Player Killing Blows", Tooltips={ShowCheckbox="Sets whether or not to show when you get a killing blow against a hostile player.", Editbox="%s - Name of the unit killed."}},
 [17]	= { Label="NPC Killing Blows", Tooltips={ShowCheckbox="Sets whether or not to show when you get a killing blow against an NPC.", Editbox="%s - Name of the unit killed."}},
};