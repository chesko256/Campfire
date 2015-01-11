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

float[] function GetAngleData(ObjectReference akObjectReference) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif

	return TentAPI.GetAngleData(akObjectReference)
endFunction

float[] function GetRelativePosition(ObjectReference akOrigin, ObjectReference akObjectReference) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif

	return TentAPI.GetRelativePosition(akOrigin, akObjectReference)
endFunction

function RaiseTentAPIError() global
	debug.trace("[Campfire] Fatal Tent API error occurred.")
endFunction