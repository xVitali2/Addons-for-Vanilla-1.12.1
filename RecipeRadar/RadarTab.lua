
-- RadarTab.lua: handles clicking and drawing for the Radar tab
-- $Id: RadarTab.lua 443 2006-09-01 04:41:40Z jnmiller $

function RecipeRadar_RadarTab_Init()

   RecipeRadar_Prof1DropDown:Show()
   RecipeRadar_Prof2DropDown:Hide()

   RecipeRadar_SetActiveTab(1)
   
   RecipeRadar_RadarTab_Update()
   RecipeRadarListScrollFrameScrollBar:SetValue(
         RecipeRadarRadarTabFrame.ScrollValue)
   
end

function RecipeRadar_RadarTab_OnClick()

   if (RecipeRadar_Options.ActiveTab == 1) then
      return
   end

   PlaySound("igSpellBookClose")
   RecipeRadar_RadarTab_Init()

end

function RecipeRadar_RadarTab_ExpandAll(expand)

   local region = RecipeRadar_RegionData[RecipeRadar_Options.CurrentRegion]
   if (not region) then return end

   for _, vendor in region.Vendors do
      vendor.IsExpanded = expand
   end

   RecipeRadar_SelectFirstRecipe()
   RecipeRadar_FrameUpdate()

end

function RecipeRadar_RadarTab_Update()

   if (RecipeRadar_Options.ActiveTab ~= 1) then
      return
   end

   local title = RRS("Recipe Radar")
   if (RecipeRadar_Options.CurrentRegion) then
      title = title .. " - " .. RecipeRadar_Options.CurrentRegion
      local parens = string.find(title, " %(")
      if (parens) then  -- remove parenthesized zone title
         title = string.sub(title, 1, parens - 1)
      end
   end
   TitleBarText:SetText(title)

   -- some globals for the Update() procedure
   RecipeRadar_row = 0
   RecipeRadar_last_button = ""
   RecipeRadar_ContextMenuGlobal.RadarTabHasExpanded = false
   RecipeRadar_ContextMenuGlobal.RadarTabHasCollapsed = false

   RecipeRadarHighlightFrame:Hide()

   local region = RecipeRadar_RegionData[RecipeRadar_Options.CurrentRegion]
   -- only populate the scroll frame if we have valid region data
   if (region) then
      RecipeRadar_SortVendors(region)
      table.foreach(region.Vendors, RecipeRadar_RadarTab_AddVendor)
   end

   -- update the scroll position and the width of the highlight frame
   FauxScrollFrame_Update(RecipeRadarListScrollFrame, RecipeRadar_row,
         RECIPERADAR_VENDORS_DISPLAYED, RECIPERADAR_VENDOR_HEIGHT,
         nil, nil, nil, RecipeRadarHighlightFrame, 361, 384)

   -- update the widths of the vendor/recipe buttons after scroll update
   for i = 1, RECIPERADAR_VENDORS_DISPLAYED do
      local button = getglobal("RecipeRadarVendor" .. i)
      if (i > RecipeRadar_row) then
         button:Hide()
      elseif (button.Recipe) then
         if (RecipeRadarListScrollFrame:IsVisible()) then
            button:SetWidth(361 - RECIPERADAR_VENDOR_OFFSET)
         else
            button:SetWidth(384 - RECIPERADAR_VENDOR_OFFSET)
         end
      else
         if (RecipeRadarListScrollFrame:IsVisible()) then
            button:SetWidth(361)
         else
            button:SetWidth(384)
         end
      end
   end

   -- update the current selection (or lack thereof)
   if (not region or not RecipeRadarRadarTabFrame.SelectedRecipe) then
      RecipeRadar_HideRecipeDetails()
   elseif (RecipeRadarRadarTabFrame.SelectedVendor) then
      RecipeRadar_SetSelection(RecipeRadarRadarTabFrame.SelectedVendor,
            RecipeRadarRadarTabFrame.SelectedRecipe)
      RecipeRadar_ShowRecipeDetails()
   end

end

-- This function is called for each vendor during the main update.  It
-- adds the vendor and her recipes, if appropriate, to the main scroll frame.
function RecipeRadar_RadarTab_AddVendor(key, vendor)

   -- don't add the vendor if she or her recipes are filtered
   if (vendor.IsFiltered or not RecipeRadar_VendorHasRecipes(vendor)) then
      if (vendor.IsMapped) then
         RecipeRadar_Maps_RemoveVendor(vendor)
      end
      return
   end

   RecipeRadar_row = RecipeRadar_row + 1

   local offset = FauxScrollFrame_GetOffset(RecipeRadarListScrollFrame)
   local index = RecipeRadar_row - offset

   -- reset our radio button to red/off in case there are no listed vendors
   RecipeRadarMapVendorIndicator:SetVertexColor(1.0, 0, 0)

   -- only do the following if we're in the scroll frame's visible portion
   if (index > 0 and index <= RECIPERADAR_VENDORS_DISPLAYED) then

      local button = getglobal("RecipeRadarVendor" .. index)

      -- decide the horizontal offset of this button
      if (index == 1) then
         button:SetPoint("TOPLEFT", "RecipeRadarFrame",
               "TOPLEFT", 22, -96)
      elseif (RecipeRadar_last_button == "recipe") then
         button:SetPoint("TOPLEFT", "RecipeRadarVendor" .. index - 1,
               "BOTTOMLEFT", -RECIPERADAR_VENDOR_OFFSET, 0)
      elseif (RecipeRadar_last_button == "vendor") then
         button:SetPoint("TOPLEFT", "RecipeRadarVendor" .. index - 1,
               "BOTTOMLEFT", 0, 0)
      end

      -- this variable decides the next button's horizontal offset
      RecipeRadar_last_button = "vendor"

      -- basic drawing code
      button:UnlockHighlight()
      button:SetText(vendor.Name)
      RecipeRadar_SetButtonColors(button, RecipeRadar_Teams[vendor.Team].Color)
      button:SetID(index)
      button:Show()

      -- drawing code for the little subtext field
      local subtext = getglobal("RecipeRadarVendor" .. index .. "SubText")
      if (vendor.Notes and vendor.Notes ~= "") then
         local note = RecipeRadar_FormatVendorNote(vendor.Notes, true)
         VendorNameDummySubText:SetText(note .. "    ")
         subtext:SetText(note)
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
      else
         subtext:Hide()
      end

      -- show or hide the little mapped indicator check mark
      local check = getglobal("RecipeRadarVendor" .. index .. "Check")
      if (vendor.IsMapped) then
         VendorNameDummyText:SetText(vendor.Name .. "  ")
         local check_offset = VendorNameDummyText:GetWidth() + 24
         if (vendor.Notes and vendor.Notes ~= "") then
            check_offset = check_offset + VendorNameDummySubText:GetWidth()
         end
         check:SetPoint("TOPLEFT", "RecipeRadarVendor" .. index, "TOPLEFT",
               check_offset, 0)
         check:Show()
      else
         check:Hide()
      end

      -- unset to indicate this is a vendor header for the tooltip stuff
      button.Recipe = nil

      -- icon highlight is different for vendors than recipes
      getglobal("RecipeRadarVendor" .. index .. "Highlight"):SetTexture(
            "Interface\\Buttons\\UI-PlusButton-Hilight")

      if (vendor.IsExpanded ~= false) then
         RecipeRadar_ContextMenuGlobal.RadarTabHasExpanded = true
         button:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
      else
         RecipeRadar_ContextMenuGlobal.RadarTabHasCollapsed = true
         button:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
         return
      end

   else

      -- if the vendor is collapsed, we don't need to count her recipes
      if (vendor.IsExpanded == false) then
         RecipeRadar_ContextMenuGlobal.RadarTabHasCollapsed = true
         return
      else
         RecipeRadar_ContextMenuGlobal.RadarTabHasExpanded = true
      end

   end

   RecipeRadar_SortRecipes(vendor)

   for _, recipe in vendor.Recipes do

      -- skip filtered recipes, of course
      if (not RecipeRadar_IsRecipeFiltered(recipe)) then

         RecipeRadar_row = RecipeRadar_row + 1
         index = RecipeRadar_row - offset;

         -- only do this if we're in the scroll frame's visible portion
         if (index > 0 and index <= RECIPERADAR_VENDORS_DISPLAYED) then

            local button = getglobal("RecipeRadarVendor" .. index)

            -- decide the horizontal offset of this button
            if (index == 1) then
               button:SetPoint("TOPLEFT", "RecipeRadarFrame",
                     "TOPLEFT", 22 + RECIPERADAR_VENDOR_OFFSET, -96)
            elseif (RecipeRadar_last_button == "recipe") then
               button:SetPoint("TOPLEFT", "RecipeRadarVendor" .. index - 1,
                     "BOTTOMLEFT", 0, 0)
            elseif (RecipeRadar_last_button == "vendor") then
               button:SetPoint("TOPLEFT", "RecipeRadarVendor" .. index - 1,
                     "BOTTOMLEFT", RECIPERADAR_VENDOR_OFFSET, 0)
            end

            -- this variable decides the next button's horizontal offset
            RecipeRadar_last_button = "recipe"

            -- generic list item drawing
            RecipeRadar_DrawListItem(index, recipe)
            
            -- radar tab-specific list item drawing
            button:SetNormalTexture(RecipeRadar_Professions[recipe.Type].Icon)
            getglobal("RecipeRadarVendor" .. index .. "Check"):Hide()
            getglobal("RecipeRadarVendor" .. index .. "Highlight"):
                  SetTexture(RECIPERADAR_IMAGE_ROOT .. "Icons\\Highlight")

            -- selected recipes look a little bit different
            if (RecipeRadarRadarTabFrame.SelectedRecipe == recipe) then
               RecipeRadarHighlightFrame:SetPoint("TOPLEFT",
                     "RecipeRadarVendor" .. index, "TOPLEFT", -22, 0)
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
function RecipeRadar_RadarTab_ServiceClickIndex(index, button)

   local region = RecipeRadar_RegionData[RecipeRadar_Options.CurrentRegion]
   if (not region) then return end

   if (not button) then button = "LeftButton" end

   -- save this index so we can return to it on tab switch
   RecipeRadarRadarTabFrame.SelectedIndex = index

   -- sort the vendors so we're counting in the right order
   RecipeRadar_SortVendors(region)
   local row = 0

   -- iterate through each vendor, counting up to index
   for _, vendor in region.Vendors do

      -- if this vendor is filtered, she does not count towards our index
      if (not vendor.IsFiltered and RecipeRadar_VendorHasRecipes(vendor)) then

         row = row + 1

         if (row == index) then

            if (button == "LeftButton") then
            
               -- if the shift key is down, the user wants to (un)map this vendor
               if (IsShiftKeyDown()) then
                  if (vendor.IsMapped) then
                     RecipeRadar_Maps_RemoveVendor(vendor)
                  else
                     RecipeRadar_Maps_AddVendor(vendor,
                           RecipeRadar_Options.CurrentRegion)
                  end
   
               -- otherwise, we collapse or expand the vendor button
               else
                  RecipeRadar_RadarTab_ToggleExpanded(vendor)
               end
   
               return
   
            elseif (button == "RightButton") then
   
               HideDropDownMenu(1)
               RecipeRadar_ContextMenuGlobal.Vendor = vendor
               RecipeRadar_RadarTab_ContextMenuOnLoad()
               ToggleDropDownMenu(1, nil, RadarTabDropDown,
                     this:GetName(), GetCursorPosition(), 0)
               return
         
            end
            
         end

         if (vendor.IsExpanded ~= false) then

            -- sort the recipes so we're counting in the right order
            RecipeRadar_SortRecipes(vendor)
            local vendor_index = row

            -- iterate through each recipe, counting up to index
            for _, recipe in vendor.Recipes do

               -- don't count filtered recipes
               if (not RecipeRadar_IsRecipeFiltered(recipe)) then

                  row = row + 1

                  -- if index is -1, this catches on the first iteration
                  if (row == index or index == -1) then

                     if (button == "LeftButton") then

                        -- if the shift key is down, we map this recipe's vendor
                        if (IsShiftKeyDown()) then
                           if (vendor.IsMapped) then
                              RecipeRadar_Maps_RemoveVendor(vendor)
                           else
                              RecipeRadar_Maps_AddVendor(vendor,
                                    RecipeRadar_Options.CurrentRegion)
                           end
                        end

                        -- otherwise, select this recipe and show its details
                        RecipeRadarRadarTabFrame.SelectedVendor = vendor
                        RecipeRadarRadarTabFrame.SelectedRecipe = recipe
                        RecipeRadar_SetSelection(vendor, recipe)
                        RecipeRadar_ShowRecipeDetails()
                        return

                     elseif (button == "RightButton") then

                        HideDropDownMenu(1)
                        RecipeRadar_ContextMenuGlobal.Vendor = vendor
                        RecipeRadar_RadarTab_ContextMenuOnLoad()
                        ToggleDropDownMenu(1, nil, RadarTabDropDown,
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
   RecipeRadar_RadarTab_ClearSelection()
   RecipeRadar_HideRecipeDetails()

end

function RecipeRadar_RadarTab_ToggleExpanded(vendor)

   if (vendor.IsExpanded == false) then
      vendor.IsExpanded = true
   else
      vendor.IsExpanded = false
   end
   RecipeRadar_RadarTab_ClearSelection()
   RecipeRadar_FrameUpdate()

end

function RecipeRadar_RadarTab_ClearSelection()

   RecipeRadarRadarTabFrame.SelectedVendor = nil
   RecipeRadarRadarTabFrame.SelectedRecipe = nil

end

-- OnLoad event handler for the right-click context menu for map buttons.
function RecipeRadar_RadarTab_ContextMenuOnLoad()

   UIDropDownMenu_Initialize(RadarTabDropDown,
         RecipeRadar_RadarTab_ContextMenuInit, "MENU")

end

-- Initialization routine for the right-click context menu for map buttons.
function RecipeRadar_RadarTab_ContextMenuInit()

   if (not RecipeRadar_ContextMenuGlobal.Vendor) then return end

   -- putting in the vendor's name as the title of the popup
   local item = { }
   item.text = RecipeRadar_ContextMenuGlobal.Vendor.Name
   item.isTitle = 1
   item.notCheckable = 1
   UIDropDownMenu_AddButton(item)

   item = { }
   if (RecipeRadar_ContextMenuGlobal.Vendor.IsMapped) then
      item.text = RRS("Unmap Vendor")
      item.value = "unmap"
   else
      item.text = RRS("Map Vendor")
      item.value = "map"
   end
   item.notCheckable = 1
   item.func = RecipeRadar_RadarTab_ContextMenuOnClick
   UIDropDownMenu_AddButton(item)

   item = { }
   item.text = RRS("Expand All")
   item.value = "expandall"
   item.notCheckable = 1
   item.func = RecipeRadar_RadarTab_ContextMenuOnClick
   if (not RecipeRadar_ContextMenuGlobal.RadarTabHasCollapsed) then
      item.disabled = 1
   end
   UIDropDownMenu_AddButton(item)

   item = { }
   item.text = RRS("Collapse All")
   item.value = "collapseall"
   item.notCheckable = 1
   item.func = RecipeRadar_RadarTab_ContextMenuOnClick
   if (not RecipeRadar_ContextMenuGlobal.RadarTabHasExpanded) then
      item.disabled = 1
   end
   UIDropDownMenu_AddButton(item)

   item = { }
   item.text = CANCEL
   item.notCheckable = 1
   item.func = RecipeRadar_RadarTab_ContextMenuOnClick
   UIDropDownMenu_AddButton(item)

end

-- OnClick event handler for the right-click context menu for map buttons.
function RecipeRadar_RadarTab_ContextMenuOnClick()

   if (this.value == "unmap") then
      RecipeRadar_Maps_RemoveVendor(RecipeRadar_ContextMenuGlobal.Vendor)
      RecipeRadar_FrameUpdate()
      
   elseif (this.value == "map") then
      RecipeRadar_Maps_AddVendor(RecipeRadar_ContextMenuGlobal.Vendor,
            RecipeRadar_Options.CurrentRegion)
      RecipeRadar_FrameUpdate()

   elseif (this.value == "expandall") then
      RecipeRadar_RadarTab_ExpandAll(true)
      
   elseif (this.value == "collapseall") then
      RecipeRadar_RadarTab_ExpandAll(false)
   end

end
