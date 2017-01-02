------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Hazza'rah"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Hazzarah",
	nightmaresummon_trigger = "Hazza\'rah casts Summon Nightmare Illusions\.",
	nightmaresummon_message = "Kill the spawns!",
	
	nightmaresummon_cmd = "spawns",
	nightmaresummon_name = "Spawns alert",
	nightmaresummon_desc = "Shows a warning when the boss summons Nightmare Illusions.",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Hazzarah",

	nightmaresummon_trigger = "Hazza\'rah wirkt Alptraumillusionen beschw\195\182ren\.",
	nightmaresummon_message = "T\195\182tet die Adds!",
	
	nightmaresummon_cmd = "spawns",
	nightmaresummon_name = "Alarm f\195\188r die Adds",
	nightmaresummon_desc = "Zeigt eine Warnung wenn der Boss Alptraumillusionen beschw\195\182rt.",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsHazzarah = BigWigs:NewModule(boss)
BigWigsHazzarah.zonename = AceLibrary("Babble-Zone-2.2")["Zul'Gurub"]
BigWigsHazzarah.enabletrigger = boss
BigWigsHazzarah.toggleoptions = {"nightmaresummon", "bosskill"}
BigWigsHazzarah.revision = tonumber(string.sub("$Revision: 11203 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsHazzarah:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "HazzarahIllusions", 5)
end

------------------------------
--      Events              --
------------------------------

function BigWigsHazzarah:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if msg == L["nightmaresummon_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "HazzarahIllusions")
	end
end

function BigWigsHazzarah:BigWigs_RecvSync(sync, rest, nick)
	if sync == "HazzarahIllusions" and self.db.profile.nightmaresummon then
		self:TriggerEvent("BigWigs_Message", L["nightmaresummon_message"], "Important", true, "Alarm")
	end
end
