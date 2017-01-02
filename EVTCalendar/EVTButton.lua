local EVTButtonPosition = 0;
local EVTButtonX = 0;
local EVTButtonY = 0;
local EVTButtonPulsing = false;
local EVTButtonLocked = true;

function EVTButton_OnClick()
	if EVTButtonPulsing then
		EVT_ShowNextInvite();
	else
		EVT_Toggle();
	end
end

function EVTButton_Init()
	EVTButtonLocked = CalendarOptions["buttonLocked"];
	if EVTButtonLocked then
		EVTButtonPosition = 134.66365694988;
		EVTButton_UpdatePosition();
	else
		EVTButtonX = 1472;
		EVTButtonY = 835;	
		EVTButton_UpdatePosition();
	end
	EVTButtonFrame:Show();
	EVTButtonDay:SetText(tostring(date("%d")));
end

function EVTButton_Reset()
	DEFAULT_CHAT_FRAME:AddMessage("[EVTCalendar] Map button reset.", 0.8, 0.8, 0.1);
	CalendarOptions["buttonLocked"] = true;
	EVTButton_Init();
end

function EVTButton_Unlock()
	DEFAULT_CHAT_FRAME:AddMessage("[EVTCalendar] Map button unlocked.", 0.8, 0.8, 0.1);
	CalendarOptions["buttonLocked"] = false;
	EVTButtonLocked = false;
end

function EVTButton_Lock()
	DEFAULT_CHAT_FRAME:AddMessage("[EVTCalendar] Map button locked.", 0.8, 0.8, 0.1);
	CalendarOptions["buttonLocked"] = true;
	EVTButtonLocked = true;
end

function EVTButton_StartMoving()
	if EVTButtonLocked == false then
		EVTButtonFrame:StartMoving();
	end
end

function EVTButton_UpdatePosition()
	if EVTButtonLocked then
		EVTButtonFrame:SetPoint(
			"TOPLEFT",
			"Minimap",
			"TOPLEFT",
			54 - (82 * cos(EVTButtonPosition)),
			(82 * sin(EVTButtonPosition)) - 55
		);
	else
		EVTButtonFrame:SetPoint(
		"TOPLEFT",
		"UIParent",
		"BOTTOMLEFT",
		EVTButtonX,
		EVTButtonY);
	end
end

function EVTButton_OnEnter()
	curtime = EVT_GetCurrentTime()
	
    GameTooltip:SetOwner(this, "ANCHOR_BOTTOMLEFT");
    GameTooltip:SetText(curtime);
    GameTooltip:Show();
end 

function EVTButton_StartPulse()
		PlaySoundFile("Sound\\interface\\iTellMessage.wav");
		SetButtonPulse(EVTButton, 100, 1);
		EVTButtonPulsing = true;
end

function EVTButton_PulseOff()
		ButtonPulse_StopPulse(EVTButton);
		EVTButtonPulsing = false;
	end