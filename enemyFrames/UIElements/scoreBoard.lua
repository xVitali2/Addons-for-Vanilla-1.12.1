	-------------------------------------------------------------------------------
	local index, buttonName, name, class, numScores
	EFWorldStateScoreFrame_Update = WorldStateScoreFrame_Update
	
	function WorldStateScoreFrame_Update()
		EFWorldStateScoreFrame_Update()
		
		-- class colored player's names on BG score board
		numScores = GetNumBattlefieldScores()
		for i=1, MAX_WORLDSTATE_SCORE_BUTTONS do
			index = FauxScrollFrame_GetOffset(_G['WorldStateScoreScrollFrame']) + i
			
			if ( index <= numScores ) then
				name, _, _, _, _, _, _, _, class = GetBattlefieldScore(index)
				
				if name ~= UnitName'player' then
					--buttonName = getglobal("WorldStateScoreButton"..i.."NameButtonName")
					class = string.upper(class)
					getglobal("WorldStateScoreButton"..i.."NameButtonName"):SetVertexColor(RAID_CLASS_COLORS[class].r, RAID_CLASS_COLORS[class].g, RAID_CLASS_COLORS[class].b)
				end
			end			
		end
	end
	-------------------------------------------------------------------------------