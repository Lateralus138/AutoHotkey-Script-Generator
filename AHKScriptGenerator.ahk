; Create pre-generated AutoHotkey script
; with a basic template or import your own
#SingleInstance, Force
; Init
OnExit, Leave

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Vars
innerTitle := "; Header and/or title here"
df := "Segoe UI"
csf := "Lucida Console"
asg := "AutoHotkey Script Generator"

; Build menus, intial loops and guis here
Gui, Color, , 0xFFFFE0
Gui, Add, Tab3, w500 h600 vtaba, Create Script|Import Template|About
Gui, Tab, Create Script
cf("14", , "000080", , "5")
Gui, Add, Text, , AutoHotkey Script Name`n(Optional - generated by time and date).
cf(, csf, "00001F")
Gui, Add, Edit, h23 vtitle
cf("14", , "000080", , "5")
Gui, Add, Text, , Script title or starting comments`n(Optional - adds whatever you type). 
cf(, csf, "00001F")
Gui, Add, Edit, 0x1000 r5 vinnerTitle, % innerTitle
cf("14", , "000080", , "5")
Gui, Add, Text, ,Choose your directory`n(Optional - defaults to this programs directory).
cf(, csf, "00001F")
Gui, Add, Edit, vdir h23, % A_WorkingDir
show()
ControlGetPos, xe3b, ye3b, we3b, he3b, Edit3, % asg
b1x := (xe3b + we3b) + 4
cf()
Gui, Add, Button, x%b1x% yp-1 vb1 h24, Select Directory
show()
ControlGetPos, xb1a, yb1a, wb1a, hb1a, Button1, % asg
b1width := (xb1a + wb1a)
If (b1width < 420)
	{
		gap := (420 - b1width)
		e3w := we3b + gap
		b1width := "420"
		GuiControl, Move, dir, w%e3w%
		ControlGetPos, xe3c, ye3c, we3c, he3c, Edit3, % asg
		bgap := (xe3c + we3c)
		GuiControl, Move, b1, x%bgap%
	}
e2width := b1width - 14
fwidth := b1width + 32
show()
GuiControl, Move, innerTitle, w%e2width%
GuiControl, Move, title, w%e2width%
ControlGetPos, xe3a, ye3a, we3a, he3a, Edit3, % asg
b2x := xe3a - 4
b2w := fwidth - 44
cf("24", , , "500", "5")
Gui, Add, Button, x%b2x% w%b2w% y+8 h64, Generate Script
show()
ControlGetPos, xb2a, yb2a, wb2a, hb2a, Button2, % asg
fheight := (yb2a + hb2a) - 8
If (fwidth < 364)
	fwidth := "364"
wtab := fwidth - 18
htab := fheight - 12
GuiControl, Move, taba, w%wtab% h%htab%
Gui, Tab, Import Template
cf("14", , "000080", , "5")
Gui, Add, Text,  vimpt, % "You can import your custom templates here."
								 . "`nYou can use any readable text file in any"
								 . "`nformat: TXT, AHK, XML etc..."
show()
ControlGetPos, xs4a, ys4a, ws4a, hs4a, Static4, % asg
b4y := ys4a + hs4a
cf(, csf, "00001F")
Gui, Add, Edit, vimp
show()
ControlGetPos, xe4a, ye4a, we4a, he4a, Edit4, % asg
b4ny := (ye4a - ys4a) + 5
e4w := xe4a + we4a
cf()
Gui, Add, Button, x+8 yp  h23 vfile, Select File
show()
ControlGetPos, xb4a, yb4a, wb4a, hb4a, Button3, % asg
b4w := xb4a + wb4a
If (b4w < fwidth)
	{
		bgap := fwidth - b4w
		e4nw := (bgap + we4a) - 16
		GuiControl, Move, imp, w%e4nw%
		xb4nx := (xe4a + e4nw) - 8
		GuiControl, Move, file, x%xb4nx% y%b4ny%
	}
cf("14", , "000080", , "5")
Gui, Add, Text, x%xe4a% y%yb4a% , % "Name your script`n(Optional - will keep templates name)."
cf(, csf, "00001F")
Gui, Add, Edit, viname w%e2width%
show()
ControlGetPos, xe5a, ye5a, we5a, he5a, Edit5, % asg
cf("14", , "000080", , "5")
Gui, Add, Text, x%xe4a% y%ye5a%, Choose your directory`n(Optional - defaults to this programs directory).
cf(, csf, "00001F")
Gui, Add, Edit, vifile, % A_WorkingDir
show()
ControlGetPos, xe6a, ye6a, we6a, he6a, Edit6, % asg
cf()
Gui, Add, Button, gSelect2 x+8 yp-1 h23 v2file, Select Directory
show()
ControlGetPos, xb5a, yb5a, wb5a, hb5a, Button4, % asg
b5w := xb5a + wb5a
b6y := fheight - 82 ; he6a + 8
If (b5w < fwidth)
	{
		b4gap := fwidth - b5w
		e5nw := (b4gap + we6a) - 16
		GuiControl, Move, ifile, w%e5nw%
		xb5nx := (xe6a + e5nw) - 8
		GuiControl, Move, 2file, x%xb5nx%
	}
cf("24", , , "500", "5")
b6x := b2x + 4
Gui, Add, Button, x%b6x% w%b2w% y%b6y% h64 g2gen, Generate Script
Gui, Tab, About
cf("14", , "000080", , "5")
Gui, Add, Text, w%e2width%,	%	"AutoHotkey Script Generator is a small, but effecient utility "
										.	"to help you create lots of AutoHotkey scripts. You can instantly "
										.	"generate a basic universal script written by me or you can import "
										.	"your own pre-written templates. "
Gui, Show, w%fwidth% h%fheight%, % asg

; End auto execute
Return

; Hotkeys
!r::Reload

; Functions
show(){
	Gui, Show, , AutoHotkey Script Generator
}
cf(size := "10", font := "Segoe UI", color := "Black", weight := "400", qty := "0"){
	Gui, Font, s%size% c%color% w%weight% q%qty%, % font 
}
funcCreateScript(dir, com, title){
	If (title = "")
		title := "AutoHotkey_" funcGetTime() ".ahk"
	Else
		title := title ".ahk"
	If (com = "")
		com := "; " title
	fp := dir "\" title
	FileAppend,
(
%com%

`; Init
#NoEnv
SendMode Input
SetWorkingDir `%A_ScriptDir`%

`; Vars


`; Build menus, intial loops and guis here


`; End auto execute
Return

`; Hotkeys


`; Functions


`; Classes


`; Subs


), % fp
IfExist, % fp
	MsgBox, 64, % asg Info, % "Your script was created successfully at:`n" fp
Else
	MsgBox, 16,  % asg Error, % fp 
																. "`nwas not created. If you are trying to save to a folder"
																. "`nyou do not own then you will need to run this program"
																. "`nas adminstrator and try again."
}


funcGetTime(){
	FormatTime, a,, MM.dd.yyyy_h.mm.ss_tt
	Return a
}

; Classes
Class Globals {
	SetGlobal(vVar,vVal=""){
		Global
		%vVar% := vVal
		Return
	}
	GetGlobal(vVar){
		Global
		Local vTmp
		vTmp := %vVar%
		Return vTmp
	}
}

; Subs
ButtonSelectDirectory:
	DriveGet, a, list
	Loop, Parse, a
		{
			IfExist, % A_LoopField ":\Users\" A_Username "\Desktop\"
				FileSelectFolder, dir, % A_LoopField ":\", 3
		}
	GuiControl, , dir, % dir
Return
Select2:
	DriveGet, b, list
	Loop, Parse, b
		{
			IfExist, % A_LoopField ":\Users\" A_Username "\Desktop\"
				FileSelectFolder, 2dir, % A_LoopField ":\", 3
		}
	GuiControl, , ifile, % 2dir
Return
ButtonGenerateScript:
	Gui, Submit, NoHide
	funcCreateScript(dir, innerTitle, title)
Return
2gen:
	Gui, Submit, NoHide
	If iname
		name := iname
	Else
		name := fn
	If !2dir
		tdir := A_WorkingDir "\"
	Else
		tdir := 2dir "\"
	finalf := tdir name ".ahk"
	FileRead, copy,  % file
	FileAppend, %copy%, % finalf
Return
ButtonSelectFile:
	FileSelectFile, file
	SplitPath, file, , , ,fn
	GuiControl, , imp, % file
	;GuiControl, , iname, % fn
Return
GuiClose:
Leave:
	ExitApp
	