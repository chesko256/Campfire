scriptname _Seed_FatigueMeterController extends _Seed_MeterController

Event OnInit()
	SetDefaults()
EndEvent

function SetDefaults()
	SetMeterPosition("right", "bottom", "left", 636.5, 717.5, -22.0, 292.0)
	SetMeterColor(0x9CCC65)
	CompanionResource = 1
endFunction