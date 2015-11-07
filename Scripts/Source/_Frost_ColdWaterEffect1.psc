scriptname _Frost_ColdWaterEffect1 extends ActiveMagicEffect

Message property _Frost_WaterTemp1Msg auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_Frost_WaterTemp1Msg.Show()
	FrostUtil.ModPlayerExposure(40.0, 40.0)
EndEvent