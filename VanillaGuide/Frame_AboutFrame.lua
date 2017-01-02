--[[--------------------------------------------------
----- VanillaGuide -----
------------------
Frame_AboutFrame.lua
Authors: mrmr
Version: 1.04.2
------------------------------------------------------
Description: 
	    About Frame Object
    1.00
		-- Initial Ace2 release
	1.99a
		-- Ally addition starter version
    1.03
		-- No Changes. Just adjusting "version".
    		1.99x for a beta release was a weird choise.
	1.04.1
		-- About Frame object
	1.04.2
		-- no changes in here for this revision
------------------------------------------------------
Connection:
--]]--------------------------------------------------


--local VGuide = VGuide
Dv(" VGuide Frame_AboutFrame.lua Start")

objAboutFrame = {}
objAboutFrame.__index = objAboutFrame

--function objAboutFrame:new(fParent, tTexture, sCharInfo)
function objAboutFrame:new(fParent, tTexture, oSettings)
	fParent = fParent or nil
	local obj = {}
    setmetatable(obj, self)

    --local version = GetAddOnMetadata("VanillaGuide", "Version")
    local version = GetAddOnMetadata("VanillaGuide", "Version")

	local sAboutTextHorde = "|cccff1919Vanilla|ccceeeeeeGuide" ..
		" |ccca1a1a1v|ccc4a4aa1" ..	version .. "|r" ..
		"\n\n\n|ccca1a1a1A 'remake' of the original|r" ..
		"\n|cccff1919J|ccceeeeeeoana`s |cccff1919Horde|ccceeeeee Leveling Guide.|r" ..
		"\n|ccca1a1a1in an in-game addon.\n" ..
		"\n                           Made in |ccca11919mrmr|r|ccca1a1a1!|r"
	local sAboutTextAlliance = "|cccff1919Vanilla|ccceeeeeeGuide" .. 
		" |ccca1a1a1v|ccc4a4aa1" .. version .. "|r" ..
		"\n\n\n|ccca1a1a1A 'remake' of the original|r" ..
		"\n|ccc3939aaB|ccceeeeeerian |ccc3939aaKopps|ccceeeeee Leveling Guide.|r" ..
		"\n|ccca1a1a1in an in-game addon.\n" ..
		"\n                           Made in |ccca11919mrmr|r|ccca1a1a1!|r"	
	
	local sAboutText = ""

	local tCharInfo = oSettings:GetSettingsCharInfo()

	if tCharInfo.Faction == "Horde" then
		sAboutText = sAboutTextHorde
	else
		sAboutText = sAboutTextAlliance
	end

	local function Render_AF(fParent, tTexture, sName)
		local frame = CreateFrame("Frame", sName)
		frame:SetFrameStrata("TOOLTIP")
		frame:SetFrameLevel(8)
		frame:SetWidth(195)
		frame:SetHeight(125)
		frame:SetScale(1)
		frame:SetPoint("BOTTOMLEFT", fParent, "TOPLEFT", 0, 10)
		frame:SetBackdrop(tTexture.BACKDROP)
		frame:SetBackdropColor(.01, .01, .01, .99)
		frame:SetMovable(true)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)
		frame:RegisterForDrag("LeftButton")
		return frame
	end
	local function Render_AFCloseButton(tParent, tTexture, sName)
		local btn = CreateFrame("Button", sName, tParent)
		btn:SetWidth(16)
		btn:SetHeight(16)
		btn:SetNormalTexture(tTexture.B_CLOSE.NORMAL)
		btn:SetPushedTexture(tTexture.B_CLOSE.PUSHED)
		btn:SetHighlightTexture(tTexture.B_CLOSE.HIGHLIGHT)
		btn:SetPoint("TOPRIGHT", tParent, "TOPRIGHT", -5, -5)
		return btn
	end
	local function Render_AFLabel(tParent, sName, sText)
		local fs = tParent:CreateFontString(sName, "ARTWORK", "GameFontNormalSmall")
		fs:SetPoint("CENTER", tParent, "CENTER", 0, 0)
		fs:SetTextColor(.91, .79, .11, 1)
		fs:SetJustifyH("CENTER")
		fs:SetJustifyV("CENTER")
		fs:SetText(sText)
		return fs
	end

	-------------------------------
	--- Creation
	-------------------------------
	obj.tWidgets = {}

	-- About Frame
	obj.tWidgets.frame_AboutFrame = Render_AF(fParent, tTexture, "VG_AboutFrame")
	obj.tWidgets.button_CloseButton = Render_AFCloseButton(obj.tWidgets.frame_AboutFrame, tTexture, nil)
	obj.tWidgets.fs_AboutFrame = Render_AFLabel(obj.tWidgets.frame_AboutFrame, nil, sAboutText)

	-------------------------------
	--- UI Events Handling
	-------------------------------
	obj.tWidgets.frame_AboutFrame:SetScript("OnMouseDown", function()
		if arg1 == "LeftButton" and not this.isMoving then
			this:StartMoving();
			this.isMoving = true;
		end
	end)
	obj.tWidgets.frame_AboutFrame:SetScript("OnMouseUp", function()
		if arg1 == "LeftButton" and this.isMoving then
			this:StopMovingOrSizing();
			this.isMoving = false;
		end
	end)
	obj.tWidgets.frame_AboutFrame:SetScript("OnHide", function()
		if this.isMoving then
			this:StopMovingOrSizing();
			this.isMoving = false;
		end
	end)
	obj.tWidgets.button_CloseButton:SetScript("OnClick", function()
		local frame = this:GetParent()
		frame:Hide()
	end)
	-------------------------------
	--- Initialization
	-------------------------------
	obj.tWidgets.frame_AboutFrame:Hide()
	--obj.tWidgets.frame_AboutFrame:Show()

	obj.ShowFrame = function(self)
		local f = obj.tWidgets.frame_AboutFrame
		if not f:IsVisible() then
			f:Show()
		end
	end

	obj.HideFrame = function(self)
		local f = obj.tWidgets.frame_AboutFrame
		if f:IsVisible() then
			f:Hide()
		end
	end

    return obj
end

Dv(" VGuide Frame_AboutFrame.lua End")