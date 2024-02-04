
local module, L = BigWigs:ModuleDeclaration("Dark Rider Champion", "Karazhan")

module.revision = 30025
module.enabletrigger = module.translatedName
module.toggleoptions = {"reaverstorm"}
module.trashMod = true

L:RegisterTranslations("enUS", function() return {
	cmd = "darkriderchampion",

	reaverstorm_cmd = "reaverstorm",
	reaverstorm_name = "Reaver Storm Alert",
	reaverstorm_desc = "Warn for Reaver Storm",


	trigger_reaverstorm = "Dark Rider Champion begins to perform Reaver Storm.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	bar_reaverstormCd = "Reaver Storm CD",
	bar_reaverstormCast = "Reaver Storm Cast",

	["You have slain %s!"] = true,
} end )

module.defaultDB = {
	bosskill = nil,
}

local timer = {
	reaverstormCd = 5.5,
	reaverstormCast = 1.5,
}
local icon = {
	reaverstorm = "Ability_Whirlwind",
}
local color = {
	reaverstormCd = "White",
	reaverstormCast = "Red",
}
local syncName = {
	reaverstorm = "DarkRiderChampionReaverstorm"..module.revision,
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--trigger_reaverstorm
	
	self:ThrottleSync(5, syncName.reaverstorm)
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
	if msg == L["trigger_reaverstorm"] then
		self:Sync(syncName.reaverstorm)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.reaverstorm and self.db.profile.reaverstorm then
		self:Reaverstorm()
	end
end


function module:Reaverstorm()
	self:RemoveBar(L["bar_reaverstormCd"])
	self:Bar(L["bar_reaverstormCast"], timer.reaverstormCast, icon.reaverstorm, true, color.reaverstormCast)
	self:DelayedBar(timer.reaverstormCast, L["bar_reaverstormCd"], timer.reaverstormCd, icon.reaverstorm, true, color.reaverstormCd)
end
