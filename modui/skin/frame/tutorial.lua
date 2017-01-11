

    modSkin(TutorialFrame, 18)
    modSkinPadding(TutorialFrame, -1)
    modSkinColor(TutorialFrame, .15, .15, .15)

    for i = 1,10 do
        local bu = _G['TutorialFrameAlertButton'..i]
        modSkin(bu, 18)
        modSkinPadding(bu, -1, -1, -1, -1, -1, -3, -1, -3)
        modSkinColor(bu, .2, .2, .2)
    end

    --
