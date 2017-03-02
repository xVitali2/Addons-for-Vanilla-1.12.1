-- Add a function to fix some global strings.
if GetLocale() == "koKR" then
	function FixGlobalString(pName, str)
		-- wrong global strings
		-- "%1$s|1이;가; %3$s에게 %2$s|1을;를; 사용했습니다." <- "%s|1이;가; %3$s에게 %2$s|1을;를; 사용했습니다." 
		if (pName == "OPEN_LOCK_OTHER")
			or (pName == "SIMPLEPERFORMOTHEROTHER")
			or (pName == "SPELLPERFORMGOOTHERTARGETTED")
			or (pName == "PERIODICAURADAMAGEOTHEROTHER")
			or (pName == "PERIODICAURADAMAGESELFOTHER")
			or (pName == "SIMPLECASTOTHEROTHER")
			or (pName == "SIMPLECASTOTHERSELF")
			or (pName == "SIMPLEPERFORMOTHERSELF")
			or (pName == "SPELLDURABILITYDAMAGEALLOTHERSELF")
			or (pName == "SPELLDURABILITYDAMAGEOTHERSELF")
			or (pName == "SPELLMISSOTHEROTHER") then
			str = string.gsub(str, "%%s", "%%1%$s"); -- by creep7
		elseif (pName == "COMBATLOG_HONORGAIN") then
			str = "%1$s|1이;가; 죽었습니다. 계급: %2$s (예상 명예 점수: %3$d)"; -- by creep7
		end
		
		--problematic strings
		-- %s의
	  return string.gsub(str, "(%%%d?$?s)(의)", "%1% %2") -- by mundi4
	end
else
	function FixGlobalString(pName, str)
		--problematic strings
		-- %s's
		return str
	end
end
