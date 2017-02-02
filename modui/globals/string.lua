

    local orig = {}

    orig.FriendsList_Update = FriendsList_Update

    _G = getfenv(0)

    tlength = function(t)
        local count = 0
        for _ in pairs(t) do count = count + 1 end
        return count
    end

    print = function(m)
        if  (not m) or m == '' then
            DEFAULT_CHAT_FRAME:AddMessage'nil'
        elseif  type(m) == 'table' then
            DEFAULT_CHAT_FRAME:AddMessage'table'
        else
            DEFAULT_CHAT_FRAME:AddMessage(m)
        end
    end

    MODUI_FFqueued = false  -- used for quiet FriendsFrame data fetching
    MODUI                                = {}
    MODUI_UICOLOR_DEFAULT                = {r = .2, g = .2, b = .2}
    MODUI_COLOUR_FOR_UI                  = {}
    MODUI_PREVCOLOUR_FOR_UI              = {}
    MODUI_COLOURELEMENTS_FOR_UI          = {}
    MODUI_COLOURELEMENTS_BORDER_FOR_UI   = {}

    STANDARD_TEXT_FONT = [[Fonts\ARIALN.ttf]]

    CHAT_FLAG_AFK = 'AFK — '
    CHAT_FLAG_DND = 'DND — '
    CHAT_FLAG_GM  = 'GM — '



    _G.FOREIGN_SERVER_LABEL = ' —'

    _G.GOLD_AMOUNT   =  '|cffffffff%d|r|TInterface\\MONEYFRAME\\UI-GoldIcon:14:14:2:0|t'
    _G.SILVER_AMOUNT =  '|cffffffff%d|r|TInterface\\MONEYFRAME\\UI-SilverIcon:14:14:2:0|t'
    _G.COPPER_AMOUNT =  '|cffffffff%d|r|TInterface\\MONEYFRAME\\UI-CopperIcon:14:14:2:0|t'

    GROUP = 'group'

    --
