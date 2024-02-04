----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Arathi Basin", "Arathi Basin")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function()
    return {
        cmd = "Arathi",

        --mark_cmd = "mark",
        --mark_name = "Mark Alerts",
        --mark_desc = "Warn for marks",
        --
        --shieldwall_cmd = "shieldwall",
        --shieldwall_name = "Shieldwall Alerts",
        --shieldwall_desc = "Warn for shieldwall",
        --
        --void_cmd = "void",
        --void_name = "Void Zone Alerts",
        --void_desc = "Warn on Lady Blaumeux casting Void Zone.",
        --
        --meteor_cmd = "meteor",
        --meteor_name = "Meteor Alerts",
        --meteor_desc = "Warn on Thane casting Meteor.",
        --
        --wrath_cmd = "wrath",
        --wrath_name = "Holy Wrath Alerts",
        --wrath_desc = "Warn on Zeliek casting Wrath.",
        --
        --markbar = "Mark %d",
        --mark_warn = "Mark %d!",
        --mark_warn_5 = "Mark %d in 5 sec",
        --marktrigger1 = "afflicted by Mark of Zeliek",
        --marktrigger2 = "afflicted by Mark of Korth'azz",
        --marktrigger3 = "afflicted by Mark of Blaumeux",
        --marktrigger4 = "afflicted by Mark of Mograine",
        --
        --voidtrigger = "Your life is mine!",
        --voidwarn = "Void Zone Incoming",
        --voidbar = "Void Zone",
        --
        --meteortrigger = "Thane Korth'azz's Meteor hits ",
        --meteortrigger2 = "I like my meat extra crispy!",
        --meteorwarn = "Meteor!",
        --meteorbar = "Meteor",
        --
        --wrathtrigger = "Sir Zeliek's Holy Wrath hits ",
        --wrathtrigger2 = "I have no choice but to obey!",
        --wrathwarn = "Holy Wrath!",
        --wrathbar = "Holy Wrath",
        --
        --startwarn = "The Four Horsemen Engaged! Mark in 20 sec",
        --
        --shieldwallbar = "%s - Shield Wall",
        --shieldwalltrigger = "(.*) gains Shield Wall.",
        --shieldwall_warn = "%s - Shield Wall for 20 sec",
        --shieldwall_warn_over = "%s - Shield Wall GONE!",
    }
end)

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20005 -- To be overridden by the module!
module.enabletrigger = { } -- string or table {boss, add1, add2}
module.toggleoptions = {
    --"towers", "graveyards", -1, "bosskill"
}


-- locals
local timer = {
    base = 60
}
local icon = {
    bannerA = "inv_bannerpvp_02",
    bannerH = "inv_bannerpvp_01",
}
local defended = "(.+) has defended the (.+)"
local assaulted = "(.+) has assaulted the (.+)"
local claimed = "(.+) claims the (.+)! If left unchallenged, the (.+) will control it in 1 minute!"

--local defended_trigger = "(.+) was taken by the (.+)!"

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
    self:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL", "BgEvent")
    self:RegisterEvent("CHAT_MSG_BG_SYSTEM_ALLIANCE", "BgEvent")
    self:RegisterEvent("CHAT_MSG_BG_SYSTEM_HORDE", "BgEvent")
end

-- called after module is enabled and after each wipe
function module:OnSetup()
end

-- called after boss is engaged
function module:OnEngage()

end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


--BigWigs:EnableModule(moduleName, nosync)

--local m=BigWigs:GetModule("The Four Horsemen");m:Test()

if GetZoneText() == 'Westfall' then

end

------------------------------
--      Event Handlers	    --
------------------------------

local _, race = UnitRace('player')
race = string.lower(race)

local faction = 'a'
if race ~= 'human' and race ~= 'gnome' and race ~= 'dwarf' and race ~= 'nightelf' and race ~= 'bloodelf' then
    faction = 'h'
end

function getFaction(j)

    for i = 0, GetNumRaidMembers() do
        if GetRaidRosterInfo(i) then
            local n = GetRaidRosterInfo(i);
            if n == j then
                if faction == 'a' then
                    return 'a'
                else
                    return 'h'
                end
            end
        end
    end

    return 'a'

end

function bw_ucFirst(a)
    return string.upper(string.sub(a, 1, 1)) .. string.lower(string.sub(a, 2, string.len(a)))
end

function fixBase(f)
    if f == 'lumber mill' then
        return 'Lumber Mill'
    end

    return bw_ucFirst(f)
end

function module:BgEvent(msg)

    local _, _, player, base = string.find(msg, assaulted)

    if player and base then

        local l_icon = icon.bannerA
        if getFaction(player) == 'h' then
            l_icon = icon.bannerH
        end

        self:RemoveBar(bw_ucFirst(base))
        self:Bar(bw_ucFirst(base), timer.base, l_icon)

    end

    local _, _, dplayer, dbase = string.find(msg, defended)

    if dplayer and dbase then
        self:RemoveBar(bw_ucFirst(dbase))
    end

    local _, _, cplayer, cbase, cfaction = string.find(msg, claimed)

    if cplayer and cbase and cfaction then

        local l_icon = icon.bannerA
        if cfaction == 'Horde' then
            l_icon = icon.bannerH
        end

        self:RemoveBar(bw_ucFirst(cbase))
        self:Bar(bw_ucFirst(cbase), timer.base, l_icon)

    end


end
