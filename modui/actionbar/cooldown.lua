
    local orig = {}

    orig.CooldownFrame_SetTimer         = CooldownFrame_SetTimer

    local AddTextUpdate = function(elapsed)
        if  this.text and not this.text:IsShown() then return end
        if  this.nextUpdate and this.nextUpdate > 0 then
            this.nextUpdate = this.nextUpdate - elapsed
        else
            local remain = this.duration - (GetTime() - this.start)
            if  floor(remain + .5) > 0 then
                local time, nextUpdate = SecondsToTimeAbbrev(remain)
                this.nextUpdate = nextUpdate
                this.text:SetText(time)
                this.text:SetTextColor(1, .8, 0)
            else
                this.text:SetText''
            end
        end
    end

    function CooldownFrame_SetTimer(this, start, duration, enable)
        orig.CooldownFrame_SetTimer(this, start, duration, enable)
        if _G['modui_vars'].db and _G['modui_vars'].db['modCDCount'] == 1 then -- this occasionally fires before PLAYER_LOGIN
            if  this:GetParent():GetWidth() > 27 and start > 0 and duration > 3 then
                this.start = start
                this.duration = duration
                this.nextUpdate = 0
                if  not this.text then
                    this.text = this:CreateFontString(nil, 'OVERLAY')
                    this.text:SetFont(STANDARD_TEXT_FONT, 16, 'OUTLINE')
                    this.text:SetPoint('CENTER', 1, -1)
                    this.text:SetJustifyH'CENTER'
                    this:SetScript('OnUpdate', function()
                        AddTextUpdate()
                    end)
                else
                    this.text:Show()
                end
            else
                if this.text then this.text:Hide() end
            end
        else
            if this.text then this.text:Hide() end
        end
    end

    --
