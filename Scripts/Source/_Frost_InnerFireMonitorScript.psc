scriptname _Frost_InnerFireMonitorScript extends ReferenceAlias

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
	int handle = ModEvent.Create("Frost_OnInnerFireMeditate")
	if handle
		ModEvent.PushBool(handle, abMeditating)
		ModEvent.Send(handle)
	endif
endFunction