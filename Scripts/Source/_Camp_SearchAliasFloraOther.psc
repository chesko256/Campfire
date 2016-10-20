scriptname _Camp_SearchAliasFloraOther extends _Camp_SearchAliasBase

import CampUtil

EffectShader property _Camp_VisionFloraShader auto

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
	_Camp_VisionFloraShader.Play(akReference)
endFunction

function AliasStop(ObjectReference akReference)
	if akReference
		_Camp_VisionFloraShader.Stop(akReference)
	endif
endFunction