
function EngBags_ReagentHelper_ModifyItemTooltip(bag, slot, tooltipName, itm)
	if ( ReagentHelper_ModifyTooltip ) then
		local shouldModifyTooltip = true;
		if ( Auctioneer_GetFilter ) then
			if ( Auctioneer_GetFilter("all") ) and ( Auctioneer_GetFilter("usage") ) then
				shouldModifyTooltip = false;
			end
		end
		if ( shouldModifyTooltip ) then
			ReagentHelper_ModifyTooltip(tooltipName);
		end
	end
end

function EngBags_LootLink_SetTooltipMoney(frame, count, money, stack)
	if ( not money ) then return; end
	if ( money <= 0) then return; end
	if ( count and count > 1 ) then
		money = money * count;
		frame:AddLine(format(LOOTLINK_SELL_PRICE_N, count), 1.0, 1.0, 1.0);
	elseif( stack ) then
		frame:AddLine(LOOTLINK_SELL_PRICE_EACH, 1.0, 1.0, 1.0);
	else
		frame:AddLine(LOOTLINK_SELL_PRICE, 1.0, 1.0, 1.0);
	end
	
	local numLines = frame:NumLines();
	local moneyFrame = getglobal(frame:GetName().."MoneyFrame");
	local newLine = frame:GetName().."TextLeft"..numLines;
	
	moneyFrame:SetPoint("LEFT", newLine, "RIGHT", 4, 0);
	moneyFrame:Show();
	MoneyFrame_Update(moneyFrame:GetName(), money);
	frame:SetMinimumWidth(moneyFrame:GetWidth() + getglobal(newLine):GetWidth() - 10);
end

function EngBags_LootLink_ModifyItemTooltip(bag, slot, tooltipName, itm)
	local tooltip = getglobal(tooltipName);

	if ( not tooltip ) then
		tooltip = getglobal("GameTooltip");
		tooltipName = "GameTooltip";
	end
	if ( not tooltip ) then
		return false;
	end

	local shouldModify = true;
	if ( ( InRepairMode() ) or
		( EngBags_ModifyTooltipsAtMerchant == 0 ) and ( MerchantFrame:IsVisible() ) ) then
		shouldModify = false;
	end
	if ( 
		( LootLink_AddExtraTooltipInfo ) and 
		( shouldModify ) and ( ItemLinks ) ) then

		local name = nil;
		if ( itm ) and ( itm["itemname"] ) then
			name = itm["itemname"];
		end

		local data = ItemLinks[name];
		if ( ( not LootLinkState ) or ( not LootLinkState.HideInfo ) ) and ( name ) and ( data ) then
			if ( itm ) and ( itm["itemname"] ) then
				if ( EngBags_ShowPrice == 1 ) then
					local money = ItemLinks[name].p;
					if ( not money ) and ( ItemLinks[name].price ) then
						money = ItemLinks[name].price;
					end
					local stack = ItemLinks[name].x;
					if ( not stack ) and ( ItemLinks[name].stack ) then
						stack = ItemLinks[name].stack;
					end
					if ( money ) then
						EngBags_LootLink_SetTooltipMoney(tooltip, itm["itemcount"], money, stack);
					end
				end
				LootLink_AddExtraTooltipInfo(tooltip, name, itm["itemcount"], data);
				--tooltip:Show();
				if( tooltip == GameTooltip ) then
					GameTooltip.llDone = 1;
				end
			end
		end
	elseif ( ( LootLink_Tooltip_Hook ) and ( shouldModify ) and ( ItemLinks ) ) then
		local name = nil;
		if ( itm ) then
			name = itm["itemname"];
		end
		if ( itm ) and ( name ) and ( strlen(name) > 0 ) and ( ItemLinks[name] ) then
			local data = ItemLinks[name];
			local money = 0;
			if ( data.p ) then
				money = data.p;
			elseif ( data.price ) then
				money = data.price;
			end
			if ( not money ) then money = 0; end
			local tooltip = getglobal(tooltipName);
			if ( not tooltip ) then	
				return;
			end
			LootLink_Tooltip_Hook(tooltip, name, money, itm["itemcount"], data);
			--tooltip:Show();
		end
	end
end


-- itm is the entry from the cache
function EngBags_RegisterCurrentTooltipSellValue(tooltip, bag, slot, itm)
	if ( not itm ) or ( not itm["itemname"] ) or ( strlen(itm["itemname"]) <= 0 ) then
		return;
	end

	if ( SellValue_SaveFor ) then
		local moneyFrame = getglobal(tooltip:GetName().."MoneyFrame");
		if ( moneyFrame ) and ( moneyFrame:IsVisible() ) and ( moneyFrame.staticMoney ) then
			SellValue_SaveFor(bag, slot, itm["itemname"], moneyFrame.staticMoney);
		end
	end

	if ( LootLink_ProcessLinks ) then
		local link = GetContainerItemLink(bag, slot);
		local name = LootLink_ProcessLinks(link);
		if ( LootLink_VendorEntry_Hook ) then
			local moneyFrame = getglobal(tooltip:GetName().."MoneyFrame");
			if ( moneyFrame ) and ( moneyFrame:IsVisible() ) and ( moneyFrame.staticMoney ) then
				if ( itm["itemcount"] ) and ( itm["itemcount"] > 0 ) then
					local money = moneyFrame.staticMoney / itm["itemcount"];
					if ( ItemLinks[name] ) then
						if ( not ItemLinks[name].price ) and ( not ItemLinks[name].p ) then
							ItemLinks[name].p = money;
						end
						--LootLink_VendorEntry_Hook(bag, slot, itemInfo.name, moneyFrame.staticMoney);
					end
				end
			else
				local stringFormat = tooltip:GetName().."TextLeft%d";
				local string = nil;
				local text = nil;
				for i = 2, 10 do
					string = getglobal(stringFormat, i);
					if ( string ) and ( string:IsVisible() ) then
						text = string:GetText();
						if ( text ) and ( text == TEXT(ITEM_UNSELLABLE) ) then
							if ( ItemLinks[name] ) and ( ( ItemLinks[name].p ) or ( ItemLinks[name].price ) )  then
								ItemLinks[name].p = nil;
								ItemLinks[name].price = nil;
							end
						end
					end
				end
				
			end
		end
	end
end

-- modifies the tooltip
--
-- Auctioneer doesn't want to call you. It prefers for you to call it.
--
-- Packrat:  If you want me to stop calling you, set EngBags_DontCallPackrat to anything.
--
function EngBags_ModifyItemTooltip(bag, slot, tooltipName, itm)
	if ( not tooltipName ) then
		tooltipName = "GameTooltip";
	end

	if ( (PackRat ~= nil) and (EngBags_DontCallPackrat == nil) ) then
		PackRat._itemEntered = { bag, slot };
		PackRat:DisplayTooltipPrice()
	end

	EngBags_ReagentHelper_ModifyItemTooltip(bag, slot, tooltipName, itm);
	EngBags_LootLink_ModifyItemTooltip(bag, slot, tooltipName, itm);
	local tooltip = getglobal(tooltipName);
	if ( not tooltip ) then	
		return;
	end

	if EnhTooltip and bag and slot and ( bag < 0 or bag > 4 ) then		-- This is only needed for bank bags (-1,6,7,8,9,10)
		local link = GetContainerItemLink(bag, slot);
		if (itm["itemname"]) then
			local texture, itemCount, locked, quality, readable = GetContainerItemInfo(bag, slot);
			if (quality == nil) then quality = EnhTooltip.QualityFromLink(link); end
			EnhTooltip.TooltipCall(GameTooltip, itm["itemname"], link, quality, itemCount, 0);
		end
	else
		tooltip:Show();
	end
end
