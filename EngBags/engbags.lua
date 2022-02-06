ENGBAGS_VERSION = "1.58";

BINDING_HEADER_EngBags = "EngBags";

EngBags_MAX_BARS = 15;
EngBags_BUTTONFRAME_X_PADDING = 2;
EngBags_BUTTONFRAME_BUTTONWIDTH = 30;
EngBags_BUTTONFRAME_WIDTH = EngBags_BUTTONFRAME_BUTTONWIDTH + (EngBags_BUTTONFRAME_X_PADDING*2);
EngBags_BUTTONFRAME_Y_PADDING = 1;
EngBags_BUTTONFRAME_BUTTONHEIGHT = 30;
EngBags_BUTTONFONTHEIGHT = 0.35 * EngBags_BUTTONFRAME_BUTTONHEIGHT;
EngBags_BUTTONFRAME_HEIGHT = EngBags_BUTTONFRAME_BUTTONHEIGHT + (EngBags_BUTTONFRAME_Y_PADDING*2);
EngBags_BKGRFRAME_WIDTH = EngBags_BUTTONFRAME_BUTTONWIDTH * 1.6;  -- 40 -> 64
EngBags_BKGRFRAME_HEIGHT = EngBags_BUTTONFRAME_BUTTONHEIGHT * 1.6;
EngBags_COOLDOWN_SCALE = 0.85;

EngBags_SORTLOWESTVALUE = 0;
EngBags_NOSORT = 0;
EngBags_SORTBYNAME = 1;
EngBags_SORTBYNAMEREV = 2; -- reverses the name then sorts it:  ie:   "Potion Mana Major" vs "Major Mana Potion"
EngBags_SORTHIGHESTVALUE = 2;

EngBags_MAXCOLUMNS_MAX = 20;
EngBags_MAXCOLUMNS_MIN = 8;

EngBags_BUTTONSIZE_MIN = 25;
EngBags_BUTTONSIZE_MAX = 50;

EngBags_FONTSIZE_MIN = 8;
EngBags_FONTSIZE_MAX = 20;

EngBags_MAINWINDOWCOLORIDX = 17;

EngBagsItems = {};

function EngBags_SetDefaultValues()
	local current_config_version = 1;
	if ( (EngBagsConfig == nil) or (EngBagsConfig["configVersion"] == nil) or (EngBagsConfig["configVersion"] ~= current_config_version) ) then
		EngBagsConfig = { ["configVersion"] = current_config_version };
		EngBagsConfig["Bank"] = {EngBags_PLAYERID};
		EngBagsConfig["Inventory"] = {EngBags_PLAYERID};
	end

end

function EngBags_NumericRange(value, lowest, highest)
        
        if (value == nil) then return nil; end

        if (type(value) ~= "number") then
                value = tonumber(value);
        end

        if ( (value ~= nil) and (lowest ~= nil) and (value < lowest) ) then
                value = nil;
        end
        if ( (value ~= nil) and (highest ~= nil) and (value > highest) ) then
                value = nil;
        end

        return value;
end

function EngBags_StringChoices(value, choices_array)
        local found = 0;

        if (value == nil) then
                return nil;
        end

        for key,cvalue in choices_array do
                if (value == cvalue) then
                        found = 1;
                end
        end

        if (found == 0) then
                return nil;
        else
                return value;
        end
end

function EngBags_copyTable( source )
	assert( source and type( source ) == "table", "copyTable was passed invalid parameters" )
	local target = {}
	for k, v in pairs( source ) do
		if type( v ) == "table" then
			target[ k ] = EngBags_copyTable( source[ k ] )
		else
			target[ k ] = source[ k ]
		end
	end
	return target
end

function EngBags_ExtractTooltip(tooltipframe)
	local txt_left, txt_right, frame_left, frame_right, idx, out, tt_hack;

	tt_hack = getglobal(tooltipframe);
	tt_hack:SetOwner(UIParent, "ANCHOR_NONE");	-- this makes sure that tooltip.valid = true

	out = {};

	for idx = 1, getglobal(tooltipframe):NumLines() do
		frame_left = getglobal(tooltipframe.."TextLeft"..idx);
		frame_right = getglobal(tooltipframe.."TextRight"..idx);

		out[idx] = {
			["l"] = frame_left:GetText(),
			["r"] = frame_right:GetText()
			};

		if ( not frame_left:IsVisible() ) then
			out[idx]["l"] = "";
		end
		if ( not frame_right:IsVisible() ) then
			out[idx]["r"] = "";
		end

		if (EngBags_ENABLE_GETTEXTCOLOR) then
			if (out[idx]["l"] ~= nil) then
				out[idx]["lr"],
				out[idx]["lg"],
				out[idx]["lb"] = frame_left:GetTextColor();
			end
			if (out[idx]["r"] ~= nil) then
				out[idx]["rr"],
				out[idx]["rg"],
				out[idx]["rb"] = frame_right:GetTextColor();
			end
		end
	end

	return out;
end


function EngBags_SplitSpace(strtosplit)
	if (strtosplit) then
		local str1 = strtosplit;
	        local str2 = "";
	        local idx = strfind(strtosplit, " ");

		if ( idx ) then
	                str1 = strsub(strtosplit, 1, idx-1);
	                str2 = strsub(strtosplit, idx+1);
	        end

	        return str1, str2;
	else
		return "", "";
	end
end

function EngBags_Print(msg,r,g,b,frame,id,unknown4th)
        if (not r) then r = 1.0 end
        if (not g) then g = 1.0 end
        if (not b) then b = 0.0 end
        if(unknown4th) then
                local temp = id
                id = unknown4th
                unknown4th = id
        end
        if ( frame ) then 
                frame:AddMessage(msg,r,g,b)
        else
                if ( DEFAULT_CHAT_FRAME ) then 
                        DEFAULT_CHAT_FRAME:AddMessage(msg, r, g, b)
                end
        end
end

function EngBags_PrintDEBUG(msg,r,g,b,frame,id,unknown4th)
	if ((EngBags_DEBUGMESSAGES) == 1 or (ENGINVENTORY_DEBUGMESSAGES == 1)) then
		--EngBags_Print(msg,r,g,b,frame,id,unknown4th)
	end
end



function EngBags_Trim(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"));
end

function EngBags_GetPlayer(ebplayerName)
	if ( not EngBagsItems[ebplayerName] or (not EngBagsItems[ebplayerName].money and table.getn(EngBagsItems[ebplayerName]) == 0) ) then
		EngBagsItems[ebplayerName] = {};
		EngBags_Print("ERROR: Player's Bank not saved yet! [" .. ebplayerName .. "]");
	end
	bankPlayerName = ebplayerName;
	return EngBagsItems[ebplayerName];
end


function EngBags_ReverseString(strtorev,toggle)
	local out = "", s1, s2;

	s2 = strtorev;

	if toggle==2 then
	repeat
		s1, s2 = EngBags_SplitSpace(s2);
		if out == "" then
			out = s1..out;
		else
			out = s1.." "..out;
		end

	until s2 == "";
	else
	out = strtorev;
	end
	
	return(out);
end

function EngBags_IsShotBag(bag)
	local BankSlotLink, itemCode, itemSubtype;
	if ( bag > 0 and bag < 5) then
		local BankSlotLink = GetInventoryItemLink("player",(19+bag));
		if BankSlotLink ~= nil then
			local _, _, itemCode = strfind(BankSlotLink, "(%d+):");
			local _, _, _, _, _, itemSubtype, _, _, _ = GetItemInfo(itemCode);
			if (itemSubtype == "Quiver" or itemSubtype == "Ammo Pouch") then
				return true;
			end
		end
	else
	        return false;
	end
	return false;
end

function EngBags_Table_RemoveKey(tab, key)
	local temptab = {};

	for k,v in tab do
		if (k ~= key) then
			temptab[k] = v;
		end
	end

	return temptab;
end

function EngBags_UserDropdown_GetValue()
	if ( bankPlayerName ) then
		return bankPlayerName;
	else
		return (UnitName("player").."|"..EngBags_Trim(GetCVar("realmName")));
	end
end

function EngBags_UserDropdown_OnLoad()
	UIDropDownMenu_Initialize(this, EngBags_UserDropdown_Initialize);
	UIDropDownMenu_SetSelectedValue(this, EngBags_UserDropdown_GetValue());
	EngBags_UserDropdown.tooltip = "You are viewing this player's bank contents.";
	UIDropDownMenu_SetWidth(140, EngBags_UserDropdown);
	OptionsFrame_EnableDropDown(EngBags_UserDropdown);
end

function EngBags_UserDropdown_OnClick()
	
--	EngBags_Print("Function under development.");
--
-- end 

	UIDropDownMenu_SetSelectedValue(EngBags_UserDropdown, this.value);
	if ( this.value ) then
		bankPlayer = EngBags_GetPlayer(this.value);
	end
	EngBank_PLAYERID = bankPlayerName;
	EngBank_AtBank = 0;
	EngBank_resort_required = EngBank_MANDATORY;
	EngBank_window_update_required = EngBank_MANDATORY;
	EngBank_UpdateWindow();

end

function EngBags_UserDropdown_Initialize()
	local selectedValue = UIDropDownMenu_GetSelectedValue(EngBags_UserDropdown);
	local info;

		for key, value in EngBagsItems do
			local thisRealmPlayers = EngBags_Split(key, "|")[2];
			if ( thisRealmPlayers == EngBags_Trim(GetCVar("realmName"))  ) then
				info = {};
				info.text = EngBags_Split(key,"|")[1].." of "..EngBags_Split(key,"|")[2];
				info.value = key;
				info.func = EngBags_UserDropdown_OnClick;
				if ( selectedValue == info.value ) then
					info.checked = 1;
				else
					info.checked = nil;
				end
				UIDropDownMenu_AddButton(info);
			end
		end

end


function EngBags_Split(toCut, separator)
	local splitted = {};
	local i = 0;
	local regEx = "([^" .. separator .. "]*)" .. separator .. "?";

	for item in string.gfind(toCut .. separator, regEx) do
		i = i + 1;
		splitted[i] = EngBags_Trim(item) or '';
	end
	splitted[i] = nil;
	return splitted;
end



function EngBags_GetCooldownString(cooldownInfo)
	local CoolDownRemaining = cooldownInfo["duration"] - (GetTime() - cooldownInfo["start"]);
	-- 60 secs in a min
	-- 3600 secs in an hour
	-- 86400 secs in a day
	local days, hours, minutes, seconds;
	days = math.floor(CoolDownRemaining / 86400);
	CoolDownRemaining = CoolDownRemaining - 86400 * days;
	hours = math.floor(CoolDownRemaining / 3600);
	CoolDownRemaining = CoolDownRemaining - 3600 * hours;
	minutes = math.floor(CoolDownRemaining / 60);
	seconds = math.floor(CoolDownRemaining - 60 * minutes);
	if days > 0 then
		return format(ITEM_COOLDOWN_TIME_DAYS_P1, days+1);
	elseif hours > 0 then
		return format(ITEM_COOLDOWN_TIME_HOURS_P1, hours+1);
	elseif minutes > 0 then
		return format(ITEM_COOLDOWN_TIME_MIN, minutes+1);
	else
		return format(ITEM_COOLDOWN_TIME_SEC, seconds);
	end
end