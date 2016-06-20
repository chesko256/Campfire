scriptname _Camp_PerkNavController extends _Camp_PlaceableObjectBase
{Handles perk tree navigation behavior.}

import _CampInternal
import CampUtil

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
bool property InteractionLocked = true auto hidden

float UPDATE_INTERVAL = 3.0

function Initialize()
	self.SetAngle(0.0, 0.0, \
                  self.GetAngleZ() + self.GetHeadingAngle(PlayerRef) + 180.0)
	parent.Initialize()
	CheckCampfireExists()
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

    if GetCompatibilitySystem()._Camp_PerkNodeControllerCount.GetValueInt() > 1
    	PerkPrevBugFuture = PlaceObject_Bug(_Camp_PerkPrevBug, PerkPrevBug_PositionRef)
    	PerkNextBugFuture = PlaceObject_Bug(_Camp_PerkNextBug, PerkNextBug_PositionRef)
    endif

    PerkExitBugFuture = PlaceObject_Bug(_Camp_PerkExitBug, PerkExitBug_PositionRef)
endFunction

function GetResults()
	if PerkExitBugFuture
		myPerkExitBug = GetFuture(PerkExitBugFuture).get_result()
		myPerkExitBug.SetScale(PerkExitBug_PositionRef.GetScale())
		myPerkExitBug.EnableNoWait()
		(myPerkExitBug as _Camp_ExitBug).AssignController(self)
		PerkExitBugFuture = None
	endif
	utility.wait(0.5)
	if PerkPrevBugFuture
		myPerkPrevBug = GetFuture(PerkPrevBugFuture).get_result()
		myPerkPrevBug.SetScale(PerkPrevBug_PositionRef.GetScale())
		myPerkPrevBug.EnableNoWait()
		(myPerkPrevBug as _Camp_PrevBug).AssignController(self)
		PerkPrevBugFuture = None
	endif
	utility.wait(0.3)
	if PerkNextBugFuture
		myPerkNextBug = GetFuture(PerkNextBugFuture).get_result()
		myPerkNextBug.SetScale(PerkNextBug_PositionRef.GetScale())
		myPerkNextBug.EnableNoWait()
		(myPerkNextBug as _Camp_NextBug).AssignController(self)
		PerkNextBugFuture = None
	endif
	InteractionLocked = false
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

	myPerkNextBug = None
	myPerkPrevBug = None
	myPerkExitBug = None

	TryToDisableAndDeleteRef(self)
endFunction

function NextClicked()
	if InteractionLocked
		; pass
	else
		InteractionLocked = true
		(myCampfire as CampCampfire).ShowNextPerkTree()
		InteractionLocked = false
	endif
endFunction

function PrevClicked()
	if InteractionLocked
		; pass
	else
		InteractionLocked = true
		(myCampfire as CampCampfire).ShowPrevPerkTree()
		InteractionLocked = false
	endif
endFunction

function ExitClicked()
	if InteractionLocked
		; pass
	else
		InteractionLocked = true
		(myCampfire as CampCampfire).TakeDownPerkTree()
    	TakeDown()
    	InteractionLocked = false
	endif
endFunction

ObjectReference function PlaceObject_Bug(Activator akBug, ObjectReference akPositionRef)
	return PlacementSystem.PlaceObject(self, akBug, akPositionRef, initially_disabled = true, is_temp = is_temporary)
endFunction

function CheckCampfireExists()
    ; Campfire 1.8 Fix: Try to find a nearby campfire and kill myself if not found.
    FormList _Camp_CampfireCampfires = Game.GetFormFromFile(0x06BBE8, "Campfire.esm") as FormList
    ObjectReference nearbyCampfire = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_CampfireCampfires, self, 100.0)
    if !nearbyCampfire
        CampDebug(2, "(Init/Attach) Found invalid Campfire perk bug nav controller " + self + ". Cleaning up.")
        int i = 0
        while !initialized && i < 20
            Utility.Wait(1)
            i += 1
        endWhile
        TakeDown()
        CampDebug(2, self + " removed.")
    endif
endFunction

Event OnCellAttach()
    CheckCampfireExists()
EndEvent

Event OnCellDetach()
    if !myCampfire
    	CampDebug(2, "(Detach) Found invalid Campfire perk bug nav controller " + self + ". Cleaning up.")
        TakeDown()
        CampDebug(2, self + " removed.")
    endif
EndEvent