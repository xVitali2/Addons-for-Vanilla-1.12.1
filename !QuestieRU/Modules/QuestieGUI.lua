---------------------------------------------------------------------------------------------------
-- Minimap button creation is in a function so that it can be called upon the ADDON_LOADED event,
-- when SavedVariables (position) are available.
---------------------------------------------------------------------------------------------------
function Questie.CreateMinimapButton()
Questie.minimapButton = CreateFrame('Button', 'QuestieMinimap', Minimap)
if (QuestieMinimapPosition == nil) or type(QuestieMinimapPosition) == "number" then
	QuestieMinimapPosition = {}
	QuestieMinimapPosition.x, QuestieMinimapPosition.y = {-180,0}
end

Questie.minimapButton:SetMovable(true)
Questie.minimapButton:EnableMouse(true)
Questie.minimapButton:SetFrameStrata('LOW')
Questie.minimapButton:SetWidth(30)
Questie.minimapButton:SetHeight(30)
Questie.minimapButton:SetFrameLevel(9)
Questie.minimapButton:SetHighlightTexture('Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight')
Questie.minimapButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT",QuestieMinimapPosition.x,QuestieMinimapPosition.y)
Questie.minimapButton:RegisterForDrag("RightButton")
Questie.minimapButton.draggingFrame = CreateFrame("Frame", "QuestieMinimapDragging", Questie.minimapButton)
Questie.minimapButton.draggingFrame:Hide();
Questie.minimapButton.draggingFrame:SetScript("OnUpdate", function()
---------by CFM
	local xpos,ypos = GetCursorPosition()
	local xmin,ymin,xm,ym = Minimap:GetLeft(), Minimap:GetBottom(), Minimap:GetRight(), Minimap:GetTop()
	local scale = Minimap:GetEffectiveScale()
	local xdelta, ydelta = (xm - xmin + 5)/2*scale, (ym - ymin + 5) /2 * scale
	xpos = xmin*scale-xpos+xdelta
	ypos = ypos-ymin*scale-ydelta
	local angle = math.deg(math.atan2(ypos,xpos))
	local x,y =0,0
	if (Squeenix or (simpleMinimap_Skins and simpleMinimap_Skins:GetShape() == "square")
		or (pfUI and pfUI.minimap)) then
		x = math.max(-xdelta-10, math.min((xdelta*1.5) * cos(angle), xdelta+10))
		y = math.max(-ydelta-10, math.min((ydelta*1.5) * sin(angle), ydelta+10))
	else
		x= cos(angle)*xdelta
		y= sin(angle)*ydelta
	end
	local sc= this:GetEffectiveScale()
	QuestieMinimapPosition.x = (xdelta-x)/sc-17
	QuestieMinimapPosition.y = (y-ydelta)/sc+17
	Questie.minimapButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT", QuestieMinimapPosition.x,QuestieMinimapPosition.y)---------by CFM
end)
Questie.minimapButton:SetScript("OnDragStart", function()
    this:LockHighlight();
    Questie.minimapButton.draggingFrame:Show();
end)
Questie.minimapButton:SetScript("OnDragStop", function()
    this:UnlockHighlight();
    Questie.minimapButton.draggingFrame:Hide();
end)

Questie.minimapButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
Questie.minimapButton:SetScript("OnClick", function()
    if ( arg1 == "LeftButton" ) then
            if not QuestieOptionsForm:IsVisible() then
                Questie:OptionsForm_Display()
            else
                QuestieOptionsForm:Hide()
            end
        end
        if (arg1 == "RightButton") then
        Questie:Toggle()
    end
end)
Questie.minimapButton:SetScript("OnEnter", function()
        GameTooltip:SetOwner(Questie.minimapButton, "ANCHOR_BOTTOMLEFT")
        GameTooltip:ClearLines()
        GameTooltip:SetText("QuestieRU\n\n")---------by CFM
        GameTooltip:AddDoubleLine("<ЛКМ>", "Открыть настройки", 1,1,1, 1,1,0)---------by CFM
        GameTooltip:AddDoubleLine("<ПКМ>", "Переключить значки заметок", 1,1,1, 1,1,0)---------by CFM
        GameTooltip:Show()
end)
Questie.minimapButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
end)

Questie.minimapButton.overlay = Questie.minimapButton:CreateTexture(nil, 'OVERLAY')
Questie.minimapButton.overlay:SetWidth(50)
Questie.minimapButton.overlay:SetHeight(50)
Questie.minimapButton.overlay:SetTexture('Interface\\Minimap\\MiniMap-TrackingBorder')
Questie.minimapButton.overlay:SetPoint('TOPLEFT', 0,0)
Questie.minimapButton.icon = Questie.minimapButton:CreateTexture(nil, 'BACKGROUND')
Questie.minimapButton.icon:SetWidth(20)
Questie.minimapButton.icon:SetHeight(20)
Questie.minimapButton.icon:SetTexture('Interface\\AddOns\\!QuestieRU\\Icons\\minimapIcon')  ---------by CFM
Questie.minimapButton.icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
Questie.minimapButton.icon:SetPoint('CENTER',1,1)
end