
--here i do all the open jackets stuff through code because i cant be bothered to do it manually

local function Adjust(Name, Property, Value)
    local Item = ScriptManager.instance:getItem(Name)
    if Item then
        Item:DoParam(Property.." = " .. Value)
    end
end

local function AdjustClothingOption(Name, ClothingItemExtra, ClothingItemExtraOption)
	Adjust(Name, "ClothingItemExtra", ClothingItemExtra)
	Adjust(Name, "ClothingItemExtraOption", ClothingItemExtraOption)
	Adjust(Name, "clothingExtraSubmenu", "Wear");
end


local ClothingDataToChange = {};

local function SpongieClothingAdjustAllClothingData()
	for k, v in pairs(ClothingDataToChange) do
		AdjustClothingOption(k, v.ClothingItemExtra, v.ClothingItemExtraOption)
	end
end
Events.OnGameBoot.Add(SpongieClothingAdjustAllClothingData)


local function AddToClothingData(item, item2, contextMenu)
	if ClothingDataToChange[item] == nil then ClothingDataToChange[item] = {ClothingItemExtra = "", ClothingItemExtraOption = ""} end	--add the item to the table if it isnt already there
	
	--add the new clothing item
	local tempString = ""	--create a blank string so that ; can be added before the item name if needed
	if ClothingDataToChange[item].ClothingItemExtra ~= "" then
		tempString = ClothingDataToChange[item].ClothingItemExtra..";"	--if there is already a clothingextraitem then they must be separated by a ;	have to do all this because having ; at the start or end of the parameter will cause errors (i think?)
	end
	tempString = tempString..item2 --if there was already a table entry then the item name will be added onto the ; like ";Jacket_White", otherwise it will just be "Jacket_White"
	ClothingDataToChange[item].ClothingItemExtra = tempString
	
	--add the context menu
	tempString = ""
	if ClothingDataToChange[item].ClothingItemExtraOption ~= "" then
		tempString = ClothingDataToChange[item].ClothingItemExtraOption..";"
	end
	tempString = tempString..contextMenu
	ClothingDataToChange[item].ClothingItemExtraOption = tempString
	
end



--Automates the adding of two way items (Jacket_White <----> Jacket_WhiteOPEN)
local function AddNewExtraItem(originalItemName, newItemName, originalContextMenu, newContextMenu, resistanceModifier)
	local originalItem = ScriptManager.instance:getItem(originalItemName);
	local newItem = ScriptManager.instance:getItem(newItemName);
	if ((not originalItem) or (not newItem)) then return end;
	
	AddToClothingData(originalItemName, newItemName, newContextMenu)
	AddToClothingData(newItemName, originalItemName, originalContextMenu)
	
	
	if resistanceModifier then 
		-- modify resistance
		newItem:DoParam("Insulation = "..(originalItem:getInsulation()*resistanceModifier))
		newItem:DoParam("WindResistance = "..(originalItem:getWindresist()*resistanceModifier))
		newItem:DoParam("WaterResistance = "..(originalItem:getWaterresist()*resistanceModifier))
	end;
end

local function AddOpenJacketOrShirt(jacket)
	local jacketOPEN = jacket .. "OPEN";
	
	AddNewExtraItem(jacket, jacketOPEN, "CloseJacket", "OpenJacket",  0.75);
end

local function AddTuckedPants(pants)
	local pantsTUCK = pants .. "TUCK";
	
	AddNewExtraItem(pants, pantsTUCK, "TuckOut", "TuckIn",  1);
end

local function AddRolledAndTiedSweater(sweater)
	local sweaterROLL = sweater .. "ROLL";
	local sweaterTIED = sweater .. "TIED";
	
	AddNewExtraItem(sweater, sweaterROLL, "RollDown", "RollUp",  1);
	
	AddToClothingData(sweater, sweaterTIED, "TieOnWaist")
	AddToClothingData(sweaterROLL, sweaterTIED, "TieOnWaist")
	
	AddToClothingData(sweaterTIED, sweater, "Wear")
end

--Open and rolled shirt
local function AddOpenAndRolledShirt(shirt)
	local shirtROLL = shirt .. "ROLL";
	local shirtOPEN = shirt .. "OPEN";
	local shirtOPENROLL = shirt .. "OPENROLL";
	
	--open should be first in list for consistency
	AddNewExtraItem(shirt, shirtOPEN, "CloseJacket", "OpenJacket", 0.75);
	AddNewExtraItem(shirtROLL, shirtOPENROLL, "CloseJacket", "OpenJacket", 1);
	
	AddNewExtraItem(shirt, shirtROLL, "RollDown", "RollUp", 1);
	AddNewExtraItem(shirtOPEN, shirtOPENROLL, "RollDown", "RollUp", 1);
	
end

AddOpenAndRolledShirt("Spongie.Jacket_Flight")
AddOpenAndRolledShirt("Spongie.Jacket_Denim")
AddOpenAndRolledShirt("Spongie.Jacket_Field")
AddOpenAndRolledShirt("Spongie.Jacket_Bomber")
AddOpenAndRolledShirt("Spongie.Jacket_Quilted")
AddOpenAndRolledShirt("Spongie.Jacket_PeaCoat")
AddOpenAndRolledShirt("Spongie.Jacket_PeaCoat2")
AddOpenAndRolledShirt("Spongie.Jacket_Tweed")


AddOpenJacketOrShirt("Spongie.Jacket_SheepWool")
AddOpenJacketOrShirt("Spongie.Jacket_Ribbed")

AddOpenJacketOrShirt("Spongie.Jacket_FlightVest")
AddOpenJacketOrShirt("Spongie.Vest_Puffy")

AddOpenAndRolledShirt("Spongie.Shirt_Quilted")

AddRolledAndTiedSweater("Spongie.Jumper_Military")

AddTuckedPants("Spongie.Trousers_Tweed")
