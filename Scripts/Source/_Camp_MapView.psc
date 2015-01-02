scriptname _Camp_MapView Extends ObjectReference
 
Actor Property PlayerRef Auto
ObjectReference property CameraMarker auto
ObjectReference property CameraTarget auto
 
Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == PlayerRef
		debug.trace("[Campfire] Beginning movement!")
		;PlayerRef.SetAlpha(0.0)
		PlayerRef.SetGhost(True)
		Game.DisablePlayerControls(True, True, True, false, True, False, True)
		Utility.Wait(0.1)
		Game.ForceThirdPerson()
		Utility.Wait(0.1)
		PlayerRef.TranslateToRef(CameraMarker, 100.0, 100.0)
		Utility.Wait(1.0)
		debug.trace("[Campfire] Angle data (sample 1): X:" + PlayerRef.GetAngleX() + ", Z:" + PlayerRef.GetAngleZ())
		PlayerRef.SetAngle(45.0, 0.0, CameraMarker.GetAngleZ())
		debug.trace("[Campfire] Angle data (sample 2): X:" + PlayerRef.GetAngleX() + ", Z:" + PlayerRef.GetAngleZ())
		Utility.Wait(1.0)
		Game.ForceFirstPerson()
		Utility.Wait(5.0)
		;PlayerRef.SetAlpha(1.0)
		PlayerRef.SetGhost(False)
		Game.EnablePlayerControls()
		debug.trace("[Campfire] Ending movement!")
	EndIf
EndEvent