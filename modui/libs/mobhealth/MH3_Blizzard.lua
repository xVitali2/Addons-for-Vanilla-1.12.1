--[[
    MobHealth3: Blizzard Frames!
        "I don't need no flashy unit frame mods!" "Sage isn't flashy!" "Shhh, you!"

    By Neronix of Hellscream EU
        Some code by KamuiGT
    
    Based on code from MobHealth2
--]]

if not MobHealth3 then error("<MH3 Blizzard Frames> MobHealth3 isn't loaded! Are you SURE you have MobHealth3 installed?"); return; end

MH3Blizz = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceConsole-2.0")

--[[
    File-scope local vars
--]]

local htext, ptext

--[[
    Init/Enable methods
--]]

function MH3Blizz:OnInitialize()
    MH3BlizzConfig = MH3BlizzConfig or {
        healthX = 0,
        healthY = 0,
        powerX = 0,
        powerY = 0,
        healthAbs = true,
        healthPerc = true,
        powerAbs = true,
        powerPerc = true,
    }

    -- Create frame and fontstrings

    local frame = CreateFrame("frame", "MobHealth3BlizzardFrame", TargetFrame)

    htext = frame:CreateFontString("MobHealth3BlizzardHealthText", "ARTWORK")
    htext:SetFontObject(GameFontNormalSmall)
    htext:SetHeight(32)
    htext:SetPoint("TOP", TargetFrameHealthBar, "BOTTOM", MH3BlizzConfig.healthX-2, MH3BlizzConfig.healthY+22)
    htext:SetTextColor(1, 1, 1, 1)

    ptext = frame:CreateFontString("MobHealth3BlizzardPowerText", "ARTWORK")
    ptext:SetFontObject(GameFontNormalSmall)
    ptext:SetHeight(32)
    ptext:SetPoint("TOP", TargetFrameManaBar, "BOTTOM", MH3BlizzConfig.powerX-2, MH3BlizzConfig.powerY+22)
    ptext:SetTextColor(1, 1, 1, 1)

    self:RegisterChatCommand({"/mh3b", "/mh3blizz"}, {
        type = "group",
		args = {
			abshealth = {
				name = "Show absolute health",
				desc = "Toggles showing absolute health on the target frame",
				type = "toggle",
				get = function() return MH3BlizzConfig.healthAbs end,
				set = function(val)
                    MH3BlizzConfig.healthAbs = val
                    self:HealthUpdate()
                end,
			},
			perchealth = {
				name = "Show health percentage",
				desc = "Toggles showing percentage health on the target frame",
				type = "toggle",
				get = function() return MH3BlizzConfig.healthPerc end,
				set = function(val)
                    MH3BlizzConfig.healthPerc = val
                    self:HealthUpdate()
                end,
			},
			abspower = {
				name = "Show absolute power",
				desc = "Toggles showing absolute mana/energy/rage on the target frame",
				type = "toggle",
				get = function() return MH3BlizzConfig.powerAbs end,
				set = function(val)
                    MH3BlizzConfig.powerAbs = val
                    self:PowerUpdate()
                end,
			},
			percpower = {
				name = "Show power percentage",
				desc = "Toggles showing percentage mana/energy/rage on the target frame",
				type = "toggle",
				get = function() return MH3BlizzConfig.powerPerc end,
				set = function(val)
                    MH3BlizzConfig.powerPerc = val
                    self:PowerUpdate()
                end,
			},
			healthx = {
				name = "Health X offset",
				desc = "Adjusts the X offset of the health text",
				type = "text",
				usage = "<number>",
				get = function() return MH3BlizzConfig.healthX end,
				set = function(val) 
                    MH3BlizzConfig.healthX = tonumber(val)
                    htext:SetPoint("TOP", TargetFrameHealthBar, "BOTTOM", MH3BlizzConfig.healthX-2, MH3BlizzConfig.healthY+22)
                end,
			},
			healthy = {
				name = "Health Y offset",
				desc = "Adjusts the Y offset of the health text",
				type = "text",
				usage = "<number>",
				get = function() return MH3BlizzConfig.healthY end,
				set = function(val) 
                    MH3BlizzConfig.healthY = tonumber(val)
                    htext:SetPoint("TOP", TargetFrameHealthBar, "BOTTOM", MH3BlizzConfig.healthX-2, MH3BlizzConfig.healthY+22)
                end,
			},
			powerx = {
				name = "Power X offset",
				desc = "Adjusts the X offset of the power text",
				type = "text",
				usage = "<number>",
				get = function() return MH3BlizzConfig.powerX end,
				set = function(val) 
                    MH3BlizzConfig.powerX = tonumber(val)
                    ptext:SetPoint("TOP", TargetFrameManaBar, "BOTTOM", MH3BlizzConfig.powerX-2, MH3BlizzConfig.powerY+22)
                end,
			},
			powery = {
				name = "Power Y offset",
				desc = "Adjusts the Y offset of the power text",
				type = "text",
				usage = "<number>",
				get = function() return MH3BlizzConfig.powerY end,
				set = function(val) 
                    MH3BlizzConfig.powerY = tonumber(val)
                    ptext:SetPoint("TOP", TargetFrameManaBar, "BOTTOM", MH3BlizzConfig.powerX-2, MH3BlizzConfig.powerY+22)
                end,
			},
		},
	})
    
    -- WARNING WARNING WARNING
    -- BIG DIRTY HACK AHEAD
    
    TargetDeadText:SetText()
    
    -- Ok, it wasn't even big, nor was it actually a hack
end

function MH3Blizz:OnEnable()
    self:RegisterEvent("UNIT_HEALTH")
    self:RegisterEvent("UNIT_MANA")
    self:RegisterEvent("PLAYER_TARGET_CHANGED")
end

--[[
    Event handlers
--]]

function MH3Blizz:UNIT_HEALTH()
    if arg1 == "target" then self:HealthUpdate() end
end

function MH3Blizz:UNIT_MANA()
    if arg1 == "target" then self:PowerUpdate() end
end

function MH3Blizz:PLAYER_TARGET_CHANGED()
    if UnitExists("target") then
        self:HealthUpdate()
        self:PowerUpdate()
    end
end

--[[
    Updaters
--]]

function MH3Blizz:HealthUpdate()
    local cur, max = MobHealth3:GetUnitHealth("target", UnitHealth("target"), UnitHealthMax("target"))

    local absText, percText = "", ""

    -- Set absolute text
    if MH3BlizzConfig.healthAbs then
        if max == 100 then
            -- Do nothing!
        elseif max > 999999 then
            -- Display numbers in K notation
            absText = string.format("%dK/%dK", cur/1000, max/1000)
        else
            absText = string.format("%d/%d", cur, max)
        end
    end

    -- Set percentage text
    if MH3BlizzConfig.healthPerc then
        percText = string.format("(%d%%)", max == 100 and cur or math.floor(cur/max*100 + 0.5))
    end

    htext:SetText(absText.." "..percText)
end

function MH3Blizz:PowerUpdate()
    local cur, max = UnitMana("target"), UnitManaMax("target")
    
    -- No power? No text!
    if max == 0 then ptext:SetText(); return; end
    
    local absText, percText = "", ""

    -- Set absolute text
    if MH3BlizzConfig.powerAbs then
        if max > 999999 then
            -- Display numbers in K notation
            absText = string.format("%dK/%dK", cur/1000, max/1000)
        else
            absText = string.format("%d/%d", cur, max)
        end
    end

    -- Set percentage text
    if MH3BlizzConfig.powerPerc then
        percText = string.format("(%d%%)", max == 100 and cur or math.floor(cur/max*100 + 0.5))
    end

    ptext:SetText(absText.." "..percText)
end

