

    local orig = {}
    local _, class = UnitClass'Player'
    local colour = RAID_CLASS_COLORS[class]

    orig.ChatFrame_OnUpdate = ChatFrame_OnUpdate
    orig.FCF_SetTabPosition = FCF_SetTabPosition
    orig.FCF_FlashTab       = FCF_FlashTab

    ChatFontNormal:SetFont(STANDARD_TEXT_FONT, 14)      -- DEFAULT FONT
    ChatFontNormal:SetShadowOffset(1, -1)
    ChatFontNormal:SetShadowColor(0, 0, 0, 1)


    SLASH_RELOADUI1 = '/rl'                             -- DEVTOOLS
    SlashCmdList.RELOADUI = ReloadUI

    SLASH_FRAMESTACK1 = '/fs'
    SLASH_FRAMESTACK3 = '/fstack'
    SLASH_FRAMESTACK2 = '/framestack'
    SlashCmdList.FRAMESTACK = function()
        print(GetMouseFocus():GetName())
    end



    CHAT_FONT_HEIGHTS = {                               -- MORE MENU FONT SIZES
        [1] = 8, [2] = 9, [3] = 10, [4] = 11, [5] = 12, [6] = 13,
        [7] = 14, [8] = 15, [9] = 16, [10] = 17, [11] = 18, [12] = 19, [13] = 20, }


     local modScroll = function()                       -- MOUSESCROLL CHAT
         if not arg1 then return end
         local f = this:GetParent()
         if arg1 > 0 then
             if IsShiftKeyDown() then f:ScrollToTop()
             else f:ScrollUp() end
         elseif arg1 < 0 then
             if IsShiftKeyDown() then f:ScrollToBottom()
      		else f:ScrollDown() end
         end
     end

     local tab = function(f)                         -- CHAT TAB
         if not f.styled then
             local tab = _G[f:GetName()..'Tab']

             local a, b, c = tab:GetRegions()
             for _, v in pairs({a, b, c}) do v:Hide() end

             local flash = _G[f:GetName()..'TabFlash']
             local a = flash:GetRegions()
             a:SetTexture''

             local text = _G[f:GetName()..'TabText']
             text:SetJustifyH'CENTER'
             text:SetWidth(40)
             text:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
             text:SetShadowOffset(0, 0)
             text:SetDrawLayer('OVERLAY', 7)

             local hover = tab:CreateFontString(nil, 'OVERLAY')
             hover:SetFont(STANDARD_TEXT_FONT, 13, 'OUTLINE')
             hover:SetShadowOffset(0, 0)
             hover:SetPoint('RIGHT', text, 'LEFT')
             hover:SetTextColor(colour.r, colour.g, colour.b)
             hover:SetText''

             tab:GetHighlightTexture():SetTexture''

             local t = text:GetText()
             tab:SetScript('OnEnter', function()
                 hover:SetText'> '
                 GameTooltip_AddNewbieTip(CHAT_OPTIONS_LABEL, 1.0, 1.0, 1.0, NEWBIE_TOOLTIP_CHATOPTIONS, 1)
             end)
             tab:SetScript('OnLeave', function()
                 hover:SetText''
                 GameTooltip:Hide()
             end)

             f.styled = true
         end
     end


     local hideFrameForever = function (f)                -- HIDE JUNK
         f:SetScript('OnShow', function() f:Hide() end) f:Hide()
     end


     for i = 1, 7 do                                     -- INIT STYLE, SUBS etc
         local chat = _G['ChatFrame'..i]

         hideFrameForever(_G['ChatFrame'..i..'UpButton'])
         hideFrameForever(_G['ChatFrame'..i..'DownButton'])

        _G['ChatFrame'..i..'BottomButton']:ClearAllPoints()
        _G['ChatFrame'..i..'BottomButton']:SetPoint('BOTTOMLEFT', -35, 22)
        _G['ChatFrame'..i..'BottomButton']:Hide()

         local f = CreateFrame('Frame', nil, chat)
         f:EnableMouse(false)
         f:SetPoint('TOPLEFT', chat)
         f:SetPoint('BOTTOMRIGHT', chat)
         f:EnableMouseWheel(true)
         f:SetScript('OnMouseWheel', modScroll)

         _G['ChatFrame'..i..'UpButton']:GetNormalTexture():SetVertexColor(.5, .5, .5)
         _G['ChatFrame'..i..'DownButton']:GetNormalTexture():SetVertexColor(.5, .5, .5)
         _G['ChatFrame'..i..'BottomButton']:GetNormalTexture():SetVertexColor(.5, .5, .5)
     end

     function FCF_SetButtonSide(f, side)
        local bu = _G[f:GetName()..'BottomButton']
        bu:ClearAllPoints()
        bu:SetPoint('BOTTOMLEFT', -35, 22)
     end

     ChatFrameMenuButton:GetNormalTexture():SetVertexColor(.5, .5, .5)
     ChatFrameMenuButton:ClearAllPoints() ChatFrameMenuButton:SetPoint('BOTTOMRIGHT', ChatFrame1, 'BOTTOMLEFT', -3, -10)
     ChatMenu:ClearAllPoints() ChatMenu:SetPoint('BOTTOM', UIParent, 0, 100)

    local addEditBox = function()
        local x = ({ChatFrameEditBox:GetRegions()})
        x[6]:SetAlpha(0) x[7]:SetAlpha(0) x[8]:SetAlpha(0)
        ChatFrameEditBox:SetAltArrowKeyMode(nil)
        ChatFrameEditBox:ClearAllPoints()
        if _G['modui_vars'].db['modEditBoxOrientation'] == 1 then
            ChatFrameEditBox:SetPoint('BOTTOMLEFT', ChatFrame1, 'TOPLEFT', -2, 18)
            ChatFrameEditBox:SetPoint('BOTTOMRIGHT', ChatFrame1, 'TOPRIGHT',  2, 18)
        else
            ChatFrameEditBox:SetPoint('TOPLEFT', ChatFrame1, 'BOTTOMLEFT', -2, -18)
            ChatFrameEditBox:SetPoint('TOPRIGHT', ChatFrame1, 'BOTTOMRIGHT',  2, -18)
        end
    end

    function ChatFrame_OnUpdate(elapsed)
        orig.ChatFrame_OnUpdate(elapsed)
        local bu = _G[this:GetName()..'BottomButton']
        local fl = _G[this:GetName()..'BottomButtonFlash']
         if  this:AtBottom() then bu:Hide()
         else
             bu:Show()
             bu:SetAlpha(1)
             if fl:IsShown() then modSkinColor(bu, 0, .6, 1) else modSkinColor(bu, .2, .2, .2) end
         end
     end

     function FCF_SetTabPosition(f, x)
         orig.FCF_SetTabPosition(f, x)
         tab(f)
     end

     ChatTypeInfo.SAY.sticky = 1                        -- STICKY CHANNELS
     ChatTypeInfo.EMOTE.sticky = 1
     ChatTypeInfo.YELL.sticky = 1
     ChatTypeInfo.PARTY.sticky = 1
     ChatTypeInfo.GUILD.sticky = 1
     ChatTypeInfo.OFFICER.sticky = 1
     ChatTypeInfo.RAID.sticky = 1
     ChatTypeInfo.RAID_WARNING.sticky = 1
     ChatTypeInfo.BATTLEGROUND.sticky = 1
     ChatTypeInfo.WHISPER.sticky = 1
     ChatTypeInfo.CHANNEL.sticky = 1

     local e = CreateFrame'Frame'
     e:RegisterEvent'PLAYER_LOGIN'
     e:SetScript('OnEvent', addEditBox)

     --
