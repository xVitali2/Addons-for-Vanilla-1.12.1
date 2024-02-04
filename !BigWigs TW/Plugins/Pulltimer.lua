assert( BigWigs, "BigWigs not found!")

--[[

created by Vnm-Kronos (https://github.com/Vnm-Kronos)
improved by Dorann (https://github.com/xorann)

Allows you to start a pull timer.

Usage:
/pull 				starts a 6s pull timer
/pull <duration>	starts a custom pull timer. "/pull 7" starts a 7s pull timer.

--]]


-----------------------------------------------------------------------
--      Are you local?
-----------------------------------------------------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsPulltimer")

local timer = {
	pulltimer = 0,
}
local syncName = {
	pulltimer = "PulltimerSync",
	stoppulltimer = "PulltimerStopSync",
}
local icon = {
	pulltimer = "RACIAL_ORC_BERSERKERSTRENGTH",
}

-----------------------------------------------------------------------
--      Localization
-----------------------------------------------------------------------

L:RegisterTranslations("enUS", function() return {
	["Pull Timer"] = true,

	["pulltimer"] = true,
	["Options for Pull Timer"] = true,
	pullstart_message = "Pull in %d sec. (Sent by %s)",
	pullstop_message = "Pull aborted (Sent by %s)",
	pull1_message = "Pull in 1",
	pull2_message = "Pull in 2",
	pull3_message = "Pull in 3",
	pull4_message = "Pull in 4",
	pull5_message = "Pull in 5",
	pull0_message = "Pull!",

	["Pull"] = true,
	["pull"] = true,
	["You have to be the raid leader or an assistant"] = true,

	["Enable"] = true,
	["Enable pulltimer."] = true,
} end )

L:RegisterTranslations("ruRU", function() return {  --byCFM
	["Pull Timer"] = "Таймер начала сражения",

	--["pulltimer"] = true,
	["Options for Pull Timer"] = "Настройки таймера начала сражения",
	pullstart_message = "Атака через %d сек. (От %s)",
	pullstop_message = "Атака отменена (От %s)",
	pull1_message = "Атака через 1",
	pull2_message = "Атака через 2",
	pull3_message = "Атака через 3",
	pull4_message = "Атака через 4",
	pull5_message = "Атака через 5",
	pull0_message = "В атаку!",

	--["Pull"] = true,
	--["pull"] = true,
	["You have to be the raid leader or an assistant"] = "Вы должны быть рейд лидером или ассистентом лидера",

	["Enable"] = "Включить",
	["Enable pulltimer."] = "Включить таймер начала сражения",
} end )

-----------------------------------------------------------------------
--      Module Declaration
-----------------------------------------------------------------------

BigWigsPulltimer = BigWigs:NewModule(L["Pull Timer"], "AceConsole-2.0")
BigWigsPulltimer.revision = 20001
BigWigsPulltimer.defaultDB = {
	enable = true,
}
BigWigsPulltimer.consoleCmd = L["pulltimer"]
BigWigsPulltimer.consoleOptions = {
	type = "group",
	name = L["Pull Timer"],
	desc = L["Options for Pull Timer"],
	args = {
		enable = {
			type = "toggle",
			name = L["Enable"],
			desc = L["Enable pulltimer."],
			order = 1,
			get = function() return BigWigsPulltimer.db.profile.enable end,
			set = function(v) BigWigsPulltimer.db.profile.enable = v end,
		},
	},
}

-----------------------------------------------------------------------
--      Initialization
-----------------------------------------------------------------------
-- For easy use in macros.
local function BWPT(seconds)
	if tonumber(seconds) then
		seconds = tonumber(seconds)
	else
		seconds = 0
	end
	BigWigsPulltimer:BigWigs_PullCommand(seconds)
end

function BigWigsPulltimer:OnRegister()
--[[self:RegisterChatCommand({ L["slashpull_cmd"] }, {
type = "group",
args = {
pull = {
type = "text", name = L["slashpull2_cmd"],
desc = L["slashpull2_desc"],
set = function(v) self:BigWigs_PullCommand(v) end,
get = false,
usage = L["<duration>"],
},
},
})]]

end

function BigWigsPulltimer:OnEnable()
	self:RegisterEvent("BigWigs_Pulltimer")
	self:RegisterEvent("BigWigs_PullCommand")
	self:RegisterEvent("BigWigs_RecvSync")
	self:ThrottleSync(0.5, syncName.pulltimer)


	if SlashCmdList then
		SlashCmdList["BWPT_SHORTHAND"] = BWPT
		setglobal("SLASH_BWPT_SHORTHAND1", "/"..L["pull"])
	end
end

function BigWigsPulltimer:OnSetup()
end

-----------------------------------------------------------------------
--      Event Handlers
-----------------------------------------------------------------------

-----------------------------------------------------------------------
--      Synchronization
-----------------------------------------------------------------------

function BigWigsPulltimer:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.pulltimer then
		self:BigWigs_Pulltimer(rest, nick)
	end
	if sync == syncName.stoppulltimer then
		self:BigWigs_StopPulltimer()

		self:Message(string.format(L["pullstop_message"], nick), "Attention", false)
		PlaySound("igQuestFailed")
	end
end

-----------------------------------------------------------------------
--      Utility
-----------------------------------------------------------------------

function BigWigsPulltimer:BigWigs_PullCommand(msg)
	if (IsRaidLeader() or IsRaidOfficer()) then
		if tonumber(msg) then
			timer.pulltimer = tonumber(msg)
		else
			self:Sync(syncName.stoppulltimer)
			return
		end

		if  timer.pulltimer == 0 then
			-- stop pull timer if it is already running
			local registered, time, elapsed, running = self:BarStatus(L["Pull"])
			if running then
				self:Sync(syncName.stoppulltimer)
				return
				-- otherwise start a 6s pull timer
			else
				timer.pulltimer = 6
			end
		elseif ((timer.pulltimer > 63) or (timer.pulltimer < 1))  then
			return
		end

		self:Sync("BWCustomBar "..timer.pulltimer.." ".."bwPullTimer")	--[[This triggers a pull timer for older versions of bigwigs.
		Modified CustomBar.lua RecvSync to ignore sync calls with "bwPullTimer" string in them.
		--]]
		self:Sync(syncName.pulltimer.." "..timer.pulltimer)
	else
		self:Print(L["You have to be the raid leader or an assistant"])
	end
end

function BigWigsPulltimer:BigWigs_StopPulltimer()
	self:TriggerEvent("BigWigs_StopBar", self, L["Pull"])
	self:CancelDelayedSound("One")
	self:CancelDelayedSound("Two")
	self:CancelDelayedSound("Three")
	self:CancelDelayedSound("Four")
	self:CancelDelayedSound("Five")
	self:CancelDelayedMessage(L["pull0_message"])
	self:CancelDelayedMessage(L["pull1_message"])
	self:CancelDelayedMessage(L["pull2_message"])
	self:CancelDelayedMessage(L["pull3_message"])
	self:CancelDelayedMessage(L["pull4_message"])
	self:CancelDelayedMessage(L["pull5_message"])
end

function BigWigsPulltimer:BigWigs_Pulltimer(duration, requester)
	--cancel events from an ongoing pull timer in case a new one is initiated
	self:BigWigs_StopPulltimer()

	if tonumber(duration) then
		timer.pulltimer = tonumber(duration)
	else
		return
	end

	self:Message(string.format(L["pullstart_message"], timer.pulltimer, requester), "Attention", false, "RaidAlert")
	self:Bar(L["Pull"], timer.pulltimer, icon.pulltimer)

	--self:DelayedSound(timer.pulltimer, "Warning")
	self:DelayedMessage(timer.pulltimer, L["pull0_message"], "Important", false, "Warning")
	self:DelayedSound(timer.pulltimer - 1, "One")
	self:DelayedMessage(timer.pulltimer - 1, L["pull1_message"], "Attention", false, false, true)
	if not (timer.pulltimer < 2.2) then
		self:DelayedSound(timer.pulltimer - 2, "Two")
		self:DelayedMessage(timer.pulltimer - 2, L["pull2_message"], "Attention", false, false, true)
	end
	if not (timer.pulltimer < 3.2) then
		self:DelayedSound(timer.pulltimer - 3, "Three")
		self:DelayedMessage(timer.pulltimer - 3, L["pull3_message"], "Attention", false, false, true)
	end
	if not (timer.pulltimer < 4.2) then
		self:DelayedSound(timer.pulltimer - 4, "Four")
		self:DelayedMessage(timer.pulltimer - 4, L["pull4_message"], "Attention", false, false, true)
	end
	if not (timer.pulltimer < 5.2) then
		self:DelayedSound(timer.pulltimer - 5, "Five")
		self:DelayedMessage(timer.pulltimer - 5, L["pull5_message"], "Attention", false, false, true)
	end
end
