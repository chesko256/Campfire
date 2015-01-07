scriptname _Camp_Tent_LargeHide3BR extends _Camp_Tent

import debug
import utility
import CampUtil

static property _Camp_Tent_LargeHideStatic auto							;Tent world mesh
static property _Camp_Tent_LargeHideStaticExterior auto					;Exterior tent world mesh
static property _Camp_Tent_LargeHide_GroundFX auto							;Ground FX

;Main reference object (USE BEDROLL)
ObjectReference property _Camp_LargeHideTent4BR_Tent_PosRef auto

;Reference Objects
ObjectReference property _Camp_LargeHideTent4BR_Backpack_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_Boots_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_Gauntlets_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_Cuirass_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_PlayerBow_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_Helmet_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_LanternA_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_LanternB_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_LanternC_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_LightA_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_LightB_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_LightC_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_PlayerMainHand_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_PlayerOffHand_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_PlayerBedroll_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_PlayerLayDownMarker_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_PlayerShield_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_PlayerShieldInterior_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_PlayerSitMarker_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_PlayerTwoHand_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_Ward_PosRef auto
ObjectReference property _Camp_LargeHideTent_GroundCover_PosRef auto

;Follower A
ObjectReference property _Camp_LargeHideTent4BR_FollowerABedroll_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_FollowerAMainHand_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_FollowerAOffHand_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_FollowerATwoHand_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_FollowerABow_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_FollowerAShield_PosRef auto

;Follower B
ObjectReference property _Camp_LargeHideTent4BR_FollowerBBedroll_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_FollowerBMainHand_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_FollowerBOffHand_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_FollowerBTwoHand_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_FollowerBBow_PosRef auto
ObjectReference property _Camp_LargeHideTent4BR_FollowerBShield_PosRef auto

;Follower C
;ObjectReference property _Camp_LargeHideTent4BR_FollowerCBedroll_PosRef auto
;ObjectReference property _Camp_LargeHideTent4BR_FollowerCMainHand_PosRef auto
;ObjectReference property _Camp_LargeHideTent4BR_FollowerCOffHand_PosRef auto
;ObjectReference property _Camp_LargeHideTent4BR_FollowerCTwoHand_PosRef auto
;ObjectReference property _Camp_LargeHideTent4BR_FollowerCBow_PosRef auto
;ObjectReference property _Camp_LargeHideTent4BR_FollowerCShield_PosRef auto

Event OnInit()
	;trace("[FROSTFALL] Setting up all objects...")
	while !self.Is3DLoaded()
	endWhile
	
	self.SetAngle(self.GetAngleX(), self.GetAngleY(), self.GetAngleZ() + 180.0)
	
	CreatePositionArrays()
	
	myOriginAng = GetAngleData(self)
	
	GetRelativePositions()
	
	;trace("[FROSTFALL] Placing objects...")
	if !(IsRefInInterior(PlayerRef))
		myTent = PlaceAtMeRelative(self, _Camp_Tent_LargeHideStatic, myOriginAng, myTent_Pos)
		myNormalTent = myTent.PlaceAtMe(_Camp_Tent_LargeHideStaticExterior, abInitiallyDisabled = true)
		mySnowTent = myTent.PlaceAtMe(SnowTentStatic, abInitiallyDisabled = true)
		myAshTent = myTent.PlaceAtMe(AshTentStatic, abInitiallyDisabled = true)
		ApplySnow()
		myWard = PlaceAtMeRelative(self, _Camp_TentWard, myOriginAng, myWard_Pos, fXLocalAngAdjust = -90.0, abIsPropped = true)
		myPlayerMarker_Shield = PlaceAtMeRelative(self, _Camp_Tent_ShieldMarker, myOriginAng, myPlayerMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
	else
		myPlayerMarker_ShieldInterior = PlaceAtMeRelative(self, _Camp_Tent_ShieldMarker, myOriginAng, myPlayerMarker_ShieldInterior_Pos)
	endif
	myGroundCover = PlaceAtMeRelative(self, _Camp_Tent_LargeHide_GroundFX, myOriginAng, myGroundCover_Pos)
	myBedRoll = PlaceAtMeRelative(self, _Camp_Bedroll_ActualF, myOriginAng, myBedRoll_Pos)
	myLanternUnlit = PlaceAtMeRelative(self, _Camp_Tent_LanternOffGround, myOriginAng, myLanternUnlit_Pos)
	myLanternLit = PlaceAtMeRelative(self, _Camp_Tent_LanternOnGround, myOriginAng, myLanternLit_Pos, abInitiallyDisabled = true)
	myLanternLight = PlaceAtMeRelative(self, _Camp_LanternLight, myOriginAng, myLanternLight_Pos, abInitiallyDisabled = true)
	myLanternUnlit2 = PlaceAtMeRelative(self, _Camp_Tent_LanternOffGround, myOriginAng, myLanternUnlit2_Pos)
	myLanternLit2 = PlaceAtMeRelative(self, _Camp_Tent_LanternOnGround, myOriginAng, myLanternLit2_Pos, abInitiallyDisabled = true)
	myLanternLight2 = PlaceAtMeRelative(self, _Camp_LanternLight, myOriginAng, myLanternLight2_Pos, abInitiallyDisabled = true)
	if !(IsRefInInterior(PlayerRef))
		myLanternUnlit3 = PlaceAtMeRelative(self, _Camp_Tent_LanternOffHang, myOriginAng, myLanternUnlit3_Pos, fZHangingOffset = -36.4536, abIsHanging = true)
		myLanternLit3 = PlaceAtMeRelative(self, _Camp_Tent_LanternOnHang, myOriginAng, myLanternLit3_Pos, fZHangingOffset = -36.4536, abInitiallyDisabled = true, abIsHanging = true)
		myLanternLight3 = PlaceAtMeRelative(self, _Camp_LanternLight, myOriginAng, myLanternLight3_Pos, abInitiallyDisabled = true)
	endif
	myPlayerMarker_MainWeapon = PlaceAtMeRelative(self, _Camp_Tent_MainWeaponMarker, myOriginAng, myPlayerMarker_MainWeapon_Pos)
	myPlayerMarker_OffHandWeapon = PlaceAtMeRelative(self, _Camp_Tent_OffHandWeaponMarker, myOriginAng, myPlayerMarker_OffHandWeapon_Pos)
	myPlayerMarker_BigWeapon = PlaceAtMeRelative(self, _Camp_Tent_BigWeaponMarker, myOriginAng, myPlayerMarker_BigWeapon_Pos)
	myPlayerMarker_Bow = PlaceAtMeRelative(self, _Camp_Tent_BowMarker, myOriginAng, myPlayerMarker_Bow_Pos)
	myPlayerMarker_Helm = PlaceAtMeRelative(self, _Camp_Tent_HelmMarker, myOriginAng, myPlayerMarker_Helm_Pos)
	myPlayerMarker_Boots = PlaceAtMeRelative(self, _Camp_Tent_BootsMarker, myOriginAng, myPlayerMarker_Boots_Pos)
	myPlayerMarker_Gauntlets = PlaceAtMeRelative(self, _Camp_Tent_GauntletsMarker, myOriginAng, myPlayerMarker_Gauntlets_Pos)
	myPlayerMarker_Cuirass = PlaceAtMeRelative(self, _Camp_Tent_CuirassMarker, myOriginAng, myPlayerMarker_Cuirass_Pos)
	myPlayerMarker_Backpack = PlaceAtMeRelative(self, _Camp_Tent_BackpackMarker, myOriginAng, myPlayerMarker_Backpack_Pos)
	myPlayerSitMarker = PlaceAtMeRelative(self, _Camp_TentSitMarker, myOriginAng, myPlayerSitMarker_Pos)
	myPlayerLayDownMarker = PlaceAtMeRelative(self, _Camp_TentLayDownMarker, myOriginAng, myPlayerLayDownMarker_Pos, fZLocalAngAdjust = 180.0)
	mySpareBedRoll1 = PlaceAtMeRelative(self, _Camp_Bedroll_NPC_FR, myOriginAng, mySpareBedRoll1_Pos)
	mySpareBedRoll2 = PlaceAtMeRelative(self, _Camp_Bedroll_NPC_FL, myOriginAng, mySpareBedRoll2_Pos)
	;mySpareBedRoll3 = PlaceAtMeRelative(self, _Camp_Bedroll_NPC_FR, myOriginAng, mySpareBedRoll3_Pos)
	myFollowerAMarker_MainWeapon = PlaceAtMeRelative(self, _Camp_Tent_MainWeaponMarker, myOriginAng, myFollowerAMarker_MainWeapon_Pos)
	myFollowerAMarker_OffHandWeapon = PlaceAtMeRelative(self, _Camp_Tent_OffHandWeaponMarker, myOriginAng, myFollowerAMarker_OffHandWeapon_Pos)
	myFollowerAMarker_BigWeapon = PlaceAtMeRelative(self, _Camp_Tent_BigWeaponMarker, myOriginAng, myFollowerAMarker_BigWeapon_Pos)
	myFollowerAMarker_Bow = PlaceAtMeRelative(self, _Camp_Tent_BowMarker, myOriginAng, myFollowerAMarker_Bow_Pos)
	;myFollowerAMarker_Shield = PlaceAtMeRelative(self, _Camp_Tent_ShieldMarker, myOriginAng, myFollowerAMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
	myFollowerBMarker_MainWeapon = PlaceAtMeRelative(self, _Camp_Tent_MainWeaponMarker, myOriginAng, myFollowerBMarker_MainWeapon_Pos)
	myFollowerBMarker_OffHandWeapon = PlaceAtMeRelative(self, _Camp_Tent_OffHandWeaponMarker, myOriginAng, myFollowerBMarker_OffHandWeapon_Pos)
	myFollowerBMarker_BigWeapon = PlaceAtMeRelative(self, _Camp_Tent_BigWeaponMarker, myOriginAng, myFollowerBMarker_BigWeapon_Pos)
	myFollowerBMarker_Bow = PlaceAtMeRelative(self, _Camp_Tent_BowMarker, myOriginAng, myFollowerBMarker_Bow_Pos)
	;myFollowerBMarker_Shield = PlaceAtMeRelative(self, _Camp_Tent_ShieldMarker, myOriginAng, myFollowerBMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
	;myFollowerCMarker_MainWeapon = PlaceAtMeRelative(self, _Camp_Tent_MainWeaponMarker, myOriginAng, myFollowerCMarker_MainWeapon_Pos)
	;myFollowerCMarker_OffHandWeapon = PlaceAtMeRelative(self, _Camp_Tent_OffHandWeaponMarker, myOriginAng, myFollowerCMarker_OffHandWeapon_Pos)
	;myFollowerCMarker_BigWeapon = PlaceAtMeRelative(self, _Camp_Tent_BigWeaponMarker, myOriginAng, myFollowerCMarker_BigWeapon_Pos)
	;myFollowerCMarker_Bow = PlaceAtMeRelative(self, _Camp_Tent_BowMarker, myOriginAng, myFollowerCMarker_Bow_Pos)
	;myFollowerCMarker_Shield = PlaceAtMeRelative(self, _Camp_Tent_ShieldMarker, myOriginAng, myFollowerCMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
	;trace("[FROSTFALL] Object placement complete.")
	
	;Move primary bedroll (self) to new position
	self.MoveTo(myBedRoll)
	
endEvent

function GetRelativePositions()
	myTent_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_Tent_PosRef)
	myGroundCover_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent_GroundCover_PosRef)
	myBedRoll_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_PlayerBedroll_PosRef)
	myLanternUnlit_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_LanternA_PosRef)
	myLanternLit_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_LanternA_PosRef)
	myLanternLight_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_LightA_PosRef)
	myLanternUnlit2_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_LanternB_PosRef)
	myLanternLit2_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_LanternB_PosRef)
	myLanternLight2_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_LightB_PosRef)
	myLanternUnlit3_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_LanternC_PosRef)
	myLanternLit3_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_LanternC_PosRef)
	myLanternLight3_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_LightC_PosRef)
	myPlayerMarker_MainWeapon_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_PlayerMainHand_PosRef)
	myPlayerMarker_OffHandWeapon_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_PlayerOffHand_PosRef)
	myPlayerMarker_BigWeapon_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_PlayerTwoHand_PosRef)
	myPlayerMarker_Bow_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_PlayerBow_PosRef)
	myPlayerMarker_Helm_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_Helmet_PosRef)
	myPlayerMarker_Boots_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_Boots_PosRef)
	myPlayerMarker_Gauntlets_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_Gauntlets_PosRef)
	myPlayerMarker_Cuirass_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_Cuirass_PosRef)
	myPlayerMarker_Backpack_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_Backpack_PosRef)
	myPlayerMarker_Shield_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_PlayerShield_PosRef)
	myPlayerMarker_ShieldInterior_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_PlayerShieldInterior_PosRef)
	myPlayerSitMarker_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_PlayerSitMarker_PosRef)
	myPlayerLayDownMarker_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_PlayerLayDownMarker_PosRef)
	myWard_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_Ward_PosRef)
	mySpareBedRoll1_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerABedroll_PosRef)
	mySpareBedRoll2_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerBBedroll_PosRef)
	;mySpareBedRoll3_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerCBedroll_PosRef)
	myFollowerAMarker_MainWeapon_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerAMainHand_PosRef)
	myFollowerAMarker_OffHandWeapon_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerAOffHand_PosRef)
	myFollowerAMarker_BigWeapon_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerATwoHand_PosRef)
	myFollowerAMarker_Bow_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerABow_PosRef)
	myFollowerBMarker_MainWeapon_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerBMainHand_PosRef)
	myFollowerBMarker_OffHandWeapon_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerBOffHand_PosRef)
	myFollowerBMarker_BigWeapon_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerBTwoHand_PosRef)
	myFollowerBMarker_Bow_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerBBow_PosRef)
	;myFollowerCMarker_MainWeapon_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerCMainHand_PosRef)
	;myFollowerCMarker_OffHandWeapon_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerCOffHand_PosRef)
	;myFollowerCMarker_BigWeapon_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerCTwoHand_PosRef)
	;myFollowerCMarker_Bow_Pos = GetRelativePosition(_Camp_LargeHideTent4BR_Tent_PosRef, _Camp_LargeHideTent4BR_FollowerCBow_PosRef)
endFunction