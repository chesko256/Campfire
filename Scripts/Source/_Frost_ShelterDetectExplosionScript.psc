scriptname _Frost_ShelterDetectExplosionScript extends ObjectReference

ObjectReference property _Frost_ShelterDetectSensorRef auto
GlobalVariable property _Frost_ShelterDetected auto


;@TODO: switch to using origin; deprecate the sensor; fire from origin
Event OnInit()
	float dist = self.GetDistance(_Frost_ShelterDetectSensorRef)
	if dist < 1000.0
		debug.trace("========================== dist " + dist + " Taking shelter")
		_Frost_ShelterDetected.SetValueInt(1)
	else
		debug.trace("========================== dist " + dist + " NOT Taking shelter")
		_Frost_ShelterDetected.SetValueInt(2)
	endif
	self.Disable()
	self.Delete()
EndEvent