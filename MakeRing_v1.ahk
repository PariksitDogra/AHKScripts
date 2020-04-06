#NoEnv
#Warn  
#Include, RandomBezier.ahk 
SendMode Input  
SetWorkingDir %A_ScriptDir%  
CoordMode, Mouse, Client 
CoordMode, Pixel, Client

Random, sleepTimer, 200, 350
Random, buttonTimer, 3000, 4500
Random, mouseTimer, 1000, 2000
Random, furnaceWait, 5000, 6000
Random, bankTimer, 1000, 2000
Random, moveInX, -5, 5
Random, moveInY, -5, 5
Random, bigMoveX, -15, 15
Random, bigMoveY, -15, 15
Random, mediumMoveX, -10, 10
Random, mediumMoveY, -10, 10
Random, smallMove, -2, 2
Random, mouseMovingX, 44,465
Random, mouseMovingY, 111, 305
Random, makeRingTimer, 55000, 58000
1::
	inputbox, j, Script End, How long do you want the script to run (minutes)?
		j := j * 1000 * 60
		SetTimer, ForceExitApp, %j%
;Adjust Zoom
	CheckEnergy(){
		Random, sleepTimer1, 200, 350
		Random, mouseTimer1, 1000, 2000
		Random, moveInX1, -15, 15
		Random, moveInY1, -15, 15
		PixelSearch, bootColourX, bootColourY, 562,144,574,155, 0x8F6239, 5, RGB Fast
		if (ErrorLevel){
			;do nothing
		}
		else{
			PixelSearch, numberColourX, numberColourY, 534, 150, 554,162, 0x00FF00, 5, RGB Fast
			if (ErrorLevel){
				;do nothing
			}
			else{
				RandomBezier(0, 0, bootColourX+moveInX1, bootColourY+moveInY1,"T" mouseTimer1 "OT5 OB5 OL5 OR5 RO P3-4")
				Sleep sleepTimer1
				Click 
				Sleep sleepTimer1
			}
		}
	}
	PixelSearch, settingsx1, settingsy1, 5, 31, 783, 530, 0xFFBB6EE5, 5, RGB Fast ;Look for settings
	if (ErrorLevel){
		MsgBox, Settings cannot be found
		ExitApp
	}
	else {
		RandomBezier(0,0,settingsx1+bigMoveX,settingsy1+bigMoveY,"T" mouseTimer "OT10 OB10 OL10 OR10 RO P3-4") ;Move to settings
		Sleep sleepTimer
		Click ;Click on settings
		Sleep sleepTimer
	}
	PixelSearch, zoomx1, zoomy1, 5, 31, 783, 530, 0xFFEC7A82, 5, RGB Fast ;Find Zoom
	if (ErrorLevel){
		MsgBox, Zoom can not be found
		ExitApp
	}
	else {
		RandomBezier(0, 0 ,zoomx1+2,zoomy1,"T" mouseTimer "OT2 OB2 OL2 OR2 RO P3-4") ;move to zoom
		Sleep sleepTimer
		Click %zoomx1%, %zoomy1% ;click zoom
		Sleep sleepTimer
	}
	PixelSearch, backpackx1, backpacky1, 5, 31, 783, 530, 0xFF0013FF, 5, RGB Fast ;Find Backpack
	if (ErrorLevel){
		MsgBox, Backpack can not be found
		ExitApp
	}
	else {
		RandomBezier(zoomx1, zoomy1, backpackx1+bigMoveX, backpacky1+bigMoveY,"T" mouseTimer "OT5 OB5 OL5 OR5 P3-4") ;move to backpack
		Sleep sleepTimer
		Click ;click zoom
		Sleep sleepTimer
	}
;Move Mouse to Compass
	PixelSearch, compassx1, compassy1, 5, 31, 783, 530, 0xFFD3ECD3, 5, RGB Fast ;Locate Compass
	if (ErrorLevel){
		MsgBox, Compass can not be found
		ExitApp
	}
	else {
		RandomBezier(backpackx1,backpacky1,compassx1+mediumMoveX,compassy1+mediumMoveY,"T" mouseTimer "OT15 OB15 OL15 OR15 P3-4") ;Move to compass
		Sleep sleepTimer
		Click
		Sleep sleepTimer
	}
	Send {Up down}  ; Press down the up-arrow key.
	Sleep buttonTimer  ; Keep it down for a couple seconds.
	Send {Up up}  ; Release the up-arrow key.
	Sleep sleepTimer
	PixelSearch, bankx1, banky1, 5, 31, 536, 367, 0xFF307EBA, 5, RGB Fast ;Locate Bank
	if (ErrorLevel){
		MsgBox, Bank can not be found
		ExitApp
	}
	else {
		RandomBezier(compassx1, compassy1, bankx1+moveInX, banky1+moveInY,"T" mouseTimer "OT5 OB5 OL5 OR5 P3-4") ;open bank
		Sleep sleepTimer
		Click ;click bank
		Sleep sleepTimer
		RandomBezier(0, 0, mouseMovingX, mouseMovingY,"T" mouseTimer "OT15 OB15 OL15 OR15 RO P3-4") ;Random mouse movement
		Sleep sleepTimer
	}
	
loop {
	PixelSearch, matx1, maty1, 5, 31, 536, 367, 0xFFEABDE9, 5, RGB Fast ;Locate Material
	if (ErrorLevel){
		MsgBox, Mats can not be found
		ExitApp
	}
	else {
		RandomBezier(0, 0, matx1+bigMoveX,maty1+bigMoveY,"T" mouseTimer "OT10 OB10 OL10 OR10 RO P3-4") ;Withdraw mats
		Sleep sleepTimer
		Click
		Sleep sleepTimer
	}
	PixelSearch, closebankx1, closebanky1, 5, 31, 536, 367, 0xFFEEFBFF, 5, RGB Fast ;Locate close bank
	if (ErrorLevel){
		MsgBox, Close bank can not be found
		ExitApp
	}
	else {
		RandomBezier(matx1, maty1, closebankx1+mediumMoveX, closebanky1+mediumMoveY,"T" mouseTimer "OT10 OB10 OL10 OR10 P3-4") ;Move to close bank button
		Sleep sleepTimer
		Click ;close bank
		Sleep sleepTimer
		CheckEnergy()
		Sleep sleepTimer
	}
	PixelSearch, furnacex1, furnacey1, 5, 31, 536, 367, 0xFF64B299, 5, RGB Fast ;Locate furnace
	if (ErrorLevel){
		MsgBox, Furnace cannot be found
		ExitApp
	}
	else {
		RandomBezier(0, 0, furnacex1+mediumMoveX, furnacey1+smallMove,"T" mouseTimer "OT2 OB2 OL5 OR5 RO P3-4") ;Move to furnace
		Sleep sleepTimer
		Click ;click furnace
		Sleep sleepTimer
		loop{
			PixelSearch, furnaceInterfaceX, furnaceInterfaceY,54,118, 76,141, 0xEFC80E, 5, RGB Fast ;Wait till furnace is open
			if (ErrorLevel){
				;do nothing
			}
		else{
			PixelSearch, clickringx1, clickringy1, 5, 31, 536, 367, 0xFFCB0909, 5, RGB Fast ;Locate rings
				if (ErrorLevel){
					MsgBox, Rings can not be found
					ExitApp
				}
				else {
					Sleep sleepTimer
					RandomBezier(0, 0, clickringx1+bigMoveX, clickringy1+bigMoveY,"T" mouseTimer "OT5 OB5 OL5 OR5 RO P3-4") ;Move to make rings
					Sleep sleepTimer
					Click ;click rings
					Sleep makeRingTimer
					Break
				}
		}
	}
	}
	CheckEnergy()
	PixelSearch, bankx2, banky2, 5, 31, 536, 367, 0x307EBA, 5, RGB Fast ;Locate Bank
	if (ErrorLevel){
		MsgBox, Bank can not be found
		ExitApp
	}
	else {
		RandomBezier(0, 0, bankx2+moveInX, banky2+smallMove,"T" mouseTimer "OT5 OB5 OL5 OR5 RO P3-4") ;hover over bank
		Sleep sleepTimer
		Click ;click bank
		Sleep sleepTimer
		loop{
			PixelSearch, bankInterfaceX, bankInterfaceY,185,42, 336,60, 0xFF981F, 5, RGB Fast
			if (ErrorLevel){
				;do nothing
			}
			else {
				Sleep sleepTimer
				PixelSearch, depositx1, deposity1, 5, 31, 536, 367, 0xFF4D00, 5, RGB Fast ;Locate deposit button
					if (ErrorLevel){
						MsgBox, Deposit cannot be found
						ExitApp
					}
					else {
						Sleep sleepTimer
						RandomBezier(0, 0, depositx1+bigMoveX, deposity1+bigMoveY,"T" mouseTimer "OT15 OB15 OL15 OR15 RO P3-4") ;Move deposit button
						Sleep sleepTimer
						Click ;click deposit
						Sleep sleepTimer
						Break
					}
			}
		}
	}
}
ForceExitApp:
	SetTimer, ForceExitApp, Off
	ExitApp
2::Reload

3::ExitApp