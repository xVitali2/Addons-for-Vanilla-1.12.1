-------------------------------------------------------------------------------------
-- Title: Mik's Scrolling Battle Text
-- Author: Mik
-- Maintainer: Athene
-------------------------------------------------------------------------------------

-- Create "namespace."
MikSBT = {};

-------------------------------------------------------------------------------
-- Mod Constants
-------------------------------------------------------------------------------

MikSBT.MOD_NAME		= "MikScrollingBattleText"
MikSBT.VERSION_NUMBER	= 4.43;
MikSBT.VERSION_STRING	= "v4.43 beta";
MikSBT.WINDOW_TITLE	= "Mik's Scrolling Battle Text " .. MikSBT.VERSION_STRING .. " - \124cffF58CBA\124hAthene Edit\124h\124r";

MikSBT.COMMAND		= "/msbt";

local BS = AceLibrary("Babble-Spell-2.2")
local L = AceLibrary("AceLocale-2.2"):new(MikSBT.MOD_NAME)

-------------------------------------------------------------------------------
-- English (Default)
-------------------------------------------------------------------------------

------------------------------
-- Commands
------------------------------
MikSBT.COMMAND_RESET		= "reset";
MikSBT.COMMAND_DISABLE		= "disable";
MikSBT.COMMAND_ENABLE		= "enable";
MikSBT.COMMAND_DISPLAY		= "display";
MikSBT.COMMAND_SHOWVER		= "version";
MikSBT.COMMAND_STATS		= "stats";
MikSBT.COMMAND_SEARCH	      = "search";
MikSBT.COMMAND_DEBUG		= "debug";
MikSBT.COMMAND_HELP		= "help";

MikSBT.COMMAND_USAGE = {
 "Usage: " .. MikSBT.COMMAND .. " <command> [params]",
 " Commands:",
 "  " .. MikSBT.COMMAND_RESET .. " - Reset the current profile to the default settings.",
 "  " .. MikSBT.COMMAND_DISABLE .. " - Disables the mod.",
 "  " .. MikSBT.COMMAND_ENABLE .. " - Enables the mod.",
 "  " .. MikSBT.COMMAND_SHOWVER .. " - Shows the current version.",
 "  " .. MikSBT.COMMAND_STATS .. " - Reports stats about table recycling.",
 "  " .. MikSBT.COMMAND_SEARCH .. " filter - Sets a filter for searching event types.",
 "  " .. MikSBT.COMMAND_DEBUG .. " - Toggles debug mode.",
 "  " .. MikSBT.COMMAND_HELP .. " - Show the command usage.",
};


------------------------------
-- Output messages
------------------------------

MikSBT.MSG_DEBUG_ENABLE				= L["Debug mode has been enabled."];
MikSBT.MSG_DEBUG_DISABLE			= L["Debug mode has been disabled."];
MikSBT.MSG_SEARCH_ENABLE			= L["Event search mode has been enabled.  Searching for: "];
MikSBT.MSG_SEARCH_DISABLE			= L["Event search mode has been disabled."];
MikSBT.MSG_DISABLE					= L["The mod is now disabled."];
MikSBT.MSG_ENABLE					= L["The mod is now enabled."];
MikSBT.MSG_HITS						= L["Hits"];
MikSBT.MSG_CRIT						= L["Crit"];
MikSBT.MSG_CRITS					= L["Crits"];
MikSBT.MSG_MULTIPLE_TARGETS			= L["Multiple"];
MikSBT.MSG_VULERNABLE_TRAILER		= L[" (%d vulnerability)"];
MikSBT.MSG_OVERHEAL_TRAILER			= L[" <\124cff00b37e\124h%d\124h\124r>"];
MikSBT.MSG_PROFILE_RESET			= L["Profile Reset"];
MikSBT.MSG_ENVIRONMENTAL_DROWNING	= L["Drowning"];
MikSBT.MSG_ENVIRONMENTAL_FALLING	= L["Falling"];
MikSBT.MSG_ENVIRONMENTAL_FATIGUE	= L["Fatigue"];
MikSBT.MSG_ENVIRONMENTAL_FIRE		= L["Fire"];
MikSBT.MSG_ENVIRONMENTAL_LAVA		= L["Lava"];
MikSBT.MSG_ENVIRONMENTAL_SLIME		= L["Slime"];



------------------------------
-- Font info
------------------------------

-- Holds the available fonts.
if (GetLocale()=="ruRU") then
MikSBT.AVAILABLE_FONTS = {
 [1] = {Name="Comic", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\comic.ttf"},
 [2] = {Name="Skratch Punk", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\skratchpunk.ttf"},
 [3] = {Name="Friz", Path="Fonts\\FRIZQT__.TTF"},
 [4] = {Name="Morpheus", Path="Fonts\\MORPHEUS.TTF"},
 [5] = {Name="Skurri", Path="Fonts\\SKURRI.TTF"},
};
else
MikSBT.AVAILABLE_FONTS = {
 [1] = {Name="Adventure", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\adventure.ttf"},
 [2] = {Name="Backsplatter", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\backsplatter.ttf"},
 [3] = {Name="Budhand", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\budhand.ttf"},
 [4] = {Name="Comic", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\comic.ttf"},
 [5] = {Name="Creeper", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\creeper.ttf"},
 [6] = {Name="Friz", Path="Fonts\\FRIZQT__.TTF"},
 [7] = {Name="Porky", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\porky.ttf"},
 [8] = {Name="Signature", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\signature.ttf"},
 [9] = {Name="Black Castle", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\BlackCastleMF.ttf"},
 [10] = {Name="Exocet", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\exocet.ttf"},
 [11] = {Name="FuturaBold", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\FuturaBold.ttf"},
 [12] = {Name="Mail Ray Stuff", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\mailrays.ttf"},
 [13] = {Name="Pepsi", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\pepsi.ttf"},
 [14] = {Name="Bazooka", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\bazooka.ttf"},
 [15] = {Name="Cooline", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\cooline.ttf"},
 [16] = {Name="Yellowjacket", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\yellowjacket.ttf"},
 [17] = {Name="Defused", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\defused.ttf"},
 [18] = {Name="Zombie", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\zombie.ttf"},
 [19] = {Name="Basket Of Hammers", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\basketofhammers.ttf"},
 [20] = {Name="College", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\college.ttf"},
 [21] = {Name="Galaxy", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\galaxy.ttf"},
 [22] = {Name="Skratch Punk", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\skratchpunk.ttf"},
};
end

-- Holds the available font outlines.
MikSBT.AVAILABLE_OUTLINES = {
 [1] = {Name="None", Style=""},
 [2] = {Name="Thin", Style="OUTLINE"},
 [3] = {Name="Thick", Style="THICKOUTLINE"},
};

-- Holds the available text aligns.
MikSBT.AVAILABLE_TEXT_ALIGNS = {
 [1] = {Name="Left", AnchorPoint="BOTTOMLEFT"},
 [2] = {Name="Center", AnchorPoint="BOTTOM"},
 [3] = {Name="Right", AnchorPoint="BOTTOMRIGHT"},
};


------------------------------
-- Animation info
------------------------------

MikSBT.AVAILABLE_SCROLL_DIRECTIONS = {
 [1] = {Name="Up"},
 [2] = {Name="Down"},
}

-- Holds the available animation styles.
MikSBT.AVAILABLE_ANIMATION_STYLES = {
 [1] = {Name="Straight", AllowedScrollDirections={1,2}},
 [2] = {Name="Left Parabola", AllowedScrollDirections={1,2}},
 [3] = {Name="Right Parabola", AllowedScrollDirections={1,2}},
};


------------------------------
-- Trigger info
------------------------------

-- Holds the available trigger types.
MikSBT.AVAILABLE_TRIGGER_TYPES = {
 [1] = {Name="Self Health"},
 [2] = {Name="Self Mana"},
 [3] = {Name="Pet Health"},
 [4] = {Name="Enemy Target Health"},
 [5] = {Name="Friendly Target Health"},
 [6] = {Name="Search Pattern"},
};


------------------------------
-- Stances info
------------------------------

-- Holds the available stances.
MikSBT.AVAILABLE_STANCES = {
 [1] = {Name="|cffC79C6EBattle Stance|r/|cffFF7D0ABear Form|r/|cffFFF569Stealth|r/|cffF58CBADevotion Aura"},
 [2] = {Name="|cffC79C6EDefensive Stance|r/|cffFF7D0AAquatic Form|r/|cffF58CBARetribution Aura"},
 [3] = {Name="|cffC79C6EBeserker Stance|r/|cffFF7D0ACat Form|r/|cffF58CBAConcentration Aura"},
 [4] = {Name="|cffFF7D0ATravel Form|r/|cffF58CBAShadow Resistance Aura"},
 [5] = {Name="|cffFF7D0AMoonkin Form|r/|cffF58CBAFrost Resistance Aura"},
 [6] = {Name="|cffF58CBAFire Resistance Aura"},
 [7] = {Name="Any"},
};


------------------------------
-- Defaults
------------------------------
MikSBT.DEFAULT_PROFILE_NAME = "Default";

-- %a = amount of the attack, heal, gain, loss, etc.
-- %n = name of enemy/player
-- %s = name of the spell, ability, buff, debuff, power type, etc.
-- %t = damage type
MikSBT.DEFAULT_CONFIG = {
 CreationVersion 					= MikSBT.VERSION_NUMBER,
 ShowPartialEffects				= true,
 ShowOverheals					= true,
 ShowGameDamage					= true,
 UseStickyCrits					= true,
 ShowAllManaGains				= false,
 LowHealthSound					= true,
 LowManaSound					= true,
 AnimationStep					= 1.5,
 MasterFontSettings = {
  Normal 						= {FontIndex=1, OutlineIndex=2, FontSize=18},
  Crit 							= {FontIndex=2, OutlineIndex=2, FontSize=26},
 },
 BlizzardFontSettings = {
  Normal 						= {FontIndex=3},
 },
 DisplaySettings = {
  Incoming =  {
   Show						= true,
   FrameOffsets					= {x=-450, y=-170},
   AnimationStyle				= 1,
   ScrollDirection				= 1,
   ScrollHeight					= 450,
   FontSettings = {
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    TextAlignIndex				= 3,
   },
  },
  Outgoing = {
   Show						= true,
   FrameOffsets					= {x=450, y=-170},
   AnimationStyle				= 1,
   ScrollDirection				= 1,
   ScrollHeight					= 450,
   FontSettings = {
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    TextAlignIndex				= 1,
   },
  },
  Notification = {
   Show						= true,
   FrameOffsets					= {x=-300, y=-322},
   AnimationStyle				= 1,
   ScrollDirection				= 1,
   ScrollHeight					= 150,
   FontSettings = {
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize = 0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize = 0},
    TextAlignIndex				= 2,
   },
  },
 },
 EventSettings = {
  MSBT_EVENTTYPE_INCOMING_DAMAGE = {
   Show						= true,
   Message						= "-%a",
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_MISS = {
   Show						= true,
   Message						= MISS.."!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_DODGE = {
   Show						= true,
   Message						= DODGE.."!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PARRY = {
   Show						= true,
   Message						= PARRY.."!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_BLOCK = {
   Show						= true,
   Message						= BLOCK.."!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_ABSORB = {
   Show						= true,
   Message						= ABSORB.."!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_IMMUNE = {
   Show						= true,
   Message						= IMMUNE.."!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_DAMAGE = {
   Show						= true,
   Message						= "-%a",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_DOT = {
   Show						= true,
   Message						= "-%a",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_MISS = {
   Show						= true,
   Message						= MISS.."!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_DODGE = {
   Show						= true,
   Message						= DODGE.."!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_PARRY = {
   Show						= true,
   Message						= PARRY.."!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_BLOCK = {
   Show						= true,
   Message						= BLOCK.."!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_RESIST = {
   Show						= true,
   Message						= "(%s) "..RESIST.."!",
   FontSettings = {
    Color						= {r=0.502, g=0, b=0.502},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_ABSORB = {
   Show						= true,
   Message						= "(%s) "..ABSORB.."!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_IMMUNE = {
   Show						= true,
   Message						= "(%s) "..IMMUNE.."!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_REFLECT = {
   Show						= true,
   Message						= "(%s) "..REFLECT.."!",
   FontSettings = {
    Color						= {r=0.502, g=0, b=0.502},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_HEAL = {
   Show						= true,
   Message						= "+%a (%n)",
   FontSettings = {
    Color						= {r=0, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   }
  },
  MSBT_EVENTTYPE_INCOMING_HOT = {
   Show						= true,
   Message						= "+%a (%n)",
   FontSettings = {
    Color						= {r=0, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   }
  },
  MSBT_EVENTTYPE_INCOMING_ENVIRONMENTAL = {
   Show						= true,
   Message						= "-%a %s",
   FontSettings = {
    Color						= {r=1, g=0, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_DAMAGE = {
   Show						= true,
   Message						= L["-%a (Pet)"],
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_MISS = {
   Show						= true,
   Message						= MISS..L["! (Pet)"],
   FontSettings = {
    Color						= {r=0.2, g=0.4, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_DODGE = {
   Show						= true,
   Message						= DODGE..L["! (Pet)"],
   FontSettings = {
    Color						= {r=0.2, g=0.4, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_PARRY = {
   Show						= true,
   Message						= PARRY..L["! (Pet)"],
   FontSettings = {
    Color						= {r=0.2, g=0.4, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_BLOCK = {
   Show						= true,
   Message						= BLOCK..L["! (Pet)"],
   FontSettings = {
    Color						= {r=0.2, g=0.4, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_ABSORB = {
   Show						= true,
   Message						= ABSORB..L["! (Pet)"],
   FontSettings = {
    Color						= {r=1, g=0.7, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_IMMUNE = {
   Show						= true,
   Message						= IMMUNE..L["! (Pet)"],
   FontSettings = {
    Color						= {r=1, g=0.7, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_SPELL_DAMAGE = {
   Show						= true,
   Message						= L["-%a (Pet)"],
   FontSettings = {
    Color						= {r=1, g=0.7, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_SPELL_DOT = {
   Show						= true,
   Message						= L["-%a (Pet)"],
   FontSettings = {
    Color						= {r=1, g=0.7, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_SPELL_MISS = {
   Show						= true,
   Message						= MISS..L["! (Pet)"],
   FontSettings = {
    Color						= {r=0.2, g=0.4, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_SPELL_DODGE = {
   Show						= true,
   Message						= DODGE..L["! (Pet)"],
   FontSettings = {
    Color						= {r=0.2, g=0.4, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_SPELL_PARRY = {
   Show						= true,
   Message						= PARRY..L["! (Pet)"],
   FontSettings = {
    Color						= {r=0.2, g=0.4, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_SPELL_BLOCK = {
   Show						= true,
   Message						= BLOCK..L["! (Pet)"],
   FontSettings = {
    Color						= {r=0.2, g=0.4, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_SPELL_RESIST = {
   Show						= true,
   Message						= RESIST..L["! (Pet)"],
   FontSettings = {
    Color						= {r=0.5, g=0, b=0.4},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_SPELL_ABSORB = {
   Show						= true,
   Message						= "(%s) "..ABSORB..L["! (Pet)"],
   FontSettings = {
    Color						= {r=1, g=0.7, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_SPELL_IMMUNE = {
   Show						= true,
   Message						= "(%s) "..IMMUNE..L["! (Pet)"],
   FontSettings = {
    Color						= {r=1, g=0.7, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PET_HEAL = {
   Show						= true,
   Message						= L["+%a (%n) (Pet)"],
   FontSettings = {
    Color						= {r=0, g=1, b=0.4},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   }
  },
  MSBT_EVENTTYPE_INCOMING_PET_HOT = {
   Show						= true,
   Message						= L["+%a (%n) (Pet)"],
   FontSettings = {
    Color						= {r=0, g=1, b=0.4},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   }
  },
  MSBT_EVENTTYPE_OUTGOING_DAMAGE = {
   Show						= true,
   Message						= "%a",
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_MISS = {
   Show						= true,
   Message						= MISS.."!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_DODGE = {
   Show						= true,
   Message						= DODGE.."!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PARRY = {
   Show						= true,
   Message						= PARRY.."!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_BLOCK = {
   Show						= true,
   Message						= BLOCK.."!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_ABSORB = {
   Show						= true,
   Message						= ABSORB.."!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_IMMUNE = {
   Show						= true,
   Message						= IMMUNE.."!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_EVADE = {
   Show						= true,
   Message						= EVADE.."!",
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=22},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_DAMAGE = {
   Show						= true,
   Message						= "%a",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_DOT = {
   Show						= true,
   Message						= "%a",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_MISS = {
   Show						= true,
   Message						= MISS.."!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_DODGE = {
   Show						= true,
   Message						= DODGE.."!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_PARRY = {
   Show						= true,
   Message						= PARRY.."!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_BLOCK = {
   Show						= true,
   Message						= BLOCK.."!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_RESIST = {
   Show						= true,
   Message						= RESIST.."!",
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=0.698},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_ABSORB = {
   Show						= true,
   Message						= "(%s) "..ABSORB.."!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_IMMUNE = {
   Show						= true,
   Message						= "(%s) "..IMMUNE.."!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_REFLECT = {
   Show						= true,
   Message						= "(%s) "..REFLECT.."!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_EVADE = {
   Show						= true,
   Message						= "(%s) "..EVADE.."!",
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=22},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_HEAL = {
   Show						= true,
   Message						= "+%a",
   FontSettings = {
    Color						= {r=0, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=22},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_HOT = {
   Show						= true,
   Message						= "+%a",
   FontSettings = {
    Color						= {r=0, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  
  

  MSBT_EVENTTYPE_OUTGOING_PET_DAMAGE = {
   Show						= true,
   Message						= L["Pet %a"],
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },

  },
  MSBT_EVENTTYPE_OUTGOING_PET_MISS = {
   Show						= true,
   Message						= L["Pet "]..MISS.."!",
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_DODGE = {
   Show						= true,
   Message						= L["Pet "]..DODGE.."!",
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_PARRY = {
   Show						= true,
   Message						= L["Pet "]..PARRY.."!",
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_BLOCK = {
   Show						= true,
   Message						= L["Pet "]..BLOCK.."!",
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_ABSORB = {
   Show						= true,
   Message						= L["Pet "]..ABSORB.."!",
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_IMMUNE = {
   Show						= true,
   Message						= L["Pet "]..IMMUNE.."!",
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_EVADE = {
   Show						= true,
   Message						= L["Pet "]..EVADE.."!",
   FontSettings = {
    Color						= {r=1, g=0.502, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_DAMAGE = {
   Show						= true,
   Message						= L["Pet %a (%s)"],
   FontSettings = {
    Color						= {r=0.33, g=0.33, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_MISS = {
   Show						= true,
   Message						= L["Pet "]..MISS.."! (%s)",
   FontSettings = {
    Color						= {r=0.33, g=0.33, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_DODGE = {
   Show						= true,
   Message						= L["Pet "]..DODGE.."! (%s)",
   FontSettings = {
    Color						= {r=0.33, g=0.33, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_PARRY = {
   Show						= true,
   Message						= L["Pet "]..PARRY.."! (%s)",
   FontSettings = {
    Color						= {r=0.33, g=0.33, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_BLOCK = {
   Show						= true,
   Message						= L["Pet "]..BLOCK.."! (%s)",
   FontSettings = {
    Color						= {r=0.33, g=0.33, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_RESIST = {
   Show						= true,
   Message						= L["Pet "]..RESIST.."! (%s)",
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=0.698},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_ABSORB = {
   Show						= true,
   Message						= L["Pet "]..ABSORB.."! (%s)",
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_IMMUNE = {
   Show						= true,
   Message						= L["Pet "]..IMMUNE.."! (%s)",
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_EVADE = {
   Show						= true,
   Message						= L["Pet "]..EVADE.."! (%s)",
   FontSettings = {
    Color						= {r=1, g=0.502, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=22},
   },
  },



  MSBT_EVENTTYPE_NOTIFICATION_DEBUFF = {
   Show						= true,
   Message						= "[%s]",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0, g=0.502, b=0.502},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_BUFF = {
   Show						= true,
   Message						= "[%s]",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.698, g=0.698, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_ITEM_BUFF = {
   Show						= true,
   Message						= "[%s]",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.698, g=0.698, b=0.698},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_BUFF_FADE = {
   Show						= true,
   Message						= "-[%s]",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.698, g=0.698, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_COMBAT_ENTER = {
   Show						= true,
   Message						= L["+Combat"],
   IsSticky						= false,
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_COMBAT_LEAVE = {
   Show						= true,
   Message						= L["-Combat"],
   IsSticky						= false,
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_POWER_GAIN = {
   Show						= true,
   Message						= "+%a",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.3098039215686275, g=0.3098039215686275, b=0.8784313725490196},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_POWER_LOSS = {
   Show						= true,
   Message						= "-%a",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.7568627450980392, g=0.2705882352941176, b=0.8235294117647058},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_CP_GAIN = {
   Show						= true,
   Message						= L["%a CP"],
   IsSticky						= false,
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_CP_FULL = {
   Show						= true,
   Message						= L["%a CP Finish It!"],
   IsSticky						= false,
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_HONOR_GAIN = {
   Show						= true,
   Message						= "+%a "..HONOR,
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=0.698},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_REP_GAIN = {
   Show						= true,
   Message						= "+%a "..TUTORIAL_TITLE16.." (%s)",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=0.698},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_REP_LOSS = {
   Show						= true,
   Message						= "-%a "..TUTORIAL_TITLE16.." (%s)",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=0.698},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_SKILL_GAIN = {
   Show						= true,
   Message						= "%s: %a",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.333, g=0.333, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_EXPERIENCE_GAIN = {
   Show						= true,
   Message						= "%a XP",
   IsSticky						= true,
   FontSettings = {
    Color						= {r=0.756, g=0.270, b=0.823},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=26},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_PC_KILLING_BLOW = {
   Show						= true,
   Message						= L["Killing Blow! (%s)"],
   IsSticky						= true,
   FontSettings = {
    Color						= {r=0.333, g=0.333, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=20},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_NPC_KILLING_BLOW = {
   Show						= false,
   Message						= L["Killing Blow! (%s)"],
   IsSticky						= true,
   FontSettings = {
    Color						= {r=0.333, g=0.333, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=20},
   },
  },
 },

 Triggers = {
  MSBT_TRIGGER_LOW_HEALTH = {
   EventSettings = {
    Show				= true,
    Message				= L["Low Health! (%1)"],
    IsSticky			= false,
    FontSettings = {
     Color				= {r=1, g=0.502, b=0.502},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    TriggerType			= 1,
    Threshold			= 40,
   },
   Texture = "Interface\\Icons\\spell_holy_sealofsacrifice"
  },
  MSBT_TRIGGER_LOW_MANA = {
   EventSettings = {
    Show				= true,
    Message				= L["Low Mana! (%1)"],
    IsSticky			= false,
    FontSettings = {
     Color				= {r=0.502, g=0.502, b=1},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {DRUID=true,HUNTER=true,MAGE=true,PALADIN=true,PRIEST=true,SHAMAN=true,WARLOCK=true},
    TriggerType			= 2,
    Threshold			= 35,
   },
  },
  MSBT_TRIGGER_LOW_PET_HEALTH = {
   EventSettings = {
    Show				= true,
    Message				= L["Low Pet Health! (%1)"],
    IsSticky			= false,
    FontSettings = {
     Color				= {r=1, g=0.502, b=0.502},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {HUNTER=true,WARLOCK=true},
    TriggerType			= 3,
    Threshold			= 40,
   },
   Texture = "Interface\\Icons\\spell_holy_sealofsacrifice"
  },
  MSBT_TRIGGER_EXECUTE = {
   EventSettings = {
    Show				= true,
    Message				= BS["Execute"].."!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {WARRIOR=true},
    TriggerType			= 4,
    Threshold			= 20,
   },
   Texture = "Interface\\Icons\\inv_sword_48"
  },
  MSBT_TRIGGER_HAMMER_OF_WRATH = {
   EventSettings = {
    Show				= true,
    Message				= BS["Hammer of Wrath"].."!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {PALADIN=true},
    TriggerType			= 4,
    Threshold			= 20,
   },
   Texture = "Interface\\Icons\\ability_thunderclap"
  },
  MSBT_TRIGGER_COUNTER_ATTACK = {
   EventSettings = {
    Show				= true,
    Message				= BS["Counterattack"].."!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {HUNTER=true},
    TriggerType			= 6,
    TriggerEvents			= {"CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES", "CHAT_MSG_COMBAT_PARTY_MISSES",
                                 "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE", "CHAT_MSG_SPELL_PARTY_DAMAGE"},
    SearchPatterns		= {"VSPARRYOTHERSELF", "SPELLPARRIEDOTHERSELF"},
   },
   Texture = "Interface\\Icons\\ability_warrior_challange"
  },
  MSBT_TRIGGER_MONGOOSE_BITE = {
   EventSettings = {
    Show				= true,
    Message				= BS["Mongoose Bite"].."!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {HUNTER=true},
    TriggerType			= 6,
    TriggerEvents			= {"CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES", "CHAT_MSG_COMBAT_PARTY_MISSES",
                                 "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE", "CHAT_MSG_SPELL_PARTY_DAMAGE"},
    SearchPatterns		= {"VSDODGEOTHERSELF", "SPELLDODGEDOTHERSELF"},
   },
   Texture = "Interface\\Icons\\ability_hunter_swiftstrike"
  },
  MSBT_TRIGGER_CLEARCAST = {
   EventSettings = {
    Show				= true,
    Message				= BS["Clearcasting"].."!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {MAGE=true,SHAMAN=true},
    TriggerType			= 6,
    TriggerEvents			= {"CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS"},
    SearchPatterns		= {string.format(AURAADDEDSELFHELPFUL, BS["Clearcasting"])},
   },
   Texture = "Interface\\Icons\\spell_shadow_manaburn"
  },
  MSBT_TRIGGER_RIPOSTE = {
   EventSettings = {
    Show				= true,
    Message				= BS["Riposte"].."!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {ROGUE=true},
    TriggerType			= 6,
    TriggerEvents			= {"CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES", "CHAT_MSG_COMBAT_PARTY_MISSES",
                                 "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE", "CHAT_MSG_SPELL_PARTY_DAMAGE"},
    SearchPatterns		= {"VSPARRYOTHERSELF", "SPELLPARRIEDOTHERSELF"},
   },
   Texture = "Interface\\Icons\\ability_warrior_challange"
  },
  MSBT_TRIGGER_WINDFURY = {
   EventSettings = {
    Show				= true,
    Message				= L["Windfury!"],
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    TriggerType			= 6,
    TriggerEvents			= {"CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS"},
    SearchPatterns		= {string.format(AURAADDEDSELFHELPFUL, string.gsub(BS["Windfury Totem"], "-", "%%-"))},  --"Vous gagnez Totem Furie-des-vents" -- escape char !
   },
   Texture = "Interface\\Icons\\spell_nature_cyclone"
  },
  MSBT_TRIGGER_NIGHTFALL = {
   EventSettings = {
    Show				= true,
    Message				= BS["Nightfall"].."!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=0.709, g=0, b=0.709},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {WARLOCK=true},
    TriggerType			= 6,
    TriggerEvents			= {"CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS"},
    SearchPatterns		= {string.format(AURAADDEDSELFHELPFUL, BS["Shadow Trance"])},
   },
   Texture = "Interface\\Icons\\spell_shadow_twilight"
  },
  MSBT_TRIGGER_OVERPOWER = {
   EventSettings = {
    Show				= true,
    Message				= BS["Overpower"].."!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {WARRIOR=true},
    TriggerType			= 6,
    TriggerEvents			= {"CHAT_MSG_COMBAT_SELF_MISSES", "CHAT_MSG_SPELL_SELF_DAMAGE"},
    SearchPatterns		= {"VSDODGESELFOTHER", "SPELLDODGEDSELFOTHER"},
   },
   Texture = "Interface\\Icons\\ability_meleedamage"
  },
 },

 Suppressions = {
  MSBT_SUPPRESSION_WISDOM_MANA_GAINS = {
   Enabled				= true,
   SearchPattern			= "+[35][039] " .. MANA,
  },
 },
};
