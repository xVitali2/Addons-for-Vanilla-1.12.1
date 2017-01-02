	-------------------------------------------------------------------------------
	local TEXTURE 	= [[Interface\AddOns\enemyFrames\globals\resources\barTexture]]
	local BACKDROP 	= {bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],}
	local ISTEXTURE = [[Interface\AddOns\enemyFrames\globals\resources\arrow2]]
	-------------------------------------------------------------------------------
	local unitWidth, unitHeight, castBarHeight, ccIconWidth, manaBarHeight = 64, 22, 8, 28, 6
	UIElementsGetDimensions = function()
		return unitWidth, unitHeight, castBarHeight, ccIconWidth, manaBarHeight
	end
	CreateEnemyUnitFrame = function(name, parentFrame)
		-- unit button
		local this = CreateFrame('Button', name, parentFrame)
		--this:SetFrameLevel(0)
		this:SetWidth(unitWidth)	this:SetHeight(unitHeight)
		this:RegisterForClicks('LeftButtonUp', 'RightButtonUp')		
		this.mo = false		
		
		this.border = CreateBorder(nil, this, 12.8, 1/4.5)
															
		-- health statusbar
		this.hpbar = CreateFrame('StatusBar', nil, this)
		this.hpbar:SetFrameLevel(1)
		this.hpbar:SetStatusBarTexture(TEXTURE)
		this.hpbar:SetWidth(unitWidth)	this.hpbar:SetHeight(unitHeight)
		this.hpbar:SetMinMaxValues(0, 100)
		this.hpbar:SetPoint('TOPLEFT', this, 'TOPLEFT')
		
		this.hpbar:SetBackdrop(BACKDROP)
		this.hpbar:SetBackdropColor(0, 0, 0, .6)
		
		SmoothBar(this.hpbar)
			
		-- mana statusbar
		this.manabar = CreateFrame('StatusBar', nil, this)
		this.manabar:SetFrameLevel(1)
		this.manabar:SetStatusBarTexture(TEXTURE)
		this.manabar:SetHeight(manaBarHeight)
		this.manabar:SetWidth(unitWidth)		
		this.manabar:SetPoint('TOPLEFT', this.hpbar, 'BOTTOMLEFT')
		
		this.manabar:SetBackdrop(BACKDROP)
		this.manabar:SetBackdropColor(0, 0, 0)
		
		SmoothBar(this.manabar)
		
		-- cast bar --
		this.castbar = CreateFrame('StatusBar', nil, this)
		--this.castbar:SetFrameLevel(0)
		this.castbar:SetStatusBarTexture(TEXTURE)
		this.castbar:SetHeight(castBarHeight)
		this.castbar:SetWidth((unitWidth + ccIconWidth + 4) - (this.castbar:GetHeight()))	
		this.castbar:SetStatusBarColor(1, .4, 0)
		this.castbar:SetPoint('TOPLEFT', this, 'BOTTOMLEFT', this.castbar:GetHeight(), -3)
		
		this.castbar:SetBackdrop(BACKDROP)
		this.castbar:SetBackdropColor(0, 0, 0, .6)	
		
		this.castbar.b = CreateBorder(nil, this.castbar, 9)	
		this.castbar.b:SetPadding(.4)
		
		this.castbar.iconborder = CreateFrame('Frame', nil, this.castbar)
		this.castbar.iconborder:SetWidth(this.castbar:GetHeight()+1)	this.castbar.iconborder:SetHeight(this.castbar:GetHeight()+1)
		this.castbar.iconborder:SetPoint('RIGHT', this.castbar, 'LEFT')
		
		this.castbar.iconborder.border = CreateBorder(nil, this.castbar.iconborder, 8)
		
		this.castbar.icon = this.castbar.iconborder:CreateTexture(nil, 'ARTWORK')
		this.castbar.icon:SetTexCoord(.078, .92, .079, .937)
		this.castbar.icon:SetAllPoints()
		this.castbar.icon:SetPoint('CENTER', this.castbar.iconborder, 'CENTER')
		
		this.castbar.text = this.castbar:CreateFontString(nil, 'OVERLAY')
		this.castbar.text:SetTextColor(1, 1, 1)
		this.castbar.text:SetFont(STANDARD_TEXT_FONT, 8, 'OUTLINE')
		--this.castbar.text:SetShadowOffset(1, -1)
		this.castbar.text:SetShadowColor(0.4, 0.4, 0.4)
		this.castbar.text:SetPoint('LEFT', this.castbar, 'LEFT', 1, .5)
		
		
		this.castbar.timer = this.castbar:CreateFontString(nil, 'OVERLAY')
		this.castbar.timer:SetFont(STANDARD_TEXT_FONT, 7, 'OUTLINE')
		this.castbar.timer:SetTextColor(1, 1, 1)
		this.castbar.timer:SetShadowColor(0.4, 0.4, 0.4)
		this.castbar.timer:SetPoint('RIGHT', this.castbar, 'RIGHT', 0, 0)
		this.castbar.timer:SetText('1.5')
		--------------

		this.name = this:CreateFontString(nil, 'OVERLAY')
		this.name:SetFont(STANDARD_TEXT_FONT, 11, 'OUTLINE')
		this.name:SetTextColor(.8, .8, .8, .8)
		this.name:SetPoint('CENTER', this.hpbar)	
		--this.name:SetPoint('RIGHT', this.hpbar, -2, 0)
		
		--this.hpText = this:CreateFontString(nil, 'OVERLAY')
		--this.hpText:SetFont(STANDARD_TEXT_FONT, 7, 'OUTLINE')
		--this.hpText:SetTextColor(.8, .8, .8, .8)
		--this.hpText:SetPoint('LEFT', this.hpbar, 2, 0)
		
		--- TARGET COUNT ---
		this.targetCount = CreateFrame('Frame', nil, this)
		this.targetCount:SetWidth(ccIconWidth-2) this.targetCount:SetHeight(unitHeight-2)
		this.targetCount:SetPoint('CENTER', this,'TOPLEFT', 1, -1)
		this.targetCount:SetFrameLevel(7)
		
		this.targetCount.text = this.targetCount:CreateFontString(nil, 'OVERLAY')--, 'GameFontNormalSmall')
		this.targetCount.text:SetFont(STANDARD_TEXT_FONT, 11, 'OUTLINE')
		this.targetCount.text:SetTextColor(.9, .9, .2, 1)
		this.targetCount.text:SetShadowOffset(1, -1)
		this.targetCount.text:SetShadowColor(0, 0, 0)
		this.targetCount.text:SetPoint('CENTER', this.targetCount)
		this.targetCount.text:SetText('8')
		
		---- RAID TARGET
		this.raidTarget = CreateFrame('Frame', nil, this)
		this.raidTarget:SetWidth(ccIconWidth-2) this.raidTarget:SetHeight(unitHeight-2)
		this.raidTarget:SetPoint('CENTER', this,'TOPRIGHT', 0, -4)
		this.raidTarget:SetFrameLevel(7)
		
		this.raidTarget.icon = this.raidTarget:CreateTexture(nil, 'ARTWORK')
		this.raidTarget.icon:SetTexture([[Interface\TargetingFrame\UI-RaidTargetingIcons]])
		this.raidTarget.icon:SetAllPoints()
		
		
		---- CC ------
		this.cc = CreateFrame('Frame', name..'CC', this)
		this.cc:SetWidth(ccIconWidth) this.cc:SetHeight(unitHeight)
		this.cc:SetPoint('TOPLEFT', this,'TOPRIGHT', 3, 0)
		
		this.cc.border = CreateBorder(nil, this.cc, 12.8, 1/4.5)
		this.cc.border:SetFrameLevel(5)
		
		this.cc.icon = this.cc:CreateTexture(nil, 'ARTWORK')
		this.cc.icon:SetAllPoints()
		this.cc.icon:SetTexCoord(.1, .9, .25, .75)
		
		this.cc.bg = this.cc:CreateTexture(nil, 'BACKGROUND')
		this.cc.bg:SetTexture(0, 0, 0, .6)
		this.cc.bg:SetAllPoints()

		-- dummy frame lvl 5 to draw text above cooldown
		this.cc.durationFrame = CreateFrame('Frame', nil, this.cc)
		this.cc.durationFrame:SetAllPoints()
		this.cc.durationFrame:SetFrameLevel(6)
		
		this.cc.duration = this.cc.durationFrame:CreateFontString(nil, 'OVERLAY')--, 'GameFontNormalSmall')
		this.cc.duration:SetFont(STANDARD_TEXT_FONT, 10, 'OUTLINE')
		this.cc.duration:SetTextColor(.9, .9, .2, 1)
		this.cc.duration:SetShadowOffset(1, -1)
		this.cc.duration:SetShadowColor(0, 0, 0)
		this.cc.duration:SetPoint('BOTTOM', this.cc, 'BOTTOM', 0, 1)
		
		-- cooldown
		this.cc.cd = CreateCooldown(this.cc, .58, true)
		this.cc.cd:SetAlpha(1)
	
		return this
	end
	-------------------------------------------------------------------------------
	local ISWidth, ISHeight, arrowWidth, arrowHeight = 26, 20, 66, 14
	CreateIncomingSpellsFrame = function(parentFrame)
		local this = CreateFrame('Frame', nil, parentFrame)
		this:SetWidth(ISWidth)
		this:SetHeight(ISHeight)
		
		this.icon = this:CreateTexture(nil, 'OVERLAY')
		this.icon:SetAllPoints()	
		this.icon:SetTexCoord(.1, .9, .25, .75)
		
		this.border = CreateBorder(nil, this, 16)
		
		this.arrow = CreateFrame('statusbar', nil, this)
		this.arrow:SetStatusBarTexture(ISTEXTURE)
		this.arrow:SetFrameLevel(1)
		this.arrow:SetWidth(arrowWidth)
		this.arrow:SetHeight(arrowHeight)
		this.arrow:SetPoint('TOP', this, 'BOTTOM', -1, 0)

		this.arrow.bg = this.arrow:CreateTexture(nil, 'BACKGROUND')
		this.arrow.bg:SetTexture(ISTEXTURE)
		this.arrow.bg:SetAllPoints()
		
		this.caster = this:CreateFontString(nil, 'OVERLAY')
		this.caster:SetFont(STANDARD_TEXT_FONT, 16, 'OUTLINE')
		this.caster:SetPoint('RIGHT', this.arrow, 'TOPLEFT', 4, 4)
		
		this.you = this:CreateFontString(nil, 'OVERLAY')
		this.you:SetFont(STANDARD_TEXT_FONT, 16, 'OUTLINE')
		this.you:SetPoint('LEFT', this.arrow, 'TOPRIGHT', -2, 4)
		this.you:SetText("You")
		
		this.button = CreateFrame('Button', nil, this)
		this.button:SetPoint('TOPLEFT', this.caster, 'TOPLEFT')
		this.button:SetPoint('BOTTOMRIGHT', this.you, 'BOTTOMRIGHT')
		
		this.button:SetScript('OnClick', function()
			if this.target then
				TargetByName(this.target, true)
			end
		end)
		
		return this
	end
	-------------------------------------------------------------------------------
	