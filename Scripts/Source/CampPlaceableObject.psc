scriptname CampPlaceableObject extends _Camp_PlaceableObjectBase


ObjectReference property myMainObject auto hidden


bool initialized = false
float[] property OriginAng auto hidden

Event OnInit()
	while !self.Is3DLoaded()
	endWhile
	;We need to get out of OnInit() quickly, so member functions on this object can be called.
	RegisterForSingleUpdate(0.1)
endEvent

Event OnUpdate()
	if !initialized
		Initialize()
		return
	endif
	UpdateTentUseState(self)
endEvent

function Initialize()
	PlacementSystem = CampUtil.GetPlacementSystem()
	RotateOnStartUp()
	OriginAng = GetAngleData(self)
	PlaceObjects()
	PlacementSystem.wait_all()
	GetResults()
	GenerateDebugReport()
	initialized = true
endFunction

Event OnActivate(ObjectReference akActionRef)
	;Use / Pick Up / Cancel
EndEvent

function PlaceObjects()
	CampPlaceableObjectEx Extended = self as CampPlaceableObjectEx

	if PositionRef_CenterObjectOverride
		CenterObject = PositionRef_CenterObjectOverride
	else
		CenterObject = myMainObjectthingy
	endif


endFunction