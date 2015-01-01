scriptname _DE_ZReporterAScript extends ObjectReference

import debug
GlobalVariable property _DE_ZTestValA auto

Event OnInit()
	;debug.Trace("[Frostfall] A reporting" + self.GetPositionZ())
	_DE_ZTestValA.SetValue(self.GetPositionZ())
	self.Disable()
	self.Delete()
endEvent