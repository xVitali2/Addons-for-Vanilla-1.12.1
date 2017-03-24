postal = CreateFrame('Frame', nil, MailFrame)
local _G = getfenv(0)
setfenv(1, setmetatable(postal, {__index=_G}))

do
	local f = CreateFrame'Frame'
	f:SetScript('OnEvent', function() postal[event]() end)
	for _, event in {'ADDON_LOADED', 'PLAYER_LOGIN', 'UI_ERROR_MESSAGE', 'CURSOR_UPDATE', 'BAG_UPDATE', 'MAIL_CLOSED', 'MAIL_SEND_SUCCESS'} do
		f:RegisterEvent(event)
	end
end

_G.postal_Characters = {}

local ATTACHMENTS_MAX = 21
local ATTACHMENTS_PER_ROW_SEND = 7
local ATTACHMENTS_MAX_ROWS_SEND = 3

function pack(...) return arg end

orig = {}
hook = setmetatable({}, {__newindex=function(_, k, v) orig[k] = _G[k]; _G[k] = v end})

do
	local f = CreateFrame'Frame'
	local cursorItem
    function CURSOR_UPDATE()
        cursorItem = nil
    end
	function GetCursorItem()
		return cursorItem
	end
	function SetCursorItem(item)
		f:SetScript('OnUpdate', function()
			cursorItem = item
			f:SetScript('OnUpdate', nil)
		end)
	end
end

function BAG_UPDATE()
	if MailFrame:IsVisible() then
		SendMailFrame_Update()
	end
end

function MAIL_CLOSED()
	Inbox_Abort()
	SendMail_Abort()
	SendMail_Clear()

	-- Hides the minimap unread mail button if there are no unread mail on closing the mailbox.
	-- Does not scan past the first 50 items since only the first 50 are viewable.
	for i = 1, GetInboxNumItems() do
		if not ({GetInboxHeaderInfo(i)})[9] then return end
	end
	MiniMapMailFrame:Hide()
end

function MAIL_SEND_SUCCESS()
	SendMail_sending = false
end

function UI_ERROR_MESSAGE()
	if Inbox_opening then
		if arg1 == ERR_INV_FULL then
			Inbox_Abort()
		elseif arg1 == ERR_ITEM_MAX_COUNT then
			Inbox_skip = true
		end
	elseif SendMail_sending and (arg1 == ERR_MAIL_TO_SELF or arg1 == ERR_MAIL_TARGET_NOT_FOUND or arg1 == ERR_MAIL_REACHED_CAP) then
		SendMail_sending = false
		SendMail_Abort()
		SendMail_state = nil
		ClearCursor()
		orig.ClickSendMailItemButton()
		ClearCursor()
	end
end

function PLAYER_LOGIN()
	local key = GetCVar'realmName' .. '|' .. UnitFactionGroup'player'
	postal_Characters[key] = postal_Characters[key] or {}
	for char, lastSeen in postal_Characters[key] do
		if GetTime() - lastSeen > 60 * 60 * 24 * 30 then
			postal_Characters[key][char] = nil
		end
	end
	postal_Characters[key][UnitName'player'] = GetTime()
end

function ADDON_LOADED()
	if arg1 ~= 'postal' then return end

	UIPanelWindows.MailFrame.pushable = 1
	UIPanelWindows.FriendsFrame.pushable = 2

	Inbox_Load()
	SendMail_Load()
end

function hook.OpenMail_Reply(...)
	_G.postal_To = nil
	return orig.OpenMail_Reply(unpack(arg))
end

function hook.InboxFrame_Update()
	orig.InboxFrame_Update()
	for i = 1, 7 do
		 -- hack for tooltip update
		_G['MailItem' .. i]:Hide()
		_G['MailItem' .. i]:Show()
	end
	Inbox_UpdateLock()
end

function hook.InboxFrame_OnClick(i)
	if Inbox_opening or arg1 == 'RightButton' and ({GetInboxHeaderInfo(i)})[6] > 0 then
		this:SetChecked(nil)
	elseif arg1 == 'RightButton' then
		Inbox_Open(i)
	else
		return orig.InboxFrame_OnClick(i)
	end
end

function hook.InboxFrameItem_OnEnter()
	orig.InboxFrameItem_OnEnter()
	if GetInboxItem(this.index) then
		GameTooltip:AddLine(ITEM_OPENABLE, '', 0, 1, 0)
		GameTooltip:Show()
	end
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
	local btn = CreateFrame('Button', nil, InboxFrame, 'UIPanelButtonTemplate')
	btn:SetPoint('BOTTOM', -10, 90)
	btn:SetWidth(120)
	btn:SetHeight(25)
	btn:SetText(OPENMAIL)
	btn:SetScript('OnClick', Inbox_OpenAll)
end

do
	local i
	local f = CreateFrame'Frame'
	f:Hide()
	f:SetScript('OnUpdate', function()
		Inbox_opening = true
		local _, _, _, _, _, COD = GetInboxHeaderInfo(i)
		if i > GetInboxNumItems() then
			Inbox_Abort()
		elseif Inbox_Skip or COD > 0 then
			Inbox_Skip = false
			i = i + 1
		else
			Inbox_Open(i)
		end
	end)
	function Inbox_OpenAll()
		Inbox_opening = true
		Inbox_UpdateLock()
		i = 1
		Inbox_skip = false
		f:Show()
	end
	function Inbox_Abort()
		Inbox_opening = false
		Inbox_UpdateLock()
		f:Hide()
	end
end

function Inbox_Open(i)
	TakeInboxMoney(i)
	TakeInboxItem(i)
	DeleteInboxItem(i)
end

function Inbox_UpdateLock()
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
		local btn = _G['postalAttachment' .. i]

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
	local iconx = postalAttachment1:GetWidth() + 2
	local icony = postalAttachment1:GetHeight() + 2
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

	postalHorizontalBarLeft:SetPoint('TOPLEFT', SendMailFrame, 'BOTTOMLEFT', 2 + 15, 184 + areay - 14)

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
			_G['postalAttachment' .. i]:Enable()
			_G['postalAttachment' .. i]:Show()
			_G['postalAttachment' .. i]:SetPoint('TOPLEFT', 'SendMailFrame', 'BOTTOMLEFT', indentx + (tabx * cursorx), indenty + (taby * cursory))
			
			cursorx = cursorx + 1
			if cursorx >= ATTACHMENTS_PER_ROW_SEND then
				cursory = cursory - 1
				cursorx = 0
			end
		else
			_G['postalAttachment' .. i]:Hide()
		end
	end

	SendMailFrame_CanSend()
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
    elseif MailFrame:IsVisible() then
    	MailFrameTab_OnClick(2)
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

function postalMailButton_OnClick()
	postalAutoCompleteBox:Hide()

	_G.postal_To = SendMailNameEditBox:GetText()
	SendMailNameEditBox:HighlightText()

	SendMail_state = {
	    to = postal_To,
	    subject = postalSubjectEditBox:GetText(),
	    body = SendMailBodyEditBox:GetText(),
	    money = MoneyInputFrame_GetCopper(SendMailMoney),
	    cod = SendMailCODButton:GetChecked(),
	    attachments = SendMail_Attachments(),
	    numMessages = max(1, SendMail_NumAttachments()),
	}

	SendMail_Clear()
	SendMail_SendAll()
end

function SendMail_Load()
	SendMailFrame:CreateTexture('postalHorizontalBarLeft', 'BACKGROUND')
    postalHorizontalBarLeft:SetTexture([[Interface\ClassTrainerFrame\UI-ClassTrainer-HorizontalBar]])
    postalHorizontalBarLeft:SetWidth(256)
    postalHorizontalBarLeft:SetHeight(16)
    postalHorizontalBarLeft:SetTexCoord(0, 1, 0, .25)
    SendMailFrame:CreateTexture('postalHorizontalBarRight', 'BACKGROUND')
    postalHorizontalBarRight:SetTexture([[Interface\ClassTrainerFrame\UI-ClassTrainer-HorizontalBar]])
    postalHorizontalBarRight:SetWidth(75)
    postalHorizontalBarRight:SetHeight(16)
    postalHorizontalBarRight:SetTexCoord(0, .29296875, .25, .5)
    postalHorizontalBarRight:SetPoint('LEFT', postalHorizontalBarLeft, 'RIGHT')

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
	postalMailButton = SendMailMailButton
	_G.SendMailMailButton = setmetatable({}, {__index = function() return function() end end})
    _G.SendMailMailButton_OnClick = postalMailButton_OnClick
    postalSubjectEditBox = SendMailSubjectEditBox
    _G.SendMailSubjectEditBox = setmetatable({}, {
    	__index = function(_, key)
    		return function(_, ...)
    			return postalSubjectEditBox[key](postalSubjectEditBox, unpack(arg))
    		end
    	end,
    })

	SendMailNameEditBox._SetText = SendMailNameEditBox.SetText
	function SendMailNameEditBox:SetText(...)
		if not postal_To then
			return self:_SetText(unpack(arg))
		end
	end
	SendMailNameEditBox:SetScript('OnShow', function()
		if postal_To then
			this:_SetText(postal_To)
		end
    end)
	SendMailNameEditBox:SetScript('OnChar', function()
		_G.postal_To = nil
		GetSuggestions()
    end)
    SendMailNameEditBox:SetScript('OnTabPressed', function()
    	if postalAutoCompleteBox:IsVisible() then
    		if IsShiftKeyDown() then
    			PreviousMatch()
			else
				NextMatch()
			end
		else
			postalSubjectEditBox:SetFocus()
		end
    end)
    SendMailNameEditBox:SetScript('OnEnterPressed', function()
    	if postalAutoCompleteBox:IsVisible() then
    		postalAutoCompleteBox:Hide()
    		this:HighlightText(0, 0)
		else
			postalSubjectEditBox:SetFocus()
		end
    end)
    SendMailNameEditBox:SetScript('OnEscapePressed', function()
    	if postalAutoCompleteBox:IsVisible() then
    		postalAutoCompleteBox:Hide()
		else
			this:ClearFocus()
		end
    end)
    function SendMailNameEditBox.focusLoss()
    	postalAutoCompleteBox:Hide()
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
end

do
	local f = CreateFrame'Frame'
	f:Hide()
    f:SetScript('OnUpdate', function()
        if not SendMail_sending then
            SendMail_Send()
        end
    end)
    function SendMail_SendAll()
        f:Show()
    end
    function SendMail_Abort()
        f:Hide()
    end
end

function hook.SendMailFrame_CanSend()
	if not SendMail_sending and strlen(SendMailNameEditBox:GetText()) > 0 and (SendMailSendMoneyButton:GetChecked() and MoneyInputFrame_GetCopper(SendMailMoney) or 0) + GetSendMailPrice() * max(1, SendMail_NumAttachments()) <= GetMoney() then
		postalMailButton:Enable()
	else
		postalMailButton:Disable()
	end
end

function SendMail_Attached(bag, slot)
	if not MailFrame:IsVisible() then return false end
    for i = 1, ATTACHMENTS_MAX do
        local btn = _G['postalAttachment' .. i]
        if btn.item and btn.item[1] == bag and btn.item[2] == slot then
            return true
        end
    end
    if SendMail_state then
	    for _, attachment in SendMail_state.attachments do
	        if attachment[1] == bag and attachment[2] == slot then
	            return true
	        end
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
			if not _G['postalAttachment' .. i].item then
				slot = _G['postalAttachment' .. i]
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
	local x = 0
	for i = 1, ATTACHMENTS_MAX do
		if _G['postalAttachment' .. i].item then
			x = x + 1
		end
	end
	return x
end

function SendMail_Attachments()
    local t = {}
    for i = 1, ATTACHMENTS_MAX do
        local btn = _G['postalAttachment' .. i]
        if btn.item then
            tinsert(t, btn.item)
        end
    end
    return t
end

function SendMail_Clear()
	local anyItem
	for i = 1, ATTACHMENTS_MAX do
		anyItem = anyItem or _G['postalAttachment' .. i].item
        _G['postalAttachment' .. i].item = nil
	end
	if anyItem then
		ClearCursor()
		PickupContainerItem(unpack(anyItem))
		ClearCursor()
	end
	postalMailButton:Disable()
	SendMailNameEditBox:SetText''
	SendMailNameEditBox:SetFocus()
	postalSubjectEditBox:SetText''
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
            DEFAULT_CHAT_FRAME:AddMessage('postal: ' .. ERROR_CAPS, 1, 0, 0)
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
    SendMail_sending = true

    if getn(SendMail_state.attachments) == 0 then
    	SendMail_Abort()
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
			local button = _G['postalAutoCompleteButton' .. i]
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
		postalAutoCompleteBox:Hide()
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
		for character in postal_Characters[GetCVar'realmName' .. '|' .. UnitFactionGroup'player'] do
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
				local button = _G['postalAutoCompleteButton' .. i]
				if i <= getn(matches) then
					button:SetText(matches[i])
		    		button:GetFontString():SetPoint('LEFT', button, 'LEFT', 15, 0)
		    		button:Show()
	    		else
	    			button:Hide()
    			end
			end
			postalAutoCompleteBox:SetHeight(getn(matches) * postalAutoCompleteButton1:GetHeight() + 35)
			postalAutoCompleteBox:SetWidth(120)
			postalAutoCompleteBox:Show()
			index = 1
			complete()
		else
			postalAutoCompleteBox:Hide()
		end
	end
end