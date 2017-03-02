--[[**************************************************
===================README=============================
1. (first time only) RENAME THIS FILE file from 
   _settings.lua to settings.lua when done. 
   The changes you made will not be loaded until you do that. 
   This is by design so addon updates don't overwrite 
   your settings.
2. Only change values after the equal sign = 
3. Only edit things between the SETTINGS START / END
4. If you just renamed the file you need to exit and 
   restart the client.
5. If you have already done the rename once and just
   editing values /console reloadui is enough.
--**************************************************]]

-- SETTINGS START --
local genSettings = {
  ["showPets"]=false,           -- controls whether non-combat pets are filtered
  ["enableAddOn"]=true,         -- controls whether enemy nameplates start ON
  ["showFriendly"]=false,       -- controls if friendly nameplates start ON
  ["combatOnly"]=false,         -- controls if enemy nameplates will only show in combat
  ["hbwidth"]=130,               -- width of nameplates
  ["hbheight"]=13,               -- height of nameplates
                                -- texture of the healthbar (if a non-default it needs to be put in addon folder)  
  ["texture"]="Interface\\AddOns\\CustomNameplates\\barSmall",               
  ["refreshRate"]=1/60,         -- the denominator defines the update frequency (in FPS), lower the number for better performance at the cost of slower updates
  ["clickThrough"]=2            -- controls whether the nameplates are clickthrough = 0, click = 1, mouselook = 2
} 
local raidicon = {
  ["size"]=15,                  -- size of raidicon
  ["point"]="BOTTOMLEFT",       -- point of the raidicon that attaches to the nameplate
  ["anchorpoint"]="BOTTOMLEFT", -- point of the nameplate that the raidicon attaches to
  ["xoffs"]=-18,                -- horizontal offset (+ moves it right, - left)
  ["yoffs"]=-4                  -- vertical offset (+ moves it up, - moves it down)
}
local debufficon = {
  ["hide"]=false,               -- hide or show debuff icons
  ["sizex"]=24,                 -- X size
  ["sizey"]=12,                 -- Y size
  ["point"]="BOTTOMLEFT",
  ["anchorpoint"]="TOPLEFT", 		-- "BOTTOMLEFT",
  ["yoffs"]=16, -- -13,         -- vertical offset of the first row of debuffs
  ["xoffs"]=0, -- -25           -- vertical offset of the second row of debuffs
  ["rowvector"] = 1            	-- rows growing direction 1 = up, -1 = down
}
local classicon = {
  ["hide"]=false,
  ["size"]=12,
  ["point"]="RIGHT",
  ["anchorpoint"]="LEFT",
  ["xoffs"]=-3,                 -- horizontal offset (+ moves it right, - left)
  ["yoffs"]=-1                  -- vertical offset (+ moves it up, - moves it down)
}
local targetindicator = {
  ["hide"]=true,
  ["size"]=25,
  ["point"]="BOTTOM",
  ["anchorpoint"]="TOP",
  ["xoffs"]=0,                  -- horizontal offset (+ moves it right, - left)
  ["yoffs"]=-5                  -- vertical offset (+ moves it up, - moves it down)
}
local nametext = {
  ["size"]=11, --12
                                -- if non default the font file must be copied in CustomNameplates\Fonts\   
  ["font"]="Interface\\AddOns\\CustomNameplates\\Fonts\\PFDinDisplayPro-Med.ttf",  
  ["point"]="BOTTOM",
  ["anchorpoint"]="TOP",
  ["xoffs"]=0,                  -- horizontal offset (+ moves it right, - left)
  ["yoffs"]=-4                  -- vertical offset (+ moves it up, - moves it down) 
}
local leveltext = {
  ["hide"]=false,
  ["size"]=11,
                                -- if non default the font file must be copied in CustomNameplates\Fonts\  
  ["font"]="Interface\\AddOns\\CustomNameplates\\Fonts\\YanoneKaffeesatzRegular.ttf",
  ["point"]="TOPLEFT",
  ["anchorpoint"]="BOTTOMLEFT",
  ["xoffs"]=2.5,                  -- horizontal offset (+ moves it right, - left)
  ["yoffs"]=8                   -- vertical offset (+ moves it up, - moves it down)
}

local combopoints = {
  ["hide"]=false,
  ["size"]=18,
                                -- if non default the font file must be copied in CustomNameplates\Fonts\  
  ["font"]=STANDARD_TEXT_FONT,
  ["point"]="TOP",
  ["anchorpoint"]="TOP",
  ["xoffs"]=0,                  -- horizontal offset (+ moves it right, - left)
  ["yoffs"]=-8                   -- vertical offset (+ moves it up, - moves it down)
}
-- SETTINGS END --


-- DO NOT MODIFY ANYTHING BELOW --
local _G = getfenv(0)
_G["CustomNameplatesSettings"] = {
  ["genSettings"] = genSettings,
  ["raidicon"] = raidicon,
  ["debufficon"] = debufficon,
  ["classicon"] = classicon,
  ["targetindicator"] = targetindicator,
  ["nametext"] = nametext,
  ["leveltext"] = leveltext,
  ["combopoints"] = combopoints,
}