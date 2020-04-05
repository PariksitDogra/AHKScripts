#NoEnv
#Warn  
#Include, RandomBezier.ahk 
SendMode Input  
SetWorkingDir %A_ScriptDir%  
CoordMode, Mouse, Client 
CoordMode, Pixel, Client

Random, sleepTimer, 200, 350
Random, mouseTimer, 1000, 2000
Random, dropTimer, 300, 650
Random, mineTimer, 3000, 4000
Random, randomX, -30, 30
Random, randomY, -30, 30
1::
inputbox, j, Script End, How long do you want the script to run (minutes)?
    j := j * 1000 * 60
    SetTimer, ForceExitApp, %j%
;Press 1 to Move Mouse to Compass
	RandomBezier(0,0,560,20,"T" mouseTimer "OT15 OB15 OL15 OR15 RO P3-4")
	Sleep sleepTimer
	Click
	Sleep sleepTimer
	Send {Up down}  ; Press down the up-arrow key.
	Sleep 3000  ; Keep it down for one second.
	Send {Up up}  ; Release the up-arrow key.
	Sleep sleepTimer
loop {
	DropOre(){
		Loop{
			Random, sleepTimer1, 200, 350
			Random, dropTimer1, 300, 650
			Random, randomX1, -4, 4
			Random, randomY1, -4, 4
				PixelSearch Px, Py, 550, 206, 732, 460, 0xFF0000, 5 , RGB Fast ;Drop Iron Ores from Inventory.
					if (ErrorLevel){
						Break
					}
					else{
						RandomBezier(0,0,Px+randomX1,Py+randomY1,"T" dropTimer1 "OT4 OB4 OL4 OR4 RO P3-4")
						Sleep sleepTimer1
						Send {LShift down}  ; Hold Shift key.
						Sleep sleepTimer1
						Click
						Sleep sleepTimer1
						Send {Lshift up}
						Sleep sleepTimer1
					}
		}
	}
	DropOre()
	Sleep sleepTimer
	MineUpper(){
		Random, sleepTimer2, 200, 350
		Random, mineTimer2, 3000, 4000
		Random, randomX2, -30, 30
		Random, randomY2, -30, 30
		PixelSearch UpperRockx, UpperRocky, 230, 39, 300, 100, 0x2F190F, 5 , RGB Fast ;Mine Rocks above character.
			if ErrorLevel
				MsgBox, 
			else
				RandomBezier(0,0,264+randomX2,93+randomY2,"T" sleepTimer2 "OT12 OB13 OL16 OR14 RO P3-4")
				Sleep sleepTimer2
				Click
				Sleep sleepTimer2
				Sleep mineTimer2
	}
	MineUpper()
	Sleep sleepTimer
	PixelSearch RightRockx, RightRocky, 329, 132, 732, 460, 0x452319, 5 , RGB Fast ;Mine Rocks right of Character.
		if ErrorLevel
			MsgBox
		else
			RandomBezier(0,0,344+randomX,173+randomY,"T" sleepTimer "OT15 OB15 OL15 OR15 RO P3-4")
			Sleep sleepTimer
			Click
			Sleep mineTimer
			DropOre()
			Sleep sleepTimer
}
ForceExitApp:
    SetTimer, ForceExitApp, Off
    ExitApp
2::Reload
F4::ExitApp