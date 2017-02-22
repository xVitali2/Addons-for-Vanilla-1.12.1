

	if tonumber(GetCVar'modOneBag') == 0 then return end

	local ButtonSize = 16
	local ButtonSpacing = 23
	local buttons, bankbuttons, keyringbuttons, orig = {}, {}, {}, {}
	local ItemsPerRow = 11
	local BACKDROP = {bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],}
	local TEXTURE  = [[Interface\AddOns\modui\statusbar\texture\sb.tga]]

	orig.ContainerFrame_GenerateFrame = ContainerFrame_GenerateFrame
	orig.ContainerFrame_Update 	      = ContainerFrame_Update
	orig.ContainerFrame_OnShow 	      = ContainerFrame_OnShow
	orig.ContainerFrame_OnHide        = ContainerFrame_OnHide
	orig.ToggleKeyRing				  = ToggleKeyRing

	local grab_slots = function()
		local numBags = 1
		for i = 1, NUM_BAG_FRAMES do
			local bagName = 'ContainerFrame'..i + 1
			local _, a = _G[bagName]:GetRegions()
			a = a:GetName()
			if _G[bagName]:IsShown()
			and not (string.find(a, 'Bank') or string.find(a, 'Keyring')) then
				numBags = numBags + 1
			end
		end
		return numBags
	end

	local BagSpace = function()
		local ct = 0
		for bag = 0, NUM_BAG_SLOTS do
			for slot = 1, GetContainerNumSlots(bag) do
				local  link = GetContainerItemLink(bag, slot)
				if not link then ct = ct + 1 end
			end
		end
		return ct
	end

	local BagMaxSpace = function()
		local ct = 0
		for bag = 0, NUM_BAG_SLOTS do
			for slot = 1, GetContainerNumSlots(bag) do
				ct = ct + 1
			end
		end
		return ct
	end

		-- HIDE OLD ART
	local bagHide = function(bagName)
		local bag = _G[bagName]
		if not bag.stripped then
			local a, b, c, d, e, f = bag:GetRegions()
			for _, v in pairs({a, b, c, d, e, f}) do v:SetAlpha(0) end
			bag:EnableMouse(false)
			_G[bagName..'CloseButton']:Hide()
			_G[bagName..'PortraitButton']:EnableMouse(false)
			bag.stripped = true
		end
	end

		-- NEW ART
	local art = function(frame)
		local portrait = frame:CreateTexture(nil, 'BACKGROUND')
		portrait:SetWidth(64) portrait:SetHeight(64)
		portrait:SetPoint('TOPLEFT', -8, 8)
		portrait:SetAlpha(1)
		SetPortraitToTexture(portrait, [[Interface\ICONS\Inv_misc_bag_30]])
	end


		-- REPARENT/MOVE BUTTONS
	local MoveButtons = function(table, frame)
		local length  = tlength(table)
		local columns = math.ceil(sqrt(length) + 1)
		local col, row = 0, 0
		for i = 1, length do
			bu = table[i]
			bu:SetFrameStrata'HIGH'
			bu:SetFrameLevel(6)
			bu:ClearAllPoints()
			bu:SetPoint('TOPLEFT', frame, col*(ButtonSize + ButtonSpacing) + 7, -1*row*(ButtonSize + ButtonSpacing) - 88)

				-- bg art
			if not bu.bg then
				bu.bg = bu:CreateTexture(nil, 'BACKGROUND')
				bu.bg:SetTexture[[Interface\PaperDoll\UI-Backpack-EmptySlot]]
				bu.bg:SetAlpha(.75)
				bu.bg:SetAllPoints()
			end

			if col > (columns - 3) then
				col = 0
				row = row + 1
			else
				col = col + 1
			end
		end

		frame:SetHeight((row + (col == 0 and 0 or 1))*(ButtonSize + ButtonSpacing) + 110)
		frame:SetWidth(columns*ButtonSize + ButtonSpacing*(columns - 1) - 2)
		col, row = 0, 0
	end


		-- CONTAINER
	local bagContainer = CreateFrame('Frame', 'modbag_inventory', UIParent)
	bagContainer:SetFrameStrata'HIGH'
	bagContainer:SetFrameLevel(3)
	bagContainer:SetPoint('BOTTOMRIGHT', UIParent, -108, 150)
	bagContainer:Hide()

	bagContainer.freespace = CreateFrame('StatusBar', 'modbag_inventory_space', bagContainer)
	bagContainer.freespace:SetStatusBarTexture(TEXTURE)
	bagContainer.freespace:SetHeight(8)
	bagContainer.freespace:SetPoint('TOPLEFT', 8, -74)
	bagContainer.freespace:SetPoint('TOPRIGHT', -10, -74)
	bagContainer.freespace:SetBackdrop(BACKDROP)
	bagContainer.freespace:SetBackdropColor(0, 0, 0)
	bagContainer.freespace:SetMinMaxValues(0, 1)
	bagContainer.freespace:SetValue(0)
	modSkin(bagContainer.freespace, 12)
    modSkinPadding(bagContainer.freespace, 2, 2, 2, 2, 2, 3, 2, 3)
    modSkinColor(bagContainer.freespace, .2, .2, .2)

	bagContainer.freespace.title = bagContainer.freespace:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightSmall')
	bagContainer.freespace.title:SetPoint('BOTTOMLEFT', bagContainer.freespace, 'TOPLEFT', 2, 4)
	bagContainer.freespace.title:SetText'Free Space:'

	bagContainer:SetClampedToScreen(true)
	bagContainer:SetMovable(true)
	bagContainer:EnableMouse(true)
	bagContainer:RegisterForDrag'LeftButton'
	bagContainer:SetScript('OnDragStart', function()
		if IsShiftKeyDown() then this:StartMoving() end
	end)
	bagContainer:SetScript('OnDragStop', function() this:StopMovingOrSizing() end)

	local bankContainer = CreateFrame('Button', 'modbag_bank', UIParent)
	bankContainer:SetPoint('TOPRIGHT', bagContainer, 'TOPLEFT', 4, 0)
	bankContainer:SetFrameStrata'HIGH'
	bankContainer:SetFrameLevel(3)
	bankContainer:Hide()

	local Container = CreateFrame('Frame', 'modbag', bagContainer)
	Container:SetPoint('BOTTOMRIGHT', bagContainer)
	Container:SetFrameStrata'HIGH'
	Container:SetFrameLevel(2)
	art(Container)

	ButtonFrameTemplate:SetParent(Container)
	ButtonFrameTemplate:SetFrameLevel(4)
	ButtonFrameTemplate:SetPoint('TOPLEFT', Container)
	ButtonFrameTemplate:SetPoint('BOTTOMRIGHT', Container)

	ButtonFrameTemplate.CloseButton:SetParent(bagContainer)

	local bagName = bagContainer:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	bagName:SetFont(STANDARD_TEXT_FONT, 12)
	bagName:SetText'Inventory Slots'
	bagName:Hide()

	local bankName = bankContainer:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	bankName:SetFont(STANDARD_TEXT_FONT, 12)
	bankName:SetText'Bank Slots'
	bankName:Hide()

	local name = Container:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	name:SetFont(STANDARD_TEXT_FONT, 12)
	name:SetText'Inventory'
	name:SetPoint('TOP', 5, -5)

			-- CA$H
	local money = ContainerFrame1MoneyFrame
	money:SetParent(Container)
	money:ClearAllPoints()
	money:SetPoint('BOTTOMRIGHT', Container, -9, 5)
	money:SetFrameStrata'DIALOG'
	money:SetFrameLevel(4)
	BankFrameMoneyFrame:Hide()

		-- KEYRING
	KeyRingButton:SetParent(bagContainer)
	KeyRingButton:ClearAllPoints() KeyRingButton:SetPoint('TOPRIGHT', bagContainer, -10, -25)
	KeyRingButton:SetFrameLevel(7)


		-- SET-UP BAG
	local ReAnchor = function()
		buttons = {}
		for f = 1, grab_slots() do
			local con = 'ContainerFrame'..f
			local id  = _G[con]:GetID()
			bagHide(con)
			for i = GetContainerNumSlots(id), 1, -1 do
				local bu = _G[con..'Item'..i]
				local cd = _G[con..'Item'..i..'Cooldown']
				table.insert(buttons, bu)
				cd:SetFrameLevel(bu:GetFrameLevel() + 1)
			end
		end
		MoveButtons(buttons, bagContainer)
		bagContainer:Show()
		Container:SetWidth(bagContainer:GetWidth())
		Container:SetHeight(bagContainer:GetHeight())
	end

	local reanchorKeyring = function()
		local id = IsBagOpen(KEYRING_CONTAINER)
		if id then
			local bu = _G['ContainerFrame'..id]
			bu:ClearAllPoints()
			if bagContainer:IsVisible() then
				bu:SetPoint('TOPRIGHT', Container, 'TOPLEFT')
			else
				bu:SetPoint('BOTTOMRIGHT', UIParent, -110, 150)
			end
		end
	end

		-- SET-UP BANK
	local cachedBankWidth, cachedBankHeight
	local ReanchorBank = function(noMoving)
		for _, v in pairs(bankbuttons) do v:Hide() end
		bankbuttons = {}
		local bagNameCount = 0
		for f = NUM_BAG_SLOTS + 1, NUM_BAG_SLOTS + NUM_BANKBAGSLOTS do
			bagNameCount = bagNameCount + 1
			local j = grab_slots() + bagNameCount
			local con = 'ContainerFrame'..j
			if _G[con]:GetID() ~= KEYRING_CONTAINER then
				 bagHide(con)
				_G[con]:SetScale(1) -- a fix
				for i = GetContainerNumSlots(f), 1, -1  do
					bu = _G[con..'Item'..i]
					table.insert(bankbuttons, bu)
					bu:Show()
				end
			end
		end

		if not noMoving then
			MoveButtons(bankbuttons, bankContainer)
			cachedBankWidth = bankContainer:GetWidth()
			cachedBankHeight = bankContainer:GetHeight()
		else
			bankContainer:SetWidth(cachedBankWidth)
			bankContainer:SetHeight(cachedBankHeight)
		end

		if GetNumBankSlots() > 0 then
			local bagHeight, bagWidth = bagContainer:GetHeight(), bagContainer:GetWidth()
			local bankHeight, bankWidth = bankContainer:GetHeight(), bankContainer:GetWidth()

			local height = (bankHeight > bagHeight) and bankHeight or bagHeight
			Container:SetWidth(bagWidth + bankWidth) Container:SetHeight(height)

			bagName:SetPoint('TOPRIGHT', Container, -(bagWidth/2) + 50, -50)
			bagName:Show()

			bankName:SetPoint('TOPLEFT', Container, (bankWidth/2) - 30, -50)
			bankName:Show()

			bankContainer:Show()
		end
	end

	local BagSpaceBarUpdate = function()
		bagContainer.freespace:SetMinMaxValues(0, BagMaxSpace())
		bagContainer.freespace:SetValue(BagSpace())
	end

		-- OPEN/CLOSE
	local CloseBags = function()
		bankContainer:Hide()
		bagContainer:Hide()
		bagName:Hide()
		bankName:Hide()
		for i = 0, 11 do CloseBag(i) end
		CloseBankFrame()
	end

	local CloseBags2 = function()
		bankContainer:Hide()
		bagContainer:Hide()
		bagName:Hide()
		bankName:Hide()
	end

	local CloseBankBags = function()
		bankContainer:Hide()
		bagName:Hide()
		for i = 5, 11 do CloseBag(i) end
		ReAnchor()
	end

	local OpenBags = function()
		for i = 0, 4 do OpenBag(i) end
	end

	local OpenKeyring = function()
		reanchorKeyring()
	end

	local ToggleBags = function()
		if bagContainer:IsShown() then CloseBags() else OpenBags() end
	end

	function ToggleKeyRing()
		orig.ToggleKeyRing()
		OpenBags()
		reanchorKeyring()
	end

	function ContainerFrame_GenerateFrame(frame, size, id)
		orig.ContainerFrame_GenerateFrame(frame, size, id)
		if id ~= -2 then ReAnchor() end
	end

	function ContainerFrame_OnShow()
		orig.ContainerFrame_OnShow()
		if this:GetID() ~= -2 then ReAnchor() end
	end

	function ContainerFrame_OnHide()
		orig.ContainerFrame_OnHide()
		if this:GetID() ~= -2 then CloseBags2() end
		reanchorKeyring()
	end

	BankFrame:SetScript('OnShow', function()
		PlaySound'igMainMenuOpen'
		KeyRingButton:Hide()
		OpenBags()
	end)

	BankFrame:SetScript('OnHide', function()
		PlaySound'igMainMenuClose'
		KeyRingButton:Show()
		updateContainerFrameAnchors()
		CloseBags()
	end)


		-- REMOVE BAG SLOT TOGGLE FUNCTION
	BagSlotButton_OnClick = function()
		local id = this:GetID()
		local hadItem = PutItemInBag(id)
		if not hadItem then ToggleBags() end
		return
	end

	BackpackButton_OnClick = function() ToggleBags() end

	BankFrameItemButtonBag_OnClick = function(button)
		local id = this:GetInventorySlot()
		local hadItem = PutItemInBag(id)
		if bankContainer:IsShown() then
			CloseBankBags()
		else
			for i = 0, 11 do OpenBag(i) end
			ReanchorBank()
		end
		if not hadItem then return end
	end

	-- BAG SLOTS
	local bagSparkles = function(this, isEnter)
		local id = this:GetID() - CharacterBag0Slot:GetID() + 1
		for i = 1, NUM_CONTAINER_FRAMES do
			local frame = _G['ContainerFrame'..i]
			if frame:GetID() == id then
				for j = 1, GetContainerNumSlots(id) do
					local bu = _G['ContainerFrame'..i..'Item'..j]
					if isEnter then
						modSkinColor(bu, .7*i, .2*i, 0)
					else
						modSkinColor(bu, .2, .2, .2)
					end
				end
			end
		end
	end

	MainMenuBarBackpackButton:SetScript('OnEnter', function()
		GameTooltip:SetOwner(this, 'ANCHOR_LEFT')
		GameTooltip:SetText(TEXT(BACKPACK_TOOLTIP), 1, 1, 1)
		local keyBinding = GetBindingKey'TOGGLEBACKPACK'
		if keyBinding then
			GameTooltip:AppendText(" "..NORMAL_FONT_COLOR_CODE.."("..keyBinding..")"..FONT_COLOR_CODE_CLOSE);
		end
		if bagContainer:IsShown() then
			this.isMainBag = true
			bagSparkles(this, true)
		end
	end)

	MainMenuBarBackpackButton:SetScript('OnLeave', function()
		GameTooltip:Hide()
		bagSparkles(this, false)
	end)

	for i = 0, 3 do
		local bag = _G['CharacterBag'..i..'Slot']
		bag:SetScript('OnEnter', function() bagSparkles(this, true) end)
		bag:SetScript('OnLeave', function() bagSparkles(this, false) end)
	end

		-- REDIRECTS
	function UpdateContainerFrameAnchors() end
	OpenBackpack = OpenBags
	CloseAllBags = CloseBags
	OpenAllBags = ToggleBags
	ToggleBackpack = ToggleBags
	CloseBackpack = CloseAllBags

	for _, v in pairs({	-- dark theme
		ButtonFrameTemplate.PortraitFrame.BG,
		ButtonFrameTemplate.PortraitFrame.TitleBG,
		ButtonFrameTemplate.PortraitFrame.PortraitFrame,
		ButtonFrameTemplate.PortraitFrame.TopRightCorner,
		ButtonFrameTemplate.PortraitFrame.TopBorder,
		ButtonFrameTemplate.PortraitFrame.BotLeftCorner,
		ButtonFrameTemplate.PortraitFrame.BotRightCorner,
		ButtonFrameTemplate.PortraitFrame.BottomBorder,
		ButtonFrameTemplate.PortraitFrame.LeftBorder,
		ButtonFrameTemplate.PortraitFrame.RightBorder,
		ButtonFrameTemplate.BtnCornerLeft,
		ButtonFrameTemplate.BtnCornerRight,
		ButtonFrameTemplate.PortraitFrame.TopTileStreaks, --
	}) do
		if v then
			table.insert(MODUI_COLOURELEMENTS_FOR_UI, v)
		end
	end


	for _, v in pairs ({
		ButtonFrameTemplate.Inset.BG,
		ButtonFrameTemplate.Inset.TopLeftCorner,
		ButtonFrameTemplate.Inset.TopRightCorner,
		ButtonFrameTemplate.Inset.BotLeftCorner,
		ButtonFrameTemplate.Inset.BotRightCorner,
	}) do
		if v then
			table.insert(MODUI_COLOURELEMENTS_FOR_UI, v)
		end
	end

	local e = CreateFrame'Frame'
	e:RegisterEvent'PLAYER_ENTERING_WORLD'
	e:RegisterEvent'UNIT_INVENTORY_CHANGED'
	e:RegisterEvent'BAG_UPDATE'
	e:RegisterEvent'BANKFRAME_OPENED'
	e:SetScript('OnEvent', BagSpaceBarUpdate)

	--
