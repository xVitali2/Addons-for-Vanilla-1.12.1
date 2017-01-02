
-- SkillDB.lua: interface to the characters' known skill database
-- $Id: SkillDB.lua 462 2006-09-18 15:50:04Z jnmiller $

function RecipeRadar_SkillDB_Init()

   if (not RecipeRadar_SkillDB) then
      RecipeRadar_SkillDB = { }
   end
   
   if (not RecipeRadar_SkillDB[GetRealmName()]) then
      RecipeRadar_SkillDB[GetRealmName()] = { }
   end

   local db = RecipeRadar_SkillDB_GetPlayerProfessions()
   
   -- fishing doesn't get an auto-reset during the spellbook parsing
   if (not db[RRS("Fishing")]) then
      db[RRS("Fishing")] = { Rank = 0, Recipes = { } }
   end

end

-- This function safely initializes the player's personal skill database.
-- If no player is supplied, the current player is assumed.
function RecipeRadar_SkillDB_GetSafePlayerDB(player)

   if (not player) then player = UnitName("player") end

   local db = RecipeRadar_SkillDB[GetRealmName()]
   
   if (not db[player]) then
      db[player] = { }
   end

   if (not db[player].Team) then
      db[player].Team = UnitFactionGroup("player")
   end

   if (not db[player].Professions) then
      db[player].Professions = { }
   end

   if (not db[player].Factions) then
      db[player].Factions = { }
   end

   return db[player]
   
end

-- This is a safe function to retrieve the current character's team.
function RecipeRadar_SkillDB_GetPlayerTeam(player)

   return RecipeRadar_SkillDB_GetSafePlayerDB(player).Team

end

-- This is a safe function to retrieve the current character's skills.
function RecipeRadar_SkillDB_GetPlayerProfessions(player)

   return RecipeRadar_SkillDB_GetSafePlayerDB(player).Professions

end

-- This is a safe function to retrieve the current character's reputation.
function RecipeRadar_SkillDB_GetPlayerFactions(player)

   return RecipeRadar_SkillDB_GetSafePlayerDB(player).Factions

end

-- Refreshes the DB for the current player and currently open skill window.
-- prof_type is one of 'trade' or 'craft'.
function RecipeRadar_SkillDB_Refresh(prof_type)

   local profs = RecipeRadar_SkillDB_GetPlayerProfessions()
   local prof_name, prof_rank, max_rank =
         RecipeRadar_SkillDB_GetProfInfo(prof_type)

   if (not prof_name) then  -- Beast Training, for instance, will cause this
      return
   end
   
   if (not profs[prof_name]) then profs[prof_name] = { } end
   profs[prof_name].Rank = prof_rank
   profs[prof_name].Recipes = { }

   -- this line might help avoid the 0 count that I seem to get on
   -- some early invocations of this function?
   local dummy = RecipeRadar_SkillDB_GetRecipeCount(prof_type)
   
   -- iterate over each listed recipe in the currently open skill window
   for i = 1, RecipeRadar_SkillDB_GetRecipeCount(prof_type) do

      local recipe, hdr = RecipeRadar_SkillDB_GetRecipeInfo(prof_type, i)

      if (recipe and hdr ~= "header") then

         -- map craft window names to real recipe names
         local map = RecipeRadar_NameMap[GetLocale()]
         if (map and map[recipe]) then
            profs[prof_name].Recipes[recipe] = nil
            recipe = map[recipe]
         end

         -- if it's not a header, the character knows this recipe
         profs[prof_name].Recipes[recipe] = 1

      end

   end

   RecipeRadar_SkillDB_HandleSpecialCase(profs, prof_name, max_rank)
   
end

-- Adds unlisted/implied "recipes" to the skill DB.
function RecipeRadar_SkillDB_HandleSpecialCase(profs, prof_name, max_rank)

   if (prof_name == RRS("First Aid") and max_rank > 150) then
      -- Expert First Aid - Under Wraps
      local name = RecipeRadar_GetSafeItemInfo(16084)
      if (name ~= RRS("Uncached Recipe")) then
         profs[RRS("First Aid")].Recipes[name] = 1
      end
   end

   if (prof_name == RRS("Fishing") and max_rank > 150) then
      -- Expert Fishing - The Bass and You
      local name = RecipeRadar_GetSafeItemInfo(16083)
      if (name ~= RRS("Uncached Recipe")) then
         profs[RRS("Fishing")].Recipes[name] = 1
      end
   end

   if (prof_name == RRS("Cooking") and max_rank > 150) then
      -- Expert Cookbook
      local name = RecipeRadar_GetSafeItemInfo(16072)
      if (name ~= RRS("Uncached Recipe")) then
         profs[RRS("Cooking")].Recipes[name] = 1
      end
   end

end

-- Quick function to retrieve a profession rank.
function RecipeRadar_SkillDB_GetRank(prof)

   local prof_db = RecipeRadar_SkillDB_GetPlayerProfessions()[prof]
   if (not prof_db) then return 0 end
   
   return prof_db.Rank

end

-- Quick function to set a new profession rank.
function RecipeRadar_SkillDB_SetRank(prof, rank)

   local prof_db = RecipeRadar_SkillDB_GetPlayerProfessions()[prof]
   if (not prof_db) then return end
   
   prof_db.Rank = tonumber(rank)
   
   RecipeRadar_FrameUpdate()

end

-- Boolean function to determine whether a player in the DB has the
-- reputation necessary to learn the supplied recipe.
function RecipeRadar_SkillDB_HasRep(player, recipe)

   if (not recipe.Faction or recipe.Faction == "") then return true end
   
   local factions = RecipeRadar_SkillDB_GetPlayerFactions(player)
   if (not factions[recipe.Faction]) then return false end
   
   return factions[recipe.Faction] >= recipe.Level

end

-- Boolean function to determine whether a player in the DB has the
-- specialty necessary to learn the supplied recipe.
function RecipeRadar_SkillDB_HasSpec(player, recipe)

   if (not recipe.Specialty or recipe.Specialty == "") then return true end
   
   local db = RecipeRadar_SkillDB_GetPlayerProfessions(player)
   if (not db[recipe.Type]) then return false end
   
   return recipe.Specialty == db[recipe.Type].Specialty

end

-- Debug function to clear some or all of the skill DB.
function RecipeRadar_SkillDB_Clear(player)

   local hdr = "Clearing all known recipes"
   if (player ~= "") then
      hdr = hdr .. " for " .. player
   end
   RecipeRadar_Print(hdr .. ".")

   if (RecipeRadar_SkillDB[GetRealmName()][player]) then
      RecipeRadar_SkillDB[GetRealmName()][player] = { }
   else
      RecipeRadar_SkillDB[GetRealmName()] = { }
   end

end

-- Debug function to print the skill database.
function RecipeRadar_SkillDB_Print(player)

   local hdr = "Printing all known recipes"
   if (player ~= "") then
      hdr = hdr .. " for " .. player
   end
   RecipeRadar_Print(hdr .. ".")

   for realm_name, player_table in RecipeRadar_SkillDB do
      RecipeRadar_Print("   Realm: " .. realm_name)

      for player_name, prof_table in player_table.Professions do

         if (player == "" or player == player_name) then
         
            RecipeRadar_Print("      Player: " .. player_name)
            for prof_name, recipe_table in prof_table do
               RecipeRadar_Print("         Skill: " .. prof_name ..
                     " (Rank " .. recipe_table.Rank .. ")")
               if (recipe_table.Recipes) then
                  for recipe_name, valid in recipe_table.Recipes do
                     RecipeRadar_Print("            Recipe: " .. recipe_name)
                  end
               end
            end

         end
         
      end
      
   end

end

------------------------------------------------------------------------------
-- Abstractions to account for the difference between crafts and trade skills
------------------------------------------------------------------------------

function RecipeRadar_SkillDB_GetProfInfo(prof_type)

   if (prof_type == "trade") then
      return GetTradeSkillLine()
   elseif (prof_type == "craft") then
      return GetCraftDisplaySkillLine()
   end

end

function RecipeRadar_SkillDB_GetRecipeCount(prof_type)

   if (prof_type == "trade") then
      return GetNumTradeSkills()
   elseif (prof_type == "craft") then
      return GetNumCrafts()
   end

   return 0

end

function RecipeRadar_SkillDB_GetRecipeInfo(prof_type, index)

   local name, hdr

   if (prof_type == "trade") then
      name, hdr = GetTradeSkillInfo(index)
   elseif (prof_type == "craft") then
      name, _, hdr = GetCraftInfo(index)
   end

   return name, hdr

end

------------------------------------------------------------------------------
-- Functions to open/parse various frames to update skill info.
------------------------------------------------------------------------------

-- Attempts to open the spellbook and returns true if successful or false if
-- the spellbook was already open.
function RecipeRadar_SkillDB_ShowSpellbookFrame()

   if (not SpellBookFrame:IsVisible()) then
      ToggleSpellBook(BOOKTYPE_SPELL)
      return true
   end
   return false

end

-- Closes the spellbook if it's visible and need_close is true.
function RecipeRadar_SkillDB_HideSpellbookFrame(need_close)

   if (SpellBookFrame:IsVisible() and need_close) then
      ToggleSpellBook(BOOKTYPE_SPELL)
   end

end

-- Opens the spellbook and finds profession windows to open in order
-- to parse skill data from each.
function RecipeRadar_SkillDB_ParseSpellbookFrame()

   local need_close = RecipeRadar_SkillDB_ShowSpellbookFrame()
   
   _, _, _, num_spells = GetSpellTabInfo(1)

   for i = 1, num_spells do
      
      local name = GetSpellName(i, BOOKTYPE_SPELL)
      if (not name) then return end
      
      -- open each of the player's crafting windows
      if (RecipeRadar_IsProfession(name) and name ~= RRS("Fishing")) then
         CastSpell(i, BOOKTYPE_SPELL)
      end
      
      -- check for trade skill specializations
      local spec_prof = RecipeRadar_IsProfessionSpecialty(name)
      if (spec_prof) then
         local profs = RecipeRadar_SkillDB_GetPlayerProfessions()
         if (not profs[spec_prof]) then profs[spec_prof] = { } end
         profs[spec_prof].Specialty = name
      end
      
   end

   HideUIPanel(TradeSkillFrame)
   HideUIPanel(CraftFrame)
   
   RecipeRadar_SkillDB_HideSpellbookFrame(need_close)

end

-- Opens the character window and sets it to the skill frame.
function RecipeRadar_SkillDB_ShowSkillFrame()

   PanelTemplates_SetTab(CharacterFrame, getglobal("SkillFrame"):GetID())
   ShowUIPanel(CharacterFrame)
   CharacterFrame_ShowSubFrame("SkillFrame")

end

-- Closes the character window.
function RecipeRadar_SkillDB_HideSkillFrame()

   HideUIPanel(CharacterFrame)

end

-- Opens the skill frame and parses profession data from the display.
-- Just checking for fishing rank right now, as getting only rank (without
-- recipe data) could be misleading for other professions.
function RecipeRadar_SkillDB_ParseSkillFrame()

   local profs = RecipeRadar_SkillDB_GetPlayerProfessions()

   RecipeRadar_SkillDB_ShowSkillFrame()

   for i = 1, GetNumSkillLines() do
      
      local name, hdr, _, rank, _, modifier, max_rank = GetSkillLineInfo(i)
      
      if (name == RRS("Fishing")) then
      
         if (not profs[name]) then
            profs[name] = { }
         end
      
         profs[name].Rank = rank
         RecipeRadar_SkillDB_HandleSpecialCase(profs, name, max_rank)
         
      end

   end
   
   RecipeRadar_SkillDB_HideSkillFrame()
   
end

-- Opens the character window and sets it to the reputation frame.
function RecipeRadar_SkillDB_ShowReputationFrame()

   PanelTemplates_SetTab(CharacterFrame, getglobal("ReputationFrame"):GetID())
   ShowUIPanel(CharacterFrame)
   CharacterFrame_ShowSubFrame("ReputationFrame")

end

-- Closes the character window.
function RecipeRadar_SkillDB_HideReputationFrame()

   HideUIPanel(CharacterFrame)

end

-- Opens the reputation frame and parses data from the display.
function RecipeRadar_SkillDB_ParseReputationFrame()

   local factions = RecipeRadar_SkillDB_GetPlayerFactions()

   RecipeRadar_SkillDB_ShowReputationFrame()

   for i = 1, GetNumFactions() do

      -- note that we're skipping collapsed headers
      local name, _, level = GetFactionInfo(i);

      if (RecipeRadar_IsKnownFaction(name)) then
         factions[name] = level
      end

   end
   
   RecipeRadar_SkillDB_HideReputationFrame()
   
end
