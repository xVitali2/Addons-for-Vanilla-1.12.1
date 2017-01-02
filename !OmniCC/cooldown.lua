--[[
	Omni Cooldown Count
		A universal cooldown count, based on Gello's spec
--]]

--returns the formatted time, scaling to use, color, and the time until the next update is needed
local function GetFormattedTime(secs)
	--day
	if secs > 86400 then
		return ceil(secs / 86400) .. "d", OmniCC.vlong.s, OmniCC.vlong.r, OmniCC.vlong.g, OmniCC.vlong.b, mod(secs, 86400);
	--hour
	elseif secs > 3600 then
		return ceil(secs / 3600) .. "h", OmniCC.vlong.s, OmniCC.vlong.r, OmniCC.vlong.g, OmniCC.vlong.b, mod(secs, 3600);
	--minute
	elseif secs > 60 then
		return ceil(secs / 60) .. "m", OmniCC.long.s, OmniCC.long.r, OmniCC.long.g, OmniCC.long.b, mod(secs, 60);
	--second, more than 5 seconds left
	elseif secs >= 5.5 then
		return floor(secs + 0.5), OmniCC.medium.s, OmniCC.medium.r, OmniCC.medium.g, OmniCC.medium.b, secs - floor(secs);
	end
	--second, 5 or less left
	return floor(secs + 0.5), OmniCC.short.s, OmniCC.short.r, OmniCC.short.g, OmniCC.short.b, secs - floor(secs);
end

--[[
	Text cooldown constructor
		Its a seperate frame to prevent some rendering issues.
--]]

local function CreateCooldownCount(cooldown, start, duration)
	--[[
		OmniCC hides the text cooldown if the icon the button is hidden or not.
		This makes it a bit more dependent on other mods as far as their icon format goes.
		Its the only way I can think of to absolutely make sure that the text cooldown is hidden properly.
	--]]
	local icon = 
		--standard action button icon, $parentIcon
		getglobal(cooldown:GetParent():GetName() .. "Icon") or 
		--standard item button icon,  $parentIconTexture
		getglobal(cooldown:GetParent():GetName() .. "IconTexture") or 
		--discord action button, $parent_Icon
		getglobal(cooldown:GetParent():GetName() .. "_Icon");
	
	if icon then
		local textFrame = CreateFrame("Frame", nil, cooldown:GetParent());
		textFrame:SetAllPoints(cooldown:GetParent());
		textFrame:SetFrameLevel(textFrame:GetFrameLevel() + 1);
		cooldown.textFrame = textFrame;
		
		textFrame.text = textFrame:CreateFontString(nil, "OVERLAY");
		textFrame.text:SetPoint("CENTER", textFrame, "CENTER", 0, 1);
		
		textFrame.icon = icon;
		
		textFrame:SetAlpha(cooldown:GetParent():GetAlpha());
		textFrame:Hide();
		
		textFrame:SetScript("OnUpdate", OmniCC_OnUpdate);
		
		return textFrame;
	end
end

--[[  Shine Code  - adapted from ABInfo ]]--

local function Shine_Update()
	local shine = this.shine;
	local alpha = shine:GetAlpha();
	shine:SetAlpha(alpha * 0.95);
	
	if alpha < 0.1 then
		this:Hide();
	else
		shine:SetHeight(alpha * this:GetHeight() * OmniCC.shineScale);
		shine:SetWidth(alpha * this:GetWidth() * OmniCC.shineScale);
	end
end

local function CreateShineFrame(parent)
	local shineFrame = CreateFrame("Frame", nil, parent);
	shineFrame:SetAllPoints(parent);
	
	local shine = shineFrame:CreateTexture(nil, "OVERLAY");
	shine:SetTexture("Interface\\Cooldown\\star4");
	shine:SetPoint("CENTER", shineFrame, "CENTER");
	shine:SetBlendMode("ADD");
	shineFrame.shine = shine;
	
	shineFrame:Hide();
	shineFrame:SetScript("OnUpdate", Shine_Update);
	shineFrame:SetAlpha(parent:GetAlpha());
	
	return shineFrame;
end

local function StartToShine(textFrame)
	local shineFrame = textFrame.shine or CreateShineFrame(textFrame:GetParent());
	
	shineFrame.shine:SetAlpha(shineFrame:GetParent():GetAlpha());
	shineFrame.shine:SetHeight(shineFrame:GetHeight() * OmniCC.shineScale);
	shineFrame.shine:SetWidth(shineFrame:GetWidth() * OmniCC.shineScale);
	
	shineFrame:Show();
end

--[[ Text Update ]]--

function OmniCC_OnUpdate()
	if this.timeToNextUpdate <= 0 or not this.icon:IsVisible() then
		local remain = this.duration - (GetTime() - this.start);

		if floor(remain + 0.5) > 0 and this.icon:IsVisible() then
			local time, scale, r, g, b, timeToNextUpdate = GetFormattedTime( remain );
			this.text:SetFont(OmniCC.font , OmniCC.size * scale, "OUTLINE");
			this.text:SetText( time );
			this.text:SetTextColor(r, g, b);
			this.timeToNextUpdate = timeToNextUpdate;
		else
			if OmniCC.shine and this.icon:IsVisible() then
				StartToShine(this);
			end
			this:Hide();
		end
	else
		this.timeToNextUpdate = this.timeToNextUpdate - arg1;
	end
end

--[[ Function Hooks ]]--

local oCooldownFrame_SetTimer = CooldownFrame_SetTimer
CooldownFrame_SetTimer = function(cooldownFrame, start, duration, enable)
	if not OmniCC.hideModel then
		oCooldownFrame_SetTimer(cooldownFrame, start, duration, enable);
	else
		cooldownFrame:Hide();
	end
	
	if start > 0 and duration > (OmniCC.min or 0) and enable > 0 then
		local cooldownCount = cooldownFrame.textFrame or CreateCooldownCount(cooldownFrame, start, duration);	
		if cooldownCount then
			cooldownCount.start = start;
			cooldownCount.duration = duration;
			cooldownCount.timeToNextUpdate = 0;
			cooldownCount:Show();
		end
	elseif cooldownFrame.textFrame then
		cooldownFrame.textFrame:Hide();
	end
end