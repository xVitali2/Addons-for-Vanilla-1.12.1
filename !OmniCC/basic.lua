--[[
	basic.lua
		A featureless version of OmniCC,  
		Doesn't require saved variables or main.lua to function, but has no options
		
	To use it, change the file listings in !OmniCC.toc to only the name of this file.
	You can also remove the saved variables line.
--]]

--returns the formatted time with the appropiate scale and color
local function GetFormattedTime(secs)
	if secs >= 86400 then
		return floor(secs / 86400 + 0.5) .. "d", mod(secs, 86400);
	elseif secs >= 3600 then
		return floor(secs / 3600 + 0.5) .. "h", mod(secs, 3600);
	elseif secs >= 60 then
		return floor(secs / 60 + 0.5) .. "m", mod(secs, 60);
	end
	return floor(secs + 0.5), secs - floor(secs);
end

--OnUpdate Function
local function Text_OnUpdate()
	if this.timeToNextUpdate <= 0 or not this.icon:IsVisible() then
		local remain = this.duration - (GetTime() - this.start);

		if floor(remain + 0.5) > 0 and this.icon:IsVisible() then
			local text, toNextUpdate = GetFormattedTime(remain);
			this.text:SetText( text );
			this.timeToNextUpdate = toNextUpdate;
		else
			this:Hide();
		end
	else
		this.timeToNextUpdate = this.timeToNextUpdate - arg1;
	end
end

--Constructor
local function CreateCooldownCount(cooldown, start, duration)
	local textFrame = CreateFrame("Frame", nil, cooldown:GetParent());
	cooldown.textFrame = textFrame;
	
	textFrame:SetAllPoints(cooldown:GetParent());
	textFrame:SetFrameLevel(cooldown.textFrame:GetFrameLevel() + 1);
	
	textFrame.text = cooldown.textFrame:CreateFontString(nil, "OVERLAY");
	textFrame.text:SetFont(STANDARD_TEXT_FONT, 20, "OUTLINE");
	textFrame.text:SetTextColor(1, 1, 0.2);
	textFrame.text:SetPoint("CENTER", cooldown.textFrame, "CENTER", 0, 1);
	
	textFrame.icon = 
		--standard action button icon, $parentIcon
		getglobal(cooldown:GetParent():GetName() .. "Icon") or 
		--standard item button icon,  $parentIconTexture
		getglobal(cooldown:GetParent():GetName() .. "IconTexture") or 
		--discord action button, $parent_Icon
		getglobal(cooldown:GetParent():GetName() .. "_Icon");
	
	if textFrame.icon then
		textFrame:SetScript("OnUpdate", Text_OnUpdate);
	end
	
	textFrame:Hide();
	
	return textFrame;
end

--Function Hooks
local oCooldownFrame_SetTimer = CooldownFrame_SetTimer
CooldownFrame_SetTimer = function(cooldownFrame, start, duration, enable)
	oCooldownFrame_SetTimer(cooldownFrame, start, duration, enable);
	
	if start > 0 and duration > 3 and enable > 0 then
		local cooldownCount = cooldownFrame.textFrame or CreateCooldownCount(cooldownFrame, start, duration);		
		cooldownCount.start = start;
		cooldownCount.duration = duration;
		cooldownCount.timeToNextUpdate = 0;
		cooldownCount:Show();
	elseif cooldownFrame.textFrame then
		cooldownFrame.textFrame:Hide();
	end
end