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

---@class BodyLocationsTweaker
local BodyLocationsTweaker = {}; -- please see in comment above on how you can access it.


---@type BodyLocationGroup
BodyLocationsTweaker.group = BodyLocations.getGroup("Human"); -- we can directly access the group by this.
---@type ArrayList
BodyLocationsTweaker.list = customGetVal(BodyLocationsTweaker.group, 1); -- the list object, which does not contain a get method.

---@param toRelocateOrCreate string
---@param locationElement string
---@param afterBoolean boolean
---@return BodyLocation
function BodyLocationsTweaker:moveOrCreateBeforeOrAfter(toRelocateOrCreate, locationElement, afterBoolean)
    -- Check type of arg 2 == string - if not error out.
    if type(locationElement) ~= "string" then error("Argument 2 is not of type string. Please re-check!", 2); end
    local itemToMoveTo = self.group:getLocation(locationElement); -- get location to move to
    if itemToMoveTo ~= nil then
        -- Check type of arg 1 == string - if not, error out.
        if type(toRelocateOrCreate) ~= "string" then error("Argument 1 is not of type string. Please re-check!", 2) end
        local curItem = self.group:getOrCreateLocation(toRelocateOrCreate); -- get current item - or create
        self.list:remove(curItem); -- remove from the list
        local index = self.group:indexOf(locationElement); -- get current index after removal of the location to move to
        if afterBoolean then index = index + 1; end -- if we want it after it, we increase the index to move to by one
        self.list:add(index, curItem); -- we add the item again
        return curItem;
    else -- we did not find the location to move to, so we throw an error.
        error("Could not find the BodyLocation [",locationElement,"] - please check the passed arguments!", 2);
    end
end

---@param toRelocateOrCreate string
---@param locationElement string
---@return BodyLocation
function BodyLocationsTweaker:moveOrCreateBefore(toRelocateOrCreate, locationElement) -- for simpler and clearer usage
    return self:moveOrCreateBeforeOrAfter(toRelocateOrCreate, locationElement, false);
end


---@param toRelocateOrCreate string
---@param locationElement string
---@return BodyLocation
function BodyLocationsTweaker:moveOrCreateAfter(toRelocateOrCreate, locationElement) -- for simpler and clearer usage
    return self:moveOrCreateBeforeOrAfter(toRelocateOrCreate, locationElement, true);
end

---@param loc1 string
---@param alias string
---@return BodyLocation
function BodyLocationsTweaker:removeAlias(loc1, alias) -- will remove 2nd arg (alias) from location 1
    local item = self.group:getLocation(loc1);
    if item ~= nil and type(alias) == "string" then
        local aliases = customGetVal(item, 2);
        aliases:remove(alias);
    end
    return item;
end

---@param loc1 string
---@param loc2 string
---@return BodyLocation
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

---@param loc1 string
---@param loc2 string
---@return BodyLocation
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
