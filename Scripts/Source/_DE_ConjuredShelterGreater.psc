scriptname _DE_ConjuredShelterGreater extends _DE_ConjuredShelter

import debug
import utility

;Reference Objects
ObjectReference property _DE_Shelter_G_Chest auto
ObjectReference property _DE_Shelter_G_Bed auto
ObjectReference property _DE_Shelter_G_TanningRack auto
ObjectReference property _DE_Shelter_G_Plate auto
ObjectReference property _DE_Shelter_G_Glass auto
ObjectReference property _DE_Shelter_G_Light auto
ObjectReference property _DE_Shelter_G_LightSource auto
ObjectReference property _DE_Shelter_G_Table auto
ObjectReference property _DE_Shelter_G_PotHolder2 auto
ObjectReference property _DE_Shelter_G_CookingPot2 auto
ObjectReference property _DE_Shelter_G_Fireplace2 auto
ObjectReference property _DE_Shelter_G_Base1 auto
ObjectReference property _DE_Shelter_G_Base2 auto
ObjectReference property _DE_Shelter_G_Chair auto
ObjectReference property _DE_Shelter_G_Firewood auto
ObjectReference property _DE_Shelter_G_Books auto
ObjectReference property _DE_Shelter_G_Deadwood auto
ObjectReference property _DE_Shelter_G_Embers auto
ObjectReference property _DE_Shelter_G_FireLightSource auto
ObjectReference property _DE_Shelter_G_Enchanting auto
ObjectReference property _DE_Shelter_G_EnchantingTable auto
ObjectReference property _DE_Shelter_G_Alchemy auto
ObjectReference property _DE_Shelter_G_AlchemyTable auto

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
	myBase1 = PlaceAtMeRelative(self, NorEnchantedDias01, myOriginAng, myBase1_Pos, abInitiallyDisabled = true)
	myBase2 = PlaceAtMeRelative(self, DweAstrolabeExteriorDome01, myOriginAng, myBase2_Pos, abInitiallyDisabled = true)
	;Set the scale of the base pieces
	myBase1.SetScale(_DE_Shelter_G_Base1.GetScale())
	myBase2.SetScale(_DE_Shelter_G_Base2.GetScale())
	;Display the base pieces
	myBase1.Enable()
	myBase2.Enable()
	;Warp them in
	PlayWarpInEffect(myBase1)
	PlayWarpInEffect(myBase2)

	wait(0.1)

	;Display everything else
	b3DCheck = Is3DLoadedFinite(myBase1)
	_DE_ShelterWarpInSoundStart.Play(myBase1)
	myTanningRack = PlaceAtMeRelative(self, CraftingTanningRackMarker, myOriginAng, myTanningRack_Pos)
	PlayWarpInEffect(myTanningRack)

	int iWarpInSoundID = _DE_ShelterWarpInSound.Play(myBase1)

	myTable = PlaceAtMeRelative(self, UpperTableRound01, myOriginAng, myTable_Pos)
	PlayWarpInEffect(myTable)

	myChair = PlaceAtMeRelative(self, NobleChair02FrontIgnoreSandbox, myOriginAng, myChair_Pos)
	PlayWarpInEffect(myChair)

	myLight = PlaceAtMeRelative(self, SilverCandleStick02, myOriginAng, myLight_Pos)
	myLightSource = PlaceAtMeRelative(self, _DE_LanternLight, myOriginAng, myLightSource_Pos)
	myPlate = PlaceAtMeRelative(self, SilverPlate01, myOriginAng, myPlate_Pos)
	b3DCheck = Is3DLoadedFinite(myPlate)
	myPlate.SetMotionType(myPlate.Motion_Keyframed)
	myPlate.BlockActivation()

	myCup = PlaceAtMeRelative(self, SilverGoblet02, myOriginAng, myCup_Pos)
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

	wait(0.2)

	myEnchantingTable = PlaceAtMeRelative(self, NobleTableSquare01, myOriginAng, myEnchantingTable_Pos)
	PlayWarpInEffect(myEnchantingTable)
	myAlchemyTable = PlaceAtMeRelative(self, NobleTableSquare01, myOriginAng, myAlchemyTable_Pos)
	PlayWarpInEffect(myAlchemyTable)

	wait(0.1)

	myEnchanting = PlaceAtMeRelative(self, CraftingEnchantingWorkbenchTabletop, myOriginAng, myEnchanting_Pos)
	PlayWarpInEffect(myEnchanting)
	myAlchemy = PlaceAtMeRelative(self, CraftingAlchemyWorkbenchTabletop, myOriginAng, myAlchemy_Pos)
	PlayWarpInEffect(myAlchemy)	

	_DE_Shelter_Trigger.MoveTo(mySphere)

	RegisterForSingleUpdate(2)
	RegisterForSingleUpdateGameTime(12.0)

	wait(1)
	Sound.StopInstance(iWarpInSoundID)

	;Place anything that will be initially disabled, and wait for their 3D so the
	;fire pit can recognize them when it initializes
	mySteam = PlaceAtMeRelative(self, _DE_CookingPot_Steam_Shelter, myOriginAng, myCookingPot_Pos, abInitiallyDisabled = true)
	myFirewoodLit = PlaceAtMeRelative(self, _DE_Campfire_Simple_Firewood_Lit_Shelter, myOriginAng, myFirewood_Pos, abInitiallyDisabled = true)
	myFirewoodLit.SetScale(_DE_Shelter_G_Firewood.GetScale())
	myFirewoodUnlit = myFirewoodLit.PlaceAtMe(_DE_Campfire_Simple_Firewood_Unlit_Shelter, abInitiallyDisabled = true)
	myFirewoodUnlit.SetScale(_DE_Shelter_G_Firewood.GetScale())
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
	mySphere_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Sphere)
	myLight_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Light)
	myLightSource_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_LightSource)
	myPlate_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Plate)
	myCup_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Glass)
	myTable_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Table)
	myChest_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Chest)
	myTanningRack_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_TanningRack)
	myFireplace_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Fireplace2)
	myPotHolder_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_PotHolder2)
	myCookingPot_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_CookingPot2)
	myBase1_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Base1)
	myBase2_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Base2)
	myChair_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Chair)
	myFirewood_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Firewood)
	myDeadwood_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Deadwood)
	myBooks_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Books)
	myEmbers_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Embers)
	myFireLightSource_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_FireLightSource)

	myEnchanting_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Enchanting)
	myEnchantingTable_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_EnchantingTable)
	myAlchemy_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_Alchemy)
	myAlchemyTable_Pos = GetRelativePosition(_DE_Shelter_G_Bed, _DE_Shelter_G_AlchemyTable)
endFunction

function SphereSummonEffect()
	mySphere = PlaceAtMeRelative(self, _DE_MageSphere1, myOriginAng, mySphere_Pos, abInitiallyDisabled = true)
	float mySphereScale = _DE_Shelter_G_Sphere.GetScale()		
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

