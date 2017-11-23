--[[
by LYQ(Virose / MOUZU)
https://github.com/MOUZU/BigWigs

This small plugin simply allows to move players in the raidgroup
from one subgroup to another, if the player using this version
is a RaidAssistant.
Previously this was possible in blizzards API but not implemented.
--]]

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsRaidOfficer = BigWigs:NewModule("RaidOfficer")

------------------------------
--      Initialization      --
------------------------------

function BigWigsRaidOfficer:OnEnable()
	self:ScheduleEvent(self.SetupFrames,2)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigs_RaidGroupButton_OnDragStart()
	if ( not IsRaidLeader() and not IsRaidOfficer() ) then
		return;
	end
	local cursorX, cursorY = GetCursorPosition();
	this:ClearAllPoints();
	this:SetPoint("CENTER", nil, "BOTTOMLEFT", cursorX*GetScreenWidthScale(), cursorY*GetScreenHeightScale());
	this:StartMoving();
	MOVING_RAID_MEMBER = this;
	SetRaidRosterSelection(this.id);
end

function BigWigs_RaidGroupButton_OnDragStop(raidButton)
	if ( not IsRaidLeader() and not IsRaidOfficer() ) then
		return;
	end
	if ( not raidButton ) then
		raidButton = this;
	end

	raidButton:StopMovingOrSizing();
	MOVING_RAID_MEMBER = nil;
	if ( TARGET_RAID_SLOT and TARGET_RAID_SLOT:GetParent():GetID() ~= raidButton.subgroup ) then
		if (TARGET_RAID_SLOT.button) then
			local button = getglobal(TARGET_RAID_SLOT.button);
			--button:SetPoint("TOPLEFT", this, "TOPLEFT", 0, 0);
			SwapRaidSubgroup(raidButton:GetID(), button:GetID());
		else
			local slot = TARGET_RAID_SLOT:GetParent():GetName().."Slot"..TARGET_RAID_SLOT:GetParent().nextIndex;
			raidButton:ClearAllPoints();
			raidButton:SetPoint("TOPLEFT", slot, "TOPLEFT", 0, 0);
			TARGET_RAID_SLOT:UnlockHighlight();
			SetRaidSubgroup(raidButton:GetID(), TARGET_RAID_SLOT:GetParent():GetID());
		end
	else
		if ( TARGET_RAID_SLOT ) then
			TARGET_RAID_SLOT:UnlockHighlight();
		end
		raidButton:ClearAllPoints();
		raidButton:SetPoint("TOPLEFT", raidButton.slot, "TOPLEFT", 0, 0);
	end
end

function BigWigsRaidOfficer:SetupFrames()
	-- I know someone else did a similar AddOn, my BigWigs might get in conflict with the other one
	-- but I don't know what the name of the other AddOn is. TODO: Change 'unknownyet'
	if not IsAddOnLoaded("unknownyet") then
		-- backup the old ones just in case
		ORIGINAL_RaidGroupButton_OnDragStart = RaidGroupButton_OnDragStart
		ORIGINAL_RaidGroupButton_OnDragStop = RaidGroupButton_OnDragStop
		-- overwrite them
		RaidGroupButton_OnDragStart = BigWigs_RaidGroupButton_OnDragStart
		RaidGroupButton_OnDragStop = BigWigs_RaidGroupButton_OnDragStop
	end
end
