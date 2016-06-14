scriptname _Camp_InstinctsArrowSearchController extends _Camp_InstinctsSearchController

import StorageUtil

Actor property PlayerRef auto
Keyword property _Camp_InstinctsArrowSearchData auto
{StorageUtil data form.}
EffectShader property _Camp_VisionStaticShader auto

function ScanCell(Cell akCell)
	int ref_count = akCell.GetNumRefs(64)	; kArrowProjectile
	int i = 0
	while i < ref_count
		ObjectReference o = akCell.GetNthRef(i, 64)
		string cell_id = (akCell.GetFormID() as String)
		string dist_id = cell_id + "_dist"
		if FormListFind(_Camp_InstinctsArrowSearchData, cell_id, o as Form) == -1
			debug.trace("adding " + o + " to list.")
			FormListAdd(_Camp_InstinctsArrowSearchData, cell_id, o as Form)
			FloatListAdd(_Camp_InstinctsArrowSearchData, dist_id, o.GetDistance(PlayerRef))
		endif
		i += 1
	endWhile
endFunction

function RefreshRefs()
	; Refresh the distances and glow state of all objects
	refreshing = true
	float detection_distance = 2048.0 + (_Camp_PerkRank_KeenSenses.GetValueInt() * 1024.0)

	int i = 0
	while i < 4
		if cellsToSearch[i]
			string cell_id = (cellsToSearch[i].GetFormID() as String)
			string dist_id = cell_id + "_dist"

			int ref_count = FormListCount(_Camp_InstinctsArrowSearchData, cell_id)
			int j = 0
			while j < ref_count
				ObjectReference o = FormListGet(_Camp_InstinctsArrowSearchData, cell_id, j) as ObjectReference
				if o
					debug.trace("o = " + o)
					float dist = o.GetDistance(PlayerRef)
					FloatListSet(_Camp_InstinctsArrowSearchData, dist_id, j, dist)
					if dist <= detection_distance
						_Camp_VisionStaticShader.Play(o)
					else
						_Camp_VisionStaticShader.Stop(o)
					endif
				endif
				j += 1
			endWhile
		endif
		i += 1
	endWhile
	refreshing = false
endFunction

function CleanUpCell(Cell akCell)
	; clear out everything on the cell list and then clear it

	if !akCell
		return
	endif

	int timeout = 20
	int t = 0
	while refreshing && t < timeout
		Utility.Wait(0.2)
		t += 1
	endWhile

	string cell_id = (akCell.GetFormID() as String)
	string dist_id = cell_id + "_dist"

	int ref_count = FormListCount(_Camp_InstinctsArrowSearchData, cell_id)
	int i = 0
	while i < ref_count
		ObjectReference o = FormListGet(_Camp_InstinctsArrowSearchData, cell_id, i) as ObjectReference
		if o
			_Camp_VisionStaticShader.Stop(o)
		endif
		i += 1
	endWhile

	FormListClear(_Camp_InstinctsArrowSearchData, cell_id)
	FloatListClear(_Camp_InstinctsArrowSearchData, dist_id)

	debug.trace("Key count after clean up: " + debug_GetFormListKeysCount(_Camp_InstinctsArrowSearchData))
endFunction