Scriptname CampConjureObjectEffect extends ActiveMagicEffect  

import CampUtil
import _CampInternal
import TentSystem
import math

Activator property Required_ActivatorToSpawn auto
{ DESCRIPTION: Required: The conjured activator to spawn. Fill this OR the FurnitureToSpawn, not both. }
Furniture property Required_FurnitureToSpawn auto
{ DESCRIPTION: Required: The conjured furniture to spawn. Fill this OR the ActivatorToSpawn, not both. }
float property Setting_SpawnDistanceFromPlayer = 70.0 auto
{ DESCRIPTION: Optional: How far away (in front of the player) to spawn the shelter. Default: 130.0}
Scroll property Setting_ScrollToReturn auto
{ DESCRIPTION: Optional: The scroll to return to the player if this effect fails. Used on Scroll effects. }

Event OnEffectStart(Actor akTarget, Actor akCaster)
	bool placement_is_illegal = false
	if !LegalToCampHere() && (IsCrimeToPlaceInTowns(Required_ActivatorToSpawn) || IsCrimeToPlaceInTowns(Required_FurnitureToSpawn))
		placement_is_illegal = true
		int i = GetCampingIllegalMessage().Show()
		if i == 0
			; continue
		else
			if Setting_ScrollToReturn
				Game.GetPlayer().AddItem(Setting_ScrollToReturn, 1, true)
			endif
			return
		endif
	endif

	Static XMarker = Game.GetFormFromFile(0x0000003B, "Skyrim.esm") as Static
	float[] fDistance = new float[2]
	fDistance = GetOffsets(Game.GetPlayer(), Setting_SpawnDistanceFromPlayer)
	ObjectReference mySpawnMarker = PlaceAndWaitFor3DLoaded(Game.GetPlayer(), XMarker)
	mySpawnMarker.SetPosition(Game.GetPlayer().GetPositionX() + fDistance[0], Game.GetPlayer().GetPositionY() + fDistance[1], Game.GetPlayer().GetPositionZ())
	mySpawnMarker.SetAngle(0.0, 0.0, mySpawnMarker.GetAngleZ())

	ObjectReference campitem
	if Required_ActivatorToSpawn
		campitem = mySpawnMarker.PlaceAtMe(Required_ActivatorToSpawn, abInitiallyDisabled = true)
	else
		campitem = mySpawnMarker.PlaceAtMe(Required_FurnitureToSpawn, abInitiallyDisabled = true)
	endif
	mySpawnMarker.Disable()
	mySpawnMarker.Delete()
	mySpawnMarker = None

	; Raise optional SKSE event
    SendEvent_OnObjectPlaced(campitem)

	if placement_is_illegal
    	;Raise the ire of those around you
    	Quest crime_tracking_quest = GetCrimeTrackingQuest()
    	ReferenceAlias illegal_item_1 = GetCrimeIllegalItemAlias(1)
    	ReferenceAlias illegal_item_2 = GetCrimeIllegalItemAlias(2)
    	ReferenceAlias illegal_item_3 = GetCrimeIllegalItemAlias(3)
	
    	crime_tracking_quest.Stop()
    	int i = 0
    	while !crime_tracking_quest.IsStopped() && i < 30
        	utility.wait(0.1)
        	i += 1
    	endWhile
    	crime_tracking_quest.Start()
    	if !illegal_item_1.GetRef()
        	illegal_item_1.ForceRefTo(campitem)
    	elseif !illegal_item_2.GetRef()
        	illegal_item_2.ForceRefTo(campitem)
    	elseif !illegal_item_3.GetRef()
        	illegal_item_3.ForceRefTo(campitem)
    	endif
    endif
endEvent

float[] function GetOffsets(Actor akSource, Float afDistance = 100.0, float afOffset = 0.0)
	Float A = akSource.GetAngleZ() + afOffset
	Float YDist = Sin(A)
	Float XDist = Cos(A)

	XDist *= afDistance
	YDist *= afDistance

	Float[] Offsets = New Float[2]
	Offsets[0] = YDist
	Offsets[1] = XDist
	Return Offsets
EndFunction