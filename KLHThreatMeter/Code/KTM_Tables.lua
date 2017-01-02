--! This module references these other modules:
--! my:	class, 
--! net:	idleupdateinterval, 
--! out:	checktrace, printtrace, 
--! unit:	isplayeringroup, 
--! string:	get, 

--! This module is referenced by these other modules:
--! alert:	mydata, 
--! boss:	raiddata, raidthreatoffset, getraidthreat, resetraidthreat, 
--! combat:	mydata, raiddata, newdatastruct, getraidthreat, resetraidthreat, 
--! my:	raidthreatoffset, resetraidthreat, 
--! net:	raiddata, getraidthreat, 
--! netin:	resetraidthreat, updateplayerthreat, clearraidtable, 
--! guiraid:	raiddata, raidclasses, redoraidclasses, 
--! guiself:	mydata, resetmytable, 

local mod = klhtm
local me = { }
mod.table = me

--! This variable is referenced by these modules: alert, combat, guiself, 
me.mydata = { } -- personal threat table data
--! This variable is referenced by these modules: boss, combat, net, guiraid, 
me.raiddata = { } -- raid's threat table data
--! This variable is referenced by these modules: boss, my, 
me.raidthreatoffset = 0 -- difference between your total threat and your raid threat

--! This variable is referenced by these modules: guiraid, 
me.raidclasses = { } -- list of classes by player name. e.g. { ["Kenco"] = "Warrior", }
me.raidupdatetimes = { } -- list of last update times by player, e.g. { ["Kenco"] = GetTime(), }

------------------------------------
--    Special Core.lua Methods    --
------------------------------------

me.onload = function()
	
	-- initialise me.mydata . This refers to static methods from me.string, so goes in our onload().
	me.mydata[mod.string.get("threatsource", "total")] = me.newdatastruct()
	
end


--[[
-------------------------------------------------------------------------------------------------
	Maintaining the Raid Threat List: Reset non-responsive players, remove players not in group
-------------------------------------------------------------------------------------------------

	We have the key-value list <me.raiddata>, key = name of the player, value = threat of the player. 
	We have the list <me.raidupdatetimes>, key = name of the player, value = GetTime() of last update.

There are two maintenance functions:
1) If someone hasn't updated their threat for a long time, set it to 0. This happens for example when someone gets disconnected in the middle of a fight. After the fight ends you don't want their threat sitting in the table forever.
2) If a player leaves the raid group / party, remove them from the threat list.

Now, if someone has left the raid group, then their threat will stop updating. Therefore we only need to check for case (2) when a case (1) has occurred.

We don't want me.onupdate running all the time, since the threat list maintenance doesn't need it and would be using excess processor time. Therefore it is run at most every <me.updateinterval> seconds. <me.lastonupdate> is the last time it was run.

<me.idlereset> is the number of seconds a player must be idle for before their threat is wiped. Make sure it is significantly more than <mod.net.idleupdateinterval>, which is how often players will update when their threat is not changing.
]]
me.lastonupdate = 0			-- value of GetTime()
me.updateinterval = 1.0		-- at most once every second
me.idlereset = 10.0			-- seconds before we reset someone's threat

me.isingroup = false			-- whether we are in a party or raid.

me.onupdate = function()

	-- Let's do some autohider thingy
	if (GetNumRaidMembers() > 0) or (GetNumPartyMembers() > 0) then
		-- we're in a raid
		
		if me.isingroup == false then
			-- this is a change
			me.isingroup = true
			
			-- check for autohide option
			if KLHTM_SavedVariables.autohide == true then
				KLHTM_SetVisible(true)
			end
		end
		
	else
		-- we're not in a raid
		if me.isingroup == true then
			
			-- this is a change
			me.isingroup = false
			
			-- check for autohide option
			if KLHTM_SavedVariables.autohide == true then
				KLHTM_SetVisible(false)
			end
		end
	end
	
	-- 1) check for update time
	local timenow = GetTime()
	if timenow > me.lastonupdate + me.updateinterval then
		me.lastonupdate = timenow
	else
		return
	end

	local x
	
	for x, _ in me.raiddata do
		
		-- if the player doesn't exist in <me.raidupdatetimes>, add them and do nothing.
		if me.raidupdatetimes[x] == nil then
			me.raidupdatetimes[x] = timenow
	
		elseif (timenow > me.raidupdatetimes[x] + me.idlereset) and (x ~= mod.string.get("misc", "aggrogain")) then
			
			-- Player x hasn't updated for an unusually long time. It could be because they are no longer in the raid group - check:
			if  mod.unit.isplayeringroup(x) == nil then
			
				-- yes; this player is no longer in the group. Remove them from the system
				if mod.out.checktrace("info", me, "idleplayer") then
					mod.out.printtrace(string.format("Removing %s from the table, since he isn't in the raid group.", x))
				end
				
				me.raiddata[x] = nil
				me.raidupdatetimes[x] = nil
				
				-- might need to update gui
				KLHTM_RequestRedraw("true")
			
			elseif me.raiddata[x] ~= 0 then
				-- they are still in the raid group, but they haven't updated for some time, probably becaue they were disconnected. Set their threat to 0. Also reset their UpdateTimes value.
			
				me.raiddata[x] = 0
				me.raidupdatetimes[x] = timenow
				
				if mod.out.checktrace("info", me, "idleplayer") then
					mod.out.printtrace(string.format("Resetting %s's threat, since he hasn't updated for a while.", x))
				end
				
				KLHTM_RequestRedraw("true")
			end
		end
	end

end


-- to save lots of writing!
--! This variable is referenced by these modules: combat, 
me.newdatastruct = function()
	
	return
	{
		["hits"] = 0,
		["damage"] = 0,
		["threat"] = 0,
		["rage"] = 0,
	}
	
end


-----------------------------------------------------

--[[ 
mod.table.getraidthreat()
Returns the value you would post to the raid group as your threat.
]]
--! This variable is referenced by these modules: boss, combat, net, 
me.getraidthreat = function()

	return me.mydata[mod.string.get("threatsource", "total")].threat + me.raidthreatoffset

end

--[[ 
mod.table.resetraidthreat()
Set your threat for the rest of the raid group to 0. Used for a complete threat wipe.
]]
--! This variable is referenced by these modules: boss, combat, my, netin, 
me.resetraidthreat = function()
	
	me.raidthreatoffset = - me.mydata[mod.string.get("threatsource", "total")].threat
	
end

--[[ 
mod.table.updateplayerthreat(player, threat)
Updates a raid threat entry.
<player> is the name of the player whose threat is updated
<threat> is the new amount
TODO: add code to change aggrogain here, if player is master target???
]]
--! This variable is referenced by these modules: netin, 
me.updateplayerthreat = function(player, threat)
	
	me.raiddata[player] = threat
	me.raidupdatetimes[player] = GetTime()

end


--[[ 
mod.table.redoraidclasses()
Checks the raid / party and finds the class of every player.
]]
--! This variable is referenced by these modules: guiraid, 
me.redoraidclasses = function()
	
	local numraiders = GetNumRaidMembers()
	local class
	
	if (numraiders == 0) then
		-- we're not in a raid. check party
		
		local numparty = GetNumPartyMembers()
		
		for x = 1, numparty do
			_, class = UnitClass("party" .. x)
			me.raidclasses[UnitName("party" .. x)] = string.lower(class)
		end
		
		-- also do yourself
		me.raidclasses[UnitName("player")] = mod.my.class
		
	else -- we're in a raid
		
		local class
		local name
		
		for x = 1, numraiders do
			_, class = UnitClass("raid" .. x)
			
			-- 1.12: found class could be nil sometimes, maybe just when someone joins the raid group. rare, but still.
			if class then
				me.raidclasses[UnitName("raid" .. x)] = string.lower(class)
			end
		end
	end
end

--[[
mod.table.resetmytable()
Clears all the data in your personal threat table.
]]
--! This variable is referenced by these modules: guiself, 
me.resetmytable = function()
	
	-- reset raid offset
	me.raidthreatoffset = me.getraidthreat()
	
	-- clear table
	local key
	local value
	local key2
	
	for key, value in me.mydata do
		for key2 in value do
			value[key2] = 0
		end
	end
	
end

--[[ 
mod.table.resetraidtable()
Clears all the data in the raid table.
]]
--! This variable is referenced by these modules: netin, 
me.clearraidtable = function()

	local key
	
	for key, _ in me.raiddata do
		me.raiddata[key] = nil;
	end
	
	me.raiddata[UnitName("player")] = 0

end
