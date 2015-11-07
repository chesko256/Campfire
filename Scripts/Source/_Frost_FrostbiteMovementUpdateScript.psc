scriptname _Frost_FrostbiteMovementUpdateScript extends ActiveMagicEffect

Actor property PlayerRef auto
MiscObject property _Frost_DummyItem auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	PlayerRef.AddItem(_Frost_DummyItem, 1, true)
	PlayerRef.RemoveItem(_Frost_DummyItem, 1, true)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	PlayerRef.AddItem(_Frost_DummyItem, 1, true)
	PlayerRef.RemoveItem(_Frost_DummyItem, 1, true)
EndEvent