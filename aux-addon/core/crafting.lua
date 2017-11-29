module 'aux.core.crafting'

local T = require 'T'
local aux = require 'aux'
local info = require 'aux.util.info'
local money = require 'aux.util.money'
local history = require 'aux.core.history'
local search_tab = require 'aux.tabs.search'

function aux.handle.LOAD()
    aux.event_listener('ADDON_LOADED', function()
        if arg1 == 'Blizzard_CraftUI' then
            craft_ui_loaded()
        elseif arg1 == 'Blizzard_TradeSkillUI' then
            trade_skill_ui_loaded()
        end
    end)
end

do
    local function cost_label(cost)
        local label = LIGHTYELLOW_FONT_COLOR_CODE .. TOTALCOST .. FONT_COLOR_CODE_CLOSE --byCFM
        label = label .. (cost and money.to_string2(cost, nil, LIGHTYELLOW_FONT_COLOR_CODE) or GRAY_FONT_COLOR_CODE .. '?' .. FONT_COLOR_CODE_CLOSE)
        label = label .. LIGHTYELLOW_FONT_COLOR_CODE .. ')' .. FONT_COLOR_CODE_CLOSE
        return label
    end
    local function hook_quest_item(f)
        f:SetScript('OnMouseUp', function()
            if arg1 == 'RightButton' then
                if aux.get_tab() then
                    aux.set_tab(1)
					local itemname=_G[this:GetName() .. 'Name']:GetText() --byCFM
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
						search_tab.set_filter(itemname .. '/exact') --byCFM
					end --byCFM
                    search_tab.execute(nil, false)
                end
            end
        end)
    end
    function craft_ui_loaded()
        aux.hook('CraftFrame_SetSelection', T.vararg-function(arg)
            local ret = T.temp-T.list(aux.orig.CraftFrame_SetSelection(unpack(arg)))
            local id = GetCraftSelectionIndex()
            local total_cost = 0
            for i = 1, GetCraftNumReagents(id) do
                local link = GetCraftReagentItemLink(id, i)
                if not link then
                    total_cost = nil
                    break
                end
                local item_id, suffix_id = info.parse_link(link)
                local count = aux.select(3, GetCraftReagentInfo(id, i))
                local _, price, limited = info.merchant_info(item_id)
                local value = price and not limited and price or history.value(item_id .. ':' .. suffix_id)
                if not value then
                    total_cost = nil
                    break
                else
                    total_cost = total_cost + value * count
                end
            end
            CraftReagentLabel:SetText(SPELL_REAGENTS .. ' ' .. cost_label(total_cost))
            return unpack(ret)
        end)
        for i = 1, 8 do
            hook_quest_item(_G['CraftReagent' .. i])
        end
    end
    function trade_skill_ui_loaded()
        aux.hook('TradeSkillFrame_SetSelection', T.vararg-function(arg)
            local ret = T.temp-T.list(aux.orig.TradeSkillFrame_SetSelection(unpack(arg)))
            local id = GetTradeSkillSelectionIndex()
            local total_cost = 0
            for i = 1, GetTradeSkillNumReagents(id) do
                local link = GetTradeSkillReagentItemLink(id, i)
                if not link then
                    total_cost = nil
                    break
                end
                local item_id, suffix_id = info.parse_link(link)
                local count = aux.select(3, GetTradeSkillReagentInfo(id, i))
                local _, price, limited = info.merchant_info(item_id)
                local value = price and not limited and price or history.value(item_id .. ':' .. suffix_id)
                if not value then
                    total_cost = nil
                    break
                else
                    total_cost = total_cost + value * count
                end
            end
            TradeSkillReagentLabel:SetText(SPELL_REAGENTS .. ' ' .. cost_label(total_cost))
            return unpack(ret)
        end)
        for i = 1, 8 do
            hook_quest_item(_G['TradeSkillReagent' .. i])
        end
    end
end