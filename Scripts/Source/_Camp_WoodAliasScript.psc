Scriptname _Camp_WoodAliasScript extends ReferenceAlias

import math

ObjectReference property required_activator_aspen_stump auto
ObjectReference property required_activator_aspen_log auto
ObjectReference property required_activator_small_pine_log auto
ObjectReference property required_activator_small_pine_stump auto
FormList property _Camp_HarvestableWood_AspenStumps auto
FormList property _Camp_HarvestableWood_AspenLogs auto
FormList property _Camp_HarvestableWood_SmallPineLogs auto
FormList property _Camp_HarvestableWood_SmallPineStumps auto

Event OnInit()
	ObjectReference woodref = self.GetRef()
	Form woodform
	if woodref
		woodform = woodref.GetBaseObject()
		debug.trace("[Campfire] Alias " + self + " assigned new reference " + woodref)

		if _Camp_HarvestableWood_AspenStumps.HasForm(woodform)
			Handle_AspenStump(woodref)
		elseif _Camp_HarvestableWood_AspenLogs.HasForm(woodform)
			Handle_AspenLog(woodref)
		elseif _Camp_HarvestableWood_SmallPineLogs.HasForm(woodform)
			Handle_SmallPineLog(woodref)
		elseif _Camp_HarvestableWood_SmallPineStumps.HasForm(woodform)
			Handle_SmallPineStump(woodref)
		endif
	endif
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

function Handle_AspenStump(ObjectReference akReference)
	;@TODO: -4 Y Adj
	required_activator_aspen_stump.MoveTo(akReference)
	(required_activator_aspen_stump as _Camp_WoodActivatorScript).my_wood_ref = akReference
endFunction
function Handle_AspenLog(ObjectReference akReference)
	required_activator_aspen_log.MoveTo(akReference)
	(required_activator_aspen_log as _Camp_WoodActivatorScript).my_wood_ref = akReference
endFunction
function Handle_SmallPineLog(ObjectReference akReference)
	;@TODO: -20 Z Adj
	required_activator_small_pine_log.MoveTo(akReference)
	(required_activator_small_pine_log as _Camp_WoodActivatorScript).my_wood_ref = akReference
endFunction
function Handle_SmallPineStump(ObjectReference akReference)
	required_activator_small_pine_stump.MoveTo(akReference)
	(required_activator_small_pine_stump as _Camp_WoodActivatorScript).my_wood_ref = akReference
endFunction

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	debug.trace("[Campfire] Wood harvesting node hit!")
EndEvent

;/float[] dist = GetGlobalOffset(self.GetRef(), -64.0, -90.0)
	_Camp_HarvestLogActivatorRef.MoveTo(self.GetRef(), dist[1], dist[0])
	debug.trace("[Campfire] x dist " + dist[1] + " y dist " + dist[0])
/;