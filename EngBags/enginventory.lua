-- Constants
ENGINVENTORY_DEBUGMESSAGES = 0;         -- 0 = off, 1 = on
ENGINVENTORY_SHOWITEMDEBUGINFO = 0;
ENGINVENTORY_WIPECONFIGONLOAD = 0;	-- for debugging, test it out on a new config every load

local function print(text)
	DEFAULT_CHAT_FRAME:AddMessage(text)
end

BINDING_HEADER_ENGINVENTORY = "EngInventory @ EngBags";
BINDING_NAME_EI_TOGGLE = "Toggle Inventory Window";

ENGINVENTORY_MAXBUTTONS = 109;


ENGINVENTORY_TOP_PADWINDOW = 30;


EngInventory_ShowPrice = 1;     -- ???

ENGINVENTORY_WINDOWBOTTOMPADDING_EDITMODE = 50;
ENGINVENTORY_WINDOWBOTTOMPADDING_NORMALMODE = 25;

EngInventory_WindowBottomPadding = ENGINVENTORY_WINDOWBOTTOMPADDING_NORMALMODE;

--//CFM
 function EI_CreateBagsBar()
  if pfUI then
	local button_size, b=EngInventoryConfig["frameButtonSize"],.1
     if not EI_bagslots then
        EI_bagslots = CreateFrame("Frame", "EIBagSlots", EngInventory_frame)
		EI_bagslots.slots = {}
        EI_bagslots:Hide()
     end
    local min, max = 0, 3
	EI_bagslots:SetPoint("BOTTOMRIGHT", EngInventory_frame, "BOTTOMRIGHT", 128, 10)
    local width = (button_size/5*4 + b*2) * (max-min+1)
    local height = b + (button_size/5*4 + b)
    EI_bagslots:SetWidth(width)
    EI_bagslots:SetHeight(height)
    for slot=min, max do
      if not EI_bagslots.slots[slot] then
        EI_bagslots.slots[slot] = {}
        EI_bagslots.slots[slot].frame = CreateFrame("CheckButton", "EIUIBagsBBag" .. slot .. "Slot", EI_bagslots, "BagSlotButtonTemplate")
        local icon = getglobal(EI_bagslots.slots[slot].frame:GetName() .. "IconTexture")
        local border = getglobal(EI_bagslots.slots[slot].frame:GetName() .. "NormalTexture")
        icon:SetTexCoord(.08, .92, .08, .92)
        icon:ClearAllPoints()
        icon:SetPoint("TOPLEFT", 1, -1)
        icon:SetPoint("BOTTOMRIGHT", -1, 1)
		border:SetTexture("")
        EI_bagslots.slots[slot].frame.slot = slot
        EI_bagslots.slots[slot].slot = slot
		local SlotEnter = EI_bagslots.slots[slot].frame:GetScript("OnEnter")
        EI_bagslots.slots[slot].frame:SetScript("OnEnter", function()
          -- for slot, f in ipairs(pfUI.bags[this.slot + 1].slots) do
            -- pfUI.api.CreateBackdrop(f.frame, default_border)
            -- f.frame.backdrop:SetBackdropBorderColor(.2,1,.8,1)
          -- end
          SlotEnter()
        end)
        local SlotLeave = EI_bagslots.slots[slot].frame:GetScript("OnLeave")
        EI_bagslots.slots[slot].frame:SetScript("OnLeave", function()
          --pfUI.bag:UpdateBag(this.slot + 1)
          SlotLeave()
        end)
      end
	 local left = (slot-min)*(button_size/5*4+3*2) + b
     local top = -b
      EI_bagslots.slots[slot].frame:ClearAllPoints()
	  EI_bagslots.slots[slot].frame:SetPoint("TOPLEFT", EI_bagslots, "TOPLEFT", top, left)
      EI_bagslots.slots[slot].frame:SetHeight(button_size/5*4)
      EI_bagslots.slots[slot].frame:SetWidth(button_size/5*4)
	  local id, texture = GetInventorySlotInfo("Bag" .. slot .. "Slot")
	 -- pfUI.api.CreateBackdrop(EI_bagslots.slots[slot].frame, 3)
	  --EI_bagslots.slots[slot].frame:SetBackdrop(DropDownList1Backdrop:GetBackdrop())
      EI_bagslots.slots[slot].frame:Show()
    end
	EI_bagslots:Show();
   end
  end
--CFM//

EngInventory_item_cache = { {}, {}, {}, {}, {} };	-- cache of all the items as they appear in bags
EngInventory_bar_positions = {};
EngInventory_buttons = {};
EngInventory_hilight_new = 0;
EngInventory_edit_mode = 0;
EngInventory_edit_hilight = "";         -- when editmode is 1, which items do you want to hilight
EngInventory_edit_selected = "";        -- when editmode is 1, this is the class of item you clicked on
EngInventory_RightClickMenu_mode = "";
EngInventory_RightClickMenu_opts = {};
EngInventory_Bags = { KEYRING_CONTAINER, 0, 1, 2, 3, 4}  -- add support for keyring

ENGINVENTORY_NOTNEEDED = 0;	-- when items haven't changed, or only item counts
ENGINVENTORY_REQUIRED = 1;	-- when items have changed location, but it's been sorted once and won't break if we don't sort again
ENGINVENTORY_MANDATORY = 2;	-- it's never been sorted, the window is in an unstable state, you MUST sort.

EngInventory_resort_required = ENGINVENTORY_MANDATORY;
EngInventory_window_update_required = ENGINVENTORY_MANDATORY;

EngInventory_BuildTradeList = {};	-- only build a full list of trade skill info once
EngInventory_AddItem = nil;

-- Mod developers that hook the PickupContainerItem function need to change these variables
-- to disable EngBags implementation of alt+click functions, you can disable one, two or all :)
-- This is to avoid conflicts with more than one mod implementing the alt+click functions.
-- I tried to check for every addon that plays with that functions but there are a lot and i cant
-- do that, please devs, simply change this variables to let this addon work with yours.
EngBags_AltClick_Auction = 1;
EngBags_AltClick_Trade = 1;
EngBags_AltClick_Mail = 1;

EngInventory_Catagories_Exclude_List = {};
------------------------
EngInventory_ConfigOptions_Default = {
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
				return EngInventoryConfig["maxColumns"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["maxColumns"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
				EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
				EngInventory_UpdateWindow();
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = EngBags_MAXCOLUMNS_MAX }
	},

	{	-- Button Size
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Button Size:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = EngBags_BUTTONSIZE_MIN },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = EngBags_BUTTONSIZE_MIN, ["maxValue"] = EngBags_BUTTONSIZE_MAX, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["frameButtonSize"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["frameButtonSize"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
				EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
				EngInventory_UpdateWindow();
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = EngBags_BUTTONSIZE_MAX }
	},

	{	-- Font Size / item count
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Item count font size:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = EngBags_FONTSIZE_MIN },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = EngBags_FONTSIZE_MIN, ["maxValue"] = EngBags_FONTSIZE_MAX, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["button_size_opts"]["EngBags_BUTTONFONTHEIGHT"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["button_size_opts"]["EngBags_BUTTONFONTHEIGHT"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
				EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
				EngInventory_UpdateWindow();
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = EngBags_FONTSIZE_MAX }
	},

	{	-- Font Size / New text
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "New tag font size:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = EngBags_FONTSIZE_MIN },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = EngBags_FONTSIZE_MIN, ["maxValue"] = EngBags_FONTSIZE_MAX, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["button_size_opts"]["EngBags_BUTTONFONTHEIGHT2"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["button_size_opts"]["EngBags_BUTTONFONTHEIGHT2"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
				EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
				EngInventory_UpdateWindow();
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = EngBags_FONTSIZE_MAX }
	},


	{	-- Frame spacing / X
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Frame spacing - X:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = 0 },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 10, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["frameXSpace"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["frameXSpace"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
				EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
				EngInventory_UpdateWindow();
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = 10 }
	},

	{	-- Frame spacing / Y
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Frame spacing - Y:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = 0 },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 10, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["frameYSpace"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["frameYSpace"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
				EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
				EngInventory_UpdateWindow();
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = 10 }
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
				return EngInventoryConfig["newItemText"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["newItemText"] = v;
				EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
				EngInventory_UpdateWindow();
			end
		},
	},
	{	-- Item count increased text
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.5, ["color"] = { 1,1,0.25 },
		  ["text"] = "Item count increased:" },
		{ ["type"] = "Edit", ["ID"] = 1, ["width"] = 0.2, ["letters"]=10,
		  ["defaultValue"] = function()
				return EngInventoryConfig["newItemTextPlus"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["newItemTextPlus"] = v;
				EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
				EngInventory_UpdateWindow();
			end
		},
	},
	{	-- Item count decreased text
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.5, ["color"] = { 1,1,0.25 },
		  ["text"] = "Item count decreased:" },
		{ ["type"] = "Edit", ["ID"] = 1, ["width"] = 0.2, ["letters"]=10,
		  ["defaultValue"] = function()
				return EngInventoryConfig["newItemTextMinus"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["newItemTextMinus"] = v;
				EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
				EngInventory_UpdateWindow();
			end
		},
	},
	{	-- New Tag timing
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.5, ["color"] = { 1,1,0.25 }, ["text"] = "Timeout for new tag - older (Minutes):" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.5, ["minValue"] = 0, ["maxValue"] = 60*6, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return ceil(EngInventoryConfig["newItemTimeout"] / 60);
			end,
		  ["func"] = function(v)
				EngInventoryConfig["newItemTimeout"] = tonumber(v) * 60;
				EngInventory_SetDefaultValues(0);
				EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
				EngInventory_UpdateWindow();
			end
		}
	},
	{	-- New Tag timing
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.5, ["color"] = { 1,1,0.25 }, ["text"] = "Timeout for new tag - newer (Minutes):" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.5, ["minValue"] = 0, ["maxValue"] = 60*1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return ceil(EngInventoryConfig["newItemTimeout2"] / 60);
			end,
		  ["func"] = function(v)
				EngInventoryConfig["newItemTimeout2"] = tonumber(v) * 60;
				EngInventory_SetDefaultValues(0);
				EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
				EngInventory_UpdateWindow();
			end
		}
	},


	{},	---------------------------------------------------------------------------------------
	{
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 1.0, ["color"] = { 1,0,0.25 }, ["align"] = "center",
		  ["text"] = "Bag Hooks" },
	},
	{},	---------------------------------------------------------------------------------------
	{	-- Hook "Open All Bags"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Open all bags:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["hook_OpenAllBags"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["hook_OpenAllBags"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},
	{	-- Hook "Backpack"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Backpack:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["hook_Bag0"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["hook_Bag0"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},
	{	-- Hook "Bag 1"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Bag 1:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["hook_Bag1"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["hook_Bag1"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},
	{	-- Hook "Bag 2"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Bag 2:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["hook_Bag2"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["hook_Bag2"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},
	{	-- Hook "Bag 3"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Bag 3:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["hook_Bag3"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["hook_Bag3"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},
	{	-- Hook "Bag 4"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Bag 4:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["hook_Bag4"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["hook_Bag4"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},
	{	-- Hook "Bag -2" (KeyRing)
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "KeyRing:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["hook_Bag-2"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["hook_Bag-2"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},


	{	-- Show "Backpack"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Include Backpack Contents:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["show_Bag0"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["show_Bag0"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},
	{	-- Show "Bag 1"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Include Bag 1 Contents:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["show_Bag1"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["show_Bag1"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},
	{	-- Show "Bag 2"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Include Bag 2 Contents:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["show_Bag2"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["show_Bag2"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},
	{	-- Show "Bag 3"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Include Bag 3 Contents:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["show_Bag3"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["show_Bag3"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},
	{	-- Show "Bag 4"
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Include Bag 4 Contents:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["show_Bag4"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["show_Bag4"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},
	{	-- Show "Bag -2" (KeyRing)
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Include KeyRing Contents:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["show_Bag-2"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["show_Bag-2"] = tonumber(v);
				EngInventory_SetDefaultValues(0);
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
				return EngInventoryConfig["build_trade_list"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["build_trade_list"] = tonumber(v);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},

	{	-- Tooltip Mode Setting
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Tooltip Mode:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Mode 1" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["tooltip_mode"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["tooltip_mode"] = tonumber(v);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "Mode 2" }
	},

	{	-- Alt+Click Auction Setting
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Alt+Click Auction:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["EngBags_AltClick_Auction"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["EngBags_AltClick_Auction"] = tonumber(v);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},

	{	-- Alt+Click Trade Setting
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Alt+Click Trade:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["EngBags_AltClick_Trade"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["EngBags_AltClick_Trade"] = tonumber(v);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},

	{	-- Alt+Click Mail Setting
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.4, ["color"] = { 1,1,0.25 }, ["text"] = "Alt+Click Mail:" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "right", ["text"] = "Off" },
		{ ["type"] = "Slider", ["ID"] = 1, ["width"] = 0.4, ["minValue"] = 0, ["maxValue"] = 1, ["valueStep"] = 1,
		  ["defaultValue"] = function()
				return EngInventoryConfig["EngBags_AltClick_Mail"];
			end,
		  ["func"] = function(v)
				EngInventoryConfig["EngBags_AltClick_Mail"] = tonumber(v);
			end
		},
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.1, ["color"] = { 0,1,0.5 }, ["align"] = "left", ["text"] = "On" }
	},

	{},	---------------------------------------------------------------------------------------
	{
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 1.0, ["color"] = { 1,0,0.25 }, ["align"] = "center",
		  ["text"] = "Item Search and Assignment" },
	},
	{},	---------------------------------------------------------------------------------------
	{
		{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.025+0.025+0.025 + 0.005, ["color"] = { 1,0,0.25 }, ["text"] = "" },
		{ ["type"] = "Text", ["ID"] = 2, ["width"] = 0.20, ["color"] = { 1,0,0.25 }, ["text"] = "Catagory" },
		{ ["type"] = "Text", ["ID"] = 3, ["width"] = 0.20, ["color"] = { 1,0,0.25 }, ["text"] = "Keywords" },
		{ ["type"] = "Text", ["ID"] = 4, ["width"] = 0.35, ["color"] = { 1,0,0.25 }, ["text"] = "Tooltip Search" },
		{ ["type"] = "Text", ["ID"] = 5, ["width"] = 0.170, ["color"] = { 1,0,0.25 }, ["text"] = "ItemType" }
	}
};

EngInventory_ConfigOptions = EngInventory_ConfigOptions_Default;

function EngInventory_Config_GetItemSearchList(key, idx)
	return EngInventoryConfig["item_search_list"][key][idx]
end
function EngInventory_Config_AssignItemSearchList(v, key, idx)
	if (key ~= nil) then
		EngInventoryConfig["item_search_list"][key][idx] = v;
	end
end

function EngInventory_Config_GetItemSearchListLower(key, idx)
	return string.lower(EngInventoryConfig["item_search_list"][key][idx]);
end
function EngInventory_Config_AssignItemSearchListUpper(v, key, idx)
	if (key ~= nil) then
		EngInventoryConfig["item_search_list"][key][idx] = string.upper(v);
	end
end

function EngInventory_Config_SwapSearchListItems(unused_value, key1, key2)
	local tmp;

	if ( (EngInventoryConfig["item_search_list"][key1] ~= nil) and (EngInventoryConfig["item_search_list"][key2] ~= nil) ) then
		tmp = EngInventoryConfig["item_search_list"][key1];
		EngInventoryConfig["item_search_list"][key1] = EngInventoryConfig["item_search_list"][key2];
		EngInventoryConfig["item_search_list"][key2] = tmp;

		if (key1 > key2) then
			EngInventory_Opts_CurrentPosition = EngInventory_Opts_CurrentPosition - 1;
		else
			EngInventory_Opts_CurrentPosition = EngInventory_Opts_CurrentPosition + 1;
		end

		EngInventory_Options_UpdateWindow();
	end
end

function EngInventory_CreateConfigOptions()
	local key,value;

	EngInventory_ConfigOptions = EngInventory_ConfigOptions_Default;

	for key,value in EngInventoryConfig["item_search_list"] do
		table.insert( EngInventory_ConfigOptions,
			{
{ ["type"] = "Text", ["ID"] = 1, ["width"] = 0.025, ["color"] = { 1,0,1 }, ["text"] = key.."." },
{ ["type"] = "UpButton", ["ID"] = 1, ["width"] = 0.025,
  ["param1"] = key, ["param2"] = key-1,
  ["func"] = EngInventory_Config_SwapSearchListItems
},
{ ["type"] = "DownButton", ["ID"] = 1, ["width"] = 0.025,
  ["param1"] = key, ["param2"] = key+1,
  ["func"] = EngInventory_Config_SwapSearchListItems
},
{ ["type"] = "Edit", ["ID"] = 1, ["width"] = 0.20, ["letters"]=50, ["param1"] = key, ["param2"] = 1,
  ["defaultValue"] = EngInventory_Config_GetItemSearchListLower, ["func"] = EngInventory_Config_AssignItemSearchListUpper
},
{ ["type"] = "Edit", ["ID"] = 2, ["width"] = 0.20, ["letters"]=50, ["param1"] = key, ["param2"] = 2,
  ["defaultValue"] = EngInventory_Config_GetItemSearchListLower, ["func"] = EngInventory_Config_AssignItemSearchListUpper
},
{ ["type"] = "Edit", ["ID"] = 3, ["width"] = 0.35, ["letters"]=50, ["param1"] = key, ["param2"] = 3,
  ["defaultValue"] = EngInventory_Config_GetItemSearchList, ["func"] = EngInventory_Config_AssignItemSearchList
},
{ ["type"] = "Edit", ["ID"] = 4, ["width"] = 0.175, ["letters"]=50, ["param1"] = key, ["param2"] = 4,
  ["defaultValue"] = EngInventory_Config_GetItemSearchList, ["func"] = EngInventory_Config_AssignItemSearchList
}
			}  );
	
	end

end
------------------------
function EngInventory_CalcButtonSize(newsize)
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

	if (EngInventoryConfig[k] == nil) then
		EngInventoryConfig[k] = {
			["EngBags_BUTTONFONTHEIGHT"] = 0.35 * EngBags_BUTTONFRAME_BUTTONHEIGHT,
			["EngBags_BUTTONFONTHEIGHT2"] = 0.30 * EngBags_BUTTONFRAME_BUTTONHEIGHT,
			["ENGINVENTORY_BUTTONFONTDISTANCE_Y"] = (0.08 * EngBags_BUTTONFRAME_WIDTH),
			["ENGINVENTORY_BUTTONFONTDISTANCE_X"] = (0.10 * EngBags_BUTTONFRAME_HEIGHT)
		};

		if (newsize == 40) then
			EngInventoryConfig[k]["EngBags_BUTTONFONTHEIGHT"] = 14;
			EngInventoryConfig[k]["EngBags_BUTTONFONTHEIGHT2"] = 12;
			EngInventoryConfig[k]["ENGINVENTORY_BUTTONFONTDISTANCE_Y"] = 2;
			EngInventoryConfig[k]["ENGINVENTORY_BUTTONFONTDISTANCE_X"] = 5;
		end
	end

	EngBags_BUTTONFONTHEIGHT = math.ceil(EngInventoryConfig[k]["EngBags_BUTTONFONTHEIGHT"]);
	EngBags_BUTTONFONTHEIGHT2 = math.ceil(EngInventoryConfig[k]["EngBags_BUTTONFONTHEIGHT2"]);
	ENGINVENTORY_BUTTONFONTDISTANCE_Y = EngInventoryConfig[k]["ENGINVENTORY_BUTTONFONTDISTANCE_Y"];
	ENGINVENTORY_BUTTONFONTDISTANCE_X = EngInventoryConfig[k]["ENGINVENTORY_BUTTONFONTDISTANCE_X"];
end

-- scan the config and build a list of catagories
function EngInventory_Catagories(exclude_list, select_bar)
	local clist, key, value;

	clist = {};

	for key,value in EngInventoryConfig do
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

function EI_SetDefault(varname, defaultvalue, resetversion, cleanupfunction, cleanup_param1, cleanup_param2)
	EngInventoryConfig = EngBagsConfig["Inventory"][EngBags_PLAYERID];
	local orig_value = EngInventoryConfig[varname];

	if (orig_value == nil) then
		orig_value = "";
	end

        if (resetversion == nil) then
                -- more debugging
                message("* Warning, EngBags EI_SetDefault called with nil reset version: "..varname.." *");
                resetversion = 0;
        end

        if (cleanupfunction ~= nil) then
                EngInventoryConfig[varname] = cleanupfunction(EngInventoryConfig[varname], cleanup_param1, cleanup_param2);
        end

        if (EngInventoryConfig[varname] == nil) then
                EngInventoryConfig[varname] = defaultvalue;
        elseif (EngInventoryConfig[varname.."__version"] == nil) then
                EngInventoryConfig[varname] = defaultvalue;
        elseif (EngInventoryConfig[varname.."__version"] < resetversion) then
		EngBags_PrintDEBUG("old version: "..EngInventoryConfig[varname.."__version"]..", resetversion: "..resetversion);
                EngBags_Print( varname.." was reset to it's default value.  Changed from '"..orig_value.."' to "..EngInventoryConfig[varname], 1,0,0 );
                EngInventoryConfig[varname] = defaultvalue;
        end

        EngInventoryConfig[varname.."__version"] = resetversion;
end

function EngInventory_SetClassBars()
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

	EngInventoryConfig["putinslot--SOULSHARDS"] = c["WARLOCK"].."1";
	EngInventoryConfig["putinslot--WARLOCK_REAGENTS"] = c["WARLOCK"].."2";

	EngInventoryConfig["putinslot--ROGUE_POISON"] = c["ROGUE"].."1";
	EngInventoryConfig["putinslot--ROGUE_POWDER"] = c["ROGUE"].."1";

	EngInventoryConfig["putinslot--MAGE_REAGENT"] = c["MAGE"].."1";

	EngInventoryConfig["putinslot--SHAMAN_REAGENTS"] = c["SHAMAN"].."1";
end

-- set "re" to 1 to restore all default values
function EngInventory_SetDefaultValues(re)
        local i, key, value, newEngInventoryConfig;
	local current_config_version = 1;	-- increase this number to wipe everyone's settings

        if ( (EngInventoryConfig == nil) or (EngInventoryConfig["configVersion"] == nil) or (EngInventoryConfig["configVersion"] ~= current_config_version) ) then
                EngInventoryConfig = { ["configVersion"] = current_config_version };
        end

	EI_SetDefault("tooltip_mode", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("EngBags_AltClick_Auction", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("EngBags_AltClick_Trade", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("EngBags_AltClick_Mail", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("hide_bag_icons", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("hide_keyring_empty_slots", 1, 1+re, EngBags_NumericRange, 0, 1);

        EI_SetDefault("maxColumns", 9, 1+re, EngBags_NumericRange, EngBags_MAXCOLUMNS_MIN,EngBags_MAXCOLUMNS_MAX);

        EI_SetDefault("moveLock", 1, 1+re, EngBags_NumericRange, 0,1);

	EI_SetDefault("hook_OpenAllBags", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("hook_Bag0", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("hook_Bag1", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("hook_Bag2", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("hook_Bag3", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("hook_Bag4", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("hook_Bag-2", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("show_Bag0", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("show_Bag1", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("show_Bag2", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("show_Bag3", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("show_Bag4", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("show_Bag-2", 1, 1+re, EngBags_NumericRange, 0, 1);

        EI_SetDefault("frameWindowScale", 0.64, 1+re, EngBags_NumericRange, 0.64, 1.0);
	EI_SetDefault("frameButtonSize", 40, 1+re, EngBags_NumericRange, 15, 80);

	EngInventory_CalcButtonSize(EngInventoryConfig["frameButtonSize"]);

        EI_SetDefault("frameLEFT", UIParent:GetRight() * UIParent:GetScale() * 0.5, 2+re, EngBags_NumericRange);
        EI_SetDefault("frameRIGHT", UIParent:GetRight() * UIParent:GetScale() * 0.975, 2+re, EngBags_NumericRange);
        EI_SetDefault("frameTOP", UIParent:GetTop() * UIParent:GetScale() * 0.90, 2+re, EngBags_NumericRange);
        EI_SetDefault("frameBOTTOM", UIParent:GetTop() * UIParent:GetScale() * 0.19, 2+re, EngBags_NumericRange);
        EI_SetDefault("frameXRelativeTo", "RIGHT", 1+re, EngBags_StringChoices, {"RIGHT","LEFT"} );
        EI_SetDefault("frameYRelativeTo", "BOTTOM", 1+re, EngBags_StringChoices, {"TOP","BOTTOM"} );

	EI_SetDefault("frameXSpace", 5, 1+re, EngBags_NumericRange, 0, 20);
        EI_SetDefault("frameYSpace", 5, 1+re, EngBags_NumericRange, 0, 20);

	EI_SetDefault("show_top_graphics", 1, 1+re, EngBags_NumericRange, 0, 1);
	EI_SetDefault("build_trade_list", 0, 1+re, EngBags_NumericRange, 0, 1);

        EI_SetDefault("newItemText", "*New*", 1+re);
        EI_SetDefault("newItemTextPlus", "++", 1+re);
        EI_SetDefault("newItemTextMinus", "--", 1+re);
	EI_SetDefault("newItemText_Off", "", 1+re);
        EI_SetDefault("newItemTimeout", 60*60*3 , 1+re, EngBags_NumericRange);     -- 3 hours for an item to lose "new" status
        EI_SetDefault("newItemTimeout2", 60*10 , 1+re, EngBags_NumericRange);      -- 10 minutes
        EI_SetDefault("newItemColor1_R", 0.9 , 1+re, EngBags_NumericRange, 0, 1.0);
        EI_SetDefault("newItemColor1_G", 0.9 , 1+re, EngBags_NumericRange, 0, 1.0);
        EI_SetDefault("newItemColor1_B", 0.2 , 1+re, EngBags_NumericRange, 0, 1.0);
        EI_SetDefault("newItemColor2_R", 0.0 , 1+re, EngBags_NumericRange, 0, 1.0);
        EI_SetDefault("newItemColor2_G", 1.0 , 1+re, EngBags_NumericRange, 0, 1.0);
        EI_SetDefault("newItemColor2_B", 0.4 , 1+re, EngBags_NumericRange, 0, 1.0);

	for i = 1, EngBags_MAINWINDOWCOLORIDX do
		EI_SetDefault("bar_colors_"..i.."_background_r", 0.0, 1+re, EngBags_NumericRange, 0, 1.0);
		EI_SetDefault("bar_colors_"..i.."_background_g", 0.25, 1+re, EngBags_NumericRange, 0, 1.0);
		EI_SetDefault("bar_colors_"..i.."_background_b", 0.5, 1+re, EngBags_NumericRange, 0, 1.0);
		EI_SetDefault("bar_colors_"..i.."_background_a", 0.5, 1+re, EngBags_NumericRange, 0, 1.0);

		EI_SetDefault("bar_colors_"..i.."_border_r", 0.0, 1+re, EngBags_NumericRange, 0, 1.0);
		EI_SetDefault("bar_colors_"..i.."_border_g", 0.5, 1+re, EngBags_NumericRange, 0, 1.0);
		EI_SetDefault("bar_colors_"..i.."_border_b", 1.0, 1+re, EngBags_NumericRange, 0, 1.0);
		EI_SetDefault("bar_colors_"..i.."_border_a", 0.5, 1+re, EngBags_NumericRange, 0, 1.0);
	end

	EngInventory_SetClassBars();

        -- default slot locations for items
	EI_SetDefault("putinslot--CLASS_ITEMS1", 15, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        --EI_SetDefault("putinslot--SOULSHARDS", 15, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--EMPTY_PROJECTILE_SLOTS", 15, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--USED_PROJECTILE_SLOTS", 15, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--PROJECTILE", 14, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);          -- arrows and bullets that AREN'T in your shot bags
        EI_SetDefault("putinslot--EMPTY_SLOTS", 13, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);         -- Empty slots go in this bar
        EI_SetDefault("putinslot--SHARD_EMPTY_SLOTS", 13, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);         -- Empty slots go in this bar
        EI_SetDefault("putinslot--ENCHANT_EMPTY_SLOTS", 13, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);         -- Empty slots go in this bar
        EI_SetDefault("putinslot--HERB_EMPTY_SLOTS", 13, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);         -- Empty slots go in this bar
        EI_SetDefault("putinslot--ARROW_EMPTY_SLOTS", 13, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);         -- Empty slots go in this bar
        EI_SetDefault("putinslot--AMMO_EMPTY_SLOTS", 13, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);         -- Empty slots go in this bar
        EI_SetDefault("putinslot--GRAY_ITEMS", 13, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);          -- Gray items go in this bar
        --
        EI_SetDefault("putinslot--OTHERORUNKNOWN", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);      -- if not soulbound, but doesn't match any other catagory, it goes here
        EI_SetDefault("putinslot--TRADEGOODS", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	--EI_SetDefault("putinslot--NON_CLASS_ITEMS1", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--RECIPE", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--PATTERN", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--SCHEMATIC", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--FORMULA", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--TRADESKILL_COOKING", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--TRADESKILL_FIRSTAID", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	--EI_SetDefault("putinslot--NON_CLASS_ITEMS2", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--OTHERSOULBOUND", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);       -- this will usually be soulbound equipment
	EI_SetDefault("putinslot--CUSTOM_01", 10, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--CUSTOM_02", 10, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--CUSTOM_03", 10, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--CUSTOM_04", 10, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--CUSTOM_05", 10, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--CUSTOM_06", 10, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	--
        EI_SetDefault("putinslot--CONSUMABLE", 9, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--TRADESKILL_2", 8, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--TRADESKILL_1", 8, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--TRADESKILL_2_CREATED", 8, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--TRADESKILL_1_CREATED", 8, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--EQUIPPED", 7, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        --
        EI_SetDefault("putinslot--FOOD", 6, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--DRINK", 5, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--QUESTITEMS", 4, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        --
        EI_SetDefault("putinslot--HEALINGPOTION", 3, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--HEALTHSTONE", 3, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--MANAPOTION", 2, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--BANDAGE", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--REAGENT", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--JUJU", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--MISC", 14, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--TRADETOOLS", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--MINIPET", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--HEARTH", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
        EI_SetDefault("putinslot--KEYS", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
		EI_SetDefault("putinslot--KEYS2", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--CLASS_ITEMS2", 1, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);

	-- NEW EQUIP SORTING
	EI_SetDefault("putinslot--BOP_BOE", 12, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPSHIRT", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPSHOULDER", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPLEGS", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPFEET", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPFINGER", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPWRIST", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPTABARD", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPBACK", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPCHEST", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPHEAD", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPNECK", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPHANDS", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPWAIST", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPTRINKET", 11, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPFIRERESIST", 7, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPFROSTRESIST", 7, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPSHADOWRESIST", 7, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPNATURERESIST", 7, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);
	EI_SetDefault("putinslot--EQUIPARCANERESIST", 7, 1+re, EngBags_NumericRange, 1, EngBags_MAX_BARS);


        -- default item overrides
	EI_SetDefault("itemoverride_loaddefaults", 1, 3+re, EngBags_NumericRange, 0, 1);
	if (EngInventoryConfig["itemoverride_loaddefaults"] == 1) then
		EngInventoryConfig["item_overrides"] = EngBags_DefaultItemOverrides;
		EngInventoryConfig["item_search_list"] = EngBags_DefaultSearchList;

		for key,value in EngInventoryConfig["item_search_list"] do
			if (string.sub(value[4], 1, 5) == "loc::") then
				EngInventoryConfig["item_search_list"][key][4] = EILocal[ string.sub(value[4],6) ];
			end
		end

		for key,value in EILocal["string_searches"] do
			table.insert(EngInventoryConfig["item_search_list"], EngBags_DefaultSearchItemsINSERTTO,
				{ value[1], "", value[2], "" } );
		end

		EngInventoryConfig["itemoverride_loaddefaults"] = 0;
	end

	-- cleanup old overrides that shouldn't be in the config anymore
	newEngInventoryConfig = EngInventoryConfig;
	for key,value in EngInventoryConfig do
		if (string.find(key, "itemoverride--")) then
			newEngInventoryConfig = EngBags_Table_RemoveKey(newEngInventoryConfig, key);
		end
	end
	EngInventoryConfig = newEngInventoryConfig;

        -- default sort views / default "allow new items in bar" settings
        EI_SetDefault("bar_sort_"..EngInventoryConfig["putinslot--EMPTY_SLOTS"], EngBags_SORTBYNAMEREV, 2+re, EngBags_NumericRange, EngBags_SORTLOWESTVALUE, EngBags_SORTHIGHESTVALUE);
        EI_SetDefault("bar_sort_"..EngInventoryConfig["putinslot--HEALINGPOTION"], EngBags_SORTBYNAMEREV, 2+re, EngBags_NumericRange, EngBags_SORTLOWESTVALUE, EngBags_SORTHIGHESTVALUE);
        EI_SetDefault("bar_sort_"..EngInventoryConfig["putinslot--MANAPOTION"], EngBags_SORTBYNAMEREV, 2+re, EngBags_NumericRange, EngBags_SORTLOWESTVALUE, EngBags_SORTHIGHESTVALUE);
        EI_SetDefault("bar_sort_"..EngInventoryConfig["putinslot--TRADEGOODS"], EngBags_SORTBYNAMEREV, 2+re, EngBags_NumericRange, EngBags_SORTLOWESTVALUE, EngBags_SORTHIGHESTVALUE);

	for i = 1, EngBags_MAX_BARS do
                EI_SetDefault("bar_sort_"..i, EngBags_SORTBYNAME, 2+re, EngBags_NumericRange, EngBags_SORTLOWESTVALUE, EngBags_SORTHIGHESTVALUE);
		EI_SetDefault("allow_new_in_bar_"..i, 1, 1+re, EngBags_NumericRange, 0, 1);
		EI_SetDefault("hide_items_in_bar_"..i, 0, 1+re, EngBags_NumericRange, 0, 1);
	end

	-- find matching catagories that are not assigned
	for key,value in EngInventoryConfig["item_search_list"] do
		if (EngInventoryConfig["putinslot--"..value[1]] == nil) then
			message("EngBags: Unassigned catagory: "..value[1].." -- It has been assigned to slot 1");
			EngInventoryConfig["putinslot--"..value[1]] = 1;
		end
	end

        if (re>0) then
                EngInventory_SetDefaultValues(0);
        end
end

function EngInventory_SetTradeSkills()
	local k,v;

	ENGINVENTORY_TRADE1 = "";
	ENGINVENTORY_TRADE2 = "";

	for k,v in EngBagsConfig[EngBags_PLAYERID]["tradeskills"] do
		if ((k ~= EILocal["Cooking"]) and (k ~= EILocal["First Aid"])) then
			ENGINVENTORY_TRADE1 = ENGINVENTORY_TRADE2;
			ENGINVENTORY_TRADE2 = k;
		end
	end
end

function EngInventory_init()

	if ( EngBagsItems[EngBags_PLAYERID] == nil) then
		EngBagsItems[EngBags_PLAYERID] = {};
	end

	-- Trying to clean the inventory cache on load to see if it fix some things ...
	-- Tested and works, the time to repopulate the inventory on load isnt a critical thing...
	-- FIX: Only reset bags 0 to 4 to prevent cleaning the bank cache.
	-- NOTE: Added keyring support.
	EngBagsItems[EngBags_PLAYERID][KEYRING_CONTAINER] = {};
	EngBagsItems[EngBags_PLAYERID][0] = {};
	EngBagsItems[EngBags_PLAYERID][1] = {};
	EngBagsItems[EngBags_PLAYERID][2] = {};
	EngBagsItems[EngBags_PLAYERID][3] = {};
	EngBagsItems[EngBags_PLAYERID][4] = {};

	-- change imported from auctioneer team..  what does it do?
	UIPanelWindows["EngInventory_frame"] = { area = "left", pushable = 6 };	
	if ( ENGINVENTORY_WIPECONFIGONLOAD == 1 ) then
		EngInventoryConfig = {};
	end

        -- Load localization -- ERR_BADATTACKPOS is a blizzard defined constant for displaying an error message.
        --                      it should be good enough to determine what language the game is running in.
        if ( GetLocale() == "enGB" or GetLocale() == "enUS" ) then
                -- US/English
                EngInventory_load_Localization("EN");
        elseif ( GetLocale() == "frFR" ) then
                -- French
                EngInventory_load_Localization("FR");
         elseif ( GetLocale() == "deDE" ) then
                -- German
                EngInventory_load_Localization("DE");
		elseif ( GetLocale() == "ruRU" ) then
                -- Russian
                EngInventory_load_Localization("RU");
        else
                -- have to load something...  :(
            EngBags_Print("*** No localization found, stuff won't work properly ***", 1,0.25,0.25 );
			message("EngBags: No localization found, stuff won't work properly");
            EngInventory_load_Localization("EN");
        end

        -- register slash command
        SlashCmdList["ENGINVENTORY"] = EngInventory_cmd;
        SLASH_ENGINVENTORY1 = "/einv";
        SLASH_ENGINVENTORY2 = "/ei";

	if ( EngBagsConfig["Inventory"][EngBags_PLAYERID] == nil ) then
		EngBagsConfig["Inventory"][EngBags_PLAYERID] = {};
	end

        -- load default values
        EngInventory_SetDefaultValues(0);
        
	-- go through the tradeskill list, and remove what shouldn't be there
	-- bah, do it in a lazy way, just wipe it
	if (EngBagsConfig[EngBags_PLAYERID] == nil) then
		EngBagsConfig[EngBags_PLAYERID] = {};
	end
	if (EngBagsConfig[EngBags_PLAYERID]["tradeskills"] == nil) then
		EngBagsConfig[EngBags_PLAYERID]["tradeskills"] = {};
	end
	local max_skills = 2;
	if (EngBagsConfig[EngBags_PLAYERID]["tradeskills"][EILocal["Cooking"]] ~= nil) then
		max_skills = max_skills + 1;
	end
	if (EngBagsConfig[EngBags_PLAYERID]["tradeskills"][EILocal["First Aid"]] ~= nil) then
		max_skills = max_skills + 1;
	end
	if (table.getn(EngBagsConfig[EngBags_PLAYERID]["tradeskills"]) > max_skills) then
		EngBagsConfig[EngBags_PLAYERID]["tradeskills"] = {};	-- wipe it out
		EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"] = {};
	end

	-- detailed info about tradeskills
	if (EngBagsConfig[EngBags_PLAYERID]["trades"] == nil) then
		EngBagsConfig[EngBags_PLAYERID]["trades"] = {};
	end

	EngInventory_SetTradeSkills();

        -- setup hooks
        EngInventory_RegisterHooks(ENGINVENTORY_HOOKS_REGISTER);

        EngInventory_Button_HighlightToggle:SetText(EILocal["EngInventory_Button_HighlightToggle_off"]);
        EngInventory_Button_ChangeEditMode:SetText(EILocal["EngInventory_Button_ChangeEditMode_off"]);

        if (EngInventoryConfig["moveLock"] == 0) then
                EngInventory_Button_MoveLockToggle:SetText(EILocal["EngInventory_Button_MoveLock_locked"]);
        else
                EngInventory_Button_MoveLockToggle:SetText(EILocal["EngInventory_Button_MoveLock_unlocked"]);
        end

	EngInventory_OnEvent("UPDATE_INVENTORY_ALERTS");	-- reload the items currently equipped
	-- init bagsbar
	EI_CreateBagsBar();
	-- Force update item cache.
	EngInventory_Update_item_cache();
	if ( CT_Mail_newTradeFrameShow == nil ) then
		EngInventory_oldTradeFrameShow = TradeFrame:GetScript("OnShow");
		TradeFrame:SetScript("OnShow", EngInventory_newTradeFrameShow);
	end
end

function EngInventory_newTradeFrameShow()
	EngInventory_oldTradeFrameShow();
	if ( EngInventory_addItem and not CursorHasItem() ) then
		PickupContainerItem(EngInventory_addItem[1], EngInventory_addItem[2]);
		ClickTradeButton(1);
	end
	EngInventory_addItem = nil;
end

function EngInventory_OnEvent(event)

	if ( EngInventory_frame:IsVisible() ) then
        EngBags_PrintDEBUG("bags_event: '"..event.."'");

        if ( event == "BAG_UPDATE" ) then
                EngInventory_UpdateWindow();
        elseif ( event == "BAG_UPDATE_COOLDOWN" ) then
                EngInventory_UpdateWindow();
		else
			EngBags_PrintDEBUG("OnEvent: No event handler found.");
        end

		EngBags_PrintDEBUG("bags_OnEvent: Finished "..event);

	end

end

function EngInventory_StartMoving(frame)
        if ( not frame.isMoving ) and ( EngInventoryConfig["moveLock"] == 1 ) then
                frame:StartMoving();
                frame.isMoving = true;
        end
end

function EngInventory_StopMoving(frame)
        if ( frame.isMoving ) then
                frame:StopMovingOrSizing();
                frame.isMoving = false;

                -- save the position
                EngInventoryConfig["frameLEFT"] = frame:GetLeft() * frame:GetScale();
                EngInventoryConfig["frameRIGHT"] = frame:GetRight() * frame:GetScale();
                EngInventoryConfig["frameTOP"] = frame:GetTop() * frame:GetScale();
                EngInventoryConfig["frameBOTTOM"] = frame:GetBottom() * frame:GetScale();

                EngBags_PrintDEBUG("new position:  top="..EngInventoryConfig["frameTOP"]..", bottom="..EngInventoryConfig["frameBOTTOM"]..", left="..EngInventoryConfig["frameLEFT"]..", right="..EngInventoryConfig["frameRIGHT"] );
        end
end

function EngInventory_OnMouseDown(button, frame)

	if ( button == "LeftButton" ) then
		EngInventory_StartMoving(frame);
	elseif ( button == "RightButton" ) then
		HideDropDownMenu(1);
		EngInventory_RightClickMenu_mode = "mainwindow";
		EngInventory_RightClickMenu_opts = {};
		ToggleDropDownMenu(1, nil, EngInventory_frame_RightClickMenu, "cursor", 0, 0);
	end

end


--	EngInventory_resort_required: ENGINVENTORY_NOTNEEDED, ENGINVENTORY_REQUIRED, ENGINVENTORY_MANDATORY
--	EngInventory_window_update_required: ENGINVENTORY_NOTNEEDED, ENGINVENTORY_REQUIRED, ENGINVENTORY_MANDATORY
--	EngInventory_item_cache[ bag ][ slot ]
function EngInventory_Update_item_cache()
	local bag, slot;	-- used as "for loop" counters
	local itm;		-- entry that will be written to the cache
	local update_suggested = 0;
	local resort_suggested = 0;
	local resort_mandatory = 0;
	local pre_locked, now_locked, pre_link, pre_count, now_count;
	-- variables used in outer loop, bag:
	local bagNumSlots;
	local is_shot_bag;
	-- variables used in inner loop, slots:
	local a,b,c,d;
	local sequencial_slot_num = 0;
	EngInventory_item_cache = EngBagsItems[EngBags_PLAYERID];
	for index, bagnum in ipairs(EngInventory_Bags) do
		if (EngInventoryConfig["show_Bag"..bagnum] == 1) then
			if (EngInventory_item_cache[bagnum] == nil) then
				EngInventory_item_cache[bagnum] = {};
			end

			if (bagnum == KEYRING_CONTAINER) then
				bagNumSlots = GetKeyRingSize(KEYRING_CONTAINER);
			else
				bagNumSlots = GetContainerNumSlots(bagnum);		
			end

			if (bagNumSlots > 0) then
				is_shot_bag = EngBags_IsShotBag(bagnum);
				for slotnum = 1, bagNumSlots do
					if (EngInventory_item_cache[bagnum][slotnum] == nil) then
						EngInventory_item_cache[bagnum][slotnum] = { ["keywords"] = {} };
					end

					sequencial_slot_num = sequencial_slot_num + 1;

					itm = EngInventory_item_cache[bagnum][slotnum];
					pre_locked = itm["locked"];
					pre_count = itm["itemcount"];
					pre_link = itm["itemlink"];
					_,now_count,now_locked,_,_ = GetContainerItemInfo(bagnum, slotnum);

					if ( itm["iteminfo"] ~= GetContainerItemLink(bagnum, slotnum) or itm["bagnum"] == nil or pre_locked ~= now_locked or now_count ~= pre_count) then 
					
					itm["itemlink"] = GetContainerItemLink(bagnum, slotnum);
					itm["bagnum"] = bagnum;
					itm["slotnum"] = slotnum;
					itm["sequencial_slot_num"] = sequencial_slot_num;
					itm["bagname"] = GetBagName(bagnum);
					itm["iteminfo"] = GetContainerItemLink(bagnum, slotnum);

					if (bagnum == KEYRING_CONTAINER) then
						itm["bagname"] = EILocal["KeyRing"];
						itm["gametooltip"] = nil;
					end
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

						itm["itemname"], itm["itemlink2"], itm["itemRarity"], itm["itemMinLevel"], itm["itemtype"], itm["itemsubtype"], itm["itemstackcount"] = GetItemInfo(itm["itemlink"]);
						itm["texture"], itm["itemcount"], itm["locked"], itm["quality"], itm["readable"] = GetContainerItemInfo(bagnum, slotnum);
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

						itm["texture"] = nil;
						itm["itemcount"] = 0;
						itm["locked"] = 0;
						itm["quality"] = 0;
						itm["readable"] = 0;

						if bagnum > 0 then
							local BankSlotLink = GetInventoryItemLink("player",(19+bagnum));
							if BankSlotLink ~= nil then
								local _, _, itemCode = strfind(BankSlotLink, "(%d+):");
								local _, _, _, _, _, itemSubtype, _, _, itemTexture = GetItemInfo(itemCode);
								if (EngInventoryConfig["hide_bag_icons"] == 0) then
									itm["texture"] = itemTexture;
								else
									-- Clean the empty bag texture if setting is on.
									itm["texture"] = nil;
								end
								itm["itemsubtype"] = itemSubtype;
								if (itemSubtype == "Soul Bag") then
									itm["keywords"]["SOUL_BAG"]=1;
								end
								if (itemSubtype == "Enchanting Bag") then
									itm["keywords"]["ENCHANT_BAG"]=1;
								end
								if (itemSubtype == "Herb Bag") then
									itm["keywords"]["HERB_BAG"]=1;
								end
								if (itemSubtype == "Quiver") then
									itm["keywords"]["ARROW_BAG"]=1;
								end
								if (itemSubtype == "Ammo Pouch") then
									itm["keywords"]["AMMO_BAG"]=1;
								end
							end
						else
								if (EngInventoryConfig["hide_bag_icons"] == 0) then
									if (bagnum == KEYRING_CONTAINER) then
										itm["texture"] = "Interface\\ContainerFrame\\KeyRing-Bag-Icon";
									else
										itm["texture"] = "Interface\\Icons\\INV_ValentinesCandySack";
									end
								else
									-- Clean the empty bag texture if setting is on.
									itm["texture"] = nil;
								end
								itm["itemsubtype"] = "Backpack Slot";
								
							
						end
					end

					-- item has changed.
					if (itm["itemlink"] ~= pre_link) then
						-- the item changed
						if (itm["indexed_on"] ~= nil) then
							resort_suggested = 1;
							itm["indexed_on"] = GetTime();
							itm["display_string"] = "newItemText";
						end
					end
					
					end

					if (itm["bar"] == nil) then
						resort_mandatory = 1;
					end

					if (itm["itemsubtype"] == nil) then itm["itemsubtype"] = ""; end
					if (itm["itemname"] == nil) then itm["itemname"] = ""; end

					if (itm["locked"] ~= pre_locked) then
						update_suggested = 1;
					end

					-- item has not changed, maybe the count did?
					if ( (itm["itemlink"] == pre_link) and (itm["itemcount"] ~= pre_count) and (pre_count ~= nil) ) then
						update_suggested = 1;
						if (itm["itemcount"] < pre_count) then
							itm["display_string"] = "newItemTextMinus";
						else
							itm["display_string"] = "newItemTextPlus";
						end
						itm["indexed_on"] = GetTime();
					end

					if (itm["indexed_on"] == nil) then
						itm["indexed_on"] = 1;
						itm["display_string"] = "NewItemText_Off";
					end
					-- EngInventory_item_cache[bagnum][slotnum] = itm;	-- save updated information
				end
			else
				-- bagNumSlots = 0, make sure you wipe the cache entry
				if (table.getn(EngInventory_item_cache[bagnum]) ~= 0) then
					resort_mandatory = 1;
				end
				EngInventory_item_cache[bagnum] = {};
			end
		end
	end

	if (resort_mandatory == 1) then
		EngInventory_resort_required = ENGINVENTORY_MANDATORY;
		EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
	elseif (resort_suggested == 1) then
		EngInventory_resort_required = math.max(EngInventory_resort_required, ENGINVENTORY_REQUIRED);
		EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
	elseif (update_suggested == 1) then
		EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
	end
end



-- Take an item and figure out what "bar" you want to place it in
--              return selected_bar, barClass;
function EngInventory_PickBar(itm)
        if (itm["itemlink"] == nil) then
                if (itm["keywords"]["HERB_BAG"]) then
			itm["bar"] = EngInventoryConfig["putinslot--HERB_EMPTY_SLOTS"];
			while (type(itm["bar"]) ~= "number") do
				itm["bar"] = EngInventoryConfig[itm["bar"]];
			end
			itm["barClass"] = "HERB_EMPTY_SLOTS";
                        return itm;
                elseif (itm["keywords"]["ARROW_BAG"]) then
			itm["bar"] = EngInventoryConfig["putinslot--ARROW_EMPTY_SLOTS"];
			while (type(itm["bar"]) ~= "number") do
				itm["bar"] = EngInventoryConfig[itm["bar"]];
			end
			itm["barClass"] = "ARROW_EMPTY_SLOTS";
                        return itm;
                elseif (itm["keywords"]["AMMO_BAG"]) then
			itm["bar"] = EngInventoryConfig["putinslot--AMMO_EMPTY_SLOTS"];
			while (type(itm["bar"]) ~= "number") do
				itm["bar"] = EngInventoryConfig[itm["bar"]];
			end
			itm["barClass"] = "AMMO_EMPTY_SLOTS";
                        return itm;
                elseif (itm["keywords"]["SOUL_BAG"]) then
			itm["bar"] = EngInventoryConfig["putinslot--SHARD_EMPTY_SLOTS"];
			while (type(itm["bar"]) ~= "number") do
				itm["bar"] = EngInventoryConfig[itm["bar"]];
			end
			itm["barClass"] = "SHARD_EMPTY_SLOTS";
                        return itm;
                elseif (itm["keywords"]["ENCHANT_BAG"]) then
			itm["bar"] = EngInventoryConfig["putinslot--ENCHANT_EMPTY_SLOTS"];
			while (type(itm["bar"]) ~= "number") do
				itm["bar"] = EngInventoryConfig[itm["bar"]];
			end
			itm["barClass"] = "ENCHANT_EMPTY_SLOTS";
                        return itm;
		else
			itm["bar"] = EngInventoryConfig["putinslot--EMPTY_SLOTS"];
			while (type(itm["bar"]) ~= "number") do
				itm["bar"] = EngInventoryConfig[itm["bar"]];
			end
			itm["barClass"] = "EMPTY_SLOTS";
                        return itm;
                end
        else
                if (itm["keywords"]["SHOT_BAG"]) then
			itm["bar"] = EngInventoryConfig["putinslot--USED_PROJECTILE_SLOTS"];
			while (type(itm["bar"]) ~= "number") do
				itm["bar"] = EngInventoryConfig[itm["bar"]];
			end
			itm["barClass"] = "USED_PROJECTILE_SLOTS";
        	        return itm;
		end
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
		if ( (EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"] ~= nil) and (EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"][ itm["itemlink_noninstance"] ] ~= nil) ) then
			-- the item exists in our cache
			if (EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"][ itm["itemlink_noninstance"] ][ENGINVENTORY_TRADE1] ~= nil) then
				itm["keywords"]["TRADESKILL_1"] = 1;
			elseif (EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"][ itm["itemlink_noninstance"] ][ENGINVENTORY_TRADE2] ~= nil) then
				itm["keywords"]["TRADESKILL_2"] = 1;
			elseif (EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"][ itm["itemlink_noninstance"] ][EILocal["Cooking"]] ~= nil) then
				itm["keywords"]["TRADESKILL_COOKING"] = 1;
			elseif (EngBagsConfig[EngBags_PLAYERID]["tradeskill_items"][ itm["itemlink_noninstance"] ][EILocal["First Aid"]] ~= nil) then
				itm["keywords"]["TRADESKILL_FIRSTAID"] = 1;
			end
		end

		-- setup tradeskill produced items keywords
		if ( (EngBagsConfig[EngBags_PLAYERID]["tradeskill_production"] ~= nil) and (EngBagsConfig[EngBags_PLAYERID]["tradeskill_production"][ itm["itemlink_noninstance"] ] ~= nil) ) then
			if (EngBagsConfig[EngBags_PLAYERID]["tradeskill_production"][ itm["itemlink_noninstance"] ][ENGINVENTORY_TRADE1] ~= nil) then
				itm["keywords"]["TRADESKILL_1_CREATED"] = 1;
			elseif (EngBagsConfig[EngBags_PLAYERID]["tradeskill_production"][ itm["itemlink_noninstance"] ][ENGINVENTORY_TRADE2] ~= nil) then
				itm["keywords"]["TRADESKILL_2_CREATED"] = 1;
			end
			-- not doing cooking or first aid.
		end

		-- setup equipped items keywords
		if ( EngBagsConfig[EngBags_PLAYERID]["equipped_items"] ~= nil ) then
			if (EngBagsConfig[EngBags_PLAYERID]["equipped_items"][ itm["itemlink_noninstance"] ] ~= nil) then
				itm["keywords"]["EQUIPPED"] = 1;
			end
		end

		-- Load tooltip
		EngInventory_tt:SetOwner(UIParent, "ANCHOR_NONE");	-- this makes sure that tooltip.valid = true

		if itm["bagnum"] < 0 then
				EngInventory_tt:SetInventoryItem("player", KeyRingButtonIDToInvSlotID(itm["slotnum"]));
			else
				EngInventory_tt:SetBagItem(itm["bagnum"],itm["slotnum"]);
		end

		idx = 1;
		tmptooltip = getglobal("EngInventory_ttTextLeft"..idx);
		tooltip_info_concat = "";
		itm["gametooltip"] = {};
		repeat
			tmpval = tmptooltip:GetText();

			if (tmpval ~= nil) then
				tooltip_info_concat = tooltip_info_concat.." "..tmpval;
				itm["gametooltip"][idx] = tmpval;
			end

			idx=idx+1;
			tmptooltip = getglobal("EngInventory_ttTextLeft"..idx);
		until (tmpval==nil) or (tmptooltip==nil);

		if (string.find(tooltip_info_concat, EILocal["soulbound_search"] )) then
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
		itm["barClass"] = EngInventoryConfig["item_overrides"][itm["itemlink_override_key"]];
		if (itm["barClass"] ~= nil) then
			itm["search_match"] = "item_override found";

			itm["bar"] = EngInventoryConfig["putinslot--"..itm["barClass"]];
			while ( (itm["bar"] ~= nil) and (type(itm["bar"]) ~= "number") ) do
				itm["bar"] = EngInventoryConfig[itm["bar"]];
			end
			if (type(itm["bar"]) ~= "number") then
				itm["barClass"] = nil;
			end
		end

		if (itm["barClass"] == nil) then
			for key,value in EngInventoryConfig["item_search_list"] do
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
						itm["bar"] = EngInventoryConfig["putinslot--"..itm["barClass"]];
						while ( (itm["bar"] ~= nil) and (type(itm["bar"]) ~= "number") ) do
							itm["bar"] = EngInventoryConfig[itm["bar"]];
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

			itm["bar"] = EngInventoryConfig["putinslot--"..itm["barClass"]];
			while ( (itm["bar"] ~= nil) and (type(itm["bar"]) ~= "number") ) do
				itm["bar"] = EngInventoryConfig[itm["bar"]];
			end
			if (type(itm["bar"]) ~= "number") then
				itm["barClass"] = "UNKNOWN";
				itm["bar"] = 1;
			end
		end

                return itm;
        end
end

--[[
	Call EngInventory_Update_item_cache() before calling this

	EngInventory_item_cache[ bagnum ][ slotnum ]
	EngInventory_bar_positions[ bar_number ][ position ] = { ["bagnum"]=bagnum, ["slotnum"]=slotnum }
--]]
function EngInventory_Sort_item_cache()
	local i;
	local bagnum, slotnum;
	-- variables used in outer loop
	local bagNumSlots;
	-- variables used in inner loop
	----- 2nd loop
	local barnum;

	--Print("Resorting Items");
	EngInventory_item_cache = EngBagsItems[EngBags_PLAYERID];
	-- wipe the current bar positions table
	EngInventory_bar_positions = {};
	for i = 1, EngBags_MAX_BARS do
		EngInventory_bar_positions[i] = {};
	end

	for index, bagnum in ipairs(EngInventory_Bags) do
		if (EngInventoryConfig["show_Bag"..bagnum] == 1) then
			bagNumSlots = table.getn( EngInventory_item_cache[bagnum] );
			if (bagNumSlots > 0) then
				for slotnum = 1, bagNumSlots do
					-- Insert only not null slots, this is for Hide Empty KeyRing Slots.
					if ( (EngInventory_item_cache[bagnum][slotnum]["itemlink"] == nil) and (EngInventoryConfig["hide_keyring_empty_slots"] == 1) and (bagnum == KEYRING_CONTAINER) ) then
						EngInventory_item_cache[bagnum][slotnum] = EngInventory_PickBar( EngInventory_item_cache[bagnum][slotnum] );
					else
						EngInventory_item_cache[bagnum][slotnum] = EngInventory_PickBar( EngInventory_item_cache[bagnum][slotnum] );
						table.insert( EngInventory_bar_positions[ EngInventory_item_cache[bagnum][slotnum]["bar"] ], { ["bagnum"]=bagnum, ["slotnum"]=slotnum } );
					end
				end
			end
		end
	end

        -- sort the cache now
        for barnum = 1, EngBags_MAX_BARS do
                if (EngInventoryConfig["bar_sort_"..barnum] == EngBags_SORTBYNAME) then
                        table.sort(EngInventory_bar_positions[barnum],
                                function(a,b)
                                        return  EngInventory_item_cache[a["bagnum"]][a["slotnum"]]["barClass"]..
						EngInventory_item_cache[a["bagnum"]][a["slotnum"]]["itemsubtype"]..
						EngInventory_item_cache[a["bagnum"]][a["slotnum"]]["itemname"]..
						string.format("%04s", EngInventory_item_cache[a["bagnum"]][a["slotnum"]]["itemcount"])
							>
                                                EngInventory_item_cache[b["bagnum"]][b["slotnum"]]["barClass"]..
						EngInventory_item_cache[b["bagnum"]][b["slotnum"]]["itemsubtype"]..
						EngInventory_item_cache[b["bagnum"]][b["slotnum"]]["itemname"]..
						string.format("%04s", EngInventory_item_cache[b["bagnum"]][b["slotnum"]]["itemcount"])
                                end);
                elseif (EngInventoryConfig["bar_sort_"..barnum] == EngBags_SORTBYNAMEREV) then
                        table.sort(EngInventory_bar_positions[barnum],
                                function(a,b)
                                        return  EngInventory_item_cache[a["bagnum"]][a["slotnum"]]["barClass"]..
						EngInventory_item_cache[a["bagnum"]][a["slotnum"]]["itemsubtype"]..
						EngBags_ReverseString(
							EngInventory_item_cache[a["bagnum"]][a["slotnum"]]["itemname"])..
							string.format("%04s",EngInventory_item_cache[a["bagnum"]][a["slotnum"]]["itemcount"]
							)
								>
                                                EngInventory_item_cache[b["bagnum"]][b["slotnum"]]["barClass"]..
						EngInventory_item_cache[b["bagnum"]][b["slotnum"]]["itemsubtype"]..
						EngBags_ReverseString(
							EngInventory_item_cache[b["bagnum"]][b["slotnum"]]["itemname"])..
							string.format("%04s",EngInventory_item_cache[b["bagnum"]][b["slotnum"]]["itemcount"]
							)
                                end);
                end
        end

	EngInventory_resort_required = ENGINVENTORY_NOTNEEDED;
	EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
end


-- Make an inventory slot usable with the item specified in itm
-- cache entry is the array that comes directly from the cache
function EngInventory_UpdateButton(itemframe, itm)
	if ( itemframe == nil or itm == nil ) then
		return;
	end
        local ic_start, ic_duration, ic_enable;
        local showSell = nil;
        local itemframe_texture = getglobal(itemframe:GetName().."IconTexture");
		local itemframe_normaltexture = getglobal(itemframe:GetName().."NormalTexture");
        local itemframe_font = getglobal(itemframe:GetName().."Count");
        local itemframe_bkgr = getglobal(itemframe:GetName().."_bkgr");
        local itemframe_stock = getglobal(itemframe:GetName().."Stock");
        local cooldownFrame = getglobal(itemframe:GetName().."_Cooldown");

        if ( EILocal["_loaded"]==0 ) then
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

        if ( EngInventory_edit_mode == 1 ) then
                -- we should be hilighting an entire class of item
                if ( itm["barClass"] ~= EngInventory_edit_hilight ) then
                        -- dim this item
                        itemframe_texture:SetVertexColor(1,1,1,0.15);
                        itemframe_font:SetVertexColor(1,1,1,0.5);
                        itemframe_bkgr:SetVertexColor(0.4,0.4,0.4,1);
                else
                        -- hilight this item
                        itemframe_texture:SetVertexColor(1,1,0,1);
                        itemframe_font:SetVertexColor(1,1,0,1);
                        itemframe_bkgr:SetVertexColor(1,1,1,1);
                end
        else
                -- no hilights, just do your normal work

                if ( (EngInventoryConfig["allow_new_in_bar_"..itm["bar"]] == 1) and (itm["itemlink"] ~= nil) and (itm["indexed_on"]>1) and ((GetTime()-itm["indexed_on"]) < EngInventoryConfig["newItemTimeout"]) ) then
                        -- item is still new, display the "new" text.
                        itemframe_stock:SetText( EngInventoryConfig[itm["display_string"]] );
                        if ( (GetTime()-itm["indexed_on"]) < EngInventoryConfig["newItemTimeout2"]) then
                                -- use color #2
                                itemframe_stock:SetTextColor(
                                        EngInventoryConfig["newItemColor2_R"],
                                        EngInventoryConfig["newItemColor2_G"],
                                        EngInventoryConfig["newItemColor2_B"] );
                                itemframe_font:SetVertexColor(
                                        EngInventoryConfig["newItemColor2_R"],
                                        EngInventoryConfig["newItemColor2_G"],
                                        EngInventoryConfig["newItemColor2_B"], 1 );
                        else
                                -- use color #1
                                itemframe_stock:SetTextColor(
                                        EngInventoryConfig["newItemColor1_R"],
                                        EngInventoryConfig["newItemColor1_G"],
                                        EngInventoryConfig["newItemColor1_B"] );
                                itemframe_font:SetVertexColor(
                                        EngInventoryConfig["newItemColor1_R"],
                                        EngInventoryConfig["newItemColor1_G"],
                                        EngInventoryConfig["newItemColor1_B"], 1 );
                        end
                        itemframe_stock:Show();
                        itemframe_texture:SetVertexColor(1,1,1,1);
                else
                        itemframe_stock:Hide();
                        if (EngInventory_hilight_new == 1) then
                                itemframe_texture:SetVertexColor(1,1,1,0.15);
                                itemframe_font:SetVertexColor(1,1,1,0.5);
                        else
                                itemframe_texture:SetVertexColor(1,1,1,1);
                                itemframe_font:SetVertexColor(1,1,1,1);
                        end
                end

                if (itm["itemRarity"] == nil) then
                        itemframe_bkgr:SetVertexColor(0.4,0.4,0.4,1);
			itemframe_normaltexture:SetVertexColor(0.4,0.4,0.4, 0.5);
                elseif (itm["itemRarity"] == 0) then     -- gray item
                        itemframe_bkgr:SetVertexColor(1,1,1,1);
			itemframe_normaltexture:SetVertexColor(1,1,1,1);
                elseif (itm["itemRarity"] == 1) then     -- white item
                        itemframe_bkgr:SetVertexColor(0.4,0.4,0.4,1);
			itemframe_normaltexture:SetVertexColor(0.4,0.4,0.4, 0.5);
                elseif (itm["itemRarity"] == 2) then     -- green item
                        itemframe_bkgr:SetVertexColor(0,1,0.25,1);
			itemframe_normaltexture:SetVertexColor(0,1,0.25, 0.5);
                elseif (itm["itemRarity"] == 3) then     -- blue item
                        itemframe_bkgr:SetVertexColor(0.5,0.5,1,1);
			itemframe_normaltexture:SetVertexColor(0.5,0.5,1, 0.5);
                elseif (itm["itemRarity"] == 4) then     -- purple item
                        itemframe_bkgr:SetVertexColor(1,0,1,1);
			itemframe_normaltexture:SetVertexColor(1,0,1, 0.5);
                else    -- ?!
                        itemframe_bkgr:SetVertexColor(1,0,0,1);
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
	itemframe_font:SetPoint("BOTTOMRIGHT", itemframe:GetName(), "BOTTOMRIGHT", 0-ENGINVENTORY_BUTTONFONTDISTANCE_X, ENGINVENTORY_BUTTONFONTDISTANCE_Y );
	
	--itemframe_stock.font = "Interface\Addons\EngBags\DAB_CooldownFont.ttf";
	itemframe_stock:SetTextHeight( EngBags_BUTTONFONTHEIGHT2 );	-- stock, topleft
	itemframe_stock:ClearAllPoints();
	itemframe_stock:SetPoint("TOPLEFT", itemframe:GetName(), "TOPLEFT", (ENGINVENTORY_BUTTONFONTDISTANCE_X / 2), 0-ENGINVENTORY_BUTTONFONTDISTANCE_Y );
	
        -- Set cooldown
        CooldownFrame_SetTimer(cooldownFrame, ic_start, ic_duration, ic_enable);
        if ( ( ic_duration > 0 ) and ( ic_enable == 0 ) ) then
                SetItemButtonTextureVertexColor(itemframe, 0.4, 0.4, 0.4);
        end

	cooldownFrame:SetScale(EngBags_COOLDOWN_SCALE);

end


function EngInventory_GetBarPositionAndCache()
        local bar, position, itm;
		local bagnum, slotnum;

        if (EngInventory_buttons[this:GetName()] ~= nil) then
                bar = EngInventory_buttons[this:GetName()]["bar"];
                position = EngInventory_buttons[this:GetName()]["position"];

		bagnum = EngInventory_bar_positions[bar][position]["bagnum"];
		slotnum = EngInventory_bar_positions[bar][position]["slotnum"];

                itm = EngInventory_item_cache[bagnum][slotnum];

                return bar,position,itm;
        else
                return nil,nil,nil;
        end

end

function EngInventory_ItemButton_OnEnter()
        local bar,position,itm = EngInventory_GetBarPositionAndCache();

        if (EngInventory_edit_selected == "") then
                EngInventory_edit_hilight = itm["barClass"];
        end

        if ( not itm["itemlink"]) then
                if ( EngInventory_edit_mode == 1 ) then
                        GameTooltip:SetOwner(this, "ANCHOR_LEFT");
                        GameTooltip:ClearLines();
                        GameTooltip:AddLine("Empty Slot", 1,1,1 );

                        -- move by class
                        if (itm["barClass"] ~= nil) then
				if (EngInventory_edit_selected ~= "") then
		                        GameTooltip:AddLine("|cFF00FF7FLeft click to move catagory |r"..EngInventory_edit_selected.."|cFF00FF7F to bar |r"..bar, 1,0.25,0.5 );
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
                if ( EngInventory_edit_mode == 1 ) then
			-- redraw the window to show the hilighting of entire class items
			EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
                        EngInventory_UpdateWindow();
                end
                return;
        end


	if (EngInventoryConfig["frameLEFT"] < GetScreenWidth()/2) then
	        GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
	else
		GameTooltip:SetOwner(this, "ANCHOR_LEFT");
	end

	if (itm["bagnum"] ~= KEYRING_CONTAINER) then
	        local hasCooldown, repairCost = GameTooltip:SetBagItem(itm["bagnum"], itm["slotnum"]);
	else
		local hasCooldown, repairCost = GameTooltip:SetInventoryItem("player", KeyRingButtonIDToInvSlotID(itm["slotnum"]));
	end
        if ( hasCooldown ) then
                this.updateTooltip = 1;
        else
                this.updateTooltip = nil;
        end

	EngBags_PrintDEBUG("Rollover Info | Bagnum::"..itm["bagnum"].." - Slotnum::"..itm["slotnum"]);

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

        if ( EngInventory_edit_mode == 1 ) then
                -- move by class
                if (itm["barClass"] ~= nil) then
			if (EngInventory_edit_selected ~= "") then
				GameTooltip:AddLine("|cFF00FF7FLeft click to move catagory |r"..EngInventory_edit_selected.."|cFF00FF7F to bar |r"..bar, 1,0.25,0.5 );
			else
				GameTooltip:AddLine(" ", 0,0,0);
				GameTooltip:AddLine("|cFF00FF7FLeft click to select catagory to move:|r "..itm["barClass"], 1,0.25,0.5 );
				GameTooltip:AddLine("Right click to assign this item to a different catagory", 1,0,0 );
				GameTooltip:AddLine(" ", 0,0,0);
			end
                else
                        GameTooltip:AddLine("Item has no category", 1,0,0 );
                end
        end

	if itm["bagname"] == nil then
		itm["bagname"] = "Backpack";
	end

	GameTooltip:AddLine(EILocal["Container"]..":"..itm["bagname"], 1,0,0 );

	if ( EngInventoryConfig["tooltip_mode"] == 1 ) then
		EngBags_ModifyItemTooltip(itm["bagnum"], itm["slotnum"], "GameTooltip", itm);
	end

        if ( EngInventory_edit_mode == 1 ) then
		-- redraw the window to show the hllighting of entire class items
		EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
                EngInventory_UpdateWindow();
        end
end

function EngInventory_OnUpdate(elapsed)
        if ( not this.updateTooltip ) then
                return;
        end

        this.updateTooltip = this.updateTooltip - elapsed;
        if ( this.updateTooltip > 0 ) then
                return;
        end

        if ( GameTooltip:IsOwned(this) ) then
                EngInventory_ItemButton_OnEnter();
        else
                this.updateTooltip = nil;
        end
end

function EngInventory_ItemButton_OnLeave()
        EngBags_PrintDEBUG("ei_button: OnLeave()  this="..this:GetName() );

        if (EngInventory_edit_selected == "") then
                EngInventory_edit_hilight = "";
        end
        this.updateTooltip = nil;
        if ( GameTooltip:IsOwned(this) ) then
                GameTooltip:Hide();
                ResetCursor();
        end

        if ( EngInventory_edit_mode == 1 ) then
		-- redraw the window to remove the hilighting of entire class items
		EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
                EngInventory_UpdateWindow();
        end
end

function EngInventory_ItemButton_OnClick(button, ignoreShift)
        local bar, position, itm, bagnum, slotnum, link, name;

        if (EngInventory_buttons[this:GetName()] ~= nil) then
                bar = EngInventory_buttons[this:GetName()]["bar"];
                position = EngInventory_buttons[this:GetName()]["position"];

				bagnum = EngInventory_bar_positions[bar][position]["bagnum"];
				slotnum = EngInventory_bar_positions[bar][position]["slotnum"];

                itm = EngInventory_item_cache[bagnum][slotnum];

	    end

        if (EngInventory_edit_mode == 1) then
                -- don't do normal actions to this button, we're in edit mode
                if ( button == "LeftButton" ) then
                        if (EngInventory_edit_selected == "") then
                                -- you clicked, we selected
                                EngInventory_edit_selected = itm["barClass"];
                                EngInventory_edit_hilight = itm["barClass"];
                        else
                                -- we got a click, and we already had one selected.  let's move the items
                                EngInventoryConfig["putinslot--"..EngInventory_edit_selected] = bar;
								EngInventory_resort_required = ENGINVENTORY_MANDATORY;

                                EngInventory_edit_selected = "";
                                EngInventory_edit_hilight = itm["barClass"];

				-- resort will force a window update
                                EngInventory_UpdateWindow();
                        end
		elseif ( button == "RightButton" ) then
			HideDropDownMenu(1);
			EngInventory_RightClickMenu_mode = "item";
			EngInventory_RightClickMenu_opts = {
				["bar"] = bar,
				["position"] = position,
				["bagnum"] = bagnum,
				["slotnum"] = slotnum
				};
			ToggleDropDownMenu(1, nil, EngInventory_frame_RightClickMenu, this:GetName(), -50, 0);
                end
        else
                -- process normal clicks
		if (getglobal("AxuItemMenus_FillUtilityVariables") ~= nil) then
			if ( ENGINVENTORY_DONT_CALL_AXUITEM == nil ) then
				if (AxuItemMenus_EvocationTest(button)) then
					AxuItemMenus_FillUtilityVariables(itm["bagnum"], itm["slotnum"]);
					AxuItemMenus_OpenMenu();
					return;
				end
			else
				if (getglobal("AxuItemMenus_EngInventoryHook") ~= nil) then
					if (AxuItemMenus_EngInventoryHook(itm["bagnum"], itm["slotnum"]) == 1) then
						return;
					end
				end
			end
		--else
		--	EngBags_PrintDEBUG("AxuItemMenus not detected");
		end

		-- process normal clicks
                if (itm) then
                        if ( button == "LeftButton" ) then
				if ( IsControlKeyDown() ) then
					DressUpItemLink(itm["itemlink"]);
				elseif ( IsShiftKeyDown() and not ignoreShift ) then
					if ( ChatFrameEditBox:IsVisible() ) then
						ChatFrameEditBox:Insert(GetContainerItemLink(itm["bagnum"], itm["slotnum"]));
					else
						--local texture, itemCount, locked, quality, readable = GetContainerItemInfo(itm["bag"], itm["slot"]);

						if ( not itm["locked"] ) then
							this.SplitStack = function(button, split)
								SplitContainerItem(itm["bagnum"], itm["slotnum"], split);
							end
							OpenStackSplitFrame(this.count, this, "BOTTOMRIGHT", "TOPRIGHT");
						end
					end
				elseif ( IsAltKeyDown() ) then		-- Manage Alt+Click Auto Trade/Auction
					-- CT_MAILMOD change that function, here we get the original one
					if ( CT_oldPickupContainerItem ~= nil ) then
						-- This process mass mail support before we change the funcion
						if ( CT_MailFrame:IsVisible() and not CursorHasItem() ) then
							PickupContainerItem(itm["bagnum"], itm["slotnum"]);
							EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
							EngInventory_UpdateWindow();
							return;
						end
						PickupContainerItem = CT_oldPickupContainerItem;
					end
					if ( TradeFrame:IsVisible() and not CursorHasItem() and EngInventoryConfig["EngBags_AltClick_Trade"] == 1) then
						local tradeslot = TradeFrame_GetAvailableSlot();
						if (tradeslot) then
							PickupContainerItem(itm["bagnum"], itm["slotnum"]);
							ClickTradeButton(tradeslot);
							if (CursorHasItem()) then
								PickupContainerItem(itm["bagnum"], itm["slotnum"]);
							end
						end
					elseif (not CursorHasItem() and ( not TradeFrame or not TradeFrame:IsVisible() ) and ( not AuctionFrame or not AuctionFrame:IsVisible() ) and UnitExists("target") and CheckInteractDistance("target", 2) and UnitIsFriend("player", "target") and UnitIsPlayer("target") and EngBags_AltClick_Trade == 1 ) then
						InitiateTrade("target");
						if (CT_Mail_newTradeFrameShow ~= nil ) then
							CT_Mail_addItem = { itm["bagnum"], itm["slotnum"], UnitName("target"), 2 };
						else
							EngInventory_addItem = { itm["bagnum"], itm["slotnum"] };
						end
					elseif ( AuctionFrame ~= nil and AuctionFrame:IsVisible() and not CursorHasItem() and EngInventoryConfig["EngBags_AltClick_Auction"] == 1) then
							PickupContainerItem(itm["bagnum"], itm["slotnum"]);
							ClickAuctionSellItemButton();
							if (CursorHasItem()) then
								PickupContainerItem(itm["bagnum"], itm["slotnum"]);
							end
					elseif ( SendMailFrame:IsVisible() and not CursorHasItem() and EngInventoryConfig["EngBags_AltClick_Mail"] == 1) then
						PickupContainerItem(itm["bagnum"], itm["slotnum"]);
						ClickSendMailItemButton();
						if (CursorHasItem()) then
							PickupContainerItem(itm["bagnum"], itm["slotnum"]);
						end
					else
						PickupContainerItem(itm["bagnum"], itm["slotnum"]);
					end
					-- CT_MAILMOD restore new function
					if ( CT_oldPickupContainerItem ~= nil ) then
						PickupContainerItem = CT_newPickupContainerItem;
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

                                                        if (EngInventory_buttons[this:GetName()] ~= nil) then
								bar = EngInventory_buttons[this:GetName()]["bar"];
								position = EngInventory_buttons[this:GetName()]["position"];

								bagnum = EngInventory_bar_positions[bar][position]["bagnum"];
								slotnum = EngInventory_bar_positions[bar][position]["slotnum"];

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
		EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
		EngInventory_UpdateWindow();
        end
end

function EngInventory_RightClick_PickupItem()
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

function EngInventory_Button_HighlightToggle_OnClick()
	PlaySound("igMainMenuOptionCheckBoxOn");
	if (EngInventory_hilight_new == 0) then
		EngInventory_hilight_new = 1;
		EngInventory_Button_HighlightToggle:SetText(EILocal["EngInventory_Button_HighlightToggle_on"]);
	else
		EngInventory_hilight_new = 0;
		EngInventory_Button_HighlightToggle:SetText(EILocal["EngInventory_Button_HighlightToggle_off"]);
	end
	EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
	EngInventory_UpdateWindow();
end

function EngInventory_Button_ChangeEditMode_OnClick()
	PlaySound("igMainMenuOptionCheckBoxOn");
	if (EngInventory_edit_mode == 0) then
		EngInventory_edit_mode = 1;
		EngInventory_Button_ChangeEditMode:SetText(EILocal["EngInventory_Button_ChangeEditMode_MoveClass"]);
	--elseif (EngInventory_edit_mode == 1) then
	--	EngInventory_edit_mode = 2;
	--	this:SetText(EILocal["EngInventory_Button_ChangeEditMode_MoveItem"]);
	else
		EngInventory_edit_mode = 0;
		EngInventory_Button_ChangeEditMode:SetText(EILocal["EngInventory_Button_ChangeEditMode_off"]);
	end
	EngInventory_resort_required = ENGINVENTORY_MANDATORY;
	-- resort will force a window redraw
	EngInventory_UpdateWindow();
end

function EngInventory_Button_MoveLockToggle_OnClick()
	PlaySound("igMainMenuOptionCheckBoxOn");
	if (EngInventoryConfig["moveLock"] == 0) then
		EngInventoryConfig["moveLock"] = 1;
		EngInventory_Button_MoveLockToggle:SetText(EILocal["EngInventory_Button_MoveLock_unlocked"]);
	else
		EngInventoryConfig["moveLock"] = 0;
		EngInventory_Button_MoveLockToggle:SetText(EILocal["EngInventory_Button_MoveLock_locked"]);
	end
end

function EngInventory_SlotTargetButton_OnClick(button, ignoreShift)
        local bar, tmp;

        if (EngInventory_edit_mode == 1) then
                for tmp in string.gfind(this:GetName(), "EngInventory_frame_SlotTarget_(%d+)") do
                        bar = tonumber(tmp);
                end

                if ( (bar == nil) or (bar < 1) or (bar > EngBags_MAX_BARS) ) then
                        return;
                end

                if ( button == "LeftButton" ) then

                        if (EngInventory_edit_selected ~= "") then
                                -- we got a click, and we already had one selected.  let's move the items
                                EngInventoryConfig["putinslot--"..EngInventory_edit_selected] = bar;

                                EngInventory_edit_selected = "";
                                EngInventory_edit_hilight = "";

				EngInventory_resort_required = ENGINVENTORY_MANDATORY;
				-- resort will force a window redraw as well
                                EngInventory_UpdateWindow();
                        end

		elseif ( button == "RightButton" ) then

			HideDropDownMenu(1);
			EngInventory_RightClickMenu_mode = "slot_target";
			EngInventory_RightClickMenu_opts = {
				["bar"] = bar
				};
			ToggleDropDownMenu(1, nil, EngInventory_frame_RightClickMenu, this:GetName(), -50, 0);

                end
        end
end

function EngInventory_SlotTargetButton_OnEnter()
        local bar, tmp, key, value;

        if (EngInventory_edit_mode == 1) then
                for tmp in string.gfind(this:GetName(), "EngInventory_frame_SlotTarget_(%d+)") do
                        bar = tonumber(tmp);
                end

                if (EngInventory_edit_selected ~= "") then
                        GameTooltip:SetOwner(this, "ANCHOR_LEFT");
                        GameTooltip:ClearLines();
                        GameTooltip:AddLine("|cFF00FF7FLeft click to move catagory |r"..EngInventory_edit_selected.."|cFF00FF7F to bar |r"..bar, 1,0.25,0.5 );
                        GameTooltip:Show();
                        return;
		else
                        GameTooltip:SetOwner(this, "ANCHOR_LEFT");
                        GameTooltip:ClearLines();
                        GameTooltip:AddLine("|cFF00FF7FBar |r"..bar, 1,0.25,0.5 );
			--GameTooltip:AddLine(" ");
			for key,value in EngInventoryConfig do
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

function EngInventory_SlotTargetButton_OnLeave()
        this.updateTooltip = nil;
        if ( GameTooltip:IsOwned(this) ) then
                GameTooltip:Hide();
                ResetCursor();
        end
end

function EngInventory_SlotTargetButton_OnUpdate(elapsed)
        if ( not this.updateTooltip ) then
                return;
        end

        this.updateTooltip = this.updateTooltip - elapsed;
        if ( this.updateTooltip > 0 ) then
                return;
        end

        if ( GameTooltip:IsOwned(this) ) then
                EngInventory_SlotTargetButton_OnEnter();
        else
                this.updateTooltip = nil;
        end
end

function EngInventory_SetNewColor(previousValues)
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
			EngInventoryConfig["bar_colors_"..(UIDROPDOWNMENU_MENU_VALUE["bar"]).."_"..(UIDROPDOWNMENU_MENU_VALUE["element"]).."_r"] = r;
		end
		if (g ~= nil) then
			EngInventoryConfig["bar_colors_"..(UIDROPDOWNMENU_MENU_VALUE["bar"]).."_"..(UIDROPDOWNMENU_MENU_VALUE["element"]).."_g"] = g;
		end
		if (b ~= nil) then
			EngInventoryConfig["bar_colors_"..(UIDROPDOWNMENU_MENU_VALUE["bar"]).."_"..(UIDROPDOWNMENU_MENU_VALUE["element"]).."_b"] = b;
		end
		if (opacity ~= nil) then
			EngInventoryConfig["bar_colors_"..(UIDROPDOWNMENU_MENU_VALUE["bar"]).."_"..(UIDROPDOWNMENU_MENU_VALUE["element"]).."_a"] = opacity;
		end
		EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
		EngInventory_UpdateWindow();
	end
end

function EngInventory_RightClick_DeleteItemOverride()
	local bagnum, slotnum, itm;

	bagnum = this.value["bagnum"];
	slotnum = this.value["slotnum"];

	if ( (bagnum ~= nil) and (slotnum ~= nil) ) then
		itm = EngInventory_item_cache[bagnum][slotnum];

		if ( (itm["itemlink_override_key"] ~= nil) and (EngInventoryConfig["item_overrides"][itm["itemlink_override_key"]] ~= nil) ) then
			EngInventoryConfig["item_overrides"] = EngBags_Table_RemoveKey(EngInventoryConfig["item_overrides"], itm["itemlink_override_key"] );
			HideDropDownMenu(1);
			EngInventory_resort_required = ENGINVENTORY_MANDATORY;
			-- resort will force a window redraw as well
			EngInventory_UpdateWindow();
		end
	end
end

function EngInventory_RightClick_SetItemOverride()
	local bagnum, slotnum, itm, new_barclass;

	bagnum = this.value["bagnum"];
	slotnum = this.value["slotnum"];
	new_barclass = this.value["barclass"];

	if ( (bagnum ~= nil) and (slotnum ~= nil) and (new_barclass ~= nil) ) then
		itm = EngInventory_item_cache[bagnum][slotnum];

		EngInventoryConfig["item_overrides"][itm["itemlink_override_key"]] = new_barclass;
		HideDropDownMenu(2);
		HideDropDownMenu(1);
		EngInventory_resort_required = ENGINVENTORY_MANDATORY;
		EngInventory_UpdateWindow();
	end
end

function EngInventory_frame_RightClickMenu_populate(level)
	local bar, position, bagnum, slotnum;
	local info, itm, barclass, tmp, checked, i;
	local key, value, key2, value2, bplayer;


	-------------------------------------------------------------------------------------------------
	------------------------------- ITEM CONTEXT MENU -----------------------------------------------
	-------------------------------------------------------------------------------------------------
	if (EngInventory_RightClickMenu_mode == "item") then
		-- we have a right click on a button

		bar = EngInventory_RightClickMenu_opts["bar"];
		position = EngInventory_RightClickMenu_opts["position"];
		bagnum = EngInventory_bar_positions[bar][position]["bagnum"];
		slotnum = EngInventory_bar_positions[bar][position]["slotnum"];
		itm = EngInventory_item_cache[bagnum][slotnum];

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
			if (EngInventoryConfig["item_overrides"][itm["itemlink_override_key"]] ~= nil) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Use default catagory assignment",
				["value"] = { ["bagnum"]=bagnum, ["slotnum"]=slotnum },
				["func"] = EngInventory_RightClick_DeleteItemOverride
				};
			if (EngInventoryConfig["item_overrides"][itm["itemlink_override_key"]] == nil) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			if (ENGINVENTORY_SHOWITEMDEBUGINFO==1) then
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
					if ( (EngInventoryConfig["item_overrides"][itm["itemlink_override_key"]] ~= nil) and (EngInventoryConfig["putinslot--"..EngInventoryConfig["item_overrides"][itm["itemlink_override_key"]]] == i) ) then
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
					for key,barclass in EngInventory_Catagories(EngInventory_Catagories_Exclude_List, this.value["select_bar"]) do
						info = {
							["text"] = barclass;
							["value"] = { ["bagnum"]=bagnum, ["slotnum"]=slotnum, ["barclass"]=barclass },
							["func"] = EngInventory_RightClick_SetItemOverride
							};
						if (EngInventoryConfig["item_overrides"][itm["itemlink_override_key"]] == barclass) then
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
	elseif (EngInventory_RightClickMenu_mode == "slot_target") then
		-- right click on a slot
		bar = EngInventory_RightClickMenu_opts["bar"];

		info = { ["text"] = "Bar "..bar, ["notClickable"] = 1, ["isTitle"] = 1, ["notCheckable"] = nil };
		UIDropDownMenu_AddButton(info, level);

		info = { ["disabled"] = 1 };
		UIDropDownMenu_AddButton(info, level);

		for key,value in EngInventoryConfig do
			if ( (string.find(key, "putinslot--")) and (value==bar) and (not string.find(key, "__version")) ) then
				barclass = string.sub(key, 12);

				if ( type(value)=="number" ) then
					info = {
						["text"] = "Select: "..barclass;
						["value"] = barclass;
						["func"] = function()
								EngInventory_edit_selected = (this.value);
								EngInventory_edit_hilight = (this.value);
								EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
								EngInventory_UpdateWindow();
							end
						};
					UIDropDownMenu_AddButton(info, level);
				else
					info = {
						["text"] = "Select: "..barclass.." => "..value,
						["value"] = value;
						["func"] = function()
								EngInventory_edit_selected = (this.value);
								EngInventory_edit_hilight = (this.value);
								EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
								EngInventory_UpdateWindow();
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

			if (EngInventoryConfig["bar_sort_"..bar] == key) then
				checked = 1;
			else
				checked = nil;
			end

			info = {
				["text"] = value;
				["value"] = { ["bar"]=bar, ["sortmode"]=key };
				["func"] = function()
						EngInventoryConfig["bar_sort_"..(this.value["bar"])] = (this.value["sortmode"]);
						EngInventory_resort_required = ENGINVENTORY_MANDATORY;
						EngInventory_UpdateWindow();			
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

			if (EngInventoryConfig["allow_new_in_bar_"..bar] == key) then
				checked = 1;
			else
				checked = nil;
			end

			info = {
				["text"] = value;
				["value"] = { ["bar"]=bar, ["value"]=key };
				["func"] = function()
						EngInventoryConfig["allow_new_in_bar_"..(this.value["bar"])] = (this.value["value"]);
						EngInventory_resort_required = ENGINVENTORY_MANDATORY;
						EngInventory_UpdateWindow();
					end,
				["checked"] = checked
				};
			UIDropDownMenu_AddButton(info, level);
		end

		info = { ["disabled"] = 1 };
		UIDropDownMenu_AddButton(info, level);

		info = { ["text"] = "Hide Bar:", ["notClickable"] = 1, ["isTitle"] = 1, ["notCheckable"] = nil };
		UIDropDownMenu_AddButton(info, level);

		for key,value in {
			[0] = "Show Bar Items",
			[1] = "Hide Bar items"
			} do

			if (EngInventoryConfig["hide_items_in_bar_"..bar] == key) then
				checked = 1;
			else
				checked = nil;
			end

			info = {
				["text"] = value;
				["value"] = { ["bar"]=bar, ["value"]=key };
				["func"] = function()
						EngInventoryConfig["hide_items_in_bar_"..(this.value["bar"])] = (this.value["value"]);
						EngInventory_resort_required = ENGINVENTORY_MANDATORY;
						EngInventory_UpdateWindow();
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
			["r"] = EngInventoryConfig["bar_colors_"..bar.."_background_r"],
			["g"] = EngInventoryConfig["bar_colors_"..bar.."_background_g"],
			["b"] = EngInventoryConfig["bar_colors_"..bar.."_background_b"],
			["opacity"] = EngInventoryConfig["bar_colors_"..bar.."_background_a"],
			["notClickable"] = 1,
			["value"] = { ["bar"]=bar, ["element"] = "background" },
			["swatchFunc"] = EngInventory_SetNewColor,
			["cancelFunc"] = EngInventory_SetNewColor,
			["opacityFunc"] = EngInventory_SetNewColor
			};
		UIDropDownMenu_AddButton(info, level);
		info = {
			["text"] = "Border Color",
			["hasColorSwatch"] = 1,
			["hasOpacity"] = 1,
			["r"] = EngInventoryConfig["bar_colors_"..bar.."_border_r"],
			["g"] = EngInventoryConfig["bar_colors_"..bar.."_border_g"],
			["b"] = EngInventoryConfig["bar_colors_"..bar.."_border_b"],
			["opacity"] = EngInventoryConfig["bar_colors_"..bar.."_border_a"],
			["notClickable"] = 1,
			["value"] = { ["bar"]=bar, ["element"] = "border" },
			["swatchFunc"] = EngInventory_SetNewColor,
			["cancelFunc"] = EngInventory_SetNewColor,
			["opacityFunc"] = EngInventory_SetNewColor
			};
		UIDropDownMenu_AddButton(info, level);

	-------------------------------------------------------------------------------------------------
	------------------------ MAIN WINDOW CONTEXT MENU -----------------------------------------------
	-------------------------------------------------------------------------------------------------
	elseif (EngInventory_RightClickMenu_mode == "mainwindow") then
		if (level == 1) then

			info = { ["text"] = EILocal["RightClick_MenuTitle"], ["notClickable"] = 1, ["isTitle"] = 1, ["notCheckable"] = nil };
			UIDropDownMenu_AddButton(info, level);


			info = { ["disabled"] = 1 };
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Hilight New Items",
				["value"] = nil,
				["func"] = EngInventory_Button_HighlightToggle_OnClick
				};
			if (EngInventory_hilight_new == 1) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Edit Mode",
				["value"] = nil,
				["func"] = EngInventory_Button_ChangeEditMode_OnClick
				};
			if (EngInventory_edit_mode == 1) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Lock window",
				["value"] = nil,
				["func"] = EngInventory_Button_MoveLockToggle_OnClick
				};
			if (EngInventoryConfig["moveLock"] == 0) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Show top buttons",
				["value"] = nil,
				["func"] = function()
						if (EngInventoryConfig["show_top_graphics"] == 0) then
							EngInventoryConfig["show_top_graphics"] = 1;

						else
							EngInventoryConfig["show_top_graphics"] = 0;
						end
						EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
						EngInventory_UpdateWindow();
					end
				};
			if (EngInventoryConfig["show_top_graphics"] == 1) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Show Bank",
				["value"] = nil,
				["func"] = function()
						EngBank_SlotCostFrame:Hide();
						EngBank_PurchaseButton:Hide();
						B4nkFrameBag1:Hide();
						B4nkFrameBag2:Hide();
						B4nkFrameBag3:Hide();
						B4nkFrameBag4:Hide();
						B4nkFrameBag5:Hide();
						B4nkFrameBag6:Hide();
						EngBags_UserDropdown:Show();
						EngBank_frame:Show();
					end
				};
			UIDropDownMenu_AddButton(info, level);

			info = { ["disabled"] = 1 };
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Hide Empty Bag Icons",
				["value"] = nil,
				["func"] = function()
						if (EngInventoryConfig["hide_bag_icons"] == 0) then
							EngInventoryConfig["hide_bag_icons"] = 1;
							EngBags_Print("Empty Bag Icons Activated.");
						else
							EngInventoryConfig["hide_bag_icons"] = 0;
							EngBags_Print("Empty Bag Icons Disabled.");
						end

						EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
						EngInventory_UpdateWindow();
					end
				};
			if (EngInventoryConfig["hide_bag_icons"] == 1) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Hide Empty Keyring Slots",
				["value"] = nil,
				["func"] = function()
						if (EngInventoryConfig["hide_keyring_empty_slots"] == 0) then
							EngInventoryConfig["hide_keyring_empty_slots"] = 1;
						else
							EngInventoryConfig["hide_keyring_empty_slots"] = 0;
						end
						-- Update the cache and resort items to clean up the empty icons correctly.
						EngInventory_Update_item_cache();
						EngInventory_Sort_item_cache();
						EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
						EngInventory_UpdateWindow();
					end
				};
			if (EngInventoryConfig["hide_keyring_empty_slots"] == 1) then
				info["checked"] = 1;
			end
			UIDropDownMenu_AddButton(info, level);

			info = { ["disabled"] = 1 };
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Reset NEW tag",
				["value"] = nil,
				["func"] = function()
						local bagnum, slotnum;

						for index, bagnum in ipairs(EngInventory_Bags) do
							if (EngInventoryConfig["show_Bag"..bagnum] == 1) then
								if (table.getn(EngInventory_item_cache[bagnum]) > 0) then
									for slotnum = 1, table.getn(EngInventory_item_cache[bagnum]) do
										EngInventory_item_cache[bagnum][slotnum]["indexed_on"] = 1;
										EngInventory_item_cache[bagnum][slotnum]["display_string"] = "NewItemText_Off";
									end
								end
							end
						end

						EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
						EngInventory_UpdateWindow();
					end
				};
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Reload bags",
				["value"] = nil,
				["func"] = function()
						EngBagsItems[EngBags_PLAYERID] = {};
						EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
						EngInventory_UpdateWindow();
						EngBags_Print("Bags reloaded.");
					end
				};
			UIDropDownMenu_AddButton(info, level);


			info = { ["disabled"] = 1 };
			UIDropDownMenu_AddButton(info, level);

			info = {
				["text"] = "Advanced Configuration",
				["value"] = nil,
				["func"] = function()
						EngInventory_OptsFrame:Show();
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
				["text"] = "Import Config";
				["value"] = { ["opt"]="import_config" },
				["hasArrow"] = 1
				};
			UIDropDownMenu_AddButton(info, level);

			info = { ["disabled"] = 1 };
			UIDropDownMenu_AddButton(info, level);
			

			info = {
				["text"] = "Background Color",
				["hasColorSwatch"] = 1,
				["hasOpacity"] = 1,
				["r"] = EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_r"],
				["g"] = EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_g"],
				["b"] = EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_b"],
				["opacity"] = EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_a"],
				["notClickable"] = 1,
				["value"] = { ["bar"]=EngBags_MAINWINDOWCOLORIDX, ["element"] = "background" },
				["swatchFunc"] = EngInventory_SetNewColor,
				["cancelFunc"] = EngInventory_SetNewColor,
				["opacityFunc"] = EngInventory_SetNewColor
				};
			UIDropDownMenu_AddButton(info, level);
			info = {
				["text"] = "Border Color",
				["hasColorSwatch"] = 1,
				["hasOpacity"] = 1,
				["r"] = EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_r"],
				["g"] = EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_g"],
				["b"] = EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_b"],
				["opacity"] = EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_a"],
				["notClickable"] = 1,
				["value"] = { ["bar"]=EngBags_MAINWINDOWCOLORIDX, ["element"] = "border" },
				["swatchFunc"] = EngInventory_SetNewColor,
				["cancelFunc"] = EngInventory_SetNewColor,
				["opacityFunc"] = EngInventory_SetNewColor
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
					for key,value in { 20,30,35,40,50,60 } do
						info = {
							["text"] = value.."x"..value;
							["value"] = value;
							["func"] = function()
									if ( (type(this.value) == "number") and (this.value > 19) ) then
										EngInventoryConfig["frameButtonSize"] = this.value;
										EngInventory_CalcButtonSize(EngInventoryConfig["frameButtonSize"]);
										EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
										EngInventory_UpdateWindow();
										EI_CreateBagsBar();
									end
								end
							};
						if (EngInventoryConfig["frameButtonSize"] == value) then
							info["checked"] = 1;
						end
						UIDropDownMenu_AddButton(info, level);
					end
				end
				if (this.value["opt"] == "import_config") then
					for key,value in EngBagsItems do
						if ( EngBagsConfig["Inventory"][key] ~= nil ) then
							info = {
								["text"] = key;
								["value"] = key;
								["func"] = function()
										EngBagsConfig["Inventory"][EngBags_PLAYERID] = EngBags_copyTable(EngBagsConfig["Inventory"][this.value]);
										EngBagsConfig["Bank"][EngBags_PLAYERID] = EngBags_copyTable(EngBagsConfig["Bank"][this.value]);
										EngInventory_SetDefaultValues(0);
										EngBank_SetDefaultValues(0);
										EngBagsItems[EngBags_PLAYERID] = {};
										EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
										EngBank_window_update_required = ENGINVENTORY_MANDATORY;
										EngInventory_UpdateWindow();
										EngBank_UpdateWindow();
										EngBags_Print("Settings from ".. this.value .." loaded.");
									end
								};
							UIDropDownMenu_AddButton(info, level);
						end
					end					
				end
			end
		end
	end
end


-- Main "right click menu"
function EngInventory_frame_RightClickMenu_OnLoad()
	UIDropDownMenu_Initialize(this, EngInventory_frame_RightClickMenu_populate, "MENU");
end


function EngInventory_IncreaseColumns()
	if (EngInventoryConfig["maxColumns"] < EngBags_MAXCOLUMNS_MAX) then
		EngInventoryConfig["maxColumns"] = EngInventoryConfig["maxColumns"] + 1;
		EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
		EngInventory_UpdateWindow();
	end
end

function EngInventory_DecreaseColumns()
	if (EngInventoryConfig["maxColumns"] > EngBags_MAXCOLUMNS_MIN) then
		EngInventoryConfig["maxColumns"] = EngInventoryConfig["maxColumns"] - 1;
		EngInventory_window_update_required = ENGINVENTORY_MANDATORY;
		EngInventory_UpdateWindow();
	end
end

function EngInventory_MoveAndSizeFrame(frameName, childAttachPoint, parentFrameName, parentAttachPoint, xoffset, yoffset, width, height)
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
function EngInventory_AssignButtonsToFrame(barnum, currentbutton, frame, width, height)
        local cur_x, cur_y, tmpframe;
	local position;
	local bagnum, slotnum;

        cur_x = 0;
        cur_y = 0;

        if (table.getn(EngInventory_bar_positions[barnum]) > 0) then
                for position = 1, table.getn(EngInventory_bar_positions[barnum]) do
			bagnum = EngInventory_bar_positions[barnum][position]["bagnum"];
			slotnum = EngInventory_bar_positions[barnum][position]["slotnum"];

                        EngInventory_item_cache[bagnum][slotnum]["button_num"] = currentbutton;

                        EngInventory_MoveAndSizeFrame("EngInventory_frame_Item_"..currentbutton, "BOTTOMRIGHT",
                                frame, "BOTTOMRIGHT",
                                0-(
                                ((cur_x*EngBags_BUTTONFRAME_WIDTH )+EngBags_BUTTONFRAME_X_PADDING) + EngInventoryConfig["frameXSpace"]
                                ),
                                ((cur_y*EngBags_BUTTONFRAME_HEIGHT)+EngBags_BUTTONFRAME_Y_PADDING) + EngInventoryConfig["frameYSpace"],
                                EngBags_BUTTONFRAME_BUTTONWIDTH,
                                EngBags_BUTTONFRAME_BUTTONHEIGHT );
                        EngInventory_MoveAndSizeFrame("EngInventory_frame_Item_"..currentbutton.."_bkgr", "TOPLEFT",
                                "EngInventory_frame_Item_"..currentbutton, "TOPLEFT",
                                0-EngBags_BUTTONFRAME_X_PADDING,
                                EngBags_BUTTONFRAME_Y_PADDING,
                                EngBags_BKGRFRAME_WIDTH,
                                EngBags_BKGRFRAME_HEIGHT );

                        EngInventory_buttons["EngInventory_frame_Item_"..currentbutton] = { ["bar"]=barnum, ["position"]=position, ["bagnum"]=bagnum, ["slotnum"]=slotnum };
                        EngInventory_UpdateButton( getglobal("EngInventory_frame_Item_"..currentbutton), EngInventory_item_cache[bagnum][slotnum] );

                        cur_x = cur_x + 1;
                        if (cur_x == width) then
                                cur_x = 0;
                                cur_y = cur_y + 1;
                        end

                        currentbutton = currentbutton + 1;
                end
        end

        if (EngInventory_edit_mode == 1) then
                -- add extra button for targetting
                EngInventory_MoveAndSizeFrame("EngInventory_frame_SlotTarget_"..barnum, "BOTTOMRIGHT",
                        frame, "BOTTOMRIGHT",
                        0-(
                        (((width-1)*EngBags_BUTTONFRAME_WIDTH )+EngBags_BUTTONFRAME_X_PADDING) + EngInventoryConfig["frameXSpace"]
                        ),
                        (((height-1)*EngBags_BUTTONFRAME_HEIGHT)+EngBags_BUTTONFRAME_Y_PADDING) + EngInventoryConfig["frameYSpace"],
                        EngBags_BUTTONFRAME_BUTTONWIDTH,
                        EngBags_BUTTONFRAME_BUTTONHEIGHT );
                EngInventory_MoveAndSizeFrame("EngInventory_frame_SlotTarget_"..barnum.."_bkgr", "TOPLEFT",
                        "EngInventory_frame_SlotTarget_"..barnum, "TOPLEFT",
                        0-EngBags_BUTTONFRAME_X_PADDING,
                        EngBags_BUTTONFRAME_Y_PADDING,
                        EngBags_BKGRFRAME_WIDTH,
                        EngBags_BKGRFRAME_HEIGHT );
                
                tmpframe = getglobal("EngInventory_frame_SlotTarget_"..barnum.."_BigText");
                tmpframe:SetText( barnum );
                tmpframe:Show();
                tmpframe = getglobal("EngInventory_frame_SlotTarget_"..barnum.."_bkgr");
                tmpframe:SetVertexColor( 1,0,0.25, 0.5 );
        end

        return currentbutton;
end

EngInventory_WindowIsUpdating = 0;
function EngInventory_UpdateWindow()
	

        local frame = getglobal("EngInventory_frame");
        
        local currentbutton, barnum, slotnum;
        local barframe_one, barframe_two, barframe_three, tmpframe;
        local calc_dat, tmpcalc, cur_y;
        local available_width, width_in_between, mid_point;

        EngBags_PrintDEBUG("ei: UpdateWindow()  WindowIsUpdating="..EngInventory_WindowIsUpdating );

        if (EngInventory_WindowIsUpdating == 1) then
                return;
        end
        EngInventory_WindowIsUpdating = 1;

        if ( EILocal["_loaded"]==0 ) then
                EngInventory_WindowIsUpdating = 0;
                return;
        end


	if ( not frame:IsVisible() ) then
		EngInventory_WindowIsUpdating = 0;
	return;
	end

        EngInventory_Update_item_cache();
	if (EngInventory_resort_required == ENGINVENTORY_MANDATORY) then
		EngInventory_Sort_item_cache();
	end

	if (EngInventory_edit_mode == 1) then
		EngInventory_WindowBottomPadding = ENGINVENTORY_WINDOWBOTTOMPADDING_EDITMODE;
	else
		EngInventory_WindowBottomPadding = ENGINVENTORY_WINDOWBOTTOMPADDING_NORMALMODE;
	end

	if (EngInventory_window_update_required > ENGINVENTORY_NOTNEEDED) then

		currentbutton = 1;
		cur_y = EngInventoryConfig["frameYSpace"] + EngInventory_WindowBottomPadding;
		for barnum = 1, EngBags_MAX_BARS, 3 do
			barframe_one = getglobal("EngInventory_frame_bar_"..barnum);
			barframe_two = getglobal("EngInventory_frame_bar_"..(barnum+1));
			barframe_three = getglobal("EngInventory_frame_bar_"..(barnum+2));

			calc_dat = {};
			calc_dat = {
				["first"] = table.getn(EngInventory_bar_positions[barnum]),
				["second"] = table.getn(EngInventory_bar_positions[barnum+1]),
				["third"] = table.getn(EngInventory_bar_positions[barnum+2])
				};
			if (EngInventory_edit_mode == 1) then
				-- add an extra slot if we're in edit mode
				calc_dat["first"] = calc_dat["first"] + 1;
				calc_dat["second"] = calc_dat["second"] + 1;
				calc_dat["third"] = calc_dat["third"] + 1;
			else
				-- we're not in edit mode, make sure the SlotTarget button and texture is hidden
				tmpframe = getglobal("EngInventory_frame_SlotTarget_"..(barnum));
				tmpframe:Hide();
				tmpframe = getglobal("EngInventory_frame_SlotTarget_"..(barnum).."_bkgr");
				tmpframe:Hide();
				tmpframe = getglobal("EngInventory_frame_SlotTarget_"..(barnum+1));
				tmpframe:Hide();
				tmpframe = getglobal("EngInventory_frame_SlotTarget_"..(barnum+1).."_bkgr");
				tmpframe:Hide();
				tmpframe = getglobal("EngInventory_frame_SlotTarget_"..(barnum+2));
				tmpframe:Hide();
				tmpframe = getglobal("EngInventory_frame_SlotTarget_"..(barnum+2).."_bkgr");
				tmpframe:Hide();
			end
			calc_dat["total_in_row"] = calc_dat["first"] + calc_dat["second"] + calc_dat["third"];

			calc_dat["first_heighttable"] = {};
			if calc_dat["first"] > 0 then
				for tmpcalc = 1, calc_dat["first"] do
					calc_dat["first_heighttable"][tmpcalc] = math.ceil( calc_dat["first"] / tmpcalc );
				end
			end
			calc_dat["second_heighttable"] = {};
			if calc_dat["second"] > 0 then
				for tmpcalc = 1, calc_dat["second"] do
					calc_dat["second_heighttable"][tmpcalc] = math.ceil( calc_dat["second"] / tmpcalc );
				end
			end
			calc_dat["third_heighttable"] = {};
			if calc_dat["third"] > 0 then
				for tmpcalc = 1, calc_dat["third"] do
					calc_dat["third_heighttable"][tmpcalc] = math.ceil( calc_dat["third"] / tmpcalc );
				end
			end

			calc_dat["height"] = 0;
			repeat
				calc_dat["height"] = calc_dat["height"] + 1;
				tmpcalc = 0;
				if (calc_dat["first"] > 0 and (EngInventoryConfig["hide_items_in_bar_"..(barnum)] == 0 or EngInventory_edit_mode == 1)) then
					if (calc_dat["first_heighttable"][calc_dat["height"]]) then
						tmpcalc = tmpcalc + calc_dat["first_heighttable"][calc_dat["height"]];
					else
						tmpcalc = tmpcalc + 1;
					end
				end
				if (calc_dat["second"] > 0 and (EngInventoryConfig["hide_items_in_bar_"..(barnum+1)] == 0 or EngInventory_edit_mode == 1)) then
					if (calc_dat["second_heighttable"][calc_dat["height"]]) then
						tmpcalc = tmpcalc + calc_dat["second_heighttable"][calc_dat["height"]];
					else
						tmpcalc = tmpcalc + 1;
					end
				end
				if (calc_dat["third"] > 0 and (EngInventoryConfig["hide_items_in_bar_"..(barnum+2)] == 0 or EngInventory_edit_mode == 1)) then
					if (calc_dat["third_heighttable"][calc_dat["height"]]) then
						tmpcalc = tmpcalc + calc_dat["third_heighttable"][calc_dat["height"]];
					else
						tmpcalc = tmpcalc + 1;
					end
				end
			until tmpcalc <= EngInventoryConfig["maxColumns"];

			if tmpcalc == 0 then
				calc_dat["height"] = 0;
			else

				-- at calc_dat["height"], everything fits
				if calc_dat["first"] > 0 then
					if (calc_dat["first_heighttable"][calc_dat["height"]]) then
						calc_dat["first_width"] = calc_dat["first_heighttable"][calc_dat["height"]];
					else
						calc_dat["first_width"] = 1;
					end
				else
					calc_dat["first_width"] = 0;
				end
				if calc_dat["second"] > 0 then
					if (calc_dat["second_heighttable"][calc_dat["height"]]) then
						calc_dat["second_width"] = calc_dat["second_heighttable"][calc_dat["height"]];
					else
						calc_dat["second_width"] = 1;
					end
				else
					calc_dat["second_width"] = 0;
				end
				if calc_dat["third"] > 0 then
					if (calc_dat["third_heighttable"][calc_dat["height"]]) then
						calc_dat["third_width"] = calc_dat["third_heighttable"][calc_dat["height"]];
					else
						calc_dat["third_width"] = 1;
					end
				else
					calc_dat["third_width"] = 0;
				end
			end

			-- If the bar is hidden, the height and width for that bar is 0. (out of edit mode)
			if (EngInventory_edit_mode == 0) then
				if (EngInventoryConfig["hide_items_in_bar_"..(barnum)] == 1) then
					calc_dat["first_height"] = 0;
					calc_dat["first_width"] = 0;
				end
				if (EngInventoryConfig["hide_items_in_bar_"..(barnum+1)] == 1) then
					calc_dat["second_height"] = 0;
					calc_dat["second_width"] = 0;
				end
				if (EngInventoryConfig["hide_items_in_bar_"..(barnum+2)] == 1) then
					calc_dat["third_height"] = 0;
					calc_dat["third_width"] = 0;
				end
			end

			--- now we know the size and height of all 3 bars for this line

			if (calc_dat["height"] == 0) then
				-- all 3 bars are not visible
				barframe_one:Hide();
				barframe_two:Hide();
				barframe_three:Hide();
			else
				available_width = (EngInventoryConfig["maxColumns"]*EngBags_BUTTONFRAME_WIDTH) + (10*EngInventoryConfig["frameXSpace"]);

				------------------------------------------------------------------------------------------
				--------- FIRST BAR
				if (calc_dat["first_width"] > 0) then
				EngInventory_MoveAndSizeFrame("EngInventory_frame_bar_"..barnum, "BOTTOMRIGHT",
					"EngInventory_frame", "BOTTOMRIGHT",
					0-EngInventoryConfig["frameXSpace"],
					cur_y,
					(calc_dat["first_width"]*EngBags_BUTTONFRAME_WIDTH)+(2*EngInventoryConfig["frameXSpace"]),
					(calc_dat["height"]*EngBags_BUTTONFRAME_HEIGHT)+(2*EngInventoryConfig["frameYSpace"]) );
				barframe_one:SetBackdropColor(
					EngInventoryConfig["bar_colors_"..barnum.."_background_r"],
					EngInventoryConfig["bar_colors_"..barnum.."_background_g"],
					EngInventoryConfig["bar_colors_"..barnum.."_background_b"],
					EngInventoryConfig["bar_colors_"..barnum.."_background_a"] );
				barframe_one:SetBackdropBorderColor(
					EngInventoryConfig["bar_colors_"..barnum.."_border_r"],
					EngInventoryConfig["bar_colors_"..barnum.."_border_g"],
					EngInventoryConfig["bar_colors_"..barnum.."_border_b"],
					EngInventoryConfig["bar_colors_"..barnum.."_border_a"] );
				else
					barframe_one:Hide();
				end

				------------------------------------------------------------------------------------------
				--------- SECOND BAR
				if (calc_dat["second_width"] > 0) then
					width_in_between = available_width - (
						(EngInventoryConfig["frameXSpace"] * 4) +       -- border on both sides + borders between frames
						((calc_dat["first_width"]*EngBags_BUTTONFRAME_WIDTH)+(2*EngInventoryConfig["frameXSpace"])) +      -- bar 1 size
						((calc_dat["third_width"]*EngBags_BUTTONFRAME_WIDTH)+(2*EngInventoryConfig["frameXSpace"]))        -- bar 3 size
						);
					mid_point = (width_in_between/2) +
						((calc_dat["first_width"]*EngBags_BUTTONFRAME_WIDTH)+(2*EngInventoryConfig["frameXSpace"])) +
						(EngInventoryConfig["frameXSpace"] * 2);


					EngInventory_MoveAndSizeFrame("EngInventory_frame_bar_"..(barnum+1), "BOTTOMRIGHT",
						"EngInventory_frame", "BOTTOMRIGHT",
						0-( mid_point - (((calc_dat["second_width"]*EngBags_BUTTONFRAME_WIDTH)+(2*EngInventoryConfig["frameXSpace"]))/2) ),
						cur_y,
						(calc_dat["second_width"]*EngBags_BUTTONFRAME_WIDTH)+(2*EngInventoryConfig["frameXSpace"]),
						(calc_dat["height"]*EngBags_BUTTONFRAME_HEIGHT)+(2*EngInventoryConfig["frameYSpace"]) );
					barframe_two:SetBackdropColor(
						EngInventoryConfig["bar_colors_"..(barnum+1).."_background_r"],
						EngInventoryConfig["bar_colors_"..(barnum+1).."_background_g"],
						EngInventoryConfig["bar_colors_"..(barnum+1).."_background_b"],
						EngInventoryConfig["bar_colors_"..(barnum+1).."_background_a"] );
					barframe_two:SetBackdropBorderColor(
						EngInventoryConfig["bar_colors_"..(barnum+1).."_border_r"],
						EngInventoryConfig["bar_colors_"..(barnum+1).."_border_g"],
						EngInventoryConfig["bar_colors_"..(barnum+1).."_border_b"],
						EngInventoryConfig["bar_colors_"..(barnum+1).."_border_a"] );
				else
					barframe_two:Hide();
				end

				------------------------------------------------------------------------------------------
				--------- THIRD BAR
				if (calc_dat["third_width"] > 0) then
				EngInventory_MoveAndSizeFrame("EngInventory_frame_bar_"..(barnum+2), "BOTTOMRIGHT",
					"EngInventory_frame", "BOTTOMRIGHT",
					(0-available_width) +(calc_dat["third_width"]*EngBags_BUTTONFRAME_WIDTH)+(3*EngInventoryConfig["frameXSpace"]),
					cur_y,
					(calc_dat["third_width"]*EngBags_BUTTONFRAME_WIDTH)+(2*EngInventoryConfig["frameXSpace"]),
					(calc_dat["height"]*EngBags_BUTTONFRAME_HEIGHT)+(2*EngInventoryConfig["frameYSpace"]) );
				barframe_three:SetBackdropColor(
					EngInventoryConfig["bar_colors_"..(barnum+2).."_background_r"],
					EngInventoryConfig["bar_colors_"..(barnum+2).."_background_g"],
					EngInventoryConfig["bar_colors_"..(barnum+2).."_background_b"],
					EngInventoryConfig["bar_colors_"..(barnum+2).."_background_a"] );
				barframe_three:SetBackdropBorderColor(
					EngInventoryConfig["bar_colors_"..(barnum+2).."_border_r"],
					EngInventoryConfig["bar_colors_"..(barnum+2).."_border_g"],
					EngInventoryConfig["bar_colors_"..(barnum+2).."_border_b"],
					EngInventoryConfig["bar_colors_"..(barnum+2).."_border_a"] );
				else
					barframe_three:Hide();
				end

				-----
				if (EngInventoryConfig["hide_items_in_bar_"..(barnum)] == 0 or EngInventory_edit_mode == 1) then
				currentbutton = EngInventory_AssignButtonsToFrame(barnum, currentbutton,
					"EngInventory_frame_bar_"..(barnum),
					calc_dat["first_width"], calc_dat["height"] );
				end
				if (EngInventoryConfig["hide_items_in_bar_"..(barnum+1)] == 0 or EngInventory_edit_mode == 1) then
				currentbutton = EngInventory_AssignButtonsToFrame(barnum+1, currentbutton,
					"EngInventory_frame_bar_"..(barnum+1),
					calc_dat["second_width"], calc_dat["height"] );
				end
				if (EngInventoryConfig["hide_items_in_bar_"..(barnum+2)] == 0 or EngInventory_edit_mode == 1) then
				currentbutton = EngInventory_AssignButtonsToFrame(barnum+2, currentbutton,
					"EngInventory_frame_bar_"..(barnum+2),
					calc_dat["third_width"], calc_dat["height"] );
				end

				cur_y = cur_y + (calc_dat["height"]*EngBags_BUTTONFRAME_HEIGHT)+(3*EngInventoryConfig["frameYSpace"]);
			end
		end

		-- hide unused buttons
		if (currentbutton <= ENGINVENTORY_MAXBUTTONS) then
			for currentbutton = currentbutton, ENGINVENTORY_MAXBUTTONS do
				tmpframe = getglobal("EngInventory_frame_Item_"..(currentbutton));
				tmpframe:Hide();
				tmpframe = getglobal("EngInventory_frame_Item_"..(currentbutton).."_bkgr");
				tmpframe:Hide();
			end
		end

		local new_width = (EngInventoryConfig["maxColumns"]*EngBags_BUTTONFRAME_WIDTH) + (10*EngInventoryConfig["frameXSpace"]);
		local new_height;
		
		if (EngInventoryConfig["show_top_graphics"] == 1) then
			new_height = cur_y + ENGINVENTORY_TOP_PADWINDOW;
			if (EngInventoryConfig["frameButtonSize"]==35) then
				EngInventory_Button_Close:SetScale(0.9);
				EngInventory_Button_MoveLockToggle:SetScale(0.9);
				EngInventory_Button_ChangeEditMode:SetScale(0.9);
				EngInventory_Button_HighlightToggle:SetScale(0.9);
			elseif (EngInventoryConfig["frameButtonSize"]==30) then
				EngInventory_Button_Close:SetScale(0.8);
				EngInventory_Button_MoveLockToggle:SetScale(0.8);
				EngInventory_Button_ChangeEditMode:SetScale(0.8);
				EngInventory_Button_HighlightToggle:SetScale(0.8);
			elseif (EngInventoryConfig["frameButtonSize"]==20) then
				EngInventory_Button_Close:SetScale(0.7);
				EngInventory_Button_MoveLockToggle:SetScale(0.7);
				EngInventory_Button_ChangeEditMode:SetScale(0.7);
				EngInventory_Button_HighlightToggle:SetScale(0.7);
			else
				EngInventory_Button_Close:SetScale(1);
				EngInventory_Button_MoveLockToggle:SetScale(1);
				EngInventory_Button_ChangeEditMode:SetScale(1);
				EngInventory_Button_HighlightToggle:SetScale(1);
			end
		else
			new_height = cur_y + 25;
			EngInventory_Button_Close:SetScale(1);
			EngInventory_Button_MoveLockToggle:SetScale(1);
			EngInventory_Button_ChangeEditMode:SetScale(1);
			EngInventory_Button_HighlightToggle:SetScale(1);
		end

--		frame:SetScale(EngBagsConfig["frameWindowScale"]);
		frame:SetWidth( new_width );
		frame:SetHeight( new_height );

		frame:ClearAllPoints();
		frame:SetPoint(EngInventoryConfig["frameYRelativeTo"]..EngInventoryConfig["frameXRelativeTo"],
			"UIParent", "BOTTOMLEFT",
			EngInventoryConfig["frame"..EngInventoryConfig["frameXRelativeTo"]] / frame:GetScale(),
			EngInventoryConfig["frame"..EngInventoryConfig["frameYRelativeTo"]] / frame:GetScale());

		frame:SetBackdropColor(
			EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_r"],
			EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_g"],
			EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_b"],
			EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_background_a"] );
		frame:SetBackdropBorderColor(
			EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_r"],
			EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_g"],
			EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_b"],
			EngInventoryConfig["bar_colors_"..EngBags_MAINWINDOWCOLORIDX.."_border_a"] );

		EngInventory_MoneyFrame:Show();

		if (EngInventory_edit_mode == 1) then
			EngInventory_Button_ColumnsAdd:SetText(EILocal["EngInventory_Button_ColumnsAdd_buttontitle"]);
			EngInventory_Button_ColumnsAdd:Show();
			EngInventory_Button_ColumnsDel:SetText(EILocal["EngInventory_Button_ColumnsDel_buttontitle"]);
			EngInventory_Button_ColumnsDel:Show();
		else
			EngInventory_Button_ColumnsAdd:Hide();
			EngInventory_Button_ColumnsDel:Hide();
		end

		if (EngInventoryConfig["show_top_graphics"] == 1) then
			EngInventory_Button_Close:Show();
			EngInventory_Button_MoveLockToggle:Show();
			EngInventory_Button_ChangeEditMode:Show();
			EngInventory_Button_HighlightToggle:Show();

			--EngInventory_framePortrait:Show();
			--EngInventory_frameTextureTopLeft:Show();
			--EngInventory_frameTextureTopCenter:Show();
			--EngInventory_frameTextureTopRight:Show();
			--EngInventory_frameTextureLeft:Show();
--			--EngInventory_frameTextureCenter:Show();
			--EngInventory_frameTextureRight:Show();
			--EngInventory_frameTextureBottomLeft:Show();
			--EngInventory_frameTextureBottomCenter:Show();
			--EngInventory_frameTextureBottomRight:Show();
			EngInventory_framePortrait:Hide();
			EngInventory_frameTextureTopLeft:Hide();
			EngInventory_frameTextureTopCenter:Hide();
			EngInventory_frameTextureTopRight:Hide();
			EngInventory_frameTextureLeft:Hide();
--			EngInventory_frameTextureCenter:Hide();
			EngInventory_frameTextureRight:Hide();
			EngInventory_frameTextureBottomLeft:Hide();
			EngInventory_frameTextureBottomCenter:Hide();
			EngInventory_frameTextureBottomRight:Hide();
		else
			-- hide all the top graphics
			EngInventory_Button_Close:Hide();
			EngInventory_Button_MoveLockToggle:Hide();
			EngInventory_Button_ChangeEditMode:Hide();
			EngInventory_Button_HighlightToggle:Hide();

			EngInventory_framePortrait:Hide();
			EngInventory_frameTextureTopLeft:Hide();
			EngInventory_frameTextureTopCenter:Hide();
			EngInventory_frameTextureTopRight:Hide();
			EngInventory_frameTextureLeft:Hide();
--			EngInventory_frameTextureCenter:Hide();
			EngInventory_frameTextureRight:Hide();
			EngInventory_frameTextureBottomLeft:Hide();
			EngInventory_frameTextureBottomCenter:Hide();
			EngInventory_frameTextureBottomRight:Hide();
		end
	end

	EngInventory_window_update_required = ENGINVENTORY_NOTNEEDED;

        EngInventory_WindowIsUpdating = 0;
end
function EngInventory_UpdateBagState()
        local shouldBeChecked = EngInventory_frame:IsVisible();
		if (EngInventoryConfig["hook_Bag0"] == 1) then
	        MainMenuBarBackpackButton:SetChecked(shouldBeChecked);
		end
        local bagButton = nil;
        for i = 0, 3 do 
		if (EngInventoryConfig["hook_Bag"..(i+1)] == 1) then
			bagButton = getglobal("CharacterBag"..i.."Slot");
			if ( bagButton ) then
				bagButton:SetChecked(shouldBeChecked);
			end
		end
        end
end
