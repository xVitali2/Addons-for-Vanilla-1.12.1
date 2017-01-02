--[[ Code for this widget was inspired, and largely stolen, from ItemRack by Gello.
	Current implementation by JIM the Inventor.
	
	Feel free to use the widget's LUA and XML files in your own projects.
	
	Setup instructions:
	
	1) In your XML, declare a ROTATING_MINIMAP_BUTTON like so -
		
		<Button name="$yourButtonName" inherits="ROTATING_MINIMAP_BUTTON">
			<Scripts>
				<OnLoad>
					$yourButtonName_Icon:SetTexture( textureFile )
				</OnLoad>
				
				<OnClick>
					-- configuration window handler
				</OnClick>
			</Scripts>
		</Button>
		
		Replace $yourButtonName with ... your button name.
		I didn't have to tell you that, did I?
		
		textureFile is your choice of minimap button image.
		See other people's minimap buttons for examples.

	2) In your TOC, add an angle variable to your SavedVariables, like so -
	
		## SavedVariables: $yourButtonName_angle
		
	3) That's it.  There is no Step 3.  Easy, huh?
	
		In actual fact, you don't even need to do step 2
		if you don't mind having your button bounce back
		to the northwest position all the time.
		
		But if that's the case,
		why are you letting the player rotate buttons?
		Silly AddOn author.
]]
--[[ Set a rotating minimap button's location based on its angle from the minimap center.
]]
function ROTATING_MINIMAP_BUTTON_Move()
	--[[ Sometimes, an AddOn designer may want to use one minimap this for multiple AddOns.
		If they do, this is the first location where some indication of that occurs (a name becomes nil).
		
		In that case, the goal is to hide the duplicate this so that it can't get in the way.
	]]
	local thisName = this:GetName()
	if ( not thisName ) then
		this:Hide()
		return
	end
	
	local angle = getglobal( thisName .. "_angle" )
	local radius = this:GetWidth() / 2 + 63
	
	this:SetPoint(
		"CENTER", "Minimap", "CENTER",
		0.0 - ( radius * cos( angle or 90 ) ),
		( radius * sin( angle or 90 ) ) - 1.0
	)
	
	return angle
end

--[[ Movement of rotating minimap buttons is accomplished through detection of the mouse pointer's angle
	from the minimap's center.  This function is called OnUpdate.
]]
function ROTATING_MINIMAP_BUTTON_FindAngle()
	local xpos,ypos = GetCursorPosition()
	local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom()

	xpos = xmin-xpos/UIParent:GetScale()+70.5
	ypos = ypos/UIParent:GetScale()-ymin-70.5

	local angle = math.deg( math.atan2( ypos,xpos ) )
	setglobal( this:GetName() .. "_angle", angle )
	ROTATING_MINIMAP_BUTTON_Move()
	return angle
end

--[[ Set the shown state of a frame (whether the user can see it if it's in bounds).
	on = nil: toggle the shown state
	on = false: hide the frame
	on = <other>: show the frame
	
	This function can be used on more than rotators, but I didn't have a place to put it ...
]]
function ROTATING_MINIMAP_BUTTON_SetShown(button, on)
	if ( button ) then
		if ( type( button ) == "string" ) then	button = getglobal( button )	end
		
		if ( on == false ) or button:IsShown() then
			button:Hide()
			
		else	button:Show()	end
	end
end

--[[ Set-up function for all rotating minimap buttons.
	It's designed to work with objects that load on player logon
	(the usual case), or after a call to LoadAddOn (load on demand).
]]
function ROTATING_MINIMAP_BUTTON_OnLoad()
	this:SetScript( "OnUpdate", nil )
	
	if ( this.backupOnEvent ) then
		this:SetScript( "OnEvent", this.backupOnEvent )
		if ( event ) then	this.backupOnEvent()	end
		this.backupOnEvent = nil
		
	elseif ( not ROTATING_MINIMAP_BUTTON_Move() ) then
		this.backupOnEvent = this:GetScript( "OnEvent" )
		this:SetScript( "OnEvent", ROTATING_MINIMAP_BUTTON_OnLoad )
		this:RegisterEvent( "VARIABLES_LOADED" )	
	end
	
	this:RegisterForClicks( "LeftButtonUp" )
	this:RegisterForDrag( "LeftButton" )
end

--[[ While the player is dragging the button around the rim of the minimap,
	we "turn on" an OnUpdate handler to figure out where the mouse pointer leads.
]]
function ROTATING_MINIMAP_BUTTON_OnDragStart()
	assert( "ROTATING_MINIMAP_BUTTON_OnDragStart" )
	
	this:LockHighlight()
	this:SetScript( "OnUpdate", ROTATING_MINIMAP_BUTTON_FindAngle )
end

--[[ A release of a mouse button is a good signal
	to stop moving the rotating minimap button.
]]
function ROTATING_MINIMAP_BUTTON_OnDragStop()
	assert( "ROTATING_MINIMAP_BUTTON_OnDragStop:", ROTATING_MINIMAP_BUTTON_FindAngle() )
	
	this:SetScript( "OnUpdate", nil )
	this:UnlockHighlight()
end
