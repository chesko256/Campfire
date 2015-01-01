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

Activator property _DE_CampVis_CampEnchanting auto
Activator property _DE_CampVis_CampTanningRack auto
Activator property _DE_CampVis_CampTentHideSmall auto
Activator property _DE_CampVis_CampTentHideSmall2BR auto
Activator property _DE_CampVis_CampTentHideLarge auto
Activator property _DE_CampVis_CampTentLeatherSmall auto
Activator property _DE_CampVis_CampTentLeatherSmall2BR auto
Activator property _DE_CampVis_CampTentLeatherLarge1BR auto
Activator property _DE_CampVis_CampTentLeatherLarge2BR auto
Activator property _DE_CampVis_CampTentLeatherLarge3BR auto
Activator property _DE_CampVis_CampTentHideLarge1BR auto
Activator property _DE_CampVis_CampTentHideLarge2BR auto
Activator property _DE_CampVis_CampTentHideLarge3BR auto
Activator property _DE_CampVis_CampTentHideLarge4BR auto
Activator property _DE_CampVis_CookingPot auto

GlobalVariable property _DE_CampsitePlacementOn auto
GlobalVariable property _DE_Setting_SimplePlacement auto

formlist property _DE_MiscTentObjects auto

;Misc (Inventory) items
MiscObject property _DE_EnchantingMISC auto
MiscObject property _DE_CampTanningRack auto
MiscObject property _DE_Alchemy_MortarPestleMISC auto
MiscObject property _DE_CampTent2_HideSmall_MISC auto
MiscObject property _DE_CampTent2_HideSmall2BR_MISC auto
MiscObject property _DE_CampTent2_LeatherSmall1BR_MISC auto
MiscObject property _DE_CampTent2_LeatherSmall2BR_MISC auto
MiscObject property _DE_CampTentHideLarge_1BR auto
MiscObject property _DE_CampTentHideLarge_2BR auto
MiscObject property _DE_CampTentHideLarge_3BR auto
MiscObject property _DE_CampTentHideLarge_4BR auto
MiscObject property _DE_CampTentLeatherLarge_1BR auto
MiscObject property _DE_CampTentLeatherLarge_2BR auto
MiscObject property _DE_CampTentLeatherLarge_3BR auto
MiscObject property _DE_CampCookingPot_MISC auto
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

function CookingPotVisualization()
	PlayerRef.PlaceAtMe(_DE_CampVis_CookingPot)
endFunction

function EnchantVisualization()
	PlayerRef.PlaceAtMe(_DE_CampVis_CampEnchanting)
endFunction

function TanningRackVisualization()
	PlayerRef.PlaceAtMe(_DE_CampVis_CampTanningRack)
endFunction

function TentVisualization(form akBaseItem)
	if akBaseItem == _DE_CampTent2_HideSmall_MISC
		PlayerRef.PlaceAtMe(_DE_CampVis_CampTentHideSmall)
	elseif akBaseItem == _DE_CampTent2_HideSmall2BR_MISC
		PlayerRef.PlaceAtMe(_DE_CampVis_CampTentHideSmall2BR)
	elseif akBaseItem == _DE_CampTent2_LeatherSmall1BR_MISC
		PlayerRef.PlaceAtMe(_DE_CampVis_CampTentLeatherSmall)
	elseif akBaseItem == _DE_CampTent2_LeatherSmall2BR_MISC
		PlayerRef.PlaceAtMe(_DE_CampVis_CampTentLeatherSmall2BR)
	elseif akBaseItem == _DE_CampTentLeatherLarge_1BR
		PlayerRef.PlaceAtMe(_DE_CampVis_CampTentLeatherLarge1BR)
	elseif akBaseItem == _DE_CampTentLeatherLarge_2BR
		PlayerRef.PlaceAtMe(_DE_CampVis_CampTentLeatherLarge2BR)
	elseif akBaseItem == _DE_CampTentLeatherLarge_3BR
		PlayerRef.PlaceAtMe(_DE_CampVis_CampTentLeatherLarge3BR)
	elseif akBaseItem == _DE_CampTentHideLarge_1BR
		PlayerRef.PlaceAtMe(_DE_CampVis_CampTentHideLarge1BR)
	elseif akBaseItem == _DE_CampTentHideLarge_2BR
		PlayerRef.PlaceAtMe(_DE_CampVis_CampTentHideLarge2BR)
	elseif akBaseItem == _DE_CampTentHideLarge_3BR
		PlayerRef.PlaceAtMe(_DE_CampVis_CampTentHideLarge3BR)
	elseif akBaseItem == _DE_CampTentHideLarge_4BR
		PlayerRef.PlaceAtMe(_DE_CampVis_CampTentHideLarge4BR)
	endif
endFunction

function PlaceObject(Form akBaseObject)
	ExitMenus()
	PlayerRef.RemoveItem(akBaseObject, 1, true)
	if _DE_MiscTentObjects.HasForm(akBaseObject)
		TentVisualization(akBaseObject)
	elseif akBaseObject == _DE_EnchantingMISC
		EnchantVisualization()
	elseif akBaseObject == _DE_CampTanningRack
		TanningRackVisualization()
	elseif akBaseObject == _DE_CampCookingPot_MISC
		CookingPotVisualization()
	elseif akBaseObject == _DE_Alchemy_MortarPestleMISC
		PlayerRef.PlaceAtMe(_DE_MortarAndPestleFurniture)
	endif
endFunction