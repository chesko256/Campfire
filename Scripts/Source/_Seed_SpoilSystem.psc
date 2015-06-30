scriptname _Seed_SpoilSystem extends Quest

import StringUtil

bool property initialized = false auto hidden
ObjectReference[] property DroppedFood_Reference auto hidden
ObjectReference[] property DroppedFood_LastInterval auto hidden

ObjectReference[] property TrackedFoodContainers auto hidden

; TrackedFoodTable
Form[] TrackedFoodBaseObject_1
Form[] TrackedFoodBaseObject_2
int[] PerishableFoodID_1
int[] PerishableFoodID_2
int[] TrackedFoodCount_1
int[] TrackedFoodCount_2
int[] LastInterval_1
int[] LastInterval_2
ObjectReference[] Container_1
ObjectReference[] Container_2
ObjectReference[] TrackedFoodReference_1
ObjectReference[] TrackedFoodReference_2

int COL_FOOD_FORM = 100
int COL_PERISHABLEFOODID_FK = 101
int COL_FOOD_COUNT = 102
int COL_LAST_INTERVAL = 103
int COL_CONTAINER = 104
int COL_FOOD_REFERENCE = 105

; PerishableFoodTable
Form[] FoodSpoilStage1_1
Form[] FoodSpoilStage1_2
Form[] FoodSpoilStage2_1
Form[] FoodSpoilStage2_2
Form[] FoodSpoilStage3_1
Form[] FoodSpoilStage3_2
Form[] FoodSpoilStage4_1
Form[] FoodSpoilStage4_2
Int[] FoodSpoilRate_1
Int[] FoodSpoilRate_2

int COL_FOOD_SPOIL_STAGE1 = 200
int COL_FOOD_SPOIL_STAGE2 = 201
int COL_FOOD_SPOIL_STAGE3 = 202
int COL_FOOD_SPOIL_STAGE4 = 203
int COL_FOOD_SPOIL_RATE = 204

; Spoil Rate = Spoil every x 3 hour intervals
GlobalVariable property _Seed_SpoilRate_RawMeat auto                ; 1
GlobalVariable property _Seed_SpoilRate_FruitVegetables auto        ; 12
GlobalVariable property _Seed_SpoilRate_Cheese auto                 ; 12
GlobalVariable property _Seed_SpoilRate_BreadSweets auto            ; 8
GlobalVariable property _Seed_SpoilRate_CookedFood auto             ; 4


Function Initialize()
    DroppedFood = new ObjectReference[128]
    TrackedFoodContainers = new ObjectReference[32]

    FoodSpoilStage1_1 = new Form[128]
    FoodSpoilStage1_2 = new Form[128]
    FoodSpoilStage2_1 = new Form[128]
    FoodSpoilStage2_2 = new Form[128]
    FoodSpoilStage3_1 = new Form[128]
    FoodSpoilStage3_2 = new Form[128]
    FoodSpoilStage4_1 = new Form[128]
    FoodSpoilStage4_2 = new Form[128]
    FoodSpoilRate_1 = new Int[128]
    FoodSpoilRate_2 = new Int[128]
    initialized = true
endFunction

function HandleDroppedFood(ObjectReference akFood)
    ; if food is in the perishable food list
        ArrayAdd(DroppedFood, akFood)
    ; endif
endFunction

function AddTrackedContainer(ObjectReference akContainer)
    ; if valid (i.e. is not a 'refrigerator' or other spoilage-suspending container)
        ArrayAdd(TrackedFoodContainers, akContainer)
    ; endif
endFunction

function ProcessDroppedFood()
    int i = 0
    while i < DroppedFood.Length
        if DroppedFood[i]
            ; do things to DroppedFood[i]
        endif
        i += 1
    endWhile
endFunction

function ProcessTrackedContainers()
    ; Need to determine periodicity before we can write this
endFunction

function ProcessTrackedContainer(ObjectReference akContainer)
    int item_count = akContainer.GetNumItems()
    int i = 0
    while i < item_count
        Form this_form = akContainer.GetNthForm(i)
        ; do things to this_form, replace if needed on degradation path
        i += 1
    endWhile
endFunction

Form function GetNextSpoilStageForm(Form akBaseObject)
    int index
    if HasSpoilStage4Name(akBaseObject)
        return None
    elseif HasSpoilStage3Name(akBaseObject)
        index = PerishableFoodTable_FindFormInColumn(akBaseObject, COL_FOOD_SPOIL_STAGE3)
        if index != -1
            PerishableFoodTable_GetFoodAtIndexColumn(index, COL_FOOD_SPOIL_STAGE4)
        endif
    elseif HasSpoilStage2Name(akBaseObject)
        index = PerishableFoodTable_FindFormInColumn(akBaseObject, COL_FOOD_SPOIL_STAGE2)
        if index != -1
            PerishableFoodTable_GetFoodAtIndexColumn(index, COL_FOOD_SPOIL_STAGE3)
        endif
    else
        index = PerishableFoodTable_FindFormInColumn(akBaseObject, COL_FOOD_SPOIL_STAGE1)
        if index != -1
            PerishableFoodTable_GetFoodAtIndexColumn(index, COL_FOOD_SPOIL_STAGE2)
        endif
    endif
endFunction

Int function GetSpoilRateByForm(Form akBaseObject)
    int index
    if HasSpoilStage4Name(akBaseObject)
        index = PerishableFoodTable_FindFormInColumn(akBaseObject, COL_FOOD_SPOIL_STAGE4)
        if index != -1
            return PerishableFoodTable_GetSpoilRateAtIndex(index)
        endif
    elseif HasSpoilStage3Name(akBaseObject)
        index = PerishableFoodTable_FindFormInColumn(akBaseObject, COL_FOOD_SPOIL_STAGE3)
        if index != -1
            return PerishableFoodTable_GetSpoilRateAtIndex(index)
        endif
    elseif HasSpoilStage2Name(akBaseObject)
        index = PerishableFoodTable_FindFormInColumn(akBaseObject, COL_FOOD_SPOIL_STAGE2)
        if index != -1
            return PerishableFoodTable_GetSpoilRateAtIndex(index)
        endif
    else
        index = PerishableFoodTable_FindFormInColumn(akBaseObject, COL_FOOD_SPOIL_STAGE1)
        if index != -1
            return PerishableFoodTable_GetSpoilRateAtIndex(index)
        endif
    endif
    return -1.0
endFunction

int function GetSpoilRateByIndex(int index)
    return BigArrayGetIntAtIndex_Do(index, FoodSpoilRate_1, FoodSpoilRate_2)
endFunction

Int function GetPerishableFoodIndex(Form akBaseObject)
    int index
    if HasSpoilStage4Name(akBaseObject)
        index = PerishableFoodTable_FindFormInColumn(akBaseObject, COL_FOOD_SPOIL_STAGE4)
        if index != -1
            return index
        endif
    elseif HasSpoilStage3Name(akBaseObject)
        index = PerishableFoodTable_FindFormInColumn(akBaseObject, COL_FOOD_SPOIL_STAGE3)
        if index != -1
            return index
        endif
    elseif HasSpoilStage2Name(akBaseObject)
        index = PerishableFoodTable_FindFormInColumn(akBaseObject, COL_FOOD_SPOIL_STAGE2)
        if index != -1
            return index
        endif
    else
        index = PerishableFoodTable_FindFormInColumn(akBaseObject, COL_FOOD_SPOIL_STAGE1)
        if index != -1
            return index
        endif
    endif
    return -1.0
endFunction

; TABLE FUNCTIONS

; PerishableFoodTable
; FoodSpoilStage1 | FoodSpoilStage2 | FoodSpoilStage3 | FoodSpoilStage4 | SpoilRate |
; ================|=================|=================|=================|===========|
; Bread           | Old Bread       | Moldy Bread     | Foul Bread      | 6         |

int function PerishableFoodTable_AddRow(Form food_stage1, Form food_stage2, Form food_stage3, Form food_stage4, int rate, int cursor = None)
    if !cursor
        cursor = PerishableFoodTable_FindAvailableIndex()
        if cursor == -1
            ;@TODO: Log error
            return
        endif
    endif
    PerishableFoodTable_BigArrayAdd(COL_FOOD_SPOIL_STAGE1, cursor, akBaseObject = food_stage1)
    PerishableFoodTable_BigArrayAdd(COL_FOOD_SPOIL_STAGE2, cursor, akBaseObject = food_stage2)
    PerishableFoodTable_BigArrayAdd(COL_FOOD_SPOIL_STAGE3, cursor, akBaseObject = food_stage3)
    PerishableFoodTable_BigArrayAdd(COL_FOOD_SPOIL_STAGE4, cursor, akBaseObject = food_stage4)
    PerishableFoodTable_BigArrayAdd(COL_FOOD_SPOIL_RATE, cursor, afRate = rate)
    return cursor
endFunction

int function PerishableFoodTable_FindFormInColumn(Form akBaseObject, int BigArrayID)
    if BigArrayID == COL_FOOD_SPOIL_STAGE1
        return BigArrayFindForm_Do(akBaseObject, FoodSpoilStage1_1, FoodSpoilStage1_2)
    elseif BigArrayID == COL_FOOD_SPOIL_STAGE2
        return BigArrayFindForm_Do(akBaseObject, FoodSpoilStage2_1, FoodSpoilStage2_2)
    elseif BigArrayID == COL_FOOD_SPOIL_STAGE3
        return BigArrayFindForm_Do(akBaseObject, FoodSpoilStage3_1, FoodSpoilStage3_2)
    elseif BigArrayID == COL_FOOD_SPOIL_STAGE4
        return BigArrayFindForm_Do(akBaseObject, FoodSpoilStage4_1, FoodSpoilStage4_2)
    endif
endFunction

Form function PerishableFoodTable_GetFoodAtIndexColumn(int index, int col)
    if col == COL_FOOD_SPOIL_STAGE1
        return BigArrayGetFormAtIndex_Do(index, FoodSpoilStage1_1, FoodSpoilStage1_2)
    elseif col == COL_FOOD_SPOIL_STAGE2
        return BigArrayGetFormAtIndex_Do(index, FoodSpoilStage2_1, FoodSpoilStage2_2)
    elseif col == COL_FOOD_SPOIL_STAGE3
        return BigArrayGetFormAtIndex_Do(index, FoodSpoilStage3_1, FoodSpoilStage3_2)
    elseif col == COL_FOOD_SPOIL_STAGE4
        return BigArrayGetFormAtIndex_Do(index, FoodSpoilStage4_1, FoodSpoilStage4_2)
    endif
endFunction

int function PerishableFoodTable_FindAvailableIndex()
    return BigArrayFindForm_Do(None, FoodSpoilStage1_1, FoodSpoilStage1_2)
endFunction

; TrackedFoodTable
; akBaseObject    | PerishableFoodID (FK) | Count | Last Interval | Container  | Reference  |
; ================|=======================|=======|===============|============|============|
; FoodApple       | 0                     | 3     | 417           | None       | 0xFF000011 |
; FoodCabbage     | 9                     | 1     | 316           | 0x0105674b | None       |
; FoodUnknown     | -1                    | 4     | 525           | 0x0000000f | None       |

int function TrackedFoodTable_AddRow(Form akFood, int aiCount, int aiLastInterval, ObjectReference akContainer, ObjectReference akFoodRef)
    if !cursor
        cursor = TrackedFoodTable_FindAvailableIndex()
        if cursor == -1
            ;@TODO: Log error
            return
        endif
    endif
    TrackedFoodTable_BigArrayAdd(COL_FOOD_FORM, cursor, akBaseObject = akFood)
    TrackedFoodTable_BigArrayAdd(COL_PERISHABLEFOODID_FK, cursor, aiValue = GetPerishableFoodIndex(akFood))
    TrackedFoodTable_BigArrayAdd(COL_FOOD_COUNT, cursor, aiValue = aiCount)
    TrackedFoodTable_BigArrayAdd(COL_LAST_INTERVAL, cursor, aiValue = aiLastInterval)
    TrackedFoodTable_BigArrayAdd(COL_CONTAINER, cursor, akReference = akContainer)
    TrackedFoodTable_BigArrayAdd(COL_FOOD_REFERENCE, cursor, akReference = akFoodRef)
    return cursor
endFunction

function TrackedFoodTable_UpdateRow(int index, Form akFood = None, int aiPerishableFoodID = None, int aiNewCount = None, int aiNewLastInterval = None, ObjectReference akNewContainer = None, ObjectReference akNewFoodRef = None)
    if akFood
        BigArrayAddForm_Do(index, akFood, TrackedFoodBaseObject_1, TrackedFoodBaseObject_2)
    endif
    if aiPerishableFoodID
        BigArrayAddInt_Do(index, aiPerishableFoodID, PerishableFoodID_1, PerishableFoodID_2)
    endif
    if aiNewCount
        BigArrayAddInt_Do(index, aiNewCount, TrackedFoodCount_1, TrackedFoodCount_2)
    endif
    if aiNewLastInterval
        BigArrayAddInt_Do(index, aiNewLastInterval, LastInterval_1, LastInterval_2)
    endif
    if akNewContainer
        BigArrayAddRef_Do(index, akNewContainer, Container_1, Container_2)
    endif
    if akNewFoodRef
        BigArrayAddRef_Do(index, akNewFoodRef, TrackedFoodReference_1, TrackedFoodReference_2)
    endif
endFunction

function TrackedFoodTable_RemoveRow(int index)
    BigArrayClearForm_Do(index, TrackedFoodBaseObject_1, TrackedFoodBaseObject_2)
    BigArrayClearInt_Do(index, PerishableFoodID_1, PerishableFoodID_2)
    BigArrayClearInt_Do(index, TrackedFoodCount_1, TrackedFoodCount_2)
    BigArrayClearInt_Do(index, LastInterval_1, LastInterval_2)
    BigArrayClearRef_Do(index, Container_1, Container_2)
    BigArrayClearRef_Do(index, TrackedFoodReference_1, TrackedFoodReference_2)
    TrackedFoodTable_SortByOldest()
endFunction

function TrackedFoodTable_SortByOldest()
    ;From https://en.wikipedia.org/wiki/Selection_sort, converted to Papyrus
    int i
    int j = 0
    int iMin
    int n = 256
    while j < n - 1
        iMin = j
        i = j + 1
        while i < n
            ; fix
            int i_val = BigArrayGetIntAtIndex_Do(i, LastInterval_1, LastInterval_2)
            int iMin_val = BigArrayGetIntAtIndex_Do(iMin, LastInterval_1, LastInterval_2)
            if i_val < iMin_val || (i_val != None && iMin_val == None)
                iMin = i
            endif
            i += 1
        endWhile
        if iMin != j
            ; Get row j values
            Form temp_food = BigArrayGetFormAtIndex_Do(j, TrackedFoodBaseObject_1, TrackedFoodBaseObject_2)
            int temp_perishablefoodid = BigArrayGetIntAtIndex_Do(j, PerishableFoodID_1, PerishableFoodID_2)
            int temp_count = BigArrayGetIntAtIndex_Do(j, TrackedFoodCount_1, TrackedFoodCount_2)
            int temp_lastinterval = BigArrayGetIntAtIndex_Do(j, LastInterval_1, LastInterval_2)
            ObjectReference temp_container = BigArrayGetRefAtIndex_Do(j, Container_1, Container_2)
            ObjectReference temp_reference = BigArrayGetRefAtIndex_Do(j, TrackedFoodReference_1, TrackedFoodReference_2)

            ; Get row iMin values
            Form min_food = BigArrayGetFormAtIndex_Do(iMin, TrackedFoodBaseObject_1, TrackedFoodBaseObject_2)
            int min_perishablefoodid = BigArrayGetIntAtIndex_Do(iMin, PerishableFoodID_1, PerishableFoodID_2)
            int min_count = BigArrayGetIntAtIndex_Do(iMin, TrackedFoodCount_1, TrackedFoodCount_2)
            int min_lastinterval = BigArrayGetIntAtIndex_Do(iMin, LastInterval_1, LastInterval_2)
            ObjectReference min_container = BigArrayGetRefAtIndex_Do(iMin, Container_1, Container_2)
            ObjectReference min_reference = BigArrayGetRefAtIndex_Do(iMin, TrackedFoodReference_1, TrackedFoodReference_2)

            ; Swap row j values with row iMin values
            TrackedFoodTable_UpdateRow(j, min_food, min_perishablefoodid, min_count, min_lastinterval, min_container, min_reference)
            TrackedFoodTable_UpdateRow(iMin, temp_food, temp_perishablefoodid, temp_count, temp_lastinterval, temp_container, temp_reference)
        endif
        j += 1
    endWhile
endFunction

int function TrackedFoodTable_FindAvailableIndex()
    return BigArrayFindForm_Do(None, TrackedFoodBaseObject_1, TrackedFoodBaseObject_2)
endFunction

; BIG ARRAY FUNCTIONS

function PerishableFoodTable_BigArrayAdd(int BigArrayID, int index, Form akBaseObject = None, Int aiValue = 0)
    if BigArrayID == COL_FOOD_SPOIL_STAGE1
        BigArrayAddForm_Do(index, akBaseObject, FoodSpoilStage1_1, FoodSpoilStage1_2)
    elseif BigArrayID == COL_FOOD_SPOIL_STAGE2
        BigArrayAddForm_Do(index, akBaseObject, FoodSpoilStage2_1, FoodSpoilStage2_2)
    elseif BigArrayID == COL_FOOD_SPOIL_STAGE3
        BigArrayAddForm_Do(index, akBaseObject, FoodSpoilStage3_1, FoodSpoilStage3_2)
    elseif BigArrayID == COL_FOOD_SPOIL_STAGE4
        BigArrayAddForm_Do(index, akBaseObject, FoodSpoilStage4_1, FoodSpoilStage4_2)
    elseif BigArrayID == COL_FOOD_SPOIL_RATE
        BigArrayAddInt_Do(index, aiValue, FoodSpoilRate_1, FoodSpoilRate_2)
    endif
endFunction

function TrackedFoodTable_BigArrayAdd(int BigArrayID, int index, Form akBaseObject = None, int aiValue = None, ObjectReference akReference = None)
    if BigArrayID == COL_FOOD_FORM
        BigArrayAddForm_Do(index, akBaseObject, TrackedFoodBaseObject_1, TrackedFoodBaseObject_2)
    elseif BigArrayID == COL_PERISHABLEFOODID_FK
        BigArrayAddForm_Do(index, aiValue, PerishableFoodID_1, PerishableFoodID_2)
    elseif BigArrayID == COL_FOOD_COUNT
        BigArrayAddInt_Do(index, aiValue, TrackedFoodCount_1, TrackedFoodCount_2)
    elseif BigArrayID == COL_LAST_INTERVAL
        BigArrayAddInt_Do(index, aiValue, LastInterval_1, LastInterval_2)
    elseif BigArrayID == COL_CONTAINER
        BigArrayAddRef_Do(index, akReference, Container_1, Container_2)
    elseif BigArrayID == COL_FOOD_REFERENCE
        BigArrayAddRef_Do(index, akReference, TrackedFoodReference_1, TrackedFoodReference_2)
    endif
endFunction

int function BigArrayFindForm_Do(Form akBaseObject, Form[] array1, Form[] array2)
    int index = array1.Find(akBaseObject)
    if index == -1
        index = array2.Find(akBaseObject)
        if index == -1
            return -1
        else
            return index + 128
        endif
    else
        return index
    endif
endFunction

Form function BigArrayGetFormAtIndex_Do(int index, Form[] array1, Form[] array2)
    if index > 127
        index = index - 128
        return array2[index]
    else
        return array1[index]
    endif
endFunction

Int function BigArrayGetIntAtIndex_Do(int index, Int[] array1, Int[] array2)
    if index > 127
        index = index - 128
        return array2[index]
    else
        return array1[index]
    endif
endFunction

ObjectReference function BigArrayGetRefAtIndex_Do(int index, ObjectReference[] array1, ObjectReference[] array2)
    if index > 127
        index = index - 128
        return array2[index]
    else
        return array1[index]
    endif
endFunction

function BigArrayAddForm_Do(int index, Form akBaseObject, Form[] array1, Form[] array2)
    if index > 254
        ;@TODO: Log error
        return
    endif
    if index > 127
        array2[(128 - index)] = akBaseObject
    else
        array1[index] = akBaseObject
    endif
endFunction

function BigArrayAddInt_Do(int index, Int aiValue, Int[] array1, Int[] array2)
    if index > 254
        ;@TODO: Log error
        return
    endif
    if index > 127
        array2[(128 - index)] = aiValue
    else
        array1[index] = aiValue
    endif
endFunction

function BigArrayAddRef_Do(int index, ObjectReference akReference, ObjectReference[] array1, ObjectReference[] array2)
    if index > 254
        ;@TODO: Log error
        return
    endif
    if index > 127
        array2[(128 - index)] = akReference
    else
        array1[index] = akReference
    endif
endFunction

function BigArrayClearForm_Do(int index, Form[] array1, Form[] array2)
    if index > 254
        ;@TODO: Log error
        return
    endif
    if index > 127
        array2[(128 - index)] = None
    else
        array1[index] = None
    endif
endFunction

function BigArrayClearInt_Do(int index, Int[] array1, Int[] array2)
    if index > 254
        ;@TODO: Log error
        return
    endif
    if index > 127
        array2[(128 - index)] = None
    else
        array1[index] = None
    endif
endFunction

function BigArrayClearRef_Do(int index, ObjectReference[] array1, ObjectReference[] array2)
    if index > 254
        ;@TODO: Log error
        return
    endif
    if index > 127
        array2[(128 - index)] = None
    else
        array1[index] = None
    endif
endFunction

; ARRAY FUNCTIONS

bool function ArrayAdd(ObjectReference[] myArray, ObjectReference ref)
    int index = myArray.Find(None)
    if index >= 0
        myArray[index] = ref
        return true
    else
        return false
    endif
endFunction
