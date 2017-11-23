
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("The Bug Family", "Ahn'Qiraj")

local kri = AceLibrary("Babble-Boss-2.2")["Lord Kri"]
local yauj = AceLibrary("Babble-Boss-2.2")["Princess Yauj"]
local vem = AceLibrary("Babble-Boss-2.2")["Vem"]

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "BugFamily",

	healtrigger = "Princess Yauj begins to cast Great Heal\.",
	healbar = "Great Heal",
	healwarn = "Casting heal!",
	attack_trigger1 = "Princess Yauj attacks",
	attack_trigger2 = "Princess Yauj misses",
	attack_trigger3 = "Princess Yauj hits",
	attack_trigger4 = "Princess Yauj crits",
	panic_bar = "Panic",
	first_panic_bar = "Possible Panic",
	panic_message = "Fear in 3 Seconds!",
	toxicvolleyhit_trigger = "Toxic Volley hits",
	toxicvolleyafflicted_trigger = "afflicted by Toxic Volley\.",
	toxicvolleyresist_trigger = "Toxic Volley was resisted",
	toxicvolleyimmune_trigger = "Toxic Volley fail(.+) immune",
	toxicvolley_bar = "Toxic Volley",
	toxicvolley_message = "Toxic Volley in 3 Seconds!",

	panic_trigger = "afflicted by Panic%.",
	panicresist_trigger = "Panic was resisted",
	panicimmune_trigger = "Panic fail(.+) immune",

	toxicvaporsyou_trigger = "You are afflicted by Toxic Vapors\.",
	toxicvaporsother_trigger = "(.+) is afflicted by Toxic Vapors\.",

	toxicvaporsyou_trigger2 = "You suffer (%d+) (.+) from Lord Kri's Toxic Vapors.",
	toxicvaporsother_trigger2 = "(.+) suffers (%d+) (.+) from Lord Kri's Toxic Vapors.",

	toxicvapors_message = "Move away from the Poison Cloud!",
	enrage_bar = "Enrage",
	warn5minutes = "Enrage in 5 minutes!",
	warn3minutes = "Enrage in 3 minutes!",
	warn90seconds = "Enrage in 90 seconds!",
	warn60seconds = "Enrage in 60 seconds!",
	warn30seconds = "Enrage in 30 seconds!",
	warn10seconds = "Enrage in 10 seconds!",
	kridead_message = "Lord Kri is dead! Poison Cloud spawned!",
	yaujdead_message = "Princess Yauj is dead! Kill the spawns!",
	vemdead_message = "Vem is dead!",
	vemdeadcontkri_message = "Vem is dead! Lord Kri is enraged!",
	vemdeadcontyauj_message = "Vem is dead! Princess Yauj is enraged!",
	vemdeadcontboth_message = "Vem is dead! Lord Kri & Princess Yauj are enraged!",
	enrage_trigger = "%s goes into a berserker rage!",
	enrage_warning = "Enraged!",

	panic_cmd = "panic",
	panic_name = "Fear",
	panic_desc = "Warn for Princess Yauj's Panic.",

	toxicvolley_cmd = "toxicvolley",
	toxicvolley_name = "Toxic Volley",
	toxicvolley_desc = "Warn for Lord Kri's Toxic Volley.",

	heal_cmd = "heal",
	heal_name = "Great Heal",
	heal_desc = "Announce Princess Yauj's heals.",

	announce_cmd = "announce",
	announce_name = "Poison Cloud",
	announce_desc = "Whispers players that stand in the Poison Cloud.\n\n(Requires assistant or higher)",

	deathspecials_cmd = "deathspecials",
	deathspecials_name = "Death Specials",
	deathspecials_desc = "Lets people know which boss has been killed and what special abilities they do.",

	enrage_cmd = "enrage",
	enrage_name = "Enrage",
	enrage_desc = "Enrage timers.",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "BugFamily",

	healtrigger = "Princesa Yauj comienza a lanzar Gran sanación\.",
	healbar = "Gran sanación",
	healwarn = "¡Se lanza sanación!",
	attack_trigger1 = "Princesa Yauj ataca",
	attack_trigger2 = "Princess Yauj falla",
	attack_trigger3 = "Princess Yauj golpea",
	attack_trigger4 = "Princess Yauj golpe crítico",
	panic_bar = "Pánico",
	first_panic_bar = "Pánico Posible",
	panic_message = "¡Miedo en 3 Segundos!",
	toxicvolleyhit_trigger = "Salva tóxica golpea",
	toxicvolleyafflicted_trigger = "sufre de Salva tóxica\.",
	toxicvolleyresist_trigger = "Resistido Salva tóxica",
	toxicvolleyimmune_trigger = "Salva tóxica falla(.+) inmune",
	toxicvolley_bar = "Salva tóxica",
	toxicvolley_message = "¡Salva tóxica en 3 segundos!",

	panic_trigger = "sufre de Pánico%.",
	panicresist_trigger = "Resistido Pánico",
	panicimmune_trigger = "Pánico falla(.+) inmune",

	toxicvaporsyou_trigger = "Sufres de Vapores tóxicos\.",
	toxicvaporsother_trigger = "(.+) sufre de Vapores tóxicos\.",

	toxicvaporsyou_trigger2 = "Sufres (%d+) de daño (.+) de los Vapores tóxicos de Lord Kri.",
	toxicvaporsother_trigger2 = "(.+) sufre (%d+) de daño (.+) de los Vapores tóxicos de Lord Kri.",

	toxicvapors_message = "¡Muévate del Nube de veneno!",
	enrage_bar = "Enfurecer",
	warn5minutes = "¡Enfurecer en 5 minutos!",
	warn3minutes = "¡Enfurecer en 3 minutos!",
	warn90seconds = "¡Enfurecer en 90 segundos!",
	warn60seconds = "¡Enfurecer en 60 segundos!",
	warn30seconds = "¡Enfurecer en 30 segundos!!",
	warn10seconds = "¡Enfurecer en 10 segundos!",
	kridead_message = "¡Lord Kri está muerto! Aparece el Nube de veneno!",
	yaujdead_message = "¡Princesa Yauj está muerta! Matan los spawns!",
	vemdead_message = "¡Vem está muerto!",
	vemdeadcontkri_message = "¡Vem está muerto! Lord Kri está enfurecido!",
	vemdeadcontyauj_message = "¡Vem está muerto! Princesa Yauj está enfurecida!",
	vemdeadcontboth_message = "¡Vem está muerto! Lord Kri y Princesa Yauj están enfurecidos!",
	enrage_trigger = "¡%s se enfurece!",
	enrage_warning = "¡Efurecido!",

	--panic_cmd = "panic",
	panic_name = "Miedo",
	panic_desc = "Avisa para Pánico de Princesa Yauj.",

	--toxicvolley_cmd = "toxicvolley",
	toxicvolley_name = "Salva tóxica",
	toxicvolley_desc = "Avisa para Salva tóxica de Lord Kri.",

	--heal_cmd = "heal",
	heal_name = "Gran sanación",
	heal_desc = "Anuncia la sanación de Princesa Yauj.",

	--announce_cmd = "announce",
	announce_name = "Nube de veneno",
	announce_desc = "Susurra a los jugadores que están en el Nube de veneno.\n\n(Require asistente o líder)",

	--deathspecials_cmd = "deathspecials",
	deathspecials_name = "Especiales del Muerte",
	deathspecials_desc = "Avisa cual jefe está muerto y sus habilidades.",

	--enrage_cmd = "enrage",
	enrage_name = "Enfurecer",
	enrage_desc = "Temporizador para Enfurecer.",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "BugFamily",

	healtrigger = "Prinzessin Yauj beginnt Großes Heilen zu wirken.",
	healbar = "Gro\195\159e Heilung",
	healwarn = "Wirkt Heilung!",
	attack_trigger1 = "Prinzessin Yauj greift an",
	attack_trigger2 = "Prinzessin Yauj verfehlt",
	attack_trigger3 = "Prinzessin Yauj trifft",
	attack_trigger4 = "Prinzessin Yauj trifft (.+) kritisch",
	panic_bar = "Furcht",
	first_panic_bar = "Mögliche Furcht (+/- 3s)",
	panic_message = "Furcht in 3 Sekunden!",
	toxicvolleyhit_trigger = "Toxische Salve trifft",
	toxicvolleyafflicted_trigger = "von Toxische Salve betroffen",
	toxicvolleyresist_trigger = "Toxische Salve(.+) widerstanden",
	toxicvolleyimmune_trigger = "Toxische Salve(.+) Ein Fehlschlag(.+) immun",
	toxicvolley_bar = "Toxische Salve",
	toxicvolley_message = "Toxische Salve in 3 Sekunden!",
	panic_trigger = "von Furcht betroffen",
	panicresist_trigger = "Furcht(.+) widerstanden",
	panicimmune_trigger = "Furcht(.+) immun",
	toxicvaporsyou_trigger = "Ihr seid von Toxische Dämpfe betroffen.",
	toxicvaporsother_trigger = "(.+) ist von Toxische Dämpfe betroffen.",
	toxicvapors_message = "Beweg dich aus der Giftwolke raus!",
	enrage_bar = "Raserei",
	warn5minutes = "Raserei in 5 Minuten!",
	warn3minutes = "Raserei in 3 Minuten!",
	warn90seconds = "Raserei in 90 Sekunden!",
	warn60seconds = "Raserei in 60 Sekunden!",
	warn30seconds = "Raserei in 30 Sekunden!",
	warn10seconds = "Raserei in 10 Sekunden!",
	kridead_message = "Lord Kri ist tot! Giftwolke hat sich gebildet!",
	yaujdead_message = "Prinzessin Yauj ist tot! T\195\182te die kleinen K\195\164fer!",
	vemdead_message = "Vem ist tot!",
	vemdeadcontkri_message = "Vem ist tot! Lord Kri verf\195\164llt in Raserei!",
	vemdeadcontyauj_message = "Vem ist tot! Prinzessin Yauj verf\195\164llt in Raserei!",
	vemdeadcontboth_message = "Vem ist tot! Lord Kri & Prinzessin Yauj verfallen in Raserei!",
	enrage_trigger = "%s goes into a berserker rage!",
	enrage_warning = "Raserei!",

	panic_cmd = "panic",
	panic_name = "Furcht",
	panic_desc = "Warnung f\195\188r Prinzessin Yaujs Furcht.",

	toxicvolley_cmd = "toxicvolley",
	toxicvolley_name = "Toxische Salve",
	toxicvolley_desc = "Warnung f\195\188r Lord Kris Toxische Salve.",

	heal_cmd = "heal",
	heal_name = "Gro\195\159e Heilung",
	heal_desc = "Verk\195\188ndet Prinzessin Yaujs Heilungen.",

	announce_cmd = "announce",
	announce_name = "Giftwolke",
	announce_desc = "Fl\195\188stert Spielern, dass sie in der Giftwolke stehen.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",

	deathspecials_cmd = "deathspecials",
	deathspecials_name = "Spezielle Todeseffekte",
	deathspecials_desc = "Informiert Spieler, welcher Boss bereits get\195\182tet wurde und welche Spezialf\195\164higkeiten sie haben.",

	enrage_cmd = "enrage",
	enrage_name = "Raserei",
	enrage_desc = "Zeit, bis der Boss in Raserei verf\195\164llt.",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20007 -- To be overridden by the module!
module.enabletrigger = {kri, yauj, vem} -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"panic", "toxicvolley", "heal", "announce", "deathspecials", "enrage", "bosskill"}


-- locals
local timer = {
	earliestFirstPanic = 10,
	latestFirstPanic = 20,
	panic = 20,
	earliestFirstVolley = 8,
	latestFirstVolley = 10,
	earliestVolley = 8,
	latestVolley = 14,
	enrage = 900,
	heal = 2,
}
-- first panic seems to be random (15-20s)
local icon = {
	panic = "Spell_Shadow_DeathScream",
	volley = "Spell_Nature_Corrosivebreath",
	enrage = "Spell_Shadow_UnholyFrenzy",
	heal = "Spell_Holy_Heal",
}
local syncName = {
	volley = "BugTrioKriVolley"..module.revision,
	heal = "BugTrioYaujHealStart"..module.revision,
	healStop = "BugTrioYaujHealStop"..module.revision,
	panic = "BugTrioYaujPanic"..module.revision,
	enrage = "BugTrioEnraged"..module.revision,
	kriDead = "BugTrioKriDead"..module.revision,
	yaujDead = "BugTrioYaujDead"..module.revision,
	vemDead = "BugTrioVemDead"..module.revision,
	allDead = "BugTrioAllDead"..module.revision,
}

local kridead = nil
local vemdead = nil
local yaujdead = nil
local healtime = 0
local castingheal = false

--[[
16:56 pull
17:11 fear 15
]]

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Spells")

	self:ThrottleSync(5, syncName.volley)
	self:ThrottleSync(5, syncName.heal)
	self:ThrottleSync(5, syncName.healStop)
	self:ThrottleSync(5, syncName.panic)
	self:ThrottleSync(5, syncName.enrage)
	self:ThrottleSync(5, syncName.kriDead)
	self:ThrottleSync(5, syncName.yaujDead)
	self:ThrottleSync(5, syncName.vemDead)
	self:ThrottleSync(5, syncName.allDead)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	kridead = nil
	vemdead = nil
	yaujdead = nil
	healtime = 0
	castingheal = false

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.panic then
		self:IntervalBar(L["first_panic_bar"], timer.earliestFirstPanic, timer.latestFirstPanic, icon.panic, true, "white")
		--self:DelayedMessage(timer.firstPanic - 3, L["panic_message"], "Urgent", true, "Alarm")
	end
	if self.db.profile.toxicvolley then
		self:IntervalBar(L["toxicvolley_bar"], timer.earliestFirstVolley, timer.latestFirstVolley, icon.volley, true, "green")
		self:DelayedMessage(timer.earliestFirstVolley - 3, L["toxicvolley_message"], "Urgent")
	end
	if self.db.profile.enrage then
		self:Bar(L["enrage_bar"], timer.enrage, icon.enrage, true, "red")
		self:DelayedMessage(timer.enrage - 5 * 60, L["warn5minutes"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 3 * 60, L["warn3minutes"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 90, L["warn90seconds"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 60, L["warn60seconds"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 30, L["warn30seconds"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 10, L["warn10seconds"], "Attention", nil, nil, true)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_MONSTER_EMOTE(msg)
	if msg == L["enrage_trigger"] then
		self:Sync(syncName.enrage)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if msg == string.format(UNITDIESOTHER, kri) then
		self:Sync(syncName.kriDead)
	elseif msg == string.format(UNITDIESOTHER, yauj) then
		self:Sync(syncName.yaujDead)
	elseif msg == string.format(UNITDIESOTHER, vem) then
		self:Sync(syncName.vemDead)
	end
end

function module:Melee(msg)
	if string.find(msg, L["attack_trigger1"]) or string.find(msg, L["attack_trigger2"]) or string.find(msg, L["attack_trigger3"]) or string.find(msg, L["attack_trigger4"]) then
		if castingheal then
			if (GetTime() - healtime) < timer.heal then
				self:Sync(syncName.healStop)
			elseif (GetTime() - healtime) >= timer.heal then
				castingheal = false
			end
		end
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if msg == L["healtrigger"] then
		self:Sync(syncName.heal)
	end
end

function module:Spells(msg)
	local _,_,toxicvaporsother,_ = string.find(msg, L["toxicvaporsother_trigger"])
	local _,_,toxicvaporsother2,_ = string.find(msg, L["toxicvaporsother_trigger2"])
	if string.find(msg, L["panic_trigger"]) or string.find(msg, L["panicresist_trigger"]) or string.find(msg, L["panicimmune_trigger"]) then
		self:Sync(syncName.panic)
	elseif string.find(msg, L["toxicvolleyhit_trigger"]) or string.find(msg, L["toxicvolleyafflicted_trigger"]) or string.find(msg, L["toxicvolleyresist_trigger"]) or string.find(msg, L["toxicvolleyimmune_trigger"]) then
		self:Sync(syncName.volley)
	elseif ( msg == L["toxicvaporsyou_trigger"] or string.find(msg, L["toxicvaporsyou_trigger2"]) ) and self.db.profile.announce then
		self:Message(L["toxicvapors_message"], "Attention", "Alarm")
	elseif toxicvaporsother and self.db.profile.announce then
		self:TriggerEvent("BigWigs_SendTell", toxicvaporsother, L["toxicvapors_message"])
	elseif toxicvaporsother2 and self.db.profile.announce then
		self:TriggerEvent("BigWigs_SendTell", toxicvaporsother2, L["toxicvapors_message"])
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.volley then
		self:Volley()
	elseif sync == syncName.heal then
		self:Heal()
	elseif sync == syncName.healStop then
		self:HealStop()
	elseif sync == syncName.panic then
		self:Panic()
	elseif sync == syncName.enrage then
		self:Enrage()
	elseif sync == syncName.kriDead then
		self:KriDead()
	elseif sync == syncName.yaujDead then
		self:YaujDead()
	elseif sync == syncName.vemDead then
		self:VemDead()
	elseif sync == syncName.allDead then
		self:SendBossDeathSync()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Volley()
	if self.db.profile.toxicvolley then
		self:IntervalBar(L["toxicvolley_bar"], timer.earliestVolley, timer.latestVolley, icon.volley, true, "green")
		--self:DelayedMessage(timer.firstVolley - 3, L["toxicvolley_message"], "Urgent")
	end
end

function module:Heal()
	healtime = GetTime()
	castingheal = true
	if self.db.profile.heal then
		self:Bar(L["healbar"], timer.heal, icon.heal, true, "yellow")
		self:Message(L["healwarn"], "Attention", true, "Alert")
	end
end

function module:HealStop()
	castingheal = false
	if self.db.profile.heal then
		self:RemoveBar(L["healbar"])
	end
end

function module:Panic()
	if self.db.profile.panic then
		self:RemoveBar(L["first_panic_bar"])
		self:Bar(L["panic_bar"], timer.panic, icon.panic, true, "white")
		self:Message(L["panic_message"], "Urgent", true, "Alarm")
	end
end

function module:Enrage()
	if self.db.profile.enrage then
		self:Message(L["enrage_warning"], "Important")
	end
end

function module:KriDead()
	kridead = true
	if self.db.profile.toxicvolley then
		self:RemoveBar(L["toxicvolley_bar"])
		self:CancelDelayedMessage(L["toxicvolley_message"])
	end
	if self.db.profile.deathspecials then
		self:Message(L["kridead_message"], "Positive")
	end
	if vemdead and yaujdead then
		self:Sync(syncName.allDead)
	end
end

function module:YaujDead()
	yaujdead = true
	if self.db.profile.heal then
		self:RemoveBar(L["healbar"])
	end
	if self.db.profile.panic then
		self:RemoveBar(L["panic_bar"])
		self:CancelDelayedMessage(L["panic_message"])
	end
	if self.db.profile.deathspecials then
		self:Message(L["yaujdead_message"], "Positive")
	end
	if vemdead and kridead then
		self:Sync(syncName.allDead)
	end
end

function module:VemDead()
	vemdead = true
	if yaujdead and kridead then
		if self.db.profile.deathspecials then
			self:Message(L["vemdead_message"], "Positive")
		end
		self:Sync(syncName.allDead)
	elseif yaujdead then
		if self.db.profile.deathspecials then
			self:Message(L["vemdeadcontkri_message"], "Positive")
		end
	elseif kridead then
		if self.db.profile.deathspecials then
			self:Message(L["vemdeadcontyauj_message"], "Positive")
		end
	elseif not kridead and not yaujdead then
		if self.db.profile.deathspecials then
			self:Message(L["vemdeadcontboth_message"], "Positive")
		end
	end
end
