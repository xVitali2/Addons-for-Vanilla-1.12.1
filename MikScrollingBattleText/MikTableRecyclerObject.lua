-------------------------------------------------------------------------------------
-- Title: Mik's Table Recyler Object
-- Author: Mik
-- Maintainer: Athene
-- Credits:
--  Thanks to tekkub, the author of compostLib.  I adapted much of his code for
--  this object.
-------------------------------------------------------------------------------------

-- Create "namespace."
MikTRO = {};

-- Set the __index property to the recycler object namespace so
-- when a new recycler object sets it metatable to the namespace
-- the recycler object inherits the functions in the namespace.
MikTRO.__index = MikTRO;


-- **********************************************************************************
-- Creates a recycler object.
-- **********************************************************************************
function MikTRO:NewRecyclerObject(maxEntries)
 -- Create a table to use.
 recyclerObject = {};

 -- Create a table to hold the cache entries and set its max permanent size.
 recyclerObject.PrimaryCache = {};
 recyclerObject.MaxEntries = maxEntries;

 -- Create some variables to hold stats.
 recyclerObject.NumNew = 0;
 recyclerObject.NumRecycled = 0;
 recyclerObject.NumErased = 0;
 recyclerObject.NumReclaimed = 0;
 recyclerObject.AmountMemFreed = 0;


 -- Create a table to hold overflow entries.  If more tables are reclaimed
 -- than the size of the max primary cache can hold, they will be reclaimed
 -- into the overflow cache which is a weak table.  This allows for spikes
 -- in cache usage to still be optimized while not preventing garbage
 -- collection on the extra data once there are no other references to them.
 recyclerObject.OverflowCache = {};
 setmetatable(recyclerObject.OverflowCache, {__mode = "v"});


 -- Set the meta table for the cache object to the table recycler
 -- obect's namespace so the cache object inherits the functions of
 -- table recycler object.
 setmetatable(recyclerObject, self);

 -- Return the recycler object.
 return recyclerObject;
end



-- **********************************************************************************
-- Removes a table from the cache and returns it.  If there are no tables available
-- in the cache a new one is returned.
-- **********************************************************************************
function MikTRO:AcquireTable()
 -- Check if there are any tables available in the primary cache and if so
 -- return one.
 if (table.getn(self.PrimaryCache) > 0) then
  -- Increment the number of recycled tables.
  self.NumRecycled = self.NumRecycled + 1;

  return table.remove(self.PrimaryCache);

 -- Check if there are any tables available in the overflow cache and if so
 -- return one.
 elseif self:TablesInOverflow() then
  -- Increment the number of recycled tables.
  self.NumRecycled = self.NumRecycled + 1;

  -- Loop through the tables in the overflow and return one.
  for i in pairs(self.OverflowCache) do
   return table.remove(self.OverflowCache, i);
  end

 -- No tables available so return a new one.
 else
  -- Increment the number of new tables created.
  self.NumNew = self.NumNew + 1;
  return {};
 end
end


-- **********************************************************************************
-- Reclaims a table into the cache.
-- **********************************************************************************
function MikTRO:ReclaimTable(t)
 -- Check if the passed value isn't valid.
 if (type(t) ~= "table") then
  return;
 end

 -- Erase the passed table.
 self:EraseTable(t);

 -- Check if the primary cache is already full.
 if (table.getn(self.PrimaryCache) >= self.MaxEntries) then
  -- Insert the table into the overflow cache.
  table.insert(self.OverflowCache, t);
 else
  -- Insert the table into the primary cache.
  table.insert(self.PrimaryCache, t);
 end

 -- Increment the number of reclaimed tables.
 self.NumReclaimed = self.NumReclaimed + 1;
end


-- **********************************************************************************
-- Erases the passed table.  Subtables are NOT erased.
-- **********************************************************************************
function MikTRO:EraseTable(t)
 -- Check if the passed value isn't valid.
 if (type(t) ~= "table") then
  return;
 end

 -- Get the amount of memory used before the clear.
 local currentMem = gcinfo();

 -- Loop through all the keys in the table and clear it.
 for key in pairs(t) do
  t[key] = nil;
 end

 -- Set the length of the table to 0.
 table.setn(t, 0);

 -- Increment the amount of memory freed.
 self.AmountMemFreed = self.AmountMemFreed + math.abs(gcinfo() - currentMem);

 -- Incremnt the number of tables erased.
 self.NumErased = self.NumErased + 1;
end


-- **********************************************************************************
-- Prints stats.
-- **********************************************************************************
function MikTRO:PrintStats()
 local overflowSize = 0;
 for i in pairs(self.OverflowCache) do
  overflowSize = overflowSize + 1;
 end

 DEFAULT_CHAT_FRAME:AddMessage(string.format(
  "|cff00ff00New Tables: %d|r  |cffffff00Recycled Tables: %d|r  |cff00ffffCached Tables: %d|r  |cffff0000Overflow Tables: %d|r  |cff888888Erased Tables: %d|r  |cffff00ffMemory Saved: %d KiB|r  |cffff0088Tables Lost to GC: %d",
  self.NumNew,
  self.NumRecycled,
  table.getn(self.PrimaryCache),
  overflowSize,
  self.NumErased,
  self.AmountMemFreed + ((32/1024) * self.NumRecycled),
  self.NumReclaimed - self.NumRecycled - table.getn(self.PrimaryCache)));
end


-- **********************************************************************************
-- Checks if there are any tables in the overflow cache.
-- **********************************************************************************
function MikTRO:TablesInOverflow()
 -- Loop through all items in the overflow cache.
 for i in pairs(self.OverflowCache) do
  return true; 
 end
end