scriptname _Seed_ThirstMeterController extends _Seed_MeterController

Event OnInit()
	SetDefaults()
EndEvent

function SetDefaults()
	SetMeterPosition("left", "bottom", "right", 1194.25, 717.5, -22.0, 292.0)
	SetMeterColor(0x0D47A1)
	CompanionResource = 3
endFunction