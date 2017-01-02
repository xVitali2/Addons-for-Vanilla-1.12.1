----------------------------------------------------------------
-- EVTCalendar
-- Author: Reed
--
--
----------------------------------------------------------------
EVT_VERSION = "1.0";


---Initialize tables
player_Info = {};
invite_Queue = {};
CalendarOptions = {
	["buttonLocked"] = true,
	["milFormat"] = false,
	["frameDrag"] = false,
	["acceptEvents"] = false,
	["confirmEvents"] = false
	};
	
selectedButton = nil;

local table_Days = {};
local table_DayStr = {};
local table_DayVal = {};
local table_DayTex = {};
local table_DayPos = {};


---Initialize variables
local displayMonth;
local displayYear;
local displayDay;
local displayPos;
local eventClicked;

local initialized = false;
local varsLoaded = false;

-- Asset Location
local ImgDayActive = "Interface\\AddOns\\EVTCalendar\\Images\\EVTDayFrameActive";
local ImgDayInactive = "Interface\\AddOns\\EVTCalendar\\Images\\EVTDayFrameInactive";
local ImgDayToday = "Interface\\AddOns\\EVTCalendar\\Images\\EVTDayFrameToday";
local ImgDaySelected = "Interface\\AddOns\\EVTCalendar\\Images\\EVTDayFrameSelected";
local ImgDayHightlight = "Interface\\AddOns\\EVTCalendar\\Images\\EVTDayFrameHighlight";
local ImgIcoCthun = "Interface\\AddOns\\EVTCalendar\\Images\\EVTIcoCthun";
local ImgIcoOssirian = "Interface\\AddOns\\EVTCalendar\\Images\\EVTIcoOssirian";
local ImgIcoOnyxia = "Interface\\AddOns\\EVTCalendar\\Images\\EVTIcoOnyxia";
local ImgIcoNefarian = "Interface\\AddOns\\EVTCalendar\\Images\\EVTIcoNefarian";
local ImgIcoHakkar = "Interface\\AddOns\\EVTCalendar\\Images\\EVTIcoHakkar";
local ImgIcoRagnaros = "Interface\\AddOns\\EVTCalendar\\Images\\EVTIcoRagnaros";
local ImgIcoKelthuzad = "Interface\\AddOns\\EVTCalendar\\Images\\EVTIcoKelthuzad";
local ImgIcoInstance = "Interface\\AddOns\\EVTCalendar\\Images\\EVTIcoInstance";
local ImgIcoMeeting = "Interface\\AddOns\\EVTCalendar\\Images\\EVTIcoMeeting";
local ImgIcoQuest = "Interface\\AddOns\\EVTCalendar\\Images\\EVTIcoQuest";
local ImgIcoOther = "Interface\\AddOns\\EVTCalendar\\Images\\EVTIcoOther";
local ImgIcoPvP = "Interface\\AddOns\\EVTCalendar\\Images\\EVTIcoPvP";

-- Calendar Data Table

function EVT_ResetDisplayDate()
    displayDay = currentDay();
    displayMonth = currentMonth();
    displayYear = currentYear();
	displayPos = nil;
end

function EVT_OnLoad()
    this:RegisterEvent("ADDON_LOADED");
    this:RegisterEvent("VARIABLES_LOADED");
    this:RegisterEvent("CHAT_MSG_ADDON"); 
	tinsert(UISpecialFrames, "EVTFrame");
    
    SLASH_EVT1 = EVT_SLASH;
    SlashCmdList["EVT"] = function(msg)
		EVT_SlashCommand(msg);
	end
end

function EVT_SlashCommand(msg)

	if(msg == EVT_ABOUT) then
		DEFAULT_CHAT_FRAME:AddMessage("-----"..EVT_CALENDAR..": "..EVT_ABOUT.."-----", 0.8, 0.8, 0.1);
		DEFAULT_CHAT_FRAME:AddMessage("Version: "..EVT_VERSION, 0.8, 0.8, 0.1);
		DEFAULT_CHAT_FRAME:AddMessage("Created by: TheOneReed", 0.8, 0.8, 0.1);
		DEFAULT_CHAT_FRAME:AddMessage("Website: https://github.com/TheOneReed/EVTCalendar", 0.8, 0.8, 0.1);
	elseif(msg == EVT_HELP) then
		DEFAULT_CHAT_FRAME:AddMessage("-----"..EVT_CALENDAR..": "..EVT_HELP.."-----", 0.8, 0.8, 0.1);
		DEFAULT_CHAT_FRAME:AddMessage("about : Displays addon info.", 0.8, 0.8, 0.1);
		DEFAULT_CHAT_FRAME:AddMessage("help : Displays this menu.", 0.8, 0.8, 0.1);
		DEFAULT_CHAT_FRAME:AddMessage("unlock : Enables button dragging.", 0.8, 0.8, 0.1);
		DEFAULT_CHAT_FRAME:AddMessage("lock : Disables button dragging.", 0.8, 0.8, 0.1);
		DEFAULT_CHAT_FRAME:AddMessage("reset : Returns button back to the minimap.", 0.8, 0.8, 0.1);
	elseif(msg == "unlock") then
		EVTButton_Unlock();
	elseif(msg == "lock") then
		EVTButton_Lock();
	elseif(msg == "reset") then
		EVTButton_Reset();
	elseif(msg == "test") then
		CalendarOptions["milFormat"] = not CalendarOptions["milFormat"];
	else
		if EVTButtonPulsing then
			EVT_ShowNextInvite();
		else
			EVT_Toggle();
		end
	end
end

function EVT_OnEvent()
	if (event == "ADDON_LOADED") then
		if (strlower(arg1) == "evtcalendar") then
			varsLoaded = true;
			EVT_Initialize();
		end
	elseif (event == "VARIABLES_LOADED") then
		if (not varsLoaded) then
			varsLoaded = true;
			EVT_Initialize();
		end
	elseif (event == "CHAT_MSG_ADDON") then
		if (strlower(arg1) == "evtcalendar") then
			EVTIncMessage(arg2, arg4, arg3);
		end		
	end
end

function EVT_Initialize()
    displayMonth = date("%m") + 0;
    displayDay = date("%d") + 0;
    displayYear = date("%Y") + 0;
	if (CalendarData == nil) then
		CalendarData = {};
	end	
	if (CalendarOptions == nil) then
		CalendarOptions = {
			["buttonLocked"] = true,
			["milFormat"] = true
			};
	end	
	getPlayerInfo();
	if player_Info["guild"] ~= false then
		local msgStr = string.format("%s¿%s¿%s¿%s¿", "", 0, "VersionCheck", EVT_VERSION);
		SendAddonMessage("EVTCalendar", msgStr, "GUILD");
	end
	EVTButton_Init();
    EVT_BuildCalendar();
    initialized = true;
	DEFAULT_CHAT_FRAME:AddMessage(EVT_CALENDAR.." v"..EVT_VERSION.." /evt help", 0.1, 1, 0.1);
end
	
function EVT_Toggle()
    EVTButtonDay:SetText(date("%d"));
    if (EVTFrame:IsVisible()) then
        HideUIPanel(EVTFrame);
        PlaySoundFile("Sound\\interface\\uCharacterSheetClose.wav");
    else
		if EVTFrameCreatePopup:IsVisible() or EVTFrameInvitePopup:IsVisible() or EVTFrameOptions:IsVisible() then
			ShowUIPanel(EVTFrameOverlay);
		end
        EVT_ResetDisplayDate();
        EVT_UpdateCalendar();
        EVT_DayClick(table_Days[table_DayPos[displayDay]]:GetName(), false);
        ShowUIPanel(EVTFrame);
        PlaySoundFile("Sound\\interface\\uCharacterSheetOpen.wav");
    end
end

function EVT_GetCurrentTime()
    local ampm = "AM";
    local hour, minute = GetGameTime();
	if (minute < 10) then
		minute = string.format("%02s", minute);
	end
	if CalendarOptions["milFormat"] then
	    curtime = string.format("%s:%s", hour, minute);
		return curtime;	
	else
		if (hour >= 12) then
			if hour > 12 then
			hour = hour - 12;
			end
			ampm = "PM";
		end
		
		curtime = string.format("%s:%s%s", hour, minute, ampm);
		return curtime;
	end
end

function EVT_IncMonth()
    displayMonth = displayMonth - 1;
    if (displayMonth < 1) then
        displayMonth = 12
        displayYear = displayYear - 1;
    end
    EVTMonthDisplay:SetText(table_Months[tostring(displayMonth)]);
    EVT_UpdateCalendar();
end

function EVT_DecMonth()
    displayMonth = displayMonth + 1;
    if (displayMonth > 12) then
        displayMonth = 1
        displayYear = displayYear + 1;
    end
    EVTMonthDisplay:SetText(table_Months[tostring(displayMonth)]);
    EVT_UpdateCalendar();
end

function EVT_UpdateCalendar()
    EVTMonthDisplay:SetText(table_Months[displayMonth]);

    local startDay = GetDayofWeek(displayYear, displayMonth, 1);

    local z = 1;
    
    for step = 1, 42, 1 do
        local s = table_DayStr[step];
        local b = table_Days[step];
		local t = table_DayTex[step];
        local preMonth = displayMonth - 1;
        if (preMonth < 1) then
            preMonth = 12
        end
        if (step < startDay) then
            local preNum = DaysInMonth(displayYear, preMonth) - startDay + (step + 1);
            s:SetText(preNum);
            table_DayVal[step] = nil;
            disableButton(b, step);
			t:SetTexture("");
        elseif (step >= (DaysInMonth(displayYear, displayMonth) + startDay)) then
            local newDays = (step - (DaysInMonth(displayYear, displayMonth) + startDay - 1));
            s:SetText(newDays);
            table_DayPos[(DaysInMonth(displayYear, displayMonth) + startDay) + newDays] = nil;
            disableButton(b, step);
			t:SetTexture("");
        else
            s:SetText(z);
            table_DayPos[z] = step;
            table_DayVal[step] = z;
            if z == currentDay() and displayMonth == currentMonth() and displayYear == currentYear() then
                b:SetNormalTexture(ImgDayToday);
                if (initialized == false) then
                    EVT_UpdateDayPanel();
                end
            else
                b:SetNormalTexture(ImgDayActive);
            end
            if (displayPos == step) then
                local name = b:GetName();
                EVT_DayClick(name, false);
            end
            b:SetPushedTexture(ImgDayInactive);
            b:SetHighlightTexture(ImgDayHightlight);
            b:SetScript("OnClick", function()
                local name = this:GetName();
                EVT_DayClick(name, true);
                PlaySoundFile("Sound\\interface\\iUiInterfaceButtonA.wav");
            end);
			
			t:SetTexture(getDayOverlayTex(z));
			
            z = z + 1;
        end
    end
end

function EVT_BuildCalendar()
    local x = 1;
    local y = 1;
    
    
    for step = 1, 42, 1 do
        if (x > 7) then
            x = 1;
            y = y + 1;
        end
        
        xoffset = (x * (77)) - 30;
        yoffset = (y * (-77)) + 23;
        
        x = x + 1;
        
        local name;
        name = string.format("%s%s", "Day", step);
        local b = CreateFrame("Button", name, EVTFrame, "UIPanelButtonTemplate");
        b:SetHeight(78);
        b:SetWidth(78);
        b:SetPoint("TOP", EVTFrame, "TOPLEFT", xoffset, yoffset);
        table_Days[step] = b;
 
		name = string.format("%s%s", name, "Tex");
		local t = b:CreateTexture("name", "OVERLAY");
		t:SetAllPoints();
		t:SetAlpha(0.5);
        table_DayTex[step] = t;		
        
        name = string.format("%s%s%s", "Day", step, "str");
        local s = b:CreateFontString(name, "OVERLAY", "GameFontNormal")
        s:SetHeight(20);
        s:SetWidth(20);
        s:SetPoint("TOP", b, "TOP", -25, -5);
        s:SetText(step);
        table_DayStr[step] = s;
    end
    EVT_UpdateCalendar();
end


function EVT_DayClick(name, pressed)
    local dayNum = tonumber(strsub(name, 4));
    
    if (displayPos ~= nil) then
        local b2 = table_Days[tonumber(displayPos)];
        if displayDay == currentDay() and displayMonth == currentMonth() and displayYear == currentYear() then
            b2:SetNormalTexture(ImgDayToday);
        else
            if (table_DayVal[tonumber(displayPos)] ~= nil) then
                b2:SetNormalTexture(ImgDayActive);
            else
                if (displayPos >= 21) then
                    for x = displayPos, 20, -1 do
                        if (table_DayVal[x] ~= nil) then
                            dayNum = x;
                            break;
                        end
                    end
                else
                    for x = displayPos, 21, 1 do
                        if (table_DayVal[x] ~= nil) then
                            dayNum = x;
                            break;
                        end
                    end
                end
            end
        end
    end
    local b = table_Days[dayNum];
    b:SetNormalTexture(ImgDaySelected);
    displayDay = table_DayVal[dayNum];
    displayPos = dayNum;
    EVT_UpdateDayPanel();
end

function EVT_UpdateDayPanel()
    local dow = table_Dotw[GetDayofWeek(displayYear, displayMonth, displayDay)];
    dayString = string.format("%s, %s %s, %s", dow, table_Months[displayMonth], displayDay, displayYear);
    EVTDate:SetText(dayString);
	EVTFrameConfirmedList:Hide();
    EVT_UpdateScrollBar();
end

function EVT_UpdateScrollBar()
    local y;
    local yoffset;
    local t;
	local tSize;
	local strText;
	EVTFrameConfirmedList:Hide();	
	EVT_EventClearSelection();
	HideUIPanel(EVTFrameDetailsList);
	EVTFrameModifyButton:Disable();
	EVTFrameDeleteButton:Disable(); 	
	if TableIndexExists(CalendarData, displayDate()) then
		t = CalendarData[displayDate()];
	else
		t = {};
	end
	tSize = table.getn(t);
	FauxScrollFrame_Update(EventListScrollFrame, tSize, 5, 20);
    for y = 1, 5, 1 do
        yoffset = y + FauxScrollFrame_GetOffset(EventListScrollFrame);
        if (yoffset <= tSize) then
			local t2 = t[yoffset];
            if (t2 == nil) then
                getglobal("EventButton" .. y):Hide();
            else
				btnText = string.format("%s    %s", getTimeStr(t2[3], t2[4]), t2[1]);
                getglobal("EventButton" .. y .. "Info"):SetText(btnText);
				if t2[9] == 1 then
					getglobal("EventButton" .. y .. "Info"):SetTextColor(1, 0.1, 0.1);
				else
					getglobal("EventButton" .. y .. "Info"):SetTextColor(1, 1, 1);
				end
                getglobal("EventButton" .. y):Show();
				if y == 1 and (yoffset - y) == 0 then
					EVT_EventButton_OnClick(getglobal("EventButton" .. y));
				end
            end
        else
            getglobal("EventButton" .. y):Hide();
        end
    end
end

function EVT_UpdateConfirmedScrollBar()
    local y;
    local yoffset;
    local t;
	local tSize;
	if TableIndexExists(CalendarData[displayDate()][getButtonPosOffset()], 12) then
		t = CalendarData[displayDate()][getButtonPosOffset()][12];
	else
		CalendarData[displayDate()][getButtonPosOffset()][12] = {}
		t = CalendarData[displayDate()][getButtonPosOffset()][12];
	end
	tSize = table.getn(t);
	FauxScrollFrame_Update(ConfirmedScrollFrame, tSize, 5, 20);
    for y = 1, 5, 1 do
        yoffset = y + FauxScrollFrame_GetOffset(ConfirmedScrollFrame);
        if (yoffset <= tSize) then
			local t2 = t[yoffset];
            if (t2 == nil) then
                getglobal("ConfirmedText" .. y):Hide();
            else
				strText = t2;
                getglobal("ConfirmedText" .. y):SetText(strText);
                getglobal("ConfirmedText" .. y):Show();
            end
        else
            getglobal("ConfirmedText" .. y):Hide();
        end
    end
end

function EVT_EventButton_OnClick(button)
	EVT_EventClearSelection();
	button:LockHighlight();
	selectedButton = button;
	EVTFrameModifyButton:Enable();
	EVTFrameDeleteButton:Enable();
	EVTDetailsStatus:Hide();
	EVTDetailsStatusLabel:Hide();
	EVTFrameConfirmedList:Hide();
	EVT_UpdateDetailList();
	EVT_UpdateConfirmedScrollBar()
end

function EVT_EventConfirmButton_OnClick()
	local evtDate = displayDate();
	local evtName = CalendarData[displayDate()][getButtonPosOffset()][1];
	local crtName = CalendarData[displayDate()][getButtonPosOffset()][2];
	local subStr = string.format("%s¡%s¡", evtDate, evtName);
	local msgStr = string.format("%s¿%s¿%s¿%s¿", crtName, 0, "ConfirmEvent", subStr);
	SendAddonMessage("EVTCalendar", msgStr, "GUILD");
	SendAddonMessage("EVTCalendar", msgStr, "RAID");
	EVTFrameConfirmButton:Disable();
end
	
function EVT_UpdateDetailList()
	local pos = getButtonPosOffset();
	local t = CalendarData[displayDate()][pos];
	local subType = t[7];
	local mando = t[9];
	EVTDetailsName:SetText(t[1]);
	EVTDetailsCreated:SetText(t[2]);
	EVTDetailsTime:SetText(string.format("%s    -    %s", getTimeStr(t[3], t[4]), getTimeStr(t[5], t[6])));
	if (subType == 1 or subType == 2 or subType == 3) then
		EVTDetailsType:SetText(string.format("%s    -    %s", evtTypes[subType], evtSubMenu[t[7]][t[8]]));
	else
		EVTDetailsType:SetText(evtTypes[subType]);
	end
	if (mando == 1) then
		EVTDetailsMando:SetText("Yes");
		EVTDetailsMando:SetTextColor(1, 0.1, 0.1);
	else
		EVTDetailsMando:SetText("No");
		EVTDetailsMando:SetTextColor(1, 1, 1);
	end
	if t[10] == "" then
		EVTDetailsNotes:SetText("None");
	else
		EVTDetailsNotes:SetText(t[10]);
	end
	if t[2] ~= UnitName("player") then
		EVTFrameModifyButton:Disable();
		EVTDetailsStatus:Show();
		EVTDetailsStatusLabel:Show();
		if t[13] == 0 then
			EVTDetailsStatus:SetText("Unconfirmed");
			EVTDetailsStatus:SetTextColor(0.8, 0.8, 0.1);
			EVTFrameConfirmButton:Enable();
		else
			EVTDetailsStatus:SetText("Confirmed");
			EVTDetailsStatus:SetTextColor(0.1, 1, 0.1);
			EVTFrameConfirmButton:Disable();
		end
	else
		EVTFrameConfirmedList:Show();
		EVTFrameConfirmButton:Disable();
	end
	if ((t[11] == 2) and player_Info["officer"] == false) or (t[11] == 3 and t[1] ~= player_Info["name"]) then
		EVTFrameInviteButton:Disable();
	else
		EVTFrameInviteButton:Enable();
	end
	ShowUIPanel(EVTFrameDetailsList);	
end	
	
function EVT_FrameDeleteButton_OnClick()
	local pos = getButtonPosOffset();
	table.remove(CalendarData[displayDate()], pos);
	EVT_UpdateCalendar();
end

function EVT_EventClearSelection()
	if selectedButton ~= nil then
		selectedButton:UnlockHighlight();
		selectedButton = nil;
	end
end

function EVTFrameCreateButton_Toggle()
	EVTClearFrame()
    if (EVTFrameCreatePopup:IsVisible()) then
		HideUIPanel(EVTFrameOverlay);
        HideUIPanel(EVTFrame);
	else
		EVTFrameCreatePopupTitle:SetText("Create Event");
		createDate = displayDate();
		ShowUIPanel(EVTFrameOverlay);
		ShowUIPanel(EVTFrameCreatePopup);
		UIDropDownMenu_Initialize(EVTFrameFromTime, EVTFrameFromTime_Initialize);
		UIDropDownMenu_SetSelectedValue(EVTFrameFromTime, 1);
		UIDropDownMenu_Initialize(EVTFrameAMPM1, EVTFrameAMPM1_Initialize);
		UIDropDownMenu_SetSelectedValue(EVTFrameAMPM1, 1);
		UIDropDownMenu_Initialize(EVTFrameToTime, EVTFrameToTime_Initialize);
		UIDropDownMenu_SetSelectedValue(EVTFrameToTime, 1);
		UIDropDownMenu_Initialize(EVTFrameAMPM2, EVTFrameAMPM2_Initialize);
		UIDropDownMenu_SetSelectedValue(EVTFrameAMPM2, 1);
		UIDropDownMenu_Initialize(EVTFrameType, EVTFrameType_Initialize);
		UIDropDownMenu_SetSelectedValue(EVTFrameType, 7);
		UIDropDownMenu_Initialize(EVTFrameSubType, EVTFrameSubType_Initialize);
		UIDropDownMenu_SetSelectedValue(EVTFrameSubType, 0);
		EVTCheckComplete();
		HideUIPanel(EVTFrameSubType);
	end
end

function EVTFrameInviteButton_Toggle()
    if (EVTFrameInvitePopup:IsVisible()) then
		HideUIPanel(EVTFrameOverlay);
        HideUIPanel(EVTFrame);
	else
		ShowUIPanel(EVTFrameOverlay);
		ShowUIPanel(EVTFrameInvitePopup);
		createDate = displayDate();
		createEvt = getButtonPosOffset();
	end
end

function EVTFrameModifyButton_Toggle()
	EVTClearFrame()
    if (EVTFrameCreatePopup:IsVisible()) then
		HideUIPanel(EVTFrameOverlay);
        HideUIPanel(EVTFrame);
	else
		EVTFrameCreatePopupTitle:SetText("Modify Event");
		createDate = displayDate();
		createEvt = getButtonPosOffset();
		ShowUIPanel(EVTFrameOverlay);
		ShowUIPanel(EVTFrameCreatePopup);
		
		local t = CalendarData[createDate][createEvt];
		EVTFrameNameEditBox:SetText(t[1]);
		EVTFrameCreatorEditBox:SetText(t[2]);
		if isSubtype(t[7]) then
			ShowUIPanel(EVTFrameSubType);
		end
		UIDropDownMenu_Initialize(EVTFrameFromTime, EVTFrameFromTime_Initialize);
	
		if CalendarOptions["milFormat"] then
			UIDropDownMenu_SetSelectedValue(EVTFrameFromTime, tonumber(t[3]) + ((t[4] - 1) * 12));
			UIDropDownMenu_Initialize(EVTFrameAMPM1, EVTFrameAMPM1_Initialize);
			UIDropDownMenu_SetSelectedValue(EVTFrameAMPM1, 1);
			UIDropDownMenu_Initialize(EVTFrameToTime, EVTFrameToTime_Initialize);
			UIDropDownMenu_SetSelectedValue(EVTFrameToTime, tonumber(t[5]) + ((t[6] - 1) * 12));
			UIDropDownMenu_Initialize(EVTFrameAMPM2, EVTFrameAMPM2_Initialize);
			UIDropDownMenu_SetSelectedValue(EVTFrameAMPM2, 1);
		else
			UIDropDownMenu_SetSelectedValue(EVTFrameFromTime, t[3]);
			UIDropDownMenu_Initialize(EVTFrameAMPM1, EVTFrameAMPM1_Initialize);
			UIDropDownMenu_SetSelectedValue(EVTFrameAMPM1, t[4]);
			UIDropDownMenu_Initialize(EVTFrameToTime, EVTFrameToTime_Initialize);
			UIDropDownMenu_SetSelectedValue(EVTFrameToTime, t[5]);
			UIDropDownMenu_Initialize(EVTFrameAMPM2, EVTFrameAMPM2_Initialize);
			UIDropDownMenu_SetSelectedValue(EVTFrameAMPM2, t[6]);
		end
		UIDropDownMenu_Initialize(EVTFrameType, EVTFrameType_Initialize);
		UIDropDownMenu_SetSelectedValue(EVTFrameType, t[7]);
		UIDropDownMenu_Initialize(EVTFrameSubType, EVTFrameSubType_Initialize);
		UIDropDownMenu_SetSelectedValue(EVTFrameSubType, t[8]);
		EVTFrameMando:SetChecked(t[9]);
		EVTFrameNoteEditBox:SetText(t[10]);
		EVTCheckComplete();
	end
end

function EVTFrameOptions_OnClick()
	EVTFrameOptionsLock:SetChecked(CalendarOptions["frameDrag"]);
	EVTFrameOptionsEvents:SetChecked(CalendarOptions["acceptEvents"]);	
	EVTFrameOptionsConfirm:SetChecked(CalendarOptions["confirmEvents"]);
	EVTFrameOptions24h:SetChecked(CalendarOptions["milFormat"]);	
	ShowUIPanel(EVTFrameOptions);
end

--- Helper Functions ---
function displayDate()
	return string.format("%s%s%s", displayYear, displayMonth, displayDay);
end

function convertDate(str)
	local nDay = tonumber(string.sub(str, 7, 8));
	local nMon = tonumber(string.sub(str, 5, 6));
	local nYear = tonumber(string.sub(str, 1, 4));

	local newDate = string.format("%s %s, %s", table_Months[nMon], nDay, nYear);
	
	return newDate;
end
	
function disableButton(Button, ButtonPos)
    table_DayVal[ButtonPos] = nil;
    Button:SetNormalTexture(ImgDayInactive);
    Button:SetPushedTexture(ImgDayInactive);
    Button:SetHighlightTexture("");
    Button:SetScript("Onclick", function()
        end);
    if (displayPos == ButtonPos) then
        name = Button:GetName();
        EVT_DayClick(name, false);
    end
end

function getButtonPosOffset()
	local offset = selectedButton:GetID() + FauxScrollFrame_GetOffset(EventListScrollFrame);
	return offset;
end

function getPlayerInfo()
	t = player_Info;

	t["name"] = UnitName("player");

	guildName,guildRank,guildIndex = GetGuildInfo("player")
	guildIndex = guildIndex;
	if guildName ~= nil then
		t["guild"] = guildName;
		t["officer"] = isOfficer(guildIndex);
	else
		t["guild"] = false;
		t["officer"] = false;
	end
end

function isOfficer(index)
	if index == 0 then
		return true;
	end
	GuildControlSetRank(index);
	local _,_,s3, s4 = GuildControlGetRankFlags();
	if s3 == 1 and s4 == 1 then
		return true;
	else
		return false;
	end
end

function getDayOverlayTex(val)
	local calData = string.format("%s%s%s",displayYear, displayMonth, val);
	local tex;
	if TableIndexExists(CalendarData, calData) then
		local t = CalendarData[calData];
		if t[1] ~= nil then
			if t[1][7] == 1 then
				return ImgIcoInstance;
			end
			if t[1][7] == 2 then
				if t[1][8] == 1 then
					return ImgIcoNefarian;
				end
				if t[1][8] == 2 then
					return ImgIcoRagnaros;
				end
				if t[1][8] == 3 then
					return ImgIcoKelthuzad;
				end
				if t[1][8] == 4 then
					return ImgIcoOnyxia;
				end
				if t[1][8] == 5 then
					return ImgIcoOssirian;
				end
				if t[1][8] == 6 then
					return ImgIcoCthun;
				end
				if t[1][8] == 7 then
					return ImgIcoHakkar;
				end
			end
			if t[1][7] == 3 then
				return ImgIcoPvP;
			end
			if t[1][7] == 4 then
				return ImgIcoQuest;
			end
			if t[1][7] == 5 then
				return ImgIcoMeeting;
			end
			if t[1][7] == 6 then
				return ImgIcoOther;
			end
			if t[1][7] == 7 then
				return ImgIcoOther;
			end
		end
	end
	return "";
end