scriptname _Camp_InstinctsFloraSearchController extends _Camp_InstinctsSearchController

EffectShader property _Camp_VisionTinderShader auto
EffectShader property _Camp_VisionFloraShader auto
FormList property _Camp_SearchTinderFlora auto
FormList property _Camp_SearchExcludedFlora auto

function DetectionGainedAction(ObjectReference akReference)
	Form flora_form = akReference.GetBaseObject()
	if _Camp_SearchExcludedFlora.HasForm(flora_form)
		return
	endif
	if akReference.IsHarvested() || !akReference.Is3DLoaded()
		return
	endif
	if _Camp_SearchTinderFlora.HasForm(flora_form)
		_Camp_VisionTinderShader.Play(akReference)
	else
		_Camp_VisionFloraShader.Play(akReference)
	endif
endFunction

function DetectionLostAction(ObjectReference akReference)
	if _Camp_SearchExcludedFlora.HasForm(akReference.GetBaseObject())
		return
	else
		_Camp_VisionTinderShader.Stop(akReference)
		_Camp_VisionFloraShader.Stop(akReference)	
	endif
endFunction

function CleanUpAction(ObjectReference akReference)
	if _Camp_SearchExcludedFlora.HasForm(akReference.GetBaseObject())
		return
	else
		_Camp_VisionTinderShader.Stop(akReference)
		_Camp_VisionFloraShader.Stop(akReference)	
	endif
endFunction
