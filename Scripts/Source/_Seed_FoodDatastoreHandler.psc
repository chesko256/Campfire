scriptname _Seed_FoodDatastoreHandler extends Quest
{ This script handles the lookup and storage of food data. Actual 
  hunger / thirst / spoilage logic is handled by their requisite
  systems. }

;/
	Food Datastore
	
	The store is an 8-array Linked Array that stores data using
	the pattern [WholeFood, ResultFood, QuantityFood, ...]
/;

import SeedUtil
import _SeedInternal

FormList[] property foodLists auto hidden
FormList property _Seed_Bread auto
FormList property _Seed_MeatRaw auto
FormList property _Seed_MeatCooked auto
FormList property _Seed_SmallGameRaw auto
FormList property _Seed_SmallGameCooked auto
FormList property _Seed_FishRaw auto
FormList property _Seed_FishCooked auto
FormList property _Seed_SeafoodRaw auto
FormList property _Seed_SeafoodCooked auto
FormList property _Seed_Vegetables auto
FormList property _Seed_Fruit auto
FormList property _Seed_Cheese auto
FormList property _Seed_Treats auto
FormList property _Seed_Pastries auto
FormList property _Seed_Stews auto
FormList property _Seed_CheeseBowls auto
FormList property _Seed_DrinkMilk auto
FormList property _Seed_DrinkAlcoholic auto
FormList property _Seed_DrinkNonAlcoholic auto
FormList property _Seed_Preserved auto

Potion property _Seed_Quantity2 auto
Potion property _Seed_Quantity8 auto

Potion[] multiPartFoodData1
Potion[] multiPartFoodData2
Potion[] multiPartFoodData3
Potion[] multiPartFoodData4
Potion[] multiPartFoodData5
Potion[] multiPartFoodData6
Potion[] multiPartFoodData7
Potion[] multiPartFoodData8

;/
	Public Functions
/;

int function IdentifyFood(Potion food)
	;@TODO: Check keywords first

	; Return values:
	;	0: Not found
	;	n: Food Type (see Food IDs)

	int i = 0
	while i < foodLists.Length
		if foodLists[i].HasForm(food)
			return i + 1
		else
			i += 1
		endif
	endWhile
	return 0
endFunction

function AddFoodIdentity(Potion food, int foodId)
	; Adds a food to a category. Uses the Food ID enum
	; as the foodId. Also removes it from any other category.

	if foodId < 1 || foodId > 19
		SeedDebug(3, "Attempted to set food " + food + " to type " + foodId + ", which is an invalid type.")
		SeedDebug(3, "If you are the author of the mod that used AddFoodIdentity(), check the food type in your code.")
		return
	endif

	int idx = foodId - 1
	foodLists[idx].AddForm(food)
	SeedDebug(1, "Set food " + food + " as type " + foodId)
endFunction

function RemoveFoodIdentity(Potion food, int foodId)
	; Removes a food from a category.

	int idx = foodId - 1
	foodLists[idx].RemoveAddedForm(food)
	SeedDebug(1, "Unset food " + food + " from type " + foodId)
endFunction

bool function IsFoodPreserved(Potion food)
	; Returns whether or not the food is preserved.

	if _Seed_Preserved.HasForm(food)
		return true
	else
		return false
	endif
endFunction

function SetFoodPreserved(Potion food, bool abIsPreserved = true)
	; Sets the preservation state of the food.

	if abIsPreserved
		_Seed_Preserved.AddForm(food)
	else
		_Seed_Preserved.RemoveAddedForm(food)
	endif
endFunction

function AddUpdateMultiPartFood(Potion akWholeFood, Potion akResultFood, int aiQuantity)
	
	; Adds food entries to linked array. If found, updates it with the supplied data.
	; Follows the pattern: WholeFood, ResultFood, QuantityFood, WholeFood, ResultFood, QuantityFood...

	int idx = LinkedArrayFindPotion(akWholeFood, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, \
								  			   	 multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)

	
	Potion quantity
	if aiQuantity == 2
		quantity = _Seed_Quantity2
	elseif aiQuantity == 8
		quantity = _Seed_Quantity8
	endif

	if idx == -1
		int newIdx = LinkedArrayAddPotion(akWholeFood, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, 		\
													   multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)
		LinkedArrayAddPotionAt(akResultFood, newIdx + 1, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, 	\
														 multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)
		LinkedArrayAddPotionAt(quantity, newIdx + 2, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, 	\
													     multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)
	endif

	if idx > -1
		; Update the existing entry
		LinkedArrayAddPotionAt(akResultFood, idx + 1, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, 		\
													  multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)
		LinkedArrayAddPotionAt(quantity, idx + 2, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, 		\
													  multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)
	endif
endFunction

function RemoveMultiPartFood(Potion akWholeFood)
	
	; Removes a food record from the table, if found. Resorts the table when complete.

	int idx = LinkedArrayRemovePotion(akWholeFood, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, \
								  			   	   multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8, false)

	if idx > -1
		LinkedArrayRemovePotionAt(idx + 1, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, 		\
										   multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)
		LinkedArrayRemovePotionAt(idx + 2, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, 		\
										   multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)
		LinkedArraySortPotions(			   multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, 		\
										   multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)
	endif
endFunction

Potion function GetMultiPartFoodResult(Potion akWholeFood)
	; Gets the result food of the given multi-part food. If not found, returns None.
	int idx = LinkedArrayFindPotion(akWholeFood, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, \
								  			   	 multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)

	if idx > -1
		return LinkedArrayGetPotionAt(idx + 1, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, \
								  			   multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)
	else
		return None
	endif
endFunction

Potion function GetMultiPartFoodFromIndex(int aiWholeFoodIndex)
	; Gets the result food relative to the multi-part food index.
	return LinkedArrayGetPotionAt(aiWholeFoodIndex + 1, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, \
											            multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)
endFunction

int function GetMultiPartFoodQuantity(Potion akWholeFood)
	; Gets the result food of the given multi-part food. If not found, returns -1.
	int idx = LinkedArrayFindPotion(akWholeFood, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, \
												 multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)

	if idx > -1
		Potion quantity = LinkedArrayGetPotionAt(idx + 2, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, \
								  				   		  multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)
		if quantity == _Seed_Quantity2
			return 2
		elseif quantity == _Seed_Quantity8
			return 8
		endif
	endif
endFunction

int function GetMultiPartFoodQuantityFromIndex(int aiWholeFoodIndex)
	; Gets the result food relative to the multi-part food index.
	Potion quantity = LinkedArrayGetPotionAt(aiWholeFoodIndex + 2, multiPartFoodData1, multiPartFoodData2, multiPartFoodData3, multiPartFoodData4, \
																   multiPartFoodData5, multiPartFoodData6, multiPartFoodData7, multiPartFoodData8)
	if quantity == _Seed_Quantity2
		return 2
	elseif quantity == _Seed_Quantity8
		return 8
	endif
endFunction

;/
	System Management
/;

function StartSystem()
	if !self.IsRunning()
		self.Start()
	endif
	InitializeArrays()
	; CreateFoodKeywordValueMaps()
endFunction

function StopSystem()
	if self.IsRunning()
		self.Stop()
	endif
endFunction

function InitializeArrays()
	multiPartFoodData1 = new Potion[128]
	multiPartFoodData2 = new Potion[128]
	multiPartFoodData3 = new Potion[128]
	multiPartFoodData4 = new Potion[128]
	multiPartFoodData5 = new Potion[128]
	multiPartFoodData6 = new Potion[128]
	multiPartFoodData7 = new Potion[128]
	multiPartFoodData8 = new Potion[128]

	foodLists = new FormList[19]
	foodLists[0] = _Seed_Bread
	foodLists[1] = _Seed_MeatRaw
	foodLists[2] = _Seed_MeatCooked
	foodLists[3] = _Seed_SmallGameRaw
	foodLists[4] = _Seed_SmallGameCooked
	foodLists[5] = _Seed_FishRaw
	foodLists[6] = _Seed_FishCooked
	foodLists[7] = _Seed_SeafoodRaw
	foodLists[8] = _Seed_SeafoodCooked
	foodLists[9] = _Seed_Vegetables
	foodLists[10] = _Seed_Fruit
	foodLists[11] = _Seed_Cheese
	foodLists[12] = _Seed_Treats
	foodLists[13] = _Seed_Pastries
	foodLists[14] = _Seed_Stews
	foodLists[15] = _Seed_CheeseBowls
	foodLists[16] = _Seed_DrinkMilk
	foodLists[17] = _Seed_DrinkAlcoholic
	foodLists[18] = _Seed_DrinkNonAlcoholic
endFunction

;/
	Linked Array Functions
/;

int function LinkedArrayAddPotion(Potion akPotion, Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
													Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8)
    ; Adds a form to the first available element in the first available array
	; associated with this ArrayID.

	; Return values
    ;	-1 	=	Failed (Linked array full)
    ;	n 	= 	New element index

    int idx = -1
    idx = akArray1.Find(none)
    if idx != -1
    	akArray1[idx] = akPotion
    	return idx
    endif

    idx = -1
    idx = akArray2.Find(none)
    if idx != -1
    	akArray2[idx] = akPotion
    	return idx + 128
    endif

    idx = -1
    idx = akArray3.Find(none)
    if idx != -1
    	akArray3[idx] = akPotion
    	return idx + 256
    endif

    idx = -1
    idx = akArray4.Find(none)
    if idx != -1
    	akArray4[idx] = akPotion
    	return idx + 384
    endif

    idx = -1
    idx = akArray5.Find(none)
    if idx != -1
    	akArray5[idx] = akPotion
    	return idx + 512
    endif

    idx = -1
    idx = akArray6.Find(none)
    if idx != -1
    	akArray6[idx] = akPotion
    	return idx + 640
    endif

    idx = -1
    idx = akArray7.Find(none)
    if idx != -1
    	akArray7[idx] = akPotion
    	return idx + 768
    endif

    idx = -1
    idx = akArray8.Find(none)
    if idx != -1
    	akArray8[idx] = akPotion
    	return idx + 896
    endif

    return -1
endFunction

bool function LinkedArrayAddPotionAt(Potion akPotion, int aiIndex, Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
													Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8)
    ; Adds a potion to the linked-array relative index.

	; Return values
    ; false 	=               Error (linked array full)
    ; true		=   			Success

    int idx = 0       
    if aiIndex < 128
    	idx = aiIndex
    	akArray1[idx] = akPotion
    	return true
    endif

    if aiIndex < 256
    	idx = aiIndex - 128
    	akArray2[idx] = akPotion
    	return true
    endif

    if aiIndex < 384
    	idx = aiIndex - 256
    	akArray3[idx] = akPotion
    	return true
    endif

    if aiIndex < 512
    	idx = aiIndex - 384
    	akArray4[idx] = akPotion
    	return true
    endif

    if aiIndex < 640
    	idx = aiIndex - 512
    	akArray5[idx] = akPotion
    	return true
    endif

    if aiIndex < 768
    	idx = aiIndex - 640
    	akArray6[idx] = akPotion
    	return true
    endif

    if aiIndex < 896
    	idx = aiIndex - 768
    	akArray7[idx] = akPotion
    	return true
    endif

    if aiIndex < 1024
    	idx = aiIndex - 896
    	akArray8[idx] = akPotion
    	return true
    endif

    return false
endFunction

int function LinkedArrayRemovePotion(Potion akPotion, Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
													  Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8, bool abSort = true)
	; Removes the first occurrence of a form from the array, if found.
	
	; Return values
    ;	-1 	=	Failed (Linked array full)
    ;	n 	= 	New element index

	int idx = -1
	idx = akArray1.Find(akPotion)
	if idx != -1
		akArray1[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return idx
	endif

	idx = -1
	idx = akArray2.Find(akPotion)
	if idx != -1
		akArray2[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return idx + 128
	endif

	idx = -1
	idx = akArray3.Find(akPotion)
	if idx != -1
		akArray3[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return idx + 256
	endif

	idx = -1
	idx = akArray4.Find(akPotion)
	if idx != -1
		akArray4[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return idx + 384
	endif

	idx = -1
	idx = akArray5.Find(akPotion)
	if idx != -1
		akArray5[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return idx + 512
	endif

	idx = -1
	idx = akArray6.Find(akPotion)
	if idx != -1
		akArray6[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return idx + 640
	endif

	idx = -1
	idx = akArray7.Find(akPotion)
	if idx != -1
		akArray7[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return idx + 768
	endif

	idx = -1
	idx = akArray8.Find(akPotion)
	if idx != -1
		akArray8[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return idx + 896
	endif

	return -1
endFunction

bool function LinkedArrayRemovePotionAt(int aiIndex, Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
													Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8)
    ; Removes a potion at the linked-array relative index.

	; Return values
    ; false 	=               Error (linked array full)
    ; true		=   			Success

    int idx = 0       
    if aiIndex < 128
    	idx = aiIndex
    	akArray1[idx] = None
    	return true
    endif

    if aiIndex < 256
    	idx = aiIndex - 128
    	akArray2[idx] = None
    	return true
    endif

    if aiIndex < 384
    	idx = aiIndex - 256
    	akArray3[idx] = None
    	return true
    endif

    if aiIndex < 512
    	idx = aiIndex - 384
    	akArray4[idx] = None
    	return true
    endif

    if aiIndex < 640
    	idx = aiIndex - 512
    	akArray5[idx] = None
    	return true
    endif

    if aiIndex < 768
    	idx = aiIndex - 640
    	akArray6[idx] = None
    	return true
    endif

    if aiIndex < 896
    	idx = aiIndex - 768
    	akArray7[idx] = None
    	return true
    endif

    if aiIndex < 1024
    	idx = aiIndex - 896
    	akArray8[idx] = None
    	return true
    endif

    return false
endFunction

int function LinkedArrayFindPotion(Potion akPotion, Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
								    			    Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8, bool abSort = true)
	; Attempts to find the given potion in the associated array ID, and returns the index (relative to the linked array) if found.
	
	; Return values
	; -1	=	akPotion not found
	; n 	= 	akPotion index

	int idx = -1
	idx = akArray1.Find(akPotion)
	if idx != -1
		return idx
	endif
	idx = akArray2.Find(akPotion)
	if idx != -1
		return idx + 128
	endif
	idx = akArray3.Find(akPotion)
	if idx != -1
		return idx + 256
	endif
	idx = akArray4.Find(akPotion)
	if idx != -1
		return idx + 384
	endif
	idx = akArray5.Find(akPotion)
	if idx != -1
		return idx + 512
	endif
	idx = akArray6.Find(akPotion)
	if idx != -1
		return idx + 640
	endif
	idx = akArray7.Find(akPotion)
	if idx != -1
		return idx + 768
	endif
	idx = akArray8.Find(akPotion)
	if idx != -1
		return idx + 896
	endif

	return -1
endFunction

Potion function LinkedArrayGetPotionAt(int aiIndex, Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
								    			    Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8, bool abSort = true)
	; Attempts to retrieve the potion at the supplied linked-array relative index. Returns None if aiIndex is out of bounds.	

	int idx = aiIndex
	if aiIndex < 128
		return akArray1[idx]
	elseif aiIndex < 256
		idx -= 128
		return akArray2[idx]
	elseif aiIndex < 384
		idx -= 256
		return akArray3[idx]
	elseif aiIndex < 512
		idx -= 384
		return akArray4[idx]
	elseif aiIndex < 640
		idx -= 512
		return akArray5[idx]
	elseif aiIndex < 768
		idx -= 640
		return akArray6[idx]
	elseif aiIndex < 896
		idx -= 768
		return akArray7[idx]
	elseif aiIndex < 1024
		idx -= 896
		return akArray8[idx]
	endif

	return None
endFunction

function LinkedArrayClearPotions128(Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
									Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8)
	; Reinitializes and clears linked arrays into Potion[128] arrays.
	
	; Return values
	; none

	akArray1 = new Potion[128]
	akArray2 = new Potion[128]
	akArray3 = new Potion[128]
	akArray4 = new Potion[128]
	akArray5 = new Potion[128]
	akArray6 = new Potion[128]
	akArray7 = new Potion[128]
	akArray8 = new Potion[128]
endFunction

function LinkedArrayRemoveInvalidPotions(Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
										 Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8)
	; Clears all arrays of invalid Potions ([Form <None>]) and re-sorts.

	; Return values
	; none

	bool foundInvalidForm = false
	int i = 0
	while i < akArray1.Length
		if akArray1[i] == "[Form <None>]"
			akArray1[i] = none
			foundInvalidForm = true
		endif
		i += 1
	endWhile
	
	i = 0
	while i < akArray2.Length
		if akArray2[i] == "[Form <None>]"
			akArray2[i] = none
			foundInvalidForm = true
		endif
		i += 1
	endWhile
	
	i = 0
	while i < akArray3.Length
		if akArray3[i] == "[Form <None>]"
			akArray3[i] = none
			foundInvalidForm = true
		endif
		i += 1
	endWhile
	
	i = 0
	while i < akArray4.Length
		if akArray4[i] == "[Form <None>]"
			akArray4[i] = none
			foundInvalidForm = true
		endif
		i += 1
	endWhile

	i = 0
	while i < akArray5.Length
		if akArray5[i] == "[Form <None>]"
			akArray5[i] = none
			foundInvalidForm = true
		endif
		i += 1
	endWhile

	i = 0
	while i < akArray6.Length
		if akArray6[i] == "[Form <None>]"
			akArray6[i] = none
			foundInvalidForm = true
		endif
		i += 1
	endWhile

	i = 0
	while i < akArray7.Length
		if akArray7[i] == "[Form <None>]"
			akArray7[i] = none
			foundInvalidForm = true
		endif
		i += 1
	endWhile

	i = 0
	while i < akArray8.Length
		if akArray8[i] == "[Form <None>]"
			akArray8[i] = none
			foundInvalidForm = true
		endif
		i += 1
	endWhile
	
	if foundInvalidForm
		LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
	endif
endFunction

int function LinkedArrayCountPotions(Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
									 Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8)
	;Counts the number of indicies in this linked array that do not have a "none" type
	
	; Return values
	; int myCount = number of indicies that are not "none"

	int myCount = 0
	
	int i = 0
	while i < akArray1.Length
		if akArray1[i] != none
			myCount += 1
			i += 1
		else
			i += 1
		endif
	endWhile
	
	i = 0
	while i < akArray2.Length
		if akArray2[i] != none
			myCount += 1
			i += 1
		else
			i += 1
		endif
	endWhile
	
	i = 0
	while i < akArray3.Length
		if akArray3[i] != none
			myCount += 1
			i += 1
		else
			i += 1
		endif
	endWhile
	
	i = 0
	while i < akArray4.Length
		if akArray4[i] != none
			myCount += 1
			i += 1
		else
			i += 1
		endif
	endWhile

	i = 0
	while i < akArray5.Length
		if akArray5[i] != none
			myCount += 1
			i += 1
		else
			i += 1
		endif
	endWhile

	i = 0
	while i < akArray6.Length
		if akArray6[i] != none
			myCount += 1
			i += 1
		else
			i += 1
		endif
	endWhile

	i = 0
	while i < akArray7.Length
		if akArray7[i] != none
			myCount += 1
			i += 1
		else
			i += 1
		endif
	endWhile

	i = 0
	while i < akArray8.Length
		if akArray8[i] != none
			myCount += 1
			i += 1
		else
			i += 1
		endif
	endWhile
	
	return myCount
endFunction

bool function LinkedArraySortPotions(Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
									 Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8, int i = 0)
	; Removes blank elements by shifting all elements down, moving elements
	; to arrays "below" the current one if necessary.
	; Optionally starts sorting from element i.
	
	; Return values
	; false 	=           No sorting required
	; true 		=           Success
	
	;debug.trace("Sort Start")
	bool firstNoneFound = false
	int firstNoneFoundArrayId = 0
	int firstNoneIndex = 0
	while i < 1024
		;Which array am I looking in?
		int j = 0					;Actual array index to check
		int myCurrArray				;Current array
		if i < 128
			myCurrArray = 1
			j = i
		elseif i < 256 && i >= 128
			j = i - 128
			myCurrArray = 2
		elseif i < 384 && i >= 256
			j = i - 256
			myCurrArray = 3
		elseif i < 512 && i >= 384
			j = i - 384
			myCurrArray = 4
		elseif i < 640 && i >= 512
			j = i - 512
			myCurrArray = 5
		elseif i < 768 && i >= 640
			j = i - 640
			myCurrArray = 6
		elseif i < 896 && i >= 768
			j = i - 768
			myCurrArray = 7
		elseif i < 1024 && i >= 896
			j = i - 896
			myCurrArray = 8
		endif
		
		if myCurrArray == 1
			if akArray1[j] == none
				if firstNoneFound == false
					firstNoneFound = true
					firstNoneFoundArrayId = myCurrArray
					firstNoneIndex = j
					i += 1
				else
					i += 1
				endif
			else
				if firstNoneFound == true
					;check to see if it's a couple of blank entries in a row
					if !(akArray1[j] == none)
						;notification("Moving element " + i + " to index " + firstNoneIndex)
						if firstNoneFoundArrayId == 1
							akArray1[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 2
							akArray2[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 3
							akArray3[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 4
							akArray4[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 5
							akArray5[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 6
							akArray6[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 7
							akArray7[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 8
							akArray8[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						endif
						;Call this function recursively until it returns
						LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
						return true
					else
						i += 1
					endif
				else
					i += 1
				endif
			endif
		elseif myCurrArray == 2
			if akArray2[j] == none
				if firstNoneFound == false
					firstNoneFound = true
					firstNoneFoundArrayId = myCurrArray
					firstNoneIndex = j
					i += 1
				else
					i += 1
				endif
			else
				if firstNoneFound == true
					;check to see if it's a couple of blank entries in a row
					if !(akArray2[j] == none)
						;notification("Moving element " + i + " to index " + firstNoneIndex)
						if firstNoneFoundArrayId == 1
							akArray1[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 2
							akArray2[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 3
							akArray3[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 4
							akArray4[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 5
							akArray5[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 6
							akArray6[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 7
							akArray7[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 8
							akArray8[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						endif
						;Call this function recursively until it returns
						LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
						return true
					else
						i += 1
					endif
				else
					i += 1
				endif
			endif
		elseif myCurrArray == 3
			if akArray3[j] == none
				if firstNoneFound == false
					firstNoneFound = true
					firstNoneFoundArrayId = myCurrArray
					firstNoneIndex = j
					i += 1
				else
					i += 1
				endif
			else
				if firstNoneFound == true
					;check to see if it's a couple of blank entries in a row
					if !(akArray3[j] == none)
						;notification("Moving element " + i + " to index " + firstNoneIndex)
						if firstNoneFoundArrayId == 1
							akArray1[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 2
							akArray2[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 3
							akArray3[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 4
							akArray4[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 5
							akArray5[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 6
							akArray6[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 7
							akArray7[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 8
							akArray8[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						endif
						;Call this function recursively until it returns
						LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
						return true
					else
						i += 1
					endif
				else
					i += 1
				endif
			endif
		elseif myCurrArray == 4
			if akArray4[j] == none
				if firstNoneFound == false
					firstNoneFound = true
					firstNoneFoundArrayId = myCurrArray
					firstNoneIndex = j
					i += 1
				else
					i += 1
				endif
			else
				if firstNoneFound == true
					;check to see if it's a couple of blank entries in a row
					if !(akArray4[j] == none)
						;notification("Moving element " + i + " to index " + firstNoneIndex)
						if firstNoneFoundArrayId == 1
							akArray1[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 2
							akArray2[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 3
							akArray3[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 4
							akArray4[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 5
							akArray5[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 6
							akArray6[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 7
							akArray7[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 8
							akArray8[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						endif
						;Call this function recursively until it returns
						LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
						return true
					else
						i += 1
					endif
				else
					i += 1
				endif
			endif
		elseif myCurrArray == 5
			if akArray5[j] == none
				if firstNoneFound == false
					firstNoneFound = true
					firstNoneFoundArrayId = myCurrArray
					firstNoneIndex = j
					i += 1
				else
					i += 1
				endif
			else
				if firstNoneFound == true
					;check to see if it's a couple of blank entries in a row
					if !(akArray5[j] == none)
						;notification("Moving element " + i + " to index " + firstNoneIndex)
						if firstNoneFoundArrayId == 1
							akArray1[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 2
							akArray2[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 3
							akArray3[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 4
							akArray4[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 5
							akArray5[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 6
							akArray6[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 7
							akArray7[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 8
							akArray8[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						endif
						;Call this function recursively until it returns
						LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
						return true
					else
						i += 1
					endif
				else
					i += 1
				endif
			endif
		elseif myCurrArray == 6
			if akArray6[j] == none
				if firstNoneFound == false
					firstNoneFound = true
					firstNoneFoundArrayId = myCurrArray
					firstNoneIndex = j
					i += 1
				else
					i += 1
				endif
			else
				if firstNoneFound == true
					;check to see if it's a couple of blank entries in a row
					if !(akArray6[j] == none)
						;notification("Moving element " + i + " to index " + firstNoneIndex)
						if firstNoneFoundArrayId == 1
							akArray1[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 2
							akArray2[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 3
							akArray3[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 4
							akArray4[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 5
							akArray5[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 6
							akArray6[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 7
							akArray7[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 8
							akArray8[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						endif
						;Call this function recursively until it returns
						LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
						return true
					else
						i += 1
					endif
				else
					i += 1
				endif
			endif
		elseif myCurrArray == 7
			if akArray7[j] == none
				if firstNoneFound == false
					firstNoneFound = true
					firstNoneFoundArrayId = myCurrArray
					firstNoneIndex = j
					i += 1
				else
					i += 1
				endif
			else
				if firstNoneFound == true
					;check to see if it's a couple of blank entries in a row
					if !(akArray7[j] == none)
						;notification("Moving element " + i + " to index " + firstNoneIndex)
						if firstNoneFoundArrayId == 1
							akArray1[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 2
							akArray2[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 3
							akArray3[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 4
							akArray4[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 5
							akArray5[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 6
							akArray6[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 7
							akArray7[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 8
							akArray8[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						endif
						;Call this function recursively until it returns
						LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
						return true
					else
						i += 1
					endif
				else
					i += 1
				endif
			endif
		elseif myCurrArray == 8
			if akArray8[j] == none
				if firstNoneFound == false
					firstNoneFound = true
					firstNoneFoundArrayId = myCurrArray
					firstNoneIndex = j
					i += 1
				else
					i += 1
				endif
			else
				if firstNoneFound == true
					;check to see if it's a couple of blank entries in a row
					if !(akArray8[j] == none)
						;notification("Moving element " + i + " to index " + firstNoneIndex)
						if firstNoneFoundArrayId == 1
							akArray1[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 2
							akArray2[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 3
							akArray3[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 4
							akArray4[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 5
							akArray5[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 6
							akArray6[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 7
							akArray7[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						elseif firstNoneFoundArrayId == 8
							akArray8[firstNoneIndex] = akArray1[j]
							akArray1[j] = none
						endif
						;Call this function recursively until it returns
						LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
						return true
					else
						i += 1
					endif
				else
					i += 1
				endif
			endif
		endif
	endWhile
	
	return false
endFunction