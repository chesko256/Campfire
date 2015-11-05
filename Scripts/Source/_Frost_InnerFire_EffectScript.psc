scriptname _Frost_InnerFire_EffectScript extends ActiveMagicEffect

Actor property PlayerRef auto
Furniture property _Frost_SitMarkerInnerFire auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	ObjectReference ref = PlayerRef.PlaceAtMe(_Frost_SitMarkerInnerFire)
	int i = 0
	while !ref.Is3DLoaded() && i < 50
		utility.wait(0.1)
		i += 1
	endWhile
	ref.Activate(PlayerRef)
EndEvent