scriptname _Seed_VitalityMeterController extends _Seed_MeterController

Event OnInit()
	SetDefaults()
EndEvent

function SetDefaults()
	SetMeterPosition("center", "bottom", "both", 657.5, 665.0, 22.0, 292.0)
	SetMeterColor(0xFFF59D)
endFunction