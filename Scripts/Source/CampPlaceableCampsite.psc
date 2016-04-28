scriptname CampPlaceableCampsite extends _Camp_PlaceableObjectBase
{For the placement of campsites.}

import CampUtil
import _CampInternal
import _Camp_ArrayHelper

Actor property PlayerRef auto
Message property _Camp_CampsiteMainMenu auto
ObjectReference property _Camp_CampsiteWorkshopREF auto
ObjectReference property _Camp_Anchor auto
Activator property _Camp_PlaceableSettlementWorkshop auto
Keyword property _CampingEquipmentMiscObject auto
Message property _Camp_CampsiteErrorFull auto
Message property _Camp_CampsiteErrorScrapping auto

var[] CampObjectMap_WorldObjects
MiscObject[] CampObjectMap_InvObjects

Furniture property WorkshopNpcBedSleepingBagSleep01 auto
Static property _Camp_CampsiteCampfire auto
Furniture property WorkbenchCookingGroundPot auto
Furniture property NpcChairVaultSit03 auto
Activator property _Camp_PortableGenerator auto
Static property _Camp_CampsiteOilLamp auto
Static property _Camp_Tent1 auto
Static property Workshop_RaiderTent01 auto
Static property Workshop_RaiderTent02 auto
Activator property WorkshopConstructionLight01 auto

MiscObject property _Camp_SleepingBagMiscitem auto
MiscObject property c_Wood_scrap auto
MiscObject property _Camp_CookingPotMiscItem auto
MiscObject property _Camp_FoldingChairMiscItem auto
MiscObject property _Camp_GeneratorMiscitem auto
MiscObject property _Camp_OilLampMiscItem auto
MiscObject property c_Plastic_scrap auto
MiscObject property c_Cloth_scrap auto
MiscObject property _Camp_ConstructionLightMiscItem auto

; PRIVATE
; ObjectReference property myCampsiteWorkshop auto hidden
ObjectReference[] property CampsiteObjects auto hidden
bool property campsite_workshop_in_use = false auto hidden
bool last_scrapped_item_was_disallowed = false

function Initialize()
	self.BlockActivation()
	parent.Initialize()
	CampsiteObjects = new ObjectReference[128]
	InitializeCampObjectMaps()
endFunction

function UseObject(ObjectReference akActionRef)
	int i = _Camp_CampsiteMainMenu.Show()
	if i == 0										;Workshop
		_Camp_CampsiteWorkshopREF.StartWorkshop()
	elseif i == 1 									;Transfer
		_Camp_CampsiteWorkshopREF.Activate(PlayerRef, abDefaultProcessingOnly = true)
	elseif i == 2 									;Take Down
		CampDebug(0, "Workshop objects: " + CampsiteObjects)
		PickUpAllCampsiteObjects()
		CampsiteObjects = new ObjectReference[128]
		TakeDown()
	else
		;exit
	endif
endFunction

function PlaceObjects()
	_Camp_CampsiteWorkshopREF.MoveTo(self)
	_Camp_CampsiteWorkshopREF = _Camp_CampsiteWorkshopREF
	(_Camp_CampsiteWorkshopREF as _Camp_CampsiteWorkshopScript).MyCampsite = self
	CampDebug(0, "Campsite workshop: " + _Camp_CampsiteWorkshopREF)
	_Camp_CampsiteWorkshopREF.StartWorkshop()
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

	_Camp_CampsiteWorkshopREF.StartWorkshop(false)
	_Camp_CampsiteWorkshopREF.MoveTo(_Camp_Anchor)
	CampsiteObjects = None
	self.MoveTo(_Camp_Anchor)
	self.Disable()
	self.Delete()
	(_Camp_CampsiteWorkshopREF as _Camp_CampsiteWorkshopScript).MyCampsite = None
	CampDebug(0, self + " take-down done.")
endFunction

function InitializeCampObjectMaps()
	CampDebug(0, "Initializing camp object map.")
	CampObjectMap_WorldObjects = new var[0]
	CampObjectMap_InvObjects = new MiscObject[0]

	CampObjectMap_WorldObjects.Add(WorkshopNpcBedSleepingBagSleep01)
	CampObjectMap_WorldObjects.Add(_Camp_CampsiteCampfire)
	CampObjectMap_WorldObjects.Add(WorkbenchCookingGroundPot)
	CampObjectMap_WorldObjects.Add(NpcChairVaultSit03)
	CampObjectMap_WorldObjects.Add(_Camp_PortableGenerator)
	CampObjectMap_WorldObjects.Add(_Camp_CampsiteOilLamp)
	CampObjectMap_WorldObjects.Add(_Camp_Tent1)
	CampObjectMap_WorldObjects.Add(Workshop_RaiderTent01)
	CampObjectMap_WorldObjects.Add(Workshop_RaiderTent02)
	CampObjectMap_WorldObjects.Add(WorkshopConstructionLight01)

	CampObjectMap_InvObjects.Add(_Camp_SleepingBagMiscitem)
	CampObjectMap_InvObjects.Add(c_Wood_scrap)
	CampObjectMap_InvObjects.Add(_Camp_CookingPotMiscItem)
	CampObjectMap_InvObjects.Add(_Camp_FoldingChairMiscItem)
	CampObjectMap_InvObjects.Add(_Camp_GeneratorMiscitem)
	CampObjectMap_InvObjects.Add(_Camp_OilLampMiscItem)
	CampObjectMap_InvObjects.Add(c_Plastic_scrap)
	CampObjectMap_InvObjects.Add(c_Cloth_scrap)
	CampObjectMap_InvObjects.Add(c_Cloth_scrap)
	CampObjectMap_InvObjects.Add(_Camp_ConstructionLightMiscItem)

	CampDebug(0, "Map lengths: " + CampObjectMap_WorldObjects.Length + " " + CampObjectMap_InvObjects.Length)
endFunction

function PickUpCampsiteObjectByIndex(int aiRefIndex)
	ObjectReference ref = CampsiteObjects[aiRefIndex]
	if (ref as _Camp_PlaceableObjectBase)
		PlayerRef.AddItem((ref as _Camp_PlaceableObjectBase).Required_InventoryItem, 1, true)
		(ref as _Camp_PlaceableObjectBase).TakeDown()
	else
		if ref.GetBaseObject() == _Camp_PlaceableSettlementWorkshop
			; Don't destroy new settlement objects.
		else
			_Camp_CampsiteWorkshopREF.StoreInWorkshop(ref.GetBaseObject(), 1)
			TryToDisableAndDeleteRef(ref)
		endif
	endif
endFunction

function PickUpCampsiteObjectByRef(ObjectReference akReference)
	if (akReference as _Camp_PlaceableObjectBase)
		PlayerRef.AddItem((akReference as _Camp_PlaceableObjectBase).Required_InventoryItem, 1, true)
		(akReference as _Camp_PlaceableObjectBase).TakeDown()
	else
		_Camp_CampsiteWorkshopREF.StoreInWorkshop(akReference.GetBaseObject(), 1)
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

function WorkshopMode(bool aStart)
	if aStart
		campsite_workshop_in_use = true
	else
		;RemoveCampingItems()
		campsite_workshop_in_use = false
	endif
endFunction

; NOT WORKING
function GrantCampingItems()
	CampDebug(0, "Granting camping items.")
	int i = 0
	while i < CampObjectMap_InvObjects.Length
		int item_count = PlayerRef.GetitemCount(CampObjectMap_InvObjects[i])
		if item_count > 0 && CampObjectMap_InvObjects[i].HasKeyword(_CampingEquipmentMiscObject)
			_Camp_CampsiteWorkshopREF.AddItem(CampObjectMap_WorldObjects[i] as Form, item_count)
		else
			; scrap component, ignore.
		endif
		i += 1
	endWhile
endFunction

; NOT WORKING
function RemoveCampingItems()
	CampDebug(0, "Removing camping items.")
	int i = 0
	while i < CampObjectMap_WorldObjects.Length
		int item_count = _Camp_CampsiteWorkshopREF.GetItemCount(CampObjectMap_WorldObjects[i] as Form)
		CampDebug(0, CampObjectMap_WorldObjects[i] + " item_count " + item_count)
		if item_count > 0 && CampObjectMap_InvObjects[i].HasKeyword(_CampingEquipmentMiscObject)
			CampDebug(0, "Inv " + CampObjectMap_InvObjects[i] + " has misc keyword, give it to player.")
			PlayerRef.AddItem(CampObjectMap_InvObjects[i], item_count)
			_Camp_CampsiteWorkshopREF.RemoveItem(CampObjectMap_WorldObjects[i] as Form, item_count)
		else
			; grant component 2x amount
			PlayerRef.AddItem(CampObjectMap_InvObjects[i], item_count * 2)
			_Camp_CampsiteWorkshopREF.RemoveItem(CampObjectMap_WorldObjects[i] as Form, item_count)
		endif
		i += 1
	endWhile

	; Get rid of anything else
	_Camp_CampsiteWorkshopREF.RemoveAllItems(PlayerRef)
endFunction

function WorkshopObjectPlaced(ObjectReference akReference)
	if campsite_workshop_in_use
		CampDebug(0, "Adding " + akReference + " to CampsiteObjects.")
		bool success = ArrayAddRef(CampsiteObjects, akReference)
		if !success
			_Camp_CampsiteErrorFull.Show()

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
		else
			; Is this a weapon or armor?
			if akReference.GetBaseObject() as Weapon || akReference.GetBaseObject() as Armor
				; Allow
			else
				; If not, reset the object.
				last_scrapped_item_was_disallowed = true
				Form base = akReference.GetBaseObject()
				float scale = akReference.GetScale()
				ObjectReference new_ref = akReference.PlaceAtMe(base, abForcePersist = true)
				akReference.SetScale(scale)
				if akReference as _Camp_PlaceableObjectBase
					(akReference as _Camp_PlaceableObjectBase).TakeDown()
				endif
				_Camp_CampsiteErrorScrapping.Show()
				StartTimer(0.6)
			endif
		endif
		CampDebug(0, self + " managed object report: " + CampsiteObjects)
	endif
endFunction

Event OnTimer(int aiTimerID)
	last_scrapped_item_was_disallowed = false
	parent.OnTimer(aiTimerID)
EndEvent

function ItemAdded(Form akBaseItem, int aiItemCount)
	int i = 5
	while i > 0
		if last_scrapped_item_was_disallowed
			CampDebug(0, self + " not happy with that last scrap, remove results.")
			_Camp_CampsiteWorkshopREF.RemoveItem(akBaseItem, aiItemCount)
			return
		else
			Utility.Wait(0.1)
		endif
		i -= 1
	endWhile
	CampDebug(0, self + " last scrap was fine.")
endFunction