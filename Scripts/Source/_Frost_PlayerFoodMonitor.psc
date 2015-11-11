scriptname _Frost_PlayerFoodMonitor extends ReferenceAlias

Actor property PlayerRef auto

FormList property _Frost_SoupsList auto
formlist property _Frost_Drinks10 auto
formlist property _Frost_Drinks15 auto
formlist property _Frost_Drinks20 auto

Keyword property _Frost_FoodBuffKeyword auto
Keyword property _Frost_DrinkKeyword auto
Keyword property FrostfallWarmFoodDrinkKeyword auto

Potion property _Frost_DrinkEffectPotion1 auto
Potion property _Frost_DrinkEffectPotion2 auto
Potion property _Frost_DrinkEffectPotion3 auto
Potion property _Frost_FoodEffectPotion auto

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Potion
		; Soups and Stews
		if _Frost_SoupsList.HasForm(akBaseObject) || akBaseObject.HasKeyword(FrostfallWarmFoodDrinkKeyword)
			if !(PlayerRef.HasEffectKeyword(_Frost_FoodBuffKeyword))
				PlayerRef.EquipItem(_Frost_FoodEffectPotion, false, true)
			EndIf
			
		;Alcohols
		elseif _Frost_Drinks10.HasForm(akBaseObject) && !(PlayerRef.HasEffectKeyword(_Frost_DrinkKeyword))
			PlayerRef.EquipItem(_Frost_DrinkEffectPotion1, false, true)
		elseif _Frost_Drinks15.HasForm(akBaseObject) && !(PlayerRef.HasEffectKeyword(_Frost_DrinkKeyword))
			PlayerRef.EquipItem(_Frost_DrinkEffectPotion2, false, true)
		elseif _Frost_Drinks20.HasForm(akBaseObject) && !(PlayerRef.HasEffectKeyword(_Frost_DrinkKeyword))
			PlayerRef.EquipItem(_Frost_DrinkEffectPotion3, false, true)
		endif
	endif
EndEvent
