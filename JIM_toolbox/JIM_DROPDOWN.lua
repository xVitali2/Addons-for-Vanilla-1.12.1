--[[ Hopefully JIM patrons can permit me yet another opinion:
	"Blizzard's implementation of a dropdown list is a little too clever for its own good."
	
	Normally, AddOn authors would define an OnClick and Initialize function
	for each dropdown list that they would like to use:

	The Initialize functions are forced to <individually> add all of the choices
	that each dropdown contains, specifying text, identifiers, and behavior for each.
	
	Not only does this result in a lot of repeat code (which I abhor with a passion)
	but it tends to spread out label text over several functions.
	This is not a good idea for easy localization!!
		
	This JIM_DROPDOWN pseudo-template seeks to remove those shortcomings in design
	by providing one simple Init function that can be used for all dropdowns.
	
	Its only expectation is that you, the AddOn author, provide all of the usual
	configuration options - somewhere in your code - in this format:
	
	JIM_DROPDOWN_config[ dropdownName ] = {
		{ text = "TEXT1", value = VALUE1 },	-- These tables are typical of the "info" tables native to Blizzard's dropdown code.
		{ text = "TEXT2", value = VALUE2 },
		-- etc ..

		variable	= "configVariableName",		-- this is a string that setglobal can use to save your configuration data
		setter		= "functionVariableName",	-- this is a function name-as-string that makes any changes that do not set the configVariable
		-- If variable and setter are placed in the option subtables, they will only apply to those options.
	}
]]
if ( not JIM_DROPDOWN_config ) then	-- no other AddOns have included this utility yet


JIM_DROPDOWN_config = {}	-- Add your dropdown definitions to this table, as described above.

DROPDOWN_DISABLED = { frFR = "inactif",	deDE = "unaktiviert" }
DROPDOWN_DISABLED = DROPDOWN_DISABLED[ GetLocale() ] or "disabled"


do	--[[ SUBPANEL DEFINITIONS
	The subpanel concept allows you to assign your own frame
	as a replacement for one of the DropDown levels.
	
	To do this, simply make one of the "value" proprties
	in JIM_DROPDOWN_config equal to your frame object.
	
	Note well: Designation of a subpanel will require
	the use of the OnShow and OnUpdate events of that frame.
	Please do not put anything important in those events,
	as they will be overwritten by the functions below.
]]
function JIM_DROPDOWN_SubPanel_OnShow()
	this.showTime = nil
	if ( this:GetID() > 1 ) then
		this.parent = getglobal( "DropDownList" .. ( this:GetID() - 1 ) )
	end
end

function JIM_DROPDOWN_SubPanel_OnUpdate()
	if MouseIsOver( this ) then
		if ( not this.entered ) then
			UIDropDownMenu_StopCounting( this )
			this.entered = true
		end
		
	elseif ( this.entered ) then
		UIDropDownMenu_StartCounting( this )
		this.entered = nil
	end
	
	UIDropDownMenu_OnUpdate( arg1 )
end

end	-- SUBPANEL DEFINITIONS


do	-- WORKHORSE FUNCTIONS OF THIS UTILITY

--[[ When a dropdown list item is clicked, this will adjust a related configuration variable,
	and then run an additional function, if one is specified.
]]
function JIM_DROPDOWN_OnClick(arg1, arg2)
	local dropdown	= getglobal( UIDROPDOWNMENU_OPEN_MENU )
	local level		= this:GetParent():GetID()
	local value		= this.value
	local config	= JIM_DROPDOWN_config[
		( level == 1 ) and UIDROPDOWNMENU_OPEN_MENU
	or	UIDROPDOWNMENU_MENU_VALUE
	]

	assert( "JIM_DROPDOWN_OnClick", "level:", level, "VALUE:", UIDROPDOWNMENU_MENU_VALUE, "MENU:", UIDROPDOWNMENU_OPEN_MENU )

	
	if ( config.variable ) then	-- Menu options are singular: the choice of one "sets the value" of the container
		UIDropDownMenu_SetSelectedValue( dropdown, value )
		setglobal( config.variable, value )
		
	else	-- Menu options are toggles: choosing one sets a variable to either a value or nil
		config = config[ this:GetID() ]
		
		if ( config ) then
			local variable = config.variable
			if ( variable ) then
				value = ( not getglobal( variable ) ) and ( this.value or true )
				assert( "JIM_DROPDOWN_OnClick", "variable:", variable, "=", value )
				setglobal( variable, value )
			end
			
		else	return	end
	end
	
	if ( config.setter ) then
		assert( "JIM_DROPDOWN_OnClick", config.setter, arg1, arg2 )
		
		local setterFunction = ( type( config.setter ) == "function" ) and config.setter or getglobal( config.setter )
		setterFunction( arg1 or value, arg1 and arg2 or value, value )
	end
end

--[[ This function is the equivalent of dropdownName .. "_Initialize".
	It makes sure the dropdown list is stocked with choices
	just prior to the list's revelation to the end-user.
]]
function JIM_DROPDOWN_Populate(level)
	assert( "JIM_DROPDOWN_Populate", "level:", level, "VALUE:", UIDROPDOWNMENU_MENU_VALUE )

	local config = getglobal( UIDROPDOWNMENU_MENU_VALUE )
	if ( type( config ) == "table" ) and ( config.IsFrameType ) then
		assert( "JIM_DROPDOWN_Populate", "is substituting a developer frame." )
		
		local dropdown = getglobal( "DropDownList" .. ( level or 1 ) )

		dropdown.replacement = config
		
		dropdown.ClearAllPoints = function(self)
			self.replacement:ClearAllPoints()
		end
		
		dropdown.SetPoint = function(self, ...)
			self.replacement:SetPoint( unpack(arg) )
			self.replacement.SetPoint( self, unpack(arg) )
		end
		
		dropdown.Show = function(self)	self.replacement:Show() end
		
		dropdown.Hide = function(self)
			self.replacement:Hide()
			DropDownList2.ClearAllPoints,
			DropDownList2.Hide,
			DropDownList2.SetPoint,
			DropDownList2.Show =
				nil, nil, nil, nil
		end
		
		config:ClearAllPoints()
		dropdown:SetWidth( config:GetWidth() )
		dropdown:SetHeight( config:GetHeight() )
		
		UIDropDownMenu_AddButton( { disabled = 1 }, level )
		
		config:SetScript( "OnShow", JIM_DROPDOWN_SubPanel_OnShow )
		config:SetScript( "OnUpdate", JIM_DROPDOWN_SubPanel_OnUpdate )
		
		return
	end
	
	config = JIM_DROPDOWN_config[
		( ( level or 1 ) == 1 ) and getglobal( UIDROPDOWNMENU_OPEN_MENU or UIDROPDOWNMENU_INIT_MENU ):GetName()
	or	UIDROPDOWNMENU_MENU_VALUE
	]
	
	if ( config ) then
		for index = 1, table.getn( config ) do
			local choice = config[ index ]
			
			if ( choice.func ) and ( choice.func ~= JIM_DROPDOWN_OnClick ) then	choice.setter = choice.func	end
			if ( not choice.notCheckable ) then	choice.func		= JIM_DROPDOWN_OnClick	end
			
			choice.checked	= ( getglobal( choice.variable ) and 1 )
			choice.keepShownOnClick = ( choice.variable ) and 1
			UIDropDownMenu_AddButton( choice, level )
		end
	end
end

--[[ Prepare a frame of type UIDropDownMenu for its entire use:
	dropdown	= direct variable pointer to the dropdown
	enabled		= non-nil or true: make a standard dropdown / nil or false: include no config options, set text to disabled
	width		= (optional) the intended width of the entire dropdown frame
]]
function JIM_DROPDOWN_Init(dropdown, enabled, width, asMenu)
	local name = dropdown:GetName()
	
	assert( "JIM_DROPDOWN_Init", name, enabled, width )

	if ( enabled ) then		
		local temp
		this, temp = getglobal( name .. "Button" ), this
		UIDropDownMenu_Initialize( dropdown, JIM_DROPDOWN_Populate, asMenu )
		this = temp
		
		local variable = JIM_DROPDOWN_config[ name ].variable
		if ( variable ) then	UIDropDownMenu_SetSelectedValue( dropdown, getglobal( variable ) )	end
		
	else
		-- A disabled dropdown just discards the JIM_DROPDOWN_config info you defined.  May change in future updates.
		UIDropDownMenu_SetText( DROPDOWN_DISABLED, dropdown )
		getglobal( name .. "Button" ):Hide()
		JIM_DROPDOWN_config[ name ] = nil
	end

	if ( width ) then
		getglobal(dropdown:GetName().."Middle"):SetWidth(width)
		dropdown:SetWidth( width + 35 )
	end
end

end	-- WORKHORSE FUNCTIONS OF THIS UTILITY


end	-- check for predefinition of JIM_DROPDOWN
