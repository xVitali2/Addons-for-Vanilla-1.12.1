
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Anubisath Warder", "Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Warder",

	fear_cmd = "fear",
	fear_name = "Fear timer",
	fear_desc = "Shows fear cd",

	silence_cmd = "silence",
	silence_name = "Silence timer",
	silence_desc = "Shows Silence cd",

	roots_cmd = "roots",
	roots_name = "Roots timer",
	roots_desc = "Shows Roots cd",

	dust_cmd = "dust",
	dust_name = "Dust Cloud timer",
	dust_desc = "Shows Dust Cloud cd",

	warnings_cmd = "warnings",
	warnings_name = "Warning messages ",
	warnings_desc = "Warning messages showing which 2 abilities current mob has",

	fearTrigger = "Anubisath Warder begins to cast Fear.",
	fearBar = "Fear!",
	fearBar_next = "Possible Fear",

	silenceTrigger = "Anubisath Warder begins to cast Silence.",
	silenceBar = "Silence!",
	silenceBar_next = "Possible Silence",

	rootsTrigger = "Anubisath Warder begins to cast Entangling Roots.",
	rootsBar = "Roots!",
	rootsBar_next = "Possible Roots",

	dustTrigger = "Anubisath Warder begins to perform Dust Cloud.",
	dustBar = "Dust Cloud!",
	dustBar_next = "Possible Dust Cloud",

	dustWarn = "Dust Cloud",
	dustWarn2 = "(Roots or Fear)",

	fearWarn = "Fear",
	fearWarn2 = "(Silence or Dust Cloud)",

	rootsWarn = "Roots",
	rootsWarn2 = "(Silence or Dust Cloud)",

	silenceWarn = "Silence",
	silenceWarn2 = "(Roots or Fear)",

} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Warder",

	--fear_cmd = "fear",
	fear_name = "Temporizador de Miedo",
	fear_desc = "Muestra regeneración de Miedo",

	--silence_cmd = "silence",
	silence_name = "Temporizador de Silencio",
	silence_desc = "Muestra regeneración de Silencio",

	--roots_cmd = "roots",
	roots_name = "Temporizador de Enredaderas",
	roots_desc = "Muestra regeneración de Enredederas",

	--dust_cmd = "dust",
	dust_name = "Temporizador de Nube de polvo",
	dust_desc = "Muestra regeneración de Nube de polvo",

	--warnings_cmd = "warnings",
	warnings_name = "Mensajes de Alerta",
	warnings_desc = "Mensajes que muestra las habilidades que tiene el Depositorio",

	fearTrigger = "Depositorio Anubisath comienza a lanzar Miedo.",
	fearBar = "¡Miedo!",
	fearBar_next = "Miedo Posible",

	silenceTrigger = "Depositorio Anubisath comienza a lanzar Silencio.",
	silenceBar = "¡Silenencio!",
	silenceBar_next = "Silencio Posible",

	rootsTrigger = "Depositorio Anubisath comienza a lanzar Enredederas.",
	rootsBar = "¡Enredederas!",
	rootsBar_next = "Enredederas Posible",

	dustTrigger = "Depositorio Anubisath comienza a lanzar Nube de polvo.",
	dustBar = "¡Nube de polvo!",
	dustBar_next = "Nube de polvo Posible",

	dustWarn = "Nube de polvo",
	dustWarn2 = "(Enrederas o Miedo)",

	fearWarn = "Miedo",
	fearWarn2 = "(Silencio o Nube de polvo)",

	rootsWarn = "Enredederas",
	rootsWarn2 = "(Silencio o Nube de polvo)",

	silenceWarn = "Silencio",
	silenceWarn2 = "(Enredederas o Miedo)",

} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20001 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"fear", "silence", "roots", "dust", "warnings"--[[, "bosskill"]]}

-- locals
local timer = {
	fear = 20,
	fearCast = 1.5,
	silence = 15,
	silenceCast = 1.5,
	roots = 15,
	rootsCast = 1.5,
	dust = 15,
	dustCast = 1.5,
}
local icon = {
	fear = "Spell_Shadow_Possession",
	silence = "Spell_Holy_Silence",
	roots = "Spell_Nature_StrangleVines",
	dust = "Ability_Hibernation",
}
local syncName = {
	fear = "WarderFear"..module.revision,
	silence = "WarderSilence"..module.revision,
	roots = "WarderRoots"..module.revision,
	dust = "WarderDust"..module.revision,
}

local pull = nil
------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")

	if not warnings then
		warnings = {
			["dust"] = {L["dustWarn"], L["dustWarn2"]},
			["roots"] = {L["rootsWarn"], L["rootsWarn2"]},
			["fear"] = {L["fearWarn"], L["fearWarn2"]},
			["silence"] = {L["silenceWarn"], L["silenceWarn2"]},
		}
	end

	self:ThrottleSync(10, syncName.fear)
	self:ThrottleSync(10, syncName.silence)
	self:ThrottleSync(10, syncName.roots)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
end

-- called after boss is engaged
function module:OnEngage()
	self.ability1 = nil
	self.ability2 = nil
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:Event(msg)
	if string.find(msg, L["fearTrigger"]) then
		self:Sync(syncName.fear)
	elseif string.find(msg, L["silenceTrigger"]) then
		self:Sync(syncName.silence)
	elseif string.find(msg, L["rootsTrigger"]) then
		self:Sync(syncName.roots)
	elseif string.find(msg, L["dustTrigger"]) then
		self:Sync(syncName.dust)
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync( sync, rest, nick )
	if sync == syncName.fear then
		if self.db.profile.fear then
			self:RemoveBar(L["fearBar_next"])
			self:Bar(L["fearBar"], timer.fearCast, icon.fear)
			self:DelayedBar(timer.fearCast, L["fearBar_next"], timer.fear-timer.fearCast, icon.fear)
		end
		self:AbilityWarn("fear")
	elseif sync == syncName.silence then
		if self.db.profile.silence then
			self:RemoveBar(L["silenceBar_next"])
			self:Bar(L["silenceBar"], timer.silenceCast, icon.silence)
			self:DelayedBar(timer.silenceCast, L["silenceBar_next"], timer.silence-timer.silenceCast, icon.silence)
		end
		self:AbilityWarn("silence")
	elseif sync == syncName.roots then
		if self.db.profile.roots then
			self:RemoveBar(L["rootsBar_next"])
			self:Bar(L["rootsBar"], timer.rootsCast, icon.roots)
			self:DelayedBar(timer.rootsCast, L["rootsBar_next"], timer.roots-timer.rootsCast, icon.roots)
		end
		self:AbilityWarn("roots")
	elseif sync == syncName.dust then
		if self.db.profile.dust then
			self:RemoveBar(L["dustBar_next"])
			self:Bar(L["dustBar"], timer.dustCast, icon.dust)
			self:DelayedBar(timer.dustCast, L["dustBar_next"], timer.dust-timer.dustCast, icon.dust)
		end
		self:AbilityWarn("dust")
	end
end

function module:AbilityWarn( ability )
	if self.db.profile.warnings then
		if not self.ability1 then
			self.ability1 = ability
			self:Message(string.format("%s + %s",warnings[self.ability1][1], warnings[self.ability1][2]), "Core", nil, "Long")
		elseif not self.ability2 and ability ~= self.ability1 then
			self.ability2 = ability
			self:Message(string.format("%s + %s",warnings[self.ability1][1], warnings[self.ability2][1]), "Core", nil, "Long")
		end
	end
end
