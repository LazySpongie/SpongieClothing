
local defs = {
    ["Default"] = {
        {name="SpongieWinterGuy",chance=0.1,},
        {name = "SpongieDenim", chance=3},
        {name = "SpongieGothChick", gender="female", chance=0.1},
        {name = "SpongieCoat", chance=1},
    },
    ["Bar"] = {
        {name = "SpongieWinterGuy", chance=5,},
        {name = "SpongieBikerChick", chance=5},
    },
    ["Police"] = {
        {name="SpongiePoliceArmored",chance=10,},
    },
    ["StreetPoor"] = {
        {name="SpongieBikerChick",chance=1,},
    },
    ["Rocker"] = {
        {name="SpongieBikerChick",chance=5,},
    },
    ["Rich"] = {
        {name="SpongieCoat",chance=5,},
    },
    ["School"] = {
        {name = "SpongieGothChick", gender="female", chance=1},
    },
}

local table_insert = table.insert
for defName, list in pairs(defs) do
    local isDefault = defName == "Default"
    for i, outfit in ipairs(list) do
        if isDefault then
            table_insert(ZombiesZoneDefinition[defName],outfit)
        else
            ZombiesZoneDefinition[defName][outfit.name] = outfit
        end
    end
end
defs = nil
