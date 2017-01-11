

    local f = CreateFrame'Frame'
    f:RegisterEvent'ADDON_LOADED'
    f:SetScript('OnEvent', function()
        if arg1 == 'Blizzard_TradeSkillUI' then
            local bu = _G['TradeSkillSkillIcon']

            _G['TradeSkillDetailHeaderLeft']:Hide()

            if bu then
                modSkin(bu, 16)
                modSkinPadding(bu, 2)
                modSkinColor(bu, .2, .2, .2)
            end

            for i = 1, MAX_TRADE_SKILL_REAGENTS do
                local r  = _G['TradeSkillReagent'..i]
	            local ri = _G['TradeSkillReagent'..i..'IconTexture']
                local rc = _G['TradeSkillReagent'..i..'Count']

                if r then
                    if not ri.f then -- new frame for us to reparent to
				        ri.f = CreateFrame('Frame', nil, r)
				        ri.f:SetFrameLevel(r:GetFrameLevel() + 1)
				        ri.f:SetPoint('TOPLEFT', ri)
				        ri.f:SetPoint('BOTTOMRIGHT', ri)
                        ri.f:EnableMouse(false)
                        modSkin(ri.f, 16)
                        modSkinPadding(ri.f, 2)
                        modSkinColor(ri.f, .2, .2, .2)
			        end

                    ri:SetParent(ri.f)
                    ri:SetPoint('TOPLEFT', r, 1, -1)
                    ri:SetPoint('BOTTOMRIGHT', r, -107, 1)
                    ri:SetDrawLayer'ARTWORK'

                    rc:SetParent(ri.f)
                    rc:SetDrawLayer'OVERLAY'
                end
            end
        elseif arg1 == 'Blizzard_CraftUI' then
            local bu = _G['CraftIcon']

            _G['CraftDetailHeaderLeft']:Hide()

            if bu then
                modSkin(bu, 16)
                modSkinPadding(bu, 2)
                modSkinColor(bu, .2, .2, .2)
            end

            for i = 1, MAX_CRAFT_REAGENTS do
                local r  = _G['CraftReagent'..i]
	            local ri = _G['CraftReagent'..i..'IconTexture']
                local rc = _G['CraftReagent'..i..'Count']

                if r then
                    if not ri.f then -- new frame for us to reparent to
				        ri.f = CreateFrame('Frame', nil, r)
				        ri.f:SetFrameLevel(r:GetFrameLevel() + 1)
				        ri.f:SetPoint('TOPLEFT', ri)
				        ri.f:SetPoint('BOTTOMRIGHT', ri)
                        ri.f:EnableMouse(false)
                        modSkin(ri.f, 16)
                        modSkinPadding(ri.f, 2)
                        modSkinColor(ri.f, .2, .2, .2)
			        end

                    ri:SetParent(ri.f)
                    ri:SetPoint('TOPLEFT', r, 1, -1)
                    ri:SetPoint('BOTTOMRIGHT', r, -107, 1)
                    ri:SetDrawLayer'ARTWORK'

                    rc:SetParent(ri.f)
                    rc:SetDrawLayer'OVERLAY'
                end
            end
        end
    end)

    --
