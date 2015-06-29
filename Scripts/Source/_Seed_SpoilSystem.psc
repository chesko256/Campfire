scriptname _Seed_SpoilSystem extends Quest

import StringUtil

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

function GetNextSpoilStageForm(Form akBaseObject)
    if HasSpoilStage4Name(akBaseObject)
        return None
    elseif HasSpoilStage3Name(akBaseObject)

    elseif HasSpoilStage2Name(akBaseObject)

    else

    endif
endFunction

; TABLE FUNCTIONS

; PerishableFoodDefinitionTable
;
; FoodSpoilStage1 | FoodSpoilStage2 | FoodSpoilStage3 | FoodSpoilStage4 | SpoilRate |
; ================|=================|=================|=================|===========|
; Bread           | Old Bread       | Moldy Bread     | Foul Bread      | 24.0      |

int function PerishableFoodDefinitionTable_AddRow(Form food_stage1, Form food_stage2, Form food_stage3, Form food_stage4, float rate, int cursor = None)
    if !cursor
        cursor = PerishableFoodDefinitionTable_FindAvailableIndex()
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

int function PerishableFoodDefinitionTable_FindAvailableIndex()
    int index = FoodSpoilStage1_1.Find(None)
    if index == -1
        index = FoodSpoilStage1_2.Find(None)
        if index == -1
            return -1
        else
            return index + 128
        endif
    else
        return index
    endif
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