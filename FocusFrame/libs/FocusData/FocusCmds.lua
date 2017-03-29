if SlashCmdList.MFOCUS then return end

local _G = getfenv(0)
local Focus = _G.FocusData

-- Upvalues
local scantip = _G.FocusDataScantip
local scantipTextLeft1 = _G.FocusDataScantipTextLeft1
local strfind, strlower, gsub, SetCVar, GetCVar = strfind, strlower, gsub, SetCVar, GetCVar
local SpellIsTargeting, SpellStopTargeting = SpellIsTargeting, SpellStopTargeting

SLASH_FOCUS1 = "/focus"
SLASH_MFOCUS1 = "/mfocus"
SLASH_FCAST1 = "/fcast"
SLASH_FITEM1 = "/fitem"
SLASH_FSWAP1 = "/fswap"
SLASH_FASSIST1 = "/fassist"
SLASH_TARFOCUS1 = "/tarfocus"
SLASH_CLEARFOCUS1 = "/clearfocus"

-- Focus current target or by name
SlashCmdList.FOCUS = function(msg) Focus:SetFocus(msg) end

-- Target focus
SlashCmdList.TARFOCUS = function() Focus:TargetFocus() end

-- Remove focus
SlashCmdList.CLEARFOCUS = function() Focus:ClearFocus() end

-- Focus current mouseover target
SlashCmdList.MFOCUS = function()
	if UnitExists("mouseover") then
		Focus:SetFocus(UnitName("mouseover"))
	end
end

-- Cast spell on focus
SlashCmdList.FCAST = function(spell)
	spell = strlower(spell or "")
	local useOnTarget = false
	local isSuffix = strfind(spell, "-target") ~= nil --hardcoded for now

	if not Focus:FocusExists() and isSuffix then
		-- Cast spell on curr target instead when no focus is sat
		-- (This could be done with a simple macro instead but it'll keep nagging about
		-- that no focus is sat in UIErrorsFrame)
		useOnTarget = true
	end

	if isSuffix then
		spell = gsub(spell, "-target", "")
	end

	if spell == "petattack" then
		if useOnTarget then
			PetAttack()
		else
			Focus:Call(PetAttack)
		end
	else
		if useOnTarget then
			CastSpellByName(spell)
		else
			local sc = GetCVar("AutoSelfCast")
			SetCVar("AutoSelfCast", "0") -- prevent casting on self when focus is invalid
			Focus:Call(CastSpellByName, spell)
			SetCVar("AutoSelfCast", sc)

			if SpellIsTargeting() then
				SpellStopTargeting()
			end
		end
	end
end

-- Use item on focus
SlashCmdList.FITEM = function(msg)
	msg = strlower(msg or "")
	local useOnTarget = false
	local isSuffix = strfind(msg, "-target")

	if not Focus:FocusExists() and isSuffix then
		useOnTarget = true
	end

	if isSuffix then
		msg = gsub(msg, "-target", "")
	end

	if useOnTarget or Focus:FocusExists() then
		for i = 0, 19 do
			scantip:ClearLines()
			scantip:SetInventoryItem("player", i)
			local text = scantipTextLeft1:GetText()
			if text and strlower(text) == msg then
				if useOnTarget then
					return UseInventoryItem(i)
				end

				return Focus:Call(UseInventoryItem, i)
			end
		end

		for i = 0, 4 do
			for j = 1, GetContainerNumSlots(i) do
				scantip:ClearLines()
				scantip:SetBagItem(i, j)

				local text = scantipTextLeft1:GetText()
				if text and strlower(text) == msg then
					if useOnTarget then
						return UseContainerItem(i, j)
					end

					return Focus:Call(UseContainerItem, i, j)
				end
			end
		end
	else
		Focus:ShowError()
	end
end

-- Swap focus and target
SlashCmdList.FSWAP = function()
	if Focus:FocusExists(true) and UnitExists("target") then
		local target = UnitName("target")
		Focus:TargetFocus()
		Focus:SetFocus(target)
	end
end

-- Assist focus
SlashCmdList.FASSIST = function()
	if Focus:FocusExists(true) then
		Focus:TargetFocus()
		AssistUnit("target") -- assist by name does not work with pets for some reason

		if UnitName("target") == Focus:GetName() then
			-- Focus didn't have a target
			Focus:TargetPrevious()
		end
	end
end
