scriptname _Seed_MeterController extends Quest

; Meter widget tested as working under the following criteria: Height = -20, Width = 265.75.
; Scale meter relative to these values or visual errors will occur.

import Utility

Actor property PlayerRef auto
GlobalVariable property AttributeGlobal auto
{Set in the CK. The global that corresponds to this meter's displayed attribute.}

GlobalVariable property _Seed_DebugMetersAlwaysOn auto

; 1 = Magicka
; 2 = Health
; 3 = Stamina
int property CompanionResource auto hidden

; Assumptions:
;   Always display needs meters when improving if not Always Off

; Needs Meter Display Mode:
; Display...
; 0 = Always On
; 1 = On action, H/M/S, time, and status (contextual, most frequent)
; 2 = On action, H/M/S, and status change                           ; Default
; 3 = On H/M/S and status change
; 4 = On status change (contextual, least frequent)
; 5 = Always Off
GlobalVariable property _Seed_Setting_NeedsMeterDisplayMode auto
GlobalVariable property _Seed_Setting_MetersAlwaysOnWhenLow auto
GlobalVariable property _Seed_Setting_InvertMeterFillBehavior auto

; Vitality Meter Display Mode:
; Display...
; 0 = Always On
; 1 = Always On if < 100% (contextual, most frequent)
; 2 = With Needs meters and status change
; 3 = With Needs meters if Vitality < 100% and status change
; 4 = On status change (contextual, least frequent)                 ; Default
; 5 = Always Off (display warning message)
GlobalVariable property _Seed_Setting_VitalityMeterDisplayMode auto
GlobalVariable property _Seed_Setting_MeterOpacity auto

float METER_TRANSITION_TIME = 2.0

bool transitioning = false

function UpdateMeter(float afPercent)
    ;@TODO
    ;if shutdown
    ;   return
    ;endif

    ;@TODO: Centralize
    _Seed_SKI_MeterWidget meter = ((self as Quest) as _Seed_SKI_MeterWidget)
    if _Seed_Setting_InvertMeterFillBehavior.GetValueInt() == 2
        meter.SetPercent(1.0 - afPercent)
    else
        meter.SetPercent(afPercent)
    endif
endFunction

function DisplayMeter(bool abFlash = false)
    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
    if mode == 0 || mode == 5
        return
    endif

    ; If we should display this update, wait until we're done transitioning.
    int i = 0
    while (transitioning) && i < 50
        wait(0.1)
        i += 1
    endWhile

    ;@TODO: Centralize
    _Seed_SKI_MeterWidget meter = ((self as Quest) as _Seed_SKI_MeterWidget)
    
    if meter.Alpha == 0.0
        transitioning = true
        meter.Alpha = _Seed_Setting_MeterOpacity.GetValue()
        ;@TODO: Verify transition time
        wait(METER_TRANSITION_TIME)
        transitioning = false
    endif

    if abFlash
        meter.StartFlash()
    endif

    RegisterForSingleUpdate(4.0)
endFunction

function HideMeter()
    ;@TODO: Centralize
    _Seed_SKI_MeterWidget meter = ((self as Quest) as _Seed_SKI_MeterWidget)
    transitioning = true
    meter.Alpha = 0.0
    wait(METER_TRANSITION_TIME)
    transitioning = false
endFunction

function SetAlwaysOn()
    ;@TODO: Centralize
    _Seed_SKI_MeterWidget meter = ((self as Quest) as _Seed_SKI_MeterWidget)
    meter.Alpha = _Seed_Setting_MeterOpacity.GetValue()
endFunction

function SetAlwaysOff()
    ;@TODO: Centralize
    _Seed_SKI_MeterWidget meter = ((self as Quest) as _Seed_SKI_MeterWidget)
    meter.Alpha = 0.0
endFunction

Event OnUpdate()
    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()

    ; Sanity check - bail out on Always On / Off
    if mode == 0 || mode == 5
        return
    endif

    ; If value is low and setting enabled, stay on
    if _Seed_Setting_MetersAlwaysOnWhenLow.GetValueInt() == 2 && AttributeGlobal.GetValue() <= 40.0
        RegisterForSingleUpdate(4.0)
        return
    endif

    float av_pct
    if mode >= 1 && mode <= 3
        if CompanionResource == 1
            av_pct = PlayerRef.GetAVPercentage("Magicka")
        elseif CompanionResource == 2
            av_pct = PlayerRef.GetAVPercentage("Health")
        elseif CompanionResource == 3
            av_pct = PlayerRef.GetAVPercentage("Stamina")
        endif
        if av_pct == 1.0
            HideMeter()
        else
            RegisterForSingleUpdate(4.0)
        endif
    elseif mode == 4
        HideMeter()
    endif
endEvent

function SetMeterPosition(string asHAnchor, string asVAnchor, string asFillDirection, float afX, float afY, \
                             float afHeight, float afWidth)
    ;@TODO: Centralize
    _Seed_SKI_MeterWidget meter = ((self as Quest) as _Seed_SKI_MeterWidget)
    meter.HAnchor = asHAnchor
    meter.VAnchor = asVAnchor
    meter.FillDirection = asFillDirection
    meter.X = afX
    meter.Y = afY
    meter.Height = afHeight
    meter.Width = afWidth
endFunction

function SetMeterColor(int aiPrimaryColor)
    ;@TODO: Centralize
    _Seed_SKI_MeterWidget meter = ((self as Quest) as _Seed_SKI_MeterWidget)
    meter.PrimaryColor = aiPrimaryColor
endFunction