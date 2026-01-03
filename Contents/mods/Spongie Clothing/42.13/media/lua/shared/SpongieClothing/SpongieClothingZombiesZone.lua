
local defs = {
    ["Default"] = {
        {name="SpongieWinterGuy",chance=0.05,},
        {name = "SpongiePoliceArmored", chance=0.05},
        {name = "SpongieDenim", chance=4},
        {name = "SpongieGothChick", gender="female", chance=1},
        {name = "SpongieCoat", chance=2},
    },
    ["Bar"] = {
        {name = "SpongieWinterGuy", chance=1,},
        {name = "SpongieBikerChick", chance=2},
    },
    ["Police"] = {
        {name="SpongiePoliceArmored",chance=10,},
    },
    ["StreetPoor"] = {
        {name="SpongieBikerChick",chance=1,},
    },
    ["Rocker"] = {
        {name="SpongieBikerChick",chance=2,},
    },
    ["Rich"] = {
        {name="SpongieCoat",chance=5,},
    },
    ["School"] = {
        {name = "SpongieGothChick", gender="female", chance=1},
    },
}

for defName, list in pairs(defs) do
    for i, outfit in ipairs(list) do
        ZombiesZoneDefinition[defName][outfit.name] = outfit
        -- table.insert(ZombiesZoneDefinition[defName],outfit)
    end
end
defs = nil
