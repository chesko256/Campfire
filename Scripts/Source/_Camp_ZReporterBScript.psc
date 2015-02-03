scriptname _Camp_ZReporterBScript extends ObjectReference

ObjectReference property _Camp_IndicatorFutureRefB auto

Event OnInit()
	(_Camp_IndicatorFutureRefB as _Camp_IndicatorFuture).result = self.GetPositionZ()
	self.Disable()
	self.Delete()
endEvent