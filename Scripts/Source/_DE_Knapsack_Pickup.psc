Scriptname _DE_Knapsack_Pickup extends ObjectReference  

Message Property _DE_Knapsack_Pickup_menu auto
MiscObject Property Knapsack_MISC auto
Actor property holder auto
Event OnActivate(ObjectReference akActionRef)
		if (!Utility.IsInMenuMode())
 			Int iButton =_DE_Knapsack_Pickup_menu.Show()
				If (iButton == 0)
					holder.AddItem( Knapsack_MISC, 1)
					self.Disable()
				ElseIf (iButton == 1)
					debug.notification("You leave the Knapsack")
				EndIf
		endIf
EndEvent