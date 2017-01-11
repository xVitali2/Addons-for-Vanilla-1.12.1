

    local orig = {}

    orig.FCF_SetWindowAlpha = FCF_SetWindowAlpha
    orig.FCF_OnUpdate       = FCF_OnUpdate

    function FCF_SetWindowAlpha(f, a, dontsave)
        orig.FCF_SetWindowAlpha(f, a, dontsave)
        local v = _G[f:GetName()..'ResizeTopLeftTexture']:GetAlpha()
        if not modSkinned(f) then
            modSkin(f, 18)
            modSkinPadding(f, 6, 6, 6, 6, 6, 10, 6, 10)
        end
        modSkinColor(f, .2, .2, .2, v) modSkinShadowColor(f, .2, .2, .2, v)
    end

    function FCF_OnUpdate(elapsed)
        orig.FCF_OnUpdate(elapsed)
        for i = 1, NUM_CHAT_WINDOWS do
            local chat     = _G['ChatFrame'..i]
            local tabflash = _G['ChatFrame'..i..'TabFlash']
            local tabtext  = _G['ChatFrame'..i..'TabText']
            if FCF_IsValidChatFrame(chat) then
                local v = _G[chat:GetName()..'ResizeTopLeftTexture']:GetAlpha()
                if v < DEFAULT_CHATFRAME_ALPHA then
                    if (MouseIsOver(chat, 45, -10, -5, 5) or chat.resizing)
                    and not UIOptionsFrame:IsShown() then
                        if chat.hover then
                            modSkinColor(chat, .2, .2, .2, v*3)
                            chat.modtime = nil
                        end
                    else
                        if not chat.hasBeenFaded then
                            if not chat.modtime then chat.modtime = GetTime() end
                            if GetTime() < (chat.modtime + CHAT_FRAME_FADE_TIME) then
                                modSkinColor(chat, .2, .2, .2, v/3)
                            elseif chat.modtime ~= 0 then
                                modSkinColor(chat, .2, .2, .2, v)
                                chat.modtime = 0
                            end
                        end
                    end
                end
            end
            if UIFrameIsFlashing(tabflash) then
                if tabflash:GetAlpha() > 0 then
                    tabtext:SetTextColor(.6, 0, .8)
                    tabtext.purple = true
                else
                    tabtext:SetTextColor(1, .8, 0)
                end
            elseif tabtext.purple then
                tabtext:SetTextColor(1, .8, 0)
                tabtext.purple = true
            end
        end
    end

    --
