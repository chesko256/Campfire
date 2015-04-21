;/********s* Form/CampUtil
* SCRIPTNAME
*/;
scriptname CampUtil hidden
{
* OVERVIEW
* The `CampUtil` script is the primary way most mods should interact with Campfire and contains many helpful functions. To call any of the following functions, download the SDK and in your script include the line:
* <pre>import CampUtil</pre>
* Alternatively, you can call `CampUtil.FunctionName()` without importing CampUtil. }
;*********/;

import math
import debug

CampfireAPI function GetAPI() global
	return (Game.GetFormFromFile(0x00024095, "Campfire.esm") as Quest) as CampfireAPI
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

;/********f* CampUtil/GetAPIVersion
* DESCRIPTION
* Get the CampUtil API version number.
*
* SYNTAX
*/;
float function GetAPIVersion() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The CampUtil API version number. This is NOT the same thing as the version number of Campfire.
* CampUtil's version number will increment only when changes have been made to the API itself.
*
* EXAMPLES
float ver = CampUtil.GetAPIVersion()
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return -1.0
	endif
	return Campfire._Camp_APIVersion.GetValue()
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

;/********f* CampUtil/GetTrackedFollower
* DESCRIPTION
* Returns the tracked follower at the specified index.
*
* SYNTAX
*/;
Actor function GetTrackedFollower(int aiIndex) global
;/*
* PARAMETERS
* * aiIndex: The index (1 - 3) to check. Returns None if index is out of range or there
* is no follower filling the specified index.
*
* RETURN VALUE
* The Actor occupying this index, or None if no tracked follower in this index.
*
* EXAMPLES
int i = 1
while i < 4
	debug.trace("Follower " + i + " is " + CampUtil.GetTrackedFollower(i))
	i += 1
endWhile
;*********/;
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

;/********f* CampUtil/IsTrackedFollower
* DESCRIPTION
* Whether or not this actor is a tracked follower.
*
* SYNTAX
*/;
bool function IsTrackedFollower(Actor akActor) global
;/*
* PARAMETERS
* * akActor: The actor to check.
*
* RETURN VALUE
* True if this actor is a tracked follower; false if not.
*
* EXAMPLES
if CampUtil.IsTrackedFollower(myActor)
	debug.trace(myActor + " is a follower!")
endif
;*********/;
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

;/********f* CampUtil/GetTrackedFollowerCount
* DESCRIPTION
* Return the number of tracked followers.
*
* SYNTAX
*/;
int function GetTrackedFollowerCount() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The number of followers currently being tracked, from 0 to 3.
*
* EXAMPLES
debug.trace("I have " + CampUtil.GetTrackedFollowerCount() + " followers.")
;*********/;
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

;/********f* CampUtil/GetTrackedAnimal
* DESCRIPTION
* Returns the tracked animal in the player's service.
*
* SYNTAX
*/;
Actor function GetTrackedAnimal() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The tracked animal Actor currently in the player's service, or None if no animal
* currently following the player.
*
* EXAMPLES
debug.trace("My dog is " + CampUtil.GetTrackedAnimal())
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
	return Campfire.Animal.GetActorRef()
endFunction

;/********f* CampUtil/IsTrackedAnimal
* DESCRIPTION
* Whether or not the Actor is a tracked animal.
*
* SYNTAX
*/;
bool function IsTrackedAnimal(Actor akActor) global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* True if the Actor is a tracked animal; False if not.
;*********/;
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

;/********f* CampUtil/GetTrackedAnimalCount
* DESCRIPTION
* Get the number of animals currently in the player's service.
*
* SYNTAX
*/;
int function GetTrackedAnimalCount() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The number of animals currently being tracked, from 0 to 1.
*
* EXAMPLES
debug.trace("I have " + CampUtil.GetTrackedAnimalCount() + " doggies.")
;*********/;
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
* * The player is already trying to place something.
* * The player is swimming.
* * The player is mounted.
* * The player is sleeping.
* * The player is sitting down.
* * The player is using another object (crafting bench, etc).
* * The player is currently transformed into a Vampire Lord or Werewolf.
;*********/;
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
	elseif Campfire.PlayerRef.GetRace().HasKeyword(Campfire.ActorTypeCreature) || Campfire.PlayerRef.GetRace().HasKeyword(Campfire.ImmuneParalysis)
		if abShowMessage
			Campfire._Camp_GeneralError_Transformed.Show()
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
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return False
	endif

	return Campfire.Legal.GetCampingLegal(abIgnoreSetting)
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
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	return Campfire.Legal.GetAreaCampingFaction(akCenter)
endFunction

;/********f* CampUtil/GetLastUsedCampfire
* DESCRIPTION
* Returns the last campfire used by the player.
*
* SYNTAX
*/;
ObjectReference function GetLastUsedCampfire() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The last campfire used by the player, or None if it no longer exists.
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	return Campfire.LastUsedCampfire
endFunction

;/********f* CampUtil/GetCurrentTent
* DESCRIPTION
* Returns the current tent being used.
*
* SYNTAX
*/;
ObjectReference function GetCurrentTent() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The current tent being used, or None if the player is not using a tent.
*
* NOTES
* Return value used as input to IsCurrentTentWaterproof() and IsCurrentTentWarm().
;*********/;
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

;/********f* CampUtil/IsCurrentTentWaterproof
* DESCRIPTION
* Is the current tent waterproof?
*
* SYNTAX
*/;
bool function IsCurrentTentWaterproof(ObjectReference akTent) global
;/*
* PARAMETERS
* akTent: The Tent ObjectReference to check. Use the return value of GetCurrentTent().
*
* RETURN VALUE
* True if the current tent is flagged as being waterproof, or false if not.
;*********/;
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

;/********f* CampUtil/IsCurrentTentWarm
* DESCRIPTION
* Is the current tent warm?
*
* SYNTAX
*/;
bool function IsCurrentTentWarm(ObjectReference akTent) global
;/*
* PARAMETERS
* akTent: The Tent ObjectReference to check. Use the return value of GetCurrentTent().
*
* RETURN VALUE
* True if the current tent is flagged as being warm, or false if not.
;*********/;
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

;/********f* CampUtil/IsCrimeToPlaceInTowns
* DESCRIPTION
* Is it a crime to place this base object in towns, inside owned houses, etc?
*
* SYNTAX
*/;
bool function IsCrimeToPlaceInTowns(Form akBaseObject) global
;/*
* PARAMETERS
* akBaseObject: The base object to check.
*
* RETURN VALUE
* True if the Form is illegal to place in settled areas, or False if not.
*
* NOTES
* This function returns true or false without regard to the current legality setting.
;*********/;
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