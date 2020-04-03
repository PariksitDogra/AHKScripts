#NoEnv
#Warn  
#Include, RandomBezier.ahk 
SendMode Input  
SetWorkingDir %A_ScriptDir%  
CoordMode, Mouse, Client 
CoordMode, Pixel, Client

Random, sleepTimer, 200, 350
1::
;Move Mouse to Compass
	RandomBezier(316,204,564,44,"T1000 OT15 OB15 OL15 OR15 P3-4")
	Sleep sleepTimer
	Click
	Sleep sleepTimer
	Send {Up down}  ; Press down the up-arrow key.
	Sleep 3000  ; Keep it down for one second.
	Send {Up up}  ; Release the up-arrow key.
	Sleep sleepTimer
	RandomBezier(564,44,260,211,"T1000 OT5 OB5 OL5 OR5 P3-4") ;open bank
	Sleep sleepTimer
	Click ;click bank
	Sleep sleepTimer
	RandomBezier(262,216,307,228,"T1000 OT30 OB30 OL30 OR30 P3-4")
	Sleep sleepTimer
	RandomBezier(307,228,138,231,"T1000 OT15 OB15 OL15 OR15 P3-4") ;withdraw bars

loop {
	Sleep sleepTimer
	Click
	Sleep sleepTimer
	RandomBezier(138,231,489,48,"T1000 OT10 OB10 OL10 OR10 P3-4") ;close bank
	Sleep sleepTimer
	Click
	Sleep sleepTimer
	RandomBezier(486,49,490,117,"T1000 OT2 OB2 OL2 OR2 P3-4") ;click on the furnace
	Sleep sleepTimer
	Click
	Sleep 6000
	RandomBezier(466,123,65,129,"T1000 OT5 OB5 OL5 OR5 P3-4") ;click rings
	Sleep 300
	Click
	Sleep 60000
	RandomBezier(65,131,66,283,"T1000 OT5 OB5 OL5 OR5 P3-4") ;click bank
	Sleep sleepTimer
	Click 
	Sleep 6000
	RandomBezier(66,283,447,339,"T1000 OT10 OB10 OL10 OR10 P3-4") ;deposits 
	Sleep sleepTimer
	Click
	RandomBezier(447,339,138,231,"T1000 OT10 OB10 OL10 OR10 P3-4") ;withdraws
}
2::Reload

3::ExitApp