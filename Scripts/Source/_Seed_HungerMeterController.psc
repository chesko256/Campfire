scriptname _Seed_HungerMeterController extends _Seed_MeterController

Event OnInit()
	SetDefaults()
EndEvent

function SetDefaults()
	SetMeterPosition("center", "bottom", "both", 916.75, 717.5, -22.0, 292.0)
	SetMeterColor(0xAD1457)
	CompanionResource = 2
endFunction