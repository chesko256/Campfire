scriptname _Seed_PlayerEatMonitor extends ReferenceAlias

import CommonArrayHelper
import _SeedInternal


Keyword property VendorItemFood auto
Keyword property VendorItemFoodRaw auto
GlobalVariable property _Seed_Setting_DiminishingFoodReturns auto
FormList property _Seed_Food_RestoreHungerMinor auto
FormList property _Seed_Food_RestoreHungerMajor auto
FormList property _Seed_Food_RestoreHungerSuperior auto
FormList property _Seed_Food_RestoreHungerAll auto

Potion[] property EatenHistoryFood auto hidden
int[] property EatenHistoryCount auto hidden


Event OnInit()
    EatenHistoryFood = new Potion[64]
    EatenHistoryCount = new Int[64]
EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
    if akBaseObject as Potion && (akBaseObject.HasKeyword(VendorItemFood) || akBaseObject.HasKeyword(VendorItemFoodRaw))
   		SeedDebug(0, "Object WAS food.")
   		if _Seed_Food_RestoreHungerMinor.HasForm(akBaseObject)

   		elseif _Seed_Food_RestoreHungerMajor.HasForm(akBaseObject)

   		elseif _Seed_Food_RestoreHungerSuperior.HasForm(akBaseObject)

   		elseif _Seed_Food_RestoreHungerAll.HasForm(akBaseObject)

   		endif
    else
    	SeedDebug(0, "Object was not food. Reason: Was Potion " + akBaseObject as Potion + ", HasKeyword(VendorItemFood || VendorItemFoodRaw) " + (akBaseObject.HasKeyword(VendorItemFood) || akBaseObject.HasKeyword(VendorItemFoodRaw))
    endif
EndEvent