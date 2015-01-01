Scriptname _DE_ClothingMonitor_1_7 extends ReferenceAlias

import utility
import math

Actor property PlayerRef auto

GlobalVariable property _DE_Setting_WEARMsg auto
GlobalVariable property _DE_EPDebug auto
GlobalVariable property _DE_ExposurePoints auto

bool property pSetting_Armor auto hidden
_DE_Compatibility property Compatibility auto
_DE_EPStatusWidget property Status auto

;#Region ARMOR PROPERTIES

;Cloaks
Armor property _DE_Cloak_BasicFur auto
Armor property _DE_Cloak_BasicHide auto
Armor property _DE_Cloak_BasicLinen auto
Armor property _DE_Cloak_BasicBurlap auto

;Misc
Armor property ClothesMGRobesArchmage1Hooded auto

;Armor Full
Armor property ArmorCompanionsCuirass auto
Armor property ArmorBanditCuirass auto
Armor property ArmorOrcishCuirass auto
Armor property EnchArmorOrcishCuirassHeavyArmor03 auto
Armor property EnchArmorOrcishCuirassHeavyArmor04 auto
Armor property EnchArmorOrcishCuirassHeavyArmor05 auto
Armor property EnchArmorOrcishCuirassAlteration03 auto
Armor property EnchArmorOrcishCuirassConjuration03 auto
Armor property EnchArmorOrcishCuirassDestruction03 auto
Armor property EnchArmorOrcishCuirassHealth03 auto
Armor property EnchArmorOrcishCuirassIllusion03 auto
Armor property EnchArmorOrcishCuirassRestoration03 auto
Armor property EnchArmorOrcishCuirassAlteration04 auto
Armor property EnchArmorOrcishCuirassConjuration04 auto
Armor property EnchArmorOrcishCuirassDestruction04 auto
Armor property EnchArmorOrcishCuirassHealth04 auto
Armor property EnchArmorOrcishCuirassIllusion04 auto
Armor property EnchArmorOrcishCuirassRestoration04 auto
Armor property EnchArmorOrcishCuirassAlteration05 auto
Armor property EnchArmorOrcishCuirassConjuration05 auto
Armor property EnchArmorOrcishCuirassDestruction05 auto
Armor property EnchArmorOrcishCuirassHealth05 auto
Armor property EnchArmorOrcishCuirassIllusion05 auto
Armor property EnchArmorOrcishCuirassRestoration05 auto

;Armor Limited
Armor property ArmorFalmerCuirass auto
Armor property ForswornCuirass auto
Armor property ClothesPrisonerRags auto
Armor property ClothesPrisonerTunic auto
Armor property ArmorHideCuirass auto
Armor property EnchArmorHideCuirassAlteration01 auto
Armor property EnchArmorHideCuirassConjuration01 auto
Armor property EnchArmorHideCuirassDestruction01 auto
Armor property EnchArmorHideCuirassHealth01 auto
Armor property EnchArmorHideCuirassIllusion01 auto
Armor property EnchArmorHideCuirassRestoration01 auto
Armor property EnchArmorHideCuirassAlteration02 auto
Armor property EnchArmorHideCuirassConjuration02 auto
Armor property EnchArmorHideCuirassDestruction02 auto
Armor property EnchArmorHideCuirassHealth02 auto
Armor property EnchArmorHideCuirassIllusion02 auto
Armor property EnchArmorHideCuirassRestoration02 auto
Armor property EnchArmorHideCuirassAlteration03 auto
Armor property EnchArmorHideCuirassConjuration03 auto
Armor property EnchArmorHideCuirassDestruction03 auto
Armor property EnchArmorHideCuirassHealth03 auto
Armor property EnchArmorHideCuirassIllusion03 auto
Armor property EnchArmorHideCuirassRestoration03 auto
Armor property EnchArmorHideCuirassLightArmor01 auto
Armor property EnchArmorHideCuirassLightArmor02 auto
Armor property EnchArmorHideCuirassLightArmor03 auto
Armor property ArmorBanditCuirass2 auto
Armor property ArmorBanditCuirass1 auto
Armor property ArmorIronCuirass auto
Armor property EnchArmorIronArmorAlteration03 auto
Armor property EnchArmorIronCuirassAlteration01 auto
Armor property EnchArmorIronCuirassDestruction01 auto
Armor property EnchArmorIronCuirassHealth01 auto
Armor property EnchArmorIronCuirassIllusion01 auto
Armor property EnchArmorIronCuirassRestoration01 auto
Armor property EnchArmorIronCuirassAlteration02 auto
Armor property EnchArmorIronCuirassConjuration01 auto
Armor property EnchArmorIronCuirassConjuration02 auto
Armor property EnchArmorIronCuirassDestruction02 auto
Armor property EnchArmorIronCuirassHealth02 auto
Armor property EnchArmorIronCuirassIllusion02 auto
Armor property EnchArmorIronCuirassRestoration02 auto
Armor property EnchArmorIronCuirassAlteration03 auto
Armor property EnchArmorIronCuirassConjuration03 auto
Armor property EnchArmorIronCuirassDestruction03 auto
Armor property EnchArmorIronCuirassHealth03 auto
Armor property EnchArmorIronCuirassIllusion03 auto
Armor property EnchArmorIronCuirassRestoration03 auto
Armor property EnchArmorIronCuirassHeavyArmor01 auto
Armor property EnchArmorIronCuirassHeavyArmor02 auto
Armor property EnchArmorIronCuirassHeavyArmor03 auto
Armor property ArmorStuddedCuirass auto
Armor property EnchArmorStuddedCuirassHealth01 auto
Armor property EnchArmorStuddedCuirassHealth02 auto
Armor property EnchArmorStuddedCuirassHealth03 auto
Armor property EnchArmorStuddedCuirassLightArmor01 auto
Armor property EnchArmorStuddedCuirassLightArmor02 auto
Armor property EnchArmorStuddedCuirassLightArmor03 auto
Armor property ArmorIronBandedCuirass auto
Armor property EnchArmorIronBandedCuirassAlteration01 auto
Armor property EnchArmorIronBandedCuirassConjuration01 auto
Armor property EnchArmorIronBandedCuirassDestruction01 auto
Armor property EnchArmorIronBandedCuirassHealth01 auto
Armor property EnchArmorIronBandedCuirassIllusion01 auto
Armor property EnchArmorIronBandedCuirassAlteration02 auto
Armor property EnchArmorIronBandedCuirassConjuration02 auto
Armor property EnchArmorIronBandedCuirassDestruction02 auto
Armor property EnchArmorIronBandedCuirassHealth02 auto
Armor property EnchArmorIronBandedCuirassIllusion02 auto
Armor property EnchArmorIronBandedCuirassAlteration03 auto
Armor property EnchArmorIronBandedCuirassConjuration03 auto
Armor property EnchArmorIronBandedCuirassDestruction03 auto
Armor property EnchArmorIronBandedCuirassHealth03 auto
Armor property EnchArmorIronBandedCuirassIllusion03 auto
Armor property EnchArmorIronBandedCuirassRestoration01 auto
Armor property EnchArmorIronBandedCuirassRestoration02 auto
Armor property EnchArmorIronBandedCuirassRestoration03 auto
Armor property EnchArmorIronBandedCuirassHeavyArmor01 auto
Armor property EnchArmorIronBandedCuirassHeavyArmor02 auto
Armor property EnchArmorIronBandedCuirassHeavyArmor03 auto

;Feet Full
Armor property _DE_ArmorStormcloakBoots auto
Armor property ArmorCompanionsBoots auto
Armor property ArmorStormcloakBoots auto
Armor property ArmorBanditBoots auto
Armor property ClothesJarlShoes auto
Armor property EnchArmorOrcishBootsStamina03 auto
Armor property EnchArmorOrcishBootsStamina04 auto
Armor property EnchArmorOrcishBootsStamina05 auto
Armor property ArmorOrcishBoots auto
Armor property EnchArmorOrcishBootsCarry03 auto
Armor property EnchArmorOrcishBootsCarry04 auto
Armor property EnchArmorOrcishBootsCarry05 auto
Armor property EnchArmorOrcishBootsResistFire03 auto
Armor property EnchArmorOrcishBootsResistFrost03 auto
Armor property EnchArmorOrcishBootsResistShock03 auto
Armor property EnchArmorOrcishBootsResistFire04 auto
Armor property EnchArmorOrcishBootsResistFrost04 auto
Armor property EnchArmorOrcishBootsResistShock04 auto
Armor property EnchArmorOrcishBootsResistFire05 auto
Armor property EnchArmorOrcishBootsResistFrost05 auto
Armor property EnchArmorOrcishBootsResistShock05 auto
Armor property EnchArmorOrcishBootsMuffle auto

;Feet Limited
Armor property ArmorFalmerBoots auto
Armor property ForswornBoots auto
Armor property ClothesPrisonerShoes auto
Armor property ArmorHideBoots auto
Armor property EnchArmorHideBootsResistFire01 auto
Armor property EnchArmorHideBootsResistFrost01 auto
Armor property EnchArmorHideBootsResistShock01 auto
Armor property EnchArmorHideBootsResistFire02 auto
Armor property EnchArmorHideBootsResistFrost02 auto
Armor property EnchArmorHideBootsResistShock02 auto
Armor property EnchArmorHideBootsResistFire03 auto
Armor property EnchArmorHideBootsResistFrost03 auto
Armor property EnchArmorHideBootsResistShock03 auto
Armor property EnchArmorHideBootsCarry01 auto
Armor property EnchArmorHideBootsCarry02 auto
Armor property EnchArmorHideBootsCarry03 auto
Armor property EnchArmorHideBootsSneak01 auto
Armor property EnchArmorHideBootsStamina01 auto
Armor property EnchArmorHideBootsSneak02 auto
Armor property EnchArmorHideBootsStamina02 auto
Armor property EnchArmorHideBootsSneak03 auto
Armor property EnchArmorHideBootsStamina03 auto
Armor property ArmorIronBoots auto
Armor property EnchArmorIronBootsCarry01 auto
Armor property EnchArmorIronBootsCarry02 auto
Armor property EnchArmorIronBootsCarry03 auto
Armor property EnchArmorIronBootsResistFire01 auto
Armor property EnchArmorIronBootsResistFrost01 auto
Armor property EnchArmorIronBootsResistShock01 auto
Armor property EnchArmorIronBootsResistFire02 auto
Armor property EnchArmorIronBootsResistFrost02 auto
Armor property EnchArmorIronBootsResistShock02 auto
Armor property EnchArmorIronBootsResistFire03 auto
Armor property EnchArmorIronBootsResistFrost03 auto
Armor property EnchArmorIronBootsResistShock03 auto
Armor property EnchArmorIronBootsStamina01 auto
Armor property EnchArmorIronBootsStamina02 auto
Armor property EnchArmorIronBootsStamina03 auto

;Hands Full
Armor property ArmorCompanionsGauntlets auto
Armor property ArmorBanditGauntlets auto
Armor property ArmorOrcishGauntlets auto
Armor property EnchArmorOrcishGauntletsAlchemy03 auto
Armor property EnchArmorOrcishGauntletsAlchemy04 auto
Armor property EnchArmorOrcishGauntletsAlchemy05 auto
Armor property EnchArmorOrcishGauntletsMarksman03 auto
Armor property EnchArmorOrcishGauntletsMarksman04 auto
Armor property EnchArmorOrcishGauntletsMarksman05 auto
Armor property EnchArmorOrcishGauntletsOneHanded03 auto
Armor property EnchArmorOrcishGauntletsOneHanded04 auto
Armor property EnchArmorOrcishGauntletsOneHanded05 auto
Armor property EnchArmorOrcishGauntletsSmithing03 auto
Armor property EnchArmorOrcishGauntletsSmithing04 auto
Armor property EnchArmorOrcishGauntletsSmithing05 auto
Armor property EnchArmorOrcishGauntletsTwoHanded03 auto
Armor property EnchArmorOrcishGauntletsTwoHanded04 auto
Armor property EnchArmorOrcishGauntletsTwoHanded05 auto
Armor property ArmorStormcloakGauntlets auto

;Hands Limited
Armor property ArmorFalmerGauntlets auto
Armor property ForswornGauntlets auto
Armor property PrisonerCuffsPlayer auto
Armor property ArmorHideGauntlets auto
Armor property EnchArmorHideGauntletsAlchemy01 auto
Armor property EnchArmorHideGauntletsAlchemy02 auto
Armor property EnchArmorHideGauntletsAlchemy03 auto
Armor property EnchArmorHideGauntletsPickpocket01 auto
Armor property EnchArmorHideGauntletsPickpocket02 auto
Armor property EnchArmorHideGauntletsPickpocket03 auto
Armor property EnchArmorHideGauntletsLockpicking01 auto
Armor property EnchArmorHideGauntletsLockpicking02 auto
Armor property EnchArmorHideGauntletsLockpicking03 auto
Armor property EnchArmorHideGauntletsOneHanded01 auto
Armor property EnchArmorHideGauntletsOneHanded02 auto
Armor property EnchArmorHideGauntletsOneHanded03 auto
Armor property EnchArmorHideGauntletsTwoHanded01 auto
Armor property EnchArmorHideGauntletsTwoHanded02 auto
Armor property EnchArmorHideGauntletsTwoHanded03 auto
Armor property EnchArmorHideGauntletsMarksman01 auto
Armor property EnchArmorHideGauntletsMarksman02 auto
Armor property EnchArmorHideGauntletsMarksman03 auto
Armor property EnchArmorHideGauntletsSmithing01 auto
Armor property EnchArmorHideGauntletsSmithing02 auto
Armor property EnchArmorHideGauntletsSmithing03 auto
Armor property ArmorIronGauntlets auto
Armor property EnchArmorIronGauntletsAlchemy01 auto
Armor property EnchArmorIronGauntletsAlchemy02 auto
Armor property EnchArmorIronGauntletsAlchemy03 auto
Armor property EnchArmorIronGauntletsOneHanded01 auto
Armor property EnchArmorIronGauntletsOneHanded02 auto
Armor property EnchArmorIronGauntletsOneHanded03 auto
Armor property EnchArmorIronGauntletsTwoHanded01 auto
Armor property EnchArmorIronGauntletsTwoHanded02 auto
Armor property EnchArmorIronGauntletsTwoHanded03 auto
Armor property EnchArmorIronGauntletsMarksman01 auto
Armor property EnchArmorIronGauntletsMarksman02 auto
Armor property EnchArmorIronGauntletsMarksman03 auto
Armor property EnchArmorIronGauntletsSmithing01 auto
Armor property EnchArmorIronGauntletsSmithing02 auto
Armor property EnchArmorIronGauntletsSmithing03 auto

;Head Full
Armor property ArmorCompanionsHelmet auto
Armor property ArmorBanditHelmet auto
Armor property ArmorOrcishHelmet auto
Armor property EnchArmorOrcishHelmetAlchemy03 auto
Armor property EnchArmorOrcishHelmetAlchemy04 auto
Armor property EnchArmorOrcishHelmetAlchemy05 auto
Armor property EnchArmorOrcishHelmetAlteration03 auto
Armor property EnchArmorOrcishHelmetAlteration04 auto
Armor property EnchArmorOrcishHelmetAlteration05 auto
Armor property EnchArmorOrcishHelmetMarksman03 auto
Armor property EnchArmorOrcishHelmetMarksman04 auto
Armor property EnchArmorOrcishHelmetMarksman05 auto
Armor property EnchArmorOrcishHelmetConjuration03 auto
Armor property EnchArmorOrcishHelmetConjuration04 auto
Armor property EnchArmorOrcishHelmetConjuration05 auto
Armor property EnchArmorOrcishHelmetIllusion03 auto
Armor property EnchArmorOrcishHelmetIllusion04 auto
Armor property EnchArmorOrcishHelmetIllusion05 auto
Armor property EnchArmorOrcishHelmetMagicka03 auto
Armor property EnchArmorOrcishHelmetMagicka04 auto
Armor property EnchArmorOrcishHelmetMagicka05 auto
Armor property EnchArmorOrcishHelmetRestoration03 auto
Armor property EnchArmorOrcishHelmetRestoration04 auto
Armor property EnchArmorOrcishHelmetRestoration05 auto
Armor property EnchArmorOrcishHelmetDestruction03 auto
Armor property EnchArmorOrcishHelmetDestruction04 auto
Armor property EnchArmorOrcishHelmetDestruction05 auto
Armor property EnchArmorOrcishHelmetWaterbreathing auto

;Head Limited
Armor property ArmorFalmerHelmet auto
Armor property ForswornHelmet auto
Armor property ArmorHideHelmet auto
Armor property EnchArmorHideHelmetAlchemy01 auto
Armor property EnchArmorHideHelmetAlchemy02 auto
Armor property EnchArmorHideHelmetAlchemy03 auto
Armor property EnchArmorHideHelmetAlteration01 auto
Armor property EnchArmorHideHelmetAlteration02 auto
Armor property EnchArmorHideHelmetAlteration03 auto
Armor property EnchArmorHideHelmetMarksman01 auto
Armor property EnchArmorHideHelmetMarksman02 auto
Armor property EnchArmorHideHelmetMarksman03 auto
Armor property EnchArmorHideHelmetConjuration01 auto
Armor property EnchArmorHideHelmetConjuration02 auto
Armor property EnchArmorHideHelmetConjuration03 auto
Armor property EnchArmorHideHelmetIllusion01 auto
Armor property EnchArmorHideHelmetIllusion02 auto
Armor property EnchArmorHideHelmetIllusion03 auto
Armor property EnchArmorHideHelmetMagicka01 auto
Armor property EnchArmorHideHelmetMagicka02 auto
Armor property EnchArmorHideHelmetMagicka03 auto
Armor property EnchArmorHideHelmetRestoration01 auto
Armor property EnchArmorHideHelmetRestoration02 auto
Armor property EnchArmorHideHelmetRestoration03 auto
Armor property EnchArmorHideHelmetDestruction01 auto
Armor property EnchArmorHideHelmetDestruction02 auto
Armor property EnchArmorHideHelmetDestruction03 auto
Armor property ArmorIronHelmet auto
Armor property EnchArmorIronHelmetAlchemy01 auto
Armor property EnchArmorIronHelmetAlchemy02 auto
Armor property EnchArmorIronHelmetAlchemy03 auto
Armor property EnchArmorIronHelmetAlteration01 auto
Armor property EnchArmorIronHelmetAlteration02 auto
Armor property EnchArmorIronHelmetAlteration03 auto
Armor property EnchArmorIronHelmetMarksman01 auto
Armor property EnchArmorIronHelmetMarksman02 auto
Armor property EnchArmorIronHelmetMarksman03 auto
Armor property EnchArmorIronHelmetConjuration01 auto
Armor property EnchArmorIronHelmetConjuration02 auto
Armor property EnchArmorIronHelmetConjuration03 auto
Armor property EnchArmorIronHelmetIllusion01 auto
Armor property EnchArmorIronHelmetIllusion02 auto
Armor property EnchArmorIronHelmetIllusion03 auto
Armor property EnchArmorIronHelmetMagicka01 auto
Armor property EnchArmorIronHelmetMagicka02 auto
Armor property EnchArmorIronHelmetMagicka03 auto
Armor property EnchArmorIronHelmetRestoration01 auto
Armor property EnchArmorIronHelmetRestoration02 auto
Armor property EnchArmorIronHelmetRestoration03 auto
Armor property EnchArmorIronHelmetDestruction01 auto
Armor property EnchArmorIronHelmetDestruction02 auto
Armor property EnchArmorIronHelmetDestruction03 auto
;#EndRegion

GlobalVariable property _DE_fBody auto
GlobalVariable property _DE_fHands auto
GlobalVariable property _DE_fFeet auto
GlobalVariable property _DE_fHead auto

bool property pInspectEffectOn = false auto

FormList property _DE_Armor_Body_Full auto
FormList property _DE_Armor_Hands_Full auto
FormList property _DE_Armor_Feet_Full auto
FormList property _DE_Armor_Head_Full auto
FormList property _DE_Armor_Body_Limited auto
FormList property _DE_Armor_Hands_Limited auto
FormList property _DE_Armor_Feet_Limited auto
FormList property _DE_Armor_Head_Limited auto
FormList property _DE_EquipExceptions auto
FormList property _DE_WinterIsComingHoods auto
FormList property _DE_NorthbornFurHoods auto
FormList property _DE_Backpacks auto

Keyword property ArmorCuirass auto
Keyword property ArmorGauntlets auto
Keyword property ArmorHelmet auto
Keyword property ArmorBoots auto
Keyword property ClothingBody auto
Keyword property ClothingHands auto
Keyword property ClothingHead auto
Keyword property ClothingFeet auto
Keyword property ArmorMaterialLeather auto
Keyword property ArmorMaterialHide auto
Keyword property VendorItemClothing auto
Keyword property ArmorClothing auto
Keyword property ClothingNecklace auto
Keyword property ArmorShield auto
Keyword property ArmorJewelry auto
Keyword property Vampire auto
Keyword property ActorTypeCreature auto
Keyword property ImmuneParalysis auto
Keyword property _DE_CloakKW auto

message property _DE_WEARSelectMenu1 auto
message property _DE_WEARSelectMenu2 auto
message property _DE_WEARSelectMenu3 auto

message property _DE_WearCloak auto
message property _DE_WearBodyFull auto
message property _DE_WearBodyLimited auto
message property _DE_WearBodyStandard auto
message property _DE_WearHandsFull auto
message property _DE_WearHandsLimited auto
message property _DE_WearHandsStandard auto
message property _DE_WearFeetFull auto
message property _DE_WearFeetLimited auto
message property _DE_WearFeetStandard auto
message property _DE_WearHeadFull auto
message property _DE_WearHeadLimited auto
message property _DE_WearHeadStandard auto
message property _DE_WearEquipError auto
message property _DE_Werewolf_Transform auto
message property _DE_Backpack_Menu2_Setup_OptionsHardcore_BEAREnabledConfirm auto
message property _DE_WEAR_Error_Cloaks auto
message property _DE_WEAR_Error_General auto

race property WerewolfBeastRace auto
bool property bIsBeast = false auto hidden

spell property _DE_CloakState_Spell auto
spell property _DE_CloakState_Spell_Burlap auto
spell property _DE_CloakState_Spell_Linen auto
spell property _DE_CloakState_Spell_Hide auto
spell property _DE_CloakState_Spell_Fur auto

Armor property _DE_CurrentHead auto hidden
Armor property _DE_CurrentBody auto hidden
Armor property _DE_CurrentHands auto hidden
Armor property _DE_CurrentFeet auto hidden
Armor property _DE_CurrentBackpack auto hidden
Armor property _DE_CurrentCloak auto hidden
Ammo property _DE_CurrentAmmo auto hidden

;Global variables
;ArrayID 1 - "body full"
Form[] _DE_ArmorBodyFull_1
Form[] _DE_ArmorBodyFull_2
Form[] _DE_ArmorBodyFull_3
Form[] _DE_ArmorBodyFull_4
;ArrayID 2 - "body limited"
Form[] _DE_ArmorBodyLimited_1
Form[] _DE_ArmorBodyLimited_2
Form[] _DE_ArmorBodyLimited_3
Form[] _DE_ArmorBodyLimited_4
;ArrayID 3 - "hands full"
Form[] _DE_ArmorHandsFull_1
Form[] _DE_ArmorHandsFull_2
Form[] _DE_ArmorHandsFull_3
Form[] _DE_ArmorHandsFull_4
;ArrayID 4 - "hands limited"
Form[] _DE_ArmorHandsLimited_1
Form[] _DE_ArmorHandsLimited_2
Form[] _DE_ArmorHandsLimited_3
Form[] _DE_ArmorHandsLimited_4
;ArrayID 5 - "feet full"
Form[] _DE_ArmorFeetFull_1
Form[] _DE_ArmorFeetFull_2
Form[] _DE_ArmorFeetFull_3
Form[] _DE_ArmorFeetFull_4
;ArrayID 6 - "feet limited"
Form[] _DE_ArmorFeetLimited_1
Form[] _DE_ArmorFeetLimited_2
Form[] _DE_ArmorFeetLimited_3
Form[] _DE_ArmorFeetLimited_4
;ArrayID 7 - "head full"
Form[] _DE_ArmorHeadFull_1
Form[] _DE_ArmorHeadFull_2
Form[] _DE_ArmorHeadFull_3
Form[] _DE_ArmorHeadFull_4
;ArrayID 8 - "head limited"
Form[] _DE_ArmorHeadLimited_1
Form[] _DE_ArmorHeadLimited_2
Form[] _DE_ArmorHeadLimited_3
Form[] _DE_ArmorHeadLimited_4
;ArrayID 9 - "cloak burlap"
Form[] _DE_CloakBurlap_1
Form[] _DE_CloakBurlap_2
Form[] _DE_CloakBurlap_3
Form[] _DE_CloakBurlap_4
;ArrayiD 10 - "cloak linen"
Form[] _DE_CloakLinen_1
Form[] _DE_CloakLinen_2
Form[] _DE_CloakLinen_3
Form[] _DE_CloakLinen_4
;ArrayiD 11 - "cloak hide"
Form[] _DE_CloakHide_1
Form[] _DE_CloakHide_2
Form[] _DE_CloakHide_3
Form[] _DE_CloakHide_4
;ArrayiD 12 - "cloak fur"
Form[] _DE_CloakFur_1
Form[] _DE_CloakFur_2
Form[] _DE_CloakFur_3
Form[] _DE_CloakFur_4

import debug

Event OnRaceSwitchComplete()
	
	if PlayerRef.GetRace().HasKeyword(ActorTypeCreature) || PlayerRef.GetRace().HasKeyword(ImmuneParalysis)
		FrostfallDebug(3, "I am now a werewolf or Vampire Lord.")
		if _DE_ExposurePoints.GetValue() <= 100.0								;Prevent EP being set too high
			_DE_ExposurePoints.SetValue(_DE_ExposurePoints.GetValue() + 20.0)
		elseif _DE_ExposurePoints.GetValue() > 100.0
			_DE_ExposurePoints.SetValue(120.0)
		endif
		bIsBeast = true
	else
		FrostfallDebug(3, "I am no longer a werewolf or Vampire Lord.")
		bIsBeast = false
	endif	
endEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if pInspectEffectOn == true														;Player recently cast this effect
		if akBaseObject as Armor && !akBaseObject.HasKeyword(ArmorShield) && !akBaseObject.HasKeyword(ArmorJewelry)	;What they equipped was Armor, and not a Shield or jewelry
			InspectEquipment(akBaseObject as Armor)
			pInspectEffectOn = false
		else
			_DE_WearEquipError.Show()
		endif
	else
		WEAREquip(akBaseObject)
	endif
	if Compatibility.isSKYUILoaded
		Status.UpdateValue()
	endif
endEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	;notification("I just unequipped something!")
	if akBaseObject as Armor

		if _DE_EquipExceptions.HasForm(akBaseObject)
			return
		elseif Compatibility.isSKSELoaded && !(GetUsesMainBodySlot(akBaseObject as Armor))
			return
		endif

		if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
			FrostfallDebug(5, "Unequipped body armor!")
			_DE_fBody.SetValue(0.1)
			_DE_CurrentBody = none
		endif
		if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
			FrostfallDebug(5, "Unequipped gloves!")
			_DE_fHands.SetValue(0.0)
			_DE_CurrentHands = none
		endif
		if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
			FrostfallDebug(5, "Unequipped helmet!")
			_DE_fHead.SetValue(0.0)
			_DE_CurrentHead = none
		endif
		if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
			FrostfallDebug(5, "Unequipped boots!")
			_DE_fFeet.SetValue(0.0)
			_DE_CurrentFeet = none
		endif
		if _DE_Backpacks.HasForm(akBaseObject)
			_DE_CurrentBackpack = none
		endif
		
		;Cloak check
		CloakCheck(akBaseObject, true)
		
	elseif akBaseObject as Ammo
		FrostfallDebug(5, "Setting ammo to none")
		_DE_CurrentAmmo = none
	endif
	if Compatibility.isSKYUILoaded
		Status.UpdateValue()
	endif
endEvent

function CloakApplyEffect(Form akBaseObject)
	FrostfallDebug(5, "Called ApplyCloakEffect()")
	;Discover type
	if ArrayHasFormXT("cloak burlap", akBaseObject)
		if pSetting_Armor
			PlayerRef.AddSpell(_DE_CloakState_Spell_Burlap, false)
			ShowWEARMessage("cloak")
			FrostfallDebug(5, "...applied burlap effect.")
		else
			PlayerRef.AddSpell(_DE_CloakState_Spell, false)
			ShowWEARMessage("cloak")
			FrostfallDebug(5, "...applied generic effect.")
		endif
	elseif ArrayHasFormXT("cloak linen", akBaseObject)
		if pSetting_Armor
			PlayerRef.AddSpell(_DE_CloakState_Spell_Linen, false)
			ShowWEARMessage("cloak")
			FrostfallDebug(5, "...applied linen effect.")
		else
			PlayerRef.AddSpell(_DE_CloakState_Spell, false)
			ShowWEARMessage("cloak")
			FrostfallDebug(5, "...applied generic effect.")
		endif
	elseif ArrayHasFormXT("cloak hide", akBaseObject)
		if pSetting_Armor
			PlayerRef.AddSpell(_DE_CloakState_Spell_Hide, false)
			ShowWEARMessage("cloak")
			FrostfallDebug(5, "...applied hide effect.")
		else
			PlayerRef.AddSpell(_DE_CloakState_Spell, false)
			ShowWEARMessage("cloak")
			FrostfallDebug(5, "...applied generic effect.")
		endif
	elseif ArrayHasFormXT("cloak fur", akBaseObject)
		if pSetting_Armor
			PlayerRef.AddSpell(_DE_CloakState_Spell_Fur, false)
			ShowWEARMessage("cloak")
			FrostfallDebug(5, "...applied fur effect.")
		else
			PlayerRef.AddSpell(_DE_CloakState_Spell, false)
			ShowWEARMessage("cloak")
			FrostfallDebug(5, "...applied generic effect.")
		endif
	elseif (akBaseObject.HasKeyword(ArmorMaterialLeather) || akBaseObject.HasKeyword(ArmorMaterialHide)) && akBaseObject.HasKeyword(VendorItemClothing) && akBaseObject.HasKeyword(ArmorClothing) && akBaseObject.HasKeyword(ClothingNecklace)
		if pSetting_Armor
			PlayerRef.AddSpell(_DE_CloakState_Spell_Linen, false)
			ShowWEARMessage("cloak")
			FrostfallDebug(5, "...applied linen effect (legacy support).")	
		else
			PlayerRef.AddSpell(_DE_CloakState_Spell, false)
			ShowWEARMessage("cloak")
			FrostfallDebug(5, "...applied generic effect (legacy support).")
		endif
	else
		;Fall-through option (should never reach here)
		if pSetting_Armor
			PlayerRef.AddSpell(_DE_CloakState_Spell_Linen, false)
			ShowWEARMessage("cloak")
			FrostfallDebug(5, "...applied linen effect (legacy support).")	
		else
			PlayerRef.AddSpell(_DE_CloakState_Spell, false)
			ShowWEARMessage("cloak")
			FrostfallDebug(5, "...applied generic effect (legacy support).")
		endif		
	endif
endFunction

function CloakRemoveEffects()
	PlayerRef.RemoveSpell(_DE_CloakState_Spell_Burlap)
	PlayerRef.RemoveSpell(_DE_CloakState_Spell_Linen)
	PlayerRef.RemoveSpell(_DE_CloakState_Spell_Hide)
	PlayerRef.RemoveSpell(_DE_CloakState_Spell_Fur)
	PlayerRef.RemoveSpell(_DE_CloakState_Spell)
endFunction

function CloakCheck(Form akBaseObject, bool bIsUnequipping = false)
	
	;Chesko's Notes: Let it be known that I am not proud of this function. It is written the way it is to
	;attempt to avoid an otherwise unavoidable race condition when equipping cloaks and armor with cloaks.
	;This race condition exists because I am acting on equip events instead of relying on enchantments
	;or keywords on the equipment.
	
	;It is still possible for equip events to 'stack up' and fire on top of each other when cloaks are
	;equipped and unequipped rapidly, when using the favorites menu. However, this was determined to be an
	;unrealistic use case. Most people will carry one or two cloaks, and switch between them seldomly.
	;The function is breakable, but not under normal play conditions.
	
	bool bIsCloak = ArrayHasFormXT("cloak burlap", akBaseObject) || ArrayHasFormXT("cloak linen", akBaseObject) || ArrayHasFormXT("cloak hide", akBaseObject) || ArrayHasFormXT("cloak fur", akBaseObject) || ( (akBaseObject.HasKeyword(ArmorMaterialLeather) || akBaseObject.HasKeyword(ArmorMaterialHide)) && akBaseObject.HasKeyword(VendorItemClothing) && akBaseObject.HasKeyword(ArmorClothing) && akBaseObject.HasKeyword(ClothingNecklace) )
	FrostfallDebug(5, "bIsCloak = " + bIsCloak)

	if bIsCloak && bIsUnequipping == false
		FrostfallDebug(5, "Cloak Equip condition check...")
		if _DE_CurrentCloak == akBaseObject
			FrostfallDebug(5, "...this cloak is the same as the 'current' cloak. Returning.")
		else
			;Cloak + Armor
			if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
				FrostfallDebug(5, "...this cloak is attached to armor.")
				;Is my current cloak a Cloak + Armor?
				if _DE_CurrentCloak
					if _DE_CurrentCloak.HasKeyword(ArmorCuirass) || _DE_CurrentCloak.HasKeyword(ClothingBody)
						;FrostfallDebug(5, "...my current cloak is attached to armor. Discovering cloak type and applying new effects.")
						
						CloakApplyEffect(akBaseObject)
						
						_DE_CurrentCloak = akBaseObject as Armor
						FrostfallDebug(5, "...current cloak is now the recently equipped cloak item. DONE.")
						
					else
						FrostfallDebug(5, "...I am already wearing a stand-alone cloak. Returning.")
					endif
				else
					FrostfallDebug(5, "...there is no current cloak. Discovering cloak type and applying new effects.")
					
					CloakApplyEffect(akBaseObject)
					
					_DE_CurrentCloak = akBaseObject as Armor
					FrostfallDebug(5, "...current cloak is now the recently equipped cloak item. DONE.")
					
				endif
			
			;Cloak
			else
				FrostfallDebug(5, "...this cloak is stand-alone. Discovering cloak type and applying new effects.")
				
				CloakApplyEffect(akBaseObject)
				
				_DE_CurrentCloak = akBaseObject as Armor
				FrostfallDebug(5, "...current cloak is now the recently equipped cloak item. DONE.")
			endif
		endif
	
	elseif bIsCloak && bIsUnequipping == true
		;FrostfallDebug(5, "..oak Unequip condition......")
		if _DE_CurrentCloak
			if PlayerRef.IsEquipped(_DE_CurrentCloak)
				FrostfallDebug(5, "......the 'current' cloak is still equipped. Returning.")
			else
				FrostfallDebug(5, "......the 'current' cloak is no longer equipped.")
				if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
					_DE_CurrentCloak = none
					FrostfallDebug(5, "......current cloak is now NONE and the unequipped item was armor. DONE.")
					CloakRemoveEffects()
				else
					;I unequipped a real cloak; check for armor + cloak underneath
					if ( ArrayHasFormXT("cloak burlap", _DE_CurrentBody) || ArrayHasFormXT("cloak linen", _DE_CurrentBody) || ArrayHasFormXT("cloak hide", _DE_CurrentBody) || ArrayHasFormXT("cloak fur", _DE_CurrentBody) ) && _DE_CurrentBody != none
						
						CloakApplyEffect(_DE_CurrentBody as form)
						
						_DE_CurrentCloak = _DE_CurrentBody
						FrostfallDebug(5, "......current cloak is now the currently equipped body armor. DONE.")
					else
						_DE_CurrentCloak = none
						FrostfallDebug(5, "......current cloak is now NONE and the unequipped item was a cloak. DONE.")
						CloakRemoveEffects()
					endif
				endif
			endif
		else
			
			FrostfallDebug(5, "......current cloak not set. Removing effects. DONE.")
			CloakRemoveEffects()
			
		endif
	endif	
endFunction

function WEAREquip(Form akBaseObject)
	;First, check exceptions
	if _DE_EquipExceptions.HasForm(akBaseObject)
		return
	elseif Compatibility.isSKSELoaded && !(GetUsesMainBodySlot(akBaseObject))
		return
	else
		WEAREquipArmor(akBaseObject)
	endif
endFunction

;@TODO: Convert to using CampfireOnGearEquipped Event.
function WEAREquipArmor(form akBaseObject)	
	;No exceptions found, continuing.
	
	WaitMenuMode(0.3)	;Helps prevent a race condition when switching equipment.
	
	if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
		FrostfallDebug(5, "The player equipped a piece of body armor.")
		
		_DE_CurrentBody = akBaseObject as Armor
		
		if !(pSetting_Armor)
			_DE_fBody.SetValue(1.25)
			
			;Does this armor also have an integrated cloak?
			CloakCheck(akBaseObject, false)
		else
			;Player is using W.E.A.R.
			if ArrayHasFormXT("body full", akBaseObject)
				_DE_fBody.SetValue(1.75)
				ShowWEARMessage("body full")
			elseif ArrayHasFormXT("body limited", akBaseObject)
				_DE_fBody.SetValue(0.75)
				ShowWEARMessage("body limited")
			else
				_DE_fBody.SetValue(1.25)
				ShowWEARMessage("body standard")
			endif
			
			;Does this armor also have an integrated cloak?
			CloakCheck(akBaseObject, false)
		endif
	endif	
	
	if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
		
		_DE_CurrentHands = akBaseObject as Armor
	
		FrostfallDebug(5, "The player equipped a piece of hand armor.")
		if !(pSetting_Armor)
			_DE_fHands.SetValue(0.25)
		else
			;Player is using W.E.A.R.
			if ArrayHasFormXT("hands full", akBaseObject)
				_DE_fHands.SetValue(0.25)
				ShowWEARMessage("hands full")
			elseif ArrayHasFormXT("hands limited", akBaseObject)
				_DE_fHands.SetValue(0.05)
				ShowWEARMessage("hands limited")
			else
				_DE_fHands.SetValue(0.12)
				ShowWEARMessage("hands standard")
			endif
		endif
	endif
	
	if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
	
		_DE_CurrentHead = akBaseObject as Armor
	
		FrostfallDebug(5, "The player equipped a piece of head armor.")
		if !(pSetting_Armor)
			_DE_fHead.SetValue(0.50)
		else
			;Player is using W.E.A.R.
			if ArrayHasFormXT("head full", akBaseObject)
				_DE_fHead.SetValue(0.50)
				ShowWEARMessage("head full")
			elseif ArrayHasFormXT("head limited", akBaseObject)
				_DE_fHead.SetValue(0.15)
				ShowWEARMessage("head limited")
			else
				_DE_fHead.SetValue(0.35)
				ShowWEARMessage("head standard")
			endif
		endif
	endif
	
	if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
		
		_DE_CurrentFeet = akBaseObject as Armor
		
		FrostfallDebug(5, "The player equipped a piece of feet armor.")
		if !(pSetting_Armor)
			_DE_fFeet.SetValue(0.25)
		else
			;Player is using W.E.A.R.
			if ArrayHasFormXT("feet full", akBaseObject)
				_DE_fFeet.SetValue(0.25)
				ShowWEARMessage("feet full")
			elseif ArrayHasFormXT("feet limited", akBaseObject)
				_DE_fFeet.SetValue(0.05)
				ShowWEARMessage("feet limited")
			else
				_DE_fFeet.SetValue(0.13)
				ShowWEARMessage("feet standard")
			endif
		endif
	endif
	
	if _DE_Backpacks.HasForm(akBaseObject)
		_DE_CurrentBackpack = akBaseObject as Armor
		;notification("Backpack: " + _DE_CurrentBackpack)
	elseif akBaseObject as Ammo
		_DE_CurrentAmmo = akBaseObject as Ammo
		;notification("Ammo: " + _DE_CurrentAmmo)
	else
		CloakCheck(akBaseObject, false)
	endif
	
endFunction

function InspectEquipment(Armor akBaseObject)
	int iProt = GetProtectionValue(akBaseObject)							;3 = full, 2 = standard, 1 = limited
	if iProt == 99
		_DE_WEAR_Error_Cloaks.Show()
	elseif iProt == 0
		_DE_WEAR_Error_General.Show()
	elseif iProt == 1
		int ibutton = _DE_WEARSelectMenu1.Show()
		if ibutton == 0
			;limited
			if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
				if !ArrayHasFormXT("body limited", akBaseObject)
					ArrayAddFormXT("body limited", akBaseObject)
				endif
				ArrayRemoveFormXT("body full", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
				if !ArrayHasFormXT("hands limited", akBaseObject)
					ArrayAddFormXT("hands limited", akBaseObject)
				endif
				ArrayRemoveFormXT("hands full", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
				if !ArrayHasFormXT("head limited", akBaseObject)
					ArrayAddFormXT("head limited", akBaseObject)
				endif
				ArrayRemoveFormXT("head full", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
				if !ArrayHasFormXT("feet limited", akBaseObject)
					ArrayAddFormXT("feet limited", akBaseObject)
				endif
				ArrayRemoveFormXT("feet full", akBaseObject)
			endif
		elseif ibutton == 1
			;standard
			if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
				ArrayRemoveFormXT("body full", akBaseObject)
				ArrayRemoveFormXT("body limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
				ArrayRemoveFormXT("hands full", akBaseObject)
				ArrayRemoveFormXT("hands limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
				ArrayRemoveFormXT("head full", akBaseObject)
				ArrayRemoveFormXT("head limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
				ArrayRemoveFormXT("feet full", akBaseObject)
				ArrayRemoveFormXT("feet limited", akBaseObject)
			endif
		elseif ibutton == 2
			;full
			if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
				if !ArrayHasFormXT("body full", akBaseObject)
					ArrayAddFormXT("body full", akBaseObject)
				endif
				ArrayRemoveFormXT("body limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
				if !ArrayHasFormXT("hands full", akBaseObject)
					ArrayAddFormXT("hands full", akBaseObject)
				endif
				ArrayRemoveFormXT("hands limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
				if !ArrayHasFormXT("head full", akBaseObject)
					ArrayAddFormXT("head full", akBaseObject)
				endif
				ArrayRemoveFormXT("head limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
				if !ArrayHasFormXT("feet full", akBaseObject)
					ArrayAddFormXT("feet full", akBaseObject)
				endif
				ArrayRemoveFormXT("feet limited", akBaseObject)
			endif
		endif
	elseif iProt == 2
		int ibutton = _DE_WEARSelectMenu2.Show()
		if ibutton == 0
			;limited
			if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
				if !ArrayHasFormXT("body limited", akBaseObject)
					ArrayAddFormXT("body limited", akBaseObject)
				endif
				ArrayRemoveFormXT("body full", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
				if !ArrayHasFormXT("hands limited", akBaseObject)
					ArrayAddFormXT("hands limited", akBaseObject)
				endif
				ArrayRemoveFormXT("hands full", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
				if !ArrayHasFormXT("head limited", akBaseObject)
					ArrayAddFormXT("head limited", akBaseObject)
				endif
				ArrayRemoveFormXT("head full", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
				if !ArrayHasFormXT("feet limited", akBaseObject)
					ArrayAddFormXT("feet limited", akBaseObject)
				endif
				ArrayRemoveFormXT("feet full", akBaseObject)
			endif
		elseif ibutton == 1
			;standard
			if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
				ArrayRemoveFormXT("body full", akBaseObject)
				ArrayRemoveFormXT("body limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
				ArrayRemoveFormXT("hands full", akBaseObject)
				ArrayRemoveFormXT("hands limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
				ArrayRemoveFormXT("head full", akBaseObject)
				ArrayRemoveFormXT("head limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
				ArrayRemoveFormXT("feet full", akBaseObject)
				ArrayRemoveFormXT("feet limited", akBaseObject)
			endif
		elseif ibutton == 2
			;full
			if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
				if !ArrayHasFormXT("body full", akBaseObject)
					ArrayAddFormXT("body full", akBaseObject)
				endif
				ArrayRemoveFormXT("body limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
				if !ArrayHasFormXT("hands full", akBaseObject)
					ArrayAddFormXT("hands full", akBaseObject)
				endif
				ArrayRemoveFormXT("hands limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
				if !ArrayHasFormXT("head full", akBaseObject)
					ArrayAddFormXT("head full", akBaseObject)
				endif
				ArrayRemoveFormXT("head limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
				if !ArrayHasFormXT("feet full", akBaseObject)
					ArrayAddFormXT("feet full", akBaseObject)
				endif
				ArrayRemoveFormXT("feet limited", akBaseObject)
			endif
		endif
	elseif iProt == 3
		int ibutton = _DE_WEARSelectMenu3.Show()
		if ibutton == 0
			;limited
			if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
				if !ArrayHasFormXT("body limited", akBaseObject)
					ArrayAddFormXT("body limited", akBaseObject)
				endif
				ArrayRemoveFormXT("body full", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
				if !ArrayHasFormXT("hands limited", akBaseObject)
					ArrayAddFormXT("hands limited", akBaseObject)
				endif
				ArrayRemoveFormXT("hands full", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
				if !ArrayHasFormXT("head limited", akBaseObject)
					ArrayAddFormXT("head limited", akBaseObject)
				endif
				ArrayRemoveFormXT("head full", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
				if !ArrayHasFormXT("feet limited", akBaseObject)
					ArrayAddFormXT("feet limited", akBaseObject)
				endif
				ArrayRemoveFormXT("feet full", akBaseObject)
			endif
		elseif ibutton == 1
			;standard
			if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
				ArrayRemoveFormXT("body full", akBaseObject)
				ArrayRemoveFormXT("body limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
				ArrayRemoveFormXT("hands full", akBaseObject)
				ArrayRemoveFormXT("hands limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
				ArrayRemoveFormXT("head full", akBaseObject)
				ArrayRemoveFormXT("head limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
				ArrayRemoveFormXT("feet full", akBaseObject)
				ArrayRemoveFormXT("feet limited", akBaseObject)
			endif
		elseif ibutton == 2
			;full
			if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
				if !ArrayHasFormXT("body full", akBaseObject)
					ArrayAddFormXT("body full", akBaseObject)
				endif
				ArrayRemoveFormXT("body limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
				if !ArrayHasFormXT("hands full", akBaseObject)
					ArrayAddFormXT("hands full", akBaseObject)
				endif
				ArrayRemoveFormXT("hands limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead) || akBaseObject == ClothesMGRobesArchmage1Hooded
				if !ArrayHasFormXT("head full", akBaseObject)
					ArrayAddFormXT("head full", akBaseObject)
				endif
				ArrayRemoveFormXT("head limited", akBaseObject)
			endif
			if akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
				if !ArrayHasFormXT("feet full", akBaseObject)
					ArrayAddFormXT("feet full", akBaseObject)
				endif
				ArrayRemoveFormXT("feet limited", akBaseObject)
			endif
		endif
	endif
	Game.DisablePlayerControls()					;Force the player out of their inventory
	PlayerRef.UnequipItem(akBaseObject, false, true)
	utility.wait(0.5)
	PlayerRef.EquipItem(akBaseObject, false, true)
	Game.EnablePlayerControls()
endFunction

int Function GetProtectionValue(Armor akBaseObject)
	
	if _DE_EquipExceptions.HasForm(akBaseObject)
		return 0
	elseif Compatibility.isSKSELoaded && !(GetUsesMainBodySlot(akBaseObject as Armor))
		return 0
	endif
	
	if akBaseObject.HasKeyword(ArmorCuirass) || akBaseObject.HasKeyword(ClothingBody)
		if ArrayHasFormXT("body full", akBaseObject)
			;messagebox("Return full!")
			return 3
		elseif ArrayHasFormXT("body limited", akBaseObject)
			;messagebox("Return limited!")
			return 1
		else
			return 2
		endif
		
	elseif akBaseObject.HasKeyword(ArmorGauntlets) || akBaseObject.HasKeyword(ClothingHands)
		if ArrayHasFormXT("hands full", akBaseObject)
			;messagebox("Hands: Return Full")
			return 3
		elseif ArrayHasFormXT("hands limited", akBaseObject)
			;messagebox("Hands: Return Limited")
			return 1
		else
			return 2
		endif
		
	elseif akBaseObject.HasKeyword(ArmorHelmet) || akBaseObject.HasKeyword(ClothingHead)
		if ArrayHasFormXT("head full", akBaseObject)
			;messagebox("Head: Return Full")
			return 3
		elseif ArrayHasFormXT("head limited", akBaseObject)
			;messagebox("Head: Return Limited")
			return 1
		else
			return 2
		endif
		
	elseif akBaseObject.HasKeyword(ArmorBoots) || akBaseObject.HasKeyword(ClothingFeet)
		if ArrayHasFormXT("feet full", akBaseObject)
			;messagebox("Feet: Return Full")
			return 3
		elseif ArrayHasFormXT("feet limited", akBaseObject)
			;messagebox("Feet: Return Limited")
			return 1
		else	
			return 2
		endif
	;Cloak check
	elseif ArrayHasFormXT("cloak burlap", akBaseObject)
		return 99
	elseif ArrayHasFormXT("cloak linen", akBaseObject)
		return 99
	elseif ArrayHasFormXT("cloak hide", akBaseObject)
		return 99
	elseif ArrayHasFormXT("cloak fur", akBaseObject)
		return 99
	elseif (akBaseObject.HasKeyword(ArmorMaterialLeather) || akBaseObject.HasKeyword(ArmorMaterialHide)) && akBaseObject.HasKeyword(VendorItemClothing) && akBaseObject.HasKeyword(ArmorClothing) && akBaseObject.HasKeyword(ClothingNecklace)
		return 99
	else
		return 0
	endif
endFunction

function WEAREnabledArray()

	trace("============================================[Frostfall: Warning Start]============================================")
	trace("                                                                                                                  ")
	trace("               Frostfall is now enabling W.E.A.R. Papyrus warnings may follow. They can be ignored.               ")
	trace("                                                                                                                  ")
	trace("============================================[ Frostfall: Warning End ]============================================")

	InitializeArrays()

	ArrayClearXT("body full")
	ArrayClearXT("body limited")
	ArrayClearXT("feet full")
	ArrayClearXT("feet limited")
	ArrayClearXT("hands full")
	ArrayClearXT("hands limited")
	ArrayClearXT("head full")
	ArrayClearXT("head limited")
	ArrayClearXT("cloak burlap")
	ArrayClearXT("cloak linen")
	ArrayClearXT("cloak hide")
	ArrayClearXT("cloak fur")
	
	;Armor Full
	ArrayAddFormXT("body full", ArmorCompanionsCuirass)
	ArrayAddFormXT("body full", ArmorBanditCuirass)
	ArrayAddFormXT("body full", ArmorOrcishCuirass)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassHeavyArmor03)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassHeavyArmor04)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassHeavyArmor05)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassAlteration03)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassConjuration03)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassDestruction03)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassHealth03)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassIllusion03)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassRestoration03)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassAlteration04)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassConjuration04)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassDestruction04)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassHealth04)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassIllusion04)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassRestoration04)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassAlteration05)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassConjuration05)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassDestruction05)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassHealth05)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassIllusion05)
	ArrayAddFormXT("body full", EnchArmorOrcishCuirassRestoration05)

	;messagebox("The Full Armor array contains " + ArrayCount(_DE_ArmorBodyFull) + " of 23 expected records.")
		
	;Armor Limited
	ArrayAddFormXT("body limited", ArmorFalmerCuirass)
	ArrayAddFormXT("body limited", ForswornCuirass)
	ArrayAddFormXT("body limited", ClothesPrisonerRags)
	ArrayAddFormXT("body limited", ClothesPrisonerTunic)
	ArrayAddFormXT("body limited", ArmorHideCuirass)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassAlteration01)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassConjuration01)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassDestruction01)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassHealth01)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassIllusion01)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassRestoration01)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassAlteration02)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassConjuration02)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassDestruction02)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassHealth02)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassIllusion02)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassRestoration02)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassAlteration03)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassConjuration03)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassDestruction03)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassHealth03)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassIllusion03)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassRestoration03)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassLightArmor01)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassLightArmor02)
	ArrayAddFormXT("body limited", EnchArmorHideCuirassLightArmor03)
	ArrayAddFormXT("body limited", ArmorBanditCuirass2)
	ArrayAddFormXT("body limited", ArmorBanditCuirass1)
	ArrayAddFormXT("body limited", ArmorIronCuirass)
	ArrayAddFormXT("body limited", EnchArmorIronArmorAlteration03)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassAlteration01)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassDestruction01)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassHealth01)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassIllusion01)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassRestoration01)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassAlteration02)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassConjuration01)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassConjuration02)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassDestruction02)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassHealth02)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassIllusion02)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassRestoration02)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassAlteration03)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassConjuration03)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassDestruction03)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassHealth03)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassIllusion03)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassRestoration03)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassHeavyArmor01)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassHeavyArmor02)
	ArrayAddFormXT("body limited", EnchArmorIronCuirassHeavyArmor03)
	ArrayAddFormXT("body limited", ArmorStuddedCuirass)
	ArrayAddFormXT("body limited", EnchArmorStuddedCuirassHealth01)
	ArrayAddFormXT("body limited", EnchArmorStuddedCuirassHealth02)
	ArrayAddFormXT("body limited", EnchArmorStuddedCuirassHealth03)
	ArrayAddFormXT("body limited", EnchArmorStuddedCuirassLightArmor01)
	ArrayAddFormXT("body limited", EnchArmorStuddedCuirassLightArmor02)
	ArrayAddFormXT("body limited", EnchArmorStuddedCuirassLightArmor03)
	ArrayAddFormXT("body limited", ArmorIronBandedCuirass)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassAlteration01)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassConjuration01)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassDestruction01)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassHealth01)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassIllusion01)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassAlteration02)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassConjuration02)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassDestruction02)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassHealth02)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassIllusion02)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassAlteration03)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassConjuration03)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassDestruction03)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassHealth03)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassIllusion03)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassRestoration01)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassRestoration02)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassRestoration03)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassHeavyArmor01)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassHeavyArmor02)
	ArrayAddFormXT("body limited", EnchArmorIronBandedCuirassHeavyArmor03)
	
	;messagebox("The Limited Armor formlist contains " + ArrayCount(_DE_ArmorBodyLimited) + " of 76 expected records.")
	
	;Feet Full
	ArrayAddFormXT("feet full", _DE_ArmorStormcloakBoots)
	ArrayAddFormXT("feet full", ArmorCompanionsBoots)
	ArrayAddFormXT("feet full", ArmorStormcloakBoots)
	ArrayAddFormXT("feet full", ArmorBanditBoots)
	ArrayAddFormXT("feet full", ClothesJarlShoes)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsStamina03)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsStamina04)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsStamina05)
	ArrayAddFormXT("feet full", ArmorOrcishBoots)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsCarry03)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsCarry04)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsCarry05)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsResistFire03)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsResistFrost03)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsResistShock03)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsResistFire04)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsResistFrost04)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsResistShock04)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsResistFire05)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsResistFrost05)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsResistShock05)
	ArrayAddFormXT("feet full", EnchArmorOrcishBootsMuffle)
	
	;messagebox("The Feet Full formlist contains " + ArrayCount(_DE_ArmorFeetFull) + " of 20 expected records.")
	
	;Feet Limited
	ArrayAddFormXT("feet limited", ArmorFalmerBoots)
	ArrayAddFormXT("feet limited", ForswornBoots)
	ArrayAddFormXT("feet limited", ClothesPrisonerShoes)
	ArrayAddFormXT("feet limited", ArmorHideBoots)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsResistFire01)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsResistFrost01)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsResistShock01)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsResistFire02)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsResistFrost02)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsResistShock02)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsResistFire03)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsResistFrost03)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsResistShock03)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsCarry01)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsCarry02)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsCarry03)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsSneak01)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsStamina01)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsSneak02)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsStamina02)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsSneak03)
	ArrayAddFormXT("feet limited", EnchArmorHideBootsStamina03)
	ArrayAddFormXT("feet limited", ArmorIronBoots)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsCarry01)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsCarry02)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsCarry03)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsResistFire01)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsResistFrost01)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsResistShock01)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsResistFire02)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsResistFrost02)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsResistShock02)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsResistFire03)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsResistFrost03)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsResistShock03)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsStamina01)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsStamina02)
	ArrayAddFormXT("feet limited", EnchArmorIronBootsStamina03)
	
	;messagebox("The Feet Limited formlist contains " + ArrayCount(_DE_ArmorFeetLimited) + " of 35 expected records.")
	
	
	;Hands Full
	ArrayAddFormXT("hands full", ArmorCompanionsGauntlets)
	ArrayAddFormXT("hands full", ArmorBanditGauntlets)
	ArrayAddFormXT("hands full", ArmorOrcishGauntlets)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsAlchemy03)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsAlchemy04)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsAlchemy05)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsMarksman03)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsMarksman04)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsMarksman05)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsOneHanded03)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsOneHanded04)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsOneHanded05)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsSmithing03)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsSmithing04)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsSmithing05)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsTwoHanded03)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsTwoHanded04)
	ArrayAddFormXT("hands full", EnchArmorOrcishGauntletsTwoHanded05)
	ArrayAddFormXT("hands full", ArmorStormcloakGauntlets)
	
	;messagebox("The Hands Full formlist contains " + ArrayCount(_DE_ArmorHandsFull) + " of 18 expected records.")
	
	;Hands Limited
	ArrayAddFormXT("hands limited", ArmorFalmerGauntlets)
	ArrayAddFormXT("hands limited", ForswornGauntlets)
	ArrayAddFormXT("hands limited", PrisonerCuffsPlayer)
	ArrayAddFormXT("hands limited", ArmorHideGauntlets)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsAlchemy01)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsAlchemy02)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsAlchemy03)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsPickpocket01)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsPickpocket02)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsPickpocket03)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsLockpicking01)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsLockpicking02)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsLockpicking03)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsOneHanded01)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsOneHanded02)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsOneHanded03)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsTwoHanded01)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsTwoHanded02)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsTwoHanded03)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsMarksman01)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsMarksman02)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsMarksman03)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsSmithing01)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsSmithing02)
	ArrayAddFormXT("hands limited", EnchArmorHideGauntletsSmithing03)
	ArrayAddFormXT("hands limited", ArmorIronGauntlets)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsAlchemy01)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsAlchemy02)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsAlchemy03)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsOneHanded01)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsOneHanded02)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsOneHanded03)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsTwoHanded01)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsTwoHanded02)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsTwoHanded03)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsMarksman01)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsMarksman02)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsMarksman03)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsSmithing01)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsSmithing02)
	ArrayAddFormXT("hands limited", EnchArmorIronGauntletsSmithing03)
	
	;messagebox("The Hands Limited formlist contains " + ArrayCount(_DE_ArmorHandsLimited) + " of 38 expected records.")
	
	
	;Head Full
	ArrayAddFormXT("head full", ArmorCompanionsHelmet)
	ArrayAddFormXT("head full", ArmorBanditHelmet)
	ArrayAddFormXT("head full", ArmorOrcishHelmet)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetAlchemy03)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetAlchemy04)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetAlchemy05)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetAlteration03)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetAlteration04)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetAlteration05)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetMarksman03)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetMarksman04)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetMarksman05)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetConjuration03)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetConjuration04)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetConjuration05)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetIllusion03)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetIllusion04)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetIllusion05)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetMagicka03)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetMagicka04)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetMagicka05)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetRestoration03)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetRestoration04)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetRestoration05)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetDestruction03)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetDestruction04)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetDestruction05)
	ArrayAddFormXT("head full", EnchArmorOrcishHelmetWaterbreathing)
	
	;messagebox("The Head Full formlist contains " + ArrayCount(_DE_ArmorHeadFull) + " of 27 expected records.")
	
	
	;Head Limited
	ArrayAddFormXT("head limited", ArmorFalmerHelmet)
	ArrayAddFormXT("head limited", ForswornHelmet)
	ArrayAddFormXT("head limited", ArmorHideHelmet)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetAlchemy01)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetAlchemy02)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetAlchemy03)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetAlteration01)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetAlteration02)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetAlteration03)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetMarksman01)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetMarksman02)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetMarksman03)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetConjuration01)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetConjuration02)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetConjuration03)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetIllusion01)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetIllusion02)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetIllusion03)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetMagicka01)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetMagicka02)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetMagicka03)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetRestoration01)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetRestoration02)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetRestoration03)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetDestruction01)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetDestruction02)
	ArrayAddFormXT("head limited", EnchArmorHideHelmetDestruction03)
	ArrayAddFormXT("head limited", ArmorIronHelmet)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetAlchemy01)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetAlchemy02)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetAlchemy03)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetAlteration01)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetAlteration02)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetAlteration03)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetMarksman01)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetMarksman02)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetMarksman03)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetConjuration01)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetConjuration02)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetConjuration03)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetIllusion01)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetIllusion02)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetIllusion03)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetMagicka01)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetMagicka02)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetMagicka03)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetRestoration01)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetRestoration02)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetRestoration03)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetDestruction01)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetDestruction02)
	ArrayAddFormXT("head limited", EnchArmorIronHelmetDestruction03)
	
	ArrayAddFormXT("cloak fur", _DE_Cloak_BasicFur)
	ArrayAddFormXT("cloak hide", _DE_Cloak_BasicHide)
	ArrayAddFormXT("cloak linen", _DE_Cloak_BasicLinen)
	ArrayAddFormXT("cloak burlap", _DE_Cloak_BasicBurlap)
	
	Compatibility.VanillaGameLoadUp()

	if Compatibility.isDLC1Loaded
		Compatibility.DLC1LoadUp()
	endif
	
	if Compatibility.isDLC2Loaded
		Compatibility.DLC2LoadUp()
	endif
	
	if Compatibility.isWICLoaded
		Compatibility.WICLoadUp()
		Compatibility.WICLoadUpCloaks()
	endif
	
	if Compatibility.isWACLoaded
		Compatibility.WACLoadUp()
		Compatibility.WACLoadUpCloaks()
	endif
	
	if Compatibility.isNFHLoaded
		Compatibility.NFHLoadUp()
	endif
	
	if Compatibility.isCOSLoaded
		Compatibility.COSLoadUp()
	endif
	
	if Compatibility.isIMALoaded
		Compatibility.IMALoadUp()
	endif
	
	wait(0.2)
	
	PlayerRef.UnequipAll()
	PlayerRef.UnequipAll()
	PlayerRef.UnequipAll()
	_DE_Backpack_Menu2_Setup_OptionsHardcore_BEAREnabledConfirm.Show()

	trace("=========================================[Frostfall: W.E.A.R. Report Start]=======================================")
	trace("                                                                                                                  ")
	trace("               Frostfall has enabled W.E.A.R. successfully.                                                       ")
	trace("                                                                                                                  ")
	trace("               Compatible Equipment Plug-ins Loaded:                                                              ")
	trace("               Dawnguard (DLC):          " + Compatibility.isDLC1Loaded)
	trace("               Dragonborn (DLC):         " + Compatibility.isDLC2Loaded)
    trace("               Winter is Coming:         " + Compatibility.isWICLoaded)
	trace("               Northborn Fur Hoods:      " + Compatibility.isNFHLoaded)
	trace("               Cloaks of Skyrim:         " + Compatibility.isCOSLoaded)
	trace("               Immersive Armors:         " + Compatibility.isIMALoaded)
	trace("               Wet and Cold:             " + Compatibility.isWACLoaded)
	trace("                                                                                                                  ")
	trace("               Forms Loaded:                                                                                      ")
	trace("               Headgear, Full:    Loaded " + ArrayCountXT("head full") + " forms.                                 ")
	trace("               Headgear, Limited: Loaded " + ArrayCountXT("head limited") + " forms.                              ")
	trace("               Body, Full:        Loaded " + ArrayCountXT("body full") + " forms.                                 ")
	trace("               Body, Limited:     Loaded " + ArrayCountXT("body limited") + " forms.                              ")
	trace("               Hands, Full:       Loaded " + ArrayCountXT("hands full") + " forms.                                ")
	trace("               Hands, Limited:    Loaded " + ArrayCountXT("hands limited") + " forms.                             ")
	trace("               Feet, Full:        Loaded " + ArrayCountXT("feet full") + " forms.                                 ")
	trace("               Feet, Limited:     Loaded " + ArrayCountXT("feet limited") + " forms.                              ")
	trace("               Cloaks, Burlap:    Loaded " + ArrayCountXT("cloak burlap") + " forms.                              ")
	trace("               Cloaks, Linen:     Loaded " + ArrayCountXT("cloak linen") + " forms.                               ")
	trace("               Cloaks, Hide:      Loaded " + ArrayCountXT("cloak hide") + " forms.                                ")
	trace("               Cloaks, Fur:       Loaded " + ArrayCountXT("cloak fur") + " forms.                                 ")
	trace("                                                                                                                  ")
	trace("==========================================[Frostfall: W.E.A.R. Report End]========================================")

endFunction

function WEARDisabled()
	if PlayerRef.WornHasKeyword(ArmorCuirass) || PlayerRef.WornHasKeyword(ClothingBody)
		_DE_fBody.SetValue(1.5)
	else
		_DE_fBody.SetValue(0.1)
	endif
	
	if PlayerRef.WornHasKeyword(ArmorGauntlets) || PlayerRef.WornHasKeyword(ClothingHands)
		_DE_fHands.SetValue(0.25)
	else
		_DE_fHands.SetValue(0.0)
	endif
	
	if PlayerRef.WornHasKeyword(ArmorHelmet) || PlayerRef.WornHasKeyword(ClothingHead)
		_DE_fHead.SetValue(0.25)
	else
		_DE_fHead.SetValue(0.0)
	endif
	
	if PlayerRef.WornHasKeyword(ArmorBoots) || PlayerRef.WornHasKeyword(ClothingFeet)
		_DE_fFeet.SetValue(0.25)
	else
		_DE_fFeet.SetValue(0.0)
	endif
	
endFunction

function InitializeArrays()

	if !_DE_ArmorBodyFull_1
		_DE_ArmorBodyFull_1 = new Form[128]
		_DE_ArmorBodyFull_2 = new Form[128]
		_DE_ArmorBodyFull_3 = new Form[128]
		_DE_ArmorBodyFull_4 = new Form[128]
		_DE_ArmorBodyLimited_1 = new Form[128]
		_DE_ArmorBodyLimited_2 = new Form[128]
		_DE_ArmorBodyLimited_3 = new Form[128]
		_DE_ArmorBodyLimited_4 = new Form[128]
		_DE_ArmorFeetFull_1 = new Form[128]
		_DE_ArmorFeetFull_2 = new Form[128]
		_DE_ArmorFeetFull_3 = new Form[128]
		_DE_ArmorFeetFull_4 = new Form[128]
		_DE_ArmorFeetLimited_1 = new Form[128]
		_DE_ArmorFeetLimited_2 = new Form[128]
		_DE_ArmorFeetLimited_3 = new Form[128]
		_DE_ArmorFeetLimited_4 = new Form[128]
		_DE_ArmorHandsFull_1 = new Form[128]
		_DE_ArmorHandsFull_2 = new Form[128]
		_DE_ArmorHandsFull_3 = new Form[128]
		_DE_ArmorHandsFull_4 = new Form[128]
		_DE_ArmorHandsLimited_1 = new Form[128]
		_DE_ArmorHandsLimited_2 = new Form[128]
		_DE_ArmorHandsLimited_3 = new Form[128]
		_DE_ArmorHandsLimited_4 = new Form[128]
		_DE_ArmorHeadFull_1 = new Form[128]
		_DE_ArmorHeadFull_2 = new Form[128]
		_DE_ArmorHeadFull_3 = new Form[128]
		_DE_ArmorHeadFull_4 = new Form[128]
		_DE_ArmorHeadLimited_1 = new Form[128]
		_DE_ArmorHeadLimited_2 = new Form[128]
		_DE_ArmorHeadLimited_3 = new Form[128]
		_DE_ArmorHeadLimited_4 = new Form[128]
		_DE_CloakBurlap_1 = new Form[128]
		_DE_CloakBurlap_2 = new Form[128]
		_DE_CloakBurlap_3 = new Form[128]
		_DE_CloakBurlap_4 = new Form[128]
		_DE_CloakLinen_1 = new Form[128]
		_DE_CloakLinen_2 = new Form[128]
		_DE_CloakLinen_3 = new Form[128]
		_DE_CloakLinen_4 = new Form[128]
		_DE_CloakHide_1 = new Form[128]
		_DE_CloakHide_2 = new Form[128]
		_DE_CloakHide_3 = new Form[128]
		_DE_CloakHide_4 = new Form[128]
		_DE_CloakFur_1 = new Form[128]
		_DE_CloakFur_2 = new Form[128]
		_DE_CloakFur_3 = new Form[128]
		_DE_CloakFur_4 = new Form[128]
	endif

endFunction

;----------------------------------------------
;       ArrayXT Functions                      \
;--------------------------------------------------------------------------------------------------------------------------------------------

bool function ArrayAddFormXT(string ArrayID, Form myForm, bool bMustBeUnique = true)

	;-----------\
    ;Description \  Author: Chesko
    ;----------------------------------------------------------------
    ;Adds a form to the first available element in the first available array
	;associated with this ArrayID.
        
    ;-------------\
    ;Return Values \
    ;----------------------------------------------------------------
    ;               false           =               Error (array full) OR invalid Array ID OR form is already in the array
    ;               true            =               Success

	if bMustBeUnique
		if ArrayHasFormXT(ArrayID, myForm)
			return false
		endif
	endif
	
	if ArrayID == "body full"
		bool DoAddForm = ArrayAddFormXT_Do(_DE_ArmorBodyFull_1, _DE_ArmorBodyFull_2, _DE_ArmorBodyFull_3, _DE_ArmorBodyFull_4, myForm)
		return DoAddForm
	elseif ArrayID == "body limited"
		bool DoAddForm = ArrayAddFormXT_Do(_DE_ArmorBodyLimited_1, _DE_ArmorBodyLimited_2, _DE_ArmorBodyLimited_3, _DE_ArmorBodyLimited_4, myForm)
		return DoAddForm
	elseif ArrayID == "hands full"
		bool DoAddForm = ArrayAddFormXT_Do(_DE_ArmorHandsFull_1, _DE_ArmorHandsFull_2, _DE_ArmorHandsFull_3, _DE_ArmorHandsFull_4, myForm)
		return DoAddForm
	elseif ArrayID == "hands limited"
		bool DoAddForm = ArrayAddFormXT_Do(_DE_ArmorHandsLimited_1, _DE_ArmorHandsLimited_2, _DE_ArmorHandsLimited_3, _DE_ArmorHandsLimited_4, myForm)
		return DoAddForm
	elseif ArrayID == "feet full"
		bool DoAddForm = ArrayAddFormXT_Do(_DE_ArmorFeetFull_1, _DE_ArmorFeetFull_2, _DE_ArmorFeetFull_3, _DE_ArmorFeetFull_4, myForm)
		return DoAddForm
	elseif ArrayID == "feet limited"
		bool DoAddForm = ArrayAddFormXT_Do(_DE_ArmorFeetLimited_1, _DE_ArmorFeetLimited_2, _DE_ArmorFeetLimited_3, _DE_ArmorFeetLimited_4, myForm)
		return DoAddForm
	elseif ArrayID == "head full"
		bool DoAddForm = ArrayAddFormXT_Do(_DE_ArmorHeadFull_1, _DE_ArmorHeadFull_2, _DE_ArmorHeadFull_3, _DE_ArmorHeadFull_4, myForm)
		return DoAddForm
	elseif ArrayID == "head limited"
		bool DoAddForm = ArrayAddFormXT_Do(_DE_ArmorHeadLimited_1, _DE_ArmorHeadLimited_2, _DE_ArmorHeadLimited_3, _DE_ArmorHeadLimited_4, myForm)
		return DoAddForm
	elseif ArrayID == "cloak burlap"
		bool DoAddForm = ArrayAddFormXT_Do(_DE_CloakBurlap_1, _DE_CloakBurlap_2, _DE_CloakBurlap_3, _DE_CloakBurlap_4, myForm)
		return DoAddForm
	elseif ArrayID == "cloak linen"
		bool DoAddForm = ArrayAddFormXT_Do(_DE_CloakLinen_1, _DE_CloakLinen_2, _DE_CloakLinen_3, _DE_CloakLinen_4, myForm)
		return DoAddForm
	elseif ArrayID == "cloak hide"
		bool DoAddForm = ArrayAddFormXT_Do(_DE_CloakHide_1, _DE_CloakHide_2, _DE_CloakHide_3, _DE_CloakHide_4, myForm)
		return DoAddForm
	elseif ArrayID == "cloak fur"
		bool DoAddForm = ArrayAddFormXT_Do(_DE_CloakFur_1, _DE_CloakFur_2, _DE_CloakFur_3, _DE_CloakFur_4, myForm)
		return DoAddForm
	else
		return false
	endif
	
endFunction

bool function ArrayRemoveFormXT(string ArrayID, Form myForm)

	;-----------\
    ;Description \  Author: Chesko
    ;----------------------------------------------------------------
    ;Removes a form from the arrays associated with the ArrayID.
        
    ;-------------\
    ;Return Values \
    ;----------------------------------------------------------------
    ;               false           =               Error (form not found) OR invalid Array ID
    ;               true            =               Success

	if ArrayID == "body full"
		bool DoRemoveForm = ArrayRemoveFormXT_Do(_DE_ArmorBodyFull_1, _DE_ArmorBodyFull_2, _DE_ArmorBodyFull_3, _DE_ArmorBodyFull_4, myForm, ArrayID)
		return DoRemoveForm
	elseif ArrayID == "body limited"
		bool DoRemoveForm = ArrayRemoveFormXT_Do(_DE_ArmorBodyLimited_1, _DE_ArmorBodyLimited_2, _DE_ArmorBodyLimited_3, _DE_ArmorBodyLimited_4, myForm, ArrayID)
		return DoRemoveForm
	elseif ArrayID == "hands full"
		bool DoRemoveForm = ArrayRemoveFormXT_Do(_DE_ArmorHandsFull_1, _DE_ArmorHandsFull_2, _DE_ArmorHandsFull_3, _DE_ArmorHandsFull_4, myForm, ArrayID)
		return DoRemoveForm
	elseif ArrayID == "hands limited"
		bool DoRemoveForm = ArrayRemoveFormXT_Do(_DE_ArmorHandsLimited_1, _DE_ArmorHandsLimited_2, _DE_ArmorHandsLimited_3, _DE_ArmorHandsLimited_4, myForm, ArrayID)
		return DoRemoveForm
	elseif ArrayID == "feet full"
		bool DoRemoveForm = ArrayRemoveFormXT_Do(_DE_ArmorFeetFull_1, _DE_ArmorFeetFull_2, _DE_ArmorFeetFull_3, _DE_ArmorFeetFull_4, myForm, ArrayID)
		return DoRemoveForm
	elseif ArrayID == "feet limited"
		bool DoRemoveForm = ArrayRemoveFormXT_Do(_DE_ArmorFeetLimited_1, _DE_ArmorFeetLimited_2, _DE_ArmorFeetLimited_3, _DE_ArmorFeetLimited_4, myForm, ArrayID)
		return DoRemoveForm
	elseif ArrayID == "head full"
		bool DoRemoveForm = ArrayRemoveFormXT_Do(_DE_ArmorHeadFull_1, _DE_ArmorHeadFull_2, _DE_ArmorHeadFull_3, _DE_ArmorHeadFull_4, myForm, ArrayID)
		return DoRemoveForm
	elseif ArrayID == "head limited"
		bool DoRemoveForm = ArrayRemoveFormXT_Do(_DE_ArmorHeadLimited_1, _DE_ArmorHeadLimited_2, _DE_ArmorHeadLimited_3, _DE_ArmorHeadLimited_4, myForm, ArrayID)
		return DoRemoveForm
	elseif ArrayID == "cloak burlap"
		bool DoRemoveForm = ArrayRemoveFormXT_Do(_DE_CloakBurlap_1, _DE_CloakBurlap_2, _DE_CloakBurlap_3, _DE_CloakBurlap_4, myForm, ArrayID)
		return DoRemoveForm
	elseif ArrayID == "cloak linen"
		bool DoRemoveForm = ArrayRemoveFormXT_Do(_DE_CloakLinen_1, _DE_CloakLinen_2, _DE_CloakLinen_3, _DE_CloakLinen_4, myForm, ArrayID)
		return DoRemoveForm
	elseif ArrayID == "cloak hide"
		bool DoRemoveForm = ArrayRemoveFormXT_Do(_DE_CloakHide_1, _DE_CloakHide_2, _DE_CloakHide_3, _DE_CloakHide_4, myForm, ArrayID)
		return DoRemoveForm
	elseif ArrayID == "cloak fur"
		bool DoRemoveForm = ArrayRemoveFormXT_Do(_DE_CloakFur_1, _DE_CloakFur_2, _DE_CloakFur_3, _DE_CloakFur_4, myForm, ArrayID)
		return DoRemoveForm
	else
		return false
	endif
	
endFunction

bool function ArrayHasFormXT(string ArrayID, Form myForm)

	;-----------\
	;Description \
	;----------------------------------------------------------------
	;Attempts to find the given form in the given Array ID, and returns true if found
	
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		false					= 		Form not found OR invalid array ID
	;		true			 		=		Form found
	
	if ArrayID == "body full"
		bool DoHasForm = ArrayHasFormXT_Do(_DE_ArmorBodyFull_1, _DE_ArmorBodyFull_2, _DE_ArmorBodyFull_3, _DE_ArmorBodyFull_4, myForm)
		return DoHasForm
	elseif ArrayID == "body limited"
		bool DoHasForm = ArrayHasFormXT_Do(_DE_ArmorBodyLimited_1, _DE_ArmorBodyLimited_2, _DE_ArmorBodyLimited_3, _DE_ArmorBodyLimited_4, myForm)
		return DoHasForm
	elseif ArrayID == "hands full"
		bool DoHasForm = ArrayHasFormXT_Do(_DE_ArmorHandsFull_1, _DE_ArmorHandsFull_2, _DE_ArmorHandsFull_3, _DE_ArmorHandsFull_4, myForm)
		return DoHasForm
	elseif ArrayID == "hands limited"
		bool DoHasForm = ArrayHasFormXT_Do(_DE_ArmorHandsLimited_1, _DE_ArmorHandsLimited_2, _DE_ArmorHandsLimited_3, _DE_ArmorHandsLimited_4, myForm)
		return DoHasForm
	elseif ArrayID == "feet full"
		bool DoHasForm = ArrayHasFormXT_Do(_DE_ArmorFeetFull_1, _DE_ArmorFeetFull_2, _DE_ArmorFeetFull_3, _DE_ArmorFeetFull_4, myForm)
		return DoHasForm
	elseif ArrayID == "feet limited"
		bool DoHasForm = ArrayHasFormXT_Do(_DE_ArmorFeetLimited_1, _DE_ArmorFeetLimited_2, _DE_ArmorFeetLimited_3, _DE_ArmorFeetLimited_4, myForm)
		return DoHasForm
	elseif ArrayID == "head full"
		bool DoHasForm = ArrayHasFormXT_Do(_DE_ArmorHeadFull_1, _DE_ArmorHeadFull_2, _DE_ArmorHeadFull_3, _DE_ArmorHeadFull_4, myForm)
		return DoHasForm
	elseif ArrayID == "head limited"
		bool DoHasForm = ArrayHasFormXT_Do(_DE_ArmorHeadLimited_1, _DE_ArmorHeadLimited_2, _DE_ArmorHeadLimited_3, _DE_ArmorHeadLimited_4, myForm)
		return DoHasForm
	elseif ArrayID == "cloak burlap"
		bool DoHasForm = ArrayHasFormXT_Do(_DE_CloakBurlap_1, _DE_CloakBurlap_2, _DE_CloakBurlap_3, _DE_CloakBurlap_4, myForm)
		return DoHasForm
	elseif ArrayID == "cloak linen"
		bool DoHasForm = ArrayHasFormXT_Do(_DE_CloakLinen_1, _DE_CloakLinen_2, _DE_CloakLinen_3, _DE_CloakLinen_4, myForm)
		return DoHasForm
	elseif ArrayID == "cloak hide"
		bool DoHasForm = ArrayHasFormXT_Do(_DE_CloakHide_1, _DE_CloakHide_2, _DE_CloakHide_3, _DE_CloakHide_4, myForm)
		return DoHasForm
	elseif ArrayID == "cloak fur"
		bool DoHasForm = ArrayHasFormXT_Do(_DE_CloakFur_1, _DE_CloakFur_2, _DE_CloakFur_3, _DE_CloakFur_4, myForm)
		return DoHasForm
	else
		return false
	endif
	
endFunction

bool function ArrayClearXT(string ArrayID)
	
	;-----------\
	;Description \
	;----------------------------------------------------------------
	;Clears all arrays associated with this array ID
	
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		false = Invalid Array ID
	;		true  = Complete, Valid Array ID
	
	if ArrayID == "body full"
		ArrayClearXT_Do(_DE_ArmorBodyFull_1, _DE_ArmorBodyFull_2, _DE_ArmorBodyFull_3, _DE_ArmorBodyFull_4)
		return true
	elseif ArrayID == "body limited"
		ArrayClearXT_Do(_DE_ArmorBodyLimited_1, _DE_ArmorBodyLimited_2, _DE_ArmorBodyLimited_3, _DE_ArmorBodyLimited_4)
		return true
	elseif ArrayID == "hands full"
		ArrayClearXT_Do(_DE_ArmorHandsFull_1, _DE_ArmorHandsFull_2, _DE_ArmorHandsFull_3, _DE_ArmorHandsFull_4)
		return true
	elseif ArrayID == "hands limited"
		ArrayClearXT_Do(_DE_ArmorHandsLimited_1, _DE_ArmorHandsLimited_2, _DE_ArmorHandsLimited_3, _DE_ArmorHandsLimited_4)
		return true
	elseif ArrayID == "feet full"
		ArrayClearXT_Do(_DE_ArmorFeetFull_1, _DE_ArmorFeetFull_2, _DE_ArmorFeetFull_3, _DE_ArmorFeetFull_4)
		return true
	elseif ArrayID == "feet limited"
		ArrayClearXT_Do(_DE_ArmorFeetLimited_1, _DE_ArmorFeetLimited_2, _DE_ArmorFeetLimited_3, _DE_ArmorFeetLimited_4)
		return true
	elseif ArrayID == "head full"
		ArrayClearXT_Do(_DE_ArmorHeadFull_1, _DE_ArmorHeadFull_2, _DE_ArmorHeadFull_3, _DE_ArmorHeadFull_4)
		return true
	elseif ArrayID == "head limited"
		ArrayClearXT_Do(_DE_ArmorHeadLimited_1, _DE_ArmorHeadLimited_2, _DE_ArmorHeadLimited_3, _DE_ArmorHeadLimited_4)
		return true
	elseif ArrayID == "cloak burlap"
		ArrayClearXT_Do(_DE_CloakBurlap_1, _DE_CloakBurlap_2, _DE_CloakBurlap_3, _DE_CloakBurlap_4)
		return true
	elseif ArrayID == "cloak linen"
		ArrayClearXT_Do(_DE_CloakLinen_1, _DE_CloakLinen_2, _DE_CloakLinen_3, _DE_CloakLinen_4)
		return true
	elseif ArrayID == "cloak hide"
		ArrayClearXT_Do(_DE_CloakHide_1, _DE_CloakHide_2, _DE_CloakHide_3, _DE_CloakHide_4)
		return true
	elseif ArrayID == "cloak fur"
		ArrayClearXT_Do(_DE_CloakFur_1, _DE_CloakFur_2, _DE_CloakFur_3, _DE_CloakFur_4)
		return true
	else
		return false
	endif
	
endFunction

int function ArrayCountXT(string ArrayID)
	
	;-----------\
	;Description \
	;----------------------------------------------------------------
	;Counts the number of indicies associated with this array ID that do not have a "none" type
	
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		int DoCount = number of indicies that are not "none"
	;		-1			= Invalid Array ID
	
	if ArrayID == "body full"
		int DoCount = ArrayCountXT_Do(_DE_ArmorBodyFull_1, _DE_ArmorBodyFull_2, _DE_ArmorBodyFull_3, _DE_ArmorBodyFull_4)
		return DoCount
	elseif ArrayID == "body limited"
		int DoCount = ArrayCountXT_Do(_DE_ArmorBodyLimited_1, _DE_ArmorBodyLimited_2, _DE_ArmorBodyLimited_3, _DE_ArmorBodyLimited_4)
		return DoCount
	elseif ArrayID == "hands full"
		int DoCount = ArrayCountXT_Do(_DE_ArmorHandsFull_1, _DE_ArmorHandsFull_2, _DE_ArmorHandsFull_3, _DE_ArmorHandsFull_4)
		return DoCount
	elseif ArrayID == "hands limited"
		int DoCount = ArrayCountXT_Do(_DE_ArmorHandsLimited_1, _DE_ArmorHandsLimited_2, _DE_ArmorHandsLimited_3, _DE_ArmorHandsLimited_4)
		return DoCount
	elseif ArrayID == "feet full"
		int DoCount = ArrayCountXT_Do(_DE_ArmorFeetFull_1, _DE_ArmorFeetFull_2, _DE_ArmorFeetFull_3, _DE_ArmorFeetFull_4)
		return DoCount
	elseif ArrayID == "feet limited"
		int DoCount = ArrayCountXT_Do(_DE_ArmorFeetLimited_1, _DE_ArmorFeetLimited_2, _DE_ArmorFeetLimited_3, _DE_ArmorFeetLimited_4)
		return DoCount
	elseif ArrayID == "head full"
		int DoCount = ArrayCountXT_Do(_DE_ArmorHeadFull_1, _DE_ArmorHeadFull_2, _DE_ArmorHeadFull_3, _DE_ArmorHeadFull_4)
		return DoCount
	elseif ArrayID == "head limited"
		int DoCount = ArrayCountXT_Do(_DE_ArmorHeadLimited_1, _DE_ArmorHeadLimited_2, _DE_ArmorHeadLimited_3, _DE_ArmorHeadLimited_4)
		return DoCount
	elseif ArrayID == "cloak burlap"
		int DoCount = ArrayCountXT_Do(_DE_CloakBurlap_1, _DE_CloakBurlap_2, _DE_CloakBurlap_3, _DE_CloakBurlap_4)
		return DoCount
	elseif ArrayID == "cloak linen"
		int DoCount = ArrayCountXT_Do(_DE_CloakLinen_1, _DE_CloakLinen_2, _DE_CloakLinen_3, _DE_CloakLinen_4)
		return DoCount
	elseif ArrayID == "cloak hide"
		int DoCount = ArrayCountXT_Do(_DE_CloakHide_1, _DE_CloakHide_2, _DE_CloakHide_3, _DE_CloakHide_4)
		return DoCount
	elseif ArrayID == "cloak fur"
		int DoCount = ArrayCountXT_Do(_DE_CloakFur_1, _DE_CloakFur_2, _DE_CloakFur_3, _DE_CloakFur_4)
		return DoCount
	else
		return -1
	endif
	
endFunction

bool function ArraySortXT(string ArrayID)
	
	;-----------\
	;Description \
	;----------------------------------------------------------------
	;Removes blank elements by shifting all elements down, moving elements
	;to arrays "below" the current one if necessary.
	
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		true 	= 	Success
	;		false 	= 	Sort not necessary
	
	if ArrayID == "body full"
		bool DoSort = ArraySortXT_Do(_DE_ArmorBodyFull_1, _DE_ArmorBodyFull_2, _DE_ArmorBodyFull_3, _DE_ArmorBodyFull_4)
		return DoSort
	elseif ArrayID == "body limited"
		bool DoSort = ArraySortXT_Do(_DE_ArmorBodyLimited_1, _DE_ArmorBodyLimited_2, _DE_ArmorBodyLimited_3, _DE_ArmorBodyLimited_4)
		return DoSort
	elseif ArrayID == "hands full"
		bool DoSort = ArraySortXT_Do(_DE_ArmorHandsFull_1, _DE_ArmorHandsFull_2, _DE_ArmorHandsFull_3, _DE_ArmorHandsFull_4)
		return DoSort
	elseif ArrayID == "hands limited"
		bool DoSort = ArraySortXT_Do(_DE_ArmorHandsLimited_1, _DE_ArmorHandsLimited_2, _DE_ArmorHandsLimited_3, _DE_ArmorHandsLimited_4)
		return DoSort
	elseif ArrayID == "feet full"
		bool DoSort = ArraySortXT_Do(_DE_ArmorFeetFull_1, _DE_ArmorFeetFull_2, _DE_ArmorFeetFull_3, _DE_ArmorFeetFull_4)
		return DoSort
	elseif ArrayID == "feet limited"
		bool DoSort = ArraySortXT_Do(_DE_ArmorFeetLimited_1, _DE_ArmorFeetLimited_2, _DE_ArmorFeetLimited_3, _DE_ArmorFeetLimited_4)
		return DoSort
	elseif ArrayID == "head full"
		bool DoSort = ArraySortXT_Do(_DE_ArmorHeadFull_1, _DE_ArmorHeadFull_2, _DE_ArmorHeadFull_3, _DE_ArmorHeadFull_4)
		return DoSort
	elseif ArrayID == "head limited"
		bool DoSort = ArraySortXT_Do(_DE_ArmorHeadLimited_1, _DE_ArmorHeadLimited_2, _DE_ArmorHeadLimited_3, _DE_ArmorHeadLimited_4)
		return DoSort
	elseif ArrayID == "cloak burlap"
		bool DoSort = ArraySortXT_Do(_DE_CloakBurlap_1, _DE_CloakBurlap_2, _DE_CloakBurlap_3, _DE_CloakBurlap_4)
		return DoSort
	elseif ArrayID == "cloak linen"
		bool DoSort = ArraySortXT_Do(_DE_CloakLinen_1, _DE_CloakLinen_2, _DE_CloakLinen_3, _DE_CloakLinen_4)
		return DoSort
	elseif ArrayID == "cloak hide"
		bool DoSort = ArraySortXT_Do(_DE_CloakHide_1, _DE_CloakHide_2, _DE_CloakHide_3, _DE_CloakHide_4)
		return DoSort
	elseif ArrayID == "cloak fur"
		bool DoSort = ArraySortXT_Do(_DE_CloakFur_1, _DE_CloakFur_2, _DE_CloakFur_3, _DE_CloakFur_4)
		return DoSort
	else
		return false
	endif
	
endFunction

bool function ArrayRemoveBlankFormsXT(string ArrayID)
	;-----------\
	;Description \
	;----------------------------------------------------------------
	;Clears all arrays associated with this array ID of blank forms ([Form <None>]) and re-sorts the array ID.
	
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		false = Invalid Array ID
	;		true  = Complete, Valid Array ID
	
	if ArrayID == "body full"
		ArrayRemoveBlankFormsXT_Do(_DE_ArmorBodyFull_1, _DE_ArmorBodyFull_2, _DE_ArmorBodyFull_3, _DE_ArmorBodyFull_4, ArrayID)
		return true
	elseif ArrayID == "body limited"
		ArrayRemoveBlankFormsXT_Do(_DE_ArmorBodyLimited_1, _DE_ArmorBodyLimited_2, _DE_ArmorBodyLimited_3, _DE_ArmorBodyLimited_4, ArrayID)
		return true
	elseif ArrayID == "hands full"
		ArrayRemoveBlankFormsXT_Do(_DE_ArmorHandsFull_1, _DE_ArmorHandsFull_2, _DE_ArmorHandsFull_3, _DE_ArmorHandsFull_4, ArrayID)
		return true
	elseif ArrayID == "hands limited"
		ArrayRemoveBlankFormsXT_Do(_DE_ArmorHandsLimited_1, _DE_ArmorHandsLimited_2, _DE_ArmorHandsLimited_3, _DE_ArmorHandsLimited_4, ArrayID)
		return true
	elseif ArrayID == "feet full"
		ArrayRemoveBlankFormsXT_Do(_DE_ArmorFeetFull_1, _DE_ArmorFeetFull_2, _DE_ArmorFeetFull_3, _DE_ArmorFeetFull_4, ArrayID)
		return true
	elseif ArrayID == "feet limited"
		ArrayRemoveBlankFormsXT_Do(_DE_ArmorFeetLimited_1, _DE_ArmorFeetLimited_2, _DE_ArmorFeetLimited_3, _DE_ArmorFeetLimited_4, ArrayID)
		return true
	elseif ArrayID == "head full"
		ArrayRemoveBlankFormsXT_Do(_DE_ArmorHeadFull_1, _DE_ArmorHeadFull_2, _DE_ArmorHeadFull_3, _DE_ArmorHeadFull_4, ArrayID)
		return true
	elseif ArrayID == "head limited"
		ArrayRemoveBlankFormsXT_Do(_DE_ArmorHeadLimited_1, _DE_ArmorHeadLimited_2, _DE_ArmorHeadLimited_3, _DE_ArmorHeadLimited_4, ArrayID)
		return true
	elseif ArrayID == "cloak burlap"
		ArrayRemoveBlankFormsXT_Do(_DE_CloakFur_1, _DE_CloakFur_2, _DE_CloakFur_3, _DE_CloakFur_4, ArrayID)
		return true
	elseif ArrayID == "cloak linen"
		ArrayRemoveBlankFormsXT_Do(_DE_CloakLinen_1, _DE_CloakLinen_2, _DE_CloakLinen_3, _DE_CloakLinen_4, ArrayID)
		return true
	elseif ArrayID == "cloak hide"
		ArrayRemoveBlankFormsXT_Do(_DE_CloakHide_1, _DE_CloakHide_2, _DE_CloakHide_3, _DE_CloakHide_4, ArrayID)
		return true
	elseif ArrayID == "cloak fur"
		ArrayRemoveBlankFormsXT_Do(_DE_CloakFur_1, _DE_CloakFur_2, _DE_CloakFur_3, _DE_CloakFur_4, ArrayID)
		return true
	else
		return false
	endif
endFunction

bool function ArrayAddFormXT_Do(Form[] fArray1, Form[] fArray2, Form[] fArray3, Form[] fArray4, Form myForm)
	;-----------\
    ;Description \  Author: Chesko
    ;----------------------------------------------------------------
    ;Adds a form to the first available element in the first available array
	;associated with this ArrayID.
    
	;-------------\
    ;Return Values \
    ;----------------------------------------------------------------
    ;               false           =               Error (array full)
    ;               true            =               Success
	
	
	int i = 0
	;notification("myArray.Length = " + myArray.Length)
    while i < fArray1.Length
        if fArray1[i] == none
            fArray1[i] = myForm
            ;notification("Adding " + myForm + " to the array.")
            return true
        else
            i += 1
        endif
    endWhile
    
	i = 0
	while i < fArray2.Length
        if fArray2[i] == none
            fArray2[i] = myForm
            ;notification("Adding " + myForm + " to the array.")
            return true
        else
            i += 1
        endif
    endWhile
	
	i = 0
	while i < fArray3.Length
        if fArray3[i] == none
            fArray3[i] = myForm
            ;notification("Adding " + myForm + " to the array.")
            return true
        else
            i += 1
        endif
    endWhile
	
	i = 0
	while i < fArray4.Length
        if fArray4[i] == none
            fArray4[i] = myForm
            ;notification("Adding " + myForm + " to the array.")
            return true
        else
            i += 1
        endif
    endWhile
	
    return false			;All arrays are full
	
endFunction

bool function ArrayRemoveFormXT_Do(Form[] fArray1, Form[] fArray2, Form[] fArray3, Form[] fArray4, Form myForm, string ArrayID, bool bSort = true)
	
	;-----------\
	;Description \
	;----------------------------------------------------------------
	;Removes a form from the array, if found.
	
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		false		=		Error (Form not found)
	;		true		=		Success

	int i = 0
	while i < fArray1.Length
		if fArray1[i] == myForm
			fArray1[i] = none
			;notification("Removing element " + i)
			if bSort == true
				ArraySortXT(ArrayID)
			endif
			return true
		else
			i += 1
		endif
	endWhile

	i = 0
	while i < fArray2.Length
		if fArray2[i] == myForm
			fArray2[i] = none
			;notification("Removing element " + i)
			if bSort == true
				ArraySortXT(ArrayID)
			endif
			return true
		else
			i += 1
		endif
	endWhile		

	i = 0
	while i < fArray3.Length
		if fArray3[i] == myForm
			fArray3[i] = none
			;notification("Removing element " + i)
			if bSort == true
				ArraySortXT(ArrayID)
			endif
			return true
		else
			i += 1
		endif
	endWhile	
	
	i = 0
	while i < fArray4.Length
		if fArray4[i] == myForm
			fArray4[i] = none
			;notification("Removing element " + i)
			if bSort == true
				ArraySortXT(ArrayID)
			endif
			return true
		else
			i += 1
		endif
	endWhile	
	
	return false
	
endFunction

bool function ArrayHasFormXT_Do(Form[] fArray1, Form[] fArray2, Form[] fArray3, Form[] fArray4, Form myForm)
	
	;-----------\
	;Description \
	;----------------------------------------------------------------
	;Attempts to find the given form in the associated array ID, and returns true if found
	
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		false					= 		Form not found
	;		true			 		=		Form found
	
	int i = 0
	while i < fArray1.Length
		if fArray1[i] == myForm
			return true
		else
			i += 1
		endif
	endWhile
	
	i = 0
	while i < fArray2.Length
		if fArray2[i] == myForm
			return true
		else
			i += 1
		endif
	endWhile
	
	i = 0
	while i < fArray3.Length
		if fArray3[i] == myForm
			return true
		else
			i += 1
		endif
	endWhile
	
	i = 0
	while i < fArray4.Length
		if fArray4[i] == myForm
			return true
		else
			i += 1
		endif
	endWhile
	
	return false

endFunction

function ArrayClearXT_Do(Form[] fArray1, Form[] fArray2, Form[] fArray3, Form[] fArray4)

	;-----------\
	;Description \
	;----------------------------------------------------------------
	;Deletes the contents of arrays.
	
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		none

	int i = 0
	while i < fArray1.Length
		fArray1[i] = none
		i += 1
	endWhile
	
	i = 0
	while i < fArray2.Length
		fArray2[i] = none
		i += 1
	endWhile
	
	i = 0
	while i < fArray3.Length
		fArray3[i] = none
		i += 1
	endWhile
	
	i = 0
	while i < fArray4.Length
		fArray4[i] = none
		i += 1
	endWhile
	
endFunction

function ArrayRemoveBlankFormsXT_Do(Form[] fArray1, Form[] fArray2, Form[] fArray3, Form[] fArray4, string ArrayID)

	;-----------\
	;Description \
	;----------------------------------------------------------------
	;Clears all arrays of blank forms ([Form <None>]) and re-sorts.
	
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		none

	int i = 0
	while i < fArray1.Length
		if fArray1[i] == "[Form <None>]"
			fArray1[i] = none
		endif
		i += 1
	endWhile
	
	i = 0
	while i < fArray2.Length
		if fArray2[i] == "[Form <None>]"
			fArray2[i] = none
		endif
		i += 1
	endWhile
	
	i = 0
	while i < fArray3.Length
		if fArray3[i] == "[Form <None>]"
			fArray3[i] = none
		endif
		i += 1
	endWhile
	
	i = 0
	while i < fArray4.Length
		if fArray4[i] == "[Form <None>]"
			fArray4[i] = none
		endif
		i += 1
	endWhile
	
	ArraySortXT(ArrayID)
	
endFunction

int function ArrayCountXT_Do(Form[] fArray1, Form[] fArray2, Form[] fArray3, Form[] fArray4)

	;-----------\
	;Description \
	;----------------------------------------------------------------
	;Counts the number of indicies associated with this array ID that do not have a "none" type
	
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		int myCount = number of indicies that are not "none"

	int myCount = 0
	
	int i = 0
	while i < fArray1.Length
		if fArray1[i] != none
			myCount += 1
			i += 1
		else
			i += 1
		endif
	endWhile
	
	i = 0
	while i < fArray2.Length
		if fArray2[i] != none
			myCount += 1
			i += 1
		else
			i += 1
		endif
	endWhile
	
	i = 0
	while i < fArray3.Length
		if fArray3[i] != none
			myCount += 1
			i += 1
		else
			i += 1
		endif
	endWhile
	
	i = 0
	while i < fArray4.Length
		if fArray4[i] != none
			myCount += 1
			i += 1
		else
			i += 1
		endif
	endWhile
	
	;notification("MyCount = " + myCount)	
	
	return myCount
	
endFunction

bool function ArraySortXT_Do(Form[] fArray1, Form[] fArray2, Form[] fArray3, Form[] fArray4, int i = 0)

	;-----------\
	;Description \  Author: Chesko
	;----------------------------------------------------------------
	;Removes blank elements by shifting all elements down, moving elements
	;to arrays "below" the current one if necessary.
	;Optionally starts sorting from element i.
	
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;                 false        =           No sorting required
	;                 true         =           Success

	
	
	
	;notification("Sort Start")
	bool bFirstNoneFound = false
	int iFirstNoneFoundArray = 0
	int iFirstNonePos = 0
	while i < 512
		;Which array am I looking in?
		int j = 0					;Actual array index to check
		int myCurrArray				;Current array
		if i < 128
			myCurrArray = 1
			j = i
		elseif i < 256 && i >= 128
			j = i - 128
			myCurrArray = 2
		elseif i < 384 && i >= 256
			j = i - 256
			myCurrArray = 3
		elseif i < 512 && i >= 384
			j = i - 384
			myCurrArray = 4
		endif
		
		if myCurrArray == 1
			if fArray1[j] == none
				if bFirstNoneFound == false
					bFirstNoneFound = true
					iFirstNoneFoundArray = myCurrArray
					iFirstNonePos = j
					i += 1
				else
					i += 1
				endif
			else
				if bFirstNoneFound == true
					;check to see if it's a couple of blank entries in a row
					if !(fArray1[j] == none)
						;notification("Moving element " + i + " to index " + iFirstNonePos)
						if iFirstNoneFoundArray == 1
							fArray1[iFirstNonePos] = fArray1[j]
							fArray1[j] = none
						elseif iFirstNoneFoundArray == 2
							fArray2[iFirstNonePos] = fArray1[j]
							fArray1[j] = none
						elseif iFirstNoneFoundArray == 3
							fArray3[iFirstNonePos] = fArray1[j]
							fArray1[j] = none
						elseif iFirstNoneFoundArray == 4
							fArray4[iFirstNonePos] = fArray1[j]
							fArray1[j] = none
						endif
						;Call this function recursively until it returns
						ArraySortXT_Do(fArray1, fArray2, fArray3, fArray4, iFirstNonePos + 1)
						return true
					else
						i += 1
					endif
				else
					i += 1
				endif
			endif
		elseif myCurrArray == 2
			if fArray2[j] == none
				if bFirstNoneFound == false
					bFirstNoneFound = true
					iFirstNoneFoundArray = myCurrArray
					iFirstNonePos = j
					i += 1
				else
					i += 1
				endif
			else
				if bFirstNoneFound == true
					;check to see if it's a couple of blank entries in a row
					if !(fArray2[j] == none)
						;notification("Moving element " + i + " to index " + iFirstNonePos)
						if iFirstNoneFoundArray == 1
							fArray1[iFirstNonePos] = fArray2[j]
							fArray2[j] = none
						elseif iFirstNoneFoundArray == 2
							fArray2[iFirstNonePos] = fArray2[j]
							fArray2[j] = none
						elseif iFirstNoneFoundArray == 3
							fArray3[iFirstNonePos] = fArray2[j]
							fArray2[j] = none
						elseif iFirstNoneFoundArray == 4
							fArray4[iFirstNonePos] = fArray2[j]
							fArray2[j] = none
						endif
						;Call this function recursively until it returns
						ArraySortXT_Do(fArray1, fArray2, fArray3, fArray4, iFirstNonePos + 1)
						return true
					else
						i += 1
					endif
				else
					i += 1
				endif
			endif
		elseif myCurrArray == 3
			if fArray3[j] == none
				if bFirstNoneFound == false
					bFirstNoneFound = true
					iFirstNoneFoundArray = myCurrArray
					iFirstNonePos = j
					i += 1
				else
					i += 1
				endif
			else
				if bFirstNoneFound == true
					;check to see if it's a couple of blank entries in a row
					if !(fArray3[j] == none)
						;notification("Moving element " + i + " to index " + iFirstNonePos)
						if iFirstNoneFoundArray == 1
							fArray1[iFirstNonePos] = fArray3[j]
							fArray3[j] = none
						elseif iFirstNoneFoundArray == 2
							fArray2[iFirstNonePos] = fArray3[j]
							fArray3[j] = none
						elseif iFirstNoneFoundArray == 3
							fArray3[iFirstNonePos] = fArray3[j]
							fArray3[j] = none
						elseif iFirstNoneFoundArray == 4
							fArray4[iFirstNonePos] = fArray3[j]
							fArray3[j] = none
						endif
						;Call this function recursively until it returns
						ArraySortXT_Do(fArray1, fArray2, fArray3, fArray4, iFirstNonePos + 1)
						return true
					else
						i += 1
					endif
				else
					i += 1
				endif
			endif
		elseif myCurrArray == 4
			if fArray4[j] == none
				if bFirstNoneFound == false
					bFirstNoneFound = true
					iFirstNoneFoundArray = myCurrArray
					iFirstNonePos = j
					i += 1
				else
					i += 1
				endif
			else
				if bFirstNoneFound == true
					;check to see if it's a couple of blank entries in a row
					if !(fArray4[j] == none)
						;notification("Moving element " + i + " to index " + iFirstNonePos)
						if iFirstNoneFoundArray == 1
							fArray1[iFirstNonePos] = fArray4[j]
							fArray4[j] = none
						elseif iFirstNoneFoundArray == 2
							fArray2[iFirstNonePos] = fArray4[j]
							fArray4[j] = none
						elseif iFirstNoneFoundArray == 3
							fArray3[iFirstNonePos] = fArray4[j]
							fArray4[j] = none
						elseif iFirstNoneFoundArray == 4
							fArray4[iFirstNonePos] = fArray4[j]
							fArray4[j] = none
						endif
						;Call this function recursively until it returns
						ArraySortXT_Do(fArray1, fArray2, fArray3, fArray4, iFirstNonePos + 1)
						return true
					else
						i += 1
					endif
				else
					i += 1
				endif
			endif
		endif
	endWhile
	
	return false

endFunction

function ShowWEARMessage(string sMyType)

	if _DE_Setting_WEARMsg.GetValueInt() == 2 && PlayerRef.GetSitState() != 4 && PlayerRef.GetSleepState() != 4
	
		if sMyType == "cloak"
			_DE_WearCloak.Show()
		elseif sMyType == "body full"
			_DE_WearBodyFull.Show()
		elseif sMyType == "body standard"
			_DE_WearBodyStandard.Show()
		elseif sMyType == "body limited"
			_DE_WearBodyLimited.Show()
		elseif sMyType == "hands full"
			_DE_WearHandsFull.Show()
		elseif sMyType == "hands standard"
			_DE_WearHandsStandard.Show()
		elseif sMyType == "hands limited"
			_DE_WearHandsLimited.Show()
		elseif sMyType == "head full"
			_DE_WearHeadFull.Show()
		elseif sMyType == "head standard"
			_DE_WearHeadStandard.Show()
		elseif sMyType == "head limited"
			_DE_WearHeadLimited.Show()
		elseif sMyType == "feet full"
			_DE_WearFeetFull.Show()
		elseif sMyType == "feet standard"
			_DE_WearFeetStandard.Show()
		elseif sMyType == "feet limited"
			_DE_WearFeetLimited.Show()
		endif
	endif

endFunction

bool function GetUsesMainBodySlot(Form akBaseObject)
	;Requires SKSE
	;Checks if akArmor uses one of the main gear slots for the body (30-39,41-43)
	;Returns True on slots 40 and 46 as well for cloak support
	if akBaseObject == None
		return false
	endif
	if akBaseObject as Ammo
		;trace("[Frostfall] This equipment is ammo.")
		return true
	endif
	if _DE_Backpacks.HasForm(akBaseObject)
		;trace("[Frostfall] This equipment is a backpack.")
		return true
	endif
	if akBaseObject as Armor
		Armor akArmor = akBaseObject as Armor
		int mySlotMask = akArmor.GetSlotMask()
		if LogicalAnd(mySlotMask, akArmor.kSlotMask61)
			FrostfallDebug(5, "This equipment has slot kSlotMask61, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask60)
			FrostfallDebug(5, "This equipment has slot kSlotMask60, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask59)
			FrostfallDebug(5, "This equipment has slot kSlotMask59, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask58)
			FrostfallDebug(5, "This equipment has slot kSlotMask58, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask57)
			FrostfallDebug(5, "This equipment has slot kSlotMask57, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask56)
			FrostfallDebug(5, "This equipment has slot kSlotMask56, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask55)
			FrostfallDebug(5, "This equipment has slot kSlotMask55, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask54)
			FrostfallDebug(5, "This equipment has slot kSlotMask54, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask53)
			FrostfallDebug(5, "This equipment has slot kSlotMask53, which is NOT valid armor, returning false!")
			return false
		;elseif LogicalAnd(mySlotMask, akArmor.kSlotMask52)
		;	FrostfallDebug(5, "This equipment has slot kSlotMask52, which is NOT valid armor, returning false!")
		;	return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask51)
			FrostfallDebug(5, "This equipment has slot kSlotMask51, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask50)
			FrostfallDebug(5, "This equipment has slot kSlotMask50, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask49)
			FrostfallDebug(5, "This equipment has slot kSlotMask49, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask48)
			FrostfallDebug(5, "This equipment has slot kSlotMask48, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask47)
			FrostfallDebug(5, "This equipment has slot kSlotMask47, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask46)
			FrostfallDebug(5, "This equipment has slot kSlotMask46, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask45)
			FrostfallDebug(5, "This equipment has slot kSlotMask45, which is NOT valid armor, returning false!")
			return false
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask44)
			FrostfallDebug(5, "This equipment has slot kSlotMask44, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask43)
			FrostfallDebug(5, "This equipment has slot kSlotMask43, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask42)
			FrostfallDebug(5, "This equipment has slot kSlotMask42, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask41)
			FrostfallDebug(5, "This equipment has slot kSlotMask41, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask40)
			FrostfallDebug(5, "This equipment has slot kSlotMask40, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask39)
			FrostfallDebug(5, "This equipment has slot kSlotMask39, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask38)
			FrostfallDebug(5, "This equipment has slot kSlotMask38, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask37)
			FrostfallDebug(5, "This equipment has slot kSlotMask37, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask36)
			FrostfallDebug(5, "This equipment has slot kSlotMask36, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask35)
			FrostfallDebug(5, "This equipment has slot kSlotMask35, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask34)
			FrostfallDebug(5, "This equipment has slot kSlotMask34, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask33)
			FrostfallDebug(5, "This equipment has slot kSlotMask33, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask32)
			FrostfallDebug(5, "This equipment has slot kSlotMask32, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask31)
			FrostfallDebug(5, "This equipment has slot kSlotMask31, which is valid armor.")
			return true
		elseif LogicalAnd(mySlotMask, akArmor.kSlotMask30)
			FrostfallDebug(5, "This equipment has slot kSlotMask30, which is valid armor.")
			return true
		else
			FrostfallDebug(5, "I don't know what happened, returning true anyway.")
			return True
		endif
	else
		return false
	endif
endFunction

;DEPRECATED PROPERTIES
GlobalVariable property _DE_Setting_Armor auto

function FrostfallDebug(int iClassification, string sDebugMessage)
	;1 = Primary exposure system messages.
	;2 = Quest state data
	;3 = Misc info
	;4 = Weather-related
	;5 = Armor
	if _DE_EPDebug.GetValueInt() == iClassification
		trace("[Frostfall] " + sDebugMessage)
	endif
endFunction