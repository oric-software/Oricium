@echo off

md RELEASE


SET ORICUTRON="..\..\..\oricutron\"

SET ORIGIN_PATH=%CD%



rem %osdk%/bin/xa -c tilemap.s data.s  common.s hero.s scripts.s
rem generator.s keyboard.s 
rem  stars.s engine.s radar.s sprites.s enemies.s items.s sndeng.s sfx.s auxiliar.s level.s panel.s strings.s songs.s tileset.s 

call osdk_build.bat


md ..\..\..\oricutron\usbdrive\usr\share\oricium\

IF "%1"=="NORUN" GOTO End
md ..\..\..\oricutron\usbdrive\usr\share\oricium\
copy RELEASE\orix\usr\share\oricium\screen.hrs ..\..\..\oricutron\usbdrive\usr\share\oricium\

%OSDK%\bin\xa.exe orix_header.s -o build\orix_header.o

copy build\orix_header.o /b + build\final.out RELEASE\orix\usr\bin\oricium



copy data\altchar.bin ..\..\..\oricutron\usbdrive\usr\share\oricium\

copy RELEASE\orix\usr\bin\oricium %ORICUTRON%\usbdrive\bin\oricium
rem copy Release\orix\usr\share\im\title.hrs ..\..\..\oricutron\usbdrive\usr\share\im\

cd %ORICUTRON%
OricutronV4 -mt --symbols %ORIGIN_PATH%\build\symbols
rem Oricutron_ch376V3 -mt -d teledisks\stratsed.dsk
cd %ORIGIN_PATH%
:End



