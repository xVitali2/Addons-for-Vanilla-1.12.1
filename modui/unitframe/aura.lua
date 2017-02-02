

    if tonumber(GetCVar'modUnitFrame') == 0 then return end

    local orig = {}

    local anchor = function(num)
        if num and  num > 5 then return '6' end
        return '1'
    end

    function TargetDebuffButton_Update()
        local cv  = _G['modui_vars'].db['modAuraOrientation']
        local tot = TargetofTargetFrame:IsShown()
        local numBuff, numDebuff = 0, 0

        for i = 1, MAX_TARGET_BUFFS do
    		local buff = UnitBuff('target', i)
    		local bu = _G['TargetFrameBuff'..i]
    		if  buff then
    			_G['TargetFrameBuff'..i..'Icon']:SetTexture(buff)
    			bu:Show()
    			bu.id = i
    			numBuff = numBuff + 1
    		else
    			bu:Hide()
    		end
        end

    	for i = 1, MAX_TARGET_DEBUFFS do
            local texture, stacks, dtype = UnitDebuff('target', i)
            local bu     = _G['TargetFrameDebuff'..i]
            local border = _G['TargetFrameDebuff'..i..'Border']
            if  texture then
                local icon   = _G['TargetFrameDebuff'..i..'Icon']
                local count  = _G['TargetFrameDebuff'..i..'Count']
                local colour = DebuffTypeColor[dtype] or DebuffTypeColor['none']
    			icon:SetTexture(texture)
    			if stacks > 1 then
    				count:SetText(stacks)
    				count:Show()
    			else
    				count:Hide()
    			end
                modSkinColor(bu, colour.r*.7, colour.g*.7, colour.b*.7)
                border:Hide()
    			bu:Show()
    			numDebuff = numDebuff + 1
    		else
    			bu:Hide()
    		end
    		bu.id = i
    	end

        if UnitIsFriend('player', 'target') then
            if cv == 0 then
                TargetFrameBuff1:ClearAllPoints()
                TargetFrameBuff1:SetPoint('TOPLEFT', TargetFrame, 'BOTTOMLEFT', 7, 32)
                TargetFrameDebuff1:ClearAllPoints()
                TargetFrameDebuff1:SetPoint('TOPLEFT', _G['TargetFrameBuff1'], 'BOTTOMLEFT', 0, -4)
            else
                TargetFrameBuff1:ClearAllPoints()
                TargetFrameBuff1:SetPoint('BOTTOMLEFT', TargetFrame, 'TOPLEFT', 7, -20)
                TargetFrameDebuff1:ClearAllPoints()
                TargetFrameDebuff1:SetPoint('BOTTOMLEFT', _G['TargetFrameBuff1'], 'TOPLEFT', 0, 5)
            end
        else
            if cv == 0 then
                TargetFrameDebuff1:ClearAllPoints()
                TargetFrameDebuff1:SetPoint('TOPLEFT', TargetFrame, 'BOTTOMLEFT', 7, 32)
                TargetFrameBuff1:ClearAllPoints()
                TargetFrameBuff1:SetPoint('TOPLEFT', _G['TargetFrameDebuff1'], 'BOTTOMLEFT', 0, -4)
            else
                TargetFrameDebuff1:ClearAllPoints()
                TargetFrameDebuff1:SetPoint('BOTTOMLEFT', TargetFrame, 'TOPLEFT', 7, -20)
                if (not tot) or numDebuff < 5 then
                    TargetFrameBuff1:ClearAllPoints()
                    TargetFrameBuff1:SetPoint('BOTTOMLEFT', _G['TargetFrameDebuff1'], 'TOPLEFT', 2, 5)
                elseif numDebuff > 4 and numDebuff < 10 then
                    TargetFrameBuff1:ClearAllPoints()
                    TargetFrameBuff1:SetPoint('BOTTOMLEFT', _G['TargetFrameDebuff6'], 'TOPLEFT', 2, 5)
                elseif numDebuff > 10 then
                    TargetFrameBuff1:ClearAllPoints()
                    TargetFrameBuff1:SetPoint('BOTTOMLEFT', _G['TargetFrameDebuff11'], 'TOPLEFT', 2, 5)
                end
            end
        end

        if  tot then
    		wrap = 5
    	else
    		wrap = 6
    	end

        if ((tot and (numBuff == 5)) or (numDebuff >= wrap)) then
    		dSize = 17
    	else
    		dSize = 21
    	end

        for i = 1, 5 do
    		local bu = _G['TargetFrameBuff'..i]
    		if  bu then
    			bu:SetWidth(dSize)
    			bu:SetHeight(dSize)
    		end
    	end

        for i = 1, 6 do
    		local bu = _G['TargetFrameDebuff'..i]
    		local border = _G['TargetFrameDebuff'..i..'Border']
            bu:SetWidth(dSize)
            bu:SetHeight(dSize)
    		if  border then
    			border:SetWidth(dSize + 2)
    			border:SetHeight(dSize + 2)
    		end
    	end

        _G['TargetFrameDebuff'..wrap]:ClearAllPoints()
        _G['TargetFrameDebuff'..wrap]:SetPoint('LEFT', _G['TargetFrameDebuff'..(wrap - 1)], 'RIGHT', 3, 0)
        if cv == 0 then
        	_G['TargetFrameDebuff'..(wrap + 1)]:ClearAllPoints()
        	_G['TargetFrameDebuff'..(wrap + 1)]:SetPoint('TOPLEFT', TargetFrameDebuff1, 'BOTTOMLEFT', 0, -2)
        else
        	_G['TargetFrameDebuff'..(wrap + 1)]:ClearAllPoints()
        	_G['TargetFrameDebuff'..(wrap + 1)]:SetPoint('BOTTOMLEFT', TargetFrameDebuff1, 'TOPLEFT', 2, 5)
        end
        _G['TargetFrameDebuff'..(wrap + 2)]:ClearAllPoints()
        _G['TargetFrameDebuff'..(wrap + 2)]:SetPoint('LEFT', _G['TargetFrameDebuff'..(wrap + 1)], 'RIGHT', 3, 0)

        -- Set anchor for the last row if debuff wrap is 5
    	if  wrap == 5 then
    		TargetFrameDebuff11:ClearAllPoints()
    		TargetFrameDebuff11:SetPoint('TOPLEFT', TargetFrameDebuff6, 'BOTTOMLEFT', 0, -2)
    	else
    		TargetFrameDebuff11:ClearAllPoints()
    		TargetFrameDebuff11:SetPoint('LEFT', TargetFrameDebuff10, 'RIGHT', 3, 0)
    	end
    end

    orig.TargetDebuffButton_Update = TargetDebuffButton_Update

    local AddAllTargetBuffs = function()
        local cv  = _G['modui_vars'].db['modAuraOrientation']
        local b, d = 0, 0

        for i = 1, 16 do
            local bu = _G['TargetFrameBuff'..i]
            local ic = UnitBuff('target', i)
            if bu and ic then
                _G['TargetFrameBuff'..i..'Icon']:SetTexture(ic)
                bu:Show()
                bu.id = i
                b = i
            else
                if bu then bu:Hide() end
            end
        end

        for i = 1, 16 do
            local texture, stack = UnitDebuff('target', i)
            local bu = _G['TargetFrameDebuff'..i]
            if bu and texture then
                local count = _G['TargetFrameDebuff'..i..'Count']
                if  stack > 1 then
                    count:SetText(stack)
                    count:Show()
                else
                    count:Hide()
                end
                _G['TargetFrameDebuff'..i..'Icon']:SetTexture(texture)
                bu:Show()
                bu.id = i
                d = i
            else
                if bu then bu:Hide() end
            end
        end

        for i = 6, 12 do
            local bu = _G['TargetFrameBuff'..i]
            local x, y = _G['TargetFrameBuff1']:GetWidth(), _G['TargetFrameBuff1']:GetHeight()
            bu:SetWidth(x) bu:SetHeight(y)
        end

        if UnitIsFriend('player', 'target') then
            if cv == 0 then
                TargetFrameBuff1:ClearAllPoints()
                TargetFrameBuff1:SetPoint('TOPLEFT', TargetFrame, 'BOTTOMLEFT', 7, 32)
                TargetFrameBuff6:ClearAllPoints()
                TargetFrameBuff6:SetPoint('TOPLEFT', _G['TargetFrameBuff1'], 'BOTTOMLEFT', 0, -4)
                TargetFrameDebuff1:ClearAllPoints()
                TargetFrameDebuff1:SetPoint('TOPLEFT', _G['TargetFrameBuff'..anchor(b)], 'BOTTOMLEFT', 0, -4)
            else
                TargetFrameBuff1:ClearAllPoints()
                TargetFrameBuff1:SetPoint('BOTTOMLEFT', TargetFrame, 'TOPLEFT', 7, -20)
                TargetFrameBuff6:ClearAllPoints()
                TargetFrameBuff6:SetPoint('BOTTOMLEFT', _G['TargetFrameBuff1'], 'TOPLEFT', 0, 5)
                TargetFrameDebuff1:ClearAllPoints()
                TargetFrameDebuff1:SetPoint('BOTTOMLEFT', _G['TargetFrameBuff'..anchor(b)], 'TOPLEFT', 0, 5)
            end
        else
            if cv == 0 then
                TargetFrameDebuff1:ClearAllPoints()
                TargetFrameDebuff1:SetPoint('TOPLEFT', TargetFrame, 'BOTTOMLEFT', 7, 32)
                TargetFrameBuff1:ClearAllPoints()
                TargetFrameBuff1:SetPoint('TOPLEFT', _G['TargetFrameDebuff'..anchor(d)], 'BOTTOMLEFT', 0, -4)
            else
                TargetFrameDebuff1:ClearAllPoints()
                TargetFrameDebuff1:SetPoint('BOTTOMLEFT', TargetFrame, 'TOPLEFT', 7, -20)
                TargetFrameBuff1:ClearAllPoints()
                TargetFrameBuff1:SetPoint('BOTTOMLEFT', _G['TargetFrameDebuff'..anchor(d)], 'TOPLEFT', 2, 5)
            end
        end
    end

    TargetFrame:SetScript('OnEnter', function()
        UnitFrame_OnEnter()
        function TargetDebuffButton_Update() AddAllTargetBuffs() end
        TargetDebuffButton_Update()
    end)

    TargetFrame:SetScript('OnLeave', function()
        UnitFrame_OnLeave()
        function TargetDebuffButton_Update()
            orig.TargetDebuffButton_Update()
        end
        TargetDebuffButton_Update()
        for i = 6, 12 do _G['TargetFrameBuff'..i]:Hide() end
    end)

    --
