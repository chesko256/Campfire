scriptname _Frost_ClothingSystem extends _Frost_BaseSystem

import FrostUtil
import _FrostInternal
import math

Actor property PlayerRef auto
Quest property _Frost_MainQuest auto
GlobalVariable property FrostfallRunning auto
GlobalVariable property _Frost_Setting_Notifications_EquipmentValues auto
GlobalVariable property _Frost_CheckInitialEquipment auto
Quest property FrostfallStrings auto
Keyword property ActorTypeCreature auto
Keyword property ImmuneParalysis auto
Keyword property WAF_ClothingCloak auto

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
int property shield_warmth auto hidden

int property body_coverage auto hidden
int property head_coverage auto hidden
int property hands_coverage auto hidden
int property feet_coverage auto hidden
int property cloak_coverage auto hidden
int property shield_coverage auto hidden

Keyword property _Frost_DummyArmorKW auto
Armor property initial_body auto hidden
Armor property initial_head auto hidden
Armor property initial_hands auto hidden
Armor property initial_feet auto hidden
Armor property initial_shield auto hidden

bool unequip_lock = false

function RegisterForEvents()
    RegisterForModEvent("Frost_ShieldEquipped", "ShieldEquipped")
endFunction 

function RaceChanged()
    if PlayerRef.GetRace().HasKeyword(ActorTypeCreature) || PlayerRef.GetRace().HasKeyword(ImmuneParalysis)
        FrostDebug(1, "I am now a werewolf or vampire lord.")
        ModPlayerExposure(-120.0, 0.0)
        (_Frost_MainQuest as _Frost_ConditionValues).IsBeast = true
        SendEvent_UpdateWarmth()
    else
        FrostDebug(1, "I am now a werewolf or vampire lord.")
        (_Frost_MainQuest as _Frost_ConditionValues).IsBeast = false
        SendEvent_UpdateWarmth()
    endif
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
    ;       7: Other (could be cloak)
    ;       8: Shield
    
    ; Initial equipment check
    if akBaseObject.HasKeyword(_Frost_DummyArmorKW)
        return
    endif

    HandleEquippedObject(akBaseObject, iGearType)

    SendEvent_UpdateWarmthAndCoverage()
    DisplayWarmthCoverageNoSkyUIPkg(akBaseObject as Armor, iGearType)

    FrostDebug(0, "Armor protection report: BODY(" + body_warmth + ", " + body_coverage +       \
                                            ") HANDS(" + hands_warmth + ", " + hands_coverage + \
                                            ") HEAD(" + head_warmth + ", " + head_coverage +    \
                                            ") FEET(" + feet_warmth + ", " + feet_coverage +    \
                                            ") CLOAK(" + cloak_warmth + ", " + cloak_coverage + \
                                            ") SHIELD(0, " + shield_coverage + ")")
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

    ; Gear Type Overrides
    if akBaseObject.HasKeyword(WAF_ClothingCloak)
        iGearType = 7
    endif
    int mySlotMask = armor_object.GetSlotMask()
    if LogicalAnd(mySlotMask, armor_object.kSlotMask31) && !LogicalAnd(mySlotMask, armor_object.kSlotMask32)
        iGearType = 3
    endif

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
    elseif iGearType == 8
        protection_data = DSHandler.GetArmorProtectionData(armor_object, iGearType)
        if protection_data[0] != -1
            equipped_shield = armor_object
            shield_warmth = protection_data[0]
            shield_coverage = protection_data[1]
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
    ;       7: Other (could be cloak)
    ;       8: Shield

    unequip_lock = true
    if akBaseObject.HasKeyword(_Frost_DummyArmorKW)
        return
    endif
    if _Frost_CheckInitialEquipment.GetValueInt() == 2
        if iGearType == 1
            initial_body = akBaseObject as Armor
        elseif iGearType == 2
            initial_hands = akBaseObject as Armor
        elseif iGearType == 3
            initial_head = akBaseObject as Armor
        elseif iGearType == 4
            initial_feet = akBaseObject as Armor
        elseif iGearType == 8
            initial_shield = akBaseObject as Armor
        endif
    endif
    HandleUnequippedObject(akBaseObject, iGearType)
    unequip_lock = false

    SendEvent_UpdateWarmthAndCoverage()
    DisplayWarmthCoverageNoSkyUIPkgRemove(akBaseObject as Armor, iGearType)

    FrostDebug(0, "Armor protection report: BODY(" + body_warmth + ", " + body_coverage +       \
                                            ") HANDS(" + hands_warmth + ", " + hands_coverage + \
                                            ") HEAD(" + head_warmth + ", " + head_coverage +    \
                                            ") FEET(" + feet_warmth + ", " + feet_coverage +    \
                                            ") CLOAK(" + cloak_warmth + ", " + cloak_coverage + \
                                            ") SHIELD(0, " + shield_coverage + ")")
endFunction

function HandleUnequippedObject(Form akBaseObject, int iGearType)
    Armor armor_object = akBaseObject as Armor

    ; Gear Type Overrides
    if akBaseObject.HasKeyword(WAF_ClothingCloak)
        iGearType = 7
    endif
    int mySlotMask = armor_object.GetSlotMask()
    if LogicalAnd(mySlotMask, armor_object.kSlotMask31) && !LogicalAnd(mySlotMask, armor_object.kSlotMask32)
        iGearType = 3
    endif

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
    elseif iGearType == 8
        if equipped_shield == armor_object
            equipped_shield = None
            shield_warmth = 0
            shield_coverage = 0
        endif
    endif
endFunction

Event ShieldEquipped(Form akBaseObject, bool abEquipped)
    if abEquipped
        ObjectEquipped(akBaseObject, 8)
    else
        ObjectUnequipped(akBaseObject, 8)
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
                cloak_coverage + shield_coverage
    return total
endFunction

Event OnUpdate()
    ; Suppress this message when getting into / out of a tent
    if PlayerRef.GetSitState() > 0
        return
    endif

    _Frost_Strings str = FrostfallStrings as _Frost_Strings
    debug.notification(str.TotalWarmth + " " + GetPlayerWarmth() + ", " + str.TotalCoverage + " " + GetPlayerCoverage())
EndEvent

function DisplayWarmthCoverageNoSkyUIPkg(Armor akArmor, int aiGearType)
    if !GetCompatibilitySystem().isUIPackageInstalled && FrostfallRunning.GetValueInt() == 2
        int[] result = GetClothingDatastoreHandler().GetTotalProtectionValues(akArmor, aiGearType)
        if result[0] == 0 && result[1] == 0
            return
        endif
        if UI.IsMenuOpen("InventoryMenu")
            if _Frost_Setting_Notifications_EquipmentValues.GetValueInt() == 2
                _Frost_Strings str = FrostfallStrings as _Frost_Strings
                string name = akArmor.GetName()
                debug.notification(name + " - " + str.Warmth + " " + result[0] + ", " + str.Coverage + " " + result[1])
            endif
            RegisterForMenu("InventoryMenu")
        else
            RegisterForSingleUpdate(1)
        endif
    endif
endFunction

function DisplayWarmthCoverageNoSkyUIPkgRemove(Armor akArmor, int aiGearType)
    if !GetCompatibilitySystem().isUIPackageInstalled && FrostfallRunning.GetValueInt() == 2
        int[] result = GetClothingDatastoreHandler().GetTotalProtectionValues(akArmor, aiGearType)
        if result[0] == 0 && result[1] == 0
            return
        endif
        if UI.IsMenuOpen("InventoryMenu")
            RegisterForMenu("InventoryMenu")
        else
            RegisterForSingleUpdate(1)
        endif
    endif
endFunction

Event OnMenuClose(string menuName)
    if menuName == "InventoryMenu"
        _Frost_Strings str = FrostfallStrings as _Frost_Strings
        debug.notification(str.TotalWarmth + " " + GetPlayerWarmth() + ", " + str.TotalCoverage + " " + GetPlayerCoverage())
        UnregisterForMenu("InventoryMenu")
    endif
EndEvent

function SendEvent_UpdateWarmthAndCoverage()
    int handle = ModEvent.Create("Frost_UpdateWarmth")
    if handle
        ModEvent.Send(handle)
    endif
    handle = ModEvent.Create("Frost_UpdateCoverage")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function SendEvent_UpdateWarmth()
    int handle = ModEvent.Create("Frost_UpdateWarmth")
    if handle
        ModEvent.Send(handle)
    endif
endFunction