Scriptname _DE_Tent_MISC_Script extends ReferenceAlias
{Swaps the dropped misc item for the Activator variant.}

; #SUMMARY# =====================================================================================================================
; Name ...................: _DE_Tent_MISC_Script
; Attached To (EditorID)..: 
; Description ............: Handles catching the drop event for all misc inventory items that are supposed to do something.
; Author .................: Chesko
; Last Approved (version) : 2.0
; Status .................: Complete
; Remarks ................: 
; ===============================================================================================================================

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

;GlobalVariable property _DE_SwimState auto
GlobalVariable property _DE_CampsitePlacementOn auto
GlobalVariable property _DE_Setting_SimplePlacement auto
;Form list for Inventory Event Filter
formlist property _DE_MiscTentObjects auto
formlist property _Camp_PlaceableObjects auto

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

message property _DE_CampTent2_DropChoice auto
message property _DE_CookingPot_DropChoice auto
message property _DE_Enchanting_DropChoice auto
message property _DE_TanningRack_DropChoice auto
message property _DE_Enchanting_BoneMealError auto
message property _DE_Placement_Combat auto
message property _DE_Placement_Multiple auto
message property _DE_Placement_Swimming auto
message property _DE_Placement_InUse auto

Event OnInit()
	;AddInventoryEventFilter(_DE_MiscTentObjects)
endEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if _DE_Setting_SimplePlacement.GetValueInt() != 2
		if _DE_CampsitePlacementOn.GetValue() == 1
			if _Camp_PlaceableObjects.HasForm(akBaseObject)
				if PlayerCanPlaceObjects()
					;int i = _DE_CampTent2_DropChoice.Show()	;@TODO: Delete this message
					Game.DisablePlayerControls()
					Game.EnablePlayerControls()
					akReference.Delete()
					PlaceObject(akBaseObject, akReference)
					TentVisualization(akBaseObject)
				endif
			endif
		endif
	endif
endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	;/if !akDestContainer
		;Add keyword filtering to speed this up
		if _DE_Setting_SimplePlacement.GetValueInt() != 2
			if _DE_MiscTentObjects.HasForm(akBaseItem)
				if _DE_CampsitePlacementOn.GetValue() == 1
					if PlayerRef.IsInCombat()
						_DE_Placement_Combat.Show()
						PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
						return
					elseif GetFrostfallSwimState()
						_DE_Placement_Swimming.Show()
						PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
						return
					elseif aiItemCount > 1
						_DE_Placement_Multiple.Show()
						PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
						return
					elseif PlayerRef.IsOnMount()
						;silently fail
						return
					else
						if PlayerRef.GetSitState() != 0 || PlayerRef.GetSleepState() != 0	;Are we using a tanning rack?
							;notification("I'm using something!")
						else
							int i = _DE_CampTent2_DropChoice.Show()
							if i == 0
								Game.DisablePlayerControls()
								Game.EnablePlayerControls()
								
							else
								;do nothing
							endif
						endif
					endif		
				else	
					_DE_Placement_InUse.Show()
					PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
					return
				endif
			elseif akBaseItem == _DE_EnchantingMISC
				if _DE_CampsitePlacementOn.GetValue() == 1
					if PlayerRef.IsInCombat()
						_DE_Placement_Combat.Show()
						PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
						return
					elseif GetFrostfallSwimState()
						_DE_Placement_Swimming.Show()
						PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
						return
					elseif aiItemCount > 1
						_DE_Placement_Multiple.Show()
						PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
						return
					elseif PlayerRef.IsOnMount()
						;silently fail
						return
					elseif PlayerRef.GetSitState() != 0 || PlayerRef.GetSleepState() != 0	;Are we using a tanning rack?
						;notification("I'm using something!")
					else
						int i = _DE_Enchanting_DropChoice.Show()
						if i == 0
							if PlayerRef.GetItemCount(BoneMeal) < 1
								_DE_Enchanting_BoneMealError.Show()
								PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
								return
							else
								Game.DisablePlayerControls()
								Game.EnablePlayerControls()
								akItemReference.Delete()
								EnchantVisualization()
							endif
						else
							;do nothing
						endif
					endif
				else	
					_DE_Placement_InUse.Show()
					PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
					return
				endif
			elseif akBaseItem == _DE_CampTanningRack
				if _DE_CampsitePlacementOn.GetValue() == 1
					if PlayerRef.IsInCombat()
						_DE_Placement_Combat.Show()
						PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
						return
					elseif GetFrostfallSwimState()
						_DE_Placement_Swimming.Show()
						PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
						return
					elseif aiItemCount > 1
						_DE_Placement_Multiple.Show()
						PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
						return
					elseif PlayerRef.IsOnMount()
						;silently fail
						return
					elseif PlayerRef.GetSitState() != 0 || PlayerRef.GetSleepState() != 0	;Are we using a tanning rack?
						;notification("I'm using something!")
					else
						int i = _DE_TanningRack_DropChoice.Show()
						if i == 0
							Game.DisablePlayerControls()
							Game.EnablePlayerControls()
							akItemReference.Delete()
							TanningRackVisualization()
						else
							;do nothing
						endif
					endif
				else	
					_DE_Placement_InUse.Show()
					PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
					return
				endif
			elseif akBaseItem == _DE_CampCookingPot_MISC
				if _DE_CampsitePlacementOn.GetValue() == 1
					if PlayerRef.IsInCombat()
						_DE_Placement_Combat.Show()
						PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
						return
					elseif GetFrostfallSwimState()
						_DE_Placement_Swimming.Show()
						PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
						return
					elseif aiItemCount > 1
						_DE_Placement_Multiple.Show()
						PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
						return
					elseif PlayerRef.IsOnMount()
						;silently fail
						return
					elseif PlayerRef.GetSitState() != 0 || PlayerRef.GetSleepState() != 0	;Are we using a tanning rack?
						;notification("I'm using something!")
					else
						int i = _DE_CookingPot_DropChoice.Show()
						if i == 0
							Game.DisablePlayerControls()
							Game.EnablePlayerControls()
							akItemReference.Delete()
							CookingPotVisualization()
						else
							;do nothing
						endif
					endif
				else	
					_DE_Placement_InUse.Show()
					PlayerRef.AddItem(akItemReference, aiItemCount, abSilent = true)
					return
				endif
			else
				return
			endif
		endif
	endif/;
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

function PlaceObject(Form akBaseObject, ObjectReference akReference)
	akReference.Delete()
	ExitMenus()
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