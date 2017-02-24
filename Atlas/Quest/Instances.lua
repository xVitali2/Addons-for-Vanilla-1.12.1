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
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with AtlasQuest; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]


-----------------------------------------------------------------------------
-- This functions returns AQINSTANZ with a number
-- that tells which instance is shown atm for Atlas or AlphaMap
-----------------------------------------------------------------------------
function AtlasQuest_Instanzenchecken()
	AQATLASMAP = AtlasMap:GetTexture()


	-- Original Instances

	if (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheDeadmines") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheDeadminesEnt") then
		AQINSTANZ = 1;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\WailingCaverns") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\WailingCavernsEnt") then
		AQINSTANZ = 2;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\RagefireChasm") then
		AQINSTANZ = 3;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Uldaman") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\UldamanEnt") then
		AQINSTANZ = 4;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackrockDepths") then
		AQINSTANZ = 5;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackwingLair") then
		AQINSTANZ = 6;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackfathomDeeps") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackfathomDeepsEnt") then
		AQINSTANZ = 7;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackrockSpireLower") then
		AQINSTANZ = 8;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackrockSpireUpper") then
		AQINSTANZ = 9;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\DireMaulEast") then
		AQINSTANZ = 10;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\DireMaulNorth") then
		AQINSTANZ = 11;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\DireMaulWest") then
		AQINSTANZ = 12;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Maraudon") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\MaraudonEnt") then
		AQINSTANZ = 13;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\MoltenCore") then
		AQINSTANZ = 14;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Naxxramas") then
		AQINSTANZ = 15;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\OnyxiasLair") then
		AQINSTANZ = 16;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\RazorfenDowns") then
		AQINSTANZ = 17;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\RazorfenKraul") then
		AQINSTANZ = 18;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\SMLibrary") then
		AQINSTANZ = 19;
		
	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\SMArmory") then
		AQINSTANZ = 20;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\SMCathedral") then
		AQINSTANZ = 21;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\SMGraveyard") then
		AQINSTANZ = 22;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Scholomance") then
		AQINSTANZ = 23;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\ShadowfangKeep") then
		AQINSTANZ = 24;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Stratholme") then
		AQINSTANZ = 25;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheRuinsofAhnQiraj") then
		AQINSTANZ = 26;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheStockade") then
		AQINSTANZ = 27;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheSunkenTemple") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheSunkenTempleEnt") then
		AQINSTANZ = 28;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheTempleofAhnQiraj") then
		AQINSTANZ = 29;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\ZulFarrak") then
		AQINSTANZ = 30;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\ZulGurub") then
		AQINSTANZ = 31;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Gnomeregan") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\GnomereganEnt") then
		AQINSTANZ = 32;

	-- Outdoor Raids

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\FourDragons")  then
		AQINSTANZ = 33;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Azuregos")  then
		AQINSTANZ = 34;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\LordKazzak")  then
		AQINSTANZ = 35;

	-- Battlegrounds

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\AlteracValleyNorth") then
		AQINSTANZ = 36;

	elseif (AQATLASMAP ==  "Interface\\AddOns\\Atlas\\Images\\Maps\\AlteracValleySouth") then
		AQINSTANZ = 36;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\ArathiBasin") then
		AQINSTANZ = 37;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\WarsongGulch") then
		AQINSTANZ = 38;


	-- Default

	else --added for newer atlas version until i update atlasquest and for the flight pass maps
		AQINSTANZ = 99;
	end
end


-----------------------------------------------------------------------------
-- Alpha Map Support 
-----------------------------------------------------------------------------

function AtlasQuest_InstanzencheckAM()
	AQALPHAMAP = AlphaMapAlphaMapTexture:GetTexture();


	-- Original Instances

	if (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TheDeadmines") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\TheDeadminesExt") then
		AQINSTANZ = 1;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\WailingCaverns") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\WailingCavernsExt") then
		AQINSTANZ = 2;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\RagefireChasm") then
		AQINSTANZ = 3;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Uldaman") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\UldamanExt") then
		AQINSTANZ = 4;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\BlackrockDepths") then
		AQINSTANZ = 5;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\BlackwingLair") then
		AQINSTANZ = 6;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\BlackfathomDeeps") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\BlackfathomDeepsExt") then
		AQINSTANZ = 7;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\LBRS") then
		AQINSTANZ = 8;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\UBRS") then
		AQINSTANZ = 9;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\DMEast") then
		AQINSTANZ = 10;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\DMNorth") then
		AQINSTANZ = 11;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\DMWest") then
		AQINSTANZ = 12;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Maraudon") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\MaraudonExt") then
		AQINSTANZ = 13;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\MoltenCore") then
		AQINSTANZ = 14;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Naxxramas") then
		AQINSTANZ = 15;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\OnyxiasLair") then
		AQINSTANZ = 16;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\RazorfenDowns") then
		AQINSTANZ = 17;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\RazorfenKraul") then
		AQINSTANZ = 18;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ScarletMonastery") then
		AQINSTANZ = 19;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Scholomance") then
		AQINSTANZ = 23;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ShadowfangKeep") then
		AQINSTANZ = 24;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Stratholme") then
		AQINSTANZ = 25;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\RuinsofAhnQiraj") then
		AQINSTANZ = 26;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TheStockade") then
		AQINSTANZ = 27;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TheSunkenTemple") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\SunkenTempleExt") then
		AQINSTANZ = 28;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TempleofAhnQiraj") then
		AQINSTANZ = 29;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ZulFarrak") then
		AQINSTANZ = 30;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ZulGurub") then
		AQINSTANZ = 31;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Gnomeregan") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\GnomereganExt") then
		AQINSTANZ = 32;


	-- Battlegrounds

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Battlegrounds\\Maps\\AlteracValley") then
		AQINSTANZ = 36;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Battlegrounds\\Maps\\ArathiBasin") then
		AQINSTANZ = 37;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Battlegrounds\\Maps\\WarsongGulch") then
		AQINSTANZ = 38;


	-- Default

	else
		AQINSTANZ = 99;
	end

-----------------------------------------------------------------------------
-- function to work with outdoor boss @ alphamap
-----------------------------------------------------------------------------

	if (AlphaMapAlphaMapFrame:IsVisible()) then
		if (GamAlphaMapMap ~= nil) then -- check to prevent errors (post  ui.worldofwar dunno why error ocour)
			if (GamAlphaMapMap.type == AM_TYP_WORLDBOSSES) then
				if (GamAlphaMapMap.filename == "AM_Kazzak_Map") then
					AQINSTANZ = 35;
				elseif (GamAlphaMapMap.filename == "AM_Azuregos_Map") then
					AQINSTANZ = 34;
				elseif (GamAlphaMapMap.filename == "AM_Dragon_Duskwood_Map") then
					AQINSTANZ = 33;
				elseif (GamAlphaMapMap.filename == "AM_Dragon_Hinterlands_Map") then
					AQINSTANZ = 33;
				elseif (GamAlphaMapMap.filename == "AM_Dragon_Feralas_Map") then
					AQINSTANZ = 33;
				elseif (GamAlphaMapMap.filename == "AM_Dragon_Ashenvale_Map") then
					AQINSTANZ = 33;
				else
					AQINSTANZ = 99;
				end
			end
		end
	end

end


---------------------------
--- AQ Instance Numbers ---
---------------------------

-- 1  = Deadmines (VC)
-- 2  = Wailing Caverns (WC)
-- 3  = Ragefire Chasm (RFC)
-- 4  = Uldaman (ULD)
-- 5  = Blackrock Depths (BRD)
-- 6  = Blackwing Lair (BWL)
-- 7  = Blackfathom Deeps (BFD)
-- 8  = Lower Blackrock Spire (LBRS)
-- 9  = Upper Blackrock Spire (UBRS)
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
-- 99 =  default "rest"