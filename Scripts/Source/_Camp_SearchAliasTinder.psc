scriptname _Camp_SearchAliasTinder extends _Camp_SearchAliasBase

import CampUtil

Activator property _Camp_InstinctsGlowTinderFX auto
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
	fx = akReference.PlaceAtMe(_Camp_InstinctsGlowTinderFX, abInitiallyDisabled = true)
	fx.MoveTo(fx, afZOffset = 24)
    fx.EnableNoWait(true)
endFunction

function AliasStop(ObjectReference akReference)
	; The glow effect destroys itself.
endFunction
