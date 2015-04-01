scriptname _Camp_BackpackReclaim extends ObjectReference

Actor property PlayerRef auto
Armor property thisBackpack auto
int property outputBackpack auto
{0 = Black, 1 = Brown, 2 = White}
int property outputAmulet auto
{0=Akatosh, 1=Arkay, 2=Dibella, 3=Dragon Bone, 4=Julianos, 5=Kynareth, 6=Mara, 7=Stendarr, 8=Talos, 9=Zenithar}

Armor property _Camp_Backpack_Black auto
Armor property _Camp_Backpack_Brown auto
Armor property _Camp_Backpack_White auto

MiscObject property DragonBone auto
Armor property ReligiousAkatoshTime auto
Armor property ReligiousArkayLifeDeath auto
Armor property ReligiousDibellaBeauty auto
Armor property ReligiousJulianosMagic auto
Armor property ReligiousKynarethAir auto
Armor property ReligiousMaraLove auto
Armor property ReligiousStendarrMercy auto
Armor property ReligiousTalosMankind auto
Armor property ReligiousZenitharCommerce auto


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		PlayerRef.RemoveItem(thisBackpack, 1, true)

		if outputBackpack == 0
			PlayerRef.AddItem(_Camp_Backpack_Black, 1)
		elseif outputBackpack == 1
			PlayerRef.AddItem(_Camp_Backpack_Brown, 1)
		elseif outputBackpack == 2
			PlayerRef.AddItem(_Camp_Backpack_White, 1)
		endif
		
		if outputAmulet == 0
			PlayerRef.AddItem(ReligiousAkatoshTime, 1)
		elseif outputAmulet == 1
			PlayerRef.AddItem(ReligiousArkayLifeDeath, 1)
		elseif outputAmulet == 2
			PlayerRef.AddItem(ReligiousDibellaBeauty, 1)
		elseif outputAmulet == 3
			PlayerRef.AddItem(DragonBone, 1)
		elseif outputAmulet == 4
			PlayerRef.AddItem(ReligiousJulianosMagic, 1)
		elseif outputAmulet == 5
			PlayerRef.AddItem(ReligiousKynarethAir, 1)
		elseif outputAmulet == 6
			PlayerRef.AddItem(ReligiousMaraLove, 1)
		elseif outputAmulet == 7
			PlayerRef.AddItem(ReligiousStendarrMercy, 1)
		elseif outputAmulet == 8
			PlayerRef.AddItem(ReligiousTalosMankind, 1)
		elseif outputAmulet == 9
			PlayerRef.AddItem(ReligiousZenitharCommerce, 1)
		endif
	endif
endEvent