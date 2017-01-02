
-- RecipesTab.lua: handles clicking and drawing for the Recipes tab
-- $Id: RecipesTab.lua 443 2006-09-01 04:41:40Z jnmiller $

------------------------------------------------------------------------
-- Main window refresh code
------------------------------------------------------------------------

function RecipeRadar_RecipesTab_Init()

   -- reset some of the RegionData GUI settings just once here
   for i = 1, RECIPERADAR_VENDORS_DISPLAYED do
   
      local button = getglobal("RecipeRadarVendor" .. i)
      
      -- reset items' horizontal offsets
      if (i == 1) then
         button:SetPoint("TOPLEFT", "RecipeRadarFrame",
               "TOPLEFT", 22, -96)
      else
         button:SetPoint("TOPLEFT", "RecipeRadarVendor" .. i - 1,
               "BOTTOMLEFT", 0, 0)
      end

      -- turn off highlights and textures for these items
      getglobal("RecipeRadarVendor" .. i .. "Check"):Hide()
      
      -- unset to preclude tooltips for these items
      button.Recipe = nil

   end   

   RecipeRadar_Prof1DropDown:Hide()
   RecipeRadar_Prof2DropDown:Show()

   RecipeRadar_SetActiveTab(2)

   RecipeRadar_RecipesTab_Update()
   RecipeRadarListScrollFrameScrollBar:SetValue(
         RecipeRadarRecipesTabFrame.ScrollValue)

end

function RecipeRadar_RecipesTab_OnClick()

   if (RecipeRadar_Options.ActiveTab == 2) then
      return
   end

   PlaySound("igSpellBookClose")
   RecipeRadar_RecipesTab_Init()

end

function RecipeRadar_RecipesTab_ExpandAll(expand)

   local prof = RecipeRadar_RecipeData[RecipeRadar_Options.CurrentProfession]
   if (not prof) then return end

   for _, recipe in prof.Recipes do
      recipe.IsExpanded = expand
   end

   RecipeRadar_SelectFirstRecipe()
   RecipeRadar_FrameUpdate()

end

function RecipeRadar_RecipesTab_Update()

   if (RecipeRadar_Options.ActiveTab ~= 2) then
      return
   end

   local prof = RecipeRadar_Options.CurrentProfession

   TitleBarText:SetText(RRS("Recipe Radar") .. " - " .. prof .. " " ..
         format(TEXT(PARENS_TEMPLATE), RecipeRadar_SkillDB_GetRank(prof)))

   -- some globals for the Update() procedure
   RecipeRadar_row = 0
   RecipeRadar_ContextMenuGlobal.RecipesTabHasExpanded = false
   RecipeRadar_ContextMenuGlobal.RecipesTabHasCollapsed = false

   RecipeRadarHighlightFrame:Hide()
   
   RecipeRadar_SortRecipes(RecipeRadar_RecipeData[prof])
   table.foreach(RecipeRadar_RecipeData[prof].Recipes,
         RecipeRadar_RecipesTab_AddRecipe)

   -- update the scroll position and the width of the highlight frame
   FauxScrollFrame_Update(RecipeRadarListScrollFrame, RecipeRadar_row,
         RECIPERADAR_VENDORS_DISPLAYED, RECIPERADAR_VENDOR_HEIGHT,
         nil, nil, nil, RecipeRadarHighlightFrame, 361, 384)

   -- hide unused item buttons
   for i = 1, RECIPERADAR_VENDORS_DISPLAYED do
      local button = getglobal("RecipeRadarVendor" .. i)
      if (i > RecipeRadar_row) then
         button:Hide()
      else
         if (RecipeRadarListScrollFrame:IsVisible()) then
            button:SetWidth(361)
         else
            button:SetWidth(384)
         end
      end
   end
   
   -- update the current selection (or lack thereof)
   if (not prof or not RecipeRadarRecipesTabFrame.SelectedRecipe) then
      RecipeRadar_HideRecipeDetails()
   elseif (RecipeRadarRecipesTabFrame.SelectedVendor) then
      RecipeRadar_SetSelection(RecipeRadarRecipesTabFrame.SelectedVendor,
            RecipeRadarRecipesTabFrame.SelectedRecipe,
            RecipeRadarRecipesTabFrame.SelectedLocation)
      RecipeRadar_ShowRecipeDetails()
   end

end

function RecipeRadar_RecipesTab_AddRecipe(key, recipe)

   if (RecipeRadar_IsRecipeFiltered(recipe) or
          not RecipeRadar_RecipeHasLocations(recipe)) then
      return
   end

   RecipeRadar_row = RecipeRadar_row + 1

   local offset = FauxScrollFrame_GetOffset(RecipeRadarListScrollFrame)
   local index = RecipeRadar_row - offset

   -- only do the following if we're in the scroll frame's visible portion
   if (index > 0 and index <= RECIPERADAR_VENDORS_DISPLAYED) then

      local button = getglobal("RecipeRadarVendor" .. index)

      -- generic list item drawing
      RecipeRadar_DrawListItem(index, recipe)

      button:UnlockHighlight()
      getglobal("RecipeRadarVendor" .. index .. "Check"):Hide()
      getglobal("RecipeRadarVendor" .. index .. "Highlight"):SetTexture(
            "Interface\\Buttons\\UI-PlusButton-Hilight")

      if (recipe.IsExpanded) then
         RecipeRadar_ContextMenuGlobal.RecipesTabHasExpanded = true
         button:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
      else
         RecipeRadar_ContextMenuGlobal.RecipesTabHasCollapsed = true
         button:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
         return
      end

   else

      -- if the recipe is collapsed, we don't need to traverse its locations
      if (recipe.IsExpanded) then
         RecipeRadar_ContextMenuGlobal.RecipesTabHasExpanded = true
      else
         RecipeRadar_ContextMenuGlobal.RecipesTabHasCollapsed = true
         return
      end

   end

   RecipeRadar_SortLocations(recipe)

   for _, location in recipe.Locations do

      -- skip and unmap filtered recipes
      if (location.IsFiltered) then
      
         local vendor = RecipeRadar_RecipesTab_FindVendor(
               location.Region, location.Vendor)
         if (vendor.IsMapped) then
            RecipeRadar_Maps_RemoveVendor(vendor)
         end

      else

         RecipeRadar_row = RecipeRadar_row + 1
         index = RecipeRadar_row - offset;

         -- only do this if we're in the scroll frame's visible portion
         if (index > 0 and index <= RECIPERADAR_VENDORS_DISPLAYED) then
   
            local button = getglobal("RecipeRadarVendor" .. index)
   
            -- turn off highlighting textures for these items
            button:SetNormalTexture("")
            getglobal("RecipeRadarVendor" .. index .. "Highlight"):SetTexture("")
            
            -- basic drawing code
            button:SetText(location.Region)
            VendorNameDummyText:SetText(location.Region)
            button:SetTextColor(
                  RecipeRadar_Colors.LightGray.r,
                  RecipeRadar_Colors.LightGray.g,
                  RecipeRadar_Colors.LightGray.b)
            button:SetID(index)
            button:Show()
   
            -- drawing code for the little subtext field
            local subtext = getglobal("RecipeRadarVendor" .. index .. "SubText")
            local vendor = RecipeRadar_RecipesTab_FindVendor(
                  location.Region, location.Vendor)
            local content = location.Vendor
            if (vendor.Notes and vendor.Notes ~= "") then
               content = content .. " - " ..
                     RecipeRadar_FormatVendorNote(vendor.Notes)
            end
            content = format(TEXT(PARENS_TEMPLATE), content)
            subtext:SetText(content)
            VendorNameDummySubText:SetText(content)
            button.r = RecipeRadar_Teams[vendor.Team].Color.r
            button.g = RecipeRadar_Teams[vendor.Team].Color.g
            button.b = RecipeRadar_Teams[vendor.Team].Color.b
            subtext:SetTextColor(
                  RecipeRadar_Teams[vendor.Team].Color.r,
                  RecipeRadar_Teams[vendor.Team].Color.g,
                  RecipeRadar_Teams[vendor.Team].Color.b)
            subtext:SetPoint("LEFT", "RecipeRadarVendor" .. index .. "Text",
                  "RIGHT", 10, 0)
            subtext:Show()
   
            -- unset to indicate this is a vendor item for the tooltip stuff
            button.Recipe = nil

            -- show or hide the little mapped indicator check mark
            local check = getglobal("RecipeRadarVendor" .. index .. "Check")
            if (vendor.IsMapped) then
               local check_offset = VendorNameDummyText:GetWidth() + 42
               check_offset = check_offset + VendorNameDummySubText:GetWidth()
               check:SetPoint("TOPLEFT", "RecipeRadarVendor" .. index, "TOPLEFT",
                     check_offset, 0)
               check:Show()
            else
               check:Hide()
            end
      
            -- selected recipes look a little bit different
            if (RecipeRadarRecipesTabFrame.SelectedLocation == location.Region and
                  RecipeRadarRecipesTabFrame.SelectedRecipe == recipe and
                  RecipeRadarRecipesTabFrame.SelectedVendor.Name == location.Vendor) then
               RecipeRadarHighlightFrame:SetPoint("TOPLEFT",
                     "RecipeRadarVendor" .. index, "TOPLEFT", -2, 0)
               RecipeRadarHighlightFrame:Show()
               button:LockHighlight()
            else
               button:UnlockHighlight()
            end
   
         end

      end

   end

end

-- Handles a vendor/recipe button click in the main scroll frame.  The
-- supplied index is row + offset in the scroll frame.  index may also
-- be set to -1 to select the first visible recipe.
function RecipeRadar_RecipesTab_ServiceClickIndex(index, button)

   local prof = RecipeRadar_Options.CurrentProfession

   if (not button) then button = "LeftButton" end

   -- save this index so we can return to it on tab switch
   RecipeRadarRecipesTabFrame.SelectedIndex = index

   -- sort the recipes so we're counting in the right order
   RecipeRadar_SortRecipes(RecipeRadar_RecipeData[prof])
   local row = 0

   -- iterate through each recipe, counting up to index
   for _, recipe in RecipeRadar_RecipeData[prof].Recipes do

      -- if this recipe is filtered, it does not count towards our index
      if (not RecipeRadar_IsRecipeFiltered(recipe) and
            RecipeRadar_RecipeHasLocations(recipe)) then

         row = row + 1

         if (row == index) then

            if (button == "LeftButton") then

               RecipeRadar_RecipesTab_ToggleExpanded(recipe)
               return

            elseif (button == "RightButton") then

               HideDropDownMenu(1)
               RecipeRadar_ContextMenuGlobal.Recipe = recipe
               RecipeRadar_ContextMenuGlobal.Location = nil
               RecipeRadar_RecipesTab_ContextMenuOnLoad()
               ToggleDropDownMenu(1, nil, RecipesTabDropDown,
                     this:GetName(), GetCursorPosition(), 0)
               return

            end

         end

         if (recipe.IsExpanded) then

            -- sort the locations so we're counting in the right order
            RecipeRadar_SortLocations(recipe)
            local vendor_index = row

            -- iterate through each recipe, counting up to index
            for _, location in recipe.Locations do

               if (not location.IsFiltered) then
            
                  row = row + 1
                  
                  -- if index is -1, this catches on the first iteration
                  if (row == index or index == -1) then

                     if (button == "LeftButton") then

                        local vendor = RecipeRadar_RecipesTab_FindVendor(
                              location.Region, location.Vendor)

                        -- if the shift key is down, (un)map this vendor
                        if (IsShiftKeyDown()) then
                           if (vendor.IsMapped) then
                              RecipeRadar_Maps_RemoveVendor(vendor)
                           else
                              RecipeRadar_Maps_AddVendor(vendor, location.Region)
                           end
                        end

                        -- select this location and show its details
                        RecipeRadarRecipesTabFrame.SelectedVendor = vendor
                        RecipeRadarRecipesTabFrame.SelectedRecipe = recipe
                        RecipeRadarRecipesTabFrame.SelectedLocation =
                              location.Region
                        RecipeRadar_SetSelection(vendor, recipe, location.Region)
                        RecipeRadar_ShowRecipeDetails()
                        return
      
                     elseif (button == "RightButton") then

                        HideDropDownMenu(1)
                        RecipeRadar_ContextMenuGlobal.Recipe = recipe
                        RecipeRadar_ContextMenuGlobal.Location = location
                        RecipeRadar_RecipesTab_ContextMenuOnLoad()
                        ToggleDropDownMenu(1, nil, RecipesTabDropDown,
                              this:GetName(), GetCursorPosition(), 0)
                        return

                     end
                     
                  end

               end

            end

         end

      end

   end

   -- if the index was not found, select nothing
   RecipeRadar_RecipesTab_ClearSelection()
   RecipeRadar_HideRecipeDetails()

end

function RecipeRadar_RecipesTab_ToggleExpanded(recipe)

   if (recipe.IsExpanded) then
      recipe.IsExpanded = false
   else
      recipe.IsExpanded = true
   end
   RecipeRadar_RecipesTab_ClearSelection()
   RecipeRadar_FrameUpdate()

end

-- Retrieves a vendor's info table from her name and region.
function RecipeRadar_RecipesTab_FindVendor(region_name, vendor_name)

   local region_data = RecipeRadar_RegionData[region_name]
   if (not region_data) then return end

   for _, vendor in region_data.Vendors do
      if (vendor.Name == vendor_name) then
         return vendor
      end
   end
   
   return nil

end

function RecipeRadar_RecipesTab_ClearSelection()

   RecipeRadarRecipesTabFrame.SelectedVendor = nil
   RecipeRadarRecipesTabFrame.SelectedRecipe = nil
   RecipeRadarRecipesTabFrame.SelectedLocation = nil

end

-- OnLoad event handler for the right-click context menu for map buttons.
function RecipeRadar_RecipesTab_ContextMenuOnLoad()

   UIDropDownMenu_Initialize(RecipesTabDropDown,
         RecipeRadar_RecipesTab_ContextMenuInit, "MENU")

end

-- Initialization routine for the right-click context menu for map buttons.
function RecipeRadar_RecipesTab_ContextMenuInit()

   if (not RecipeRadar_ContextMenuGlobal.Recipe) then return end

   if (RecipeRadar_ContextMenuGlobal.Location) then

      local vendor = RecipeRadar_RecipesTab_FindVendor(
            RecipeRadar_ContextMenuGlobal.Location.Region,
            RecipeRadar_ContextMenuGlobal.Location.Vendor)

      -- putting in the vendor's name as the title of the popup
      local item = { }
      item.text = RecipeRadar_ContextMenuGlobal.Location.Vendor
      item.isTitle = 1
      item.notCheckable = 1
      UIDropDownMenu_AddButton(item)
   
      item = { }
      if (vendor.IsMapped) then
         item.text = RRS("Unmap Vendor")
         item.value = "unmap"
      else
         item.text = RRS("Map Vendor")
         item.value = "map"
      end
      item.notCheckable = 1
      item.func = RecipeRadar_RecipesTab_ContextMenuOnClick
      UIDropDownMenu_AddButton(item)

   end
   
   item = { }
   item.text = RRS("Expand All")
   item.value = "expandall"
   item.notCheckable = 1
   item.func = RecipeRadar_RecipesTab_ContextMenuOnClick
   if (not RecipeRadar_ContextMenuGlobal.RecipesTabHasCollapsed) then
      item.disabled = 1
   end
   UIDropDownMenu_AddButton(item)

   item = { }
   item.text = RRS("Collapse All")
   item.value = "collapseall"
   item.notCheckable = 1
   item.func = RecipeRadar_RecipesTab_ContextMenuOnClick
   if (not RecipeRadar_ContextMenuGlobal.RecipesTabHasExpanded) then
      item.disabled = 1
   end
   UIDropDownMenu_AddButton(item)

   item = { }
   item.text = CANCEL
   item.notCheckable = 1
   item.func = RecipeRadar_RecipesTab_ContextMenuOnClick
   UIDropDownMenu_AddButton(item)

end

-- OnClick event handler for the right-click context menu for map buttons.
function RecipeRadar_RecipesTab_ContextMenuOnClick()

   if (RecipeRadar_ContextMenuGlobal.Location) then

      local vendor = RecipeRadar_RecipesTab_FindVendor(
            RecipeRadar_ContextMenuGlobal.Location.Region,
            RecipeRadar_ContextMenuGlobal.Location.Vendor)

      if (this.value == "unmap") then
         RecipeRadar_Maps_RemoveVendor(vendor)
         RecipeRadar_FrameUpdate()

      elseif (this.value == "map") then
         RecipeRadar_Maps_AddVendor(vendor,
               RecipeRadar_ContextMenuGlobal.Location.Region)
         RecipeRadar_FrameUpdate()
      end

   end

   if (this.value == "expandall") then
      RecipeRadar_RecipesTab_ExpandAll(true)
      
   elseif (this.value == "collapseall") then
      RecipeRadar_RecipesTab_ExpandAll(false)
   end

end
