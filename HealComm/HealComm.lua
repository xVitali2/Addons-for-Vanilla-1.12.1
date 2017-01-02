local HealComm = AceLibrary("HealComm-1.0")
local AceEvent = AceLibrary("AceEvent-2.0")
local roster = AceLibrary("RosterLib-2.0")

OVERHEALPERCENT = 20
local frames = {
				["player"] = getglobal("PlayerFrameHealthBar"),
				["target"] = getglobal("TargetFrameHealthBar"),
				["party1"] = getglobal("PartyMemberFrame1HealthBar"),
				["party2"] = getglobal("PartyMemberFrame2HealthBar"),
				["party3"] = getglobal("PartyMemberFrame3HealthBar"),
				["party4"] = getglobal("PartyMemberFrame4HealthBar"),
				}

				
				
				
local function onHeal(unit, frameID)
	local frame
	if not frameID then
		frame = frames[unit]
	else
		frame = frameID
	end
	local healed = HealComm:getHeal(UnitName(unit))
	local health, maxHealth = UnitHealth(unit), UnitHealthMax(unit)
	if( healed > 0 and (health < maxHealth or OVERHEALPERCENT > 0 )) and frame:IsVisible() then
		frame.incHeal:Show()
		local healthWidth = frame:GetWidth() * (health / maxHealth)
		local incWidth = frame:GetWidth() * (healed / maxHealth)
		if (healthWidth + incWidth) > (frame:GetWidth() * (1+(OVERHEALPERCENT/100)) ) then
			incWidth = frame:GetWidth() * (1+(OVERHEALPERCENT/100)) - healthWidth
		end
		frame.incHeal:SetWidth(incWidth)
		frame.incHeal:SetHeight(frame:GetHeight())
		frame.incHeal:ClearAllPoints()
		frame.incHeal:SetPoint("TOPLEFT", frame, "TOPLEFT", healthWidth, 0)
	else
		frame.incHeal:Hide()
	end
end	

local function onEvent(unitname)
	if UnitName("target") == unitname then
		onHeal("target")
	end
	local unitobj = roster:GetUnitObjectFromName(name)
	if not unitobj or not unitobj.unitid then
		return
	end
	if UnitIsUnit("player", unitobj.unitid) then
		onHeal("player")
	else
		for i=1, 4 do
			if UnitIsUnit("party"..i, unitobj.unitid) then
				onHeal("party"..i)
			end
		end
	end
	if UnitInRaid("player") then
		local header = GROUP.." "..unitobj.subgroup
		local classheader = UnitClass(unitobj.unitid)
		local frame, unitframe
		for i=1, NUM_RAID_PULLOUT_FRAMES do
			frame = getglobal("RaidPullout"..i.."Name")
			if frame:GetText() == header or frame:GetText() == classheader then
				frame = getglobal("RaidPullout"..i)
				for z=1, frame.numPulloutButtons do
					unitframe = getglobal(frame:GetName().."Button"..z)
					if unitframe.unit == unitobj.unitid then
						onHeal(unitobj.unitid, getglobal(unitframe:GetName().."HealthBar"))
					end
				end
			end
		end
	end
end

local function TargetChanged()
	onHeal("target")
end

AceEvent:RegisterEvent("HealComm_Healupdate", onEvent)
AceEvent:RegisterEvent("PLAYER_TARGET_CHANGED", TargetChanged)

old_RaidPullout_Update = RaidPullout_Update
function new_RaidPullout_Update(pullOutFrame)
	old_RaidPullout_Update(pullOutFrame)
	if ( not pullOutFrame ) then
		pullOutFrame = this
	end
	local frame
	for i=1, pullOutFrame.numPulloutButtons do
		frame = getglobal(pullOutFrame:GetName().."Button"..i.."HealthBar")
		if not frame.incheal then
			frame.incHeal = CreateFrame("StatusBar", "PlayerFrameIncHealBar", PlayerFrame)
			frame.incHeal:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
			frame.incHeal:SetMinMaxValues(0, 1)
			frame.incHeal:SetValue(1)
			frame.incHeal:SetStatusBarColor(0, 1, 0, 0.6)
		end
	end
end
RaidPullout_Update = new_RaidPullout_Update


frames["player"].incHeal = CreateFrame("StatusBar", "PlayerFrameIncHealBar", PlayerFrame)
frames["player"].incHeal:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
frames["player"].incHeal:SetMinMaxValues(0, 1)
frames["player"].incHeal:SetValue(1)
frames["player"].incHeal:SetStatusBarColor(0, 1, 0, 0.5)

frames["target"].incHeal = CreateFrame("StatusBar", "TargetFrameIncHealBar", TargetFrame)
frames["target"].incHeal:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
frames["target"].incHeal:SetMinMaxValues(0, 1)
frames["target"].incHeal:SetValue(1)
frames["target"].incHeal:SetStatusBarColor(0, 1, 0, 0.5)

frames["party1"].incHeal = CreateFrame("StatusBar", "PartyMemberFrame1IncHealBar", PartyMemberFrame1)
frames["party1"].incHeal:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
frames["party1"].incHeal:SetMinMaxValues(0, 1)
frames["party1"].incHeal:SetValue(1)
frames["party1"].incHeal:SetStatusBarColor(0, 1, 0, 0.5)

frames["party2"].incHeal = CreateFrame("StatusBar", "PartyMemberFrame2IncHealBar", PartyMemberFrame2)
frames["party2"].incHeal:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
frames["party2"].incHeal:SetMinMaxValues(0, 1)
frames["party2"].incHeal:SetValue(1)
frames["party2"].incHeal:SetStatusBarColor(0, 1, 0, 0.5)

frames["party3"].incHeal = CreateFrame("StatusBar", "PartyMemberFrame3IncHealBar", PartyMemberFrame3)
frames["party3"].incHeal:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
frames["party3"].incHeal:SetMinMaxValues(0, 1)
frames["party3"].incHeal:SetValue(1)
frames["party3"].incHeal:SetStatusBarColor(0, 1, 0, 0.5)

frames["party4"].incHeal = CreateFrame("StatusBar", "PartyMemberFrame4IncHealBar", PartyMemberFrame4)
frames["party4"].incHeal:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
frames["party4"].incHeal:SetMinMaxValues(0, 1)
frames["party4"].incHeal:SetValue(1)
frames["party4"].incHeal:SetStatusBarColor(0, 1, 0, 0.5)