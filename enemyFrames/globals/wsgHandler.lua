	-------------------------------------------------------------------------------
	local L = enemyFrames.L
	local flagCarriers, fcTemp = {}, {}
	-------------------------------------------------------------------------------
	function WSGHANDLERsetFlagCarriers(fc)
		flagCarriers = fc
	end
	-------------------------------------------------------------------------------
	local eventHandler = function()

		if event ~= 'RAID_ROSTER_UPDATE' then
			-- Flag for Alliance flag for horde. thanks blizzard
			local pick = L['The %s [Ff]lag was picked up by %s!']
			local drop = L['The %s [Ff]lag was dropped by %s!']
			local score = L['%s captured the %s [Ff]lag!']
			
			if string.find(arg1, enemyFrames:SanitizePattern(pick)) then
				local first, second = enemyFrames:cmatch(arg1, pick)
				local flag 		= first
				local carrier 	= second

				if GetLocale() == 'ruRU' then
					flag = flag == enemyFrames.custom_locale_strings['Horde'] and 'Horde' or flag == enemyFrames.custom_locale_strings['Alliance'] and 'Alliance'
				end
				
				flagCarriers[flag] = carrier
			end
			
			if string.find(arg1, enemyFrames:SanitizePattern(drop)) then
				local flag 		= enemyFrames:cmatch(arg1, drop)
				
				if GetLocale() == 'ruRU' then
					flag = flag == enemyFrames.custom_locale_strings['Horde'] and 'Horde' or flag == enemyFrames.custom_locale_strings['Alliance'] and 'Alliance'
				end
				
				flagCarriers[flag] = nil
			end
			
			if string.find(arg1, enemyFrames:SanitizePattern(score)) then
				flagCarriers = {}
			end
			
			ENEMYFRAMECOREUpdateFlagCarriers(flagCarriers)
		else
			fcTemp['Alliance'] = flagCarriers['Alliance'] 	and flagCarriers['Alliance'] 	or ' '
			fcTemp['Horde']    = flagCarriers['Horde'] 		and flagCarriers['Horde'] 		or ' '
			
			if flagCarriers['Alliance'] or  flagCarriers['Horde'] then
				sendMSG('EFC', fcTemp['Alliance'], fcTemp['Horde'], true)
			end
		end
	end
	-------------------------------------------------------------------------------
	local f = CreateFrame'Frame'
	f:RegisterEvent'PLAYER_ENTERING_WORLD'
	f:RegisterEvent'ZONE_CHANGED_NEW_AREA'
	f:RegisterEvent'CHAT_MSG_BG_SYSTEM_ALLIANCE' 
	f:RegisterEvent'CHAT_MSG_BG_SYSTEM_HORDE'
	f:RegisterEvent'RAID_ROSTER_UPDATE'
	f:SetScript('OnEvent', function()	if event == 'PLAYER_ENTERING_WORLD' or event == 'ZONE_CHANGED_NEW_AREA' then	flagCarriers = {}
										else	eventHandler()	end
							end)
	-------------------------------------------------------------------------------