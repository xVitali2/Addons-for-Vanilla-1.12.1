function GRH_OnLoad(self)
    self:RegisterEvent("ADDON_LOADED")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    SlashCmdList["GRYPHONSREMOVER"] = GRH_SlashHandler
    SLASH_GRYPHONSREMOVER1 = "/grrem"
    SLASH_GRYPHONSREMOVER2 = "/grr"
end

function GRH_OnEvent(event)
	if(event == "ADDON_LOADED" and arg1 == "GryphonsRemover") then
		if (toggle == nil) then	toggle = true end
	end
	if (event == "PLAYER_ENTERING_WORLD") then
		if (toggle) then
			MainMenuBarLeftEndCap:Hide();
			MainMenuBarRightEndCap:Hide();
		end
	end
end

function GRH_SlashHandler(msg)
	msg = string.lower(msg)
	if (msg == "toggle") then
		if (toggle) then
			toggle = false
			MainMenuBarLeftEndCap:Show();
			MainMenuBarRightEndCap:Show();
		else
			toggle = true
			MainMenuBarLeftEndCap:Hide();
			MainMenuBarRightEndCap:Hide();
		end
	else
		DEFAULT_CHAT_FRAME:AddMessage("GRYPHONSREMOVER (by Bazi): \n           toggle : enable/disable addon");
	end
end
