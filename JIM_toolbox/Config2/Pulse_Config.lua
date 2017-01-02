do	-- GLOBAL STRINGS AND SETTINGS

JIM_DROPDOWN_config[ "Pulse_Flyouts" ] = {
	{	text = ENABLE_SOUND,
		value = Pulse_cooldownSound,
		variable = "Pulse_cooldownSound",
	},	-- "Enable Sound"
	
	{	text = MINIMAP_LABEL .." " .. EMBLEM_SYMBOL,
		value		= Pulse_MinimapButton_show,
		variable	= "Pulse_MinimapButton_show",
		setter 		= ROTATING_MINIMAP_BUTTON_SetShown,
		arg1		= "Pulse_MinimapButton",
	},	-- "Minimap Icon"
	
	{	text		= PULSE_RECENT_ACTION,
		value		= Pulse_history or { n = 3 },
		variable	= "Pulse_history",
	},	-- "Recent Action"
	
	{	disabled = 1 },
	
	{ 	-- text		set below
		value = "Pulse_TimeSetters",
		hasArrow = 1, notCheckable = 1,
	},	-- "Timers"
}
JIM_DROPDOWN_config[ "Pulse_TimeSetters" ] = {
	{ text = "dummy" },
}

local localization = {
	frFR = {
		"Choissis Effets",
		"Temporisateurs",
	},
	deDE = {	-- German translations courtesy of Bartleby @ Curse-Gaming
		"Effekte ausw\195\164hlen",
		"Timer",
	},
}
localization = localization[ GetLocale() ] or {
	"Choose Effects",
	"Timers",
}

PULSE_EFFECTS_LABEL,
JIM_DROPDOWN_config[ "Pulse_Flyouts" ][ 5 ].text
	= unpack( localization )
	
PULSE_ICON	= "Interface\\AddOns\\JIM_CooldownPulse\\CDPIcon128"	-- used in the Minimap button and as the configuration sample

end	-- GLOBAL STRINGS AND SETTINGS


do	-- PULSE IMAGE LAYOUT

--[[ When the pulse image is being resized, there is the telltale difference
	between the location that the mouse clicked to begin the drag,
	and the position it's at now.  A few rudimentary calculations
	and a set to width and height (they're always equal) do the job.
]]
function Pulse_Scale()
	local dX, dY = GetCursorPosition()	-- dX and dY are old math notations that mean "a change in X and Y"
	dX = dX - Pulse_ScalingButton:GetLeft()
	dY = Pulse_ScalingButton:GetTop() - dY
	
	dX = ( ( abs( dX ) < abs( dY ) ) and dX ) or dY	-- Mama always said: choose the lesser of two resizes
	
	if ( Pulse_ScalingButton:GetLeft() + dX < Pulse_MovingButton:GetLeft() - 8 ) then
		dX = Pulse_Image:GetWidth() - dX * 2
		
		Pulse_Image:SetWidth( dX )
		Pulse_Image:SetHeight( dX )
		Pulse_size = dX
	end
end

end	-- PULSE IMAGE LAYOUT


do	-- ADDON MAIN CONFIG

--[[ Used in the labels of sliders that deal with time units.
	"value = 1" becomes "1 second" in an appropriate language.
]]
function Pulse_ValueToDuration(value)	
	return ( ( value or 0 ) > 60 )
			and string.format( string.gsub( GENERIC_MIN_P1, "%%d", "%%%.2g" ), value / 60 )
		or ( value == 60 )
			and string.format( GENERIC_MIN, 1 )
		or ( value == 1 )
			and string.format( GENERIC_SEC, value )
		or ( value )
			and string.format( string.gsub( GENERIC_SEC_P1, "%%d", "%%%.2g" ), value )
end

--[[ Used in the labels of sliders that deal with percent units.
	"value = 1" becomes "100%"
]]
function Pulse_ValueToPercent(value)
	return string.format( "%d%%", value * 100 )
end

--[[ Translates the Low and High values of sliders into something meaningful to players.
]]
function Pulse_Slider_SetExtreme(self, value)
	local slider = getglobal( string.gsub( string.gsub( self:GetName(), "High$", "" ), "Low$", "" ) )
	self:Pulse_Slider_SetExtreme( slider.ValueToText( value ) )
end

--[[ Translates a slider value into a tooltip.
]]
function Pulse_Slider_SetValue(self, value)
	self:Pulse_Slider_SetValue( value )
	setglobal( self.variable, value )

	local slider = ( self:IsFrameType( "Slider" ) ) and self or self:GetParent()
	
	GameTooltip:SetOwner( slider, "ANCHOR_RIGHT" )
	GameTooltip:ClearLines()
	GameTooltip:SetText( slider.ValueToText( value ) )
	GameTooltip:Show()
end

--[[ This is called on the FIRST Pulse_Config OnShow in order to lay out the controls.
	I timed it this way to reduce the load time for a character that uses Cooldown Pulse.
]]	
function Pulse_Config_Setup()
	local function PrepValue(widget, variableName)
		widget:SetValue( getglobal( variableName ) )
		widget.variable = variableName
		HookUIMethod( widget, "SetValue", "Pulse_Slider_SetValue" )
	end
	
	local setup = {
		{ slider = Pulse_CooldownSetter,
			text = "冷却时间范围", graduations = { 0, 1, 2, 3, 4, 5, 6, 8, 10, 12, 15, 30, 45, 60, 90, 120, 180, 300, 600, 1200, 3600 },
			point = "TOP", relativeTo = Pulse_ResetSliders, relativePoint = "BOTTOM", y = -28,
			variable = "Pulse_maxCooldown", subVariable = "Pulse_minCooldown",
		},
		{ slider = Pulse_BeatSetter,
			text = "闪烁时间设定", 
			point = "TOP", relativeTo = Pulse_CooldownSetter, relativePoint = "BOTTOM", y = -28,
			min = 0, max = 3, variable = "Pulse_dubTime", subVariable = "Pulse_lubTime"
		},
		{ slider = Pulse_BetweenSetter,
			text = "闪烁时间间隔", 
			point = "TOP", relativeTo = Pulse_BeatSetter, relativePoint = "BOTTOM", y = -28,
			min = 0, max = 5, variable = "Pulse_minDubTime"
		},
		{ slider = Pulse_AlphaSetter,
			text = "透明度", ValueToText = Pulse_ValueToPercent,
			point = "TOP", relativeTo = Pulse_BetweenSetter, relativePoint = "BOTTOM", y = -28,
			min = 0, max = 1, variable = "Pulse_maxAlpha"
		},
	}
	for _, setting in setup do
		local slider = setting.slider
		local sub = getglobal( slider:GetName() .. "Sub" )
		
		for _, extreme in { "Low", "High" } do
			extreme = getglobal( slider:GetName() .. extreme )
			HookUIMethod( extreme, "SetText", "Pulse_Slider_SetExtreme" )
		end
		slider.ValueToText = setting.ValueToText or Pulse_ValueToDuration
		
		slider:SetWidth( 100 )
		slider:SetPoint( setting.point, setting.relativeTo, setting.relativePoint, setting.x or 0, setting.y or 0 )
		getglobal( slider:GetName() .. "Text" ):SetText( setting.text )
		slider:SetValueStep( 0.05 )
		
		if ( setting.graduations ) then
			SINGLE_SLIDER_SetGraduations( slider, setting.graduations )
		else	slider:SetMinMaxValues( setting.min, setting.max )	end

		PrepValue( slider, setting.variable )
		
		if ( sub ) then
			PrepValue( sub, setting.subVariable )
			HookUIMethod( slider, "SetValue", "DOUBLE_SLIDER_Limiter" )
			HookUIMethod( sub, "SetValue", "DOUBLE_SLIDER_Limiter" )
		end
	end

	Pulse_Config:SetPoint( "TOP", Pulse_Image, "BOTTOM" )
	
	Pulse_BoundingBox:SetPoint( "TOPLEFT", Pulse_Image, "TOPLEFT", -4, 4 )
	Pulse_BoundingBox:SetPoint( "BOTTOMRIGHT", Pulse_Image, "BOTTOMRIGHT", 4, -4 )
	Pulse_BoundingBox:SetAlpha( 0.2 )

	Pulse_ScalingButton:SetPoint( "CENTER", Pulse_Image, "TOPLEFT" )
	Pulse_ScalingButton:RegisterForDrag( "LeftButton" )
	
	Pulse_Effects:SetWidth( Pulse_EffectsText:GetWidth() + 16 )
	Pulse_Effects:SetHeight( Pulse_EffectsText:GetHeight() + 12 )
	
	UIDropDownMenu_Initialize( Pulse_Flyouts, JIM_DROPDOWN_Populate, "MENU" )
	UIDropDownMenu_SetText( OPTIONS_MENU, Pulse_Flyouts )
	UIDropDownMenu_SetWidth( Pulse_FlyoutsText:GetWidth() + 30, Pulse_Flyouts )
	Pulse_FlyoutsButtonNormalTexture:SetTexture( "Interface\\ChatFrame\\ChatFrameExpandArrow" )
	Pulse_FlyoutsButtonNormalTexture:ClearAllPoints()
	Pulse_FlyoutsButtonNormalTexture:SetPoint( "LEFT", Pulse_FlyoutsText, "RIGHT", 4, 0 )
	Pulse_FlyoutsButton:SetScript( "OnEnter", Pulse_FlyoutsButton:GetScript( "OnClick" ) )
	
	Pulse_ResetSliders:SetWidth( Pulse_ResetSlidersText:GetWidth() + 16 )
	Pulse_ResetSliders:SetHeight( Pulse_ResetSlidersText:GetHeight() + 12 )
	Pulse_TimeSetters:SetHeight( 235 )
	Pulse_TimeSetters:SetWidth( 180 )
	
	Pulse_Config_Setup = nil
end

end	-- ADDON MAIN CONFIG
