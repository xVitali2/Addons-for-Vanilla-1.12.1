
    local orig = {}

    orig.CastingBarFrame_OnUpdate       = CastingBarFrame_OnUpdate
    orig.TextStatusBar_UpdateTextString = TextStatusBar_UpdateTextString

    local gradient = function(v, f, min, max)
        if v < min or v > max then return end
        if (max - min) > 0 then
            v = (v - min)/(max - min)
        else
            v = 0
        end
        if v > .5 then
            r = (1 - v)*2
            g = 1
        else
            r = 1
            g = v*2
        end
        b = 0
        if  f:GetObjectType() == 'StatusBar'  then
            f:SetStatusBarColor(r, g, b)
        elseif
            f:GetObjectType() == 'FontString' then
            if  _G['modui_vars'].db and _G['modui_vars'].db['modWhiteStatusText'] == 0 then
                f:SetTextColor(r*1.5, g*1.5, b*1.5)
            else
                f:SetTextColor(1, 1, 1)
            end
        else
            f:SetVertexColor(r, g, b)
        end
    end

    function HealthBar_OnValueChanged(v, smooth)
        if not v then return end
        if string.find(this:GetName(), 'RaidPullout') then return end
        local min, max = this:GetMinMaxValues()
        gradient(v, this, min, max)
    end

    function TextStatusBar_UpdateTextString(sb)  -- STATUS TEXT
        if not sb then sb = this end
        orig.TextStatusBar_UpdateTextString(sb)
        local string = sb.TextString
    	if string then
            if  sb:GetName() == 'PlayerFrameHealthBar' or sb:GetName() == 'TargetFrameHealthBar' then
                local v = sb:GetValue()
                local min, max = sb:GetMinMaxValues()
                gradient(v, string, min, max)
            end
        end
    end

    function CastingBarFrame_OnUpdate()
        orig.CastingBarFrame_OnUpdate()
        local v = CastingBarFrameStatusBar:GetValue()
        local min, max = this:GetMinMaxValues()
        gradient(v, this, min, max)
        if  CastingBarText:GetText() == INTERRUPTED or CastingBarText:GetText() == FAILED then
            this:SetStatusBarColor(1, 0, 0)
        end
    end

    local BagSpaceBarUpdate = function()
        if  _G['modbag_inventory_space'] then
            local bar = _G['modbag_inventory_space']
            local v = bar:GetValue()
            local min, max = bar:GetMinMaxValues()
            gradient(v, bar, min, max)
        end
    end

    local e = CreateFrame'Frame'
	e:RegisterEvent'PLAYER_ENTERING_WORLD'
	e:RegisterEvent'UNIT_INVENTORY_CHANGED'
	e:RegisterEvent'BAG_UPDATE'
	e:RegisterEvent'BANKFRAME_OPENED'
	e:SetScript('OnEvent', BagSpaceBarUpdate)

    --
