--[[
	
	AtlasQuest, a World of Warcraft addon.
	Email me at mystery8@gmail.com
	
	This file is part of AtlasQuest.
	
	AtlasQuest is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.
	
	AtlasQuest is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with AtlasQuest; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
	
--]]


-----------------------------------------------------------------------------
-- This functions returns AQINSTANCE with a number
-- that tells which instance is shown atm for Atlas or AlphaMap
-----------------------------------------------------------------------------
function AtlasQuest_Instanzenchecken()
	AQATLASMAP = AtlasMap:GetTexture()
	
	
	-- Original Instances
	
	if AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheDeadmines" or AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheDeadminesEnt" then
		AQINSTANCE = 1
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\WailingCaverns" or AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\WailingCavernsEnt" then
		AQINSTANCE = 2
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\RagefireChasm" then
		AQINSTANCE = 3
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Uldaman" or AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\UldamanEnt" then
		AQINSTANCE = 4
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackrockDepths" then
		AQINSTANCE = 5
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackwingLair" then
		AQINSTANCE = 6
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackfathomDeeps" or AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackfathomDeepsEnt" then
		AQINSTANCE = 7
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackrockSpireLower" then
		AQINSTANCE = 8
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackrockSpireUpper" then
		AQINSTANCE = 9
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\DireMaulEast" then
		AQINSTANCE = 10
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\DireMaulNorth" then
		AQINSTANCE = 11
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\DireMaulWest" then
		AQINSTANCE = 12
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Maraudon" or AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\MaraudonEnt" then
		AQINSTANCE = 13
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\MoltenCore" then
		AQINSTANCE = 14
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Naxxramas" then
		AQINSTANCE = 15
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\OnyxiasLair" then
		AQINSTANCE = 16
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\RazorfenDowns" then
		AQINSTANCE = 17
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\RazorfenKraul" then
		AQINSTANCE = 18
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\SMLibrary" then
		AQINSTANCE = 19
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\SMArmory" then
		AQINSTANCE = 20
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\SMCathedral" then
		AQINSTANCE = 21
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\SMGraveyard" then
		AQINSTANCE = 22
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Scholomance" then
		AQINSTANCE = 23
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\ShadowfangKeep" then
		AQINSTANCE = 24
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Stratholme" then
		AQINSTANCE = 25
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheRuinsofAhnQiraj" then
		AQINSTANCE = 26
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheStockade" then
		AQINSTANCE = 27
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheSunkenTemple" or AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheSunkenTempleEnt" then
		AQINSTANCE = 28
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheTempleofAhnQiraj" then
		AQINSTANCE = 29
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\ZulFarrak" then
		AQINSTANCE = 30
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\ZulGurub" then
		AQINSTANCE = 31
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Gnomeregan" or AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\GnomereganEnt" then
		AQINSTANCE = 32
		
		-- Outdoor Raids
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\FourDragons" then
		AQINSTANCE = 33
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Azuregos" then
		AQINSTANCE = 34
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\LordKazzak" then
		AQINSTANCE = 35
		
		-- Battlegrounds
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\AlteracValleyNorth" then
		AQINSTANCE = 36
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\AlteracValleySouth" then
		AQINSTANCE = 36
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\ArathiBasin" then
		AQINSTANCE = 37
		
	elseif AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\WarsongGulch" then
		AQINSTANCE = 38
		
		
		-- Default
		
	else --added for newer atlas version until i update atlasquest and for the flight pass maps
		AQINSTANCE = 99
	end
end


-----------------------------------------------------------------------------
-- Alpha Map Support 
-----------------------------------------------------------------------------

function AtlasQuest_InstanzencheckAM()
	AQALPHAMAP = AlphaMapAlphaMapTexture:GetTexture()
	
	
	-- Original Instances
	
	if AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TheDeadmines" or AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\TheDeadminesExt" then
		AQINSTANCE = 1
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\WailingCaverns" or AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\WailingCavernsExt" then
		AQINSTANCE = 2
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\RagefireChasm" then
		AQINSTANCE = 3
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Uldaman" or AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\UldamanExt" then
		AQINSTANCE = 4
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\BlackrockDepths" then
		AQINSTANCE = 5
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\BlackwingLair" then
		AQINSTANCE = 6
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\BlackfathomDeeps" or AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\BlackfathomDeepsExt" then
		AQINSTANCE = 7
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\LBRS" then
		AQINSTANCE = 8
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\UBRS" then
		AQINSTANCE = 9
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\DMEast" then
		AQINSTANCE = 10
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\DMNorth" then
		AQINSTANCE = 11
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\DMWest" then
		AQINSTANCE = 12
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Maraudon" or AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\MaraudonExt" then
		AQINSTANCE = 13
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\MoltenCore" then
		AQINSTANCE = 14
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Naxxramas" then
		AQINSTANCE = 15
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\OnyxiasLair" then
		AQINSTANCE = 16
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\RazorfenDowns" then
		AQINSTANCE = 17
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\RazorfenKraul" then
		AQINSTANCE = 18
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ScarletMonastery" then
		AQINSTANCE = 19
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Scholomance" then
		AQINSTANCE = 23
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ShadowfangKeep" then
		AQINSTANCE = 24
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Stratholme" then
		AQINSTANCE = 25
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\RuinsofAhnQiraj" then
		AQINSTANCE = 26
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TheStockade" then
		AQINSTANCE = 27
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TheSunkenTemple" or AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\SunkenTempleExt" then
		AQINSTANCE = 28
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TempleofAhnQiraj" then
		AQINSTANCE = 29
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ZulFarrak" then
		AQINSTANCE = 30
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ZulGurub" then
		AQINSTANCE = 31
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Gnomeregan" or AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\GnomereganExt" then
		AQINSTANCE = 32
		
		
		-- Battlegrounds
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Battlegrounds\\Maps\\AlteracValley" then
		AQINSTANCE = 36
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Battlegrounds\\Maps\\ArathiBasin" then
		AQINSTANCE = 37
		
	elseif AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Battlegrounds\\Maps\\WarsongGulch" then
		AQINSTANCE = 38
		
		
		-- Default
		
	else
		AQINSTANCE = 99
	end
	
	-----------------------------------------------------------------------------
	-- function to work with outdoor boss @ alphamap
	-----------------------------------------------------------------------------
	
	if AlphaMapAlphaMapFrame:IsVisible() then
		if GamAlphaMapMap ~= nil then -- check to prevent errors (post ui.worldofwar dunno why error ocour)
			if GamAlphaMapMap.type == AM_TYP_WORLDBOSSES then
				if GamAlphaMapMap.filename == "AM_Kazzak_Map" then
					AQINSTANCE = 35
				elseif GamAlphaMapMap.filename == "AM_Azuregos_Map" then
					AQINSTANCE = 34
				elseif GamAlphaMapMap.filename == "AM_Dragon_Duskwood_Map" then
					AQINSTANCE = 33
				elseif GamAlphaMapMap.filename == "AM_Dragon_Hinterlands_Map" then
					AQINSTANCE = 33
				elseif GamAlphaMapMap.filename == "AM_Dragon_Feralas_Map" then
					AQINSTANCE = 33
				elseif GamAlphaMapMap.filename == "AM_Dragon_Ashenvale_Map" then
					AQINSTANCE = 33
				else
					AQINSTANCE = 99
				end
			end
		end
	end
end


---------------------------
--- AQ Instance Numbers ---
---------------------------

-- 1 = Deadmines (VC)
-- 2 = Wailing Caverns (WC)
-- 3 = Ragefire Chasm (RFC)
-- 4 = Uldaman (ULD)
-- 5 = Blackrock Depths (BRD)
-- 6 = Blackwing Lair (BWL)
-- 7 = Blackfathom Deeps (BFD)
-- 8 = Lower Blackrock Spire (LBRS)
-- 9 = Upper Blackrock Spire (UBRS)
-- 10 = Dire Maul East (DM)
-- 11 = Dire Maul North (DM)
-- 12 = Dire Maul West (DM)
-- 13 = Maraudon (Mara)
-- 14 = Molten Core (MC)
-- 15 = Naxxramas (Naxx)
-- 16 = Onyxia's Lair (Ony)
-- 17 = Razorfen Downs (RFD)
-- 18 = Razorfen Kraul (RFK)
-- 19 = SM: Library (SM Lib)
-- 20 = SM: Armory (SM Arm)
-- 21 = SM: Cathedral (SM Cath)
-- 22 = SM: Graveyard (SM GY)
-- 23 = Scholomance (Scholo)
-- 24 = Shadowfang Keep (SFK)
-- 25 = Stratholme (Strat)
-- 26 = The Ruins of Ahn'Qiraj (AQ20)
-- 27 = The Stockade (Stocks)
-- 28 = Sunken Temple (ST)
-- 29 = The Temple of Ahn'Qiraj (AQ40)
-- 30 = Zul'Farrak (ZF)
-- 31 = Zul'Gurub (ZG)
-- 32 = Gnomeregan (Gnomer)
-- 33 = Four Dragons
-- 34 = Azuregos
-- 35 = Lord Kazzak
-- 36 = Alterac Valley (AV)
-- 37 = Arathi Basin (AB)
-- 38 = Warsong Gulch (WSG)
-- 99 = default "rest"