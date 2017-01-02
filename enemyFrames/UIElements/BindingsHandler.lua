
	local enabled = false
	
	-- Binding Variables
	BINDING_HEADER_EFKHEADER 	= "Enemy Frames Keybinds"
	BINDING_NAME_SETKT 			= "Assign Skull to Target"
	BINDING_NAME_GETKT 			= "Target Skull"
	
	BINDING_NAME_SETSTAR 		= "Assign Star to Target"
	BINDING_NAME_SETMOON		= "Assign Moon to Target"
	BINDING_NAME_SETSQUARE		= "Assign Square to Target"
	BINDING_NAME_SETDIAMOND		= "Assign Diamond to Target"
	BINDING_NAME_SETCROSS		= "Assign Cross to Target"
	BINDING_NAME_SETCIRCLE		= "Assign Circle to Target"
	BINDING_NAME_SETTRIANGLE	= "Assign Triangle to Target"
	
	
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