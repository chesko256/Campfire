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
    int i = 20
    while unequip_lock == true && i > 0
        utility.wait(0.1)
        i -= 1
    endWhile
    FrostDebug(1, "ObjectEquipped " + akBaseObject + ", " + iGearType)

    Armor armor_object = akBaseObject as Armor
    _Frost_ArmorProtectionDatastoreHandler DSHandler = GetClothingDatastoreHandler()
    int[] protection_data

    if iGearType == 1
        equipped_body = armor_object
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType)
        body_exposure_protection = protection_data[0]
        body_rain_protection = protection_data[1]
    elseif iGearType == 2
        equipped_hands = armor_object
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType)
        hands_exposure_protection = protection_data[0]
        hands_rain_protection = protection_data[1]
    elseif iGearType == 3
        equipped_head = armor_object
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType)
        head_exposure_protection = protection_data[0]
        head_rain_protection = protection_data[1]
    elseif iGearType == 4
        equipped_feet = armor_object
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType)
        feet_exposure_protection = protection_data[0]
        feet_rain_protection = protection_data[1]
    elseif iGearType == 7
        bool is_cloak = IsCloak(armor_object)
        if is_cloak
            equipped_cloak = armor_object
            protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType)
            cloak_exposure_protection = protection_data[0]
            cloak_rain_protection = protection_data[1]
        endif
    endif

    FrostDebug(0, "Armor protection report: ")
    FrostDebug(0, "BODY: " + body_exposure_protection + ", " + body_rain_protection)
    FrostDebug(0, "HANDS: " + hands_exposure_protection + ", " + hands_rain_protection)
    FrostDebug(0, "HEAD: " + head_exposure_protection + ", " + head_rain_protection)
    FrostDebug(0, "FEET: " + feet_exposure_protection + ", " + feet_rain_protection)
    FrostDebug(0, "CLOAK: " + cloak_exposure_protection + ", " + cloak_rain_protection)
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
    FrostDebug(1, "ObjectUnequipped " + akBaseObject + ", " + iGearType)
    
    Armor armor_object = akBaseObject as Armor

    if iGearType == 1
        if equipped_body == armor_object
            equipped_body = None
            body_exposure_protection = 0
            body_rain_protection = 0
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

    unequip_lock = false

    FrostDebug(0, "Armor protection report: ")
    FrostDebug(0, "BODY: " + body_exposure_protection + ", " + body_rain_protection)
    FrostDebug(0, "HANDS: " + hands_exposure_protection + ", " + hands_rain_protection)
    FrostDebug(0, "HEAD: " + head_exposure_protection + ", " + head_rain_protection)
    FrostDebug(0, "FEET: " + feet_exposure_protection + ", " + feet_rain_protection)
    FrostDebug(0, "CLOAK: " + cloak_exposure_protection + ", " + cloak_rain_protection)
endFunction

bool function IsCloak(Armor akBaseObject)
    return false
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