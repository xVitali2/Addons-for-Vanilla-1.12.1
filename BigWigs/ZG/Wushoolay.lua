------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Wushoolay"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Wushoolay",

	chainlightning_trigger = "Wushoolay begins to cast Chain Lightning\.",
	chainlightning_bar = "Chain Lightning",
	chainlightning_message = "Chain Lightning! Interrupt it!",
	lightningcloud_trigger = "You are afflicted by Lightning Cloud\.",
	lightningcloud_message = "Get out of the Lightning Cloud!",

	chainlightning_cmd = "chainlightning",
	chainlightning_name = "Chain Lightning alert",
	chainlightning_desc = "Warn when the boss is casting Chain Lightning.",
	
	lightningcloud_cmd = "lightningcloud",
	lightningcloud_name = "Lightning Cloud warning",
	lightningcloud_desc = "Warns when you stand in the Lightning Cloud.",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Wushoolay",

	chainlightning_trigger = "Wushoolay beginnt Kettenblitzschlag zu wirken\.",
	chainlightning_bar = "Kettenblitzschlag",
	chainlightning_message = "Kettenblitzschlag! Unterbreche sie!",
	lightningcloud_trigger = "Ihr seid von Blitzschlagwolke betroffen\.",
	lightningcloud_message = "Beweg dich aus der Blitzschlagwolke!",

	chainlightning_cmd = "chainlightning",
	chainlightning_name = "Alarm f\195\188r Kettenblitzschlag",
	chainlightning_desc = "Warnen wenn Wushoolay beginnt Kettenblitzschlag zu wirken.", 
	
	lightningcloud_cmd = "lightningcloud",
	lightningcloud_name = "Alarm f\195\188r Blitzschlagwolke",
	lightningcloud_desc = "Warnt dich wenn du in Blitzschlagwolke stehst.",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsWushoolay = BigWigs:NewModule(boss)
BigWigsWushoolay.zonename = AceLibrary("Babble-Zone-2.2")["Zul'Gurub"]
BigWigsWushoolay.enabletrigger = boss
BigWigsWushoolay.toggleoptions = {"chainlightning", "lightningcloud", "bosskill"}
BigWigsWushoolay.revision = tonumber(string.sub("$Revision: 11204 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsWushoolay:OnEnable()	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "WushoolayChainLightning", 3)
end

------------------------------
--      Events              --
------------------------------

function BigWigsWushoolay:Event(msg)
	if msg == L["lightningcloud_trigger"] and self.db.profile.lightningcloud then
		self:TriggerEvent("BigWigs_Message", L["lightningcloud_message"], "Attention", "Alarm")
	elseif msg == L["chainlightning_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "WushoolayChainLightning")
	end
end

function BigWigsWushoolay:BigWigs_RecvSync(sync, rest, nick)
	if sync == "WushoolayChainLightning" and self.db.profile.chainlightning then
		self:TriggerEvent("BigWigs_Message", L["chainlightning_message"], "Important")
		self:TriggerEvent("BigWigs_StartBar", self, L["chainlightning_bar"], 1.5, "Interface\\Icons\\Spell_Nature_ChainLightning")
	end
end
