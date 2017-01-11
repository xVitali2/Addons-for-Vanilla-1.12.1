

    local t = {STANDARD_TEXT_FONT, 26, 'OUTLINE'}

    for _, v in pairs({
        ZoneTextString,
        SubZoneTextString,
        PVPInfoTextString,
        WorldMapFrameAreaLabel,
        WorldMapFrameAreaDescription, }) do
        v:SetFont(t[1], t[2], t[3])
        v:SetShadowOffset(0, -0)
    end

    --
