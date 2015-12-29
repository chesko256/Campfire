scriptname CampConjuredShelter extends CampTentEx

import _CampInternal
import CampUtil
import TentSystem

int property Setting_SpareBedType = 1 auto
{ DESCRIPTION: Optional: What type of bed to spawn for followers. All beds are 'single'. 0 = Bed Roll; 1 = CommonBed; 2 = UpperBed; 3 = NobleBed; 4 = OrcBed; 5 = DwemerBed. }

Static property TentAsset_SphereModel auto
{ DESCRIPTION: Optional: The tent static object. }

Static property TentAsset_BaseStatic1 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property TentAsset_BaseStatic2 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property TentAsset_BaseStatic3 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property TentAsset_BaseStatic4 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property TentAsset_BaseStatic5 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property TentAsset_BaseStatic6 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property TentAsset_BaseStatic7 auto
{ DESCRIPTION: Optional: A static that acts as the base of the shelter. Inherits the scale of the Position Ref and is high on the placement order. }

Static property TentAsset_ClutterStatic6 auto
{ DESCRIPTION: Optional: A static to place in or around the shelter. }

Static property TentAsset_ClutterStatic7 auto
{ DESCRIPTION: Optional: A static to place in or around the shelter. }

MiscObject property TentAsset_ClutterMisc1 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. MiscObjects placed this way cannot be picked up, and do not simulate physics. }

MiscObject property TentAsset_ClutterMisc2 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. MiscObjects placed this way cannot be picked up, and do not simulate physics. }

MiscObject property TentAsset_ClutterMisc3 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. MiscObjects placed this way cannot be picked up, and do not simulate physics. }

MiscObject property TentAsset_ClutterMisc4 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. MiscObjects placed this way cannot be picked up, and do not simulate physics. }

MiscObject property TentAsset_ClutterMisc5 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. MiscObjects placed this way cannot be picked up, and do not simulate physics. }

MiscObject property TentAsset_ClutterMisc6 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. MiscObjects placed this way cannot be picked up, and do not simulate physics. }

MiscObject property TentAsset_ClutterMisc7 auto
{ DESCRIPTION: Optional: A MiscObject to place in or around the shelter. MiscObjects placed this way cannot be picked up, and do not simulate physics. }

Furniture property TentAsset_ClutterFurniture6 auto
{ DESCRIPTION: Optional: A furniture object to place in or around the tent. }

Furniture property TentAsset_ClutterFurniture7 auto
{ DESCRIPTION: Optional: A furniture object to place in or around the tent. }

ObjectReference property PositionRef_Sphere auto
{ DESCRIPTION: Optional: The shelter (tent, structure) position reference. }

ObjectReference property PositionRef_BaseStatic1 auto
{ DESCRIPTION: Optional: Shelter base position reference. Scale is used during placement. }

ObjectReference property PositionRef_BaseStatic2 auto
{ DESCRIPTION: Optional: Shelter base position reference. Scale is used during placement. }

ObjectReference property PositionRef_BaseStatic3 auto
{ DESCRIPTION: Optional: Shelter base position reference. Scale is used during placement. }

ObjectReference property PositionRef_BaseStatic4 auto
{ DESCRIPTION: Optional: Shelter base position reference. Scale is used during placement. }

ObjectReference property PositionRef_BaseStatic5 auto
{ DESCRIPTION: Optional: Shelter base position reference. Scale is used during placement. }

ObjectReference property PositionRef_BaseStatic6 auto
{ DESCRIPTION: Optional: Shelter base position reference. Scale is used during placement. }

ObjectReference property PositionRef_BaseStatic7 auto
{ DESCRIPTION: Optional: Shelter base position reference. Scale is used during placement. }

ObjectReference property PositionRef_ClutterStatic6 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterStatic7 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterMisc1 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterMisc2 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterMisc3 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterMisc4 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterMisc5 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterMisc6 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterMisc7 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterFurniture6 auto
{ DESCRIPTION: Optional: Clutter position reference. }

ObjectReference property PositionRef_ClutterFurniture7 auto
{ DESCRIPTION: Optional: Clutter position reference. }

; PRIVATE
;Run-time objects
ObjectReference property mySphere auto hidden


;Futures
ObjectReference property mySphereFuture auto hidden


;Misc
EffectShader property ShockDisintegrate01FXS auto
VisualEffect property MGTeleportInEffect auto
Activator property SummonTargetFXActivator auto

float property ShelterID auto hidden
int property mySoundID auto hidden

function TakeDown()
	SetCurrentTent(None)
	(self as _Camp_PlaceableObjectBase).TakeDown()

	ForceStopUsingFurniture(myClutterFurniture1)
	ForceStopUsingFurniture(myClutterFurniture2)
	ForceStopUsingFurniture(myClutterFurniture3)
	ForceStopUsingFurniture(myClutterFurniture4)
	ForceStopUsingFurniture(myClutterFurniture5)
	ForceStopUsingFurniture(myClutterFurniture6)
	ForceStopUsingFurniture(myClutterFurniture7)
	ForceStopUsingFurniture(myPlayerSitMarker)
	ForceStopUsingFurniture(myPlayerLayDownMarker)
	ForceStopUsingFurniture(myPlayerWithSpouseLayDownMarker)
	ForceStopUsingFurniture(mySpouseLayDownMarker)
	ForceStopUsingFurniture(myAnimalLayDownMarker)
	ForceStopUsingFurniture(myBedRoll)
	ForceStopUsingFurniture(mySpareBedRoll1)
	ForceStopUsingFurniture(mySpareBedRoll2)
	ForceStopUsingFurniture(mySpareBedRoll3)
	ForceStopUsingFurniture(mySpareBedRoll1SitMarker)
	ForceStopUsingFurniture(mySpareBedRoll2SitMarker)
	ForceStopUsingFurniture(mySpareBedRoll3SitMarker)

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
	WarpOutRef(myBaseStatic1)
	WarpOutRef(myBaseStatic2)
	WarpOutRef(myBaseStatic3)
	WarpOutRef(myBaseStatic4)
	WarpOutRef(myBaseStatic5)
	WarpOutRef(myBaseStatic6)
	WarpOutRef(myBaseStatic7)
	WarpOutRef(myClutterStatic1)
	WarpOutRef(myClutterStatic2)
	WarpOutRef(myClutterStatic3)
	WarpOutRef(myClutterStatic4)
	WarpOutRef(myClutterStatic5)
	WarpOutRef(myClutterStatic6)
	WarpOutRef(myClutterStatic7)
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
	WarpOutRef(myClutterFurniture6)
	WarpOutRef(myClutterFurniture7)
	WarpOutRef(myBedRoll)
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

	Utility.Wait(1.2)

	; Warp out the sphere

	; Remove references
	TryToDisableAndDeleteRef(myBaseStatic1)
	TryToDisableAndDeleteRef(myBaseStatic2)
	TryToDisableAndDeleteRef(myBaseStatic3)
	TryToDisableAndDeleteRef(myBaseStatic4)
	TryToDisableAndDeleteRef(myBaseStatic5)
	TryToDisableAndDeleteRef(myBaseStatic6)
	TryToDisableAndDeleteRef(myBaseStatic7)
	TryToDisableAndDeleteRef(myClutterMisc1)
	TryToDisableAndDeleteRef(myClutterMisc2)
	TryToDisableAndDeleteRef(myClutterMisc3)
	TryToDisableAndDeleteRef(myClutterMisc4)
	TryToDisableAndDeleteRef(myClutterMisc5)
	TryToDisableAndDeleteRef(myClutterMisc6)
	TryToDisableAndDeleteRef(myClutterMisc7)
	TryToDisableAndDeleteRef(myClutterStatic1)
	TryToDisableAndDeleteRef(myClutterStatic2)
	TryToDisableAndDeleteRef(myClutterStatic3)
	TryToDisableAndDeleteRef(myClutterStatic4)
	TryToDisableAndDeleteRef(myClutterStatic5)
	TryToDisableAndDeleteRef(myClutterStatic6)
	TryToDisableAndDeleteRef(myClutterStatic7)
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
	TryToDisableAndDeleteRef(myClutterFurniture6)
	TryToDisableAndDeleteRef(myClutterFurniture7)
	TryToDisableAndDeleteRef(myBedRoll)
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
	TryToDisableAndDeleteRef(mySphere)

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
	myClutterMisc1 = None
	myClutterMisc2 = None
	myClutterMisc3 = None
	myClutterMisc4 = None
	myClutterMisc5 = None
	myClutterMisc6 = None
	myClutterMisc7 = None
	myClutterStatic1 = None
	myClutterStatic2 = None
	myClutterStatic3 = None
	myClutterStatic4 = None
	myClutterStatic5 = None
	myClutterStatic6 = None
	myClutterStatic7 = None
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
	myClutterFurniture6 = None
	myClutterFurniture7 = None
	myPlayerSitMarker = None
	myPlayerLayDownMarker = None
	myPlayerWithSpouseLayDownMarker = None
	mySpouseLayDownMarker = None
	myAnimalLayDownMarker = None
	myBedRoll = None
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
	mySphere = None
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

function WarpInObjects()
	if myBaseStatic1
		myBaseStatic1.EnableNoWait()
		PlayWarpInEffect(myBaseStatic1)
	endif
	if myBaseStatic2
		myBaseStatic2.EnableNoWait()
		PlayWarpInEffect(myBaseStatic2)
	endif
	if myBaseStatic3
		myBaseStatic3.EnableNoWait()
		PlayWarpInEffect(myBaseStatic3)
	endif
	if myBaseStatic4
		myBaseStatic4.EnableNoWait()
		PlayWarpInEffect(myBaseStatic4)
	endif
	if myBaseStatic5
		myBaseStatic5.EnableNoWait()
		PlayWarpInEffect(myBaseStatic5)
	endif
	if myBaseStatic6
		myBaseStatic6.EnableNoWait()
		PlayWarpInEffect(myBaseStatic6)
	endif
	if myBaseStatic7
		myBaseStatic7.EnableNoWait()
		PlayWarpInEffect(myBaseStatic7)
	endif
	Utility.Wait(0.3)
	if myClutterFurniture1
		myClutterFurniture1.EnableNoWait()
		PlayWarpInEffect(myClutterFurniture1)
	endif
	if myClutterFurniture2
		myClutterFurniture2.EnableNoWait()
		PlayWarpInEffect(myClutterFurniture2)		
	endif
	if myClutterFurniture3
		myClutterFurniture3.EnableNoWait()
		PlayWarpInEffect(myClutterFurniture3)		
	endif
	if myClutterFurniture4
		myClutterFurniture4.EnableNoWait()
		PlayWarpInEffect(myClutterFurniture4)		
	endif
	if myClutterFurniture5
		myClutterFurniture5.EnableNoWait()
		PlayWarpInEffect(myClutterFurniture5)		
	endif
	if myClutterFurniture6
		myClutterFurniture6.EnableNoWait()
		PlayWarpInEffect(myClutterFurniture6)		
	endif
	if myClutterFurniture7
		myClutterFurniture7.EnableNoWait()
		PlayWarpInEffect(myClutterFurniture7)		
	endif
	Utility.Wait(0.3)
	if myClutterStatic1
		myClutterStatic1.EnableNoWait()
		PlayWarpInEffect(myClutterStatic1)
	endif
	if myClutterStatic2
		myClutterStatic2.EnableNoWait()
		PlayWarpInEffect(myClutterStatic2)
	endif
	if myClutterStatic3
		myClutterStatic3.EnableNoWait()
		PlayWarpInEffect(myClutterStatic3)
	endif
	if myClutterStatic4
		myClutterStatic4.EnableNoWait()
		PlayWarpInEffect(myClutterStatic4)
	endif
	if myClutterStatic5
		myClutterStatic5.EnableNoWait()
		PlayWarpInEffect(myClutterStatic5)
	endif
	if myClutterStatic6
		myClutterStatic6.EnableNoWait()
		PlayWarpInEffect(myClutterStatic6)
	endif
	if myClutterStatic7
		myClutterStatic7.EnableNoWait()
		PlayWarpInEffect(myClutterStatic7)
	endif
	Utility.Wait(0.3)
	if mySpareBedRoll1
		mySpareBedRoll1.EnableNoWait()
		PlayWarpInEffect(mySpareBedRoll1)
	endif
	if mySpareBedRoll2
		mySpareBedRoll2.EnableNoWait()
		PlayWarpInEffect(mySpareBedRoll2)
	endif
	if mySpareBedRoll3
		mySpareBedRoll3.EnableNoWait()
		PlayWarpInEffect(mySpareBedRoll3)
	endif
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
	;/if mySphere
		float mySphereScale = PositionRef_Sphere.GetScale()		
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
	endif
	/;
endFunction

function DispelSphere()
	;/if mySphere
		;Suck in the sphere
		mySphere.PlaceAtMe(SummonTargetFXActivator)
		Utility.Wait(1.0)
		float mySphereScale = PositionRef_Sphere.GetScale()
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
	/;
endFunction

;function PlaceObject_Sphere()
;	mySphereFuture = PlacementSystem.PlaceObject(self, TentAsset_SphereModel, PositionRef_Sphere, initially_disabled = true, is_temp = is_temporary)
;endFunction

; Warp-in objects
function PlaceObject_BaseStatic1()
	myBaseStatic1Future = PlacementSystem.PlaceObject(self, TentAsset_BaseStatic1, PositionRef_BaseStatic1, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_BaseStatic2()
	myBaseStatic2Future = PlacementSystem.PlaceObject(self, TentAsset_BaseStatic2, PositionRef_BaseStatic2, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_BaseStatic3()
	myBaseStatic3Future = PlacementSystem.PlaceObject(self, TentAsset_BaseStatic3, PositionRef_BaseStatic3, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_BaseStatic4()
	myBaseStatic4Future = PlacementSystem.PlaceObject(self, TentAsset_BaseStatic4, PositionRef_BaseStatic4, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_BaseStatic5()
	myBaseStatic5Future = PlacementSystem.PlaceObject(self, TentAsset_BaseStatic5, PositionRef_BaseStatic5, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_BaseStatic6()
	myBaseStatic6Future = PlacementSystem.PlaceObject(self, TentAsset_BaseStatic6, PositionRef_BaseStatic6, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_BaseStatic7()
	myBaseStatic7Future = PlacementSystem.PlaceObject(self, TentAsset_BaseStatic7, PositionRef_BaseStatic7, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_ClutterFurniture1(CampTentEx Extended)
	myClutterFurniture1Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture1, Extended.PositionRef_ClutterFurniture1, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterFurniture2(CampTentEx Extended)
	myClutterFurniture2Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture2, Extended.PositionRef_ClutterFurniture2, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterFurniture3(CampTentEx Extended)
	myClutterFurniture3Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture3, Extended.PositionRef_ClutterFurniture3, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterFurniture4(CampTentEx Extended)
	myClutterFurniture4Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture4, Extended.PositionRef_ClutterFurniture4, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterFurniture5(CampTentEx Extended)
	myClutterFurniture5Future = PlacementSystem.PlaceObject(self, Extended.TentAsset_ClutterFurniture5, Extended.PositionRef_ClutterFurniture5, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterFurniture6()
	myClutterFurniture6Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterFurniture6, PositionRef_ClutterFurniture6, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterFurniture7()
	myClutterFurniture7Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterFurniture7, PositionRef_ClutterFurniture7, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterStatic1()
	myClutterStatic1Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic1, PositionRef_ClutterStatic1, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterStatic2()
	myClutterStatic2Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic2, PositionRef_ClutterStatic2, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterStatic3()
	myClutterStatic3Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic3, PositionRef_ClutterStatic3, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterStatic4()
	myClutterStatic4Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic4, PositionRef_ClutterStatic4, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterStatic5()
	myClutterStatic5Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic5, PositionRef_ClutterStatic5, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterStatic6()
	myClutterStatic6Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic6, PositionRef_ClutterStatic6, initially_disabled = true, is_temp = is_temporary)
endFunction
function PlaceObject_ClutterStatic7()
	myClutterStatic7Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterStatic7, PositionRef_ClutterStatic7, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_SpareBedRoll1(CampTentEx Extended)
	;@TODO
	Furniture spare_bed
	if Setting_SpareBedType == 0		; Bed Roll
		spare_bed = Game.GetFormFromFile(0x02038CBF, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 1	; Common
		spare_bed = Game.GetFormFromFile(0x0205DE67, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 2	; Upper
		spare_bed = Game.GetFormFromFile(0x0205DE6B, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 3	; Noble
		spare_bed = Game.GetFormFromFile(0x0205DE69, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 4	; Orcish
		spare_bed = Game.GetFormFromFile(0x0205DE6A, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 5	; Dwemer
		spare_bed = Game.GetFormFromFile(0x0205DE68, "Campfire.esm") as Furniture
	else 								; Fall back to Common
		spare_bed = Game.GetFormFromFile(0x0205DE67, "Campfire.esm") as Furniture
	endif
	mySpareBedRoll1Future = PlacementSystem.PlaceObject(self, spare_bed, Extended.PositionRef_Follower1_Bed, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_SpareBedRoll2(CampTentEx Extended)
	Furniture spare_bed
	if Setting_SpareBedType == 0		; Bed Roll
		spare_bed = Game.GetFormFromFile(0x02038CBF, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 1	; Common
		spare_bed = Game.GetFormFromFile(0x0205DE67, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 2	; Upper
		spare_bed = Game.GetFormFromFile(0x0205DE6B, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 3	; Noble
		spare_bed = Game.GetFormFromFile(0x0205DE69, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 4	; Orcish
		spare_bed = Game.GetFormFromFile(0x0205DE6A, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 5	; Dwemer
		spare_bed = Game.GetFormFromFile(0x0205DE68, "Campfire.esm") as Furniture
	else 								; Fall back to Common
		spare_bed = Game.GetFormFromFile(0x0205DE67, "Campfire.esm") as Furniture
	endif
	mySpareBedRoll2Future = PlacementSystem.PlaceObject(self, spare_bed, Extended.PositionRef_Follower2_Bed, initially_disabled = true, is_temp = is_temporary)
endFunction

function PlaceObject_SpareBedRoll3(CampTentEx Extended)
	Furniture spare_bed
	if Setting_SpareBedType == 0		; Bed Roll
		spare_bed = Game.GetFormFromFile(0x02038CBF, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 1	; Common
		spare_bed = Game.GetFormFromFile(0x0205DE67, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 2	; Upper
		spare_bed = Game.GetFormFromFile(0x0205DE6B, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 3	; Noble
		spare_bed = Game.GetFormFromFile(0x0205DE69, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 4	; Orcish
		spare_bed = Game.GetFormFromFile(0x0205DE6A, "Campfire.esm") as Furniture
	elseif Setting_SpareBedType == 5	; Dwemer
		spare_bed = Game.GetFormFromFile(0x0205DE68, "Campfire.esm") as Furniture
	else 								; Fall back to Common
		spare_bed = Game.GetFormFromFile(0x0205DE67, "Campfire.esm") as Furniture
	endif
	mySpareBedRoll3Future = PlacementSystem.PlaceObject(self, spare_bed, Extended.PositionRef_Follower3_Bed, initially_disabled = true, is_temp = is_temporary)
endFunction

; Non-warping objects
function PlaceObject_ClutterMisc1()
	myClutterMisc1Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterMisc1, PositionRef_ClutterMisc1, is_temp = is_temporary, is_interaction_disabled = true)
endFunction
function PlaceObject_ClutterMisc2()
	myClutterMisc2Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterMisc2, PositionRef_ClutterMisc2, is_temp = is_temporary, is_interaction_disabled = true)
endFunction
function PlaceObject_ClutterMisc3()
	myClutterMisc3Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterMisc3, PositionRef_ClutterMisc3, is_temp = is_temporary, is_interaction_disabled = true)
endFunction
function PlaceObject_ClutterMisc4()
	myClutterMisc4Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterMisc4, PositionRef_ClutterMisc4, is_temp = is_temporary, is_interaction_disabled = true)
endFunction
function PlaceObject_ClutterMisc5()
	myClutterMisc5Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterMisc5, PositionRef_ClutterMisc5, is_temp = is_temporary, is_interaction_disabled = true)
endFunction
function PlaceObject_ClutterMisc6()
	myClutterMisc6Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterMisc6, PositionRef_ClutterMisc6, is_temp = is_temporary, is_interaction_disabled = true)
endFunction
function PlaceObject_ClutterMisc7()
	myClutterMisc7Future = PlacementSystem.PlaceObject(self, TentAsset_ClutterMisc7, PositionRef_ClutterMisc7, is_temp = is_temporary, is_interaction_disabled = true)
endFunction