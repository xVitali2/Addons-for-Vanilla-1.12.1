------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Grobbulus"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local started

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Grobbulus",

	enrage_cmd = "enrage",
	enrage_name = "Enrage Alert",
	enrage_desc = "Warn for Enrage",

	youinjected_cmd = "youinjected",
	youinjected_name = "You're injected Alert",
	youinjected_desc = "Warn when you're injected",

	otherinjected_cmd = "otherinjected",
	otherinjected_name = "Others injected Alert",
	otherinjected_desc = "Warn when others are injected",

	icon_cmd = "icon",
	icon_name = "Place Icon",
	icon_desc = "Place a skull icon on an injected person. (Requires promoted or higher)",

	cloud_cmd = "cloud",
	cloud_name = "Poison Cloud",
	cloud_desc = "Warn for Poison Clouds",

	inject_trigger = "^([^%s]+) ([^%s]+) afflicted by Mutating Injection",

	you = "You",
	are = "are",

	startwarn = "Grobbulus engaged, 12min to enrage!",
	enragebar = "Enrage",
	enrage10min = "Enrage in 10min",
	enrage5min = "Enrage in 5min",
	enrage1min = "Enrage in 1min",
	enrage30sec = "Enrage in 30sec",
	enrage10sec = "Enrage in 10sec",
	bomb_message_you = "You are injected!",
	bomb_message_other = "%s is injected!",
	bomb_bar = "%s injected",

	cloud_trigger = "Grobbulus casts Poison Cloud.",
	cloud_warn = "Poison Cloud next in ~15 seconds!",
	cloud_bar = "Poison Cloud",

} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsGrobbulus = BigWigs:NewModule(boss)
BigWigsGrobbulus.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
BigWigsGrobbulus.enabletrigger = boss
BigWigsGrobbulus.toggleoptions = { "youinjected", "otherinjected", "icon", "cloud", -1, "enrage", "bosskill" }
BigWigsGrobbulus.revision = tonumber(string.sub("$Revision: 15709 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsGrobbulus:OnEnable()
	started = nil
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "InjectEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "InjectEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "InjectEvent")

	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "GrobbulusInject", 3)
	self:TriggerEvent("BigWigs_ThrottleSync", "GrobbulusCloud", 5)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsGrobbulus:BigWigs_RecvSync( sync, rest, nick )
	if sync == self:GetEngageSync() and rest and rest == boss and not started then
		started = true
		if self:IsEventRegistered("PLAYER_REGEN_DISABLED") then self:UnregisterEvent("PLAYER_REGEN_DISABLED") end
		if self.db.profile.enrage then
			self:TriggerEvent("BigWigs_Message", L["startwarn"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["enragebar"], 720, "Interface\\Icons\\INV_Shield_01")
			self:ScheduleEvent("bwgrobbulusenragewarn1", "BigWigs_Message", 120, L["enrage10min"], "Attention")
			self:ScheduleEvent("bwgrobbulusenragewarn2", "BigWigs_Message", 420, L["enrage5min"], "Urgent")
			self:ScheduleEvent("bwgrobbulusenragewarn3", "BigWigs_Message", 660, L["enrage1min"], "Important")
			self:ScheduleEvent("bwgrobbulusenragewarn4", "BigWigs_Message", 690, L["enrage30sec"], "Important")
			self:ScheduleEvent("bwgrobbulusenragewarn5", "BigWigs_Message", 710, L["enrage10sec"], "Important")
		end
	elseif sync == "GrobbulusInject" and rest then
		local player = rest
		if self.db.profile.youinjected and player == UnitName("player") then
			self:TriggerEvent("BigWigs_Message", L["bomb_message_you"], "Personal", true, "Alarm")
			self:TriggerEvent("BigWigs_Message", string.format(L["bomb_message_other"], player), "Attention", nil, nil, true)
			self:TriggerEvent("BigWigs_StartBar", self, string.format(L["bomb_bar"], player), 10,"Interface\\Icons\\Spell_Shadow_CallofBone")
		elseif self.db.profile.otherinjected then
			self:TriggerEvent("BigWigs_Message", string.format(L["bomb_message_other"], player), "Attention")
			self:TriggerEvent("BigWigs_SendTell", player, L["bomb_message_you"])
			self:TriggerEvent("BigWigs_StartBar", self, string.format(L["bomb_bar"], player), 10,"Interface\\Icons\\Spell_Shadow_CallofBone")
		end
		if self.db.profile.icon then
			self:TriggerEvent("BigWigs_SetRaidIcon", player)
		end
	elseif sync == "GrobbulusCloud" then
		if self.db.profile.cloud then
			self:TriggerEvent("BigWigs_Message", L["cloud_warn"], "Urgent")
			self:TriggerEvent("BigWigs_StartBar", self, L["cloud_bar"], 15, "Interface\\Icons\\Ability_Creature_Disease_02")			
		end
	end
end

function BigWigsGrobbulus:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF( msg )
	if string.find( msg, L["cloud_trigger"] ) then
		self:TriggerEvent("BigWigs_SendSync", "GrobbulusCloud")
	end
end

function BigWigsGrobbulus:InjectEvent( msg )
	local _, _, eplayer, etype = string.find(msg, L["inject_trigger"])
	if eplayer and etype then
		if eplayer == L["you"] and etype == L["are"] then
			eplayer = UnitName("player")
		end
		self:TriggerEvent("BigWigs_SendSync", "GrobbulusInject "..eplayer)
	end
end


