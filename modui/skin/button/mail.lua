

    local slot = SendMailPackageButton:GetRegions()
    slot:ClearAllPoints()
    slot:SetPoint('TOPLEFT', SendMailPackageButton)
    slot:SetPoint('BOTTOMRIGHT', SendMailPackageButton)

    modSkin(SendMailPackageButton, 18)
    modSkinPadding(SendMailPackageButton, 2)
    modSkinColor(SendMailPackageButton, .2, .2, .2)

    modSkin(OpenMailMoneyButton, 18)
    modSkinPadding(OpenMailMoneyButton, 2)
    modSkinColor(OpenMailMoneyButton, .2, .2, .2)

    modSkin(OpenMailPackageButton, 18)
    modSkinPadding(OpenMailPackageButton, 2)
    modSkinColor(OpenMailPackageButton, .2, .2, .2)

    for i = 1, 7 do
        local bu = _G['MailItem'..i]
        local tx = _G['MailItem'..i..'ButtonIcon']
        local ic = bu:GetRegions()
        if bu then
            local f = CreateFrame('Frame', nil, bu)
            f:SetPoint('TOPLEFT', ic, 0, 0) f:SetPoint('BOTTOMRIGHT', ic, 0, 6)
            modSkin(f, 18)
            modSkinPadding(f, 1)
            modSkinColor(f, .2, .2, .2)
            tx:SetPoint('TOPLEFT', f)
            tx:SetPoint('BOTTOMRIGHT', f)
        end
    end

    --
