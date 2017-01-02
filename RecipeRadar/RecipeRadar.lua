
-- RecipeRadar.lua: main event code and general utility functions
-- $Id: RecipeRadar.lua 464 2006-09-18 18:05:57Z jnmiller $

function RecipeRadar_OnLoad()

   tinsert(UISpecialFrames, "RecipeRadarFrame")
   UIPanelWindows["RecipeRadarFrame"] = nil

   SLASH_RecipeRadar1 = "/rrdr"
   SLASH_RecipeRadar2 = "/reciperadar"
   SlashCmdList["RecipeRadar"] = RecipeRadar_SlashHandler

   this:RegisterEvent("VARIABLES_LOADED")
   this:RegisterEvent("ZONE_CHANGED_NEW_AREA")
   this:RegisterEvent("MINIMAP_UPDATE_ZOOM")
   this:RegisterEvent("WORLD_MAP_UPDATE")
   this:RegisterEvent("CRAFT_SHOW")
   this:RegisterEvent("TRADE_SKILL_SHOW")
   this:RegisterEvent("CHAT_MSG_SKILL")
   this:RegisterEvent("CHAT_MSG_SYSTEM")
   this:RegisterEvent("PLAYER_ENTERING_WORLD")

   -- RecipeRadar_Print("Recipe Radar loaded!")

end

function RecipeRadar_OnEvent()

   if (event == "VARIABLES_LOADED") then

      RecipeRadar_Globals_Init()
      RecipeRadar_MinimapButton_Init()
      RecipeRadar_Availability_Init()
      RecipeRadar_Maps_Init()
      RecipeRadar_SkillDB_Init()
      RecipeRadar_MainFrame_Init()
      RecipeRadar_DropDowns_Init()
      RecipeRadar_SelectFirstRecipe()

   elseif (event == "ZONE_CHANGED_NEW_AREA") then

      if (RecipeRadar_RegionHasLearnableRecipe(GetRealZoneText())) then
         RecipeRadar_MinimapButton_Flash()
      end
      RecipeRadar_Minimap_OnNewRegion()
      if (RecipeRadar_Options.AutoSelectRegion) then
         RecipeRadar_NewRegion(GetRealZoneText())
      end

   elseif (event == "ADDON_LOADED" and arg1 == "RecipeRadar") then

      --

   elseif (event == "PLAYER_ENTERING_WORLD") then

      if (RecipeRadar_Filters.Teams["Horde"] == nil) then
         -- this should be the first run of the addon, so set team filters
         RecipeRadar_Filters.Teams[UnitFactionGroup("player")] = false
         RecipeRadar_Filters.Teams
               [RecipeRadar_GetOpposingFaction("player")] = true
      end

   elseif (event == "MINIMAP_UPDATE_ZOOM") then

      RecipeRadar_Minimap_SetIndoorness()

   elseif (event == "WORLD_MAP_UPDATE") then

      RecipeRadar_Worldmap_UpdateButtons()

   elseif (event == "CRAFT_SHOW") then

      RecipeRadar_SkillDB_Refresh("craft")

   elseif (event == "TRADE_SKILL_SHOW") then

      RecipeRadar_SkillDB_Refresh("trade")

   elseif (event == "CHAT_MSG_SKILL") then

      -- arg1 = eg. "Your skill in Cooking has increased to 221."
      RecipeRadar_ParseChatMessage(arg1)

   elseif (event == "CHAT_MSG_SYSTEM") then

      -- arg1 = eg. "You have learned how to create a new item: Bristle Whisker Catfish."
      RecipeRadar_ParseChatMessage(arg1)

   end

end

function RecipeRadar_OnShow()

   --PlaySound("igCharacterInfoOpen")

end

function RecipeRadar_OnHide()

   PlaySound("igCharacterInfoClose")
   RecipeRadarFrame:StopMovingOrSizing()

end

function RecipeRadar_SlashHandler(msg)

   local _, _, cmd, arg1, arg2 = string.find(msg, "(%w+)%s*(%w*)%s*(%w*)")

   if (cmd == "debug") then

      if (arg1 == "vendor") then
         RecipeRadar_Options.PositionDebug = true
      end

      if (arg1 == "skills") then
         RecipeRadar_SkillDB_Print(arg2)
      end

      if (arg1 == "clear") then
         RecipeRadar_SkillDB_Clear(arg2)
      end

      return

   end

   if (cmd == "radar") then
   
      local region = RecipeRadar_RegionData[GetRealZoneText()]
      if (not region) then return end

      for _, vendor in region.Vendors do

         RecipeRadar_Print(RecipeRadar_GetColoredTeamString(
               vendor.Team, vendor.Name) .. " (" ..
               string.format("%d", vendor.Coordinates[1].x * 100) .. ", " ..
               string.format("%d", vendor.Coordinates[1].y * 100) .. "):")

         table.sort(vendor.Recipes, RecipeRadar_CompareSkills)
         table.foreach(vendor.Recipes, RecipeRadar_PrintRecipe)

      end

      return

   end

   RecipeRadar_Toggle()
   
end

-- Function to be called on selecting a new region to initialize the
-- main frame and any active filters.
function RecipeRadar_NewRegion(region)

   if (not region or region == "") then return end

   RecipeRadar_Options.CurrentRegion = region
   RecipeRadar_Options.CurrentContinent = RecipeRadar_GetCurrentContinent()
   RecipeRadar_InitVendorFilters()
   RecipeRadar_SelectFirstRecipe()
   RecipeRadar_FrameUpdate()

end

-- Returns whether the given region contains at least one recipe that
-- is learnable by the player or (optionally) alts
function RecipeRadar_RegionHasLearnableRecipe(region_name)

   local region_data = RecipeRadar_RegionData[region_name]
   if (not region_data) then return false end

   for _, vendor in region_data.Vendors do
      for _, recipe in vendor.Recipes do
         if (RecipeRadar_Availability_IsLearnable(recipe)) then
            return true
         end
      end
   end

   return false

end

-- Given a table of recipes, returns the number of recipes that are
-- learnable by the player or (optionally) alts.
function RecipeRadar_CountLearnableRecipes(recipes)

   if (not recipes) then return 0 end

   local total = 0
   
   for _, recipe in recipes do
      if (RecipeRadar_Availability_IsLearnable(recipe)) then
         total = total + 1
      end
   end

   return total

end

-- Returns the index of the current region's continent, or 0 if the
-- player is not in a known map zone (eg. she's in an instance).
function RecipeRadar_GetCurrentContinent()

   local region = RecipeRadar_RegionData[RecipeRadar_Options.CurrentRegion]

   -- this mess derives the current continent from the current region
   if (region) then
      return region.Continent
   else
      -- region is not one with recipes, so we search for it
      for cont_id, _ in { GetMapContinents() } do
         for _, zone in { GetMapZones(cont_id) } do
            if (RecipeRadar_Options.CurrentRegion == zone) then
               return cont_id
            end
         end
      end
      return 0
   end

end

-- Converts a format string to one that LUA can understand.  I've
-- shamelessly stolen this from Innerfire in order to (I hope) prevent
-- the combat chatlog parsing errors.
function RecipeRadar_ConvertFormat(fmt)

   -- remove non-English format params like "%1$s"
   local find = string.gsub(fmt, "%%%d%$", "%%")

   -- remove any special characters with escaped versions
   find = string.gsub(find, "([%^%$%(%)%.%[%]%*%+%-%?])", "%%%1")

   -- finally replace standard "%s" and "%d"
   find = string.gsub(find, "%%s", "(.+)")
   find = string.gsub(find, "%%d", "(%%d+)")
   return find

end

-- Parses the input for a couple of known message formats to gain information
-- about changes in the character's skills.
function RecipeRadar_ParseChatMessage(msg)
   
   -- messages of the form 'Your skill in %s has increased to %d.'
   local start, _, prof, rank =
         string.find(msg, RecipeRadar_ConvertFormat(ERR_SKILL_UP_SI))
   if (start) then
      RecipeRadar_SkillDB_SetRank(prof, rank)
   end

   -- messages of the form 'You have unlearned %s.'
   start, _, prof =
         string.find(msg, RecipeRadar_ConvertFormat(ERR_SPELL_UNLEARNED_S))
   if (prof) then
      RecipeRadar_SkillDB_GetPlayerProfessions()[prof] = nil
   end
   
end

-- Foreach function that prints a recipe link and its cost.
function RecipeRadar_PrintRecipe(index, recipe)

   RecipeRadar_Print("   " .. RecipeRadar_GetHyperlinkByID(recipe.ID) ..
         ", " .. RecipeRadar_GetGSCString(recipe.Cost))

end

-- Returns a string describing an item link from an item ID.
function RecipeRadar_GetHyperlinkByID(id)

   local name, link, color = RecipeRadar_GetSafeItemInfo(id)
   return RecipeRadar_GetHyperlinkByParts(name, link, color)

end

-- Returns a string describing an item link from link components.
function RecipeRadar_GetHyperlinkByParts(name, link, color)

   return string.format("%s|H%s|h[%s]|h|r", color, link, name)

end

-- If an item is not in your local cache, GetItemInfo() fails.  To work
-- around this, we just return 'uncached' along with the details we do know.
-- If an item is recognized by the client, we cache the name so that future
-- requests don't end up fully 'uncached'.  The final return value is a
-- boolean indicating whether it was a cached ID.
function RecipeRadar_GetSafeItemInfo(id)

   local name, link, rarity, _, _, _, _, _, texture = GetItemInfo(id)
   
   -- initialize our name cache if necessary
   if (not RecipeRadar_NameCache) then RecipeRadar_NameCache = { } end

   if (name == nil) then
   
      -- set returned name according to whether we've already seen the id
      if (RecipeRadar_NameCache[id]) then
         name = RecipeRadar_NameCache[id]
      else
         name = RRS("Uncached Recipe")
      end

      -- create our own tooltip for uncached items
      return name, "item:" .. id .. ":0:0:0",
            RecipeRadar_ColorToCode(RecipeRadar_Colors.UncachedRecipe),
            RecipeRadar_Colors.UncachedRecipe.r,
            RecipeRadar_Colors.UncachedRecipe.g,
            RecipeRadar_Colors.UncachedRecipe.b,
            RECIPERADAR_IMAGE_ROOT .. "Misc\\QuestionMark",
            false  -- boolean to indicate whether we got a real recipe

   else
      RecipeRadar_NameCache[id] = name  -- cache names
      local r, g, b, colorcode = GetItemQualityColor(rarity)
      return name, link, colorcode, r, g, b, texture, true
   end

end

function RecipeRadar_RegionNameToID(region_name, continent)

   local index = 0
   
   for _, zone in { GetMapZones(continent) } do
      index = index + 1
      if (region_name == zone) then
         return index
      end   
   end

   RecipeRadar_Print("ASSERT FAILED: region '" .. region_name ..
         "' not found by GetMapZones()!")
   return nil

end

-- Formats the subtext that applies to a few vendors.  include_parens is
-- a boolean that specifies whether the string should be in parens.
function RecipeRadar_FormatVendorNote(note, include_parens)

   if (include_parens) then
      return format(TEXT(PARENS_TEMPLATE), format(RRS("%s Vendor"), note))
   end
   return format(RRS("%s Vendor"), note)

end

-- Get gold, silver, copper from total copper.
function RecipeRadar_GetGSC(copper)

   if (copper == nil) then
      copper = 0
   end

   local g = math.floor(copper / 10000)
   local s = math.floor((copper - (g * 10000)) / 100)
   local c = math.floor(copper - (g * 10000) - (s * 100))

   return g, s, c

end

-- Format text by color for gold, silver and copper (from EnhTooltip).
function RecipeRadar_GetGSCString(copper)

   local TEXT_NONE = "0"
   local GSC_GOLD = "ffd100"
   local GSC_SILVER = "e6e6e6"
   local GSC_COPPER = "c8602c"
   local GSC_FMT = "|cff%s%d|r"
   local GSC_PART = ".|cff%s%02d|r"
   local GSC_NONE = "|cffa0a0a0" .. TEXT_NONE .. "|r"

   local g, s, c = RecipeRadar_GetGSC(copper)
   local gsc = ""

   if (g > 0) then
      gsc = string.format(GSC_FMT, GSC_GOLD, g)
      if (s > 0) then
         gsc = gsc .. string.format(GSC_PART, GSC_SILVER, s)
      end
      if exact then
         gsc = gsc .. string.format(GSC_PART,GSC_COPPER, c)
      end
   elseif (s > 0) then
      gsc = string.format(GSC_FMT, GSC_SILVER, s)
      if (c > 0) then
         gsc = gsc .. string.format(GSC_PART, GSC_COPPER, c)
      end
   elseif (c > 0) then
      gsc = gsc .. string.format(GSC_FMT, GSC_COPPER, c)
   else
      gsc = GSC_NONE
   end

   return gsc

end

-- Returns the name of the player's opposing faction.
-- These strings shouldn't need to be localized.
function RecipeRadar_GetOpposingFaction()

   if (UnitFactionGroup("player") == "Alliance") then
      return "Horde"
   elseif (UnitFactionGroup("player") == "Horde") then
      return "Alliance"
   end
   return "Unknown"

end

-- Formats a string in the color specified by the key 'team'.
function RecipeRadar_GetColoredTeamString(team, s)

   if (not RecipeRadar_Teams[team]) then return end
   return RecipeRadar_ColorToCode(RecipeRadar_Teams[team].Color) ..
         s .. FONT_COLOR_CODE_CLOSE

end

-- Returns whether the skill is an applicable profession.
function RecipeRadar_IsProfession(skill_name)

   for name, _ in RecipeRadar_Professions do
      if (name == skill_name) then
         return true
      end
   end
   
   return false

end

-- Returns the profession under which a trade skill specialty belongs,
-- or false if skill_name is not a known specialty.
function RecipeRadar_IsProfessionSpecialty(skill_name)

   for spec, prof in RecipeRadar_Specialties do
      if (spec == skill_name) then
         return prof
      end
   end

   return false

end

-- Returns whether the supplied faction is one that Recipe Radar cares about.
function RecipeRadar_IsKnownFaction(faction)

   for _, name in RecipeRadar_Factions do
      if (name == faction) then
         return true
      end
   end

   return false

end

-- Returns whether the given vendor has at least one unfiltered recipe.
function RecipeRadar_VendorHasRecipes(vendor)

   for _, recipe in vendor.Recipes do
      if (not RecipeRadar_IsRecipeFiltered(recipe)) then
         return true
      end
   end

   return false

end

-- Returns whether the given recipe has at least one unfiltered location.
function RecipeRadar_RecipeHasLocations(recipe)

   for _, location in recipe.Locations do
      if (not location.IsFiltered) then
         return true
      end
   end

   return false

end

-- Returns a string describing the requirements to buy the given recipe
-- according to the recipe's Notes/Faction member, or nil.
function RecipeRadar_GetRecipeReqsString(recipe)

   if (recipe.Notes and recipe.Notes ~= "") then
      return recipe.Notes
   end
   if (recipe.Faction and recipe.Faction ~= "") then
      return recipe.Faction .. ", " ..
            getglobal("FACTION_STANDING_LABEL" .. recipe.Level)
   end
   return nil

end

-- Given a recipe name of the form 'Label: Name', returns 'Name'.  It
-- does this by checking for a ':' and looking ahead two characters.
-- TODO: verify this with Asian/other languages.
function RecipeRadar_TrimRecipeLabel(recipe_name)

   local label_end = string.find(recipe_name, ":")
   if (label_end) then
      return string.sub(recipe_name, label_end + 2)
   end
   return recipe_name

end

-- Sorts the vendors in a given region.
function RecipeRadar_SortVendors(region_data)

   if (region_data.IsVendorTableSorted) then
      return
   end

   table.sort(region_data.Vendors, RecipeRadar_CompareNames)
   region_data.IsVendorTableSorted = true

end

-- Sorts the recipes on a given vendor.
function RecipeRadar_SortRecipes(container)

   if (container.IsRecipeTableSorted) then
      return
   end

   table.sort(container.Recipes, RecipeRadar_CompareSkills)
   container.IsRecipeTableSorted = true

end

-- Sorts the locations on a given recipe.
function RecipeRadar_SortLocations(recipe_data)

   if (recipe_data.IsLocationsTableSorted) then
      return
   end

   table.sort(recipe_data.Locations, RecipeRadar_CompareRegions)
   recipe_data.IsRecipeTableSorted = true

end

-- Sort comparison function on required skill first, then the recipe's
-- ID (to insure a deterministic order).
function RecipeRadar_CompareSkills(recipe1, recipe2)

   if (recipe1.Skill == recipe2.Skill) then
      return recipe1.ID < recipe2.ID
   end
   return recipe1.Skill < recipe2.Skill
   
end

-- Sort comparison function on vendor names.
function RecipeRadar_CompareNames(vendor1, vendor2)

   return vendor1.Name < vendor2.Name

end

-- Sort comparison function on location names.
function RecipeRadar_CompareRegions(location1, location2)

   if (location1.Region == location2.Region) then
      return location1.Vendor < location2.Vendor
   end
   return location1.Region < location2.Region

end

-- Returns a color code string converted from RGB decimals.
function RecipeRadar_ColorToCode(color)

   return string.format("|cff%02x%02x%02x",
         255 * color.r, 255 * color.g, 255 * color.b)

end

-- Returns the given string surrounded by the highlighted version of
-- base_color.
function RecipeRadar_HighlightString(s, base_color)

   local highlight = {
         r = math.min(1.0, base_color.r + RecipeRadar_Colors.Highlight),
         g = math.min(1.0, base_color.g + RecipeRadar_Colors.Highlight),
         b = math.min(1.0, base_color.b + RecipeRadar_Colors.Highlight), }
   return RecipeRadar_ColorToCode(highlight) .. s .. FONT_COLOR_CODE_CLOSE

end

-- Basic chat frame printing function.
function RecipeRadar_Print(msg, r, g, b)

   DEFAULT_CHAT_FRAME:AddMessage(msg,
         (r or RecipeRadar_Colors.MainFont.r),
         (g or RecipeRadar_Colors.MainFont.g),
         (b or RecipeRadar_Colors.MainFont.b))

end
