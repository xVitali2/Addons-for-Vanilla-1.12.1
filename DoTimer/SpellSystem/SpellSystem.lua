local Old_CSBN,Old_CS,Old_UA,Old_CPA,Old_STU,Old_TU,Old_SST,Old_UII,Old_UCI
local elapsed,loaded,watchedspell,spelltargeted,spellnotarget,needtarget
local resistmsg = string.gsub(SPELLRESISTSELFOTHER,"%%.-s","(.+)") 
local evademsg = string.gsub(SPELLEVADEDSELFOTHER,"%%.-s","(.+)") 
local immunemsg = string.gsub(SPELLIMMUNESELFOTHER,"%%.-s","(.+)") 
local reflectmsg = string.gsub(SPELLREFLECTSELFOTHER,"%%.-s","(.+)") 
local spellhitmsg = string.gsub(string.gsub(SPELLLOGSCHOOLSELFOTHER,"%%.-d","%%d+"),"%%.-s","(.+)") 
local spellcritmsg = string.gsub(string.gsub(SPELLLOGCRITSCHOOLSELFOTHER,"%%d","%%d+"),"%%.-s","(.+)") 
local failedmsg = string.gsub(SPELLFAILCASTSELF,"%%.-s","(.+)") 

SpellSystem_IncomingSpell = {}
SpellSystem_SentSpell = {}

local SpellSystem_Listeners = {
	["SPELLSYSTEM_TIMEOUT"] = {},
	["SPELLSYSTEM_NEEDTARGET"] = {},
	["SPELLSYSTEM_BEGIN"] = {},
	["SPELLSYSTEM_FAILBEFORE"] = {},
	["SPELLSYSTEM_FAILAFTER"] = {},
	["SPELLSYSTEM_SUCCESS"] = {},
	["SPELLSYSTEM_NOTARGET"] = {},
	["SPELLSYSTEM_STOP"] = {},
}

function SpellSystem_OnLoad()
	this:RegisterEvent("SPELLCAST_STOP")
	this:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE")
	this:RegisterEvent("SPELLCAST_DELAYED")
	this:RegisterEvent("CHAT_MSG_SPELL_FAILED_LOCALPLAYER")
	this:RegisterEvent("SPELLCAST_START")
	local oldfunc = WorldFrame:GetScript("OnMouseDown")
	if not oldfunc then oldfunc = function() end end
	WorldFrame:SetScript("OnMouseDown",function() oldfunc(); SpellSystem_OnWorldClick(); end)
end

function SpellSystem_AddText(msg) 
	if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage(msg) end
end

function SpellSystem_Commands(msg)
end

function SpellSystem_OnEvent(event)
	if event == "SPELLCAST_DELAYED" and watchedspell then 
		for i = table.getn(SpellSystem_IncomingSpell),1,-1 do 
			if SpellSystem_IncomingSpell[i].casttime > 0 then
				SpellSystem_IncomingSpell[i].casttime = SpellSystem_IncomingSpell[i].casttime + (arg1 / 1000)
				break
			end
		end
	elseif event == "CHAT_MSG_SPELL_FAILED_LOCALPLAYER" then 
		local frame = CreateFrame("Frame")
		frame.arg = arg1
		frame:SetScript("OnUpdate",function()
			if not this.time then this.time = GetTime() end
			if (GetTime() >= this.time + .5) or (watchedspell) then
				if watchedspell then
					local spell = SpellSystem_ParseString(this.arg,failedmsg)
					local lastvalue,lasti,lastcast
					for i = table.getn(SpellSystem_IncomingSpell),1,-1 do 
						if SpellSystem_IncomingSpell[i].realname == spell and SpellSystem_IncomingSpell[i].timestart > (lastcast or 0) then
							lastvalue = SpellSystem_IncomingSpell
							lasti = i
							lastcast = SpellSystem_IncomingSpell[i].timestart
						end
					end
					for i = table.getn(SpellSystem_SentSpell),1,-1 do
						if SpellSystem_SentSpell[i].realname == spell and SpellSystem_SentSpell[i].timestart > (lastcast or 0) then
							lastvalue = SpellSystem_SentSpell
							lasti = i
							lastcast = SpellSystem_SentSpell[i].timestart
						end
					end
					if lastvalue then 
						SpellSystem_Message("failedbefore",lastvalue[lasti])
						table.remove(lastvalue,lasti) 
						if (table.getn(SpellSystem_IncomingSpell) > 0 or table.getn(SpellSystem_SentSpell) > 0) then watchedspell = 1 else watchedspell = nil end
					end
				end
				this:SetScript("OnUpdate",nil)
			end
		end)
	elseif event == "SPELLCAST_STOP" then
		if watchedspell then
			for i = table.getn(SpellSystem_IncomingSpell),1,-1 do
				if (GetTime() >= SpellSystem_IncomingSpell[i].timestart + SpellSystem_IncomingSpell[i].casttime - .5) then
					SpellSystem_Message("stop",SpellSystem_IncomingSpell[i])
					local SpellSystem_SentSpellentry = {} 
					for index,value in pairs(SpellSystem_IncomingSpell[i]) do SpellSystem_SentSpellentry[index] = value end
					SpellSystem_SentSpellentry.casttime = .5
					SpellSystem_SentSpellentry.timestart = GetTime()
					table.remove(SpellSystem_IncomingSpell,i)
					table.insert(SpellSystem_SentSpell,SpellSystem_SentSpellentry)
					if table.getn(SpellSystem_SentSpell) == 1 then SpellSystemDelayFrame:SetScript("OnUpdate",function() SpellSystem_DelayTimer() end) end
					return
				end
			end
		end
		if needtarget and not SpellIsTargeting() then
			SpellSystem_InitiateSpellCast(spellnotarget.spell,spellnotarget.rank,{name = "Unknown", unit = "Unknown", sex = "Unknown", level = "Unknown", type = "Unknown"},spellnotarget.texture,spellnotarget.info)
			SpellSystem_OnEvent("SPELLCAST_STOP")
			needtarget = nil
		end
	elseif event == "SPELLCAST_START" then
		if table.getn(SpellSystem_IncomingSpell) > 0 then
			SpellSystem_IncomingSpell[table.getn(SpellSystem_IncomingSpell)].realname = arg1
			SpellSystem_IncomingSpell[table.getn(SpellSystem_IncomingSpell)].casttime = arg2 / 1000
		end
		if needtarget and not SpellIsTargeting() then
			SpellSystem_InitiateSpellCast(spellnotarget.spell,spellnotarget.rank,{name = "Unknown", unit = "Unknown", sex = "Unknown", level = "Unknown", type = "Unknown"},spellnotarget.texture,spellnotarget.info)
			needtarget = nil
		end
	elseif event == "CHAT_MSG_SPELL_SELF_DAMAGE" and watchedspell then 
		local spellname,target 
		spellname,target = SpellSystem_ParseString(arg1,resistmsg)
		if not (spellname and target) then
			spellname,target = SpellSystem_ParseString(arg1,evademsg)
		end
		if not (spellname and target) then
			spellname,target = SpellSystem_ParseString(arg1,immunemsg)
		end
		if not (spellname and target) then
			spellname,target = SpellSystem_ParseString(arg1,reflectmsg)
		end
		if spellname and target then
			for i = table.getn(SpellSystem_SentSpell),1,-1 do 
				if SpellSystem_SentSpell[i].realname == spellname and SpellSystem_SentSpell[i].target.name == target then
					SpellSystem_Message("failedafter",SpellSystem_SentSpell[i])
					table.remove(SpellSystem_SentSpell,i) 
					if table.getn(SpellSystem_SentSpell) == 0 then SpellSystemDelayFrame:SetScript("OnUpdate",nil) end
					if (table.getn(SpellSystem_IncomingSpell) > 0 or table.getn(SpellSystem_SentSpell) > 0) then watchedspell = 1 else watchedspell = nil end
					break
				end
			end
		end		
	end
end

function SpellSystem_ParseString(text,...) 
	local entries = {}
	local start = 1
	local savetext = text
	for i = 1,arg.n,2 do
    	local search = arg[i]
		local newsearch,starter,ender = search,"",""
		if string.sub(search,1,1) == "^" then
			newsearch = string.sub(newsearch,2)
			starter = "^"
		end
		if string.sub(search,string.len(search)) == "$" then
			newsearch = string.sub(newsearch,1,string.len(newsearch)-1)
			ender = "$"
		end
        local numfound = 0
		if not string.find(search,"%(") then
		    if string.find(text,search) then
				numfound = 1
				table.insert(entries,true)
			end
		else
			while string.find(text,search) do				
				numfound = numfound + 1
				local found = {string.find(text,string.format("%s(%s)%s",starter,newsearch,ender))}
				local oldtext = text
				text = string.gsub(text,string.gsub(found[3],"(%p)","%%%1"),"",1)
				for id = 4,table.getn(found) do table.insert(entries,found[id]) end
				if text == oldtext then
					
					break
				end
			end
			if arg[i + 1] and numfound > 0 then
			    local numcaps = (table.getn(entries) - start + 1) / numfound
			    local numstart
				if arg[i + 1] < 0 then numstart = start elseif arg[i + 1] > 0 then numstart = start + (numcaps * arg[i + 1]) end
     			for id = 1,((numfound - math.abs(arg[i + 1])) * numcaps) do table.remove(entries,numstart) end
			end
		end
		if numfound == 0 then table.insert(entries,false) end
		start = table.getn(entries) + 1
		text = savetext
	end
	for index,value in ipairs(entries) do
		if type(tonumber(value)) == "number" then entries[index] = tonumber(value) end
	end
	return unpack(entries)
end

Old_CSBN = CastSpellByName
function SpellSystem_CSBN(cspell,onself) 
	spelltargeted = nil
	Old_CSBN(cspell,onself)
	local spellname,spellrank
	spellrank = SpellSystem_ParseString(cspell,"%((.-)%)",-1)
	if spellrank then
		spellname = string.gsub(cspell,"%("..spellrank.."%)$","")
	else
		spellname = cspell
		spellrank = ""
	end
	local spelltype = SpellSystem_ReturnSpellType(spellname)
	if spelltype then
		if spellrank == "" then spellrank = SpellSystem_ReturnRank(spellname) end
		local texture,id = SpellSystem_ReturnSpellTexture(spellname,spellrank)
		local info = {
			type = "spell",
			id = id,
		}
		if SpellIsTargeting() then --it was a beneficial spell, so no target just yet			
			spellnotarget = {spell = spellname, rank = spellrank, texture = texture, info = info}
			needtarget = 1
			SpellSystem_Message("needtarget",spellnotarget)
		else -- a target has already been given to the spell
			local unit
			if UnitExists("target") then unit = "target" end
			if spelltargeted then 
				if (spelltargeted == "stopped") then unit = nil else unit = spelltargeted end
			end
			if onself then unit = "player" end
			local targetinfo = {
				name = (unit and (UnitName(unit) or "Unknown") or "Unknown"),
				unit = unit or "Unknown",
				sex = (unit and (UnitSex(unit) or "Unknown") or "Unknown"), 
				level = (unit and (UnitLevel(unit) or "Unknown") or "Unknown"),
				type = (unit and SpellSystem_ReturnTargetType(unit) or "Unknown"),
			}
			SpellSystem_InitiateSpellCast(spellname,spellrank,targetinfo,texture,info)
		end					
	end
end
CastSpellByName = SpellSystem_CSBN

Old_CS = CastSpell
function SpellSystem_CS(cspell,booktype) 
	spelltargeted = nil
	Old_CS(cspell,booktype)
	local spellname,spellrank = GetSpellName(cspell,booktype)
	local spelltype
	if not (booktype == BOOKTYPE_PET) then spelltype = true end
	if spelltype then
		if spellrank == "" then spellrank = SpellSystem_ReturnRank(spellname) end
		local texture,id = SpellSystem_ReturnSpellTexture(spellname,spellrank)
		local info = {
			type = "spell",
			id = id,
		}
		if SpellIsTargeting() then --it was a beneficial spell, so no target just yet			
			spellnotarget = {spell = spellname, rank = spellrank, texture = texture, info = info}
			needtarget = 1
			SpellSystem_Message("needtarget",spellnotarget)
		else -- a target has already been given to the spell
			local unit
			if UnitExists("target") then unit = "target" end
			if spelltargeted then 
				if (spelltargeted == "stopped") then unit = nil else unit = spelltargeted end
			end
			local targetinfo = {
				name = (unit and (UnitName(unit) or "Unknown") or "Unknown"),
				unit = unit or "Unknown",
				sex = (unit and (UnitSex(unit) or "Unknown") or "Unknown"), 
				level = (unit and (UnitLevel(unit) or "Unknown") or "Unknown"),
				type = (unit and SpellSystem_ReturnTargetType(unit) or "Unknown"),
			}
			SpellSystem_InitiateSpellCast(spellname,spellrank,targetinfo,texture,info)
		end					
	end
end
CastSpell = SpellSystem_CS

Old_UA = UseAction
function SpellSystem_UA(cspell,cursor,onself) 
	Old_UA(cspell,cursor,onself)
	if not GetActionText(cspell) then
		spelltargeted = nil
		local spellname,spellrank,texture,info
		if GetActionCount(cspell) > 0 then
			spellname,spellrank = SpellSystem_SetAction(cspell)
			texture = GetActionTexture(cspell)
			info = {
				type = "item",
				id = SpellSystem_GetItemID(spellname),
			}
		else
			spellname,spellrank = SpellSystem_SetAction(cspell)
			texture,id = SpellSystem_ReturnSpellTexture(spellname,spellrank)
			info = {
				type = "spell",
				id = id,
			}
		end
		if SpellIsTargeting() then --it was a beneficial spell, so no target just yet			
			spellnotarget = {spell = spellname, rank = spellrank, texture = texture, info = info}
			needtarget = 1
			SpellSystemNeedTargetFrame:SetScript("OnUpdate",function() SpellSystem_WatchTargetingState() end)
			SpellSystem_Message("needtarget",spellnotarget)
		else -- a target has already been given to the spell
			local unit
			if UnitExists("target") then unit = "target" end
			if spelltargeted then 
				if (spelltargeted == "stopped") then unit = nil else unit = spelltargeted end
			end
			if onself then unit = "player" end
			local targetinfo = {
				name = (unit and (UnitName(unit) or "Unknown") or "Unknown"),
				unit = unit or "Unknown",
				sex = (unit and (UnitSex(unit) or "Unknown") or "Unknown"), 
				level = (unit and (UnitLevel(unit) or "Unknown") or "Unknown"),
				type = (unit and SpellSystem_ReturnTargetType(unit) or "Unknown"),
			}
			SpellSystem_InitiateSpellCast(spellname,spellrank,targetinfo,texture,info)
		end
	end
end
UseAction = SpellSystem_UA

Old_UCI = UseContainerItem
function SpellSystem_UCI(bagid,slotid,onself)
	local texture = GetContainerItemInfo(bagid,slotid)
	local info = {
		type = "item",
		id = SpellSystem_ParseString(GetContainerItemLink(bagid,slotid) or "","(%d+)",1),
	}
	Old_UCI(bagid,slotid,onself)
	spelltargeted = nil
	local spellname,spellrank = SpellSystem_SetBagItem(bagid,slotid),""
	if SpellIsTargeting() then --it was a beneficial spell, so no target just yet			
		spellnotarget = {spell = spellname, rank = spellrank, texture = texture, info = info}
		needtarget = 1
		SpellSystemNeedTargetFrame:SetScript("OnUpdate",function() SpellSystem_WatchTargetingState() end)
		SpellSystem_Message("needtarget",spellnotarget)
	else -- a target has already been given to the spell
		local unit
		if UnitExists("target") then unit = "target" end
		if onself then unit = "player" end
		if spelltargeted then 
			if (spelltargeted == "stopped") then unit = nil else unit = spelltargeted end
		end
		local targetinfo = {
			name = (unit and (UnitName(unit) or "Unknown") or "Unknown"),
			unit = unit or "Unknown",
			sex = (unit and (UnitSex(unit) or "Unknown") or "Unknown"), 
			level = (unit and (UnitLevel(unit) or "Unknown") or "Unknown"),
			type = (unit and SpellSystem_ReturnTargetType(unit) or "Unknown"),
		}
		SpellSystem_InitiateSpellCast(spellname,spellrank,targetinfo,texture,info)
	end
end
UseContainerItem = SpellSystem_UCI

Old_UII = UseInventoryItem
function SpellSystem_UII(invid)
	Old_UII(invid)
	spelltargeted = nil
	local spellname,spellrank = SpellSystem_SetInventoryItem(invid),""
	local texture = GetInventoryItemTexture("player",invid)
	local info = {
		type = "item",
		id = SpellSystem_ParseString(GetInventoryItemLink("player",invid) or "","(%d+)",1),
	}
	if SpellIsTargeting() then --it was a beneficial spell, so no target just yet			
		spellnotarget = {spell = spellname, rank = spellrank, texture = texture, info = info}
		needtarget = 1
		SpellSystemNeedTargetFrame:SetScript("OnUpdate",function() SpellSystem_WatchTargetingState() end)
		SpellSystem_Message("needtarget",spellnotarget)
	else -- a target has already been given to the spell
		local unit
		if UnitExists("target") then unit = "target" end
		if spelltargeted then 
			if (spelltargeted == "stopped") then unit = nil else unit = spelltargeted end
		end
		local targetinfo = {
			name = (unit and (UnitName(unit) or "Unknown") or "Unknown"),
			unit = unit or "Unknown",
			sex = (unit and (UnitSex(unit) or "Unknown") or "Unknown"), 
			level = (unit and (UnitLevel(unit) or "Unknown") or "Unknown"),
			type = (unit and SpellSystem_ReturnTargetType(unit) or "Unknown"),
		}
		SpellSystem_InitiateSpellCast(spellname,spellrank,targetinfo,texture,info)
	end
end
UseInventoryItem = SpellSystem_UII

function SpellSystem_OnWorldClick() 
	if needtarget and (SpellCanTargetUnit("mouseover") or (not SpellIsTargeting())) then
		SpellSystem_InitiateSpellCast(spellnotarget.spell,spellnotarget.rank,{name = UnitName("mouseover") or "Unknown", unit = "mouseover", sex = UnitSex("mouseover") or "Unknown", level = UnitLevel("mouseover") or "Unknown", type = SpellSystem_ReturnTargetType("mouseover")},spellnotarget.texture,spellnotarget.info)
		needtarget = nil
	end
end

Old_TU = TargetUnit
function SpellSystem_TU(unit)
	spelltargeted = unit
	if needtarget and SpellCanTargetUnit(unit) then
		SpellSystem_InitiateSpellCast(spellnotarget.spell,spellnotarget.rank,{name = UnitName(unit), unit = unit, sex = UnitSex(unit), level = UnitLevel(unit), type = SpellSystem_ReturnTargetType("mouseover")},spellnotarget.texture,spellnotarget.info)
		needtarget = nil
	end
	Old_TU(unit)
end
TargetUnit = SpellSystem_TU

Old_STU = SpellTargetUnit
function SpellSystem_STU(unit) 
	spelltargeted = unit
	if needtarget and SpellCanTargetUnit(unit) then
		SpellSystem_InitiateSpellCast(spellnotarget.spell,spellnotarget.rank,{name = UnitName(unit), unit = unit, sex = UnitSex(unit), level = UnitLevel(unit), type = SpellSystem_ReturnTargetType("mouseover")},spellnotarget.texture,spellnotarget.info)
		needtarget = nil
	end
	Old_STU(unit)
end
SpellTargetUnit = SpellSystem_STU

Old_SST = SpellStopTargeting
function SpellSystem_SST() 
	spelltargeted = "stopped"
	if needtarget then 
		SpellSystem_Message("notarget",spellnotarget)
		needtarget = nil 
	end
	Old_SST()
end
SpellStopTargeting = SpellSystem_SST

function SpellSystem_InitiateSpellCast(spell,rank,target,texture,info) 
	watchedspell = 1
	if target.unit == "Unknown" then
		target.name = UnitName("player")
		target.unit = "player"
		target.sex = UnitSex("player")
		target.level = UnitLevel("player")
		target.type = "player"
	end
	local SpellSystem_IncomingSpellentry = {
		spell = spell, rank = rank, target = target, timestart = GetTime(), casttime = 0, realname = spell, texture = texture, info = info
	}
	SpellSystem_Message("begin",SpellSystem_IncomingSpellentry)
	table.insert(SpellSystem_IncomingSpell,SpellSystem_IncomingSpellentry)
	if table.getn(SpellSystem_IncomingSpell) == 1 then SpellSystemPreTimerFrame:SetScript("OnUpdate",function() SpellSystem_CheckPreTimers() end) end
end

function SpellSystem_ReturnSpellType(spellname) 
	local spelltype
	local i = 1
	while GetSpellName(i,BOOKTYPE_SPELL) do
		local spell = GetSpellName(i,BOOKTYPE_SPELL)
		if spell == spellname then 
			spelltype = true
			break 
		end
		i = i + 1
	end
	return spelltype
end

function SpellSystem_SetAction(id) 
	SpellSystemScanningFrame:ClearLines()
	SpellSystemScanningFrameTextRight1:SetText("")
	SpellSystemScanningFrame:SetAction(id)
	local spellname = SpellSystemScanningFrameTextLeft1:GetText()
	local spellrank = (SpellSystemScanningFrameTextRight1:GetText() or "")
	return spellname,spellrank
end

function SpellSystem_SetBagItem(bagid,slotid) 
	SpellSystemScanningFrame:ClearLines()
	SpellSystemScanningFrame:SetBagItem(bagid,slotid)
	local spellname = SpellSystemScanningFrameTextLeft1:GetText()
	return spellname
end

function SpellSystem_SetInventoryItem(id) 
	SpellSystemScanningFrame:ClearLines()
	SpellSystemScanningFrame:SetInventoryItem("player",id)
	local spellname = SpellSystemScanningFrameTextLeft1:GetText()
	return spellname
end

function SpellSystem_GetItemID(item)
	for i = 0,4 do
		for id = 1,GetContainerNumSlots(i) do
			local itemlink = GetContainerItemLink(i,id) or ""
			if string.find(itemlink,item) then 
				local itemid = SpellSystem_ParseString(itemlink,"(%d+)",1)
				return itemid
			end
		end
	end
	for i = 1,18 do
		local itemlink = GetInventoryItemLink("player",i) or ""
		if string.find(itemlink,item) then
			local itemid = SpellSystem_ParseString(itemlink,"(%d+)",1)
			return itemid
		end
	end
	return "Unknown"
end

function SpellSystem_ReturnRank(spell) 
	local highrank = ""
	local i = 1
	while GetSpellName(i,BOOKTYPE_SPELL) do
		local spellname,spellrank = GetSpellName(i,BOOKTYPE_SPELL)
		if spellname == spell then highrank = spellrank end
		i = i + 1
	end
	return highrank
end

function SpellSystem_ReturnSpellTexture(spell,rank)
	local i = 1
	while GetSpellName(i,BOOKTYPE_SPELL) do
		local spellname,spellrank = GetSpellName(i,BOOKTYPE_SPELL)
		if spellname == spell and (spellrank == rank or rank == "") then
			return GetSpellTexture(i,BOOKTYPE_SPELL),i
		end
		i = i + 1
	end
end

function SpellSystem_ReturnTargetType(unit) --returns if that unit is a player or mob
	if not unit then unit = "target" end
	local name = UnitName(unit) 
	if (UnitIsPlayer(unit) or UnitPlayerControlled(unit)) then return "player" end
	local type = UnitClassification(unit)
	if type == "worldboss" or type == "rare" or type == "rareelite" then return "specialmob" end
	return "mob"
end

function SpellSystem_DelayTimer() 
	local time = GetTime()
	for i = table.getn(SpellSystem_SentSpell),1,-1 do
		if time >= SpellSystem_SentSpell[i].timestart + SpellSystem_SentSpell[i].casttime then
			SpellSystem_Message("success",SpellSystem_SentSpell[i])
			table.remove(SpellSystem_SentSpell,i)
			if table.getn(SpellSystem_SentSpell) == 0 then SpellSystemDelayFrame:SetScript("OnUpdate",nil) end
			if (table.getn(SpellSystem_IncomingSpell) > 0 or table.getn(SpellSystem_SentSpell) > 0) then watchedspell = 1 else watchedspell = nil end
		end
	end
end

function SpellSystem_CheckPreTimers()
	for i = table.getn(SpellSystem_IncomingSpell),1,-1 do
		if GetTime() >= SpellSystem_IncomingSpell[i].timestart + SpellSystem_IncomingSpell[i].casttime + 2 then
			SpellSystem_Message("timeout",SpellSystem_IncomingSpell[i])
			table.remove(SpellSystem_IncomingSpell,i) 
			if (table.getn(SpellSystem_IncomingSpell) > 0 or table.getn(SpellSystem_SentSpell) > 0) then watchedspell = 1 else watchedspell = nil end
			if table.getn(SpellSystem_IncomingSpell) == 0 then SpellSystemPreTimerFrame:SetScript("OnUpdate",nil) end
		end
	end
end

function SpellSystem_WatchTargetingState()
	if not SpellIsTargeting() then
		local f = CreateFrame("Frame")
		f.time = GetTime()
		f:SetScript("OnUpdate",function()
			if GetTime() >= this.time + 1 then
				if needtarget then 
					SpellSystem_Message("notarget",spellnotarget)
					needtarget = nil 
				end
				this:SetScript("OnUpdate",nil)
			end
		end)
		SpellSystemNeedTargetFrame:SetScript("OnUpdate",nil)
	end
end

function SpellSystem_Message(reason,spell)
	--[[
	spell = {
		spell = the name of the spell or item used
		rank = its rank
		target = {
			name = the name of the target
			sex = its sex
			level = its level
			type = player, mob, or specialmob
		}
		texture = the texture for the spell or item
		info = {
			type = spell or item
			id = itemID or spellID
		}
	}
	all entries will have this data except the notarget ones, which will not have the target table
	]]
	if reason == "timeout" then
		SpellSystem_SendEvent("SPELLSYSTEM_TIMEOUT",spell.spell,spell.rank,spell.info,spell.texture,spell.target)
	elseif reason == "needtarget" then
		SpellSystem_SendEvent("SPELLSYSTEM_NEEDTARGET",spell.spell,spell.rank,spell.info,spell.texture)
	elseif reason == "begin" then
		SpellSystem_SendEvent("SPELLSYSTEM_BEGIN",spell.spell,spell.rank,spell.info,spell.texture,spell.target)
	elseif reason == "failedbefore" then
		SpellSystem_SendEvent("SPELLSYSTEM_FAILBEFORE",spell.spell,spell.rank,spell.info,spell.texture,spell.target)
	elseif reason == "failedafter" then
		SpellSystem_SendEvent("SPELLSYSTEM_FAILAFTER",spell.spell,spell.rank,spell.info,spell.texture,spell.target)
	elseif reason == "success" then
		SpellSystem_SendEvent("SPELLSYSTEM_SUCCESS",spell.spell,spell.rank,spell.info,spell.texture,spell.target)
	elseif reason == "notarget" then
		SpellSystem_SendEvent("SPELLSYSTEM_NOTARGET",spell.spell,spell.rank,spell.info,spell.texture)
	elseif reason == "stop" then
		SpellSystem_SendEvent("SPELLSYSTEM_STOP",spell.spell,spell.rank,spell.info,spell.texture,spell.target)
	end
end

function SpellSystem_SendEvent(newevent,...)
	if table.getn(SpellSystem_Listeners[newevent]) > 0 then
		local savedevent = event
		local savedargs = {}
		for i = 1,arg.n do
			table.insert(savedargs,getglobal("arg"..i))
		end
		event = newevent
		for i = 1,arg.n do
			setglobal("arg"..i,arg[i])
		end
		for index,value in pairs(SpellSystem_Listeners[event]) do xpcall(value:GetScript("OnEvent") or function() end,geterrorhandler()) end
		event = savedevent
		for i = 1,table.getn(savedargs) do
			setglobal("arg"..i,savedargs[i])
		end
	end
end

function SpellSystem_RegisterEvent(frame,eventname)
	if SpellSystem_Listeners[eventname] then
		table.insert(SpellSystem_Listeners[eventname],frame)
	end
end

function SpellSystem_UnregisterEvent(frame,eventname)
	if SpellSystem_Listeners[eventname] then
		for index,value in pairs(SpellSystem_Listeners[eventname]) do
			if value == frame then
				table.remove(SpellSystem_Listeners[eventname],index)
				break
			end
		end
	end
end
