function DoTimer_SetMenuData()
	DoTimerScaleSlider:SetValue(DoTimer_Settings.scale)
	DoTimerButtonScaleSlider:SetValue(DoTimer_Settings.buttonscale)
	DoTimerMaxTargetsSlider:SetValue(DoTimer_Settings.maxtargets)
	DoTimerMaxDebuffsSlider:SetValue(DoTimer_Settings.maxdebuffs)
	DoTimerFormatSlider:SetValue(DoTimerFormatSlider.values[DoTimer_Settings.format])
	DoTimerTargetLayoutSlider:SetValue(DoTimerTargetLayoutSlider.values[DoTimer_Settings.targetlayout])
	DoTimerDebuffLayoutSlider:SetValue(DoTimerDebuffLayoutSlider.values[DoTimer_Settings.debufflayout])
	local sortmethod
	if DoTimer_Settings.sortbyadded then sortmethod = "added" else sortmethod = "remaining" end
	DoTimerDebuffSortSlider:SetValue(DoTimerDebuffSortSlider.values[sortmethod])
	local debugging
	if DoTimer_DebugChannel then
		if DoTimer_DebugChannel == "" then debugging = "on" else debugging = DoTimer_DebugChannel end
	else
		debugging = "off"
	end
	DoTimerDebugEditBox:SetText(debugging)
	DoTimerLifeTapEditBox:SetText(DoTimer_Settings.lifetaprank)
	local status
	if DoTimer_Settings.status == "on" then status = true else status = false end
	DoTimerEnabledCheckButton:SetChecked(status)
	DoTimerVisibleCheckButton:SetChecked(DoTimer_Settings.visible)
	DoTimerLockedCheckButton:SetChecked(DoTimer_Settings.locked)
	DoTimerNamesCheckButton:SetChecked(DoTimer_Settings.names)
	DoTimerLevelsCheckButton:SetChecked(DoTimer_Settings.levels)
	DoTimerExpAlertCheckButton:SetChecked(DoTimer_Settings.expalert)
	DoTimerClickableCheckButton:SetChecked(DoTimer_Settings.clickable)
	DoTimerDepCheckButton:SetChecked(DoTimer_Settings.dep)
	DoTimerProbableCheckButton:SetChecked(DoTimer_Settings.probable)
	DoTimerSepGhostCheckButton:SetChecked(DoTimer_Settings.sepghost)
	DoTimerManaCheckButton:SetChecked(DoTimer_Settings.manacheck)
	DoTimerAllGhostCheckButton:SetChecked(DoTimer_Settings.allghost)
	DoTimerForceConflagCheckButton:SetChecked(DoTimer_Settings.conflag)
	DoTimerOnlyTargetCheckButton:SetChecked(DoTimer_Settings.onlytarget)
	DoTimerPlaySoundsCheckButton:SetChecked(DoTimer_Settings.playsound)
	DoTimerBarLengthSlider:SetValue(DoTimer_Settings.barlength)
end

function DoTimer_ParseMenuData()
	DoTimer_Commands("scale "..DoTimerScaleSlider:GetValue(),1)
	DoTimer_Commands("button scale "..DoTimerButtonScaleSlider:GetValue(),1)
	DoTimer_Commands("max targets "..DoTimerMaxTargetsSlider:GetValue(),1)
	DoTimer_Commands("max debuffs "..DoTimerMaxDebuffsSlider:GetValue(),1)
	DoTimer_Commands("set format "..DoTimerFormatSlider.values[DoTimerFormatSlider:GetValue()],1)
	DoTimer_Commands("set layout "..DoTimerTargetLayoutSlider.values[DoTimerTargetLayoutSlider:GetValue()].." "..DoTimerDebuffLayoutSlider.values[DoTimerDebuffLayoutSlider:GetValue()],1)
	DoTimer_Commands("sort by "..DoTimerDebuffSortSlider.values[DoTimerDebuffSortSlider:GetValue()],1)
	DoTimer_Commands("debug "..DoTimerDebugEditBox:GetText(),1)
	DoTimer_Commands("life tap rank "..DoTimerLifeTapEditBox:GetText(),1)
	DoTimer_Commands("bar length "..DoTimerBarLengthSlider:GetValue(),1)
	if DoTimerEnabledCheckButton:GetChecked() then DoTimer_Commands("on",1) else DoTimer_Commands("off",1) end
	if DoTimerVisibleCheckButton:GetChecked() then DoTimer_Commands("ui on",1) else DoTimer_Commands("ui off",1) end
	if DoTimerLockedCheckButton:GetChecked() then DoTimer_Commands("lock",1) else DoTimer_Commands("unlock",1) end
	if DoTimerNamesCheckButton:GetChecked() then DoTimer_Commands("names on",1) else DoTimer_Commands("names off",1) end
	if DoTimerLevelsCheckButton:GetChecked() then DoTimer_Commands("show levels",1) else DoTimer_Commands("no levels",1) end
	if DoTimerExpAlertCheckButton:GetChecked() then DoTimer_Commands("expire alert",1) else DoTimer_Commands("no expire alert",1) end
	if DoTimerClickableCheckButton:GetChecked() then DoTimer_Commands("clickable debuffs",1) else DoTimer_Commands("unclickable debuffs",1) end
	if DoTimerDepCheckButton:GetChecked() then DoTimer_Commands("old timers",1) else DoTimer_Commands("no old timers",1) end
	if DoTimerProbableCheckButton:GetChecked() then DoTimer_Commands("include probable",1) else DoTimer_Commands("do not include probable",1) end
	if DoTimerSepGhostCheckButton:GetChecked() then DoTimer_Commands("separate ghosts",1) else DoTimer_Commands("do not separate ghosts",1) end
	if DoTimerManaCheckButton:GetChecked() then DoTimer_Commands("mana check on",1) else DoTimer_Commands("mana check off",1) end
	if DoTimerAllGhostCheckButton:GetChecked() then DoTimer_Commands("all ghost on",1) else DoTimer_Commands("all ghost off",1) end
	if DoTimerForceConflagCheckButton:GetChecked() then DoTimer_Commands("force conflag",1) else DoTimer_Commands("do not force conflag",1) end
	if DoTimerOnlyTargetCheckButton:GetChecked() then DoTimer_Commands("show only target",1) else DoTimer_Commands("do not show only target",1) end
	if DoTimerPlaySoundsCheckButton:GetChecked() then DoTimer_Commands("play sounds",1) else DoTimer_Commands("do not play sounds",1) end
end
