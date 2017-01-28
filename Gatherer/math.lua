-- Math functions
--

function Gatherer_round(x, n)
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end


function Gatherer_rgbToFloatColor(color)
	local MAX_RGB = 255;
    local floatColor = {}
    for _, component in color do
		tinsert(floatColor, component/MAX_RGB)
	end
	return floatColor
end
