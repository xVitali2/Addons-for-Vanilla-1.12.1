local L = enemyFrames.L

-- bindings
BINDING_HEADER_EFKHEADER = 'Enemy Frames Keybinds'
BINDING_NAME_SETKT = 'Assign Skull to Target'
BINDING_NAME_GETKT = 'Target Skull'
BINDING_NAME_SETSTAR = 'Assign Star to Target'
BINDING_NAME_SETMOON = 'Assign Moon to Target'
BINDING_NAME_SETSQUARE = 'Assign Square to Target'
BINDING_NAME_SETDIAMOND = 'Assign Diamond to Target'
BINDING_NAME_SETCROSS = 'Assign Cross to Target'
BINDING_NAME_SETCIRCLE = 'Assign Circle to Target'
BINDING_NAME_SETTRIANGLE = 'Assign Triangle to Target'

L['[enemyFrames] v%s loaded. |cffffffff/efs|cff%s for menu settings.'] = nil
L['Warsong Gulch'] = nil
L['Arathi Basin'] = nil
L['Alterac Valley'] = nil
L['toggle EFC low health announcement'] = nil
L['settings menu'] = nil
L['S'] = nil
L['enemyFrames Settings'] = nil
L['Horde'] = nil
L['Alliance'] = nil
L['H'] = nil
L['A'] = nil
L['Player'] = nil
L['lock'] = nil
L['unlock'] = nil
L['drag-me'] = nil
L['Click to target'] = nil
L['Get ready to cap!'] = nil
L['EFC has less than %d%% Health!'] = nil
L['[enemyFrames] New version detected.'] = nil
L['!ver %s available!'] = nil
L['Seal of'] = nil
L['Judgement of'] = nil
L['Vanish'] = nil

-- features tab
L['features'] = nil
L['Enable outside of BattleGrounds'] = nil
L['Mouseover cast on frames'] = nil
L['Moveable Target Cast Bar'] = nil
L['Integrated Target Cast Bar'] = nil
L['Prio debuff on Target Portrait'] = nil
L['Prio debuff on Player Portrait'] = nil
L['Debuff timers on target'] = nil
L['battlegrounds'] = nil
L['Incoming Spells (BGs only)'] = nil
L['Class colored map blips'] = nil
L['Low Health EFC announcement'] = nil
-- general tab
L['general'] = nil
L['Show enemyFrames'] = nil
L['scale'] = nil
L['layout'] = nil
-- nameplates tab
L['nameplates'] = nil
L['Class color on enemy nameplates'] = nil
L['Enable nameplate cast bar'] = nil
L['Show Raid Marks'] = nil
L['Enable nameplate debuffs'] = nil
-- optionals tab
L['optionals'] = nil
L['optional'] = nil
L['Display names'] = nil
L['Display Health %'] = nil
L['Display mana bar'] = nil
L['Display cast timers'] = nil
L['Display nearby units only'] = nil
L['Display Target Counter'] = nil


L['(.+) attempts to run away in fear!'] = nil
-- wsgHandler.lua
L['The %s [Ff]lag was picked up by %s!'] = nil
L['The %s [Ff]lag was dropped by %s!'] = nil
L['captured the %s [Ff]lag!'] = nil

-- HitsCrits func
L['%s\'s %s hits %s for %d'] = nil
L['%s\'s %s crits %s for %d'] = nil
L['Your %s hits %s for %d'] = nil
L['Your %s crits %s for %d'] = nil
L['You_HitsCrits'] = nil
-- channelDot func
L['%s\'s %s drains'] = nil
L['Mana'] = nil

-- custom strings ONLY for this locale
enemyFrames.custom_locale_strings = {
	-- for enUS this table not needed
}