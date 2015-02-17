scriptname _Camp_TentSystem extends Quest
{@TODO}

import math
import utility
import debug
import _CampInternal
import CampUtil

;Scripts
;@TODO: Resolve at startup
;_DE_EPMonitor_1_6 property Frostfall auto
;@TODO: Resolve at startup

; TO KEEP IN UTIL
_Camp_Compatibility property Compatibility auto
pDBEntranceQuestScript property DBEntranceQuestScript auto
Quest property DBEntranceQuest auto
;@TODO: Remove
Actor property PlayerRef auto
Armor property _Camp_WalkingStickShield auto
GlobalVariable property _DE_Setting_CampingArmorTakeOff auto
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
GlobalVariable property _Camp_HelpDone_TentActivate auto
GlobalVariable property _Camp_Setting_Help auto
GlobalVariable property _DE_TentSeeThru auto
GlobalVariable property _DE_FollowersUseBedrollAI auto
Message property _DE_CampTent_Placed_ACT_Menu auto
Message property _DE_CampTent2_SitMenu auto
Message property _DE_CampTent2_SitMenu_Positive auto
Message property _DE_CampTent2_LayMenu auto
Message property _DE_CampTent2_LayMenu_Positive auto
Message property _DE_CampTent2_PickUpError auto
Message property _Camp_Tent_Combat auto
Message property _DE_Combat_Error auto
Message property _Camp_Help_TentActivate auto
Message property _DE_TentSeeThruError auto
ReferenceAlias property StaticFollower1 auto
ReferenceAlias property StaticFollower2 auto
ReferenceAlias property StaticFollower3 auto
ObjectReference property _DE_Anchor auto
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
Furniture property _Camp_TentSitMarker auto
Furniture property _Camp_TentLayDownMarker auto
Furniture property _Camp_TentLayDownMarkerL auto
Furniture property _Camp_TentLayDownMarkerR auto
Furniture property _Camp_Bedroll_ActualF auto
Furniture property _Camp_Bedroll_ActualL auto
Furniture property _Camp_Bedroll_ActualR auto
Furniture property _Camp_Bedroll_NPC_F auto
Furniture property _Camp_Bedroll_NPC_L auto
Furniture property _Camp_Bedroll_NPC_R auto
ImageSpaceModifier property _Camp_FadeDown auto
ImageSpaceModifier property _Camp_FadeUp auto
ImageSpaceModifier property _Camp_Black auto
Sound property ITMGenericArmorUp auto
Weapon property _Camp_DummyWeapon auto
Form property BFXFireVol01 auto

;@TODO: Remove
;furniture property _Camp_Bedroll_NPC_FL auto
;furniture property _Camp_Bedroll_NPC_FR auto

;@From OnUpdate on CampTent / CampTentEx
function UpdateTentUseState(ObjectReference akTent)
	;@TODO: Might need to reintroduce some idea of myActor in order to maintain async state
	;@TODO: Check hit, not combat!
	CampTent TentObject = akTent as CampTent
	if PlayerRef.IsInCombat()
		;Player entered combat, kick them out of the tent
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
		_Camp_Tent_Combat.Show()
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
	int i = _DE_CampTent_Placed_ACT_Menu.Show()
	if i == 0										;Sit
		if _Camp_Setting_Help.GetValueInt() == 2 && _Camp_HelpDone_TentActivate.GetValueInt() == 1
			;@TODO: Move to Frostfall
			;_DE_Help_Tents.Show()
			Message.ResetHelpMessage("Activate")
			_Camp_Help_TentActivate.ShowAsHelpMessage("Activate", 5, 30, 1)
			_Camp_HelpDone_TentActivate.SetValueInt(2)
		endif
		PlayerSit(akTent)
	elseif i == 1									;Lie Down
		if _Camp_Setting_Help.GetValueInt() == 2 && _Camp_HelpDone_TentActivate.GetValueInt() == 1
			;@TODO: Move to Frostfall
			;_DE_Help_Tents.Show()
			Message.ResetHelpMessage("Activate")
			_Camp_Help_TentActivate.ShowAsHelpMessage("Activate", 5, 30, 1)
			_Camp_HelpDone_TentActivate.SetValueInt(2)
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
	i = _DE_CampTent2_SitMenu.Show(0, 0)
	if i == 0										;Wait
		ToggleLantern(akTent)
	elseif i == 1
		if IsRefInInterior(PlayerRef)
			_DE_TentSeeThruError.Show()
		else
			if TentObject.myTentExterior.IsDisabled()
				_DE_TentSeeThru.SetValue(1)
				TryToEnableRef(TentObject.myTentExterior, true)
			else
				_DE_TentSeeThru.SetValue(2)
				TryToDisableRef(TentObject.myTentExterior, true)
			endif
		endif
	elseif i == 2
		TentObject.myPlayerSitMarker.Activate(PlayerRef)
		StopFollowerUse(akTent)
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
	i = _DE_CampTent2_LayMenu.Show(0, 0)
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
			SelectExterior(akTent)
			_Camp_Black.PopTo(_Camp_FadeUp)
		else
			;Something went wrong, make sure that the player's vision is restored!
			_Camp_Black.PopTo(_Camp_FadeUp)
		endif
		TentObject.bGettingUp = false
	elseif i == 1									;Lantern
		ToggleLantern(akTent)
	elseif i == 2 									;Toggle View
		if IsRefInInterior(PlayerRef)
			_DE_TentSeeThruError.Show()
		else
			if TentObject.myTentExterior.IsDisabled()
				_DE_TentSeeThru.SetValue(1)
				TryToEnableRef(TentObject.myTentExterior, true)
			else
				_DE_TentSeeThru.SetValue(2)
				TryToDisableRef(TentObject.myTentExterior, true)
			endif
		endif
	elseif i == 3									;Get Up
		TentObject.myPlayerLayDownMarker.Activate(PlayerRef)
		StopFollowerUse(akTent)
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

function PlayerSit(ObjectReference akTent)

	;@TODO: Come back to this
	;TryToMakeFollowersUse()

	CampTent TentObject = akTent as CampTent
	Game.ForceThirdPerson()
	TentObject.myPlayerSitMarker.Activate(PlayerRef)
	if _DE_Setting_CampingArmorTakeOff.GetValueInt() == 2
		;@TODO: Use new gear processing function	
		;if Frostfall.GetFireState() || _DE_CurrentTemp.GetValue() >= 6.0 || Frostfall.bInInterior
			DisplayPlayerTentEquipment(akTent)
		;else
		;	DisplayPlayerTentEquipment(true)
		;endif
	endif
	TryToDisableRef(TentObject.myShelterCollider)
	if _DE_TentSeeThru.GetValueInt() == 2
		TryToDisableRef(TentObject.myTentExterior, true)
	endif
	Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
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

	;@TODO: Come back to this
	;TryToMakeFollowersUse()

	Game.ForceThirdPerson()
	(TentObject.myPlayerLayDownMarker as ObjectReference).Activate(PlayerRef)
	if _DE_Setting_CampingArmorTakeOff.GetValueInt() == 2
		;@TODO: Wrap in IsFrostfallLoaded
		
		;if Frostfall.GetFireState() || _DE_CurrentTemp.GetValue() >= 10.0 || Frostfall.bInInterior
			DisplayPlayerTentEquipment(akTent)
		;else
		;	DisplayPlayerTentEquipment(true)
		;endif
	endif
	TryToDisableRef(TentObject.myShelterCollider)
	if _DE_TentSeeThru.GetValueInt() == 2
		TryToDisableRef(TentObject.myTentExterior, true)
	endif
	Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
	TentObject.RegisterForSingleUpdate(0.5)
	
endFunction

function DisplayPlayerTentEquipment(ObjectReference akTent, bool bLimited = false)
	CampTent TentObject = akTent as CampTent
	if bLimited == false
		if _Camp_Setting_TakeOff_Helm.GetValueInt() == 1
			DisplayHelm_Player(TentObject)
		endif
		if _Camp_Setting_TakeOff_Cuirass.GetValueInt() == 1
			DisplayCuirass_Player(TentObject)
		endif
		if _Camp_Setting_TakeOff_Gauntlets.GetValueInt() == 1
			DisplayGauntlets_Player(TentObject)
		endif
		if _Camp_Setting_TakeOff_Boots.GetValueInt() == 1
			DisplayBoots_Player(TentObject)
		endif
	endif
	if _Camp_Setting_TakeOff_Weapons.GetValueInt() == 1
		DisplayWeapons_Player(TentObject)
	endif
	if _Camp_Setting_TakeOff_Shield.GetValueInt() == 1
		DisplayShield_Player(TentObject)
	endif
	if _Camp_Setting_TakeOff_Ammo.GetValueInt() == 1
		DisplayQuiver_Player(TentObject)
	endif
	if _Camp_Setting_TakeOff_Backpack.GetValueInt() == 1
		DisplayBackpack_Player(TentObject)
	endif
endFunction

function SelectExterior(ObjectReference akTent)
	if IsRefInInterior(PlayerRef)
		return
	endif

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
	TryToEnableRef(TentObject.myShelterCollider)
	
	TryToDisableRef(TentObject.myNormalTent)
	TryToDisableRef(TentObject.mySnowTent)
	TryToDisableRef(TentObject.myAshTent)
	TryToEnableRef(TentObject.myTentExterior, true)
endFunction

function TryToMakeFollowersUse(ObjectReference akTent)
	;debug.trace("[Frostfall] Trying to make NPC sleep...")
	;Move bedroll out of range of NPCs, so they won't path here
	CampTent TentObject = akTent as CampTent
	(TentObject.myBedRoll as ObjectReference).SetPosition(TentObject.myBedRoll.GetPositionX(), \
														  TentObject.myBedRoll.GetPositionY(), \
														  TentObject.myBedRoll.GetPositionZ() + 3000.0)
	_DE_FollowersUseBedrollAI.SetValueInt(1)
endFunction

function StopFollowerUse(ObjectReference akTent)
	;debug.trace("[Frostfall] Trying to make NPC stop sleeping...")
	;Move bedroll back in range
	CampTent TentObject = akTent as CampTent
	(TentObject.myBedRoll as ObjectReference).SetPosition(akTent.GetPositionX(), akTent.GetPositionY(), akTent.GetPositionZ())
	_DE_FollowersUseBedrollAI.SetValueInt(0)
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

function UnDisplayWeapon_Follower()

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

function PackTent(ObjectReference akTent)
	CampTent TentObject = akTent as CampTent
	;Are any of the bed rolls in use?
	if TentObject.myBedRoll
		if TentObject.myBedRoll.IsFurnitureInUse()
			_DE_CampTent2_PickUpError.Show()
			return
		endif
	endif
	if TentObject.mySpareBedRoll1
		if TentObject.mySpareBedRoll1.IsFurnitureInUse()
			_DE_CampTent2_PickUpError.Show()
			return
		endif
	endif
	if TentObject.mySpareBedRoll2
		if TentObject.mySpareBedRoll2.IsFurnitureInUse()
			_DE_CampTent2_PickUpError.Show()
			return
		endif
	endif
	if TentObject.mySpareBedRoll3
		if TentObject.mySpareBedRoll3.IsFurnitureInUse()
			_DE_CampTent2_PickUpError.Show()
			return
		endif
	endif
	
	;Move activation trigger to the anchor
	;@TODO: Remove
	;_DE_Tent_InteractTriggerREF.MoveTo(_DE_Anchor)

	;Delete display models, if any
	UnDisplayShield_Player(TentObject)
	UnDisplayWeapons_Player(TentObject)
	UnDisplayCuirass_Player(TentObject)
	UnDisplayBoots_Player(TentObject)
	UnDisplayGauntlets_Player(TentObject)
	UnDisplayHelm_Player(TentObject)
	UnDisplayQuiver_Player(TentObject)
	UnDisplayBackpack_Player(TentObject)	
	
	;Delete markers and furniture
	TentObject.TakeDown()
	
	wait(0.2)
	PlayerRef.AddItem(TentObject.Required_InventoryItem, abSilent = true)
	ITMGenericArmorUp.Play(akTent)

	StopFollowerUse(akTent)
	
	;Finally, delete myself
	TryToDisableAndDeleteRef(akTent)
endFunction

function CleanUpTent(ObjectReference akTent)
	CampTent TentObject = akTent as CampTent
	StopFollowerUse(akTent)
	Game.EnablePlayerControls()
	UnDisplayShield_Player(TentObject)
	UnDisplayWeapons_Player(TentObject)
	UnDisplayCuirass_Player(TentObject)
	UnDisplayBoots_Player(TentObject)
	UnDisplayGauntlets_Player(TentObject)
	UnDisplayHelm_Player(TentObject)
	UnDisplayQuiver_Player(TentObject)
	UnDisplayBackpack_Player(TentObject)

	TryToEnableRef(TentObject.myShelterCollider)
	TryToEnableRef(TentObject.myTentExterior, true)
endFunction

function UnequipUsingDummyWeapon()
	PlayerRef.AddItem(_Camp_DummyWeapon, abSilent = true)
	PlayerRef.EquipItem(_Camp_DummyWeapon, abSilent = true)
	PlayerRef.UnEquipItem(_Camp_DummyWeapon, abSilent = true)
	PlayerRef.RemoveItem(_Camp_DummyWeapon, abSilent = true)
endFunction

;@TODO: Settle on Follower support approach
;/ObjectReference property Spare1LastUser auto
ObjectReference property Spare2LastUser auto
ObjectReference property Spare3LastUser auto

function DispatchSpareBedrollEvent(ObjectReference akBedroll, ObjectReference akActionRef, bool InUse)
	if InUse
		debug.trace("[Frostfall] Bedroll " + akBedroll + " in use by " + akActionRef)
		if akBedroll == mySpareBedRoll1
			DoSpareBedroll1Event(akActionRef)
		elseif akBedroll == mySpareBedRoll2
			DoSpareBedroll2Event(akActionRef)
		elseif akBedroll == mySpareBedRoll3
			DoSpareBedroll3Event(akActionRef)
		endif
	else
		debug.trace("[Frostfall] Bedroll " + akBedroll + " no longer in use.")
		if akBedroll == mySpareBedRoll1
			
		elseif akBedroll == mySpareBedRoll2
			
		elseif akBedroll == mySpareBedRoll3
			
		endif
	endif
endFunction

function DoSpareBedroll1Event(ObjectReference akActionRef)
	if akActionRef == Frostfall.StaticFollower1.GetActorRef()
		Spare1LastUser = akActionRef

		int iWeaponType = akActionRef.GetEquippedItemType(1)
		if (iWeaponType <= 4 || iWeaponType == 8) && iWeaponType > 0
			;Follower has a one-handed weapon
			myFollowerAMainWeapon = akActionRef.GetEquippedWeapon()
			;Does the Follower have an off-hand weapon?
			int iOffWeaponType = akActionRef.GetEquippedItemType(0)
			if (iOffWeaponType <= 4 || iOffWeaponType == 8) && iOffWeaponType > 0
				;Follower has an off-hand weapon
				myFollowerAOffHandWeapon = akActionRef.GetEquippedWeapon(true)
			endif
		elseif iWeaponType == 5 || iWeaponType == 6
			;Follower has a two-handed weapon
			myFollowerABigWeapon = akActionRef.GetEquippedWeapon()
		elseif iWeaponType == 7
			myFollowerABow = akActionRef.GetEquippedWeapon()
		endif
	
		if myFollowerAMainWeapon
			akActionRef.UnequipItem(myFollowerAMainWeapon, abSilent = true)
			if Frostfall.bInInterior
				myDisplayFollowerAMainWeapon = myFollowerAMarker_MainWeapon.PlaceAtMe(myFollowerAMainWeapon)
			else
				if myFollowerAMainWeapon != _DE_WalkingStickWarAxe
					myDisplayFollowerAMainWeapon = myPlayerMarker_MainWeapon.PlaceAtMe(myFollowerAMainWeapon)
				endif
			endif
			if myDisplayFollowerAMainWeapon
				while !myDisplayFollowerAMainWeapon.Is3DLoaded()
				endwhile
				myDisplayFollowerAMainWeapon.SetMotionType(Motion_Keyframed)
				myDisplayFollowerAMainWeapon.BlockActivation()
			endif
		endif
	
		if myFollowerAOffHandWeapon
			if Frostfall.bInInterior
				myDisplayFollowerAOffHandWeapon = myFollowerAMarker_OffHandWeapon.PlaceAtMe(myFollowerAOffHandWeapon)
			else
				if myFollowerAOffHandWeapon != _DE_WalkingStickWarAxe
					myDisplayFollowerAOffHandWeapon = myFollowerAMarker_OffHandWeapon.PlaceAtMe(myFollowerAOffHandWeapon)
				endif
			endif
			if myDisplayFollowerAOffHandWeapon
				while !myDisplayFollowerAOffHandWeapon.Is3DLoaded()
				endwhile
				myDisplayFollowerAOffHandWeapon.SetMotionType(Motion_Keyframed)
				myDisplayFollowerAOffHandWeapon.BlockActivation()
			endif
		endif
		
		if myFollowerABigWeapon
			UnequipUsingDummyWeapon()
			myDisplayBigWeapon = myPlayerMarker_BigWeapon.PlaceAtMe(myFollowerABigWeapon)
			if myDisplayBigWeapon
				while !myDisplayBigWeapon.Is3DLoaded()
				endwhile
				myDisplayBigWeapon.SetMotionType(Motion_Keyframed)
				myDisplayBigWeapon.BlockActivation()
			endif
		endif
		
		if myBow
			UnequipUsingDummyWeapon()
			myDisplayBow = myPlayerMarker_Bow.PlaceAtMe(myBow)
			if myDisplayBow
				while !myDisplayBow.Is3DLoaded()
				endwhile
				myDisplayBow.SetMotionType(Motion_Keyframed)
				myDisplayBow.BlockActivation()
			endif
		endif



	;elseif akActionRef == Frostfall.StaticFollower2.GetActorRef()

	;elseif akActionRef == Frostfall.StaticFollower3.GetActorRef()

	endif
endFunction

function DoSpareBedroll2Event(ObjectReference akActionRef)

endFunction

function DoSpareBedroll3Event(ObjectReference akActionRef)

endFunction
/;