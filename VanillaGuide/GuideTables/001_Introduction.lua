--[[--------------------------------------------------
001-Introduction.lua
Authors: mrmr
Version: 1.04.2
------------------------------------------------------
Description: Guide Serie - 001 Introduction
    1.04.1
        -- First Release
            Introduction text
    1.04.2
        -- no changes in here for this revision
	1.04.3
		-- Changed to reflect the changes in color codes.
------------------------------------------------------
Connection:
--]]--------------------------------------------------

local version = GetAddOnMetadata("VanillaGuide", "Version")

Table_001_Introduction = {
    [0001] = {
        title = "Introduction",
        --ddmtype = 'v',
        --ddmlvl = '1',
        --n = "Introduction",
        --pID = 1, nID = 11,
        --itemCount = 20,
        items = {
            [1] = { str = "     Thank you for using #VIDEOVanilla#Guide!" },
            [2] = { str = "         written and mantained by #DOmrmr#." },
            [3] = { str = "         version #VIDEOv##IN" .. version .. "#" },
            [4] = { str = "  Originally created for '#VIDEOJ#oana's #VIDEOHorde# Guide', it's grown bigger," },
            [5] = { str = "with '#DOB#rianKopps` #DOAlliance# Guide' by Kira and Cdlp and Profession guides by Velenran." },
            [6] = { str = "You can find this version somewhere in the internet and if you're reading this....you know where..." },
            [7] = { str = "." },
            [8] = { str = "#VIDEODISCLAIMER:#" },
            [9] = { str = "Here are the guide color codes:" },
            [10] = { str = "#GETAccept a quest.#" },
            [11] = { str = "#DOGo do a quest.#" },
            [12] = { str = "#INTurn in a quest.#" },
			[13] = { str = "#SKIPSkip a quest.#" },			
            [14] = { str = "#NPCNPC/Mob.#" },
            [15] = { str = "#ITEMAn item or an object.#" },
            [16] = { str = "#COORDCoordinates [15,26].#" },
            [17] = { str = "." },
            [18] = { str = "#GETBINDABLE KEYS:#  There are bindable keys for the \"Prev\" and \"Next\" Steps and Guides. You can find them in the key bindings menu" },
            [19] = { str = "." },
            --[19] = { str = "." },
            --[20] = { str = "." },
        }
    },

}
