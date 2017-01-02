	-------------------------------------------------------------------------------
	local msgPrefix = {['RT'] = 'BGEFRT', ['EFC'] = 'BGEFEFC', ['AV'] = 'BGEFEAV', ['BF'] = 'BGEFEBF'}

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
	end
	-------------------------------------------------------------------------------
	local newVersion = function()
		local m = '(.+)/(.+)/'	local fm = string.find(arg2, m)
				
		if fm then
			local nv = tonumber((gsub(arg2, m, '%2')))
			--print(arg1) print(arg2)
			if nv > ENEMYFRAMESVERSION then
				ENEMYFRAMESVERSIONFOUND = true
				ENEMYFRAMESNEWVERSION = nv
			--elseif nv < ENEMYFRAMESVERSION then
			--	sendMSG('AV', ENEMYFRAMESVERSION, nil, true)
			end
		end
	end
	-------------------------------------------------------------------------------
	local handleBuff = function()
		--print(arg1) print(arg2)
		local m = '(.+)/(.+)/(.+)/(.+)'	local fm = string.find(arg2, m)
				
		if fm then
			local sender 	= gsub(arg2, m, '%1')
			local tar 		= gsub(arg2, m, '%2')
			local spell		= gsub(arg2, m, '%3')
			local dur		= gsub(arg2, m, '%4')

			if sender ~= UnitName'player' then
				SPELLCASTINGCOREqueueBuff(tar, spell, dur)
			end
		end
	end
	-------------------------------------------------------------------------------
	local function eventHandler()
		local prefix = 'BGEF(.+)'			local fprefix = string.find(arg1, prefix)

		if fprefix then	
			-- raid targets
			if  arg1 == msgPrefix['RT'] then
				--print(arg1) print(arg2)
				raidTarget()
			-- seen EFC -- WIP
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