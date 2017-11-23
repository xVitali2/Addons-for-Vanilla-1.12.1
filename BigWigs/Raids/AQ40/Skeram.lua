
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("The Prophet Skeram", "Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	mcplayer = "You are afflicted by True Fulfillment.",
	mcplayerother = "(.*) is afflicted by True Fulfillment.",
	mcplayeryouend = "True Fulfillment fades from you.",
	mcplayerotherend = "True Fulfillment fades from (.*).",
	mcplayer_message = "You are mindcontrolled!",
	mcplayerother_message = "%s is mindcontrolled!",
	mindcontrol_bar = "MC: %s",
	deathyou_trigger = "You die.",
	deathother_trigger = "(.*) dies.",
	splitsoon_message = "Split soon! Get ready!",
	split_message = "Split!",
	kill_trigger = "You only delay",

	cmd = "Skeram",

	mc_cmd = "mc",
	mc_name = "Mind Control Alert",
	mc_desc = "Warn for Mind Control",

	split_cmd = "split",
	split_name = "Split Alert",
	split_desc = "Warn before Splitting",
	["You have slain %s!"] = true,
} end )

L:RegisterTranslations("esES", function() return {
	mcplayer = "Sufres de Consecución veraz.",
	mcplayerother = "(.*) sufre de Consecución veraz.",
	mcplayeryouend = "Consecución veraz desaparece de ti.",
	mcplayerotherend = "Consecución veraz desaparece de (.*).",
	mcplayer_message = "¡Estás controlado por mente!",
	mcplayerother_message = "¡%s está controlado por mente!",
	mindcontrol_bar = "CM: %s",
	deathyou_trigger = "Mueres.",
	deathother_trigger = "(.*) muere.",
	splitsoon_message = "¡Separar pronto! Préparate!",
	split_message = "¡Separar!",
	kill_trigger = "You only delay",

	--cmd = "Skeram",

	--mc_cmd = "mc",
	mc_name = "Alerta de Subyugar mente",
	mc_desc = "Avisa para Subyugar mente",

	--split_cmd = "split",
	split_name = "Alerta de Separar",
	split_desc = "Avisa antes de Separar",
	["You have slain %s!"] = "¡Has acabado con %s!",
} end )

L:RegisterTranslations("deDE", function() return {
	mcplayer = "Ihr seid von Wahre Erf\195\188llung betroffen.",
	mcplayerother = "(.*) ist von Wahre Erf\195\188llung betroffen.",
	mcplayeryouend = "Wahre Erf\195\188llung\' schwindet von Euch.",
	mcplayerotherend = "Wahre Erf\195\188llung schwindet von (.*).",
	mcplayer_message = "Ihr seid von Wahre Erf\195\188llung betroffen.",
	mcplayerother_message = "%s steht unter Gedankenkontrolle!",
	mindcontrol_bar = "GK: %s",
	deathyou_trigger = "Du stirbst.",
	deathother_trigger = "(.*) stirbt.",
	splitsoon_message = "Abbilder bald! Sei bereit!",
	split_message = "Abbilder!",
	kill_trigger = "You only delay", -- translation missing

	cmd = "Skeram",

	mc_cmd = "mc",
	mc_name = "Gedankenkontrolle",
	mc_desc = "Warnen, wenn jemand \195\188bernommen ist",

	split_cmd = "split",
	split_name = "Abbilder",
	split_desc = "Alarm vor der Aufteilung",
	["You have slain %s!"] = "Ihr habt %s getötet!",
} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"mc", --[["split",]] "bosskill"}

-- locals
local timer = {
	mc = 20,
}
local icon = {
	mc = "Spell_Shadow_Charm",
}
local syncName = {
	mc = "SkeramMC"..module.revision,
	mcOver = "SkeramMCEnd"..module.revision,
}

local splittime = false


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	--self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH", "Event")
	--self:RegisterEvent("UNIT_HEALTH")

	--[[self:TriggerEvent("BigWigs_ThrottleSync", "SkeramSplit80Soon", 100)
	self:TriggerEvent("BigWigs_ThrottleSync", "SkeramSplit75Now", 100)
	self:TriggerEvent("BigWigs_ThrottleSync", "SkeramSplit55Soon", 100)
	self:TriggerEvent("BigWigs_ThrottleSync", "SkeramSplit50Now", 100)
	self:TriggerEvent("BigWigs_ThrottleSync", "SkeramSplit30Soon", 100)
	self:TriggerEvent("BigWigs_ThrottleSync", "SkeramSplit25Now", 100)]]

	self:ThrottleSync(1, syncName.mc)
	self:ThrottleSync(1, syncName.mcOver)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	splittime = false
end

-- called after boss is engaged
function module:OnEngage()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end



------------------------------
--      Event Handlers      --
------------------------------

-- override
function module:CheckForBossDeath(msg)
	if msg == string.format(UNITDIESOTHER, self:ToString())
		or msg == string.format(L["You have slain %s!"], self.translatedName) then
		-- check that it wasn't only a copy
		local function IsBossInCombat()
			local t = module.enabletrigger
			if not t then return false end
			if type(t) == "string" then t = {t} end

			if UnitExists("target") and UnitAffectingCombat("target") then
				local target = UnitName("target")
				for _, mob in pairs(t) do
					if target == mob then
						return true
					end
				end
			end

			local num = GetNumRaidMembers()
			for i = 1, num do
				local raidUnit = string.format("raid%starget", i)
				if UnitExists(raidUnit) and UnitAffectingCombat(raidUnit) then
					local target = UnitName(raidUnit)
					for _, mob in pairs(t) do
						if target == mob then
							return true
						end
					end
				end
			end
			return false
		end

		if not IsBossInCombat() then
			self:SendBossDeathSync()
		end
	end
end

function module:Event(msg)
	local _,_, mindcontrolother, mctype = string.find(msg, L["mcplayerother"])
	local _,_, mindcontrolotherend, mctype = string.find(msg, L["mcplayerotherend"])
	local _,_, mindcontrolotherdeath,mctype = string.find(msg, L["deathother_trigger"])
	if string.find(msg, L["mcplayer"]) then
		self:Sync(syncName.mc .. " " .. UnitName("player"))
	elseif string.find(msg, L["mcplayeryouend"]) then
		self:Sync(syncName.mcOver .. " " .. UnitName("player"))
	elseif string.find(msg, L["deathyou_trigger"]) then
		self:Sync(syncName.mcOver .. " " .. UnitName("player"))
	elseif mindcontrolother then
		self:Sync(syncName.mc .. " " .. mindcontrolother)
	elseif mindcontrolotherend then
		self:Sync(syncName.mcOver .. " " .. mindcontrolotherend)
	elseif mindcontrolotherdeath then
		self:Sync(syncName.mcOver .. " " .. mindcontrolotherdeath)
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["kill_trigger"]) then
		BigWigs:Debug("yell kill trigger")
		--if self.db.profile.bosskill then
		--	self:Message(string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], self:ToString()), "Bosskill", nil, "Victory")
		--end
		--self:TriggerEvent("BigWigs_RemoveRaidIcon")
		--self.core:ToggleModuleActive(self, false)
		--self:SendBossDeathSync()
	end
end

--[[function module:UNIT_HEALTH(arg1)
if UnitName(arg1) == boss then
local health = UnitHealth(arg1)
local maxhealth = UnitHealthMax(arg1)
if (health > 424782 and health <= 453100) and maxhealth == 566375 and not splittime then
self:Sync("SkeramSplit80Soon")
elseif (health > 283188 and health <= 311507) and maxhealth == 566375 and not splittime then
self:Sync("SkeramSplit55Soon")
elseif (health > 141594 and health <= 169913) and maxhealth == 566375 and not splittime then
self:Sync("SkeramSplit30Soon")
elseif (health > 311508 and health <= 424781) and maxhealth == 566375 and splittime then
self:Sync("SkeramSplit75Now")
elseif (health > 169914 and health <= 283187) and maxhealth == 566375 and splittime then
self:Sync("SkeramSplit50Now")
elseif (health > 1 and health <= 141593) and maxhealth == 566375 and splittime then
self:Sync("SkeramSplit25Now")
end
end
end]]

------------------------------
--      Sync Handlers	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	--[[if sync == "SkeramSplit80Soon" then
	splittime = true
	if self.db.profile.split then
	self:Message(L["splitsoon_message"], "Urgent")
	end
	elseif sync == "SkeramSplit55Soon" then
	splittime = true
	if self.db.profile.split then
	self:Message(L["splitsoon_message"], "Urgent")
	end
	elseif sync == "SkeramSplit30Soon" then
	splittime = true
	if self.db.profile.split then
	self:Message(L["splitsoon_message"], "Urgent")
	end
	elseif sync == "SkeramSplit75Now" then
	splittime = false
	if self.db.profile.split then
	self:Message(L["split_message"], "Important", "Alarm")
	end
	elseif sync == "SkeramSplit50Now" then
	splittime = false
	if self.db.profile.split then
	self:Message(L["split_message"], "Important", "Alarm")
	end
	elseif sync == "SkeramSplit25Now" then
	splittime = false
	if self.db.profile.split then
	self:Message(L["split_message"], "Important", "Alarm")
	end
	else]]if sync == syncName.mc then
		if self.db.profile.mc then
			if rest == UnitName("player") then
				self:Bar(string.format(L["mindcontrol_bar"], UnitName("player")), timer.mc, icon.mc, true, "White")
				self:Message(L["mcplayer_message"], "Attention")
			else
				self:Bar(string.format(L["mindcontrol_bar"], rest), timer.mc, icon.mc, true, "White")
				self:Message(string.format(L["mcplayerother_message"], rest), "Urgent")
			end
		end
	elseif sync == syncName.mcOver then
		if self.db.profile.mc then
			self:RemoveBar(string.format(L["mindcontrol_bar"], rest))
		end
	end
end
