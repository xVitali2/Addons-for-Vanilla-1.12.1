
	local enabled = false
	
	-- Binding Variables
	BINDING_HEADER_EFKHEADER 	= EF_L_ENEMYFRAMESKEYBINDS
	BINDING_NAME_SETKT 			= EF_L_ASSIGNSKULLTOTARGET
	BINDING_NAME_GETKT 			= EF_L_TARGETSKULL
	
	BINDING_NAME_SETSTAR 		= EF_L_ASSIGNSTARTOTARGET
	BINDING_NAME_SETMOON		= EF_L_ASSIGNMOONTOTARGET
	BINDING_NAME_SETSQUARE		= EF_L_ASSIGNSQUARETOTARGET
	BINDING_NAME_SETDIAMOND		= EF_L_ASSIGNDIAMONDTOTARGET
	BINDING_NAME_SETCROSS		= EF_L_ASSIGNCROSSTOTARGET
	BINDING_NAME_SETCIRCLE		= EF_L_ASSIGNCIRCLETOTARGET
	BINDING_NAME_SETTRIANGLE	= EF_L_ASSIGNTRIANGLETOTARGET
	
	
	function getKTbind()
		if enabled then
			TargetByName(ENEMYFRAMECOREGetRaidTargetbyIcon('skull'), true)
		end
	end
		
	function setIconBind(icon)
		if enabled then
			local tar = MOUSEOVERUNINAME and MOUSEOVERUNINAME or  UnitExists'target' and UnitName'target' or nil
			if tar then
				ENEMYFRAMECORESendRaidTarget(icon, tar)
			end
		end
	end
	
	function bindingsInit()
		enabled = true
	end
	
	local function eventHandler()
		enabled = false
	end
		
	local f = CreateFrame'Frame'
	f:RegisterEvent'PLAYER_ENTERING_WORLD'
	f:RegisterEvent'ZONE_CHANGED_NEW_AREA'
	f:SetScript('OnEvent', eventHandler)