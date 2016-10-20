scriptname _Camp_SearchAliasTreeFlora extends _Camp_SearchAliasBase

import CampUtil

Activator property _Camp_InstinctsGlowFloraFX auto
ObjectReference fx

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
	fx = akReference.PlaceAtMe(_Camp_InstinctsGlowFloraFX, abInitiallyDisabled = true)
	fx.MoveTo(fx, afZOffset = 24)
    fx.EnableNoWait(true)
endFunction

function AliasStop(ObjectReference akReference)
	; The glow effect destroys itself.
endFunction
