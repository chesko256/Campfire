Scriptname _Camp_TrackCell extends ActiveMagicEffect
;From http://www.creationkit.com/Detect_Player_Cell_Change_(Without_Polling)
 
Actor property PlayerRef auto
ObjectReference property _Camp_CellTrackingMarker auto
 
Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace("[Campfire] Player changed cell")
    _Camp_CellTrackingMarker.MoveTo(PlayerRef)
    RaiseEvent_OnCellChange()
EndEvent

function RaiseEvent_OnCellChange()
    int handle = ModEvent.Create("Campfire_OnCellChange")
    if handle
        ModEvent.Send(handle)
    else
        ;pass
    endif
endFunction