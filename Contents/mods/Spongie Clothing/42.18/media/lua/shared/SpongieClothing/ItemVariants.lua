
local function init()
    local OpenJackets_ItemTweaker = require("SpongieOpenJackets/OpenJackets_ItemTweaker")
    local items = {
        AddOpenAndRolledShirt = {
            "Spongie.Jacket_Denim",
            "Spongie.Jacket_Field",
            "Spongie.Jacket_Bomber",
            "Spongie.Jacket_Flight",
            "Spongie.Jacket_Quilted",
            "Spongie.Jacket_PeaCoat",
            "Spongie.Jacket_PeaCoat2",
            "Spongie.Jacket_Tweed",
            "Spongie.Shirt_Quilted",
        },
        AddOpenShirt = {
            "Spongie.Jacket_SheepWool",
            "Spongie.Jacket_Ribbed",
            "Spongie.Vest_Puffy",
            "Spongie.Jacket_FlightVest",
        },
        AddTuckedPants = {
            "Spongie.Trousers_Tweed",
        },
        AddRolledAndTiedSweater = {
            "Spongie.Jumper_Military",
        },
    }

    for methodName,itemList in pairs(items) do
        for i, item in ipairs(itemList) do
            OpenJackets_ItemTweaker[methodName](item)
        end
    end
end

init()
init = nil