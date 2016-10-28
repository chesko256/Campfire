scriptname _Frost_InnerFireMonitorScript extends ReferenceAlias

import FrostUtil

Actor property PlayerRef auto
Furniture property _Frost_SitMarkerInnerFire auto

Event OnSit(ObjectReference akFurniture)
	Form BaseObject = akFurniture.GetBaseObject()
	if BaseObject && BaseObject == _Frost_SitMarkerInnerFire
		SendEvent_OnInnerFireMeditate(true)
	endif
EndEvent

Event OnGetUp(ObjectReference akFurniture)
	Form BaseObject = akFurniture.GetBaseObject()
	if BaseObject && BaseObject == _Frost_SitMarkerInnerFire
		SendEvent_OnInnerFireMeditate(false)
		akFurniture.Disable()
		akFurniture.Delete()
	endif
EndEvent


function SendEvent_OnInnerFireMeditate(bool abMeditating)
	FallbackEventEmitter emitter = GetEventEmitter_OnInnerFireMeditate()
	int handle = emitter.Create("Frost_OnInnerFireMeditate")
	if handle
		emitter.PushBool(handle, abMeditating)
		emitter.Send(handle)
	endif
endFunction