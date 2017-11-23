
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Ossirian the Unscarred", "Ruins of Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Ossirian",

	supreme_cmd = "supreme",
	supreme_name = "Supreme Alert",
	supreme_desc = "Warn for Supreme Mode",

	debuff_cmd = "debuff",
	debuff_name = "Debuff Alert",
	debuff_desc = "Warn for Defuff",

	supremetrigger = "Ossirian the Unscarred gains Strength of Ossirian.",
	supremewarn = "Ossirian Supreme Mode!",
	supremedelaywarn = "Supreme in %d seconds!",
	debufftrigger = "Ossirian the Unscarred is afflicted by (.+) Weakness.",
	crystaltrigger = "Ossirian Crystal Trigger dies.",
	debuffwarn = "Ossirian now weak to %s!",
	supreme_bar = "Supreme",
	expose = "Expose",

	["cyclone_trigger"] = "Enveloping Winds",
	["stomp_trigger"] = "War Stomp",

	["WarStomp"] = "War Stomp",
	["Cyclone"] = "Cyclone",

	["Shadow"] = true,
	["Fire"] = true,
	["Frost"] = true,
	["Nature"] = true,
	["Arcane"] = true,

	["ShadowIcon"] = "Spell_Shadow_ChillTouch",
	["FireIcon"] = "Spell_Fire_Fire",
	["FrostIcon"] = "Spell_Frost_ChillingBlast",
	["NatureIcon"] = "Spell_Nature_Acid_01",
	["ArcaneIcon"] = "Spell_Arcane_PortalOrgrimmar",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Ossirian",

	--supreme_cmd = "supreme",
	supreme_name = "Alerta de Supremo",
	supreme_desc = "Avisa para Modo Supremo",

	--debuff_cmd = "debuff",
	debuff_name = "Alerta de Debuff",
	debuff_desc = "Avisa para Defuff",

	supremetrigger = "Osirio el Sinmarcas gana Fuerza de Osirio.",
	supremewarn = "¡Osirio Modo Supremo!",
	supremedelaywarn = "¡Supremo en %d segundos!",
	debufftrigger = "Osirio el Sinmarcas sufre de Debilidad de (.+).",
	crystaltrigger = "Activador de cristal de Osirio muere.",
	debuffwarn = "¡Osirio está debilidado a %s!",
	supreme_bar = "Supremo",
	expose = "Exponer",

	["cyclone_trigger"] = "Vientos envolventes",
	["stomp_trigger"] = "Pisotón de guerra",

	["WarStomp"] = "Pisotón de guerra",
	["Cyclone"] = "Ciclón",

	["Shadow"] = "Sombras",
	["Fire"] = "Fuego",
	["Frost"] = "Escharcha",
	["Nature"] = "Naturaleza",
	["Arcane"] = "Arcano",

	["ShadowIcon"] = "Spell_Shadow_ChillTouch",
	["FireIcon"] = "Spell_Fire_Fire",
	["FrostIcon"] = "Spell_Frost_ChillingBlast",
	["NatureIcon"] = "Spell_Nature_Acid_01",
	["ArcaneIcon"] = "Spell_Arcane_PortalOrgrimmar",
} end )

L:RegisterTranslations("deDE", function() return {
	supreme_name = "Stärke des Ossirian",
	supreme_desc = "Warnung vor Stärke des Ossirian.",

	debuff_name = "Debuff",
	debuff_desc = "Warnung vor Debuff.",

	supremetrigger = "Ossirian der Narbenlose bekommt 'Stärke des Ossirian'.",
	supremewarn = "Stärke des Ossirian!",
	supremedelaywarn = "Stärke des Ossirian in %d Sekunden!",
	debufftrigger = "Ossirian der Narbenlose ist von (.*)schwäche betroffen.",
	crystaltrigger = "Ossirian Crystal Trigger dies.", -- translation missing
	debuffwarn = "Ossirian für 45 Sekunden anfällig gegen: %s",
	supreme_bar = "Stärke des Ossirian",
	expose = "Schwäche",

	["cyclone_trigger"] = "Enveloping Winds",
	["stomp_trigger"] = "War Stomp",

	["WarStomp"] = "War Stomp",
	["Cyclone"] = "Cyclone",

	["Shadow"] = "Schatten",
	["Fire"] = "Feuer",
	["Frost"] = "Frost",
	["Nature"] = "Natur",
	["Arcane"] = "Arkan",

	["ShadowIcon"] = "Spell_Shadow_ChillTouch",
	["FireIcon"] = "Spell_Fire_Fire",
	["FrostIcon"] = "Spell_Frost_ChillingBlast",
	["NatureIcon"] = "Spell_Nature_Acid_01",
	["ArcaneIcon"] = "Spell_Arcane_PortalOrgrimmar",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20006 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"supreme", "debuff", "bosskill"}

-- locals
local timer = {
	weakness = 45,
	supreme = 45,
	firstCyclone = 20,
	cyclone = 15,
	earliestWarstomp = 25,
	latestWarstomp = 35,
}
local icon = {
	supreme = "Spell_Shadow_CurseOfTounges",
	warstomp = "Ability_BullRush",
	cyclone = "Spell_Nature_Cyclone",
}
local syncName = {
	weakness = "OssirianWeakness"..module.revision,
	crystal = "OssirianCrystal"..module.revision,
	supreme = "OssirianSupreme"..module.revision,
	warstomp = "OssirianWarstomp"..module.revision,
	cyclone = "OssirianCyclone"..module.revision,
}

local currentWeakness = nil
local timeLastWeaken = nil


------------------------------
--      Initialization      --
------------------------------

--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Debuff")

	self:ThrottleSync(3, syncName.weakness)
	self:ThrottleSync(3, syncName.crystal)
	self:ThrottleSync(3, syncName.supreme)
	self:ThrottleSync(3, syncName.cyclone)
	self:ThrottleSync(3, syncName.warstomp)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	timeLastWeaken = GetTime()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

-- called after boss is engaged
function module:OnEngage()
	self:Bar(L["Cyclone"], timer.firstCyclone, icon.cyclone)
	self:Bar(L["WarStomp"], timer.earliestWarstomp, icon.warstomp)
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	-- if the same weakness triggers back to back, the normal combat log entry is missing for the weakness
	-- this event is triggered 2s later
	if string.find(msg, L["crystaltrigger"]) then
		self:Sync(syncName.crystal)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE( msg )
	local _, _, debuffName = string.find(msg, L["debufftrigger"])
	if debuffName and debuffName ~= L["expose"] and L:HasReverseTranslation(debuffName) then
		self:Sync(syncName.weakness .. " " .. L:GetReverseTranslation(debuffName))
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS( msg )
	if string.find(msg, L["supremetrigger"]) then
		self:Sync(syncName.supreme)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.weakness and rest then
		self:Weakness(rest)
	elseif sync == syncName.crystal then
		self:Crystal()
	elseif sync == syncName.supreme then
		self:Supreme()
	elseif sync == syncName.cyclone then
		self:Cyclone()
	elseif sync == syncName.warstomp then
		self:IntervalBar(L["WarStomp"], timer.earliestWarstomp, timer.latestWarstomp, icon.warstomp)
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Cyclone()
	self:CancelScheduledEvent("bw_ossirian_cyclone")
	self:Bar(L["Cyclone"], timer.cyclone, icon.cyclone)
	self:ScheduleEvent("bw_ossirian_cyclone", self.Cyclone, timer.cyclone, self)
end

function module:Weakness(weakness, delay)
	if not weakness then
		return
	end
	if not delay then
		delay = 0
	end

	timeLastWeaken = GetTime()
	currentWeakness = weakness

	if self.db.profile.debuff then
		self:Message(string.format(L["debuffwarn"], L[tostring(weakness)]), "Important")
		self:Bar(L[weakness], timer.weakness - delay, L[weakness .. "Icon"])
	end

	self:RemoveBar(L["supreme_bar"])
	self:CancelDelayedMessage(string.format(L["supremedelaywarn"], 15))
	self:CancelDelayedMessage(string.format(L["supremedelaywarn"], 10))
	self:CancelDelayedMessage(string.format(L["supremedelaywarn"], 5))

	if self.db.profile.supreme then
		self:DelayedMessage(timer.supreme - delay, string.format(L["supremedelaywarn"], 15), "Attention", nil, nil, true)
		self:DelayedMessage(timer.supreme - delay, string.format(L["supremedelaywarn"], 10), "Urgent", nil, nil, true)
		self:DelayedMessage(timer.supreme - delay, string.format(L["supremedelaywarn"], 5), "Important", nil, nil, true)
		self:Bar(L["supreme_bar"], timer.supreme - delay, icon.supreme)
	end
end

function module:Crystal()
	if timeLastWeaken + 3 < GetTime() then -- crystal trigger occurs 2s after weaken trigger
		self:Weakness(currentWeakness, 2)
	end
end

function module:Supreme()
	if self.db.profile.supreme then
		self:Message(L["supremewarn"], "Attention", nil, "Beware")
	end
end

function module:Debuff(msg)
	if string.find(msg, L["cyclone_trigger"])then
		self:Sync(syncName.cyclone)
	end
	if string.find(msg, L["stomp_trigger"])then
		self:Sync(syncName.warstomp)
	end
end
