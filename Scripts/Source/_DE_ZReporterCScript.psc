scriptname _DE_ZReporterCScript extends ObjectReference

GlobalVariable property _DE_ZTestValC auto
GlobalVariable property _DE_PlacementErrorCounter auto
GlobalVariable property _DE_HelpDone_PlacementError auto
GlobalVariable property _DE_CampsitePlacementOn auto
ObjectReference property _DE_ZTestShooterREF auto

import math

Event OnInit()
	;debug.Trace("[Frostfall] C reporting X:" + self.GetPositionX() + ", Y:" + self.GetPositionY() + ", Z:" + self.GetPositionZ())
	_DE_ZTestValC.SetValue(self.GetPositionZ())
	
	if _DE_HelpDone_PlacementError.GetValue() == 1
		float XVariance = abs(self.GetPositionX()) - abs(_DE_ZTestShooterREF.GetPositionX())
		float YVariance = abs(self.GetPositionY()) - abs(_DE_ZTestShooterREF.GetPositionY())
		if abs(XVariance) >= 100.0 || abs(YVariance) >= 100.0
			_DE_PlacementErrorCounter.SetValue(_DE_PlacementErrorCounter.GetValueInt() + 1)
			if _DE_PlacementErrorCounter.GetValue() >= 3
				;3 strikes, you're out
				_DE_CampsitePlacementOn.SetValue(3)
				_DE_PlacementErrorCounter.SetValue(0)
			endif
		else
			_DE_PlacementErrorCounter.SetValue(0)
		endif
	endif

	self.Disable()
	self.Delete()
endEvent