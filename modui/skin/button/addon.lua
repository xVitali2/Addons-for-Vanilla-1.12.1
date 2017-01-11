

    local orig = {}
    local f = CreateFrame'Frame'

    f:RegisterEvent'ADDON_LOADED'
    f:SetScript('OnEvent', function()
        if arg1 == 'TrinketMenu' then       -- TRINKETMENU
            for i = 0, 1 do
                local bu = _G['TrinketMenu_Trinket'..i]
                modSkin(bu, 18)
                modSkinPadding(bu, 3)
                modSkinColor(bu, .2, .2, .2)
            end
        elseif arg1 == 'zBar' then          -- ZBAR
            for _, v in pairs({zBar1, zBar2, zBar3, zBar4, zBar9}) do
                for i = 1, 12 do
                    local f = v:GetName()
                    local bu = _G[f..'Button'..i]
                    if bu then
                        modSkin(bu, 18)
                        modSkinPadding(bu, 2)
                        modSkinColor(bu, .2, .2, .2)
                    end
                end
            end
        end
    end)

    if IsAddOnLoaded'moddkp' then
        modSkin(moddkp_container, 18)
        modSkinPadding(moddkp_container, 2)
        modSkinColor(moddkp_container, .2, .2, .2)
    end

    if IsAddOnLoaded'KLHThreatMeter' then
        modSkin(KLHTM_Frame, 18)
        modSkinPadding(KLHTM_Frame, 0)
        modSkinColor(KLHTM_Frame, .2, .2, .2)
        KLHTM_TitleFrame:SetFrameLevel(0)
    end

    if IsAddOnLoaded'SW_Stats' then
        modSkin(SW_BarFrame1, 18)
        modSkinPadding(SW_BarFrame1, 0, 0, -1, 0, 0, 0, -1, 0)
        modSkinColor(SW_BarFrame1, .2, .2, .2)
        -- SW_BarFrame1_Title:SetFrameLevel(0)
    end

    if IsAddOnLoaded'Postal' then
        for i = 1, 21 do
            local bu = _G['PostalButton'..i] or _G['PostalAttachment'..i]
            if  bu then
                modSkin(bu, 18)
                modSkinPadding(bu, 3, 4, 1, 4, 3, 1, 1, 1)
                modSkinColor(bu, .2, .2, .2)
                bu:SetNormalTexture''
            end
        end
    end

    if IsAddOnLoaded'RingMenu' then
        orig.RingMenuFrame_ConfigureButtons = RingMenuFrame_ConfigureButtons
        function RingMenuFrame_ConfigureButtons()
            orig.RingMenuFrame_ConfigureButtons()
            for i = 1, RingMenu_settings.numButtons do
                local bu = _G['RingMenuButton'..i]
                local bo = _G['RingMenuButton'..i..'Border']
                local ic = _G['RingMenuButton'..i..'Icon']
                if not bu.skin then
                    modSkin(bu, 18)
                    modSkinPadding(bu, 3)
                    modSkinColor(bu, .2, .2, .2)
                    bu:SetNormalTexture'' bo:Hide()
                    ic:SetTexCoord(.1, .9, .1, .9)
                    bu.skin = true
                end
            end
        end
    end

    if IsAddOnLoaded'PallyPower' then
        for i = 1, 8 do
            for _, v in pairs({_G['PallyPowerBuffBarBuff'..i..'BuffIcon']:GetParent(), _G['PallyPowerBuffBarBuff'..i..'ClassIcon']:GetParent()}) do
                modSkin(v, 18)
                modSkinPadding(v, 3)
                modSkinColor(v, .2, .2, .2)
            end
        end
    end


    --
