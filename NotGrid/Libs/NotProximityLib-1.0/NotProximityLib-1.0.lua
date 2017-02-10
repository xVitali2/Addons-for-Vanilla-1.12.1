--[[
	Name: NotProximityLib-1.0
	Revision: $Rev: 1 $
	Author(s): gnwl
	Thanks: Tekkub, Aviana, Renew, Astrolabe
	Website: https://github.com/gnwl/NotProximityLib
	Description: A fork of ProximityLib. Provides range checks and events.
	Dependencies: AceLibrary, AceEvent-2.0, RosterLib-2.0
]]

local MAJOR_VERSION = "NotProximityLib-1.0"
local MINOR_VERSION = "$Revision: 1 $"

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary.") end
if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end
if not AceLibrary:HasInstance("RosterLib-2.0") then error(MAJOR_VERSION .. " requires RosterLib-2.0") end
if not AceLibrary:HasInstance("AceEvent-2.0") then error(MAJOR_VERSION .. " requires AceEvent-2.0") end

local Lib = {}
AceLibrary("AceEvent-2.0"):embed(Lib)

------------------------------------------------
-- Locales
------------------------------------------------

-- This table needs to be localized, of course
local L = {} -- why aren't these within self variables? How does ace clean it up/reuse it in the case of new lib versions? Everyone seems to do it like this, so I dunno.
if ( GetLocale() == "ruRU" ) then
    L.events = {
        ["CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS"] = "(%a+) получает эффект %a.+", --%a on the last just to make sure its not a digit
        ["CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE"] = "(%a+) находится под воздействием эффекта .+",
        ["CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS"] = "(%a+) получает эффект %a.+",
        ["CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE"] = "(%a+) находится под воздействием эффекта .+",
		
        ["CHAT_MSG_SPELL_PARTY_BUFF"] = "(%a+) начинает .+", --I don't get this message for party members? Only friendly?
        ["CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF"] = "(%a+) начинает .+",
        ["CHAT_MSG_SPELL_PARTY_DAMAGE"] = "(%a+) начинает .+",
        ["CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE"] = "(%a+) начинает .+",
		
        ["CHAT_MSG_SPELL_AURA_GONE_PARTY"] = "Действие эффекта \".+\", наложенного на (%a+), заканчивается%.",
        ["CHAT_MSG_SPELL_AURA_GONE_OTHER"] = "Действие эффекта \".+\", наложенного на (%a+), заканчивается%.", -- will pick up hostile fades as well as freind, but I won't have them in rosterlib so whatevs
		
        ["CHAT_MSG_SPELL_SELF_BUFF"] = "Ваше заклинание \".+\" исцеляет (%a+) на .+"
	}
    L["Alterac Valley"] = "Альтеракская долина"
    L["Arathi Basin"] = "Низина Арати"
    L["Warsong Gulch"] = "Ущелье Песни Войны"    
else
	L.events = {
        ["CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS"] = "(%a+) gains %a.+", --%a on the last just to make sure its not a digit
        ["CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE"] = "(%a+) is afflicted by .+",
        ["CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS"] = "(%a+) gains %a.+",
        ["CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE"] = "(%a+) is afflicted by .+",
		
        ["CHAT_MSG_SPELL_PARTY_BUFF"] = "(%a+) begins .+", --I don't get this message for party members? Only friendly?
        ["CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF"] = "(%a+) begins .+",
        ["CHAT_MSG_SPELL_PARTY_DAMAGE"] = "(%a+) begins .+",
        ["CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE"] = "(%a+) begins .+",
		
        ["CHAT_MSG_SPELL_AURA_GONE_PARTY"] = ".+ fades from (%a+)%.",
        ["CHAT_MSG_SPELL_AURA_GONE_OTHER"] = ".+ fades from (%a+)%.", -- will pick up hostile fades as well as freind, but I won't have them in rosterlib so whatevs
		
        ["CHAT_MSG_SPELL_SELF_BUFF"] = "Your .+ heals (%a+) for .+"
	}
    L["Alterac Valley"] = "Alterac Valley"
    L["Arathi Basin"] = "Arathi Basin"
    L["Warsong Gulch"] = "Warsong Gulch"
end

local spells40yd = { -- Macros are forced to have text associated with them so we can safely just check the textures as well as check against the presence of text. No need for Gratuity or Babble overhead. Though if they have an item in their bar that matches the texture then GG haha
    ["PALADIN"] = {"Interface\\Icons\\Spell_Holy_FlashHeal", "Interface\\Icons\\Spell_Holy_HolyBolt"},
    ["PRIEST"] = {"Interface\\Icons\\Spell_Holy_FlashHeal", "Interface\\Icons\\Spell_Holy_LesserHeal", "Interface\\Icons\\Spell_Holy_Heal", "Interface\\Icons\\Spell_Holy_GreaterHeal", "Interface\\Icons\\Spell_Holy_Renew"},
    ["DRUID"] = {"Interface\\Icons\\Spell_Nature_HealingTouch", "Interface\\Icons\\Spell_Nature_ResistNature", "Interface\\Icons\\Spell_Nature_Rejuvenation"},
    ["SHAMAN"] = {"Interface\\Icons\\Spell_Nature_MagicImmunity", "Interface\\Icons\\Spell_Nature_HealingWaveLesser", "Interface\\Icons\\Spell_Nature_HealingWaveGreater"},
}

local MapScales = {
    [0] = {[0] = {x = 29688.932932224,  y = 44537.340058402}}, -- World Map
	
    [-1] = { -- Battlegrounds
        [0] = {x=0.0000000001,y=0.0000000001}, -- dummy
        [L["Alterac Valley"]] = {x=0.00025277584791183,y=0.0003791834626879}, -- Alterac Valley
        [L["Arathi Basin"]] = {x=0.00060996413230886,y=0.00091460134301867}, -- Arathi Basin
        [L["Warsong Gulch"]] = {x=0.000934666820934484,y=0.0013986080884933}, -- Warsong Gulch
	},
	
    [1] = { -- Kalimdor
        [0] = {x = 24533.025279205, y = 36800.210572494}, -- No local Map
        [1] = {x=0.00018538534641226,y=0.00027837923594884}, -- Ashenvale
        [2] = {x=0.0002110515322004,y=0.00031666883400508}, -- Aszhara
        [3] = {x=0.00016346999577114,y=0.0002448782324791}, -- Darkshore
        [4] = {x=0.001011919762407,y=0.0015176417572158}, -- Darnassus
        [5] = {x=0.000238049243117769,y=0.00035701000264713}, -- Desolace
        [6] = {x=0.000202241752828887,y=0.00030311250260898},  -- Durotar
        [7] = {x=0.00020404585770198,y=0.00030594425542014}, -- Dustwallow Marsh
        [8] = {x=0.00018605589866638,y=0.00027919347797121}, -- Felwood
        [9] = {x=0.00015413335391453,y=0.00023112978254046}, -- Feralas
        [10] = {x=0.00046338992459433,y=0.00069469745670046}, -- Moonglade
        [11] = {x=0.00020824585642133,y=0.00031234536852155}, -- Mulgore
        [12] = {x=0.00076302673135485,y=0.0011450946331024}, -- Orgrimmar
        [13] = {x=0.00030702139650072,y=0.00046115900788988}, -- Silithus
        [14] = {x=0.0002192035317421,y=0.00032897400004523}, -- Stonetalon Mountains
        [15] = {x=0.00015519559383392,y=0.00023255497217178}, -- Tanaris
        [16] = {x=0.00021010743720191,y=0.00031522342136928}, -- Teldrassil
        [17] = {x=0.0001055257661002,y=0.00015825512153762}, -- Barrens
        [18] = {x=0.00024301665169852,y=0.00036516572747912}, -- Thousand Needles
        [19] = {x=0.00102553303755263,y=0.0015390366315842}, -- Thunderbluff
        [20] = {x=0.00028926772730691,y=0.0004336131470544}, -- Un'Goro Crater
        [21] = {x=0.0001503484589713,y=0.0002260080405644}, -- Winterspring
	},
	
    [2] = { -- Eastern Kingdoms
        [0] = {x = 27149.795290881, y = 40741.175327834}, -- No local Map
        [1] = {x=0.00038236060312816,y=0.00057270910058703}, -- Alterac Mountains
        [2] = {x=0.00029711957488741,y=0.00044587893145425}, -- Arathi Highlands
        [3] = {x=0.00043004538331713,y=0.00064518196242196}, -- Badlands
        [4] = {x=0.00031955327306475,y=0.00047930649348668}, -- Blasted Lands
        [5] = {x=0.00036544565643583,y=0.00054845426763807}, -- Burning Steppes
        [6] = {x=0.00042719074657985,y=0.00064268921102796}, -- Deadwind Pass
        [7] = {x=0.00021748670509883,y=0.00032613213573183}, -- Dun Morogh
        [8] = {x=0.00039665134889739,y=0.000594192317755393},-- Duskwood
        [9] = {x=0.00027669753347124,y=0.00041501436914716}, -- Eastern Plaguelands
        [10] = {x=0.00030816452843802,y=0.00046261719294957}, -- Elwynn Forest
        [11] = {x=0.00033472904137203,y=0.00050214784485953}, -- Hillsbrad Foothills
        [12] = {x=0.0013541845338685,y=0.0020301469734737}, -- Ironforge
        [13] = {x=0.00038827742849077,y=0.000582420040021079}, -- Loch Modan
        [14] = {x=0.00049317521708352,y=0.0007399320602417}, -- Redridge Mountains
        [15] = {x=0.00047916280371802,y=0.00071918751512255}, -- Searing Gorge
        [16] = {x=0.00025506743362975,y=0.00038200191089085}, -- Silverpine
        [17] = {x=0.00079576990434102,y=0.0011931381055287}, -- Stormwind
        [18] = {x=0.00016783603600093,y=0.00025128040994917}, -- Stranglethorn
        [19] = {x=0.00046689595494952,y=0.00070027368409293}, -- Swamp of Sorrows
        [20] = {x=0.0002777065549578,y=0.00041729531117848}, -- Hinterlands
        [21] = {x=0.00023638989244189,y=0.0003550010068076}, -- Tirisfal
        [22] = {x=0.0011167100497655,y=0.0016737942184721}, -- Undercity
        [23] = {x=0.00024908781051636,y=0.00037342309951782}, -- Western Plaguelands
        [24] = {x=0.00030591232436044,y=0.00045816733368805},-- Westfall
        [25] = {x=0.00025879591703415,y=0.00038863212934562}, -- Wetlands
	}
}

------------------------------------------------
-- activate, enable, disable
------------------------------------------------

local function activate(self, oldLib, oldDeactivate)
    if oldLib then
        self.v = oldLib.v
        oldLib:UnregisterAllEvents()
		if oldLib:IsEventScheduled("UpdateUnits") then
			oldLib:CancelScheduledEvent("UpdateUnits")
		end
	end
    self.v = {}
    self.v.roster = AceLibrary("RosterLib-2.0").roster
    self:GetFortyYardSpell() -- we need to just call this, not call it expecting a return because we need to do it on ACTIONBAR_SLOT_CHANGED events as well
    self:ZONE_CHANGED_NEW_AREA() -- yeah, we have to do this because you don't register an area event change when you reloadui, only on login or an acual area change
	
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    self:RegisterEvent("ACTIONBAR_SLOT_CHANGED", "GetFortyYardSpell") -- if the player changes his action bars, we need to parse through them again and try to find a usable slot
    for key in L.events do
        self:RegisterEvent(key, "CombatEventHandle")
	end
	
    self:ScheduleRepeatingEvent("UpdateUnits", self.UpdateUnits, 0.2, self)
	
    if oldDeactivate then -- clean up the old library
        oldDeactivate(oldLib)
	end
end

---------------
-- Main Loop --
---------------

function Lib:UpdateUnits()
    local v = self.v -- I was informed that this is better for performance
    for _,unitobj in v.roster do -- itterate through rosterlib
        if UnitExists(unitobj.unitid) and UnitIsVisible(unitobj.unitid) then -- oddity where if in an instance, beyond 28 yards, 
            if UnitIsUnit(unitobj.unitid, "player") then
                self:ConfirmedHandle(unitobj,0)
				elseif CheckInteractDistance(unitobj.unitid, 3) then -- duel range
                self:ConfirmedHandle(unitobj,10)
				elseif CheckInteractDistance(unitobj.unitid, 2) then -- trade and inspect range (1 is the same as 2 with patch 1.12)
                self:ConfirmedHandle(unitobj,11.11)
				elseif CheckInteractDistance(unitobj.unitid, 4) then -- follow range
                self:ConfirmedHandle(unitobj,28)
				elseif SpellIsTargeting() then
                self:SpellIsTargetingHandle(unitobj)
				elseif UnitIsUnit(unitobj.unitid, "target") and v.spell40slot then -- IsActionInRange returns the string "0" if not in range which is a boolean true
                if IsActionInRange(v.spell40slot) == 1 then
                    self:ConfirmedHandle(unitobj,40)
					else
                    self:ConfirmedHandle(unitobj,100)
				end
				elseif unitobj.npllastseen then -- any smart way to not have to send this every loop while still allowing addon authors to control the leeway?
                self:LastSeenTrigger(unitobj) -- I could confirm him as within 100 yards as well, but I'm not going to do that. Confirming values greater than 40 is about confirming that they're above 40, not that that they're below 100/1000.
				else
                self:ConfirmedHandle(unitobj,100) -- but if we don't at least have a lastseen, but he is in render range, then we'll confirm him as within 100(to confirm he's outside 40)
			end
            --if in the outworld, then send some additional triggers reporting map x/y distance. If the mod author wants to use map distance when the player is in outworld then he can use these.
            if (v.instance == "none" or v.instance == "pvp") and not WorldMapFrame:IsVisible() then -- why do we care if map isvisible?.. also this will probably fail with pets
                local distance = self:GetWorldDistance(unitobj.unitid)
                self:WorldHandle(unitobj,distance)
			end
			else
            self:WorldHandle(unitobj,1000)
            self:ConfirmedHandle(unitobj,1000) -- yeah, I don't really want to set it as a value as that's incorrect information, but it's better than have to do coniditional checks to see if its nil or not before we try to compare it to a number
		end
	end
end

-----------------------
-- Trigger Functions --
-----------------------

function Lib:ConfirmedHandle(unitobj,range)
    unitobj.npllastseen = GetTime() -- we update the confirmed lastseen time regardless of whether we send out a trigger or not
    if unitobj.nplrange ~= range or not unitobj.nplconfirmed then
        unitobj.nplrange = range
        unitobj.nplconfirmed = true
        self:TriggerEvent("NotProximityLib_RangeUpdate", unitobj.unitid, unitobj.nplrange, unitobj.npllastseen, unitobj.nplconfirmed)
        --DEFAULT_CHAT_FRAME:AddMessage(unitobj.name.." "..unitobj.unitid.." "..unitobj.nplrange.." ".."confirmed at: "..unitobj.npllastseen,0,1,0)
	end
end

function Lib:LastSeenTrigger(unitobj) -- this gets sent every 0.2 seconds, because thats the rate we're looping through our database. It's up to the mod author how often he wants to respond to them
    unitobj.nplconfirmed = false -- is it more efficient to do an if check or just set it regardless?
    self:TriggerEvent("NotProximityLib_RangeUpdate", unitobj.unitid, unitobj.nplrange, unitobj.npllastseen) -- I don't actually send the confirmed value in this case
    --DEFAULT_CHAT_FRAME:AddMessage(unitobj.unitid.." "..unitobj.nplrange.." ".."unconfirmed"..unitobj.npllastseen,1,0,0)
end

function Lib:WorldHandle(unitobj,range)
    unitobj.nplworldlastseen = GetTime() -- I don't think anyone will ever need this but who knows.
    if unitobj.nplworldrange ~= range then
        unitobj.nplworldrange = range
        self:TriggerEvent("NotProximityLib_WorldRangeUpdate", unitobj.unitid, unitobj.nplworldrange, unitobj.nplworldlastseen)
        --DEFAULT_CHAT_FRAME:AddMessage(unitobj.unitid.." "..unitobj.nplworldrange.." "..unitobj.nplworldlastseen)
	end
end

-----------------------------
-- SpellIsTargering Handle --
-----------------------------

function Lib:SpellIsTargetingHandle(unitobj)
    if SpellCanTargetUnit(unitobj.unitid) then -- and not already confirmed to be 40 or less
        self:ConfirmedHandle(unitobj,40)
		elseif not SpellCanTargetUnit(unitobj.unitid) then
        self:ConfirmedHandle(unitobj,100) --what if its set to confirmed while spellistargeting, and then I back up and need to confirm it as this?
	end
end

-------------------------
-- Combat Event Handle --
-------------------------

function Lib:CombatEventHandle()
    local v = self.v
    local capturestring = L.events[event]
    local _, _, name = string.find(arg1, capturestring) -- arg1 gets sent by any combat event as the string you see in combat log
	
    if name and v.roster[name] then
        local unitobj = v.roster[name]
        local combatlogrange = tonumber(GetCVar("CombatLogRangeFriendlyPlayers")) -- I'm going to inappropriately assume that if he's set this as non-default then he's also set all the others as the same(we can correct this easily in future versions)
        if combatlogrange and combatlogrange <= 40 and not (unitobj.nplconfirmed and unitobj.nplrange and unitobj.nplrange <= 28) then -- and not confirmed to be less than 28
            self:ConfirmedHandle(unitobj,combatlogrange)
		end
	end
end

-------------------------
-- Map Proximity Stuff --
-------------------------

function Lib:GetWorldDistance(unitid) -- I have no idea what goes on in this function, thanks Rhena/Renew/Astrolabe :^)
    local px, py, ux, uy, distance
    local v = self.v
    SetMapToCurrentZone()
    px, py = GetPlayerMapPosition("player")
    ux, uy = GetPlayerMapPosition(unitid)
	
    if v.Zone ~= 0 and v.Continent ~= 0 then
        distance = sqrt(((px - ux)/MapScales[v.Continent][v.Zone].x)^2 + ((py - uy)/MapScales[v.Continent][v.Zone].y)^2)
		else
        local xDelta, yDelta;
        px, py = px*MapScales[v.Continent][v.Zone].x, py*MapScales[v.Continent][v.Zone].y
        ux, uy = ux*MapScales[v.Continent][v.Zone].x, uy*MapScales[v.Continent][v.Zone].y
        xDelta = (ux - px)
        yDelta = (uy - py)
        distance = sqrt(xDelta*xDelta + yDelta*yDelta)
	end
    
    return distance
end

function Lib:ZONE_CHANGED_NEW_AREA()
    local v = self.v
    SetMapToCurrentZone()
    _, v.instance = IsInInstance()
    v.Continent = GetCurrentMapContinent()
    v.Zone = GetCurrentMapZone()
    v.ZoneName = GetZoneText()
    if v.ZoneName == L["Warsong Gulch"] or v.ZoneName == L["Arathi Basin"] or v.ZoneName == L["Alterac Valley"] then
        v.Zone = v.ZoneName
	end
end

-------------------------
-- 40 Yard Spell Stuff --
-------------------------

function Lib:GetFortyYardSpell()
    local v = self.v
    local _, class = UnitClass("player")
    if spells40yd[class] then -- if he is of a class that has data in the table
        local textures = spells40yd[class]
        local indices = getn(spells40yd[class])
        for i = 1, 120 do -- for all possible action bar slots
            local ActionTexture = GetActionTexture(i)
            for j=1,indices do -- for as many textures are in the class table
                if ActionTexture == textures[j] and not GetActionText(i) then -- if we match a texture and there is no text with it(macros are forced to have text)
                    v.spell40slot = i -- set it as our variable and return out of the function
                    return
				end
			end
		end
	end
    v.spell40slot = nil -- set it as nil if it never found anything
end

-----------------------------
--      Query Methods      --
-----------------------------

function Lib:GetUnitRange(unitid)
    local v = self.v
    local name = UnitName(unitid)
    return v.roster[name].nplrange, v.roster[name].npllastseen
end

-----------------------------
--     Help Me Help You    --
-----------------------------
--[[If you're writing a unit frame addon, and you have clique like features, intercept the user's clicks, clear their target(if they had one), 
	cast the spell(again, without a target selected), send them here first to itterate through roster, and then finally cast the spell on whichever 
unit they wanted. Then restore their previous target(if they had one). How long of a delay is that? Idunnolol. Probably less than 0.1 seconds.]]

function Lib:UpdateSpellCanTarget() -- this is just a copy paste from the main update function, but should be used for quicker than 0.2 seconds updates if the addon user is doing Clique-like stuff
    for _,unitobj in self.v.roster do
        if UnitExists(unitobj.unitid) and UnitIsVisible(unitobj.unitid) and not (unitobj.nplconfirmed and unitobj.nplrange and unitobj.nplrange <= 28 ) and SpellIsTargeting() then -- mimick all the checks of the main update loop before passing this along
            self:SpellIsTargetingHandle(unitobj)
		end
	end
end

------------------------------------------------
-- Register
------------------------------------------------

AceLibrary:Register(Lib, MAJOR_VERSION, MINOR_VERSION, activate)