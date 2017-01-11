

    local orig = {}

    for i = 1, 5 do
        local n = 'PartyMemberFrame'..i
        for j = 1, 4 do
            local bu = _G[n..'Debuff'..j]
            if bu then
                modSkin(bu, 13.5)
                modSkinPadding(bu, 2)
                modSkinColor(bu, .2, .2, .2)
            end
        end
    end

    for i = 1, 3 do
        local bu = _G['PetFrameDebuff'..i]
        if bu then
            modSkin(bu, 13.5)
            modSkinPadding(bu, 2)
            modSkinColor(bu, .2, .2, .2)
            if i == 1 then bu:SetPoint('TOPLEFT', 48, -46) end
        end
    end

    orig.PartyMemberFrame_OnEvent = PartyMemberFrame_OnEvent
    orig.PetFrame_OnEvent         = PetFrame_OnEvent

    function PartyMemberFrame_OnEvent(event)
        orig.PartyMemberFrame_OnEvent(event)
        if event == 'UNIT_AURA' then
            for i = 1, 5 do
                local n = 'PartyMemberFrame'..i
                for j = 1, 4 do
                    local f = n..'Debuff'..j
                    local d  = _G[f..'Border']
                    if d then
                        local r, g, b = d:GetVertexColor()
                        modSkinColor(_G[f], r*.7, g*.7, b*.7)
                        d:SetAlpha(0)
                    end
                end
            end
        end
    end

    function PetFrame_OnEvent(event)
        orig.PetFrame_OnEvent(event)
        if event == 'UNIT_AURA' then
            for i = 1, 3 do
                local f = 'PetFrameDebuff'..i
                local d  = _G[f..'Border']
                if d then
                    local r, g, b = d:GetVertexColor()
                    modSkinColor(_G[f], r*.7, g*.7, b*.7)
                    d:SetAlpha(0)
                end
            end
        end
    end

    --
