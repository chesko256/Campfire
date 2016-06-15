scriptname _Frost_Meter extends Common_SKI_MeterWidget

bool property charge_meter auto

; @overrides SKI_WidgetBase
string function GetWidgetSource()
	if charge_meter
		return "frostfall/chargemeter.swf"
	else
		return "frostfall/meter.swf"
	endif
endFunction