Scriptname _DE_ColdWaterDeathEffect extends activemagiceffect  

imagespacemodifier property AzuraFadeToBlack auto
imagespacemodifier property FadeToBlackHoldImod auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	utility.wait(5)
	AzuraFadeToBlack.Apply()
	utility.wait(3.5)
	FadeToBlackHoldImod.Apply()
	Game.GetPlayer().Kill()
endEvent