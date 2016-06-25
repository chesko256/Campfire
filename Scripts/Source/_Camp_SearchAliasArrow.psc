scriptname _Camp_SearchAliasArrow extends _Camp_SearchAliasBase

EffectShader property _Camp_VisionStaticShader auto

function AliasStart(ObjectReference akReference)
	_Camp_VisionStaticShader.Play(akReference)
endFunction

function AliasStop(ObjectReference akReference)
	if akReference
		_Camp_VisionStaticShader.Stop(akReference)
	endif
endFunction
