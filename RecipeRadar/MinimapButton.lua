
-- MinimapButton.lua: code to handle the little Recipe Radar minimap button
-- $Id: MinimapButton.lua 279 2006-04-12 07:55:40Z jnmiller $

function RecipeRadar_MinimapButton_OnClick()

   RecipeRadar_Toggle()

end

function RecipeRadar_MinimapButton_Init()

   if (RecipeRadar_Options.ShowMinimapButton) then
      RecipeRadarMinimapButtonFrame:Show()
   else
      RecipeRadarMinimapButtonFrame:Hide()
   end
   RecipeRadar_MinimapButton_UpdatePosition()

end

function RecipeRadar_MinimapButton_Toggle()

   if (RecipeRadarMinimapButtonFrame:IsVisible()) then
      RecipeRadarMinimapButtonFrame:Hide()
      RecipeRadar_Options.ShowMinimapButton = false
   else
      RecipeRadarMinimapButtonFrame:Show()
      RecipeRadar_Options.ShowMinimapButton = true
   end

end

-- Turns on the slow highlight/outline flash.
function RecipeRadar_MinimapButton_Flash()

   RECIPERADAR_FLASH_MINIMAP_BUTTON = true
   RecipeRadarMinimapButtonHighlightFrame:Show()

end

-- OnUpdate event handler manages the flashing highlight when appropriate.
function RecipeRadar_MinimapButton_OnUpdate(elapsed)

   if (not RECIPERADAR_FLASH_MINIMAP_BUTTON) then
      return
   end

   this.total = this.total + elapsed
   local cntr = this.cntr + elapsed
   local sign = this.sign
   local alpha

   -- alternate coming/going every half-second
   if (cntr > 0.5) then
      sign = -sign
      this.sign = sign
   end
   cntr = mod(cntr, 0.5)
   this.cntr = cntr

   -- change the alpha value to create the flashing
   if (sign == 1) then
      alpha = (25  + (cntr * 400)) / 255
   else
      alpha = (255 - (cntr * 400)) / 255
   end

   -- only make the new value visible if the button is also visible
   if (RecipeRadarMinimapButtonFrame:IsVisible()) then
      RecipeRadarMinimapButtonHighlightFrame:SetAlpha(alpha)
   end

   -- only flash for a few seconds, then shut off
   if (this.total > 4) then
      RecipeRadarMinimapButtonHighlightFrame:Hide()
      RECIPERADAR_FLASH_MINIMAP_BUTTON = false
      this.total = 0
   end

end

-- Sets the location of the button according to the current options.
function RecipeRadar_MinimapButton_UpdatePosition()

   RecipeRadarMinimapButtonFrame:SetPoint("TOPLEFT", "Minimap", "TOPLEFT",
         54 - (78 * cos(RecipeRadar_Options.MinimapButtonPosition)),
         (78 * sin(RecipeRadar_Options.MinimapButtonPosition)) - 55)

end
