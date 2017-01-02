------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Golemagg the Incinerator"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	corerager_name = "Core Rager",
	earthquakesoonwarn = "Earthquake soon - melees get out!",
	golemaggenrage = "Golemagg the Incinerator gains Enrage",
	enragewarn = "Boss is enraged! Spam heals!",

	cmd = "Golemagg",
	
	enraged_cmd = "enraged",
	enraged_name = "Announce boss Enrage",
	enraged_desc = "Lets you know when boss hits harder",
	
	earthquake_cmd = "earthquake",
	earthquake_name = "Earthquake announce",
	earthquake_desc = "Announces when it's time for melees to back off",
} end)

L:RegisterTranslations("deDE", function() return {
	corerager_name = "Core Rager",
	earthquakesoonwarn = "Erdbeben bald - Melees geht weg!",
	golemaggenrage = "Golemagg the Incinerator bekommt \'Wutanfall",
	enragewarn = "Boss ist in Raserei! Spam Heilung!",

	cmd = "Golemagg",
	
	enraged_cmd = "enraged",
	enraged_name = "Verk\195\188ndet Boss' Raserei",
	enraged_desc = "L\195\164sst dich wissen, wenn Boss h\195\164rter zuschl\195\164gt",
	
	earthquake_cmd = "earthquake",
	earthquake_name = "Verk\195\188ndet erdbeben",
	earthquake_desc = "Sagt an, wenn es f\195\188r die Melees zeit ist, weg zu gehen",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsGolemagg = BigWigs:NewModule(boss)
BigWigsGolemagg.zonename = AceLibrary("Babble-Zone-2.2")["Molten Core"]
BigWigsGolemagg.enabletrigger = boss
BigWigsGolemagg.wipemobs = { L["corerager_name"] }
BigWigsGolemagg.toggleoptions = { "earthquake", "enraged", "bosskill"}
BigWigsGolemagg.revision = tonumber(string.sub("$Revision: 11204 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsGolemagg:OnEnable()
	earthquakeon = nil
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("UNIT_HEALTH")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "GolemaggEarthquake", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "GolemaggEnrage", 10)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsGolemagg:BigWigs_RecvSync(sync)
	if sync == "GolemaggEarthquake" and self.db.profile.earthquake then
		self:TriggerEvent("BigWigs_Message", L["earthquakesoonwarn"], "Attention", "Alarm")
	elseif sync == "GolemaggEnrage" and self.db.profile.enraged then
		self:TriggerEvent("BigWigs_Message", L["enragewarn"], "Attention")
	end
end

function BigWigsGolemagg:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if string.find(msg, L["golemaggenrage"]) then
		self:TriggerEvent("BigWigs_SendSync", "GolemaggEnrage")
	end
end

function BigWigsGolemagg:UNIT_HEALTH(arg1)
	if UnitName(arg1) == boss then
		local health = UnitHealth(arg1)
		if health > 110000 and health <= 162000 and not earthquakeon then
			self:TriggerEvent("BigWigs_SendSync", "GolemaggEarthquake")
			earthquakeon = true
		elseif health > 162000 and earthquakeon then
			earthquakeon = nil
		end
	end
end
