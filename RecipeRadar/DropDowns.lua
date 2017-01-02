
-- DropDowns.lua: code concerned the dropdowns and corresponding filters
-- $Id: DropDowns.lua 433 2006-08-31 20:22:07Z jnmiller $

function RecipeRadar_DropDowns_Init()

   -- can't use the OnLoad events because we use saved variables
   RecipeRadar_TeamDropDown_OnLoad()
   RecipeRadar_Prof1DropDown_OnLoad()
   RecipeRadar_RealmAvailDropDown_OnLoad()
   RecipeRadar_Prof2DropDown_OnLoad()
   RecipeRadar_PersonAvailDropDown_OnLoad()

   -- initialize the recipe filters and recipe tab icon
   RecipeRadar_SetProf2Filter(RecipeRadar_Options.CurrentProfession)
   
   if (RecipeRadar_Options.RealmAvailability) then
      return RecipeRadar_RealmAvailDropDown:Show()
   else
      return RecipeRadar_PersonAvailDropDown:Show()
   end

end

-----------------------------------------------------------------------------
-- Realm-wide availability drop down and filtering
-----------------------------------------------------------------------------

function RecipeRadar_RealmAvailDropDown_OnLoad()

   local dropdown = getglobal("RecipeRadar_RealmAvailDropDown")
   UIDropDownMenu_Initialize(dropdown, RecipeRadar_RealmAvailDropDown_Init)
   UIDropDownMenu_SetText(RRS("Availability"), dropdown)
   UIDropDownMenu_SetWidth(135, RecipeRadar_RealmAvailDropDown)

end

function RecipeRadar_RealmAvailDropDown_Init()

   -- sort our drop down list by table-specified order
   local t = { }
   for key, val in RecipeRadar_Availabilities do
      t[val.DropDown.ROrder] = key
   end
   
   for _, key in t do

      local info = RecipeRadar_Availabilities[key]
      local checked, item = nil, { }

      item.text = RecipeRadar_ColorToCode(info.Color) ..
            info.Text .. FONT_COLOR_CODE_CLOSE
      item.value = key
      item.func = RecipeRadar_RealmAvailDropDown_OnClick
      item.checked = not RecipeRadar_IsRealmAvailFiltered(key)
      item.keepShownOnClick = 1

      UIDropDownMenu_AddButton(item)

   end

end

function RecipeRadar_RealmAvailDropDown_OnClick()

   -- the logic here seems backwards, doesn't it?
   if (UIDropDownMenuButton_GetChecked()) then
      RecipeRadar_SetRealmAvailFilter(this.value, true)
   else
      RecipeRadar_SetRealmAvailFilter(this.value, false)
   end

   RecipeRadarListScrollFrameScrollBar:SetValue(0)

end

function RecipeRadar_IsRealmAvailFiltered(avail)

   return RecipeRadar_Filters.RealmAvails[avail]

end

function RecipeRadar_SetRealmAvailFilter(avail, is_filtered)

   RecipeRadar_Filters.RealmAvails[avail] = is_filtered
   -- we filter out vendors here to keep the Update() quick
   RecipeRadar_FilterVendors("avail", avail, is_filtered)
   RecipeRadar_FilterRecipes("avail", avail, is_filtered)
   RecipeRadar_FrameUpdate()

end

-----------------------------------------------------------------------------
-- Personal availability drop down and filtering
-----------------------------------------------------------------------------

function RecipeRadar_PersonAvailDropDown_OnLoad()

   local dropdown = getglobal("RecipeRadar_PersonAvailDropDown")
   UIDropDownMenu_Initialize(dropdown, RecipeRadar_PersonAvailDropDown_Init)
   UIDropDownMenu_SetText(RRS("Availability"), dropdown)
   UIDropDownMenu_SetWidth(135, RecipeRadar_PersonAvailDropDown)

end

function RecipeRadar_PersonAvailDropDown_Init()

   -- sort our drop down list by table-specified order
   local t = { }
   for key, val in RecipeRadar_Availabilities do
      if (val.DropDown.POrder) then
         t[val.DropDown.POrder] = key
      end
   end
   
   for _, key in t do

      local info = RecipeRadar_Availabilities[key]
      local checked, item = nil, { }

      item.text = RecipeRadar_ColorToCode(info.Color) ..
            info.Text .. FONT_COLOR_CODE_CLOSE
      item.value = key
      item.func = RecipeRadar_PersonAvailDropDown_OnClick
      item.checked = not RecipeRadar_IsPersonAvailFiltered(key)
      item.keepShownOnClick = 1

      UIDropDownMenu_AddButton(item)

   end

end

function RecipeRadar_PersonAvailDropDown_OnClick()

   -- the logic here seems backwards, doesn't it?
   if (UIDropDownMenuButton_GetChecked()) then
      RecipeRadar_SetPersonAvailFilter(this.value, true)
   else
      RecipeRadar_SetPersonAvailFilter(this.value, false)
   end

   RecipeRadarListScrollFrameScrollBar:SetValue(0)

end

function RecipeRadar_IsPersonAvailFiltered(avail)

   return RecipeRadar_Filters.PersonAvails[avail]

end

function RecipeRadar_SetPersonAvailFilter(avail, is_filtered)

   RecipeRadar_Filters.PersonAvails[avail] = is_filtered
   -- we filter out vendors here to keep the Update() quick
   RecipeRadar_FilterVendors("avail", avail, is_filtered)
   RecipeRadar_FilterRecipes("avail", avail, is_filtered)
   RecipeRadar_FrameUpdate()

end

-- Generic tester for those who don't care about the current mode.
function RecipeRadar_IsAvailabilityFiltered(avail)

   if (RecipeRadar_Options.RealmAvailability) then
      return RecipeRadar_IsRealmAvailFiltered(avail)
   else
      return RecipeRadar_IsPersonAvailFiltered(avail)
   end

end

-----------------------------------------------------------------------------
-- Teams/factions drop down and filtering
-----------------------------------------------------------------------------

function RecipeRadar_TeamDropDown_OnLoad()

   local dropdown = getglobal("RecipeRadar_TeamDropDown")
   UIDropDownMenu_Initialize(dropdown, RecipeRadar_TeamDropDown_Init)
   UIDropDownMenu_SetText(RRS("Factions"), dropdown)
   UIDropDownMenu_SetWidth(112, RecipeRadar_TeamDropDown)

end

function RecipeRadar_TeamDropDown_Init()

   -- sort our drop down list by table key
   local t = { }
   table.foreach(RecipeRadar_Teams,
         function (k) table.insert(t, k) end)
   table.sort(t)

   for _, key in t do

      local info = RecipeRadar_Teams[key]
      local checked, item = nil, { }

      item.text = RecipeRadar_ColorToCode(info.Color) ..
            info.Name .. FONT_COLOR_CODE_CLOSE
      item.value = key
      item.func = RecipeRadar_TeamDropDown_OnClick
      item.checked = not RecipeRadar_IsTeamFiltered(key)
      item.keepShownOnClick = 1

      UIDropDownMenu_AddButton(item)

   end

end

function RecipeRadar_TeamDropDown_OnClick()

   -- the logic here seems backwards, doesn't it?
   if (UIDropDownMenuButton_GetChecked()) then
      RecipeRadar_SetTeamFilter(this.value, true)
   else
      RecipeRadar_SetTeamFilter(this.value, false)
   end

   RecipeRadarListScrollFrameScrollBar:SetValue(0)

end

function RecipeRadar_IsTeamFiltered(team)

   return RecipeRadar_Filters.Teams[team]

end

function RecipeRadar_SetTeamFilter(team, is_filtered)

   RecipeRadar_Filters.Teams[team] = is_filtered
   -- we filter out vendors here to keep the Update() quick
   RecipeRadar_FilterVendors("team", team, is_filtered)
   RecipeRadar_FilterRecipes("team", team, is_filtered)
   RecipeRadar_FrameUpdate()

end

-----------------------------------------------------------------------------
-- Multi-select professions drop down and filtering (for radar tab)
-----------------------------------------------------------------------------

function RecipeRadar_Prof1DropDown_OnLoad()

   local dropdown = getglobal("RecipeRadar_Prof1DropDown")
   UIDropDownMenu_Initialize(dropdown, RecipeRadar_Prof1DropDown_Init)
   UIDropDownMenu_SetText(RRS("Professions"), dropdown)
   UIDropDownMenu_SetWidth(135, RecipeRadar_Prof1DropDown)

end

function RecipeRadar_Prof1DropDown_Init()

   -- sort our drop down list by table key
   local t = { }
   table.foreach(RecipeRadar_Professions,
         function (k) table.insert(t, k) end)
   table.sort(t)

   for _, key in t do

      local info = RecipeRadar_Professions[key]
      local checked, item = nil, { }

      item.text = info.Name
      item.value = key
      item.func = RecipeRadar_Prof1DropDown_OnClick
      item.checked = not RecipeRadar_IsProfFiltered(key)
      item.keepShownOnClick = 1

      UIDropDownMenu_AddButton(item)

   end

end

function RecipeRadar_Prof1DropDown_OnClick()

   -- the logic here seems backwards, doesn't it?
   if (UIDropDownMenuButton_GetChecked()) then
      RecipeRadar_SetProfFilter(this.value, true)
   else
      RecipeRadar_SetProfFilter(this.value, false)
   end

   RecipeRadarListScrollFrameScrollBar:SetValue(0)

end

function RecipeRadar_IsProfFiltered(prof)

   return RecipeRadar_Filters.Professions[prof]

end

function RecipeRadar_SetProfFilter(prof, is_filtered)

   RecipeRadar_Filters.Professions[prof] = is_filtered
   -- we filter out vendors here to keep the Update() quick
   RecipeRadar_FilterVendors("prof", prof, is_filtered)
   RecipeRadar_FrameUpdate()

end

-----------------------------------------------------------------------------
-- Single-select professions drop down and filtering (for recipes tab)
-----------------------------------------------------------------------------

function RecipeRadar_Prof2DropDown_OnLoad()

   local dropdown = getglobal("RecipeRadar_Prof2DropDown")
   UIDropDownMenu_Initialize(dropdown, RecipeRadar_Prof2DropDown_Init)
   UIDropDownMenu_SetText(RRS("Professions"), dropdown)
   UIDropDownMenu_SetWidth(135, RecipeRadar_Prof2DropDown)

end

function RecipeRadar_Prof2DropDown_Init()

   -- sort our drop down list by table key
   local t = { }
   table.foreach(RecipeRadar_Professions,
         function (k) table.insert(t, k) end)
   table.sort(t)

   for _, key in t do

      local info = RecipeRadar_Professions[key]
      local checked, item = nil, { }

      if (RecipeRadar_IsCurrentProfession(key)) then
         checked = 1
      end

      item.text = info.Name
      item.value = key
      item.func = RecipeRadar_Prof2DropDown_OnClick
      item.checked = checked

      UIDropDownMenu_AddButton(item)

   end

end

function RecipeRadar_Prof2DropDown_OnClick()

	UIDropDownMenu_SetSelectedID(RecipeRadar_Prof2DropDown, this:GetID())
   RecipeRadar_SetProf2Filter(this.value)
   RecipeRadarListScrollFrameScrollBar:SetValue(0)

end

function RecipeRadar_IsCurrentProfession(prof)

   return RecipeRadar_Options.CurrentProfession == prof

end

function RecipeRadar_SetProf2Filter(prof)

   RecipeRadarRecipesTabFrame:SetNormalTexture(
         RecipeRadar_Professions[prof].Icon)
   RecipeRadar_Options.CurrentProfession = prof
   RecipeRadar_InitRecipeFilters()
   RecipeRadar_FrameUpdate()

end

-----------------------------------------------------------------------------
-- Radar tab filtering code
-----------------------------------------------------------------------------

-- Checks for recipe filtering by either profession or availability.
function RecipeRadar_IsRecipeFiltered(recipe)

   return recipe.IsFilteredByTeam or recipe.IsFilteredByProfession or
         recipe.IsFilteredByAvailability

end

-- Iterate through all vendors or recipes and set their filter state.
-- This function is only useful for the radar tab, not the recipes tab.
-- filter_type is one of 'team', 'prof' or 'avail', filter_on is the
-- key on which to filter (eg. "Horde"), and is_filtered is the new state.
function RecipeRadar_FilterVendors(filter_type, filter_on, is_filtered)

   local region = RecipeRadar_RegionData[RecipeRadar_Options.CurrentRegion]
   if (not region) then return end

   for _, vendor in region.Vendors do

      -- this bit filters vendors by their team
      if (filter_type == "team" and filter_on == vendor.Team) then

         vendor.IsFiltered = is_filtered

         -- if the to-be-filtered vendor is "active", unselect her
         if (RecipeRadarRadarTabFrame.SelectedVendor == vendor) then
            RecipeRadar_RadarTab_ClearSelection()
         end

      -- this bit filters recipes by their profession
      elseif (filter_type == "prof") then

         for _, recipe in vendor.Recipes do
         
            if (filter_on == recipe.Type) then

               recipe.IsFilteredByProfession = is_filtered

               -- if the to-be-filtered recipe is selected, unselect it
               if (RecipeRadarRadarTabFrame.SelectedRecipe == recipe) then
                  RecipeRadar_RadarTab_ClearSelection()
               end

            end

         end

      -- this bit filters recipes by their availability state
      elseif (filter_type == "avail") then

         for _, recipe in vendor.Recipes do
         
            if (filter_on == RecipeRadar_Availability_GetKey(recipe)) then

               recipe.IsFilteredByAvailability = is_filtered

               -- if the to-be-filtered recipe is selected, unselect it
               if (RecipeRadarRadarTabFrame.SelectedRecipe == recipe) then
                  RecipeRadar_RadarTab_ClearSelection()
               end

            end

         end

      end

   end

end

-- Initializes vendor/recipe filters according to saved filter settings.
function RecipeRadar_InitVendorFilters()

   local region = RecipeRadar_RegionData[RecipeRadar_Options.CurrentRegion]
   if (not region) then return end

   for _, vendor in region.Vendors do

      -- set team filter
      vendor.IsFiltered = RecipeRadar_IsTeamFiltered(vendor.Team)

      for _, recipe in vendor.Recipes do
      
         -- set profession filter
         recipe.IsFilteredByProfession =
               RecipeRadar_IsProfFiltered(recipe.Type)
               
         -- set availability filter (the 'true') and auto-map if necessary
         if (RecipeRadar_Availability_IsLearnable(recipe, true) and
               RecipeRadar_Options.AutoMapVendors) then
            RecipeRadar_Maps_AddVendor(vendor,
                  RecipeRadar_Options.CurrentRegion)
         end

      end

   end

end

-----------------------------------------------------------------------------
-- Recipes tab filtering code
-----------------------------------------------------------------------------

-- Iterate through all recipes and set their filter state.
-- This function is only useful for the recipes tab, not the radar tab.
-- filter_type is one of 'team' or 'avail', filter_on is the
-- key on which to filter (eg. "Horde"), and is_filtered is the new state.
function RecipeRadar_FilterRecipes(filter_type, filter_on, is_filtered)

   local prof = RecipeRadar_RecipeData[RecipeRadar_Options.CurrentProfession]

   for _, recipe in prof.Recipes do

      -- this bit filters recipes by their availability state
      if (filter_type == "avail" and
            filter_on == RecipeRadar_Availability_GetKey(recipe)) then

         recipe.IsFilteredByAvailability = is_filtered

         -- if the to-be-filtered recipe is "active", unselect it
         if (RecipeRadarRecipesTabFrame.SelectedRecipe == recipe) then
            RecipeRadar_RecipesTab_ClearSelection()
         end

      -- this bit filters vendors by their team
      elseif (filter_type == "team") then

         for _, location in recipe.Locations do

            if (filter_on == location.Team) then

               location.IsFiltered = is_filtered

               -- if the to-be-filtered recipe is selected, unselect it
               if (RecipeRadarRecipesTabFrame.SelectedLocation ==
                     location.Region) then
                  RecipeRadar_RecipesTab_ClearSelection()
               end

            end

         end

      end

   end

end

-- Initializes vendor/recipe filters according to saved filter settings.
function RecipeRadar_InitRecipeFilters()

   local prof = RecipeRadar_RecipeData[RecipeRadar_Options.CurrentProfession]
   if (not prof) then return end

   for _, recipe in prof.Recipes do

      -- set availability filter (the 'true')
      RecipeRadar_Availability_SetAvailabilityFilter(recipe)

      for _, location in recipe.Locations do
         -- set team filter
         location.IsFiltered = RecipeRadar_IsTeamFiltered(location.Team)
      end

   end

end
