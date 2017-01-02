function JIM_AnnounceAddOn(name)
	local name, title = GetAddOnInfo( name )
	
	local localization = {
		["frFR"]	= "%s est install\195\169!",
		["deDE"]	= "%s wird angebracht!",
	}

	assert( string.format( localization[ GetLocale() ] or "%s is loaded!", title ) )
end