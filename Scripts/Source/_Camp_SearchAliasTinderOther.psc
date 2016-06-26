scriptname _Camp_SearchAliasTinderOther extends _Camp_SearchAliasBase

EffectShader property _Camp_VisionTinderShader auto

function AliasStart(ObjectReference akReference)
	if !akReference.IsHarvested()
		_Camp_VisionTinderShader.Play(akReference)
    endif
endFunction

function AliasStop(ObjectReference akReference)
	_Camp_VisionTinderShader.Stop(akReference)
	; The glow effect destroys itself.
endFunction