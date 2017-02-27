scriptname _Seed_FoodDatastoreHandler extends Quest
{ This script handles the lookup and storage of food data. Actual 
  hunger / thirst / spoilage logic is handled by their requisite
  systems. }

import StorageUtil
import _SeedInternal


; Food ID Enum
int property FOOD_BREAD				= 1		autoReadOnly
int property FOOD_MEAT_RAW 			= 2 	autoReadOnly
int property FOOD_MEAT_COOKED 		= 3 	autoReadOnly
int property FOOD_SMALLGAME_RAW 	= 4 	autoReadOnly
int property FOOD_SMALLGAME_COOKED 	= 5 	autoReadOnly
int property FOOD_FISH_RAW 			= 6 	autoReadOnly
int property FOOD_FISH_COOKED 		= 7 	autoReadOnly
int property FOOD_SEAFOOD_RAW 		= 8 	autoReadOnly
int property FOOD_SEAFOOD_COOKED 	= 9 	autoReadOnly
int property FOOD_VEGETABLE 		= 10 	autoReadOnly
int property FOOD_FRUIT 			= 11 	autoReadOnly
int property FOOD_CHEESE 			= 12 	autoReadOnly
int property FOOD_TREAT 			= 13 	autoReadOnly
int property FOOD_PASTRY 			= 14 	autoReadOnly
int property FOOD_STEW 				= 15 	autoReadOnly
int property FOOD_CHEESEBOWL		= 16	autoReadOnly
int property FOOD_PRESERVED 		= 17 	autoReadOnly

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
FormList property _Seed_Preserved auto

Potion[] property multiPartWholeFoods auto hidden
Potion[] property multiPartResultFoods auto hidden
int[] property multiPartResultFoodQuantities auto hidden

function StartSystem()
	if !self.IsRunning()
		self.Start()
	endif
	InitializeArrays()
	CreateFoodKeywordValueMaps()
endFunction

function StopSystem()
	if self.IsRunning()
		self.Stop()
	endif
endFunction

function InitializeArrays()
	foodLists = new FormList[17]
	foodList[0] = _Seed_Bread
	foodList[1] = _Seed_MeatRaw
	foodList[2] = _Seed_MeatCooked
	foodList[3] = _Seed_SmallGameRaw
	foodList[4] = _Seed_SmallGameCooked
	foodList[5] = _Seed_FishRaw
	foodList[6] = _Seed_FishCooked
	foodList[7] = _Seed_SeafoodRaw
	foodList[8] = _Seed_SeafoodCooked
	foodList[9] = _Seed_Vegetables
	foodList[10] = _Seed_Fruit
	foodList[11] = _Seed_Cheese
	foodList[12] = _Seed_Treats
	foodList[13] = _Seed_Pastries
	foodList[14] = _Seed_Stews
	foodList[15] = _Seed_CheeseBowls
	foodList[16] = _Seed_Preserved
endFunction

int function IdentifyFood(Potion food)
	; Return values:
	;	0: Not found
	;	n: Food Type (see Food IDs)

	int i = 0
	while i < foodList.Length
		if foodList[i].HasForm(food)
			return i + 1
		else
			i += 1
		endif
	endWhile
	return 0
endFunction

function AddFood(Potion food, int foodId)
	int idx = foodId - 1
	foodList[idx].AddForm(food)
endFunction

;/
	Core problems:
		How to associate food to restorative value(s)
			StorageUtil
				Fast
				single-platform
				portable
				No size constraints
				would have to use Arrays or FormLists anyway
			Arrays
				Fast
				Somewhat complex
				multi-platform
				index size constraints
				non-portable for Classic users
			FormLists
				Slow
				Simple
				No size constraints
				non-portable for Classic users
		How to associate food to spoilage path
/;

;/ Array / Datastore Schemas ==================================================

	The Food Datastore and the Spoilage System use arrays and lists in order
	to pass around data about food, depending on the needs of the system and
	for performance reasons.

	The following are the most commonly used conventions used throughout
	Last Seed.

	StorageUtil IntList[] FoodData: The format that the Food Datastore stores
	a record about a single piece of food. This data is saved to a Default
	Settings Profile, or to the player's custom Food Profile.

/;