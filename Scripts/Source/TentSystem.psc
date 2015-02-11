scriptname TentSystem hidden
{Interface between _Camp_TentAPI and mods that implement Campfire tents.}

_Camp_TentSystem function GetAPI() global
	;@TODO: Change to ESM.
	return (Game.GetFormFromFile(0x00025BC2, "Campfire.esp") as Quest) as _Camp_TentSystem
endFunction

function UpdateTentUseState(ObjectReference akTent) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif

	TentAPI.UpdateTentUseState(akTent)
endFunction

function ActivateTent(ObjectReference akActionRef, ObjectReference akTent) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif

	TentAPI.ActivateTent(akActionRef, akTent)
endFunction

function SelectExterior(ObjectReference akTent) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif

	TentAPI.SelectExterior(akTent)
endFunction

Static function GetXMarker() global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif

	return TentAPI.XMarker
endFunction

Static function GetWard() global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	
	return TentAPI._Camp_TentWard
endFunction

Furniture function GetSitMarker() global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif

	return TentAPI._Camp_TentSitMarker
endFunction

Furniture function GetLieDownMarker(bool bLeft = false, bool bRight = false) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif

	if !bLeft && !bRight
		return TentAPI._Camp_TentLayDownMarker
	elseif bLeft
		return TentAPI._Camp_TentLayDownMarkerL
	elseif bRight
		return TentAPI._Camp_TentLayDownMarkerR
	endif
endFunction

Furniture function GetPlayerBedroll(bool bLeft = false, bool bRight = false) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif

	if !bLeft && !bRight
		return TentAPI._Camp_Bedroll_ActualF
	elseif bLeft
		return TentAPI._Camp_Bedroll_ActualL
	elseif bRight
		return TentAPI._Camp_Bedroll_ActualR
	endif
endFunction

Furniture function GetNPCBedroll(bool bLeft = false, bool bRight = false) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif

	if !bLeft && !bRight
		return TentAPI._Camp_Bedroll_NPC_F
	elseif bLeft
		return TentAPI._Camp_Bedroll_NPC_L
	elseif bRight
		return TentAPI._Camp_Bedroll_NPC_R
	endif
endFunction

Static function GetLantern(bool bOn = false, bool bHanging = false) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif

	if bOn
		if bHanging
			return TentAPI._Camp_Tent_LanternOnHang
		else
			return TentAPI._Camp_Tent_LanternOnGround
		endif
	else
		if bHanging
			return TentAPI._Camp_Tent_LanternOffHang
		else
			return TentAPI._Camp_Tent_LanternOffGround
		endif
	endif
endFunction

Light function GetLanternLight() global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif

	return TentAPI._Camp_LanternLight
endFunction

Form function GetFireVolume() global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif

	return TentAPI.BFXFireVol01
endFunction

function RaiseTentAPIError() global
	debug.trace("[Campfire] Fatal Tent API error occurred.")
endFunction