-- Here will be ~dragons~ all the constants, enums, types for type hinting, etc
--

-- Gatherer_EGatherType = {treasure=0, herb=1, ore=2}
Gatherer_EGatherType = {
	[0]          = "Treasure",
	[1]          = "Herb",
	[2]          = "Ore",
	[3]          = "Default",
	["Treasure"] = 0,
	["Herb"]     = 1,
	["Ore"]      = 2,
	["Default"]  = 3,
};

function Gatherer_EGatherType_ensureIndex(gatherType)
	-- type: (Gatherer_EGatherType) -> gatherTypeIndex
	local gatherTypeIndex
	if type(gatherType) == "string" then
		return Gatherer_EGatherType[gatherType];
	end
	return gatherType;
end

-- EGatherEventType = {normal=0, no_skill=1, fishing=2}

-- Continent = int
-- Zone = int
-- ZoneName = Text

-- IconName = Text
-- IconIndex = int
-- Icon = Union[IconName, IconIndex]

-- GatherName = Text
-- NodeInfo = Dict[Text, Union[int,float]]

-- GathererDb = Dict[Continent, Dict[Zone, Dict[GatherName, List[NodeInfo]]]]

-- Color = Tuple[int, int, int] -- r, g, b
-- FloatColor = Tuple[float, float, float]
-- HexColor = Text

Gatherer_EBoolean = {
	[true]='on',
	[false]='off'
}