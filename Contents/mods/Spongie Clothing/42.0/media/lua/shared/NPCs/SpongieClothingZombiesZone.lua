require 'NPCs/ZombiesZoneDefinition'


table.insert(ZombiesZoneDefinition.Default,{name="SpongieWinterGuy",chance=0.05,});
table.insert(ZombiesZoneDefinition.Bar,{name="SpongieWinterGuy",chance=1,});


--SpongiePoliceArmored
table.insert(ZombiesZoneDefinition.Police,{name="SpongiePoliceArmored",chance=10,});
table.insert(ZombiesZoneDefinition.Default,{name = "SpongiePoliceArmored", chance=0.2});


--SpongieBikerChick
table.insert(ZombiesZoneDefinition.StreetPoor,{name="SpongieBikerChick",chance=1,});
table.insert(ZombiesZoneDefinition.Rocker,{name="SpongieBikerChick",chance=2,});
table.insert(ZombiesZoneDefinition.Default,{name = "SpongieBikerChick", chance=1});
table.insert(ZombiesZoneDefinition.Bar,{name = "SpongieBikerChick", chance=2});


--SpongieDenim
table.insert(ZombiesZoneDefinition.Rocker,{name="SpongieDenim",chance=10,});
table.insert(ZombiesZoneDefinition.Default,{name = "SpongieDenim", chance=4});

--SpongieGothChick
table.insert(ZombiesZoneDefinition.Default,{name = "SpongieGothChick", gender="female", chance=1});
table.insert(ZombiesZoneDefinition.School,{name = "SpongieGothChick", gender="female", chance=1});

--SpongieCoat
table.insert(ZombiesZoneDefinition.Rich,{name="SpongieCoat",chance=5,});
table.insert(ZombiesZoneDefinition.Default,{name = "SpongieCoat", chance=2});