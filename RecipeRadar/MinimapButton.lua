local function print(text)
	DEFAULT_CHAT_FRAME:AddMessage(text)
end

--[[ Timers ]]

function RecipeRadar.CreateTimer(name,func,delay,rep)
	RecipeRadar.TimerPool[name] = { func=func,delay=delay,rep=rep,elapsed=delay }
end

function RecipeRadar.IsTimerActive(name)
	for i,j in ipairs(RecipeRadar.Timers) do
		if j==name then
			return i
		end
	end
	return nil
end

function RecipeRadar.StartTimer(name,delay)
	RecipeRadar.TimerPool[name].elapsed = delay or RecipeRadar.TimerPool[name].delay
	if not RecipeRadar.IsTimerActive(name) then
		table.insert(RecipeRadar.Timers,name)
		RecipeRadar_TimersFrame:Show()
	end
end

function RecipeRadar.StopTimer(name)
	local idx = RecipeRadar.IsTimerActive(name)
	if idx then
		table.remove(RecipeRadar.Timers,idx)
		if table.getn(RecipeRadar.Timers)<1 then
			RecipeRadar_TimersFrame:Hide()
		end
	end
end

function RecipeRadar.TimersFrame_OnUpdate()
	local timerPool
	for _,name in ipairs(RecipeRadar.Timers) do
		timerPool = RecipeRadar.TimerPool[name]
		timerPool.elapsed = timerPool.elapsed - arg1
		if timerPool.elapsed < 0 then
			timerPool.func()
			if timerPool.rep then
				timerPool.elapsed = timerPool.delay
			else
				RecipeRadar.StopTimer(name)
			end
		end
	end
end

function RecipeRadar_MinimapButton_OnClick()
   RecipeRadar_Toggle()
end

function RecipeRadar_MinimapButton_Init()
	RecipeRadar.CreateTimer("DragMinimapButton",RecipeRadar.DragMinimapButton,0,1)
	RecipeRadar.MoveMinimapButton()
   if (RecipeRadar_Options.ShowMinimapButton) then
      RecipeRadarMinimapButton:Show()
   else
      RecipeRadarMinimapButton:Hide()
   end
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
function RecipeRadar.MoveMinimapButton()
	local xpos,ypos
	local pos = RecipeRadar_Options.MinimapButtonPosition;
	if (Squeenix or (simpleMinimap_Skins and simpleMinimap_Skins:GetShape() == "square")
		or (pfUI and pfUI.minimap)) then
		xpos = 110 * cos(pos or 0)
		ypos = 110 * sin(pos or 0)
		xpos = math.max(-82,math.min(xpos,84))
		ypos = math.max(-86,math.min(ypos,82))
	else
		xpos = 80*cos(pos or 0)
		ypos = 80*sin(pos or 0)
	end
	RecipeRadarMinimapButton:SetPoint("TOPLEFT","Minimap","TOPLEFT",52-xpos,ypos-52)
end
function RecipeRadar.DragMinimapButton()
	local xpos,ypos = GetCursorPosition()
	local xmin,ymin = Minimap:GetLeft() or 400, Minimap:GetBottom() or 400
	local scale = Minimap:GetEffectiveScale();
	xpos = xmin-xpos/scale+70
	ypos = ypos/scale-ymin-70
	RecipeRadar_Options.MinimapButtonPosition = math.deg(math.atan2(ypos,xpos));
	RecipeRadar.MoveMinimapButton()
end