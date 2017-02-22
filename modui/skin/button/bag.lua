

    local orig = {}

    modSkin(MainMenuBarBackpackButton, 22)
    modSkinPadding(MainMenuBarBackpackButton, 2)
    modSkinColor(MainMenuBarBackpackButton, .2, .2, .2)

    for i = 0, 3 do
        local bu = _G['CharacterBag'..i..'Slot']
        modSkin(bu, 18)
        modSkinPadding(bu, 2)
        modSkinColor(bu, .2, .2, .2)
    end

    for i = 1,12 do                    -- BAG
        for k = 1, MAX_CONTAINER_ITEMS do
            local bu = _G['ContainerFrame'..i..'Item'..k]
            local cd = _G['ContainerFrame'..i..'Item'..k..'Cooldown']
            modSkin(bu, 18)
            modSkinPadding(bu, 2)
            modSkinColor(bu, .2, .2, .2)
            cd:SetFrameLevel(bu:GetFrameLevel() + 1) cd:SetFrameStrata'HIGH'
        end
    end

    local modBag = function()
        for i = 1, 12 do
            local f = _G['ContainerFrame'..i]
            local id = f:GetID()
            local name = f:GetName()
            for i = 1, MAX_CONTAINER_ITEMS do
                local bu = _G[name..'Item'..i]
                local link = GetContainerItemLink(id, bu:GetID())
                modSkinColor(bu, .2, .2, .2)
                if bu and bu:IsShown() and link then
                    local _, _, istring         = string.find(link, '|H(.+)|h')
                    local n, _, q, _, _, type   = GetItemInfo(istring)
                    if n and strfind(n, 'Mark of Honor') then
                        modSkinColor(bu, .98, .95, .0)
                    elseif  type == 'Quest' then
                        modSkinColor(bu, 1, .33, .0)
                    elseif q and q > 1 then
                    	local r, g, b = GetItemQualityColor(q)
                    	modSkinColor(bu, r, g, b)
                    end
                end
            end
        end
    end

    local cF = CreateFrame'Frame'
    cF:SetParent(ContainerFrame1)
    cF:SetScript('OnEvent', modBag)
    cF:RegisterEvent'BAG_UPDATE'
    orig.ContainerFrame_OnShow = ContainerFrame_OnShow
    orig.ContainerFrame_OnHide = ContainerFrame_OnHide
    function ContainerFrame_OnShow() modBag() orig.ContainerFrame_OnShow() end
    function ContainerFrame_OnHide() modBag() orig.ContainerFrame_OnHide() end

    --
