-------------------------------------------------------------------------------------
-- Title: Mik's Scrolling Battle Text Options
-- Author: Mik
-- Maintainer: Athene
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
-- Local Constants.
-------------------------------------------------------------------------------------

-- The name of the options frame.
local OPTIONS_FRAME_NAME = "MSBTFrameOptions";

-- The name of the font settings frame.
local FONT_SETTINGS_FRAME_NAME = "MSBTFontSettingsFrame";

-- The name of the scroll area frames.
local SCROLL_AREA_MOVER_FRAME_NAME = "MSBTScrollAreaMoverFrame";
local SCROLL_AREA_MOVER_CONTROL_FRAME_NAME = "MSBTScrollAreaMoverControlFrame";
local SCROLL_AREA_MOVER_INCOMING_FRAME_NAME = "MSBTScrollAreaMoverIncomingFrame";
local SCROLL_AREA_MOVER_OUTGOING_FRAME_NAME = "MSBTScrollAreaMoverOutgoingFrame";
local SCROLL_AREA_MOVER_NOTIFICATION_FRAME_NAME = "MSBTScrollAreaMoverNotificationFrame";

-- The name of the trigger configuration frame.
local TRIGGER_CONFIGURATION_FRAME_NAME = "MSBTTriggerConfigFrame";


-- The min and max font sizes allowed.
local MIN_FONT_SIZE = 12;
local MAX_FONT_SIZE = 32;

-- The min and max animation steps.
local MIN_ANIMATION_STEP = 1;
local MAX_ANIMATION_STEP = 5;

-- The min and max scroll heights.
local MIN_SCROLL_HEIGHT = 100;
local MAX_SCROLL_HEIGHT = 600;

-- The size of an event settings line and number of event items per page.
local EVENT_ITEM_HEIGHT = 25;
local EVENT_ITEMS_PER_PAGE = 10;

-- The size of a trigger settings line and number of trigger items per page.
local TRIGGER_ITEM_HEIGHT = 25;
local TRIGGER_ITEMS_PER_PAGE = 11;

-- The size of a trigger event line and the number of trigger event items per page.
local TRIGGER_EVENT_ITEM_HEIGHT = 25;
local TRIGGER_EVENT_ITEMS_PER_PAGE = 4;

-- The size of a suppressions settings line and number of suppression items per page.
local SUPPRESSION_ITEM_HEIGHT = 25;
local SUPPRESSION_ITEMS_PER_PAGE = 11;

-- Tab indices.
local TAB_INDEX_GENERAL		= 1;
local TAB_INDEX_INCOMING	= 2;
local TAB_INDEX_OUTGOING	= 3;
local TAB_INDEX_NOTIFICATION	= 4;
local TAB_INDEX_TRIGGERS	= 5;
local TAB_INDEX_SUPPRESSIONS	= 6;


-------------------------------------------------------------------------------------
-- Local variables.
-------------------------------------------------------------------------------------

-- Holds available font and outline selections.
local availableFontsInherit;
local availableOutlinesInherit;

-- Holds a table of available trigger events.
local availableTriggerEvents = {};


-------------------------------------------------------------------------------------
-- Core event handlers.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Called when the options frame is loaded.
-- **********************************************************************************
function MikSBTOpt.OnLoad()
 -- Register for the ADDON_LOADED event.
 this:RegisterEvent("ADDON_LOADED");
end


-- **********************************************************************************
-- Called when the events we registered for occur.
-- **********************************************************************************
function MikSBTOpt.OnEvent()
 -- When an addon is loaded.
 if (event == "ADDON_LOADED") then
  -- Make sure it's this addon.
  if (arg1 == string.gsub(MikSBT.MOD_NAME .. "Options", "%s", "")) then

   -- Don't get notification for other addons being loaded.
   this:UnregisterEvent("ADDON_LOADED");

   -- Initialize the options.
   MikSBTOpt.Init();
  end
 end
end


-- **********************************************************************************
-- Called when the mod is fully loaded (variables loaded).
-- **********************************************************************************
function MikSBTOpt.Init()
 -- Set the options window title.
 getglobal(OPTIONS_FRAME_NAME .. "TitleText"):SetText(MikSBT.WINDOW_TITLE);

 -- Set the normal and crit size font preview text.
 getglobal(FONT_SETTINGS_FRAME_NAME .. "NormalPreviewText"):SetText(MikSBTOpt.MSG_NORMAL_PREVIEW_TEXT);
 getglobal(FONT_SETTINGS_FRAME_NAME .. "CritPreviewText"):SetText(MikSBTOpt.MSG_CRIT_PREVIEW_TEXT);

 -- Set the trigger classes text
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "TriggerClassesText"):SetText(MikSBTOpt.MSG_TRIGGER_APPLICABLE_CLASSES_LABEL);


 -- Initialize the dropdowns.
 MikSBTOpt.InitDropdowns();

 -- Initialize the checkboxes.
 MikSBTOpt.InitCheckboxes();

 -- Initialize the sliders.
 MikSBTOpt.InitSliders();

 -- Initialize the buttons.
 MikSBTOpt.InitButtons();

 -- Initialize the editboxes.
 MikSBTOpt.InitEditboxes();

 -- Initialize the events.
 MikSBTOpt.InitEvents();





 -- Populate the tabs and select the first one.
 MikSBTOpt.PopulateTabs();
 MikSBTOpt.TabOnClick(1);



 -- Change the state of the profile buttons correctly, and set the current profile label.
 MikSBTOpt.EnableDisableProfileButtons();
 getglobal(OPTIONS_FRAME_NAME .. "Tab1FrameCurrentProfileLabel"):SetText(MikSBTOpt.MSG_CURRENT_PROFILE_TEXT .. ": " .. MikSBT_Save.CurrentProfile);


 -- Setup the available trigger events.
 MikSBTOpt.SetupAvailableTriggerEvents();

 -- Populate the options for the current profile.
 MikSBTOpt.PopulateProfileOptions();

 -- Insert the frame name into the UISpecialFrames array so it closes when the escape key is pressed.
 table.insert(UISpecialFrames, OPTIONS_FRAME_NAME);
end


-- **********************************************************************************
-- Called when the options frame is shown.
-- **********************************************************************************
function MikSBTOpt.OnShow()
 -- Holds whether or not to play a sound.
 local doPlaySound = true;

 -- Get the scroll area mover control frame and make sure it exists.
 local frame = getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME);
 -- Check if the scroll area mover frame is shown.
 if (frame and frame:IsShown()) then
  -- Don't play a sound.
  doPlaySound = false;
 end

 -- Check if a sound should be played.
 if (doPlaySound) then
  -- Play the opening sound
  PlaySound("igCharacterInfoOpen");
 end
end


-- **********************************************************************************
-- Called when the options frame is hidden.
-- **********************************************************************************
function MikSBTOpt.OnHide()
 -- Holds whether or not to play a sound.
 local doPlaySound = true;

 -- Get the scroll area mover control frame and make sure it exists.
 local frame = getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME);
 -- Check if the scroll area mover frame is shown.
 if (frame and frame:IsShown()) then
  -- Don't play a sound.
  doPlaySound = false;
 end

 -- Check if a sound should be played.
 if (doPlaySound) then
  -- Play the closing sound
  PlaySound("igCharacterInfoClose");
 end

 -- Hide the font settings frame when the main frame is closed.
 getglobal(FONT_SETTINGS_FRAME_NAME):Hide();

 -- Hide the trigger config frame when the main frame is closed.
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME):Hide();
end


-- **********************************************************************************
-- Called when one of the scroll areas is scrolled.
-- **********************************************************************************
function MikSBTOpt.OnVerticalScroll()
 -- Uncomment once populate functions exist.
 -- Check if it's the incoming event settings scroll frame.
 if (this:GetName() == OPTIONS_FRAME_NAME .. "Tab2FrameEventsScrollFrame") then
  FauxScrollFrame_OnVerticalScroll(EVENT_ITEM_HEIGHT, MikSBTOpt.PopulateIncomingEventSettings);

 -- Outgoing event settings scroll frame.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab3FrameEventsScrollFrame") then
  FauxScrollFrame_OnVerticalScroll(EVENT_ITEM_HEIGHT, MikSBTOpt.PopulateOutgoingEventSettings);

 -- Notification event settings scroll frame.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab4FrameEventsScrollFrame") then
  FauxScrollFrame_OnVerticalScroll(EVENT_ITEM_HEIGHT, MikSBTOpt.PopulateNotificationEventSettings);

 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab5FrameTriggersScrollFrame") then
  FauxScrollFrame_OnVerticalScroll(TRIGGER_ITEM_HEIGHT, MikSBTOpt.PopulateTriggerEventSettings);

 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab6FrameSuppressionsScrollFrame") then
  FauxScrollFrame_OnVerticalScroll(SUPPRESSION_ITEM_HEIGHT, MikSBTOpt.PopulateSuppressionSettings);

 elseif (this:GetName() == TRIGGER_CONFIGURATION_FRAME_NAME .. "EventsScrollFrame") then
  FauxScrollFrame_OnVerticalScroll(TRIGGER_EVENT_ITEM_HEIGHT, MikSBTOpt.PopulateAvailableTriggerEvents);

 end
end



-------------------------------------------------------------------------------------
-- Tab functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Populates the tabs.
-- **********************************************************************************
function MikSBTOpt.PopulateTabs()
 -- Set the number of tabs for the options frame.
 PanelTemplates_SetNumTabs(getglobal(OPTIONS_FRAME_NAME), table.getn(MikSBTOpt.TABS));

 -- Loop through all of the tabs.
 for tabNumber, tabData in MikSBTOpt.TABS do
  -- Get the associated tab frame.
  local tabFrame = getglobal(OPTIONS_FRAME_NAME .. "Tab" .. tabNumber);
  if (tabFrame) then
   -- Set the tooltip for the tab.
   tabFrame.tooltipText = tabData.Tooltip;

   -- Set the text for the tab and resize it.
   tabFrame:SetText(tabData.Label);
   PanelTemplates_TabResize(1, tabFrame);
  end  
 end
end


-- **********************************************************************************
-- Called when a tab is clicked.
-- **********************************************************************************
function MikSBTOpt.TabOnClick(tab)
 -- Get the clicked tab
 if (not tab) then
  tab = this:GetID();
 end

 -- Set the selected tab
 PanelTemplates_SetTab(getglobal(OPTIONS_FRAME_NAME), tab);

 -- Hide all of the tab frames.
 for tabNumber, tabData in MikSBTOpt.TABS do
  local associatedTabFrame = getglobal(OPTIONS_FRAME_NAME .. "Tab" .. tabNumber .. "Frame");
  if (associatedTabFrame) then
   associatedTabFrame:Hide();
  end
 end

 -- Show the associated frame for the selected tab.
 local associatedTabFrame = getglobal(OPTIONS_FRAME_NAME .. "Tab" .. tab .. "Frame");
 if (associatedTabFrame) then
  associatedTabFrame:Show();
 end

 -- Hide the font settings frame.
 getglobal(FONT_SETTINGS_FRAME_NAME):Hide();

 -- Hide the trigger config frame.
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME):Hide();
end



-------------------------------------------------------------------------------------
-- Dropdown functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Initializes all the dropdowns.
-- **********************************************************************************
function MikSBTOpt.InitDropdowns()
 -- Setup the available fonts with the inherit option.
 availableFontsInherit = MikSBT.CopyTable(MikSBT.AVAILABLE_FONTS);
 table.insert(availableFontsInherit, 1, {Name=MikSBTOpt.MSG_INHERIT_TEXT});
 for key, data in availableFontsInherit do
  data.Value = key - 1;
 end

 -- Setup the available font outlines with the inherit option.
 availableOutlinesInherit = MikSBT.CopyTable(MikSBT.AVAILABLE_OUTLINES);
 table.insert(availableOutlinesInherit, 1, {Name=MikSBTOpt.MSG_INHERIT_TEXT});
 for key, data in availableOutlinesInherit do
  data.Value = key - 1;
 end

 -- Setup the available profiles.
 local availableProfiles = {};
 for profileName, _ in MikSBT_Save.Profiles do
  availableProfiles[profileName] = {Name=profileName};
 end

 -- Setup the available scroll areas.
 local availableScrollAreas = {};
 availableScrollAreas["Incoming"] = {Name=MikSBTOpt.TABS[TAB_INDEX_INCOMING].Label};
 availableScrollAreas["Outgoing"] = {Name=MikSBTOpt.TABS[TAB_INDEX_OUTGOING].Label};
 availableScrollAreas["Notification"] = {Name=MikSBTOpt.TABS[TAB_INDEX_NOTIFICATION].Label};



 -- Initialize the profile dropdown.
 local key = "Tab1FrameProfileDropdown";
 MikSBTOpt.SetupDropdown(OPTIONS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.DROPDOWNS[key].Tooltip, MikSBTOpt.ProfileDropdownOnClick, availableProfiles, nil);
 MikSBTOpt.PopulateDropdown(OPTIONS_FRAME_NAME .. key, MikSBT_Save.CurrentProfile);


 -- Initialize the scroll area dropdown.
 key = "ScrollAreaDropdown";
 MikSBTOpt.SetupDropdown(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.DROPDOWNS[key].Tooltip, MikSBTOpt.ScrollAreaDropdownOnClick, availableScrollAreas, nil);

 -- Initialize the text align dropdown.
 key = "TextAlignDropdown";
 MikSBTOpt.SetupDropdown(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.DROPDOWNS[key].Tooltip, MikSBTOpt.DropdownOnClick, MikSBT.AVAILABLE_TEXT_ALIGNS, nil);

 -- Initialize the animation styles dropdown.
 key = "AnimationStyleDropdown";
 MikSBTOpt.SetupDropdown(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.DROPDOWNS[key].Tooltip, MikSBTOpt.DropdownOnClick, MikSBT.AVAILABLE_ANIMATION_STYLES, nil);

 -- Initialize the scroll direction dropdown.
 key = "ScrollDirectionDropdown";
 MikSBTOpt.SetupDropdown(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.DROPDOWNS[key].Tooltip, MikSBTOpt.DropdownOnClick, MikSBT.AVAILABLE_SCROLL_DIRECTIONS, nil);

 -- Initialize the trigger types dropdown.
 key = "TriggerTypeDropdown";
 MikSBTOpt.SetupDropdown(TRIGGER_CONFIGURATION_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.DROPDOWNS[key].Tooltip, MikSBTOpt.TriggerTypeDropdownOnClick, MikSBT.AVAILABLE_TRIGGER_TYPES, nil); 
 UIDropDownMenu_SetWidth(150, getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. key));
 
 -- Initialize the stances dropdown.
 key = "StanceDropdown";
 MikSBTOpt.SetupDropdown(TRIGGER_CONFIGURATION_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.DROPDOWNS[key].Tooltip, MikSBTOpt.StanceDropdownOnClick, MikSBT.AVAILABLE_STANCES, nil); 
 UIDropDownMenu_SetWidth(240, getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. key));
end


-- **********************************************************************************
-- Sets up a dropdown with the passed information.
-- **********************************************************************************
function MikSBTOpt.SetupDropdown(frameName, label, tooltip, clickFunc, options, varPath)
 local associatedFrame = getglobal(frameName);

 -- Make sure the associated frame exists.
 if (associatedFrame) then
  associatedFrame.tooltipText = tooltip;
  associatedFrame.clickFunction = clickFunc;
  associatedFrame.menuOptions = options;
  associatedFrame.associatedVarPath = varPath;

  -- Set the label for the dropdown.
  getglobal(frameName .. "Label"):SetText(label);

  -- Initialize the dropdown.
  UIDropDownMenu_Initialize(associatedFrame, MikSBTOpt.DropdownInit);
 end
end


-- **********************************************************************************
-- Sets the dropdown's selected value for the passed frame name.  If a value is passed
-- it is used, otherwise the function will attempt to get the value from the
-- associatedVarPath field of the dropdown frame.
-- **********************************************************************************
function MikSBTOpt.PopulateDropdown(frameName, selectValue)
 local associatedFrame = getglobal(frameName);

 -- Make sure the associated frame exists.
 if (associatedFrame) then
  local tempValue = selectValue;

  -- Check if no selected value was passed.
  if (tempValue == nil) then
   -- Check if there is an associated variable path for the dropdown.
   if (associatedFrame.associatedVarPath) then
    -- Get the selected value from the current profile.
    tempValue = MikSBT.GetOptionFromVarPath(associatedFrame.associatedVarPath);
   end
  end

  -- Make sure there is a value to be selected.
  if (tempValue ~= nil) then
   -- Set the default selected value.
   UIDropDownMenu_SetSelectedValue(associatedFrame, tempValue);

   -- Set the text for the default selected value.
   for key, optionData in associatedFrame.menuOptions do
    -- If there is no value for the option data, use the key as the value.
    local optionValue = optionData.Value;
    if (optionValue == nil) then
     optionValue = key;
    end
    local selectedValue = associatedFrame.selectedValue;

    if (optionValue == selectedValue) then
     UIDropDownMenu_SetText(optionData.Name, associatedFrame);
    end
   end
  end
 end
end


-- **********************************************************************************
-- Called when a drop down menu is initialized (shown).
-- **********************************************************************************
function MikSBTOpt.DropdownInit()
 local info = {};

 -- Check if the dropdown frame is the options frame and exit.
 local dropdownFrame = this;
 if (dropdownFrame:GetName() == OPTIONS_FRAME_NAME) then
  return;
 end

 -- Check if dropdownFrame is a button and not the actual dropdown itself.
 if (not dropdownFrame.menuOptions) then
  dropdownFrame = this:GetParent();
 end

 -- Make sure there is dropdown data.
 if (dropdownFrame.menuOptions) then
  -- Loop through all of the options for dropdown.
  for key, optionData in dropdownFrame.menuOptions do

   -- If the option data has a value use it otherwise use the key as the value.
   local tempValue = optionData.Value;
   if (tempValue == nil) then
    tempValue = key;
   end

   -- Add the option to the dropdown list.
   info = {};
   info.text = optionData.Name;
   info.value = tempValue;
   info.func = dropdownFrame.clickFunction;
   info.arg1 = dropdownFrame:GetName();
   UIDropDownMenu_AddButton(info);
  end
 end
end


-- **********************************************************************************
-- Called when one of the dropdown menu options is clicked.
-- **********************************************************************************
function MikSBTOpt.DropdownOnClick(frameName)
 -- Set the selected dropdown option to the appropriate value.
 UIDropDownMenu_SetSelectedValue(getglobal(frameName), this.value);

 -- Get the associated variable path.
 local associatedVarPath = getglobal(frameName).associatedVarPath;

 -- Make sure there is a variable path.
 if (associatedVarPath) then
  -- Update current profile data.
  MikSBT.SetOptionFromVarPath(associatedVarPath, this.value);
 end
end


-- **********************************************************************************
-- Called when one of the dropdown menu options on the font settings frame is clicked.
-- **********************************************************************************
function MikSBTOpt.FontSettingsDropdownOnClick(frameName)
 -- Call the normal dropdown OnClick handler.
 MikSBTOpt.DropdownOnClick(frameName);
 
 -- Update the font previews.
 MikSBTOpt.UpdateFontPreviews(); 
end


-- **********************************************************************************
-- Called when one of the profile dropdown menu options is clicked.
-- **********************************************************************************
function MikSBTOpt.ProfileDropdownOnClick(frameName)
 -- Call the normal dropdown OnClick handler.
 MikSBTOpt.DropdownOnClick(frameName);

 -- Enable and disable the load and delete profile buttons.
 MikSBTOpt.EnableDisableProfileButtons();
end


-- **********************************************************************************
-- Called when one of the scroll area dropdown menu options is clicked.
-- **********************************************************************************
function MikSBTOpt.ScrollAreaDropdownOnClick(frameName)
 -- Save the settings in the controls to the control frame's current settings.
 MikSBTOpt.SaveScrollAreaControlsToCurrentSettings();
 
 -- Call the normal dropdown OnClick handler.
 MikSBTOpt.DropdownOnClick(frameName);

 -- Get the selected scroll area.
 scrollArea = UIDropDownMenu_GetSelectedValue(getglobal(frameName));
 if (scrollArea ~= nil) then
  -- Populate the controls for the scroll area.
  MikSBTOpt.PopulateScrollAreaControls(scrollArea);
 end
end

-- **********************************************************************************
-- Called when the trigger type dropdown menu is clicked.
-- **********************************************************************************
function MikSBTOpt.TriggerTypeDropdownOnClick(frameName)
 -- Set the selected dropdown option to the appropriate value.
 UIDropDownMenu_SetSelectedValue(getglobal(frameName), this.value);

 -- Setup the trigger controls appropriately depending on the trigger type.
 MikSBTOpt.SetupVariableTriggerControls(getglobal(frameName):GetParent().TriggerKey, this.value == MikCEH.TRIGGERTYPE_SEARCH_PATTERN);
end


-- **********************************************************************************
-- Called when the stance dropdown menu is clicked.
-- **********************************************************************************
function MikSBTOpt.StanceDropdownOnClick(frameName)
 -- Set the selected dropdown option to the appropriate value.
 UIDropDownMenu_SetSelectedValue(getglobal(frameName), this.value);
end


-- **********************************************************************************
-- This function refreshes the options for the profiles dropdown.
-- **********************************************************************************
function MikSBTOpt.RefreshProfilesDropdown()
 -- Setup the available profiles.
 local availableProfiles = {};
 for profileName, _ in MikSBT_Save.Profiles do
  availableProfiles[profileName] = {Name=profileName};
 end

 -- Reset the available options for the profiles dropdown.
 getglobal(OPTIONS_FRAME_NAME .. "Tab1FrameProfileDropdown").menuOptions = availableProfiles;
end



-------------------------------------------------------------------------------------
-- Checkbox functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Initializes all the checkboxes.
-- **********************************************************************************
function MikSBTOpt.InitCheckboxes()
 -- Initialize the Disable MSBT checkbox.
 local key = "Tab1FrameDisableCheckbox";
 MikSBTOpt.SetupCheckbox(OPTIONS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.CHECKBOXES[key].Tooltip, nil);
 MikSBTOpt.PopulateCheckbox(OPTIONS_FRAME_NAME .. key, MikSBT_Save.UserDisabled);

 -- Initialize the Show Partial Effects checkbox.
 key = "Tab1FrameShowPartialEffectsCheckbox";
 MikSBTOpt.SetupCheckbox(OPTIONS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.CHECKBOXES[key].Tooltip, "ShowPartialEffects");

 -- Initialize the Use Sticky Crits checkbox.
 key = "Tab1FrameUseStickyCritsCheckbox";
 MikSBTOpt.SetupCheckbox(OPTIONS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.CHECKBOXES[key].Tooltip, "UseStickyCrits");

 -- Initialize the Show Overheals checkbox.
 key = "Tab1FrameShowOverhealsCheckbox";
 MikSBTOpt.SetupCheckbox(OPTIONS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.CHECKBOXES[key].Tooltip, "ShowOverheals");

 -- Initialize the Show Game Damage checkbox.
 key = "Tab1FrameShowGameDamageCheckbox";
 MikSBTOpt.SetupCheckbox(OPTIONS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.CHECKBOXES[key].Tooltip, "ShowGameDamage");

 -- Initialize the Show All Mana Gains checkbox.
 key = "Tab1FrameShowAllManaGainsCheckbox";
 MikSBTOpt.SetupCheckbox(OPTIONS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.CHECKBOXES[key].Tooltip, "ShowAllManaGains");
 
  -- Initialize the Low Health Sound checkbox.
 key = "Tab1FrameLowHealthSoundCheckbox";
 MikSBTOpt.SetupCheckbox(OPTIONS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.CHECKBOXES[key].Tooltip, "LowHealthSound");
 
  -- Initialize the Low Mana Sound checkbox.
 key = "Tab1FrameLowManaSoundCheckbox";
 MikSBTOpt.SetupCheckbox(OPTIONS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.CHECKBOXES[key].Tooltip, "LowManaSound");

 -- Initialize the show scroll area events checkboxes.
 key = "Tab2FrameShowEventsCheckbox";	MikSBTOpt.SetupCheckbox(OPTIONS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.CHECKBOXES[key].Tooltip, "DisplaySettings.Incoming.Show");
 key = "Tab3FrameShowEventsCheckbox";	MikSBTOpt.SetupCheckbox(OPTIONS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.CHECKBOXES[key].Tooltip, "DisplaySettings.Outgoing.Show");
 key = "Tab4FrameShowEventsCheckbox";	MikSBTOpt.SetupCheckbox(OPTIONS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.CHECKBOXES[key].Tooltip, "DisplaySettings.Notification.Show");


 -- Initialize the trigger config class checkboxes.
 MikSBTOpt.SetupCheckbox(TRIGGER_CONFIGURATION_FRAME_NAME .. "AllClassesCheckbox", ALL, nil, nil);
 MikSBTOpt.SetupCheckbox(TRIGGER_CONFIGURATION_FRAME_NAME .. "DruidCheckbox", MikSBTOpt.MSG_CLASS_NAME_DRUID, nil, nil);
 MikSBTOpt.SetupCheckbox(TRIGGER_CONFIGURATION_FRAME_NAME .. "HunterCheckbox", MikSBTOpt.MSG_CLASS_NAME_HUNTER, nil, nil);
 MikSBTOpt.SetupCheckbox(TRIGGER_CONFIGURATION_FRAME_NAME .. "MageCheckbox", MikSBTOpt.MSG_CLASS_NAME_MAGE, nil, nil);
 MikSBTOpt.SetupCheckbox(TRIGGER_CONFIGURATION_FRAME_NAME .. "PaladinCheckbox", MikSBTOpt.MSG_CLASS_NAME_PALADIN, nil, nil);
 MikSBTOpt.SetupCheckbox(TRIGGER_CONFIGURATION_FRAME_NAME .. "PriestCheckbox", MikSBTOpt.MSG_CLASS_NAME_PRIEST, nil, nil);
 MikSBTOpt.SetupCheckbox(TRIGGER_CONFIGURATION_FRAME_NAME .. "RogueCheckbox", MikSBTOpt.MSG_CLASS_NAME_ROGUE, nil, nil);
 MikSBTOpt.SetupCheckbox(TRIGGER_CONFIGURATION_FRAME_NAME .. "ShamanCheckbox", MikSBTOpt.MSG_CLASS_NAME_SHAMAN, nil, nil);
 MikSBTOpt.SetupCheckbox(TRIGGER_CONFIGURATION_FRAME_NAME .. "WarlockCheckbox", MikSBTOpt.MSG_CLASS_NAME_WARLOCK, nil, nil);
 MikSBTOpt.SetupCheckbox(TRIGGER_CONFIGURATION_FRAME_NAME .. "WarriorCheckbox", MikSBTOpt.MSG_CLASS_NAME_WARRIOR, nil, nil);

end


-- **********************************************************************************
-- Sets up a checkbox with the passed information.
-- **********************************************************************************
function MikSBTOpt.SetupCheckbox(frameName, label, tooltip, varPath)
 local associatedFrame = getglobal(frameName);

 -- Make sure the associated frame exists.
 if (associatedFrame) then
  associatedFrame.associatedVarPath = varPath;
  associatedFrame.tooltipText = tooltip;

  -- Set the text for the checkbox.
  if (label) then
   getglobal(frameName .. "Text"):SetText(label);
  end
 end
end


-- **********************************************************************************
-- Sets the checkbox's checked state for the passed frame name.  If a value is passed
-- it is used, otherwise the function will attempt to get the value from the
-- associatedVarPath field of the checkbox frame.
-- **********************************************************************************
function MikSBTOpt.PopulateCheckbox(frameName, isChecked)
 local associatedFrame = getglobal(frameName);

 -- Make sure the associated frame exists.
 if (associatedFrame) then
  local tempValue = isChecked;

  -- Check if no value was passed.
  if (tempValue == nil) then
   -- Check if there is an associated variable path for the checkbox.
   if (associatedFrame.associatedVarPath) then
    -- Get the selected value from the current profile.
    tempValue = MikSBT.GetOptionFromVarPath(associatedFrame.associatedVarPath);
   end
  end

  -- Make sure there is a value to set.
  if (tempValue ~= nil) then
   -- Set the checkbox checked state appropriately.
   if (tempValue == true) then
    associatedFrame:SetChecked(1);
   else
    associatedFrame:SetChecked(0);
   end     
  end
 end
end


-- **********************************************************************************
-- Called when a checkbox is clicked.
-- **********************************************************************************
function MikSBTOpt.CheckboxOnClick()
 -- Disable MSBT checkbox.
 if (this:GetName() == OPTIONS_FRAME_NAME .. "Tab1FrameDisableCheckbox") then
  -- Check if the checkbox is checked.
  if (this:GetChecked() == 1) then
   MikSBT.SetOptionUserDisabled(true);
  else
   MikSBT.SetOptionUserDisabled(false);
  end

  -- Return from the function.
  return;

 -- Show Game Damage checkbox.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab1FrameShowGameDamageCheckbox") then
  -- Check if the checkbox is checked.
  if (this:GetChecked() == 1) then
   MikSBT.SetOptionShowGameDamage(true);
  else
   MikSBT.SetOptionShowGameDamage(false);
  end

  -- Return from the function.
  return;

 -- Inherit font size, or inherit critical font size checkbox.
 elseif (this:GetName() == FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCheckbox" or
         this:GetName() == FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCritCheckbox") then

  -- Call the font settings checkbox OnClick handler.
  MikSBTOpt.FontSettingsCheckboxOnClick();

  -- Return from the function.
  return;

 -- Trigger frame all classes checkbox.
 elseif (this:GetName() == TRIGGER_CONFIGURATION_FRAME_NAME .. "AllClassesCheckbox") then
  -- Hide or show the individual class checkboxes depending on the state of the all classes
  -- checkbox.
  if (this:GetChecked() == 1) then
   MikSBTOpt.HideTriggerClassCheckboxes();
  else
   MikSBTOpt.ShowTriggerClassCheckboxes();
  end

 --Trigger frame trigger event checkbox.
 elseif (string.find(this:GetName(), TRIGGER_CONFIGURATION_FRAME_NAME .. "TriggerEvent")) then
  -- Make sure there is an associated trigger event.
  if (this.TriggerEvent) then
   local triggerFrame = getglobal(TRIGGER_CONFIGURATION_FRAME_NAME);
   if (this:GetChecked()) then
    triggerFrame.SelectedTriggerEvents[this.TriggerEvent] = true;
   else
    triggerFrame.SelectedTriggerEvents[this.TriggerEvent] = nil;
   end    
  end
  
 end

 -- Check if there is an associated variable path and set it to the correct value.
 if (this.associatedVarPath) then
  if (this:GetChecked() == 1) then
   -- Set the associated variable in the current profile to the inherited value.
   MikSBT.SetOptionFromVarPath(this.associatedVarPath, true);
  else
   -- Set the associated variable in the current profile to the inherited value.
   MikSBT.SetOptionFromVarPath(this.associatedVarPath, false);
  end
 end
end


-- **********************************************************************************
-- Called when an enable trigger checkbox is clicked.
-- **********************************************************************************
function MikSBTOpt.EnableTriggerCheckboxOnClick()
 -- Check if there is an associated variable path and set it to the correct value.
 if (this.associatedVarPath) then
  if (this:GetChecked() == 1) then
   -- Set the associated variable in the current profile to the inherited value.
   MikSBT.SetOptionFromVarPath(this.associatedVarPath, true);
  else
   -- Set the associated variable in the current profile to the inherited value.
   MikSBT.SetOptionFromVarPath(this.associatedVarPath, false);
  end
 end

 -- Reregister all of the triggers.
 MikSBT.RegisterTriggers();
end


-- **********************************************************************************
-- Called when a checkbox in the font settings area is clicked.
-- **********************************************************************************
function MikSBTOpt.FontSettingsCheckboxOnClick()
 local associatedSlider;
 local inheritedValue;
 local sliderKey;

 -- Check if it's the inherit font size checkbox.
 if (this:GetName() == FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCheckbox") then
  sliderKey = "FontSizeSlider";
  associatedSlider = getglobal(FONT_SETTINGS_FRAME_NAME .. sliderKey);
  inheritedValue = this:GetParent().InheritedFontSize;
 elseif (this:GetName() == FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCritCheckbox") then
  sliderKey = "FontSizeCritSlider";
  associatedSlider = getglobal(FONT_SETTINGS_FRAME_NAME .. sliderKey);
  inheritedValue = this:GetParent().InheritedFontSizeCrit;
 end
  
 -- Make sure there is an associated variable path.
 if (this.associatedVarPath) then
  if (this:GetChecked() == 1) then
   -- Set the associated variable in the current profile to inherit.
   MikSBT.SetOptionFromVarPath(this.associatedVarPath, 0);

   -- Hide the associated slider.
   associatedSlider:Hide();
  else
   -- Set the associated variable in the current profile to the inherited value.
   MikSBT.SetOptionFromVarPath(this.associatedVarPath, inheritedValue);

   -- Show the associated slider.
   associatedSlider:Show();

   -- Populate the slider.
   MikSBTOpt.PopulateSlider(FONT_SETTINGS_FRAME_NAME .. sliderKey);
  end
 end

 -- Update the font previews.
 MikSBTOpt.UpdateFontPreviews();
end


-------------------------------------------------------------------------------------
-- Slider functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Initializes all the sliders.
-- **********************************************************************************
function MikSBTOpt.InitSliders()
 -- Initialize the Animation Step slider.
 local key = "Tab1FrameAnimationStepSlider"; 
 MikSBTOpt.SetupSlider(OPTIONS_FRAME_NAME .. key, MikSBTOpt.SLIDERS[key].Label, MikSBTOpt.SLIDERS[key].Tooltip, MIN_ANIMATION_STEP, MAX_ANIMATION_STEP, 0.5, "AnimationStep");

 -- Initialize the scroll height slider.
 key = "ScrollHeightSlider";
 MikSBTOpt.SetupSlider(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. key, MikSBTOpt.SLIDERS[key].Label, MikSBTOpt.SLIDERS[key].Tooltip, MIN_SCROLL_HEIGHT, MAX_SCROLL_HEIGHT, 2, nil);

 key = "ThresholdSlider";
 MikSBTOpt.SetupSlider(TRIGGER_CONFIGURATION_FRAME_NAME .. key, MikSBTOpt.SLIDERS[key].Label, MikSBTOpt.SLIDERS[key].Tooltip, 1, 100, 1, nil);
end


-- **********************************************************************************
-- Sets up a slider with the passed data.
-- **********************************************************************************
function MikSBTOpt.SetupSlider(frameName, label, tooltip, minValue, maxValue, step, varPath)
 local associatedSliderFrame = getglobal(frameName);

 -- Make sure the associated frame exists.
 if (associatedSliderFrame) then
  associatedSliderFrame.savedLabel = label;
  associatedSliderFrame.tooltipText = tooltip;
  associatedSliderFrame.associatedVarPath = varPath;

  -- Set the text for the slider.
  getglobal(frameName .. "Text"):SetText(label);

  -- Set the min/max values for the slider.
  associatedSliderFrame:SetMinMaxValues(minValue, maxValue);
  associatedSliderFrame:SetValueStep(step);
 end
end


-- **********************************************************************************
-- Sets the slider's value for the passed frame name.  If a value is passed
-- it is used, otherwise the function will attempt to get the value from the
-- associatedVarPath field of the slider frame.
-- **********************************************************************************
function MikSBTOpt.PopulateSlider(frameName, sliderValue)
 local associatedSliderFrame = getglobal(frameName);

 -- Make sure the associated frame exists.
 if (associatedSliderFrame) then
  local tempValue = sliderValue;

  -- Check if no value was passed.
  if (tempValue == nil) then
   -- Check if there is an associated variable path for the slider.
   if (associatedSliderFrame.associatedVarPath) then
    -- Get the selected value from the current profile.
    tempValue = MikSBT.GetOptionFromVarPath(associatedSliderFrame.associatedVarPath);
   end
  end

  -- Make sure there is a value to set.
  if (tempValue ~= nil) then
   -- Set the slider's value to the appropriate value.
   associatedSliderFrame:SetValue(tempValue);

   -- Update the label to reflect the new value.
   getglobal(frameName .. "Text"):SetText(associatedSliderFrame.savedLabel .. ": " .. associatedSliderFrame:GetValue());
  end
 end
end


-- **********************************************************************************
-- Called when a slider values changes.
-- **********************************************************************************
function MikSBTOpt.SliderOnValueChanged()
 -- Update the label to reflect the new value.
 getglobal(this:GetName() .. "Text"):SetText(this.savedLabel .. ": " .. this:GetValue());

 -- Check if the slider has an associated variable path.
 if (this.associatedVarPath) then
  -- Update current profile data.
  MikSBT.SetOptionFromVarPath(this.associatedVarPath, this:GetValue());
 end
end


-- **********************************************************************************
-- Called when a font settings slider values changes.
-- **********************************************************************************
function MikSBTOpt.FontSettingsSliderOnValueChanged()
 -- Call the normal slider OnValueChanged handler.
 MikSBTOpt.SliderOnValueChanged();

 -- Update the font previews.
 MikSBTOpt.UpdateFontPreviews();
end


-- **********************************************************************************
-- Called when the scroll area mover control slider value changes.
-- **********************************************************************************
function MikSBTOpt.ScrollAreaMoverControlSliderOnValueChanged()
 -- Call the normal slider OnValueChanged handler.
 MikSBTOpt.SliderOnValueChanged();

 -- Get the currently selected scroll area and the scroll area mover control frame.
 local scrollArea = UIDropDownMenu_GetSelectedValue(getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "ScrollAreaDropdown"));
 local controlFrame = getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME);

 -- Save the scroll height for the selected scroll area.
 controlFrame.MSBTCurrentSettings[scrollArea .. "ScrollHeight"] = this:GetValue(); 

 -- Reposition the scroll area mover frames.
 MikSBTOpt.RepositionScrollAreaMoverFrames();
end


-------------------------------------------------------------------------------------
-- Button Functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Initializes all the buttons.
-- **********************************************************************************
function MikSBTOpt.InitButtons()
 -- Initialize the edit font settings buttons for master, incoming, outgoing, and notification.
 local key = "Tab1FrameEditFontSettingsButton";	MikSBTOpt.SetupButton(OPTIONS_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);
 key = "Tab1FrameEditBlizzardFontSettingsButton";	MikSBTOpt.SetupButton(OPTIONS_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);
 key = "Tab2FrameEditFontSettingsButton";		MikSBTOpt.SetupButton(OPTIONS_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);
 key = "Tab3FrameEditFontSettingsButton";		MikSBTOpt.SetupButton(OPTIONS_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);
 key = "Tab4FrameEditFontSettingsButton";		MikSBTOpt.SetupButton(OPTIONS_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);


 -- Initialize the profile manipulation buttons.
 key = "Tab1FrameLoadProfileButton";		MikSBTOpt.SetupButton(OPTIONS_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);
 key = "Tab1FrameDeleteProfileButton";		MikSBTOpt.SetupButton(OPTIONS_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);
 key = "Tab1FrameResetProfileButton";		MikSBTOpt.SetupButton(OPTIONS_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);
 key = "Tab1FrameCreateProfileButton";		MikSBTOpt.SetupButton(OPTIONS_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);


 -- Initialize the configure scroll area buttons for incoming, outgoing, and notification.
 key = "Tab2FrameConfigureScrollAreaButton";
 local commonLabel = MikSBTOpt.BUTTONS[key].Label;
 local commonTooltip = MikSBTOpt.BUTTONS[key].Tooltip;
 MikSBTOpt.SetupButton(OPTIONS_FRAME_NAME .. key, commonLabel, commonTooltip);
 key = "Tab3FrameConfigureScrollAreaButton";		MikSBTOpt.SetupButton(OPTIONS_FRAME_NAME .. key, commonLabel, commonTooltip);
 key = "Tab4FrameConfigureScrollAreaButton";		MikSBTOpt.SetupButton(OPTIONS_FRAME_NAME .. key, commonLabel, commonTooltip);


 -- Initialize the scroll area mover buttons.
 key = "PreviewButton";		MikSBTOpt.SetupButton(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);
 key = "SaveButton";		MikSBTOpt.SetupButton(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);
 key = "CancelButton";		MikSBTOpt.SetupButton(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);

 -- Initialize the add trigger button.
 key = "Tab5FrameAddTriggerButton";	MikSBTOpt.SetupButton(OPTIONS_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);

 -- Initialize the save and cancel trigger buttons.
 key = "SaveTriggerButton";	MikSBTOpt.SetupButton(TRIGGER_CONFIGURATION_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);
 key = "CancelTriggerButton";	MikSBTOpt.SetupButton(TRIGGER_CONFIGURATION_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);

 -- Initialize the add suppression button.
 key = "Tab6FrameAddSuppressionButton";	MikSBTOpt.SetupButton(OPTIONS_FRAME_NAME .. key, MikSBTOpt.BUTTONS[key].Label, MikSBTOpt.BUTTONS[key].Tooltip);
end


-- **********************************************************************************
-- Sets up a button with the passed data.
-- **********************************************************************************
function MikSBTOpt.SetupButton(frameName, label, tooltip)
 local associatedFrame = getglobal(frameName);

 -- Make sure the associated frame exists.
 if (associatedFrame) then
  associatedFrame.tooltipText = tooltip;

  -- Set the text for the button.
  associatedFrame:SetText(label);
  associatedFrame:SetWidth(associatedFrame:GetTextWidth() + 40);
 end
end


-- **********************************************************************************
-- Called when a button is clicked.
-- **********************************************************************************
function MikSBTOpt.ButtonOnClick()
 -- Edit master font settings button.
 if (this:GetName() == OPTIONS_FRAME_NAME .. "Tab1FrameEditFontSettingsButton") then
  local fontSettingsFrame = getglobal(FONT_SETTINGS_FRAME_NAME);
  fontSettingsFrame:SetPoint("TOPLEFT", this, "BOTTOMLEFT");
  fontSettingsFrame:Raise();
  getglobal(FONT_SETTINGS_FRAME_NAME .. "Title"):SetText(MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Master"].FontSettingsTitle);
  MikSBTOpt.ShowMasterFontSettings();
  
 -- Edit Blizzard scrolling text font.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab1FrameEditBlizzardFontSettingsButton") then
  local fontSettingsFrame = getglobal(FONT_SETTINGS_FRAME_NAME);
  fontSettingsFrame:SetPoint("TOPLEFT", this, "BOTTOMLEFT");
  fontSettingsFrame:Raise();
  getglobal(FONT_SETTINGS_FRAME_NAME .. "Title"):SetText(MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Blizzard"].FontSettingsTitle);
  MikSBTOpt.ShowBlizzardFontSettings();
 
 -- Edit incoming font settings button.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab2FrameEditFontSettingsButton") then
  -- Hide the event message editbox if it's shown.
  MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab2FrameMessageEditbox");

  -- Get the font settings frame, anchor it to the buton pushed, raise it, and change the title.
  local fontSettingsFrame = getglobal(FONT_SETTINGS_FRAME_NAME);
  fontSettingsFrame:SetPoint("TOPLEFT", this, "BOTTOMLEFT");
  fontSettingsFrame:Raise();
  getglobal(FONT_SETTINGS_FRAME_NAME .. "Title"):SetText(MikSBTOpt.TABS[TAB_INDEX_INCOMING].Label);
  MikSBTOpt.ShowScrollAreaFontSettings("Incoming");


 -- Edit outgoing font settings button.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab3FrameEditFontSettingsButton") then
  -- Hide the event message editbox if it's shown.
  MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab3FrameMessageEditbox");

  -- Get the font settings frame, anchor it to the buton pushed, raise it, and change the title.
  local fontSettingsFrame = getglobal(FONT_SETTINGS_FRAME_NAME);
  fontSettingsFrame:SetPoint("TOPLEFT", this, "BOTTOMLEFT");
  fontSettingsFrame:Raise();
  getglobal(FONT_SETTINGS_FRAME_NAME .. "Title"):SetText(MikSBTOpt.TABS[TAB_INDEX_OUTGOING].Label);
  MikSBTOpt.ShowScrollAreaFontSettings("Outgoing");


 -- Edit notification font settings button.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab4FrameEditFontSettingsButton") then
  -- Hide the event message editbox if it's shown.
  MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab4FrameMessageEditbox");

  -- Get the font settings frame, anchor it to the buton pushed, raise it, and change the title.
  local fontSettingsFrame = getglobal(FONT_SETTINGS_FRAME_NAME);
  fontSettingsFrame:SetPoint("TOPLEFT", this, "BOTTOMLEFT");
  fontSettingsFrame:Raise();
  getglobal(FONT_SETTINGS_FRAME_NAME .. "Title"):SetText(MikSBTOpt.TABS[TAB_INDEX_NOTIFICATION].Label);
  MikSBTOpt.ShowScrollAreaFontSettings("Notification");


 -- Load profile button.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab1FrameLoadProfileButton") then
  -- Select the appropriate profile and update the current profile label.
  MikSBT.SelectProfile(UIDropDownMenu_GetSelectedValue(getglobal(OPTIONS_FRAME_NAME .. "Tab1FrameProfileDropdown")));
  getglobal(OPTIONS_FRAME_NAME .. "Tab1FrameCurrentProfileLabel"):SetText(MikSBTOpt.MSG_CURRENT_PROFILE_TEXT .. ": " .. MikSBT_Save.CurrentProfile);

  -- Enable and disable the load and delete profile buttons.
  MikSBTOpt.EnableDisableProfileButtons();

  -- Repopulate the options.
  MikSBTOpt.PopulateProfileOptions();


 -- Delete profile button.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab1FrameDeleteProfileButton") then
  local profileName = UIDropDownMenu_GetSelectedValue(getglobal(OPTIONS_FRAME_NAME .. "Tab1FrameProfileDropdown"));
  MikSBT.DeleteProfile(profileName);

  -- Refresh the available profiles for the dropdown.
  MikSBTOpt.RefreshProfilesDropdown();

  -- Select the current profile in the dropdown and update the current profile label.
  MikSBTOpt.PopulateDropdown(OPTIONS_FRAME_NAME .. "Tab1FrameProfileDropdown", MikSBT_Save.CurrentProfile);
  getglobal(OPTIONS_FRAME_NAME .. "Tab1FrameCurrentProfileLabel"):SetText(MikSBTOpt.MSG_CURRENT_PROFILE_TEXT .. ": " .. MikSBT_Save.CurrentProfile);

  -- Enable and disable the load and delete profile buttons.
  MikSBTOpt.EnableDisableProfileButtons();

  -- Repopulate the options.
  MikSBTOpt.PopulateProfileOptions();

 -- Reset profile button.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab1FrameResetProfileButton") then
  local profileName = UIDropDownMenu_GetSelectedValue(getglobal(OPTIONS_FRAME_NAME .. "Tab1FrameProfileDropdown"));  
  MikSBT.ResetProfile(profileName, true);

  -- Repopulate the options.
  MikSBTOpt.PopulateProfileOptions();


 -- Create profile button.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab1FrameCreateProfileButton") then
  local profileNameEditbox = getglobal(OPTIONS_FRAME_NAME .. "Tab1FrameNewProfileNameEditbox");
  local profileName = profileNameEditbox:GetText();

  -- Clear the text in the profile name editbox.
  profileNameEditbox:SetText("");

  -- Make sure there is a profile name.
  if (profileName ~= "") then
   MikSBT.CreateProfile(profileName);
   
   -- Refresh the available profiles for the dropdown.
   MikSBTOpt.RefreshProfilesDropdown();

   -- Enable and disable the load and delete profile buttons.
   MikSBTOpt.EnableDisableProfileButtons();

   -- Hide the font settings frame when profile options are populated.
   getglobal(FONT_SETTINGS_FRAME_NAME):Hide();

   -- Hide the trigger frame when profile options are populated.
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME):Hide();
  end


 -- Configure incoming scroll area button.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab2FrameConfigureScrollAreaButton") then
  -- Setup and show the scroll area mover frames.
  MikSBTOpt.ShowScrollAreaMoverFrames("Incoming");


 -- Configure outgoing scroll area button.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab3FrameConfigureScrollAreaButton") then
  -- Setup and show the scroll area mover frames.
  MikSBTOpt.ShowScrollAreaMoverFrames("Outgoing");


 -- Configure notification scroll area button.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab4FrameConfigureScrollAreaButton") then
  -- Setup and show the scroll area mover frames.
  MikSBTOpt.ShowScrollAreaMoverFrames("Notification");


 -- Scroll area mover preview button.
 elseif (this:GetName() == SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "PreviewButton") then
  -- Preview a test message in the new position.
  MikSBTOpt.ScrollAreaMoverPreviewOnClick();


 -- Scroll area mover save button.
 elseif (this:GetName() == SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "SaveButton") then
  -- Save the new position for the scroll area.
  MikSBTOpt.ScrollAreaMoverSaveOnClick();


 -- Scroll area mover cancel button.
 elseif (this:GetName() == SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "CancelButton") then
  -- Cancel the scroll area movement.
  MikSBTOpt.ScrollAreaMoverCancelOnClick();


 -- Incoming event font settings button.
 elseif (this:GetParent().EventArea == "Incoming") then
  -- Hide the event message editbox if it's shown.
  MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab2FrameMessageEditbox");

  local fontSettingsFrame = getglobal(FONT_SETTINGS_FRAME_NAME);
  fontSettingsFrame:SetPoint("TOPLEFT", this, "BOTTOMLEFT");
  fontSettingsFrame:Raise();

  -- Make sure the event type is set for the button.
  if (this:GetParent().EventType ~= nil) then
   getglobal(FONT_SETTINGS_FRAME_NAME .. "Title"):SetText(this:GetParent().FontFrameTitle);
   MikSBTOpt.ShowEventFontSettings("Incoming", this:GetParent().EventType);
  end
  

 -- Outgoing event font settings button.
 elseif (this:GetParent().EventArea == "Outgoing") then
  -- Hide the event message editbox if it's shown.
  MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab3FrameMessageEditbox");

  local fontSettingsFrame = getglobal(FONT_SETTINGS_FRAME_NAME);
  fontSettingsFrame:SetPoint("TOPLEFT", this, "BOTTOMLEFT");
  fontSettingsFrame:Raise();

  -- Make sure the event type is set for the button.
  if (this:GetParent().EventType ~= nil) then
   getglobal(FONT_SETTINGS_FRAME_NAME .. "Title"):SetText(this:GetParent().FontFrameTitle);
   MikSBTOpt.ShowEventFontSettings("Outgoing", this:GetParent().EventType);
  end


 -- Notification event font settings button.
 elseif (this:GetParent().EventArea == "Notification") then
  -- Hide the event message editbox if it's shown.
  MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab4FrameMessageEditbox");

  local fontSettingsFrame = getglobal(FONT_SETTINGS_FRAME_NAME);
  fontSettingsFrame:SetPoint("TOPLEFT", this, "BOTTOMLEFT");
  fontSettingsFrame:Raise();

  -- Make sure the event type is set for the button.
  if (this:GetParent().EventType ~= nil) then
   getglobal(FONT_SETTINGS_FRAME_NAME .. "Title"):SetText(this:GetParent().FontFrameTitle);
   MikSBTOpt.ShowEventFontSettings("Notification", this:GetParent().EventType);
  end


 -- Add trigger button.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab5FrameAddTriggerButton") then
  -- Hide the trigger configuration frame.
  getglobal(TRIGGER_CONFIGURATION_FRAME_NAME):Hide();

  -- Add a new trigger.
  MikSBTOpt.AddNewTrigger();


 -- Trigger event font settings button.
 elseif (this:GetParent().EventArea == "Trigger" and string.find(this:GetName(), "EditFontSettingsButton")) then
  -- Hide the trigger event message editbox if it's shown.
  MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab5FrameMessageEditbox");

  local fontSettingsFrame = getglobal(FONT_SETTINGS_FRAME_NAME);
  fontSettingsFrame:SetPoint("TOPLEFT", this, "BOTTOMLEFT");
  fontSettingsFrame:Raise();

  -- Make sure the trigger key is set for the button.
  if (this:GetParent().TriggerKey ~= nil) then
   getglobal(FONT_SETTINGS_FRAME_NAME .. "Title"):SetText(this:GetParent().FontFrameTitle);
   MikSBTOpt.ShowTriggerFontSettings(this:GetParent().TriggerKey);
  end 


 -- Trigger edit config button.
 elseif (this:GetParent().EventArea == "Trigger" and string.find(this:GetName(), "EditTriggerSettingsButton")) then
  -- Hide the trigger event message editbox if it's shown.
  MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab5FrameMessageEditbox");

  local triggerConfigFrame = getglobal(TRIGGER_CONFIGURATION_FRAME_NAME);
  triggerConfigFrame:SetPoint("TOPLEFT", this, "BOTTOMLEFT");
  triggerConfigFrame:Raise();

  -- Make sure the trigger key is set for the button.
  if (this:GetParent().TriggerKey ~= nil) then
   MikSBTOpt.ShowTriggerConfig(this:GetParent().TriggerKey);
  end 


 -- Delete trigger button.
 elseif (string.find(this:GetName(), "DeleteTriggerButton")) then
  -- Hide the trigger event message editbox if it's shown.
  MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab5FrameMessageEditbox");

  -- Hide the trigger configuration frame.
  getglobal(TRIGGER_CONFIGURATION_FRAME_NAME):Hide();

  -- Make sure the trigger key is set for the button.
  if (this:GetParent().TriggerKey ~= nil) then
   MikSBTOpt.DeleteTrigger(this:GetParent().TriggerKey);
  end


 -- Save trigger config button.
 elseif (this:GetName() == TRIGGER_CONFIGURATION_FRAME_NAME .. "SaveTriggerButton") then
  -- Save the trigger config and hide the frame.
  MikSBTOpt.SaveTriggerConfig();
  getglobal(TRIGGER_CONFIGURATION_FRAME_NAME):Hide();

 -- Cancel trigger config button.
 elseif (this:GetName() == TRIGGER_CONFIGURATION_FRAME_NAME .. "CancelTriggerButton") then
  -- Hide the frame.
  getglobal(TRIGGER_CONFIGURATION_FRAME_NAME):Hide();


 -- Add suppression button.
 elseif (this:GetName() == OPTIONS_FRAME_NAME .. "Tab6FrameAddSuppressionButton") then
  -- Add a new suppression.
  MikSBTOpt.AddNewSuppression();

 -- Delete suppression button.
 elseif (string.find(this:GetName(), "DeleteSuppressionButton")) then
  -- Hide the suppression event message editbox if it's shown.
  MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab6FrameMessageEditbox");

  -- Make sure the suppression key is set for the button.
  local suppressionKey = this:GetParent().SuppressionKey;
  if (suppressionKey ~= nil) then
   -- Remove the suppression.
   MikSBT.CurrentProfile.Suppressions[suppressionKey] = nil;

   -- Repopulate the suppression settings.
   MikSBTOpt.PopulateSuppressionSettings();
  end

 end
end




-- **********************************************************************************
-- This function will enable and disable the load and delete profile
-- buttons according to which profile is selected.
-- **********************************************************************************
function MikSBTOpt.EnableDisableProfileButtons()
 local profileDropdown = getglobal(OPTIONS_FRAME_NAME .. "Tab1FrameProfileDropdown");
 local deleteProfileButton = getglobal(OPTIONS_FRAME_NAME .. "Tab1FrameDeleteProfileButton");
 local loadProfileButton = getglobal(OPTIONS_FRAME_NAME .. "Tab1FrameLoadProfileButton");

 -- Enable the profile button manipulation buttons.
 deleteProfileButton:Enable();
 loadProfileButton:Enable();

 -- Check if the default profile is selected and disable the delete profile button.
 if (UIDropDownMenu_GetSelectedValue(profileDropdown) == MikSBT.DEFAULT_PROFILE_NAME) then
  deleteProfileButton:Disable();
 end 

 -- Check if it's the currently loaded profile and disable the load button.
 if (UIDropDownMenu_GetSelectedValue(profileDropdown) == MikSBT_Save.CurrentProfile) then
  loadProfileButton:Disable();
 end
end


-------------------------------------------------------------------------------------
-- Editbox Functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Initializes all the editboxes.
-- **********************************************************************************
function MikSBTOpt.InitEditboxes()
 -- Setup the new profile name editbox.
 local key = "Tab1FrameNewProfileNameEditbox";
 MikSBTOpt.SetupEditbox(OPTIONS_FRAME_NAME .. key, MikSBTOpt.EDITBOXES[key].Label, MikSBTOpt.EDITBOXES[key].Tooltip, nil);

 -- Setup the scroll area X and Y offset editboxes.
 key = "XOffsetEditbox";	MikSBTOpt.SetupEditbox(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. key, MikSBTOpt.EDITBOXES[key].Label, MikSBTOpt.EDITBOXES[key].Tooltip, nil);
 key = "YOffsetEditbox";	MikSBTOpt.SetupEditbox(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. key, MikSBTOpt.EDITBOXES[key].Label, MikSBTOpt.EDITBOXES[key].Tooltip, nil);

 key = "IconNameEditbox";	MikSBTOpt.SetupEditbox(TRIGGER_CONFIGURATION_FRAME_NAME .. key, MikSBTOpt.EDITBOXES[key].Label, MikSBTOpt.EDITBOXES[key].Tooltip, nil);
 
 key = "SearchPattern1Editbox";	MikSBTOpt.SetupEditbox(TRIGGER_CONFIGURATION_FRAME_NAME .. key, MikSBTOpt.EDITBOXES[key].Label, MikSBTOpt.EDITBOXES[key].Tooltip, nil);
 key = "SearchPattern2Editbox";	MikSBTOpt.SetupEditbox(TRIGGER_CONFIGURATION_FRAME_NAME .. key, MikSBTOpt.EDITBOXES[key].Label, MikSBTOpt.EDITBOXES[key].Tooltip, nil);
end


-- **********************************************************************************
-- Sets up an editbox with the passed data.
-- **********************************************************************************
function MikSBTOpt.SetupEditbox(frameName, label, tooltip, varPath)
 local associatedFrame = getglobal(frameName);

 -- Make sure the associated frame exists.
 if (associatedFrame) then
  associatedFrame.tooltipText = tooltip;
  associatedFrame.associatedVarPath = varPath;

  -- Set the label for the editbox.
  getglobal(frameName .. "Label"):SetText(label);
 end
end


-- **********************************************************************************
-- Sets the editbox's text for the passed frame name.  If a value is passed
-- it is used, otherwise the function will attempt to get the value from the
-- associatedVarPath field of the editbox frame.
-- **********************************************************************************
function MikSBTOpt.PopulateEditbox(frameName, editboxValue)
 local associatedFrame = getglobal(frameName);

 -- Make sure the associated frame exists.
 if (associatedFrame) then
  local tempValue = editboxValue;

  -- Check if no value was passed.
  if (tempValue == nil) then
   -- Check if there is an associated variable path for the editbox.
   if (associatedFrame.associatedVarPath) then
    tempValue = MikSBT.GetOptionFromVarPath(associatedFrame.associatedVarPath);
   end
  end

  -- Make sure there is a value to set.
  if (tempValue) then
   -- Set the value.
   associatedFrame:SetText(tempValue);
  end
 end
end


-- **********************************************************************************
-- Called when the text changes in an edit box.
-- **********************************************************************************
function MikSBTOpt.EditboxOnTextChanged()
 -- New Profile Name.
 if (this:GetName() == OPTIONS_FRAME_NAME .. "Tab1FrameNewProfileNameEditbox") then
  local createProfileButton = getglobal(OPTIONS_FRAME_NAME .. "Tab1FrameCreateProfileButton");

  -- Enable the create profile button.
  createProfileButton:Enable();

  -- Check if there is no text and disable the create profile button.
  if (this:GetText() == "") then 
   createProfileButton:Disable();
  -- Check if the profile already exists.
  elseif (MikSBT.ProfileExists(this:GetText())) then
   createProfileButton:Disable();
  end


 -- Scroll Area X Offset.
 elseif (this:GetName() == SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "XOffsetEditbox") then
  -- Get the number in the x offset editbox and make sure it's valid.
  local xOffset = tonumber(this:GetText());
  if (xOffset ~= nil) then
   MikSBTOpt.SaveScrollAreaControlsToCurrentSettings();
   MikSBTOpt.RepositionScrollAreaMoverFrames();   
  end


 -- Scroll Area Y Offset.
 elseif (this:GetName() == SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "YOffsetEditbox") then
  -- Get the number in the y offset editbox and make sure it's valid.
  local yOffset = tonumber(this:GetText());
  if (yOffset ~= nil) then
   MikSBTOpt.SaveScrollAreaControlsToCurrentSettings();
   MikSBTOpt.RepositionScrollAreaMoverFrames();   
  end


 else
  -- Check if there is an associated variable path and set it to the correct value.
  if (this.associatedVarPath) then
   -- Set the associated variable in the current profile to the value.
   MikSBT.SetOptionFromVarPath(this.associatedVarPath, this:GetText());
  end
 end
end





-------------------------------------------------------------------------------------
-- Color swatch functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Sets up a color swatch with the passed data.
-- **********************************************************************************
function MikSBTOpt.SetupColorSwatch(frameName, tooltip, varPath)
 local associatedFrame = getglobal(frameName);

 -- Make sure the associated frame exists.
 if (associatedFrame) then
  associatedFrame.tooltipText = tooltip;
  associatedFrame.associatedVarPath = varPath;
 end
end


-- **********************************************************************************
-- Sets the color swatch's color for the passed frame name.  If color values are
-- passed they are used, otherwise the function will attempt to get the values from
-- the associatedVarPath field of the color swatch frame.
-- **********************************************************************************
function MikSBTOpt.PopulateColorSwatch(frameName, colorR, colorG, colorB)
 local associatedFrame = getglobal(frameName);

 -- Make sure the associated frame exists.
 if (associatedFrame) then
  local tempR = colorR;
  local tempG = colorG;
  local tempB = colorB;

  -- Check if no r value was passed.
  if (tempR == nil) then
   -- Check if there is an associated variable path for the color swatch.
   if (associatedFrame.associatedVarPath) then
    tempR = MikSBT.GetOptionFromVarPath(associatedFrame.associatedVarPath .. ".r");
   end
  end

  -- Check if no g value was passed.
  if (tempG == nil) then
   -- Check if there is an associated variable path for the color swatch.
   if (associatedFrame.associatedVarPath) then
    tempG = MikSBT.GetOptionFromVarPath(associatedFrame.associatedVarPath .. ".g");
   end
  end

  -- Check if no b value was passed.
  if (tempB == nil) then
   -- Check if there is an associated variable path for the color swatch.
   if (associatedFrame.associatedVarPath) then
    tempB = MikSBT.GetOptionFromVarPath(associatedFrame.associatedVarPath .. ".b");
   end
  end

  -- Make sure there are values to set.
  if (tempR ~= nil and tempG ~= nil and tempB ~= nil) then
   -- Set the values.
   local objColorSwatchTexture = getglobal(associatedFrame:GetName() .. "NormalTexture");
   objColorSwatchTexture:SetVertexColor(tempR, tempG, tempB);
  end
 end
end


-- **********************************************************************************
-- Called when on of the color swatches for an event is clicked.
-- **********************************************************************************
function MikSBTOpt.ColorSwatchOnClick()
 -- Check if the color swatch has an associated variable path.
 if (this.associatedVarPath) then
  -- Hide the event message editbox if it's shown.
  MikSBTOpt.HideMessageEditbox(this:GetParent():GetParent():GetName().. "MessageEditbox");
  
  -- Get the r, g, and b values from the associated variable path and show the color picker.
  this.r = MikSBT.GetOptionFromVarPath(this.associatedVarPath .. ".r");
  this.g = MikSBT.GetOptionFromVarPath(this.associatedVarPath .. ".g");
  this.b = MikSBT.GetOptionFromVarPath(this.associatedVarPath .. ".b");
  this.swatchFunc = MikSBTOpt.ColorSwatchSetColor;
  this.cancelFunc = MikSBTOpt.ColorSwatchCancel;
  ColorPickerFrame.associatedVarPath = this.associatedVarPath;
  ColorPickerFrame.associatedColorSwatch = this;
  UIDropDownMenuButton_OpenColorPicker(this);
 end
end


-- **********************************************************************************
-- Caled when a color is selected for an event in the color picker dialog.
-- **********************************************************************************
function MikSBTOpt.ColorSwatchSetColor()
 -- Get the red, green, and blue color values.
 local r, g, b = ColorPickerFrame:GetColorRGB();

 -- Make sure there is an associated color swatch.
 if (ColorPickerFrame.associatedColorSwatch) then
  -- Get the associated color swatch texture and make sure it's valid.
  local objColorSwatchTexture = getglobal(ColorPickerFrame.associatedColorSwatch:GetName() .. "NormalTexture");
  if (objColorSwatchTexture) then
   -- Set the associated 
   objColorSwatchTexture:SetVertexColor(r, g, b);
  end
 end


 -- Check if the color swatch has an associated variable path.
 if (ColorPickerFrame.associatedVarPath) then
  -- Update current profile data.
  MikSBT.SetOptionFromVarPath(ColorPickerFrame.associatedVarPath .. ".r", r);
  MikSBT.SetOptionFromVarPath(ColorPickerFrame.associatedVarPath .. ".g", g);
  MikSBT.SetOptionFromVarPath(ColorPickerFrame.associatedVarPath .. ".b", b);
 end 
end


-- **********************************************************************************
-- Called when the color picker dialog is canceled.
-- **********************************************************************************
function MikSBTOpt.ColorSwatchCancel(previousValues)
 -- Make sure there is an associated color swatch.
 if (ColorPickerFrame.associatedColorSwatch) then
  -- Get the associated color swatch texture and make sure it's valid.
  local objColorSwatchTexture = getglobal(ColorPickerFrame.associatedColorSwatch:GetName() .. "NormalTexture");
  if (objColorSwatchTexture) then
   -- Set the associated 
   objColorSwatchTexture:SetVertexColor(previousValues.r, previousValues.g, previousValues.b);
  end
 end

 -- Check if the color swatch has an associated variable path.
 if (ColorPickerFrame.associatedVarPath) then
  -- Update current profile data.
  MikSBT.SetOptionFromVarPath(ColorPickerFrame.associatedVarPath .. ".r", previousValues.r);
  MikSBT.SetOptionFromVarPath(ColorPickerFrame.associatedVarPath .. ".g", previousValues.g);
  MikSBT.SetOptionFromVarPath(ColorPickerFrame.associatedVarPath .. ".b", previousValues.b);
 end
end



-------------------------------------------------------------------------------------
-- Event settings functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Initializes all the events.
-- **********************************************************************************
function MikSBTOpt.InitEvents()
 local index;
 local evtData;

 evtData = MikSBTOpt.INCOMING_EVENTS;
 index = 1;		evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_DAMAGE";
 index = 2;		evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_MISS";
 index = 3;		evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_DODGE";
 index = 4;		evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PARRY";
 index = 5;		evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_BLOCK";
 index = 6;		evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_ABSORB";
 index = 7;		evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_IMMUNE";
 index = 8;		evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_SPELL_DAMAGE";
 index = 9;		evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_SPELL_DOT";
 index = 10;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_SPELL_MISS";
 index = 11;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_SPELL_DODGE";
 index = 12;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_SPELL_PARRY";
 index = 13;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_SPELL_BLOCK";
 index = 14;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_SPELL_RESIST";
 index = 15;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_SPELL_ABSORB";
 index = 16;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_SPELL_IMMUNE";
 index = 17;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_SPELL_REFLECT";
 index = 18;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_HEAL";
 index = 19;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_HOT";
 index = 20;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_ENVIRONMENTAL";
 index = 21;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_DAMAGE";
 index = 22;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_MISS";
 index = 23;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_DODGE";
 index = 24;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_PARRY";
 index = 25;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_BLOCK";
 index = 26;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_ABSORB";
 index = 27;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_IMMUNE";
 index = 28;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_SPELL_DAMAGE";
 index = 29;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_SPELL_DOT";
 index = 30;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_SPELL_MISS";
 index = 31;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_SPELL_DODGE";
 index = 32;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_SPELL_PARRY";
 index = 33;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_SPELL_BLOCK";
 index = 34;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_SPELL_RESIST";
 index = 35;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_SPELL_ABSORB";
 index = 36;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_SPELL_IMMUNE";
 index = 37;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_HEAL";
 index = 38;	evtData[index].EventType = "MSBT_EVENTTYPE_INCOMING_PET_HOT";


 evtData = MikSBTOpt.OUTGOING_EVENTS;
 index = 1;		evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_DAMAGE";
 index = 2;		evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_MISS";
 index = 3;		evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_DODGE";
 index = 4;		evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PARRY";
 index = 5;		evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_BLOCK";
 index = 6;		evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_ABSORB";
 index = 7;		evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_IMMUNE";
 index = 8;		evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_EVADE";
 index = 9;		evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_SPELL_DAMAGE";
 index = 10;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_SPELL_DOT";
 index = 11;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_SPELL_MISS";
 index = 12;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_SPELL_DODGE";
 index = 13;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_SPELL_PARRY";
 index = 14;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_SPELL_BLOCK";
 index = 15;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_SPELL_RESIST";
 index = 16;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_SPELL_ABSORB";
 index = 17;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_SPELL_IMMUNE";
 index = 18;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_SPELL_REFLECT";
 index = 19;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_SPELL_EVADE";
 index = 20;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_HEAL";
 index = 21;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_HOT";
 index = 22;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_DAMAGE";
 index = 23;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_MISS";
 index = 24;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_DODGE";
 index = 25;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_PARRY";
 index = 26;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_BLOCK";
 index = 27;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_ABSORB";
 index = 28;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_IMMUNE";
 index = 29;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_EVADE";
 index = 30;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_SPELL_DAMAGE";
 index = 31;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_SPELL_MISS";
 index = 32;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_SPELL_DODGE";
 index = 33;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_SPELL_PARRY";
 index = 34;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_SPELL_BLOCK";
 index = 35;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_SPELL_RESIST";
 index = 36;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_SPELL_ABSORB";
 index = 37;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_SPELL_IMMUNE";
 index = 38;	evtData[index].EventType = "MSBT_EVENTTYPE_OUTGOING_PET_SPELL_EVADE";


 evtData = MikSBTOpt.NOTIFICATION_EVENTS;
 index = 1;		evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_DEBUFF";
 index = 2;		evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_BUFF";
 index = 3;		evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_ITEM_BUFF";
 index = 4;		evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_BUFF_FADE";
 index = 5;		evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_COMBAT_ENTER";
 index = 6;		evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_COMBAT_LEAVE";
 index = 7;		evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_POWER_GAIN";
 index = 8;		evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_POWER_LOSS";
 index = 9;		evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_CP_GAIN";
 index = 10;	evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_CP_FULL";
 index = 11;	evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_HONOR_GAIN";
 index = 12;	evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_REP_GAIN";
 index = 13;	evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_REP_LOSS";
 index = 14;	evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_SKILL_GAIN";
 index = 15;	evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_EXPERIENCE_GAIN";
 index = 16;	evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_PC_KILLING_BLOW";
 index = 17;	evtData[index].EventType = "MSBT_EVENTTYPE_NOTIFICATION_NPC_KILLING_BLOW";
end


-- **********************************************************************************
-- This function populates the incoming event settings.
-- **********************************************************************************
function MikSBTOpt.PopulateIncomingEventSettings()
 -- Hide the event message editbox if it's shown.
 MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab2FrameMessageEditbox");

 -- Get the total number of events.
 totalItems = table.getn(MikSBTOpt.INCOMING_EVENTS);

 -- Get the incoming event settings scroll frame and its offset.
 local objFrame = getglobal(OPTIONS_FRAME_NAME .. "Tab2FrameEventsScrollFrame");
 FauxScrollFrame_Update(objFrame, totalItems, EVENT_ITEMS_PER_PAGE, EVENT_ITEM_HEIGHT);
 local skipCount = FauxScrollFrame_GetOffset(objFrame);

 local objEventSettings = nil;
 -- Loop through all of the visible items.
 for i = 1, EVENT_ITEMS_PER_PAGE do
  objEventSettings = getglobal(OPTIONS_FRAME_NAME .. "Tab2FrameEvent" .. i);

  -- Make sure the event settings object exists.
  if (objEventSettings) then
   -- Check if there is not event settings data for the event settings slot.
   if (i > totalItems) then
    -- Hide the event settings.
    objEventSettings:Hide();

   -- There is data for the event settings slot.
   else
    -- Get the data for the event.
    local evtData = MikSBTOpt.INCOMING_EVENTS[i+skipCount];

    -- Make sure there is an associated event type and set it.
    if (evtData.EventType ~= nil) then
     objEventSettings.EventType = evtData.EventType;
    end

    -- Set the font frame title to the checkbox's label and the event area.
    objEventSettings.FontFrameTitle = evtData.Label;
    objEventSettings.EventArea = "Incoming";


    -- Setup the color swatch and populate it.
    MikSBTOpt.SetupColorSwatch(objEventSettings:GetName() .. "ColorSwatch", MikSBTOpt.MSG_EVENT_COLOR_SWATCH_TOOLTIP, "EventSettings." .. objEventSettings.EventType .. ".FontSettings.Color");
    MikSBTOpt.PopulateColorSwatch(objEventSettings:GetName() .. "ColorSwatch");
    
    -- Setup and populate the event settings show checkbox.
    MikSBTOpt.SetupCheckbox(objEventSettings:GetName() .. "ShowEventCheckbox", evtData.Label, evtData.Tooltips.ShowCheckbox, "EventSettings." .. objEventSettings.EventType .. ".Show");
    MikSBTOpt.PopulateCheckbox(objEventSettings:GetName() .. "ShowEventCheckbox");


    -- Set the message label to the appropriate text and the editbox's tooltip.
    local objMessageLabel = getglobal(objEventSettings:GetName() .. "MessageLabel");
    if (objMessageLabel) then
     -- Set the tooltip for the label.
     objMessageLabel:GetParent().tooltipText = MikSBTOpt.MSG_EVENT_MESSAGE_LABEL_TOOLTIP;
     if (objEventSettings.EventType ~= nil) then
      objMessageLabel:SetText(MikSBT.GetOptionFromVarPath("EventSettings." .. objEventSettings.EventType .. ".Message"));
     end
    end
    objEventSettings.EditboxTooltip = evtData.Tooltips.Editbox;

    -- Hide the sticky event checkbox.
    getglobal(objEventSettings:GetName() .. "StickyEventCheckbox"):Hide();

    
    -- Setup the edit font settings button for the event.
    MikSBTOpt.SetupButton(objEventSettings:GetName() .. "EditFontSettingsButton", MikSBTOpt.MSG_EVENT_EDIT_FONT_SETTINGS_BUTTON_LABEL, MikSBTOpt.MSG_EVENT_EDIT_FONT_SETTINGS_BUTTON_TOOLTIP);

    -- Show the event settings.
    objEventSettings:Show();
   end
  end
 end
 
end


-- **********************************************************************************
-- This function populates the outgoing event settings.
-- **********************************************************************************
function MikSBTOpt.PopulateOutgoingEventSettings()
 -- Hide the event message editbox if it's shown.
 MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab3FrameMessageEditbox");

 -- Get the total number of events.
 totalItems = table.getn(MikSBTOpt.OUTGOING_EVENTS);

 -- Get the outgoing event settings scroll frame and its offset.
 local objFrame = getglobal(OPTIONS_FRAME_NAME .. "Tab3FrameEventsScrollFrame");
 FauxScrollFrame_Update(objFrame, totalItems, EVENT_ITEMS_PER_PAGE, EVENT_ITEM_HEIGHT);
 local skipCount = FauxScrollFrame_GetOffset(objFrame);

 local objEventSettings = nil;
 -- Loop through all of the visible items.
 for i = 1, EVENT_ITEMS_PER_PAGE do
  objEventSettings = getglobal(OPTIONS_FRAME_NAME .. "Tab3FrameEvent" .. i);

  -- Make sure the event settings object exists.
  if (objEventSettings) then
   -- Check if there is not event settings data for the event settings slot.
   if (i > totalItems) then
    -- Hide the event settings.
    objEventSettings:Hide();

   -- There is data for the event settings slot.
   else
    -- Get the data for the event.
    local evtData = MikSBTOpt.OUTGOING_EVENTS[i+skipCount];

    -- Make sure there is an associated event type and set it.
    if (evtData.EventType ~= nil) then
     objEventSettings.EventType = evtData.EventType;
    end

    -- Set the font frame title to the checkbox's label and the event area.
    objEventSettings.FontFrameTitle = evtData.Label;
    objEventSettings.EventArea = "Outgoing";


    -- Setup the color swatch and populate it.
    MikSBTOpt.SetupColorSwatch(objEventSettings:GetName() .. "ColorSwatch", MikSBTOpt.MSG_EVENT_COLOR_SWATCH_TOOLTIP, "EventSettings." .. objEventSettings.EventType .. ".FontSettings.Color");
    MikSBTOpt.PopulateColorSwatch(objEventSettings:GetName() .. "ColorSwatch");
    
    -- Setup and populate the event settings show checkbox.
    MikSBTOpt.SetupCheckbox(objEventSettings:GetName() .. "ShowEventCheckbox", evtData.Label, evtData.Tooltips.ShowCheckbox, "EventSettings." .. objEventSettings.EventType .. ".Show");
    MikSBTOpt.PopulateCheckbox(objEventSettings:GetName() .. "ShowEventCheckbox");


    -- Set the message label to the appropriate text and the editbox's tooltip.
    local objMessageLabel = getglobal(objEventSettings:GetName() .. "MessageLabel");
    if (objMessageLabel) then
     -- Set the tooltip for the label.
     objMessageLabel:GetParent().tooltipText = MikSBTOpt.MSG_EVENT_MESSAGE_LABEL_TOOLTIP;
     if (objEventSettings.EventType ~= nil) then
      objMessageLabel:SetText(MikSBT.GetOptionFromVarPath("EventSettings." .. objEventSettings.EventType .. ".Message"));
     end
    end
    objEventSettings.EditboxTooltip = evtData.Tooltips.Editbox;

    -- Hide the sticky event checkbox.
    getglobal(objEventSettings:GetName() .. "StickyEventCheckbox"):Hide();

    
    -- Setup the edit font settings button for the event.
    MikSBTOpt.SetupButton(objEventSettings:GetName() .. "EditFontSettingsButton", MikSBTOpt.MSG_EVENT_EDIT_FONT_SETTINGS_BUTTON_LABEL, MikSBTOpt.MSG_EVENT_EDIT_FONT_SETTINGS_BUTTON_TOOLTIP);

    -- Show the event settings.
    objEventSettings:Show();
   end
  end
 end
 
end


-- **********************************************************************************
-- This function populates the notification event settings.
-- **********************************************************************************
function MikSBTOpt.PopulateNotificationEventSettings()
 -- Hide the event message editbox if it's shown.
 MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab4FrameMessageEditbox");

 -- Get the total number of events.
 totalItems = table.getn(MikSBTOpt.NOTIFICATION_EVENTS);

 -- Get the notification event settings scroll frame and its offset.
 local objFrame = getglobal(OPTIONS_FRAME_NAME .. "Tab4FrameEventsScrollFrame");
 FauxScrollFrame_Update(objFrame, totalItems, EVENT_ITEMS_PER_PAGE, EVENT_ITEM_HEIGHT);
 local skipCount = FauxScrollFrame_GetOffset(objFrame);

 local objEventSettings = nil;
 -- Loop through all of the visible items.
 for i = 1, EVENT_ITEMS_PER_PAGE do
  objEventSettings = getglobal(OPTIONS_FRAME_NAME .. "Tab4FrameEvent" .. i);

  -- Make sure the event settings object exists.
  if (objEventSettings) then
   -- Check if there is not event settings data for the event settings slot.
   if (i > totalItems) then
    -- Hide the event settings.
    objEventSettings:Hide();

   -- There is data for the event settings slot.
   else
    -- Get the data for the event.
    local evtData = MikSBTOpt.NOTIFICATION_EVENTS[i+skipCount];

    -- Make sure there is an associated event type and set it.
    if (evtData.EventType ~= nil) then
     objEventSettings.EventType = evtData.EventType;
    end

    -- Set the font frame title to the checkbox's label and the event area.
    objEventSettings.FontFrameTitle = evtData.Label;
    objEventSettings.EventArea = "Outgoing";


    -- Setup the color swatch and populate it.
    MikSBTOpt.SetupColorSwatch(objEventSettings:GetName() .. "ColorSwatch", MikSBTOpt.MSG_EVENT_COLOR_SWATCH_TOOLTIP, "EventSettings." .. objEventSettings.EventType .. ".FontSettings.Color");
    MikSBTOpt.PopulateColorSwatch(objEventSettings:GetName() .. "ColorSwatch");
    
    -- Setup and populate the event settings show checkbox.
    MikSBTOpt.SetupCheckbox(objEventSettings:GetName() .. "ShowEventCheckbox", evtData.Label, evtData.Tooltips.ShowCheckbox, "EventSettings." .. objEventSettings.EventType .. ".Show");
    MikSBTOpt.PopulateCheckbox(objEventSettings:GetName() .. "ShowEventCheckbox");


    -- Set the message label to the appropriate text and the editbox's tooltip.
    local objMessageLabel = getglobal(objEventSettings:GetName() .. "MessageLabel");
    if (objMessageLabel) then
     -- Set the tooltip for the label.
     objMessageLabel:GetParent().tooltipText = MikSBTOpt.MSG_EVENT_MESSAGE_LABEL_TOOLTIP;
     if (objEventSettings.EventType ~= nil) then
      objMessageLabel:SetText(MikSBT.GetOptionFromVarPath("EventSettings." .. objEventSettings.EventType .. ".Message"));
     end
    end
    objEventSettings.EditboxTooltip = evtData.Tooltips.Editbox;

    -- Setup the sticky checkbox for the event settings and populate it.
    MikSBTOpt.SetupCheckbox(objEventSettings:GetName() .. "StickyEventCheckbox", nil, MikSBTOpt.MSG_EVENT_STICKY_CHECKBOX_TOOLTIP, "EventSettings." .. objEventSettings.EventType .. ".IsSticky");
    MikSBTOpt.PopulateCheckbox(objEventSettings:GetName() .. "StickyEventCheckbox");
    getglobal(objEventSettings:GetName() .. "StickyEventCheckbox"):Show();



    -- Setup the edit font settings button for the event.
    MikSBTOpt.SetupButton(objEventSettings:GetName() .. "EditFontSettingsButton", MikSBTOpt.MSG_EVENT_EDIT_FONT_SETTINGS_BUTTON_LABEL, MikSBTOpt.MSG_EVENT_EDIT_FONT_SETTINGS_BUTTON_TOOLTIP);

    -- Show the event settings.
    objEventSettings:Show();
   end
  end
 end
 
end


-- **********************************************************************************
-- This function populates the trigger event settings.
-- **********************************************************************************
function MikSBTOpt.PopulateTriggerEventSettings()
 -- Hide the trigger event message editbox if it's shown.
 MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab5FrameMessageEditbox");

 -- Get the total number of events.
 totalItems = MikSBTOpt.CountTriggers();

 -- Get the trigger settings scroll frame and its offset.
 local objFrame = getglobal(OPTIONS_FRAME_NAME .. "Tab5FrameTriggersScrollFrame");
 FauxScrollFrame_Update(objFrame, totalItems, TRIGGER_ITEMS_PER_PAGE, TRIGGER_ITEM_HEIGHT);
 local skipCount = FauxScrollFrame_GetOffset(objFrame);

 local objTriggerEventSettings = nil;
 -- Loop through all of the visible items.
 for i = 1, TRIGGER_ITEMS_PER_PAGE do
  objTriggerEventSettings = getglobal(OPTIONS_FRAME_NAME .. "Tab5FrameTrigger" .. i);

  -- Make sure the trigger settings object exists.
  if (objTriggerEventSettings) then
   -- Check if there is not trigger settings data for the trigger settings slot.
   if (i > totalItems) then
    -- Hide the trigger settings.
    objTriggerEventSettings:Hide();

   -- There is data for the trigger settings slot.
   else
    -- Get the data for the trigger.
    local triggerKey, triggerSettings = MikSBTOpt.GetTriggerSettings(i+skipCount);

    -- Set the trigger key, font frame title to the checkbox's label and the event area.
    objTriggerEventSettings.TriggerKey = triggerKey;
    objTriggerEventSettings.FontFrameTitle = triggerSettings.EventSettings.Message;
    objTriggerEventSettings.EventArea = "Trigger";


    -- Setup the color swatch and populate it.
    MikSBTOpt.SetupColorSwatch(objTriggerEventSettings:GetName() .. "ColorSwatch", MikSBTOpt.MSG_EVENT_COLOR_SWATCH_TOOLTIP, "Triggers." .. triggerKey .. ".EventSettings.FontSettings.Color");
    MikSBTOpt.PopulateColorSwatch(objTriggerEventSettings:GetName() .. "ColorSwatch");
    

    -- Setup and populate the trigger event settings enable checkbox.
    MikSBTOpt.SetupCheckbox(objTriggerEventSettings:GetName() .. "EnableTriggerCheckbox", nil, MikSBTOpt.MSG_TRIGGER_ENABLE_TOOLTIP, "Triggers." .. triggerKey .. ".EventSettings.Show");
    MikSBTOpt.PopulateCheckbox(objTriggerEventSettings:GetName() .. "EnableTriggerCheckbox");


    -- Set the message label to the appropriate text and the editbox's tooltip.
    local objMessageLabel = getglobal(objTriggerEventSettings:GetName() .. "MessageLabel");
    if (objMessageLabel) then
     -- Set the tooltip for the label.
     objMessageLabel:GetParent().tooltipText = MikSBTOpt.MSG_TRIGGER_MESSAGE_LABEL_TOOLTIP;
     objMessageLabel:SetText(triggerSettings.EventSettings.Message);
    end
    objTriggerEventSettings.EditboxTooltip = MikSBTOpt.MSG_TRIGGER_MESSAGE_EDITBOX_TOOLTIP;


    -- Setup the sticky checkbox for the trigger event settings and populate it.
    MikSBTOpt.SetupCheckbox(objTriggerEventSettings:GetName() .. "StickyEventCheckbox", nil, MikSBTOpt.MSG_TRIGGER_STICKY_CHECKBOX_TOOLTIP, "Triggers." .. triggerKey .. ".EventSettings.IsSticky");
    MikSBTOpt.PopulateCheckbox(objTriggerEventSettings:GetName() .. "StickyEventCheckbox");

    -- Setup the edit font settings button for the event.
    MikSBTOpt.SetupButton(objTriggerEventSettings:GetName() .. "EditFontSettingsButton", MikSBTOpt.MSG_TRIGGER_EDIT_FONT_SETTINGS_BUTTON_LABEL, MikSBTOpt.MSG_TRIGGER_EDIT_FONT_SETTINGS_BUTTON_TOOLTIP);

    -- Setup the edit trigger settings button for the event.
    MikSBTOpt.SetupButton(objTriggerEventSettings:GetName() .. "EditTriggerSettingsButton", MikSBTOpt.MSG_TRIGGER_EDIT_TRIGGER_SETTINGS_BUTTON_LABEL, MikSBTOpt.MSG_TRIGGER_EDIT_TRIGGER_SETTINGS_BUTTON_TOOLTIP);

    -- Setup the delete trigger button for the event.
    MikSBTOpt.SetupButton(objTriggerEventSettings:GetName() .. "DeleteTriggerButton", "X", MikSBTOpt.MSG_TRIGGER_DELETE_TRIGGER_BUTTON_TOOLTIP);

    -- Show the trigger settings.
    objTriggerEventSettings:Show();
   end
  end
 end
 
end


-- **********************************************************************************
-- This function populates the suppression settings.
-- **********************************************************************************
function MikSBTOpt.PopulateSuppressionSettings()
 -- Hide the suppression editbox if it's shown.
 MikSBTOpt.HideMessageEditbox(OPTIONS_FRAME_NAME .. "Tab6FrameMessageEditbox");

 -- Get the total number of suppressions.
 totalItems = MikSBTOpt.CountSuppressions();

 -- Get the trigger settings scroll frame and its offset.
 local objFrame = getglobal(OPTIONS_FRAME_NAME .. "Tab6FrameSuppressionsScrollFrame");
 FauxScrollFrame_Update(objFrame, totalItems, SUPPRESSION_ITEMS_PER_PAGE, SUPPRESSION_ITEM_HEIGHT);
 local skipCount = FauxScrollFrame_GetOffset(objFrame);

 -- Loop through all of the visible items.
 for i = 1, SUPPRESSION_ITEMS_PER_PAGE do
  objSuppressionItemSettings = getglobal(OPTIONS_FRAME_NAME .. "Tab6FrameSuppression" .. i);

  -- Make sure the suppression settings object exists.
  if (objSuppressionItemSettings) then
   -- Check if there is not suppression settings data for the suppression settings slot.
   if (i > totalItems) then
    -- Hide the suppression settings.
    objSuppressionItemSettings:Hide();

   -- There is data for the suppression settings slot.
   else
    local suppressionKey, suppressionSettings = MikSBTOpt.GetSuppressionSettings(i+skipCount);

    -- Set the suppression key.
    objSuppressionItemSettings.SuppressionKey = suppressionKey;

    -- Setup and populate the enable suppression checkbox.
    MikSBTOpt.SetupCheckbox(objSuppressionItemSettings:GetName() .. "EnableSuppressionCheckbox", nil, MikSBTOpt.MSG_SUPPRESSION_ENABLE_TOOLTIP, "Suppressions." .. suppressionKey .. ".Enabled");
    MikSBTOpt.PopulateCheckbox(objSuppressionItemSettings:GetName() .. "EnableSuppressionCheckbox");


    -- Set the message label to the appropriate text and the editbox's tooltip.
    local objMessageLabel = getglobal(objSuppressionItemSettings:GetName() .. "MessageLabel");
    if (objMessageLabel) then
     -- Set the tooltip for the label.
     objMessageLabel:GetParent().tooltipText = MikSBTOpt.MSG_SUPPRESSION_MESSAGE_LABEL_TOOLTIP;
     objMessageLabel:SetText(suppressionSettings.SearchPattern);
    end
    objSuppressionItemSettings.EditboxTooltip = MikSBTOpt.MSG_SUPPRESSION_MESSAGE_EDITBOX_TOOLTIP;


    -- Setup the delete suppression button for the item.
    MikSBTOpt.SetupButton(objSuppressionItemSettings:GetName() .. "DeleteSuppressionButton", "X", MikSBTOpt.MSG_SUPPRESSION_DELETE_SUPPRESSION_BUTTON_TOOLTIP);

    -- Show the suppression settings.
    objSuppressionItemSettings:Show();
   end
  end
 end
end


-- **********************************************************************************
-- Returns the number of triggers defined.
-- **********************************************************************************
function MikSBTOpt.CountTriggers()
 -- Declare a variable to count the number of triggers.
 local numTriggers = 0;

 -- Loop through all of the trigger entries.
 for _, triggerSettings in MikSBT.CurrentProfile.Triggers do
  numTriggers = numTriggers + 1;
 end

 -- Return the number of triggers.
 return numTriggers;
end


-- **********************************************************************************
-- Returns the number of suppressions defined.
-- **********************************************************************************
function MikSBTOpt.CountSuppressions()
 -- Declare a variable to count the number of suppressions.
 local numSuppressions = 0;

 -- Loop through all of the suppression entries.
 for _, suppressionSettings in MikSBT.CurrentProfile.Suppressions do
  numSuppressions = numSuppressions + 1;
 end

 -- Return the number of suppressions.
 return numSuppressions;
end



-- **********************************************************************************
-- Returns the trigger settings for the passed trigger number.
-- **********************************************************************************
function MikSBTOpt.GetTriggerSettings(triggerNumber)
 -- Declare a variable to count hold the number of the current trigger.
 local curTrigger = 0;

 -- Loop through all of the trigger entries.
 for triggerKey, triggerSettings in MikSBT.CurrentProfile.Triggers do
  curTrigger = curTrigger + 1;

  -- Check if this is the requested trigger.
  if (curTrigger == triggerNumber) then
   return triggerKey, triggerSettings;
  end
 end

 return nil;
end


-- **********************************************************************************
-- Returns the suppression settings for the passed suppression number.
-- **********************************************************************************
function MikSBTOpt.GetSuppressionSettings(suppressionNumber)
 -- Declare a variable to count hold the number of the current suppression.
 local curSuppression = 0;

 -- Loop through all of the suppression entries.
 for suppressionKey, suppressionSettings in MikSBT.CurrentProfile.Suppressions do
  curSuppression = curSuppression + 1;

  -- Check if this is the requested suppression.
  if (curSuppression == suppressionNumber) then
   return suppressionKey, suppressionSettings;
  end
 end

 return nil;
end


-- **********************************************************************************
-- Called when one of the event message labels is clicked.
-- **********************************************************************************
function MikSBTOpt.EventMessageLabelOnClick()
 -- Get the event settings frame.
 local objEventSettings = this:GetParent();

 -- Make sure the event type is set for the label and there is an event data index.
 if (objEventSettings.EventType ~= nil) then
  -- Get the clicked label and hide it.
  local labelFrameName = this:GetName() .. "Label";
  local objLabel = getglobal(labelFrameName);
  objLabel:Hide();

  -- Get the message editbox for the scroll area.
  local editboxFrameName = objEventSettings:GetParent():GetName() .. "MessageEditbox";
  local objEditbox = getglobal(editboxFrameName);

  -- Hide the editbox to make sure everything is updated correctly.
  objEditbox:Hide();

  -- Show the editbox where the clicked label is, set the clicked label frame name for the editbox, and
  -- set the previous text to the label's text.
  objEditbox:Show();
  objEditbox:ClearAllPoints();
  objEditbox:SetPoint("TOPLEFT", this, "TOPLEFT");
  objEditbox.ClickedLabelFrameName = labelFrameName;
  objEditbox.PreviousText = objLabel:GetText();


  -- Setup the event setting editbox and populate it.
  MikSBTOpt.SetupEditbox(editboxFrameName, nil, MikSBTOpt.MSG_EVENT_MESSAGE_EDITBOX_TOOLTIP_PREFIX .. objEventSettings.EditboxTooltip, "EventSettings." .. objEventSettings.EventType .. ".Message");
  MikSBTOpt.PopulateEditbox(editboxFrameName);

  -- Set the focus to the editbox.
  objEditbox:SetFocus();
 end
end


-- **********************************************************************************
-- Called when one of the trigger message labels is clicked.
-- **********************************************************************************
function MikSBTOpt.TriggerMessageLabelOnClick()
 -- Get the trigger event settings frame.
 local objTriggerEventSettings = this:GetParent();

 -- Make sure the trigger key is set for the label.
 if (objTriggerEventSettings.TriggerKey ~= nil) then
  -- Get the clicked label and hide it.
  local labelFrameName = this:GetName() .. "Label";
  local objLabel = getglobal(labelFrameName);
  objLabel:Hide();

  -- Get the message editbox.
  local editboxFrameName = objTriggerEventSettings:GetParent():GetName() .. "MessageEditbox";
  local objEditbox = getglobal(editboxFrameName);

  -- Hide the editbox to make sure everything is updated correctly.
  objEditbox:Hide();

  -- Show the editbox where the clicked label is, set the clicked label frame name for the editbox, and
  -- set the previous text to the label's text.
  objEditbox:Show();
  objEditbox:ClearAllPoints();
  objEditbox:SetPoint("TOPLEFT", this, "TOPLEFT");
  objEditbox.ClickedLabelFrameName = labelFrameName;
  objEditbox.PreviousText = objLabel:GetText();


  -- Setup the event setting editbox and populate it.
  MikSBTOpt.SetupEditbox(editboxFrameName, nil, objTriggerEventSettings.EditboxTooltip, "Triggers." .. objTriggerEventSettings.TriggerKey .. ".EventSettings.Message");
  MikSBTOpt.PopulateEditbox(editboxFrameName);

  -- Set the focus to the editbox.
  objEditbox:SetFocus();
 end
end


-- **********************************************************************************
-- Called when one of the suppression message labels is clicked.
-- **********************************************************************************
function MikSBTOpt.SuppressionMessageLabelOnClick()
 -- Get the suppression settings frame.
 local objSuppressionSettings = this:GetParent();

 -- Make sure the suppression key is set for the label.
 if (objSuppressionSettings.SuppressionKey ~= nil) then
  -- Get the clicked label and hide it.
  local labelFrameName = this:GetName() .. "Label";
  local objLabel = getglobal(labelFrameName);
  objLabel:Hide();

  -- Get the message editbox.
  local editboxFrameName = objSuppressionSettings:GetParent():GetName() .. "MessageEditbox";
  local objEditbox = getglobal(editboxFrameName);

  -- Hide the editbox to make sure everything is updated correctly.
  objEditbox:Hide();

  -- Show the editbox where the clicked label is, set the clicked label frame name for the editbox, and
  -- set the previous text to the label's text.
  objEditbox:Show();
  objEditbox:ClearAllPoints();
  objEditbox:SetPoint("TOPLEFT", this, "TOPLEFT");
  objEditbox.ClickedLabelFrameName = labelFrameName;
  objEditbox.PreviousText = objLabel:GetText();


  -- Setup the event setting editbox and populate it.
  MikSBTOpt.SetupEditbox(editboxFrameName, nil, objSuppressionSettings.EditboxTooltip, "Suppressions." .. objSuppressionSettings.SuppressionKey .. ".SearchPattern");
  MikSBTOpt.PopulateEditbox(editboxFrameName);

  -- Set the focus to the editbox.
  objEditbox:SetFocus();
 end
end


-- **********************************************************************************
-- Hides the message editbox.
-- **********************************************************************************
function MikSBTOpt.HideMessageEditbox(editboxFrameName)
 -- Check if the event message editbox is shown and hide it.
 local objEditbox = getglobal(editboxFrameName);
 if (objEditbox and objEditbox:IsVisible()) then
  objEditbox:Hide();
 end
end



-------------------------------------------------------------------------------------
-- Font settings functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Show master font settings.
-- **********************************************************************************
function MikSBTOpt.ShowMasterFontSettings()
 -- Show the crit font settings controls.
 MikSBTOpt.ShowCritFontControls();


 -- Setup the normal font dropdown.
 local key = "FontDropdown";
 MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Master"].Font, MikSBTOpt.FontSettingsDropdownOnClick, MikSBT.AVAILABLE_FONTS, "MasterFontSettings.Normal.FontIndex");
 MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);

 -- Setup the normal font outline dropdown.
 key = "FontOutlineDropdown";
 MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Master"].Outline, MikSBTOpt.FontSettingsDropdownOnClick, MikSBT.AVAILABLE_OUTLINES, "MasterFontSettings.Normal.OutlineIndex");
 MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);

 -- Setup the crit font dropdown.
 key = "FontCritDropdown";
 MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Master"].FontCrit, MikSBTOpt.FontSettingsDropdownOnClick, MikSBT.AVAILABLE_FONTS, "MasterFontSettings.Crit.FontIndex");
 MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);

 -- Setup the crit font outline dropdown.
 key = "FontOutlineCritDropdown";
 MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Master"].OutlineCrit, MikSBTOpt.FontSettingsDropdownOnClick, MikSBT.AVAILABLE_OUTLINES, "MasterFontSettings.Crit.OutlineIndex");
 MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);


 -- Setup the normal font size slider.
 key = "FontSizeSlider";
 MikSBTOpt.SetupSlider(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.SLIDERS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Master"].FontSize, MIN_FONT_SIZE, MAX_FONT_SIZE, 2, "MasterFontSettings.Normal.FontSize");
 MikSBTOpt.PopulateSlider(FONT_SETTINGS_FRAME_NAME .. key);

 -- Setup the crit font size slider.
 key = "FontSizeCritSlider";
 MikSBTOpt.SetupSlider(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.SLIDERS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Master"].FontSizeCrit, MIN_FONT_SIZE, MAX_FONT_SIZE, 2, "MasterFontSettings.Crit.FontSize");
 MikSBTOpt.PopulateSlider(FONT_SETTINGS_FRAME_NAME .. key);

 
 -- Hide the inherit font size and crit font size checkboxes.
 getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCheckbox"):Hide();
 getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCritCheckbox"):Hide();
 
 -- Show the font size and crit size sliders.
 getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeSlider"):Show();
 getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeCritSlider"):Show();


 -- Show the font settings frame.
 getglobal(FONT_SETTINGS_FRAME_NAME):Show();

 -- Update the font previews.
 MikSBTOpt.UpdateFontPreviews();
end


-- **********************************************************************************
-- Show blizzard font settings.
-- **********************************************************************************
function MikSBTOpt.ShowBlizzardFontSettings()
 -- Hide the crit font settings controls.
 MikSBTOpt.HideCritFontControls()
 
 local fontSettingsFrame = getglobal(FONT_SETTINGS_FRAME_NAME);
 fontSettingsFrame.InheritedOutlineIndex = MikSBT.GetOptionFromVarPath("MasterFontSettings.Normal.OutlineIndex");
 fontSettingsFrame.InheritedFontSize = MikSBT.GetOptionFromVarPath("MasterFontSettings.Normal.FontSize");
 
 -- Setup the normal font dropdown.
 local key = "FontDropdown";
 MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Blizzard"].Font, MikSBTOpt.FontSettingsDropdownOnClick, MikSBT.AVAILABLE_FONTS, "BlizzardFontSettings.Normal.FontIndex");
 MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);

 -- Hide the inherit font size and crit font size checkboxes.
 getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCheckbox"):Hide();
 
 -- Hide the dropdown button.
 getglobal(FONT_SETTINGS_FRAME_NAME .. "FontOutlineDropdown"):Hide();
 
 -- Show the font size and crit size sliders.
 getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeSlider"):Hide();


 -- Show the font settings frame.
 getglobal(FONT_SETTINGS_FRAME_NAME):Show();

 -- Update the font previews.
 MikSBTOpt.UpdateFontPreviews();
 MikSBT.Print("Restart the game or disconnect to apply Game Damage font.", 1, 0, 0)
end


-- **********************************************************************************
-- Show scroll area font settings .
-- **********************************************************************************
function MikSBTOpt.ShowScrollAreaFontSettings(scrollArea)
 -- Get the font settings frame.
 local fontSettingsFrame = getglobal(FONT_SETTINGS_FRAME_NAME);

 -- Get the inherited font settings.
 fontSettingsFrame.InheritedFontIndex = MikSBT.GetOptionFromVarPath("MasterFontSettings.Normal.FontIndex");
 fontSettingsFrame.InheritedOutlineIndex = MikSBT.GetOptionFromVarPath("MasterFontSettings.Normal.OutlineIndex");
 fontSettingsFrame.InheritedFontSize = MikSBT.GetOptionFromVarPath("MasterFontSettings.Normal.FontSize");
 fontSettingsFrame.InheritedFontCritIndex = MikSBT.GetOptionFromVarPath("MasterFontSettings.Crit.FontIndex");
 fontSettingsFrame.InheritedOutlineCritIndex = MikSBT.GetOptionFromVarPath("MasterFontSettings.Crit.OutlineIndex");
 fontSettingsFrame.InheritedFontSizeCrit = MikSBT.GetOptionFromVarPath("MasterFontSettings.Crit.FontSize");


 -- Show the crit font settings controls.
 MikSBTOpt.ShowCritFontControls();


 -- Setup the normal font dropdown.
 local key = "FontDropdown";
 MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["ScrollArea"].Font, MikSBTOpt.FontSettingsDropdownOnClick, availableFontsInherit, "DisplaySettings." .. scrollArea .. ".FontSettings.Normal.FontIndex");
 MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);

 -- Setup the normal font outline dropdown.
 key = "FontOutlineDropdown";
 MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["ScrollArea"].Outline, MikSBTOpt.FontSettingsDropdownOnClick, availableOutlinesInherit, "DisplaySettings." .. scrollArea .. ".FontSettings.Normal.OutlineIndex");
 MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);

 -- Setup the crit font dropdown.
 key = "FontCritDropdown";
 MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["ScrollArea"].FontCrit, MikSBTOpt.FontSettingsDropdownOnClick, availableFontsInherit, "DisplaySettings." .. scrollArea .. ".FontSettings.Crit.FontIndex");
 MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);

 -- Setup the crit font outline dropdown.
 key = "FontOutlineCritDropdown";
 MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["ScrollArea"].OutlineCrit, MikSBTOpt.FontSettingsDropdownOnClick, availableOutlinesInherit, "DisplaySettings." .. scrollArea .. ".FontSettings.Crit.OutlineIndex");
 MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);



 -- Show the inherit font size and crit font size checkboxes.
 getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCheckbox"):Show();
 getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCritCheckbox"):Show();
 

 -- Setup the inherit normal font size checkbox.
 key = "InheritFontSizeCheckbox";
 MikSBTOpt.SetupCheckbox(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["ScrollArea"].InheritFontSize, "DisplaySettings." .. scrollArea .. ".FontSettings.Normal.FontSize");

 -- Setup the inherit crit font size checkbox.
 key = "InheritFontSizeCritCheckbox";
 MikSBTOpt.SetupCheckbox(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["ScrollArea"].InheritFontSizeCrit, "DisplaySettings." .. scrollArea .. ".FontSettings.Crit.FontSize");


 -- Setup the normal font size slider.
 key = "FontSizeSlider";
 MikSBTOpt.SetupSlider(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.SLIDERS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["ScrollArea"].FontSize, MIN_FONT_SIZE, MAX_FONT_SIZE, 2, "DisplaySettings." .. scrollArea .. ".FontSettings.Normal.FontSize");

 -- Setup the crit font size slider.
 key = "FontSizeCritSlider";
 MikSBTOpt.SetupSlider(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.SLIDERS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["ScrollArea"].FontSizeCrit, MIN_FONT_SIZE, MAX_FONT_SIZE, 2, "DisplaySettings." .. scrollArea .. ".FontSettings.Crit.FontSize");


 -- Check if the normal font size is inherited.
 if (MikSBT.GetOptionFromVarPath("DisplaySettings." .. scrollArea .. ".FontSettings.Normal.FontSize") == 0) then
  -- Check the inherited checkbox and hide the slider.
  getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCheckbox"):SetChecked(true);
  getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeSlider"):Hide();
 else
  -- Uncheck the inherited checkbox and setup the slider.
  getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCheckbox"):SetChecked(false);
  getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeSlider"):Show();

  -- Populate the normal font size slider.
  MikSBTOpt.PopulateSlider(FONT_SETTINGS_FRAME_NAME .. "FontSizeSlider");
 end


 -- Check if the critical font size is inherited.
 if (MikSBT.GetOptionFromVarPath("DisplaySettings." .. scrollArea .. ".FontSettings.Crit.FontSize") == 0) then
  -- Check the inherited checkbox and hide the slider.
  getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCritCheckbox"):SetChecked(true);
  getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeCritSlider"):Hide();
 else
  -- Uncheck the inherited checkbox and setup the slider.
  getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCritCheckbox"):SetChecked(false);
  getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeCritSlider"):Show();

  -- Populate the crit font size slider.
  MikSBTOpt.PopulateSlider(FONT_SETTINGS_FRAME_NAME .. "FontSizeCritSlider");
 end


 -- Show the font settings frame.
 fontSettingsFrame:Show();

 -- Update the font previews.
 MikSBTOpt.UpdateFontPreviews();
end


-- **********************************************************************************
-- Show event font settings.
-- **********************************************************************************
function MikSBTOpt.ShowEventFontSettings(scrollArea, eventType)
 -- Get the inherited font index.
 local inheritedFontIndex = MikSBT.GetOptionFromVarPath("DisplaySettings." .. scrollArea .. ".FontSettings.Normal.FontIndex");
 if (inheritedFontIndex == 0) then
  inheritedFontIndex = MikSBT.GetOptionFromVarPath("MasterFontSettings.Normal.FontIndex");
 end

 -- Get the inherited outline index.
 local inheritedOutlineIndex = MikSBT.GetOptionFromVarPath("DisplaySettings." .. scrollArea .. ".FontSettings.Normal.OutlineIndex");
 if (inheritedOutlineIndex == 0) then
  inheritedOutlineIndex = MikSBT.GetOptionFromVarPath("MasterFontSettings.Normal.OutlineIndex");
 end
 
 -- Get the inherited font size.
 local inheritedFontSize = MikSBT.GetOptionFromVarPath("DisplaySettings." .. scrollArea .. ".FontSettings.Normal.FontSize");
 if (inheritedFontSize == 0) then
  -- Get the font size from the scroll area and check if it's inherited from the master font size.
  inheritedFontSize = MikSBT.GetOptionFromVarPath("MasterFontSettings.Normal.FontSize");
 end



 -- Get the inherited crit font index.
 local inheritedFontCritIndex = MikSBT.GetOptionFromVarPath("DisplaySettings." .. scrollArea .. ".FontSettings.Crit.FontIndex");
 if (inheritedFontCritIndex == 0) then
  inheritedFontCritIndex = MikSBT.GetOptionFromVarPath("MasterFontSettings.Crit.FontIndex");
 end

 -- Get the inherited crit outline index.
 local inheritedOutlineCritIndex = MikSBT.GetOptionFromVarPath("DisplaySettings." .. scrollArea .. ".FontSettings.Crit.OutlineIndex");
 if (inheritedOutlineCritIndex == 0) then
  inheritedOutlineCritIndex = MikSBT.GetOptionFromVarPath("MasterFontSettings.Crit.OutlineIndex");
 end
 
 -- Get the inherited crit font size.
 local inheritedFontSizeCrit = MikSBT.GetOptionFromVarPath("DisplaySettings." .. scrollArea .. ".FontSettings.Crit.FontSize");
 if (inheritedFontSizeCrit == 0) then
  -- Get the font size from the scroll area and check if it's inherited from the master font size.
  inheritedFontSizeCrit = MikSBT.GetOptionFromVarPath("MasterFontSettings.Crit.FontSize");
 end


 -- Get the font settings frame.
 local fontSettingsFrame = getglobal(FONT_SETTINGS_FRAME_NAME);


 -- Set the inherited settings to the frame.
 fontSettingsFrame.InheritedFontIndex = inheritedFontIndex;
 fontSettingsFrame.InheritedOutlineIndex = inheritedOutlineIndex;
 fontSettingsFrame.InheritedFontSize = inheritedFontSize;
 fontSettingsFrame.InheritedFontCritIndex = inheritedFontCritIndex;
 fontSettingsFrame.InheritedOutlineCritIndex = inheritedOutlineCritIndex;
 fontSettingsFrame.InheritedFontSizeCrit = inheritedFontSizeCrit;


 -- Setup the normal font dropdown.
 local key = "FontDropdown";
 MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Event"].Font, MikSBTOpt.FontSettingsDropdownOnClick, availableFontsInherit, "EventSettings." .. eventType .. ".FontSettings.Normal.FontIndex");
 MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);

 -- Setup the normal font outline dropdown.
 key = "FontOutlineDropdown";
 MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Event"].Outline, MikSBTOpt.FontSettingsDropdownOnClick, availableOutlinesInherit, "EventSettings." .. eventType .. ".FontSettings.Normal.OutlineIndex");
 MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);


 -- Show the inherit normal font size checkbox.
 getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCheckbox"):Show();


 -- Setup the inherit normal font size checkbox.
 key = "InheritFontSizeCheckbox";
 MikSBTOpt.SetupCheckbox(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Event"].InheritFontSize, "EventSettings." .. eventType .. ".FontSettings.Normal.FontSize");

 -- Setup the normal font size slider.
 key = "FontSizeSlider";
 MikSBTOpt.SetupSlider(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.SLIDERS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Event"].FontSize, MIN_FONT_SIZE, MAX_FONT_SIZE, 2, "EventSettings." .. eventType .. ".FontSettings.Normal.FontSize");


 -- Check if the normal font size is inherited.
 if (MikSBT.GetOptionFromVarPath("EventSettings." .. eventType .. ".FontSettings.Normal.FontSize") == 0) then
  -- Check the inherited checkbox and hide the slider.
  getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCheckbox"):SetChecked(true);
  getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeSlider"):Hide();
 else
  -- Uncheck the inherited checkbox and setup the slider.
  getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCheckbox"):SetChecked(false);
  getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeSlider"):Show();

  -- Populate the normal font size slider.
  MikSBTOpt.PopulateSlider(FONT_SETTINGS_FRAME_NAME .. "FontSizeSlider");
 end



 -- Check if the event type supports crits.
 if (MikSBT.CurrentProfile.EventSettings[eventType].FontSettings.Crit ~= nil) then
  -- Show the crit font settings controls.
  MikSBTOpt.ShowCritFontControls();

  -- Setup the crit font dropdown.
  key = "FontCritDropdown";
  MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Event"].FontCrit, MikSBTOpt.FontSettingsDropdownOnClick, availableFontsInherit, "EventSettings." .. eventType .. ".FontSettings.Crit.FontIndex");
  MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);

  -- Setup the crit font outline dropdown.
  key = "FontOutlineCritDropdown";
  MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Event"].OutlineCrit, MikSBTOpt.FontSettingsDropdownOnClick, availableOutlinesInherit, "EventSettings." .. eventType .. ".FontSettings.Crit.OutlineIndex");
  MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);


  -- Show the inherit crit font size checkbox.
  getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCritCheckbox"):Show();
 

  -- Setup the inherit crit font size checkbox.
  key = "InheritFontSizeCritCheckbox";
  MikSBTOpt.SetupCheckbox(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Event"].InheritFontSizeCrit, "EventSettings." .. eventType .. ".FontSettings.Crit.FontSize");

  -- Setup the crit font size slider.
  key = "FontSizeCritSlider";
  MikSBTOpt.SetupSlider(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.SLIDERS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Event"].FontSizeCrit, MIN_FONT_SIZE, MAX_FONT_SIZE, 2, "EventSettings." .. eventType .. ".FontSettings.Crit.FontSize");

  -- Check if the critical font size is inherited.
  if (MikSBT.GetOptionFromVarPath("EventSettings." .. eventType .. ".FontSettings.Crit.FontSize") == 0) then
   -- Check the inherited checkbox and hide the slider.
   getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCritCheckbox"):SetChecked(true);
   getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeCritSlider"):Hide();
  else
   -- Uncheck the inherited checkbox and setup the slider.
   getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCritCheckbox"):SetChecked(false);
   getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeCritSlider"):Show();

   -- Populate the crit font size slider.
   MikSBTOpt.PopulateSlider(FONT_SETTINGS_FRAME_NAME .. "FontSizeCritSlider");
  end

 -- The event type does not support crits.
 else
  -- Hide the crit font settings controls.
  MikSBTOpt.HideCritFontControls();
 end


 -- Show the font settings frame.
 fontSettingsFrame:Show();

 -- Update the font previews.
 MikSBTOpt.UpdateFontPreviews();
end


-- **********************************************************************************
-- Show trigger font settings.
-- **********************************************************************************
function MikSBTOpt.ShowTriggerFontSettings(triggerKey)
 -- Get the inherited font index.
 local inheritedFontIndex = MikSBT.GetOptionFromVarPath("DisplaySettings.Notification.FontSettings.Normal.FontIndex");
 if (inheritedFontIndex == 0) then
  inheritedFontIndex = MikSBT.GetOptionFromVarPath("MasterFontSettings.Normal.FontIndex");
 end

 -- Get the inherited outline index.
 local inheritedOutlineIndex = MikSBT.GetOptionFromVarPath("DisplaySettings.Notification.FontSettings.Normal.OutlineIndex");
 if (inheritedOutlineIndex == 0) then
  inheritedOutlineIndex = MikSBT.GetOptionFromVarPath("MasterFontSettings.Normal.OutlineIndex");
 end
 
 -- Get the inherited font size.
 local inheritedFontSize = MikSBT.GetOptionFromVarPath("DisplaySettings.Notification.FontSettings.Normal.FontSize");
 if (inheritedFontSize == 0) then
  -- Get the font size from the scroll area and check if it's inherited from the master font size.
  inheritedFontSize = MikSBT.GetOptionFromVarPath("MasterFontSettings.Normal.FontSize");
 end


 -- Get the font settings frame.
 local fontSettingsFrame = getglobal(FONT_SETTINGS_FRAME_NAME);


 -- Set the inherited settings to the frame.
 fontSettingsFrame.InheritedFontIndex = inheritedFontIndex;
 fontSettingsFrame.InheritedOutlineIndex = inheritedOutlineIndex;
 fontSettingsFrame.InheritedFontSize = inheritedFontSize;


 -- Setup the normal font dropdown.
 local key = "FontDropdown";
 MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Trigger"].Font, MikSBTOpt.FontSettingsDropdownOnClick, availableFontsInherit, "Triggers." .. triggerKey .. ".EventSettings.FontSettings.Normal.FontIndex");
 MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);

 -- Setup the normal font outline dropdown.
 key = "FontOutlineDropdown";
 MikSBTOpt.SetupDropdown(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.DROPDOWNS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Trigger"].Outline, MikSBTOpt.FontSettingsDropdownOnClick, availableOutlinesInherit, "Triggers." .. triggerKey .. ".EventSettings.FontSettings.Normal.OutlineIndex");
 MikSBTOpt.PopulateDropdown(FONT_SETTINGS_FRAME_NAME .. key);


 -- Show the inherit normal font size checkbox.
 getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCheckbox"):Show();


 -- Setup the inherit normal font size checkbox.
 key = "InheritFontSizeCheckbox";
 MikSBTOpt.SetupCheckbox(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.CHECKBOXES[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Trigger"].InheritFontSize, "Triggers." .. triggerKey .. ".EventSettings.FontSettings.Normal.FontSize");

 -- Setup the normal font size slider.
 key = "FontSizeSlider";
 MikSBTOpt.SetupSlider(FONT_SETTINGS_FRAME_NAME .. key, MikSBTOpt.SLIDERS[key].Label, MikSBTOpt.FONT_SETTINGS_TOOLTIPS["Trigger"].FontSize, MIN_FONT_SIZE, MAX_FONT_SIZE, 2, "Triggers." .. triggerKey .. ".EventSettings.FontSettings.Normal.FontSize");


 -- Check if the normal font size is inherited.
 if (MikSBT.GetOptionFromVarPath("Triggers." .. triggerKey .. ".EventSettings.FontSettings.Normal.FontSize") == 0) then
  -- Check the inherited checkbox and hide the slider.
  getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCheckbox"):SetChecked(true);
  getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeSlider"):Hide();
 else
  -- Uncheck the inherited checkbox and setup the slider.
  getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCheckbox"):SetChecked(false);
  getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeSlider"):Show();

  -- Populate the normal font size slider.
  MikSBTOpt.PopulateSlider(FONT_SETTINGS_FRAME_NAME .. "FontSizeSlider");
 end


 -- Hide the crit font settings controls.
 MikSBTOpt.HideCritFontControls();


 -- Show the font settings frame.
 fontSettingsFrame:Show();

 -- Update the font previews.
 MikSBTOpt.UpdateFontPreviews();
end


-- **********************************************************************************
-- Updates the font previews with values selected.
-- **********************************************************************************
function MikSBTOpt.UpdateFontPreviews()
 -- Get the font settings frame.
 local fontSettingsFrame = getglobal(FONT_SETTINGS_FRAME_NAME);

 -- Get the selected normal font index.
 local fontIndex = UIDropDownMenu_GetSelectedValue(getglobal(FONT_SETTINGS_FRAME_NAME .. "FontDropdown"));
 if (fontIndex == 0 or fontIndex == nil) then
  fontIndex = fontSettingsFrame.InheritedFontIndex;
 end

 -- Get the selected normal outline index.
 local outlineIndex = UIDropDownMenu_GetSelectedValue(getglobal(FONT_SETTINGS_FRAME_NAME .. "FontOutlineDropdown"));
 if (outlineIndex == 0 or outlineIndex == nil) then
  outlineIndex = fontSettingsFrame.InheritedOutlineIndex;
 end

 -- Check if the normal font size slider is shown.
 local slider = getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeSlider");
 local fontSize;
 if (slider:IsShown()) then
  -- Get the selected font size.
  fontSize = slider:GetValue();
 else
  -- Get the inherited font size.
  fontSize = fontSettingsFrame.InheritedFontSize;
 end


 -- Make sure the normal font index is valid.
 if (fontIndex ~= nil) then
  local previewText = getglobal(FONT_SETTINGS_FRAME_NAME .. "NormalPreviewText");
  previewText:SetFont(MikSBT.AVAILABLE_FONTS[fontIndex].Path, fontSize, MikSBT.AVAILABLE_OUTLINES[outlineIndex].Style);
 end



 -- Check if crits are to be shown.
 if (getglobal(FONT_SETTINGS_FRAME_NAME .. "CritPreview"):IsShown()) then
  -- Get the selected crit font index.
  local fontCritIndex = UIDropDownMenu_GetSelectedValue(getglobal(FONT_SETTINGS_FRAME_NAME .. "FontCritDropdown"));
  if (fontCritIndex == 0) then
   fontCritIndex = fontSettingsFrame.InheritedFontCritIndex;
  end


  -- Get the selected crit outline index.
  local outlineCritIndex = UIDropDownMenu_GetSelectedValue(getglobal(FONT_SETTINGS_FRAME_NAME .. "FontOutlineCritDropdown"));
  if (outlineCritIndex == 0) then
   outlineCritIndex = fontSettingsFrame.InheritedOutlineCritIndex;
  end


  -- Check if the crit font size slider is shown.
  local slider = getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeCritSlider");
  local fontSizeCrit;
  if (slider:IsShown()) then
   -- Get the selected crit font size.
   fontSizeCrit = slider:GetValue();
  else
   -- Get the inherited crit font size.
   fontSizeCrit = fontSettingsFrame.InheritedFontSizeCrit;
  end

  -- Make sure the crit font index is valid.
  if (fontCritIndex ~= nil) then
   local previewText = getglobal(FONT_SETTINGS_FRAME_NAME .. "CritPreviewText");
   previewText:SetFont(MikSBT.AVAILABLE_FONTS[fontCritIndex].Path, fontSizeCrit, MikSBT.AVAILABLE_OUTLINES[outlineCritIndex].Style);
  end
 end
end


-- **********************************************************************************
-- Shows the crit font settings controls.
-- **********************************************************************************
function MikSBTOpt.ShowCritFontControls()
 -- Show all of the crit font settings controls.
 getglobal(FONT_SETTINGS_FRAME_NAME .. "FontCritDropdown"):Show();
 getglobal(FONT_SETTINGS_FRAME_NAME .. "FontOutlineCritDropdown"):Show();
 getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCritCheckbox"):Show();
 getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeCritSlider"):Show();
 getglobal(FONT_SETTINGS_FRAME_NAME .. "CritPreview"):Show();

 -- Move the normal font controls back to the left side.
 getglobal(FONT_SETTINGS_FRAME_NAME .. "FontDropdown"):SetPoint("TOPLEFT", FONT_SETTINGS_FRAME_NAME, "TOPLEFT", 0, -60);
end


-- **********************************************************************************
-- Hides the crit font settings controls.
-- **********************************************************************************
function MikSBTOpt.HideCritFontControls()
 -- Hide all of the crit font settings controls.
 getglobal(FONT_SETTINGS_FRAME_NAME .. "FontCritDropdown"):Hide();
 getglobal(FONT_SETTINGS_FRAME_NAME .. "FontOutlineCritDropdown"):Hide();
 getglobal(FONT_SETTINGS_FRAME_NAME .. "InheritFontSizeCritCheckbox"):Hide();
 getglobal(FONT_SETTINGS_FRAME_NAME .. "FontSizeCritSlider"):Hide();
 getglobal(FONT_SETTINGS_FRAME_NAME .. "CritPreview"):Hide();

 -- Center the normal font controls.
 getglobal(FONT_SETTINGS_FRAME_NAME .. "FontDropdown"):SetPoint("TOPLEFT", FONT_SETTINGS_FRAME_NAME, "TOPLEFT", 85, -60);
end



-------------------------------------------------------------------------------------
-- Scroll area mover functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Setup and show the scroll area mover controls.
-- **********************************************************************************
function MikSBTOpt.ShowScrollAreaMoverFrames(scrollArea)
 local controlFrame = getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME);

 -- Check if the original settings settings table hasn't been created yet and create it if not.
 if (not controlFrame.MSBTOriginalSettings) then controlFrame.MSBTOriginalSettings = {}; end


 -- Save the original incoming scroll area settings into the control frame.
 controlFrame.MSBTOriginalSettings.IncomingAnimationStyle = MikSBT.GetOptionFromVarPath("DisplaySettings.Incoming.AnimationStyle");
 controlFrame.MSBTOriginalSettings.IncomingScrollDirection = MikSBT.GetOptionFromVarPath("DisplaySettings.Incoming.ScrollDirection");
 controlFrame.MSBTOriginalSettings.IncomingTextAlignIndex = MikSBT.GetOptionFromVarPath("DisplaySettings.Incoming.FontSettings.TextAlignIndex");
 controlFrame.MSBTOriginalSettings.IncomingScrollHeight = MikSBT.GetOptionFromVarPath("DisplaySettings.Incoming.ScrollHeight");
 controlFrame.MSBTOriginalSettings.IncomingXOffset = MikSBT.GetOptionFromVarPath("DisplaySettings.Incoming.FrameOffsets.x");
 controlFrame.MSBTOriginalSettings.IncomingYOffset = MikSBT.GetOptionFromVarPath("DisplaySettings.Incoming.FrameOffsets.y");

 -- Save the original outgoing scroll area settings into the control frame.
 controlFrame.MSBTOriginalSettings.OutgoingAnimationStyle = MikSBT.GetOptionFromVarPath("DisplaySettings.Outgoing.AnimationStyle");
 controlFrame.MSBTOriginalSettings.OutgoingScrollDirection = MikSBT.GetOptionFromVarPath("DisplaySettings.Outgoing.ScrollDirection");
 controlFrame.MSBTOriginalSettings.OutgoingTextAlignIndex = MikSBT.GetOptionFromVarPath("DisplaySettings.Outgoing.FontSettings.TextAlignIndex");
 controlFrame.MSBTOriginalSettings.OutgoingScrollHeight = MikSBT.GetOptionFromVarPath("DisplaySettings.Outgoing.ScrollHeight");
 controlFrame.MSBTOriginalSettings.OutgoingXOffset = MikSBT.GetOptionFromVarPath("DisplaySettings.Outgoing.FrameOffsets.x");
 controlFrame.MSBTOriginalSettings.OutgoingYOffset = MikSBT.GetOptionFromVarPath("DisplaySettings.Outgoing.FrameOffsets.y");

 -- Save the original notification scroll area settings into the control frame.
 controlFrame.MSBTOriginalSettings.NotificationAnimationStyle = MikSBT.GetOptionFromVarPath("DisplaySettings.Notification.AnimationStyle");
 controlFrame.MSBTOriginalSettings.NotificationScrollDirection = MikSBT.GetOptionFromVarPath("DisplaySettings.Notification.ScrollDirection");
 controlFrame.MSBTOriginalSettings.NotificationTextAlignIndex = MikSBT.GetOptionFromVarPath("DisplaySettings.Notification.FontSettings.TextAlignIndex");
 controlFrame.MSBTOriginalSettings.NotificationScrollHeight = MikSBT.GetOptionFromVarPath("DisplaySettings.Notification.ScrollHeight");
 controlFrame.MSBTOriginalSettings.NotificationXOffset = MikSBT.GetOptionFromVarPath("DisplaySettings.Notification.FrameOffsets.x");
 controlFrame.MSBTOriginalSettings.NotificationYOffset = MikSBT.GetOptionFromVarPath("DisplaySettings.Notification.FrameOffsets.y");


 -- Set the starting current settings.
 controlFrame.MSBTCurrentSettings = MikSBT.CopyTable(controlFrame.MSBTOriginalSettings);


 -- Select the starting scroll area based on the passed scroll area.
 MikSBTOpt.PopulateDropdown(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "ScrollAreaDropdown", scrollArea);
 MikSBTOpt.PopulateScrollAreaControls(scrollArea);


 -- Get the scroll area mover frames for each scroll area.
 local incomingFrame = getglobal(SCROLL_AREA_MOVER_INCOMING_FRAME_NAME);
 local outgoingFrame = getglobal(SCROLL_AREA_MOVER_OUTGOING_FRAME_NAME);
 local notificationFrame = getglobal(SCROLL_AREA_MOVER_NOTIFICATION_FRAME_NAME);


 -- Set the tooltip for the scroll area mover frames.
 incomingFrame.tooltipText = MikSBTOpt.FRAMES[SCROLL_AREA_MOVER_INCOMING_FRAME_NAME].Tooltip;
 outgoingFrame.tooltipText = MikSBTOpt.FRAMES[SCROLL_AREA_MOVER_OUTGOING_FRAME_NAME].Tooltip;
 notificationFrame.tooltipText = MikSBTOpt.FRAMES[SCROLL_AREA_MOVER_NOTIFICATION_FRAME_NAME].Tooltip;

 -- Reposition the scroll area mover frames.
 MikSBTOpt.RepositionScrollAreaMoverFrames();

 -- Populates the scroll area mover coordinates.
 MikSBTOpt.PopulateScrollAreaMoverCoordinates()

 -- Show the scroll area mover frames.
 controlFrame:Show();
 incomingFrame:Show();
 outgoingFrame:Show();
 notificationFrame:Show();

 -- Hide the options frame.
 getglobal(OPTIONS_FRAME_NAME):Hide();
end


-- **********************************************************************************
-- Closes the scroll area mover controls and opens the options screen back up.
-- **********************************************************************************
function MikSBTOpt.HideScrollAreaMoverFrames()
 -- Show the options frame.
 getglobal(OPTIONS_FRAME_NAME):Show();

 -- Hide the scroll area mover frames.
 getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME):Hide();
 getglobal(SCROLL_AREA_MOVER_INCOMING_FRAME_NAME):Hide();
 getglobal(SCROLL_AREA_MOVER_OUTGOING_FRAME_NAME):Hide();
 getglobal(SCROLL_AREA_MOVER_NOTIFICATION_FRAME_NAME):Hide();
end


-- **********************************************************************************
-- Repositions all of the scroll area mover frames with the values in the current
-- settings of the control frame.
-- **********************************************************************************
function MikSBTOpt.RepositionScrollAreaMoverFrames()
 -- Get the scroll area mover control frame and all of the scroll area mover frames.
 local controlFrame = getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME);
 local incomingFrame = getglobal(SCROLL_AREA_MOVER_INCOMING_FRAME_NAME);
 local outgoingFrame = getglobal(SCROLL_AREA_MOVER_OUTGOING_FRAME_NAME);
 local notificationFrame = getglobal(SCROLL_AREA_MOVER_NOTIFICATION_FRAME_NAME);

 -- Reposition the incoming scroll area frame.
 incomingFrame:SetHeight(controlFrame.MSBTCurrentSettings.IncomingScrollHeight);
 incomingFrame:ClearAllPoints();
 incomingFrame:SetPoint("BOTTOM", UIParent, "CENTER", controlFrame.MSBTCurrentSettings.IncomingXOffset, controlFrame.MSBTCurrentSettings.IncomingYOffset);

 -- Reposition the outgoing scroll area frame.
 outgoingFrame:SetHeight(controlFrame.MSBTCurrentSettings.OutgoingScrollHeight);
 outgoingFrame:ClearAllPoints();
 outgoingFrame:SetPoint("BOTTOM", UIParent, "CENTER", controlFrame.MSBTCurrentSettings.OutgoingXOffset, controlFrame.MSBTCurrentSettings.OutgoingYOffset);

 -- Reposition the notification scroll area frame.
 notificationFrame:SetHeight(controlFrame.MSBTCurrentSettings.NotificationScrollHeight);
 notificationFrame:ClearAllPoints();
 notificationFrame:SetPoint("BOTTOM", UIParent, "CENTER", controlFrame.MSBTCurrentSettings.NotificationXOffset, controlFrame.MSBTCurrentSettings.NotificationYOffset);

 -- Populate the scroll area mover coordinates.
 MikSBTOpt.PopulateScrollAreaMoverCoordinates();
end


-- **********************************************************************************
-- Colorizes the scroll area mover frames.
-- **********************************************************************************
function MikSBTOpt.ColorizeScrollAreaMoverFrames(scrollArea)
 -- Get the scroll area mover frames for each scroll area.
 local incomingFrame = getglobal(SCROLL_AREA_MOVER_INCOMING_FRAME_NAME);
 local outgoingFrame = getglobal(SCROLL_AREA_MOVER_OUTGOING_FRAME_NAME);
 local notificationFrame = getglobal(SCROLL_AREA_MOVER_NOTIFICATION_FRAME_NAME);

 -- Set the colors appropriately.
 if (scrollArea == "Incoming") then
  incomingFrame:SetBackdropColor(0.5, 0.05, 0.05, 1.0);
  outgoingFrame:SetBackdropColor(0.8, 0.8, 0.8, 1.0);
  notificationFrame:SetBackdropColor(0.8, 0.8, 0.8, 1.0);
 elseif (scrollArea == "Outgoing") then
  incomingFrame:SetBackdropColor(0.8, 0.8, 0.8, 1.0);
  outgoingFrame:SetBackdropColor(0.5, 0.05, 0.05, 1.0);
  notificationFrame:SetBackdropColor(0.8, 0.8, 0.8, 1.0);
 elseif (scrollArea == "Notification") then
  incomingFrame:SetBackdropColor(0.8, 0.8, 0.8, 1.0);
  outgoingFrame:SetBackdropColor(0.8, 0.8, 0.8, 1.0);
  notificationFrame:SetBackdropColor(0.5, 0.05, 0.05, 1.0);
 end
end


-- **********************************************************************************
-- Populates the controls for the selected scroll area.
-- **********************************************************************************
function MikSBTOpt.PopulateScrollAreaControls(scrollArea)
 local controlFrame = getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME);
 MikSBTOpt.PopulateDropdown(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "AnimationStyleDropdown", controlFrame.MSBTCurrentSettings[scrollArea .. "AnimationStyle"]);
 MikSBTOpt.PopulateDropdown(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "ScrollDirectionDropdown", controlFrame.MSBTCurrentSettings[scrollArea .. "ScrollDirection"]);
 MikSBTOpt.PopulateDropdown(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "TextAlignDropdown", controlFrame.MSBTCurrentSettings[scrollArea .. "TextAlignIndex"]);
 MikSBTOpt.PopulateSlider(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "ScrollHeightSlider", controlFrame.MSBTCurrentSettings[scrollArea .. "ScrollHeight"]);
 MikSBTOpt.PopulateEditbox(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "XOffsetEditbox", controlFrame.MSBTCurrentSettings[scrollArea .. "XOffset"]);
 MikSBTOpt.PopulateEditbox(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "YOffsetEditbox", controlFrame.MSBTCurrentSettings[scrollArea .. "YOffset"]);

 -- Colorize the selected scroll area mover frame.
 MikSBTOpt.ColorizeScrollAreaMoverFrames(scrollArea)
end


-- **********************************************************************************
-- Populates the scroll area mover labels with the scroll area's coordinates.
-- **********************************************************************************
function MikSBTOpt.PopulateScrollAreaMoverCoordinates()
 -- Get the scroll area mover control frame.
 local controlFrame = getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME);

 -- Populate the labels.
 getglobal(SCROLL_AREA_MOVER_INCOMING_FRAME_NAME .. "Title"):SetText(MikSBTOpt.TABS[TAB_INDEX_INCOMING].Label .. " (" .. controlFrame.MSBTCurrentSettings.IncomingXOffset .. ", " .. controlFrame.MSBTCurrentSettings.IncomingYOffset .. ")");
 getglobal(SCROLL_AREA_MOVER_OUTGOING_FRAME_NAME .. "Title"):SetText(MikSBTOpt.TABS[TAB_INDEX_OUTGOING].Label .. " (" .. controlFrame.MSBTCurrentSettings.OutgoingXOffset .. ", " .. controlFrame.MSBTCurrentSettings.OutgoingYOffset .. ")");
 getglobal(SCROLL_AREA_MOVER_NOTIFICATION_FRAME_NAME .. "Title"):SetText(MikSBTOpt.TABS[TAB_INDEX_NOTIFICATION].Label .. " (" .. controlFrame.MSBTCurrentSettings.NotificationXOffset .. ", " .. controlFrame.MSBTCurrentSettings.NotificationYOffset .. ")");

 -- Populate the x and y offset editboxes.
 local scrollArea = UIDropDownMenu_GetSelectedValue(getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "ScrollAreaDropdown"));
 MikSBTOpt.PopulateEditbox(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "XOffsetEditbox", controlFrame.MSBTCurrentSettings[scrollArea .. "XOffset"]);
 MikSBTOpt.PopulateEditbox(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "YOffsetEditbox", controlFrame.MSBTCurrentSettings[scrollArea .. "YOffset"]);
end


-- **********************************************************************************
-- Save the coordinates of the scroll area mover to the control frame's current
-- settings.
-- **********************************************************************************
function MikSBTOpt.SaveScrollAreaMoverCoordinates(frameName)
 local controlFrame = getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME);

 -- Get the UIParent center x and y coords.
 local uiParentX, uiParentY = UIParent:GetCenter();
 local xOffset = math.floor(this:GetCenter() - uiParentX);
 local yOffset = math.ceil(this:GetBottom() - uiParentY);

 -- Save the coordinates for the correct scroll area.
 if (frameName == SCROLL_AREA_MOVER_INCOMING_FRAME_NAME) then  
  controlFrame.MSBTCurrentSettings.IncomingXOffset = xOffset;
  controlFrame.MSBTCurrentSettings.IncomingYOffset = yOffset;
 elseif (frameName == SCROLL_AREA_MOVER_OUTGOING_FRAME_NAME) then  
  controlFrame.MSBTCurrentSettings.OutgoingXOffset = xOffset;
  controlFrame.MSBTCurrentSettings.OutgoingYOffset = yOffset;
 elseif (frameName == SCROLL_AREA_MOVER_NOTIFICATION_FRAME_NAME) then  
  controlFrame.MSBTCurrentSettings.NotificationXOffset = xOffset;
  controlFrame.MSBTCurrentSettings.NotificationYOffset = yOffset;
 end

 -- Populate the scroll area mover coordinates.
 MikSBTOpt.PopulateScrollAreaMoverCoordinates();
end


-- **********************************************************************************
-- Save the values selected in the scroll area mover controls to the current settings
-- of the sroll area mover control frame.
-- **********************************************************************************
function MikSBTOpt.SaveScrollAreaControlsToCurrentSettings()
 -- Get the currently selected scroll area and the scroll area mover control frame.
 local scrollArea = UIDropDownMenu_GetSelectedValue(getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "ScrollAreaDropdown"));
 local controlFrame = getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME);

 -- Set the control frame's current settings to the values in the controls.
 controlFrame.MSBTCurrentSettings[scrollArea .. "AnimationStyle"] = UIDropDownMenu_GetSelectedValue(getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "AnimationStyleDropdown"));
 controlFrame.MSBTCurrentSettings[scrollArea .. "ScrollDirection"] = UIDropDownMenu_GetSelectedValue(getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "ScrollDirectionDropdown"));
 controlFrame.MSBTCurrentSettings[scrollArea .. "TextAlignIndex"] = UIDropDownMenu_GetSelectedValue(getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "TextAlignDropdown"));
 controlFrame.MSBTCurrentSettings[scrollArea .. "ScrollHeight"] = getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "ScrollHeightSlider"):GetValue();

 -- Get the x offset from the x offset editbox and make sure it's a number.
 local xOffset = tonumber(getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "XOffsetEditbox"):GetText());
 if (xOffset ~= nil) then
  controlFrame.MSBTCurrentSettings[scrollArea .. "XOffset"] = xOffset;
 end

 -- Get the y offset from the y offset editbox and make sure it's a number.
 local yOffset = tonumber(getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME .. "YOffsetEditbox"):GetText());
 if (yOffset ~= nil) then
  controlFrame.MSBTCurrentSettings[scrollArea .. "YOffset"] = yOffset;
 end
end


-- **********************************************************************************
-- Save the settings of the scroll area mover control to the profile for the
-- passed settings type.
-- **********************************************************************************
function MikSBTOpt.SaveScrollAreaSettings(settingsType)
 -- Save the settings in the controls to the control frame's current settings.
 MikSBTOpt.SaveScrollAreaControlsToCurrentSettings();

 -- Get the scroll area mover control frame.
 local controlFrame = getglobal(SCROLL_AREA_MOVER_CONTROL_FRAME_NAME);

 -- Save the incoming scroll area settings into the profile.
 MikSBT.SetOptionFromVarPath("DisplaySettings.Incoming.AnimationStyle", controlFrame[settingsType].IncomingAnimationStyle);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Incoming.ScrollDirection", controlFrame[settingsType].IncomingScrollDirection);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Incoming.FontSettings.TextAlignIndex", controlFrame[settingsType].IncomingTextAlignIndex);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Incoming.ScrollHeight", controlFrame[settingsType].IncomingScrollHeight);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Incoming.FrameOffsets.x", controlFrame[settingsType].IncomingXOffset);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Incoming.FrameOffsets.y", controlFrame[settingsType].IncomingYOffset);

 -- Save the outgoing scroll area settings into the profile.
 MikSBT.SetOptionFromVarPath("DisplaySettings.Outgoing.AnimationStyle", controlFrame[settingsType].OutgoingAnimationStyle);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Outgoing.ScrollDirection", controlFrame[settingsType].OutgoingScrollDirection);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Outgoing.FontSettings.TextAlignIndex", controlFrame[settingsType].OutgoingTextAlignIndex);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Outgoing.ScrollHeight", controlFrame[settingsType].OutgoingScrollHeight);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Outgoing.FrameOffsets.x", controlFrame[settingsType].OutgoingXOffset);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Outgoing.FrameOffsets.y", controlFrame[settingsType].OutgoingYOffset);

 -- Save the notification scroll area settings into the profile.
 MikSBT.SetOptionFromVarPath("DisplaySettings.Notification.AnimationStyle", controlFrame[settingsType].NotificationAnimationStyle);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Notification.ScrollDirection", controlFrame[settingsType].NotificationScrollDirection);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Notification.FontSettings.TextAlignIndex", controlFrame[settingsType].NotificationTextAlignIndex);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Notification.ScrollHeight", controlFrame[settingsType].NotificationScrollHeight);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Notification.FrameOffsets.x", controlFrame[settingsType].NotificationXOffset);
 MikSBT.SetOptionFromVarPath("DisplaySettings.Notification.FrameOffsets.y", controlFrame[settingsType].NotificationYOffset);


 -- Reposition the animation frames.
 MikSBT.RepositionAnimationFrames();
end


-- **********************************************************************************
-- Previews a test message in the new scroll area position.
-- **********************************************************************************
function MikSBTOpt.ScrollAreaMoverPreviewOnClick()
  -- Save the current settings for all the scroll areas.
 MikSBTOpt.SaveScrollAreaSettings("MSBTCurrentSettings");

 -- Display the preview messages.
 MikSBT.DisplayMessage(MikSBTOpt.MSG_SCROLL_AREA_PREVIEW_TEXT, MikSBT.DISPLAYTYPE_INCOMING, false, 255, 0, 0);
 MikSBT.DisplayMessage(MikSBTOpt.MSG_SCROLL_AREA_PREVIEW_TEXT, MikSBT.DISPLAYTYPE_NOTIFICATION, false);
 MikSBT.DisplayMessage(MikSBTOpt.MSG_SCROLL_AREA_PREVIEW_TEXT, MikSBT.DISPLAYTYPE_OUTGOING, false, 0, 0, 255);
end


-- **********************************************************************************
-- Called the save button on the scroll area mover is clicked.
-- **********************************************************************************
function MikSBTOpt.ScrollAreaMoverSaveOnClick()
 -- Save the current settings for all the scroll areas.
 MikSBTOpt.SaveScrollAreaSettings("MSBTCurrentSettings");

 -- Show the options frame and hide the scroll area mover frames.
 MikSBTOpt.HideScrollAreaMoverFrames();
end


-- **********************************************************************************
-- Cancels the changes made to the scroll area mover.
-- **********************************************************************************
function MikSBTOpt.ScrollAreaMoverCancelOnClick()
 -- Save the original settings for all the scroll areas.
 MikSBTOpt.SaveScrollAreaSettings("MSBTOriginalSettings");

 -- Show the options frame and hide the scroll area mover frames.
 MikSBTOpt.HideScrollAreaMoverFrames();
end



-------------------------------------------------------------------------------------
-- Trigger functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Sets up the available trigger events.
-- **********************************************************************************
function MikSBTOpt.SetupAvailableTriggerEvents()
 table.insert(availableTriggerEvents, "CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS");
 table.insert(availableTriggerEvents, "CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS");
 table.insert(availableTriggerEvents, "CHAT_MSG_COMBAT_PARTY_HITS");
 table.insert(availableTriggerEvents, "CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES");
 table.insert(availableTriggerEvents, "CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES");
 table.insert(availableTriggerEvents, "CHAT_MSG_COMBAT_PARTY_MISSES");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE");  -- athenne add
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_PARTY_DAMAGE");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_CREATURE_VS_SELF_BUFF");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS");
 table.insert(availableTriggerEvents, "CHAT_MSG_COMBAT_SELF_HITS");
 table.insert(availableTriggerEvents, "CHAT_MSG_COMBAT_SELF_MISSES");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_SELF_DAMAGE");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_SELF_BUFF");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE");
 table.insert(availableTriggerEvents, "CHAT_MSG_COMBAT_PET_HITS");
 table.insert(availableTriggerEvents, "CHAT_MSG_COMBAT_PET_MISSES");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_PET_DAMAGE");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_ITEM_ENCHANTMENTS");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_AURA_GONE_SELF");
 table.insert(availableTriggerEvents, "CHAT_MSG_COMBAT_HONOR_GAIN");
 table.insert(availableTriggerEvents, "CHAT_MSG_COMBAT_FACTION_CHANGE");
 table.insert(availableTriggerEvents, "CHAT_MSG_SKILL");
 table.insert(availableTriggerEvents, "CHAT_MSG_COMBAT_XP_GAIN");
 table.insert(availableTriggerEvents, "CHAT_MSG_COMBAT_HOSTILE_DEATH");
 table.insert(availableTriggerEvents, "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE");
end


-- **********************************************************************************
-- Adds a new trigger.
-- **********************************************************************************
function MikSBTOpt.AddNewTrigger()
 -- Hold the next available custom trigger number.
 local nextTriggerNum = 0;
 local slotFound = false;

 -- Loop until an available slot is found.
 while (true) do
  -- Increment to the next trigger number.
  nextTriggerNum = nextTriggerNum + 1;

  if (not MikSBT.CurrentProfile.Triggers["MSBT_TRIGGER_CUSTOM" .. nextTriggerNum]) then
   break;
  end
 end

 -- Create the new default trigger.
 MikSBT.CurrentProfile.Triggers["MSBT_TRIGGER_CUSTOM" .. nextTriggerNum] = {
  EventSettings = {
   Show			= true,
   Message			= MikSBTOpt.MSG_TRIGGER_NEW_TRIGGER_DEFAULT_MESSAGE,
   IsSticky			= false,
   FontSettings = {
    Color			= {r=1, g=0.502, b=0.502},
    Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
   },
  },
  TriggerSettings = {
   TriggerType		= 1,
   Threshold		= 40,
  },
 }

 -- Reregister the trigger with the event helper.
 MikSBT.RegisterTriggers();

 -- Repopulate the trigger event settings so the new trigger shows up.
 MikSBTOpt.PopulateTriggerEventSettings();
end

-- **********************************************************************************
-- Deletes the passed trigger.
-- **********************************************************************************
function MikSBTOpt.DeleteTrigger(triggerKey)
 -- Remove the trigger.
 MikSBT.CurrentProfile.Triggers[triggerKey] = nil;

 -- Reregister the trigger with the event helper.
 MikSBT.RegisterTriggers();

 -- Repopulate the trigger event settings.
 MikSBTOpt.PopulateTriggerEventSettings();
end


-- **********************************************************************************
-- Shows the trigger settings for the passed trigger key.
-- **********************************************************************************
function MikSBTOpt.ShowTriggerConfig(triggerKey)
 -- Get the trigger configuration frame.
 local triggerFrame = getglobal(TRIGGER_CONFIGURATION_FRAME_NAME);

 -- Set the trigger key for the config frame.
 triggerFrame.TriggerKey = triggerKey;

 -- Get the trigger data for the passed trigger and make sure it exists.
 local triggerData = MikSBT.CurrentProfile.Triggers[triggerKey];
 if (triggerData) then
  -- Set the title to the output message.
  getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "Title"):SetText(triggerData.EventSettings.Message);

  -- Check if all classes are selected.
  if (not triggerData.TriggerSettings.Classes) then
   -- Check the all classes checkbox and hide the individual class checkboxes.
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "AllClassesCheckbox"):SetChecked(1);
   MikSBTOpt.HideTriggerClassCheckboxes();
  else
   -- Uncheck the all classes checkbox and show the individual class checkboxes.
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "AllClassesCheckbox"):SetChecked(0);
   MikSBTOpt.ShowTriggerClassCheckboxes();

   -- Set the correct individual class checkbox settings.
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "DruidCheckbox"):SetChecked(triggerData.TriggerSettings.Classes.DRUID);
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "HunterCheckbox"):SetChecked(triggerData.TriggerSettings.Classes.HUNTER);
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "MageCheckbox"):SetChecked(triggerData.TriggerSettings.Classes.MAGE);
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "PaladinCheckbox"):SetChecked(triggerData.TriggerSettings.Classes.PALADIN);
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "PriestCheckbox"):SetChecked(triggerData.TriggerSettings.Classes.PRIEST);
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "RogueCheckbox"):SetChecked(triggerData.TriggerSettings.Classes.ROGUE);
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "ShamanCheckbox"):SetChecked(triggerData.TriggerSettings.Classes.SHAMAN);
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "WarlockCheckbox"):SetChecked(triggerData.TriggerSettings.Classes.WARLOCK);
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "WarriorCheckbox"):SetChecked(triggerData.TriggerSettings.Classes.WARRIOR);
  end

  -- Populate the trigger type.
  MikSBTOpt.PopulateDropdown(TRIGGER_CONFIGURATION_FRAME_NAME .. "TriggerTypeDropdown", triggerData.TriggerSettings.TriggerType);

   -- Holds the Icon Texture.
   local texture = ""; 

   -- Check if there is a texture defined.
   if (triggerData.Texture) then
    texture = triggerData.Texture or "";
   end
  
  MikSBTOpt.PopulateEditbox(TRIGGER_CONFIGURATION_FRAME_NAME .. "IconNameEditbox", texture);
  -- Setup the trigger controls appropriately depending on the trigger type.
  MikSBTOpt.SetupVariableTriggerControls(triggerKey, triggerData.TriggerSettings.TriggerType == MikCEH.TRIGGERTYPE_SEARCH_PATTERN);

  -- Show the trigger settings.
  triggerFrame:Show();
 end
end


-- **********************************************************************************
-- Show or hides the search pattern controls on the trigger config frame.
-- **********************************************************************************
function MikSBTOpt.SetupVariableTriggerControls(triggerKey, showSearch)
 -- Get the trigger configuration frame.
 local triggerFrame = getglobal(TRIGGER_CONFIGURATION_FRAME_NAME);

 -- Get the trigger data for the passed trigger and make sure it exists.
 local triggerData = MikSBT.CurrentProfile.Triggers[triggerKey];
 if (triggerData) then

  -- Check if the search pattern controls should be shown.
  if (showSearch) then
   -- Resize the trigger frame.
   triggerFrame:SetHeight(450);

   -- Hide the threshold slider.
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "ThresholdSlider"):Hide();

   -- TODO: Show the search pattern controls.
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "EventsScrollFrame"):Show();
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "TriggerEvent1Checkbox"):Show();
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "TriggerEvent2Checkbox"):Show();
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "TriggerEvent3Checkbox"):Show();
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "TriggerEvent4Checkbox"):Show();

   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "StanceDropdown"):Show();
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "SearchPattern1Editbox"):Show();
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "SearchPattern2Editbox"):Show();
   
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "TextureHorizontalBarBottom"):Show();

   -- Clear the selected trigger events.
   if (not triggerFrame.SelectedTriggerEvents) then
    triggerFrame.SelectedTriggerEvents = {};
   else
    MikCEH.EraseTable(triggerFrame.SelectedTriggerEvents);
   end

   -- Loop through all of the trigger events for the trigger.
   for  _, triggerEvent in triggerData.TriggerSettings.TriggerEvents do
    triggerFrame.SelectedTriggerEvents[triggerEvent] = true;
   end

   -- Populate the appropriate trigger events.
   MikSBTOpt.PopulateAvailableTriggerEvents();

   
   local stance = triggerData.TriggerSettings.Stance
   if not stance then stance = 7 end
   -- Populate the stance dropdown.
  MikSBTOpt.PopulateDropdown(TRIGGER_CONFIGURATION_FRAME_NAME .. "StanceDropdown", stance);
   
   -- Holds the search patterns.
   local searchPattern1 = ""; 
   local searchPattern2 = "";

   -- Check if there are search patterns defined.
   if (triggerData.TriggerSettings.SearchPatterns) then
    searchPattern1 = triggerData.TriggerSettings.SearchPatterns[1] or "";
    searchPattern2 = triggerData.TriggerSettings.SearchPatterns[2] or "";
   end

   -- Populate the search pattern settings.
   MikSBTOpt.PopulateEditbox(TRIGGER_CONFIGURATION_FRAME_NAME .. "SearchPattern1Editbox", searchPattern1);
   MikSBTOpt.PopulateEditbox(TRIGGER_CONFIGURATION_FRAME_NAME .. "SearchPattern2Editbox", searchPattern2);

  else
   -- Resize the trigger frame.
   triggerFrame:SetHeight(270);

   -- Show the threshold slider.
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "ThresholdSlider"):Show();
  
   -- Hide the search pattern controls.
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "EventsScrollFrame"):Hide();
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "TriggerEvent1Checkbox"):Hide();
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "TriggerEvent2Checkbox"):Hide();
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "TriggerEvent3Checkbox"):Hide();
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "TriggerEvent4Checkbox"):Hide();
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "StanceDropdown"):Hide();
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "SearchPattern1Editbox"):Hide();
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "SearchPattern2Editbox"):Hide();
   
   getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "TextureHorizontalBarBottom"):Hide();

   -- Populate the threshold slider.
   MikSBTOpt.PopulateSlider(TRIGGER_CONFIGURATION_FRAME_NAME .. "ThresholdSlider", triggerData.TriggerSettings.Threshold or 1);
  end
 end
end


-- **********************************************************************************
-- Hides the individual class checkboxes on the trigger config frame.
-- **********************************************************************************
function MikSBTOpt.HideTriggerClassCheckboxes()
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "DruidCheckbox"):Hide();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "HunterCheckbox"):Hide();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "MageCheckbox"):Hide();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "PaladinCheckbox"):Hide();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "PriestCheckbox"):Hide();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "RogueCheckbox"):Hide();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "ShamanCheckbox"):Hide();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "WarlockCheckbox"):Hide();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "WarriorCheckbox"):Hide();
end


-- **********************************************************************************
-- Shows the individual class checkboxes on the trigger config frame.
-- **********************************************************************************
function MikSBTOpt.ShowTriggerClassCheckboxes()
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "DruidCheckbox"):Show();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "HunterCheckbox"):Show();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "MageCheckbox"):Show();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "PaladinCheckbox"):Show();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "PriestCheckbox"):Show();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "RogueCheckbox"):Show();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "ShamanCheckbox"):Show();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "WarlockCheckbox"):Show();
 getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "WarriorCheckbox"):Show();
end


-- **********************************************************************************
-- Saves the settings in the trigger config frame to the appropriate trigger.
-- **********************************************************************************
function MikSBTOpt.SaveTriggerConfig()
 -- Get the trigger configuration frame.
 local triggerFrame = getglobal(TRIGGER_CONFIGURATION_FRAME_NAME);

 -- Get the trigger data for the trigger that is being saved and make sure it exists.
 local triggerData = MikSBT.CurrentProfile.Triggers[triggerFrame.TriggerKey];
 if (triggerData) then
  -- Check if the all classes checkbox is checked.
  if (getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "AllClassesCheckbox"):GetChecked()) then
   -- Clear the selected classes table for the trigger to indicate all classes.
   triggerData.TriggerSettings.Classes = nil;

  -- The all classes checkbox is not checked.
  else
   -- Create a table to hold the selected classes.
   local selectedClasses = {};

   -- Set the class in the selected classes array if it's checked.
   if (getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "DruidCheckbox"):GetChecked()) then selectedClasses.DRUID = true; end
   if (getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "HunterCheckbox"):GetChecked()) then selectedClasses.HUNTER = true; end
   if (getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "MageCheckbox"):GetChecked()) then selectedClasses.MAGE = true; end
   if (getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "PaladinCheckbox"):GetChecked()) then selectedClasses.PALADIN = true; end
   if (getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "PriestCheckbox"):GetChecked()) then selectedClasses.PRIEST = true; end
   if (getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "RogueCheckbox"):GetChecked()) then selectedClasses.ROGUE = true; end
   if (getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "ShamanCheckbox"):GetChecked()) then selectedClasses.SHAMAN = true; end
   if (getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "WarlockCheckbox"):GetChecked()) then selectedClasses.WARLOCK = true; end
   if (getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "WarriorCheckbox"):GetChecked()) then selectedClasses.WARRIOR = true; end

   -- Save the selected classes for the trigger.
   triggerData.TriggerSettings.Classes = selectedClasses;   
  end

  -- Save the trigger type.
  triggerData.TriggerSettings.TriggerType = UIDropDownMenu_GetSelectedValue(getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "TriggerTypeDropdown"));

  -- Save the Icon Name
  local texture = getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "IconNameEditbox"):GetText();
   if (texture) and (texture ~= "") then
    triggerData.Texture = texture;
   end
  
  -- Check if the trigger type is search pattern.
  if (triggerData.TriggerSettings.TriggerType == MikCEH.TRIGGERTYPE_SEARCH_PATTERN) then
   -- Clear the threshold field.
   triggerData.TriggerSettings.Threshold = nil;

   local trigEvents = {};
   for triggerEvent in triggerFrame.SelectedTriggerEvents do
    table.insert(trigEvents, triggerEvent);
   end

   -- Save the selected trigger events. 
   triggerData.TriggerSettings.TriggerEvents = trigEvents;

   -- Save the required stance.
  if UIDropDownMenu_GetSelectedValue(getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "StanceDropdown")) ~= 7 then
	triggerData.TriggerSettings.Stance = UIDropDownMenu_GetSelectedValue(getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "StanceDropdown"));
	if not GetShapeshiftFormInfo(triggerData.TriggerSettings.Stance) then
		MikSBT.Print("No stance found for the selected requirement on this character, this trigger might never occur :o", 1, 1, 0);
		MikSBT.Print("Also it's dangerous to go alone! take this. o-[====>", 1, 1, 0); --remind me that this is a beta release
	end
  else
	triggerData.TriggerSettings.Stance = nil
  end
   
   -- Create a table to hold the search patterns.
   local searchPatterns = {};

   -- Get the first search pattern, check if it is set to anything, and add it to the search patterns table.
   local searchPattern = getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "SearchPattern1Editbox"):GetText();
   if (searchPattern ~= "") then
    table.insert(searchPatterns, searchPattern);
   end

   -- Get the second search pattern, check if it is set to anything, and add it to the search patterns table.
   searchPattern = getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "SearchPattern2Editbox"):GetText();
   if (searchPattern ~= "") then
    table.insert(searchPatterns, searchPattern);
   end

   -- Save the search patterns for the trigger.
   triggerData.TriggerSettings.SearchPatterns = searchPatterns;
 
  -- Trigger type is a threshold.
  else
   -- Clear the search pattern fields.
   triggerData.TriggerSettings.TriggerEvents = nil;
   triggerData.TriggerSettings.SearchPatterns = nil;

   -- Save the threshold.
   triggerData.TriggerSettings.Threshold = getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "ThresholdSlider"):GetValue();
  end

  -- Reregister all of the triggers.
  MikSBT.RegisterTriggers();
 end 
end



-- **********************************************************************************
-- Populates the available trigger events scroll frame.
-- **********************************************************************************
function MikSBTOpt.PopulateAvailableTriggerEvents()
 local triggerFrame = getglobal(TRIGGER_CONFIGURATION_FRAME_NAME);

 -- Get the total number of available trigger events.
 local totalItems = table.getn(availableTriggerEvents);

 -- Get the trigger settings scroll frame and its offset.
 local objFrame = getglobal(TRIGGER_CONFIGURATION_FRAME_NAME .. "EventsScrollFrame");
 FauxScrollFrame_Update(objFrame, totalItems, TRIGGER_EVENT_ITEMS_PER_PAGE, TRIGGER_EVENT_ITEM_HEIGHT);
 local skipCount = FauxScrollFrame_GetOffset(objFrame);

 -- Loop through all of the visible items.
 for i = 1, TRIGGER_EVENT_ITEMS_PER_PAGE do
  local checkboxName = TRIGGER_CONFIGURATION_FRAME_NAME .. "TriggerEvent" .. i .. "Checkbox";
  local objCheckbox = getglobal(checkboxName);
  local triggerEvent = availableTriggerEvents[i+skipCount];

  -- Set the checkbox's name to the trigger event.
  MikSBTOpt.SetupCheckbox(checkboxName, triggerEvent, nil, nil);
  if (objCheckbox) then objCheckbox.TriggerEvent = triggerEvent; end

  -- If the selected trigger events table exists get the appropriate value from it.
  if (triggerFrame.SelectedTriggerEvents) then
   MikSBTOpt.PopulateCheckbox(checkboxName, triggerFrame.SelectedTriggerEvents[triggerEvent] ~= nil);
  -- Selected trigger events table doesn't exist so just uncheck the checkbox.
  else
   MikSBTOpt.PopulateCheckbox(checkboxName, false);
  end
 end
end


-------------------------------------------------------------------------------------
-- Suppression functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Adds a new suppression.
-- **********************************************************************************
function MikSBTOpt.AddNewSuppression()
 -- Hold the next available custom suppression number.
 local nextSuppressionNum = 0;
 local slotFound = false;

 -- Loop until an available slot is found.
 while (true) do
  -- Increment to the next suppression number.
   nextSuppressionNum = nextSuppressionNum + 1;

  if (not MikSBT.CurrentProfile.Suppressions["MSBT_SUPPRESSION_CUSTOM" .. nextSuppressionNum]) then
   break;
  end
 end

 -- Create the new default trigger.
 MikSBT.CurrentProfile.Suppressions["MSBT_SUPPRESSION_CUSTOM" .. nextSuppressionNum] = {
  Enabled	= true,
  SearchPattern = MikSBTOpt.MSG_SUPPRESSION_NEW_SUPPRESSION_DEFAULT_MESSAGE,
 };

 -- Repopulate the suppression settings so the new suppression shows up.
 MikSBTOpt.PopulateSuppressionSettings();
end

-------------------------------------------------------------------------------------
-- Populate profile functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Populates the options from the currently selected profile.
-- **********************************************************************************
function MikSBTOpt.PopulateProfileOptions()
 -- Hide the font settings frame when profile options are populated.
 getglobal(FONT_SETTINGS_FRAME_NAME):Hide();


 -- Populate the Animation Step slider value.
 MikSBTOpt.PopulateSlider(OPTIONS_FRAME_NAME .. "Tab1FrameAnimationStepSlider");

 -- Populate the Show Partial Events checkbox.
 MikSBTOpt.PopulateCheckbox(OPTIONS_FRAME_NAME .. "Tab1FrameShowPartialEffectsCheckbox");
 
 -- Populate the Use Sticky Crits checkbox.
 MikSBTOpt.PopulateCheckbox(OPTIONS_FRAME_NAME .. "Tab1FrameUseStickyCritsCheckbox");

 -- Populate the Show Overheals checkbox.
 MikSBTOpt.PopulateCheckbox(OPTIONS_FRAME_NAME .. "Tab1FrameShowOverhealsCheckbox");

 -- Populate the Show Game Damage checkbox and update it appropriately.
 MikSBTOpt.PopulateCheckbox(OPTIONS_FRAME_NAME .. "Tab1FrameShowGameDamageCheckbox");
 MikSBT.SetOptionShowGameDamage(MikSBT.CurrentProfile.ShowGameDamage);

  -- Populate the Show All Mana Gains checkbox.
 MikSBTOpt.PopulateCheckbox(OPTIONS_FRAME_NAME .. "Tab1FrameShowAllManaGainsCheckbox");
 
  -- Populate the Low Health Sound checkbox.
 MikSBTOpt.PopulateCheckbox(OPTIONS_FRAME_NAME .. "Tab1FrameLowHealthSoundCheckbox");
 
  -- Populate the Low Mana Sound checkbox.
 MikSBTOpt.PopulateCheckbox(OPTIONS_FRAME_NAME .. "Tab1FrameLowManaSoundCheckbox");

 -- Populate the scroll area show events checkboxes to the values in the profile.
 MikSBTOpt.PopulateCheckbox(OPTIONS_FRAME_NAME .. "Tab2FrameShowEventsCheckbox");
 MikSBTOpt.PopulateCheckbox(OPTIONS_FRAME_NAME .. "Tab3FrameShowEventsCheckbox");
 MikSBTOpt.PopulateCheckbox(OPTIONS_FRAME_NAME .. "Tab4FrameShowEventsCheckbox");


 -- Populate the incoming, outgoing, and notification event settings.
 MikSBTOpt.PopulateIncomingEventSettings();
 MikSBTOpt.PopulateOutgoingEventSettings();
 MikSBTOpt.PopulateNotificationEventSettings();
 

 -- Populate the trigger settings.
 MikSBTOpt.PopulateTriggerEventSettings();

 -- Populate the suppression settings.
 MikSBTOpt.PopulateSuppressionSettings();
end