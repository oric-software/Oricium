@echo off

md RELEASE


SET ORICUTRON="..\..\..\oricutron\"

SET ORIGIN_PATH=%CD%

copy /b BUILD\oricium.dsk RELEASE\Oricium12.dsk
copy /b loader.tap+screen.tap+BUILD\oricium.tap RELEASE\Oricium12.tap
%osdk%/bin/tap2cd -c BUILD\Oricium.tap RELEASE\Oricium12.wav




call osdk_config_orix.bat
call osdk_build.bat

md %ORICUTRON%\usbdrive\usr\share\oricium\



IF "%1"=="NORUN" GOTO End
md %ORICUTRON%\usbdrive\usr\share\oricium\

copy RELEASE\orix\usr\share\oricium\screen.hrs  %ORICUTRON%\usbdrive\usr\share\oricium\
copy build\final.out RELEASE\orix\usr\bin\oricium

copy RELEASE\orix\usr\bin\oricium %ORICUTRON%\usbdrive\usr\bin\oricium

cd %ORICUTRON%
OricutronV4 -mt -d teledisks\stratsed.dsk
cd %ORIGIN_PATH%
:End
