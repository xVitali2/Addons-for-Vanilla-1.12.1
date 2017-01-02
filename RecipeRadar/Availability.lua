
-- Availability.lua: logic for the availability of recipes to characters
-- $Id: Availability.lua 451 2006-09-11 03:23:04Z jnmiller $

-----------------------------------------------------------------------------
-- Generic, abstracted availability entry points
-----------------------------------------------------------------------------

function RecipeRadar_Availability_Init()

   if (RecipeRadar_Options.RealmAvailability) then
      RecipeRadar_RealmAvailDropDown:Show()
      RecipeRadar_PersonAvailDropDown:Hide()
   else
      RecipeRadar_PersonAvailDropDown:Show()
      RecipeRadar_RealmAvailDropDown:Hide()
   end

end

function RecipeRadar_Availability_Toggle()

   if (RecipeRadar_RealmAvailDropDown:IsVisible()) then
      RecipeRadar_PersonAvailDropDown:Show()
      RecipeRadar_RealmAvailDropDown:Hide()
      RecipeRadar_Options.RealmAvailability = false
   else
      RecipeRadar_RealmAvailDropDown:Show()
      RecipeRadar_PersonAvailDropDown:Hide()
      RecipeRadar_Options.RealmAvailability = true
   end
   
   RecipeRadar_FrameUpdate()

end

-----------------------------------------------------------------------------
-- Indicator for vendor/recipe item lists
-----------------------------------------------------------------------------

-- Returns a colored indication of a recipe's availability.
function RecipeRadar_Availability_GetIndicator(recipe)

   if (RecipeRadar_Options.RealmAvailability) then
      return RecipeRadar_RealmAvail_GetIndicator(recipe)
   else
      return RecipeRadar_PersonAvail_GetIndicator(recipe)
   end

end

-- Returns a string with the recipe's skill in parens.
function RecipeRadar_PersonAvail_GetIndicator(recipe)

   return format(TEXT(PARENS_TEMPLATE), recipe.Skill)

end

-- Returns a string with a little colored realm-wide availability
-- indicator for the main vendor/recipe list.
function RecipeRadar_RealmAvail_GetIndicator(recipe)

   local key = RecipeRadar_Availability_GetKey(recipe)
   if (not key) then return "" end

   return RecipeRadar_ColorToCode(RecipeRadar_Availabilities[key].Color) ..
         "*" .. FONT_COLOR_CODE_CLOSE
   
end

-----------------------------------------------------------------------------
-- Availability tooltip code
-----------------------------------------------------------------------------

-- Populates the tooltip that displays on recipe button mouseover.
function RecipeRadar_Availability_CreateTooltip(recipe)

   local recipe_name = RecipeRadar_GetSafeItemInfo(recipe.ID)

   if (recipe_name == RRS("Uncached Recipe")) then

      -- uncached recipes have a special tooltip and warning
      -- I'm just coloring 'Warning:' red here for max contrast
      local warn = RRS("Warning: if your server has")
      local colon = string.find(warn, ":")
      local warning =
            RecipeRadar_ColorToCode(RecipeRadar_Colors.TooltipWarning) ..
            string.sub(warn, 1, colon) .. FONT_COLOR_CODE_CLOSE ..
            string.sub(warn, colon + 1)

      -- the layout of the tooltip, with colors for each line
      local tooltip = {
            { text = RRS("Uncached Recipe"), color = RecipeRadar_Colors.UncachedRecipe },
            { text = "", color = nil },
            { text = RRS("You may mouse over the [?]"), color = RecipeRadar_Colors.TooltipHeading },
            { text = RRS("icon to lookup this recipe."), color = RecipeRadar_Colors.TooltipHeading },
            { text = "", color = nil },
            { text = warning, color = RecipeRadar_Colors.TooltipHeading },
            { text = RRS("not yet seen this item, you"), color = RecipeRadar_Colors.TooltipHeading },
            { text = RRS("will be disconnected!"), color = RecipeRadar_Colors.TooltipHeading }, }
      for _, line in tooltip do
         RecipeRadar_AvailabilityTooltip_AddLine(line.text, line.color)
      end
      return

   end

   local avail, prosp, known, line_info = { }, { }, { }, { }
   local num_avail, num_prosp, num_known = 0, 0, 0

   -- recipe labels are not saved in the skill database
   recipe_name = RecipeRadar_TrimRecipeLabel(recipe_name)

   -- iterate through each character on this realm
   for player, player_info in RecipeRadar_SkillDB[GetRealmName()] do

      -- do the rest only if the character has the profession
      if (player_info.Professions[recipe.Type] and
            player_info.Professions[recipe.Type].Rank > 0) then

         -- get player's rank
         local rank = player_info.Professions[recipe.Type].Rank
         
         -- get player's relevant faction standing, if any
         local rep = nil
         if (recipe.Faction and player_info.Factions[recipe.Faction]) then
            rep = getglobal("FACTION_STANDING_LABEL" ..
                  player_info.Factions[recipe.Faction])
         end
         
         -- get player's specialty, if any
         local spec = nil
         if (recipe.Specialty) then
            spec = player_info.Professions[recipe.Type].Specialty
         end

         -- now test all of the possible recipe statuses
         if (RecipeRadar_Availability_IsAvailable(player, recipe)) then
            num_avail = num_avail + 1
            avail[num_avail] = {
                  Name = player, Rank = rank, Rep = rep, Spec = spec }

         elseif (RecipeRadar_Availability_IsProspect(player, recipe)) then
            num_prosp = num_prosp + 1
            prosp[num_prosp] = {
                  Name = player, Rank = rank, Rep = rep, Spec = spec }

         elseif (RecipeRadar_Availability_IsKnown(player, recipe)) then
            num_known = num_known + 1
            known[num_known] = {
                  Name = player, Rank = rank, Rep = rep, Spec = spec }

         else
            local bleh = 0
            if (knows) then bleh = 1 end
            RecipeRadar_Print("ASSERT FAILED: " .. player .. " - " ..
                  recipe.Type .. ", " .. recipe_name .. ", " .. recipe.Skill ..
                  " (have " .. rank .. ") knows = " .. bleh)
         end
         
      end

   end

   -- populate the "available now" entries
   if (num_avail > 0) then

      RecipeRadar_AvailabilityTooltip_AddLine(
            RecipeRadar_Availabilities["LearnableByPlayer"].Tooltip.Heading,
            RecipeRadar_Colors.TooltipHeading)
      table.sort(avail, RecipeRadar_Availability_NameSort)

      for _, line in avail do

         local color = RecipeRadar_Colors.LearnableByAlt
         if (line.Name == UnitName("player")) then
            color = RecipeRadar_Colors.LearnableByPlayer
         end

         local rank_suffix = line.Rank
         if (line.Rep) then  -- reputation is relevant to this line
            rank_suffix = rank_suffix .. " - " .. line.Rep
         end
         rank_suffix = format(TEXT(PARENS_TEMPLATE), rank_suffix)

         RecipeRadar_AvailabilityTooltip_AddLine(
               "   " .. line.Name .. " " .. rank_suffix, color)

      end

   end

   -- populate the "available soon" entries
   if (num_prosp > 0) then

      if (num_avail > 0) then
         RecipeRadar_AvailabilityTooltip_AddLine()
      end
      RecipeRadar_AvailabilityTooltip_AddLine(
            RecipeRadar_Availabilities["ProspectForPlayer"].Tooltip.Heading,
            RecipeRadar_Colors.TooltipHeading)
      table.sort(prosp, RecipeRadar_Availability_NameSort)

      for _, line in prosp do

         local color = RecipeRadar_Colors.ProspectForAlt
         if (line.Name == UnitName("player")) then
            color = RecipeRadar_Colors.ProspectForPlayer
         end

         local factors = RecipeRadar_Availability_GetLimitingFactors(
               line.Name, recipe)

         local rank = string.format(RRS("%d of %d"), line.Rank, recipe.Skill)
         if (factors["rank"]) then
            rank = RecipeRadar_HighlightString(rank, color)
         end
         local suffix = rank  -- always include rank in the tooltip

         if (line.Rep) then
            local rep = line.Rep
            if (factors["rep"]) then
               rep = RecipeRadar_HighlightString(rep, color)
            end
            suffix = suffix .. " - " .. rep
         end
         
         if (line.Spec) then
            local spec = line.Spec
            if (factors["spec"]) then
               spec = RecipeRadar_HighlightString(spec, color)
            end
            suffix = suffix .. " - " .. spec
         end

         suffix = format(TEXT(PARENS_TEMPLATE), suffix)
         RecipeRadar_AvailabilityTooltip_AddLine(
               "   " .. line.Name .. " " .. suffix, color)
               
      end

   end

   -- populate the "already known" entries
   if (num_known > 0) then

      if (num_prosp > 0 or num_avail > 0) then
         RecipeRadar_AvailabilityTooltip_AddLine()
      end
      RecipeRadar_AvailabilityTooltip_AddLine(
            RecipeRadar_Availabilities["KnownByPlayer"].Tooltip.Heading,
            RecipeRadar_Colors.TooltipHeading)
      table.sort(known, RecipeRadar_Availability_NameSort)

      for _, line in known do

         local color = RecipeRadar_Colors.KnownByAlt
         if (line.Name == UnitName("player")) then
            color = RecipeRadar_Colors.KnownByPlayer
         end

         local rank_suffix = line.Rank
         if (line.Rep) then  -- reputation is relevant to this line
            rank_suffix = rank_suffix .. " - " .. line.Rep
         end
         rank_suffix = format(TEXT(PARENS_TEMPLATE), rank_suffix)

         RecipeRadar_AvailabilityTooltip_AddLine(
               "   " .. line.Name .. " " .. rank_suffix, color)

      end

   end

end

-- Boolean test for availability used by CreateTooltip(), above
function RecipeRadar_Availability_NameSort(line1, line2)

   return line1.Name < line2.Name

end

-- Returns a set of booleans from which one can derive the availability
-- of any recipe relative to any player.
function RecipeRadar_Availability_GetBooleans(player, recipe)

   local info = RecipeRadar_SkillDB_GetSafePlayerDB(player)

   -- if the player doesn't even have the profession, just return
   if (not info.Professions[recipe.Type]) then return false end

   local recipe_name = RecipeRadar_GetSafeItemInfo(recipe.ID)
   recipe_name = RecipeRadar_TrimRecipeLabel(recipe_name)

   if (recipe_name == RRS("Uncached Recipe")) then
      return nil
   end

   -- otherwise, get the other relevant booleans
   local has_rec = info.Professions[recipe.Type].Recipes[recipe_name]
   local has_rank = info.Professions[recipe.Type].Rank >= recipe.Skill
   local has_rep = RecipeRadar_SkillDB_HasRep(player, recipe)
   local has_spec = RecipeRadar_SkillDB_HasSpec(player, recipe)

   return true, has_rec, has_rank, has_rep, has_spec

end

-- Boolean test for availability used by CreateTooltip() and GetKey()
function RecipeRadar_Availability_IsAvailable(player, recipe)

   local has_prof, has_rec, has_rank, has_rep, has_spec =
         RecipeRadar_Availability_GetBooleans(player, recipe)

   return (has_prof and not has_rec and has_rank and has_rep and has_spec)

end

-- Boolean test for availability used by CreateTooltip() and GetKey()
function RecipeRadar_Availability_IsProspect(player, recipe)

   local has_prof, has_rec, has_rank, has_rep, has_spec =
         RecipeRadar_Availability_GetBooleans(player, recipe)
         
   return (has_prof and not has_rec and
         (not has_rank or not has_rep or not has_spec))

end

-- Boolean test for availability used by CreateTooltip() and GetKey()
function RecipeRadar_Availability_IsKnown(player, recipe)

   local has_prof, has_rec, has_rank, has_rep, has_spec =
         RecipeRadar_Availability_GetBooleans(player, recipe)

   return (has_prof and has_rec and has_rank and has_rep and has_spec)

end

-- Returns a table of strings that specify why the given recipe is not
-- available to the given player.
function RecipeRadar_Availability_GetLimitingFactors(player, recipe)

   local has_prof, has_rec, has_rank, has_rep, has_spec =
         RecipeRadar_Availability_GetBooleans(player, recipe)
   local factors = { }
         
   if (not has_prof) then factors["prof"] = 1 end
   if (not has_rec) then factors["rec"] = 1 end
   if (not has_rank) then factors["rank"] = 1 end
   if (not has_rep) then factors["rep"] = 1 end
   if (not has_spec) then factors["spec"] = 1 end

   return factors

end

-----------------------------------------------------------------------------
-- Availability testing for filtering and dropdowns
-----------------------------------------------------------------------------

-- This function tests whether the recipe is learnable either by
-- the player or an alt if realm-wide availability is on.
function RecipeRadar_Availability_IsLearnable(recipe, set_filter)

   local name = RecipeRadar_GetSafeItemInfo(recipe.ID)

   local avail = RecipeRadar_Availability_GetKey(recipe)
   if (not avail) then return false end
   
   if (set_filter) then
      recipe.IsFilteredByAvailability =
            RecipeRadar_IsAvailabilityFiltered(avail)
   end
   
   if (RecipeRadar_Options.RealmAvailability) then
      return avail == "LearnableByPlayer" or avail == "LearnableByAlt"
   else
      return avail == "LearnableByPlayer"
   end

end

-- Wrapper for the above that makes its functionality clearer.
function RecipeRadar_Availability_SetAvailabilityFilter(recipe)

   RecipeRadar_Availability_IsLearnable(recipe, true)

end

-- Generic function returns the key to the RecipeRadar_Availabilities
-- table so the caller can get whatever related info she needs.
function RecipeRadar_Availability_GetKey(recipe)

   if (RecipeRadar_Availability_IsAvailable(player, recipe)) then
      return "LearnableByPlayer"

   elseif (RecipeRadar_Options.RealmAvailability and
         RecipeRadar_Availability_IsSatisfiedByAlt(recipe,
         RecipeRadar_Availability_IsAvailable)) then
      return "LearnableByAlt"

   elseif (RecipeRadar_Availability_IsProspect(player, recipe)) then
      return "ProspectForPlayer"

   elseif (RecipeRadar_Options.RealmAvailability and
         RecipeRadar_Availability_IsSatisfiedByAlt(recipe,
         RecipeRadar_Availability_IsProspect)) then
      return "ProspectForAlt"

   elseif (RecipeRadar_Availability_IsKnown(player, recipe)) then
      return "KnownByPlayer"

   elseif (RecipeRadar_Options.RealmAvailability and
         RecipeRadar_Availability_IsSatisfiedByAlt(recipe,
         RecipeRadar_Availability_IsKnown)) then
      return "KnownByAlt"

   else
      return "NotApplicable"
   end

end

-- Boolean test for availability used by GetKey(), above.
function RecipeRadar_Availability_IsSatisfiedByAlt(recipe, sat_func)

   for player, player_info in RecipeRadar_SkillDB[GetRealmName()] do

      if (player_info.Team ~= RecipeRadar_GetOpposingFaction("player") and
            player ~= UnitName("player") and
            sat_func(player, recipe)) then
         return true
      end
   
   end
   return false

end
