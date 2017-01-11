

    local orig = {}

    for i = 1, 5 do
        local bu = _G['TargetFrameBuff'..i]
        modSkin(bu, 16)
        modSkinPadding(bu, 2)
        modSkinColor(bu, .2, .2, .2)
    end

    for i = 1, 16 do
        local bu = _G['TargetFrameDebuff'..i]
        modSkin(bu, 16)
        modSkinPadding(bu, 2)
        modSkinColor(bu, 1, 0, 0)
    end

    orig.TargetDebuffButton_Update = TargetDebuffButton_Update
    function TargetDebuffButton_Update()
        orig.TargetDebuffButton_Update()
        for i = 1, 16 do
            local bu = _G['TargetFrameDebuff'..i]
            local d  = _G['TargetFrameDebuff'..i..'Border']
            if d then
                local r, g, b = d:GetVertexColor()
                modSkinColor(bu, r*.7, g*.7, b*.7)
                d:SetAlpha(0)
            end
        end
    end

    --
