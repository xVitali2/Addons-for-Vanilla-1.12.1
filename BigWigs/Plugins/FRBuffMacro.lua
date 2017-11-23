local frBuffTooltip = CreateFrame( "GameTooltip", "frBuffTooltip", nil, "GameTooltipTemplate" );
frBuffTooltip:Hide()
frBuffTooltip:SetFrameStrata("TOOLTIP")
frBuffTooltip:SetOwner(WorldFrame, "ANCHOR_NONE")

local function FR_FindBuff(obuff, unit)
	local buff=strlower(obuff);
	local tooltip=frBuffTooltip;
	local textleft1=getglobal(tooltip:GetName().."TextLeft1");
	if ( not unit ) then
		unit ='player';
	end

	for i=1, 16 do
		tooltip:SetOwner(UIParent, "ANCHOR_NONE");
		tooltip:SetUnitBuff(unit, i);
		b = textleft1:GetText();
		tooltip:Hide();
		if ( b and strfind(strlower(b), buff) ) then
			return "buff", i, b;
		elseif ( b==nil ) then
			break;
		end
	end
	tooltip:Hide();
end

local function BuffFireResist()
	for i=1, GetNumRaidMembers() do
		if UnitExists("raidpet"..i) then
			if not FR_FindBuff("Resist Fire","raidpet"..i) and not FR_FindBuff("phase shift","raidpet"..i) then
				if CheckInteractDistance("raidpet"..i, 4) then
					TargetUnit("raidpet"..i)
					CastPetAction(3)
					return
				end
			end
		end
	end

	for i=1, GetNumRaidMembers() do
		if not FR_FindBuff("Resist Fire", "raid"..i) then
			if CheckInteractDistance("raid"..i, 4) then
				TargetUnit("raid"..i)
				CastPetAction(3)
				return
			end
		end
	end
end

SLASH_FRBUFF1 = "/frbuff"
SlashCmdList["FRBUFF"] = BuffFireResist
