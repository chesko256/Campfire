scriptname _Frost_LegacyMenu extends ActiveMagicEffect

import FrostUtil

_Frost_Main property FrostfallMain auto
Quest property _Frost_TrackingQuest auto

ImageSpaceModifier property _Frost_ColdISM_Level3 auto
ImageSpaceModifier property _Frost_ColdISM_Level4 auto
ImageSpaceModifier property _Frost_ColdISM_Level5 auto

Message property _Frost_legacyconfig_firsttime auto
{Enable Frostfall, Back}

Message property _Frost_legacyconfig_root auto
{Enable / Disable Frostfall, Select Preset, More Options, Exit}

Message property _Frost_legacyconfig_activate_enabled auto
Message property _Frost_legacyconfig_activate_disabled auto

Message property _Frost_legacyconfig_activate_error auto
Message property _Frost_legacyconfig_activate_donedisabled auto
Message property _Frost_legacyconfig_activate_doneenabled auto

Message property _Frost_legacyconfig_preset auto
{Immersive, standard, Hardcore, Back}

; Enable-Return
Message property _Frost_legacyconfig_preset_immersive auto
{Activate Preset, Back}

; Enable-Return
Message property _Frost_legacyconfig_preset_standard auto
{Activate Preset, Back}

; Enable-Return
Message property _Frost_legacyconfig_preset_hardcore auto
{Activate Preset, Back}

Message property _Frost_legacyconfig_presetapplied auto

; Menu
Message property _Frost_legacyconfig_options auto
{Exposure, Travel and Waiting, Effects, More..., Back}

; Menu
Message property _Frost_legacyconfig_options2 auto
{Notifications, Endurance Skill, Tutorials, More..., Back}

; Menu
Message property _Frost_legacyconfig_exposure auto
{Exposure Rate, Lethality, Frigid Water, More..., Back}

; Menu
Message property _Frost_legacyconfig_exposure2 auto
{Pause in Combat, Movement, Vampirism, More..., Back}

; UpDown
Message property _Frost_legacyconfig_exposurerate auto
{Decrease 5, Decrease 1, Increase 1, Increase 5, Back}

Message property _Frost_legacyconfig_explethality_on auto
Message property _Frost_legacyconfig_explethality_rescue auto
Message property _Frost_legacyconfig_explethality_off auto
Message property _Frost_legacyconfig_expwater_on auto
Message property _Frost_legacyconfig_expwater_off auto
Message property _Frost_legacyconfig_expdialogue_on auto
Message property _Frost_legacyconfig_expdialogue_off auto
Message property _Frost_legacyconfig_expcombat_on auto
Message property _Frost_legacyconfig_expcombat_off auto
Message property _Frost_legacyconfig_expmovement_on auto
Message property _Frost_legacyconfig_expmovement_off auto
Message property _Frost_legacyconfig_expvampirism_mortal auto
Message property _Frost_legacyconfig_expvampirism_supernatural auto
Message property _Frost_legacyconfig_expvampirism_immortal auto

; Menu
Message property _Frost_legacyconfig_travelwaiting auto
{Fast Travel, Waiting Outdoors, Back}

; Toggle
Message property _Frost_legacyconfig_fasttravel_on auto
Message property _Frost_legacyconfig_fasttravel_off auto
{Enable/Disable, Back}

; Toggle
; This affects 2 globals
Message property _Frost_legacyconfig_waiting_on auto
Message property _Frost_legacyconfig_waiting_off auto
{Enable/Disable, Back}

; Menu
Message property _Frost_legacyconfig_effects auto
{Frost, Wetness, Sound,  More..., Back}

; Menu
Message property _Frost_legacyconfig_effects2 auto
{Full Screen Effects, Force Feedback, More..., Back}

; Menu
Message property _Frost_legacyconfig_effects3 auto
{Player Hand-Warming, Follower Hand-Warming, More..., Back}

; Toggle
Message property _Frost_legacyconfig_fxfrost_on auto
Message property _Frost_legacyconfig_fxfrost_off auto
Message property _Frost_legacyconfig_fxwet_on auto
Message property _Frost_legacyconfig_fxwet_off auto
Message property _Frost_legacyconfig_fxsound_on auto
Message property _Frost_legacyconfig_fxsound_off auto
Message property _Frost_legacyconfig_fxISM_on auto
Message property _Frost_legacyconfig_fxISM_off auto
Message property _Frost_legacyconfig_fxforcefeedback_on auto
Message property _Frost_legacyconfig_fxforcefeedback_off auto
Message property _Frost_legacyconfig_fxplayeranim_auto auto
Message property _Frost_legacyconfig_fxplayeranim_prompt auto
Message property _Frost_legacyconfig_fxplayeranim_off auto
Message property _Frost_legacyconfig_fxfolloweranim_on auto
Message property _Frost_legacyconfig_fxfolloweranim_off auto

; Menu
Message property _Frost_legacyconfig_notifications auto
{Condition, Weather Transitions, Attribute Values, More..., Back}

Message property _Frost_legacyconfig_notifications2 auto
{Equipment Values, Protection Summary, More..., Back}

; Toggle
Message property _Frost_legacyconfig_msgcondition_on auto
Message property _Frost_legacyconfig_msgcondition_off auto
Message property _Frost_legacyconfig_msgweather_on auto
Message property _Frost_legacyconfig_msgweather_off auto
Message property _Frost_legacyconfig_msgattributevalues_on auto
Message property _Frost_legacyconfig_msgattributevalues_off auto
Message property _Frost_legacyconfig_msgequipvalues_on auto
Message property _Frost_legacyconfig_msgequipvalues_off auto
Message property _Frost_legacyconfig_msgequipsummary_on auto
Message property _Frost_legacyconfig_msgequipsummary_off auto

; Endurance Skill
Message property _Frost_legacyconfig_enduranceskill auto
Message property _Frost_legacyconfig_enduranceskillrespec auto
Message property _Frost_legacyconfig_enduranceskillrestore auto
Message property _Frost_legacyconfig_enduranceskillrestoredone auto

; Tutorials
Message property _Frost_legacyconfig_tutorials_on auto
Message property _Frost_legacyconfig_tutorials_off auto
Message property _Frost_legacyconfig_tutorials_resetconfirm auto
Message property _Frost_legacyconfig_tutorials_resetdone auto


; Globals
GlobalVariable property StartFrostfall auto
GlobalVariable property FrostfallRunning auto
GlobalVariable property _Frost_Setting_Animation auto
GlobalVariable property _Frost_Setting_ConditionMessages auto
GlobalVariable property _Frost_Setting_DisplayAttributesInWeathersense auto
GlobalVariable property _Frost_Setting_DisplayAttributeValuesInWeathersense auto
GlobalVariable property _Frost_Setting_ExposurePauseCombat auto
GlobalVariable property _Frost_Setting_ExposurePauseDialogue auto
GlobalVariable property _Frost_Setting_ExposureRate auto
GlobalVariable property _Frost_Setting_ForceFeedback auto
GlobalVariable property _Frost_Setting_FrostShaderOn auto
GlobalVariable property _Frost_Setting_FullScreenEffects auto
GlobalVariable property _Frost_Setting_MaxExposureMode auto
GlobalVariable property _Frost_Setting_MeterDisplayMode auto
GlobalVariable property _Frost_Setting_MeterDisplayTime auto
GlobalVariable property _Frost_Setting_MovementPenalty auto
GlobalVariable property _Frost_Setting_NoFastTravel auto
GlobalVariable property _Frost_Setting_SoundEffects auto
GlobalVariable property _Frost_Setting_WeatherMessages auto
GlobalVariable property _Frost_Setting_WeathersenseDisplayMode auto
GlobalVariable property _Frost_Setting_WetShaderOn auto
GlobalVariable property _Frost_Setting_CurrentProfile auto
GlobalVariable property _Frost_Setting_AutoSaveLoad auto
GlobalVariable property _Frost_Setting_FrigidWaterIsLethal auto
GlobalVariable property _Frost_Setting_VampireMode auto
GlobalVariable property _Frost_Setting_NoWaiting auto
GlobalVariable property _Frost_Setting_Notifications_EquipmentValues auto
GlobalVariable property _Frost_HotkeyWeathersense auto
GlobalVariable property _Frost_Setting_FollowerAnimation auto
GlobalVariable property _Frost_Setting_DisplayTutorials auto
GlobalVariable property _Frost_Setting_Notifications_EquipmentSummary auto
GlobalVariable property _Frost_SettingsProfileVersion auto
GlobalVariable property _Frost_HelpDone_Exposure auto
GlobalVariable property _Frost_HelpDone_Wet auto
GlobalVariable property _Frost_HelpDone_Cold auto
GlobalVariable property EndurancePerkPointProgress auto
GlobalVariable property EndurancePerkPoints auto
GlobalVariable property EndurancePerkPointsEarned auto
GlobalVariable property EndurancePerkPointsTotal auto
GlobalVariable property _Frost_PerkRank_Adaptation auto
GlobalVariable property _Frost_PerkRank_Windbreaker auto
GlobalVariable property _Frost_PerkRank_FrostWarding auto
GlobalVariable property _Frost_PerkRank_GlacialSwimmer auto
GlobalVariable property _Frost_PerkRank_InnerFire auto
GlobalVariable property _Frost_PerkRank_WellInsulated auto

GlobalVariable property _Frost_LegacyConfigEnduranceRestore auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if akCaster == Game.GetPlayer()

    	if _Frost_TrackingQuest.GetStage() == 0
    		_Frost_legacyconfig_activate_error.Show()
    	elseif _Frost_TrackingQuest.GetStage() < 20
    		int i = _Frost_legacyconfig_firsttime.Show()
    		if i == 0
    			startmod()
    		else
    			; Exit
    		endif
    	elseif _Frost_TrackingQuest.GetStage() == 20
        	menu_root()
        endif
    endif
EndEvent

; Not Active menu
function menu_firsttimeactivation()
	int i = _Frost_legacyconfig_firsttime.Show()
	if i == 0
		; Enable Frostfall and exit menu
	elseif i == 1
		;Exit
	endif
endFunction

; Root menu
function menu_root()
    int i = _Frost_legacyconfig_root.Show()
    if i == 0

    	int j = 0
    	bool changed_setting = false
    	if FrostfallRunning.GetValueInt() == 2
    		j = _Frost_legacyconfig_activate_enabled.Show()
    		if j == 0
    			stopmod()
    			_Frost_legacyconfig_activate_donedisabled.Show()
				changed_setting = true
			elseif j == 1
				; Back
			endif
		elseif FrostfallRunning.GetValueInt() == 1
			j = _Frost_legacyconfig_activate_disabled.Show()
    		if j == 0
    			startmod()
    			_Frost_legacyconfig_activate_doneenabled.Show()
				changed_setting = true
			elseif j == 1
				; Back
			endif
		endif

		if !changed_setting
        	menu_root()
        endif
    elseif i == 1
        menu_preset()
    elseif i == 2
        menu_options()
    elseif i == 3
        ;Exit
    endif
endFunction

function startmod()
	FrostfallRunning.SetValue(2)
	FrostfallMain.RegisterForModEvents()
	SendEvent_StartFrostfall()
endFunction

function stopmod()
	FrostfallRunning.SetValue(1)
	FrostfallMain.RegisterForModEvents()
	SendEvent_StopFrostfall()
endFunction

function menu_preset()
	int i = _Frost_legacyconfig_preset.Show()
	if i == 0
		bool activatedPreset = MenuHandler_Execute(_Frost_legacyconfig_preset_immersive)
		if activatedPreset
			activate_preset_immersive()
			_Frost_legacyconfig_presetapplied.Show()
			menu_root()
		else
			menu_preset()
		endif
	elseif i == 1
		bool activatedPreset = MenuHandler_Execute(_Frost_legacyconfig_preset_standard)
		if activatedPreset
			activate_preset_standard()
			_Frost_legacyconfig_presetapplied.Show()
			menu_root()
		else
			menu_preset()
		endif
	elseif i == 2
		bool activatedPreset = MenuHandler_Execute(_Frost_legacyconfig_preset_hardcore)
		if activatedPreset
			activate_preset_hardcore()
			_Frost_legacyconfig_presetapplied.Show()
			menu_root()
		else
			menu_preset()
		endif
	elseif i == 3
		menu_root()
	endif
endFunction

function menu_options()
	int i = _Frost_legacyconfig_options.Show()
	if i == 0
		menu_exposure()
	elseif i == 1
		menu_travelwaiting()
	elseif i == 2
		menu_effects()
	elseif i == 3
		menu_options2()
	elseif i == 4
		menu_root()
	endif
endFunction

function menu_options2()
	int i = _Frost_legacyconfig_options2.Show()
	if i == 0
		menu_notifications()
	elseif i == 1
		menu_enduranceskill()
	elseif i == 2
		MenuHandler_Tutorials(_Frost_legacyconfig_tutorials_on, _Frost_legacyconfig_tutorials_off, _Frost_legacyconfig_tutorials_resetconfirm, _Frost_legacyconfig_tutorials_resetdone, _Frost_Setting_DisplayTutorials)
		menu_options2()
	elseif i == 3
		menu_options()
	elseif i == 4
		menu_root()
	endif
endFunction

function menu_exposure()
	int i = _Frost_legacyconfig_exposure.Show()
	if i == 0
		MenuHandler_UpDown(_Frost_legacyconfig_exposurerate, _Frost_Setting_ExposureRate, 0.0, 3.0, 0.1)
        menu_exposure()
    elseif i == 1
    	MenuHandler_MultiSelect(_Frost_legacyconfig_explethality_off, _Frost_legacyconfig_explethality_rescue, _Frost_legacyconfig_explethality_on, _Frost_Setting_MaxExposureMode, 1)
    	menu_exposure()
    elseif i == 2
    	MenuHandler_Toggle(_Frost_legacyconfig_expwater_on, _Frost_legacyconfig_expwater_off, _Frost_Setting_FrigidWaterIsLethal)
    	menu_exposure()
    elseif i == 3
    	MenuHandler_Toggle(_Frost_legacyconfig_expdialogue_on, _Frost_legacyconfig_expdialogue_off, _Frost_Setting_ExposurePauseDialogue)
    	menu_exposure()
    elseif i == 4
    	menu_exposure2()
    elseif i == 5
    	menu_options()
    endif
endFunction

function menu_exposure2()
	int i = _Frost_legacyconfig_exposure2.Show()
	if i == 0
		MenuHandler_Toggle(_Frost_legacyconfig_expcombat_on, _Frost_legacyconfig_expcombat_off, _Frost_Setting_ExposurePauseCombat)
		menu_exposure2()
	elseif i == 1
		MenuHandler_Toggle(_Frost_legacyconfig_expmovement_on, _Frost_legacyconfig_expmovement_off, _Frost_Setting_MovementPenalty)
		menu_exposure2()
	elseif i == 2
		MenuHandler_MultiSelect(_Frost_legacyconfig_expvampirism_mortal, _Frost_legacyconfig_expvampirism_supernatural, _Frost_legacyconfig_expvampirism_immortal, _Frost_Setting_VampireMode)
		menu_exposure2()
	elseif i == 3
		menu_exposure()
	elseif i == 4
		menu_options()
	endif
endFunction

function menu_travelwaiting()
	int i = _Frost_legacyconfig_travelwaiting.Show()
	if i == 0
		MenuHandler_Toggle(_Frost_legacyconfig_fasttravel_on, _Frost_legacyconfig_fasttravel_off, _Frost_Setting_NoFastTravel)
		menu_travelwaiting()
	elseif i == 1
		MenuHandler_Toggle(_Frost_legacyconfig_waiting_on, _Frost_legacyconfig_waiting_off, _Frost_Setting_NoWaiting)
		menu_travelwaiting()
	elseif i == 2
		menu_options()
	endif
endFunction

function menu_effects()
	int i = _Frost_legacyconfig_effects.Show()
	if i == 0
		MenuHandler_Toggle(_Frost_legacyconfig_fxfrost_on, _Frost_legacyconfig_fxfrost_off, _Frost_Setting_FrostShaderOn)
		menu_effects()
	elseif i == 1
		MenuHandler_Toggle(_Frost_legacyconfig_fxwet_on, _Frost_legacyconfig_fxwet_off, _Frost_Setting_WetShaderOn)
		menu_effects()
	elseif i == 2
		MenuHandler_Toggle(_Frost_legacyconfig_fxsound_on, _Frost_legacyconfig_fxsound_off, _Frost_Setting_SoundEffects)
		menu_effects()
	elseif i == 3
		menu_effects2()
	elseif i == 4
		menu_options()
	endif
endFunction

function menu_effects2()
	int i = _Frost_legacyconfig_effects2.Show()
	if i == 0
		MenuHandler_Toggle(_Frost_legacyconfig_fxISM_on, _Frost_legacyconfig_fxISM_off, _Frost_Setting_FullScreenEffects)
		if _Frost_Setting_FullScreenEffects.GetValueInt() == 1
			_Frost_ColdISM_Level3.Remove()
			_Frost_ColdISM_Level4.Remove()
			_Frost_ColdISM_Level5.Remove()
		endif
		menu_effects2()
	elseif i == 1
		MenuHandler_Toggle(_Frost_legacyconfig_fxforcefeedback_on, _Frost_legacyconfig_fxforcefeedback_off, _Frost_Setting_ForceFeedback)
		menu_effects2()
	elseif i == 2
		menu_effects3()
	elseif i == 3
		menu_options()
	endif
endFunction

function menu_effects3()
	int i = _Frost_legacyconfig_effects3.Show()
	if i == 0
		MenuHandler_MultiSelect(_Frost_legacyconfig_fxplayeranim_off, _Frost_legacyconfig_fxplayeranim_auto, _Frost_legacyconfig_fxplayeranim_prompt, _Frost_Setting_Animation, 1)
		menu_effects3()
	elseif i == 1
		MenuHandler_Toggle(_Frost_legacyconfig_fxfolloweranim_on, _Frost_legacyconfig_fxfolloweranim_off, _Frost_Setting_FollowerAnimation)
		menu_effects3()
	elseif i == 2
		menu_effects()
	elseif i == 3
		menu_options()
	endif
endFunction

function menu_notifications()
	int i = _Frost_legacyconfig_notifications.Show()
	if i == 0
		MenuHandler_Toggle(_Frost_legacyconfig_msgcondition_on, _Frost_legacyconfig_msgcondition_off, _Frost_Setting_ConditionMessages)
		menu_notifications()
	elseif i == 1
		MenuHandler_Toggle(_Frost_legacyconfig_msgweather_on, _Frost_legacyconfig_msgweather_off, _Frost_Setting_WeatherMessages)
		menu_notifications()
	elseif i == 2
		MenuHandler_Toggle(_Frost_legacyconfig_msgattributevalues_on, _Frost_legacyconfig_msgattributevalues_off, _Frost_Setting_DisplayAttributeValuesInWeathersense)
		menu_notifications()
	elseif i == 3
		menu_notifications2()
	elseif i == 4
		menu_options2()
	endif
endFunction

function menu_notifications2()
	int i = _Frost_legacyconfig_notifications2.Show()
	if i == 0
		MenuHandler_Toggle(_Frost_legacyconfig_msgequipvalues_on, _Frost_legacyconfig_msgequipvalues_off, _Frost_Setting_Notifications_EquipmentValues)
		menu_notifications2()
	elseif i == 1
		MenuHandler_Toggle(_Frost_legacyconfig_msgequipsummary_on, _Frost_legacyconfig_msgequipsummary_off, _Frost_Setting_Notifications_EquipmentSummary)
		menu_notifications2()
	elseif i == 2
		menu_notifications()
	elseif i == 3
		menu_options2()
	endif
endFunction

function menu_enduranceskill()
	int i = _Frost_legacyconfig_enduranceskill.Show()
	if i == 0     ;Respec
        bool b = MenuHandler_Execute(_Frost_legacyconfig_enduranceskillrespec)
        if b
            RefundEnduranceSkillPoints()
            _Frost_legacyconfig_enduranceskillrestoredone.Show()
        endif
        menu_enduranceskill()
    elseif i == 1 ;Restore
        MenuHandler_UpDown(_Frost_legacyconfig_enduranceskillrestore, _Frost_LegacyConfigEnduranceRestore, 0.0, EndurancePerkPointsTotal.GetValue(), 1)
        if _Frost_LegacyConfigEnduranceRestore.GetValueInt() > 0
            EndurancePerkPointProgress.SetValue(0.0)
            EndurancePerkPoints.SetValue(_Frost_LegacyConfigEnduranceRestore.GetValueInt())
            EndurancePerkPointsEarned.SetValue(_Frost_LegacyConfigEnduranceRestore.GetValueInt())
            ClearEndurancePerks()
            _Frost_LegacyConfigEnduranceRestore.SetValueInt(0)
            _Frost_legacyconfig_enduranceskillrestoredone.Show()
        endif
        menu_enduranceskill()
    else
        menu_options2()
    endif
endFunction

function startup_shutdown()

endFunction

function ResetTutorials()
    _Frost_HelpDone_Exposure.SetValueInt(1)
	_Frost_HelpDone_Wet.SetValueInt(1)
	_Frost_HelpDone_Cold.SetValueInt(1)
endFunction

function ClearEndurancePerks()
    _Frost_PerkRank_Adaptation.SetValueInt(0)
	_Frost_PerkRank_Windbreaker.SetValueInt(0)
	_Frost_PerkRank_FrostWarding.SetValueInt(0)
	_Frost_PerkRank_GlacialSwimmer.SetValueInt(0)
	_Frost_PerkRank_InnerFire.SetValueInt(0)
	_Frost_PerkRank_WellInsulated.SetValueInt(0)
endFunction

function RefundEnduranceSkillPoints()
    ClearEndurancePerks()
    EndurancePerkPoints.SetValueInt(EndurancePerkPointsEarned.GetValueInt())
    EndurancePerkPointProgress.SetValue(0.0)
endFunction

function activate_preset_immersive()
	_Frost_Setting_NoFastTravel.SetValueInt(1)
	_Frost_Setting_NoWaiting.SetValueInt(1)
	_Frost_Setting_FrigidWaterIsLethal.SetValueInt(1)
	_Frost_Setting_MaxExposureMode.SetValueInt(1)
	_Frost_Setting_ExposurePauseCombat.SetValueInt(2)
	_Frost_Setting_ExposureRate.SetValue(0.8)
	_Frost_Setting_MovementPenalty.SetValueInt(1)
endFunction

function activate_preset_standard()
	_Frost_Setting_NoFastTravel.SetValueInt(1)
	_Frost_Setting_NoWaiting.SetValueInt(1)
	_Frost_Setting_FrigidWaterIsLethal.SetValueInt(2)
	_Frost_Setting_MaxExposureMode.SetValueInt(2)
	_Frost_Setting_ExposurePauseCombat.SetValueInt(2)
	_Frost_Setting_ExposureRate.SetValue(1.0)
	_Frost_Setting_MovementPenalty.SetValueInt(2)
endFunction

function activate_preset_hardcore()
	_Frost_Setting_NoFastTravel.SetValueInt(2)
	_Frost_Setting_NoWaiting.SetValueInt(1)
	_Frost_Setting_FrigidWaterIsLethal.SetValueInt(2)
	_Frost_Setting_MaxExposureMode.SetValueInt(3)
	_Frost_Setting_ExposurePauseCombat.SetValueInt(1)
	_Frost_Setting_ExposureRate.SetValue(1.0)
	_Frost_Setting_MovementPenalty.SetValueInt(2)
endFunction

;Format: On/Off, Back
;akSetting: 2 = ON, 1 = OFF
function MenuHandler_Toggle(Message akMessageOn, Message akMessageOff, GlobalVariable akSetting)
    if akSetting.GetValueInt() == 2
        int i = akMessageOn.Show()
        if i == 0
            akSetting.SetValueInt(1)
            MenuHandler_Toggle(akMessageOn, akMessageOff, akSetting)
        elseif i == 1
            ;return
        endif
    elseif akSetting.GetValueInt() == 1
        int i = akMessageOff.Show()
        if i == 0
            akSetting.SetValueInt(2)
            MenuHandler_Toggle(akMessageOn, akMessageOff, akSetting)
        elseif i == 1
            ;return
        endif
    endif
endFunction

function MenuHandler_MultiSelect(Message akOption1Active, Message akOption2Active, Message akOption3Active, GlobalVariable akSetting, int aiSettingOffset = 0)
    int i
    if (akSetting.GetValueInt() - aiSettingOffset) == 0
        i = akOption1Active.Show()
    elseif (akSetting.GetValueInt() - aiSettingOffset) == 1
    	i = akOption2Active.Show()
    elseif (akSetting.GetValueInt() - aiSettingOffset) == 2
    	i = akOption3Active.Show()
    endif

    if i < 3
    	akSetting.SetValueInt(i + aiSettingOffset)
    	MenuHandler_MultiSelect(akOption1Active, akOption2Active, akOption3Active, akSetting, aiSettingOffset)
    endif
endFunction

;Format: Execute, Back
bool function MenuHandler_Execute(Message akMessage)
    int i = akMessage.Show()
    if i == 0
        return true
    else
        return false
    endif
endFunction

;Format: Down, Up, Back
function MenuHandler_UpDown(Message akMessage, GlobalVariable akSetting, float afMin, float afMax, float afStepSize)
    int i = akMessage.Show(akSetting.GetValue())
    if i == 0
        ;Down
        if akSetting.GetValue() > afMin
            akSetting.SetValue(akSetting.GetValue() - afStepSize)
            if akSetting.GetValue() < afMin
                akSetting.SetValue(afMin)
            endif
            MenuHandler_UpDown(akMessage, akSetting, afMin, afMax, afStepSize)
        else
            MenuHandler_UpDown(akMessage, akSetting, afMin, afMax, afStepSize)
        endif
    elseif i == 1
        ;Up
        if akSetting.GetValue() < afMax
            akSetting.SetValue(akSetting.GetValue() + afStepSize)
            if akSetting.GetValue() > afMax
                akSetting.SetValue(afMax)
            endif
            MenuHandler_UpDown(akMessage, akSetting, afMin, afMax, afStepSize)
        else
            MenuHandler_UpDown(akMessage, akSetting, afMin, afMax, afStepSize)
        endif
    else
        ;return
    endif
endFunction

function MenuHandler_Tutorials(Message akMessageOn, Message akMessageOff, Message akMessageExecuteConfirm, Message akMessageExecuteDone, GlobalVariable akSetting)
    if akSetting.GetValueInt() == 2
        int i = akMessageOn.Show()
        if i == 0
            akSetting.SetValueInt(1)
            MenuHandler_Toggle(akMessageOn, akMessageOff, akSetting)
        elseif i == 1
            bool b = MenuHandler_Execute(akMessageExecuteConfirm)
            if b
                akMessageExecuteDone.Show()
                ResetTutorials()
            endif
        elseif i == 2
            ;return
        endif
    elseif akSetting.GetValueInt() == 1
        int i = akMessageOff.Show()
        if i == 0
            akSetting.SetValueInt(2)
            MenuHandler_Toggle(akMessageOn, akMessageOff, akSetting)
        elseif i == 1
            bool b = MenuHandler_Execute(akMessageExecuteConfirm)
            if b
                akMessageExecuteDone.Show()
                ResetTutorials()
            endif
        elseif i == 2
            ;return
        endif
    endif
endFunction

function SendEvent_StartFrostfall()
	FallbackEventEmitter emitter = GetEventEmitter_StartFrostfall()
    int handle = emitter.Create("Frost_StartFrostfall")
    if handle
    	emitter.PushBool(handle, false)
        emitter.Send(handle)
    endif
endFunction

function SendEvent_StopFrostfall()
	FallbackEventEmitter emitter = GetEventEmitter_StopFrostfall()
    int handle = emitter.Create("Frost_StopFrostfall")
    if handle
        emitter.Send(handle)
    endif
endFunction