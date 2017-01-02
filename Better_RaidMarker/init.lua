-- Define the bindings header
BINDING_HEADER_BETTER_RAIDMARKER = 'Better_RaidMarker'

ButtonIsDown = false

function Better_RaidMarker_HotkeyPressed(state)
	ButtonIsDown = (state == 'down') and RaidMarker_CanMark()
	
	if(ButtonIsDown and Better_RaidMarkerFrame) then
		RaidMarker_ToggleIcons(true)
	elseif(Better_RaidMarkerFrame) then
		RaidMarker_ToggleIcons(false)
	end
end

function RaidMarker_ToggleIcons(toggle)
	if(toggle == true) then
		if(not UnitExists('target') or UnitIsDead('target')) then return end
		local x, y = GetCursorPosition()
		local scale = UIParent:GetEffectiveScale()
		local frame = Better_RaidMarkerFrame
		
		frame:SetPoint('CENTER', UIParent, 'BOTTOMLEFT', x / scale, y / scale)
		frame:Show()
	end
	
	if(toggle == false) then
		Better_RaidMarkerFrame:Hide()
	end
end

function RaidMarker_CanMark()
	if(not Better_RaidMarkerFrame) then return false end
	
	if(GetNumRaidMembers() > 0) then
		if(UnitIsGroupLeader('player') or UnitIsGroupAssistant('player')) then
			return true
		elseif IsInGroup() and not IsInRaid() then
			return true
		else
			UIErrorsFrame:AddMessage('You don\'t have premission to mark targets.', 1.0, 0.1, 0.1, 1.0, UIERRORS_HOLD_TIME)
			
			return false
		end
	else
		return true
	end
end



function RaidMarker_OnEvent(event)
	if(ButtonIsDown and Better_RaidMarkerFrame) then
		RaidMarker_ToggleIcons(true)
	end
end

function Button_OnEnter(button)
	button.Texture:ClearAllPoints()
	button.Texture:SetPoint('TOPLEFT', -10, 10)
	button.Texture:SetPoint('BOTTOMRIGHT', 10, -10)
end
function Button_OnLeave(button)
	button.Texture:SetAllPoints()
end
function Button_OnClick(button, arg1)
	local target = GetRaidTargetIndex('target')
	local icon = button:GetID()
	
	if(target == icon) then
		SetRaidTarget('target', 0)
	else
		SetRaidTarget('target', (arg1 ~= 'RightButton') and button:GetID() or 0)
	end
	PlaySound('UChatScrollButton')
	button:GetParent():Hide()
end



do
	local frame = CreateFrame('Frame', nil, UIParent)
	frame:EnableMouse(true)
	frame:SetWidth(100)
	frame:SetHeight(100)
	frame:SetFrameStrata('DIALOG')
	
	--frame:SetPoint('CENTER', UIParent, 'CENTER')
	
	for i = 1, 8 do
		local button = CreateFrame('Button', 'Better_RaidMarkerFrame_Button_'..i, frame)
		
		button:SetWidth(40)
		button:SetHeight(40)
		button:SetID(i)
		
		button.Texture = button:CreateTexture(button:GetName()..'_NormalTexture', 'ARTWORK')
		button.Texture:SetTexture([[Interface\TargetingFrame\UI-RaidTargetingIcons]])
		button.Texture:SetAllPoints()
		
		SetRaidTargetIconTexture(button.Texture, i)
		
		button:RegisterForClicks('LeftButtonUp', 'RightButtonUp')
		button:SetScript('OnEnter', function() Button_OnEnter(this) end)
		button:SetScript('OnLeave', function() Button_OnLeave(this) end)
		button:SetScript('OnClick', function() Button_OnClick(this) end)
		
		if(i == 8) then
			button:SetPoint('CENTER', 0, 0)
		else
			local angle = 360 / 7 * i
			
			button:SetPoint('CENTER', sin(angle) * 60, cos(angle) * 60)
		end
	end
	
	frame:RegisterEvent('PLAYER_TARGET_CHANGED')
	frame:SetScript('OnEvent', function() RaidMarker_OnEvent() end)
	
	Better_RaidMarkerFrame = frame
	
	
	
	RaidMarker_ToggleIcons(true)
end