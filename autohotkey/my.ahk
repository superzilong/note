#SingleInstance force

if not A_IsAdmin
Run *RunAs "%A_ScriptFullPath%"

SetCapsLockState, AlwaysOff 

;获取文件浏览器中被选中的文件路径
/*
	Library for getting info from a specific explorer window (if window handle not specified, the currently active
	window will be used).  Requires AHK_L or similar.  Works with the desktop.  Does not currently work with save
	dialogs and such.
	
	
	Explorer_GetSelected(hwnd="")   - paths of target window's selected items
	Explorer_GetAll(hwnd="")        - paths of all items in the target window's folder
	Explorer_GetPath(hwnd="")       - path of target window's folder
	
	example:
		F1::
			path := Explorer_GetPath()
			all := Explorer_GetAll()
			sel := Explorer_GetSelected()
			MsgBox % path
			MsgBox % all
			MsgBox % sel
		return
	
	Joshua A. Kinnison
	2011-04-27, 16:12
*/
Explorer_GetPath(hwnd="")
{
    if !(window := Explorer_GetWindow(hwnd))
        return ErrorLevel := "ERROR"
    if (window="desktop")
        return A_Desktop
    path := window.LocationURL
    path := RegExReplace(path, "ftp://.*@","ftp://")
    StringReplace, path, path, file:///
    StringReplace, path, path, /, \, All 
    
    ; thanks to polyethene
    Loop
        If RegExMatch(path, "i)(?<=%)[\da-f]{1,2}", hex)
            StringReplace, path, path, `%%hex%, % Chr("0x" . hex), All
        Else Break
    return path
}
Explorer_GetAll(hwnd="")
{
    return Explorer_Get(hwnd)
}
Explorer_GetSelected(hwnd="")
{
    return Explorer_Get(hwnd,true)
}
Explorer_GetWindow(hwnd="")
{
    ; thanks to jethrow for some pointers here
    WinGet, process, processName, % "ahk_id" hwnd := hwnd? hwnd:WinExist("A")
    WinGetClass class, ahk_id %hwnd%
    
    if (process!="explorer.exe")
        return
    if (class ~= "(Cabinet|Explore)WClass")
    {
        for window in ComObjCreate("Shell.Application").Windows
            if (window.hwnd==hwnd)
                return window
    }
    else if (class ~= "Progman|WorkerW") 
        return "desktop" ; desktop found
}
Explorer_Get(hwnd="",selection=false)
{
    if !(window := Explorer_GetWindow(hwnd))
        return ErrorLevel := "ERROR"
    if (window="desktop")
    {
        ControlGet, hwWindow, HWND,, SysListView321, ahk_class Progman
        if !hwWindow ; #D mode
            ControlGet, hwWindow, HWND,, SysListView321, A
        ControlGet, files, List, % ( selection ? "Selected":"") "Col1",,ahk_id %hwWindow%
        base := SubStr(A_Desktop,0,1)=="\" ? SubStr(A_Desktop,1,-1) : A_Desktop
        Loop, Parse, files, `n, `r
        {
            path := base "\" A_LoopField
            IfExist %path% ; ignore special icons like Computer (at least for now)
                ret .= path "`n"
        }
    }
    else
    {
        if selection
            collection := window.document.SelectedItems
        else
            collection := window.document.Folder.Items
        for item in collection
            ret .= item.path "`n"
    }
    return Trim(ret,"`n")
}

;==================================================
; 快捷键CapsLock+s打开sublime
;==================================================
CapsLock & s::
WinGet, process, processName, % "ahk_id" WinExist("A")
StringLower, outStr, process
; MsgBox, %outStr%
if (outStr=="explorer.exe"){
  path := Explorer_GetSelected()
}
else if (outStr=="listary.exe"){
  ClipSaved := ClipboardAll
  Send ^+c
  ; 在Everything中Ctrl+Shift+c复制完整路径和文件名
  ClipWait
  path = %clipboard%
  Clipboard := ClipSaved
}
else if ( or outStr=="everything.exe"){
  ClipSaved := ClipboardAll
  Send ^+c
  ; 在Everything中Ctrl+Shift+c复制完整路径和文件名
  ClipWait
  path = %clipboard%
  Clipboard := ClipSaved
}
else if (outStr=="sublime_text.exe")
{
    Suspend On
    WinMinimize,A
    Send {Alt}+{Tab}
    Suspend Off
    return
}
else{
  ;MsgBox, %process%
  Run, "C:\Program Files\Sublime Text 3\sublime_text.exe"
  return
}
Run, "C:\Program Files\Sublime Text 3\sublime_text.exe" "%path%"
WinMaximize,A
return

OpenOrShowAppBasedOnExeName(AppAddress)
{


	AppExeName := SubStr(AppAddress, InStr(AppAddress, "\", false, -1) + 1)
		

	IfWinExist ahk_exe %AppExeName%
	{
	
		IfWinActive
		{
			WinMinimize
			Return
		}
		else
		{
			WinActivate
			Return
		}
				
	}
	else
	{	
	
		Run, %AppAddress%, UseErrorLevel
        If ErrorLevel
        {
            Msgbox, File %AppAddress% Not Found
            Return
        }
		else
		{
			WinWait, ahk_exe %AppExeName%
			WinActivate ahk_exe %AppExeName%			
			Return
		}			
		
	}
}

CapsLock & a::
AppExeName := "MSC_APEX.exe"
IfWinExist ahk_exe %AppExeName%
{

	IfWinActive
	{
		WinMinimize, A
		Return
	}
	else
	{
		WinActivate
		Return
	}
			
}
else
{	
	Run, "D:\Perforce\D1_output\scons\debug\mod\runMSC_ApexTest.bat", "-console", UseErrorLevel
    If ErrorLevel
    {
        Msgbox, File %AppAddress% Not Found
        Return
    }
	else
	{
		WinWait, ahk_exe %AppExeName%
		WinActivate ahk_exe %AppExeName%			
		Return
	}			
	
}

CapsLock & g::
AppExeName := "MSC_APEX.exe"
IfWinExist ahk_exe %AppExeName%
{

    IfWinActive
    {
        WinMinimize, A
        Return
    }
    else
    {
        WinActivate
        Return
    }
            
}
else
{   
    Run, "D:\Perforce\D3_output\scons\debug\mod\runMSC_GenDesTest.bat", "-console", UseErrorLevel
    If ErrorLevel
    {
        Msgbox, File %AppAddress% Not Found
        Return
    }
    else
    {
        WinWait, ahk_exe %AppExeName%
        WinActivate ahk_exe %AppExeName%            
        Return
    }           
    
}

CapsLock & k::
RunWait, taskkill /im MSC_APEX.exe /f
RunWait, taskkill /im RKServer.exe /f
return

CapsLock & z::7zip()
return

7zip() {
    temp = %clipboard%
    send {LButton}
    sleep,100
    Send, {Ctrl Down}c{Ctrl Up}
    file = %clipboard% ;get file address
    msgbox, 7zip will extract "%file%".
    clipboard = %temp% ;restore clipboard
    outdir := getdir(file)
    if (A_Is64bitOS = 1) {
        runwait, "C:\Program Files\7-Zip\7z.exe" x "%file%" -o"%outdir%" -y,,hide
        } else {
            runwait, "C:\Program Files (x86)\7-Zip\7z.exe" x "%file%" -o"%outdir%" -y,,hide
        }
        msgbox, 7zip has finished extracting "%file%".
        return
    }

    getdir(input) {
        SplitPath, input,,parentdir,,filenoext
        final = %parentdir%\%filenoext%
        return final
    }

CapsLock & u::
Folder:="C:\Users\zhu\Downloads"

;sorts latest downloaded file, works if you activate this script right after you finish downloading any zip/rar/etc...
Loop, %Folder%\*
{
     FileGetTime, Time, %A_LoopFileFullPath%, C
     If (Time > Time_Orig)
     {
          Time_Orig := Time
          File := A_LoopFileName
     }
}
FullPath=%Folder%\%File%
SplitPath, File, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
ExtractedPath=%Folder%\%OutNameNoExt%

;extracts to folder named after original zip file in download folder
RunWait, "C:\Program Files\7-Zip\7z.exe" x `"%FullPath%`" -o`"%ExtractedPath%`"

;open explorer after extracted in downloads folder.
Run, explorer `"%ExtractedPath%`"
Return

CapsLock & Up::WinMaximize, A
CapsLock & Down::WinMinimize, A

::btw::
MsgBox, You typed btw.
return

:*:ftw::Free the whales

CapsLock & d::
run, "https://devdocs.io"
return

CapsLock & t::run taskmgr.exe
return

CapsLock & q::
ClipSaved := ClipboardAll
Send ^c
ClipWait
path = %clipboard%
Clipboard := ClipSaved
msgbox, %path%
; commands=
; (join&
;  python3 "D:\ApexDoc\script\UniqueFailures.py" "-i" %path%"`n
; )
; Run, cmd /c %commands%  
run cmd.exe
    WinWait, ahk_exe cmd.exe ; Wait for CMD to start
    send cd /d C:\Users\zhu\Desktop{enter}
    Send python3 D:\ApexDoc\script\UniqueFailures.py -i %path%{enter}
return

CapsLock & c::
Clipboard := Explorer_GetSelected()

CapsLock & e::
Click,,Right
Send wt
Return



