-- UnitFrames Timer Module by Renew: https://github.com/Voidmenull/ --
----------------------------------------------------------------------

local _G, _M = getfenv(0), {}
setfenv(1, setmetatable(_M, {__index=_G}))
local L = DebuffTimersLocal
local origname = {}
do
	local f = CreateFrame'Frame'
	f:SetScript('OnEvent', function()
		_M[event](this)
	end)
	for _, event in {
		'CHAT_MSG_COMBAT_HONOR_GAIN', 'CHAT_MSG_COMBAT_HOSTILE_DEATH', 'PLAYER_REGEN_ENABLED',
		'CHAT_MSG_SPELL_AURA_GONE_OTHER', 'CHAT_MSG_SPELL_BREAK_AURA',
		'CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE', 'CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS', 'CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE',
		'SPELLCAST_STOP', 'SPELLCAST_INTERRUPTED', 'CHAT_MSG_SPELL_SELF_DAMAGE', 'CHAT_MSG_SPELL_FAILED_LOCALPLAYER',
		'PLAYER_TARGET_CHANGED', 'UPDATE_BATTLEFIELD_SCORE',
	} do f:RegisterEvent(event) end
end

CreateFrame('GameTooltip', 'DET_Tooltip', nil, 'GameTooltipTemplate')

_G.DET_settings={}

local COMBO = 0
local _,CLASS = UnitClass'player'

local DR_CLASS = {
	["Bash"] = 1,
	["Hammer of Justice"] = 1,
	["Cheap Shot"] = 1,
	["Charge Stun"] = 1,
	["Intercept Stun"] = 1,
	["Concussion Blow"] = 1,

	["Fear"] = 2,
	["Howl of Terror"] = 2,
	["Seduction"] = 2,
	["Intimidating Shout"] = 2,
	["Psychic Scream"] = 2,

	["Polymorph"] = 3,
	["Polymorph: Cow"] = 3,
	["Polymorph: Pig"] = 3,
	["Polymorph: Turtle"] = 3,
	["Sap"] = 3,
	["Gouge"] = 3,

	["Entangling Roots"] = 4,
	["Frost Nova"] = 4,

	["Freezing Trap Effect"] = 5,
	["Wyvern String"] = 5,

	["Blind"] = 6,

	["Hibernate"] = 7,

	["Mind Control"] = 8,

	["Kidney Shot"] = 9,

	["Death Coil"] = 10,

	["Frost Shock"] = 11,
}

do
	local factor = {1, 1/2, 1/4, 0}

	function DiminishedDuration(unit, effect, full_duration)
		local class = DR_CLASS[effect]
		if class then
			StartDR(effect, unit)
			return full_duration * factor[DET.timers[class .. '@' .. unit].DR]
		else
			return full_duration
		end
	end
end

function UnitDebuffs(unit)
	local debuffs = {}
	local i = 1
	while UnitDebuff(unit, i) do
		DET_Tooltip:SetOwner(UIParent, 'ANCHOR_NONE')
		DET_Tooltip:SetUnitDebuff(unit, i)
		debuffs[DET_TooltipTextLeft1:GetText()] = true
		i = i + 1
	end
	return debuffs
end

function SetComboPoints()
	if GetComboPoints() > 0 then
		COMBO = GetComboPoints()
	else COMBO = 0
	end
end

function UnitDebuffText(unit,position)
	DET_Tooltip:SetOwner(UIParent, 'ANCHOR_NONE')
	DET_Tooltip:SetUnitDebuff(unit, position)

	return DET_TooltipTextLeft1:GetText()
end

function SetActionRank(name, rank)
	local _, _, rank = strfind(rank or '', L["Rank (%d+)"])
	if rank and DETdebuff.SPELL[name] and DETdebuff.EFFECT[name] then
		DETdebuff.EFFECT[DETdebuff.SPELL[name].EFFECT or name].DURATION = DETdebuff.SPELL[name].DURATION[tonumber(rank)]
	elseif rank and DETdebuff.SPELL[name] and DETdebuff.SPELL[name].EFFECT then
		DETdebuff.EFFECT[DETdebuff.SPELL[name].EFFECT or name].DURATION = DETdebuff.SPELL[name].DURATION[tonumber(rank)]
	end
end

do
	local casting = {}
	local last_cast
	local pending = {}
	do
		local orig = UseAction
		function _G.UseAction(slot, clicked, onself)
			if HasAction(slot) and not GetActionText(slot) then
				DET_Tooltip:SetOwner(UIParent, 'ANCHOR_NONE')
				DET_TooltipTextRight1:SetText()
				DET_Tooltip:SetAction(slot)
				local name = DET_TooltipTextLeft1:GetText()
				if L[name] then
					origname[L[name]] = name
					name = L[name]
					casting[name] = TARGET
					SetActionRank(name, DET_TooltipTextRight1:GetText())
				end
			end
			SetComboPoints()
			return orig(slot, clicked, onself)
		end
	end

	do
		local orig = CastSpell
		function _G.CastSpell(index, booktype)
			local name, rank = GetSpellName(index, booktype)
			local orname = name
			if L[name] then
				origname[L[name]] = name
				name = L[name]
				casting[name] = TARGET
				SetActionRank(name, rank)
			end
			SetComboPoints()
			return orig(index, booktype)
		end
	end

	do
		local orig = CastSpellByName
		function _G.CastSpellByName(text, onself)
			if not onself then
				local name = text
				local rank = 1
				for a,b in string.gfind(text, L["(.-)%(Rank (%d+)%)"]) do
					name = a
					rank = b
				end
				if L[name] then
					origname[L[name]] = name
					name = L[name]
					casting[name] = TARGET
					SetActionRank(name, rank)
				end
			end
			SetComboPoints()
			return orig(text, onself)
		end
	end

	function CHAT_MSG_SPELL_FAILED_LOCALPLAYER()
		for action in string.gfind(arg1, L["You fail to %a+ (.*):.*"]) do
			casting[action] = nil
		end
	end

	function SPELLCAST_STOP()
		for action, target in casting do
			if DETdebuff.SPELL[action] then
				local effect = DETdebuff.SPELL[action].EFFECT or action or DETdebuff.SPELL[action]

				if DETdebuff.EFFECT[effect] and (not IsPlayer(target) or EffectActive(effect, target)) then
					if pending[effect] then
						last_cast = nil
					else
						pending[effect] = {target=target, time=GetTime() + (DETdebuff.SPELL[action].DELAY or 0)}
						last_cast = effect
					end
				end
			end
		end
		casting = {}
	end

	CreateFrame'Frame':SetScript('OnUpdate', function()
		for effect, info in pending do
			if GetTime() >= info.time and last_cast == effect then
				StartTimer(effect, info.target, info.time)
				--pending[effect] = nil
			end
		end
	--end
	end)

	function AbortCast(effect, unit)
		for k, v in pending do
			if k == effect and v.target == unit then
				pending[k] = nil
			end
		end
	end

	function AbortUnitCasts(unit)
		for k, v in pending do
			if v.target == unit or not unit and not IsPlayer(v.target) then
				pending[k] = nil
			end
		end
	end

	function SPELLCAST_INTERRUPTED()
		if last_cast then
			pending[last_cast] = nil
		end
	end

	do
		local patterns = {
			L["is immune to your (.*)%."],
			L["Your (.*) missed"],
			L["Your (.*) was resisted"],
			L["Your (.*) was evaded"],
			L["Your (.*) was dodged"],
			L["Your (.*) was deflected"],
			L["Your (.*) is reflected"],
			L["Your (.*) is parried"],
		}
		function CHAT_MSG_SPELL_SELF_DAMAGE()
			for _, pattern in patterns do
				local _, _, effect = strfind(arg1, pattern)
				if effect then
					pending[effect] = nil
					return
				end
			end
		end
	end
end

function CHAT_MSG_SPELL_AURA_GONE_OTHER()
	for effect, unit in string.gfind(arg1, L["(.+) fades from (.+)%."]) do
		AuraGone(unit, effect)
	end
end

function CHAT_MSG_SPELL_BREAK_AURA()
	for unit, effect in string.gfind(arg1, L["(.+)'s (.+) is removed%."]) do
		AuraGone(unit, effect)
	end
end

function ActivateDRTimer(effect, unit)
	for k, v in DR_CLASS do
		if v == DR_CLASS[effect] and EffectActive(k, unit) then
			return
		end
	end
	local timer = DET.timers[DR_CLASS[effect] .. '@' .. unit]
	if timer then
		timer.START = GetTime()
		timer.END = timer.START + 15
	end
end

function AuraGone(unit, effect)
	if DETdebuff.EFFECT[effect] then
		if IsPlayer(unit) then
			AbortCast(effect, unit)
			StopTimer(effect .. '@' .. unit)
			if DR_CLASS[effect] then
				ActivateDRTimer(effect, unit)
			end
		elseif unit == UnitName'target' then
			-- TODO pet target (in other places too)
			local unit = TARGET
			local debuffs = UnitDebuffs'target'
			for k, timer in DET.timers do
				if timer.UNIT == unit and not debuffs[timer.EFFECT] then
					StopTimer(timer.EFFECT .. '@' .. timer.UNIT)
				end
			end
		end
	end
end

function CHAT_MSG_COMBAT_HOSTILE_DEATH()
	for unit in string.gfind(arg1, L["(.+) dies"]) do
		if IsPlayer(unit) then
			UnitDied(unit)
		elseif unit == UnitName'target' and UnitIsDead'target' then
			UnitDied(TARGET)
		end
	end
end

function CHAT_MSG_COMBAT_HONOR_GAIN()
	for unit in string.gfind(arg1, L["(.+) dies"]) do
		UnitDied(unit)
	end
end

function UpdateTimers()
	local t = GetTime()
	for k, timer in DET.timers do
		if timer.END and t > timer.END then
			StopTimer(k)
			if DR_CLASS[timer.EFFECT] and not timer.DR then
				ActivateDRTimer(timer.EFFECT, timer.UNIT)
			end
		end
	end
end

function EffectActive(effect, unit)
	return DET.timers[effect .. '@' .. unit] and true or false
end

function StartTimer(effect, unit, start)
	local key = effect .. '@' .. unit
	local unitname,unitlevel
	if UnitExists("target") then
		unitname = UnitName'target' or ''
		unitlevel = UnitLevel'target' or 0
	end
	local timer = DET.timers[key] or {}
	DET.timers[key] = timer
	timer.EFFECT = effect
	timer.UNIT = unit
	timer.START = start
	timer.END = timer.START
	if pfdebuffsScanner and unitname and unitlevel and origname[effect] and pfUI.debuffs.objects[unitname]
		and pfUI.debuffs.objects[unitname][unitlevel] and pfUI.debuffs.objects[unitname][unitlevel][origname[effect]] then
			pfUI.debuffs.objects[unitname][unitlevel][origname[effect]].start=start
	end
	local duration = 0
	if DETdebuff.EFFECT[effect] and DETdebuff.EFFECT[effect].DURATION then duration = DETdebuff.EFFECT[effect].DURATION end
	local comboTime = 0
	if DETdebuff.SPELL[effect] and DETdebuff.SPELL[effect].COMBO and COMBO > 0 then
		comboTime = DETdebuff.SPELL[effect].COMBO[COMBO]
		duration = duration + comboTime
	end
	
	if bonuses[effect] then
		duration = duration + bonuses[effect](duration)
	end
	
	if IsPlayer(unit) then
		timer.END = timer.END + DiminishedDuration(unit, effect, DETdebuff.EFFECT[effect].PVP_DURATION or duration)
	else
		timer.END = timer.END + duration
	end
	if pfdebuffsScanner and unitname and unitlevel and origname[effect] and pfUI.debuffs.objects[unitname]
		and pfUI.debuffs.objects[unitname][unitlevel] and pfUI.debuffs.objects[unitname][unitlevel][origname[effect]] then
			pfUI.debuffs.objects[unitname][unitlevel][origname[effect]].duration=timer.END-start
	end
	timer.stopped = nil
	DET:UpdateDebuffs()
end

function StartDR(effect, unit)
	local key = DR_CLASS[effect] .. '@' .. unit
	local timer = DET.timers[key] or {}

	if not timer.DR or timer.DR < 3 then
		DET.timers[key] = timer

		timer.EFFECT = effect
		timer.UNIT = unit
		timer.START = nil
		timer.END = nil
		timer.DR = min(3, (timer.DR or 0) + 1)
	end
end

function PLAYER_REGEN_ENABLED()
	AbortUnitCasts()
	for k, timer in DET.timers do
		if not IsPlayer(timer.UNIT) then
			StopTimer(k)
		end
	end
end

function StopTimer(key)
	if DET.timers[key] then
		DET.timers[key].stopped = GetTime()
		DET.timers[key] = nil
	end
end

function UnitDied(unit)
	AbortUnitCasts(unit)
	for k, timer in DET.timers do
		if timer.UNIT == unit then
			StopTimer(k)
		end
	end
end

CreateFrame'Frame':SetScript('OnUpdate', RequestBattlefieldScoreData)

do
	local player = {}

	local function hostilePlayer(msg)
		local _, _, name = strfind(arg1, L["^([^%s']*)"])
		return name
	end

	function CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS()
		if player[hostilePlayer(arg1)] == nil then player[hostilePlayer(arg1)] = true end -- wrong for pets
	end

	function CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE()
		if player[hostilePlayer(arg1)] == nil then player[hostilePlayer(arg1)] = true end -- wrong for pets
		for unit, effect in string.gfind(arg1, L["(.+) is afflicted by (.+)%."]) do
			if L[effect] and DETdebuff.EFFECT[L[effect]] then
				StartTimer(L[effect], unit, GetTime())
			end
		end
	end
	
	function CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE()
		if player[hostilePlayer(arg1)] == nil then player[hostilePlayer(arg1)] = true end -- wrong for pets
		 for unit, effect in string.gfind(arg1, L["(.+) is afflicted by (.+)%."]) do
			 if L[effect] and DETdebuff.EFFECT[L[effect]] then
				 StartTimer(L[effect], unit, GetTime())
			 end
		 end
		for unit,_,_,effect in string.gfind(arg1, L["(.+) suffers (.-)% (.-)% damage from your (.+)."]) do
			if L[effect] and L[effect]=="Blizzard" and DETdebuff.EFFECT[L[effect]] then
				StartTimer(L[effect], unit, GetTime())
			end
		end
	end

	do
		local current
		function PLAYER_TARGET_CHANGED()
			local unit = UnitName'target'
			TARGET = unit
			if unit then
				player[unit] = UnitIsPlayer'target' and true or false
				current = unit
			end
		end
	end

	function UPDATE_BATTLEFIELD_SCORE()
		for i = 1, GetNumBattlefieldScores() do
			player[GetBattlefieldScore(i)] = true
		end
	end

	function IsPlayer(unit)
		return player[unit]
	end
end

CreateFrame'Frame':SetScript('OnUpdate', function()
	UpdateTimers()
end)

do
	local function rank(i, j)
		local _, _, _, _, rank= GetTalentInfo(i, j)
		return rank
	end

	if CLASS == 'ROGUE' then
		bonuses = {
			["Gouge"] = function()
				return rank(2, 1) * .5
			end,
			["Garrote"] = function()
				return rank(3, 8) * 3
			end,
		}
	elseif CLASS == "WARLOCK" then
		bonuses = {
			["Shadow Word: Pain"] = function() -- ???
				return rank(2, 7) * 1.5
			end,
			["Seduction"] = function()
				return rank(2, 7) * 1.5
			end,
		}
	elseif CLASS == "WARRIOR" then
		bonuses = {
			["Demoralizing Shout"] = function()
				return rank(2, 1) * 3
			end,
		}
	elseif CLASS == 'HUNTER' then
		bonuses = {
			["Freezing Trap Effect"] = function(t)
				return t * rank(3, 7) * .15
			end,
			["Frost Trap Aura"] = function(t)
				return t * rank(3, 7) * .15
			end,
		}
	elseif CLASS == 'PRIEST' then
		bonuses = {
			["Shadow Word: Pain"] = function()
				return rank(3, 4) * 3
			end,
		}
	elseif CLASS == 'MAGE' then
		bonuses = {
			["Polymorph"] = function()
				return DET_settings.arcanist and 15 or 0
			end,
		}
	elseif CLASS == 'DRUID' then
		bonuses = {
			["Pounce"] = function()
				return rank(2, 4) * .5
			end,
			["Bash"] = function()
				return rank(2, 4) * .5
			end,
		}
	else
		bonuses = {}
	end
end

function DETPromt(msg)
	DET.Options:Show()
end

_G.SLASH_DEBUFFTIMERS1 = '/DebuffTimers'
_G.SLASH_DEBUFFTIMERS2 = '/debufftimers'
_G.SLASH_DEBUFFTIMERS3 = '/dt'
SlashCmdList.DEBUFFTIMERS = DETPromt

DET = CreateFrame("Frame","DET",UIParent)
DET.Debuff = CreateFrame("Frame")
DET.Buff = CreateFrame("Frame")
DET.timers={}
DET.DR = CreateFrame("Frame",nil,UIParent)
DET:RegisterEvent("PLAYER_TARGET_CHANGED")
DET:RegisterEvent("ADDON_LOADED")
DET.UnitDebuff = UnitDebuff
DET.UnitBuff = UnitBuff
DET.UnitName = UnitName
DET.Work = {}
DET.Version = "0.9.3"

DET.ClickCast = {}
DET.DoubleCheck = {}

function DET:GetTimeFromDT(index)
local timeleft=0
local milliseconds = 0; if DET_settings.milliseconds then milliseconds = 1 end
if DET.Buff[index].Duation and DET.Buff[index].Duation > 0 then
	timeleft=DET.Buff[index].Duation
else
	timeleft=DET.Debuff[index].Duation
end

return DET:round(timeleft,milliseconds)
end

function DET.Debuff:Build()
	for i=1,16 do
		DET.Debuff[i] = CreateFrame("Model", "DETDebuff"..i, nil, "CooldownFrameTemplate")
		DET.Debuff[i].parent = CreateFrame("Frame", "DETDebuff"..i.."Cooldown", getglobal("TargetFrameDebuff"..i))
		DET.Debuff[i].parent:SetPoint("CENTER",getglobal("TargetFrameDebuff"..i),"CENTER", 0, 0)
		DET.Debuff[i].parent:SetWidth(0)
		DET.Debuff[i].parent:SetHeight(100)
		DET.Debuff[i].parent:SetFrameStrata("DIALOG")
		if getglobal("TargetFrameDebuff"..i) then DET.Debuff[i].parent:SetFrameLevel(getglobal("TargetFrameDebuff"..i):GetFrameLevel() + 1) end
		DET.Debuff[i]:SetParent(DET.Debuff[i].parent)
		DET.Debuff[i]:SetAllPoints(DET.Debuff[i].parent)
		DET.Debuff[i].parent:SetScript("OnUpdate",nil)
		DET.Debuff[i].Font = DET.Debuff[i]:CreateFontString("DETDebuff"..i.."CooldownText", "OVERLAY")
		DET.Debuff[i].Font:SetPoint("CENTER", DET_settings.OffsetX, DET_settings.OffsetY)
		DET.Debuff[i].Font:SetFont("Fonts\\ARIALN.TTF", DET_settings.TextSize, "OUTLINE")
		DET.Debuff[i].Font:SetJustifyH("CENTER")
		DET.Debuff[i].Font:SetTextColor(1,1,1)
		DET.Debuff[i].Font:SetText("")
	end
end

function DET.Buff:Build()
	for i=1,16 do
		DET.Buff[i] = CreateFrame("Model", "DETBuff"..i, nil, "CooldownFrameTemplate")
		DET.Buff[i].parent = CreateFrame("Frame", "DETBuff"..i.."Cooldown", getglobal("TargetFrameBuff"..i))
		DET.Buff[i].parent:SetPoint("CENTER",getglobal("TargetFrameBuff"..i),"CENTER", 0, 0)
		DET.Buff[i].parent:SetWidth(100)
		DET.Buff[i].parent:SetHeight(100)
		DET.Buff[i].parent:SetFrameStrata("DIALOG")
		if getglobal("TargetFrameBuff"..i) then DET.Buff[i].parent:SetFrameLevel(getglobal("TargetFrameBuff"..i):GetFrameLevel() + 1) end
		DET.Buff[i]:SetParent(DET.Buff[i].parent)
		DET.Buff[i]:SetAllPoints(DET.Buff[i].parent)
		DET.Buff[i].parent:SetScript("OnUpdate",nil)
		
		DET.Buff[i].Font = DET.Buff[i]:CreateFontString("DETBuff"..i.."CooldownText", "OVERLAY")
		DET.Buff[i].Font:SetPoint("CENTER", DET_settings.OffsetX, DET_settings.OffsetY)
		DET.Buff[i].Font:SetFont("Fonts\\ARIALN.TTF", DET_settings.TextSize, "OUTLINE")
		DET.Buff[i].Font:SetJustifyH("CENTER")
		DET.Buff[i].Font:SetTextColor(1,1,1)
		DET.Buff[i].Font:SetText("")
		
	end
end

function DET:UpdateFont(button,start,duration,style)
	if DET_settings.TextSize == 1 then
		DET.Debuff[button].Font:Hide()
		DET.Buff[button].Font:Hide()
	else
		DET.Debuff[button].Font:Show()
		DET.Buff[button].Font:Show()
		local milliseconds = 0; if DET_settings.milliseconds then milliseconds = 1 end
		if style == "Debuff" then
			DET.Debuff[button].Duation = duration
			DET.Debuff[button].parent:SetScript("OnUpdate",function()
				DET.Debuff[button].Duation = DET.Debuff[button].Duation - arg1

				if DET.Debuff[button].Duation > 0 then
					DET.Debuff[button].Font:SetText(DET:round(DET.Debuff[button].Duation,milliseconds))
					if DET.Debuff[button].Duation > 3 then
						DET.Debuff[button].Font:SetTextColor(1,1,1)
					else
						DET.Debuff[button].Font:SetTextColor(1,0.4,0.4)
					end
				else
					DET.Debuff[button].parent:SetScript("OnUpdate",nil)
				end
			end)
		elseif style == "Buff" then
			DET.Buff[button].Duation = duration
			DET.Buff[button].parent:SetScript("OnUpdate",function()
				DET.Buff[button].Duation = DET.Buff[button].Duation - arg1
				if DET.Buff[button].Duation > 0 then
					DET.Buff[button].Font:SetText(DET:round(DET.Buff[button].Duation,milliseconds))	
					if DET.Buff[button].Duation > 3 then
						DET.Buff[button].Font:SetTextColor(1,1,1)
					else
						DET.Buff[button].Font:SetTextColor(1,0.4,0.4)
					end
				else
					DET.Buff[button].parent:SetScript("OnUpdate",nil)
				end
			end)
		else
			DET.Debuff[button].Duation = duration
			DET.Debuff[button].parent:SetScript("OnUpdate",function()
				DET.Debuff[button].Duation = DET.Debuff[button].Duation - arg1
				if DET.Debuff[button].Duation > 0 then else DET.Debuff[button].parent:SetScript("OnUpdate",nil) end
			end)
		end
	end
end

function DET:round(num, numDecimalPlaces)
	if num and numDecimalPlaces > 0 then
		DET.Work.mult = 10^(numDecimalPlaces or 0)
		return string.format("%.1f",math.floor(num * DET.Work.mult + 0.5) / DET.Work.mult)
	elseif num then
		return math.floor(num)
	end
end

function DET:OnEvent()
	if event == "PLAYER_TARGET_CHANGED" then
		DET:OnTarget()
	elseif event == "UNIT_AURA" and arg1 == "target" then
		for _, timer in DET.timers do
			timer.DOUBLE = nil -- clear double DET.timers
		end
		DET:UpdateDebuffs()
	elseif event == "ADDON_LOADED" and arg1 == "DebuffTimers" then
		DET:DatabasePreload()
		DET:UpdateSavedVariables()
		
		DET:BuildOptions()
		DET:BuildClassWindow()
		DET:UpdateDatabase()
		
		DET.Debuff:Build()
		DET.Buff:Build()
		
		if DET_settings.UF then
			DET:SetUnitFramesAnchor(DET_settings.UF)
		else
			DET:SetUnitFramesAnchor("Default")
		end
	end
end
DET:SetScript("OnEvent", DET.OnEvent)

function DET:OnTarget()
	if UnitExists("target") then
		DET:RegisterEvent("UNIT_AURA")
		DET:UpdateDebuffs()
	else
		DET:UnregisterEvent("UNIT_AURA")
		for i=1,16 do -- xperl fade problem
			DET.Debuff[i].parent:Hide()
			DET.Buff[i].parent:Hide()
		end
	end
end

function DET:UpdateDebuffs()
	-- close old animations
	for i=1,16 do
		CooldownFrame_SetTimer(DET.Debuff[i],0,0,0)
		CooldownFrame_SetTimer(DET.Buff[i],0,0,0)
	end
	-- delete old doublecheck
	for effect, _ in DET.DoubleCheck do
		DET.DoubleCheck[effect] = nil
	end
	
	if UnitExists("target") then
		for _, timer in DET.timers do
			if not timer.DR and DET.UnitName("target") == timer.UNIT then
				if timer.EFFECT=="Blizzard" then timer.EFFECT="Chilled" end
				for i=1,16 do
					local name = UnitDebuffText("target",i)
					if L[name] and L[name] == timer.EFFECT and getglobal(DET.DebuffAnchor..i) and not DET.DoubleCheck[timer.EFFECT] then
						if timer.EFFECT == "Intimidating Shout" then -- exception for doublecheck
						else
							DET.DoubleCheck[timer.EFFECT] = true
						end
						-- xper exception
						if DET.DebuffAnchor == "XPerl_Target_BuffFrame_DeBuff" then
							DET.Debuff[i].parent:SetWidth(getglobal(DET.DebuffAnchor..i):GetWidth()*0.7)
							DET.Debuff[i].parent:SetHeight(getglobal(DET.DebuffAnchor..i):GetHeight()*0.7)
							DET.Debuff[i]:SetScale(getglobal(DET.DebuffAnchor..i):GetHeight()/36*0.7)
						else
							DET.Debuff[i].parent:SetWidth(getglobal(DET.DebuffAnchor..i):GetWidth())
							DET.Debuff[i].parent:SetHeight(getglobal(DET.DebuffAnchor..i):GetHeight())
							DET.Debuff[i]:SetScale(getglobal(DET.DebuffAnchor..i):GetHeight()/36)
						end
						DET.Debuff[i].parent:SetPoint("CENTER",getglobal(DET.DebuffAnchor..i),"CENTER",0,0)
						getglobal(DET.DebuffAnchor..i):SetID(i)
						getglobal(DET.DebuffAnchor..i):SetScript("OnClick", function() CastSpellByName(UnitDebuffText("target",this:GetID())) end)
						DET.Debuff[i].parent:Show()
						if DET_settings.reverse then DET.Debuff[i].reverse = 1 else DET.Debuff[i].reverse = nil	end
						CooldownFrame_SetTimer(DET.Debuff[i],timer.START, timer.END-timer.START,1)
						if not getglobal("pfUITargetDebuff1") then
							DET:UpdateFont(i,timer.START,timer.END-GetTime(),"Debuff")
						else
							--DET:UpdateFont(i,timer.START,timer.END-GetTime(),"")
						end
					end
					local icon="Interface\\Icons\\"..DETdebuff.EFFECT[timer.EFFECT].ICON
					if DET.UnitBuff("target",i) == icon and getglobal(DET.BuffAnchor..i) then
						if  getglobal("XPerl_Target_BuffFrame") then
							DET.Buff[i].parent:SetWidth(getglobal(DET.BuffAnchor..i):GetWidth()*0.7)
							DET.Buff[i].parent:SetHeight(getglobal(DET.BuffAnchor..i):GetHeight()*0.7)
							DET.Buff[i]:SetScale(getglobal(DET.BuffAnchor..i):GetHeight()/36*0.7)
						else
							DET.Buff[i].parent:SetWidth(getglobal(DET.BuffAnchor..i):GetWidth())
							DET.Buff[i].parent:SetHeight(getglobal(DET.BuffAnchor..i):GetHeight())
							DET.Buff[i]:SetScale(getglobal(DET.BuffAnchor..i):GetHeight()/36)
						end
						DET.Buff[i].parent:SetPoint("CENTER",getglobal(DET.BuffAnchor..i),"CENTER",0,0)
						DET.Buff[i].parent:Show()
						if DET_settings.reverse then DET.Buff[i].reverse = 1 else DET.Buff[i].reverse = nil	end
						CooldownFrame_SetTimer(DET.Buff[i],timer.START, timer.END-timer.START,1)
						if not getglobal("pfUITargetBuff1") then
							DET:UpdateFont(i,timer.START,timer.END-GetTime(),"Buff")
						else
							--DET:UpdateFont(i,timer.START,timer.END-GetTime(),"")
						end
					end
				end
			end
		end
	end
end

function DET:UpdateSavedVariables()
	if not DET_settings then DET_settings = {} end
	if not DET_settings.TextSize then DET_settings.TextSize = 20 end
	if not DET_settings.effects then DET_settings.effects = {} end
	if not DET_settings.milliseconds then DET_settings.milliseconds = false end
	if not DET_settings.reverse then DET_settings.reverse = false end
	if not DET_settings.OffsetX then DET_settings.OffsetX = 0 end
	if not DET_settings.OffsetY then DET_settings.OffsetY = 0 end
	
	if not DET_settings.CLASS then DET_settings.CLASS = {} end
	if not DET_settings.CLASS[CLASS] and DET_settings.CLASS[CLASS] ~= false then DET_settings.CLASS[CLASS] = true end
	if not DET_settings.CLASS["WARRIOR"] then DET_settings.CLASS["WARRIOR"] = false end
	if not DET_settings.CLASS["MAGE"] then DET_settings.CLASS["MAGE"] = false end
	if not DET_settings.CLASS["ROGUE"] then DET_settings.CLASS["ROGUE"] = false end
	if not DET_settings.CLASS["DRUID"] then DET_settings.CLASS["DRUID"] = false end
	if not DET_settings.CLASS["HUNTER"] then DET_settings.CLASS["HUNTER"] = false end
	if not DET_settings.CLASS["SHAMAN"] then DET_settings.CLASS["SHAMAN"] = false end
	if not DET_settings.CLASS["PRIEST"] then DET_settings.CLASS["PRIEST"] = false end
	if not DET_settings.CLASS["WARLOCK"] then DET_settings.CLASS["WARLOCK"] = false end
	if not DET_settings.CLASS["PALADIN"] then DET_settings.CLASS["PALADIN"] = false end
	
	-- check for database spells and enable them if new
	for class,effects in pairs(DET_Debuff) do
		if not DET_settings.effects[class] then DET_settings.effects[class] = {} end
		for aura, _ in pairs(DET_Debuff[class].EFFECT) do 
			if not DET_settings.effects[class].effect then DET_settings.effects[class].effect = {} end
			if not DET_settings.effects[class].effect[aura] and DET_settings.effects[class].effect[aura] ~= false then DET_settings.effects[class].effect[aura] = true end
		end
	end
	
	if not DET_settings.UF then
		DET_settings.UF = "Default"
		if IsAddOnLoaded("modui") then DET_settings.UF = "modui"
		elseif IsAddOnLoaded("pfUI") then DET_settings.UF = "pfUI"
		elseif IsAddOnLoaded("LunaUnitFrames") then DET_settings.UF = "LunaUnitFrames"
		elseif IsAddOnLoaded("XPerl_Target") then DET_settings.UF = "XPerl_Target"
		elseif IsAddOnLoaded("DiscordUnitFrames") then DET_settings.UF = "DiscordUnitFrames"
		elseif IsAddOnLoaded("UnitFramesImproved_Vanilla") then DET_settings.UF = "UnitFramesImproved_Vanilla" end
	end
	
end

function DET:UpdateDatabase()
	DETdebuff = {}
	DETdebuff.SPELL = {}
	DETdebuff.EFFECT = {}
	for class,effects in pairs(DET_Debuff) do
		if DET_settings.CLASS[class] then
			for effect, info in pairs(effects) do
				for name, tab in pairs(info) do
					if effect == "EFFECT" and DET_settings.effects[class].effect[name] then
						DETdebuff.EFFECT[name] = DET_Debuff[class].EFFECT[name]
					elseif effect == "SPELL" then
						DETdebuff.SPELL[name] = DET_Debuff[class].SPELL[name]
					end
				end
			end
		end
	end
end

-- UI Options

function DET:BuildOptions()
	DET.Options = CreateFrame("Frame",nil,UIParent)
	DET.Options:SetPoint("CENTER",0,0)
	DET.Options:SetBackdrop(StaticPopup1:GetBackdrop())
	DET.Options:SetMovable(true)
	DET.Options:EnableMouse(true)
	DET.Options:RegisterForDrag("LeftButton")
	DET.Options:SetScript("OnDragStart", function() DET.Options:StartMoving() end)
	DET.Options:SetScript("OnDragStop", function() DET.Options:StopMovingOrSizing() end)
	DET.Options:SetHeight(450)
	DET.Options:SetWidth(600)
	
	DET.Options.CloseButton = CreateFrame("Button",nil, DET.Options, "UIPanelCloseButton")
	DET.Options.CloseButton:SetPoint("TOPRIGHT", -5, -5)
	DET.Options.CloseButton:SetScript("OnClick", function() DET.Options:Hide() end)
	 
	DET.Options.Headline = DET.Options:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	DET.Options.Headline:SetPoint("TOP", 0, -15)
	DET.Options.Headline:SetText("DebuffTimers Options")
	
	DET.Options.DebuffFont = DET.Options:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	DET.Options.DebuffFont:SetPoint("TOPLEFT", 20, -35)
	DET.Options.DebuffFont:SetText("Show Debuffs:")
	
	DET.Options.Warrior = {}
	DET.Options.Warrior.Checkbox = CreateFrame("CheckButton",nil, DET.Options, "UICheckButtonTemplate")
	DET.Options.Warrior.Checkbox:SetPoint("TOPLEFT", 20, -70)
	DET.Options.Warrior.Checkbox:SetChecked(DET_settings.CLASS["WARRIOR"])
	DET.Options.Warrior.Button = CreateFrame("CheckButton",nil, DET.Options.Warrior.Checkbox, "UIPanelButtonTemplate")
	DET.Options.Warrior.Button:SetHeight(48)
	DET.Options.Warrior.Button:SetWidth(48)
	DET.Options.Warrior.Button:SetPoint("LEFT", DET.Options.Warrior.Checkbox, "RIGHT", 5, 0)
	DET.Options.Warrior.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Warrior.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Warrior.Button:GetNormalTexture():SetTexCoord(0,0.25,0,0.25)
	DET.Options.Warrior.Button:GetPushedTexture():SetTexCoord(0,0.25,0,0.25)
	DET.Options.Warrior.Button:SetScript("OnClick", function() 
		if not getglobal("DET_ClassOptions_".."WARRIOR"):IsVisible() then DET:OpenClassOption("WARRIOR")
		else getglobal("DET_ClassOptions_".."WARRIOR"):Hide() end
		end)
	
	DET.Options.Mage = {}
	DET.Options.Mage.Checkbox = CreateFrame("CheckButton",nil, DET.Options.Warrior.Checkbox, "UICheckButtonTemplate")
	DET.Options.Mage.Checkbox:SetPoint("RIGHT", 100, 0)
	DET.Options.Mage.Checkbox:SetChecked(DET_settings.CLASS["MAGE"])
	DET.Options.Mage.Button = CreateFrame("CheckButton",nil, DET.Options.Mage.Checkbox, "UIPanelButtonTemplate")
	DET.Options.Mage.Button:SetHeight(48)
	DET.Options.Mage.Button:SetWidth(48)
	DET.Options.Mage.Button:SetPoint("LEFT", DET.Options.Mage.Checkbox, "RIGHT", 5, 0)
	DET.Options.Mage.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Mage.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Mage.Button:GetNormalTexture():SetTexCoord(0.25,0.5,0,0.25)
	DET.Options.Mage.Button:GetPushedTexture():SetTexCoord(0.25,0.5,0,0.25)
	DET.Options.Mage.Button:SetScript("OnClick", function() 
		if not getglobal("DET_ClassOptions_".."MAGE"):IsVisible() then DET:OpenClassOption("MAGE")
		else getglobal("DET_ClassOptions_".."MAGE"):Hide() end
		end)
	
	DET.Options.Rogue = {}
	DET.Options.Rogue.Checkbox = CreateFrame("CheckButton",nil, DET.Options.Mage.Checkbox, "UICheckButtonTemplate")
	DET.Options.Rogue.Checkbox:SetPoint("RIGHT", 100, 0)
	DET.Options.Rogue.Checkbox:SetChecked(DET_settings.CLASS["ROGUE"])
	DET.Options.Rogue.Button = CreateFrame("CheckButton",nil, DET.Options.Rogue.Checkbox, "UIPanelButtonTemplate")
	DET.Options.Rogue.Button:SetHeight(48)
	DET.Options.Rogue.Button:SetWidth(48)
	DET.Options.Rogue.Button:SetPoint("LEFT", DET.Options.Rogue.Checkbox, "RIGHT", 5, 0)
	DET.Options.Rogue.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Rogue.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Rogue.Button:GetNormalTexture():SetTexCoord(0.5,0.75,0,0.25)
	DET.Options.Rogue.Button:GetPushedTexture():SetTexCoord(0.5,0.75,0,0.25)
	DET.Options.Rogue.Button:SetScript("OnClick", function() 
		if not getglobal("DET_ClassOptions_".."ROGUE"):IsVisible() then DET:OpenClassOption("ROGUE")
		else getglobal("DET_ClassOptions_".."ROGUE"):Hide() end
		end)
	
	DET.Options.Druid = {}
	DET.Options.Druid.Checkbox = CreateFrame("CheckButton",nil, DET.Options.Warrior.Checkbox, "UICheckButtonTemplate")
	DET.Options.Druid.Checkbox:SetPoint("BOTTOM", 0, -60)
	DET.Options.Druid.Checkbox:SetChecked(DET_settings.CLASS["DRUID"])
	DET.Options.Druid.Button = CreateFrame("CheckButton",nil, DET.Options.Druid.Checkbox, "UIPanelButtonTemplate")
	DET.Options.Druid.Button:SetHeight(48)
	DET.Options.Druid.Button:SetWidth(48)
	DET.Options.Druid.Button:SetPoint("LEFT", DET.Options.Druid.Checkbox, "RIGHT", 5, 0)
	DET.Options.Druid.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Druid.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Druid.Button:GetNormalTexture():SetTexCoord(0.75,1,0,0.25)
	DET.Options.Druid.Button:GetPushedTexture():SetTexCoord(0.75,1,0,0.25)
	DET.Options.Druid.Button:SetScript("OnClick", function() 
		if not getglobal("DET_ClassOptions_".."DRUID"):IsVisible() then DET:OpenClassOption("DRUID")
		else getglobal("DET_ClassOptions_".."DRUID"):Hide() end
		end)
	
	DET.Options.Hunter = {}
	DET.Options.Hunter.Checkbox = CreateFrame("CheckButton",nil, DET.Options.Druid.Checkbox, "UICheckButtonTemplate")
	DET.Options.Hunter.Checkbox:SetPoint("RIGHT", 100, 0)
	DET.Options.Hunter.Checkbox:SetChecked(DET_settings.CLASS["HUNTER"])
	DET.Options.Hunter.Button = CreateFrame("CheckButton",nil, DET.Options.Hunter.Checkbox, "UIPanelButtonTemplate")
	DET.Options.Hunter.Button:SetHeight(48)
	DET.Options.Hunter.Button:SetWidth(48)
	DET.Options.Hunter.Button:SetPoint("LEFT", DET.Options.Hunter.Checkbox, "RIGHT", 5, 0)
	DET.Options.Hunter.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Hunter.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Hunter.Button:GetNormalTexture():SetTexCoord(0,0.25,0.25,0.5)
	DET.Options.Hunter.Button:GetPushedTexture():SetTexCoord(0,0.25,0.25,0.5)
	DET.Options.Hunter.Button:SetScript("OnClick", function() 
		if not getglobal("DET_ClassOptions_".."HUNTER"):IsVisible() then DET:OpenClassOption("HUNTER")
		else getglobal("DET_ClassOptions_".."HUNTER"):Hide() end
		end)
	
	DET.Options.Shaman = {}
	DET.Options.Shaman.Checkbox = CreateFrame("CheckButton",nil, DET.Options.Hunter.Checkbox, "UICheckButtonTemplate")
	DET.Options.Shaman.Checkbox:SetPoint("RIGHT", 100, 0)
	DET.Options.Shaman.Checkbox:SetChecked(DET_settings.CLASS["SHAMAN"])
	DET.Options.Shaman.Button = CreateFrame("CheckButton",nil, DET.Options.Shaman.Checkbox, "UIPanelButtonTemplate")
	DET.Options.Shaman.Button:SetHeight(48)
	DET.Options.Shaman.Button:SetWidth(48)
	DET.Options.Shaman.Button:SetPoint("LEFT", DET.Options.Shaman.Checkbox, "RIGHT", 5, 0)
	DET.Options.Shaman.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Shaman.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Shaman.Button:GetNormalTexture():SetTexCoord(0.25,0.50,0.25,0.5)
	DET.Options.Shaman.Button:GetPushedTexture():SetTexCoord(0.25,0.50,0.25,0.5)
	DET.Options.Shaman.Button:SetScript("OnClick", function() 
		if not getglobal("DET_ClassOptions_".."SHAMAN"):IsVisible() then DET:OpenClassOption("SHAMAN")
		else getglobal("DET_ClassOptions_".."SHAMAN"):Hide() end
		end)
	
	DET.Options.Priest = {}
	DET.Options.Priest.Checkbox = CreateFrame("CheckButton",nil, DET.Options.Druid.Checkbox, "UICheckButtonTemplate")
	DET.Options.Priest.Checkbox:SetPoint("BOTTOM", 0, -60)
	DET.Options.Priest.Checkbox:SetChecked(DET_settings.CLASS["PRIEST"])
	DET.Options.Priest.Button = CreateFrame("CheckButton",nil, DET.Options.Priest.Checkbox, "UIPanelButtonTemplate")
	DET.Options.Priest.Button:SetHeight(48)
	DET.Options.Priest.Button:SetWidth(48)
	DET.Options.Priest.Button:SetPoint("LEFT", DET.Options.Priest.Checkbox, "RIGHT", 5, 0)
	DET.Options.Priest.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Priest.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Priest.Button:GetNormalTexture():SetTexCoord(0.50,0.75,0.25,0.5)
	DET.Options.Priest.Button:GetPushedTexture():SetTexCoord(0.50,0.75,0.25,0.5)
	DET.Options.Priest.Button:SetScript("OnClick", function() 
		if not getglobal("DET_ClassOptions_".."PRIEST"):IsVisible() then DET:OpenClassOption("PRIEST")
		else getglobal("DET_ClassOptions_".."PRIEST"):Hide() end
		end)
	
	DET.Options.Warlock = {}
	DET.Options.Warlock.Checkbox = CreateFrame("CheckButton",nil, DET.Options.Priest.Checkbox, "UICheckButtonTemplate")
	DET.Options.Warlock.Checkbox:SetPoint("RIGHT", 100, 0)
	DET.Options.Warlock.Checkbox:SetChecked(DET_settings.CLASS["WARLOCK"])
	DET.Options.Warlock.Button = CreateFrame("CheckButton",nil, DET.Options.Warlock.Checkbox, "UIPanelButtonTemplate")
	DET.Options.Warlock.Button:SetHeight(48)
	DET.Options.Warlock.Button:SetWidth(48)
	DET.Options.Warlock.Button:SetPoint("LEFT", DET.Options.Warlock.Checkbox, "RIGHT", 5, 0)
	DET.Options.Warlock.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Warlock.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Warlock.Button:GetNormalTexture():SetTexCoord(0.75,1,0.25,0.5)
	DET.Options.Warlock.Button:GetPushedTexture():SetTexCoord(0.75,1,0.25,0.5)
	DET.Options.Warlock.Button:SetScript("OnClick", function() 
		if not getglobal("DET_ClassOptions_".."WARLOCK"):IsVisible() then DET:OpenClassOption("WARLOCK")
		else getglobal("DET_ClassOptions_".."WARLOCK"):Hide() end
		end)
	
	DET.Options.Paladin = {}
	DET.Options.Paladin.Checkbox = CreateFrame("CheckButton",nil, DET.Options.Warlock.Checkbox, "UICheckButtonTemplate")
	DET.Options.Paladin.Checkbox:SetPoint("RIGHT", 100, 0)
	DET.Options.Paladin.Checkbox:SetChecked(DET_settings.CLASS["PALADIN"])
	DET.Options.Paladin.Button = CreateFrame("CheckButton",nil, DET.Options.Paladin.Checkbox, "UIPanelButtonTemplate")
	DET.Options.Paladin.Button:SetHeight(48)
	DET.Options.Paladin.Button:SetWidth(48)
	DET.Options.Paladin.Button:SetPoint("LEFT", DET.Options.Paladin.Checkbox, "RIGHT", 5, 0)
	DET.Options.Paladin.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Paladin.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	DET.Options.Paladin.Button:GetNormalTexture():SetTexCoord(0,0.25,0.5,0.75)
	DET.Options.Paladin.Button:GetPushedTexture():SetTexCoord(0,0.25,0.5,0.75)
	DET.Options.Paladin.Button:SetScript("OnClick", function() 
		if not getglobal("DET_ClassOptions_".."PALADIN"):IsVisible() then DET:OpenClassOption("PALADIN")
		else getglobal("DET_ClassOptions_".."PALADIN"):Hide() end
		end)
	
	DET.Options.SizeFont = DET.Options.Priest.Button:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	DET.Options.SizeFont:SetPoint("BOTTOM", 0, -35)
	DET.Options.SizeFont:SetText("Timer Textsize:")
	
	DET.Options.SizeEditBox = CreateFrame("EditBox", "DETSizeEditBox", DET.Options.Priest.Button, "InputBoxTemplate")
	DET.Options.SizeEditBox:SetWidth(25)
	DET.Options.SizeEditBox:SetHeight(20)
	DET.Options.SizeEditBox:SetPoint("LEFT", DET.Options.SizeFont, "RIGHT", 15, 0)
	DET.Options.SizeEditBox:SetMaxLetters(2)
	DET.Options.SizeEditBox:SetAutoFocus(false)
	DET.Options.SizeEditBox:SetNumeric(1)
	DET.Options.SizeEditBox:SetNumber(DET_settings.TextSize)
	
	DET.Options.OffsetXFont = DET.Options.Priest.Button:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	DET.Options.OffsetXFont:SetPoint("TOPLEFT",DET.Options.SizeFont,"BOTTOMLEFT", 0, -15)
	DET.Options.OffsetXFont:SetText("Timer Offset X:")
	
	DET.Options.OffsetXEditBox = CreateFrame("EditBox", "DETOffsetXEditBox", DET.Options.Priest.Button, "InputBoxTemplate")
	DET.Options.OffsetXEditBox:SetWidth(25)
	DET.Options.OffsetXEditBox:SetHeight(20)
	DET.Options.OffsetXEditBox:SetPoint("LEFT", DET.Options.OffsetXFont, "RIGHT", 15, 0)
	DET.Options.OffsetXEditBox:SetMaxLetters(3)
	DET.Options.OffsetXEditBox:SetAutoFocus(false)
	DET.Options.OffsetXEditBox:SetText(DET_settings.OffsetX)
	
	DET.Options.OffsetYFont = DET.Options.Priest.Button:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	DET.Options.OffsetYFont:SetPoint("TOPLEFT",DET.Options.OffsetXFont,"BOTTOMLEFT", 0, -15)
	DET.Options.OffsetYFont:SetText("Timer Offset Y:")
	
	DET.Options.OffsetYEditBox = CreateFrame("EditBox", "DETOffsetYEditBox", DET.Options.Priest.Button, "InputBoxTemplate")
	DET.Options.OffsetYEditBox:SetWidth(25)
	DET.Options.OffsetYEditBox:SetHeight(20)
	DET.Options.OffsetYEditBox:SetPoint("LEFT", DET.Options.OffsetYFont , "RIGHT", 15, 0)
	DET.Options.OffsetYEditBox:SetMaxLetters(3)
	DET.Options.OffsetYEditBox:SetAutoFocus(false)
	DET.Options.OffsetYEditBox:SetText(DET_settings.OffsetY)
	
	DET.Options.SecondsFont = DET.Options.Priest.Button:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	DET.Options.SecondsFont:SetPoint("TOPLEFT",DET.Options.OffsetYFont,"BOTTOMLEFT", 0, -15)
	DET.Options.SecondsFont:SetText("Show milliseconds:")
	
	DET.Options.SecondsCheckbox = CreateFrame("CheckButton",nil, DET.Options, "UICheckButtonTemplate")
	DET.Options.SecondsCheckbox:SetPoint("LEFT",DET.Options.SecondsFont,"RIGHT", 10, 0)
	DET.Options.SecondsCheckbox:SetChecked(DET_settings.milliseconds)
	
	DET.Options.ReverseFont = DET.Options.Priest.Button:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	DET.Options.ReverseFont:SetPoint("TOPLEFT",DET.Options.SecondsFont ,"BOTTOMLEFT", 0, -15)
	DET.Options.ReverseFont:SetText("Reverse Cooldown:")
	
	DET.Options.ReverseCheckbox = CreateFrame("CheckButton",nil, DET.Options, "UICheckButtonTemplate")
	DET.Options.ReverseCheckbox:SetPoint("LEFT",DET.Options.ReverseFont,"RIGHT", 10, 0)
	DET.Options.ReverseCheckbox:SetChecked(DET_settings.reverse)
	
	DET.Options.OkButton = CreateFrame("CheckButton",nil, DET.Options, "UIPanelButtonTemplate")
	DET.Options.OkButton:SetHeight(30)
	DET.Options.OkButton:SetWidth(100)
	DET.Options.OkButton:SetPoint("BOTTOM", 0, 30)
	DET.Options.OkButton:SetText("Save")
	DET.Options.OkButton:SetScript("OnClick", function() DET:SaveOptions() end)
	
	DET.Options.VersionText = DET.Options:CreateFontString(nil, "OVERLAY","GameFontNormal")
	DET.Options.VersionText:SetPoint("BOTTOM", 5, 15)
	DET.Options.VersionText:SetTextHeight(12)
	DET.Options.VersionText:SetTextColor(1,0.8,0,0.7)
	DET.Options.VersionText:SetJustifyH("CENTER")
	DET.Options.VersionText:SetText("Version: "..DET.Version.." by Renew @ github.com/Voidmenull")
	
	DET.Options.UnitFrameFont = DET.Options:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	DET.Options.UnitFrameFont:SetPoint("LEFT",DET.Options.DebuffFont,"RIGHT", 220, 0)
	DET.Options.UnitFrameFont:SetText("Choose UnitFrame:")
	
	local UnitFrames = {
		[1] = "Default",
		[2] = "modui", 
		[3] = "pfUI",
		[4] = "LunaUnitFrames",
		[5] = "XPerl_Target",
		[6] = "DiscordUnitFrames",
		[7] = "UnitFramesImproved_Vanilla",
	}
	
	DET.Options.UnitFrame = {}
	for i=1, getn(UnitFrames) do
		DET.Options.UnitFrame[i] = {}
		DET.Options.UnitFrame[i].Checkbox = CreateFrame("CheckButton",nil, DET.Options, "UICheckButtonTemplate")
		if i == 1 then DET.Options.UnitFrame[i].Checkbox:SetPoint("LEFT",DET.Options.Rogue.Checkbox,"RIGHT", 100, 0)
		else  DET.Options.UnitFrame[i].Checkbox:SetPoint("TOP",DET.Options.UnitFrame[i-1].Checkbox, "BOTTOM", 0, 5) end
		DET.Options.UnitFrame[i].Font = DET.Options.UnitFrame[i].Checkbox:CreateFontString(nil, "OVERLAY", "GameFontWhite")
		DET.Options.UnitFrame[i].Font:SetPoint("LEFT",DET.Options.UnitFrame[i].Checkbox,"RIGHT", 10, 0)
		DET.Options.UnitFrame[i].Font:SetText(UnitFrames[i])
		DET.Options.UnitFrame[i].Checkbox:SetScript("OnClick", function() 
			for j=1,7 do
				DET.Options.UnitFrame[j].Checkbox:SetChecked(nil)
			end
			this:SetChecked(1)
		end)
	end

	DET.Options:SetScale(0.8)
	DET.Options:Hide()
end

function DET:SetUnitFramesAnchor(UF)
	local UnitFrames = {
		[1] = "Default",
		[2] = "modui", 
		[3] = "pfUI",
		[4] = "LunaUnitFrames",
		[5] = "XPerl_Target",
		[6] = "DiscordUnitFrames",
		[7] = "UnitFramesImproved_Vanilla",
	}
	
	for j=1,7 do
		DET.Options.UnitFrame[j].Checkbox:SetChecked(nil)
	end
	
	if UF == "Default" then
		DET_settings.UF = UF
		DET.DebuffAnchor = "TargetFrameDebuff"; DET.BuffAnchor = "TargetFrameBuff"
		DET.Options.UnitFrame[1].Checkbox:SetChecked(1)
	elseif UF == "modui" and IsAddOnLoaded("modui") then 
		DET_settings.UF = UF
		DET.DebuffAnchor = "TargetFrameDebuff"; DET.BuffAnchor = "TargetFrameBuff"
		DET.Options.UnitFrame[2].Checkbox:SetChecked(1)
	elseif UF == "pfUI" and IsAddOnLoaded("pfUI") then
		DET_settings.UF = UF
		DET.DebuffAnchor = "pfUITargetDebuff"; DET.BuffAnchor = "pfUITargetBuff"
		DET.Options.UnitFrame[3].Checkbox:SetChecked(1)
	elseif UF == "LunaUnitFrames" and IsAddOnLoaded("LunaUnitFrames") then
		DET_settings.UF = UF
		DET.DebuffAnchor = "LunaLUFUnittargetDebuffFrame"; DET.BuffAnchor = "LunaLUFUnittargetBuffFrame"
		DET.Options.UnitFrame[4].Checkbox:SetChecked(1)
	elseif UF == "XPerl_Target" and IsAddOnLoaded("XPerl_Target") then
		DET_settings.UF = UF
		DET.DebuffAnchor = "XPerl_Target_BuffFrame_DeBuff"; DET.BuffAnchor = "XPerl_Target_BuffFrame_Buff"
		DET.Options.UnitFrame[5].Checkbox:SetChecked(1)
	elseif UF == "DiscordUnitFrames" and IsAddOnLoaded("DiscordUnitFrames") then
		DET_settings.UF = UF
		DET.DebuffAnchor = "DUF_TargetFrame_Debuffs_"; DET.BuffAnchor = "DUF_TargetFrame_Buffs_"
		DET.Options.UnitFrame[6].Checkbox:SetChecked(1)
	elseif UF == "UnitFramesImproved_Vanilla" and IsAddOnLoaded("UnitFramesImproved_Vanilla") then
		DET_settings.UF = UF
		DET.DebuffAnchor = "TargetFrameDebuff"; DET.BuffAnchor = "TargetFrameBuff"
		DET.Options.UnitFrame[7].Checkbox:SetChecked(1)
	else
		DET_settings.UF = "Default"
		DET.DebuffAnchor = "TargetFrameDebuff"; DET.BuffAnchor = "TargetFrameBuff"
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Debuff Timers:|r UnitFrame not found.|r",1,1,1)
		DET.Options.UnitFrame[1].Checkbox:SetChecked(1)
	end
	
	for i=1,16 do
		DET.Debuff[i].parent:SetParent(getglobal(DET.DebuffAnchor..i))
		DET.Debuff[i].parent:SetPoint("CENTER",getglobal(DET.DebuffAnchor..i),"CENTER", 0, 0)
		if getglobal(DET.DebuffAnchor..i) then DET.Debuff[i].parent:SetFrameLevel(getglobal(DET.DebuffAnchor..i):GetFrameLevel() + 1) end
		DET.Buff[i].parent:SetParent(getglobal(DET.BuffAnchor..i))
		DET.Buff[i].parent:SetPoint("CENTER",getglobal(DET.BuffAnchor..i),"CENTER", 0, 0)
		if getglobal(DET.BuffAnchor..i) then DET.Buff[i].parent:SetFrameLevel(getglobal(DET.BuffAnchor..i):GetFrameLevel() + 1) end
	end
end

function DET:SaveOptions()
	-- class settings
	if DET.Options.Warrior.Checkbox:GetChecked() then DET_settings.CLASS["WARRIOR"] = true else DET_settings.CLASS["WARRIOR"] = false end
	if DET.Options.Mage.Checkbox:GetChecked() then DET_settings.CLASS["MAGE"] = true else DET_settings.CLASS["MAGE"] = false end
	if DET.Options.Rogue.Checkbox:GetChecked() then DET_settings.CLASS["ROGUE"] = true else DET_settings.CLASS["ROGUE"] = false end
	if DET.Options.Druid.Checkbox:GetChecked() then DET_settings.CLASS["DRUID"] = true else DET_settings.CLASS["DRUID"] = false end
	if DET.Options.Hunter.Checkbox:GetChecked() then DET_settings.CLASS["HUNTER"] = true else DET_settings.CLASS["HUNTER"] = false end
	if DET.Options.Shaman.Checkbox:GetChecked() then DET_settings.CLASS["SHAMAN"] = true else DET_settings.CLASS["SHAMAN"] = false end
	if DET.Options.Priest.Checkbox:GetChecked() then DET_settings.CLASS["PRIEST"] = true else DET_settings.CLASS["PRIEST"] = false end
	if DET.Options.Warlock.Checkbox:GetChecked() then DET_settings.CLASS["WARLOCK"] = true else DET_settings.CLASS["WARLOCK"] = false end
	if DET.Options.Paladin.Checkbox:GetChecked() then DET_settings.CLASS["PALADIN"] = true else DET_settings.CLASS["PALADIN"] = false end
	
	-- text size settings
	DET_settings.TextSize = DET.Options.SizeEditBox:GetNumber()
	if DET_settings.TextSize < 1 then DET_settings.TextSize = 1; DET.Options.SizeEditBox:SetNumber(1) end
	DET_settings.OffsetX = tonumber(DET.Options.OffsetXEditBox:GetText())
	DET_settings.OffsetY = tonumber(DET.Options.OffsetYEditBox:GetText())
	
	for i=1,16 do
		DET.Debuff[i].Font:SetFont("Fonts\\ARIALN.TTF", DET_settings.TextSize, "OUTLINE")
		if getglobal("pfUITargetDebuff1") then DET.Debuff[i].Font:SetFont("Interface\\AddOns\\pfUI\\fonts\\homespun.ttf", DET_settings.TextSize, "OUTLINE") end
		DET.Debuff[i].Font:SetPoint("CENTER", DET_settings.OffsetX, DET_settings.OffsetY)
		
		DET.Buff[i].Font:SetFont("Fonts\\ARIALN.TTF", DET_settings.TextSize, "OUTLINE")
		if getglobal("pfUITargetBuff1") then DET.Buff[i].Font:SetFont("Interface\\AddOns\\pfUI\\fonts\\homespun.ttf", DET_settings.TextSize, "OUTLINE") end
		DET.Buff[i].Font:SetPoint("CENTER", DET_settings.OffsetX, DET_settings.OffsetY)
	end
	DET_settings.milliseconds = DET.Options.SecondsCheckbox:GetChecked()
	DET_settings.reverse = DET.Options.ReverseCheckbox:GetChecked()
	
	-- aura save options
	local classes = {
		[1] = "WARRIOR",
		[2] = "MAGE",
		[3] = "ROGUE",
		[4] = "DRUID",
		[5] = "HUNTER",
		[6] = "SHAMAN",
		[7] = "PRIEST",
		[8] = "WARLOCK",
		[9] = "PALADIN",
	}
	
	for i =1, 9 do
		local count = 0
		for effect, info in pairs(DET_Debuff[classes[i]].EFFECT) do
			count = count + 1
			if DET.ClassOptions[i].Spell[count]:GetChecked() then DET_settings.effects[classes[i]].effect[effect] = true
			else DET_settings.effects[classes[i]].effect[effect] = false end
		end
	end
	
	local UnitFrames = {
		[1] = "Default",
		[2] = "modui", 
		[3] = "pfUI",
		[4] = "LunaUnitFrames",
		[5] = "XPerl_Target",
		[6] = "DiscordUnitFrames",
		[7] = "UnitFramesImproved_Vanilla",
	}
	
	for i=1, getn(UnitFrames) do
		if DET.Options.UnitFrame[i].Checkbox:GetChecked() then
			DET:SetUnitFramesAnchor(UnitFrames[i])
			break
		end
	end
	-- renew database
	DET:UpdateDatabase()
	
	
	DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Debuff Timers:|r Options saved.|r",1,1,1)
	DET.Options:Hide()
end

function DET:OpenClassOption(class)
	for i=1,9 do DET.ClassOptions[i]:Hide() end
	getglobal("DET_ClassOptions_"..class):Show()
end

function DET:BuildClassWindow()
	
	local classes = {
		[1] = "WARRIOR",
		[2] = "MAGE",
		[3] = "ROGUE",
		[4] = "DRUID",
		[5] = "HUNTER",
		[6] = "SHAMAN",
		[7] = "PRIEST",
		[8] = "WARLOCK",
		[9] = "PALADIN",
	}
	DET.ClassOptions = {}
	
	for i =1, 9 do
		DET.ClassOptions[i] = CreateFrame("Frame","DET_ClassOptions_"..classes[i],DET.Options)
		DET.ClassOptions[i]:SetID(i)
		DET.ClassOptions[i]:SetPoint("TOPLEFT",DET.Options,"TOPRIGHT",0,0)
		DET.ClassOptions[i]:SetBackdrop(StaticPopup1:GetBackdrop())
		DET.ClassOptions[i]:SetMovable(true)
		DET.ClassOptions[i]:EnableMouse(true)
		DET.ClassOptions[i]:RegisterForDrag("LeftButton")
		DET.ClassOptions[i]:SetScript("OnDragStart", function() DET.Options:StartMoving() end)
		DET.ClassOptions[i]:SetScript("OnDragStop", function() DET.Options:StopMovingOrSizing() end)
		DET.ClassOptions[i]:SetHeight(320)
		DET.ClassOptions[i]:SetWidth(470)
		
		local count = 0
		local oddcount = 0
		for effect, info in pairs(DET_Debuff[classes[i]].EFFECT) do 
			count = count + 1
			if count == 1 then
				DET.ClassOptions[i].Spell = {}
				DET.ClassOptions[i].Spell[count] = CreateFrame("CheckButton",nil, DET.ClassOptions[i], "UICheckButtonTemplate")
				DET.ClassOptions[i].Spell[count]:SetPoint("TOPLEFT", 15, -15)
				oddcount = oddcount + 1
			else
				if math.mod(count, 2) == 0 then -- even
					DET.ClassOptions[i].Spell[count] = CreateFrame("CheckButton",nil, DET.ClassOptions[i].Spell[count-1], "UICheckButtonTemplate")
					DET.ClassOptions[i].Spell[count]:SetPoint("RIGHT", 220, 0)
				else -- odd
					DET.ClassOptions[i].Spell[count] = CreateFrame("CheckButton",nil, DET.ClassOptions[i].Spell[count-2], "UICheckButtonTemplate")
					DET.ClassOptions[i].Spell[count]:SetPoint("BOTTOM", 0, -28)
					oddcount = oddcount + 1
				end
			end
			
			DET.ClassOptions[i].Spell[count]:SetHeight(24)
			DET.ClassOptions[i].Spell[count]:SetWidth(24)
			DET.ClassOptions[i].Spell[count].Effect = effect
			DET.ClassOptions[i].Spell[count].Duration = DET_Debuff[classes[i]].EFFECT[effect].DURATION
			DET.ClassOptions[i].Spell[count]:SetChecked(DET_settings.effects[classes[i]].effect[effect])

			DET.ClassOptions[i].Spell[count].Icon = CreateFrame("Button",nil, DET.ClassOptions[i].Spell[count])
			DET.ClassOptions[i].Spell[count].Icon:SetHeight(24)
			DET.ClassOptions[i].Spell[count].Icon:SetWidth(24)
			DET.ClassOptions[i].Spell[count].Icon:SetPoint("LEFT", DET.ClassOptions[i].Spell[count], "RIGHT", 5, 0)
			DET.ClassOptions[i].Spell[count].Icon:SetNormalTexture("Interface\\Icons\\"..DET_Debuff[classes[i]].EFFECT[effect].ICON)
			DET.ClassOptions[i].Spell[count].Icon:SetPushedTexture("Interface\\Icons\\"..DET_Debuff[classes[i]].EFFECT[effect].ICON)
			
			DET.ClassOptions[i].Spell[count].Font = DET.ClassOptions[i].Spell[count].Icon:CreateFontString(nil, "OVERLAY","GameFontHighlight")
			DET.ClassOptions[i].Spell[count].Font:SetPoint("LEFT",DET.ClassOptions[i].Spell[count].Icon,"RIGHT", 10, 0)
			DET.ClassOptions[i].Spell[count].Font:SetText(effect)
			DET.ClassOptions[i].Spell[count].Font:SetJustifyH("LEFT")
			DET.ClassOptions[i].Spell[count].Font:SetJustifyV("CENTER")
			
			DET.ClassOptions[i]:SetHeight((oddcount*(28))+25)
		end
		
		DET.ClassOptions[i]:Hide()
	end
end

-- to detect talents
function DET:DatabasePreload()
	if CLASS == "MAGE" then
		local _, _, _, _, rank= GetTalentInfo(2, 10) -- improved scorch
		if rank == 3 then
			DET_Debuff[CLASS].EFFECT["Fire Vulnerability"] = {
				ICON = "Spell_Fire_SoulBurn",
				DURATION = 30,
			}
			
			DET_Debuff[CLASS].SPELL["Scorch"] = {
				DURATION = {30, 30, 30, 30, 30, 30, 30},
				EFFECT = "Fire Vulnerability",
			}
		end
		rank=nil
		local _, _, _, _, rank= GetTalentInfo(3, 10) -- improved blizzard
		if rank > 0 then
			DET_Debuff[CLASS].EFFECT["Blizzard"] = {
				ICON = "Spell_Frost_Icestorm",
				DURATION = 4.5
			}
			DET_Debuff[CLASS].SPELL["Blizzard"] = {
				DURATION = {4.5, 4.5, 4.5, 4.5, 4.5, 4.5},
				EFFECT = "Blizzard",
			}
		end
		rank=nil
		local _, _, _, _, rank= GetTalentInfo(3, 7) -- improved chilled
	--	ace:print(rank.." -rank (3,7)")
		if rank > 0 then
			DET_Debuff[CLASS].SPELL["Cone of Cold"].DURATION = {8+rank,8+rank,8+rank,8+rank,8+rank}
			DET_Debuff[CLASS].EFFECT["Chilled"].DURATION = 5+rank
			DET_Debuff[CLASS].SPELL["Frostbolt"].DURATION = {5+rank, 6+rank, 6+rank, 7+rank, 7+rank, 8+rank, 8+rank, 9+rank, 9+rank, 9+rank}
		end
		rank=nil
		local _, _, _, _, rank= GetTalentInfo(1, 11) -- improved counterspell
		if rank > 0 then DET_Debuff[CLASS].EFFECT["Counterspell - Silenced"].DURATION = 4 end
		rank=nil
		local _, _, _, _, rank= GetTalentInfo(3, 16) -- winters chill
		if rank > 0 then
			DET_Debuff[CLASS].EFFECT["Winter's Chill"] = {
				ICON = "Spell_Frost_ChillingBlast",
				DURATION = 15,
			}
		end
		rank=nil
	end
end