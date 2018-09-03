scriptname _Camp_TentSystem extends Quest

import math
import utility
import _CampInternal
import CampUtil

; TO KEEP IN UTIL
_Camp_Compatibility property Compatibility auto
pDBEntranceQuestScript property DBEntranceQuestScript auto
_Camp_ConditionValues property ConditionVars auto
Quest property DBEntranceQuest auto
Actor property PlayerRef auto
Armor property _Camp_WalkingStickShield auto
GlobalVariable property GameDay auto
GlobalVariable property _Camp_LastSleptDay auto
GlobalVariable property _Camp_Setting_CampingArmorTakeOff auto
GlobalVariable property _Camp_Setting_TakeOff_Helm auto
GlobalVariable property _Camp_Setting_TakeOff_Cuirass auto
GlobalVariable property _Camp_Setting_TakeOff_Gauntlets auto
GlobalVariable property _Camp_Setting_TakeOff_Boots auto
GlobalVariable property _Camp_Setting_TakeOff_Backpack auto
GlobalVariable property _Camp_Setting_TakeOff_Weapons auto
GlobalVariable property _Camp_Setting_TakeOff_Shield auto
GlobalVariable property _Camp_Setting_TakeOff_Ammo auto
GlobalVariable property _Camp_Setting_CompatibilityEO auto
GlobalVariable property _Camp_TentSeeThru auto
GlobalVariable property _Camp_WasFirstPersonBeforeUse auto
Message property _Camp_TentMainMenu auto
Message property _Camp_TentSitMenu auto
Message property _Camp_TentSitMenuFrostfall auto
Message property _Camp_TentLayMenu auto
Message property _Camp_TentLayMenuFrostfall auto
Message property _Camp_TentSitMenuFrostfallHeat auto
Message property _Camp_TentLayMenuFrostfallHeat auto
Message property _Camp_TentPickUpError auto
Message property _Camp_Help_TentActivate auto
Message property _Camp_TalkMenu auto
Message property _Camp_PlacementIllegal auto
ObjectReference property _Camp_Anchor auto
ObjectReference property _Camp_Tent_InteractTriggerREF auto
Light property _Camp_LanternLight auto
Static property XMarker auto
Static property _Camp_Tent_LanternOnGround auto
Static property _Camp_Tent_LanternOffGround auto
Static property _Camp_Tent_LanternOnHang auto
Static property _Camp_Tent_LanternOffHang auto
Static property SilverCandleStick02 auto
Static property _Camp_SilverCandlestick02Off auto
Static property _Camp_Tent_BedrollHayNoGround01 auto
Static property _Camp_Tent_BedrollHayNoGround02 auto
Static property _Camp_Tent_BedrollHayNoGround03 auto
Static property _Camp_TentWard auto
Keyword property ClothingBody auto
Keyword property ArmorCuirass auto
Keyword property isCampfireTentNoShelter auto
ImageSpaceModifier property _Camp_FadeDown auto
ImageSpaceModifier property _Camp_FadeUp auto
ImageSpaceModifier property _Camp_Black auto
Sound property ITMGenericArmorUp auto
Weapon property _Camp_DummyWeapon auto
Form property BFXFireVol01 auto
VisualEffect property _Camp_ForceBlackVFX auto

; Followers
ReferenceAlias property Follower1 auto
ReferenceAlias property Follower2 auto
ReferenceAlias property Follower3 auto
ReferenceAlias property Spouse auto

; Camping Skill
GlobalVariable property CampingPerkPointsEarned auto
GlobalVariable property CampingPerkPointsTotal auto
GlobalVariable property CampingPerkPointProgress auto
GlobalVariable property CampingPerkPoints auto
Message property _Camp_PerkEarned auto
Message property _Camp_PerkAdvancement auto

bool slept_in_tent = false

; From OnUpdate on CampTent / CampTentEx
function UpdateTentUseState(ObjectReference akTent)
	CampTent TentObject = akTent as CampTent
	if was_hit
		;Player was hit, kick them out of the tent
		if !TentObject.TentAsset_LargeTentTriggerVolume
			; The large tent trigger volume is not provided, so treat as a small tent
			SetCurrentTent(None)
		endif
		EO_TurnOn()
		SendEvent_OnBedrollSitLay(akTent, true)

		if TentObject.myExitFront && TentObject.myExitFront.IsEnabled() && PlayerRef.GetDistance(TentObject.myExitFront) < 1000.0
			FadeAndMovePlayer(TentObject.myExitFront)
		else
			FadeAndMovePlayer(akTent, 115.0, 180.0)
		endif

		CleanUpTent(akTent)
		
		; Wait for the player to get up completely.
		int i = 0
		while PlayerRef.GetSitState() != 0 && i < 100
			Utility.Wait(0.1)
			i += 1
		endWhile
		Utility.Wait(0.1)

		; Set the previous camera state.
		if _Camp_WasFirstPersonBeforeUse.GetValueInt() == 2
			if !PlayerRef.GetAnimationVariableBool("IsFirstPerson")
				Game.ForceFirstPerson()
			endif
		endif

	elseif !(PlayerRef.GetSitState() == 2 || PlayerRef.GetSitState() == 3) && !TentObject.bGettingUp
		;Player getting up from sitting or lying down
		if !TentObject.TentAsset_LargeTentTriggerVolume
			; The tent trigger volume is not provided, so treat as a small tent
			SetCurrentTent(None)
		endif
		EO_TurnOn()
		SendEvent_OnBedrollSitLay(akTent, true)

		if GetCompatibilitySystem().isSkyrimVR
			if TentObject.myExitFront && TentObject.myExitFront.IsEnabled() && PlayerRef.GetDistance(TentObject.myExitFront) < 1000.0
				FadeAndMovePlayer(TentObject.myExitFront)
			else
				FadeAndMovePlayer(akTent, 115.0, 180.0)
			endif
		else
			if TentObject.myExitFront && TentObject.myExitFront.IsEnabled() && PlayerRef.GetDistance(TentObject.myExitFront) < 1000.0
				PlayerRef.SplineTranslateToRef(TentObject.myExitFront, 1.0, 65.0)
			endif
		endif
		CleanUpTent(akTent)

		; Wait for the player to get up completely.
		int i = 0
		while PlayerRef.GetSitState() != 0 && i < 100
			Utility.Wait(0.1)
			i += 1
		endWhile
		Utility.Wait(0.1)

		; Set the previous camera state.
		if _Camp_WasFirstPersonBeforeUse.GetValueInt() == 2
			Game.ForceFirstPerson()
		else
			Game.ForceThirdPerson()
		endif
	else
		TentObject.RegisterForSingleUpdate(1.0)
	endif
endFunction

;@From OnActivate on CampTent / CampTentEx
function ActivateTent(ObjectReference akActionRef, ObjectReference akTent)
	if akActionRef == PlayerRef
		was_hit = false
		CampTent TentObject = akTent as CampTent
		SetSelectedObjectConjured(akTent)
		SetTentConjured(akTent)
		SetTentPlayerFullBed(akTent)
		int iSitState = (akActionRef as Actor).GetSitState()
		if iSitState == 0
			ShowMainMenu(akTent)
		elseif iSitState == 3 && TentObject.myPlayerSitMarker.IsFurnitureInUse()
			ShowSitMenu(akTent)
		elseif iSitState == 3 && (TentObject.myPlayerLayDownMarker.IsFurnitureInUse() || TentObject.myPlayerWithSpouseLayDownMarker.IsFurnitureInUse())
			ShowLayMenu(akTent)
		endif
	endif
endFunction

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	CampDebug(1, "Player slept in tent.")
	slept_in_tent = true
EndEvent

function ActivateLayDownMarker(CampTent TentObject, bool abLayingDown = true)
	Actor f1 = Follower1.GetReference() as Actor
	Actor f2 = Follower2.GetReference() as Actor
	Actor f3 = Follower3.GetReference() as Actor
	Actor sp = Spouse.GetReference() as Actor
	if (sp) && (f1 == sp || f2 == sp || f3 == sp)
		; Husband/wife follower found
		if abLayingDown
			Game.ForceThirdPerson()
		endif
		(TentObject.myPlayerWithSpouseLayDownMarker as ObjectReference).Activate(PlayerRef)
	else
		; No husband/wife follower
		if abLayingDown
			Game.ForceThirdPerson()
		endif
		(TentObject.myPlayerLayDownMarker as ObjectReference).Activate(PlayerRef)
	endif
endFunction

function FadeAndMovePlayer(ObjectReference akDestinationRef, float afForwardDistance = -1.0, float afZAngleOffset = -1.0)
	_Camp_FadeDown.Apply()
	wait(0.5)
	_Camp_ForceBlackVFX.Play(PlayerRef)
	_Camp_FadeDown.PopTo(_Camp_Black)
	if afForwardDistance != -1.0
		float[] center_point = new float[2]
		center_point = GetOffsets(PlayerRef, afForwardDistance)
		PlayerRef.MoveTo(akDestinationRef, center_point[0], center_point[1])
		if afZAngleOffset != -1.0
			PlayerRef.SetAngle(PlayerRef.GetAngleX(), PlayerRef.GetAngleY(), PlayerRef.GetAngleZ() + afZAngleOffset)
		endif
	else
		PlayerRef.MoveTo(akDestinationRef)
	endif
	_Camp_ForceBlackVFX.Stop(PlayerRef)
	_Camp_Black.PopTo(_Camp_FadeUp)
endFunction

function CheckTentFeatures(CampTent TentObject)
	; Set lantern capability
    if TentObject.myLanternUnlit
    	ConditionVars.CurrentTentHasLantern = true
    else
    	ConditionVars.CurrentTentHasLantern = false
    endif
    ; Set toggle view capability
    if TentObject.myTent || TentObject.myNormalTent
    	ConditionVars.CurrentTentHasVisualShelter = true
    else
    	ConditionVars.CurrentTentHasVisualShelter = false
    endif
endFunction

function ShowMainMenu(ObjectReference akTent)
	CampTent TentObject = akTent as CampTent
	CheckTentFeatures(TentObject)
	int i = _Camp_TentMainMenu.Show()
	if i == 0 || i == 1								;Sit / Relax (VR)
		SetWasFirstPerson()
		if Compatibility.isSKSELoaded && !Compatibility.isSkyrimVR
			Message.ResetHelpMessage("Activate")
			_Camp_Help_TentActivate.ShowAsHelpMessage("Activate", 5, 30, 1)
		endif
		PlayerSit(akTent)
	elseif i == 2									;Lie Down
		SetWasFirstPerson()
		if Compatibility.isSKSELoaded
			Message.ResetHelpMessage("Activate")
			_Camp_Help_TentActivate.ShowAsHelpMessage("Activate", 5, 30, 1)
		endif
		PlayerLieDown(akTent)
	elseif i == 3	 								;Sleep
		PlayerSleep(TentObject)
	elseif i == 4									;Light
		ToggleLantern(akTent)
	elseif i == 5 || i == 6							;Pack or Dismiss
		PackTent(akTent)
	else
		;exit
	endif
endFunction

function ShowSitMenu(ObjectReference akTent)
	CampTent TentObject = akTent as CampTent
	CheckTentFeatures(TentObject)
	int i
	if Compatibility.IsFrostfallLoaded
		float exposurepct = FrostUtil.GetPlayerExposure() - 20.0
		if exposurepct < 0.0
			exposurepct = 0.0
		endif
		float limitpct = FrostUtil.GetPlayerExposureLimit() - 20.0
		if limitpct < 0.0
			limitpct = 0.0
		endif
		float wetnesspct = (FrostUtil.GetPlayerWetness() / 750.0) * 100.0
		if FrostUtil.GetPlayerHeatSourceLevel() >= 1 && FrostUtil.IsPlayerNearFire()
			i = _Camp_TentSitMenuFrostfallHeat.Show(exposurepct, limitpct, wetnesspct)
		else
			i = _Camp_TentSitMenuFrostfall.Show(exposurepct, limitpct, wetnesspct)
		endif
	else
		i = _Camp_TentSitMenu.Show()
	endif
	if i == 0										;Light
		ToggleLantern(akTent)
	elseif i == 1									;Talk To...
		ShowTalkMenu()
	elseif i == 2 									;Toggle View
		if TentObject.myTentExterior.IsDisabled()
			_Camp_TentSeeThru.SetValue(1)
			TryToEnableRef(TentObject.myTentExterior, true)
		else
			_Camp_TentSeeThru.SetValue(2)
			TryToDisableRef(TentObject.myTentExterior, true)
		endif

	elseif i == 3 									;Get Up
		if GetCompatibilitySystem().isSkyrimVR
			if TentObject.myExitFront && TentObject.myExitFront.IsEnabled() && PlayerRef.GetDistance(TentObject.myExitFront) < 1000.0
				FadeAndMovePlayer(TentObject.myExitFront)
			else
				FadeAndMovePlayer(akTent, 115.0, 180.0)
			endif
		else
			TentObject.myPlayerSitMarker.Activate(PlayerRef)
		endif
	elseif i == 4
		;do nothing
	endif
endFunction

function ShowLayMenu(ObjectReference akTent)
	CampTent TentObject = akTent as CampTent
	CheckTentFeatures(TentObject)
	int i
	if Compatibility.IsFrostfallLoaded
		float exposurepct = FrostUtil.GetPlayerExposure() - 20.0
		if exposurepct < 0.0
			exposurepct = 0.0
		endif
		float limitpct = FrostUtil.GetPlayerExposureLimit() - 20.0
		if limitpct < 0.0
			limitpct = 0.0
		endif
		float wetnesspct = (FrostUtil.GetPlayerWetness() / 750.0) * 100.0
		if FrostUtil.GetPlayerHeatSourceLevel() >= 1 && FrostUtil.IsPlayerNearFire()
			i = _Camp_TentLayMenuFrostfallHeat.Show(exposurepct, limitpct, wetnesspct)
		else
			i = _Camp_TentLayMenuFrostfall.Show(exposurepct, limitpct, wetnesspct)
		endif
	else
		i = _Camp_TentLayMenu.Show()
	endif
	if i == 0										;Sleep
		TentObject.bGettingUp = true
		_Camp_FadeDown.Apply()
		wait(1.0)
		_Camp_ForceBlackVFX.Play(PlayerRef)
		_Camp_FadeDown.PopTo(_Camp_Black)
		if PlayerRef
			PlayerRef.MoveTo(akTent)				;  //Get up
			wait(0.4)
			PlayerSleep(TentObject)
			wait(0.4)
			ActivateLayDownMarker(TentObject)
			wait(3.5)
			SelectExterior(akTent, true)
			_Camp_ForceBlackVFX.Stop(PlayerRef)
			_Camp_Black.PopTo(_Camp_FadeUp)
		else
			;Something went wrong, make sure that the player's vision is restored!
			_Camp_ForceBlackVFX.Stop(PlayerRef)
			_Camp_Black.PopTo(_Camp_FadeUp)
		endif
		TentObject.bGettingUp = false
	elseif i == 1									;Light
		ToggleLantern(akTent)
	elseif i == 2 									;Talk To...
		ShowTalkMenu()
	elseif i == 3 									;Toggle View
		if TentObject.myTentExterior.IsDisabled()
			_Camp_TentSeeThru.SetValue(1)
			TryToEnableRef(TentObject.myTentExterior, true)
		else
			_Camp_TentSeeThru.SetValue(2)
			TryToDisableRef(TentObject.myTentExterior, true)
		endif

	elseif i == 4									;Get Up
		ActivateLayDownMarker(TentObject, false)
		;StopFollowerUse(akTent)
	elseif i == 5									;Nothing
		;do nothing
	endif
endFunction

function ShowTalkMenu()
	int i = _Camp_TalkMenu.Show()
	Actor follower
	if i == 0			;Follower 1
		follower = GetTrackedFollower(1)
	elseif i == 1		;Follower 2
		follower = GetTrackedFollower(2)
	elseif i == 2		;Follower 3
		follower = GetTrackedFollower(3)
	elseif i == 3
		follower = GetTrackedAnimal()
	elseif i == 4		;No one
		return
	endif

	if follower
		follower.Activate(PlayerRef)
	endif
endFunction

function ToggleLantern(ObjectReference akTent)
	CampTent TentObject = akTent as CampTent
	if TentObject.bLanternLit
		TryToDisableRef(TentObject.myLanternLit)
		TryToDisableRef(TentObject.myLanternLit2)
		TryToDisableRef(TentObject.myLanternLit3)

		TryToEnableRef(TentObject.myLanternUnlit)
		TryToEnableRef(TentObject.myLanternUnlit2)
		TryToEnableRef(TentObject.myLanternUnlit3)
		
		TryToDisableRef(TentObject.myLanternLight)
		TryToDisableRef(TentObject.myLanternLight2)
		TryToDisableRef(TentObject.myLanternLight3)
		TentObject.bLanternLit = false
	else
		TryToEnableRef(TentObject.myLanternLit)
		TryToEnableRef(TentObject.myLanternLit2)
		TryToEnableRef(TentObject.myLanternLit3)

		TryToDisableRef(TentObject.myLanternUnlit)
		TryToDisableRef(TentObject.myLanternUnlit2)
		TryToDisableRef(TentObject.myLanternUnlit3)
		
		TryToEnableRef(TentObject.myLanternLight)
		TryToEnableRef(TentObject.myLanternLight2)
		TryToEnableRef(TentObject.myLanternLight3)
		TentObject.bLanternLit = true
	endif
endFunction

bool was_hit = false
function PlayerHitEvent(ObjectReference akAggressor, Form akSource, Projectile akProjectile)
    was_hit = true
endFunction

function PlayerSit(ObjectReference akTent)
	CampTent TentObject = akTent as CampTent
	if !TentObject.TentAsset_LargeTentTriggerVolume
		; The large tent trigger volume is not provided, so treat as a small tent
		SetCurrentTent(akTent)
	endif
	EO_TurnOff()
	SendEvent_OnBedrollSitLay(TentObject)

	ConditionVars.IsPlayerSittingInTent = true
	Game.ForceThirdPerson()
	TentObject.myPlayerSitMarker.Activate(PlayerRef)
	if _Camp_Setting_CampingArmorTakeOff.GetValueInt() == 2
		if Compatibility.IsFrostfallLoaded
			if FrostUtil.IsWarmEnoughToRemoveGearInTent()
				DisplayPlayerTentEquipment(akTent)
			else
				DisplayPlayerTentEquipment(akTent, true)
			endif
		else
			DisplayPlayerTentEquipment(akTent)
		endif
	endif
	; Setting must be on and there must be a separate exterior object
	if _Camp_TentSeeThru.GetValueInt() == 2 && (TentObject.myTent && TentObject.myNormalTent)
		if !Compatibility.isSkyrimVR
			TryToDisableRef(TentObject.myTentExterior, true)
		endif
	endif

	; Start the quest so that the aliases fill and follower packages run.
	self.Start()
	
	; Fall back to persistent trigger without SKSE
	if !Compatibility.isSKSELoaded
		_Camp_Tent_InteractTriggerREF.MoveTo(PlayerRef)
	endif
	
	TentObject.RegisterForSingleUpdate(1.0)
endFunction

function PlayerLieDown(ObjectReference akTent)
	CampTent TentObject = akTent as CampTent
	; Skyrim 1.9 has broken the player's eyes from re-opening if you lie down (sleepstate = 4).
	
	;Don't lie down in tent if on the Dark Brotherhood entrance quest
	if DBEntranceQuest.GetStage() == 20 && DBEntranceQuestScript.pSleepyTime == 1
		PlayerSleep(TentObject)
		return
	endif

	;Don't lie down in tent if DLC2 is loaded, the player is in Solstheim, and DLC2MQ03B isn't complete yet
	if Compatibility.isDLC2Loaded
		Quest DLC2MQ03B = Game.GetFormFromFile(0x02035440, "Dragonborn.esm") as Quest
		Location DLC2SolstheimLocation = Game.GetFormFromFile(0x02016E2A, "Dragonborn.esm") as Location
		Worldspace DLC2SolstheimWorld = Game.GetFormFromFile(0x02000800, "Dragonborn.esm") as Worldspace

		if DLC2MQ03B.IsCompleted() == false && PlayerRef.IsInLocation(DLC2SolstheimLocation)
			if PlayerRef.GetWorldspace() == DLC2SolstheimWorld
				PlayerSleep(TentObject)
				return
			endif
		endif
	endif

	if !TentObject.TentAsset_LargeTentTriggerVolume
		; The large tent trigger volume is not provided, so treat as a small tent
		SetCurrentTent(akTent)
	endif

	EO_TurnOff()
	SendEvent_OnBedrollSitLay(TentObject)

	ConditionVars.IsPlayerLayingInTent = true	
	ActivateLayDownMarker(TentObject)

	if _Camp_Setting_CampingArmorTakeOff.GetValueInt() == 2
		if Compatibility.IsFrostfallLoaded
			if FrostUtil.IsWarmEnoughToRemoveGearInTent()
				DisplayPlayerTentEquipment(akTent)
			else
				DisplayPlayerTentEquipment(akTent, true)
			endif
		else
			DisplayPlayerTentEquipment(akTent)
		endif
	endif
	; Setting must be on and there must be a separate exterior object
	if _Camp_TentSeeThru.GetValueInt() == 2 && (TentObject.myTent && TentObject.myNormalTent)
		if !Compatibility.isSkyrimVR
			TryToDisableRef(TentObject.myTentExterior, true)
		endif
	endif

	; Start the quest so that the aliases fill and follower packages run.
	self.Start()
	
	; Fall back to persistent trigger without SKSE
	if !Compatibility.isSKSELoaded
		_Camp_Tent_InteractTriggerREF.MoveTo(PlayerRef)
	endif
	
	TentObject.RegisterForSingleUpdate(1.0)
endFunction

function PlayerSleep(CampTent akTentObject)
	CampDebug(0, "Player selected sleeping.")
	self.RegisterForSleep()
	int game_day_of_sleep_start = GameDay.GetValueInt()
	akTentObject.myBedRoll.Activate(PlayerRef);  //Spawns sleep menu

	; Block until we exit menus.
	Utility.Wait(0.5)
	self.UnregisterForSleep()

	; Advance camping skill if necessary
	CampDebug(0, "slept_in_tent " + slept_in_tent + ", IsConjured " + akTentObject.Setting_IsConjured)
	if slept_in_tent && !akTentObject.Setting_IsConjured
		slept_in_tent = false
		if game_day_of_sleep_start > _Camp_LastSleptDay.GetValueInt()
			CampDebug(0, "Day is newer than last slept day, advancing Camping.")
			_Camp_LastSleptDay.SetValue(game_day_of_sleep_start)
			AdvanceCampingSkill()
		endif
	endif
endFunction

function DisplayPlayerTentEquipment(ObjectReference akTent, bool bLimited = false)
	CampTent TentObject = akTent as CampTent
	if bLimited == false
		if _Camp_Setting_TakeOff_Helm.GetValueInt() == 2
			DisplayHelm_Player(TentObject)
		endif
		if _Camp_Setting_TakeOff_Cuirass.GetValueInt() == 2
			DisplayCuirass_Player(TentObject)
		endif
		if _Camp_Setting_TakeOff_Gauntlets.GetValueInt() == 2
			DisplayGauntlets_Player(TentObject)
		endif
		if _Camp_Setting_TakeOff_Boots.GetValueInt() == 2
			DisplayBoots_Player(TentObject)
		endif
	endif
	if _Camp_Setting_TakeOff_Weapons.GetValueInt() == 2
		DisplayWeapons_Player(TentObject)
	endif
	if _Camp_Setting_TakeOff_Shield.GetValueInt() == 2
		DisplayShield_Player(TentObject)
	endif
	if _Camp_Setting_TakeOff_Ammo.GetValueInt() == 2
		DisplayQuiver_Player(TentObject)
	endif
	if _Camp_Setting_TakeOff_Backpack.GetValueInt() == 2
		DisplayBackpack_Player(TentObject)
	endif
endFunction

function SelectExterior(ObjectReference akTent, bool abInTent)
	if IsRefInInterior(PlayerRef)
		return
	endif

	CampDebug(0, "Player not in interior, checking exterior state.")
	Weather myWeather = Weather.GetCurrentWeather()
	bool SnowyWeather = myWeather.GetClassification() == 3

	CampTent TentObject = akTent as CampTent

	bool snow = false
	bool ash = false

	if SnowyWeather
		if Compatibility.isDLC2Loaded && myWeather == Compatibility.DLC2AshStorm
			ash = true
		else
			snow = true
		endif
	endif

	if snow
		if TentObject.mySnowTent
			TentObject.myTentExterior = TentObject.mySnowTent
		endif
	elseif ash
		if TentObject.myAshTent
			TentObject.myTentExterior = TentObject.myAshTent
		endif
	endif

	if !TentObject.myTentExterior
		if TentObject.myNormalTent
			TentObject.myTentExterior = TentObject.myNormalTent
		elseif TentObject.myTent
			TentObject.myTentExterior = TentObject.myTent
		endif
	endif

	if TentObject.myTentExterior != TentObject.myTent
		TryToEnableRef(TentObject.myTent, true)
	endif
	TryToEnableRef(TentObject.myShelterCollider)
	
	TryToDisableRef(TentObject.myNormalTent)
	TryToDisableRef(TentObject.mySnowTent)
	TryToDisableRef(TentObject.myAshTent)
	TryToEnableRef(TentObject.myTentExterior, true)
endFunction

function DisplayShield_Player(CampTent TentObject)
	TentObject.myShield = PlayerRef.GetEquippedShield()
	if TentObject.myShield == _Camp_WalkingStickShield
		TentObject.myShield = None
	endif

	if TentObject.myShield
		PlayerRef.UnequipItem(TentObject.myShield, abSilent = true)
		if IsRefInInterior(PlayerRef)
			TentObject.myDisplayShield = PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_ShieldInterior, TentObject.myShield, bDisableInteraction = true)
		else
			TentObject.myDisplayShield = PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_Shield, TentObject.myShield, bDisableInteraction = true)
		endif
	endif
endFunction

function UnDisplayShield_Player(CampTent TentObject)
	if TentObject.myShield
		PlayerRef.EquipItem(TentObject.myShield, abSilent = true)
	endif
	TryToDisableAndDeleteRef(TentObject.myDisplayShield)
endFunction

function DisplayWeapons_Player(CampTent TentObject)
	int iWeaponType = PlayerRef.GetEquippedItemType(1)
	if (iWeaponType <= 4 || iWeaponType == 8) && iWeaponType > 0
		;Player has a one-handed weapon
		TentObject.myMainWeapon = PlayerRef.GetEquippedWeapon()
		;Does the player have an off-hand weapon?
		int iOffWeaponType = PlayerRef.GetEquippedItemType(0)
		if (iOffWeaponType <= 4 || iOffWeaponType == 8) && iOffWeaponType > 0
			;Player has an off-hand weapon
			TentObject.myOffHandWeapon = PlayerRef.GetEquippedWeapon(true)
		endif
	elseif iWeaponType == 5 || iWeaponType == 6
		;Player has a two-handed weapon
		TentObject.myBigWeapon = PlayerRef.GetEquippedWeapon()
	elseif iWeaponType == 7
		TentObject.myBow = PlayerRef.GetEquippedWeapon()
	endif
	
	if TentObject.myMainWeapon
		PlayerRef.UnequipItem(TentObject.myMainWeapon, abSilent = true)
		TentObject.myDisplayMainWeapon =  PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_MainWeapon, TentObject.myMainWeapon, bDisableInteraction = true)
	endif
	
	if TentObject.myOffHandWeapon
		TentObject.myDisplayOffHandWeapon = PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_OffHandWeapon, TentObject.myOffHandWeapon, bDisableInteraction = true)
	endif
	
	if TentObject.myBigWeapon
		UnequipUsingDummyWeapon()
		TentObject.myDisplayBigWeapon = PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_BigWeapon, TentObject.myBigWeapon, bDisableInteraction = true)
	endif
	
	if TentObject.myBow
		UnequipUsingDummyWeapon()
		TentObject.myDisplayBow = PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_Bow, TentObject.myBow, bDisableInteraction = true)
	endif
endfunction

function UnDisplayWeapons_Player(CampTent TentObject)
	
	if TentObject.myMainWeapon
		PlayerRef.EquipItem(TentObject.myMainWeapon, abSilent = true)
		TentObject.myMainWeapon = none
	endif
	TryToDisableAndDeleteRef(TentObject.myDisplayMainWeapon)
	
	if TentObject.myOffHandWeapon
		TentObject.myOffHandWeapon = none
	endif
	TryToDisableAndDeleteRef(TentObject.myDisplayOffHandWeapon)

	if TentObject.myBigWeapon
		PlayerRef.EquipItem(TentObject.myBigWeapon, abSilent = true)
		TentObject.myBigWeapon = none
	endif
	TryToDisableAndDeleteRef(TentObject.myDisplayBigWeapon)
	
	if TentObject.myBow
		PlayerRef.EquipItem(TentObject.myBow, abSilent = true)
		TentObject.myBow = none
	endif
	TryToDisableAndDeleteRef(TentObject.myDisplayBow)
	
endFunction

function DisplayWeapon_Follower(CampTent TentObject)
	;TentObject.myFollowerAMarker
endFunction

function DisplayCuirass_Player(CampTent TentObject)
	TentObject.myCuirass = GetPlayerEquippedBody()
	if TentObject.myCuirass
		PlayerRef.UnequipItem(TentObject.myCuirass, abSilent = true)
		TentObject.myDisplayCuirass = PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_Cuirass, TentObject.myCuirass, bDisableInteraction = true)
	endif
endFunction

function UnDisplayCuirass_Player(CampTent TentObject)
	if TentObject.myCuirass
		PlayerRef.EquipItem(TentObject.myCuirass, abSilent = true)
	endif
	TryToDisableAndDeleteRef(TentObject.myDisplayCuirass)
endFunction

function DisplayBoots_Player(CampTent TentObject)
	TentObject.myBoots = GetPlayerEquippedFeet()
	if TentObject.myBoots && !TentObject.myBoots.HasKeyword(ClothingBody) && !TentObject.myBoots.HasKeyword(ArmorCuirass)
		PlayerRef.UnequipItem(TentObject.myBoots, abSilent = true)
		TentObject.myDisplayBoots = PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_Boots, TentObject.myBoots, bDisableInteraction = true)
	endif
endFunction

function UnDisplayBoots_Player(CampTent TentObject)
	if TentObject.myBoots
		PlayerRef.EquipItem(TentObject.myBoots, abSilent = true)
	endif
	TryToDisableAndDeleteRef(TentObject.myDisplayBoots)
endFunction

function DisplayGauntlets_Player(CampTent TentObject)
	TentObject.myGauntlets = GetPlayerEquippedHands()
	if TentObject.myGauntlets && !TentObject.myGauntlets.HasKeyword(ClothingBody) && !TentObject.myGauntlets.HasKeyword(ArmorCuirass)
		PlayerRef.UnequipItem(TentObject.myGauntlets, abSilent = true)
		TentObject.myDisplayGauntlets = PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_Gauntlets, TentObject.myGauntlets, bDisableInteraction = true)
	endif
endFunction

function UnDisplayGauntlets_Player(CampTent TentObject)
	if TentObject.myGauntlets
		PlayerRef.EquipItem(TentObject.myGauntlets, abSilent = true)
	endif
	TryToDisableAndDeleteRef(TentObject.myDisplayGauntlets)
endFunction

function DisplayHelm_Player(CampTent TentObject)
	TentObject.myHelm = GetPlayerEquippedHead()
	if TentObject.myHelm && !TentObject.myHelm.HasKeyword(ClothingBody) && !TentObject.myHelm.HasKeyword(ArmorCuirass)
		PlayerRef.UnequipItem(TentObject.myHelm, abSilent = true)
		TentObject.myDisplayHelm = PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_Helm, TentObject.myHelm, bDisableInteraction = true)
	endif
endfunction

function UnDisplayHelm_Player(CampTent TentObject)
	if TentObject.myHelm
		PlayerRef.EquipItem(TentObject.myHelm, abSilent = true)
	endif
	TryToDisableAndDeleteRef(TentObject.myDisplayHelm)
endFunction

function DisplayQuiver_Player(CampTent TentObject)
	;Just unequip the quiver
	TentObject.myQuiver = GetPlayerEquippedAmmo()
	if TentObject.myQuiver
		PlayerRef.UnequipItem(TentObject.myQuiver, abSilent = true)
	endif
endfunction

function UnDisplayQuiver_Player(CampTent TentObject)
	;Just re-equip the quiver
	if TentObject.myQuiver
		PlayerRef.EquipItem(TentObject.myQuiver, abSilent = true)
	endif
endFunction

function DisplayBackpack_Player(CampTent TentObject)
	TentObject.myBackpack = GetPlayerEquippedBackpack()
	if TentObject.myBackpack
		PlayerRef.UnequipItem(TentObject.myBackpack, abSilent = true)
		TentObject.myDisplayBackpack = PlaceAndWaitFor3DLoaded(TentObject.myPlayerMarker_Backpack, TentObject.myBackpack, bDisableInteraction = true)
	endif
endfunction

function UnDisplayBackpack_Player(CampTent TentObject)
	if TentObject.myBackpack
		PlayerRef.EquipItem(TentObject.myBackpack, abSilent = true)
	endif
	TryToDisableAndDeleteRef(TentObject.myDisplayBackpack)
endFunction

Weapon function GetFollowerMainWeapon(CampTent akTentObject, int aiFollowerBedrollIndex)
	if aiFollowerBedrollIndex == 1
		return akTentObject.myFollowerAMainWeapon
	elseif aiFollowerBedrollIndex == 2
		return akTentObject.myFollowerBMainWeapon
	elseif aiFollowerBedrollIndex == 3
		return akTentObject.myFollowerCMainWeapon
	endif
endFunction
Weapon function GetFollowerOffHandWeapon(CampTent akTentObject, int aiFollowerBedrollIndex)
	if aiFollowerBedrollIndex == 1
		return akTentObject.myFollowerAOffHandWeapon
	elseif aiFollowerBedrollIndex == 2
		return akTentObject.myFollowerBOffHandWeapon
	elseif aiFollowerBedrollIndex == 3
		return akTentObject.myFollowerCOffHandWeapon
	endif
endFunction
Weapon function GetFollowerBigWeapon(CampTent akTentObject, int aiFollowerBedrollIndex)
	if aiFollowerBedrollIndex == 1
		return akTentObject.myFollowerABigWeapon
	elseif aiFollowerBedrollIndex == 2
		return akTentObject.myFollowerBBigWeapon
	elseif aiFollowerBedrollIndex == 3
		return akTentObject.myFollowerCBigWeapon
	endif
endFunction
Weapon function GetFollowerBowWeapon(CampTent akTentObject, int aiFollowerBedrollIndex)
	if aiFollowerBedrollIndex == 1
		return akTentObject.myFollowerABow
	elseif aiFollowerBedrollIndex == 2
		return akTentObject.myFollowerBBow
	elseif aiFollowerBedrollIndex == 3
		return akTentObject.myFollowerCBow
	endif
endFunction
Armor function GetFollowerShield(CampTent akTentObject, int aiFollowerBedrollIndex)
	if aiFollowerBedrollIndex == 1
		return akTentObject.myFollowerAShield
	elseif aiFollowerBedrollIndex == 2
		return akTentObject.myFollowerBShield
	elseif aiFollowerBedrollIndex == 3
		return akTentObject.myFollowerCShield
	endif
endFunction
function SetFollowerMainWeapon(CampTent akTentObject, int aiFollowerBedrollIndex, Weapon akWeapon)
	if aiFollowerBedrollIndex == 1
		akTentObject.myFollowerAMainWeapon = akWeapon
	elseif aiFollowerBedrollIndex == 2
		akTentObject.myFollowerBMainWeapon = akWeapon
	elseif aiFollowerBedrollIndex == 3
		akTentObject.myFollowerCMainWeapon = akWeapon
	endif
endFunction
function SetFollowerOffHandWeapon(CampTent akTentObject, int aiFollowerBedrollIndex, Weapon akWeapon)
	if aiFollowerBedrollIndex == 1
		akTentObject.myFollowerAOffHandWeapon = akWeapon
	elseif aiFollowerBedrollIndex == 2
		akTentObject.myFollowerBOffHandWeapon = akWeapon
	elseif aiFollowerBedrollIndex == 3
		akTentObject.myFollowerCOffHandWeapon = akWeapon
	endif
endFunction
function SetFollowerBigWeapon(CampTent akTentObject, int aiFollowerBedrollIndex, Weapon akWeapon)
	if aiFollowerBedrollIndex == 1
		akTentObject.myFollowerABigWeapon = akWeapon
	elseif aiFollowerBedrollIndex == 2
		akTentObject.myFollowerBBigWeapon = akWeapon
	elseif aiFollowerBedrollIndex == 3
		akTentObject.myFollowerCBigWeapon = akWeapon
	endif
endFunction
function SetFollowerBowWeapon(CampTent akTentObject, int aiFollowerBedrollIndex, Weapon akWeapon)
	if aiFollowerBedrollIndex == 1
		akTentObject.myFollowerABow = akWeapon
	elseif aiFollowerBedrollIndex == 2
		akTentObject.myFollowerBBow = akWeapon
	elseif aiFollowerBedrollIndex == 3
		akTentObject.myFollowerCBow = akWeapon
	endif
endFunction
function SetFollowerShield(CampTent akTentObject, int aiFollowerBedrollIndex, Armor akShield)
	if aiFollowerBedrollIndex == 1
		akTentObject.myFollowerAShield = akShield
	elseif aiFollowerBedrollIndex == 2
		akTentObject.myFollowerBShield = akShield
	elseif aiFollowerBedrollIndex == 3
		akTentObject.myFollowerCShield = akShield
	endif
endFunction
function SetFollowerDisplayMainWeapon(CampTent akTentObject, int aiFollowerBedrollIndex)
	if aiFollowerBedrollIndex == 1
		if akTentObject.myFollowerAMainWeapon
			akTentObject.myDisplayFollowerAMainWeapon = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerAMarker_MainWeapon, akTentObject.myFollowerAMainWeapon, bDisableInteraction = true)
			Follower1.GetActorRef().UnequipItem(akTentObject.myFollowerAMainWeapon, abSilent = true)
		endif
	elseif aiFollowerBedrollIndex == 2
		if akTentObject.myFollowerBMainWeapon
			akTentObject.myDisplayFollowerBMainWeapon = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerBMarker_MainWeapon, akTentObject.myFollowerBMainWeapon, bDisableInteraction = true)
			Follower2.GetActorRef().UnequipItem(akTentObject.myFollowerBMainWeapon, abSilent = true)
		endif
	elseif aiFollowerBedrollIndex == 3
		if akTentObject.myFollowerCMainWeapon
			akTentObject.myDisplayFollowerCMainWeapon = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerCMarker_MainWeapon, akTentObject.myFollowerCMainWeapon, bDisableInteraction = true)
			Follower3.GetActorRef().UnequipItem(akTentObject.myFollowerCMainWeapon, abSilent = true)
		endif
	endif
endFunction
function SetFollowerDisplayOffHandWeapon(CampTent akTentObject, int aiFollowerBedrollIndex)
	if aiFollowerBedrollIndex == 1
		if akTentObject.myFollowerAOffHandWeapon
			akTentObject.myDisplayFollowerAOffHandWeapon = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerAMarker_OffHandWeapon, akTentObject.myFollowerAOffHandWeapon, bDisableInteraction = true)
			Follower1.GetActorRef().UnequipItem(akTentObject.myFollowerAOffHandWeapon, abSilent = true)
		endif
	elseif aiFollowerBedrollIndex == 2
		if akTentObject.myFollowerBOffHandWeapon
			akTentObject.myDisplayFollowerBOffHandWeapon = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerBMarker_OffHandWeapon, akTentObject.myFollowerBOffHandWeapon, bDisableInteraction = true)
			Follower2.GetActorRef().UnequipItem(akTentObject.myFollowerBOffHandWeapon, abSilent = true)
		endif
	elseif aiFollowerBedrollIndex == 3
		if akTentObject.myFollowerCOffHandWeapon
			akTentObject.myDisplayFollowerCOffHandWeapon = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerCMarker_OffHandWeapon, akTentObject.myFollowerCOffHandWeapon, bDisableInteraction = true)
			Follower3.GetActorRef().UnequipItem(akTentObject.myFollowerCOffHandWeapon, abSilent = true)
		endif
	endif
endFunction
function SetFollowerDisplayBigWeapon(CampTent akTentObject, int aiFollowerBedrollIndex)
	if aiFollowerBedrollIndex == 1
		if akTentObject.myFollowerABigWeapon
			akTentObject.myDisplayFollowerABigWeapon = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerAMarker_BigWeapon, akTentObject.myFollowerABigWeapon, bDisableInteraction = true)
			Follower1.GetActorRef().UnequipItem(akTentObject.myFollowerABigWeapon, abSilent = true)
		endif
	elseif aiFollowerBedrollIndex == 2
		if akTentObject.myFollowerBBigWeapon
			akTentObject.myDisplayFollowerBBigWeapon = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerBMarker_BigWeapon, akTentObject.myFollowerBBigWeapon, bDisableInteraction = true)
			Follower2.GetActorRef().UnequipItem(akTentObject.myFollowerBBigWeapon, abSilent = true)
		endif
	elseif aiFollowerBedrollIndex == 3
		if akTentObject.myFollowerCBigWeapon
			akTentObject.myDisplayFollowerCBigWeapon = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerCMarker_BigWeapon, akTentObject.myFollowerCBigWeapon, bDisableInteraction = true)
			Follower3.GetActorRef().UnequipItem(akTentObject.myFollowerCBigWeapon, abSilent = true)
		endif
	endif
endFunction
function SetFollowerDisplayBowWeapon(CampTent akTentObject, int aiFollowerBedrollIndex)
	if aiFollowerBedrollIndex == 1
		if akTentObject.myFollowerABow
			akTentObject.myDisplayFollowerABow = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerAMarker_Bow, akTentObject.myFollowerABow, bDisableInteraction = true)
			Follower1.GetActorRef().UnequipItem(akTentObject.myFollowerABow, abSilent = true)
		endif
	elseif aiFollowerBedrollIndex == 2
		if akTentObject.myFollowerBBow
			akTentObject.myDisplayFollowerBBow = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerBMarker_Bow, akTentObject.myFollowerBBow, bDisableInteraction = true)
			Follower2.GetActorRef().UnequipItem(akTentObject.myFollowerBBow, abSilent = true)
		endif
	elseif aiFollowerBedrollIndex == 3
		if akTentObject.myFollowerCBow
			akTentObject.myDisplayFollowerCBow = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerCMarker_Bow, akTentObject.myFollowerCBow, bDisableInteraction = true)
			Follower3.GetActorRef().UnequipItem(akTentObject.myFollowerCBow, abSilent = true)
		endif
	endif
endFunction
function SetFollowerDisplayShield(CampTent akTentObject, int aiFollowerBedrollIndex)
	if aiFollowerBedrollIndex == 1
		if akTentObject.myFollowerAShield
			akTentObject.myDisplayFollowerAShield = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerAMarker_Shield, akTentObject.myFollowerAShield, bDisableInteraction = true)
			Follower1.GetActorRef().UnequipItem(akTentObject.myFollowerAShield, abSilent = true)
		endif
	elseif aiFollowerBedrollIndex == 2
		if akTentObject.myFollowerBShield
			akTentObject.myDisplayFollowerBShield = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerBMarker_Shield, akTentObject.myFollowerBShield, bDisableInteraction = true)
			Follower2.GetActorRef().UnequipItem(akTentObject.myFollowerBShield, abSilent = true)
		endif
	elseif aiFollowerBedrollIndex == 3
		if akTentObject.myFollowerCShield
			akTentObject.myDisplayFollowerCShield = PlaceAndWaitFor3DLoaded(akTentObject.myFollowerCMarker_Shield, akTentObject.myFollowerCShield, bDisableInteraction = true)
			Follower3.GetActorRef().UnequipItem(akTentObject.myFollowerCShield, abSilent = true)
		endif
	endif
endFunction
function UnDisplayFollowerMainWeapon(CampTent akTentObject, int aiFollowerBedrollIndex, Actor akActor)
	if aiFollowerBedrollIndex == 1
		if akTentObject.myFollowerAMainWeapon
			akActor.EquipItem(akTentObject.myFollowerAMainWeapon, abSilent = true)
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerAMainWeapon)
		akTentObject.myFollowerAMainWeapon = None
	elseif aiFollowerBedrollIndex == 2
		if akTentObject.myFollowerBMainWeapon
			akActor.EquipItem(akTentObject.myFollowerBMainWeapon, abSilent = true)
			akTentObject.myFollowerBMainWeapon = None
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerBMainWeapon)
	elseif aiFollowerBedrollIndex == 3
		if akTentObject.myFollowerCMainWeapon
			akActor.EquipItem(akTentObject.myFollowerCMainWeapon, abSilent = true)
			akTentObject.myFollowerCMainWeapon = None
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerCMainWeapon)
	endif
endFunction
function UnDisplayFollowerOffHandWeapon(CampTent akTentObject, int aiFollowerBedrollIndex, Actor akActor)
	if aiFollowerBedrollIndex == 1
		if akTentObject.myFollowerAOffHandWeapon
			akActor.EquipItem(akTentObject.myFollowerAOffHandWeapon, abSilent = true)
			akTentObject.myFollowerAOffHandWeapon = None
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerAOffHandWeapon)	
	elseif aiFollowerBedrollIndex == 2
		if akTentObject.myFollowerBOffHandWeapon
			akActor.EquipItem(akTentObject.myFollowerBOffHandWeapon, abSilent = true)
			akTentObject.myFollowerBOffHandWeapon = None
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerBOffHandWeapon)
	elseif aiFollowerBedrollIndex == 3
		if akTentObject.myFollowerCOffHandWeapon
			akActor.EquipItem(akTentObject.myFollowerCOffHandWeapon, abSilent = true)
			akTentObject.myFollowerCOffHandWeapon = None
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerCOffHandWeapon)
	endif
endFunction
function UnDisplayFollowerBigWeapon(CampTent akTentObject, int aiFollowerBedrollIndex, Actor akActor)
	if aiFollowerBedrollIndex == 1
		if akTentObject.myFollowerABigWeapon
			akActor.EquipItem(akTentObject.myFollowerABigWeapon, abSilent = true)
			akTentObject.myFollowerABigWeapon = None
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerABigWeapon)	
	elseif aiFollowerBedrollIndex == 2
		if akTentObject.myFollowerBBigWeapon
			akActor.EquipItem(akTentObject.myFollowerBBigWeapon, abSilent = true)
			akTentObject.myFollowerBBigWeapon = None
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerBBigWeapon)
	elseif aiFollowerBedrollIndex == 3
		if akTentObject.myFollowerCBigWeapon
			akActor.EquipItem(akTentObject.myFollowerCBigWeapon, abSilent = true)
			akTentObject.myFollowerCBigWeapon = None
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerCBigWeapon)
	endif
endFunction
function UnDisplayFollowerBowWeapon(CampTent akTentObject, int aiFollowerBedrollIndex, Actor akActor)
	if aiFollowerBedrollIndex == 1
		if akTentObject.myFollowerABow
			akActor.EquipItem(akTentObject.myFollowerABow, abSilent = true)
			akTentObject.myFollowerABow = None
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerABow)	
	elseif aiFollowerBedrollIndex == 2
		if akTentObject.myFollowerBBow
			akActor.EquipItem(akTentObject.myFollowerBBow, abSilent = true)
			akTentObject.myFollowerBBow = None
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerBBow)
	elseif aiFollowerBedrollIndex == 3
		if akTentObject.myFollowerCBow
			akActor.EquipItem(akTentObject.myFollowerCBow, abSilent = true)
			akTentObject.myFollowerCBow = None
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerCBow)
	endif
endFunction
function UnDisplayFollowerShield(CampTent akTentObject, int aiFollowerBedrollIndex, Actor akActor)
	if aiFollowerBedrollIndex == 1
		if akTentObject.myFollowerAShield
			akActor.EquipItem(akTentObject.myFollowerAShield, abSilent = true)
			akTentObject.myFollowerAShield = None
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerAShield)	
	elseif aiFollowerBedrollIndex == 2
		if akTentObject.myFollowerBShield
			akActor.EquipItem(akTentObject.myFollowerBShield, abSilent = true)
			akTentObject.myFollowerBShield = None
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerBShield)
	elseif aiFollowerBedrollIndex == 3
		if akTentObject.myFollowerCShield
			akActor.EquipItem(akTentObject.myFollowerCShield, abSilent = true)
			akTentObject.myFollowerCShield = None
		endif
		TryToDisableAndDeleteRef(akTentObject.myDisplayFollowerCShield)
	endif
endFunction

function DestroyTent(ObjectReference akTent)
	CampTent TentObject = akTent as CampTent

	UnDisplayShield_Player(TentObject)
	UnDisplayWeapons_Player(TentObject)
	UnDisplayCuirass_Player(TentObject)
	UnDisplayBoots_Player(TentObject)
	UnDisplayGauntlets_Player(TentObject)
	UnDisplayHelm_Player(TentObject)
	UnDisplayQuiver_Player(TentObject)
	UnDisplayBackpack_Player(TentObject)	

	if TentObject.mySpareBedRoll1
		(TentObject.mySpareBedRoll1 as _Camp_CampTentNPCBedrollScript).CleanUp()
	endif
	if TentObject.mySpareBedRoll2
		(TentObject.mySpareBedRoll2 as _Camp_CampTentNPCBedrollScript).CleanUp()
	endif
	if TentObject.mySpareBedRoll3
		(TentObject.mySpareBedRoll3 as _Camp_CampTentNPCBedrollScript).CleanUp()
	endif
	
	;Delete markers and furniture
	TentObject.TakeDown()
	
	wait(0.2)

	;Finally, delete myself
	TryToDisableAndDeleteRef(akTent)
endFunction

function PackTent(ObjectReference akTent)
	CampTent TentObject = akTent as CampTent
	CampConjuredShelter ShelterObject = akTent as CampConjuredShelter
	
	bool is_conjured = false
	if TentObject.Setting_IsConjured
		is_conjured = true
	endif

	if !is_conjured
		PlayerRef.AddItem(TentObject.Required_InventoryItem, abSilent = true)
		ITMGenericArmorUp.Play(akTent)
	endif

	;Move activation trigger to the anchor
	_Camp_Tent_InteractTriggerREF.MoveTo(_Camp_Anchor)

	;Delete display models, if any
	UnDisplayShield_Player(TentObject)
	UnDisplayWeapons_Player(TentObject)
	UnDisplayCuirass_Player(TentObject)
	UnDisplayBoots_Player(TentObject)
	UnDisplayGauntlets_Player(TentObject)
	UnDisplayHelm_Player(TentObject)
	UnDisplayQuiver_Player(TentObject)
	UnDisplayBackpack_Player(TentObject)	

	if TentObject.mySpareBedRoll1
		(TentObject.mySpareBedRoll1 as _Camp_CampTentNPCBedrollScript).CleanUp()
	endif
	if TentObject.mySpareBedRoll2
		(TentObject.mySpareBedRoll2 as _Camp_CampTentNPCBedrollScript).CleanUp()
	endif
	if TentObject.mySpareBedRoll3
		(TentObject.mySpareBedRoll3 as _Camp_CampTentNPCBedrollScript).CleanUp()
	endif
	
	;Delete markers and furniture
	if is_conjured
		ShelterObject.TakeDown()
	else
		TentObject.TakeDown()
	endif
endFunction

function CleanUpTent(ObjectReference akTent)
	CampTent TentObject = akTent as CampTent
	
	;Move activation triggers to the anchor
	_Camp_Tent_InteractTriggerREF.MoveTo(_Camp_Anchor)

	;Stop follower functionality
	ConditionVars.IsPlayerSittingInTent = false
	ConditionVars.IsPlayerLayingInTent = false
	self.Stop()
	
	UnDisplayShield_Player(TentObject)
	UnDisplayWeapons_Player(TentObject)
	UnDisplayCuirass_Player(TentObject)
	UnDisplayBoots_Player(TentObject)
	UnDisplayGauntlets_Player(TentObject)
	UnDisplayHelm_Player(TentObject)
	UnDisplayQuiver_Player(TentObject)
	UnDisplayBackpack_Player(TentObject)

	if TentObject.mySpareBedRoll1
		(TentObject.mySpareBedRoll1 as _Camp_CampTentNPCBedrollScript).CleanUp()
	endif
	if TentObject.mySpareBedRoll2
		(TentObject.mySpareBedRoll2 as _Camp_CampTentNPCBedrollScript).CleanUp()
	endif
	if TentObject.mySpareBedRoll3
		(TentObject.mySpareBedRoll3 as _Camp_CampTentNPCBedrollScript).CleanUp()
	endif

	TryToEnableRef(TentObject.myTentExterior, true)
endFunction

function UnequipUsingDummyWeapon()
	PlayerRef.AddItem(_Camp_DummyWeapon, abSilent = true)
	PlayerRef.EquipItem(_Camp_DummyWeapon, abSilent = true)
	PlayerRef.UnEquipItem(_Camp_DummyWeapon, abSilent = true)
	PlayerRef.RemoveItem(_Camp_DummyWeapon, abSilent = true)
endFunction

function EO_TurnOff()
	if Compatibility.isEOLoaded && _Camp_Setting_CompatibilityEO.GetValueInt() == 2
		ddUnequipMCMScript EO_ConfigScript = Game.GetFormFromFile(0x00001827, "Equipping Overhaul.esp") as ddUnequipMCMScript
		ddUnequipHandlerScript EO_HandlerScript = (Game.GetFormFromFile(0x00000D62, "Equipping Overhaul.esp") as Quest).GetAlias(0) as ddUnequipHandlerScript
		int EO_Hotkey = EO_ConfigScript.keyGearedHotkey
		if EO_Hotkey != 0 && EO_ConfigScript.bTempGearedEnabled
			EO_HandlerScript.OnKeyDown(EO_Hotkey)
		endif
	endif
endFunction

function EO_TurnOn()
	if Compatibility.isEOLoaded && _Camp_Setting_CompatibilityEO.GetValueInt() == 2
		ddUnequipMCMScript EO_ConfigScript = Game.GetFormFromFile(0x00001827, "Equipping Overhaul.esp") as ddUnequipMCMScript
		ddUnequipHandlerScript EO_HandlerScript = (Game.GetFormFromFile(0x00000D62, "Equipping Overhaul.esp") as Quest).GetAlias(0) as ddUnequipHandlerScript
		int EO_Hotkey = EO_ConfigScript.keyGearedHotkey
		if EO_Hotkey != 0 && !EO_ConfigScript.bTempGearedEnabled
			EO_HandlerScript.OnKeyDown(EO_Hotkey)
		endif
	endif
endFunction

function SetWasFirstPerson()
	if PlayerRef.GetAnimationVariableBool("IsFirstPerson")
		_Camp_WasFirstPersonBeforeUse.SetValueInt(2)
	else
		_Camp_WasFirstPersonBeforeUse.SetValueInt(1)
	endif
endFunction

function AdvanceCampingSkill()
    if CampingPerkPointsEarned.GetValueInt() < CampingPerkPointsTotal.GetValueInt()
        CampDebug(1, "Advancing Camping skill.")
        int next_level = CampingPerkPointsEarned.GetValueInt() + 1

        ; 3, 5, 7, 9, 10, 11, 12, 13...
        float actions_required
        if next_level <= 4
            actions_required = (2 * next_level) + 1
        else
            actions_required = (9 + (next_level - 4))
        endif

        float progress_value = (1.0 / actions_required)
        CampingPerkPointProgress.SetValue(CampingPerkPointProgress.GetValue() + progress_value)
        CampDebug(1, "Camping perk progress value: " + CampingPerkPointProgress.GetValue())

        if (CampingPerkPointProgress.GetValue() + 0.01) >= 1.0
            CampDebug(1, "Granting a Camping perk point.")
            ; Grant perk point
            _Camp_PerkEarned.Show()
            CampingPerkPointsEarned.SetValueInt(CampingPerkPointsEarned.GetValueInt() + 1)
            CampingPerkPoints.SetValueInt(CampingPerkPoints.GetValueInt() + 1)

            if CampingPerkPointsEarned.GetValueInt() >= CampingPerkPointsTotal.GetValueInt()
                CampingPerkPointProgress.SetValue(1.0)
            else
                CampingPerkPointProgress.SetValue(0.0)
            endif
        else
            _Camp_PerkAdvancement.Show()
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