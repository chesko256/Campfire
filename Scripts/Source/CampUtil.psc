;/********s* Form/CampUtil
* SCRIPTNAME
*/;
scriptname CampUtil hidden
;/*
* OVERVIEW
* The `CampUtil` script is the primary way most mods should interact with Campfire and contains many helpful functions. To call any of the following functions, download the SDK and in your script include the line:
* <pre>import CampUtil</pre>
* Alternatively, you can call `CampUtil.FunctionName()` without importing CampUtil.
;*********/;

import math
import debug

CampfireAPI function GetAPI() global
	;@TODO: Change to .esm check
	return (Game.GetFormFromFile(0x00024095, "Campfire.esp") as Quest) as CampfireAPI
endFunction

; Functions ==================================================================================

_Camp_ObjectPlacementThreadManager function GetPlacementSystem() global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	return Campfire.CampfireObjectPlacementSystem as _Camp_ObjectPlacementThreadManager
endFunction

_Camp_Compatibility function GetCompatibilitySystem() global
	;@TODO: Change to ESM
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return none
	endif
	return Campfire.Compatibility
endFunction

_Camp_TentSystem function GetTentSystem() global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	return Campfire.CampfireTentSystem as _Camp_TentSystem
endFunction

;/********f* CampUtil/GetPlayerEquippedHead
* DESCRIPTION
* Gets the player's currently equipped head armor.
*
* SYNTAX
*/;
Armor function GetPlayerEquippedHead() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The player's currently equipped head armor.
*
* EXAMPLES
Armor PlayerHelm = GetPlayerEquippedHead()
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
	
	return Campfire.CampData.CurrentHead
endFunction

;/********f* CampUtil/GetPlayerEquippedBody
* DESCRIPTION
* Gets the player's currently equipped body armor.
*
* SYNTAX
*/;
Armor function GetPlayerEquippedBody() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The player's currently equipped body armor.
*
* EXAMPLES
Armor PlayerArmor = GetPlayerEquippedBody()
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	return Campfire.CampData.CurrentBody
endFunction

;/********f* CampUtil/GetPlayerEquippedHands
* DESCRIPTION
* Gets the player's currently equipped hand armor.
*
* SYNTAX
*/;
Armor function GetPlayerEquippedHands() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The player's currently equipped hand armor.
*
* EXAMPLES
Armor PlayerGauntlets = GetPlayerEquippedHands()
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	return Campfire.CampData.CurrentHands
endFunction

;/********f* CampUtil/GetPlayerEquippedFeet
* DESCRIPTION
* Gets the player's currently equipped foot armor.
*
* SYNTAX
*/;
Armor function GetPlayerEquippedFeet() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The player's currently equipped foot armor.
*
* EXAMPLES
Armor PlayerBoots = GetPlayerEquippedFeet()
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	return Campfire.CampData.CurrentFeet
endFunction

;/********f* CampUtil/GetPlayerEquippedBackpack
* DESCRIPTION
* Gets the player's currently equipped backpack.
*
* SYNTAX
*/;
Armor function GetPlayerEquippedBackpack() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The player's currently equipped backpack.
*
* EXAMPLES
Armor PlayerBackpack = GetPlayerEquippedBackpack()
* NOTES
*	An Armor item is considered to be a backpack if it is in the _Camp_Backpacks FormList.
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	return Campfire.CampData.CurrentBackpack
endFunction

;/********f* CampUtil/GetPlayerEquippedAmmo
* DESCRIPTION
* Gets the player's currently equipped ammo.
*
* SYNTAX
*/;
Ammo function GetPlayerEquippedAmmo() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The player's currently equipped ammo.
*
* EXAMPLES
Armor PlayerArrows = GetPlayerEquippedAmmo()
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	return Campfire.CampData.CurrentAmmo
endFunction

GlobalVariable function GetSettingEquipmentFlammable() global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
	return Campfire._Camp_Setting_EquipmentFlammable
endFunction

;/********f* CampUtil/IsRefInInterior
* DESCRIPTION
* Whether or not the reference is in an interior cell, or a cell that "looks like" an interior.
*
* SYNTAX
*/;
bool function IsRefInInterior(ObjectReference akReference) global
;/*
* PARAMETERS
* * akReference: The object reference to check.
*
* RETURN VALUE
* True if the reference is in an interior or "interior-like" cell, false otherwise.
*
* EXAMPLES
;Is the box in an interior?
if IsRefInInterior(Box)
	Debug.Trace("Box is inside!")
endif
* NOTES
* The standard IsInInterior() function can only return whether or not the current cell 
* is marked as an Interior. There are numerous worldspaces (such as AlftandWorld, 
* Blackreach, BlindCliffCaveWorld, etc) that look and act like interiors, but are set 
* as external worldspaces. This can cause IsInInterior() to return undesirable results.
* This function takes these known base game (and DLC) worldspaces into account when
* evaluating the object reference's location.
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return False
	endif

	if akReference.IsInInterior()
		return True
	else
		if Campfire._Camp_WorldspacesInteriors.HasForm(akReference.GetWorldSpace())
			return True
		else
			return False
		endif
	endif
endFunction

Actor function GetTrackedFollower(int aiIndex) global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
	if aiIndex == 1
		return Campfire.Follower1.GetActorRef()
	elseif aiIndex == 2
		return Campfire.Follower2.GetActorRef()
	elseif aiIndex == 3
		return Campfire.Follower3.GetActorRef()
	else
		return None
	endif
endFunction

bool function IsTrackedFollower(Actor akActor) global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
	if akActor == Campfire.Follower1.GetActorRef()
		return true
	elseif akActor == Campfire.Follower2.GetActorRef()
		return true
	elseif akActor == Campfire.Follower3.GetActorRef()
		return true
	else
		return false
	endif
endFunction

int function GetTrackedFollowerCount() global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return -1
	endif
	int i = 0
	if Campfire.Follower1.GetActorRef()
		i += 1
	endif
	if Campfire.Follower2.GetActorRef()
		i += 1
	endif
	if Campfire.Follower3.GetActorRef()
		i += 1
	endif
	return i
endFunction

Actor function GetTrackedAnimal()
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
	return Campfire.Animal.GetActorRef()
endFunction

bool function IsTrackedAnimal(Actor akActor) global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
	if akActor == Campfire.Animal.GetActorRef()
		return true
	else
		return false
	endif
endFunction

int function GetTrackedAnimalCount() global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return -1
	endif
	int i = 0
	if Campfire.Animal.GetActorRef()
		i += 1
	endif
	return i
endFunction

float[] function GetAngleData(ObjectReference akObjectReference) global
	float[] angle_data = new float[3]
    angle_data[0] = akObjectReference.GetAngleX()
    angle_data[1] = akObjectReference.GetAngleY()
    angle_data[2] = akObjectReference.GetAngleZ()
	return angle_data
endFunction

float[] function GetPositionData(ObjectReference akObjectReference) global
	float[] position_data = new float[3]
	position_data[0] = akObjectReference.GetPositionX()
	position_data[1] = akObjectReference.GetPositionY()
	position_data[2] = akObjectReference.GetPositionZ()
	return position_data
endFunction

;/********f* CampUtil/PlayerCanPlaceObjects
* DESCRIPTION
* Whether or not the player can currently place Placeable Objects (tents, etc).
*
* SYNTAX
*/;
bool function PlayerCanPlaceObjects(bool abShowMessage = true, bool abPlayerBusyCheck = true) global
;/*
* PARAMETERS
* * abShowMessage: Whether to show an informative message detailing why the player can't place a Placeable Object right now if returning false.
* * abPlayerBusyCheck: Whether or not to check if the player is already placing an object.
* 
* RETURN VALUE
* True if the player can currently place Placeable Objects, false otherwise.
*
* EXAMPLES
	if PlayerCanPlaceObjects()
		debug.trace("The player can place objects!")
	endif
* NOTES
* Reasons that this function might return false are:
* * The player is being attacked.
* * The player is already trying to place something.
* * The player is swimming.
* * The player is mounted.
* * The player is sleeping.
* * The player is sitting down.
* * The player is using another object (crafting bench, etc).
* * The player is currently transformed into a Vampire Lord or Werewolf.
;*********/;
	;@TODO: Check Vampire Lord, Werewolf
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return False
	endif

	if abPlayerBusyCheck && IsPlayerPlacingObject()
		if abShowMessage
			Campfire._Camp_GeneralError_Placement.Show()
		endif
		return false
	elseif GetCompatibilitySystem().isSKSELoaded && Campfire.PlayerRef.IsSwimming()
		if abShowMessage
			Campfire._Camp_GeneralError_Swimming.Show()
		endif
		return false
	elseif Campfire.PlayerRef.IsOnMount()
		if abShowMessage
			Campfire._Camp_GeneralError_Mounted.Show()
		endif
		return false
	elseif Campfire.PlayerRef.GetSleepState() != 0
		if abShowMessage
			Campfire._Camp_GeneralError_Sleeping.Show()
		endif
		return false
	elseif Campfire.PlayerRef.GetSitState() != 0
		if abShowMessage
			Campfire._Camp_GeneralError_Busy.Show()
		endif
		return false
	else
		return true
	endif
endFunction

;/********f* CampUtil/IsPlayerPlacingObject
* DESCRIPTION
* Whether or not the player is currently placing a Placeable Object (tent, etc).
*
* SYNTAX
*/;
bool function IsPlayerPlacingObject() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* True if the player is currently placing a Placeable Object, false otherwise.
*
* EXAMPLES
if IsPlayerPlacingObject()
	debug.trace("The player is placing an object right now!")
endif
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return False
	endif
	
	if Campfire._Camp_CurrentlyPlacingObject.GetValueInt() == 2
		return True
	else
		return False
	endif
endFunction

;/********f* CampUtil/IsPlaceableObject
* DESCRIPTION
* Whether or not the Form is a Placeable Object.
*
* SYNTAX
*/;
bool function IsPlaceableObject(Form akBaseObject) global
;/*
* PARAMETERS
* * akBaseObject: The base object to check.
*
* RETURN VALUE
* True if the Form is a Placeable Object, false otherwise.
*
* EXAMPLES
if IsPlaceableObject()
	debug.trace("The item is a placeable object.")
endif
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return False
	endif
	
	if akBaseObject.HasKeyword(Campfire.isCampfirePlaceableObject)
		return True
	else
		return False
	endif
endFunction

;/********f* CampUtil/LegalToCampHere
* DESCRIPTION
* Whether or not the player's current location is considered a legal camping area.
*
* SYNTAX
*/;
bool function LegalToCampHere(bool abIgnoreSetting = false) global
;/*
* PARAMETERS
* * abIgnoreSetting: Whether or not to ignore Campfire's "Camping Illegal in Settled Areas" setting. If true, returns the legality of the player's current position regardless of the setting.
*
* RETURN VALUE
* True if player's location is a legal camping area; false otherwise.
*
* EXAMPLES
if !LegalToCampHere()
	debug.trace("We can't stop here. This is bat country.")
endif
* NOTES
* In Campfire, it is illegal for the player to place Placeable Objects inside houses, other owned buildings (inns, taverns), and within range of / inside settled areas like towns and cities.
;*********/;
	;@TODO: Support abIgnoreSetting
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return False
	endif

	return Campfire.Legal.GetCampingLegal()
endFunction

;/********f* CampUtil/GetAreaCampingFaction
* DESCRIPTION
* Returns the faction that dictates camping legality in this area.
*
* SYNTAX
*/;
Faction function GetAreaCampingFaction(ObjectReference akCenter) global
;/*
* PARAMETERS
* akCenter: The object whose surroundings to check.
*
* RETURN VALUE
* If akCenter is in an illegal camping area, returns the faction responsible for making it illegal, else, returns None.
*
* EXAMPLES
Faction property MyCoolFaction auto
if GetAreaCampingFaction() == MyCoolFaction
	debug.trace("MyCoolFaction are a bunch of facists for not letting me camp here!")
endif
;*********/;
	;@TODO: Support abIgnoreSetting
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	return Campfire.Legal.GetAreaCampingFaction(akCenter)
endFunction

ObjectReference function GetLastUsedCampfire() global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	return Campfire.LastUsedCampfire
endFunction

ObjectReference function GetCurrentTent() global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	ObjectReference myTent = Game.FindClosestReferenceOfAnyTypeInListFromRef(Campfire._Camp_TentActivators, Campfire.PlayerRef, 235.0)
	if myTent
		return myTent
	else
		return none
	endif
endFunction

bool function IsCurrentTentWaterproof(ObjectReference akTent) global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif

	Form TentForm = akTent.GetBaseObject()
	if TentForm.HasKeyword(Campfire.isCampfireTentWaterproof)
		return true
	else
		return false
	endif
endFunction

bool function IsCurrentTentWarm(ObjectReference akTent) global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif

	Form TentForm = akTent.GetBaseObject()
	if TentForm.HasKeyword(Campfire.isCampfireTentWarm)
		return true
	else
		return false
	endif
endFunction

bool function IsCrimeToPlaceInTowns(Form akBaseObject) global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif

	if akBaseObject.HasKeyword(Campfire.isCampfireCrimeToPlaceInTowns)
		return true
	else
		return false
	endif
endFunction

function ExitMenus() global
	Game.DisablePlayerControls()
	Game.EnablePlayerControls()
endFunction

function RaiseCampAPIError() global
	debug.trace("[Campfire][ERROR] Fatal Campfire API error occurred.")
endFunction