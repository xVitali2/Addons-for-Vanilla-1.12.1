	-------------------------------------------------------------------------------	
	local blipTexture = [[Interface\addons\enemyFrames\globals\resources\blips\blip]]
	local minimapTableBlips 	= {{'BattlefieldMinimapParty', 16, MAX_PARTY_MEMBERS}, {'BattlefieldMinimapRaid', 16, MAX_RAID_MEMBERS}}
	local worldMapTableBlips 	= {{'WorldMapRaid', 19, MAX_RAID_MEMBERS}, {'WorldMapParty', 19, MAX_PARTY_MEMBERS}}
	-------------------------------------------------------------------------------
	local icon, name, color, flagCarrier, flagTex
	local skinBlip = function(blip, size)
		if ENEMYFRAMESPLAYERDATA['pvpmapblips'] then
			icon = _G[blip:GetName()..'Icon']
			if not blip.unit then return end
			name = blip.name or UnitName(blip.unit)			
			
			blip:SetHeight(size)	blip:SetWidth(size)			
			if string.find(blip.unit, 'raid') then--GetNumRaidMembers() > 0 then
				local _, _, subgroup = GetRaidRosterInfo(string.sub(blip.unit, 5))
				icon:SetTexture(blipTexture..subgroup)
			else
				icon:SetTexture(blipTexture)
			end
			blip:SetFrameLevel(3)

			local _, class  = UnitClass(blip.unit)
			color = RAID_CLASS_COLORS[class]
			if color then
				icon:SetVertexColor(color.r, color.g, color.b)
			end
			
			if  name == flagCarrier then
				icon:SetTexture(flagTex)
				icon:SetVertexColor(1, 1, 1)
				
				blip:SetHeight(size+1)	blip:SetWidth(size+1)	
				blip:SetFrameLevel(4)
			end
		end
	end
	-------------------------------------------------------------------------------
	local updateBlips = function(tableBlips)
		for i = 1, 2 do
			for j = 1, tableBlips[i][3] do		
				skinBlip(_G[tableBlips[i][1]..j], tableBlips[i][2])
			end
		end
	end
	-------------------------------------------------------------------------------
	local addOnShow = function(tableBlips)
		for i = 1, 2 do
			for j = 1, tableBlips[i][3] do
				local mapBlip = _G[tableBlips[i][1]..j]
				mapBlip.size = tableBlips[i][2]
				mapBlip:SetScript('OnShow', function()
						skinBlip(this, this.size)
				end)
			end
		end
	end
	addOnShow(worldMapTableBlips)
	-------------------------------------------------------------------------------
	PVPMAPUpdateFlagCarrier = function(fc)
		local of = UnitFactionGroup('player') == 'Alliance' and 'Horde' or 'Alliance'
		flagTex = 'Interface\\WorldStateFrame\\'..of..'Flag'
		
		flagCarrier = fc[of] and fc[of] or ''
		--print('fc: ' .. flagCarrier)
		
		updateBlips(worldMapTableBlips)
		if IsAddOnLoaded'Blizzard_BattlefieldMinimap' then 
			updateBlips(minimapTableBlips)
		end	
	end
	-------------------------------------------------------------------------------
	local eventHandler = function()
		if event == 'ADDON_LOADED' then
			if arg1 == 'Blizzard_BattlefieldMinimap' then
				addOnShow(minimapTableBlips)
			end
		else
			updateBlips(worldMapTableBlips)
			if IsAddOnLoaded'Blizzard_BattlefieldMinimap' then 
				updateBlips(minimapTableBlips)
			end	
		end
	end
	-------------------------------------------------------------------------------
	local f = CreateFrame('Frame', nil, WorldMapFrame)
	f:RegisterEvent'ADDON_LOADED'
	f:RegisterEvent'RAID_ROSTER_UPDATE'
	f:RegisterEvent'ZONE_CHANGED_NEW_AREA'
	f:SetScript('OnEvent', eventHandler)
	-------------------------------------------------------------------------------
