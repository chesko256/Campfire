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

Weapon function GetFollowerMainWeapon(CampTent akTentObject, int aiFollowerBedrollIndex) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	Weapon wpn = TentAPI.GetFollowerMainWeapon(akTentObject, aiFollowerBedrollIndex)
	return wpn
endFunction
Weapon function GetFollowerOffHandWeapon(CampTent akTentObject, int aiFollowerBedrollIndex) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	Weapon wpn = TentAPI.GetFollowerOffHandWeapon(akTentObject, aiFollowerBedrollIndex)
	return wpn
endFunction
Weapon function GetFollowerBigWeapon(CampTent akTentObject, int aiFollowerBedrollIndex) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	Weapon wpn = TentAPI.GetFollowerBigWeapon(akTentObject, aiFollowerBedrollIndex)
	return wpn
endFunction
Weapon function GetFollowerBowWeapon(CampTent akTentObject, int aiFollowerBedrollIndex) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	Weapon wpn = TentAPI.GetFollowerBowWeapon(akTentObject, aiFollowerBedrollIndex)
	return wpn
endFunction
Armor function GetFollowerShield(CampTent akTentObject, int aiFollowerBedrollIndex) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	Armor shld = TentAPI.GetFollowerShield(akTentObject, aiFollowerBedrollIndex)
	return shld
endFunction
function SetFollowerMainWeapon(CampTent akTentObject, int aiFollowerBedrollIndex, Weapon akWeapon) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	TentAPI.SetFollowerMainWeapon(akTentObject, aiFollowerBedrollIndex, akWeapon)
endFunction
function SetFollowerOffHandWeapon(CampTent akTentObject, int aiFollowerBedrollIndex, Weapon akWeapon) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	TentAPI.SetFollowerOffHandWeapon(akTentObject, aiFollowerBedrollIndex, akWeapon)
endFunction
function SetFollowerBigWeapon(CampTent akTentObject, int aiFollowerBedrollIndex, Weapon akWeapon) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	TentAPI.SetFollowerBigWeapon(akTentObject, aiFollowerBedrollIndex, akWeapon)
endFunction
function SetFollowerBowWeapon(CampTent akTentObject, int aiFollowerBedrollIndex, Weapon akWeapon) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	TentAPI.SetFollowerBowWeapon(akTentObject, aiFollowerBedrollIndex, akWeapon)
endFunction
function SetFollowerShield(CampTent akTentObject, int aiFollowerBedrollIndex, Armor akShield) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	TentAPI.SetFollowerShield(akTentObject, aiFollowerBedrollIndex, akShield)
endFunction
function SetFollowerDisplayMainWeapon(CampTent akTentObject, int aiBedrollIndex) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	TentAPI.SetFollowerDisplayMainWeapon(akTentObject, aiBedrollIndex)
endFunction
function SetFollowerDisplayOffHandWeapon(CampTent akTentObject, int aiBedrollIndex) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	TentAPI.SetFollowerDisplayOffHandWeapon(akTentObject, aiBedrollIndex)
endFunction
function SetFollowerDisplayBigWeapon(CampTent akTentObject, int aiBedrollIndex) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	TentAPI.SetFollowerDisplayBigWeapon(akTentObject, aiBedrollIndex)
endFunction
function SetFollowerDisplayBowWeapon(CampTent akTentObject, int aiBedrollIndex) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	TentAPI.SetFollowerDisplayBowWeapon(akTentObject, aiBedrollIndex)
endFunction
function SetFollowerDisplayShield(CampTent akTentObject, int aiBedrollIndex) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		RaiseTentAPIError()
		return None
	endif
	TentAPI.SetFollowerDisplayShield(akTentObject, aiBedrollIndex)
endFunction
function UnDisplayFollowerMainWeapon(CampTent akTentObject, int aiBedrollIndex, Actor akActor) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		return None
	endif
	TentAPI.UnDisplayFollowerMainWeapon(akTentObject, aiBedrollIndex, akActor)
endFunction
function UnDisplayFollowerOffHandWeapon(CampTent akTentObject, int aiBedrollIndex, Actor akActor) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		return None
	endif
	TentAPI.UnDisplayFollowerOffHandWeapon(akTentObject, aiBedrollIndex, akActor)
endFunction
function UnDisplayFollowerBigWeapon(CampTent akTentObject, int aiBedrollIndex, Actor akActor) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		return None
	endif
	TentAPI.UnDisplayFollowerBigWeapon(akTentObject, aiBedrollIndex, akActor)
endFunction
function UnDisplayFollowerBowWeapon(CampTent akTentObject, int aiBedrollIndex, Actor akActor) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		return None
	endif
	TentAPI.UnDisplayFollowerBowWeapon(akTentObject, aiBedrollIndex, akActor)
endFunction
function UnDisplayFollowerShield(CampTent akTentObject, int aiBedrollIndex, Actor akActor) global
	_Camp_TentSystem TentAPI = GetAPI()
	if TentAPI == none
		return None
	endif
	TentAPI.UnDisplayFollowerShield(akTentObject, aiBedrollIndex, akActor)
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