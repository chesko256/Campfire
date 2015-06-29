scriptname _Seed_SpoilSystem extends Quest

import StringUtil

bool property initialized = false auto hidden
ObjectReference[] property DroppedFood auto hidden
ObjectReference[] property TrackedFoodContainers auto hidden

Form[] property FoodSpoilStage1_1 auto hidden
Form[] property FoodSpoilStage1_2 auto hidden
Form[] property FoodSpoilStage2_1 auto hidden
Form[] property FoodSpoilStage2_2 auto hidden
Form[] property FoodSpoilStage3_1 auto hidden
Form[] property FoodSpoilStage3_2 auto hidden
Form[] property FoodSpoilStage4_1 auto hidden
Form[] property FoodSpoilStage4_2 auto hidden
float[] property FoodSpoilRate_1 auto hidden
float[] property FoodSpoilRate_2 auto hidden

int COL_FOOD_SPOIL_STAGE1 = 0
int COL_FOOD_SPOIL_STAGE2 = 1
int COL_FOOD_SPOIL_STAGE3 = 2
int COL_FOOD_SPOIL_STAGE4 = 3
int COL_FOOD_SPOIL_RATE = 4

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
    FoodSpoilRate_1 = new Float[128]
    FoodSpoilRate_2 = new Float[128]
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

float function GetSpoilRate(Form akBaseObject)
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

; TABLE FUNCTIONS

; PerishableFoodTable
;
; FoodSpoilStage1 | FoodSpoilStage2 | FoodSpoilStage3 | FoodSpoilStage4 | SpoilRate |
; ================|=================|=================|=================|===========|
; Bread           | Old Bread       | Moldy Bread     | Foul Bread      | 24.0      |

int function PerishableFoodTable_AddRow(Form food_stage1, Form food_stage2, Form food_stage3, Form food_stage4, float rate, int cursor = None)
    if !cursor
        cursor = PerishableFoodTable_FindAvailableIndex()
        if cursor == -1
            ;@TODO: Log error
            return
        endif
    endif
    BigArrayAdd(COL_FOOD_SPOIL_STAGE1, cursor, akBaseObject = food_stage1)
    BigArrayAdd(COL_FOOD_SPOIL_STAGE2, cursor, akBaseObject = food_stage2)
    BigArrayAdd(COL_FOOD_SPOIL_STAGE3, cursor, akBaseObject = food_stage3)
    BigArrayAdd(COL_FOOD_SPOIL_STAGE4, cursor, akBaseObject = food_stage4)
    BigArrayAdd(COL_FOOD_SPOIL_RATE, cursor, afRate = rate)
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

float function PerishableFoodTable_GetSpoilRateAtIndex(int index)
    return BigArrayGetFloatAtIndex_Do(index, FoodSpoilRate_1, FoodSpoilRate_2)
endFunction

int function PerishableFoodTable_FindAvailableIndex()
    return BigArrayFindForm_Do(None, FoodSpoilStage1_1, FoodSpoilStage1_2)
endFunction

; BIG ARRAY FUNCTIONS

function BigArrayAdd(int BigArrayID, int index, Form akBaseObject = None, Float afRate = 0.0)
    if BigArrayID == COL_FOOD_SPOIL_STAGE1
        BigArrayAddForm_Do(index, akBaseObject, FoodSpoilStage1_1, FoodSpoilStage1_2)
    elseif BigArrayID == COL_FOOD_SPOIL_STAGE2
        BigArrayAddForm_Do(index, akBaseObject, FoodSpoilStage2_1, FoodSpoilStage2_2)
    elseif BigArrayID == COL_FOOD_SPOIL_STAGE3
        BigArrayAddForm_Do(index, akBaseObject, FoodSpoilStage3_1, FoodSpoilStage3_2)
    elseif BigArrayID == COL_FOOD_SPOIL_STAGE4
        BigArrayAddForm_Do(index, akBaseObject, FoodSpoilStage4_1, FoodSpoilStage4_2)
    elseif BigArrayID == COL_FOOD_SPOIL_RATE
        BigArrayAddFloat_Do(index, afRate, FoodSpoilRate_1, FoodSpoilRate_2)
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

float function BigArrayGetFloatAtIndex_Do(int index, Float[] array1, Float[] array2)
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

function BigArrayAddFloat_Do(int index, float afFloat, Float[] array1, Float[] array2)
    if index > 254
        ;@TODO: Log error
        return
    endif
    if index > 127
        array2[(128 - index)] = afFloat
    else
        array1[index] = afFloat
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