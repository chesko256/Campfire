Scriptname CampConjureShelterEffect extends ActiveMagicEffect  

import CampUtil
import _CampInternal
import TentSystem
import math

Activator property Required_ShelterToSpawn auto
{ DESCRIPTION: Required: The conjured shelter activator to spawn. }
float property Setting_SpawnDistanceFromPlayer = 130.0 auto
{ DESCRIPTION: Optional: How far away (in front of the player) to spawn the shelter. Default: 130.0}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if !LegalToCampHere() && IsCrimeToPlaceInTowns(Required_ShelterToSpawn)
		int i = GetCampingIllegalMessage().Show()
		if i == 0
			; continue
		else
			return
		endif
	endif

	Static XMarker = Game.GetFormFromFile(0x0000003B, "Skyrim.esm") as Static
	float[] fDistance = new float[2]
	fDistance = GetOffsets(Game.GetPlayer(), Setting_SpawnDistanceFromPlayer)
	ObjectReference mySpawnMarker = PlaceAndWaitFor3DLoaded(Game.GetPlayer(), XMarker)
	mySpawnMarker.SetPosition(Game.GetPlayer().GetPositionX() + fDistance[0], Game.GetPlayer().GetPositionY() + fDistance[1], Game.GetPlayer().GetPositionZ())
	mySpawnMarker.SetAngle(0.0, 0.0, mySpawnMarker.GetAngleZ())
	mySpawnMarker.PlaceAtMe(Required_ShelterToSpawn)
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