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

; Event Emitters =============================================================================

FallbackEventEmitter function GetEventEmitter_CampfirePerkPurchased() global
    CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
    return Campfire.EventEmitter_CampfirePerkPurchased as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_InstinctsRunAliases() global
    CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
    return Campfire.EventEmitter_InstinctsRunAliases as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_InstinctsStartSearch() global
    CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
    return Campfire.EventEmitter_InstinctsStartSearch as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_InstinctsStopSearch() global
    CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
    return Campfire.EventEmitter_InstinctsStopSearch as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_Loaded() global
    CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
    return Campfire.EventEmitter_Loaded as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_OnBedrollSitLay() global
    CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
    return Campfire.EventEmitter_OnBedrollSitLay as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_OnConjuredObjectIDUpdated() global
    CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
    return Campfire.EventEmitter_OnConjuredObjectIDUpdated as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_OnObjectPlaced() global
    CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
    return Campfire.EventEmitter_OnObjectPlaced as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_OnObjectRemoved() global
    CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
    return Campfire.EventEmitter_OnObjectRemoved as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_OnTentEnter() global
    CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
    return Campfire.EventEmitter_OnTentEnter as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_OnTentLeave() global
    CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
    return Campfire.EventEmitter_OnTentLeave as FallbackEventEmitter
endFunction

FallbackEventEmitter function GetEventEmitter_PlayerHit() global
    CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif
    return Campfire.EventEmitter_PlayerHit as FallbackEventEmitter
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

bool function IsPlayerTransformed() global
	; Whether or not the player is transformed into a beast (Werewolf or Vampire Lord)
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif

	Race playerRace = Campfire.PlayerRef.GetRace()
	if playerRace.HasKeyword(Campfire.ImmuneParalysis)
		if playerRace.HasKeyword(Campfire.ActorTypeCreature)
			; Werewolf
			return true
		elseif playerRace.HasKeyword(Campfire.ActorTypeUndead) && !playerRace.HasKeyword(Campfire.ActorTypeNPC)
			; Vampire Lord
			return true
		else
			return false
		endif
	else
		return false
	endif
endFunction

bool function IsPlayerUndead() global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif

	Race playerRace = Campfire.PlayerRef.GetRace()
	if playerRace.HasKeyword(Campfire.ActorTypeUndead)
		return true
	else
		if (Campfire.PlayerVampireQuest as PlayerVampireQuestScript).VampireStatus > 0
			return true
		else
			return false
		endif
	endif
endFunction

bool function GetSKSELoaded() global
	return GetCompatibilitySystem().isSKSELoaded
endFunction

;/********f* CampUtil/GetAPIVersion
* API VERSION ADDED
* 1
*
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

;/********f* CampUtil/GetCampfireVersion
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Get the Campfire mod version number.
*
* SYNTAX
*/;
float function GetCampfireVersion() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* The Campfire version number.
*
* EXAMPLES
float ver = CampUtil.GetCampfireVersion()
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return -1.0
	endif
	return Campfire._Camp_CampfireVersion.GetValue()
endFunction

;/********f* CampUtil/GetPlayerEquippedHead
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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

;/********f* CampUtil/IsRefInInterior
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
	elseif IsPlayerTransformed()
		if abShowMessage
			Campfire._Camp_GeneralError_Transformed.Show()
		endif
		return false
	else
		return true
	endif
endFunction

;/********f* CampUtil/IsPlayerPlacingObject
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
* API VERSION ADDED
* 1
*
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
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	return Campfire.CurrentTent
endFunction

;/********f* CampUtil/IsTentWaterproof
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Is this tent waterproof?
*
* SYNTAX
*/;
bool function IsTentWaterproof(ObjectReference akTent) global
;/*
* PARAMETERS
* akTent: The Tent ObjectReference to check. Use the return value of GetCurrentTent(), or use IsCurrentTentWaterproof() instead.
*
* RETURN VALUE
* True if the tent is flagged as being waterproof, or false if not.
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif

	if !akTent
		return false
	endif

	Form TentForm = akTent.GetBaseObject()
	if TentForm.HasKeyword(Campfire.isCampfireTentWaterproof)
		return true
	else
		return false
	endif
endFunction

;/********f* CampUtil/IsTentWarm
* API VERSION ADDED
* 1
*
* DESCRIPTION
* Is this tent warm?
*
* SYNTAX
*/;
bool function IsTentWarm(ObjectReference akTent) global
;/*
* PARAMETERS
* akTent: The Tent ObjectReference to check. Use the return value of GetCurrentTent(), or use IsCurrentTentWarm() instead.
*
* RETURN VALUE
* True if the tent is flagged as being warm, or false if not.
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif

	if !akTent
		return false
	endif

	Form TentForm = akTent.GetBaseObject()
	if TentForm.HasKeyword(Campfire.isCampfireTentWarm)
		return true
	elseif Campfire._Camp_WarmBaseTents.HasForm(TentForm)
		return true
	else
		return false
	endif
endFunction

;/********f* CampUtil/TentHasShelter
* API VERSION ADDED
* 3
*
* DESCRIPTION
* Does this tent have shelter? (Used by Frostfall to determine if the player should warm up additionally when inside it.)
*
* SYNTAX
*/;
bool function TentHasShelter(ObjectReference akTent) global
;/*
* PARAMETERS
* akTent: The Tent ObjectReference to check. Use the return value of GetCurrentTent(), or use CurrentTentHasShelter() instead.
*
* RETURN VALUE
* Whether or not this tent has shelter.
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	if Campfire.CurrentTent
		if Campfire.CurrentTent.GetBaseObject().HasKeyword(Campfire.isCampfireTentNoShelter)
			return false
		else
			return true
		endif
	else
		return false
	endif

endFunction

;/********f* CampUtil/IsCurrentTentWaterproof
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Is the current tent waterproof?
*
* SYNTAX
*/;
bool function IsCurrentTentWaterproof() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* True if the current tent is flagged as being waterproof, or false if not or if there is no tent in use by the player.
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif

	if Campfire.CurrentTent && Campfire.CurrentTent.GetBaseObject().HasKeyword(Campfire.isCampfireTentWaterproof)
		return true
	else
		return false
	endif
endFunction

;/********f* CampUtil/IsCurrentTentWarm
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Is the current tent warm?
*
* SYNTAX
*/;
bool function IsCurrentTentWarm() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* True if the current tent is flagged as being warm, or false if not or if there is no tent in use by the player.
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif

	if Campfire.CurrentTent
		Form TentForm = Campfire.CurrentTent.GetBaseObject()
		if TentForm.HasKeyword(Campfire.isCampfireTentWarm)
			return true
		elseif Campfire._Camp_WarmBaseTents.HasForm(TentForm)
			return true
		else
			return false
		endif
	else
		return false
	endif
endFunction

;/********f* CampUtil/IsCurrentTentConjured
* API VERSION ADDED
* 4
*
* DESCRIPTION
* Is the current tent conjured?
*
* SYNTAX
*/;
bool function IsCurrentTentConjured() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* True if the current tent is flagged as being conjured, or false if not or if there is no tent in use by the player.
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif

	if Campfire.CurrentTent && (Campfire.CurrentTent as CampTent).Setting_IsConjured == true
		return true
	else
		return false
	endif
endFunction

;/********f* CampUtil/CurrentTentHasShelter
* API VERSION ADDED
* 3
*
* DESCRIPTION
* Does the current tent have shelter? (Used by Frostfall to determine if the player should warm up additionally when inside it.)
*
* SYNTAX
*/;
bool function CurrentTentHasShelter() global
;/*
* PARAMETERS
* None
*
* RETURN VALUE
* Whether or not the current tent has shelter.
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return None
	endif

	if Campfire.CurrentTent
		if Campfire.CurrentTent.GetBaseObject().HasKeyword(Campfire.isCampfireTentNoShelter)
			return false
		else
			return true
		endif
	else
		return false
	endif

endFunction

;/********f* CampUtil/IsCrimeToPlaceInTowns
* API VERSION ADDED
* 1
*
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

bool function IsTent(ObjectReference akReference) global
	if (akReference as CampTent)
		return true
	else
		return false
	endif
endFunction

;/********f* CampUtil/IsPlaceableObjectTemporary
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Returns whether or not this placeable object does not spawn persistently (i.e. won't be cleaned up by a cell reset).
*
* SYNTAX
*/;
bool function IsPlaceableObjectTemporary(Form akBaseObject) global
;/*
* PARAMETERS
* akBaseObject: The base object to check.
*
* RETURN VALUE
* True if the Form will spawn non-persistently, False if not.
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif
	if akBaseObject.HasKeyword(Campfire.isCampfireObjectTemporary)
		return true
	else
		return false
	endif
endFunction

;/********f* CampUtil/IsPlaceableObjectConjured
* API VERSION ADDED
* 4
*
* DESCRIPTION
* Returns whether or not this placeable object is conjured.
*
* SYNTAX
*/;
bool function IsPlaceableObjectConjured(Form akBaseObject) global
;/*
* PARAMETERS
* akBaseObject: The base object to check.
*
* RETURN VALUE
* True if the Form is conjured, False if not or not a placeable object.
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif
	if (akBaseObject as _Camp_PlaceableObjectBase) && ((akBaseObject as _Camp_PlaceableObjectBase).Setting_IsConjured == true)
		return true
	else
		return false
	endif
endFunction

;/********f* CampUtil/RegisterPerkTree
* API VERSION ADDED
* 4
*
* DESCRIPTION
* Register a new Campfire perk tree.
*
* NOTES
* Unless you have a specific reason to control the availability of the perk tree, you should use
* the CampPerkSystemRegister script on a Player ReferenceAlias instead of calling this function directly.
* See the Campfire Skill System Dev Kit tutorial for more info.
*
* SYNTAX
*/;
bool function RegisterPerkTree(Activator akPerkNodeController, string asPluginName = "Unknown") global
;/*
* PARAMETERS
* akPerkNodeController: The perk node controller to register.
* asPluginName: The plug-in name that this node controller is from. Only seen in Papyrus logs.
*
* RETURN VALUE
* True if the perk tree was successfully registered. Returns false if there is no available room for an additional perk tree.
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif

	_Camp_Compatibility compatibility = GetCompatibilitySystem()

	int i = 0
	while !compatibility.PerkNodeControllers && i < 30
		Utility.Wait(1)
		i += 1
	endWhile

	return compatibility.CampfirePerkSystemRegister(akPerkNodeController, asPluginName)
endFunction

;/********f* CampUtil/UnregisterPerkTree
* API VERSION ADDED
* 4
*
* DESCRIPTION
* Unregister a Campfire perk tree.
*
* NOTES
* In general, you do not need to manually unregister a perk tree. It will be automatically purged when
* the mod the node controller belongs to is uninstalled.
*
* SYNTAX
*/;
bool function UnregisterPerkTree(Activator akPerkNodeController, string asPluginName = "Unknown") global
;/*
* PARAMETERS
* akPerkNodeController: The perk node controller to unregister.
* asPluginName: The mod / plug-in name that this node controller is from. Only seen in Papyrus logs.
*
* RETURN VALUE
* True if the perk tree was successfully unregistered. Returns false if the perk tree was not found.
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif

	_Camp_Compatibility compatibility = GetCompatibilitySystem()

	int i = 0
	while !compatibility.PerkNodeControllers && i < 30
		Utility.Wait(1)
		i += 1
	endWhile

	return compatibility.CampfirePerkSystemUnregister(akPerkNodeController, asPluginName)
endFunction

;;/********f* CampUtil/RegisterExamineReplacement
;* API VERSION ADDED
;* 5
;*
;* DESCRIPTION
;* Register a new association between akFormToReplace and the Form to replace it with (akTargetForm) when using
;* Survival Skill: Examine.
;*
;* SYNTAX
;*/;
;bool function RegisterExamineReplacement(Form akFormToReplace, Form akTargetForm, Message akSuccessMessage, \
;										 bool abForceRegistration = false, FormList akExtraObjectsToDisableList = None) global
;;/*
;* PARAMETERS
;* akFormToReplace: The form to look for and replace when using Examine.
;* akTargetForm: The form to replace akFormToReplace with when using Examine.
;* akSuccessMessage: The message to display when the object is successfully replaced.
;* abForceRegistration (Optional): If True, will register the examine replacement even if akFormToReplace is already registered to something else, overwriting the previous registration.
;* akExtraObjectsToDisableList (Optional): A formlist of objects to disable, if found within 512.0 units of akFormToReplace.
;*
;* RETURN VALUE
;* True if the replacement mapping was successfully registered. False if this mapping could not be registered
;* (akFormToReplace has already been mapped to something else without the Force flag turned on, or one of the
;* required parameters is None).
;;*********/;
;	CampfireAPI Campfire = GetAPI()
;	if Campfire == none
;		RaiseCampAPIError()
;		return false
;	endif
;
;	_Camp_Compatibility c = GetCompatibilitySystem()
;	if !c.ExamineFormsToReplace
;		return false
;	endif
	;
;	if akFormToReplace && akTargetForm && akSuccessMessage
;		int i = CommonArrayHelper.ArrayCountForm(c.ExamineFormsToReplace)
;		if i < 128
;			int idx = c.ExamineFormsToReplace.Find(akFormToReplace)
;			if idx == -1 || abForceRegistration
;				c.ExamineFormsToReplace[i] = akFormToReplace
;				c.ExamineReplacementForms[i] = akTargetForm
;				c.ExamineSuccessMessages[i] = akSuccessMessage
;				if akExtraObjectsToDisableList
;					c.ExamineExtraFormsToDisable[i] = akExtraObjectsToDisableList
;				endif
;				return true
;			else
;				return false
;			endif
;		else
;			return false
;		endif
;	else
;		return false
;	endif
;endFunction
;
;;/********f* CampUtil/UnregisterExamineReplacement
;* API VERSION ADDED
;* 5
;*
;* DESCRIPTION
;* Unregisters a Survival Skill: Examine association between two Forms.
;*
;* NOTES
;* If the Examine registration replaces a Form with a Form in your mod, you do not need to unregister
;* it before your user uninstalls the mod. The system will remove the registration automatically if it finds an
;* association where the replacement Form is None (which would happen if your mod is uninstalled). However, if
;* the replacement is between two different forms not from your mod, you must unregister it if you want the
;* replacement to no longer function.
;*
;* SYNTAX
;*/;
;bool function UnregisterExamineReplacement(Form akFormToReplace) global
;;/*
;* PARAMETERS
;* akFormToReplace: The previously registered Form to unregister.
;*
;* RETURN VALUE
;* True if the replacement mapping was successfully unregistered. False if akFormToReplace was not found.
;;*********/;
;	CampfireAPI Campfire = GetAPI()
;	if Campfire == none
;		RaiseCampAPIError()
;		return false
;	endif
;
;	_Camp_Compatibility c = GetCompatibilitySystem()
;	if !c.ExamineFormsToReplace || !akFormToReplace
;		return false
;	endif
;
;	int idx = c.ExamineFormsToReplace.Find(akFormToReplace)
;	if idx != -1
;		CommonArrayHelper.ArrayRemoveForm(c.ExamineFormsToReplace, akFormToReplace, true)
;		CommonArrayHelper.ArrayRemoveForm(c.ExamineReplacementForms, c.ExamineReplacementForms[idx], true)
;		CommonArrayHelper.ArrayRemoveMessage(c.ExamineSuccessMessages, c.ExamineSuccessMessages[idx], true)
;		if c.ExamineExtraFormsToDisable[idx]
;			CommonArrayHelper.ArrayRemoveFormList(c.ExamineExtraFormsToDisable, c.ExamineExtraFormsToDisable[idx], true)
;		endif
;		return true
;	else
;		return false
;	endif
	;
	;
;endFunction
;
;;/********f* CampUtil/HasExamineReplacement
;* API VERSION ADDED
;* 5
;*
;* DESCRIPTION
;* Checks if akBaseObject has a Survival Skill: Examine replacement already registered.
;*
;* NOTES
;* In general, you don't need to call this before calling `RegisterExamineReplacement()`; it will simply
;* return False if the Form is already registered.
;*
;* SYNTAX
;*/;
;bool function HasExamineReplacement(Form akBaseObject) global
;;/*
;* PARAMETERS
;* akBaseObject: The Form to check for an Examine registration.
;*
;* RETURN VALUE
;* True if the Form is already registered, False if not.
;;*********/;
;	CampfireAPI Campfire = GetAPI()
;	if Campfire == none
;		RaiseCampAPIError()
;		return false
;	endif
	;
;	_Camp_Compatibility c = GetCompatibilitySystem()
;	if !c.ExamineFormsToReplace || !akBaseObject
;		return false
;	endif
;
;	if c.ExamineFormsToReplace.Find(akBaseObject) != -1
;		return true
;	else
;		return false
;	endif
;endFunction
;
;;/********f* CampUtil/GetExamineReplacementTarget
;* API VERSION ADDED
;* 5
;*
;* DESCRIPTION
;* Returns the Form that will replace akBaseObject when using Survival Skill: Examine.
;*
;* SYNTAX
;*/;
;Form function GetExamineReplacementTarget(Form akBaseObject) global
;;/*
;* PARAMETERS
;* akBaseObject: The Form to look up.
;*
;* RETURN VALUE
;* The Form registered to replace akBaseObject, or None if a registration wasn't found.
;;*********/;
;	CampfireAPI Campfire = GetAPI()
;	if Campfire == none
;		RaiseCampAPIError()
;		return None
;	endif
	;
;	_Camp_Compatibility c = GetCompatibilitySystem()
;	if !c.ExamineFormsToReplace || !akBaseObject
;		return None
;	endif
;
;	int i = c.ExamineFormsToReplace.Find(akBaseObject)
;	if i != -1
;		return c.ExamineReplacementForms[i]
;	else
;		return None
;	endif
;endFunction

;/********f* CampUtil/GetCampfireSettingBool
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Returns the state of the given Campfire setting.
*
* SYNTAX
*/;
bool function GetCampfireSettingBool(string setting) global
;/*
* PARAMETERS
* setting: The setting which you would like to retrieve. Accepted values (case-sensitive):
* * ManualFireLighting
* * CampingGearFlammable
* * TentRemovePlayerEquipment 	; The master setting for whether or not to remove player gear in tents
* * TentRemovePlayerCuirass
* * TentRemovePlayerHelm
* * TentRemovePlayerGauntlets
* * TentRemovePlayerBoots
* * TentRemovePlayerBackpack
* * TentRemovePlayerWeapons
* * TentRemovePlayerShield
* * TentRemovePlayerAmmo
* * TentRemoveFollowerEquipment
* * FollowerTracking
* * FollowersUseCampsite
* * CampingIllegalInTowns
* * AdvancedPlacementMode
* * EquippingOverhaulCompatibility
*
* RETURN VALUE
* True if the feature is enabled, false if disabled or if the setting string is invalid.
*
* EXAMPLES
if GetCampfireSettingBool("FollowerTracking") == true
	debug.trace("Campfire is tracking followers.")
endif
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return false
	endif

	if setting == "CampingGearFlammable"
		if Campfire._Camp_Setting_EquipmentFlammable.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "FollowerTracking"
		if Campfire._Camp_Setting_TrackFollowers.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "CampingIllegalInTowns"
		if Campfire._Camp_Setting_Legality.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "ManualFireLighting"
		if Campfire._Camp_Setting_ManualFireLighting.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "FollowersUseCampsite"
		if Campfire._Camp_Setting_FollowersUseCampsite.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "TentRemovePlayerEquipment"
		if Campfire._Camp_Setting_CampingArmorTakeOff.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "TentRemovePlayerCuirass"
		if Campfire._Camp_Setting_TakeOff_Cuirass.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "TentRemovePlayerHelm"
		if Campfire._Camp_Setting_TakeOff_Helm.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "TentRemovePlayerGauntlets"
		if Campfire._Camp_Setting_TakeOff_Gauntlets.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "TentRemovePlayerBoots"
		if Campfire._Camp_Setting_TakeOff_Boots.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "TentRemovePlayerBackpack"
		if Campfire._Camp_Setting_TakeOff_Backpack.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "TentRemovePlayerWeapons"
		if Campfire._Camp_Setting_TakeOff_Weapons.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "TentRemovePlayerShield"
		if Campfire._Camp_Setting_TakeOff_Shield.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "TentRemovePlayerAmmo"
		if Campfire._Camp_Setting_TakeOff_Ammo.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "TentRemoveFollowerEquipment"
		if Campfire._Camp_Setting_FollowersRemoveGearInTents.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "AdvancedPlacementMode"
		if Campfire._Camp_Setting_AdvancedPlacement.GetValueInt() == 2
			return true
		else
			return false
		endif
	elseif setting == "EquippingOverhaulCompatibility"
		if Campfire._Camp_Setting_CompatibilityEO.GetValueInt() == 2
			return true
		else
			return false
		endif
	else
		return false
	endif
endFunction

;/********f* CampUtil/GetCampfireSettingInt
* API VERSION ADDED
* 2
*
* DESCRIPTION
* Returns the value of the given Campfire setting.
*
* SYNTAX
*/;
int function GetCampfireSettingInt(string setting) global
;/*
* PARAMETERS
* setting: The setting which you would like to retrieve. Accepted values (case-sensitive):
* * MaxPlacementThreads
*
* RETURN VALUE
* The value of the setting, or -1 if the setting string was invalid.
*
* EXAMPLES
if GetCampfireSettingInt("MaxPlacementThreads") > 5
	debug.trace("Campfire is configured to use over 5 threads for placing objects.")
endif
;*********/;
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return -1
	endif

	if setting == "MaxPlacementThreads"
		return Campfire._Camp_Setting_MaxThreads.GetValueInt()
	else
		return -1
	endif
endFunction

;/********e* CampUtil/Campfire_OnObjectPlaced
* API VERSION ADDED
* 2
*
* DESCRIPTION
* An SKSE Mod Event that fires when the player places any Campfire placeable object (tents, containers, furniture, etc).
*
* SYNTAX
Event Campfire_OnObjectPlaced(Form akPlacedObject, float afPositionX, float afPositionY, float afPositionZ, float afAngleX, float afAngleY, float afAngleZ, bool abIsTent)
*
* PARAMETERS
* akPlacedObject: The ObjectReference that was placed. Cast to an ObjectReference (i.e. akPlacedObject as ObjectReference).
* afXPos: The X position of the object.
* afYPos: The Y position of the object.
* afZPos: The Z position of the object.
* afXAng: The X angle of the object.
* afYAng: The Y angle of the object.
* afZAng: The Z angle of the object.
* abIsTent: Whether or not this object is a Campfire-based tent.
*
* NOTES
* This event will also be sent when a Campfire Perk Tree is displayed.
*
* EXAMPLES
Event OnInit()
    RegisterForModEvent("Campfire_OnObjectPlaced", "Campfire_OnObjectPlaced")
endEvent

Event Campfire_OnObjectPlaced(Form akPlacedObject, float afPositionX, float afPositionY, float afPositionZ, float afAngleX, float afAngleY, float afAngleZ, bool abIsTent)
	if abIsTent
		debug.trace("The player just placed a tent!")
	endif
endEvent
;*********/;
function SendEvent_OnObjectPlaced(ObjectReference akObjectReference) global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return
	endif

	if akObjectReference
		float px = akObjectReference.GetPositionX()
		float py = akObjectReference.GetPositionY()
		float pz = akObjectReference.GetPositionZ()
		float ax = akObjectReference.GetAngleX()
		float ay = akObjectReference.GetAngleY()
		float az = akObjectReference.GetAngleZ()
		bool is_tent = IsTent(akObjectReference)
		_CampInternal.CampDebug(0, "Sending event Campfire_OnObjectPlaced " + akObjectReference + " " + \
				                   px + " " + py + " " + pz + " " + ax + \
				                   " " + ay + " " + az + " " + is_tent)
		FallbackEventEmitter emitter = GetEventEmitter_OnObjectPlaced()
		int handle = emitter.Create("Campfire_OnObjectPlaced")
		if handle
			emitter.PushForm(handle, akObjectReference as Form)
			emitter.PushFloat(handle, px)
			emitter.PushFloat(handle, py)
			emitter.PushFloat(handle, pz)
			emitter.PushFloat(handle, ax)
			emitter.PushFloat(handle, ay)
			emitter.PushFloat(handle, az)
			emitter.PushBool(handle, is_tent)
			emitter.Send(handle)
		endif
	endif
endFunction

;/********e* CampUtil/Campfire_OnObjectRemoved
* API VERSION ADDED
* 2
*
* DESCRIPTION
* An SKSE Mod Event that fires when the player picks up any Campfire placeable object (tents, containers, furniture, etc), or if that object is destroyed by fire.
*
* SYNTAX
Event Campfire_OnObjectRemoved(Form akBaseObject, float afPositionX, float afPositionY, float afPositionZ, float afAngleX, float afAngleY, float afAngleZ, bool abIsTent)
*
* PARAMETERS
* akPlacedObject: The base object of the object that was removed.
* afPositionX: The X position of the object.
* afPositionY: The Y position of the object.
* afPositionZ: The Z position of the object.
* afAngleX: The X angle of the object.
* afAngleY: The Y angle of the object.
* afAngleZ: The Z angle of the object.
* abIsTent: Whether or not this object is a Campfire-based tent.
*
* NOTES
* This event does not send the object reference of the object picked up as a parameter because, by the time this event is sent, the reference no longer exists.
* This event will also be sent when a Campfire Perk Tree is exited.
*
* EXAMPLES
Event OnInit()
    RegisterForModEvent("Campfire_OnObjectRemoved", "Campfire_OnObjectRemoved")
endEvent

Event Campfire_OnObjectRemoved(Form akBaseObject, float afPositionX, float afPositionY, float afPositionZ, float afAngleX, float afAngleY, float afAngleZ, bool abIsTent)
	if abIsTent
		debug.trace("The player just removed a tent!")
	endif
endEvent
;*********/;
function SendEvent_OnObjectRemoved(Form akBaseObject, float afPositionX, float afPositionY, float afPositionZ, float afAngleX, float afAngleY, float afAngleZ, bool abIsTent) global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return
	endif

	if akBaseObject
		_CampInternal.CampDebug(0, "Sending event Campfire_OnObjectRemoved " + akBaseObject + " " + \
				                   afPositionX + " " + afPositionY + " " + afPositionZ + " " + afAngleX + \
				                   " " + afAngleY + " " + afAngleZ + " " + abIsTent)
		FallbackEventEmitter emitter = GetEventEmitter_OnObjectRemoved()
		int handle = emitter.Create("Campfire_OnObjectRemoved")
		if handle
			emitter.PushForm(handle, akBaseObject)
			emitter.PushFloat(handle, afPositionX)
			emitter.PushFloat(handle, afPositionY)
			emitter.PushFloat(handle, afPositionZ)
			emitter.PushFloat(handle, afAngleX)
			emitter.PushFloat(handle, afAngleY)
			emitter.PushFloat(handle, afAngleZ)
			emitter.PushBool(handle, abIsTent)
			emitter.Send(handle)
		endif
	endif
endFunction

;/********e* CampUtil/Campfire_OnBedrollSitLay
* API VERSION ADDED
* 2
*
* DESCRIPTION
* An SKSE Mod Event that fires when the player sits down, lies down, or gets up from sitting or laying in a Campfire tent or bed roll.
*
* SYNTAX
Event Campfire_OnBedrollSitLay(Form akTent, bool abGettingUp)
*
* PARAMETERS
* akTent: The tent the player is sitting on, laying on, or getting up from. Cast to an ObjectReference (i.e. akTent as ObjectReference).
* abGettingUp: Whether or not the player is getting up from this tent or bed roll.
*
* EXAMPLES
Event OnInit()
    RegisterForModEvent("Campfire_OnBedrollSitLay", "Campfire_OnBedrollSitLay")
endEvent

Event Campfire_OnBedrollSitLay(Form akTent, bool abGettingUp)
	if abGettingUp
		debug.trace("The player just got up!")
	endif
endEvent
;*********/;
function SendEvent_OnBedrollSitLay(ObjectReference akTent, bool abGettingUp = false) global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return
	endif

	if akTent
		FallbackEventEmitter emitter = GetEventEmitter_OnBedrollSitLay()
		int handle = emitter.Create("Campfire_OnBedrollSitLay")
		if handle
			emitter.PushForm(handle, akTent as Form)
			emitter.PushBool(handle, abGettingUp)
			emitter.Send(handle)
		endif
	endif
endFunction

function RaiseCampAPIError() global
	debug.trace("[Campfire][ERROR] Fatal Campfire API error occurred.")
endFunction

;/********e* CampUtil/Campfire_OnTentEnter
* API VERSION ADDED
* 2
*
* DESCRIPTION
* An SKSE Mod Event that fires when the player "enters" a tent.
*
* SYNTAX
Event Campfire_OnTentEnter(Form akTent, bool abHasShelter)
*
* PARAMETERS
* akTent: The tent the player just "entered". Cast to an ObjectReference (i.e. akTent as ObjectReference).
* abHasShelter: Whether or not the tent the player entered has overhead shelter of some kind.
*
* NOTES
* For some tents created with the Campfire Dev Kit, this event may not fire as soon as the player physically enters the tent. It will instead be sent when the player sits or lies down on their bed roll. (Reason: TentAsset_LargeTentTriggerVolume has not been set.)
*
* EXAMPLES
Event OnInit()
    RegisterForModEvent("Campfire_OnTentEnter", "Campfire_OnTentEnter")
endEvent

Event Campfire_OnTentEnter(Form akTent, bool abHasShelter)
	if abHasShelter
		debug.trace("It's going to be a cold night...")
	endif
endEvent
;*********/;

;/********e* CampUtil/Campfire_OnTentLeave
* API VERSION ADDED
* 2
*
* DESCRIPTION
* An SKSE Mod Event that fires when the player "leaves" a tent.
*
* SYNTAX
Event Campfire_OnTentLeave()
*
* PARAMETERS
* None.
*
* NOTES
* This event may fire multiple times for the same tent. This can happen for a number of reasons, such as if the player is standing inside the tent when picking it up.
* For some tents created with the Campfire Dev Kit, this event may not fire as soon as the player physically enters the tent. It will instead be sent when the player gets up from sitting or lying down on their bed roll. (Reason: TentAsset_LargeTentTriggerVolume has not been set.)
*
* EXAMPLES
Event OnInit()
    RegisterForModEvent("Campfire_OnTentLeave", "Campfire_OnTentLeave")
endEvent

Event Campfire_OnTentLeave()
	debug.trace("Back to adventuring!")
endEvent
;*********/;

;/********e* CampUtil/Campfire_Loaded
* API VERSION ADDED
* 4
*
* DESCRIPTION
* An SKSE Mod Event that is raised when Campfire is finished starting up, or after loading a save game with Campfire enabled.
*
* SYNTAX
Event Campfire_Loaded()
*
* PARAMETERS
* None
*
* EXAMPLES
Event OnInit()
    RegisterForModEvent("Campfire_Loaded", "Campfire_Loaded")
endEvent

Event Campfire_Loaded()
    debug.notification("Campfire has finished starting up!")
endEvent
* NOTES
* This event will be raised almost immediately after game start-up, as Campfire
* is always enabled if loaded.
;*********/;
