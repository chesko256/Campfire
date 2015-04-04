scriptname FrostUtil hidden

_Frost_ClothingSystem function GetClothingSystem() global
    Quest delete_me = none
    return (delete_me as _Frost_ClothingSystem)
endFunction

bool function IsWarmEnoughToRemoveGearInTent() global
    return true
endFunction

bool function IsWarmEnoughToHarvestWood() global
    ; Responsible for displaying error, if too cold.
    return true
endFunction

function Event_LegacyWoodHarvest() global
    ;pass
endFunction