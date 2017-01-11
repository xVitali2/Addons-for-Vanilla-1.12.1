

    -- TODO:  check each of these for existing globals
    if GetLocale() == 'ruRU' then
         MODUI.L = {
            -- ['global string']    =    "localised string",

            --  ACTION BAR  --
            --      bagbar.lua
            ['Full!']                                                           = '',
            --      stats.lua
            ['FPS']                                                             = '',
            ['(.+) Found']                                                      = '', --  capturing total online from /who window pane
            ['stats']                                                           = '',
            ['Total Users Online']                                              = '',
            ['Ping']                                                            = '', --  alternative: "latency" ?
            ['Framerate']                                                       = '',
            ['Money earned this session']                                       = '',
            ['Time played this session']                                        = '',
            ['EXP earned this session']                                         = '',
            ['EXP rate per hour']                                               = '',
            ['AddOns Loaded']                                                   = '',

            --  BAG  --
            --      bag.lua
            ['Free Space:']                                                     = '',

            -- CASTBAR
            ['Hearthstone']                                                     = '',
            ['Fishing']                                                         = '',
            ['Herb Gathering']                                                  = '',
            ['Mining']                                                          = '',

            --  CHAT --
            --      event.lua
            ['The Alliance Flag was picked up by (.+)!']                        = '',
            ['The Alliance Flag was dropped by (.+)!']                          = '',
            ['The Alliance Flag was returned to its base by (.+)!']             = '',
            ['The Horde flag was picked up by (.+)!']                           = '',
            ['The Horde flag was dropped by (.+)!']                             = '',
            ['The Horde flag was returned to its base by (.+)!']                = '',
            ['Reputation with (.+) increased by (.+).']                         = '',
            ['You are now (.+) with (.+).']                                     = '',
            ['(.+) dies, you gain (.+) experience. %(%+(.+)exp Rested bonus%)'] = '',
            ['(.+) dies, you gain (.+) experience.']                            = '',
            ['You gain (.+) experience.']                                       = '',
            ['You receive currency: (.+)%.']                                    = '',
            ['You\'ve lost (.+)%.']                                             = '',
            ['You receive item: (.+)%.']                                        = '',
            ['You receive loot: (.+)%.']                                        = '',
            ['You create: (.+)%.']                                              = '',
            ['You are refunded: (.+)%.']                                        = '',
            ['You have selected (.+) for: (.+)']                                = '',
            ['Received item: (.+)%.']                                           = '',
            ['(.+) receives item: (.+)%.']                                      = '',
            ['(.+) receives loot: (.+)%.']                                      = '',
            ['(.+) creates: (.+)%.']                                            = '',
            ['Your skill in (.+) has increased to (.+).']                       = '',
            ['Received (.+), (.+).']                                            = '',
            ['Received (.+).']                                                  = '',
            ['Received (.+) of item: (.+).']                                    = '',
            -- ['(.+) completed.']                                              = '',
            ['Quest accepted: (.+)']                                            = '',
            ['Received item: (.+)%.']                                           = '',
            ['Experience gained: (.+).']                                        = '',
            ['(.+) has come online.']                                           = '',
            ['(.+) has gone offline.']                                          = '',
            ['You are now Busy: in combat']                                     = '',
            ['You are no longer marked Busy.']                                  = '',
            ['Discovered (.+): (.+) experience gained']                         = '',
            ['You are now (.+) with (.+).']                                     = '',
            ['Quest Accepted (.+)']                                             = '',
            ['You are now Away: AFK']                                           = '',
            ['You are no longer Away.']                                         = '',
            ['You are no longer rested.']                                       = '',
            ['You don\'t meet the requirements for that quest.']                = '',
            ['No player named \'(.+)\' is currently playing.']                  = '',
            ['(.+) has joined the party.']                                      = '',
            ['(.+) has joined the raid group']                                  = '',
            ['(.+) has left the raid group']                                    = '',
            ['(.+) creates (.+).']                                              = '',
            ['Guild Message of the Day']                                        = '',
            --      quest.lua
            ['Quest description too long']                                      = '',

            --  GLOBALS  --
            --      shit.lua
            ['trash items have been sold']                                      = '',
            ['Sell all grey items held in inventory.']                          = '',
            --      table.lua
            --      TODO: spells will be in their localised form in the combat log
            --          and an other method through which we track them (tooltip etc)
            --          so we need to export all entries in here.
            --      unitcasting.lua
            ['(.+) begins to cast (.+).']                                       = '',
            ['(.+) begins to perform (.+).']                                    = '',
            ['(.+) gains (.+).']                                                = '',
            ['(.+) fades from (.+).']                                           = '',
            ['(.+) is afflicted by (.+).']                                      = '',
            ['(.+)\'s (.+) is removed.']                                        = '',
            ['(.+)\'s (.+) hits (.+) for (.+)']                                 = '',
            ['(.+)\'s (.+) crits (.+) for (.+)']                                = '',
            ['(.+)\'s (.+) is absorbed by (.+).']                               = '',
            ['Your (.+) hits (.+) for (.+)']                                    = '',
            ['Your (.+) crits (.+) for (.+)']                                   = '',
            ['Your (.+) is absorbed by (.+).']                                  = '',
            ['(.+)\'s (.+) fails.']                                             = '',
            ['(.+) suffers (.+) from (.+)\'s (.+).']                            = '',
            ['You suffer (.+) from (.+)\'s (.+).']                              = '',
            ['(.+)\'s (.+) was resisted by (.+).']                              = '',
            ['.+)\'s (.+) was resisted.']                                       = '',
            ['(.+) gains (.+) health from (.+)\'s (.+).']                       = '',
            ['You gain (.+) health from (.+)\'s (.+).']                         = '',
            ['(.+) attempts to run away in fear!']                              = '',
            ['Your (.+) heals (.+) for (.+).']                                  = '',
            ['Your (.+) critically heals (.+) for (.+).']                       = '',
            ['(.+) gains (.+) health from your (.+).']                          = '',

            --  MAPS  --
            --      pins.lua
            --      world.lua
            --      do cities & zones have localised names? is "blackwing lair" different in german + chinese?

            --  NAMEPLATES  --
            ['Orange Tabby']                                                    = '',
            ['Silver Tabby']                                                    = '',
            ['Bombay']                                                          = '',
            ['Cornish Rex']                                                     = '',
            ['Siamese']                                                         = '',
            ['Hawk Owl']                                                        = '',
            ['Great Horned Owl']                                                = '',
            ['Cockatiel']                                                       = '',
            ['Senegal']                                                         = '',
            ['Green Wing Macaw']                                                = '',
            ['Hyacinth Macaw']                                                  = '',
            ['Black Kingsnake']                                                 = '',
            ['Brown Snake']                                                     = '',
            ['Crimson Snake']                                                   = '',
            ['Prairie Dog']                                                     = '',
            ['Cockroach']                                                       = '',
            ['Ancona Chicken']                                                  = '',
            ['Worg Pup']                                                        = '',
            ['Smolderweb Hatchling']                                            = '',
            ['Mechanical Chicken']                                              = '',
            ['Mechanical Squirrel']                                             = '',
            ['Lifelike Mechanical Toad']                                        = '',
            ['Pet Bombling']                                                    = '',
            ['Lil\' Smokey']                                                    = '',
            ['Sprite Darter']                                                   = '',
            ['Tiny Black Whelpling']                                            = '',
            ['Tiny Emerald Whelpling']                                          = '',
            ['Tiny Crimson Whelpling']                                          = '',
            ['Unconscious Dig Rat']                                             = '',

            --  OPTIONS  --
            --      menu.lua
            ['modui options']                                                   = '',
            ['Hello! You are using version v70 of |cffff6c6cmodui|r. You can find the latest version and further support on the dedicated thread on Nostalrius\' forums:'] = '',
            ['This panel offers several further customisation options and toggles to your UI, cycle through the different menus with the tabbed buttons located at the top of this window.'] = '',
            ['Reload UI']                                                       = '',
            ['Your new settings require a UI reload to take effect.']           = '',
            --      options_actionbar.lua
            ['Actionbar']                                                       = '',
            ['Positioning of 3rd & 4th Actionbars']                             = '',
            ['Bottom Row']                                                      = '',
            ['Default']                                                         = '',
            ['Button Layout']                                                   = '',
            --      options_colour.lua
            ['Class Colour UI']                                                 = '',
            ['Reset to Default']                                                = '',
            ['UI Colour']                                                       = '',
            --      options_display.lua
            ['Gryphon']                                                         = '',
            ['Lion']                                                            = '',
            ['Switch End Cap Textures']                                         = '',
            ['MainBar Gryphon Options']                                         = '',
            ['Toggle Display of MainMenu End Cap Textures']                     = '',
            ['Toggle Timestamps on Chat Messages']                              = '',
            ['Chat Messages']                                                   = '',
            ['Toggle Custom Chat Channel Formatting']                           = '',
            ['Toggle |cffc600ff[Brackets]|r on Item Links.']                    = '',
            ['Round Numbers']                                                   = '',
            ['Aura Duration Formatting']                                        = '',
            ['Auras']                                                           = '',
            --      options_elements.lua
            ['One Bag']                                                         = '',
            ['Modified Map (Battleground)']                                     = '',
            ['Modified Map (World)']                                            = '',
            ['Maps for Dungeons']                                               = '',
            ['Modified Nameplates']                                             = '',
            ['Modified Objective Tracker']                                      = '',
            ['Modified Tooltip']                                                = '',
            ['Modified Unitframes']                                             = '',
            ['PvP Battleground Timers']                                         = '',
            ['PvP Rank Tracking']                                               = '',
            ['Stopwatch']                                                       = '',
            ['Elements']                                                        = '',
            ['Toggle individual components of modui on or off on demand.']      = '',
            --      options_raidframes.lua
            ['Raid Frames']                                                     = '',
            ['Coming Soon!']                                                    = '',
            --      options_status.lua
            ['Percent']                                                         = '',
            ['True Value']                                                      = '',
            ['Toggle Horizontally Aligned or Default Status Text Positions on UnitFrames'] = '',
            ['Will reload ui!']                                                 = '',
            ['Positioning']                                                     = '',
            ['\% or True Value Text on Statusbars']                             = '',
            ['Formatting']                                                      = '',
            ['Show Both True & \% Values on Statusbars (Disables Slider Option)'] = '',
            ['Status Text']                                                     = '',

            --  PVP --
            --      ab.lua
            ['claims the (.+)']                                                 = '',
            ['(.+) claims the (.+)! If left unchallenged, the (.+) will control it in 1 minute!'] = '',
            ['has assaulted the (.+)']                                          = '',
            ['(.+) has assaulted the (.+)']                                     = '',
            ['has taken the (.+)']                                              = '',
            ['has defended the (.+)']                                           = '',
            ['The (.+) wins']                                                   = '',
            ['claims the (.+)']                                                 = '',
            ['(.+) has defended the (.+)']                                      = '',
            ['(.+) has taken the (.+)']                                         = '',
            ['(.+) claims the (.+)']                                            = '',
            --      av.lua
            ['(.+) is under attack!']                                           = '',
            ['your General is under attack!']                                   = '',
            ['(.+) is under attack! If left unchecked, the (.+) will (.+) it!'] = '',
            ['The (.+)']                                                        = '',   -- ie. "The Stonehearth Graveyard", captures the first half of previous table entry string
            ['was taken by the (.+)!']                                          = '',
            ['was destroyed by the (.+)!']                                      = '',
            ['The (.+) was taken']                                              = '',
            ['The (.+) was taken by the (.+)!']                                 = '',
            ['(.+) was taken by the (.+)!']                                     = '',
            ['The (.+) was destroyed']                                          = '',
            ['The (.+) was destroyed by the (.+)!']                             = '',
            ['(.+) was destroyed by the (.+)!']                                 = '',
            --      rank.lua
            ['PvP Rank']                                                        = '',
            ['Progress']                                                        = '',
            ['Current RP']                                                      = '',
            ['RP to next rank']                                                 = '',
            ['RP gained this week']                                             = '',
            ['These totals give a projection of the honour points needed to reach a new rank at the end of the week. PvP rankings are fluid & dependent on total RP earned across the server — therefore results may vary.'] = '',
            ['Click to broadcast data in chat window.']                         = '',
            --      wsg.lua
            ['Click to Target']                                                 = '',
            ['The Alliance (.+) was picked up by (.+)!']                        = '',
            ['The Alliance (.+) was dropped by (.+)!']                          = '',
            ['captured the Alliance (.+)!']                                     = '',
            ['The Horde (.+) was picked up by (.+)!']                           = '',
            ['The Horde (.+) was dropped by (.+)!']                             = '',
            ['captured the Horde (.+)!']                                        = '',
            ['+ Alliance Flag']                                                 = '',
            ['+ Horde Flag']                                                    = '',

            --  RAID --
            ['Mark as Tank']                                                    = '',
            ['group']                                                           = '',
            ['Click to show/hide Raid Frames']                                  = '',
            ['You have joined a raid group']                                    = '',

            --  STOPWATCH --
            ['Click to Toggle Stopwatch.']                                      = '',


            --  TOOLTIP --
            ['You!']                                                            = '',
            ['Level (.+)']                                                      = '',   -- capturing line 2 of the tooltip for player units
            ['(Player)']                                                        = '',   --
            ['Level (.+) (.+) (.+)']                                            = '',   --
            ['Level (.+) ((.+))']                                               = '',   --
            ['Target']                                                          = '',


            --  UNITFRAME  --
            --      move.lua
            ['Shift + Drag to move']                                            = '',
            --      shards.lua
            ['Soul Shard']                                                      = '',
            ['Souls Shards stored.']                                            = '',
            --      totems.lua
            ['You cast (.+) Totem.']                                            = '',
        }
    end

    --
