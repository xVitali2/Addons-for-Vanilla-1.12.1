	-------------------------------------------------------------------------------
	local settings = _G['enemyFramesSettings']
	
	local container = CreateFrame('Frame', 'enemyFramesSettingsoptionalsContainer', settings)
	container:SetWidth(settings:GetWidth()) container:SetHeight(settings:GetHeight())
	container:SetPoint('CENTER', settings)
	container:EnableMouse(true)
	container:EnableMouseWheel(true)
	container:Hide()
	-------------------------------------------------------------------------------
	local checkBoxOptionalsN, checkBoxOptionals  = 5, { [1] = {['id'] = 'displayNames', 		['label'] = 'Display names'}, 
														--[2] = {['id'] = 'displayHealthValues', 	['label'] = 'Display Health %'}, 
														[2] = {['id'] = 'displayManabar', 		['label'] = 'Display mana bar'},
														[3] = {['id'] = 'castTimers', 			['label'] = 'Display cast timers'},
														[4] = {['id'] = 'displayOnlyNearby', 	['label'] = 'Display nearby units only'},
														[5] = {['id'] = 'targetCounter', 		['label'] = 'Display Target Counter'},
														
													}
	-------------------------------------------------------------------------------
	-- optionals
	container.optionals = container:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	container.optionals:SetPoint('LEFT', container, 'TOPLEFT', 45, -30)
	container.optionals:SetText'optional'

	container.optinalsList = {}
	for i = 1, checkBoxOptionalsN, 1 do
		container.optinalsList[i] = CreateFrame('CheckButton', 'enemyFramesOptionalsCheckButton'..i, container, 'UICheckButtonTemplate')
		container.optinalsList[i]:SetHeight(20) 	container.optinalsList[i]:SetWidth(20)
		container.optinalsList[i]:SetPoint('LEFT', i == 1 and container.optionals or container.optinalsList[i-1], 'LEFT', 0, i == 1 and -40 or -30)
		_G[container.optinalsList[i]:GetName()..'Text']:SetText(checkBoxOptionals[i]['label'])
		_G[container.optinalsList[i]:GetName()..'Text']:SetPoint('LEFT', container.optinalsList[i], 'RIGHT', 4, 0)

		container.optinalsList[i].id = checkBoxOptionals[i]['id']
		container.optinalsList[i]:SetScript('OnClick', function()
			ENEMYFRAMESPLAYERDATA[this.id]	= this:GetChecked()
			ENEMYFRAMESsettings()
		end)
	end
	-------------------------------------------------------------------------------
	OPTIONALSSETTINGSInit = function(color)
		for i = 1, checkBoxOptionalsN do
			_G[container.optinalsList[i]:GetName()..'Text']:SetTextColor(color['r'], color['g'], color['b'], .9)
			container.optinalsList[i]:SetChecked(ENEMYFRAMESPLAYERDATA[checkBoxOptionals[i]['id']])
		end
	end
	-------------------------------------------------------------------------------