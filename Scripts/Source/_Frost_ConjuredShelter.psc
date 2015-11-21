scriptname _Frost_ConjuredShelter extends CampTentEx

;Misc
EffectShader property ShockDisintegrate01FXS auto
VisualEffect property MGTeleportInEffect auto

float property ShelterID auto hidden
int property mySoundID auto hidden


; @Override CampTent
function TakeDown()
	SetCurrentTent(None)
	(self as _Camp_PlaceableObjectBase).TakeDown()

	; Destroy invisible objects (markers, etc)
	TryToDisableAndDeleteRef(myPlayerMarker_MainWeapon)
	TryToDisableAndDeleteRef(myPlayerMarker_OffHandWeapon)
	TryToDisableAndDeleteRef(myPlayerMarker_BigWeapon)
	TryToDisableAndDeleteRef(myPlayerMarker_Bow)
	TryToDisableAndDeleteRef(myPlayerMarker_Cuirass)
	TryToDisableAndDeleteRef(myPlayerMarker_Helm)
	TryToDisableAndDeleteRef(myPlayerMarker_Boots)
	TryToDisableAndDeleteRef(myPlayerMarker_Gauntlets)
	TryToDisableAndDeleteRef(myPlayerMarker_Backpack)
	TryToDisableAndDeleteRef(myPlayerMarker_Shield)
	TryToDisableAndDeleteRef(myPlayerMarker_ShieldInterior)
	TryToDisableAndDeleteRef(myPlayerSitMarker)
	TryToDisableAndDeleteRef(myPlayerLayDownMarker)
	TryToDisableAndDeleteRef(myPlayerWithSpouseLayDownMarker)
	TryToDisableAndDeleteRef(mySpouseLayDownMarker)
	TryToDisableAndDeleteRef(myAnimalLayDownMarker)
	TryToDisableAndDeleteRef(myExitFront)
	TryToDisableAndDeleteRef(mySpareBedRoll1SitMarker)
	TryToDisableAndDeleteRef(mySpareBedRoll2SitMarker)
	TryToDisableAndDeleteRef(mySpareBedRoll3SitMarker)
	TryToDisableAndDeleteRef(myShelterCollider)
	TryToDisableAndDeleteRef(myLargeTentTriggerVolume)
	TryToDisableAndDeleteRef(myFollowerAMarker_MainWeapon)
	TryToDisableAndDeleteRef(myFollowerAMarker_OffHandWeapon)
	TryToDisableAndDeleteRef(myFollowerAMarker_BigWeapon)
	TryToDisableAndDeleteRef(myFollowerAMarker_Bow)
	TryToDisableAndDeleteRef(myFollowerAMarker_Shield)
	TryToDisableAndDeleteRef(myFollowerBMarker_MainWeapon)
	TryToDisableAndDeleteRef(myFollowerBMarker_OffHandWeapon)
	TryToDisableAndDeleteRef(myFollowerBMarker_BigWeapon)
	TryToDisableAndDeleteRef(myFollowerBMarker_Bow)
	TryToDisableAndDeleteRef(myFollowerBMarker_Shield)
	TryToDisableAndDeleteRef(myFollowerCMarker_MainWeapon)
	TryToDisableAndDeleteRef(myFollowerCMarker_OffHandWeapon)
	TryToDisableAndDeleteRef(myFollowerCMarker_BigWeapon)
	TryToDisableAndDeleteRef(myFollowerCMarker_Bow)
	TryToDisableAndDeleteRef(myFollowerCMarker_Shield)
	TryToDisableAndDeleteRef(myDisplayQuiver)
	TryToDisableAndDeleteRef(myDisplayShield)
	TryToDisableAndDeleteRef(myDisplayHelm)
	TryToDisableAndDeleteRef(myDisplayBackpack)
	TryToDisableAndDeleteRef(myDisplayBoots)
	TryToDisableAndDeleteRef(myDisplayGauntlets)
	TryToDisableAndDeleteRef(myDisplayCuirass)
	TryToDisableAndDeleteRef(myDisplayMainWeapon)
	TryToDisableAndDeleteRef(myDisplayOffHandWeapon)
	TryToDisableAndDeleteRef(myDisplayBigWeapon)
	TryToDisableAndDeleteRef(myDisplayBow)
	TryToDisableAndDeleteRef(myDisplayFollowerAShield)
	TryToDisableAndDeleteRef(myDisplayFollowerAMainWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerAOffHandWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerABigWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerABow)
	TryToDisableAndDeleteRef(myDisplayFollowerBShield)
	TryToDisableAndDeleteRef(myDisplayFollowerBMainWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerBOffHandWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerBBigWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerBBow)
	TryToDisableAndDeleteRef(myDisplayFollowerCShield)
	TryToDisableAndDeleteRef(myDisplayFollowerCMainWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerCOffHandWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerCBigWeapon)
	TryToDisableAndDeleteRef(myDisplayFollowerCBow)

	; Warp out visible objects
	WarpOutRef(myClutterStatic1)
	WarpOutRef(myClutterStatic2)
	WarpOutRef(myClutterStatic3)
	WarpOutRef(myClutterStatic4)
	WarpOutRef(myClutterStatic5)
	WarpOutRef(myClutterActivator1)
	WarpOutRef(myClutterActivator2)
	WarpOutRef(myClutterActivator3)
	WarpOutRef(myClutterActivator4)
	WarpOutRef(myClutterActivator5)
	WarpOutRef(myClutterFurniture1)
	WarpOutRef(myClutterFurniture2)
	WarpOutRef(myClutterFurniture3)
	WarpOutRef(myClutterFurniture4)
	WarpOutRef(myClutterFurniture5)
	WarpOutRef(myBedRoll)
	WarpOutRef(myWard)
	WarpOutRef(myLanternLit)
	WarpOutRef(myLanternUnlit)
	WarpOutRef(myLanternLight)
	WarpOutRef(myLanternLit2)
	WarpOutRef(myLanternUnlit2)
	WarpOutRef(myLanternLight2)
	WarpOutRef(myLanternLit3)
	WarpOutRef(myLanternUnlit3)
	WarpOutRef(myLanternLight3)
	WarpOutRef(mySpareBedRoll1)
	WarpOutRef(mySpareBedRoll2)
	WarpOutRef(mySpareBedRoll3)
	WarpOutRef(mySnowTent)
	WarpOutRef(myAshTent)
	WarpOutRef(myNormalTent)
	WarpOutRef(myTent)

	Utility.Wait(1.2)

	; Remove references
	TryToDisableAndDeleteRef(myClutterStatic1)
	TryToDisableAndDeleteRef(myClutterStatic2)
	TryToDisableAndDeleteRef(myClutterStatic3)
	TryToDisableAndDeleteRef(myClutterStatic4)
	TryToDisableAndDeleteRef(myClutterStatic5)
	TryToDisableAndDeleteRef(myClutterActivator1)
	TryToDisableAndDeleteRef(myClutterActivator2)
	TryToDisableAndDeleteRef(myClutterActivator3)
	TryToDisableAndDeleteRef(myClutterActivator4)
	TryToDisableAndDeleteRef(myClutterActivator5)
	TryToDisableAndDeleteRef(myClutterFurniture1)
	TryToDisableAndDeleteRef(myClutterFurniture2)
	TryToDisableAndDeleteRef(myClutterFurniture3)
	TryToDisableAndDeleteRef(myClutterFurniture4)
	TryToDisableAndDeleteRef(myClutterFurniture5)
	TryToDisableAndDeleteRef(myBedRoll)
	TryToDisableAndDeleteRef(myWard)
	TryToDisableAndDeleteRef(myLanternLit)
	TryToDisableAndDeleteRef(myLanternUnlit)
	TryToDisableAndDeleteRef(myLanternLight)
	TryToDisableAndDeleteRef(myLanternLit2)
	TryToDisableAndDeleteRef(myLanternUnlit2)
	TryToDisableAndDeleteRef(myLanternLight2)
	TryToDisableAndDeleteRef(myLanternLit3)
	TryToDisableAndDeleteRef(myLanternUnlit3)
	TryToDisableAndDeleteRef(myLanternLight3)
	TryToDisableAndDeleteRef(mySpareBedRoll1)
	TryToDisableAndDeleteRef(mySpareBedRoll2)
	TryToDisableAndDeleteRef(mySpareBedRoll3)
	TryToDisableAndDeleteRef(mySnowTent)
	TryToDisableAndDeleteRef(myAshTent)
	TryToDisableAndDeleteRef(myNormalTent)
	TryToDisableAndDeleteRef(myTent)

	; Clear properties to ensure proper reference removal
	myPlayerMarker_MainWeapon = None
	myPlayerMarker_OffHandWeapon = None
	myPlayerMarker_BigWeapon = None
	myPlayerMarker_Bow = None
	myPlayerMarker_Cuirass = None
	myPlayerMarker_Helm = None
	myPlayerMarker_Boots = None
	myPlayerMarker_Gauntlets = None
	myPlayerMarker_Backpack = None
	myPlayerMarker_Shield = None
	myPlayerMarker_ShieldInterior = None
	myClutterStatic1 = None
	myClutterStatic2 = None
	myClutterStatic3 = None
	myClutterStatic4 = None
	myClutterStatic5 = None
	myClutterActivator1 = None
	myClutterActivator2 = None
	myClutterActivator3 = None
	myClutterActivator4 = None
	myClutterActivator5 = None
	myClutterFurniture1 = None
	myClutterFurniture2 = None
	myClutterFurniture3 = None
	myClutterFurniture4 = None
	myClutterFurniture5 = None
	myPlayerSitMarker = None
	myPlayerLayDownMarker = None
	myPlayerWithSpouseLayDownMarker = None
	mySpouseLayDownMarker = None
	myAnimalLayDownMarker = None
	myExitFront = None
	myBedRoll = None
	myWard = None
	myLanternLit = None
	myLanternUnlit = None
	myLanternLight = None
	myLanternLit2 = None
	myLanternUnlit2 = None
	myLanternLight2 = None
	myLanternLit3 = None
	myLanternUnlit3 = None
	myLanternLight3 = None
	mySpareBedRoll1 = None
	mySpareBedRoll2 = None
	mySpareBedRoll3 = None
	mySpareBedRoll1SitMarker = None
	mySpareBedRoll2SitMarker = None
	mySpareBedRoll3SitMarker = None
	mySnowTent = None
	myAshTent = None
	myNormalTent = None
	myTent = None
	myShelterCollider = None
	myLargeTentTriggerVolume = None
	myFollowerAMarker_MainWeapon = None
	myFollowerAMarker_OffHandWeapon = None
	myFollowerAMarker_BigWeapon = None
	myFollowerAMarker_Bow = None
	myFollowerAMarker_Shield = None
	myFollowerBMarker_MainWeapon = None
	myFollowerBMarker_OffHandWeapon = None
	myFollowerBMarker_BigWeapon = None
	myFollowerBMarker_Bow = None
	myFollowerBMarker_Shield = None
	myFollowerCMarker_MainWeapon = None
	myFollowerCMarker_OffHandWeapon = None
	myFollowerCMarker_BigWeapon = None
	myFollowerCMarker_Bow = None
	myFollowerCMarker_Shield = None
	myDisplayQuiver = None
	myDisplayShield = None
	myDisplayHelm = None
	myDisplayBackpack = None
	myDisplayBoots = None
	myDisplayGauntlets = None
	myDisplayCuirass = None
	myDisplayMainWeapon = None
	myDisplayOffHandWeapon = None
	myDisplayBigWeapon = None
	myDisplayBow = None
	myDisplayFollowerAShield = None
	myDisplayFollowerAMainWeapon = None
	myDisplayFollowerAOffHandWeapon = None
	myDisplayFollowerABigWeapon = None
	myDisplayFollowerABow = None
	myDisplayFollowerBShield = None
	myDisplayFollowerBMainWeapon = None
	myDisplayFollowerBOffHandWeapon = None
	myDisplayFollowerBBigWeapon = None
	myDisplayFollowerBBow = None
	myDisplayFollowerCShield = None
	myDisplayFollowerCMainWeapon = None
	myDisplayFollowerCOffHandWeapon = None
	myDisplayFollowerCBigWeapon = None
	myDisplayFollowerCBow = None

	TryToDisableAndDeleteRef(self)
endFunction

function PlayWarpInEffect(ObjectReference akObject)
	if Is3DLoadedFinite(akObject)
		MGTeleportInEffect.Play(akObject, 3.0)
	endif
endFunction

function WarpOutRef(ObjectReference akObject)
	if akObject && Is3DLoadedFinite(akObject)
		ShockDisintegrate01FXS.Play(akObject)
		Utility.Wait(0.1)
	endif
endFunction

bool function Is3DLoadedFinite(ObjectReference akObject)
	;Prevents an infinite loop waiting for an object that may
	;never load correctly.
	int i = 0
	while !akObject.Is3DLoaded() && i < 500
		i += 1
	endWhile
	if i >= 500
		return false
	else
		return true
	endif
endFunction

function SummonSphere()
	mySphere = PlaceAtMeRelative(self, _DE_MageSphere1, myOriginAng, mySphere_Pos, abInitiallyDisabled = true)
	float mySphereScale = _DE_Shelter_L_Sphere.GetScale()		
	mySphere.SetScale(mySphereScale / 10.0)
	mySphere.PlaceAtMe(SummonTargetFXActivator)
	mySphere.Enable()	
	mySphere.SetScale(mySphereScale / 9.0)
	mySphere.SetScale(mySphereScale / 8.0)
	mySphere.SetScale(mySphereScale / 7.0)
	mySphere.SetScale(mySphereScale / 6.0)
	mySphere.SetScale(mySphereScale / 5.0)
	mySphere.SetScale(mySphereScale / 4.0)
	mySphere.SetScale(mySphereScale / 3.0)
	mySphere.SetScale(mySphereScale / 2.0)
	mySphere.SetScale(mySphereScale / 1.8)
	mySphere.SetScale(mySphereScale / 1.6)
	mySphere.SetScale(mySphereScale / 1.4)
	mySphere.SetScale(mySphereScale / 1.2)
	mySphere.SetScale(mySphereScale)
	mySphere.SetScale(mySphereScale / 0.8)
	mySphere.SetScale(mySphereScale / 0.6)
	;Bounce the sphere effect
	float fDivisor = 0.61
	while fDivisor < 1.0
		mySphere.SetScale(mySphereScale / fDivisor)
		fDivisor += 0.01
	endWhile
endFunction

function DispelSphere()
	if mySphere
		;Suck in the sphere
		mySphere.PlaceAtMe(SummonTargetFXActivator)
		wait(1.0)
		float mySphereScale = _DE_Shelter_L_Sphere.GetScale()
		float fDivisor = 1.0
		while fDivisor < 1.6
			mySphere.SetScale(mySphereScale / fDivisor)
			fDivisor += 0.01
		endWhile

		fDivisor = 1.5
		while fDivisor < 20.0
			mySphere.SetScale(mySphereScale / fDivisor)
			fDivisor += 1.0
		endWhile
		mySphere.Disable()
		mySphere.Delete()
	endif
endFunction