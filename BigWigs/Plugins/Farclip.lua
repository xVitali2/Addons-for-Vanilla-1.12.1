--[[
by Dorann
Reduces farclip (terrain distance) to a minimum in naxxramas to avoid screen freezes
--]]


assert( BigWigs, "BigWigs not found!")

------------------------------
--      Are you local?      --
------------------------------
local L = AceLibrary("AceLocale-2.2"):new("BigWigsFarclip")
local minFarclip = 177
----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Farclip"] = true,
	["farclip"] = true,
	["Reduces the terrain distance to the minimum in Naxxramas to avoid screen freezes."] = true,
	["Active"] = true,
	["Activate the plugin."] = true,
	["Default Value"] = true,
	["Set the default farclip value."] = true,
} end)

L:RegisterTranslations("esES", function() return {
	["Farclip"] = "Farclip",
	["farclip"] = "farclip",
	["Reduces the terrain distance to the minimum in Naxxramas to avoid screen freezes."] = "Reduce la distancia de terreno al mínimo en Naxxramas para evitar colgarse la pantalla.",
	["Active"] = "Activo",
	["Activate the plugin."] = "Activa el plugin",
	["Default Value"] = "Valor Defecto",
	["Set the default farclip value."] = "Define el valor farclip por defecto.",
} end)

--[[L:RegisterTranslations("deDE", function() return {

} end)
]]
----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsFarclip = BigWigs:NewModule(L["Farclip"])
BigWigsFarclip.revision = 20011
BigWigsFarclip.defaultDB = {
	active = true,
	defaultFarclip = 777,
}
BigWigsFarclip.consoleCmd = L["farclip"]

BigWigsFarclip.consoleOptions = {
	type = "group",
	name = L["Farclip"],
	desc = L["Reduces the terrain distance to the minimum in Naxxramas to avoid screen freezes."],
	args   = {
		active = {
			type = "toggle",
			name = L["Active"],
			desc = L["Activate the plugin."],
			order = 1,
			get = function() return BigWigsFarclip.db.profile.active end,
			set = function(v) BigWigsFarclip.db.profile.active = v end,
		--passValue = "reverse",
		},
		default = {
			type = "range",
			name = L["Default Value"],
			desc = L["Set the default farclip value."],
			order = 2,
			min = 177,
			max = 777,
			step = 60,
			get = function() return BigWigsFarclip.db.profile.defaultFarclip end,
			set = function(v)
				BigWigsFarclip.db.profile.defaultFarclip = v
				SetCVar("farclip", v)
			end,
		},
	}
}

------------------------------
--      Initialization      --
------------------------------

function BigWigsFarclip:OnEnable()
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
end

function BigWigsFarclip:ZONE_CHANGED_NEW_AREA()
	self:DebugMessage(1)
	if self.db.profile.active then
		self:DebugMessage(2)
		if AceLibrary("Babble-Zone-2.2")["Naxxramas"] == GetRealZoneText() then
			--self.db.profile.defaultFarclip = GetCVar("farclip")
			SetCVar("farclip", minFarclip) -- http://wowwiki.wikia.com/wiki/CVar_farclip
		else
			self:DebugMessage(3)
			if tonumber(GetCVar("farclip")) == minFarclip then
				self:DebugMessage(4)
				SetCVar("farclip", self.db.profile.defaultFarclip)
			end
		end
	end
end
