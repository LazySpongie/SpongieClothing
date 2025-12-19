
local function TransferVisual(item, newItem)
	local visual = item:getVisual()
	local newVisual = newItem:getVisual()
	newVisual:setTint(visual:getTint(item:getClothingItem()))
	newVisual:setBaseTexture(visual:getBaseTexture())
	newVisual:setTextureChoice(visual:getTextureChoice())
	newVisual:setDecal(visual:getDecal(item:getClothingItem()))
	if newItem:IsInventoryContainer() and item:IsInventoryContainer() then
		newItem:getItemContainer():setItems(item:getItemContainer():getItems())
		-- Handle renamed bag
		if item:getName() ~= item:getScriptItem():getDisplayName() then
			newItem:setName(item:getName())
		end
	end
--    newItem:setDirtyness(item:getDirtyness())
--    newItem:setTexture(item:getTexture())
	newItem:setColor(item:getColor())
	newVisual:copyDirt(visual)
	newVisual:copyBlood(visual)
	newVisual:copyHoles(visual)
	newVisual:copyPatches(visual)
	if newItem:IsClothing() then
		item:copyPatchesTo(newItem)
		newItem:setWetness(item:getWetness())
	end
	if instanceof(newItem, "AlarmClockClothing") and instanceof(item, "AlarmClockClothing") then
		newItem:setAlarmSet(item:isAlarmSet())
		newItem:setHour(item:getHour())
		newItem:setMinute(item:getMinute())
		newItem:syncAlarmClock()
		-- Network stuff
		-- FIXME: is this done when dropping the watch?
		item:setAlarmSet(false)
		item:syncAlarmClock()
	end
	newItem:setCondition(item:getCondition())
	newItem:setFavorite(item:isFavorite())
	if item:hasModData() then
		newItem:copyModData(item:getModData())
	end
	newItem:synchWithVisual()
end


---@param craftRecipeData CraftRecipeData
---@param player IsoPlayer
function Recipe.OnCreate.InheritClothing(craftRecipeData, character)
    local oldItem = craftRecipeData:getAllInputItemsWithFlag("CopyClothing"):get(0)
	if not oldItem:IsClothing() return end
	
	local outputs = craftRecipeData:getAllCreatedItems()
	for i = 0, outputs.size() - 1 do
		local item = outputs.get(i)
		if item:IsClothing() then
			TransferVisual(oldItem, item);
		end
	end
end
