
#SingleInstance Force ; The script will Reload if launched while already running

F1::
Send ^9
Return

active := Object()

^R::
ResetWindows()
Return

^1::
SetActive("1")
Return

^2::
SetActive("2")
Return

^3::
SetActive("3")
Return

^4::
SetActive("4")
Return

^5::
SetActive("5")
Return

win1 := 0
win2 := 0
win3 := 0
win4 := 0
win5 := 0





ResetWindows() {

	width := Round(A_ScreenWidth / 3)
	height := Round(A_ScreenHeight / 3) + 40

	;MsgBox %A_ScreenWidth%x%A_ScreenHeight%

	global active
	global win1
	global win2
	global win3
	global win4
	global win5

	win5 := WinExist("5")
	WinMove, ahk_id %win5% ,, width , height , width, height
	
	win1 := WinExist("1")
	WinMove, ahk_id %win1% ,, 0, 0, width , height 

	win2 := WinExist("2")
	WinMove, ahk_id %win2% ,, width, 0, width , height 

	win3 := WinExist("3")
	WinMove, ahk_id %win3% ,, (width * 2) , 0, width , height 

	win4 := WinExist("4")
	WinMove, ahk_id %win4% ,, 0, height , width , height 

	
	active := win5
}

SetActive(WindowTitle) {

	global active
	;if(active) {

		target_window := WinExist(WindowTitle)
		;MsgBox, % target_window	
		;MsgBox, % active
		WinGetPos, targetX , targetY, targetWidth , targetHeight, ahk_id %target_window%
		WinGetPos, activeX , activeY, activeWidth , activeHeight, ahk_id %active%
		WinMove, ahk_id %active% ,, targetX, targetY, targetWidth , targetHeight
		WinMove, ahk_id %target_window% ,, activeX, activeY, activeWidth , activeHeight
		active := target_window
	;}

}

^Esc::
	BreakLoop = 1
return



pressOrange(win) {

	color := 0x0097F7

	WinActivate, ahk_id %win%
	IfWinActive, ahk_id %win%
	{
		WinGetActiveStats, Title, WindowWidth, WindowHeight , x , y
		;MsgBox, %Title% %WindowWidth%  %WindowHeight% %WindowX% %WindowY%

		PixelSearch, Px, Py, (WindowWidth * 0.578125‬), (WindowHeight * 0.4875 ),  (WindowWidth * 0.8784), (WindowHeight * 0.93 ) , color  , 3 , Fast
			if ErrorLevel {
				OutputDebug 'waw'
			}
			else {
				MouseMove, Px, Py
			    Click, Px , Py
			}
	}
}

^!t:: 

	BreakLoop := 0
	Loop, 
	{
		if (BreakLoop = 1)
		  break 
		
	  	pressOrange(win1)
	  	pressOrange(win2)
	  	pressOrange(win3)
	  	pressOrange(win4)
	  	pressOrange(win5)

	}

return

^!x:: 


	WinActivate, ahk_id %win1%
	IfWinActive, ahk_id %win1%
	{
		PixelSearch, Px, Py, 175, 116, 479, 315 , 0x63B47E  , 3 , Fast
			if ErrorLevel {
				OutputDebug 'waw'
			}
			else {
				MouseMove, Px, Py
			    ;Click, Px , Py
			}
	}


return

^!c:: 


	WinActivate, ahk_id %win1%
	IfWinActive, ahk_id %win1%
	{
		MouseGetPos, x, y
		PixelGetColor, color , x, y
		Clipboard := color
	}


return

^+LButton:: 
	;MsgBox, wow

	CoordMode, Mouse, Window

	WinGetActiveStats, Title, WindowWidth, WindowHeight , x , y
	MouseGetPos, mouse_x, mouse_y

	output_x := (mouse_x / WindowWidth)
	output_y := (mouse_y / WindowHeight)

	MsgBox, X = %output_x%  Y = %output_y%
return