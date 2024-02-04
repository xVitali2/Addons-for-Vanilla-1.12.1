
local module, L = BigWigs:ModuleDeclaration("Phantom Servant", "Karazhan")

module.revision = 30022
module.enabletrigger = module.translatedName
module.toggleoptions = {"phantomscream"}
module.trashMod = true

L:RegisterTranslations("enUS", function() return {
	cmd = "phantomservant",

	phantomscream_cmd = "phantomscream",
	phantomscream_name = "Phantom Scream Alert",
	phantomscream_desc = "Warn for Phantom Scream",

	trigger_phantomScreamYou = "You are afflicted by Phantom Scream.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_phantomScreamOther = "(.+) is afflicted by Phantom Scream.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
	--trigger_phantomScreamFade = "Phantom Scream fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
	
	bar_phantomScreamCd = "Phantom Scream CD",
	--bar_phantomScreamAfflicted = " Silenced",

	["You have slain %s!"] = true,
} end )

module.defaultDB = {
	bosskill = nil,
}

local timer = {
	phantomScream = 10,
}
local icon = {
	phantomScream = "Spell_Shadow_PsychicScream",
}
local color = {
	phantomScreamCd = "White",
	phantomScreamAfflicted = "Red",
}
local syncName = {
	phantomScream2 = "PhantomServantPhantomScream2"..module.revision,
	--phantomScreamFade = "PhantomServantPhantomScreamFade"..module.revision,
}

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_phantomScreamYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_phantomScreamOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_phantomScreamOther
	
	--self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--trigger_phantomScreamFade
	--self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--trigger_phantomScreamFade
	--self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--trigger_phantomScreamFade
	
	self:ThrottleSync(5, syncName.phantomScream2)
	--self:ThrottleSync(0, syncName.phantomScreamFade)
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
	if msg == L["trigger_phantomScreamYou"] then
		self:Sync(syncName.phantomScream2)-- .. " " .. UnitName("Player"))
		
	elseif string.find(msg, L["trigger_phantomScreamOther"]) then
		local _,_, phantomScreamTarget, _ = string.find(msg, L["trigger_phantomScreamOther"])
		self:Sync(syncName.phantomScream2)-- .. " " .. phantomScreamTarget)
		
	--elseif string.find(msg, L["trigger_phantomScreamFade"]) then
	--	local _,_, phantomScreamFadeTarget, _ = string.find(msg, L["trigger_phantomScreamFade"])
	--	if phantomScreamFadeTarget == "you" then phantomScreamFadeTarget = UnitName("Player") end
	--	self:Sync(syncName.phantomScreamFade .. " " .. phantomScreamFadeTarget)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.phantomScream2 and self.db.profile.phantomscream then
		self:PhantomScream()
	--elseif sync == syncName.phantomScreamFade and rest and self.db.profile.phantomscream then
	--	self:PhantomScreamFade(rest)
	end
end


function module:PhantomScream()
	--self:Bar(rest..L["bar_phantomScreamAfflicted"], timer.phantomScream, icon.phantomScream, true, color.phantomScreamAfflicted)
	self:Bar(L["bar_phantomScreamCd"], timer.phantomScream, icon.phantomScream, true, color.phantomScreamCd)
end

function module:PhantomScreamFade(rest)
	self:RemoveBar(rest..L["bar_phantomScreamAfflicted"])
end
