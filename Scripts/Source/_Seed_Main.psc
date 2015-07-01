scriptname _Seed_Main extends Quest

Event OnInit()
	if !self.IsRunning()
		self.Start()
	endif
endEvent