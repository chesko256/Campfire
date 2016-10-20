scriptname _Camp_SearchAliasTinderOther extends _Camp_SearchAliasBase

import CampUtil

EffectShader property _Camp_VisionTinderShader auto

function AliasStart(ObjectReference akReference)
	if GetSKSELoaded()
		if !akReference.IsHarvested()
			Glow(akReference)
		endif
	else
		Glow(akReference)
    endif
endFunction

function Glow(ObjectReference akReference)
	_Camp_VisionTinderShader.Play(akReference)
endFunction

function AliasStop(ObjectReference akReference)
	if akReference
		_Camp_VisionTinderShader.Stop(akReference)
	endif
endFunction