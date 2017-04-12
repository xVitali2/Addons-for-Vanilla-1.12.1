--[[
	SaySapped: Says "Sapped!" when you get sapped allowing you to notify nearby players about it.
	Also works for many other CCs.
	Author: Coax  - Nostalrius PvP
	Translate and rework by: CFM - Elysium
	Original idea: Bitbyte of Icecrown
--]]

-- Slash Command
SLASH_SAYSAPPED1 = '/saysapped'
SLASH_SAYSAPPED2 = '/ssap'
function SlashCmdList.SAYSAPPED(msg, editbox)
  	if SaySappedConfig then
		SaySappedConfig = false
		DEFAULT_CHAT_FRAME:AddMessage(SS_DISABLED)
	else
		SaySappedConfig = true
		DEFAULT_CHAT_FRAME:AddMessage(SS_ENABLED)
	end
end

-- Translated by CFM
if GetLocale()=="ruRU" then
	SS_Sapped='Sapped!'
	SS_SpellSap='"Ошеломление".'
	SS_Loaded='|cffffff55SaySapped загружен /saysapped. От Coax, доработка и перевод CFM.'
	SS_SELFHARMFULL='Вы находитесь'
	SS_DISABLED='|cffffff55SaySapped выключен!'
	SS_ENABLED='|cffffff55SaySapped включен!'
else
	SS_Sapped='Sapped!'
	SS_SpellSap=' Sap.'
	SS_Loaded='|cffffff55SaySapped loaded, type /saysapped to toggle on and off. Made by Coax.'
	SS_SELFHARMFULL='You are'
	SS_DISABLED='|cffffff55SaySapped disabled!'
	SS_ENABLED='|cffffff55SaySapped enabled!'
end

local SaySapped = CreateFrame("Frame",nil,UIParent)
SaySapped:RegisterEvent("ADDON_LOADED")

SaySapped:SetScript("OnEvent", function()
	if arg1 == "SaySapped" then
		DEFAULT_CHAT_FRAME:AddMessage(SS_Loaded)
		if not SaySappedConfig then
			SaySappedConfig = true;
		end
		SaySapped.checkbuff = CreateFrame("Frame")
		SaySapped.checkbuff:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE")
		SaySapped.checkbuff:SetScript("OnEvent", function()
			if string.find(arg1, SS_SELFHARMFULL) then
				SaySapped_FilterDebuffs(arg1)
			end
		end)
	end
end)

-- Check if sapped
function SaySapped_FilterDebuffs(spell)
	if string.find(spell, SS_SpellSap) and SaySappedConfig then
		SendChatMessage(SS_Sapped,"SAY")
		DEFAULT_CHAT_FRAME:AddMessage(SS_Sapped)
	end
end