-- work in progress!

--local locale = GetLocale()
local L = {}

--[[if locale == "" then

else]]

    -- FocusData
    L.YOU_DIE = "You die." -- CHAT_MSG_COMBAT_HOSTILE_DEATH
    L.NO_FOCUS = "You have no focus."

    -- spellcastingcore
    --L["Feign Death"]                  = "Feign Death"
    L['You cast (.+).']                 = 'You cast (.+).'
    L['(.+) casts (.+).']               = '(.+) casts (.+).'
    L['(.+) begins to cast (.+).']      = '(.+) begins to cast (.+).'
    L['(.+) -> (.+).']                  = '(.+) -> (.+).'
    L['(.+) performs (.+).']            = '(.+) performs (.+).'
    L['(.+) begins to perform (.+).']   = '(.+) begins to perform (.+).'
    L['(.+) performs (.+) on (.+).']    = '(.+) performs (.+) on (.+).'
    L['You cast (.+) on (.+).']         = 'You cast (.+) on (.+).'
    L['(.+) casts (.+) on (.+).']       = '(.+) casts (.+) on (.+).'

    L['(.+) performs Vanish']           = '(.+) performs Vanish'
    L['You interrupt (.+)\'s (.+).']    = 'You interrupt (.+)\'s (.+).'
    L['(.+) interrupts (.+)\'s (.+).']  = '(.+) interrupts (.+)\'s (.+).'
    L['(.+) gains (.+).']               = '(.+) gains (.+).'
    L['You gain (.+).']                 = 'You gain (.+).'
    L['(.+) is afflicted by (.+).']     = '(.+) is afflicted by (.+).'
    L['You are afflicted by (.+).']     = 'You are afflicted by (.+).'

    L['(.+) fades from (.+).']      = '(.+) fades from (.+).'
    L['(.+)\'s (.+) is removed']    = '(.+)\'s (.+) is removed'
    L['Your (.+) is removed']       = 'Your (.+) is removed'
    L['you'] = 'you'

    L['(.+)\'s (.+) hits (.+) for (.+)']    = '(.+)\'s (.+) hits (.+) for (.+)'
    L['(.+)\'s (.+) crits (.+) for (.+)']   = '(.+)\'s (.+) crits (.+) for (.+)'
    L['(.+)\'s (.+) is absorbed by (.+).']  = '(.+)\'s (.+) is absorbed by (.+).'
    L['Your (.+) hits (.+) for (.+)']       = 'Your (.+) hits (.+) for (.+)'
    L['Your (.+) crits (.+) for (.+)']      = 'Your (.+) crits (.+) for (.+)'
    L['Your (.+) is absorbed by (.+).']     = 'Your (.+) is absorbed by (.+).'
    L["(.+)'s (.+) was resisted by (.+)."]  = "(.+)'s (.+) was resisted by (.+)."
    L["(.+)'s (.+) was resisted."]          = "(.+)'s (.+) was resisted."

    L["(.+) suffers (.+) from (.+)'s (.+)."]    = "(.+) suffers (.+) from (.+)'s (.+)."
    L['(.+) suffers (.+) from your (.+).']      = '(.+) suffers (.+) from your (.+).'
    L["You suffer (.+) from (.+)'s (.+)."]      = "You suffer (.+) from (.+)'s (.+)."
    L['(.+)\'s (.+) drains (.+) Mana from (.+)']     = '(.+)\'s (.+) drains (.+) Mana from (.+)'

    L['(.+) dies.']             = '(.+) dies.'
    L['(.+) is slain by (.+).'] = '(.+) is slain by (.+).'
    L['You have slain (.+).']   = 'You have slain (.+).'

    L["(.+) attempts to run away in fear!"] = "(.+) attempts to run away in fear!"

    -- Babble-Spell-2.2

--end

FocusData_Locale = L
