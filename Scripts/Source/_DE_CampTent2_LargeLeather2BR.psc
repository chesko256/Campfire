scriptname _DE_CampTent2_LargeLeather2BR extends _DE_Tent

import debug
import utility
import CampUtil

static property _DE_Camp2Tent_LargeLeatherStatic auto							;Tent world mesh
static property _DE_Camp2Tent_LargeLeatherStaticExterior auto					;Exterior tent world mesh
static property _DE_Tent_LargeLeather_GroundFX auto								;Ground FX

;Main reference object (USE BEDROLL)
ObjectReference property _DE_LargeLeatherTent3BR_Tent_PosRef auto

;Reference Objects
ObjectReference property _DE_LargeLeatherTent3BR_Backpack_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_Boots_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_Gauntlets_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_Cuirass_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_PlayerBow_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_Helmet_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_LanternA_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_LanternB_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_LanternC_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_LightA_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_LightB_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_LightC_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_PlayerMainHand_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_PlayerOffHand_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_PlayerBedroll_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_PlayerLayDownMarker_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_PlayerShield_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_PlayerShieldInterior_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_PlayerSitMarker_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_PlayerTwoHand_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_Ward_PosRef auto
ObjectReference property _DE_LargeLeatherTent_GroundCover_PosRef auto

;Follower A
ObjectReference property _DE_LargeLeatherTent3BR_FollowerABedroll_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_FollowerAMainHand_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_FollowerAOffHand_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_FollowerATwoHand_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_FollowerABow_PosRef auto
ObjectReference property _DE_LargeLeatherTent3BR_FollowerAShield_PosRef auto

;Follower B
;ObjectReference property _DE_LargeLeatherTent3BR_FollowerBBedroll_PosRef auto
;ObjectReference property _DE_LargeLeatherTent3BR_FollowerBMainHand_PosRef auto
;ObjectReference property _DE_LargeLeatherTent3BR_FollowerBOffHand_PosRef auto
;ObjectReference property _DE_LargeLeatherTent3BR_FollowerBTwoHand_PosRef auto
;ObjectReference property _DE_LargeLeatherTent3BR_FollowerBBow_PosRef auto
;ObjectReference property _DE_LargeLeatherTent3BR_FollowerBShield_PosRef auto

Event OnInit()
	;trace("[FROSTFALL] Setting up all objects...")
	while !self.Is3DLoaded()
	endWhile
	
	self.SetAngle(self.GetAngleX(), self.GetAngleY(), self.GetAngleZ() + 90.0)
	
	CreatePositionArrays()
	
	myOriginAng = GetAngleData(self)
	
	GetRelativePositions()
	
	;trace("[FROSTFALL] Placing objects...")
	if !(IsRefInInterior(PlayerRef))
		myTent = PlaceAtMeRelative(self, _DE_Camp2Tent_LargeLeatherStatic, myOriginAng, myTent_Pos)
		myNormalTent = myTent.PlaceAtMe(_DE_Camp2Tent_LargeLeatherStaticExterior, abInitiallyDisabled = true)
		mySnowTent = myTent.PlaceAtMe(SnowTentStatic, abInitiallyDisabled = true)
		myAshTent = myTent.PlaceAtMe(AshTentStatic, abInitiallyDisabled = true)
		ApplySnow()
		myWard = PlaceAtMeRelative(self, _DE_TentWard, myOriginAng, myWard_Pos, fXLocalAngAdjust = -90.0, abIsPropped = true)
		myPlayerMarker_Shield = PlaceAtMeRelative(self, _DE_Tent_ShieldMarker, myOriginAng, myPlayerMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
	else
		myPlayerMarker_ShieldInterior = PlaceAtMeRelative(self, _DE_Tent_ShieldMarker, myOriginAng, myPlayerMarker_ShieldInterior_Pos)
	endif
	myGroundCover = PlaceAtMeRelative(self, _DE_Tent_LargeLeather_GroundFX, myOriginAng, myGroundCover_Pos)
	myBedRoll = PlaceAtMeRelative(self, _DE_Bedroll_ActualF, myOriginAng, myBedRoll_Pos)
	myLanternUnlit = PlaceAtMeRelative(self, _DE_Tent_LanternOffGround, myOriginAng, myLanternUnlit_Pos)
	myLanternLit = PlaceAtMeRelative(self, _DE_Tent_LanternOnGround, myOriginAng, myLanternLit_Pos, abInitiallyDisabled = true)
	myLanternLight = PlaceAtMeRelative(self, _DE_LanternLight, myOriginAng, myLanternLight_Pos, abInitiallyDisabled = true)
	myLanternUnlit2 = PlaceAtMeRelative(self, _DE_Tent_LanternOffGround, myOriginAng, myLanternUnlit2_Pos)
	myLanternLit2 = PlaceAtMeRelative(self, _DE_Tent_LanternOnGround, myOriginAng, myLanternLit2_Pos, abInitiallyDisabled = true)
	myLanternLight2 = PlaceAtMeRelative(self, _DE_LanternLight, myOriginAng, myLanternLight2_Pos, abInitiallyDisabled = true)
	myLanternUnlit3 = PlaceAtMeRelative(self, _DE_Tent_LanternOffGround, myOriginAng, myLanternUnlit3_Pos)
	myLanternLit3 = PlaceAtMeRelative(self, _DE_Tent_LanternOnGround, myOriginAng, myLanternLit3_Pos, abInitiallyDisabled = true)
	myLanternLight3 = PlaceAtMeRelative(self, _DE_LanternLight, myOriginAng, myLanternLight3_Pos, abInitiallyDisabled = true)
	myPlayerMarker_MainWeapon = PlaceAtMeRelative(self, _DE_Tent_MainWeaponMarker, myOriginAng, myPlayerMarker_MainWeapon_Pos)
	myPlayerMarker_OffHandWeapon = PlaceAtMeRelative(self, _DE_Tent_OffHandWeaponMarker, myOriginAng, myPlayerMarker_OffHandWeapon_Pos)
	myPlayerMarker_BigWeapon = PlaceAtMeRelative(self, _DE_Tent_BigWeaponMarker, myOriginAng, myPlayerMarker_BigWeapon_Pos)
	myPlayerMarker_Bow = PlaceAtMeRelative(self, _DE_Tent_BowMarker, myOriginAng, myPlayerMarker_Bow_Pos)
	myPlayerMarker_Helm = PlaceAtMeRelative(self, _DE_Tent_HelmMarker, myOriginAng, myPlayerMarker_Helm_Pos)
	myPlayerMarker_Boots = PlaceAtMeRelative(self, _DE_Tent_BootsMarker, myOriginAng, myPlayerMarker_Boots_Pos)
	myPlayerMarker_Gauntlets = PlaceAtMeRelative(self, _DE_Tent_GauntletsMarker, myOriginAng, myPlayerMarker_Gauntlets_Pos)
	myPlayerMarker_Cuirass = PlaceAtMeRelative(self, _DE_Tent_CuirassMarker, myOriginAng, myPlayerMarker_Cuirass_Pos)
	myPlayerMarker_Backpack = PlaceAtMeRelative(self, _DE_Tent_BackpackMarker, myOriginAng, myPlayerMarker_Backpack_Pos)
	myPlayerSitMarker = PlaceAtMeRelative(self, _DE_TentSitMarker, myOriginAng, myPlayerSitMarker_Pos)
	myPlayerLayDownMarker = PlaceAtMeRelative(self, _DE_TentLayDownMarker, myOriginAng, myPlayerLayDownMarker_Pos, fZLocalAngAdjust = 180.0)
	mySpareBedRoll1 = PlaceAtMeRelative(self, _DE_Bedroll_NPC_FL, myOriginAng, mySpareBedRoll1_Pos)
	;mySpareBedRoll2 = PlaceAtMeRelative(self, _DE_Bedroll_NPC_FR, myOriginAng, mySpareBedRoll2_Pos)
	myFollowerAMarker_MainWeapon = PlaceAtMeRelative(self, _DE_Tent_MainWeaponMarker, myOriginAng, myFollowerAMarker_MainWeapon_Pos)
	myFollowerAMarker_OffHandWeapon = PlaceAtMeRelative(self, _DE_Tent_OffHandWeaponMarker, myOriginAng, myFollowerAMarker_OffHandWeapon_Pos)
	myFollowerAMarker_BigWeapon = PlaceAtMeRelative(self, _DE_Tent_BigWeaponMarker, myOriginAng, myFollowerAMarker_BigWeapon_Pos)
	myFollowerAMarker_Bow = PlaceAtMeRelative(self, _DE_Tent_BowMarker, myOriginAng, myFollowerAMarker_Bow_Pos)
	;myFollowerAMarker_Shield = PlaceAtMeRelative(self, _DE_Tent_ShieldMarker, myOriginAng, myFollowerAMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
	;myFollowerBMarker_MainWeapon = PlaceAtMeRelative(self, _DE_Tent_MainWeaponMarker, myOriginAng, myFollowerBMarker_MainWeapon_Pos)
	;myFollowerBMarker_OffHandWeapon = PlaceAtMeRelative(self, _DE_Tent_OffHandWeaponMarker, myOriginAng, myFollowerBMarker_OffHandWeapon_Pos)
	;myFollowerBMarker_BigWeapon = PlaceAtMeRelative(self, _DE_Tent_BigWeaponMarker, myOriginAng, myFollowerBMarker_BigWeapon_Pos)
	;myFollowerBMarker_Bow = PlaceAtMeRelative(self, _DE_Tent_BowMarker, myOriginAng, myFollowerBMarker_Bow_Pos)
	;myFollowerBMarker_Shield = PlaceAtMeRelative(self, _DE_Tent_ShieldMarker, myOriginAng, myFollowerBMarker_Shield_Pos, fXLocalAngAdjust = 90.0, fZLocalAngAdjust = 124.0, abInvertedLocalY = true, abIsPropped = true)
	;trace("[FROSTFALL] Object placement complete.")
	
	;Move primary bedroll (self) to new position
	self.MoveTo(myBedRoll)
	
endEvent

function GetRelativePositions()
	myTent_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_Tent_PosRef)
	myGroundCover_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent_GroundCover_PosRef)
	myBedRoll_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_PlayerBedroll_PosRef)
	myLanternUnlit_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_LanternA_PosRef)
	myLanternLit_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_LanternA_PosRef)
	myLanternLight_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_LightA_PosRef)
	myLanternUnlit2_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_LanternB_PosRef)
	myLanternLit2_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_LanternB_PosRef)
	myLanternLight2_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_LightB_PosRef)
	myLanternUnlit3_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_LanternC_PosRef)
	myLanternLit3_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_LanternC_PosRef)
	myLanternLight3_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_LightC_PosRef)
	myPlayerMarker_MainWeapon_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_PlayerMainHand_PosRef)
	myPlayerMarker_OffHandWeapon_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_PlayerOffHand_PosRef)
	myPlayerMarker_BigWeapon_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_PlayerTwoHand_PosRef)
	myPlayerMarker_Bow_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_PlayerBow_PosRef)
	myPlayerMarker_Helm_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_Helmet_PosRef)
	myPlayerMarker_Boots_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_Boots_PosRef)
	myPlayerMarker_Gauntlets_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_Gauntlets_PosRef)
	myPlayerMarker_Cuirass_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_Cuirass_PosRef)
	myPlayerMarker_Backpack_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_Backpack_PosRef)
	myPlayerMarker_Shield_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_PlayerShield_PosRef)
	myPlayerMarker_ShieldInterior_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_PlayerShieldInterior_PosRef)
	myPlayerSitMarker_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_PlayerSitMarker_PosRef)
	myPlayerLayDownMarker_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_PlayerLayDownMarker_PosRef)
	myWard_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_Ward_PosRef)
	mySpareBedRoll1_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_FollowerABedroll_PosRef)
	;mySpareBedRoll2_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_FollowerBBedroll_PosRef)
	myFollowerAMarker_MainWeapon_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_FollowerAMainHand_PosRef)
	myFollowerAMarker_OffHandWeapon_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_FollowerAOffHand_PosRef)
	myFollowerAMarker_BigWeapon_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_FollowerATwoHand_PosRef)
	myFollowerAMarker_Bow_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_FollowerABow_PosRef)
	;myFollowerBMarker_MainWeapon_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_FollowerBMainHand_PosRef)
	;myFollowerBMarker_OffHandWeapon_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_FollowerBOffHand_PosRef)
	;myFollowerBMarker_BigWeapon_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_FollowerBTwoHand_PosRef)
	;myFollowerBMarker_Bow_Pos = GetRelativePosition(_DE_LargeLeatherTent3BR_Tent_PosRef, _DE_LargeLeatherTent3BR_FollowerBBow_PosRef)
endFunction