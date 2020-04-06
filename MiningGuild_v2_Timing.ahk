#NoEnv
#Warn  
#Include, RandomBezier.ahk 
SendMode Input  
SetWorkingDir %A_ScriptDir%  
CoordMode, Mouse, Client 
CoordMode, Pixel, Client

Random, sleepTimer, 189, 250
Random, mouseTimer, 1000, 1300
Random, dropTimer, 280, 500
Random, mineTimer, 3600, 3800
Random, walkTimer, 15500, 16000
Random, walkTimer1, 10000, 11000
Random, randomX, -1, 1
Random, randomY, -1, 1
Random, randomX1, -27, 27
Random, randomY1, -27, 27
Random, randomX2, -4, 4
Random, randomY2, -4, 4
Random, mouseScroll, 1, 4
Random, RestoreEnergy, 5212, 10210

1::
inputbox, j, Script End, How long do you want the script to run (minutes)?
    j := j * 1000 * 60
    SetTimer, ForceExitApp, %j%
;Press 1 to start script
	RandomBezier(0,0,560,20,"T" mouseTimer "OT15 OB15 OL15 OR15 RO P3-4") ;Compass
	Sleep sleepTimer
	Click
	Sleep sleepTimer
	Send {Up down}  ; Press down the up-arrow key.
	Sleep 3000  ; Keep it down for one second.
	Send {Up up}  ; Release the up-arrow key.
	Sleep sleepTimer
    Loop{
        PixelSearch Stairx, Stairy, 1, 300, 515, 336, 0xFF852B2B, 5 , RGB Fast ;Start at Falador East bank. Will search for the stairway to the Mining Guild.
            if (ErrorLevel){
                MsgBox, Stairs not found.
            }
            else{
                RandomBezier(0,0,Stairx+randomX,Stairy+randomY,"T" mouseTimer "OT15 OB16 OL16 OR16 RO P3-4") ;Climbs down the stairs.
                Sleep sleepTimer
                Click
                Sleep walkTimer
            }
        RandomBezier(0,0,390+randomX, 201+randomY,"T" mouseTimer "OT15 OB15 OL15 OR15 RO P3-4") ;Walks to the rocks
        Sleep sleepTimer
        Click
        Sleep walkTimer1
        send {WheelUp 50+mouseScroll}
        Sleep sleepTimer
        Loop, 14{
            PixelSearch UpperRockx, UpperRocky, 249, 77, 289, 126, 0xFF852B2B, 5 , RGB Fast ;Mine Rocks above character.
                if ErrorLevel
                    MsgBox, Rock not found.
                else
                    Sleep sleepTimer
                    RandomBezier(0,0,UpperRockx+randomX1, UpperRocky+randomY1,"T" sleepTimer "OT12 OB15 OL16 OR14 RO P3-4")
                    Sleep sleepTimer
                    Click
                    Sleep mineTimer
            PixelSearch LowerRockx, LowerRocky, 243, 250, 291, 283, 0xFF852B2B, 5 , RGB Fast ;Mine Rocks below character.
                if ErrorLevel
                    MsgBox, Rock not found.
                else
                    Sleep sleepTimer
                    RandomBezier(0,0,LowerRockx+randomX1, LowerRocky+randomY1,"T" sleepTimer "OT9 OB13 OL16 OR8 RO P3-4")
                    Sleep sleepTimer
                    Click
                    Sleep mineTimer
        }
        Send {WheelDown 50+mouseScroll}
        Sleep sleepTimer
        PixelSearch Stairx1, Stairy1, 96, 143, 111, 151, 0xFF852B2B, 5 , RGB Fast ;Finds the stairs
            if (ErrorLevel){
                MsgBox, Stairs not found.
            }
            else{
                Sleep sleepTimer
                RandomBezier(0,0,Stairx1+randomX,Stairy1+randomY,"T" mouseTimer "OT15 OB16 OL20 OR16 RO P3-4") ;Climbs up the stairs.
                Sleep sleepTimer
                Click
                Sleep walkTimer1
            }
        PixelSearch Bankerx, Bankery, 1, 1, 224, 44, 0x00FFFF, 5 , RGB Fast ;Finds the banker.
            if (ErrorLevel){
                MsgBox, Banker not found.
            }
            else{
                Sleep sleepTimer
                RandomBezier(0,0,Bankerx+randomX,Bankery+randomY,"T" mouseTimer "OT21 OB26 OL20 OR16 RO P3-4") ;Opens the bank.
                Sleep sleepTimer
                Click
                Sleep walkTimer
            }
        RandomBezier(0,0,444+randomX2, 315+randomY2,"T" mouseTimer "OT9 OB8 OL9 OR7 RO P3-4") ;Compass
        Sleep sleepTimer
        Click
        Sleep sleepTimer
        RandomBezier(0,0,485+randomX, 23+randomY,"T" mouseTimer "OT7 OB7 OL7 OR8 RO P3-4") ;Compass
        Sleep sleepTimer
        Click
        Sleep RestoreEnergy
    }
ForceExitApp:
    SetTimer, ForceExitApp, Off
    ExitApp
2::Reload
F4::ExitApp