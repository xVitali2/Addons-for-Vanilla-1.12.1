--[[ This is a standard binary search algorithm.  I'd rather not explain how it works since it took me 3 years to study.
	Just make sure it gets: 'term', which is either a number of a string
		'identifyingFn', which relays members of a list when given an index (or translates them into a comparable form to 'term')
		'highestIndex', which is the maximum index of an ascending ordered list - if the list has 5 items, highestIndex = 5
]]
function SearchAscendingList(term, identifyingFn, highestIndex, lowestIndex)  -- lowestIndex is optional
	if ( not lowestIndex ) then	lowestIndex = 1	end
	if ( lowestIndex > highestIndex ) then	return nil, 1	end
	
	assert( "SearchAscendingList", "for" , term, "- range:", lowestIndex, "to", highestIndex )
	
	while ( lowestIndex ~= highestIndex ) do
		local i = math.floor( ( lowestIndex + highestIndex ) / 2 )
	
		local listItem = identifyingFn(i)

		assert( "SearchAscendingList", "compared:", listItem )
		
		if ( term == listItem ) then
			return i, i
			
		elseif ( term < listItem ) then
			highestIndex = i
			
		else
			lowestIndex = i + 1
		end
	end
	
	local listItem = identifyingFn(lowestIndex)
	if ( term == listItem ) then
		assert( "SearchAscendingList", "found it at:", lowestIndex )
		return lowestIndex, lowestIndex
		
	else
		assert( "SearchAscendingList", "did not find it.  Approximation:", lowestIndex )
		return nil, lowestIndex + ( ( term > listItem ) and 1 or 0 )
	end
end
