
    local orig = {}

    orig.ActionButton_UpdateHotkeys = ActionButton_UpdateHotkeys

    local replacements = {
        ['(s%-)']                               = 'S-',
        ['(a%-)']                               = 'A-',
        ['(c%-)']                               = 'C-',
        ['(st%-)']                              = 'C-',       -- german control 'Steuerung'
        ['('..KEY_BUTTON3..')']                 = 'M3',
        ['('..gsub(KEY_BUTTON4, '4', '')..')']  = 'M',
        ['('..gsub(KEY_NUMPAD0, '0', '')..')']  = 'Nu',
        ['('..KEY_NUMPADDECIMAL..')']           = 'Nu.',
        ['('..KEY_NUMPADDIVIDE..')']        = 'Nu/',
        ['('..KEY_NUMPADMINUS..')']         = 'Nu-',
        ['('..KEY_NUMPADMULTIPLY..')']          = 'Nu*',
        ['('..KEY_NUMPADPLUS..')']              = 'Nu+',
        ['('..KEY_MOUSEWHEELDOWN..')']          = 'M▼',
        ['('..KEY_MOUSEWHEELUP..')']            = 'M▲',
        ['('..KEY_DOWN..')']                    = '▼',
        ['('..KEY_UP..')']                      = '▲',
        ['('..KEY_LEFT..')']                    = '◄',
        ['('..KEY_RIGHT..')']                   = '►',
        ['('..KEY_PAGEDOWN..')']                = 'P▼',
        ['('..KEY_PAGEUP..')']                  = 'P▲',
        ['('..KEY_SPACE..')']                   = '_',
        ['('..KEY_INSERT..')']                  = 'Ins',
        ['('..KEY_BACKSPACE..')']               = 'Bs',
        ['('..KEY_DELETE..')']                  = 'Del',
        ['('..KEY_HOME..')']                    = 'Hm',
        ['('..KEY_NUMLOCK..')']                 = 'NuL',
        ['('..KEY_NUMLOCK_MAC..')']             = 'Clr',
        ['('..KEY_ENTER..')']                   = 'Ent',
        ['('..KEY_ENTER_MAC..')']               = 'Ret',
        ['('..KEY_ESCAPE..')']                  = 'Esc',
    }

    local UpdateHotkeys = function(actionButtonType)
        if not actionButtonType then actionButtonType = 'ACTIONBUTTON' end
        local ho = _G[this:GetName()..'HotKey']
        local text = GetBindingText(GetBindingKey(actionButtonType..this:GetID()), 'KEY_', 1)
        if text == '' then
            ho:Hide()
        else
            for k, v in pairs(replacements) do
                text = gsub(text, k, v)
            end
            ho:SetText(text)
            ho:SetTextHeight(12)
            ho:SetDrawLayer'OVERLAY'
            ho:Show()
        end
    end

    function ActionButton_UpdateHotkeys(actionButtonType)
        orig.ActionButton_UpdateHotkeys(actionButtonType)
        UpdateHotkeys(actionButtonType)
    end

    --
