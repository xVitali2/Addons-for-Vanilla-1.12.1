--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 - 2008 Dan Gilbert
	Email me at loglow@gmail.com

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]

-- Credit goes to Krakhaan of Khaz'goroth for providing basic Titan Panel support

TITAN_ATLAS_ID = "Atlas";

function TitanPanelAtlasButton_OnLoad()

	-- register plugin
	this.registry = { 
		id = TITAN_ATLAS_ID,
		menuText = ATLAS_TITLE,
		buttonTextFunction = "TitanPanelAtlasButton_GetButtonText",
		tooltipTitle = ATLAS_TITLE,
		tooltipTextFunction = "TitanPanelAtlasButton_GetTooltipText",
		icon = "Interface\\WorldMap\\WorldMap-Icon",
		iconWidth = 16,
		savedVariables = {
			ShowIcon = 1,
			ShowLabelText = 1,
			ShowColoredText = 1,
			ShowMapName = 1
		}
	};
	TitanPanelAtlasButtonIcon:SetVertexColor(1, 1, 0);
end

function TitanPanelAtlasButton_GetButtonText(id)
	local retstr = "";
	
	-- supports turning off labels
	if ( TitanGetVar(TITAN_ATLAS_ID, "ShowLabelText") ) then	
		retstr = ATLAS_TITLE;
		if ( TitanGetVar(TITAN_ATLAS_ID, "ShowMapName") ) then
			retstr = retstr..": ";
		end
	end
	
	if ( TitanGetVar(TITAN_ATLAS_ID, "ShowMapName") ) then

		local zoneID = ATLAS_DROPDOWNS[AtlasOptions.AtlasType][AtlasOptions.AtlasZone];
		local name = AtlasMaps[zoneID].ZoneName[1];
			
		
		if ( TitanGetVar(TITAN_ATLAS_ID, "ShowColoredText") ) then	
			retstr = retstr..TitanUtils_GetGreenText(name);
		else
			retstr = retstr..TitanUtils_GetNormalText(name);
		end
		
	end
	
	if (
	not TitanGetVar(TITAN_ATLAS_ID, "ShowIcon") and
	not TitanGetVar(TITAN_ATLAS_ID, "ShowLabelText") and
	not TitanGetVar(TITAN_ATLAS_ID, "ShowMapName") ) then
		return "A";
	end

	return retstr;
end

function TitanPanelAtlasButton_GetTooltipText()
	return ATLAS_TITAN_HINT;
end

function TitanPanelAtlasButton_MapNameToggle()
	TitanToggleVar(TITAN_ATLAS_ID, "ShowMapName");
	TitanPanelButton_UpdateButton("Atlas");
end

function TitanPanelRightClickMenu_PrepareAtlasMenu()
	TitanPanelRightClickMenu_AddTitle(TitanPlugins[TITAN_ATLAS_ID].menuText);
	
	TitanPanelRightClickMenu_AddSpacer();
	
	TitanPanelRightClickMenu_AddToggleIcon(TITAN_ATLAS_ID);
	TitanPanelRightClickMenu_AddToggleLabelText(TITAN_ATLAS_ID);
	TitanPanelRightClickMenu_AddToggleColoredText(TITAN_ATLAS_ID);
	
	info = {};
	info.text = ATLAS_OPTIONS_SHOWMAPNAME;
	info.func = TitanPanelAtlasButton_MapNameToggle;
	info.checked = TitanGetVar(TITAN_ATLAS_ID, "ShowMapName");
	UIDropDownMenu_AddButton(info);
	
	TitanPanelRightClickMenu_AddSpacer();	
	
	TitanPanelRightClickMenu_AddCommand(TITAN_PANEL_MENU_HIDE, TITAN_ATLAS_ID, TITAN_PANEL_MENU_FUNC_HIDE);
end
