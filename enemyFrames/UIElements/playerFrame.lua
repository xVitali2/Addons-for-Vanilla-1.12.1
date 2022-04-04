	-------------------------------------------------------------------------------
	local refreshInterval, nextRefresh = 1/60, 0
	-------------------------------------------------------------------------------
	local function round(num, idp)
		local mult = 10^(idp or 0)
		return math.floor(num * mult + 0.5) / mult
	end
	local getTimerLeft = function(tEnd)
		local t = tEnd - GetTime()
		if t > 3 then return round(t, 0) else return round(t, 1) end
	end
	-------------------------------------------------------------------------------	
	local playerDebuffFrame = CreateFrame('Frame', 'PlayerPortraitDebuff', PlayerFrame)
	playerDebuffFrame:SetFrameLevel(0)
	playerDebuffFrame:SetPoint('TOPLEFT', PlayerPortrait, 'TOPLEFT', 7, -2)
	playerDebuffFrame:SetPoint('BOTTOMRIGHT', PlayerPortrait, 'BOTTOMRIGHT', -5.5, 4)
	
	-- circle texture
	local playerPortraitbgFrame = CreateFrame('Frame', nil, PlayerFrame)
	playerPortraitbgFrame:SetFrameLevel(1)
	playerPortraitbgFrame:SetPoint('TOPLEFT', PlayerPortrait, 'TOPLEFT', 7, -2)
	playerPortraitbgFrame:SetPoint('BOTTOMRIGHT', PlayerPortrait, 'BOTTOMRIGHT', -5.5, 4)
	
	playerPortraitbgFrame.bgText = playerPortraitbgFrame:CreateTexture(nil, 'OVERLAY')
	playerPortraitbgFrame.bgText:SetPoint('TOPLEFT', PlayerPortrait, 'TOPLEFT', 3.5, -4.5)
	playerPortraitbgFrame.bgText:SetPoint('BOTTOMRIGHT', PlayerPortrait, 'BOTTOMRIGHT', -3.5, 2.5)
	playerPortraitbgFrame.bgText:SetVertexColor(.3, .3, .3)
	playerPortraitbgFrame.bgText:SetTexture([[Interface\AddOns\enemyFrames\globals\resources\portraitBg.tga]])
	-- debuff texture
	playerDebuffFrame.debuffText = PlayerFrame:CreateTexture(nil, 'OVERLAY')
	playerDebuffFrame.debuffText:SetPoint('TOPLEFT', PlayerPortrait, 'TOPLEFT', 7.5, -8)
	playerDebuffFrame.debuffText:SetPoint('BOTTOMRIGHT', PlayerPortrait, 'BOTTOMRIGHT', -7.5, 4.5)	
	playerDebuffFrame.debuffText:SetTexCoord(.12, .88, .12, .88)
	-- duration text
	local PlayerPortraitDurationFrame = CreateFrame('Frame', nil, PlayerFrame)
	PlayerPortraitDurationFrame:SetAllPoints()
	PlayerPortraitDurationFrame:SetFrameLevel(2)
	
	playerDebuffFrame.duration = PlayerPortraitDurationFrame:CreateFontString(nil, 'OVERLAY')--, 'GameFontNormalSmall')
	playerDebuffFrame.duration:SetFont(STANDARD_TEXT_FONT, 16, 'OUTLINE')
	playerDebuffFrame.duration:SetTextColor(.9, .9, .2, 1)
	playerDebuffFrame.duration:SetShadowOffset(1, -1)
	playerDebuffFrame.duration:SetShadowColor(0, 0, 0)
	playerDebuffFrame.duration:SetPoint('CENTER', PlayerPortrait, 'CENTER', 0, -5)
	-- cooldown spiral
	playerDebuffFrame.cd = CreateCooldown(playerDebuffFrame, 1.054, true)
	playerDebuffFrame.cd:SetAlpha(1)
	-------------------------------------------------------------------------------
	local a, maxa, b, c = .002, .058, 0, 1
	local showPortraitDebuff = function()

		local prioBuff = SPELLCASTINGCOREgetPrioBuff(UnitName'player', 1)[1]

		if prioBuff ~= nil then
			local d = 1
			if b > maxa then c = -1 end
			if b < 0 then c = 1 end
			b = b + a * c 
			d = -b 
			
			--playerDebuffFrame.debuffText:SetTexCoord(.12+b, .88+d, .12+d, .88+b)
		
			playerDebuffFrame.debuffText:SetTexture(prioBuff.icon)
			playerDebuffFrame.duration:SetText(getTimerLeft(prioBuff.timeEnd))
			playerPortraitbgFrame.bgText:Show()
			playerDebuffFrame.cd:SetTimers(prioBuff.timeStart, prioBuff.timeEnd)
			playerDebuffFrame.cd:Show()
			
			local br, bg, bb = prioBuff.border[1], prioBuff.border[2], prioBuff.border[3]
			playerPortraitbgFrame.bgText:SetVertexColor(br, bg, bb)
						
		else
			playerDebuffFrame.cd:Hide()				
			playerDebuffFrame.debuffText:SetTexture()
			playerDebuffFrame.duration:SetText('')
			playerPortraitbgFrame.bgText:Hide()
		end			
			
	end
	-------------------------------------------------------------------------------
	playerDebuffFrame:SetScript('OnUpdate', function()
		nextRefresh = nextRefresh - arg1
		if nextRefresh < 0 then
			if ENEMYFRAMESPLAYERDATA['playerPortraitDebuff'] then
				showPortraitDebuff()				
			else
				playerDebuffFrame.cd:Hide()				
				playerDebuffFrame.debuffText:SetTexture()
				playerDebuffFrame.duration:SetText('')
				playerPortraitbgFrame.bgText:Hide()
			end
			
			nextRefresh = refreshInterval			
		end
	end)
	-------------------------------------------------------------------------------