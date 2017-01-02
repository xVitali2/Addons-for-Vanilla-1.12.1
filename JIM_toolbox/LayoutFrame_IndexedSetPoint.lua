--[[ This function substitutes for LayoutFrame:SetPoint() using the following assumptions:
	
	"layoutFrame" is a piece of UI that is currently arranging its placement.
	It is just one element of an array of UI components with identical names,
	except for the last characters, which are an index.
	
	The intent is to anchor one side of layoutFrame to an adjacent side of the element with a lower index.
]]
function LayoutFrame_IndexedSetPoint(layoutFrame, point, relativePoint, x, y)
	for nameSpace, index in string.gfind( layoutFrame:GetName() or "", "(.-)(%d+)$" ) do
		if ( index == "1" ) then
			local parent = layoutFrame:GetParent()
			layoutFrame:SetPoint( point, parent )
			return parent
			
		else
			local brace = nameSpace .. ( tonumber( index ) - 1 )
			layoutFrame:SetPoint( point, brace, relativePoint, x, y )
			return brace
		end
	end
end