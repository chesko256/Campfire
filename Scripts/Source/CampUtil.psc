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

; Events =====================================================================================

bool function RaiseEvent_CampfireOnGearEquipped(Form akBaseObject, int iGearType) global
	;===========
	;Syntax
	;===========
	;	Event CampfireOnGearEquipped(Form akBaseObject, int iGearType)
	;
	;===========
	;Parameters
	;===========
	;	akBaseObject: The base object the actor just equipped.
	;	iGearType: The type of gear the actor equipped, which is one of the following values:
	;		1: Body gear (Armor, clothing)
	;		2: Hands gear (Gauntlets, gloves)
	;		3: Head gear (Helmet, hat, hoods)
	;		4: Foot gear (Boots, shoes)
	;		5: Backpack
	;		6: Ammo
	;		7: Other (could be shield, cloak, etc)
	;
	;===========
	;Return Values
	;===========
	;	Returns True if the ModEvent was successfully created, False otherwise.
	;
	;===========
	;Examples
	;===========
	;	RegisterForModEvent("Campfire_CampfireOnGearEquipped", "CampfireOnGearEquipped")
	;
	;	Event CampfireOnGearEquipped(Form akBaseObject, int iGearType)
	;		if iGearType == 5
	;			debug.trace("A backpack recognized by Campfire was equipped!")
	;		endif
	;	EndEvent
	;
	;===========
	;Notes
	;===========
	;	* The intent of this event is to notify when a piece of visual worn gear
	;	  (armor, clothing, backpacks, ammo, etc) is equipped, instead of every equipped
	;	  object. Primarily, the emphasis is on gear that has a substantive gameplay purpose
	;	  (not purely cosmetic or utility equipment).
	;
	;	* This event can be raised multiple times for the same Base Object if that object
	;	  is a set of "compound" gear (i.e. having more than one matching keyword, such 
	;	  as ArmorBody AND ArmorGauntlets), allowing you to act on each part of an otherwise
	;	  "one piece" set of gear (example: Vagabond Armor (Immersive Armors), which has both
	;	  body armor and a cloak).
	;
	;	* Unlike OnObjectEquipped, this event filters results based on the equipped item's
	;	  slot mask. Gear that utilizes slots 61 - 53, 51 - 47, or 45 will not be returned.
	;	  Slot 52 is not checked for compatibility reasons. These slots are checked in 
	;	  order of greatest to smallest, so if a piece of gear uses slots 61 and 30, it will 
	;	  be filtered out and this event will not be raised when the object is equipped.
	;
	;	* This event is not raised when weapons are equipped.

	trace("[Campfire] Raising Event: CampfireOnGearEquipped(" + akBaseObject + ", " + iGearType + ")")

	int handle = ModEvent.Create("Campfire_CampfireOnGearEquipped")
	if handle
		ModEvent.PushForm(handle, akBaseObject)
		ModEvent.PushInt(handle, iGearType)
		ModEvent.Send(handle)
		return True
	else
		return False
	endif
endFunction

bool function RaiseEvent_CampfireOnGearUnequipped(Form akBaseObject, int iGearType) global
	;===========
	;Syntax
	;===========
	;	Event CampfireOnGearUnequipped(Form akBaseObject, int iGearType)
	;
	;===========
	;Parameters
	;===========
	;	akBaseObject: The base object the actor just unequipped.
	;	iGearType: The type of gear the actor unequipped, which is one of the following values:
	;		1: Body gear (Armor, clothing)
	;		2: Hands gear (Gauntlets, gloves)
	;		3: Head gear (Helmet, hat, hoods)
	;		4: Foot gear (Boots, shoes)
	;		5: Backpack
	;		6: Ammo
	;		7: Other (could be shield, cloak, etc)
	;
	;===========
	;Return Values
	;===========
	;	Returns True if the ModEvent was successfully created, False otherwise.
	;
	;===========
	;Examples
	;===========
	;	RegisterForModEvent("Campfire_CampfireOnGearUnequipped", "CampfireOnGearUnequipped")
	;
	;	Event CampfireOnGearUnequipped(Form akBaseObject, int iGearType)
	;		if iGearType == 4
	;			debug.trace("The player unequipped some boots!")
	;		endif
	;	EndEvent
	;
	;===========
	;Notes
	;===========
	;	* The intent of this event is to notify when a piece of visual worn gear
	;	  (armor, clothing, backpacks, ammo, etc) is unequipped, instead of every unequipped
	;	  object. Primarily, the emphasis is on gear that has a substantive gameplay purpose
	;	  (not purely cosmetic or utility equipment).
	;
	;	* This event can be raised multiple times for the same Base Object if that object
	;	  is a set of "compound" gear (i.e. having more than one matching keyword, such 
	;	  as ArmorBody AND ArmorGauntlets), allowing you to act on each part of an otherwise
	;	  "one piece" set of gear (example: Vagabond Armor (Immersive Armors), which has both
	;	  body armor and a cloak).
	;
	;	* Unlike OnObjectUnequipped, this event filters results based on the unequipped item's
	;	  slot mask. Gear that utilizes slots 61 - 53, 51 - 47, or 45 will not be returned.
	;	  Slot 52 is not checked for compatibility reasons. These slots are checked in 
	;	  order of greatest to smallest, so if a piece of gear uses slots 61 and 30, it will 
	;	  be filtered out and this event will not be raised when the object is unequipped.
	;
	;	* This event is not raised when weapons are unequipped.

	trace("[Campfire] Raising Event: CampfireOnGearUnequipped(" + akBaseObject + ", " + iGearType + ")")

	int handle = ModEvent.Create("Campfire_CampfireOnGearUnequipped")
	if handle
		ModEvent.PushForm(handle, akBaseObject)
		ModEvent.PushInt(handle, iGearType)
		ModEvent.Send(handle)
		return True
	else
		return False
	endif
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
bool function PlayerCanPlaceObjects(bool abShowMessage = true) global
;/*
* PARAMETERS
* * abShowMessage: Whether to show an informative message detailing why the player can't place a Placeable Object right now if returning false.
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

	;@TODO: Check being attacked
	if IsPlayerPlacingObject()
		if abShowMessage
			;_DE_Placement_InUse.Show()
			notification("[Debug]You are already trying to place something.")
		endif
		return false
	elseif Campfire.PlayerRef.IsSwimming()
		if abShowMessage
			;_DE_Placement_Swimming.Show()	;@TODO: Rename
			notification("[Debug]You can't use this while swimming.")
		endif
		return false
	elseif Campfire.PlayerRef.IsOnMount()
		if abShowMessage
			;@TODO: Provide error
			notification("[Debug]You can't use this while mounted.")
		endif
		return false
	elseif Campfire.PlayerRef.GetSleepState() != 0
		if abShowMessage
			;@TODO: Error
			notification("[Debug]You can't use this while lying down.")
		endif
		return false
	elseif Campfire.PlayerRef.GetSitState() != 0
		if abShowMessage
			;@TODO: Error
			notification("[Debug]You can't use this while using something else.")
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

function TryToEnableRef(ObjectReference akReference, bool bFadeIn = false) global
	;A more concise way to enable references without checking for None first (to avoid Papyrus log errors, etc)
	if akReference
		akReference.Enable(bFadeIn)
	endif
endFunction

function TryToDisableRef(ObjectReference akReference, bool bFadeOut = false) global
	;A more concise way to disable references without checking for None first (to avoid Papyrus log errors, etc)
	if akReference
		akReference.Disable(bFadeOut)
	endif
endFunction

function TryToDisableAndDeleteRef(ObjectReference akReference, bool bFadeOut = false) global
	;A more concise way to disable and delete references without checking for None first (to avoid Papyrus log errors, etc)
	if akReference
		akReference.Disable(bFadeOut)
		akReference.Delete()
	endif
endFunction

ObjectReference function PlaceAndWaitFor3DLoaded(ObjectReference akOrigin, Form FormToPlace, int Count = 1, bool ForcePersist = false, bool bDisableInteraction = false) global
	;A more concise way to place an object and wait until the object's 3D is loaded.
	;Prevents infinite loop if object never loads. 
	;Optionally set bDisableInteraction to True to make this object behave like a static (disable Havok physics) and disable activation.
	;@TODO: Profile this
	ObjectReference myObject = akOrigin.PlaceAtMe(FormToPlace, Count, ForcePersist, false)
	int iTryCount = 0
	while iTryCount < 200
		if !myObject.Is3DLoaded()
			iTryCount += 1
		else
			if bDisableInteraction
				myObject.SetMotionType(4)
				myObject.BlockActivation()
			endif
			return myObject
		endif
	endWhile
	return None
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

;@TODO: int function IsPlayerUnderShelter()

;@TODO: Finalize and document
int function GetCurrentTentType() global
	CampfireAPI Campfire = GetAPI()
	if Campfire == none
		RaiseCampAPIError()
		return 0
	endif

	int TentType = 0
	
	;0	=	None
	;1	=	Small Fur Tent
	;2  =   Large Fur Tent
	;3	=	Small Leather Tent
	;4	=	Large Leather Tent
	;5  =	Conjured Shelter

	ObjectReference myTent = Game.FindClosestReferenceOfAnyTypeInListFromRef(Campfire._Camp_TentActivators, Campfire.PlayerRef, 235.0)
	if myTent
		Form myTentBaseObject = myTent.GetBaseObject()
		if Campfire._Camp_FurTentsSmall.HasForm(myTentBaseObject)
			TentType = 1
		elseif Campfire._Camp_FurTentsLarge.HasForm(myTentBaseObject)
			TentType = 2
		elseif Campfire._Camp_LeatherTentsSmall.HasForm(myTentBaseObject)
			TentType = 3
		elseif Campfire._Camp_LeatherTentsLarge.HasForm(myTentBaseObject)
			TentType = 4
		elseif Campfire._Camp_ConjuredShelters.HasForm(myTentBaseObject)
			TentType = 5
		endif
	endif
	return TentType
endFunction

function ExitMenus() global
	Game.DisablePlayerControls()
	Game.EnablePlayerControls()
endFunction

function RaiseCampAPIError() global
	debug.trace("[Campfire] Fatal Campfire API error occurred.")
endFunction