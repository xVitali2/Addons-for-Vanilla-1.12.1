

                                        -- UIPARENT_MANAGED_FRAME_POSITIONS ALTERNATIVE
                                        -- FOR HORIZONTAL BARS
    CONTAINER_OFFSET_Y = 90
    local orig = {}

    local unhook = function()
        if tonumber(GetCVar'modAction') == 0 then
            for _, v in pairs({
                'CastingBarFrame',
                'MultiBarLeft', 'MultiBarRight',
                'StanceBarFrame', 'PossessBarFrame', 'PETACTIONBAR_YPOS',
                'CONTAINER_OFFSET_X', 'CONTAINER_OFFSET_Y'
            }) do
                UIPARENT_MANAGED_FRAME_POSITIONS[v] = nil
            end
        else
            for _, v in pairs({
                'MultiBarLeft', 'MultiBarRight',
                'StanceBarFrame', 'PossessBarFrame', 'PETACTIONBAR_YPOS',
            }) do
                UIPARENT_MANAGED_FRAME_POSITIONS[v] = nil
            end
            UIPARENT_MANAGED_FRAME_POSITIONS['CONTAINER_OFFSET_X'] = {baseX = 0, rightLeft = 90, rightRight = 45, isVar = 'xAxis'}
            UIPARENT_MANAGED_FRAME_POSITIONS['CONTAINER_OFFSET_Y'] = {baseY = 70, bottomEither = 27, bottomRight = 0, reputation = 9, isVar = 'yAxis', pet = 23}
        end
    end

    local movebars = function()          -- ACTIONBARS
        for _, v in pairs({ _G['ShapeshiftButton1'],
                            _G['PetActionButton1'],
                            _G['StanceButton1'] }) do
            v:ClearAllPoints()
            if SHOW_MULTI_ACTIONBAR_3 then
                v:SetPoint('BOTTOMLEFT', MultiBarRightButton1, 'TOPLEFT', 24, 8)
            elseif SHOW_MULTI_ACTIONBAR_1 and not SHOW_MULTI_ACTIONBAR_3 then
                v:SetPoint('BOTTOMLEFT', MultiBarBottomLeftButton1, 'TOPLEFT', 24, 8)
            else
                v:SetPoint('BOTTOMLEFT', ActionButton1, 'TOPLEFT', 24, 18)
            end
        end
        for i = 1, 12 do
            local bu = _G['MultiBarRightButton'..i]
            bu:ClearAllPoints()
            if i == 1 then
                bu:SetFrameStrata'LOW'
                bu:SetPoint('BOTTOM', MultiBarBottomLeftButton1, 'TOP', 0, 8)
            else
                local previous = _G['MultiBarRightButton'..i - 1]
                bu:SetPoint('LEFT', previous, 'RIGHT', 6, 0)
            end
        end
        for i = 1, 12 do
            local bu = _G['MultiBarLeftButton'..i]
            bu:ClearAllPoints()
            if i == 1 then
                bu:SetFrameStrata'LOW'
                bu:SetPoint('LEFT', MultiBarRightButton12, 'RIGHT', 12, 0)
            else
                local previous = _G['MultiBarLeftButton'..i - 1]
                bu:SetPoint('LEFT', previous, 'RIGHT', 6, 0)
            end
        end
    end

    local defaultbars = function()
        for _, v in pairs({ _G['ShapeshiftButton1'],
                            _G['PetActionButton1'],
                            _G['StanceButton1'] }) do
            v:ClearAllPoints()
            if SHOW_MULTI_ACTIONBAR_1 then
                v:SetPoint('BOTTOMLEFT', MultiBarBottomLeftButton1, 'TOPLEFT', 24, 8)
            else
                v:SetPoint('BOTTOMLEFT', ActionButton1, 'TOPLEFT', 24, 18)
            end
        end
        for i = 1, 12 do
            local bu = _G['MultiBarRightButton'..i]
            bu:ClearAllPoints()
            if i == 1 then
                bu:SetPoint('BOTTOMRIGHT', UIParent, -16, 520)
            else
                local previous = _G['MultiBarRightButton'..i - 1]
                bu:SetPoint('TOP', previous, 'BOTTOM', 0, -6)
                if i == 12 then bu:SetFrameStrata'LOW' end
            end
        end
        for i = 1, 12 do
            local bu = _G['MultiBarLeftButton'..i]
            bu:ClearAllPoints()
            if i == 1 then
                bu:SetPoint('TOPRIGHT', MultiBarRightButton1, 'TOPLEFT', -5, 0)
            else
                local previous = _G['MultiBarLeftButton'..i - 1]
                bu:SetPoint('TOP', previous, 'BOTTOM', 0, -6)
                if i == 12 then bu:SetFrameStrata'LOW' end
            end
        end
    end

    local movetip = function()           -- TOOLTIP
        if  tonumber(GetCVar'modTooltip') == 1 then
            if  tonumber(GetCVar'modAction') == 0 then
                local parent    = _G['modTooltipParent']
                local type      = GameTooltip:GetAnchorType()
                local x = {parent:GetPoint()}
                local i = 1
                GameTooltip:SetBackdropColor(0, 0, 0)
                GameTooltip:SetBackdropBorderColor(.1, .1, .1, 1)
                if  type == 'ANCHOR_NONE' then
                    GameTooltip:ClearAllPoints()
                    GameTooltip:SetPoint('BOTTOMRIGHT', parent)
                    if x[4] == -10 and x[5] == 140 then
                        parent:ClearAllPoints()
                        if SHOW_MULTI_ACTIONBAR_3 then
                            parent:SetPoint('BOTTOMRIGHT', MultiBarLeftButton12, 'TOPRIGHT', 3, 8)
                        elseif SHOW_MULTI_ACTIONBAR_2 and not SHOW_MULTI_ACTIONBAR_3 then
                            parent:SetPoint('BOTTOMRIGHT', MultiBarBottomRightButton12, 'TOPRIGHT', 3, 8)
                        else
                            parent:SetPoint('BOTTOMRIGHT', MainMenuBarBackpackButton, 'TOPRIGHT', 3, 16)
                        end
                    end
                    if  tonumber(GetCVar'modShowTooltipCursor') == 1 then
                        GameTooltip:SetOwner(UIParent, 'ANCHOR_CURSOR')
                    end
                    while (ContainerFrame1.bags[i] and tonumber(GetCVar'modOneBag') == 1) do
                        GameTooltip:SetOwner(UIParent, 'ANCHOR_CURSOR')
                        i = i + 1
                    end
                end
            else
                local type = GameTooltip:GetAnchorType()
                if type == 'ANCHOR_NONE' then
                    GameTooltip:ClearAllPoints()
                    GameTooltip:SetPoint('BOTTOMRIGHT', UIParent, -CONTAINER_OFFSET_X - 18, CONTAINER_OFFSET_Y)
                end
            end
        end
    end

    local moveCB = function()          -- CASTBAR
        local y
        local cv = tonumber(GetCVar'modPlayerCastbar')
        if SHOW_MULTI_ACTIONBAR_3 or SHOW_MULTI_ACTIONBAR_4 then
            y = 160
        elseif  (SHOW_MULTI_ACTIONBAR_1 or SHOW_MULTI_ACTIONBAR_2)
        and not (SHOW_MULTI_ACTIONBAR_3 or SHOW_MULTI_ACTIONBAR_4)  then
            y = 120
        else
            y = 80
        end
        if  cv == 0 then
            CastingBarFrame:SetPoint('BOTTOM', UIParent, 0, y)
        end
    end

    local moveTimer = function()        -- QUEST TIMER
        QuestTimerFrame:ClearAllPoints()
        QuestTimerFrame:SetPoint('TOP', MinimapCluster, 'BOTTOM', 10, -6)
    end

    local moveKeyRing = function()
        local f  = _G['ContainerFrame1']
        KeyRingButton:SetParent(f)
        KeyRingButton:SetScale(.875)
        KeyRingButton:ClearAllPoints() KeyRingButton:SetPoint('TOPRIGHT', f, -38, -12)
        KeyRingButton:SetFrameLevel(5)
    end

    orig.GameTooltip_SetDefaultAnchor  = GameTooltip_SetDefaultAnchor
    orig.updateContainerFrameAnchors   = updateContainerFrameAnchors
    orig.UIParent_ManageFramePositions = UIParent_ManageFramePositions

    function updateContainerFrameAnchors()
        orig.updateContainerFrameAnchors()
        if tonumber(GetCVar'modOneBag') == 0 then moveKeyRing() end
        local i = 1
        CONTAINER_WIDTH = 210
        CONTAINER_OFFSET_Y = tonumber(GetCVar'modAction') == 0 and 144 or 98
        while ContainerFrame1.bags[i] do
            local f  = _G[ContainerFrame1.bags[i]]
            local x = {f:GetPoint()}
            f:SetWidth(192)
            if i == 1 and x[5] == CONTAINER_OFFSET_Y then
                f:SetPoint('BOTTOMRIGHT', f:GetParent(), -CONTAINER_OFFSET_X - 16, CONTAINER_OFFSET_Y)
            end
            i = i + 1
        end
    end

                                            -- HOOK
    local t = CreateFrame('Frame', nil, GameTooltip) t:SetAllPoints()
    t:SetScript('OnShow', movetip)
    moveTimer()

    function GameTooltip_SetDefaultAnchor(tooltip, parent)
        orig.GameTooltip_SetDefaultAnchor(tooltip, parent)
        if tonumber(GetCVar'modAction') == 0 then movetip(parent) end
    end

    function UIParent_ManageFramePositions()
        orig.UIParent_ManageFramePositions()
        if tonumber(GetCVar'modAction') == 0 then
            movebars()
            moveCB()
            moveTimer()
            for _, v in pairs({ SlidingActionBarTexture0, SlidingActionBarTexture1,
                                ShapeshiftBarLeft, ShapeshiftBarMiddle, ShapeshiftBarRight, }) do
                if v then v:Hide() end
            end
        else
            defaultbars()
        end
    end

    --
