scriptname _Camp_VendorStock extends Quest

import utility

armor property _Camp_Cloak_BasicBurlap auto
armor property _Camp_Cloak_BasicLinen auto
MiscObject property _Camp_Tent_LeatherSmall1BR_MISC auto
MiscObject property _Camp_Tent_LeatherLarge1BR_MISC auto
MiscObject property _Camp_Tent_FurSmall1BR_MISC auto
MiscObject property _Camp_Tent_FurLarge1BR_MISC auto
MiscObject property _Camp_CookingPot_MISC auto
armor property _Camp_Backpack_Brown auto
armor property _Camp_Backpack_Black auto
armor property _Camp_Backpack_White auto

MiscObject property _Camp_Alchemy_MortarPestleMISC auto

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
	
	;Stock items
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
	RemoveItemFromVendor(_Camp_Alchemy_MortarPestleMISC, MerchantWindhelmWhitePhialChestRef)
	RemoveItemFromVendor(_Camp_Alchemy_MortarPestleMISC, MerchantSolitudeAngelinesAromaticsRef)
	RemoveItemFromVendor(_Camp_Alchemy_MortarPestleMISC, MerchantMorthalLamisChestRef)
	RemoveItemFromVendor(_Camp_Alchemy_MortarPestleMISC, MerchantDawnstarMortarPestleChestRef)
	RemoveItemFromVendor(_Camp_Alchemy_MortarPestleMISC, MerchantMarkarthHagsCureChestRef)
	RemoveItemFromVendor(_Camp_Alchemy_MortarPestleMISC, MerchantRiftenElgrimsElixtersChest)
	RemoveItemFromVendor(_Camp_Alchemy_MortarPestleMISC, WhiterunArcadiasCauldronChestRef)

	;General Goods
	RemoveItemFromVendor(_Camp_Cloak_BasicBurlap, RiverwoodTraderMerchantContainer)
	RemoveItemFromVendor(_Camp_Tent_LeatherSmall1BR_MISC, RiverwoodTraderMerchantContainer)
	RemoveItemFromVendor(_Camp_CookingPot_MISC, RiverwoodTraderMerchantContainer)
	RemoveItemFromVendor(_Camp_Backpack_Brown, RiverwoodTraderMerchantContainer)

	RemoveItemFromVendor(_Camp_Cloak_BasicBurlap, CaravanAChestREF)
	RemoveItemFromVendor(_Camp_Tent_FurSmall1BR_MISC, CaravanAChestREF)
	RemoveItemFromVendor(_Camp_CookingPot_MISC, CaravanAChestREF)
	RemoveItemFromVendor(_Camp_Backpack_Brown, CaravanAChestREF)

	RemoveItemFromVendor(_Camp_Cloak_BasicBurlap, CaravanBChestREF)
	RemoveItemFromVendor(_Camp_Tent_FurSmall1BR_MISC, CaravanBChestREF)
	RemoveItemFromVendor(_Camp_CookingPot_MISC, CaravanBChestREF)
	RemoveItemFromVendor(_Camp_Backpack_Brown, CaravanBChestREF)

	RemoveItemFromVendor(_Camp_Cloak_BasicBurlap, CaravanCChestREF)
	RemoveItemFromVendor(_Camp_Tent_FurSmall1BR_MISC, CaravanCChestREF)
	RemoveItemFromVendor(_Camp_CookingPot_MISC, CaravanCChestREF)
	RemoveItemFromVendor(_Camp_Backpack_Brown, CaravanCChestREF)

	RemoveItemFromVendor(_Camp_Cloak_BasicBurlap, AvalAtheronChest)
	RemoveItemFromVendor(_Camp_CookingPot_MISC, AvalAtheronChest)
	RemoveItemFromVendor(_Camp_Backpack_Black, AvalAtheronChest)

	RemoveItemFromVendor(_Camp_Cloak_BasicLinen, BethethorsMerchantChestRef)
	RemoveItemFromVendor(_Camp_Tent_LeatherSmall1BR_MISC, BethethorsMerchantChestRef)
	RemoveItemFromVendor(_Camp_Tent_LeatherLarge1BR_MISC, BethethorsMerchantChestRef)
	RemoveItemFromVendor(_Camp_CookingPot_MISC, BethethorsMerchantChestRef)
	RemoveItemFromVendor(_Camp_Backpack_Brown, BethethorsMerchantChestRef)

	RemoveItemFromVendor(_Camp_Cloak_BasicLinen, BirnaChest)
	RemoveItemFromVendor(_Camp_Tent_FurSmall1BR_MISC, BirnaChest)
	RemoveItemFromVendor(_Camp_Tent_FurLarge1BR_MISC, BirnaChest)
	RemoveItemFromVendor(_Camp_CookingPot_MISC, BirnaChest)
	RemoveItemFromVendor(_Camp_Backpack_White, BirnaChest)

	RemoveItemFromVendor(_Camp_Cloak_BasicBurlap, PawnedPrawnChest)
	RemoveItemFromVendor(_Camp_Tent_LeatherSmall1BR_MISC, PawnedPrawnChest)
	RemoveItemFromVendor(_Camp_CookingPot_MISC, PawnedPrawnChest)
	RemoveItemFromVendor(_Camp_Backpack_Brown, PawnedPrawnChest)
	
	RemoveItemFromVendor(_Camp_Cloak_BasicLinen, MerchantSolitudeBitsAndPiecesChestRef)
	RemoveItemFromVendor(_Camp_Tent_LeatherSmall1BR_MISC, MerchantSolitudeBitsAndPiecesChestRef)
	RemoveItemFromVendor(_Camp_Tent_LeatherLarge1BR_MISC, MerchantSolitudeBitsAndPiecesChestRef)
	RemoveItemFromVendor(_Camp_CookingPot_MISC, MerchantSolitudeBitsAndPiecesChestRef)
	RemoveItemFromVendor(_Camp_Backpack_Brown, MerchantSolitudeBitsAndPiecesChestRef)

	RemoveItemFromVendor(_Camp_Cloak_BasicBurlap, ArnleifChest)
	RemoveItemFromVendor(_Camp_Tent_LeatherSmall1BR_MISC, ArnleifChest)
	RemoveItemFromVendor(_Camp_CookingPot_MISC, ArnleifChest)
	RemoveItemFromVendor(_Camp_Backpack_Brown, ArnleifChest)

	RemoveItemFromVendor(_Camp_Cloak_BasicBurlap, GrayPineGoodsChest)
	RemoveItemFromVendor(_Camp_Tent_LeatherSmall1BR_MISC, GrayPineGoodsChest)
	RemoveItemFromVendor(_Camp_CookingPot_MISC, GrayPineGoodsChest)
	RemoveItemFromVendor(_Camp_Backpack_Brown, GrayPineGoodsChest)

	RemoveItemFromVendor(_Camp_Cloak_BasicBurlap, NiranyeChest)
	RemoveItemFromVendor(_Camp_Tent_FurSmall1BR_MISC, NiranyeChest)
	RemoveItemFromVendor(_Camp_CookingPot_MISC, NiranyeChest)
	RemoveItemFromVendor(_Camp_Backpack_Brown, NiranyeChest)

	RemoveItemFromVendor(_Camp_Cloak_BasicBurlap, BrandChest)
	RemoveItemFromVendor(_Camp_CookingPot_MISC, BrandChest)

endFunction

function RemoveItemFromVendor(Form akItem, ObjectReference akContainer)
	if akContainer.GetItemCount(akItem) > 0
		akContainer.RemoveItem(akItem, akContainer.GetItemCount(akItem))
	endif
endFunction
