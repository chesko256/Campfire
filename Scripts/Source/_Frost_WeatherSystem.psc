scriptname _Frost_ClimateSystem extends Quest

Weather property CurrentWeather auto hidden
int property CurrentTemp auto hidden

Actor property PlayerRef auto

Event OnUpdate()
    GetWeatherData()

    ;if Frostfall running,
        RegisterForSingleUpdate(5)
    ;endif
EndEvent

function GetWeatherData()
    int max_temp
    int weather_temp
    int current_temp
    Weather current_weather = Weather.GetCurrentweather()

    if !CampUtil.IsRefInInterior(PlayerRef)
        max_temp = GetExceptionBlockTemp()
        weather_temp = GetWeatherTemp(max_temp, current_weather)
    else
        max_temp = 0
        weather_temp = 10
    endif

    if current_temp > max_temp
        current_temp = max_temp
    else
        current_temp = weather_temp
    endif

    ; Publish temperature data
    CurrentTemp = current_temp
endFunction