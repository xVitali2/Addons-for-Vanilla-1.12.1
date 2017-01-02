-- It is absolutely ESSENTIAL to check whether spells begin to cast.
-- "Spell spamming" and "out of range"-messages have the potential to overwrite legitimate spellcasts.
function NoRedMessages(trialFunction, ...)
	local oldErrorMessager = UIErrorsFrame.AddMessage
	
	-- Use a local function to quickly "grab hold" of the part of the WoW UI that produces
	-- angry red messages.  These messages include "spell isn't ready yet", "out of range", etc..
	-- When error messages are produced, this code will run briefly and set the spellOK variable to false,
	-- which is then passed up to the casting function that wanted to be error-free.
	local functionIsOK = true
	UIErrorsFrame.AddMessage = function(objData, msg, r, g, b, a, holdTime)
		oldErrorMessager( objData, msg, r, g, b, a, holdTime )
		assert( "NoRedMessages", "caught an error." )
		functionIsOK = false
	end

	trialFunction( unpack( arg ) )
	
	UIErrorsFrame.AddMessage = oldErrorMessager
	
	return functionIsOK
end

