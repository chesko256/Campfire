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
Static property XMarker auto
Message property _Camp_VisionPowerErrorMounted auto
Spell property _Camp_SurvivalVisionPower auto
GlobalVariable property _Camp_PerkRank_KeenSenses auto

ObjectReference probe_ref
Cell[] lastCellsToSearch

bool searching = false

Event OnEffectStart(Actor akTarget, Actor akCaster)
	StartSearching()
	searching = true
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	StopSearching()
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
	probe_ref = PlayerRef.PlaceAtMe(XMarker)
	Cell[] cellsToSearch = GetCellsToSearch()
	SendEvent_InstinctsStartSearch()
	;/lastCellsToSearch = new Cell[4]
	lastCellsToSearch[0] = cellsToSearch[0]
	lastCellsToSearch[1] = cellsToSearch[1]
	lastCellsToSearch[2] = cellsToSearch[2]
	lastCellsToSearch[3] = cellsToSearch[3]
	/;
	RegisterForSingleUpdate(5)
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

function SearchCellUpdate()
	
endFunction

Cell[] function GetCellsToSearch()
	; Send out markers in a cross pattern to see which cells they end up in
	; based on the search radius.

	float detection_distance = 2048.0 + (_Camp_PerkRank_KeenSenses.GetValueInt() * 1024.0)

	Cell[] cellsToSearch = new Cell[4]

	float center_x = PlayerRef.GetPositionX()
	float center_y = PlayerRef.GetPositionY()
	float center_z = PlayerRef.GetPositionZ()

	; Optimize by calling GetOffsetsFromPos once and reusing values
	float[] probe_dist = GetOffsetsFromPos(detection_distance, 45.0)

	cellsToSearch[0] = GetCellFromProbe(probe_ref, center_x + -probe_dist[0], center_y + probe_dist[1], center_z) 	; upper left
	cellsToSearch[1] = GetCellFromProbe(probe_ref, center_x + probe_dist[0], center_y + probe_dist[1], center_z) 	; upper right
	cellsToSearch[2] = GetCellFromProbe(probe_ref, center_x + -probe_dist[0], center_y + -probe_dist[1], center_z) 	; lower left
	cellsToSearch[3] = GetCellFromProbe(probe_ref, center_x + probe_dist[0], center_y + -probe_dist[1], center_z) 	; lower right
	return cellsToSearch
endFunction

function StopSearching()
	debug.trace("Stopping search.")
	SendEvent_InstinctsStopSearch()
	probe_ref.Disable()
	probe_ref.Delete()
endFunction

Cell function GetCellFromProbe(ObjectReference akProbe, float afPosX, float afPosY, float afPosZ)
	akProbe.SetPosition(afPosX, afPosY, afPosZ)
	return akProbe.GetParentCell()
endFunction

float[] function GetOffsetsFromPos(Float afDistance = 100.0, float afOffset = 0.0)
	Float YDist = Sin(afOffset)
	Float XDist = Cos(afOffset)

	XDist *= afDistance
	YDist *= afDistance

	Float[] Offsets = New Float[2]
	Offsets[0] = YDist
	Offsets[1] = XDist
	Return Offsets
EndFunction

function SendEvent_InstinctsStartSearch()
	int handle = ModEvent.Create("Campfire_InstinctsStartSearch")
	if handle
		ModEvent.Send(handle)
	endif
endFunction

function SendEvent_InstinctsSearchCellUpdate(Cell[] akCells)
	int handle = ModEvent.Create("Campfire_InstinctsSearchCellUpdate")
	if handle
		ModEvent.PushForm(handle, akCells[0])
		ModEvent.PushForm(handle, akCells[1])
		ModEvent.PushForm(handle, akCells[2])
		ModEvent.PushForm(handle, akCells[3])
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