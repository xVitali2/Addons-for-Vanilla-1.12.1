local print = function(msg) if msg then DEFAULT_CHAT_FRAME:AddMessage(msg) end end

SLASH_TARFOCUS1 = "/tarfocus"
SLASH_FCAST1 = "/fcast"
SLASH_FOCUS1 = "/focus"
SLASH_CLEARFOCUS1 = "/clearfocus"

ClassicFocus_CurrentFocus = nil

function ClassicFocus_SetFocus(name)
	if name ~= "" then
		ClassicFocus_CurrentFocus = name
	elseif GetUnitName("target") ~= nil then
		ClassicFocus_CurrentFocus = GetUnitName("target")
	end
end

function ClassicFocus_Cast(spell)
	--target of focus target by name using "/target" command
	SlashCmdList["TARGET"](ClassicFocus_CurrentFocus)
	
	CastSpellByName(spell)
	--retarget our target exploiting the slow update to the playertarget var
	TargetUnit("playertarget")
end

SlashCmdList["FOCUS"] = function(arg)
	ClassicFocus_SetFocus(arg)
end

SlashCmdList["CLEARFOCUS"] = function()
	ClassicFocus_CurrentFocus = nil
end

SlashCmdList["FCAST"] = function(spell)
	if ClassicFocus_CurrentFocus ~= nil then
		ClassicFocus_Cast(spell)
	else
		UIErrorsFrame:AddMessage("|cffFF003F You have no focus.|r")
	end
end

SlashCmdList["TARFOCUS"] = function()
	if ClassicFocus_CurrentFocus ~= nil then
		SlashCmdList["TARGET"](ClassicFocus_CurrentFocus)
	else
		UIErrorsFrame:AddMessage("|cffFF003F You have no focus.|r")
	end
end