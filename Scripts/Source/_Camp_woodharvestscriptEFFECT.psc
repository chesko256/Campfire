scriptname _Camp_WoodHarvestScriptEFFECT extends ActiveMagicEffect

; #SUMMARY# =====================================================================================================================
; Name ...................: _DE_WoodHarvestScriptEFFECT
; Attached To (EditorID)..: 
; Description ............: Handles the wood harvesting system. Plays cutscene, gives player wood and other items, spawns containers.
; Author .................: Chesko
; Last Approved (version) : 2.6
; Status .................: Complete
; Remarks ................: 
; ===============================================================================================================================

import debug
import utility
import math

_Camp_Compatibility property Compatibility auto

Actor property pPlayer auto
weapon property Axe01 auto
message property _DE_WoodHarvest auto
message property _DE_WoodHarvestNoAxe auto
message property _DE_WoodHarvestError1 auto
message property _DE_WoodHarvestError2 auto
message property _DE_WoodHarvestError3 auto
message property _DE_WoodHarvestError4 auto
message property _DE_WoodHarvestSuccess auto
message property _DE_DeadWoodHarvestSuccess auto
message property _DE_WoodHarvest_Stone auto
message property _DE_DeadwoodHarvest auto
formlist property _Camp_Trees auto
formlist property _DE_DeadwoodList auto
formlist property _DE_Axes auto
furniture property _DE_WoodPilePlayer auto
MiscObject property Firewood01 auto
MiscObject property Deadwood01 auto
MiscObject property _DE_Rock auto
MiscObject property _DE_RockFrag auto
objectreference property _DE_XMarker_WoodHarvestEndRef2 auto			;I may not need this
objectreference property _Camp_Anchor auto
package property _DE_PlayerHarvestWoodPathing2 auto
int property myFirewoodCount auto
objectreference property myWoodFurnStartRef auto
objectreference property myWoodFurnEndRef auto
objectreference property myWoodContEndRef auto
objectreference property myDeadWoodContEndRef auto
ImageSpaceModifier Property _DE_FadeDown auto
ImageSpaceModifier Property _DE_FadeUp auto
ImageSpaceModifier Property _DE_Black auto
globalvariable property TimeScale auto
globalvariable property GameHour auto
globalvariable property _DE_Setting_WoodCinematic auto
;globalvariable property _DE_ExposurePoints auto
globalvariable property _DE_Setting_Tent auto
;globalvariable property _DE_CurrentTemp auto
globalvariable property _Camp_FollowerCount auto
container property _DE_FirewoodContainer auto
container property _DE_DeadwoodContainer auto
ReferenceAlias property _DE_WoodHarvestingAlias auto
Sound property NPCHumanWoodChop auto

;Axes
Weapon property _DE_StoneWarAxe auto
MiscObject property _DE_AxeBroken auto
;Weapon property _DE_Axe01_0 auto
Weapon property _DE_Axe01_1 auto
Weapon property _DE_Axe01_2 auto
Weapon property _DE_Axe01_3 auto
Weapon property _DE_Axe01_4 auto
Weapon property _DE_Axe01_5 auto
Weapon property _DE_Axe01_6 auto
Weapon property _DE_Axe01_7 auto
Weapon property _DE_Axe01_8 auto
Weapon property _DE_Axe01_9 auto
Weapon property _DE_Axe01_10 auto
Weapon property _DE_Axe01_11 auto
Weapon property _DE_Axe01_12 auto
Weapon property _DE_Axe01_13 auto
Weapon property _DE_Axe01_14 auto

float property pfThreadLastUpdateTime auto

Event OnEffectStart(Actor akTarget, Actor akCaster)	
	;if pPlayer.IsInInterior()
	;	_DE_WoodHarvestError1.Show()
	;	return
	;endif

	;@TODO: Wrap in IsFrostfallLoaded	
	;if _DE_ExposurePoints.GetValue() <= 20.0
	;	_DE_WoodHarvestError4.Show()
	;	return
	;endif
	;@TODO: Wrap in IsFrostfallLoaded
	
	if pPlayer.IsInCombat()
		_DE_WoodHarvestError2.Show()
		return
	endif

	if Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_Trees, pPlayer, 3000.0) != none
		if pPlayer.GetItemCount(_DE_Axes) > 0
			WoodHarvestMenu()
		else
			WoodHarvestMenuNoAxe()
		endif
	;TODO: Just get rid of this.
	elseif Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_DeadwoodList, pPlayer, 3000.0) != none
		DeadwoodHarvestMenu()
	else
		_DE_WoodHarvestError3.Show()
	endif
	
endEvent

function WoodHarvestMenu()	
	int ibutton = _DE_WoodHarvest.Show()
	if ibutton == 0
		;/if _DE_Setting_WoodCinematic.GetValueInt() == 2
			HarvestWood()
		else
			HarvestWoodNoPackage()
		endif/;
		HarvestWood2_6()
	elseif ibutton == 1
		;HarvestWoodNoPackageNoAxe()
		HarvestWoodNoAxe2_6()
	elseif ibutton == 2
		;exit
	endif
endfunction

function DeadwoodHarvestMenu()
	int ibutton = _DE_DeadwoodHarvest.Show()
	if ibutton == 0
		;HarvestWoodNoPackageNoAxe()
		HarvestWoodNoAxe2_6()
	elseif ibutton == 1
		;exit
	endif
endFunction

function WoodHarvestMenuNoAxe()
	int ibutton = _DE_WoodHarvestNoAxe.Show()
	if ibutton == 0
		;HarvestWoodNoPackageNoAxe()
		HarvestWoodNoAxe2_6()
	elseif ibutton == 1
		;exit
	endif
endFunction

function HarvestWood2_6()
	;fade to black
	_DE_FadeDown.Apply()
	Wait(1)
	_DE_FadeDown.PopTo(_DE_Black)
	AdvanceTime()

	Game.EnablePlayerControls()
	
	NPCHumanWoodChop.Play(pPlayer)
	wait(1)
	NPCHumanWoodChop.Play(pPlayer)
	wait(1)
	_DE_Black.PopTo(_DE_FadeUp)

	GiveFirewood2_6()

	if _DE_Setting_Tent.GetvalueInt() == 2
		DegradeAxe()
	endif
endFunction

function HarvestWoodNoAxe2_6()
	;fade to black
	_DE_FadeDown.Apply()
	Wait(1)
	_DE_FadeDown.PopTo(_DE_Black)
	AdvanceTime()

	Game.EnablePlayerControls()
	
	wait(2)
	_DE_Black.PopTo(_DE_FadeUp)

	GiveDeadwood2_6()
endFunction

function GiveFirewood2_6()
	int myHarvest = RandomInt(3, 7)
	
	if Compatibility.isSKYRELoaded
		if pPlayer.HasPerk(Compatibility.Forestry_Rank3)
			myHarvest += 3
		elseif pPlayer.HasPerk(Compatibility.Forestry_Rank2)
			myHarvest += 2
		elseif pPlayer.HasPerk(Compatibility.Forestry_Rank1)
			myHarvest += 1
		endif
	endif

	if _Camp_FollowerCount.GetValueInt() > 0
		myHarvest += 2
	endif
	
	_DE_WoodHarvestSuccess.Show(myHarvest)
	pPlayer.AddItem(Firewood01, myHarvest, true)
endFunction

function GiveDeadwood2_6()
	int myHarvest = RandomInt(2, 6)
	
	if Compatibility.isSKYRELoaded
		if pPlayer.HasPerk(Compatibility.Forestry_Rank3)
			myHarvest += RandomInt(1, 4)
		elseif pPlayer.HasPerk(Compatibility.Forestry_Rank2)
			myHarvest += RandomInt(1, 3)
		elseif pPlayer.HasPerk(Compatibility.Forestry_Rank1)
			myHarvest += RandomInt(1, 2)
		endif
	endif

	if _Camp_FollowerCount.GetValueInt() > 0
		myHarvest += RandomInt(2, 4)
	endif
	
	_DE_DeadWoodHarvestSuccess.Show(myHarvest)
	pPLayer.AddItem(Deadwood01, myHarvest, true)
	
	float myStone = RandomFloat()
	if _Camp_FollowerCount.GetValueInt() > 0
		myStone += 0.15
	endif
	if myStone >= 0.80
		_DE_WoodHarvest_Stone.Show()
		pPlayer.AddItem(_DE_Rock, 1, true)
	endif
endFunction

function HarvestWoodNoPackage()
	
	;A simpler wood harvesting system for those that might have trouble with the more complex version
	Game.DisablePlayerControls()

	RemoveFirewood()
	
	;fade to black
	_DE_FadeDown.Apply()
	Wait(1)
	_DE_FadeDown.PopTo(_DE_Black)
	
	AdvanceTime()
	
	float[] myOffset = new float[2]
	myOffset = GetOffsets(pPlayer, 100.0)
	
	myWoodContEndRef = Game.FindClosestReferenceOfTypeFromRef(_DE_FirewoodContainer, pPlayer, 2000.0)
	
	;Frostfall 2.6 - Deprecated
	;Put the wood pile container near the player, if not within 2000 units of the player already
	if myWoodContEndRef != None
		if !myWoodContEndRef.IsDisabled()
			MoveOldFirewoodPileNoCinematic(myOffset[0], myOffset[1])
		else
			MoveNewFirewoodPileNoCinematic(myOffset[0], myOffset[1])
		endif
	else
		MoveNewFirewoodPileNoCinematic(myOffset[0], myOffset[1])
	endif
	
	
	Game.EnablePlayerControls()
	
	NPCHumanWoodChop.Play(pPlayer)
	wait(1)
	NPCHumanWoodChop.Play(pPlayer)
	wait(1)
	_DE_Black.PopTo(_DE_FadeUp)
	
	ReturnFirewood()
	
	GiveFirewood()
	
	if _DE_Setting_Tent.GetvalueInt() == 2
		DegradeAxe()
	endif
	
endFunction

function HarvestWoodNoPackageNoAxe()
	Game.DisablePlayerControls()
		
	;fade to black
	_DE_FadeDown.Apply()
	Wait(1)
	_DE_FadeDown.PopTo(_DE_Black)
	
	AdvanceTime()
	
	float[] myOffset = new float[2]
	myOffset = GetOffsets(pPlayer, 100.0)
	
	myDeadWoodContEndRef = Game.FindClosestReferenceOfTypeFromRef(_DE_DeadwoodContainer, pPlayer, 2000.0)
	
	;Put the wood pile container near the player, if not within 2000 units of the player already
	if myDeadWoodContEndRef != None
		if !myDeadWoodContEndRef.IsDisabled()
			MoveOldDeadwoodPileNoCinematic(myOffset[0], myOffset[1])
		else
			MoveNewDeadwoodPileNoCinematic(myOffset[0], myOffset[1])
		endif
	else
		MoveNewDeadwoodPileNoCinematic(myOffset[0], myOffset[1])
	endif
	
	Game.EnablePlayerControls()
	
	wait(2)
	_DE_Black.PopTo(_DE_FadeUp)
	
	GiveDeadwood()
	
endFunction

function MoveNewFirewoodPileNoCinematic(float myXOffset, float myYOffset)
	;Create a new wood pile container and set up the player.
	_DE_XMarker_WoodHarvestEndRef2.MoveTo(pPlayer, myXOffset, myYOffset)
	_DE_XMarker_WoodHarvestEndRef2.SetAngle(0.0, 0.0, pPlayer.GetAngleZ())
	myWoodContEndRef = _DE_XMarker_WoodHarvestEndRef2.PlaceAtMe(_DE_FirewoodContainer)
	myWoodContEndRef.SetAngle(0.0, 0.0, pPlayer.GetAngleZ() + 180)
	
	;Move the player X units away from current heading.
	;pPlayer.MoveTo(pPlayer, myXOffset, myYOffset, 0.0)
endfunction

function MoveNewDeadwoodPileNoCinematic(float myXOffset, float myYOffset)
	;Create a new deadwood pile container and set up the player.
	_DE_XMarker_WoodHarvestEndRef2.MoveTo(pPlayer, myXOffset, myYOffset, 10.0)
	_DE_XMarker_WoodHarvestEndRef2.SetAngle(0.0, 0.0, pPlayer.GetAngleZ())
	myDeadWoodContEndRef = _DE_XMarker_WoodHarvestEndRef2.PlaceAtMe(_DE_DeadwoodContainer)
	myDeadWoodContEndRef.SetAngle(0.0, 0.0, pPlayer.GetAngleZ() + 180)
	
	;Move the player X units away from current heading.
	;pPlayer.MoveTo(pPlayer, myXOffset, myYOffset, 0.0)
endfunction

function MoveOldFirewoodPileNoCinematic(float myXOffset, float myYOffset)
	;There is already a wood pile container located nearby, move the player there and use it instead.
	pPlayer.MoveTo(myWoodContEndRef)
	pPlayer.SetAngle(0.0, 0.0, myWoodContEndRef.GetAngleZ() + 180.0)
	
	;Move the player 100 units away from current heading.
	pPlayer.MoveTo(pPlayer, myXOffset, myYOffset, 0.0)
endFunction

function MoveOldDeadwoodPileNoCinematic(float myXOffset, float myYOffset)
	;There is already a deadwood pile container located nearby, move the player there and use it instead.
	pPlayer.MoveTo(myDeadWoodContEndRef)
	pPlayer.SetAngle(0.0, 0.0, myDeadWoodContEndRef.GetAngleZ() + 180.0)
	
	;Move the player 100 units away from current heading.
	pPlayer.MoveTo(pPlayer, myXOffset, myYOffset, 0.0)
endFunction

event OnUpdate()
	;The package may not have ended; teleport the player back to where he started and use the furniture, if things take too long
	
	float fThreadTimeDelta = GetCurrentGameTime() - pfThreadLastUpdateTime			;(difference in game-time days)
	float fThreadTimeDeltaSec = (fThreadTimeDelta * 86400)/TimeScale.GetValueInt()		;(difference in real seconds)
	float fWaitTime = (6.0 - fThreadTimeDeltaSec)
	
	if fThreadTimeDeltaSec < 6.0
		RegisterForSingleUpdate(fWaitTime)
		;notification("[Frostfall]Waiting for another " + fWaitTime + " secs...delta " + fThreadTimeDelta)
		;notification("[Frostfall] Current Time: " + GetCurrentGameTime() + ", Last Update: " + pfThreadLastUpdateTime)
	else
		if pPlayer.GetCurrentPackage() == _DE_PlayerHarvestWoodPathing2
			;notification("[Frostfall]Package got stuck, resolving...")
			HarvestWoodEnd()
		else
			;notification("[Frostfall]Package resolved successfully.")
		endif
	endif
	
endEvent
	
event OnPackageEnd(Package akOldPackage)
	if akOldPackage == _DE_PlayerHarvestWoodPathing2
		;notification("I just finished the package")
		;trace("[FROSTFALL] Calling HarvestWoodEnd() from OnPackageEnd()")
		HarvestWoodEnd()
		
	endif
endEvent

event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if asEventName == "AddToInventory"
		;messagebox(akSource)
		;notification("[Frostfall]I finished picking up lumber")
		if Game.FindClosestReferenceOfTypeFromRef(_DE_WoodPilePlayer, pPlayer, 50.0) != none
			HarvestWoodWalking()
		endif
	elseif asEventName == "RemoveFromInventory"
		if Game.FindClosestReferenceOfTypeFromRef(_DE_WoodPilePlayer, pPlayer, 50.0) != none
		;messagebox(akSource)
		;notification("I finished unloading lumber")
			if myWoodFurnEndRef
				myWoodFurnEndRef.Disable()
				myWoodFurnEndRef.Delete()
			endif
		
			;Empty property values (may help with object deletion)
			myWoodContEndRef = none
			myWoodFurnStartRef = none
			myWoodFurnEndRef = none
		
			_DE_WoodHarvestingAlias.Clear()
			;messagebox("Alias is " + _DE_WoodHarvestingAlias)
			UnregisterForAllEvents()
			
			ReturnFirewood()
			
		endif
	endif
endEvent

function HarvestWood()
	
	RegisterForAnimationEvent(pPlayer, "AddToInventory")
	RegisterForAnimationEvent(pPlayer, "RemoveFromInventory")
	
	Game.DisablePlayerControls()

	RemoveFirewood()
	
	;fade to black
	_DE_FadeDown.Apply()
	Wait(1)
	_DE_FadeDown.PopTo(_DE_Black)
	
	Game.ForceThirdPerson()

	AdvanceTime()
	
	float[] myOffset = new float[2]
	float[] myFurnOffset = new float[2]
	
	myOffset = GetOffsets(pPlayer, -300.0)
	myFurnOffset = GetOffsets(pPlayer, -75.0)
	
	myWoodContEndRef = Game.FindClosestReferenceOfTypeFromRef(_DE_FirewoodContainer, pPlayer, 2000.0)
	
	;Put the wood pile container near the player, if not within 2000 units of the player already
	if myWoodContEndRef != None
		if !myWoodContEndRef.IsDisabled()
			MoveOldFirewoodPile(myOffset[0], myOffset[1], myFurnOffset[0], myFurnOffset[1])
		else
			MoveNewFirewoodPile(myOffset[0], myOffset[1], myFurnOffset[0], myFurnOffset[1])
		endif
	else
		MoveNewFirewoodPile(myOffset[0], myOffset[1], myFurnOffset[0], myFurnOffset[1])
	endif
	
	GiveFirewood()
	
	if _DE_Setting_Tent.GetvalueInt() == 2
		DegradeAxe()
	endif

	;Now that the wood piles have been set up, evaluate AI
	;use furniture, wait until finished, and walk to wood pile
	
	;notification("Picking up wood")
	
	bool bActivated = myWoodFurnStartRef.Activate(pPlayer)					;Make sure there was no problem activating the furniture
	
	NPCHumanWoodChop.Play(pPlayer)
	
	if !(bActivated)
		;notification("I couldn't activate the pickup, resolving function...")
		_DE_Black.PopTo(_DE_FadeUp)
		;trace("[FROSTFALL] Calling HarvestWoodEnd() from HarvestWood() (1)")
		HarvestWoodEnd()
	endif
	
	wait(1)
	if bActivated == false			;Prevents hilarious problem of player moving automatically into river and being carried downstream without ever activating the furniture
		_DE_Black.PopTo(_DE_FadeUp)
		;trace("[FROSTFALL] Calling HarvestWoodEnd() from HarvestWood() (2)")
		HarvestWoodEnd()
	endif
	
endFunction

function MoveNewFirewoodPile(float myXOffset, float myYOffset, float myFurnXOffset, float myFurnYOffset)
	;Create a new wood pile container and set up the player.
	_DE_XMarker_WoodHarvestEndRef2.MoveTo(pPlayer)
	_DE_XMarker_WoodHarvestEndRef2.SetAngle(0.0, 0.0, pPlayer.GetAngleZ())
	myWoodContEndRef = _DE_XMarker_WoodHarvestEndRef2.PlaceAtMe(_DE_FirewoodContainer)
	myWoodContEndRef.SetAngle(0.0, 0.0, pPlayer.GetAngleZ() + 180)
	
	;Move the marker back and then place the furniture object
	_DE_XMarker_WoodHarvestEndRef2.MoveTo(pPlayer, myFurnXOffSet, myFurnYOffset, 0.0)
	myWoodFurnEndRef = _DE_XMarker_WoodHarvestEndRef2.PlaceAtMe(_DE_WoodPilePlayer)
	myWoodFurnEndRef.SetScale(0.01)
	
	;Move the player X units away from current heading.
	pPlayer.MoveTo(pPlayer, myXOffset, myYOffset, 0.0)
	;move this near the player
	myWoodFurnStartRef = pPlayer.PlaceAtMe(_DE_WoodPilePlayer)
endFunction

function MoveOldFirewoodPile(float myXOffset, float myYOffset, float myFurnXOffset, float myFurnYOffset)
	;There is already a wood pile container located nearby, move the player there and use it instead.
	pPlayer.MoveTo(myWoodContEndRef)
	pPlayer.SetAngle(0.0, 0.0, myWoodContEndRef.GetAngleZ() + 180.0)
		
	;Move the marker back and then place the furniture object
	_DE_XMarker_WoodHarvestEndRef2.MoveTo(pPlayer, myFurnXOffSet, myFurnYOffset, 0.0)
	myWoodFurnEndRef = _DE_XMarker_WoodHarvestEndRef2.PlaceAtMe(_DE_WoodPilePlayer)
	myWoodFurnEndRef.SetScale(0.01)
	
	;Move the player X units away from current heading.
	pPlayer.MoveTo(pPlayer, myXOffset, myYOffset, 0.0)
	;place this near the player
	myWoodFurnStartRef = pPlayer.PlaceAtMe(_DE_WoodPilePlayer)
endFunction

function HarvestWoodWalking()
	;notification("Walking")
	_DE_WoodHarvestingAlias.ForceRefIfEmpty(pPlayer)
	Game.SetPlayerAIDriven(true)	
	pPlayer.EvaluatePackage()					;Player has wood, and walks to _DE_XMarker_WoodHarvestEndRef2, which is on top of myWoodFurnEndRef
	
	;Record the time the player starts walking
	pfThreadLastUpdateTime = GetCurrentGameTime()
	
	NPCHumanWoodChop.Play(pPlayer)
	
	;Delete the wood pickup furniture
	;myWoodFurnStartRef.MoveTo(myWoodFurnStartRef, 0.0, 0.0, 500.0)
	Wait(0.5)
	if myWoodFurnStartRef
		myWoodFurnStartRef.Disable()
		myWoodFurnStartRef.Delete()
	endif
	Wait(0.5)
	
	;fade up (during walk animation)
	_DE_Black.PopTo(_DE_FadeUp)
	
	Wait(5)
	if pPlayer.GetCurrentPackage() == _DE_PlayerHarvestWoodPathing2
		;notification("[Frostfall]Package got stuck, resolving...")
		;trace("[FROSTFALL] Calling HarvestWoodEnd() from HarvestWoodWalking()")
		HarvestWoodEnd()
	else
		;notification("[Frostfall]Package resolved successfully.")
	endif
	
endFunction

function HarvestWoodEnd()
	
	Game.SetPlayerAIDriven(false)
	
	if myWoodFurnEndRef
		myWoodFurnEndRef.Activate(pPlayer)
	endif
	_DE_XMarker_WoodHarvestEndRef2.MoveTo(_Camp_Anchor)
	Game.EnablePlayerControls()
	
endFunction

function GiveDeadwood()
	int myHarvest = RandomInt(2, 6)
	
	if Compatibility.isSKYRELoaded
		if pPlayer.HasPerk(Compatibility.Forestry_Rank3)
			myHarvest += RandomInt(1, 4)
		elseif pPlayer.HasPerk(Compatibility.Forestry_Rank2)
			myHarvest += RandomInt(1, 3)
		elseif pPlayer.HasPerk(Compatibility.Forestry_Rank1)
			myHarvest += RandomInt(1, 2)
		endif
	endif

	if _Camp_FollowerCount.GetValueInt() > 0
		myHarvest += RandomInt(2, 4)
	endif
	
	_DE_DeadWoodHarvestSuccess.Show(myHarvest)
	myDeadWoodContEndRef.AddItem(Deadwood01, myHarvest)
	
	float myStone = RandomFloat()
	if _Camp_FollowerCount.GetValueInt() > 0
		myStone += 0.15
	endif
	if myStone >= 0.80
		_DE_WoodHarvest_Stone.Show()
		pPlayer.AddItem(_DE_Rock, 1, abSilent = true)
	endif
endFunction

function GiveFirewood()
	int myHarvest = RandomInt(3, 7)
	
	if Compatibility.isSKYRELoaded
		if pPlayer.HasPerk(Compatibility.Forestry_Rank3)
			myHarvest += 3
		elseif pPlayer.HasPerk(Compatibility.Forestry_Rank2)
			myHarvest += 2
		elseif pPlayer.HasPerk(Compatibility.Forestry_Rank1)
			myHarvest += 1
		endif
	endif

	if _Camp_FollowerCount.GetValueInt() > 0
		myHarvest += 2
	endif
	
	_DE_WoodHarvestSuccess.Show(myHarvest)
	myWoodContEndRef.AddItem(Firewood01, myHarvest)
endFunction

function RemoveFirewood()
	myFirewoodCount = pPlayer.GetItemCount(Firewood01)
	if myFirewoodCount > 0
		pPlayer.RemoveItem(Firewood01, myFirewoodCount, true)		;silently
	endif
endFunction

function AdvanceTime()
	;Advance time by 1 hour
	if GameHour.GetValue() <= 22.9
		GameHour.SetValue(GameHour.GetValue() + 1.0)
	else
		GameHour.SetValue(0.0)
	endif
	
	;@TODO: Wrap in IsFrostfallLoaded
	;/
	float myTemp = _DE_CurrentTemp.GetValue()
	
	if myTemp <= -15
		_DE_ExposurePoints.Mod(-20.0)
	elseif myTemp <= -10
		_DE_ExposurePoints.Mod(-15.0)
	elseif myTemp <= -5
		_DE_ExposurePoints.Mod(-10.0)
	elseif myTemp <= 0
		_DE_ExposurePoints.Mod(-5.0)
	endif
	
	if _DE_ExposurePoints.GetValue() < 20.0
		_DE_ExposurePoints.SetValue(20.0)
	endif
	/;
	;@TODO: Wrap in IsFrostfallLoaded
	
endFunction

function ReturnFirewood()
	;Give the player back his firewood
	if myFirewoodCount > 0
		pPlayer.AddItem(Firewood01, myFirewoodCount, true)
	endif
endFunction

function DegradeAxe()
	if pPlayer.GetItemCount(Axe01) >= 1
		pPlayer.RemoveItem(Axe01, abSilent = true)
		pPlayer.AddItem(_DE_Axe01_14, abSilent = true)
	elseif pPlayer.GetItemCount(_DE_Axe01_14) >= 1
		pPlayer.RemoveItem(_DE_Axe01_14, abSilent = true)
		pPlayer.AddItem(_DE_Axe01_13, abSilent = true)
	elseif pPlayer.GetItemCount(_DE_Axe01_13) >= 1
		pPlayer.RemoveItem(_DE_Axe01_13, abSilent = true)
		pPlayer.AddItem(_DE_Axe01_12, abSilent = true)
	elseif pPlayer.GetItemCount(_DE_Axe01_12) >= 1
		pPlayer.RemoveItem(_DE_Axe01_12, abSilent = true)
		pPlayer.AddItem(_DE_Axe01_11, abSilent = true)
	elseif pPlayer.GetItemCount(_DE_Axe01_11) >= 1
		pPlayer.RemoveItem(_DE_Axe01_11, abSilent = true)
		pPlayer.AddItem(_DE_Axe01_10, abSilent = true)
	elseif pPlayer.GetItemCount(_DE_Axe01_10) >= 1
		pPlayer.RemoveItem(_DE_Axe01_10, abSilent = true)
		pPlayer.AddItem(_DE_Axe01_9, abSilent = true)
	elseif pPlayer.GetItemCount(_DE_Axe01_9) >= 1
		pPlayer.RemoveItem(_DE_Axe01_9, abSilent = true)
		pPlayer.AddItem(_DE_Axe01_8, abSilent = true)
	elseif pPlayer.GetItemCount(_DE_Axe01_8) >= 1
		pPlayer.RemoveItem(_DE_Axe01_8, abSilent = true)
		pPlayer.AddItem(_DE_Axe01_7, abSilent = true)
	elseif pPlayer.GetItemCount(_DE_Axe01_7) >= 1
		pPlayer.RemoveItem(_DE_Axe01_7, abSilent = true)
		pPlayer.AddItem(_DE_Axe01_6, abSilent = true)
	elseif pPlayer.GetItemCount(_DE_Axe01_6) >= 1
		pPlayer.RemoveItem(_DE_Axe01_6, abSilent = true)
		pPlayer.AddItem(_DE_Axe01_5, abSilent = true)
	elseif pPlayer.GetItemCount(_DE_Axe01_5) >= 1
		pPlayer.RemoveItem(_DE_Axe01_5, abSilent = true)
		pPlayer.AddItem(_DE_Axe01_4, abSilent = true)
	elseif pPlayer.GetItemCount(_DE_Axe01_4) >= 1
		pPlayer.RemoveItem(_DE_Axe01_4, abSilent = true)
		pPlayer.AddItem(_DE_Axe01_3, abSilent = true)
	elseif pPlayer.GetItemCount(_DE_Axe01_3) >= 1
		pPlayer.RemoveItem(_DE_Axe01_3, abSilent = true)
		pPlayer.AddItem(_DE_Axe01_2, abSilent = true)
	elseif pPlayer.GetItemCount(_DE_Axe01_2) >= 1
		pPlayer.RemoveItem(_DE_Axe01_2, abSilent = true)
		pPlayer.AddItem(_DE_Axe01_1, abSilent = true)
	elseif pPlayer.GetItemCount(_DE_Axe01_1) >= 1
		pPlayer.RemoveItem(_DE_Axe01_1, abSilent = true)
		pPlayer.AddItem(_DE_AxeBroken)
	elseif pPlayer.GetItemCount(_DE_StoneWarAxe) >= 1
		pPlayer.RemoveItem(_DE_StoneWarAxe, 1, true)
		pPlayer.AddItem(_DE_RockFrag, 3)
	elseif Compatibility.isKNAPLoaded
		if pPlayer.GetItemCount(Compatibility._DE_TravelAxe) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxe01_14, abSilent = true)
		elseif pPlayer.GetItemCount(Compatibility._DE_TravelAxe01_14) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe01_14, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxe01_13, abSilent = true)
		elseif pPlayer.GetItemCount(Compatibility._DE_TravelAxe01_13) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe01_13, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxe01_12, abSilent = true)
		elseif pPlayer.GetItemCount(Compatibility._DE_TravelAxe01_12) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe01_12, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxe01_11, abSilent = true)
		elseif pPlayer.GetItemCount(Compatibility._DE_TravelAxe01_11) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe01_11, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxe01_10, abSilent = true)
		elseif pPlayer.GetItemCount(Compatibility._DE_TravelAxe01_10) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe01_10, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxe01_9, abSilent = true)
		elseif pPlayer.GetItemCount(Compatibility._DE_TravelAxe01_9) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe01_9, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxe01_8, abSilent = true)
		elseif pPlayer.GetItemCount(Compatibility._DE_TravelAxe01_8) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe01_8, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxe01_7, abSilent = true)
		elseif pPlayer.GetItemCount(Compatibility._DE_TravelAxe01_7) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe01_7, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxe01_6, abSilent = true)
		elseif pPlayer.GetItemCount(Compatibility._DE_TravelAxe01_6) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe01_6, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxe01_5, abSilent = true)
		elseif pPlayer.GetItemCount(Compatibility._DE_TravelAxe01_5) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe01_5, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxe01_4, abSilent = true)
		elseif pPlayer.GetItemCount(Compatibility._DE_TravelAxe01_4) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe01_4, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxe01_3, abSilent = true)
		elseif pPlayer.GetItemCount(Compatibility._DE_TravelAxe01_3) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe01_3, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxe01_2, abSilent = true)
		elseif pPlayer.GetItemCount(Compatibility._DE_TravelAxe01_2) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe01_2, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxe01_1, abSilent = true)
		elseif pPlayer.GetItemCount(Compatibility._DE_TravelAxe01_1) >= 1
			pPlayer.RemoveItem(Compatibility._DE_TravelAxe01_1, abSilent = true)
			pPlayer.AddItem(Compatibility._DE_TravelAxeBroken)
		endif
	endif
endFunction

float[] function GetOffsets(Actor akSource, Float afDistance = 100.0, float afOffset = 0.0)
	Float A = akSource.GetAngleZ() + afOffset
	Float YDist = Sin(A)
	Float XDist = Cos(A)

	XDist *= afDistance
	YDist *= afDistance

	Float[] Offsets = New Float[2]
	Offsets[0] = YDist
	Offsets[1] = XDist
	Return Offsets
EndFunction

function UnregisterForAllEvents()
	RegisterForAnimationEvent(pPlayer, "AddToInventory")
	RegisterForAnimationEvent(pPlayer, "RemoveFromInventory")
endFunction
