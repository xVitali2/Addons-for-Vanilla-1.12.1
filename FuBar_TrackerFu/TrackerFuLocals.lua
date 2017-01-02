local L = AceLibrary("AceLocale-2.0"):new("TrackerFu")

L:RegisterTranslations("enUS", function() return {
	NAME = "FuBar - Tracker",
	DESCRIPTION = "Change Tracking and Sense abilities with FuBar.",

	DEFAULT_ICON = "Interface\\Icons\\Ability_Hunter_Pathfinding",
	
	TRACKER_SHOW_MINIMAP = "Show Minimap Tracking Icon",
	
	TRACKER_TOOLTIP_HINT = "Right-click to change Tracking/Sense abilites.",
	
	-- Header Types
	TRACKER_SPELL_TYPE_FIND  = "Locating Abilities",
	TRACKER_SPELL_TYPE_TRACK = "Tracking Abilities",
	TRACKER_SPELL_TYPE_SENSE = "Sensing Abilities",
	
	-- Object tracking
	TRACKER_SPELL_FIND_HERBS    = "Find Herbs",
	TRACKER_SPELL_FIND_MINERALS = "Find Minerals",
	TRACKER_SPELL_FIND_TREASURE = "Find Treasure",
	
	-- Standard creature tracking
	TRACKER_SPELL_TRACK_BEASTS     = "Track Beasts",
	TRACKER_SPELL_TRACK_HUMANOIDS  = "Track Humanoids",
	TRACKER_SPELL_TRACK_HIDDEN     = "Track Hidden",
	TRACKER_SPELL_TRACK_ELEMENTALS = "Track Elementals",
	TRACKER_SPELL_TRACK_UNDEAD     = "Track Undead",
	TRACKER_SPELL_TRACK_DEMONS     = "Track Demons",
	TRACKER_SPELL_TRACK_GIANTS     = "Track Giants",
	TRACKER_SPELL_TRACK_DRAGONKIN  = "Track Dragonkin",
	
	-- Class specific tracking
	TRACKER_SPELL_SENSE_UNDEAD = "Sense Undead",
	TRACKER_SPELL_SENSE_DEMONS = "Sense Demons",
	
	-- Icon textures
	TRACKER_ICON_FIND_HERBS = "Interface\\Icons\\INV_Misc_Flower_02",
	TRACKER_ICON_FIND_MINERALS = "Interface\\Icons\\Spell_Nature_Earthquake",
	TRACKER_ICON_FIND_TREASURE = "Interface\\Icons\\Racial_Dwarf_FindTreasure",
	TRACKER_ICON_TRACK_BEASTS = "Interface\\Icons\\Ability_Tracking",
	TRACKER_ICON_TRACK_HUMANOIDS = "Interface\\Icons\\Spell_Holy_PrayerOfHealing",
	TRACKER_ICON_TRACK_HIDDEN = "Interface\\Icons\\Ability_Stealth",
	TRACKER_ICON_TRACK_ELEMENTALS = "Interface\\Icons\\Spell_Frost_SummonWaterElemental",
	TRACKER_ICON_TRACK_UNDEAD = "Interface\\Icons\\Spell_Shadow_DarkSummoning",
	TRACKER_ICON_TRACK_DEMONS = "Interface\\Icons\\Spell_Shadow_SummonFelHunter",
	TRACKER_ICON_TRACK_GIANTS = "Interface\\Icons\\Ability_Racial_Avatar",
	TRACKER_ICON_TRACK_DRAGONKIN = "Interface\\Icons\\INV_Misc_Head_Dragon_01",
	TRACKER_ICON_SENSE_UNDEAD = "Interface\\Icons\\Spell_Holy_SenseUndead",
	TRACKER_ICON_SENSE_DEMONS = "Interface\\Icons\\Spell_Shadow_Metamorphosis",
	
	TRACKER_NOTHING_TEXT = "Nothing to track.",
	TRACKER_STOP_TRACKING = "Track Nothing",
	
	TRACKER_OFF_TEXT = "Tracking Off"
} end )

L:RegisterTranslations("ruRU", function() return {
	NAME = "FuBar - Поиск",
	DESCRIPTION = "Смена способностей выслеживания и чувств с FuBar.",

	DEFAULT_ICON = "Interface\\Icons\\Ability_Hunter_Pathfinding",
	
	TRACKER_SHOW_MINIMAP = "Показывать иконку на миникарте",
	
	TRACKER_TOOLTIP_HINT = "Правое-нажатие сменить способности выслеживания/чувств.",
	
	-- Header Types
	TRACKER_SPELL_TYPE_FIND  = "Способности расположения",
	TRACKER_SPELL_TYPE_TRACK = "Способности выслеживания ",
	TRACKER_SPELL_TYPE_SENSE = "Способности чувств",
	
	-- Object tracking
	TRACKER_SPELL_FIND_HERBS    = "Поиск трав",
	TRACKER_SPELL_FIND_MINERALS = "Поиск минералов",
	TRACKER_SPELL_FIND_TREASURE = "Поиск сокровищ",
	
	-- Standard creature tracking
	TRACKER_SPELL_TRACK_BEASTS     = "Выслеживание животных",
	TRACKER_SPELL_TRACK_HUMANOIDS  = "Выслеживание гуманоидов",
	TRACKER_SPELL_TRACK_HIDDEN     = "Выслеживание скрытых",
	TRACKER_SPELL_TRACK_ELEMENTALS = "Выслеживание элементалей",
	TRACKER_SPELL_TRACK_UNDEAD     = "Выслеживание нежити",
	TRACKER_SPELL_TRACK_DEMONS     = "Выслеживание демонов",
	TRACKER_SPELL_TRACK_GIANTS     = "Выслеживание великанов",
	TRACKER_SPELL_TRACK_DRAGONKIN  = "Выслеживание драконов",
	
	-- Class specific tracking
	TRACKER_SPELL_SENSE_UNDEAD = "Чувство Нежити",
	TRACKER_SPELL_SENSE_DEMONS = "Чувство Демонов",
	
	-- Icon textures
	TRACKER_ICON_FIND_HERBS = "Interface\\Icons\\INV_Misc_Flower_02",
	TRACKER_ICON_FIND_MINERALS = "Interface\\Icons\\Spell_Nature_Earthquake",
	TRACKER_ICON_FIND_TREASURE = "Interface\\Icons\\Racial_Dwarf_FindTreasure",
	TRACKER_ICON_TRACK_BEASTS = "Interface\\Icons\\Ability_Tracking",
	TRACKER_ICON_TRACK_HUMANOIDS = "Interface\\Icons\\Spell_Holy_PrayerOfHealing",
	TRACKER_ICON_TRACK_HIDDEN = "Interface\\Icons\\Ability_Stealth",
	TRACKER_ICON_TRACK_ELEMENTALS = "Interface\\Icons\\Spell_Frost_SummonWaterElemental",
	TRACKER_ICON_TRACK_UNDEAD = "Interface\\Icons\\Spell_Shadow_DarkSummoning",
	TRACKER_ICON_TRACK_DEMONS = "Interface\\Icons\\Spell_Shadow_SummonFelHunter",
	TRACKER_ICON_TRACK_GIANTS = "Interface\\Icons\\Ability_Racial_Avatar",
	TRACKER_ICON_TRACK_DRAGONKIN = "Interface\\Icons\\INV_Misc_Head_Dragon_01",
	TRACKER_ICON_SENSE_UNDEAD = "Interface\\Icons\\Spell_Holy_SenseUndead",
	TRACKER_ICON_SENSE_DEMONS = "Interface\\Icons\\Spell_Shadow_Metamorphosis",
	
	TRACKER_NOTHING_TEXT = "Нечего отслеживать.",
	TRACKER_STOP_TRACKING = "Ничего не отслеживать",
	
	TRACKER_OFF_TEXT = "Отслеживание Выкл."
} end )

L:RegisterTranslations("koKR", function() return {
	NAME = "FuBar - Tracker",
	DESCRIPTION = "Change Tracking and Sense abilities with FuBar.",

	DEFAULT_ICON = "Interface\\Icons\\Ability_Hunter_Pathfinding",
	
	TRACKER_SHOW_MINIMAP = "미니맵에 아이콘 보이기",
	
	TRACKER_TOOLTIP_HINT = "오른클릭으로 추적/감지를 변경할 수 있습니다.",
	
	-- Header Types
	TRACKER_SPELL_TYPE_FIND  = "찾기",
	TRACKER_SPELL_TYPE_TRACK = "추적",
	TRACKER_SPELL_TYPE_SENSE = "감지",
	
	-- Object tracking
	TRACKER_SPELL_FIND_HERBS    = "약초 찾기",
	TRACKER_SPELL_FIND_MINERALS = "광물 찾기",
	TRACKER_SPELL_FIND_TREASURE = "보물 찾기",
	
	-- Standard creature tracking
	TRACKER_SPELL_TRACK_BEASTS     = "야수 추적",
	TRACKER_SPELL_TRACK_HUMANOIDS  = "인간형 추적",
	TRACKER_SPELL_TRACK_HIDDEN     = "은신 추적",
	TRACKER_SPELL_TRACK_ELEMENTALS = "정령 추적",
	TRACKER_SPELL_TRACK_UNDEAD     = "언데드 추적",
	TRACKER_SPELL_TRACK_DEMONS     = "악마 추적",
	TRACKER_SPELL_TRACK_GIANTS     = "거인 추적",
	TRACKER_SPELL_TRACK_DRAGONKIN  = "용족 추적",

	-- Class specific tracking
	TRACKER_SPELL_SENSE_UNDEAD = "언데드 감지",
	TRACKER_SPELL_SENSE_DEMONS = "악마 감지",
	
	-- Icon textures
	TRACKER_ICON_FIND_HERBS = "Interface\\Icons\\INV_Misc_Flower_02",
	TRACKER_ICON_FIND_MINERALS = "Interface\\Icons\\Spell_Nature_Earthquake",
	TRACKER_ICON_FIND_TREASURE = "Interface\\Icons\\Racial_Dwarf_FindTreasure",
	TRACKER_ICON_TRACK_BEASTS = "Interface\\Icons\\Ability_Tracking",
	TRACKER_ICON_TRACK_HUMANOIDS = "Interface\\Icons\\Spell_Holy_PrayerOfHealing",
	TRACKER_ICON_TRACK_HIDDEN = "Interface\\Icons\\Ability_Stealth",
	TRACKER_ICON_TRACK_ELEMENTALS = "Interface\\Icons\\Spell_Frost_SummonWaterElemental",
	TRACKER_ICON_TRACK_UNDEAD = "Interface\\Icons\\Spell_Shadow_DarkSummoning",
	TRACKER_ICON_TRACK_DEMONS = "Interface\\Icons\\Spell_Shadow_SummonFelHunter",
	TRACKER_ICON_TRACK_GIANTS = "Interface\\Icons\\Ability_Racial_Avatar",
	TRACKER_ICON_TRACK_DRAGONKIN = "Interface\\Icons\\INV_Misc_Head_Dragon_01",
	TRACKER_ICON_SENSE_UNDEAD = "Interface\\Icons\\Spell_Holy_SenseUndead",
	TRACKER_ICON_SENSE_DEMONS = "Interface\\Icons\\Spell_Shadow_Metamorphosis",
	
	TRACKER_NOTHING_TEXT = "추적하지 않음.",
	TRACKER_STOP_TRACKING = "추적 끔",
	
	TRACKER_OFF_TEXT = "추적 꺼짐"
} end )

L:RegisterTranslations("deDE", function() return {
	NAME = "FuBar - Tracker",
	DESCRIPTION = "Change Tracking and Sense abilities with FuBar.",

	DEFAULT_ICON = "Interface\\Icons\\Ability_Hunter_Pathfinding",
	
	TRACKER_SHOW_MINIMAP = "Show Minimap Tracking Icon",
	
	TRACKER_TOOLTIP_HINT = "Rechts-klick zu ausw\195\164hlen der Tracking F\195\164higkeitem.",
	
	-- Header Types
	TRACKER_SPELL_TYPE_FIND		= "Finden F\195\164higkeit",
	TRACKER_SPELL_TYPE_TRACK	= "Aufsp\195\188ren F\195\164higkeit",
	TRACKER_SPELL_TYPE_SENSE	= "Sp\195\188ren F\195\164higkeit",

	-- Object tracking
	TRACKER_SPELL_FIND_HERBS	= "Kr\195\164utersuche",
	TRACKER_SPELL_FIND_MINERALS	= "Mineraliensuche",
	TRACKER_SPELL_FIND_TREASURE	= "Schatzsucher",

	-- Standard creature tracking
	TRACKER_SPELL_TRACK_BEASTS	= "Wildtiere aufsp\195\188ren",
	TRACKER_SPELL_TRACK_HUMANOIDS	= "Humanoide aufsp\195\188ren",
	TRACKER_SPELL_TRACK_HIDDEN	= "Verborgenes aufsp\195\188ren",
	TRACKER_SPELL_TRACK_ELEMENTALS	= "Elementare aufsp\195\188ren",
	TRACKER_SPELL_TRACK_UNDEAD	= "Untote aufsp\195\188ren",
	TRACKER_SPELL_TRACK_DEMONS	= "D\195\164monen aufsp\195\188ren",
	TRACKER_SPELL_TRACK_GIANTS	= "Riesen aufsp\195\188ren",
	TRACKER_SPELL_TRACK_DRAGONKIN	= "Drachkin aufsp\195\188ren",

	-- Class specific tracking
	TRACKER_SPELL_SENSE_UNDEAD	= "Untote sp\195\188ren",
	TRACKER_SPELL_SENSE_DEMONS	= "D\195\164monen sp\195\188ren",
	
	-- Icon textures
	TRACKER_ICON_FIND_HERBS = "Interface\\Icons\\INV_Misc_Flower_02",
	TRACKER_ICON_FIND_MINERALS = "Interface\\Icons\\Spell_Nature_Earthquake",
	TRACKER_ICON_FIND_TREASURE = "Interface\\Icons\\Racial_Dwarf_FindTreasure",
	TRACKER_ICON_TRACK_BEASTS = "Interface\\Icons\\Ability_Tracking",
	TRACKER_ICON_TRACK_HUMANOIDS = "Interface\\Icons\\Spell_Holy_PrayerOfHealing",
	TRACKER_ICON_TRACK_HIDDEN = "Interface\\Icons\\Ability_Stealth",
	TRACKER_ICON_TRACK_ELEMENTALS = "Interface\\Icons\\Spell_Frost_SummonWaterElemental",
	TRACKER_ICON_TRACK_UNDEAD = "Interface\\Icons\\Spell_Shadow_DarkSummoning",
	TRACKER_ICON_TRACK_DEMONS = "Interface\\Icons\\Spell_Shadow_SummonFelHunter",
	TRACKER_ICON_TRACK_GIANTS = "Interface\\Icons\\Ability_Racial_Avatar",
	TRACKER_ICON_TRACK_DRAGONKIN = "Interface\\Icons\\INV_Misc_Head_Dragon_01",
	TRACKER_ICON_SENSE_UNDEAD = "Interface\\Icons\\Spell_Holy_SenseUndead",
	TRACKER_ICON_SENSE_DEMONS = "Interface\\Icons\\Spell_Shadow_Metamorphosis",
	
	TRACKER_NOTHING_TEXT = "Nichts zu \195\188berwachen.",
	TRACKER_STOP_TRACKING = "Nichts \195\188berwachen",
	
	TRACKER_OFF_TEXT = "Tracking Aus"
} end )
