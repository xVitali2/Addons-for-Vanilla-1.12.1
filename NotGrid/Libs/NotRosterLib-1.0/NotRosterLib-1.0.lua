--[[
Name: NotRosterLib-1.0
Revision: $Rev: 1 $
Author(s): gnwl
Website: https://github.com/gnwl/NotRosterLib
Description: Attempting to correct crtical bugs and general flaws of rosterlib
Dependencies: AceLibrary, AceEvent-2.0
]]

local MAJOR_VERSION = "NotRosterLib-1.0"
local MINOR_VERSION = "$Revision: 2 $"

if not AceLibrary then error(vmajor .. " requires AceLibrary.") end
if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end
if not AceLibrary:HasInstance("AceEvent-2.0") then error(MAJOR_VERSION .. " requires AceEvent-2.0") end
if not AceLibrary:HasInstance("Compost-2.0") then error(MAJOR_VERSION .. " requires Compost-2.0") end -- yeah we're requiring it

local Lib = {}
local roster = {}
local oldtemp
local temp

-------------------------------
-- activate, enable, disable --
-------------------------------

local function activate(self, oldLib, oldDeactivate)
    if oldLib then
        self.roster = oldLib.roster
        oldLib:UnregisterAllEvents()
        oldLib:CancelAllScheduledEvents()
    end
    if not self.roster then self.roster = roster end
    if oldDeactivate then oldDeactivate(oldLib) end
end

local function external(self, major, instance)
    if major == "AceEvent-2.0" then
        local AceEvent = instance
        AceEvent:embed(self)
        if AceEvent:IsFullyInitialized() then
            self:AceEvent_FullyInitialized()
        else
            self:RegisterEvent("AceEvent_FullyInitialized","AceEvent_FullyInitialized",true)
        end     
    end
end

function Lib:AceEvent_FullyInitialized()
    self:RegisterEvent("PLAYER_ENTERING_WORLD","ScanFullRoster")
    self:RegisterEvent("RAID_ROSTER_UPDATE","ScanFullRoster")
    self:RegisterEvent("PARTY_MEMBERS_CHANGED","ScanFullRoster")
    self:ScanFullRoster()
end

---------------
-- Main Loop --
---------------

function Lib:ScanFullRoster()
    local partycount = GetNumPartyMembers()
    local raidcount = GetNumRaidMembers()
    if raidcount > 0 and event == "PARTY_MEMBERS_CHANGED" then return end -- because it doesn't actually process both of them sometimes(most of the time)

    temp = Compost:Acquire()
    oldtemp = Compost:Acquire()
    for name,_ in roster do
        table.insert(oldtemp, name)
    end

    if raidcount > 0 then
        for i=1,raidcount do
            self:AddUnit("raid"..i,false,true,i)
            self:AddUnit("raidpet"..i,true,true,i)
        end
    elseif partycount > 0 then
        self:AddUnit("player",false)
        self:AddUnit("pet",true)
        for i=1,partycount do
            self:AddUnit("party"..i,false)
            self:AddUnit("partypet"..i,true)
        end
    else
        self:AddUnit("player",false)
        self:AddUnit("pet",true)
    end

    self:CompareRosters() -- compare new to old and old to new and fill up {updatedunits} and send out UnitChanged Triggers as well
    self:TriggerEvent("NotRosterLib_RosterChanged") -- not going to maintain a changed units table. It's silly.
    
    Compost:Reclaim(oldroster)
    Compost:Reclaim(temp)
end

--------------
-- Add Unit --
--------------

function Lib:AddUnit(unitid,ispet,israid,raidindex)
    local old = nil
    local name = UnitName(unitid)
    if name and name ~= UNKNOWNOBJECT and name ~= UKNOWNBEING and not UnitIsCharmed(unitid) then
        if ispet and roster[name] and roster[name].class ~= "PET" then
            return -- if its a pet, and we already have a member by the pets name in the group and the recorded member is not a pet, then ignore this pet. He's a bad boy trying to fuck shit up.
        end
        temp[name] = true -- add him to the temp table to check againt old roster later
        if roster[name] then
            old = Compost:Acquire()
            old.name     = roster[name].name
            old.unitid   = roster[name].unitid
            old.class    = roster[name].class
            old.rank     = roster[name].rank
            old.subgroup = roster[name].subgroup
        else
            roster[name] = Compost:Acquire()
        end
        roster[name].name = name
        roster[name].unitid = unitid
        if ispet then
            roster[name].class = "PET"
        else
            _,roster[name].class = UnitClass(unitid)
        end
        if israid then
            _,roster[name].rank,roster[name].subgroup = GetRaidRosterInfo(raidindex)
        else
            roster[name].rank = 0 -- shouldn't it be 2 to significy leader? Or do a leader check?
            roster[name].subgroup = 1
        end

        -- then do checks
        if not old
        or roster[name].name     ~= old.name
        or roster[name].unitid   ~= old.unitid
        or roster[name].class    ~= old.class
        or roster[name].subgroup ~= old.subgroup
        or roster[name].rank     ~= old.rank
        then
            self:TriggerEvent("NotRosterLib_UnitChanged",roster[name],old)
        end
        Compost:Reclaim(old) -- Doesn't make a lot of sense. How is the function recieveing the trigger getting any values? Besides getting them bofre this clears it
    end
end

function Lib:CompareRosters()
    for _,name in oldtemp do
        if not temp[name] then
            self:TriggerEvent("NotRosterLib_UnitChanged",nil,roster[name])
            Compost:Reclaim(roster[name]) -- do I need to set a depth for this? It might claim other tables stored
            roster[name] = nil -- do I need to do this?
        end
    end
end

---------
-- API --
---------

function Lib:GetUnitIDFromName(name)
    if roster[name] then
        return roster[name].unitid
    else
        return nil
    end
end


function Lib:GetUnitIDFromUnit(unit)
    local name = UnitName(unit)
    if name and roster[name] then
        return roster[name].unitid
    else
        return nil
    end
end


function Lib:GetUnitObjectFromName(name)
    if roster[name] then
        return roster[name]
    else
        return nil
    end
end


function Lib:GetUnitObjectFromUnit(unit)
    local name = UnitName(unit)
    if roster[name] then
        return roster[name]
    else
        return nil
    end
end

------------------------------------------------
-- Register
------------------------------------------------

AceLibrary:Register(Lib, MAJOR_VERSION, MINOR_VERSION, activate, nil, external)