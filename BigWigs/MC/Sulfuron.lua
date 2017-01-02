------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Sulfuron Harbinger"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	triggeradddead = "Flamewaker Priest dies",
	triggerbossdead = "Sulfuron Harbinger dies",
	triggercast = "begins to cast Dark Mending",
	healbar = "Dark Mending",
	knockbacktimer = "AoE knockback",
	knockbackannounce = "3 seconds until knockback!",
	healwarn = "Healing!",
	knockback1 = "Hand of Ragnaros hits",
	knockback11 = "Hand of Ragnaros hits",
	knockback2 = "Hand of Ragnaros was resisted",
	knockback3 = "absorb (.+) Hand of Ragnaros",
	knockback33 = "Hand of Ragnaros is absorbed",
	knockback4 = "Hand of Ragnaros (.+) immune",
	flamewakerpriest_name = "Flamewaker Priest",

	addmsg = "%d/4 Flamewaker Priests dead!",

	cmd = "Sulfuron",
	
	knockback_cmd = "knockback",
	knockback_name = "Hand of Ragnaros announce",
	knockback_desc = "Show timer for knockbacks",
	
	heal_cmd = "heal",
	heal_name = "Adds' heals",
	heal_desc = "Announces Flamewaker Priests' heals",
	
	adds_cmd = "adds",
	adds_name = "Dead adds counter",
	adds_desc = "Announces dead Flamewaker Priests",
} end)

L:RegisterTranslations("deDE", function() return {
	triggeradddead = "Flamewaker Priest stirbt",
	triggerbossdead = "Sulfuron Harbinger stirbt",
	triggercast = "beginnt Dunkle Besserung",
	healbar = "Dunkle Besserung",
	knockbacktimer = "AoE R\195\188cksto\195\159",
	knockbackannounce = "3 Sekunden bis R\195\188cksto\195\159!",
	healwarn = "Heilung!",
	knockback1 = "trifft(.+)Hand von Ragnaros",
	knockback11 = "Hand von Ragnaros(.+)trifft",
	knockback2 = "Hand von Ragnaros(.+)widerstanden",
	knockback3 = "absorbiert (.+) Hand von Ragnaros",
	knockback33 = "Hand von Ragnaros (.+) absorbiert",
	knockback4 = "Hand von Ragnaros(.+) immun",
	flamewakerpriest_name = "Flamewaker Priest",

	addmsg = "%d/4 Flamewaker Priest tot!",

	cmd = "Sulfuron",
	
	knockback_cmd = "knockback",
	knockback_name = "Verk\195\188ndet Hand von Ragnaros",
	knockback_desc = "Zeige Timer f\195\188r R\195\188ckst\195\182\195\159e",
	
	heal_cmd = "heal",
	heal_name = "Heilung der Adds",
	heal_desc = "Verk\195\188ndet Heilung der Flamewaker Priest",
	
	adds_cmd = "adds",
	adds_name = "Z\195\164hler f\195\188r tote Adds",
	adds_desc = "Verk\195\188ndet Flamewaker Priests Tod",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsSulfuron = BigWigs:NewModule(boss)
BigWigsSulfuron.zonename = AceLibrary("Babble-Zone-2.2")["Molten Core"]
BigWigsSulfuron.enabletrigger = boss
BigWigsSulfuron.wipemobs = { L["flamewakerpriest_name"] }
BigWigsSulfuron.toggleoptions = {"heal", "adds", "knockback", "bosskill"}
BigWigsSulfuron.revision = tonumber(string.sub("$Revision: 11203 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsSulfuron:OnEnable()
	deadpriests = 0
	sulfurondead = 0
	firstknockback = 0
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "knockback")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "knockback")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "knockback")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "SulfuronAddHeal", 1)
	self:TriggerEvent("BigWigs_ThrottleSync", "SulfuronAddDead", 1)
	self:TriggerEvent("BigWigs_ThrottleSync", "SulfuronAllDead", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "SulfuronSulfuronDead", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "SulfuronKnockback", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "SulfuronKnockbackIni", 5)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsSulfuron:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if string.find(msg, L["triggeradddead"]) then
		self:TriggerEvent("BigWigs_SendSync", "SulfuronAddDead")
	elseif string.find(msg, L["triggerbossdead"]) then
		self:TriggerEvent("BigWigs_SendSync", "SulfuronSulfuronDead")
	end
end

function BigWigsSulfuron:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if string.find(msg, L["triggercast"]) then
		self:TriggerEvent("BigWigs_SendSync", "SulfuronAddHeal")
	end
end

function BigWigsSulfuron:knockback(msg)
	if (string.find(msg, L["knockback1"]) or string.find(msg, L["knockback11"]) or string.find(msg, L["knockback2"]) or string.find(msg, L["knockback3"]) or string.find(msg, L["knockback33"]) or string.find(msg, L["knockback4"])) then
		self:TriggerEvent("BigWigs_SendSync", "SulfuronKnockback")
	end
end

function BigWigsSulfuron:BigWigs_RecvSync( sync )
	if sync == self:GetEngageSync() and (UnitName("target") == "Sulfuron Harbinger" or UnitName("target") == "Flamewaker Priest") then
		if firstknockback == 0 then
			self:TriggerEvent("BigWigs_SendSync", "SulfuronKnockbackIni")
		end
	elseif sync == "SulfuronAddDead" then
		deadpriests = deadpriests + 1
		if self.db.profile.adds then
			self:TriggerEvent("BigWigs_Message", string.format(L["addmsg"], deadpriests), "Positive")
		end
		if ((deadpriests == 4) and (sulfurondead == 1)) then
			self:TriggerEvent("BigWigs_SendSync", "SulfuronAllDead")
		end
	elseif sync == "SulfuronSulfuronDead" then
		self:CancelScheduledEvent("messagewarn1")
		self:TriggerEvent("BigWigs_StopBar", self, L["knockbacktimer"])
		sulfurondead = 1
		if self.db.profile.bosskill then
			self:TriggerEvent("BigWigs_Message", string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], self:ToString()), "Bosskill", nil, "Victory")
		end
		if ((deadpriests == 4) and (sulfurondead == 1)) then
			self:TriggerEvent("BigWigs_SendSync", "SulfuronAllDead")
		end
	elseif sync == "SulfuronAddHeal" and self.db.profile.heal then		
		self:TriggerEvent("BigWigs_Message", L["healwarn"], "Attention", true, "Alarm")
		self:TriggerEvent("BigWigs_StartBar", self, L["healbar"], 2 , "Interface\\Icons\\Spell_Shadow_ChillTouch")
	elseif sync == "SulfuronKnockback" and self.db.profile.knockback then
		self:ScheduleEvent("messagewarn1", "BigWigs_Message", 6.5, L["knockbackannounce"], "Urgent")
		self:TriggerEvent("BigWigs_StartBar", self, L["knockbacktimer"], 9.5 , "Interface\\Icons\\Spell_Fire_Fireball")
	elseif sync == "SulfuronKnockbackIni" then
		firstknockback = 1
		if self.db.profile.knockback then
			self:ScheduleEvent("BigWigs_Message", 2.8, L["knockbackannounce"], "Urgent")
			self:TriggerEvent("BigWigs_StartBar", self, L["knockbacktimer"], 5.8 , "Interface\\Icons\\Spell_Fire_Fireball")
		end
	elseif sync == "SulfuronAllDead" then
		self:TriggerEvent("BigWigs_RemoveRaidIcon")
		self.core:ToggleModuleActive(self, false)
	end
end
