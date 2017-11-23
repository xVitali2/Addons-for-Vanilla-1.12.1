
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Heigan the Unclean", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Heigan",

	teleport_cmd = "teleport",
	teleport_name = "Teleport Alert",
	teleport_desc = "Warn for Teleports.",

	engage_cmd = "engage",
	engage_name = "Engage Alert",
	engage_desc = "Warn when Heigan is engaged.",

	disease_cmd = "disease",
	disease_name = "Decrepit Fever Alert",
	disease_desc = "Warn for Decrepit Fever",

	erruption_cmd = "erruption",
	erruption_name = "Erruption Alert",
	erruption_desc = "Warn for Erruption",

	-- [[ Triggers ]]--
	starttrigger = "You are mine now!",
	starttrigger2 = "You...are next!",
	starttrigger3 = "I see you!",
	toPlatform_trigger1 = "teleports and begins to channel a spell!",
	toPlatform_trigger2 = "The end is upon you.",
	toFloor_trigger = "rushes to attack once more!",
	die_trigger = "takes his last breath.",
	dtrigger = "afflicted by Decrepit Fever.",

	-- [[ Warnings ]]--
	engage_message = "Heigan the Unclean engaged!",

	dwarn = "Decrepit Fever",

	on_platform_message = "Teleport! Dancing for %d sec!",

	to_floor_30sec_message = "Back in 30 sec",
	to_floor_10sec_message = "Back in 10 sec!",
	on_floor_message = "Back on the floor! 90 sec to next teleport!",

	-- [[ Bars ]]--
	toPlatform_bar = "Teleport!",
	toFloor_bar = "Back on the floor!",
	dbar = "Decrepit Fever",
	erruptionbar = "Erruption",
	dancingshoes = "Put on your dancing shoes!",

	-- [[ Dream Room Mobs ]] --
	["Eye Stalk"] = true,
	["Rotting Maggot"] = true,
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Heigan",

	--teleport_cmd = "teleport",
	teleport_name = "Alerta de Teletransporte",
	teleport_desc = "Avisa para Teletransporte.",

	--engage_cmd = "engage",
	engage_name = "Alerta de Entablar",
	engage_desc = "Avisa cuando Heigan esté entablado.",

	--disease_cmd = "disease",
	disease_name = "Alerta de Fiebre decrépita",
	disease_desc = "Avisa para Fiebre decrépita",

	--erruption_cmd = "erruption",
	erruption_name = "Alerta de Erupción",
	erruption_desc = "Avisa para Eruopción",

	-- [[ Triggers ]]--
	starttrigger = "Ahora me perteneces.",
	starttrigger2 = "Eres... mi próxima víctima.",
	starttrigger3 = "I see you!",
	toPlatform_trigger1 = "teleports and begins to channel a spell!",
	toPlatform_trigger2 = "The end is upon you.",
	toFloor_trigger = "rushes to attack once more!",
	die_trigger = "takes his last breath.",
	dtrigger = "sufre de Fiebre decrépita.",

	-- [[ Warnings ]]--
	engage_message = "¡Entrando en combate con Heigan el Impuro!",

	dwarn = "Fiebre decrépita",

	on_platform_message = "¡Teletransporte! Bailando por %d segundos!",

	to_floor_30sec_message = "¡Regresa en 30 segundos!",
	to_floor_10sec_message = "¡Regresa en 10 segundos!",
	on_floor_message = "¡Regresó al suelo! 90 segundos hasta el próximo teletransporte!",

	-- [[ Bars ]]--
	toPlatform_bar = "¡Teletransporte!",
	toFloor_bar = "¡Resgresó al suelo!",
	dbar = "Fiebre decrépita",
	erruptionbar = "Erupción",
	dancingshoes = "¡Lleva tus zapatos de baile!",

	-- [[ Dream Room Mobs ]] --
	["Eye Stalk"] = "Ojo acechador",
	["Rotting Maggot"] = "Cresa en podredumbre",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20011 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["Eye Stalk"], L["Rotting Maggot"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"engage", "teleport", "disease", "erruption", "bosskill"}


-- locals
local timer = {
	firstDisease = 30,
	firstDiseaseAfterDance = 5,
	disease = {20,25},
	toFloor = 45,
	toPlatform = 90, --dance
	firstErruption = 15,
	firstDanceErruption = 4,
	erruption = 0, -- will be changed during the encounter
	erruptionSlow = 10,
	erruptionFast = 3,
	dancing = 10,
}
local icon = {
	disease = "Ability_Creature_Disease_03",
	toFloor = "Spell_Magic_LesserInvisibilty",
	toPlatform = "Spell_Arcane_Blink",
	erruption = "spell_fire_selfdestruct",
	dancing = "INV_Gizmo_RocketBoot_01",
}
local syncName = {
	toPlatform = "HeiganToPlatform"..module.revision,
	toFloor = "HeiganToFloor"..module.revision,
	disease = "HeiganDisease"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger"])
module:RegisterYellEngage(L["starttrigger2"])
module:RegisterYellEngage(L["starttrigger3"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "Teleport")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL", "Teleport")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckForDisease")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckForDisease")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckForDisease")

	self:ThrottleSync(10, syncName.toPlatform)
	self:ThrottleSync(10, syncName.toFloor)
	self:ThrottleSync(5, syncName.disease)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.teleport then
		self:Bar(L["toPlatform_bar"], timer.toPlatform, icon.toPlatform)
	end
	if self.db.profile.disease then
		self:Bar(L["dbar"], timer.firstDisease, icon.disease)
	end
	if self.db.profile.erruption then
		timer.erruption = timer.erruptionSlow
		self:Bar(L["erruptionbar"], timer.firstErruption, icon.erruption)
		self:ScheduleEvent("HeiganErruption", self.Erruption, timer.firstErruption, self)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_MONSTER_EMOTE( msg )
	if string.find(msg, L["die_trigger"]) then
		self:SendBossDeathSync()
	end
end

function module:Teleport(msg)
	if string.find(msg, L["toPlatform_trigger1"]) or string.find(msg, L["toPlatform_trigger2"]) then
		self:Sync(syncName.toPlatform)
	elseif string.find(msg, L["toFloor_trigger"]) then
		self:Sync(syncName.toFloor)
	end
end

function module:CheckForDisease( msg )
	if string.find(msg, L["dtrigger"]) then
		if self.db.profile.disease then
			self:Sync(syncName.disease)
		end
	end
end

function module:Erruption()
	if self.db.profile.erruption then
		-- don't show bar before teleport
		local registered, time, elapsed = self:BarStatus(L["toPlatform_bar"])
		if registered and timer and elapsed then
			local remaining = time - elapsed
			if timer.erruption + 1 < remaining then
				self:Bar(L["erruptionbar"], timer.erruption, icon.erruption)
				self:ScheduleEvent("HeiganErruption", self.Erruption, timer.erruption, self)
			else
				self:Sound("Beware")
				self:Bar(L["dancingshoes"], timer.dancing, icon.dancing)
			end
		else
			self:Bar(L["erruptionbar"], timer.erruption, icon.erruption)
			self:ScheduleEvent("HeiganErruption", self.Erruption, timer.erruption, self)
		end

	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.disease then
		self:Disease()
	elseif sync == syncName.toPlatform then
		self:ToPlatform()
	elseif sync == syncName.toFloor then
		self:ToFloor()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Disease()
	if self.db.profile.disease then
		self:Message(L["dwarn"], "Important")

		-- don't show bar before teleport
		local registered, time, elapsed = self:BarStatus(L["toPlatform_bar"])
		if time and elapsed then
			local remaining = time - elapsed
			if timer.disease[1] < remaining then
				self:IntervalBar(L["dbar"], timer.disease[1], timer.disease[2], icon.disease)
			end
		end
	end
end

function module:ToPlatform()
	if self.db.profile.teleport then
		self:Message(string.format(L["on_platform_message"], timer.toFloor), "Attention")
		self:Bar(L["toFloor_bar"], timer.toFloor, icon.toFloor)
	end
	if self.db.profile.erruption then
		self:CancelScheduledEvent("HeiganErruption")

		timer.erruption = timer.erruptionFast
		self:Bar(L["erruptionbar"], timer.firstDanceErruption, icon.erruption)
		self:ScheduleEvent("HeiganErruption", self.Erruption, timer.firstDanceErruption, self)
	end
	self:ScheduleEvent("bwHeiganToFloor",  self.ToFloor, timer.toFloor, self )
end

function module:ToFloor()
	self:CancelScheduledEvent("bwHeiganToFloor")
	--self:KTM_Reset()
	if self.db.profile.teleport then
		self:Message(L["on_floor_message"], "Attention")
		self:Bar(L["toPlatform_bar"], timer.toPlatform, icon.toPlatform)
	end
	if self.db.profile.disease then
		self:Bar(L["dbar"], timer.firstDiseaseAfterDance, icon.disease)
	end
	if self.db.profile.erruption then
		self:CancelScheduledEvent("HeiganErruption")

		timer.erruption = timer.erruptionSlow
		self:Bar(L["erruptionbar"], timer.erruption, icon.erruption)
		self:ScheduleEvent("HeiganErruption", self.Erruption, timer.erruption, self)
	end
end

------------------------------
--      Test        	    --
------------------------------

function module:Test()
	-- /run local m=BigWigs:GetModule("Heigan the Unclean");m:Test()

	local function fever()
		module:CheckForDisease(L["dtrigger"])
	end
	local function toPlatform()
		module:Teleport(L["toPlatform_trigger"])
	end
	local function toFloor()
		module:Teleport(L["toFloor_trigger"])
	end

	local function deactivate()
		BigWigs:Print("deactivate")
		self:Disable()
	end



	local time = 0

	-- immitate CheckForEngage
	self:SendEngageSync()

	BigWigs:Print("module Test started")

	-- fever after 9s
	time = time + timer.firstDisease
	BigWigs:Print(" fever after " .. time)
	self:ScheduleEvent(self:ToString().."Test_fever", fever, time, self)

	-- fever after 30s
	time = time + timer.disease[1]
	BigWigs:Print(" fever after " .. time)
	self:ScheduleEvent(self:ToString().."Test_fever2", fever, time, self)

	-- fever after 51s
	time = time + timer.disease[1]
	BigWigs:Print(" fever after " .. time)
	self:ScheduleEvent(self:ToString().."Test_fever3", fever, time, self)

	-- fever after 72s
	time = time + timer.disease[1]
	BigWigs:Print(" fever after " .. time)
	self:ScheduleEvent(self:ToString().."Test_fever4", fever, time, self)


	-- toPlatform after 90s
	time = timer.toPlatform
	BigWigs:Print(" to platform after " .. time)
	self:ScheduleEvent(self:ToString().."Test_toPlatform", toPlatform, time, self)

	-- toFloor after 135s
	time = time + timer.toFloor
	BigWigs:Print(" to floor after " .. time)
	self:ScheduleEvent(self:ToString().."Test_toFloor", toFloor, time, self)


	-- reset after 50s
	time = time + 10
	BigWigs:Print(" deactivate after " .. time)
	self:ScheduleEvent(self:ToString().."Test_deactivate", deactivate, time, self)
end
