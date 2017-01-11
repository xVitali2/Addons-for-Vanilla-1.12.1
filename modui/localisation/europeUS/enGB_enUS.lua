

    -- TODO:  check each of these for existing globals
    if GetLocale() == 'enGB' or GetLocale() == 'enUS' then
         MODUI.L = {
            -- ['global string']    =    "localised string",

            --  ACTION BAR  --
            --      bagbar.lua
            ['Full!']                                                           = 'Full!',
            --      stats.lua
            ['FPS']                                                             = 'FPS',
            ['(.+) Found']                                                      = '(.+) Found', -- capturing total online from /who window pane
            ['stats']                                                           = 'stats',
            ['Total Users Online']                                              = 'Total Users Online',
            ['Ping']                                                            = 'Ping', --  alternative: "latency" ?
            ['Framerate']                                                       = 'Framerate',
            ['Money earned this session']                                       = 'Money earned this session',
            ['Time played this session']                                        = 'Time played this session',
            ['EXP earned this session']                                         = 'EXP earned this session',
            ['EXP rate per hour']                                               = 'EXP rate per hour',
            ['AddOns Loaded']                                                   = 'AddOns Loaded',

            --  BAG  --
            --      bag.lua
            ['Free Space:']                                                     = 'Free Space:',

            -- CASTBAR
            ['Hearthstone']                                                     = 'Hearthstone',
            ['Fishing']                                                         = 'Fishing',
            ['Herb Gathering']                                                  = 'Herb Gathering',
            ['Mining']                                                          = 'Mining',
            ['Aimed Shot']                                                      = 'Aimed Shot',

            --  CHAT --
            --      event.lua
            ['Reputation with (.+) increased by (.+).']                         = 'Reputation with (.+) increased by (.+).',
            ['You are now (.+) with (.+).']                                     = 'You are now (.+) with (.+).',
            ['(.+) dies, you gain (.+) experience. %(%+(.+)exp Rested bonus%)'] = '(.+) dies, you gain (.+) experience. %(%+(.+)exp Rested bonus%)',
            ['(.+) dies, you gain (.+) experience.']                            = '(.+) dies, you gain (.+) experience.',
            ['You gain (.+) experience.']                                       = 'You receive currency: (.+)%.',
            ['You receive currency: (.+)%.']                                    = 'You receive currency: (.+)%.',
            ['You\'ve lost (.+)%.']                                             = 'You\'ve lost (.+)%.',
            ['You receive item: (.+)%.']                                        = 'You receive item: (.+)%.',
            ['You receive loot: (.+)%.']                                        = 'You receive loot: (.+)%.',
            ['You create: (.+)%.']                                              = 'You create: (.+)%.',
            ['You are refunded: (.+)%.']                                        = 'You are refunded: (.+)%.',
            ['You have selected (.+) for: (.+)']                                = 'You have selected (.+) for: (.+)',
            ['Received item: (.+)%.']                                           = 'Received item: (.+)%.',
            ['(.+) receives item: (.+)%.']                                      = '(.+) receives item: (.+)%.',
            ['(.+) receives loot: (.+)%.']                                      = '(.+) receives loot: (.+)%.',
            ['(.+) creates: (.+)%.']                                            = '(.+) creates: (.+)%.',
            ['Your skill in (.+) has increased to (.+).']                       = 'Your skill in (.+) has increased to (.+).',
            ['Received (.+), (.+).']                                            = 'Received (.+), (.+).',
            ['Received (.+).']                                                  = 'Received (.+).',
            ['Received (.+) of item: (.+).']                                    = 'Received (.+) of item: (.+).',
            -- ['(.+) completed.']                                              = '(.+) completed.',
            ['Quest accepted: (.+)']                                            = 'Quest accepted: (.+)',
            ['Received item: (.+)%.']                                           = 'Received item: (.+)%.',
            ['Experience gained: (.+).']                                        = 'Experience gained: (.+).',
            ['(.+) has come online.']                                           = '(.+) has come online.',
            ['(.+) has gone offline.']                                          = '(.+) has gone offline.',
            ['You are now Busy: in combat']                                     = 'You are now Busy: in combat',
            ['You are no longer marked Busy.']                                  = 'You are no longer marked Busy.',
            ['Discovered (.+): (.+) experience gained']                         = 'Discovered (.+): (.+) experience gained',
            ['You are now (.+) with (.+).']                                     = 'You are now (.+) with (.+).',
            ['Quest Accepted (.+)']                                             = 'Quest Accepted (.+)',
            ['You are now Away: AFK']                                           = 'You are now Away: AFK',
            ['You are no longer Away.']                                         = 'You are no longer Away.',
            ['You are no longer rested.']                                       = 'You are no longer rested.',
            ['You don\'t meet the requirements for that quest.']                = 'You don\'t meet the requirements for that quest.',
            ['No player named \'(.+)\' is currently playing.']                  = 'No player named \'(.+)\' is currently playing.',
            ['(.+) has joined the party.']                                      = '(.+) has joined the party.',
            ['(.+) has joined the raid group']                                  = '(.+) has joined the raid group',
            ['(.+) has left the raid group']                                    = '(.+) has left the raid group',
            ['(.+) creates (.+).']                                              = '(.+) creates (.+).',
            ['Guild Message of the Day']                                        = 'Guild Message of the Day',
            --      quest.lua
            ['Quest description too long']                                      = 'Quest description too long',

            --  GLOBALS  --
            --      shit.lua
            ['trash items have been sold']                                      = 'trash items have been sold',
            ['Sell all grey items held in inventory.']                          = 'Sell all grey items held in inventory.',
            --      table.lua
            --      TODO: spells will be in their localised form in the combat log
            --          and an other method through which we track them (tooltip etc)
            --          so we need to export all entries in here.
            --      unitcasting.lua
            ['(.+) begins to cast (.+).']                                       = '(.+) begins to cast (.+).',
            ['(.+) begins to perform (.+).']                                    = '(.+) begins to perform (.+).',
            ['(.+) gains (.+).']                                                = '(.+) gains (.+).',
            ['(.+) fades from (.+).']                                           = '(.+) fades from (.+).',
            ['(.+) is afflicted by (.+).']                                      = '(.+) is afflicted by (.+).',
            ['(.+)\'s (.+) is removed.']                                        = '(.+)\'s (.+) is removed.',
            ['(.+)\'s (.+) hits (.+) for (.+)']                                 = '(.+)\'s (.+) hits (.+) for (.+)',
            ['(.+)\'s (.+) crits (.+) for (.+)']                                = '(.+)\'s (.+) crits (.+) for (.+)',
            ['(.+)\'s (.+) is absorbed by (.+).']                               = '(.+)\'s (.+) is absorbed by (.+).',
            ['Your (.+) hits (.+) for (.+)']                                    = 'Your (.+) hits (.+) for (.+)',
            ['Your (.+) crits (.+) for (.+)']                                   = 'Your (.+) crits (.+) for (.+)',
            ['Your (.+) is absorbed by (.+).']                                  = 'Your (.+) is absorbed by (.+).',
            ['(.+)\'s (.+) fails.']                                             = '(.+)\'s (.+) fails.',
            ['(.+) suffers (.+) from (.+)\'s (.+).']                            = '(.+) suffers (.+) from (.+)\'s (.+).',
            ['You suffer (.+) from (.+)\'s (.+).']                              = 'You suffer (.+) from (.+)\'s (.+).',
            ['(.+)\'s (.+) was resisted by (.+).']                              = '(.+)\'s (.+) was resisted by (.+).',
            ['.+)\'s (.+) was resisted.']                                       = '.+)\'s (.+) was resisted.',
            ['(.+) gains (.+) health from (.+)\'s (.+).']                       = '(.+) gains (.+) health from (.+)\'s (.+).',
            ['You gain (.+) health from (.+)\'s (.+).']                         = 'You gain (.+) health from (.+)\'s (.+).',
            ['(.+) attempts to run away in fear!']                              = '(.+) attempts to run away in fear!',
            ['Your (.+) heals (.+) for (.+).']                                  = 'Your (.+) heals (.+) for (.+).',
            ['Your (.+) critically heals (.+) for (.+).']                       = 'Your (.+) critically heals (.+) for (.+).',
            ['(.+) gains (.+) health from your (.+).']                          = '(.+) gains (.+) health from your (.+).',

            --  MAPS  --
            --      pins.lua
            --      world.lua
            --      do cities & zones have localised names? is "blackwing lair" different in german + chinese?

            --  NAMEPLATES  --
            ['Orange Tabby']                                                    = 'Orange Tabby',
            ['Silver Tabby']                                                    = 'Silver Tabby',
            ['Bombay']                                                          = 'Bombay',
            ['Cornish Rex']                                                     = 'Cornish Rex',
            ['Siamese']                                                         = 'Siamese',
            ['Hawk Owl']                                                        = 'Hawk Owl',
            ['Great Horned Owl']                                                = 'Great Horned Owl',
            ['Cockatiel']                                                       = 'Cockatiel',
            ['Senegal']                                                         = 'Senegal',
            ['Green Wing Macaw']                                                = 'Green Wing Macaw',
            ['Hyacinth Macaw']                                                  = 'Hyacinth Macaw',
            ['Black Kingsnake']                                                 = 'Black Kingsnake',
            ['Brown Snake']                                                     = 'Brown Snake',
            ['Crimson Snake']                                                   = 'Crimson Snake',
            ['Prairie Dog']                                                     = 'Prairie Dog',
            ['Cockroach']                                                       = 'Cockroach',
            ['Ancona Chicken']                                                  = 'Ancona Chicken',
            ['Worg Pup']                                                        = 'Worg Pup',
            ['Smolderweb Hatchling']                                            = 'Smolderweb Hatchling',
            ['Mechanical Chicken']                                              = 'Mechanical Chicken',
            ['Mechanical Squirrel']                                             = 'Mechanical Squirrel',
            ['Lifelike Mechanical Toad']                                        = 'Lifelike Mechanical Toad',
            ['Pet Bombling']                                                    = 'Pet Bombling',
            ['Lil\' Smokey']                                                    = 'Lil\' Smokey',
            ['Sprite Darter']                                                   = 'Sprite Darter',
            ['Tiny Black Whelpling']                                            = 'Tiny Black Whelpling',
            ['Tiny Emerald Whelpling']                                          = 'Tiny Emerald Whelpling',
            ['Tiny Crimson Whelpling']                                          = 'Tiny Crimson Whelpling',
            ['Unconscious Dig Rat']                                             = 'Unconscious Dig Rat',

            --  OPTIONS  --
            --      menu.lua
            ['modui options']                                                   = 'modui options',
            ['Hello! You are using version v70 of |cffff6c6cmodui|r. You can find the latest version and further support on the dedicated thread on Nostalrius\' forums:'] = 'Hello! You are using version v70 of |cffff6c6cmodui|r. You can find the latest version and further support on the dedicated thread on Nostalrius\' forums:',
            ['This panel offers several further customisation options and toggles to your UI, cycle through the different menus with the tabbed buttons located at the top of this window.'] = 'This panel offers several further customisation options and toggles to your UI, cycle through the different menus with the tabbed buttons located at the top of this window.'
            ['Reload UI']                                                       = 'Reload UI',
            ['Your new settings require a UI reload to take effect.']           = 'Your new settings require a UI reload to take effect.',
            --      options_actionbar.lua
            ['Actionbar']                                                       = 'Actionbar',
            ['Positioning of 3rd & 4th Actionbars']                             = 'Positioning of 3rd & 4th Actionbars',
            ['Bottom Row']                                                      = 'Bottom Row',
            ['Default']                                                         = 'Default',
            ['Button Layout']                                                   = 'Button Layout',
            --      options_colour.lua
            ['Class Colour UI']                                                 = 'Class Colour UI',
            ['Reset to Default']                                                = 'Reset to Default',
            ['UI Colour']                                                       = 'UI Colour',
            --      options_display.lua
            ['Gryphon']                                                         = 'Gryphon',
            ['Lion']                                                            = 'Lion',
            ['Switch End Cap Textures']                                         = 'Switch End Cap Textures',
            ['MainBar Gryphon Options']                                         = 'MainBar Gryphon Options',
            ['Toggle Display of MainMenu End Cap Textures']                     = 'Toggle Display of MainMenu End Cap Textures',
            ['Toggle Timestamps on Chat Messages']                              = 'Toggle Timestamps on Chat Messages',
            ['Chat Messages']                                                   = 'Chat Messages',
            ['Toggle Custom Chat Channel Formatting']                           = 'Toggle Custom Chat Channel Formatting',
            ['Toggle |cffc600ff[Brackets]|r on Item Links.']                    = 'Toggle |cffc600ff[Brackets]|r on Item Links.',
            ['Round Numbers']                                                   = 'Round Numbers',
            ['Aura Duration Formatting']                                        = 'Aura Duration Formatting',
            ['Auras']                                                           = 'Auras',
            --      options_elements.lua
            ['One Bag']                                                         = 'One Bag',
            ['Modified Map (Battleground)']                                     = 'Modified Map (Battleground)',
            ['Modified Map (World)']                                            = 'Modified Map (World)',
            ['Maps for Dungeons']                                               = 'Maps for Dungeons',
            ['Modified Nameplates']                                             = 'Modified Nameplates',
            ['Modified Objective Tracker']                                      = 'Modified Objective Tracker',
            ['Modified Tooltip']                                                = 'Modified Tooltip',
            ['Modified Unitframes']                                             = 'Modified Unitframes',
            ['PvP Battleground Timers']                                         = 'PvP Battleground Timers',
            ['PvP Rank Tracking']                                               = 'PvP Rank Tracking',
            ['Stopwatch']                                                       = 'Stopwatch',
            ['Elements']                                                        = 'Elements',
            ['Toggle individual components of modui on or off on demand.']      = 'Toggle individual components of modui on or off on demand.',
            --      options_raidframes.lua
            ['Raid Frames']                                                     = 'Raid Frames',
            ['Coming Soon!']                                                    = 'Coming Soon!',
            --      options_status.lua
            ['Percent']                                                         = 'Percent',
            ['True Value']                                                      = 'True Value',
            ['Toggle Horizontally Aligned or Default Status Text Positions on UnitFrames'] = 'Toggle Horizontally Aligned or Default Status Text Positions on UnitFrames'
            ['Will reload ui!']                                                 = 'Will reload ui!'
            ['Positioning']                                                     = 'Positioning',
            ['\% or True Value Text on Statusbars']                             = '\% or True Value Text on Statusbars',
            ['Formatting']                                                      = 'Formatting',
            ['Show Both True & \% Values on Statusbars (Disables Slider Option)'] = 'Show Both True & \% Values on Statusbars (Disables Slider Option)',
            ['Status Text']                                                     = 'Status Text',

            --  PVP --
            --      ab.lua
            ['claims the (.+)']                                                 = 'claims the (.+)',
            ['(.+) claims the (.+)! If left unchallenged, the (.+) will control it in 1 minute!'] = '(.+) claims the (.+)! If left unchallenged, the (.+) will control it in 1 minute!',
            ['has assaulted the (.+)']                                          = 'has assaulted the (.+)',
            ['(.+) has assaulted the (.+)']                                     = '(.+) has assaulted the (.+)',
            ['has taken the (.+)']                                              = 'has taken the (.+)',
            ['has defended the (.+)']                                           = 'has defended the (.+)',
            ['The (.+) wins']                                                   = 'The (.+) wins',
            ['claims the (.+)']                                                 = 'claims the (.+)',
            ['(.+) has defended the (.+)']                                      = '(.+) has defended the (.+)',
            ['(.+) has taken the (.+)']                                         = '(.+) has taken the (.+)',
            ['(.+) claims the (.+)']                                            = '(.+) claims the (.+)',
            --      av.lua
            ['(.+) is under attack!']                                           = '(.+) is under attack!',
            ['your General is under attack!']                                   = 'your General is under attack!',
            ['(.+) is under attack! If left unchecked, the (.+) will (.+) it!'] = '(.+) is under attack! If left unchecked, the (.+) will (.+) it!',
            ['The (.+)']                                                        = 'The (.+)',   -- ie. "The Stonehearth Graveyard", captures the first half of previous table entry string
            ['was taken by the (.+)!']                                          = 'was taken by the (.+)!',
            ['was destroyed by the (.+)!']                                      = 'was destroyed by the (.+)!',
            ['The (.+) was taken']                                              = 'The (.+) was taken',
            ['The (.+) was taken by the (.+)!']                                 = 'The (.+) was taken by the (.+)!',
            ['(.+) was taken by the (.+)!']                                     = '(.+) was taken by the (.+)!',
            ['The (.+) was destroyed']                                          = 'The (.+) was destroyed',
            ['The (.+) was destroyed by the (.+)!']                             = 'The (.+) was destroyed by the (.+)!',
            ['(.+) was destroyed by the (.+)!']                                 = '(.+) was destroyed by the (.+)!',
            --      rank.lua
            ['PvP Rank']                                                        = 'PvP Rank',
            ['Progress']                                                        = 'Progress',
            ['Current RP']                                                      = 'Current RP',
            ['RP to next rank']                                                 = 'RP to next rank',
            ['RP gained this week']                                             = 'RP gained this week',
            ['These totals give a projection of the honour points needed to reach a new rank at the end of the week. PvP rankings are fluid & dependent on total RP earned across the server — therefore results may vary.'] = 'These totals give a projection of the honour points needed to reach a new rank at the end of the week. PvP rankings are fluid & dependent on total RP earned across the server — therefore results may vary.',
            ['Click to broadcast data in chat window.']                         = 'Click to broadcast data in chat window.',
            --      wsg.lua
            ['Click to Target']                                                 = 'Click to Target',
            ['The Alliance (.+) was picked up by (.+)!']                        = 'The Alliance (.+) was picked up by (.+)!',
            ['The Alliance (.+) was dropped by (.+)!']                          = 'The Alliance (.+) was dropped by (.+)!',
            ['captured the Alliance (.+)!']                                     = 'captured the Alliance (.+)!',
            ['The Horde (.+) was picked up by (.+)!']                           = 'The Horde (.+) was picked up by (.+)!',
            ['The Horde (.+) was dropped by (.+)!']                             = 'The Horde (.+) was dropped by (.+)!',
            ['captured the Horde (.+)!']                                        = 'captured the Horde (.+)!',
            ['+ Alliance Flag']                                                 = '+ Alliance Flag',
            ['+ Horde Flag']                                                    = '+ Horde Flag',

            --  RAID --
            ['Mark as Tank']                                                    = 'Mark as Tank',
            ['group']                                                           = 'group',
            ['Click to show/hide Raid Frames']                                  = 'Click to show/hide Raid Frames',
            ['You have joined a raid group']                                    = 'You have joined a raid group',

            --  STOPWATCH --
            ['Click to Toggle Stopwatch.']                                      = 'Click to Toggle Stopwatch.',


            --  TOOLTIP --
            ['You!']                                                            = 'You!',
            ['Level (.+)']                                                      = 'Level (.+)',             -- capturing line 2 of the tooltip for player units
            ['(Player)']                                                        = '(Player)',               --
            ['Level (.+) (.+) (.+)']                                            = 'Level (.+) (.+) (.+)',   --
            ['Level (.+) ((.+))']                                               = 'Level (.+) ((.+))',      --
            ['Target']                                                          = 'Target',


            --  UNITFRAME  --
            --      move.lua
            ['Shift + Drag to move']                                            = 'Shift + Drag to move',
            --      shards.lua
            ['Soul Shard']                                                      = 'Soul Shard',
            ['Souls Shards stored.']                                            = 'Souls Shards stored.',
            --      totems.lua
            ['You cast (.+) Totem.']                                            = 'You cast (.+) Totem.',
        }
    end

    --
