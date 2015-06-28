scriptname _Seed_SpoilSystem extends Quest

ObjectReference[] property DroppedFood auto hidden
ObjectReference[] property TrackedFoodContainers auto hidden

Function Initialize()
    DroppedFoodList = new ObjectReference[128]
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
    
endFunction

function ProcessTrackedContainers()

endFunction

bool function ArrayAdd(ObjectReference[] myArray, ObjectReference ref)
    int index = myArray.Find(None)
    if index >= 0
        myArray[index] = ref
        return true
    else
        return false
    endif
endFunction