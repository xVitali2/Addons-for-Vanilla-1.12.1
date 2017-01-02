local seaura = AceLibrary("SpecialEvents-Aura-2.0")
local semount = AceLibrary("SpecialEvents-Mount-2.0")

local L = AceLibrary("AceLocale-2.2"):new("Automaton_Dismount")
Automaton_Dismount = Automaton:NewModule("Dismount", "AceEvent-2.0", "AceDebug-2.0")

L:RegisterTranslations("enUS", function() return {
    ["Dismount"] = true,
	["Automatically dismount when you receive the 'You are mounted' error"] = true,
} end)
L:RegisterTranslations("ruRU", function() return {
    ["Dismount"] = "Спешивание",
	["Automatically dismount when you receive the 'You are mounted' error"] = "Автоматически спешиваешся при получении ошибки 'Вы на ездовом животном'",
} end)
L:RegisterTranslations("koKR", function() return {
    ["Dismount"] = "탈것 내림",
	["Automatically dismount when you receive the 'You are mounted' error"] = "'탈것에서 내려야합니다' 오류시 자동으로 탈것에서 내립니다.",
} end)

Automaton.options.args.dismount = {
	type = 'toggle',
	name = L["Dismount"],
	desc = L["Automatically dismount when you receive the 'You are mounted' error"],
	get = function() return Automaton:IsModuleActive("Dismount") end,
	set = function(v) Automaton:ToggleModuleActive("Dismount", v) end,
}

function Automaton_Dismount:OnEnable()
	self:RegisterEvent("UI_ERROR_MESSAGE")
	self:RegisterEvent("TAXIMAP_OPENED")
end

function Automaton_Dismount:UI_ERROR_MESSAGE(msg)
	if UnitOnTaxi("player") then
		return
	end

	if msg == ERR_ATTACK_MOUNTED or msg == SPELL_FAILED_NOT_MOUNTED then
		local mount = semount:PlayerMounted()
		local buff = seaura:UnitHasBuff("player", mount)
		if buff then
			CancelPlayerBuff(buff)
		end
	end
end

function Automaton_Dismount:TAXIMAP_OPENED()
	local mount = semount:PlayerMounted()
	if mount then
		local buff = seaura:UnitHasBuff("player", mount)
		CancelPlayerBuff(buff)
	end
end