Scriptname _DE_Visualize_Effect_Campfire extends ActiveMagicEffect

import math

Actor property PlayerRef auto
Activator property _DE_CampVis_Campfire auto
GlobalVariable property _DE_CampsitePlacementOn auto
GlobalVariable property _DE_Setting_SimplePlacement auto
Activator property _DE_Campfire_Simple auto
ObjectReference property _DE_XMarker_Placement auto
ObjectReference property _DE_Anchor auto
_Camp_LegalAreaCheck property Legal auto
message property _DE_PlacedObjectIllegalLocationNotice auto
message property _DE_Placement_InUse auto

Event OnInit()
	if _DE_CampsitePlacementOn.GetValueInt() == 1
		if _DE_Setting_SimplePlacement.GetValueInt() == 2
			if !(Legal.GetCampingLegal())
				_DE_PlacedObjectIllegalLocationNotice.Show()
			else
				float[] myOffset = new float[2]
				myOffset = GetOffsets(PlayerRef, 200.0)
				_DE_XMarker_Placement.MoveTo(PlayerRef, myOffset[0], myOffset[1], abMatchRotation = false)
				_DE_XMarker_Placement.PlaceAtMe(_DE_Campfire_Simple)
				_DE_XMarker_Placement.MoveTo(_DE_Anchor)
			endif
		else
			PlayerRef.PlaceAtMe(_DE_CampVis_Campfire, abInitiallyDisabled = true)
		endif
	else
		_DE_Placement_InUse.Show()
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