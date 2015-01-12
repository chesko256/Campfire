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
					;PlaceObject(akBaseObject, akReference)
				endif
			endif
		endif
	endif
endEvent

function PlaceObject(Form akBaseObject, ObjectReference akReferece)
	ExitMenus()
	debug.trace("[Campfire] akReference " + akReferece)
	debug.trace("[Campfire] akReferece as CampPlaceableMiscItem " + (akReferece as CampPlaceableMiscItem))
	debug.trace("[Campfire] akReferece as Required_FillOnlyOne_ActivatorPlacedObject " + (akReferece as CampPlaceableMiscItem).Required_FillOnlyOne_ActivatorPlacedObject)
	debug.trace("[Campfire] akReferece as Required_FillOnlyOne_FurniturePlacedObject " + (akReferece as CampPlaceableMiscItem).Required_FillOnlyOne_FurniturePlacedObject)
	debug.trace("[Campfire] akReferece as Required_FillOnlyOne_ContainerPlacedObject " + (akReferece as CampPlaceableMiscItem).Required_FillOnlyOne_ContainerPlacedObject)
	Form VisualizationObject_PlacedObject = (akReferece as CampPlaceableMiscItem).Required_FillOnlyOne_ActivatorPlacedObject as Form
	if !VisualizationObject_PlacedObject
		VisualizationObject_PlacedObject = (akReferece as CampPlaceableMiscItem).Required_FillOnlyOne_FurniturePlacedObject as Form
	endif
	if !VisualizationObject_PlacedObject
		VisualizationObject_PlacedObject = (akReferece as CampPlaceableMiscItem).Required_FillOnlyOne_ContainerPlacedObject as Form
	endif
	Activator VisualizationObject = (VisualizationObject_PlacedObject as _Camp_PlaceableObjectBase).Required_PlacementIndicator
	PlayerRef.PlaceAtMe(VisualizationObject)
	PlayerRef.RemoveItem(akBaseObject, 1, true)
endFunction