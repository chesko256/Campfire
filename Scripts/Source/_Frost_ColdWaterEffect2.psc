scriptname _Frost_ColdWaterEffect2 extends ActiveMagicEffect

Message property _Frost_WaterTemp2Msg auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_Frost_WaterTemp2Msg.Show()
	FrostUtil.ModPlayerExposure(60.0, 60.0)
EndEvent