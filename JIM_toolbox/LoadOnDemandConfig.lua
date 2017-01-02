--[[ This method will open a configuration window that may not have been loaded yet,
	or close the window if it is already showing.
	
	The hope is to decrease overall AddOn loading time by 'out-sourcing' all the UI
	that is only used occasionally to change settings.
	
	Until a player calls on configuration, all the windows will be disabled,
	and not constructed.  Then, this function determines that something is missing,
	enables the configuration AddOn, and pulls out the config window of interest.
	
	The concept is scalable.  That is: its developer, JIM the Inventor, has invited
	people to claim space in the design.  Here's what to do, if you're interested.
	
	1) Contact JIM the Inventor at http://www.wowinterface.com/forums/private.php?do=newpm&userid=18482
		You may have to register first.  Ask for a number.
	
	2) When he sends you back a number, create your configuration window as normal,
		but DO NOT RELY ON SPECIFIC EVENTS to set up the window.  That means, yes,
		do something OnEvent "VARIABLES_LOADED", but also OnLoad or OnUpdate or OnShow.
	
	3) Save this configuration window as ConfigN.xml where N is the number JIM gave you.
		Example: if JIM gives you the number 5, you will be saving the file as Config5.xml.
		The placement of that file then goes something like this:
		
		Interface
			AddOns
				JIM_toolbox
					Config5
						Config5.xml
						(any support files you need; include these in the XML)
		
	4) Then, in your usual AddOn listing, when it's time to open the config window,
		run LoadOnDemand( {the name of your configuration window in ConfigN.xml } ).
		
		This function is ready to guess the name of that window if it has to.
		It does so when you call it from a piece of UI, like a button.
		It will then take the name of that UI up to the first underscore,
		and then append "Config" to it.
		Example:
		
		<Button name="MyAddOn_Button">
			<Scripts>
				<OnClick>
					LoadOnDemandConfig()	-- note: will open MyAddOn_Config
				</OnClick>
			</Scripts>
		</Button>
	
	5) If this fails, please ask for help. :-)
	
	6) Finally - the most important step - check back frequently with JIM for Updates
		to JIM_toolbox.toc.  If you fall behind, installation of your AddOn may
		cause OTHER AddOns in the co-operative to stop working.  You can lower
		maintenance by declaring "JIM_toolbox" as an "OptionalDep", and by directing
		people to download "JIM's Various Options" (the AddOn you found this with).
]]
function LoadOnDemandConfig(configWindow)
	if ( type( configWindow ) ~= "table" ) then
		local name = "JIM_toolbox"
		
		if ( not IsAddOnLoaded( name ) ) then
			EnableAddOn( name )
			local _, failed = LoadAddOn( name )
			DisableAddOn( name )
			
			if ( failed ) then	error( "Could not open the configuration window.  Reason: " .. failed )	end
		end
		
		name = ( this ) and ( this:GetName() ) or ""
		name = ( type( configWindow ) == "string" ) and configWindow
		or string.sub(
			name, 1,
			strfind( name, "_" ) or -1
		) .. "Config"
		
		assert( "LoadOnDemandConfig", name )
		
		configWindow = getglobal( name )
		
		if ( not configWindow ) then	error( "Could not open the configuration window.  Reason: " .. "Unknown name, " .. name .. "." )	end
	end
		
	if ( configWindow:IsShown() ) then
		configWindow:Hide()
		
	else	configWindow:Show()	end
end
