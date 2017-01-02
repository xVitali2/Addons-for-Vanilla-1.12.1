--[[ Cooldown Pulse by JIM the Inventor
	Concept authored Jan 10 2005 

	If you see code you like, go ahead and copy it.
	Yes, that's right.  I'm cool with "sharing".
	
	Blah, blah, blah, Gnu general license, etc..
	I don't care.  But I did write this stuff and will be using it in my portfolio.
	Claiming another person's work as your own IS theft,
	so if you claim you made this stuff expect me to be very very angry.
	
	Otherwise ... Thanks for supporting JIM!
]]
do	-- Change the following values to customize your version of Cooldown Pulse without having to wait for JIM

Pulse_size					= 128	-- the default width and height of the pulse image - set once per character, then changed in game
Pulse_cooldownSound			= "Interface\\AddOns\\JIM_CooldownPulse\\lubdub.wav"	-- the sound played when cooldown has completed
Pulse_MinimapButton_show	= true

function Pulse_SetSliderDefaults()
	Pulse_maxAlpha		= 0.5	-- How solid should the pulsing images be when fully visible?  1 = completely solid
	
	-- This next clump of values are all in real world seconds.
	
	Pulse_minCooldown	= 2.00	-- minimum cooldown duration that will produce a pulse
	Pulse_maxCooldown	= 3600	-- maximum cooldown duration that will produce a pulse
	Pulse_lubTime		= 0.25	-- animation time of pulse fade in
	Pulse_dubTime		= 1.00	-- animation time of pulse fade out
	Pulse_minDubTime	= 0.75	-- shortest delay before one pulse cuts another pulse short; also, time between beginning of pulses
	Pulse_expiry		= 3.00  -- pulses that have waited their turn beyond this time will be discarded
end
Pulse_SetSliderDefaults()

Pulse_CDT = {
	groups		= {},
	omnigroup	= {},
	disabled	= {},
	enabled		= {},
}	-- mimics and updates the cdtvars config table of "CooldownTimers", by Sorren of Bleeding Hollow

--[[ This is the "VARIABLES_LOADED" taskmaster for the whole AddOn.
	It ensures that all settings are applied,
	and that no conflicts will occur with other AddOns.
	
	When this block is complete, Pulse_Image becomes responsible
	for the triggering of pulses that do not cool down immediately
	on activation or first resolution.
]]
function Pulse_LoadVariables()
	this:UnregisterEvent( event )
	Pulse_Image:RegisterEvent( "SPELL_UPDATE_COOLDOWN" )
	Pulse_Image:SetScript( "OnEvent", Pulse_Cooldown )
	Pulse_Cooldown = nil
	
	Pulse_Image:SetWidth( Pulse_size )
	Pulse_Image:SetHeight( Pulse_size )

	Pulse_CDTCompliance()
	Pulse_CDTCompliance = nil
	
	if ( not Pulse_MinimapButton_show ) then	Pulse_MinimapButton:Hide()	end
end

--[[ In version 1.9.17 of this AddOn, I adopted the groups window
	of "CooldownTimers", which was created by Sorren of Bleeding Hollow.
	
	This allowed the two AddOns - which are very similar in function -
	to share 'include / exclude' data so that a prospective user
	can use both AddOns together, or switch over without loss
	of information.
	This functionality should be preserved if either AddOn is disabled.	
]]
function Pulse_CDTCompliance()
	if ( cdtvars ) then
		assert( "Pulse_CDTCompliance", "processing." )
		
		for _, listName in { "enabled", "disabled", "groups", "omnigroup" } do
			if ( not cdtvars[ listName ] ) then	cdtvars[ listName ] = {}	end
			
			assert( "Pulse_CDTCompliance", "listName:", listName )

			for effectName, groupName in ( Pulse_CDT[ listName ] or {} ) do
				assert( "Pulse_CDTCompliance", "effect:", effectName, "in", groupName )
				cdtvars[ listName ][ effectName ] = groupName
			end
		end
		
		Pulse_CDT = cdtvars
		assert( "Pulse_CDTCompliance", "ensured." )
		
	else
		assert( "Pulse_CDTCompliance", "unnecessary." )
		cdtvars = Pulse_CDT
	end
end

end	-- CUSTOMIZABLE VALUES


do	-- FUNCTIONAL VARS AND GLOBAL STRINGS

-- do not edit the following values; their contents reflect the progress of effects in the game
Pulse_preCooldown	= {}	-- these abilities are used, but don't immediately have a cooldown
Pulse_inCooldown 	= {}	-- animation timers and effect IDs
Pulse_history		= false	-- recently cooled effects

local localization = {
	frFR = {
		"Action R\195\169cente",
		"Ne peut pas r\195\169p\195\169ter une action. Permettez %s dans les options de %s."
	},
	deDE = {	-- German translations courtesy of Bartleby @ Curse-Gaming
		"Letzte Aktion",
		"Kann eine Aktion nicht wiederholen. Aktiviere %s in %s den Optionen."
	},
}
localization = localization[ GetLocale() ] or {
	"Recent Action",
	"Cannot repeat an action.  Enable %s in %s options."
}

PULSE_RECENT_ACTION,
PULSE_NO_HISTORY =
	unpack( localization )

BINDING_NAME_PULSE_PRIORITY1 = PULSE_RECENT_ACTION .. " 1"
BINDING_NAME_PULSE_PRIORITY2 = PULSE_RECENT_ACTION .. " 2"
BINDING_NAME_PULSE_PRIORITY3 = PULSE_RECENT_ACTION .. " 3"
_, BINDING_HEADER_PULSE = GetAddOnInfo( "JIM_CooldownPulse" )

PlaySoundFile( Pulse_cooldownSound )	-- this line produces the heartbeat noise as your character logs in
JIM_AnnounceAddOn( "JIM_CooldownPulse" )

end	-- FUNCTIONAL VARS AND GLOBAL STRINGS


do	-- WORKHORSE FUNCTIONS AND VARIABLES PARTICULAR TO THIS ADDON

function Pulse_WaitOn(effect, oneTime)
	if ( effect ) and not ( effect.cooledAt ) then
		assert( "Pulse_WaitOn", "queued an effect:", effect.name )
		Pulse_preCooldown[ effect.name or "default" ] = effect
		effect.checkCooldownOnce = oneTime
	end
end

function Pulse_WaitOff(effect)
	assert( "Pulse_WaitOff", "unqueued an effect." )
	if ( effect ) then
		Pulse_preCooldown[ effect.name or "default" ] = nil
	end
end

--[[ Queue up a texture to be shown by the heartbeat animation.
	The queue is supposed to have the effects in the order that they will cool down,
	so this function performs a sort after it adds new effects.
]]
function Pulse_AddEffect(effect, start, duration, enable)
	local name		= effect.name
	
	if ( start ~= 0 ) then
		if ( enable == 1 ) then
			if	( not Pulse_CDT.disabled[ name ] )	-- User criterion: Excludes
			and	(
				( duration >= Pulse_minCooldown ) and ( duration <= Pulse_maxCooldown )	-- User criterion: min / max duration
				or	Pulse_CDT.enabled[ name ]	-- User criterion: Includes
			)	then
				local proposedCooledAt = start + duration
				if ( proposedCooledAt == effect.cooledAt ) then
					return effect
				end
				
				-- If all criteria are satisfied, the effect goes into the animation queue.
				effect.cooledAt	= proposedCooledAt
				assert( "Pulse_AddEffect", name, start, duration, enable )
				
				local _existingIndex, insertionIndex = SearchAscendingList(
					effect.cooledAt,
					
					function(searchIndex)
						return Pulse_inCooldown[ searchIndex ].cooledAt
					end,
					
					table.getn( Pulse_inCooldown )
				)
				
				table.insert( Pulse_inCooldown, insertionIndex, effect )
			
				Pulse_Image:Show()
				
				return effect
			end
			
		--[[ Even if an effect does not meet any of the criteria that will animate it,
			We may still want to keep tabs on it for a second cooldown.
		]]
		else	return false	end
	end
end

--[[ Some spells and items will remain inactive after use,
	until some other condition is met.
	Perhaps it will be a mini-cooldown with no shade indicator
	or there is some state that must end before the main cooldown proceeds.
	
	In these cases, "enable" is 0 in Pulse_AddEffect,
	and this function is set to evaluate what would be otherwise random
	cooldown events.
]]
function Pulse_CheckForCooldown(effect)
	local start, duration, enable
	if ( effect.slot ) then	-- this is an item ...
		local _;
		_, _, _, _, _, _, _, _, effect.texture = GetItemInfo( effect.ID )
		
		if ( effect.bag ) then	-- ... that is in a bag.
			assert( "Pulse_CheckForCooldown", "of a bagged ITEM." )

			start, duration, enable = GetContainerItemCooldown(
				effect.bag,
				effect.slot
			)
		
		else	-- ... that is equipped.
			assert( "Pulse_CheckForCooldown", "of an equipped ITEM." )

			start, duration, enable = GetInventoryItemCooldown(
				"player", effect.slot
			)
		end
		
	elseif ( effect.ID ) then	-- this is a spell.
		assert( "Pulse_CheckForCooldown", "of a SPELL." )

		local spellID, spellBook = effect.ID, effect.book
		effect.texture = GetSpellTexture( spellID, spellBook )
		start, duration, enable = GetSpellCooldown( spellID, spellBook )
	
	else	-- probably the sample texture
		return
	end

	return Pulse_AddEffect( effect, start, duration, enable )
end

--[[ Repeat one of the last cooled effects,
	stored in the Pulse_history list.
	Index # 1 will be the most recent effect,
	or one that tops the "Enabled" list.
]]
function Pulse_Repeat(index)
	if ( Pulse_history ) then
		local effect = Pulse_history[ index ]
		if ( effect ) then
			assert( "Pulse_Repeat", effect.name )
			
			if ( effect.book ) then
				CastSpell( effect.ID, effect.book )
				
			elseif ( effect.bag ) then
				UseContainerItem( effect.bag, effect.slot )
			
			else	UseInventoryItem( effect.slot )	end
		end
		
	else
		error( 
			string.format( PULSE_NO_HISTORY, PULSE_RECENT_ACTION, BINDING_HEADER_PULSE ),
			1
		)
	end
end

end	-- WORKHORSE FUNCTIONS AND VARIABLES PARTICULAR TO THIS ADDON


do	-- HOOKED API

Pulse_Attempt = SpellCast_Attempt
function SpellCast_Attempt(spell, castingFunction, ...)
	local successful = Pulse_Attempt( spell, castingFunction, unpack( arg ) )
	if ( successful ) and ( not spell.cooledAt ) then	Pulse_CheckForCooldown( spell )	end
	return successful
end


Pulse_End = SpellCast_End
function SpellCast_End()
	if ( event == "SPELLCAST_STOP" ) and not Pulse_CheckForCooldown( SpellCast_inProgress ) then	Pulse_WaitOn( SpellCast_inProgress )	end
	Pulse_End()
end

end	-- HOOKED API


do	-- CALLED BY THE XML

--[[ This routine will check up on every spell recently cast,
	and every item recently used, to see if it is the one that cooled.
	
	"Pulse_Cooldown" is assigned to a SPELL_UPDATE_COOLDOWN OnEvent after variables are loaded.
]]
function Pulse_Cooldown()
	assert( "Pulse_Cooldown" )
	
	for key, effect in Pulse_preCooldown do
		if ( Pulse_CheckForCooldown( effect ) ~= false ) then
			Pulse_WaitOff( effect )
		end
	end
end

--[[ Animate a "heartbeat" by quickly fading a spell or ability image in and out.
	This function always expects cooldowns to be listed in Pulse_inCooldown by order of their start times.
	It will exchange the active texture when a new cooldown takes precedence.
	
	"Pulse_Animate" is assigned to the OnUpdate of Pulse_Image.
]]
function Pulse_Animate()
	local now			= GetTime()
	local anim			= ( Pulse_animation ) and ( now - Pulse_animation.pulsedAt )
	local checkEffect	= Pulse_inCooldown[ 1 ]
	
	while ( checkEffect ) do	-- unless there's an expiry, this loop only repeats once per Animate		
		local waited = now - checkEffect.cooledAt
		if ( waited >= Pulse_expiry ) then
			table.remove( Pulse_inCooldown, 1 )
			assert( "Pulse_Animate", "removed an expired effect." )
			
		elseif ( waited >= 0 ) then
			if ( Pulse_animation ) then
				if ( anim < Pulse_minDubTime ) then	break	end
				
				assert( "Pulse_Animate", "overrode an effect." )
			end
			
			assert( "Pulse_Animate", "began a pulse." )			
				Pulse_animation				= table.remove( Pulse_inCooldown, 1 )
				Pulse_animation.pulsedAt	= now
				anim = 0
		
				Pulse_ImageIcon:SetTexture( Pulse_animation.texture )
				if ( Pulse_cooldownSound ) then PlaySoundFile( Pulse_cooldownSound )	end

			--[[ Option: Cooldown History
				When enabled, this feature permits people to repeat spells and items
				as they reach cooldown.
				This portion of the program logic will remove an old effect,
				add a new effect, and make sure the order is prioritized.
			]]
			if ( Pulse_history ) and ( checkEffect.name ) then
				checkEffect.archivedAt = now
				
				table.sort( Pulse_history,
					function(v1, v2)
						return ( v1 and v2 ) and ( v1.archivedAt > v2.archivedAt )
					end
				)	-- establish "oldest" order
				
					table.remove( Pulse_history, table.getn( Pulse_history ) )
					table.insert( Pulse_history, 1, checkEffect )
					
				table.sort( Pulse_history,
					function(v1, v2)
						if ( v1 and v2 ) then
							local priority = cdtvars.enabled
							
							return ( not priority[ v2.name ] )
							or ( priority[ v1.name ] and ( priority[ v1.name ] < priority[ v2.name ] ) )
							
						else	return v1	end
					end
				)	-- establish priority
			end	-- Option: Cooldown History
		
			--[[ If the minimum cooldown time is less than the global cooldown,
				then the effect is resubmitted for observation.
			]]
				checkEffect.cooledAt = nil
				if ( Pulse_CheckForCooldown( checkEffect ) == false ) then	Pulse_WaitOn( checkEffect )	end
			break
			
		else	break	end	-- incoming animation check
		
		checkEffect = Pulse_inCooldown[ 1 ]
	end	-- expiry check
			
	if ( anim ) then
		--[[ Animation progress: anim records not the current time,
			but the progress of the animation in seconds.
			Based on this value, the effect's "alpha" can be set so that its image
			appears to be pulsing to the sound of a heartbeat.
			
			This entire function is called however often your Frames Per Second permit,
			so computers with more memory and faster video cards will get smoother animations!
			I say that like it's a good thing, but really I should tone down the frequency of this function.
		]]
		Pulse_Image:SetAlpha(
			( anim < Pulse_lubTime ) and ( anim * Pulse_maxAlpha / Pulse_lubTime )	-- pulse fade in
		or	( anim < Pulse_dubTime ) and ( Pulse_dubTime - anim ) * Pulse_maxAlpha / ( Pulse_dubTime - Pulse_lubTime )	-- pulse fade out
		or	0	-- animation over
		)
		
		if ( anim >= Pulse_dubTime ) then
			assert( "Pulse_Animate", "finished a pulse." )
			Pulse_animation.pulsedAt	= nil
			Pulse_animation				= nil
		end
		
	elseif ( not Pulse_inCooldown[ 1 ] ) then
		Pulse_Image:Hide()
	end	-- pulse animation
end

end	-- CALLED BY THE XML
