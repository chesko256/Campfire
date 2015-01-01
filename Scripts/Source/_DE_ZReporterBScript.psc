scriptname _DE_ZReporterBScript extends ObjectReference

GlobalVariable property _DE_ZTestValB auto

Event OnInit()
	;debug.Trace("[Frostfall] B reporting X:" + self.GetPositionX() + ", Y:" + self.GetPositionY() + ", Z:" + self.GetPositionZ())
	_DE_ZTestValB.SetValue(self.GetPositionZ())
	self.Disable()
	self.Delete()
endEvent