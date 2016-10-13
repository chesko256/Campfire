scriptname _Camp_SearchAliasFloraOther extends _Camp_SearchAliasBase

EffectShader property _Camp_VisionFloraShader auto

function AliasStart(ObjectReference akReference)
	if !akReference.IsHarvested()
		_Camp_VisionFloraShader.Play(akReference)
    endif
endFunction

function AliasStop(ObjectReference akReference)
	if akReference
		_Camp_VisionFloraShader.Stop(akReference)
	endif
endFunction