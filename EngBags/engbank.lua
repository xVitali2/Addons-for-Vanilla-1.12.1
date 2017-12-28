-- Constants
EngBank_DEBUGMESSAGES = 0;         -- 0 = off, 1 = on
EngBank_SHOWITEMDEBUGINFO = 0;
EngBank_WIPECONFIGONLOAD = 0;	-- for debugging, test it out on a new config every load
BINDING_HEADER_EngBank = "EngBank @ EngBags";
BINDING_NAME_EB_TOGGLE = "Toggle Bank Window";
EngBank_MAXBUTTONS = 144;
EngBank_TOP_PADWINDOW = 75;
EngBank_WINDOWBOTTOMPADDING_EDITMODE = 50;
EngBank_WINDOWBOTTOMPADDING_NORMALMODE = 25;
EngBank_WindowBottomPadding = EngBank_WINDOWBOTTOMPADDING_NORMALMODE;
EngBank_AtBank = 0;
EngReplaceBank          = 1;
local BankFrame_Saved = nil;

EngBank_item_cache = { {}, {}, {}, {}, {}, {}, {} };	-- cache of all the items as they appear in bags
EngBank_bar_positions = {};
EngBank_buttons = {};
EngBank_hilight_new = 0;
EngBank_edit_mode = 0;
EngBank_edit_hilight = "";         -- when editmode is 1, which items do you want to hilight
EngBank_edit_selected = "";        -- when editmode is 1, this is the class of item you clicked on
EngBank_RightClickMenu_mode = "";
EngBank_RightClickMenu_opts = {};
EngBank_Bags = { -1, 5, 6, 7, 8, 9, 10}
EngBags_Bars = {"first", "second", "third"}
EngBank_NOTNEEDED = 0;	-- when items haven't changed, or only item counts
EngBank_REQUIRED = 1;	-- when items have changed location, but it's been sorted once and won't break if we don't sort again
EngBank_MANDATORY = 2;	-- it's never been sorted, the window is in an unstable state, you MUST sort.
EngBank_resort_required = EngBank_MANDATORY;
EngBank_window_update_required = EngBank_MANDATORY;

EngBank_BuildTradeList = {};	-- only build a full list of trade skill info once

EngBank_Catagories_Exclude_List = {};

EngBank_ConfigOptions_Default = {
	{
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 1.0, ["color"] = { 1,0,0.25 }, ["align"] = "center",
		  ["text"] = "Window Options" },
	},
	{},	---------------------------------------------------------------------------------------
	
	{	-- Window Columns
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Columns:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = EngBags_MAXCOLUMNS_MIN },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = EngBags_MAXCOLUMNS_MIN, ["maxValue"] = EngBags_MAXCOLUMNS_MAX, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngBankConfig["maxColumns"];
			end,
		  ["func"] = function(v)
				EngBankConfig["maxColumns"] = tonumber(v);
				EngBank_SetDefaultValues(0);
				EngBank_window_update_required = EngBank_MANDATORY;
				EngBank_UpdateWindow();
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = EngBags_MAXCOLUMNS_MAX }
	},

	{	-- Button Size
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Button Size:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = EngBags_BUTTONSIZE_MIN },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = EngBags_BUTTONSIZE_MIN, ["maxValue"] = EngBags_BUTTONSIZE_MAX, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngBankConfig["frameButtonSize"];
			end,
		  ["func"] = function(v)
				EngBankConfig["frameButtonSize"] = tonumber(v);
				EngBank_SetDefaultValues(0);
				EngBank_window_update_required = EngBank_MANDATORY;
				EngBank_UpdateWindow();
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = EngBags_BUTTONSIZE_MAX }
	},

	{	-- Font Size / item count
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Item count font size:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = EngBags_FONTSIZE_MIN },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = EngBags_FONTSIZE_MIN, ["maxValue"] = EngBags_FONTSIZE_MAX, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngBankConfig["button_size_opts"]["EngBags_BUTTONFONTHEIGHT"];
			end,
		  ["func"] = function(v)
				EngBankConfig["button_size_opts"]["EngBags_BUTTONFONTHEIGHT"] = tonumber(v);
				EngBank_SetDefaultValues(0);
				EngBank_window_update_required = EngBank_MANDATORY;
				EngBank_UpdateWindow();
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = EngBags_FONTSIZE_MAX }
	},

	{	-- Font Size / New text
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "New tag font size:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = EngBags_FONTSIZE_MIN },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = EngBags_FONTSIZE_MIN, ["maxValue"] = EngBags_FONTSIZE_MAX, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngBankConfig["button_size_opts"]["EngBags_BUTTONFONTHEIGHT2"];
			end,
		  ["func"] = function(v)
				EngBankConfig["button_size_opts"]["EngBags_BUTTONFONTHEIGHT2"] = tonumber(v);
				EngBank_SetDefaultValues(0);
				EngBank_window_update_required = EngBank_MANDATORY;
				EngBank_UpdateWindow();
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = EngBags_FONTSIZE_MAX }
	},

	{},	---------------------------------------------------------------------------------------
	{
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 1.0, ["color"] = { 1,0,0.25 }, ["align"] = "center",
		  ["text"] = "Display Strings & New Item Settings" },
	},
	{},	---------------------------------------------------------------------------------------
	{	-- "New" Text
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.5, ["color"] = { 1,1,0.25 },
		  ["text"] = "New item text:" },
		{ ["type"] = "Edit", ["ID"] = 1, ["width"] = 0.2, ["letters"]=10,
		  ["defaultValue"] = function()
				return EngBankConfig["newItemText"];
			end,
		  ["func"] = function(v)
				EngBankConfig["newItemText"] = v;
				EngBank_window_update_required = EngBank_MANDATORY;
				EngBank_UpdateWindow();
			end
		},
	},
	{	-- Item count increased text
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.5, ["color"] = { 1,1,0.25 },
		  ["text"] = "Item count increased:" },
		{ ["type"] = "Edit", ["ID"] = 1, ["width"] = 0.2, ["letters"]=10,
		  ["defaultValue"] = function()
				return EngBankConfig["newItemTextPlus"];
			end,
		  ["func"] = function(v)
				EngBankConfig["newItemTextPlus"] = v;
				EngBank_window_update_required = EngBank_MANDATORY;
				EngBank_UpdateWindow();
			end
		},
	},
	{	-- Item count decreased text
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.5, ["color"] = { 1,1,0.25 },
		  ["text"] = "Item count decreased:" },
		{ ["type"] = "Edit", ["ID"] = 1, ["width"] = 0.2, ["letters"]=10,
		  ["defaultValue"] = function()
				return EngBankConfig["newItemTextMinus"];
			end,
		  ["func"] = function(v)
				EngBankConfig["newItemTextMinus"] = v;
				EngBank_window_update_required = EngBank_MANDATORY;
				EngBank_UpdateWindow();
			end
		},
	},
	{	-- New Tag timing
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.5, ["color"] = { 1,1,0.25 }, ["text"] = "Timeout for new tag - older (Minutes):" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.5, ["minValue"] = 0, ["maxValue"] = 60*6, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return ceil(EngBankConfig["newItemTimeout"] / 60);
			end,
		  ["func"] = function(v)
				EngBankConfig["newItemTimeout"] = tonumber(v) * 60;
				EngBank_SetDefaultValues(0);
				EngBank_window_update_required = EngBank_MANDATORY;
				EngBank_UpdateWindow();
			end
		}
	},
	{	-- New Tag timing
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.5, ["color"] = { 1,1,0.25 }, ["text"] = "Timeout for new tag - newer (Minutes):" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.5, ["minValue"] = 0, ["maxValue"] = 60*1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return ceil(EngBankConfig["newItemTimeout2"] / 60);
			end,
		  ["func"] = function(v)
				EngBankConfig["newItemTimeout2"] = tonumber(v) * 60;
				EngBank_SetDefaultValues(0);
				EngBank_window_update_required = EngBank_MANDATORY;
				EngBank_UpdateWindow();
			end
		}
	},


	{},	---------------------------------------------------------------------------------------
	{
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 1.0, ["color"] = { 1,0,0.25 }, ["align"] = "center",
		  ["text"] = "Bag Hooks" },
	},
	{},	---------------------------------------------------------------------------------------
	{	-- Hook "Bank"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Bank:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngBankConfig["hook_BANKFRAME_OPENED"];
			end,
		  ["func"] = function(v)
				EngBankConfig["hook_BANKFRAME_OPENED"] = tonumber(v);
				EngBank_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},

	{	-- Show "Bank"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Include Bank:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngBankConfig["show_Bag-1"];
			end,
		  ["func"] = function(v)
				EngBankConfig["show_Bag-1"] = tonumber(v);
				EngBank_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},
	{	-- Show "Bag 5"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Include Bag 1 Contents:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngBankConfig["show_Bag5"];
			end,
		  ["func"] = function(v)
				EngBankConfig["show_Bag5"] = tonumber(v);
				EngBank_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},

	{	-- Show "Bag 6"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Include Bag 2 Contents:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngBankConfig["show_Bag6"];
			end,
		  ["func"] = function(v)
				EngBankConfig["show_Bag6"] = tonumber(v);
				EngBank_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},

	{	-- Show "Bag 7"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Include Bag 3 Contents:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngBankConfig["show_Bag7"];
			end,
		  ["func"] = function(v)
				EngBankConfig["show_Bag7"] = tonumber(v);
				EngBank_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},

	{	-- Show "Bag 8"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Include Bag 4 Contents:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngBankConfig["show_Bag8"];
			end,
		  ["func"] = function(v)
				EngBankConfig["show_Bag8"] = tonumber(v);
				EngBank_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},

	{	-- Show "Bag 9"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Include Bag 5 Contents:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngBankConfig["show_Bag9"];
			end,
		  ["func"] = function(v)
				EngBankConfig["show_Bag9"] = tonumber(v);
				EngBank_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},

	{	-- Show "Bag 10"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Include Bag 6 Contents:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngBankConfig["show_Bag10"];
			end,
		  ["func"] = function(v)
				EngBankConfig["show_Bag10"] = tonumber(v);
				EngBank_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},

	{},	---------------------------------------------------------------------------------------
	{
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 1.0, ["color"] = { 1,0,0.25 }, ["align"] = "center",
		  ["text"] = "Misc Options" },
	},
	{},	---------------------------------------------------------------------------------------
	{	-- Build trade skill list for export
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Build trade skill list for export:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngBankConfig["build_trade_list"];
			end,
		  ["func"] = function(v)
				EngBankConfig["build_trade_list"] = tonumber(v);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},

	{	-- Tooltip Mode Setting
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Tooltip Mode:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Mode 1" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngBankConfig["tooltip_mode"];
			end,
		  ["func"] = function(v)
				EngBankConfig["tooltip_mode"] = tonumber(v);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "Mode 2" }
	},


	{},	---------------------------------------------------------------------------------------
	{
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 1.0, ["color"] = { 1,0,0.25 }, ["align"] = "center",
		  ["text"] = "Item Search and Assignment" },
	},
	{},	---------------------------------------------------------------------------------------
	{
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.025+0.025+0.025 + 0.005, ["color"] = { 1,0,0.25 }, ["text"] = "" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.20, ["color"] = { 1,0,0.25 }, ["text"] = "Category" },
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.20, ["color"] = { 1,0,0.25 }, ["text"] = "Keywords" },
		{ ["type"] = "Text", ["ID"] = 4, ["width"] = 0.35, ["color"] = { 1,0,0.25 }, ["text"] = "Tooltip Search" },
		{ ["type"] = "Text", ["ID"] = 5, ["width"] = 0.170, ["color"] = { 1,0,0.25 }, ["text"] = "ItemType" }
	}
};


--EngBank_ConfigOptions = EngBank_ConfigOptions_Default;

function EngBank_Config_GetItemSearchList(key, idx)
	return EngBankConfig["item_search_list"][key][idx]
end
function EngBank_Config_AssignItemSearchList(v, key, idx)
	if (key ~= nil) then
		EngBankConfig["item_search_list"][key][idx] = v;
	end
end

function EngBank_Config_GetItemSearchListLower(key, idx)
	return string.lower(EngBankConfig["item_search_list"][key][idx]);
end
function EngBank_Config_AssignItemSearchListUpper(v, key, idx)
	if (key ~= nil) then
		EngBankConfig["item_search_list"][key][idx] = string.upper(v);
	end
end

function EngBank_Config_SwapSearchListItems(unused_value, key1, key2)
	local tmp;

	if ( (EngBankConfig["item_search_list"][key1] ~= nil) and (EngBankConfig["item_search_list"][key2] ~= nil) ) then
		tmp = EngBankConfig["item_search_list"][key1];
		EngBankConfig["item_search_list"][key1] = EngBankConfig["item_search_list"][key2];
		EngBankConfig["item_search_list"][key2] = tmp;

		if (key1 > key2) then
			EngBank_Opts_CurrentPosition = EngBank_Opts_CurrentPosition - 1;
		else
			EngBank_Opts_CurrentPosition = EngBank_Opts_CurrentPosition + 1;
		end

		EngBank_Options_UpdateWindow();
	end
end

function EngBank_CreateConfigOptions()
	local key,value;

	EngBank_ConfigOptions = EngBank_ConfigOptions_Default;

	for key,value in EngBankConfig["item_search_list"] do
		table.insert( EngBank_ConfigOptions,
			{
{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.025, ["color"] = { 1,0,1 }, ["text"] = key.."." },
{ ["type"] = "UpButton", ["ID"] = 1, ["width"] = 0.025,
  ["param1"] = key, ["param2"] = key-1,
  ["func"] = EngBank_Config_SwapSearchListItems
},
{ ["type"] = "DownButton", ["ID"] = 1, ["width"] = 0.025,
  ["param1"] = key, ["param2"] = key+1,
  ["func"] = EngBank_Config_SwapSearchListItems
},
{ ["type"] = "Edit", ["ID"] = 1, ["width"] = 0.20, ["letters"]=50, ["param1"] = key, ["param2"] = 1,
  ["defaultValue"] = EngBank_Config_GetItemSearchListLower, ["func"] = EngBank_Config_AssignItemSearchListUpper
},
{ ["type"] = "Edit", ["ID"] = 2, ["width"] = 0.20, ["letters"]=50, ["param1"] = key, ["param2"] = 2,
  ["defaultValue"] = EngBank_Config_GetItemSearchListLower, ["func"] = EngBank_Config_AssignItemSearchListUpper
},
{ ["type"] = "Edit", ["ID"] = 3, ["width"] = 0.35, ["letters"]=50, ["param1"] = key, ["param2"] = 3,
  ["defaultValue"] = EngBank_Config_GetItemSearchList, ["func"] = EngBank_Config_AssignItemSearchList
},
{ ["type"] = "Edit", ["ID"] = 4, ["width"] = 0.175, ["letters"]=50, ["param1"] = key, ["param2"] = 4,
  ["defaultValue"] = EngBank_Config_GetItemSearchList, ["func"] = EngBank_Config_AssignItemSearchList
}
			}  );
	
	end

end

------------------------

function EngBank_CalcButtonSize(newsize)
	local k = "button_size_opts";
	-- constants
	EngBags_BUTTONFRAME_X_PADDING = 2;
	EngBags_BUTTONFRAME_Y_PADDING = 1;
	EngBags_BUTTONFRAME_BUTTONWIDTH = newsize;
	EngBags_BUTTONFRAME_BUTTONHEIGHT = newsize;
	EngBags_BUTTONFRAME_WIDTH = EngBags_BUTTONFRAME_BUTTONWIDTH + (EngBags_BUTTONFRAME_X_PADDING*2);
	EngBags_BUTTONFRAME_HEIGHT = EngBags_BUTTONFRAME_BUTTONHEIGHT + (EngBags_BUTTONFRAME_Y_PADDING*2);
	EngBags_BKGRFRAME_WIDTH = EngBags_BUTTONFRAME_BUTTONWIDTH * 1.6;
	EngBags_BKGRFRAME_HEIGHT = EngBags_BUTTONFRAME_BUTTONHEIGHT * 1.6;
	EngBags_COOLDOWN_SCALE = 0.02125 * EngBags_BUTTONFRAME_BUTTONWIDTH;

	if (EngBankConfig[k] == nil) then
		EngBankConfig[k] = {
			["EngBags_BUTTONFONTHEIGHT"] = 0.35 * EngBags_BUTTONFRAME_BUTTONHEIGHT,
			["EngBags_BUTTONFONTHEIGHT2"] = 0.30 * EngBags_BUTTONFRAME_BUTTONHEIGHT,
			["EngBank_BUTTONFONTDISTANCE_Y"] = (0.08 * EngBags_BUTTONFRAME_WIDTH),
			["EngBank_BUTTONFONTDISTANCE_X"] = (0.10 * EngBags_BUTTONFRAME_HEIGHT)
		};

		if (newsize == 40) then
			EngBankConfig[k]["EngBags_BUTTONFONTHEIGHT"] = 14;
			EngBankConfig[k]["EngBags_BUTTONFONTHEIGHT2"] = 12;
			EngBankConfig[k]["EngBank_BUTTONFONTDISTANCE_Y"] = 2;
			EngBankConfig[k]["EngBank_BUTTONFONTDISTANCE_X"] = 5;
		end
	end

	EngBags_BUTTONFONTHEIGHT = math.ceil(EngBankConfig[k]["EngBags_BUTTONFONTHEIGHT"]);
	EngBags_BUTTONFONTHEIGHT2 = math.ceil(EngBankConfig[k]["EngBags_BUTTONFONTHEIGHT2"]);
	EngBank_BUTTONFONTDISTANCE_Y = EngBankConfig[k]["EngBank_BUTTONFONTDISTANCE_Y"];
	EngBank_BUTTONFONTDISTANCE_X = EngBankConfig[k]["EngBank_BUTTONFONTDISTANCE_X"];
end

-- scan the config and build a list of catagories
function EngBank_Catagories(exclude_list, select_bar)
	local clist, key, value;

	clist = {};

	for key,value in EngBankConfig do
		if ( (string.find(key, "putinslot--")) and (not string.find(key, "__version")) ) then
			barclass = string.sub(key, 12);

			if ( (exclude_list ~= nil) and (not exclude_list[barclass]) ) then
				if ( (select_bar == nil) or (value==select_bar) ) then
					table.insert(clist, barclass);
				end
			end
		end
	end

	table.sort(clist);

	return(clist);
end


-- sets a default value in the config if the current value is nil.  Increment "resetversion" to override saved values
-- and force a new setting.
function EBank_SetDefault(varname, defaultvalue, resetversion, cleanupfunction, cleanup_param1, cleanup_param2)
	EngBankConfig = EngBagsConfig["Bank"][EngBank_PLAYERID];
	local orig_value = EngBankConfig[varname];

if (orig_value == nil) then
		orig_value = "";
	end

        if (resetversion == nil) then
                -- more debugging
                message("* Warning, EngBank EBank_SetDefault called with nil reset version: "..varname.." *");
                resetversion = 0;
        end

        if (cleanupfunction ~= nil) then
                EngBankConfig[varname] = cleanupfunction(EngBankConfig[varname], cleanup_param1, cleanup_param2);
        end

        if (EngBankConfig[varname] == nil) then
                EngBankConfig[varname] = defaultvalue;
        elseif (EngBankConfig[varname.."__version"] == nil) then
                EngBankConfig[varname] = defaultvalue;
        elseif (EngBankConfig[varname.."__version"] < resetversion) then
		EngBags_PrintDEBUG("old version: "..EngBankConfig[varname.."__version"]..", resetversion: "..resetversion);
                EngBags_Print( varname.." was reset to it's default value.  Changed from '"..orig_value.."' to "..EngBankConfig[varname], 1,0,0 );
                EngBankConfig[varname] = defaultvalue;
        end

        EngBankConfig[varname.."__version"] = resetversion;
end


function EBags_SetDefault(varname, defaultvalue, resetversion, cleanupfunction, cleanup_param1, cleanup_param2)	
	local orig_value = EngBagsConfig[varname];

if (orig_value == nil) then
		orig_value = "";
	end

        if (resetversion == nil) then
                -- more debugging
                message("* Warning, EngBank EBags_SetDefault called with nil reset version: "..varname.." *");
                resetversion = 0;
        end

        if (cleanupfunction ~= nil) then
                EngBagsConfig[varname] = cleanupfunction(EngBagsConfig[varname], cleanup_param1, cleanup_param2);
        end

        if (EngBagsConfig[varname] == nil) then
                EngBagsConfig[varname] = defaultvalue;
        elseif (EngBankConfig[varname.."__version"] == nil) then
                EngBagsConfig[varname] = defaultvalue;
        elseif (EngBankConfig[varname.."__version"] < resetversion) then
		EngBags_PrintDEBUG("old version: "..EngBankConfig[varname.."__version"]..", resetversion: "..resetversion);
                EngBags_Print( varname.." was reset to it's default value.  Changed from '"..orig_value.."' to "..EngBagsConfig[varname], 1,0,0 );
                EngBagsConfig[varname] = defaultvalue;
        end

        EngBankConfig[varname.."__version"] = resetversion;
end

function EngBank_SetClassBars()
	local c = {};
	local localizedPlayerClass, englishClass = UnitClass("player");

	c["WARLOCK"] = "";
	c["MAGE"] = "";
	c["PRIEST"] = "";
	c["HUNTER"] = "";
	c["ROGUE"] = "";
	c["SHAMAN"] = "";
	c["DRUID"] = "";
	c["WARRIOR"] = "";
	c["PALADIN"] = "";

	c[englishClass] = "putinslot--CLASS_ITEMS";

	EngBankConfig["putinslot--SOULSHARDS"] = c["WARLOCK"].."1";
	EngBankConfig["putinslot--WARLOCK_REAGENTS"] = c["WARLOCK"].."2";

	EngBankConfig["putinslot--ROGUE_POISON"] = c["ROGUE"].."1";
	EngBankConfig["putinslot--ROGUE_POWDER"] = c["ROGUE"].."1";

	EngBankConfig["putinslot--MAGE_REAGENT"] = c["MAGE"].."1";

	EngBankConfig["putinslot--SHAMAN_REAGENTS"] = c["SHAMAN"].."1";
	EngBankConfig["putinslot--DRUID_REAGENTS"] = c["DRUID"].."1";
end

-- set "re" to 1 to restore all default values
function EngBank_SetDefaultValues(re)
        local i, key, value, newEngBankConfig;

	local current_config_version = 2;	-- increase this number to wipe everyone's settings

        if ( (EngBankConfig == nil) or (EngBankConfig["configVersion"] == nil) or (EngBankConfig["configVersion"] ~= current_config_version) ) then
                EngBankConfig = { ["configVersion"] = current_config_version };
        end

	EBank_SetDefault("tooltip_mode", 1, 1+re, EngBags_NumericRange, 0, 1);
	EBank_SetDefault("hide_bag_icons", 1, 1+re, EngBags_NumericRange, 0, 1);
	EBank_SetDefault("hide_purchase button", 0, 1+re, EngBags_NumericRange, 0, 1);

        EBank_SetDefault("maxColumns", 9, 1+re, EngBags_NumericRange, EngBags_MAXCOLUMNS_MIN,EngBags_MAXCOLUMNS_MAX);

        EBank_SetDefault("moveLock", 1, 1+re, EngBags_NumericRange, 0,1);

	EBank_SetDefault("hook_BANKFRAME_OPENED", 1, 1+re, EngBags_NumericRange, 0, 1);
	EBank_SetDefault("show_Bag-1", 1, 1+re, EngBags_NumericRange, 0, 1);
	EBank_SetDefault("show_Bag5", 1, 1+re, EngBags_NumericRange, 0, 1);
	EBank_SetDefault("show_Bag6", 1, 1+re, EngBags_NumericRange, 0, 1);
	EBank_SetDefault("show_Bag7", 1, 1+re, EngBags_NumericRange, 0, 1);
	EBank_SetDefault("show_Bag8", 1, 1+re, EngBags_NumericRange, 0, 1);
	EBank_SetDefault("show_Bag9", 1, 1+re, EngBags_NumericRange, 0, 1);
	EBank_SetDefault("show_Bag10", 1, 1+re, EngBags_NumericRange, 0, 1);

	EBank_SetDefault("frameButtonSize", 40, 1+re, EngBags_NumericRange, 15, 80);

	EngBank_CalcButtonSize(EngBankConfig["frameButtonSize"]);

        EBank_SetDefault("frameLEFT", UIParent:GetRight() * UIParent:GetScale() * 0.5, 2+re, EngBags_NumericRange);
        EBank_SetDefault("frameRIGHT", UIParent:GetRight() * UIParent:GetScale() * 0.975, 2+re, EngBags_NumericRange);
        EBank_SetDefault("frameTOP", UIParent:GetTop() * UIParent:GetScale() * 0.90, 2+re, EngBags_NumericRange);
        EBank_SetDefault("frameBOTTOM", UIParent:GetTop() * UIParent:GetScale() * 0.19, 2+re, EngBags_NumericRange);
        EBank_SetDefault("frameXRelativeTo", "RIGHT", 1+re, EngBags_StringChoices, {"RIGHT","LEFT"} );
        EBank_SetDefault("frameYRelativeTo", "BOTTOM", 1+re, EngBags_StringChoices, {"TOP","BOTTOM"} );

	EBank_SetDefault("frameXSpace", 5, 1+re, EngBags_NumericRange, 0, 20);
        EBank_SetDefault("frameYSpace", 5, 1+re, EngBags_NumericRange, 0, 20);

	EBank_SetDefault("show_top_graphics", 1, 1+re, EngBags_NumericRange, 0, 1);
	EBank_SetDefault("build_trade_list", 0, 1+re, EngBags_NumericRange, 0, 1);

        EBank_SetDefault("newItemText", "*New*", 1+re);
        EBank_SetDefault("newItemTextPlus", "++", 1+re);
        EBank_SetDefault("newItemTextMinus", "--", 1+re);
	EBank_SetDefault("newItemText_Off", "", 1+re);
        EBank_SetDefault("newItemTimeout", 60*60*3 , 1+re, EngBags_NumericRange);     -- 3 hours for an item to lose "new" status
        EBank_SetDefault("newItemTimeout2", 60*10 , 1+re, EngBags_NumericRange);      -- 10 minutes
        EBank_SetDefault("newItemColor1_R", 0.9 , 1+re, EngBags_NumericRange, 0, 1.0);
        EBank_SetDefault("newItemColor1_G", 0.9 , 1+re, EngBags_NumericRange, 0, 1.0);
        EBank_SetDefault("newItemColor1_B", 0.2 , 1+re, EngBags_NumericRange, 0, 1.0);
        EBank_SetDefault("newItemColor2_R", 0.0 , 1+re, EngBags_NumericRange, 0, 1.0);
        EBank_SetDefault("newItemColor2_G", 1.0 , 1+re, EngBags_NumericRange, 0, 1.0);
        EBank_SetDefault("newItemColor2_B", 0.4 , 1+re, EngBags_NumericRange, 0, 1.0);

	for i = 1, EngBags_MAINWINDOWCOLORIDX do
		EBank_SetDefault("bar_colors_"..i.."_background_r", 0.5, 1+re, EngBags_NumericRange, 0, 1.0);
		EBank_SetDefault("bar_colors_"..i.."_background_g", 0.0, 1+re, EngBags_NumericRange, 0, 1.0);
		EBank_SetDefault("bar_colors_"..i.."_background_b", 0.0, 1+re, EngBags_NumericRange, 0, 1.0);
		EBank_SetDefault("bar_colors_"..i.."_background_a", 0.5, 1+re, EngBags_NumericRange, 0, 1.0);

		EBank_SetDefault("bar_colors_"..i.."_border_r", 1.0, 1+re, EngBags_NumericRange, 0, 1.0);
		EBank_SetDefault("bar_colors_"..i.."_border_g", 0.0, 1+re, EngBags_NumericRange, 0, 1.0);
		EBank_SetDefault("bar_colors_"..i.."_border_b", 0.0, 1+re, EngBags_NumericRange, 0, 1.0);
		EBank_SetDefault("bar_colors_"..i.."_border_a", 0.5, 1+re, EngBags_NumericRange, 0, 1.0);
	end

	EngBank_SetClassBars();

        -- default slot locations for items
	EBank_SetDefault("putinslot--CLASS_ITEMS1", 15, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--EMPTY_PROJECTILE_SLOTS", 15, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--USED_PROJECTILE_SLOTS", 15, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--PROJECTILE", 14, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);          -- arrows and bullets that AREN'T in your shot bags
        EBank_SetDefault("putinslot--EMPTY_SLOTS", 13, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);         -- Empty slots go in this bar
        EBank_SetDefault("putinslot--GRAY_ITEMS", 13, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);          -- Gray items go in this bar
        --
        EBank_SetDefault("putinslot--OTHERORUNKNOWN", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);      -- if not soulbound, but doesn't match any other catagory, it goes here
        EBank_SetDefault("putinslot--TRADEGOODS", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--RECIPE", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--PATTERN", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--SCHEMATIC", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--FORMULA", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--TRADESKILL_COOKING", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--TRADESKILL_FIRSTAID", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--OTHERSOULBOUND", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);       -- this will usually be soulbound equipment
	EBank_SetDefault("putinslot--CUSTOM_01", 10, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--CUSTOM_02", 10, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--CUSTOM_03", 10, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--CUSTOM_04", 10, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--CUSTOM_05", 10, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--CUSTOM_06", 10, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	--
        EBank_SetDefault("putinslot--CONSUMABLE", 9, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--TRADESKILL_2", 8, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--TRADESKILL_1", 8, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--TRADESKILL_2_CREATED", 8, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--TRADESKILL_1_CREATED", 8, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--EQUIPPED", 7, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        --
        EBank_SetDefault("putinslot--FOOD", 6, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--DRINK", 5, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--QUESTITEMS", 4, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        --
        EBank_SetDefault("putinslot--HEALINGPOTION", 3, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--HEALTHSTONE", 3, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--MANAPOTION", 2, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--BANDAGE", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--REAGENT", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--JUJU", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--MISC", 14, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--TRADETOOLS", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
		EBank_SetDefault("putinslot--MINIPET", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EBank_SetDefault("putinslot--HEARTH", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
		EBank_SetDefault("putinslot--KEYS", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
		EBank_SetDefault("putinslot--KEYS2", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
		EBank_SetDefault("putinslot--CLASS_ITEMS2", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);

	-- NEW EQUIP SORTING
	EBank_SetDefault("putinslot--BOP_BOE", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPSHIRT", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPSHOULDER", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPLEGS", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPFEET", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPFINGER", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPWRIST", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPTABARD", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPBACK", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPCHEST", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPHEAD", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPNECK", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPHANDS", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPWAIST", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPTRINKET", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPFIRERESIST", 7, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPFROSTRESIST", 7, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPSHADOWRESIST", 7, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPNATURERESIST", 7, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EBank_SetDefault("putinslot--EQUIPARCANERESIST", 7, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);

        -- default item overrides
	EBank_SetDefault("itemoverride_loaddefaults", 1, 3+re, EngBags_NumericRange, 0, 1);
	if (EngBankConfig["itemoverride_loaddefaults"] == 1) then
		EngBankConfig["item_overrides"] = EngBags_DefaultItemOverrides;
		EngBankConfig["item_search_list"] = EngBags_DefaultSearchList;

		for key,value in EngBankConfig["item_search_list"] do
			if (string.sub(value[4], 1, 5) == "loc::") then
				EngBankConfig["item_search_list"][key][4] = EBLocal[ string.sub(value[4],6) ];
			end
		end
		for key,value in EBLocal["string_searches"] do
			table.insert(EngBankConfig["item_search_list"], EngBags_DefaultSearchItemsINSERTTO,
				{ value[1], "", value[2], "" } );
		end

		EngBankConfig["itemoverride_loaddefaults"] = 0;
	end

	-- cleanup old overrides that shouldn't be in the config anymore
	newEngBankConfig = EngBankConfig;
	for key,value in EngBankConfig do
		if (string.find(key, "itemoverride--")) then
			newEngBankConfig = EngBags_Table_RemoveKey(newEngBankConfig, key);
		end
	end
	EngBankConfig = newEngBankConfig;

        -- default sort views / default "allow new items in bar" settings
        EBank_SetDefault("bar_sort_"..EngBankConfig["putinslot--EMPTY_SLOTS"], EngBags_SORTBYNAMEREV, 2+re, EngBags_NumericRange, EngBags_SORTLOWESTVALUE, EngBags_SORTHIGHESTVALUE);
        EBank_SetDefault("bar_sort_"..EngBankConfig["putinslot--HEALINGPOTION"], EngBags_SORTBYNAMEREV, 2+re, EngBags_NumericRange, EngBags_SORTLOWESTVALUE, EngBags_SORTHIGHESTVALUE);
        EBank_SetDefault("bar_sort_"..EngBankConfig["putinslot--MANAPOTION"], EngBags_SORTBYNAMEREV, 2+re, EngBags_NumericRange, EngBags_SORTLOWESTVALUE, EngBags_SORTHIGHESTVALUE);
        EBank_SetDefault("bar_sort_"..EngBankConfig["putinslot--TRADEGOODS"], EngBags_SORTBYNAMEREV, 2+re, EngBags_NumericRange, EngBags_SORTLOWESTVALUE, EngBags_SORTHIGHESTVALUE);

	for i = 1, EngBags_MAX_BARS do
                EBank_SetDefault("bar_sort_"..i, EngBags_SORTBYNAME, 2+re, EngBags_NumericRange, EngBags_SORTLOWESTVALUE, EngBags_SORTHIGHESTVALUE);
		EBank_SetDefault("allow_new_in_bar_"..i, 1, 1+re, EngBags_NumericRange, 0, 1);
	end

	-- find matching catagories that are not assigned
	for key,value in EngBankConfig["item_search_list"] do
		if (EngBankConfig["putinslot--"..value[1]] == nil) then
			message("EngBank: Unassigned catagory: "..value[1].." -- It has been assigned to slot 1");
			EngBankConfig["putinslot--"..value[1]] = 1;
		end
	end

        if (re>0) then
                EngBank_SetDefaultValues(0);
        end
end

function EngBank_SetTradeSkills()
	local k,v;

	EngBank_TRADE1 = "";
	EngBank_TRADE2 = "";

	for k,v in EngBagsConfig[EngBank_PLAYERID]["tradeskills"] do
		if ((k ~= EBLocal["Cooking"]) and (k ~= EBLocal["First Aid"])) then
			EngBank_TRADE1 = EngBank_TRADE2;
			EngBank_TRADE2 = k;
		end
	end
end

function EngBank_init()
	EngBags_SetDefaultValues();
	EngBags_PLAYERID = UnitName("player").."|"..EngBags_Trim(GetCVar("realmName"));
	EngBank_PLAYERID = EngBags_PLAYERID;


	if ( EngBagsItems[EngBank_PLAYERID] == nil) then
		EngBagsItems[EngBank_PLAYERID] = {};
	end
	
	-- change imported from auctioneer team..  what does it do?
	UIPanelWindows["EngBank_frame"] = { area = "left", pushable = 6 };

	if ( EngBank_WIPECONFIGONLOAD == 1 ) then
		EngBankConfig = {};
	end

        -- Load localization -- ERR_BADATTACKPOS is a blizzard defined constant for displaying an error message.
        --                      it should be good enough to determine what language the game is running in.
        if ( GetLocale() == "enGB" or GetLocale() == "enUS" ) then
                -- US/English
                EngBank_load_Localization("EN");
        elseif ( GetLocale() == "frFR" ) then
                -- French
                EngBank_load_Localization("FR");
        elseif ( GetLocale() == "deDE" ) then
                -- German
                EngBank_load_Localization("DE");
		elseif ( GetLocale() == "ruRU" ) then
                -- Russian
                EngBank_load_Localization("RU");
        else
                -- have to load something...  :(
                --EngBags_Print("*** No localization found, stuff won't work properly ***", 1,0.25,0.25 );
			message("EngBank: No localization found, stuff won't work properly");
            EngBank_load_Localization("EN");
        end

        -- register slash command
        SlashCmdList["EngBank"] = EngBank_cmd;
        SLASH_EngBank1 = "/ebinv";
        SLASH_EngBank2 = "/eb";

	if ( EngBagsConfig["Bank"][EngBank_PLAYERID] == nil ) then
		EngBagsConfig["Bank"][EngBank_PLAYERID] = {};
	end

        -- load default values
        EngBank_SetDefaultValues(0);
	EngBank_SetReplaceBank();
        
	-- go through the tradeskill list, and remove what shouldn't be there
	-- bah, do it in a lazy way, just wipe it
	if (EngBagsConfig[EngBank_PLAYERID] == nil) then
		EngBagsConfig[EngBank_PLAYERID] = {};
	end
	if (EngBagsConfig[EngBank_PLAYERID]["tradeskills"] == nil) then
		EngBagsConfig[EngBank_PLAYERID]["tradeskills"] = {};
	end
	local max_skills = 2;
	if (EngBagsConfig[EngBank_PLAYERID]["tradeskills"][EBLocal["Cooking"]] ~= nil) then
		max_skills = max_skills + 1;
	end
	if (EngBagsConfig[EngBank_PLAYERID]["tradeskills"][EBLocal["First Aid"]] ~= nil) then
		max_skills = max_skills + 1;
	end
	if (table.getn(EngBagsConfig[EngBank_PLAYERID]["tradeskills"]) > max_skills) then
		EngBagsConfig[EngBank_PLAYERID]["tradeskills"] = {};	-- wipe it out
		EngBagsConfig[EngBank_PLAYERID]["tradeskill_items"] = {};
	end

	-- detailed info about tradeskills
	if (EngBagsConfig[EngBank_PLAYERID]["trades"] == nil) then
		EngBagsConfig[EngBank_PLAYERID]["trades"] = {};
	end

	EngBank_SetTradeSkills();

        -- setup hooks
        EngBank_RegisterHooks(EngBank_HOOKS_REGISTER);
        EngBank_Button_HighlightToggle:SetText(EBLocal["EngBank_Button_HighlightToggle_off"]);
        EngBank_Button_ChangeEditMode:SetText(EBLocal["EngBank_Button_ChangeEditMode_off"]);

        if (EngBankConfig["moveLock"] == 0) then
                EngBank_Button_MoveLockToggle:SetText(EBLocal["EngBank_Button_MoveLock_locked"]);
        else
                EngBank_Button_MoveLockToggle:SetText(EBLocal["EngBank_Button_MoveLock_unlocked"]);
        end

	EngBank_OnEvent("UPDATE_INVENTORY_ALERTS");	-- reload the items currently equipped

end

function EngBank_Update_BagSlots()
	local numSlots, full = GetNumBankSlots();
	local cost = GetBankSlotCost(numSlots);
	if ( (not full) and (EngBankConfig["hide_purchase button"]==0) ) then
		MoneyFrame_Update("EngBank_SlotCostFrame", cost);
	else
		EngBank_SlotCostFrame:Hide();
		EngBank_PurchaseButton:Hide();
	end
	B4nkFrameBag1:SetScale(0.7);
	B4nkFrameBag2:SetScale(0.7);
	B4nkFrameBag3:SetScale(0.7);
	B4nkFrameBag4:SetScale(0.7);
	B4nkFrameBag5:SetScale(0.7);
	B4nkFrameBag6:SetScale(0.7);
	if (numSlots < 1) then B4nkFrameBag1:Hide(); else B4nkFrameBag1:Show(); end
	if (numSlots < 2) then B4nkFrameBag2:Hide(); else B4nkFrameBag2:Show(); end
	if (numSlots < 3) then B4nkFrameBag3:Hide(); else B4nkFrameBag3:Show(); end
	if (numSlots < 4) then B4nkFrameBag4:Hide(); else B4nkFrameBag4:Show(); end
	if (numSlots < 5) then B4nkFrameBag5:Hide(); else B4nkFrameBag5:Show(); end
	if (numSlots < 6) then B4nkFrameBag6:Hide(); else B4nkFrameBag6:Show(); end

	for i=1, NUM_BANKBAGSLOTS, 1 do
		local button = getglobal("B4nkFrameBag"..i);
		local tooltipText;
		if ( button ) then
			if ( i <= numSlots ) then
				SetItemButtonTextureVertexColor(button, 1.0,1.0,1.0);
				button.tooltipText = BANK_BAG;
			else
				SetItemButtonTextureVertexColor(button, 1.0,0.1,0.1);
				button.tooltipText = BANK_BAG_PURCHASE;
			end
		end
	end
end

function EngBank_OnEvent(event)

	if (event == "BANKFRAME_OPENED") then
		if EngReplaceBank == 1 then
			EngBank_AtBank = 1;
			EngBank_resort_required = EngBank_MANDATORY;
			EngBank_edit_mode = 0;
			EngBankFrameTitleText:SetText(UnitName("npc"));
			SetPortraitTexture(EngBank_framePortrait, "npc");
			EngBank_PlayerName = UnitName("player").."|"..EngBags_Trim(GetCVar("realmName"));
			EngBank_frame:Show();
			EngBank_Update_BagSlots();
		end
	elseif (event == "BANKFRAME_CLOSED") then
		EngBank_AtBank = 0;
		CloseBackpack(); -- Close Backpack when leaving
	 	if EngReplaceBank == 1 then			
			EngBank_frame:Hide();
		end

	end

	if ( EngBank_frame:IsVisible() ) then

        EngBags_PrintDEBUG("bank_event: '"..event.."'");

        if ( event == "BAG_UPDATE" ) then
                EngBank_UpdateWindow();
        elseif ( event == "BAG_UPDATE_COOLDOWN" ) then
                EngBank_UpdateWindow();
        elseif ( event == "ITEM_LOCK_CHANGED" ) then
                EngBank_UpdateWindow();
	elseif ( event == "PLAYERBANKBAGSLOTS_CHANGED" or event == "PLAYERBANKSLOTS_CHANGED") then
		EngBank_Update_BagSlots();
--	elseif ( event == "CRAFT_SHOW" ) then
--		EngBags_Craft();
--	elseif ( event == "TRADE_SKILL_SHOW" ) then
--		EngBags_Trade();
--	elseif ( event == "UPDATE_INVENTORY_ALERTS" ) then
--		local itemLink;
--		local a,b,c,d;
--
--		EngBags_PrintDEBUG("About to scan inventory");
--
--		if (EngBagsConfig[EngBank_PLAYERID]["equipped_items"] == nil) then
--			EngBagsConfig[EngBank_PLAYERID]["equipped_items"] = {};
--		end
--
--		for key,value in { "HeadSlot","NeckSlot","ShoulderSlot","BackSlot","ChestSlot",
--			"ShirtSlot","TabardSlot","WristSlot","HandsSlot","WaistSlot","LegsSlot",
--			"FeetSlot","Finger0Slot","Finger1Slot","Trinket0Slot","Trinket1Slot",
--			"MainHandSlot","SecondaryHandSlot","RangedSlot" } do
--
--			itemLink = GetInventoryItemLink("player", GetInventorySlotInfo(value) );
--			if ( (itemLink ~= nil) and (type(itemLink) == "string") ) then
--				for a,b,c,d in string.gfind(itemLink, "(%d+):(%d+):(%d+):(%d+)") do
--					itemLink = ""..a..":0:"..c..":0";
--				end
--				
--				EngBagsConfig[EngBank_PLAYERID]["equipped_items"][itemLink] = 1;
--			end
--		end
--
--              EngBank_UpdateWindow();
	else
		EngBags_PrintDEBUG("OnEvent: No event handler found.");
        end

	EngBags_PrintDEBUG("OnEvent: Finished "..event);

	end

end

function EngBank_StartMoving(frame)
        if ( not frame.isMoving ) and ( EngBankConfig["moveLock"] == 1 ) then
                frame:StartMoving();
                frame.isMoving = true;
        end
end

function EngBank_StopMoving(frame)
        if ( frame.isMoving ) then
                frame:StopMovingOrSizing();
                frame.isMoving = false;

                -- save the position
                EngBankConfig["frameLEFT"] = frame:GetLeft() * frame:GetScale();
                EngBankConfig["frameRIGHT"] = frame:GetRight() * frame:GetScale();
                EngBankConfig["frameTOP"] = frame:GetTop() * frame:GetScale();
                EngBankConfig["frameBOTTOM"] = frame:GetBottom() * frame:GetScale();

                EngBags_PrintDEBUG("new position:  top="..EngBankConfig["frameTOP"]..", bottom="..EngBankConfig["frameBOTTOM"]..", left="..EngBankConfig["frameLEFT"]..", right="..EngBankConfig["frameRIGHT"] );
        end
end

function EngBank_OnMouseDown(button, frame)

	if ( button == "LeftButton" ) then
		EngBank_StartMoving(frame);
	elseif ( button == "RightButton" ) then
		HideDropDownMenu(1);
		EngBank_RightClickMenu_mode = "mainwindow";
		EngBank_RightClickMenu_opts = {};
		ToggleDropDownMenu(1, nil, EngBank_frame_RightClickMenu, "cursor", 0, 0);
	end

end


--	EngBank_resort_required: EngBank_NOTNEEDED, EngBank_REQUIRED, EngBank_MANDATORY
--	EngBank_window_update_required: EngBank_NOTNEEDED, EngBank_REQUIRED, EngBank_MANDATORY
--	EngBank_item_cache[ bag ][ slot ]
function EngBank_Update_item_cache()

	local bag, slot, index;	-- used as "for loop" counters
	local itm;		-- entry that will be written to the cache
	local update_suggested = 0;
	local resort_suggested = 0;
	local resort_mandatory = 0;
	-- variables used in outer loop, bag:
	local bagNumSlots;
	local is_shot_bag;
	-- variables used in inner loop, slots:
	local a,b,c,d;
	local sequencial_slot_num = 0;
	EngBank_item_cache = EngBagsItems[EngBank_PLAYERID];

	for index, bagnum in ipairs(EngBank_Bags) do
			
		if (EngBankConfig["show_Bag"..bagnum] == 1) then
			if (EngBank_item_cache[bagnum] == nil) then
				EngBank_item_cache[bagnum] = {};
			end

			bagNumSlots = GetContainerNumSlots(bagnum);
			if (bagNumSlots > 0) then
				is_shot_bag = EngBags_IsShotBag(bagnum);
				for slotnum = 1, bagNumSlots do
					if (EngBank_item_cache[bagnum][slotnum] == nil) then
						EngBank_item_cache[bagnum][slotnum] = { ["keywords"] = {} };
					end

					sequencial_slot_num = sequencial_slot_num + 1;
					itm = {
						["itemlink"] = GetContainerItemLink(bagnum, slotnum);
						["bagnum"] = bagnum,
						["slotnum"] = slotnum,
						["sequencial_slot_num"] = sequencial_slot_num,
						["bagname"] = GetBagName(bagnum),
						["iteminfo"] = GetContainerItemLink(bagnum, slotnum),
						-- take items from old position
						["bar"] = EngBank_item_cache[bagnum][slotnum]["bar"],
						["button_num"] = EngBank_item_cache[bagnum][slotnum]["button_num"],
						["indexed_on"] = EngBank_item_cache[bagnum][slotnum]["indexed_on"],
						["display_string"] = EngBank_item_cache[bagnum][slotnum]["display_string"],
						["barClass"] = EngBank_item_cache[bagnum][slotnum]["barClass"],
						["button_num"] = EngBank_item_cache[bagnum][slotnum]["button_num"],	-- assigned when drawing
						["keywords"] = EngBank_item_cache[bagnum][slotnum]["keywords"],
						["itemlink_override_key"] = EngBank_item_cache[bagnum][slotnum]["itemlink_override_key"],
						-- misc junk
						["search_match"] = EngBank_item_cache[bagnum][slotnum]["search_match"],
						["gametooltip"] = EngBank_item_cache[bagnum][slotnum]["gametooltip"]
						};

					if (is_shot_bag) then
						itm["keywords"]["SHOT_BAG"]=1;
					end

					if (itm["itemlink"] ~= nil) then
						-- there's an item in the bag, let's find out more about it
						for a,b,c,d in string.gfind(itm["itemlink"], "(%d+):(%d+):(%d+):(%d+)") do
							itm["itemlink"] = "item:"..a..":"..b..":"..c..":"..d;
							-- I hope this is right.
							-- looklink says B is "instance specific"
							-- I'm guessing D is player specific
							-- I wonder what C is...
							itm["itemlink_noninstance"] = ""..a..":0:"..c..":0";
						end

						itm["itemname"], itm["itemlink2"], itm["itemRarity"], itm["itemMinLevel"], itm["itemtype"], itm["itemsubtype"], itm["itemstackcount"], itm["itemloc"] = GetItemInfo(itm["itemlink"]);
						itm["texture"], itm["itemcount"], itm["locked"], itm["quality"], itm["readable"] = GetContainerItemInfo(bagnum, slotnum);
						itm["start"], itm["duration"], itm["enable"] = GetContainerItemCooldown(bagnum, slotnum);
					else
						-- no item in bag, set the default values
						itm["itemlink_noninstance"] = nil; 
						itm["itemname"] = "Empty Slot";
						itm["itemlink2"] = nil
						itm["itemRarity"] = nil;
						itm["itemMinLevel"] = nil;
						itm["itemtype"] = "";
						itm["itemsubtype"] = "";
						itm["itemstackcount"] = nil;
						itm["display_string"] = nil;
						itm["texture"] = nil;
						itm["itemcount"] = 0;
						itm["locked"] = 0;
						itm["quality"] = 0;
						itm["readable"] = 0;
						if bagnum ~= -1 then
							local BankSlotLink = GetInventoryItemLink("player",(59+bagnum));
							if BankSlotLink ~= nil then
								local _, _, itemCode = strfind(BankSlotLink, "(%d+):");
								local _, _, _, _, _, itemSubtype, _, _, itemTexture = GetItemInfo(itemCode);
								if (EngBankConfig["hide_bag_icons"] == 0) then
									itm["texture"] = itemTexture;
								else
									itm["texture"] = nil;
								end
								itm["itemsubtype"] = itemSubtype;
							end
						else
								if (EngBankConfig["hide_bag_icons"] == 0) then
									itm["texture"] = "Interface\\Icons\\INV_ValentinesCandySack";
								else
									itm["texture"] = nil;
								end
								itm["itemsubtype"] = "Bank Slot";
								
							
						end
					end

					if (itm["bar"] == nil) then
						resort_mandatory = 1;
					end

					if (itm["itemsubtype"] == nil) then itm["itemsubtype"] = ""; end
					if (itm["itemname"] == nil) then itm["itemname"] = ""; end

					if (itm["locked"] ~= EngBank_item_cache[bagnum][slotnum]["locked"]) then
						update_suggested = 1;
					end

					if (
						(itm["itemlink"] ~= EngBank_item_cache[bagnum][slotnum]["itemlink"]) or
						(itm["keywords"]["SHOT_BAG"] ~= EngBank_item_cache[bagnum][slotnum]["keywords"]["SHOT_BAG"])
						) then
						-- the item changed
						if (itm["indexed_on"] ~= nil) then
							resort_suggested = 1;
							itm["indexed_on"] = GetTime();
							itm["display_string"] = "newItemText";
						end
					else
						-- item has not changed, maybe the count did?
						if ( (itm["itemcount"] ~= EngBank_item_cache[bagnum][slotnum]["itemcount"]) and (EngBank_item_cache[bagnum][slotnum]["itemcount"] ~= nil) ) then
							update_suggested = 1;
							if (itm["itemcount"] < EngBank_item_cache[bagnum][slotnum]["itemcount"]) then
								itm["display_string"] = "newItemTextMinus";
							else
								itm["display_string"] = "newItemTextPlus";
							end
							itm["indexed_on"] = GetTime();
						end
					end

					if (itm["indexed_on"] == nil) then
						itm["indexed_on"] = 1;
						itm["display_string"] = "NewItemText_Off";
						
					end

					EngBank_item_cache[bagnum][slotnum] = itm;	-- save updated information
				end
			else
				-- bagNumSlots = 0, make sure you wipe the cache entry
				if (table.getn(EngBank_item_cache[bagnum]) ~= 0) then
					resort_mandatory = 1;
				end
				EngBank_item_cache[bagnum] = {};
			end
		end

	end

	if (resort_mandatory == 1) then
		EngBank_resort_required = EngBank_MANDATORY;
		EngBank_window_update_required = EngBank_MANDATORY;
	elseif (resort_suggested == 1) then
		EngBank_resort_required = math.max(EngBank_resort_required, EngBank_REQUIRED);
		EngBank_window_update_required = EngBank_MANDATORY;
	elseif (update_suggested == 1) then
		EngBank_window_update_required = EngBank_MANDATORY;
	end
end



-- Take an item and figure out what "bar" you want to place it in
--              return selected_bar, barClass;
function EngBank_PickBar(itm)
        if (itm["itemlink"] == nil) then
                if (itm["keywords"]["SHOT_BAG"]) then
			itm["bar"] = EngBankConfig["putinslot--EMPTY_PROJECTILE_SLOTS"];
			while (type(itm["bar"]) ~= "number") do
				itm["bar"] = EngBankConfig[itm["bar"]];
			end
			itm["barClass"] = "EMPTY_PROJECTILE_SLOTS";
                        return itm;
                else
			itm["bar"] = EngBankConfig["putinslot--EMPTY_SLOTS"];
			while (type(itm["bar"]) ~= "number") do
				itm["bar"] = EngBankConfig[itm["bar"]];
			end
			itm["barClass"] = "EMPTY_SLOTS";
                        return itm;
                end
        else
		-- vars used in tooltip creation
		local idx, tmptooltip, tmpval, tooltip_info_concat;
		-- vars used in array loops
		local key, value;
		local found;

		-- reset item keywords
		if (itm["keywords"]["SHOT_BAG"]) then
			itm["keywords"] = {
				["USED_PROJECTILE_SLOT"] = 1,	-- this indicates that the shot bag isn't empty
				["SHOT_BAG"] = 1
				};
		else
			itm["keywords"] = {};
		end
		if (itm["itemRarity"] ~= nil) then
			itm["keywords"]["ITEMRARITY_"..itm["itemRarity"]] = 1;
		end

		-- setup tradeskill keywords
		if ( (EngBagsConfig[EngBank_PLAYERID]["tradeskill_items"] ~= nil) and (EngBagsConfig[EngBank_PLAYERID]["tradeskill_items"][ itm["itemlink_noninstance"] ] ~= nil) ) then
			-- the item exists in our cache
			if (EngBagsConfig[EngBank_PLAYERID]["tradeskill_items"][ itm["itemlink_noninstance"] ][EngBank_TRADE1] ~= nil) then
				itm["keywords"]["TRADESKILL_1"] = 1;
			elseif (EngBagsConfig[EngBank_PLAYERID]["tradeskill_items"][ itm["itemlink_noninstance"] ][EngBank_TRADE2] ~= nil) then
				itm["keywords"]["TRADESKILL_2"] = 1;
			elseif (EngBagsConfig[EngBank_PLAYERID]["tradeskill_items"][ itm["itemlink_noninstance"] ][EBLocal["Cooking"]] ~= nil) then
				itm["keywords"]["TRADESKILL_COOKING"] = 1;
			elseif (EngBagsConfig[EngBank_PLAYERID]["tradeskill_items"][ itm["itemlink_noninstance"] ][EBLocal["First Aid"]] ~= nil) then
				itm["keywords"]["TRADESKILL_FIRSTAID"] = 1;
			end
		end

		-- setup tradeskill produced items keywords
		if ( (EngBagsConfig[EngBank_PLAYERID]["tradeskill_production"] ~= nil) and (EngBagsConfig[EngBank_PLAYERID]["tradeskill_production"][ itm["itemlink_noninstance"] ] ~= nil) ) then
			if (EngBagsConfig[EngBank_PLAYERID]["tradeskill_production"][ itm["itemlink_noninstance"] ][EngBank_TRADE1] ~= nil) then
				itm["keywords"]["TRADESKILL_1_CREATED"] = 1;
			elseif (EngBagsConfig[EngBank_PLAYERID]["tradeskill_production"][ itm["itemlink_noninstance"] ][EngBank_TRADE2] ~= nil) then
				itm["keywords"]["TRADESKILL_2_CREATED"] = 1;
			end
			-- not doing cooking or first aid.
		end

		-- setup equipped items keywords
		if ( EngBagsConfig[EngBank_PLAYERID]["equipped_items"] ~= nil ) then
			if (EngBagsConfig[EngBank_PLAYERID]["equipped_items"][ itm["itemlink_noninstance"] ] ~= nil) then
				itm["keywords"]["EQUIPPED"] = 1;
			end
		end

		-- Load tooltip
		EngBank_tt:SetOwner(UIParent, "ANCHOR_NONE");	-- this makes sure that tooltip.valid = true
		if itm["bagnum"] < 0 then
				EngBank_tt:SetInventoryItem("player", BankButtonIDToInvSlotID(itm["slotnum"]));
			else
				EngBank_tt:SetBagItem(itm["bagnum"],itm["slotnum"]);
		end
		
		idx = 1;
		tmptooltip = getglobal("EngBank_ttTextLeft"..idx);
		tooltip_info_concat = "";
		itm["gametooltip"] = {};
		repeat
			tmpval = tmptooltip:GetText();

			if (tmpval ~= nil) then
				tooltip_info_concat = tooltip_info_concat.." "..tmpval;
				itm["gametooltip"][idx] = tmpval;
			end

			idx=idx+1;
			tmptooltip = getglobal("EngBank_ttTextLeft"..idx);
		until (tmpval==nil) or (tmptooltip==nil);

		-- EngBags_PrintDEBUG("Tooltip Text: "..tooltip_info_concat);

		if (string.find(tooltip_info_concat, EBLocal["soulbound_search"] )) then
			itm["keywords"]["SOULBOUND"] = 1;
		end

		itm["barClass"] = nil;

		-- step 1, check item overrides
		if (itm["keywords"]["SOULBOUND"] == nil) then
			itm["itemlink_override_key"] = itm["itemlink_noninstance"];
		else
			itm["itemlink_override_key"] = itm["itemlink_noninstance"].."-SB";
		end

		-- load an item override
		itm["barClass"] = EngBankConfig["item_overrides"][itm["itemlink_override_key"]];
		if (itm["barClass"] ~= nil) then
			itm["search_match"] = "item_override found";

			itm["bar"] = EngBankConfig["putinslot--"..itm["barClass"]];
			while ( (itm["bar"] ~= nil) and (type(itm["bar"]) ~= "number") ) do
				itm["bar"] = EngBankConfig[itm["bar"]];
			end
			if (type(itm["bar"]) ~= "number") then
				itm["barClass"] = nil;
			end
		end

		if (itm["barClass"] == nil) then
			for key,value in EngBankConfig["item_search_list"] do
				if (value[1] ~= "") then
					local found = 1;
					
					-- value[1] == catagory to place it in

					-- check keywords
					if ( (value[2] ~= "") and (itm["keywords"][value[2]] == nil) ) then
						found = nil;
					end
					-- check tooltip
					if ( (value[3] ~= "") and (not string.find(tooltip_info_concat, value[3])) ) then
						found = nil;
					end
					-- check itemType
					if ( (value[4] ~= "") and (itm["itemtype"] ~= value[4]) ) then
						found = nil;
					end

					if (found) then
						itm["search_match"] = ""..key..": "..value[1];
						itm["barClass"] = value[1];
						itm["bar"] = EngBankConfig["putinslot--"..itm["barClass"]];
						while ( (itm["bar"] ~= nil) and (type(itm["bar"]) ~= "number") ) do
							itm["bar"] = EngBankConfig[itm["bar"]];
						end
						if (type(itm["bar"]) == "number") then
							break;
						else
							itm["barClass"] = nil;
						end
					end
				end
			end
		end

		if (itm["barClass"] == nil) then
			itm["barClass"] = "OTHERORUNKNOWN";

			itm["bar"] = EngBankConfig["putinslot--"..itm["barClass"]];
			while ( (itm["bar"] ~= nil) and (type(itm["bar"]) ~= "number") ) do
				itm["bar"] = EngBankConfig[itm["bar"]];
			end
			if (type(itm["bar"]) ~= "number") then
				itm["barClass"] = "UNKNOWN";
				itm["bar"] = 1;
			end
		end

                return itm;
        end
end


function EngBank_Sort_item_cache()
	local i;
	local bagnum, slotnum, index;
	-- variables used in outer loop
	local bagNumSlots;
	-- variables used in inner loop
	----- 2nd loop
	local barnum;

	--Print("Resorting Items");
	EngBank_item_cache = EngBagsItems[EngBank_PLAYERID];

	-- wipe the current bar positions table
	EngBank_bar_positions = {};
	for i = 1, EngBags_MAX_BARS do
		EngBank_bar_positions[i] = {};
	end

	for index, bagnum in ipairs(EngBank_Bags) do

	if EngBank_item_cache[bagnum] == nil then
		return;
	end

		if (EngBankConfig["show_Bag"..bagnum] == 1) then
			bagNumSlots = table.getn(EngBank_item_cache[bagnum]);
			if (bagNumSlots > 0) then
				for slotnum = 1, bagNumSlots do
					EngBank_item_cache[bagnum][slotnum] = EngBank_PickBar( EngBank_item_cache[bagnum][slotnum] );

					table.insert( EngBank_bar_positions[ EngBank_item_cache[bagnum][slotnum]["bar"] ], { ["bagnum"]=bagnum, ["slotnum"]=slotnum } );
				end
			end
		end
	end

        -- sort the cache now
        for barnum = 1, EngBags_MAX_BARS do
		local toggle;

		if (EngBankConfig["bar_sort_"..barnum] == EngBags_SORTBYNAME) then
			toggle=1
			elseif (EngBankConfig["bar_sort_"..barnum] == EngBags_SORTBYNAMEREV) then
			toggle=2
		end
		
                if (toggle==1 or toggle==2) then
                        table.sort(EngBank_bar_positions[barnum],
                                function(a,b)
                                        return  EngBank_item_cache[a["bagnum"]][a["slotnum"]]["barClass"]..
						EngBank_item_cache[a["bagnum"]][a["slotnum"]]["itemsubtype"]..
						EngBags_ReverseString(
							EngBank_item_cache[a["bagnum"]][a["slotnum"]]["itemname"],toggle)..
							string.format("%04s",EngBank_item_cache[a["bagnum"]][a["slotnum"]]["itemcount"]
							)
								>
                                                EngBank_item_cache[b["bagnum"]][b["slotnum"]]["barClass"]..
						EngBank_item_cache[b["bagnum"]][b["slotnum"]]["itemsubtype"]..
						EngBags_ReverseString(
							EngBank_item_cache[b["bagnum"]][b["slotnum"]]["itemname"],toggle)..
							string.format("%04s",EngBank_item_cache[b["bagnum"]][b["slotnum"]]["itemcount"]
							)
                                end);
                end
        end

	EngBank_resort_required = EngBank_NOTNEEDED;
	EngBank_window_update_required = EngBank_MANDATORY;
end


-- Make an inventory slot usable with the item specified in itm
-- cache entry is the array that comes directly from the cache
function EngBank_UpdateButton(itemframe, itm)
        local ic_start, ic_duration, ic_enable;
        local showSell = nil;
        local itemframe_texture = getglobal(itemframe:GetName().."IconTexture");
	local itemframe_normaltexture = getglobal(itemframe:GetName().."NormalTexture");
        local itemframe_font = getglobal(itemframe:GetName().."Count");
        local itemframe_stock = getglobal(itemframe:GetName().."Stock");
        local cooldownFrame = getglobal(itemframe:GetName().."_Cooldown");

        if ( EBLocal["_loaded"]==0 ) then
                return;
        end

        if (itm["itemlink"] ~= nil) then
                ic_start, ic_duration, ic_enable = GetContainerItemCooldown(itm["bagnum"], itm["slotnum"]);
        else
                ic_start = 0;
                ic_duration = 0;
                ic_enable = nil;
        end

        SetItemButtonTexture(itemframe, itm["texture"]);
	
        if ( EngBank_edit_mode == 1 ) then
                -- we should be hilighting an entire class of item
                if ( itm["barClass"] ~= EngBank_edit_hilight ) then
                        -- dim this item
                        itemframe_texture:SetVertexColor(1,1,1,0.15);
                        itemframe_font:SetVertexColor(1,1,1,0.5);
                else
                        -- hilight this item
                        itemframe_texture:SetVertexColor(1,1,0,1);
                        itemframe_font:SetVertexColor(1,1,0,1);
                end
        else
                -- no hilights, just do your normal work

                if ( (EngBankConfig["allow_new_in_bar_"..itm["bar"]] == 1) and (itm["itemlink"] ~= nil) and (itm["indexed_on"]>1) and ((GetTime()-itm["indexed_on"]) < EngBankConfig["newItemTimeout"]) ) then
                        -- item is still new, display the "new" text.
                        itemframe_stock:SetText( EngBankConfig[itm["display_string"]] );
                        if ( (GetTime()-itm["indexed_on"]) < EngBankConfig["newItemTimeout2"]) then
                                -- use color #2
                                itemframe_stock:SetTextColor(
                                        EngBankConfig["newItemColor2_R"],
                                        EngBankConfig["newItemColor2_G"],
                                        EngBankConfig["newItemColor2_B"] );
                                itemframe_font:SetVertexColor(
                                        EngBankConfig["newItemColor2_R"],
                                        EngBankConfig["newItemColor2_G"],
                                        EngBankConfig["newItemColor2_B"], 1 );
                        else
				
                                -- use color #1
                                itemframe_stock:SetTextColor(
                                        EngBankConfig["newItemColor1_R"],
                                        EngBankConfig["newItemColor1_G"],
                                        EngBankConfig["newItemColor1_B"] );
                                itemframe_font:SetVertexColor(
                                        EngBankConfig["newItemColor1_R"],
                                        EngBankConfig["newItemColor1_G"],
                                        EngBankConfig["newItemColor1_B"], 1 );
                        end
                        itemframe_stock:Show();
                        itemframe_texture:SetVertexColor(1,1,1,1);

                        
		else
                        itemframe_stock:Hide();
			
                        if (EngBank_hilight_new == 1) then
                                itemframe_texture:SetVertexColor(1,1,1,0.15);
                                itemframe_font:SetVertexColor(1,1,1,0.5);
                        else
                                itemframe_texture:SetVertexColor(1,1,1,1);
                                itemframe_font:SetVertexColor(1,1,1,1);
                        end
                end


                if (itm["itemRarity"] == nil) then
			itemframe_normaltexture:SetVertexColor(0.4,0.4,0.4, 0.5);
                elseif (itm["itemRarity"] == 0) then     -- gray item
			itemframe_normaltexture:SetVertexColor(1,1,1,1);
                elseif (itm["itemRarity"] == 1) then     -- white item
			itemframe_normaltexture:SetVertexColor(0.4,0.4,0.4, 0.5);
                elseif (itm["itemRarity"] == 2) then     -- green item
			itemframe_normaltexture:SetVertexColor(0,1,0.25, 0.5);
                elseif (itm["itemRarity"] == 3) then     -- blue item
			itemframe_normaltexture:SetVertexColor(0.5,0.5,1, 0.5);
                elseif (itm["itemRarity"] == 4) then     -- purple item
			itemframe_normaltexture:SetVertexColor(1,0,1, 0.5);
                else    -- ?!
			itemframe_normaltexture:SetVertexColor(1,0,0, 0.5);
                end
        end

        SetItemButtonDesaturated(itemframe, itm["locked"], 0.5, 0.5, 0.5);
        SetItemButtonCount(itemframe, itm["itemcount"]);

	-- resize itemframe texture (this is the little border)
	itemframe_normaltexture:SetWidth(EngBags_BKGRFRAME_WIDTH);
	itemframe_normaltexture:SetHeight(EngBags_BKGRFRAME_HEIGHT);

	-- resize and position fonts
	--itemframe_font.font = "Interface\Addons\EngBags\DAB_CooldownFont.ttf";
	itemframe_font:SetTextHeight( EngBags_BUTTONFONTHEIGHT );	-- count, bottomright
	itemframe_font:ClearAllPoints();
	itemframe_font:SetPoint("BOTTOMRIGHT", itemframe:GetName(), "BOTTOMRIGHT", 0-EngBank_BUTTONFONTDISTANCE_X, EngBank_BUTTONFONTDISTANCE_Y );
	
	itemframe_stock.font = "Interface\Addons\EngBags\DAB_CooldownFont.ttf";
	itemframe_stock:SetTextHeight( EngBags_BUTTONFONTHEIGHT2 );	-- stock, topleft
	itemframe_stock:ClearAllPoints();
	itemframe_stock:SetPoint("TOPLEFT", itemframe:GetName(), "TOPLEFT", (EngBank_BUTTONFONTDISTANCE_X / 2), 0-EngBank_BUTTONFONTDISTANCE_Y );
	
        -- Set cooldown
        CooldownFrame_SetTimer(cooldownFrame, ic_start, ic_duration, ic_enable);
        if ( ( ic_duration > 0 ) and ( ic_enable == 0 ) ) then
                SetItemButtonTextureVertexColor(itemframe, 0.4, 0.4, 0.4);
        end

	cooldownFrame:SetScale(EngBags_COOLDOWN_SCALE);

end


function EngBank_GetBarPositionAndCache()
        local bar, position, itm;
	local bagnum, slotnum;

        if (EngBank_buttons[this:GetName()] ~= nil) then
                bar = EngBank_buttons[this:GetName()]["bar"];
                position = EngBank_buttons[this:GetName()]["position"];

		bagnum = EngBank_bar_positions[bar][position]["bagnum"];
		slotnum = EngBank_bar_positions[bar][position]["slotnum"];

                itm = EngBank_item_cache[bagnum][slotnum];

                return bar,position,itm;
        else
                return nil,nil,nil;
        end

end

function EngBank_ItemButton_OnEnter()
        local bar,position,itm = EngBank_GetBarPositionAndCache();

        if (EngBank_edit_selected == "") then
                EngBank_edit_hilight = itm["barClass"];
        end

        if ( not itm["itemlink"]) then
                if ( EngBank_edit_mode == 1 ) then
                        GameTooltip:SetOwner(this, "ANCHOR_LEFT");
                        GameTooltip:ClearLines();
                        GameTooltip:AddLine("Empty Slot", 1,1,1 );

                        -- move by class
                        if (itm["barClass"] ~= nil) then
				if (EngBank_edit_selected ~= "") then
		                        GameTooltip:AddLine("|cFF00FF7FLeft click to move catagory |r"..EngBank_edit_selected.."|cFF00FF7F to bar |r"..bar, 1,0.25,0.5 );
				else
		                        GameTooltip:AddLine("|cFF00FF7FLeft click to select catagory to move:|r "..itm["barClass"], 1,0.25,0.5 );
					--GameTooltip:AddLine("Right click to assign this item to a different class", 1,0,0 );
				end
                        else
                                GameTooltip:AddLine("error: Item has no catagory", 1,0,0 );
                        end

                        GameTooltip:Show();
                else
                        GameTooltip:Hide();
                end
                if ( EngBank_edit_mode == 1 ) then
			-- redraw the window to show the hilighting of entire class items
			EngBank_window_update_required = EngBank_MANDATORY;
                        EngBank_UpdateWindow();
                end
                return;
        end


	-- Tool Tip Anchor: Anchor Right if the frame is on the left side of the screen else Anchor Left.

	if (EngBankConfig["frameLEFT"] < GetScreenWidth()/2) then
	        GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
	else
		GameTooltip:SetOwner(this, "ANCHOR_LEFT");
	end


	if (itm["bagnum"] < 0 or EngBank_AtBank == 0) then
			if ( EngBank_AtBank == 0 ) then
				GameTooltip:SetHyperlink(itm["itemlink"]);
			else
				GameTooltip:SetInventoryItem("player", BankButtonIDToInvSlotID(itm["slotnum"]));
			end
		else
			hasCooldown, repairCost = GameTooltip:SetBagItem(itm["bagnum"], itm["slotnum"]);
	end
	
	-- Set Cooldown because BankBag (-1) is broke. Damn you Blizzard.
	if (itm["enable"] == 1) then
		itm["start"], itm["duration"], itm["enable"] = GetContainerItemCooldown(itm["bagnum"], itm["slotnum"]);
 			if (itm["duration"] > 0) then
				CoolDownString = EngBags_GetCooldownString(itm);
				GameTooltip:AddLine(CoolDownString, 1.0, 1.0, 1.0);
			end
	end
--[[
        if ( hasCooldown ) then
                this.updateTooltip = 1;
        else
                this.updateTooltip = nil;
        end
--]]
        if ( InRepairMode() and (repairCost and repairCost > 0) ) then
                GameTooltip:AddLine(TEXT(REPAIR_COST), 1, 1, 1);
                SetTooltipMoney(GameTooltip, repairCost);
                GameTooltip:Show();
        elseif ( MerchantFrame:IsVisible() ) then
                ShowContainerSellCursor(itm["bagnum"], itm["slotnum"]);
                EngBags_RegisterCurrentTooltipSellValue(GameTooltip, itm["bagnum"], itm["slotnum"], itm);
        elseif ( this.readable ) then
                ShowInspectCursor();
        end

        if ( EngBank_edit_mode == 1 ) then
                -- move by class
                if (itm["barClass"] ~= nil) then
			if (EngBank_edit_selected ~= "") then
				GameTooltip:AddLine("|cFF00FF7FLeft click to move catagory |r"..EngBank_edit_selected.."|cFF00FF7F to bar |r"..bar, 1,0.25,0.5 );
			else
				GameTooltip:AddLine(" ", 0,0,0);
				GameTooltip:AddLine("|cFF00FF7FLeft click to select catagory to move:|r "..itm["barClass"], 1,0.25,0.5 );
				GameTooltip:AddLine("Right click to assign this item to a different catagory", 1,0,0 );
				GameTooltip:AddLine(" ", 0,0,0);
			end
                else
                        GameTooltip:AddLine("Item has no catagory", 1,0,0 );
                end
        end

	if itm["bagname"] == nil then 
		itm["bagname"] = "Bank";
	end

	GameTooltip:AddLine(EBLocal["Container"]..":"..itm["bagname"], 1,0,0 );
		
        if ( EngBankConfig["tooltip_mode"] == 1 ) then
		EngBags_ModifyItemTooltip(itm["bagnum"], itm["slotnum"], "GameTooltip", itm);
	end

        if ( EngBank_edit_mode == 1 ) then
		-- redraw the window to show the hllighting of entire class items
		EngBank_window_update_required = EngBank_MANDATORY;
                EngBank_UpdateWindow();
        end

end

function EngBank_OnUpdate(elapsed)
        if ( not this.updateTooltip ) then
                return;
        end

        this.updateTooltip = this.updateTooltip - elapsed;
        if ( this.updateTooltip > 0 ) then
                return;
        end

        if ( GameTooltip:IsOwned(this) ) then
                EngBank_ItemButton_OnEnter();
        else
                this.updateTooltip = nil;
        end
end

function EngBank_ItemButton_OnLeave()
        EngBags_PrintDEBUG("EB_button: OnLeave()  this="..this:GetName() );

        if (EngBank_edit_selected == "") then
                EngBank_edit_hilight = "";
        end
        this.updateTooltip = nil;
        if ( GameTooltip:IsOwned(this) ) then
                GameTooltip:Hide();
                ResetCursor();
        end

        if ( EngBank_edit_mode == 1 ) then
		-- redraw the window to remove the hilighting of entire class items
		EngBank_window_update_required = EngBank_MANDATORY;
                EngBank_UpdateWindow();
        end
end

function EngBank_ItemButton_OnClick(button, ignoreShift)
        local bar, position, itm, bagnum, slotnum;

        if (EngBank_buttons[this:GetName()] ~= nil) then
                bar = EngBank_buttons[this:GetName()]["bar"];
                position = EngBank_buttons[this:GetName()]["position"];

		bagnum = EngBank_bar_positions[bar][position]["bagnum"];
		slotnum = EngBank_bar_positions[bar][position]["slotnum"];

                itm = EngBank_item_cache[bagnum][slotnum];
        end

        if (EngBank_edit_mode == 1) then
                -- don't do normal actions to this button, we're in edit mode
                if ( button == "LeftButton" ) then
                        if (EngBank_edit_selected == "") then
                                -- you clicked, we selected
                                EngBank_edit_selected = itm["barClass"];
                                EngBank_edit_hilight = itm["barClass"];
                        else
                                -- we got a click, and we already had one selected.  let's move the items
                                EngBankConfig["putinslot--"..EngBank_edit_selected] = bar;
				EngBank_resort_required = EngBank_MANDATORY;

                                EngBank_edit_selected = "";
                                EngBank_edit_hilight = itm["barClass"];

				-- resort will force a window update
                                EngBank_UpdateWindow();
                        end
		elseif ( button == "RightButton" ) then
			HideDropDownMenu(1);
			EngBank_RightClickMenu_mode = "item";
			EngBank_RightClickMenu_opts = {
				["bar"] = bar,
				["position"] = position,
				["bagnum"] = bagnum,
				["slotnum"] = slotnum
				};
			ToggleDropDownMenu(1, nil, EngBank_frame_RightClickMenu, this:GetName(), -50, 0);
                end
        else
                -- process normal clicks
		if (getglobal("AxuItemMenus_FillUtilityVariables") ~= nil) then
			if ( EngBank_DONT_CALL_AXUITEM == nil ) then
				if (AxuItemMenus_EvocationTest(button)) then
					AxuItemMenus_FillUtilityVariables(itm["bagnum"], itm["slotnum"]);
					AxuItemMenus_OpenMenu();
					return;
				end
			else
				if (getglobal("AxuItemMenus_EngBankHook") ~= nil) then
					if (AxuItemMenus_EngBankHook(itm["bagnum"], itm["slotnum"]) == 1) then
						return;
					end
				end
			end
		end

		-- process normal clicks
                if (itm) then
                        if ( button == "LeftButton" ) then
				if ( IsControlKeyDown() ) then
					DressUpItemLink(itm["itemlink"]);
				elseif ( IsShiftKeyDown() and not ignoreShift ) then
					if ( ChatFrameEditBox:IsVisible() ) then
						ChatFrameEditBox:Insert(itm["iteminfo"]);
					else
						--local texture, itemCount, locked, quality, readable = GetContainerItemInfo(itm["bag"], itm["slot"]);

						if ( not itm["locked"] ) then
							this.SplitStack = function(button, split)
								SplitContainerItem(itm["bagnum"], itm["slotnum"], split);
							end
							OpenStackSplitFrame(this.count, this, "BOTTOMRIGHT", "TOPRIGHT");
						end
					end
				else
					--AllInOneInventory_HandleQuickMount(bag, slot);

					PickupContainerItem(itm["bagnum"], itm["slotnum"]);
				end
                        elseif ( button == "RightButton" ) then
                                if ( Cosmos_ShiftToSell == true ) then
                                        if ( MerchantFrame:IsVisible() ) then
                                                if ( IsShiftKeyDown() ) then
                                                        UseContainerItem(itm["bagnum"], itm["slotnum"]);
                                                end
                                        else
                                                UseContainerItem(itm["bagnum"], itm["slotnum"]);
                                        end
                                else 
                                        if ( IsShiftKeyDown() and MerchantFrame:IsVisible() and not ignoreShift ) then
                                                this.SplitStack = function(button, split)
							local bar, position, bagnum, slotnum;

                                                        if (EngBank_buttons[this:GetName()] ~= nil) then
								bar = EngBank_buttons[this:GetName()]["bar"];
								position = EngBank_buttons[this:GetName()]["position"];

								bagnum = EngBank_bar_positions[bar][position]["bagnum"];
								slotnum = EngBank_bar_positions[bar][position]["slotnum"];

                                                                SplitContainerItem(bagnum, slotnum, split);
                                                                MerchantItemButton_OnClick("LeftButton");
                                                        end
                                                end
                                                OpenStackSplitFrame(this.count, this, "BOTTOMRIGHT", "TOPRIGHT");
                                        else
                                                UseContainerItem(itm["bagnum"], itm["slotnum"]);
                                        end
                                end
                        end
                end
		EngBank_window_update_required = EngBank_MANDATORY;
		EngBank_UpdateWindow();
        end
end

function EngBank_RightClick_PickupItem()
	local bagnum, slotnum;

	bagnum = this.value["bagnum"];
	slotnum = this.value["slotnum"];

	HideDropDownMenu(2);
	HideDropDownMenu(1);

	if ( (bagnum ~= nil) and (slotnum ~= nil) ) then
		PickupContainerItem(bagnum, slotnum);
	else
		message("Error, value not found.");
	end
end

function EngBank_Button_HighlightToggle_OnClick()
	PlaySound("igMainMenuOptionCheckBoxOn");
	if (EngBank_hilight_new == 0) then
		EngBank_hilight_new = 1;
		EngBank_Button_HighlightToggle:SetText(EBLocal["EngBank_Button_HighlightToggle_on"]);
	else
		EngBank_hilight_new = 0;
		EngBank_Button_HighlightToggle:SetText(EBLocal["EngBank_Button_HighlightToggle_off"]);
	end
	EngBank_window_update_required = EngBank_MANDATORY;
	EngBank_UpdateWindow();
end

function EngBank_Button_ChangeEditMode_OnClick()
	PlaySound("igMainMenuOptionCheckBoxOn");
	if (EngBank_edit_mode == 0) then
		EngBank_edit_mode = 1;
		EngBank_Button_ChangeEditMode:SetText(EBLocal["EngBank_Button_ChangeEditMode_MoveClass"]);
	else
		EngBank_edit_mode = 0;
		EngBank_Button_ChangeEditMode:SetText(EBLocal["EngBank_Button_ChangeEditMode_off"]);
	end
	EngBank_resort_required = EngBank_MANDATORY;
	-- resort will force a window redraw
	EngBank_UpdateWindow();
end

function EngBank_Button_MoveLockToggle_OnClick()
	PlaySound("igMainMenuOptionCheckBoxOn");
	if (EngBankConfig["moveLock"] == 0) then
		EngBankConfig["moveLock"] = 1;
		EngBank_Button_MoveLockToggle:SetText(EBLocal["EngBank_Button_MoveLock_unlocked"]);
	else
		EngBankConfig["moveLock"] = 0;
		EngBank_Button_MoveLockToggle:SetText(EBLocal["EngBank_Button_MoveLock_locked"]);
	end
end

function EngBank_SlotTargetButton_OnClick(button, ignoreShift)
        local bar, tmp;

        if (EngBank_edit_mode == 1) then
                for tmp in string.gfind(this:GetName(), "EngBank_frame_SlotTarget_(%d+)") do
                        bar = tonumber(tmp);
                end

                if ( (bar == nil) or (bar < 1) or (bar > EngBags_MAX_BARS) ) then
                        return;
                end

                if ( button == "LeftButton" ) then

                        if (EngBank_edit_selected ~= "") then
                                -- we got a click, and we already had one selected.  let's move the items
                                EngBankConfig["putinslot--"..EngBank_edit_selected] = bar;

                                EngBank_edit_selected = "";
                                EngBank_edit_hilight = "";

				EngBank_resort_required = EngBank_MANDATORY;
				-- resort will force a window redraw as well
                                EngBank_UpdateWindow();
                        end

		elseif ( button == "RightButton" ) then

			HideDropDownMenu(1);
			EngBank_RightClickMenu_mode = "slot_target";
			EngBank_RightClickMenu_opts = {
				["bar"] = bar
				};
			ToggleDropDownMenu(1, nil, EngBank_frame_RightClickMenu, this:GetName(), -50, 0);

                end
        end
end

function EngBank_SlotTargetButton_OnEnter()
        local bar, tmp, key, value;

        if (EngBank_edit_mode == 1) then
                for tmp in string.gfind(this:GetName(), "EngBank_frame_SlotTarget_(%d+)") do
                        bar = tonumber(tmp);
                end

                if (EngBank_edit_selected ~= "") then
                        GameTooltip:SetOwner(this, "ANCHOR_LEFT");
                        GameTooltip:ClearLines();
                        GameTooltip:AddLine("|cFF00FF7FLeft click to move catagory |r"..EngBank_edit_selected.."|cFF00FF7F to bar |r"..bar, 1,0.25,0.5 );
                        GameTooltip:Show();
                        return;
		else
                        GameTooltip:SetOwner(this, "ANCHOR_LEFT");
                        GameTooltip:ClearLines();
                        GameTooltip:AddLine("|cFF00FF7FBar |r"..bar, 1,0.25,0.5 );
			--GameTooltip:AddLine(" ");
			for key,value in EngBankConfig do
				if ( (string.find(key, "putinslot--")) and (value==bar) and (not string.find(key, "__version")) ) then
					barclass = string.sub(key, 12);
					GameTooltip:AddLine(barclass);
				end
			end
                        GameTooltip:Show();
			return;
                end
        end
        if ( GameTooltip:IsOwned(this) ) then
                GameTooltip:Hide();
                ResetCursor();
        end
end

function EngBank_SlotTargetButton_OnLeave()
        this.updateTooltip = nil;
        if ( GameTooltip:IsOwned(this) ) then
                GameTooltip:Hide();
                ResetCursor();
        end
end

function EngBank_SlotTargetButton_OnUpdate(elapsed)
        if ( not this.updateTooltip ) then
                return;
        end

        this.updateTooltip = this.updateTooltip - elapsed;
        if ( this.updateTooltip > 0 ) then
                return;
        end

        if ( GameTooltip:IsOwned(this) ) then
                EngBank_SlotTargetButton_OnEnter();
        else
                this.updateTooltip = nil;
        end
end

function EngBank_SetNewColor(previousValues)
	local r,g,b,opacity;

	r = nil;
	g = nil;
	b = nil;
	opacity = nil;

	if (this:GetName() == "ColorPickerFrame") then
		r,g,b = this:GetColorRGB();
		opacity = OpacitySliderFrame:GetValue();
	elseif (this:GetName() == "OpacitySliderFrame") then
		opacity = OpacitySliderFrame:GetValue();
	else
		if (previousValues ~= nil) then
			r = previousValues["r"];
			g = previousValues["g"];
			b = previousValues["b"];
			opacity = previousValues["opacity"];
		else
			return;
		end
	end

	if (UIDROPDOWNMENU_MENU_VALUE ~= nil) then
		if (r ~= nil) then
			EngBankConfig["bar_colors_"..(UIDROPDOWNMENU_MENU_VALUE["bar"]).."_"..(UIDROPDOWNMENU_MENU_VALUE["element"]).."_r"] = r;
		end
		if (g ~= nil) then
			EngBankConfig["bar_colors_"..(UIDROPDOWNMENU_MENU_VALUE["bar"]).."_"..(UIDROPDOWNMENU_MENU_VALUE["element"]).."_g"] = g;
		end
		if (b ~= nil) then
			EngBankConfig["bar_colors_"..(UIDROPDOWNMENU_MENU_VALUE["bar"]).."_"..(UIDROPDOWNMENU_MENU_VALUE["element"]).."_b"] = b;
		end
		if (opacity ~= nil) then
			EngBankConfig["bar_colors_"..(UIDROPDOWNMENU_MENU_VALUE["bar"]).."_"..(UIDROPDOWNMENU_MENU_VALUE["element"]).."_a"] = opacity;
		end
		EngBank_window_update_required = EngBank_MANDATORY;
		EngBank_UpdateWindow();
	end
end

function EngBank_RightClick_DeleteItemOverride()
	local bagnum, slotnum, itm;

	bagnum = this.value["bagnum"];
	slotnum = this.value["slotnum"];

	if ( (bagnum ~= nil) and (slotnum ~= nil) ) then
		itm = EngBank_item_cache[bagnum][slotnum];

		if ( (itm["itemlink_override_key"] ~= nil) and (EngBankConfig["item_overrides"][itm["itemlink_override_key"]] ~= nil) ) then
			EngBankConfig["item_overrides"] = EngBags_Table_RemoveKey(EngBankConfig["item_overrides"], itm["itemlink_override_key"] );
			HideDropDownMenu(1);
			EngBank_resort_required = EngBank_MANDATORY;
			-- resort will force a window redraw as well
			EngBank_UpdateWindow();
		end
	end
end

function EngBank_RightClick_SetItemOverride()
	local bagnum, slotnum, itm, new_barclass;

	bagnum = this.value["bagnum"];
	slotnum = this.value["slotnum"];
	new_barclass = this.value["barclass"];

	if ( (bagnum ~= nil) and (slotnum ~= nil) and (new_barclass ~= nil) ) then
		itm = EngBank_item_cache[bagnum][slotnum];

		EngBankConfig["item_overrides"][itm["itemlink_override_key"]] = new_barclass;
		HideDropDownMenu(2);
		HideDropDownMenu(1);
		EngBank_resort_required = EngBank_MANDATORY;
		EngBank_UpdateWindow();
	end
end

function EngBank_frame_RightClickMenu_populate(level)
	local bar, position, bagnum, slotnum;
	local info, itm, barclass, tmp, checked, i;
	local key, value, key2, value2;


	-------------------------------------------------------------------------------------------------
	------------------------------- ITEM CONTEXT MENU -----------------------------------------------
	-------------------------------------------------------------------------------------------------
	if (EngBank_RightClickMenu_mode == "item") then
		-- we have a right click on a button

		bar = EngBank_RightClickMenu_opts["bar"];
		position = EngBank_RightClickMenu_opts["position"];
		bagnum = EngBank_bar_positions[bar][position]["bagnum"];
		slotnum = EngBank_bar_positions[bar][position]["slotnum"];
		itm = EngBank_item_cache[bagnum][slotnum];

		if (level == 1) then
			-- top level of menu

			info = { ["text"] = itm["itemname"], ["notClickable"] = 1, ["isTitle"] = 1, ["notCheckable"] = nil };
			UIDropDownMenu_AddButton(info, level);

			info = { ["disabled"] = 1 };
			UIDropDownMenu_AddButton(info, level);

			info = { ["text"] = "Current Catagory: "..itm["barClass"], ["notClickable"] = 1, ["isTitle"] = 1, ["notCheckable"] = nil };
			UIDropDownMenu_AddButton(info, level);

			info = { ["disabled"] = 1 };
			UIDropDownMenu_AddButton(info, level);

			info = { ["text"] = "Assign item to catagory:", ["hasArrow"] = 1, ["value"] = "override_placement" };
			if (EngBankConfig["item_overrides"][itm["itemlink_override_key"]] ~= nil) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Use default catagory assignment",
				["value"] = { ["bagnum"]=bagnum, ["slotnum"]=slotnum },
				["func"] = EngBank_RightClick_DeleteItemOverride
				};
			if (EngBankConfig["item_overrides"][itm["itemlink_override_key"]] == nil) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			if (EngBank_SHOWITEMDEBUGINFO==1) then
				info = { ["disabled"] = 1 };
				UIDropDownMenu_AddButton(info, level);

				info = { ["text"] = "Debug Info: ", ["hasArrow"] = 1, ["value"] = "show_debug" };
				UIDropDownMenu_AddButton(info, level);
			end
		elseif (level == 2) then
			if ( this.value == "override_placement" ) then
				for i = EngBags_MAX_BARS, 1, -1 do
					info = {
						["text"] = "Catagories within bar "..i;
						["value"] = { ["opt"]="override_placement_select", ["bagnum"]=bagnum, ["slotnum"]=slotnum, ["select_bar"]=i },
						["hasArrow"] = 1
						};
					if ( (EngBankConfig["item_overrides"][itm["itemlink_override_key"]] ~= nil) and (EngBankConfig["putinslot--"..EngBankConfig["item_overrides"][itm["itemlink_override_key"]]] == i) ) then
						info["checked"] = 1;
					end
					UIDropDownMenu_AddButton(info, level);
				end
			elseif ( this.value == "show_debug" ) then
				for key,value in itm do
					if (value == nil) then
						info = { ["text"] = "|cFFFF7FFF"..key.."|r = |cFF007FFFNil|r", ["notClickable"] = 1 };
						UIDropDownMenu_AddButton(info, level);
					else
						if ( (type(value) == "number") or (type(value) == "string") ) then
							info = { ["text"] = "|cFFFF7FFF"..key.."|r = |cFF007FFF"..value.."|r", ["notClickable"] = 1 };
							UIDropDownMenu_AddButton(info, level);
						else
							info = { ["text"] = "|cFFFF7FFF"..key.."|r|cFF338FFF=>Array()|r", ["notClickable"] = 1 };
							UIDropDownMenu_AddButton(info, level);
							for key2,value2 in value do
								info = { ["text"] = "    |cFFFF7FFF["..key2.."]|r = |cFF338FFF"..value2.."|r", ["notClickable"] = 1 };
								UIDropDownMenu_AddButton(info, level);
							end
						end
					end
				end
			end
		elseif (level == 3) then
			if ( this.value ~= nil ) then
				if ( this.value["opt"] == "override_placement_select" ) then
					for key,barclass in EngBank_Catagories(EngBank_Catagories_Exclude_List, this.value["select_bar"]) do
						info = {
							["text"] = barclass;
							["value"] = { ["bagnum"]=bagnum, ["slotnum"]=slotnum, ["barclass"]=barclass },
							["func"] = EngBank_RightClick_SetItemOverride
							};
						if (EngBankConfig["item_overrides"][itm["itemlink_override_key"]] == barclass) then
							info["checked"] = 1;
						end
						UIDropDownMenu_AddButton(info, level);
					end
				end
			end
		end

	-------------------------------------------------------------------------------------------------
	------------------------ SLOT TARGET CONTEXT MENU -----------------------------------------------
	-------------------------------------------------------------------------------------------------
	elseif (EngBank_RightClickMenu_mode == "slot_target") then
		-- right click on a slot
		bar = EngBank_RightClickMenu_opts["bar"];

		info = { ["text"] = "Bar "..bar, ["notClickable"] = 1, ["isTitle"] = 1, ["notCheckable"] = nil };
		UIDropDownMenu_AddButton(info, level);

		info = { ["disabled"] = 1 };
		UIDropDownMenu_AddButton(info, level);

		for key,value in EngBankConfig do
			if ( (string.find(key, "putinslot--")) and (value==bar) and (not string.find(key, "__version")) ) then
				barclass = string.sub(key, 12);

				if ( type(value)=="number" ) then
					info = {
						["text"] = "Select: "..barclass;
						["value"] = barclass;
						["func"] = function()
								EngBank_edit_selected = (this.value);
								EngBank_edit_hilight = (this.value);
								EngBank_window_update_required = EngBank_MANDATORY;
								EngBank_UpdateWindow();
							end
						};
					UIDropDownMenu_AddButton(info, level);
				else
					info = {
						["text"] = "Select: "..barclass.." => "..value,
						["value"] = value;
						["func"] = function()
								EngBank_edit_selected = (this.value);
								EngBank_edit_hilight = (this.value);
								EngBank_window_update_required = EngBank_MANDATORY;
								EngBank_UpdateWindow();
							end
						};
					UIDropDownMenu_AddButton(info, level);
				end
			end
		end

		info = { ["disabled"] = 1 };
		UIDropDownMenu_AddButton(info, level);

		info = { ["text"] = "Sort Mode:", ["notClickable"] = 1, ["isTitle"] = 1, ["notCheckable"] = nil };
		UIDropDownMenu_AddButton(info, level);

		for key,value in {
			[EngBags_NOSORT] = "No sort",
			[EngBags_SORTBYNAME] = "Sort by name",
			[EngBags_SORTBYNAMEREV] = "Sort last words first"
			} do
	
			if (EngBankConfig["bar_sort_"..bar] == key) then
				checked = 1;
			else
				checked = nil;
			end
			info = {
				["text"] = value;
				["value"] = { ["bar"]=bar, ["sortmode"]=key };
				["func"] = function()
						EngBankConfig["bar_sort_"..(this.value["bar"])] = (this.value["sortmode"]);
						EngBank_resort_required = EngBank_MANDATORY;
						EngBank_UpdateWindow();			
					end,
				["checked"] = checked
				};
			UIDropDownMenu_AddButton(info, level);
		end

		info = { ["disabled"] = 1 };
		UIDropDownMenu_AddButton(info, level);

		info = { ["text"] = "Hilight new items:", ["notClickable"] = 1, ["isTitle"] = 1, ["notCheckable"] = nil };
		UIDropDownMenu_AddButton(info, level);

		for key,value in {
			[0] = "Don't tag new items",
			[1] = "Tag new items"
			} do

			if (EngBankConfig["allow_new_in_bar_"..bar] == key) then
				checked = 1;
			else
				checked = nil;
			end

			info = {
				["text"] = value;
				["value"] = { ["bar"]=bar, ["value"]=key };
				["func"] = function()
						EngBankConfig["allow_new_in_bar_"..(this.value["bar"])] = (this.value["value"]);
						EngBank_resort_required = EngBank_MANDATORY;
						EngBank_UpdateWindow();
					end,
				["checked"] = checked
				};
			UIDropDownMenu_AddButton(info, level);
		end

		info = { ["disabled"] = 1 };
		UIDropDownMenu_AddButton(info, level);

		info = { ["text"] = "Color:", ["notClickable"] = 1, ["isTitle"] = 1, ["notCheckable"] = nil };
		UIDropDownMenu_AddButton(info, level);
		info = {
			["text"] = "Background Color",
			["hasColorSwatch"] = 1,
			["hasOpacity"] = 1,
			["r"] = EngBankConfig["bar_colors_"..bar.."_background_r"],
			["g"] = EngBankConfig["bar_colors_"..bar.."_background_g"],
			["b"] = EngBankConfig["bar_colors_"..bar.."_background_b"],
			["opacity"] = EngBankConfig["bar_colors_"..bar.."_background_a"],
			["notClickable"] = 1,
			["value"] = { ["bar"]=bar, ["element"] = "background" },
			["swatchFunc"] = EngBank_SetNewColor,
			["cancelFunc"] = EngBank_SetNewColor,
			["opacityFunc"] = EngBank_SetNewColor
			};
		UIDropDownMenu_AddButton(info, level);
		info = {
			["text"] = "Border Color",
			["hasColorSwatch"] = 1,
			["hasOpacity"] = 1,
			["r"] = EngBankConfig["bar_colors_"..bar.."_border_r"],
			["g"] = EngBankConfig["bar_colors_"..bar.."_border_g"],
			["b"] = EngBankConfig["bar_colors_"..bar.."_border_b"],
			["opacity"] = EngBankConfig["bar_colors_"..bar.."_border_a"],
			["notClickable"] = 1,
			["value"] = { ["bar"]=bar, ["element"] = "border" },
			["swatchFunc"] = EngBank_SetNewColor,
			["cancelFunc"] = EngBank_SetNewColor,
			["opacityFunc"] = EngBank_SetNewColor
			};
		UIDropDownMenu_AddButton(info, level);

	-------------------------------------------------------------------------------------------------
	------------------------ MAIN WINDOW CONTEXT MENU -----------------------------------------------
	-------------------------------------------------------------------------------------------------
	elseif (EngBank_RightClickMenu_mode == "mainwindow") then
		if (level == 1) then

			info = { ["text"] = EBLocal["RightClick_MenuTitle"], ["notClickable"] = 1, ["isTitle"] = 1, ["notCheckable"] = nil };
			UIDropDownMenu_AddButton(info, level);


			info = { ["disabled"] = 1 };
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Hilight New Items",
				["value"] = nil,
				["func"] = EngBank_Button_HighlightToggle_OnClick
				};
			if (EngBank_hilight_new == 1) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Edit Mode",
				["value"] = nil,
				["func"] = EngBank_Button_ChangeEditMode_OnClick
				};
			if (EngBank_edit_mode == 1) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Lock window",
				["value"] = nil,
				["func"] = EngBank_Button_MoveLockToggle_OnClick
				};
			if (EngBankConfig["moveLock"] == 0) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Show Graphics",
				["value"] = nil,
				["func"] = function()
						if (EngBankConfig["show_top_graphics"] == 0) then
							EngBankConfig["show_top_graphics"] = 1;
						else
							EngBankConfig["show_top_graphics"] = 0;
						end
						EngBank_window_update_required = EngBank_MANDATORY;
						EngBank_UpdateWindow();
					end
				};
			if (EngBankConfig["show_top_graphics"] == 1) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			info = { ["disabled"] = 1 };
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Hide Empty Bag Icons",
				["value"] = nil,
				["func"] = function()
						if (EngBankConfig["hide_bag_icons"] == 0) then
							EngBankConfig["hide_bag_icons"] = 1;
						else
							EngBankConfig["hide_bag_icons"] = 0;
						end

						EngBank_window_update_required = ENGINVENTORY_MANDATORY;
						EngBank_UpdateWindow();
					end
				};
			if (EngBankConfig["hide_bag_icons"] == 1) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Hide Purchase Button",
				["value"] = nil,
				["func"] = function()
						if (EngBankConfig["hide_purchase button"] == 0) then
							EngBankConfig["hide_purchase button"] = 1;
							EngBank_SlotCostFrame:Hide();
							EngBank_PurchaseButton:Hide();
						else
							EngBankConfig["hide_purchase button"] = 0;
							EngBank_SlotCostFrame:Show();
							EngBank_PurchaseButton:Show();
						end
						EngBank_window_update_required = EngBank_REQUIRED;
						EngBank_UpdateWindow();
					end
				};
			if (EngBankConfig["hide_purchase button"] == 1) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			info = { ["disabled"] = 1 };
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Reset NEW tag",
				["value"] = nil,
				["func"] = function()
						local bagnum, slotnum, index;

						for index, bagnum in ipairs(EngBank_Bags) do
							if (EngBankConfig["show_Bag"..bagnum] == 1) then
								if (table.getn(EngBank_item_cache[bagnum]) > 0) then
									for slotnum = 1, table.getn(EngBank_item_cache[bagnum]) do
										EngBank_item_cache[bagnum][slotnum]["indexed_on"] = 1;
										EngBank_item_cache[bagnum][slotnum]["display_string"] = "NewItemText_Off";
									end
								end
							end
						end

						EngBank_window_update_required = EngBank_MANDATORY;
						EngBank_UpdateWindow();
					end
				};
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Reload bags",
				["value"] = nil,
				["func"] = function()
						if (EngBank_AtBank==1) then		-- To avoid cleaning the bank cache, u only can reload bags at bank.
							EngBagsItems[EngBank_PLAYERID] = {};
							EngBank_window_update_required = EngBank_REQUIRED;
							EngBank_UpdateWindow();
							EngBags_Print("Bags reloaded.");
						end
					end
				};
			UIDropDownMenu_AddButton(info, level);

			info = { ["disabled"] = 1 };
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Advanced Configuration",
				["value"] = nil,
				["func"] = function()
						EngBank_OptsFrame:Show();
					end
				};
			UIDropDownMenu_AddButton(info, level);

			info = { ["disabled"] = 1 };
			UIDropDownMenu_AddButton(info, level);

			
			info = {
				["text"] = "Set button size";
				["value"] = { ["opt"]="set_button_size" },
				["hasArrow"] = 1
				};
			UIDropDownMenu_AddButton(info, level);

			info = { ["disabled"] = 1 };
			UIDropDownMenu_AddButton(info, level);
			

			info = {
				["text"] = "Background Color",
				["hasColorSwatch"] = 1,
				["hasOpacity"] = 1,
				["r"] = EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_r"],
				["g"] = EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_g"],
				["b"] = EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_b"],
				["opacity"] = EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_a"],
				["notClickable"] = 1,
				["value"] = { ["bar"]=EngBags_MAINWINDOWCOLORIDX, ["element"] = "background" },
				["swatchFunc"] = EngBank_SetNewColor,
				["cancelFunc"] = EngBank_SetNewColor,
				["opacityFunc"] = EngBank_SetNewColor
				};
			UIDropDownMenu_AddButton(info, level);
			info = {
				["text"] = "Border Color",
				["hasColorSwatch"] = 1,
				["hasOpacity"] = 1,
				["r"] = EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_r"],
				["g"] = EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_g"],
				["b"] = EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_b"],
				["opacity"] = EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_a"],
				["notClickable"] = 1,
				["value"] = { ["bar"]=EngBags_MAINWINDOWCOLORIDX, ["element"] = "border" },
				["swatchFunc"] = EngBank_SetNewColor,
				["cancelFunc"] = EngBank_SetNewColor,
				["opacityFunc"] = EngBank_SetNewColor
				};
			UIDropDownMenu_AddButton(info, level);
			info = {
				["isTitle"] = 1,
				["text"] = "- UniRing EngBags v"..ENGBAGS_VERSION.." -",
				["notClickable"] = 1,
				["value"] = 0
				};
			UIDropDownMenu_AddButton(info, level);
		elseif (level == 2) then
			if (this.value ~= nil) then
				if (this.value["opt"] == "set_button_size") then
					for key,value in { 20,30,35,40,50 } do
						info = {
							["text"] = value.."x"..value;
							["value"] = value;
							["func"] = function()
									if ( (type(this.value) == "number") and (this.value > 19) ) then
										EngBankConfig["frameButtonSize"] = this.value;
										EngBank_CalcButtonSize(EngBankConfig["frameButtonSize"]);
										EngBank_window_update_required = EngBank_MANDATORY;
										EngBank_UpdateWindow();
									end
								end
							};
						if (EngBankConfig["frameButtonSize"] == value) then
							info["checked"] = 1;
						end
						UIDropDownMenu_AddButton(info, level);
					end
				end
			end
		end
	end
end


-- Main "right click menu"
function EngBank_frame_RightClickMenu_OnLoad()
	UIDropDownMenu_Initialize(this, EngBank_frame_RightClickMenu_populate, "MENU");
end


function EngBank_IncreaseColumns()
	if (EngBankConfig["maxColumns"] < EngBags_MAXCOLUMNS_MAX) then
		EngBankConfig["maxColumns"] = EngBankConfig["maxColumns"] + 1;
		EngBank_window_update_required = EngBank_MANDATORY;
		EngBank_UpdateWindow();
	end
end

function EngBank_DecreaseColumns()
	if (EngBankConfig["maxColumns"] > EngBags_MAXCOLUMNS_MIN) then
		EngBankConfig["maxColumns"] = EngBankConfig["maxColumns"] - 1;
		EngBank_window_update_required = EngBank_MANDATORY;
		EngBank_UpdateWindow();
	end
end

function EngBank_MoveAndSizeFrame(frameName, childAttachPoint, parentFrameName, parentAttachPoint, xoffset, yoffset, width, height)
        local frame = getglobal(frameName);

        if (frame) then
                frame:ClearAllPoints();
                frame:SetPoint(childAttachPoint, parentFrameName, parentAttachPoint, xoffset, yoffset);
                frame:SetWidth(width);
                frame:SetHeight(height);
                frame:Show();
        else
                message("Attempt to find frame '"..frameName.."' failed.");
        end
end


-- bar == current bar
-- currentbutton == next button to use
-- frame == name of background frame to be relative to
-- width/height == max number of buttons to place into frame
function EngBank_AssignButtonsToFrame(barnum, currentbutton, frame, width, height)
        local cur_x, cur_y, tmpframe;
	local position;
	local bagnum, slotnum;

        cur_x = 0;
        cur_y = 0;

        if (table.getn(EngBank_bar_positions[barnum]) > 0) then
                for position = 1, table.getn(EngBank_bar_positions[barnum]) do
			bagnum = EngBank_bar_positions[barnum][position]["bagnum"];
			slotnum = EngBank_bar_positions[barnum][position]["slotnum"];

                        EngBank_item_cache[bagnum][slotnum]["button_num"] = currentbutton;

                        EngBank_MoveAndSizeFrame("EngBank_frame_Item_"..currentbutton, "BOTTOMRIGHT",
                                frame, "BOTTOMRIGHT",
                                0-(
                                ((cur_x*EngBags_BUTTONFRAME_WIDTH )+EngBags_BUTTONFRAME_X_PADDING) + EngBankConfig["frameXSpace"]
                                ),
                                ((cur_y*EngBags_BUTTONFRAME_HEIGHT)+EngBags_BUTTONFRAME_Y_PADDING) + EngBankConfig["frameYSpace"],
                                EngBags_BUTTONFRAME_BUTTONWIDTH,
                                EngBags_BUTTONFRAME_BUTTONHEIGHT );

                        EngBank_buttons["EngBank_frame_Item_"..currentbutton] = { ["bar"]=barnum, ["position"]=position, ["bagnum"]=bagnum, ["slotnum"]=slotnum };
                        EngBank_UpdateButton( getglobal("EngBank_frame_Item_"..currentbutton), EngBank_item_cache[bagnum][slotnum] );

                        cur_x = cur_x + 1;
                        if (cur_x == width) then
                                cur_x = 0;
                                cur_y = cur_y + 1;
                        end

                        currentbutton = currentbutton + 1;
                end
        end

        if (EngBank_edit_mode == 1) then
                -- add extra button for targetting
                EngBank_MoveAndSizeFrame("EngBank_frame_SlotTarget_"..barnum, "BOTTOMRIGHT",
                        frame, "BOTTOMRIGHT",
                        0-(
                        (((width-1)*EngBags_BUTTONFRAME_WIDTH )+EngBags_BUTTONFRAME_X_PADDING) + EngBankConfig["frameXSpace"]
                        ),
                        (((height-1)*EngBags_BUTTONFRAME_HEIGHT)+EngBags_BUTTONFRAME_Y_PADDING) + EngBankConfig["frameYSpace"],
                        EngBags_BUTTONFRAME_BUTTONWIDTH,
                        EngBags_BUTTONFRAME_BUTTONHEIGHT );

                EngBank_MoveAndSizeFrame("EngBank_frame_SlotTarget_"..barnum.."_bkgr", "TOPLEFT",
                        "EngBank_frame_SlotTarget_"..barnum, "TOPLEFT",
                        0-EngBags_BUTTONFRAME_X_PADDING,
                        EngBags_BUTTONFRAME_Y_PADDING,
                        EngBags_BKGRFRAME_WIDTH,
                        EngBags_BKGRFRAME_HEIGHT );
                
                tmpframe = getglobal("EngBank_frame_SlotTarget_"..barnum.."_BigText");
                tmpframe:SetText( barnum );
                tmpframe:Show();
                tmpframe = getglobal("EngBank_frame_SlotTarget_"..barnum.."_bkgr");
                tmpframe:SetVertexColor( 1,0,0.25, 0.5 );
        end

        return currentbutton;
end

EngBank_WindowIsUpdating = 0;


function EngBank_UpdateWindow()
        local frame = getglobal("EngBank_frame");
        
        local currentbutton, barnum, slotnum;
        local barframe_one, barframe_two, barframe_three, tmpframe;
        local calc_dat, tmpcalc, cur_y;
        local available_width, width_in_between, mid_point;
        EngBags_PrintDEBUG("ei: UpdateWindow()  WindowIsUpdating="..EngBank_WindowIsUpdating );

        if (EngBank_WindowIsUpdating == 1) then
                return;
        end
        EngBank_WindowIsUpdating = 1;

        if ( EBLocal["_loaded"]==0 ) then
                EngBank_WindowIsUpdating = 0;
                return;
        end

	if ( not frame:IsVisible() ) then
		EngBank_WindowIsUpdating = 0;
	return;
	end

	if (EngBank_AtBank==1) then
	        EngBank_Update_item_cache();
	end

	if (EngBank_resort_required == EngBank_MANDATORY) then
		EngBank_Sort_item_cache();
	end

	if (EngBank_edit_mode == 1) then
		EngBank_WindowBottomPadding = EngBank_WINDOWBOTTOMPADDING_EDITMODE;
	else
		EngBank_WindowBottomPadding = EngBank_WINDOWBOTTOMPADDING_NORMALMODE;
	end

	if (EngBank_window_update_required > EngBank_NOTNEEDED) then

		currentbutton = 1;
		cur_y = EngBankConfig["frameYSpace"] + EngBank_WindowBottomPadding;
		for barnum = 1, EngBags_MAX_BARS, 3 do
			barframe_one = getglobal("EngBank_frame_bar_"..barnum);
			barframe_two = getglobal("EngBank_frame_bar_"..(barnum+1));
			barframe_three = getglobal("EngBank_frame_bar_"..(barnum+2));

			calc_dat = {};
			calc_dat = {
				["first"] = table.getn(EngBank_bar_positions[barnum]),
				["second"] = table.getn(EngBank_bar_positions[barnum+1]),
				["third"] = table.getn(EngBank_bar_positions[barnum+2])
				};
			if (EngBank_edit_mode == 1) then
				-- add an extra slot if we're in edit mode
				calc_dat["first"] = calc_dat["first"] + 1;
				calc_dat["second"] = calc_dat["second"] + 1;
				calc_dat["third"] = calc_dat["third"] + 1;
			else
				-- we're not in edit mode, make sure the SlotTarget button and texture is hidden
				for vbarnum = 0, 2 do
				tmpframe = getglobal("EngBank_frame_SlotTarget_"..(barnum+vbarnum));
				tmpframe:Hide();
				tmpframe = getglobal("EngBank_frame_SlotTarget_"..(barnum+vbarnum).."_bkgr");
				tmpframe:Hide();
				end
			end
			--calc_dat["total_in_row"] = calc_dat["first"] + calc_dat["second"] + calc_dat["third"];
  			
    			for index,element in ipairs(EngBags_Bars) do 
				calc_dat[element.."_heighttable"] = {};
				if calc_dat[element] > 0 then
					for tmpcalc = 1, calc_dat[element] do
						calc_dat[element.."_heighttable"][tmpcalc] = math.ceil( calc_dat[element] / tmpcalc );
					end
				end
			end

			calc_dat["height"] = 0;
			repeat
				calc_dat["height"] = calc_dat["height"] + 1;
				tmpcalc = 0;
				for index,element in ipairs(EngBags_Bars) do
					if (calc_dat[element] > 0) then
						if (calc_dat[element.."_heighttable"][calc_dat["height"]]) then
							tmpcalc = tmpcalc + calc_dat[element.."_heighttable"][calc_dat["height"]];
						else
							tmpcalc = tmpcalc + 1;
						end
					end
				end

			until tmpcalc <= EngBankConfig["maxColumns"];

			if tmpcalc == 0 then
				calc_dat["height"] = 0;
			else

				-- at calc_dat["height"], everything fits
				for index,element in ipairs(EngBags_Bars) do
				if calc_dat[element] > 0 then
					if (calc_dat[element.."_heighttable"][calc_dat["height"]]) then
						calc_dat[element.."_width"] = calc_dat[element.."_heighttable"][calc_dat["height"]];
					else
						calc_dat[element.."_width"] = 1;
					end
				else
					calc_dat[element.."_width"] = 0;
				end
				end

			end

			--- now we know the size and height of all 3 bars for this line

			if (calc_dat["height"] == 0) then
				-- all 3 bars are not visible
				barframe_one:Hide();
				barframe_two:Hide();
				barframe_three:Hide();
			else
				available_width = (EngBankConfig["maxColumns"]*EngBags_BUTTONFRAME_WIDTH) + (10*EngBankConfig["frameXSpace"]);

				------------------------------------------------------------------------------------------
				--------- FIRST BAR
				if (calc_dat["first_width"] > 0) then
				EngBank_MoveAndSizeFrame("EngBank_frame_bar_"..barnum, "BOTTOMRIGHT",
					"EngBank_frame", "BOTTOMRIGHT",
					0-EngBankConfig["frameXSpace"],
					cur_y,
					(calc_dat["first_width"]*EngBags_BUTTONFRAME_WIDTH)+(2*EngBankConfig["frameXSpace"]),
					(calc_dat["height"]*EngBags_BUTTONFRAME_HEIGHT)+(2*EngBankConfig["frameYSpace"]) );
				barframe_one:SetBackdropColor(
					EngBankConfig["bar_colors_"..barnum.."_background_r"],
					EngBankConfig["bar_colors_"..barnum.."_background_g"],
					EngBankConfig["bar_colors_"..barnum.."_background_b"],
					EngBankConfig["bar_colors_"..barnum.."_background_a"] );
				barframe_one:SetBackdropBorderColor(
					EngBankConfig["bar_colors_"..barnum.."_border_r"],
					EngBankConfig["bar_colors_"..barnum.."_border_g"],
					EngBankConfig["bar_colors_"..barnum.."_border_b"],
					EngBankConfig["bar_colors_"..barnum.."_border_a"] );
				else
					barframe_one:Hide();
				end
				------------------------------------------------------------------------------------------
				--------- SECOND BAR
				if (calc_dat["second_width"] > 0) then
					width_in_between = available_width - (
						(EngBankConfig["frameXSpace"] * 4) +       -- border on both sides + borders between frames
						((calc_dat["first_width"]*EngBags_BUTTONFRAME_WIDTH)+(2*EngBankConfig["frameXSpace"])) +      -- bar 1 size
						((calc_dat["third_width"]*EngBags_BUTTONFRAME_WIDTH)+(2*EngBankConfig["frameXSpace"]))        -- bar 3 size
						);
					mid_point = (width_in_between/2) +
						((calc_dat["first_width"]*EngBags_BUTTONFRAME_WIDTH)+(2*EngBankConfig["frameXSpace"])) +
						(EngBankConfig["frameXSpace"] * 2);


					EngBank_MoveAndSizeFrame("EngBank_frame_bar_"..(barnum+1), "BOTTOMRIGHT",
						"EngBank_frame", "BOTTOMRIGHT",
						0-( mid_point - (((calc_dat["second_width"]*EngBags_BUTTONFRAME_WIDTH)+(2*EngBankConfig["frameXSpace"]))/2) ),
						cur_y,
						(calc_dat["second_width"]*EngBags_BUTTONFRAME_WIDTH)+(2*EngBankConfig["frameXSpace"]),
						(calc_dat["height"]*EngBags_BUTTONFRAME_HEIGHT)+(2*EngBankConfig["frameYSpace"]) );
					barframe_two:SetBackdropColor(
						EngBankConfig["bar_colors_"..(barnum+1).."_background_r"],
						EngBankConfig["bar_colors_"..(barnum+1).."_background_g"],
						EngBankConfig["bar_colors_"..(barnum+1).."_background_b"],
						EngBankConfig["bar_colors_"..(barnum+1).."_background_a"] );
					barframe_two:SetBackdropBorderColor(
						EngBankConfig["bar_colors_"..(barnum+1).."_border_r"],
						EngBankConfig["bar_colors_"..(barnum+1).."_border_g"],
						EngBankConfig["bar_colors_"..(barnum+1).."_border_b"],
						EngBankConfig["bar_colors_"..(barnum+1).."_border_a"] );
				else
					barframe_two:Hide();
				end

				------------------------------------------------------------------------------------------
				--------- THIRD BAR
				if (calc_dat["third_width"] > 0) then
				EngBank_MoveAndSizeFrame("EngBank_frame_bar_"..(barnum+2), "BOTTOMRIGHT",
					"EngBank_frame", "BOTTOMRIGHT",
					(0-available_width) +(calc_dat["third_width"]*EngBags_BUTTONFRAME_WIDTH)+(3*EngBankConfig["frameXSpace"]),
					cur_y,
					(calc_dat["third_width"]*EngBags_BUTTONFRAME_WIDTH)+(2*EngBankConfig["frameXSpace"]),
					(calc_dat["height"]*EngBags_BUTTONFRAME_HEIGHT)+(2*EngBankConfig["frameYSpace"]) );
				barframe_three:SetBackdropColor(
					EngBankConfig["bar_colors_"..(barnum+2).."_background_r"],
					EngBankConfig["bar_colors_"..(barnum+2).."_background_g"],
					EngBankConfig["bar_colors_"..(barnum+2).."_background_b"],
					EngBankConfig["bar_colors_"..(barnum+2).."_background_a"] );
				barframe_three:SetBackdropBorderColor(
					EngBankConfig["bar_colors_"..(barnum+2).."_border_r"],
					EngBankConfig["bar_colors_"..(barnum+2).."_border_g"],
					EngBankConfig["bar_colors_"..(barnum+2).."_border_b"],
					EngBankConfig["bar_colors_"..(barnum+2).."_border_a"] );
				else
					barframe_three:Hide();
				end
				-----
				currentbutton = EngBank_AssignButtonsToFrame(barnum, currentbutton,
					"EngBank_frame_bar_"..(barnum),
					calc_dat["first_width"], calc_dat["height"] );
				currentbutton = EngBank_AssignButtonsToFrame(barnum+1, currentbutton,
					"EngBank_frame_bar_"..(barnum+1),
					calc_dat["second_width"], calc_dat["height"] );
				currentbutton = EngBank_AssignButtonsToFrame(barnum+2, currentbutton,
					"EngBank_frame_bar_"..(barnum+2),
					calc_dat["third_width"], calc_dat["height"] );

				cur_y = cur_y + (calc_dat["height"]*EngBags_BUTTONFRAME_HEIGHT)+(3*EngBankConfig["frameYSpace"]);
			end
		end

		-- hide unused buttons
		if (currentbutton <= EngBank_MAXBUTTONS) then
			for currentbutton = currentbutton, EngBank_MAXBUTTONS do
				tmpframe = getglobal("EngBank_frame_Item_"..(currentbutton));
				tmpframe:Hide();
			end
		end

		local new_width = (EngBankConfig["maxColumns"]*EngBags_BUTTONFRAME_WIDTH) + (10*EngBankConfig["frameXSpace"]);
		local new_height;
		
		if (EngBankConfig["show_top_graphics"] == 1) then
			new_height = cur_y + EngBank_TOP_PADWINDOW;
		else
			new_height = cur_y + 25;
		end

		frame:SetWidth( new_width );
		frame:SetHeight( new_height );

		frame:ClearAllPoints();
		frame:SetPoint(EngBankConfig["frameYRelativeTo"]..EngBankConfig["frameXRelativeTo"],
			"UIParent", "BOTTOMLEFT",
			EngBankConfig["frame"..EngBankConfig["frameXRelativeTo"]] / frame:GetScale(),
			EngBankConfig["frame"..EngBankConfig["frameYRelativeTo"]] / frame:GetScale());

		frame:SetBackdropColor(
			EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_r"],
			EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_g"],
			EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_b"],
			EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_a"] );
		frame:SetBackdropBorderColor(
			EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_r"],
			EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_g"],
			EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_b"],
			EngBankConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_a"] );

		EngBank_MoneyFrame:Show();

		if (EngBank_AtBank == 0) then
			EngBags_UserDropdown:Show();
		else
			EngBags_UserDropdown:Hide();
		end


		if (EngBank_edit_mode == 1) then
			EngBank_Button_ColumnsAdd:SetText(EBLocal["EngBank_Button_ColumnsAdd_buttontitle"]);
			EngBank_Button_ColumnsAdd:Show();
			EngBank_Button_ColumnsDel:SetText(EBLocal["EngBank_Button_ColumnsDel_buttontitle"]);
			EngBank_Button_ColumnsDel:Show();
		else
			EngBank_Button_ColumnsAdd:Hide();
			EngBank_Button_ColumnsDel:Hide();
		end

		if (EngBankConfig["show_top_graphics"] == 1) then
			--EngBank_Button_Close:Show();
			--EngBank_Button_MoveLockToggle:Show();
			EngBank_Button_ChangeEditMode:Show();
			EngBank_Button_HighlightToggle:Show();

			EngBank_framePortrait:Hide();
			EngBank_frameTextureTopLeft:Hide();
			EngBank_frameTextureTopCenter:Hide();
			EngBank_frameTextureTopRight:Hide();
			EngBank_frameTextureLeft:Hide();
--			EngBank_frameTextureCenter:Hide();
			EngBank_frameTextureRight:Hide();
			EngBank_frameTextureBottomLeft:Hide();
			EngBank_frameTextureBottomCenter:Hide();
			EngBank_frameTextureBottomRight:Hide();
		else
			-- hide all the top graphics
			--EngBank_Button_Close:Hide();
			--EngBank_Button_MoveLockToggle:Hide();
			EngBank_Button_ChangeEditMode:Hide();
			EngBank_Button_HighlightToggle:Hide();

			EngBank_framePortrait:Hide();
			EngBank_frameTextureTopLeft:Hide();
			EngBank_frameTextureTopCenter:Hide();
			EngBank_frameTextureTopRight:Hide();
			EngBank_frameTextureLeft:Hide();
--			EngBank_frameTextureCenter:Hide();
			EngBank_frameTextureRight:Hide();
			EngBank_frameTextureBottomLeft:Hide();
			EngBank_frameTextureBottomCenter:Hide();
			EngBank_frameTextureBottomRight:Hide();
			-- Reposition the dropdown list
			EngBags_UserDropdown:SetPoint("TOPRIGHT", 12, 25);
		end
	end

	EngBank_window_update_required = EngBank_NOTNEEDED;

        EngBank_WindowIsUpdating = 0;
end

function EngBank_UpdateBagState()
        local shouldBeChecked = EngBank_frame:IsVisible();
	if (EngBagsConfig["hook_Bag0"] == 1) then
	        MainMenuBarBackpackButton:SetChecked(shouldBeChecked);
	end
        local bagButton = nil;
        for i = 0, 3 do 
		if (EngBagsConfig["hook_Bag"..(i+1)] == 1) then
			bagButton = getglobal("CharacterBag"..i.."Slot");
			if ( bagButton ) then
				bagButton:SetChecked(shouldBeChecked);
			end
		end
        end
end


function EngBank_SetReplaceBank()
	if BankFrame_Saved == nil then
		BankFrame_Saved = getglobal("BankFrame");
	end
	if ( EngReplaceBank == 0 ) then
		BankFrame_Saved:RegisterEvent("BANKFRAME_OPENED");
		BankFrame_Saved:RegisterEvent("BANKFRAME_CLOSED");
		setglobal("BankFrame", BankFrame_Saved);
		BankFrame_Saved = nil;
	else
		if BankFrame_Saved:IsVisible() then
			BankFrame_Saved:Hide();
		end
		BankFrame_Saved:UnregisterEvent("BANKFRAME_OPENED");
		BankFrame_Saved:UnregisterEvent("BANKFRAME_CLOSED");
		setglobal("BankFrame", EngBank_frame);
	end
end