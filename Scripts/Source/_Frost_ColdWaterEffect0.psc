scriptname _Frost_ColdWaterEffect0 extends ActiveMagicEffect

Message property _Frost_WaterTemp0Msg auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_Frost_WaterTemp0Msg.Show()
EndEvent
