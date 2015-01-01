scriptname _DE_BookActivatorScript extends ObjectReference

ReferenceAlias property Alias_DE_Book Auto
ObjectReference property _DE_BookREF auto
message property _DE_BookMenu_FirstTime auto
message property _DE_BookMenu_FirstTime1 auto
message property _DE_BookMenu_FirstTime2 auto
message property _DE_BookMenu_FirstTime3 auto
quest property _DE_Main_1_6 auto
_DE_EPMonitor_1_6 property pMainScript auto

;Object References
ObjectReference property _DE_BookBraidwoodInn auto
ObjectReference property _DE_BookCandlehearthHall auto
ObjectReference property _DE_BookNewGnisisCornerclub auto
ObjectReference property _DE_BookDeadMansDrink auto
ObjectReference property _DE_BookFourShieldsTavern auto
ObjectReference property _DE_BookWinkingSkeever auto
ObjectReference property _DE_BookMoorsideInn auto
ObjectReference property _DE_BookStumblingSabrecat auto
ObjectReference property _DE_BookWindpeakInn auto
ObjectReference property _DE_BookSilverbloodInn auto
ObjectReference property _DE_BookOldHroldanInn auto
ObjectReference property _DE_BookBeeandBarb auto
ObjectReference property _DE_BookVilemyrInn auto
ObjectReference property _DE_BookFrostFruitInn auto
ObjectReference property _DE_BookSleepingGiantInn1 auto
ObjectReference property _DE_BookSleepingGiantInn2 auto
ObjectReference property _DE_BookBanneredMare auto
ObjectReference property _DE_BookFrozenHearth auto
ObjectReference property _DE_BookDrunkenHuntsman auto

event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()	
		;Give the player the real book as a quest object
		
		
		if Game.GetPlayer().GetItemCount(_DE_BookREF) == 0
			;notification("I don't have the book!")
			Alias_DE_Book.ForceRefIfEmpty(_DE_BookREF)
			Game.GetPlayer().AddItem(_DE_BookREF, 1, true)
		else
			;notification("I have the book!")
		endif
		
		;display first time use menu (time it so that the book completely opens first)
		_DE_BookMenu_FirstTime.Show()
		_DE_BookMenu_FirstTime1.Show()
		
		;Activate the book so that the player starts the quest
		_DE_BookREF.Activate(Game.GetPlayer())
	
		;Disable all activators
		_DE_BookBraidwoodInn.Disable()
		_DE_BookCandlehearthHall.Disable()
		_DE_BookNewGnisisCornerclub.Disable()
		_DE_BookDeadMansDrink.Disable()
		_DE_BookFourShieldsTavern.Disable()
		_DE_BookWinkingSkeever.Disable()
		_DE_BookMoorsideInn.Disable()
		_DE_BookStumblingSabrecat.Disable()
		_DE_BookWindpeakInn.Disable()
		_DE_BookSilverbloodInn.Disable()
		_DE_BookOldHroldanInn.Disable()
		_DE_BookBeeandBarb.Disable()
		_DE_BookVilemyrInn.Disable()
		_DE_BookFrostFruitInn.Disable()
		_DE_BookSleepingGiantInn1.Disable()
		_DE_BookSleepingGiantInn2.Disable()
		_DE_BookBanneredMare.Disable()
		_DE_BookFrozenHearth.Disable()
		_DE_BookDrunkenHuntsman.Disable()
		
		;Set the flag on the new quest to go running
		if pMainScript.pSetting_IsRunning == false
			pMainScript.pSetting_IsRunning = true
		endif
		
		utility.wait(8)
		_DE_BookMenu_FirstTime2.Show()
		utility.wait(1)
		_DE_BookMenu_FirstTime3.Show()
		
	EndIf
EndEvent
