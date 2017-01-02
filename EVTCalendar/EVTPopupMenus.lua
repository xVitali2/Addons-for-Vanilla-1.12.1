----------------------------------------------------------------
-- EVTCalendar
-- Author: Reed
--
--
----------------------------------------------------------------

createDate = "";
createEvt = 0;

function EVTFrameAcceptBtn_OnClick()
	local mando;
	local preFrom = UIDropDownMenu_GetSelectedValue(EVTFrameFromTime);
	local preTo = UIDropDownMenu_GetSelectedValue(EVTFrameToTime);
	local amFrom = UIDropDownMenu_GetSelectedValue(EVTFrameAMPM1);
	local amTo = UIDropDownMenu_GetSelectedValue(EVTFrameAMPM2);
	if (TableIndexExists(CalendarData, createDate) == false) then
		CalendarData[createDate] = {};
	end
	if EVTFrameMando:GetChecked() == nil then
		mando = 0;
	else
		mando = 1;
	end
	if CalendarOptions["milFormat"] then
		preFrom = UIDropDownMenu_GetSelectedValue(EVTFrameFromTime);
		preTo = UIDropDownMenu_GetSelectedValue(EVTFrameToTime);
		if preFrom > 12 then
			preFrom = preFrom - 12;
			amFrom = 2;
		end
		if preTo > 12 then
			preTo = preTo - 12;
			amTo = 2;
		end
	end
		
	if (EVTFrameCreatePopupTitle:GetText() == "Create Event") then
		table.insert(CalendarData[createDate],{
			[1] = checkIllegal(EVTFrameNameEditBox:GetText()),
			[2] = checkIllegal(EVTFrameCreatorEditBox:GetText()),
			[3] = preFrom,
			[4] = amFrom,
			[5] = preTo,
			[6] = amTo,
			[7] = UIDropDownMenu_GetSelectedValue(EVTFrameType),
			[8] = UIDropDownMenu_GetSelectedValue(EVTFrameSubType),
			[9] = mando,
			[10] = checkIllegal(EVTFrameNoteEditBox:GetText()),
			[11] = 1,
			[12] = {}
			});
		else
			CalendarData[createDate][createEvt] = {
				[1] = checkIllegal(EVTFrameNameEditBox:GetText()),
				[2] = checkIllegal(EVTFrameCreatorEditBox:GetText()),
				[3] = preFrom,
				[4] = amFrom,
				[5] = preTo,
				[6] = amTo,
				[7] = UIDropDownMenu_GetSelectedValue(EVTFrameType),
				[8] = UIDropDownMenu_GetSelectedValue(EVTFrameSubType),
				[9] = mando,
				[10] = checkIllegal(EVTFrameNoteEditBox:GetText()),
				[11] = 1
			};
		end
		
		EVT_UpdateScrollBar();
		EVTClearFrame();
		HideUIPanel(EVTFrameOverlay);
		EVT_UpdateCalendar();
end

function EVTFrameCreatePopup_OnLoad()
	EVTFrameCreatorEditBox:SetText(UnitName("player"));
	EVTFrameCreatorEditBox:EnableKeyboard(false);
	EVTFrameCreatorEditBox:EnableMouse(false);
end

function EVTFrameFromTime_OnLoad()
    UIDropDownMenu_Initialize(this, EVTFrameFromTime_Initialize);
    UIDropDownMenu_SetWidth(75, EVTFrameFromTime);
    UIDropDownMenu_SetSelectedValue(this, 1);
end

function EVTFrameFromTime_Initialize()
    local info;
    local int = 0;
    local str;
	local maxTime;
	if CalendarOptions["milFormat"] then
		maxTime = 24;
		HideUIPanel(EVTFrameAMPM1);
	else
		maxTime = 12;
		ShowUIPanel(EVTFrameAMPM1);
	end
    for i = 1, maxTime, 1 do
		str = getTimeStr(i);
		info = buildButton(str, i, EVTFrameFromTime_OnClick)  
        UIDropDownMenu_AddButton(info);
    end
end

function EVTFrameFromTime_OnClick()
    UIDropDownMenu_SetSelectedValue(EVTFrameFromTime, this.value);
	EVTCheckComplete();
end

function EVTFrameToTime_OnLoad()
    UIDropDownMenu_Initialize(this, EVTFrameToTime_Initialize);
    UIDropDownMenu_SetWidth(75, EVTFrameToTime);
    UIDropDownMenu_SetSelectedValue(this, 1);
end

function EVTFrameToTime_Initialize()
    local info;
    local str;
	local maxTime;
	if CalendarOptions["milFormat"] then
		maxTime = 24;
		HideUIPanel(EVTFrameAMPM2);
	else
		maxTime = 12;
		ShowUIPanel(EVTFrameAMPM2);
	end
    for i = 1, maxTime, 1 do
		str = getTimeStr(i);
		info = buildButton(str, i, EVTFrameToTime_OnClick)  
        UIDropDownMenu_AddButton(info);
    end
end

function EVTFrameToTime_OnClick()
    UIDropDownMenu_SetSelectedValue(EVTFrameToTime, this.value);
	EVTCheckComplete();
end

function EVTFrameAMPM1_OnLoad()
    UIDropDownMenu_Initialize(this, EVTFrameAMPM1_Initialize);
    UIDropDownMenu_SetWidth(45, EVTFrameAMPM1);
    UIDropDownMenu_SetSelectedValue(this, 1);
end

function EVTFrameAMPM1_Initialize()
    local info;
	info = buildButton("AM", 1, EVTFrameAMPM1_OnClick)    
    UIDropDownMenu_AddButton(info);
	info = buildButton("PM", 2, EVTFrameAMPM1_OnClick) 
    UIDropDownMenu_AddButton(info);
end

function EVTFrameAMPM1_OnClick()
    UIDropDownMenu_SetSelectedValue(EVTFrameAMPM1, this.value);
	EVTCheckComplete();
end

function EVTFrameAMPM2_OnLoad()
    UIDropDownMenu_Initialize(this, EVTFrameAMPM2_Initialize);
    UIDropDownMenu_SetWidth(45, EVTFrameAMPM2);
    UIDropDownMenu_SetSelectedValue(this, 1);
end

function EVTFrameAMPM2_Initialize()
    local info;
	info = buildButton("AM", 1, EVTFrameAMPM2_OnClick)    
    UIDropDownMenu_AddButton(info);
	info = buildButton("PM", 2, EVTFrameAMPM2_OnClick) 
    UIDropDownMenu_AddButton(info);
end

function EVTFrameAMPM2_OnClick()
    UIDropDownMenu_SetSelectedValue(EVTFrameAMPM2, this.value);
	EVTCheckComplete();
end

function EVTFrameType_OnClick()
    UIDropDownMenu_SetSelectedValue(EVTFrameType, this.value);
end

function EVTFrameType_OnLoad()
    UIDropDownMenu_Initialize(this, EVTFrameType_Initialize);
    UIDropDownMenu_SetWidth(75, EVTFrameType);
    UIDropDownMenu_SetSelectedValue(this, 7);
	UIDropDownMenu_JustifyText("LEFT", this);
end

function EVTFrameType_Initialize()
    local info;

    for i = 1, 7, 1 do
		info = buildButton(evtTypes[i], i, EVTFrameType_OnClick)
		UIDropDownMenu_AddButton(info);
	end
end

function EVTFrameType_OnClick()
    UIDropDownMenu_SetSelectedValue(EVTFrameType, this.value);
	EVTFrameSubType_Toggle();
	EVTCheckComplete();
end

function EVTFrameSubType_OnLoad()
    UIDropDownMenu_Initialize(this, EVTFrameSubType_Initialize);
    UIDropDownMenu_SetWidth(130, EVTFrameSubType);
    UIDropDownMenu_SetSelectedValue(this, 1);
	UIDropDownMenu_JustifyText("LEFT", this);
end

function EVTFrameSubType_Initialize()
    local info;
	local n = 0;
	local subType = UIDropDownMenu_GetSelectedValue(EVTFrameType);
	UIDropDownMenu_SetSelectedValue(EVTFrameSubType, 0);
	if isSubtype(subType) then
		n = table.getn(evtSubMenu[subType]);
	end
	for i = 1, n, 1 do
		if isSubtype(subType) then
			UIDropDownMenu_SetSelectedValue(EVTFrameSubType, 0);
			info = buildButton(evtSubMenu[subType][i], i, EVTFrameSubType_OnClick)
			UIDropDownMenu_AddButton(info);
		end
	end
end

function EVTFrameSubType_Toggle()
	local subType = UIDropDownMenu_GetSelectedValue(EVTFrameType);

	if isSubtype(subType) then
		ShowUIPanel(EVTFrameSubType);
	else 
		HideUIPanel(EVTFrameSubType);
	end
	EVTFrameSubType_Initialize();
	UIDropDownMenu_SetText(nil, EVTFrameSubType);
	UIDropDownMenu_SetSelectedValue(EVTFrameSubType, 0);
end

function EVTFrameSubType_OnClick()
    UIDropDownMenu_SetSelectedValue(EVTFrameSubType, this.value);
	EVTCheckComplete();
end

function EVTCheckComplete()
	if ((EVTFrameNameEditBox:GetText() ~= "") and compareInputTime() and (isSubtype(UIDropDownMenu_GetSelectedValue(EVTFrameType)) == (UIDropDownMenu_GetSelectedValue(EVTFrameSubType) ~= 0))) then
		EVTFrameCreatePopupAccept:Enable()
	else
		EVTFrameCreatePopupAccept:Disable()
	end
end

function EVTClearFrame()
	EVTFrameCreatorEditBox:SetText("");
	EVTFrameNameEditBox:SetText("");
	EVTFrameNoteEditBox:SetText("");
	HideUIPanel(EVTFrameSubType);
end

--------- Invite Popup --------------
function EVTFrameInvitePopupAccept_OnClick()
	local tChan = {"PARTY", "RAID", "GUILD", "GUILD"};
	local toOff = 0;	
	local toWho = checkIllegal(EVTFrameInviteNameEditBox:GetText());
	local toChannel = tChan[UIDropDownMenu_GetSelectedValue(EVTFrameInviteMenu)];
	local lockedTo = 0;
	if CalendarData[createDate][createEvt][11] == 1 then
		lockedTo = UIDropDownMenu_GetSelectedValue(EVTFrameInviteLockMenu);
	else
		lockedTo = CalendarData[createDate][createEvt][11];
	end
	if toWho == "" then
		toWho = "All ";
	end
	if UIDropDownMenu_GetSelectedValue(EVTFrameInviteMenu) == 4 then
		toOff = 1;
	end
	
	local tableStr = TableToString(CalendarData[createDate][createEvt], lockedTo);
	local msgStr = string.format("%s¿%s¿%s¿%s¿", toWho, tostring(toOff), "Invite", tableStr);

	SendAddonMessage("EVTCalendar", msgStr, toChannel);
	EVTClearInviteFrame();
end

function EVTFrameInviteMenu_OnLoad()
    UIDropDownMenu_Initialize(this, EVTFrameInviteMenu_Initialize);
    UIDropDownMenu_SetWidth(125, EVTFrameInviteMenu);
    UIDropDownMenu_SetSelectedValue(this, 3);
	UIDropDownMenu_JustifyText("LEFT", EVTFrameInviteMenu);
end

function EVTFrameInviteMenu_Initialize()
    local info;

    for i = 1, 4, 1 do
		info = buildButton(evtInvites[i], i, EVTFrameInviteMenu_OnClick)
		UIDropDownMenu_AddButton(info);
	end
end

function EVTFrameInviteMenu_OnClick()
    UIDropDownMenu_SetSelectedValue(EVTFrameInviteMenu, this.value);
end

function EVTFrameInviteLockMenu_OnLoad()
    UIDropDownMenu_Initialize(this, EVTFrameInviteLockMenu_Initialize);
    UIDropDownMenu_SetWidth(125, EVTFrameInviteLockMenu);
    UIDropDownMenu_SetSelectedValue(this, 1);
	UIDropDownMenu_JustifyText("LEFT", EVTFrameInviteLockMenu);
end

function EVTFrameInviteLockMenu_Initialize()
    local info;

    for i = 1, 3, 1 do
		info = buildButton(evtInviteLock[i], i, EVTFrameInviteLockMenu_OnClick)
		UIDropDownMenu_AddButton(info);
	end
end

function EVTFrameInviteLockMenu_OnClick()
    UIDropDownMenu_SetSelectedValue(EVTFrameInviteLockMenu, this.value);
end

function EVTClearInviteFrame()
	EVTFrameInviteNameEditBox:SetText("");
end

function EVT_ShowNextInvite()
	local str = "";
	if TableIndexExists(invite_Queue, 1) then
		ShowUIPanel(EVTFrameInviteQueue);
		str = string.format("%s %s", invite_Queue[1][1], EVT_INVITE_QUEUE);
		EVTFrameInviteQString:SetText(str);
		EVT_UpdateQueueDetail(invite_Queue[1][2]);
		PlaySoundFile("Sound\\interface\\uEscapeScreenOpen.wav");
	else
		HideUIPanel(EVTFrameInviteQueue);
		EVTButton_PulseOff();
		PlaySoundFile("Sound\\interface\\uEscapeScreenClose.wav");
	end
	
end

function EVT_UpdateQueueDetail(str)
	local s1, s2, s3, s4, s5, s6, s7, s8, s9, _, _, s12 = strSplit(str, "¡");
	local subType = tonumber(s7);
	local mando = tonumber(s9);
	local dateStr = convertDate(s12);
	
	EVTQueueDetailsName:SetText(s1);
	EVTFrameInviteDString:SetText(dateStr);
	EVTQueueDetailsTime:SetText(string.format("%s    -    %s", getTimeStr(tonumber(s3), tonumber(s4)), getTimeStr(tonumber(s5), tonumber(s6))));
	if (subType == 1 or subType == 2 or subType == 3) then
		EVTQueueDetailsType:SetText(string.format("%s    -    %s", evtTypes[subType], evtSubMenu[tonumber(s7)][tonumber(s8)]));
	else
		EVTQueueDetailsType:SetText(evtTypes[subType]);
	end
	if (mando == 1) then
		EVTQueueDetailsMando:SetText("Yes");
		EVTQueueDetailsMando:SetTextColor(1, 0.1, 0.1);
	else
		EVTQueueDetailsMando:SetText("No");
		EVTQueueDetailsMando:SetTextColor(1, 1, 1);
	end
end	

function EVTFrameInviteQueueAccept_OnClick()
	StringToTable(invite_Queue[1][2]);
	table.remove(invite_Queue, 1);
	EVT_ShowNextInvite();
end

function EVTFrameInviteQueueDecline_OnClick()
	table.remove(invite_Queue, 1);
	EVT_ShowNextInvite();
end

function EVTFrameOptionsAccept_OnClick()
	CalendarOptions["frameDrag"] = checkBool(EVTFrameOptionsLock:GetChecked());
	CalendarOptions["confirmEvents"] = checkBool(EVTFrameOptionsConfirm:GetChecked());
	CalendarOptions["acceptEvents"] = checkBool(EVTFrameOptionsEvents:GetChecked());
	CalendarOptions["milFormat"] = checkBool(EVTFrameOptions24h:GetChecked());
	EVT_UpdateCalendar();
	HideUIPanel(EVTFrameOptions);
end

function EVTFrameOptionsReset_OnClick()
	EVTFrameOptions:ClearAllPoints()
	EVTFrameOptions:SetPoint(
		"CENTER",
		"UIParent",
		"CENTER",
		0,
		0
		);
	EVTFrameInvitePopup:ClearAllPoints()
	EVTFrameInvitePopup:SetPoint(
		"CENTER",
		"UIParent",
		"CENTER",
		0,
		0
		);
	EVTFrameInviteQueue:ClearAllPoints()
	EVTFrameInviteQueue:SetPoint(
		"CENTER",
		"UIParent",
		"CENTER",
		0,
		0
		);
	EVTFrameCreatePopup:ClearAllPoints()
	EVTFrameCreatePopup:SetPoint(
		"CENTER",
		"UIParent",
		"CENTER",
		0,
		0
		);
end



--- Helper Functions ---
function checkBool(num)
	if num == nil then
		return false;
	else
		return true;
	end
end

function compareInputTime()
	local bTime = UIDropDownMenu_GetSelectedValue(EVTFrameFromTime);
	local aTime = UIDropDownMenu_GetSelectedValue(EVTFrameToTime);
	local bAMPM = UIDropDownMenu_GetSelectedValue(EVTFrameAMPM1);
	local aAMPM = UIDropDownMenu_GetSelectedValue(EVTFrameAMPM2);
	
	if (aTime + (12 * (aAMPM - 1))) > (bTime + (12 * (bAMPM - 1))) then
		return true;
	else
		return false;
	end
end

function isSubtype(subType)
	if subType == 1 or subType == 2 or subType == 3 then
		return true;
	end
	return false;
end

function buildButton(btText, btValue, btFunc)
	local info;
    info = {};
    info.text = btText;
    info.value = btValue;
    info.func = btFunc;
    info.checked = nil;
	return info;
end

function getTimeStr(i, ampm)
	if CalendarOptions["milFormat"] and ampm ~= nil then
		local i = tostring(tonumber(i) + ((ampm - 1) * 12));
		str = string.format("%s:%s", i, "00");
	else 
		str = string.format("%s:%s", i, "00");
		if ampm ~= nil then
			if ampm == 1 then
				str = string.format("%s%s", str, "am");
			elseif ampm == 2 then
				str = string.format("%s%s", str, "pm");
			end
		end
	end
	return str;
end