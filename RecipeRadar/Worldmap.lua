
-- Worldmap.lua: worldmap vendor plotting code
-- $Id: Worldmap.lua 430 2006-08-22 19:18:01Z jnmiller $

-- Initializes the state of the worldmap overlays and settings.
function RecipeRadar_Worldmap_Init()

   for i = 1, RECIPERADAR_MAPPED_VENDORS_MAX do
      getglobal("RecipeRadarWorldmapIcon" .. i):Hide()
   end
   
   -- this bit hooks the world map's OnHide event to reset the current zone
   local map_frame = getglobal("WorldMapFrame")
   local on_hide = map_frame:GetScript("OnHide")
   if (on_hide) then
      map_frame.RecipeRadar_OnHide = on_hide
      map_frame:SetScript("OnHide",
            function()
               this.RecipeRadar_OnHide()
               RecipeRadar_Minimap_OnNewRegion()
            end)
   end
   
end

-- Map the given icon to the given vendor.
function RecipeRadar_Worldmap_AddVendor(id, vendor, region, continent)

   local button = getglobal("RecipeRadarWorldmapIcon" .. id)
   button.Vendor = vendor
   button.Continent = continent
   button.RegionName = region
   button.RegionID = RecipeRadar_RegionNameToID(region, continent)
   button.IsMapped = true

end

-- Resets and unmaps the given icon.
function RecipeRadar_Worldmap_RemoveVendor(id)

   local button = getglobal("RecipeRadarWorldmapIcon" .. id)
   button.Vendor = nil
   button.RegionID = nil
   button.Continent = nil
   button.IsMapped = false
   button:Hide()

end

-- Calls TranslateCoords() on all active icons.
function RecipeRadar_Worldmap_UpdateButtons()

   for i = 1, RECIPERADAR_MAPPED_VENDORS_MAX do
      local button = getglobal("RecipeRadarWorldmapIcon" .. i)
      if (button.IsMapped) then
         RecipeRadar_Worldmap_TranslateCoords(button)
      end
   end

end

-- Plot a vendor - called iteratively on the MappedVendors table.
function RecipeRadar_Worldmap_TranslateCoords(button)

   local cont, zone = GetCurrentMapContinent(), GetCurrentMapZone()

   -- map is showing the vendor's region, so no translation is needed
   if (cont == button.Continent and zone == button.RegionID) then

      -- only mapping the first coordinate in our database
      RecipeRadar_Worldmap_PlotVendor(button, button.Vendor.Coordinates[1])
      
   -- map is showing the vendor's continent, so perform absolute translation
   elseif (cont == button.Continent and zone == 0) then

      local coords = RecipeRadar_Maps_LocalToAbsoluteTable(
            button.Vendor.Coordinates[1], button.RegionName)
      RecipeRadar_Worldmap_PlotVendor(button, coords)
         
   -- worldmap is shown, so perform absolute/division translation
   elseif (cont == 0 and zone == 0) then

      local trans = RecipeRadar_MapData.Worldmap[button.Continent]
      local coords = RecipeRadar_Maps_LocalToAbsoluteTable(
            button.Vendor.Coordinates[1], button.RegionName)
      coords.x = coords.x * trans.Scale + trans.Offset.x
      coords.y = coords.y * trans.Scale + trans.Offset.y
      RecipeRadar_Worldmap_PlotVendor(button, coords)

   else
      button:Hide()
   end
   
end

-- Plot a vendor - convert x, y to WorldMapDetailFrame coordinates.
function RecipeRadar_Worldmap_PlotVendor(button, coords)

   local x = coords.x * WorldMapDetailFrame:GetWidth()
   local y = -coords.y * WorldMapDetailFrame:GetHeight()

   button:SetPoint("CENTER", "WorldMapDetailFrame", "TOPLEFT", x, y)
   button:Show()

end
