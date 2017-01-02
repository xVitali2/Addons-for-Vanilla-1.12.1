--[[--------------------------------------------------
----- VanillaGuide -----
------------------
SlashCommands.lua
Authors: mrmr
Version: 1.04.2
------------------------------------------------------
Description: 
      This file handles Slash Commands using Ace2 lib
    1.00
		-- Initial Ace2 release
	1.99a
		-- Ally addition starter version
    1.03
		-- No Changes. Just adjusting "version".
			1.99x for a beta release was a weird choise.
	1.04.1
		-- no changes at all ;)
	1.04.2
		-- no changes in here for this revision
------------------------------------------------------
Connection:
--]]--------------------------------------------------

local VGuide = VGuide

local options = { 
    type='group',
    args = {
			toggle = {
				type = 'toggle',
				name = 'toggle',
				desc = 'This Toggle VanillaGuide Main Frame visibility',
				get = "IsMFVisible",
				set = "ToggleMFVisibility"
			}
		--},
	},
}

VGuide:RegisterChatCommand({"/vguide", "/vg"}, options)

function VGuide:IsMFVisible()
	local frame = getglobal("VG_MainFrame")
    return frame:IsVisible()
end

function VGuide:ToggleMFVisibility()
    local frame = getglobal("VG_MainFrame")
	local fSettings = getglobal("VG_SettingsFrame")
    if frame:IsVisible() then
        frame:Hide()
		if fSettings:IsVisible() then
			fSettings.showthis = true
			fSettings:Hide()
		end
    else
        frame:Show()
		if fSettings.showthis then
			fSettings:Show()
		end
    end
end

return VGuide