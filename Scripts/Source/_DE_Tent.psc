scriptname _DE_Tent extends ObjectReference
{Generic Tent class that other tent activators extend.}

; #SUMMARY# =====================================================================================================================
; Name ...................: _DE_Tent
; Attached To (EditorID)..: 
; Description ............: Tent base class script that all other tents extend. Handles all main tent functionality.
; Author .................: Chesko
; Last Approved (version) : 2.6
; Status .................: Complete
; Remarks ................: Follower implementation done in 2.6.
; ===============================================================================================================================

import math
import utility
import debug
import CampUtil

weapon property _DE_DummyWeapon auto

;Scripts
;@TODO: Resolve at startup
;_DE_EPMonitor_1_6 property Frostfall auto
;@TODO: Resolve at startup

_Camp_Compatibility property Compatibility auto

MiscObject property TentMiscItem auto
{Tent miscellaneous inventory item.}

Static property SnowTentStatic auto
{Snowy tent static object.}

Static property AshTentStatic auto
{Ash tent static object (DLC2).}

static property XMarker auto

;Object locations
float[] property myOriginAng auto hidden
float[] property myPlayerMarker_MainWeapon_Pos auto hidden
float[] property myPlayerMarker_OffHandWeapon_Pos auto hidden
float[] property myPlayerMarker_BigWeapon_Pos auto hidden
float[] property myPlayerMarker_Bow_Pos auto hidden
float[] property myPlayerMarker_Helm_Pos auto hidden
float[] property myPlayerMarker_Boots_Pos auto hidden
float[] property myPlayerMarker_Gauntlets_Pos auto hidden
float[] property myPlayerMarker_Backpack_Pos auto hidden
float[] property myPlayerMarker_Shield_Pos auto hidden
float[] property myPlayerMarker_ShieldInterior_Pos auto hidden
float[] property myFollowerAMarker_MainWeapon_Pos auto hidden
float[] property myFollowerAMarker_OffHandWeapon_Pos auto hidden
float[] property myFollowerAMarker_BigWeapon_Pos auto hidden
float[] property myFollowerAMarker_Bow_Pos auto hidden
float[] property myFollowerAMarker_Shield_Pos auto hidden
float[] property myFollowerBMarker_MainWeapon_Pos auto hidden
float[] property myFollowerBMarker_OffHandWeapon_Pos auto hidden
float[] property myFollowerBMarker_BigWeapon_Pos auto hidden
float[] property myFollowerBMarker_Bow_Pos auto hidden
float[] property myFollowerBMarker_Shield_Pos auto hidden
float[] property myFollowerCMarker_MainWeapon_Pos auto hidden
float[] property myFollowerCMarker_OffHandWeapon_Pos auto hidden
float[] property myFollowerCMarker_BigWeapon_Pos auto hidden
float[] property myFollowerCMarker_Bow_Pos auto hidden
float[] property myFollowerCMarker_Shield_Pos auto hidden
float[] property myGroundCover_Pos auto hidden
float[] property myTent_Pos auto hidden
float[] property myLanternLit_Pos auto hidden
float[] property myLanternLit2_Pos auto hidden
float[] property myLanternLit3_Pos auto hidden
float[] property myLanternUnlit_Pos auto hidden
float[] property myLanternUnlit2_Pos auto hidden
float[] property myLanternUnlit3_Pos auto hidden
float[] property myLanternLight_Pos auto hidden
float[] property myLanternLight2_Pos auto hidden
float[] property myLanternLight3_Pos auto hidden
float[] property myPlayerSitMarker_Pos auto hidden
float[] property myPlayerLayDownMarker_Pos auto hidden
float[] property myExitFront_Pos auto hidden
float[] property myBedRoll_Pos auto hidden
float[] property mySpareBedRoll1_Pos auto hidden
float[] property mySpareBedRoll2_Pos auto hidden
float[] property mySpareBedRoll3_Pos auto hidden
float[] property myWard_Pos auto hidden
float[] property mySelf_Pos auto hidden

;Player and actors
Actor property PlayerRef auto
Actor property myActor auto hidden

;Globals
GlobalVariable property _DE_HoursToSleep auto
GlobalVariable property GameHour auto
GlobalVariable property Timescale auto
GlobalVariable property _DE_bContinueToWait auto
GlobalVariable property _DE_Setting_CampingArmorTakeOff auto
;GlobalVariable property _DE_CurrentTemp auto
;GlobalVariable property _DE_ExposurePoints auto
GlobalVariable property _DE_Setting_Help auto
GlobalVariable property _DE_HelpDone_Tents auto
GlobalVariable property _DE_TentSeeThru auto
GlobalVariable property _DE_FollowersUseBedrollAI auto

;Messages
message property _DE_CampTent_Placed_ACT_Menu auto
message property _DE_CampTent2_SitMenu auto
message property _DE_CampTent2_SitMenu_Positive auto
message property _DE_CampTent2_LayMenu auto
message property _DE_CampTent2_LayMenu_Positive auto
message property _DE_CampTent2_PickUpError auto
message property _DE_Tent_Combat auto
message property _DE_Combat_Error auto

;Equipment markers
static property _DE_Tent_MainWeaponMarker auto
static property _DE_Tent_OffHandWeaponMarker auto
static property _DE_Tent_BigWeaponMarker auto
static property _DE_Tent_BowMarker auto
static property _DE_Tent_HelmMarker auto
static property _DE_Tent_CuirassMarker auto
static property _DE_Tent_GauntletsMarker auto
static property _DE_Tent_BootsMarker auto
static property _DE_Tent_BackpackMarker auto
static property _DE_Tent_ShieldMarker auto

;Run-time objects
ObjectReference property myTent auto hidden
ObjectReference property myTentExterior auto hidden
ObjectReference property myNormalTent auto hidden
ObjectReference property mySnowTent auto hidden
ObjectReference property myAshTent auto hidden
ObjectReference property myLanternLit auto hidden
ObjectReference property myLanternUnlit auto hidden
ObjectReference property myLanternLight auto hidden
ObjectReference property myLanternLit2 auto hidden
ObjectReference property myLanternUnlit2 auto hidden
ObjectReference property myLanternLight2 auto hidden
ObjectReference property myLanternLit3 auto hidden
ObjectReference property myLanternUnlit3 auto hidden
ObjectReference property myLanternLight3 auto hidden
ObjectReference property myPlayerMarker_MainWeapon auto hidden
ObjectReference property myPlayerMarker_OffHandWeapon auto hidden
ObjectReference property myPlayerMarker_BigWeapon auto hidden
ObjectReference property myPlayerMarker_Bow auto hidden
ObjectReference property myPlayerMarker_Helm auto hidden
ObjectReference property myPlayerMarker_Boots auto hidden
ObjectReference property myPlayerMarker_Gauntlets auto hidden
ObjectReference property myPlayerMarker_Backpack auto hidden
ObjectReference property myPlayerMarker_Shield auto hidden
ObjectReference property myPlayerMarker_ShieldInterior auto hidden
ObjectReference property myFollowerAMarker_MainWeapon auto hidden
ObjectReference property myFollowerAMarker_OffHandWeapon auto hidden
ObjectReference property myFollowerAMarker_BigWeapon auto hidden
ObjectReference property myFollowerAMarker_Bow auto hidden
ObjectReference property myFollowerAMarker_Shield auto hidden
ObjectReference property myFollowerBMarker_MainWeapon auto hidden
ObjectReference property myFollowerBMarker_OffHandWeapon auto hidden
ObjectReference property myFollowerBMarker_BigWeapon auto hidden
ObjectReference property myFollowerBMarker_Bow auto hidden
ObjectReference property myFollowerBMarker_Shield auto hidden
ObjectReference property myFollowerCMarker_MainWeapon auto hidden
ObjectReference property myFollowerCMarker_OffHandWeapon auto hidden
ObjectReference property myFollowerCMarker_BigWeapon auto hidden
ObjectReference property myFollowerCMarker_Bow auto hidden
ObjectReference property myFollowerCMarker_Shield auto hidden
ObjectReference property myGroundCover auto hidden
ObjectReference property myPlayerSitMarker auto hidden
ObjectReference property myPlayerLayDownMarker auto hidden
ObjectReference property myExitFront auto hidden
ObjectReference property myBedRoll auto hidden
ObjectReference property mySpareBedRoll1 auto hidden
ObjectReference property mySpareBedRoll2 auto hidden
ObjectReference property mySpareBedRoll3 auto hidden
ObjectReference property myWard auto hidden

;Run-time variables
bool property bLanternLit = false auto hidden
bool property bGettingUp = false auto hidden
float property myTimeScale = 20.0 auto hidden

;Bedrolls and other furniture
furniture property _DE_TentSitMarker auto
furniture property _DE_TentLayDownMarker auto
furniture property _DE_TentLayDownMarkerL auto
furniture property _DE_TentLayDownMarkerR auto
furniture property _DE_Bedroll_ActualF auto
furniture property _DE_Bedroll_ActualL auto
furniture property _DE_Bedroll_ActualR auto
furniture property _DE_Bedroll_NPC_F auto
furniture property _DE_Bedroll_NPC_FL auto
furniture property _DE_Bedroll_NPC_FR auto
furniture property _DE_Bedroll_NPC_L auto
furniture property _DE_Bedroll_NPC_R auto

;Learned equipment
Ammo property myQuiver auto hidden
Armor property myShield auto hidden
Armor property myHelm auto hidden
Armor property myBackpack auto hidden
Armor property myBoots auto hidden
Armor property myGauntlets auto hidden
Weapon property myMainWeapon auto hidden
Weapon property myOffHandWeapon auto hidden
Weapon property myBigWeapon auto hidden
Weapon property myBow auto hidden

;Learned follower equipment
Armor property myFollowerAShield auto hidden
Weapon property myFollowerAMainWeapon auto hidden
Weapon property myFollowerAOffHandWeapon auto hidden
Weapon property myFollowerABigWeapon auto hidden
Weapon property myFollowerABow auto hidden

Armor property myFollowerBShield auto hidden
Weapon property myFollowerBMainWeapon auto hidden
Weapon property myFollowerBOffHandWeapon auto hidden
Weapon property myFollowerBBigWeapon auto hidden
Weapon property myFollowerBBow auto hidden

Armor property myFollowerCShield auto hidden
Weapon property myFollowerCMainWeapon auto hidden
Weapon property myFollowerCOffHandWeapon auto hidden
Weapon property myFollowerCBigWeapon auto hidden
Weapon property myFollowerCBow auto hidden


;Display Equipment
ObjectReference property myDisplayQuiver auto hidden
ObjectReference property myDisplayShield auto hidden
ObjectReference property myDisplayHelm auto hidden
ObjectReference property myDisplayBackpack auto hidden
ObjectReference property myDisplayBoots auto hidden
ObjectReference property myDisplayGauntlets auto hidden
ObjectReference property myDisplayMainWeapon auto hidden
ObjectReference property myDisplayOffHandWeapon auto hidden
ObjectReference property myDisplayBigWeapon auto hidden
ObjectReference property myDisplayBow auto hidden

Armor property myDisplayFollowerAShield auto hidden
Weapon property myDisplayFollowerAMainWeapon auto hidden
Weapon property myDisplayFollowerAOffHandWeapon auto hidden
Weapon property myDisplayFollowerABigWeapon auto hidden
Weapon property myDisplayFollowerABow auto hidden

Armor property myDisplayFollowerBShield auto hidden
Weapon property myDisplayFollowerBMainWeapon auto hidden
Weapon property myDisplayFollowerBOffHandWeapon auto hidden
Weapon property myDisplayFollowerBBigWeapon auto hidden
Weapon property myDisplayFollowerBBow auto hidden

Armor property myDisplayFollowerCShield auto hidden
Weapon property myDisplayFollowerCMainWeapon auto hidden
Weapon property myDisplayFollowerCOffHandWeapon auto hidden
Weapon property myDisplayFollowerCBigWeapon auto hidden
Weapon property myDisplayFollowerCBow auto hidden

;Misc
Quest property DBEntranceQuest auto
ReferenceAlias property StaticFollower1 auto
ReferenceAlias property StaticFollower2 auto
ReferenceAlias property StaticFollower3 auto
pDBEntranceQuestScript property DBEntranceQuestScript auto
Formlist property _DE_WorldspacesInteriors auto
Message property _DE_Help_Tents auto
Message property _DE_TentSeeThruError auto
static property _DE_Tent_LanternOnGround auto
static property _DE_Tent_LanternOffGround auto
static property _DE_Tent_LanternOnHang auto
static property _DE_Tent_LanternOffHang auto
Light property _DE_LanternLight auto
static property _DE_Tent_BedrollHayNoGround01 auto
static property _DE_Tent_BedrollHayNoGround02 auto
static property _DE_Tent_BedrollHayNoGround03 auto
static property Rug03 auto
static property _DE_TentWard auto
ObjectReference property _DE_Tent_StopSleepTriggerREF auto
ObjectReference property _DE_Tent_StopWaitTriggerREF auto
ObjectReference property _DE_Tent_InteractTriggerREF auto
ObjectReference property _DE_Anchor auto
ImageSpaceModifier property _DE_FadeDown auto
ImageSpaceModifier property _DE_FadeUp auto
ImageSpaceModifier property _DE_Black auto
Sound property ITMGenericArmorUp auto
Weapon property _DE_WalkingStickWarAxe auto
keyword property ClothingBody auto
keyword property ArmorCuirass auto

Event OnUpdate()
	if myActor
		;notification("Sleep State: " + myActor.GetSleepState() + ", Sit State: " + myActor.GetSitState())
		if myActor == PlayerRef
			if myActor.IsInCombat()
				;Player got in trouble, bail them out of the tent
				_DE_FadeDown.Apply()
				wait(0.5)
				_DE_FadeDown.PopTo(_DE_Black)
				if myExitFront && myActor.GetDistance(myExitFront) < 1000.0
					myActor.MoveTo(myExitFront)
				else
					myActor.MoveTo(self)
				endif
				_DE_Black.PopTo(_DE_FadeUp)
				_DE_Tent_Combat.Show()
				StopFollowerUse()
				CleanUpTent()
			else
				if !(myActor.GetSitState() == 2 || myActor.GetSitState() == 3) && !bGettingUp
					;Player getting up from sitting
					if myExitFront && myActor.GetDistance(myExitFront) < 1000.0
						myActor.SplineTranslateToRef(myExitFront, 1.0, 65.0)
					endif
					StopFollowerUse()
					CleanUpTent()
				else
					RegisterForSingleUpdate(0.5)
				endif
			endif
		else
			;Follower support goes here
		endif
	else
		;Where'd they go? No matter, stop updating
		StopFollowerUse()
		CleanUpTent()
	endif
endEvent

Event OnActivate(ObjectReference akActionRef)
	
	int iSitState = (akActionRef as Actor).GetSitState()
	
	if akActionRef == PlayerRef
		if (akActionRef as Actor).IsInCombat()
			_DE_Combat_Error.Show()
		else
			if iSitState == 0
				ShowMainMenu(akActionRef)
			elseif iSitState == 3 && myPlayerSitMarker.IsFurnitureInUse()
				ShowSitMenu(akActionRef)
			elseif iSitState == 3 && myPlayerLayDownMarker.IsFurnitureInUse()
				ShowLayMenu(akActionRef)
			endif
		endif
	endif
	
endEvent

function ShowMainMenu(ObjectReference akActionRef)
	if akActionRef == PlayerRef
	myActor = PlayerRef
		int i = _DE_CampTent_Placed_ACT_Menu.Show()
		if i == 0										;Sit
			if _DE_Setting_Help.GetValueInt() == 2 && _DE_HelpDone_Tents.GetValueInt() == 1
				_DE_Help_Tents.Show()
				_DE_HelpDone_Tents.SetValue(2)
			endif
			PlayerSit(akActionRef)
		elseif i == 1									;Lie Down
			if _DE_Setting_Help.GetValueInt() == 2 && _DE_HelpDone_Tents.GetValueInt() == 1
				_DE_Help_Tents.Show()
				_DE_HelpDone_Tents.SetValue(2)
			endif
			PlayerLieDown(akActionRef)
		elseif i == 2									;Pack
			StopFollowerUse()
			PackTent()
		elseif i == 3									;Lantern
			ToggleLantern()
		else
			;exit
		endif
	endif
endFunction

function CreatePositionArrays()
	myPlayerMarker_MainWeapon_Pos = new float[6]
	myPlayerMarker_OffHandWeapon_Pos = new float[6]
	myPlayerMarker_BigWeapon_Pos = new float[6]
	myPlayerMarker_Bow_Pos = new float[6]
	myPlayerMarker_Helm_Pos = new float[6]
	myPlayerMarker_Boots_Pos = new float[6]
	myPlayerMarker_Gauntlets_Pos = new float[6]
	myPlayerMarker_Backpack_Pos = new float[6]
	myPlayerMarker_Shield_Pos = new float[6]
	myPlayerMarker_ShieldInterior_Pos = new float[6]
	myFollowerAMarker_MainWeapon_Pos = new float[6]
	myFollowerAMarker_OffHandWeapon_Pos = new float[6]
	myFollowerAMarker_BigWeapon_Pos = new float[6]
	myFollowerAMarker_Bow_Pos = new float[6]
	myFollowerAMarker_Shield_Pos = new float[6]
	myFollowerBMarker_MainWeapon_Pos = new float[6]
	myFollowerBMarker_OffHandWeapon_Pos = new float[6]
	myFollowerBMarker_BigWeapon_Pos = new float[6]
	myFollowerBMarker_Bow_Pos = new float[6]
	myFollowerBMarker_Shield_Pos = new float[6]
	myFollowerCMarker_MainWeapon_Pos = new float[6]
	myFollowerCMarker_OffHandWeapon_Pos = new float[6]
	myFollowerCMarker_BigWeapon_Pos = new float[6]
	myFollowerCMarker_Bow_Pos = new float[6]
	myFollowerCMarker_Shield_Pos = new float[6]
	myGroundCover_Pos = new float[6]
	myTent_Pos = new float[6]
	myLanternLit_Pos = new float[6]
	myLanternLit2_Pos = new float[6]
	myLanternLit3_Pos = new float[6]
	myLanternUnlit_Pos = new float[6]
	myLanternUnlit2_Pos = new float[6]
	myLanternUnlit3_Pos = new float[6]
	myLanternLight_Pos = new float[6]
	myLanternLight2_Pos = new float[6]
	myLanternLight3_Pos = new float[6]
	myPlayerSitMarker_Pos = new float[6]
	myPlayerLayDownMarker_Pos = new float[6]
	myExitFront_Pos = new float[6]
	myBedRoll_Pos = new float[6]
	mySpareBedRoll1_Pos = new float[6]
	mySpareBedRoll2_Pos = new float[6]
	mySpareBedRoll3_Pos = new float[6]
	mySelf_Pos = new float[6]
endFunction

function ShowSitMenu(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		float myEP
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
		int i
		i = _DE_CampTent2_SitMenu.Show(0, 0)
		if i == 0										;Wait
			ToggleLantern()
		elseif i == 1
			if IsRefInInterior(PlayerRef)
				_DE_TentSeeThruError.Show()
			else
				if myTentExterior.IsDisabled()
					_DE_TentSeeThru.SetValue(1)
					if myTentExterior
						myTentExterior.Enable(true)
					endif
				else
					_DE_TentSeeThru.SetValue(2)
					if myTentExterior
						myTentExterior.Disable(true)
					endif
				endif
			endif
		elseif i == 2
			myPlayerSitMarker.Activate(myActor)
			StopFollowerUse()
		elseif i == 3
			;do nothing
		endif
	endif
endFunction

function ShowLayMenu(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		float myEP
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
		int i
		i = _DE_CampTent2_LayMenu.Show(0, 0)
		if i == 0										;Sleep
			bGettingUp = true
			_DE_FadeDown.Apply()
			wait(1.0)
			_DE_FadeDown.PopTo(_DE_Black)
			if myActor
				myActor.MoveTo(self)			;Get up
				wait(0.4)
				myBedRoll.Activate(myActor)		;Spawns sleep menu
				wait(0.4)
				myPlayerLayDownMarker.Activate(myActor)
				
				wait(3.5)
				ApplySnow()
				_DE_Black.PopTo(_DE_FadeUp)
			else
				;Something went wrong, make sure that the player's vision is restored!
				_DE_Black.PopTo(_DE_FadeUp)
			endif
			bGettingUp = false
		elseif i == 1									;Lantern
			ToggleLantern()
		elseif i == 2 									;Toggle View
			if IsRefInInterior(PlayerRef)
				_DE_TentSeeThruError.Show()
			else
				if myTentExterior.IsDisabled()
					_DE_TentSeeThru.SetValue(1)
					if myTentExterior
						myTentExterior.Enable(true)
					endif
				else
					_DE_TentSeeThru.SetValue(2)
					if myTentExterior
						myTentExterior.Disable(true)
					endif
				endif
			endif
		elseif i == 3									;Get Up
			myPlayerLayDownMarker.Activate(myActor)
			StopFollowerUse()
		elseif i == 3									;Nothing
			;do nothing
		endif
	endif
endFunction

function ToggleLantern()

	if bLanternLit
		if myLanternLit
			myLanternLit.Disable()
		endif
		if myLanternLit2
			myLanternLit2.Disable()
		endif
		if myLanternLit3
			myLanternLit3.Disable()
		endif
		if myLanternUnlit
			myLanternUnlit.Enable()
		endif
		if myLanternUnlit2
			myLanternUnlit2.Enable()
		endif
		if myLanternUnlit3
			myLanternUnlit3.Enable()
		endif
		if myLanternLight
			myLanternLight.Disable()
		endif
		if myLanternLight2
			myLanternLight2.Disable()
		endif
		if myLanternLight3
			myLanternLight3.Disable()
		endif
		bLanternLit = false
	else
		if myLanternLit
			myLanternLit.Enable()
		endif
		if myLanternLit2
			myLanternLit2.Enable()
		endif
		if myLanternLit3
			myLanternLit3.Enable()
		endif
		if myLanternUnlit
			myLanternUnlit.Disable()
		endif
		if myLanternUnlit2
			myLanternUnlit2.Disable()
		endif
		if myLanternUnlit3
			myLanternUnlit3.Disable()
		endif
		if myLanternLight
			myLanternLight.Enable()
		endif
		if myLanternLight2
			myLanternLight2.Enable()
		endif
		if myLanternLight3
			myLanternLight3.Enable()
		endif
		bLanternLit = true
	endif
endFunction

function PlayerSit(ObjectReference akActionRef)

	TryToMakeFollowersUse()

	Game.ForceThirdPerson()
	myPlayerSitMarker.Activate(myActor)
	if _DE_Setting_CampingArmorTakeOff.GetValueInt() == 2
		;@TODO: Use new gear processing function	
		;if Frostfall.GetFireState() || _DE_CurrentTemp.GetValue() >= 6.0 || Frostfall.bInInterior
			DisplayBoots_Player()
			DisplayGauntlets_Player()
			DisplayHelm_Player()
			DisplayShield_Player()
			DisplayWeapons_Player()
			DisplayQuiver_Player()
			DisplayBackpack_Player()
		;else
		;	DisplayShield_Player()
		;	DisplayWeapons_Player()
		;	DisplayQuiver_Player()
		;	DisplayBackpack_Player()
		;endif
	endif
	if _DE_TentSeeThru.GetValueInt() == 2 && myTentExterior
		myTentExterior.Disable(true)
	endif
	Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
	wait(3.0)
	if !(myActor.IsInCombat())
		ShowSitMenu(akActionRef)
	endif
	_DE_Tent_InteractTriggerREF.MoveTo(myActor)
	RegisterForSingleUpdate(0.5)
endFunction

function PlayerLieDown(ObjectReference akActionRef)

	;===============================Frostfall 2.3 / Skyrim 1.9 Update===================================
	;
	;  Skyrim 1.9 has broken the player's eyes from re-opening if you lie down (sleepstate = 4).
	;  Using alternative lie down animation.
	;
	;===================================================================================================
	
	;Don't lie down in tent if on the Dark Brotherhood entrance quest
	if DBEntranceQuest.GetStage() == 20 && DBEntranceQuestScript.pSleepyTime == 1
		myBedRoll.Activate(akActionRef)
		return
	endif

	;Don't lie down in tent if DLC2 is loaded, the player is in Solstheim, and DLC2MQ03B isn't complete yet
	if Compatibility.isDLC2Loaded
		Quest DLC2MQ03B = Game.GetFormFromFile(0x02035440, "Dragonborn.esm") as Quest
		Location DLC2SolstheimLocation = Game.GetFormFromFile(0x02016E2A, "Dragonborn.esm") as Location
		Worldspace DLC2SolstheimWorld = Game.GetFormFromFile(0x02000800, "Dragonborn.esm") as Worldspace

		if DLC2MQ03B.IsCompleted() == false && PlayerRef.IsInLocation(DLC2SolstheimLocation)
			if PlayerRef.GetWorldspace() == DLC2SolstheimWorld
				myBedRoll.Activate(akActionRef)
				return
			endif
		endif
	endif

	TryToMakeFollowersUse()

	Game.ForceThirdPerson()
	myPlayerLayDownMarker.Activate(myActor)
	if _DE_Setting_CampingArmorTakeOff.GetValueInt() == 2
		;@TODO: Wrap in IsFrostfallLoaded
		
		;if Frostfall.GetFireState() || _DE_CurrentTemp.GetValue() >= 10.0 || Frostfall.bInInterior
			DisplayBoots_Player()
			DisplayGauntlets_Player()
			DisplayHelm_Player()
			DisplayShield_Player()
			DisplayWeapons_Player()
			DisplayQuiver_Player()
			DisplayBackpack_Player()
		;else
		;	DisplayShield_Player()
		;	DisplayWeapons_Player()
		;	DisplayQuiver_Player()
		;	DisplayBackpack_Player()
		;endif
	endif
	if _DE_TentSeeThru.GetValueInt() == 2 && myTentExterior
		myTentExterior.Disable(true)
	endif
	Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
	wait(3.0)
	if !(myActor.IsInCombat())
		ShowLayMenu(akActionRef)
	endif
	_DE_Tent_InteractTriggerREF.MoveTo(myActor)
	RegisterForSingleUpdate(0.5)
	
endFunction

function ApplySnow()
	
	Weather myWeather = Weather.GetCurrentWeather()

	bool bShowExterior = false
	if myTentExterior == none
		bShowExterior = true
	endif

	if myWeather.GetClassification() == 3
		if Compatibility.isDLC2Loaded
			if myWeather == Compatibility.DLC2AshStorm
				myTentExterior = myAshTent
			else
				myTentExterior = mySnowTent
			endif
		else
			myTentExterior = mySnowTent
		endif
	else
		if myTentExterior == mySnowTent || myTentExterior == myAshTent
			return
		endif
		myTentExterior = myNormalTent
	endif

	if bShowExterior
		myNormalTent.Disable()
		mySnowTent.Disable()
		myAshTent.Disable()
		if myTentExterior
			myTentExterior.Enable(true)
		endif
	endif

endFunction

function TryToMakeFollowersUse()
	;debug.trace("[Frostfall] Trying to make NPC sleep...")
	;Move bedroll out of range of NPCs, so they won't path here
	myBedRoll.SetPosition(myBedRoll.GetPositionX(), myBedRoll.GetPositionY(), myBedRoll.GetPositionZ() + 3000.0)
	_DE_FollowersUseBedrollAI.SetValueInt(1)
endFunction

function StopFollowerUse()
	;debug.trace("[Frostfall] Trying to make NPC stop sleeping...")
	;Move bedroll back in range
	myBedRoll.SetPosition(self.GetPositionX(), self.GetPositionY(), self.GetPositionZ())
	_DE_FollowersUseBedrollAI.SetValueInt(0)
endFunction

float[] function GetPosXYZRotateAroundRef(ObjectReference akOrigin, ObjectReference akObject, float fAngleX, float fAngleY, float fAngleZ)

	;-----------\
	;Description \ 
	;----------------------------------------------------------------
	;Rotates a point (akObject) offset from the center of 
	;rotation (akOrigin) by the supplied degrees fAngleX, fAngleY,
	;fAngleZ, and returns the new position of the point.
	
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		fNewPos[0]	= 	The new X position of the point
	;		fNewPos[1]	= 	The new Y position of the point
	;		fNewPos[2]	= 	The new Z position of the point

	;				|1			0			0		|
	;Rx(t) = 		|0			cos(t)		-sin(t)	|
	;				|0			sin(t)		cos(t)	|
	;
	;				|cos(t)		0			sin(t)	|
	;Ry(t) =		|0			1			0		|
	;				|-sin(t)	0			cos(t)	|
	;
	;				|cos(t)		-sin(t)		0		|
	;Rz(t) = 		|sin(t)		cos(t)		0		|
	;				|0			0			1		|
	
	;R * v = Rv, where R = rotation matrix, v = column vector of point [ x y z ], Rv = column vector of point after rotation
		
	fAngleX = -(fAngleX)
	fAngleY = -(fAngleY)
	fAngleZ = -(fAngleZ)
	
	float myOriginPosX = akOrigin.GetPositionX()
	float myOriginPosY = akOrigin.GetPositionY()
	float myOriginPosZ = akOrigin.GetPositionZ()
	
	float fInitialX = akObject.GetPositionX() - myOriginPosX
	float fInitialY = akObject.GetPositionY() - myOriginPosY
	float fInitialZ = akObject.GetPositionZ() - myOriginPosZ
	
	float fNewX
	float fNewY
	float fNewZ
	
	;Objects in Skyrim are rotated in order of Z, Y, X, so we will do that here as well.
	
	;Z-axis rotation matrix
	float fVectorX = fInitialX
	float fVectorY = fInitialY
	float fVectorZ = fInitialZ
	fNewX = (fVectorX * cos(fAngleZ)) + (fVectorY * sin(-fAngleZ)) + (fVectorZ * 0)
	fNewY = (fVectorX * sin(fAngleZ)) + (fVectorY * cos(fAngleZ)) + (fVectorZ * 0)
	fNewZ = (fVectorX * 0) + (fVectorY * 0) + (fVectorZ * 1)	
	
	;Y-axis rotation matrix
	fVectorX = fNewX
	fVectorY = fNewY
	fVectorZ = fNewZ
	fNewX = (fVectorX * cos(fAngleY)) + (fVectorY * 0) + (fVectorZ * sin(fAngleY))
	fNewY = (fVectorX * 0) + (fVectorY * 1) + (fVectorZ * 0)
	fNewZ = (fVectorX * sin(-fAngleY)) + (fVectorY * 0) + (fVectorZ * cos(fAngleY))
	
	;X-axis rotation matrix
	fVectorX = fNewX
	fVectorY = fNewY
	fVectorZ = fNewZ	
	fNewX = (fVectorX * 1) + (fVectorY * 0) + (fVectorZ * 0)
	fNewY = (fVectorX * 0) + (fVectorY * cos(fAngleX)) + (fVectorZ * sin(-fAngleX))
	fNewZ = (fVectorX * 0) + (fVectorY * sin(fAngleX)) + (fVectorZ * cos(fAngleX))
	
	;Return result
	float[] fNewPos = new float[3]
	fNewPos[0] = fNewX
	fNewPos[1] = fNewY
	fNewPos[2] = fNewZ
	return fNewPos 
endFunction

float[] function GetAngleData(ObjectReference akObjectReference)
	float[] myReturnArray = new float[3]
    myReturnArray[0] = akObjectReference.GetAngleX()
    myReturnArray[1] = akObjectReference.GetAngleY()
    myReturnArray[2] = akObjectReference.GetAngleZ()
	return myReturnArray
endFunction

float[] function GetRelativePosition(ObjectReference akOrigin, ObjectReference akObject)
	float[] myRelativePosition = new float[6]
	myRelativePosition[0] = akObject.GetPositionX() - akOrigin.GetPositionX()
	myRelativePosition[1] = akObject.GetPositionY() - akOrigin.GetPositionY()
	myRelativePosition[2] = akObject.GetPositionZ() - akOrigin.GetPositionZ()
	myRelativePosition[3] = akObject.GetAngleX()
	myRelativePosition[4] = akObject.GetAngleY()
	myRelativePosition[5] = akObject.GetAngleZ()
	
	;trace("[FROSTFALL] My relative position is XPos:" + myRelativePosition[0] + ", YPos:" + myRelativePosition[1] + ", ZPos:" + myRelativePosition[2] + "XRot:" + myRelativePosition[3] + ", YRot:" + myRelativePosition[4] + ", ZRot:" + myRelativePosition[5])
	return myRelativePosition
endFunction

ObjectReference function PlaceAtMeRelative(ObjectReference akOrigin, Form akFormToPlace, float[] fOriginAng, float[] fRelativePos, float fZGlobalAngAdjust = 0.0, float fXLocalAngAdjust = 0.0, float fYLocalAngAdjust = 0.0, float fZLocalAngAdjust = 0.0, float fZHangingOffset = 0.0, bool abInvertedLocalY = false, bool abInitiallyDisabled = false, bool abIsPropped = false, bool abIsHanging = false)
	
	ObjectReference myObject
    ObjectReference myTempMarker = akOrigin.PlaceAtMe(XMarker)
	
	myTempMarker.MoveTo(myTempMarker, fRelativePos[0], fRelativePos[1], fRelativePos[2])
    
	float[] myNewPos = new float[3]
    myNewPos = GetPosXYZRotateAroundRef(akOrigin, myTempMarker, fOriginAng[0], fOriginAng[1], fOriginAng[2] + fZGlobalAngAdjust)
    myTempMarker.MoveTo(akOrigin, myNewPos[0], myNewPos[1], myNewPos[2])
	
	if abIsPropped
		if abInvertedLocalY
			myTempMarker.SetAngle(fXLocalAngAdjust, -(fOriginAng[2] + fYLocalAngAdjust), fZLocalAngAdjust)
		else
			myTempMarker.SetAngle(fXLocalAngAdjust, fOriginAng[2] + fYLocalAngAdjust, fZLocalAngAdjust)
		endif
	elseif abIsHanging
		myTempMarker.MoveTo(myTempMarker, afZOffset = fZHangingOffset)
		myTempMarker.SetAngle(0.0, 0.0, myTempMarker.GetAngleZ() + fRelativePos[5] + fZLocalAngAdjust)
	else
		myTempMarker.SetAngle(myTempMarker.GetAngleX() + fRelativePos[3] + fXLocalAngAdjust, myTempMarker.GetAngleY() + fRelativePos[4] + fYLocalAngAdjust, myTempMarker.GetAngleZ() + fRelativePos[5] + fZLocalAngAdjust)
	endif
	
	if abInitiallyDisabled
		myObject = myTempMarker.PlaceAtMe(akFormToPlace, abInitiallyDisabled = true)
	else
		myObject = myTempMarker.PlaceAtMe(akFormToPlace)
	endif
    
	myTempMarker.Disable()
    myTempMarker.Delete()
	
    return myObject
endFunction


function DisplayShield_Player()
	myShield = myActor.GetEquippedShield()
	if myShield
		myActor.UnequipItem(myShield, abSilent = true)
		if IsRefInInterior(PlayerRef)
			myDisplayShield = myPlayerMarker_ShieldInterior.PlaceAtMe(myShield)
		else
			myDisplayShield = myPlayerMarker_Shield.PlaceAtMe(myShield)
		endif
		if myDisplayShield
			while !myDisplayShield.Is3DLoaded()
			endwhile
			myDisplayShield.SetMotionType(Motion_Keyframed)
			myDisplayShield.BlockActivation()
		endif
	endif
endFunction

function UnDisplayShield_Player()
	if myShield
		myActor.EquipItem(myShield, abSilent = true)
	endif
	if myDisplayShield
		myDisplayShield.Disable()
		myDisplayShield.Delete()
	endif
endFunction

function DisplayWeapons_Player()
	int iWeaponType = myActor.GetEquippedItemType(1)
	if (iWeaponType <= 4 || iWeaponType == 8) && iWeaponType > 0
		;Player has a one-handed weapon
		myMainWeapon = myActor.GetEquippedWeapon()
		;Does the player have an off-hand weapon?
		int iOffWeaponType = myActor.GetEquippedItemType(0)
		if (iOffWeaponType <= 4 || iOffWeaponType == 8) && iOffWeaponType > 0
			;Player has an off-hand weapon
			myOffHandWeapon = myActor.GetEquippedWeapon(true)
		endif
	elseif iWeaponType == 5 || iWeaponType == 6
		;Player has a two-handed weapon
		myBigWeapon = myActor.GetEquippedWeapon()
	elseif iWeaponType == 7
		myBow = myActor.GetEquippedWeapon()
	endif
	
	if myMainWeapon
		myActor.UnequipItem(myMainWeapon, abSilent = true)
		if IsRefInInterior(PlayerRef)
			myDisplayMainWeapon = myPlayerMarker_MainWeapon.PlaceAtMe(myMainWeapon)
		else
			if myMainWeapon != _DE_WalkingStickWarAxe
				myDisplayMainWeapon = myPlayerMarker_MainWeapon.PlaceAtMe(myMainWeapon)
			endif
		endif
		if myDisplayMainWeapon
			while !myDisplayMainWeapon.Is3DLoaded()
			endwhile
			myDisplayMainWeapon.SetMotionType(Motion_Keyframed)
			myDisplayMainWeapon.BlockActivation()
		endif
	endif
	
	if myOffHandWeapon
		if IsRefInInterior(PlayerRef)
			myDisplayOffHandWeapon = myPlayerMarker_OffHandWeapon.PlaceAtMe(myOffHandWeapon)
		else
			if myOffHandWeapon != _DE_WalkingStickWarAxe
				myDisplayOffHandWeapon = myPlayerMarker_OffHandWeapon.PlaceAtMe(myOffHandWeapon)
			endif
		endif
		if myDisplayOffHandWeapon
			while !myDisplayOffHandWeapon.Is3DLoaded()
			endwhile
			myDisplayOffHandWeapon.SetMotionType(Motion_Keyframed)
			myDisplayOffHandWeapon.BlockActivation()
		endif
	endif
	
	if myBigWeapon
		UnequipUsingDummyWeapon()
		myDisplayBigWeapon = myPlayerMarker_BigWeapon.PlaceAtMe(myBigWeapon)
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
endfunction

function UnDisplayWeapons_Player()
	
	if myMainWeapon
		myActor.EquipItem(myMainWeapon, abSilent = true)
		myMainWeapon = none
	endif
	if myDisplayMainWeapon
		myDisplayMainWeapon.Disable()
		myDisplayMainWeapon.Delete()
	endif
	
	if myOffHandWeapon
		myOffHandWeapon = none
	endif
	if myDisplayOffHandWeapon
		myDisplayOffHandWeapon.Disable()
		myDisplayOffHandWeapon.Delete()
	endif

	if myBigWeapon
		myActor.EquipItem(myBigWeapon, abSilent = true)
		myBigWeapon = none
	endif
	if myDisplayBigWeapon
		myDisplayBigWeapon.Disable()
		myDisplayBigWeapon.Delete()
	endif
	
	if myBow
		myActor.EquipItem(myBow, abSilent = true)
		myBow = none
	endif
	if myDisplayBow
		myDisplayBow.Disable()
		myDisplayBow.Delete()
	endif
	
endFunction

function DisplayWeapon_Follower()
	;myFollowerAMarker
endFunction

function UnDisplayWeapon_Follower()

endFunction

function DisplayBoots_Player()
	myBoots = GetPlayerEquippedFeet()
	if myBoots && !myBoots.HasKeyword(ClothingBody) && !myBoots.HasKeyword(ArmorCuirass)
		myActor.UnequipItem(myBoots, abSilent = true)
		myDisplayBoots = myPlayerMarker_Boots.PlaceAtMe(myBoots)
		if myDisplayBoots
			while !myDisplayBoots.Is3DLoaded()
			endwhile
			myDisplayBoots.SetMotionType(Motion_Keyframed)
			myDisplayBoots.BlockActivation()
		endif
	endif
endFunction

function UnDisplayBoots_Player()
	if myBoots
		myActor.EquipItem(myBoots, abSilent = true)
	endif
	if myDisplayBoots
		myDisplayBoots.Disable()
		myDisplayBoots.Delete()
	endif
endFunction

function DisplayGauntlets_Player()
	myGauntlets = GetPlayerEquippedHands()
	if myGauntlets && !myGauntlets.HasKeyword(ClothingBody) && !myGauntlets.HasKeyword(ArmorCuirass)
		myActor.UnequipItem(myGauntlets, abSilent = true)
		myDisplayGauntlets = myPlayerMarker_Gauntlets.PlaceAtMe(myGauntlets)
		if myDisplayGauntlets
			while !myDisplayGauntlets.Is3DLoaded()
			endwhile
			myDisplayGauntlets.SetMotionType(Motion_Keyframed)
			myDisplayGauntlets.BlockActivation()
		endif
	endif
endFunction

function UnDisplayGauntlets_Player()
	if myGauntlets
		myActor.EquipItem(myGauntlets, abSilent = true)
	endif
	if myDisplayGauntlets
		myDisplayGauntlets.Disable()
		myDisplayGauntlets.Delete()
	endif
endFunction

function DisplayHelm_Player()
	myHelm = GetPlayerEquippedHead()
	if myHelm && !myHelm.HasKeyword(ClothingBody) && !myHelm.HasKeyword(ArmorCuirass)
		myActor.UnequipItem(myHelm, abSilent = true)
		myDisplayHelm = myPlayerMarker_Helm.PlaceAtMe(myHelm)
		if myDisplayHelm
			while !myDisplayHelm.Is3DLoaded()
			endwhile
			myDisplayHelm.SetMotionType(Motion_Keyframed)
			myDisplayHelm.BlockActivation()
		endif
	endif
endfunction

function UnDisplayHelm_Player()
	if myHelm
		myActor.EquipItem(myHelm, abSilent = true)
	endif
	if myDisplayHelm
		myDisplayHelm.Disable()
		myDisplayHelm.Delete()
	endif
endFunction

function DisplayQuiver_Player()
	;Just unequip the quiver
	myQuiver = GetPlayerEquippedAmmo()
	if myQuiver
		myActor.UnequipItem(myQuiver, abSilent = true)
	endif
endfunction

function UnDisplayQuiver_Player()
	;Just re-equip the quiver
	if myQuiver
		myActor.EquipItem(myQuiver, abSilent = true)
	endif
endFunction

function DisplayBackpack_Player()
	myBackpack = GetPlayerEquippedBackpack()
	if myBackpack
		myActor.UnequipItem(myBackpack, abSilent = true)
		myDisplayBackpack = myPlayerMarker_Backpack.PlaceAtMe(myBackpack)
		if myDisplayBackpack
			while !myDisplayBackpack.Is3DLoaded()
			endwhile
			myDisplayBackpack.SetMotionType(Motion_Keyframed)
			myDisplayBackpack.BlockActivation()
		endif
	endif
endfunction

function UnDisplayBackpack_Player()
	if myBackpack
		myActor.EquipItem(myBackpack, abSilent = true)
	endif
	if myDisplayBackpack
		myDisplayBackpack.Disable()
		myDisplayBackpack.Delete()
	endif
endFunction

function PackTent()

	;Are any of the bed rolls in use?
	if myBedRoll
		if myBedRoll.IsFurnitureInUse()
			_DE_CampTent2_PickUpError.Show()
			return
		endif
	endif
	if mySpareBedRoll1
		if mySpareBedRoll1.IsFurnitureInUse()
			_DE_CampTent2_PickUpError.Show()
			return
		endif
	endif
	if mySpareBedRoll2
		if mySpareBedRoll2.IsFurnitureInUse()
			_DE_CampTent2_PickUpError.Show()
			return
		endif
	endif
	if mySpareBedRoll3
		if mySpareBedRoll3.IsFurnitureInUse()
			_DE_CampTent2_PickUpError.Show()
			return
		endif
	endif
	
	myActor.AddItem(TentMiscItem, abSilent = true)
	
	;Move activation cubes to the anchor
	_DE_Tent_StopWaitTriggerREF.MoveTo(_DE_Anchor)
	_DE_Tent_InteractTriggerREF.MoveTo(_DE_Anchor)

	;Delete display models, if any
	UnDisplayShield_Player()
	UnDisplayWeapons_Player()
	UnDisplayBoots_Player()
	UnDisplayGauntlets_Player()
	UnDisplayHelm_Player()
	UnDisplayQuiver_Player()
	UnDisplayBackpack_Player()	
	
	;Check for variable population - Papyrus log error prevention
	;Delete markers and furniture
	if myPlayerMarker_MainWeapon
		myPlayerMarker_MainWeapon.Disable()
		myPlayerMarker_MainWeapon.Delete()
	endif
	if myPlayerMarker_OffHandWeapon
		myPlayerMarker_OffHandWeapon.Disable()
		myPlayerMarker_OffHandWeapon.Delete()
	endif
	if myPlayerMarker_BigWeapon
		myPlayerMarker_BigWeapon.Disable()
		myPlayerMarker_BigWeapon.Delete()
	endif
	if myPlayerMarker_Bow
		myPlayerMarker_Bow.Disable()
		myPlayerMarker_Bow.Delete()
	endif
	if myPlayerMarker_Helm
		myPlayerMarker_Helm.Disable()
		myPlayerMarker_Helm.Delete()
	endif
	if myPlayerMarker_Boots
		myPlayerMarker_Boots.Disable()
		myPlayerMarker_Boots.Delete()
	endif
	if myPlayerMarker_Gauntlets
		myPlayerMarker_Gauntlets.Disable()
		myPlayerMarker_Gauntlets.Delete()
	endif
	if myPlayerMarker_Backpack
		myPlayerMarker_Backpack.Disable()
		myPlayerMarker_Backpack.Delete()
	endif
	if myPlayerMarker_Shield
		myPlayerMarker_Shield.Disable()
		myPlayerMarker_Shield.Delete()
	endif
	if myPlayerMarker_ShieldInterior
		myPlayerMarker_ShieldInterior.Disable()
		myPlayerMarker_ShieldInterior.Delete()
	endif
	if myGroundCover
		myGroundCover.Disable()
		myGroundCover.Delete()
	endif
	if myPlayerSitMarker
		myPlayerSitMarker.Disable()
		myPlayerSitMarker.Delete()
	endif
	if myPlayerLayDownMarker
		myPlayerLayDownMarker.Disable()
		myPlayerLayDownMarker.Delete()
	endif
	if myExitFront
		myExitFront.Disable()
		myExitFront.Delete()
	endif
	if myBedRoll
		myBedRoll.Disable()
		myBedRoll.Delete()
	endif	
	if myWard
		myWard.Disable()
		myWard.Delete()
	endif
	
	;Delete the lantern(s)
	if myLanternLit
		myLanternLit.Disable()
		myLanternLit.Delete()
	endif
	if myLanternUnlit
		myLanternUnlit.Disable()
		myLanternUnlit.Delete()
	endif
	if myLanternLight
		myLanternLight.Disable()
		myLanternLight.Delete()
	endif
	
	if myLanternLit2
		myLanternLit2.Disable()
		myLanternLit2.Delete()
	endif
	if myLanternUnlit2
		myLanternUnlit2.Disable()
		myLanternUnlit2.Delete()
	endif
	if myLanternLight2
		myLanternLight2.Disable()
		myLanternLight2.Delete()
	endif
	
	if myLanternLit3
		myLanternLit3.Disable()
		myLanternLit3.Delete()
	endif
	if myLanternUnlit3
		myLanternUnlit3.Disable()
		myLanternUnlit3.Delete()
	endif
	if myLanternLight3
		myLanternLight3.Disable()
		myLanternLight3.Delete()
	endif
	
	if mySpareBedRoll1
		mySpareBedRoll1.Disable()
		mySpareBedRoll1.Delete()
	endif
	
	if mySpareBedRoll2
		mySpareBedRoll2.Disable()
		mySpareBedRoll2.Delete()
	endif
	
	if mySpareBedRoll3
		mySpareBedRoll3.Disable()
		mySpareBedRoll3.Delete()
	endif
	
	;Delete the snow tent
	if mySnowTent
		mySnowTent.Disable()
		mySnowTent.Delete()
	endif
	
	;Delete the ash tent
	if myAshTent
		myAshTent.Disable()
		myAshTent.Delete()
	endif
	
	;Delete the tent exterior object
	if myNormalTent
		myNormalTent.Disable()
		myNormalTent.Delete()
	endif

	;Delete the tent object
	if myTent
		myTent.Disable()
		myTent.Delete()
	endif

	wait(0.2)
	ITMGenericArmorUp.Play(self)

	StopFollowerUse()
	
	;Finally, delete myself
	self.Disable()
	self.Delete()

endFunction

function CleanUpTent()
	Game.EnablePlayerControls()
	UnDisplayShield_Player()
	UnDisplayWeapons_Player()
	UnDisplayBoots_Player()
	UnDisplayGauntlets_Player()
	UnDisplayHelm_Player()
	UnDisplayQuiver_Player()
	UnDisplayBackpack_Player()

	_DE_Tent_StopWaitTriggerREF.MoveTo(_DE_Anchor)
	_DE_Tent_InteractTriggerREF.MoveTo(_DE_Anchor)
	;_DE_HoursToSleep.SetValue(1.0)
	if myTentExterior
		myTentExterior.Enable(true)
	endif
	myActor = none
endFunction

function UnequipUsingDummyWeapon()
	myActor.AddItem(_DE_DummyWeapon, abSilent = true)
	myActor.EquipItem(_DE_DummyWeapon, abSilent = true)
	myActor.UnEquipItem(_DE_DummyWeapon, abSilent = true)
	myActor.RemoveItem(_DE_DummyWeapon, abSilent = true)
endFunction

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