local emptyBar = {}
local L = LunaUF.L
LunaUF:RegisterModule(emptyBar, "emptyBar", L["Empty Bar"])

function emptyBar:OnEnable(frame)
	if not frame.emptyBar then
		frame.emptyBar = CreateFrame("Frame", nil, frame)
		frame.fontstrings["emptyBar"] = {
			["left"] = frame.emptyBar:CreateFontString(nil, "ARTWORK"),
			["center"] = frame.emptyBar:CreateFontString(nil, "ARTWORK"),
			["right"] = frame.emptyBar:CreateFontString(nil, "ARTWORK"),
		}
		for align,fontstring in pairs(frame.fontstrings["emptyBar"]) do
			fontstring:SetFont(LunaUF.defaultFont, 14)
			fontstring:SetShadowColor(0, 0, 0, 1.0)
			fontstring:SetShadowOffset(0.80, -0.80)
			fontstring:SetJustifyH(string.upper(align))
			fontstring:SetAllPoints(frame.emptyBar)
		end
	end
end

function emptyBar:OnDisable(frame)

end

function emptyBar:FullUpdate(frame)
	for align,fontstring in pairs(frame.fontstrings["emptyBar"]) do
		fontstring:SetFont("Interface\\AddOns\\LunaUnitFrames\\media\\fonts\\"..LunaUF.db.profile.font..".ttf", LunaUF.db.profile.units[frame.unitGroup].tags.bartags["emptyBar"].size)
		fontstring:ClearAllPoints()
		fontstring:SetHeight(frame.emptyBar:GetHeight())
		if align == "left" then
			fontstring:SetPoint("TOPLEFT", frame.emptyBar, "TOPLEFT", 2, 0)
			fontstring:SetWidth(frame.emptyBar:GetWidth()-4)
		elseif align == "center" then
			fontstring:SetAllPoints(frame.emptyBar)
			fontstring:SetWidth(frame.emptyBar:GetWidth())
		else
			fontstring:SetPoint("TOPRIGHT", frame.emptyBar, "TOPRIGHT", -2 , 0)
			fontstring:SetWidth(frame.emptyBar:GetWidth()-4)
		end
	end
end

function emptyBar:SetBarTexture(frame,texture)

end