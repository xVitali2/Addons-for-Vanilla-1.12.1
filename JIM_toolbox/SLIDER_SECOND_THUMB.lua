function SLIDER_SECOND_THUMB_OnLoad()
	this.SetValue = SLIDER_SECOND_THUMB_SetValue
	this.GetValue = SLIDER_SECOND_THUMB_GetValue
	
	local slider = this:GetParent()
	
	local index = 1
	while ( slider[ "thumb" .. index ] ) do	index = index + 1	end
	slider[ "thumb" .. index ] = this
	
	if ( not slider.SLIDER_SECOND_THUMB_SetMinMaxValues ) then
		slider.SetMinMaxValues, slider.SLIDER_SECOND_THUMB_SetMinMaxValues = SLIDER_SECOND_THUMB_SetMinMaxValues, slider.SetMinMaxValues
	end
	
	this:RegisterForDrag( "LeftButton" )
	this:RegisterForClicks( "LeftButtonUp" )
end

function SLIDER_SECOND_THUMB_SetValue(self, value)
	if ( value ) then
		local slider	= self:GetParent()
		local min, max	= slider:GetMinMaxValues()
		
		if ( value >= min ) and ( value <= max ) then
			self:SetPoint( "CENTER", slider, "LEFT", ( slider:GetWidth() - 32 ) * ( value - min ) / ( max - min ) + 16, 0 )
		else
			self:ClearAllPoints()
		end
		
		self.value = value
	else
		self:ClearAllPoints()
	end
end

function SLIDER_SECOND_THUMB_GetValue(self)
	return self.value
end

function SLIDER_SECOND_THUMB_SetMinMaxValues(self, min, max)
	self.SLIDER_SECOND_THUMB_SetMinMaxValues( self, min, max )
	
	local index, thumb = 1, self.thumb1
	while ( thumb ) do
		thumb:SetValue( thumb.value )
		index = index + 1
		thumb = self[ "thumb" .. index ]
	end
end

function SLIDER_SECOND_THUMB_Drag(self)
	local mX, mY = GetCursorPosition()
	local slider = self:GetParent()
	local min, max = slider:GetMinMaxValues()
	
	local value = ( mX / UIParent:GetScale() - slider:GetLeft() - 16 ) * ( max - min ) / ( slider:GetWidth() - 32 )
	self.value, value = ( ( value < min ) and min ) or ( ( value > max ) and max ) or value, self.value
	
	if ( value ~= self.value ) then	self:SetValue( self:GetValue() )	end
end

function SINGLE_SLIDER_OnLoad()
	this.SetMinMaxValues, this.DOUBLE_SLIDER_SetMinMaxValues = DOUBLE_SLIDER_SetMinMaxValues, this.SetMinMaxValues
end

function SINGLE_SLIDER_OnValueChanged()
	if ( not this.repairPoorUI ) then
		this.repairPoorUI = true
		this:SetValue( this:GetValue() )
		return true
	else	this.repairPoorUI = nil	end
end

function SINGLE_SLIDER_SetGraduatedValue(self, value)
	if ( value ) then
		local grads = self.graduations or self:GetParent().graduations
		
		local exactIndex, nearIndex = SearchAscendingList(
			value,
			function(index)	return grads[index]	end,
			table.getn( grads )
		)
		
		if ( not exactIndex ) then
			local approximation = grads[nearIndex]
			local outlier = ( ( value > approximation ) and ( grads[nearIndex + 1] ) ) or grads[nearIndex - 1]
			
			exactIndex = nearIndex + ( value - approximation ) / ( approximation - outlier )
		end
		
		self:SINGLE_SLIDER_SetGraduatedValue( exactIndex )
	else	self:SINGLE_SLIDER_SetGraduatedValue( nil )	end
end

function SINGLE_SLIDER_SetGraduatedLabel(self, fractionalIndex)
	self:SINGLE_SLIDER_SetGraduatedLabel( FractionalIndexToValue( fractionalIndex, getglobal( string.gsub( string.gsub( self:GetName(), "High$", "" ), "Low$", "" ) ).graduations ) )
end

function SINGLE_SLIDER_GetGraduatedValue(self)
	return FractionalIndexToValue( self:SINGLE_SLIDER_GetGraduatedValue(), self.graduations or self:GetParent().graduations )
end

function FractionalIndexToValue(exactIndex, grads)
	if ( ( exactIndex or 0 ) == 0 ) then	return nil	end

	local nearIndex = math.floor( exactIndex )
	local nearValue = grads[ nearIndex ]
	
	return nearValue + ( exactIndex - nearIndex ) * ( ( grads[ nearIndex + 1 ] or 0 ) - nearValue )	
end

function SINGLE_SLIDER_SetGraduations(slider, gradTable)
	if ( not slider.SINGLE_SLIDER_SetGraduatedValue ) then
		local index, thumb = 0, slider
		repeat
			HookUIMethod( thumb, ( thumb.DOUBLE_SLIDER_Limiter ) and "DOUBLE_SLIDER_Limiter" or "SetValue", "SINGLE_SLIDER_SetGraduatedValue" )
			HookUIMethod( thumb, "GetValue", "SINGLE_SLIDER_GetGraduatedValue" )
			
			index = index + 1
			thumb = slider[ "thumb" .. index ]
		until ( not thumb )

		for _, extreme in { "Low", "High" } do
			HookUIMethod( getglobal( slider:GetName() .. extreme ), "SetText", "SINGLE_SLIDER_SetGraduatedLabel" )
		end
	end
	
	slider.graduations = gradTable
	slider:SetMinMaxValues( 1, table.getn( gradTable ) )
end

function DOUBLE_SLIDER_Limiter(self, value)
	assert( "DOUBLE_SLIDER_Limiter:" .. self:GetName() )
	
	local limit = ( self.thumb1 )
		and ( self.thumb1:GetValue() or value )
		or self:GetParent():GetValue()
	
	if ( value ) and ( limit ) then
		value = ( self.thumb1 ) and ( value < limit ) and limit	-- higher value attempting to pass lower
			or ( not self.thumb1 ) and ( value > limit ) and limit		-- lower value attempting to pass higher
			or value	-- no one is trying to pass anybody
	end
	
	self.DOUBLE_SLIDER_Limiter( self, value )
end

function DOUBLE_SLIDER_SetMinMaxValues(self, min, max)
	self.DOUBLE_SLIDER_SetMinMaxValues( self, min, max )
	min, max = self:GetMinMaxValues()

	local namespace = self:GetName()

	local low = getglobal( namespace .. "Low" )
	low:SetText( min )
	low:SetPoint( "TOPLEFT", self, "BOTTOMLEFT", 16 - low:GetWidth() / 2, 3 )

	local high = getglobal( namespace .. "High" )
	high:SetText( max )
	high:SetPoint( "TOPRIGHT", self, "BOTTOMRIGHT", high:GetWidth() / 2 - 16, 3 )

	assert( namespace .. ":DOUBLE_SLIDER_SetMinMaxValues" )	
end
	
function DOUBLE_SLIDER_OnLoad()
	SINGLE_SLIDER_OnLoad()
	
	local subThumb = getglobal( this:GetName() .. "SubThumb" )
	subThumb:SetWidth( 28 )
	subThumb:SetHeight( 28 )
end
