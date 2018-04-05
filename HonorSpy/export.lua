function HonorSpy:ExportCSV()
	local _G = getfenv(0)
	local PaneBackdrop  = {
		bgFile = [[Interface\DialogFrame\UI-DialogBox-Background]],
		edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]],
		tile = true, tileSize = 16, edgeSize = 16,
		insets = { left = 3, right = 3, top = 5, bottom = 3 }
	}

	-- If we haven't created these frames, then lets do so now.
	if (not _G["ARLCopyFrame"]) then
		local frame = CreateFrame("Frame", "ARLCopyFrame", UIParent)
		tinsert(UISpecialFrames, "ARLCopyFrame")
		frame:SetBackdrop(PaneBackdrop)
		frame:SetBackdropColor(0,0,0,1)
		frame:SetWidth(500)
		frame:SetHeight(400)
		frame:SetPoint("CENTER", UIParent, "CENTER")
		frame:SetFrameStrata("DIALOG")
		
		local scrollArea = CreateFrame("ScrollFrame", "ARLCopyScroll", frame, "UIPanelScrollFrameTemplate")
		scrollArea:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -30)
		scrollArea:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 8)
		
		local editBox = CreateFrame("EditBox", "ARLCopyEdit", frame)
		editBox:SetMultiLine(true)
		editBox:SetMaxLetters(99999)
		editBox:EnableMouse(true)
		editBox:SetAutoFocus(false)
		editBox:SetFontObject(ChatFontNormal)
		editBox:SetWidth(400)
		editBox:SetHeight(270)
		editBox:SetScript("OnEscapePressed", function() frame:Hide() end)
		
		scrollArea:SetScrollChild(editBox)
		
		local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
		close:SetPoint("TOPRIGHT",frame,"TOPRIGHT")
	end

	local exportwindow = _G["ARLCopyFrame"]
	local editbox = _G["ARLCopyEdit"]

	local data = HonorSpyStandings:BuildStandingsTable();
	local text = "";
	for _, row in pairs(data) do
		text = ""
		for _, value in pairs(row) do
			if (type(value) == "number") then
				if (value < 1486253610) then
					text = text..string.format("%d", value)..","
				else
					text = text..date("!%x %X", value)..","
				end
			elseif (type(value) == "string") then
				text = text..value..","
			end
    	end
		editbox:Insert(text.."\n")
	end

	editbox:HighlightText(0)
	exportwindow:Show()
end