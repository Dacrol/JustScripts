#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


/* 
Alt + number keys for developers.
*/
!7::{
!8::[
!9::]
!0::}
!4::$
!2::@
!+::\

/* 
Force the NumpadDot to be a normal decimal dot instead of comma. 
*/
NumpadDot::.

/*
Test Colors at the mouse with ctrl+alt+PrintScreen
*/
$!^PrintScreen::
color := 0
MouseX := 0
MouseY := 0
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%, Slow RGB
MsgBox, 4,,The color at the current cursor position is %color%. Copy to clipboard?
IfMsgBox Yes
	StringTrimLeft, color, color, 2
	clipboard = %color%
return
return
