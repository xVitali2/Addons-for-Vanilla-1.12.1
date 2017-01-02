--[[
	Omni Cooldown Count
		A universal cooldown count, based on Gello's spec
--]]

local function PrintMsg(message)
	DEFAULT_CHAT_FRAME:AddMessage(message or "error");
end

--[[ Variable Loading ]]--

local function LoadDefaults(currentVersion)
	OmniCC = {
		min = 3, --minimum duration to show text
		font = STANDARD_TEXT_FONT, --cooldown text font; ClearFont loads before OmniCC and will be used if its there.
		size = 20, --cooldown text size
		vlong = {r = 0.8, g = 0.8, b = 0.9, s = 0.6}, --settings for cooldowns greater than an hour
		long = {r = 0.8, g = 0.8, b = 0.9, s = 0.8}, --settings for cooldowns greater than one minute
		medium = {r = 1, g = 1, b = 0.4, s = 1}, --settings for cooldowns under a minute
		short = {r = 1, g = 0, b = 0, s = 1.3}, --settings for cooldowns less than five seconds
		shine = nil,
		shineScale = 4,
		version = currentVersion,
	}
	PrintMsg(default_settings_loaded);
end

local function LoadVariables()
	local version = GetAddOnMetadata("!OmniCC", "Version");
	
	if not(OmniCC and OmniCC.version) then
		LoadDefaults(version);
	elseif OmniCC.version ~= version then
		OmniCC.version = version;
		PrintMsg(updated_to .. OmniCC.version);
	end
	
	--this font is created solely for testing if the user's selection is a valid font or not.
	if not OmniCCFont then
		CreateFont("OmniCCFont");
		if not OmniCCFont:SetFont(OmniCC.font, OmniCC.size) then
			PrintMsg(saved_font_is_invalid)			
			OmniCC.font = STANDARD_TEXT_FONT;
			if not OmniCCFont:SetFont(OmniCC.font, OmniCC.size) then
				OmniCC.font = "Fonts\\FRIZQT__.TTF";
			end
		end
	end
end

--[[ Slash Command Handler ]]--

local function PrintCommands()
	PrintMsg(Commands);
	PrintMsg(omnicc_size);
	PrintMsg(omnicc_font);
	PrintMsg(omnicc_color);
	PrintMsg(omnicc_scale);
	PrintMsg(omnicc_min);
	PrintMsg(omnicc_model);
	PrintMsg(omnicc_shine);
	PrintMsg(omnicc_shinescale);
	PrintMsg(omnicc_reset);
end

SlashCmdList["OmniCCCOMMAND"] = function(msg)
	if not msg or msg == "" or msg == "help" or msg == "?" then
		PrintCommands();
	else
		local args = {};
		for word in string.gfind(msg, "[^%s]+") do
			table.insert(args, word);
		end
		cmd = string.lower(args[1]);
		
		--/omnicc size <size>
		if cmd == "size" then
			if(tonumber(args[2]) and tonumber(args[2]) > 0) then
				OmniCC.size = tonumber(args[2]);
			else
				PrintMsg(invalid_font_size);
			end
		--/omnicc font <font>
		elseif cmd == "font" then
			if args[2] then	
				if OmniCCFont:SetFont(args[2], OmniCC.size) then
					OmniCC.font = args[2];
					PrintMsg(set_font .. OmniCC.font);
				else
					PrintMsg(args[2] .. invalid_font);
				end
			end
		--/omnicc min <size>
		elseif cmd == "min" then
			if tonumber(args[2]) then
				OmniCC.min  = tonumber(args[2]);
			end
		elseif cmd == "model" then
			if OmniCC.hideModel then
				OmniCC.hideModel = nil;
				PrintMsg(showing_cooldown_models);
			else
				OmniCC.hideModel = 1;
				PrintMsg(hiding_cooldown_models);
			end
		elseif cmd == "color" then
			if args[2] and tonumber(args[3]) and tonumber(args[4]) and tonumber(args[5]) then
				local index = string.lower(args[2]);
				if index == "vlong" or index == "long" or index == "short" or index == "medium" then
					OmniCC[index].r = tonumber(args[3]);
					OmniCC[index].g = tonumber(args[4]);
					OmniCC[index].b = tonumber(args[5]);
				end
			end
		elseif cmd == "scale" then
			if args[2] and tonumber(args[3]) then
				local index = string.lower(args[2]);
				if index == "vlong" or index == "long" or index == "short" or index == "medium" then
					OmniCC[index].s = tonumber(args[3]);
				end
			end
		elseif cmd == "shine" then
			if OmniCC.shine then
				OmniCC.shine = nil;
				PrintMsg(disabled_bright);
			else
				OmniCC.shine = 1;
				PrintMsg(shining_brightly);
			end
		elseif cmd == "shinescale" then
			if args[2] and tonumber(args[2]) then
				OmniCC.shineScale = tonumber(args[2]);
			end
		elseif cmd == "reset" then
			LoadDefaults();
		end
	end
end
SLASH_OmniCCCOMMAND1 = "/omnicc";

--[[ Event Handler ]]--

CreateFrame("Frame", "OmniCCMain");
OmniCCMain:SetScript("OnEvent", function()
	if arg1 == "!OmniCC" then
		OmniCCMain:UnregisterEvent("ADDON_LOADED");
		LoadVariables();
	end
end);
OmniCCMain:RegisterEvent("ADDON_LOADED");