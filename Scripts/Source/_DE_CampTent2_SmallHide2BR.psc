scriptname _DE_CampTent2_SmallHide2BR extends _DE_Tent

import debug
import utility
import CampUtil

static property _DE_Camp2Tent_SmallHideStatic auto					;Tent world mesh
static property _DE_Camp2Tent_SmallHideStaticExterior auto			;Exterior tent world mesh

;Main reference object (USE BEDROLL)
ObjectReference property _DE_SmallHideTent2BR_Tent_PosRef auto

;Reference Objects
ObjectReference property _DE_SmallHideTent2BR_Backpack_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_Boots_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_Gauntlets_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_PlayerBow_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_FrontExit_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_GroundCover_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_Helmet_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_Lantern_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_Light_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_PlayerMainHand_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_PlayerOffHand_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_PlayerBedroll_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_PlayerLayDownMarker_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_PlayerShield_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_PlayerShieldInterior_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_PlayerSitMarker_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_PlayerTwoHand_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_Ward_PosRef auto

;Follower A
ObjectReference property _DE_SmallHideTent2BR_FollowerABedroll_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_FollowerAMainHand_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_FollowerAOffHand_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_FollowerATwoHand_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_FollowerABow_PosRef auto
ObjectReference property _DE_SmallHideTent2BR_FollowerAShield_PosRef auto


Event OnInit()
	;trace("[FROSTFALL] Setting up all objects...")
	while !self.Is3DLoaded()
	endWhile
	
	self.SetScale(0.8)
	
	CreatePositionArrays()
	
	myOriginAng = GetAngleData(self)
	
	GetRelativePositions()
	
	;trace("[FROSTFALL] Placing objects...")
	if !(IsRefInInterior(PlayerRef))
		myTent = PlaceAtMeRelative(self, _DE_Camp2Tent_SmallHideStatic, myOriginAng, myTent_Pos)
		myNormalTent = myTent.PlaceAtMe(_DE_Camp2Tent_SmallHideStaticExterior, abInitiallyDisabled = true)
		mySnowTent = myTent.PlaceAtMe(SnowTentStatic, abInitiallyDisabled = true)
		myAshTent = myTent.PlaceAtMe(AshTentStatic, abInitiallyDisabled = true)
		ApplySnow()
		myWard = PlaceAtMeRelative(self, _DE_TentWard, myOriginAng, myWard_Pos, fXLocalAngAdjust = -90.0, abIsPropped = true)
		myPlayerMarker_Shield = PlaceAtMeRelative(self, _DE_Tent_ShieldMarker, myOriginAng, myPlayerMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
	else
		myPlayerMarker_ShieldInterior = PlaceAtMeRelative(self, _DE_Tent_ShieldMarker, myOriginAng, myPlayerMarker_ShieldInterior_Pos)
	endif
	myGroundCover = PlaceAtMeRelative(self, _DE_Tent_BedrollHayNoGround02, myOriginAng, myGroundCover_Pos)
	myBedRoll = PlaceAtMeRelative(self, _DE_Bedroll_ActualF, myOriginAng, myBedRoll_Pos)
	myLanternUnlit = PlaceAtMeRelative(self, _DE_Tent_LanternOffGround, myOriginAng, myLanternUnlit_Pos)
	myLanternLit = PlaceAtMeRelative(self, _DE_Tent_LanternOnGround, myOriginAng, myLanternLit_Pos, abInitiallyDisabled = true)
	myLanternLight = PlaceAtMeRelative(self, _DE_LanternLight, myOriginAng, myLanternLight_Pos, abInitiallyDisabled = true)
	myPlayerMarker_MainWeapon = PlaceAtMeRelative(self, _DE_Tent_MainWeaponMarker, myOriginAng, myPlayerMarker_MainWeapon_Pos)
	myPlayerMarker_OffHandWeapon = PlaceAtMeRelative(self, _DE_Tent_OffHandWeaponMarker, myOriginAng, myPlayerMarker_OffHandWeapon_Pos)
	myPlayerMarker_BigWeapon = PlaceAtMeRelative(self, _DE_Tent_BigWeaponMarker, myOriginAng, myPlayerMarker_BigWeapon_Pos)
	myPlayerMarker_Bow = PlaceAtMeRelative(self, _DE_Tent_BowMarker, myOriginAng, myPlayerMarker_Bow_Pos)
	myPlayerMarker_Helm = PlaceAtMeRelative(self, _DE_Tent_HelmMarker, myOriginAng, myPlayerMarker_Helm_Pos)
	myPlayerMarker_Boots = PlaceAtMeRelative(self, _DE_Tent_BootsMarker, myOriginAng, myPlayerMarker_Boots_Pos)
	myPlayerMarker_Gauntlets = PlaceAtMeRelative(self, _DE_Tent_GauntletsMarker, myOriginAng, myPlayerMarker_Gauntlets_Pos)
	myPlayerMarker_Backpack = PlaceAtMeRelative(self, _DE_Tent_BackpackMarker, myOriginAng, myPlayerMarker_Backpack_Pos)
	myPlayerSitMarker = PlaceAtMeRelative(self, _DE_TentSitMarker, myOriginAng, myPlayerSitMarker_Pos)
	myPlayerLayDownMarker = PlaceAtMeRelative(self, _DE_TentLayDownMarker, myOriginAng, myPlayerLayDownMarker_Pos, fZLocalAngAdjust = 180.0)
	myExitFront = PlaceAtMeRelative(self, XMarker, myOriginAng, myExitFront_Pos)
	mySpareBedRoll1 = PlaceAtMeRelative(self, _DE_Bedroll_NPC_FR, myOriginAng, mySpareBedRoll1_Pos)
	mySpareBedRoll1.SetScale(0.8)
	myFollowerAMarker_MainWeapon = PlaceAtMeRelative(self, _DE_Tent_MainWeaponMarker, myOriginAng, myFollowerAMarker_MainWeapon_Pos)
	myFollowerAMarker_OffHandWeapon = PlaceAtMeRelative(self, _DE_Tent_OffHandWeaponMarker, myOriginAng, myFollowerAMarker_OffHandWeapon_Pos)
	myFollowerAMarker_BigWeapon = PlaceAtMeRelative(self, _DE_Tent_BigWeaponMarker, myOriginAng, myFollowerAMarker_BigWeapon_Pos)
	myFollowerAMarker_Bow = PlaceAtMeRelative(self, _DE_Tent_BowMarker, myOriginAng, myFollowerAMarker_Bow_Pos)
	;myFollowerAMarker_Shield = PlaceAtMeRelative(self, _DE_Tent_ShieldMarker, myOriginAng, myFollowerAMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
	;trace("[FROSTFALL] Object placement complete.")
	
	;Move primary bedroll (self) to new position
	self.MoveTo(myBedRoll)
	
endEvent

function GetRelativePositions()
	myTent_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_Tent_PosRef)
	myGroundCover_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_GroundCover_PosRef)
	myBedRoll_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_PlayerBedroll_PosRef)
	myLanternUnlit_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_Lantern_PosRef)
	myLanternLit_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_Lantern_PosRef)
	myLanternLight_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_Light_PosRef)
	myPlayerMarker_MainWeapon_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_PlayerMainHand_PosRef)
	myPlayerMarker_OffHandWeapon_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_PlayerOffHand_PosRef)
	myPlayerMarker_BigWeapon_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_PlayerTwoHand_PosRef)
	myPlayerMarker_Bow_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_PlayerBow_PosRef)
	myPlayerMarker_Helm_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_Helmet_PosRef)
	myPlayerMarker_Boots_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_Boots_PosRef)
	myPlayerMarker_Gauntlets_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_Gauntlets_PosRef)
	myPlayerMarker_Backpack_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_Backpack_PosRef)
	myPlayerMarker_Shield_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_PlayerShield_PosRef)
	myPlayerMarker_ShieldInterior_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_PlayerShieldInterior_PosRef)
	myPlayerSitMarker_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_PlayerSitMarker_PosRef)
	myPlayerLayDownMarker_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_PlayerLayDownMarker_PosRef)
	myExitFront_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_FrontExit_PosRef)
	myWard_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_Ward_PosRef)
	mySpareBedRoll1_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_FollowerABedroll_PosRef)
	myFollowerAMarker_MainWeapon_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_FollowerAMainHand_PosRef)
	myFollowerAMarker_OffHandWeapon_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_FollowerAOffHand_PosRef)
	myFollowerAMarker_BigWeapon_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_FollowerATwoHand_PosRef)
	myFollowerAMarker_Bow_Pos = GetRelativePosition(_DE_SmallHideTent2BR_Tent_PosRef, _DE_SmallHideTent2BR_FollowerABow_PosRef)
endFunction
