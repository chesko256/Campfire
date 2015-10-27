scriptname _Frost_ClothingSystem extends _Frost_BaseSystem

import FrostUtil
import _FrostInternal

Formlist property _Frost_EquipExceptions auto

Armor property equipped_body auto hidden
Armor property equipped_head auto hidden
Armor property equipped_hands auto hidden
Armor property equipped_feet auto hidden
Armor property equipped_cloak auto hidden
Armor property equipped_shield auto hidden

int property body_warmth auto hidden
int property head_warmth auto hidden
int property hands_warmth auto hidden
int property feet_warmth auto hidden
int property cloak_warmth auto hidden

int property body_coverage auto hidden
int property head_coverage auto hidden
int property hands_coverage auto hidden
int property feet_coverage auto hidden
int property cloak_coverage auto hidden
int property shield_coverage auto hidden

bool unequip_lock = false

function RegisterForEvents()
    RegisterForModEvent("Frost_ShieldEquipped", "ShieldEquipped")
endFunction 

function RaceChanged()
    debug.trace("Got call from Campfire: RaceChanged")
endFunction


function ObjectEquipped(Form akBaseObject, int iGearType)
    ;===========
    ;Parameters
    ;===========
    ;   akBaseObject: The base object the actor just equipped.
    ;   iGearType: The type of gear the actor equipped, which is one of the following values:
    ;       1: Body gear (Armor, clothing)
    ;       2: Hands gear (Gauntlets, gloves)
    ;       3: Head gear (Helmet, hat, hoods)
    ;       4: Foot gear (Boots, shoes)
    ;       5: Backpack
    ;       6: Ammo
    ;       7: Other (could be shield, cloak, etc)
    
    HandleEquippedObject(akBaseObject, iGearType)

    SendEvent_UpdateWarmthAndCoverage()
    FrostDebug(0, "Armor protection report: BODY(" + body_warmth + ", " + body_coverage +       \
                                            ") HANDS(" + hands_warmth + ", " + hands_coverage + \
                                            ") HEAD(" + head_warmth + ", " + head_coverage +    \
                                            ") FEET(" + feet_warmth + ", " + feet_coverage +    \
                                            ") CLOAK(" + cloak_warmth + ", " + cloak_coverage +")")
endFunction

function HandleEquippedObject(Form akBaseObject, int iGearType)
    int i = 20
    while unequip_lock == true && i > 0
        utility.wait(0.2)
        i -= 1
    endWhile

    Armor armor_object = akBaseObject as Armor
    _Frost_ArmorProtectionDatastoreHandler DSHandler = GetClothingDatastoreHandler()
    int[] protection_data

    if iGearType == 1
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType, aiMode = 1)
        equipped_body = armor_object
        body_warmth = protection_data[0]
        body_coverage = protection_data[1]
        if protection_data[2] != -1
            equipped_hands = armor_object
            hands_warmth = protection_data[2]
            hands_coverage = protection_data[3]
        endif
        if protection_data[4] != -1
            equipped_head = armor_object
            head_warmth = protection_data[4]
            head_coverage = protection_data[5]
        endif
        if protection_data[6] != -1
            equipped_feet = armor_object
            feet_warmth = protection_data[6]
            feet_coverage = protection_data[7]
        endif
        if protection_data[8] != -1
            equipped_cloak = armor_object
            cloak_warmth = protection_data[8]
            cloak_coverage = protection_data[9]
        endif
    elseif iGearType == 2
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType)
        equipped_hands = armor_object
        hands_warmth = protection_data[0]
        hands_coverage = protection_data[1]
    elseif iGearType == 3
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType, aiMode = 2)
        equipped_head = armor_object
        head_warmth = protection_data[0]
        head_coverage = protection_data[1]
        if protection_data[2] != -1
            equipped_cloak = armor_object
            cloak_warmth = protection_data[2]
            cloak_coverage = protection_data[3]
        endif
    elseif iGearType == 4
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType)
        equipped_feet = armor_object
        feet_warmth = protection_data[0]
        feet_coverage = protection_data[1]
    elseif iGearType == 7
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType)
        if protection_data[0] != -1
            equipped_cloak = armor_object
            cloak_warmth = protection_data[0]
            cloak_coverage = protection_data[1]
        endif
    endif
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
    unequip_lock = true
    HandleUnequippedObject(akBaseObject, iGearType)
    unequip_lock = false

    SendEvent_UpdateWarmthAndCoverage()
    FrostDebug(0, "Armor protection report: BODY(" + body_warmth + ", " + body_coverage +       \
                                            ") HANDS(" + hands_warmth + ", " + hands_coverage + \
                                            ") HEAD(" + head_warmth + ", " + head_coverage +    \
                                            ") FEET(" + feet_warmth + ", " + feet_coverage +    \
                                            ") CLOAK(" + cloak_warmth + ", " + cloak_coverage +")")
endFunction

function HandleUnequippedObject(Form akBaseObject, int iGearType)
    Armor armor_object = akBaseObject as Armor

    if iGearType == 1
        if equipped_body == armor_object
            equipped_body = None
            body_warmth = 0
            body_coverage = 0
            ; Is this a multi-part gear set?
            HandleUnequippedObject(akBaseObject, 2)
            HandleUnequippedObject(akBaseObject, 3)
            HandleUnequippedObject(akBaseObject, 4)
            HandleUnequippedObject(akBaseObject, 7)
        endif
    elseif iGearType == 2
        if equipped_hands == armor_object
            equipped_hands = None
            hands_warmth = 0
            hands_coverage = 0
        endif
    elseif iGearType == 3
        if equipped_head == armor_object
            equipped_head = None
            head_warmth = 0
            head_coverage = 0
        endif
    elseif iGearType == 4
        if equipped_feet == armor_object
            equipped_feet = None
            feet_warmth = 0
            feet_coverage = 0
        endif
    elseif iGearType == 7
        if equipped_cloak == armor_object
            equipped_cloak = None
            cloak_warmth = 0
            cloak_coverage = 0
        endif
    endif
endFunction

Event ShieldEquipped(Form akBaseObject, bool abEquipped)
    if abEquipped

    else

    endif
endEvent

int function GetArmorWarmth()
    int total = body_warmth + hands_warmth + \
                head_warmth + feet_warmth + \
                cloak_warmth
    return total
endFunction

int function GetArmorCoverage()
    int total = body_coverage + hands_coverage + \
                head_coverage + feet_coverage + \
                cloak_coverage
    return total
endFunction


function SendEvent_UpdateWarmthAndCoverage()
    FrostDebug(0, "Sending event Frost_UpdateWarmth")
    int handle = ModEvent.Create("Frost_UpdateWarmth")
    if handle
        ModEvent.Send(handle)
    endif
    FrostDebug(0, "Sending event Frost_UpdateCoverage")
    handle = ModEvent.Create("Frost_UpdateCoverage")
    if handle
        ModEvent.Send(handle)
    endif
endFunction