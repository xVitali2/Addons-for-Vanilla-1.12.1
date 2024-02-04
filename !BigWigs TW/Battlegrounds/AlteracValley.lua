----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Alterac Valley", "Alterac Valley")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function()
    return {
        cmd = "Alterac",

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
module.enabletrigger = {
  "Stormpike Herald",
  "Stormpike Owl",

  "Frostwolf Herald",
}
module.toggleoptions = {
    --"towers", "graveyards", -1, "bosskill"
}


-- locals
local timer = {
    towers = 60*5,
    graveyards = 60*5,
}
local icon = {
    bannerA = "inv_bannerpvp_02",
    bannerH = "inv_bannerpvp_01",
}
local syncName = {
    gr = "GraveYards" .. module.revision,
    tow = "Towers" .. module.revision,
}

local gy_trigger_under_attack = "(.+) is under attack! If left unchecked, the (.+) will capture it!"

local tower_trigger_under_attack = "(.+) is under attack! If left unchecked, the (.+) will destroy it!"

local defended_trigger = "(.+) was taken by the (.+)!"

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
    self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

    self:ThrottleSync(8, syncName.gr)
    self:ThrottleSync(8, syncName.tow)
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


------------------------------
--      Event Handlers	    --
------------------------------

function module:CHAT_MSG_MONSTER_YELL(msg)

    local _, _, gr, faction = string.find(msg, gy_trigger_under_attack)

    if gr and faction then

        local l_icon = icon.bannerA

        if faction == 'Horde' then
            l_icon = icon.bannerH
        end

        self:RemoveBar(gr)
        self:Bar(gr, timer.graveyards, l_icon)

    end

    local _, _, tower, faction = string.find(msg, tower_trigger_under_attack)

    if tower and faction then

        local l_icon = icon.bannerA

        if faction == 'Horde' then
            l_icon = icon.bannerH
        end

        self:RemoveBar(tower)
        self:Bar(tower, timer.graveyards, l_icon)

    end

    local _, _, obj, faction = string.find(msg, defended_trigger)
    if obj and faction then

        local l_icon = icon.bannerA

        if faction == 'Horde' then
            l_icon = icon.bannerH
        end

        self:RemoveBar(obj)

    end

end
