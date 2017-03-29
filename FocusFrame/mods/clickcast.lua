-- luna clickcasting
Focus_Loader:Register("LunaUnitFrames", function(Focus)
    local orig_lufmo = SlashCmdList.LUFMO
    local L = LunaUF.L

    if not L or not LunaUF.Mouseover then return end

    SlashCmdList.LUFMO = function(arg1, arg2)
        local frame = GetMouseFocus()

        if arg1 and strfind(frame:GetName() or "", "FocusFrame") then
            Focus:Call(CastSpellByName, arg1)
        else
            orig_lufmo(arg1, arg2)
        end
    end

    FocusFrame_OnClick = function(btn)
        if btn == "UNKNOWN" then
            btn = LunaUF.clickedButton
        end

        --[[if Luna_Custom_ClickFunction and Luna_Custom_ClickFunction(btn, "target") then
            return
        end]]

        local button = (IsControlKeyDown() and "Ctrl-" or "") .. (IsShiftKeyDown() and "Shift-" or "") .. (IsAltKeyDown() and "Alt-" or "") .. L[btn]
        local action = LunaUF.db.profile.clickcasting.bindings[button]

        if not action then
            return
        elseif action == L["menu"] then
            if SpellIsTargeting() then
                return SpellStopTargeting()
            end
        elseif action == L["target"] then
            if SpellIsTargeting() then
                Focus:Call(SpellTargetUnit)
            elseif CursorHasItem() then
                Focus:Call(DropItemOnUnit)
            else
                Focus:TargetFocus()
            end
        else
            Focus:TargetFocus()
            LunaUF:Mouseover(action)
            Focus:TargetPrevious()
            --LunaUF:Mouseover('FocusData:Call(CastSpellByName, "' .. action .. '")')
        end
    end
end)

--[[Loader:Register("pfUI", function(Focus)
    local orig_pfcast = SlashCmdList.PFCAST

    SlashCmdList.PFCAST = function(arg1, arg2)
        local frame = GetMouseFocus()

        if arg1 and strfind(frame:GetName() or "", "FocusFrame") then
            Focus:Call(CastSpellByName, arg1)
        else
            orig_PFCAST(arg1, arg2)
        end
    end
end)]]
