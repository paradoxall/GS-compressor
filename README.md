# GS-compressor
Windows contectual menu integration of a ghostshell PDF compressor


##instruction##

use the installer CDP.exe


##what it does##

copy pdfsizeopt the drive c (c:\pdfsizeopt)


modify or create 

[Registry]

[HKEY_CLASSES_ROOT\SystemFileAssociations\.pdf\shell\compress]
"Icon"="\"C:\\pdfsizeopt\\Compresseur-de-PDF.ico\""
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem]
"NtfsDisable8dot3NameCreation"=dword:00000000
[HKEY_CLASSES_ROOT\SystemFileAssociations\.pdf\shell\compress]
@="Compresser votre PDF ici..."
[HKEY_CLASSES_ROOT\SystemFileAssociations\.pdf\shell\compress\command]
@="\"C:\\pdfsizeopt\\Compresseur-de-PDF.cmd\" \"%1\""

Create a shortcut on the desktop where you can drag and drop pdf on to optimize them.

Create .pdf file contextual menu for CDP

