

    local slots = MainMenuBarBackpackButton:CreateFontString(nil, 'OVERLAY', 'NumberFontNormal')
    slots:SetPoint('BOTTOM', MainMenuBarBackpackButton, 1, 4)

    local bagspace = function()
    	local ct = 0
    	for bag = 0, NUM_BAG_SLOTS do           --  TODO: link this up with a global function for our
                                                --  bag space statusbar etc.
    		for slot = 1, GetContainerNumSlots(bag) do
    			local  link = GetContainerItemLink(bag, slot)
    			if not link then ct = ct + 1 end
    		end
    	end
    	return ct
    end

    local handler = function()
        local n = bagspace()
        if n == 0 then slots:SetText'|cffff0000Full!|r' else slots:SetText(n) end
    end

    local f = CreateFrame'Frame'
    f:RegisterEvent'PLAYER_ENTERING_WORLD' f:RegisterEvent'BAG_UPDATE'
    f:SetScript('OnEvent', handler)

    --
