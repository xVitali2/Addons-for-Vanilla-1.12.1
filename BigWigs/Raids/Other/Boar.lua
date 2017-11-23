
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Elder Mottled Boar", "Durotar")

module.revision = 20003 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"engage", "charge", "proximity", "bosskill"}

-- Proximity Plugin
module.proximityCheck = function(unit) return CheckInteractDistance(unit, 3) end
module.proximitySilent = true

------------------------------
--      Locals 			    --
------------------------------

local timer = {
	charge = 10,
	teleport = 30,
}
local icon = {
	charge = "Spell_Frost_FrostShock",
	teleport = "Spell_Arcane_Blink",
}
local syncName = {
	teleport = "TwinsTeleport",
}


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Elder-Mottled-Boar",

	engage_cmd = "engage", -- <name>_cmd
	engage_name = "Engage Alert", -- <name>_name
	engage_desc = "Warn for Engage", -- <name>_desc
	engage_msg = "Boar engaged! Be careful.",

	teleport_msg = "Teleport",

	charge_cmd = "charge",
	charge_name = "Charge Alert",
	charge_desc = "Warn for Charge",
	charge_trigger = "gains Boar Charge",
	charge_msg = "Boar is charging!",
	charge_bar = "Charge",

	vulnerability_direct_test = "^[%w]+[%s's]* ([%w%s:]+) ([%w]+) Elder Mottled Boar for ([%d]+) ([%w]+) damage%.[%s%(]*([%d]*)",
	umlaut_test = "hits you for",


	proximity_cmd = "proximity",
	proximity_name = "Proximity Warning",
	proximity_desc = "Show Proximity Warning Frame",

} end )

L:RegisterTranslations("deDE", function() return {
	engage_name = "Pull Warnung",
	engage_desc = "Warnung beim Pull",
	engage_msg = "Eber gepullt! Sei vorsichtig.",

	teleport_msg = "Teleport",

	charge_name = "Ansturm Warnung",
	charge_desc = "Warnung f\195\188r anst\195\188rmen",
	charge_trigger = "bekommt 'Eberangriff'", -- uebersetzung?
	charge_msg = "Eber st\195\188rmt an!",
	charge_bar = "Anst\195\188rmen",

	vulnerability_direct_test = "^[%w]+[%s's]* ([%w%s:]+) ([%w]+) Elder Mottled Boar for ([%d]+) ([%w]+) damage%.[%s%(]*([%d]*)",
	umlaut_test = "trifft Euch für",

	proximity_cmd = "proximity",
	proximity_name = "Nähe Warnungsfenster",
	proximity_desc = "Zeit das Nähe Warnungsfenster",

} end )


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")

	self:RegisterEvent("CHAT_MSG_COMBAT_SELF_HITS", "PlayerDamageEvents")
	self:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "PlayerDamageEvents")
	self:RegisterEvent("CHAT_MSG_SPELL_PET_DAMAGE", "PlayerDamageEvents")
	self:RegisterEvent("CHAT_MSG_SPELL_PARTY_DAMAGE", "PlayerDamageEvents")
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE", "PlayerDamageEvents")

	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "UmlautCheck")

	self:RegisterEvent("UNIT_HEALTH")

	--self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe") -- we want to override this function

	--self:ThrottleSync(28, syncName.teleport)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = false

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH") -- CHAT_MSG_COMBAT_HOSTILE_DEATH is registered in the SetupModule function for the CheckBossDeath function. To make sure we are overriding it, we have to register the event in the OnSetup function of the module and add the CheckBossDeath functionality there.
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.engage then
		self:Message(L["engage_msg"], "Attention")
	end

	self:Sync("TwinsTeleport")
	self:TriggerEvent("BigWigs_Enrage", 30, self.translatedName)

	self:Proximity()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
	self:RemoveProximity()
	self:TriggerEvent("BigWigs_EnrageStop")
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)
	BigWigs:Print("hostile death: " .. msg)
end

function module:CheckForWipe(event)
	self:DebugMessage("BigWigsBoar:CheckForWipe()")
	BigWigs:CheckForWipe(self)
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if self.db.profile.charge and string.find(arg1, L["charge_trigger"]) then
		-- countdown
		self:Sound("Ten");
		self:DelayedSound(timer.charge - 9, "Nine")
		self:DelayedSound(timer.charge - 8, "Eight")
		self:DelayedSound(timer.charge - 7, "Seven")
		self:DelayedSound(timer.charge - 6, "Six")
		self:DelayedSound(timer.charge - 5, "Five")
		self:DelayedSound(timer.charge - 4, "Four")
		self:DelayedSound(timer.charge - 3, "Three")
		self:DelayedSound(timer.charge - 2, "Two")
		self:DelayedSound(timer.charge - 1, "One")
		self:DelayedSound(timer.charge, "Beware")
		self:Bar(L["charge_bar"], timer.charge, icon.charge)
	end
end

function module:PlayerDamageEvents(msg)
	if not string.find(msg, "Eye of C'Thun") then
		local _, _, userspell, stype, dmg, school, partial = string.find(msg, L["vulnerability_direct_test"])
		--if GetLocale() == "deDE" then
		--	if string.find(stype, L["crit"]) then stype = L["crit"] else stype = L["hit"] end
		--	school = string.gsub(school, "schaden", "")
		--end
		if stype and dmg and school then
			if tonumber(dmg) > 300 then
				-- trigger weakend
				DEFAULT_CHAT_FRAME:AddMessage("C'Thun is weakened")
				self:Sound("Beware")
				self:Sound("Seven")
				--self:TriggerEvent("BigWigs_SendSync", "CThunWeakened1")
			end
		end
	end
end

function module:UmlautCheck(msg)
	if string.find(msg, L["umlaut_test"]) then
	--self:DebugMessage("umlaut test succesful")
	else
	--self:DebugMessage("umlaut test not succesful")
	end
end

function module:UNIT_HEALTH(arg1)
	if UnitName(arg1) == module.translatedName then
		local health = UnitHealth(arg1)
		--self:DebugMessage("health: " .. health)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync( sync, rest, nick )
	self:DebugMessage("boar sync: " .. sync)

	if sync == syncName.teleport then
		self:Teleport()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Teleport()
	self:Bar(L["teleport_msg"], timer.teleport, icon.teleport)

	self:DelayedSound(timer.teleport - 10, "Ten")
	self:DelayedSound(timer.teleport - 3, "Three")
	self:DelayedSound(timer.teleport - 2, "Two")
	self:DelayedSound(timer.teleport - 1, "One")

	self:CancelDelayedSync(syncName.teleport)
	self:DelayedSync(timer.teleport, syncName.teleport)

	self:KTM_Reset()
end


----------------------------------
--      Module Test Function    --
----------------------------------

function module:Test()
	--[[local function sweep()
	if self.phase == "emerged" then
	BigWigsOuro:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(L["sweeptrigger"])
	end
	end
	local function sandblast()
	if self.phase == "emerged" then
	BigWigsOuro:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(L["sandblasttrigger"])
	end
	end
	local function submerge()
	if self.phase == "emerged" then
	ClearTarget()
	end
	end
	local function emerge()
	if self.phase == "submerged" then
	TargetUnit("player")
	BigWigsOuro:EmergeCheck(L["emergetrigger"])
	end
	end]]
	local function deactivate()
		self:DisableModule(self:ToString())
	end

	BigWigs:Print("BigWigsBoar Test started")
	BigWigs:Print("  Sweep Test after 5s")
	BigWigs:Print("  Sand Storm Test after 10s")
	BigWigs:Print("  Submerge Test after 32s")
	BigWigs:Print("  Emerge Test after 42s")

	-- immitate CheckForEngage
	self:SendEngageSync()

	-- sweep after 5s
	local s = self:DelayedBar(2, "test", 7, "Spell_Frost_FrostShock")
	local s = self:DelayedBar(2, "test2", 7, "Spell_Frost_FrostShock")
	--self:DebugMessage("s: "..s.id.id)
	self:CancelDelayedBar("test")
end
