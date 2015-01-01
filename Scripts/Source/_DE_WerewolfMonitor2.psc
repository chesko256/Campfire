Scriptname _DE_WerewolfMonitor2 extends ReferenceAlias
{Catches werewolf feeding events.}

; #SUMMARY# =====================================================================================================================
; Name ...................: _DE_WerewolfMonitor2
; Attached To (EditorID)..: 
; Description ............: Detects werewolf feeding events.
; Author .................: Chesko
; Last Approved (version) : 2.0
; Status .................: Complete
; Remarks ................: 
; ===============================================================================================================================

GlobalVariable property _DE_ExposurePoints auto
race property WerewolfBeastRace auto
MagicEffect property WerewolfFeedRestoreHealth auto

import debug

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	;notification("I am feeding")
	if akEffect == WerewolfFeedRestoreHealth
		if _DE_ExposurePoints.GetValue() <= 110.0								;Prevent EP being set too high
			_DE_ExposurePoints.SetValue(_DE_ExposurePoints.GetValue() + 15.0)
		elseif _DE_ExposurePoints.GetValue() > 110.0
			_DE_ExposurePoints.SetValue(120.0)
		endif
	endif
endEvent