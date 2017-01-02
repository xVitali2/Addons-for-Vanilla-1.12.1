
local mod = klhtm
local me = {}
mod.target = me

--[[
KTM_MasterTarget.lua

Organises the master target.
]]

me.mastertarget = nil
me.isworldboss = false
me.lastmtauthor = "" -- name of the player, or "" for noone yet.
me.lastmttime = 0
me.lastpollmessage = ""

--[[
mod.target.automastertarget(target)
Called when the mod itself sets the mastertarget.
<target> is the localised name of the mob.
]]
me.automastertarget = function(target)

	me.mastertarget = target
	KLHTM_RequestRedraw("raid")
	
	me.isworldboss = true
	me.lastmttime = GetTime()
	me.lastpollmessage = ""
	
	-- explain to user
	mod.out.print(string.format(mod.string.get("print", "boss", "automt"), target))
	
end

--[[
mod.target.bossdeath()
Called when players in the raid group report that the master target has died.
]]
me.bossdeath = function()
	
	me.mastertarget = nil
	KLHTM_RequestRedraw("raid")
	
	me.isworldboss = false
	me.lastmttime = GetTime()
	me.lastpollmessage = ""
	
end

me.lastonupdate = 0
me.onupdateinterval = 10.0

-- resend MT if we were the sender
me.onupdate = function()
		
	-- update every few seconds only
	if GetTime() < me.lastonupdate + me.onupdateinterval then
		return
	else
		me.lastonupdate = GetTime()
	end
	
	-- poll MT only if we set it last
	if me.lastmtauthor ~= UnitName("player") then
		return
	end
	
	-- check if you are still an assistant
	if mod.unit.isplayerofficer(UnitName("player")) == nil then
		me.lastmtsender = ""
		return
	end
	
	-- send poll or clear
	if me.mastertarget then
		-- this is stopped till we get a better solution
		-- mod.net.sendmessage("mtpoll " .. me.mastertarget)
	
	else
		mod.net.clearmastertarget()
	end
	
end

--[[
mod.target.pollrequest(author, target)
Called when we receive a network message of someone polling (periodically rebroadcasting) the master target.

<author>		string; name of the player who sent the message
<target>		string; name of a mob
]]
me.pollrequest = function(author, target)
	
	-- this is disabled for the moment
	if true then
		return
	end
	
	-- ignore polls that come quickly after a target change (could be sync error)
	if GetTime() < me.lastmttime + 2.0 then
		return
	end
	
	-- ignore if this message is the same as the last message, or matches our current MT 
	if (target == me.lastpollmessage) or (target == me.mastertarget) then
		return
	end
	
	-- set but warn user
	me.mastertarget = target
	KLHTM_RequestRedraw("raid")
	
	mod.out.print(string.format(mod.string.get("print", "network", "mtpollwarning"), target, author))
	
	me.lastmttime = GetTime()
	me.lastmtstring = target
	me.lastmtauthor = author
	
	-- we can't tell if the mob is a worldboss or not, so assume not
	
end

--[[
mod.target.clearrequest(author, target)
Called when we receive a network message of someone clearing the master target.

<author>		string; name of the player who sent the message
]]
me.clearrequest = function(author)
	
	-- ignore polls that come quickly after a target change (could be sync error)
	if GetTime() < me.lastmttime + 2.0 then
		return
	end
	
	-- announce if there is a change
	if me.mastertarget then
		
		me.mastertarget = nil
		KLHTM_RequestRedraw("raid")
		
		mod.out.print(string.format(mod.string.get("print", "network", "mtclear"), author))
	end
	
	-- update value of author
	me.lastmtauthor = author
	me.lastmttime = GetTime()
	me.lastpollmessage = ""
	
end

--[[
mod.target.setrequest(author, target)
Called when we receive a network message of someone setting the master target.
The problem is that if you have a different localisation to <author>, you will think his target is spelt differently to <target>! So we have to check for this, and override if necessary.

<author>		string; name of the player who sent the message
<target>		string; name of a mob
]]
me.setrequest = function(author, target)
		
	local errormessage = ""	
	
	-- 1) Find the author's UnitID
	local officerunit = mod.unit.findunitidfromname(author)
	local officertarget = UnitName(tostring(officerunit) .. "target")
	
	-- If the officer's target is just far enough away from us, we will be able to target him but his name will be "Unknown", which could stuff things up
	if officertarget == UNKNOWN then
		officertarget = nil
	end
	
	-- 2) Check for differences
	if officertarget == nil then
		errormessage = string.format(mod.string.get("print", "network", "newmttargetnil"), target, author)
	
	elseif officertarget ~= target then
		errormessage = string.format(mod.string.get("print", "network", "newmttargetmismatch"), author, target, officertarget)
		target = officertarget
	end
		
	-- 3) Check for worldboss target
	if UnitClassification((officerunit or "") .. "target") == "worldboss" then
		me.isworldboss = true
	else
		me.isworldboss = false
	end
	
	-- 4) Notify user if there is a change
	if target ~= me.mastertarget then
		me.mastertarget = target
		KLHTM_RequestRedraw("raid")
		
		-- print out any warning if there was one
		if errormessage ~= "" then
			mod.out.print(errormessage)
		end
		
		-- print out the new target
		mod.out.print(string.format(mod.string.get("print", "network", "newmt"), target, author))
	end
	
	-- 5) update network parameters and such
	me.lastmtauthor = author
	me.lastmttime = GetTime()
	me.lastpollmessage = target
	
end

--[[
mod.boss.targetismaster(target)
Checks whether <target> is the master target. The master target is usually just a name / string, but it may be something
more general in the future (e.g. tracking both bosses in the Twin Emps fight).
<target> is the name of the mob being queried.
Return: non-nil if <target> is a mastertarget.
]]
--! This variable is referenced by these modules: combat, 
me.targetismaster = function(target)
	
	if me.mastertarget == nil then
		return true
	end
	
	if target == me.mastertarget then
		return true
	end
	
	-- insert other checks here, later.
	
	return -- (nil)
	
end

-----------------------------------
--		Targeting Behaviour      --
-----------------------------------
--[[

True = True target. Who the mob would have aggro on, if we discount secondary targetting and taunts, etc.
Curr = Current target. Who the mob's target unitid is
New  = New target. If the mob's current target has changed

x, y = players with known threat values
nil  = no target
?    = player with unknown threat value


True	Curr	New		Result
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
nil		nil		x		true and curr become x

x		x		y		curr -> y. In 2 seconds with no change, true -> y. also, if their threat goes above 110 of yours in that time, put them up.
x		x		?		curr -> ?. In 2 seconds with no change, true -> ?
x		x		nil		curr -> nil.

x		y		z		curr -> z. In 2 secs, true -> z
x		y		nil		curr -> nil.
x		y		?		curr -> ?. In 2 secs, true -> ?
x		y		x		curr -> x

x		nil		y		If it's been nil for more than 1 second, true = y. Otherwise true -> y after 2 - (secs at nil) secs.
x		nil		x		curr -> x
x		nil		?		same as x - nil - y

?		?		x		true -> x. Easy enough.

]]

-- Master Target Variables
--! This variable is referenced by these modules: combat, guiraid, 
me.mttruetarget = nil	-- The Name of the player who this mod thinks is the true target
me.mtcurrenttarget = nil	-- The Name of the player the mob is currently targetting
me.mttargetswaptime = 0	-- The time when the mob last changed its target
me.unknowntarget = "#unknown" 
me.mastertargettarget = nil

-- lm2: aggro gain is now calculated just before redrawing the raid frame
--! This variable is referenced by these modules: guiraid, 
me.updateaggrogain = function()
	
	if mod.boss.mastertarget == nil then
		me.recalculateaggrogain()
	else
		me.updatetrueaggrotarget()
	end
	
end
	

me.updatetrueaggrotarget = function()
		
	-- 1) find a UnitID for the master target
	local mastertargetid = nil
	
	if UnitName("target") == me.mastertarget then
		mastertargetid = "target"
		
	else
		-- check everyone in the raid
		local x
		
		for x = 1, 40 do
			if UnitName("raid" .. x .. "target") == me.mastertarget then
				mastertargetid = "raid" .. x .. "target"
				break
			end
		end
	end
	
	-- 2) If noone can see the mob, give up.
	if mastertargetid == nil then
		
		me.mttruetarget = me.unknowntarget
		me.mtcurrenttarget = me.unknownuarget
		mod.table.raiddata[mod.string.get("misc", "aggrogain")] = nil
		
		return
	end
	
	-- 3) Get the boss' current target
	local targetnow = UnitName(mastertargetid .. "target")
	 
	-- 4) Reevaluate True, Current, Time
	
	-- a) Transitions from true=unknown	
	if (me.mttruetarget == nil) or (me.mttruetarget == me.unknowntarget) or (mod.table.raiddata[me.mttruetarget] == nil) then
		
		-- debug print
		if targetnow ~= me.mttruetarget then
			if targetnow == nil then
				if mod.out.checktrace("info", me, "target") then
					mod.out.printtrace("Target changed from bad to nil.")
				end
			else
				if mod.out.checktrace("info", me, "target") then
					mod.out.printtrace(string.format("Target changed from bad to %s.", targetnow))
				end
				
				if (me.isknockbackdiscoveryactive == true) and (targetnow == UnitName("player")) then
					mod.net.sendmessage("aggrogain " .. mod.table.getraidthreat())
				end
			end
		end
		
		me.mttruetarget = targetnow
		me.mtcurrenttarget = targetnow
	
	-- b) Transitions from true = known
	elseif targetnow ~= me.mtcurrenttarget then
	
		if me.mtcurrenttarget ~= nil then
			me.mttargetswaptime = GetTime()
		end
	
		me.mtcurrenttarget = targetnow
		
		if targetnow == nil then
			if mod.out.checktrace("info", me, "target") then
				mod.out.printtrace("CurrentTarget changed to nil.")
			end
		else
			if mod.out.checktrace("info", me, "target") then
				mod.out.printtrace(string.format("CurrentTarget changed from bad to %s.", targetnow))
			end
			
			if (me.isknockbackdiscoveryactive == true) and (targetnow == UnitName("player")) then
				mod.net.sendmessage("aggrogain " .. mod.table.getraidthreat())
			end
		end
	end
	
	-- 5) Check if CurrentTarget should become Truetarget
	if me.mttruetarget ~= me.mtcurrenttarget then
		-- to get here, true target is known.
		
		if me.mtcurrenttarget == nil then
			-- do nothing
			
		elseif mod.table.raiddata[me.mtcurrenttarget] == nil then
			-- switch to unknown if it's been more than 2 seconds
			
			if GetTime() > me.mttargetswaptime + 2 then
				me.mttruetarget = me.mtcurrenttarget
				
				if mod.out.checktrace("info", me, "target") then
					mod.out.printtrace(string.format("TrueTarget switches to the unknown %s after 2 seconds.", me.mttruetarget))
				end
			end
			
		else -- current target is a known user
			if GetTime() - me.mttargetswaptime > 2 then
				me.mttruetarget = me.mtcurrenttarget
				
				if mod.out.checktrace("info", me, "target") then
					mod.out.printtrace(string.format("TrueTarget switches to the known player %s after 2 seconds.", me.mttruetarget))
				end
				
			elseif mod.table.raiddata[me.mtcurrenttarget] > mod.data.threatconstants.meleeaggrogain * mod.table.raiddata[me.mttruetarget] then
				me.mttruetarget = me.mtcurrenttarget

				if mod.out.checktrace("info", me, "target") then
					mod.out.printtrace(string.format("TrueTarget switches to the known player %s due to high threat.", me.mttruetarget))
				end
			end
		end
	end
	
	-- update the AggroGain virtual player
	if ((me.mttruetarget ~= nil) and (me.truetarget ~= me.unknowntarget) and
		(mod.table.raiddata[me.mttruetarget] ~= nil)) then
		
		local aggro = mod.table.raiddata[me.mttruetarget];

		if (UnitName("player") ~= me.mttruetarget) then
			if CheckInteractDistance(mastertargetid, 1) then
				aggro = math.ceil(aggro * mod.data.threatconstants.meleeaggrogain)
			else
				aggro = math.ceil(aggro * mod.data.threatconstants.rangeaggrogain)
			end
		end
		
		mod.table.raiddata[mod.string.get("misc", "aggrogain")] = aggro;
	else
		mod.table.raiddata[mod.string.get("misc", "aggrogain")] = nil
	end
end

me.recalculateaggrogain = function()

	-- update aggro, and such
	local newaggrogain
	local targetname = ""
	local maxdepth = 5
	local i
	local targetacquired = false
	
	for i = 1, maxdepth do
		targetname = targetname .. "target"
		
		if UnitName(targetname) == nil then
			break
		
		elseif UnitIsFriend("player", targetname) == nil then
			targetacquired = true
			break
		end
	end
	
	if targetacquired == false then
		-- remove aggro gain
		newaggrogain = nil
		
	else
		local mobtarget = UnitName(targetname .. "target")
		if mobtarget == nil then
			mobtarget = "<nil>"
		end
		
		if mod.table.raiddata[mobtarget] then
			-- aggro target has a known threat value
			
			if UnitName("player") == mobtarget then
				newaggrogain = mod.table.raiddata[mobtarget]
			
			else
				-- now check our range to the mob
				if CheckInteractDistance(targetname, 1) then
					-- we're in melee range 
					newaggrogain = math.ceil(mod.table.raiddata[mobtarget] * mod.data.threatconstants.meleeaggrogain)
					
				else
					-- there's a small region where we might be in melee range. for now, assume not
					newaggrogain = math.ceil(mod.table.raiddata[mobtarget] * mod.data.threatconstants.rangeaggrogain)
				end
			end
		else
			newaggrogain = nil
		end
	end
	
	local currentaggrogain = mod.table.raiddata[mod.string.get("misc", "aggrogain")]
	if newaggrogain ~= currentaggrogain then
		mod.table.raiddata[mod.string.get("misc", "aggrogain")] = newaggrogain
	end

end