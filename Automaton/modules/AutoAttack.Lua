local aura = AceLibrary("SpecialEvents-Aura-2.0")
local BS = AceLibrary("Babble-Spell-2.2")

local L = AceLibrary("AceLocale-2.2"):new("Automaton_Attack")
Automaton_Attack= Automaton:NewModule("Attack", "AceEvent-2.0", "AceDebug-2.0")

local buffs = {
	--[BS["Stealth"]]				= true, -- 은신
	[BS["Vanish"]]				= true, -- 소멸
	[BS["Prowl"]]				= true, -- 숨기
	[BS["Feign Death"]]			= true, -- 죽은척하기
	[BS["Shadowmeld"]]			= true, -- 그림자 숨기
	[BS["Food"]]				= true, -- 음식
	[BS["Drink"]]				= true, -- 음료수
	[BS["Enriched Manna Biscuit"]]	= true, -- 맛좋은 만나빵
	[BS["First Aid"]]				= true, -- 응급치료
}

local debuffs = {
	[BS["Gouge"]]				= true, -- 후려치기
	[BS["Sap"]]				= true, -- 기절시키기
	[BS["Seduction"]]			= true, -- 현혹
	[BS["Polymorph"]]			= true, -- 변이
	[BS["Tame Beast"]]			= true, -- 야수 길들이기
	[BS["Scare Beast"]]			= true, -- 야수 겁주기
	[BS["Sleep"]]				= true, -- 수면
	[BS["Hibernate"]]			= true, -- 겨울잠
	[BS["Fear"]]				= true, -- 공포
	[BS["Mind Control"]]			= true, -- 정신 지배
	[BS["Blind"]]				= true, -- 실명
	[BS["Scatter Shot"]]			= true, -- 산탄 사격
	[BS["Enslave Demon"]]		= true, -- 악마 지배
	[BS["Shackle Undead"]]		= true, -- 언데드 속박
	[BS["Reckless Charge"]]		= true, -- 무모한 돌진
	[BS["Freezing Trap Effect"]]	= true, -- 얼음의 덫
	[BS["Intimidating Shout"]]		= true, -- 위협의 외침
	[BS["Cheap Shot"]]			= true, -- 비열한 습격
	
}

L:RegisterTranslations("enUS", function() return {
	["Attack"] = true,
	["Automatically attack."] = true,
} end)
L:RegisterTranslations("ruRU", function() return {
	["Attack"] = "Атака",
	["Automatically attack."] = "Автоматическая атака",
} end)
L:RegisterTranslations("koKR", function() return {
	["Attack"] = "자동 공격",
	["Automatically attack."] = "전투상태시 자동으로 공격합니다.",
} end)



Automaton.options.args.Attack = {
	type = 'toggle',
	name = L["Attack"],
	desc = L["Automatically attack."],
	get = function() return Automaton:IsModuleActive("Attack") end,
	set = function(v) Automaton:ToggleModuleActive("Attack", v) end,
}

function Automaton_Attack:OnEnable()
	self:RegisterEvent("PLAYER_ENTER_COMBAT")
	self:RegisterEvent("PLAYER_LEAVE_COMBAT")
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	self:RegisterEvent("START_AUTOREPEAT_SPELL")
	self:RegisterEvent("STOP_AUTOREPEAT_SPELL")
	
	self:RegisterEvent("SpecialEvents_AuraTargetChanged")
	self:RegisterEvent("SpecialEvents_PlayerBuffGained")
	self:RegisterEvent("SpecialEvents_PlayerBuffLost")
	self:RegisterEvent("SpecialEvents_UnitDebuffGained")
	self:RegisterEvent("SpecialEvents_UnitDebuffLost")
end

function Automaton_Attack:PLAYER_ENTER_COMBAT()
	if not self.inCombat then
		self.selfImposedCombat = true
	end
	self.attacking = true
end

function Automaton_Attack:PLAYER_LEAVE_COMBAT()
	self.attacking = false
	self.selfImposedCombat = false
end

function Automaton_Attack:PLAYER_REGEN_ENABLED()
	self.inCombat = false
	self.selfImposedCombat = false
	self:StopAttacking()
end

function Automaton_Attack:PLAYER_REGEN_DISABLED()
	self.selfImposedCombat = false
	self.inCombat = true
	self:Check()
end

function Automaton_Attack:START_AUTOREPEAT_SPELL()
	self.autoRepeating = true
	self:StopAttacking()
end

function Automaton_Attack:STOP_AUTOREPEAT_SPELL()
	self.autoRepeating = false
	self:Check()
end

function Automaton_Attack:SpecialEvents_AuraTargetChanged()
	self:Check()
end

function Automaton_Attack:SpecialEvents_PlayerBuffGained(buff)
	if buffs[buff] then
		self:StopAttacking()
	end
end

function Automaton_Attack:SpecialEvents_PlayerBuffLost(buff)
	if buffs[buff] then
		self:Check()
	end
end

function Automaton_Attack:SpecialEvents_UnitDebuffGained(unitID, debuff)
	if unitID == "target" and debuffs[debuff] then
		self:StopAttacking()
	end
end

function Automaton_Attack:SpecialEvents_UnitDebuffLost(unitID, debuff)
	if unitID == "target" and debuffs[debuff] then
		self:Check()
	end
end

function Automaton_Attack:Check()
	if (not self.inCombat and not self.selfImposedCombat) or self.autoRepeating or not UnitExists("target") or UnitIsUnit("target", "player") or UnitIsDeadOrGhost("target") or not UnitCanAttack("player", "target") or UnitIsFriend("player", "target") or self:PlayerHasSpecialBuff() or self:TargetIsCrowdControlled() then
		self:StopAttacking()
	else
		self:StartAttacking()
	end
end

function Automaton_Attack:StopAttacking()
	if self.attacking then
		AttackTarget()
	end
end

function Automaton_Attack:StartAttacking()
	if not self.attacking then
		AttackTarget()
	end
end

function Automaton_Attack:PlayerHasSpecialBuff()
	for buff in pairs(buffs) do
		if aura:UnitHasBuff("player", buff) then
			return true
		end
	end
	return false
end

function Automaton_Attack:TargetIsCrowdControlled()
	for debuff in pairs(debuffs) do
		if aura:UnitHasDebuff("target", debuff) then
			return true
		end
	end
	return false
end
