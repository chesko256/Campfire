scriptname _Seed_TableInterface
{ This script handles extended Linked Arrays specific to handling multi-part food. }

function AddUpdateMultiPartFood(Potion akWholeFood, Potion akResultFood, int aiQuantity, 									\
					  Potion[] akMultiPartFoodArray1, Potion[] akMultiPartFoodArray2, Potion[] akMultiPartFoodArray3, Potion[] akMultiPartFoodArray4, 		\
					  Potion[] akMultiPartFoodArray5, Potion[] akMultiPartFoodArray6, Potion[] akMultiPartFoodArray7, Potion[] akMultiPartFoodArray8) global
	
	; Adds food entries to linked array. If found, updates it with the supplied data.
	; Follows the pattern: WholeFood, ResultFood, QuantityFood, WholeFood, ResultFood, QuantityFood...

	int idx = LinkedArrayFindPotion(akWholeFood, akMultiPartFoodArray1, akMultiPartFoodArray2, akMultiPartFoodArray3, akMultiPartFoodArray4, \
								  			   akMultiPartFoodArray5, akMultiPartFoodArray6, akMultiPartFoodArray7, akMultiPartFoodArray8)

	
	; Get quantity form

	if idx == -1
		int newIdx = LinkedArrayAddPotion(akWholeFood, akMultiPartFoodArray1, akMultiPartFoodArray2, akMultiPartFoodArray3, akMultiPartFoodArray4, akMultiPartFoodArray5, akMultiPartFoodArray6, akMultiPartFoodArray7, akMultiPartFoodArray8)
		LinkedArrayAddPotionAt(akResultFood, newIdx + 1, akMultiPartFoodArray1, akMultiPartFoodArray2, akMultiPartFoodArray3, akMultiPartFoodArray4, akMultiPartFoodArray5, akMultiPartFoodArray6, akMultiPartFoodArray7, akMultiPartFoodArray8)
		LinkedArrayAddPotionAt(quantityForm, newIdx + 2, akMultiPartFoodArray1, akMultiPartFoodArray2, akMultiPartFoodArray3, akMultiPartFoodArray4, akMultiPartFoodArray5, akMultiPartFoodArray6, akMultiPartFoodArray7, akMultiPartFoodArray8)
	endif

	if idx > -1
		; Update the existing entry
		LinkedArrayAddPotionAt(akResultFood, idx + 1, akMultiPartFoodArray1, akMultiPartFoodArray2, akMultiPartFoodArray3, akMultiPartFoodArray4, akMultiPartFoodArray5, akMultiPartFoodArray6, akMultiPartFoodArray7, akMultiPartFoodArray8)
		LinkedArrayAddPotionAt(quantityForm, idx + 2, akMultiPartFoodArray1, akMultiPartFoodArray2, akMultiPartFoodArray3, akMultiPartFoodArray4, akMultiPartFoodArray5, akMultiPartFoodArray6, akMultiPartFoodArray7, akMultiPartFoodArray8)
	endif

	; Release lock
	abLockToken[0] = false
endFunction

function AddUpdateMultiPartFoodRecord(int aiNormalizedIndex, Potion akWholeFood, Potion akResultFood, int aiQuantity, 		\
									  Potion[] akWholeFoodsLinkedArray, Potion[] akResultFoodsLinkedArray,					\
									  int[] aiQuantitiesLinkedArray)
	
	akWholeFoodsLinkedArray[aiNormalizedIndex] = akWholeFood
	akResultFoodsLinkedArray[aiNormalizedIndex] = akResultFood
	aiQuantitiesLinkedArray[aiNormalizedIndex] = aiQuantity
endFunction

function RemoveMultiPartFood(Potion akWholeFood, 							 												\
					  Potion[] akWholeFoods1, Potion[] akWholeFoods2, Potion[] akWholeFoods3, Potion[] akWholeFoods4, 		\
					  Potion[] akResultFoods1, Potion[] akResultFoods2, Potion[] akResultFoods3, Potion[] akResultFoods4,	\
					  int[] aiQuantities1, int[] aiQuantities2, int[] aiQuantities3, int[] aiQuantities4,					\
					  bool[] abLockToken) global
	
	; Removes a food record from the table, if found. Resorts the table when complete.

	; Lock edits and time out if necessary
	int i = 0
	while abLockToken[0] && i < 20
		Utility.wait(0.1)
		i += 1
	endWhile
	if i == 20
		return
	endif
	abLockToken[0] = true

	int idx = LinkedArrayFindForm(akWholeFood, akWholeFoods1, akWholeFoods2, akWholeFoods3, akWholeFoods4)

	if idx == -1
		return
	endif

	if idx < 128
		LinkedArrayRemoveFormAt(idx, akWholeFood, akResultFood, aiQuantity, akWholeFoods1, akResultFoods1, aiQuantities1)
	elseif idx < 256
		LinkedArrayRemoveFormAt((idx - 128), akWholeFood, akResultFood, aiQuantity, akWholeFoods2, akResultFoods2, aiQuantities2)
	elseif idx < 384
		LinkedArrayRemoveFormAt((idx - 256), akWholeFood, akResultFood, aiQuantity, akWholeFoods3, akResultFoods3, aiQuantities3)
	elseif idx < 512
		LinkedArrayRemoveFormAt((idx - 384), akWholeFood, akResultFood, aiQuantity, akWholeFoods4, akResultFoods4, aiQuantities4)
	endif

	LinkedArrayRemoveFormAt()
endFunction

Potion function GetMultiPartFoodResult(Potion akWholeFood, 						 											\
					  Potion[] akWholeFoods1, Potion[] akWholeFoods2, Potion[] akWholeFoods3, Potion[] akWholeFoods4, 		\
					  Potion[] akResultFoods1, Potion[] akResultFoods2, Potion[] akResultFoods3, Potion[] akResultFoods4,	\
					  int[] aiQuantities1, int[] aiQuantities2, int[] aiQuantities3, int[] aiQuantities4,					\
					  bool[] abLockToken) global

	; Gets the result food of the given multi-part food. If not found, returns None.
endFunction

int function GetMultiPartFoodResultQuantity(Potion akWholeFood, 							 								\
					  Potion[] akWholeFoods1, Potion[] akWholeFoods2, Potion[] akWholeFoods3, Potion[] akWholeFoods4, 		\
					  Potion[] akResultFoods1, Potion[] akResultFoods2, Potion[] akResultFoods3, Potion[] akResultFoods4,	\
					  int[] aiQuantities1, int[] aiQuantities2, int[] aiQuantities3, int[] aiQuantities4,					\
					  bool[] abLockToken) global

	; Gets the result food of the given multi-part food. If not found, returns -1.
endFunction


;/
	Linked Array Functions
/;

int function LinkedArrayAddPotion(Potion akPotion, Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
													Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8) global
    ; Adds a form to the first available element in the first available array
	; associated with this ArrayID.

	; Return values
    ;	-1 	=	Failed (Linked array full)
    ;	n 	= 	New element index

    int idx = -1
    idx = akArray1.Find(none)
    if idx != -1
    	akAray1[idx] = akPotion
    	return idx
    endif

    idx = -1
    idx = akArray2.Find(none)
    if idx != -1
    	akArray2[idx] = akPotion
    	return idx
    endif

    idx = -1
    idx = akArray3.Find(none)
    if idx != -1
    	akArray3[idx] = akPotion
    	return idx
    endif

    idx = -1
    idx = akArray4.Find(none)
    if idx != -1
    	akArray4[idx] = akPotion
    	return idx
    endif

    idx = -1
    idx = akArray5.Find(none)
    if idx != -1
    	akArray5[idx] = akPotion
    	return idx
    endif

    idx = -1
    idx = akArray6.Find(none)
    if idx != -1
    	akArray6[idx] = akPotion
    	return idx
    endif

    idx = -1
    idx = akArray7.Find(none)
    if idx != -1
    	akArray7[idx] = akPotion
    	return idx
    endif

    idx = -1
    idx = akArray8.Find(none)
    if idx != -1
    	akArray8[idx] = akPotion
    	return idx
    endif

    return -1
endFunction

bool function LinkedArrayAddPotionAt(Potion akPotion, int aiIndex, Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
													Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8) global
    ; Adds a potion to the linked-array relative index.

	; Return values
    ; false 	=               Error (linked array full)
    ; true		=   			Success

    int idx = 0       
    if aiIndex < 128
    	idx = aiIndex
    	akAray1[idx] = akPotion
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

bool function LinkedArrayRemovePotion(Potion akPotion, Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4 \
													   Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8, bool abSort = true) global
	; Removes the first occurrence of a form from the array, if found.
	
	; Return values
	; false 	=		Error (Form not found)
	; true		=		Success

	int idx = -1
	idx = akArray1.Find(akForm)
	if idx != -1
		akArray1[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return true
	endif

	idx = -1
	idx = akArray2.Find(akForm)
	if idx != -1
		akArray2[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return true
	endif

	idx = -1
	idx = akArray3.Find(akForm)
	if idx != -1
		akArray3[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return true
	endif

	idx = -1
	idx = akArray4.Find(akForm)
	if idx != -1
		akArray4[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return true
	endif

	idx = -1
	idx = akArray5.Find(akForm)
	if idx != -1
		akArray5[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return true
	endif

	idx = -1
	idx = akArray6.Find(akForm)
	if idx != -1
		akArray6[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return true
	endif

	idx = -1
	idx = akArray7.Find(akForm)
	if idx != -1
		akArray7[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return true
	endif

	idx = -1
	idx = akArray8.Find(akForm)
	if idx != -1
		akArray8[idx] = none
		if abSort
			LinkedArraySortPotions(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8)
		endif
		return true
	endif

	return false
endFunction

bool function LinkedArrayHasPotion(Potion akPotion, Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
								    			  Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8, bool abSort = true) global
	; Attempts to find the given potion in the associated array ID, and returns true if found
	
	; Return values
	; false		= 		Potion not found
	; true 		=		Potion found

	if akArray1.Find(akPotion) != -1
		return true
	elseif akArray2.Find(akPotion) != -1
		return true
	elseif akArray3.Find(akPotion) != -1
		return true
	elseif akArray4.Find(akPotion) != -1
		return true
	elseif akArray5.Find(akPotion) != -1
		return true
	elseif akArray6.Find(akPotion) != -1
		return true
	elseif akArray7.Find(akPotion) != -1
		return true
	elseif akArray8.Find(akPotion) != -1
		return true
	else
		return false
	endif
endFunction

int function LinkedArrayFindPotion(Potion akPotion, Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
								    			    Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8, bool abSort = true) global
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

function LinkedArrayClearPotions128(Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4, \
									Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8) global
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
										 Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8) global
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
									 Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8) global
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

bool function LinkedArraySortPotions(Potion[] akArray1, Potion[] akArray2, Potion[] akArray3, Potion[] akArray4 \
									 Potion[] akArray5, Potion[] akArray6, Potion[] akArray7, Potion[] akArray8, int i = 0) global
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
						LinkedArraySortForms(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
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
						LinkedArraySortForms(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
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
						LinkedArraySortForms(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
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
						LinkedArraySortForms(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
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
						LinkedArraySortForms(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
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
						LinkedArraySortForms(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
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
						LinkedArraySortForms(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
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
						LinkedArraySortForms(akArray1, akArray2, akArray3, akArray4, akArray5, akArray6, akArray7, akArray8, firstNoneIndex + 1)
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
