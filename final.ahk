
#SingleInstance Force ; The script will Reload if launched while already running


;SetFifthWindow()

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

~Esc::
	BreakLoop = 1
return

^!x:: 
	BreakLoop := 0
	Loop, 
	{
		if (BreakLoop = 1)
		  break 
		
		  pressX(win1)
		  pressX(win2)
		  pressX(win3)
		  pressX(win4)
		  pressX(win5)

	}


return


pressX( win ) {
	WinActivate, ahk_id %win%
	Sleep 100
	
	IfWinActive, ahk_id %win%
	{
	 	Send, {x}
	 	Sleep, 100   
	}

}


checkAndClickTreasureMap(win) {
	WinActivate, ahk_id %win%
	
	Sleep 100
	
	IfWinActive, ahk_id %win%
	{
		;Click, 616, 371

		;PixelGetColor, color , 616, 371
		;PixelGetColor, color2 , 616, 371

		;MsgBox, %color% %color2%

		Sleep 100
		


		PixelSearch, Px, Py, 626, 371, 626, 371 , 0x28A2F7 , 3 , Fast
			if ErrorLevel
			    Sleep, 100
			else
			    Sleep, 100
			    Click, 616, 371
		    
	}
}


^!d::

	BreakLoop := 0
	Loop, 
	{
		if (BreakLoop = 1)
		  break 
		
	  	WinActivate, ahk_id %win1%
		Sleep 100
		IfWinActive, ahk_id %win1%
		{
			PixelSearch, Px, Py, 626, 371, 626, 371 , 0x28A2F7 , 3 , Fast
				if ErrorLevel
				    OutputDebug 'waw'
				else
				    Click, 616, 371
		}

		WinActivate, ahk_id %win2%
		Sleep, 100
		IfWinActive, ahk_id %win2%
		{
			PixelSearch, Px, Py, 626, 371, 626, 371 , 0x28A2F7 , 3 , Fast
				if ErrorLevel
				    OutputDebug 'waw'
				else
				    Click, 616, 371
		}

		WinActivate, ahk_id %win3%
		Sleep, 100
		IfWinActive, ahk_id %win3%
		{
			PixelSearch, Px, Py, 626, 371, 626, 371 , 0x28A2F7 , 3 , Fast
				if ErrorLevel
				    OutputDebug 'waw'
				else
				    Click, 616, 371
		}

		WinActivate, ahk_id %win4%
		Sleep, 100
		IfWinActive, ahk_id %win4%
		{
			PixelSearch, Px, Py, 626, 371, 626, 371 , 0x28A2F7 , 3 , Fast
				if ErrorLevel
				    OutputDebug 'waw'
				else
				    Click, 616, 371
		}

		WinActivate, ahk_id %win5%
		Sleep, 100
		IfWinActive, ahk_id %win5%
		{
			PixelSearch, Px, Py, 626, 371, 626, 371 , 0x28A2F7 , 3 , Fast
				if ErrorLevel
				    OutputDebug 'waw'
				else
				    Click, 616, 371
		}

	}

return


^!LButton:: 

	MouseGetPos, x , y
	PixelGetColor, color , x, y

	Clipboard := color . x . y
return

^!RButton:: 

	MouseGetPos, x , y
	Clipboard := x, y
return


^!t:: 

	BreakLoop := 0
	Loop, 
	{
		if (BreakLoop = 1)
		  break 
		

		x := 527
		y := 341
		color := 0x0097F7

;PixelGetColor, color1 , x, y
;MsgBox, %color%

	  	WinActivate, ahk_id %win1%
		Sleep, 300
		IfWinActive, ahk_id %win1%
		{
			PixelSearch, Px, Py, x , y, x , y , color  , 3 , Fast
				if ErrorLevel {
					OutputDebug 'waw'
				}
				else {
					MouseMove, Px, Py
				    Click, Px , Py
				}
		}

		WinActivate, ahk_id %win2%
		IfWinActive, ahk_id %win2%
		{
			PixelSearch, Px, Py, x , y, x , y , color  , 3 , Fast
				if ErrorLevel {
					OutputDebug 'waw'
				}
				else {
					MouseMove, Px, Py
				    Click, Px , Py
				}
		}

		WinActivate, ahk_id %win3%
		IfWinActive, ahk_id %win3%
		{
			PixelSearch, Px, Py, x , y, x , y , color  , 3 , Fast
				if ErrorLevel {
					OutputDebug 'waw'
				}
				else {
					MouseMove, Px, Py
				    Click, Px , Py
				}
		}

		WinActivate, ahk_id %win4%
		IfWinActive, ahk_id %win4%
		{
			PixelSearch, Px, Py, x , y, x , y , color  , 3 , Fast
				if ErrorLevel {
					OutputDebug 'waw'
				}
				else {
					MouseMove, Px, Py
				    Click, Px , Py
				}
		}

		WinActivate, ahk_id %win5%
		IfWinActive, ahk_id %win5%
		{
			PixelSearch, Px, Py, x , y, x , y , color  , 3 , Fast
				if ErrorLevel {
					OutputDebug 'waw'
				}
				else {
					MouseMove, Px, Py
				    Click, Px , Py
				}
		}

	}

return
