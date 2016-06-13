scriptname _Camp_InstinctsSearchController extends Quest

GlobalVariable property _Camp_PerkRank_KeenSenses auto
bool property should_rescan = false auto
{Whether or not this controller should rescan the cell on each iteration for new objects.}

Cell[] property cellsToSearch auto hidden
bool property searching = false auto hidden
bool property refreshing = false auto hidden

Event OnInit()
	RegisterForModEvents()
EndEvent

function RegisterForModEvents()
	RegisterForModEvent("Campfire_InstinctsStartSearch", "InstinctsStartSearch")
	RegisterForModEvent("Campfire_InstinctsSearchCellUpdate", "InstinctsSearchCellUpdate")
	RegisterForModEvent("Campfire_InstinctsStopSearch", "InstinctsStopSearch")
endFunction

Event InstinctsStartSearch(Form akCell1, Form akCell2, Form akCell3, Form akCell4)
	debug.trace("test got start search")
	cellsToSearch = new Cell[4]
	CreateUniqueArray(akCell1 as Cell, akCell2 as Cell, akCell3 as Cell, akCell4 as Cell, cellsToSearch)
	debug.trace("Unique cell array " + cellsToSearch)
	int i = 0
	while i < 4
		Search(cellsToSearch[i])
		i += 1
	endWhile
	RegisterForSingleUpdate(5)
	searching = true
EndEvent

Event InstinctsSearchCellUpdate(Form akCell1, Form akCell2, Form akCell3, Form akCell4)
	debug.trace("test got search update")
	; Determine which cell to dispose data for or generate new data for.
	Cell[] updatedCells = new Cell[4]
	debug.trace("Updated unique cell array " + cellsToSearch)
	CreateUniqueArray(akCell1 as Cell, akCell2 as Cell, akCell3 as Cell, akCell4 as Cell, updatedCells)

	Cell[] oldCellsNotFound = new Cell[4]
	oldCellsNotFound[0] = cellsToSearch[0]
	oldCellsNotFound[1] = cellsToSearch[1]
	oldCellsNotFound[2] = cellsToSearch[2]
	oldCellsNotFound[3] = cellsToSearch[3]

	int i = 0
	while i < 4
		if updatedCells[i]
			int idx = cellsToSearch.Find(updatedCells[i])
			if idx != -1
				; old cell, do nothing.
				debug.trace("Still in " + updatedCells[i] + ", idling.")
				oldCellsNotFound[idx] = None
			else
				; new cell, process.
				debug.trace("Entered new search cell " + updatedCells[i] + ", searching!")
				Search(updatedCells[i])
			endif
		endif
		i += 1
	endWhile

	; Clear old cells
	int j = 0
	while j < 4
		debug.trace(oldCellsNotFound[j] + " is now outside the search radius, cleaning up.")
		CleanUpCell(oldCellsNotFound[j])
		j += 1
	endWhile

	; Value copy
	cellsToSearch[0] = updatedCells[0]
	cellsToSearch[1] = updatedCells[1]
	cellsToSearch[2] = updatedCells[2]
	cellsToSearch[3] = updatedCells[3]
	debug.trace("Latest cell list: " + cellsToSearch)
EndEvent

Event InstinctsStopSearch()
	debug.trace("test got stop search")
	searching = false
	int i = 0
	while i < 4
		CleanUpCell(cellsToSearch[i])
		i += 1
	endWhile
	debug.trace("test stopped search.")
EndEvent

Event OnUpdate()
	if searching
		if should_rescan
			ScanTrackedCells()
		endif
		RefreshRefs()
		RegisterForSingleUpdate(5)
	endif
EndEvent

function Search(Cell akCell)
	; Implements search start logic. Extend.
endFunction

function ScanTrackedCells()
	; Implements maintenance logic. Extend.
endFunction

function RefreshRefs()
	; Implements maintenance logic. Extend.
endFunction

function CleanUpCell(Cell akCell)
	; Stop glowing / etc on all objects in this cell and dispose of the object data. Extend.
endFunction

function CreateUniqueArray(Cell akCell1, Cell akCell2, Cell akCell3, Cell akCell4, Cell[] akTargetArray)
	; Populate an array of cells (passed by reference) with unique values.
	Cell[] akCells = new Cell[4]
	akCells[0] = akCell1
	akCells[1] = akCell2
	akCells[2] = akCell3
	akCells[3] = akCell4

	int i = 0
	int j = 0
	while i < 4
		if akTargetArray.Find(akCells[i]) == -1
			akTargetArray[j] = akCells[i]
			j += 1
		endif
		i += 1
	endWhile
endFunction