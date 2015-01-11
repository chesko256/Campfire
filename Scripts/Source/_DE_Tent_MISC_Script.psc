Scriptname _DE_Tent_MISC_Script extends ReferenceAlias
{Catches equip events on the Player and begins placement of campsite items.}

; #SUMMARY# =====================================================================================================================
; Name ...................: _DE_Tent_MISC_Script
; Attached To (EditorID)..: 
; Description ............: Catches equip events on the Player and begins placement of campsite items.
; Author .................: Chesko
; Last Approved (version) : 
; Status .................: 
; Remarks ................: 
; ===============================================================================================================================

;@TODO: Develop generic interface to placeable items
;@TODO: Rename

import debug
import CampUtil

Actor property PlayerRef auto

GlobalVariable property _DE_CampsitePlacementOn auto
GlobalVariable property _DE_Setting_SimplePlacement auto

formlist property _DE_MiscTentObjects auto

Ingredient property BoneMeal auto
Furniture property _DE_MortarAndPestleFurniture auto
Furniture property _DE_TanningRack auto

message property _DE_Enchanting_BoneMealError auto
message property _DE_Placement_Combat auto
message property _DE_Placement_Swimming auto
message property _DE_Placement_InUse auto

;@TODO: Rework simple placement to prevent stack usage
Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if _DE_Setting_SimplePlacement.GetValueInt() != 2
		if _DE_CampsitePlacementOn.GetValue() == 1
			if IsPlaceableObject(akBaseObject)
				if PlayerCanPlaceObjects()
					PlaceObject(akBaseObject)
				endif
			endif
		endif
	endif
endEvent

function PlaceObject(Form akBaseObject)
	ExitMenus()
	PlayerRef.RemoveItem(akBaseObject, 1, true)
	Form VisualizationObject_PlacedObject = (akBaseObject as CampPlaceableMiscItem).Required_PlacedObject
	Activator VisualizationObject = (VisualizationObject_PlacedObject as _Camp_PlaceableObjectBase).Required_PlacementIndicator
	PlayerRef.PlaceAtMe(VisualizationObject)
endFunction