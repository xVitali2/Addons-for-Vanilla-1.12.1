

    local barstosmooth = {    -- SMOOTH ANIM ON PLAYER, TARGET, XP, REP, SKILL STATUSBARS
                              -- ALSO NAMEPLATES
        PlayerFrameHealthBar, PlayerFrameManaBar,
        TargetFrameHealthBar, TargetFrameManaBar,
        MainMenuExpBar, ReputationWatchStatusBar,
        PartyMemberFrame1HealthBar, PartyMemberFrame1ManaBar,
        PartyMemberFrame2HealthBar, PartyMemberFrame2ManaBar,
        PartyMemberFrame3HealthBar, PartyMemberFrame3ManaBar,
        PartyMemberFrame4HealthBar, PartyMemberFrame4ManaBar,
        ReputationBar1, ReputationBar2, ReputationBar3, ReputationBar4, ReputationBar5,
        ReputationBar6, ReputationBar7, ReputationBar8, ReputationBar9, ReputationBar10,
        ReputationBar11, ReputationBar12, ReputationBar13, ReputationBar14, ReputationBar15,
        SkillRankFrame1, SkillRankFrame2, SkillRankFrame3, SkillRankFrame4,
        SkillRankFrame5, SkillRankFrame6, SkillRankFrame7, SkillRankFrame8,
        SkillRankFrame9, SkillRankFrame10, SkillRankFrame11, SkillRankFrame12,
    }

    MODUI_RAIDBARS_TO_SMOOTH = {}

	local smoothframe = CreateFrame'Frame'
	smoothing = {}

    local isPlate = function(frame)
        local overlayRegion = frame:GetRegions()
        if not overlayRegion or overlayRegion:GetObjectType() ~= 'Texture'
        or overlayRegion:GetTexture() ~= [[Interface\Tooltips\Nameplate-Border]] then
            return false
        end
        return true
    end

	local min, max = math.min, math.max
	local function AnimationTick()
		local limit = 30/GetFramerate()
		for bar, value in pairs(smoothing) do
			local cur = bar:GetValue()
			local new = cur + min((value - cur)/3, max(value - cur, limit))
			if new ~= new then new = value end
			if cur == value or abs(new - value) < 2 then
				bar:SetValue_(value)
				smoothing[bar] = nil
			else
				bar:SetValue_(new)
			end
		end
	end

	local function SmoothSetValue(self, value)
		local _, max = self:GetMinMaxValues()

		if value == self:GetValue() or self._max and self._max ~= max then
			smoothing[self] = nil
			self:SetValue_(value)
		else
			smoothing[self] = value
		end

		self._max = max
	end

	for bar, value in pairs(smoothing) do
		if bar.SetValue_ then bar.SetValue = SmoothSetValue end
	end

	local function SmoothBar(bar)
		if not bar.SetValue_ then
			bar.SetValue_ = bar.SetValue
            bar.SetValue  = SmoothSetValue
		end
	end

	local function ResetBar(bar)
		if  bar.SetValue_ then
			bar.SetValue  = bar.SetValue_
            bar.SetValue_ = nil
		end
	end

    smoothframe:SetScript('OnUpdate', function()
        local frames = {WorldFrame:GetChildren()}
        for _, plate in ipairs(frames) do
            if isPlate(plate) and plate:IsVisible() then
                local v = plate:GetChildren()
                if  v.new then
                    SmoothBar(v.new)
                end
            end
        end
        AnimationTick()
    end)

	for _, v in pairs (barstosmooth) do
        if v then SmoothBar(v) end
    end

    smoothframe:RegisterEvent'ADDON_LOADED'
    smoothframe:SetScript('OnEvent', function()
        if arg1 == 'Blizzard_RaidUI' then
            for i = 1, 40 do
                local hp = _G['modraid'..i]
                local pp = _G['modraid'..i]
                if hp then
                    for _, v in pairs({hp.hp, pp.mana}) do SmoothBar(v) end
                end
            end
        end
    end)

    --
