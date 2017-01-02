--[[--------------------------------------------------
----- VanillaGuide -----
------------------
Frame_SettingsFrame.lua
Authors: mrmr
Version: 1.04.2
------------------------------------------------------
Description: 
    	Settings Frame Object
    1.00
		-- Initial Ace2 release
	1.99a
		-- Ally addition starter version
    1.03
		-- No Changes. Just adjusting "version".
    		1.99x for a beta release was a weird choise.
	1.04.1
		-- Settings Frame object
	1.04.2
		-- One more setting for MetaMapNotes
		(like the one for MetaMapBWP)
------------------------------------------------------
Connection:
--]]--------------------------------------------------


--local VGuide = VGuide
Dv(" VGuide Frame_SettingsFrame.lua Start")

objSettingsFrame = {}
objSettingsFrame.__index = objSettingsFrame

function objSettingsFrame:new(fParent, tTexture, oSettings)	
	fParent = fParent or nil
	local obj = {}
    setmetatable(obj, self)

    local tCharInfo = oSettings:GetSettingsCharInfo()
    local tUI = oSettings:GetSettingsUI()
    --local tMetaMapBWP = oSettings:GetSettingsMetaMapBWP()
    local tMetaMap = oSettings:GetSettingsMetaMap()

   	local bMinimapToggle = tUI.MinimapToggle
	local nMinimapPos = tUI.MinimapPos
	local nStepScroll = tUI.StepScroll
	local nOpacity = tUI.Opacity
	local nScale = tUI.Scale
	local sLayer = tUI.Layer

	local Layers = {
		["DIALOG"] = 5,
		["HIGH"] = 4,
		["MEDIUM"] = 3,
		["LOW"] = 2,
		["BACKGROUND"] = 1,
		[5] = "DIALOG",
		[4] = "HIGH",
		[3] = "MEDIUM",
		[2] = "LOW",
		[1] = "BACKGROUND",
	}

	local function Render_SF(fParent, sName)
		local frame = CreateFrame("Frame", sName)
		frame:SetScale(1)
		frame:SetFrameStrata("TOOLTIP")
		frame:SetWidth(220)
		frame:SetHeight(315)
		-- detach Setting frame from Main Frame, avoiding "scale" bug
		--frame:SetPoint("TOPRIGHT", fParent, "TOPLEFT", -10, 0)
		frame:SetPoint("CENTER", nil, "CENTER", 0, 0)
		frame:SetBackdrop(tTexture.BACKDROP)
		frame:SetBackdropColor(.01, .01, .01, .91)
		frame:SetMovable(true)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)
		frame:RegisterForDrag("LeftButton")
		frame.showthis = false
		return frame
	end
	local function Render_SFCloseButton(fParent, tTexture, sName)
		local btn = CreateFrame("Button", sName, fParent)
		btn:SetWidth(16)
		btn:SetHeight(16)
		btn:SetNormalTexture(tTexture.B_CLOSE.NORMAL)
		btn:SetPushedTexture(tTexture.B_CLOSE.PUSHED)
		btn:SetHighlightTexture(tTexture.B_CLOSE.HIGHLIGHT)
		btn:SetPoint("TOPRIGHT", fParent, "TOPRIGHT", -5, -5)
		return btn
	end
	local function Render_SFMetamapNotesSupportCheckBox(fParent, sName, tMetaMap)
		local chkbtn = CreateFrame("CheckButton", sName, fParent, "UICheckButtonTemplate")
		chkbtn:SetWidth(20)
		chkbtn:SetHeight(20)
		chkbtn.tooltip = "Enable the creation of MetaMap Notes on the WorldMap.";
		getglobal(chkbtn:GetName() .. 'Text'):SetText("   MetaMapNotes Support")

		if tMetaMap.NotesPresence then
			chkbtn:Enable()
		else
			chkbtn:Disable()
		end
		if chkbtn:IsEnabled() then
			if tMetaMap.NotesEnable then
				chkbtn:SetChecked(true)
			else
				chkbtn:SetChecked(false)
			end
		else
			chkbtn:SetChecked(false)
		end
		return chkbtn
	end
	local function Render_SFMetamapBWPSupportCheckBox(fParent, sName, tMetaMap)
		local chkbtn = CreateFrame("CheckButton", sName, fParent, "UICheckButtonTemplate")
		chkbtn:SetWidth(20)
		chkbtn:SetHeight(20)
		chkbtn.tooltip = "Enable the appearance of MetaMapBWP arrow. Just an Arrow pointing where you need to go.";
		getglobal(chkbtn:GetName() .. 'Text'):SetText("   MetaMapBWP Support")

		if tMetaMap.BWPPresence then
			chkbtn:Enable()
		else
			chkbtn:Disable()
		end
		if chkbtn:IsEnabled() then
			if tMetaMap.BWPEnable then
				chkbtn:SetChecked(true)
			else
				chkbtn:SetChecked(false)
			end
		else
			chkbtn:SetChecked(false)
		end
		return chkbtn
	end
	local function Render_SFMinimapCheckBox(fParent, sName)
		local checkbutton = CreateFrame("CheckButton", sName, fParent, "UICheckButtonTemplate")
		checkbutton:SetWidth(20)
		checkbutton:SetHeight(20)
		checkbutton:SetPoint("TOPLEFT", fParent, "TOPLEFT", 10, -10)
		getglobal(checkbutton:GetName() .. 'Text'):SetText("Minimap Button")
		if bMinimapToggle then
		  checkbutton:SetChecked(true)
		else
		  checkbutton:SetChecked(false)
		end
		return checkbutton
	end
	local function Render_SFColorSwatch(fParent, sText, tUI)
		local tCol = nil
		if sText == "VG_MainFrame" then
			tCol = tUI.MainFrameColor
		elseif sText == "VG_MainFrame_StepFrame" then
			tCol = tUI.StepFrameColor
		elseif sText == "VG_MainFrame_ScrollFrame" then
			tCol = tUI.ScrollFrameColor
		elseif sText == "VG_MainFrame_StepFrameLabel" then
			tCol = tUI.StepFrameTextColor
		elseif sText == "VG_MainFrame_ScrollFrameLabels" then
			tCol = tUI.ScrollFrameTextColor
		end
		local sSwatchName = "VG_ColorSwatch" .. "_" .. sText
		local btn = CreateFrame("Button", sSwatchName, fParent)--, "OptionsCheckButtonTemplate")
		local background = btn:CreateTexture(nil, "BACKGROUND")
		background:SetWidth(16)
		background:SetHeight(16)
		background:SetPoint("CENTER", 0, 0)
		background:SetTexture(.3, .3, .3, 1)
		local artwork = btn:CreateTexture(nil, "ARTWORK")
		artwork:SetWidth(13)
		artwork:SetHeight(13)
		artwork:SetPoint("CENTER", 0, 0)
		artwork:SetTexture(tCol.nR, tCol.nG, tCol.nB, tCol.nA)
		btn.background = background
		btn.artwork = artwork
		btn:SetWidth(16)
		btn:SetHeight(16)
		btn:SetNormalTexture(artwork)
		btn:SetScript( "OnClick", function()
			local frame = getglobal(sText)
			local tCol = nil
			local opacitySlider = nil 
			if sText == "VG_MainFrame" then
				tCol = tUI.MainFrameColor
				opacitySlider = true
			elseif sText == "VG_MainFrame_StepFrame" then
				tCol = tUI.StepFrameColor
				opacitySlider = true
			elseif sText == "VG_MainFrame_ScrollFrame" then
				tCol = tUI.ScrollFrameColor
				opacitySlider = true
			elseif sText == "VG_MainFrame_StepFrameLabel" then
				tCol = tUI.StepFrameTextColor
				opacitySlider = false
			elseif sText == "VG_MainFrame_ScrollFrameLabels" then
				tCol = tUI.ScrollFrameTextColor
				opacitySlider = false
			end
			
			local r1, g1, b1, a1 = tCol.nR, tCol.nG, tCol.nB, tCol.nA
			if ColorPickerFrame:IsShown() then
				ColorPickerFrame:Hide()
			else
				ColorPickerFrame.func = function(pV)
					local nr, ng, nb, na
					if pV then
						-- The user bailed, we extract the old color from the table created by ShowColorPicker.
						nr, ng, nb, na = pV.r, pV.g, pV.b, pV.a
						ColorPickerFrame.previousValues = {}
					else
						-- Something changed
						nr, ng, nb = ColorPickerFrame:GetColorRGB();
						na = 1 - OpacitySliderFrame:GetValue()
					end
					r1, g1, b1, a1 = nr, ng, nb, na
					btn.artwork:SetVertexColor(r1, g1, b1, a1)
					--btn.background:SetVertexColor(r1, g1, b1, a1)
					if sText == "VG_MainFrame" then 
						frame:SetBackdropColor(r1, g1, b1, a1)
						--VGuide.db.char.UIoptions.MainFrameColor = {
						tUI.MainFrameColor = {
							nR = r1, nG = g1, nB = b1, nA = a1,
						}
						oSettings:SetSettingsUI(tUI)
					elseif sText == "VG_MainFrame_StepFrame" then
						frame:SetBackdropColor(r1, g1, b1, a1)
						--VGuide.db.char.UIoptions.StepFrameColor = {						
						tUI.StepFrameColor = {
							nR = r1, nG = g1, nB = b1, nA = a1,
						}
						oSettings:SetSettingsUI(tUI)
					elseif sText == "VG_MainFrame_ScrollFrame" then
						frame:SetBackdropColor(r1, g1, b1, a1)
						--VGuide.db.char.UIoptions.ScrollFrameColor = {
						tUI.ScrollFrameColor = {
							nR = r1, nG = g1, nB = b1, nA = a1,
						}
						oSettings:SetSettingsUI(tUI)
					elseif sText == "VG_MainFrame_StepFrameLabel" then
						a1 = .99
						frame:SetTextColor(r1, g1, b1, a1)
						--VGuide.db.char.UIoptions.StepFrameTextColor = {
						tUI.ScrollFrameColor = {
							nR = r1, nG = g1, nB = b1, nA = a1,
						}
						oSettings:SetSettingsUI(tUI)
					elseif sText == "VG_MainFrame_ScrollFrameLabels" then
						local frame = getglobal("VG_MainFrame_ScrollFrameChild")
						local shEH = frame.Entries
						a1 = .71
						for _,v in pairs(shEH) do
							v:SetTextColor(r1, g1, b1, a1)
						end
						--VGuide.db.char.UIoptions.ScrollFrameTextColor = {
						tUI.ScrollFrameColor = {
							nR = r1, nG = g1, nB = b1, nA = a1,
						}
						oSettings:SetSettingsUI(tUI)
					end
				end
				ColorPickerFrame.cancelFunc = ColorPickerFrame.func
				ColorPickerFrame.opacityFunc = ColorPickerFrame.func
				
				ColorPickerFrame.hasOpacity = opacitySlider
				ColorPickerFrame.opacity = 1 - a1
				
				ColorPickerFrame.previousValues = { r = r1, g = g1, b = b1, a = a1}

				Dv(" -- r1: "..r1)
				Dv(" -- g1: "..g1)
				Dv(" -- b1: "..b1)
				Dv(" -- a1: " .. a1)
				ColorPickerFrame:SetColorRGB(r1, g1, b1, a1);
				ColorPickerFrame:Hide(); -- Need to run the OnShow handler.
				ColorPickerFrame:Show();
			end
		end)
		return btn
	end
	local function Render_SFColorSwatchLabel(fParent, sText)
		local fs = fParent:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
		fs:SetPoint("LEFT", fParent, "RIGHT", 10, 0)
		fs:SetText(sText)
		return fs
	end
	local function Render_Button(fParent, sName, nWidth, nHeight, tTexture)
		local btn = CreateFrame("Button", sName, fParent)
		btn:SetWidth(nWidth)
		btn:SetHeight(nHeight)
		btn:SetNormalTexture(tTexture.NORMAL)
		btn:SetPushedTexture(tTexture.PUSHED)
		btn:SetHighlightTexture(tTexture.HIGHLIGHT)
		btn:RegisterForClicks("LeftButtonUp")
		return btn
	end
	local function Render_SFSlider(fParent, sName, sText, sLow, sHigh, nMin, nMax, nValue, sAppend)
		local sldr = CreateFrame("Slider", sName, fParent, "OptionsSliderTemplate")
		sldr:SetOrientation("HORIZONTAL");
		sldr:SetWidth(195)
		sldr:SetHeight(14)
		sldr:SetPoint("TOP", fParent, "TOP", 0, -200)
		getglobal(sldr:GetName() .. 'Text'):SetText(sText); --Sets the "title" text (top-centre of slider).
		getglobal(sldr:GetName() .. 'Low'):SetText(sLow); --Sets the left-side slider text (default is "Low").
		getglobal(sldr:GetName() .. 'High'):SetText(sHigh); --Sets the right-side slider text (default is "High").
		sldr:SetValueStep(1)
		sldr:SetMinMaxValues(nMin, nMax)
		sldr:SetValue(nValue)
		local fs = sldr:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
		fs:SetTextColor(.59, .59, .59, 1)
		fs:SetJustifyH("CENTER")
		fs:SetJustifyV("BOTTOM")
		fs:SetPoint("CENTER", sldr, "BOTTOM", 0, -2)
		if sAppend then
			fs:SetText(tostring(nValue) .. sAppend)
		else
			fs:SetText(tostring(nValue))
		end
		sldr.fs = fs
		return sldr
	end

	obj.tWidgets = {}
	-------------------------------
	--- Rendering
	-------------------------------
	do
	-- Settings Frame
		obj.tWidgets.frame_SettingFrame = Render_SF(fParent, "VG_SettingsFrame")
		obj.tWidgets.button_CloseButton = Render_Button(obj.tWidgets.frame_SettingFrame, nil, 16, 16, tTexture.B_CLOSE)
		obj.tWidgets.button_CloseButton:SetPoint("TOPRIGHT", obj.tWidgets.frame_SettingFrame, "TOPRIGHT", -5, -5)
		obj.tWidgets.checkbutton_MetaMapNotesSupport = Render_SFMetamapNotesSupportCheckBox(obj.tWidgets.frame_SettingFrame, "VG_SettingsFrame_MetaMapNotesCheckButton", tMetaMap)
		obj.tWidgets.checkbutton_MetaMapNotesSupport:SetPoint("TOPLEFT", obj.tWidgets.frame_SettingFrame, "TOPLEFT", 8, -5)
		obj.tWidgets.checkbutton_MetaMapBWPSupport = Render_SFMetamapBWPSupportCheckBox(obj.tWidgets.frame_SettingFrame, "VG_SettingsFrame_MetaMapBWPCheckButton", tMetaMap)
		obj.tWidgets.checkbutton_MetaMapBWPSupport:SetPoint("TOPLEFT", obj.tWidgets.frame_SettingFrame, "TOPLEFT", 8, -20)
		--tWidgets.checkbutton_Minimap = Render_SFMinimapCheckBox(tWidgets.frame_SettingFrame, "VG_SettingsFrame_MinimapCheckButton")
		--tWidgets.slider_Minimap = Render_SFSlider(tWidgets.frame_SettingFrame, "VG_SettingFrame_MinimapSlider", "Minimap Button Placement", "-180", "+180", -180, 180, math.floor(nMinimapPos), nil)
		--tWidgets.slider_Minimap:SetPoint("TOP", tWidgets.frame_SettingFrame, "TOP", 0, -40)

		obj.tWidgets.colorpicker_StepFrameTextColor = Render_SFColorSwatch(obj.tWidgets.frame_SettingFrame, "VG_MainFrame_StepFrameLabel", tUI)
		obj.tWidgets.colorpicker_StepFrameTextColor:SetPoint("TOPLEFT", obj.tWidgets.frame_SettingFrame, "TOPLEFT", 10, -45)
		obj.tWidgets.fs_ColorPickerStepFrameTextColor = Render_SFColorSwatchLabel(obj.tWidgets.colorpicker_StepFrameTextColor, "StepFrame TextColor")
		
		obj.tWidgets.colorpicker_ScrollFrameTextColor = Render_SFColorSwatch(obj.tWidgets.frame_SettingFrame, "VG_MainFrame_ScrollFrameLabels", tUI)
		obj.tWidgets.colorpicker_ScrollFrameTextColor:SetPoint("TOPLEFT", obj.tWidgets.frame_SettingFrame, "TOPLEFT", 10, -63)
		obj.tWidgets.fs_ColorPickerScrollFrameTextColor = Render_SFColorSwatchLabel(obj.tWidgets.colorpicker_ScrollFrameTextColor, "ScrollFrame TextColor")
		
		obj.tWidgets.colorpicker_MainFrame = Render_SFColorSwatch(obj.tWidgets.frame_SettingFrame, "VG_MainFrame", tUI)
		obj.tWidgets.colorpicker_MainFrame:SetPoint("TOPLEFT", obj.tWidgets.frame_SettingFrame, "TOPLEFT", 10, -93)
		obj.tWidgets.fs_ColorPickerMainFrame = Render_SFColorSwatchLabel(obj.tWidgets.colorpicker_MainFrame, "MainFrame Background")

		obj.tWidgets.colorpicker_StepFrame = Render_SFColorSwatch(obj.tWidgets.frame_SettingFrame, "VG_MainFrame_StepFrame", tUI)
		obj.tWidgets.colorpicker_StepFrame:SetPoint("TOPLEFT", obj.tWidgets.frame_SettingFrame, "TOPLEFT", 10, -110)
		obj.tWidgets.fs_ColorPickerStepFrame = Render_SFColorSwatchLabel(obj.tWidgets.colorpicker_StepFrame , "StepFrame Tint")

		obj.tWidgets.colorpicker_ScrollFrame = Render_SFColorSwatch(obj.tWidgets.frame_SettingFrame, "VG_MainFrame_ScrollFrame", tUI)
		obj.tWidgets.colorpicker_ScrollFrame:SetPoint("TOPLEFT", obj.tWidgets.frame_SettingFrame, "TOPLEFT", 10, -127)
		obj.tWidgets.fs_ColorPickerScrollFrame = Render_SFColorSwatchLabel(obj.tWidgets.colorpicker_ScrollFrame, "ScrollFrame Tint")

		obj.tWidgets.slider_StepScroll = Render_SFSlider(obj.tWidgets.frame_SettingFrame, "VG_SettingsFrame_StepScrollSlider", "Value", "15%", "55%", 15, 55, math.floor(nStepScroll*100), "%")
		obj.tWidgets.slider_StepScroll:SetPoint("TOP", obj.tWidgets.frame_SettingFrame, "TOP", 0, -160)
		obj.tWidgets.slider_Opacity = Render_SFSlider(obj.tWidgets.frame_SettingFrame, "VG_SettingsFrame_OpacitySlider", "Opacity", "15%", "100%", 15, 100, math.floor(nOpacity*100), "%")
		obj.tWidgets.slider_Opacity:SetPoint("TOP", obj.tWidgets.frame_SettingFrame, "TOP", 0, -200)
		obj.tWidgets.slider_Scale = Render_SFSlider(obj.tWidgets.frame_SettingFrame, "VG_SettingsFrame_ScaleSlider", "Scale", "25%", "175%", 25, 175, math.floor(nScale*100), "%")
		obj.tWidgets.slider_Scale:SetPoint("TOP", obj.tWidgets.frame_SettingFrame, "TOP", 0, -240)
		obj.tWidgets.slider_Layer = Render_SFSlider(obj.tWidgets.frame_SettingFrame, "VG_SettingsFrame_LayerSlider", "Layer", "BG", "DIALOG", 1, 5, Layers[sLayer], sLayer)
		obj.tWidgets.slider_Layer:SetPoint("TOP", obj.tWidgets.frame_SettingFrame, "TOP", 0, -280)
		obj.tWidgets.slider_Layer.fs:SetText(sLayer)
	end

	-------------------------------
	--- UI Events Handling
	-------------------------------
	obj.tWidgets.frame_SettingFrame:SetScript("OnMouseDown", function()
		if arg1 == "LeftButton" and not this.isMoving then
			this:StartMoving();
			this.isMoving = true;
		end
	end)
	obj.tWidgets.frame_SettingFrame:SetScript("OnMouseUp", function()
		if arg1 == "LeftButton" and this.isMoving then
			this:StopMovingOrSizing();
			this.isMoving = false;
		end
	end)
	obj.tWidgets.frame_SettingFrame:SetScript("OnHide", function()
		if this.isMoving then
			this:StopMovingOrSizing();
			this.isMoving = false;
		end
	end)
	obj.tWidgets.button_CloseButton:SetScript("OnClick", function()
		local frame = this:GetParent()
		frame:Hide()
		frame.showthis = false
	end)
	obj.tWidgets.checkbutton_MetaMapNotesSupport:SetScript("OnClick", function()
		if arg1 == "LeftButton" then
			local bVal = this:GetChecked()
			local tMetaMap = oSettings:GetSettingsMetaMap()
			if not bVal then
				tMetaMap.NotesEnable = false
			else
				tMetaMap.NotesEnable = true
			end
			oSettings:SetSettingsMetaMap(tMetaMap)
		end
	end)
	obj.tWidgets.checkbutton_MetaMapBWPSupport:SetScript("OnClick", function()
		if arg1 == "LeftButton" then
			local bVal = this:GetChecked()
			local tMetaMap = oSettings:GetSettingsMetaMap()
			if not bVal then
				tMetaMap.BWPEnable = false
			else
				tMetaMap.BWPEnable = true
			end
			oSettings:SetSettingsMetaMap(tMetaMap)
		end
	end)
	--[[obj.tWidgets.checkbutton_Minimap:SetScript("OnClick", function()
		if arg1 == "LeftButton" then
			local button = getglobal("VG_MinimapButton")
			local bVal = this:GetChecked()
			if bVal == 1 then
				button:Show()
				button.closethis = false
				--VGuide.db.profile.UIoptions.MinimapToggle = true
				tUInew.UI.MinimapToggle = true
			else
				button:Hide()
				button.closethis = true
				--VGuide.db.profile.UIoptions.MinimapToggle = false
				tUInew.UI.MinimapToggle = false
			end
		end
	end)
	]]
	--[[obj.tWidgets.slider_Minimap:SetScript("OnValueChanged", function()
		local nVal = this:GetValue()
		local button = getglobal("VG_bMinimap")
		UI.PositionMinimapButton(button, nVal)
		--VGuide.db.profile.UIoptions.MinimapPos = nVal
		tUInew.UI.MinimapPos = nVal
		this.fs:SetText(nVal)
	end)
	]]
	obj.tWidgets.slider_StepScroll:SetScript("OnValueChanged", function()
		local nVal = arg1
		local fMain = getglobal("VG_MainFrame")
		local fStep = getglobal("VG_MainFrame_StepFrame")
		local fScroll = getglobal("VG_MainFrame_ScrollFrame")
		local fChild = getglobal("VG_MainFrame_ScrollFrameChild")
		local bStepFrame = tUI.StepFrameVisible
		local bScrollFrame = tUI.ScrollFrameVisible

		if bStepFrame and bScrollFrame then
			local nfMHeight = fMain:GetHeight()
			local nPer = nfMHeight * (1 - nVal/100)
			local nGap = nPer - (nfMHeight/2)
			fStep:SetPoint("TOPLEFT", fMain, "TOPLEFT", 5, -23)
			fStep:SetPoint("BOTTOMRIGHT", fMain, "RIGHT", -5, nGap)
			fScroll:SetPoint("TOPLEFT", fStep, "BOTTOMLEFT", 0, -2)
			--UI.SetSliderMinMax(fChild.nFSTotalHeight)
		end
		--VGuide.db.profile.UIoptions.StepScroll = nVal/100
		--VGuide.db.char.UIoptions.StepScroll = nVal/100
		tUI.StepScroll = nVal/100
		oSettings:SetSettingsUI(tUI)
		this.fs:SetText(nVal.."%")
	end)
	obj.tWidgets.slider_Opacity:SetScript("OnValueChanged", function()
		local nVal = arg1
		local frame = getglobal("VG_MainFrame")
		frame:SetAlpha(nVal/100)
		--VGuide.db.profile.UIoptions.Opacity = nVal/100
		--VGuide.db.char.UIoptions.Opacity = nVal/100
		tUI.Opacity = nVal/100
		oSettings:SetSettingsUI(tUI)
		this.fs:SetText(nVal.."%")
	end)
	obj.tWidgets.slider_Scale:SetScript("OnValueChanged", function()
		local nVal = arg1
		local frame = getglobal("VG_MainFrame")
		frame:SetScale(nVal/100)
		--VGuide.db.profile.UIoptions.Scale = nVal/100
		--VGuide.db.char.UIoptions.Scale = nVal/100
		tUI.Scale = nVal/100
		oSettings:SetSettingsUI(tUI)
		this.fs:SetText(nVal.."%")
	end)
	obj.tWidgets.slider_Layer:SetScript("OnValueChanged", function()
		local nVal = arg1
		local frame = getglobal("VG_MainFrame")
		--VGuide.db.profile.UIoptions.Layer = Layers[nVal]
		--VGuide.db.char.UIoptions.Layer = Layers[nVal]
		tUI.Layer = Layers[nVal]
		oSettings:SetSettingsUI(tUI)
		--frame:SetFrameStrata(VGuide.db.char.UIoptions.Layer)
		--this.fs:SetText(VGuide.db.char.UIoptions.Layer)
		frame:SetFrameStrata(tUI.Layer)
		this.fs:SetText(tUI.Layer)
	end)

	-------------------------------
	--- Initialization
	-------------------------------
	obj.tWidgets.frame_SettingFrame:Hide()
	--obj.tWidgets.frame_SettingFrame:Show()
	
	obj.ShowFrame = function(self)
		local f = obj.tWidgets.frame_SettingsFrame
		if not f:IsVisible() then
			f:Show()
		end
	end

	obj.HideFrame = function(self)
		local f = obj.tWidgets.frame_SettingsFrame
		if f:IsVisible() then
			f:Hide()
		end
	end

    return obj
end

Dv(" VGuide Frame_SettingsFrame.lua End")
