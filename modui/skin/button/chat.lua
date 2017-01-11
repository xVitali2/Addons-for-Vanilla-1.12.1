

    local bu = ChatFrameMenuButton
    modSkin(bu, 15)
    modSkinPadding(bu, -3)
    modSkinColor(bu, .2, .2, .2)

    for i = 1, 7 do
        local bu = _G['ChatFrame'..i..'BottomButton']
        modSkin(bu, 15)
        modSkinPadding(bu, -3)
        modSkinColor(bu, .2, .2, .2)
    end

    --
