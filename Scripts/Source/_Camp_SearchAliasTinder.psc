scriptname _Camp_SearchAliasTinder extends _Camp_SearchAliasBase

Activator property _Camp_InstinctsGlowTinderFX auto
ObjectReference fx

function AliasStart(ObjectReference akReference)
	if !akReference.IsHarvested()
		fx = akReference.PlaceAtMe(_Camp_InstinctsGlowTinderFX, abInitiallyDisabled = true)
		fx.MoveTo(fx, afZOffset = 24)
    	fx.EnableNoWait(true)
    endif
endFunction

function AliasStop(ObjectReference akReference)
	; The glow effect destroys itself.
endFunction
