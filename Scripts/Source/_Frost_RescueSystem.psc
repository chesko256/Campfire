scriptname _Frost_RescueSystem extends _Frost_BaseSystem

import Math
import Utility
import CampUtil
import FrostUtil
import _FrostInternal

Actor property PlayerRef auto
_Frost_Compatibility property Compatibility auto
GlobalVariable property GameHour auto
Book property _Frost_RobLetterSettlement_Riverwood auto
Book property _Frost_RobLetterSettlement_Rorikstead auto
Book property _Frost_RobLetterSettlement_Kynesgrove auto
Book property _Frost_RobLetterSettlement_DragonBridge auto
Book property _Frost_RobLetterSettlement_Ivarstead auto
Book property _Frost_RobLetterSettlement_NightgateInn auto
Book property _Frost_RobLetterSettlement_Winterhold auto
Book property _Frost_RobLetterSettlement_Windhelm auto
Book property _Frost_RobLetterSettlement_Solitude auto
Book property _Frost_RobLetterSettlement_Markarth auto
Book property _Frost_RobLetterSettlement_Whiterun auto
Book property _Frost_RobLetterSettlement_Riften auto
Book property _Frost_RobLetterSettlement_Falkreath auto
Book property _Frost_RobLetterSettlement_Morthal auto
Book property _Frost_RobLetterSettlement_Dawnstar auto
Book property _Frost_RobLetterOther auto
Book property _Frost_RescueLetterSettlement auto
Book property _Frost_RescueLetterSpouse auto
Message property _Frost_RescueMsg_Failsafe auto
Message property _Frost_RescueMsg_A_1 auto
Message property _Frost_RescueMsg_A_2 auto
Message property _Frost_RescueMsg_F_1 auto
Message property _Frost_RescueMsg_F_2 auto
Message property _Frost_RescueMsg_F_3 auto
Message property _Frost_RescueMsg_F_4 auto
Message property _Frost_RescueMsg_F_5 auto
Message property _Frost_RescueMsg_D_1 auto
Message property _Frost_RescueMsg_D_2 auto
Message property _Frost_RescueMsg_D_3 auto
Message property _Frost_RescueMsg_D_4 auto
MiscObject property Gold001 auto
ReferenceAlias property Alias_LoveInterest auto
FormList property _Camp_Trees auto
ObjectReference property _Frost_RescueDestinationMarker auto
ObjectReference property _Frost_MarkerTamriel auto
ObjectReference property _Frost_MarkerRiverwood auto
ObjectReference property _Frost_MarkerRorikstead auto
ObjectReference property _Frost_MarkerKynesgrove auto
ObjectReference property _Frost_MarkerDragonbridge auto
ObjectReference property _Frost_MarkerIvarstead auto
ObjectReference property _Frost_MarkerNightgateInn auto
ObjectReference property _Frost_MarkerWinterhold auto
ObjectReference property _Frost_MarkerWindhelm auto
ObjectReference property _Frost_MarkerSolitude auto
ObjectReference property _Frost_MarkerMarkarth auto
ObjectReference property _Frost_MarkerWhiterun auto
ObjectReference property _Frost_MarkerRiften auto
ObjectReference property _Frost_MarkerFalkreath auto
ObjectReference property _Frost_MarkerMorthal auto
ObjectReference property _Frost_MarkerDawnstar auto
Sound property PHYGenericDirtHeavyH auto
ImageSpaceModifier property FadeToBlackImod auto
ImageSpaceModifier property FadeToBlackHoldImod auto
ImageSpaceModifier property SleepyTimeFadeIn auto
VisualEffect property _Camp_ForceBlackVFX auto
Idle property TG05_KnockOut auto
Idle property Idle_1stPersonWoozyGetUpFromBed auto
Static property COCMarkerHeading auto
Worldspace property Tamriel auto

; Campfire
Furniture property _Camp_Campfire auto
GlobalVariable property _Camp_LastUsedCampfireSize auto
Activator property _Camp_Fuel_Flickering_BranchesLit auto
Activator property _Camp_Fuel_Flickering_BranchesUnlit auto
Light property _Camp_Campfire_Light_3 auto

Actor follower1 = None
Actor follower2 = None
Actor follower3 = None
Actor animal = None
int rescueDestinationIndex = 0
float nearestDist = 0.0

function RegisterForEvents()
	GetEventEmitter_OnRescuePlayer().RegisterFormForModEventWithFallback("Frost_OnRescuePlayer", "OnRescuePlayer", self)
endFunction

Event OnRescuePlayer(bool bInWater)
	follower1 = GetTrackedFollower(1)
	follower2 = GetTrackedFollower(2)
	follower3 = GetTrackedFollower(3)
	animal = GetTrackedAnimal()
	RescuePlayer(bInWater)
endEvent

function RescuePlayer(bool bInWater = false)
	;Determine rescue type
	if GetTrackedFollowerCount() > 0
		bool will_build_fire

		RescueStart(bInWater)
		;Check trees
		if Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_Trees, PlayerRef, 3000.0) != none
			int i = RandomInt(1, 100)
			if i <= 20
				will_build_fire = true
			endif
		endif
		;Else, go to nearest location
		if !will_build_fire
			if PlayerRef.GetWorldspace() == Tamriel
				FindNearestRescueLocation()
				if IsBetweenInclusive(rescueDestinationIndex, 100, 199)
					RescueFollowerTakenToOther()
				elseif IsBetweenInclusive(rescueDestinationIndex, 200, 299)
					RescueFollowerPasserby()
				elseif IsBetweenInclusive(rescueDestinationIndex, 300, 399)
					RescueFollowerHunterCamp()
				elseif IsBetweenInclusive(rescueDestinationIndex, 400, 599)
					RescueFollowerTakenToNearestSettlement()
				endif
			elseif Compatibility.isDLC1Loaded == true && PlayerRef.GetWorldspace() == Compatibility.WS_FalmerValley
				RescueMovePlayerAndFollowers(none, 14107, 19076, 1924, 20.77)
			elseif Compatibility.isDLC2Loaded == true && PlayerRef.GetWorldspace() == Compatibility.WS_Solstheim
				FindNearestSettlementDLC2()
				GoToNearestSettlementDLC2()
				;@TODO: message
			else
				;Failsafe!
				GoToRandomSettlement()
				RescueFailsafeMessage()
			endif
		else
			RescueFollowerBuildsCampfire()
		endif
		RescueEnd()
		return
	
	elseif animal != none			;Dog Rescues
		
		RescueStart(bInWater)
		if PlayerRef.GetWorldspace() == Tamriel
			FindNearestRescueLocation()
			if IsBetweenInclusive(rescueDestinationIndex, 100, 199)
				RescueDogTakenToOther()
			elseif IsBetweenInclusive(rescueDestinationIndex, 200, 299)
				RescueDogPasserby()
			elseif IsBetweenInclusive(rescueDestinationIndex, 300, 399)
				RescueDogHunterCamp()
			elseif IsBetweenInclusive(rescueDestinationIndex, 400, 599)
				RescueDogTakenToNearestSettlement()
			endif
		elseif Compatibility.isDLC1Loaded == true && PlayerRef.GetWorldspace() == Compatibility.WS_FalmerValley
			RescueMovePlayerAndFollowers(none, 14107, 19076, 1924, 20.77)
		elseif Compatibility.isDLC2Loaded == true && PlayerRef.GetWorldspace() == Compatibility.WS_Solstheim
			FindNearestSettlementDLC2()
			GoToNearestSettlementDLC2()
			;message
		else
			;Failsafe!
			GoToRandomSettlement()
			RescueFailsafeMessage()
		endif
		RescueEnd()
		return
	else 											;Alone Rescues
		RescueStart(bInWater)
		if PlayerRef.GetWorldspace() == Tamriel
			;Is player near a hunter camp?
			if CheckNearHunterCamp()
				RescueAloneHunterCamp()
			;Is player near passersby?
			elseif CheckNearPasserby()
				RescueAlonePasserby()
			;Decide random fate
			else
				if Alias_LoveInterest.GetActorRef() != none
					int i = RandomInt(1, 100)
					if IsBetweenInclusive(i, 1, 25)
						RescueAloneTakenToDistantSettlement()
					elseif IsBetweenInclusive(i, 26, 50)
						RescueAloneTakenToDistantSettlementAndRobbed()
					elseif IsBetweenInclusive(i, 51, 75)
						RescueAloneTakenHomeToSpouse()
					elseif IsBetweenInclusive(i , 76, 100)
						RescueAloneTakenToOtherAndRobbed()
					endif
				else
					int i = RandomInt(1, 100)
					if IsBetweenInclusive(i, 1, 33)
						RescueAloneTakenToDistantSettlement()
					elseif IsBetweenInclusive(i, 34, 66)
						RescueAloneTakenToDistantSettlementAndRobbed()
					elseif IsBetweenInclusive(i , 67, 100)
						RescueAloneTakenToOtherAndRobbed()
					endif
				endif
			endif
		elseif Compatibility.isDLC1Loaded == true && PlayerRef.GetWorldspace() == Compatibility.WS_FalmerValley
			RescueMovePlayerAndFollowers(none, 14107, 19076, 1924, 20.77)
		elseif Compatibility.isDLC2Loaded == true && PlayerRef.GetWorldspace() == Compatibility.WS_Solstheim
			FindNearestSettlementDLC2()
			GoToNearestSettlementDLC2()
			;message
		else
			;Failsafe!
			GoToRandomSettlement()
			RescueFailsafeMessage()
		endif
		RescueEnd()
		return
	endif
endFunction

float function GetDistanceWithPos(float firstX, float firstY, float firstZ, float secondX, float secondY, float secondZ)
	float a = abs(pow((firstZ - secondZ), 2))
	float b = abs(pow((firstY - secondY), 2))
	float c = abs(pow((firstX - secondX), 2))
	float h = a + b + c
	h = sqrt(h)
	;debug.trace("[Frostfall] Distance: " + h)
	return h
endFunction

int function GetNearerIndex(float firstX, float firstY, float firstZ, float secondX, float secondY, float secondZ, int newIndex)
	float tempDist = GetDistanceWithPos(firstX, firstY, firstZ, secondX, secondY, secondZ)
	if tempDist < nearestDist
		nearestDist = tempDist
		return newIndex
	else
		return rescueDestinationIndex
	endif
endFunction

function RescueStart(bool bInWater = false)
	Game.ForceFirstPerson()
	Game.DisablePlayerControls(true,true,true,true,true,true)
	Utility.Wait(0.2)
	
	if bInWater == false
		PlayerRef.PlayIdle(TG05_KnockOut)
		Wait(1.1)
	endif
	FadeToBlackImod.ApplyCrossFade()
	if bInWater == false
		Wait(1.1)
		PHYGenericDirtHeavyH.Play(PlayerRef)
		Wait(0.1)
		PHYGenericDirtHeavyH.Play(PlayerRef)
		Wait(0.8)
		PHYGenericDirtHeavyH.Play(PlayerRef)
		Wait(0.3)
	else
		Wait(2.3)
	endif
	_Camp_ForceBlackVFX.Play(PlayerRef)
	FadeToBlackImod.PopTo(FadeToBlackHoldImod)

	;Move player, set exposure
	;Advance time by 2 hours
	if GameHour.GetValue() <= 21.9
		GameHour.SetValue(GameHour.GetValue() + 2.0)
	else
		GameHour.SetValue(0.0)
	endif
	
	GetExposureSystem().SetExposure(45.0, true)
	GetWetnessSystem().SetWetness(0.0, true)
endFunction

function RescueEnd()
	_Camp_ForceBlackVFX.Stop(PlayerRef)
	FadeToBlackHoldImod.PopTo(SleepyTimeFadeIn)
	PlayerRef.PlayIdle(Idle_1stPersonWoozyGetUpFromBed)
	Wait(1)
	Game.EnablePlayerControls()
	GetExposureSystem().GetFrostbite(true)
endFunction

function RescueFailsafeMessage()
	_Frost_RescueMsg_Failsafe.Show()
endFunction

function RescueMovePlayerAndFollowers(ObjectReference akDestinationObject, float x = 0.0, float y = 0.0, float z = 0.0, float az = 0.0)
	if akDestinationObject != none
		_Frost_RescueDestinationMarker.MoveTo(akDestinationObject, abMatchRotation = true)
	else
		_Frost_RescueDestinationMarker.MoveTo(PlayerRef)
	endif
	if x != 0.0 && y != 0.0 && z != 0.0 && az != 0.0
		_Frost_RescueDestinationMarker.SetPosition(x, y, z)
		_Frost_RescueDestinationMarker.SetAngle(0.0, 0.0, az)
	endif
	if follower1 && follower1.GetDistance(PlayerRef) <= 2000.0
		follower1.MoveTo(_Frost_RescueDestinationMarker)
	endif
	if follower2 && follower2.GetDistance(PlayerRef) <= 2000.0
		follower2.MoveTo(_Frost_RescueDestinationMarker)
	endif
	if follower3 && follower3.GetDistance(PlayerRef) <= 2000.0
		follower3.MoveTo(_Frost_RescueDestinationMarker)
	endif
	if animal && animal.GetDistance(PlayerRef) <= 2000.0
		animal.MoveTo(_Frost_RescueDestinationMarker)
	endif
	PlayerRef.MoveTo(_Frost_RescueDestinationMarker, abMatchRotation = true)
endFunction

function FindAndMoveToCOCMarker()
	if PlayerRef.IsInInterior()
		ObjectReference myMarker = Game.FindClosestReferenceOfTypeFromRef(COCMarkerHeading, PlayerRef, 8000.0)
		if myMarker != none
			PlayerRef.MoveTo(myMarker, abMatchRotation = true)
			if follower1
				follower1.MoveTo(myMarker)
			endif
			if follower2
				follower2.MoveTo(myMarker)
			endif
			if follower3
				follower3.MoveTo(myMarker)
			endif
			if animal
				animal.MoveTo(myMarker)
			endif
		else
			PlayerRef.SetPosition(0.0, 0.0, 0.0)
			if follower1
				follower1.SetPosition(0.0, 0.0, 0.0)
			endif
			if follower2
				follower2.SetPosition(0.0, 0.0, 0.0)
			endif
			if follower3
				follower3.SetPosition(0.0, 0.0, 0.0)
			endif
			if animal
				animal.SetPosition(0.0, 0.0, 0.0)
			endif
		endif
	endif
endFunction

function FindNearestRescueLocation()

	float pX = PlayerRef.GetPositionX()
	float pY = PlayerRef.GetPositionY()
	float pZ = PlayerRef.GetPositionZ()

	nearestDist = 9999999999999999.0
	rescueDestinationIndex = 0
	
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 140737.09, 106343.84, -13651.3, 101)
	;rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 51273.34, 122487.61, -13904.53, 102)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 114249.54, -97344.74, 13451.41, 103)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 3870.03, -788875.62, 4329.36, 104)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -67879.52, 142212.31, -13953.21, 105)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -153431.19, 111832.77, -13880.53, 106)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 168690.56, -51559.07, 5640.32, 107)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 146606.0, -82556.13, -13549.97, 108)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 105746.59, 31246.81, -10390.98, 109)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 83640.48, 110224.12, -13467.42, 110)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 25871.0, 46301.0, -5013.67, 111)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -73657.84, 90966.23, -13923.84, 112)

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -6949.0, 65466.22, -11584.55, 200)		;NPCs
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -25965.32, -105386.63, 12612.95, 201)	;NPC
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 118200.54, -81600.09, 11014.21, 202)	;NPCs
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 196353.59, -117115.1, 13223.43, 203)  	;Stendarr's Beacon
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 102442.45, -57511.14, 11076.83, 204)	;Guards
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 122056.44, -35001.86, -9936.53, 205)	;NPCs
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 71056.38, 57366.27, -3928.56, 206)		;NPCs

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -64154.67, -39697.98, -1086.85, 300)	;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 185655.47, -37709.24, 5770.93, 301)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 113070.53, -25050.97, -10087.63, 302)	;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 35403.59, 84115.66, -8072.59, 303)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -20098.11, -62001.73, 636.08, 304)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -56964.62, -55207.97, 1494.54, 305)		;Hunter		
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -15489.56, 26036.83, -1273.99, 306)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -47067.44, 43420.13, -6086.28, 307)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 150894.58, -9137.76, -9304.45, 308)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 158177.19, -83535.55, 11018.53, 309)	;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -278.40, -60866.98, 614.83, 310)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 153947.91, 17389.73, -4720.31, 311)		;Hunter

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 23226.89, -44453.6, -7.95, 400)			;VILLAGE Riverwood
	;rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 163534.72, -59796.79, 7047.55, 401)	;VILLAGE Shor's Stone
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -83300.04, 8373.52, -4016.59, 402)		;VILLAGE Rorikstead
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 135846.08, 10816.69, -11877.58, 403)	;VILLAGE Kynesgrove
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -100990.3, 83896.63, -11926.16, 404)	;VILLAGE Dragon Bridge
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 76541.18, -65496.84, 10921.82, 405)		;VILLAGE Ivarstead
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 73552.68, 47321.82, -5894.73, 406)		;VILLAGE Nightgate Inn

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 110166.94, 101580.95, -8954.6, 500)		;CITY Winterhold
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 135003.8, 34535.86, -12441.75, 501)		;CITY Windhelm
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -66044.98, 104218.75, -8424.6, 502)		;CITY Solitude
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -172844.2, 5545.82, -3349.18, 503)		;CITY Markarth
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 19192.53, -7429.48, -3609.14, 504)		;CITY Whiterun
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 174315.05, -91778.74, 11126.95, 505)	;CITY Riften
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -32144.70, -87707.61, -3088.38, 506)	;CITY Falkreath
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -40035.86, 65436.5, -13802.67, 507)		;CITY Morthal
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 29357.21, 102187.91, -13208.51, 508)	;CITY Dawnstar

	if Compatibility.isHFLoaded
		rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 174315.05, -91778.74, 11126.95, 600)	;HEARTHFIRE Pale
		rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 174315.05, -91778.74, 11126.95, 601)	;HEARTHFIRE Falkreath
		rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 174315.05, -91778.74, 11126.95, 602)	;HEARTHFIRE Morthal
	endif
endFunction

function FindNearestSettlementDLC2()
	float pX = PlayerRef.GetPositionX()
	float pY = PlayerRef.GetPositionY()
	float pZ = PlayerRef.GetPositionZ()

	nearestDist = 9999999999999999.0
	rescueDestinationIndex = 0

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 31684, 34032, 386, 1000)		;Raven Rock
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 73188, 70731, 2899, 1001)		;Skald Village
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 75359, 26012, 1644, 1002)		;Tel Mithryn
endFunction

function GoToNearestSettlementDLC2()
	if rescueDestinationIndex == 1000
		RescueMovePlayerAndFollowers(none, 31684, 34032, 386, 320.44)
	elseif rescueDestinationIndex == 1001
		RescueMovePlayerAndFollowers(none, 731188, 70731, 2899, 65.84)
	elseif rescueDestinationIndex == 1002
		RescueMovePlayerAndFollowers(none, 75359, 26012, 1644, 330.0)
	endif
endFunction

bool function CheckNearPasserby() 
	float pX = PlayerRef.GetPositionX()
	float pY = PlayerRef.GetPositionY()
	float pZ = PlayerRef.GetPositionZ()

	nearestDist = 9999999999999999.0
	rescueDestinationIndex = 0

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -6949.0, 65466.22, -11584.55, 200)		;NPCs
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -25965.32, -105386.63, 12612.95, 201)	;NPC
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 118200.54, -81600.09, 11014.21, 202)	;NPCs
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 196353.59, -117115.1, 13223.43, 203)  	;Stendarr's Beacon
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 102442.45, -57511.14, 11076.83, 204)	;Guards
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 122056.44, -35001.86, -9936.53, 205)	;NPCs
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 71056.38, 57366.27, -3928.56, 206)		;NPCs

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 23226.89, -44453.6, -7.95, 400)			;VILLAGE Riverwood
	;rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 163534.72, -59796.79, 7047.55, 401)	;VILLAGE Shor's Stone
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -83300.04, 8373.52, -4016.59, 402)		;VILLAGE Rorikstead
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 135846.08, 10816.69, -11877.58, 403)	;VILLAGE Kynesgrove
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -100990.3, 83896.63, -11926.16, 404)	;VILLAGE Dragon Bridge
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 76541.18, -65496.84, 10921.82, 405)		;VILLAGE Ivarstead
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 73552.68, 47321.82, -5894.73, 406)		;VILLAGE Nightgate Inn

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 110166.94, 101580.95, -8954.6, 500)		;CITY Winterhold
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 135003.8, 34535.86, -12441.75, 501)		;CITY Windhelm
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -66044.98, 104218.75, -8424.6, 502)		;CITY Solitude
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -172844.2, 5545.82, -3349.18, 503)		;CITY Markarth
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 19192.53, -7429.48, -3609.14, 504)		;CITY Whiterun
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 174315.05, -91778.74, 11126.95, 505)	;CITY Riften
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -32144.70, -87707.61, -3088.38, 506)	;CITY Falkreath
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -40035.86, 65436.5, -13802.67, 507)		;CITY Morthal
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 29357.21, 102187.91, -13208.51, 508)	;CITY Dawnstar
	
	if rescueDestinationIndex != 0 && nearestDist <= 16000.0
		;debug.trace("[Frostfall] I am near a passerby! " + rescueDestinationIndex + " " + nearestDist)
		return true
	else
		;debug.trace("[Frostfall] I am NOT near a passerby! " + rescueDestinationIndex + " " + nearestDist)
		return false
	endif
endFunction

bool function CheckNearHunterCamp()
	float pX = PlayerRef.GetPositionX()
	float pY = PlayerRef.GetPositionY()
	float pZ = PlayerRef.GetPositionZ()

	nearestDist = 9999999999999999.0
	rescueDestinationIndex = 0

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -64154.67, -39697.98, -1086.85, 300)	;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 185655.47, -37709.24, 5770.93, 301)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 113070.53, -25050.97, -10087.63, 302)	;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 35403.59, 84115.66, -8072.59, 303)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -20098.11, -62001.73, 636.08, 304)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -56964.62, -55207.97, 1494.54, 305)		;Hunter		
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -15489.56, 26036.83, -1273.99, 306)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -47067.44, 43420.13, -6086.28, 307)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 150894.58, -9137.76, -9304.45, 308)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 158177.19, -83535.55, 11018.53, 309)	;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -278.40, -60866.98, 614.83, 310)		;Hunter
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 153947.91, 17389.73, -4720.31, 311)		;Hunter

	if rescueDestinationIndex != 0 && nearestDist <= 16000.0
		return true
	else
		return false
	endif
endFunction

function GoToRandomSettlement()	
	int i = RandomInt(1, 15)

	if i == 1 				;VILLAGE Riverwood
		RescueMovePlayerAndFollowers(_Frost_MarkerRiverwood)
		rescueDestinationIndex = 400
	elseif i == 2			;VILLAGE Rorikstead
		RescueMovePlayerAndFollowers(_Frost_MarkerRorikstead)
		rescueDestinationIndex = 402
	elseif i == 3			;VILLAGE Kynesgrove
		RescueMovePlayerAndFollowers(_Frost_MarkerKynesgrove)
		rescueDestinationIndex = 403
	elseif i == 4			;VILLAGE Dragon Bridge
		RescueMovePlayerAndFollowers(_Frost_MarkerDragonbridge)
		rescueDestinationIndex = 404
	elseif i == 5			;VILLAGE Ivarstead
		RescueMovePlayerAndFollowers(_Frost_MarkerIvarstead)
		rescueDestinationIndex = 405
	elseif i == 6			;VILLAGE Nightgate Inn
		RescueMovePlayerAndFollowers(_Frost_MarkerNightgateInn)
		rescueDestinationIndex = 406
	elseif i == 7			;CITY Winterhold
		RescueMovePlayerAndFollowers(_Frost_MarkerWinterhold)
		rescueDestinationIndex = 500
	elseif i == 8			;CITY Windhelm
		RescueMovePlayerAndFollowers(_Frost_MarkerWindhelm)
		rescueDestinationIndex = 501
	elseif i == 9			;CITY Solitude
		RescueMovePlayerAndFollowers(_Frost_MarkerSolitude)
		rescueDestinationIndex = 502
	elseif i == 10			;CITY Markarth
		RescueMovePlayerAndFollowers(_Frost_MarkerMarkarth)
		rescueDestinationIndex = 503
	elseif i == 11			;CITY Whiterun
		RescueMovePlayerAndFollowers(_Frost_MarkerWhiterun)
		rescueDestinationIndex = 504
	elseif i == 12			;CITY Riften
		RescueMovePlayerAndFollowers(_Frost_MarkerRiften)
		rescueDestinationIndex = 505
	elseif i == 13			;CITY Falkreath
		RescueMovePlayerAndFollowers(_Frost_MarkerFalkreath)
		rescueDestinationIndex = 506
	elseif i == 14			;CITY Morthal
		RescueMovePlayerAndFollowers(_Frost_MarkerMorthal)
		rescueDestinationIndex = 507
	elseif i == 15			;CITY Dawnstar
		RescueMovePlayerAndFollowers(_Frost_MarkerDawnstar)
		rescueDestinationIndex = 508
	endif
endFunction
function GoToNearestPasserby()	
	if rescueDestinationIndex == 200
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, -6949.0, 65466.22, -11584.55, 186.45)		;NPCs
	elseif rescueDestinationIndex == 201
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, -25965.32, -105386.63, 12612.95, 330.95)	;NPC
	elseif rescueDestinationIndex == 202
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 118200.54, -81600.09, 11014.21, 256.17)		;NPCs
	elseif rescueDestinationIndex == 203
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 196353.59, -117115.1, 13223.43, 98.68)  	;Stendarr's Beacon
	elseif rescueDestinationIndex == 204
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 102442.45, -57511.14, 11076.83, 309.25)		;Guards
	elseif rescueDestinationIndex == 205
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 122056.44, -35001.86, -9936.53, 200.32)		;NPCs
	elseif rescueDestinationIndex == 206
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 71056.38, 57366.27, -3928.56, 5.29)			;NPCs
	elseif rescueDestinationIndex == 400 															;VILLAGE Riverwood
		RescueMovePlayerAndFollowers(_Frost_MarkerRiverwood)
	elseif rescueDestinationIndex == 402															;VILLAGE Rorikstead
		RescueMovePlayerAndFollowers(_Frost_MarkerRorikstead)
	elseif rescueDestinationIndex == 403															;VILLAGE Kynesgrove
		RescueMovePlayerAndFollowers(_Frost_MarkerKynesgrove)
	elseif rescueDestinationIndex == 404															;VILLAGE Dragon Bridge
		RescueMovePlayerAndFollowers(_Frost_MarkerDragonbridge)
	elseif rescueDestinationIndex == 405															;VILLAGE Ivarstead
		RescueMovePlayerAndFollowers(_Frost_MarkerIvarstead)
	elseif rescueDestinationIndex == 406															;VILLAGE Nightgate Inn
		RescueMovePlayerAndFollowers(_Frost_MarkerNightgateInn)
	elseif rescueDestinationIndex == 500															;CITY Winterhold
		RescueMovePlayerAndFollowers(_Frost_MarkerWinterhold)
	elseif rescueDestinationIndex == 501															;CITY Windhelm
		RescueMovePlayerAndFollowers(_Frost_MarkerWindhelm)
	elseif rescueDestinationIndex == 502															;CITY Solitude
		RescueMovePlayerAndFollowers(_Frost_MarkerSolitude)
	elseif rescueDestinationIndex == 503															;CITY Markarth
		RescueMovePlayerAndFollowers(_Frost_MarkerMarkarth)
	elseif rescueDestinationIndex == 504															;CITY Whiterun
		RescueMovePlayerAndFollowers(_Frost_MarkerWhiterun)
	elseif rescueDestinationIndex == 505															;CITY Riften
		RescueMovePlayerAndFollowers(_Frost_MarkerRiften)
	elseif rescueDestinationIndex == 506															;CITY Falkreath
		RescueMovePlayerAndFollowers(_Frost_MarkerFalkreath)
	elseif rescueDestinationIndex == 507															;CITY Morthal
		RescueMovePlayerAndFollowers(_Frost_MarkerMorthal)
	elseif rescueDestinationIndex == 508															;CITY Dawnstar
		RescueMovePlayerAndFollowers(_Frost_MarkerDawnstar)
	endif
endFunction
function GoToNearestOther()		
	if rescueDestinationIndex == 101
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 140737.09, 106343.84, -13651.3, 254.32)
	;elseif rescueDestinationIndex == 102
		;RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 51273.34, 122487.61, -13904.53, 250.15) 	; bad location
	elseif rescueDestinationIndex == 103
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 114249.54, -97344.74, 13451.41, 292.74)
	elseif rescueDestinationIndex == 104
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 3870.03, -788875.62, 4329.36, 13.5)
	elseif rescueDestinationIndex == 105
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, -67879.52, 142212.31, -13953.21, 6.74)
	elseif rescueDestinationIndex == 106
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, -153431.19, 111832.77, -13880.53, 313.48)
	elseif rescueDestinationIndex == 107
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 168690.56, -51559.07, 5640.32, 16.87)
	elseif rescueDestinationIndex == 108
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 146606.0, -82556.13, -13549.97, 17.79)
	elseif rescueDestinationIndex == 109
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 105746.59, 31246.81, -10390.98, 256.48)
	elseif rescueDestinationIndex == 110
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 83640.48, 110224.12, -13467.42, 83.2)
	elseif rescueDestinationIndex == 111
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 25871.0, 46301.0, -5013.67, 181.87)
	elseif rescueDestinationIndex == 112
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, -73657.84, 90966.23, -13923.84, 60.71)
	endif
endFunction
function FindNearestSettlement() 
	float pX = PlayerRef.GetPositionX()
	float pY = PlayerRef.GetPositionY()
	float pZ = PlayerRef.GetPositionZ()

	nearestDist = 9999999999999999.0

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 23226.89, -44453.6, -7.95, 400)			;VILLAGE Riverwood
	;rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 163534.72, -59796.79, 7047.55, 401)	;VILLAGE Shor's Stone
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -83300.04, 8373.52, -4016.59, 402)		;VILLAGE Rorikstead
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 135846.08, 10816.69, -11877.58, 403)	;VILLAGE Kynesgrove
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -100990.3, 83896.63, -11926.16, 404)	;VILLAGE Dragon Bridge
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 76541.18, -65496.84, 10921.82, 405)		;VILLAGE Ivarstead
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 73552.68, 47321.82, -5894.73, 406)		;VILLAGE Nightgate Inn

	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 110166.94, 101580.95, -8954.6, 500)		;CITY Winterhold
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 135003.8, 34535.86, -12441.75, 501)		;CITY Windhelm
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -66044.98, 104218.75, -8424.6, 502)		;CITY Solitude
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -172844.2, 5545.82, -3349.18, 503)		;CITY Markarth
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 19192.53, -7429.48, -3609.14, 504)		;CITY Whiterun
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 174315.05, -91778.74, 11126.95, 505)	;CITY Riften
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -32144.70, -87707.61, -3088.38, 506)	;CITY Falkreath
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -40035.86, 65436.5, -13802.67, 507)		;CITY Morthal
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 29357.21, 102187.91, -13208.51, 508)	;CITY Dawnstar
endFunction
function GoToNearestSettlement() 
	if rescueDestinationIndex == 400 																;VILLAGE Riverwood
		RescueMovePlayerAndFollowers(_Frost_MarkerRiverwood)
	elseif rescueDestinationIndex == 402															;VILLAGE Rorikstead
		RescueMovePlayerAndFollowers(_Frost_MarkerRorikstead)
	elseif rescueDestinationIndex == 403															;VILLAGE Kynesgrove
		RescueMovePlayerAndFollowers(_Frost_MarkerKynesgrove)
	elseif rescueDestinationIndex == 404															;VILLAGE Dragon Bridge
		RescueMovePlayerAndFollowers(_Frost_MarkerDragonbridge)
	elseif rescueDestinationIndex == 405															;VILLAGE Ivarstead
		RescueMovePlayerAndFollowers(_Frost_MarkerIvarstead)
	elseif rescueDestinationIndex == 406															;VILLAGE Nightgate Inn
		RescueMovePlayerAndFollowers(_Frost_MarkerNightgateInn)
	elseif rescueDestinationIndex == 500															;CITY Winterhold
		RescueMovePlayerAndFollowers(_Frost_MarkerWinterhold)
	elseif rescueDestinationIndex == 501															;CITY Windhelm
		RescueMovePlayerAndFollowers(_Frost_MarkerWindhelm)
	elseif rescueDestinationIndex == 502															;CITY Solitude
		RescueMovePlayerAndFollowers(_Frost_MarkerSolitude)
	elseif rescueDestinationIndex == 503															;CITY Markarth
		RescueMovePlayerAndFollowers(_Frost_MarkerMarkarth)
	elseif rescueDestinationIndex == 504															;CITY Whiterun
		RescueMovePlayerAndFollowers(_Frost_MarkerWhiterun)
	elseif rescueDestinationIndex == 505															;CITY Riften
		RescueMovePlayerAndFollowers(_Frost_MarkerRiften)
	elseif rescueDestinationIndex == 506															;CITY Falkreath
		RescueMovePlayerAndFollowers(_Frost_MarkerFalkreath)
	elseif rescueDestinationIndex == 507															;CITY Morthal
		RescueMovePlayerAndFollowers(_Frost_MarkerMorthal)
	elseif rescueDestinationIndex == 508															;CITY Dawnstar
		RescueMovePlayerAndFollowers(_Frost_MarkerDawnstar)
	endif
endFunction
function GiveRandomSettlementNote(bool Robbed = false)
	if Robbed == false
		PlayerRef.AddItem(_Frost_RescueLetterSettlement)
	else
		if rescueDestinationIndex == 400 																;VILLAGE Riverwood
			PlayerRef.AddItem(_Frost_RobLetterSettlement_Riverwood)
		elseif rescueDestinationIndex == 402															;VILLAGE Rorikstead
			PlayerRef.AddItem(_Frost_RobLetterSettlement_Rorikstead)
		elseif rescueDestinationIndex == 403															;VILLAGE Kynesgrove
			PlayerRef.AddItem(_Frost_RobLetterSettlement_Kynesgrove)
		elseif rescueDestinationIndex == 404															;VILLAGE Dragon Bridge
			PlayerRef.AddItem(_Frost_RobLetterSettlement_DragonBridge)
		elseif rescueDestinationIndex == 405															;VILLAGE Ivarstead
			PlayerRef.AddItem(_Frost_RobLetterSettlement_Ivarstead)
		elseif rescueDestinationIndex == 406															;VILLAGE Nightgate Inn
			PlayerRef.AddItem(_Frost_RobLetterSettlement_NightgateInn)
		elseif rescueDestinationIndex == 500															;CITY Winterhold
			PlayerRef.AddItem(_Frost_RobLetterSettlement_Winterhold)
		elseif rescueDestinationIndex == 501															;CITY Windhelm
			PlayerRef.AddItem(_Frost_RobLetterSettlement_Windhelm)
		elseif rescueDestinationIndex == 502															;CITY Solitude
			PlayerRef.AddItem(_Frost_RobLetterSettlement_Solitude)
		elseif rescueDestinationIndex == 503															;CITY Markarth
			PlayerRef.AddItem(_Frost_RobLetterSettlement_Markarth)
		elseif rescueDestinationIndex == 504															;CITY Whiterun
			PlayerRef.AddItem(_Frost_RobLetterSettlement_Whiterun)
		elseif rescueDestinationIndex == 505															;CITY Riften
			PlayerRef.AddItem(_Frost_RobLetterSettlement_Riften)
		elseif rescueDestinationIndex == 506															;CITY Falkreath
			PlayerRef.AddItem(_Frost_RobLetterSettlement_Falkreath)
		elseif rescueDestinationIndex == 507															;CITY Morthal
			PlayerRef.AddItem(_Frost_RobLetterSettlement_Morthal)
		elseif rescueDestinationIndex == 508															;CITY Dawnstar
			PlayerRef.AddItem(_Frost_RobLetterSettlement_Dawnstar)
		endif
	endif
endFunction
function FindNearestOther()
	float pX = PlayerRef.GetPositionX()
	float pY = PlayerRef.GetPositionY()
	float pZ = PlayerRef.GetPositionZ()

	nearestDist = 9999999999999999.0

	rescueDestinationIndex = 0
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 140737.09, 106343.84, -13651.3, 101)
	;rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 51273.34, 122487.61, -13904.53, 102)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 114249.54, -97344.74, 13451.41, 103)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 3870.03, -788875.62, 4329.36, 104)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -67879.52, 142212.31, -13953.21, 105)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -153431.19, 111832.77, -13880.53, 106)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 168690.56, -51559.07, 5640.32, 107)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 146606.0, -82556.13, -13549.97, 108)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 105746.59, 31246.81, -10390.98, 109)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 83640.48, 110224.12, -13467.42, 110)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, 25871.0, 46301.0, -5013.67, 111)
	rescueDestinationIndex = GetNearerIndex(pX, pY, pZ, -73657.84, 90966.23, -13923.84, 112)
endFunction
function GoToSpouse()
	RescueMovePlayerAndFollowers(Alias_LoveInterest.GetActorRef())
	FindAndMoveToCOCMarker()
endFunction
function GoToNearestHunterCamp()
	if rescueDestinationIndex == 300
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, -64154.67, -39697.98, -1086.85, 335.15)
	elseif rescueDestinationIndex == 301
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 185655.47, -37709.24, 5770.93, 296.40)
	elseif rescueDestinationIndex == 302
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 113070.53, -25050.97, -10087.63, 0.17)
	elseif rescueDestinationIndex == 303
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 35403.59, 84115.66, -8072.59, 197.71)
	elseif rescueDestinationIndex == 304
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, -20098.11, -62001.73, 636.08, 124.64)
	elseif rescueDestinationIndex == 305
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, -56964.62, -55207.97, 1494.54, 48.39)
	elseif rescueDestinationIndex == 306
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, -15489.56, 26036.83, -1273.99, 4.46)
	elseif rescueDestinationIndex == 307
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, -47067.44, 43420.13, -6086.28, 317.61)
	elseif rescueDestinationIndex == 308
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 150894.58, -9137.76, -9304.45, 313.79)
	elseif rescueDestinationIndex == 309
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 158177.19, -83535.55, 11018.53, 135.77)
	elseif rescueDestinationIndex == 310
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, -278.40, -60866.98, 614.83, 289.62)
	elseif rescueDestinationIndex == 311
		RescueMovePlayerAndFollowers(_Frost_MarkerTamriel, 153947.91, 17389.73, -4720.31, 174.08)
	endif
endFunction
function RobPlayer()
	int iGold = PlayerRef.GetItemCount(Gold001)
	float pecSteal = RandomFloat(0.01, 0.1)
	int iGoldToSteal = (iGold * pecSteal) as int
	PlayerRef.RemoveItem(Gold001, iGoldToSteal)
endFunction

function RescueAloneHunterCamp()
	GoToNearestHunterCamp()
	_Frost_RescueMsg_A_1.Show()
endFunction
function RescueAlonePasserby()	
	GoToNearestPasserby()
	_Frost_RescueMsg_A_2.Show()
endFunction
function RescueAloneTakenToDistantSettlement()
	GoToRandomSettlement()
	GiveRandomSettlementNote()
endFunction
function RescueAloneTakenToDistantSettlementAndRobbed()
	GoToRandomSettlement()
	RobPlayer()
	GiveRandomSettlementNote(true)
endFunction
function RescueAloneTakenHomeToSpouse()		
	GoToSpouse()
	PlayerRef.AddItem(_Frost_RescueLetterSpouse)
endFunction
function RescueAloneTakenToOtherAndRobbed()	
	FindNearestOther()
	GoToNearestOther()
	RobPlayer()
	PlayerRef.AddItem(_Frost_RobLetterOther)
endFunction

function RescueFollowerTakenToNearestSettlement()
	FindNearestSettlement()
	GoToNearestSettlement()
	_Frost_RescueMsg_F_1.Show()
endFunction
function RescueFollowerHunterCamp()
	GoToNearestHunterCamp()
	_Frost_RescueMsg_F_2.Show()
endFunction
function RescueFollowerTakenToOther()
	GoToNearestOther()
	_Frost_RescueMsg_F_3.Show()
endFunction
function RescueFollowerPasserby()
	GoToNearestPasserby()
	_Frost_RescueMsg_F_4.Show()
endFunction
function RescueFollowerBuildsCampfire()
	FollowerBuildCampfire()
	PlayerRef.SplineTranslateTo(PlayerRef.GetPositionX() + 150.0, PlayerRef.GetPositionY(), PlayerRef.GetPositionZ(), 0.0, 0.0, 0.0, 1000.0, 1000.0)
	_Frost_RescueMsg_F_5.Show()
endFunction

function RescueDogTakenToOther()
	GoToNearestOther()
	_Frost_RescueMsg_D_1.Show()
endFunction
function RescueDogPasserby()	
	GoToNearestPasserby()
	_Frost_RescueMsg_D_2.Show()
endFunction
function RescueDogHunterCamp()	
	GoToNearestHunterCamp()
	_Frost_RescueMsg_D_3.Show()
endFunction
function RescueDogTakenToNearestSettlement()
	GoToNearestSettlement()
	_Frost_RescueMsg_D_4.Show()
endFunction

function FollowerBuildCampfire()
	; Spawn the campfire and wait for it to initialize.
	ObjectReference campfire_ref = PlayerRef.PlaceAtMe(_Camp_Campfire)
	CampCampfire campfire = campfire_ref as CampCampfire
	int i = 0
	while !campfire.initialized && i < 50
		Wait(0.1)
		i += 1
	endWhile

	; Set up fuel and light it.
	; Modeled from _Camp_CampfireType_FlickeringScript
	campfire.campfire_size = 2
	campfire.supplied_branches = 4
	_Camp_LastUsedCampfireSize.SetValueInt(2)
	campfire.SetFuel(_Camp_Fuel_Flickering_BranchesLit,		\
					 _Camp_Fuel_Flickering_BranchesUnlit,	\
					 _Camp_Campfire_Light_3, 3)

	campfire.LightFire()
endFunction