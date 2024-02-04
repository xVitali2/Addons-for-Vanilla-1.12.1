
local module, L = BigWigs:ModuleDeclaration("Sanctum Dragonkin", "Emerald Sanctum")

module.revision = 30021
module.enabletrigger = module.translatedName
module.toggleoptions = {"reflect"}
module.trashMod = true

L:RegisterTranslations("enUS", function() return {
	cmd = "SanctumDragonkin",

	reflect_cmd = "reflect",
	reflect_name = "Reflect Alert",
	reflect_desc = "Warn for Reflect",

	trigger_reflect = "Sanctum Dragonkin gains Reflection.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	trigger_reflectFade = "Reflection fades from Sanctum Dragonkin.",--CHAT_MSG_SPELL_AURA_GONE_OTHER
		
	bar_reflect = "Dragonkin Spell Reflect",
	msg_reflect = "Dragonkin Spell Reflect",
	
	["You have slain %s!"] = true,
	
} end )

module.defaultDB = {
	bosskill = nil,
}

local timer = {
	reflect = 5,
}
local icon = {
	reflect = "Spell_Arcane_Blink",
}
local color = {
	reflect = "Blue",
}
local syncName = {
	reflect = "SanctumDragonkinReflect"..module.revision,
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")--trigger_reflect
	
	self:ThrottleSync(1, syncName.reflect)
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
	if msg == L["trigger_reflect"] then
		self:Sync(syncName.reflect)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.reflect and self.db.profile.reflect then
		self:Reflect()
	end
end


function module:Reflect()
	self:Bar(L["bar_reflect"], timer.reflect, icon.reflect, true, color.reflect)
	
	if UnitName("Target") ~= nil then
		if UnitName("Target") == "Sanctum Dragonkin" then
			if UnitClass("Player") == "Mage" then
				self:WarningSign(icon.reflect,2)
			elseif UnitClass("Player") == "Warlock" then
				self:WarningSign(icon.reflect,2)
			end
			
			if (UnitClass("Player") ~= "Warrior") and (UnitClass("Player") ~= "Rogue") then
				self:Message(L["msg_reflect"], "Important", false, nil, false)
				self:Sound("Long")
			end
		end
	end
end
