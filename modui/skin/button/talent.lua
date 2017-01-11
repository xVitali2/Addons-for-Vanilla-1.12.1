

    local orig = {}

    local f = CreateFrame'Frame'
    f:RegisterEvent'ADDON_LOADED'
    f:SetScript('OnEvent', function()
        if arg1 == 'Blizzard_TalentUI' then
            orig.TalentFrame_Update = TalentFrame_Update

            for i = 1, 20 do
                local bu = _G['TalentFrameTalent'..i]
                local sl = _G['TalentFrameTalent'..i..'Slot']
                local rb = _G['TalentFrameTalent'..i..'RankBorder']
                modSkin(bu, 16)
                modSkinPadding(bu, 2)
                modSkinColor(bu, .2, .2, .2)
                sl:SetAlpha(0)
                rb:SetPoint('TOP', bu, 'BOTTOM', 0, 8)
            end

            function TalentFrame_Update()
                orig.TalentFrame_Update()
                for i = 1, 20 do
                    local bu = _G['TalentFrameTalent'..i]
                    local sl = _G['TalentFrameTalent'..i..'Slot']
                    local r, g, b = sl:GetVertexColor()
                    if  decimal_round(r, 1) ~= .5 then
                        modSkinColor(bu, r, g, b)
                    else
                        modSkinColor(bu, .2, .2, .2)
                    end
                end
            end
        end
    end)

    --
