--[[--------------------------------------------------
----- VanillaGuide -----
------------------
Core.lua
Authors: mrmr
Version: 1.04.2
------------------------------------------------------
Description: 
        Powerleveling Guide for 1.12.1 servers
        based on Joana Guide. Core FILE!
    1.00
        -- Initial Ace2 release
	1.99a
        -- Ally addition starter version
    1.03
        -- No Changes. Just adjusting "version".
            1.99x for a beta release was a weird choise.
    1.04.1
        -- Vanilla Guide Rewrite
            The "keybind" problems is forcing me to rethink
            this entire Addon. Let's see what comes out!
        -- Two level Debug (let's waste time!)
        -- Two New object created:
            .Settings, containing various settings (unneeded?)
            .GuideTables, containing the actual guides
    1.04.2
        -- no changes in here for this revision
--]]--------------------------------------------------

--[[--------------------------------------------------
Debug:
--]]--------------------------------------------------

debug_info = false
--debug_info = false
--debug_verbose = true
debug_verbose = false

do
    function Di(...)
    	if debug_info then
    	    for k, v in pairs(arg) do arg[k] = tostring(v) end
    		local s = table.concat(arg, ", ")
    		s = string.gsub(s, "([=:]),", "%1")
    		DEFAULT_CHAT_FRAME:AddMessage("|cFFff6633VGuide info:|r" .. s)
        end
        --return s
    end
    function Dv(...)
        if debug_verbose then
            for k, v in pairs(arg) do arg[k] = tostring(v) end
            local s = table.concat(arg, ", ")
            s = string.gsub(s, "([=:]),", "%1")
            DEFAULT_CHAT_FRAME:AddMessage("     |cFFff6677VGuide debug:|r" .. s)
        end
        --return s
    end
    function Dtprint (tbl, indent)
        if not debug_verbose then return end
        if not indent then indent = 0 end
        for k, v in pairs(tbl) do
            formatting = string.rep(" ", indent) .. "[" .. k .."]" .. ": "
            if type(v) == "table" then
                Dv(formatting)
                Dtprint(v, indent+4)
            elseif type(v) == "boolean" then
                Dv(formatting .. tostring(v))
            elseif type(v) == "function" then
                Dv(formatting .. tostring(v))
            elseif type(v) == "userdata" then
                Dv(formatting .. tostring(v))
            else
                Dv(formatting .. v)
            end
        end
    end
end

--[[--------------------------------------------------
Connection:
--]]--------------------------------------------------

--VGuide = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDB-2.0", "AceConsole-2.0", "AceDebug-2.0")
VGuide = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceConsole-2.0", "AceDebug-2.0")

-- Keybindings
BINDING_HEADER_VGUIDE = "Vanilla Guide"
BINDING_NAME_VGUIDE_TOGGLE = "Toggle Vanilla Guide"
BINDING_NAME_VGUIDE_PREV_STEP = "Prev Step"
BINDING_NAME_VGUIDE_NEXT_STEP = "Next Step"
BINDING_NAME_VGUIDE_PREV_GUIDE = "Prev Guide"
BINDING_NAME_VGUIDE_NEXT_GUIDE = "Next Guide"
-- Keybindings End

Dv("    ----- Verbose Debug is turned On -----")
Dv(" VGuide Core.lua Start")
Dv(" Starting!")
Dv("  on: " .. date())

function VGuide:OnInitialize(Addon_Name)
    -- fired upon Blizz's Event ADDON_LOADED
    --Dv("    -- OnInitialize Start")
    --Dv("        arg1: 'name'  -->  ", tostring(Addon_Name))
    --self:Print(self:PrintAddonInfo())

    -- Fires when non-addon-specific saved variables are loaded
    --self:RegisterEvent("VARIABLES_LOADED")
    -- Fires when an addon and its saved variables are loaded
    self:RegisterEvent("ADDON_LOADED")
    -- Fires immediately before `PLAYER_ENTERING_WORLD` on login and UI reload
    self:RegisterEvent("PLAYER_LOGIN")
    -- Fired when the player enters the world, reloads the UI, 
    -- enters/leaves an instance or battleground, or respawns at a graveyard.
    -- Also fires any other time the player sees a loading screen
    --self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("OnProfileEnable")
    self:RegisterEvent("Ace2_AddonInitialized")
    self:RegisterEvent("Ace2_AddonEnabled")

    if Addon_Name == "VanillaGuide"  then
        Dv("      -- Event |c00FF3333OnInitialize|r: " .. Addon_Name)
    end
    --Dv("    -- OnInitialize End")
end

function VGuide:Ace2_AddonInitialized(addon)
    --Dv("    -- Ace2_AddonInitialized Start")
    --self:Print("|c00FF3333"..addon.."|r: VGuide v1.0 Initialized!")
    if tostring(addon) == "VanillaGuide"  then
        Dv("        -- Event |c00FF3333Ace2_AddonInitialized|r: " .. tostring(addon))
    end
    --Dv("    -- Ace2_AddonInitialized End")
end

function VGuide:ADDON_LOADED(name)
    --Dv("    -- ADDON_LOADED Start")

    if name == "VanillaGuide" then
        Dv("      -- Event |c00FF3333ADDON_LOADED|r: " .. name)
        Dv("        |c00FF3333Vanilla Guide|r and its own SavedVariables should be loaded now!")
        
    end
    --Dv("    -- ADDON_LOADED End")
end


function VGuide:PLAYER_LOGIN()
    --Dv("    -- PLAYER_LOGIN Start")
    Dv("      -- Event |c00FF3333PLAYER_LOGIN|r:  Player should be logged in now....")
    --Dv("    -- PLAYER_LOGIN End")
end

function VGuide:OnProfileEnable()
    Dv("    -- OnProfileEnable Start")
    Dv("    -- OnProfileEnable End")
end

function VGuide:OnEnable(first)
    -- fired upon Blizz's Event PLAYER_LOGIN
    -- guess this is after VARIABLE_LOADED
    --Dv("    -- OnEnable Start")
    --Dv("        arg1: 'first'  -->  ", tostring(first))
    local _, title = GetAddOnInfo("VanillaGuide")
    local author = GetAddOnMetadata("VanillaGuide", "Author")
    local version = GetAddOnMetadata("VanillaGuide", "Version")
    local CharName = UnitName("player")
    local RealmName = GetRealmName()
    local Class = UnitClass("player")
    local Race = UnitRace("player")
    local Faction = UnitFactionGroup("player")
    Di(" Title: " .. title)
    Di("    Author: " .. author .. "     Version: |cccff1919" .. version .. "|r")
    Dv("     - CharName: " .. CharName)
    Dv("     - RealmName: " .. RealmName)
    Dv("     - Class: " .. Class)
    Dv("     - Race: " .. Race)
    Dv("     - Faction: " .. Faction)
    Dv("                ...let's check our old SavedVariables or create a new set...")

    self.Settings = objSettings:new()
    
	self.Settings:CheckSettings()  
    --self.Settings:PrintSettings()
    self.GuideTable = objGuideTable:new(self.Settings)
    self.Display = objDisplay:new(self.Settings, self.GuideTable)
    self.UI = objUI:new(self.Settings, self.Display)

    

    Dv("      -- Event |c00FF3333OnEnable|r:  Player is logged in...loading UI!")
    --Dv("    -- OnEnable End")
end

function VGuide:Ace2_AddonEnabled(addon, first)
    --Dv("    -- Ace2_AddonEnabled Start")
    if tostring(addon) == "VanillaGuide"  then
        if first then
            Dv("        -- Event |c00FF3333Ace2_AddonEnabled|r: " .. tostring(addon) .. " Enabled for the first time!")
        else
            Dv("        -- Event |c00FF3333Ace2_AddonEnabled|r: " .. tostring(addon) .. " Enabled after...")
        end
    end
    --Dv("    -- Ace2_AddonEnabled End")
end

function VGuide:OnDisable()
    -- fired when AddOn is disabled
    Dv("    -- OnDisable Start")
    --local db = self.Settings:GetSettingsEntireCharDB()
    --self.Settings:SetEntireCharDB(db)
    Dv("    -- OnSidable End")
end

function VGuide:ZONE_CHANGED()
    Dv("    -- ZONE_CHANGED Start")
    --[[
    if GetBindLocation() == GetSubZoneText() then
        if self:IsShowInChat() then
            self:Print(self:GetMessage())
        end
        if self:IsShowOnScreen() then
            UIErrorsFrame:AddMessage(self:GetMessage(), 1.0, 1.0, 1.0, 5.0)
        end
    end
    ]]
    Dv("    -- ZONE_CHANGED End")
end

Dv(" VGuide Core.lua End")
return VGuide
