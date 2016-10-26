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
Message property _Frost_ProtectionArmorDisplayBody auto
Message property _Frost_ProtectionArmorDisplayHead auto
Message property _Frost_ProtectionArmorDisplayHands auto
Message property _Frost_ProtectionArmorDisplayFeet auto
Message property _Frost_ProtectionArmorDisplayCloak auto
Message property _Frost_ProtectionArmorDisplayShield auto

_Frost_ArmorProtectionDatastoreHandler handler

bool waitingForMenuExit = false

function StartUp()
    handler = GetClothingDatastoreHandler()
    WornGearForms = new Armor[31]
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

    bool update_required = AddWornGearEntryForArmorEquipped(akBaseObject as Armor, WornGearForms, _Frost_WornGearData)
    ;debug.trace("update_required = " + update_required)
    DisplayWarmthCoverageNoSkyUIPkg(akBaseObject as Armor)
    return update_required
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
    bool update_required = RemoveWornGearEntryForArmorUnequipped(akBaseObject as Armor, WornGearForms, _Frost_WornGearData)
    DisplayWarmthCoverageNoSkyUIPkgRemove(akBaseObject as Armor)
    return update_required
endFunction

Event OnUpdate()
    ; Only runs if SKSE or the SkyUI Package is not installed. Displays
    ; total warmth and coverage in a message.

    if waitingForMenuExit
        if IsInMenuMode()
            RegisterForUpdate(1)
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
        _Frost_ProtectionTotalsMsg.Show(GetPlayerWarmth(), GetPlayerCoverage())
    endif
EndEvent


;***
;*** Wrapper functions
;***

;/* AddWornGearEntryForArmorEquipped wrapper */;
bool function AddWornGearEntryForArmorEquipped(Armor akArmor, Armor[] akWornGearFormsArray, keyword akWornGearData)
    if GetSKSELoaded()
        return AddWornGearEntryForArmorEquipped_SKSE(akArmor, akWornGearFormsArray, akWornGearData)
    Else
        return AddWornGearEntryForArmorEquipped_Vanilla(akArmor, akWornGearFormsArray)
    endif
endFunction

bool function AddWornGearEntryForArmorEquipped_SKSE(Armor akArmor, Armor[] akWornGearFormsArray, keyword akWornGearData)
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

bool function AddWornGearEntryForArmorEquipped_Vanilla(Armor akArmor, Armor[] akWornGearFormsArray)
    FrostDebug(0, "(Vanilla) Resolving " + akArmor + ".")
    int[] armor_data = handler.GetArmorProtectionData(akArmor)

    if armor_data[0] == handler.GEARTYPE_IGNORE
        return false
    endif

    ; Keep a running list of what I'm currently wearing.
    ; All worn gear values will be recalculated during update cycle.
    int idx = akWornGearFormsArray.Find(akArmor)
    if idx == -1
        ; plug the data in
        ArrayAddArmor(akWornGearFormsArray, akArmor)
        return true
    else
        return false
    endif
endFunction


;/* RemoveWornGearEntryForArmorUnequipped wrapper */;
bool function RemoveWornGearEntryForArmorUnequipped(Armor akArmor, Armor[] akWornGearFormsArray, keyword akWornGearData)
    if GetSKSELoaded()
        return RemoveWornGearEntryForArmorUnequipped_SKSE(akArmor, akWornGearFormsArray, akWornGearData)
    else
        return RemoveWornGearEntryForArmorUnequipped_Vanilla(akArmor, akWornGearFormsArray)
    endif
endFunction

bool function RemoveWornGearEntryForArmorUnequipped_SKSE(Armor akArmor, Armor[] akWornGearFormsArray, keyword akWornGearData)
    bool worn_gear_found = ArrayRemoveArmor(akWornGearFormsArray, akArmor, true)
    if worn_gear_found
        string dskey = handler.GetDatastoreKeyFromForm(akArmor)
        StorageUtil.IntListClear(akWornGearData, dskey)
        return true
    endif
    return false
endFunction

bool function RemoveWornGearEntryForArmorUnequipped_Vanilla(Armor akArmor, Armor[] akWornGearFormsArray)
    return ArrayRemoveArmor(akWornGearFormsArray, akArmor, true)
endFunction


;/* RefreshWornGearData wrapper */;
function RefreshWornGearData(Armor[] akWornGearFormsArray, keyword akWornGearData)
    if GetSKSELoaded()
        RefreshWornGearData_SKSE(akWornGearFormsArray, akWornGearData)
    else
        RefreshWornGearData_Vanilla(akWornGearFormsArray)
    endif
endFunction

function RefreshWornGearData_SKSE(Armor[] akWornGearFormsArray, keyword akWornGearData)
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

function RefreshWornGearData_Vanilla(Armor[] akWornGearFormsArray)
    ; Pull the latest values for all currently worn gear. (Player switched profiles, changed the JSON file
    ; by hand since they last loaded the game, etc)
    int i = 0
    int gear_count = ArrayCountArmor(akWornGearFormsArray)
    while i < gear_count
        ;@TODO
    endWhile
endFunction


;/* RecalculateProtectionData wrapper */;
function RecalculateProtectionData(Armor[] akWornGearFormsArray, int[] aiWornGearValuesArray, keyword akWornGearData)
    if GetSKSELoaded()
        RecalculateProtectionData_SKSE(akWornGearFormsArray, aiWornGearValuesArray, akWornGearData)
    else
        RecalculateProtectionData_Vanilla(akWornGearFormsArray, aiWornGearValuesArray)
    endif
endFunction

function RecalculateProtectionData_SKSE(Armor[] akWornGearFormsArray, int[] aiWornGearValuesArray, keyword akWornGearData)
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
    int d = 0
    int type_counter = -1
    int type_to_match = 1

    ; Pre-fetch the datastore keys for worn forms. Check if actually being worn.
    string[] dskeys = new String[31]
    while d < 31
        if d < key_count && PlayerHasArmorEquipped(akWornGearFormsArray[d])
            dskeys[d] = handler.GetDatastoreKeyFromForm(akWornGearFormsArray[d])
        endif
        d += 1
    endWhile

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
            ; This calculation can be out of sync with reality (queued events exit that 
            ; are not yet processed). The array will eventually be accurate after
            ; the next integrity check.
            int gear_type = StorageUtil.IntListGet(akWornGearData, dskeys[j], 0)
            int val = StorageUtil.IntListGet(akWornGearData, dskeys[j], i + 1)
    
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
        aiWornGearValuesArray[i] = column_value
        i += 1
    endWhile

    ;Signal to the UI that we're ready for the "change" values to be updated.
    GetInterfaceHandler().InvalidateFetchedChangeRanges()

    FrostDebug(0, "Worn Gear Values: " + aiWornGearValuesArray)
endFunction

function RecalculateProtectionData_Vanilla(Armor[] akWornGearFormsArray, int[] aiWornGearValuesArray)
    bool realHeadFound = false
    bool realCloakFound = false
    
    ; Clear the existing array.
    int j = 0
    while j < aiWornGearValuesArray.Length
        aiWornGearValuesArray[j] = 0
        j += 1
    endWhile

    int wornCount = ArrayCountArmor(akWornGearFormsArray)

    int i = 0
    while i < wornCount
        int[] armorData = handler.GetArmorProtectionData_Vanilla(akWornGearFormsArray[i])
        int gearType = armorData[0]

        if gearType == handler.GEARTYPE_BODY
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

        elseif gearType == handler.GEARTYPE_HEAD
            realHeadFound = true
            aiWornGearValuesArray[2] = armorData[1]
            aiWornGearValuesArray[3] = armorData[2]

            ; Check for extra cloak piece
            if !realCloakFound
                aiWornGearValuesArray[8] = armorData[11]
                aiWornGearValuesArray[9] = armorData[12]
            endif

        elseif gearType == handler.GEARTYPE_HANDS
            aiWornGearValuesArray[4] = armorData[1]
            aiWornGearValuesArray[5] = armorData[2]

        elseif gearType == handler.GEARTYPE_FEET
            aiWornGearValuesArray[6] = armorData[1]
            aiWornGearValuesArray[7] = armorData[2]

        elseif gearType == handler.GEARTYPE_CLOAK
            realCloakFound = true
            aiWornGearValuesArray[8] = armorData[1]
            aiWornGearValuesArray[9] = armorData[2]

        elseif gearType == handler.GEARTYPE_MISC
            aiWornGearValuesArray[8] = aiWornGearValuesArray[8] + armorData[1]
            aiWornGearValuesArray[9] = aiWornGearValuesArray[9] + armorData[2]
        endif

        i += 1
    endWhile
endFunction

;/* DisplayWarmthCoverageNoSkyUIPkg wrapper */;
function DisplayWarmthCoverageNoSkyUIPkg(Armor akArmor)
    if GetSKSELoaded()
        DisplayWarmthCoverageNoSkyUIPkg_SKSE(akArmor)
    else
        DisplayWarmthCoverageNoSkyUIPkg_Vanilla(akArmor)
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
            RegisterForSingleUpdate(1)
        endif
    endif
endFunction

function DisplayWarmthCoverageNoSkyUIPkg_Vanilla(Armor akArmor)
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
                    int type = handler.GetGearType_Vanilla(akArmor)
                    if type == handler.GEARTYPE_BODY
                        _Frost_ProtectionArmorDisplayBody.Show(result[0], result[1])
                    elseif type == handler.GEARTYPE_HEAD
                        _Frost_ProtectionArmorDisplayHead.Show(result[0], result[1])
                    elseif type == handler.GEARTYPE_HANDS
                        _Frost_ProtectionArmorDisplayHands.Show(result[0], result[1])
                    elseif type == handler.GEARTYPE_FEET
                        _Frost_ProtectionArmorDisplayFeet.Show(result[0], result[1])
                    elseif type == handler.GEARTYPE_CLOAK
                        _Frost_ProtectionArmorDisplayCloak.Show(result[0], result[1])
                    elseif type == handler.GEARTYPE_MISC
                        ;@TODO: If ArmorIsShield...
                        _Frost_ProtectionArmorDisplayShield.Show(result[0], result[1])
                    endif
                endif
                waitingForMenuExit = true
            endif
        endif

        ; Show the total warmth and coverage
        RegisterForSingleUpdate(1)
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
            RegisterForSingleUpdate(1)
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
        RegisterForSingleUpdate(1)
    endif
endFunction


;***
;*** Pure vanilla functions
;***

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

function SendEvent_UpdateWarmthAndCoverage()
    FallbackEventEmitter warmthEvent = GetEventEmitter_UpdateWarmth()
    FallbackEventEmitter coverageEvent = GetEventEmitter_UpdateCoverage()

    int handle = warmthEvent.Create("Frost_UpdateWarmth")
    if handle
        warmthEvent.Send(handle)
    endif
    handle = coverageEvent.Create("Frost_UpdateCoverage")
    if handle
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
    ; An alias for PlayerRef.IsEquipped(), to make testing easier.
    return PlayerRef.IsEquipped(akArmor)
endFunction


;***
;*** Lilac Mock States
;***

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
