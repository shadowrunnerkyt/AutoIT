#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <Clipboard.au3>
#include <AutoItConstants.au3>
#include <GUIConstantsEx.au3>
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
    Local $clipText = _ClipBoard_GetData() ; Define a variable with contents of clipboard
    Local $clipArray = StringSplit($clipText, @CRLF, $STR_ENTIRESPLIT)

    For $i = 1 To $clipArray[0] ; Loop through the array returned by StringSplit to display the individual values.
        ;MsgBox($MB_SYSTEMMODAL, "", "$clipArray[" & $i & "] - '" & $clipArray[$i] & "'")
		runClarify($clipArray[$i])
    Next
	MsgBox($MB_SYSTEMMODAL, "", "Finished")
EndFunc   ;==>Example

Func  runClarify($digits)
	_ClipBoard_SetData($digits)
	
	Local $windowClarify = WinActivate("Clarify - ClearSupport") ;find the window
	
	ControlFocus($windowClarify, "", "[CLASS:Edit; INSTANCE:1]") ;focus ID field
	Send("{END}+{HOME}^v") ;select all text and paste 4-digit
	ControlClick($windowClarify, "", "[CLASS:Button; INSTANCE:2]") ;click Find
	ControlClick($windowClarify, "", "[CLASS:GXWND; INSTANCE:1]", "primary", 2, 36, 22) ;double click first result
	Sleep(1000)
	ControlFocus($windowClarify, "", "[ID:33]") ;focus side tree
	Send("h") ;select heirarchies
	Sleep(2000)
	ControlClick($windowClarify, "", "[CLASS:GXWND; INSTANCE:2]", "secondary", 1, 10, 10) ;right click corner boxy things
	Send("{DOWN}{ENTER}")
	Sleep(2000)
	ControlClick($windowClarify, "", "[CLASS:Button; INSTANCE:5]") ;click use/done
	Sleep(1000)
	ControlClick($windowClarify, "", "[CLASS:Button; INSTANCE:18]") ;click check button
	Sleep(3000) ;takes a moment
	ControlClick($windowClarify, "", "[CLASS:GXWND; INSTANCE:1]", "primary", 1, 197, 23) ;click in ID search box
	Sleep(500)
	Send("232566{ENTER}") ;white label corp code
	ControlClick($windowClarify, "", "[CLASS:GXWND; INSTANCE:1]", "primary", 2, 132, 38)
	Sleep(3000)
	ControlFocus($windowClarify, "", "[ID:33]") ;focus side tree
	Send("s") ;select sites
	Sleep(1000)
	ControlClick($windowClarify, "", "[CLASS:GXWND; INSTANCE:1]", "primary", 2, 35, 39) ;pick CUST record
	Sleep(3000)
	ControlClick($windowClarify, "", "[CLASS:SysTabControl32; INSTANCE:1]", "primary", 1, 14, 10) ;Click Address
	Sleep(1000)
	MouseClick($MOUSE_CLICK_LEFT, 306, 565, 1, 0) ;click cross reference
	Send("^v")
	ControlClick($windowClarify, "", "[CLASS:SysTabControl32; INSTANCE:1]", "primary", 1, 165, 11) ;Click Support
	Sleep(1000)
	MouseClick($MOUSE_CLICK_LEFT, 278, 420, 1, 0) ;click RNG
	Sleep(1000)
	Send("s")
	Sleep(200)
	Send("s")
	Sleep(200)
	Send("{TAB}")
	Sleep(100)
	Send("Dallas")
	Sleep(100)
	ControlClick($windowClarify, "", "[CLASS:Button; INSTANCE:21]") ;click replace
	ControlClick($windowClarify, "", "[CLASS:Button; INSTANCE:24]") ;click done
	Sleep(500)
	Send("!s") ;click save
	Sleep(200)
	MouseClick($MOUSE_CLICK_LEFT, 773, 72, 1, 0) ;close the account window
	Sleep(500)
EndFunc