
local module, L = BigWigs:ModuleDeclaration("Sanctum Supressor", "Emerald Sanctum")

module.revision = 30020
module.enabletrigger = module.translatedName
module.toggleoptions = {"emeraldsupression"}
module.trashMod = true

L:RegisterTranslations("enUS", function() return {
	cmd = "SanctumSupressor",

	emeraldsupression_cmd = "emeraldsupression",
	emeraldsupression_name = "Emerald Supression Alert",
	emeraldsupression_desc = "Warn for Emerald Supression",
	
	trigger_emeraldSupressionYou = "You are afflicted by Emerald Supression.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_emeraldSupressionOther = "(.+) is afflicted by Emerald Supression.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
	trigger_emeraldSupressionFade = "Emerald Supression fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY
	
	bar_emeraldSupression = " Supression",
	
	["You have slain %s!"] = true,
	
} end )

module.defaultDB = {
	bosskill = nil,
}

local timer = {
	emeraldSupression = 12,
}
local icon = {
	emeraldSupression = "Spell_Nature_MagicImmunity",
}
local color = {
	emeraldSupression = "Red",
}
local syncName = {
	emeraldSupressionOn = "SanctumSupressorSupressionOn"..module.revision,
	emeraldSupressionOff = "SanctumSupressorSupressionOff"..module.revision,
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_emeraldSupressionYou
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--trigger_emeraldSupressionFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--trigger_emeraldSupressionFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--trigger_emeraldSupressionFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_emeraldSupressionOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_emeraldSupressionOther
	
	self:ThrottleSync(0, syncName.emeraldSupressionOn)
	self:ThrottleSync(0, syncName.emeraldSupressionOff)
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
	if msg == L["trigger_emeraldSupressionYou"] then
		self:Sync(syncName.emeraldSupressionOn .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_emeraldSupressionFade"]) then
		local _,_, supressionOffTarget, _ = string.find(msg, L["trigger_emeraldSupressionFade"])
		if supressionOffTarget == "you" then supressionOffTarget = UnitName("Player") end
		self:Sync(syncName.emeraldSupressionOff .. " " .. supressionOffTarget)
	
	elseif string.find(msg, L["trigger_emeraldSupressionOther"]) then
		local _,_, supressionOnTarget, _ = string.find(msg, L["trigger_emeraldSupressionOther"])
		self:Sync(syncName.emeraldSupressionOn .. " " .. supressionOnTarget)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.emeraldSupressionOn and rest and self.db.profile.emeraldsupression then
		self:EmeraldSupressionOn(rest)
	elseif sync == syncName.emeraldSupressionOff and rest and self.db.profile.emeraldsupression then
		self:EmeraldSupressionOff(rest)
	end
end


function module:EmeraldSupressionOn(rest)
	self:Bar(rest..L["bar_emeraldSupression"], timer.emeraldSupression, icon.emeraldSupression, true, color.emeraldSupression)
end

function module:EmeraldSupressionOff(rest)
	self:RemoveBar(rest..L["bar_emeraldSupression"])
end
