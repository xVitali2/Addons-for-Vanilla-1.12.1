------------------------------
--      Are you local?      --
------------------------------

local eyeofcthun = AceLibrary("Babble-Boss-2.2")["Eye of C'Thun"]
local cthun = AceLibrary("Babble-Boss-2.2")["C'Thun"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs" .. cthun)

local gianteye = "Giant Eye Tentacle"

local timeP1Tentacle = 80      -- tentacle timers for phase 1
local timeP1TentacleStart = 45 -- delay for first tentacles from engage onwards
local timeP1GlareStart = 50    -- delay for first dark glare from engage onwards
local timeP1Glare = 80         -- interval for dark glare
local timeP1GlareDuration = 30 -- duration of dark glare
local timeP2Offset = 11        -- delay for all timers to restart after the Eye dies
local timeP2Tentacle = 30      -- tentacle timers for phase 2
local timeP2ETentacle = 60     -- Eye tentacle timers for phase 2
local timeReschedule = 50      -- delay from the moment of weakening for timers to restart
local timeTarget = 10          -- delay for target change checking on Eye of C'Thun
local timeWeakened = 45        -- duration of a weaken

local cthunstarted = nil
local phase2started = nil
local firstGlare = nil
local firstWarning = nil
local target = nil
local tentacletime = timeP1Tentacle


----------------------------
--      Localization      --
----------------------------


L:RegisterTranslations("enUS", function() return {
	cmd = "Cthun",

	tentacle_cmd = "tentacle",
	tentacle_name = "Tentacle Alert",
	tentacle_desc = "Warn for Tentacles",

	glare_cmd = "glare",
	glare_name = "Dark Glare Alert",
	glare_desc = "Warn for Dark Glare",

	group_cmd = "group",
	group_name = "Dark Glare Group Warning",
	group_desc = "Warn for Dark Glare on Group X",

	giant_cmd = "giant",
	giant_name = "Giant Eye Alert",
	giant_desc = "Warn for Giant Eyes",

	weakened_cmd = "weakened",
	weakened_name = "Weakened Alert",
	weakened_desc = "Warn for Weakened State",

	rape_cmd = "rape",
	rape_name = "Rape jokes are funny",
	rape_desc = "Some people like hentai jokes.",

	weakenedtrigger = "is weakened!",
	tentacle	= "Tentacle Rape Party - 5 sec",

	norape		= "Tentacles in 5sec!",

	testbar		= "time",
	say		= "say",

	weakened	= "C'Thun is weakened for 45 sec",
	invulnerable2	= "Party ends in 5 seconds",
	invulnerable1	= "Party over - C'Thun invulnerable",

	GNPPtrigger	= "Nature Protection",
	GSPPtrigger	= "Shadow Protection",
	Sundertrigger	= "Sunder Armor",
	CoEtrigger	= "Curse of the Elements",
	CoStrigger	= "Curse of Shadow",
	CoRtrigger	= "Curse of Recklessness",

	startwarn	= "C'Thun engaged! - 45 sec until Dark Glare and Eyes",

	glare		= "Dark glare!",

	barTentacle	= "Tentacle rape party!",
	barNoRape	= "Tentacle party!",
	barWeakened	= "C'Thun is weakened!",
	barGlare	= "Dark glare!",
	barGiant	= "Giant Eye!",
	barGiantC	= "Giant Claw!",
	barGreenBeam	= "Eye tentacle spawn!",
	gedownwarn	= "Giant Eye down!",

	eyebeam		= "Eye Beam",
	glarewarning	= "DARK GLARE ON YOU!",
	groupwarning	= "Dark Glare on group %s (%s)",
	positions2	= "Dark Glare ends in 5 sec",
	phase2starting	= "The Eye is dead! Body incoming!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsCThun = BigWigs:NewModule(cthun)
BigWigsCThun.zonename = AceLibrary("Babble-Zone-2.2")["Ahn'Qiraj"]
BigWigsCThun.enabletrigger = { eyeofcthun, cthun }
BigWigsCThun.toggleoptions = { "rape", -1, "tentacle", "glare", "group", -1, "giant", "weakened", "bosskill" }
BigWigsCThun.revision = tonumber(string.sub("$Revision: 15989 $", 12, -3))

function BigWigsCThun:OnEnable()
	target = nil
	cthunstarted = nil
	firstGlare = nil
	firstWarning = nil
	phase2started = nil

	tentacletime = timeP1Tentacle

	-- register events
	--self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	--self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE")
	--self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
	--self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "Emote")		-- weakened triggering
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "Emote")		-- weakened triggering
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE") -- engage of Eye of C'Thun
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE") -- engage of Eye of C'Thun
	-- Not sure about this, since we get out of combat between the phases.
	--self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:RegisterEvent("BigWigs_RecvSync")

	self:TriggerEvent("BigWigs_ThrottleSync", "CThunStart", 20)
	self:TriggerEvent("BigWigs_ThrottleSync", "CThunP2Start", 20)
	self:TriggerEvent("BigWigs_ThrottleSync", "CThunWeakened", 20)
	self:TriggerEvent("BigWigs_ThrottleSync", "CThunGEdown", 3)
end

----------------------
--  Event Handlers  --
----------------------

function BigWigsCThun:Emote( msg )
	if string.find(msg, L["weakenedtrigger"]) then self:TriggerEvent("BigWigs_SendSync", "CThunWeakened") end
end

function BigWigsCThun:CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE( arg1 )
	if not cthunstarted and arg1 and string.find(arg1, L["eyebeam"]) then 
        self:TriggerEvent("BigWigs_SendSync", "CThunStart")
        end
end

function BigWigsCThun:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if (msg == string.format(UNITDIESOTHER, eyeofcthun)) then
		self:TriggerEvent("BigWigs_SendSync", "CThunP2Start")
	elseif (msg == string.format(UNITDIESOTHER, gianteye)) then
		self:TriggerEvent("BigWigs_SendSync", "CThunGEdown")
	elseif (msg == string.format(UNITDIESOTHER, cthun)) then
		if self.db.profile.bosskill then self:TriggerEvent("BigWigs_Message", string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], cthun), "Bosskill", nil, "Victory") end
		self.core:ToggleModuleActive(self, false)
	end
end

function BigWigsCThun:BigWigs_RecvSync( sync )
	if sync == "CThunStart" then
		self:CThunStart()
	elseif sync == "CThunP2Start" then
		self:CThunP2Start()
	elseif sync == "CThunWeakened" then
		self:CThunWeakened()
	elseif sync == "CThunGEdown" then
		self:TriggerEvent("BigWigs_Message", L["gedownwarn"], "Positive")
	end
end

-----------------------
--   Sync Handlers   --
-----------------------

function BigWigsCThun:CThunStart()
	if not cthunstarted then
		cthunstarted = true

		self:TriggerEvent("BigWigs_Message", L["startwarn"], "Attention")

		if self.db.profile.tentacle then
			self:TriggerEvent("BigWigs_StartBar", self, self.db.profile.rape and L["barTentacle"] or L["barNoRape"], timeP1TentacleStart, "Interface\\Icons\\Spell_Nature_CallStorm")
			self:ScheduleEvent("bwcthuntentacle", "BigWigs_Message", timeP1TentacleStart - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", true, "Alert")
		end

		if self.db.profile.glare then
			self:TriggerEvent("BigWigs_StartBar", self, L["barGlare"], timeP1GlareStart, "Interface\\Icons\\Spell_Shadow_ShadowBolt")
			self:ScheduleEvent("BigWigs_Message", timeP1GlareStart, L["glare"], "Urgent", true, "Alarm" )
		end

		firstGlare = true
		firstWarning = true

		self:ScheduleEvent("bwcthuntentaclesstart", self.StartTentacleRape, timeP1TentacleStart, self )
		self:ScheduleEvent("bwcthundarkglarestart", self.DarkGlare, timeP1GlareStart, self )
		self:ScheduleEvent("bwcthungroupwarningstart", self.GroupWarning, timeP1GlareStart - 1, self )
		self:ScheduleRepeatingEvent("bwcthuntarget", self.CheckTarget, timeTarget, self )
	end
end

function BigWigsCThun:CThunP2Start()
	if not phase2started then
		phase2started = true
		tentacletime = timeP2Tentacle

		self:TriggerEvent("BigWigs_Message", L["phase2starting"], "Bosskill")

		self:TriggerEvent("BigWigs_StopBar", self, L["barGlare"] )
		self:TriggerEvent("BigWigs_StopBar", self, L["barTentacle"] )
		self:TriggerEvent("BigWigs_StopBar", self, L["barNoRape"] )
		self:TriggerEvent("BigWigs_StopBar", self, L["barGreenBeam"] )

		self:CancelScheduledEvent("bwcthuntentacle")

		self:CancelScheduledEvent("bwcthunglare")

		self:CancelScheduledEvent("bwcthunpositions2")

		-- cancel the repeaters
		self:CancelScheduledEvent("bwcthuntentacles")
		self:CancelScheduledEvent("bwcthundarkglare")
		self:CancelScheduledEvent("bwcthungroupwarning")
		self:CancelScheduledEvent("bwcthuntarget")
		self:CancelScheduledEvent("bwctea1")
		self:CancelScheduledEvent("bwctea2")
		self:CancelScheduledEvent("bwctga")

		if self.db.profile.tentacle then
			self:ScheduleEvent("bwcthuntentacle", "BigWigs_Message", timeP2Tentacle + timeP2Offset - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", true, "Alert")
			self:TriggerEvent("BigWigs_StartBar", self, self.db.profile.rape and L["barTentacle"] or L["barNoRape"], timeP2Tentacle + timeP2Offset, "Interface\\Icons\\Spell_Nature_CallStorm")
	        self:ScheduleEvent("BigWigs_StartBar", 41, self, L["barTentacle"], 30, "Interface\\Icons\\Spell_Nature_CallStorm")
			self:ScheduleEvent("bwcthuntentacle2", "BigWigs_Message", 66, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", true, "Alert")
		end

		if self.db.profile.giant then
			self:TriggerEvent("BigWigs_StartBar", self, L["barGiant"], 56, "Interface\\Icons\\Ability_EyeOfTheOwl")
			self:TriggerEvent("BigWigs_StartBar", self, L["barGiantC"], 26, "Interface\\Icons\\Spell_Nature_Earthquake")
		end

		self:ScheduleEvent("bwcthunstarttentacles", self.StartTentacleRape, timeP2ETentacle + timeP2Offset, self )
	        self:ScheduleEvent("bwcthunstartgiant", self.StartGiantRape, 56, self )
	        self:ScheduleEvent("bwcthunstartgiantc", self.StartGiantCRape, 26, self )
		self:ScheduleRepeatingEvent("bwcthuntargetp2", self.CheckTargetP2, timeTarget, self )
	end

end

function BigWigsCThun:CThunWeakened()
	if self.db.profile.weakened then
		self:TriggerEvent("BigWigs_Message", L["weakened"], "Positive" )
		self:TriggerEvent("BigWigs_StartBar", self, L["barWeakened"], timeWeakened, "Interface\\Icons\\INV_ValentinesCandy")
		self:ScheduleEvent("bwcthunweaken2", "BigWigs_Message", timeWeakened - 5, L["invulnerable2"], "Urgent")
		self:ScheduleEvent("bwcthunweaken1", "BigWigs_Message", timeWeakened, L["invulnerable1"], "Important" )
	end

	-- cancel tentacle timers
	self:CancelScheduledEvent("bwcthuntentacle")
	self:CancelScheduledEvent("bwcthuntentacle2")
	self:CancelScheduledEvent("bwcthungtentacles")
	self:CancelScheduledEvent("bwcthungctentacles")
	self:CancelScheduledEvent("bwctea1")
	self:CancelScheduledEvent("bwctea2")
	self:CancelScheduledEvent("bwctgea")
	self:CancelScheduledEvent("bwctgca")


	self:TriggerEvent("BigWigs_StopBar", self, L["barTentacle"])
	self:TriggerEvent("BigWigs_stopBar", self, L["barNoRape"])
	self:TriggerEvent("BigWigs_StopBar", self, L["barGiant"])
	self:TriggerEvent("BigWigs_StopBar", self, L["barGiantC"])


	self:CancelScheduledEvent("bwcthuntentacles")
	self:ScheduleEvent("BigWigs_StartBar", 45, self, L["barTentacle"], 5, "Interface\\Icons\\Spell_Nature_CallStorm")
	self:ScheduleEvent("BigWigs_StartBar", 45, self, L["barGiantC"], 10, "Interface\\Icons\\Spell_Nature_Earthquake")
	self:ScheduleEvent("BigWigs_StartBar", 45, self, L["barGiant"], 40, "Interface\\Icons\\Ability_EyeOfTheOwl")
	self:ScheduleEvent("BigWigs_StartBar", 50, self, L["barTentacle"], 30, "Interface\\Icons\\Spell_Nature_CallStorm")
	self:ScheduleEvent("BigWigs_StartBar", 55, self, L["barGiantC"], 60, "Interface\\Icons\\Spell_Nature_Earthquake")
	self:ScheduleEvent("bwcthunstarttentacles", self.StartTentacleRape, timeReschedule, self )
	self:ScheduleEvent("bwcthunstartgiant", self.StartGiantCRape, timeReschedule + 5, self )
	self:ScheduleEvent("bwcthunstartgiantc", self.StartGiantRape, timeReschedule + 35, self )
end

-----------------------
-- Utility Functions --
-----------------------

function BigWigsCThun:StartTentacleRape()
	self:TentacleRape()
	self:ScheduleRepeatingEvent("bwcthuntentacles", self.TentacleRape, tentacletime, self )
end

function BigWigsCThun:StartGiantRape()
	self:GTentacleRape()
	self:ScheduleRepeatingEvent("bwcthungtentacles", self.GTentacleRape, 60, self )
end

function BigWigsCThun:StartGiantCRape()
	self:GCTentacleRape()
	self:ScheduleRepeatingEvent("bwcthungctentacles", self.GCTentacleRape, 60, self )
end


function BigWigsCThun:CheckTarget()
	local i
	local newtarget = nil
	if( UnitName("playertarget") == eyeofcthun ) then
		newtarget = UnitName("playertargettarget")
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == eyeofcthun then
				newtarget = UnitName("Raid"..i.."targettarget")
				break
			end
		end
	end
	if( newtarget ) then
		target = newtarget
	end
end

function BigWigsCThun:CheckTargetP2()
	local i
	local newtarget = nil
	if( UnitName("playertarget") == gianteye ) then
		newtarget = UnitName("playertargettarget")
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == gianteye then
				newtarget = UnitName("Raid"..i.."targettarget")
				break
			end
		end
	end
	if( newtarget ) then
		target = newtarget
	end
end

function BigWigsCThun:GroupWarning()
	if target then
		local i, name, group
		for i = 1, GetNumRaidMembers(), 1 do
			name, _, group, _, _, _, _, _ = GetRaidRosterInfo(i)
			if name == target then break end
		end
		if self.db.profile.group then
			self:TriggerEvent("BigWigs_Message", string.format( L["groupwarning"], group, target), "Important", true, "Alarm")
			self:TriggerEvent("BigWigs_SendTell", target, L["glarewarning"])
		end
	end
	if firstWarning then
		self:CancelScheduledEvent("bwcthungroupwarning")
		self:ScheduleRepeatingEvent("bwcthungroupwarning", self.GroupWarning, timeP1Glare, self )
		firstWarning = nil
	end
end

function BigWigsCThun:GTentacleRape()
	if phase2started then
			if self.db.profile.giant then
				self:TriggerEvent("BigWigs_StartBar", self, L["barGiant"], timeP2ETentacle, "Interface\\Icons\\Ability_EyeOfTheOwl")
			
	end
end
end

function BigWigsCThun:GCTentacleRape()
	if phase2started then
			if self.db.profile.giant then
				self:TriggerEvent("BigWigs_StartBar", self, L["barGiantC"], timeP2ETentacle, "Interface\\Icons\\Spell_Nature_Earthquake")
			
	end
end
end

function BigWigsCThun:TentacleRape()
	if self.db.profile.tentacle then
		self:TriggerEvent("BigWigs_StartBar", self, self.db.profile.rape and L["barTentacle"] or L["barNoRape"], tentacletime, "Interface\\Icons\\Spell_Nature_CallStorm")
		self:ScheduleEvent("bwcthuntentacle", "BigWigs_Message", tentacletime - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", true, "Alert")
	end
end

function BigWigsCThun:DarkGlare()
	if self.db.profile.glare then
		self:TriggerEvent("BigWigs_StartBar", self, L["barGreenBeam"], timeP1GlareDuration, "Interface\\Icons\\Spell_Nature_CallStorm")
		self:TriggerEvent("BigWigs_StartBar", self, L["barGlare"], timeP1Glare, "Interface\\Icons\\Spell_Shadow_ShadowBolt")
		self:ScheduleEvent("bwcthunglare", "BigWigs_Message", timeP1Glare - .1, L["glare"], "Urgent", true, "Alarm")
		self:ScheduleEvent("bwcthunpositions2", "BigWigs_Message", timeP1GlareDuration - 5, L["positions2"], "Urgent")
	end
	if firstGlare then
		self:CancelScheduledEvent("bwcthundarkglare")
		self:ScheduleRepeatingEvent("bwcthundarkglare", self.DarkGlare, timeP1Glare, self )
		firstGlare = nil
	end
end
