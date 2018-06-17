Scriptname MTQ_MeterUpdate extends Quest

import Debug
; -------------------------------------------------------------------------------------------------
; VARIABLES ---------------------------------------------------------------------------------------


MTQ_Meter property ExposureMeter auto
GlobalVariable Property VampireBloodPoints Auto
GlobalVariable Property VampireDynamicStages Auto
GlobalVariable property BetterVampiresBloodMeterDisplay_Contextual auto
GlobalVariable property BetterVampiresBloodMeter_Opacity auto
GlobalVariable Property BetterVampiresBloodMeterScale Auto
GlobalVariable property BetterVampiresBloodMeterX auto
GlobalVariable property BetterVampiresBloodMeterY auto
GlobalVariable property BetterVampiresBloodMeterDisplayTime auto
 
float fLastBloodPointValue
int iDisplayIterationsRemaining


; -------------------------------------------------------------------------------------------------
; EVENTS ------------------------------------------------------------------------------------------


Event OnInit()

	Debug.Notification("Meter Initialized")
	ExposureMeter.HAnchor = "left"
	ExposureMeter.VAnchor = "bottom"
	ExposureMeter.X = BetterVampiresBloodMeterX.GetValue() ; Default is 67
	ExposureMeter.Y = BetterVampiresBloodMeterY.GetValue() ; Default is 640
	
	StartUpdating()
	
endEvent


Event OnGameReload()

	StartUpdating()
	
endEvent


function StartUpdating()

	RegisterForSingleUpdate(2)
	
endFunction


Event OnUpdate()
	
	ExposureMeter.Alpha = 100.0
	UpdateMeter()
	RegisterForSingleUpdate(2)
	
endEvent


; -------------------------------------------------------------------------------------------------
; FUNCTIONS ---------------------------------------------------------------------------------------


function UpdateMeter(bool bSkipDisplayHandling = false)

	
	Debug.Notification("Update happened")
	;ExposureMeter.CheckConnection()
	float fThisBloodPointValue = VampireBloodPoints.GetValue()
	
	UpdateBlood(fThisBloodPointValue, bSkipDisplayHandling)
		
	fLastBloodPointValue = fThisBloodPointValue


endFunction


function UpdateBlood(float fThisBloodPointValue, bool bSkipDisplayHandling = false)
	
	Debug.Notification("Blood gets updated")
	ContextualDisplay(fThisBloodPointValue)

	ExposureMeter.HAnchor = "left" 
	ExposureMeter.VAnchor = "bottom" 
	ExposureMeter.X = BetterVampiresBloodMeterX.GetValue() ; Default is 67
	ExposureMeter.Y = BetterVampiresBloodMeterY.GetValue() ; Default is 640
	Exposuremeter.Height = ((BetterVampiresBloodMeterScale.GetValue()/100)*25.2) ; Default Scale is 100 with Height of 25.2
	Exposuremeter.Width = ((BetterVampiresBloodMeterScale.GetValue()/100)*292.8) ; Default Scale is 100 with Width of 292.8
	
	fThisBloodPointValue = VampireBloodPoints.GetValue()
	ExposureMeter.SetPercent((fThisBloodPointValue) / 100.0)


	Int _primaryColor = 4259840
	
	_primaryColor	= 6553600
	
	
	ExposureMeter.SetColors(_primaryColor, 3276800)
	
endFunction


function ContextualDisplay(float fThisBloodPointValue, bool bSkipDisplayHandling = false)

	if bSkipDisplayHandling
		iDisplayIterationsRemaining = BetterVampiresBloodMeterDisplayTime.GetValueInt()
		return
	endif

endFunction
