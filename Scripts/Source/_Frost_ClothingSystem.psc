scriptname _Frost_ClothingSystem extends _Frost_BaseSystem

import FrostUtil
import _FrostInternal

Formlist property _Frost_EquipExceptions auto

Armor property equipped_body auto
Armor property equipped_head auto
Armor property equipped_hands auto
Armor property equipped_feet auto
Armor property equipped_cloak auto

int property body_exposure_protection auto
int property head_exposure_protection auto
int property hands_exposure_protection auto
int property feet_exposure_protection auto
int property cloak_exposure_protection auto

int property body_rain_protection auto
int property head_rain_protection auto
int property hands_rain_protection auto
int property feet_rain_protection auto
int property cloak_rain_protection auto

bool unequip_lock = false

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

    FrostDebug(0, "Armor protection report: ")
    FrostDebug(0, "BODY: " + body_exposure_protection + ", " + body_rain_protection)
    FrostDebug(0, "HANDS: " + hands_exposure_protection + ", " + hands_rain_protection)
    FrostDebug(0, "HEAD: " + head_exposure_protection + ", " + head_rain_protection)
    FrostDebug(0, "FEET: " + feet_exposure_protection + ", " + feet_rain_protection)
    FrostDebug(0, "CLOAK: " + cloak_exposure_protection + ", " + cloak_rain_protection)
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
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType, abCheckAll = true)
        equipped_body = armor_object
        body_exposure_protection = protection_data[0]
        body_rain_protection = protection_data[1]
        if protection_data[2] != -1
            equipped_hands = armor_object
            hands_exposure_protection = protection_data[2]
            hands_rain_protection = protection_data[3]
        endif
        if protection_data[4] != -1
            equipped_head = armor_object
            head_exposure_protection = protection_data[4]
            head_rain_protection = protection_data[5]
        endif
        if protection_data[6] != -1
            equipped_feet = armor_object
            feet_exposure_protection = protection_data[6]
            feet_rain_protection = protection_data[7]
        endif
        if protection_data[8] != -1
            equipped_cloak = armor_object
            cloak_exposure_protection = protection_data[8]
            cloak_rain_protection = protection_data[9]
        endif
    elseif iGearType == 2
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType)
        equipped_hands = armor_object
        hands_exposure_protection = protection_data[0]
        hands_rain_protection = protection_data[1]
    elseif iGearType == 3
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType)
        equipped_head = armor_object
        head_exposure_protection = protection_data[0]
        head_rain_protection = protection_data[1]
    elseif iGearType == 4
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType)
        equipped_feet = armor_object
        feet_exposure_protection = protection_data[0]
        feet_rain_protection = protection_data[1]
    elseif iGearType == 7
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType)
        if protection_data[0] != -1
            equipped_cloak = armor_object
            cloak_exposure_protection = protection_data[0]
            cloak_rain_protection = protection_data[1]
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

    FrostDebug(0, "Armor protection report: ")
    FrostDebug(0, "BODY: " + body_exposure_protection + ", " + body_rain_protection)
    FrostDebug(0, "HANDS: " + hands_exposure_protection + ", " + hands_rain_protection)
    FrostDebug(0, "HEAD: " + head_exposure_protection + ", " + head_rain_protection)
    FrostDebug(0, "FEET: " + feet_exposure_protection + ", " + feet_rain_protection)
    FrostDebug(0, "CLOAK: " + cloak_exposure_protection + ", " + cloak_rain_protection)
endFunction

function HandleUnequippedObject(Form akBaseObject, int iGearType)
    Armor armor_object = akBaseObject as Armor

    if iGearType == 1
        if equipped_body == armor_object
            equipped_body = None
            body_exposure_protection = 0
            body_rain_protection = 0
            ; Is this a multi-part gear set?
            HandleUnequippedObject(akBaseObject, 2)
            HandleUnequippedObject(akBaseObject, 3)
            HandleUnequippedObject(akBaseObject, 4)
            HandleUnequippedObject(akBaseObject, 7)
        endif
    elseif iGearType == 2
        if equipped_hands == armor_object
            equipped_hands = None
            hands_exposure_protection = 0
            hands_rain_protection = 0
        endif
    elseif iGearType == 3
        if equipped_head == armor_object
            equipped_head = None
            head_exposure_protection = 0
            head_rain_protection = 0
        endif
    elseif iGearType == 4
        if equipped_feet == armor_object
            equipped_feet = None
            feet_exposure_protection = 0
            feet_rain_protection = 0
        endif
    elseif iGearType == 7
        if equipped_cloak == armor_object
            equipped_cloak = None
            cloak_exposure_protection = 0
            cloak_rain_protection = 0
        endif
    endif
endFunction

int function GetArmorExposureProtection()
    int total = body_exposure_protection + hands_exposure_protection + \
                head_exposure_protection + feet_exposure_protection + \
                cloak_exposure_protection
    return total
endFunction

int function GetArmorRainProtection()
    int total = body_rain_protection + hands_rain_protection + \
                head_rain_protection + feet_rain_protection + \
                cloak_rain_protection
    return total
endFunction