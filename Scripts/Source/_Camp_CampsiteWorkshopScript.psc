scriptname _Camp_CampsiteWorkshopScript extends ObjectReference

Actor property PlayerRef auto
FormList property _Camp_CampingObjects auto

; Assigned at runtime
ObjectReference property MyCampsite auto hidden

Event OnInit()
	self.AddInventoryEventFilter(_Camp_CampingObjects)
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	debug.trace("Campsite OnWorkshopObjectPlaced")
	(MyCampsite as CampPlaceableCampsite).WorkshopObjectPlaced(akReference)
EndEvent

Event OnWorkshopObjectDestroyed(ObjectReference akReference)
	debug.trace("Campsite OnWorkshopObjectDestroyed")
	(MyCampsite as CampPlaceableCampsite).WorkshopObjectDestroyed(akReference)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	debug.trace(akBaseItem + " added to campsite workshop.")
	;/if akBaseItem as _Camp_PlaceableObjectBase
		debug.trace(akBaseItem + " converting to " + (akBaseItem as _Camp_PlaceableObjectBase).Required_InventoryItem)
		PlayerRef.AddItem((akBaseItem as _Camp_PlaceableObjectBase).Required_InventoryItem, aiItemCount, true)
		self.RemoveItem(akBaseItem, aiItemCount)
	endif
	/;
EndEvent

