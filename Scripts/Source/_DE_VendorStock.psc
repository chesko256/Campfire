scriptname _DE_VendorStock extends Quest

import utility

book property _DE_SpellTomeSoothe1 auto
book property _DE_SurvivorsGuide auto
armor property _DE_Cloak_BasicBurlap auto
armor property _DE_Cloak_BasicLinen auto
MiscObject property _DE_CampTent2_LeatherSmall1BR_MISC auto
MiscObject property _DE_CampTentLeatherLarge_1BR auto
MiscObject property _DE_CampTent2_HideSmall_MISC auto
MiscObject property _DE_CampTentHideLarge_1BR auto
MiscObject property _DE_CampCookingPot_MISC auto
Potion property _DE_WaterPotion auto
armor property _DE_Backpack_Brown auto
armor property _DE_Backpack_Black auto
armor property _DE_Backpack_White auto

MiscObject property _DE_Alchemy_MortarPestleMISC auto

ReferenceAlias property WhitePhialChestAlias auto
ReferenceAlias property AngelineAromaticsChestAlias auto
ReferenceAlias property ThaumaturgistsHutChestAlias auto
ReferenceAlias property MortarAndPestleChestAlias auto
ReferenceAlias property HagsCureChestAlias auto
ReferenceAlias property ElgrimsElixersChestAlias auto
ReferenceAlias property ArcadiasCauldronChestAlias auto
ReferenceAlias property RiverwoodTraderChestAlias auto
ReferenceAlias property CaravanAChestAlias auto
ReferenceAlias property CaravanBChestAlias auto
ReferenceAlias property CaravanCChestAlias auto
ReferenceAlias property AvalAtheronChestAlias auto
ReferenceAlias property BethethorsChestAlias auto
ReferenceAlias property BirnaChestAlias auto
ReferenceAlias property BrandChestAlias auto
ReferenceAlias property PawnedPrawnChestAlias auto
ReferenceAlias property SolitudeBitsAndPiecesChestAlias auto
ReferenceAlias property ArnleifChestAlias auto
ReferenceAlias property GrayPineGoodsChestAlias auto
ReferenceAlias property NiranyeChestAlias auto

ObjectReference property MerchantWindhelmWhitePhialChestRef auto			;Must be manually selected
ObjectReference property MerchantSolitudeAngelinesAromaticsRef auto			;Must be manually selected
ObjectReference property MerchantMorthalLamisChestRef auto					;Must be manually selected
ObjectReference property MerchantDawnstarMortarPestleChestRef auto			;Must be manually selected
ObjectReference property MerchantMarkarthHagsCureChestRef auto				;Must be manually selected
ObjectReference property MerchantRiftenElgrimsElixtersChest auto			;Must be manually selected
ObjectReference property WhiterunArcadiasCauldronChestRef auto
ObjectReference property RiverwoodTraderMerchantContainer auto
ObjectReference property CaravanAChestREF auto
ObjectReference property CaravanBChestREF auto
ObjectReference property CaravanCChestREF auto
ObjectReference property AvalAtheronChest auto
ObjectReference property BethethorsMerchantChestRef auto
ObjectReference property BirnaChest auto
ObjectReference property BrandChest auto
ObjectReference property PawnedPrawnChest auto
ObjectReference property MerchantSolitudeBitsAndPiecesChestRef auto
ObjectReference property ArnleifChest auto
ObjectReference property GrayPineGoodsChest auto
ObjectReference property NiranyeChest auto

Event OnInit()
	
	;Stock lantern items
	FillAllAliases()
	wait(3.0)
	ClearAllAliases()
	RemoveAllModItems()
	FillAllAliases()
	
	RegisterForSingleUpdateGameTime(24)
	
endEvent

Event OnUpdateGameTime()

	;Clear the alias
	ClearAllAliases()
	
	;Remove any items found in any of the chests listed
	RemoveAllModItems()
	
	;Re-fill the alias
	FillAllAliases()
	
	RegisterForSingleUpdateGameTime(24)
	
endEvent

Function ClearAllAliases()

	;Clear all merchant chest aliases
	WhitePhialChestAlias.Clear()
	AngelineAromaticsChestAlias.Clear()
	ThaumaturgistsHutChestAlias.Clear()
	MortarAndPestleChestAlias.Clear()
	HagsCureChestAlias.Clear()
	ElgrimsElixersChestAlias.Clear()
	ArcadiasCauldronChestAlias.Clear()
	RiverwoodTraderChestAlias.Clear()
	CaravanAChestAlias.Clear()
	CaravanBChestAlias.Clear()
	CaravanCChestAlias.Clear()
	AvalAtheronChestAlias.Clear()
	BethethorsChestAlias.Clear()
	BirnaChestAlias.Clear()
	BrandChestAlias.Clear()
	PawnedPrawnChestAlias.Clear()
	SolitudeBitsAndPiecesChestAlias.Clear()
	ArnleifChestAlias.Clear()
	GrayPineGoodsChestAlias.Clear()
	NiranyeChestAlias.Clear()
	
endFunction

Function FillAllAliases()

	;Fill aliases to apply their inventories
	WhitePhialChestAlias.ForceRefIfEmpty(MerchantWindhelmWhitePhialChestRef)
	AngelineAromaticsChestAlias.ForceRefIfEmpty(MerchantSolitudeAngelinesAromaticsRef)
	ThaumaturgistsHutChestAlias.ForceRefIfEmpty(MerchantMorthalLamisChestRef)
	MortarAndPestleChestAlias.ForceRefIfEmpty(MerchantDawnstarMortarPestleChestRef)
	HagsCureChestAlias.ForceRefIfEmpty(MerchantMarkarthHagsCureChestRef)
	ElgrimsElixersChestAlias.ForceRefIfEmpty(MerchantRiftenElgrimsElixtersChest)
	ArcadiasCauldronChestAlias.ForceRefIfEmpty(WhiterunArcadiasCauldronChestRef)
	RiverwoodTraderChestAlias.ForceRefIfEmpty(RiverwoodTraderMerchantContainer)
	CaravanAChestAlias.ForceRefIfEmpty(CaravanAChestREF)
	CaravanBChestAlias.ForceRefIfEmpty(CaravanBChestREF)
	CaravanCChestAlias.ForceRefIfEmpty(CaravanCChestREF)
	AvalAtheronChestAlias.ForceRefIfEmpty(AvalAtheronChest)
	BethethorsChestAlias.ForceRefIfEmpty(BethethorsMerchantChestRef)
	BirnaChestAlias.ForceRefIfEmpty(BirnaChest)
	BrandChestAlias.ForceRefIfEmpty(BrandChest)
	PawnedPrawnChestAlias.ForceRefIfEmpty(PawnedPrawnChest)
	SolitudeBitsAndPiecesChestAlias.ForceRefIfEmpty(MerchantSolitudeBitsAndPiecesChestRef)
	ArnleifChestAlias.ForceRefIfEmpty(ArnleifChest)
	GrayPineGoodsChestAlias.ForceRefIfEmpty(GrayPineGoodsChest)
	NiranyeChestAlias.ForceRefIfEmpty(NiranyeChest)
endFunction

function RemoveAllModItems()

	;Apothecaries
	RemoveItemFromVendor(_DE_Alchemy_MortarPestleMISC, MerchantWindhelmWhitePhialChestRef)
	RemoveItemFromVendor(_DE_Alchemy_MortarPestleMISC, MerchantSolitudeAngelinesAromaticsRef)
	RemoveItemFromVendor(_DE_Alchemy_MortarPestleMISC, MerchantMorthalLamisChestRef)
	RemoveItemFromVendor(_DE_Alchemy_MortarPestleMISC, MerchantDawnstarMortarPestleChestRef)
	RemoveItemFromVendor(_DE_Alchemy_MortarPestleMISC, MerchantMarkarthHagsCureChestRef)
	RemoveItemFromVendor(_DE_Alchemy_MortarPestleMISC, MerchantRiftenElgrimsElixtersChest)
	RemoveItemFromVendor(_DE_Alchemy_MortarPestleMISC, WhiterunArcadiasCauldronChestRef)

	;General Goods
	RemoveItemFromVendor(_DE_SpellTomeSoothe1, RiverwoodTraderMerchantContainer)
	RemoveItemFromVendor(_DE_Cloak_BasicBurlap, RiverwoodTraderMerchantContainer)
	RemoveItemFromVendor(_DE_CampTent2_LeatherSmall1BR_MISC, RiverwoodTraderMerchantContainer)
	RemoveItemFromVendor(_DE_CampCookingPot_MISC, RiverwoodTraderMerchantContainer)
	RemoveItemFromVendor(_DE_Backpack_Brown, RiverwoodTraderMerchantContainer)

	RemoveItemFromVendor(_DE_Cloak_BasicBurlap, CaravanAChestREF)
	RemoveItemFromVendor(_DE_CampTent2_HideSmall_MISC, CaravanAChestREF)
	RemoveItemFromVendor(_DE_CampCookingPot_MISC, CaravanAChestREF)
	RemoveItemFromVendor(_DE_Backpack_Brown, CaravanAChestREF)

	RemoveItemFromVendor(_DE_Cloak_BasicBurlap, CaravanBChestREF)
	RemoveItemFromVendor(_DE_CampTent2_HideSmall_MISC, CaravanBChestREF)
	RemoveItemFromVendor(_DE_CampCookingPot_MISC, CaravanBChestREF)
	RemoveItemFromVendor(_DE_Backpack_Brown, CaravanBChestREF)

	RemoveItemFromVendor(_DE_Cloak_BasicBurlap, CaravanCChestREF)
	RemoveItemFromVendor(_DE_CampTent2_HideSmall_MISC, CaravanCChestREF)
	RemoveItemFromVendor(_DE_CampCookingPot_MISC, CaravanCChestREF)
	RemoveItemFromVendor(_DE_Backpack_Brown, CaravanCChestREF)

	RemoveItemFromVendor(_DE_WaterPotion, AvalAtheronChest)
	RemoveItemFromVendor(_DE_Cloak_BasicBurlap, AvalAtheronChest)
	RemoveItemFromVendor(_DE_CampCookingPot_MISC, AvalAtheronChest)
	RemoveItemFromVendor(_DE_Backpack_Black, AvalAtheronChest)

	RemoveItemFromVendor(_DE_Cloak_BasicLinen, BethethorsMerchantChestRef)
	RemoveItemFromVendor(_DE_CampTent2_LeatherSmall1BR_MISC, BethethorsMerchantChestRef)
	RemoveItemFromVendor(_DE_CampTentLeatherLarge_1BR, BethethorsMerchantChestRef)
	RemoveItemFromVendor(_DE_CampCookingPot_MISC, BethethorsMerchantChestRef)
	RemoveItemFromVendor(_DE_Backpack_Brown, BethethorsMerchantChestRef)

	RemoveItemFromVendor(_DE_WaterPotion, BirnaChest)
	RemoveItemFromVendor(_DE_Cloak_BasicLinen, BirnaChest)
	RemoveItemFromVendor(_DE_CampTent2_HideSmall_MISC, BirnaChest)
	RemoveItemFromVendor(_DE_CampTentHideLarge_1BR, BirnaChest)
	RemoveItemFromVendor(_DE_CampCookingPot_MISC, BirnaChest)
	RemoveItemFromVendor(_DE_Backpack_White, BirnaChest)
	RemoveItemFromVendor(_DE_SurvivorsGuide, BirnaChest)

	RemoveItemFromVendor(_DE_Cloak_BasicBurlap, PawnedPrawnChest)
	RemoveItemFromVendor(_DE_CampTent2_LeatherSmall1BR_MISC, PawnedPrawnChest)
	RemoveItemFromVendor(_DE_CampCookingPot_MISC, PawnedPrawnChest)
	RemoveItemFromVendor(_DE_Backpack_Brown, PawnedPrawnChest)
	
	RemoveItemFromVendor(_DE_Cloak_BasicLinen, MerchantSolitudeBitsAndPiecesChestRef)
	RemoveItemFromVendor(_DE_CampTent2_LeatherSmall1BR_MISC, MerchantSolitudeBitsAndPiecesChestRef)
	RemoveItemFromVendor(_DE_CampTentLeatherLarge_1BR, MerchantSolitudeBitsAndPiecesChestRef)
	RemoveItemFromVendor(_DE_CampCookingPot_MISC, MerchantSolitudeBitsAndPiecesChestRef)
	RemoveItemFromVendor(_DE_Backpack_Brown, MerchantSolitudeBitsAndPiecesChestRef)

	RemoveItemFromVendor(_DE_Cloak_BasicBurlap, ArnleifChest)
	RemoveItemFromVendor(_DE_CampTent2_LeatherSmall1BR_MISC, ArnleifChest)
	RemoveItemFromVendor(_DE_CampCookingPot_MISC, ArnleifChest)
	RemoveItemFromVendor(_DE_Backpack_Brown, ArnleifChest)

	RemoveItemFromVendor(_DE_Cloak_BasicBurlap, GrayPineGoodsChest)
	RemoveItemFromVendor(_DE_CampTent2_LeatherSmall1BR_MISC, GrayPineGoodsChest)
	RemoveItemFromVendor(_DE_CampCookingPot_MISC, GrayPineGoodsChest)
	RemoveItemFromVendor(_DE_Backpack_Brown, GrayPineGoodsChest)
	RemoveItemFromVendor(_DE_SurvivorsGuide, GrayPineGoodsChest)

	RemoveItemFromVendor(_DE_WaterPotion, NiranyeChest)
	RemoveItemFromVendor(_DE_Cloak_BasicBurlap, NiranyeChest)
	RemoveItemFromVendor(_DE_CampTent2_HideSmall_MISC, NiranyeChest)
	RemoveItemFromVendor(_DE_CampCookingPot_MISC, NiranyeChest)
	RemoveItemFromVendor(_DE_Backpack_Brown, NiranyeChest)

	RemoveItemFromVendor(_DE_Cloak_BasicBurlap, BrandChest)
	RemoveItemFromVendor(_DE_CampCookingPot_MISC, BrandChest)

endFunction

function RemoveItemFromVendor(Form akItem, ObjectReference akContainer)
	if akContainer.GetItemCount(akItem) > 0
		akContainer.RemoveItem(akItem, akContainer.GetItemCount(akItem))
	endif
endFunction