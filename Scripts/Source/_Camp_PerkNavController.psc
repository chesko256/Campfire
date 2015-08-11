scriptname _Camp_PerkNavController extends _Camp_PlaceableObjectBase
{Handles perk tree navigation behavior.}

import _CampInternal

Actor property PlayerRef auto

ObjectReference property myCampfire auto hidden
ObjectReference property myPerkNextBug auto hidden
ObjectReference property myPerkPrevBug auto hidden
ObjectReference property myPerkExitBug auto hidden

Activator property _Camp_PerkExitBug auto
Activator property _Camp_PerkNextBug auto
Activator property _Camp_PerkPrevBug auto

ObjectReference property PerkPrevBugFuture auto hidden
ObjectReference property PerkNextBugFuture auto hidden
ObjectReference property PerkExitBugFuture auto hidden

ObjectReference property PerkNavController_PositionRef auto
ObjectReference property PerkPrevBug_PositionRef auto
ObjectReference property PerkNextBug_PositionRef auto
ObjectReference property PerkExitBug_PositionRef auto

bool property TakedownInitiated = false auto hidden
bool property Locked = true auto hidden

float UPDATE_INTERVAL = 3.0

function Initialize()
	self.SetAngle(0.0, 0.0, \
                  self.GetAngleZ() + self.GetHeadingAngle(PlayerRef) + 180.0)
	parent.Initialize()
endFunction

function Update()
    CheckConditions()
endFunction

function CheckConditions()
    if PlayerRef.GetDistance(self) > 480.0
        (myCampfire as CampCampfire).TakeDownPerkTree()
        TakeDown()
    elseif !myCampfire
    	; sanity check
        TakeDown()
    elseif TakedownInitiated
        ; stop updating
    else
        RegisterForSingleUpdate(UPDATE_INTERVAL)
    endif
endFunction

function AssignCampfire(ObjectReference akCampfire)
    myCampfire = akCampfire
    int i = 0
    while !(self as _Camp_PlaceableObjectBase).initialized && i < 50
        utility.wait(0.1)
        i += 1
    endWhile
    RegisterForSingleUpdate(UPDATE_INTERVAL)
endFunction

function PlaceObjects()
    CenterObject = PerkNavController_PositionRef

    ;@TODO: If more than one registered tree...
    	PerkPrevBugFuture = PlaceObject_Bug(_Camp_PerkPrevBug, PerkPrevBug_PositionRef)
    	PerkNextBugFuture = PlaceObject_Bug(_Camp_PerkNextBug, PerkNextBug_PositionRef)
    ;@TODO: endif

    PerkExitBugFuture = PlaceObject_Bug(_Camp_PerkExitBug, PerkExitBug_PositionRef)
endFunction

function GetResults()
	if PerkExitBugFuture
		myPerkExitBug = GetFuture(PerkExitBugFuture).get_result()
		myPerkExitBug.SetScale(PerkExitBug_PositionRef.GetScale())
		myPerkExitBug.EnableNoWait()
		(myPerkExitBug as _Camp_ExitBug).AssignController(self)
	endif
	utility.wait(0.5)
	if PerkPrevBugFuture
		myPerkPrevBug = GetFuture(PerkPrevBugFuture).get_result()
		myPerkPrevBug.SetScale(PerkPrevBug_PositionRef.GetScale())
		myPerkPrevBug.EnableNoWait()
	endif
	utility.wait(0.3)
	if PerkNextBugFuture
		myPerkNextBug = GetFuture(PerkNextBugFuture).get_result()
		myPerkNextBug.SetScale(PerkNextBug_PositionRef.GetScale())
		myPerkNextBug.EnableNoWait()
	endif
	Locked = false
endFunction

function TakeDown()
	TakedownInitiated = true
	UnregisterForUpdate()
	if myCampfire
		(myCampfire as CampCampfire).myPerkNavController = None
	endif
	TryToDisableAndDeleteRef(myPerkNextBug)
	TryToDisableAndDeleteRef(myPerkPrevBug)
	TryToDisableAndDeleteRef(myPerkExitBug)
	TryToDisableAndDeleteRef(self)
endFunction

function NextClicked()
	CampCampfire cf = myCampfire as CampCampfire
	_Camp_PerkNodeController nc = cf.myPerkNodeController as _Camp_PerkNodeController
	if nc.Locked || Locked
		; pass
	else
		Locked = true

		Locked = false
	endif
endFunction

function PrevClicked()
	CampCampfire cf = myCampfire as CampCampfire
	_Camp_PerkNodeController nc = cf.myPerkNodeController as _Camp_PerkNodeController
	if nc.Locked || Locked
		; pass
	else
		Locked = true

		Locked = false
	endif
endFunction

function ExitClicked()
	CampCampfire cf = myCampfire as CampCampfire
	_Camp_PerkNodeController nc = cf.myPerkNodeController as _Camp_PerkNodeController
	if nc.Locked || Locked
		; pass
	else
		Locked = true
		(myCampfire as CampCampfire).TakeDownPerkTree()
    	TakeDown()
    	Locked = false
	endif
endFunction

ObjectReference function PlaceObject_Bug(Activator akBug, ObjectReference akPositionRef)
	return PlacementSystem.PlaceObject(self, akBug, akPositionRef, initially_disabled = true)
endFunction