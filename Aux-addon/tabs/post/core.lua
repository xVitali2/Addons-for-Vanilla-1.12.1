module 'aux.tabs.post'

include 'T'
include 'aux'

local info = require 'aux.util.info'
local sort_util = require 'aux.util.sort'
local persistence = require 'aux.util.persistence'
local money = require 'aux.util.money'
local scan_util = require 'aux.util.scan'
local post = require 'aux.core.post'
local scan = require 'aux.core.scan'
local history = require 'aux.core.history'
local item_listing = require 'aux.gui.item_listing'
local al = require 'aux.gui.auction_listing'

TAB 'Post'

local DURATION_4, DURATION_8, DURATION_24 = 120, 480, 1440
local settings_schema = {'tuple', '#', {stack_size='number'}, {duration='number'}, {start_price='number'}, {buyout_price='number'}, {hidden='boolean'}}

local scan_id, inventory_records, bid_records, buyout_records = 0, T, T, T

function get_default_settings()
	return O('duration', DURATION_8 , 'stack_size', 1, 'start_price', 0, 'buyout_price', 0, 'hidden', false)
end

do
	local data
	function get_data()
		if not data then
			local dataset = persistence.dataset
			data = dataset.post or T
			dataset.post = data
		end
		return data
	end
end

function read_settings(item_key)
	item_key = item_key or selected_item.key
	return data[item_key] and persistence.read(settings_schema, data[item_key]) or default_settings
end

function write_settings(settings, item_key)
	item_key = item_key or selected_item.key
	data[item_key] = persistence.write(settings_schema, settings)
end

function refresh_button_click()
	scan.abort(scan_id)
	refresh_entries()
	refresh = true
end

do
	local item
	function get_selected_item() return item end
	function set_selected_item(v) item = v end
end

do
	local c = 0
	function get_refresh() return c end
	function set_refresh(v) c = v end
end

function OPEN()
    frame:Show()
    update_inventory_records()
    refresh = true
end

function CLOSE()
    selected_item = nil
    frame:Hide()
end

function USE_ITEM(item_info)
	select_item(item_info.item_key)
end

function get_unit_start_price()
    local money_text = unit_start_price_input:GetText()
    return money.from_string(money_text) or 0
end

function set_unit_start_price(amount)
    unit_start_price_input:SetText(money.to_string(amount, true, nil, 3, nil, true))
end

function get_unit_buyout_price()
    local money_text = unit_buyout_price_input:GetText()
    return money.from_string(money_text) or 0
end

function set_unit_buyout_price(amount)
    unit_buyout_price_input:SetText(money.to_string(amount, true, nil, 3, nil, true))
end

function update_inventory_listing()
	local records = values(filter(copy(inventory_records), function(record)
		local settings = read_settings(record.key)
		return record.aux_quantity > 0 and (not settings.hidden or show_hidden_checkbox:GetChecked())
	end))
	sort(records, function(a, b) return a.name < b.name end)
	item_listing.populate(inventory_listing, records)
end

function price_color(record, reference)
	local unit_undercut = undercut(record, stack_size_slider:GetValue())
	unit_undercut = money.from_string(money.to_string(unit_undercut, true, nil, 3))

	local stack_undercut = undercut(record, stack_size_slider:GetValue(), true)
	stack_undercut = money.from_string(money.to_string(stack_undercut, true, nil, 3))

	if unit_undercut < reference and stack_undercut < reference then
		return color.red
	elseif unit_undercut < reference then
		return color.orange
	elseif stack_undercut < reference then
		return color.yellow
	end
end

function update_auction_listing(listing, records, reference)
	local rows = T
	if selected_item then
		local historical_value = history.value(selected_item.key)
		local stack_size = stack_size_slider:GetValue()
		for i = 1, getn(records[selected_item.key] or empty) do
			local record = records[selected_item.key][i]
			tinsert(rows, O(
				'cols', A(
				O('value', record.own and color.yellow(record.count) or record.count),
				O('value', al.time_left(record.duration)),
				O('value', record.stack_size == stack_size and color.yellow(record.stack_size) or record.stack_size),
				O('value', money.to_string(record.unit_price, true, nil, 3, price_color(record, reference, stack_size))),
				O('value', historical_value and al.percentage_historical(round(record.unit_price / historical_value * 100)) or '---')
			),
				'record', record
			))
		end
		if historical_value then
			tinsert(rows, O(
				'cols', A(
				O('value', '---'),
				O('value', '---'),
				O('value', '---'),
				O('value', money.to_string(historical_value, true, nil, 3, color.green)),
				O('value', historical_value and al.percentage_historical(100) or '---')
			),
				'record', O('historical_value', true, 'stack_size', stack_size, 'unit_price', historical_value, 'own', true)
			))
		end
		sort(rows, function(a, b)
			return sort_util.multi_lt(
				a.record.unit_price,
				b.record.unit_price,

				a.record.historical_value and 1 or 0,
				b.record.historical_value and 1 or 0,

				a.record.stack_size,
				b.record.stack_size,

				b.record.own and 1 or 0,
				a.record.own and 1 or 0,

				a.record.duration,
				b.record.duration
			)
		end)
	end
	listing:SetData(rows)
end

function update_auction_listings()
	update_auction_listing(bid_listing, bid_records, unit_start_price)
	update_auction_listing(buyout_listing, buyout_records, unit_buyout_price)
end

function M.select_item(item_key)
    for _, inventory_record in filter(copy(inventory_records), function(record) return record.aux_quantity > 0 end) do
        if inventory_record.key == item_key then
            update_item(inventory_record)
            return
        end
    end
end

function price_update()
    if selected_item then
        local settings = read_settings()

        local historical_value = history.value(selected_item.key)

        settings.start_price = unit_start_price
        start_price_percentage:SetText(historical_value and al.percentage_historical(round(unit_start_price / historical_value * 100)) or '---')

        settings.buyout_price = unit_buyout_price
        buyout_price_percentage:SetText(historical_value and al.percentage_historical(round(unit_buyout_price / historical_value * 100)) or '---')

        write_settings(settings)
    end
end

function post_auctions()
	if selected_item then
        local unit_start_price = unit_start_price
        local unit_buyout_price = unit_buyout_price
        local stack_size = stack_size_slider:GetValue()
        local stack_count
        stack_count = stack_count_slider:GetValue()
        local duration = UIDropDownMenu_GetSelectedValue(duration_dropdown)
		local key = selected_item.key

        local duration_code
		if duration == DURATION_4 then
            duration_code = 2
		elseif duration == DURATION_8 then
            duration_code = 3
		elseif duration == DURATION_24 then
            duration_code = 4
		end

		post.start(
			key,
			stack_size,
			duration,
            unit_start_price,
            unit_buyout_price,
			stack_count,
			function(posted)
				for i = 1, posted do
                    record_auction(key, stack_size, unit_start_price, unit_buyout_price, duration_code, UnitName'player')
                end
                update_inventory_records()
                selected_item = nil
                for _, record in inventory_records do
                    if record.key == key then
                        update_item(record)
	                    break
                    end
                end
                refresh = true
			end
		)
	end
end

function validate_parameters()
    if not selected_item then
        post_button:Disable()
        return
    end
    if unit_buyout_price > 0 and unit_start_price > unit_buyout_price then
        post_button:Disable()
        return
    end
    if unit_start_price == 0 then
        post_button:Disable()
        return
    end
    if stack_count_slider:GetValue() == 0 then
        post_button:Disable()
        return
    end
    post_button:Enable()
end

function update_item_configuration()
	if not selected_item then
        refresh_button:Disable()

        item.texture:SetTexture(nil)
        item.count:SetText()
        item.name:SetTextColor(color.label.enabled())
        item.name:SetText('No item selected')

        unit_start_price_input:Hide()
        unit_buyout_price_input:Hide()
        stack_size_slider:Hide()
        stack_count_slider:Hide()
        deposit:Hide()
        duration_dropdown:Hide()
        hide_checkbox:Hide()
    else
		unit_start_price_input:Show()
        unit_buyout_price_input:Show()
        stack_size_slider:Show()
        stack_count_slider:Show()
        deposit:Show()
        duration_dropdown:Show()
        hide_checkbox:Show()

        item.texture:SetTexture(selected_item.texture)
        item.name:SetText('[' .. selected_item.name .. ']')
		do
	        local color = ITEM_QUALITY_COLORS[selected_item.quality]
	        item.name:SetTextColor(color.r, color.g, color.b)
        end
		if selected_item.aux_quantity > 1 then
            item.count:SetText(selected_item.aux_quantity)
		else
            item.count:SetText()
        end

        stack_size_slider.editbox:SetNumber(stack_size_slider:GetValue())
        stack_count_slider.editbox:SetNumber(stack_count_slider:GetValue())

        do
            local deposit_factor = neutral_faction() and .25 or .05
            local stack_size, stack_count = stack_size_slider:GetValue(), stack_count_slider:GetValue()
            local amount = floor(selected_item.unit_vendor_price * deposit_factor * (selected_item.max_charges and 1 or stack_size)) * stack_count * UIDropDownMenu_GetSelectedValue(duration_dropdown) / 120
            deposit:SetText('Deposit: ' .. money.to_string(amount, nil, nil, nil, color.text.enabled))
        end

        refresh_button:Enable()
	end
end

function undercut(record, stack_size, stack)
    local price = round(record.unit_price * (stack and record.stack_size or stack_size))
    if not record.own then
	    price = max(0, price - 1)
    end
    return price / stack_size
end

function quantity_update(max_count)
    if selected_item then
        local max_stack_count = selected_item.max_charges and selected_item.availability[stack_size_slider:GetValue()] or floor(selected_item.availability[0] / stack_size_slider:GetValue())
        stack_count_slider:SetMinMaxValues(1, max_stack_count)
        if max_count then
            stack_count_slider:SetValue(max_stack_count)
        end
    end
    refresh = true
end

function unit_vendor_price(item_key)
    for slot in info.inventory do
	    temp(slot)
        local item_info = temp-info.container_item(unpack(slot))
        if item_info and item_info.item_key == item_key then
            if info.auctionable(item_info.tooltip, nil, item_info.lootable) then
                ClearCursor()
                PickupContainerItem(unpack(slot))
                ClickAuctionSellItemButton()
                local auction_sell_item = temp-info.auction_sell_item()
                ClearCursor()
                ClickAuctionSellItemButton()
                ClearCursor()
                if auction_sell_item then
                    return auction_sell_item.vendor_price / auction_sell_item.count
                end
            end
        end
    end
end

function update_item(item)
    local settings = read_settings(item.key)

    item.unit_vendor_price = unit_vendor_price(item.key)
    if not item.unit_vendor_price then
        settings.hidden = 1
        write_settings(settings, item.key)
        refresh = true
        return
    end

    scan.abort(scan_id)

    selected_item = item

    UIDropDownMenu_Initialize(duration_dropdown, initialize_duration_dropdown)
    UIDropDownMenu_SetSelectedValue(duration_dropdown, settings.duration)

    hide_checkbox:SetChecked(settings.hidden)

    stack_size_slider:SetMinMaxValues(1, selected_item.max_charges or selected_item.max_stack)
    stack_size_slider:SetValue(settings.stack_size)
    quantity_update(true)

    unit_start_price_input:SetText(money.to_string(settings.start_price, true, nil, 3, nil, true))
    unit_buyout_price_input:SetText(money.to_string(settings.buyout_price, true, nil, 3, nil, true))

    if not bid_records[selected_item.key] then
        refresh_entries()
    end

    write_settings(settings, item.key)
    refresh = true
end

function update_inventory_records()
    local auctionable_map = temp-T
    for slot in info.inventory do
	    temp(slot)
	    local item_info = temp-info.container_item(unpack(slot))
        if item_info then
            local charge_class = item_info.charges or 0
            if info.auctionable(item_info.tooltip, nil, item_info.lootable) then
                if not auctionable_map[item_info.item_key] then
                    local availability = T
                    for i = 0, 10 do
                        availability[i] = 0
                    end
                    availability[charge_class] = item_info.count
                    auctionable_map[item_info.item_key] = O(
	                    'item_id', item_info.item_id,
	                    'suffix_id', item_info.suffix_id,
	                    'key', item_info.item_key,
	                    'itemstring', item_info.itemstring,
	                    'name', item_info.name,
	                    'texture', item_info.texture,
	                    'quality', item_info.quality,
	                    'aux_quantity', item_info.charges or item_info.count,
	                    'max_stack', item_info.max_stack,
	                    'max_charges', item_info.max_charges,
	                    'availability', availability
                    )
                else
                    local auctionable = auctionable_map[item_info.item_key]
                    auctionable.availability[charge_class] = (auctionable.availability[charge_class] or 0) + item_info.count
                    auctionable.aux_quantity = auctionable.aux_quantity + (item_info.charges or item_info.count)
                end
            end
        end
    end
    release(inventory_records)
    inventory_records = values(auctionable_map)
    refresh = true
end

function refresh_entries()
	if selected_item then
		local item_id, suffix_id = selected_item.item_id, selected_item.suffix_id
        local item_key = item_id .. ':' .. suffix_id
        bid_records[item_key], buyout_records[item_key] = nil, nil
        local query = scan_util.item_query(item_id)
        status_bar:update_status(0,0)
        status_bar:set_text('Scanning auctions...')

		scan_id = scan.start{
            type = 'list',
            ignore_owner = true,
			queries = A(query),
			on_page_loaded = function(page, total_pages)
                status_bar:update_status((page - 1) / total_pages, 0) -- TODO
                status_bar:set_text(format('Scanning Page %d / %d', page, total_pages))
			end,
			on_auction = function(auction_record)
				if auction_record.item_key == item_key then
                    record_auction(
                        auction_record.item_key,
                        auction_record.aux_quantity,
                        auction_record.unit_blizzard_bid,
                        auction_record.unit_buyout_price,
                        auction_record.duration,
                        auction_record.owner
                    )
				end
			end,
			on_abort = function()
				bid_records[item_key], buyout_records[item_key]= nil, nil
                status_bar:update_status(1, 1)
                status_bar:set_text('Scan aborted')
			end,
			on_complete = function()
				bid_records[item_key] = bid_records[item_key] or T
				buyout_records[item_key] = buyout_records[item_key] or T
                refresh = true
                status_bar:update_status(1, 1)
                status_bar:set_text('Scan complete')
            end,
		}
	end
end

function record_auction(key, aux_quantity, unit_blizzard_bid, unit_buyout_price, duration, owner)
    bid_records[key] = bid_records[key] or T
    do
	    local entry
	    for _, record in bid_records[key] do
	        if unit_blizzard_bid == record.unit_price and aux_quantity == record.stack_size and duration == record.duration and is_player(owner) == record.own then
	            entry = record
	        end
	    end
	    if not entry then
	        entry = O('stack_size', aux_quantity, 'unit_price', unit_blizzard_bid, 'duration', duration, 'own', is_player(owner), 'count', 0)
	        tinsert(bid_records[key], entry)
	    end
	    entry.count = entry.count + 1
    end
    buyout_records[key] = buyout_records[key] or T
    if unit_buyout_price == 0 then return end
    do
	    local entry
	    for _, record in buyout_records[key] do
		    if unit_buyout_price == record.unit_price and aux_quantity == record.stack_size and duration == record.duration and is_player(owner) == record.own then
			    entry = record
		    end
	    end
	    if not entry then
		    entry = O('stack_size', aux_quantity, 'unit_price', unit_buyout_price, 'duration', duration, 'own', is_player(owner), 'count', 0)
		    tinsert(buyout_records[key], entry)
	    end
	    entry.count = entry.count + 1
    end
end

function on_update()
    if refresh then
        refresh = false
        price_update()
        update_item_configuration()
        update_inventory_listing()
        update_auction_listings()
    end
    validate_parameters()
end

function initialize_duration_dropdown()
    local function on_click()
        UIDropDownMenu_SetSelectedValue(duration_dropdown, this.value)
        local settings = read_settings()
        settings.duration = this.value
        write_settings(settings)
        refresh = true
    end
    UIDropDownMenu_AddButton{
        text = '2 Hours',
        value = DURATION_4,
        func = on_click,
    }
    UIDropDownMenu_AddButton{
        text = '8 Hours',
        value = DURATION_8,
        func = on_click,
    }
    UIDropDownMenu_AddButton{
        text = '24 Hours',
        value = DURATION_24,
        func = on_click,
    }
end
