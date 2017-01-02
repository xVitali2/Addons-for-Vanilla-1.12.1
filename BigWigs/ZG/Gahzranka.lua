------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Gahz'ranka"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Gahzranka",

	frostbreath_trigger = "Gahz\'ranka begins to perform Frost Breath\.",
	frostbreath_bar = "Frost Breath",
	massivegeyser_trigger = "Gahz\'ranka begins to cast Massive Geyser\.",
	massivegeyser_bar = "Massive Geyser",

	frostbreath_cmd = "frostbreath",
	frostbreath_name = "Frost Breath alert",
	frostbreath_desc = "Warn when the boss is casting Frost Breath.",

	massivegeyser_cmd = "massivegeyser",
	massivegeyser_name = "Massive Geyser alert",
	massivegeyser_desc = "Warn when the boss is casting Massive Geyser.",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Gahzranka",

	frostbreath_trigger = "Gahz\'ranka beginnt Frostatem auszuf\195\188hren\.",
	frostbreath_bar = "Frostatem",
	massivegeyser_trigger = "Gahz\'ranka beginnt Massiver Geysir zu wirken\.",
	massivegeyser_bar = "Massiver Geysir",

	frostbreath_cmd = "frostbreath",
	frostbreath_name = "Alarm f\195\188r Frostatem",
	frostbreath_desc = "Warnen wenn Gahz'ranka beginnt Frostatem zu wirken.",
	
	massivegeyser_cmd = "massivegeyser",
	massivegeyser_name = "Alarm f\195\188r Massiver Geysir",
	massivegeyser_desc = "Warnen wenn Gahz'ranka beginnt Massiver Geysir zu wirken.",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsGahzranka = BigWigs:NewModule(boss)
BigWigsGahzranka.zonename = AceLibrary("Babble-Zone-2.2")["Zul'Gurub"]
BigWigsGahzranka.enabletrigger = boss
BigWigsGahzranka.toggleoptions = {"frostbreath", "massivegeyser", "bosskill"}
BigWigsGahzranka.revision = tonumber(string.sub("$Revision: 11204 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsGahzranka:OnEnable()	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

------------------------------
--      Events              --
------------------------------

function BigWigsGahzranka:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["frostbreath_trigger"] and self.db.profile.frostbreath then
		self:TriggerEvent("BigWigs_StartBar", self, L["frostbreath_bar"], 2, "Interface\\Icons\\Spell_Frost_FrostNova")
	elseif msg == L["massivegeyser_trigger"] and self.db.profile.massivegeyser then
		self:TriggerEvent("BigWigs_StartBar", self, L["massivegeyser_bar"], 1.5, "Interface\\Icons\\Spell_Frost_SummonWaterElemental", true, "White")
	end
end
