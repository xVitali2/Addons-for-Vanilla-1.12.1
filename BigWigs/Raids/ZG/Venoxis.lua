
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("High Priest Venoxis", "Zul'Gurub")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	add_name                        = "Razzashi Cobra",
	renew_trigger                   = "High Priest Venoxis gains Renew\.",
	renewend_trigger                = "Renew fades from High Priest Venoxis\.",
	enrage_trigger                  = "High Priest Venoxis gains Enrage\.",
	holyfire_trigger                = "High Priest Venoxis begins to cast Holy Fire\.",
	phase2_trigger                  = "Let the coils of hate unfurl!",
	attack_trigger1                 = "High Priest Venoxis attacks",
	attack_trigger2                 = "High Priest Venoxis misses",
	attack_trigger3                 = "High Priest Venoxis hits",
	attack_trigger4                 = "High Priest Venoxis crits",
	poisoncloud_trigger             = "Poison Cloud",
	poisoncloudhitsyou_trigger      = "You suffer (.+) Nature damage from High Priest Venoxis 's Poison Cloud.",
	poisoncloudhitsother_trigger    = "(.+) suffers (.+) Nature damage from High Priest Venoxis 's Poison Cloud.",
	poisoncloud_on_you              = "You are afflicted by Poison Cloud.",
	poisoncloudabsorbyou_trigger    = "You absorb High Priest Venoxis 's Poison Cloud\.",
	poisoncloudabsorb_trigger       = "High Priest Venoxis 's Poison Cloud is absorbed by (.+)\.",
	poisoncloudresistyou_trigger    = "High Priest Venoxis 's Poison Cloud was resisted\.",
	poisoncloudresist_trigger       = "High Priest Venoxis 's Poison Cloud was resisted by (.+)\.",
	poisoncloudimmuneyou_trigger    = "High Priest Venoxis 's Poison Cloud failed. You are immune\.",
	poisoncloudimmune_trigger       = "High Priest Venoxis 's Poison Cloud fails. (.+) is immune\.",
	deadaddtrigger                  = "Razzashi Cobra dies",
	deadbosstrigger                 = "High Priest Venoxis dies",

	holyfirebar         = "Holy Fire",
	renewbar            = "Renew",
	renew_message       = "Renew! Dispel it!",
	phase1_message      = "Troll Phase",
	phase2_message      = "Snake Phase",
	enrage_message      = "Boss is enraged! Spam heals!",
	poisonyou_message   = "Move away from poison cloud!",
	poison_message      = "Move away from poison cloud!",
	addmsg              = "%d/4 Razzashi Cobras dead!",
	you                 = "you",

	cmd                 = "Venoxis",

	adds_cmd            = "adds",
	adds_name           = "Dead adds counter",
	adds_desc           = "Announces dead Razzashi Cobras",

	renew_cmd           = "renew",
	renew_name          = "Renew Alert",
	renew_desc          = "Warn for Renew",

	holyfire_cmd        = "holyfire",
	holyfire_name       = "Holy Fire Alert",
	holyfire_desc       = "Warn for Holy Fire",

	phase_cmd           = "phase",
	phase_name          = "Phase Notification",
	phase_desc          = "Announces the boss' phase transition",

	announce_cmd        = "whispers",
	announce_name       = "Whisper to people in Poison Clouds",
	announce_desc       = "Sends a whisper to players that stand in poison\n\n(Requires assistant or higher)\n\n(Disclaimer: to avoid spamming whispers, it will only whisper people that actually take damage from the Poison Clouds)",

	enrage_cmd          = "enrage",
	enrage_name         = "Enrage Alert",
	enrage_desc         = "Warn for Enrage",
} end )

L:RegisterTranslations("ruRU", function() return { --by CFM
	add_name                        = "Кобра Раззаши",
	renew_trigger                   = "Верховный жрец Веноксис получает эффект \"Обновление\"\.",
	renewend_trigger                = "Действие эффекта \"Обновление\", наложенного на Верховный жрец Веноксис, заканчивается\.",
	enrage_trigger                  = "Верховный жрец Веноксис получает эффект \"Бешенство\"\.",
	holyfire_trigger                = "Верховный жрец Веноксис начинает использовать \"Кольцо света\"\.",
	phase2_trigger                  = "Let the coils of hate unfurl!", --Да развернутся кольца ненависти! --не русифицированы на light's hope
	attack_trigger1                 = "атаку Верховный жрец Веноксис", --в русском нереально правильно ловить атаки таким образом... стр 375 дополнительные проверки
	attack_trigger2                 = "Верховный жрец Веноксис не попадает по",
	attack_trigger3                 = "Верховный жрец Веноксис наносит",
	attack_trigger4                 = "атаке Верховный жрец Веноксис",
	poisoncloud_trigger             = "Ядовитое облако",
	poisoncloudhitsyou_trigger      = "Вы получаете (.+) ед. урона (Природа) от заклинания \"Ядовитое облако\" Верховный жрец Веноксис.",
	poisoncloudhitsother_trigger    = "(.+) получает (.+) ед. урона (Природа) от заклинания \"Ядовитое облако\" Верховный жрец Веноксис.",
	poisoncloud_on_you              = "Вы находитесь под воздействием эффекта \"Ядовитое облако\".",
	poisoncloudabsorbyou_trigger    = "Вы поглощаете заклинание \"Ядовитое облако\" Верховный жрец Веноксис\.",
	poisoncloudabsorb_trigger       = "(.+) поглощает заклинание \"Ядовитое облако\" Верховный жрец Веноксис",
	poisoncloudresistyou_trigger    = "Вы сопротивляетесь заклинанию \"Ядовитое облако\" Верховный жрец Веноксис\.",
	poisoncloudresist_trigger       = "(.+) сопротивляется заклинанию \"Ядовитое облако\" Верховный жрец Веноксис\.",
	poisoncloudimmuneyou_trigger    = "Вы обладаете невосприимчивостью к заклинанию \"Ядовитое облако\" Верховный жрец Веноксис\.",
	poisoncloudimmune_trigger       = "(.+) обладает невосприимчивостью к заклинанию \"Ядовитое облако\" Верховный жрец Веноксис\.",
	deadaddtrigger                  = "Кобра Раззаши погибает.",
	deadbosstrigger                 = "Верховный жрец Веноксис погибает.",

	holyfirebar         = "Священный огонь",
	renewbar            = "Обновление",
	renew_message       = "Обновление! Развей его!",
	phase1_message      = "Тролль фаза",
	phase2_message      = "Фаза змеи",
	enrage_message      = "Босс в бешенстве! Постоянно лечи!",
	poisonyou_message   = "Выйди из Ядовитого облака!",
	poison_message      = "Выйди из Ядовитого облака!",
	addmsg              = "%d/4 Кобры Раззаши мертвы!",
	you                 = "вы",

	adds_name           = "Счетчик мертвых змей",
	adds_desc           = "Объявление о мертвых Кобрах Раззаши",

	renew_name          = "Оповещение об Обновлении",
	renew_desc          = "Предупреждает об Обновлении",

	holyfire_name       = "Оповещение о Священном огне",
	holyfire_desc       = "Предупреждает о Священном огне",

	phase_name          = "Уведомление о фазах",
	phase_desc          = "Объявляет о смене фаз босса",

	announce_name       = "Шёпот игроку в Ядовитом облаке",
	announce_desc       = "Шёпот игрокам которые стоят в облаке яда\n\n(Требуется помощник или лидер)",

	enrage_name         = "Объявление о Бешенстве",
	enrage_desc         = "Предупреждает о Бешенстве босса",
} end )

L:RegisterTranslations("esES", function() return {
	add_name                        = "Cobra Razzashi",
	renew_trigger                   = "Sumo sacerdote Venoxis gana Renovar\.",
	renewend_trigger                = "Renovar desaparece de Sumo sacerdote Venoxis\.",
	enrage_trigger                  = "Sumo sacerdote Venoxis gana Enfurecer\.",
	holyfire_trigger                = "Sumo sacerdote Venoxis comienza a lanzar Fuego Sagrado\.",
	phase2_trigger                  = "Let the coils of hate unfurl!",
	attack_trigger1                 = "Sumo sacerdote Venoxis ataca",
	attack_trigger2                 = "Sumo sacerdote Venoxis falla",
	attack_trigger3                 = "Sumo sacerdote Venoxis golpea",
	attack_trigger4                 = "Sumo sacerdote Venoxis golpe crítico",
	poisoncloud_trigger             = "Nube de veneno",
	poisoncloudhitsyou_trigger      = "Sufres (.+) de daño de la Naturaleza del Nube de veneno de Sumo sacerdote Venoxis.",
	poisoncloudhitsother_trigger    = "(.+) sufre (.+) de daño de la Naturaleza del Nube de veneno de Sumo sacerdote Venoxis.",
	poisoncloud_on_you              = "Sufres de Nube de veneno.",
	poisoncloudabsorbyou_trigger    = "Absorbes Nube de veneno de Sumo sacerdote Venoxis\.",
	poisoncloudabsorb_trigger       = "Nube de veneno de Sumo sacerdote Venoxis está absorbido por (.+)\.",
	poisoncloudresistyou_trigger    = "Resistido Nube de veneno de Sumo sacerdote Venoxis\.",
	poisoncloudresist_trigger       = "Nube de veneno de Sumo sacerdote Venoxis fue resistido por (.+)\.",
	poisoncloudimmuneyou_trigger    = "Nube de veneno de Sumo sacerdote Venoxis ha fallado. Eres inmune\.",
	poisoncloudimmune_trigger       = "Nube de veneno de Sumo sacerdote Venoxis ha fallado. (.+) es inmune\.",
	deadaddtrigger                  = "Cobra Razzashi muere",
	deadbosstrigger                 = "Sumo sacerdote Venoxis muere",

	holyfirebar         = "Fuego Sagrado",
	renewbar            = "Renovar",
	renew_message       = "¡Renovar! Disípala!",
	phase1_message      = "Fase de Trol",
	phase2_message      = "Fase de Serpiente",
	enrage_message      = "¡El jefe está enfurecido! Cúranse!",
	poisonyou_message   = "¡Muévate del Nube de veneno!",
	poison_message      = "¡Muévanse del Nube de veneno!",
	addmsg              = "¡%d/4 Cobras Razzashi muertas!",
	you                 = "tu",

	cmd                 = "Venoxis",

	--adds_cmd            = "adds",
	adds_name           = "Contador de adds muertos",
	adds_desc           = "Anuncia Cobras Razzashi muertas",

	--renew_cmd           = "renew",
	renew_name          = "Alerta de Renovar",
	renew_desc          = "Avisa para Renovar",

	--holyfire_cmd        = "holyfire",
	holyfire_name       = "Alerta de Fuego Sagrado",
	holyfire_desc       = "Avisa para Fuego Sagrado",

	--phase_cmd           = "phase",
	phase_name          = "Alerta de Fase",
	phase_desc          = "Anuncia los cambios de fase del jefe",

	--announce_cmd        = "whispers",
	announce_name       = "Susurrar a los jugadores en el Nube de veneno",
	announce_desc       = "Susurra a los jugadores que están en el Nube de veneno\n\n(Require asistente o líder)\n\n(descargo de responsabilidad: para evitar spam, solamente susurrará a los jugadores que sufren daño del Nube de veneno)",

	--enrage_cmd          = "enrage",
	enrage_name         = "Alerta de Enfurecer",
	enrage_desc         = "Avisa para Enfurecer",
} end )

L:RegisterTranslations("deDE", function() return {
	add_name = "Razzashi Cobra",
	renew_trigger = "High Priest Venoxis bekommt 'Erneuerung",
	renewend_trigger = "Erneuerung schwindet von High Priest Venoxis\.",
	enrage_trigger = "High Priest Venoxis bekommt \'Wutanfall",
	holyfire_trigger = "High Priest Venoxis beginnt Heiliges Feuer zu wirken\.",
	phase2_trigger = "Let the coils of hate unfurl!",
	attack_trigger1 = "High Priest Venoxis greift an",
	attack_trigger2 = "High Priest Venoxis verfehlt",
	attack_trigger3 = "High Priest Venoxis trifft",
	attack_trigger4 = "High Priest Venoxis trifft (.+) kritisch",
	poisoncloud_trigger = "Giftwolke",
	poisoncloudhitsyou_trigger = "Ihr erleidet (.+) Naturschaden von High Priest Venoxis (durch Giftwolke)\.",
	poisoncloudhitsother_trigger = "(.+) erleidet (.+) Naturschaden von High Priest Venoxis (durch Giftwolke)\.",
	poisoncloud_on_you              = "You are afflicted by Poison Cloud.",
	poisoncloudabsorbyou_trigger = "Ihr absorbiert High Priest Venoxiss Giftwolke\.",
	poisoncloudabsorb_trigger = "Giftwolke von High Priest Venoxis wird absorbiert von\: (.+)\.",
	poisoncloudresistyou_trigger = "High Priest Venoxis versucht es mit Giftwolke\.\.\. widerstanden\.",
	poisoncloudresist_trigger = "High Priest Venoxiss Giftwolke wurde von (.+) widerstanden\.",
	poisoncloudimmuneyou_trigger = "High Priest Venoxis versucht es mit Giftwolke\.\.\. ein Fehlschlag. Ihr seid immun\.",
	poisoncloudimmune_trigger = "High Priest Venoxis versucht es mit Giftwolke. Ein Fehlschlag, denn (.+) ist immun\.",
	deadaddtrigger = "Razzashi Cobra stirbt",
	deadbosstrigger = "High Priest Venoxis stirbt",

	holyfirebar = "Heiliges Feuer",
	renewbar = "Erneuerung",
	renew_message = "Erneuerung! Entferne magie!",
	phase1_message = "Troll-Phase",
	phase2_message = "Schlange-Phase",
	enrage_message = "Boss ist in Raserei! Spam Heilung!",
	poisonyou_message = "Beweg\' dich aus dem Giftwolke!",
	poison_message = "Move away from poison cloud!",
	addmsg = "%d/4 Razzashi Cobra tot!",
	you = "Ihr",

	cmd = "Venoxis",

	adds_cmd = "adds",
	adds_name = "Z\195\164hler f\195\188r tote Adds",
	adds_desc = "Verk\195\188ndet Razzashi Cobras Tod",

	renew_cmd = "renew",
	renew_name = "Alarm f\195\188r Erneuerung",
	renew_desc = "Warnung, wenn Venoxis Erneuerung auf sich wirkt",

	holyfire_cmd = "holyfire",
	holyfire_name = "Alarm f\195\188r Heiliges Feuer",
	holyfire_desc = "Warnen, wenn Heiliges Feuer gewirkt wird",

	phase_cmd = "phase",
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses",

	announce_cmd = "whispers",
	announce_name = "Brennenden Personen fl\195\188stern",
	announce_desc = "Fl\195\188ster der Person, die im Giftwolken steht\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)\n\n(Dementi: um \195\188berfl\195\188ssiges Fl\195\188stern zu vermeiden, wird es nur den Personen fl\195\188stern, die tats\195\164chlichen Schaden von den Giftwolken bekommen.)",

	enrage_cmd = "enrage",
	enrage_name = "Verk\195\188ndet Boss' Raserei",
	enrage_desc = "L\195\164sst dich wissen, wenn Boss h\195\164rter zuschl\195\164gt",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"phase", "adds", "renew", "holyfire", "enrage", "announce", "bosskill"}


-- locals
local timer = {
	holyfireCast = 3.5,
	holyfire = 8,
	renew = 20,
}
local icon = {
	addDead = "INV_WAEPON_BOW_ZULGRUB_D_01",
	cloud = "Ability_Creature_Disease_02",
	renew = "Spell_Holy_Renew",
	holyfire = "Spell_Holy_SearingLight",
}
local syncName = {
	phase2 = "VenoxisPhaseTwo"..module.revision,
	renew = "VenoxisRenewStart"..module.revision,
	renewOver = "VenoxisRenewStop"..module.revision,
	holyfire = "VenoxisHolyFireStart"..module.revision,
	holyfireOver = "VenoxisHolyFireStop"..module.revision,
	enrage = "VenoxisEnrage"..module.revision,
	addDead = "VenoxisAddDead"..module.revision,
}

local berserkannounced = nil


------------------------------
--      Initialization      --
------------------------------

--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")

	self:ThrottleSync(10, syncName.phase2)
	self:ThrottleSync(2, syncName.renew)
	self:ThrottleSync(2, syncName.renewOver)
	self:ThrottleSync(2, syncName.holyfire)
	self:ThrottleSync(2, syncName.holyfireOver)
	self:ThrottleSync(5, syncName.enrage)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	self.cobra = 0

	castingholyfire = 0
	holyfiretime = 0

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.phase then
		self:Message(L["phase1_message"], "Attention")
	end
	--self:TriggerEvent("BigWigs_StartCounterBar", self, "Snakes dead", 4, icon.addDead)
	--self:TriggerEvent("BigWigs_SetCounterBar", self, "Snakes dead", (4 - 0.1))
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Events              --
------------------------------

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if string.find(msg, L["deadaddtrigger"]) then
		self:Sync(syncName.addDead .. " " .. tostring(self.cobra + 1))
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if string.find(msg, L["renew_trigger"]) then
		self:Sync(syncName.renew)
	elseif string.find(msg, L["enrage_trigger"]) then
		self:Sync(syncName.enrage)
	end
end

function module:Event(msg)
	local _,_,poisoncloudhitsother,_ = string.find(msg, L["poisoncloudhitsother_trigger"])
	local _,_,poisoncloudabsorb,_ = string.find(msg, L["poisoncloudabsorb_trigger"])
	local _,_,poisoncloudresist,_ = string.find(msg, L["poisoncloudresist_trigger"])
	local _,_,poisoncloudimmune,_ = string.find(msg, L["poisoncloudimmune_trigger"])
	if string.find(msg, L["holyfire_trigger"]) then
		self:Sync(syncName.holyfire)
	elseif string.find(msg, L["attack_trigger1"]) or string.find(msg, L["attack_trigger2"]) or string.find(msg, L["attack_trigger3"]) or string.find(msg, L["attack_trigger4"])
	or string.find(msg, "Верховный жрец Веноксис атакует") or string.find(msg, "Атака Верховный жрец Веноксис") or string.find(msg, "атаки Верховный жрец Веноксис") then
		if castingholyfire == 1 then
			if (GetTime() - holyfiretime) < timer.holyfireCast then
				self:Sync("VenoxisHolyFireStop")
			elseif (GetTime() - holyfiretime) >= timer.holyfireCast then
				castingholyfire = 0
			end
		end
	elseif msg == L["poisoncloud_on_you"] then
		self:WarningSign(icon.cloud, 5)
		self:Message(L["poisonyou_message"], "Attention", "Alarm")
	elseif string.find(msg, L["poisoncloud_trigger"]) then
		if self.db.profile.announce then
			if string.find(msg, L["poisoncloudhitsyou_trigger"]) or msg == L["poisoncloudresistyou_trigger"] or msg == L["poisoncloudabsorbyou_trigger"] or msg == L["poisoncloudimmuneyou_trigger"] then
				self:Message(L["poisonyou_message"], "Attention", "Alarm")
			elseif poisoncloudhitsother and poisoncloudhitsother~=L["you"] then
				self:TriggerEvent("BigWigs_SendTell", poisoncloudhitsother, L["poison_message"])
			elseif poisoncloudresist then
				self:TriggerEvent("BigWigs_SendTell", poisoncloudresist, L["poison_message"])
			elseif poisoncloudabsorb then
				self:TriggerEvent("BigWigs_SendTell", poisoncloudabsorb, L["poison_message"])
			elseif poisoncloudimmune then
				self:TriggerEvent("BigWigs_SendTell", poisoncloudimmune, L["poison_message"])
			end
		end
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["phase2_trigger"]) then
		self:Sync(syncName.phase2)
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_OTHER(msg)
	if string.find(msg, L["renewend_trigger"]) then
		self:Sync(syncName.renewOver)
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if string.find(msg, L["poisoncloud_trigger"]) then
		self:RemoveWarningSign(icon.cloud)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.phase2 then
		self:KTM_Reset()
		if self.db.profile.phase then
			self:Message(L["phase2_message"], "Attention")
		end
		if self.db.profile.holyfire then
			self:RemoveBar(L["holyfirebar"])
		end
	elseif sync == syncName.renew then
		if self.db.profile.renew then
			self:Message(L["renew_message"], "Urgent")
			self:Bar(L["renewbar"], timer.renew, icon.renew)
		end
	elseif sync == syncName.renewOver then
		if self.db.profile.renew then
			self:RemoveBar(L["renewbar"])
		end
	elseif sync == syncName.holyfire then
		holyfiretime = GetTime()
		castingholyfire = 1
		if self.db.profile.holyfire then
			self:Bar(L["holyfirebar"], timer.holyfireCast, icon.holyfire, true, "red")
			self:Bar("Next Holy Fire", timer.holyfire, icon.holyfire)
		end
	elseif sync == "VenoxisHolyFireStop" then
		castingholyfire = 0
		if self.db.profile.holyfire then
			self:RemoveBar(L["holyfirebar"])
		end
	elseif sync == syncName.enrage then
		if self.db.profile.enrage then
			self:Message(L["enrage_message"], "Attention")
		end
	elseif sync == syncName.addDead and rest and rest ~= "" then
		rest = tonumber(rest)
		if rest <= 4 and self.cobra < rest then
			self.cobra = rest
			self:Message(string.format(L["addmsg"], self.cobra), "Positive")
			--self:TriggerEvent("BigWigs_SetCounterBar", self, "Snakes dead", (4 - self.cobra))
		end
	end
end
