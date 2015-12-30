Scriptname CampConjureObjectEffect extends ActiveMagicEffect  

import CampUtil
import _CampInternal
import TentSystem
import math

Activator property Required_ActivatorToSpawn auto
{ DESCRIPTION: Required: The conjured activator to spawn. Fill this OR the FurnitureToSpawn, not both. }
Furniture property Required_FurnitureToSpawn auto
{ DESCRIPTION: Required: The conjured activator to spawn. Fill this OR the ActivatorToSpawn, not both. }
float property Setting_SpawnDistanceFromPlayer = 130.0 auto
{ DESCRIPTION: Optional: How far away (in front of the player) to spawn the shelter. Default: 130.0}
Scroll property Setting_ScrollToReturn auto
{ DESCRIPTION: Optional: The scroll to return to the player if this effect fails. Used on Scroll effects. }

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if !LegalToCampHere() && (IsCrimeToPlaceInTowns(Required_ActivatorToSpawn) || IsCrimeToPlaceInTowns(Required_FurnitureToSpawn))
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
	if Required_ActivatorToSpawn
		mySpawnMarker.PlaceAtMe(Required_ActivatorToSpawn, abInitiallyDisabled = true)
	else
		mySpawnMarker.PlaceAtMe(Required_FurnitureToSpawn, abInitiallyDisabled = true)
	endif
	mySpawnMarker.Disable()
	mySpawnMarker.Delete()
	mySpawnMarker = None
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