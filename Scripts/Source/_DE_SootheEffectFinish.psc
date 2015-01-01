scriptname _DE_SootheEffectFinish extends ActiveMagicEffect

GlobalVariable property _DE_ExposurePoints auto
_DE_ExposureMeterUpdate property ExposureMeter auto
_DE_EPMonitor_1_6 property Frostfall auto
message property _DE_ExposureDeath auto
float property Magnitude auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	_DE_ExposurePoints.SetValue(_DE_ExposurePoints.GetValue() - Magnitude)
	ExposureMeter.ForceDisplayAndUpdate()
	;Kill them now if necessary
	if _DE_ExposurePoints.GetValue() < 0.0
		if !Frostfall.bIsVampire
			if Frostfall.pSetting_PlayerDeath
				_DE_ExposureDeath.Show()
				utility.wait(3)
				Game.GetPlayer().Kill()
			endif
		endif
		
		_DE_ExposurePoints.SetValue(0.0)

	endif
endEvent