	-------------------------------------------------------------------------------
	local L = enemyFrames.L
	local msgPrefix = {['RT'] = 'BGEFRT', ['EFC'] = 'BGEFEFC', ['AV'] = 'BGEFEAV', ['BF'] = 'BGEFEBF'}
	
	local playerFaction = UnitFactionGroup'player'
	local tc = playerFaction == 'Alliance' and 'FF1A1A' or '00ADF0'
	-------------------------------------------------------------------------------
	function sendMSG(typ, d, icon, bg)	
		if icon == nil then icon = '' end
		d = UnitName'player' .. '/' .. d .. '/' .. icon
		local channel = bg and 'BATTLEGROUND' or UnitInRaid('player') and 'RAID' or 'PARTY'
		SendAddonMessage(msgPrefix[typ], d, channel)
	end
	-------------------------------------------------------------------------------
	local raidTarget = function()
		local m = '(.+)/(.+)/(.+)'	local fm = string.find(arg2, m)
				
		if fm then
			local sender 	= gsub(arg2, m, '%1')
			local target 	= gsub(arg2, m, '%2')
			local icon 		= gsub(arg2, m, '%3')
			--print(sender .. ' sets ' .. icon .. ' on ' .. target)
			ENEMYFRAMECORESetRaidTarget(sender, target, icon)
		end
	end
	-------------------------------------------------------------------------------
	local efc = function()
		local m = '(.+)/(.+)/(.+)'	local fm = string.find(arg2, m)
				
		if fm then
			local flagCarriers = {}
			
			local sender 			 = gsub(arg2, m, '%1')	
			if sender ~= UnitName'player' then
				flagCarriers['Alliance'] = gsub(arg2, m, '%2')
				flagCarriers['Horde'] 	 = gsub(arg2, m, '%3')
				
				if flagCarriers['Alliance'] == ' ' then flagCarriers['Alliance'] = nil end
				if flagCarriers['Horde'] 	== ' ' then flagCarriers['Horde'] = nil end
				
				ENEMYFRAMECOREUpdateFlagCarriers(flagCarriers)
			end		
		end
	end
	-------------------------------------------------------------------------------
	local newVersion = function()
		local m = '(.+)/(.+)/'	local fm = string.find(arg2, m)
				
		if fm then
			local nv = tonumber((gsub(arg2, m, '%2')))
			if nv > ENEMYFRAMESNEWVERSION then				
				ENEMYFRAMESNEWVERSION = nv				
					
				print('|cff' ..tc.. L['[enemyFrames] New version detected.']..' |cffffff00(' .. nv .. ')')
				ENEMYFRAMESVERSIONFOUND = true	
			end
			--print(arg1 .. ' ' .. arg2)
		end
	end
	-------------------------------------------------------------------------------
	local handleBuff = function()
		local m = '(.+)/(.+)/(.+)/(.+)'	local fm = string.find(arg2, m)
		
		if fm then
			local caster 	= gsub(arg2, m, '%1')
			local tar 		= gsub(arg2, m, '%2')
			local spell		= gsub(arg2, m, '%3')
			local dur		= gsub(arg2, m, '%4')
			
			if caster ~= UnitName'player' then
				SPELLCASTINGCOREaddBuff(tar, spell, dur)
			end
		end
	end
	-------------------------------------------------------------------------------
	local function eventHandler()
		local prefix = 'BGEF(.+)'			local fprefix = string.find(arg1, prefix)
		
		if fprefix then
			-- raid targets
			if  arg1 == msgPrefix['RT'] then
				raidTarget()
			-- seen EFC
			elseif  arg1 == msgPrefix['EFC']  then
				efc()			
			-- announce version
			elseif arg1 == msgPrefix['AV']  then
				--print(arg1) print(arg2)
				newVersion()	
			-- unique debuff
			elseif arg1 == msgPrefix['BF']  then
				handleBuff()
			end
		end
	end
	-------------------------------------------------------------------------------
	local f = CreateFrame'frame'
	f:RegisterEvent'CHAT_MSG_ADDON'
	f:SetScript('OnEvent', eventHandler)
	-------------------------------------------------------------------------------