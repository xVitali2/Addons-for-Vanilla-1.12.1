Postal = CreateFrame('Frame', nil, MailFrame)
local _G = getfenv(0)
setfenv(1, setmetatable(Postal, {__index=_G}))

do
	local f = CreateFrame'Frame'
	f:SetScript('OnEvent', function() Postal[event]() end)
	for _, event in {'ADDON_LOADED', 'VARIABLES_LOADED', 'PLAYER_LOGIN', 'UI_ERROR_MESSAGE', 'CURSOR_UPDATE', 'BAG_UPDATE', 'MAIL_CLOSED', 'MAIL_SEND_SUCCESS'} do
		f:RegisterEvent(event)
	end
end

_G.Postal_Characters = {}

local ATTACHMENTS_MAX = 21
local ATTACHMENTS_PER_ROW_SEND = 7
local ATTACHMENTS_MAX_ROWS_SEND = 3

function pack(...) return arg end

hook, orig = {}, {}
function Hook(...)
	for i = 1, arg.n do
		orig[arg[i]] = _G[arg[i]]
		_G[arg[i]] = hook[arg[i]]
	end
end

do
    local state
    CreateFrame('Frame', nil, MailFrame):SetScript('OnUpdate', function()
        if state and state.predicate() then
            local callback = state.callback
            state = nil
            return callback()
        end
    end)
    function When(predicate, callback)
        state = {predicate=predicate, callback=callback}
    end
    function Wait(callback)
        state = {predicate=function() return true end, callback=callback}
    end
    function Kill()
        state = nil
    end
end

do
	local cursorItem
    function CURSOR_UPDATE()
        cursorItem = nil
    end
	function GetCursorItem()
		return cursorItem
	end
	function SetCursorItem(item)
        Wait(function() cursorItem = item end)
	end
end

function BAG_UPDATE()
	if MailFrame:IsVisible() then
		SendMailFrame_Update()
	end
end

function MAIL_CLOSED()
	Abort()
	Inbox_selectedItems = {}
	SendMail_Clear()

	-- Hides the minimap unread mail button if there are no unread mail on closing the mailbox.
	-- Does not scan past the first 50 items since only the first 50 are viewable.
	for i = 1, GetInboxNumItems() do
		if not ({GetInboxHeaderInfo(i)})[9] then return end
	end
	MiniMapMailFrame:Hide()
end

function MAIL_SEND_SUCCESS()
	SendMail_ready = true
end

function UI_ERROR_MESSAGE()
	if Inbox_opening then
		if arg1 == ERR_INV_FULL then
			Abort()
		elseif arg1 == ERR_ITEM_MAX_COUNT then
			Inbox_skip = true
		end
	end
end

function PLAYER_LOGIN()
	local key = GetCVar'realmName' .. '|' .. UnitFactionGroup'player'
	Postal_Characters[key] = Postal_Characters[key] or {}
	for char, lastSeen in Postal_Characters[key] do
		if GetTime() - lastSeen > 60 * 60 * 24 * 30 then
			Postal_Characters[key][char] = nil
		end
	end
	Postal_Characters[key][UnitName'player'] = GetTime()
end

function ADDON_LOADED()
	if arg1 ~= 'Postal' then return end

	UIPanelWindows['MailFrame'].pushable = 1
	UIPanelWindows['FriendsFrame'].pushable = 2

	Inbox_Load()
	SendMail_Load()
end

function VARIABLES_LOADED()
	Hook(
		'OpenMail_Reply',
		'InboxFrame_Update','InboxFrame_OnClick', 'InboxFrameItem_OnEnter',
		'SendMailFrame_Update', 'SendMailFrame_CanSend', 'ClickSendMailItemButton', 'GetContainerItemInfo', 'PickupContainerItem', 'SplitContainerItem', 'UseContainerItem'
	)
end

function hook.OpenMail_Reply(...)
	_G.Postal_To = nil
	return orig.OpenMail_Reply(unpack(arg))
end

function Abort()
	Kill()
	Inbox_opening = false
	Inbox_Lock()
end

function hook.InboxFrame_Update()
	orig.InboxFrame_Update()
	for i = 1, 7 do
		local index = (i + (InboxFrame.pageNum - 1) * 7)
		if index > GetInboxNumItems() then
			_G['MailItem' .. i].check:Hide()
		else
			_G['MailItem' .. i].check:Show()
			_G['MailItem' .. i].check:SetChecked(Inbox_selectedItems[index])
		end
	end
	Inbox_Lock()
end

function hook.InboxFrame_OnClick(index)
	if Inbox_opening then
		this:SetChecked(nil)
	elseif arg1 == 'RightButton' then
		Abort()
		Inbox_OpenMail{index}
	else
		return orig.InboxFrame_OnClick(index)
	end
end

function hook.InboxFrameItem_OnEnter()
	local tooltipSet
	GameTooltip:SetOwner(this, 'ANCHOR_RIGHT')
	if this.index then
		if GetInboxItem(this.index) then
			GameTooltip:SetInboxItem(this.index)
			tooltipSet = true
		end
	end
	if this.money then
		GameTooltip:AddLine(ENCLOSED_MONEY, '', 1, 1, 1)
		SetTooltipMoney(GameTooltip, this.money)
		SetMoneyFrameColor('GameTooltipMoneyFrame', HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
	elseif this.cod then
		GameTooltip:AddLine(COD_AMOUNT, '', 1, 1, 1)
		SetTooltipMoney(GameTooltip, this.cod)
		if this.cod > GetMoney() then
			SetMoneyFrameColor('GameTooltipMoneyFrame', RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
		else
			SetMoneyFrameColor('GameTooltipMoneyFrame', HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
		end
	end
	if tooltipSet and (this.money or this.cod) then
		GameTooltip:SetHeight(GameTooltip:GetHeight() + _G['GameTooltipTextLeft' .. GameTooltip:NumLines()]:GetHeight())
		if GameTooltipMoneyFrame:IsVisible() then
			GameTooltip:SetHeight(GameTooltip:GetHeight() + GameTooltipMoneyFrame:GetHeight())
		end
	end
	GameTooltip:Show()
end

do
	local x = 0
	CreateFrame('Frame', InboxFrame):SetScript('OnUpdate', function()
		if x > 0 then
			x = x - 1
		elseif not Inbox_opening then
			x = 100
			CheckInbox()
		end
	end)
end

function Inbox_Load()
	MailItem1:SetPoint('TOPLEFT', InboxFrame, 'TOPLEFT', 48, -80)
	for i = 1, 7 do
		_G['MailItem' .. i .. 'ExpireTime']:SetPoint('TOPRIGHT', 'MailItem' .. i, 'TOPRIGHT', 10, -4)
		_G['MailItem' .. i]:SetWidth(280)
		local cb = CreateFrame('CheckButton', nil, _G['MailItem' .. i], 'OptionsCheckButtonTemplate')
		cb:SetID(i)
		cb:SetWidth(24)
		cb:SetHeight(24)
		cb:SetPoint('RIGHT', _G['MailItem' .. i], 'LEFT', 1, 0)
		cb:SetScript('OnClick', Inbox_SetSelected)
		cb:SetHitRectInsets(0, 0, 0, 0)
		cb:Hide()
		_G['MailItem' .. i].check = cb
	end

	do
		local btn = CreateFrame('Button', nil, InboxFrame, 'UIPanelButtonTemplate')
		btn:SetPoint('BOTTOM', -10, 90)
		btn:SetWidth(120)
		btn:SetHeight(25)
		btn:SetText(OPENMAIL)
		btn:SetScript('OnClick', Inbox_Collect)
	end

    Inbox_selectedItems = {}
end

function Inbox_SetSelected()
	local index = this:GetID() + (InboxFrame.pageNum - 1) * 7
	Inbox_selectedItems[index] = this:GetChecked()
end

function Inbox_Collect()
	Abort()
	local selected = {}
	if next(Inbox_selectedItems) then
		for i in Inbox_selectedItems do
			tinsert(selected, i)
		end
		sort(selected)
	else
		for i = 1, GetInboxNumItems() do
			tinsert(selected, i)
		end
	end
	Inbox_selectedItems = {}
	Inbox_opening = true
	Inbox_Lock()
	Inbox_OpenMail(selected)
end

function Inbox_OpenMail(selected)
	if getn(selected) == 0 then
		Inbox_opening = false
		Inbox_Lock()
	else
		Inbox_OpenItem(selected[1], GetInboxNumItems(), selected)
	end
end

function Inbox_OpenItem(i, inboxCount, selected)
	Wait(function()
		local _, _, _, _, money, COD, _, item = GetInboxHeaderInfo(i)
		local newInboxCount = GetInboxNumItems()

		if newInboxCount < inboxCount or COD > 0 or Inbox_skip then
			Inbox_skip = false
			tremove(selected, 1)
			if newInboxCount < inboxCount then
				for j in selected do
					selected[j] = selected[j] - 1
				end
			end
			return Inbox_OpenMail(selected)
		elseif item then
			TakeInboxItem(i)
			When(function() return not ({GetInboxHeaderInfo(i)})[8] or GetInboxNumItems() < inboxCount or Inbox_skip end, function()
				return Inbox_OpenItem(i, inboxCount, selected)
			end)
		elseif money > 0 then
			TakeInboxMoney(i)
			When(function() return ({GetInboxHeaderInfo(i)})[5] == 0 or GetInboxNumItems() < inboxCount or Inbox_skip end, function()
				return Inbox_OpenItem(i, inboxCount, selected)
			end)
		else
			DeleteInboxItem(i)
			When(function() return GetInboxNumItems() < inboxCount or Inbox_skip end, function()
				return Inbox_OpenItem(i, inboxCount, selected)
			end)
		end
	end)
end

function Inbox_Lock()
	for i = 1, 7 do
		_G['MailItem' .. i .. 'ButtonIcon']:SetDesaturated(Inbox_opening)
		if Inbox_opening then
			_G['MailItem' .. i .. 'Button']:SetChecked(nil)
		end
	end
end

function hook.SendMailFrame_Update()
    local itemCount = 0
    local itemTitle
    local gap
    -- local last = 0 blizzlike
    local last = SendMail_NumAttachments()

	for i = 1, ATTACHMENTS_MAX do
		local btn = _G['PostalAttachment' .. i]

		local texture, count
		if btn.item then
			texture, count = GetContainerItemInfo(unpack(btn.item))
		end
		if not texture then
			btn:SetNormalTexture(nil)
			_G[btn:GetName() .. 'Count']:Hide()
			btn.item = nil
		else
			btn:SetNormalTexture(texture)
			if count > 1 then
				_G[btn:GetName() .. 'Count']:Show()
				_G[btn:GetName() .. 'Count']:SetText(count)
			else
				_G[btn:GetName() .. 'Count']:Hide()
			end
		end
	end

    if SendMail_NumAttachments() > 0 then
        SendMailCODButton:Enable()
        SendMailCODButtonText:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
    else
		SendMailSendMoneyButton:SetChecked(1)
		SendMailCODButton:SetChecked(nil)
		SendMailMoneyText:SetText(AMOUNT_TO_SEND)
        SendMailCODButton:Disable()
        SendMailCODButtonText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
    end

    MoneyFrame_Update('SendMailCostMoneyFrame', GetSendMailPrice() * max(1, SendMail_NumAttachments()))

	-- Determine how many rows of attachments to show
	local itemRowCount = 1
	local temp = last
	while temp > ATTACHMENTS_PER_ROW_SEND and itemRowCount < ATTACHMENTS_MAX_ROWS_SEND do
		itemRowCount = itemRowCount + 1
		temp = temp - ATTACHMENTS_PER_ROW_SEND
	end

	if not gap and temp == ATTACHMENTS_PER_ROW_SEND and itemRowCount < ATTACHMENTS_MAX_ROWS_SEND then
		itemRowCount = itemRowCount + 1
	end
	if SendMailFrame.maxRowsShown and last > 0 and itemRowCount < SendMailFrame.maxRowsShown then
		itemRowCount = SendMailFrame.maxRowsShown
	else
		SendMailFrame.maxRowsShown = itemRowCount
	end

	-- Compute sizes
	local cursorx = 0
	local cursory = itemRowCount - 1
	local marginxl = 8 + 6
	local marginxr = 40 + 6
	local areax = SendMailFrame:GetWidth() - marginxl - marginxr
	local iconx = PostalAttachment1:GetWidth() + 2
	local icony = PostalAttachment1:GetHeight() + 2
	local gapx1 = floor((areax - (iconx * ATTACHMENTS_PER_ROW_SEND)) / (ATTACHMENTS_PER_ROW_SEND - 1))
	local gapx2 = floor((areax - (iconx * ATTACHMENTS_PER_ROW_SEND) - (gapx1 * (ATTACHMENTS_PER_ROW_SEND - 1))) / 2)
	local gapy1 = 5
	local gapy2 = 6
	local areay = (gapy2 * 2) + (gapy1 * (itemRowCount - 1)) + (icony * itemRowCount)
	local indentx = marginxl + gapx2 + 17
	local indenty = 170 + gapy2 + icony - 13
	local tabx = (iconx + gapx1) - 3 --this magic number changes the attachment spacing
	local taby = (icony + gapy1)
	local scrollHeight = 249 - areay

	PostalHorizontalBarLeft:SetPoint('TOPLEFT', SendMailFrame, 'BOTTOMLEFT', 2 + 15, 184 + areay - 14)

	SendMailScrollFrame:SetHeight(scrollHeight)
	SendMailScrollChildFrame:SetHeight(scrollHeight)

	local SendMailScrollFrameTop = ({SendMailScrollFrame:GetRegions()})[3]
	SendMailScrollFrameTop:SetHeight(scrollHeight)
	SendMailScrollFrameTop:SetTexCoord(0, .484375, 0, scrollHeight / 256)

	StationeryBackgroundLeft:SetHeight(scrollHeight)
	StationeryBackgroundLeft:SetTexCoord(0, 1, 0, scrollHeight / 256)


	StationeryBackgroundRight:SetHeight(scrollHeight)
	StationeryBackgroundRight:SetTexCoord(0, 1, 0, scrollHeight / 256)

    -- Set Items
	for i = 1, ATTACHMENTS_MAX do
		if cursory >= 0 then
			_G['PostalAttachment' .. i]:Enable()
			_G['PostalAttachment' .. i]:Show()
			_G['PostalAttachment' .. i]:SetPoint('TOPLEFT', 'SendMailFrame', 'BOTTOMLEFT', indentx + (tabx * cursorx), indenty + (taby * cursory))
			
			cursorx = cursorx + 1
			if cursorx >= ATTACHMENTS_PER_ROW_SEND then
				cursory = cursory - 1
				cursorx = 0
			end
		else
			_G['PostalAttachment' .. i]:Hide()
		end
	end

	SendMailFrame_CanSend()
end

function hook.SendMailFrame_CanSend()
	if strlen(SendMailNameEditBox:GetText()) > 0 and (SendMailSendMoneyButton:GetChecked() and MoneyInputFrame_GetCopper(SendMailMoney) or 0) + GetSendMailPrice() * max(1, SendMail_NumAttachments()) <= GetMoney() then
		PostalMailButton:Enable()
	else
		PostalMailButton:Disable()
	end
end

function hook.ClickSendMailItemButton()
    SendMail_SetAttachment(GetCursorItem())
end

function hook.GetContainerItemInfo(bag, slot)
    local ret = pack(orig.GetContainerItemInfo(bag, slot))
    ret[3] = ret[3] or SendMail_Attached(bag, slot) and 1 or nil
    return unpack(ret)
end

function hook.PickupContainerItem(bag, slot)
	if SendMail_Attached(bag, slot) then return end
	if GetContainerItemInfo(bag, slot) then SetCursorItem{bag, slot} end
	return orig.PickupContainerItem(bag, slot)
end

function hook.SplitContainerItem(bag, slot, amount)
    if SendMail_Attached(bag, slot) then return end
    return orig.SplitContainerItem(bag, slot, amount)
end

function hook.UseContainerItem(bag, slot, onself)
    if SendMail_Attached(bag, slot) then return end
    if IsShiftKeyDown() or IsControlKeyDown() or IsAltKeyDown() then
        return orig.UseContainerItem(bag, slot, onself)
    elseif SendMailFrame:IsVisible() then
        SendMail_SetAttachment{bag, slot}
    elseif TradeFrame:IsVisible() then
        for i = 1, 6 do
            if not GetTradePlayerItemLink(i) then
                orig.PickupContainerItem(bag, slot)
                ClickTradeButton(i)
                return
            end
        end
    else
        return orig.UseContainerItem(bag, slot, onself)
    end
end

function PostalMailButton_OnClick()
	Abort()
	PostalAutoCompleteBox:Hide()

	_G.Postal_To = SendMailNameEditBox:GetText()
	SendMailNameEditBox:HighlightText()

	SendMail_state = {
	    to = Postal_To,
	    subject = PostalSubjectEditBox:GetText(),
	    body = SendMailBodyEditBox:GetText(),
	    money = MoneyInputFrame_GetCopper(SendMailMoney),
	    cod = SendMailCODButton:GetChecked(),
	    attachments = SendMail_Attachments(),
	    numMessages = max(1, SendMail_NumAttachments()),
	}

	SendMail_Clear()

	When(function()
		return SendMail_ready
	end, function()
		SendMail_Send()
	end)
end

function SendMail_Load()
	SendMailFrame:CreateTexture('PostalHorizontalBarLeft', 'BACKGROUND')
    PostalHorizontalBarLeft:SetTexture([[Interface\ClassTrainerFrame\UI-ClassTrainer-HorizontalBar]])
    PostalHorizontalBarLeft:SetWidth(256)
    PostalHorizontalBarLeft:SetHeight(16)
    PostalHorizontalBarLeft:SetTexCoord(0, 1, 0, .25)
    SendMailFrame:CreateTexture('PostalHorizontalBarRight', 'BACKGROUND')
    PostalHorizontalBarRight:SetTexture([[Interface\ClassTrainerFrame\UI-ClassTrainer-HorizontalBar]])
    PostalHorizontalBarRight:SetWidth(75)
    PostalHorizontalBarRight:SetHeight(16)
    PostalHorizontalBarRight:SetTexCoord(0, .29296875, .25, .5)
    PostalHorizontalBarRight:SetPoint('LEFT', PostalHorizontalBarLeft, 'RIGHT')

    do
        local background = ({SendMailPackageButton:GetRegions()})[1]
        background:Hide()
        local count = ({SendMailPackageButton:GetRegions()})[3]
        count:Hide()
        SendMailPackageButton:Disable()
        SendMailPackageButton:SetScript('OnReceiveDrag', nil)
        SendMailPackageButton:SetScript('OnDragStart', nil)
    end

    SendMailMoneyText:SetPoint('TOPLEFT', 0, 0)
    SendMailMoney:ClearAllPoints()
    SendMailMoney:SetPoint('TOPLEFT', SendMailMoneyText, 'BOTTOMLEFT', 5, -5)
    SendMailMoneyGoldRight:SetPoint('RIGHT', 20, 0)
   	do ({SendMailMoneyGold:GetRegions()})[9]:SetDrawLayer('BORDER') end
   	SendMailMoneyGold:SetMaxLetters(7)
   	SendMailMoneyGold:SetWidth(50)
    SendMailMoneySilverRight:SetPoint('RIGHT', 10, 0)
    do ({SendMailMoneySilver:GetRegions()})[9]:SetDrawLayer('BORDER') end
    SendMailMoneySilver:SetWidth(28)
    SendMailMoneySilver:SetPoint('LEFT', SendMailMoneyGold, 'RIGHT', 30, 0)
    SendMailMoneyCopperRight:SetPoint('RIGHT', 10, 0)
    do ({SendMailMoneyCopper:GetRegions()})[9]:SetDrawLayer('BORDER') end
    SendMailMoneyCopper:SetWidth(28)
    SendMailMoneyCopper:SetPoint('LEFT', SendMailMoneySilver, 'RIGHT', 20, 0)  
    SendMailSendMoneyButton:SetPoint('TOPLEFT', SendMailMoney, 'TOPRIGHT', 0, 12)

    -- hack to avoid automatic subject setting and button disabling from weird blizzard code
	PostalMailButton = SendMailMailButton
	_G.SendMailMailButton = setmetatable({}, {__index = function() return function() end end})
    _G.SendMailMailButton_OnClick = PostalMailButton_OnClick
    PostalSubjectEditBox = SendMailSubjectEditBox
    _G.SendMailSubjectEditBox = setmetatable({}, {
    	__index = function(_, key)
    		return function(_, ...)
    			return PostalSubjectEditBox[key](PostalSubjectEditBox, unpack(arg))
    		end
    	end,
    })

	SendMailNameEditBox._SetText = SendMailNameEditBox.SetText
	function SendMailNameEditBox:SetText(...)
		if not Postal_To then
			return self:_SetText(unpack(arg))
		end
	end
	SendMailNameEditBox:SetScript('OnShow', function()
		if Postal_To then
			this:_SetText(Postal_To)
		end
    end)
	SendMailNameEditBox:SetScript('OnChar', function()
		_G.Postal_To = nil
		GetSuggestions()
    end)
    SendMailNameEditBox:SetScript('OnTabPressed', function()
    	if PostalAutoCompleteBox:IsVisible() then
    		if IsShiftKeyDown() then
    			PreviousMatch()
			else
				NextMatch()
			end
		else
			PostalSubjectEditBox:SetFocus()
		end
    end)
    SendMailNameEditBox:SetScript('OnEnterPressed', function()
    	if PostalAutoCompleteBox:IsVisible() then
    		PostalAutoCompleteBox:Hide()
    		this:HighlightText(0, 0)
		else
			PostalSubjectEditBox:SetFocus()
		end
    end)
    SendMailNameEditBox:SetScript('OnEscapePressed', function()
    	if PostalAutoCompleteBox:IsVisible() then
    		PostalAutoCompleteBox:Hide()
		else
			this:ClearFocus()
		end
    end)
    function SendMailNameEditBox.focusLoss()
    	PostalAutoCompleteBox:Hide()
	end

	for _, editBox in {SendMailNameEditBox, SendMailSubjectEditBox} do
		editBox:SetScript('OnEditFocusGained', function()
			this:HighlightText()
	    end)
	    editBox:SetScript('OnEditFocusLost', function()
	    	(this.focusLoss or function() end)()
	    	this:HighlightText(0, 0)
	    end)
	    do
	        local lastClick
		    editBox:SetScript('OnMouseDown', function()
	            local x, y = GetCursorPosition()
	            if lastClick and GetTime() - lastClick.t < .5 and x == lastClick.x and y == lastClick.y then
	            	this:SetScript('OnUpdate', function()
	            		this:HighlightText()
	            		this:SetScript('OnUpdate', nil)
	            	end)
	            end
	            lastClick = {t=GetTime(), x=x, y=y}
	        end)
    	end
	end

    SendMail_ready = true
end

function SendMail_Attached(bag, slot)
	if not MailFrame:IsVisible() then return false end
    for i = 1, ATTACHMENTS_MAX do
        local btn = _G['PostalAttachment' .. i]
        if btn.item and btn.item[1] == bag and btn.item[2] == slot then
            return true
        end
    end
    if not SendMail_state then
        return
    end
    for _, attachment in SendMail_state.attachments do
        if attachment[1] == bag and attachment[2] == slot then
            return true
        end
    end
end

function AttachmentButton_OnClick()
	local attachedItem = this.item
	local cursorItem = GetCursorItem()
	if SendMail_SetAttachment(cursorItem, this) then
		if attachedItem then
			if arg1 == 'LeftButton' then SetCursorItem(attachedItem) end
			orig.PickupContainerItem(unpack(attachedItem))
			if arg1 ~= 'LeftButton' then ClearCursor() end -- for the lock changed event
	    end
	end
end

-- requires an item lock changed event for a proper update
function SendMail_SetAttachment(item, slot)
	if item and not SendMail_PickupMailable(item) then
		ClearCursor()
		return
    elseif not slot then
		for i = 1, ATTACHMENTS_MAX do
			if not _G['PostalAttachment' .. i].item then
				slot = _G['PostalAttachment' .. i]
	            break
			end
		end
	end
	if slot then
		if not (item or slot.item) then return true end
		slot.item = item
		ClearCursor()
	    SendMailFrame_Update()
	    return true
	end
end

function SendMail_PickupMailable(item)
	ClearCursor()
	orig.ClickSendMailItemButton()
	ClearCursor()
	orig.PickupContainerItem(unpack(item))
	orig.ClickSendMailItemButton()
	local mailable = GetSendMailItem() and true or false
	orig.ClickSendMailItemButton()
	return mailable
end

function SendMail_NumAttachments()
	local num = 0
	for i = 1, ATTACHMENTS_MAX do
		if _G['PostalAttachment' .. i].item then
			num = num + 1
		end
	end
	return num
end

function SendMail_Attachments()
    local arr = {}
    for i = 1, ATTACHMENTS_MAX do
        local btn = _G['PostalAttachment' .. i]
        if btn.item then
            tinsert(arr, btn.item)
        end
    end
    return arr
end

function SendMail_Clear()
	local anyItem
	for i = 1, ATTACHMENTS_MAX do
		anyItem = anyItem or _G['PostalAttachment' .. i].item
        _G['PostalAttachment' .. i].item = nil
	end
	if anyItem then
		ClearCursor()
		PickupContainerItem(unpack(anyItem))
		ClearCursor()
	end
	PostalMailButton:Disable()
	SendMailNameEditBox:SetText''
	SendMailNameEditBox:SetFocus()
	PostalSubjectEditBox:SetText''
	SendMailBodyEditBox:SetText''
	MoneyInputFrame_ResetMoney(SendMailMoney)
	SendMailRadioButton_OnClick(1)

	SendMailFrame_Update()
end

function SendMail_Send()
	local item = tremove(SendMail_state.attachments, 1)
	if item then
		ClearCursor()
		orig.ClickSendMailItemButton()
		ClearCursor()
		orig.PickupContainerItem(unpack(item))
		orig.ClickSendMailItemButton()

		if not GetSendMailItem() then
            DEFAULT_CHAT_FRAME:AddMessage('Postal: ' .. ERROR_CAPS, 1, 0, 0)
            return
		end
	end

	local amount = SendMail_state.money
	if amount > 0 then
		SendMail_state.money = 0
		if SendMail_state.cod then
			SetSendMailCOD(amount)
		else
			SetSendMailMoney(amount)
		end
	end

	local subject = SendMail_state.subject
	if subject == '' then
		if item then
			local itemName, itemTexture, stackCount, quality = GetSendMailItem()
			subject = itemName .. (stackCount > 1 and ' (' .. stackCount .. ')' or '')
		else
			subject = '<' .. NO_ATTACHMENTS .. '>'
		end
	elseif SendMail_state.numMessages > 1 then
		subject = subject .. format(' [%d/%d]', SendMail_state.numMessages - getn(SendMail_state.attachments), SendMail_state.numMessages)
	end

    SendMail(SendMail_state.to, subject, SendMail_state.body)
    SendMail_ready = false

    if getn(SendMail_state.attachments) > 0 then
	    When(function()
	    	return SendMail_ready
	    end, function()
	    	SendMail_Send()
	    end)
    end
end

do
	local inputLength
	local matches = {}
	local index

	local function complete()
		SendMailNameEditBox:SetText(matches[index])
		SendMailNameEditBox:HighlightText(inputLength, -1)
		for i = 1, POSTAL_AUTOCOMPLETE_MAX_BUTTONS do
			local button = _G['PostalAutoCompleteButton' .. i]
			if i == index then
				button:LockHighlight()
    		else
    			button:UnlockHighlight()
			end
		end
	end

	function PreviousMatch()
		if index then
			index = index > 1 and index - 1 or getn(matches)
			complete()
		end
	end

	function NextMatch()
		if index then
			index = mod(index, getn(matches)) + 1
			complete()
		end
	end

	function SelectMatch(i)
		index = i
		complete()
		PostalAutoCompleteBox:Hide()
		SendMailNameEditBox:HighlightText(0, 0)
	end

	function GetSuggestions()
		local input = SendMailNameEditBox:GetText()
		inputLength = strlen(input)

		table.setn(matches, 0)
		index = nil

		local ignore = {[UnitName'player']=true}
		local function process(name)
			if name then
				if not ignore[name] and strfind(strupper(name), strupper(input), nil, true) == 1 then
					tinsert(matches, name)
				end
				ignore[name] = true
			end
		end
		for character in Postal_Characters[GetCVar'realmName' .. '|' .. UnitFactionGroup'player'] do
			process(character)
		end
		for i = 1, GetNumFriends() do
			process(GetFriendInfo(i))
		end
		for i = 1, GetNumGuildMembers(true) do
			process(GetGuildRosterInfo(i))
		end

		table.setn(matches, min(getn(matches), POSTAL_AUTOCOMPLETE_MAX_BUTTONS))
		if getn(matches) > 0 and (getn(matches) > 1 or input ~= matches[1]) then
			for i = 1, POSTAL_AUTOCOMPLETE_MAX_BUTTONS do
				local button = _G['PostalAutoCompleteButton' .. i]
				if i <= getn(matches) then
					button:SetText(matches[i])
		    		button:GetFontString():SetPoint('LEFT', button, 'LEFT', 15, 0)
		    		button:Show()
	    		else
	    			button:Hide()
    			end
			end
			PostalAutoCompleteBox:SetHeight(getn(matches) * PostalAutoCompleteButton1:GetHeight() + 35)
			PostalAutoCompleteBox:SetWidth(120)
			PostalAutoCompleteBox:Show()
			index = 1
			complete()
		else
			PostalAutoCompleteBox:Hide()
		end
	end
end