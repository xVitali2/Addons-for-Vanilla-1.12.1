
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Flamegor", "Blackwing Lair")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	wingbuffet_trigger = "Flamegor begins to cast Wing Buffet.",
	shadowflame_trigger = "Flamegor begins to cast Shadow Flame.",
	frenzygain_trigger = "Flamegor gains Frenzy.",
	frenzygain_trigger2 = "Flamegor goes into a frenzy!",
	frenzyend_trigger = "Frenzy fades from Flamegor.",

	wingbuffet_message = "Wing Buffet! Next one in 30 seconds!",
	wingbuffet_warning = "TAUNT now! Wing Buffet soon!",
	shadowflame_warning = "Shadow Flame incoming!",
	frenzy_message = "Frenzy! Tranq now!",
	frenzy_bar = "Frenzy",
	frenzy_Nextbar = "Next Frenzy",

	wingbuffetcast_bar = "Wing Buffet",
	wingbuffet_bar = "Next Wing Buffet",
	wingbuffet1_bar = "Initial Wing Buffet",
	shadowflame_bar = "Shadow Flame",
	shadowflame_Nextbar = "Next Shadow Flame",

	cmd = "Flamegor",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Wing Buffet alert",
	wingbuffet_desc = "Warn when Flamegor casts Wing Buffet.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "Shadow Flame alert",
	shadowflame_desc = "Warn when Flamegor casts Shadow Flame.",

	frenzy_cmd = "frenzy",
	frenzy_name = "Frenzy alert",
	frenzy_desc = "Warn when Flamegor is frenzied.",
} end)

L:RegisterTranslations("esES", function() return {
	wingbuffet_trigger = "Flamagor comienza a lanzar Festín de alas.",
	shadowflame_trigger = "Flamagor comienza a lanzar Llama de las Sombras.",
	frenzygain_trigger = "Flamagor entra Frenesí.",
	frenzygain_trigger2 = "¡Flamagor se vuelve en frenesí!",
	frenzyend_trigger = "Frenesí desaparece de Flamagor.",


	wingbuffet_message = "¡Festín de alas! El Próximo en 30 segundos!",
	wingbuffet_warning = "¡IRRITA ahora! Festín de alas pronto!",
	shadowflame_warning = "¡Llama de las Sombras entrante!",
	frenzy_message = "¡Frenesí! Disparo tranquilizante ahora!",
	frenzy_bar = "Frenesí",
	frenzy_Nextbar = "Próximo Frenesí",

	wingbuffetcast_bar = "Festín de alas",
	wingbuffet_bar = "Próximo Festín de alas",
	wingbuffet1_bar = "Festín de alas Inicial",
	shadowflame_bar = "Llama de las Sombras",
	shadowflame_Nextbar = "Próxima Llama de las Sombras",

	--cmd = "Flamegor",

	--wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Alerta de Festín de alas",
	wingbuffet_desc = "Avisa cuando Flamagor lance Festín de alas.",

	--shadowflame_cmd = "shadowflame",
	shadowflame_name = "Alerta de Llama de las Sombras",
	shadowflame_desc = "Avisa cuando Flamagor lance Llama de las Sombras.",

	--frenzy_cmd = "frenzy",
	frenzy_name = "Alerta de Frenesí",
	frenzy_desc = "Avisa cuando Flamagor se vuelva en frenesí.",
} end)

L:RegisterTranslations("deDE", function() return {
	wingbuffet_trigger = "Flamegor beginnt Fl\195\188gelsto\195\159 zu wirken.",
	shadowflame_trigger = "Flamegor beginnt Schattenflamme zu wirken.",
	frenzygain_trigger = "Flamegor bekommt \'Wutanfall\'.",
	frenzyend_trigger = "Wutanfall schwindet von Flamegor.",

	wingbuffet_message = "Fl\195\188gelsto\195\159! N\195\164chster in 30 Sekunden!",
	wingbuffet_warning = "Jetzt TAUNT! Fl\195\188gelsto\195\159 bald!",
	shadowflame_warning = "Schattenflamme bald!",
	frenzy_message = "Wutanfall! Tranq jetzt!",
	frenzy_bar = "Wutanfall",
	frenzy_Nextbar = "Nächster Wutanfall",

	wingbuffetcast_bar = "Fl\195\188gelsto\195\159",
	wingbuffet_bar = "N\195\164chster Fl\195\188gelsto\195\159",
	wingbuffet1_bar = "Erster Fl\195\188gelsto\195\159",
	shadowflame_bar = "Schattenflamme",
	shadowflame_Nextbar = "Nächste Schattenflamme",

	cmd = "Flamegor",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Alarm f\195\188r Fl\195\188gelsto\195\159",
	wingbuffet_desc = "Warnung, wenn Flamegor Fl\195\188gelsto\195\159 wirkt.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "Alarm f\195\188r Schattenflamme",
	shadowflame_desc = "Warnung, wenn Flamegor Schattenflamme wirkt.",

	frenzy_cmd = "frenzy",
	frenzy_name = "Alarm f\195\188r Wutanfall",
	frenzy_desc = "Warnung, wenn Flamegor in Wutanfall ger\195\164t.",
} end)

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20008 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"wingbuffet", "shadowflame", "frenzy", "bosskill"}


-- locals
local timer = {
	firstWingbuffet = 30,
	wingbuffet = 30,
	wingbuffetCast = 1,
	firstShadowflame = 16,
	shadowflame = 16,
	shadowflameCast = 2,
	firstFrenzy = 10,
	frenzy = 10,
}
local icon = {
	wingbuffet = "INV_Misc_MonsterScales_14",
	shadowflame = "Spell_Fire_Incinerate",
	frenzy = "Ability_Druid_ChallangingRoar",
	tranquil = "Spell_Nature_Drowsy",
}
local syncName = {
	wingbuffet = "FlamegorWingBuffet"..module.revision,
	shadowflame = "FlamegorShadowflame"..module.revision,
	frenzy = "FlamegorFrenzyStart"..module.revision,
	frenzyOver = "FlamegorFrenzyEnd"..module.revision,
}

local lastFrenzy = 0
local _, playerClass = UnitClass("player")


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self.started = nil
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "Event")

	self:ThrottleSync(10, syncName.wingbuffet)
	self:ThrottleSync(10, syncName.shadowflame)
	self:ThrottleSync(5, syncName.frenzy)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	lastFrenzy = 0
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.wingbuffet then
		self:DelayedMessage(timer.firstWingbuffet - 5, L["wingbuffet_warning"], "Attention", nil, nil, true)
		self:Bar(L["wingbuffet1_bar"], timer.firstWingbuffet, icon.wingbuffet)
	end
	if self.db.profile.shadowflame then
		self:Bar(L["shadowflame_Nextbar"], timer.firstShadowflame, icon.shadowflame)
	end
	if self.db.profile.frenzy then
		self:Bar(L["frenzy_Nextbar"], timer.firstFrenzy, icon.frenzy, true, "white")
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end



------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["wingbuffet_trigger"] then
		self:Sync(syncName.wingbuffet)
	elseif msg == L["shadowflame_trigger"] then
		self:Sync(syncName.shadowflame)
	end
end

function module:Event(msg)
	if msg == L["frenzygain_trigger"] or msg == L["frenzygain_trigger2"] then
		self:Sync(syncName.frenzy)
	elseif msg == L["frenzyend_trigger"] then
		self:Sync(syncName.frenzyOver)
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.wingbuffet and self.db.profile.wingbuffet then
		self:Message(L["wingbuffet_message"], "Important")
		self:RemoveBar(L["wingbuffet_bar"]) -- remove timer bar
		self:DelayedMessage(timer.wingbuffet - 5, L["wingbuffet_warning"], "Attention", nil, nil, true)
		self:Bar(L["wingbuffetcast_bar"], timer.wingbuffetCast, icon.wingbuffet, true, "black") -- show cast bar
		self:DelayedBar(timer.wingbuffetCast, L["wingbuffet_bar"], timer.wingbuffet, icon.wingbuffet) -- delayed timer bar
	elseif sync == syncName.shadowflame and self.db.profile.shadowflame then
		self:Message(L["shadowflame_warning"], "Important", true, "Alarm")
		self:RemoveBar(L["shadowflame_Nextbar"]) -- remove timer bar
		self:Bar(L["shadowflame_bar"], timer.shadowflameCast, icon.shadowflame, true, "red") -- show cast bar
		self:DelayedBar(timer.shadowflameCast, L["shadowflame_Nextbar"], timer.shadowflame-timer.shadowflameCast, icon.shadowflame) -- delayed timer bar
	elseif sync == syncName.frenzy and self.db.profile.frenzy then
		self:Message(L["frenzy_message"], "Important", nil, true, "Alert")
		self:Bar(L["frenzy_bar"], timer.frenzy, icon.frenzy, true, "red")
		if playerClass == "HUNTER" then
			self:WarningSign(icon.tranquil, timer.frenzy, true)
		end
		lastFrenzy = GetTime()
	elseif sync == syncName.frenzyOver and self.db.profile.frenzy then
		self:RemoveBar(L["frenzy_bar"])
		self:RemoveWarningSign(icon.tranquil, true)
		if lastFrenzy ~= 0 then
			local NextTime = (lastFrenzy + timer.frenzy) - GetTime()
			self:Bar(L["frenzy_Nextbar"], NextTime, icon.frenzy, true, "white")
		end
	end
end


----------------------------------
--      Module Test Function    --
----------------------------------

function module:Test()
	-- /run local m=BigWigs:GetModule("Ouro");m:Test()
	local function frenzy()
		self:Event(L["frenzygain_trigger"])
	end
	local function frenzyEnd()
		self:Event(L["frenzyend_trigger"])
	end
	local function deactivate()
		self:DebugMessage("deactivate")
		self:Disable()
		--[[self:DebugMessage("deactivate ")
		if self.phase then
		self:DebugMessage("deactivate module "..self:ToString())
		--BigWigs:ToggleModuleActive(self, false)
		self.core:ToggleModuleActive(self, false)
		self.phase = nil
		end]]
	end

	BigWigs:Print("module Test started")
	BigWigs:Print("  frenzy after 5s")


	-- immitate CheckForEngage
	self:SendEngageSync()

	-- sweep after 5s
	self:ScheduleEvent(self:ToString().."Test_frenzy", frenzy, 5, self)

	-- sweep after 5s
	self:ScheduleEvent(self:ToString().."Test_frenzyEnd", frenzyEnd, 10, self)

	-- reset after 60s
	self:ScheduleEvent(self:ToString().."Test_deactivate", deactivate, 15, self)

end
