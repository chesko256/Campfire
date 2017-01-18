scriptname _Seed_PlayerEatMonitor extends ReferenceAlias

Keyword property VendorItemFood auto

Potion[] property EatenFoodHistory auto hidden

Event OnInit()
    EatenFoodHistory = new Potion[32]
EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
    if akBaseObject as Potion && akBaseObject.HasKeyword(VendorItemFood)
    	
    endif
EndEvent