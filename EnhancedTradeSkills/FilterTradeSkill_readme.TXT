i couldn't make FilterTradeSkill completely compatible without altering one of their files so i decided to give them full access to the top half of the frame while keeping control of the bottom half. 
however it is possible to alter the filtertradeskill.lua file to allow me to alter the text lines in the top half again but requires you to edit the file in Addons/FilterTradeSkill.

Open FilterTradeSkill.lua 

around line 440  find 

				if ( numAvailable == 0 ) then
					skillButton:SetText(" "..skillName)
				else
					skillButton:SetText(" "..skillName.." ["..numAvailable.."]")
				end

replace it with 

				if (IsAddOnLoaded("EnhancedTradeSkills")) then 
                                        skillButton:SetText(Pinky_TradeSkillText(skillIndex, skillName, PINKY_TRADESKILL, p_player));
				else	
					if ( numAvailable == 0 ) then
						skillButton:SetText(" "..skillName)
					else
						skillButton:SetText(" "..skillName.." ["..numAvailable.."]")
					end
				end

save the file 

i hope this is not too much of an inconvenience.

Regards 
Triadian.

