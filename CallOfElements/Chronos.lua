--[[
--
--	Chronos
--		Keeper of Time
--
--	By Alexander Brazie, Thott and AnduinLothar
--
--	Chronos manages time. You can schedule a function to be called
--	in X seconds, with or without an id. You can request a timer, 
--	which tracks the elapsed duration since the timer was started. 
--
--  To use as an embeddable addon:
--	- Put the Chronos folder inside your Interface/AddOns/<YourAddonName>/ folder.
--	- Add Chronos\ Chronos.xml to your toc or load it in your xml before your localization files.
--	- Add Chronos to the OptionalDeps in your toc
--	
--	To use as an addon library:
--	- Put the Chronos folder inside your Interface/AddOns/ folder.
--	- Add Chronos to the Dependencies in your toc
--
--	Please see below or see http://www.wowwiki.com/Chronos for details.
--
--	$LastChangedBy: zespri $
--	$Date: 2006-08-13 17:43:53 -0700 (Sun, 13 Aug 2006) $
--	$Rev: 3875 $
--	
--]]

local CHRONOS_REV = 2.01;

local isBetterInstanceLoaded = ( Chronos and Chronos.version and Chronos.version >= CHRONOS_REV );

if (not isBetterInstanceLoaded) then
	
	if (not Chronos) then
		Chronos = {};
	end
	
	Chronos.version = CHRONOS_REV;
	
	------------------------------------------------------------------------------
	--[[ Variables ]]--
	------------------------------------------------------------------------------
	
	Chronos.online = true;
	
	CHRONOS_DEBUG = false;
	CHRONOS_DEBUG_WARNINGS = false;

	-- Chronos Data
	if (not ChronosData) then
		ChronosData = {};
	end
		
	-- Initialize the Timers
	if (not ChronosData.timers) then
		ChronosData.timers = {};
	end
	
	-- Initialize the perform-over-time task list
	if (not ChronosData.tasks) then
		ChronosData.tasks = {};
	end
		
	-- Maximum items per frame
	Chronos.MAX_TASKS_PER_FRAME = 100;
		
	-- Maximum steps per task
	Chronos.MAX_STEPS_PER_TASK = 300;
	
	-- Maximum time delay per frame
	Chronos.MAX_TIME_PER_STEP = .3;
		
	Chronos.emptyTable = {};

	------------------------------------------------------------------------------
	--[[ User Functions ]]--
	------------------------------------------------------------------------------
	
	--[[
	-- debug(boolean)
	-- 
	-- Toggles debug mode
	]]--
	function Chronos.debug(enable)
		if (enable) then
			ChronosFrame:SetScript("OnUpdate", Chronos.OnUpdate_Debug);
			CHRONOS_DEBUG = true;
			CHRONOS_DEBUG_WARNINGS = true;
		else
			ChronosFrame:SetScript("OnUpdate", Chronos.OnUpdate_Quick);
			CHRONOS_DEBUG = false;
			CHRONOS_DEBUG_WARNINGS = false;
		end
	end
	
	--[[
	-- Scheduling functions
	-- Parts rewritten by AnduinLothar for efficiency
	-- Parts rewritten by Thott for speed
	-- Written by Alexander
	-- Original by Thott
	--
	-- Usage: Chronos.schedule(when,handler,arg1,arg2,etc)
	--
	-- After <when> seconds pass (values less than one and fractional values are
	-- fine), handler is called with the specified arguments, i.e.:
	--	 handler(arg1,arg2,etc)
	--
	-- If you'd like to have something done every X seconds, reschedule
	-- it each time in the handler or preferably use scheduleRepeating.
	--
	-- Also, please note that there is a limit to the number of
	-- scheduled tasks that can be performed per xml object at the
	-- same time. 
	--]]
	function Chronos.schedule(when,handler,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20)
		if ( not Chronos.online ) then 
			return;
		end
		if ( not handler) then
			Chronos.printError("ERROR: nil handler passed to Chronos.schedule()");
			return;
		end
				
		--local memstart = gcinfo();
		-- -- Assign an id
		-- local id = "";
		-- if ( not this ) then 
		-- 	id = "Keybinding";
		-- else
		-- 	id = this:GetName();
		-- end
		-- if ( not id ) then 
		-- 	id = "_DEFAULT";
		-- end
		-- if ( not when ) then 
		-- 	Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS", "Chronos Error Detection: ", id , " has sent no interval for this function. ", when );
		-- 	return;
		-- end

		-- -- Ensure we're not looping ChronosFrame
		-- if ( id == "ChronosFrame" and ChronosData.lastID ) then 
		-- 	id = ChronosData.lastID;
		-- end

		local task;
		-- reuse task memory if possible to avoid excessive garbage collection --Thott
		if(not ChronosData.sched[ChronosData.sched.n+1]) then
			ChronosData.sched[ChronosData.sched.n+1] = {};
		end
		ChronosData.sched.n = ChronosData.sched.n+1;
		local i = ChronosData.sched.n;
		-- ChronosData.sched[i].id = id;
		ChronosData.sched[i].time = when + GetTime();
		ChronosData.sched[i].handler = handler;
		ChronosData.sched[i].args = Chronos.getArgTable(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20);

		-- task list is a heap, add new --Thott
		while(i > 1) do
			parent = floor(i/2);
			if(ChronosData.sched[parent].time > ChronosData.sched[i].time) then
				Chronos.swap(i,parent);
			else
				break;
			end
			i = parent;
		end
		
		-- Debug print
		--Chronos.printDebugError("CHRONOS_DEBUG", "Scheduled ", handler," in ",when," seconds from ", id );
		--Chronos.printError("Memory change in schedule: ",memstart,"->",memend," = ",memend-memstart);
	end
	

	--[[
	--	Chronos.scheduleByName(name, delay, function, arg1, ... );
	--
	-- Same as Chronos.schedule, except it takes a schedule name argument.
	-- Only one event can be scheduled with a given name at any one time.
	-- Thus if one exists, and another one is scheduled, the first one
	-- is deleted, then the second one added.
	--
	--]]
	function Chronos.scheduleByName(name,when,handler,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20)
		if ( not name ) then 
			Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos Error Detection: No name specified to Chronos.scheduleByName");
			return;
		end
		if(ChronosData.byName[name] and handler) then
			Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos Error Detection: scheduleByName is reasigning '".. name.."'.");
			ChronosData.byName[name] = { time = when+GetTime(), handler = handler, arg = Chronos.getArgTable(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20); };
		else
			if ( not handler ) then
				if ( not ChronosData.byName[name] ) then
					Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos Error Detection: No handler specified to Chronos.scheduleByName, no previous entry found for scheduled entry '".. name.."'.");
					return;
				end
				if ( not ChronosData.byName[name].handler ) then
					Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos Error Detection: No handler specified to Chronos.scheduleByName, no handler could be found in previous entry of '".. name.."' either.");
					return;
				end
				handler = ChronosData.byName[name].handler;
				Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos: scheduleByName is updating '".. name.."' to time: ".. when);
			else
				Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos: scheduleByName is asigning '".. name.."'.");
			end
			ChronosData.byName[name] = { time = when+GetTime(), handler = handler, arg = Chronos.getArgTable(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20); };
		end
	end

	--[[
	--	unscheduleByName(name);
	--
	--		Removes an entry that was created with scheduleByName()
	--
	--	Args:
	--		name - the name used
	--
	--]]
	function Chronos.unscheduleByName(name)
		if ( not Chronos.online ) then 
			return;
		end
		if ( not name ) then 
			Chronos.printError("No name specified to Chronos.unscheduleByName");
			return;
		end
		if(ChronosData.byName[name]) then
			ChronosData.byName[name] = nil;
		end
		
		-- Debug print
		--Chronos.printDebugError("CHRONOS_DEBUG", "Cancelled scheduled timer of name ",name);
	end
	
	--[[
	--	unscheduleRepeating(name);
	--		Mirrors unscheduleByName for backwards compatibility
	--]]
	Chronos.unscheduleRepeating = Chronos.unscheduleByName;
	
	--[[
	--	isScheduledByName(name)
	--		Returns the amount of time left if it is indeed scheduled by name!
	--
	--	returns:
	--		number - time remaining
	--		nil - not scheduled
	--
	--]]
	function Chronos.isScheduledByName(name)
		if ( not Chronos.online ) then 
			return;
		end
		if ( not name ) then 
			Chronos.printError("No name specified to Chronos.isScheduledByName ", this:GetName());
			return;
		end
		if(ChronosData.byName[name]) then
			return ChronosData.byName[name].time - GetTime();
		end
		
		-- Debug print
		--Chronos.printDebugError("CHRONOS_DEBUG", "Did not find timer of name ",name);
		return nil;
	end
	
	--[[
	--	isScheduledRepeating(name)	
	--		Mirrors isScheduledByName for backwards compatibility
	--]]
	Chronos.isScheduledRepeating = Chronos.isScheduledByName;
	
	--[[
	--	Chronos.scheduleRepeating(name, delay, function);
	--
	-- Same as Chronos.scheduleByName, except it repeats without recalling and takes no arguments.
	--
	--]]
	function Chronos.scheduleRepeating(name,when,handler)
		if ( not name ) then 
			Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos Error Detection: No name specified to Chronos.scheduleRepeating");
			return;
		end
		if(ChronosData.byName[name] and handler) then
			Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos Error Detection: scheduleRepeating is reasigning ".. name);
			ChronosData.byName[name] = { time = when+GetTime(), period = when, handler = handler, repeating = true };
		else
			if ( not handler ) then
				if ( not ChronosData.byName[name] ) then
					Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos Error Detection: No handler specified to Chronos.scheduleRepeating, no previous entry found for scheduled entry '".. name.."'.");
					return;
				end
				if ( not ChronosData.byName[name].handler ) then
					Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos Error Detection: No handler specified to Chronos.scheduleRepeating, no handler could be found in previous entry '".. name.."' either.");
					return;
				end
				handler = ChronosData.byName[name].handler;
				Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos: scheduleRepeating is updating '".. name.."' to time: ".. when);
			else
				Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos: scheduleRepeating is asigning '".. name.."'.");
			end
			ChronosData.byName[name] = { time = when+GetTime(), period = when, handler = handler, repeating = true };
		end
	end
	
	--[[
	--	Chronos.flushByName(name, when);
	--
	-- Updates the ByName or Repeating event to flush at the time specified.  If no time is specified flush will be immediate. If it is a Repeating event the timer will be reset.
	--
	--]]
	function Chronos.flushByName(name,when)
		if ( not name ) then 
			Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos Error Detection: No name specified to Chronos.flushByName");
			return;
		elseif ( not ChronosData.byName[name] ) then
			Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos Error Detection: no previous entry found for Chronos.flushByName entry '".. name.."'.");
			return;
		end
		if (not when) then
			Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos: flushing '".. name.."'.");
			when = GetTime();
		else
			Chronos.printDebugError("CHRONOS_DEBUG_WARNINGS","Chronos: flushing '".. name.."' in "..when.." seconds.");
			when = when+GetTime();
		end
		ChronosData.byName[name].time = when;
	end

	--[[
	--	Chronos.startTimer([ID]);
	--		Starts a timer on a particular
	--
	--	Args
	--		ID - optional parameter to identify who is asking for a timer.
	--		
	--		If ID does not exist, this:GetName() is used. 
	--
	--	When you want to get the amount of time passed since startTimer(ID) is called, 
	--	call getTimer(ID) and it will return the number in seconds. 
	--
	--]]
	function Chronos.startTimer( id ) 
		if ( not Chronos.online ) then 
			return;
		end

		if ( not id ) then 
			id = this:GetName();
		end

		-- Create a table for this id's timers
		if ( not ChronosData.timers[id] ) then
			ChronosData.timers[id] = {};
			ChronosData.timers[id].n = 0;
		end

		-- Clear out an entry if the table is too big.
		if (ChronosData.timers[id].n > Chronos.MAX_TASKS_PER_FRAME) then
			Chronos.printError("Too many Chronos timers created for id " .. tostring(id));
			return;
		end

		-- Add a new timer entry 
		table.insert(ChronosData.timers[id],GetTime());
	end


	--[[
	--	endTimer([id]);
	-- 
	--		Ends the timer and returns the amount of time passed.
	--
	--	args:
	--		id - ID for the timer. If not specified, then ID will
	--		be this:GetName()
	--
	--	returns:
	--		(Number delta, Number start, Number end)
	--
	--		delta - the amount of time passed in seconds.
	--		start - the starting time 
	--		now - the time the endTimer was called.
	--]]

	function Chronos.endTimer( id ) 
		if ( not Chronos.online ) then 
			return;
		end

		if ( not id ) then 
			id = this:GetName();
		end

		if ( not ChronosData.timers[id] or ChronosData.timers[id].n == 0) then
			return nil;
		end
	
		local now = GetTime();

		-- Grab the last timer called
		local startTime = Chronos.pop(ChronosData.timers[id]);

		return (now - startTime), startTime, now;
	end


	--[[
	--	getTimer([id]);
	-- 
	--		Gets the timer and returns the amount of time passed.
	--		Does not terminate the timer.
	--
	--	args:
	--		id - ID for the timer. If not specified, then ID will
	--		be this:GetName()
	--
	--	returns:
	--		(Number delta, Number start, Number end)
	--
	--		delta - the amount of time passed in seconds.
	--		start - the starting time 
	--		now - the time the endTimer was called.
	--]]

	function Chronos.getTimer( id ) 
		if ( not Chronos.online ) then 
			return;
		end

		if ( not id ) then 
			id = this:GetName();
		end

		local now = GetTime();
		if ( not ChronosData.timers[id] or ChronosData.timers[id].n == 0) then
			return 0,0,now;
		end
	
		-- Grab the last timer called
		local startTime = ChronosData.timers[id][ChronosData.timers[id].n];

		return (now - startTime), startTime, now;
	end
	
	--[[
	--	isTimerActive([id])
	--		returns true if the timer exists. 
	--		
	--	args:
	--		id - ID for the timer. If not specified, then ID will
	--		be this:GetName()
	--
	--	returns:
	--		true - exists
	--		false - does not
	--]]
	function Chronos.isTimerActive( id ) 
		if ( not Chronos.online ) then 
			return;
		end

		if ( not id ) then 
			id = this:GetName();
		end

		-- Create a table for this id's timers
		if ( not ChronosData.timers[id] ) then
			return false;
		end

		return true;
	end

	--[[
	--	getTime()
	--
	--		returns the Chronos internal elapsed time.
	--
	--	returns:
	--		(elapsedTime)
	--		
	--		elapsedTime - time in seconds since Chronos initialized
	--]]	
	function Chronos.getTime() 
		return ChronosData.elapsedTime;
	end
	
	--[[
	--	Chronos.afterInit(func, ...)
	--		Performs func after the game has truely started.
	--	By Thott
	--]]
	function Chronos.afterInit(func, a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20)
		local id;
		if(this) then
			id = this:GetName();
		else
			id = "unknown";
		end
		--if(id == "SkyFrame") then
		--	Chronos.printError("Ignoring Sky init");
		--	return;
		--end
		if(ChronosData.initialized) then
			func(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20);
		else
			if(not ChronosData.afterInit) then
				ChronosData.afterInit = {};
				ChronosData.afterInit.n = 0;
				Chronos.schedule(0.2,Chronos.initCheck);
			end
			local n = ChronosData.afterInit.n+1;
			ChronosData.afterInit[n] = {};
			ChronosData.afterInit[n].func = func;
			ChronosData.afterInit[n].args = Chronos.getArgTable(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20);
			ChronosData.afterInit[n].id = id;
			ChronosData.afterInit.n = n;
		end
	end
	
	
	------------------------------------------------------------------------------
	--[[ Helpers Functions ]]--
	------------------------------------------------------------------------------
	
	function Chronos.getArgTable(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20)
		if (( a1 == nil ) and ( a2 == nil ) and ( a3 == nil ) and ( a4 == nil ) and ( a5 == nil ) and ( a6 == nil ) and ( a7 == nil ) and ( a8 == nil ) and ( a9 == nil ) and ( a10 == nil ) and ( a11 == nil ) and ( a12 == nil ) and ( a13 == nil ) and ( a14 == nil ) and ( a15 == nil ) and ( a16 == nil ) and ( a17 == nil ) and ( a18 == nil ) and ( a19 == nil ) and ( a20 == nil )) then
			return Chronos.emptyTable;
		else
			local args = {};
			table.setn(args, 0);
			table.insert(args, a1);
			table.insert(args, a2);
			table.insert(args, a3);
			table.insert(args, a4);
			table.insert(args, a5);
			table.insert(args, a6);
			table.insert(args, a7);
			table.insert(args, a8);
			table.insert(args, a9);
			table.insert(args, a10);
			table.insert(args, a11);
			table.insert(args, a12);
			table.insert(args, a13);
			table.insert(args, a14);
			table.insert(args, a15);
			table.insert(args, a16);
			table.insert(args, a17);
			table.insert(args, a18);
			table.insert(args, a19);
			table.insert(args, a20);
			return args;
		end
	end
	
	--
	-- pop ( table )
	--
	-- 	Removes a value and returns it from the table
	-- Arg:
	-- 	table - the table
	--
	--	duplicated from Sea
	function Chronos.pop(table1)
		if(not table1) then
			Chronos.printDebugError(nil, "Bad table passed to pop");
			return nil;
		end
		local n = table.getn(table1);
		if(not n) then
			Chronos.printDebugError(nil, "Bad table.getn() passed to pop");
			return nil;
		end
		if ( n == 0 ) then 
			return nil;
		end

		local v = table1[n];
		table.setn(table1, n-1)
		--Doesn't nil the entry like table.remove, so it's never garbage collected and can be replaced
		--v = table.remove(table1);
		return v;		
	end
	
	function Chronos.popTask()
		if(ChronosData.sched.n == 1) then
			ChronosData.sched.n = 0;
			return 1;
		end
		Chronos.swap(1,ChronosData.sched.n);
		ChronosData.sched.n = ChronosData.sched.n - 1;
		local i = 1;
		local new;
		while(ChronosData.sched[i] and i <= ChronosData.sched.n) do
			new = i*2;
			if(new > ChronosData.sched.n) then
				break;
			elseif(new < ChronosData.sched.n) then
				if(ChronosData.sched[new+1].time < ChronosData.sched[new].time) then
					new = new + 1;
				end
			end
			if(ChronosData.sched[new].time < ChronosData.sched[i].time) then
				Chronos.swap(i,new);
				i = new;
			else
				break;
			end
		end
		return ChronosData.sched.n+1;
	end
	
	function Chronos.run(func,arg)
		if(func) then
			if(arg) then
				return func(unpack(arg));
			else
				return func();
			end
		end
	end

	function Chronos.swap(i,j)
		local t = ChronosData.sched[i];
		ChronosData.sched[i] = ChronosData.sched[j];
		ChronosData.sched[j] = t;
	end
	
	function Chronos.printError(text)
		ChatFrame1:AddMessage(text, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, 1.0, UIERRORS_HOLD_TIME);
	end
	
	function Chronos.printDebugError(var, text)
		if (var) and (getglobal(var)) then
			Chronos.printError(text);
		end
	end
	
	------------------------------------------------------------------------------
	--[[ Frame Script Helpers ]]--
	------------------------------------------------------------------------------
	
	function Chronos.chatColorsInit()
		ChronosData.chatColorsInitialized = true;
		ChronosFrame:UnregisterEvent("UPDATE_CHAT_COLOR");
	end
	
	function Chronos.initCheck()
		if(not ChronosData.initialized) then
			if(UnitName("player") and UnitName("player")~=UKNOWNBEING and UnitName("player")~=UNKNOWNBEING and UnitName("player")~=UNKNOWNOBJECT and ChronosData.variablesLoaded and ChronosData.enteredWorld and ChronosData.chatColorsInitialized) then
				ChronosData.initialized = true;
				Chronos.schedule(1,Chronos.initCheck); 
				return;
			else
				Chronos.schedule(0.2,Chronos.initCheck); 
				return;
			end
		end
		if(ChronosData.afterInit) then
			local i = ChronosData.afterInit_i;
			if(not i) then
				i = 1;
			end
			ChronosData.afterInit_i = i+1;
			--Chronos.printError("afterInit: processing ",i," of ",ChronosData.afterInit.n," initialization functions, id: ",ChronosData.afterInit[i].id);
			Chronos.run(ChronosData.afterInit[i].func,ChronosData.afterInit[i].args);
			if(i == ChronosData.afterInit.n) then
				ChronosData.afterInit = nil;
				ChronosData.afterInit_i = nil;
			else
				Chronos.schedule(0.1,Chronos.initCheck);
				return;
			end
		end
	end
	
	--[[
	--	Sends a chat command through the standard editbox
	--]]
	function Chronos.SendChatCommand(command)
		local text = ChatFrameEditBox:GetText();
		ChatFrameEditBox:SetText(command);
		ChatEdit_SendText(ChatFrameEditBox);
		ChatFrameEditBox:SetText(text);
	end
	
	function Chronos.RegisterSlashCommands()
		--Needs to be able Variables load if you want to use Sky
		local chronosFunc = function(msg)
			local _,_,seconds,command = string.find(msg,"([%d\.]+)%s+(.*)");
			if(seconds and command) then
				Chronos.schedule(seconds,Chronos.SendChatCommand,command);
			else
				Chronos.printError(SCHEDULE_USAGE1);
				Chronos.printError(SCHEDULE_USAGE2);
			end
		end
		if(Satellite) then
			Satellite.registerSlashCommand(
				{
					id = "Schedule";
					commands = SCHEDULE_COMM;
					onExecute = chronosFunc;
					helpText = SCHEDULE_DESC;
					replace = true;
				}
			);
		else
			SlashCmdList["CHRONOS_SCHEDULE"] = chronosFunc;
			for i = 1, table.getn(SCHEDULE_COMM) do setglobal("SLASH_CHRONOS_SCHEDULE"..i, SCHEDULE_COMM[i]); end
		end
	end
	
	------------------------------------------------------------------------------
	--[[ Frame Scripts ]]--
	------------------------------------------------------------------------------
	
	function Chronos.OnLoad()
		Chronos.framecount = 0;
		
		if (not ChronosData.byName) then
			ChronosData.byName = {};
		end
		if (not ChronosData.repeating) then
			ChronosData.repeating = {};
		end
		if (not ChronosData.sched) then
			ChronosData.sched = {};
			ChronosData.sched.n = 0;
		end
		ChronosData.elapsedTime = 0;
		
		Chronos.afterInit(Chronos.RegisterSlashCommands);
	end
	
	function Chronos.OnEvent()
		if(event == "VARIABLES_LOADED") then
			ChronosData.variablesLoaded = true;
			ChronosFrame:Show();
		elseif (event == "PLAYER_ENTERING_WORLD") then
			ChronosData.enteredWorld = true;
			Chronos.online = true;
		elseif (event == "PLAYER_LEAVING_WORLD") then
			Chronos.online = false;
		elseif ( event == "UPDATE_CHAT_COLOR" ) then
			Chronos.scheduleByName("ChronosAfterChatColorInit", 1, Chronos.chatColorsInit);
		end	
	end
	
	function Chronos.OnUpdate_Quick()
		if ( not Chronos.online ) then 
			return;
		end
		if ( not ChronosData.variablesLoaded ) then 
			return;
		end
		
		if ( ChronosData.elapsedTime ) then
			ChronosData.elapsedTime = ChronosData.elapsedTime + arg1;
		else
			ChronosData.elapsedTime = arg1;
		end
		
		-- Execute scheduled tasks that are ready, popping them off the heap.
		local now = GetTime();
		local i;
		while(ChronosData.sched.n > 0) do
			if(ChronosData.sched[1].time <= now) then
				i = Chronos.popTask();
				Chronos.run(ChronosData.sched[i].handler,ChronosData.sched[i].args);
			else
				break;
			end
		end
		
		-- Execute named scheduled tasks that are ready.
		local k,v = next(ChronosData.byName);
		local newK, newV;
		while (k ~= nil) do
			newK,newV = next(ChronosData.byName, k);
			if(v.time <= now) then
				if (v.repeating) then
					ChronosData.byName[k].time = now + v.period;
					v.handler();
				else
					local y = v;
					ChronosData.byName[k] = nil;
					Chronos.run(y.handler,y.arg);
				end
			end
			k,v = newK,newV;
		end
	end
	
	function Chronos.OnUpdate_Debug()
		if ( not Chronos.online ) then 
			return;
		end
		if ( not ChronosData.variablesLoaded ) then 
			return;
		end
		local memstart = gcinfo();
		
		if ( ChronosData.elapsedTime ) then
			ChronosData.elapsedTime = ChronosData.elapsedTime + arg1;
		else
			ChronosData.elapsedTime = arg1;
		end
	
		local now = GetTime();
		local i;
		-- Execute scheduled tasks that are ready, popping them off the heap.
		while(ChronosData.sched.n > 0) do
			if(ChronosData.sched[1].time <= now) then
				i = Chronos.popTask();
				Chronos.run(ChronosData.sched[i].handler,ChronosData.sched[i].args);
			else
				break;
			end
		end
		
		local memend = gcinfo();
		if(memend - memstart > 0) then
			Chronos.printError("gcmemleak from ChronosData.sched in OnUpdate: ",memend - memstart);
		end
		
		-- Execute named scheduled tasks that are ready.
		memstart = memend;
		local k,v = next(ChronosData.byName);
		local newK, newV;
		while (k ~= nil) do
			newK,newV = next(ChronosData.byName, k);
			if(v.time <= now) then
				local m = gcinfo();
				if (v.repeating) then
					ChronosData.byName[k].time = now + v.period;
					v.handler();
				else
					local y = v;
					ChronosData.byName[k] = nil;
					Chronos.run(y.handler,y.arg);
				end
				local mm = gcinfo();
				memstart = memstart + mm - m;
			end
			k,v = newK,newV;
		end
		
		memend = gcinfo();
		if(memend - memstart > 0) then
			Chronos.printError("gcmemleak from ChronosData.byName in OnUpdate: ",memend - memstart);
		end
	end
	
	------------------------------------------------------------------------------
	--[[ Frame Script Assignment ]]--
	------------------------------------------------------------------------------
	
	--Event Driver
	if (not ChronosFrame) then
		CreateFrame("Frame", "ChronosFrame");
	end
	ChronosFrame:Hide();
	--Event Registration
	ChronosFrame:RegisterEvent("VARIABLES_LOADED");
	ChronosFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
	ChronosFrame:RegisterEvent("PLAYER_LEAVING_WORLD");
	ChronosFrame:RegisterEvent("UPDATE_CHAT_COLOR");
	--Frame Scripts
	ChronosFrame:SetScript("OnEvent", Chronos.OnEvent);
	ChronosFrame:SetScript("OnUpdate", Chronos.OnUpdate_Quick);
	--OnLoad Call
	Chronos.OnLoad();
	
end

