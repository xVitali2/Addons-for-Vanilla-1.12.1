POWER_INDEX_MANA_PET	= -2	-- Priest Mind Control, Warlock pet
POWER_INDEX_HEALTH		= -1	-- Warlock spells
POWER_INDEX_MANA		=  0	-- Priest, Warlock, Mage, Druid, Shaman, Paladin spells
POWER_INDEX_RAGE		=  1	-- Warrior, Druid abilities
POWER_INDEX_FOCUS		=  2	-- Hunter pet abilities
POWER_INDEX_ENERGY		=  3	-- Rogue, Druid abilities

--[[ Provided that a tooltip has been loaded with either SetSpell or SetAction,
	this function returns the spell name, rank, cost, and power type (mana/rage/energy)
	properties of that spell or action.
]]
function GetSpellCastTimeAndCost(tooltipName)
	if ( getglobal( tooltipName ):NumLines() > 1 ) then
		local cost, powerType

		local costText = getglobal( tooltipName .. "TextLeft2" ):GetText() or ""
	
		local costPhrases = {
			[ POWER_INDEX_MANA ]	= MANA_COST,
			[ POWER_INDEX_RAGE ]	= RAGE_COST,
			[ POWER_INDEX_ENERGY ]	= ENERGY_COST,
			[ POWER_INDEX_HEALTH ]	= HEALTH_COST,
			[ POWER_INDEX_FOCUS ]	= FOCUS_COST,
		}
		for powerIndex, costPhrase in costPhrases do
			for high, low in string.gfind( costText, string.gsub( costPhrase, "%%d", "%(%%d%+%)%[%^%%d%]%-%(%%d%*%)" ) ) do	-- this bizarre string can capture unusual number notations like "1 200"
				cost		= tonumber( ( high or "" ) .. ( low or "" ) )
				powerType	= powerIndex
				assert( "GetSpellCastTimeAndCost:", cost )
			end
		end
		
		local castTime = ( cost and 3 ) or 2
		costText = getglobal( tooltipName .. "TextLeft" .. castTime ):GetText() or ""
		
		local timingPhrases = {
			[ SPELL_CAST_TIME_INSTANT ]			= true,
			[ SPELL_CAST_TIME_INSTANT_NO_MANA ]	= true,
			[ SPELL_CAST_CHANNELED ]			= true,
			[ SPELL_ON_NEXT_RANGED ]			= true,
			[ SPELL_ON_NEXT_SWING ]				= true,
		}
		if ( timingPhrases[ costText ] ) then
			assert( "GetSpellCastTimeAndCost:", "no cast time" )
			return 0, cost, powerType
			
		else
			timingPhrases = {
				[1]  = SPELL_CAST_TIME_SEC,
				[60] = SPELL_CAST_TIME_MIN,
			}
			for seconds, timingPhrase in timingPhrases do
				for high, low in string.gfind( costText, string.gsub( timingPhrase, "%%%.3g", "%(%%d%+%)%[%^%%d%]%-%(%%d%*%)" ) ) do
					castTime	= tonumber( ( high or "" ) .. ( low or "" ) ) * seconds
					assert( "GetSpellFromTooltip:", castTime, "seconds" )
					return castTime, cost, powerType
				end
			end
		end
	end
end
