scriptname _Camp_InstinctsController extends Quest
{Maintains Instincts state-related things.}

Actor property PlayerRef auto

Cell[] function GetCellsToSearch()
	; Send out markers in a cross pattern to see which cells they end up in
	; based on the search radius.
	Cell[] cellsToSearch = new Cell[4]
	ObjectReference probe1 = SendFirstMarker
	ObjectReference probe2 = SendSecondMarker
	ObjectReference probe3 = SendThirdMarker
	ObjectReference probe4 = SendForthMarker

	SendEvent_InstinctsFindObjects(cellsToSearch)
	SendEvent_InstinctsFindBranches(cellsToSearch)
	SendEvent_InstinctsFindArrows(cellsToSearch)
	SendEvent_InstinctsFindTinder(cellsToSearch)
	SendEvent_InstinctsFindPlants(cellsToSearch)

	; Find New Usable Objects (Campfires, Deadwood, etc) (static + movable static)
	; Find Branches Near Trees (trees with no name)
	; Find Arrows (ammoprojectile)
	; Find Tinder Items (stuff to make tinder with)
	; Find Harvestable Plants (trees with names, flora)
	; Smell Dead Bodies (dead actors, uses MagicEffect)
	; Hear Movement (actors, uses MagicEffect)
	; Sense Path to Next Quest Target (uses MagicEffect)


endFunction


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
we receive an SKSE event.