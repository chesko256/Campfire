scriptname _Frost_ClothingSystem extends _Frost_BaseSystem

import CampUtil
import _CampInternal
import FrostUtil
import _FrostInternal
import Utility
import math
import CommonArrayHelper

Actor property PlayerRef auto
_Frost_PlayerEquipMonitor property EquipMon auto
GlobalVariable property FrostfallRunning auto
GlobalVariable property _Frost_Setting_Notifications_EquipmentValues auto
GlobalVariable property _Frost_Setting_Notifications_EquipmentSummary auto
GlobalVariable property _Frost_CheckInitialEquipment auto
Keyword property WAF_ClothingCloak auto

; Main body pieces.
; [0] = Body
; [1] = Head
; [2] = Hands
; [3] = Feet
; [4] = Cloak
Armor[] property WornGearMainForms auto hidden
; This now only stores "Accessories".
; [n] = Accessory
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

Message property _Frost_ProtectionTotalsMsg auto

Message property _Frost_ProtArmor_Poor_Poor auto
Message property _Frost_ProtArmor_Fair_Poor auto
Message property _Frost_ProtArmor_Good_Poor auto
Message property _Frost_ProtArmor_Excellent_Poor auto
Message property _Frost_ProtArmor_Max_Poor auto
Message property _Frost_ProtArmor_Poor_Fair auto
Message property _Frost_ProtArmor_Fair_Fair auto
Message property _Frost_ProtArmor_Good_Fair auto
Message property _Frost_ProtArmor_Excellent_Fair auto
Message property _Frost_ProtArmor_Max_Fair auto
Message property _Frost_ProtArmor_Poor_Good auto
Message property _Frost_ProtArmor_Fair_Good auto
Message property _Frost_ProtArmor_Good_Good auto
Message property _Frost_ProtArmor_Excellent_Good auto
Message property _Frost_ProtArmor_Max_Good auto
Message property _Frost_ProtArmor_Poor_Excellent auto
Message property _Frost_ProtArmor_Fair_Excellent auto
Message property _Frost_ProtArmor_Good_Excellent auto
Message property _Frost_ProtArmor_Excellent_Excellent auto
Message property _Frost_ProtArmor_Max_Excellent auto
Message property _Frost_ProtArmor_Poor_Max auto
Message property _Frost_ProtArmor_Fair_Max auto
Message property _Frost_ProtArmor_Good_Max auto
Message property _Frost_ProtArmor_Excellent_Max auto
Message property _Frost_ProtArmor_Max_Max auto

_Frost_ArmorProtectionDatastoreHandler handler

bool waitingForMenuExit = false

function StartUp()
    handler = GetClothingDatastoreHandler()
    WornGearMainForms = new Armor[5]
    WornGearForms = new Armor[26]
    WornGearValues = new int[12]
endFunction

bool function ObjectEquipped(Form akBaseObject)
    if !akBaseObject || !akBaseObject as Armor
        ; debug.trace("akBaseObject was none or was not armor")
        return false
    endif

    ; Initial equipment check
    if akBaseObject.HasKeyword(_Frost_DummyArmorKW)
        return false
    endif

    int gear_type = AddWornGearEntryForArmorEquipped(akBaseObject as Armor, WornGearMainForms, WornGearForms, _Frost_WornGearData)
    ;debug.trace("update_required = " + update_required)
    DisplayWarmthCoverageNoSkyUIPkg(akBaseObject as Armor, gear_type)
    if gear_type > 0
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

        int armor_mask
        int gear_type
        if GetSKSELoaded()
            armor_mask = armor_object.GetSlotMask()
            gear_type = handler.GetGearType(armor_object, armor_mask)
        Else
            gear_type = handler.GetGearType_Vanilla(armor_object)
        endif
        if gear_type == handler.GEARTYPE_BODY
            initial_body = armor_object
        elseif gear_type == handler.GEARTYPE_HEAD
            initial_head = armor_object
        elseif gear_type == handler.GEARTYPE_HANDS
            initial_hands = armor_object
        elseif gear_type == handler.GEARTYPE_FEET
            initial_feet = armor_object
        elseif gear_type == handler.GEARTYPE_MISC && IsArmorShield(armor_object)
            initial_shield = armor_object
        endif
    endif
    bool update_required = RemoveWornGearEntryForArmorUnequipped(akBaseObject as Armor, WornGearMainForms, WornGearForms, _Frost_WornGearData)

    ; Don't display "total" values during start-up sequence.
    if _Frost_CheckInitialEquipment.GetValueInt() != 2
        DisplayWarmthCoverageNoSkyUIPkgRemove(akBaseObject as Armor)
    endif

    return update_required
endFunction

Event OnUpdate()
    ; Only runs if SKSE or the SkyUI Package is not installed. Displays
    ; total warmth and coverage in a message.

    if waitingForMenuExit
        if IsInMenuMode()
            RegisterForSingleUpdate(2)
            return
        else
            waitingForMenuExit = false
        endif
    endif

    ; Suppress this message when getting into / out of a tent
    if PlayerRef.GetSitState() > 0
        return
    endif

    if _Frost_Setting_Notifications_EquipmentSummary.GetValueInt() == 2
        ; Don't display the message while still processing
        int i = 0
        while EquipMon.processing_queue && i < 100
            Utility.Wait(0.1)
            i += 1
        endWhile

        ; Don't display the message while still calculating warmth
        _Frost_WarmthSystem warmth = GetWarmthSystem()
        int w = 0
        while warmth.updating_warmth && w < 100
            Utility.Wait(0.1)
            w += 1
        endWhile

        ; Don't display the message while still calculating warmth
        _Frost_CoverageSystem coverage = GetCoverageSystem()
        int c = 0
        while coverage.updating_coverage && c < 100
            Utility.Wait(0.1)
            c += 1
        endWhile

        _Frost_ProtectionTotalsMsg.Show(GetPlayerWarmth(), GetPlayerCoverage())
    endif
EndEvent


;***
;*** Wrapper functions
;***

;/* AddWornGearEntryForArmorEquipped wrapper */;
int function AddWornGearEntryForArmorEquipped(Armor akArmor, Armor[] akWornGearMainFormsArray, Armor[] akWornGearFormsArray, keyword akWornGearData)
    if GetSKSELoaded()
        return AddWornGearEntryForArmorEquipped_SKSE(akArmor, akWornGearMainFormsArray, akWornGearFormsArray, akWornGearData)
    Else
        return AddWornGearEntryForArmorEquipped_Vanilla(akArmor, akWornGearMainFormsArray, akWornGearFormsArray)
    endif
endFunction

int function AddWornGearEntryForArmorEquipped_SKSE(Armor akArmor, Armor[] akWornGearMainFormsArray, Armor[] akWornGearFormsArray, keyword akWornGearData)
    ; Assign protection data to the correct internal slots and store the results.
    ; Return True if recalculation of warmth and coverage is necessary, false otherwise.

    ; Check the pre-cache first
    int[] armor_data
    string armorDisplayName = akArmor.GetName()
    if PrecacheHasArmorData(armorDisplayName, _FrostData_ArmorPrecache)
        FrostDebug(0, "(SKSE) Retrieving " + armorDisplayName + " from precache.")
        armor_data = GetArmorDataFromPrecache(armorDisplayName, _FrostData_ArmorPrecache)
    else
        FrostDebug(0, "(SKSE) Resolving " + armorDisplayName + ", not found in precache.")
        armor_data = handler.GetArmorProtectionData(akArmor)
        TryToAddArmorDataToPrecache(akArmor, armor_data, _FrostData_ArmorPrecache)
    endif

    if armor_data[0] == handler.GEARTYPE_IGNORE
        return 0
    endif

    ; The system will store ONE Body, Head, Hands, Feet, and Cloak slot Warmth and Coverage.
    ; The system will keep any number of warmth/coverage values for Misc.
    ; Explicit gear types win over extra part data.
    int idx
    bool shouldStoreData = false
    if armor_data[0] < handler.GEARTYPE_MISC
        idx = akWornGearMainFormsArray.Find(akArmor)
    else
        idx = akWornGearFormsArray.Find(akArmor)
    endif

    if idx == -1
        shouldStoreData = true
    else
        return 0
    endif

    if shouldStoreData
        ; plug the data in
        AddToWornGearFormsArray(akArmor, armor_data[0], akWornGearMainFormsArray, akWornGearFormsArray)
        string dskey = handler.GetDatastoreKeyFromForm(akArmor)

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

        return type
    endif
endFunction

int function AddWornGearEntryForArmorEquipped_Vanilla(Armor akArmor, Armor[] akWornGearMainFormsArray, Armor[] akWornGearFormsArray)
    FrostDebug(0, "(Vanilla) Resolving " + akArmor + ".")
    int[] armor_data = handler.GetArmorProtectionData(akArmor)

    if armor_data[0] == handler.GEARTYPE_IGNORE
        return 0
    endif

    ; Keep a running list of what I'm currently wearing.
    ; All worn gear values will be recalculated during update cycle.
    int idx
    if armor_data[0] < handler.GEARTYPE_MISC
        idx = akWornGearMainFormsArray.Find(akArmor)
        if idx == -1
            AddToWornGearFormsArray(akArmor, armor_data[0], akWornGearMainFormsArray, akWornGearFormsArray)
            return armor_data[0]
        else
            return 0
        endif
    else
        idx = akWornGearFormsArray.Find(akArmor)
        if idx == -1
            AddToWornGearFormsArray(akArmor, armor_data[0], akWornGearMainFormsArray, akWornGearFormsArray)
            return armor_data[0]
        else
            return 0
        endif
    endif
endFunction

bool function AddToWornGearFormsArray(Armor akArmor, int aiGearType, Armor[] akWornGearMainFormsArray, Armor[] akWornGearFormsArray)
    ; Add the worn gear form to the appropriate array.
    if aiGearType == 0
        return false
    elseif aiGearType < 6
        ; Main type
        akWornGearMainFormsArray[aiGearType - 1] = akArmor
        return true
    else
        ;Misc Type
        return ArrayAddArmor(akWornGearFormsArray, akArmor)
    endif
endFunction


;/* RemoveWornGearEntryForArmorUnequipped wrapper */;
bool function RemoveWornGearEntryForArmorUnequipped(Armor akArmor, Armor[] akWornGearMainFormsArray, Armor[] akWornGearFormsArray, keyword akWornGearData)
    if GetSKSELoaded()
        return RemoveWornGearEntryForArmorUnequipped_SKSE(akArmor, akWornGearMainFormsArray, akWornGearFormsArray, akWornGearData)
    else
        return RemoveWornGearEntryForArmorUnequipped_Vanilla(akArmor, akWornGearMainFormsArray, akWornGearFormsArray)
    endif
endFunction

bool function RemoveWornGearEntryForArmorUnequipped_SKSE(Armor akArmor, Armor[] akWornGearMainFormsArray, Armor[] akWornGearFormsArray, keyword akWornGearData)
    bool worn_gear_found = ArrayRemoveArmor(akWornGearMainFormsArray, akArmor, false)
    if !worn_gear_found
        worn_gear_found = ArrayRemoveArmor(akWornGearFormsArray, akArmor, true)
    endif

    if worn_gear_found
        string dskey = handler.GetDatastoreKeyFromForm(akArmor)
        StorageUtil.IntListClear(akWornGearData, dskey)
        return true
    else
        return false    
    endif
endFunction

bool function RemoveWornGearEntryForArmorUnequipped_Vanilla(Armor akArmor, Armor[] akWornGearMainFormsArray, Armor[] akWornGearFormsArray)
    bool worn_gear_found = ArrayRemoveArmor(akWornGearMainFormsArray, akArmor, false)
    if !worn_gear_found
        worn_gear_found = ArrayRemoveArmor(akWornGearFormsArray, akArmor, true)
    endif

    return worn_gear_found
endFunction


; SKSE-only
function RefreshWornGearData(Armor[] akWornGearMainFormsArray, Armor[] akWornGearFormsArray, keyword akWornGearData)
    ; Pull the latest values for all currently worn gear. (Player switched profiles, changed the JSON file
    ; by hand since they last loaded the game, etc)

    ; Main forms
    int j = 0
    while j < akWornGearMainFormsArray.Length
        if akWornGearMainFormsArray[j]
            Armor the_armor = akWornGearMainFormsArray[j]
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
        endif
        j += 1
    endWhile

    ; Accessories
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

;/* RecalculateProtectionData wrapper */;
function RecalculateProtectionData(Armor[] akWornGearMainFormsArray, Armor[] akWornGearFormsArray, int[] aiWornGearValuesArray, keyword akWornGearData)
    if GetSKSELoaded()
        RecalculateProtectionData_SKSE(akWornGearMainFormsArray, akWornGearFormsArray, aiWornGearValuesArray, akWornGearData)
    else
        RecalculateProtectionData_Vanilla(akWornGearMainFormsArray, akWornGearFormsArray, aiWornGearValuesArray)
    endif
endFunction


function RecalculateProtectionData_SKSE(Armor[] akWornGearMainFormsArray, Armor[] akWornGearFormsArray, int[] aiWornGearValuesArray, keyword akWornGearData)
    ;/
        Iterates over a "table" of values in the form below to determine total Warmth and Coverage.
    /;
    ; | _Frost_WornGearData Index |  0   |     1     |    2     |     |    10     |    11    |
    ; |---------------------------|------|-----------|----------|-----|-----------|----------|
    ; | WornGearForms             | Type | Body Warm | Body Cov | ... | Misc Warm | Misc Cov |
    ; | "80145___Skyrim.esm"      | 1    | 60        | 0        |     | 0         | 0        |

    int i = 0
    int k = 0
    int key_count = 0
    int type_counter = -1
    int type_to_match = 1

    string[] dskeys = new String[31]

    ; Main body array
    while i < akWornGearMainFormsArray.Length
        if PlayerHasArmorEquipped(akWornGearMainFormsArray[i])
            dskeys[key_count] = handler.GetDatastoreKeyFromForm(akWornGearMainFormsArray[i])
            key_count += 1
        endif
        i += 1
    endWhile

    ; Accessory array
    int misc_count = ArrayCountArmor(akWornGearFormsArray)
    i = 0
    while i < misc_count
        if PlayerHasArmorEquipped(akWornGearFormsArray[i])
            dskeys[key_count] = handler.GetDatastoreKeyFromForm(akWornGearFormsArray[i])
            key_count += 1
        endif
        i += 1
    endWhile

    while k < 12
        int m = 0
        int column_value = 0

        type_counter += 1
        if type_counter == 2
            type_counter = 0
            type_to_match += 1
        endif

        bool gear_type_found = false
        while m < key_count && !gear_type_found
            ; This calculation can be out of sync with reality (queued events exit that 
            ; are not yet processed). The array will eventually be accurate after
            ; the next integrity check.
            int gear_type = StorageUtil.IntListGet(akWornGearData, dskeys[m], 0)
            int val = StorageUtil.IntListGet(akWornGearData, dskeys[m], k + 1)
    
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
            m += 1
        endWhile

        ; Result for this column
        aiWornGearValuesArray[k] = column_value
        k += 1
    endWhile
    
    ;Signal to the UI that we're ready for the "change" values to be updated.
    GetInterfaceHandler().InvalidateFetchedChangeRanges()
endFunction

function RecalculateProtectionData_Vanilla(Armor[] akWornGearMainFormsArray, Armor[] akWornGearFormsArray, int[] aiWornGearValuesArray)
    bool realHeadFound = false
    bool realCloakFound = false
    
    ; Clear the existing array.
    int j = 0
    while j < aiWornGearValuesArray.Length
        aiWornGearValuesArray[j] = 0
        j += 1
    endWhile

    int[] armorData
    if akWornGearMainFormsArray[4]
        realCloakFound = true
        armorData = handler.GetArmorProtectionData_Vanilla(akWornGearMainFormsArray[4], handler.GEARTYPE_CLOAK)
        aiWornGearValuesArray[8] = armorData[1]
        aiWornGearValuesArray[9] = armorData[2]
    endif

    if akWornGearMainFormsArray[1]
        realHeadFound = true
        armorData = handler.GetArmorProtectionData_Vanilla(akWornGearMainFormsArray[1], handler.GEARTYPE_HEAD)
        aiWornGearValuesArray[2] = armorData[1]
        aiWornGearValuesArray[3] = armorData[2]

        ; Check for extra cloak piece
        if !realCloakFound
            aiWornGearValuesArray[8] = armorData[11]
            aiWornGearValuesArray[9] = armorData[12]
        endif
    endif

    if akWornGearMainFormsArray[0]
        armorData = handler.GetArmorProtectionData_Vanilla(akWornGearMainFormsArray[0], handler.GEARTYPE_BODY)
        aiWornGearValuesArray[0] = armorData[1]
        aiWornGearValuesArray[1] = armorData[2]

        ; Check for extra head piece
        if !realHeadFound
            aiWornGearValuesArray[2] = armorData[5]
            aiWornGearValuesArray[3] = armorData[6]
        endif
        ; Check for extra cloak piece
        if !realCloakFound
            aiWornGearValuesArray[8] = armorData[11]
            aiWornGearValuesArray[9] = armorData[12]
        endif
    endif

    if akWornGearMainFormsArray[2]
        armorData = handler.GetArmorProtectionData_Vanilla(akWornGearMainFormsArray[2], handler.GEARTYPE_HANDS)
        aiWornGearValuesArray[4] = armorData[1]
        aiWornGearValuesArray[5] = armorData[2]
    endif

    if akWornGearMainFormsArray[3]
        armorData = handler.GetArmorProtectionData_Vanilla(akWornGearMainFormsArray[3], handler.GEARTYPE_FEET)
        aiWornGearValuesArray[6] = armorData[1]
        aiWornGearValuesArray[7] = armorData[2]
    endif

    int miscCount = ArrayCountArmor(akWornGearFormsArray)

    int i = 0
    while i < miscCount
        armorData = handler.GetArmorProtectionData_Vanilla(akWornGearFormsArray[i], handler.GEARTYPE_MISC)
        aiWornGearValuesArray[10] = aiWornGearValuesArray[10] + armorData[1]
        aiWornGearValuesArray[11] = aiWornGearValuesArray[11] + armorData[2]
        i += 1
    endWhile
endFunction

;/* DisplayWarmthCoverageNoSkyUIPkg wrapper */;
function DisplayWarmthCoverageNoSkyUIPkg(Armor akArmor, int aiGearType)
    if GetSKSELoaded()
        DisplayWarmthCoverageNoSkyUIPkg_SKSE(akArmor)
    else
        DisplayWarmthCoverageNoSkyUIPkg_Vanilla(akArmor, aiGearType)
    endif
endFunction

function DisplayWarmthCoverageNoSkyUIPkg_SKSE(Armor akArmor)
    if !akArmor
        return
    endif
    if !FrostUtil.GetCompatibilitySystem().isUIPackageInstalled && FrostfallRunning.GetValueInt() == 2
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
            ; Show the total warmth and coverage
            ; RegisterForSingleUpdate(3)
        endif
    endif
endFunction

function DisplayWarmthCoverageNoSkyUIPkg_Vanilla(Armor akArmor, int aiGearType)
    if !akArmor
        return
    endif
    if FrostfallRunning.GetValueInt() == 2
        int[] result = handler.GetTotalArmorProtectionValues(akArmor)
        if result[0] == 0 && result[1] == 0
            return
        endif
        if IsInMenuMode()
            if _Frost_Setting_Notifications_EquipmentValues.GetValueInt() == 2
                ;@TODO: Can -99 even happen anymore?
                if result[0] == -99
                    ;debug.notification(name + " - " + str.Warmth + " N/A, " + str.Coverage + " N/A")
                else
                    DisplaySingleGearProtectionNotification(result[0], result[1], aiGearType)
                endif
                waitingForMenuExit = true
            endif
        endif

        ; Show the total warmth and coverage
        ; RegisterForSingleUpdate(3)
    endif
endFunction

int function GetArmorProtectionCategory(int aiProtectionValue, int aiInterval1, int aiInterval2, int aiInterval3, int aiInterval4)
    if aiProtectionValue <= aiInterval1
        return 1
    elseif aiProtectionValue <= aiInterval2
        return 2
    elseif aiProtectionValue <= aiInterval3
        return 3
    elseif aiProtectionValue <= aiInterval4
        return 4
    elseif aiProtectionValue > aiInterval4
        return 5
    endif
endFunction

function DisplaySingleGearProtectionNotification(int aiWarmth, int aiCoverage, int aiGearType)
    int warmthCategory
    int coverageCategory

    if aiGearType == handler.GEARTYPE_BODY
        warmthCategory = GetArmorProtectionCategory(aiWarmth, 75, 125, 150, 180)
        coverageCategory = GetArmorProtectionCategory(aiCoverage, 35, 54, 72, 91)
    elseif aiGearType == handler.GEARTYPE_HEAD
        warmthCategory = GetArmorProtectionCategory(aiWarmth, 15, 30, 40, 50)
        coverageCategory = GetArmorProtectionCategory(aiCoverage, 14, 29, 43, 58)        
    elseif aiGearType == handler.GEARTYPE_HANDS
        warmthCategory = GetArmorProtectionCategory(aiWarmth, 9, 12, 15, 21)
        coverageCategory = GetArmorProtectionCategory(aiCoverage, 6, 14, 21, 29)
    elseif aiGearType == handler.GEARTYPE_FEET
        warmthCategory = GetArmorProtectionCategory(aiWarmth, 7, 12, 15, 21)
        coverageCategory = GetArmorProtectionCategory(aiCoverage, 6, 14, 21, 29)
    elseif aiGearType == handler.GEARTYPE_CLOAK || aiGearType == handler.GEARTYPE_MISC
        warmthCategory = GetArmorProtectionCategory(aiWarmth, 6, 12, 20, 30)
        coverageCategory = GetArmorProtectionCategory(aiCoverage, 6, 12, 20, 30)
    endif

    if warmthCategory == 1
        if coverageCategory == 1
            _Frost_ProtArmor_Poor_Poor.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 2
            _Frost_ProtArmor_Poor_Fair.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 3
            _Frost_ProtArmor_Poor_Good.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 4
            _Frost_ProtArmor_Poor_Excellent.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 5
            _Frost_ProtArmor_Poor_Max.Show(aiWarmth, aiCoverage)
        endif
    elseif warmthCategory == 2
        if coverageCategory == 1
            _Frost_ProtArmor_Fair_Poor.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 2
            _Frost_ProtArmor_Fair_Fair.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 3
            _Frost_ProtArmor_Fair_Good.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 4
            _Frost_ProtArmor_Fair_Excellent.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 5
            _Frost_ProtArmor_Fair_Max.Show(aiWarmth, aiCoverage)
        endif
    elseif warmthCategory == 3
        if coverageCategory == 1
            _Frost_ProtArmor_Good_Poor.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 2
            _Frost_ProtArmor_Good_Fair.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 3
            _Frost_ProtArmor_Good_Good.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 4
            _Frost_ProtArmor_Good_Excellent.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 5
            _Frost_ProtArmor_Good_Max.Show(aiWarmth, aiCoverage)
        endif
    elseif warmthCategory == 4
        if coverageCategory == 1
            _Frost_ProtArmor_Excellent_Poor.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 2
            _Frost_ProtArmor_Excellent_Fair.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 3
            _Frost_ProtArmor_Excellent_Good.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 4
            _Frost_ProtArmor_Excellent_Excellent.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 5
            _Frost_ProtArmor_Excellent_Max.Show(aiWarmth, aiCoverage)
        endif
    elseif warmthCategory == 5
        if coverageCategory == 1
            _Frost_ProtArmor_Max_Poor.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 2
            _Frost_ProtArmor_Max_Fair.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 3
            _Frost_ProtArmor_Max_Good.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 4
            _Frost_ProtArmor_Max_Excellent.Show(aiWarmth, aiCoverage)
        elseif coverageCategory == 5
            _Frost_ProtArmor_Max_Max.Show(aiWarmth, aiCoverage)
        endif
    endif
endFunction


;/* DisplayWarmthCoverageNoSkyUIPkgRemove wrapper */;
function DisplayWarmthCoverageNoSkyUIPkgRemove(Armor akArmor)
    if GetSKSELoaded()
        DisplayWarmthCoverageNoSkyUIPkgRemove_SKSE(akArmor)
    else
        DisplayWarmthCoverageNoSkyUIPkgRemove_Vanilla(akArmor)
    endif
endFunction

function DisplayWarmthCoverageNoSkyUIPkgRemove_SKSE(Armor akArmor)
    if !akArmor
        return
    endif
    if !FrostUtil.GetCompatibilitySystem().isUIPackageInstalled && FrostfallRunning.GetValueInt() == 2
        int[] result = handler.GetTotalArmorProtectionValues(akArmor)
        if result[0] == 0 && result[1] == 0
            return
        endif
        if UI.IsMenuOpen("InventoryMenu")
            RegisterForMenu("InventoryMenu")
        else
            ; Show the total warmth and coverage
            ; RegisterForSingleUpdate(3)
        endif
    endif
endFunction

function DisplayWarmthCoverageNoSkyUIPkgRemove_Vanilla(Armor akArmor)
    if !akArmor
        return
    endif
    if FrostfallRunning.GetValueInt() == 2
        int[] result = handler.GetTotalArmorProtectionValues(akArmor)
        if result[0] == 0 && result[1] == 0
            return
        endif
        if IsInMenuMode()
            waitingForMenuExit = true
        endif
        
        ; Show the total warmth and coverage
        ; RegisterForSingleUpdate(3)
    endif
endFunction


;***
;*** Pure vanilla functions
;***

function WornGearFormsIntegrityCheck(Armor[] akWornGearFormsArray, Armor[] akWornGearMainFormsArray)
    int removed = 0
    int i = 0
    int j = 0
    
    debug.trace("[Frostfall] Beginning worn gear integrity check.")

    while i < akWornGearMainFormsArray.Length
        Armor the_armor = akWornGearMainFormsArray[i]
        if the_armor
            if !PlayerRef.IsEquipped(the_armor)
                ArrayRemoveArmor(akWornGearMainFormsArray, the_armor, false)
                removed += 1
            endif
        endif
        i += 1
    endWhile

    int misc_key_count = ArrayCountArmor(akWornGearFormsArray)
    while j < misc_key_count
        Armor the_armor = akWornGearFormsArray[j]
        if !PlayerRef.IsEquipped(the_armor)
            ArrayRemoveArmor(akWornGearFormsArray, the_armor, true)
            removed += 1
        endif
        j += 1
    endWhile

    debug.trace("[Frostfall] Integrity check complete. Removed " + removed + " invalid forms from worn gear lists.")
endFunction

int function GetArmorWarmth(int[] aiWornGearValuesArray)
    return aiWornGearValuesArray[0] + aiWornGearValuesArray[2] + aiWornGearValuesArray[4] + aiWornGearValuesArray[6] + aiWornGearValuesArray[8] + aiWornGearValuesArray[10]
endFunction

int function GetArmorCoverage(int[] aiWornGearValuesArray)
    return aiWornGearValuesArray[1] + aiWornGearValuesArray[3] + aiWornGearValuesArray[5] + aiWornGearValuesArray[7] + aiWornGearValuesArray[9] + aiWornGearValuesArray[11]
endFunction


;***
;*** SKSE-only functions
;***

Event OnMenuClose(string menuName)
    if menuName == "InventoryMenu"
        if _Frost_Setting_Notifications_EquipmentSummary.GetValueInt() != 2
            UnregisterForMenu("InventoryMenu")
            return
        endif
        _Frost_ProtectionTotalsMsg.Show(GetPlayerWarmth(), GetPlayerCoverage())
        UnregisterForMenu("InventoryMenu")
    endif
EndEvent


;***
;*** Mod Events
;***

function SendEvent_UpdateWarmthAndCoverage(bool abDisplayTextUpdate)
    FallbackEventEmitter warmthEvent = GetEventEmitter_UpdateWarmth()
    FallbackEventEmitter coverageEvent = GetEventEmitter_UpdateCoverage()

    int handle = warmthEvent.Create("Frost_UpdateWarmth")
    if handle
        warmthEvent.PushBool(handle, abDisplayTextUpdate)
        warmthEvent.Send(handle)
    endif
    handle = coverageEvent.Create("Frost_UpdateCoverage")
    if handle
        coverageEvent.PushBool(handle, abDisplayTextUpdate)
        coverageEvent.Send(handle)
    endif
endFunction

function SendEvent_UpdateWarmth()
    FallbackEventEmitter warmthEvent = GetEventEmitter_UpdateWarmth()
    int handle = warmthEvent.Create("Frost_UpdateWarmth")
    if handle
        warmthEvent.Send(handle)
    endif
endFunction

bool function PlayerHasArmorEquipped(Armor akArmor)
    ; An alias for PlayerRef.IsEquipped().
    if !akArmor
        return false
    else
        return PlayerRef.IsEquipped(akArmor)
    endif
endFunction


;***
;*** Lilac Mock States
;***

int property mock_AddWornGearEntryForArmorEquipped_callcount = 0 auto hidden
int property mock_RemoveWornGearEntryForArmorUnequipped_callcount = 0 auto hidden

State mock_testObjectEquipped

    int function AddWornGearEntryForArmorEquipped(Armor akArmor, Armor[] akWornGearMainFormsArray, Armor[] akWornGearFormsArray, keyword akWornGearData)
        mock_AddWornGearEntryForArmorEquipped_callcount += 1
        return 0
    endFunction

    bool function RemoveWornGearEntryForArmorUnequipped(Armor akArmor, Armor[] akWornGearMainFormsArray, Armor[] akWornGearFormsArray, keyword akWornGearData)
        mock_RemoveWornGearEntryForArmorUnequipped_callcount += 1
        return false
    endFunction

    function SendEvent_UpdateWarmthAndCoverage(bool abDisplayTextUpdate)
        ; pass
    endFunction

    function DisplayWarmthCoverageNoSkyUIPkg(Armor akArmor, int aiGearType)
        ; pass
    endFunction

EndState

State mock_testRecalculateProtectionData
    bool function PlayerHasArmorEquipped(Armor akArmor)
        if akArmor
            return true
        else
            return false
        endif
    endFunction
endState
