
local module, L = BigWigs:ModuleDeclaration("Sanctum Wyrm", "Emerald Sanctum")

module.revision = 30020
module.enabletrigger = module.translatedName
module.toggleoptions = {"volley"}
module.trashMod = true

L:RegisterTranslations("enUS", function() return {
	cmd = "SanctumWyrm",

	volley_cmd = "volley",
	volley_name = "Poison Volley Alert",
	volley_desc = "Warn for Poison Volley",

	trigger_volley = "Sanctum Wyrm's Poison Bolt Volley",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
	bar_volley = "Poison Bolt Volley",
	
	trigger_volleyYou = "Sanctum Wyrm's Poison Bolt Volley hits you",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
	msg_volley = "Get max range to avoid Poison Volley!",
	
	["You have slain %s!"] = true,
	
} end )

module.defaultDB = {
	bosskill = nil,
}

local timer = {
	volley = 15,
}
local icon = {
	volley = "Spell_Nature_CorrosiveBreath",
}
local color = {
	volley = "Black",
}
local syncName = {
	volley = "SanctumWyrmVolley"..module.revision,
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")--trigger_volley, trigger_volleyYou
	
	self:ThrottleSync(1, syncName.volley)
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
	if string.find(msg, L["trigger_volley"]) then
		self:Sync(syncName.volley)
	end
	
	if string.find(msg, L["trigger_volleyYou"]) then
		if UnitClass("Player") == "Mage" then
			self:Message(L["msg_volley"], "Urgent", false, nil, false)
			self:Sound("Info")
		elseif UnitClass("Player") == "Warlock" then
			self:Message(L["msg_volley"], "Urgent", false, nil, false)
			self:Sound("Info")
		elseif UnitClass("Player") == "Priest" then
			self:Message(L["msg_volley"], "Urgent", false, nil, false)
			self:Sound("Info")
		end
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.volley and self.db.profile.volley then
		self:Volley()
	end
end


function module:Volley()
	self:RemoveBar(L["bar_volley"])
	self:Bar(L["bar_volley"], timer.volley, icon.volley, true, color.volley)
	
	if UnitClass("Player") == "Shaman" then
		self:WarningSign(icon.volley, 0.7)
	end
end
