
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

for k,v in pairs(items) do
	OpenJackets_ItemTweaker[k](v);
end

-- for i,v in ipairs(items.AddOpenAndRolledShirt) do
-- 	items.OpenJackets_ItemTweaker.AddOpenAndRolledShirt(v);
-- end
-- for i,v in ipairs(items.AddOpenShirt) do
-- 	items.OpenJackets_ItemTweaker.AddOpenShirt(v);
-- end
-- for i,v in ipairs(items.AddTuckedPants) do
-- 	items.OpenJackets_ItemTweaker.AddTuckedPants(v);
-- end
-- for i,v in ipairs(items.AddRolledAndTiedSweater) do
-- 	items.OpenJackets_ItemTweaker.AddRolledAndTiedSweater(v);
-- end
items = nil
OpenJackets_ItemTweaker = nil