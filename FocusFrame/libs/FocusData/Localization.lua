-- work in progress!

local locale = GetLocale()
local L = {}

if locale == "ruRU" then --BY CFM
	L.YOU_DIE = "Вы умерли."
	L.NO_FOCUS = "У Вас нет фокуса."
	L['You cast (.+).']                 = 'Вы применяете заклинание \"(.+)\"'
    L['(.+) casts (.+).']               = '(.+) применяет заклинание \"(.+)\"'
    L['(.+) begins to cast (.+).']      = '(.+) начинает использовать \"(.+)\".'
    L['(.+) -> (.+).']                  = '(.+) -> (.+).'
    L['(.+) performs (.+).']            = '(.+) выполняет действие \"(.+)\"'
    L['(.+) begins to perform (.+).']   = '(.+) начинает выполнять действие \"(.+)\"'
    L['(.+) performs (.+) on (.+).']    = '(.+) выполняет действие \"(.+)\" на (.+).'
    L['You cast (.+) on (.+).']         = 'Вы применяете заклинание \"(.+)\" на (.+).'
    L['(.+) casts (.+) on (.+).']       = '(.+) применяет заклинание \"(.+)\" на (.+).'
    L['(.+) performs Vanish']           = '(.+) выполняет действие "Исчезновение"'
    L['You interrupt (.+)\'s (.+).']    = 'Вы прервали заклинание \"(.+)\" (.+)'
    L['(.+) interrupts (.+)\'s (.+).']  = '(.+) прерывает заклинание \"(.+)\" (.+)'
    L['(.+) gains (.+).']               = '(.+) получает эффект \"(.+)\"'
    L['You gain (.+).']                 = 'Вы получаете эффект \"(.+)\"'
    L['(.+) is afflicted by (.+).']     = '(.+) находится под воздействием эффекта \"(.+)\".'
    L['You are afflicted by (.+).']     = 'Вы находитесь под воздействием эффекта \"(.+)\".'
    L['(.+) fades from (.+).']      = 'Действие эффекта \"(.+)\", наложенного на (.+), заканчивается'
    L['(.+)\'s (.+) is removed']    = '(.+) теряет \"(.+)\"'
    L['Your (.+) is removed']       = 'Вы теряете \"(.+)\"'
    L['you'] = 'Вы'
    L['(.+)\'s (.+) hits (.+) for (.+)']    = '\"(.+)\" (.+) наносит (.+) (.+) ед. урона'
    L['(.+)\'s (.+) crits (.+) for (.+)']   = '\"(.+)\" (.+) наносит (.+) (.+) ед. урона: критический эффект.'
    L['(.+)\'s (.+) is absorbed by (.+).']  = '(.+) поглощает заклинание \"(.+)\" (.+)'
    L['Your (.+) hits (.+) for (.+)']       = 'Ваше заклинание \"(.+)\" наносит (.+) (.+) ед. урона'
    L['Your (.+) crits (.+) for (.+)']      = 'Ваше заклинание \"(.+)\" наносит (.+) (.+) ед. урона: критический эффект.'
    L['Your (.+) is absorbed by (.+).']     = '(.+) поглощает ваше заклинание \"(.+)\".'
    L["(.+)'s (.+) was resisted by (.+)."]  = "(.+) сопротивляется заклинанию \"(.+)\" (.+)."
    L["(.+)'s (.+) was resisted."]          = "Вы сопротивляетесь заклинанию \"(.+)\" (.+)."
    L["(.+) suffers (.+) from (.+)'s (.+)."]    = "(.+) получает (.+) ед. урона ((.+)) от заклинания \"(.+)\" (.+)."
    L['(.+) suffers (.+) from your (.+).']      = '(.+) получает (.+) ед. урона ((.+)) от вашего заклинания \"(.+)\".'
    L["You suffer (.+) from (.+)'s (.+)."]      = "Вы получаете (.+) ед. урона ((.+)) от заклинания \"(.+)\" (.+)."
    L['(.+)\'s (.+) drains (.+) Mana from (.+)']     = '\"(.+)\" (.+) отнимает у (.+) ед. маны'
    L['(.+) dies.']             = '(.+) погибает.'
    L['(.+) is slain by (.+).'] = '(.+) убивает (.+).'
    L['You have slain (.+).']   = 'Вы убили (.+).'
    L["(.+) attempts to run away in fear!"] = "(.+) attempts to run away in fear!"
else

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
end

FocusData_Locale = L
