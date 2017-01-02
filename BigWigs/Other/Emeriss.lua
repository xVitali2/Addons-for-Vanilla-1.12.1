------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Emeriss"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Emeriss",

	noxious_cmd = "noxious",
	noxious_name = "Noxious breath alert",
	noxious_desc = "Warn for noxious breath",

	volatileyou_cmd = "volatileyou",
	volatileyou_name = "Voltile infection on you alert",
	volatileyou_desc = "Warn for volatile infection on you",

	volatileother_cmd = "volatileother",
	volatileother_name = "Volatile infection on others alert",
	volatileother_desc = "Warn for volatile infection on others",

	trigger1 = "^([^%s]+) ([^%s]+) afflicted by Volatile Infection",
	trigger2 = "afflicted by Noxious Breath",
	trigger3 = "Hope is a DISEASE of the soul! This land shall wither and die!",
	trigger4 = "Taste your world's corruption!",

	warn1 = "You are afflicted by Volatile Infection!",
	warn2 = " is afflicted by Volatile Infection!",
	warn3 = "5 seconds until Noxious Breath!",
	warn4 = "Noxious Breath! 18 seconds till next!",
	warn5 = "Emeriss engaged! 8 seconds till Noxious Breath!",
	warn6 = "Corruption of the Earth! Heal NoW!",

	isyou = "You",
	isare = "are",

	bar1text = "Noxious Breath",
	bar2text = "Corruption of the Earth",
	
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsEmeriss = BigWigs:NewModule(boss)
BigWigsEmeriss.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Outdoor Raid Bosses Zone"],
	AceLibrary("Babble-Zone-2.2")["Ashenvale"],
	AceLibrary("Babble-Zone-2.2")["Duskwood"],
	AceLibrary("Babble-Zone-2.2")["The Hinterlands"],
	AceLibrary("Babble-Zone-2.2")["Feralas"]
}
BigWigsEmeriss.enabletrigger = boss
BigWigsEmeriss.toggleoptions = {"noxious", "volatileyou", "volatileother", "bosskill"}
BigWigsEmeriss.revision = tonumber(string.sub("$Revision: 16941 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsEmeriss:OnEnable()
	self:RegisterEvent("BigWigs_Message")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
end

	function BigWigsEmeriss:Event( msg )
		if (not self.prior and string.find(msg, L["trigger2"])) then
			self.prior = true
			if self.db.profile.noxious then 
				self:TriggerEvent("BigWigs_Message", L["warn4"], "Important")
				self:ScheduleEvent("BigWigs_Message", 13, L["warn3"], "Important", true, "Alert")
				self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 18, "Interface\\Icons\\Spell_Shadow_LifeDrain02")
			end			
		else
			local _,_, EPlayer, EType = string.find(msg, L["trigger1"])
			if (EPlayer and EType) then
				if (EPlayer == L["isyou"] and EType == L["isare"]) then
					if self.db.profile.volatileyou then self:TriggerEvent("BigWigs_Message", L["warn1"], "Important", true) end
				else
					if self.db.profile.volatileother then
						self:TriggerEvent("BigWigs_Message", EPlayer .. L["warn2"], "Attention")
						self:TriggerEvent("BigWigs_SendTell", EPlayer, L["warn1"])
					end
				end
			end
		end
	end

function BigWigsEmeriss:CHAT_MSG_MONSTER_YELL(msg)
	if (msg == L["trigger3"]) then
		if self.db.profile.noxious then
		 self:TriggerEvent("BigWigs_Message", L["warn5"], "Important")
		 self:ScheduleEvent("BigWigs_Message", 3, L["warn3"], "Important", true, "Alert")
		 self:TriggerEvent("BigWigs_StartBar", self, L["bar1text"], 8, "Interface\\Icons\\Spell_Shadow_LifeDrain02")
end
	elseif (string.find(msg, L["trigger4"])) then
		 self:TriggerEvent("BigWigs_Message", L["warn6"], "Important")
		 self:TriggerEvent("BigWigs_StartBar", self, L["bar2text"], 10, "Interface\\Icons\\Ability_Creature_Cursed_03")
	end
end

function BigWigsEmeriss:BigWigs_Message(text)
	if text == L["warn3"] then self.prior = nil end
end

