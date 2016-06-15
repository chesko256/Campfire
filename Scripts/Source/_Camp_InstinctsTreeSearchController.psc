scriptname _Camp_InstinctsTreeSearchController extends _Camp_InstinctsSearchController

FormList property _Camp_SearchBranchTrees auto
FormList property _Camp_SearchTinderTrees auto
Activator property _Camp_InstinctsGlowTinderFX auto
Activator property _Camp_InstinctsGlowFloraFX auto

function DetectionGainedAction(ObjectReference akReference)
	Form tree_form = akReference.GetBaseObject()
	if akReference.IsHarvested() || !akReference.Is3DLoaded()
		return
	endif

	if _Camp_SearchBranchTrees.HasForm(tree_form)
		; spawn branch
	elseif tree_form.GetName() != ""
		if _Camp_SearchTinderTrees.HasForm(tree_form)
			if !Game.FindClosestReferenceOfTypeFromRef(_Camp_InstinctsGlowTinderFX, akReference, 64.0)
				SpawnDetectionHighlight(akReference, _Camp_InstinctsGlowTinderFX)
			endif
        else
        	if !Game.FindClosestReferenceOfTypeFromRef(_Camp_InstinctsGlowFloraFX, akReference, 64.0)
        		SpawnDetectionHighlight(akReference, _Camp_InstinctsGlowFloraFX)
        	endif
        endif
	endif
endFunction

function DetectionLostAction(ObjectReference akReference)
	; nothing necessary
endFunction

function CleanUpAction(ObjectReference akReference)
	; nothing necessary
endFunction

function SpawnDetectionHighlight(ObjectReference akReference, Activator akHighlight)
	ObjectReference fx = akReference.PlaceAtMe(akHighlight, abInitiallyDisabled = true)
    fx.SetPosition(fx.GetPositionX(), fx.GetPositionY(), fx.GetPositionZ() + 16.0)
    fx.EnableNoWait(true)
endFunction