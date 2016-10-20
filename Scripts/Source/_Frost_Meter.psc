scriptname _Frost_Meter extends Common_SKI_MeterWidget

bool property charge_meter auto

float _indicatorPercent = 0.0
GlobalVariable property _Frost_Setting_MeterExposureColorWarm auto

; @overrides Common_SKI_MeterWidget
event OnWidgetReset()
	debug.trace("Widget " + self + " was reset.")
	parent.OnWidgetReset()
EndEvent

; @overrides Common_SKI_MeterWidget
string function GetWidgetSource()
	if charge_meter
		return "frostfall/chargemeter.swf"
	else
		return "frostfall/meterIndicator.swf"
	endif
endFunction

float property indicatorPercent
	{Percent of the meter [0.0, 1.0]. Default: 0.0}
	float function get()
		return _indicatorPercent
	endFunction

	function set(float a_val)
		_indicatorPercent = a_val
		if (Ready)
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setIndicatorPercent", _indicatorPercent)
		endIf
	endFunction
endProperty

function SetIndicatorPercent(float a_percent, bool a_force = false)
	{Sets the meter percent, a_force sets the meter percent without animation}
	_indicatorPercent = a_percent
	if (Ready)
		float[] args = new float[2]
		args[0] = a_percent
		args[1] = a_force as float
		UI.InvokeFloatA(HUD_MENU, WidgetRoot + ".setIndicatorPercent", args)
	endIf
endFunction

function ForceIndicatorPercent(float a_percent)
	{Convenience function for SetPercent(a_percent, true)}
	SetIndicatorPercent(a_percent, true)
endFunction

function SetGlow(float a_value)
	if a_value > 20.0
		FlashColor = -1
	else
		FlashColor = _Frost_Setting_MeterExposureColorWarm.GetValueInt()
	endif
	UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setGlow", a_value)
endFunction