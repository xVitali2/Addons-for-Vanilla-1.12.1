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
            [2] = { str = "         written and mantained by #DOQUESTmrmr#." },
            [3] = { str = "         version #VIDEOv##TURNIN" .. version .. "#" },
            [4] = { str = "  Originally created for '#VIDEOJ#oana's #VIDEOHorde# Guide', it's grown bigger," },
            [5] = { str = "with '#DOQUESTB#rianKopps` #DOQUESTAlliance# Guide' by Kira and Cdlp and Profession guides by Velenran." },
            [6] = { str = "You can find this version somewhere in the internet and if you're reading this....you know where..." },
            [7] = { str = "." },
            [8] = { str = "#VIDEODISCLAIMER:#" },
            [9] = { str = "Here are the guide color codes:" },
            [10] = { str = "#ACCEPTAccept a quest.#" },
            [11] = { str = "#DOQUESTGo do a quest.#" },
            [12] = { str = "#TURNINTurn in a quest.#" },
            [13] = { str = "#NPCGeneral mob/item.#" },
            [14] = { str = "." },
            [15] = { str = "." },
            [16] = { str = "." },
            [17] = { str = "#ACCEPTBINDABLE KEYS:#  There are bindable keys for the \"Prev\" and \"Next\" Steps and Guides. You can find them in the key bindings menu" },
            [18] = { str = "." },
            --[19] = { str = "." },
            --[20] = { str = "." },
        }
    },

}
