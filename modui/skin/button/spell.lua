

    for i = 1, 4 do
        local bu = _G['SpellBookSkillLineTab'..i]
        if bu then
            modSkin(bu, 20)
            modSkinColor(bu, .2, .2, .2)
            modSkinPadding(bu, 2)
            modSkinDraw(bu, 'OVERLAY')

        end
    end

    for i = 1, 12 do
        local bu = _G['SpellButton'..i]
        local ic = _G['SpellButton'..i..'IconTexture']
        if bu then
            modSkin(bu, 20)
            modSkinColor(bu, .2, .2, .2)
            modSkinPadding(bu, 3.5)
            modSkinDraw(bu, 'OVERLAY')
            ic:SetTexCoord(.1, .9, .1, .9)
        end
    end

    --
