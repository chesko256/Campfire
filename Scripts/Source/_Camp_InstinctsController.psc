scriptname _Camp_InstinctsController extends ActiveMagicEffect
{Maintains Instincts state-related things.}

import math
import CommonHelperFunctions

; Find New Usable Objects (Campfires, Deadwood, etc) (static + movable static)
; Find Branches Near Trees (trees with no name)
; Find Tinder Items (stuff to make tinder with)
; Find Harvestable Plants (trees with names, flora)
; Smell Dead Bodies (dead actors, uses MagicEffect)
; Hear Movement (actors, uses MagicEffect)
; Sense Path to Next Quest Target (uses MagicEffect)

Actor property PlayerRef auto
Message property _Camp_VisionPowerErrorMounted auto
Spell property _Camp_SurvivalVisionPower auto
GlobalVariable property _Camp_PerkRank_KeenSenses auto

Quest property _Camp_InstinctsTreeTinderSearch auto
Quest property _Camp_InstinctsOtherTinderSearch auto
Quest property _Camp_InstinctsTreeFloraSearch auto
Quest property _Camp_InstinctsArrowSearch auto
Spell property _Camp_SurvivalVisionPowerDetectSpell auto
Spell property _Camp_SurvivalVisionPowerGuideSpell auto

float playerX = 0.0
float playerY = 0.0

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

    _Camp_SurvivalVisionPowerDetectSpell.Cast(PlayerRef)
    _Camp_SurvivalVisionPowerGuideSpell.Cast(PlayerRef)

    playerX = PlayerRef.GetPositionX()
    playerY = PlayerRef.GetPositionY()
	RegisterEventsOnSearchQuests()
	SendEvent_InstinctsStartSearch()
	RegisterForSingleUpdate(5)
endFunction

function RegisterEventsOnSearchQuests()
	_Camp_InstinctsTreeTinderSearch.RegisterForModEvent("Campfire_InstinctsStartSearch", "InstinctsStartSearch")
	_Camp_InstinctsTreeTinderSearch.RegisterForModEvent("Campfire_InstinctsStopSearch", "InstinctsStopSearch")
	_Camp_InstinctsOtherTinderSearch.RegisterForModEvent("Campfire_InstinctsStartSearch", "InstinctsStartSearch")
	_Camp_InstinctsOtherTinderSearch.RegisterForModEvent("Campfire_InstinctsStopSearch", "InstinctsStopSearch")
	_Camp_InstinctsTreeFloraSearch.RegisterForModEvent("Campfire_InstinctsStartSearch", "InstinctsStartSearch")
	_Camp_InstinctsTreeFloraSearch.RegisterForModEvent("Campfire_InstinctsStopSearch", "InstinctsStopSearch")
	;_Camp_InstinctsArrowSearch.RegisterForModEvent("Campfire_InstinctsStartSearch", "InstinctsStartSearch")
	;_Camp_InstinctsArrowSearch.RegisterForModEvent("Campfire_InstinctsStopSearch", "InstinctsStopSearch")
endFunction

Event OnUpdate()
	debug.trace("Updating.")
	if searching
		if PlayerRef.IsOnMount()
            _Camp_VisionPowerErrorMounted.Show()
            StopSearching()
            PlayerRef.DispelSpell(_Camp_SurvivalVisionPower)
            return
        endif

        ; Keep the detection effects alive
        _Camp_SurvivalVisionPowerDetectSpell.Cast(PlayerRef)
        _Camp_SurvivalVisionPowerGuideSpell.Cast(PlayerRef)

        float newX = PlayerRef.GetPositionX()
        float newY = PlayerRef.GetPositionY()

        float dist = GetDistance2DCoords(playerX, playerY, newX, newY)
        if dist > 256.0
        	RefreshObjects()
        endif

        playerX = newX
        playerY = newY

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
    UnregisterForUpdate()
    StopSearching()
    PlayerRef.DispelSpell(_Camp_SurvivalVisionPower)
endFunction

function StopSearching()
	debug.trace("Stopping search.")
	SendEvent_InstinctsStopSearch()
endFunction

function RefreshObjects()
	SendEvent_InstinctsStopSearch()
	debug.trace("Moved; refreshing objects.")
	Utility.Wait(0.2)
	RegisterEventsOnSearchQuests()
	SendEvent_InstinctsStartSearch()
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
