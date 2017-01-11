

    if tonumber(GetCVar'modUnitFrame') == 0 then return end

    local orig = {}

    for _, v in pairs({ PlayerFrame, TargetFrame, PartyMemberFrame1 }) do
        v:SetUserPlaced(true) v:SetMovable(true) v:EnableMouse(true)
        v:SetScript('OnDragStart', function() if IsShiftKeyDown() then this:StartMoving() end end)
        v:SetScript('OnDragStop',  function() this:StopMovingOrSizing() end)
        v:RegisterForDrag'LeftButton'
    end

    SLASH_RESETUF1 = '/reset'
    SlashCmdList['RESETUF'] = function(arg)
        for _, v in pairs({ PlayerFrame, TargetFrame, PartyFrame1 }) do
            v:SetUserPlaced(false)
            v:ClearAllPoints()
        end
        PlayerFrame:SetPoint('TOPLEFT', -19, -4)
        TargetFrame:SetPoint('TOPLEFT', 250, -4)
        PartyMemberFrame1:SetPoint('TOPLEFT', 10, -128)
    end

    orig.UnitFrame_OnEnter = UnitFrame_OnEnter
    function UnitFrame_OnEnter()
        orig.UnitFrame_OnEnter()
        local name = this:GetName()
        local unit = this.unit

        if SHOW_NEWBIE_TIPS == '1'  -- MOVE HINT
        and (name == 'TargetFrame' or name == 'PartyMemberFrame1') then
            GameTooltip:AddLine('Shift + Drag to move '..name..'.', .3, 1, .6)
            GameTooltip:Show()
        end
    end

    --
