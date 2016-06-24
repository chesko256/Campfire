scriptname _Camp_SearchAliasTinder extends _Camp_SearchAliasBase

Activator property _Camp_InstinctsGlowTinderFX auto
ObjectReference fx

function AliasStart(ObjectReference akReference)
	fx = akReference.PlaceAtMe(_Camp_InstinctsGlowTinderFX, abInitiallyDisabled = true)
	fx.MoveTo(fx, afZOffset = 16)
    fx.EnableNoWait(true)
endFunction

function AliasStop(ObjectReference akReference)
	if fx
		fx.Disable()
		fx.Delete()
		fx = None
	endif
endFunction
