scriptname _Camp_TentSystem extends Quest

import math
import utility
import _CampInternal
import CampUtil

;Scripts
;@TODO: Resolve at startup
;_DE_EPMonitor_1_6 property Frostfall auto
;@TODO: Resolve at startup

; TO KEEP IN UTIL
_Camp_Compatibility property Compatibility auto
pDBEntranceQuestScript property DBEntranceQuestScript auto
_Camp_ConditionValues property ConditionVars auto
Quest property DBEntranceQuest auto
Actor property PlayerRef auto
Armor property _Camp_WalkingStickShield auto
GlobalVariable property _Camp_Setting_CampingArmorTakeOff auto
GlobalVariable property _Camp_Setting_TakeOff_Helm auto
GlobalVariable property _Camp_Setting_TakeOff_Cuirass auto
GlobalVariable property _Camp_Setting_TakeOff_Gauntlets auto
GlobalVariable property _Camp_Setting_TakeOff_Boots auto
GlobalVariable property _Camp_Setting_TakeOff_Backpack auto
GlobalVariable property _Camp_Setting_TakeOff_Weapons auto
GlobalVariable property _Camp_Setting_TakeOff_Shield auto
GlobalVariable property _Camp_Setting_TakeOff_Ammo auto
;GlobalVariable property _DE_CurrentTemp auto
;GlobalVariable property _DE_ExposurePoints auto
GlobalVariable property _Camp_TentSeeThru auto
Message property _Camp_TentMainMenu auto
Message property _Camp_TentSitMenu auto
Message property _Camp_TentLayMenu auto
Message property _Camp_TentPickUpError auto
Message property _Camp_Help_TentActivate auto
ObjectReference property _Camp_Anchor auto
ObjectReference property _Camp_Tent_InteractTriggerREF auto
Light property _Camp_LanternLight auto
Static property XMarker auto
Static property _Camp_Tent_LanternOnGround auto
Static property _Camp_Tent_LanternOffGround auto
Static property _Camp_Tent_LanternOnHang auto
Static property _Camp_Tent_LanternOffHang auto
Static property _Camp_Tent_BedrollHayNoGround01 auto
Static property _Camp_Tent_BedrollHayNoGround02 auto
Static property _Camp_Tent_BedrollHayNoGround03 auto
Static property _Camp_TentWard auto
Keyword property ClothingBody auto
Keyword property ArmorCuirass auto
ImageSpaceModifier property _Camp_FadeDown auto
ImageSpaceModifier property _Camp_FadeUp auto
ImageSpaceModifier property _Camp_Black auto
Sound property ITMGenericArmorUp auto
Weapon property _Camp_DummyWeapon auto
Form property BFXFireVol01 auto

ReferenceAlias property Follower1 auto
ReferenceAlias property Follower2 auto
ReferenceAlias property Follower3 auto

; From OnUpdate on CampTent / CampTentEx
function UpdateTentUseState(ObjectReference akTent)
	CampTent TentObject = akTent as CampTent
	if was_hit
		;Player was hit, kick them out of the tent
		_Camp_FadeDown.Apply()
		wait(0.5)
		_Camp_FadeDown.PopTo(_Camp_Black)
		if TentObject.myExitFront && TentObject.myExitFront.IsEnabled() && PlayerRef.GetDistance(TentObject.myExitFront) < 1000.0
			PlayerRef.MoveTo(TentObject.myExitFront)
		else
			;@TODO: Test this
			PlayerRef.MoveTo(PlayerRef)
		endif
		_Camp_Black.PopTo(_Camp_FadeUp)
		CleanUpTent(akTent)
	elseif !(PlayerRef.GetSitState() == 2 || PlayerRef.GetSitState() == 3) && !TentObject.bGettingUp
		;Player getting up from sitting or lying down
		if TentObject.myExitFront && TentObject.myExitFront.IsEnabled() && PlayerRef.GetDistance(TentObject.myExitFront) < 1000.0
			PlayerRef.SplineTranslateToRef(TentObject.myExitFront, 1.0, 65.0)
		endif
		CleanUpTent(akTent)
	else
		TentObject.RegisterForSingleUpdate(0.5)
	endif
endFunction

;@From OnActivate on CampTent / CampTentEx
function ActivateTent(ObjectReference akActionRef, ObjectReference akTent)
	if akActionRef == PlayerRef
		was_hit = false
		CampTent TentObject = akTent as CampTent
		int iSitState = (akActionRef as Actor).GetSitState()
		if iSitState == 0
			ShowMainMenu(akTent)
		elseif iSitState == 3 && TentObject.myPlayerSitMarker.IsFurnitureInUse()
			ShowSitMenu(akTent)
		elseif iSitState == 3 && TentObject.myPlayerLayDownMarker.IsFurnitureInUse()
			ShowLayMenu(akTent)
		endif
	endif
endFunction

function ShowMainMenu(ObjectReference akTent)
	int i = _Camp_TentMainMenu.Show()
	if i == 0										;Sit
		if Compatibility.isSKSELoaded
			Message.ResetHelpMessage("Activate")
			_Camp_Help_TentActivate.ShowAsHelpMessage("Activate", 5, 30, 1)
		endif
		PlayerSit(akTent)
	elseif i == 1									;Lie Down
		if Compatibility.isSKSELoaded
			Message.ResetHelpMessage("Activate")
			_Camp_Help_TentActivate.ShowAsHelpMessage("Activate", 5, 30, 1)
		endif
		PlayerLieDown(akTent)
	elseif i == 2									;Pack
		PackTent(akTent)
	elseif i == 3									;Lantern
		ToggleLantern(akTent)
	else
		;exit
	endif
endFunction

function ShowSitMenu(ObjectReference akTent)
	;float myEP
	;@TODO: Wrap in IsFrostfallLoaded, otherwise display alternate message
	;/if _DE_ExposurePoints.GetValueInt() > 120.0				;Don't show the player that it is greater than 120 - will self-correct next cycle
		myEP = 120
	else
		myEP = _DE_ExposurePoints.GetValueInt()
	endif

	int i 
	if myEP > 100
		i = _DE_CampTent2_SitMenu_Positive.Show(myEP - 100, ((Frostfall.pWetPoints/750) * 100))
	else
		i = _DE_CampTent2_SitMenu.Show(myEP - 100, ((Frostfall.pWetPoints/750) * 100))
	endif/;
	CampTent TentObject = akTent as CampTent
	int i
	i = _Camp_TentSitMenu.Show(0, 0)
	if i == 0										;Wait
		ToggleLantern(akTent)
	elseif i == 1
		if TentObject.myTentExterior.IsDisabled()
			_Camp_TentSeeThru.SetValue(1)
			TryToEnableRef(TentObject.myTentExterior, true)
		else
			_Camp_TentSeeThru.SetValue(2)
			TryToDisableRef(TentObject.myTentExterior, true)
		endif
	elseif i == 2
		TentObject.myPlayerSitMarker.Activate(PlayerRef)
	elseif i == 3
		;do nothing
	endif
endFunction

function ShowLayMenu(ObjectReference akTent)
	;float myEP
	;@TODO: Wrap in IsFrostfallLoaded, otherwise display alternate message
	;/if _DE_ExposurePoints.GetValueInt() > 120.0				;Don't show the player that it is greater than 120 - will self-correct next cycle
		myEP = 120
	else
		myEP = _DE_ExposurePoints.GetValueInt()
	endif		
	int i
	if myEP > 100
		i = _DE_CampTent2_LayMenu_Positive.Show(myEP - 100, ((Frostfall.pWetPoints/750) * 100))
	else
		i = _DE_CampTent2_LayMenu.Show(myEP - 100, ((Frostfall.pWetPoints/750) * 100))
	endif/;
	CampTent TentObject = akTent as CampTent
	int i
	i = _Camp_TentLayMenu.Show(0, 0)
	if i == 0										;Sleep
		TentObject.bGettingUp = true
		_Camp_FadeDown.Apply()
		wait(1.0)
		_Camp_FadeDown.PopTo(_Camp_Black)
		if PlayerRef
			PlayerRef.MoveTo(akTent)			;Get up
			wait(0.4)
			TentObject.myBedRoll.Activate(PlayerRef)		;Spawns sleep menu
			wait(0.4)
			TentObject.myPlayerLayDownMarker.Activate(PlayerRef)				
			wait(3.5)
			SelectExterior(akTent, true)
			_Camp_Black.PopTo(_Camp_FadeUp)
		else
			;Something went wrong, make sure that the player's vision is restored!
			_Camp_Black.PopTo(_Camp_FadeUp)
		endif
		TentObject.bGettingUp = false
	elseif i == 1									;Lantern
		ToggleLantern(akTent)
	elseif i == 2 									;Toggle View
		if TentObject.myTentExterior.IsDisabled()
			_Camp_TentSeeThru.SetValue(1)
			TryToEnableRef(TentObject.myTentExterior, true)
		else
			_Camp_TentSeeThru.SetValue(2)
			TryToDisableRef(TentObject.myTentExterior, true)
		endif
	elseif i == 3									;Get Up
		TentObject.myPlayerLayDownMarker.Activate(PlayerRef)
		;StopFollowerUse(akTent)
	elseif i == 3									;Nothing
		;do nothing
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

	;@TODO: Come back to this
	;TryToMakeFollowersUse()

	CampTent TentObject = akTent as CampTent
	ConditionVars.IsPlayerSittingInTent = true
	Game.ForceThirdPerson()
	TentObject.myPlayerSitMarker.Activate(PlayerRef)
	if _Camp_Setting_CampingArmorTakeOff.GetValueInt() == 2
		;@TODO: Use new gear processing function	
		;if Frostfall.GetFireState() || _DE_CurrentTemp.GetValue() >= 6.0 || Frostfall.bInInterior
			DisplayPlayerTentEquipment(akTent)
		;else
		;	DisplayPlayerTentEquipment(true)
		;endif
	endif
	TryToDisableRef(TentObject.myShelterCollider)
	if _Camp_TentSeeThru.GetValueInt() == 2
		TryToDisableRef(TentObject.myTentExterior, true)
	endif

	;Start the quest so that the aliases fill and follower packages run.
	self.Start()
	Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
	
	; Fall back to persistent trigger without SKSE
	if !Compatibility.isSKSELoaded
		_Camp_Tent_InteractTriggerREF.MoveTo(PlayerRef)
	endif
	
	TentObject.RegisterForSingleUpdate(0.5)
endFunction

function PlayerLieDown(ObjectReference akTent)

	CampTent TentObject = akTent as CampTent
	; Skyrim 1.9 has broken the player's eyes from re-opening if you lie down (sleepstate = 4).
	; An alternative animation must be used.
	
	;Don't lie down in tent if on the Dark Brotherhood entrance quest
	if DBEntranceQuest.GetStage() == 20 && DBEntranceQuestScript.pSleepyTime == 1
		TentObject.myBedRoll.Activate(PlayerRef)
		return
	endif

	;Don't lie down in tent if DLC2 is loaded, the player is in Solstheim, and DLC2MQ03B isn't complete yet
	if Compatibility.isDLC2Loaded
		Quest DLC2MQ03B = Game.GetFormFromFile(0x02035440, "Dragonborn.esm") as Quest
		Location DLC2SolstheimLocation = Game.GetFormFromFile(0x02016E2A, "Dragonborn.esm") as Location
		Worldspace DLC2SolstheimWorld = Game.GetFormFromFile(0x02000800, "Dragonborn.esm") as Worldspace

		if DLC2MQ03B.IsCompleted() == false && PlayerRef.IsInLocation(DLC2SolstheimLocation)
			if PlayerRef.GetWorldspace() == DLC2SolstheimWorld
				TentObject.myBedRoll.Activate(PlayerRef)
				return
			endif
		endif
	endif

	ConditionVars.IsPlayerLayingInTent = true
	Game.ForceThirdPerson()
	(TentObject.myPlayerLayDownMarker as ObjectReference).Activate(PlayerRef)
	if _Camp_Setting_CampingArmorTakeOff.GetValueInt() == 2
		;@TODO: Wrap in IsFrostfallLoaded
		
		;if Frostfall.GetFireState() || _DE_CurrentTemp.GetValue() >= 10.0 || Frostfall.bInInterior
			DisplayPlayerTentEquipment(akTent)
		;else
		;	DisplayPlayerTentEquipment(true)
		;endif
	endif
	TryToDisableRef(TentObject.myShelterCollider)
	if _Camp_TentSeeThru.GetValueInt() == 2
		TryToDisableRef(TentObject.myTentExterior, true)
	endif

	;Start the quest so that the aliases fill and follower packages run.
	self.Start()
	Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
	
	; Fall back to persistent trigger without SKSE
	if !Compatibility.isSKSELoaded
		_Camp_Tent_InteractTriggerREF.MoveTo(PlayerRef)
	endif
	
	TentObject.RegisterForSingleUpdate(0.5)
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
	bool separate_exterior = TentObject.myTent && TentObject.myNormalTent

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
	if !abInTent
		TryToEnableRef(TentObject.myShelterCollider)
	endif
	
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
	PlayerRef.AddItem(TentObject.Required_InventoryItem, abSilent = true)
	ITMGenericArmorUp.Play(akTent)

	;Are any of the bed rolls in use?
	if TentObject.myBedRoll
		if TentObject.myBedRoll.IsFurnitureInUse()
			_Camp_TentPickUpError.Show()
			return
		endif
	endif
	if TentObject.mySpareBedRoll1
		if TentObject.mySpareBedRoll1.IsFurnitureInUse()
			_Camp_TentPickUpError.Show()
			return
		endif
	endif
	if TentObject.mySpareBedRoll2
		if TentObject.mySpareBedRoll2.IsFurnitureInUse()
			_Camp_TentPickUpError.Show()
			return
		endif
	endif
	if TentObject.mySpareBedRoll3
		if TentObject.mySpareBedRoll3.IsFurnitureInUse()
			_Camp_TentPickUpError.Show()
			return
		endif
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
	TentObject.TakeDown()

	;Move activation triggers to the anchor
	_Camp_Tent_InteractTriggerREF.MoveTo(_Camp_Anchor)
	
	wait(0.2)

	;Finally, delete myself
	TryToDisableAndDeleteRef(akTent)
endFunction

function CleanUpTent(ObjectReference akTent)
	CampTent TentObject = akTent as CampTent
	
	;Move activation triggers to the anchor
	_Camp_Tent_InteractTriggerREF.MoveTo(_Camp_Anchor)

	;Stop follower functionality
	ConditionVars.IsPlayerSittingInTent = false
	ConditionVars.IsPlayerLayingInTent = false
	self.Stop()
	
	Game.EnablePlayerControls()
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

	if !IsRefInInterior(PlayerRef)
		TryToEnableRef(TentObject.myShelterCollider)
	endif
	TryToEnableRef(TentObject.myTentExterior, true)
endFunction

function UnequipUsingDummyWeapon()
	PlayerRef.AddItem(_Camp_DummyWeapon, abSilent = true)
	PlayerRef.EquipItem(_Camp_DummyWeapon, abSilent = true)
	PlayerRef.UnEquipItem(_Camp_DummyWeapon, abSilent = true)
	PlayerRef.RemoveItem(_Camp_DummyWeapon, abSilent = true)
endFunction