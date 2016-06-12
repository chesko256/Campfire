scriptname _Camp_InstinctsSearchController extends Quest

Cell[] property cellsToSearch auto hidden

Event OnInit()
	RegisterForModEvent("InstinctsStartSearch", "Campfire_InstinctsStartSearch")
	RegisterForModEvent("InstinctsSearchCellUpdate", "Campfire_InstinctsSearchCellUpdate")
	RegisterForModEvent("InstinctsStopSearch", "Campfire_InstinctsStopSearch")
EndEvent

Event InstinctsStartSearch(Form akCell1, Form akCell2, Form akCell3, Form akCell4)
	cellsToSearch = new Cell[4]
	cellsToSearch[0] = akCell1 as Cell
	cellsToSearch[1] = akCell2 as Cell
	cellsToSearch[2] = akCell3 as Cell
	cellsToSearch[3] = akCell4 as Cell
	Search()
EndEvent

Event InstinctsSearchCellUpdate(Form akCell1, Form akCell2, Form akCell3, Form akCell4)
	; Determine which cell to dispose data for or generate new data for.
	Cell[] updatedCells = new Cell[4]
	Cell[] oldCellsNotFound = new Cell[4]
	oldCellsNotFound[0] = cellsToSearch[0]
	oldCellsNotFound[1] = cellsToSearch[1]
	oldCellsNotFound[2] = cellsToSearch[2]
	oldCellsNotFound[3] = cellsToSearch[3]

	updatedCells[0] = akCell1 as Cell
	updatedCells[1] = akCell2 as Cell
	updatedCells[2] = akCell3 as Cell
	updatedCells[3] = akCell4 as Cell

	int i = 0
	while i < cellsToSearch.Length
		if updatedCells[i]
			int idx = cellsToSearch.Find(updatedCells[i])
			if idx != -1
				; old cell, do nothing.
				oldCellsNotFound[i] = None
			else
				; new cell, process.
				Search(updatedCells[i])
			endif
		endif
		i += 1
	endWhile

	; Clear old cells
	int j = 0
	while j < cellsToSearch.Length
		if updatedCells.Find(cellsToSearch[j])
			CleanUpCell(cellsToSearch[j])
		endif
		j += 1
	endWhile

	cellsToSearch = updatedCells
EndEvent

Event InstinctsStopSearch()
	int i = 0
	while i < 4
		CleanUpCell(cellsToSearch[i])
		i += 1
	endWhile
EndEvent

function Search(Cell akCell)
	; Implement search logic. Extend.
endFunction

function CleanUpCell(Cell akCell)
	; Stop glowing / etc on all objects in this cell and dispose of the object data. Extend.
endFunction

function CreateUniqueArray(Form akCell1, Form akCell2, Form akCell3, Form akCell4)
	; Return an array of cells that are unique values only.
	Cell[] uniqueArray = new Cell[4]

	int i = 0
	int j = 0
	while i < 4
		if uniqueArray.Find(akCells[i]) != -1
			uniqueArray[j] = akCells[i]
			j += 1
		endif
		i += 1
	endWhile
	return uniqueArray
endFunction