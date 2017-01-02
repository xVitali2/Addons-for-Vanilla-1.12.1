--[[ SpellCast is a utility, not an AddOn.  Its purpose:
	Record information about spells being cast - ONLY those being cast.
	
	The Blizzard functions make it very difficult to learn what is going on with a spellcast.
	Rather than rely on them, use the "SpellCast_inProgress" table variable
	to find out the name and cost of the current spell.
	
	To make SpellCast available to your AddOns, include "SpellCast.xml" in your AddOn TOC file,
	anywhere before the XML / LUA files that wish to use it.
]]
--[[ SpellCast can potentially be loaded by many AddOns.
	It hooks several functions and initializes data.  We do not want this to happen more than once.
	This beginning IF statement will ensure that nothing happens if SpellCast is already in operation.
]]
if ( not SpellCast_Attempt ) then	-- SpellCast UTILITY DEFINITION


do	-- VARIABLES AND FUNCTIONS THAT ADDONS WILL WANT TO USE
	SpellCast_spams				= {}
	SpellCast_inProgress		= nil	-- What is the spell being cast right now?
	
	function SpellCast_InProgress(spell)
		if ( SpellCast_inProgress ) and ( spell.name == SpellCast_inProgress.name ) then
			return SpellCast_inProgress
		end
		
		for _, effect in SpellCast_spams do
			if ( spell.name == effect.name ) then
				return effect
			end
		end
	end
	
	function SpellCast_Attempt(spell, castingFunction, ...)
		if ( SpellCast_inProgress ) then
			assert( "SpellCast_Attempt", "spamming." )
			
			if SpellCast_InProgress( spell ) then
				castingFunction( unpack( arg ) )
				return
			end
			
			tinsert( SpellCast_spams, 1, SpellCast_inProgress )
		end
		
		SpellCast_inProgress = spell	
		
		assert( "SpellCast_Attempt", "inProgress:", spell )
		
		if ( NoRedMessages( castingFunction, unpack( arg ) ) ) then
			assert( "SpellCast_Attempt", "looks okay." )
			return spell
		
		else	SpellCast_Failed()	end
	end

	--[[ The ultimate conclusion of any spellcasting method
		is to record the name of the spell for future reference.
	]]
	function SpellCast_Identify(spell, castingFunction, ...)	-- and parameters for that castingFunction
		assert( "SpellCast_Identify", spell, castingFunction, unpack( arg ) )
		
		spell.castTime, spell.cost, spell.powerType = GetSpellCastTimeAndCost( "SpellCast_Tooltip" )
		if ( spell.castTime ) then
			return SpellCast_Attempt( spell, castingFunction, unpack( arg ) )
		end
		
		castingFunction( unpack( arg ) )
	end
	
	--[[ Discard saved spell information when:
		a player aborts a spell, or is interrupted, or the spell just stops normally.
	]]
	function SpellCast_End()
		assert( "SpellCast_End:", event )
		local ended = SpellCast_inProgress
		repeat
			SpellCast_inProgress	= tremove( SpellCast_spams, 1 )
		until ( SpellCast_inProgress ~= ended )
	end
	
	function SpellCast_Failed()
		assert( "SpellCast_Failed", event )
		SpellCast_inProgress	= tremove( SpellCast_spams, 1 )
	end
end	-- VARIABLES AND FUNCTIONS THAT ADDONS WILL WANT TO USE

do	-- HOOKED WoW API
	--[[ One of the following functions are called when a spell is cast.
		(A macro in UseAction may run CastSpellByName.)
	]]
	--[[ This function runs when a spell is clicked on in the ability book.
	]]
	SpellCast_CastSpell = CastSpell
	function CastSpell(spellID, spellBook)
		assert( "SpellCast_CastSpell", spellID, spellBook )
	
		local spell = {	ID = spellID,	book = spellBook	}
		spell.name, spell.rank = ParseSpellAndRank( GetSpellName( spellID, spellBook ) )

		SpellCast_Tooltip:SetSpell( spellID, spellBook )
		SpellCast_Identify(	spell,
			SpellCast_CastSpell, spellID, spellBook
		)
	end
	
	--[[ This one runs in response to a slash command,
		but not necessarily one that the player runs.
		It's used mostly by AddOns like this one.
	]]
	SpellCast_CastSpellByName = CastSpellByName
	function CastSpellByName(spellName)
		assert( "SpellCast_CastSpellByName", spellName )
	
		local spell = {}
		spell.ID,	spell.book,	spell.name,	spell.rank	= GetSpellByName( spellName )
		
		if ( spell.ID ) then
			SpellCast_Tooltip:SetSpell( spell.ID, spell.book )			
			SpellCast_Identify(	spell,
				SpellCast_CastSpellByName, spellName
			)
			
		else
			SpellCast_CastSpellByName( spellName )
		end
	end
	
	--[[ This one runs in response to a keypress that is bound to an action bar item,
		or a click of the action bar item itself.
	]]
	SpellCast_UseAction = UseAction
	function UseAction(slot, checkCursor, onSelf)
		assert( "SpellCast_UseAction", slot, checkCursor, onSelf )
	
		if GetActionText( slot ) or ( GetActionCount( slot ) ~= 0 ) then	-- item or macro
			SpellCast_UseAction( slot, checkCursor, onSelf )
		
		else
			SpellCast_Tooltip:SetOwner( WorldFrame, "ANCHOR_NONE" )
			SpellCast_TooltipTextRight1:SetText()
			SpellCast_Tooltip:SetAction( slot )			
			
			local spell = {}
			spell.ID,	spell.book,	spell.name,	spell.rank	= GetSpellByName( SpellCast_TooltipTextLeft1:GetText(), SpellCast_TooltipTextRight1:GetText() )

			SpellCast_Identify(	spell,
				SpellCast_UseAction, slot, checkCursor, onSelf				
			)
		end
	end
	
	--[[ Not supported yet.
		Must take into account: simultaneous spellcasting, separate cooldown event
	SpellCast_CastPetAction = CastPetAction
	function CastPetAction(slot)
		if NoRedMessages( SpellCast_CastPetAction, slot ) then
			assert( "SpellCast_CastPetAction:", slot )
			SpellCast_TooltipTextRight1:SetText()
			SpellCast_Tooltip:SetPetAction( slot )
			SpellCast_Attempt( GetSpellByName( SpellCast_TooltipTextLeft1:GetText(), SpellCast_TooltipTextRight1:GetText(), BOOKTYPE_PET ) )
		end
	end	]]
	
	--[[ Delayed target phenomenon: Greater Heal, Hunter's Mark, etc.
	]]
	SpellCast_SpellTargetUnit = SpellTargetUnit
	function SpellTargetUnit(unitID)
		if ( SpellCast_inProgress ) then
			SpellCast_inProgress.target = unitID
		end
		
		SpellCast_SpellTargetUnit( unitID )
	end
--[[	
 <Esamynn> use the OnButtonDown event on the worldframe instead and check IsSpellTargeting
	--[[ Delayed target phenomenon: Volley, Distract, etc.
	]]
	SpellCast_CameraOrSelectOrMoveStart = CameraOrSelectOrMoveStart
	function CameraOrSelectOrMoveStart()
		if ( SpellCast_inProgress ) then
			SpellCast_inProgress.target = "mouseover"
		end
		
		SpellCast_CameraOrSelectOrMoveStart()			
	end]]
end	-- HOOKED WoW API


end	-- SpellCast UTILITY DEFINITION