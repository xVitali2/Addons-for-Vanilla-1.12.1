--! This module references these other modules:
--! boss:	mastertarget, isspellreportingactive, istrackingspells, bossevents, reportevent, bossattacks, newmastertarget, clearmastertarget, 
--! net:	lastmtsender, lastmtstring, lastmttime, sendmessage, checkspellvaluesyntax, addversionresponse, 
--! out:	checktrace, printtrace, print, 
--! table:	resetraidthreat, updateplayerthreat, clearraidtable, 
--! unit:	isplayerofficer, 
--! string:	get, 

--! This module is referenced by these other modules:
--! console:	messagelog, 
--! net:	messagein, 

local mod = klhtm
local me = { }
mod.netin = me

me.myevents = {"CHAT_MSG_ADDON" }

-- Special onevent function from Core.lua
me.onevent = function()

	if event == "CHAT_MSG_ADDON" then
		
		-- check the message is KLHTM, and comes from the party or raid
		if (arg1 ~= "KLHTM") or ((arg3 ~= "PARTY") and (arg3 ~= "RAID")) then
			me.logmessage("nonklhtm", string.len(arg1))
			return 
		end
		
		-- ok
		me.messagein(arg4, arg2, 1)
		
		return
	end

end

--[[ 
me.messagein(author, message, startindex)
Processes a message from the chat channel.
<author> is the name of the player who sent the message.
<message> is the original string sent.
<startindex> is the 1-based string index where the message starts.
]]
--! This variable is referenced by these modules: net, 
me.messagein = function(author, message, startindex)
	
	-- get first bit and rest
	local command
	local data
	
	_, _, command, data = string.find(message, "(%a+)(.*)", startindex)
	
	if (command == nil) or (me.commands[command] == nil) then
		
		-- log as invalid
		me.logmessage("invalid", string.len(message))
		
		if mod.out.checktrace("warning", me, "badmessage") then
			mod.out.printtrace(string.format("Received the invalid message '|cffffff00%s|r' from %s.", message, author))
		end
		
	else
		if me.commands[command](author, message, startindex + string.len(command)) then
			-- log as good
			me.logmessage("good", string.len(message))
			
			if mod.out.checktrace("info", me, "message") then
				mod.out.printtrace(author .. ":" .. message)
			end
		else
			-- log as invalid
			me.logmessage("invalid", string.len(message))
			
			if mod.out.checktrace("warning", me, "badmessage") then
				mod.out.printtrace(string.format("Received the invalid message '|cffffff00%s|r' from %s.", message, author))
			end
		end
	end
	
end

--[[ 
me.officercheck(author, message)
Checks if the author of an officer-only command is an officer. Otherwise, prints an error to trace.
<author> is the name of the player who sent the message.
<message> is the complete text of the message.
Returns: non-nil iff <author> is an officer.
]]
me.officercheck = function(author, message)
	
	if mod.unit.isplayerofficer(author) then
		return true
	
	else
		if mod.out.checktrace("warning", me, "badmessage") then
			mod.out.printtrace(string.format("|cffffff00%s|r is not an officer, but sent the message |cffffff00%s|r.", author, message))
		end
		
		return nil
	end

end

--[[
each function is called with 1) author, 2) message, 3) index of first character after the command (probably a space)
they should return non-nil if the message was good, nil otherwise
]]
me.commands = 
{
	-- clearing the raid threat
	["clear"] = function(author, message)
		
		-- author must be officer
		if me.officercheck(author, message) then
			
			mod.out.print(string.format(mod.string.get("print", "network", "threatreset"), author))
			
			mod.table.resetraidthreat()
			mod.table.clearraidtable()
			
			return true
		end
		
	end,
		
	-- 1.12: "t" is the new "threat"
	["t"] = function(author, message, start)
		
		local value = tonumber(string.sub(message, start + 1))
		
		-- check for validity
		if value == nil then 
			return
		end
	
		mod.table.updateplayerthreat(author, value)
		KLHTM_RequestRedraw("raid")
		
		return true 
		
	end,
	
	-- setting the master target
	["target"] = function(author, message, start)
	
		-- check player is an officer
		if me.officercheck(author, message) then
			
			local newmt = string.sub(message, start + 1)
			-- check newmt makes sense
			
			if newmt ~= nil and string.len(newmt) > 0 then
				
				mod.target.setrequest(author, newmt)
				
				return true
			end
		end
	end,

	-- polling the master target
	["mtpoll"] = function(author, message, start)
		
		-- check player is an officer
		if me.officercheck(author, message) then
		
			local newmt = string.sub(message, start + 1)
			-- check newmt makes sense
			
			if newmt ~= nil and string.len(newmt) > 0 then
				
				mod.target.pollrequest(author, newmt)
								
				-- message was valid so return true
				return true
			end
			
		end
		
	end,

	-- clearing the master target
	["cleartarget"] = function(author, message)
		
		-- check player is an officer
		if me.officercheck(author, message) then
			
			mod.target.clearrequest(author)
						
			-- message was valid so return true
			return true
		end
	end,
	
	-- starting knockback discovery
	["spellstart"] = function(author, message)
		
		-- check author is an officer
		if me.officercheck(author, message) == nil then
			return
		end
		
		mod.boss.isspellreportingactive = true
		
		if author == UnitName("player") then
			mod.boss.istrackingspells = true
		end
		
		-- only print out if you are a tracker
		if mod.boss.istrackingspells == true then
			mod.out.print(string.format(mod.string.get("print", "network", "knockbackstart"), author))
		end
		
		return true
		
	end,
	
	-- stopping knockback discovery
	["spellstop"] = function(author, message)
		
		-- check author is an officer
		if me.officercheck(author, message) == nil then
			return
		end
		
		mod.boss.isspellreportingactive = false
	
		if mod.boss.istrackingspells == true then
			mod.out.print(string.format(mod.string.get("print", "network", "knockbackstop"), author))
		end
		
		return true
		
	end,
	
	-- When boss spell reporting is enabled and someone suffers a boss spell
	["spelleffect"] = function(author, message, start)

		-- if we aren't monitoring reports, ignore
		if mod.boss.istrackingspells == false then
			return true -- we don't actually check correctness.
		end
		
		local _, _, spell, mob, result, data = string.find(message, "\"(.+)\" \"(.*)\" (%l+) ?(.*)", start + 1)
		
		if spell == nil then 
			return
		end
		
		if result == "miss" then
			mod.out.print(string.format(mod.string.get("print", "boss", "reportmiss"), author, mob, spell))
			
		else
			local value1, value2
			
			_, _, value1, value2 = string.find(tostring(data), "(-?%d+) (-?%d+)")
						
			if (tostring(number) == nil) or (tostring(number) == nil) then
				return
			end
			
			if result == "proc" then
				mod.out.print(string.format(mod.string.get("print", "boss", "reportproc"), author, mob, spell, value1, value2))
				
			elseif result == "tick" then
				mod.out.print(string.format(mod.string.get("print", "boss", "reporttick"), author, mob, spell, value1, value2))
				
			else
				return
			end
		end
		
		return true
	end,
	
	-- when someone changes a parameter of a boss spell
	["spellvalue"] = function(author, message, start)
		
		-- check author is an officer
		if me.officercheck(author, message) == nil then
			return
		end
		
		-- argh!! Memory creation! 64 bytes for this method! ... 
		local arglist = {}
		local x
		
		for x in string.gfind(message, "[^ ]+") do
			table.insert(arglist, x)
		end
		
		table.remove(arglist, 1)
		
		-- parse
		local value, errormsg = mod.net.checkspellvaluesyntax(arglist)
		
		-- did it work?
		if value then
			if arglist[2] == "default" then
				
				--[[ 
				suppose we receive the message "spellvalue timelapse default ticks 6". Then this would print out
					"Kenco sets the ticks parameter of the Time Lapse ability to 6."
				]]
				mod.out.print(string.format(mod.string.get("print", "boss", "spellsetall"), author, "|cffffff00" .. arglist[3] .. "|r", mod.string.get("boss", "spell", arglist[1]), value, mod.boss.bossattacks[arglist[1]][arglist[2]][arglist[3]]))
			
			else				
				mod.out.print(string.format(mod.string.get("print", "boss", "spellsetmob"), author, "|cffffff00" .. arglist[3] .. "|r", mod.string.get("boss", "spell", arglist[2]), mod.string.get("boss", "spell", arglist[1]), value, mod.boss.bossattacks[arglist[1]][arglist[2]][arglist[3]]))
			end
			
			mod.boss.bossattacks[arglist[1]][arglist[2]][arglist[3]] = value
		
			return true
		else
			
			if mod.out.checktrace("warning", me, "spellvalue") then
				mod.out.printtrace(string.format("The error message was '%s'.", errormsg))
			end
			
			return
		end
	end,
	
	-- telling people to upgrade to a new version
	["version"] = function(author, message, start)
		
		-- check author is an officer
		if me.officercheck(author, message) == nil then
			return
		end
		
		-- next argument should be the version number
		local release, revision
		_, _, release, revision = string.find(message, "(%d+)%.?(%d*)", start + 1)
		
		release = tonumber(release)
		revision = tonumber(revision)
		
		if release == nil then
			return
		end
		
		-- previously, only the release was sent as the version code. Therefore if someone sends in this format, 
		-- their version must be old.
		if revision == nil then

			mod.out.print(string.format(mod.string.get("print", "network", "remoteoldversion"), author, release .. ".x", mod.release .. "." .. mod.revision))
		
		else
		
			-- newer versions send their release and revision numbers, in a dot delimited string.			
			if (release < mod.release) or (release == mod.release and revision < mod.revision) then
				-- other guy has an old version
				mod.out.print(string.format(mod.string.get("print", "network", "remoteoldversion"), author, release .. "." .. revision, mod.release .. "." .. mod.revision))
				
			elseif (release == mod.release) and (revision == mod.revision) then
				-- we have the same version; do nothing
				
			else
				-- we have an older version - upgrade!
				mod.out.print(string.format(mod.string.get("print", "network", "upgraderequest"), author, release .. "." .. revision, mod.release .. "." .. mod.revision))
			end
		end
		
		return true
		
	end,
	
	-- asking the raid group what versions they are using
	["versionquery"] = function(author, message)
		
		-- check author is an officer
		if me.officercheck(author, message) == nil then
			return
		end
	
		-- send our version
		mod.net.sendmessage("versionresponse " .. mod.release .. "." .. mod.revision)
		
		return true
		
	end,
	
	-- response to versionquery
	["versionresponse"] = function(author, message, start)
		
		-- next argument should be the version number
		local value = tonumber(string.sub(message, start + 1))
		if value == nil then
			return
		end
		
		mod.net.addversionresponse(author, value)		
		return true
		
	end,
	
	-- Boss Spell Event
	["event"] = function(author, message, start)
		
		local eventid = string.sub(message, start + 1)
		
		-- check the event is valid
		if (eventid == nil) or (mod.boss.bossevents[eventid] == nil) then
			return
		end
		
		-- it is valid. send it to boss handler
		mod.boss.reportevent(eventid, author)
		return true
		
	end
	
}
	

------------------------------------------------------------------------

---------------------------------
--   lololol Message Logging   --
---------------------------------

--! This variable is referenced by these modules: console, 
me.messagelog = 
{
	["nonklhtm"] = 
	{
		["count"] = 0,
		["bytes"] = 0,
	},
	["invalid"] = 
	{
		["count"] = 0,
		["bytes"] = 0,
	},
	["good"] = 
	{
		["count"] = 0,
		["bytes"] = 0,
	},
	["total"] = 
	{
		["count"] = 0,
		["bytes"] = 0,
	},
}

--[[ 
me.logmessage(category, length)
Record a message from the mod's chat channel.
<category> is one of the keys in me.messagelog.
<length> is the lenght in bytes of the complete message.
]]
me.logmessage = function(category, length) 

	me.messagelog[category].count = me.messagelog[category].count + 1
	me.messagelog[category].bytes = me.messagelog[category].bytes + length

	me.messagelog["total"].count = me.messagelog["total"].count + 1
	me.messagelog["total"].bytes = me.messagelog["total"].bytes + length

end
