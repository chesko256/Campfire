Scriptname _Camp_WoodAliasScript extends ReferenceAlias

import math

ObjectReference property _Camp_HarvestLogActivatorRef auto

Event OnInit()
	float[] dist = GetGlobalOffset(self.GetRef(), -64.0, -90.0)
	_Camp_HarvestLogActivatorRef.MoveTo(self.GetRef(), dist[1], dist[0])
	debug.trace("[Campfire] x dist " + dist[1] + " y dist " + dist[0])

EndEvent

float[] function GetGlobalOffset(ObjectReference akSource, Float afDistance, float afOffset = 0.0)
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