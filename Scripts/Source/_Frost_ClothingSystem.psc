scriptname _Frost_ClothingSystem extends _Frost_BaseSystem

import _CampInternal
import FrostUtil
import _FrostInternal
import math
import CommonArrayHelper

Actor property PlayerRef auto
GlobalVariable property FrostfallRunning auto
GlobalVariable property _Frost_Setting_Notifications_EquipmentValues auto
GlobalVariable property _Frost_Setting_Notifications_EquipmentSummary auto
GlobalVariable property _Frost_CheckInitialEquipment auto
Keyword property WAF_ClothingCloak auto

Armor[] property WornGearForms auto hidden
int[] property WornGearValues auto hidden
Keyword property _Frost_WornGearData auto

Keyword property _Frost_DummyArmorKW auto
Keyword property _FrostData_ArmorPrecache auto
Armor property initial_body auto hidden
Armor property initial_head auto hidden
Armor property initial_hands auto hidden
Armor property initial_feet auto hidden
Armor property initial_shield auto hidden

_Frost_ArmorProtectionDatastoreHandler handler

function StartUp()
    handler = GetClothingDatastoreHandler()
    WornGearForms = new Armor[31]
    WornGearValues = new int[12]
endFunction

bool function ObjectEquipped(Form akBaseObject)
    debug.trace("Called ObjectEquipped, akBaseObject = " + akBaseObject)
    if !akBaseObject || !akBaseObject as Armor
        debug.trace("akBaseObject was none or was not armor")
        return false
    endif

    ; Initial equipment check
    if akBaseObject.HasKeyword(_Frost_DummyArmorKW)
        debug.trace("akBaseObject has dummy keyword")
        return false
    endif

    bool update_required = AddWornGearEntryForArmorEquipped(akBaseObject as Armor, WornGearForms, _Frost_WornGearData)
    debug.trace("update_required = " + update_required)
    DisplayWarmthCoverageNoSkyUIPkg(akBaseObject as Armor)
    return update_required
endFunction

bool function AddWornGearEntryForArmorEquipped(Armor akArmor, Armor[] akWornGearFormsArray, keyword akWornGearData)
    ; Assign protection data to the correct internal slots and store the results.
    ; Return True if recalculation of warmth and coverage is necessary, false otherwise.
    int slot_mask = akArmor.GetSlotMask()

    ; Check the pre-cache first
    int[] armor_data
    string armorName = akArmor.GetName()
    if PrecacheHasArmorData(armorName, _FrostData_ArmorPrecache)
        debug.trace("Retrieving " + armorName + " from precache.")
        armor_data = GetArmorDataFromPrecache(armorName, _FrostData_ArmorPrecache)
    else
        debug.trace("Resolving " + armorName + ", not found in precache.")
        armor_data = handler.GetArmorProtectionData(akArmor)
        TryToAddArmorDataToPrecache(akArmor, armor_data, _FrostData_ArmorPrecache)
    endif

    if armor_data[0] == handler.GEARTYPE_IGNORE
        return false
    endif

    ; The system will store ONE Body, Head, Hands, Feet, and Cloak slot Warmth and Coverage.
    ; The system will keep any number of warmth/coverage values for Misc.
    ; Explicit gear types win over extra part data.
    int idx = akWornGearFormsArray.Find(akArmor)
    if idx == -1
        ; plug the data in
        ArrayAddArmor(akWornGearFormsArray, akArmor)
        string dskey = handler.GetDatastoreKeyFromForm(akArmor)
        debug.trace("Using DS Key " + dskey + " on gear equipped.")

        int type = armor_data[0]
        StorageUtil.IntListResize(akWornGearData, dskey, 13)
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

bool function ObjectUnequipped(Form akBaseObject)
    if !akBaseObject || !akBaseObject as Armor
        return false
    endif
    if akBaseObject.HasKeyword(_Frost_DummyArmorKW)
        return false
    endif

    ; During start-up, we need to know what to re-equip. Store these in
    ; 'initial' equipment properties.
    if _Frost_CheckInitialEquipment.GetValueInt() == 2
        Armor armor_object = akBaseObject as Armor
        int armor_mask = armor_object.GetSlotMask()
        int gear_type = handler.GetGearType(armor_object, armor_mask)
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
    bool update_required = RemoveWornGearEntryForArmorUnequipped(akBaseObject as Armor, WornGearForms, _Frost_WornGearData)
    DisplayWarmthCoverageNoSkyUIPkgRemove(akBaseObject as Armor)
    return update_required
endFunction

bool function RemoveWornGearEntryForArmorUnequipped(Armor akArmor, Armor[] akWornGearFormsArray, keyword akWornGearData)
    bool worn_gear_found = ArrayRemoveArmor(akWornGearFormsArray, akArmor, true)
    if worn_gear_found
        string dskey = handler.GetDatastoreKeyFromForm(akArmor)
        StorageUtil.IntListClear(akWornGearData, dskey)
        return true
    endif
    return false
endFunction

function RefreshWornGearData(Armor[] akWornGearFormsArray, keyword akWornGearData)
    ; Pull the latest values for all currently worn gear. (Player switched profiles, changed the JSON file
    ; by hand since they last loaded the game, etc)
    int i = 0
    int gear_count = ArrayCountArmor(akWornGearFormsArray)
    while i < gear_count
        Armor the_armor = akWornGearFormsArray[i]
        int[] armor_data = handler.GetArmorProtectionData(the_armor)
        string dskey = handler.GetDatastoreKeyFromForm(the_armor)

        int type = armor_data[0]
        StorageUtil.IntListSet(akWornGearData, dskey, 0, type) ; type
        int jdx = (type * 2)

        StorageUtil.IntListSet(akWornGearData, dskey, 1, armor_data[3])
        StorageUtil.IntListSet(akWornGearData, dskey, 2, armor_data[4])
        StorageUtil.IntListSet(akWornGearData, dskey, 3, armor_data[5])
        StorageUtil.IntListSet(akWornGearData, dskey, 4, armor_data[6])
        StorageUtil.IntListSet(akWornGearData, dskey, 5, armor_data[7])
        StorageUtil.IntListSet(akWornGearData, dskey, 6, armor_data[8])
        StorageUtil.IntListSet(akWornGearData, dskey, 7, armor_data[9])
        StorageUtil.IntListSet(akWornGearData, dskey, 8, armor_data[10])
        StorageUtil.IntListSet(akWornGearData, dskey, 9, armor_data[11])
        StorageUtil.IntListSet(akWornGearData, dskey, 10, armor_data[12])
        StorageUtil.IntListSet(akWornGearData, dskey, 11, armor_data[13])
        StorageUtil.IntListSet(akWornGearData, dskey, 12, armor_data[14])

        ; Main values - these overwrite "extra" data in the same category (shouldn't do that anyway)
        StorageUtil.IntListSet(akWornGearData, dskey, jdx - 1, armor_data[1])     ; warmth
        StorageUtil.IntListSet(akWornGearData, dskey, jdx, armor_data[2])         ; coverage
        i += 1
    endWhile
endFunction

function RecalculateProtectionData(Armor[] akWornGearFormsArray, int[] aiWornGearValuesArray, keyword akWornGearData)
    ;/
        Iterates over a "table" of values in the form below to determine total Warmth and Coverage.
    /;
    ; | _Frost_WornGearData Index |  0   |     1     |    2     |     |    10     |    11    |
    ; |---------------------------|------|-----------|----------|-----|-----------|----------|
    ; | WornGearForms             | Type | Body Warm | Body Cov | ... | Misc Warm | Misc Cov |
    ; | "80145___Skyrim.esm"      | 1    | 60        | 0        |     | 0         | 0        |

    int key_count = ArrayCountArmor(akWornGearFormsArray)
    ; debug.trace("RecalculateProtectionData key_count " + key_count)

    int i = 0
    int type_counter = -1
    int type_to_match = 1

    while i < 12
        int j = 0
        int column_value = 0

        type_counter += 1
        if type_counter == 2
            type_counter = 0
            type_to_match += 1
        endif

        bool gear_type_found = false
        while j < key_count && !gear_type_found
            ; Make sure I'm even still wearing this gear. This calculation can be
            ; out of sync with reality (queued events exit that are not yet processed).
            ; Leave the bogus entry alone, the array will eventually be accurate after
            ; the next integrity check.
            if PlayerHasArmorEquipped(akWornGearFormsArray[j])
                string dskey = handler.GetDatastoreKeyFromForm(akWornGearFormsArray[j])
                int gear_type = StorageUtil.IntListGet(akWornGearData, dskey, 0)
                int val = StorageUtil.IntListGet(akWornGearData, dskey, i + 1)

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
            endif
            j += 1
        endWhile

        ; Result for this column
        aiWornGearValuesArray[i] = column_value
        i += 1
    endWhile

    ;Signal to the UI that we're ready for the "change" values to be updated.
    GetInterfaceHandler().InvalidateFetchedChangeRangesOnRecalculate()

    FrostDebug(0, "Worn Gear Values: " + aiWornGearValuesArray)
endFunction

function WornGearFormsIntegrityCheck(Armor[] akWornGearFormsArray)
    int i = 0
    int key_count = ArrayCountArmor(akWornGearFormsArray)
    debug.trace("[Frostfall] Beginning worn gear integrity check.")
    int removed = 0
    while i < key_count
        Armor the_armor = akWornGearFormsArray[i]
        if !PlayerRef.IsEquipped(the_armor)
            ArrayRemoveArmor(akWornGearFormsArray, akWornGearFormsArray[i], true)
            removed += 1
        endif
        i += 1
    endWhile
    debug.trace("[Frostfall] Integrity check complete. Removed " + removed + " invalid forms from worn gear list.")
endFunction

int function GetArmorWarmth(int[] aiWornGearValuesArray)
    return aiWornGearValuesArray[0] + aiWornGearValuesArray[2] + aiWornGearValuesArray[4] + aiWornGearValuesArray[6] + aiWornGearValuesArray[8] + aiWornGearValuesArray[10]
endFunction

int function GetArmorCoverage(int[] aiWornGearValuesArray)
    return aiWornGearValuesArray[1] + aiWornGearValuesArray[3] + aiWornGearValuesArray[5] + aiWornGearValuesArray[7] + aiWornGearValuesArray[9] + aiWornGearValuesArray[11]
endFunction

; Only runs if the SkyUI Package is not installed. Displays warmth and coverage
; in a debug notification.
Event OnUpdate()
    ; Suppress this message when getting into / out of a tent
    if PlayerRef.GetSitState() > 0
        return
    endif

    if _Frost_Setting_Notifications_EquipmentSummary.GetValueInt() != 2
        return
    endif

    _Frost_Strings str = GetFrostfallStrings()
    debug.notification(str.TotalWarmth + " " + GetPlayerWarmth() + ", " + str.TotalCoverage + " " + GetPlayerCoverage())
EndEvent

function DisplayWarmthCoverageNoSkyUIPkg(Armor akArmor)
    if !akArmor
        return
    endif
    if !GetCompatibilitySystem().isUIPackageInstalled && FrostfallRunning.GetValueInt() == 2
        int[] result = handler.GetTotalArmorProtectionValues(akArmor)
        if result[0] == 0 && result[1] == 0
            return
        endif
        if UI.IsMenuOpen("InventoryMenu")
            if _Frost_Setting_Notifications_EquipmentValues.GetValueInt() == 2
                _Frost_Strings str = GetFrostfallStrings()
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
        int[] result = handler.GetTotalArmorProtectionValues(akArmor)
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
        _Frost_Strings str = GetFrostfallStrings()
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

bool function PlayerHasArmorEquipped(Armor akArmor)
    ; An alias for PlayerRef.IsEquipped(), to make testing easier.
    return PlayerRef.IsEquipped(akArmor)
endFunction


; Lilac Mock States ===========================================================

int property mock_AddWornGearEntryForArmorEquipped_callcount = 0 auto hidden
int property mock_RemoveWornGearEntryForArmorUnequipped_callcount = 0 auto hidden

State mock_testObjectEquipped

    bool function AddWornGearEntryForArmorEquipped(Armor akArmor, Armor[] akWornGearFormsArray, keyword akWornGearData)
        mock_AddWornGearEntryForArmorEquipped_callcount += 1
        return false
    endFunction

    bool function RemoveWornGearEntryForArmorUnequipped(Armor akArmor, Armor[] akWornGearFormsArray, keyword akWornGearData)
        mock_RemoveWornGearEntryForArmorUnequipped_callcount += 1
        return false
    endFunction

    function SendEvent_UpdateWarmthAndCoverage()
        ; pass
    endFunction

    function DisplayWarmthCoverageNoSkyUIPkg(Armor akArmor)
        ; pass
    endFunction

EndState

State mock_testRecalculateProtectionData
    bool function PlayerHasArmorEquipped(Armor akArmor)
        return true
    endFunction
endState
