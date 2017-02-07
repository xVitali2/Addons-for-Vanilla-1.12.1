

    if tonumber(GetCVar'modUnitFrame') == 0 then return end

    local HealComm       = AceLibrary'HealComm-1.0'  -- healcomm
    local TEXTURE        = [[Interface\AddOns\modui\statusbar\texture\sb.tga]]
    local NAME_TEXTURE   = [[Interface\AddOns\modui\statusbar\texture\name2.tga]]
    local BACKDROP       = {bgFile = [[Interface\Tooltips\UI-Tooltip-Background]]}
    local _, class       = UnitClass'player'
    local colour         = RAID_CLASS_COLORS[class]
    local diffThreshold  = .1
    local orig           = {}

    orig.TargetFrame_CheckClassification   = TargetFrame_CheckClassification
    orig.PartyMemberFrame_UpdateMember     = PartyMemberFrame_UpdateMember
    orig.TargetofTarget_Update             = TargetofTarget_Update
    orig.UnitFrameHealthBar_OnValueChanged = UnitFrameHealthBar_OnValueChanged
    orig.TextStatusBar_UpdateTextString    = TextStatusBar_UpdateTextString
    orig.UIOptionsFrame_UpdateDependencies = UIOptionsFrame_UpdateDependencies

    PlayerFrameBackground.bg = PlayerFrame:CreateTexture(nil, 'ARTWORK')
    PlayerFrameBackground.bg:SetPoint('TOPLEFT', PlayerFrameBackground)
    PlayerFrameBackground.bg:SetPoint('BOTTOMRIGHT', PlayerFrameBackground, 0, 22)
    PlayerFrameBackground.bg:SetVertexColor(colour.r, colour.g, colour.b, 1)
    PlayerFrameBackground.bg:SetTexture(NAME_TEXTURE)
    PlayerFrameBackground.bg:SetTexCoord(1, 0, 0, 1)

    PlayerFrame.status = PlayerFrameTexture:GetParent():CreateFontString(nil, 'OVERLAY')
    PlayerFrame.status:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
    PlayerFrame.status:SetShadowOffset(0, 0)
    PlayerFrame.status:SetTextColor(1, 0, 0)
    PlayerFrame.status:SetPoint('CENTER', PlayerFrameHealthBar, 0, -5)

    PlayerFrameHealthBar:SetBackdrop(BACKDROP)
    PlayerFrameHealthBar:SetBackdropColor(0, 0, 0, .6)
    PlayerFrameHealthBar:SetStatusBarTexture(TEXTURE)

    PlayerFrameManaBar:SetBackdrop(BACKDROP)
    PlayerFrameManaBar:SetBackdropColor(0, 0, 0, .6)
    PlayerFrameManaBar:SetStatusBarTexture(TEXTURE)

    PlayerPVPIcon:SetHeight(48) PlayerPVPIcon:SetWidth(48)
    PlayerPVPIcon:ClearAllPoints()
    PlayerPVPIcon:SetPoint('CENTER', PlayerFrame, 'LEFT', 60, 16)

    TargetFrame.Elite = TargetFrameTextureFrame:CreateTexture(nil, 'BORDER')
    TargetFrame.Elite:SetTexture[[Interface\AddOns\modui\unitframe\UI-TargetingFrame-Elite]]
    TargetFrame.Elite:SetWidth(128)
    TargetFrame.Elite:SetHeight(128)
    TargetFrame.Elite:SetPoint('TOPRIGHT', TargetFrame)
    TargetFrame.Elite:Hide()

    TargetFrame.Rare = TargetFrameTextureFrame:CreateTexture(nil, 'BORDER')
    TargetFrame.Rare:SetTexture[[Interface\AddOns\modui\unitframe\UI-TargetingFrame-Rare-Elite]]
    TargetFrame.Rare:SetWidth(128)
    TargetFrame.Rare:SetHeight(128)
    TargetFrame.Rare:SetPoint('TOPRIGHT', TargetFrame)
    TargetFrame.Rare:Hide()

    TargetRaidTargetIcon:SetDrawLayer('OVERLAY', 7)

    TargetPVPIcon:SetHeight(48) TargetPVPIcon:SetWidth(48)
    TargetPVPIcon:ClearAllPoints()
    TargetPVPIcon:SetPoint('CENTER', TargetFrame, 'RIGHT', -42, 16)
    TargetPVPIcon:SetDrawLayer('OVERLAY', 7)

    TargetFrameNameBackground:SetTexture(NAME_TEXTURE)
    TargetFrameNameBackground:SetDrawLayer'BORDER'

    TargetFrameHealthBar:SetBackdrop(BACKDROP)
    TargetFrameHealthBar:SetBackdropColor(0, 0, 0, .6)
    TargetFrameHealthBar:SetStatusBarTexture(TEXTURE)

    TargetFrameManaBar:SetBackdrop(BACKDROP)
    TargetFrameManaBar:SetBackdropColor(0, 0, 0, .6)
    TargetFrameManaBar:SetStatusBarTexture(TEXTURE)

    PlayerFrameGroupIndicator:SetAlpha(0)

    PlayerHitIndicator:SetText(nil)
    PlayerHitIndicator.SetText = function() end

    PetHitIndicator:SetText(nil)
    PetHitIndicator.SetText = function() end

    TargetLevelText:SetJustifyH'LEFT'
    TargetLevelText:SetPoint('LEFT', TargetFrameTextureFrame, 'CENTER', 56, -16)

    TargetofTargetHealthBar:SetStatusBarTexture(TEXTURE)

    TargetofTargetManaBar:SetStatusBarTexture(TEXTURE)

    TargetofTargetName:SetHeight(30)
    TargetofTargetName:ClearAllPoints()
    TargetofTargetName:SetPoint('TOPLEFT', TargetofTargetTextureFrame, 'BOTTOMLEFT', 46, 16)

    TargetofTargetPortrait:SetHeight(37)    -- fix the ugly offset on tot portraits
    TargetofTargetPortrait:SetWidth(37)
    TargetofTargetPortrait:SetPoint('TOPLEFT', 5, -5)

    PartyMemberFrame1:ClearAllPoints()
    PartyMemberFrame1:SetPoint('TOPLEFT', 10, -145)

    for i = 6, 12 do
        local f = CreateFrame('Button', 'TargetFrameBuff'..i, TargetFrame, 'TargetBuffButtonTemplate')
        f:SetID(i)
        f:Hide()
        modSkin(f, 16)      -- first 6 are skinned in skin/button/target.lua
        modSkinPadding(f, 2)
        modSkinColor(f, .2, .2, .2)
        if i == 6 then
            f:SetPoint('TOPLEFT', TargetFrameBuff1, 'BOTTOMLEFT', 0, -2)
        else
            f:SetPoint('LEFT', _G['TargetFrameBuff'..(i - 1)], 'RIGHT', 3, 0)
        end
    end

    for i, v in pairs({PlayerPVPIcon, TargetFrameTextureFramePVPIcon,}) do v:SetHeight(48) v:SetWidth(48) end

    for i = 1, 4 do _G['PartyMemberFrame'..i..'PVPIcon']:SetAlpha(0) end

    for i = 1, 4 do
        for _, v in pairs({_G['PartyMemberFrame'..i..'HealthBar'], _G['PartyMemberFrame'..i..'ManaBar']}) do
            v:SetBackdrop(BACKDROP) v:SetBackdropColor(0, 0, 0, .6)
            v:SetStatusBarTexture(TEXTURE)
        end
    end


    local colourParty = function()              -- PARTY CLASS COLOUR
        for i = 1, MAX_PARTY_MEMBERS do
            local name = _G['PartyMemberFrame'..i..'Name']
            if UnitIsPlayer('party'..i) then
                local _, class = UnitClass('party'..i)
                local colour = RAID_CLASS_COLORS[class]
                if colour then name:SetTextColor(colour.r, colour.g, colour.b) end
            else
                name:SetTextColor(1, .8, 0)
            end
        end
    end

    function TargetFrame_OnShow() end           -- REMOVE TARGETING SOUND
    function TargetFrame_OnHide() CloseDropDownMenus() end

    function TargetFrame_CheckClassification()
        local c = UnitClassification'target'
        TargetFrameTexture:SetTexture[[Interface\TargetingFrame\UI-TargetingFrame]]
        for _, v in pairs({TargetFrame.Elite, TargetFrame.Rare}) do
            v:Hide()
        end
        if  c == 'worldboss' or c == 'rareelite' or c == 'elite' then
            TargetFrame.Elite:Show()
        elseif c == 'rare' then
            TargetFrame.Rare:Show()
        end
    end

    local healcomm = function(this)
        if this.heal then
            local heal = HealComm:getHeal(UnitName'player')
            local v, max = UnitHealth'player', UnitHealthMax'player'
            local bu_w, bu_h = this:GetWidth(), this:GetHeight()
            local hp_w, hp_h = bu_w*(v/max), bu_h*(v/max)
            if heal > 0 and v < max and not UnitIsDeadOrGhost'player' then
                local w = bu_w*(heal/max)
                if (hp_w + w) > bu_w then w = bu_w - hp_w end
                this.heal:Show()
                this.heal:SetWidth(w)
                this.heal:SetHeight(bu_h)
                this.heal:ClearAllPoints()
                this.heal:SetPoint('TOPLEFT', this, hp_w, 0)
            else
                this.heal:Hide()
            end
        end
    end

    local t = CreateFrame'Frame'
    t:RegisterEvent'PLAYER_ENTERING_WORLD' t:RegisterEvent'PARTY_MEMBERS_CHANGED'
    t:RegisterEvent'PLAYER_TARGET_CHANGED' t:RegisterEvent'UNIT_FACTION'
    t:SetScript('OnEvent', function()           -- COLOUR UNIT
        if event == 'PLAYER_ENTERING_WORLD' or event == 'PARTY_MEMBERS_CHANGED' then
            colourParty()
        else
            local _, class = UnitClass'target'
            local colour = RAID_CLASS_COLORS[class]
            if UnitIsPlayer'target' then
                TargetFrameNameBackground:SetVertexColor(colour.r, colour.g, colour.b, 1)
            end
        end
    end)

    function PartyMemberFrame_UpdateMember()
        orig.PartyMemberFrame_UpdateMember()
        colourParty()
    end

    function TargetofTarget_Update()
        orig.TargetofTarget_Update()
        local _, class = UnitClass'targettarget'
        local colour = RAID_CLASS_COLORS[class]
        if UnitIsPlayer'targettarget' then
            TargetofTargetName:SetTextColor(colour.r, colour.g, colour.b)
        else
            TargetofTargetName:SetTextColor(1, .8, 0)
        end
    end

    function UnitFrameHealthBar_OnValueChanged(v)
        orig.UnitFrameHealthBar_OnValueChanged(v)
        healcomm(this)
    end

    function TextStatusBar_UpdateTextString(sb)  -- STATUS TEXT
        if not sb then sb = this end
        orig.TextStatusBar_UpdateTextString(sb)
    	local string = sb.TextString
    	if string then
            local pp = UnitPowerType'player'
    		local v  = math.floor(sb:GetValue())
    		local min, max = sb:GetMinMaxValues()
            local percent = math.floor(v/max*100)

    		if max > 0 then
    			sb:Show()
                if UnitIsDead'player' then
                    PlayerFrame.status:SetText'Dead'
                    string:SetText''
                    return
                elseif UnitIsGhost'player' then
                    PlayerFrame.status:SetText'Ghost'
                    string:SetText''
                    return
    			elseif v == 0 and sb.zeroText then
                    PlayerFrame.status:SetText''
                    string:SetText''
                    return
                elseif sb:GetName() == 'PetFrameManaBar' then
                    string:SetText''
                    return
    			else
                    PlayerFrame.status:SetText''
                    if sb:GetName() == 'MainMenuExpBar' then
                        string:SetPoint('CENTER', sb) string:SetJustifyH'CENTER'
                        if GetCVar'modValue' == '1' then
                            if ReputationWatchBar:IsShown() then
                                local rname, _, rmin, rmax, rv = GetWatchedFactionInfo()
                                MainMenuExpBar.rep:SetText(rname..': '..true_format((rv - rmin))..' / '..true_format((rmax - rmin))..'    ')
                                string:SetText('—     XP: '..true_format(v)..' / '..true_format(max))
                                string:SetPoint('CENTER', (string:GetWidth()/2) - 8, 25)
                            else
                                MainMenuExpBar.rep:SetText''
                                string:SetText(true_format(v)..' / '..true_format(max))
                            end
                        else
                            if ReputationWatchBar:IsShown() then
                                local rname, standing, rmin, rmax, rv = GetWatchedFactionInfo()
                                local rperc = math.floor((rv - rmin)/(rmax - rmin)*100)
                                MainMenuExpBar.rep:SetText(rname..': '..percent..'% into '.._G['FACTION_STANDING_LABEL'..standing]..'    ')
                                string:SetText('—     XP: '..percent..'%')
                                string:SetPoint('CENTER', (string:GetWidth()/2) - 8, 25)
                            else
                                MainMenuExpBar.rep:SetText''
                                string:SetText(percent..'%')
                            end
                        end
                    elseif sb:GetName() == 'PlayerFrameManaBar'
                    and (pp == 1 or pp == 2 or pp == 3) then
                        string:SetText(v)
                    else
                        if GetCVar'modBoth' == '1' then
                            string:SetText(true_format(v)..'/'..true_format(max)..' — '..percent..'%')
                        elseif GetCVar'modValue'  == '1' and GetCVar'modBoth' == '0' then
                            string:SetText(true_format(v))
                        else
                            string:SetText(percent..'%')
                        end
                    end
                    string:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
                    if GetCVar'modStatus'  == '0' and GetCVar'modBoth' == '0' and sb:GetName() ~= 'MainMenuExpBar' then
                        string:ClearAllPoints()
                        string:SetJustifyV'MIDDLE'
                        string:SetPoint('CENTER',
                                    (sb:GetName() == ('PetFrameHealthBar' or 'PetFrameManaBar')) and PetFrame or PlayerFrame,
                                    (sb:GetName() == ('PetFrameHealthBar' or 'PetFrameManaBar')) and 18 or
                                    (sb:GetName() == 'PlayerFrameManaBar') and 30 or 80,
                                    -3)
                    end
    			end
                if  sb:GetName() == 'PlayerFrameManaBar' or sb:GetName() == 'TargetFrameManaBar' then
                    if _G['modui_vars'].db and _G['modui_vars'].db['modWhiteStatusText'] == 0 then
                        if class == 'ROGUE' or (class == 'DRUID' and pp == 3) then
                            string:SetTextColor(250/255, 240/255, 200/255)
                        elseif class == 'WARRIOR' or (class == 'DRUID' and pp == 1) then
                            string:SetTextColor(250/255, 108/255, 108/255)
                        else
                            string:SetTextColor(.6, .65, 1)
                        end
                    else
                        string:SetTextColor(1, 1, 1)
                    end
                end
            end
    	end
    end

    local cv = GetCVar'modStatus' local cv2 = GetCVar'modValue' local cv3 = GetCVar'ModBoth'
    local f = CreateFrame'Frame'
    f:RegisterEvent'CVAR_UPDATE'
    f:SetScript('OnEvent', function()
        if (arg1 == 'MODSTATUS_BAR_TEXT' and arg2 ~= cv)
        or (arg1 == 'MODSTATUS_BAR_VALUE' and arg2 ~= cv2)
        or (arg1 == 'MODSTATUS_BAR_CONSOLIDATE' and arg2 ~= cv3) then
            TextStatusBar_UpdateTextString() ReloadUI()
        end
    end)

    TargetFrameManaBar:RegisterEvent'PLAYER_DEAD'


    --
