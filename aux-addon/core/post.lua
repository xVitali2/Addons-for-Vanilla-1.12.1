module 'aux.core.post'

local aux = require 'aux'
local info = require 'aux.util.info'
local stack = require 'aux.core.stack'
local history = require 'aux.core.history'
local disenchant = require 'aux.core.disenchant'

local state

function aux.handle.CLOSE()
	stop()
end

function process()
	if state.posted < state.count then

		local stacking_complete

		local send_signal, signal_received = aux.signal()
		aux.when(signal_received, function()
			local slot = signal_received()[1]
			if slot then
				return post_auction(slot, process)
			else
				return stop()
			end
		end)

		return stack.start(state.item_key, state.stack_size, send_signal)
	end

	return stop()
end

function post_auction(slot, k)
	local item_info = info.container_item(unpack(slot))
	if item_info.item_key == state.item_key and info.auctionable(item_info.tooltip, nil, true) and item_info.aux_quantity == state.stack_size then

		ClearCursor()
		ClickAuctionSellItemButton()
		ClearCursor()
		PickupContainerItem(unpack(slot))
		ClickAuctionSellItemButton()
		ClearCursor()
		
		local start_price = state.unit_start_price
		local buyout_price = state.unit_buyout_price
		
		--use autoprice heuristic if start bid 0 is set
		if start_price == 0 then
			
			local kz_daily = 0
			local kz_pricing = 0
			local kz_warn = 0
			local vendor_price = 0
		
			if buyout_price > 0 then
				kz_pricing=1
				start_price = buyout_price
			end
			
			if history.market_value(state.item_key) ~= nil then 
					local tmp = tonumber(history.market_value(state.item_key))
					--tmp = max(0.99*tmp,tmp-50)
					--buyout_price = max(buyout_price,tmp)
					tmp = max(1,tmp-1)
					buyout_price = max(buyout_price,tmp)
					kz_daily = 1
			end	
			
			if history.value(state.item_key) ~= nil then 
				if kz_pricing == 1 and kz_daily == 1 then
					--buyout_price = max(buyout_price,0.99*tonumber(history.value(state.item_key)))
					buyout_price = max(buyout_price,0.50*tonumber(history.value(state.item_key)))
				elseif kz_daily == 1 then
					--start_price = max(start_price,0.91*tonumber(history.value(state.item_key
					start_price = max(start_price,0.80*tonumber(history.value(state.item_key)))
				else
					--buyout_price = max(buyout_price,0.99* tonumber(history.value(state.item_key)))
					buyout_price = max(buyout_price,0.95* tonumber(history.value(state.item_key)))
				end
			else
				kz_warn = kz_warn + 1
			end
			
			if aux.account_data.merchant_buy[item_info.item_id] ~= nil then 
				local tmp = tostring(aux.account_data.merchant_buy[item_info.item_id])
				tmp = strsub(tmp,1,-3)
				start_price = max(start_price,tonumber(tmp) * 1.1)
				buyout_price = max(buyout_price,tonumber(tmp) * 1.15)
			else 
				if aux.account_data.merchant_sell[item_info.item_id] ~= nil then 
					vendor_price = tonumber(aux.account_data.merchant_sell[item_info.item_id])
				elseif ShaguTweaks and ShaguTweaks.SellValueDB[item_info.item_id] ~= nil then
					local charges = 1
					if info.max_item_charges(item_info.item_id) ~= nil then 
						charges=info.max_item_charges(item_info.item_id) 
					end
					vendor_price = ShaguTweaks.SellValueDB[item_info.item_id] / charges
				end
				if vendor_price	> 0 then
					if kz_daily == 0 then
						start_price = max(start_price, vendor_price * (1.35+3.65*math.exp(-(1/4000)* vendor_price)))
					else
						start_price = max(start_price, vendor_price * 1.35)
					end
				else
					kz_warn = kz_warn + 1
				end
			end
			
			if disenchant.value(item_info.slot, item_info.quality, item_info.level, item_info.item_id) ~= nil then 
				start_price = max(start_price,0.85* tonumber(disenchant.value(item_info.slot, item_info.quality, item_info.level, item_info.item_id)))
			end
			
			start_price = max(start_price,0.91 * buyout_price)
			buyout_price = max(start_price, buyout_price)
			
			if disenchant.value(item_info.slot, item_info.quality, item_info.level, item_info.item_id) ~= nil then 
				if buyout_price < 0.95 * tonumber(disenchant.value(item_info.slot, item_info.quality, item_info.level, item_info.item_id)) -30 then
					print("AUX: autopricing recommends disenchanting!")
					return stop()
				end
			end
			
			if kz_daily == 1 and vendor_price > 0 then 
				if tonumber(history.value(state.item_key)) < 1.35 * vendor_price 
				or tonumber(history.market_value(state.item_key)) < 1.35 * vendor_price then
					print("AUX: autopricing recommends vendoring!")
					return stop()
				end
			end
			
			if start_price == 0 or (kz_warn == 2 and kz_pricing == 0) then
				print("AUX: insufficient data for autopricing!")
				return stop()
			end
			
			local gold = floor(start_price / COPPER_PER_GOLD)
			local silver = floor(mod(start_price, COPPER_PER_GOLD) / COPPER_PER_SILVER)
			local copper = aux.round(mod(start_price, COPPER_PER_SILVER))
			
			print("bid_price: "..gold.."g "..silver.."s "..copper.."c")
			
			gold = floor(buyout_price / COPPER_PER_GOLD)
			silver = floor(mod(buyout_price, COPPER_PER_GOLD) / COPPER_PER_SILVER)
			copper = aux.round(mod(buyout_price, COPPER_PER_SILVER))
			
			print("buyout_price: "..gold.."g "..silver.."s "..copper.."c")

		end
		
		StartAuction(max(1, aux.round(start_price * item_info.aux_quantity)), aux.round(buyout_price * item_info.aux_quantity), state.duration)

		local send_signal, signal_received = aux.signal()
		aux.when(signal_received, function()
			state.posted = state.posted + 1
			return k()
		end)

		local posted
		aux.event_listener('CHAT_MSG_SYSTEM', function(kill)
			if arg1 == ERR_AUCTION_STARTED then
				send_signal()
				kill()
			end
		end)
	else
		return stop()
	end
end

function M.stop()
	if state then
		aux.kill_thread(state.thread_id)

		local callback = state.callback
		local posted = state.posted

		state = nil

		if callback then
			callback(posted)
		end
	end
end

function M.start(item_key, stack_size, duration, unit_start_price, unit_buyout_price, count, callback)
	stop()
	state = {
		thread_id = aux.thread(process),
		item_key = item_key,
		stack_size = stack_size,
		duration = duration,
		unit_start_price = unit_start_price,
		unit_buyout_price = unit_buyout_price,
		count = count,
		posted = 0,
		callback = callback,
	}
end