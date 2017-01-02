------------------------------
--      Are you local?      --
------------------------------

local myname = "CThun Assist"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..myname)
local boss = AceLibrary("Babble-Boss-2.2")["Eye of C'Thun"]
local cthun = AceLibrary("Babble-Boss-2.2")["C'Thun"]
local tablet = AceLibrary("Tablet-2.0")
local paintchips = AceLibrary("PaintChips-2.0")
local roster = nil
local stage2 = nil
local lastplayed = 0
local playername = nil
local combat = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {

	cmd = "cthunassist",

	sound_cmd = "sound",
	sound_name = "Sound",
	sound_desc = "Play sound on proximity.",

	["Big Wigs CThun Assist"] = true,
	["Phase 1 Too Close"] = true,
	["Phase 2 Stomach"] = true,
	["Nobody"] = true,
} end )

L:RegisterTranslations("ruRU", function() return {

	cmd = "cthunassist",

	sound_cmd = "sound",
	sound_name = "Звук",
	sound_desc = "Проигровать звук во время близости.",

	["Big Wigs CThun Assist"] = "Big Wigs К'Тун помощник",
	["Phase 1 Too Close"] = "Фаза 1 близко",
	["Phase 2 Stomach"] = "Фаза 2 желудок",
	["Nobody"] = "Никто",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsCThunAssist = BigWigs:NewModule(myname)
BigWigsCThunAssist.synctoken = myname
BigWigsCThunAssist.zonename = AceLibrary("Babble-Zone-2.2")["Ahn'Qiraj"]
BigWigsCThunAssist.enabletrigger = { boss }
BigWigsCThunAssist.toggleoptions = { "sound" }
BigWigsCThunAssist.revision = tonumber(string.sub("$Revision: 17316 $", 12, -3))
BigWigsCThunAssist.external = true

------------------------------
--      Initialization      --
------------------------------

function BigWigsCThunAssist:OnEnable()
	if not roster then roster = AceLibrary("RosterLib-2.0") end
	roster:Enable()

	stage2 = nil
	lastplayed = 0
	playername = UnitName("player")

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("BigWigs_RecvSync")

	self:ShowTablet()
end

function BigWigsCThunAssist:OnDisable()
	roster = nil
	stage2 = nil
	self:HideTablet()
end

------------------------------
--      Events              --
------------------------------

function BigWigsCThunAssist:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, cthun) then
		self.core:ToggleModuleActive(self, false)
	end
end

function BigWigsCThunAssist:BigWigs_RecvSync(sync)
	if sync == "CThunStart" then
		stage2 = nil
	elseif sync == "CThunP2Start" then
		stage2 = true
	end
end

------------------------------
--      Tablet              --
------------------------------

function BigWigsCThunAssist:OnTooltipUpdate()
	if not tablet:IsRegistered("BigWigs_CThunAssist") then return end

	local headertext = stage2 and L["Phase 2 Stomach"] or L["Phase 1 Too Close"]
	local cat = tablet:AddCategory(
		"columns", 1,
		"text", "|cffcccccc"..headertext.."|r",
		"justify", "CENTER",
		"child_justify", "CENTER"
	)

	local tooclose = 0
	local added = false
	
	for n, u in pairs(roster.roster) do
		if u and u.name and u.class ~= "PET" and not UnitIsDeadOrGhost(u.unitid) then
			if stage2 then
				for a=1,16 do
					local t,c = UnitDebuff(u.unitid,a)
					if not t then break end
					if t == "Interface\\Icons\\Ability_Creature_Disease_02" then
						cat:AddLine("text", "|cff"..paintchips:GetHex(u.class)..u.name.."|r")
						added = true
					end
				end				
			else
				if tooclose < 5 and u.name ~= playername and CheckInteractDistance(u.unitid, 3) then
					cat:AddLine("text", "|cff"..paintchips:GetHex(u.class)..u.name.."|r")
					tooclose = tooclose + 1
				end
			end
		end
	end
	
	if not added and tooclose == 0 then
		cat:AddLine("text", "|cff777777"..L["Nobody"].."|r")
	end
	
	local t = time()
	if tooclose > 0 and t > lastplayed + 1 then
		lastplayed = time()
		if self.db.profile.sound and UnitAffectingCombat("player") then self:TriggerEvent("BigWigs_Sound", "Alarm") end
	end
end

function BigWigsCThunAssist:ShowTablet()
	if not tablet:IsRegistered("BigWigs_CThunAssist") then
		tablet:Register("BigWigs_CThunAssist",
			"children",
				function()
					tablet:SetTitle(L["Big Wigs CThun Assist"])
					self:OnTooltipUpdate()
				end,
			"clickable", true,
			"showTitleWhenDetached", true,
			"showHintWhenDetached", true,
			"cantAttach", true
		)
	end

	if not self:IsEventScheduled("bwcthunassistupdate") then
		self:ScheduleRepeatingEvent("bwcthunassistupdate", function() tablet:Refresh("BigWigs_CThunAssist") end, .1)
	end

	if tablet:IsAttached("BigWigs_CThunAssist") then
		tablet:Detach("BigWigs_CThunAssist")
	end
end

function BigWigsCThunAssist:HideTablet()
	if not tablet:IsRegistered("BigWigs_CThunAssist") then return end

	self:CancelScheduledEvent("bwcthunassistupdate")

	tablet:Attach("BigWigs_CThunAssist")
end

