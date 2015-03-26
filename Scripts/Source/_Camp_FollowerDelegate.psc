Scriptname _Camp_FollowerDelegate extends activemagiceffect  

Spell property _Camp_FollowerRegistrationSpell auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddSpell(_Camp_FollowerRegistrationSpell)
EndEvent