scriptname _Camp_SearchAliasTreeFlora extends _Camp_SearchAliasBase

Activator property _Camp_InstinctsGlowFloraFX auto
ObjectReference fx

function AliasStart(ObjectReference akReference)
	if !akReference.IsHarvested()
		fx = akReference.PlaceAtMe(_Camp_InstinctsGlowFloraFX, abInitiallyDisabled = true)
		fx.MoveTo(fx, afZOffset = 24)
    	fx.EnableNoWait(true)
    endif
endFunction

function AliasStop(ObjectReference akReference)
	; The glow effect destroys itself.
endFunction
