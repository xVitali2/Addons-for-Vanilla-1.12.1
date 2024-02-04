
local module, L = BigWigs:ModuleDeclaration("Sanctum Wyrmkin", "Emerald Sanctum")

module.revision = 30020
module.enabletrigger = module.translatedName
module.toggleoptions = {"wyrmkinsvenom"}
module.trashMod = true

L:RegisterTranslations("enUS", function() return {
	cmd = "SanctumWyrmkin",

	wyrmkinsvenom_cmd = "wyrmkinsvenom",
	wyrmkinsvenom_name = "Wyrmkins Venom Alert",
	wyrmkinsvenom_desc = "Warn for Wyrmkins Venom",

	trigger_wyrmkinsVenomYou = "You are afflicted by Wyrmkins Venom.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_wyrmkinsVenomFade = "Wyrmkins Venom fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY
	trigger_wyrmkinsVenomOther = "(.+) is afflicted by Wyrmkins Venom.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
	
	bar_wyrmkinsVenom = " Venom",
	
	["You have slain %s!"] = true,
	
} end )

module.defaultDB = {
	bosskill = nil,
}

local timer = {
	wyrmkinsVenom = 30,--tbd
}
local icon = {
	wyrmkinsVenom = "Ability_Creature_Poison_03",
}
local color = {
	wyrmkinsVenom = "Green",
}
local syncName = {
	wyrmkinsVenomOn = "SanctumWyrmkinWyrmkinsVenomOn"..module.revision,
	wyrmkinsVenomOff = "SanctumWyrmkinWyrmkinsVenomOff"..module.revision,
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_wyrmkinsVenomYou
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--trigger_wyrmkinsVenomFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--trigger_wyrmkinsVenomFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--trigger_wyrmkinsVenomFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_wyrmkinsVenomOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_wyrmkinsVenomOther
	
	self:ThrottleSync(0, syncName.wyrmkinsVenomOn)
	self:ThrottleSync(0, syncName.wyrmkinsVenomOff)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:CheckForBossDeath(msg)
	if msg == string.format(UNITDIESOTHER, self:ToString())
		or msg == string.format(L["You have slain %s!"], self.translatedName) then
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
	if msg == L["trigger_wyrmkinsVenomYou"] then
		self:Sync(syncName.wyrmkinsVenomOn .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_wyrmkinsVenomFade"]) then
		local _,_, wyrmkinsVenomOffTarget, _ = string.find(msg, L["trigger_wyrmkinsVenomFade"])
		if wyrmkinsVenomOffTarget == "you" then wyrmkinsVenomOffTarget = UnitName("Player") end
		self:Sync(syncName.wyrmkinsVenomOff .. " " .. wyrmkinsVenomOffTarget)
	
	elseif string.find(msg, L["trigger_wyrmkinsVenomOther"]) then
		local _,_, wyrmkinsVenomOnTarget, _ = string.find(msg, L["trigger_wyrmkinsVenomOther"])
		self:Sync(syncName.wyrmkinsVenomOn .. " " .. wyrmkinsVenomOnTarget)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.wyrmkinsVenomOn and rest and self.db.profile.wyrmkinsvenom then
		self:WyrmkinsVenomOn(rest)
	elseif sync == syncName.wyrmkinsVenomOff and rest and self.db.profile.wyrmkinsvenom then
		self:WyrmkinsVenomOff(rest)
	end
end


function module:WyrmkinsVenomOn(rest)
	self:Bar(rest..L["bar_wyrmkinsVenom"], timer.wyrmkinsVenom, icon.wyrmkinsVenom, true, color.wyrmkinsVenom)
end

function module:WyrmkinsVenomOff(rest)
	self:RemoveBar(rest..L["bar_wyrmkinsVenom"])
end
