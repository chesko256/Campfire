scriptname _DE_FoodDetect extends ReferenceAlias

GlobalVariable property _DE_ExposurePoints auto

formlist property _DE_Drinks10 auto
formlist property _DE_Drinks15 auto
formlist property _DE_Drinks20 auto
formlist property _DE_Foods5 auto
formlist property _DE_Foods10 auto
formlist property _DE_Foods15 auto

Keyword property _DE_FoodBuffKeyword10 auto
Keyword property _DE_FoodBuffKeyword15 auto
Keyword property _DE_FoodBuffKeyword20 auto
Keyword property _DE_FoodBuffKeyword25 auto

Keyword property _DE_SpellBuffKW auto
Keyword property _DE_SootheKW auto

MagicEffect property _DE_SootheEffect1 auto
MagicEffect property _DE_SootheEffect2 auto
MagicEffect property _DE_SootheEffect3 auto

Keyword property _DE_DrinkKW1 auto
Keyword property _DE_DrinkKW2 auto
Keyword property _DE_DrinkKW3 auto
Potion property _DE_DrinkDummy1 auto
Potion property _DE_DrinkDummy2 auto
Potion property _DE_DrinkDummy3 auto
Potion property _DE_FoodDummy10 auto
Potion property _DE_FoodDummy15 auto
Potion property _DE_FoodDummy20 auto
Potion property _DE_FoodDummy25 auto
Potion property _DE_SootheDummy1 auto
Potion property _DE_SootheDummy2 auto
Potion property _DE_SootheDummy3 auto

_DE_ExposureMeterUpdate property ExposureMeter auto

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	
	if akBaseObject as Potion
	
		;Soups and Stews
		;Catch multiple eating here
	
		;5% Exposure Resist
		if _DE_Foods5.HasForm(akBaseObject)
			if !(Game.GetPlayer().HasEffectKeyword(_DE_FoodBuffKeyword10) || Game.GetPlayer().HasEffectKeyword(_DE_FoodBuffKeyword15) || Game.GetPlayer().HasEffectKeyword(_DE_FoodBuffKeyword20) || Game.GetPlayer().HasEffectKeyword(_DE_FoodBuffKeyword25))
				Game.GetPlayer().EquipItem(_DE_FoodDummy10, false, true)
			EndIf
		;10% Exposure Resist
		elseif _DE_Foods10.HasForm(akBaseObject)
			if !(Game.GetPlayer().HasEffectKeyword(_DE_FoodBuffKeyword10) || Game.GetPlayer().HasEffectKeyword(_DE_FoodBuffKeyword15) || Game.GetPlayer().HasEffectKeyword(_DE_FoodBuffKeyword20) || Game.GetPlayer().HasEffectKeyword(_DE_FoodBuffKeyword25))
				Game.GetPlayer().EquipItem(_DE_FoodDummy15, false, true)
			EndIf
		;15% Exposure Resist
		elseif _DE_Foods15.HasForm(akBaseObject)
			if !(Game.GetPlayer().HasEffectKeyword(_DE_FoodBuffKeyword10) || Game.GetPlayer().HasEffectKeyword(_DE_FoodBuffKeyword15) || Game.GetPlayer().HasEffectKeyword(_DE_FoodBuffKeyword20) || Game.GetPlayer().HasEffectKeyword(_DE_FoodBuffKeyword25))
				Game.GetPlayer().EquipItem(_DE_FoodDummy25, false, true)
			EndIf
		
		;Alcohols
	
		;Restore 10 EP
		elseif _DE_Drinks10.HasForm(akBaseObject)
			if !(Game.GetPlayer().HasEffectKeyword(_DE_DrinkKW1) || Game.GetPlayer().HasEffectKeyword(_DE_DrinkKW2) || Game.GetPlayer().HasEffectKeyword(_DE_DrinkKW3))
				_DE_ExposurePoints.SetValue(_DE_ExposurePoints.GetValue() + 10.0)
				ExposureMeter.ForceDisplayAndUpdate()
				Game.GetPlayer().EquipItem(_DE_DrinkDummy1, false, true)
			endif
		
		;Restore 15 EP
		elseif _DE_Drinks15.HasForm(akBaseObject)
			if !(Game.GetPlayer().HasEffectKeyword(_DE_DrinkKW1) || Game.GetPlayer().HasEffectKeyword(_DE_DrinkKW2) || Game.GetPlayer().HasEffectKeyword(_DE_DrinkKW3))
				_DE_ExposurePoints.SetValue(_DE_ExposurePoints.GetValue() + 15.0)
				ExposureMeter.ForceDisplayAndUpdate()
				Game.GetPlayer().EquipItem(_DE_DrinkDummy2, false, true)
			endif
		
		;Restore 20 EP
		elseif _DE_Drinks20.HasForm(akBaseObject)
			if !(Game.GetPlayer().HasEffectKeyword(_DE_DrinkKW1) || Game.GetPlayer().HasEffectKeyword(_DE_DrinkKW2) || Game.GetPlayer().HasEffectKeyword(_DE_DrinkKW3))
				_DE_ExposurePoints.SetValue(_DE_ExposurePoints.GetValue() + 20.0)
				ExposureMeter.ForceDisplayAndUpdate()
				Game.GetPlayer().EquipItem(_DE_DrinkDummy3, false, true)
			endif
		endif
	endif
EndEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	if akEffect.HasKeyword(_DE_SpellBuffKW)
		if Game.GetPlayer().HasEffectKeyword(_DE_SootheKW)
			;Do nothing.
		else
			if akEffect == _DE_SootheEffect1
				Game.GetPlayer().EquipItem(_DE_SootheDummy1, false, true)
				_DE_ExposurePoints.SetValue(_DE_ExposurePoints.GetValue() + 10.0)
				ExposureMeter.ForceDisplayAndUpdate()
			elseif akEffect == _DE_SootheEffect2
				Game.GetPlayer().EquipItem(_DE_SootheDummy2, false, true)
				_DE_ExposurePoints.SetValue(_DE_ExposurePoints.GetValue() + 20.0)
				ExposureMeter.ForceDisplayAndUpdate()
			elseif akEffect == _DE_SootheEffect3
				Game.GetPlayer().EquipItem(_DE_SootheDummy3, false, true)
				_DE_ExposurePoints.SetValue(_DE_ExposurePoints.GetValue() + 30.0)
				ExposureMeter.ForceDisplayAndUpdate()
			EndIf
		EndIf
	EndIf
endEvent