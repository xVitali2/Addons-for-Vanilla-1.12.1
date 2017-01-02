
-- MainFrame.lua: main Recipe Radar window code
-- $Id: MainFrame.lua 459 2006-09-16 18:33:44Z jnmiller $

function RecipeRadar_MainFrame_Init()

   RecipeRadarFrame:RegisterForDrag("LeftButton")

   RecipeRadarListScrollFrameScrollBar:SetMinMaxValues(0, 0)
   RecipeRadarListScrollFrameScrollBar:SetValue(0)
   RecipeRadarListScrollFrameScrollBar.scrollBarHideable = 1
   
   RecipeRadarOptionsButton:SetText(RRS("Options"))
   RecipeRadarMapVendorIndicatorText:SetText(RRS("Locate Vendor on Map"))
   RecipeRadar_UpdateLock()
   
   RecipeRadar_RadarTab_Init()

   RECIPERADAR_TOOLTIP_LINK = ""

end

function RecipeRadar_Toggle()

   if (RecipeRadarFrame:IsVisible()) then
      HideUIPanel(RecipeRadarFrame)
   else
      RecipeRadar_InitVendorFilters()
      RecipeRadar_InitRecipeFilters()
      RecipeRadar_Frame_Show()
   end

end

function RecipeRadar_Frame_Show()

   ShowUIPanel(RecipeRadarFrame)
   RecipeRadar_SkillDB_ParseSpellbookFrame()
   RecipeRadar_SkillDB_ParseSkillFrame()
   RecipeRadar_SkillDB_ParseReputationFrame()
   RecipeRadar_FrameUpdate()

end

function RecipeRadar_FrameUpdate()

   if (RecipeRadar_Options.ActiveTab == 1) then
      RecipeRadar_RadarTab_Update()
   else
      RecipeRadar_RecipesTab_Update()
   end

end

------------------------------------------------------------------------
-- Tab code
------------------------------------------------------------------------

-- Draws the borders around each tab according to which is active.
function RecipeRadar_SetActiveTab(id)

   local active_tab_height, background_tab_height = 33, 29

   if (id == 1) then
      RecipeRadarRadarTabFrameMiddle:SetHeight(active_tab_height)
      RecipeRadarRadarTabFrameRight:SetHeight(active_tab_height)
      RecipeRadarRecipesTabFrameLeft:SetHeight(background_tab_height)
      RecipeRadarRecipesTabFrameMiddle:SetHeight(background_tab_height)
      RecipeRadarRecipesTabFrameRight:SetHeight(background_tab_height)
      RecipeRadar_Options.ActiveTab = 1
   else
      RecipeRadarRadarTabFrameMiddle:SetHeight(background_tab_height)
      RecipeRadarRadarTabFrameRight:SetHeight(background_tab_height)
      RecipeRadarRecipesTabFrameLeft:SetHeight(active_tab_height)
      RecipeRadarRecipesTabFrameMiddle:SetHeight(active_tab_height)
      RecipeRadarRecipesTabFrameRight:SetHeight(active_tab_height)
      RecipeRadar_Options.ActiveTab = 2
   end  

end

-- Sets the button color and the corresponding highlight color.
function RecipeRadar_SetButtonColors(button, text_color)

   button:SetTextColor(text_color.r, text_color.g, text_color.b)
   button:SetHighlightTextColor(
         text_color.r + RecipeRadar_Colors.Highlight,
         text_color.g + RecipeRadar_Colors.Highlight,
         text_color.b + RecipeRadar_Colors.Highlight)

end

-- Common drawing code for list items in the scroll frame.
function RecipeRadar_DrawListItem(index, recipe)

   local button = getglobal("RecipeRadarVendor" .. index)

   -- get and set the text color according to recipe availability
   local name = RecipeRadar_GetSafeItemInfo(recipe.ID)
   local indicator = RecipeRadar_Availability_GetIndicator(recipe)

   if (name == RRS("Uncached Recipe")) then
      RecipeRadar_SetButtonColors(button, RecipeRadar_Colors.UncachedRecipe)
   else
      RecipeRadar_SetButtonColors(button, RecipeRadar_Colors.LightGray)
   end

   -- basic drawing code
   if (RecipeRadar_Options.RealmAvailability) then
      button:SetText(name .. indicator)
   else
      button:SetText(name)
   end
   button:SetID(index)
   button:Show()

   -- drawing code for the little subtext field
   local subtext = getglobal("RecipeRadarVendor" .. index .. "SubText")
   if (not RecipeRadar_Options.RealmAvailability) then
      local avail = RecipeRadar_Availability_GetKey(recipe)
      if (avail) then
         button.r = RecipeRadar_Availabilities[avail].Color.r
         button.g = RecipeRadar_Availabilities[avail].Color.g
         button.b = RecipeRadar_Availabilities[avail].Color.b
      else
         button.r = RecipeRadar_Colors.UncachedRecipe.r
         button.g = RecipeRadar_Colors.UncachedRecipe.g
         button.b = RecipeRadar_Colors.UncachedRecipe.b
      end
      subtext:SetText(indicator)
      subtext:SetTextColor(button.r, button.g, button.b)
      subtext:SetPoint("LEFT", "RecipeRadarVendor" .. index .. "Text",
            "RIGHT", 10, 0)
      subtext:Show()
   else
      subtext:Hide()
   end

   -- provide information for the availability tooltip
   button.Recipe = recipe

end

------------------------------------------------------------------------
-- Base vendor/recipe selection code
------------------------------------------------------------------------

-- OnClick handler for the vendor/recipe buttons in the scroll frame.
function RecipeRadar_VendorButton_OnClick(button)

   local offset = FauxScrollFrame_GetOffset(RecipeRadarListScrollFrame)
   local index = this:GetID() + offset

   RecipeRadar_ServiceClickIndex(index, button)

   if (button == "LeftButton") then
      RecipeRadar_FrameUpdate()
   end

end

-- Selects the first visible recipe (not vendor).
function RecipeRadar_SelectFirstRecipe()

   RecipeRadar_ServiceClickIndex(-1)

end

-- Abstracts front for click handlers.
function RecipeRadar_ServiceClickIndex(index, button)

   if (RecipeRadar_Options.ActiveTab == 1) then
      RecipeRadar_RadarTab_ServiceClickIndex(index, button)
   else
      RecipeRadar_RecipesTab_ServiceClickIndex(index, button)
   end

end

------------------------------------------------------------------------
-- Recipe details and map frames
------------------------------------------------------------------------

function RecipeRadar_ShowRecipeDetails()

   RecipeDetailName:Show()
   RecipeDetailIcon:Show()
   RecipeDetailCostText:Show()
   RecipeDetailMoneyFrame:Show()

end

function RecipeRadar_HideRecipeDetails()

   RecipeDetailName:Hide()
   RecipeDetailIcon:Hide()
   RecipeDetailCostText:Hide()
   RecipeDetailMoneyFrame:Hide()
   RecipeDetailNoteText:Hide()
   RecipeDetailRequirements:Hide()
   RecipeRadarRegionMap:Hide()

   -- reset the mapped indicator to red/off
   RecipeRadarMapVendorIndicator:SetVertexColor(1.0, 0, 0)

   -- hide all of our little mapping scrolls
   for i = 1, RecipeRadar_MaxVendorCoordinates do
      getglobal("RecipeRadarScroll" .. i):Hide()
   end

end

-- When a recipe is actually selected, this function handles the
-- subsequent drawing in the lower details and map frames.
function RecipeRadar_SetSelection(vendor, recipe, region_name)

   local name, link, colorcode, _, _, _, texture, cached =
         RecipeRadar_GetSafeItemInfo(recipe.ID)

   RecipeDetailName:SetText(name)

   -- handle the little icon in the details frame
   RecipeDetailIcon:SetNormalTexture(texture)
   RecipeDetailIcon.NeedsUpdate = not cached
   RecipeDetailIcon.Name = name
   RecipeDetailIcon.Link = link
   RecipeDetailIcon.Hyperlink =
         RecipeRadar_GetHyperlinkByParts(name, link, colorcode)

   -- set the color/content of the money text
   if (GetMoney() >= recipe.Cost) then
      SetMoneyFrameColor("RecipeDetailMoneyFrame", 1.0, 1.0, 1.0);
   else
      SetMoneyFrameColor("RecipeDetailMoneyFrame", 1.0, 0.1, 0.1);
   end
   MoneyFrame_Update("RecipeDetailMoneyFrame", recipe.Cost);

   -- some vendors have special requirements
   if (RecipeRadar_GetRecipeReqsString(recipe)) then
      RecipeDetailRequirements:SetText(RecipeRadar_GetRecipeReqsString(recipe))
      RecipeDetailNoteText:Show()
      RecipeDetailRequirements:Show()
   else
      RecipeDetailNoteText:Hide()
      RecipeDetailRequirements:Hide()
   end

   -- sets the color on the little radio button at the top
   if (vendor.IsMapped) then
      RecipeRadarMapVendorIndicator:SetVertexColor(0, 1.0, 0)
   else
      RecipeRadarMapVendorIndicator:SetVertexColor(1.0, 0, 0)
   end

   if (vendor.Coordinates) then

      if (not region_name) then
         region_name = RecipeRadar_Options.CurrentRegion
      end

      local region = RecipeRadar_RegionData[region_name]
      if (not region) then return end

      -- draw the map first
      RecipeRadarRegionMap:SetTexture(
            RECIPERADAR_IMAGE_ROOT .. "Regions\\" .. region.MapFile)
      RecipeRadarRegionMap:Show()

      -- then draw the little icon (or multiple icons for moble vendors)
      for i = 1, RecipeRadar_MaxVendorCoordinates do

         local scroll_icon = getglobal("RecipeRadarScroll" .. i)
         local coords = vendor.Coordinates[i]

         if (not coords) then
            scroll_icon:Hide()
         else
            local x = RecipeRadarMapFrame:GetWidth() * coords.x
            local y = RecipeRadarMapFrame:GetHeight() * -coords.y
            scroll_icon.Vendor = vendor
            scroll_icon:SetPoint("CENTER", "RecipeRadarMapFrame",
                  "TOPLEFT", x, y)
            scroll_icon:Show()
         end

      end

   else  -- no vendor coordinates means no map

      RecipeRadarRegionMap:Hide()
      for i = 1, RecipeRadar_MaxVendorCoordinates do
         getglobal("RecipeRadarScroll" .. i):Hide()
      end

   end

end

function RecipeRadar_RecipeDetailIcon_ShowToolTip()

   GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
   GameTooltip:SetHyperlink(RecipeDetailIcon.Link)
   GameTooltip:Show()

   if RecipeDetailIcon.NeedsUpdate then return end

   if (RecipeBook_DoHookedFunction) then
      RecipeBook_DoHookedFunction(GameTooltip, RecipeDetailIcon.Link)
   end

   if (EnhTooltip and EnhTooltip.TooltipCall) then
      EnhTooltip.TooltipCall(GameTooltip, RecipeDetailIcon.Name,
            RecipeDetailIcon.Hyperlink, nil, 1)
   end

end

-------------------------------------------------------------------------
-- Frame Movement
-------------------------------------------------------------------------

function RecipeRadar_ToggleLock()

   if (RecipeRadar_Options.Locked) then
      RecipeRadar_Options.Locked = false
      RecipeRadar_UpdateLock()
   else
      RecipeRadar_Options.Locked = true
      RecipeRadar_UpdateLock()
   end

end

function RecipeRadar_UpdateLock()

   if (RecipeRadar_Options.Locked) then
      RecipeRadarLockNormal:SetTexture(
            RECIPERADAR_IMAGE_ROOT .. "Frame\\LockButton-Locked-Up")
      RecipeRadarLockPushed:SetTexture(
            RECIPERADAR_IMAGE_ROOT .. "Frame\\LockButton-Locked-Down")
   else
      RecipeRadarLockNormal:SetTexture(
            RECIPERADAR_IMAGE_ROOT .. "Frame\\LockButton-Unlocked-Up")
      RecipeRadarLockPushed:SetTexture(
            RECIPERADAR_IMAGE_ROOT .. "Frame\\LockButton-Unlocked-Down")
   end

end

function RecipeRadar_StartMoving()

   if (not RecipeRadar_Options.Locked) then
      RecipeRadarFrame:StartMoving()
   end

end
