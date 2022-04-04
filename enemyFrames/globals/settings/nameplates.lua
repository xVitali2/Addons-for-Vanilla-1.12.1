	-------------------------------------------------------------------------------
	local L = enemyFrames.L
	local settings = _G['enemyFramesSettings']
	
	local container = CreateFrame('Frame', 'enemyFramesSettingsnameplatesContainer', settings)
	container:SetWidth(settings:GetWidth()) container:SetHeight(settings:GetHeight())
	container:SetPoint('CENTER', settings)
	container:EnableMouse(true)
	container:EnableMouseWheel(true)
	container:Hide()
	-------------------------------------------------------------------------------
	local checkBoxPlatesOptN, checkBoxPlatesOpt  = 4, { [1] = {['id'] = 'nameplatesClassColor', ['label'] = L['Class color on enemy nameplates']},														
														[2] = {['id'] = 'nameplatesCastbar', 	['label'] = L['Enable nameplate cast bar']},
														[3] = {['id'] = 'nameplatesRaidMarks', 	['label'] = L['Show Raid Marks']},
														[4] = {['id'] = 'nameplatesdebuffs', 	['label'] = L['Enable nameplate debuffs']},														
													}
	-------------------------------------------------------------------------------
	-- nameplates optionals
	container.platesLabel = container:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	container.platesLabel:SetPoint('LEFT', container, 'TOPLEFT', 45, -30)
	container.platesLabel:SetText(L['nameplates'])

	container.platesList = {}
	for i = 1, checkBoxPlatesOptN, 1 do
		container.platesList[i] = CreateFrame('CheckButton', 'enemyFramesPlatesOptionalsCheckButton'..i, container, 'UICheckButtonTemplate')
		container.platesList[i]:SetHeight(20) 	container.platesList[i]:SetWidth(20)
		container.platesList[i]:SetPoint('LEFT', i == 1 and container.platesLabel or container.platesList[i-1], 'LEFT', 0, i == 1 and -40 or -30)
		_G[container.platesList[i]:GetName()..'Text']:SetText(checkBoxPlatesOpt[i]['label'])
		_G[container.platesList[i]:GetName()..'Text']:SetPoint('LEFT', container.platesList[i], 'RIGHT', 4, 0)
		container.platesList[i].id = checkBoxPlatesOpt[i]['id']
		container.platesList[i]:SetScript('OnClick', function()
			ENEMYFRAMESPLAYERDATA[this.id]	= this:GetChecked()
		end)
	end
	--plate debuff size slider
	container.plateDebuffSlider = CreateFrame('Slider', 'enemyFramesDebuffSizeSlider', container, 'OptionsSliderTemplate')
	container.plateDebuffSlider:SetWidth(205) 	container.plateDebuffSlider:SetHeight(14)
	container.plateDebuffSlider:SetPoint('LEFT', container.platesList[checkBoxPlatesOptN], 'LEFT', 0, -20)
	container.plateDebuffSlider:SetMinMaxValues(0.9, 1.5)
	container.plateDebuffSlider:SetValueStep(.05)
	_G[container.plateDebuffSlider:GetName()..'Low']:SetText'0.9'
	_G[container.plateDebuffSlider:GetName()..'High']:SetText'1.5'


	container.plateDebuffSlider:SetScript('OnValueChanged', function() 
		ENEMYFRAMESPLAYERDATA['plateDebuffSize'] = this:GetValue() 
	end)
	-------------------------------------------------------------------------------
	NAMEPLATESSETTINGSInit = function(color)
		for i = 1, checkBoxPlatesOptN do
			_G[container.platesList[i]:GetName()..'Text']:SetTextColor(color['r'], color['g'], color['b'], .9)
			container.platesList[i]:SetChecked(ENEMYFRAMESPLAYERDATA[checkBoxPlatesOpt[i]['id']])
		end
		
		container.plateDebuffSlider:SetValue(ENEMYFRAMESPLAYERDATA['plateDebuffSize'] and ENEMYFRAMESPLAYERDATA['plateDebuffSize'] or 1)
		_G[container.plateDebuffSlider:GetName()..'Low']:SetTextColor(color['r'], color['g'], color['b'], .9)
		_G[container.plateDebuffSlider:GetName()..'High']:SetTextColor(color['r'], color['g'], color['b'], .9)
	end
	-------------------------------------------------------------------------------