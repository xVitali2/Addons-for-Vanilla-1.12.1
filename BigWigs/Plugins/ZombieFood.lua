--[[
--
-- BigWigs Strategy Module
--
-- Warns the raid when someone is Dazed.
--
--]]

------------------------------
--      Are you local?      --
------------------------------

local name = "Zombie Food"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..name)

local times = nil

L:RegisterTranslations("enUS", function() return {
	["Zombie Food"] = true,
	["zombiefood"] = true,
	["Optionally broadcast the raid when someone gets Dazed."] = true,
	["broadcast"] = true,
	["Broadcast"] = true,
	["Toggle broadcasting."] = true,
	["On"] = true,
	["on"] = true,
	["Toggles the plugin on and off."] = true,

	["%s has been Dazed!"] = true,
	["Dazed"] = true,
} end )

L:RegisterTranslations("esES", function() return {
	["Zombie Food"] = "Atontado",
	--["zombiefood"] = true,
	["Optionally broadcast the raid when someone gets Dazed."] = "Transmite a la banda cuando alguien haya estado atontado",
	--["broadcast"] = true,
	["Broadcast"] = "Transmitir",
	["Toggle broadcasting."] = "Alterna la transmisión",
	["On"] = "Activado",
	--["on"] = true,
	["Toggles the plugin on and off."] = "Activa y desactiva el plugin",

	["%s has been Dazed!"] = "¡%s ha estado Atontado!",
	["Dazed"] = "Atontado",
} end )

BigWigsZombieFood = BigWigs:NewModule(name)
BigWigsZombieFood.defaultDB = {
	broadcast = false,
	on = false,
}

BigWigsZombieFood.consoleCmd = L["zombiefood"]
BigWigsZombieFood.consoleOptions = {
	type = "group",
	name = L["Zombie Food"],
	desc = L["Optionally broadcast the raid when someone gets Dazed."],
	args   = {
		[L["on"]] = {
			type = "toggle",
			name = L["On"],
			desc = L["Toggles the plugin on and off."],
			get = function() return BigWigsZombieFood:IsEventRegistered("SpecialEvents_UnitDebuffGained") end,
			set = function(v)
				BigWigsZombieFood.db.profile.on = v
				if v then
					BigWigsZombieFood:RegisterEvent("SpecialEvents_UnitDebuffGained")
				else
					BigWigsZombieFood:UnregisterEvent("SpecialEvents_UnitDebuffGained")
				end
			end,
		},
		[L["broadcast"]] = {
			type = "toggle",
			name = L["Broadcast"],
			desc = L["Toggle broadcasting."],
			get = function() return BigWigsZombieFood.db.profile.broadcast end,
			set = function(v) BigWigsZombieFood.db.profile.broadcast = v end,
		},
	}
}
BigWigsZombieFood.revision = tonumber(string.sub("$Revision: 17262 $", 12, -3))
BigWigsZombieFood.external = true

function BigWigsZombieFood:OnEnable()
	if self.db.profile.on then
		self:RegisterEvent("SpecialEvents_UnitDebuffGained")
	end
	times = {}
end

function BigWigsZombieFood:SpecialEvents_UnitDebuffGained(unitid, debuffName, applications, debuffType, texture)
	local modulesLoaded = false
	for name, module in self.core:IterateModules() do
		if module:IsBossModule() and self.core:IsModuleActive(module) then
			modulesLoaded = true
			break
		end
	end
	if not modulesLoaded then return end

	if unitid and UnitIsFriend("player", unitid) and UnitIsPlayer(unitid) and debuffName == L["Dazed"] then
		local unitName = UnitName(unitid)
		if unitName and (not times[unitName] or (times[unitName] + 5) < GetTime()) then
			if self.db.profile.broadcast then
				self:TriggerEvent("BigWigs_Message", string.format(L["%s has been Dazed!"], UnitName(unitid)), "Orange")
			else
				self:TriggerEvent("BigWigs_Message", string.format(L["%s has been Dazed!"], UnitName(unitid)), "Orange", true)
			end
			times[unitName] = GetTime()
		end
	end
end

