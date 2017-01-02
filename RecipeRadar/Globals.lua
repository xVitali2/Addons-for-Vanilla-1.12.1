
-- Globals.lua: global/saved variables and some related initialization code
-- $Id: Globals.lua 466 2006-09-18 18:10:31Z jnmiller $

RECIPERADAR_VERSION = "1.11"

RECIPERADAR_VENDORS_DISPLAYED = 8
RECIPERADAR_VENDOR_HEIGHT = 16
RECIPERADAR_VENDOR_OFFSET = 20
RECIPERADAR_IMAGE_ROOT = "Interface\\Addons\\RecipeRadar\\Images\\"

-- this should be <= the number of RecipeRadar*Icons
RECIPERADAR_MAPPED_VENDORS_MAX = 20

BINDING_HEADER_RECIPERADAR_HEADER = RRS("Recipe Radar Bindings")
BINDING_NAME_RECIPERADAR_TOGGLE = RRS("Toggle Recipe Radar")

RecipeRadar_Options = { }

RecipeRadar_Filters = {
   Teams = { },
   Professions = { },
   RealmAvails = { },
   PersonAvails = { },
}

RecipeRadar_Colors = {

   MainFont           = { r = 1.0, g = 0.75, b = 0.0 },
   Alliance           = { r = 0.5, g = 0.625, b = 1.0 },
   Horde              = { r = 1.0, g = 0.125, b = 0.25 },
   Neutral            = { r = 1.0, g = 0.82, b = 0.0 },
   LightGray          = { r = 0.9, g = 0.9, b = 0.9 },
   UncachedRecipe     = { r = 0.75, g = 0.75, b = 0.75 },
   DisabledGray       = { r = 0.5, g = 0.5, b = 0.5 },

   TooltipHeading     = { r = 0.9, g = 0.9, b = 0.9 },
   TooltipWarning     = { r = 1.0, g = 0.3, b = 0.3 },
   
   -- realm-wide availability tooltip/indicator colors
   LearnableByPlayer  = { r = 0.0, g = 1.0, b = 0.0 },
   LearnableByAlt     = { r = 0.0, g = 0.8, b = 0.0 },
   ProspectForPlayer  = { r = 1.0, g = 0.2, b = 0.2 },
   ProspectForAlt     = { r = 0.8, g = 0.2, b = 0.2 },
   KnownByPlayer      = { r = 0.7, g = 0.7, b = 0.7 },
   KnownByAlt         = { r = 0.5, g = 0.5, b = 0.5 },
   NotApplicable      = { r = 0.5, g = 0.5, b = 0.5 },
   
   -- person-wide availability tooltip/indicator colors
   Available          = GREEN_FONT_COLOR,
   Unavailable        = RED_FONT_COLOR,
   AlreadyKnown       = GRAY_FONT_COLOR,
   
   -- amount that colors will be phased to highlight the text
   Highlight          = 0.2,
   
}

RecipeRadar_Continents = {

   [0] = RRS("Instances"),
   [1] = RRS("Kalimdor"),
   [2] = RRS("Eastern Kingdoms"),

}

RecipeRadar_Teams = {

   ["Alliance"] = {
      Name = FACTION_ALLIANCE,
      Color = RecipeRadar_Colors.Alliance,
   },
   ["Horde"] = {
      Name = FACTION_HORDE,
      Color = RecipeRadar_Colors.Horde,
   },
   ["Neutral"] = {
      Name = RRS("Neutral"),
      Color = RecipeRadar_Colors.Neutral,
   },

}

RecipeRadar_Professions = {

   [RRS("Alchemy")] = {
      Name = RRS("Alchemy"),
      Icon = RECIPERADAR_IMAGE_ROOT .. "Icons\\" .. "Alchemy",
   },
   [RRS("Blacksmithing")] = {
      Name = RRS("Blacksmithing"),
      Icon = RECIPERADAR_IMAGE_ROOT .. "Icons\\" .. "Blacksmithing",
   },
   [RRS("Cooking")] = {
      Name = RRS("Cooking"),
      Icon = RECIPERADAR_IMAGE_ROOT .. "Icons\\" .. "Cooking",
   },
   [RRS("Enchanting")] = {
      Name = RRS("Enchanting"),
      Icon = RECIPERADAR_IMAGE_ROOT .. "Icons\\" .. "Enchanting",
   },
   [RRS("Engineering")] = {
      Name = RRS("Engineering"),
      Icon = RECIPERADAR_IMAGE_ROOT .. "Icons\\" .. "Engineering",
   },
   [RRS("First Aid")] = {
      Name = RRS("First Aid"),
      Icon = RECIPERADAR_IMAGE_ROOT .. "Icons\\" .. "First-Aid",
   },
   [RRS("Fishing")] = {
      Name = RRS("Fishing"),
      Icon = RECIPERADAR_IMAGE_ROOT .. "Icons\\" .. "Fishing",
   },
   [RRS("Leatherworking")] = {
      Name = RRS("Leatherworking"),
      Icon = RECIPERADAR_IMAGE_ROOT .. "Icons\\" .. "Leatherworking",
   },
   [RRS("Tailoring")] = {
      Name = RRS("Tailoring"),
      Icon = RECIPERADAR_IMAGE_ROOT .. "Icons\\" .. "Tailoring",
   },

}

RecipeRadar_Specialties = {

   [RRS("Gnomish Engineer")] = RRS("Engineering"),
   [RRS("Goblin Engineer")] = RRS("Engineering"),
   [RRS("Tribal Leatherworking")] = RRS("Leatherworking"),
   [RRS("Elemental Leatherworking")] = RRS("Leatherworking"),
   [RRS("Dragonscale Leatherworking")] = RRS("Leatherworking"),
   [RRS("Armorsmith")] = RRS("Blacksmithing"),
   [RRS("Weaponsmith")] = RRS("Blacksmithing"),
   [RRS("Master Axesmith")] = RRS("Blacksmithing"),
   [RRS("Master Swordsmith")] = RRS("Blacksmithing"),
   [RRS("Master Hammersmith")] = RRS("Blacksmithing"),

}

RecipeRadar_Factions = {

   RRS("Argent Dawn"),
   RRS("Cenarion Circle"),
   RRS("Thorium Brotherhood"),
   RRS("Timbermaw Hold"),
   RRS("Zandalar Tribe"),
   
}

RecipeRadar_Availabilities = {

   ["LearnableByPlayer"] = {
      Text = RRS("Available Now (Player)"),
      Tooltip = { Group = 1, Heading = RRS("Available For:") },
      DropDown = { POrder = 1, ROrder = 1 },
      Color = RecipeRadar_Colors.LearnableByPlayer,
      TestFunction = RecipeRadar_Availability_IsLearnableByPlayer,
   },
   ["LearnableByAlt"] = {
      Text = RRS("Available Now (Alts)"),
      Tooltip = { Group = 1, Heading = RRS("Available For:") },
      DropDown = { POrder = nil, ROrder = 2 },
      Color = RecipeRadar_Colors.LearnableByAlt,
      TestFunction = RecipeRadar_Availability_IsLearnableByAlt,
   },
   ["ProspectForPlayer"] = {
      Text = RRS("Future Prospect (Player)"),
      Tooltip = { Group = 2, Heading = RRS("Future Prospect For:") },
      DropDown = { POrder = 2, ROrder = 3 },
      Color = RecipeRadar_Colors.ProspectForPlayer,
      TestFunction = RecipeRadar_Availability_IsProspectForPlayer,
   },
   ["ProspectForAlt"] = {
      Text = RRS("Future Prospect (Alts)"),
      Tooltip = { Group = 2, Heading = RRS("Future Prospect For:") },
      DropDown = { POrder = nil, ROrder = 4 },
      Color = RecipeRadar_Colors.ProspectForAlt,
      TestFunction = RecipeRadar_Availability_IsProspectForAlt,
   },
   ["KnownByPlayer"] = {
      Text = RRS("Already Known (Player)"),
      Tooltip = { Group = 3, Heading = RRS("Already Known By:") },
      DropDown = { POrder = 3, ROrder = 5 },
      Color = RecipeRadar_Colors.KnownByPlayer,
      TestFunction = RecipeRadar_Availability_IsKnownByPlayer,
   },
   ["KnownByAlt"] = {
      Text = RRS("Already Known (Alts)"),
      Tooltip = { Group = 3, Heading = RRS("Already Known By:") },
      DropDown = { POrder = nil, ROrder = 6 },
      Color = RecipeRadar_Colors.KnownByAlt,
      TestFunction = RecipeRadar_Availability_IsKnownByAlt,
   },
   ["NotApplicable"] = {
      Text = RRS("Inapplicable Professions"),
      Tooltip = { Group = 0 },  -- do not show in tooltip
      DropDown = { POrder = 4, ROrder = 7 },
      Color = RecipeRadar_Colors.NotApplicable,
      TestFunction = nil,  -- don't need to test the default case
   },

}


-----------------------------------------------------------------------------
-- Global initialization functions
-----------------------------------------------------------------------------

-- This function "upgrades" the user's saved variables, if necessary.
function RecipeRadar_Globals_Init(force)

   RecipeRadar_Options_Init()

   if (not force and RecipeRadar_Options.Version >= RECIPERADAR_VERSION) then
      return  -- running version is current
   end

   -- v1.5 filter upgrades
   if (RecipeRadar_Options.Version < "1.5") then
      if (RecipeRadar_Filters.PersonAvails[AVAILABLE]) then
         RecipeRadar_Filters.PersonAvails["LearnableByPlayer"] = true
      end
      if (RecipeRadar_Filters.PersonAvails[UNAVAILABLE]) then
         RecipeRadar_Filters.PersonAvails["ProspectForPlayer"] = true
      end
      if (RecipeRadar_Filters.PersonAvails[USED]) then
         RecipeRadar_Filters.PersonAvails["KnownByPlayer"] = true
         RecipeRadar_Filters.PersonAvails["NotApplicable"] = true
      end
      RecipeRadar_Filters.PersonAvails[AVAILABLE] = nil
      RecipeRadar_Filters.PersonAvails[UNAVAILABLE] = nil
      RecipeRadar_Filters.PersonAvails[USED] = nil
   end
   
   -- v1.9 skill DB format change
   if (RecipeRadar_SkillDB and not RecipeRadar_SkillDB.Version) then
      for realm, realm_info in RecipeRadar_SkillDB do
         realm_info.Team = nil
         for player, player_info in realm_info do
            local temp = { }
            for prof, prof_info in player_info do
               temp[prof] = prof_info
               player_info[prof] = nil
            end
            player_info.Professions = { }
            table.foreach(temp,
                  function (k, v) player_info.Professions[k] = v end)
         end
      end
   end
   
   -- upgrade is complete
   RecipeRadar_SkillDB.Version = RECIPERADAR_VERSION
   RecipeRadar_Options.Version = RECIPERADAR_VERSION

end

-- Initializes the Options table with some defaults.
function RecipeRadar_Options_Init()

   if (RecipeRadar_Options.Version == nil) then
      RecipeRadar_Options.Version = RECIPERADAR_VERSION
   end

   if (RecipeRadar_Options.MinimapButtonPosition == nil) then
      RecipeRadar_Options.MinimapButtonPosition = 256
   end

   if (RecipeRadar_Options.ShowMinimapButton == nil) then
      RecipeRadar_Options.ShowMinimapButton = true
      RecipeRadarMinimapButtonFrame:Show()
   end

   if (not RecipeRadar_IsProfession(
         RecipeRadar_Options.CurrentProfession)) then
      RecipeRadar_Options.CurrentProfession = RRS("Cooking")
   end

   if (RecipeRadar_Options.RealmAvailability == nil) then
      RecipeRadar_Options.RealmAvailability = true
      RecipeRadar_RealmAvailDropDown:Show()
   end

   if (RecipeRadar_Options.Locked == nil) then
      RecipeRadar_Options.Locked = false
   end

   if (RecipeRadar_Options.AutoSelectRegion == nil) then
      RecipeRadar_Options.AutoSelectRegion = true
   end

   if (RecipeRadar_Options.AutoMapVendors == nil) then
      RecipeRadar_Options.AutoMapVendors = false
   end

end

-- Copies 'IsFiltered' members from t2 to t1.
function RecipeRadar_CopyFilterSettings(t1, t2)

   for key, val in t2 do
      t1[key].IsFiltered = val.IsFiltered
   end

end
