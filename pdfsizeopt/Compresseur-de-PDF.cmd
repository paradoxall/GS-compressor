@echo off

IF "%~1" == "" GOTO pasDeParametres

del "%temp%\%~nx1 "/f /q
xcopy %1 %temp% /y /q
cls

for %%F in ("%~1") do  set originFilename=%%~nxF
for %%F in ("%~1") do  set originFilepath=%%~dpF

for %%F in ("%temp%\%originFilename%") do  set Filename=%%~snxF
for %%F in ("%temp%\%originFilename%") do  set Filepath=%%~sdpF

echo Veuillez selectionner votre niveau de compression. v.0.3.1.dev
echo. 
echo 0:    Annuler
echo 1:    screen (72 dpi images)
echo 2:    ebook (150 dpi images)
echo 3:    printer (300 dpi images)
echo 4:    prepress (300 dpi images, color preserving)
echo None: default (variable dpi)
echo.
echo. 

::Pour le debug
@REM echo Filename     : %originFilename%
@REM echo Filename 8.3 : %Filename%
@REM echo Filepath     : %originFilepath%
@REM echo.
@REM echo  in  : %originFilepath%%originFilename%
@REM echo temp : %temp%\%originFilename%
@REM echo out  : %originFilepath%%Filename:~0,-4%-[ screen, ebook, printer, prepress, none ]-compressed.pdf
@REM echo.
@REM set outputFile=%Filename:~0,-4%-[ lvl ]-compressed.pdf
@REM echo cmd line : C:\pdfsizeopt\GS\gswin64c -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=%outputFile% %Filepath%%Filename%

echo. 
SET /P choix="Votre choix (0, 1, 2, 3, 4): "

2>NUL CALL :CASE_%choix% # jump to :CASE_0, :CASE_1, :CASE_2, :CASE_3, :CASE_4.
IF ERRORLEVEL 1 CALL :DEFAULT_CASE # If label doesn't exist

  :CASE_0
    GOTO END_CASE
  :CASE_1
    set outputFile=%Filename:~0,-4%-screen-compressed.pdf
    C:\pdfsizeopt\GS\gswin64c -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=%outputFile% %Filepath%%Filename%
    GOTO END_CASE
  :CASE_2
    set outputFile=%Filename:~0,-4%-ebook-compressed.pdf
    C:\pdfsizeopt\GS\gswin64c -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/ebook -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=%outputFile% %Filepath%%Filename%
    GOTO END_CASE
  :CASE_3
    set outputFile=%Filename:~0,-4%-printer-compressed.pdf
    C:\pdfsizeopt\GS\gswin64c -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/printer -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=%outputFile% %Filepath%%Filename%
    GOTO END_CASE
  :CASE_4
    set outputFile=%Filename:~0,-4%-prepress-compressed.pdf
    C:\pdfsizeopt\GS\gswin64c -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/prepress -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=%outputFile% %Filepath%%Filename%
    GOTO END_CASE
  :DEFAULT_CASE
    set outputFile=%Filename:~0,-4%-compressed.pdf
    C:\pdfsizeopt\GS\gswin64c -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/default -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=%outputFile% %Filepath%%Filename%
    GOTO END_CASE
  :END_CASE
    del "%temp%\%originFilename% "/f /q
    exit

:pasDeParametres
  echo ** Erreur ** Veuillez faire glisser un PDF sur le Compresseur pour l'optimiser.
  echo.
  pause.nul
 