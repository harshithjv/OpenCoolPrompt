rem Batch File to open command prompt for the specified file.

rem Harshith J.V.
rem Mangalore, India.
rem harshithjv@yahoo.co.in
rem August 04, 2009( Tuesday)


rem Changing current directory to the one referenced by 1st command-line argument .
cd %1

rem Appending current path to PATH variable.
rem set PATH=%PATH%;%CD%

rem Setting PROMPT variable with drive-letter.
set PROMPT=Cool $N: $$ 

rem Setting background and foreground colour of the prompt.
color 2b

rem Setting Window Title.
title "Open Cool Prompt"

rem Setting messages to display at the  prompt header.
set MessStr=Type 'echo %%CD%%' or 'dir' command to find the Current Directory Path

echo off

cls

echo Welcome to 'Open Cool Prompt'

echo %MessStr%

echo Prompt String is set as 'Cool [drive_letter]: $ '

echo where [drive_letter]: is the current drive. E.g.:- C:, D:, E:, etc.

echo ------------------------------------------------------------------------------

rem Starting a new prompt with 'Below Normal' process priority. 
start /BELOWNORMAL /B cmd /k echo on