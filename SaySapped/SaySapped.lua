--russian by CFM
local SaySapped = CreateFrame("Frame")
SaySapped.playername = UnitName("player")

SaySapped:SetScript("OnEvent", function(_,_,_,event, _,_,sourceName, _,_,_,destName, _,_,spellId)
if ((spellId == 6770)
	and (destName == SaySapped.playername)
	and (event == "SPELL_AURA_APPLIED" or event == "SPELL_AURA_REFRESH"))
then
	SendChatMessage("Sapped","SAY")
	if (GetLocale()=="ruRU") then
		DEFAULT_CHAT_FRAME:AddMessage("Ошеломление от: "..(sourceName or "(unknown)"))
	else
		DEFAULT_CHAT_FRAME:AddMessage("Sapped by: "..(sourceName or "(unknown)"))
	end
end
end)
SaySapped:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")