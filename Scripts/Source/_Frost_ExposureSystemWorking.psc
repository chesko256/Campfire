float MINOR_EXPOSURE = 5.0
float MODERATE_EXPOSURE = 10.0
float MAJOR_EXPOSURE = 20.0
float EXTREME_EXPOSURE = 40.0

float MIN_EXPOSURE = 0.0
float MAX_EXPOSURE = 100.0

function ModExposureDueToTime(int aiHoursPassed)
    float exposure_limit
    float exposure_limit_if_near_fire

    if player_fast_traveled
        ; The player fast traveled.
        ;@TODO: Also reduce wetness.
        SetExposure(100.0)
        return
    endif

    ; define max values
    if in_interior
        exposure_limit = MIN_EXPOSURE
        exposure_limit_if_near_fire = MIN_EXPOSURE
    elseif current_weather_temp <= -15
        if sheltered
            if shelter_is_warm
                exposure_limit = 25.0
                exposure_limit_if_near_fire = MIN_EXPOSURE
            else
                exposure_limit = 40.0
                exposure_limit_if_near_fire = 25.0
            endif
        else
            exposure_limit = 81.0 ; GetTempExposureCeiling()
            exposure_limit_if_near_fire = 50.0
        endif
    elseif current_weather_temp <= 0
        if sheltered
            if shelter_is_warm
                exposure_limit = 15.0
                exposure_limit_if_near_fire = MIN_EXPOSURE
            else
                exposure_limit = 30.0
                exposure_limit_if_near_fire = 20.0
            endif
        else
            exposure_limit = 60.0
            exposure_limit_if_near_fire = 30.0
        endif
    elseif current_weather_temp < 10
        if sheltered
            if shelter_is_warm
                exposure_limit = MIN_EXPOSURE
                exposure_limit_if_near_fire = MIN_EXPOSURE
            else
                exposure_limit = 15.0
                exposure_limit_if_near_fire = MIN_EXPOSURE
            endif
        else
            exposure_limit = 30.0
            exposure_limit_if_near_fire = MIN_EXPOSURE
        endif
    else
        exposure_limit = MIN_EXPOSURE
        exposure_limit_if_near_fire = MIN_EXPOSURE
    endif

    ; If they waited less than 2 hours, halve the amount modified.
    float tf
    if aiHoursPassed < 2
        tf = 1
    else
        tf = 0.5
    endif

    ; Modify exposure based on temperature
    if in_interior
        DecreaseExposureToLimit((MAJOR_EXPOSURE * tf), exposure_limit)
    elseif current_weather_temp <= -15
        if near_fire
            DecreaseExposureToLimit((MAJOR_EXPOSURE * tf), exposure_limit_if_near_fire)    
        elseif sheltered
            DecreaseExposureToLimit((MAJOR_EXPOSURE * tf), exposure_limit)
        else
            IncreaseExposureToLimit((EXTREME_EXPOSURE * tf), exposure_limit)
        endif
    elseif current_weather_temp > -15
        if near_fire
            DecreaseExposureToLimit((EXTREME_EXPOSURE * tf), exposure_limit_if_near_fire)
        elseif sheltered
            DecreaseExposureToLimit((MAJOR_EXPOSURE * tf), exposure_limit)
        else
            IncreaseExposureToLimit((MAJOR_EXPOSURE * tf), exposure_limit)
        endif
    endif
endFunction
    

elseif fTimeDeltaSec <= 20.0    ;Clamp point loss to 20-seconds between intervals        
    iSlowUpdateCounter = 0        
    ;=====================Master EP Loss Formula=======================        
    myPointLoss = ((((((fTempMultiplier * 20) + WetFactor)/(ClothingFactor + FrostFactor)) * AuxFactor) * pSetting_ExposureRate) * fTimeDeltaSec) / 60        
    ;==================================================================    
    FrostfallDebug(1, "Temp" + fTempMultiplier + " Wet" + WetFactor + " Cl" + ClothingFactor + " Fr" + FrostFactor + " Aux" + AuxFactor + " ER" + pSetting_ExposureRate)
    ;notification(myPointLoss + "points " + fTimeDeltaSec + " dTime")    
else    ;fTimeDeltaSec > 20.0
    iSlowUpdateCounter += 1
    if iSlowUpdateCounter == 4
        if _DE_Setting_SystemMsg.GetValueInt() == 2
            messagebox("Your game's scripting system is running too slowly in order for Frostfall to run correctly. Please see the Troubleshooting page of the online documentation for tips. Your exposure value will not change until this improves. (Last update took " + fTimeDeltaSec + "sec, expected <20.0sec)")
        endif
    endif
endif    