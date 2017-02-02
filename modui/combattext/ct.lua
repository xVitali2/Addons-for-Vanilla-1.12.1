

    local offset = 222                  -- X OFFSET FOR TEXT
    local _G = getfenv(0)
    local gsub = string.gsub
    local f = CreateFrame'Frame'
    local orig = {}
    local msgType, dspType, modType, message, info, colour

    local textoverrides = {
        ['*'] = { isStaggered = nil, },
        ['AURA_END'] = { r = .4, g = .7, b = .4, },
        ['AURA_END_HARMFUL'] = { r = .7, g = .4, b = .4, },
    }

    local textsubs = {
        ['*'] = {
            ['<'] = '',
            ['>'] = '',              -- STRIP BRACKETS
        },
        ['AURA_START'] = {
            APPEND = { '+ ', '' },   -- + BUFF
        },
        ['AURA_END'] = {
            APPEND = { '- ', '' },   -- - BUFF
            [' fades'] = '',
        },
        ['AURA_START_HARMFUL'] = {
            APPEND = { '+ ', '' },   -- + DEBUFF
        },
        ['AURA_END_HARMFUL'] = {
            APPEND = { '- ', '' },   -- - DEBUFF
            [' fades'] = '',
        },
        ['ENTERING_COMBAT'] = {
            APPEND = { '+ ', '' },   -- + COMBAT
            ['Entering '] = '',
        },
        ['LEAVING_COMBAT'] = {
            APPEND = { '- ', '' },   -- - COMBAT
            ['Leaving '] = '',
        },
        ['INCOMING MANA'] = {
            APPEND = { '+ ', '' },   -- + MANA
        },
        ['OUTGOING_DMG'] = {
            APPEND = { '>> ', '' },  -- >> DAMAGE
        },
        ['OUTGOING_DMG_CRIT'] = {
            APPEND = { '!> ', '' },  -- !> DAMAGE
        },
        ['OUTGOING_HEALING'] = {
            APPEND = { '+> ', '' },  -- +> HEAL
        },
        ['OUTGOING_HEALING_CRIT'] = {
            APPEND = { '+!> ', '' }, -- +!> HEAL
        },
    }

    local style = function()
        for i = 1, 20 do
            local f = _G['CombatText'..i]
            local font = _G['SystemFont']
            f:SetFontObject(font)
        end
    end

    local handler = function(event)
        if event == 'UNIT_HEALTH' then
        	msgType = 'HEALTH_LOW'
        elseif event == 'UNIT_MANA' then
        	msgType = 'MANA_LOW'
        elseif event == 'PLAYER_REGEN_DISABLED' then
        	msgType = 'ENTERING_COMBAT'
        elseif event == 'PLAYER_REGEN_ENABLED' then
        	msgType = 'LEAVING_COMBAT'
        elseif event == 'PLAYER_COMBO_POINTS' then
        	msgType = 'COMBO_POINTS'
        elseif event == 'CHAT_MSG_SPELL_SELF_DAMAGE' then
            local cv = _G['modui_vars'].db['modSCTDMG']
            if cv == 1 then
                local h = 'Your (.+) hits (.+) for (.+)'  local hit  = string.find(arg1, h)
                local c = 'Your (.+) crits (.+) for (.+)' local crit = string.find(arg1, c)
                if hit or crit then
                    local m = hit and h or crit and c
                    local t = gsub(arg1, '(.+) (.+) damage.', '%2')
                    if t then colour = SPELL_SCHOOL_COLORS[t] else colour = {r =  1, g =  1, b =  0} end
        			arg2 = gsub(arg1, m, '%3')  arg2 = gsub(arg2, '(.+) (.+) damage.', '%1')
                    msgType = crit and 'OUTGOING_DMG_CRIT' or 'OUTGOING_DMG'
                end
            end
        elseif event == 'CHAT_MSG_SPELL_SELF_BUFF' then
            local cv = _G['modui_vars'].db['modSCTHEAL']
            if cv == 1 then
                local h    = 'Your (.+) heals (.+) for (.+).'            local heal = string.find(arg1, h)
                local c    = 'Your (.+) critically heals (.+) for (.+).' local crit = string.find(arg1, c)
                local hot  = '(.+) gains (.+) health from your (.+).'
                if heal or crit then
                    arg2 = gsub(arg1, h, '%3 — %2')
                    colour = {r = .1, g = .7, b = .65}
                    if string.find(arg2, '(.+) — you') then return end
                    msgType = crit and 'OUTGOING_HEALING_CRIT' or 'OUTGOING_HEALING'
                end
            end
        elseif event == 'COMBAT_TEXT_UPDATE' then
        	msgType = arg1
            -- print(arg1..'  '..arg2)
        else
        	msgType = event
        end

        if msgType == '' then
        elseif msgType == 'ENTERING_COMBAT'
            or msgType == 'HEAL' or msgType == 'PERIODIC_HEAL'
            or msgType == 'HEAL_CRIT'
            or msgType == 'MANA' or msgType == 'RAGE'
            or msgType == 'FOCUS' or  msgType == 'ENERGY'
            or msgType == 'FACTION'
            or msgType == 'HONOR_GAINED'
            or msgType == 'SPELL_ACTIVE'
            or msgType == 'COMBO_POINTS'
            or msgType == 'OUTGOING_DMG' or msgType == 'OUTGOING_HEALING' then
            dspType = 'plus'
        elseif msgType == 'LEAVING_COMBAT'
            or msgType == 'DAMAGE_CRIT'
            or msgType == 'DAMAGE' or msgType == 'SPELL_DAMAGE'
            or msgType == 'SPELL_CAST' or msgType == 'AURA_START'
            or msgType == 'AURA_START_HARMFUL'
            or msgType == 'AURA_END' or msgType == 'AURA_END_HARMFUL'
            or msgType == 'BLOCK' or msgType == 'ABSORB' or msgType == 'RESIST'
            or msgType == 'SPELL_RESISTED' then
            dspType = 'minus'
        else
            -- dspType = 'plus'
        end

        if msgType == 'OUTGOING_DMG' or msgType == 'OUTGOING_DMG_CRIT' then
            if msgType == 'OUTGOING_DMG_CRIT' then
                info = COMBAT_TEXT_TYPE_INFO['OUTGOING_DMG_CRIT']
            else
                info = COMBAT_TEXT_TYPE_INFO['OUTGOING_DMG']
            end
            message = arg2
        elseif msgType == 'OUTGOING_HEALING' then
            if msgType == 'OUTGOING_HEALING_CRIT' then
                info = COMBAT_TEXT_TYPE_INFO['OUTGOING_HEALING_CRIT']
            else
                info = COMBAT_TEXT_TYPE_INFO['OUTGOING_HEALING']
            end
            message = arg2
        end

        if message and colour then
        	CombatText_AddMessage(message, COMBAT_TEXT_SCROLL_FUNCTION, colour.r, colour.g, colour.b, dspType, isStaggered)
            message = nil info = nil colour = nil
        end
        -- might need to return msgType etc?
    end

    local update = function(e)
        for i, v in COMBAT_TEXT_TO_ANIMATE do
            if v.scrollTime >= COMBAT_TEXT_SCROLLSPEED then
                CombatText_RemoveMessage(v)
                if v.modType then v.modType = nil end
            else
                v.scrollTime = v.scrollTime + e

                    -- cache dtype
                if not v.modType then v.modType = dspType end

                local x
                local _, y = v.scrollFunction(v)

                if v.modType == 'minus' then
                    x = offset
                elseif v.modType == 'plus' then
                    x =  -offset
                else
                    x = 0
                end

                v:SetPoint('TOP', UIParent, 'BOTTOM', x, y)
            end
        end
    end

    function f:ApplyOverrides()
        for type,table in pairs(COMBAT_TEXT_TYPE_INFO) do
            for k,v in pairs(textoverrides['*']) do
                table[k] = v
            end
            if textoverrides[type] then
                for k,v in pairs(textoverrides[type]) do
                    table[k] = v
                end
            end
        end
    end

    local function logic(msg, k, v)
        if type(v) == 'table' and k == 'APPEND' then
            msg = (v[1] or '')..msg..(v[2] or '')
        elseif type(v) == 'function' and k == 'FUNC' then
            msg = v(msg) or msg
        else
            msg = gsub(msg, k, v)
        end
        return msg
    end

    function f:cut(msg, msgType)
        for k, v in pairs(textsubs['*']) do msg = logic(msg, k, v) end
        if textsubs[msgType] then
            for k, v in pairs(textsubs[msgType]) do msg = logic(msg, k, v) end
        end
        return msg
    end

    f:RegisterEvent'ADDON_LOADED'
    f:SetScript('OnEvent', function()
        if event == 'ADDON_LOADED' then
            if arg1 == 'Blizzard_CombatText' then
                orig.CombatText_UpdateDisplayedMessages        = CombatText_UpdateDisplayedMessages
                orig.CombatText_AddMessage                     = CombatText_AddMessage
                orig.CombatText_OnEvent                        = CombatText_OnEvent
                orig.CombatText_GetAvailableString             = CombatText_GetAvailableString
                orig.CombatText_OnUpdate                       = CombatText_OnUpdate
                COMBAT_TEXT_HEIGHT                             = 18  -- SIZE
                COMBAT_TEXT_SCROLLSPEED                        = 3   -- ANIMSPEED
                COMBAT_TEXT_FADEOUT_TIME                       = 2   -- FADE
                COMBAT_TEXT_CRIT_MAXHEIGHT                     = 30  -- CRIT SIZE MAX
                COMBAT_TEXT_CRIT_MINHEIGHT                     = 20  -- CRIT SIZE MIN
                COMBAT_TEXT_TYPE_INFO['OUTGOING_DMG']          = {r = .9, g = .7, b = .1,  show = 1}
                COMBAT_TEXT_TYPE_INFO['OUTGOING_DMG_CRIT']     = {r = .9, g = .7, b = .1,  show = 1}
                COMBAT_TEXT_TYPE_INFO['OUTGOING_HEALING']      = {r = .1, g = .7, b = .65, show = 1}
                COMBAT_TEXT_TYPE_INFO['OUTGOING_HEALING_CRIT'] = {r = .1, g = .7, b = .65, show = 1}
                CombatText:RegisterEvent'CHAT_MSG_SPELL_SELF_BUFF'
                CombatText:RegisterEvent'CHAT_MSG_SPELL_SELF_DAMAGE'
                                                                     --
                f:ApplyOverrides()                                   -- INIT SUBS
                                                                     --
                style()                                              -- FONT
                                                                     --
                function CombatText_OnEvent(event)
                    handler(event)
                    orig.CombatText_OnEvent(event)
                end
                function CombatText_AddMessage(msg, scrollFunction, r, g, b, displayType, isStaggered)
                    local msg = f:cut(msg, msgType)
                    orig.CombatText_AddMessage(msg, scrollFunction, r, g, b, displayType, isStaggered)
                end
                function CombatText_OnUpdate(e)
                    orig.CombatText_OnUpdate(e)
                    update(e)
                end
                function CombatText_GetAvailableString()
                    for i = 1, NUM_COMBAT_TEXT_LINES do
                        local string = _G['CombatText'..i]
                        if string.modType then string.modType = nil end
                    end
                    if dspType == 'crit' then
                        local string = _G['CombatTextCrit'] return string
                    else return orig.CombatText_GetAvailableString() end
                end
                function CombatText_UpdateDisplayedMessages()
                    orig.CombatText_UpdateDisplayedMessages()
                    if SHOW_COMBAT_TEXT == '0' then
                        CombatText:UnregisterEvent'CHAT_MSG_SPELL_SELF_BUFF'
                        CombatText:UnregisterEvent'CHAT_MSG_SPELL_SELF_DAMAGE'
                    else
                        CombatText:RegisterEvent'CHAT_MSG_SPELL_SELF_BUFF'
                        CombatText:RegisterEvent'CHAT_MSG_SPELL_SELF_DAMAGE'
                    end
                end
            end
        end
    end)

    --
