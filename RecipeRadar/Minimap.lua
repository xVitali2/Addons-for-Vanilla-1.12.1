
-- Minimap.lua: minimap vendor plotting code
-- $Id: Minimap.lua 429 2006-08-22 19:16:17Z jnmiller $
-- Note: the mapping code in here is from MapNotes, by Sir.Bender, et al.

-- Initializes the state of the minimap overlays and settings.
function RecipeRadar_Minimap_Init()

   -- time between minimap updates, in seconds
   RECIPERADAR_MINIMAP_UPDATE = 0.1

   -- determine minimap scale
   RecipeRadar_Minimap_SetIndoorness()

   for i = 1, RECIPERADAR_MAPPED_VENDORS_MAX do
      local button = getglobal("RecipeRadarMinimapIcon" .. i)
      button.Elapsed = 0
      button:Hide()
   end

end

function RecipeRadar_Minimap_OnNewRegion()

   SetMapToCurrentZone()
   for i = 1, RECIPERADAR_MAPPED_VENDORS_MAX do
      local button = getglobal("RecipeRadarMinimapIcon" .. i)
      if (button.IsMapped and button.Region == GetRealZoneText()) then
         button:Show()
      else
         button:Hide()
      end
   end

end

-- Map the given icon to the given vendor.
function RecipeRadar_Minimap_AddVendor(id, vendor, region)

   local button = getglobal("RecipeRadarMinimapIcon" .. id)

   button.Vendor = vendor
   button.Region = region
   button.Elapsed = RECIPERADAR_MINIMAP_UPDATE
   button.IsMapped = true
   button:Show()

end

-- Resets and unmaps the given icon.
function RecipeRadar_Minimap_RemoveVendor(id)

   local button = getglobal("RecipeRadarMinimapIcon" .. id)

   button.Vendor = nil
   button.Region = nil
   button.IsMapped = false
   button:Hide()

end

function RecipeRadar_Minimap_OnUpdate(elapsed)

   if (this.Region ~= GetRealZoneText()) then
      this:Hide()
      return
   end

   this.Elapsed = this.Elapsed + elapsed
   if (this.Elapsed < RECIPERADAR_MINIMAP_UPDATE) then
      return
   end
   this.Elapsed = 0

   RecipeRadar_Minimap_UpdateButton(this)

end

-- Determines whether the minimap is displaying an indoor location
-- by comparing the minimapZoom and minimapInsideZoom CVars (from MapNotes).
function RecipeRadar_Minimap_SetIndoorness()

   local test_zoom = 0

   if (GetCVar("minimapZoom") == GetCVar("minimapInsideZoom")) then
      if (GetCVar("minimapInsideZoom") + 0 >= 3) then
         Minimap:SetZoom(Minimap:GetZoom() - 1)
         test_zoom = 1
      else
         Minimap:SetZoom(Minimap:GetZoom() + 1)
         test_zoom = -1
      end
   end

   RecipeRadar_Minimap_IsIndoor =
         (GetCVar("minimapInsideZoom") + 0 == Minimap:GetZoom())

   Minimap:SetZoom(Minimap:GetZoom() + test_zoom)

end

-- Computes the distance between two points on the minimap.
function RecipeRadar_Minimap_Distance(p1_x, p1_y, p2_x, p2_y)

   local dist_x, dist_y = p2_x - p1_x, p2_y - p1_y

   return dist_x, dist_y

end

-- Computes the length of the hypotenuse between two lines.
function RecipeRadar_Minimap_Pythagorean(length1, length2)

   local distance = math.sqrt(length1 * length1 + length2 * length2)

   if (distance == 0) then
      return 0.0000000001
   end
   return distance

end

-- Retrieves the appropriate scaling constants from our MapData table.
function RecipeRadar_Minimap_GetScale(continent, is_indoor, zoom)

   if (continent == 0) then
      RecipeRadar_Print("ASSERT FAILED: continent = 0")
      return nil
   end

   local scale_x = RecipeRadar_MapData[continent].Scale[zoom].x
   local scale_y = RecipeRadar_MapData[continent].Scale[zoom].y

   if (is_indoor == true) then
      scale_x = scale_x * RecipeRadar_MapData.IndoorZoomRatio[zoom]
      scale_y = scale_y * RecipeRadar_MapData.IndoorZoomRatio[zoom]
   end

   return scale_x, scale_y

end

-- Finds the appropriate location on the minimap, accounting for the fact
-- that the minimap has a radius of only 57 (or so) units (from MapNotes).
function RecipeRadar_Minimap_GetPosition(offs_x, offs_y, scale_x, scale_y)

   local map_x, map_y = offs_x * scale_x, offs_y * scale_y
   local dist = RecipeRadar_Minimap_Pythagorean(map_x, map_y)

   if (dist >= 57) then

      local flip_axis = 1
      if (map_x == 0) then
         map_x = 0.0000000001
      elseif (map_x < 0) then
         flip_axis = -1
      end

      local angle = math.atan(map_y / map_x)
      map_x = math.cos(angle) * 58 * flip_axis
      map_y = math.sin(angle) * 58 * flip_axis

   end

   return map_x, map_y

end

-- Plots the given button on the minimap.
function RecipeRadar_Minimap_UpdateButton(button)

   local pl_x, pl_y = GetPlayerMapPosition("player")
   if (pl_x == 0 and pl_y == 0) then
      button:Hide()  -- the player is in an unmappable location
      return
   end

   -- only mapping the first location in our database
   local vendor = button.Vendor.Coordinates[1]
   if (not vendor) then return end

   -- some code to display the current coordinates for debugging
   if (RecipeRadar_Options.PositionDebug) then
      RecipeRadar_Print("Debugging " .. button.Vendor.Name)
      RecipeRadar_Print("Database Coords: " .. vendor.x .. ", " .. vendor.y)
      RecipeRadar_Print("Player Coords: " .. pl_x .. ", " .. pl_y)
      RecipeRadar_Options.PositionDebug = false
   end

   -- we don't need all these computations if the player isn't moving
   if (pl_x == button.pl_x and pl_y == button.pl_y) then return end
   button.pl_x, button.pl_y = pl_x, pl_y
   
   pl_x, pl_y = RecipeRadar_Maps_LocalToAbsolute(pl_x, pl_y, button.Region)
   vendor = RecipeRadar_Maps_LocalToAbsoluteTable(vendor, button.Region)

   local offs_x, offs_y = RecipeRadar_Minimap_Distance(pl_x, pl_y,
         vendor.x, vendor.y)

   local region = RecipeRadar_RegionData[button.Region]
   local scale_x, scale_y = RecipeRadar_Minimap_GetScale(
         region.Continent, RecipeRadar_Minimap_IsIndoor, Minimap:GetZoom())

   local pos_x, pos_y = RecipeRadar_Minimap_GetPosition(
         offs_x, offs_y, scale_x, scale_y)

   button:SetPoint("CENTER", "Minimap", "CENTER", pos_x, -pos_y)

end
