

    local orig = {}

    orig.BuffButton_Update           = BuffButton_Update
    orig.BuffButtons_UpdatePositions = BuffButtons_UpdatePositions

    for i = 0, 23 do                    -- AURA
        local bu = _G['BuffButton'..i]
        local du = _G['BuffButton'..i..'Duration']
        bu:SetNormalTexture''
        modSkin(bu, 16)
        modSkinPadding(bu, 2)
        modSkinColor(bu, .2, .2, .2)
        du:ClearAllPoints() du:SetPoint('CENTER', bu, 'BOTTOM', 2, -9)
    end

    for i = 1, 2 do
        local bu = _G['TempEnchant'..i]
        local bo = _G['TempEnchant'..i..'Border']
        local du = _G['TempEnchant'..i..'Duration']
        bu:SetNormalTexture''
        bo:SetTexture''
        modSkin(bu, 16)
        modSkinPadding(bu, 2)
        modSkinColor(bu, 1, 0, 1)
        du:SetJustifyH'LEFT'
        du:ClearAllPoints() du:SetPoint('CENTER', bu, 'BOTTOM', 2, -9)
    end

    function BuffButton_Update()
        orig.BuffButton_Update()
        local name = this:GetName()
        local d = _G[name..'Border']
        if d then
            local r, g, b = d:GetVertexColor()
            modSkinColor(this, r*.7, g*.7, b*.7)
        end
    end

    function BuffButtons_UpdatePositions()
        if SHOW_BUFF_DURATIONS == '1' then
            BuffButton8:SetPoint('TOP', TempEnchant1, 'BOTTOM', 0, -25)
            BuffButton16:SetPoint('TOPRIGHT', TemporaryEnchantFrame, "TOPRIGHT", 0, -120)
        else
            BuffButton8:SetPoint('TOP', TempEnchant1, 'BOTTOM', 0, -5)
            BuffButton16:SetPoint('TOPRIGHT', TemporaryEnchantFrame, 0, -70)
        end
    end

    --
