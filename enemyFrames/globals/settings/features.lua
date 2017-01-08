	-------------------------------------------------------------------------------
	local settings = _G['enemyFramesSettings']
	
	local container = CreateFrame('Frame', 'enemyFramesSettingsfeaturesContainer', settings)
	container:SetWidth(settings:GetWidth()) container:SetHeight(settings:GetHeight())
	container:SetPoint('CENTER', settings)
	container:EnableMouse(true)
	container:EnableMouseWheel(true)
	container:Hide()
	-------------------------------------------------------------------------------
	local checkBoxFeaturesN, checkBoxFeatures  = 7, { 	[1] = {['id'] = 'enableOutdoors', 		['label'] = EF_L_ENABLEOUTSIDEOFBATTLEGROUNS},
														[2] = {['id'] = 'mouseOver', 			['label'] = EF_L_MOUSEOVERCASTONFRAMES},	
														[3] = {['id'] = 'targetFrameCastbar', 	['label'] = EF_L_MOVEABLETARGETCASTBAR},														
														[4] = {['id'] = 'integratedTargetFrameCastbar', 	['label'] = EF_L_INTEGRATEDTARGETCASTBAR},
														[5] = {['id'] = 'targetPortraitDebuff', ['label'] = EF_L_PRIODEBUFFONTARGETPORTRAIT},
														[6] = {['id'] = 'playerPortraitDebuff', ['label'] = EF_L_PRIODEBUFFONPLAYERPORTRAIT},
														[7] = {['id'] = 'targetDebuffTimers', 	['label'] = EF_L_DEBUFFTIMERSONTARGET},
													}
	local checkBoxFeaturesBGN, checkBoxFeaturesBG  = 3, {	[1] = {['id'] = 'incomingSpells', 		['label'] = EF_L_INCOMINGSPELLSBGSONLY},
															[2] = {['id'] = 'pvpmapblips', 			['label'] = EF_L_CLASSCOLOREDMAPBLIPS},
															[3] = {['id'] = 'efcBGannouncement', 	['label'] = EF_L_LOWHEALTHEFCANN},
														}
	-------------------------------------------------------------------------------
	-- features
	container.features = container:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	container.features:SetPoint('LEFT', container, 'TOPLEFT', 45, -30)
	container.features:SetText(EF_L_FEATURES)

	container.featuresList = {}
	for i = 1, checkBoxFeaturesN, 1 do
		container.featuresList[i] = CreateFrame('CheckButton', 'enemyFramesFeaturesCheckButton'..i, container, 'UICheckButtonTemplate')
		container.featuresList[i]:SetHeight(20) 	container.featuresList[i]:SetWidth(20)
		container.featuresList[i]:SetPoint('LEFT', i == 1 and container.features or container.featuresList[i-1], 'LEFT', 0, i == 1 and -40 or -30)
		_G[container.featuresList[i]:GetName()..'Text']:SetText(checkBoxFeatures[i]['label'])
		_G[container.featuresList[i]:GetName()..'Text']:SetPoint('LEFT', container.featuresList[i], 'RIGHT', 4, 0)
		container.featuresList[i].id = checkBoxFeatures[i]['id']
		container.featuresList[i]:SetScript('OnClick', function()
			ENEMYFRAMESPLAYERDATA[this.id]	= this:GetChecked()
			ENEMYFRAMESsettings()
		end)
	end
	-------------------------------------------------------------------------------
	container.bgLabel = container:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	container.bgLabel:SetPoint('LEFT', container.featuresList[checkBoxFeaturesN], 'LEFT', 0, -30)
	container.bgLabel:SetText(EF_L_BATTLEGROUNDS)
	
	container.bgList = {}
	for i = 1, checkBoxFeaturesBGN, 1 do
		container.bgList[i] = CreateFrame('CheckButton', 'enemyFramesFeaturesBGCheckButton'..i, container, 'UICheckButtonTemplate')
		container.bgList[i]:SetHeight(20) 	container.bgList[i]:SetWidth(20)
		container.bgList[i]:SetPoint('LEFT', i == 1 and container.bgLabel or container.bgList[i-1], 'LEFT', 0, i == 1 and -40 or -30)
		_G[container.bgList[i]:GetName()..'Text']:SetText(checkBoxFeaturesBG[i]['label'])
		_G[container.bgList[i]:GetName()..'Text']:SetPoint('LEFT', container.bgList[i], 'RIGHT', 4, 0)
		container.bgList[i].id = checkBoxFeaturesBG[i]['id']
		container.bgList[i]:SetScript('OnClick', function()
			ENEMYFRAMESPLAYERDATA[this.id]	= this:GetChecked()
			ENEMYFRAMESsettings()
			INCOMINGSPELLSsettings(ENEMYFRAMESPLAYERDATA['incomingSpells'])
		end)
	end
	
	-------------------------------------------------------------------------------
	FEATURESSETTINGSInit = function(color)
		for i = 1, checkBoxFeaturesN do
			_G[container.featuresList[i]:GetName()..'Text']:SetTextColor(color['r'], color['g'], color['b'], .9)
			container.featuresList[i]:SetChecked(ENEMYFRAMESPLAYERDATA[checkBoxFeatures[i]['id']])
		end
		
		for i = 1, checkBoxFeaturesBGN do
			_G[container.bgList[i]:GetName()..'Text']:SetTextColor(color['r'], color['g'], color['b'], .9)
			container.bgList[i]:SetChecked(ENEMYFRAMESPLAYERDATA[checkBoxFeaturesBG[i]['id']])
		end
		
		-- disable incoming spells for rogues
		local _, c = UnitClass'player'
		if c == 'ROGUE' then 	ENEMYFRAMESPLAYERDATA['incomingSpells'] = false 
								container.bgList[1]:Disable()  
								_G[container.bgList[1]:GetName()..'Text']:SetTextColor(.5, .5, .5, .9)								
		end
	end
	-------------------------------------------------------------------------------