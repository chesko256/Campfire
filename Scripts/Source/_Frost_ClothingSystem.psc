scriptname _Frost_ClothingSystem extends _Frost_BaseSystem

function RaceChanged()
    debug.trace("Got call from Campfire: RaceChanged")
endFunction

function ObjectEquipped(Form akBaseObject, int iGearType)
    ;===========
    ;Parameters
    ;===========
    ;   akBaseObject: The base object the actor just unequipped.
    ;   iGearType: The type of gear the actor unequipped, which is one of the following values:
    ;       1: Body gear (Armor, clothing)
    ;       2: Hands gear (Gauntlets, gloves)
    ;       3: Head gear (Helmet, hat, hoods)
    ;       4: Foot gear (Boots, shoes)
    ;       5: Backpack
    ;       6: Ammo
    ;       7: Other (could be shield, cloak, etc)
    debug.trace("Got call from Campfire: ObjectEquipped")

endFunction

function ObjectUnequipped(Form akBaseObject, int iGearType)
    ;===========
    ;Parameters
    ;===========
    ;   akBaseObject: The base object the actor just unequipped.
    ;   iGearType: The type of gear the actor unequipped, which is one of the following values:
    ;       1: Body gear (Armor, clothing)
    ;       2: Hands gear (Gauntlets, gloves)
    ;       3: Head gear (Helmet, hat, hoods)
    ;       4: Foot gear (Boots, shoes)
    ;       5: Backpack
    ;       6: Ammo
    ;       7: Other (could be shield, cloak, etc)
    debug.trace("Got call from Campfire: ObjectUnequipped")

endFunction