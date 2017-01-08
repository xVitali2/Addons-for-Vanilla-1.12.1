
local flagCarriers = {}

local eventHandler = function()

	-- Flag for Alliance flag for horde. thanks blizzard
	local pick 	= EF_L_THEWASPICKEDUPBY
	local drop 	= EF_L_THEWASDROPPEDBY
	local score = EF_L_CAPTUREDTHE
	
	if string.find(arg1, pick) then
		local flag 		= gsub(arg1, pick, '%1')
		local carrier 	= gsub(arg1, pick, '%3')
		
		flagCarriers[flag] = carrier
	end
	
	if string.find(arg1, drop) then
		local flag 		= gsub(arg1, drop, '%1')
		
		flagCarriers[flag] = nil
	end
	
	if string.find(arg1, score) then
		flagCarriers = {}
	end
	
	ENEMYFRAMECOREUpdateFlagCarriers(flagCarriers)
end

local f = CreateFrame'Frame'
f:RegisterEvent'PLAYER_ENTERING_WORLD'
f:RegisterEvent'ZONE_CHANGED_NEW_AREA'
f:RegisterEvent'CHAT_MSG_BG_SYSTEM_ALLIANCE' 
f:RegisterEvent'CHAT_MSG_BG_SYSTEM_HORDE'
f:SetScript('OnEvent', function()	if event == 'PLAYER_ENTERING_WORLD' or event == 'ZONE_CHANGED_NEW_AREA' then	flagCarriers = {}
									else	eventHandler()	end
						end)