

    for i = 1, 5 do
        local bu = _G['TargetFrameBuff'..i]
        modSkin(bu, 16)
        modSkinPadding(bu, 3)
        modSkinColor(bu, .2, .2, .2)
    end

    for i = 1, 16 do
        local bu = _G['TargetFrameDebuff'..i]
        modSkin(bu, 16)
        modSkinPadding(bu, 3)
        modSkinColor(bu, 1, 0, 0)
    end

    --
