
-- AvailabilityTooltip.lua: handles the recipe availability tooltip
-- $Id: AvailabilityTooltip.lua 282 2006-04-12 08:41:25Z jnmiller $

function RecipeRadar_AvailabilityTooltip_AddLine(msg, color)

   if (RecipeRadarAvailabilityTooltip.Lines ==
         RecipeRadar_AvailabilityTooltip_MaxLines) then
      RecipeRadar_Print("ASSERT FAILED: tooltip has too many lines.")
      return
   end
   
   local line_num = RecipeRadarAvailabilityTooltip.Lines + 1
   local line = getglobal("RecipeRadarAvailabilityTooltipText" .. line_num)

   -- handle null colors
   if (color) then
      line:SetTextColor(color.r, color.g, color.b)
   else
      line:SetTextColor(1, 1, 1)
   end
   
   -- handle null messages
   if (not msg or msg == "") then
      line:SetText(" ")
   else
      line:SetText(msg)
   end
   
   line:Show()

   RecipeRadarAvailabilityTooltip.Lines = line_num

end

function RecipeRadar_AvailabilityTooltip_Show(frame)

   if (not frame or RecipeRadarAvailabilityTooltip.Lines == 0) then
      RecipeRadar_AvailabilityTooltip_Hide()
      return
   end

   -- calculate the width of the tooltip
   local height = 20 
   local width = 0
   for i = 1, RecipeRadarAvailabilityTooltip.Lines do
      local line = getglobal("RecipeRadarAvailabilityTooltipText" .. i)
      height = height + line:GetHeight() + 2
      if (line:GetWidth() + 20 > width) then
         width = line:GetWidth() + 20
      end
   end

   RecipeRadarAvailabilityTooltip:SetWidth(width)
   RecipeRadarAvailabilityTooltip:SetHeight(height)
   RecipeRadarAvailabilityTooltip:ClearAllPoints()

   -- place on the left or right according to the position of the main frame
   local frame_left = (frame:GetLeft() or 0) - width
   local frame_right = GetScreenWidth() - (frame:GetRight() or 0) - width

   local offset = 0
   if (RecipeRadar_Options.ActiveTab == 2) then
      offset = RECIPERADAR_VENDOR_OFFSET
   end
   
   if (frame_left < frame_right) then
      if (RecipeRadarListScrollFrame:IsVisible()) then
         RecipeRadarAvailabilityTooltip:SetPoint(
               "TOPLEFT", frame:GetName(), "TOPRIGHT", 35, 0)
      else
         RecipeRadarAvailabilityTooltip:SetPoint(
               "TOPLEFT", frame:GetName(), "TOPRIGHT", 13, 0)
      end
   else
      RecipeRadarAvailabilityTooltip:SetPoint(
            "TOPRIGHT", frame:GetName(), "TOPLEFT", -33 + offset, 0)
   end

   -- basic drawing code
   RecipeRadarAvailabilityTooltip:SetBackdropColor(
         TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,
         TOOLTIP_DEFAULT_BACKGROUND_COLOR.g,
         TOOLTIP_DEFAULT_BACKGROUND_COLOR.b)
   RecipeRadarAvailabilityTooltip:Show()

end

function RecipeRadar_AvailabilityTooltip_Hide()

   for i = 1, RecipeRadarAvailabilityTooltip.Lines do
      getglobal("RecipeRadarAvailabilityTooltipText" .. i):Hide()
   end

   RecipeRadarAvailabilityTooltip.Lines = 0
   --RecipeRadarAvailabilityTooltip:Hide()

end
