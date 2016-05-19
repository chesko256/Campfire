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

_Frost_ArmorProtectionDatastoreHandler handler

function StartUp()
    handler = GetClothingDatastoreHandler()
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

function ObjectEquipped(Form akBaseObject)
    if !akBaseObject || !akBaseObject as Armor
        return
    endif

    ; Initial equipment check
    if akBaseObject.HasKeyword(_Frost_DummyArmorKW)
        return
    endif

    bool update_required = AddWornGearEntryForArmorEquipped(akBaseObject as Armor, WornGearKeys, _Frost_WornGearData)

    if update_required
        RecalculateProtectionData()
    endif

    SendEvent_UpdateWarmthAndCoverage()
    DisplayWarmthCoverageNoSkyUIPkg(akBaseObject as Armor)
endFunction

bool function AddWornGearEntryForArmorEquipped(Armor akArmor, string[] aiWornGearKeysArray, keyword akWornGearData)
    ; Assign protection data to the correct internal slots and store the results.
    ; Return True if recalculation of warmth and coverage is necessary, false otherwise.
    
    int i = 20
    while unequip_lock == true && i > 0
        utility.wait(0.2)
        i -= 1
    endWhile

    int slot_mask = akArmor.GetSlotMask()

    ;int type = handler.GetGearType(akArmor, slot_mask, false)
    ;if type == -1
    ;    return
    ;endif

    int[] armor_data = handler.GetArmorProtectionData(akArmor)

    ; The system will store ONE Body, Head, Hands, Feet, and Cloak slot Warmth and Coverage.
    ; The system will keep any number of warmth/coverage values for Misc.
    ; Explicit gear types win over extra part data.
    string dskey = handler.GetDatastoreKeyFromForm(akArmor)
    int idx = aiWornGearKeysArray.Find(dskey)
    ;@TODO: Also check the data store
    ;@TODO: Handle ignore flag
    if idx == -1
        ; plug the data in
        ArrayAddString(aiWornGearKeysArray, dskey)
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
        StorageUtil.IntListResize(akWornGearData, dskey, 15)
        StorageUtil.IntListSet(akWornGearData, dskey, 0, type) ; type
        int jdx = (type * 2)
        
        StorageUtil.IntListSet(akWornGearData, dskey, 1, armor_data[3])     ; body warmth (from extra body warmth)
        StorageUtil.IntListSet(akWornGearData, dskey, 2, armor_data[4])     ; body coverage (from extra body coverage)
        StorageUtil.IntListSet(akWornGearData, dskey, 3, armor_data[5])     ; head warmth (from extra head warmth)
        StorageUtil.IntListSet(akWornGearData, dskey, 4, armor_data[6])     ; head coverage (from extra head coverage)
        StorageUtil.IntListSet(akWornGearData, dskey, 5, armor_data[7])     ; hands warmth (from extra hands warmth)
        StorageUtil.IntListSet(akWornGearData, dskey, 6, armor_data[8])     ; hands coverage (from extra hands coverage)
        StorageUtil.IntListSet(akWornGearData, dskey, 7, armor_data[9])     ; feet warmth (from extra feet warmth)
        StorageUtil.IntListSet(akWornGearData, dskey, 8, armor_data[10])    ; feet coverage (from extra feet coverage)
        StorageUtil.IntListSet(akWornGearData, dskey, 9, armor_data[11])    ; cloak warmth (from extra cloak warmth)
        StorageUtil.IntListSet(akWornGearData, dskey, 10, armor_data[12])    ; cloak coverage (from extra cloak coverage)
        StorageUtil.IntListSet(akWornGearData, dskey, 11, armor_data[13])    ; misc warmth (from extra misc warmth)
        StorageUtil.IntListSet(akWornGearData, dskey, 12, armor_data[14])    ; misc coverage (from extra misc coverage)

        ; Main values - these overwrite "extra" data in the same category (shouldn't do that anyway)
        StorageUtil.IntListSet(akWornGearData, dskey, jdx - 1, armor_data[1])     ; warmth
        StorageUtil.IntListSet(akWornGearData, dskey, jdx, armor_data[2])         ; coverage

        return true
    else
        return false
    endif
endFunction

function ObjectUnequipped(Form akBaseObject)

    unequip_lock = true
    if !akBaseObject
        unequip_lock = false
        return
    endif
    if akBaseObject.HasKeyword(_Frost_DummyArmorKW)
        unequip_lock = false
        return
    endif
    if _Frost_CheckInitialEquipment.GetValueInt() == 2
        Armor armor_object = akBaseObject as Armor
        if armor_object
            int armor_mask = armor_object.GetSlotMask()
            int gear_type = handler.GetGearType(armor_object, armor_mask, abStrictMode = false)
            if gear_type == handler.GEARTYPE_BODY
                initial_body = armor_object
            elseif gear_type == handler.GEARTYPE_HEAD
                initial_head = armor_object
            elseif gear_type == handler.GEARTYPE_HANDS
                initial_hands = armor_object
            elseif gear_type == handler.GEARTYPE_FEET
                initial_feet = armor_object
            elseif gear_type == handler.GEARTYPE_MISC && armor_object.IsShield()
                initial_shield = armor_object
            endif
        endif
    endif
    HandleUnequippedObject(akBaseObject)
    unequip_lock = false

    SendEvent_UpdateWarmthAndCoverage()
    DisplayWarmthCoverageNoSkyUIPkgRemove(akBaseObject as Armor)
endFunction

function HandleUnequippedObject(Form akBaseObject)
    Armor armor_object = akBaseObject as Armor
    if !armor_object
        return
    endif

    string dskey = handler.GetDatastoreKeyFromForm(armor_object)
    bool worn_gear_found = ArrayRemoveString(WornGearKeys, dskey, true)
    if worn_gear_found
        StorageUtil.IntListClear(_Frost_WornGearData, dskey)
    endif

    RecalculateProtectionData()
endFunction

Event ShieldEquipped(Form akBaseObject, bool abEquipped)
    if abEquipped
        ObjectEquipped(akBaseObject)
    else
        ObjectUnequipped(akBaseObject)
    endif
endEvent

function RecalculateProtectionData()
    ;/
        Iterates over a "table" of values in the form below to determine total Warmth and Coverage.
    /;
    ; | _Frost_WornGearData Index |  0   |     1     |    2     |     |    10     |    11    |
    ; |---------------------------|------|-----------|----------|-----|-----------|----------|
    ; | WornGearKeys              | Type | Body Warm | Body Cov | ... | Misc Warm | Misc Cov |
    ; | "80145___Skyrim.esm"      | 1    | 60        | 0        |     | 0         | 0        |
    
    int key_count = ArrayCountString(WornGearKeys)
    int i = 0
    int j = 0

    while i < 12
        int column_value = 0
        
        int type_to_match
        if !IsEven(i)
            type_to_match = (i / 2)
        else
            type_to_match = (i / 2) + 1
        endif

        bool gear_type_found = false
        while j < key_count && !gear_type_found
            int gear_type = StorageUtil.IntListGet(_Frost_WornGearData, WornGearKeys[j], 0)
            int val = StorageUtil.IntListGet(_Frost_WornGearData, WornGearKeys[j], i)

            if type_to_match != handler.GEARTYPE_MISC
                ; Native type takes priority
                if gear_type == type_to_match
                    column_value = val
                    gear_type_found = true
                else
                    ; Otherwise, take the highest Extra value
                    if val > column_value
                        column_value = val
                    endif
                endif
            else
                ; Sum MISC type items (and never type match)
                column_value += val
            endif
            j += 1
        endWhile

        ; Result for this column
        WornGearValues[i] = column_value
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

function DisplayWarmthCoverageNoSkyUIPkg(Armor akArmor)
    if !akArmor
        return
    endif
    if !GetCompatibilitySystem().isUIPackageInstalled && FrostfallRunning.GetValueInt() == 2
        int[] result = handler.GetTotalProtectionValues(akArmor)
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

function DisplayWarmthCoverageNoSkyUIPkgRemove(Armor akArmor)
    if !akArmor
        return
    endif
    if !GetCompatibilitySystem().isUIPackageInstalled && FrostfallRunning.GetValueInt() == 2
        int[] result = handler.GetTotalProtectionValues(akArmor)
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

bool function ArrayRemoveString(string[] myArray, String myKey, bool bSort = false)
    ;Removes a form from the array, if found. Sorts the array using ArraySort() if bSort is true.
    ;       false       =       Error (string not found)
    ;       true        =       Success

    int i = 0
    while i < myArray.Length
        if myArray[i] == myKey
            myArray[i] = none
            if bSort == true
                ArraySortString(myArray)
            endif
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
                         ArraySortString(myArray, iFirstNonePos + 1)
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

bool function IsEven(int aiValue)
    return aiValue % 2 == 0
endFunction


; Lilac Mock States ===========================================================



int property mock_AddWornGearEntryForArmorEquipped_callcount = 0 auto hidden

State mock_testObjectEquipped

    bool function AddWornGearEntryForArmorEquipped(Armor akArmor, string[] aiWornGearKeysArray, keyword akWornGearData)
        mock_AddWornGearEntryForArmorEquipped_callcount += 1
        return false
    endFunction

    function SendEvent_UpdateWarmthAndCoverage()
        ; pass
    endFunction

    function DisplayWarmthCoverageNoSkyUIPkg(Armor akArmor)
        ; pass
    endFunction

EndState

State mock_testAddWornGearEntryForArmorEquipped

endState