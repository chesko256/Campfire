scriptname _Camp_LegacyMenu extends ActiveMagicEffect



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
        int i = akMessageOn.Show()
        if i == 0
            akSetting.SetValueInt(2)
            MenuHandler_Toggle(akMessageOn, akMessageOff, akSetting)
        elseif i == 1
            ;return
        endif
    endif
endFunction

;Format: Down, Up, Back
function MenuHandler_UpDown(Message akMessage, GlobalVariable akSetting, float afMin, float afMax, float afStepSize)
    int i = akMessage.Show()
    if i == 0
        ;Down
        if akSetting.GetValue() > afMin
            akSetting.SetValue(akSetting.GetValue() - afStepSize)
            if akSetting.GetValue() < afMin
                akSetting.SetValue(afMin)
            endif
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
        endif
    else
        ;return
    endif
endFunction