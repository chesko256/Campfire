scriptname _Frost_ColdWaterEffect4 extends ActiveMagicEffect

Actor property PlayerRef auto
VisualEffect property _Camp_ForceBlackVFX auto
ImageSpaceModifier property FadeToBlackImod auto
ImageSpaceModifier property FadeToBlackHoldImod auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Utility.Wait(5)
	FadeToBlackImod.ApplyCrossFade()
	Utility.Wait(2.3)
	_Camp_ForceBlackVFX.Play(PlayerRef)
	FadeToBlackImod.PopTo(FadeToBlackHoldImod)
	PlayerRef.Kill()
endEvent