
-- Maps.lua: generic mapping code and map "base class"
-- $Id: Maps.lua 443 2006-09-01 04:41:40Z jnmiller $

-- Initializes the state of the map overlays and settings.
function RecipeRadar_Maps_Init()

   RecipeRadar_Minimap_Init()
   RecipeRadar_Worldmap_Init()

   RecipeRadar_MappedVendors = { }

end

-- find the next unused icon; we just check minimap icons since
-- world/mini icons should always correspond
function RecipeRadar_Maps_FindNextID()

   for i = 1, RECIPERADAR_MAPPED_VENDORS_MAX do
      if (not getglobal("RecipeRadarMinimapIcon" .. i).IsMapped) then
         return i
      end
   end

   return nil

end

-- Add the given vendor to the list of mapped vendors.
function RecipeRadar_Maps_AddVendor(vendor, region)

   if (vendor.IsMapped) then return end  -- vendor is already mapped

   local continent = RecipeRadar_RegionData[region].Continent
   if (continent == 0) then return end  -- instance vendor

   if (not vendor.Coordinates) then
      RecipeRadar_Print("ASSERT FAILED: " .. vendor.Name ..
            " has no coordinates.")
      return
   end

   local id = RecipeRadar_Maps_FindNextID()
   if (not id) then return end

   RecipeRadar_Worldmap_AddVendor(id, vendor, region, continent)
   RecipeRadar_Minimap_AddVendor(id, vendor, region)

   RecipeRadar_MappedVendors[vendor.Name] = id
   vendor.IsMapped = true

end

-- Unmap the vendor.
function RecipeRadar_Maps_RemoveVendor(vendor)

   local id = RecipeRadar_MappedVendors[vendor.Name]

   RecipeRadar_Minimap_RemoveVendor(id)
   RecipeRadar_Worldmap_RemoveVendor(id)

   RecipeRadar_MappedVendors[vendor.Name] = nil
   vendor.IsMapped = false

end

-- Creates and displays the tooltip that displays on mouseover for all
-- of our maps - minimap, worldmap and our custom Recipe Radar map.
-- tooltip is the tooltip to draw (eg. GameTooltip), and frame is the
-- owner button.
function RecipeRadar_Maps_SetTooltip(tooltip, frame)

   local line1, line2 = RecipeRadar_GetColoredTeamString(
         frame.Vendor.Team, frame.Vendor.Name)
   local anchor = "ANCHOR_BOTTOMLEFT"
   
   local count = table.getn(frame.Vendor.Recipes)
   if (count == 1) then
      line2 = RRS("1 recipe")
   else
      line2 = string.format(RRS("%d recipes"), count)
   end

   count = RecipeRadar_CountLearnableRecipes(frame.Vendor.Recipes)
   line2 = line2 .. " " .. format(TEXT(PARENS_TEMPLATE),
         format(RRS("%d learnable"), count))

   -- make sure our tooltip doesn't hit the screen edge
   if (frame:GetLeft() < 200) then
      anchor = "ANCHOR_RIGHT"
   end

   tooltip:SetOwner(frame, anchor)
   tooltip:SetText(line1)
   tooltip:AddLine(line2)
   if (frame.Vendor.Notes and frame.Vendor.Notes ~= "") then
      tooltip:AddLine(RecipeRadar_FormatVendorNote(frame.Vendor.Notes, true))
   end
   tooltip:Show()

end

-- OnLoad event handler for the right-click context menu for map buttons.
function RecipeRadar_Maps_ContextMenuOnLoad()

   RecipeRadar_ContextMenuGlobal = { }
   UIDropDownMenu_Initialize(this, RecipeRadar_Maps_ContextMenuInit, "MENU")

end

-- Initialization routine for the right-click context menu for map buttons.
function RecipeRadar_Maps_ContextMenuInit()

   local item

   -- putting in the vendor's name as the title of the popup
   if (RecipeRadar_ContextMenuGlobal.Vendor) then
      item = { }
      item.text = RecipeRadar_ContextMenuGlobal.Vendor.Name
      item.isTitle = 1
      item.notCheckable = 1
      UIDropDownMenu_AddButton(item)
   end

   item = { }
   item.text = RRS("Unmap Vendor")
   item.value = "unmap"
   item.notCheckable = 1
   item.func = RecipeRadar_Maps_ContextMenuOnClick
   UIDropDownMenu_AddButton(item)

   item = { }
   item.text = CANCEL
   item.notCheckable = 1
   item.func = RecipeRadar_Maps_ContextMenuOnClick
   UIDropDownMenu_AddButton(item)

end

-- OnClick event handler for the right-click context menu for map buttons.
function RecipeRadar_Maps_ContextMenuOnClick()

   if (this.value == "unmap") then
      RecipeRadar_Maps_RemoveVendor(RecipeRadar_ContextMenuGlobal.Vendor)
      RecipeRadar_FrameUpdate()
   end

end

-- Changes local (region map) coordinates to absolute coordinates.
function RecipeRadar_Maps_LocalToAbsolute(local_x, local_y, region)

   local region = RecipeRadar_RegionData[region]
   if (not region) then return end

   local absolute_x = local_x * region.MapScale + region.MapOffset.x
   local absolute_y = local_y * region.MapScale + region.MapOffset.y

   return absolute_x, absolute_y

end

-- Changes local (region map) coordinates to absolute coordinates.
function RecipeRadar_Maps_LocalToAbsoluteTable(local_coords, region)

   local region = RecipeRadar_RegionData[region]
   if (not region) then return end

   local absolute = { }
   absolute.x = local_coords.x * region.MapScale + region.MapOffset.x
   absolute.y = local_coords.y * region.MapScale + region.MapOffset.y

   return absolute

end

-- Map constants (from MapNotes).
RecipeRadar_MapData = {

   IndoorZoomRatio = {
      [0] = 1.565,
      [1] = 1.687,
      [2] = 1.882,
      [3] = 2.210,
      [4] = 2.575,
      [5] = 2.651,
   },

   Worldmap = {
      [1] = {
         Scale = 0.815775262,
         Offset = { x = -0.185568684, y = 0.064012977 },
      },
      [2] = {
         Scale = 0.790967532,
         Offset = { x = 0.371931204, y = 0.081458069 },
      },
   },

   [1] = {
      Scale = {  -- continent scale rates
         [0] = { x = 11016.6, y = 7399.9 },
         [1] = { x = 12897.3, y = 8638.1 },
         [2] = { x = 15478.8, y = 10368.0 },
         [3] = { x = 19321.8, y = 12992.7 },
         [4] = { x = 25650.4, y = 17253.2 },
         [5] = { x = 38787.7, y = 26032.1 },
      }
   },

   [2] = {
      Scale = {  -- continent scale rates
         [0] = { x = 10448.3, y = 7072.7 },
         [1] = { x = 12160.5, y = 8197.8 },
         [2] = { x = 14703.1, y = 9825.0 },
         [3] = { x = 18568.7, y = 12472.2 },
         [4] = { x = 24390.3, y = 15628.5 },
         [5] = { x = 37012.2, y = 25130.6 },
      },
   },

}
