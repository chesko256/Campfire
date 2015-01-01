scriptname _DE_DeleteCraftingObjectScript extends ReferenceAlias

furniture property _DE_CraftingObject auto
bool property pSitting = false auto

Event OnGetUp(ObjectReference akFurniture)
	if akFurniture.GetBaseObject() == _DE_CraftingObject
		akFurniture.Delete()
		;debug.notification("I just deleted the crafting object")
	endif
endEvent

Event OnSit(ObjectReference akFurniture)
	if akFurniture.GetBaseObject() == _DE_CraftingObject
		pSitting = true
	endif
endEvent