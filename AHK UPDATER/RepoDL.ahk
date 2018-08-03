#Persistent
#SingleInstance, force 
#include %A_Desktop%\AHK\AHK UPDATER\Zip-Unzip.ahk ;library for zip functions


;----------------------------------- DOWNLOAD SECTION -------------------------------------------------------------------------------------------------------------
filename := "update.zip" ;names the zip folder being downloaded
FileURL := "https://github.com/floppernopper/derp/archive/master.zip" ;actual url for file being downloaded 

SetWorkingDir, %A_Desktop%\test stuff\ahk\updates   ;sets directory to download file
UrlDownloadToFile, %FileURL%, %filename%        ;downloads file with designated name 

MsgBox Download finished! 

;----------------------------------- UNZIP SECTION -------------------------------------------------------------------------------------------------------------

sZip := A_Desktop . "\test stuff\ahk\updates\update.zip" ;directory and name of file being unzipped
sUnz := A_Desktop . "\test stuff\ahk\updates\"   ;place to unzip file

Unz(sZip, sUnz) ;call to unzip function 

MsgBox Unzipped!

;----------------------------------- CHECK PATCH INFO -------------------------------------------------------------------------------------------------------------

FileReadLine, version, %A_Desktop%\test stuff\ahk\updates\derp-master\PatchInfo.ahk, 1 ;patch file contains version at first line of file
FileReadLine, vcontrol, %A_ScriptDir%\vcontrol.txt, 1 ;text file containing current version 

MsgBox %version% : %vcontrol%


if (version != vcontrol) ;checks if versions are same or different
{
	FileDelete, %A_ScriptDir%\vcontrol.txt
	FileAppend, %version%, %A_ScriptDir%\vcontrol.txt
	Run, %A_Desktop%\test stuff\ahk\updates\derp-master\PatchInfo.ahk ;runs patch control if it is a new version 
}

Else
{
	FileRemoveDir, %A_Desktop%\test stuff\ahk\updates, 1 ;deletes the update if same version 
	FileCreateDir, %A_Desktop%\test stuff\ahk\updates ;recreates empty update directory 
	MsgBox, Files deleted 
}

ExitApp

	;if up to date 





	;if new patch available
