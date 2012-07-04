' VBScript File to install registry entries and shortcuts for 'Open Cool Prompt'

'---------------------------------------
'           Open Cool Prompt
'By Harhith J.V., 
'Mangalore, India.
'harshithjv@yahoo.co.in
'August 04, 2009( Tuesday)
'---------------------------------------


'This script file was created by modifying 'Install.vbs' file in the following package :
' Install mp3tagger
' Copyright (C) 2000-2001 Stephen Ostermiller <mp3tagger@Ostermiller.com>

'This script file is used for entirely different purpose  than used in above mentioned.
'As this is a script file the scource code is naturally open for anyone to see and use
'for their own purpose. The software was mentioned merely as to say 'thank you'.
'Also the script file was used as programming-language reference,i.e., here VBScript.



' set some global variables that we can use throughout.
dim objShell ' Windows Scripting
set objShell = CreateObject("WScript.shell")


main()

sub main()

	'executable filename
	dim ExecName
	'figure out where this script is being called
    ExecName=WScript.ScriptFullname
    'remove the name of the script from the path
    ExecName=Mid(ExecName, 1, lastIndexOf(ExecName, Chr(92)))
    ExecName=ExecName & "Open Cool Prompt.bat"	
	
	
    ' create shortcut to main executable batch file
    Dim objLink 
    Set objLink = objShell.createShortcut(objShell.specialFolders("programs") & "\Open Cool Prompt.lnk")
    objLink.targetPath = (Chr(34) & ExecName & Chr(34))
    objLink.save
    Set objLink = objShell.createShortcut(objShell.specialFolders("desktop") & "\Open Cool Prompt.lnk")
    objLink.targetPath = (Chr(34) & ExecName & Chr(34))
    objLink.save
	
	
	'Write Registry Information
    objShell.RegWrite "HKEY_CLASSES_ROOT\Folder\shell\Open Cool Prompt", "Open Cool Prompt"
    objShell.RegWrite "HKEY_CLASSES_ROOT\Folder\shell\Open Cool Prompt\command\", (Chr(34) & ExecName & Chr(34) & " " & Chr(34) & "%1" & Chr(34) )
    
    
	'Message Box
	MsgBox "->Open Cool Prompt<- was installed successfully." & vbcrlf & vbcrlf & "There are shortcuts to -Open Cool Prompt- on your desktop and in your start menu."& vbcrlf & "You may open command prompt by right clicking on required directory." , vbInformation, "Install Successful"
end sub

' returns the last index of the specified charater
' in the specified string
' or -1 if the character is not found in the string
function lastIndexOf (AString, AChar)
    int position 
    int index 
    index = -1  
    For position=1 to Len(AString)
        If Mid(AString, Position, 1) = AChar Then
            index=position
        End If
    Next 
    lastIndexOf=index
end function