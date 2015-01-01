Scriptname _DE_ConjureShelterLesser extends ActiveMagicEffect  

import math
import debug 

_DE_GetCampingLegal property Legal auto
Static property XMarker auto
furniture property _DE_Shelter_L_Controller auto
message property _DE_Shelter_LegalError auto
Sound property MAGFail auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	if !Legal.GetCampingLegal()
		MAGFail.Play(Game.GetPlayer())
		_DE_Shelter_LegalError.Show()
		Return
	endif

	;trace("[FROSTFALL] Conjure Shelter effect started.")
	float[] fDistance = new float[2]
	fDistance = GetOffsets(Game.GetPlayer(), 130.0)
	ObjectReference myBedMarker = Game.GetPlayer().PlaceAtMe(XMarker)

	While !myBedMarker.Is3DLoaded()
	endWhile

	myBedMarker.SetPosition(Game.GetPlayer().GetPositionX() + fDistance[0], Game.GetPlayer().GetPositionY() + fDistance[1], Game.GetPlayer().GetPositionZ())
	myBedMarker.SetAngle(myBedMarker.GetAngleX(), myBedMarker.GetAngleY(), myBedMarker.GetAngleZ() + 180.0)
	myBedMarker.PlaceAtMe(_DE_Shelter_L_Controller)
	myBedMarker.Disable()
	myBedMarker.Delete()

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