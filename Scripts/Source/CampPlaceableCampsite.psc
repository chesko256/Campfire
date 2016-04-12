scriptname CampPlaceableCampsite extends _Camp_PlaceableObjectBase
{For the placement of campsites.}

import CampUtil
import _CampInternal
import _Camp_ArrayHelper

Actor property PlayerRef auto
Message property _Camp_CampsiteMainMenu auto
Container property _Camp_CampsiteWorkshopActual auto
FormList property workshopScrapRecipe_Tree auto
FormList property workshopScrapRecipe_TreeBlasted auto
FormList property workshopScrapRecipe_TreeLarge auto
FormList property workshopScrapRecipe_TreeStump auto
ObjectReference property _Camp_Anchor auto

; PRIVATE
ObjectReference property myCampsiteWorkshop auto hidden
ObjectReference[] CampsiteObjects
bool property campsite_workshop_in_use = false auto hidden

function Initialize()
	self.BlockActivation()
	parent.Initialize()
	CampsiteObjects = new ObjectReference[128]
endFunction

function UseObject(ObjectReference akActionRef)
	int i = _Camp_CampsiteMainMenu.Show()
	if i == 0										;Workshop
		campsite_workshop_in_use = true
		myCampsiteWorkshop.StartWorkshop()
	elseif i == 1 									;Take Down
		CampDebug(0, "Workshop objects: " + CampsiteObjects)
		PickUpAllCampsiteObjects()
		CampsiteObjects = new ObjectReference[128]
		TakeDown()
	else
		;exit
	endif
endFunction

function PlaceObjects()
	myCampsiteWorkshop = self.PlaceAtMe(_Camp_CampsiteWorkshopActual)
	(myCampsiteWorkshop as _Camp_CampsiteWorkshopScript).MyCampsite = self
	CampDebug(0, "Campsite workshop: " + myCampsiteWorkshop)
	campsite_workshop_in_use = true
	myCampsiteWorkshop.StartWorkshop()
endFunction

function GetResults()
	; pass

	if GetLogLevel() <= 1
		GenerateDebugReport()
	endif
endFunction

function GenerateDebugReport()
	CampDebug(1, "Placement complete. Placed object report:")
	CampDebug(1, "======================================================================")
	CampDebug(1, "**SELF**: " + self)
	CampDebug(1, "======================================================================")
endFunction

function RotateOnStartUp()
	self.SetAngle(self.GetAngleX(), self.GetAngleY(), self.GetAngleZ() + Setting_StartUpRotation)
endFunction

function TakeDown()
	CampDebug(0, self + " TakeDown (CampPlaceableCampsite)")
	parent.TakeDown()

	(myCampsiteWorkshop as _Camp_CampsiteWorkshopScript).MyCampsite = None
	TryToDisableAndDeleteRef(myCampsiteWorkshop)
	myCampsiteWorkshop.MoveTo(_Camp_Anchor)
	myCampsiteWorkshop = None
	CampsiteObjects = None
	self.MoveTo(_Camp_Anchor)
	self.Disable()
	self.Delete()
	debug.trace(self + " take-down done.")
endFunction

function PickUpCampsiteObjectByIndex(int aiRefIndex)
	ObjectReference ref = CampsiteObjects[aiRefIndex]
	if (ref as _Camp_PlaceableObjectBase)
		debug.trace("FIX THIS BUG FIX THIS BUG FIX THIS BUG FIX THIS BUG FIX THIS BUG")
		PlayerRef.AddItem((ref as _Camp_PlaceableObjectBase).Required_InventoryItem, 1, true)
		(ref as _Camp_PlaceableObjectBase).TakeDown()
	else
		TryToDisableAndDeleteRef(ref)
	endif
endFunction

function PickUpCampsiteObjectByRef(ObjectReference akReference)
	if (akReference as _Camp_PlaceableObjectBase)
		PlayerRef.AddItem((akReference as _Camp_PlaceableObjectBase).Required_InventoryItem, 1, true)
		(akReference as _Camp_PlaceableObjectBase).TakeDown()
	else
		TryToDisableAndDeleteRef(akReference)
	endif
endFunction

function PickUpAllCampsiteObjects()
	int i = 0
	int object_count = ArrayCountRef(CampsiteObjects)
	while i < object_count
		PickUpCampsiteObjectByIndex(i)
		i += 1
	endWhile
endFunction

Event OnWorkshopMode(bool aStart)
	if !aStart
		campsite_workshop_in_use = false
	endif
EndEvent

function WorkshopObjectPlaced(ObjectReference akReference)
	if campsite_workshop_in_use
		bool success = ArrayAddRef(CampsiteObjects, akReference)
		if !success
			; Throw error
			debug.notification("You can't place any more items at this campsite.")

			; Destroy object
			PickUpCampsiteObjectByRef(akReference)
		endif
		CampDebug(0, self + " managed object report: " + CampsiteObjects)
	endif
endFunction

function WorkshopObjectDestroyed(ObjectReference akReference)
	if campsite_workshop_in_use
		; Is this an object we manage?
		if ArrayCountNumRef(CampsiteObjects, akReference) > 0
			bool b = ArrayRemoveRef(CampsiteObjects, akReference, true)
		; Is this an object that yields scrap wood?
		elseif workshopScrapRecipe_Tree.HasForm(akReference) || workshopScrapRecipe_TreeBlasted.HasForm(akReference) || \
			   workshopScrapRecipe_TreeLarge.HasForm(akReference) || workshopScrapRecipe_TreeStump.HasForm(akReference)
			; Player scrapped wood
		else
			; If not, reset the object.
			debug.trace("Campsite scrapped invalid object " + akReference)
			Form base = akReference.GetBaseObject()
			float scale = akReference.GetScale()
			ObjectReference new_ref = akReference.PlaceAtMe(base, abForcePersist = true)
			akReference.SetScale(scale)
			if akReference as _Camp_PlaceableObjectBase
				(akReference as _Camp_PlaceableObjectBase).TakeDown()
			endif
			debug.notification("Only trees and camping gear can be scrapped at campsites.")


		endif
		CampDebug(0, self + " managed object report: " + CampsiteObjects)
	endif
endFunction

