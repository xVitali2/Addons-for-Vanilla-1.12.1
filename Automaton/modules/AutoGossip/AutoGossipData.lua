local L = AceLibrary("AceLocale-2.2"):new("Automaton_Gossip")

--[[

  If you would like to add your own Quests, Gossips, or Items, simply follow the format provided.
  There are a few things to remember when adding new items: if you use L[], you must also add
  to the localization file (Locale-enUS.lua or whatever). You do not have to use the L[] at all,
  you could simply add ["This is my thing"], instead. All quests are tables, and must be
  ["Quest Name"] = {} if it is to always attempt to hand in the quest, or
  ["Quest Name"] = {
    items = { ["Items Required"] = 1 }, -- number following is how many of the item are required
    priority = 1,  -- higher priority -value- will ensure one quest gets handed in before another
  },               -- IE, 2 is a HIGHER priority than 1. This is not the olympics.

  I will not help if you break this file. Experiment at your own risk. Either way, I encourage you
  to let me know of anything you think should appear here, I would be happy to expand it.

--]]

function Automaton_Gossip:GetGossipData()
return {
	["banker"] = {},
	["battlemaster"] = {},
	["taxi"] = {},
	["vendor"] = {},
	["trainer"] = {},
	["gossip"] = {
		L["<Touch the unstable rift crystal.>"],
		L["<Place my hand on the orb.>"],
		L["Thank you, Stable Master. Please take the animal."],
		L["With pleasure. These things stink!"],
		L["Trick or Treat!"],
	},
}
end

function Automaton_Gossip:GetQuestData()
return {
-- Alterac Valley quests
	[L["Empty Stables"]] = {},
	[L["Ram Hide Harnesses"]] = {
		items = { [L["Alterac Ram Hide"]] = 1 }
	},
	[L["Ram Riding Harnesses"]] = {
		items = { [L["Frostwolf Hide"]] = 1 }
	},
	[L["More Booty!"]] = {
		items = { [L["Armor Scraps"]] = 20 }
	},
	[L["More Armor Scraps"]] = {
		items = { [L["Armor Scraps"]] = 20 }
	},
	[L["Coldtooth Supplies"]] = {
		items = { [L["Coldtooth Supplies"]] = 10 }
	},
	[L["Irondeep Supplies"]] = {
		items = { [L["Irondeep Supplies"]] = 10 }
	},
	[L["Lokholar the Ice Lord"]] = {
		items = { [L["Stormpike Soldier's Blood"]] = 1 },
		priority = 1,
	},
	[L["A Gallon of Blood"]] = {
		items = { [L["Stormpike Soldier's Blood"]] = 5 },
		priority = 2,
	},
	[L["Ivus the Forest Lord"]] = {
		items = { [L["Storm Crystal"]] = 1 },
		priority = 1,
	},
	[L["Crystal Cluster"]] = {
		items = { [L["Storm Crystal"]] = 5 },
		priority = 2,
	},
	[L["Call of Air - Slidore's Fleet"]] = {
		items = { [L["Frostwolf Soldier's Medal"]] = 1 }
	},
	[L["Call of Air - Vipore's Fleet"]] = {
		items = { [L["Frostwolf Lieutenant's Medal"]] = 1 }
	},
	[L["Call of Air - Ichman's Fleet"]] = {
		items = { [L["Frostwolf Commander's Medal"]] = 1 }
	},
	[L["Call of Air - Guse's Fleet"]] = {
		items = { [L["Stormpike Soldier's Flesh"]] = 1 }
	},
	[L["Call of Air - Jeztor's Fleet"]] = {
		items = { [L["Stormpike Lieutenant's Flesh"]] = 1 }
	},
	[L["Call of Air - Mulverick's Fleet"]] = {
		items = { [L["Stormpike Commander's Flesh"]] = 1 }
	},

--Mark of Honor quests
	[L["For Great Honor"]] = {
		items = {
			[L["Alterac Valley Mark of Honor"]] = 3,
			[L["Arathi Basin Mark of Honor"]]   = 3,
			[L["Warsong Gulch Mark of Honor"]]  = 3,
		},
		priority = 2,
	},
	[L["Concerted Efforts"]] = {
		items = {
			[L["Alterac Valley Mark of Honor"]] = 3,
			[L["Arathi Basin Mark of Honor"]]   = 3,
			[L["Warsong Gulch Mark of Honor"]]  = 3,
		},
		priority = 2,
	},
	[L["Conquering Arathi Basin"]] = {
		items = { [L["Arathi Basin Mark of Honor"]] = 3 },
		priority = 1,
	},
	[L["Claiming Arathi Basin"]] = {
		items = { [L["Arathi Basin Mark of Honor"]] = 3 },
		priority = 1,
	},
	[L["Invaders of Alterac Valley"]] = {
		items = { [L["Alterac Valley Mark of Honor"]] = 3 },
		priority = 1,
	},
	[L["Remember Alterac Valley!"]] = {
		items = { [L["Alterac Valley Mark of Honor"]] = 3 },
		priority = 1,
	},
	[L["Battle of Warsong Gulch"]] = {
		items = { [L["Warsong Gulch Mark of Honor"]] = 3 },
		priority = 1,
	},
	[L["Fight for Warsong Gultch"]] = {
		items = { [L["Warsong Gulch Mark of Honor"]] = 3 },
		priority = 1,
	},

-- Felwood salves
	[L["Salve via Gathering"]] = {
		items = { [L["Fel Creep"]] = 4 },
		priority = 1,
	},
	[L["Salve via Mining"]] = {
		items = { [L["Tainted Vitriol"]] = 4 },
		priority = 1,
	},
	[L["Salve via Skinning"]] = {
		items = { [L["Patch of Tainted Skin"]] = 5 },
		priority = 1,
	},
	[L["Salve via Hunting"]] = {
		items = { [L["Corrupted Soul Shard"]] = 6 },
		priority = 1,
	},
	[L["Salve via Disenchanting"]] = {
		items = { [L["Lesser Nether Essence"]] = 1 },
		priority = 1,
	},

-- Felwood plants
	[L["Corrupted Whipper Root"]] = {
		items = { [L["Cenarion Plant Salve"]] = 3 }
	},
	[L["Corrupted Songflower"]] = {
		items = { [L["Cenarion Plant Salve"]] = 2 }
	},
	[L["Corrupted Windblossom"]] = {
		items = { [L["Cenarion Plant Salve"]] = 2 }
	},
	[L["Corrupted Night Dragon"]] = {
		items = { [L["Cenarion Plant Salve"]] = 4 }
	},

-- Thorium Shells -> Thorium Arrows Quest
	[L["A Fair Trade"]] = {
		items = { [L["Thorium Shells"]] = 200 },
	},

-- Ravenholdt
	[L["Syndicate Emblems"]] = {
		items = { [L["Syndicate Emblem"]] = 1 }
	},

-- Cenarion
	[L["Encrypted Twilight Texts"]] = {
		items = { [L["Encrypted Twilight Text"]] = 10 }
	},

-- Cenarion Expedition
	[L["Identify Plant Parts"]] = {
		items = { [L["Unidentified Plant Parts"]] = 10 }
	},

-- Argent Dawn
	[L["Minion's Scourgestones"]] = {
		items = { [L["Minion's Scourgestone"]] = 20 },
	},
	[L["Invader's Scourgestones"]] = {
		items = { [L["Invader's Scourgestone"]] = 10 }
	},
	[L["Corruptor's Scourgestones"]] = {
		items = { [L["Corruptor's Scourgestone"]] = 1 }
	},

-- Timbermaw
	[L["Feathers for Grazle"]] = {
		items = { [L["Deadwood Headdress Feather"]] = 5 }
	},
	[L["Feathers for Nafien"]] = {
		items = { [L["Deadwood Headdress Feather"]] = 5 }
	},
	[L["Beads for Salfa"]] = {
		items = { [L["Winterfall Spirit Beads"]] = 5 }
	},

-- Cauldron quests
	[L["Gahrron's Withering Cauldron"]] = {
		items = {
			[L["Arcane Quickener"]] = 1,
			[L["Ectoplasmic Resonator"]] = 4,
			[L["Runecloth"]] = 4
		},
	},
	[L["Writhing Haunt Cauldron"]] = {
		items = {
			[L["Arcane Quickener"]] = 1,
			[L["Somatic Intensifier"]] = 5,
			[L["Runecloth"]] = 4,
		},
	},
	[L["Felstone Field Cauldron"]] = {
		items = {
			[L["Arcane Quickener"]] = 1,
			[L["Osseous Agitator"]] = 6,
			[L["Runecloth"]] = 4,
		},
	},
	[L["Dalson's Tears Cauldron"]] = {
		items = {
			[L["Arcane Quickener"]] = 1,
			[L["Somatic Intensifier"]] = 5,
			[L["Runecloth"]] = 4,
		},
	},

-- Gadgetzan
	[L["Water Pouch Bounty"]] = {
		items = { [L["Wastewander Water Pouch"]] = 5 }
	},

-- Thorium Brotherhood
	[L["Gaining Acceptance"]] = {
		items = { [L["Dark Iron Residue"]] = 4 }
	},
	[L["Restoring Fiery Flux Supplies via Kingsblood"]] = {
		items = { 
			[L["Kingsblood"]] = 4,
			[L["Incendosaur Scale"]] = 2,
			[L["Coal"]] = 1,
		}
	},
	[L["Restoring Fiery Flux Supplies via Iron"]] = {
		items = { 
			[L["Iron Bar"]] = 4,
			[L["Incendosaur Scale"]] = 2,
			[L["Coal"]] = 1,
		}
	},
	[L["Restoring Fiery Flux Supplies via Heavy Leather"]] = {
		items = { 
			[L["Heavy Leather"]] = 4,
			[L["Incendosaur Scale"]] = 2,
			[L["Coal"]] = 1,
		}
	},
	[L["Favor Amongst the Brotherhood, Dark Iron Ore"]] = {
		items = { [L["Dark Iron Ore"]] = 10 }
	},
	[L["Favor Amongst the Brotherhood, Blood of the Mountain"]] = {
		items = { [L["Blood of the Mountain"]] = 1 }
	},
	[L["Favor Amongst the Brotherhood, Core Leather"]] = {
		items = { [L["Core Leather"]] = 2 }
	},
	[L["Favor Amongst the Brotherhood, Fiery Core"]] = {
		items = { [L["Fiery Core"]] = 1 }
	},
	[L["Favor Amongst the Brotherhood, Lava Core"]] = {
		items = { [L["Lava Core"]] = 1 }
	},

-- City faction
	[L["Additional Runecloth"]] = {
		items = { [L["Runecloth"]] = 20 }
	},

-- Wildhammer faction
	[L["Troll Necklace Bounty"]] = {
		items = { [L["Troll Tribal Necklace"]] = 5 }
	},

-- E'ko quests
	[L["Chillwind E'ko Quest"]] = {
		items = { [L["Chillwind E'ko Item"]] = 3 }
	},
	[L["Frostmaul E'ko Quest"]] = {
		items = { [L["Frostmaul E'ko Item"]] = 3 }
	},
	[L["Frostsaber E'ko Quest"]] = {
		items = { [L["Frostsaber E'ko Item"]] = 3 }
	},
	[L["Ice Thistle E'ko Quest"]] = {
		items = { [L["Ice Thistle E'ko Item"]] = 3 }
	},
	[L["Shardtooth E'ko Quest"]] = {
		items = { [L["Shardtooth E'ko Item"]] = 3 }
	},
	[L["Wildkin E'ko Quest"]] = {
		items = { [L["Wildkin E'ko Item"]] = 3 }
	},
	[L["Winterfall E'ko"]] = {
		items = { [L["Winterfall E'ko"]] = 3 }
	},

-- Zul'Gurub quests
	[L["Zulian, Razzashi, and Hakkari Coins"]] = {
		items = {
			[L["Zulian Coin"]] = 1,
			[L["Razzashi Coin"]] = 1,
			[L["Hakkari Coin"]] = 1,
		}
	},
	[L["Gurubashi, Vilebranch, and Witherbark Coins"]] = {
		items = {
			[L["Gurubashi Coin"]] = 1,
			[L["Vilebranch Coin"]] = 1,
			[L["Witherbark Coin"]] = 1,
		}
	},
	[L["Sandfury, Skullsplitter, and Bloodscalp Coins"]] = {
		items = {
			[L["Sandfury Coin"]] = 1,
			[L["Skullsplitter Coin"]] = 1,
		 	[L["Bloodscalp Coin"]] = 1,
		}
	},

-- AQ War Effort (Horde)
	-- Bandages
	[L["The Horde Needs More Runecloth Bandages!"]] = {
		items = { [L["Runecloth Bandage"]] = 20 },
	},
	[L["The Horde Needs More Mageweave Bandages!"]] = {
		items = { [L["Mageweave Bandage"]] = 20 },
	},
	[L["The Horde Needs More Wool Bandages!"]] = {
		items = { [L["Wool Bandage"]] = 20 },
	},
	-- Leather
	[L["The Horde Needs More Rugged Leather!"]] = {
		items = { [L["Rugged Leather"]] = 10 },
	},
	[L["The Horde Needs More Thick Leather!"]] = {
		items = { [L["Thick Leather"]] = 10 },
	},
	[L["The Horde Needs More Heavy Leather!"]] = {
		items = { [L["Heavy Leather"]] = 10 },
	},
	-- Herbs
	[L["The Horde Needs More Purple Lotus!"]] = {
		items = { [L["Purple Lotus"]] = 20 },
	},
	[L["The Horde Needs More Firebloom!"]] = {
		items = { [L["Firebloom"]] = 20 },
	},
	[L["The Horde Needs More Peacebloom!"]] = {
		items = { [L["Peacebloom"]] = 20 },
	},
	-- Metals
	[L["The Horde Needs More Mithril Bars!"]] = {
		items = { [L["Mithril Bar"]] = 20 },
	},
	[L["The Horde Needs More Tin Bars!"]] = {
		items = { [L["Tin Bar"]] = 20 },
	},
	[L["The Horde Needs More Copper Bars!"]] = {
		items = { [L["Copper Bar"]] = 20 },
	},
	-- Fish
	[L["The Horde Needs More Lean Wolf Steaks!"]] = {
		items = { [L["Lean Wolf Steak"]] = 20 },
	},
	[L["The Horde Needs More Spotted Yellowtail!"]] = {
		items = { [L["Spotted Yellowtail"]] = 20 },
	},
	[L["The Horde Needs More Baked Salmon!"]] = {
		items = { [L["Baked Salmon"]] = 20 },
	},

-- AQ War Effort (Alliance)
	-- Bandages
	[L["The Alliance Needs More Linen Bandages!"]] = {
		items = { [L["Linen Bandage"]] = 20 },
	},
	[L["The Alliance Needs More Silk Bandages!"]] = {
		items = { [L["Silk Bandage"]] = 20 },
	},
	[L["The Alliance Needs More Runecloth Bandages!"]] = {
		items = { [L["Runecloth Bandage"]] = 20 },
	},
	-- Leather
	[L["The Alliance Needs More Light Leather!"]] = {
		items = { [L["Light Leather"]] = 10 },
	},
	[L["The Alliance Needs More Medium Leather!"]] = {
		items = { [L["Medium Leather"]] = 10 },
	},
	[L["The Alliance Needs More Thick Leather!"]] = {
		items = { [L["Thick Leather"]] = 10 },
	},
	-- Herbs
	[L["The Alliance Needs More Stranglekelp!"]] = {
		items = { [L["Stranglekelp"]] = 20 },
	},
	[L["The Alliance Needs More Purple Lotus!"]] = {
		items = { [L["Purple Lotus"]] = 20 },
	},
	[L["The Alliance Needs More Arthas' Tears!"]] = {
		items = { [L["Arthas' Tears"]] = 20 },
	},
	-- Metals
	[L["The Alliance Needs More Copper Bars!"]] = {
		items = { [L["Copper Bar"]] = 20 },
	},
	[L["The Alliance Needs More Iron Bars!"]] = {
		items = { [L["Iron Bar"]] = 20 },
	},
	[L["The Alliance Needs More Thorium Bars!"]] = {
		items = { [L["Thorium Bar"]] = 20 },
	},
	-- Food
	[L["The Alliance Needs More Rainbow Fin Albacore!"]] = {
		items = { [L["Rainbow Fin Albacore"]] = 20 },
	},
	[L["The Alliance Needs More Roast Raptor!"]] = {
		items = { [L["Roast Raptor"]] = 20 },
	},
	[L["The Alliance Needs More Spotted Yellowtail!"]] = {
		items = { [L["Spotted Yellowtail"]] = 20 },
	},

-- AQ War Effort Commendations
-- the names of the alliance/horde quests are the same, but the items required to hand in are
-- different. as such, they are a special case and I had to do something weird to make it work.
-- if entering world, looking for UnitFactionGroup("player") fails, since it is called before
-- the player exists. Thus, I set it to alliance by default. however, when the function is
-- called to set the table on initialize, it sets it to the correct value
	[L["Ten Commendation Signets"]] = {
		items = { [L[(UnitFactionGroup("player") or "Alliance").." Commendation Signet"]] = 10 },
		priority = 2,
	},
	[L["One Commendation Signet"]] = {
		items = { [L[(UnitFactionGroup("player") or "Alliance").." Commendation Signet"]] = 1 },
		priority = 1,
	},
}

end
