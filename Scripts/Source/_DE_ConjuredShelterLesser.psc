scriptname _DE_ConjuredShelterLesser extends _DE_ConjuredShelter

import debug
import utility

;Reference Objects
ObjectReference property _DE_Shelter_L_Chest auto
ObjectReference property _DE_Shelter_L_Bed auto
ObjectReference property _DE_Shelter_L_TanningRack auto
ObjectReference property _DE_Shelter_L_Plate auto
ObjectReference property _DE_Shelter_L_Glass auto
ObjectReference property _DE_Shelter_L_Light auto
ObjectReference property _DE_Shelter_L_LightSource auto
ObjectReference property _DE_Shelter_L_Table auto
ObjectReference property _DE_Shelter_L_PotHolder auto
ObjectReference property _DE_Shelter_L_CookingPot auto
ObjectReference property _DE_Shelter_L_Fireplace auto
ObjectReference property _DE_Shelter_L_Base1 auto
ObjectReference property _DE_Shelter_L_Base2 auto
ObjectReference property _DE_Shelter_L_Base3 auto
ObjectReference property _DE_Shelter_L_Base4 auto
ObjectReference property _DE_Shelter_L_Base5 auto
ObjectReference property _DE_Shelter_L_Base6 auto
ObjectReference property _DE_Shelter_L_Base7 auto
ObjectReference property _DE_Shelter_L_Chair auto
ObjectReference property _DE_Shelter_L_Firewood auto
ObjectReference property _DE_Shelter_L_Books auto
ObjectReference property _DE_Shelter_L_Deadwood auto
ObjectReference property _DE_Shelter_L_Embers auto
ObjectReference property _DE_Shelter_L_FireLightSource auto

Event OnInit()

	bool b3DCheck
	;Generate a unique shelter ID. This is used to enforce only one conjured shelter at a time.
	ShelterID = RandomFloat()
	_DE_CurrentShelterID.SetValue(ShelterID)

	b3DCheck = Is3DLoadedFinite(self)

	self.Disable()
	self.BlockActivation()
	self.SetAngle(0.0, 0.0, self.GetAngleZ())
	
	CreatePositionArrays()
	myOriginAng = GetAngleData(self)
	GetRelativePositions()
	
	if !(IsPlayerInInterior())
		SphereSummonEffect()
	endif
	
	;Place the base pieces, but hold off on displaying them until we set the scale
	myBase1 = PlaceAtMeRelative(self, MineScaffoldTop0Sided01, myOriginAng, myBase1_Pos, abInitiallyDisabled = true)
	myBase2 = PlaceAtMeRelative(self, MineScaffoldTop0Sided01, myOriginAng, myBase2_Pos, abInitiallyDisabled = true)
	myBase3 = PlaceAtMeRelative(self, MineScaffoldBase4Sided01, myOriginAng, myBase3_Pos, abInitiallyDisabled = true)
	myBase4 = PlaceAtMeRelative(self, MineScaffoldBase4Sided01, myOriginAng, myBase4_Pos, abInitiallyDisabled = true)
	myBase5 = PlaceAtMeRelative(self, ImpPillarBrokenTop01, myOriginAng, myBase5_Pos, fZLocalAngAdjust = -135.0, abInitiallyDisabled = true)
	myBase6 = PlaceAtMeRelative(self, MineScaffoldTop0Sided01, myOriginAng, myBase6_Pos, abInitiallyDisabled = true)
	myBase7 = PlaceAtMeRelative(self, MineScaffoldBase4Sided01, myOriginAng, myBase7_Pos, abInitiallyDisabled = true)
	;Set the scale of the base pieces
	myBase1.SetScale(_DE_Shelter_L_Base1.GetScale())
	myBase2.SetScale(_DE_Shelter_L_Base2.GetScale())
	myBase3.SetScale(_DE_Shelter_L_Base3.GetScale())
	myBase4.SetScale(_DE_Shelter_L_Base4.GetScale())
	myBase5.SetScale(_DE_Shelter_L_Base5.GetScale())
	myBase6.SetScale(_DE_Shelter_L_Base6.GetScale())
	myBase7.SetScale(_DE_Shelter_L_Base7.GetScale())
	;Display the base pieces
	myBase1.Enable()
	myBase2.Enable()
	myBase3.Enable()
	myBase4.Enable()
	myBase5.Enable()
	myBase6.Enable()
	myBase7.Enable()

	wait(0.1)

	;Display everything else
	b3DCheck = Is3DLoadedFinite(myBase1)
	_DE_ShelterWarpInSoundStart.Play(myBase1)
	myTanningRack = PlaceAtMeRelative(self, CraftingTanningRackMarker, myOriginAng, myTanningRack_Pos)
	PlayWarpInEffect(myTanningRack)

	int iWarpInSoundID = _DE_ShelterWarpInSound.Play(myBase1)

	myTable = PlaceAtMeRelative(self, CommonTableRound01, myOriginAng, myTable_Pos)
	PlayWarpInEffect(myTable)

	myChair = PlaceAtMeRelative(self, _DE_ShelterChairCommon, myOriginAng, myChair_Pos)
	PlayWarpInEffect(myChair)

	myLight = PlaceAtMeRelative(self, _DE_Tent_LanternOnGround, myOriginAng, myLight_Pos)
	myLightSource = PlaceAtMeRelative(self, _DE_LanternLight, myOriginAng, myLightSource_Pos)
	myPlate = PlaceAtMeRelative(self, BasicPlate01, myOriginAng, myPlate_Pos)
	b3DCheck = Is3DLoadedFinite(myPlate)
	myPlate.SetMotionType(myPlate.Motion_Keyframed)
	myPlate.BlockActivation()

	myCup = PlaceAtMeRelative(self, BasicTankard01, myOriginAng, myCup_Pos)
	b3DCheck = Is3DLoadedFinite(myCup)
	myCup.SetMotionType(myCup.Motion_Keyframed)
	myCup.BlockActivation()

	;Move the chest to the proper position and throw away the placement marker
	ObjectReference myChestMarker = PlaceAtMeRelative(self, XMarker, myOriginAng, myChest_Pos)
	_DE_ConjurationMasterChest.MoveTo(myChestMarker)
	PlayWarpInEffect(_DE_ConjurationMasterChest)
	myChestMarker.Disable()
	myChestMarker.Delete()

	self.Enable()
	PlayWarpInEffect(self)

	_DE_Shelter_Trigger.MoveTo(mySphere)

	RegisterForSingleUpdate(2)
	RegisterForSingleUpdateGameTime(12.0)

	wait(1)
	Sound.StopInstance(iWarpInSoundID)

	;Place anything that will be initially disabled, and wait for their 3D so the
	;fire pit can recognize them when it initializes
	mySteam = PlaceAtMeRelative(self, _DE_CookingPot_Steam_Shelter, myOriginAng, myCookingPot_Pos, abInitiallyDisabled = true)
	myFirewoodLit = PlaceAtMeRelative(self, _DE_Campfire_Simple_Firewood_Lit_Shelter, myOriginAng, myFirewood_Pos, abInitiallyDisabled = true)
	myFirewoodLit.SetScale(_DE_Shelter_L_Firewood.GetScale())
	myFirewoodUnlit = myFirewoodLit.PlaceAtMe(_DE_Campfire_Simple_Firewood_Unlit_Shelter, abInitiallyDisabled = true)
	myFirewoodUnlit.SetScale(_DE_Shelter_L_Firewood.GetScale())
	myDeadwoodLit = PlaceAtMeRelative(self, _DE_Campfire_Simple_Deadwood_Lit, myOriginAng, myDeadwood_Pos, abInitiallyDisabled = true)
	myDeadwoodUnlit = PlaceAtMeRelative(self, _DE_Campfire_Simple_Deadwood_Unlit, myOriginAng, myDeadwood_Pos, abInitiallyDisabled = true)
	myBooksLit = PlaceAtMeRelative(self, _DE_Campfire_Simple_Books_Lit, myOriginAng, myBooks_Pos, abInitiallyDisabled = true)
	myBooksUnlit = PlaceAtMeRelative(self, _DE_Campfire_Simple_Books_Unlit, myOriginAng, myBooks_Pos, abInitiallyDisabled = true)
	mySteam	 = PlaceAtMeRelative(self, _DE_Campfire_Simple_Steam, myOriginAng, myFirewood_Pos, abInitiallyDisabled = true)
	myEmbers = PlaceAtMeRelative(self, _DE_Campfire_Simple_Embers, myOriginAng, myEmbers_Pos, abInitiallyDisabled = true)
	myAshes = PlaceAtMeRelative(self, _DE_Campfire_Simple_Ashes, myOriginAng, myEmbers_Pos, abInitiallyDisabled = true)
	myFireLightSource = PlaceAtMeRelative(self, _DE_Campfire_Light_3, myOriginAng, myFireLightSource_Pos, abInitiallyDisabled = true)

	myFireplace = PlaceAtMeRelative(self, _DE_Shelter_FirepitACT, myOriginAng, myFireplace_Pos)
	PlayWarpInEffect(myFireplace)
	myPotHolder = PlaceAtMeRelative(self, CookingSpitFarmhouse01, myOriginAng, myPotHolder_Pos)
	myCookingPot = PlaceAtMeRelative(self, _DE_CookingPotFurniture_Shelter, myOriginAng, myCookingPot_Pos)
	myCookingPotSteam = PlaceAtMeRelative(self, _DE_CookingPot_Steam_Shelter, myOriginAng, myCookingPot_Pos)

	PlayWarpInEffect(myCookingPot)

endEvent

function GetRelativePositions()
	mySphere_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Sphere)
	myLight_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Light)
	myLightSource_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_LightSource)
	myPlate_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Plate)
	myCup_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Glass)
	myTable_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Table)
	myChest_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Chest)
	myTanningRack_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_TanningRack)
	myFireplace_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Fireplace)
	myPotHolder_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_PotHolder)
	myCookingPot_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_CookingPot)
	myBase1_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Base1)
	myBase2_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Base2)
	myBase3_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Base3)
	myBase4_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Base4)
	myBase5_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Base5)
	myBase6_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Base6)
	myBase7_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Base7)
	myChair_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Chair)
	myFirewood_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Firewood)
	myDeadwood_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Deadwood)
	myBooks_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Books)
	myEmbers_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_Embers)
	myFireLightSource_Pos = GetRelativePosition(_DE_Shelter_L_Bed, _DE_Shelter_L_FireLightSource)
endFunction

function SphereSummonEffect()
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

