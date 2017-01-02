local localization = {
	frFR = {
		"permis",
	},
	deDE = {	-- German translations courtesy of Bartleby @ Curse-Gaming
		"aktiviert",
	},
}
localization = localization[ GetLocale() ] or {
	"enabled",
}
	
PULSE_EX_LABEL = ADDON_DISABLED
PULSE_IN_LABEL =
	unpack( localization )

do	-- LIST POPULATION FUNCTIONS

function CDTScrollBar_Update( size, namespace, dataSource, scrollbar )
	FauxScrollFrame_Update( scrollbar, size, 10, 16 )
	
	local lineplusoffset = FauxScrollFrame_GetOffset( scrollbar ) -- an index into our data calculated from the scroll offset
	for line = 1, 10 do
		lineplusoffset = lineplusoffset + 1
		local field = getglobal( namespace .. line )
		
		if ( lineplusoffset <= size ) then
			field:SetText( dataSource[ lineplusoffset ] )
			field:Show()
			
			if ( scrollbar.selected == lineplusoffset ) then
				field:LockHighlight()
				
			else	field:UnlockHighlight()	end
			
		else	field:Hide()	end
	end
end

function CDTMembersScrollBar_Update()
	local dataSource = cdtmembers[ cdtgroups[ CDTGroupsScrollBar.selected ] ]
	CDTScrollBar_Update(
		( CDTGroupsScrollBar.selected ) and table.getn( dataSource ) or 0,
		"CDTMembersButton",
		dataSource,
		CDTMembersScrollBar
	)
end

function CDTGroupsScrollBar_Update()
	CDTScrollBar_Update(
		table.getn( cdtgroups ),
		"CDTGroupsButton",
		cdtgroups,
		CDTGroupsScrollBar
	)
end

end	-- LIST POPULATION FUNCTIONS


do	-- LIST MANIPULATION

function CDTButton_OnClick()
	if( string.find( this:GetName(), "Groups" ) ) then
		CDTGroupsScrollBar.selected = this:GetID() + FauxScrollFrame_GetOffset( CDTGroupsScrollBar )
		CDTMembersScrollBar.selected = nil
		CDTGroupsScrollBar_Update()
		
	else
		CDTMembersScrollBar.selected = this:GetID() + FauxScrollFrame_GetOffset(CDTMembersScrollBar)
	end
	
	CDTMembersScrollBar_Update()
end

function CDT_AddGroup()
	local group = CooldownTimersGroupsSinglelineEditBox1:GetText()
	
	assert( "CDT_AddGroup", group)
	
	if ( group ) and ( group ~= "" ) and ( not cdtmembers[ group ] ) then
		cdtmembers[ group ] = {}

		CDTGroupsScrollBar_Update()
	end
end

function CDT_DeleteGroup()
	if( CDTGroupsScrollBar.selected ) then
		cdtmembers[ cdtgroups[ CDTGroupsScrollBar.selected ] ] = nil
		table.remove( cdtgroups, CDTGroupsScrollBar.selected )
		CDTGroupsScrollBar.selected = nil
		CDTMembersScrollBar_Update()
		CDTGroupsScrollBar_Update()
	end
end

function CDT_AddMember()
	local member = CooldownTimersGroupsSinglelineEditBox1:GetText()
	
	assert( "CDT_AddMember", member )
	
	if ( CDTGroupsScrollBar.selected ) and ( member ) and ( member ~= "" ) and ( not cdtmembers[member] ) then
		table.insert( cdtmembers[ cdtgroups[ CDTGroupsScrollBar.selected ] ], member )
		CDTMembersScrollBar_Update()
	end
	
	CooldownTimersGroupsSinglelineEditBox1:SetText("")
end

function CDT_DeleteMember()
	if( CDTMembersScrollBar.selected ) then
		table.remove( cdtmembers[cdtgroups[CDTGroupsScrollBar.selected]], CDTMembersScrollBar.selected )
		CDTMembersScrollBar.selected = nil
		CDTMembersScrollBar_Update()
	end
end

end	-- LIST MANIPULATION


do	-- LOAD / SAVE

function CDT_ShowGroups()
	assert( "CDT_ShowGroups", "cdtvars:", cdtvars )
	
	cdtgroups	= { PULSE_EX_LABEL, PULSE_IN_LABEL }
	cdtmembers	= {
		[ PULSE_EX_LABEL ] = {},
		[ PULSE_IN_LABEL ] = {},
	}
	
	for effect, groupName in cdtvars.groups do
		if( not cdtmembers[ groupName ] ) then
			cdtmembers[ groupName ] = {}
			tinsert( cdtgroups, groupName )
		end
		table.insert( cdtmembers[ groupName ], effect )
	end
	
	for pattern, groupName in cdtvars.omnigroup do 
		if( not cdtmembers[ groupName ] ) then
			cdtmembers[ groupName ] = {}
			tinsert( cdtgroups, groupName )
		end
		table.insert( cdtmembers[ groupName ], "%" .. pattern )
	end
	
	for effect, _unused in cdtvars.disabled do 
		table.insert( cdtmembers[ PULSE_EX_LABEL ], effect )
	end
	
	for effect, priority in cdtvars.enabled do 
		if ( type( priority ) == "number" ) then
			cdtmembers[ PULSE_IN_LABEL ][ priority ] = effect
		
		else	table.insert( cdtmembers[ PULSE_IN_LABEL ], effect )	end
	end

	assert( "CDT_ShowGroups", "cdtmembers:", cdtmembers )

	
	CDTMembersScrollBar.selected = nil
	CDTGroupsScrollBar.selected = nil

	CDTMembersScrollBar_Update()
	CDTGroupsScrollBar_Update()
	CooldownTimersGroups:Show()
end

function CDT_SaveGroups()
	cdtvars.groups = {}
	cdtvars.disabled = {}
	cdtvars.enabled = {}
	for groupName, memberList in cdtmembers do
		for priority, effect in memberList do
			if ( groupName == PULSE_IN_LABEL ) then
				cdtvars.enabled[ effect ] = priority
				
			elseif ( groupName == PULSE_EX_LABEL ) then
				cdtvars.disabled[ effect ] = true
				
			elseif ( string.sub( effect, 1, 1 ) == "%" ) then
				cdtvars.omnigroup[ string.sub( effect, 2 ) ] = groupName
				
			else	cdtvars.groups[ effect ] = groupName	end
		end
	end
	
	CooldownTimersGroups:Hide()
end

end	-- LOAD / SAVE
