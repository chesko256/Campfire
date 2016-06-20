scriptname _Camp_InstinctsTreeSearchController extends _Camp_InstinctsSearchController

FormList property _Camp_SearchBranchTrees auto
FormList property _Camp_SearchTinderTrees auto
Activator property _Camp_InstinctsGlowTinderFX auto
Activator property _Camp_InstinctsGlowFloraFX auto

function DetectionRefAddedAction(ObjectReference akReference)
	Form tree_form = akReference.GetBaseObject()
	if akReference.IsHarvested() || !akReference.Is3DLoaded()
		return
	endif

	if _Camp_SearchBranchTrees.HasForm(tree_form)
		; spawn branch
	elseif tree_form.GetName() != ""
		if _Camp_SearchTinderTrees.HasForm(tree_form)
			SpawnDetectionHighlight(akReference, _Camp_InstinctsGlowTinderFX)
        else
        	SpawnDetectionHighlight(akReference, _Camp_InstinctsGlowFloraFX)
        endif
	endif
endFunction

function DetectionGainedAction(ObjectReference akReference)
	; pass	
endFunction

function DetectionLostAction(ObjectReference akReference)
	; nothing necessary
endFunction

function CleanUpAction(ObjectReference akReference)
	; nothing necessary
endFunction

function SpawnDetectionHighlight(ObjectReference akReference, Activator akHighlight)
	ObjectReference fx = akReference.PlaceAtMe(akHighlight, abInitiallyDisabled = true)
	fx.MoveTo(fx, afZOffset = 16)
    ; fx.EnableNoWait(true)
endFunction