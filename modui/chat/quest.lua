

    if IsAddOnLoaded'!Questie' or IsAddOnLoaded'Questie' then return end

    local orig = {}

    local tip = CreateFrame('GameTooltip', 'QuestTip', UIParent, 'GameTooltipTemplate')
    tip:EnableMouse(true) tip:SetMovable(true) tip:RegisterForDrag'LeftButton'
    tip:SetWidth(128) tip:SetHeight(64)
    tip:SetPoint('CENTER', 0, 0)
    tip:SetPadding(16)
    tip:SetScript('OnLoad', GameTooltip_OnLoad)
    tip:SetScript('OnDragStart', function() tip:StartMoving() end)
    tip:SetScript('OnDragStop',  function() tip:StopMovingOrSizing() ValidateFramePosition(tip) end)

    modSkin(tip, 18)
    modSkinPadding(tip, -1)
    modSkinColor(tip, .15, .15, .15)

    local x = CreateFrame('Button', 'QuestTipCloseButton', tip)
    x:SetWidth(32) x:SetHeight(32)
    x:SetPoint('TOPRIGHT', -1, -1)
    x:SetNormalTexture[[Interface\Buttons\UI-Panel-MinimizeButton-Up]]
    x:SetPushedTexture[[Interface\Buttons\UI-Panel-MinimizeButton-Down]]
    x:SetHighlightTexture[[Interface\Buttons\UI-Panel-MinimizeButton-Highlight]]
    x:SetScript('OnClick', function() HideUIPanel(tip) end)

    orig.ChatFrame_OnHyperlinkShow = ChatFrame_OnHyperlinkShow
    function ChatFrame_OnHyperlinkShow(link, text, button)
    	if strsub(link, 1, 6) == 'quest2' then
    		if text then
    			local ds = string.find(text, 'quest2:', 1, true)
    			local ns = string.find(text, '\124h', 1, true)
    			local ne = string.find(text, '\124h\124r', 1, true)
    			if not ns or not ne then return end
    			local name = '\124cffffff00'..strsub(text, ns + 2, ne - 1)..'\124r'
    			local desc = nil
    			if ds then desc = strsub(text, ds + 7, ns - 1) end
    			ShowUIPanel(QuestLinkTooltip)
    			if not tip:IsVisible() then
    				tip:SetOwner(UIParent, 'ANCHOR_PRESERVE')
    			end
    			tip:SetText(name)
    			if desc then
    				tip:AddLine(desc, 255, 255, 255, 255, 1)
    				tip:Show()
    			end
    		end
            return
    	end
        orig.ChatFrame_OnHyperlinkShow(link, text, button)
    end

    function QuestLogTitleButton_OnClick(button)
    	local qname = this:GetText()
    	local qi =    this:GetID() + FauxScrollFrame_GetOffset(QuestLogListScrollFrame)
    	if IsShiftKeyDown() then
    		-- If header then return
    		if this.isHeader then return end
    		-- Otherwise try to track it or put it into chat
    		if ChatFrameEditBox:IsVisible() then
    			local msg = '\124cffffff00\124Hquest2'
    			local name = gsub(qname, ' *(.*)', '%1')
    			local _, desc      = GetQuestLogQuestText()
                local _, lvl, tag  = GetQuestLogTitle(qi)
    			if desc then
    				msg = msg .. ':'
    				if strlen(name) + strlen(desc) > 225 then
    					msg = msg..'Quest description too long'
    				else
    					msg = msg..desc
    				end
    			end
    			msg = msg..'\124h'..'['..lvl..(tag ~= nil and '+' or '')..'] '..name..'\124h\124r'
    			ChatFrameEditBox:Insert(msg)
    		else
    			if IsQuestWatched(qi) then
    				tremove(QUEST_WATCH_LIST, qi)
    				RemoveQuestWatch(qi)
    				QuestWatch_Update()
    			else
    				if GetNumQuestLeaderBoards(questIndex) == 0 then
    					UIErrorsFrame:AddMessage(QUEST_WATCH_NO_OBJECTIVES, 1, 1, .1)
    					return
    				end
    				if GetNumQuestWatches() >= MAX_WATCHABLE_QUESTS then
    					UIErrorsFrame:AddMessage(format(QUEST_WATCH_TOO_MANY, MAX_WATCHABLE_QUESTS), 1.0, 0.1, 0.1, 1.0);
    					return
    				end
    				AutoQuestWatch_Insert(qi, QUEST_WATCH_NO_EXPIRE)
    				QuestWatch_Update()
    			end
            end
    	end
    	QuestLog_SetSelection(qi)
    	QuestLog_Update()
    end

   --
