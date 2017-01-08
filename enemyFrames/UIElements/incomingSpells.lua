	-------------------------------------------------------------------------------
	local playerName = UnitName'player'
	local enabled, refresh = false, true
	local refreshInterval, nextRefresh = 1/60, 0
	
	local unitsLimit, units = 3, {}
	local playerCastList = {}
	local BACKDROP 	= {bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],}
	local frameMovable = false
	-------------------------------------------------------------------------------
	local 	incFrame = CreateFrame('Frame',"incFrame", UIParent)
			incFrame:ClearAllPoints()
			incFrame:SetPoint('CENTER', UIParent, 0, 270)
			incFrame:SetWidth(160)
			incFrame:SetHeight(20)
			
			incFrame:SetMovable(true)
			incFrame:SetClampedToScreen(true)
			
			incFrame:SetScript('OnDragStart', function() if frameMovable then this:StartMoving() end end)
			incFrame:SetScript('OnDragStop', function() if frameMovable then  this:StopMovingOrSizing() end end)
			incFrame:RegisterForDrag('LeftButton')
			
			incFrame:SetBackdrop(BACKDROP)
			incFrame:SetBackdropColor(0, 0, 0, 0) 
			
			incFrame.border = CreateBorder(nil, incFrame, 16)
			incFrame.border:Hide()
			
			incFrame.title = incFrame:CreateFontString(nil, 'OVERLAY')
			incFrame.title:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
			incFrame.title:SetPoint('CENTER', incFrame, 'CENTER', 0, 3)
			incFrame.title:SetText('')
	-------------------------------------------------------------------------------
	for i=1,unitsLimit do
		units[i] = CreateIncomingSpellsFrame(incFrame)
		units[i]:SetPoint('TOP', i == 1 and incFrame or units[i-1].arrow,'BOTTOM', 0, -6)
		units[i]:Hide()
	end
	-------------------------------------------------------------------------------
	local incomingSpellsOnUpdate = function()
		for k, v in pairs(playerCastList) do
			v['castinfo'] = SPELLCASTINGCOREgetCast(v['name'])
			if not v['castinfo'] or v['castinfo'].spell ~= v['spell'] then
				table.remove(playerCastList, k)
				refresh = true
			end
		end
		
		-- draw elements	
		for i = 1, unitsLimit do
			if playerCastList[i] then
				local c = playerCastList[i]['castinfo']
				if c then
					if refresh then
						units[i].icon:SetTexture(c.icon)
						units[i].caster:SetText(c.caster)
						
						if c.class then
							local colour = RAID_CLASS_COLORS[c.class]
							units[i].caster:SetTextColor(colour.r, colour.g, colour.b)
						end
						
						units[i].arrow:SetMinMaxValues(0, c.timeEnd - c.timeStart)
						if c.school then
							units[i].arrow:SetStatusBarColor(c.school[1], c.school[2], c.school[3])
							units[i].arrow.bg:SetVertexColor(c.school[1] - .4, c.school[2] - .4, c.school[3] - .4)
						end
						
						units[i].button.target = c.caster
						
						units[i]:Show()
					else
						-- updates castbar value
						units[i].arrow:SetValue(mod(GetTime() - c.timeStart, c.timeEnd - c.timeStart))
					end
				end
			else
				units[i]:Hide()
			end
		end
		
		refresh = false
	end
	-------------------------------------------------------------------------------
	local defaultValues = function(b)
		if b then incFrame.border:Show() else incFrame.border:Hide()	end
		incFrame:EnableMouse(b)
		incFrame:SetBackdropColor(0, 0, 0, b and .6 or 0)
		incFrame.title:SetText(b and EF_L_INCOMINGSPELLS or '')
		frameMovable = b
		for i=1,unitsLimit do
			units[i].icon:SetTexture([[Interface\Icons\Inv_misc_gem_sapphire_01]])
			units[i].caster:SetText(playerName)
			if b then units[i]:Show() else units[i]:Hide() end
		end
	end
	INCOMINGSPELLSsettings = function(b)
		defaultValues(b)
	end
	INCOMINGSPELLSinit = function(b)
		enabled = b
		if enabled then
			incFrame:SetScript('OnUpdate', function()
				nextRefresh = nextRefresh - arg1
				if nextRefresh < 0 and ENEMYFRAMESPLAYERDATA['incomingSpells'] then
					incomingSpellsOnUpdate()
					nextRefresh = refreshInterval
				end
			end)
		end
	end
	-------------------------------------------------------------------------------
	local removeDoubleEntry = function(c)
		for k, v in pairs(playerCastList) do
			if v['name'] == c then
				table.remove(playerCastList, k)
				return
			end
		end
	end
	local checkCasterTarget = function(c)
		TargetByName(c, true)
		if UnitExists('target') ~= nil then
			if UnitName'targettarget' == playerName then
				return true
			end
		end
		return false
	end
	local newCasterEntry = function(c, s)
		local currentTarget = UnitExists'target' and UnitName'target' or nil
		
		if currentTarget and currentTarget ~= c then
			local b = checkCasterTarget(c)
			
			if currentTarget == nil then	ClearTarget()	
			else	TargetByName(currentTarget, true)	end
			
			if b then
				removeDoubleEntry(c)
				local p = {['name'] = c, ['spell'] = s}
				table.insert(playerCastList, p)
				refresh = true
			end
		end
	end
	-------------------------------------------------------------------------------
	local parseCombatLog = function()
		local bCast = EF_L_SPELLCASTOTHERSTART	local bbCast = string.find(arg1, bCast)
		
		if bbCast then
			local m = bCast
			local c = gsub(arg1, m, '%1')
			local s = gsub(arg1, m, '%2')
			
			if not SPELLINFO_SINGLE_TARGET_BUFF_SPELLS[s] and SPELLINFO_SPELLCASTS_TO_TRACK[s] then
				newCasterEntry(c, s)
			end
		end
	end
	-------------------------------------------------------------------------------
	local eventHandler = function()
		if event == 'PLAYER_ENTERING_WORLD' or event == 'ZONE_CHANGED_NEW_AREA' then
			--incFrame:Hide()
			enabled = false
			incFrame:SetScript('OnUpdate', nil)
		elseif event == 'CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE' then
			if enabled and ENEMYFRAMESPLAYERDATA['incomingSpells'] then
				parseCombatLog()
			end
		end
	end
	-------------------------------------------------------------------------------
	incFrame:RegisterEvent'PLAYER_ENTERING_WORLD'
	incFrame:RegisterEvent'ZONE_CHANGED_NEW_AREA'
	incFrame:RegisterEvent'CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE'
	incFrame:SetScript('OnEvent', eventHandler)
	
	-------------------------------------------------------------------------------