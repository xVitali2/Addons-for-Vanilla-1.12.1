
local playerFaction
local insideBG = false
-- TIMERS
local ktInterval, ktEndtime = 3, 0
local rtMenuInterval, rtMenuEndtime = 5, 0
local refreshInterval, nextRefresh = 1/60, 0
-- LISTS
local playerList = {}
local unitLimit = 15
local units = {}
local raidTargets = {}
local raidIcons, raidIconsN = { [1] = 'skull', [2] = 'moon', [3] = 'square', [4] = 'triangle',  
								[5] = 'star', [6] = 'diamond', [7] = 'cross', [8] = 'circle'}, 8

local enabled = false
local maxUnits = 15

MOUSEOVERUNINAME = nil
---

------------ UI ELEMENTS ------------------
--local TEXTURE = [[Interface\AddOns\enemyFrames\globals\resources\barTexture.tga]]
local BACKDROP = {bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],}
local enemyFactionColor

local 	enemyFrame = CreateFrame('Frame', 'enemyFrameDisplay', UIParent)
		enemyFrame:SetFrameStrata("BACKGROUND")
		enemyFrame:SetPoint('CENTER', UIParent, UIParent:GetHeight()/3, UIParent:GetHeight()/3)		
		enemyFrame:SetHeight(20)
		
		--enemyFrame:SetBackdrop(BACKDROP)
		--enemyFrame:SetBackdropColor(0, 0, 0, .6)
		
		enemyFrame:SetMovable(true)
		enemyFrame:SetClampedToScreen(true)
		
		enemyFrame:SetScript('OnDragStart', function() if ENEMYFRAMESPLAYERDATA['frameMovable'] then this:StartMoving() end end)
		enemyFrame:SetScript('OnDragStop', function() if ENEMYFRAMESPLAYERDATA['frameMovable'] then  this:StopMovingOrSizing() end end)
		enemyFrame:RegisterForDrag('LeftButton')
	
		
		enemyFrame.Title = enemyFrame:CreateFontString(nil, 'OVERLAY')
		enemyFrame.Title:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')		
		enemyFrame.Title:SetPoint('CENTER', enemyFrame, 0, 1)
		
		enemyFrame.totalPlayers = enemyFrame:CreateFontString(nil, 'OVERLAY')
		enemyFrame.totalPlayers:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		enemyFrame.totalPlayers:SetPoint('RIGHT', enemyFrame, 'RIGHT', -4, 1)
		
		
		enemyFrame.spawnText = enemyFrame:CreateFontString(nil, 'OVERLAY')
		enemyFrame.spawnText:SetFont(STANDARD_TEXT_FONT, 16, 'OUTLINE')
		enemyFrame.spawnText:SetPoint('LEFT', enemyFrame, 'LEFT', 8, 1)		
		
		enemyFrame.spawnText.Button = CreateFrame('Button', nil, enemyFrame)
		enemyFrame.spawnText.Button:SetHeight(15)	enemyFrame.spawnText.Button:SetWidth(15)
		enemyFrame.spawnText.Button:SetPoint('CENTER', enemyFrame.spawnText, 'CENTER')
		enemyFrame.spawnText.Button:SetScript('OnEnter', function()
			enemyFrame.spawnText:SetTextColor(.9, .9, .4)
			GameTooltip:SetOwner(this, 'ANCHOR_TOPRIGHT', -30, -30)
			GameTooltip:SetText(this.tt)
			GameTooltip:Show()
		end)
		enemyFrame.spawnText.Button:SetScript('OnLeave', function()
			enemyFrame.spawnText:SetTextColor(enemyFactionColor['r'], enemyFactionColor['g'], enemyFactionColor['b'], .9)
			GameTooltip:Hide()
		end)
		
			
		-- top frame
		
		enemyFrame.top = CreateFrame('Frame', nil, enemyFrame)
		enemyFrame.top:SetFrameLevel(0)
		enemyFrame.top:ClearAllPoints()		
		enemyFrame.top:SetHeight(enemyFrame:GetHeight())
		enemyFrame.top:SetBackdrop(BACKDROP)
		enemyFrame.top:SetBackdropColor(0, 0, 0, .6)
		
		--border
		enemyFrame.top.border = CreateBorder(nil, enemyFrame.top, 13)
		
		-- bottom frame
		enemyFrame.bottom = CreateFrame('Frame', nil, enemyFrame)
		--enemyFrame.bottom:SetFrameStrata("BACKGROUND")
		enemyFrame.bottom:SetFrameLevel(0)
		enemyFrame.bottom:ClearAllPoints()		
		enemyFrame.bottom:SetHeight(enemyFrame:GetHeight())
		
		enemyFrame.bottom:SetBackdrop(BACKDROP)
		enemyFrame.bottom:SetBackdropColor(0, 0, 0, .6)
		
		--border
		enemyFrame.bottom.border = CreateBorder(nil, enemyFrame.bottom, 13)
		
		-- settings button
		enemyFrame.bottom.settings = CreateFrame('Button', nil, enemyFrame.bottom)
		enemyFrame.bottom.settings:SetHeight(20)	enemyFrame.bottom.settings:SetWidth(20)
		enemyFrame.bottom.settings:SetPoint('RIGHT', enemyFrame.bottom, 'RIGHT', -6, 1)	
		
		enemyFrame.bottom.settings.text = enemyFrame.bottom.settings:CreateFontString(nil, 'OVERLAY')
		enemyFrame.bottom.settings.text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		enemyFrame.bottom.settings.text:SetText('S')
		
		enemyFrame.bottom.settings:SetScript('OnEnter', function()
			enemyFrame.bottom.settings.text:SetTextColor(.9, .9, .4)
			
			GameTooltip:SetOwner(this, 'ANCHOR_TOPRIGHT', -10, -60)
			GameTooltip:SetText('settings menu')
			GameTooltip:Show()
		end)
		enemyFrame.bottom.settings:SetScript('OnLeave', function()
			enemyFrame.bottom.settings.text:SetTextColor(enemyFactionColor['r'], enemyFactionColor['g'], enemyFactionColor['b'], .9)
			GameTooltip:Hide()
		end)
		enemyFrame.bottom.settings:SetScript('OnClick', function()
												if enabled then setupSettings() end
												end)
		
		--enemyFrame.bottom:Hide()
		-- class
		enemyFrame.bottom.classButton = CreateFrame('Button', nil, enemyFrame.bottom)
		enemyFrame.bottom.classButton:SetHeight(enemyFrame:GetHeight()-6)	enemyFrame.bottom.classButton:SetWidth(enemyFrame:GetHeight()-4)
		enemyFrame.bottom.classButton:SetPoint('LEFT', enemyFrame.bottom, 'LEFT', 8, 0)
		
		enemyFrame.bottom.classIcon = enemyFrame.bottom.classButton:CreateTexture(nil, 'ARTWORK')
		enemyFrame.bottom.classIcon:SetAllPoints()
		enemyFrame.bottom.classIcon:SetTexture(GET_DEFAULT_ICON('class', 'WARRIOR'))
		enemyFrame.bottom.classIcon:SetTexCoord(.1, .9, .25, .75)
		
		-- rank
		enemyFrame.bottom.rankButton = CreateFrame('Button', nil, enemyFrame.bottom)
		enemyFrame.bottom.rankButton:SetHeight(enemyFrame:GetHeight()-6)	enemyFrame.bottom.rankButton:SetWidth(enemyFrame:GetHeight()-4)
		enemyFrame.bottom.rankButton:SetPoint('LEFT', enemyFrame.bottom.classButton, 'RIGHT', 8, 0)
		
		enemyFrame.bottom.rankIcon = enemyFrame.bottom.rankButton:CreateTexture(nil, 'ARTWORK')
		enemyFrame.bottom.rankIcon:SetAllPoints()
		enemyFrame.bottom.rankIcon:SetTexture(GET_DEFAULT_ICON('rank', 10))
		enemyFrame.bottom.rankIcon:SetTexCoord(.1, .9, .25, .75)
		
		-- race
		enemyFrame.bottom.raceButton = CreateFrame('Button', nil, enemyFrame.bottom)
		enemyFrame.bottom.raceButton:SetHeight(enemyFrame:GetHeight()-6)	enemyFrame.bottom.raceButton:SetWidth(enemyFrame:GetHeight()-4)
		enemyFrame.bottom.raceButton:SetPoint('LEFT', enemyFrame.bottom.rankButton, 'RIGHT', 8, 0)
		
		enemyFrame.bottom.raceIcon = enemyFrame.bottom.raceButton:CreateTexture(nil, 'ARTWORK')
		enemyFrame.bottom.raceIcon:SetAllPoints()
		enemyFrame.bottom.raceIcon:SetTexCoord(.1, .9, .25, .75)
		
		----- raidTarget
		enemyFrame.raidTargetFrame = CreateFrame('Frame', nil, enemyFrame)
		enemyFrame.raidTargetFrame:SetFrameLevel(2)
		enemyFrame.raidTargetFrame:SetHeight(36)	enemyFrame.raidTargetFrame:SetWidth(36)
		enemyFrame.raidTargetFrame:SetPoint('CENTER', UIParent,'CENTER', 0, 160)
		enemyFrame.raidTargetFrame:Hide()
	
		enemyFrame.raidTargetFrame.text = enemyFrame.raidTargetFrame:CreateFontString(nil, 'OVERLAY')
		enemyFrame.raidTargetFrame.text:SetFont(STANDARD_TEXT_FONT, 18, 'OUTLINE')
		enemyFrame.raidTargetFrame.text:SetTextColor(.8, .8, .8, .8)
		enemyFrame.raidTargetFrame.text:SetPoint('CENTER', enemyFrame.raidTargetFrame)
		enemyFrame.raidTargetFrame.text:SetText('Player')
	
		enemyFrame.raidTargetFrame.iconl = enemyFrame.raidTargetFrame:CreateTexture(nil, 'OVERLAY')
		enemyFrame.raidTargetFrame.iconl:SetTexture([[Interface\TargetingFrame\UI-RaidTargetingIcons]])
		enemyFrame.raidTargetFrame.iconl:SetTexCoord(.75, 1, 0.25, .5)
		enemyFrame.raidTargetFrame.iconl:SetHeight(36)	enemyFrame.raidTargetFrame.iconl:SetWidth(36)
		enemyFrame.raidTargetFrame.iconl:SetPoint('RIGHT', enemyFrame.raidTargetFrame.text, 'LEFT', -6, 0)
		
		enemyFrame.raidTargetFrame.iconr = enemyFrame.raidTargetFrame:CreateTexture(nil, 'OVERLAY')
		enemyFrame.raidTargetFrame.iconr:SetTexture([[Interface\TargetingFrame\UI-RaidTargetingIcons]])
		enemyFrame.raidTargetFrame.iconr:SetTexCoord(.75, 1, 0.25, .5)
		enemyFrame.raidTargetFrame.iconr:SetHeight(36)	enemyFrame.raidTargetFrame.iconr:SetWidth(36)
		enemyFrame.raidTargetFrame.iconr:SetPoint('LEFT', enemyFrame.raidTargetFrame.text, 'RIGHT', 6, 0)

		-- raidTarget menu
		local rtMenuIconsize = 26
		enemyFrame.raidTargetMenu = CreateFrame('Frame', nil, enemyFrame)
		enemyFrame.raidTargetMenu:SetFrameLevel(7)
		enemyFrame.raidTargetMenu:SetHeight(rtMenuIconsize*2+4)	enemyFrame.raidTargetMenu:SetWidth(rtMenuIconsize*4+10)
		enemyFrame.raidTargetMenu:SetBackdrop(BACKDROP)
		enemyFrame.raidTargetMenu:SetBackdropColor(0, 0, 0, .6)
		--enemyFrame.raidTargetMenu:SetPoint('CENTER', UIParent,'CENTER', 0, 160)
		enemyFrame.raidTargetMenu:Hide()
		
		enemyFrame.raidTargetMenu.border = CreateBorder(nil, enemyFrame.raidTargetMenu, 10)
		
		enemyFrame.raidTargetMenu.icons = {}
		for j = 1, raidIconsN, 1 do
			enemyFrame.raidTargetMenu.icons[j] = CreateFrame('Button', 'enemyFrame.raidTargetMenu.icons'..j, enemyFrame.raidTargetMenu)
			enemyFrame.raidTargetMenu.icons[j]:SetHeight(rtMenuIconsize)	enemyFrame.raidTargetMenu.icons[j]:SetWidth(rtMenuIconsize)
			if j == 1 then
				enemyFrame.raidTargetMenu.icons[j]:SetPoint('TOPLEFT', enemyFrame.raidTargetMenu, 'TOPLEFT', 1, -1)
			elseif j < 5 then
				enemyFrame.raidTargetMenu.icons[j]:SetPoint('LEFT', enemyFrame.raidTargetMenu.icons[j-1], 'RIGHT', 2, 0)
			else
				enemyFrame.raidTargetMenu.icons[j]:SetPoint('TOP', enemyFrame.raidTargetMenu.icons[j-4], 'BOTTOM', 0, -2)
			end
			enemyFrame.raidTargetMenu.icons[j].id = j
			
			enemyFrame.raidTargetMenu.icons[j].tex = enemyFrame.raidTargetMenu.icons[j]:CreateTexture(nil, 'OVERLAY')
			enemyFrame.raidTargetMenu.icons[j].tex:SetTexture([[Interface\TargetingFrame\UI-RaidTargetingIcons]])
			enemyFrame.raidTargetMenu.icons[j].tex:SetAlpha(.6)
			local tCoords = RAID_TARGET_TCOORDS[raidIcons[j]]
			enemyFrame.raidTargetMenu.icons[j].tex:SetTexCoord(tCoords[1], tCoords[2], tCoords[3], tCoords[4])
			enemyFrame.raidTargetMenu.icons[j].tex:SetAllPoints()
			
			enemyFrame.raidTargetMenu.icons[j]:SetScript('OnEnter', function() 
															_G['enemyFrame.raidTargetMenu.icons'..this.id].tex:SetAlpha(1)
														end)
														
			enemyFrame.raidTargetMenu.icons[j]:SetScript('OnLeave', function() 
															_G['enemyFrame.raidTargetMenu.icons'..this.id].tex:SetAlpha(.6)
														end)							
		end

		--spawn raidtarget menu
		local function spawnRTMenu(b, target)
			enemyFrame.raidTargetMenu:SetPoint('TOP', b,'BOTTOM', rtMenuIconsize/2, 0)
			if enemyFrame.raidTargetMenu.target and enemyFrame.raidTargetMenu.target == target and rtMenuEndtime > GetTime() then
					enemyFrame.raidTargetMenu:Hide()
					return
			end
			
			enemyFrame.raidTargetMenu.target = target
			enemyFrame.raidTargetMenu:Show()
			rtMenuEndtime = GetTime() + rtMenuInterval
			
			for j = 1, raidIconsN, 1 do
				enemyFrame.raidTargetMenu.icons[j]:SetScript('OnClick', function()
					ENEMYFRAMECORESendRaidTarget(raidIcons[this.id], target)
					enemyFrame.raidTargetMenu:Hide()
					rtMenuEndtime = 0
				end)
			end
		end

local unitWidth, unitHeight, castBarHeight, ccIconWidth, manaBarHeight = UIElementsGetDimensions()
local leftSpacing = 5
-- draw player units
for i = 1, unitLimit,1 do
	units[i] = CreateEnemyUnitFrame('enemyFrameUnit'..i, enemyFrame)
	units[i].index = i	
		
	units[i]:SetScript('OnClick', function()	if arg1 == 'LeftButton' and this.tar ~= nil  then  	TargetByName(this.tar, true)			end
		if arg1 == 'RightButton' then	
			spawnRTMenu(this, this.tar)	end
	end)
end


-- function for settings use
local function defaultVisuals()
	for i = 1, unitLimit do
		units[i].castbar.icon:SetTexture([[Interface\Icons\Inv_misc_gem_sapphire_01]])
		units[i].castbar.text:SetText('Entangling Roots')
		units[i].castbar.text:SetText(string.sub(units[i].castbar.text:GetText(), 1, 18))
		
		units[i].name:SetText('Player' .. i)
		
		units[i].raidTarget.icon:SetTexCoord(.75, 1, 0.25, .5)
		
		units[i].cc.icon:SetTexture([[Interface\characterframe\TEMPORARYPORTRAIT-MALE-ORC]])
		units[i].cc.duration:SetText('2.8')
		
		units[i]:Show()
	end
end

local function optionals()
	for i = 1, unitLimit do
		-- display player's names
		if not ENEMYFRAMESPLAYERDATA['displayNames'] then
			units[i].name:Hide()
		else
			units[i].name:Show()
		end
		
		-- display mana bar
		if not ENEMYFRAMESPLAYERDATA['displayManabar'] then
			units[i].hpbar:SetHeight(unitHeight)
			units[i].manabar:Hide()
		else
			units[i].hpbar:SetHeight(unitHeight - manaBarHeight)
			units[i].manabar:Show()
		end
		
		-- display cast timer
		if not ENEMYFRAMESPLAYERDATA['castTimers'] then
			units[i].castbar.timer:Hide()
		else
			units[i].castbar.timer:Show()
		end

		-- display target counter
		if not ENEMYFRAMESPLAYERDATA['targetCounter'] then
			units[i].targetCount.text:Hide()
		else
			units[i].targetCount.text:Show()
		end
	end
end
local function setccIcon(p)
	local d = p == 'class' and 'WARRIOR' or p == 'rank' and 6 or p == 'portrait' and ( playerFaction == 'Alliance' and 'MALE-ORC' or 'MALE-HUMAN')
	for i = 1, unitLimit do
		units[i].cc.icon:SetTexture(GET_DEFAULT_ICON(p, d))
	end
end
 
 
local function arrangeUnits()
	local unitGroup, layout = ENEMYFRAMESPLAYERDATA['groupsize'], ENEMYFRAMESPLAYERDATA['layout']
	
	-- adjust title
	if playerFaction == 'Alliance' then 
		enemyFrame.Title:SetText(layout == 'vertical' and 'H ' or 'Horde')
	else 
		enemyFrame.Title:SetText(layout == 'vertical' and 'A ' or 'Alliance')
	end
	
	for i = 1, unitLimit do	
		if i == 1 then	
				units[i]:SetPoint('TOPLEFT', enemyFrame, 'BOTTOMLEFT', 0, -4)
		else
			if i > unitGroup then
				if layout == 'hblock' or layout == 'vblock' then
					units[i]:SetPoint('TOPLEFT', units[i-unitGroup].castbar.iconborder, 'BOTTOMLEFT', 1, -5)
				else
					units[i]:SetPoint('TOPLEFT', units[i-unitGroup].cc, 'TOPRIGHT', leftSpacing, 0)
				end
			else
				if layout == 'hblock' or layout == 'vblock' then
					units[i]:SetPoint('TOPLEFT', units[i-1].cc, 'TOPRIGHT', leftSpacing, 0)					
				else
					units[i]:SetPoint('TOPLEFT', units[i-1].castbar.iconborder, 'BOTTOMLEFT', 1, -5)
				end
			end
		end	
	end
end

local function showHideBars()
	if ENEMYFRAMESPLAYERDATA['frameMovable'] then
		enemyFrame.spawnText.Button.tt = 'lock'
		enemyFrame.top:Show()--SetAlpha(1)
		enemyFrame.bottom:Show()--SetAlpha(1)
		enemyFrame.spawnText:SetText('-')		
	else
		enemyFrame.spawnText.Button.tt = 'unlock'
		enemyFrame.top:Hide()--SetAlpha(0)
		enemyFrame.bottom:Hide()--SetAlpha(0)
		enemyFrame.spawnText:SetText('+')
	end
	enemyFrame:EnableMouse(ENEMYFRAMESPLAYERDATA['frameMovable'])
end

local function SetupFrames(maxU)
	maxUnits = maxU
	-- get player's faction
	playerFaction = UnitFactionGroup('player')
	
	if playerFaction == 'Alliance' then 
		enemyFactionColor = RGB_FACTION_COLORS['Horde']
		enemyFrame.Title:SetText('Horde')
	else 
		enemyFactionColor = RGB_FACTION_COLORS['Alliance']
		enemyFrame.Title:SetText('Alliance')		
	end
	
	enemyFrame.Title:SetTextColor(enemyFactionColor['r'], enemyFactionColor['g'], enemyFactionColor['b'], .9)
	enemyFrame.spawnText:SetTextColor(enemyFactionColor['r'], enemyFactionColor['g'], enemyFactionColor['b'], .9)
	enemyFrame.totalPlayers:SetTextColor(enemyFactionColor['r'], enemyFactionColor['g'], enemyFactionColor['b'], .9)
		
	-- width of the draggable frame
	local col = ENEMYFRAMESPLAYERDATA['layout'] == 'hblock' and 5 or ENEMYFRAMESPLAYERDATA['layout'] == 'vblock' and 2 or ENEMYFRAMESPLAYERDATA['layout'] == 'vertical' and 1 or maxUnits / ENEMYFRAMESPLAYERDATA['groupsize']
	enemyFrame:SetWidth((unitWidth + ccIconWidth + 5)*col +  leftSpacing*(col-1))
	
	enemyFrame.top:SetWidth(enemyFrame:GetWidth())
	enemyFrame.top:SetPoint('CENTER', enemyFrame)
	
	
	enemyFrame.spawnText.Button:SetScript('OnClick', function()
			if ENEMYFRAMESPLAYERDATA['frameMovable'] then
				ENEMYFRAMESPLAYERDATA['frameMovable'] = false
			else	
				ENEMYFRAMESPLAYERDATA['frameMovable'] = true
			end
			showHideBars()
			GameTooltip:SetOwner(this, 'ANCHOR_TOPRIGHT', -30, -60)
			GameTooltip:SetText(this.tt)
			GameTooltip:Show()
		end)
		
	showHideBars()
	
	-- bottom frame
	enemyFrame.bottom:SetWidth(enemyFrame:GetWidth())
	--enemyFrame.bottom:SetPoint('CENTER', enemyFrame, 0, -((unitHeight + castBarHeight + 15) * unitGroup))
	local unitPointBottom = ENEMYFRAMESPLAYERDATA['layout'] == 'hblock' and maxUnits - 4 or ENEMYFRAMESPLAYERDATA['layout'] == 'vblock' and (math.mod(maxUnits,2) == 0 and maxUnits - 1 or math.mod(maxUnits,2) ~= 0 and maxUnits) or maxUnits < ENEMYFRAMESPLAYERDATA['groupsize'] and maxUnits or ENEMYFRAMESPLAYERDATA['groupsize']
	enemyFrame.bottom:SetPoint('TOPLEFT', units[unitPointBottom].castbar.icon, 'BOTTOMLEFT', 1, -6)
	
	if ENEMYFRAMESPLAYERDATA['defaultIcon'] == 'class' then
		enemyFrame.bottom.classIcon:SetBlendMode('BLEND')
		enemyFrame.bottom.classIcon:SetVertexColor(1, 1, 1)
		enemyFrame.bottom.rankIcon:SetBlendMode('ADD')
		enemyFrame.bottom.rankIcon:SetVertexColor(.3, .3, .3)
		enemyFrame.bottom.raceIcon:SetBlendMode('ADD')
		enemyFrame.bottom.raceIcon:SetVertexColor(.3, .3, .3)
	elseif ENEMYFRAMESPLAYERDATA['defaultIcon'] == 'rank' then
		enemyFrame.bottom.classIcon:SetBlendMode('ADD')
		enemyFrame.bottom.classIcon:SetVertexColor(.3, .3, .3)
		enemyFrame.bottom.rankIcon:SetBlendMode('BLEND')
		enemyFrame.bottom.rankIcon:SetVertexColor(1, 1, 1)
		enemyFrame.bottom.raceIcon:SetBlendMode('ADD')
		enemyFrame.bottom.raceIcon:SetVertexColor(.3, .3, .3)
	else
		enemyFrame.bottom.classIcon:SetBlendMode('ADD')
		enemyFrame.bottom.classIcon:SetVertexColor(.3, .3, .3)
		enemyFrame.bottom.rankIcon:SetBlendMode('ADD')
		enemyFrame.bottom.rankIcon:SetVertexColor(.3, .3, .3)
		enemyFrame.bottom.raceIcon:SetBlendMode('BLEND')
		enemyFrame.bottom.raceIcon:SetVertexColor(1, 1, 1)
	end
	
	-- class/rank/race buttons
	enemyFrame.bottom.classButton:SetScript('OnClick', function()
			
			ENEMYFRAMESPLAYERDATA['defaultIcon'] = 'class'
			
			enemyFrame.bottom.classIcon:SetBlendMode('BLEND')
			enemyFrame.bottom.classIcon:SetVertexColor(1, 1, 1)
			enemyFrame.bottom.rankIcon:SetBlendMode('ADD')
			enemyFrame.bottom.rankIcon:SetVertexColor(.3, .3, .3)
			enemyFrame.bottom.raceIcon:SetBlendMode('ADD')
			enemyFrame.bottom.raceIcon:SetVertexColor(.3, .3, .3)
			
			if not enabled then setccIcon('class')	end
		end)
	
	enemyFrame.bottom.rankButton:SetScript('OnClick', function()
			ENEMYFRAMESPLAYERDATA['defaultIcon'] = 'rank'
			
			enemyFrame.bottom.classIcon:SetBlendMode('ADD')
			enemyFrame.bottom.classIcon:SetVertexColor(.3, .3, .3)
			enemyFrame.bottom.rankIcon:SetBlendMode('BLEND')
			enemyFrame.bottom.rankIcon:SetVertexColor(1, 1, 1)
			enemyFrame.bottom.raceIcon:SetBlendMode('ADD')
			enemyFrame.bottom.raceIcon:SetVertexColor(.3, .3, .3)
			
			if not enabled then setccIcon('rank')	end
		end)
		
	local r = playerFaction == 'Alliance' and 'MALE-ORC' or 'MALE-HUMAN'
	enemyFrame.bottom.raceIcon:SetTexture(GET_DEFAULT_ICON('portrait', r))
	enemyFrame.bottom.raceButton:SetScript('OnClick', function()
			ENEMYFRAMESPLAYERDATA['defaultIcon'] = 'portrait'

						
			enemyFrame.bottom.classIcon:SetBlendMode('ADD')
			enemyFrame.bottom.classIcon:SetVertexColor(.3, .3, .3)
			enemyFrame.bottom.rankIcon:SetBlendMode('ADD')
			enemyFrame.bottom.rankIcon:SetVertexColor(.3, .3, .3)
			enemyFrame.bottom.raceIcon:SetBlendMode('BLEND')
			enemyFrame.bottom.raceIcon:SetVertexColor(1, 1, 1)
			
			if not enabled then setccIcon('portrait')	end
		end)
	
	
	enemyFrame.bottom.settings.text:SetPoint('RIGHT', enemyFrame.bottom, 'RIGHT', -6, 1)
	enemyFrame.bottom.settings.text:SetTextColor(enemyFactionColor['r'], enemyFactionColor['g'], enemyFactionColor['b'], .9)
		
end


local function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end
local getTimerLeft = function(tEnd)
	local t = tEnd - GetTime()
	if t > 3 then return round(t, 0) else return round(t, 1) end
end

local function SetDefaultIconTex(p)
	p['portrait']	= p['sex'] .. '-' .. p['race']
	local d = ENEMYFRAMESPLAYERDATA['defaultIcon']
	if d == 'rank' and (p['rank'] < 0 or not p['rank']) then d = 'portrait' end
	return GET_DEFAULT_ICON(d, p[d])
end

local function drawUnits(list)
			
	playerList = list
	local i, nearU = 1, 0
	
	for k,v in pairs(playerList) do
		-- set for redrawn
		
		local colour = RAID_CLASS_COLORS[v['class']]
		local powerColor = RGB_POWER_COLORS[v['powerType']]
		
		-- hightlight nearby unit
		if v['nearby'] then		
			units[i].hpbar:SetStatusBarColor(colour.r, colour.g, colour.b)
			if not units[i].mo then
				units[i].name:SetTextColor(colour.r, colour.g, colour.b)	
			end			
			units[i].manabar:SetStatusBarColor(powerColor[1], powerColor[2], powerColor[3])			
			units[i].cc.icon:SetVertexColor(1, 1, 1, 1)
			
			--units[i].targetCount.text:SetTextColor(.898, 898, .199)
			
			units[i]:SetScript('OnEnter', function()	
				units[this.index].name:SetTextColor(enemyFactionColor['r'], enemyFactionColor['g'], enemyFactionColor['b'])	
				this.mo = true
				MOUSEOVERUNINAME = this.tar
			end)
			units[i]:SetScript('OnLeave', function()
				units[this.index].name:SetTextColor(colour.r, colour.g, colour.b)
				this.mo = false
				MOUSEOVERUNINAME = nil
			end)
						
		else
			units[i].hpbar:SetStatusBarColor(colour.r / 2, colour.g / 2, colour.b / 2, .7)
			units[i].manabar:SetStatusBarColor(powerColor[1] / 2, powerColor[2] / 2, powerColor[3] / 2)
			if not units[i].mo then
				units[i].name:SetTextColor(colour.r / 2, colour.g / 2, colour.b / 2, .7)
			end		
			
			--units[i].targetCount.text:SetTextColor(.898 / 2, .898 / 2, .199 / 2)

			if v['fc'] then
				units[i].cc.icon:SetVertexColor(1, 1, 1, 1)
			else
				units[i].cc.icon:SetVertexColor(.4, .4, .4, .7)--v['fc'] and 1, 1, 1, 1 or .4, .4, .4, .6)
			end
			units[i].cc.cd:Hide()
			
			units[i]:SetScript('OnEnter', nil)
			units[i]:SetScript('OnLeave', function()
				units[this.index].name:SetTextColor(colour.r / 2, colour.g / 2, colour.b / 2, .6)
				this.mo = false
				MOUSEOVERUNINAME = nil
			end)
		end
				
		--units[i].name:SetText(v['name'])
		units[i].name:SetText(string.sub(v['name'], 1, 7))
		
		-- button function to target unit
		units[i].tar = v['name']
		
		-- target count
		units[i].targetCount.text:SetText(v['targetcount'] and (v['targetcount'] > 0 and v['targetcount'] or '') or '')
		
		-- hp & mana
		units[i].hpbar:SetMinMaxValues(0, v['maxhealth'] and v['maxhealth'] or 100)
		units[i].hpbar:SetValue(v['health'] and v['health'] or not (v['nearby'] and v['maxhealth']) and v['maxhealth'] or 100)
		units[i].manabar:SetMinMaxValues(0, v['maxmana'] and v['maxmana'] or 100)
		units[i].manabar:SetValue(v['mana'] and v['mana'] or not (v['nearby'] and v['maxmana']) and v['maxmana'] or 100)
		
		--units[i]:Show()
		if ENEMYFRAMESPLAYERDATA['displayOnlyNearby'] and not v['nearby'] then units[i]:Hide()	else units[i]:Show() end

		
		nearU = v['nearby'] and nearU + 1 or nearU
		i = i + 1
	end
	
	for j=i, unitLimit, 1 do
		if units[j]:IsShown() then
			units[j]:Hide()
		end
	end

	i = i == 1 and 1 or i -1
	enemyFrame.totalPlayers:SetText(nearU .. ' / ' .. i)
	
	if not insideBG or ENEMYFRAMESPLAYERDATA['displayOnlyNearby'] then		
		local unitPointBottom = ENEMYFRAMESPLAYERDATA['layout'] == 'vertical' and i or i > ENEMYFRAMESPLAYERDATA['groupsize'] and ENEMYFRAMESPLAYERDATA['groupsize'] or i
		
		if ENEMYFRAMESPLAYERDATA['layout'] == 'hblock' or ENEMYFRAMESPLAYERDATA['layout'] == 'vblock' then
			local a = math.floor(i/ENEMYFRAMESPLAYERDATA['groupsize'])
			unitPointBottom = a  == 0 and 1 or (a * ENEMYFRAMESPLAYERDATA['groupsize']) +1
		end
		
		enemyFrame.bottom:SetPoint('TOPLEFT', units[unitPointBottom].castbar.icon, 'BOTTOMLEFT', 1, -6)
		
		--/Script print(math.floor(4/5))
	end
end

-- target indicator, raid icons, optionals
local function updateUnits()
	-- killTarget announcement
	if ktEndtime < GetTime() then
		enemyFrame.raidTargetFrame:Hide()
	end
	-- raidicons menu
	if rtMenuEndtime < GetTime() then
		enemyFrame.raidTargetMenu:Hide()
	end
	
	local i = 1
	
	for k, v in pairs(playerList) do
		
		-- target indicator
		if UnitName'target' == v['name'] then
			units[i].border:SetColor(enemyFactionColor['r'], enemyFactionColor['g'], enemyFactionColor['b'])
			
			units[i].hpbar:SetBackdropColor(enemyFactionColor['r'] - .6, enemyFactionColor['g'] - .6, enemyFactionColor['b'] - .6, .6)
			units[i].manabar:SetBackdropColor(enemyFactionColor['r'] - .6, enemyFactionColor['g'] - .6, enemyFactionColor['b'] - .6, .6)			
		else
			units[i].border:SetColor(.1, .1, .1)
			
			units[i].hpbar:SetBackdropColor(0, 0, 0, .6)
			units[i].manabar:SetBackdropColor(0, 0, 0, .6)
		end

		
		-- castbar
		local castInfo = SPELLCASTINGCOREgetCast(v['name'])--v['castinfo']--
		units[i].castbar:Hide()
		if castInfo ~= nil then
			units[i].castbar:SetMinMaxValues(0, castInfo.timeEnd - castInfo.timeStart)
			
			if castInfo.inverse then
				units[i].castbar:SetValue(mod((castInfo.timeEnd - GetTime()), castInfo.timeEnd - castInfo.timeStart))
			else
				units[i].castbar:SetValue(mod((GetTime() - castInfo.timeStart), castInfo.timeEnd - castInfo.timeStart))					
			end
			units[i].castbar.text:SetText(castInfo.spell)
			local charLim = ENEMYFRAMESPLAYERDATA['castTimers'] and 14 or 15
			units[i].castbar.text:SetText(string.sub(units[i].castbar.text:GetText(), 1, charLim))
			
			units[i].castbar.timer:SetText(getTimerLeft(castInfo.timeEnd))--..'s')
			
			units[i].castbar.icon:SetTexture(castInfo.icon)
			units[i].castbar:Show()		
		end
			
		-- CC type
		local b = SPELLCASTINGCOREgetPrioBuff(v['name'], 1)[1]--v['buff']--
		if b ~= nil then
			units[i].cc.icon:SetTexture(b.icon)
			units[i].cc.duration:SetText(getTimerLeft(b.timeEnd))
			
			units[i].cc.cd:SetTimers(b.timeStart, b.timeEnd)
			units[i].cc.cd:Show()
			
			local br, bg, bb = b.border[1], b.border[2], b.border[3]
			units[i].cc.border:SetColor(br, bg, bb)
		else
			-- signal FC or class / rank
			units[i].cc.icon:SetTexture(v['fc'] and SPELLINFO_WSG_FLAGS[playerFaction]['icon'] or SetDefaultIconTex(v))
			
			units[i].cc.cd:Hide()
			
			-- show target player portrait
			if UnitName'target' == v['name'] and not v['fc'] and (ENEMYFRAMESPLAYERDATA['defaultIcon'] == 'portrait' or (ENEMYFRAMESPLAYERDATA['defaultIcon'] == 'rank' and v['rank'] < 0)) then
				SetPortraitTexture(units[i].cc.icon, 'target')
			end

			units[i].cc.border:SetColor(.1, .1, .1)
			units[i].cc.duration:SetText('')
		end
		
		-- RAID ICON
		if raidTargets[v['name']] then
			local tCoords = RAID_TARGET_TCOORDS[raidTargets[v['name']]['icon']]
			units[i].raidTarget.icon:SetTexCoord(tCoords[1], tCoords[2], tCoords[3], tCoords[4])
			units[i].raidTarget:Show()
		else
			units[i].raidTarget:Hide()
		end	
		
		--if not v['nearby'] then
		--	if ENEMYFRAMESPLAYERDATA['displayOnlyNearby'] then units[i]:Hide()	else units[i]:Show() end
		--end
		if ENEMYFRAMESPLAYERDATA['displayOnlyNearby'] and not v['nearby'] then units[i]:Hide()	else units[i]:Show() end
				
		i = i + 1
		if i > unitLimit then return end
	end
end

local function enemyFramesOnUpdate()
	nextRefresh = nextRefresh - arg1
	if nextRefresh < 0 then
		-- update units
		raidTargets = ENEMYFRAMECOREGetRaidTarget()
		updateUnits()
	
		nextRefresh = refreshInterval
	end
end


--- GLOBAL ACCESS ---
function ENEMYFRAMESUpdatePlayers(list)
	drawUnits(list)
end
function ENEMYFRAMESAnnounceRT(rt, p)
	raidTargets = rt
	enemyFrame.raidTargetFrame.text:SetText(p['name'])
	enemyFrame.raidTargetFrame.text:SetTextColor(RAID_CLASS_COLORS[p['class']].r, RAID_CLASS_COLORS[p['class']].g, RAID_CLASS_COLORS[p['class']].b)
	
	local tCoords = RAID_TARGET_TCOORDS[raidTargets[p['name']]['icon']]
	enemyFrame.raidTargetFrame.iconl:SetTexCoord(tCoords[1], tCoords[2], tCoords[3], tCoords[4])
	enemyFrame.raidTargetFrame.iconr:SetTexCoord(tCoords[1], tCoords[2], tCoords[3], tCoords[4])
	PlaySound('RaidWarning', 'master')
	
	enemyFrame.raidTargetFrame:Show()
	ktEndtime = GetTime() + ktInterval
end

function ENEMYFRAMESInitialize(maxUnits, isBG)
	insideBG = isBG
	MOUSEOVERUNINAME = nil
	if maxUnits then
		SetupFrames(maxUnits)
		arrangeUnits()
		optionals()
		enabled = true
		
		if ENEMYFRAMESPLAYERDATA['enableFrames'] then
			enemyFrame:Show()
		end
		enemyFrame:SetScript('OnUpdate', enemyFramesOnUpdate)
	else
		enemyFrame:SetScript('OnUpdate', nil)
	end
end

function ENEMYFRAMESsettings()
	optionals()
	if not enabled or not insideBG then
		SetupFrames(15)
		defaultVisuals()
		setccIcon(ENEMYFRAMESPLAYERDATA['defaultIcon'])
	else
		SetupFrames(maxUnits)
	end
	
	arrangeUnits()
	
	if ENEMYFRAMESPLAYERDATA['enableFrames'] then
		enemyFrame:Show()
	else
		enemyFrame:Hide()
	end
end
---------------------

local function eventHandler()
	if event == 'PLAYER_ENTERING_WORLD' or event == 'ZONE_CHANGED_NEW_AREA' and enabled then
		enabled = false
		enemyFrame:Hide()
		--
	end
end

enemyFrame:RegisterEvent'PLAYER_ENTERING_WORLD'
enemyFrame:RegisterEvent'ZONE_CHANGED_NEW_AREA'
enemyFrame:SetScript('OnEvent', eventHandler)


local function debugDisplayPlayerData()
	for k, v in pairs(playerList) do
		print(k..':')
		for i, j in pairs(v) do
			print(i .. ' ' .. tostring(j))
		end
	end
end
local function debugCooldownTest()
	for i = 1, unitLimit do
		units[i].cc.cd:SetTimers(GetTime(), GetTime()+8)
		units[i].cc.cd:Show()
	end
end
SLASH_ENEMYFRAMES1 = '/efd'
SlashCmdList["ENEMYFRAMES"] = function(msg)
	if msg then
		if 		msg == 'data' 	then 	debugDisplayPlayerData()	 
		elseif 	msg =='cd' 		then	debugCooldownTest()
		end		
	end
end


