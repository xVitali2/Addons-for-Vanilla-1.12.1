-- UnitFrames Timer Module by Renew: https://github.com/Voidmenull/ --
----------------------------------------------------------------------

-- AUF = Aurae Unit Frames
-- damn you Bit and your setfenv -_-

local _G, _M = getfenv(0), {}
setfenv(1, setmetatable(_M, {__index=_G}))
local L = DebuffTimersLocal

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

CreateFrame('GameTooltip', 'AUF_Tooltip', nil, 'GameTooltipTemplate')

_G.AUF_settings = {}

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

local timers = {}

do
	local factor = {1, 1/2, 1/4, 0}

	function DiminishedDuration(unit, effect, full_duration)
		local class = DR_CLASS[effect]
		if class then
			StartDR(effect, unit)
			return full_duration * factor[timers[class .. '@' .. unit].DR]
		else
			return full_duration
		end
	end
end

function UnitDebuffs(unit)
	local debuffs = {}
	local i = 1
	while UnitDebuff(unit, i) do
		AUF_Tooltip:SetOwner(UIParent, 'ANCHOR_NONE')
		AUF_Tooltip:SetUnitDebuff(unit, i)
		debuffs[AUF_TooltipTextLeft1:GetText()] = true
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
	AUF_Tooltip:SetOwner(UIParent, 'ANCHOR_NONE')
	AUF_Tooltip:SetUnitDebuff(unit, position)

	return AUF_TooltipTextLeft1:GetText()
end

function SetActionRank(name, rank)
	local _, _, rank = strfind(rank or '', L["Rank (%d+)"])
	if rank and AUFdebuff.SPELL[name] and AUFdebuff.EFFECT[name] then
		AUFdebuff.EFFECT[AUFdebuff.SPELL[name].EFFECT or name].DURATION = AUFdebuff.SPELL[name].DURATION[tonumber(rank)]
	elseif rank and AUFdebuff.SPELL[name] and AUFdebuff.SPELL[name].EFFECT then
		AUFdebuff.EFFECT[AUFdebuff.SPELL[name].EFFECT or name].DURATION = AUFdebuff.SPELL[name].DURATION[tonumber(rank)]
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
				AUF_Tooltip:SetOwner(UIParent, 'ANCHOR_NONE')
				AUF_TooltipTextRight1:SetText()
				AUF_Tooltip:SetAction(slot)
				local name = AUF_TooltipTextLeft1:GetText()
				if L[name] then
					name = L[name]
					casting[name] = TARGET
					SetActionRank(name, AUF_TooltipTextRight1:GetText())
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
			if L[name] then
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
			if AUFdebuff.SPELL[action] then
				local effect = AUFdebuff.SPELL[action].EFFECT or action or AUFdebuff.SPELL[action]

				if AUFdebuff.EFFECT[effect] and (not IsPlayer(target) or EffectActive(effect, target)) then
					if pending[effect] then
						last_cast = nil
					else
						pending[effect] = {target=target, time=GetTime() + (AUFdebuff.SPELL[action].DELAY or 0)}
						last_cast = effect
					end
				end
			end
		end
		casting = {}
	end

	CreateFrame'Frame':SetScript('OnUpdate', function()
		for effect, info in pending do
			if GetTime() >= info.time  then
				StartTimer(effect, info.target, info.time)
				pending[effect] = nil
			end
		end
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
	local timer = timers[DR_CLASS[effect] .. '@' .. unit]
	if timer then
		timer.START = GetTime()
		timer.END = timer.START + 15
	end
end

function AuraGone(unit, effect)
	if AUFdebuff.EFFECT[effect] then
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
			for k, timer in timers do
				if timer.UNIT == unit and not debuffs[timer.EFFECT] then
					StopTimer(timer.EFFECT .. '@' .. timer.UNIT)
				end
			end
		end
	end
end

function CHAT_MSG_COMBAT_HOSTILE_DEATH()
	for unit in string.gfind(arg1, L["(.+) dies"]) do -- TODO does not work when xp is gained
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
	for k, timer in timers do
		if timer.END and t > timer.END then
			StopTimer(k)
			if DR_CLASS[timer.EFFECT] and not timer.DR then
				ActivateDRTimer(timer.EFFECT, timer.UNIT)
			end
		end
	end
end

function EffectActive(effect, unit)
	return timers[effect .. '@' .. unit] and true or false
end

function StartTimer(effect, unit, start)
	local key = effect .. '@' .. unit
	local timer = timers[key] or {}
	timers[key] = timer
	timer.EFFECT = effect
	timer.UNIT = unit
	timer.START = start
	timer.END = timer.START
	--ace:print(effect.."_EFF")
	--ace:print(AUFdebuff.EFFECT[effect].DURATION.."_DUR")
	local duration = 0
	if AUFdebuff.EFFECT[effect] and AUFdebuff.EFFECT[effect].DURATION then duration = AUFdebuff.EFFECT[effect].DURATION end
	local comboTime = 0
	if AUFdebuff.SPELL[effect] and AUFdebuff.SPELL[effect].COMBO and COMBO > 0 then
		comboTime = AUFdebuff.SPELL[effect].COMBO[COMBO]
		duration = duration + comboTime
	end
	
	if bonuses[effect] then
		duration = duration + bonuses[effect](duration)
	end
	
	if IsPlayer(unit) then
		timer.END = timer.END + DiminishedDuration(unit, effect, AUFdebuff.EFFECT[effect].PVP_DURATION or duration)
	else
		timer.END = timer.END + duration		
	end
	
	timer.stopped = nil
	--ace:print(duration.."_dur")
	AUF:UpdateDebuffs()
end

function StartDR(effect, unit)
	local key = DR_CLASS[effect] .. '@' .. unit
	local timer = timers[key] or {}

	if not timer.DR or timer.DR < 3 then
		timers[key] = timer

		timer.EFFECT = effect
		timer.UNIT = unit
		timer.START = nil
		timer.END = nil
		timer.DR = min(3, (timer.DR or 0) + 1)
	end
end

function PLAYER_REGEN_ENABLED()
	AbortUnitCasts()
	for k, timer in timers do
		if not IsPlayer(timer.UNIT) then
			StopTimer(k)
		end
	end
end

function StopTimer(key)
	if timers[key] then
		timers[key].stopped = GetTime()
		timers[key] = nil
	end
end

function UnitDied(unit)
	AbortUnitCasts(unit)
	for k, timer in timers do
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
			if L[effect] and AUFdebuff.EFFECT[L[effect]] then
				StartTimer(L[effect], unit, GetTime())
			end
		end
	end
	
	function CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE()
		if player[hostilePlayer(arg1)] == nil then player[hostilePlayer(arg1)] = true end -- wrong for pets
		 for unit, effect in string.gfind(arg1, L["(.+) is afflicted by (.+)%."]) do
			 if L[effect] and AUFdebuff.EFFECT[L[effect]] then
				 StartTimer(L[effect], unit, GetTime())
			 end
		 end
		for unit,_,_,effect in string.gfind(arg1, L["(.+) suffers (.-)% (.-)% damage from your (.+)."]) do
			if L[effect] and AUFdebuff.EFFECT[L[effect]] then
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
				return AUF_settings.arcanist and 15 or 0
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

function AUFPromt(msg)
	AUF.Options:Show()
end

_G.SLASH_DEBUFFTIMERS1 = '/DebuffTimers'
_G.SLASH_DEBUFFTIMERS2 = '/debufftimers'
SlashCmdList.DEBUFFTIMERS = AUFPromt

AUF = CreateFrame("Frame")
AUF.Debuff = CreateFrame("Frame")
AUF.Buff = CreateFrame("Frame",nil,UIParent)
AUF.DR = CreateFrame("Frame",nil,UIParent)
AUF:RegisterEvent("PLAYER_TARGET_CHANGED")
AUF:RegisterEvent("ADDON_LOADED")
AUF.UnitDebuff = UnitDebuff
AUF.UnitBuff = UnitBuff
AUF.UnitName = UnitName
AUF.Work = {}
AUF.Version = "0.9.2"

AUF.ClickCast = {}
AUF.DoubleCheck = {}

function AUF.Debuff:Build()
	for i=1,16 do
		AUF.Debuff[i] = CreateFrame("Model", "AUFDebuff"..i, nil, "CooldownFrameTemplate")
		AUF.Debuff[i].parent = CreateFrame("Frame", "AUFDebuff"..i.."Cooldown", getglobal("TargetFrameDebuff"..i))
		AUF.Debuff[i].parent:SetPoint("CENTER",getglobal("TargetFrameDebuff"..i),"CENTER", 0, 0)
		AUF.Debuff[i].parent:SetWidth(100)
		AUF.Debuff[i].parent:SetHeight(100)
		AUF.Debuff[i].parent:SetFrameStrata("DIALOG")
		if getglobal("TargetFrameDebuff"..i) then AUF.Debuff[i].parent:SetFrameLevel(getglobal("TargetFrameDebuff"..i):GetFrameLevel() + 1) end
		AUF.Debuff[i]:SetParent(AUF.Debuff[i].parent)
		AUF.Debuff[i]:SetAllPoints(AUF.Debuff[i].parent)
		AUF.Debuff[i].parent:SetScript("OnUpdate",nil)
		AUF.Debuff[i].Font = AUF.Debuff[i]:CreateFontString(nil, "OVERLAY")
		AUF.Debuff[i].Font:SetPoint("CENTER", AUF_settings.OffsetX, AUF_settings.OffsetY)
		AUF.Debuff[i].Font:SetFont("Fonts\\ARIALN.TTF", AUF_settings.TextSize, "OUTLINE")
		AUF.Debuff[i].Font:SetJustifyH("CENTER")
		AUF.Debuff[i].Font:SetTextColor(1,1,1)
		AUF.Debuff[i].Font:SetText("")
	end
end

function AUF.Buff:Build()
	for i=1,16 do
		AUF.Buff[i] = CreateFrame("Model", "AUFBuff"..i, nil, "CooldownFrameTemplate")
		AUF.Buff[i].parent = CreateFrame("Frame", "AUFBuff"..i.."Cooldown", getglobal("TargetFrameBuff"..i))
		AUF.Buff[i].parent:SetPoint("CENTER",getglobal("TargetFrameBuff"..i),"CENTER", 0, 0)
		AUF.Buff[i].parent:SetWidth(100)
		AUF.Buff[i].parent:SetHeight(100)
		AUF.Buff[i].parent:SetFrameStrata("DIALOG")
		if getglobal("TargetFrameBuff"..i) then AUF.Buff[i].parent:SetFrameLevel(getglobal("TargetFrameBuff"..i):GetFrameLevel() + 1) end
		AUF.Buff[i]:SetParent(AUF.Buff[i].parent)
		AUF.Buff[i]:SetAllPoints(AUF.Buff[i].parent)
		AUF.Buff[i].parent:SetScript("OnUpdate",nil)
		
		AUF.Buff[i].Font = AUF.Buff[i]:CreateFontString(nil, "OVERLAY")
		AUF.Buff[i].Font:SetPoint("CENTER", AUF_settings.OffsetX, AUF_settings.OffsetY)
		AUF.Buff[i].Font:SetFont("Fonts\\ARIALN.TTF", AUF_settings.TextSize, "OUTLINE")
		AUF.Buff[i].Font:SetJustifyH("CENTER")
		AUF.Buff[i].Font:SetTextColor(1,1,1)
		AUF.Buff[i].Font:SetText("")
		
	end
end

function AUF:UpdateFont(button,start,duration,style)
	
	if AUF_settings.TextSize == 1 then
		AUF.Debuff[button].Font:Hide()
		AUF.Buff[button].Font:Hide()
	else
		AUF.Debuff[button].Font:Show()
		AUF.Buff[button].Font:Show()
		local milliseconds = 0; if AUF_settings.milliseconds then milliseconds = 1 end
		
		if style == "Debuff" then
			AUF.Debuff[button].Duation = duration
			AUF.Debuff[button].parent:SetScript("OnUpdate",function()
				AUF.Debuff[button].Duation = AUF.Debuff[button].Duation - arg1
				
				if AUF.Debuff[button].Duation > 0 then
					AUF.Debuff[button].Font:SetText(AUF:round(AUF.Debuff[button].Duation,milliseconds))
					if AUF.Debuff[button].Duation > 3 then
						AUF.Debuff[button].Font:SetTextColor(1,1,1)
					else AUF.Debuff[button].Font:SetTextColor(1,0.4,0.4) end
				else
					AUF.Debuff[button].parent:SetScript("OnUpdate",nil)
				end

			end)
		elseif style == "Buff" then
			AUF.Buff[button].Duation = duration
			AUF.Buff[button].parent:SetScript("OnUpdate",function()
				AUF.Buff[button].Duation = AUF.Buff[button].Duation - arg1
				
				if AUF.Buff[button].Duation > 0 then
					AUF.Buff[button].Font:SetText(AUF:round(AUF.Buff[button].Duation,milliseconds))	
					if AUF.Buff[button].Duation > 3 then
						AUF.Buff[button].Font:SetTextColor(1,1,1)
					else AUF.Buff[button].Font:SetTextColor(1,0.4,0.4) end
						
				else
					AUF.Buff[button].parent:SetScript("OnUpdate",nil)
				end

			end)
		end
	end
end

function AUF:round(num, numDecimalPlaces)
	if numDecimalPlaces > 0 then
		AUF.Work.mult = 10^(numDecimalPlaces or 0)
		return string.format("%.1f",math.floor(num * AUF.Work.mult + 0.5) / AUF.Work.mult)
	else
		return math.floor(num)
	end
end

function AUF:OnEvent()
	if event == "PLAYER_TARGET_CHANGED" then
		AUF:OnTarget()
	elseif event == "UNIT_AURA" and arg1 == "target" then
		for _, timer in timers do
			timer.DOUBLE = nil -- clear double timers
		end
		AUF:UpdateDebuffs()
	elseif event == "ADDON_LOADED" and arg1 == "DebuffTimers" then
		AUF:DatabasePreload()
		AUF:UpdateSavedVariables()
		
		AUF:BuildOptions()
		AUF:BuildClassWindow()
		AUF:UpdateDatabase()
		
		AUF.Debuff:Build()
		AUF.Buff:Build()
		
		if AUF_settings.UF then AUF:SetUnitFramesAnchor(AUF_settings.UF)
		else AUF:SetUnitFramesAnchor("Default") end
	end
end
AUF:SetScript("OnEvent", AUF.OnEvent)

function AUF:OnTarget()
	if UnitExists("target") then
		AUF:RegisterEvent("UNIT_AURA")
		AUF:UpdateDebuffs()
	else
		AUF:UnregisterEvent("UNIT_AURA")
		for i=1,16 do -- xperl fade problem
			AUF.Debuff[i].parent:Hide()
			AUF.Buff[i].parent:Hide()
		end
	end
end

function AUF:UpdateDebuffs()
	-- close old animations
	for i=1,16 do
		CooldownFrame_SetTimer(AUF.Debuff[i],0,0,0)
		CooldownFrame_SetTimer(AUF.Buff[i],0,0,0)
	end
	-- delete old doublecheck
	for effect, _ in AUF.DoubleCheck do
		AUF.DoubleCheck[effect] = nil
	end
	
	if UnitExists("target") then
		for _, timer in timers do
			if not timer.DR and AUF.UnitName("target") == timer.UNIT then
				if timer.EFFECT=="Blizzard" then timer.EFFECT="Chilled" end
				for i=1,16 do
					local name = UnitDebuffText("target",i)
					if L[name] and L[name] == timer.EFFECT and getglobal(AUF.DebuffAnchor..i) and not AUF.DoubleCheck[timer.EFFECT] then
						if timer.EFFECT == "Intimidating Shout" then -- exception for doublecheck
						else
							AUF.DoubleCheck[timer.EFFECT] = true
						end
						-- xper exception
						if AUF.DebuffAnchor == "XPerl_Target_BuffFrame_DeBuff" then
							AUF.Debuff[i].parent:SetWidth(getglobal(AUF.DebuffAnchor..i):GetWidth()*0.7)
							AUF.Debuff[i].parent:SetHeight(getglobal(AUF.DebuffAnchor..i):GetHeight()*0.7)
							AUF.Debuff[i]:SetScale(getglobal(AUF.DebuffAnchor..i):GetHeight()/36*0.7)
						else
							AUF.Debuff[i].parent:SetWidth(getglobal(AUF.DebuffAnchor..i):GetWidth())
							AUF.Debuff[i].parent:SetHeight(getglobal(AUF.DebuffAnchor..i):GetHeight())
							AUF.Debuff[i]:SetScale(getglobal(AUF.DebuffAnchor..i):GetHeight()/36)
						end
						
						AUF.Debuff[i].parent:SetPoint("CENTER",getglobal(AUF.DebuffAnchor..i),"CENTER",0,0)
						getglobal(AUF.DebuffAnchor..i):SetID(i)
						getglobal(AUF.DebuffAnchor..i):SetScript("OnClick", function() CastSpellByName(UnitDebuffText("target",this:GetID())) end)
						AUF.Debuff[i].parent:Show()
						if AUF_settings.reverse then AUF.Debuff[i].reverse = 1 else AUF.Debuff[i].reverse = nil	end
						CooldownFrame_SetTimer(AUF.Debuff[i],timer.START, timer.END-timer.START,1)
						if not getglobal("pfUITargetDebuff1") then AUF:UpdateFont(i,timer.START,timer.END-GetTime(),"Debuff") end
					end
					
					if AUF.UnitBuff("target",i) == "Interface\\Icons\\"..AUFdebuff.EFFECT[timer.EFFECT].ICON and getglobal(AUF.BuffAnchor..i) then
						
						if  getglobal("XPerl_Target_BuffFrame") then
							AUF.Buff[i].parent:SetWidth(getglobal(AUF.BuffAnchor..i):GetWidth()*0.7)
							AUF.Buff[i].parent:SetHeight(getglobal(AUF.BuffAnchor..i):GetHeight()*0.7)
							AUF.Buff[i]:SetScale(getglobal(AUF.BuffAnchor..i):GetHeight()/36*0.7)
						else
							AUF.Buff[i].parent:SetWidth(getglobal(AUF.BuffAnchor..i):GetWidth())
							AUF.Buff[i].parent:SetHeight(getglobal(AUF.BuffAnchor..i):GetHeight())
							AUF.Buff[i]:SetScale(getglobal(AUF.BuffAnchor..i):GetHeight()/36)
						end
						AUF.Buff[i].parent:SetPoint("CENTER",getglobal(AUF.BuffAnchor..i),"CENTER",0,0)
						AUF.Buff[i].parent:Show()
						if AUF_settings.reverse then AUF.Buff[i].reverse = 1 else AUF.Buff[i].reverse = nil	end
						CooldownFrame_SetTimer(AUF.Buff[i],timer.START, timer.END-timer.START,1)
						if not getglobal("pfUITargetBuff1") then AUF:UpdateFont(i,timer.START,timer.END-GetTime(),"Buff") end
					end
				end
			end
		end
	end
end

function AUF:UpdateSavedVariables()
	if not AUF_settings then AUF_settings = {} end
	if not AUF_settings.TextSize then AUF_settings.TextSize = 20 end
	if not AUF_settings.effects then AUF_settings.effects = {} end
	if not AUF_settings.milliseconds then AUF_settings.milliseconds = false end
	if not AUF_settings.reverse then AUF_settings.reverse = false end
	if not AUF_settings.OffsetX then AUF_settings.OffsetX = 0 end
	if not AUF_settings.OffsetY then AUF_settings.OffsetY = 0 end
	
	if not AUF_settings.CLASS then AUF_settings.CLASS = {} end
	if not AUF_settings.CLASS[CLASS] and AUF_settings.CLASS[CLASS] ~= false then AUF_settings.CLASS[CLASS] = true end
	if not AUF_settings.CLASS["WARRIOR"] then AUF_settings.CLASS["WARRIOR"] = false end
	if not AUF_settings.CLASS["MAGE"] then AUF_settings.CLASS["MAGE"] = false end
	if not AUF_settings.CLASS["ROGUE"] then AUF_settings.CLASS["ROGUE"] = false end
	if not AUF_settings.CLASS["DRUID"] then AUF_settings.CLASS["DRUID"] = false end
	if not AUF_settings.CLASS["HUNTER"] then AUF_settings.CLASS["HUNTER"] = false end
	if not AUF_settings.CLASS["SHAMAN"] then AUF_settings.CLASS["SHAMAN"] = false end
	if not AUF_settings.CLASS["PRIEST"] then AUF_settings.CLASS["PRIEST"] = false end
	if not AUF_settings.CLASS["WARLOCK"] then AUF_settings.CLASS["WARLOCK"] = false end
	if not AUF_settings.CLASS["PALADIN"] then AUF_settings.CLASS["PALADIN"] = false end
	
	-- check for database spells and enable them if new
	for class,effects in pairs(AUF_Debuff) do
		if not AUF_settings.effects[class] then AUF_settings.effects[class] = {} end
		for aura, _ in pairs(AUF_Debuff[class].EFFECT) do 
			if not AUF_settings.effects[class].effect then AUF_settings.effects[class].effect = {} end
			if not AUF_settings.effects[class].effect[aura] and AUF_settings.effects[class].effect[aura] ~= false then AUF_settings.effects[class].effect[aura] = true end
		end
	end
	
	if not AUF_settings.UF then
		AUF_settings.UF = "Default"
		
		if IsAddOnLoaded("modui") then AUF_settings.UF = "modui"
		elseif IsAddOnLoaded("pfUI") then AUF_settings.UF = "pfUI"
		elseif IsAddOnLoaded("LunaUnitFrames") then AUF_settings.UF = "LunaUnitFrames"
		elseif IsAddOnLoaded("XPerl_Target") then AUF_settings.UF = "XPerl_Target"
		elseif IsAddOnLoaded("DiscordUnitFrames") then AUF_settings.UF = "DiscordUnitFrames"
		elseif IsAddOnLoaded("UnitFramesImproved_Vanilla") then AUF_settings.UF = "UnitFramesImproved_Vanilla" end
	end
	
end

function AUF:UpdateDatabase()
	AUFdebuff = {}
	AUFdebuff.SPELL = {}
	AUFdebuff.EFFECT = {}
	for class,effects in pairs(AUF_Debuff) do
		if AUF_settings.CLASS[class] then
			for effect, info in pairs(effects) do
				for name, tab in pairs(info) do
					if effect == "EFFECT" and AUF_settings.effects[class].effect[name] then
						AUFdebuff.EFFECT[name] = AUF_Debuff[class].EFFECT[name]
					elseif effect == "SPELL" then
						AUFdebuff.SPELL[name] = AUF_Debuff[class].SPELL[name]
					end
				end
			end
		end
	end
end

-- UI Options

function AUF:BuildOptions()
	AUF.Options = CreateFrame("Frame",nil,UIParent)
	AUF.Options:SetPoint("CENTER",0,0)
	AUF.Options:SetBackdrop(StaticPopup1:GetBackdrop())
	AUF.Options:SetMovable(true)
	AUF.Options:EnableMouse(true)
	AUF.Options:RegisterForDrag("LeftButton")
	AUF.Options:SetScript("OnDragStart", function() AUF.Options:StartMoving() end)
	AUF.Options:SetScript("OnDragStop", function() AUF.Options:StopMovingOrSizing() end)
	AUF.Options:SetHeight(450)
	AUF.Options:SetWidth(600)
	
	AUF.Options.CloseButton = CreateFrame("Button",nil, AUF.Options, "UIPanelCloseButton")
	AUF.Options.CloseButton:SetPoint("TOPRIGHT", -5, -5)
	AUF.Options.CloseButton:SetScript("OnClick", function() AUF.Options:Hide() end)
	 
	AUF.Options.Headline = AUF.Options:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	AUF.Options.Headline:SetPoint("TOP", 0, -15)
	AUF.Options.Headline:SetText("DebuffTimers Options")
	
	AUF.Options.DebuffFont = AUF.Options:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	AUF.Options.DebuffFont:SetPoint("TOPLEFT", 20, -35)
	AUF.Options.DebuffFont:SetText("Show Debuffs:")
	
	AUF.Options.Warrior = {}
	AUF.Options.Warrior.Checkbox = CreateFrame("CheckButton",nil, AUF.Options, "UICheckButtonTemplate")
	AUF.Options.Warrior.Checkbox:SetPoint("TOPLEFT", 20, -70)
	AUF.Options.Warrior.Checkbox:SetChecked(AUF_settings.CLASS["WARRIOR"])
	AUF.Options.Warrior.Button = CreateFrame("CheckButton",nil, AUF.Options.Warrior.Checkbox, "UIPanelButtonTemplate")
	AUF.Options.Warrior.Button:SetHeight(48)
	AUF.Options.Warrior.Button:SetWidth(48)
	AUF.Options.Warrior.Button:SetPoint("LEFT", AUF.Options.Warrior.Checkbox, "RIGHT", 5, 0)
	AUF.Options.Warrior.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Warrior.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Warrior.Button:GetNormalTexture():SetTexCoord(0,0.25,0,0.25)
	AUF.Options.Warrior.Button:GetPushedTexture():SetTexCoord(0,0.25,0,0.25)
	AUF.Options.Warrior.Button:SetScript("OnClick", function() 
		if not getglobal("AUF_ClassOptions_".."WARRIOR"):IsVisible() then AUF:OpenClassOption("WARRIOR")
		else getglobal("AUF_ClassOptions_".."WARRIOR"):Hide() end
		end)
	
	AUF.Options.Mage = {}
	AUF.Options.Mage.Checkbox = CreateFrame("CheckButton",nil, AUF.Options.Warrior.Checkbox, "UICheckButtonTemplate")
	AUF.Options.Mage.Checkbox:SetPoint("RIGHT", 100, 0)
	AUF.Options.Mage.Checkbox:SetChecked(AUF_settings.CLASS["MAGE"])
	AUF.Options.Mage.Button = CreateFrame("CheckButton",nil, AUF.Options.Mage.Checkbox, "UIPanelButtonTemplate")
	AUF.Options.Mage.Button:SetHeight(48)
	AUF.Options.Mage.Button:SetWidth(48)
	AUF.Options.Mage.Button:SetPoint("LEFT", AUF.Options.Mage.Checkbox, "RIGHT", 5, 0)
	AUF.Options.Mage.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Mage.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Mage.Button:GetNormalTexture():SetTexCoord(0.25,0.5,0,0.25)
	AUF.Options.Mage.Button:GetPushedTexture():SetTexCoord(0.25,0.5,0,0.25)
	AUF.Options.Mage.Button:SetScript("OnClick", function() 
		if not getglobal("AUF_ClassOptions_".."MAGE"):IsVisible() then AUF:OpenClassOption("MAGE")
		else getglobal("AUF_ClassOptions_".."MAGE"):Hide() end
		end)
	
	AUF.Options.Rogue = {}
	AUF.Options.Rogue.Checkbox = CreateFrame("CheckButton",nil, AUF.Options.Mage.Checkbox, "UICheckButtonTemplate")
	AUF.Options.Rogue.Checkbox:SetPoint("RIGHT", 100, 0)
	AUF.Options.Rogue.Checkbox:SetChecked(AUF_settings.CLASS["ROGUE"])
	AUF.Options.Rogue.Button = CreateFrame("CheckButton",nil, AUF.Options.Rogue.Checkbox, "UIPanelButtonTemplate")
	AUF.Options.Rogue.Button:SetHeight(48)
	AUF.Options.Rogue.Button:SetWidth(48)
	AUF.Options.Rogue.Button:SetPoint("LEFT", AUF.Options.Rogue.Checkbox, "RIGHT", 5, 0)
	AUF.Options.Rogue.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Rogue.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Rogue.Button:GetNormalTexture():SetTexCoord(0.5,0.75,0,0.25)
	AUF.Options.Rogue.Button:GetPushedTexture():SetTexCoord(0.5,0.75,0,0.25)
	AUF.Options.Rogue.Button:SetScript("OnClick", function() 
		if not getglobal("AUF_ClassOptions_".."ROGUE"):IsVisible() then AUF:OpenClassOption("ROGUE")
		else getglobal("AUF_ClassOptions_".."ROGUE"):Hide() end
		end)
	
	AUF.Options.Druid = {}
	AUF.Options.Druid.Checkbox = CreateFrame("CheckButton",nil, AUF.Options.Warrior.Checkbox, "UICheckButtonTemplate")
	AUF.Options.Druid.Checkbox:SetPoint("BOTTOM", 0, -60)
	AUF.Options.Druid.Checkbox:SetChecked(AUF_settings.CLASS["DRUID"])
	AUF.Options.Druid.Button = CreateFrame("CheckButton",nil, AUF.Options.Druid.Checkbox, "UIPanelButtonTemplate")
	AUF.Options.Druid.Button:SetHeight(48)
	AUF.Options.Druid.Button:SetWidth(48)
	AUF.Options.Druid.Button:SetPoint("LEFT", AUF.Options.Druid.Checkbox, "RIGHT", 5, 0)
	AUF.Options.Druid.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Druid.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Druid.Button:GetNormalTexture():SetTexCoord(0.75,1,0,0.25)
	AUF.Options.Druid.Button:GetPushedTexture():SetTexCoord(0.75,1,0,0.25)
	AUF.Options.Druid.Button:SetScript("OnClick", function() 
		if not getglobal("AUF_ClassOptions_".."DRUID"):IsVisible() then AUF:OpenClassOption("DRUID")
		else getglobal("AUF_ClassOptions_".."DRUID"):Hide() end
		end)
	
	AUF.Options.Hunter = {}
	AUF.Options.Hunter.Checkbox = CreateFrame("CheckButton",nil, AUF.Options.Druid.Checkbox, "UICheckButtonTemplate")
	AUF.Options.Hunter.Checkbox:SetPoint("RIGHT", 100, 0)
	AUF.Options.Hunter.Checkbox:SetChecked(AUF_settings.CLASS["HUNTER"])
	AUF.Options.Hunter.Button = CreateFrame("CheckButton",nil, AUF.Options.Hunter.Checkbox, "UIPanelButtonTemplate")
	AUF.Options.Hunter.Button:SetHeight(48)
	AUF.Options.Hunter.Button:SetWidth(48)
	AUF.Options.Hunter.Button:SetPoint("LEFT", AUF.Options.Hunter.Checkbox, "RIGHT", 5, 0)
	AUF.Options.Hunter.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Hunter.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Hunter.Button:GetNormalTexture():SetTexCoord(0,0.25,0.25,0.5)
	AUF.Options.Hunter.Button:GetPushedTexture():SetTexCoord(0,0.25,0.25,0.5)
	AUF.Options.Hunter.Button:SetScript("OnClick", function() 
		if not getglobal("AUF_ClassOptions_".."HUNTER"):IsVisible() then AUF:OpenClassOption("HUNTER")
		else getglobal("AUF_ClassOptions_".."HUNTER"):Hide() end
		end)
	
	AUF.Options.Shaman = {}
	AUF.Options.Shaman.Checkbox = CreateFrame("CheckButton",nil, AUF.Options.Hunter.Checkbox, "UICheckButtonTemplate")
	AUF.Options.Shaman.Checkbox:SetPoint("RIGHT", 100, 0)
	AUF.Options.Shaman.Checkbox:SetChecked(AUF_settings.CLASS["SHAMAN"])
	AUF.Options.Shaman.Button = CreateFrame("CheckButton",nil, AUF.Options.Shaman.Checkbox, "UIPanelButtonTemplate")
	AUF.Options.Shaman.Button:SetHeight(48)
	AUF.Options.Shaman.Button:SetWidth(48)
	AUF.Options.Shaman.Button:SetPoint("LEFT", AUF.Options.Shaman.Checkbox, "RIGHT", 5, 0)
	AUF.Options.Shaman.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Shaman.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Shaman.Button:GetNormalTexture():SetTexCoord(0.25,0.50,0.25,0.5)
	AUF.Options.Shaman.Button:GetPushedTexture():SetTexCoord(0.25,0.50,0.25,0.5)
	AUF.Options.Shaman.Button:SetScript("OnClick", function() 
		if not getglobal("AUF_ClassOptions_".."SHAMAN"):IsVisible() then AUF:OpenClassOption("SHAMAN")
		else getglobal("AUF_ClassOptions_".."SHAMAN"):Hide() end
		end)
	
	AUF.Options.Priest = {}
	AUF.Options.Priest.Checkbox = CreateFrame("CheckButton",nil, AUF.Options.Druid.Checkbox, "UICheckButtonTemplate")
	AUF.Options.Priest.Checkbox:SetPoint("BOTTOM", 0, -60)
	AUF.Options.Priest.Checkbox:SetChecked(AUF_settings.CLASS["PRIEST"])
	AUF.Options.Priest.Button = CreateFrame("CheckButton",nil, AUF.Options.Priest.Checkbox, "UIPanelButtonTemplate")
	AUF.Options.Priest.Button:SetHeight(48)
	AUF.Options.Priest.Button:SetWidth(48)
	AUF.Options.Priest.Button:SetPoint("LEFT", AUF.Options.Priest.Checkbox, "RIGHT", 5, 0)
	AUF.Options.Priest.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Priest.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Priest.Button:GetNormalTexture():SetTexCoord(0.50,0.75,0.25,0.5)
	AUF.Options.Priest.Button:GetPushedTexture():SetTexCoord(0.50,0.75,0.25,0.5)
	AUF.Options.Priest.Button:SetScript("OnClick", function() 
		if not getglobal("AUF_ClassOptions_".."PRIEST"):IsVisible() then AUF:OpenClassOption("PRIEST")
		else getglobal("AUF_ClassOptions_".."PRIEST"):Hide() end
		end)
	
	AUF.Options.Warlock = {}
	AUF.Options.Warlock.Checkbox = CreateFrame("CheckButton",nil, AUF.Options.Priest.Checkbox, "UICheckButtonTemplate")
	AUF.Options.Warlock.Checkbox:SetPoint("RIGHT", 100, 0)
	AUF.Options.Warlock.Checkbox:SetChecked(AUF_settings.CLASS["WARLOCK"])
	AUF.Options.Warlock.Button = CreateFrame("CheckButton",nil, AUF.Options.Warlock.Checkbox, "UIPanelButtonTemplate")
	AUF.Options.Warlock.Button:SetHeight(48)
	AUF.Options.Warlock.Button:SetWidth(48)
	AUF.Options.Warlock.Button:SetPoint("LEFT", AUF.Options.Warlock.Checkbox, "RIGHT", 5, 0)
	AUF.Options.Warlock.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Warlock.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Warlock.Button:GetNormalTexture():SetTexCoord(0.75,1,0.25,0.5)
	AUF.Options.Warlock.Button:GetPushedTexture():SetTexCoord(0.75,1,0.25,0.5)
	AUF.Options.Warlock.Button:SetScript("OnClick", function() 
		if not getglobal("AUF_ClassOptions_".."WARLOCK"):IsVisible() then AUF:OpenClassOption("WARLOCK")
		else getglobal("AUF_ClassOptions_".."WARLOCK"):Hide() end
		end)
	
	AUF.Options.Paladin = {}
	AUF.Options.Paladin.Checkbox = CreateFrame("CheckButton",nil, AUF.Options.Warlock.Checkbox, "UICheckButtonTemplate")
	AUF.Options.Paladin.Checkbox:SetPoint("RIGHT", 100, 0)
	AUF.Options.Paladin.Checkbox:SetChecked(AUF_settings.CLASS["PALADIN"])
	AUF.Options.Paladin.Button = CreateFrame("CheckButton",nil, AUF.Options.Paladin.Checkbox, "UIPanelButtonTemplate")
	AUF.Options.Paladin.Button:SetHeight(48)
	AUF.Options.Paladin.Button:SetWidth(48)
	AUF.Options.Paladin.Button:SetPoint("LEFT", AUF.Options.Paladin.Checkbox, "RIGHT", 5, 0)
	AUF.Options.Paladin.Button:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Paladin.Button:SetPushedTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
	AUF.Options.Paladin.Button:GetNormalTexture():SetTexCoord(0,0.25,0.5,0.75)
	AUF.Options.Paladin.Button:GetPushedTexture():SetTexCoord(0,0.25,0.5,0.75)
	AUF.Options.Paladin.Button:SetScript("OnClick", function() 
		if not getglobal("AUF_ClassOptions_".."PALADIN"):IsVisible() then AUF:OpenClassOption("PALADIN")
		else getglobal("AUF_ClassOptions_".."PALADIN"):Hide() end
		end)
	
	AUF.Options.SizeFont = AUF.Options.Priest.Button:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	AUF.Options.SizeFont:SetPoint("BOTTOM", 0, -35)
	AUF.Options.SizeFont:SetText("Timer Textsize:")
	
	AUF.Options.SizeEditBox = CreateFrame("EditBox", "AUFSizeEditBox", AUF.Options.Priest.Button, "InputBoxTemplate")
	AUF.Options.SizeEditBox:SetWidth(25)
	AUF.Options.SizeEditBox:SetHeight(20)
	AUF.Options.SizeEditBox:SetPoint("LEFT", AUF.Options.SizeFont, "RIGHT", 15, 0)
	AUF.Options.SizeEditBox:SetMaxLetters(2)
	AUF.Options.SizeEditBox:SetAutoFocus(false)
	AUF.Options.SizeEditBox:SetNumeric(1)
	AUF.Options.SizeEditBox:SetNumber(AUF_settings.TextSize)
	
	AUF.Options.OffsetXFont = AUF.Options.Priest.Button:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	AUF.Options.OffsetXFont:SetPoint("TOPLEFT",AUF.Options.SizeFont,"BOTTOMLEFT", 0, -15)
	AUF.Options.OffsetXFont:SetText("Timer Offset X:")
	
	AUF.Options.OffsetXEditBox = CreateFrame("EditBox", "AUFOffsetXEditBox", AUF.Options.Priest.Button, "InputBoxTemplate")
	AUF.Options.OffsetXEditBox:SetWidth(25)
	AUF.Options.OffsetXEditBox:SetHeight(20)
	AUF.Options.OffsetXEditBox:SetPoint("LEFT", AUF.Options.OffsetXFont, "RIGHT", 15, 0)
	AUF.Options.OffsetXEditBox:SetMaxLetters(3)
	AUF.Options.OffsetXEditBox:SetAutoFocus(false)
	AUF.Options.OffsetXEditBox:SetText(AUF_settings.OffsetX)
	
	AUF.Options.OffsetYFont = AUF.Options.Priest.Button:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	AUF.Options.OffsetYFont:SetPoint("TOPLEFT",AUF.Options.OffsetXFont,"BOTTOMLEFT", 0, -15)
	AUF.Options.OffsetYFont:SetText("Timer Offset Y:")
	
	AUF.Options.OffsetYEditBox = CreateFrame("EditBox", "AUFOffsetYEditBox", AUF.Options.Priest.Button, "InputBoxTemplate")
	AUF.Options.OffsetYEditBox:SetWidth(25)
	AUF.Options.OffsetYEditBox:SetHeight(20)
	AUF.Options.OffsetYEditBox:SetPoint("LEFT", AUF.Options.OffsetYFont , "RIGHT", 15, 0)
	AUF.Options.OffsetYEditBox:SetMaxLetters(3)
	AUF.Options.OffsetYEditBox:SetAutoFocus(false)
	AUF.Options.OffsetYEditBox:SetText(AUF_settings.OffsetY)
	
	AUF.Options.SecondsFont = AUF.Options.Priest.Button:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	AUF.Options.SecondsFont:SetPoint("TOPLEFT",AUF.Options.OffsetYFont,"BOTTOMLEFT", 0, -15)
	AUF.Options.SecondsFont:SetText("Show milliseconds:")
	
	AUF.Options.SecondsCheckbox = CreateFrame("CheckButton",nil, AUF.Options, "UICheckButtonTemplate")
	AUF.Options.SecondsCheckbox:SetPoint("LEFT",AUF.Options.SecondsFont,"RIGHT", 10, 0)
	AUF.Options.SecondsCheckbox:SetChecked(AUF_settings.milliseconds)
	
	AUF.Options.ReverseFont = AUF.Options.Priest.Button:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	AUF.Options.ReverseFont:SetPoint("TOPLEFT",AUF.Options.SecondsFont ,"BOTTOMLEFT", 0, -15)
	AUF.Options.ReverseFont:SetText("Reverse Cooldown:")
	
	AUF.Options.ReverseCheckbox = CreateFrame("CheckButton",nil, AUF.Options, "UICheckButtonTemplate")
	AUF.Options.ReverseCheckbox:SetPoint("LEFT",AUF.Options.ReverseFont,"RIGHT", 10, 0)
	AUF.Options.ReverseCheckbox:SetChecked(AUF_settings.reverse)
	
	AUF.Options.OkButton = CreateFrame("CheckButton",nil, AUF.Options, "UIPanelButtonTemplate")
	AUF.Options.OkButton:SetHeight(30)
	AUF.Options.OkButton:SetWidth(100)
	AUF.Options.OkButton:SetPoint("BOTTOM", 0, 30)
	AUF.Options.OkButton:SetText("Save")
	AUF.Options.OkButton:SetScript("OnClick", function() AUF:SaveOptions() end)
	
	AUF.Options.VersionText = AUF.Options:CreateFontString(nil, "OVERLAY","GameFontNormal")
	AUF.Options.VersionText:SetPoint("BOTTOM", 5, 15)
	AUF.Options.VersionText:SetTextHeight(12)
	AUF.Options.VersionText:SetTextColor(1,0.8,0,0.7)
	AUF.Options.VersionText:SetJustifyH("CENTER")
	AUF.Options.VersionText:SetText("Version: "..AUF.Version.." by Renew @ github.com/Voidmenull")
	
	AUF.Options.UnitFrameFont = AUF.Options:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	AUF.Options.UnitFrameFont:SetPoint("LEFT",AUF.Options.DebuffFont,"RIGHT", 220, 0)
	AUF.Options.UnitFrameFont:SetText("Choose UnitFrame:")
	
	local UnitFrames = {
		[1] = "Default",
		[2] = "modui", 
		[3] = "pfUI",
		[4] = "LunaUnitFrames",
		[5] = "XPerl_Target",
		[6] = "DiscordUnitFrames",
		[7] = "UnitFramesImproved_Vanilla",
	}
	
	AUF.Options.UnitFrame = {}
	for i=1, getn(UnitFrames) do
		AUF.Options.UnitFrame[i] = {}
		AUF.Options.UnitFrame[i].Checkbox = CreateFrame("CheckButton",nil, AUF.Options, "UICheckButtonTemplate")
		if i == 1 then AUF.Options.UnitFrame[i].Checkbox:SetPoint("LEFT",AUF.Options.Rogue.Checkbox,"RIGHT", 100, 0)
		else  AUF.Options.UnitFrame[i].Checkbox:SetPoint("TOP",AUF.Options.UnitFrame[i-1].Checkbox, "BOTTOM", 0, 5) end
		AUF.Options.UnitFrame[i].Font = AUF.Options.UnitFrame[i].Checkbox:CreateFontString(nil, "OVERLAY", "GameFontWhite")
		AUF.Options.UnitFrame[i].Font:SetPoint("LEFT",AUF.Options.UnitFrame[i].Checkbox,"RIGHT", 10, 0)
		AUF.Options.UnitFrame[i].Font:SetText(UnitFrames[i])
		AUF.Options.UnitFrame[i].Checkbox:SetScript("OnClick", function() 
			for j=1,7 do
				AUF.Options.UnitFrame[j].Checkbox:SetChecked(nil)
			end
			this:SetChecked(1)
		end)
	end

	AUF.Options:SetScale(0.8)
	AUF.Options:Hide()
end

function AUF:SetUnitFramesAnchor(UF)
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
		AUF.Options.UnitFrame[j].Checkbox:SetChecked(nil)
	end
	
	if UF == "Default" then
		AUF_settings.UF = UF
		AUF.DebuffAnchor = "TargetFrameDebuff"; AUF.BuffAnchor = "TargetFrameBuff"
		AUF.Options.UnitFrame[1].Checkbox:SetChecked(1)
	elseif UF == "modui" and IsAddOnLoaded("modui") then 
		AUF_settings.UF = UF
		AUF.DebuffAnchor = "TargetFrameDebuff"; AUF.BuffAnchor = "TargetFrameBuff"
		AUF.Options.UnitFrame[2].Checkbox:SetChecked(1)
	elseif UF == "pfUI" and IsAddOnLoaded("pfUI") then
		AUF_settings.UF = UF
		AUF.DebuffAnchor = "pfUITargetDebuff"; AUF.BuffAnchor = "pfUITargetBuff"
		AUF.Options.UnitFrame[3].Checkbox:SetChecked(1)
	elseif UF == "LunaUnitFrames" and IsAddOnLoaded("LunaUnitFrames") then
		AUF_settings.UF = UF
		AUF.DebuffAnchor = "LunaLUFUnittargetDebuffFrame"; AUF.BuffAnchor = "LunaLUFUnittargetBuffFrame"
		AUF.Options.UnitFrame[4].Checkbox:SetChecked(1)
	elseif UF == "XPerl_Target" and IsAddOnLoaded("XPerl_Target") then
		AUF_settings.UF = UF
		AUF.DebuffAnchor = "XPerl_Target_BuffFrame_DeBuff"; AUF.BuffAnchor = "XPerl_Target_BuffFrame_Buff"
		AUF.Options.UnitFrame[5].Checkbox:SetChecked(1)
	elseif UF == "DiscordUnitFrames" and IsAddOnLoaded("DiscordUnitFrames") then
		AUF_settings.UF = UF
		AUF.DebuffAnchor = "DUF_TargetFrame_Debuffs_"; AUF.BuffAnchor = "DUF_TargetFrame_Buffs_"
		AUF.Options.UnitFrame[6].Checkbox:SetChecked(1)
	elseif UF == "UnitFramesImproved_Vanilla" and IsAddOnLoaded("UnitFramesImproved_Vanilla") then
		AUF_settings.UF = UF
		AUF.DebuffAnchor = "TargetFrameDebuff"; AUF.BuffAnchor = "TargetFrameBuff"
		AUF.Options.UnitFrame[7].Checkbox:SetChecked(1)
	else
		AUF_settings.UF = "Default"
		AUF.DebuffAnchor = "TargetFrameDebuff"; AUF.BuffAnchor = "TargetFrameBuff"
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Debuff Timers:|r UnitFrame not found.|r",1,1,1)
		AUF.Options.UnitFrame[1].Checkbox:SetChecked(1)
	end
	
	for i=1,16 do
		AUF.Debuff[i].parent:SetParent(getglobal(AUF.DebuffAnchor..i))
		AUF.Debuff[i].parent:SetPoint("CENTER",getglobal(AUF.DebuffAnchor..i),"CENTER", 0, 0)
		if getglobal(AUF.DebuffAnchor..i) then AUF.Debuff[i].parent:SetFrameLevel(getglobal(AUF.DebuffAnchor..i):GetFrameLevel() + 1) end
		AUF.Buff[i].parent:SetParent(getglobal(AUF.BuffAnchor..i))
		AUF.Buff[i].parent:SetPoint("CENTER",getglobal(AUF.BuffAnchor..i),"CENTER", 0, 0)
		if getglobal(AUF.BuffAnchor..i) then AUF.Buff[i].parent:SetFrameLevel(getglobal(AUF.BuffAnchor..i):GetFrameLevel() + 1) end
	end
end

function AUF:SaveOptions()
	-- class settings
	if AUF.Options.Warrior.Checkbox:GetChecked() then AUF_settings.CLASS["WARRIOR"] = true else AUF_settings.CLASS["WARRIOR"] = false end
	if AUF.Options.Mage.Checkbox:GetChecked() then AUF_settings.CLASS["MAGE"] = true else AUF_settings.CLASS["MAGE"] = false end
	if AUF.Options.Rogue.Checkbox:GetChecked() then AUF_settings.CLASS["ROGUE"] = true else AUF_settings.CLASS["ROGUE"] = false end
	if AUF.Options.Druid.Checkbox:GetChecked() then AUF_settings.CLASS["DRUID"] = true else AUF_settings.CLASS["DRUID"] = false end
	if AUF.Options.Hunter.Checkbox:GetChecked() then AUF_settings.CLASS["HUNTER"] = true else AUF_settings.CLASS["HUNTER"] = false end
	if AUF.Options.Shaman.Checkbox:GetChecked() then AUF_settings.CLASS["SHAMAN"] = true else AUF_settings.CLASS["SHAMAN"] = false end
	if AUF.Options.Priest.Checkbox:GetChecked() then AUF_settings.CLASS["PRIEST"] = true else AUF_settings.CLASS["PRIEST"] = false end
	if AUF.Options.Warlock.Checkbox:GetChecked() then AUF_settings.CLASS["WARLOCK"] = true else AUF_settings.CLASS["WARLOCK"] = false end
	if AUF.Options.Paladin.Checkbox:GetChecked() then AUF_settings.CLASS["PALADIN"] = true else AUF_settings.CLASS["PALADIN"] = false end
	
	-- text size settings
	AUF_settings.TextSize = AUF.Options.SizeEditBox:GetNumber()
	if AUF_settings.TextSize < 1 then AUF_settings.TextSize = 1; AUF.Options.SizeEditBox:SetNumber(1) end
	AUF_settings.OffsetX = tonumber(AUF.Options.OffsetXEditBox:GetText())
	AUF_settings.OffsetY = tonumber(AUF.Options.OffsetYEditBox:GetText())
	
	for i=1,16 do
		AUF.Debuff[i].Font:SetFont("Fonts\\ARIALN.TTF", AUF_settings.TextSize, "OUTLINE")
		if getglobal("pfUITargetDebuff1") then AUF.Debuff[i].Font:SetFont("Interface\\AddOns\\pfUI\\fonts\\homespun.ttf", AUF_settings.TextSize, "OUTLINE") end
		AUF.Debuff[i].Font:SetPoint("CENTER", AUF_settings.OffsetX, AUF_settings.OffsetY)
		
		AUF.Buff[i].Font:SetFont("Fonts\\ARIALN.TTF", AUF_settings.TextSize, "OUTLINE")
		if getglobal("pfUITargetBuff1") then AUF.Buff[i].Font:SetFont("Interface\\AddOns\\pfUI\\fonts\\homespun.ttf", AUF_settings.TextSize, "OUTLINE") end
		AUF.Buff[i].Font:SetPoint("CENTER", AUF_settings.OffsetX, AUF_settings.OffsetY)
	end
	AUF_settings.milliseconds = AUF.Options.SecondsCheckbox:GetChecked()
	AUF_settings.reverse = AUF.Options.ReverseCheckbox:GetChecked()
	
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
		for effect, info in pairs(AUF_Debuff[classes[i]].EFFECT) do
			count = count + 1
			if AUF.ClassOptions[i].Spell[count]:GetChecked() then AUF_settings.effects[classes[i]].effect[effect] = true
			else AUF_settings.effects[classes[i]].effect[effect] = false end
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
		if AUF.Options.UnitFrame[i].Checkbox:GetChecked() then
			AUF:SetUnitFramesAnchor(UnitFrames[i])
			break
		end
	end
	-- renew database
	AUF:UpdateDatabase()
	
	
	DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Debuff Timers:|r Options saved.|r",1,1,1)
	AUF.Options:Hide()
end

function AUF:OpenClassOption(class)
	for i=1,9 do AUF.ClassOptions[i]:Hide() end
	getglobal("AUF_ClassOptions_"..class):Show()
end

function AUF:BuildClassWindow()
	
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
	AUF.ClassOptions = {}
	
	for i =1, 9 do
		AUF.ClassOptions[i] = CreateFrame("Frame","AUF_ClassOptions_"..classes[i],AUF.Options)
		AUF.ClassOptions[i]:SetID(i)
		AUF.ClassOptions[i]:SetPoint("TOPLEFT",AUF.Options,"TOPRIGHT",0,0)
		AUF.ClassOptions[i]:SetBackdrop(StaticPopup1:GetBackdrop())
		AUF.ClassOptions[i]:SetMovable(true)
		AUF.ClassOptions[i]:EnableMouse(true)
		AUF.ClassOptions[i]:RegisterForDrag("LeftButton")
		AUF.ClassOptions[i]:SetScript("OnDragStart", function() AUF.Options:StartMoving() end)
		AUF.ClassOptions[i]:SetScript("OnDragStop", function() AUF.Options:StopMovingOrSizing() end)
		AUF.ClassOptions[i]:SetHeight(320)
		AUF.ClassOptions[i]:SetWidth(470)
		
		local count = 0
		local oddcount = 0
		for effect, info in pairs(AUF_Debuff[classes[i]].EFFECT) do 
			count = count + 1
			if count == 1 then
				AUF.ClassOptions[i].Spell = {}
				AUF.ClassOptions[i].Spell[count] = CreateFrame("CheckButton",nil, AUF.ClassOptions[i], "UICheckButtonTemplate")
				AUF.ClassOptions[i].Spell[count]:SetPoint("TOPLEFT", 15, -15)
				oddcount = oddcount + 1
			else
				if math.mod(count, 2) == 0 then -- even
					AUF.ClassOptions[i].Spell[count] = CreateFrame("CheckButton",nil, AUF.ClassOptions[i].Spell[count-1], "UICheckButtonTemplate")
					AUF.ClassOptions[i].Spell[count]:SetPoint("RIGHT", 220, 0)
				else -- odd
					AUF.ClassOptions[i].Spell[count] = CreateFrame("CheckButton",nil, AUF.ClassOptions[i].Spell[count-2], "UICheckButtonTemplate")
					AUF.ClassOptions[i].Spell[count]:SetPoint("BOTTOM", 0, -28)
					oddcount = oddcount + 1
				end
			end
			
			AUF.ClassOptions[i].Spell[count]:SetHeight(24)
			AUF.ClassOptions[i].Spell[count]:SetWidth(24)
			AUF.ClassOptions[i].Spell[count].Effect = effect
			AUF.ClassOptions[i].Spell[count].Duration = AUF_Debuff[classes[i]].EFFECT[effect].DURATION
			AUF.ClassOptions[i].Spell[count]:SetChecked(AUF_settings.effects[classes[i]].effect[effect])

			AUF.ClassOptions[i].Spell[count].Icon = CreateFrame("Button",nil, AUF.ClassOptions[i].Spell[count])
			AUF.ClassOptions[i].Spell[count].Icon:SetHeight(24)
			AUF.ClassOptions[i].Spell[count].Icon:SetWidth(24)
			AUF.ClassOptions[i].Spell[count].Icon:SetPoint("LEFT", AUF.ClassOptions[i].Spell[count], "RIGHT", 5, 0)
			AUF.ClassOptions[i].Spell[count].Icon:SetNormalTexture("Interface\\Icons\\"..AUF_Debuff[classes[i]].EFFECT[effect].ICON)
			AUF.ClassOptions[i].Spell[count].Icon:SetPushedTexture("Interface\\Icons\\"..AUF_Debuff[classes[i]].EFFECT[effect].ICON)
			
			AUF.ClassOptions[i].Spell[count].Font = AUF.ClassOptions[i].Spell[count].Icon:CreateFontString(nil, "OVERLAY","GameFontHighlight")
			AUF.ClassOptions[i].Spell[count].Font:SetPoint("LEFT",AUF.ClassOptions[i].Spell[count].Icon,"RIGHT", 10, 0)
			AUF.ClassOptions[i].Spell[count].Font:SetText(effect)
			AUF.ClassOptions[i].Spell[count].Font:SetJustifyH("LEFT")
			AUF.ClassOptions[i].Spell[count].Font:SetJustifyV("CENTER")
			
			AUF.ClassOptions[i]:SetHeight((oddcount*(28))+25)
		end
		
		AUF.ClassOptions[i]:Hide()
	end
end

-- to detect talents
function AUF:DatabasePreload()
	local function rk(i, j)
		local _, _, _, _, rank= GetTalentInfo(i, j)
		return rank
	end
	if CLASS == "MAGE" then
		local rank = rk(2,10) -- improved scorch
		if rank == 3 then
			AUF_Debuff[CLASS].EFFECT["Fire Vulnerability"] = {
				ICON = "Spell_Fire_SoulBurn",
				DURATION = 30,
			}
			
			AUF_Debuff[CLASS].SPELL["Scorch"] = {
				DURATION = {30, 30, 30, 30, 30, 30, 30},
				EFFECT = "Fire Vulnerability",
			}
		end
		rank = rk(3,10) -- improved blizzard
		if rank > 0 then
			AUF_Debuff[CLASS].EFFECT["Blizzard"] = {
				ICON = "Spell_Frost_Icestorm",
				DURATION = 4.5
			}
			AUF_Debuff[CLASS].SPELL["Blizzard"] = {
				DURATION = {4.5, 4.5, 4.5, 4.5, 4.5, 4.5},
				EFFECT = "Blizzard",
			}
		end
		rank = rk(3,7) -- improved chilled
		if rank > 0 then
			AUF_Debuff[CLASS].SPELL["Cone of Cold"].DURATION = {8+rank,8+rank,8+rank,8+rank,8+rank}
			AUF_Debuff[CLASS].EFFECT["Chilled"].DURATION = 5+rank
			AUF_Debuff[CLASS].SPELL["Frostbolt"].DURATION = {5+rank, 6+rank, 6+rank, 7+rank, 7+rank, 8+rank, 8+rank, 9+rank, 9+rank, 9+rank}
		end
		rank = rk(1,11) -- improved counterspell
		if rank > 0 then AUF_Debuff[CLASS].EFFECT["Counterspell - Silenced"].DURATION = 4 end
		rank = rk(3,16) -- winters chill
		if rank > 0 then
			AUF_Debuff[CLASS].EFFECT["Winter's Chill"] = {
				ICON = "Spell_Frost_ChillingBlast",
				DURATION = 15,
			}
		end
	end
end