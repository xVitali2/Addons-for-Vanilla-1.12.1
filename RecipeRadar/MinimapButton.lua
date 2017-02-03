
-- MinimapButton.lua: code to handle the little Recipe Radar minimap button
-- $Id: MinimapButton.lua 279 2006-04-12 07:55:40Z jnmiller $

function RecipeRadar_MinimapButton_OnClick()

   RecipeRadar_Toggle()

end

function RecipeRadar_MinimapButton_Init()

   if (RecipeRadar_Options.ShowMinimapButton) then
      RecipeRadarMinimapButton:Show()
   else
      RecipeRadarMinimapButton:Hide()
   end
   RecipeRadar_MinimapButton_UpdatePosition()

end

function RecipeRadar_MinimapButton_Toggle()

   if (RecipeRadarMinimapButton:IsVisible()) then
      RecipeRadarMinimapButton:Hide()
      RecipeRadar_Options.ShowMinimapButton = false
   else
      RecipeRadarMinimapButton:Show()
      RecipeRadar_Options.ShowMinimapButton = true
   end

end

-- Turns on the slow highlight/outline flash.
function RecipeRadar_MinimapButton_Flash()

   RECIPERADAR_FLASH_MINIMAP_BUTTON = true
   RecipeRadarMinimapButton:LockHighlight()

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
   
   -- only make the new value visible if the button is also visible
   if (RecipeRadarMinimapButton:IsVisible()) then
   if (sign == 1) then
			RecipeRadarMinimapButton:LockHighlight();
   else
			RecipeRadarMinimapButton:UnlockHighlight();
   end
   end
      

   -- only flash for a few seconds, then shut off
   if (this.total > 4) then
      RecipeRadarMinimapButton:UnlockHighlight()
      RECIPERADAR_FLASH_MINIMAP_BUTTON = false
      this.total = 0
   end

end

-- Sets the location of the button according to the current options.
function RecipeRadar_MinimapButton_UpdatePosition()
	local xmin,ymin,xm,ym = Minimap:GetLeft(), Minimap:GetBottom(), Minimap:GetRight(), Minimap:GetTop();
	local scale = Minimap:GetEffectiveScale();
	local xdelta, ydelta = (xm - xmin)/2*scale, (ym - ymin) /2 * scale;
	local scale2 =  RecipeRadarMinimapButton:GetEffectiveScale();
	local angle = RecipeRadar_Options.MinimapButtonPosition
	local x,y =0,0;
	if (Squeenix or (simpleMinimap_Skins and simpleMinimap_Skins:GetShape() == "square")
		or (pfUI and pfUI_config["disabled"]["minimap"] ~= "1")) then
		x = math.max(-xdelta, math.min((xdelta*1.5) * cos(angle), xdelta))
		y = math.max(-ydelta, math.min((ydelta*1.5) * sin(angle), ydelta))
	else
		x= cos(angle)*xdelta
		y= sin(angle)*ydelta
	end
	
	RecipeRadarMinimapButton:SetPoint("TOPLEFT", "Minimap", "CENTER",	x/scale2 - 17 , y/scale2 + 17)

end
