scriptname _Camp_CampsiteWorkshopScript extends ObjectReference

import _CampInternal

Actor property PlayerRef auto
FormList property _Camp_ScrapResources auto

; Assigned at runtime
ObjectReference property MyCampsite auto hidden

Event OnInit()
	self.AddInventoryEventFilter(_Camp_ScrapResources)
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	CampDebug(0, "Campsite OnWorkshopObjectPlaced")
	(MyCampsite as CampPlaceableCampsite).WorkshopObjectPlaced(akReference)
EndEvent

Event OnWorkshopObjectDestroyed(ObjectReference akReference)
	CampDebug(0, "Campsite OnWorkshopObjectDestroyed")
	(MyCampsite as CampPlaceableCampsite).WorkshopObjectDestroyed(akReference)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	CampDebug(0, akBaseItem + " added to campsite workshop.")
	(MyCampsite as CampPlaceableCampsite).ItemAdded(akBaseItem, aiItemCount)
EndEvent

Event OnWorkshopMode(bool aStart)
	(MyCampsite as CampPlaceableCampsite).WorkshopMode(aStart)
endEvent