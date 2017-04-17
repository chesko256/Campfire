scriptname _Seed_PlayerEatMonitor extends ReferenceAlias

import CommonArrayHelper
import SeedUtil
import _SeedInternal


Keyword property VendorItemFood auto
Keyword property VendorItemFoodRaw auto
GlobalVariable property _Seed_Setting_DiminishingFoodReturns auto
GlobalVariable property _Seed_RestoreHungerMinorAmount auto
GlobalVariable property _Seed_RestoreHungerMajorAmount auto
GlobalVariable property _Seed_RestoreHungerSuperiorAmount auto
GlobalVariable property _Seed_RestoreHungerMassiveAmount auto
GlobalVariable property _Seed_Setting_DisplayTutorials auto
GlobalVariable property _Seed_HelpDone_Variety auto
FormList property _Seed_Food_RestoreHungerMinor auto
FormList property _Seed_Food_RestoreHungerMajor auto
FormList property _Seed_Food_RestoreHungerSuperior auto
FormList property _Seed_Food_RestoreHungerMassive auto
FormList property _Seed_RecentlyEatenFood auto
Message property _Seed_Help_Variety auto

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
    Potion theFood = akBaseObject as Potion
    if theFood && (akBaseObject.HasKeyword(VendorItemFood) || akBaseObject.HasKeyword(VendorItemFoodRaw))
   		SeedDebug(0, "Object WAS food.")

   		int foodType = GetFoodType(theFood)
   		if (foodType == 18 || foodType == 19)
   			return
   		endif

   		float amountToRestore
   		if _Seed_Food_RestoreHungerMinor.HasForm(akBaseObject)
   			amountToRestore = _Seed_RestoreHungerMinorAmount.GetValue()
   		elseif _Seed_Food_RestoreHungerMajor.HasForm(akBaseObject)
   			amountToRestore = _Seed_RestoreHungerMajorAmount.GetValue()
   		elseif _Seed_Food_RestoreHungerSuperior.HasForm(akBaseObject)
   			amountToRestore = _Seed_RestoreHungerSuperiorAmount.GetValue()
   		elseif _Seed_Food_RestoreHungerMassive.HasForm(akBaseObject)
   			amountToRestore = _Seed_RestoreHungerMassiveAmount.GetValue()
   		else
   			; Allow player to identify food
   		endif

   		if !(foodType == 15)
   			if _Seed_RecentlyEatenFood.HasForm(theFood)
   				SeedDebug(0, "This food was recently eaten.")
   				amountToRestore *= 0.5
   				ShowTutorial_Variety()
   			else
   				SeedDebug(0, "This food was not recently eaten or is soup.")
   				_Seed_RecentlyEatenFood.AddForm(theFood)
   			endif
   		endif

   		SeedDebug(1, "Restoring " + amountToRestore + " hunger.")
   		RestorePlayerHunger(amountToRestore)
    else
    	SeedDebug(0, "Object was not food. Reason: Was Potion " + akBaseObject as Potion + ", HasKeyword(VendorItemFood || VendorItemFoodRaw) " + (akBaseObject.HasKeyword(VendorItemFood) || akBaseObject.HasKeyword(VendorItemFoodRaw)))
    endif
EndEvent

function ShowTutorial_Variety()
    if _Seed_Setting_DisplayTutorials.GetValueInt() == 2 && _Seed_HelpDone_Variety.GetValueInt() == 1
        _Seed_Help_Variety.Show()
        _Seed_HelpDone_Variety.SetValue(2)
    endif
endFunction