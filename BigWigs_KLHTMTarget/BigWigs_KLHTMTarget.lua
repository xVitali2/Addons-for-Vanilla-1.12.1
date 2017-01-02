--[[
-- ORPHANED ORPHANED ORPHANED
--
-- No developer cares about this addon.
--
-- Noone will fix problems you find with this code, noone will implement new
-- features, noone will update it for patches.
--
-- Noone will code it so that it enables when a boss is engaged instead of when
-- the bossmod is enabled, for several reasons. If you can not figure out these
-- reasons yourself, then don't bother asking, because you're not worth
-- the time it takes to answer.
--
-- ORPHANED ORPHANED ORPHANED
--]]

----------------------------
--      Localization      --
----------------------------
local L = AceLibrary("AceLocale-2.2"):new("BigWigsKLHTMTarget")

L:RegisterTranslations("enUS", function() return {
	["KLHTM Target"] = true,
	["klhtmt"] = true,
	["Options for the setting KLH master target."] = true,
	["Set the KLH Threatmeter master target when a BigWigs boss module is enabled."] = true,
	["Set master target"] = true,
	["target"] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
	["KLHTM Target"] = "KLHTM Цель",
	["klhtmt"] = "klhtmt",
	["Options for the setting KLH master target."] = "Опции настройки KLH мастера метки.",
	["Set the KLH Threatmeter master target when a BigWigs boss module is enabled."] = "Устанавливать KLH Threatmeter мастер метки, когда активный босс модуль BigWigs.",
	["Set master target"] = "Установить мастер метки",
	["target"] = "target",
} end)

L:RegisterTranslations("zhTW", function() return {
--Bell@尖石 翻譯
	["KLHTM Target"] = "KLHTM 目標",
	["klhtmt"] = "KLHTM MT",
	["Options for the setting KLH master target."] = "KLH主要目標設定選項",
	["Set the KLH Threatmeter master target when a BigWigs boss module is enabled."] = "當BigWigs Boss模組啟用時設定KLH威脅計量主目標。",
	["Set master target"] = "設定主目標",
	["target"] = "目標",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsKLHTMTarget = BigWigs:NewModule(L["KLHTM Target"])
BigWigsKLHTMTarget.revision = tonumber(string.sub("$Revision: 15075 $", 12, -3))
BigWigsKLHTMTarget.defaults = {
	enabled = true,
}
BigWigsKLHTMTarget.external = true
BigWigsKLHTMTarget.consoleCmd = L["klhtmt"]
BigWigsKLHTMTarget.consoleOptions = {
	type = "group",
	name = L["KLHTM Target"],
	desc = L["Options for the setting KLH master target."],
	args = {
		[L["target"]] = {
			type = "toggle",
			name = L["Set master target"],
			desc = L["Set the KLH Threatmeter master target when a BigWigs boss module is enabled."],
			get = function() return BigWigsKLHTMTarget.db.profile.enabled end,
			set = function(v) BigWigsKLHTMTarget.db.profile.enabled = v end,
		},
	}
}

------------------------------
--      Initialization      --
------------------------------

function BigWigsKLHTMTarget:OnEnable()
	self.bosses = {}

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "KLHTMSetMA", 10)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsKLHTMTarget:BigWigs_RecvSync(sync, rest)
	if not rest or not self.db.profile.enabled then return end
	if not IsRaidOfficer() and not IsRaidLeader() and UnitInRaid("player") then return end

	if sync == "EnableModule" then
		if not self.core:HasModule(rest) then return end
		local m = self.core:GetModule(rest)
		if not m.zonename == GetRealZoneText() then return end
		if m and m:IsBossModule() and not self.bosses[m:ToString()] then
			self.bosses[m:ToString()] = true
			local enableTriggers = type(m.enabletrigger) == "string" and {m.enabletrigger} or m.enabletrigger
			local target = UnitName("target")
			for k, unit in pairs(enableTriggers) do
				TargetByName(unit, true)
				if UnitName("target") == unit then
					self:TriggerEvent("BigWigs_SendSync", "KLHTMSetMA "..unit)
					break
				end
			end
			if target then TargetByName(target, true) end
		end
	elseif sync == "KLHTMSetMA" then
		local target = UnitName("target")
		TargetByName(rest, true)
		if UnitExists("target") and UnitName("target") == rest then
			klhtm.net.sendmastertarget()
		end
		if target then TargetByName(target, true) end
	end
end

