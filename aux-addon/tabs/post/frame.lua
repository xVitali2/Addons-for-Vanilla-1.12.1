module 'aux.tabs.post'

local aux = require 'aux'
local info = require 'aux.util.info'
local money = require 'aux.util.money'
local gui = require 'aux.gui'
local listing = require 'aux.gui.listing'
local item_listing = require 'aux.gui.item_listing'
local search_tab = require 'aux.tabs.search'

frame = CreateFrame('Frame', nil, aux.frame)
frame:SetAllPoints()
frame:SetScript('OnUpdate', on_update)
frame:Hide()

frame.content = CreateFrame('Frame', nil, frame)
frame.content:SetPoint('TOP', frame, 'TOP', 0, -8)
frame.content:SetPoint('BOTTOMLEFT', aux.frame.content, 'BOTTOMLEFT', 0, 0)
frame.content:SetPoint('BOTTOMRIGHT', aux.frame.content, 'BOTTOMRIGHT', 0, 0)

frame.inventory = gui.panel(frame.content)
frame.inventory:SetWidth(212)
frame.inventory:SetPoint('TOPLEFT', 0, 0)
frame.inventory:SetPoint('BOTTOMLEFT', 0, 0)

frame.parameters = gui.panel(frame.content)
frame.parameters:SetHeight(173)
frame.parameters:SetPoint('TOPLEFT', frame.inventory, 'TOPRIGHT', 2.5, 0)
frame.parameters:SetPoint('TOPRIGHT', 0, 0)

frame.bid_listing = gui.panel(frame.content)
frame.bid_listing:SetHeight(228)
frame.bid_listing:SetWidth(271.5)
frame.bid_listing:SetPoint('BOTTOMLEFT', frame.inventory, 'BOTTOMRIGHT', 2.5, 0)

frame.buyout_listing = gui.panel(frame.content)
frame.buyout_listing:SetHeight(228)
frame.buyout_listing:SetWidth(271.5)
frame.buyout_listing:SetPoint('BOTTOMRIGHT', 0, 0)

do
    local checkbox = gui.checkbox(frame.inventory)
    checkbox:SetPoint('TOPLEFT', 10, -2) --byCFM
    checkbox:SetScript('OnClick', function()
        refresh = true
    end)
    local label = gui.label(checkbox, gui.font_size.small)
    label:SetPoint('LEFT', checkbox, 'RIGHT', 4, 1)
    label:SetText(HIDDEN_ITEMS) --byLICHERY
    show_hidden_checkbox = checkbox
end

gui.horizontal_line(frame.inventory, -45)

do
	local f = CreateFrame('Frame', nil, frame.inventory)
	f:SetPoint('TOPLEFT', 0, -51)
	f:SetPoint('BOTTOMRIGHT', 0, 0)
	inventory_listing = item_listing.new(
		f,
	    function()
	        if arg1 == 'LeftButton' then
	            update_item(this.item_record)
				if Informant then --byCFM
					local id =this.item_record.item_id--byCFM
					local itdata = Informant.GetItem(id)--byCFM
					local str=nil--byCFM
					local gold,silver,copper=nil,nil,nil--byCFM
					if (itdata and itdata['buy'] and itdata['buy'] ~= 0) then str=itdata['sell'] end --byCFM
					if str then --byCFM
						gold,silver,copper=money.to_gsc(str) --byCFM
						str = gold.."|cffffd70ag.|r"..silver.."|cffc7c7cfs.|r"..copper.."|cffeda55fc|r" --byCFM
					end --byCFM
					if LABELFORITEM==nil then LABELFORITEM=gui.label(f, gui.font_size.small) end --byCFM
					LABELFORITEM:SetPoint('TOP', f, 'LEFT', 120, 200) --byCFM
					if str==nil then str="?" end --byCFM
					LABELFORITEM:SetText(PRICEFROMVENDOR..str) --byCFM
				end --byCFM
	        elseif arg1 == 'RightButton' then
	            aux.set_tab(1)
				local itemname=info.item(this.item_record.item_id).name --byCFM
				if GetLocale()=="ruRU" then --byCFM
					local s,ss,sss=nil,nil,nil --byCFM
					ss = string.find(itemname,"крошшера") --byCFM
					sss = string.find(itemname,"Тернистой долины:") --byCFM
					if ss then --byCFM
						s=string.sub(itemname,56,84) --byCFM
					elseif sss then --byCFM
						s=string.sub(itemname,27,69) --byCFM
					else --byCFM
						s=string.sub(itemname,0,63) --byCFM
					end --byCFM
					search_tab.set_filter(s) --byCFM
				else --byCFM
					search_tab.set_filter(strlower(itemname) .. '/exact') --byCFM
				end --byCFM
	            search_tab.execute(nil, false)
	        end
	    end,
	    function(item_record)
	        return item_record == selected_item
	    end
	)
end

bid_listing = listing.new(frame.bid_listing)
bid_listing:SetColInfo{
    {name=AUCTIONS_1, width=.16, align='CENTER'}, --byLICHERY
    {name=TIME_LEFT, width=.10, align='CENTER'}, --byLICHERY
    {name=STACK_SIZE, width=.16, align='CENTER'}, --byLICHERY
    {name=AUCTION_BID, width=.4, align='RIGHT'}, --byLICHERY
    {name=HIST_VALUE, width=.18, align='CENTER'}, --byLICHERY
}
bid_listing:SetSelection(function(data)
	return data.record == get_bid_selection() or data.record.historical_value and get_bid_selection() and get_bid_selection().historical_value
end)
bid_listing:SetHandler('OnClick', function(table, row_data, column, button)
	if row_data.record == get_bid_selection() or row_data.record.historical_value and get_bid_selection() and get_bid_selection().historical_value then
		set_bid_selection()
	else
		set_bid_selection(row_data.record)
	end
	refresh = true
end)
bid_listing:SetHandler('OnDoubleClick', function(table, row_data, column, button)
	stack_size_slider:SetValue(row_data.record.stack_size)
	refresh = true
end)

buyout_listing = listing.new(frame.buyout_listing)
buyout_listing:SetColInfo{
	{name=AUCTIONS_1, width=.16, align='CENTER'}, --byLICHERY
	{name=TIME_LEFT, width=.10, align='CENTER'}, --byLICHERY
	{name=STACK_SIZE, width=.16, align='CENTER'}, --byLICHERY
	{name=AUCTION_BUYOUT, width=.4, align='RIGHT'}, --byLICHERY
	{name=HIST_VALUE, width=.18, align='CENTER'}, --byLICHERY
}
buyout_listing:SetSelection(function(data)
	return data.record == get_buyout_selection() or data.record.historical_value and get_buyout_selection() and get_buyout_selection().historical_value
end)
buyout_listing:SetHandler('OnClick', function(table, row_data, column, button)
	if row_data.record == get_buyout_selection() or row_data.record.historical_value and get_buyout_selection() and get_buyout_selection().historical_value then
		set_buyout_selection()
	else
		set_buyout_selection(row_data.record)
	end
	refresh = true
end)
buyout_listing:SetHandler('OnDoubleClick', function(table, row_data, column, button)
	stack_size_slider:SetValue(row_data.record.stack_size)
	refresh = true
end)

do
	status_bar = gui.status_bar(frame)
    status_bar:SetWidth(280) --byLICHERY
    status_bar:SetHeight(25)
    status_bar:SetPoint('TOPLEFT', aux.frame.content, 'BOTTOMLEFT', 0, -6)
    status_bar:update_status(1, 1)
    status_bar:set_text('')
end
do
    local btn = gui.button(frame.parameters)
    btn:SetPoint('TOPLEFT', status_bar, 'TOPRIGHT', 5, 0)
    btn:SetText(POST) --byLICHERY
    btn:SetScript('OnClick', post_auctions)
    post_button = btn
end
do
    local btn = gui.button(frame.parameters)
    btn:SetPoint('TOPLEFT', post_button, 'TOPRIGHT', 5, 0)
    btn:SetText(REFRESH) --byLICHERY
	btn:SetWidth(100) --byLICHERY
    btn:SetScript('OnClick', refresh_button_click)
    refresh_button = btn
end
do
	item = gui.item(frame.parameters)
    item:SetPoint('TOPLEFT', 10, -6)
    item.button:SetScript('OnEnter', function()
        if selected_item then
            info.set_tooltip(selected_item.itemstring, this, 'ANCHOR_RIGHT')
        end
    end)
    item.button:SetScript('OnLeave', function()
        GameTooltip:Hide()
    end)
end
do
    local slider = gui.slider(frame.parameters)
    slider:SetValueStep(1)
    slider:SetPoint('TOPLEFT', 13, -73)
    slider:SetWidth(190)
    slider:SetScript('OnValueChanged', function()
        quantity_update(true)
    end)
    slider.editbox.change = function()
        slider:SetValue(this:GetNumber())
        quantity_update(true)
        if selected_item then
            local settings = read_settings()
            write_settings(settings)
        end
    end
    slider.editbox:SetScript('OnTabPressed', function()
        if IsShiftKeyDown() then
            unit_buyout_price_input:SetFocus()
        elseif stack_count_slider.editbox:IsVisible() then
            stack_count_slider.editbox:SetFocus()
        else
            unit_start_price_input:SetFocus()
        end
    end)
    slider.editbox:SetNumeric(true)
    slider.editbox:SetMaxLetters(3)
    slider.label:SetText(STACK_SIZE_2) --byLICHERY
    stack_size_slider = slider
end
do
    local slider = gui.slider(frame.parameters)
    slider:SetValueStep(1)
    slider:SetPoint('TOPLEFT', stack_size_slider, 'BOTTOMLEFT', 0, -32)
    slider:SetWidth(190)
    slider:SetScript('OnValueChanged', function()
        quantity_update()
    end)
    slider.editbox.change = function()
        slider:SetValue(this:GetNumber())
        quantity_update()
    end
    slider.editbox:SetScript('OnTabPressed', function()
        if IsShiftKeyDown() then
            stack_size_slider.editbox:SetFocus()
        else
            unit_start_price_input:SetFocus()
        end
    end)
    slider.editbox:SetNumeric(true)
    slider.label:SetText(STACK_COUNT) --byLICHERY
    stack_count_slider = slider
end
do
    local dropdown = gui.dropdown(frame.parameters)
    dropdown:SetPoint('TOPLEFT', stack_count_slider, 'BOTTOMLEFT', 0, -21) --byLICHERY
    dropdown:SetWidth(90)
    local label = gui.label(dropdown, gui.font_size.small)
    label:SetPoint('BOTTOMLEFT', dropdown, 'TOPLEFT', -2, -3)
    label:SetText(DURATION) --byLICHERY
    UIDropDownMenu_Initialize(dropdown, initialize_duration_dropdown)
    dropdown:SetScript('OnShow', function()
        UIDropDownMenu_Initialize(this, initialize_duration_dropdown)
    end)
    duration_dropdown = dropdown
end
do
    local checkbox = gui.checkbox(frame.parameters)
    checkbox:SetPoint('TOPRIGHT', -100, -6)
    checkbox:SetScript('OnClick', function()
        local settings = read_settings()
        settings.hidden = this:GetChecked()
        write_settings(settings)
        refresh = true
    end)
    local label = gui.label(checkbox, gui.font_size.small)
    label:SetPoint('LEFT', checkbox, 'RIGHT', 2, 1)
    label:SetText(HIDE_THIS_ITEM) --byLICHERY
    hide_checkbox = checkbox
end
do
    local editbox = gui.editbox(frame.parameters)
    editbox:SetPoint('TOPRIGHT', -71, -60)
    editbox:SetWidth(180)
    editbox:SetHeight(22)
    editbox:SetAlignment('RIGHT')
    editbox:SetFontSize(17)
    editbox:SetScript('OnTabPressed', function()
	    if IsShiftKeyDown() then
		    stack_count_slider.editbox:SetFocus()
	    else
		    unit_buyout_price_input:SetFocus()
	    end
    end)
    editbox.formatter = function() return money.to_string(get_unit_start_price(), true) end
    editbox.char = function() set_bid_selection(); set_buyout_selection(); set_unit_start_price(money.from_string(this:GetText())) end
    editbox.change = function() refresh = true end
    editbox.enter = function() this:ClearFocus() end
    editbox.focus_loss = function()
	    this:SetText(money.to_string(get_unit_start_price(), true, nil, nil, true))
    end
    do
        local label = gui.label(editbox, gui.font_size.small)
        label:SetPoint('BOTTOMLEFT', editbox, 'TOPLEFT', -2, 1)
        label:SetText(UNIT_STARTING_SIZE) --byLICHERY
    end
    do
        local label = gui.label(editbox, 14)
        label:SetPoint('LEFT', editbox, 'RIGHT', 8, 0)
        label:SetWidth(50)
        label:SetJustifyH('CENTER')
        start_price_percentage = label
    end
    unit_start_price_input = editbox
end
do
    local editbox = gui.editbox(frame.parameters)
    editbox:SetPoint('TOPRIGHT', unit_start_price_input, 'BOTTOMRIGHT', 0, -19)
    editbox:SetWidth(180)
    editbox:SetHeight(22)
    editbox:SetAlignment('RIGHT')
    editbox:SetFontSize(17)
    editbox:SetScript('OnTabPressed', function()
        if IsShiftKeyDown() then
            unit_start_price_input:SetFocus()
        else
            stack_size_slider.editbox:SetFocus()
        end
    end)
    editbox.formatter = function() return money.to_string(get_unit_buyout_price(), true) end
    editbox.char = function() set_buyout_selection(); set_unit_buyout_price(money.from_string(this:GetText())) end
    editbox.change = function() refresh = true end
    editbox.enter = function() this:ClearFocus() end
    editbox.focus_loss = function()
	    this:SetText(money.to_string(get_unit_buyout_price(), true, nil, nil, true))
    end
    do
        local label = gui.label(editbox, gui.font_size.small)
        label:SetPoint('BOTTOMLEFT', editbox, 'TOPLEFT', -2, 1)
        label:SetText(UNIT_BUYOUT_SIZE) --byLICHERY
    end
    do
        local label = gui.label(editbox, 14)
        label:SetPoint('LEFT', editbox, 'RIGHT', 8, 0)
        label:SetWidth(50)
        label:SetJustifyH('CENTER')
        buyout_price_percentage = label
    end
    unit_buyout_price_input = editbox
end
do
	local label = gui.label(frame.parameters, gui.font_size.medium)
	label:SetPoint('TOPLEFT', unit_buyout_price_input, 'BOTTOMLEFT', 0, -24)
	deposit = label
end

function aux.handle.LOAD()
	if not aux_post_bid then
		frame.bid_listing:Hide()
		frame.buyout_listing:SetPoint('BOTTOMLEFT', frame.inventory, 'BOTTOMRIGHT', 2.5, 0)
		buyout_listing:SetColInfo{
			{name=AUCTIONS_1, width=.15, align='CENTER'}, --byLICHERY
			{name=TIME_LEFT, width=.15, align='CENTER'}, --byLICHERY
			{name=STACK_SIZE, width=.15, align='CENTER'}, --byLICHERY
			{name=AUCTION_BUYOUT, width=.4, align='RIGHT'}, --byLICHERY
			{name=HIST_VALUE, width=.15, align='CENTER'}, --byLICHERY
		}
	end
end