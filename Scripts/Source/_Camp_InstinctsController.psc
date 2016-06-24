scriptname _Camp_InstinctsController extends ActiveMagicEffect
{Maintains Instincts state-related things.}

import math

; Find New Usable Objects (Campfires, Deadwood, etc) (static + movable static)
; Find Branches Near Trees (trees with no name)
; Find Arrows (ammoprojectile)
; Find Tinder Items (stuff to make tinder with)
; Find Harvestable Plants (trees with names, flora)
; Smell Dead Bodies (dead actors, uses MagicEffect)
; Hear Movement (actors, uses MagicEffect)
; Sense Path to Next Quest Target (uses MagicEffect)

Actor property PlayerRef auto
Message property _Camp_VisionPowerErrorMounted auto
Spell property _Camp_SurvivalVisionPower auto
GlobalVariable property _Camp_PerkRank_KeenSenses auto

Quest property _Camp_InstinctsTreeSearch auto

bool searching = false

Event OnEffectStart(Actor akTarget, Actor akCaster)
	StartSearching()
	searching = true
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	searching = false
EndEvent

function StartSearching()
	debug.trace("Starting search.")
	if PlayerRef.IsOnMount()
        _Camp_VisionPowerErrorMounted.Show()
        StopSearching()
        PlayerRef.DispelSpell(_Camp_SurvivalVisionPower)
        return
    endif
	RegisterForAnimationEvent(PlayerRef, "FootLeft")
    RegisterForModEvent("Campfire_PlayerHit", "PlayerHit")
    RegisterForMenu("Dialogue Menu")

	RegisterEventsOnSearchQuests()
	SendEvent_InstinctsStartSearch()
	; RegisterForSingleUpdate(5)
endFunction

function RegisterEventsOnSearchQuests()
	_Camp_InstinctsTreeSearch.RegisterForModEvent("Campfire_InstinctsStartSearch", "InstinctsStartSearch")
	_Camp_InstinctsTreeSearch.RegisterForModEvent("Campfire_InstinctsStopSearch", "InstinctsStopSearch")
endFunction

Event OnUpdate()
	debug.trace("Updating cells.")
	;SearchCellUpdate()
	if searching
		if PlayerRef.IsOnMount()
            _Camp_VisionPowerErrorMounted.Show()
            StopSearching()
            PlayerRef.DispelSpell(_Camp_SurvivalVisionPower)
            return
        endif
		RegisterForSingleUpdate(5)
	endif
EndEvent

Event PlayerHit(Form akAggressor, Form akSource, Form akProjectile)
	StopSearching()
    Dispel()
endEvent

Event OnMenuOpen(string menuName)
    if menuName == "Dialogue Menu"
    	StopSearching()
        Dispel()
    endif
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if akSource == PlayerRef && asEventName == "FootLeft"
        if _Camp_PerkRank_KeenSenses.GetValueInt() == 0
            CancelEffect_Movement()
        elseif !PlayerRef.IsSneaking()
            CancelEffect_Movement()
        endif
    endif
EndEvent

function CancelEffect_Movement()
    ; The effect is being cancelled because the player moved.

    ;@TODO
    ; Wait until an update cycle isn't running, or else we could remove the effect
    ; from the actor and then try to register for an update with no native object bound.
    ;int i = 0
    ;while updating && i < 50
    ;    utility.wait(0.1)
    ;    i += 1
    ;endWhile

    UnregisterForUpdate()
    StopSearching()
    PlayerRef.DispelSpell(_Camp_SurvivalVisionPower)
endFunction

function StopSearching()
	debug.trace("Stopping search.")
	SendEvent_InstinctsStopSearch()
endFunction

function SendEvent_InstinctsStartSearch()
	int handle = ModEvent.Create("Campfire_InstinctsStartSearch")
	if handle
		ModEvent.Send(handle)
	endif
endFunction

function SendEvent_InstinctsStopSearch()
	int handle = ModEvent.Create("Campfire_InstinctsStopSearch")
	if handle
		ModEvent.Send(handle)
	endif
endFunction

; instinct spell
; instinct effect - has existing stuff
; effect does cell probing. All it does is REPORT the data to a quest (Instincts controller) who maintains state
; instincts controller sends events for search objects


;/ Generic expected behavior:

1. Search the area for all references we care about. <---- SLOW
	Make it faster: Only search for:
		Trees with NO name
		Trees with Names (i.e. flora)
		Movable Statics
		Statics
		ArrowProjectiles
2. For each ref we care about, check (or know) their distance from the player.
3. For each ref we care about, check the "found ref list" and abort if it's in it.
4. If it's not in the list, put it in the list and figure out what to do.
5. Look up what to do based on a set of registration values. (Glow, membrane, replace, etc)
6. For every found "valid" object that is replaced or glowing, spawn 
a state controller for that item. The state controller manages the lifecycle of
that object's glowing / ownership / how long it lasts / swapping back if
we receive an SKSE event./;