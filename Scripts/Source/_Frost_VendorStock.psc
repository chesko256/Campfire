scriptname _Frost_VendorStock extends Quest

import utility

book property _Frost_SpellTomeSoothe1 auto
book property _Frost_SurvivorsGuide auto
Potion property _Frost_WaterPotion auto

ReferenceAlias property RiverwoodTraderChestAlias auto
ReferenceAlias property AvalAtheronChestAlias auto
ReferenceAlias property BirnaChestAlias auto
ReferenceAlias property GrayPineGoodsChestAlias auto
ReferenceAlias property NiranyeChestAlias auto

ObjectReference property RiverwoodTraderMerchantContainer auto
ObjectReference property AvalAtheronChest auto
ObjectReference property BirnaChest auto
ObjectReference property GrayPineGoodsChest auto
ObjectReference property NiranyeChest auto

Event OnInit()
	FillAllAliases()
	wait(3.0)
	ClearAllAliases()
	RemoveAllModItems()
	FillAllAliases()
	RegisterForSingleUpdateGameTime(24)
endEvent

Event OnUpdateGameTime()
	ClearAllAliases()
	
	; Remove any items found in any of the chests listed
	RemoveAllModItems()

	FillAllAliases()
	
	RegisterForSingleUpdateGameTime(24)
endEvent

Function ClearAllAliases()
	; Clear all merchant chest aliases
	RiverwoodTraderChestAlias.Clear()
	AvalAtheronChestAlias.Clear()
	BirnaChestAlias.Clear()
	GrayPineGoodsChestAlias.Clear()
	NiranyeChestAlias.Clear()
	
endFunction

Function FillAllAliases()
	;Fill aliases to apply their inventories
	RiverwoodTraderChestAlias.ForceRefIfEmpty(RiverwoodTraderMerchantContainer)
	AvalAtheronChestAlias.ForceRefIfEmpty(AvalAtheronChest)
	BirnaChestAlias.ForceRefIfEmpty(BirnaChest)
	GrayPineGoodsChestAlias.ForceRefIfEmpty(GrayPineGoodsChest)
	NiranyeChestAlias.ForceRefIfEmpty(NiranyeChest)
endFunction

function RemoveAllModItems()
	;General Goods
	RemoveItemFromVendor(_Frost_SpellTomeSoothe1, RiverwoodTraderMerchantContainer)

	RemoveItemFromVendor(_Frost_WaterPotion, AvalAtheronChest)

	RemoveItemFromVendor(_Frost_WaterPotion, BirnaChest)
	RemoveItemFromVendor(_Frost_SurvivorsGuide, BirnaChest)

	RemoveItemFromVendor(_Frost_SurvivorsGuide, GrayPineGoodsChest)

	RemoveItemFromVendor(_Frost_WaterPotion, NiranyeChest)
endFunction

function RemoveItemFromVendor(Form akItem, ObjectReference akContainer)
	if akContainer.GetItemCount(akItem) > 0
		akContainer.RemoveItem(akItem, akContainer.GetItemCount(akItem))
	endif
endFunction