scriptname CampFuelMiscItem extends ObjectReference

import CampUtil

Activator property FuelLit auto
Activator property FuelUnlit auto
Light property FuelLight auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    CampCampfire campfire = GetLastUsedCampfire() as CampCampfire
    campfire.SetFuel(FuelLit, FuelUnlit, FuelLight)
    self.Delete()
EndEvent