function ParseSpellAndRank(spellName, spellRank)
	assert( "GetSpellByName", "ParseSpellAndRank", spellName, spellRank )
	
	local RANK_PATTERN = RANK .. " (%d+)"
	if ( spellRank ) then	-- search provided rank for: "Rank " .. tonumber( spellRank )
		if ( type( spellRank ) == "number" ) then	return spellName, spellRank	end
		
		for match2 in string.gfind( spellRank or "", RANK_PATTERN ) do
			return spellName, tonumber( match2 )
		end
		
	else	-- search all provided information for: spellName .. "(Rank " .. tonumber( spellRank ) .. ")"
		for match1, match2 in string.gfind( spellName or "", "(.-)%(" .. RANK_PATTERN .. "%)$" ) do	-- This regular expression looks like someone's had spellID bad day.
			spellName, spellRank = match1, match2
			return spellName, spellRank
		end
	end
	
	return spellName, nil	-- This line might be reached is someone passed something like: "Escape Artist", "Racial"
end

--[[ Now why doesn't this function exist in the WoW API?  Give it spellID spell name, and it will find the index in the book.
	Please note: spell indexes are highly subject to change over your character's lifetime,
	since spells do not have "universally unique identifiers".
	The ID returned is the spell's vertical location in an alpha-sorted list, typified by the in-game spellbook.
	
	## Includes: ..\JIM_toolbox\SearchAscendingList.lua
]]
function GetSpellByName(spellName, spellRank, spellBook)
	if ( spellName ) then
		spellName, spellRank = ParseSpellAndRank( spellName, spellRank )
		
		spellBook = spellBook or BOOKTYPE_SPELL
		local GetNumSpells = ( spellBook == BOOKTYPE_SPELL ) and GetSpellTabInfo or function()
			return 0, 0, 0, HasPetSpells()
		end
		
		local spellsSearched = 0
	
		for tabIndex = 1, ( spellBook == BOOKTYPE_SPELL ) and GetNumSpellTabs() or 1 do
			local _, _, _, variance = GetNumSpells( tabIndex )
			local spellID = SearchAscendingList( spellName,
				function(spellID)
					return GetSpellName( spellID, spellBook )
				end,
				spellsSearched + variance,
				spellsSearched + 1
			)
			
			if ( spellID ) then
				_, variance = ParseSpellAndRank( GetSpellName( spellID, spellBook ) )
				spellID = spellID + ( spellRank or 1 ) - ( variance or 1 )
				
				assert( "GetSpellByName", "found ", spellName, spellRank, " at index:", spellID, spellBook )
				
				return spellID, spellBook, spellName, spellRank
			end
			
			spellsSearched = spellsSearched + variance
		end
		
		assert( "GetSpellByName", "failed in its search for:", spellName, spellRank )		
		return nil, nil, spellName, spellRank
	end
	-- return nil, nil -- This should never happen if the spellName supplied is good.
end
