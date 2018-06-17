Scriptname MTQ_Meter Extends BetterVampiresBloodMeterWidget

Import Debug

String Function GetWidgetSource()

	Return "MeterTest/meter.swf"
	
EndFunction

String Function CheckConnection()
		
	Debug.Notification("Connection established")
	
EndFunction