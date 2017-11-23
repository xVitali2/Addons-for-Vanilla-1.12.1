--[[

Gives timer bars to see when world buffs are going out.

--]]

assert( BigWigs, "BigWigs not found!")

------------------------------
--      Are you local?      --
------------------------------

local name = "World Buff Timers"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..name)

------------------------------
--      Localization        --
------------------------------

L:RegisterTranslations("enUS", function() return {
	onyHeadHorde_trigger = "People of the Horde, citizens of Orgrimmar, come, gather round and celebrate a hero of the Horde. On this day",
	nefHeadHorde_trigger = "NEFARIAN IS SLAIN! People of Orgrimmar, bow down before the might of",

	onyHeadAlliance_trigger = "Citizens and allies of Stormwind, on this day, history has been made.",
	nefHeadAlliance_trigger = "Citizens of the Alliance, the Lord of Blackrock is slain! Nefarian has been subdued by the combined might of",

	zgHeart_trigger = "Now, only one step remains to rid us of the Soulflayer's threat...",
	rendHead_trigger = "Honor your heroes! On this day, they have dealt a great blow against one of our most hated enemies! The false Warchief, Rend Blackhand, has fallen!",

	dragonslayer = "Rallying Cry of the Dragonslayer",
	zandalar = "Spirit of Zandalar",
	blessing = "Warchief's Blessing",

	["worldbuffs"] = true,
	["World Buff Timers"] = true,
	["Gives timer bars to see when world buffs are going out."] = true,

	["Enable"] = true,
	["Enable timers"] = true,
} end )

L:RegisterTranslations("esES", function() return {
	onyHeadHorde_trigger = "People of the Horde, citizens of Orgrimmar, come, gather round and celebrate a hero of the Horde. On this day",
	nefHeadHorde_trigger = "NEFARIAN IS SLAIN! People of Orgrimmar, bow down before the might of",

	onyHeadAlliance_trigger = "Citizens and allies of Stormwind, on this day, history has been made.",
	nefHeadAlliance_trigger = "Citizens of the Alliance, the Lord of Blackrock is slain! Nefarian has been subdued by the combined might of",

	zgHeart_trigger = "Now, only one step remains to rid us of the Soulflayer's threat...",
	rendHead_trigger = "Honor your heroes! On this day, they have dealt a great blow against one of our most hated enemies! The false Warchief, Rend Blackhand, has fallen!",

	dragonslayer = "Recobrar el llanto del cazadragones",
	zandalar = "Espíritu de Zandalar",
	blessing = "Bendición del Jefe de Guerra",

	--["worldbuffs"] = true,
	["World Buff Timers"] = "Temporizador de Buffs del Mundo",
	["Gives timer bars to see when world buffs are going out."] = "Muestra barras temporizadoras para mostrar cuando será un buff del mundo",

	["Enable"] = "Activar",
	["Enable timers"] = "Activa los temporizadores",
} end )


------------------------------
--      Module              --
------------------------------

BigWigsWorldBuffs = BigWigs:NewModule(name)
BigWigsWorldBuffs.defaultDB = {
	enabled = true,
}

BigWigsWorldBuffs.consoleCmd = L["worldbuffs"]
BigWigsWorldBuffs.consoleOptions = {
	type = "group",
	name = L["World Buff Timers"],
	desc = L["Gives timer bars to see when world buffs are going out."],
	args   = {
		["enable"] = {
			type = "toggle",
			name = L["Enable"],
			desc = L["Enable timers"],
			get = function() return BigWigsWorldBuffs.db.profile.enabled end,
			set = function(v) BigWigsWorldBuffs.db.profile.enabled = v end,
		},
	}
}
BigWigsWorldBuffs.revision = 20001
BigWigsWorldBuffs.external = true

------------------------------
--      Initialization      --
------------------------------
local timer = {
	onyHeadHorde = 15,
	nefHeadHorde = 17,
	onyHeadAlliance = 17,
	nefHeadAlliance = 17,
	zgHeart = 59,
	rendHead = 12,
}
local icon = {
	dragonslayer = "inv_misc_head_dragon_01",
	blessing = "spell_arcane_teleportorgrimmar",
	zandalar = "ability_creature_poison_05",
}


function BigWigsWorldBuffs:OnEnable()

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_MONSTER_SAY")

end

------------------------------
--      Events              --
------------------------------
function BigWigsWorldBuffs:CHAT_MSG_MONSTER_SAY(msg)
	if self.db.profile.enabled then
		if string.find(msg, L["zgHeart_trigger"]) then
			self:Bar(L["zandalar"], timer.zgHeart, icon.zandalar)
		end
	end
end

function BigWigsWorldBuffs:CHAT_MSG_MONSTER_YELL(msg)
	if self.db.profile.enabled then
		if string.find(msg, L["onyHeadHorde_trigger"]) then
			self:Bar(L["dragonslayer"], timer.onyHeadHorde, icon.dragonslayer)
		elseif string.find(msg, L["nefHeadHorde_trigger"]) then
			self:Bar(L["dragonslayer"], timer.nefHeadHorde, icon.dragonslayer)
		elseif string.find(msg, L["onyHeadAlliance_trigger"]) then
			self:Bar(L["dragonslayer"], timer.onyHeadAlliance, icon.dragonslayer)
		elseif string.find(msg, L["nefHeadAlliance_trigger"]) then
			self:Bar(L["dragonslayer"], timer.nefHeadAlliance, icon.dragonslayer)
		elseif string.find(msg, L["rendHead_trigger"]) then
			self:Bar(L["blessing"], timer.rendHead, icon.blessing)
		end
	end
end
