scriptname _Frost_ClothingSystem extends _Frost_BaseSystem

import FrostUtil
import _FrostInternal
import math

Actor property PlayerRef auto
Quest property _Frost_MainQuest auto
GlobalVariable property FrostfallRunning auto
GlobalVariable property _Frost_Setting_Notifications_EquipmentValues auto
GlobalVariable property _Frost_Setting_Notifications_EquipmentSummary auto
GlobalVariable property _Frost_CheckInitialEquipment auto
Quest property FrostfallStrings auto
Keyword property ActorTypeCreature auto
Keyword property ImmuneParalysis auto
Keyword property WAF_ClothingCloak auto

string[] property WornGearKeys auto hidden
int[] property WornGearValues auto hidden
Keyword property _Frost_WornGearData auto

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

function Initialize()
    WornGearKeys = new string[31]
    WornGearValues = new int[12]
endFunction

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
        
    if !akBaseObject
        return
    endif

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
    ; Assign protection data to the correct internal slots and store the results.
    
    int i = 20
    while unequip_lock == true && i > 0
        utility.wait(0.2)
        i -= 1
    endWhile

    Armor armor_object = akBaseObject as Armor
    if !armor_object
        return
    endif
    int slot_mask = armor_object.GetSlotMask()

    _Frost_ArmorProtectionDatastoreHandler handler = GetClothingDatastoreHandler()

    int type = handler.GetGearType(armor_object, slot_mask, false)
    if type == -1
        return
    endif

    int[] armor_data = handler.GetArmorProtectionData(armor_object)

    ; The system will store ONE Body, Head, Hands, Feet, and Cloak slot Warmth and Coverage.
    ; The system will keep any number of warmth/coverage values for Misc.
    ; Explicit gear types win over extra part data.
    string dskey = handler.GetDatastoreKeyFromForm(armor_object)
    int idx = WornGearKeys.Find(dskey)
    ;@TODO: Also check the data store
    ;@TODO: Handle ignore flag
    if idx == -1
        ; plug the data in
        ArrayAddString(WornGearKeys, dskey)
        ;@TODO: Assume we get the type
        int type = armor_data[0]
        ;@TODO: no type?
        ; 0 - type
        ; 1 - body warmth
        ; 2 - body coverage
        ; 3 - head warmth
        ; 4 - head coverage
        ; 5 - hands warmth
        ; 6 - hands coverage
        ; 7 - feet warmth
        ; 8 - feet coverage
        ; 9 - cloak warmth
        ; 10 - cloak coverage
        ; 11 - misc warmth
        ; 12 - misc coverage
        StorageUtil.IntListResize(_Frost_WornGearData, dskey, 14)
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, 0, type) ; type
        int jdx = (type * 2)
        
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, 1, armor_data[3])     ; extra body warmth
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, 2, armor_data[4])     ; extra body coverage
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, 3, armor_data[5])     ; extra head warmth
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, 4, armor_data[6])     ; extra head coverage
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, 5, armor_data[7])     ; extra hands warmth
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, 6, armor_data[8])     ; extra hands coverage
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, 7, armor_data[9])     ; extra feet warmth
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, 8, armor_data[10])    ; extra feet coverage
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, 9, armor_data[11])    ; extra cloak warmth
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, 10, armor_data[12])    ; extra cloak coverage
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, 11, armor_data[13])    ; extra misc warmth
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, 12, armor_data[14])    ; extra misc coverage

        ; Main values - these overwrite "extra" data in the same category (shouldn't do that anyway)
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, jdx - 1, armor_data[1])     ; warmth
        StorageUtil.IntListSet(_Frost_WornGearData, dskey, jdx, armor_data[2])         ; coverage

        RecalculateProtectionData()
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
    if !akBaseObject
        return
    endif
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
    if !armor_object
        return
    endif
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

function RecalculateProtectionData()
    int key_count = ArrayCountString(WornGearKeys)
    int i = 0
    int j = 0

    int[] temp_armor_values

    while i < 12
        temp_armor_values = new int[31]
        int largest = -1
        while j < key_count
            int val = StorageUtil.IntListGet(_Frost_WornGearData, WornGearKeys[j], i)
            temp_armor_values[j] = val
            
            ; Also track max value
            if val > largest
                largest = val
            endif
            j += 1
        endWhile
        if i < 12   ; Max
            WornGearValues[i] = largest
        else        ; Sum
            WornGearValues[i] = Sum(temp_armor_values)
        endif
        i += 1
    endWhile

    FrostDebug(0, "Worn Gear Values: " + WornGearValues)
endFunction

int function GetArmorWarmth()
    return WornGearValues[0] + WornGearValues[2] + WornGearValues[4] + WornGearValues[6] + WornGearValues[8] + WornGearValues[10]
endFunction

int function GetArmorCoverage()
    return WornGearValues[1] + WornGearValues[3] + WornGearValues[5] + WornGearValues[7] + WornGearValues[9] + WornGearValues[11]
endFunction

Event OnUpdate()
    ; Suppress this message when getting into / out of a tent
    if PlayerRef.GetSitState() > 0
        return
    endif

    if _Frost_Setting_Notifications_EquipmentSummary.GetValueInt() != 2
        return
    endif

    _Frost_Strings str = FrostfallStrings as _Frost_Strings
    debug.notification(str.TotalWarmth + " " + GetPlayerWarmth() + ", " + str.TotalCoverage + " " + GetPlayerCoverage())
EndEvent

function DisplayWarmthCoverageNoSkyUIPkg(Armor akArmor, int aiGearType)
    if !akArmor
        return
    endif
    if !GetCompatibilitySystem().isUIPackageInstalled && FrostfallRunning.GetValueInt() == 2
        int[] result = GetClothingDatastoreHandler().GetTotalProtectionValues(akArmor, aiGearType)
        if result[0] == 0 && result[1] == 0
            return
        endif
        if UI.IsMenuOpen("InventoryMenu")
            if _Frost_Setting_Notifications_EquipmentValues.GetValueInt() == 2
                _Frost_Strings str = FrostfallStrings as _Frost_Strings
                string name = akArmor.GetName()
                if result[0] == -99
                    debug.notification(name + " - " + str.Warmth + " N/A, " + str.Coverage + " N/A")
                else
                    debug.notification(name + " - " + str.Warmth + " " + result[0] + ", " + str.Coverage + " " + result[1])
                endif
            endif
            RegisterForMenu("InventoryMenu")
        else
            RegisterForSingleUpdate(1)
        endif
    endif
endFunction

function DisplayWarmthCoverageNoSkyUIPkgRemove(Armor akArmor, int aiGearType)
    if !akArmor
        return
    endif
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
        if _Frost_Setting_Notifications_EquipmentSummary.GetValueInt() != 2
            UnregisterForMenu("InventoryMenu")
            return
        endif
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



; Array functions ==============================================================

bool function ArrayAddString(string[] myArray, string myKey)
;Adds a form to the first available element in the array.
    ;       false       =       Error (array full)
    ;       true        =       Success

    int i = 0
    while i < myArray.Length
        if IsNone(myArray[i])
            myArray[i] = myKey
            return true
        else
            i += 1
        endif
    endWhile
    return false
endFunction

bool function ArraySortString(String[] myArray, int i = 0)
;Removes blank elements by shifting all elements down.
     ;         false        =              No sorting required
     ;         true         =              Success
 
     bool bFirstNoneFound = false
     int iFirstNonePos = i
     while i < myArray.Length
          if IsNone(myArray[i])
               myArray[i] = none
               if bFirstNoneFound == false
                    bFirstNoneFound = true
                    iFirstNonePos = i
                    i += 1
               else
                    i += 1
               endif
          else
               if bFirstNoneFound == true
               ;check to see if it's a couple of blank entries in a row
                    if !(IsNone(myArray[i]))
                         myArray[iFirstNonePos] = myArray[i]
                         myArray[i] = none
 
                         ;Call this function recursively until it returns
                         ArraySort(myArray, iFirstNonePos + 1)
                         return true
                    else
                         i += 1
                    endif
               else
                    i += 1
               endif
          endif
     endWhile
     return false
endFunction

int function ArrayCountString(String[] myArray)
;Counts the number of indices in this array that do not have a "none" type.
    ;       int myCount = number of indicies that are not "none"
 
    int i = 0
    int myCount = 0
    while i < myArray.Length
        if !(IsNone(myArray[i]))
            myCount += 1
            i += 1
        else
            i += 1
        endif
    endWhile
    return myCount
endFunction

bool function IsNone(string akString)
    if akString
        if akString == ""
            return true
        else
            return false
        endif
    else
        return true
    endif
endFunction

int function Max(int[] aiValues)
    ;/
        Return the largest value greater than 0 in aiValues.
    /;
    int largest = -1
    int i = 0
    while i < aiValues.Length
        if aiValues[i] > largest
            largest = aiValues
        endif
        i += 1
    endWhile
    return largest
endFunction

bool function IsEven(int aiValue)
    return aiValue % 2 == 0
endFunction