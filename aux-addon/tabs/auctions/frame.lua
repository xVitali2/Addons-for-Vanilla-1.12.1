module 'aux.tabs.auctions'

local info = require 'aux.util.info'
local gui = require 'aux.gui'
local auction_listing = require 'aux.gui.auction_listing'
local search_tab = require 'aux.tabs.search'

frame = CreateFrame('Frame', nil, AuxFrame)
frame:SetAllPoints()
frame:SetScript('OnUpdate', on_update)
frame:Hide()

frame.listing = gui.panel(frame)
frame.listing:SetPoint('TOP', frame, 'TOP', 0, -8)
frame.listing:SetPoint('BOTTOMLEFT', AuxFrame.content, 'BOTTOMLEFT', 0, 0)
frame.listing:SetPoint('BOTTOMRIGHT', AuxFrame.content, 'BOTTOMRIGHT', 0, 0)

listing = auction_listing.new(frame.listing, 20, auction_listing.auctions_columns)
listing:SetSort(1, 2, 3, 4, 5, 6, 7, 8)
listing:Reset()
listing:SetHandler('OnClick', function(row, button)
	if IsAltKeyDown() then
		if listing:GetSelection().record == row.record then
			if IsAltKeyDown() and listing:GetSelection().record == row.record then
				cancel_button:Click()
			end
		end
	elseif button == 'RightButton' then
		set_tab(1)
		local itemname=info.item(this.record.item_id).name --byCFM
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
end)
listing:SetHandler('OnSelectionChanged', function(rt, datum)
    if not datum then return end
    find_auction(datum.record)
end)

do
	status_bar = gui.status_bar(frame)
    status_bar:SetWidth(265)
    status_bar:SetHeight(25)
    status_bar:SetPoint('TOPLEFT', AuxFrame.content, 'BOTTOMLEFT', 0, -6)
    status_bar:update_status(1, 1)
    status_bar:set_text('')
end
do
    local btn = gui.button(frame)
    btn:SetPoint('TOPLEFT', status_bar, 'TOPRIGHT', 5, 0)
    btn:SetText(CANCEL) --byLICHERY
    btn:Disable()
    cancel_button = btn
end
do
    local btn = gui.button(frame)
    btn:SetPoint('TOPLEFT', cancel_button, 'TOPRIGHT', 5, 0)
    btn:SetText(REFRESH) --byLICHERY
	btn:SetWidth(100) --byLICHERY
    btn:SetScript('OnClick', function()
        scan_auctions()
    end)
end