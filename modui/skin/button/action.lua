

    for i = 1, 12 do
        for _, v in pairs({
            _G['ActionButton'..i],
            _G['MultiBarRightButton'..i],
            _G['MultiBarLeftButton'..i],
            _G['MultiBarBottomLeftButton'..i],
            _G['MultiBarBottomRightButton'..i],
            _G['BonusActionButton'..i],}) do
            modSkin(v, 18)
            modSkinPadding(v, 2)
            modSkinColor(v, .2, .2, .2)
            v:GetPushedTexture():SetTexture''
            v:GetCheckedTexture():SetTexture''
        end

        for _, v in pairs({
            _G['MultiBarBottomLeftButton1'],
            _G['MultiBarBottomRightButton12'] }) do
            v:SetFrameStrata'LOW'
        end

        for _, v in pairs({
            _G['ActionButton'..i..'NormalTexture'],
            _G['MultiBarLeftButton'..i..'NormalTexture'],
            _G['MultiBarRightButton'..i..'NormalTexture'],
            _G['MultiBarBottomLeftButton'..i..'NormalTexture'],
            _G['MultiBarBottomRightButton'..i..'NormalTexture'],
            _G['BonusActionButton'..i..'NormalTexture'],}) do
            v:SetAlpha(0)
        end

        for _, v in pairs({
            _G['ActionButton'..i..'Cooldown'],
            _G['MultiBarLeftButton'..i..'Cooldown'],
            _G['MultiBarRightButton'..i..'Cooldown'],
            _G['MultiBarBottomLeftButton'..i..'Cooldown'],
            _G['MultiBarBottomRightButton'..i..'Cooldown'],}) do v:SetFrameLevel(4)
        end

        _G['BonusActionButton'..i..'Cooldown']:SetFrameLevel(6)
    end

    for i = 1, 10 do
        local bu = _G['ShapeshiftButton'..i]
        modSkin(bu, 16)
        modSkinPadding(bu, 2)
        modSkinColor(bu, .2, .2, .2)
        bu:GetNormalTexture():SetTexture''
        bu:GetPushedTexture():SetTexture''
        bu:GetCheckedTexture():SetTexture''

        local bu = _G['PetActionButton'..i]
        modSkin(bu, 16)
        modSkinPadding(bu, 2)
        modSkinColor(bu, .2, .2, .2)
        bu:GetNormalTexture():SetTexture''
        bu:GetPushedTexture():SetTexture''
        bu:GetCheckedTexture():SetTexture''

        local a = _G['PetActionButton'..i..'AutoCast']
        a:SetScale(1) a:SetFrameLevel(3)

        local a = _G['PetActionButton'..i..'AutoCastable']
        a:SetWidth(50) a:SetHeight(50)
    end

    local bu = modmenu
    modSkin(bu, 18)
    modSkinPadding(bu, 4)
    modSkinColor(bu, .2, .2, .2)

    bu:SetScript('OnEnter', function()
        if not _G['modui_options']:IsShown() then modSkinColor(bu, 1, 175/255, 155/255) end
    end)
    bu:SetScript('OnLeave', function()
        if not _G['modui_options']:IsShown() then modSkinColor(bu, .2, .2, .2) end
    end)

    --
