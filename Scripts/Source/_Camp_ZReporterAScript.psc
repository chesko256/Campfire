scriptname _Camp_ZReporterAScript extends ObjectReference

ObjectReference property _Camp_IndicatorFutureRefA auto

Event OnInit()
	(_Camp_IndicatorFutureRefA as _Camp_IndicatorFuture).result = self.GetPositionZ()
	self.Disable()
	self.Delete()
endEvent