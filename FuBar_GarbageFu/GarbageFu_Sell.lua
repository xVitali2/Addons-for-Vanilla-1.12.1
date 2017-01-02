-- $Revision: 16894 $
-- $Date: 2006-11-13 15:29:21 -0500 (Mon, 13 Nov 2006) $
if not GarbageFu then return end
------------------------------------------------------------------------------------------------------
-- Sell Items functions
------------------------------------------------------------------------------------------------------
local L = AceLibrary("AceLocale-2.2"):new("FuBar_GarbageFu")
local dewdrop = AceLibrary("Dewdrop-2.0");
local compost = AceLibrary("Compost-2.0");

	
function GarbageFu:InitSell()
	self:MakeSellAllButton();
	self:ShowSellAllButton();
end

function GarbageFu:IsSellAllButton()
	return self.db.profile.sellallbutton;
end

function GarbageFu:ToggleSellAllButton()
	self.db.profile.sellallbutton = not self.db.profile.sellallbutton;
	if self.db.profile.sellallbutton then
		MerchantFrame.sellAllButton:Show();
	else
		MerchantFrame.sellAllButton:Hide();
	end
end

function GarbageFu:IsSellOnlyGrey()
	return self.db.profile.sellonlygrey;
end

function GarbageFu:ToggleSellOnlyGrey()
	self.db.profile.sellonlygrey = not self.db.profile.sellonlygrey;
end

function GarbageFu:IsItemSellable(item)
	if (item.qual == 0 or not self:IsSellOnlyGrey()) and self:IsItemDroppable(item) then
		return true;
	end
	return false;
end

function GarbageFu:IsThereItemsToSell()
	for _,item in ipairs(self.vars.items) do
		if self:IsItemSellable(item) then
			return true;
		end
	end
	return false;
end

function GarbageFu:GetSellItems()
	local sellItems = self:GetTable();
	local sellValue = 0;
	for _,item in ipairs(self.vars.items) do
		if self:IsItemSellable(item) then
			table.insert(sellItems,item);
			sellValue = sellValue + item.totvalue;
		end
	end
	return sellItems, sellValue;
end

function GarbageFu:GetSellValue()
	local sellValue = 0;
	for _,item in ipairs(self.vars.items) do
		if self:IsItemSellable(item) then
			sellValue = sellValue + item.totvalue;
		end
	end
	return sellValue;
end


function GarbageFu:StopSelling()
	if ( self:IsEventScheduled("SellItem") ) then
		self:CancelScheduledEvent("SellItem");
	end
end


function GarbageFu:SellAllItems()
	if ( not self:IsEventScheduled("SellItem") ) then
		if self.vars.sellitems then compost:Reclaim(self.vars.sellitems) end
		self.vars.sellitems, self.vars.sellvalue = self:GetSellItems();
		if self.vars.sellitems[1] then
			self:ScheduleRepeatingEvent("SellItem", self.SellItemEvent, 0.5, self);
		end
	end
end

function GarbageFu:SellItemEvent()
	local item = self.vars.sellitems[1];
	if ( item and MerchantFrame:IsVisible() ) then  
		if self:IsSafeToDelete() then
			self:SetSafeToDelete(false);
			self:MyPrint(L["Selling x%s %s worth %s"], item.stack, item.name, self:GetMoneyString(item.totvalue) );
			UseContainerItem(item.bag, item.slot)
			table.remove(self.vars.sellitems,1);
		end
	else -- No more items or Merchant frame closed
		if ( not item ) then
			self:MyPrint(L["All items sold."]);
			MerchantFrame.sellAllButton:Disable();
		end
		self:CancelScheduledEvent("SellItem");
		return
	end
end

------------------------------------------------------------------
-- Sell All Button functions
------------------------------------------------------------------

function GarbageFu:ShowSellAllButton()
	if self:IsSellAllButton() then
		MerchantFrame.sellAllButton:Show();
	end
end

function GarbageFu:HideSellAllButton()
	MerchantFrame.sellAllButton:Hide();
end

function GarbageFu:HighlightSellAllButton()
	if MerchantFrame.sellAllButton then
		if self:IsThereItemsToSell() then
			MerchantFrame.sellAllButton:Enable();
		else
			MerchantFrame.sellAllButton:Disable();
		end
	end
end

local buttonSize = 32
function GarbageFu:MakeSellAllButton()
	if not MerchantFrame.sellAllButton then
		local sellAllButton = CreateFrame("Button", "GarbageFu_SellItemButton", MerchantFrame)
		MerchantFrame.sellAllButton = sellAllButton
		sellAllButton:SetWidth(buttonSize)
		sellAllButton:SetHeight(buttonSize)
		local texture = sellAllButton:CreateTexture()
		texture:SetWidth(buttonSize * 1.6458333)
		texture:SetHeight(buttonSize * 1.6458333)
		texture:SetPoint("CENTER", sellAllButton, "CENTER")
		texture:SetTexture("Interface\\Buttons\\UI-Quickslot2")
		sellAllButton:SetNormalTexture(texture)
		local texture = sellAllButton:CreateTexture(nil, "BACKGROUND")
		texture:SetTexture("Interface\\AddOns\\FuBar_GarbageFu\\icon.tga")
		texture:SetAllPoints(sellAllButton)
		sellAllButton:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
		local texture = sellAllButton:CreateTexture()
		texture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
		texture:SetAllPoints(sellAllButton)
		sellAllButton:SetHighlightTexture(texture)
		local texture = sellAllButton:CreateTexture()
		texture:SetTexture("Interface\\AddOns\\FuBar_GarbageFu\\icon.tga")
		texture:SetDesaturated(true)
		texture:SetAllPoints(sellAllButton)
		sellAllButton:SetDisabledTexture(texture)
		sellAllButton:SetPoint("TOPRIGHT", MerchantFrame, "TOPRIGHT", -44, -38)
		sellAllButton:SetScript("OnClick", function()
			self:SellAllItems()
		end)
		sellAllButton:SetScript("OnEnter", function()
			self:SellAllButtonOnEnter(this)
		end)
		sellAllButton:SetScript("OnLeave", function()
			GameTooltip:Hide()
		end)
		local texture = sellAllButton:CreateTexture(nil, "ARTWORK")
		texture:SetTexture(0, 0, 0, 0.5)
		texture:SetAllPoints(sellAllButton)
		local button_Enable = sellAllButton.Enable
		function sellAllButton:Enable()
			button_Enable(self)
			texture:Hide()
		end
		local button_Disable = sellAllButton.Disable
		function sellAllButton:Disable()
			button_Disable(self)
			texture:Show()
		end
		MerchantFrame.sellAllButton:Disable()
	end	
end

function GarbageFu:SellAllButtonOnEnter(button)
	GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
	if self:IsSellOnlyGrey() then
		GameTooltip:SetText(L["Sell all grey items"]);
		GameTooltip:AddLine(L["SellsAll TooltipText2"]);
	else
		GameTooltip:SetText(L["Sell all garbage items"]);
		GameTooltip:AddLine(L["SellsAll TooltipText1"]);
	end
	local sellValue = self:GetSellValue();
	GameTooltip:AddLine(L["Value:"].." "..self:GetMoneyString(sellValue));
	GameTooltip:Show()
end


function GarbageFu:BuildSellMenu(level, value, inTooltip, value2)
	if ( level == 1 ) then
		if MerchantFrame:IsVisible() and self:IsThereItemsToSell() then
			local sellValue = self:GetSellValue();
			GameTooltip:AddLine(L["Value:"].." "..self:GetMoneyString(sellValue));
			if self:IsSellOnlyGrey() then
				dewdrop:AddLine('text', L["Sell all grey items"].." "..self:GetMoneyString(sellValue), 
					'arg1', self, 'func', 'SellAllItems',
					'tooltipTitle', L["Sell all grey items"], 'tooltipText', L["SellsAll TooltipText2"],
					'closeWhenClicked', true );
			else
				dewdrop:AddLine('text', L["Sell all garbage items"].." "..self:GetMoneyString(sellValue), 
					'arg1', self, 'func', 'SellAllItems',
					'tooltipTitle', L["Sell all garbage items"], 'tooltipText', L["SellsAll TooltipText1"],
					'closeWhenClicked', true );
			end
		end
	end
end

function GarbageFu:BuildSellOptionsMenu(level, value, inTooltip, value2)
	if ( level == 1 ) then
		dewdrop:AddLine('text', L["Sell All Button on Merchant Window"], 'checked', self:IsSellAllButton(), 
			'arg1', self, 'func', 'ToggleSellAllButton',
			'tooltipTitle', L["Sell All Button on Merchant Window"], 'tooltipText', L["SellAllButton TooltipText"]);
		dewdrop:AddLine('text', L["Only Autosell Grey Items"], 'checked', self:IsSellOnlyGrey(), 
			'arg1', self, 'func', 'ToggleSellOnlyGrey',
			'tooltipTitle', L["Only Autosell Grey Items"], 'tooltipText', L["OnlyGrey TooltipText"]);
	end
end