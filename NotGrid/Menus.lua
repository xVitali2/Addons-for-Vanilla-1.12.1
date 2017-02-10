--------------------
-- Unit Drop Down --
--------------------

local L = AceLibrary("AceLocale-2.0"):new("NotGrid")

-- So moreover I'm just going to create a frame that looks like a menu
function NotGrid:DoDropDown()
	self:InitializeMenu()
	self:InitializeSlider()
	self:InitializeEditBox()
end

local menuarray = {
	--flavortext, booleantoggle, currvalueforslider, currecntvalueforeditbox, currvalueforcolor
	{text = L["Unit Width"], 
	slider = {
		key = "unitwidth",
		minval = 1,
		maxval = 100,
		},
	},
	{text = L["Unit Height"], 
	slider = {
		key = "unitheight",
		minval = 1,
		maxval = 100,
		},
	},
	{text = L["Unit Border"], 
	slider = {
		key = "unitborder",
		minval = 1,
		maxval = 20,
		},
	color = {
			key = "unitbordercolor",
		},
	},
	{text = L["Unit Padding"], 
	slider = {
		key = "unitpadding",
		minval = -10,
		maxval = 50,
		},
	},
	{text = L["Font"],
	editbox = {
		key = "unitfont",
		},
	},
	{text = L["Texture"],
	editbox = {
		key = "unithealthbartexture",
		},
	},
	{text = L["Orientation"],
	editbox = {
		key = "unithealthorientation",
		},
	},

	--unitnamehealthtextsize
	{text = L["Name"], -- (Toggle for Class)
	toggle = "colorunitnamehealthbyclass",
	slider = {
		key = "unitnamehealthtextsize",
		minval = 1,
		maxval = 20,
		},
	color = {
			key = "unitnamehealthtextcolor",
		},
	},
	{text = L["Name Length"], -- (Toggle for Class)
	slider = {
		key = "namelength",
		minval = 1,
		maxval = 12,
		},
	},

	{text = L["Health"], -- (Toggle for Class)
	toggle = "colorunithealthbarbyclass",
	slider = {
		key = "healththreshhold",
		minval = 1,
		maxval = 100,
		},
	color = {
			key = "unithealthbarcolor",
		},
	},

	{text = L["Highlight Target"], -- (Toggle for Class)
	toggle = "tracktarget",
	color = {
			key = "targetcolor",
		},
	},

	{text = L["Aggro Warning"],
	toggle = "trackaggro",
	color = {
			key = "aggrowarningcolor",
		},
	},
	{text = L["Mana Warning"], -- (Toggle for Class)
	toggle = "trackmana",
	slider = {
		key = "manathreshhold",
		minval = 1,
		maxval = 100,
		},
	color = {
			key = "manawarningcolor",
		},
	},

	{text = L["Healcomm"],
	color = {
			key = "unithealcommbarcolor",
		},
	},
	{text = L["Healcomm Text"],
	toggle = "showhealcommtext",
	slider = {
		key = "unithealcommtextsize",
		minval = 1,
		maxval = 20,
		},
	color = {
			key = "unithealcommtextcolor",
		},
	},
	
	-- Icons --

	{text = L["Top Left Icon"],
	editbox = {
		key = "trackingicon1",
		},
	color = {
		key = "trackingicon1color",
		},
	},
	{text = L["Top Icon"],
	editbox = {
		key = "trackingicon2",
		},
	color = {
		key = "trackingicon2color",
		},
	},
	{text = L["Top Right Icon"],
	editbox = {
		key = "trackingicon3",
		},
	color = {
		key = "trackingicon3color",
		},
	},
	{text = L["Right Icon"],
	editbox = {
		key = "trackingicon4",
		},
	color = {
		key = "trackingicon4color",
		},
	},
	{text = L["Bottom Right Icon"],
	editbox = {
		key = "trackingicon5",
		},
	color = {
		key = "trackingicon5color",
		},
	},
	{text = L["Bottom Icon"],
	editbox = {
		key = "trackingicon6",
		},
	color = {
		key = "trackingicon6color",
		},
	},
	{text = L["Bottom Left Icon"],
	editbox = {
		key = "trackingicon7",
		},
	color = {
		key = "trackingicon7color",
		},
	},
	{text = L["Left Icon"],
	editbox = {
		key = "trackingicon8",
		},
	color = {
		key = "trackingicon8color",
		},
	},

	-- end of icons --
	{text = L["Proximity Leeway"], 
	slider = {
		key = "proximityleeway",
		minval = 0,
		maxval = 30,
		},
	},
	{text = L["Use Map Proximity"], 
	toggle = "usemapdistances",
	},
	{text = L["Smart Center"], 
	toggle = "smartcenter",
	},
	{text = L["Right To Left"], 
	toggle = "growrighttoleft",
	},
	{text = L["Show While Solo"], 
	toggle = "showwhilesolo",
	},
	{text = L["Show In Party"], 
	toggle = "showinparty",
	},
	{text = L["Show Blizz Frames"], 
	toggle = "showblizzframes",
	},
	{text = L["Locked"], 
	toggle = "locked",
	},
}

--------------
-- Dropdown --
--------------

function NotGrid:InitializeMenu()
	local f = CreateFrame("Button","NotGridOptionsMenu",UIParent)
	f:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
	f:SetBackdropColor(0,0,0)
	f:SetWidth(190)
	f:SetHeight(22*getn(menuarray)) -- because of things.. this isn't prefect
	f:SetPoint("CENTER",UIParent,"CENTER",0,200)
	f:SetMovable(true)
	f:RegisterForDrag("LeftButton")
	f:SetScript("OnDragStart", function()
		NotGridOptionsMenu:StartMoving()
	end)
	f:SetScript("OnDragStop", function()
		this:StopMovingOrSizing()
	end)
	f:Hide()
	local fx = CreateFrame("Button","$parentXbutton",f,"UIPanelCloseButton")
	fx:SetPoint("TOPRIGHT",0,0)

	for key,val in menuarray do
		local fb = CreateFrame("Button", "$parentbutton"..key, f)
		fb:SetWidth(140)
		fb:SetHeight(14)
		--fb:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
		--fb:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up")
		fb:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight","ADD")
		fb:SetPoint("TOP",0,-(20*key))
		--
		fb.fs = fb:CreateFontString('$parenttext', "ARTWORK", "GameFontHighlightSmall")
		fb.fs:SetText(val.text)
		fb.fs:SetPoint("LEFT",0,0)
		--
		--fb.text = val.text
		fb.toggle = val.toggle
		fb.slider = val.slider
		fb.editbox = val.editbox
		--fb.color = val.color
		--
		-- if fb.toggle, make a checkmark frame
		if val.toggle then
			fb.chk = CreateFrame("Frame","parentCheckmark",fb)
			fb.chk:SetWidth(20)
			fb.chk:SetHeight(20)
			fb.chk.tex = fb.chk:CreateTexture()
			if NotGridOptions[fb.toggle] then
				fb.chk.tex:SetTexture("Interface/Buttons/UI-CheckBox-Check")
			else
				fb.chk.tex:SetTexture("Interface/Buttons/UI-CheckBox-Check-Disabled")
			end
			fb.chk.tex:SetAllPoints()
			fb.chk:SetPoint("RIGHT",fb,"LEFT",0,0)
		end
		if val.color then
			fb.clr = CreateFrame("Button","$parentButton",fb)
			fb.clr.color = val.color
			fb.clr:SetWidth(12)
			fb.clr:SetHeight(12)
			fb.clr.tex = fb.clr:CreateTexture("$parentTexture")
			fb.clr.tex:SetTexture(unpack(NotGridOptions[val.color.key]))
			fb.clr.tex:SetAllPoints()
			fb.clr:SetPoint("LEFT",fb,"RIGHT",0,0)
			fb.clr:SetScript("OnClick", function()
				--DEFAULT_CHAT_FRAME:AddMessage(NotGridOptions[this.color.key][1])
				notgrid_clickcolor()
			end)
		end

		fb:SetScript("OnClick", function()
			if this.toggle then
				if NotGridOptions[this.toggle] == true then
					NotGridOptions[this.toggle] = false
					fb.chk.tex:SetTexture("Interface/Buttons/UI-CheckBox-Check-Disabled")
					NotGridOptionChange()
				else
					NotGridOptions[this.toggle] = true
					fb.chk.tex:SetTexture("Interface/Buttons/UI-CheckBox-Check")
					NotGridOptionChange()
				end
			end
		end)
		fb:SetScript("OnEnter", function()
			if this.slider and this.editbox then
				--show them both
			elseif this.editbox then
				NotGridMenuEditBox.key = this.editbox.key
				NotGridMenuEditBox:SetText(NotGridOptions[this.editbox.key])
				NotGridMenuEditBoxContainer:ClearAllPoints()
				NotGridMenuEditBoxContainer:SetPoint("TOPRIGHT",this,"TOPLEFT",-20,0)
				NotGridMenuEditBoxContainer:Show()
				--make sure slider is hidden
				NotGridMenuSliderContainer:Hide()
			elseif this.slider then
				NotGridMenuSlider.key = this.slider.key
				NotGridMenuSlider:SetMinMaxValues(this.slider.minval, this.slider.maxval)
				NotGridMenuSlider:SetValue(NotGridOptions[this.slider.key])
				NotGridMenuSlider.currval:SetText(NotGridOptions[this.slider.key])
				NotGridMenuSliderContainer:ClearAllPoints()
				NotGridMenuSliderContainer:SetPoint("TOPRIGHT",this,"TOPLEFT",-20,0)
				NotGridMenuSliderContainer:Show()
				--make sure editbox is hidden
				NotGridMenuEditBoxContainer:Hide()
			else
				NotGridMenuSliderContainer:Hide()
				NotGridMenuEditBoxContainer:Hide()
			end
		end)
	end
end

------------
-- Slider --
------------

function NotGrid:InitializeSlider()
	local f = CreateFrame("Frame","NotGridMenuSliderContainer",NotGridOptionsMenu) -- slider container
	f:SetWidth(160)
	f:SetHeight(50)
	f:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
	f:SetBackdropColor(0,0,0,1)
	--f:SetBackdropBorderColor(unpack(o.unitbordercolor))
	f:SetPoint("CENTER",UIParent,"CENTER",-100,0)
	f:Hide()

	f.s = CreateFrame('Slider', 'NotGridMenuSlider', f, 'OptionsSliderTemplate') -- its a child of the container frame
	f.s:SetPoint("CENTER",0,0)
	f.s:SetValueStep(1)

	f.s:SetScript("OnValueChanged", function()
		if GetMouseFocus() == this then -- only if the mouse/player is doing the adjustments. Otherwise it does adjustements when it shows/setminmax values etc..
			NotGridOptions[this.key] = arg1
			this.currval:SetText(arg1)
			NotGridOptionChange()
		end
	end)

	f.s.currval = f.s:CreateFontString('$parentcurrval', "ARTWORK", "GameFontHighlightSmall")
	f.s.currval:SetPoint("TOP",0,8)
	f.s.currval:SetText("50")
end

-------------
-- EditBox --
-------------

function NotGrid:InitializeEditBox()
	local f = CreateFrame("Frame", "NotGridMenuEditBoxContainer",NotGridOptionsMenu)
	f:SetWidth(160)
	f:SetHeight(50)
	f:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }})
	f:SetBackdropColor(0,0,0,1)
	--f:SetBackdropBorderColor(unpack(o.unitbordercolor))
	f:SetPoint("CENTER",UIParent,"CENTER",-100,0)
	f:Hide()

	f.e = CreateFrame("EditBox", "NotGridMenuEditBox", f)
	f.e:SetFontObject("GameFontHighlight")
	f.e:SetWidth(140)
	f.e:SetHeight(40)
	f.e:SetAutoFocus(false)
	f.e:SetPoint("CENTER",0,0)
	f.e:SetText("hey")
	f.e:EnableKeyboard()
	f.e:SetScript("OnEnterPressed", function()
		this:ClearFocus()
		NotGridOptions[this.key] = this:GetText()
		NotGridOptionChange()
	end)
	f.e:SetScript("OnEscapePressed", function()
		this:ClearFocus()
		this:SetText(NotGridOptions[this.key])
	end)
end

-----------------
-- color funcs --
-----------------

local workingcolorswatch -- need to set these for reasons
local workingcolorkey
function notgrid_clickcolor()
	workingcolorswatch = this.tex
	workingcolorkey = this.color.key
	--DEFAULT_CHAT_FRAME:AddMessage(workingcolorkey.." "..workingcolorswatch:GetName())
	local r, g, b, a = unpack(NotGridOptions[workingcolorkey])
	ColorPickerFrame.previousValues = {r, g, b, a}
	ColorPickerFrame.func = notgrid_colorpickerhandle
	ColorPickerFrame.opacityFunc = notgrid_colorpickerhandle
	ColorPickerFrame.cancelFunc = notgrid_setcolor
	if a then
		ColorPickerFrame.opacity = a
		ColorPickerFrame.hasOpacity = true -- opacity prob has own func
	else
		ColorPickerFrame.hasOpacity = false
	end
	ColorPickerFrame:SetColorRGB(r, g, b)
	ColorPickerFrame:Show()
	--frame:Hide()
end

function notgrid_colorpickerhandle()
	local a = OpacitySliderFrame:GetValue()
	local r,g,b = ColorPickerFrame:GetColorRGB()
	notgrid_setcolor({r,g,b,a})
end

function notgrid_setcolor(vals) -- can be current vals or prevvals
	workingcolorswatch:SetTexture(unpack(vals))
	NotGridOptions[workingcolorkey] = vals -- table of colorvals
	NotGridOptionChange()
end

-------------------------
-- Generic Config Loop --
-------------------------

function NotGridOptionChange()
	for _,f in NotGrid.UnitFrames do
		NotGrid:ConfigUnitFrame(f)
		if f.unit then
			NotGrid:UpdateUnitFrame(nil, f.name)
			f:Show()
		end
		NotGrid:PositionFrames()
	end
end