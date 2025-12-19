--[[
    Short and simple BodyLocations modifications for Group "Human", to shove your entry wherever you want, without overwriting the original file.
    Example Usage:

    local BodyLocationsTweaker = require("BodyLocationsTweaker"); -- will set local variable to BodyLocationsTweaker!
    BodyLocationsTweaker:moveOrCreateBefore("Face_Tattoo", "Bandage"); -- Argument 1 the item you want to create or move, argument 2 the item you want to move it to
    BodyLocationsTweaker:moveOrCreateAfter("Back_Tattoo","Face_Tattoo"); -- Same as before with the arguments, just that we shove ours right after the one in argument 2
    BodyLocationsTweaker:moveOrCreateBeforeOrAfter("UpperBody_Tattoo", "Back_Tattoo", true); -- 3rd argument on this call is a boolean, true for after, false for before.

    -- those functions also return the created BodyLocation.
    -- I do hope this provides some sort of relief in terms of incompatibilities and the overwriting of base files.
    -- did only quickly test, so on issues, please let me know.
--]]

-- To avoid conflicts, you should move or handle the data in a different way than to overwrite this file!
require "NPCs/BodyLocations" -- we require it to ensure it runs first. Should not cause incompatibility due to removal of entries.

---@param obj any
---@param int number
---@return Field
local function customGetVal(obj, int) return getClassFieldVal(obj, getClassField(obj, int)); end

local BodyLocationsTweaker = {}; -- please see in comment above on how you can access it.


BodyLocationsTweaker.group = BodyLocations.getGroup("Human"); -- we can directly access the group by this.
BodyLocationsTweaker.list = customGetVal(BodyLocationsTweaker.group, 1); -- the list object, which does not contain a get method.
function BodyLocationsTweaker:unsetExclusive(loc1, loc2) -- will remove exclusive from each other
    local item1 = self.group:getLocation(loc1);
    local item2 = self.group:getLocation(loc2);
    if item1 ~= nil and item2 ~= nil then
        local exclusives1 = customGetVal(item1, 3);
        exclusives1:remove(loc2);
        local exclusives2 = customGetVal(item2, 3);
        exclusives2:remove(loc1);
    end
    return item1;
end

function BodyLocationsTweaker:unhideModel(loc1, loc2) -- remove loc2 from loc1's hidemodel list
    local item1 = self.group:getLocation(loc1);
    local item2 = self.group:getLocation(loc2);
    if item1 ~= nil and item2 ~= nil then
        local hidemodels = customGetVal(item1, 4);
        hidemodels:remove(loc2);
    end
    return item1;
end

-- We return it instead of it being a global variable.
-- Ensure you get it via require (returns whatever the file itself returns)
return BodyLocationsTweaker
