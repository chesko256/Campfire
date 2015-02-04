scriptname _Camp_ZReporterCScript extends ObjectReference

ObjectReference property _Camp_IndicatorFutureRefC auto
GlobalVariable property _Camp_PlacementErrorCounter auto
GlobalVariable property _Camp_HelpDone_PlacementError auto
GlobalVariable property _Camp_CurrentlyPlacingObject auto
ObjectReference property _Camp_ZTestShooterREF_C auto

import math

Event OnInit()
	(_Camp_IndicatorFutureRefC as _Camp_IndicatorFuture).result = self.GetPositionZ()
	if _Camp_HelpDone_PlacementError.GetValue() == 1
		float XVariance = abs(self.GetPositionX()) - abs(_Camp_ZTestShooterREF_C.GetPositionX())
		float YVariance = abs(self.GetPositionY()) - abs(_Camp_ZTestShooterREF_C.GetPositionY())
		if abs(XVariance) >= 100.0 || abs(YVariance) >= 100.0
			_Camp_PlacementErrorCounter.SetValue(_Camp_PlacementErrorCounter.GetValueInt() + 1)
			if _Camp_PlacementErrorCounter.GetValue() >= 3
				;3 strikes, you're out
				_Camp_CurrentlyPlacingObject.SetValue(3)
				_Camp_PlacementErrorCounter.SetValue(0)
			endif
		else
			_Camp_PlacementErrorCounter.SetValue(0)
		endif
	endif
	self.Disable()
	self.Delete()
endEvent