assert(BigWigs, "BigWigs not found!")
assert(BigWigsBars, "BigWigsBars not found!")


------------------------------
--      Are you local?      --
------------------------------

local candybar = AceLibrary("CandyBar-2.0")


----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsCounterBars = BigWigs:NewModule("Counter Bars")
BigWigsCounterBars.external = true

------------------------------
--      Initialization      --
------------------------------

function BigWigsCounterBars:OnEnable()
	self:RegisterEvent("BigWigs_StartCounterBar")
	self:RegisterEvent("BigWigs_StopCounterBar")
	self:RegisterEvent("BigWigs_SetCounterBar")
end


------------------------------
--      Event Handlers      --
------------------------------

function BigWigsCounterBars:BigWigs_StartCounterBar(module, text, max, bar, icon, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
	if not text then return end
	local id = "BigWigsBar "..text

	BigWigsBars:BigWigs_StartBar(module, text, max, bar, icon, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
	module:PauseCandyBar(id)
	module:SetCandyBarTimeFormat(id, function(t) return string.format("%d", t) end)
end

function BigWigsCounterBars:BigWigs_StopCounterBar(module, text)
	if not text then return end
	BigWigsBars:BigWigs_StopBar(module, text)
end


function BigWigsCounterBars:BigWigs_SetCounterBar(module, text, value)
	if (not text) or (value == nil) or (value < 0) then return end
	local id = "BigWigsBar "..text
	local bar = candybar.var.handlers[id]
	if not bar then return end
	
	if bar.time > value then
		bar.elapsed = value
		candybar:Update(id)
	else
		BigWigsBars:BigWigs_StopBar(module, text)
	end
end
