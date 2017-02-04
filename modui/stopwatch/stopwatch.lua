

	local x, y = 0
	local visible = false
	local t0
	local saved_time = 0
	local MAX_TIMER_SEC = 99*3600 + 59*60 + 59
	local orig = {}
	local pad  = function(n) return strlen(n) == 2 and n or '0'..n end

	RegisterCVar('modClock', 0, true)

	local sw = CreateFrame('Frame', 'modstopwatch', UIParent)
	sw:EnableMouse(true) sw:SetMovable(true)
	sw:SetWidth(132) sw:SetHeight(24)
	sw:RegisterForDrag'LeftButton'
	sw:SetPoint('TOP', x, y)
	sw:SetBackdrop({bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
							 insets = {left = -1, right = -1, top = -1, bottom = -1}})
	sw:SetBackdropColor(0, 0, 0, .8)
	sw:Hide()

	modSkin(sw, 18)
	modSkinPadding(sw, 5)
	modSkinColor(sw, .15, .15, .15)

	local t = sw:CreateFontString(nil, 'OVERLAY')
	t:SetFontObject'GameFontNormalLarge'
	t:SetPoint('LEFT', 5, 0)

	local reset = CreateFrame('Button', 'modstopwatch_reset', sw, 'UIPanelButtonTemplate')
	reset:SetWidth(40) reset:SetHeight(20)
	reset:SetPoint('RIGHT', -2, 0)
	reset:SetText'Reset'

	local play = CreateFrame('Button', 'modstopwatch_playpause', sw, 'UIPanelButtonTemplate')
	play:SetWidth(40) play:SetHeight(20)
	play:SetPoint('RIGHT', reset, 'LEFT', -2, 0)
	play:SetText'Start'

	local sw_stop = function()
		if not play.playing then return end
		play.playing = false
		play:SetText'Start'
		if t0 then saved_time = floor(saved_time + GetTime() - t0) end
		t0 = nil
		sw:SetScript('OnUpdate', nil)
	end

	local sw_reset = function()
		sw:SetScript('OnUpdate', nil)
		play.reverse, t0 = nil
		sw_stop()
		sw:SetWidth(132)
		t:SetText'0:0:0'
		saved_time = 0
	end

	local sw_OnUpdate = function()
		local time = GetTime()
		local h, m, s
		if time - 0 > 1 then
			if play.reverse then
				s = (play.timer + t0) - time
				if  s <= 0 then s = 0 sw_reset() end
			else s = (t0 and floor(time - t0) or 0) + saved_time end
			h = floor(s/3600)
			s = s - h*3600
			m = floor(s/60)
			s = s - m*60
			t:SetText(string.format('%d:%d:%d', pad(h), pad(m), pad(s)))
			sw:SetWidth(t:GetStringWidth() + play:GetWidth() + reset:GetWidth() + 10)
		end
	end

	local sw_start = function()
		if play.playing then return end
		play.playing = true
		play:SetText'Pause'
		t0 = GetTime()
		sw:SetScript('OnUpdate', sw_OnUpdate)
	end

	local sw_show = function(bu)
		if IsShiftKeyDown() then
			if  TwentyFourHourTime then
				TwentyFourHourTime = false
				SetCVar('modClock', 0)
			else
				TwentyFourHourTime = true
				SetCVar('modClock', 1)
			end
		else
			if tonumber(GetCVar'modStopWatch') == 1 then
				if visible then
					sw:Hide()
					visible = false
				else
					sw:Show()
					t:SetText'0:0:0'
					visible = true
				end
			end
		end
	end

	local sw_countdown = function(h, m, s)
		local text
		local sec = 0
		if h then sec = h*3600 end
		if m then sec = sec + m*60 end
		if s then sec = sec + s end
		-- if s == 0 then sw_show() return end
		if sec > MAX_TIMER_SEC then
			play.timer = MAX_TIMER_SEC
			t0 = GetTime()
		elseif sec < 0 then
			play.timer = 0
			t0 = nil
		else
			play.timer = sec
			t0 = GetTime()
		end
		play.reverse = sec > 0
		play.playing = true
		play:SetText'Pause'
		sw:SetScript('OnUpdate', sw_OnUpdate)
		sw:Show()
		visible = true
	end

	local sw_toggle = function()
		if this.playing then
			sw_stop()
			PlaySound'igMainMenuOptionCheckBoxOff'
		else
			sw_start()
			PlaySound'igMainMenuOptionCheckBoxOn'
		end
	end

	sw:SetScript('OnDragStart', function() sw:StartMoving() end)
	sw:SetScript('OnDragStop',  function() sw:StopMovingOrSizing() end)

	play:SetScript('OnClick', sw_toggle)
	reset:SetScript('OnClick', sw_reset)

	GameTimeFrame:SetScript('OnMouseDown', sw_show)
	function GameTimeFrame_UpdateTooltip(h, m)
		-- TODO: format local time & offer option between
		-- local time = time()
		-- print(time)
		if  tonumber(GetCVar'modClock') == 1 or TwentyFourHourTime then
			GameTooltip:AddDoubleLine(date'%H:%M', '|cffffffffLocal Time|r')
			GameTooltip:AddDoubleLine(format(TEXT(TIME_TWENTYFOURHOURS), h, m), '|cffffffffServer Time|r')
		else
			local pm = 0
			if h >= 12 then pm = 1 end
			if h >  12 then h = h - 12 end
			if h ==  0 then h = 12 end
			GameTooltip:AddDoubleLine(date'%I:%M %p', '|cffffffffLocal Time|r')
			GameTooltip:AddDoubleLine(format(TEXT(pm == 0 and TIME_TWELVEHOURAM or TIME_TWELVEHOURPM), h, m), '|cffffffffServer Time|r')
		end
		if  tonumber(GetCVar'modStopWatch') == 1 then
			GameTooltip:AddLine('Click to Toggle Stopwatch.', .3, 1, .6)
		end
		GameTooltip:AddLine('Shift + Click to Toggle 24hr Time.', .3, 1, .6)
		GameTooltip:Show()
	end

	SLASH_STOPWATCH1 = '/stopwatch'
	SLASH_STOPWATCH2 = '/sw'
	SLASH_STOPWATCH3 = '/timer'
	SlashCmdList['STOPWATCH'] = function(arg)
		if tonumber(GetCVar'modStopWatch') == 1 then
			if arg == '' then sw_show()
			else
				local t = strlower(arg)
				if string.find(t, 'play') or string.find(t, 'start') then
					sw_start() return
				end
				if string.find(t, 'pause') then
					sw_stop() return
				end
				if string.find(t, 'stop') or string.find(t, 'reset') or string.find(t, 'clear') then
					sw_reset() return
				end
				local y, _, h, m, s = string.find(arg, '(%d+):(%d+):(%d+)')
				if y then sw_countdown(tonumber(h), tonumber(m), tonumber(s))
				else
					local y, _, m, s = string.find(arg, '(%d+):(%d+)')
					if y then sw_countdown(0, tonumber(m), tonumber(s))
					else
						local y, _, s = string.find(arg, '(%d+)')
						if y then sw_countdown(0, 0, tonumber(s))
						else sw_show()
						end
					end
				end
			end
		end
	end

	--
