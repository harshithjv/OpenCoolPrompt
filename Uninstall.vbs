' VBScript File to uninstall registry entries and shortcuts for 'Open Cool Prompt'

'---------------------------------------
'           Open Cool Prompt
'By Harhith J.V., 
'Mangalore, India.
'harshithjv@yahoo.co.in
'August 04, 2009( Tuesday)
'---------------------------------------


'This script file was created by modifying 'Uninstall.vbs' file in the following package :
' Install mp3tagger
' Copyright (C) 2000-2001 Stephen Ostermiller <mp3tagger@Ostermiller.com>

'This script file is used for entirely different purpose  than used in above mentioned.
'As this is a script file the scource code is naturally open for anyone to see and use
'for their own purpose. The software was mentioned merely as to say 'thank you'.
'Also the script file was used as programming-language reference,i.e., here VBScript.



' set some global variables that we can use throughout.
dim objFileSystem 'file system
set objFileSystem = CreateObject("Scripting.FileSystemObject")
dim objShell ' Windows Scripting
set objShell = CreateObject("WScript.shell")

main()

sub main()  
    On Error Resume Next
    Dim objLink 
    objFileSystem.DeleteFile(objShell.specialFolders("programs") & "\Open Cool Prompt.lnk")
    objFileSystem.DeleteFile(objShell.specialFolders("desktop") & "\Open Cool Prompt.lnk")
	    
    objShell.RegDelete "HKEY_CLASSES_ROOT\Directory\shell\Open Cool Prompt\command\"
    objShell.RegDelete "HKEY_CLASSES_ROOT\Directory\shell\Open Cool Prompt\"
    objShell.RegDelete "HKEY_CLASSES_ROOT\Folder\shell\Open Cool Prompt\command\"
    objShell.RegDelete "HKEY_CLASSES_ROOT\Folder\shell\Open Cool Prompt\"
    objShell.RegDelete "HKEY_CLASSES_ROOT\Drive\shell\Open Cool Prompt\command\"
    objShell.RegDelete "HKEY_CLASSES_ROOT\Drive\shell\Open Cool Prompt\"

	MsgBox "Shortcuts and registry items are uninstalled succesfully." & vbCrLf & "Delete the rest of the files manually." , vbInformation, "Uninstall Successful"

end sub