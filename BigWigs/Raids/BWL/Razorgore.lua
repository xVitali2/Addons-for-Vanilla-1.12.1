
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Razorgore the Untamed", "Blackwing Lair")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Razorgore",

	start_trigger = "Intruders have breached",
	start_message = "Phase 1",
	mobs_soon = "First Wave in 5sec!",
	mobs_bar = "First Wave",
	orbcontrolother_trigger = "(.+) is afflicted by Mind Exhaustion\.",
	orbcontrolyou_trigger = "You are afflicted by Mind Exhaustion\.",
	mindcontrolother_trigger = "(.+) is afflicted by Dominate Mind\.",
	mindcontrolyou_trigger = "You are afflicted by Dominate Mind\.",
	mindcontrol_message = "%s is mindcontrolled!",
	mindcontrol_message_you = "You are mindcontrolled!",
	mindcontrol_bar = "MC: %s",
	mindcontrolyouend_trigger = "Dominate Mind fades from you\.",
	mindcontrolotherend_trigger = "Dominate Mind fades from (.+)\.",
	polymorphother_trigger = "(.+) is afflicted by Greater Polymorph\.",
	polymorphyou_trigger = "You are afflicted by Greater Polymorph\.",
	polymorph_message = "%s is polymorphed! Dispel!",
	polymorph_message_you = "You are polymorphed!",
	polymorph_bar = "Polymorph: %s",
	polymorphyouend_trigger = "Greater Polymorph fades from you\.",
	polymorphotherend_trigger = "Greater Polymorph fades from (.+)\.",
	deathyou_trigger = "You die\.",
	deathother_trigger = "(.+) dies\.",
	egg_trigger = "Razorgore the Untamed begins to cast Destroy Egg\.",
	egg_message = "%d/30 eggs destroyed!",
	egg_bar = "Destroy Egg",
	-- there is no clear phase2 trigger
	phase2_trigger = "I'm free! That device shall never torment me again!", --"You'll pay for forcing me to do this.",
	phase2_message = "Phase 2",
	volley_trigger = "Razorgore the Untamed begins to cast Fireball Volley\.",
	volley_bar = "Fireball Volley",
	volley_message = "Hide!",
	conflagration_trigger = "afflicted by Conflagration",
	conflagration_bar = "Conflagration",
	warstomp_bar = "War Stomp",
	orb_bar = "Orb control: %s",
	destroyegg_yell1 = "You'll pay for forcing me to do this!",
	destroyegg_yell2 = "Fools! These eggs are more precious than you know!",
	destroyegg_yell3 = "No! Not another one! I'll have your heads for this atrocity!",
	["Eggs destroyed"] = true,

	mc_cmd = "mindcontrol",
	mc_name = "Mind Control",
	mc_desc = "Announces who gets mind controlled and starts a clickable bar for easy selection.",

	eggs_cmd = "eggs",
	eggs_name = "Eggs",
	eggs_desc = "Does a counter for Black Dragon Eggs destroyed.",

	phase_cmd = "phase",
	phase_name = "Phase",
	phase_desc = "Warn for Phase Change.",

	mobs_cmd = "mobs",
	mobs_name = "First wave",
	mobs_desc = "Shows you when the first wave spawns.",

	orb_cmd = "orb",
	orb_name = "Orb Control",
	orb_desc = "Shows you who is controlling the boss and starts a clickable bar for easy selection.",

	fireballvolley_cmd = "fireballvolley",
	fireballvolley_name = "Fireball Volley",
	fireballvolley_desc = "Announces when the boss is casting Fireball Volley.",

	conflagration_cmd = "conflagration",
	conflagration_name = "Conflagration",
	conflagration_desc = "Starts a bar with the duration of the Conflagration.",

	polymorph_cmd = "polymorph",
	polymorph_name = "Greater Polymorph",
	polymorph_desc = "Tells you who got polymorphed by Grethok the Controller and starts a clickable bar for easy selection.",

	icon_cmd = "icon",
	icon_name = "Raid Icon on Mind Control",
	icon_desc = "Place a raid icon on the mind controlled player for the duration of the debuff.\n\n(Requires assistant or higher)",
} end)

L:RegisterTranslations("esES", function() return {
	--cmd = "Razorgore",

	start_trigger = "Intruders have breached",
	start_message = "Fase 1",
	mobs_soon = "¡Primera oleada en 5 segundos!",
	mobs_bar = "Primera oleada",
	orbcontrolother_trigger = "(.+) sufre de Extenuación mental\.",
	orbcontrolyou_trigger = "Sufres de Extenuación mental\.",
	mindcontrolother_trigger = "(.+) sufre de Subyugar mente\.",
	mindcontrolyou_trigger = "sufre de Subyugar mental\.",
	mindcontrol_message = "¡%s está controlado por mente!",
	mindcontrol_message_you = "¡Estás controlado por mente!",
	mindcontrol_bar = "CM: %s",
	mindcontrolyouend_trigger = "Subyugar mente acaba de disiparse\.",
	mindcontrolotherend_trigger = "Subyugar mente desaparece de (.+)\.",
	polymorphother_trigger = "(.+) sufre de Polimorfia superior\.",
	polymorphyou_trigger = "Sufres de Polimorfia superior\.",
	polymorph_message = "¡%s está en polimorfia! Disípala!",
	polymorph_message_you = "¡Estás en polimorfia!",
	polymorph_bar = "Polimorfia: %s",
	polymorphyouend_trigger = "Polimorfia superior acaba de disiparse\.",
	polymorphotherend_trigger = "Polimorfia superior desaparece de (.+)\.",
	deathyou_trigger = "Has muerto\.",
	deathother_trigger = "(.+) ha muerto\.",
	egg_trigger = "Sangrevaja el Indomable comienza a lanzar Destruir huevo\.",
	egg_message = "¡%d/30 huevos destruidos!",
	egg_bar = "Destruir huevo",
	-- there is no clear phase2 trigger
	phase2_trigger = "I'm free! That device shall never torment me again!", --"You'll pay for forcing me to do this.",
	phase2_message = "Fase 2",
	volley_trigger = "Sangrevaja el Indomable comienza a lanzar Lluvia de bolas de Fuego\.",
	volley_bar = "Lluvia de bolas de Fuego",
	volley_message = "¡Ocúltate!",
	conflagration_trigger = "sufre de Conflagración",
	conflagration_bar = "Conflagración",
	warstomp_bar = "Pisotón de guerra",
	orb_bar = "Control del Orbe: %s",
	destroyegg_yell1 = "You'll pay for forcing me to do this\.",
	destroyegg_yell2 = "Fools! These eggs are more precious than you know!",
	destroyegg_yell3 = "No - not another one! I'll have your heads for this atrocity!",
	["Eggs destroyed"] = "Huevos destruidos",

	--mc_cmd = "mindcontrol",
	mc_name = "Control mental",
	mc_desc = "Anuncia quién está controlado por mente y muestra una barra cliqueable para seleccionarlo fácilmente.",

	--eggs_cmd = "eggs",
	eggs_name = "Huevos",
	eggs_desc = "Contador para los Huevos de dragón Negro destruidos.",

	--phase_cmd = "phase",
	phase_name = "Fase",
	phase_desc = "Avisa para cambio de fase.",

	--mobs_cmd = "mobs",
	mobs_name = "Primera oleada",
	mobs_desc = "Muestra cuando llegue la primera oleada.",

	--orb_cmd = "orb",
	orb_name = "Control del Orbe",
	orb_desc = "Muestra quien está controlando el jefe y muestra una barra cliqueable para seleccionarlo fácilmente.",

	--fireballvolley_cmd = "fireballvolley",
	fireballvolley_name = "Lluvia de bolas de Fuego",
	fireballvolley_desc = "Anuncia cuando el jefe lance Lluvia de bolas de Fuego.",

	--conflagration_cmd = "conflagration",
	conflagration_name = "Conflagración",
	conflagration_desc = "Muestra una barra con la duración de Conflagración.",

	--polymorph_cmd = "polymorph",
	polymorph_name = "Polimorfia superior",
	polymorph_desc = "Muestra quién está en polimorfia por Grethok el Controlador y muestra una barra cliqueable para seleccionarlo fácilmente.",

	--icon_cmd = "icon",
	icon_name = "Marcar para Control mental",
	icon_desc = "Marca con un icono el jugador controlado por mente para la duración del debuff.\n\n(Require asistente o líder)",
} end)

L:RegisterTranslations("deDE", function() return {
	cmd = "Razorgore",

	start_trigger = "Intruders have breached",
	start_message = "Phase 1",
	mobs_soon = "Erste Welle in 5sec!",
	mobs_bar = "Erste Welle",
	orbcontrolother_trigger = "(.+) ist von Gedankenersch\195\182pfung betroffen\.",
	orbcontrolyou_trigger = "Ihr seid von Gedankenersch\195\182pfung betroffen\.",
	mindcontrolother_trigger = "(.+) ist von Gedanken beherrschen betroffen\.",
	mindcontrolyou_trigger = "Ihr seid von Gedanken beherrschen betroffen\.",
	mindcontrol_message = "%s ist ferngesteuert!",
	mindcontrol_message_you = "Du bist ferngesteuert!",
	mindcontrol_bar = "Gedankenkontrolle: %s",
	mindcontrolyouend_trigger = "'Gedanken beherrschen' schwindet von Euch\.",
	mindcontrolotherend_trigger = "Gedanken beherrschen schwindet von (.+)\.",
	polymorphother_trigger = "(.+) ist von Gro\195\159e Verwandlung betroffen\.",
	polymorphyou_trigger = "Ihr seid von Gro\195\159e Verwandlung betroffen\.",
	polymorph_message = "%s ist polymorphed! Entfernt es!",
	polymorph_message_you = "Du bist polymorphed!",
	polymorph_bar = "Polymorph: %s",
	polymorphyouend_trigger = "'Gro\195\159e Verwandlung' schwindet von Euch\.",
	polymorphotherend_trigger = "Gro\195\159e Verwandlung schwindet von (.+)\.",
	deathyou_trigger = "Du stirbst\.",
	deathother_trigger = "(.+) stirbt\.",
	egg_trigger = "Razorgore the Untamed beginnt Ei zerst\195\182ren zu wirken\.",
	egg_message = "%d/30 Eier zerst\195\182rt!",
	egg_bar = "Ei zerst\195\182ren",
	phase2_trigger = "I'm free! That device shall never torment me again!",
	phase2_message = "Phase 2",
	volley_trigger = "Razorgore the Untamed beginnt Feuerballsalve zu wirken\.",
	volley_bar = "Feuerballsalve",
	volley_message = "Verstecken!",
	conflagration_trigger = "von Gro\195\159brand betroffen",
	conflagration_bar = "Gro\195\159brand",
	warstomp_bar = "War Stomp",
	orb_bar = "Orb Kontrolle: %s",
	destroyegg_yell1 = "You'll pay for forcing me to do this\.",
	destroyegg_yell2 = "Fools! These eggs are more precious than you know!",
	destroyegg_yell3 = "No - not another one! I'll have your heads for this atrocity!",

	mc_cmd = "mindcontrol",
	mc_name = "Gedankenkontrolle",
	mc_desc = "Gibt bekannt, die unter Gedankenkontrolle bekommt und beginnt einen anklickbaren Balken f\195\188r einfache Auswahl.",

	eggs_cmd = "eggs",
	eggs_name = "Eier",
	eggs_desc = "Hat ein Z\195\164hler f\195\188r Schwarzes Dracheneier zerst\195\182rt.",

	phase_cmd = "phase",
	phase_name = "Phasen",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses.",

	mobs_cmd = "mobs",
	mobs_name = "Erste Welle",
	mobs_desc = "Zeigt Ihnen, wann die erste Welle spawnt.",

	orb_cmd = "orb",
	orb_name = "Orb Kontrolle",
	orb_desc = "Zeigt Ihnen, wer ist die Steuerung der Boss und beginnt einen anklickbaren Balken f\195\188r einfache Auswahl.",

	fireballvolley_cmd = "fireballvolley",
	fireballvolley_name = "Feuerballsalve",
	fireballvolley_desc = "Gibt bekannt, wenn der Boss wirft Feuerballsalve.",

	conflagration_cmd = "conflagration",
	conflagration_name = "Gro\195\159brand",
	conflagration_desc = "Startet eine Balken mit der Dauer der Gro\195\159brand.",

	polymorph_cmd = "polymorph",
	polymorph_name = "Gro\195\159e Verwandlung",
	polymorph_desc = "Sagt Ihnen, wer von Grethok den Controller polymorphed habe und startet einen anklickbaren Balken f\195\188r einfache Auswahl.",

	icon_cmd = "icon",
	icon_name = "Schlachtzugsymbol auf die Gedankenkontrolle Spieler",
	icon_desc = "Versetzt eine Schlachtzugsymbol auf der Gedankenkontrolle Spieler.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
} end)


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
local controller = AceLibrary("Babble-Boss-2.2")["Grethok the Controller"]
module.revision = 20006 -- To be overridden by the module!
module.enabletrigger = {module.translatedName, controller} -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"phase", "mobs", "eggs", "polymorph", "mc", "icon", "orb", "fireballvolley", "conflagration", "bosskill"}


-- locals
local timer = {
	mobspawn = 46,
	mc = 15,
	polymorph = 20,
	conflagrate = 14,
	firstConflagrate = 12,
	firstVolley = 6,
	firstWarStomp = 21,
	volley = 2,
	egg = 3,
	orb = 90,
}
local icon = {
	mobspawn = "Spell_Holy_PrayerOfHealing",
	egg = "INV_Misc_MonsterClaw_02",
	orb = "INV_Misc_Gem_Pearl_03",
	volley = "Spell_Fire_FlameBolt",
}
local syncName = {
	egg = "RazorgoreEgg"..module.revision,
	eggStart = "RazorgoreEggStart"..module.revision,
	orb = "RazorgoreOrbStart"..module.revision,
	orbOver = "RazorgoreOrbStop"..module.revision,
	volley = "RazorgoreVolleyCast"..module.revision,
	phase2 = "RazorgorePhaseTwo"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", "Events")
	--self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")

	self:ThrottleSync(5, syncName.egg)
	self:ThrottleSync(5, syncName.orb)
	self:ThrottleSync(5, syncName.orbOver)
	self:ThrottleSync(3, syncName.volley)
end


-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started        = nil
	self.phase          = 0
	self.previousorb    = nil
	self.eggs           = 0
	self.freetime		= 0
	self.orbOverTime 	= 0
end

-- called after boss is engaged
function module:OnEngage()
	self.orbOverTime = GetTime()
	self.freetime = 0
	if self.db.profile.phase then
		self:Message(L["start_message"], "Attention")
	end
	if self.db.profile.mobs then
		self:Bar(L["mobs_bar"], timer.mobspawn, icon.mobspawn)
		self:Message(timer.mobspawn - 5, L["mobs_soon"], "Important")
	end
	self:TriggerEvent("BigWigs_StartCounterBar", self, L["Eggs destroyed"], 30, "Interface\\Icons\\inv_egg_01")
	self:TriggerEvent("BigWigs_SetCounterBar", self, L["Eggs destroyed"], (30 - 0.1))
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L["phase2_trigger"] then
		self:Sync(syncName.phase2)
		--elseif msg == L["destroyegg_yell1"] or msg == L["destroyegg_yell2"] or msg == L["destroyegg_yell3"] then
		--	self:Sync(syncName.egg .. " " .. tostring(self.eggs + 1))
	end
end

function module:CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF(msg)
	if string.find(msg, L["egg_trigger"]) then
		self:Sync(syncName.eggStart)
	end
end

function module:CHAT_MSG_MONSTER_EMOTE(msg)
	if string.find(msg, "casts Destroy Egg") then
		-- as of now, this does also fire on finished 'Destroy Egg' cast.
		-- but only after a successful one and the range is shitty of this emote.
		self:Sync(syncName.egg .. " " .. tostring(self.eggs + 1))
	elseif string.find(msg, "Nefarian's troops flee as the power") then
		-- there is a really funny emote text bug on the current version on Nostalris, I'll only use this in case they fix it
		self:Sync(syncName.phase2)
	end
end

function module:Events(msg)
	local _, _, mcother = string.find(msg, L["mindcontrolother_trigger"])
	local _, _, mcotherend = string.find(msg, L["mindcontrolotherend_trigger"])
	local _, _, polyother = string.find(msg, L["polymorphother_trigger"])
	local _, _, polyotherend = string.find(msg, L["polymorphotherend_trigger"])
	local _, _, orbother = string.find(msg, L["orbcontrolother_trigger"])
	--local _, _, deathother = string.find(msg, L["deathother_trigger"])

	if self.db.profile.icon then
		if mcother then
			self:Icon(mcother)
		elseif msg == L["mindcontrolyou_trigger"] then
			self:Icon(UnitName("player"))
		elseif mcotherend or msg == L["mindcontrolyouend_trigger"] or deathother or msg == L["deathyou_trigger"] then
			self:RemoveIcon()
		end
	end

	if self.db.profile.mc then
		if msg == L["mindcontrolyou_trigger"] then
			self:Message(L["mindcontrol_message_you"], "Important")
			self:Bar(string.format(L["mindcontrol_bar"], UnitName("player")), timer.mc, "Spell_Shadow_ShadowWordDominate", true, "black")
			self:SetCandyBarOnClick("BigWigsBar "..string.format(L["mindcontrol_bar"], UnitName("player")), function(name, button, extra) TargetByName(extra, true) end, UnitName("player"))
		elseif mcother then
			self:Message(string.format(L["mindcontrol_message"], mcother), "Important")
			self:Bar(string.format(L["mindcontrol_bar"], mcother), timer.mc, "Spell_Shadow_ShadowWordDominate", true, "black")
			self:SetCandyBarOnClick("BigWigsBar "..string.format(L["mindcontrol_bar"], mcother), function(name, button, extra) TargetByName(extra, true) end, mcother)
		elseif string.find(msg, L["mindcontrolyouend_trigger"]) then
			self:RemoveBar(string.format(L["mindcontrol_bar"], UnitName("player")))
		elseif mcotherend then
			self:RemoveBar(string.format(L["mindcontrol_bar"], mcotherend))
		end
	end

	if self.db.profile.polymorph then
		if msg == L["polymorphyou_trigger"] then
			self:Message(L["polymorph_message_you"], "Important")
			self:Bar(string.format(L["polymorph_bar"], UnitName("player")), timer.polymorph, "Spell_Nature_Brilliance", true, "cyan")
			self:SetCandyBarOnClick("BigWigsBar "..string.format(L["polymorph_bar"], UnitName("player")), function(name, button, extra) TargetByName(extra, true) end, UnitName("player"))
		elseif polyother then
			self:Message(string.format(L["polymorph_message"], polyother), "Important")
			self:Bar(string.format(L["polymorph_bar"], polyother), timer.polymorph, "Spell_Nature_Brilliance", true, "cyan")
			self:SetCandyBarOnClick("BigWigsBar "..string.format(L["polymorph_bar"], polyother), function(name, button, extra) TargetByName(extra, true) end, polyother)
		elseif msg == L["polymorphyouend_trigger"] then
			self:RemoveBar(string.format(L["polymorph_bar"], UnitName("player")))
		elseif polyotherend then
			self:RemoveBar(string.format(L["polymorph_bar"], polyotherend))
		end
	end

	if self.db.profile.orb then
		if orbother then
			self:Sync(syncName.orb .." ".. orbother)
		elseif msg == L["orbcontrolyou_trigger"] then
			self:Sync(syncName.orb .." ".. UnitName("player"))
		end
	end

	if self.db.profile.conflagration and string.find(msg, L["conflagration_trigger"]) then
		self:Bar(L["conflagration_bar"], timer.conflagrate, "Spell_Fire_Incinerate", true, "red")
	end

	--[[if deathother then
	if self.db.profile.mc then
	self:RemoveBar(string.format(L["mindcontrol_bar"], deathother))
	end
	if self.db.profile.polymorph then
	self:RemoveBar(string.format(L["polymorph_bar"], deathother))
	end
	if self.db.profile.orb then
	self:RemoveBar(string.format(L["orb_bar"], deathother))
	end
	elseif msg == L["deathyou_trigger"] then
	if self.db.profile.mc then
	self:RemoveBar(string.format(L["mindcontrol_bar"], UnitName("player")))
	end
	if self.db.profile.polymorph then
	self:RemoveBar(string.format(L["polymorph_bar"], UnitName("player")))
	end
	if self.db.profile.orb then
	self:RemoveBar(string.format(L["orb_bar"], UnitName("player")))
	end
	end]]
end

function module:CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE(msg)
	if self.db.profile.fireballvolley and msg == L["volley_trigger"] then
		self:Bar(L["volley_bar"], timer.volley, icon.volley, true, "blue")
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["volley_trigger"] then
		self:Sync(syncName.volley)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.egg then
		rest = tonumber(rest)
		if rest == (self.eggs + 1) and self.eggs <= 30 then
			self.eggs = self.eggs + 1
			if self.db.profile.eggs then
				self:Message(string.format(L["egg_message"], self.eggs), "Positive")
			end
			self:TriggerEvent("BigWigs_SetCounterBar", self, L["Eggs destroyed"], (30 - self.eggs))
		elseif rest == (self.eggs + 1) and rest == 30 and self.phase ~= 2 then
			self:Sync(syncName.phase2)
		end
	elseif sync == syncName.eggStart then
		--self:CancelScheduledEvent("destroyegg_check")
		--self:ScheduleEvent("destroyegg_check", self.DestroyEggCheck, 3, self)
		if self.db.profile.eggs then
			self:Bar(L["egg_bar"], timer.egg, icon.egg, true, "purple")
		end
		--self:Sync(syncName.egg .. " " .. tostring(self.eggs + 1))
	elseif sync == syncName.orb then
		if self.orbOverTime then
			self.freetime = self.freetime + GetTime() - self.orbOverTime
			self.orbOverTime = 0
		end
		self:CancelScheduledEvent("destroyegg_check")
		self:CancelScheduledEvent("orbcontrol_check")
		if self.db.profile.orb then
			if self.previousorb ~= nil then
				self:RemoveBar(string.format(L["orb_bar"], self.previousorb))
			end
			self:Bar(string.format(L["orb_bar"], rest), timer.orb, icon.orb, true, "white")
			self:SetCandyBarOnClick("BigWigsBar "..string.format(L["orb_bar"], rest), function(name, button, extra) TargetByName(extra, true) end, rest)
		end
		self:ScheduleEvent("orbcontrol_check", self.OrbControlCheck, 0.5, self)
		self.previousorb = rest
	elseif sync == syncName.orbOver then
		self.orbOverTime = GetTime()
		self:CancelScheduledEvent("destroyegg_check")
		self:CancelScheduledEvent("orbcontrol_check")
		if self.db.profile.orb and self.previousorb then
			self:RemoveBar(string.format(L["orb_bar"], self.previousorb))
		end
		if self.db.profile.fireballvolley then
			self:RemoveBar(L["volley_bar"])
		end
		if self.db.profile.eggs then
			self:RemoveBar(L["egg_bar"])
		end
	elseif sync == syncName.volley and self.db.profile.fireballvolley then
		self:Bar(L["volley_bar"], timer.volley, icon.volley, true, "red")
		self:Message(L["volley_message"], "Urgent")
		self:WarningSign(icon.volley, 2)
	elseif sync == syncName.phase2 and self.phase < 2 then
		self.phase = 2
		self:CancelScheduledEvent("destroyegg_check")
		self:CancelScheduledEvent("orbcontrol_check")
		if self.previousorb ~= nil and self.db.profile.orb then
			self:RemoveBar(string.format(L["orb_bar"], self.previousorb))
		end
		if self.db.profile.eggs then
			self:RemoveBar(L["egg_bar"])
		end
		if self.db.profile.phase then
			self:Message(L["phase2_message"], "Attention")
		end
		self:TriggerEvent("BigWigs_StopCounterBar", self, L["Eggs destroyed"])
		self:Bar(L["conflagration_bar"], timer.firstConflagrate-self.freetime, "Spell_Fire_Incinerate", true, "red")
		self:Bar(L["volley_bar"], timer.firstVolley-self.freetime, icon.volley, true, "blue")
		self:Bar(L["warstomp_bar"], timer.firstWarStomp-self.freetime, "Ability_BullRush")

		self:KTM_SetTarget(self.translatedName)
		self:KTM_Reset()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:OrbControlCheck()
	local bosscontrol = false
	for i = 1, GetNumRaidMembers() do
		if UnitName("raidpet"..i) == self.translatedName then
			bosscontrol = true
			break
		end
	end
	if bosscontrol then
		self:ScheduleEvent("orbcontrol_check", self.OrbControlCheck, 0.5, self)
	elseif GetRealZoneText() == "Blackwing Lair" then
		self:Sync(syncName.orbOver)
	end
end

function module:DestroyEggCheck()
	local bosscontrol = false
	for i = 1, GetNumRaidMembers() do
		if UnitName("raidpet" .. i) == self.translatedName then
			bosscontrol = true
			break
		end
	end
	if bosscontrol then
	--self:TriggerEvent("BigWigs_SendSync", "RazorgoreEgg "..tostring(self.eggs + 1))
	end
end
